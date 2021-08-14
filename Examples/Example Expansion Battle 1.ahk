
#Include %A_ScriptDir%\..\GridGUI.ahk

myGui := new GridGUI("Grid Test", "resize")

myGui.Add("1-5", 1, "Edit", , , 1, , 1, , "C")
myGui.Add(1, "2-4", "Edit", "w20", , , 1, , 1, "C")
myGui.Add(5, "2-4", "Edit", "w20", , , 1, , 1, "C")
myGui.Add("1-5", 5, "Edit", , , 1, , 1, , "C")


myGui.Add("2-4", 2, "Edit", , , 1, 1, 1, 1, "C")
myGui.Add("2-3", 3, "Edit", , , 1, , 1, , "C")
myGui.Add(4, 3, "Button", , "Button", , , , , "C")

myGui.Show()
return

GuiClose:
	ExitApp
