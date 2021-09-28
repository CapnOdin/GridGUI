
for i, path in A_Args {
	ConvertExample(path)
}

;ConvertExample("D:\Scripts\AutoHotkey\Examples\GUI\GridGUI 3\Examples\Example 1.ahk")

ConvertExample(path) {
	source := FileOpen(path, "r `n").Read()
	source := RegExReplace(source, "mi `n)^#Include .+GridGUI\.ahk$", "#Include <GridGUI>")
	SplitPath, path, , , , name
	template := GetTemplate()
	template := StrReplace(template, "<<TITLE>>", name)
	template := StrReplace(template, "<<CODE>>", Trim(source, "`n `t"))
	
	FileOpen(A_ScriptDir "/" name ".md", "w").Write(template)
}

GetTemplate() {
	res := "
(
---
hide:
  - toc
---
# <<TITLE>>

---
``````AutoHotkey
<<CODE>>
``````
)"
	return res
}
