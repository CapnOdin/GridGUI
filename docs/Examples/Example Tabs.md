---
hide:
  - toc
---
# Example Tabs

---
```AutoHotkey
#Include <GridGUI>

args := {Options: "w0 h0", exW: 1, exH: 1, fillW: true, fillH: true}

myGui := new GridGUI("Tab Example", "resize")
myGui.GuiClose := GridGUI.ExitApp

tab := new GridGUI.TabControl(myGui.hwnd, , "Name 1|Name 2|Name 3|Name 4")
myGui.AddControl(1, 1, tab, args)

tab.tabs[1].Add(1, 1, "Button", args)

tab.tabs[2].Add(1, 1, "Button", args)
tab.tabs[2].Add(2, 2, "Button", args)

tab.tabs[3].Add(1, 1, "Button", args)
tab.tabs[3].Add(2, 2, "Button", args)
tab.tabs[3].Add(3, 3, "Button", args)

subgrid := new GridGUI.SubGrid(myGui.hwnd, GridGUI.Area(0, 0))
subgrid.Margin(0, 0)

tab.tabs[4].Add(1, 1, "Button", args)
tab.tabs[4].AddControl(2, 2, subgrid, args)
tab.tabs[4].Add(3, 3, "Button", args)

loop 10 {
	newsubgrid := new GridGUI.SubGrid(myGui.hwnd, GridGUI.Area(0, 0))
	newsubgrid.Margin(0, 0)
	subgrid.Add(1, 1, "Button", args)
	subgrid.AddControl(2, 2, newsubgrid, args)
	subgrid.Add(3, 3, "Button", args)
	subgrid.AutoSize()
	subgrid := newsubgrid
}

subgrid.AutoSize()
myGui.AutoSize()
myGui.Show("w300 h300")
myGui.MinSize()
return
```