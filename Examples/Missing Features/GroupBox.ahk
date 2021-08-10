
#Include %A_ScriptDir%\..\..\GridGUI.ahk

myGui := new GridGUI("Grid Test", "resize")

myGui.Add("1-2", 1, "Text", , "Find what?", , , , , "CW")
myGui.Add("1-2", 2, "Text", , "Replace with?", , , , , "CW")
myGui.Add("3-8", 1, "Edit", "Multi", , , , 1)
myGui.Add("3-8", 2, "Edit", "Multi", , , , 1)

myGui.Add("1-6", "3-8", "GroupBox", , "Options", , , 1, 1, "C")

myGui.Add(2, 4, "Checkbox", , "&Case Sensitive", , , , , "CW")
myGui.Add(2, 5, "Checkbox", , "Replace &All?", , , , , "CW")
myGui.Add(2, 6, "Checkbox", , "Rege&x Mode", , , , , "CW")
myGui.Add(2, 7, "Checkbox", , "Remove Blanks?", , ,  , , "CW")
myGui.Add(4, 4, "Checkbox", , "&Whole Words Only", , , , , "CW")
myGui.Add(3, 6, "Button", , "?", , , , , "CW")
myGui.Add(4, 6, "Checkbox", , "Full Regex", , , , , "CW")
myGui.Add(5, 6, "Checkbox", , "Show Original?", , , , , "CW")


myGui.Add(8, 4, "Button", , "&Update Content", , , 1, , "CW")
myGui.Add(8, 5, "Button", , "&Copy", , , 1, , "CW")

myGui.Add("1-8", 9, "Edit", "Multi", , , 1, 1)
myGui.Show()
return

GuiClose:
	ExitApp
