#Include %A_ScriptDir%\..\..\GridGUI.ahk
#Include %A_ScriptDir%\util.ahk

SetBatchLines, -1
SetWinDelay, 0
SetControlDelay, 0

global gw := 30

area := GridGUI.Pos(1, 1, 20, 20)
pixelArea := GridGUI.Pos(0, 0, 20 * gw, 20 * gw)

Global errorF := FileOpen("errors.csv", "a")
errors := 0

CoordMode, ToolTip, Screen
loop % 1000 {
	ToolTip, % A_Index, 0, 0, 18
	errors += DoTest(A_Index, area, pixelArea, , true)
	;f := Func("Test").Bind(test[1], test[2], test[3])
	;SetTimer, % f, -1000
}
MsgBox, % errors
ExitApp
Return

DoTest(iteration, area, pixelArea, iterations := 10, destroyOnSuccess := false) {
	Static timerfun := Func("IsStuck"), pretimerobj := ""
	cellgroups := []
	loop % iterations {
		;cellGroupDefinition := GetRandomCellGroup(area, cellgroups, true) ; no overlapping controls 
		cellGroupDefinition := GetRandomCellGroup(area, cellgroups, false) ; overlapping controls 
		if(cellGroupDefinition) {
			cellgroups.Push(cellGroupDefinition)
		}
	}
	if(pretimerobj) {
		SetTimer, % pretimerobj, Off
	}
	pretimerobj := timerfun.Bind(iteration, cellgroups)
	SetTimer, % pretimerobj, -2000

	;myGui := new GridGUI.GUI("title", "Resize")
	;AddGrid(myGui, area, gw)
	;AddCellGroups(myGui, cellgroups, gw)
	
	Clipboard := ToCsv(cellgroups)

	myGGui := new GridGUI("Grid Test", "resize")
	MakeGridGuiVersion(myGGui, cellgroups)
	
	;myGGui.Show("w" pixelArea.w " h" pixelArea.h " NA")
	
	myGGui.Draw(pixelArea)
	
	;While(pixelArea.Area() != myGGui.Pos.Area() && !myGGui.grid.arbitrator.IsReduced) {
	;	Sleep, 50
	;}
	
	/*
	res1 := ""
	for i, cell in myGGui.grid.cells {
		res1 .= cell.ctrlPos.Area() "`n"
	}
	
	loop 100 {
		res := ""
		for i, cell in myGGui.grid.cells {
			res .= cell.ctrlPos.Area() "`n"
		}
		ToolTip, % res
		Sleep, 25
	}
	
	MsgBox, % res == res1
	*/
	
	;return [mygui, myGGui, cellgroups]

	if(destroyOnSuccess && !ContainsErrors(myGGui, Func("WriteToErrorFile"))) {
		;mygui.Destroy()
		myGGui.Destroy()
		return false
	} else {
		myGGui.Show("w" pixelArea.w " h" pixelArea.h " NA")
		MsgBox, % cellgroups.Length() "`n" ToCsv(cellgroups)
		errorF.Write(iteration "`n")
		errorF.Write(ToCsv(cellgroups) "`n`n`n")
		;mygui.Destroy()
		myGGui.Destroy()
		return true
	}
}

IsStuck(iteration, cellgroups) {
	errorF.Write(iteration " Stuck`n")
	errorF.Write(ToCsv(cellgroups) "`n`n`n")
}

ToCsv(cellgroups) {
	res := ""
	for i, cg in cellgroups {
		res .= cg[1].x "," cg[1].y "," cg[1].w "," cg[1].h "," cg[2] "`n"
	}
	return res
}

Test(g1, g2, cg) {
	if(!ContainsErrors(g2, Func("WriteToErrorFile"))) {
		g1.Destroy()
		g2.Destroy()
	} else {
		MsgBox, % cg.Length() "`n" ObjectToString(cg)
	}
}

WriteToErrorFile(errorstr) {
	errorF.Write(errorstr)
}
