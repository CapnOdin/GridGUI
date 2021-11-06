
#Include <Gdip>

OnExit("Exit")
pToken := Gdip_Startup()

Loop, Files, D:\Scripts\AutoHotkey\Examples\GUI\GridGUI 3\Examples\Example*.ahk
{
	AhkGuiToImage(A_LoopFileLongPath)
}
return

AhkGuiToImage(path) {
	SplitPath, % path, , dir, , name 

	Run, % """" A_AHKPath """ """ path """", % dir, , pid
	
	WinWait, % "ahk_pid " pid
	
	if(WinExist("ahk_class #3277")) {
		WinWaitClose, ahk_class #32770
	}
	
	Sleep, 1000
	
	WinGet, hwnds, List, % "ahk_pid " pid
	loop % hwnds {
		WinGetPos, x, y, w, h, % "ahk_id " hwnds%A_Index%
		pBitmap := Gdip_CropImage(pBitmapTmp := Gdip_BitmapFromScreen(4), x, y, w, h)
		Gdip_DisposeImage(pBitmapTmp)
		if(hwnds > 1) {
			fileName := name " " A_Index ".png"
		} else {
			fileName := name ".png"
		}
		Gdip_SaveBitmapToFile(pBitmap, fileName, 100)
		Gdip_DisposeImage(pBitmap)
	}

	Process, Close, % pid
}

Exit() {
	Global
	Gdip_Shutdown(pToken)
}

Gdip_CropImage(pBitmap, x, y, w, h) {
   pBitmap2 := Gdip_CreateBitmap(w, h), G2 := Gdip_GraphicsFromImage(pBitmap2)
   Gdip_DrawImage(G2, pBitmap, 0, 0, w, h, x, y, w, h)
   Gdip_DeleteGraphics(G2)
   return pBitmap2
}