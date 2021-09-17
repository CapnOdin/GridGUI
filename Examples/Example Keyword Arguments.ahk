
#Include %A_ScriptDir%\..\GridGUI.ahk

myGui := new GridGUI("Grid Test", "resize")
myGui.GuiClose := GridGUI.ExitApp

myGui.Add(1,		1,	"Text",		{text:"Find what?",			justify:"CW"})
myGui.Add(1,		2,	"Text",		{text:"Replace with?",		justify:"CW"})
myGui.Add("2-7",	1,	"Edit",		{options:"Multi", exW:1, fillW:1})
myGui.Add("2-7",	2,	"Edit",		{options:"Multi", exW:1, fillW:1})
myGui.Add(1,		3,	"Checkbox",	{text:"&Case Sensitive",	justify:"CW"})
myGui.Add(1,		4,	"Checkbox",	{text:"Replace &All?",		justify:"CW"})
myGui.Add(1,		5,	"Checkbox",	{text:"Rege&x Mode",		justify:"CW"})
myGui.Add(1,		6,	"Checkbox",	{text:"Remove Blanks?",		justify:"CW"})
myGui.Add(3,		3,	"Checkbox",	{text:"&Whole Words Only",	justify:"CW"})
myGui.Add(2,		5,	"Button",	{text:"?",					justify:"CW"})
myGui.Add(3,		5,	"Checkbox",	{text:"Full Regex",			justify:"CW"})
myGui.Add(4,		5,	"Checkbox",	{text:"Show Original?",		justify:"CW"})

myGui.Add(6,		3,	"Button",	{text:"&Update Content",	justify:"CW"})
myGui.Add(6,		4,	"Button",	{text:"&Copy",	fillW:1,	justify:"CW"})

myGui.Add("1-7",	7,	"Edit",		{options:"Multi", exW:1, exH:1, fillW:1, fillH:1})
myGui.AutoSize()
myGui.MinSize()
myGui.Show()
return
