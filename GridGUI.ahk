
Class GridGUI {
	#Include %A_LineFile%\..\GridGUI-lib\Gui.ahk
	#Include %A_LineFile%\..\GridGUI-lib\Grid.ahk
	#Include %A_LineFile%\..\GridGUI-lib\Version.ahk
	
	__New(title := "", options := "", showGrid := false) {
		return new GridGUI.GridGUIClass(title, options, showGrid)
	}

	Class GridGUIClass Extends GridGUI.GUI {

		__New(title := "", options := "", showGrid := false) {
			Base.__New(title, options)
			this.grid := new GridGUI.Grid()
			this.showGrid := showGrid
			this.gridlines := [[], []]
			this.margins := {x: 5, y: 5}
		}
		
		Add(x, y, type, options := "", text := "", exW := 0, exH := 0, fillW := 0, fillH := 0, justify := "C") {
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
			ctrl := new GridGUI.ArbitraryControl(this.hwnd, type, options, text)
			this.grid.AddCell(new GridGUI.Cell(pos, ctrl, exW, exH, fillW, fillH, justify, this.margins["x"], this.margins["y"]))
			return ctrl
		}
		
		AddControl(x, y, ctrl, exW := 0, exH := 0, fillW := 0, fillH := 0, justify := "C") {
			if(IsObject(exW)) {
				exH :=		exW.HasKey("exH") ?		exW["exH"] :		exH
				fillW :=	exW.HasKey("fillW") ?	exW["fillW"] :		fillW
				fillH :=	exW.HasKey("fillH") ?	exW["fillH"] :		fillH
				justify :=	exW.HasKey("justify") ?	exW["justify"] :	justify
				exW :=		exW.HasKey("exW") ?		exW["exW"] :		0
			}
			pos := this.__TranslateGridPos(x, y)
			this.grid.AddCell(new GridGUI.Cell(pos, ctrl, exW, exH, fillW, fillH, justify, this.margins["x"], this.margins["y"]))
			return ctrl
		}
		
		Show(options := "AutoSize") {
			if(options = "AutoSize") {
				options := "w" this.grid.GetMinWidth() " h" this.grid.GetMinHeight()
			}
			Base.Show(options)
		}
		
		AutoSize() {
			this.pos.w := this.grid.GetMinWidth()
			this.pos.h := this.grid.GetMinHeight()
			this.grid.CalculatePositions(this.pos.w, this.pos.h)
		}
		
		Margin(x := "", y := "") {
			this.margins["x"] := (x != "") ? x : this.margins["x"]
			this.margins["y"] := (y != "") ? y : this.margins["y"]
			for i, c in this.grid.cells {
				c.borderX := this.margins["x"]
				c.borderY := this.margins["y"]
			}
			this.ReDraw()
		}
		
		ReDraw() {
			this.grid.ResetConstants()
			this.grid.CalculatePositions(this.pos.w, this.pos.h)
		}
		
		GuiSize(pos) {
			Base.GuiSize(pos)
			this.grid.CalculatePositions(this.pos.w, this.pos.h)
			;this.WinSet("Redraw", "")
			if(this.showGrid) {
				ToolTip, % "Pos: (" this.pos.x ", " this.pos.y ")`nSize: (" this.pos.w ", " this.pos.h ")`nRSize: (" pos.w ", " pos.h ")"
				This.DrawGrid(this.pos)
			}
		}
		
		GuiMoved(pos) {
			Base.GuiMoved(pos)
			if(this.showGrid) {
				ToolTip, % "Pos: (" this.pos.x ", " this.pos.y ")`nSize: (" this.pos.w ", " this.pos.h ")"
			}
		}
		
		__Add(controlType, options := "", text := "") {
			return new GridGUI.ArbitraryControl(this.hwnd, controlType, options, text)
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
			
			size := pos ? pos : this.pos
			x := 0
			for i, width in this.grid.widths {
				x += width
				this.gridlines[1][A_Index].GuiControl("Move", "x" x " y" 0 " w" 2 " h" size.h)
				;[1][i].Draw(new GridGUI.Position(x, 0, 2, size.h))
			}
			y := 0
			for i, height in this.grid.heights {
				y += height
				this.gridlines[2][A_Index].GuiControl("Move", "x" 0 " y" y " w" size.w " h" 2)
				;lines[2][i].Draw(new GridGUI.Position(0, y, size.w, 2))
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
			return new GridGUI.Position(x, y, w, h)
		}
	}
}
