Class LOGFONT{
	Static WM_GETFONT := 0x31, WM_CTLCOLORSTATIC := 0x0138, LONG := 4
	
	HFONT := 0, Hwnd
	
	Height := 0, Width := 0, Escapement := 0, Orientation := 0, Weight := 0
	
	Italic := 0, Underline := 0, StrikeOut := 0, CharSet := 0, OutPrecision := 0, ClipPrecision := 0, Quality := 0, PitchAndFamily := 0
	
	Colour := "", _Colour := 0
	
	FaceName := ""
	
	__New(Hwnd, guiHwnd := false){
		this.Hwnd := Hwnd
		this.guiHwnd := guiHwnd
		this.UpdateFont()
	}
	
	UpdateFont() {
		local amount, buff
		this.HFONT := DllCall("SendMessage", "Ptr", this.Hwnd, "UInt", this.WM_GETFONT, "Ptr", 0, "Ptr", 0, "Ptr")
		amount := DllCall("GetObject", "Ptr", this.HFONT, "Int", 0, "Ptr", 0)
		VarSetCapacity(buff, amount, 0)
		amount := DllCall("GetObject", "Ptr", this.HFONT, "Int", amount, "Ptr", &buff)
		this.GetData(buff, amount)
		this.__GetColour()
	}
	
	GetData(ByRef buff, amount) {
		local offset
		; Of Type LONG
		this.Height			:= Abs(NumGet(buff, this.LONG * 0, "Int"))	; (0) Verified I think
		this.Width			:= NumGet(buff, this.LONG * 1, "Int")		; (4)
		this.Escapement		:= NumGet(buff, this.LONG * 2, "Int")		; (8)
		this.Orientation	:= NumGet(buff, this.LONG * 3, "Int")		; (12)
		this.Weight			:= NumGet(buff, this.LONG * 4, "Int")		; (16) Verified
		
		this.Point			:= Round(this.Height * 72 / A_ScreenDPI) ; See https://docs.microsoft.com/en-us/windows/win32/learnwin32/dpi-and-device-independent-pixels
		
		offset := this.LONG * 5
		
		; Of Type BYTE
		this.Italic			:= NumGet(buff,	offset,		"UChar")		; (20) Verified
		this.Underline		:= NumGet(buff, offset + 1,	"UChar")		; (21) Verified
		this.StrikeOut		:= NumGet(buff, offset + 2,	"UChar")		; (22) Verified
		this.CharSet		:= NumGet(buff, offset + 3,	"UChar")		; (23) 
		this.OutPrecision	:= NumGet(buff, offset + 4,	"UChar")		; (24) 
		this.ClipPrecision	:= NumGet(buff, offset + 5,	"UChar")		; (25) 
		this.Quality		:= NumGet(buff, offset + 6,	"UChar")		; (26) Verified
		this.PitchAndFamily	:= NumGet(buff, offset + 7,	"UChar")		; (27) 
		this.FaceName		:= StrGet(&buff + offset + 8)				; (28) Verified
	}
	
	PixelWidth(str) {
		return this.GetDimensionsInPixels(str).w
	}
	
	PixelHeight(str) {
		return this.GetDimensionsInPixels(str).h
	}
	
	__GetColour() {
		local guiHwnd, hDC
		if(!this.guiHwnd) {
			guiHwnd := DllCall("GetAncestor", "Ptr", this.hwnd, "UInt", 1, "Ptr")
		} else {
			guiHwnd := this.guiHwnd
		}
		hDC := this.__GetDC()
		DllCall("SendMessage", "Ptr", guiHwnd, "UInt", this.WM_CTLCOLORSTATIC, "Ptr", hDC, "Ptr", this.Hwnd)
		this._Colour := DllCall("GetTextColor", "Ptr", hDC, "UInt")
		this.__ReleaseDC(hDC)
		this.Colour := Format("{:06x}", GridGUI.Util.BGRtoRGB(this._Colour))
	}
	
	GetDimensionsInPixels(str) {
		local hDC, hFold, nWidth, nHeight
		hDC := this.__GetDC()
		
		hFold := DllCall("SelectObject", "Uint", hDC, "Uint", this.HFONT)
		DllCall("GetTextExtentPoint32", "Uint", hDC, "str", str, "int", StrLen(str), "int64P", nSize)
		
		DllCall("SelectObject", "Uint", hDC, "Uint", hFold)
		this.__ReleaseDC(hDC)
		
		nWidth  := nSize & 0xFFFFFFFF
		nHeight := nSize >> 32 & 0xFFFFFFFF
		
		Return new GridGUI.Position(0, 0, nWidth, nHeight)
	}
	
	__GetDC() {
		return DllCall("GetDC", "Uint", this.Hwnd)
	}
	
	__ReleaseDC(hDC) {
		DllCall("ReleaseDC", "Uint", this.Hwnd, "Uint", hDC)
	}
	
	ToOptions() {
		return "s" this.Point " w" this.Weight " c" this.Colour " q" this.Quality (this.Italic ? " Italic" : "") (this.Underline ? " Underline" : "") (this.StrikeOut ? " Strike" : "")
	}
	
	ToStr(){
		local LONG, BYTE
		LONG := "Size:`t`t" this.Point "`nHeight:`t`t" this.Height "`nWidth:`t`t" this.Width "`nEscapement:`t" this.Escapement "`nOrientation:`t" this.Orientation "`nWeight:`t`t" this.Weight
		
		BYTE := "Italic:`t`t" this.Italic "`nUnderline:`t`t" this.Underline "`nStrikeOut:`t`t" this.StrikeOut "`nCharSet:`t`t" this.CharSet "`nOutPrecision:`t" this.OutPrecision "`nClipPrecision:`t" this.ClipPrecision "`nQuality:`t`t" this.Quality "`nPitchAndFamily:`t" this.PitchAndFamily
		
		return "-" RegExReplace(this.FaceName, "[^a-zA-Z ]") "-`n" LONG "`n" BYTE "`n" "Colour:`t" this.Colour "`n" this.ToOptions()
	}
}
