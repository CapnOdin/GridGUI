#Include %A_ScriptDir%\..\..\GridGUI.ahk
#Include %A_ScriptDir%\util.ahk

SetBatchLines, -1

area := new GridGUI.Position(1, 1, 20, 20)

Global errorF := FileOpen("errors.csv", "a")
errors := 0

CoordMode, ToolTip, Screen
loop % 1000 {
	ToolTip, % A_Index, 0, 0, 18
	errors += DoTest(A_Index, area, , true)
	;f := Func("Test").Bind(test[1], test[2], test[3])
	;SetTimer, % f, -1000
}
MsgBox, % errors
ExitApp
Return

DoTest(iteration, area, iterations := 10, destroyOnSuccess := false) {
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
	
	gw := 30

	;myGui := new GridGUI.GUI("title", "Resize")
	;AddGrid(myGui, area, gw)
	;AddCellGroups(myGui, cellgroups, gw)
	
	Clipboard := ToCsv(cellgroups)

	myGGui := new GridGUI("Grid Test", "resize")
	MakeGridGuiVersion(myGGui, cellgroups)
	myGGui.Show("NA")
	myGGui.AutoSize()
	myGGui.MinSize()
	myGGui.Hide()

	;pos := myGGui.WinGetPos()
	
	;myGGui.Show("x" pos.x + (area.w * gw) / 2 " w" area.w * gw " h" area.h * gw) ; " NA")
	;mygui.Show(	"x" pos.x - (area.w * gw) / 2 " w" area.w * gw " h" area.h * gw) ; " NA")
	
	myGGui.Show("w" area.w * gw " h" area.h * gw " NA")
	
	
	WinWait, % "ahk_id " myGGui.Hwnd
	;return [mygui, myGGui, cellgroups]

	if(destroyOnSuccess && !ContainsErrors(myGGui, Func("WriteToErrorFile"))) {
		;mygui.Destroy()
		myGGui.Destroy()
		return false
	} else {
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
