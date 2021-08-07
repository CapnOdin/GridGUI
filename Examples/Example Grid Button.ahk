
#Include %A_ScriptDir%\..\GridGUI.ahk

myGui := new GridGUI("Grid Test", "resize")

myGui.AddControl(1,		1,		"Button", , "Button1")
myGui.AddControl(1,		2,		"Button", , "Button2")
myGui.AddControl(2,		1,		"Button", , "Button3")
myGui.AddControl(2,		2,		"Button", , "Button4")
myGui.AddControl("1-3",	3,		"Button", , "Button5", 1)
myGui.AddControl(3,		"1-2",	"Button", , "Button6", 1, 1)

myGui.Show()
return

GuiClose:
	ExitApp
