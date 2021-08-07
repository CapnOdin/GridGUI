
#Include %A_ScriptDir%\..\GridGUI.ahk

myGui := new GridGUI("Grid Test", "resize")

myGui.AddControl("1-3", 1, "Edit", , , , , 1)
myGui.AddControl(1, 2, "Button", , "Button")
oWB := myGui.AddControl("2-3", "2-3", "ActiveX", "w200 h60", "shell explorer", 1, 1).vVar
oWB.Navigate("about:<!DOCTYPE HTML><head><meta charset=""UTF-8""></head><html><body style=""{margin:0;background-color:#F0F0F0;}""><p style=""font-size:50px;font-family:segoe ui emoji;"">" "🦧🐶🐕🦮🐕‍🦺🐩🐺🦊🦝🐱🐈🐈‍⬛🦁🐯🐅🐆🐴🐎🦄" "</p></body></html>")
oWB.document.body.style.overflow := "hidden"
myGui.AddControl(1, 3, "Button", , "Button Button")
myGui.AddControl("1-3", 4, "Button", , "Button", 1)
myGui.Show()
return

GuiClose:
	ExitApp