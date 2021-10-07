#Include %A_LineFile%\..\Position.ahk
#Include %A_LineFile%\..\LOGFONT.ahk

Class ControlClass {
	Static WS_CLIPSIBLINGS := 0x4000000

	__New(hwnd) {
		this.hwnd := hwnd
	}
	
	__Init() {
		this.initialWidth :=		false
		this.initialWidthVal :=		false
		this.initialHeight :=		false
		this.initialHeightVal :=	false
	}
	
	ControlGetPos() {
		local x, y, w, h
		ControlGetPos, x, y, w, h, , % "ahk_id " this.hwnd
		return new GridGUI.Position(x, y, w, h)
	}
	
	Control(subCommand, value) {
		Control, % subCommand, % value, , % "ahk_id " this.hwnd
	}
	
	ControlGet(subCommand, value) {
		local OutputVar
		ControlGet, OutputVar, % subCommand, % value, , % "ahk_id " this.hwnd
		return OutputVar
	}
	
	ControlGetText() {
		local OutputVar
		ControlGetText, OutputVar, , % "ahk_id " this.hwnd
		return OutputVar
	}
	
	ControlSetText(NewText) {
		ControlSetText, , NewText,% "ahk_id " this.hwnd
	}
	
	ControlFocus() {
		ControlFocus, , % "ahk_id " this.hwnd
	}
	
	ControlSend(keys) {
		ControlSend, , % keys, % "ahk_id " this.hwnd
	}
	
	ControlClick(pos := "", WhichButton := "LEFT", ClickCount := 1, Options := "") {
		ControlClick, % pos ? "X" pos.x " Y" pos.y : "", % "ahk_id " this.hwnd, , % WhichButton, % ClickCount, % Options (pos ? " Pos" : "")
	}
	
	ControlMove(pos) {
		ControlMove, , % pos.x, % pos.y, % pos.w, % pos.h, % "ahk_id " this.hwnd
	}
	
	Options(options) {
		this.Control("Style", options)
	}
	
	__ParseOptions(options) {
		local match
		if(RegExMatch(options, "Oi)\bw(\d+)\b", match)) {
			this.initialWidth := true
			this.initialWidthVal := match[1]
		}
		if(RegExMatch(options, "Oi)\bh(\d+)\b", match)) {
			this.initialHeight := true
			this.initialHeightVal := match[1]
		}
		return options
	}
	
	ToStr(indent := "") {
		return indent "Hwnd`t:" this.hwnd
	}
}

Class GuiControlClass Extends GridGUI.ControlClass {
	__New(hwnd, type, options := "", callback := False, DPIScale := true) {
		local Base
		Base.__New(hwnd)
		this.__Init()
		this.type := type
		this.callback := callback
		this.DPIScale := DPIScale
		this.GuiControl("+g", ObjBindMethod(this, "__Callback"))
		this.vVar := this.GuiControlGet()
		this.__ParseOptions(options)
		this.guiHwnd := DllCall("GetAncestor", "Ptr", this.hwnd, "UInt", 1, "Ptr")
		this.logfont := new GridGUI.LOGFONT(this.hwnd, guiHwnd)
	}
	
	GuiControl(subCommand, value) {
		GuiControl, % SubCommand, % this.hwnd, % value
	}
	
	GuiControlGet(subCommand := "", value := "") {
		local OutputVar
		GuiControlGet, OutputVar, % SubCommand, % this.hwnd, % value
		return OutputVar
	}
	
	Options(options) {
		options := this.__ParseOptions(options)
		if(options) {
			GuiControl, % options, % this.hwnd
		}
	}
	
	Font(Options := "", FontName := "") {
		local dim
		
		GuiControl, % this.guiHwnd ":Font", % this.hwnd
		logfont := new GridGUI.LOGFONT(this.hwnd, guiHwnd)
		
		Gui, % this.guiHwnd ":Font", % "norm " this.logfont.ToOptions(), % this.logfont.FaceName
		Gui, % this.guiHwnd ":Font", % Options, % FontName
		GuiControl, % this.guiHwnd ":Font", % this.hwnd
		this.logfont.UpdateFont()
		
		dim := this.logfont.GetDimensionsInPixels(this.ControlGetText())
		if(this.DPIScale) {
			dim := GridGUI.Util.DPIScale(dim, false)
		}
		Base.__ParseOptions("w" dim.w " h" dim.h)
		
		Gui, % this.guiHwnd ":Font", %  "norm " logfont.ToOptions(), % logfont.FaceName
	}
	
	Draw(pos) {
		this.GuiControl("MoveDraw", "x" pos.x " y" pos.y " w" pos.w " h" pos.h)
	}
	
	ReDraw() {
		local style
		static RDW_ALLCHILDREN:=0x80, RDW_ERASE:=0x4, RDW_ERASENOW:=0x200, RDW_FRAME:=0x400
			, RDW_INTERNALPAINT:=0x2, RDW_INVALIDATE:=0x1, RDW_NOCHILDREN:=0x40, RDW_NOERASE:=0x20
			, RDW_NOFRAME:=0x800, RDW_NOINTERNALPAINT:=0x10, RDW_UPDATENOW:=0x100, RDW_VALIDATE:=0x8
		
		style := RDW_INVALIDATE | RDW_ERASE  | RDW_FRAME | RDW_ERASENOW | RDW_UPDATENOW | RDW_ALLCHILDREN
		return DllCall("RedrawWindow", "UInt", this.hwnd, "UInt", 0, "UInt", 0, "UInt", style)
	}
	
	ZOrder(top := True, topmost := False) {
		Static HWND_TOP := 0, HWND_BOTTOM := 1, HWND_TOPMOST := -1
			, SWP_NOMOVE := 0x0002, SWP_NOSIZE := 0x0001, SWP_NOCOPYBITS := 0x0100, SWP_SHOWWINDOW := 0x0040, SWP_NOSENDCHANGING := 0x0400, SWP_NOREDRAW := 0x0008
		DllCall("SetWindowPos", "UInt", this.hwnd, "UInt", topmost ? HWND_TOPMOST : (top ? HWND_TOP : HWND_BOTTOM), "UInt", 0, "UInt", 0, "UInt", 0, "UInt", 0, "UInt", SWP_NOMOVE | SWP_NOSIZE)
	}
	
	__ParseOptions(options) {
		local Base, match
		options := Base.__ParseOptions(options)
		if(RegExMatch(options, "Oi)\+?\bg(\w+)\b", match)) {
			this.callback := ObjBindMethod(this, "__glabel", match[1])
			options := RegExReplace(options, "Oi)\+?\bg(\w+)")
		}
		return options
	}
	
	__Callback(arg*) {
		this.vVar := this.GuiControlGet()
		if(this._Callback) {
			this._Callback.Call(arg*)
		}
		if(this.callback) {
			this.callback.Call(arg*)
		}
	}
	
	__glabel(label) {
		Gosub, % label
	}
	
	ToStr(indent := "") {
		return indent "Hwnd`t:" this.hwnd "`n" indent "Type:`n" this.type
	}
}