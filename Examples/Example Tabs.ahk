
#Include %A_ScriptDir%\..\GridGUI.ahk

myGui := new GridGUI("Tab Example", "resize")
tab := new GridGUI.TabControl(myGui.hwnd, , "Name 1|Name 2|Name 3|Name 4")
myGui.AddControl(1, 1, tab, 1, 1, 1, 1)

tab.tabs[1].Add(1, 1, "Button", , , 1, 1, 1, 1)

tab.tabs[2].Add(1, 1, "Button", , , 1, 1, 1, 1)
tab.tabs[2].Add(2, 2, "Button", , , 1, 1, 1, 1)

tab.tabs[3].Add(1, 1, "Button", , , 1, 1, 1, 1)
tab.tabs[3].Add(2, 2, "Button", , , 1, 1, 1, 1)
tab.tabs[3].Add(3, 3, "Button", , , 1, 1, 1, 1)

subgrid := new GridGUI.SubGrid(myGui.hwnd)
subgrid.Margin(0, 0)

tab.tabs[4].Add(1, 1, "Button", , , 1, 1, 1, 1)
tab.tabs[4].AddControl(2, 2, subgrid, 1, 1, 1, 1)
tab.tabs[4].Add(3, 3, "Button", , , 1, 1, 1, 1)

loop 10 {
	newsubgrid := new GridGUI.SubGrid(myGui.hwnd)
	newsubgrid.Margin(0, 0)
	subgrid.Add(1, 1, "Button", , , 1, 1, 1, 1)
	subgrid.AddControl(2, 2, newsubgrid, 1, 1, 1, 1)
	subgrid.Add(3, 3, "Button", , , 1, 1, 1, 1)
	subgrid.AutoSize()
	subgrid := newsubgrid
}

subgrid.AutoSize()
myGui.AutoSize()
myGui.Show("w300 h300")
myGui.MinSize()
return

GuiClose:
	ExitApp
