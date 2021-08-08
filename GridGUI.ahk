
#Include %A_LineFile%\..\lib\Window.ahk
#Include %A_LineFile%\..\lib\BoundFunc.ahk
#Include %A_LineFile%\..\lib\Grid.ahk

Class GUI Extends Window {
	__New(title, options := "") {
		this.title := title
		Gui, New, % "+HwndHwnd " options, % this.title
		Base.__New(Hwnd, [new GuiCallback(Window.WM_SIZE, new BoundFunc("GUI.__GuiSize", this))])
	}
	
	Add(controlType, options := "", text := "") {
		return new ArbitraryControl(this.hwnd, controlType, options, text)
	}
	
	Show(options := "AutoSize") {
		Gui, % this.hwnd ":Show", % options
	}
	
	Submit(NoHide := False) {
		Gui, % this.hwnd ":Submit", % NoHide ? "NoHide" : ""
	}
	
	Margin(x := "", y := "") {
		Gui, % this.hwnd ":Margin", % x, % y
	}
	
	GuiSize(pos) {
		ToolTip, % "w: " pos.w "`nh: " pos.h
	}
	
	MinSize(x := "", y := "") {
		Gui, % this.hwnd ": +MinSize" x (y != "" ? "x" y: "")
	}
	
	Font(Options := "", FontName := "") {
		Gui, % this.hwnd ":Font", % Options, % FontName
	}
	
	Destroy() {
		Gui, % this.hwnd ":Destroy"
	}
	
	ControlGetFocus() {
		GuiControlGet, CtrlClass, % this.hwnd ":Focus"
		GuiControlGet, focused, % this.hwnd ":Hwnd", % CtrlClass
		Return focused
	}
	
	__GuiSize(wParam, lParam, msg, hwnd) {
		Static SIZE_RESTORED := 0
		if(this.hwnd = hwnd) {
			if(this.resizeTimer) {
				timer := this.resizeTimer
				SetTimer, % timer, Off
			}
			timer := this.resizeTimer := new BoundFunc(this.__Class ".GuiSize", this, new Position(0, 0, lParam & 0xffff, lParam >> 16))
			SetTimer, % timer, -50
		}
	}
}

Class GridGUI Extends GUI {

	__New(title, options := "", showGrid := false) {
		Base.__New(title, options)
		this.grid := new Grid()
		this.showGrid := showGrid
		this.gridlines := [[], []]
		this.margins := {x: 5, y: 5}
		this.pos := new Position(0, 0)
	}
	
	AddControl(x, y, type, options := "", text := "", exW := 0, exH := 0, fillW := 0, fillH := 0, justify := "C") {
		if(IsObject(options)) {
			text :=		options.HasKey("text") ?	options["text"] :		text
			exW :=		options.HasKey("exW") ?		options["exW"] :		exW
			exH :=		options.HasKey("exH") ?		options["exH"] :		exH
			fillW :=	options.HasKey("fillW") ?	options["fillW"] :		fillW
			fillH :=	options.HasKey("fillH") ?	options["fillH"] :		fillH
			justify :=	options.HasKey("justify") ?	options["justify"] :	justify
			options :=	options.HasKey("options") ?	options["options"] :	""
		}
		pos := this.__TranslateGridPos(x, y)
		ctrl := new ArbitraryControl(this.hwnd, type, options, text)
		this.grid.AddCell(new Cell(pos, ctrl, exW, exH, fillW, fillH, justify, this.margins["x"], this.margins["y"]))
		return ctrl
	}
	
	Show(options := "AutoSize") {
		if(options = "AutoSize") {
			options := "w" this.grid.GetMinWidth() " h" this.grid.GetMinHeight()
		}
		Gui, % this.hwnd ":Show", % options
	}
	
	AutoSize() {
		this.grid.CalculatePositions(this.grid.GetMinWidth(), this.grid.GetMinHeight())
	}
	
	Add(x, y, ctrl, exW := 0, exH := 0) {
		pos := this.__TranslateGridPos(x, y)
		this.grid.AddCell(new Cell(pos, ctrl, exW, exH))
	}
	
	Margin(x := "", y := "") {
		this.margins["x"] := (x != "") ? x : this.margins["x"]
		this.margins["y"] := (y != "") ? y : this.margins["y"]
		for i, c in this.grid.cells {
			c.borderX := this.margins["x"]
			c.borderY := this.margins["y"]
		}
		this.grid.ResetConstants()
		this.grid.CalculatePositions(this.pos.w, this.pos.h)
	}
	
	GuiSize(pos) {
		this.pos := pos
		this.grid.CalculatePositions(pos.w, pos.h)
		;this.WinSet("Redraw", "")
		if(this.showGrid) {
			ToolTip, % "w: " pos.w "`nh: " pos.h
			This.DrawGrid(pos)
		}
	}
	
	__Add(controlType, options := "", text := "") {
		return new ArbitraryControl(this.hwnd, controlType, options, text)
	}
	
	DrawGrid(pos) {
		if(!this.gridlines[1].Length()) {
			for i, width in this.grid.widths {
				ctrl := this.__Add("Progress", "h2")
				ctrl.GuiControl("+Background777777", "")
				this.gridlines[1].Push(ctrl)
			}
			for i, height in this.grid.heights {
				ctrl := this.__Add("Progress", "w2")
				ctrl.GuiControl("+Background777777", "")
				this.gridlines[2].Push(ctrl)
			}
		}
		
		size := pos ? pos : this.WinGetPos()
		x := 0
		for i, width in this.grid.widths {
			x += width
			this.gridlines[1][A_Index].GuiControl("Move", "x" x " y" 0 " w" 2 " h" size.h)
			;[1][i].Draw(new Position(x, 0, 2, size.h))
		}
		y := 0
		for i, height in this.grid.heights {
			y += height
			this.gridlines[2][A_Index].GuiControl("Move", "x" 0 " y" y " w" size.w " h" 2)
			;lines[2][i].Draw(new Position(0, y, size.w, 2))
		}
	}
	
	__TranslateGridPos(x, y) {
		w := 1
		h := 1
		if(pos := InStr(x, "-")) {
			w += SubStr(x, pos + 1) - SubStr(x, 1, pos - 1)
			x := SubStr(x, 1, pos - 1)
		}
		if(pos := InStr(y, "-")) {
			h += SubStr(y, pos + 1) - SubStr(y, 1, pos - 1)
			y := SubStr(y, 1, pos - 1)
		}
		return new Position(x, y, w, h)
	}
}
