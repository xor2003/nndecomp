;	Static Name Aliases
;
	TITLE   C:\NQFLY.C
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
PUBLIC  _LandObjectBase
PUBLIC  _PLAINVAL
PUBLIC  _MAXLEV
EXTRN	_Npoly3D:NEAR
EXTRN	_Mult1X3:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	__aNNalshr:NEAR
EXTRN	_MulDiv32:NEAR
EXTRN	_abs:NEAR
EXTRN	_MapInBank:NEAR
EXTRN	_DotProduct:NEAR
EXTRN	_NDraw3DObject:NEAR
EXTRN	_FlagRotate3D:NEAR
EXTRN	_Nviewmat:BYTE
_BSS      SEGMENT
COMM NEAR	_WORLDXOFF:	BYTE:	 2
COMM NEAR	_WORLDYOFF:	BYTE:	 2
COMM NEAR	_WORLDZOFF:	BYTE:	 2
COMM NEAR	_XBASE:	BYTE:	 2
COMM NEAR	_ZBASE:	BYTE:	 2
COMM NEAR	_WORLDXTRAX:	BYTE:	 2
COMM NEAR	_WORLDXTRAY:	BYTE:	 2
COMM NEAR	_D:	BYTE:	 14
COMM NEAR	_WORLDXTRAZ:	BYTE:	 2
_BSS      ENDS
EXTRN	_OBJECTS:BYTE
EXTRN	_IdentInvMat:BYTE
_BSS      SEGMENT
COMM NEAR	_MikeHeight:	BYTE:	 2
_BSS      ENDS
EXTRN	_GroundObjectScale:BYTE
EXTRN	_GRPAGE0:BYTE
EXTRN	_GRNDDETAIL:WORD
_BSS      SEGMENT
COMM NEAR	_ScreenAddr:	BYTE:	 4
COMM NEAR	_BitMaps:	 4:	 4
COMM NEAR	_BXBS:	BYTE:	 4
COMM NEAR	_PTBS:	BYTE:	 4
COMM NEAR	_WORLDXPOS:	BYTE:	 4
COMM NEAR	_WORLDZPOS:	BYTE:	 4
_BSS      ENDS
_DATA      SEGMENT
_LandObjectBase	DW	00H
_PLAINVAL	DW	00H
_MAXLEV	DW	05H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 2
; Line 3
; Line 4
; Line 5
; Line 19
; Line 178
	PUBLIC	_DrawSBox
_DrawSBox	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
	push	si
;	List = -18
;	CLR = -2
;	DST = 24
;	P4 = 20
;	P3 = 16
;	P2 = 12
;	P1 = 8
;	B = 4
; Line 183
	les	bx,DWORD PTR [bp+4]	;B
	test	BYTE PTR es:[bx+6],128
	jne	$JCC18
	jmp	$I752
$JCC18:
	cmp	WORD PTR _GRNDDETAIL,2
	je	$JCC28
	jmp	$I752
$JCC28:
; Line 184
; Line 185
	mov	ax,WORD PTR [bp+8]	;P1
	mov	dx,WORD PTR [bp+10]
	mov	WORD PTR [bp-18],ax	;List
	mov	WORD PTR [bp-16],dx
; Line 186
	mov	ax,WORD PTR [bp+12]	;P2
	mov	dx,WORD PTR [bp+14]
	mov	WORD PTR [bp-14],ax
	mov	WORD PTR [bp-12],dx
; Line 187
	mov	ax,WORD PTR [bp+20]	;P4
	mov	dx,WORD PTR [bp+22]
	mov	WORD PTR [bp-10],ax
	mov	WORD PTR [bp-8],dx
; Line 188
	mov	ax,WORD PTR [bp+16]	;P3
	mov	dx,WORD PTR [bp+18]
	mov	WORD PTR [bp-6],ax
	mov	WORD PTR [bp-4],dx
; Line 189
	mov	ax,WORD PTR _GRNDDETAIL
	or	ax,ax
	jne	$JCC86
	jmp	$SC757
$JCC86:
; Line 197
	mov	ax,WORD PTR es:[bx+8]
	les	si,DWORD PTR [bp+16]	;P3
	mov	WORD PTR es:[si+24],ax
	les	bx,DWORD PTR [bp+8]	;P1
	mov	WORD PTR es:[bx+24],ax
; Line 198
	les	si,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[si+14]
	les	bx,DWORD PTR [bp+16]	;P3
	mov	WORD PTR es:[bx+26],ax
	les	bx,DWORD PTR [bp+20]	;P4
	mov	WORD PTR es:[bx+26],ax
; Line 199
	les	si,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[si+10]
	les	bx,DWORD PTR [bp+12]	;P2
	mov	WORD PTR es:[bx+26],ax
	les	si,DWORD PTR [bp+8]	;P1
	mov	WORD PTR es:[si+26],ax
; Line 200
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+12]
	les	si,DWORD PTR [bp+20]	;P4
	mov	WORD PTR es:[si+24],ax
	les	bx,DWORD PTR [bp+12]	;P2
	mov	WORD PTR es:[bx+24],ax
; Line 201
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+4]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	and	ax,15
	add	ax,3
	push	ax
	call	_MapInBank
	add	sp,2
; Line 202
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+4]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	bx,ax
	and	bx,3
	shl	bx,1
	shl	bx,1
	push	WORD PTR _BitMaps[bx+2]
	push	WORD PTR _BitMaps[bx]
	mov	bx,WORD PTR [bp+4]	;B
	mov	al,6
	mov	ah,BYTE PTR es:[bx+2]
	jmp	SHORT $L20014
; Line 190
; Line 191
	nop	
$SC757:
; Line 193
	mov	cx,257
	mov	al,BYTE PTR es:[bx+2]
	cbw	
	add	ax,55
	shl	ax,1
	mov	WORD PTR [bp-2],ax	;CLR
	imul	cx
	inc	ax
	cwd	
	push	dx
	push	ax
	sub	ax,ax
$L20014:
	push	ax
	push	WORD PTR [bp+26]
	push	WORD PTR [bp+24]	;DST
	lea	ax,WORD PTR [bp-18]	;List
	push	ax
	mov	ax,4
$L20017:
	push	ax
	call	_Npoly3D
	add	sp,14
; Line 194
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 207
; Line 209
$I752:
	cmp	BYTE PTR es:[bx+6],0
	jne	$JCC311
	jmp	$I760
$JCC311:
; Line 210
; Line 211
	mov	ax,WORD PTR [bp+8]	;P1
	mov	dx,WORD PTR [bp+10]
	mov	WORD PTR [bp-18],ax	;List
	mov	WORD PTR [bp-16],dx
; Line 212
	mov	ax,WORD PTR [bp+12]	;P2
	mov	dx,WORD PTR [bp+14]
	mov	WORD PTR [bp-14],ax
	mov	WORD PTR [bp-12],dx
; Line 213
	mov	ax,WORD PTR [bp+20]	;P4
	mov	dx,WORD PTR [bp+22]
	mov	WORD PTR [bp-10],ax
	mov	WORD PTR [bp-8],dx
; Line 214
	mov	ax,WORD PTR _GRNDDETAIL
	or	ax,ax
	jne	$JCC357
	jmp	$SC765
$JCC357:
	dec	ax
	jne	$JCC363
	jmp	$SC766
$JCC363:
; Line 229
	mov	ax,WORD PTR es:[bx+8]
	les	si,DWORD PTR [bp+8]	;P1
	mov	WORD PTR es:[si+24],ax
; Line 230
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+10]
	les	si,DWORD PTR [bp+12]	;P2
	mov	WORD PTR es:[si+26],ax
	les	bx,DWORD PTR [bp+8]	;P1
	mov	WORD PTR es:[bx+26],ax
; Line 231
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+12]
	les	si,DWORD PTR [bp+20]	;P4
	mov	WORD PTR es:[si+24],ax
	les	bx,DWORD PTR [bp+12]	;P2
	mov	WORD PTR es:[bx+24],ax
; Line 232
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+14]
	les	si,DWORD PTR [bp+20]	;P4
	mov	WORD PTR es:[si+26],ax
; Line 233
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+4]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	and	ax,15
	add	ax,3
	push	ax
	call	_MapInBank
	add	sp,2
; Line 234
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+4]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	bx,ax
	and	bx,3
	shl	bx,1
	shl	bx,1
	push	WORD PTR _BitMaps[bx+2]
	push	WORD PTR _BitMaps[bx]
	mov	bx,WORD PTR [bp+4]	;B
	mov	al,6
	mov	ah,BYTE PTR es:[bx+2]
	jmp	SHORT $L20015
; Line 215
; Line 216
$SC765:
; Line 218
	mov	cx,257
	mov	al,BYTE PTR es:[bx+2]
	cbw	
	add	ax,55
	shl	ax,1
	mov	WORD PTR [bp-2],ax	;CLR
	imul	cx
	inc	ax
	cwd	
	push	dx
	push	ax
	sub	ax,ax
$L20015:
	push	ax
	push	WORD PTR [bp+26]
	push	WORD PTR [bp+24]	;DST
	lea	ax,WORD PTR [bp-18]	;List
	push	ax
	mov	ax,3
	push	ax
	call	_Npoly3D
	add	sp,14
; Line 238
; Line 239
$I760:
	les	bx,DWORD PTR [bp+4]	;B
	cmp	BYTE PTR es:[bx+7],0
	jne	$JCC571
	jmp	$SB770
$JCC571:
; Line 240
; Line 241
	mov	ax,WORD PTR [bp+8]	;P1
	mov	dx,WORD PTR [bp+10]
	mov	WORD PTR [bp-18],ax	;List
	mov	WORD PTR [bp-16],dx
; Line 242
	mov	ax,WORD PTR [bp+20]	;P4
	mov	dx,WORD PTR [bp+22]
	mov	WORD PTR [bp-14],ax
	mov	WORD PTR [bp-12],dx
; Line 243
	mov	ax,WORD PTR [bp+16]	;P3
	mov	dx,WORD PTR [bp+18]
	mov	WORD PTR [bp-10],ax
	mov	WORD PTR [bp-8],dx
; Line 244
	mov	ax,WORD PTR _GRNDDETAIL
	or	ax,ax
	jne	$JCC617
	jmp	$SC773
$JCC617:
	dec	ax
	jne	$JCC623
	jmp	$SC774
$JCC623:
; Line 259
	mov	ax,WORD PTR es:[bx+8]
	les	si,DWORD PTR [bp+16]	;P3
	mov	WORD PTR es:[si+24],ax
	les	bx,DWORD PTR [bp+8]	;P1
	mov	WORD PTR es:[bx+24],ax
; Line 260
	les	si,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[si+10]
	les	bx,DWORD PTR [bp+8]	;P1
	mov	WORD PTR es:[bx+26],ax
; Line 261
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+12]
	les	si,DWORD PTR [bp+20]	;P4
	mov	WORD PTR es:[si+24],ax
; Line 262
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+14]
	les	si,DWORD PTR [bp+16]	;P3
	mov	WORD PTR es:[si+26],ax
	les	bx,DWORD PTR [bp+20]	;P4
	mov	WORD PTR es:[bx+26],ax
; Line 263
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+4]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	and	ax,15
	add	ax,3
	push	ax
	call	_MapInBank
	add	sp,2
; Line 264
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+4]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	bx,ax
	and	bx,3
	shl	bx,1
	shl	bx,1
	push	WORD PTR _BitMaps[bx+2]
	push	WORD PTR _BitMaps[bx]
	mov	bx,WORD PTR [bp+4]	;B
	mov	al,2
	mov	ah,BYTE PTR es:[bx+3]
	jmp	$L20016
; Line 220
	nop	
$SC766:
; Line 221
	mov	al,BYTE PTR es:[bx+8]
	and	ax,15
	sub	ax,110
	neg	ax
	les	si,DWORD PTR [bp+8]	;P1
	mov	WORD PTR es:[si+24],ax
; Line 222
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+10]
	and	ax,15
	sub	ax,110
	neg	ax
	les	si,DWORD PTR [bp+12]	;P2
	mov	WORD PTR es:[si+24],ax
; Line 223
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+12]
	and	ax,15
	sub	ax,110
	neg	ax
	les	si,DWORD PTR [bp+16]	;P3
	mov	WORD PTR es:[si+24],ax
; Line 224
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+14]
	and	ax,15
	sub	ax,110
	neg	ax
	les	bx,DWORD PTR [bp+20]	;P4
	mov	WORD PTR es:[bx+24],ax
; Line 225
	mov	ax,257
	imul	WORD PTR [bp-2]	;CLR
	inc	ax
	cwd	
	push	dx
	push	ax
	mov	ax,1
	jmp	$L20015
; Line 227
	nop	
$SC773:
; Line 248
	mov	cx,257
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+3]
	cbw	
	add	ax,55
	shl	ax,1
	mov	WORD PTR [bp-2],ax	;CLR
	imul	cx
	inc	ax
	cwd	
	push	dx
	push	ax
	sub	ax,ax
$L20016:
	push	ax
	push	WORD PTR [bp+26]
	push	WORD PTR [bp+24]	;DST
	lea	ax,WORD PTR [bp-18]	;List
	push	ax
	mov	ax,3
	jmp	$L20017
; Line 250
$SC774:
; Line 251
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+8]
	and	ax,15
	sub	ax,110
	neg	ax
	les	si,DWORD PTR [bp+8]	;P1
	mov	WORD PTR es:[si+24],ax
; Line 252
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+10]
	and	ax,15
	sub	ax,110
	neg	ax
	les	si,DWORD PTR [bp+12]	;P2
	mov	WORD PTR es:[si+24],ax
; Line 253
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+12]
	and	ax,15
	sub	ax,110
	neg	ax
	les	si,DWORD PTR [bp+16]	;P3
	mov	WORD PTR es:[si+24],ax
; Line 254
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+14]
	and	ax,15
	sub	ax,110
	neg	ax
	les	bx,DWORD PTR [bp+20]	;P4
	mov	WORD PTR es:[bx+24],ax
; Line 255
	mov	ax,257
	imul	WORD PTR [bp-2]	;CLR
	inc	ax
	cwd	
	push	dx
	push	ax
	mov	ax,1
	jmp	SHORT $L20016
; Line 257
	nop	
$SB770:
; Line 268
; Line 269
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DrawSBox	ENDP
; Line 273
	PUBLIC	_MakeMidGridPt
_MakeMidGridPt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__aNchkstk
	push	di
	push	si
;	H1 = -20
;	H2 = -22
;	HDEL = -24
;	V = -18
;	VL = -12
;	FRACT = 16
;	P3 = 12
;	P2 = 8
;	P1 = 4
; Line 280
	mov	ax,WORD PTR [bp+4]	;P1
	mov	dx,WORD PTR [bp+6]
	push	ds
	mov	si,ax
	mov	ds,dx
	ASSUME DS: NOTHING
	les	di,DWORD PTR [bp+12]	;P3
	mov	cx,17
	rep	movsw
	pop	ds
	ASSUME DS: DGROUP
; Line 281
	les	bx,DWORD PTR [bp+8]	;P2
	mov	ax,WORD PTR es:[bx]
	les	si,DWORD PTR [bp+12]	;P3
	add	WORD PTR es:[si],ax
; Line 282
	sar	WORD PTR es:[si],1
; Line 283
	les	bx,DWORD PTR [bp+8]	;P2
	mov	ax,WORD PTR es:[bx+2]
	mov	dx,WORD PTR es:[bx+4]
	les	si,DWORD PTR [bp+12]	;P3
	add	WORD PTR es:[si+2],ax
	adc	WORD PTR es:[si+4],dx
; Line 284
	sar	WORD PTR es:[si+4],1
	rcr	WORD PTR es:[si+2],1
; Line 285
	les	bx,DWORD PTR [bp+8]	;P2
	mov	ax,WORD PTR es:[bx+6]
	mov	dx,WORD PTR es:[bx+8]
	les	si,DWORD PTR [bp+12]	;P3
	add	WORD PTR es:[si+6],ax
	adc	WORD PTR es:[si+8],dx
; Line 286
	sar	WORD PTR es:[si+8],1
	rcr	WORD PTR es:[si+6],1
; Line 287
	les	bx,DWORD PTR [bp+8]	;P2
	mov	ax,WORD PTR es:[bx+10]
	mov	dx,WORD PTR es:[bx+12]
	les	bx,DWORD PTR [bp+12]	;P3
	add	WORD PTR es:[bx+10],ax
	adc	WORD PTR es:[bx+12],dx
; Line 288
	sar	WORD PTR es:[bx+12],1
	rcr	WORD PTR es:[bx+10],1
; Line 291
	mov	WORD PTR [bp+16],0	;FRACT
; Line 294
	mov	ax,WORD PTR [bp+12]	;P3
	mov	dx,WORD PTR [bp+14]
	inc	ax
	inc	ax
	push	dx
	push	ax
	call	_FlagRotate3D
	add	sp,4
; Line 306
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_MakeMidGridPt	ENDP
; Line 311
	PUBLIC	_MakePTS
_MakePTS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,76
	call	__aNchkstk
	push	di
	push	si
;	i = -24
;	j = -30
;	k = -34
;	V = -18
;	BGS = -74
;	x = -20
;	z = -28
;	tx = -42
;	tz = -76
;	H1 = -22
;	H2 = -26
;	H3 = -32
;	H4 = -40
;	P = -4
;	PL = -38
;	T = -8
;	PTR = -12
;	PTSBASE = 4
; Line 324
	mov	WORD PTR [bp-12],0	;PTR
; Line 325
	sub	ax,ax
	push	ax
	call	_MapInBank
	add	sp,2
	mov	WORD PTR [bp-10],ax
; Line 327
	mov	ax,WORD PTR [bp+4]	;PTSBASE
	mov	dx,WORD PTR [bp+6]
	mov	WORD PTR [bp-4],ax	;P
	mov	WORD PTR [bp-2],dx
; Line 328
	mov	ax,WORD PTR _WORLDZOFF
	sub	ax,8192
	mov	WORD PTR [bp-76],ax	;tz
; Line 329
	mov	WORD PTR [bp-24],0	;i
	mov	ax,WORD PTR _ZBASE
	sub	ax,8
	mov	WORD PTR [bp-28],ax	;z
	jmp	$F809
$FC813:
	inc	WORD PTR [bp-30]	;j
	inc	WORD PTR [bp-20]	;x
	add	BYTE PTR [bp-41],4
$F812:
	cmp	WORD PTR [bp-30],16	;j
	jl	$JCC1280
	jmp	$FC810
$JCC1280:
; Line 333
; Line 335
	mov	bl,BYTE PTR [bp-20]	;x
	mov	bh,BYTE PTR [bp-28]	;z
	les	si,DWORD PTR [bp-12]	;PTR
	mov	al,BYTE PTR es:[bx][si]
	sub	ah,ah
	mov	cl,3
	shl	ax,cl
	les	bx,DWORD PTR [bp-4]	;P
	mov	WORD PTR es:[bx],ax
; Line 336
	mov	ax,WORD PTR [bp-42]	;tx
	mov	WORD PTR [bp-18],ax	;V
; Line 337
	mov	cx,WORD PTR es:[bx]
	add	cx,WORD PTR _WORLDYOFF
	mov	WORD PTR [bp-16],cx
; Line 338
	mov	cx,WORD PTR [bp-76]	;tz
	mov	WORD PTR [bp-14],cx
; Line 340
	mov	dx,8
	sub	dx,WORD PTR [bp-24]	;i
	push	dx
	call	_abs
	add	sp,2
	cmp	ax,4
	jge	$I815
	mov	ax,8
	sub	ax,WORD PTR [bp-30]	;j
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,4
	jge	$I815
; Line 341
; Line 342
	mov	ax,WORD PTR [bp-18]	;V
	shl	ax,1
	shl	ax,1
	add	ax,WORD PTR _WORLDXTRAX
	mov	WORD PTR [bp-18],ax	;V
; Line 343
	mov	ax,WORD PTR [bp-16]
	shl	ax,1
	shl	ax,1
	add	ax,WORD PTR _WORLDXTRAY
	mov	WORD PTR [bp-16],ax
; Line 344
	mov	ax,WORD PTR [bp-14]
	shl	ax,1
	shl	ax,1
	add	ax,WORD PTR _WORLDXTRAZ
	mov	WORD PTR [bp-14],ax
; Line 345
; Line 347
$I815:
	lea	ax,WORD PTR [bp-74]	;BGS
	push	ax
	mov	cx,OFFSET _Nviewmat
	push	cx
	lea	cx,WORD PTR [bp-18]	;V
	push	cx
	call	_Mult1X3
	add	sp,6
; Line 349
	mov	ax,WORD PTR [bp-4]	;P
	mov	dx,WORD PTR [bp-2]
	inc	ax
	inc	ax
	mov	WORD PTR [bp-8],ax	;T
	mov	WORD PTR [bp-6],dx
	mov	di,ax
	lea	si,WORD PTR [bp-74]	;BGS
	mov	es,dx
	mov	cx,16
	rep	movsw
; Line 350
	push	dx
	push	ax
	call	_FlagRotate3D
	add	sp,4
; Line 351
	add	WORD PTR [bp-4],34	;P
; Line 352
	jmp	$FC813
; Line 353
$FC810:
	inc	WORD PTR [bp-24]	;i
	inc	WORD PTR [bp-28]	;z
	add	BYTE PTR [bp-75],4
$F809:
	cmp	WORD PTR [bp-24],16	;i
	jge	$FB811
; Line 330
; Line 331
	mov	ax,WORD PTR _WORLDXOFF
	sub	ax,8192
	mov	WORD PTR [bp-42],ax	;tx
; Line 332
	mov	WORD PTR [bp-30],0	;j
	mov	ax,WORD PTR _XBASE
	sub	ax,8
	mov	WORD PTR [bp-20],ax	;x
	jmp	$F812
$FB811:
; Line 355
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_MakePTS	ENDP
; Line 358
	PUBLIC	_MakeBoxes
_MakeBoxes	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__aNchkstk
	push	si
;	B = -4
;	BL = -20
;	i = -12
;	j = -14
;	k = -16
;	t = -6
;	PTR = -10
;	BOXBASE = 4
; Line 364
	mov	ax,WORD PTR [bp+4]	;BOXBASE
	mov	dx,WORD PTR [bp+6]
	mov	WORD PTR [bp-4],ax	;B
	mov	WORD PTR [bp-2],dx
; Line 366
	mov	WORD PTR [bp-10],0	;PTR
; Line 367
	mov	ax,1
	push	ax
	call	_MapInBank
	add	sp,2
	mov	WORD PTR [bp-8],ax
; Line 370
	mov	WORD PTR [bp-12],0	;i
	jmp	$F826
$I833:
; Line 389
; Line 390
	mov	al,2
	les	bx,DWORD PTR [bp-4]	;B
	mov	BYTE PTR es:[bx+1],al
	mov	BYTE PTR es:[bx],al
; Line 400
	mov	si,WORD PTR _XBASE
	add	si,WORD PTR [bp-14]	;j
	sub	si,8
	and	si,255
	mov	ah,BYTE PTR _ZBASE
	add	ah,BYTE PTR [bp-12]	;i
	sub	al,al
	add	si,ax
	les	bx,DWORD PTR [bp-10]	;PTR
	mov	al,BYTE PTR es:[bx-2048][si]
	cbw	
	les	bx,DWORD PTR [bp-4]	;B
	mov	WORD PTR es:[bx+4],ax
	and	ax,3
	mov	cl,6
	shl	ax,cl
	mov	WORD PTR es:[bx+8],ax
; Line 401
	mov	ax,WORD PTR es:[bx+4]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,2
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	and	ax,3
	mov	cl,6
	shl	ax,cl
	mov	WORD PTR es:[bx+10],ax
; Line 402
	mov	ax,WORD PTR es:[bx+8]
	add	ax,63
	mov	WORD PTR es:[bx+12],ax
; Line 403
	mov	ax,WORD PTR es:[bx+10]
	add	ax,63
	mov	WORD PTR es:[bx+14],ax
; Line 404
; Line 405
$FC830:
	inc	WORD PTR [bp-14]	;j
	add	WORD PTR [bp-4],16	;B
$F829:
	cmp	WORD PTR [bp-14],15	;j
	jl	$JCC1690
	jmp	$FC827
$JCC1690:
; Line 373
; Line 377
	mov	ax,8
	sub	ax,WORD PTR [bp-12]	;i
	push	ax
	call	_abs
	add	sp,2
	mov	cx,8
	sub	cx,WORD PTR [bp-14]	;j
	push	cx
	mov	si,ax
	call	_abs
	add	sp,2
	add	ax,si
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR [bp-6],ax	;t
	cmp	ax,6
	jle	$I832
	mov	WORD PTR [bp-6],6	;t
; Line 378
$I832:
; Line 379
	mov	ax,WORD PTR [bp-6]	;t
	neg	ax
	mov	WORD PTR [bp-6],ax	;t
	les	bx,DWORD PTR [bp-4]	;B
	mov	BYTE PTR es:[bx+3],al
	mov	BYTE PTR es:[bx+2],al
; Line 382
	mov	ax,WORD PTR [bp-12]	;i
	cmp	WORD PTR _PLAINVAL,ax
	jg	$I834
	mov	cx,WORD PTR [bp-14]	;j
	cmp	WORD PTR _PLAINVAL,cx
	jg	$I834
	mov	dx,15
	sub	dx,WORD PTR _PLAINVAL
	cmp	dx,ax
	jle	$I834
	cmp	dx,cx
	jle	$JCC1793
	jmp	$I833
$JCC1793:
$I834:
; Line 383
; Line 384
	sub	al,al
	les	bx,DWORD PTR [bp-4]	;B
	mov	BYTE PTR es:[bx+1],al
	mov	BYTE PTR es:[bx],al
; Line 385
	add	BYTE PTR es:[bx+2],3
; Line 386
	add	BYTE PTR es:[bx+3],3
; Line 387
; Line 388
	jmp	$FC830
; Line 406
	nop	
$FC827:
	inc	WORD PTR [bp-12]	;i
	add	WORD PTR [bp-4],16	;B
$F826:
	cmp	WORD PTR [bp-12],15	;i
	jge	$FB828
; Line 371
; Line 372
	mov	WORD PTR [bp-14],0	;j
	jmp	$F829
	nop	
$FB828:
; Line 408
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_MakeBoxes	ENDP
; Line 411
	PUBLIC	_MakeBoxVis
_MakeBoxVis	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,32
	call	__aNchkstk
	push	si
;	B = -8
;	BL = -32
;	P = -4
;	i = -14
;	j = -18
;	k = -22
;	t = -10
;	tx = -26
;	tz = -28
;	H1 = -12
;	H2 = -16
;	H3 = -20
;	H4 = -24
;	PTSBASE = 8
;	BOXBASE = 4
; Line 419
	mov	ax,WORD PTR [bp+4]	;BOXBASE
	mov	dx,WORD PTR [bp+6]
	mov	WORD PTR [bp-8],ax	;B
	mov	WORD PTR [bp-6],dx
; Line 420
	mov	ax,WORD PTR [bp+8]	;PTSBASE
	mov	dx,WORD PTR [bp+10]
	mov	WORD PTR [bp-4],ax	;P
	mov	WORD PTR [bp-2],dx
; Line 422
	mov	ax,8192
	sub	ax,WORD PTR _WORLDZOFF
	mov	WORD PTR [bp-28],ax	;tz
; Line 423
	mov	WORD PTR [bp-14],0	;i
	jmp	$F853
$I859:
; Line 439
; Line 440
	push	WORD PTR [bp-28]	;tz
	mov	ax,WORD PTR _WORLDYOFF
	neg	ax
	push	ax
	push	WORD PTR [bp-26]	;tx
	les	bx,DWORD PTR [bp-4]	;P
	mov	ax,WORD PTR es:[bx+34]
	mov	cx,ax
	sub	ax,WORD PTR es:[bx+578]
	push	ax
	mov	ax,1024
	push	ax
	sub	cx,WORD PTR es:[bx]
	neg	cx
	push	cx
	call	_DotProduct
	add	sp,12
	or	dx,dx
	jge	$JCC1949
	jmp	$I863
$JCC1949:
	jg	$L20005
	or	ax,ax
	jne	$JCC1958
	jmp	$I863
$JCC1958:
$L20005:
; Line 441
; Line 442
	les	bx,DWORD PTR [bp-8]	;B
	mov	BYTE PTR es:[bx+6],1
; Line 443
	les	bx,DWORD PTR [bp-4]	;P
	mov	ax,WORD PTR es:[bx]
	sub	ax,WORD PTR es:[bx+34]
	push	ax
	call	_abs
	add	sp,2
	les	bx,DWORD PTR [bp-4]	;P
	mov	cx,WORD PTR es:[bx+34]
	sub	cx,WORD PTR es:[bx+578]
	push	cx
	mov	si,ax
	call	_abs
	add	sp,2
	add	si,ax
; Line 445
	mov	cx,64
	mov	ax,si
	cwd	
	idiv	cx
	mov	WORD PTR [bp-10],ax	;t
	cmp	ax,1
	jle	$I862
	mov	WORD PTR [bp-10],1	;t
; Line 446
$I862:
; Line 448
	mov	ax,1
	sub	ax,WORD PTR [bp-10]	;t
	mov	WORD PTR [bp-10],ax	;t
	les	bx,DWORD PTR [bp-8]	;B
	sub	BYTE PTR es:[bx+2],al
; Line 450
	cmp	WORD PTR _GRNDDETAIL,1
	jne	$I863
; Line 451
; Line 452
	mov	cl,6
	les	si,DWORD PTR [bp-4]	;P
	mov	ax,WORD PTR es:[si]
	sar	ax,cl
	les	bx,DWORD PTR [bp-8]	;B
	mov	WORD PTR es:[bx+8],ax
; Line 453
	les	si,DWORD PTR [bp-4]	;P
	mov	ax,WORD PTR es:[si+34]
	sar	ax,cl
	les	bx,DWORD PTR [bp-8]	;B
	mov	WORD PTR es:[bx+10],ax
; Line 454
	les	si,DWORD PTR [bp-4]	;P
	mov	ax,WORD PTR es:[si+544]
	sar	ax,cl
	les	bx,DWORD PTR [bp-8]	;B
	mov	WORD PTR es:[bx+12],ax
; Line 455
	les	si,DWORD PTR [bp-4]	;P
	mov	ax,WORD PTR es:[si+578]
	sar	ax,cl
	les	bx,DWORD PTR [bp-8]	;B
	mov	WORD PTR es:[bx+14],ax
; Line 456
; Line 458
$I863:
; Line 459
; Line 461
	les	bx,DWORD PTR [bp-4]	;P
	cmp	WORD PTR es:[bx],0
	jne	$I864
	cmp	WORD PTR es:[bx+544],0
	jne	$I864
	cmp	WORD PTR es:[bx+578],0
	jne	$I864
	les	bx,DWORD PTR [bp-8]	;B
	cmp	WORD PTR es:[bx+4],-1
	jne	$I864
; Line 463
; Line 464
	mov	BYTE PTR es:[bx+7],0
; Line 467
; Line 468
	jmp	$I868
	nop	
$I864:
; Line 469
; Line 470
	push	WORD PTR [bp-28]	;tz
	mov	ax,WORD PTR _WORLDYOFF
	neg	ax
	push	ax
	push	WORD PTR [bp-26]	;tx
	les	bx,DWORD PTR [bp-4]	;P
	mov	ax,WORD PTR es:[bx]
	sub	ax,WORD PTR es:[bx+544]
	push	ax
	mov	ax,1024
	push	ax
	mov	ax,WORD PTR es:[bx+544]
	sub	ax,WORD PTR es:[bx+578]
	push	ax
	call	_DotProduct
	add	sp,12
	or	dx,dx
	jge	$JCC2213
	jmp	$I868
$JCC2213:
	jg	$L20010
	or	ax,ax
	jne	$JCC2222
	jmp	$I868
$JCC2222:
$L20010:
; Line 471
; Line 472
	les	bx,DWORD PTR [bp-8]	;B
	mov	BYTE PTR es:[bx+7],1
; Line 473
	les	bx,DWORD PTR [bp-4]	;P
	mov	ax,WORD PTR es:[bx+544]
	mov	cx,ax
	sub	ax,WORD PTR es:[bx+578]
	push	ax
	mov	si,cx
	call	_abs
	add	sp,2
	les	bx,DWORD PTR [bp-4]	;P
	sub	si,WORD PTR es:[bx]
	neg	si
	push	si
	mov	si,ax
	call	_abs
	add	sp,2
	add	si,ax
; Line 475
	mov	cx,64
	mov	ax,si
	cwd	
	idiv	cx
	mov	WORD PTR [bp-10],ax	;t
	cmp	ax,2
	jle	$I867
	mov	WORD PTR [bp-10],2	;t
; Line 476
$I867:
; Line 478
	mov	ax,2
	sub	ax,WORD PTR [bp-10]	;t
	mov	WORD PTR [bp-10],ax	;t
	les	bx,DWORD PTR [bp-8]	;B
	sub	BYTE PTR es:[bx+3],al
; Line 480
	cmp	WORD PTR _GRNDDETAIL,1
	jne	$I868
; Line 481
; Line 482
	mov	cl,6
	les	si,DWORD PTR [bp-4]	;P
	mov	ax,WORD PTR es:[si]
	sar	ax,cl
	les	bx,DWORD PTR [bp-8]	;B
	mov	WORD PTR es:[bx+8],ax
; Line 483
	les	si,DWORD PTR [bp-4]	;P
	mov	ax,WORD PTR es:[si+34]
	sar	ax,cl
	les	bx,DWORD PTR [bp-8]	;B
	mov	WORD PTR es:[bx+10],ax
; Line 484
	les	si,DWORD PTR [bp-4]	;P
	mov	ax,WORD PTR es:[si+544]
	sar	ax,cl
	les	bx,DWORD PTR [bp-8]	;B
	mov	WORD PTR es:[bx+12],ax
; Line 485
	les	si,DWORD PTR [bp-4]	;P
	mov	ax,WORD PTR es:[si+578]
	sar	ax,cl
	les	bx,DWORD PTR [bp-8]	;B
	mov	WORD PTR es:[bx+14],ax
; Line 486
; Line 488
$I868:
; Line 489
; Line 491
	inc	WORD PTR [bp-18]	;j
	sub	WORD PTR [bp-26],1024	;tx
	add	WORD PTR [bp-8],16	;B
	add	WORD PTR [bp-4],34	;P
$F856:
	cmp	WORD PTR [bp-18],15	;j
	jge	$FC854
; Line 427
; Line 428
	sub	al,al
	les	bx,DWORD PTR [bp-8]	;B
	mov	BYTE PTR es:[bx+7],al
	mov	BYTE PTR es:[bx+6],al
; Line 430
	les	si,DWORD PTR [bp-4]	;P
	cmp	WORD PTR es:[si],0
	je	$JCC2431
	jmp	$I859
$JCC2431:
	cmp	WORD PTR es:[si+34],0
	je	$JCC2441
	jmp	$I859
$JCC2441:
	cmp	WORD PTR es:[si+578],0
	je	$JCC2452
	jmp	$I859
$JCC2452:
	les	bx,DWORD PTR [bp-8]	;B
	cmp	WORD PTR es:[bx+4],-1
	je	$JCC2465
	jmp	$I859
$JCC2465:
; Line 432
; Line 433
	mov	BYTE PTR es:[bx+6],al
; Line 437
; Line 438
	jmp	$I863
; Line 492
	nop	
$FC854:
	inc	WORD PTR [bp-14]	;i
	sub	WORD PTR [bp-28],1024	;tz
	add	WORD PTR [bp-8],16	;B
	add	WORD PTR [bp-4],34	;P
$F853:
	cmp	WORD PTR [bp-14],15	;i
	jge	$FB855
; Line 424
; Line 425
	mov	ax,8192
	sub	ax,WORD PTR _WORLDXOFF
	mov	WORD PTR [bp-26],ax	;tx
; Line 426
	mov	WORD PTR [bp-18],0	;j
	jmp	SHORT $F856
	nop	
$FB855:
; Line 494
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_MakeBoxVis	ENDP
; Line 505
	PUBLIC	_DoBox
_DoBox	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
	push	si
;	SZ = -14
;	SOFF = -16
;	SZ2 = -18
;	TBXBS = -4
;	TPTBS = -12
;	PTR = -8
;	YI = 32
;	XI = 30
;	LEV = 28
;	Z = 26
;	X = 24
;	PL4 = 20
;	PL3 = 16
;	PL2 = 12
;	PL1 = 8
;	B = 4
; Line 512
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+6]
	or	al,BYTE PTR es:[bx+7]
	jne	$JCC2545
	jmp	$I896
$JCC2545:
; Line 514
	les	bx,DWORD PTR [bp+20]	;PL4
	mov	al,BYTE PTR es:[bx+32]
	les	bx,DWORD PTR [bp+16]	;PL3
	and	al,BYTE PTR es:[bx+32]
	les	bx,DWORD PTR [bp+12]	;PL2
	and	al,BYTE PTR es:[bx+32]
	les	bx,DWORD PTR [bp+8]	;PL1
	and	al,BYTE PTR es:[bx+32]
	test	al,63
	je	$JCC2580
	jmp	$I896
$JCC2580:
; Line 518
	mov	cl,BYTE PTR [bp+28]	;LEV
	mov	ax,1024
	sar	ax,cl
	mov	WORD PTR [bp-14],ax	;SZ
; Line 528
	mov	cx,WORD PTR _MAXLEV
	cmp	WORD PTR [bp+28],cx	;LEV
	jge	$I895
	neg	ax
	mov	cx,WORD PTR [bp-14]	;SZ
	add	cx,WORD PTR [bp+24]	;X
	cmp	cx,ax
	jl	$I894
	mov	cx,WORD PTR [bp+24]	;X
	cmp	WORD PTR [bp-14],cx	;SZ
	jl	$I894
	mov	cx,WORD PTR [bp-14]	;SZ
	add	cx,WORD PTR [bp+26]	;Z
	cmp	cx,ax
	jl	$I894
	mov	ax,WORD PTR [bp+26]	;Z
	cmp	WORD PTR [bp-14],ax	;SZ
	jge	$I892
$I894:
	les	bx,DWORD PTR [bp+4]	;B
	cmp	WORD PTR es:[bx+4],32
	jne	$I895
	cmp	WORD PTR [bp+28],3	;LEV
	jge	$I895
	push	WORD PTR [bp+24]	;X
	call	_abs
	add	sp,2
	mov	cx,WORD PTR [bp-14]	;SZ
	shl	cx,1
	shl	cx,1
	cmp	ax,cx
	jge	$I895
	push	WORD PTR [bp+26]	;Z
	mov	si,cx
	call	_abs
	add	sp,2
	cmp	ax,si
	jl	$I892
$I895:
; Line 529
; Line 530
	push	WORD PTR _ScreenAddr+2
	push	WORD PTR _ScreenAddr
	mov	ax,WORD PTR [bp+20]	;PL4
	mov	dx,WORD PTR [bp+22]
	inc	ax
	inc	ax
	push	dx
	push	ax
	mov	ax,WORD PTR [bp+16]	;PL3
	mov	dx,WORD PTR [bp+18]
	inc	ax
	inc	ax
	push	dx
	push	ax
	mov	ax,WORD PTR [bp+12]	;PL2
	mov	dx,WORD PTR [bp+14]
	inc	ax
	inc	ax
	push	dx
	push	ax
	mov	ax,WORD PTR [bp+8]	;PL1
	mov	dx,WORD PTR [bp+10]
	inc	ax
	inc	ax
	push	dx
	push	ax
	push	WORD PTR [bp+6]
	push	WORD PTR [bp+4]	;B
	call	_DrawSBox
	add	sp,24
; Line 531
; Line 532
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I892:
; Line 533
; Line 534
	mov	ax,WORD PTR _BXBS
	mov	dx,WORD PTR _BXBS+2
	add	WORD PTR _BXBS,16
	mov	WORD PTR [bp-4],ax	;TBXBS
	mov	WORD PTR [bp-2],dx
; Line 539
	mov	ax,WORD PTR [bp+28]	;LEV
	inc	ax
	push	ax
	mov	cx,WORD PTR _PTBS
	mov	dx,WORD PTR _PTBS+2
	add	WORD PTR _PTBS,170
	mov	WORD PTR [bp-12],cx	;TPTBS
	mov	WORD PTR [bp-10],dx
	push	dx
	push	cx
	push	WORD PTR [bp+14]
	push	WORD PTR [bp+12]	;PL2
	push	WORD PTR [bp+10]
	push	WORD PTR [bp+8]	;PL1
	mov	si,ax
	call	_MakeMidGridPt
	add	sp,14
; Line 540
	push	si
	mov	ax,WORD PTR [bp-12]	;TPTBS
	mov	dx,WORD PTR [bp-10]
	add	ax,34
	push	dx
	push	ax
	push	WORD PTR [bp+18]
	push	WORD PTR [bp+16]	;PL3
	push	WORD PTR [bp+10]
	push	WORD PTR [bp+8]	;PL1
	call	_MakeMidGridPt
	add	sp,14
; Line 541
	push	si
	mov	ax,WORD PTR [bp-12]	;TPTBS
	mov	dx,WORD PTR [bp-10]
	add	ax,102
	push	dx
	push	ax
	push	WORD PTR [bp+22]
	push	WORD PTR [bp+20]	;PL4
	push	WORD PTR [bp+14]
	push	WORD PTR [bp+12]	;PL2
	call	_MakeMidGridPt
	add	sp,14
; Line 542
	push	si
	mov	ax,WORD PTR [bp-12]	;TPTBS
	mov	dx,WORD PTR [bp-10]
	add	ax,136
	push	dx
	push	ax
	push	WORD PTR [bp+22]
	push	WORD PTR [bp+20]	;PL4
	push	WORD PTR [bp+18]
	push	WORD PTR [bp+16]	;PL3
	call	_MakeMidGridPt
	add	sp,14
; Line 543
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR [bp-12]	;TPTBS
	mov	dx,WORD PTR [bp-10]
	add	ax,68
	push	dx
	push	ax
	push	WORD PTR [bp+22]
	push	WORD PTR [bp+20]	;PL4
	push	WORD PTR [bp+10]
	push	WORD PTR [bp+8]	;PL1
	call	_MakeMidGridPt
	add	sp,14
; Line 549
	mov	cl,3
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+4]
	shl	ax,1
	shl	ax,1
	add	ax,WORD PTR [bp+32]	;YI
	shl	ax,cl
	add	ax,WORD PTR [bp+30]	;XI
	shl	ax,1
	mov	WORD PTR [bp-16],ax	;SOFF
	mov	WORD PTR [bp-8],ax	;PTR
; Line 550
	mov	ax,2
	push	ax
	call	_MapInBank
	add	sp,2
	mov	WORD PTR [bp-6],ax
; Line 553
	les	bx,DWORD PTR [bp+4]	;B
	test	BYTE PTR es:[bx+6],128
	je	$I897
	or	BYTE PTR es:[bx+7],128
; Line 555
$I897:
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[si],al
; Line 556
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+1]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[si+1],al
; Line 557
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+6]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[si+6],al
; Line 558
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+7]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[si+7],al
; Line 559
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+2]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[si+2],al
; Line 560
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+3]
	les	bx,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[bx+3],al
; Line 563
	les	si,DWORD PTR [bp-8]	;PTR
	mov	al,BYTE PTR es:[si]
	cbw	
	les	bx,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[bx+4],ax
; Line 566
	cmp	WORD PTR [bp+28],2	;LEV
	jne	$I898
	cmp	ax,-1
	je	$I898
	cmp	WORD PTR _GRNDDETAIL,2
	jne	$I898
; Line 567
; Line 569
	mov	cl,6
	add	WORD PTR es:[bx+4],128
	mov	al,BYTE PTR es:[bx+4]
	and	ax,3
	shl	ax,cl
	mov	WORD PTR es:[bx+8],ax
	add	ax,63
	mov	WORD PTR es:[bx+12],ax
; Line 570
	mov	ax,WORD PTR es:[bx+4]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,2
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	and	ax,3
	mov	cl,6
	shl	ax,cl
	mov	WORD PTR es:[bx+10],ax
	add	ax,63
	jmp	SHORT $L20018
$I898:
; Line 573
; Line 574
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+4]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[si+4],ax
; Line 575
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+8]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[si+8],ax
; Line 576
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+10]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[si+10],ax
; Line 577
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+8]
	add	ax,WORD PTR es:[bx+12]
	inc	ax
	sar	ax,1
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[si+12],ax
; Line 578
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+10]
	add	ax,WORD PTR es:[bx+14]
	inc	ax
	sar	ax,1
	les	bx,DWORD PTR [bp-4]	;TBXBS
$L20018:
	mov	WORD PTR es:[bx+14],ax
; Line 579
; Line 580
	mov	ax,WORD PTR [bp+32]	;YI
	shl	ax,1
	push	ax
	mov	ax,WORD PTR [bp+30]	;XI
	shl	ax,1
	push	ax
	mov	ax,WORD PTR [bp+28]	;LEV
	inc	ax
	push	ax
	push	WORD PTR [bp+26]	;Z
	push	WORD PTR [bp+24]	;X
	mov	ax,WORD PTR [bp-12]	;TPTBS
	mov	dx,WORD PTR [bp-10]
	add	ax,68
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-12]	;TPTBS
	add	ax,34
	push	dx
	push	ax
	push	dx
	push	WORD PTR [bp-12]	;TPTBS
	push	WORD PTR [bp+10]
	push	WORD PTR [bp+8]	;PL1
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;TBXBS
	call	_DoBox
	add	sp,30
; Line 583
	mov	ax,WORD PTR [bp-16]	;SOFF
	mov	WORD PTR [bp-8],ax	;PTR
; Line 584
	mov	ax,2
	push	ax
	call	_MapInBank
	add	sp,2
	mov	WORD PTR [bp-6],ax
; Line 586
	les	bx,DWORD PTR [bp+4]	;B
	cmp	BYTE PTR es:[bx+6],0
	jne	$JCC3355
	jmp	$I900
$JCC3355:
; Line 587
; Line 588
	mov	al,BYTE PTR es:[bx+6]
	or	al,128
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[si+7],al
	mov	BYTE PTR es:[si+6],al
; Line 589
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[si+1],al
	mov	BYTE PTR es:[si],al
; Line 590
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+2]
	les	bx,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[bx+3],al
	mov	BYTE PTR es:[bx+2],al
; Line 593
	les	si,DWORD PTR [bp-8]	;PTR
	mov	al,BYTE PTR es:[si+1]
	cbw	
	les	bx,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[bx+4],ax
; Line 597
	cmp	WORD PTR [bp+28],2	;LEV
	jne	$I901
	cmp	ax,-1
	je	$I901
	cmp	WORD PTR _GRNDDETAIL,2
	jne	$I901
; Line 598
; Line 600
	mov	cl,6
	add	WORD PTR es:[bx+4],128
	mov	al,BYTE PTR es:[bx+4]
	and	ax,3
	shl	ax,cl
	mov	WORD PTR es:[bx+8],ax
	add	ax,63
	mov	WORD PTR es:[bx+12],ax
; Line 601
	mov	ax,WORD PTR es:[bx+4]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,2
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	and	ax,3
	mov	cl,6
	shl	ax,cl
	mov	WORD PTR es:[bx+10],ax
	add	ax,63
	jmp	SHORT $L20019
$I901:
; Line 604
; Line 605
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+4]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[si+4],ax
; Line 606
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+8]
	add	ax,WORD PTR es:[bx+12]
	inc	ax
	sar	ax,1
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[si+8],ax
; Line 607
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+10]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[si+10],ax
; Line 608
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+12]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[si+12],ax
; Line 609
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+10]
	add	ax,WORD PTR es:[bx+14]
	inc	ax
	sar	ax,1
	les	bx,DWORD PTR [bp-4]	;TBXBS
$L20019:
	mov	WORD PTR es:[bx+14],ax
; Line 610
; Line 611
	mov	ax,WORD PTR [bp+32]	;YI
	shl	ax,1
	push	ax
	mov	ax,WORD PTR [bp+30]	;XI
	shl	ax,1
	inc	ax
	push	ax
	mov	ax,WORD PTR [bp+28]	;LEV
	inc	ax
	push	ax
	push	WORD PTR [bp+26]	;Z
	mov	ax,WORD PTR [bp-14]	;SZ
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,WORD PTR [bp+24]	;X
	push	ax
	mov	ax,WORD PTR [bp-12]	;TPTBS
	mov	dx,WORD PTR [bp-10]
	add	ax,102
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-12]	;TPTBS
	add	ax,68
	push	dx
	push	ax
	push	WORD PTR [bp+14]
	push	WORD PTR [bp+12]	;PL2
	push	dx
	push	WORD PTR [bp-12]	;TPTBS
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;TBXBS
	call	_DoBox
	add	sp,30
; Line 612
; Line 614
$I900:
	mov	ax,WORD PTR [bp-16]	;SOFF
	mov	WORD PTR [bp-8],ax	;PTR
; Line 615
	mov	ax,2
	push	ax
	call	_MapInBank
	add	sp,2
	mov	WORD PTR [bp-6],ax
; Line 617
	les	bx,DWORD PTR [bp+4]	;B
	cmp	BYTE PTR es:[bx+7],0
	jne	$JCC3691
	jmp	$I903
$JCC3691:
; Line 618
; Line 619
	mov	al,BYTE PTR es:[bx+7]
	or	al,128
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[si+7],al
	mov	BYTE PTR es:[si+6],al
; Line 620
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+1]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[si+1],al
	mov	BYTE PTR es:[si],al
; Line 622
	les	bx,DWORD PTR [bp-8]	;PTR
	mov	al,BYTE PTR es:[bx+8]
	cbw	
	les	bx,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[bx+4],ax
; Line 624
	les	si,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[si+3]
	les	bx,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[bx+3],al
	mov	BYTE PTR es:[bx+2],al
; Line 627
	cmp	WORD PTR [bp+28],2	;LEV
	jne	$I904
	cmp	WORD PTR es:[bx+4],-1
	je	$I904
	cmp	WORD PTR _GRNDDETAIL,2
	jne	$I904
; Line 628
; Line 630
	mov	cl,6
	add	WORD PTR es:[bx+4],128
	mov	al,BYTE PTR es:[bx+4]
	and	ax,3
	shl	ax,cl
	mov	WORD PTR es:[bx+8],ax
	add	ax,63
	mov	WORD PTR es:[bx+12],ax
; Line 631
	mov	ax,WORD PTR es:[bx+4]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,2
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	and	ax,3
	mov	cl,6
	shl	ax,cl
	mov	WORD PTR es:[bx+10],ax
	add	ax,63
	jmp	SHORT $L20020
	nop	
$I904:
; Line 634
; Line 635
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+4]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[si+4],ax
; Line 636
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+8]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[si+8],ax
; Line 637
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+10]
	add	ax,WORD PTR es:[bx+14]
	inc	ax
	sar	ax,1
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[si+10],ax
; Line 638
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+8]
	add	ax,WORD PTR es:[bx+12]
	inc	ax
	sar	ax,1
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[si+12],ax
; Line 639
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+14]
	les	bx,DWORD PTR [bp-4]	;TBXBS
$L20020:
	mov	WORD PTR es:[bx+14],ax
; Line 640
; Line 641
	mov	ax,WORD PTR [bp+32]	;YI
	shl	ax,1
	inc	ax
	push	ax
	mov	ax,WORD PTR [bp+30]	;XI
	shl	ax,1
	push	ax
	mov	ax,WORD PTR [bp+28]	;LEV
	inc	ax
	push	ax
	mov	ax,WORD PTR [bp-14]	;SZ
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,WORD PTR [bp+26]	;Z
	push	ax
	push	WORD PTR [bp+24]	;X
	mov	ax,WORD PTR [bp-12]	;TPTBS
	mov	dx,WORD PTR [bp-10]
	add	ax,136
	push	dx
	push	ax
	push	WORD PTR [bp+18]
	push	WORD PTR [bp+16]	;PL3
	mov	ax,WORD PTR [bp-12]	;TPTBS
	add	ax,68
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-12]	;TPTBS
	add	ax,34
	push	dx
	push	ax
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;TBXBS
	call	_DoBox
	add	sp,30
; Line 642
; Line 646
$I903:
	mov	ax,WORD PTR [bp-16]	;SOFF
	mov	WORD PTR [bp-8],ax	;PTR
; Line 647
	mov	ax,2
	push	ax
	call	_MapInBank
	add	sp,2
	mov	WORD PTR [bp-6],ax
; Line 649
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[si],al
; Line 650
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+1]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[si+1],al
; Line 651
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+6]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[si+6],al
; Line 652
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+7]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[si+7],al
; Line 653
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+2]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[si+2],al
; Line 654
	les	bx,DWORD PTR [bp+4]	;B
	mov	al,BYTE PTR es:[bx+3]
	les	bx,DWORD PTR [bp-4]	;TBXBS
	mov	BYTE PTR es:[bx+3],al
; Line 656
	les	si,DWORD PTR [bp-8]	;PTR
	mov	al,BYTE PTR es:[si+9]
	cbw	
	les	bx,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[bx+4],ax
; Line 660
	cmp	WORD PTR [bp+28],2	;LEV
	jne	$I906
	cmp	ax,-1
	je	$I906
	cmp	WORD PTR _GRNDDETAIL,2
	jne	$I906
; Line 661
; Line 663
	mov	cl,6
	add	WORD PTR es:[bx+4],128
	mov	al,BYTE PTR es:[bx+4]
	and	ax,3
	shl	ax,cl
	mov	WORD PTR es:[bx+8],ax
	add	ax,63
	mov	WORD PTR es:[bx+12],ax
; Line 664
	mov	ax,WORD PTR es:[bx+4]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,2
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	and	ax,3
	mov	cl,6
	shl	ax,cl
	mov	WORD PTR es:[bx+10],ax
	add	ax,63
	jmp	SHORT $L20021
$I906:
; Line 667
; Line 668
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+4]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[si+4],ax
; Line 669
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+8]
	add	ax,WORD PTR es:[bx+12]
	inc	ax
	sar	ax,1
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[si+8],ax
; Line 670
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+10]
	add	ax,WORD PTR es:[bx+14]
	inc	ax
	sar	ax,1
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[si+10],ax
; Line 671
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+12]
	les	si,DWORD PTR [bp-4]	;TBXBS
	mov	WORD PTR es:[si+12],ax
; Line 672
	les	bx,DWORD PTR [bp+4]	;B
	mov	ax,WORD PTR es:[bx+14]
	les	bx,DWORD PTR [bp-4]	;TBXBS
$L20021:
	mov	WORD PTR es:[bx+14],ax
; Line 673
; Line 674
	mov	ax,WORD PTR [bp+32]	;YI
	shl	ax,1
	inc	ax
	push	ax
	mov	ax,WORD PTR [bp+30]	;XI
	shl	ax,1
	inc	ax
	push	ax
	mov	ax,WORD PTR [bp+28]	;LEV
	inc	ax
	push	ax
	mov	ax,WORD PTR [bp-14]	;SZ
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	cx,ax
	add	ax,WORD PTR [bp+26]	;Z
	push	ax
	add	cx,WORD PTR [bp+24]	;X
	push	cx
	push	WORD PTR [bp+22]
	push	WORD PTR [bp+20]	;PL4
	mov	ax,WORD PTR [bp-12]	;TPTBS
	mov	dx,WORD PTR [bp-10]
	add	ax,136
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-12]	;TPTBS
	add	ax,102
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-12]	;TPTBS
	add	ax,68
	push	dx
	push	ax
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;TBXBS
	call	_DoBox
	add	sp,30
; Line 676
	sub	WORD PTR _BXBS,16
; Line 677
	sub	WORD PTR _PTBS,170
; Line 678
$I896:
; Line 679
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_DoBox	ENDP
; Line 682
	PUBLIC	_GetQHeight
_GetQHeight	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__aNchkstk
	push	si
;	XB = -14
;	ZB = -24
;	XOFF = -2
;	ZOFF = -4
;	H1 = -10
;	H2 = -12
;	H3 = -16
;	H4 = -22
;	L = -20
;	PTR = -8
;	Z = 8
;	X = 4
; Line 694
	mov	ax,4096
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp+10]
	push	WORD PTR [bp+8]	;Z
	call	__aNldiv
	sub	ah,ah
	mov	WORD PTR [bp-24],ax	;ZB
; Line 695
	mov	cx,WORD PTR [bp+4]	;X
	and	ch,15
	mov	WORD PTR [bp-2],cx	;XOFF
; Line 696
	mov	dx,WORD PTR [bp+8]	;Z
	and	dh,15
	mov	WORD PTR [bp-4],dx	;ZOFF
; Line 698
	mov	WORD PTR [bp-8],0	;PTR
; Line 699
	sub	bx,bx
	push	bx
	call	_MapInBank
	add	sp,2
	mov	WORD PTR [bp-6],ax
; Line 707
	mov	ax,4096
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp+6]
	push	WORD PTR [bp+4]	;X
	call	__aNldiv
	sub	ah,ah
	mov	bh,BYTE PTR [bp-24]	;ZB
	sub	bl,bl
	add	bx,ax
	les	si,DWORD PTR [bp-8]	;PTR
	mov	al,BYTE PTR es:[bx][si]
	mov	cl,4
	shl	ax,cl
	mov	WORD PTR [bp-10],ax	;H1
; Line 708
	add	bx,si
	mov	dl,BYTE PTR es:[bx+1]
	sub	dh,dh
	shl	dx,cl
	mov	WORD PTR [bp-12],dx	;H2
; Line 709
	mov	dl,BYTE PTR es:[bx+256]
	sub	dh,dh
	shl	dx,cl
	mov	WORD PTR [bp-16],dx	;H3
; Line 710
	mov	dl,BYTE PTR es:[bx+257]
	sub	dh,dh
	shl	dx,cl
	mov	WORD PTR [bp-22],dx	;H4
; Line 712
	mov	WORD PTR _MikeHeight,ax
; Line 714
	mov	ax,WORD PTR [bp-4]	;ZOFF
	cmp	WORD PTR [bp-2],ax	;XOFF
	jle	$I922
; Line 715
; Line 717
	mov	cx,4096
	sub	dx,dx
	push	dx
	push	cx
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-12]	;H2
	sub	ax,WORD PTR [bp-22]	;H4
	cwd	
	push	dx
	push	ax
	call	_MulDiv32
	add	sp,12
	mov	cx,4096
	sub	bx,bx
	push	bx
	push	cx
	mov	cx,ax
	mov	ax,WORD PTR [bp-2]	;XOFF
	mov	bx,dx
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-10]	;H1
	sub	ax,WORD PTR [bp-12]	;H2
	jmp	SHORT $L20022
$I922:
; Line 720
; Line 722
	mov	ax,4096
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-4]	;ZOFF
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-10]	;H1
	sub	ax,WORD PTR [bp-16]	;H3
	cwd	
	push	dx
	push	ax
	call	_MulDiv32
	add	sp,12
	mov	cx,4096
	sub	bx,bx
	push	bx
	push	cx
	mov	cx,ax
	mov	ax,WORD PTR [bp-2]	;XOFF
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-16]	;H3
	sub	ax,WORD PTR [bp-22]	;H4
$L20022:
	cwd	
	push	dx
	push	ax
	mov	si,cx
	call	_MulDiv32
	add	sp,12
	add	si,ax
	neg	si
; Line 723
; Line 725
	mov	ax,si
	add	ax,WORD PTR [bp-10]	;H1
	mov	cl,3
	shl	ax,cl
; Line 726
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetQHeight	ENDP
; Line 729
	PUBLIC	_IsLand
_IsLand	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__aNchkstk
	push	si
;	XB = -14
;	ZB = -24
;	XOFF = -2
;	ZOFF = -4
;	H1 = -10
;	H2 = -12
;	H3 = -16
;	H4 = -22
;	L = -20
;	PTR = -8
;	Z = 8
;	X = 4
; Line 741
	mov	ax,4096
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp+10]
	push	WORD PTR [bp+8]	;Z
	call	__aNldiv
	sub	ah,ah
; Line 742
	mov	cx,WORD PTR [bp+4]	;X
	and	ch,15
; Line 743
	mov	cx,WORD PTR [bp+8]	;Z
	and	ch,15
; Line 745
	mov	WORD PTR [bp-8],0	;PTR
; Line 746
	mov	cx,1
	push	cx
	mov	si,ax
	call	_MapInBank
	add	sp,2
	mov	WORD PTR [bp-6],ax
; Line 749
	mov	ax,4096
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp+6]
	push	WORD PTR [bp+4]	;X
	call	__aNldiv
	mov	bx,ax
	sub	bh,bh
	mov	ax,si
	mov	ah,al
	sub	al,al
	add	bx,ax
	les	si,DWORD PTR [bp-8]	;PTR
	mov	al,BYTE PTR es:[bx][si]
	cbw	
; Line 751
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_IsLand	ENDP
; Line 760
_TEXT      ENDS
CONST      SEGMENT
$T20012	DW SEG _OBJECTS 
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_DrawLandObjects
_DrawLandObjects	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
	push	si
;	i = -12
;	xt = -14
;	yt = -16
;	zt = -18
;	scl = -2
;	XL = -6
;	ZL = -10
;	Z = 10
;	Y = 8
;	X = 6
;	STMP = 4
; Line 766
	mov	WORD PTR [bp-12],0	;i
	jmp	SHORT $F953
	nop	
$I956:
; Line 783
; Line 784
	sub	ax,ax
	push	ax
	push	ax
	mov	ax,OFFSET _IdentInvMat
	push	ax
	mov	ax,WORD PTR [bp-2]	;scl
	imul	WORD PTR [bp-18]	;zt
	push	ax
	mov	ax,WORD PTR [bp-16]	;yt
	add	ax,WORD PTR [bp+8]	;Y
	imul	WORD PTR [bp-2]	;scl
	push	ax
	mov	ax,WORD PTR [bp-2]	;scl
	imul	WORD PTR [bp-14]	;xt
	push	ax
	mov	es,WORD PTR $T20012
	mov	cl,4
	mov	bx,WORD PTR [bp+4]	;STMP
	shl	bx,cl
	add	bx,WORD PTR [bp-12]	;i
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR es:_OBJECTS[bx]
$L20023:
	add	ax,WORD PTR _LandObjectBase
	push	ax
	call	_NDraw3DObject
	add	sp,14
; Line 785
; Line 786
	inc	WORD PTR [bp-12]	;i
$F953:
	cmp	WORD PTR [bp-12],16	;i
	jl	$JCC4857
	jmp	$FB955
$JCC4857:
	mov	es,WORD PTR $T20012
	mov	cl,4
	mov	bx,WORD PTR [bp+4]	;STMP
	shl	bx,cl
	add	bx,WORD PTR [bp-12]	;i
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR es:_OBJECTS[bx],-1
	jne	$JCC4890
	jmp	$FB955
$JCC4890:
; Line 767
; Line 768
	mov	si,WORD PTR es:_OBJECTS[bx]
	shl	si,1
	mov	ax,WORD PTR _GroundObjectScale[si]
	mov	WORD PTR [bp-2],ax	;scl
; Line 769
	mov	ax,WORD PTR es:_OBJECTS[bx+2]
	mov	cl,5
	shl	ax,cl
	add	ax,WORD PTR [bp+6]	;X
	mov	WORD PTR [bp-14],ax	;xt
; Line 770
	mov	dx,WORD PTR es:_OBJECTS[bx+4]
	shl	dx,cl
	add	dx,WORD PTR [bp+10]	;Z
	mov	WORD PTR [bp-18],dx	;zt
; Line 771
	mov	cx,dx
	cwd	
	add	ax,WORD PTR _WORLDXPOS
	adc	dx,WORD PTR _WORLDXPOS+2
; Line 772
	mov	si,ax
	mov	ax,cx
	mov	cx,dx
	cwd	
	add	ax,WORD PTR _WORLDZPOS
	adc	dx,WORD PTR _WORLDZPOS+2
; Line 774
	push	dx
	push	ax
	push	cx
	push	si
	mov	si,bx
	call	_GetQHeight
	add	sp,8
; Line 776
	mov	cx,4
	cwd	
	idiv	cx
	mov	WORD PTR [bp-16],ax	;yt
; Line 778
	cmp	WORD PTR [bp-2],0	;scl
	jl	$JCC4988
	jmp	$I956
$JCC4988:
; Line 779
; Line 780
	sub	ax,ax
	push	ax
	push	ax
	mov	ax,OFFSET _IdentInvMat
	push	ax
	mov	ax,WORD PTR [bp-18]	;zt
	cwd	
	idiv	WORD PTR [bp-2]	;scl
	neg	ax
	push	ax
	mov	ax,WORD PTR [bp-16]	;yt
	add	ax,WORD PTR [bp+8]	;Y
	cwd	
	idiv	WORD PTR [bp-2]	;scl
	neg	ax
	push	ax
	mov	ax,WORD PTR [bp-14]	;xt
	cwd	
	idiv	WORD PTR [bp-2]	;scl
	neg	ax
	push	ax
	mov	es,WORD PTR $T20012
	mov	ax,WORD PTR es:_OBJECTS[si]
	jmp	$L20023
$FB955:
; Line 787
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DrawLandObjects	ENDP
; Line 791
	PUBLIC	_DrawNLand
_DrawNLand	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,50
	call	__aNchkstk
	push	di
	push	si
;	i = -16
;	j = -18
;	P1 = -8
;	List = -42
;	SEG = -46
;	HT = -26
;	t = -10
;	tx = -24
;	tz = -44
;	BG = -14
;	GPT = -22
;	TMP = -4
;	SRC = 20
;	DST = 16
;	Z = 12
;	Y = 8
;	X = 4
; Line 809
	mov	ax,WORD PTR _GRNDDETAIL
	dec	ax
	je	$SC982
	dec	ax
	jne	$JCC5070
	jmp	$SC983
$JCC5070:
; Line 819
	mov	WORD PTR _MAXLEV,0
; Line 820
	jmp	SHORT $SB979
; Line 810
; Line 811
	nop	
$SC982:
; Line 812
	mov	WORD PTR _MAXLEV,3
; Line 813
$SB979:
; Line 827
	mov	ax,WORD PTR [bp+12]	;Z
	mov	dx,WORD PTR [bp+14]
	mov	WORD PTR _WORLDZPOS,ax
	mov	WORD PTR _WORLDZPOS+2,dx
; Line 830
	mov	cx,WORD PTR [bp+16]	;DST
	mov	bx,WORD PTR [bp+18]
	mov	WORD PTR _ScreenAddr,cx
	mov	WORD PTR _ScreenAddr+2,bx
; Line 831
	mov	cx,WORD PTR [bp+20]	;SRC
	mov	bx,WORD PTR [bp+22]
	mov	WORD PTR _BitMaps,cx
	mov	WORD PTR _BitMaps+2,bx
; Line 832
	mov	WORD PTR _BitMaps+4,cx
	mov	WORD PTR _BitMaps+6,bx
; Line 833
	mov	WORD PTR _BitMaps+8,cx
	mov	WORD PTR _BitMaps+10,bx
; Line 834
	mov	WORD PTR _BitMaps+12,cx
	mov	WORD PTR _BitMaps+14,bx
; Line 837
	mov	cx,WORD PTR [bp+4]	;X
	mov	bx,WORD PTR [bp+6]
	mov	WORD PTR _WORLDXPOS,cx
	mov	WORD PTR _WORLDXPOS+2,bx
	and	cx,3
	neg	cx
	mov	WORD PTR _WORLDXTRAX,cx
; Line 838
	mov	WORD PTR _WORLDXTRAY,0
; Line 839
	and	ax,3
	neg	ax
	mov	WORD PTR _WORLDXTRAZ,ax
; Line 844
	mov	ax,WORD PTR _WORLDXPOS
	mov	dx,bx
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	mov	WORD PTR [bp+4],ax	;X
	mov	WORD PTR [bp+6],dx
	and	ah,3
	neg	ax
	mov	WORD PTR _WORLDXOFF,ax
; Line 845
	mov	al,2
	push	ax
	lea	cx,WORD PTR [bp+8]	;Y
	push	cx
	call	__aNNalshr
	neg	ax
	mov	WORD PTR _WORLDYOFF,ax
; Line 846
	mov	al,2
	push	ax
	lea	ax,WORD PTR [bp+12]	;Z
	push	ax
	call	__aNNalshr
	mov	cx,ax
	mov	bx,dx
	and	ah,3
	mov	dx,ax
	neg	ax
	mov	WORD PTR _WORLDZOFF,ax
; Line 847
	mov	si,dx
	mov	ax,1024
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp+6]
	push	WORD PTR [bp+4]	;X
	mov	di,cx
	mov	WORD PTR [bp-50],di
	mov	WORD PTR [bp-48],bx
	call	__aNldiv
	mov	WORD PTR _XBASE,ax
; Line 848
	mov	ax,1024
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-48]
	push	WORD PTR [bp-50]
	call	__aNldiv
	mov	WORD PTR _ZBASE,ax
; Line 850
	mov	WORD PTR [bp-4],0	;TMP
; Line 851
	mov	ax,WORD PTR _GRPAGE0+4
	mov	WORD PTR [bp-2],ax
; Line 853
	push	ax
	push	WORD PTR [bp-4]	;TMP
	call	_MakePTS
	add	sp,4
; Line 854
	mov	ax,WORD PTR [bp-4]	;TMP
	mov	dx,WORD PTR [bp-2]
	add	ah,128
	push	dx
	push	ax
	call	_MakeBoxes
	add	sp,4
; Line 855
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;TMP
	mov	ax,WORD PTR [bp-4]	;TMP
	mov	dx,WORD PTR [bp-2]
	add	ah,128
	push	dx
	push	ax
	call	_MakeBoxVis
	add	sp,8
; Line 857
	mov	ax,WORD PTR [bp-4]	;TMP
	mov	dx,WORD PTR [bp-2]
	add	ah,128
	mov	WORD PTR _BXBS,ax
	mov	WORD PTR _BXBS+2,dx
	mov	WORD PTR [bp-14],ax	;BG
	mov	WORD PTR [bp-12],dx
; Line 858
	mov	cx,WORD PTR [bp-4]	;TMP
	mov	bx,dx
	mov	WORD PTR _PTBS,cx
	mov	WORD PTR _PTBS+2,bx
	mov	WORD PTR [bp-22],cx	;GPT
	mov	WORD PTR [bp-20],bx
; Line 860
	add	ah,16
	mov	WORD PTR _BXBS,ax
; Line 861
	add	ch,34
	mov	WORD PTR _PTBS,cx
; Line 864
	mov	WORD PTR [bp-16],0	;i
	sub	si,-8192
	neg	si
	mov	WORD PTR [bp-44],si	;tz
	jmp	$F985
; Line 814
$SC983:
; Line 815
	mov	WORD PTR _MAXLEV,5
; Line 816
	jmp	$SB979
; Line 817
	nop	
$FC989:
	inc	WORD PTR [bp-18]	;j
	add	BYTE PTR [bp-23],4
$F988:
	cmp	WORD PTR [bp-18],8	;j
	jl	$JCC5457
	jmp	$FC986
$JCC5457:
; Line 867
; Line 870
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	push	WORD PTR [bp-44]	;tz
	push	WORD PTR [bp-24]	;tx
	mov	ax,WORD PTR [bp-16]	;i
	mov	cl,4
	shl	ax,cl
	add	ax,WORD PTR [bp-18]	;j
	mov	bx,34
	mov	si,ax
	imul	bx
	add	ax,WORD PTR [bp-22]	;GPT
	mov	dx,WORD PTR [bp-20]
	mov	di,ax
	mov	cx,dx
	add	ax,578
	push	dx
	push	ax
	lea	ax,WORD PTR [di+544]
	push	cx
	push	ax
	lea	ax,WORD PTR [di+34]
	push	cx
	push	ax
	push	cx
	push	di
	mov	cl,4
	shl	si,cl
	add	si,WORD PTR [bp-14]	;BG
	mov	cx,WORD PTR [bp-12]
	push	cx
	push	si
	mov	di,cx
	call	_DoBox
	add	sp,30
; Line 871
	cmp	WORD PTR [bp-16],5	;i
	jle	$FC989
	cmp	WORD PTR [bp-18],5	;j
	jle	$FC989
	mov	es,di
	cmp	WORD PTR es:[si+4],0
	jle	$FC989
; Line 872
	mov	ax,WORD PTR [bp-44]	;tz
	shl	ax,1
	shl	ax,1
	push	ax
	mov	ax,WORD PTR _WORLDYOFF
	shl	ax,1
	shl	ax,1
	push	ax
	mov	ax,WORD PTR [bp-24]	;tx
	shl	ax,1
	shl	ax,1
	push	ax
	push	WORD PTR es:[si+4]
	call	_DrawLandObjects
	add	sp,8
; Line 874
	jmp	$FC989
; Line 875
$FC986:
	inc	WORD PTR [bp-16]	;i
	add	BYTE PTR [bp-43],4
$F985:
	cmp	WORD PTR [bp-16],8	;i
	jge	$FB987
; Line 865
; Line 866
	mov	WORD PTR [bp-18],0	;j
	mov	ax,WORD PTR [bp+4]	;X
	and	ah,3
	sub	ax,-8192
	neg	ax
	mov	WORD PTR [bp-24],ax	;tx
	jmp	$F988
	nop	
$FB987:
; Line 876
	mov	WORD PTR [bp-16],0	;i
	mov	ax,WORD PTR [bp+12]	;Z
	and	ah,3
	sub	ax,-8192
	neg	ax
	mov	WORD PTR [bp-44],ax	;tz
	jmp	$F992
$FC996:
	dec	WORD PTR [bp-18]	;j
	sub	WORD PTR [bp-24],1024	;tx
$F995:
	cmp	WORD PTR [bp-18],8	;j
	jge	$JCC5666
	jmp	$FC993
$JCC5666:
; Line 879
; Line 882
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	push	WORD PTR [bp-44]	;tz
	push	WORD PTR [bp-24]	;tx
	mov	ax,WORD PTR [bp-16]	;i
	mov	cl,4
	shl	ax,cl
	add	ax,WORD PTR [bp-18]	;j
	mov	bx,34
	mov	si,ax
	imul	bx
	add	ax,WORD PTR [bp-22]	;GPT
	mov	dx,WORD PTR [bp-20]
	mov	di,ax
	mov	cx,dx
	add	ax,578
	push	dx
	push	ax
	lea	ax,WORD PTR [di+544]
	push	cx
	push	ax
	lea	ax,WORD PTR [di+34]
	push	cx
	push	ax
	push	cx
	push	di
	mov	cl,4
	shl	si,cl
	add	si,WORD PTR [bp-14]	;BG
	mov	cx,WORD PTR [bp-12]
	push	cx
	push	si
	mov	di,cx
	call	_DoBox
	add	sp,30
; Line 883
	cmp	WORD PTR [bp-16],5	;i
	jle	$FC996
	cmp	WORD PTR [bp-18],10	;j
	jge	$FC996
	mov	es,di
	cmp	WORD PTR es:[si+4],0
	jle	$FC996
; Line 884
	mov	ax,WORD PTR [bp-44]	;tz
	shl	ax,1
	shl	ax,1
	push	ax
	mov	ax,WORD PTR _WORLDYOFF
	shl	ax,1
	shl	ax,1
	push	ax
	mov	ax,WORD PTR [bp-24]	;tx
	shl	ax,1
	shl	ax,1
	push	ax
	push	WORD PTR es:[si+4]
	call	_DrawLandObjects
	add	sp,8
; Line 885
	jmp	$FC996
; Line 886
	nop	
$FC993:
	inc	WORD PTR [bp-16]	;i
	add	BYTE PTR [bp-43],4
$F992:
	cmp	WORD PTR [bp-16],8	;i
	jge	$FB994
; Line 877
; Line 878
	mov	WORD PTR [bp-18],14	;j
	mov	ax,WORD PTR [bp+4]	;X
	and	ah,3
	sub	ax,6144
	neg	ax
	mov	WORD PTR [bp-24],ax	;tx
	jmp	$F995
	nop	
$FB994:
; Line 887
	mov	WORD PTR [bp-16],14	;i
	mov	ax,WORD PTR [bp+12]	;Z
	and	ah,3
	sub	ax,6144
	neg	ax
	mov	WORD PTR [bp-44],ax	;tz
	jmp	$F999
$FC1003:
	inc	WORD PTR [bp-18]	;j
	add	BYTE PTR [bp-23],4
$F1002:
	cmp	WORD PTR [bp-18],8	;j
	jl	$JCC5875
	jmp	$FC1000
$JCC5875:
; Line 890
; Line 893
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	push	WORD PTR [bp-44]	;tz
	push	WORD PTR [bp-24]	;tx
	mov	ax,WORD PTR [bp-16]	;i
	mov	cl,4
	shl	ax,cl
	add	ax,WORD PTR [bp-18]	;j
	mov	bx,34
	mov	si,ax
	imul	bx
	add	ax,WORD PTR [bp-22]	;GPT
	mov	dx,WORD PTR [bp-20]
	mov	di,ax
	mov	cx,dx
	add	ax,578
	push	dx
	push	ax
	lea	ax,WORD PTR [di+544]
	push	cx
	push	ax
	lea	ax,WORD PTR [di+34]
	push	cx
	push	ax
	push	cx
	push	di
	mov	cl,4
	shl	si,cl
	add	si,WORD PTR [bp-14]	;BG
	mov	cx,WORD PTR [bp-12]
	push	cx
	push	si
	mov	di,cx
	call	_DoBox
	add	sp,30
; Line 894
	cmp	WORD PTR [bp-16],10	;i
	jge	$FC1003
	cmp	WORD PTR [bp-18],5	;j
	jle	$FC1003
	mov	es,di
	cmp	WORD PTR es:[si+4],0
	jle	$FC1003
; Line 895
	mov	ax,WORD PTR [bp-44]	;tz
	shl	ax,1
	shl	ax,1
	push	ax
	mov	ax,WORD PTR _WORLDYOFF
	shl	ax,1
	shl	ax,1
	push	ax
	mov	ax,WORD PTR [bp-24]	;tx
	shl	ax,1
	shl	ax,1
	push	ax
	push	WORD PTR es:[si+4]
	call	_DrawLandObjects
	add	sp,8
; Line 896
	jmp	$FC1003
; Line 897
$FC1000:
	dec	WORD PTR [bp-16]	;i
	sub	WORD PTR [bp-44],1024	;tz
$F999:
	cmp	WORD PTR [bp-16],8	;i
	jl	$FB1001
; Line 888
; Line 889
	mov	WORD PTR [bp-18],0	;j
	mov	ax,WORD PTR [bp+4]	;X
	and	ah,3
	sub	ax,-8192
	neg	ax
	mov	WORD PTR [bp-24],ax	;tx
	jmp	$F1002
$FB1001:
; Line 898
	mov	WORD PTR [bp-16],14	;i
	mov	ax,WORD PTR [bp+12]	;Z
	and	ah,3
	sub	ax,6144
	neg	ax
	mov	WORD PTR [bp-44],ax	;tz
	jmp	$F1006
$FC1010:
	dec	WORD PTR [bp-18]	;j
	sub	WORD PTR [bp-24],1024	;tx
$F1009:
	cmp	WORD PTR [bp-18],8	;j
	jge	$JCC6084
	jmp	$FC1007
$JCC6084:
; Line 901
; Line 904
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	push	WORD PTR [bp-44]	;tz
	push	WORD PTR [bp-24]	;tx
	mov	ax,WORD PTR [bp-16]	;i
	mov	cl,4
	shl	ax,cl
	add	ax,WORD PTR [bp-18]	;j
	mov	bx,34
	mov	si,ax
	imul	bx
	add	ax,WORD PTR [bp-22]	;GPT
	mov	dx,WORD PTR [bp-20]
	mov	di,ax
	mov	cx,dx
	add	ax,578
	push	dx
	push	ax
	lea	ax,WORD PTR [di+544]
	push	cx
	push	ax
	lea	ax,WORD PTR [di+34]
	push	cx
	push	ax
	push	cx
	push	di
	mov	cl,4
	shl	si,cl
	add	si,WORD PTR [bp-14]	;BG
	mov	cx,WORD PTR [bp-12]
	push	cx
	push	si
	mov	di,cx
	call	_DoBox
	add	sp,30
; Line 905
	cmp	WORD PTR [bp-16],10	;i
	jge	$FC1010
	cmp	WORD PTR [bp-18],10	;j
	jge	$FC1010
	mov	es,di
	cmp	WORD PTR es:[si+4],0
	jle	$FC1010
; Line 906
	mov	ax,WORD PTR [bp-44]	;tz
	shl	ax,1
	shl	ax,1
	push	ax
	mov	ax,WORD PTR _WORLDYOFF
	shl	ax,1
	shl	ax,1
	push	ax
	mov	ax,WORD PTR [bp-24]	;tx
	shl	ax,1
	shl	ax,1
	push	ax
	push	WORD PTR es:[si+4]
	call	_DrawLandObjects
	add	sp,8
; Line 907
	jmp	$FC1010
; Line 908
	nop	
$FC1007:
	dec	WORD PTR [bp-16]	;i
	sub	WORD PTR [bp-44],1024	;tz
$F1006:
	cmp	WORD PTR [bp-16],8	;i
	jl	$FB1008
; Line 899
; Line 900
	mov	WORD PTR [bp-18],14	;j
	mov	ax,WORD PTR [bp+4]	;X
	and	ah,3
	sub	ax,6144
	neg	ax
	mov	WORD PTR [bp-24],ax	;tx
	jmp	$F1009
$FB1008:
; Line 910
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_DrawNLand	ENDP
_TEXT	ENDS
END
