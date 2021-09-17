
#Include %A_ScriptDir%\..\GridGUI.ahk

myGui := new GridGUI("Grid Test", "resize")
myGui.GuiClose := GridGUI.ExitApp

myGui.Add("1-5", 1, "Edit", "w0", , 1, , 1)
myGui.Add(1, "2-4", "Edit", "w20 h0", , , 1, , 1)
myGui.Add(5, "2-4", "Edit", "w20 h0", , , 1, , 1)
myGui.Add("1-5", 5, "Edit", "w0", , 1, , 1)

myGui.Add("2-4", 2, "Edit", "w0 h0", , 1, 1, 1, 1)
myGui.Add("2-3", 3, "Edit", "w0", , 1, , 1)
myGui.Add(4, 3, "Button", , "Button")

myGui.Show()
return
