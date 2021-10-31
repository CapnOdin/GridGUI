
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
