#Include %A_LineFile%\..\Position.ahk

Class ControlClass {
	__New(hwnd) {
		this.hwnd := hwnd
	}
	
	ControlGetPos() {
		ControlGetPos, x, y, w, h, , % "ahk_id " this.hwnd
		return new GridGUI.Position(x, y, w, h)
	}
	
	Control(subCommand, value) {
		Control, % subCommand, % value, , % "ahk_id " this.hwnd
	}
	
	ControlGet(subCommand, value) {
		ControlGet, OutputVar, % subCommand, % value, , % "ahk_id " this.hwnd
		return OutputVar
	}
	
	ControlGetText() {
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
	
	ToStr(indent := "") {
		return indent "Hwnd`t:" this.hwnd
	}
}

Class GuiControlClass Extends GridGUI.ControlClass {
	__New(hwnd, type, options := "", callback := False) {
		Base.__New(hwnd)
		this.type := type
		this.callback := callback
		this.GuiControl("+g", ObjBindMethod(this, "__Callback"))
		this.vVar := this.GuiControlGet()
		this.__ParseOptions(options)
	}
	
	GuiControl(subCommand, value) {
		GuiControl, % SubCommand, % this.hwnd, % value
	}
	
	GuiControlGet(subCommand := "", value := "") {
		GuiControlGet, OutputVar, % SubCommand, % this.hwnd, % value
		return OutputVar
	}
	
	Options(options) {
		options := this.__ParseOptions(options)
		if(options) {
			GuiControl, % options, % this.hwnd
		}
	}
	
	Draw(pos) {
		this.GuiControl("MoveDraw", "x" pos.x " y" pos.y " w" pos.w " h" pos.h)
	}
	
	__Callback(arg*) {
		this.vVar := this.GuiControlGet()
		if(this.callback) {
			this.callback.Call(arg*)
		}
	}
	
	__ParseOptions(options) {
		if(RegExMatch(options, "Oi)\bw(\d+)\b", match)) {
			this.initialWidth := match[1]
		}
		if(RegExMatch(options, "Oi)\bh(\d+)\b", match)) {
			this.initialHeight := match[1]
		}
		if(RegExMatch(options, "Oi)\+?\bg(\w+)\b", match)) {
			this.callback := ObjBindMethod(this, "__glabel", match[1])
			options := RegExReplace(options, "Oi)\+?\bg(\w+)")
		}
		return options
	}
	
	__glabel(label) {
		Gosub, % label
	}
	
	ToStr(indent := "") {
		return indent "Hwnd`t:" this.hwnd "`n" indent "Type:`n" this.type
	}
}