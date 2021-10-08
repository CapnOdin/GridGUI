---
hide:
  - toc
---
# Example Font

---
```AutoHotkey
#Include <GridGUI>

myGui := new GridGUI("Font Example", "resize", True)
myGui.GuiClose := GridGUI.ExitApp

args := {text:"AuToHotKey", exW:1, exH:1}

i := 1
myGui.add(1, i++, "Text", args)
myGui.Font("cTeal", "Times New Roman")
myGui.add(1, i++, "Text", args)
myGui.add(1, i++, "Text", args).Font("s12 cFuchsia")
myGui.add(1, i++, "Text", args).Font("s12 q1 cGreen", "Verdana")
myGui.add(1, i++, "Text", args)
myGui.Font("c0000FF")
myGui.add(1, i++, "Text", args)

myGui.AutoSize()
myGui.MinSize()
myGui.Show()
return
```