#Include %A_LineFile%\..\Control.ahk

Class ArbitraryControl Extends GridGUI.GuiControlClass {
	__New(guiHwnd, type, options := "", text := "", DPIScale := true) {
		local Base
		Gui, % guiHwnd ":Add", % type, % "+HwndHwnd " options, % text
		Base.__New(Hwnd, type, options, DPIScale)
	}
}

Class ListviewControl Extends GridGUI.ArbitraryControl {
	__New(guiHwnd, options := "", text := "") {
		local Base
		Base.__New(guiHwnd, "ListView", options, text)
		this.gui := new GridGUI.GUI(, , guiHwnd)
	}
	
	; Adds a new row to the bottom of the list.
	Add(Options := "", Fields*) {
		local prev, rowIndex
		prev := this.__SetCurrentLV()
		rowIndex := LV_Add(Options, Fields*)
		this.__ResetCurrentLV(prev)
		return rowIndex
	}
	
	; Inserts a new row at the specified row number.
	Insert(RowNumber, Options := "", Cols*) {
		local prev, rowIndex
		prev := this.__SetCurrentLV()
		rowIndex := LV_Insert(RowNumber, Options, Cols*)
		this.__ResetCurrentLV(prev)
		return rowIndex
	}
	
	; Modifies the attributes and/or text of a row.
	Modify(RowNumber, Options := "", NewCols*) {
		local prev, bool
		prev := this.__SetCurrentLV()
		bool := LV_Modify(RowNumber, Options, NewCols*)
		this.__ResetCurrentLV(prev)
		return bool
	}
	
	; Deletes the specified row or all rows.
	Delete(RowNumber*) {
		local prev, bool
		prev := this.__SetCurrentLV()
		bool := LV_Delete(RowNumber*)
		this.__ResetCurrentLV(prev)
		return bool
	}
	
	; Modifies the attributes and/or text of the specified column and its header.
	ModifyCol(args*) { ; ColumnNumber := "", Options := "", ColumnTitle := ""
		local prev, bool
		prev := this.__SetCurrentLV()
		bool := LV_ModifyCol(args*) ; ColumnNumber, Options, ColumnTitle
		this.__ResetCurrentLV(prev)
		return bool
	}
	
	; Inserts a new column at the specified column number.
	InsertCol(ColumnNumber, Options := "", ColumnTitle := "") {
		local prev, columnIndex
		prev := this.__SetCurrentLV()
		columnIndex := LV_InsertCol(ColumnNumber, Options, ColumnTitle)
		this.__ResetCurrentLV(prev)
		return columnIndex
	}
	
	; Deletes the specified column and all of the contents beneath it.
	DeleteCol(ColumnNumber) {
		local prev, bool
		prev := this.__SetCurrentLV()
		bool := LV_DeleteCol(ColumnNumber)
		this.__ResetCurrentLV(prev)
		return bool
	}
	
	; Returns the total number of rows or columns.
	GetCount(Mode := "") {
		local prev, count
		prev := this.__SetCurrentLV()
		count := LV_GetCount(Mode)
		this.__ResetCurrentLV(prev)
		return count
	}
	
	; Returns the row number of the next selected, checked, or focused row.
	GetNext(StartingRowNumber := "", RowType := "") {
		local prev, rowIndex
		prev := this.__SetCurrentLV()
		rowIndex := LV_GetNext(StartingRowNumber, RowType)
		this.__ResetCurrentLV(prev)
	}
	
	; Retrieves the text at the specified row and column.
	GetText(ByRef OutputVar, RowNumber, ColumnNumber := "") {
		local prev, bool
		prev := this.__SetCurrentLV()
		bool := LV_GetText(OutputVar, RowNumber, ColumnNumber)
		this.__ResetCurrentLV(prev)
		return bool
	}
	
	; Sets or replaces an ImageList for displaying icons.
	SetImageList(ImageListID, IconType := "") {
		local prev, prevImageListID
		prev := this.__SetCurrentLV()
		prevImageListID := LV_SetImageList(ImageListID, IconType)
		this.__ResetCurrentLV(prev)
		return prevImageListID
	}
	
	DeleteHeaders() {
		local prev, res := true
		prev := this.__SetCurrentLV()
		loop % this.GetCount("Col") {
			res &= LV_DeleteCol(1)
		}
		this.__ResetCurrentLV(prev)
		return res
	}
	
	SetHeaders(headers) {
		local prev, i, col, num_of_columns
		prev := this.__SetCurrentLV()
		num_of_columns := this.GetCount("Col")
		if(num_of_columns < headers.Count()) {
			loop % headers.Count() - num_of_columns {
				LV_InsertCol(num_of_columns + A_Index, , "")
			}
		} else if(num_of_columns > headers.Count()) {
			loop % num_of_columns - headers.Count() {
				LV_DeleteCol(headers.Count() + A_Index)
			}
		}
		for i, col in headers {
			LV_ModifyCol(i, , col)
		}
		
		this.__ResetCurrentLV(prev)
	}
	
	GetHeaders() {
		local prev, headers, num_of_columns
		prev := this.__SetCurrentLV()
		headers := []
		num_of_columns := LV_GetCount("Column")
		loop % num_of_columns {
			LV_GetText(text, 0, A_Index)
			headers.Push(text)
		}
		this.__ResetCurrentLV(prev)
		return headers
	}
	
	GetRow(index) {
		prev := this.__SetCurrentLV()
		row := this.__GetRow(index)
		this.__ResetCurrentLV(prev)
		return row
	}
	
	__GetRow(index) {
		local num_of_columns, row
		num_of_columns := LV_GetCount("Column")
		row := []
		loop % num_of_columns {
			LV_GetText(text, index, A_Index)
			row.Push(text)
		}
		return row
	}
	
	; Returns the selected rows.
	GetSelection() {
		local prev, selection, num_of_columns, i, row
		prev := this.__SetCurrentLV()
		selection := []
		num_of_columns := LV_GetCount("Column")
		Loop % LV_GetCount("Selected") {
			i := LV_GetNext(i)
			selection.Push(this.__GetRow(i))
		}
		this.__ResetCurrentLV(prev)
		return selection
	}
	
	; Adds an array of rows
	AddArray(lst) {
		local prev, i, v
		prev := this.__SetCurrentLV()
		this.Redraw(0)
		for i, v in lst {
			LV_Add(, v*)
		}
		this.Redraw(1)
		this.__ResetCurrentLV(prev)
	}
	
	/*
	; Sets the selection.
	SetSelection(start := 1, end := -1, replace := true) {
		prev := this.__SetCurrentLV()
		
		this.__ResetCurrentLV(prev)
		return selection
	}
	*/
	
	Redraw(bool) {
		this.Options((bool ? "+" : "-") "Redraw")
	}
	
	ScrollTo(index := 0, text := "", partial := False) {
		Static 	LVM_ENSUREVISIBLE	:= 0x1013,
				LVM_GETITEMCOUNT	:= 0x1004
				
		if(text) {
			index := this.FindItem(text, index, partial)
			if(index = -1) {
				Return
			}
		} else if(index < 0) {
			SendMessage, % LVM_GETITEMCOUNT, , , , % "ahk_id " this.hwnd
			index := ErrorLevel + index
		}
		SendMessage, % LVM_ENSUREVISIBLE, % index, , , % "ahk_id " this.hwnd
	}

	/*
	typedef struct tagLVFINDINFO {
	  UINT    flags;		4 (+4 padding)
	  LPCTSTR psz;			4-8
	  LPARAM  lParam;		4-8
	  POINT   pt;			8
	  UINT    vkDirection;	4 (+4 padding)
	} LVFINDINFO, *LPFINDINFO;
	*/
	FindItem(text, index := 0, partial := False) {
		Static 	LVM_FINDITEMW	:= 0x1053,
				LVFI_STRING		:= 0x2,
				LVFI_PARTIAL	:= 0x8
				
		index := index - 1
		VarSetCapacity(LVFINDINFO, 2*4 + 4 * A_PtrSize, 0)
		NumPut(partial ? LVFI_PARTIAL : LVFI_STRING, LVFINDINFO, 0, "UInt")
		NumPut(&text, LVFINDINFO, 8, "PTR")
		SendMessage, % LVM_FINDITEMW, % index, % &LVFINDINFO, , % "ahk_id " this.hwnd
		return ErrorLevel
	}
	
	__SetCurrentLV() {
		local gui, lv
		gui := this.gui.hwnd
		lv := this.hwnd
		if(A_DefaultGui != this.gui.hwnd) {
			gui := A_DefaultGui
			this.gui.Default()
		}
		if(A_DefaultListView != this.hwnd) {
			lv := this.gui.ListView(this.hwnd)
		}
		return {"gui": gui, "lv": lv}
	}
	
	__ResetCurrentLV(previous) {
		if(A_DefaultGui != previous["gui"]) {
			Gui, % previous["gui"] ":Default"
		}
		if(A_DefaultListView != previous["lv"]) {
			return this.gui.ListView(previous["lv"])
		}
	}
}

class RadioGroupControl {
	RadioButtons := []
	Checked := {}
	
	__New(guiHwnd, callback := false) {
		this.guiHwnd := guiHwnd
		this.callback := callback
	}
	
	New(options := "", text := "", guiHwnd := false) {
		local ctrl
		guiHwnd := guiHwnd ? guiHwnd : this.guiHwnd
		ctrl := new GridGUI.ArbitraryControl(guiHwnd, "Radio", options " Group", text)
		ctrl.callback := ObjBindMethod(this, "__Callback", ctrl)
		this.RadioButtons.Push(ctrl)
		if(options ~= "i)Checked(?!0)") {
			this.__Callback(ctrl)
		}
		return ctrl
	}
	
	Check(index) {
		this.RadioButtons[index].GuiControl("", 1)
		this.__Callback(this.RadioButtons[index])
	}
	
	__Callback(ctrl) {
		local i, rb
		for i, rb in this.RadioButtons {
			if(rb.hwnd = ctrl.hwnd) {
				this.Checked := {"index": i, "ctrl": ctrl, "text": ctrl.GuiControlGet("", "Text")}
			} else {
				rb.GuiControl("", 0)
			}
		}
		if(this.callback) {
			this.callback.Call(this.Checked)
		}
	}
}

Class StatusBarControl Extends GridGUI.ArbitraryControl {
	__New(guiHwnd, options := "", text := "") {
		local Base
		Base.__New(guiHwnd, "StatusBar", options, text)
		this.gui := new GridGUI.GUI(, , guiHwnd)
	}
	
	; Displays NewText in the specified part of the status bar.
	SetText(NewText, PartNumber := 1, Style := 0) {
		local prev, bool
		prev := this.__SetDefaultGui()
		bool := SB_SetText(NewText, PartNumber, Style)
		this.__ResetDefaultGui(prev)
		return bool
	}
	
	; Divides the bar into multiple sections according to the specified widths (in pixels).
	SetParts(Widths*) {
		local prev, bool
		prev := this.__SetDefaultGui()
		bool := SB_SetParts(Widths*)
		this.__ResetDefaultGui(prev)
		return bool
	}
	
	; Displays a small icon to the left of the text in the specified part.
	SetIcon(Filename, IconNumber := 1, PartNumber := 1) {
		local prev, hIcon
		prev := this.__SetDefaultGui()
		hIcon := SB_SetIcon(Filename, IconNumber, PartNumber)
		this.__ResetDefaultGui(prev)
		return hIcon
	}
	
	__SetDefaultGui() {
		local gui
		gui := this.gui.hwnd
		if(A_DefaultGui != this.gui.hwnd) {
			gui := A_DefaultGui
			this.gui.Default()
		}
		return gui
	}
	
	__ResetDefaultGui(previous) {
		if(A_DefaultGui != previous) {
			Gui, % previous ":Default"
		}
	}
}

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

Class TreeviewControl Extends GridGUI.ArbitraryControl {
	__New(guiHwnd, options := "") {
		local Base
		Base.__New(guiHwnd, "TreeView", options)
		this.gui := new GridGUI.GUI(, , guiHwnd)
	}
	
	; Adds a new item to the TreeView.
	Add(Name, ParentItemID := "", Options := "") {
		local prev, id
		prev := this.__SetCurrentTV()
		id := TV_Add(Name, ParentItemID, Options)
		this.__ResetCurrentTV(prev)
		return id
	}
	
	;Modifies the attributes and/or name of an item.
	Modify(ItemID, args*) { ; Options := "", NewName := ""
		local prev, id
		prev := this.__SetCurrentTV()
		id := TV_Modify(ItemID, args*)
		this.__ResetCurrentTV(prev)
		return id
	}
	
	; Deletes the specified item or all items.
	Delete(ItemID := "") {
		local prev, bool
		prev := this.__SetCurrentTV()
		bool := TV_Delete(ItemID)
		this.__ResetCurrentTV(prev)
		return bool
	}
	
	; Returns the selected item's ID number.
	GetSelection() {
		local prev, id
		prev := this.__SetCurrentTV()
		id := TV_GetSelection()
		this.__ResetCurrentTV(prev)
		return id
	}
	
	; Returns the total number of items in the control.
	GetCount() {
		local prev, count
		prev := this.__SetCurrentTV()
		count := TV_GetCount()
		this.__ResetCurrentTV(prev)
		return count
	}
	
	;Returns the specified item's parent as an item ID.
	GetParent(ItemID) {
		local prev, parentID
		prev := this.__SetCurrentTV()
		parentID := TV_GetParent(ItemID)
		this.__ResetCurrentTV(prev)
		return parentID
	}
	
	; Returns the ID number of the specified item's first/top child.
	GetChild(ParentItemID) {
		local prev, childID
		prev := this.__SetCurrentTV()
		childID := TV_GetChild(ParentItemID)
		this.__ResetCurrentTV(prev)
		return childID
	}
	
	; Returns the ID number of the sibling above the specified item.
	GetPrev(ItemID) {
		local prev, siblingID
		prev := this.__SetCurrentTV()
		siblingID := TV_GetPrev(ItemID)
		this.__ResetCurrentTV(prev)
		return siblingID
	}
	
	; Returns the ID number of the next item below the specified item.
	GetNext(ItemID := "", ItemType := "") {
		local prev, id
		prev := this.__SetCurrentTV()
		id := TV_GetNext(ItemID, ItemType)
		this.__ResetCurrentTV(prev)
		return id
	}
	
	; Retrieves the text/name of the specified item.
	GetText(ByRef OutputVar, ItemID) {
		local prev, id
		prev := this.__SetCurrentTV()
		id := TV_GetText(OutputVar, ItemID)
		this.__ResetCurrentTV(prev)
		return id
	}
	
	; Returns the ID number of the specified item if it has the specified attribute.
	Get(ItemID, Attribute) {
		local prev, id
		prev := this.__SetCurrentTV()
		id := TV_Get(ItemID, Attribute)
		this.__ResetCurrentTV(prev)
		return id
	}

	; Sets or replaces an ImageList for displaying icons.
	SetImageList(ImageListID, IconType := "") {
		local prev, prevImageListID
		prev := this.__SetCurrentTV()
		prevImageListID := TV_SetImageList(ImageListID, IconType)
		this.__ResetCurrentTV(prev)
		return prevImageListID
	}
	
	Redraw(bool) {
		this.Options((bool ? "+" : "-") "Redraw")
	}
	
	__SetCurrentTV() {
		local gui, tv
		gui := this.gui.hwnd
		tv := this.hwnd
		if(A_DefaultGui != this.gui.hwnd) {
			gui := A_DefaultGui
			this.gui.Default()
		}
		if(A_DefaultTreeView != this.hwnd) {
			tv := this.gui.TreeView(this.hwnd)
		}
		return {"gui": gui, "tv": tv}
	}
	
	__ResetCurrentTV(previous) {
		if(A_DefaultGui != previous["gui"]) {
			Gui, % previous["gui"] ":Default"
		}
		if(A_DefaultTreeView != previous["tv"]) {
			return this.gui.TreeView(previous["tv"])
		}
	}
}

Class WindowControl Extends GridGUI.ControlClass {
	__New(guiHwnd, hwnd, options := "") {
		local Base
		Base.__New(hwnd)
		this.__Init()
		this.window := new GridGUI.Window(hwnd)
		this.type := "Window"
		this.guiHwnd := guiHwnd
		this.__SetUpWindow()
		this.__ParseOptions(options)
	}
	
	__SetUpWindow() {
		; Styles we want to remove from the window:
		static		WS_POPUP := 0x80000000
				,	WS_CAPTION := 0xC00000
				,	WS_THICKFRAME := 0x40000
				,	WS_EX_CLIENTEDGE := 0x200
		; Styles we want to add to the window:
				,	WS_CHILD := 0x40000000
		; Events we want to propagate:
				,	WM_PARENTNOTIFY := 0x0210
		DetectHiddenWindows, On
		; Apply necessary style changes.
		this.window.WinSet("Style", "-" (WS_POPUP|WS_CAPTION|WS_THICKFRAME))
		this.window.WinSet("Style", "+"	WS_CHILD)
		this.window.WinSet("ExStyle", "-" WS_EX_CLIENTEDGE)
		
		; Put the window into the Gui.
		DllCall("SetParent", "uint", this.hwnd, "uint", this.guiHwnd)
		
		OnMessage(WM_PARENTNOTIFY, new GridGUI.BoundFunc("GridGUI.WindowControl.__CheckIfClicked", this))
	}
	
	Control(subCommand, value) {
		MsgBox, % "Not Inplimented"
	}
	
	ControlFocus() {
		DllCall("SetFocus", "uint", this.hwnd)
	}
	
	GetPos() {
		local hwndDesktop, ConsoleRect, x, y, w, h
		hwndDesktop := WinExist("Program Manager ahk_class Progman")
		VarSetCapacity(ConsoleRect, 16)
		DllCall("GetWindowRect", "uint", this.hwnd, "uint", &ConsoleRect)
		DllCall("MapWindowPoints", "uint", hwndDesktop, "uint", this.guiHwnd, "uint", &ConsoleRect, "uint", 2)
		
		x := NumGet(ConsoleRect, 0, "UInt")
		y := NumGet(ConsoleRect, 4, "UInt")
		w := NumGet(ConsoleRect, 8, "UInt")
		h := NumGet(ConsoleRect, 12, "UInt")
		return new GridGUI.Position(x, y, w, h)
	}
	
	__CheckIfClicked(wParam, lParam, msg, hwnd) {
		local click_pos
		static WM_LBUTTONDOWN := 0x0201
		if(wParam & 0xffff = WM_LBUTTONDOWN) {
			click_pos := new GridGUI.Position(lParam & 0xffff, lParam >> 16)
			if(this.ControlGetPos().Contains(click_pos)) {
				this.ControlFocus()
			}
		}
	}
	
	ControlMove(pos) {
		; Flags for SetWindowPos:
		static		SWP_NOACTIVATE := 0x10
				,	SWP_SHOWWINDOW := 0x40
				,	SWP_NOSENDCHANGING := 0x400
		DllCall("SetWindowPos", "uint", this.hwnd, "uint", 0
			, "int", pos.x, "int", pos.y, "int", pos.w, "int", pos.h
			, "uint", SWP_NOACTIVATE|SWP_SHOWWINDOW|SWP_NOSENDCHANGING)
	}
	
	Draw(pos) {
		this.ControlMove(pos)
	}
}
