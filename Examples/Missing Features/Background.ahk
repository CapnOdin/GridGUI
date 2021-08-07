
#Include %A_ScriptDir%\..\..\GridGUI.ahk

myGui := new GridGUI("Grid Test", "resize")

myGui.AddControl("0-4", "0-5", "Picture", , "background.png", 1, 1)

myGui.AddControl("1-3", 1, "Edit", , , 1)
myGui.AddControl(1, 2, "Button", , "Button")
myGui.AddControl(2, 2, "Edit", , , 1)
oWB := myGui.AddControl(3, "2-3", "ActiveX", "w113 h43", "shell explorer").vVar
oWB.Navigate("about:<!DOCTYPE HTML><html><body style=""{margin:0;}""><img src=""https://i.imgur.com/FlGrIY3.gif""></body></html>")
oWB.document.body.style.overflow := "hidden"
myGui.AddControl(1, 3, "Button", , "Button")
myGui.AddControl(2, 3, "Button", , "Button Button")
myGui.AddControl("1-3", 4, "Button", , "Button", 1)
myGui.Show()
return

GuiClose:
	ExitApp
