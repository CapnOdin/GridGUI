
#Include %A_ScriptDir%\..\..\..\GridGUI.ahk

myGui := new GridGUI("Grid Test", "resize")
Menu, FileMenu, Add, Script Icon, MenuHandler
Menu, MyMenuBar, Add, &Referances, :FileMenu
Gui, % myGui.hwnd ":Menu", MyMenuBar

myGui.AddControl(1,		1, "Text",		,			"Find what?",			,	, ,		, "CNW")
myGui.AddControl(1,		2, "Text",		,			"Replace with?",		,	, ,		, "CNW")
myGui.AddControl("2-7", 1, "Edit",		"Multi",	,						1)
myGui.AddControl("2-7", 2, "Edit",		"Multi",	,						1)
myGui.AddControl(1,		3, "Checkbox",	,			"&Case Sensitive",		,	, , 	, "CW")
myGui.AddControl(1,		4, "Checkbox",	,			"Replace &All?",		,	, , 	, "CW")
myGui.AddControl(1,		5, "Checkbox",	,			"Rege&x Mode",			,	, , 	, "CW")
myGui.AddControl(1,		6, "Checkbox",	,			"Remove Blanks?",		,	, , 	, "CW")
myGui.AddControl("3-4",	3, "Checkbox",	,			"&Whole Words Only",	,	, , 	, "CW")
myGui.AddControl(2,		5, "Button",	,			"?",					,	, , 	, "CW")
myGui.AddControl(3,		5, "Checkbox",	,			"Full Regex",			,	, , 	, "CW")
myGui.AddControl(4,		5, "Checkbox",	,			"Show Original?",		,	, , 	, "CW")
myGui.AddControl(7,		3, "Button",	,			"&Update Content",		,	, , 	, "CW")
myGui.AddControl(7,		4, "Button",	,			"&Copy",				,	, 1,	, "CW")

myGui.AddControl("1-7",	7, "Edit",		"Multi",	,						1,	1)
myGui.Show("w480 h600")

MenuHandler:
return

GuiClose:
	ExitApp
