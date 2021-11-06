

for i, example in GetFilesInFolder("D:\Scripts\AutoHotkey\Examples\GUI\GridGUI 3\Examples\Example*.ahk") {
	ConvertExample(example)
}

ConvertExample(path) {
	source := FileOpen(path, "r `n").Read()
	source := RegExReplace(source, "mi `n)^#Include .+GridGUI\.ahk$", "#Include <GridGUI>")
	SplitPath, path, , , , name
	template := GetTemplate()
	template := StrReplace(template, "<<TITLE>>", name)
	template := StrReplace(template, "<<IMAGES>>", GetImages(name))
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
<<IMAGES>>

``````AutoHotkey
<<CODE>>
``````
)"
	return res
}

GetImages(name) {
	imgs :=  GetFilesInFolder("D:\Scripts\AutoHotkey\Examples\GUI\GridGUI Docs\GridGUI-Doc\docs\imgs\Examples\" name "*.png")
	if(imgs.Count()) {
		res := "<figure markdown=""1"">`n"
		for i, img in imgs {
			SplitPath, % img, fileName
			if(fileName ~= "^" name "( \d+)?\.png$") {
				res .= "![" name "](../imgs/Examples/" fileName ") "
			}
		}
		return res "`n" "</figure>"
	}
}

GetFilesInFolder(path, maxitems := False, mode := "") {
	files := []
	Loop, Files, % path, % mode
	{
		if(maxitems && A_Index > maxitems) {
			Break
		}
		files.Push(A_LoopFileLongPath)
	}
	return files
}