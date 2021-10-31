
; The interface needed of a control to be maintained by a GridGUI.Cell.
Class CellControl {
	
	minWidth := false
	minHeight := false
	minWidthVal := 0
	minHeightVal := 0
	
	; Should draw the control on the GUI sized according to the position and size of the area.
	Draw(area) {
		MsgBox, % "Draw of " this.__Class " is Unimplemented"
	}
	
	; Should return a GridGUI.Position of the position and size of the control.
	GetPos() {
		MsgBox, % "GetPos of " this.__Class " is Unimplemented"
	}
	
	; Sets the min size of the control, used by the GridGUI.Cell that manage this control.
	MinSize(w := "", h := "") {
		local pos
		if(w = "" && h = "") {
			pos := this.GetPos()
			w := pos.w
			h := pos.h
		}
		if(w != "") {
			this.minWidth := w >= 0
			this.minWidthVal := w
		}
		if(h != "") {
			this.minHeight := h >= 0
			this.minHeightVal := h
		}
	}
}
