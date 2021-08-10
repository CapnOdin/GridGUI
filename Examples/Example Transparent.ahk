#Include %A_ScriptDir%\..\GridGUI.ahk

myGUI := new GridGUI()
myGUI.Color("EEAA99")
myGUI.Options("+AlwaysOnTop +ToolWindow -Caption -border")
myGUI.Add(1, 1, "Picture", "w500 h-1", "Images\bottom.jpg")
myGUI.WinSet("TransColor", "EEAA99")
myGUI.AutoSize()
myGUI.Show("x" 500 " y" 500)
return

~LButton::
	if(toggle := !toggle) {
		myGUI.Hide()
	} else {
		myGUI.Show()
	}
return

GuiClose:
	ExitApp
