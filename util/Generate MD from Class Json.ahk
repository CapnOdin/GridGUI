#NoEnv

Global classes := {}
GetClasses()

for i, path in GetFilesInFolder("*.json", , "R") {
	MakeClassMDFromFile(path)
}

GetClasses() {
	for i, path in GetFilesInFolder("*.json", , "R") {
		json := Jxon_Load(FileOpen(path, "r `n").Read())
		for className, classObj in json {
			classes[className] := classObj
		}
	}
}

MakeClassMDFromFile(path) {
	json := Jxon_Load(FileOpen(path, "r `n").Read())
	
	for className, classObj in json {
		FileOpen(className ".md", "w").Write(AddClass(className, classObj))
	}
}

AddClass(className, json, depth := 1) {
	mkdocs := RepeatStr(depth, "#") className "`n" "<figure markdown=""1"">`n" HandleClassLinks(HandleClassLinks(json["type"])) "`n</figure>`n---`n"
	
	if(json["members"].Count()) {
		mkdocs .= RepeatStr(depth + 1, "#") "Members" "`n`n"
		for var, varObj in json["members"] {
			mkdocs .= AddVariable(var, varObj) "`n`n"
		}
	}
	
	if(json["methods"].Count()) {
		mkdocs .= RepeatStr(depth + 1, "#") "Methods" "`n`n"
		for fun, funObj in json["methods"] {
			mkdocs .= AddFunction(fun, funObj) "`n`n"
		}
	}
	
	if(json["classes"].Count()) {
		mkdocs .= RepeatStr(depth + 1, "#") "Classes" "`n`n"
		for subclassName, classObj in json["classes"] {
			FileOpen(subclassName ".md", "w").Write(AddClass(subclassName, classObj))
			mkdocs .= "[" subclassName "](../" subclassName "/)`n`n" ; .= AddClass(subclassName, classObj, depth + 2) "`n`n"
		}
	}
	return mkdocs
}

AddVariable(name, json) {
	return "####" name "`n`n> **desc**: " HandleClassLinks(json["desc"]) "`n`n> **type**: " HandleClassLinks(json["type"]) (json["default"] ? "`n`n> **default**: " json["default"] : "") (json["link"] ? "`n`n> **link**: [link](" json["link"] ")": "")
}

AddFunction(name, json) {
	mkdocs := "####" name "`n**desc**: " HandleClassLinks(json["desc"])
	if(json["args"]) {
		mkdocs .= "`n`n**args**:"
		for i, arg in json["args"] {
			mkdocs .= "`n`n> " AddArgument(arg)
		}
		(json["link"] ? "`n`n> **link**: [link](" json["link"] ")": "")
	}
	if(json["link"]) {
		mkdocs .= "`n`n> **link**: [link](" json["link"] ")"
	}
	if(json["returns"]) {
		mkdocs .= "`n`n**returns**:`n`n> **desc**: " HandleClassLinks(json["returns"]["desc"]) "`n`n> **type**: " json["returns"]["type"]
	}
	return mkdocs
}

AddArgument(json) {
	return "**name**: " json["name"] "`n`n> **desc**: " HandleClassLinks(json["desc"]) "`n`n> **type**: " HandleClassLinks(json["type"]) (json["default"] ? "`n`n> **default**: " json["default"] : "")
}

HandleClassLinks(text) {
	;RegExReplace(text, "`(GridGUI(\.\w+)*)`", "`[$1]()`")
	;if(InStr(text, "GridGUI")) {
	;	MsgBox, % text
	;}
	matchs := RegExMatchAll(text, "O)``?(GridGUI(\.\w+)*(\(\))?)``?")
	loop % matchs.count() {
		oldtxt := text
		match := matchs[matchs.count() - A_Index + 1]["match"][0]
		pos := matchs[matchs.count() - A_Index + 1]["pos"]
		
		link := ClassPathToLink(match)
		
		text := SubStr(text, 1, pos - 1) link SubStr(text, pos + StrLen(match))
		
		;MsgBox, % oldtxt "`n" SubStr(oldtxt, 1, pos - 1) match SubStr(oldtxt, pos + StrLen(match))
		
		;text := StrReplace(text, match, link)
		
		/*
		if(SubStr(matchs[matchs.count() - A_Index + 1]["match"][1], -1) = "()") {
			RegExMatch(match, "O)(GridGUI(\.\w+)*)\.(\w+)\(\)", name)
			text := StrReplace(text, match, "[" name[0] "](../" StrReplace(name[1], ".", "/") "#" name[3] ")")
			;MsgBox, % name[0] "`n" name[1] "`n" name[2] "`n" name[3]
		} else {
			RegExMatch(match, "O)\.?(\w+)\(?\)?``?$", name)
			text := StrReplace(text, match, "[" name[1] "](../" name[1] "/)")
		}
		*/
		;MsgBox, % match
	}
	;MsgBox, % text "`n`n" oldtxt
	return text
}

ClassPathToLink(path) {
	;MsgBox, % path
	parts := StrSplit(StrReplace(path, "``"), ".")
	
	if(classes.HasKey(parts[2])) {
		parts.RemoveAt(1)
	}
	
	className := ""
	currentClass := classes
	res := ""
	for i, part in parts {
		if(currentClass.HasKey(part)) {
			className := part
			currentClass := currentClass[className]["classes"]
		} else {
			res := "[" path "](../" className "/#" Format("{:L}", part) ")"
		}
	}
	if(!res) {
		res := "[" path "](../" className "/" ")"
	}
	;MsgBox, % path "`n" res
	return res
}

RepeatStr(num, str) {
	res := ""
	loop % num {
		res .= str
	}
	return res
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