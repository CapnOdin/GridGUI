
Class GdiControl Extends GridGUI.ArbitraryControl {
	
	WS_EX_LAYERED := 0x00080000
	
	__New(guiHwnd, options, graphic := false) {
		Base.__New(guiHwnd, "text", options, "")
		this.pos := new GridGUI.Position(0, 0)
		this.graphic := graphic
		this.Control("ExStyle", this.WS_EX_LAYERED)
	}
	
	Draw(pos) {
		this.__Prepare(pos)
		this.pos := pos
		Base.Draw(pos)
		this.UpdateGraphic()
	}
	
	UpdateGraphic() {
		if(this.graphic) {
			this.graphic.Call(this)
		}
		this.GDIDraw()
	}
	
	GDIDraw() {
		this.__UpdateLayeredWindow(this.hwnd, this.hdc, this.pos.x, this.pos.y, this.pos.w, this.pos.h)
	}
	
	__Prepare(area) {
		if(!this.pos.Equal(area)) {
			this.__CleanUp()
			this.hbm	:= this.__CreateDIBSection(area.w, area.h)
			this.hdc	:= this.__CreateCompatibleDC()
			this.obm	:= this.__SelectObject(this.hdc, this.hbm)
			this.G		:= this.__GraphicsFromHDC(this.hdc)
		}
	}
	
	__CleanUp() {
		; Select the object back into the hdc
		this.__SelectObject(this.hdc, this.obm)

		; Now the bitmap may be deleted
		this.__DeleteObject(this.hbm)

		; Also the device context related to the bitmap may be deleted
		this.__DeleteDC(this.hdc)

		; The graphics may now be deleted
		this.__DeleteGraphics(this.G)
	}
	
	__UpdateLayeredWindow(hwnd, hdc, x := "", y := "", w := "", h := "", Alpha := 255) {
		local Ptr, pt, winRect
		Ptr := A_PtrSize ? "UPtr" : "UInt"
		
		if((x != "") && (y != "")) {
			VarSetCapacity(pt, 8), NumPut(x, pt, 0, "UInt"), NumPut(y, pt, 4, "UInt")
		}

		if((w = "") || (h = "")) {
			this.__CreateRect(winRect, 0, 0, 0, 0) ;is 16 on both 32 and 64
			DllCall("GetWindowRect", Ptr, hwnd, Ptr, &winRect)
			w := NumGet(winRect, 8, "UInt")  - NumGet(winRect, 0, "UInt")
			h := NumGet(winRect, 12, "UInt") - NumGet(winRect, 4, "UInt")
		}

		return DllCall("UpdateLayeredWindow", Ptr, hwnd, Ptr, 0, Ptr, ((x = "") && (y = "")) ? 0 : &pt, "int64*", w|h<<32, Ptr, hdc, "int64*", 0, "uint", 0, "UInt*", Alpha<<16|1<<24, "uint", 2)
	}
	
	__CreateDIBSection(w, h, bpp := 32, ByRef ppvBits := 0) {
		local Ptr, hdc, bi, hbm, hdc2
		Ptr := A_PtrSize ? "UPtr" : "UInt"
		
		hdc := DllCall("GetDC", A_PtrSize ? "UPtr" : "UInt", 0)
		VarSetCapacity(bi, 40, 0)
		
		NumPut(w, bi, 4, "uint"), NumPut(h, bi, 8, "uint"), NumPut(40, bi, 0, "uint"), NumPut(1, bi, 12, "ushort"), NumPut(0, bi, 16, "uInt"), NumPut(bpp, bi, 14, "ushort")
		
		hbm := DllCall("CreateDIBSection", Ptr, hdc2, Ptr, &bi, "uint", 0, A_PtrSize ? "UPtr*" : "uint*", ppvBits, Ptr, 0, "uint", 0, Ptr)
		
		DllCall("ReleaseDC", Ptr, 0, Ptr, hdc)
		return hbm
	}
	
	__CreateCompatibleDC(hdc := 0) {
		return DllCall("CreateCompatibleDC", A_PtrSize ? "UPtr" : "UInt", hdc)
	}

	__SelectObject(hdc, hgdiobj) {
		local Ptr
		Ptr := A_PtrSize ? "UPtr" : "UInt"
		return DllCall("SelectObject", Ptr, hdc, Ptr, hgdiobj)
	}
	
	__GraphicsFromHDC(hdc) {
		local pGraphics
		pGraphics := 0
		DllCall("gdiplus\GdipCreateFromHDC", A_PtrSize ? "UPtr" : "UInt", hdc, A_PtrSize ? "UPtr*" : "UInt*", pGraphics)
		return pGraphics
	}
	
	__DeleteObject(hObject) {
		return DllCall("DeleteObject", A_PtrSize ? "UPtr" : "UInt", hObject)
	}
	
	__DeleteDC(hDC) {
		return DllCall("DeleteDC", A_PtrSize ? "UPtr" : "UInt", hDC)
	}
	
	__DeleteGraphics(pGraphics) {
		return DllCall("gdiplus\GdipDeleteGraphics", A_PtrSize ? "UPtr" : "UInt", pGraphics)
	}
	
	__CreateRect(ByRef Rect, x, y, w, h) {
		VarSetCapacity(Rect, 16)
		NumPut(x, Rect, 0, "uint"), NumPut(y, Rect, 4, "uint"), NumPut(w, Rect, 8, "uint"), NumPut(h, Rect, 12, "uint")
	}
}
