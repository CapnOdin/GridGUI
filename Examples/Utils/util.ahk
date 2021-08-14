
ContainsErrors(mygui, logfun := "") {
	pos := mygui.WinGetPos().Copy()
	pos.x := 0
	pos.y := 0
	for i, c in mygui.grid.cells {
		if(!pos.Contains(c.pos)) {
			if(logfun) {
				logfun.Call(pos.ToStr() "`n`n`n" c.pos.ToStr() "`n`n" ObjectToString(pos.Compare(c.pos)) "`n")
			}
			return true
		}
		if(c.pos.Area() <= 1) {
			if(logfun) {
				logfun.Call(pos.ToStr() "`n`n`n" c.pos.ToStr() "`n`nArea = " c.pos.Area() "`n")
			}
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
		pos := new GridGUI.Position(px1, py1, px2 - px1, py2 - py1)
		postest := new GridGUI.Position(px1 - 1, py1 - 1, px2 - px1 + 1, py2 - py1 + 1)
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
			ggui.Add(strrow, strcolumn, "Button", , type)
		} else if(type = "W") {
			ggui.Add(strrow, strcolumn, "Button", , type, 1, , 1)
		} else if(type = "H") {
			ggui.Add(strrow, strcolumn, "Button", , type, , 1, , 1)
		} else {
			ggui.Add(strrow, strcolumn, "Button", , type, 1, 1, 1, 1)
		}
	}
}

ObjectToString(obj){
	if(!IsObject(obj)){
		return Util_IsNum(obj) ? obj : """" obj """"
	}
	bool := obj.Length()
	res .= bool ? "[" : "{"
	for key, value in obj {
		res .= (!bool ? """" (IsObject(key) ? StrReplace(StrReplace(key.gridpos.ToStr(), "`n", "-"), ":", "") :  key) """ : " : "") ObjectToString(value) ", "
	}
	return SubStr(res, 1, -2) (bool ? "]" : "}")
}

Util_IsNum(Num){
	if Num is Number
		return 1
	return 0
}
