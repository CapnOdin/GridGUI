#Include %A_ScriptDir%\..\GridGUI.ahk

myGui := new GridGUI("Grid Test", "resize", true)

MsgBox, % myGui.hwnd

/*
myGui.AddControl(1, 1, "Button", "w10 h10")
myGui.AddControl(10, 1, "Button", "w10 h10")
myGui.AddControl(1, 10, "Button", "w10 h10")
myGui.AddControl(10, 10, "Button", "w10 h10")
*/


loop 8 {
	myGui.AddControl(A_Index + 1, 1, "Button", "w10 h10", , 1, 1)
}

loop 8 {
	myGui.AddControl(A_Index + 1, 10, "Button", "w10 h10", , 1, 1)
}

loop 8 {
	myGui.AddControl(1, A_Index + 1, "Button", "w10 h10", , 1, 1)
}

loop 8 {
	myGui.AddControl(10, A_Index + 1, "Button", "w10 h10", , 1, 1)
}


/*
loop 10 {
	myGui.AddControl(A_Index, 1, "Button", "w10 h10", , 1, 1)
}

loop 10 {
	myGui.AddControl(A_Index, 10, "Button", "w10 h10", , 1, 1)
}

loop 8 {
	myGui.AddControl(1, A_Index + 1, "Button", "w10 h10", , 1, 1)
}

loop 8 {
	myGui.AddControl(10, A_Index + 1, "Button", "w10 h10", , 1, 1)
}
*/

/*
loop 10 {
	i := A_Index
	loop 10 {
		j := A_Index
		myGui.AddControl(i, j, "Button", "w10 h10", , 1, 1)
	}
}
*/

myGui.AddControl("2-9", "2-9", "Button", , , 1, 1)

myGui.Show("w500 h500")
return

GuiClose:
	ExitApp
	
;			x: 2199	y: 591	w: 655	h: 678
;Client:					w: 639	h: 639