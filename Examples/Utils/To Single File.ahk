;#Include %A_ScriptDir%\..\..\GridGUI.ahk
;#Include %A_ScriptDir%\util.ahk

FileOpen("GridGUI-lib.ahk", "w").Write(AddIncludedScripts(A_ScriptDir "\..\..\GridGUI.ahk"))

AddIncludedScripts(path, alreadyIncluded := "") {
	if(!alreadyIncluded) {
		alreadyIncluded := {}
	}
	source := FileOpen(path, "r `n").Read()
	for i, match in RegExMatchAll(source, "imO `n)#Include\s+(?:(?:%A_ScriptDir%)|(?:%A_LineFile%))?(.+\.ahk)\s*$") {
		SplitPath, % match["match"][1], name
		if(!alreadyIncluded.HasKey(name)) {
			alreadyIncluded[name] := ""
			source := StrReplace(source, match["match"][0], AddIncludedScripts(path match["match"][1], alreadyIncluded))
		} else {
			source := StrReplace(source, match["match"][0], "")
		}
	}
	return source
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
