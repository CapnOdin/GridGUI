
#Include %A_LineFile%\..\Position.ahk

Class Window {
	Static		WM_SIZE			:= 0x0005
			,	WM_MOVE			:= 0x0003
			,	WM_ACTIVATE		:= 0x0006
			,	WM_PAINT		:= 0x000F
			,	WM_CLOSE		:= 0x0010
			;,	WM_SHOWWINDOW	:= 0x0018
			,	WM_CONTEXTMENU	:= 0x007B
			,	WM_SYSCOMMAND	:= 0x0112
			,	WM_DROPFILES	:= 0x0233


	__New(hwnd, callbacks := False) {
		this.hwnd := hwnd
		this.callbacks := callbacks
		this.__Setup()
	}
	
	__Setup() {
		local i, callback
		if(IsObject(this.callbacks)) {
			for i, callback in this.callbacks {
				OnMessage(callback.msgNum, callback.function)
			}
		}
	}
	
	WinShow() {
		WinShow, % "ahk_id " this.hwnd
	}
	
	WinHide() {
		WinHide, % "ahk_id " this.hwnd
	}
	
	WinGetPos() {
		local x, y, w, h
		WinGetPos, x, y, w, h, % "ahk_id " this.hwnd
		return new GridGUI.Position(x, y, w, h)
	}
	
	WinMove(x := "", y := "", w := "", h := "") {
		WinMove, % "ahk_id " this.hwnd, , % x, % y, % w , % h
	}
	
	WinExist() {
		return WinExist("ahk_id " this.hwnd)
	}
	
	WinActivate() {
		WinActivate, % "ahk_id " this.hwnd
	}
	
	WinActive() {
		return WinActive("ahk_id " this.hwnd)
	}
	
	WinGet(SubCommand) {
		local OutputVar
		WinGet, OutputVar, % SubCommand, % "ahk_id " this.hwnd
		return OutputVar
	}
	
	WinSet(SubCommand, Value) {
		local pre := this.__DetectHidden()
		WinSet, % SubCommand, % Value, % "ahk_id " this.hwnd
		DetectHiddenWindows, % pre
	}
	
	ControlGetFocus() {
		local CtrlHwnd := "", CtrlClass := ""
		ControlGetFocus, CtrlClass, % "ahk_id " this.hwnd
		if(CtrlClass) {
			ControlGet, CtrlHwnd, Hwnd, , % CtrlClass, % "ahk_id " this.hwnd
		}
		return CtrlHwnd
	}
	
	ToStr(indent := "") {
		return indent "Hwnd:`t" this.hwnd "`n" indent "Pos:`n" this.WinGetPos().ToStr("`t")
	}
	
	__DetectHidden() {
		local detectState := A_DetectHiddenWindows
		DetectHiddenWindows, On
		return detectState
	}
}

Class GuiCallback {
	__New(msgNum, function) {
		this.msgNum := msgNum
		this.function := IsObject(function) ? function : Func(function)
	}
	
	ToStr(indent := "") {
		return indent "MsgNum`t:" this.msgNum "`n" indent "Function:`n" this.function.ToStr("`t")
	}
}
