
#Include %A_ScriptDir%\..\..\..\GridGUI.ahk

myGui := new GridGUI("Columnize", "resize")
Menu, FileMenu, Add, Script Icon, MenuHandler
Menu, MyMenuBar, Add, &File, :FileMenu
Menu, MyMenuBar, Add, &Tools, :FileMenu
Menu, MyMenuBar, Add, &About, :FileMenu
myGui.Menu("MyMenuBar")
myGui.Margin(1, 1)

;x1-9 y1-26
myGui.Font("cRed")
myGui.Add("1-8",	"1-12",		"GroupBox",		{text:"Options", 		fillW:1, fillH:1})
myGui.Add("1-8",	"13-20",	"GroupBox",		{text:"Border & Lines", fillW:1, fillH:1})
myGui.Add("1-8",	"21-24",	"GroupBox",		{text:"Column manager", fillW:1, fillH:1})
; Workaround for controling the padding in the GroupBoxs
myGui.Add(1,		1,			"Text",			{options:"w10 h20 +BackgroundTrans"})
myGui.Add(8,		1,			"Text",			{options:"w10 h20 +BackgroundTrans"})
myGui.Add(1,		12,			"Text",			{options:"w10 h5 +BackgroundTrans"})
myGui.Add(8,		12,			"Text",			{options:"w10 h5 +BackgroundTrans"})
myGui.Add(1,		13,			"Text",			{options:"w10 h20 +BackgroundTrans"})
myGui.Add(8,		13,			"Text",			{options:"w10 h20 +BackgroundTrans"})
myGui.Add(1,		20,			"Text",			{options:"w10 h5 +BackgroundTrans"})
myGui.Add(8,		20,			"Text",			{options:"w10 h5 +BackgroundTrans"})
myGui.Add(1,		21,			"Text",			{options:"w10 h20 +BackgroundTrans"})
myGui.Add(8,		21,			"Text",			{options:"w10 h20 +BackgroundTrans"})
myGui.Add(1,		24,			"Text",			{options:"w10 h5 +BackgroundTrans"})
myGui.Add(8,		24,			"Text",			{options:"w10 h5 +BackgroundTrans"})
myGui.Font("cDefault")

;Options
myGui.Add("2-5",	2,			"Checkbox", 	{text:"Auto update?",		options:"Checked",	justify:"WC"})
myGui.Add("2-5",	3,			"Checkbox", 	{text:"Recursive?",								justify:"WC"})
myGui.Add("2-4",	4,			"Checkbox", 	{text:"Is CSV?",			options:"Checked",	justify:"WC"})
myGui.Add("5-7",	4,			"Checkbox", 	{text:"Is String?",			options:"Checked",	justify:"WC"})
myGui.Add("2-3",	5,			"Text", 		{text:"Delimiter",								justify:"WC"})
myGui.Add("4-7",	5,			"Edit", 		{text:"",		fillW:1,	options:"Disabled"})
myGui.Add("2-3",	6,			"Text", 		{text:"Header",									justify:"WC"})
myGui.Add("4-7",	6,			"Edit", 		{text:"1",		fillW:1})
myGui.Add("4-7",	6,			"UpDown",		{							options:"Range1-10",justify:"EC"})
myGui.Add("2-3",	7,			"Text", 		{text:"Rows",									justify:"WC"})
myGui.Add("4-7",	7,			"Edit", 		{text:"3",		fillW:1})
myGui.Add("4-7",	7,			"UpDown",		{							options:"Range1-10",justify:"EC"})
myGui.Add("2-3",	8,			"Text", 		{text:"Wrap",									justify:"WC"})
myGui.Add("4-7",	8,			"Edit", 		{text:"0",		fillW:1})
myGui.Add("4-7",	8,			"UpDown",		{							options:"Range0-10",justify:"EC"})
myGui.Add("2-3",	9,			"Text", 		{text:"Padding",								justify:"WC"})
myGui.Add("4-7",	9,			"Edit", 		{text:"",		fillW:1})
myGui.Add("2-3",	10,			"Text", 		{text:"L/R pad",								justify:"WC"})
myGui.Add("4-5",	10,			"Edit", 		{text:"1",		fillW:1})
myGui.Add("4-5",	10,			"UpDown",		{							options:"Range1-10",justify:"EC"})
myGui.Add("6-7",	10,			"Edit", 		{text:"1",		fillW:1})
myGui.Add("6-7",	10,			"UpDown",		{							options:"Range1-10",justify:"EC"})
myGui.Add("2-5",	11,			"Checkbox", 	{text:"Use borders?",		options:"Checked",	justify:"WC"})

;Border & Lines
myGui.Add(2,		14,			"Edit", 		{text:",", options:"w25"})
myGui.Add("3-5",	14,			"Edit", 		{text:"-", fillW:1})
myGui.Add(6,		14,			"Edit", 		{text:"-", options:"w25"})
myGui.Add(7,		14,			"Edit", 		{text:",", options:"w25"})
myGui.Add(2,		15,			"Edit", 		{text:"|", options:"w25"})
myGui.Add("3-5",	15,			"Edit", 		{text:"=", fillW:1})
myGui.Add(6,		15,			"Edit", 		{text:"=", options:"w25"})
myGui.Add(7,		15,			"Edit", 		{text:"|", options:"w25"})
myGui.Add(2,		16,			"Edit", 		{text:"|", options:"w25"})
myGui.Add(6,		16,			"Edit", 		{text:"|", options:"w25"})
myGui.Add(7,		16,			"Edit", 		{text:"|", options:"w25"})
myGui.Add(2,		17,			"Edit", 		{text:"|", options:"w25"})
myGui.Add("3-5",	17,			"Edit", 		{text:"-", fillW:1})
myGui.Add(6,		17,			"Edit", 		{text:"|", options:"w25"})
myGui.Add(7,		17,			"Edit", 		{text:"|", options:"w25"})
myGui.Add(2,		18,			"Edit", 		{text:"'", options:"w25"})
myGui.Add("3-5",	18,			"Edit", 		{text:"-", fillW:1})
myGui.Add(6,		18,			"Edit", 		{text:"-", options:"w25"})
myGui.Add(7,		18,			"Edit", 		{text:"'", options:"w25"})
myGui.Add("2-3",	19,			"Text", 		{text:"Presets:"})
myGui.Add("4-7",	19,			"DDL", 			{text:"Simple||",	fillW:1})

;Column manager
myGui.Add("2-6",	22,			"Button", 		{text:"Get columns",	options:"", fillW:1})
lv := new GridGUI.ListviewControl(myGui.hwnd, "Checked", "Hide?|Justify")
myGui.AddControl("2-7",	23,		lv, 			{exH:1, fillW:1, fillH:1})
myGui.Font("bold s14")
myGui.Add("1-8",	25,			"Button", 		{text:"UPDATE",	options:"h25", fillW:1})

myGui.Font("norm s10")
stBar := new GridGUI.StatusBarControl(myGui.hwnd)
myGui.AddControl("1-9",	26,		stBar, 			{text:"",	options:"", exW:1, fillW:1})

myGui.Font("s10", "Courier New")
myGui.Add(9,		"1-11",		"Edit",			{text:GetText(),	options:"+Multi +HScroll",				exW:1, exH:0, fillW:1, fillH:1})
myGui.Add(9,		"12-25",	"Edit",			{text:GetTable(),	options:"+ReadOnly +Multi +HScroll",	exW:1, exH:0, fillW:1, fillH:1})

myGui.AutoSize()
lv.ModifyCol(1, "Checked")
lv.AddArray([ ["1. Materi...", "Right"]
			, ["2. Name", "Can..."]
			, ["3. Pitch", "Left"]
			, ["4. Waste", "Left"]
			, ["5. Qty", "Left"]
			, ["6. Waste", "Left"]
			, ["7. Squares", "Left"]
			, ["8. Elevat...", "Left"]
			, ["9. Option", "Left"]
			, ["10. Mate...", "Left"]
			, ["11. Units", "Left"]
			, ["12. Item", "Left"]
			, ["13. Opfi...", "Left"]])
lv.ModifyCol(1, "AutoHdr")
lv.ModifyCol(2, "AutoHdr")
myGui.Show("w1127 h747")
myGui.MinSize()
stBar.SetParts(myGui.Pos["w"] // 3, myGui.Pos["w"] // 3)
stBar.SetText("Input: 17 Lines 1125 Characters", 1)
stBar.SetText("Output: 25 Lines 2749 Characters", 2)
stBar.SetText("1.3 (Saturday. March 9. 2019)", 3)


MenuHandler:
return

GuiClose:
	ExitApp

GetText() {
	str := "
	(
Material Type,Name,Pitch,Waste %,Qty,Waste,Squares,Elevation,Option,Materials,Units,Item #,Option Replaces?
Shingles,Shingles (8/12),8,10,177.21,178,1.77,,Base,5.31,BUNDLES,94,FALSE
Shingles,Shingles (6/12),6,10,1198.35,1199,11.98,,Base,35.94,BUNDLES,96,FALSE
Shingles,Shingles (4/12),4,10,481.29,482,4.81,,Base,14.43,BUNDLES,98,FALSE
Ridge Cap,Ridge Cap,0,0,69.27,0,0,,Base,69.27,LF,200,FALSE
Ridge Cap,Ridge Cap (flipped),4,0,16.74,0,0,,Base,16.74,LF,210,FALSE
Ridge Vent,Ridge Vent,0,0,6l.5,0,0.62,,Base,6l.5,LF,220,FALSE
Valley Flashing,Valley Flashing,6,0,68.86,0,0,,Base,68.86,LF,300,FALSE
Starter / Drip Edge,Eaves,0,0,96.83,0,0,,Base,96.83,LF,400,FALSE
Starter / Drip Edge,Rakes,4,0,26.87,0,0,,Base,26.87,LF,élO,FALSE
Starter / Drip Edge,Rakes,6,0,77.76,0,0,,Base,77.76,LF,410,FALSE
Starter / Drip Edge,Rakes,8,0,23.91,0,0,,Base,77.76,LF,410,FALSE
	)"
	return str
}

GetTable() {
	str := "
	(
.-----------------------------------------------------------------------------------------------------------.
|       Material Type |        Name        | Pitch | Waste % | Qty     | Option | Item # | Option Replaces? |
|===========================================================================================================|
|            Shingles |  Shingles (8/12)   | 8     | 10      | 177.21  | Base   | 94     | FALSE            |
|            Shingles |  Shingles (6/12)   | 6     | 10      | 1198.35 | Base   | 96     | FALSE            |
|            Shingles |  Shingles (4/12)   | 4     | 10      | 481.29  | Base   | 98     | FALSE            |
|---------------------|--------------------|-------|---------|---------|--------|--------|------------------|
|           Ridge Cap |     Ridge Cap      | 0     | 0       | 69.27   | Base   | 200    | FALSE            |
|           Ridge Cap | Ridge Cap (Hipped) | 4     | 0       | 16.74   | Base   | 210    | FALSE            |
|          Ridge Vent |     Ridge Vent     | 0     | 0       | 61.5    | Base   | 220    | FALSE            |
|---------------------|--------------------|-------|---------|---------|--------|--------|------------------|
|     Valley Flashing |  Valley Flashing   | 6     | 0       | 68.86   | Base   | 300    | FALSE            |
| Starter / Drip Edge |       Eaves        | 0     | 0       | 96.83   | Base   | 400    | FALSE            |
| Starter / Drip Edge |       Rakes        | 4     | 0       | 26.87   | Base   | 410    | FALSE            |
|---------------------|--------------------|-------|---------|---------|--------|--------|------------------|
| Starter / Drip Edge |       Rakes        | 6     | 0       | 77.76   | Base   | 410    | FALSE            |
| Starter / Drip Edge |       Rakes        | 8     | 0       | 23.91   | Base   | 410    | FALSE            |
|      Apron Flashing |   Apron Flashing   | 0     | 20      | 40.96   | Base   | 500    | FALSE            |
|---------------------|--------------------|-------|---------|---------|--------|--------|------------------|
|            Shingles |   Step Flashing    | 4     | 20      | 14.15   | Base   | 510    | FALSE            |
|              Finial |     Sky Light      | 0     | 10      | 0       | Base   | 600    |                  |
|           Sky Light |     Sky Light      | 0     | 10      | 0       | Base   | 600    |                  |
|---------------------|--------------------|-------|---------|---------|--------|--------|------------------|
|           Sky Light |     Sky Light      | 0     | 10      | 4       | Base   | 600    |                  |
'-----------------------------------------------------------------------------------------------------------'
	)"
	return str
}