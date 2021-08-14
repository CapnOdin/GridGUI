
#Include %A_ScriptDir%\..\GridGUI.ahk

myGui := new GridGUI("Grid Test", "resize")

myGui.Add(1,		1,		"Button", , "Button1")
myGui.Add(1,		2,		"Button", , "Button2")
myGui.Add(2,		1,		"Button", , "Button3")
myGui.Add(2,		2,		"Button", , "Button4")
myGui.Add("1-3",	3,		"Button", , "Button5", 1, , 1)
myGui.Add(3,		"1-2",	"Button", , "Button6", 1, 1, 1, 1)

myGui.Show()
return

GuiClose:
	ExitApp
