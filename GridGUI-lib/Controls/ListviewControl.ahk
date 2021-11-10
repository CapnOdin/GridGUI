
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
	GetText(ByRef OutputVar, RowNumber, ColumnNumber := 1) {
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
