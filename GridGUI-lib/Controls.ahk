﻿
#Include %A_LineFile%\..\Position.ahk

Class ControlClass {
	__New(hwnd, type, callback := False) {
		this.hwnd := hwnd
		this.type := type
		this.callback := callback
		this.GuiControl("+g", ObjBindMethod(this, "__Callback"))
		this.vVar := this.GuiControlGet()
	}
	
	GuiControl(subCommand, value) {
		GuiControl, % SubCommand, % this.hwnd, % value
	}
	
	GuiControlGet(subCommand := "", value := "") {
		GuiControlGet, OutputVar, % SubCommand, % this.hwnd, % value
		return OutputVar
	}
	
	ControlGetPos() {
		ControlGetPos, x, y, w, h, , % "ahk_id " this.hwnd
		return new Position(x, y, w, h)
	}
	
	Control(subCommand, value) {
		Control, % subCommand, % value, , % "ahk_id " this.hwnd
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
	
	ToStr(indent := "") {
		return indent "Hwnd`t:" this.hwnd "`n" indent "Type:`n" this.type
	}
}

Class ArbitraryControl Extends ControlClass {
	__New(guiHwnd, type, options := "", text := "") {
		Gui, % guiHwnd ":Add", % type, % "+HwndHwnd " options, % text
		Base.__New(Hwnd, type)
	}
}

Class ButtonControl Extends ControlClass {
	__New(guiHwnd, options := "", text := "") {
		Gui, % guiHwnd ":Add", Button, % "+HwndHwnd " options, % text
		Base.__New(Hwnd, "Button")
	}
}

Class EditControl Extends ControlClass {
	__New(guiHwnd, options := "", text := "") {
		Gui, % guiHwnd ":Add", Edit, % "+HwndHwnd " options, % text
		Base.__New(Hwnd, "Edit")
	}
}