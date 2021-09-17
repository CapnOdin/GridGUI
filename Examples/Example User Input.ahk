
#Include %A_ScriptDir%\..\GridGUI.ahk

myGui := new GridGUI("Grid Test", "resize", true)
myGui.GuiClose := GridGUI.ExitApp

ed :=	myGui.Add("1-3",	1, "Edit", , , 1, , 1)
bt1 :=	myGui.Add(1, 		2, "Button", , "Button 1", 1)
bt2 :=	myGui.Add(2, 		2, "Button", , "Button 2", 1)
btc :=	myGui.Add(3,		2, "Button", , "Close1", 1)
btc2 :=	myGui.Add("1-3",	3, "Button", "gGuiClose", "Close2", 1)

ed.Callback := Func("ToolTip").Bind("You are typing")
bt1.Callback := Func("ToolTip").Bind("You pressed button 1")
bt2.Callback := Func("ShowEditText").Bind(ed)
btc.Options("+gGuiClose")

myGui.AutoSize()
myGui.MinSize()
myGui.Show()
return

ToolTip(text) {
	ToolTip, % text
}

ShowEditText(edit) {
	ToolTip, % "You typed """ edit.vVar """ in the edit control"
}
