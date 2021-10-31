
Class ArbitraryControl Extends GridGUI.GuiControlClass {
	__New(guiHwnd, type, options := "", text := "", DPIScale := true) {
		local Base
		Gui, % guiHwnd ":Add", % type, % "+HwndHwnd " options, % text
		Base.__New(Hwnd, type, options, DPIScale)
	}
}
