﻿#Include %A_LineFile%\..\Window.ahk
#Include %A_LineFile%\..\BoundFunc.ahk

Class GUI Extends GridGUI.Window {
	__New(title := "", options := "", hwnd := "") {
		this.title := title
		if(!hwnd) {
			this.__init()
			Gui, New, % "+HwndHwnd " options, % this.title
			this.__CheckOptions(options)
			Base.__New(Hwnd, [new GridGUI.GuiCallback(GridGUI.Window.WM_SIZE, new GridGUI.BoundFunc("GridGUI.GUI.__GuiSize", this)), new GridGUI.GuiCallback(GridGUI.Window.WM_MOVE, new GridGUI.BoundFunc("GridGUI.GUI.__GuiMoved", this))])
		} else {
			Base.__New(Hwnd)
		}
	}
	
	__init() {
		this.DPIScale := true
		this.pos := new GridGUI.Position(0, 0)
	}
	
	Add(controlType, options := "", text := "") {
		return new GridGUI.ArbitraryControl(this.hwnd, controlType, options, text)
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
		GuiControlGet, CtrlClass, % this.hwnd ":Focus"
		GuiControlGet, focused, % this.hwnd ":Hwnd", % CtrlClass
		Return focused
	}
	
	ListView(hwnd) {
		prev := A_DefaultListView
		Gui, % this.hwnd ":ListView", % hwnd
		return prev
	}
	
	TreeView(hwnd) {
		prev := A_DefaultTreeView
		Gui, % this.hwnd ":TreeView", % hwnd
		return prev
	}
	
	GuiSize(pos) {
		pos := this.__DPIScale(pos, false)
		this.pos.w := pos.w
		this.pos.h := pos.h
	}
	
	GuiMoved(pos) {
		this.pos.x := pos.x
		this.pos.y := pos.y
	}
	
	__DPIScale(pos, enlarge := true) {
		scaledPos := pos.Copy()
		if(this.DPIScale) {
			scale := A_ScreenDPI / 96
			if(enlarge) {
				scaledPos.w := Round(scaledPos.w * scale)
				scaledPos.h := Round(scaledPos.h * scale)
			} else {
				scaledPos.w := Round(scaledPos.w / scale)
				scaledPos.h := Round(scaledPos.h / scale)
			}
		}
		return scaledPos
	}
	
	__CheckOptions(options) {
		this.DPIScale := !(options ~= "i)-DPIScale")
	}
	
	__GuiSize(wParam, lParam, msg, hwnd) {
		if(this.hwnd = hwnd) {
			if(this.resizeTimer) {
				timer := this.resizeTimer
				SetTimer, % timer, Off
			}
			timer := this.resizeTimer := new GridGUI.BoundFunc(this.__Class ".GuiSize", this, new GridGUI.Position(0, 0, lParam & 0xffff, lParam >> 16))
			SetTimer, % timer, -50
		}
	}
	
	__GuiMoved(wParam, lParam, msg, hwnd) {
		if(this.hwnd = hwnd) {
			if(this.movedTimer) {
				timer := this.movedTimer
				SetTimer, % timer, Off
			}
			timer := this.movedTimer := new GridGUI.BoundFunc(this.__Class ".GuiMoved", this, new GridGUI.Position(lParam & 0xffff, lParam >> 16))
			SetTimer, % timer, -50
		}
	}
}