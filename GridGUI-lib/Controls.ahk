#Include %A_LineFile%\..\Control.ahk

Class ArbitraryControl Extends GuiControlClass {
	__New(guiHwnd, type, options := "", text := "") {
		Gui, % guiHwnd ":Add", % type, % "+HwndHwnd " options, % text
		Base.__New(Hwnd, type, options)
	}
}

Class WindowControl Extends ControlClass {
	__New(guiHwnd, hwnd, options := "") {
		this.window := new Window(hwnd)
		this.hwnd := hwnd
		this.type := "Window"
		this.guiHwnd := guiHwnd
		this.__SetUpWindow()
	}
	
	__SetUpWindow() {
		; Styles we want to remove from the window:
		static		WS_POPUP := 0x80000000
				,	WS_CAPTION := 0xC00000
				,	WS_THICKFRAME := 0x40000
				,	WS_EX_CLIENTEDGE := 0x200
		; Styles we want to add to the window:
				,	WS_CHILD := 0x40000000
		DetectHiddenWindows, On
		; Apply necessary style changes.
		this.window.WinSet("Style", "-" (WS_POPUP|WS_CAPTION|WS_THICKFRAME))
		this.window.WinSet("Style", "+" WS_CHILD)
		this.window.WinSet("ExStyle", "-" WS_EX_CLIENTEDGE)

		; Put the window into the Gui.
		DllCall("SetParent", "uint", this.hwnd, "uint", this.guiHwnd)
		
		WM_PARENTNOTIFY := 0x0210
		OnMessage(WM_PARENTNOTIFY, new BoundFunc("WindowControl.__CheckIfClicked", this))
	}
	
	Control(subCommand, value) {
		MsgBox, % "Not Inplimented"
	}
	
	ControlFocus() {
		DllCall("SetFocus", "uint", this.hwnd)
	}
	
	ControlGetPos() {
		hwndDesktop := WinExist("Program Manager ahk_class Progman")
		VarSetCapacity(ConsoleRect, 16)
		DllCall("GetWindowRect", "uint", this.hwnd, "uint", &ConsoleRect)
		DllCall("MapWindowPoints", "uint", hwndDesktop, "uint", this.guiHwnd, "uint", &ConsoleRect, "uint", 2)
		
		x := NumGet(ConsoleRect, 0, "UInt")
		y := NumGet(ConsoleRect, 4, "UInt")
		w := NumGet(ConsoleRect, 8, "UInt")
		h := NumGet(ConsoleRect, 12, "UInt")
		return new Position(x, y, w, h)
	}
	
	__CheckIfClicked(wParam, lParam, msg, hwnd) {
		static WM_LBUTTONDOWN := 0x0201
		if(wParam & 0xffff = WM_LBUTTONDOWN) {
			click_pos := new Position(lParam & 0xffff, lParam >> 16)
			if(this.ControlGetPos().Contains(click_pos)) {
				this.ControlFocus()
			}
		}
	}
	
	ControlMove(pos) {
		; Flags for SetWindowPos:
		static		SWP_NOACTIVATE := 0x10
				,	SWP_SHOWWINDOW := 0x40
				,	SWP_NOSENDCHANGING := 0x400
		DllCall("SetWindowPos", "uint", this.hwnd, "uint", 0
			, "int", pos.x, "int", pos.y, "int", pos.w, "int", pos.h
			, "uint", SWP_NOACTIVATE|SWP_SHOWWINDOW|SWP_NOSENDCHANGING)
	}
	
	Draw(pos) {
		this.ControlMove(pos)
	}
}
