
#Include %A_ScriptDir%\..\GridGUI.ahk

myGui := new GridGUI("Grid Test", "resize")
myGui.Add("1-3", 1, "Edit", , , 1, , 1)
myGui.GetNewestCellGroup().borderX := 0
myGui.Add(1, 2, "Button", , "Button")
myGui.GetNewestCellGroup().borderX := 0
myGui.Add(2, 2, "Edit", , , 1, , 1)
myGui.GetNewestCellGroup().borderX := 0
ctrl := myGui.Add(3, "2-3", "ActiveX", "w113 h43", "shell explorer")
oWB := ctrl.vVar
oWB.Navigate("about:<!DOCTYPE HTML><html><body style=""{margin:0;}""><img src=""https://i.imgur.com/FlGrIY3.gif""></body></html>")
oWB.document.body.style.overflow := "hidden"
myGui.Add(1, 3, "Button", , "Button")
myGui.GetNewestCellGroup().borderX := 0
myGui.Add(2, 3, "Button", , "Button Button")
myGui.GetNewestCellGroup().borderX := 0
myGui.Add("1-3", 4, "Button", , "Button", 1, , 1)

myGui.GetCellGroup(ctrl).borderX := 0
for i, c in myGui.GetCellGroupsAt(new GridGUI.Position(1, 4)) {
	c.borderX := 0
}

for i, c in myGui.grid.cells {
	c.ctrl.callback := ObjBindMethod(c, "ToolTip")
}

myGui.AutoSize()
myGui.MinSize()
myGui.Show()
return

GuiClose:
	ExitApp
