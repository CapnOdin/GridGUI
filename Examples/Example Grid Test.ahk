#Include %A_ScriptDir%\..\GridGUI.ahk

myGui := new GridGUI("Grid Test", "resize", true)

MsgBox, % myGui.hwnd

/*
myGui.Add(1, 1, "Button", "w10 h10")
myGui.Add(10, 1, "Button", "w10 h10")
myGui.Add(1, 10, "Button", "w10 h10")
myGui.Add(10, 10, "Button", "w10 h10")
*/


loop 8 {
	myGui.Add(A_Index + 1, 1, "Button", "w10 h10", , 1, 1)
}

loop 8 {
	myGui.Add(A_Index + 1, 10, "Button", "w10 h10", , 1, 1)
}

loop 8 {
	myGui.Add(1, A_Index + 1, "Button", "w10 h10", , 1, 1)
}

loop 8 {
	myGui.Add(10, A_Index + 1, "Button", "w10 h10", , 1, 1)
}


/*
loop 10 {
	myGui.Add(A_Index, 1, "Button", "w10 h10", , 1, 1)
}

loop 10 {
	myGui.Add(A_Index, 10, "Button", "w10 h10", , 1, 1)
}

loop 8 {
	myGui.Add(1, A_Index + 1, "Button", "w10 h10", , 1, 1)
}

loop 8 {
	myGui.Add(10, A_Index + 1, "Button", "w10 h10", , 1, 1)
}
*/

/*
loop 10 {
	i := A_Index
	loop 10 {
		j := A_Index
		myGui.Add(i, j, "Button", "w10 h10", , 1, 1)
	}
}
*/

myGui.Add("2-9", "2-9", "Button", , , 1, 1, 1, 1)

myGui.Show("w500 h500")
return

GuiClose:
	ExitApp
