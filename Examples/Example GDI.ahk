#Include, <Gdip>

#Include %A_ScriptDir%\..\GridGUI.ahk

#NoEnv
SetBatchLines, -1
SetWinDelay, 0

if(!pToken := Gdip_Startup()) {
	MsgBox, 48, gdiplus error!, Gdiplus failed to start. Please ensure you have gdiplus on your system
	ExitApp
}

myGui := new GridGUI("Grid Test", "resize")
myGui.GuiClose := GridGUI.ExitApp
myGui.Add("1-3", 1, "Edit", , , 1, , 1)
myGui.Add(1, 2, "Button", , "Button")
myGui.Add(2, 2, "Edit", "w0", , 1, , 1)
laugh := new GdiLaughingMan(myGui.hwnd, 100)
myGui.AddControl(3, "2-3", laugh, 1, 1, 1, 1)
myGui.GetNewestCellGroup().SetAspectRatio(1)
myGui.Add(1, 3, "Button", , "Button")
myGui.Add(2, 3, "Button", , "Button Button")
myGui.Add("1-3", 4, "Button", , "Button", 1, , 1)
myGui.AutoSize()
myGui.MinSize()
myGui.Show()
return

Class GdiLaughingMan Extends GridGUI.GdiControl {
	Images := []
	pBackground := 0
	pForground := 0
	index := 0
	interval := 25
	ratio := 601 / 552
	
	__New(guiHwnd, minsize, interval := 25) {
		this.interval := interval
		Base.__New(guiHwnd, "w" minsize " h" minsize, new GridGUI.BoundFunc("GdiLaughingMan.DelayedUpdate", this))
		this.StartAnimation()
	}
	
	DelayedUpdate(ctrl) {
		fun := new GridGUI.BoundFunc("GdiLaughingMan.UpdateLaughinManImages", this, GridGUI.Util.GetSizeByLimitingSide(this.pos, this.ratio).w)
		SetTimer, % fun, -100
		this.GDIDraw()
	}
	
	StartAnimation(interval := 25) {
		if(this.fun) {
			this.StopAnimation()
		}
		interval := interval ? interval : this.interval
		fun := this.fun := new GridGUI.BoundFunc("GdiLaughingMan.Animate", this)
		SetTimer, % fun, % interval
	}
	
	AnimationSetSpeed(interval) {
		this.StopAnimation()
		fun := this.fun := new GridGUI.BoundFunc("GdiLaughingMan.Animate", this)
		SetTimer, % fun, % interval
	}
	
	StopAnimation() {
		if(this.fun) {
			fun := this.fun
			SetTimer, % fun, Off
			this.fun := ""
		}
	}
	
	Animate() {
		this.index := this.index + 1 < this.imgSize ? this.index + 1 : 1
		if(!this.pBackground || !this.pForground) {
			return
		}
		pText := this.GetNextImage(this.index)
		Gdip_DrawImage(this.G, this.pBackground)
		Gdip_DrawImage(this.G, pText)
		Gdip_DrawImage(this.G, this.pForground)
		this.GDIDraw()
	}
	
	GetNextImage(index) {
		if(!this.Images[index]) {
			Gdip_GraphicsClear(this.G)
			this.Images[index] := this.GetRotatedImage(Angle := index * -1.5, this.pText)
		}
		return this.Images[index]
	}

	UpdateLaughinManImages(size) {
		if(this.pre_size != size - 2) {
			Critical
			size -= 2
			Gdip_GraphicsClear(this.G)
			this.pre_size := size
			
			Colour := 0xff111b62
			Angle := 0
			Font := "Impact"
			
			Height := size / this.ratio
			Width := size / this.ratio
			Width2 := size
			
			fSize := 49 / 6

			Options := "x" Width / 2 " y" Height * (fSize + 17) / 550 " h" Height * 57 / 550 " w10 Centre c" SubStr(Colour, 3) " r4 s" Height * fSize * 4 / 550 " Bold"
			Str := "I thought what I'd do was, I'd pretend I was one of those deaf-mutes. "

			Gdip_DisposeImage(this.pBackground)
			Gdip_DisposeImage(this.pForground)
			Gdip_DisposeImage(this.pText)
			
			this.pBackground := ""
			this.pForground := ""
			
			this.pBackground := this.GetBackground(Colour, Width, Height, Width2)
			this.pForground := this.GetForground(Colour, Width2, Height)
			this.pText := this.CircularText(Angle, Str, Width, Height, Font, Options)

			for i, img in this.Images {
				Gdip_DisposeImage(img)
			}
			
			this.Images := []
			
			this.imgSize := 360 / 1.5
		}
	}

	CircularText(Angle, Str, Width, Height, Font, Options){
		pBitmap := Gdip_CreateBitmap(Width, Height)
		
		G := Gdip_GraphicsFromImage(pBitmap)
		
		Gdip_SetSmoothingMode(G, 4)
		
		if(!Angle) {
			Angle := 360 / StrLen(Str)
		}
		
		for i, chr in StrSplit(Str) {
			Gdip_TextToGraphics(G, chr, Options, Font, Width, Height)
			this.RotateAroundCenter(G, Angle, Width, Height)
		}
		
		Gdip_DeleteGraphics(G)
		Return pBitmap
	}

	GetRotatedImage(Angle, pBitmap) {
		Gdip_GetImageDimensions(pBitmap, Width, Height)
		
		resBitmap := Gdip_CreateBitmap(Width, Height)
		
		G := Gdip_GraphicsFromImage(resBitmap)
		
		Gdip_SetSmoothingMode(G, 4)
		
		this.RotateAroundCenter(G, Angle, Width, Height)
		Gdip_DrawImage(G, pBitmap)
		
		Gdip_DeleteGraphics(G)
		Return resBitmap
	}

	RotateAroundCenter(G, Angle, Width, Height) {
		Gdip_TranslateWorldTransform(G, Width / 2, Height / 2)
		Gdip_RotateWorldTransform(G, Angle)
		Gdip_TranslateWorldTransform(G, - Width / 2, - Height / 2)
	}

	GetForground(Colour, Width, Height) {
		pBitmap := Gdip_CreateBitmap(Width + 2, Height)
		G := Gdip_GraphicsFromImage(pBitmap)
		Gdip_SetSmoothingMode(G, 4)
		
		EH := 550 ; ExampleHight
		
		pSize  := Height * 32 / EH ; Head Border Width
		cSize  := Height * 114 / EH ; Head Border Width
		cY := Height * 215 / EH ; Start of Head Hole
		
		capOH := Height * 50 / EH ; Cap Opening Height
		capOY := Height * 247 / EH ; Start of Cap Opening
		capOX := Width - cSize + pSize / 2 ; Start of Cap Opening
		
		hStart := Height * (49 + 17) / EH ; Start of Head Border
		
		pBrush := Gdip_BrushCreateSolid(0xffffffff)
		Gdip_FillEllipse(G, pBrush, Width - cSize + pSize / 2 - 1, cY + pSize / 2, cSize - pSize, cSize - pSize)
		
		pPen := Gdip_CreatePen(Colour, pSize)
		Gdip_DrawEllipse(G, pPen, Width - cSize + pSize / 2 - 1, cY + pSize / 2, cSize - pSize, cSize - pSize)
		
		pBrush2 := Gdip_BrushCreateSolid(Colour)
		Gdip_FillRectangle(G, pBrush2, capOX - cSize / 3, cY, hStart, pSize)
		
		Gdip_FillRectangle(G, pBrush2, capOX - cSize / 3, cY + capOH + pSize, hStart, pSize)
		
		Gdip_FillRectangle(G, pBrush, capOX - cSize / 2, capOY, cSize - pSize / 2 + 0.5, capOH + 0.5)
		
		Gdip_DeletePen(pPen)
		Gdip_DeleteBrush(pBrush)
		Gdip_DeleteBrush(pBrush2)
		Gdip_DeleteGraphics(G)
		return pBitmap
	}

	GetBackground(Colour, Width, Height, Width2) {
		pBitmap := Gdip_CreateBitmap(Width2 + 2, Height + 2)
		G := Gdip_GraphicsFromImage(pBitmap)
		Gdip_SetSmoothingMode(G, 4)
		
		EH := 550 ; ExampleHight
		
		bSize  := Height * 17 / EH ; Border Width
		hSize  := Height * 32 / EH ; Head Border Width
		hStart := Height * (49 + 17) / EH ; Start of Head Border
		hWidth := hStart * 2 + hSize
		
		holeH := Height * 14 / EH ; Head Hole Height
		holeY := Height * 247 / EH ; Start of Head Hole
		
		capH := Height * 32 / EH ; Cap Height
		capY := Height * 215 / EH ; Start of Head Hole
		
		capTopTW := Height * 19 / EH ; Cap Top Top Width
		capTopBW := Height * 27 / EH ; Cap Top Bottum Width
		capTopH := Height * 12 / EH ; Cap Top Height
		capTopY := Height * 58 / EH ; Start of Cap Top
		
		capOH := Height * 50 / EH ; Cap Opening Height
		capOY := Height * 248 / EH ; Start of Cap Opening
		capOX := Width - hWidth + hStart ; Start of Cap Opening
		
		mS := Height * 30 / EH ; Mouth Height
		mY := Height * 132 / EH ; Start of Mouth
		
		pBrush := Gdip_BrushCreateSolid(0xffffffff)
		pBrush2 := Gdip_BrushCreateSolid(Colour)
		
		; Addeds the ahk default gui color as background to make the edges look nicer
		pBrush555 := Gdip_BrushCreateSolid(0xfff0f0f0)
		;pBrush555 := Gdip_BrushCreateSolid(0xffff50ff)
		Gdip_FillRectangle(G, pBrush555, 0, 0, Width2 + 2, Height + 2)
		
		; White Background
		Gdip_FillEllipse(G, pBrush, bSize / 2, bSize / 2, Width - bSize, Height - bSize)
		
		; Flat part of Mouth
		Gdip_FillRectangle(G, pBrush2, mY + mS / 2, capOY + capOH - 1, Width - (mY + mS / 2) * 2, mS)
		
		; Curved part of Mouth
		pPen := Gdip_CreatePen(Colour, mS)
		Gdip_DrawEllipse(G, pPen, mY + mS / 2, mY + mS / 2, Width - (mY + mS / 2) * 2, Width - (mY + mS / 2) * 2)
		Gdip_DeletePen(pPen)
		Gdip_FillRectangle(G, pBrush, mY * 0.8, mY * 0.8, Width - mY * 1.5, capOY + capOH - mY * 0.8)
		
		; Eyes
		this.DrawEyes(G, Colour, Width, Height)
		
		; Thin Blue Border
		pPen := Gdip_CreatePen(Colour, bSize)
		Gdip_DrawEllipse(G, pPen, bSize / 2, bSize / 2, Width - bSize, Height - bSize)
		Gdip_DeletePen(pPen)
		
		; Thick Blue Border
		pPen := Gdip_CreatePen(Colour, hSize)
		Gdip_DrawEllipse(G, pPen, hStart + hSize / 2, hStart + hSize / 2, Width - hWidth, Height - hWidth)
		Gdip_DeletePen(pPen)
		
		; White Hole in the Left Part of the Face
		Gdip_FillRectangle(G, pBrush, hStart, holeY, hSize * 1.2, holeH)
		
		; Thick Blue Line Over the Eyes
		Gdip_FillRectangle(G, pBrush2, hStart + hSize, capY, Width - hWidth - hSize, capH)
		
		; Blue Shape On Top the Cap
		xt := Width / 2 - capTopTW / 2, yt := capTopY, xb := Width / 2 - capTopBW / 2, yb := capTopY + capTopH
		points := xt "," yt "|" xt + capTopTW "," yt "|" xb + capTopBW "," yb "|" xb "," yb
		Gdip_FillPolygon(G, pBrush2, points)
		
		;Gdip_FillRectangle(G, pBrush, capOX - hSize / 2, capOY, hSize * 2, capOH)
		
		Gdip_DeleteBrush(pBrush)
		Gdip_DeleteBrush(pBrush2)
		Gdip_DeleteGraphics(G)
		return pBitmap
	}

	DrawEyes(G, Colour, Width, Height) {
		pBitmap := Gdip_CreateBitmap(Width, Height)
		eyesG := Gdip_GraphicsFromImage(pBitmap)
		Gdip_SetSmoothingMode(eyesG, 4)
		
		EH := 550 ; ExampleHight
		
		eyeD  := Height * 70 / EH ; Eye Diameter
		eyeY  := Height * 254 / EH ; Start of Eye
		eyeX1 := Height * 166 / EH ; Start of Eye
		eyeX2 := Height * 313 / EH ; Start of Eye
		pupilH := Height * 14 * 2 / EH
		
		pBrush := Gdip_BrushCreateSolid(0xfffffffff)
		pBrush2 := Gdip_BrushCreateSolid(Colour)
		
		Gdip_FillEllipse(eyesG, pBrush2, eyeX1, eyeY, eyeD, eyeD)
		Gdip_FillEllipse(eyesG, pBrush2, eyeX2, eyeY, eyeD, eyeD)
		
		Gdip_FillEllipse(eyesG, pBrush, eyeX1 - 1, eyeY + eyeD / 2 - pupilH / 2, eyeD + 2, pupilH)
		Gdip_FillEllipse(eyesG, pBrush, eyeX2 - 1, eyeY + eyeD / 2 - pupilH / 2, eyeD + 2, pupilH)
		
		this.ClearRect(eyesG, eyeX1 * 0.95, eyeY + eyeD / 2, eyeD * 1.3, eyeD / 2)
		this.ClearRect(eyesG, eyeX2 * 0.95, eyeY + eyeD / 2, eyeD * 1.3, eyeD / 2)
		
		Gdip_DrawImage(G, pBitmap)
		
		Gdip_DeleteBrush(pBrush)
		Gdip_DeleteBrush(pBrush2)
		Gdip_DeleteGraphics(eyesG)
		Gdip_DisposeImage(pBitmap)
	}

	ClearRect(G, x, y, w, h) {
		Gdip_SetClipRect(G, x, y, w, h)
		Gdip_GraphicsClear(G)
		Gdip_ResetClip(eyesG)
	}
}