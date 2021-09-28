---
hide:
  - toc
---
# Example GroupBox Simple

---
```AutoHotkey
#Include <GridGUI>

myGui := new GridGUI("GroupBox", "resize")
myGui.GuiClose := GridGUI.ExitApp

myGui.Add("1-3", "1-3", "GroupBox", "w40 h40", "Title", , , 1, 1)
myGui.Add(2, 2, "Button", "w50 h50", "Button", 1, 1, 1, 1)
myGui.AutoSize()
myGui.MinSize()
myGui.Show()
return
```