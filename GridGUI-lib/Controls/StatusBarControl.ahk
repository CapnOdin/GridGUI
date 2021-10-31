
Class StatusBarControl Extends GridGUI.ArbitraryControl {
	__New(guiHwnd, options := "", text := "") {
		local Base
		Base.__New(guiHwnd, "StatusBar", options, text)
		this.gui := new GridGUI.GUI(, , guiHwnd)
	}
	
	; Displays NewText in the specified part of the status bar.
	SetText(NewText, PartNumber := 1, Style := 0) {
		local prev, bool
		prev := this.__SetDefaultGui()
		bool := SB_SetText(NewText, PartNumber, Style)
		this.__ResetDefaultGui(prev)
		return bool
	}
	
	; Divides the bar into multiple sections according to the specified widths (in pixels).
	SetParts(Widths*) {
		local prev, bool
		prev := this.__SetDefaultGui()
		bool := SB_SetParts(Widths*)
		this.__ResetDefaultGui(prev)
		return bool
	}
	
	; Displays a small icon to the left of the text in the specified part.
	SetIcon(Filename, IconNumber := 1, PartNumber := 1) {
		local prev, hIcon
		prev := this.__SetDefaultGui()
		hIcon := SB_SetIcon(Filename, IconNumber, PartNumber)
		this.__ResetDefaultGui(prev)
		return hIcon
	}
	
	__SetDefaultGui() {
		local gui
		gui := this.gui.hwnd
		if(A_DefaultGui != this.gui.hwnd) {
			gui := A_DefaultGui
			this.gui.Default()
		}
		return gui
	}
	
	__ResetDefaultGui(previous) {
		if(A_DefaultGui != previous) {
			Gui, % previous ":Default"
		}
	}
}
