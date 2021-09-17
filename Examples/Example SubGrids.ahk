
#Include %A_ScriptDir%\..\GridGUI.ahk

myGui := new GridGUI("Sub Grids", "resize")
myGui.GuiClose := GridGUI.ExitApp

subGrid1 := new GridGUI.SubGrid(myGui.hwnd, new GridGUI.Position(0, 0, 50, 50), , true)

myGui.AddControl(1, 1, subGrid1, 1, 1, 1, 1)
subGrid1.Add(1, 1, "Button", , , 1, 1, 1, 1)

subGrid2 := new GridGUI.SubGrid(myGui.hwnd, new GridGUI.Position(0, 0, 50, 50), , true)

myGui.AddControl(2, 1, subGrid2, 1, 1, 1, 1)
subGrid2.Add(1, 1, "Button", , , 1, 1, 1, 1)
subGrid2.Add(2, 2, "Button", , , 1, 1, 1, 1)

subGrid3 := new GridGUI.SubGrid(myGui.hwnd, new GridGUI.Position(0, 0, 50, 50), , true)

myGui.AddControl("1-2", 2, subGrid3, 1, 1, 1, 1)
subGrid3.Add(1, 1, "Button", , , 1, 1, 1, 1)
subGrid3.Add(2, 2, "Button", , , 1, 1, 1, 1)
subGrid3.Add(3, 3, "Button", , , 1, 1, 1, 1)

myGui.AutoSize()
myGui.Show("w300 h300")
myGui.MinSize()
return
