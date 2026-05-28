;	Static Name Aliases
;
	TITLE   C:\NPOLYS.C
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
PUBLIC  _CLIPZ
EXTRN	_NDDot:NEAR
EXTRN	_NPFFill:NEAR
EXTRN	_BuildPolyList:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_NPFLine:NEAR
EXTRN	_Perspect3D:NEAR
EXTRN	_ZClip:NEAR
EXTRN	_NDLine:NEAR
_BSS      SEGMENT
COMM NEAR	_D:	BYTE:	 14
_BSS      ENDS
_DATA      SEGMENT
_CLIPZ	DD	020000H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 2
; Line 3
; Line 91
	PUBLIC	_LPoly
_LPoly	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
;	S = 16
;	TYPE = 14
;	D = 10
;	CNT = 8
;	PL = 4
; Line 95
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F327
$FC328:
; Line 96
; Line 97
	push	WORD PTR [bp+14]	;TYPE
	mov	cl,4
	mov	ax,WORD PTR [bp-2]	;i
	shl	ax,cl
	add	ax,WORD PTR [bp+4]	;PL
	mov	dx,WORD PTR [bp+6]
	mov	cx,ax
	mov	bx,dx
	add	ax,16
	push	dx
	push	ax
	push	bx
	push	cx
	call	_NPFLine
	add	sp,10
; Line 98
	inc	WORD PTR [bp-2]	;i
$F327:
	mov	ax,WORD PTR [bp+8]	;CNT
	dec	ax
	cmp	ax,WORD PTR [bp-2]	;i
	jg	$FC328
; Line 99
	push	WORD PTR [bp+14]	;TYPE
	push	WORD PTR [bp+6]
	push	WORD PTR [bp+4]	;PL
	mov	cl,4
	mov	ax,WORD PTR [bp+8]	;CNT
	shl	ax,cl
	add	ax,WORD PTR [bp+4]	;PL
	mov	dx,WORD PTR [bp+6]
	sub	ax,16
	push	dx
	push	ax
	call	_NPFLine
	add	sp,10
; Line 101
	push	WORD PTR [bp+18]
	push	WORD PTR [bp+16]	;S
	push	WORD PTR [bp+14]	;TYPE
	push	WORD PTR [bp+12]
	push	WORD PTR [bp+10]	;D
	call	_NPFFill
; Line 103
	mov	sp,bp
	pop	bp
	ret	

_LPoly	ENDP
; Line 190
	PUBLIC	_Npoly3D
_Npoly3D	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,276
	call	__aNchkstk
	push	di
	push	si
;	i = -138
;	Npts = -8
;	Xpts = -276
;	XTRAPTS = -136
;	P = -4
;	PNXT = -270
;	OFlags = -274
;	NFlags = -272
;	NList = -266
;	T = -6
;	S = 14
;	TYPE = 12
;	D = 8
;	List = 6
;	Num = 4
; Line 201
	push	WORD PTR [bp+12]	;TYPE
	push	WORD PTR [bp+16]
	push	WORD PTR [bp+14]	;S
	push	WORD PTR [bp+10]
	push	WORD PTR [bp+8]	;D
	lea	ax,WORD PTR [bp-266]	;NList
	push	ax
	push	WORD PTR [bp+6]	;List
	push	WORD PTR [bp+4]	;Num
	call	_BuildPolyList
	add	sp,16
	mov	WORD PTR [bp-6],ax	;T
	cmp	ax,1
	jge	$JCC165
	jmp	$EX336
$JCC165:
; Line 218
	sub	ax,ax
	mov	WORD PTR [bp-276],ax	;Xpts
	mov	WORD PTR [bp-8],ax	;Npts
	mov	WORD PTR [bp-138],ax	;i
	mov	bx,WORD PTR [bp+6]	;List
	mov	ax,WORD PTR [bx]
	mov	dx,WORD PTR [bx+2]
	mov	WORD PTR [bp-4],ax	;P
	mov	WORD PTR [bp-2],dx
	mov	WORD PTR [bp-272],-1	;NFlags
	jmp	$F349
; Line 230
; Line 231
$I353:
	les	bx,DWORD PTR [bp-270]	;PNXT
	test	BYTE PTR es:[bx+30],16
	je	$I355
; Line 232
; Line 233
	mov	ax,WORD PTR [bp-4]	;P
	mov	dx,WORD PTR [bp-2]
	mov	si,WORD PTR [bp-8]	;Npts
	shl	si,1
	shl	si,1
	mov	WORD PTR [bp-266][si],ax
	mov	WORD PTR [bp-264][si],dx
; Line 234
	mov	es,dx
	mov	bx,ax
	mov	cx,WORD PTR es:[bx+30]
	and	WORD PTR [bp-272],cx	;NFlags
; Line 235
	push	WORD PTR [bp+12]	;TYPE
	mov	cl,5
	mov	si,WORD PTR [bp-276]	;Xpts
	shl	si,cl
	lea	cx,WORD PTR [bp-136][si]
	push	ss
	push	cx
	push	WORD PTR [bp-268]
	push	WORD PTR [bp-270]	;PNXT
	push	dx
	push	ax
	mov	di,cx
	call	_ZClip
	add	sp,14
; Line 236
	inc	WORD PTR [bp-8]	;Npts
	mov	ax,si
	mov	si,WORD PTR [bp-8]	;Npts
	shl	si,1
	shl	si,1
	mov	WORD PTR [bp-266][si],di
	mov	WORD PTR [bp-264][si],ss
	mov	cx,WORD PTR [bp-8]	;Npts
	inc	cx
	mov	WORD PTR [bp-8],cx	;Npts
	jmp	$L20002
; Line 239
; Line 240
	nop	
$I355:
	mov	ax,WORD PTR [bp-4]	;P
	mov	dx,WORD PTR [bp-2]
	mov	si,WORD PTR [bp-8]	;Npts
	shl	si,1
	shl	si,1
	mov	WORD PTR [bp-266][si],ax
	mov	WORD PTR [bp-264][si],dx
	inc	WORD PTR [bp-8]	;Npts
; Line 241
	mov	es,dx
	mov	bx,ax
	mov	ax,WORD PTR es:[bx+30]
	and	WORD PTR [bp-272],ax	;NFlags
; Line 242
$FC350:
	inc	WORD PTR [bp-138]	;i
	mov	ax,WORD PTR [bp-270]	;PNXT
	mov	dx,WORD PTR [bp-268]
	mov	WORD PTR [bp-4],ax	;P
	mov	WORD PTR [bp-2],dx
$F349:
	mov	ax,WORD PTR [bp+4]	;Num
	cmp	WORD PTR [bp-138],ax	;i
	jl	$JCC377
	jmp	$FB351
$JCC377:
; Line 219
; Line 220
	mov	si,WORD PTR [bp-138]	;i
	shl	si,1
	shl	si,1
	mov	bx,WORD PTR [bp+6]	;List
	mov	cx,WORD PTR [bx+4][si]
	mov	dx,WORD PTR [bx+6][si]
	mov	WORD PTR [bp-270],cx	;PNXT
	mov	WORD PTR [bp-268],dx
; Line 221
	mov	cx,WORD PTR [bp-138]	;i
	inc	cx
	cmp	cx,ax
	jl	$I352
	mov	ax,WORD PTR [bx]
	mov	dx,WORD PTR [bx+2]
	mov	WORD PTR [bp-270],ax	;PNXT
	mov	WORD PTR [bp-268],dx
; Line 223
$I352:
	les	bx,DWORD PTR [bp-4]	;P
	test	BYTE PTR es:[bx+30],16
	jne	$JCC437
	jmp	$I353
$JCC437:
; Line 224
; Line 225
	les	bx,DWORD PTR [bp-270]	;PNXT
	test	BYTE PTR es:[bx+30],16
	jne	$FC350
; Line 226
	push	WORD PTR [bp+12]	;TYPE
	mov	cl,5
	mov	si,WORD PTR [bp-276]	;Xpts
	shl	si,cl
	lea	ax,WORD PTR [bp-136][si]
	push	ss
	push	ax
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;P
	push	es
	push	WORD PTR [bp-270]	;PNXT
	mov	di,ax
	call	_ZClip
	add	sp,14
; Line 227
	mov	ax,si
	mov	si,WORD PTR [bp-8]	;Npts
	shl	si,1
	shl	si,1
	mov	WORD PTR [bp-266][si],di
	mov	WORD PTR [bp-264][si],ss
	inc	WORD PTR [bp-8]	;Npts
; Line 228
$L20002:
	mov	si,ax
	mov	ax,WORD PTR [bp-106][si]
	and	WORD PTR [bp-272],ax	;NFlags
	inc	WORD PTR [bp-276]	;Xpts
; Line 229
	jmp	$FC350
	nop	
$FB351:
; Line 243
	mov	ax,WORD PTR [bp-266]	;NList
	mov	dx,WORD PTR [bp-264]
	mov	si,WORD PTR [bp-8]	;Npts
	shl	si,1
	shl	si,1
	mov	WORD PTR [bp-266][si],ax
	mov	WORD PTR [bp-264][si],dx
	inc	WORD PTR [bp-8]	;Npts
; Line 245
	test	BYTE PTR [bp-272],63	;NFlags
	je	$JCC557
	jmp	$EX336
$JCC557:
; Line 247
	mov	WORD PTR [bp-138],0	;i
	mov	WORD PTR [bp-274],-1	;OFlags
	jmp	SHORT $F357
$FC358:
; Line 248
; Line 250
	mov	si,WORD PTR [bp-138]	;i
	shl	si,1
	shl	si,1
	les	bx,DWORD PTR [bp-266][si]
	mov	WORD PTR [bp-4],bx	;P
	mov	WORD PTR [bp-2],es
	test	BYTE PTR es:[bx+31],16
	jne	$I360
; Line 251
	push	es
	push	bx
	call	_Perspect3D
	add	sp,4
; Line 252
$I360:
	les	bx,DWORD PTR [bp-4]	;P
	mov	ax,WORD PTR es:[bx+30]
	and	WORD PTR [bp-274],ax	;OFlags
; Line 253
	inc	WORD PTR [bp-138]	;i
$F357:
	mov	ax,WORD PTR [bp-8]	;Npts
	dec	ax
	cmp	ax,WORD PTR [bp-138]	;i
	jg	$FC358
; Line 256
	test	BYTE PTR [bp-273],15
	jne	$EX336
; Line 259
	dec	WORD PTR [bp-8]	;Npts
; Line 260
	mov	WORD PTR [bp-138],0	;i
	mov	ax,WORD PTR [bp-266]	;NList
	mov	dx,WORD PTR [bp-264]
	mov	WORD PTR [bp-4],ax	;P
	mov	WORD PTR [bp-2],dx
	jmp	SHORT $F362
$FC363:
; Line 261
; Line 263
	push	WORD PTR [bp+12]	;TYPE
	mov	si,WORD PTR [bp-138]	;i
	shl	si,1
	shl	si,1
	mov	ax,WORD PTR [bp-262][si]
	mov	dx,WORD PTR [bp-260][si]
	mov	WORD PTR [bp-270],ax	;PNXT
	mov	WORD PTR [bp-268],dx
	add	ax,12
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-4]	;P
	mov	dx,WORD PTR [bp-2]
	add	ax,12
	push	dx
	push	ax
	call	_NPFLine
	add	sp,10
; Line 264
	mov	ax,WORD PTR [bp-270]	;PNXT
	mov	dx,WORD PTR [bp-268]
	mov	WORD PTR [bp-4],ax	;P
	mov	WORD PTR [bp-2],dx
; Line 265
	inc	WORD PTR [bp-138]	;i
$F362:
	mov	ax,WORD PTR [bp-8]	;Npts
	cmp	WORD PTR [bp-138],ax	;i
	jl	$FC363
; Line 266
	push	WORD PTR [bp+16]
	push	WORD PTR [bp+14]	;S
	push	WORD PTR [bp+12]	;TYPE
	push	WORD PTR [bp+10]
	push	WORD PTR [bp+8]	;D
	call	_NPFFill
	add	sp,10
; Line 268
$EX336:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Npoly3D	ENDP
; Line 271
	PUBLIC	_Nline3D
_Nline3D	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,34
	call	__aNchkstk
;	XTRAPT = -32
;	OFlags = -34
;	CLR = 16
;	D = 12
;	P2 = 8
;	P1 = 4
; Line 275
	les	bx,DWORD PTR [bp+8]	;P2
	mov	ax,WORD PTR es:[bx+30]
	les	bx,DWORD PTR [bp+4]	;P1
	and	ax,WORD PTR es:[bx+30]
	mov	WORD PTR [bp-34],ax	;OFlags
; Line 278
	test	al,63
	je	$JCC798
	jmp	$EX370
$JCC798:
; Line 279
	test	BYTE PTR [bp-34],16	;OFlags
	je	$JCC807
	jmp	$EX370
$JCC807:
; Line 288
	test	BYTE PTR es:[bx+30],16
	je	$I375
; Line 289
; Line 290
	sub	ax,ax
	push	ax
	lea	ax,WORD PTR [bp-32]	;XTRAPT
	push	ss
	push	ax
	push	es
	push	bx
	push	WORD PTR [bp+10]
	push	WORD PTR [bp+8]	;P2
	call	_ZClip
	add	sp,14
; Line 291
	lea	ax,WORD PTR [bp-32]	;XTRAPT
	mov	WORD PTR [bp+4],ax	;P1
	mov	WORD PTR [bp+6],ss
; Line 292
; Line 293
$I375:
	les	bx,DWORD PTR [bp+8]	;P2
	test	BYTE PTR es:[bx+30],16
	je	$I376
; Line 294
; Line 295
	sub	ax,ax
	push	ax
	lea	ax,WORD PTR [bp-32]	;XTRAPT
	push	ss
	push	ax
	push	es
	push	bx
	push	WORD PTR [bp+6]
	push	WORD PTR [bp+4]	;P1
	call	_ZClip
	add	sp,14
; Line 296
	lea	ax,WORD PTR [bp-32]	;XTRAPT
	mov	WORD PTR [bp+8],ax	;P2
	mov	WORD PTR [bp+10],ss
; Line 297
; Line 300
$I376:
	les	bx,DWORD PTR [bp+8]	;P2
	mov	al,BYTE PTR es:[bx+30]
	les	bx,DWORD PTR [bp+4]	;P1
	and	al,BYTE PTR es:[bx+30]
	test	al,63
	jne	$EX370
; Line 303
	test	BYTE PTR es:[bx+31],16
	jne	$I378
; Line 304
	push	es
	push	bx
	call	_Perspect3D
	add	sp,4
; Line 305
$I378:
	les	bx,DWORD PTR [bp+8]	;P2
	test	BYTE PTR es:[bx+31],16
	jne	$I379
; Line 306
	push	es
	push	bx
	call	_Perspect3D
	add	sp,4
; Line 308
$I379:
	les	bx,DWORD PTR [bp+8]	;P2
	mov	al,BYTE PTR es:[bx+31]
	les	bx,DWORD PTR [bp+4]	;P1
	and	al,BYTE PTR es:[bx+31]
	test	al,15
	jne	$EX370
; Line 311
	push	WORD PTR [bp+16]	;CLR
	push	WORD PTR [bp+14]
	push	WORD PTR [bp+12]	;D
	mov	ax,WORD PTR [bp+8]	;P2
	mov	dx,WORD PTR [bp+10]
	add	ax,12
	push	dx
	push	ax
	mov	ax,bx
	mov	dx,es
	add	ax,12
	push	dx
	push	ax
	call	_NDLine
; Line 313
$EX370:
	mov	sp,bp
	pop	bp
	ret	

_Nline3D	ENDP
; Line 315
	PUBLIC	_NDot3D
_NDot3D	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	CLR = 12
;	D = 8
;	P1 = 4
; Line 318
	les	bx,DWORD PTR [bp+4]	;P1
	test	BYTE PTR es:[bx+30],63
	jne	$EX386
; Line 320
	test	BYTE PTR es:[bx+31],16
	jne	$I388
; Line 321
	push	es
	push	bx
	call	_Perspect3D
	mov	sp,bp
; Line 323
$I388:
	les	bx,DWORD PTR [bp+4]	;P1
	test	BYTE PTR es:[bx+31],15
	jne	$EX386
; Line 326
	push	WORD PTR [bp+12]	;CLR
	push	WORD PTR [bp+10]
	push	WORD PTR [bp+8]	;D
	mov	ax,bx
	mov	dx,es
	add	ax,12
	push	dx
	push	ax
	call	_NDDot
; Line 328
$EX386:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_NDot3D	ENDP
_TEXT	ENDS
END
