
Class Position {
	__New(x, y, w := 0, h := 0) {
		this.x := x
		this.y := y
		this.w := w
		this.h := h
	}
	
	Middle() {
		return new GridGUI.Position(this.x + this.w / 2, this.y + this.h / 2)
	}
	
	Equal(pos) {
		return this.x = pos.x && this.y = pos.y && this.w = pos.w && this.h = pos.h
	}
	
	Area() {
		return this.w * this.h
	}
	
	Contains(pos) {
		local com := this.Compare(pos)
		return  Round(com[1] - pos.w, 5) = 0 &&  Round(com[2] - pos.h, 5) = 0
	}
	
	Intersect(pos) {
		return this.__OverlapX(pos) && this.__OverlapY(pos)
	}
	
	Touch(pos) {
		local com := this.Compare(pos)
		return com[1] >= 0 && com[2] >= 0 && (!com[1] || !com[2])
	}
	
	Disjoint(pos) {
		local com := this.Compare(pos)
		return com[1] < 0 && com[2] < 0
	}
	
	Compare(pos) {
		return [this.__CompareX(pos), this.__CompareY(pos)]
	}
	
	__OverlapX(pos) {
		return Max(0, this.__CompareX(pos))
	}
	
	__OverlapY(pos) {
		return Max(0, this.__CompareY(pos))
	}
	
	__CompareX(pos) {
		return this.__OneDimentionalCompare(this.x, this.x + this.w, pos.x, pos.x + pos.w)
	}
	
	__CompareY(pos) {
		return this.__OneDimentionalCompare(this.y, this.y + this.h, pos.y, pos.y + pos.h)
	}
	
	__OneDimentionalCompare(min1, max1, min2, max2) {
		return Min(max1, max2) - Max(min1, min2)
	}
	
	Copy() {
		return new GridGUI.Position(this.x, this.y, this.w, this.h)
	}
	
	ToStr(indent := "") {
		return indent "x:`t" Format("{:2}", this.x) "`n" indent "y:`t" Format("{:2}", this.y) "`n" indent "w:`t" Format("{:2}", this.w) "`n" indent "h:`t" Format("{:2}", this.h)
	}
}
