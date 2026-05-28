;	Static Name Aliases
;
;	$S783_hand	EQU	hand
	TITLE   C:\3DLOADT.C
	.8087
INCLUDELIB	SLIBCE
_TEXT	SEGMENT  WORD PUBLIC 'CODE'
_TEXT	ENDS
_DATA	SEGMENT  WORD PUBLIC 'DATA'
_DATA	ENDS
CONST	SEGMENT  WORD PUBLIC 'CONST'
CONST	ENDS
_BSS	SEGMENT  WORD PUBLIC 'BSS'
_BSS	ENDS
DGROUP	GROUP	CONST, _BSS, _DATA
	ASSUME DS: DGROUP, SS: DGROUP
PUBLIC  _OldHandle
EXTRN	_filelength:NEAR
EXTRN	_movedata:NEAR
EXTRN	_RpPrint:FAR
EXTRN	_LoadPicNoPal:NEAR
EXTRN	__dos_close:NEAR
EXTRN	_strupr:NEAR
EXTRN	_ScreenOn:FAR
EXTRN	__aNchkstk:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_EMSfree:NEAR
EXTRN	_EMSinit:NEAR
EXTRN	_EMSpages:NEAR
EXTRN	_getch:NEAR
EXTRN	_EMSalloc:NEAR
EXTRN	__dos_open:NEAR
EXTRN	__dos_read:NEAR
EXTRN	_EMSmap:NEAR
EXTRN	_Rp1:WORD
EXTRN	_Seg3D:WORD
EXTRN	_EMSseg:WORD
EXTRN	_GRPAGE0:BYTE
_BSS      SEGMENT
COMM NEAR	_File:	BYTE:	 2
COMM NEAR	_ObjHands:	 2:	 5
COMM NEAR	_ObjSegs:	 2:	 5
_BSS      ENDS
_DATA      SEGMENT
_OldHandle	DW	0ffffH
_DATA      ENDS
_BSS      SEGMENT
$S783_hand	DW 01H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 3
; Line 4
; Line 5
; Line 6
; Line 7
; Line 8
; Line 9
; Line 29
	PUBLIC	_LoadEMSDataFile
_LoadEMSDataFile	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__aNchkstk
	push	si
;	fptr = -20
;	hand = -16
;	fhand = -4
;	i = -10
;	size = -14
;	pages = -2
;	free = -6
;	total = -8
;	Slot = 6
;	FileName = 4
; Line 42
	lea	ax,WORD PTR [bp-4]	;fhand
	push	ax
	sub	cx,cx
	push	cx
	push	WORD PTR [bp+4]	;FileName
	call	__dos_open
	add	sp,6
; Line 44
	mov	ax,16384
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-4]	;fhand
	call	_filelength
	add	sp,2
	mov	WORD PTR [bp-14],ax	;size
	mov	WORD PTR [bp-12],dx
	add	ax,16383
	adc	dx,0
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-2],ax	;pages
; Line 46
	mov	si,ax
	call	_EMSinit
; Line 48
	lea	ax,WORD PTR [bp-8]	;total
	push	ax
	lea	ax,WORD PTR [bp-6]	;free
	push	ax
	call	_EMSpages
	add	sp,4
; Line 49
	cmp	si,WORD PTR [bp-6]	;free
	jle	$I744
; Line 50
; Line 51
	push	WORD PTR [bp-4]	;fhand
	call	__dos_close
	add	sp,2
; Line 53
	sub	ax,ax
	mov	bx,WORD PTR [bp+6]	;Slot
	shl	bx,1
	mov	WORD PTR _ObjHands[bx],ax
	mov	WORD PTR _ObjSegs[bx],ax
; Line 54
	cwd	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 55
; Line 57
	nop	
$I744:
	lea	ax,WORD PTR [bp-16]	;hand
	push	ax
	push	WORD PTR [bp-2]	;pages
	call	_EMSalloc
	add	sp,4
; Line 59
	mov	WORD PTR [bp-10],0	;i
	jmp	SHORT $F746
$FC747:
	push	WORD PTR [bp-16]	;hand
	push	ax
	push	ax
	call	_EMSmap
	add	sp,6
	inc	WORD PTR [bp-10]	;i
$F746:
	mov	ax,WORD PTR [bp-10]	;i
	cmp	WORD PTR [bp-2],ax	;pages
	ja	$FC747
; Line 61
	mov	ax,WORD PTR [bp-16]	;hand
	mov	bx,WORD PTR [bp+6]	;Slot
	shl	bx,1
	mov	WORD PTR _ObjHands[bx],ax
; Line 62
	mov	ax,WORD PTR _EMSseg
	mov	WORD PTR _ObjSegs[bx],ax
	mov	WORD PTR [bp-18],ax
; Line 63
	mov	WORD PTR [bp-20],0	;fptr
; Line 65
	lea	ax,WORD PTR [bp-10]	;i
	push	ax
	push	WORD PTR [bp-14]	;size
	push	WORD PTR [bp-18]
	push	WORD PTR [bp-20]	;fptr
	push	WORD PTR [bp-4]	;fhand
	call	__dos_read
	add	sp,10
; Line 66
	push	WORD PTR [bp-4]	;fhand
	call	__dos_close
	add	sp,2
; Line 68
	mov	ax,WORD PTR [bp-20]	;fptr
	mov	dx,WORD PTR [bp-18]
; Line 69
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_LoadEMSDataFile	ENDP
; Line 73
	PUBLIC	_LoadObjFile
_LoadObjFile	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	fptr = -4
;	Slot = 6
;	FileName = 4
; Line 76
	push	WORD PTR [bp+6]	;Slot
	push	WORD PTR [bp+4]	;FileName
	call	_LoadEMSDataFile
; Line 77
	mov	sp,bp
	pop	bp
	ret	

_LoadObjFile	ENDP
; Line 81
	PUBLIC	_LoadBigEMSFile
_LoadBigEMSFile	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
	push	si
;	fptr = -22
;	hand = -18
;	fhand = -4
;	i = -12
;	size = -16
;	pages = -2
;	junk = -10
;	free = -6
;	total = -8
;	Slot = 6
;	FileName = 4
; Line 93
	lea	ax,WORD PTR [bp-4]	;fhand
	push	ax
	sub	cx,cx
	push	cx
	push	WORD PTR [bp+4]	;FileName
	call	__dos_open
	add	sp,6
; Line 95
	mov	ax,16384
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-4]	;fhand
	call	_filelength
	add	sp,2
	mov	WORD PTR [bp-16],ax	;size
	mov	WORD PTR [bp-14],dx
	add	ax,16383
	adc	dx,0
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-2],ax	;pages
; Line 97
	mov	si,ax
	call	_EMSinit
; Line 98
	lea	ax,WORD PTR [bp-8]	;total
	push	ax
	lea	ax,WORD PTR [bp-6]	;free
	push	ax
	call	_EMSpages
	add	sp,4
; Line 99
	cmp	si,WORD PTR [bp-6]	;free
	jle	$I768
; Line 100
; Line 101
	push	WORD PTR [bp-4]	;fhand
	call	__dos_close
	add	sp,2
; Line 103
	sub	ax,ax
	mov	bx,WORD PTR [bp+6]	;Slot
	shl	bx,1
	mov	WORD PTR _ObjHands[bx],ax
	mov	WORD PTR _ObjSegs[bx],ax
; Line 104
	cwd	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 105
; Line 108
	nop	
$I768:
	lea	ax,WORD PTR [bp-18]	;hand
	push	ax
	push	WORD PTR [bp-2]	;pages
	call	_EMSalloc
	add	sp,4
; Line 110
	mov	ax,WORD PTR [bp-18]	;hand
	mov	bx,WORD PTR [bp+6]	;Slot
	shl	bx,1
	mov	WORD PTR _ObjHands[bx],ax
; Line 111
	mov	ax,WORD PTR _EMSseg
	mov	WORD PTR _ObjSegs[bx],ax
	mov	WORD PTR [bp-20],ax
; Line 114
	sub	ax,ax
	mov	WORD PTR [bp-22],ax	;fptr
	mov	WORD PTR [bp-12],ax	;i
	jmp	SHORT $F769
	nop	
$FC770:
; Line 115
	push	WORD PTR [bp-18]	;hand
	push	ax
	sub	ax,ax
	push	ax
	call	_EMSmap
	add	sp,6
; Line 116
	lea	ax,WORD PTR [bp-10]	;junk
	push	ax
	mov	ax,16384
	push	ax
	push	WORD PTR [bp-20]
	push	WORD PTR [bp-22]	;fptr
	push	WORD PTR [bp-4]	;fhand
	call	__dos_read
	add	sp,10
; Line 117
	inc	WORD PTR [bp-12]	;i
$F769:
	mov	ax,WORD PTR [bp-12]	;i
	cmp	WORD PTR [bp-2],ax	;pages
	ja	$FC770
; Line 119
	push	WORD PTR [bp-4]	;fhand
	call	__dos_close
	add	sp,2
; Line 121
	mov	ax,WORD PTR [bp-2]	;pages
	cwd	
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
; Line 122
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_LoadBigEMSFile	ENDP
; Line 126
	PUBLIC	_MapIn3dObjects
_MapIn3dObjects	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	EMShand = -2
;	SegIX = 4
; Line 131
	mov	bx,WORD PTR [bp+4]	;SegIX
	shl	bx,1
	mov	ax,WORD PTR _ObjHands[bx]
	mov	WORD PTR [bp-2],ax	;EMShand
	or	ax,ax
	je	$I776
	cmp	ax,WORD PTR _OldHandle
	je	$I776
; Line 132
	mov	WORD PTR _OldHandle,ax
; Line 134
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	call	_EMSmap
	add	sp,6
; Line 135
	push	WORD PTR [bp-2]	;EMShand
	mov	ax,1
	push	ax
	push	ax
	call	_EMSmap
	add	sp,6
; Line 136
	push	WORD PTR [bp-2]	;EMShand
	mov	ax,2
	push	ax
	push	ax
	call	_EMSmap
	add	sp,6
; Line 137
	push	WORD PTR [bp-2]	;EMShand
	mov	ax,3
	push	ax
	push	ax
	call	_EMSmap
; Line 138
; Line 140
$I776:
; Line 141
	mov	bx,WORD PTR [bp+4]	;SegIX
	shl	bx,1
	mov	ax,WORD PTR _ObjSegs[bx]
	mov	WORD PTR _Seg3D,ax
; Line 142
	mov	sp,bp
	pop	bp
	ret	

_MapIn3dObjects	ENDP
; Line 146
	PUBLIC	_LoadEMSPicFile
_LoadEMSPicFile	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	i = -6
;	free = -2
;	total = -4
;	ALLOC = 10
;	page = 8
;	Slot = 6
;	FileName = 4
; Line 152
	push	WORD PTR [bp+4]	;FileName
	mov	ax,1
	push	ax
	call	_LoadPicNoPal
	add	sp,4
; Line 154
	cmp	WORD PTR [bp+10],0	;ALLOC
	je	$I787
; Line 155
	call	_EMSinit
; Line 156
	lea	ax,WORD PTR [bp-4]	;total
	push	ax
	lea	ax,WORD PTR [bp-2]	;free
	push	ax
	call	_EMSpages
	add	sp,4
; Line 157
	mov	ax,WORD PTR [bp-2]	;free
	cmp	WORD PTR [bp+10],ax	;ALLOC
	jle	$I788
; Line 158
; Line 160
	sub	ax,ax
	mov	bx,WORD PTR [bp+6]	;Slot
	shl	bx,1
	mov	WORD PTR _ObjHands[bx],ax
	mov	WORD PTR _ObjSegs[bx],ax
; Line 161
	mov	sp,bp
	pop	bp
	ret	
; Line 162
; Line 163
$I788:
	mov	ax,OFFSET DGROUP:$S783_hand
	push	ax
	push	WORD PTR [bp+10]	;ALLOC
	call	_EMSalloc
	add	sp,4
; Line 164
	mov	ax,WORD PTR $S783_hand
	mov	bx,WORD PTR [bp+6]	;Slot
	shl	bx,1
	mov	WORD PTR _ObjHands[bx],ax
; Line 165
; Line 167
$I787:
	mov	ax,WORD PTR _EMSseg
	mov	bx,WORD PTR [bp+6]	;Slot
	shl	bx,1
	mov	WORD PTR _ObjSegs[bx],ax
; Line 169
	mov	WORD PTR [bp-6],0	;i
$FC790:
	push	WORD PTR $S783_hand
	mov	ax,WORD PTR [bp+8]	;page
	shl	ax,1
	shl	ax,1
	add	ax,WORD PTR [bp-6]	;i
	push	ax
	push	WORD PTR [bp-6]	;i
	call	_EMSmap
	add	sp,6
	inc	WORD PTR [bp-6]	;i
	cmp	WORD PTR [bp-6],4	;i
	jb	$FC790
; Line 171
	mov	ax,-1536
	push	ax
	sub	ax,ax
	push	ax
	mov	bx,WORD PTR [bp+6]	;Slot
	shl	bx,1
	push	WORD PTR _ObjSegs[bx]
	push	ax
	push	WORD PTR _GRPAGE0+2
	call	_movedata
; Line 172
	mov	ax,WORD PTR _EMSseg
; Line 173
	mov	sp,bp
	pop	bp
	ret	

_LoadEMSPicFile	ENDP
; Line 177
	PUBLIC	_MapInEMSSprite
_MapInEMSSprite	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	di
	push	si
;	SEG = -2
;	page = 6
;	SegIX = 4
; Line 181
	push	WORD PTR [bp+4]	;SegIX
	call	_MapIn3dObjects
	add	sp,2
	mov	WORD PTR [bp-2],ax	;SEG
	or	ax,ax
	je	$I797
; Line 182
	mov	bx,WORD PTR [bp+4]	;SegIX
	shl	bx,1
	push	WORD PTR _ObjHands[bx]
	mov	ax,WORD PTR [bp+6]	;page
	shl	ax,1
	shl	ax,1
	push	ax
	sub	cx,cx
	push	cx
	mov	si,ax
	mov	di,bx
	call	_EMSmap
	add	sp,6
; Line 183
	push	WORD PTR _ObjHands[di]
	lea	ax,WORD PTR [si+1]
	push	ax
	mov	ax,1
	push	ax
	call	_EMSmap
	add	sp,6
; Line 184
	push	WORD PTR _ObjHands[di]
	lea	ax,WORD PTR [si+2]
	push	ax
	mov	ax,2
	push	ax
	call	_EMSmap
	add	sp,6
; Line 185
	push	WORD PTR _ObjHands[di]
	lea	ax,WORD PTR [si+3]
	push	ax
	mov	ax,3
	push	ax
	call	_EMSmap
	add	sp,6
; Line 186
; Line 187
$I797:
	mov	ax,WORD PTR [bp-2]	;SEG
; Line 188
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_MapInEMSSprite	ENDP
; Line 192
	PUBLIC	_FreeEMS
_FreeEMS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 195
	mov	WORD PTR [bp-2],0	;i
$FC802:
; Line 196
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,1
	cmp	WORD PTR _ObjHands[bx],0
	je	$L20005
	push	WORD PTR _ObjHands[bx]
	call	_EMSfree
	add	sp,2
; Line 197
$L20005:
	inc	WORD PTR [bp-2]	;i
	cmp	WORD PTR [bp-2],5	;i
	jl	$FC802
; Line 198
	mov	sp,bp
	pop	bp
	ret	
	nop	

_FreeEMS	ENDP
; Line 202
	PUBLIC	_Error
_Error	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	Str = 4
; Line 203
	call	FAR PTR _ScreenOn
; Line 204
	mov	bx,WORD PTR _Rp1
	mov	WORD PTR [bx+12],15
; Line 205
	push	WORD PTR [bp+4]	;Str
	call	_strupr
	mov	sp,bp
	push	ax
	mov	ax,96
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _RpPrint
	mov	sp,bp
; Line 206
	call	_getch
; Line 207
	mov	sp,bp
	pop	bp
	ret	

_Error	ENDP
_TEXT	ENDS
END
