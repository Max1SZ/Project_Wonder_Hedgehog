; ---------------------------------------------------------------------------
; Sprite mappings - sonic's band
; ---------------------------------------------------------------------------
Map_Band_internal:	mappingsTable
	mappingsTableEntry.w	.band

.band:	spriteHeader
	spritePiece	-$18, -$10, 3, 4, 0, 0, 0, 0, 0
	spritePiece	0, -$10, 3, 4, $C, 0, 0, 0, 0
.band_End

	even

