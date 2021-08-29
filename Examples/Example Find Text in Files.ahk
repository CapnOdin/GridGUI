#Include %A_ScriptDir%\..\GridGUI.ahk

SetBatchLines, -1

myGui := new GridGUI("Text to Find", "resize")

FEd := myGui.Add(1, 1, "Edit", , , 1, , 1)
FBt := myGui.Add(3, 1, "Button", , "Files", , , 1, , "CW")
FBt.callback := Func("ChoseFiles").Bind(FEd)

SEd := myGui.Add(1, 2, "Edit", , , 1, , 1)
SBt := myGui.Add(3, 2, "Button", "Default", "Search", , , , , "CW")

lv_files := new GridGUI.ListviewControl(myGui.hwnd, , "File Names|Line Num|Line|Path")
myGui.AddControl("1-3", 3, lv_files, 1, 1, 1, 1)
myGui.Add("1-3", 4, "StatusBar", , , , , 1)

SBt.callback := Func("SearchCallback").Bind(lv_files, SEd, FEd)

SB_SetParts(60, 40)
myGui.Show("w700 h700")
return

GuiClose:
	ExitApp
return

#If myGui.WinActive() && myGui.ControlGetFocus() = lv_files.hwnd
	^c::Clipboard := JoinFileTextLine("`n", lv_files.GetSelection(), 3)
	;^a::lv_files.SetSelection()
#If

SearchCallback(lstview, term, path) {
	Static s := new Sleepy()
	term := term.vVar
	path := path.vVar
	SB_SetText("", 3)
	s.Start()
	lstview.Delete()
	files := GetFilesInFolder(path, , "r")
	count := Search(lstview, term, files)
	elapsed := s.Elapsed()
	lstview.ModifyCol(, "AutoHdr")
	lstview.ModifyCol(1, "AutoHdr")
	SB_SetText("`tCompleted", 1)
	SB_SetText("Found " count " occurrences in " Round(elapsed / 1000, 3) " seconds", 3)
}

Search(lstview, term, files) {
	SB_SetText("`tSearching", 1)
	SB_SetText("`t`t0.0%", 2)
	length := files.Length()
	count := 0
	progress := 0
	for i, file in files {
		SplitPath, % file, FileName, Dir
		Loop, Read, % file
		{
			if(A_LoopReadLine ~= term) {
				lstview.Add(, FileName, A_Index, Trim(A_LoopReadLine), Dir)
				count++
			}
		}
		currentProgress := Round(A_Index / length * 100, 1)
		if(currentProgress != progress) {
			SB_SetText("`t`t" Round(A_Index / length * 100, 1) "%", 2)
			progress := currentProgress
		}
	}
	return count
}

ChoseFiles(path) {
	FileSelectFile, selection, 3, % path.vVar
	attributes := FileExist(selection)
	if(attributes) {
		if(InStr(attributes, "D")) {
			selection .= "\*"
		}
		path.GuiControl("", selection)
	}
}

Class Sleepy {
	__New() {
		DllCall("QueryPerformanceFrequency", "Int64*", freq)
		this.freq := freq
	}
	
	Start() {
		DllCall("QueryPerformanceCounter", "Int64*", start)
		this.started := start
	}
	
	Now() {
		DllCall("QueryPerformanceCounter", "Int64*", now)
		return now
	}
	
	Elapsed() {
		return (this.Now() - this.started) / this.freq * 1000
	}
	
	Sleep(time) {
		this.Start()
		Sleep, % time > 25 ? time - 25 : -1
		While(this.Elapsed() < time) {
			
		}
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


JoinFileTextLine(sep, obj, index) {
    for key, val in obj
        str .= val[index] . sep
    return SubStr(str, 1, -StrLen(sep))
}
