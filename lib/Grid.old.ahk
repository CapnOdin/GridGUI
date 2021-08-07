
#Include %A_LineFile%\..\Controls.ahk

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
	
	CalculatePositions(width, height) {
		this.arbitrator.ReCalculate()
		this.widths := this.columns.CalculateWidths(width, this.columns.expanders, this.columns.nonExpanders, this.columns.expandersMaxValue)
		this.heights := this.rows.CalculateHeights(height, this.rows.expanders, this.rows.nonExpanders, this.rows.expandersMaxValue)
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
		this.Ignore := {"W": {}, "H": {}}
	}
	
	Add(c) {
		if(this.IsExpander(c)) {
			this.CheckOverlapping(c)
			;this.Update(c)
			this.Expanders.Push(c)
		}
	}
	
	CheckOverlapping(c) {
		this.Overlapping["W"][c] := {}
		this.Overlapping["H"][c] := {}
		this.ignore["W"][c] := {}
		this.ignore["H"][c] := {}
		for i, expander in this.Expanders {
			if(c.gridpos.__OverlapX(expander.gridpos)) {
				this.Overlapping["W"][c][expander] := ""
				this.Overlapping["W"][expander][c] := ""
			}
			if(c.gridpos.__OverlapY(expander.gridpos)) {
				this.Overlapping["H"][c][expander] := ""
				this.Overlapping["H"][expander][c] := ""
			}
		}
	}
	
	Update(c) {
		for i, expander in this.Expanders {
			if(this.IsInWidthConflictWith(expander, c)) {
				if(!this.ignore["W"][c].HasKey(expander)) {
					;expander.othersW += c.exW
					c.othersW += expander.exW
					for i in this.Overlapping["W"][expander] {
						this.ignore["W"][c][i] := ""
					}
				}
			}
			
			if(this.IsInHeightConflictWith(expander, c)) {
				if(!this.ignore["H"][c].HasKey(expander)) {
					;expander.othersH += c.exH
					c.othersH += expander.exH
					for i in this.Overlapping["H"][expander] {
						this.ignore["H"][c][i] := ""
					}
				}
			}
		}
	}
	
	ReCalculate() {
		for i, expander in this.Expanders {
			expander.othersW := 0
			expander.othersH := 0
			this.Update(expander)
		}
		FileOpen("output.json", "w").Write(RegExReplace(ObjectToString(this.Overlapping), "\s", ""))
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
	
	CalculateWidths(width, expanders, nonExpanders, expandersMaxValue) {
		widths := {}
		reserved := this.GetMinWidth()
		for i, c in this.columns {
			widths[i] := c.CalculateWidth(width - reserved, expanders, nonExpanders, expandersMaxValue)
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
	
	CalculateHeights(height, expanders, nonExpanders, expandersMaxValue) {
		heights := {}
		reserved := this.GetMinHeight()
		for i, r in this.rows {
			heights[i] := r.CalculateHeight(height - reserved, expanders, nonExpanders, expandersMaxValue)
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
		}
		this.catched := True
	}
	
	__ResetConstants() {
		this.minWidth := 0
		this.expanders := 0
		this.expanderMaxValue := 0
		this.nonExpanders := 0
		this.catched := False
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
		}
		this.catched := True
	}
	
	__ResetConstants() {
		this.minHeight := 0
		this.expanders := 0
		this.expanderMaxValue := 0
		this.nonExpanders := 0
		this.catched := False
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
	__New(pos, ctrl, exW := 0, exH := 0, fillW := 0, fillH := 0, justify := "C", border := 10) {
		this.gridpos := pos
		this.ctrl := ctrl
		this.exW := exW
		this.exH := exH
		this.fillW := fillW
		this.fillH := fillH
		this.justifyOptions := justify
		this.border := border
		this.cPos := this.ctrl.ControlGetPos()
		this.pos := this.ctrl.ControlGetPos()
		this.ctrl.callback := ObjBindMethod(this, "ToolTip")
		this.othersW := 0
		this.othersH := 0
	}
	
	GetNeededHeight() {
		return this.exH || this.fillH ? 0 : this.cPos.h / this.gridpos.h + this.border
	}
	
	GetNeededWidth() {
		return this.exW || this.fillW ? 0 : this.cPos.w / this.gridpos.w + this.border
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
			MsgBox, % Util_ObjectToString(expanders) "`n" Util_ObjectToString(expandersMaxValue) "`n" this.othersW "`n" this.exW "`n" width / ((this.othersW + this.exW) / (this.exW))
		}
		;return width / ((others + this.exW * this.gridpos.w) / (this.exW * this.gridpos.w))
		return width / ((this.othersW + this.exW) / (this.exW))
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
			;MsgBox, % Util_ObjectToString(expanders) "`n" others "`n" this.exH "`n" height / ((others / 8 + this.exH) / (this.exH))
		}
		;return height / ((others + this.exH * this.gridpos.h) / (this.exH * this.gridpos.h))
		return height / ((this.othersH + this.exH) / (this.exH))
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
		w := this.exW || this.fillW ? pos.w - this.border : this.cPos.w
		h := this.exH || this.fillH ? pos.h - this.border : this.cPos.h
		
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
			jpos.y := area.y + this.border / 2
		}
		if(InStr(this.justifyOptions, "E")) {
			jpos.x := area.x + area.w - pos.w - this.border / 2
		}
		if(InStr(this.justifyOptions, "W")) {
			jpos.x := area.x + this.border / 2
		}
		if(InStr(this.justifyOptions, "S")) {
			jpos.y := area.y + area.h - pos.h - this.border / 2
		}
		return jpos
	}
	
	ToolTip() {
		ToolTip, % this.ToStr()
	}
	
	ToStr(indent := "") {
		return indent "GridPos:`n" this.gridpos.ToStr(indent "`t") "`n" indent "Pos:`n" this.pos.ToStr(indent "`t") "`n" indent "Type:`t" this.ctrl.type "`n" indent "Expand W:`t" this.exW "`n" indent "Expand H:`t" this.exH 
	}
}

__Sum(obj) {
	val := 0
	for i, v in obj {
		val += v
	}
	return val
}

