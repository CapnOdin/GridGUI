
#Include %A_LineFile%\..\Controls.ahk

Class Grid {
	__New() {
		this.cells := []
		this.arbitrator := new GridGUI.ExpanderArbitrator()
		this.rows := new GridGUI.Rows()
		this.columns := new GridGUI.Columns()
		this.ResetConstants()
	}
	
	AddCell(c) { ; adds the cell to all positionts it spands over
		local pre
		Critical
		pre := A_BatchLines
		SetBatchLines, -1
		this.cells.Push(c)
		this.arbitrator.Add(c)
		this.columns.Add(c)
		this.rows.Add(c)
		SetBatchLines, % pre
		Critical Off
	}
	
	RemoveCell(c) {
		local pre, index, i, cell
		Critical
		pre := A_BatchLines
		SetBatchLines, -1
		index := GridGUI.Util.FindIndex(this.cells, c)
		if(index) {
			this.columns.Remove(c)
			this.rows.Remove(c)
			this.arbitrator.Remove(c)
			this.cells.RemoveAt(index)
		}
		SetBatchLines, % pre
		Critical Off
	}
	
	GetMinWidth() {
		return this.columns.GetMinWidth()
	}
	
	GetMinHeight() {
		return this.rows.GetMinHeight()
	}
	
	ResetConstants() {
		local i, c, r
		this.widths := []
		this.heights := []
		for i, c in this.columns.columns {
			c.__ResetConstants()
		}
		for i, r in this.rows.rows {
			r.__ResetConstants()
		}
		this.columns.__ResetConstants()
		this.rows.__ResetConstants()
		this.arbitrator.IsReduced := False
	}
	
	CalculatePositions(area) {
		local pre, i, c
		pre := A_BatchLines
		SetBatchLines, -1
		this.arbitrator.ReCalculate() ; should not be done here
		this.widths := this.columns.CalculateWidths(area.w, this.columns.expanders, this.columns.nonExpanders)
		this.heights := this.rows.CalculateHeights(area.h, this.rows.expanders, this.rows.nonExpanders)
		
		for i, c in this.cells {
			c.SetArea(area, this.widths, this.heights)
			c.Update()
		}
		SetBatchLines, % pre
	}
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
			this.Init(c)
			this.InitCheck(c)
			this.Expanders.Push(c)
			this.IsReduced := false
		}
	}
	
	Remove(c) {
		if(this.IsExpander(c)) {
			this.UnInitCheck(c)
			this.UnInit(c)
			GridGUI.Util.RemoveValue(this.Expanders, c)
			this.IsReduced := false
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
		local i, expander
		for i, expander in this.Expanders {
			this.CheckOverlapping(c, expander)
			this.CheckConflicts(c, expander)
			;this.Update(c)
		}
	}
	
	UnInit(c) {
		this.Overlapping["W"].Delete(c)
		this.Overlapping["H"].Delete(c)
		this.ReducedConflict["W"].Delete(c)
		this.ReducedConflict["H"].Delete(c)
		this.ConflictLst["W"].Delete(c)
		this.ConflictLst["H"].Delete(c)
		this.ConflictMap["W"].Delete(c)
		this.ConflictMap["H"].Delete(c)
		this.Ignore["W"].Delete(c)
		this.Ignore["H"].Delete(c)
	}
	
	UnInitCheck(c) {
		for i, cell in this.ConflictLst["W"][c] {
			GridGUI.Util.RemoveValue(this.ConflictLst["W"][cell], c)
			this.ConflictMap["W"][cell].Delete(c)
		}
		for i, cell in this.ConflictLst["H"][c] {
			GridGUI.Util.RemoveValue(this.ConflictLst["H"][cell], c)
			this.ConflictMap["H"][cell].Delete(c)
		}
		for cell in this.Overlapping["W"][c] {
			this.Overlapping["W"][cell].Delete(c)
		}
		for cell in this.Overlapping["H"][c] {
			this.Overlapping["H"][cell].Delete(c)
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
		local c, expanders, i, expander, reduced
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
		local expander, exW, exH
		for expander, exW in this.ReducedConflict["W"][c] {
			c.othersW += exW
		}
		
		for expander, exH in this.ReducedConflict["H"][c] {
			c.othersH += exH
		}
	}
	
	ReCalculate() {
		local i, expander
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
			res .= "ReducedConflict:`n"
			res .= Jxon_Dump(GridGUI.Util.ConvertStObjToObjOfStr(this.ReducedConflict), 4)
			res .= "`nExpanders:`n"
			res .= Jxon_Dump(GridGUI.Util.ConvertStObjToObjOfStr(this.Expanders), 4)
			FileOpen("output" counter++ ".json", "w").Write(GridGUI.Util.prettyPrint(res))
			*/
		}
	}
	
	SortConflicts() {
		local c
		Static sortBySize := ObjBindMethod(GridGUI.Util, "BySize")
		for c in this.ConflictLst["W"] {
			;MsgBox, % GridGUI.Util.prettyPrint(Jxon_Dump(GridGUI.Util.ConvertStObjToObjOfStr(this.ConflictLst["W"][c])) "`n`n" Jxon_Dump(GridGUI.Util.ConvertStObjToObjOfStr((Sort(this.ConflictLst["W"][c], ObjBindMethod(GridGUI.Util, "BySize"))))))
			;this.ConflictLst["W"][c] := GridGUI.Util.Sort(this.ConflictLst["W"][c], ObjBindMethod(GridGUI.Util, "ByExW"))
			this.ConflictLst["W"][c] := GridGUI.Util.Sort(this.ConflictLst["W"][c], sortBySize)
		}
		for c in this.ConflictLst["H"] {
			;this.ConflictLst["H"][c] := GridGUI.Util.Sort(this.ConflictLst["H"][c], ObjBindMethod(GridGUI.Util, "ByExH"))
			this.ConflictLst["H"][c] := GridGUI.Util.Sort(this.ConflictLst["H"][c], sortBySize)
		}
	}
	
	IsExpander(c) {
		return c.exW || c.exH
	}
	
	IsInWidthConflictWith(c1, c2) {
		return c1.exW && c2.exW && !c1.gridpos.__OverlapX(c2.gridpos)
	}
	
	IsInHeightConflictWith(c1, c2) {
		return c1.exH && c2.exH && !c1.gridpos.__OverlapY(c2.gridpos)
	}
}

Class Columns {
	__New() {
		this.columns := {}
		this.__ResetConstants()
	}
	
	Add(c) {
		local index
		loop % c.gridpos.w {
			index := c.gridpos.x + A_Index - 1
			if(!this.columns.HasKey(index)) {
				this.columns[index] := new GridGUI.Column(index)
			}
			this.columns[index].Add(c)
		}
		this.__ResetConstants()
	}
	
	Remove(c) {
		local index
		loop % c.gridpos.w {
			index := c.gridpos.w + c.gridpos.x - A_Index
			if(this.columns.HasKey(index)) {
				this.columns[index].Remove(c)
				if(!this.columns[index].cells.Count()) {
					this.columns.Delete(index)
				}
			}
		}
		this.__ResetConstants()
	}
	
	__ResetConstants() {
		this.fixedWidths := {}
		this.minWidths := {}
		this.expanders := {}
		this.expandersMaxValue := {}
		this.nonExpanders := {}
		this.catched := False
	}
	
	CalculateConstants() {
		local i, c
		if(!this.catched) {
			for i, c in this.columns {
				this.fixedWidths[i] := c.GetFixedWidth()
				this.minWidths[i] := c.GetMinWidth()
				this.expanders[i] := c.GetExpanders()
				this.expandersMaxValue[i] := c.GetExpanderMaxValue()
				this.nonExpanders[i] := c.GetNonExpanders()
			}
			;MsgBox, % "Min:`n" Jxon_Dump(this.minWidths, 4) "`n`n" "Fixed:`n" Jxon_Dump(this.fixedWidths, 4)
		}
		this.catched := True
	}
	
	GetFixedWidth() {
		if(!this.catched) {
			this.CalculateConstants()
		}
		return GridGUI.Util.Sum(this.fixedWidths)
	}
	
	GetMinWidth() {
		if(!this.catched) {
			this.CalculateConstants()
		}
		return GridGUI.Util.Sum(this.minWidths)
	}
	
	ReduceToGuiSize(widths, expandedWidths, sumExpandedWidths, excessWidth) {
		local sortedExpWidths, reduction, size, fixed, stuck, index, diff, current, i, expWidth
		Static sortBySecoundValue := ObjBindMethod(GridGUI.Util, "BySecoundValue")
		sortedExpWidths := GridGUI.Util.Sort(expandedWidths, sortBySecoundValue)
		reduction := 0
		size := expandedWidths.Length()
		fixed := 0
		stuck := 0
		;MsgBox, % sumExpandedWidths " && " excessWidth " - " reduction "`n" Jxon_Dump(sortedExpWidths, 4)
		While(Round(sumExpandedWidths) > 0 && 0 < Round(excessWidth - reduction) && stuck != size) {
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
				stuck := 0
				loop % i {
					current := sortedExpWidths[size - (A_Index - 1)]
					if(current[2] != current[3]) {
						if(current[2] - diff < current[3]) {
							reduction += current[2] - current[3]
							sumExpandedWidths -= current[3] - current[2]
							current[2] := current[3]
							
						} else {
							current[2] -= diff
							sumExpandedWidths -= diff
							reduction += diff
						}
					} else {
						stuck += 1
					}
				}
			}
		}
		;MsgBox, % sumExpandedWidths " && " excessWidth " - " reduction "`n" Jxon_Dump(sortedExpWidths, 4)
		for i, expWidth in sortedExpWidths {
			widths[expWidth[1]] := Max(expWidth[2], expWidth[3])
		}
	}
	
	CalculateWidths(width, expanders, nonExpanders) {
		local widths, reserved, expandedWidths, sumExpandedWidths, i, c, sum
		widths := {}
		reserved := this.GetFixedWidth()
		expandedWidths := []
		sumExpandedWidths := 0
		for i, c in this.columns {
			widths[i] := c.CalculateWidth(width - reserved, expanders, nonExpanders)
			if(c.expanders && Round(widths[i] - c.GetFixedWidth(), 3)) {
				;if(widths[i] > c.GetMinWidth()) {
					expandedWidths.Push([i, widths[i], c.GetMinWidth()])
					sumExpandedWidths += widths[i] - c.GetMinWidth()
				;} else {
				;	widths[i] := c.GetMinWidth()
				;}
			}
		}
		sum := GridGUI.Util.Sum(widths)
		if(sum > width) {
			this.ReduceToGuiSize(widths, expandedWidths, sumExpandedWidths, Round(sum - width))
		}
		;MsgBox, % "Min:`n" Jxon_Dump(this.minWidths, 4) "`n`n" "Fixed:`n" Jxon_Dump(this.fixedWidths, 4)  "`n`n" "Widths:`n" Jxon_Dump(widths, 4)
		return widths
	}
}


Class Rows {
	__New() {
		this.rows := {}
		this.__ResetConstants()
	}
	
	Add(c) {
		local index
		loop % c.gridpos.h {
			index := c.gridpos.y + A_Index - 1
			if(!this.rows.HasKey(index)) {
				this.rows[index] := new GridGUI.Row(index)
			}
			this.rows[index].Add(c)
		}
		this.__ResetConstants()
	}
	
	Remove(c) {
		local index
		loop % c.gridpos.h {
			index := c.gridpos.h + c.gridpos.y - A_Index
			;MsgBox, % c.gridpos.ToStr() "`n`n" index
			if(this.rows.HasKey(index)) {
				this.rows[index].Remove(c)
				if(!this.rows[index].cells.Count()) {
					this.rows.Delete(index)
				}
			}
		}
		this.__ResetConstants()
	}
	
	__ResetConstants() {
		this.fixedHeights := {}
		this.minHeights := {}
		this.expanders := {}
		this.expandersMaxValue := {}
		this.nonExpanders := {}
		this.catched := False
	}
	
	CalculateConstants() {
		local i, r
		if(!this.catched) {
			for i, r in this.rows {
				this.fixedHeights[i] := r.GetFixedHeight()
				this.minHeights[i] := r.GetMinHeight()
				this.expanders[i] := r.GetExpanders()
				this.expandersMaxValue[i] := r.GetExpanderMaxValue()
				this.nonExpanders[i] := r.GetNonExpanders()
			}
			;MsgBox, % "Min:`n" Jxon_Dump(this.minHeights, 4) "`n`n" "Fixed:`n" Jxon_Dump(this.fixedHeights, 4)
		}
		this.catched := True
	}
	
	GetFixedHeight() {
		if(!this.catched) {
			this.CalculateConstants()
		}
		return GridGUI.Util.Sum(this.fixedHeights)
	}
	
	GetMinHeight() {
		if(!this.catched) {
			this.CalculateConstants()
		}
		return GridGUI.Util.Sum(this.minHeights)
	}
	
	ReduceToGuiSize(heights, expandedHeights, sumExpandedHeights, excessHeight) {
		local sortedExpHeights, reduction, size, fixed, stuck, index, diff, current, i, expHeight
		Static sortBySecoundValue := ObjBindMethod(GridGUI.Util, "BySecoundValue")
		sortedExpHeights := GridGUI.Util.Sort(expandedHeights, sortBySecoundValue)
		reduction := 0
		size := sortedExpHeights.Length()
		fixed := 0
		stuck := 0
		While(Round(sumExpandedHeights) > 0 && 0 < Round(excessHeight - reduction) && stuck != size) {
			;MsgBox, % Jxon_Dump(sortedExpHeights, 4)
			;MsgBox, % sumExpandedHeights " && " excessHeight " - " reduction "`n" Jxon_Dump(sortedExpHeights, 4)
			i := Min(A_Index, size)
			index := size - (i - 1)
			diff := Round(sortedExpHeights[index][2] - sortedExpHeights[index - 1][2], 3)
			if(index = 1 || diff * (i - fixed) > excessHeight - reduction) {
				diff := (excessHeight - reduction) / (i - fixed)
			}
			if(diff) {
				stuck := 0
				loop % i {
					current := sortedExpHeights[size - (A_Index - 1)]
					if(current[2] != current[3]) {
						if(current[2] - diff < current[3]) {
							reduction += current[2] - current[3]
							sumExpandedHeights -= current[3] - current[2]
							current[2] := current[3]
							
						} else {
							current[2] -= diff
							sumExpandedHeights -= diff
							reduction += diff
						}
					} else {
						stuck += 1
					}
				}
			}
		}
		for i, expHeight in sortedExpHeights {
			heights[expHeight[1]] := Max(expHeight[2], expHeight[3])
		}
	}
	
	CalculateHeights(height, expanders, nonExpanders) {
		local heights, reserved, expandedHeights, sumExpandedHeights, i, r, sum
		heights := {}
		reserved := this.GetFixedHeight()
		expandedHeights := []
		sumExpandedHeights := 0
		for i, r in this.rows {
			heights[i] := r.CalculateHeight(height - reserved, expanders, nonExpanders)
			if(r.expanders && Round(heights[i] - r.GetFixedHeight(), 3)) {
				;if(heights[i] >  r.GetMinHeight()) {
					expandedHeights.Push([i, heights[i], r.GetMinHeight()])
					sumExpandedHeights += heights[i] - r.GetMinHeight()
				;} else {
				;	heights[i] := r.GetMinHeight()
				;}
			}
		}
		sum := GridGUI.Util.Sum(heights)
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
		if(!this.cells.HasKey(c.gridpos.y)) {
			this.cells[c.gridpos.y] := []
		}
		this.cells[c.gridpos.y].Push(c)
		this.__ResetConstants()
	}
	
	Remove(c) {
		local i, cell
		if(this.cells.HasKey(c.gridpos.y)) {
			GridGUI.Util.RemoveValue(this.cells[c.gridpos.y], c)
			if(!this.cells[c.gridpos.y].Count()) {
				this.cells.Delete(c.gridpos.y)
			}
		}
		this.__ResetConstants()
	}
	
	CalculateConstants() {
		local i, overlappinCells, c
		for i, overlappinCells in this.cells {
			for i, c in overlappinCells {
				this.__CalculateFixedWidth(c)
				this.__CalculateMinWidth(c)
				this.__CalculateExpanders(c)
				this.__CalculateNonExpanders(c)
				this.__CalculateConfligtingExpanders(c)
			}
		}
		this.catched := True
	}
	
	__ResetConstants() {
		this.fixedWidth := 0
		this.minWidth := 0
		this.expanders := 0
		this.expanderMaxValue := 0
		this.nonExpanders := 0
		this.catched := False
		this.confligtingExpanders := {}
	}
	
	__CalculateFixedWidth(c) {
		local w
		w := c.GetFixedWidth()
		if(this.fixedWidth < w) {
			this.fixedWidth := w
		}
	}
	
	__CalculateMinWidth(c) {
		local w
		w := c.GetNeededWidth()
		if(this.minWidth < w) {
			this.minWidth := w
		}
	}
	
	__CalculateExpanders(c) {
		local expValue
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
		local key
		if(c.hasWConfligts) {
			key := Format("#{:05}", c.gridpos.area())
			if(!this.confligtingExpanders.HasKey(key)) {
				this.confligtingExpanders[key] := []
			}
			this.confligtingExpanders[key].Push(c)
		}
	}
	
	GetFixedWidth() {
		if(!this.catched) {
			this.CalculateConstants()
		}
		return this.fixedWidth
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
	
	CalculateWidth(width, expanders, nonExpanders) {
		local maxWidth, i, overlappinCells, c, w
		maxWidth := this.fixedWidth
		for i, overlappinCells in this.cells {
			for i, c in overlappinCells {
				if(c.exW) {
					w := this.GetFixedWidth() + c.GetExpandedWidth(this.index, width, expanders, nonExpanders)
					if(maxWidth < w) {
						maxWidth := w
					}
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
		if(!this.cells.HasKey(c.gridpos.x)) {
			this.cells[c.gridpos.x] := []
		}
		this.cells[c.gridpos.x].Push(c)
		this.__ResetConstants()
	}
	
	Remove(c) {
		local i, cell
		if(this.cells.HasKey(c.gridpos.x)) {
			GridGUI.Util.RemoveValue(this.cells[c.gridpos.x], c)
			if(!this.cells[c.gridpos.x].Count()) {
				this.cells.Delete(c.gridpos.x)
			}
		}
		this.__ResetConstants()
	}
	
	CalculateConstants() {
		local i, overlappinCells, c
		for i, overlappinCells in this.cells {
			for i, c in overlappinCells {
				this.__CalculateFixedHeight(c)
				this.__CalculateMinHeight(c)
				this.__CalculateExpanders(c)
				this.__CalculateNonExpanders(c)
				this.__CalculateConfligtingExpanders(c)
			}
		}
		this.catched := True
	}
	
	__ResetConstants() {
		this.fixedHeight := 0
		this.minHeight := 0
		this.expanders := 0
		this.expanderMaxValue := 0
		this.nonExpanders := 0
		this.catched := False
		this.confligtingExpanders := {}
	}
	
	__CalculateFixedHeight(c) {
		local h
		h := c.GetFixedHeight()
		if(this.fixedHeight < h) {
			this.fixedHeight := h
		}
	}
	
	__CalculateMinHeight(c) {
		local h
		h := c.GetNeededHeight()
		if(this.minHeight < h) {
			this.minHeight := h
		}
	}
	
	__CalculateExpanders(c) {
		local expValue
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
		local key
		if(c.hasHConfligts) {
			key := Format("{:05}", c.gridpos.area())
			if(!this.confligtingExpanders.HasKey(key)) {
				this.confligtingExpanders[key] := []
			}
			this.confligtingExpanders[key].Push(c)
		}
	}
	
	GetFixedHeight() {
		if(!this.catched) {
			this.CalculateConstants()
		}
		return this.fixedHeight
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
	
	CalculateHeight(height, expanders, nonExpanders) {
		local maxHeight, i, overlappinCells, c, h
		maxHeight := this.fixedHeight
		for i, overlappinCells in this.cells {
			for i, c in overlappinCells {
				if(c.exH) {
					h := this.GetFixedHeight() + c.GetExpandedHeight(this.index, height, expanders, nonExpanders)
					if(maxHeight < h) {
						maxHeight := h
					}
				}
			}
		}
		return maxHeight
	}
}

Class Cell {
	__New(pos, ctrl, exW := 0, exH := 0, fillW := false, fillH := false, justify := "C", borderX := 5, borderY := 5) {
		this.gridpos := pos
		this.ctrl := ctrl
		this.exW := exW
		this.exH := exH
		this.fillW := fillW
		this.fillH := fillH
		this.justifyOptions := justify
		this.borderX := borderX
		this.borderY := borderY
		this.ctrlInitialPos := this.ctrl.ControlGetPos()
		this.ctrlPos := this.ctrlInitialPos.Copy()
		this.pos := this.ctrlInitialPos.Copy()
		;this.ctrl.callback := ObjBindMethod(this, "ToolTip")
		this.othersW := 0
		this.othersH := 0
		this.hasWConfligts := false
		this.hasHConfligts := false
	}
	
	GetFixedHeight() {
		;return this.exH || this.fillH ? (this.ctrl.initialHeight ? (this.ctrl.initialHeightVal + (this.ctrl.initialHeightVal ? this.borderY * 2 : 0)) / this.gridpos.h : 0) : ((this.ctrl.initialHeight ? this.ctrl.initialHeightVal : this.ctrlInitialPos.h) + this.borderY * 2) / this.gridpos.h
		if(this.exH || this.fillH) {
			if(this.ctrl.initialHeight) {
				return (this.ctrl.initialHeightVal + (this.ctrl.initialHeightVal ? this.borderY * 2 : 0)) / this.gridpos.h
			}
			return 0
		}
		return ((this.ctrl.initialHeight ? this.ctrl.initialHeightVal : this.ctrlInitialPos.h) + this.borderY * 2) / this.gridpos.h
	}
	
	GetFixedWidth() {
		;return this.exW || this.fillW ? (this.ctrl.initialWidth ? (this.ctrl.initialWidthVal + (this.ctrl.initialWidthVal ? this.borderX * 2 : 0)) / this.gridpos.w : 0) : ((this.ctrl.initialWidth ? this.ctrl.initialWidthVal : this.ctrlInitialPos.w) + this.borderX * 2) / this.gridpos.w
		if(this.exW || this.fillW) {
			if(this.ctrl.initialWidth) {
				return (this.ctrl.initialWidthVal + (this.ctrl.initialWidthVal ? this.borderX * 2 : 0)) / this.gridpos.w
			}
			return 0
		}
		return ((this.ctrl.initialWidth ? this.ctrl.initialWidthVal : this.ctrlInitialPos.w) + this.borderX * 2) / this.gridpos.w
	}
	
	GetNeededHeight() {
		if(this.ctrl.initialHeight) {
			return this.ctrl.initialHeightVal ? (this.ctrl.initialHeightVal + this.borderY * 2) / this.gridpos.h : 0
		}
		return (this.ctrlInitialPos.h + this.borderY * 2) / this.gridpos.h
		;return ((this.ctrl.initialHeight ? this.ctrl.initialHeightVal : this.ctrlInitialPos.h) + this.borderY * 2) / this.gridpos.h
	}
	
	GetNeededWidth() {
		if(this.ctrl.initialWidth) {
			return this.ctrl.initialWidthVal ? (this.ctrl.initialWidthVal + this.borderX * 2) / this.gridpos.w : 0
		}
		return (this.ctrlInitialPos.w + this.borderX * 2) / this.gridpos.w
		;return ((this.ctrl.initialWidth ? this.ctrl.initialWidthVal : this.ctrlInitialPos.w) + this.borderX * 2) / this.gridpos.w
	}
	
	GetExpansionWidthValue() {
		return this.exW ;/ this.gridpos.w
	}
	
	GetExpansionHeightValue() {
		return this.exH ;/ this.gridpos.h
	}
	
	GetExpandedWidth(index, width, expanders, nonExpanders) {
		if(index != this.__FindLeastUsedRowColumn(this.gridpos.w, this.gridpos.x, nonExpanders, expanders)) {
			return 0
		}
		if(this.exW) {
			;MsgBox, % Util_ObjectToString(expanders) "`n" Util_ObjectToString(expandersMaxValue) "`n" this.othersW "`n" this.exW "`n" width * this.exW / (this.othersW + this.exW)
		}
		return width * this.exW / (this.othersW + this.exW)
	}
	
	GetExpandedHeight(index, height, expanders, nonExpanders) {
		if(index != this.__FindLeastUsedRowColumn(this.gridpos.h, this.gridpos.y, nonExpanders, expanders)) {
			return 0
		}
		if(this.exH) {
			;MsgBox, % Util_ObjectToString(expanders) "`n" Util_ObjectToString(expandersMaxValue) "`n" this.othersH "`n" this.exH "`n" height * this.exH / (this.othersH + this.exH)
		}
		return height * this.exH / (this.othersH + this.exH)
	}
	
	__FindLeastUsedRowColumn(size, start, nonExpanders, expanders) {
		local smallest, index, i, largest
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
	
	SetArea(offset, widths, heights) {
		this.pos := new GridGUI.Position(0, 0, 0, 0)
		this.pos.x := offset.x + this.__Sum(widths, 1, this.gridpos.x - 1)
		this.pos.y := offset.y + this.__Sum(heights, 1, this.gridpos.y - 1)
		this.pos.w := this.__Sum(widths, this.gridpos.x, this.gridpos.x + this.gridpos.w - 1)
		this.pos.h := this.__Sum(heights, this.gridpos.y, this.gridpos.y + this.gridpos.h - 1)
	}
	
	__Sum(obj, start, end) {
		local val
		val := 0
		loop % end - start + 1  {
			val += obj[start + A_Index - 1]
		}
		return val
	}
	
	Update() {
		this.ctrlPos := this.Justify(this.pos, this.SetCtrlSize(this.pos))
		this.ctrl.Draw(this.ctrlPos)
	}
	
	SetCtrlSize(pos) {
		local w, h
		if(this.ctrl.initialWidth) {
			w := this.fillW ? Max(pos.w - this.borderX * 2, this.ctrl.initialWidthVal) : this.ctrl.initialWidthVal
		} else {
			w := this.fillW ? pos.w - this.borderX * 2 : this.ctrlInitialPos.w
		}
		if(this.ctrl.initialHeight) {
			h := this.fillH ? Max(pos.h - this.borderY * 2, this.ctrl.initialHeightVal) : this.ctrl.initialHeightVal
		} else {
			h := this.fillH ? pos.h - this.borderY * 2 : this.ctrlInitialPos.h
		}
		return new GridGUI.Position(this.pos.x, this.pos.y, w, h)
	}
	
	Center(area, pos) {
		local dw, dh
		dw := (area.w - pos.w) // 2
		dh := (area.h - pos.h) // 2
		;MsgBox, % new GridGUI.Position(this.pos.x + dw, this.pos.y + dh, this.ctrlInitialPos.w, this.ctrlInitialPos.h).ToStr()
		return new GridGUI.Position(area.x + dw, area.y + dh, pos.w, pos.h)
	}
	
	Justify(area, pos) {
		local jpos
		jpos := new GridGUI.Position(area.x, area.y, pos.w, pos.h)
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
		ToolTip, % this.ToStr()
	}
	
	ToStr(indent := "") {
		return indent "GridPos:`n" this.gridpos.ToStr(indent "`t") "`n" indent "Pos:`n" this.pos.ToStr(indent "`t") "`n" indent "Type:`t" this.ctrl.type "`n" indent "Expand W:`t" this.exW "`n" indent "Expand H:`t" this.exH "`n" indent "OtherExp W:`t" this.othersW "`n" indent "OtherExp H:`t" this.othersH 
	}
	
	DestroyCtrl() {
		DllCall("DestroyWindow", "UInt", this.ctrl.hwnd)
	}
	
	__Delete() {
		this.DestroyCtrl()
	}
}

Class Util {
	BySize(pos) {
		local z
		z := Max(5 - Log(pos.Area()), 0)
		return GridGUI.Util.AddZeros(z) pos.Area()
	}

	ByExW(c) {
		local z
		z := Max(5 - Log(c.exW), 0)
		return GridGUI.Util.AddZeros(z) c.exW
	}

	ByExH(c) {
		local z
		z := Max(5 - Log(c.exH), 0)
		return GridGUI.Util.AddZeros(z) c.exH
	}

	BySecoundValue(lst) {
		local z
		z := Max(5 - Log(lst[2]), 0)
		return GridGUI.Util.AddZeros(z) lst[2]
	}

	AddZeros(z) {
		local
		res := ""
		loop % z {
			res .= "0"
		}
		return res
	}

	Sort(obj, fun) {
		local
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

	ConvertStObjToObjOfStr(obj) {
		local conversion, i, v, key, val
		conversion := {}
		if(!IsObject(obj)) {
			return obj
		}
		for i, v in obj {
			key := (IsObject(i) && i.__Class == GridGUI.Cell.__Class) ? i.gridpos.ToStr() : i
			val := (IsObject(v) && v.__Class == GridGUI.Cell.__Class) ? v.gridpos.ToStr() : v
			conversion[key] := GridGUI.Util.ConvertStObjToObjOfStr(val)
		}
		return conversion
	}

	prettyPrint(str) {
		return RegExReplace(RegExReplace(str, "\\n", "`t"), "\\t", "")
	}
	
	Sum(obj) {
		local
		val := 0
		for i, v in obj {
			val += v
		}
		return val
	}
	
	DPIScale(pos, enlarge := true) {
		local
		scaledPos := pos.Copy()
		scale := A_ScreenDPI / 96
		if(enlarge) {
			scaledPos.w := Round(scaledPos.w * scale)
			scaledPos.h := Round(scaledPos.h * scale)
		} else {
			scaledPos.w := Round(scaledPos.w / scale)
			scaledPos.h := Round(scaledPos.h / scale)
		}
		return scaledPos
	}
	
	FindIndex(lst, val, fun := False) {
		local
		for i, v in lst {
			if(fun ? fun.Call(v, val) : (v = val)) {
				return i
			}
		}
	}
	
	RemoveValue(lst, val, fun := False) {
		local index
		if((index := GridGUI.Util.FindIndex(lst, val, fun)) != "") {
			lst.RemoveAt(index)
			return True
		}
		return False
	}
	
	RGBtoBGR(oldValue) {
		return GridGUI.Util.BGRtoRGB(oldValue)
	}
	
	BGRtoRGB(oldValue) {
		local Value
		Value := (oldValue & 0x00ff00)
		Value += ((oldValue & 0xff0000) >> 16)
		Value += ((oldValue & 0x0000ff) << 16)
		return Value
	}
}
