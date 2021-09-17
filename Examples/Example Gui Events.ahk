#Include %A_ScriptDir%\..\GridGUI.ahk

myGui := new GridGUI("Gui Events", "resize")
Menu, SomeMenu, Standard

TxtActive :=	myGui.Add(1, 1, "Text", "Center", "Non Active")
Lbox :=			myGui.Add(1, 2, "ListBox", , , 1, 1, 1, 1)

myGui.RegisterDropTarget(Lbox, Func("DroppedFiles").Bind(Lbox))

myGui.GuiClose := GridGUI.ExitApp
myGui.GuiSize := Func("Size")
myGui.GuiMoved := Func("Moved")
myGui.GuiActivate := Func("Activated").Bind(TxtActive)
myGui.GuiContextMenu := Func("Menu")

myGui.AutoSize()
myGui.MinSize()
myGui.Show()
return

Size(pos) {
	ToolTip, % pos.ToStr()
}

Moved(pos) {
	ToolTip, % pos.ToStr()
}

Activated(ctrl, bool) {
	ctrl.GuiControl("", bool ? "Active" : "Non Active")
}

DroppedFiles(ctrl, paths) {
	ctrl.GuiControl("", "|" Join("|", paths) "|")
}

Menu(pos) {
	Menu, SomeMenu, Show, % pos.x, % pos.y
}

Join(sep, params) {
	for index, param in params {
		str .= param sep
	}
	return SubStr(str, 1, -StrLen(sep))
}