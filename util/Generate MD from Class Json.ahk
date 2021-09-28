

for i, path in GetFilesInFolder("*.json") {
	MakeClassMDFromFile(path)
}

MakeClassMDFromFile(path) {
	json := Jxon_Load(FileOpen(path, "r `n").Read())
	
	for className, classObj in json {
		FileOpen(className ".md", "w").Write(AddClass(className, classObj))
	}
}

AddClass(className, json, depth := 1) {
	mkdocs := RepeatStr(depth, "#") className "`n" "<figure markdown=""1"">`n" json["desc"] "`n</figure>`n---`n"
	
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
			mkdocs .= "[" subclassName "](Classes/" subclassName ".md)`n`n" ; .= AddClass(subclassName, classObj, depth + 2) "`n`n"
		}
	}
	return mkdocs
}

AddVariable(name, json) {
	return "####" name "`n`n> **desc**: " json["desc"] "`n`n> **type**: " json["type"] (json["default"] ? "`n`n> **default**: " json["default"] : "")
}

AddFunction(name, json) {
	mkdocs := "####" name "`n**desc**: " json["desc"]
	if(json["args"]) {
		mkdocs .= "`n`n**args**:"
		for i, arg in json["args"] {
			mkdocs .= "`n`n> " AddArgument(arg)
		}
	}
	if(json["returns"]) {
		mkdocs .= "`n`n**returns**:`n`n> **desc**: " json["returns"]["desc"] "`n`n> **type**: " json["returns"]["type"]
	}
	return mkdocs
}

AddArgument(json) {
	return "**name**: " json["name"] "`n`n> **desc**: " json["desc"] "`n`n> **type**: " json["type"] (json["default"] ? "`n`n> **default**: " json["default"] : "")
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
