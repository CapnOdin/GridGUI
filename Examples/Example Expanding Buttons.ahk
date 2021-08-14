
#Include %A_ScriptDir%\..\GridGui.ahk

myGui := new GridGUI("ahk", "Resize", true)
loop 3 {
	myGui.Add(A_Index, A_Index, "Button", , A_Index, A_Index != 2, A_Index != 2, A_Index != 2, A_Index != 2)
}
myGui.Show("w500 h500")
pos := myGui.WinGetPos()
myGui.WinMove(pos.x - pos.w / 2)

myGui2 := new GridGUI("ahk", "Resize", true)
loop 3 {
	myGui2.Add(A_Index, A_Index, "Button", , A_Index, A_Index = 2, A_Index = 2, A_Index = 2, A_Index = 2)
}
myGui2.Show("w500 h500")
myGui2.WinMove(pos.x + pos.w / 2, pos.y)
return

GuiClose:
	ExitApp
