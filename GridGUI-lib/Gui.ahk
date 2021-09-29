#Include %A_LineFile%\..\Window.ahk
#Include %A_LineFile%\..\BoundFunc.ahk

Class GUI Extends GridGUI.Window {
	__New(title := "", options := "", hwnd := "") {
		local Base
		this.title := title
		if(!hwnd) {
			Gui, New, % "+HwndHwnd " options, % this.title
			this.__CheckOptions(options)
			Base.__New(Hwnd, [new GridGUI.GuiCallback(GridGUI.Window.WM_SIZE, new GridGUI.BoundFunc("GridGUI.GUI.__GuiSize", this))
							, new GridGUI.GuiCallback(GridGUI.Window.WM_MOVE, new GridGUI.BoundFunc("GridGUI.GUI.__GuiMoved", this))
							, new GridGUI.GuiCallback(GridGUI.Window.WM_ACTIVATE, new GridGUI.BoundFunc("GridGUI.GUI.__GuiActivate", this))
							, new GridGUI.GuiCallback(GridGUI.Window.WM_CONTEXTMENU, new GridGUI.BoundFunc("GridGUI.GUI.__GuiContextMenu", this))
							, new GridGUI.GuiCallback(GridGUI.Window.WM_SYSCOMMAND, new GridGUI.BoundFunc("GridGUI.GUI.__SysCommand", this))
							, new GridGUI.GuiCallback(GridGUI.Window.WM_DROPFILES, new GridGUI.BoundFunc("GridGUI.GUI.__GuiDropFiles", this))
							, new GridGUI.GuiCallback(GridGUI.Window.WM_PAINT, new GridGUI.BoundFunc("GridGUI.GUI.__OnPaint", this))])
			this.__GuiInit()
		} else {
			Base.__New(Hwnd)
		}
	}
	
	__GuiInit() {
		this.DPIScale := true
		this.pos := new GridGUI.Position(0, 0)
		this.GuiSize		:= false
		this.GuiMoved		:= false
		this.GuiClose		:= false
		this.GuiActivate	:= false
		this.GuiContextMenu	:= false
		this.DropTarges := {}
		this.ForgroundCtrls := []
		this.BackgroundCtrls := []
	}
	
	Add(controlType, options := "", text := "") {
		local ctrl
		ctrl := new GridGUI.ArbitraryControl(this.hwnd, controlType, options, text)
		this.__OnAdd()
		return ctrl
	}
	
	__OnAdd() {
		this.__RaiseForgoundCtrls()
		this.__LowerBackgoundCtrls()
	}
	
	Show(options := "AutoSize") {
		Gui, % this.hwnd ":Show", % options
	}
	
	Submit(NoHide := False) {
		Gui, % this.hwnd ":Submit", % NoHide ? "NoHide" : ""
	}
	
	Hide() {
		Gui, % this.hwnd ":Hide"
	}
	
	Destroy() {
		Gui, % this.hwnd ":Destroy"
	}
	
	Font(Options := "", FontName := "") {
		Gui, % this.hwnd ":Font", % Options, % FontName
	}
	
	Color(WindowColor := "", ControlColor := "") {
		Gui, % this.hwnd ":Color", % WindowColor, % ControlColor
	}
	
	Margin(x := "", y := "") {
		Gui, % this.hwnd ":Margin", % x, % y
	}
	
	Options(options) {
		Gui, % this.hwnd ": " options
	}
	
	Menu(MenuName := "") {
		Gui, % this.hwnd ":Menu", % MenuName
	}
	
	Minimize() {
		Gui, % this.hwnd ":Minimize"
	}
	
	Maximize() {
		Gui, % this.hwnd ":Maximize"
	}
	
	Restore() {
		Gui, % this.hwnd ":Restore"
	}
	
	Flash(Off := false) {
		Gui, % this.hwnd ":Flash", % Off ? "Off" : ""
	}
	
	Default() {
		Gui, % this.hwnd ":Default"
	}
	
	MinSize(x := "", y := "") {
		Gui, % this.hwnd ": +MinSize" x (y != "" ? "x" y: "")
	}
	
	ControlGetFocus() {
		local CtrlClass, focused
		GuiControlGet, CtrlClass, % this.hwnd ":Focus"
		GuiControlGet, focused, % this.hwnd ":Hwnd", % CtrlClass
		Return focused
	}
	
	ListView(hwnd) {
		local prev
		prev := A_DefaultListView
		Gui, % this.hwnd ":ListView", % hwnd
		return prev
	}
	
	TreeView(hwnd) {
		local prev
		prev := A_DefaultTreeView
		Gui, % this.hwnd ":TreeView", % hwnd
		return prev
	}
	
	RegisterDropTarget(ctrl, Callback) {
		DllCall("shell32\DragAcceptFiles", "Ptr", ctrl.hwnd, "Int", 1)
		this.DropTarges[ctrl.hwnd] := Callback
	}
	
	RegisterForground(ctrl) {
		ctrl.ZOrder(True)
		this.ForgroundCtrls.Push(ctrl)
	}
	
	RegisterBackground(ctrl) {
		ctrl.Options(GridGUI.Background)
		ctrl.ZOrder(False)
		this.BackgroundCtrls.Push(ctrl)
	}
	
	__ReDrawForgoundCtrls() {
		local i, ctrl
		for i, ctrl in this.ForgroundCtrls {
			ctrl.ReDraw()
		}
	}
	
	__RaiseForgoundCtrls() {
		local i, ctrl
		for i, ctrl in this.ForgroundCtrls {
			ctrl.ZOrder(True)
		}
	}
	
	__LowerBackgoundCtrls() {
		local i, ctrl
		for i, ctrl in this.BackgroundCtrls {
			ctrl.ZOrder(False)
		}
	}
	
	_GuiSize(pos, resizeEvent := 0) {
		pos := this.__DPIScale(pos, false)
		this.pos.w := pos.w
		this.pos.h := pos.h
		if(this.GuiSize) {
			this.GuiSize.Call(this.pos, resizeEvent)
		}
	}
	
	_GuiMoved(pos) {
		this.pos.x := pos.x
		this.pos.y := pos.y
		if(this.GuiMoved) {
			this.GuiMoved.Call(this.pos)
		}
	}
	
	__DPIScale(pos, enlarge := true) {
		local scaledPos
		scaledPos := pos.Copy()
		if(this.DPIScale) {
			scaledPos := GridGUI.Util.DPIScale(scaledPos, enlarge)
		}
		return scaledPos
	}
	
	__CheckOptions(options) {
		this.DPIScale := !(options ~= "i)-DPIScale")
	}
	
	__OnPaint(wParam, lParam, msg, hwnd) {
		local timer
		if(this.hwnd = hwnd) {
			if(this.ForgroundCtrls.Count()) {
				if(this.reDrawTimer) {
					timer := this.reDrawTimer
					SetTimer, % timer, Off
				}
				timer := this.reDrawTimer := new GridGUI.BoundFunc("GridGUI.GUI.__ReDrawForgoundCtrls", this)
				SetTimer, % timer, -10
			}
		}
	}
	
	__GuiActivate(wParam, lParam, msg, hwnd) {
		if(this.hwnd = hwnd) {
			if(this.GuiActivate) {
				this.GuiActivate.Call(wParam & 0xffff)
			}
		}
	}
	
	__GuiContextMenu(wParam, lParam, msg, hwnd) {
		local pos
		if(this.hwnd = hwnd) {
			if(this.GuiContextMenu) {
				pos := this.WinGetPos()
				this.GuiContextMenu.Call(new GridGUI.Position((lParam & 0xffff) - pos.x, (lParam >> 16) - pos.y), wParam)
			}
		}
	}
	
	__GuiDropFiles(hDrop, lParam, msg, hwnd) {
		local num_of_files, files, len
		Static DragQueryFile := "Shell32.dll\DragQueryFile" (A_IsUnicode ? "W" : "A")
		num_of_files := DllCall(DragQueryFile, "Ptr", hDrop, "UInt", -1, "Ptr", 0, "UInt", 0, "UInt")
		files := []
		loop % num_of_files {
			len := DllCall(DragQueryFile, "Ptr", hDrop, "UInt", A_Index - 1, "Ptr", 0, "UInt", 0, "UInt") + 1
			VarSetCapacity(buffer, len * (A_IsUnicode ? 2 : 1), 0)
			DllCall(DragQueryFile, "Ptr", hDrop, "UInt", A_Index - 1, "Str", buffer, "UInt", len, "UInt")
			files.Push(buffer)
		}
		DllCall("Shell32.dll\DragFinish", "Ptr", hDrop)
		this.DropTarges[hwnd].Call(files)
	}
	
	__SysCommand(wParam, lParam, msg, hwnd) {
		static SC_CLOSE := 0xf060
		if(this.hwnd = hwnd) {
			if(wParam = SC_CLOSE) {
				if(this.GuiClose) {
					this.GuiClose.Call()
				}
			}
		}
	}
	
	__GuiSize(wParam, lParam, msg, hwnd) {
		local timer
		if(this.hwnd = hwnd) {
			if(this.resizeTimer) {
				timer := this.resizeTimer
				SetTimer, % timer, Off
			}
			timer := this.resizeTimer := new GridGUI.BoundFunc(this.__Class "._GuiSize", this, new GridGUI.Position(0, 0, lParam & 0xffff, lParam >> 16), wParam)
			SetTimer, % timer, -50
		}
	}
	
	__GuiMoved(wParam, lParam, msg, hwnd) {
		local timer
		if(this.hwnd = hwnd) {
			if(this.movedTimer) {
				timer := this.movedTimer
				SetTimer, % timer, Off
			}
			timer := this.movedTimer := new GridGUI.BoundFunc(this.__Class "._GuiMoved", this, new GridGUI.Position(lParam & 0xffff, lParam >> 16))
			SetTimer, % timer, -50
		}
	}
}