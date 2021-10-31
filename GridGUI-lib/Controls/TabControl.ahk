
Class TabControl Extends GridGUI.ArbitraryControl {
	tabs := []

	__New(guiHwnd, options := "", text := "", preDrawOtherTabs := true, DPIScale := true, showGrid := false) {
		local Base
		Base.__New(guiHwnd, "Tab3", options " AltSubmit", text)
		this.guiHwnd := guiHwnd
		this.showGrid := showGrid
		this.preDrawOtherTabs := preDrawOtherTabs
		this.__ParseTabLst(text)
		this.DPIScale := DPIScale
		if(!this.preDrawOtherTabs) {
			this._Callback := ObjBindMethod(this, "DrawSelectedTab")
		}
	}
	
	Draw(pos) {
		local Base, i, tab
		Base.Draw(pos)
		this.disArea := this.GetDisplayArea()
		this.disArea.w -= this.disArea.x
		this.disArea.h -= this.disArea.y
		this.disArea.x := 0
		this.disArea.y := 0
		if(this.DPIScale) {
			this.disArea := GridGUI.Util.DPIScale(this.disArea, false)
		}
		this.tabs[this.vVar].Draw(this.disArea)
		if(this.preDrawOtherTabs) {
			for i, tab in this.tabs {
				if(i != this.vVar) {
					tab.Draw(this.disArea)
				}
			}
		}
	}
	
	DrawSelectedTab() {
		this.tabs[this.vVar].Draw(this.disArea)
	}
	
	
	
	__ParseTabLst(tablst) {
		local i, tabName
		for i, tabName in StrSplit(tablst, "|") {
			if(tabName) {
				this.tabs.Push(new GridGUI.TabControl.Tab(this.guiHwnd, i, tabName, this.DPIScale, this.showGrid))
			}
		}
	}
	
	GetDisplayArea() {
		local RECT
		Static TCM_ADJUSTRECT := 0x1328
		VarSetCapacity(RECT, 16, 0)
		;NumPut(area.x,	RECT, 0, "int")
		;NumPut(area.y,	RECT, 4, "int")
		;NumPut(area.w,	RECT, 8, "int")
		;NumPut(area.h,	RECT, 12, "int")
		DllCall("GetClientRect", "UInt", this.hwnd, "UInt", &RECT)
		SendMessage, % TCM_ADJUSTRECT, 0, &RECT, , % "ahk_id " this.hwnd
		return new GridGUI.Position(NumGet(RECT, 0, "int"), NumGet(RECT, 4, "int"), NumGet(RECT, 8, "int"), NumGet(RECT, 12, "int"))
	}
	
	Class Tab {
		__New(guiHwnd, index, tabName, DPIScale := true, showGrid := false) {
			this.index := index
			this.name := tabName
			this.guiHwnd := guiHwnd
			this.subgrid := new GridGUI.SubGrid(guiHwnd, , DPIScale, showGrid)
		}
		
		Draw(pos) {
			Gui, % this.guiHwnd ":Tab", % this.index
			this.subgrid.Draw(pos)
		}
		
		Add(x, y, type, options := "", text := "", exW := 0, exH := 0, fillW := 0, fillH := 0, justify := "C") {
			Gui, % this.guiHwnd ":Tab", % this.index
			return this.subgrid.Add(x, y, type, options, text, exW, exH, fillW, fillH, justify)
		}
		
		AddControl(x, y, ctrl, exW := 0, exH := 0, fillW := 0, fillH := 0, justify := "C") {
			Gui, % this.guiHwnd ":Tab", % this.index
			return this.subgrid.AddControl(x, y, ctrl, exW, exH, fillW, fillH, justify)
		}
	}
}
