#Include %A_ScriptDir%\..\..\GridGUI.ahk

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
bt := prompt.AddControl(1, 1, "Button", , "Display GUI", 1)
ed := prompt.AddControl(1, 2, "Edit", "Multi", , 1, 1)
bt.Callback := Func("ButtonClicked").Bind(ed)
prompt.Show("w200 h200")
prompt.AutoSize()
prompt.MinSize()
return

;GuiClose:
;	ExitApp

ButtonClicked(ed) {
	ShowDefinitionAndResult(RegExReplace(ed.vVar, " |\t", ""))
}

ShowDefinitionAndResult(csv, destroyOnSuccess := false) {
	cellgroups := []
	
	area := new Position(1, 1, 1, 1)
	
	for i, line in StrSplit(csv, "`n") {
		parts := StrSplit(line, ",")
		pos := new Position(parts[1], parts[2], parts[3], parts[4])
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
	
	MsgBox, % area.ToStr()

	gw := 30

	myGui := new GUI("title", "Resize")
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
	
	if(destroyOnSuccess && !ContainsErrors(myGGui)) {
		mygui.Destroy()
		myGGui.Destroy()
	} else {
		MsgBox, % cellgroups.Length() "`n" ObjectToString(cellgroups)
	}
}

ContainsErrors(mygui) {
	pos := mygui.WinGetPos()
	for i, c in mygui.grid.Cells {
		if(!pos.Intersect(c.pos)) {
			return true
		}
	}
	return false
}

GetRandomCellGroup(area, used) {
	loop 100 {
		y1 := Random(area.y, area.h)
		y2 := Random(area.y, area.h)
		
		x1 := Random(area.x, area.w)
		x2 := Random(area.x, area.w)
		px1 := Min(x1, x2)
		px2 := Max(x1, x2)
		py1 := Min(y1, y2)
		py2 := Max(y1, y2)
		pos := new Position(px1, py1, px2 - px1, py2 - py1)
		postest := new Position(px1 - 1, py1 - 1, px2 - px1 + 1, py2 - py1 + 1)
		if(pos.Area() > 0 && Available(postest, used)) {
			return [pos, GetType()]
		}
	}
}

Available(area, used) {
	
	for i, pos in used {
		if(area.Intersect(pos[1])) {
		;if(!area.Disjoint(pos[1])) {
			return False
		}
	}
	return True
}

AddCellGroups(myGui, cellgroups, cellSize) {
	for i, element in cellgroups {
		pos := element[1]
		type := element[2]
		myGui.Add("Button", "x" (pos.x - 1) * cellSize " y" (pos.y - 1) * cellSize " w" pos.w * cellSize " h" pos.h * cellSize, type)
	}
}

AddGrid(myGui, area, cellSize) {
	loop % area.w - area.x {
		myGui.Add("Progress", "x" A_Index * cellSize " y0 w2 h" area.h * cellSize).GuiControl("+Background777777", "")
	}
	loop % area.h - area.y {
		myGui.Add("Progress", "x0 y" A_Index * cellSize " w" area.w * cellSize " h2").GuiControl("+Background777777", "")
	}
}

GetType() {
	if(FiftyFifty()) {
		val := Random(1, 3)
		if(val = 1) {
			return "W"
		} else if(val = 2) {
			return "H"
		}
		return "WH"
	}
	return "F"
}

FiftyFifty() {
	return Random(0, 1)
}

Random(min, max) {
	Random, val, % min, % max
	return val
}

MakeGridGuiVersion(ggui, cellgroups) {
	for i, element in cellgroups {
		pos			:= element[1]
		type		:= element[2]
		strrow		:= pos.x (pos.w > 1 ? "-" (pos.w + pos.x - 1) : "")
		strcolumn	:= pos.y (pos.h > 1 ? "-" (pos.h + pos.y - 1) : "")
		
		if(type = "F") {
			ggui.AddControl(strrow, strcolumn, "Button", , type)
		} else if(type = "W") {
			ggui.AddControl(strrow, strcolumn, "Button", , type, 1)
		} else if(type = "H") {
			ggui.AddControl(strrow, strcolumn, "Button", , type, , 1)
		} else {
			ggui.AddControl(strrow, strcolumn, "Button", , type, 1, 1)
		}
	}
}