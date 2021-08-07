#Include %A_ScriptDir%\..\..\GridGUI.ahk

SetBatchLines, -1

area := new Position(1, 1, 20, 20)

/*
pos1 := new Position(50, 50, 100, 100)
pos2 := new Position(25, 25, 25, 25)
pos3 := new Position(25, 25, 50, 50)
pos4 := new Position(55, 55, 40, 40)

pos5 := new Position(1, 1, 0, 0)
pos6 := new Position(55, 55, 0, 0)

MsgBox, % testCoord(pos1, pos2) testCoord(pos1, pos3) testCoord(pos1, pos4) testCoord(pos1, pos5) testCoord(pos1, pos6)

testCoord(pos1, pos2) {
	return ObjectToString(pos1.Compare(pos2)) ": " pos1.Contains(pos2) "`n"
}
*/

Global errorF := FileOpen("errors.csv", "a")
errors := 0

CoordMode, ToolTip, Screen
loop % 1000 {
	ToolTip, % A_Index, 0, 0, 18
	errors += DoTest(A_Index, area, , true)
	;f := Func("Test").Bind(test[1], test[2], test[3])
	;SetTimer, % f, -1000
}
MsgBox, % errors

Return

DoTest(iteration, area, iterations := 10, destroyOnSuccess := false) {
	cellgroups := []
	loop % iterations {
		cellGroupDefinition := GetRandomCellGroup(area, cellgroups)
		if(cellGroupDefinition) {
			cellgroups.Push(cellGroupDefinition)
		}
	}

	gw := 30

	;myGui := new GUI("title", "Resize")
	;AddGrid(myGui, area, gw)
	;AddCellGroups(myGui, cellgroups, gw)
	
	Clipboard := ToCsv(cellgroups)

	myGGui := new GridGUI("Grid Test", "resize")
	MakeGridGuiVersion(myGGui, cellgroups)
	myGGui.Show("NA")
	myGGui.AutoSize()
	myGGui.MinSize()
	myGGui.Hide()

	;pos := myGGui.WinGetPos()
	
	;myGGui.Show("x" pos.x + (area.w * gw) / 2 " w" area.w * gw " h" area.h * gw) ; " NA")
	;mygui.Show(	"x" pos.x - (area.w * gw) / 2 " w" area.w * gw " h" area.h * gw) ; " NA")
	
	myGGui.Show("w" area.w * gw " h" area.h * gw " NA")
	
	
	WinWait, % "ahk_id " myGGui.Hwnd
	;return [mygui, myGGui, cellgroups]

	if(destroyOnSuccess && !ContainsErrors(myGGui)) {
		;mygui.Destroy()
		myGGui.Destroy()
		return false
	} else {
		MsgBox, % cellgroups.Length() "`n" ToCsv(cellgroups)
		errorF.Write(iteration "`n")
		errorF.Write(ToCsv(cellgroups) "`n`n`n")
		;mygui.Destroy()
		myGGui.Destroy()
		return true
	}
}

ToCsv(cellgroups) {
	res := ""
	for i, cg in cellgroups {
		res .= cg[1].x "," cg[1].y "," cg[1].w "," cg[1].h "," cg[2] "`n"
	}
	return res
}

Test(g1, g2, cg) {
	if(!ContainsErrors(g2)) {
		g1.Destroy()
		g2.Destroy()
	} else {
		MsgBox, % cg.Length() "`n" ObjectToString(cg)
	}
}

ContainsErrors(mygui) {
	pos := mygui.WinGetPos().Copy()
	pos.x := 0
	pos.y := 0
	for i, c in mygui.grid.cells {
		if(!pos.Contains(c.pos)) {
			;MsgBox, % pos.ToStr() "`n`n`n" c.pos.ToStr() "`n`n" ObjectToString(pos.Compare(c.pos))
			errorF.Write(pos.ToStr() "`n`n`n" c.pos.ToStr() "`n`n" ObjectToString(pos.Compare(c.pos)) "`n")
			return true
		}
		if(c.pos.Area() <= 1) {
			;MsgBox, % pos.ToStr() "`n`n`n" c.pos.ToStr() "`n`n" ObjectToString(pos.Compare(c.pos))
			errorF.Write(pos.ToStr() "`n`n`n" c.pos.ToStr() "`n`nArea = " c.pos.Area() "`n")
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

GuiClose:
	ExitApp
