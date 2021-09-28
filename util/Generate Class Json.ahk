


MakeClassJsonFromFile("D:\Scripts\AutoHotkey\Examples\GUI\GridGUI 3\GridGUI.ahk")
for i, path in GetFilesInFolder("D:\Scripts\AutoHotkey\Examples\GUI\GridGUI 3\GridGUI-lib\*", "R") {
	MakeClassJsonFromFile(path)
}

MakeClassJsonFromFile(path) {
	Lines := StrSplit(FileOpen(path, "r `n").Read(), "`n", "`r")
	obj := ParseAHK(Lines, HTV, DocComment := ">>>")
	SplitPath, path, , , , name
	
	updatedObj := {}
	
	for className, classObj in obj["classes"] {
		if(!(className ~= "( |\.)$")) {
			if(className) {
				updatedObj[className] := CopyUpdatedClassFromClassObject(classObj)
			}
		}
	}
	FileOpen(name ".json", "w").Write(prettyPrint(Jxon_Dump(updatedObj, 4)))
}

CopyUpdatedClassFromClassObject(classObj) {
	retClassObj := {"members": {}, "methods": {}, "classes": {}}
	for fun, children in classObj {
		if(children.Count()) {
			retClassObj["classes"][fun] := CopyUpdatedClassFromClassObject(children)
		} else {
			if(RegExMatch(fun, "O)(\w+)\(((\w+(\s*:?=\s*[^,)]+\s*)?,?\s*)*)\s*\)", match)) {
				args := StrSplit(match[2], ",")
				retClassObj["methods"][match[1]] := AddFunction(args)
			}
		}
	}
	return retClassObj
}


MakeJSdocsStringsFromFile(path) {
	Lines := StrSplit(FileOpen(path, "r `n").Read(), "`n", "`r")
	obj := ParseAHK(Lines, HTV, DocComment := ">>>")
	SplitPath, path, , , , name
	FileOpen(name ".json", "w").Write(Jxon_Dump(obj["classes"], 4))
	for className, classObj in obj["classes"] {
		if(!(className ~= "( |\.)$")) {
			;GetJSdocsFromClass(className, classObj)
		}
	}
}

GetJSdocsFromClass(className, classObj) {
	f := FileOpen(className ".class", "a")
	for fun  in classObj {
		if(RegExMatch(fun, "O)(\w+)\(((\w+(\s*:?=\s*[^,)]+\s*)?,?\s*)*)\s*\)", match)) {
			;MsgBox, % "Matched fucntion:" match[1] "`n" "With parameters: " match[2] "`n" match[0]
			f.Write(MakeJSdocsString(match[1], StrSplit(match[2], ",")) "`n`n")
		} else {
			GetJSdocsFromClass(fun, classObj[fun])
		}
	}
}

;ConvertExample("D:\Scripts\AutoHotkey\Examples\GUI\GridGUI 3\")

MakeJSdocsString(funName, parameters) {
	Static nl := "`n * "
	res := "/**" nl "@name " funName nl nl "@brief" nl
	
	for i, parameter in parameters {
		RegExMatch(parameter, "Oi)(\w+)\s*(?::?=\s*)?([\w\d"",.]+)?", match)
		res .= nl "@param "
		if(match[2] != "") {
			res .= "[" match[1] " = " match[2] "]"
		} else {
			res .= match[1]
		}
		res .= " - "
	}
	res .= nl "@return`n */"
	return res
}

ConvertExample(dir) {
	res := ""
	for i, path in GetFilesInFolder(dir "*", , "R") {
		if(!InStr(path, "\.git\")) {
			for j, match in RegExMatchAll(FileOpen(path, "r `n").Read(), "imO)Class\s+(\w+)\s+(Extends\s+\w+(\.\w+)*\s+)?\{") {
				res .= match["match"][1] "`n"
			}
		}
	}
	MsgBox, % res
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


RegExMatchAll(Haystack, NeedleRegEx, StartingPosition := 1) {
	res := [], match := "", length := StrLen(Haystack)
	pos := StartingPosition
	while(pos := RegExMatch(Haystack, NeedleRegEx, match, pos + getMatchLength(match))) {
		if(getMatchLength(match)) {
			res.Push({"match" : match, "pos" : pos})
		} else {
			pos++
		}
		if(length < pos) {
			Break
		}
	}
	return res
}

getMatchLength(match) {
	return StrLen(IsObject(match) ? match[0] : match)
}


AddFunction(args) {
	fun := {"desc": "", "returns": {"desc": "", "type": ""}}
	if(args.Count()) {
		fun["args"] := []
		for i, parameter in args {
			if(RegExMatch(parameter, "Oi)(\w+)\s*(?::?=\s*)?([\w\d"",.]+)?", match)) {
				fun["args"].Push({"name": match[1], "desc": "", "type": "string|number|object", "link": ""})
				if(match[2] != "") {
					default := match[2]
					fun["args"][fun["args"].Count()]["default"] := default
					if default is Number
					{
						if(default != "") {
							fun["args"][fun["args"].Count()]["type"] := "number"
						} else {
							fun["args"][fun["args"].Count()]["type"] := "string"
						}
					} else {
						if(default ~= "i)true|false") {
							fun["args"][fun["args"].Count()]["type"] := "bool"
						} else {
							fun["args"][fun["args"].Count()]["type"] := "string"
						}
					}
				}
			}
		}
	}
	return fun
}

prettyPrint(str) {
	return RegExReplace(RegExReplace(RegExReplace(RegExReplace(RegExReplace(RegExReplace(str, "    ", "`t"), "i)""(true|false)""", "$1"), """(\d+)""", "$1"), "\\""", ""), "\\n", "`t"), "\\t", "")
}

#include Parse Ahk Scripts.ahk