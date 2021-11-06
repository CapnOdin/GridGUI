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
			mkdocs .= AddVariable2(var, varObj) "`n`n"
		}
	}
	
	if(json["methods"].Count()) {
		mkdocs .= RepeatStr(depth + 1, "#") "Methods" "`n`n"
		for fun, funObj in json["methods"] {
			mkdocs .= AddFunction2(fun, funObj) "`n`n"
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
	variable := "####" name "`n`n"
				. "> **desc**: " HandleClassLinks(json["desc"]) "`n`n"
				. "> **type**: " HandleClassLinks(json["type"])
	if(json.HasKey("default")) {
		variable .= "`n`n> **default**: " DefaultToValue(json)
	}
	if(json["link"]) {
		variable .= "`n`n> **link**: [link](" json["link"] ")"
	}
	return variable
}

AddFunction(name, json) {
	mkdocs := "####" name "`n"
			. "**desc**: " HandleClassLinks(json["desc"])
	if(json["args"]) {
		mkdocs .= "`n`n**args**:"
		for i, arg in json["args"] {
			mkdocs .= "`n`n> " AddArgument(arg)
		}
	}
	if(json["link"]) {
		mkdocs .= "`n`n> **link**: [link](" json["link"] ")"
	}
	if(json["returns"]) {
		mkdocs .= "`n`n**returns**:`n`n"
				. "> **desc**: " HandleClassLinks(json["returns"]["desc"]) "`n`n"
				. "> **type**: " HandleClassLinks(json["returns"]["type"])
	}
	return mkdocs
}

AddArgument(json) {
	argument := "**name**: " json["name"] "`n`n"
				. "> **desc**: " HandleClassLinks(json["desc"]) "`n`n"
				. "> **type**: " HandleClassLinks(json["type"])
	if(json.HasKey("default")) {
		argument .= "`n`n> **default**: " DefaultToValue(json)
	}
	if(json["link"]) {
		argument .= "`n`n> **link**: [link](" json["link"] ")"
	}
	return argument
}

AddVariable2(name, json, indent := "") {
	locIndent := "    "
	variable := indent "!!! info """""  "`n`n"
				. indent locIndent "####" name "`n"
				. indent locIndent "!!! info """""  "`n`n"
				. indent locIndent locIndent "**desc**: " HandleClassLinks(json["desc"]) "`n`n"
				. indent locIndent locIndent "**type**: " HandleClassLinks(json["type"])
	if(json.HasKey("default")) {
		variable .= "`n`n" indent locIndent locIndent "**default**: " DefaultToValue(json)
	}
	/*
	if(json["meta"]) {
		variable .= "`n`n" indent locIndent locIndent "**meta**: " json["meta"]
	}
	*/
	if(json["link"]) {
		variable .= "`n`n" indent locIndent locIndent "**link**: [link](" json["link"] ")"
	}
	return variable
}

AddFunction2(name, json, indent := "") {
	locIndent := "    "
	mkdocs := indent "!!! note """"`n"
			. indent locIndent "####" name "`n"
			. AddDefinition3(name, json["args"], indent . locIndent) "`n"
			. AddDescription2(json["desc"], indent . locIndent)
	if(json["args"]) {
		mkdocs .= "`n`n" indent locIndent "??? example " """parameters"""
		for i, arg in json["args"] {
			mkdocs .= "`n`n" AddArgument2(arg, indent . locIndent . locIndent)
		}
	}
	if(json["link"]) {
		mkdocs .= "`n`n" indent locIndent "**link**: [link](" json["link"] ")"
	}
	if(json["returns"]) {
		mkdocs .= "`n`n" AddReturns2(json["returns"], indent . locIndent)
	}
	return mkdocs
}

AddDefinition2(name, json, indent := "") {
	locIndent := "    "
	def := "``AutoHotKey`n" name "("
	args := ""
	for i, arg in json {
		args .= arg["name"]
		if(arg.HasKey("default")) {
			args .= " := " DefaultToValue(arg)
		}
		args .= ", "
	}
	def .= SubStr(args, 1, -2) ")``"
	definition := indent "!!! tip """"" . "`n`n"
				. indent locIndent ":material-bacteria:{ .definition } **" def "**`n`n"
	return definition
}

AddDefinition3(name, json, indent := "") {
	locIndent := "    "
	def := "``````AutoHotKey`n"
		. indent locIndent name "("
	args := ""
	for i, arg in json {
		args .= arg["name"]
		if(arg.HasKey("default")) {
			args .= " := " DefaultToValue(arg)
		}
		args .= ", "
	}
	def .= SubStr(args, 1, -2) ")`n"
		. indent locIndent "``````"
	definition := indent "!!! tip """"" . "`n`n"
				. indent locIndent def "`n`n"
	return definition
}

AddDescription2(json, indent := "") {
	locIndent := "    "
	desc := indent "!!! abstract """"" . "`n`n"
				. indent locIndent ":material-clipboard-text:{ .desc } " HandleClassLinks(json) "`n`n"
	return desc
}

AddArgument2(json, indent := "") {
	locIndent := "    "
	argument := indent "!!! info """""  "`n`n"
				. indent locIndent "**name**: " json["name"] "`n`n"
				. indent locIndent "**desc**: " HandleClassLinks(json["desc"]) "`n`n"
				. indent locIndent "**type**: " HandleClassLinks(json["type"])
	if(json.HasKey("default")) {
		argument .= "`n`n" indent locIndent "**default**: " DefaultToValue(json)
	}
	if(json["link"]) {
		argument .= "`n`n" indent locIndent "**link**: [link](" json["link"] ")"
	}
	return argument
}

AddReturns2(json, indent := "") {
	locIndent := "    "
	returns := indent "!!! question """"" . "`n`n"
				. indent locIndent ":material-arrow-u-left-bottom-bold:{ .return } " "**return value**" "`n"
				. indent locIndent "!!! question """"" . "`n`n"
				. indent locIndent locIndent "**desc**: " HandleClassLinks(json["desc"]) "`n`n"
				. indent locIndent locIndent "**type**: " HandleClassLinks(json["type"])
	if(json["link"]) {
		returns .= "`n`n" indent locIndent locIndent "**link**: [link](" json["link"] ")"
	}
	return returns
}

HandleClassLinks(text) {
	matchs := RegExMatchAll(text, "O)``?(GridGUI(\.\w+)*(\(\))?)``?")
	loop % matchs.count() {
		oldtxt := text
		match := matchs[matchs.count() - A_Index + 1]["match"][0]
		pos := matchs[matchs.count() - A_Index + 1]["pos"]
		
		link := ClassPathToLink(match)
		
		text := SubStr(text, 1, pos - 1) link SubStr(text, pos + StrLen(match))
	}
	return text
}

DefaultToValue(json) {
	if(json["default"] = "" and (InStr(json["type"], "bool") || InStr(json["type"], "false"))) {
		if(json.HasKey("defaultVal")) {
			return json["defaultVal"]
		}
		return "false"
	}
	return json["default"]
}

ClassPathToLink(path) {
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
