#Include %A_ScriptDir%\..\..\GridGUI.ahk
#Include %A_ScriptDir%\util.ahk
/*
2,1,1,1,W
1,2,3,1,W
3,3,2,1,W
*/

/*
2,17,17,2,W
16,16,2,1,W
1,8,1,3,W
5,1,6,1,W
*/

/*
1,8,1,3,W
5,1,6,1,W
16,16,2,1,W
2,17,17,2,W
*/

/*
1,3,1,1,W
3,1,1,1,W
5,5,1,1,W
2,6,5,1,W
*/

/*
6,6,6,7,F
13,5,7,6,F
12,17,1,3,W
3,15,4,5,F
4,9,1,1,F
16,14,2,2,F
2,6,1,11,H
11,2,2,2,F
10,14,2,5,WH
15,13,1,3,WH
*/


prompt := new GridGUI("Promt", "Resize")
bt := prompt.Add(1, 1, "Button", , "Display GUI", 1)
ed := prompt.Add(1, 2, "Edit", "Multi", , 1, 1)
bt.Callback := Func("ButtonClicked").Bind(ed)
prompt.Show("w200 h200")
prompt.AutoSize()
prompt.MinSize()
return

ButtonClicked(ed) {
	ShowDefinitionAndResult(RegExReplace(ed.vVar, " |\t", ""))
}

ShowDefinitionAndResult(csv, destroyOnSuccess := false) {
	cellgroups := []
	
	area := new GridGUI.Position(1, 1, 1, 1)
	
	for i, line in StrSplit(csv, "`n") {
		parts := StrSplit(line, ",")
		pos := new GridGUI.Position(parts[1], parts[2], parts[3], parts[4])
		cellgroups.Push([pos, parts[5]])
		if(pos.x < area.x) {
			area.w := area.x + area.w
			area.x := pos.x
		}
		if(pos.y < area.y) {
			area.h := area.y + area.h
			area.y := pos.y
		}
		if(pos.x + pos.w > area.x + area.w) {
			area.w := pos.x + pos.w
		}
		if(pos.y + pos.h > area.y + area.h) {
			area.h := pos.y + pos.h
		}
	}

	gw := 30

	myGui := new GridGUI.GUI("title", "Resize")
	AddGrid(myGui, area, gw)
	AddCellGroups(myGui, cellgroups, gw)

	myGGui := new GridGUI("Grid Test", "resize")
	MakeGridGuiVersion(myGGui, cellgroups)
	myGGui.Show()
	myGGui.AutoSize()
	myGGui.MinSize()
	
	mygui.Show("w" area.w * gw " h" area.h * gw)

	gpos := mygui.WinGetPos()
	
	mygui.Show(	"x" gpos.x - gpos.w / 2 " w" area.w * gw " h" area.h * gw)
	myGGui.Show("x" gpos.x + gpos.w / 2 " w" area.w * gw " h" area.h * gw)
	
	if(destroyOnSuccess && !ContainsErrors(myGGui, Func("MsgBox"))) {
		mygui.Destroy()
		myGGui.Destroy()
	} else {
		MsgBox, % cellgroups.Length() "`n" ObjectToString(cellgroups)
	}
}

MsgBox(str) {
	MsgBox, % str
}
