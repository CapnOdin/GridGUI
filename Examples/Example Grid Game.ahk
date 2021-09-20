
#Include %A_ScriptDir%\..\GridGUI.ahk

SetBatchLines, -1

myGui := new GridGUI("Grid Game", "resize")
myGui.GuiClose := GridGUI.ExitApp

subGrid := new GridGUI.SubGrid(myGui.hwnd)
subGrid.Font("s15")
			subGrid.Add(1, 1, "Text", {text: "Score:", justify: "EC", exW: 1})
score :=	subGrid.Add(2, 1, "Text", {text: "000000", justify: "WC", exW: 1})
subGrid.AutoSize()
subGrid.Pos.w := 0
subGrid.__Init(subGrid.Pos)
score.GuiControl("", "0")

myGui.AddControl("1-100", 1, subGrid, 1, , 1)
ctrl := myGui.Add("1-100", "2-101", "Text", , "", 1, 1, 1, 1)
myGui.RegisterBackground(ctrl)

fun := Func("AddButtonTimer").Bind(myGui, score, 1, 100, 2, 101)
SetTimer, % fun, 1000
myGui.Show("w1000 h" 1000 + subGrid.Pos.h)
myGui.MinSize()
return

AddButtonTimer(gui, score, minX, maxX, minY, maxY) {
	Random, x, % minX, % maxX
	Random, y, % minY, % maxY
	AddButton(gui, x, y, score)
	GuiReDraw(gui)
}

AddButton(gui, x, y, score) {
	ctrl := gui.Add(x, y, "Button", "w0 h0", "", 1, 1, 1, 1)
	ctrl.callback := Func("RemoveButton").Bind(gui, gui.GetNewestCellGroup(), score)
	ctrl.ZOrder(True)
}

RemoveButton(gui, cell, score) {
	gui.RemoveCell(cell)
	score.GuiControl("", score.GuiControlGet() + 1)
	GuiReDraw(gui)
}

GuiReDraw(gui) {
	gui.Redraw()
	;area := gui.pos.copy(), area.x := 0, area.y := 0
	;gui.__DrawGrid(area)
}
