
#Include %A_LineFile%\..\Controls.ahk

;#Include  <Jxon>

Class Grid {
	__New() {
		this.cells := []
		this.arbitrator := new ExpanderArbitrator()
		this.rows := new Rows()
		this.columns := new Columns()
	}
	
	AddCell(c) { ; adds the cell to all positionts it spands over
		this.cells.Push(c)
		this.arbitrator.Add(c)
		this.columns.Add(c)
		this.rows.Add(c)
	}
	
	GetMinWidth() {
		return this.columns.GetMinWidth()
	}
	
	GetMinHeight() {
		return this.rows.GetMinHeight()
	}
	
	ResetConstants() {
		this.columns.__ResetConstants()
		for i, c in this.columns.columns {
			c.__ResetConstants()
		}
		this.rows.__ResetConstants()
		for i, r in this.rows.rows {
			r.__ResetConstants()
		}
	}
	
	CalculatePositions(width, height) {
		this.arbitrator.ReCalculate() ; should not be done here
		this.widths := this.columns.CalculateWidths(width, this.columns.expanders, this.columns.nonExpanders, this.columns.expandersMaxValue)
		this.heights := this.rows.CalculateHeights(height, this.rows.expanders, this.rows.nonExpanders, this.rows.expandersMaxValue)
		
		;MsgBox, % ObjectToString(this.widths)
		;MsgBox, % ObjectToString(this.heights)
		for i, c in this.cells {
			c.SetArea(this.widths, this.heights)
			c.Update()
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

Class ExpanderArbitrator {
	__New() {
		this.Expanders := []
		this.Overlapping := {"W": {}, "H": {}}
		this.ReducedConflict := {"W": {}, "H": {}}
		this.ConflictLst := {"W": {}, "H": {}}
		this.ConflictMap := {"W": {}, "H": {}}
		this.Ignore := {"W": {}, "H": {}}
	}
	
	Add(c) {
		if(this.IsExpander(c)) {
			this.IsReduced := false
			this.Init(c)
			this.InitCheck(c)
			this.Expanders.Push(c)
		}
	}
	
	Init(c) {
		this.Overlapping["W"][c] := {}
		this.Overlapping["H"][c] := {}
		this.ReducedConflict["W"][c] := {}
		this.ReducedConflict["H"][c] := {}
		this.ConflictLst["W"][c] := []
		this.ConflictLst["H"][c] := []
		this.ConflictMap["W"][c] := []
		this.ConflictMap["H"][c] := []
		this.Ignore["W"][c] := {}
		this.Ignore["H"][c] := {}
	}
	
	InitCheck(c) {
		for i, expander in this.Expanders {
			this.CheckOverlapping(c, expander)
			this.CheckConflicts(c, expander)
			;this.Update(c)
		}
	}
	
	CheckOverlapping(c, expander) {
		if(c.gridpos.__OverlapX(expander.gridpos)) {
			this.Overlapping["W"][c][expander] := ""
			this.Overlapping["W"][expander][c] := ""
		}
		if(c.gridpos.__OverlapY(expander.gridpos)) {
			this.Overlapping["H"][c][expander] := ""
			this.Overlapping["H"][expander][c] := ""
		}
	}
	
	CheckConflicts(c, expander) {
		if(this.IsInWidthConflictWith(expander, c)) {
			c.hasWConfligts := true
			expander.hasWConfligts := true
			this.ConflictLst["W"][c].Push(expander)
			this.ConflictLst["W"][expander].Push(c)
			this.ConflictMap["W"][c][expander] := ""
			this.ConflictMap["W"][expander][c] := ""
		}
		if(this.IsInHeightConflictWith(expander, c)) {
			c.hasHConfligts := true
			expander.hasHConfligts := true
			this.ConflictLst["H"][c].Push(expander)
			this.ConflictLst["H"][expander].Push(c)
			this.ConflictMap["H"][c][expander] := ""
			this.ConflictMap["H"][expander][c] := ""
		}
	}
	
	Reduce() {
		for c, expanders in this.ConflictLst["W"] {
			reduced := {}
			for i, expander in expanders {
				if(!this.Ignore["W"][c].HasKey(expander)) {
					reduced[expander] := expander.exW
					for i in this.Overlapping["W"][expander] {
						if(this.ConflictMap["W"][c].HasKey(i) && !reduced.HasKey(i) && !this.Ignore["H"][c].HasKey(i)) {
							this.Ignore["W"][c][i] := ""
							if(i.exW > reduced[expander]) {
								reduced[expander] := i.exW
							}
						}
					}
				}
			}
			this.ReducedConflict["W"][c] := reduced
		}
		
		for c, expanders in this.ConflictLst["H"] {
			reduced := {}
			for i, expander in expanders {
				if(!this.Ignore["H"][c].HasKey(expander)) {
					reduced[expander] := expander.exH
					for i in this.Overlapping["H"][expander] {
						if(this.ConflictMap["H"][c].HasKey(i) && !reduced.HasKey(i) && !this.Ignore["H"][c].HasKey(i)) {
							this.Ignore["H"][c][i] := ""
							if(i.exH > reduced[expander]) {
								reduced[expander] := i.exH
							}
						}
					}
				}
			}
			this.ReducedConflict["H"][c] := reduced
		}
		this.IsReduced := true
	}
	
	Update(c) {
		for expander, exW in this.ReducedConflict["W"][c] {
			c.othersW += exW
		}
		
		for expander, exH in this.ReducedConflict["H"][c] {
			c.othersH += exH
		}
	}
	
	ReCalculate() {
		if(!this.IsReduced) {
			this.SortConflicts()
			this.Reduce()
			
			for i, expander in this.Expanders {
				expander.othersW := 0
				expander.othersH := 0
				this.Update(expander)
			}
			/*
			res := ""
			;res .= RegExReplace(ObjectToString(this.Overlapping), "\s", "") "`n`n`n"
			;res .= RegExReplace(ObjectToString(this.Conflict), "\s", "")
			
			res .= "Overlapping:`n"
			res .= Jxon_Dump(ConverStObjToObjOfStr(this.Overlapping), 4)
			res .= "`n`n`nConflict:`n"
			res .= Jxon_Dump(ConverStObjToObjOfStr(this.Conflict), 4)
			res .= "`n`n`nIgnore:`n"
			res .= Jxon_Dump(ConverStObjToObjOfStr(this.Ignore), 4)
			
			res := RegExReplace(res, "\\n", "`t")
			res := RegExReplace(res, "\\t", "")
			
			FileOpen("output.json", "w").Write(res)
			*/
		}
	}
	
	SortConflicts() {
		for c in this.ConflictLst["W"] {
			;MsgBox, % prettyPrint(Jxon_Dump(ConverStObjToObjOfStr(this.ConflictLst["W"][c])) "`n`n" Jxon_Dump(ConverStObjToObjOfStr((Sort(this.ConflictLst["W"][c], Func("BySize"))))))
			;this.ConflictLst["W"][c] := Sort(this.ConflictLst["W"][c], Func("ByExW"))
			this.ConflictLst["W"][c] := Sort(this.ConflictLst["W"][c], Func("BySize"))
		}
		for c in this.ConflictLst["H"] {
			;this.ConflictLst["H"][c] := Sort(this.ConflictLst["H"][c], Func("ByExH"))
			this.ConflictLst["H"][c] := Sort(this.ConflictLst["H"][c], Func("BySize"))
		}
	}
	
	IsExpander(c) {
		return c.exW || c.exH
	}
	
	IntercectXOne(lst, c) {
		for i, expander in lst {
			if(c.gridpos.__OverlapX(expander.gridpos)) {
				return true
			}
		}
		return false
	}
	
	IntercectYOne(lst, c) {
		for i, expander in lst {
			if(c.gridpos.__OverlapY(expander.gridpos)) {
				return true
			}
		}
		return false
	}
	
	IsInWidthConflictWithOne(obj, c) {
		for expander in lst {
			if(this.IsInWidthConflictWith(c, expander)) {
				return true
			}
		}
		return false
	}
	
	IsInHeightConflictWithOne(obj, c) {
		for expander in lst {
			if(this.IsInHeightConflictWith(c, expander)) {
				return true
			}
		}
		return false
	}
	
	IsInConflictWith(c1, c2) {
		return this.IsInWidthConflictWith(c1, c2) || this.IsInHeightConflictWith(c1, c2)
	}
	
	IsInWidthConflictWith(c1, c2) {
		return c1.exW && c2.exW && !c1.gridpos.__OverlapX(c2.gridpos)
	}
	
	IsInHeightConflictWith(c1, c2) {
		return c1.exH && c2.exH && !c1.gridpos.__OverlapY(c2.gridpos)
	}
}

BySize(pos) {
	z := Max(5 - Log(pos.Area()), 0)
	return AddZeros(z) pos.Area()
}

ByExW(c) {
	z := Max(5 - Log(c.exW), 0)
	return AddZeros(z) c.exW
}

ByExH(c) {
	z := Max(5 - Log(c.exH), 0)
	return AddZeros(z) c.exH
}

BySecoundValue(lst) {
	z := Max(5 - Log(lst[2]), 0)
	return AddZeros(z) lst[2]
}

AddZeros(z) {
	res := ""
	loop % z {
		res .= "0"
	}
	return res
}

Sort(obj, fun) {
	lst := {}
	for i, val in obj {
		key := fun.Call(val)
		if(!lst.HasKey(key)) {
			lst[key] := []
		}
		lst[key].Push(val)
	}
	
	sorted := []
	for i, list in lst {
		for i, val in list {
			sorted.Push(val)
		}
	}
	return sorted
}

ConverStObjToObjOfStr(obj) {
	conversion := {}
	if(!IsObject(obj)) {
		return obj
	}
	for i, v in obj {
		key := (IsObject(i) && i.__Class == Cell.__Class) ? i.gridpos.ToStr() : i
		val := (IsObject(v) && v.__Class == Cell.__Class) ? v.gridpos.ToStr() : v
		conversion[key] := ConverStObjToObjOfStr(val)
	}
	return conversion
}

prettyPrint(str) {
	return RegExReplace(RegExReplace(str, "\\n", "`t"), "\\t", "")
}

Class Columns {
	__New() {
		this.columns := {}
		this.__ResetConstants()
	}
	
	Add(c) {
		loop % c.gridpos.w {
			index := c.gridpos.x + A_Index - 1
			if(!this.columns.HasKey(index)) {
				this.columns[index] := new Column(index)
			}
			this.columns[index].Add(c)
		}
		this.__ResetConstants()
	}
	
	__ResetConstants() {
		this.minWidths := {}
		this.expanders := {}
		this.expandersMaxValue := {}
		this.nonExpanders := {}
		this.catched := False
	}
	
	CalculateConstants() {
		if(!this.catched) {
			for i, c in this.columns {
				this.minWidths[i] := c.GetMinWidth()
				this.expanders[i] := c.GetExpanders()
				this.expandersMaxValue[i] := c.GetExpanderMaxValue()
				this.nonExpanders[i] := c.GetNonExpanders()
			}
		}
		this.catched := True
	}
	
	GetMinWidth() {
		if(!this.catched) {
			this.CalculateConstants()
		}
		return __Sum(this.minWidths)
	}
	
	ReduceToGuiSize(widths, expandedWidths, sumExpandedWidths, excessWidth) {
		sortedExpWidths := Sort(expandedWidths, Func("BySecoundValue"))
		reduction := 0
		size := expandedWidths.Length()
		fixed := 0
		;MsgBox, % sumExpandedWidths " && " excessWidth " - " reduction "`n" Jxon_Dump(sortedExpWidths, 4)
		While(Round(sumExpandedWidths) > 0 && 0 < Round(excessWidth - reduction)) {
			;ToolTip, % (sumExpandedWidths > 0) " && " (0 < excessWidth - reduction)
			;MsgBox, % Jxon_Dump(sortedExpWidths, 4)
			;ToolTip, % sumExpandedWidths " && " excessWidth - reduction "`n" Jxon_Dump(sortedExpWidths, 4), , 17
			;MsgBox, % sumExpandedWidths " && " excessWidth " - " reduction "`n" Jxon_Dump(sortedExpWidths, 4)
			i := Min(A_Index, size)
			index := size - (i - 1)
			diff := Round(sortedExpWidths[index][2] - sortedExpWidths[index - 1][2], 3)
			if(index = 1 || diff * (i - fixed) > excessWidth - reduction) {
				diff := (excessWidth - reduction) / (i - fixed)
			}
			if(diff) {
				loop % i {
					current := sortedExpWidths[size - (A_Index - 1)]
					if(current[2] != current[3]) {
						if(current[2] - diff < current[3]) {
							reduction += current[3] - current[2]
							sumExpandedWidths -= current[3] - current[2]
							current[2] := current[3]
							
						} else {
							current[2] -= diff
							sumExpandedWidths -= diff
							reduction += diff
						}
					}
				}
			}
		}
		;MsgBox, % sumExpandedWidths " && " excessWidth " - " reduction "`n" Jxon_Dump(sortedExpWidths, 4)
		for i, expWidth in sortedExpWidths {
			widths[expWidth[1]] := expWidth[2]
		}
	}
	
	CalculateWidths(width, expanders, nonExpanders, expandersMaxValue) {
		widths := {}
		reserved := this.GetMinWidth()
		expandedWidths := []
		sumExpandedWidths := 0
		for i, c in this.columns {
			widths[i] := c.CalculateWidth(width - reserved, expanders, nonExpanders, expandersMaxValue)
			if(c.expanders && Round(widths[i] - c.GetMinWidth(), 3)) {
				expandedWidths.Push([i, widths[i], c.GetMinWidth()])
				sumExpandedWidths += widths[i]
			}
		}
		sum := __Sum(widths)
		if(sum > width) {
			this.ReduceToGuiSize(widths, expandedWidths, sumExpandedWidths, Round(sum - width))
		}
		return widths
	}
}


Class Rows {
	__New() {
		this.rows := {}
		this.__ResetConstants()
	}
	
	Add(c) {
		loop % c.gridpos.h {
			index := c.gridpos.y + A_Index - 1
			if(!this.rows.HasKey(index)) {
				this.rows[index] := new Row(index)
			}
			this.rows[index].Add(c)
		}
		this.__ResetConstants()
	}
	
	__ResetConstants() {
		this.minHeights := {}
		this.expanders := {}
		this.expandersMaxValue := {}
		this.nonExpanders := {}
		this.catched := False
	}
	
	CalculateConstants() {
		if(!this.catched) {
			for i, r in this.rows {
				this.minHeights[i] := r.GetMinHeight()
				this.expanders[i] := r.GetExpanders()
				this.expandersMaxValue[i] := r.GetExpanderMaxValue()
				this.nonExpanders[i] := r.GetNonExpanders()
			}
		}
		this.catched := True
	}
	
	GetMinHeight() {
		if(!this.catched) {
			this.CalculateConstants()
		}
		return __Sum(this.minHeights)
	}
	
	ReduceToGuiSize(heights, expandedHeights, sumExpandedHeights, excessHeight) {
		sortedExpHeights := Sort(expandedHeights, Func("BySecoundValue"))
		reduction := 0
		size := sortedExpHeights.Length()
		fixed := 0
		While(Round(sumExpandedHeights) > 0 && 0 < Round(excessHeight - reduction)) {
			;MsgBox, % Jxon_Dump(sortedExpHeights, 4)
			;MsgBox, % sumExpandedHeights " && " excessHeight " - " reduction "`n" Jxon_Dump(sortedExpHeights, 4)
			i := Min(A_Index, size)
			index := size - (i - 1)
			diff := Round(sortedExpHeights[index][2] - sortedExpHeights[index - 1][2], 3)
			if(index = 1 || diff * (i - fixed) > excessHeight - reduction) {
				diff := (excessHeight - reduction) / (i - fixed)
			}
			if(diff) {
				loop % i {
					current := sortedExpHeights[size - (A_Index - 1)]
					if(current[2] != current[3]) {
						if(current[2] - diff < current[3]) {
							reduction += current[3] - current[2]
							sumExpandedHeights -= current[3] - current[2]
							current[2] := current[3]
							
						} else {
							current[2] -= diff
							sumExpandedHeights -= diff
							reduction += diff
						}
					}
				}
			}
		}
		for i, expHeight in sortedExpHeights {
			heights[expHeight[1]] := expHeight[2]
		}
	}
	
	CalculateHeights(height, expanders, nonExpanders, expandersMaxValue) {
		heights := {}
		reserved := this.GetMinHeight()
		expandedHeights := []
		sumExpandedHeights := 0
		for i, r in this.rows {
			heights[i] := r.CalculateHeight(height - reserved, expanders, nonExpanders, expandersMaxValue)
			if(r.expanders && Round(heights[i] - r.GetMinHeight(), 3)) {
				expandedHeights.Push([i, heights[i], r.GetMinHeight()])
				sumExpandedHeights += heights[i]
			}
		}
		sum := __Sum(heights)
		if(sum > height) {
			this.ReduceToGuiSize(heights, expandedHeights, sumExpandedHeights, Round(sum - height))
		}
		return heights
	}
}




Class Column {
	__New(index) {
		this.index := index
		this.cells := {}
		this.__ResetConstants()
	}
	
	Add(c) {
		this.cells[c.gridpos.y] := c
		this.__ResetConstants()
	}
	
	CalculateConstants() {
		for i, c in this.cells {
			this.__CalculateMinWidth(c)
			this.__CalculateExpanders(c)
			this.__CalculateNonExpanders(c)
			this.__CalculateConfligtingExpanders(c)
		}
		this.catched := True
	}
	
	__ResetConstants() {
		this.minWidth := 0
		this.expanders := 0
		this.expanderMaxValue := 0
		this.nonExpanders := 0
		this.catched := False
		this.confligtingExpanders := {}
	}
	
	__CalculateMinWidth(c) {
		w := c.GetNeededWidth()
		if(this.minWidth < w) {
			this.minWidth := w
		}
	}
	
	__CalculateExpanders(c) {
		expValue := c.GetExpansionWidthValue()
		this.expanders += expValue
		if(this.expanderMaxValue < expValue) {
			this.expanderMaxValue := expValue
		}
	}
	
	__CalculateNonExpanders(c) {
		if(!c.exW) {
			this.nonExpanders++
		}
	}
	
	__CalculateConfligtingExpanders(c) {
		if(c.hasWConfligts) {
			key := Format("#{:05}", c.gridpos.area())
			if(!this.confligtingExpanders.HasKey(key)) {
				this.confligtingExpanders[key] := []
			}
			this.confligtingExpanders[key].Push(c)
		}
	}
	
	GetMinWidth() {
		if(!this.catched) {
			this.CalculateConstants()
		}
		return this.minWidth
	}
	
	GetExpanders() {
		if(!this.catched) {
			this.CalculateConstants()
		}
		return this.expanders
	}
	
	GetExpanderMaxValue() {
		if(!this.catched) {
			this.CalculateConstants()
		}
		return this.expanderMaxValue
	}
	
	GetNonExpanders() {
		if(!this.catched) {
			this.CalculateConstants()
		}
		return this.nonExpanders
	}
	
	CalculateWidth(width, expanders, nonExpanders, expandersMaxValue) {
		maxWidth := this.minWidth
		/*
		smallestConExpW := width
		for key, cExpandersWithArear in this.confligtingExpanders {
			for i, confligtingExpander in cExpandersWithArear {
				w := confligtingExpander.GetExpandedWidth(this.index, width, expanders, nonExpanders, expandersMaxValue)
				if(w && smallestConExpW > w) {
					smallestConExpW := w
				}
			}
		}
		if(smallestConExpW != width) {
			return smallestConExpW
		}
		*/
		for i, c in this.cells {
			if(c.exW) {
				w := this.GetMinWidth() + c.GetExpandedWidth(this.index, width, expanders, nonExpanders, expandersMaxValue)
				if(maxWidth < w) {
					maxWidth := w
				}
			}
		}
		return maxWidth
	}
}

Class Row {
	__New(index) {
		this.index := index
		this.cells := {}
		this.__ResetConstants()
	}
	
	Add(c) {
		this.cells[c.gridpos.x] := c
		this.__ResetConstants()
	}
	
	CalculateConstants() {
		for i, c in this.cells {
			this.__CalculateMinHeight(c)
			this.__CalculateExpanders(c)
			this.__CalculateNonExpanders(c)
			this.__CalculateConfligtingExpanders(c)
		}
		this.catched := True
	}
	
	__ResetConstants() {
		this.minHeight := 0
		this.expanders := 0
		this.expanderMaxValue := 0
		this.nonExpanders := 0
		this.catched := False
		this.confligtingExpanders := {}
	}
	
	__CalculateMinHeight(c) {
		w := c.GetNeededHeight()
		if(this.minHeight < w) {
			this.minHeight := w
		}
	}
	
	__CalculateExpanders(c) {
		expValue := c.GetExpansionHeightValue()
		this.expanders += expValue
		if(this.expanderMaxValue < expValue) {
			this.expanderMaxValue := expValue
		}
	}
	
	__CalculateNonExpanders(c) {
		if(!c.exH) {
			this.nonExpanders++
		}
	}
	
	__CalculateConfligtingExpanders(c) {
		if(c.hasHConfligts) {
			key := Format("{:05}", c.gridpos.area())
			if(!this.confligtingExpanders.HasKey(key)) {
				this.confligtingExpanders[key] := []
			}
			this.confligtingExpanders[key].Push(c)
		}
	}
	
	GetMinHeight() {
		if(!this.catched) {
			this.CalculateConstants()
		}
		return this.minHeight
	}
	
	GetExpanders() {
		if(!this.catched) {
			this.CalculateConstants()
		}
		return this.expanders
	}
	
	GetExpanderMaxValue() {
		if(!this.catched) {
			this.CalculateConstants()
		}
		return this.expanderMaxValue
	}
	
	GetNonExpanders() {
		if(!this.catched) {
			this.CalculateConstants()
		}
		return this.nonExpanders
	}
	
	CalculateHeight(height, expanders, nonExpanders, expandersMaxValue) {
		maxHeight := this.minHeight
		/*
		smallestConExpH := height
		for key, cExpandersWithArear in this.confligtingExpanders {
			for i, confligtingExpander in cExpandersWithArear {
				h := confligtingExpander.GetExpandedHeight(this.index, height, expanders, nonExpanders, expandersMaxValue)
				if(h && smallestConExpH > h) {
					smallestConExpH := h
				}
			}
		}
		if(smallestConExpH != height) {
			return smallestConExpH
		}
		*/
		for i, c in this.cells {
			if(c.exH) {
				h := this.GetMinHeight() + c.GetExpandedHeight(this.index, height, expanders, nonExpanders, expandersMaxValue)
				if(maxHeight < h) {
					maxHeight := h
				}
			}
		}
		return maxHeight
	}
}

Class ExpanderDescriptor {
	__New(c) {
		this.gridpos := c.gridpos
		this.exW := c.exW
		this.exH := c.exH
	}
	
	IsInWidthConflictWith(c) {
		return this.exW && c.exW && this.gridpos.__OverlapY(c.gridpos)
	}
	
	IsInHeightConflictWith(c) {
		return this.exH && c.exH && this.gridpos.__OverlapX(c.gridpos)
	}
}


Class Cell {
	__New(pos, ctrl, exW := 0, exH := 0, fillW := 0, fillH := 0, justify := "C", borderX := 5, borderY := 5) {
		this.gridpos := pos
		this.ctrl := ctrl
		this.exW := exW
		this.exH := exH
		this.fillW := fillW
		this.fillH := fillH
		this.justifyOptions := justify
		this.borderX := borderX
		this.borderY := borderY
		this.cPos := this.ctrl.ControlGetPos()
		this.pos := this.ctrl.ControlGetPos()
		;this.ctrl.callback := ObjBindMethod(this, "ToolTip")
		this.othersW := 0
		this.othersH := 0
		this.hasWConfligts := false
		this.hasHConfligts := false
	}
	
	GetNeededHeight() {
		return this.exH || this.fillH ? 0 : (this.cPos.h + this.borderY * 2) / this.gridpos.h
	}
	
	GetNeededWidth() {
		return this.exW || this.fillW ? 0 : (this.cPos.w + this.borderX * 2) / this.gridpos.w
	}
	
	GetExpansionWidthValue() {
		return this.exW ;/ this.gridpos.w
	}
	
	GetExpansionHeightValue() {
		return this.exH ;/ this.gridpos.h
	}
	
	GetExpandedWidth(index, width, expanders, nonExpanders, expandersMaxValue) {
		if(index != this.__FindLeastUsedRowColumn(this.gridpos.w, this.gridpos.x, nonExpanders, expanders)) {
			return 0
		}
		others := this.__GetOtherExpanders(this.gridpos.x, this.gridpos.x + this.gridpos.w - 1, expandersMaxValue)
		;others := __Sum(expanders) - this.exW
		if(this.exW) {
			;CoordMode, ToolTip, Screen
			;ToolTip, % Util_ObjectToString(expanders) "`n" others "`n" (width / ((others + this.exW) / this.exW)) / this.gridpos.w, 0, 0, 2
			;MsgBox, % Util_ObjectToString(expanders) "`n" Util_ObjectToString(expandersMaxValue) "`n" others "`n" this.exW "`n" width / ((others + this.exW) / (this.exW))
			;MsgBox, % Util_ObjectToString(expanders) "`n" Util_ObjectToString(expandersMaxValue) "`n" this.othersW "`n" this.exW "`n" width * this.exW / (this.othersW + this.exW)
		}
		;return width / ((others + this.exW * this.gridpos.w) / (this.exW * this.gridpos.w))
		return width * this.exW / (this.othersW + this.exW)
	}
	
	GetExpandedHeight(index, height, expanders, nonExpanders, expandersMaxValue) {
		if(index != this.__FindLeastUsedRowColumn(this.gridpos.h, this.gridpos.y, nonExpanders, expanders)) {
			return 0
		}
		others := this.__GetOtherExpanders(this.gridpos.y, this.gridpos.y + this.gridpos.h - 1, expandersMaxValue)
		;others := __Sum(expanders) - this.exH
		if(this.exH) {
			;CoordMode, ToolTip, Screen
			;ToolTip, % Util_ObjectToString(expanders) "`n" others "`n" (height / ((others + this.exH) / this.exH)) / this.gridpos.h, 0, 0, 2
			;MsgBox, % Util_ObjectToString(expanders) "`n" others "`n" this.exH * this.gridpos.h "`n" height / ((others + this.exH * this.gridpos.h) / (this.exH * this.gridpos.h))
			;MsgBox, % Util_ObjectToString(expanders) "`n" others "`n" this.exH "`n" height / ((others + this.exH) / (this.exH))
			;MsgBox, % Util_ObjectToString(expanders) "`n" Util_ObjectToString(expandersMaxValue) "`n" this.othersH "`n" this.exH "`n" height * this.exH / (this.othersH + this.exH)
		}
		;return height / ((others + this.exH * this.gridpos.h) / (this.exH * this.gridpos.h))
		return height * this.exH / (this.othersH + this.exH)
	}
	
	__GetOtherExpanders(start, end, expanders) {
		others := 0
		
		for i, e in expanders {
			if(i < start || i > end) {
				others += e
				;others += (e ? 1 : 0)
			}
		}
		return others
	}
	
	__FindLeastUsedRowColumn(size, start, nonExpanders, expanders) {
		smallest := nonExpanders[start]
		index := start
		loop % size - 1 {
			i := start + A_Index
			if(nonExpanders[i] < smallest) {
				smallest := nonExpanders[i]
				index := i
			}
		}
		
		largest := expanders[start]
		loop % size - 1 {
			i := start + A_Index
			if(nonExpanders[i] = smallest && expanders[i] > largest) {
				largest := expanders[i]
				index := i
			}
		}
		return index
	}
	
	SetArea(widths, heights) {
		this.pos := new Position(0, 0, 0, 0)
		this.pos.x := this.__Sum(widths, 1, this.gridpos.x - 1)
		this.pos.y := this.__Sum(heights, 1, this.gridpos.y - 1)
		this.pos.w := this.__Sum(widths, this.gridpos.x, this.gridpos.x + this.gridpos.w - 1)
		this.pos.h := this.__Sum(heights, this.gridpos.y, this.gridpos.y + this.gridpos.h - 1)
	}
	
	__Sum(obj, start, end) {
		val := 0
		loop % end - start + 1  {
			val += obj[start + A_Index - 1]
		}
		return val
	}
	
	Update() {
		this.ctrl.Draw(this.Justify(this.pos, this.SetSize(this.pos)))
	}
	
	SetSize(pos) {
		w := this.exW || this.fillW ? pos.w - this.borderX * 2 : this.cPos.w
		h := this.exH || this.fillH ? pos.h - this.borderY * 2 : this.cPos.h
		
		;w := pos.w - this.border
		;h := pos.h - this.border
		return new Position(this.pos.x, this.pos.y, w, h)
	}
	
	Center(area, pos) {
		dw := (area.w - pos.w) // 2
		dh := (area.h - pos.h) // 2
		;MsgBox, % new Position(this.pos.x + dw, this.pos.y + dh, this.cPos.w, this.cPos.h).ToStr()
		return new Position(area.x + dw, area.y + dh, pos.w, pos.h)
	}
	
	Justify(area, pos) {
		jpos := new Position(area.x, area.y, pos.w, pos.h)
		if(InStr(this.justifyOptions, "C")) {
			jpos := this.Center(area, pos)
		}
		if(InStr(this.justifyOptions, "N")) {
			jpos.y := area.y + this.borderY
		}
		if(InStr(this.justifyOptions, "E")) {
			jpos.x := area.x + area.w - pos.w - this.borderX
		}
		if(InStr(this.justifyOptions, "W")) {
			jpos.x := area.x + this.borderX
		}
		if(InStr(this.justifyOptions, "S")) {
			jpos.y := area.y + area.h - pos.h - this.borderY
		}
		return jpos
	}
	
	ToolTip() {
		ToolTip, % this.ToStr2()
	}
	
	ToStr2(indent := "") {
		return indent "GridPos:`n" this.gridpos.ToStr(indent "`t") "`n" indent "Pos:`n" this.pos.ToStr(indent "`t") "`n" indent "Type:`t" this.ctrl.type "`n" indent "Expand W:`t" this.exW "`n" indent "Expand H:`t" this.exH "`n" indent "OtherExp W:`t" this.othersW "`n" indent "OtherExp H:`t" this.othersH 
	}
	
	ToStr(indent := "") {
		return indent "GridPos:`n" this.gridpos.ToStr()
	}
}

__Sum(obj) {
	val := 0
	for i, v in obj {
		val += v
	}
	return val
}

