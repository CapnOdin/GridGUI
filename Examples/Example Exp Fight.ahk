#Include %A_ScriptDir%\..\GridGUI.ahk

myGui := new GridGUI("Grid Test", "resize")

myGui.Add("1-2", 1, "Edit", , , 1)
myGui.Add("3-4", 1, "Edit", , , 1)
loop 5 {
	myGui.Add(A_Index, 3, "Button", , "x", 0, 0, 0, 0, "W")
	myGui.Add(A_Index, 4, "Button", , "x", 0, 0, 0, 0, "E")
}
myGui.Show()
return

GuiClose:
	ExitApp
