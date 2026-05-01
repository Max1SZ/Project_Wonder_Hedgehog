; ---------------------------------------------------------------------------
; Object 19 - Band
; ---------------------------------------------------------------------------

Band:
		moveq	#0,d0
		move.b	obRoutine(a0),d0
		move.w	Band_Index(pc,d0.w),d1
		jmp	Band_Index(pc,d1.w)
; ===========================================================================
Band_Index:	dc.w Band_Main-Band_Index
		dc.w Band_Move-Band_Index
; ===========================================================================

Band_Main:	; Routine 0
		addq.b	#2,obRoutine(a0)
		move.l	#Map_Band,obMap(a0)
		move.w	#make_art_tile(ArtTile_Band,3,0),obGfx(a0)
		move.b	#4,obRender(a0)
		move.b	#$13,obActWid(a0)
		move.b	#4,obPriority(a0)

Band_Move:	; Routine 2
		move.w	#$1B,d1
		move.w	#$10,d2
		move.w	#$10,d3
		move.w	obX(a0),d4
	if FixBugs
		; Objects shouldn't call DisplaySprite and DeleteObject in
		; the same frame or else cause a null-pointer dereference.
		; This same bugfix can be found in Sonic 2's unused copy of
		; this object.
		out_of_range.w	DeleteObject
		bra.w	DisplaySprite
	else
		bsr.w	DisplaySprite
		out_of_range.w	DeleteObject
		rts
	endif

