#Include %A_ScriptDir%\..\..\..\GridGUI.ahk

myGui := new GridGUI("Grid Test", "resize")

Menu, FileMenu, Add, Script Icon, MenuHandler
Menu, MyMenuBar, Add, &View, :FileMenu
Menu, MyMenuBar, Add, &IOClass, :FileMenu
Menu, MyMenuBar, Add, &Links, :FileMenu
Gui, % myGui.hwnd ":Menu", MyMenuBar

myGui.Font("s11")
myGui.Add(1, 1, "Text", , "Current Profile:", , , , , "CW")
myGui.Add(1, 2, "Text", , "Plugin Selection:", , , , , "CW")
myGui.Add("2-5", 1, "Edit", "Disabled", "Profile 1", , , 1)
myGui.Add("2-4", 2, "DropDownList", , , , , 1)
myGui.Add(5, 2, "Button", , "Add")

myGui.Add("1-5", "3-8", "Progress", , , 2.3, 1).GuiControl("+Background777777", "")

myGui.Add(1, 9, "Text", , "Save Status:", , , , , "CW")
myGui.Add(2, 9, "Text", "cRed", "You have unsaved changes", , , , , "CE")
myGui.Add(3, 9, "Button", , "Save Settings", , , , , "CW")

myGui.Add("6-7", 1, "Text", , "Profile ToolBox", , , , , "C")
;myGui.Add("6-7", "2-3", "TreeView", , , 1, 1, , , "C")
myGui.Add("6-7", "2-3", "TreeView", , , , 1, 1,  , "C")
TV_Add("SuperGlobal")
TV_Add("Global")
TV_Add("Default")
TV_Add("Profile 1")

checkbox := myGui.Add("6-7", 6, "Checkbox", "Center", "Profile Inherits Plugins`nfrom parent", , , , , "CW")
myGui.Add(6, 7, "Button", , "Add", 1, , , , "C")
myGui.Add(6, 8, "Button", , "Rename", 1, , , , "C")
myGui.Add(6, 9, "Button", , "Copy", 1, , , , "C")
myGui.Add(7, 7, "Button", , "Add Child", 1, , , , "C")
myGui.Add(7, 8, "Button", , "Delete", 1, , , , "C")

myGui.AutoSize()
myGui.Show("w1393 h613")
myGui.MinSize()

MenuHandler:
return

GuiClose:
	ExitApp