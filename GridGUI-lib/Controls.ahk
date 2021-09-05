#Include %A_LineFile%\..\Control.ahk

Class ArbitraryControl Extends GridGUI.GuiControlClass {
	__New(guiHwnd, type, options := "", text := "") {
		Gui, % guiHwnd ":Add", % type, % "+HwndHwnd " options, % text
		Base.__New(Hwnd, type, options)
	}
}

Class ListviewControl Extends GridGUI.ArbitraryControl {
	__New(guiHwnd, options := "", text := "") {
		Base.__New(guiHwnd, "ListView", options, text)
		this.gui := new GridGUI.GUI(, , guiHwnd)
	}
	
	; Adds a new row to the bottom of the list.
	Add(Options := "", Fields*) {
		prev := this.__SetCurrentLV()
		rowIndex := LV_Add(Options, Fields*)
		this.__ResetCurrentLV(prev)
		return rowIndex
	}
	
	; Inserts a new row at the specified row number.
	Insert(RowNumber, Options := "", Cols*) {
		prev := this.__SetCurrentLV()
		rowIndex := LV_Insert(RowNumber, Options, Cols*)
		this.__ResetCurrentLV(prev)
		return rowIndex
	}
	
	; Modifies the attributes and/or text of a row.
	Modify(RowNumber, Options := "", NewCols*) {
		prev := this.__SetCurrentLV()
		bool := LV_Modify(RowNumber, Options, NewCols*)
		this.__ResetCurrentLV(prev)
		return bool
	}
	
	; Deletes the specified row or all rows.
	Delete(RowNumber*) {
		prev := this.__SetCurrentLV()
		bool := LV_Delete(RowNumber*)
		this.__ResetCurrentLV(prev)
		return bool
	}
	
	; Modifies the attributes and/or text of the specified column and its header.
	ModifyCol(args*) { ; ColumnNumber := "", Options := "", ColumnTitle := ""
		prev := this.__SetCurrentLV()
		bool := LV_ModifyCol(args*) ; ColumnNumber, Options, ColumnTitle
		this.__ResetCurrentLV(prev)
		return bool
	}
	
	; Inserts a new column at the specified column number.
	InsertCol(ColumnNumber, Options := "", ColumnTitle := "") {
		prev := this.__SetCurrentLV()
		columnIndex := LV_InsertCol(ColumnNumber, Options, ColumnTitle)
		this.__ResetCurrentLV(prev)
		return columnIndex
	}
	
	; Deletes the specified column and all of the contents beneath it.
	DeleteCol(ColumnNumber) {
		prev := this.__SetCurrentLV()
		bool := LV_DeleteCol(ColumnNumber)
		this.__ResetCurrentLV(prev)
		return bool
	}
	
	; Returns the total number of rows or columns.
	GetCount(Mode := "") {
		prev := this.__SetCurrentLV()
		count := LV_GetCount(Mode)
		this.__ResetCurrentLV(prev)
		return count
	}
	
	; Returns the row number of the next selected, checked, or focused row.
	GetNext(StartingRowNumber := "", RowType := "") {
		prev := this.__SetCurrentLV()
		rowIndex := LV_GetNext(StartingRowNumber, RowType)
		this.__ResetCurrentLV(prev)
	}
	
	; Retrieves the text at the specified row and column.
	GetText(ByRef OutputVar, RowNumber, ColumnNumber := "") {
		prev := this.__SetCurrentLV()
		bool := LV_GetText(OutputVar, RowNumber, ColumnNumber)
		this.__ResetCurrentLV(prev)
		return bool
	}
	
	; Sets or replaces an ImageList for displaying icons.
	SetImageList(ImageListID, IconType := "") {
		prev := this.__SetCurrentLV()
		prevImageListID := LV_SetImageList(ImageListID, IconType)
		this.__ResetCurrentLV(prev)
		return prevImageListID
	}
	
	; Returns the selected rows.
	GetSelection() {
		prev := this.__SetCurrentLV()
		selection := []
		num_of_columns := LV_GetCount("Column")
		Loop % LV_GetCount("Selected") {
			i := LV_GetNext(i)
			row := selection.Push([])
			loop % num_of_columns {
				LV_GetText(text, i, A_Index)
				selection[row].Push(text)
			}
		}
		this.__ResetCurrentLV(prev)
		return selection
	}
	
	; Adds an array of rows
	AddArray(lst) {
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

Class TreeviewControl Extends GridGUI.ArbitraryControl {
	__New(guiHwnd, options := "") {
		Base.__New(guiHwnd, "TreeView", options)
		this.gui := new GridGUI.GUI(, , guiHwnd)
	}
	
	; Adds a new item to the TreeView.
	Add(Name, ParentItemID := "", Options := "") {
		prev := this.__SetCurrentTV()
		id := TV_Add(Name, ParentItemID, Options)
		this.__ResetCurrentTV(prev)
		return id
	}
	
	;Modifies the attributes and/or name of an item.
	Modify(ItemID, args*) { ; Options := "", NewName := ""
		prev := this.__SetCurrentTV()
		id := TV_Modify(ItemID, args*)
		this.__ResetCurrentTV(prev)
		return id
	}
	
	; Deletes the specified item or all items.
	Delete(ItemID := "") {
		prev := this.__SetCurrentTV()
		bool := TV_Delete(ItemID)
		this.__ResetCurrentTV(prev)
		return bool
	}
	
	; Returns the selected item's ID number.
	GetSelection() {
		prev := this.__SetCurrentTV()
		id := TV_GetSelection()
		this.__ResetCurrentTV(prev)
		return id
	}
	
	; Returns the total number of items in the control.
	GetCount() {
		prev := this.__SetCurrentTV()
		count := TV_GetCount()
		this.__ResetCurrentTV(prev)
		return count
	}
	
	;Returns the specified item's parent as an item ID.
	GetParent(ItemID) {
		prev := this.__SetCurrentTV()
		parentID := TV_GetParent(ItemID)
		this.__ResetCurrentTV(prev)
		return parentID
	}
	
	; Returns the ID number of the specified item's first/top child.
	GetChild(ParentItemID) {
		prev := this.__SetCurrentTV()
		childID := TV_GetChild(ParentItemID)
		this.__ResetCurrentTV(prev)
		return childID
	}
	
	; Returns the ID number of the sibling above the specified item.
	GetPrev(ItemID) {
		prev := this.__SetCurrentTV()
		siblingID := TV_GetPrev(ItemID)
		this.__ResetCurrentTV(prev)
		return siblingID
	}
	
	; Returns the ID number of the next item below the specified item.
	GetNext(ItemID := "", ItemType := "") {
		prev := this.__SetCurrentTV()
		id := TV_GetNext(ItemID, ItemType)
		this.__ResetCurrentTV(prev)
		return id
	}
	
	; Retrieves the text/name of the specified item.
	GetText(ByRef OutputVar, ItemID) {
		prev := this.__SetCurrentTV()
		id := TV_GetText(OutputVar, ItemID)
		this.__ResetCurrentTV(prev)
		return id
	}
	
	; Returns the ID number of the specified item if it has the specified attribute.
	Get(ItemID, Attribute) {
		prev := this.__SetCurrentTV()
		id := TV_Get(ItemID, Attribute)
		this.__ResetCurrentTV(prev)
		return id
	}

	; Sets or replaces an ImageList for displaying icons.
	SetImageList(ImageListID, IconType := "") {
		prev := this.__SetCurrentTV()
		prevImageListID := TV_SetImageList(ImageListID, IconType)
		this.__ResetCurrentTV(prev)
		return prevImageListID
	}
	
	Redraw(bool) {
		this.Options((bool ? "+" : "-") "Redraw")
	}
	
	__SetCurrentTV() {
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
		Base.__New(hwnd)
		this.window := new GridGUI.Window(hwnd)
		this.type := "Window"
		this.guiHwnd := guiHwnd
		this.__SetUpWindow()
	}
	
	__SetUpWindow() {
		; Styles we want to remove from the window:
		static		WS_POPUP := 0x80000000
				,	WS_CAPTION := 0xC00000
				,	WS_THICKFRAME := 0x40000
				,	WS_EX_CLIENTEDGE := 0x200
		; Styles we want to add to the window:
				,	WS_CHILD := 0x40000000
		DetectHiddenWindows, On
		; Apply necessary style changes.
		this.window.WinSet("Style", "-" (WS_POPUP|WS_CAPTION|WS_THICKFRAME))
		this.window.WinSet("Style", "+"	WS_CHILD)
		this.window.WinSet("ExStyle", "-" WS_EX_CLIENTEDGE)
		
		; Put the window into the Gui.
		DllCall("SetParent", "uint", this.hwnd, "uint", this.guiHwnd)
		
		WM_PARENTNOTIFY := 0x0210
		OnMessage(WM_PARENTNOTIFY, new GridGUI.BoundFunc("GridGUI.WindowControl.__CheckIfClicked", this))
	}
	
	Control(subCommand, value) {
		MsgBox, % "Not Inplimented"
	}
	
	ControlFocus() {
		DllCall("SetFocus", "uint", this.hwnd)
	}
	
	ControlGetPos() {
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
