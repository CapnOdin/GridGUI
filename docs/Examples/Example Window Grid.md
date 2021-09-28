---
hide:
  - toc
---
# Example Window Grid

---
```AutoHotkey
#Include <GridGUI>
SetBatchLines, -1
CoordMode, Mouse, Screen

myGui := new GridGUI("Window Grid", "resize")
myGui.GuiClose := GridGUI.ExitApp
myGui.Show("w800 h800")
column := 0
row := 1
MaxColumn := 4
return

*~LButton::
	MouseGetPos, x, y, hwnd
	
	; Uncomment this if you don't like cool stuff
	if(hwnd = myGui.hwnd) {
		return
	}

	SendMessage, 0x84, 0, (x&0xFFFF) | (y&0xFFFF) << 16, , % "ahk_id " hwnd

	RegExMatch("ERROR TRANSPARENT NOWHERE CLIENT CAPTION SYSMENU SIZE MENU HSCROLL VSCROLL MINBUTTON MAXBUTTON LEFT RIGHT TOP TOPLEFT TOPRIGHT BOTTOM BOTTOMLEFT BOTTOMRIGHT BORDER OBJECT CLOSE HELP", "O)(?:\w+\s+){" . ErrorLevel+2&0xFFFFFFFF . "}(?<AREA>\w+\b)", HT)

	if(ht["area"] = "CAPTION") {
		While(GetKeyState("LButton","P") && x = _x && y = _y) { ;Wait until user begins dragging
			MouseGetPos, _x, _y
		}
		
		While GetKeyState("LButton","P") { ;Show ToolTip while dragging
			MouseGetPos, _x, _y
		}
		if(myGui.pos.Contains(new GridGUI.Position(_x, _y))) {
			window := new GridGUI.WindowControl(myGui.hwnd, hwnd)
			column++
			if(column = MaxColumn) {
				column := 1
				row++
			}
			myGui.AddControl(column, row, window, 1, 1, 1, 1)
			myGui.ReDraw()
		}
	}
Return
```