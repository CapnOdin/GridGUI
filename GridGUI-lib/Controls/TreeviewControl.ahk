
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
