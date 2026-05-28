;	Static Name Aliases
;
	TITLE   C:\N3D.C
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
PUBLIC  _IdentInvMat
PUBLIC  _Scale3d
PUBLIC  _POINTBUF
PUBLIC  _LEV
EXTRN	_Mult3X3:NEAR
EXTRN	_Trans3X3:NEAR
EXTRN	_CheckPointRot:NEAR
EXTRN	_Rotate:NEAR
EXTRN	_labs:NEAR
EXTRN	_MakematHPR:NEAR
EXTRN	_NDot3D:NEAR
EXTRN	_Mult1X3:NEAR
EXTRN	_Nline3D:NEAR
EXTRN	_LoadEmsFile:NEAR
EXTRN	_MakeBspDrawList:NEAR
EXTRN	_ReadEMSPCXSize:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_MapEmsFile:NEAR
EXTRN	_DotProduct:NEAR
EXTRN	_Npoly3D:NEAR
EXTRN	_NOTEXTURE:WORD
EXTRN	_Nviewmat:BYTE
EXTRN	_PalPtr3D:WORD
_BSS      SEGMENT
COMM NEAR	_D:	BYTE:	 14
COMM FAR	_POINTS:	 32:	 380
COMM NEAR	_OBJ:	BYTE:	 2
COMM NEAR	_BSPBASE:	BYTE:	 4
COMM NEAR	_FBPTR:	BYTE:	 2
COMM NEAR	_DRAWPTR:	BYTE:	 2
COMM FAR	_objhndls:	 4:	 256
COMM NEAR	_NPDEST:	BYTE:	 4
COMM NEAR	_OB:	 24:	 3
_BSS      ENDS
_DATA      SEGMENT
_IdentInvMat	DW	07fffH
	DW	00H
	DW	00H
	DW	00H
	DW	07fffH
	DW	00H
	DW	00H
	DW	00H
	DW	07fffH
	DW	07fffH
	DW	00H
	DW	00H
	DW	00H
	DW	07fffH
	DW	00H
	DW	00H
	DW	00H
	DW	07fffH
_Scale3d	DW	01H
_POINTBUF	DD	_POINTS
_LEV	DW	00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 2
; Line 3
; Line 4
; Line 189
_TEXT      ENDS
CONST      SEGMENT
$T20001	DW SEG _objhndls 
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_MapEMSObject
_MapEMSObject	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	S = -4
;	Num = 4
; Line 192
	cmp	WORD PTR [bp+4],0	;Num
	jge	$I354
$L20046:
	sub	ax,ax
	cwd	
	mov	sp,bp
	pop	bp
	ret	
; Line 194
$I354:
	mov	es,WORD PTR $T20001
	mov	bx,WORD PTR [bp+4]	;Num
	shl	bx,1
	shl	bx,1
	cmp	WORD PTR es:_objhndls[bx],0
	je	$L20046
; Line 195
	sub	ax,ax
	push	ax
	mov	bx,WORD PTR [bp+4]	;Num
	shl	bx,1
	shl	bx,1
	push	WORD PTR es:_objhndls[bx]
	call	_MapEmsFile
	add	sp,4
	mov	WORD PTR [bp-2],ax
	or	ax,ax
	je	$L20046
; Line 196
	mov	WORD PTR [bp-4],0	;S
; Line 197
	mov	ax,WORD PTR [bp-4]	;S
	mov	dx,WORD PTR [bp-2]
; Line 198
	mov	sp,bp
	pop	bp
	ret	

_MapEMSObject	ENDP
; Line 201
	PUBLIC	_MapEMSObjectTexture
_MapEMSObjectTexture	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	S = -4
;	Num = 4
; Line 204
	mov	es,WORD PTR $T20001
	mov	bx,WORD PTR [bp+4]	;Num
	shl	bx,1
	shl	bx,1
	cmp	WORD PTR es:_objhndls[bx+2],0
	jne	$I362
$L20047:
	sub	ax,ax
	cwd	
	mov	sp,bp
	pop	bp
	ret	
; Line 205
	nop	
$I362:
	mov	ax,1
	push	ax
	mov	bx,WORD PTR [bp+4]	;Num
	shl	bx,1
	shl	bx,1
	push	WORD PTR es:_objhndls[bx+2]
	call	_MapEmsFile
	add	sp,4
	mov	WORD PTR [bp-2],ax
	or	ax,ax
	je	$L20047
; Line 206
	mov	WORD PTR [bp-4],0	;S
; Line 207
	mov	ax,WORD PTR [bp-4]	;S
	mov	dx,WORD PTR [bp-2]
; Line 208
	mov	sp,bp
	pop	bp
	ret	

_MapEMSObjectTexture	ENDP
; Line 245
	PUBLIC	_SetMatsPtrsOrder
_SetMatsPtrsOrder	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,320
	call	__aNchkstk
	push	di
	push	si
;	PT = -16
;	i = -284
;	j = -288
;	matnum = -10
;	srfnum = -296
;	ptsnum = -282
;	P = -4
;	P1 = -8
;	PM = -320
;	SRF = -294
;	fblist = -274
;	root = -18
;	HD = -298
;	PCH = -290
;	RLL = -286
;	VAL = -12
;	M = -316
;	V = -280
;	VMAT = 4
; Line 264
	mov	bx,WORD PTR _OBJ
	les	si,DWORD PTR [bx]
	mov	ax,WORD PTR es:[si+16]
	mov	WORD PTR [bp-10],ax	;matnum
; Line 265
	lea	si,WORD PTR [si+16]
	mov	ax,WORD PTR es:[si+2]
	mov	WORD PTR [bp-282],ax	;ptsnum
; Line 266
	inc	si
	inc	si
	mov	ax,WORD PTR es:[si+2]
	mov	WORD PTR [bp-296],ax	;srfnum
	lea	ax,WORD PTR [si+2]
	mov	dx,es
	inc	ax
	inc	ax
	mov	WORD PTR [bp-4],ax	;P
	mov	WORD PTR [bp-2],dx
; Line 269
	mov	si,WORD PTR [bx+86]
	mov	ax,WORD PTR [si]
	neg	ax
	mov	WORD PTR [bx+344],ax
; Line 270
	mov	bx,WORD PTR _OBJ
	mov	si,WORD PTR [bx+86]
	mov	ax,WORD PTR [si+2]
	neg	ax
	mov	WORD PTR [bx+346],ax
; Line 271
	mov	bx,WORD PTR _OBJ
	mov	si,WORD PTR [bx+86]
	mov	ax,WORD PTR [si+4]
	neg	ax
	mov	WORD PTR [bx+348],ax
; Line 273
	cmp	WORD PTR [bp-10],0	;matnum
	jne	$JCC269
	jmp	$I385
$JCC269:
; Line 274
; Line 275
	mov	ax,WORD PTR _OBJ
	add	ax,374
	mov	bx,WORD PTR _OBJ
	mov	WORD PTR [bx+82],ax
; Line 276
	mov	ax,WORD PTR _OBJ
	add	ax,374
	push	ax
	push	WORD PTR [bp+4]	;VMAT
	mov	bx,WORD PTR _OBJ
	mov	bx,WORD PTR [bx+20]
	push	WORD PTR [bx+8]
	call	_Mult3X3
	add	sp,6
; Line 277
	mov	ax,WORD PTR _OBJ
	add	ax,392
	push	ax
	mov	bx,WORD PTR _OBJ
	mov	bx,WORD PTR [bx+20]
	push	WORD PTR [bx+8]
	call	_Trans3X3
	add	sp,4
; Line 278
	mov	ax,WORD PTR _OBJ
	add	ax,392
	push	ax
	mov	ax,WORD PTR _OBJ
	add	ax,344
	push	ax
	call	_Rotate
	add	sp,4
; Line 280
	mov	ax,WORD PTR [bp-4]	;P
	mov	dx,WORD PTR [bp-2]
	mov	WORD PTR [bp-320],ax	;PM
	mov	WORD PTR [bp-318],dx
; Line 282
	mov	WORD PTR [bp-284],1	;i
	jmp	$F389
	nop	
$FC390:
; Line 283
; Line 285
	sub	ax,ax
	mov	WORD PTR [bp-286],ax	;RLL
	mov	WORD PTR [bp-290],ax	;PCH
	mov	WORD PTR [bp-298],ax	;HD
; Line 286
	les	bx,DWORD PTR [bp-320]	;PM
	mov	al,BYTE PTR es:[bx+1]
	cbw	
	mov	bx,ax
	shl	bx,1
	mov	si,WORD PTR _OBJ
	mov	si,WORD PTR [si+84]
	mov	ax,WORD PTR [bx][si]
	mov	WORD PTR [bp-12],ax	;VAL
; Line 287
	mov	bx,WORD PTR [bp-320]	;PM
	cmp	BYTE PTR es:[bx],0
	jne	$I392
	mov	WORD PTR [bp-298],ax	;HD
; Line 288
$I392:
	cmp	BYTE PTR es:[bx],1
	jne	$I393
	mov	WORD PTR [bp-290],ax	;PCH
; Line 289
$I393:
	cmp	BYTE PTR es:[bx],2
	jne	$I394
	mov	WORD PTR [bp-286],ax	;RLL
; Line 290
$I394:
	lea	ax,WORD PTR [bp-316]	;M
	push	ax
	push	WORD PTR [bp-286]	;RLL
	push	WORD PTR [bp-290]	;PCH
	push	WORD PTR [bp-298]	;HD
	call	_MakematHPR
	add	sp,8
; Line 291
	mov	ax,36
	imul	WORD PTR [bp-284]	;i
	mov	cx,ax
	add	ax,WORD PTR _OBJ
	add	ax,392
	push	ax
	lea	ax,WORD PTR [bp-316]	;M
	push	ax
	mov	si,cx
	call	_Trans3X3
	add	sp,4
; Line 296
	mov	ax,si
	add	si,WORD PTR _OBJ
	add	si,374
	push	si
	mov	cx,WORD PTR _OBJ
	add	cx,374
	push	cx
	lea	cx,WORD PTR [bp-316]	;M
	push	cx
	mov	si,ax
	call	_Mult3X3
	add	sp,6
; Line 298
	les	bx,DWORD PTR [bp-320]	;PM
	mov	ax,WORD PTR es:[bx+2]
	mov	WORD PTR [bp-280],ax	;V
; Line 299
	mov	ax,WORD PTR es:[bx+4]
	mov	WORD PTR [bp-278],ax
; Line 300
	mov	ax,WORD PTR es:[bx+6]
	mov	WORD PTR [bp-276],ax
; Line 302
	mov	ax,WORD PTR [bp-284]	;i
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	shl	ax,1
	mov	cx,ax
	add	ax,WORD PTR _OBJ
	add	ax,22
	push	ax
	mov	ax,WORD PTR _OBJ
	add	ax,374
	push	ax
	lea	ax,WORD PTR [bp-280]	;V
	push	ax
	mov	di,cx
	call	_Mult1X3
	add	sp,6
; Line 303
	mov	bx,WORD PTR _OBJ
	mov	ax,WORD PTR [bx+22]
	mov	dx,WORD PTR [bx+24]
	add	WORD PTR [bx+22][di],ax
	adc	WORD PTR [bx+24][di],dx
; Line 304
	mov	bx,WORD PTR _OBJ
	mov	ax,WORD PTR [bx+26]
	mov	dx,WORD PTR [bx+28]
	add	WORD PTR [bx+26][di],ax
	adc	WORD PTR [bx+28][di],dx
; Line 305
	mov	bx,WORD PTR _OBJ
	mov	ax,WORD PTR [bx+30]
	mov	dx,WORD PTR [bx+32]
	add	WORD PTR [bx+30][di],ax
	adc	WORD PTR [bx+32][di],dx
; Line 307
	mov	bx,WORD PTR _OBJ
	mov	ax,WORD PTR [bx+344]
	les	di,DWORD PTR [bp-320]	;PM
	sub	ax,WORD PTR es:[di+2]
	mov	di,WORD PTR [bp-284]	;i
	mov	cx,di
	shl	di,1
	add	di,cx
	shl	di,1
	mov	WORD PTR [bx+344][di],ax
; Line 308
	mov	bx,WORD PTR _OBJ
	mov	ax,WORD PTR [bx+346]
	les	bx,DWORD PTR [bp-320]	;PM
	sub	ax,WORD PTR es:[bx+4]
	mov	bx,WORD PTR _OBJ
	mov	WORD PTR [bx+346][di],ax
; Line 309
	mov	bx,WORD PTR _OBJ
	mov	ax,WORD PTR [bx+348]
	les	bx,DWORD PTR [bp-320]	;PM
	sub	ax,WORD PTR es:[bx+6]
	mov	bx,WORD PTR _OBJ
	mov	WORD PTR [bx+348][di],ax
; Line 310
	add	si,WORD PTR _OBJ
	add	si,392
	push	si
	add	di,WORD PTR _OBJ
	add	di,344
	push	di
	call	_Rotate
	add	sp,4
; Line 311
	add	WORD PTR [bp-320],8	;PM
; Line 312
	inc	WORD PTR [bp-284]	;i
$F389:
	mov	ax,WORD PTR [bp-284]	;i
	cmp	WORD PTR [bp-10],ax	;matnum
	jle	$JCC779
	jmp	$FC390
$JCC779:
; Line 313
	mov	ax,WORD PTR [bp-320]	;PM
	mov	dx,WORD PTR [bp-318]
	mov	WORD PTR [bp-4],ax	;P
	mov	WORD PTR [bp-2],dx
; Line 314
; Line 315
	jmp	SHORT $I397
$I385:
; Line 316
; Line 317
	mov	bx,WORD PTR _OBJ
	mov	WORD PTR [bx+82],OFFSET _Nviewmat
; Line 319
$I397:
; Line 321
	mov	ax,WORD PTR [bp-4]	;P
	mov	dx,WORD PTR [bp-2]
	mov	WORD PTR [bp-294],ax	;SRF
	mov	WORD PTR [bp-292],dx
; Line 322
	mov	WORD PTR [bp-284],0	;i
	jmp	$F398
$I401:
; Line 341
; Line 348
	les	bx,DWORD PTR [bp-294]	;SRF
	push	WORD PTR es:[bx+4]
	push	WORD PTR es:[bx+2]
	push	WORD PTR es:[bx]
	mov	si,WORD PTR es:[bx+10]
	and	si,32767
	mov	ax,si
	shl	si,1
	add	si,ax
	shl	si,1
	add	si,WORD PTR _OBJ
	push	WORD PTR [si+348]
	push	WORD PTR [si+346]
	push	WORD PTR [si+344]
	call	_DotProduct
	add	sp,12
	les	bx,DWORD PTR [bp-294]	;SRF
	mov	cx,WORD PTR es:[bx+6]
	mov	si,WORD PTR es:[bx+8]
	neg	cx
	adc	si,0
	neg	si
	cmp	si,dx
	jg	$I405
	jl	$L20041
	cmp	cx,ax
$L20052:
	ja	$I405
$L20041:
; Line 349
; Line 350
	mov	si,WORD PTR [bp-284]	;i
	mov	BYTE PTR [bp-274][si],1
; Line 351
; Line 352
	jmp	SHORT $I406
	nop	
$I405:
; Line 353
; Line 354
	mov	si,WORD PTR [bp-284]	;i
	mov	BYTE PTR [bp-274][si],0
; Line 355
$I406:
; Line 356
; Line 358
	les	bx,DWORD PTR [bp-294]	;SRF
	test	BYTE PTR es:[bx+11],128
	je	$I407
; Line 359
	mov	si,WORD PTR [bp-284]	;i
	or	BYTE PTR [bp-274][si],128
; Line 360
$I407:
	add	WORD PTR [bp-294],12	;SRF
; Line 361
	inc	WORD PTR [bp-284]	;i
$F398:
	mov	ax,WORD PTR [bp-284]	;i
	cmp	WORD PTR [bp-296],ax	;srfnum
	jle	$FB400
; Line 323
; Line 324
	cmp	WORD PTR _Scale3d,1
	jne	$JCC979
	jmp	$I401
$JCC979:
; Line 325
; Line 331
	les	bx,DWORD PTR [bp-294]	;SRF
	push	WORD PTR es:[bx+4]
	push	WORD PTR es:[bx+2]
	push	WORD PTR es:[bx]
	mov	si,WORD PTR es:[bx+10]
	and	si,32767
	mov	cx,si
	shl	si,1
	add	si,cx
	shl	si,1
	add	si,WORD PTR _OBJ
	push	WORD PTR [si+348]
	push	WORD PTR [si+346]
	push	WORD PTR [si+344]
	call	_DotProduct
	add	sp,12
	les	bx,DWORD PTR [bp-294]	;SRF
	mov	si,WORD PTR es:[bx+6]
	mov	di,WORD PTR es:[bx+8]
	mov	cl,BYTE PTR _Scale3d
	or	cl,cl
	je	$L20030
$L20029:
	sar	di,1
	rcr	si,1
	dec	cl
	jne	$L20029
$L20030:
	neg	si
	adc	di,0
	neg	di
	cmp	di,dx
	jle	$JCC1074
	jmp	$I405
$JCC1074:
	jge	$JCC1079
	jmp	$L20041
$JCC1079:
	cmp	si,ax
	jmp	$L20052
	nop	
$FB400:
; Line 363
	les	bx,DWORD PTR [bp-294]	;SRF
	mov	al,BYTE PTR es:[bx]
	mov	BYTE PTR [bp-18],al	;root
; Line 364
	lea	ax,WORD PTR [bx+2]
	mov	WORD PTR _BSPBASE,ax
	mov	WORD PTR _BSPBASE+2,es
; Line 365
	lea	cx,WORD PTR [bp-274]	;fblist
	mov	WORD PTR _FBPTR,cx
; Line 366
	mov	cx,WORD PTR _OBJ
	add	cx,88
	mov	WORD PTR _DRAWPTR,cx
; Line 367
	mov	cl,BYTE PTR [bp-18]	;root
	sub	ch,ch
	push	cx
	mov	si,ax
	mov	di,es
	call	_MakeBspDrawList
	add	sp,2
; Line 371
	mov	ax,WORD PTR [bp-296]	;srfnum
	shl	ax,1
	add	si,ax
	mov	WORD PTR [bp-4],si	;P
	mov	WORD PTR [bp-2],di
	mov	bx,WORD PTR _OBJ
	mov	WORD PTR [bx+8],si
	mov	WORD PTR [bx+10],di
; Line 372
	mov	ax,WORD PTR _POINTBUF
	mov	dx,WORD PTR _POINTBUF+2
	mov	bx,WORD PTR _OBJ
	mov	WORD PTR [bx+12],ax
	mov	WORD PTR [bx+14],dx
; Line 375
	mov	WORD PTR [bp-284],0	;i
	mov	ax,WORD PTR _POINTBUF
	mov	dx,WORD PTR _POINTBUF+2
	mov	WORD PTR [bp-16],ax	;PT
	mov	WORD PTR [bp-14],dx
	jmp	SHORT $F409
	nop	
$FC410:
; Line 376
	les	bx,DWORD PTR [bp-16]	;PT
	mov	WORD PTR es:[bx+30],0
	inc	WORD PTR [bp-284]	;i
	add	WORD PTR [bp-16],32	;PT
$F409:
	mov	ax,WORD PTR [bp-284]	;i
	cmp	WORD PTR [bp-282],ax	;ptsnum
	jg	$FC410
; Line 378
	mov	cl,5
	mov	ax,WORD PTR [bp-282]	;ptsnum
	shl	ax,cl
	add	WORD PTR _POINTBUF,ax
; Line 382
	mov	cl,3
	mov	ax,WORD PTR [bp-282]	;ptsnum
	shl	ax,cl
	add	ax,WORD PTR [bp-4]	;P
	mov	dx,WORD PTR [bp-2]
	mov	WORD PTR [bp-8],ax	;P1
	mov	WORD PTR [bp-6],dx
; Line 384
	mov	bx,WORD PTR _OBJ
	mov	WORD PTR [bx+4],ax
	mov	WORD PTR [bx+6],dx
; Line 386
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_SetMatsPtrsOrder	ENDP
; Line 389
	PUBLIC	_Reject
_Reject	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	si
;	ZVAL = -8
;	v = -4
;	VM = 4
; Line 393
	mov	ax,WORD PTR _OBJ
	add	ax,22
	push	ax
	push	WORD PTR [bp+4]	;VM
	mov	bx,WORD PTR _OBJ
	push	WORD PTR [bx+86]
	call	_Mult1X3
	add	sp,6
; Line 396
	mov	bx,WORD PTR _OBJ
	mov	si,WORD PTR [bx+20]
	mov	ax,WORD PTR [si+12]
	mov	dx,WORD PTR [si+14]
	add	WORD PTR [bx+22],ax
	adc	WORD PTR [bx+24],dx
; Line 397
	mov	bx,WORD PTR _OBJ
	mov	si,WORD PTR [bx+20]
	mov	ax,WORD PTR [si+16]
	mov	dx,WORD PTR [si+18]
	add	WORD PTR [bx+26],ax
	adc	WORD PTR [bx+28],dx
; Line 398
	mov	bx,WORD PTR _OBJ
	mov	si,WORD PTR [bx+20]
	mov	ax,WORD PTR [si+20]
	mov	dx,WORD PTR [si+22]
	add	WORD PTR [bx+30],ax
	adc	WORD PTR [bx+32],dx
; Line 400
	mov	bx,WORD PTR _OBJ
	les	si,DWORD PTR [bx]
	mov	ax,WORD PTR es:[si]
	sub	dx,dx
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
	shl	ax,1
	rcl	dx,1
; Line 401
	add	ax,WORD PTR [bx+30]
	adc	dx,WORD PTR [bx+32]
	mov	WORD PTR [bp-8],ax	;ZVAL
	mov	WORD PTR [bp-6],dx
; Line 405
	or	dx,dx
	jge	$I417
$L20053:
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 406
	nop	
$I417:
	push	WORD PTR [bx+24]
	push	WORD PTR [bx+22]
	call	_labs
	add	sp,4
	cmp	dx,WORD PTR [bp-6]
	jl	$I418
	jg	$L20053
	cmp	ax,WORD PTR [bp-8]	;ZVAL
	ja	$L20053
; Line 407
$I418:
	mov	bx,WORD PTR _OBJ
	push	WORD PTR [bx+28]
	push	WORD PTR [bx+26]
	call	_labs
	add	sp,4
	cmp	dx,WORD PTR [bp-6]
	jl	$I419
	jg	$L20053
	cmp	ax,WORD PTR [bp-8]	;ZVAL
	ja	$L20053
; Line 408
$I419:
	sub	ax,ax
; Line 409
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Reject	ENDP
; Line 457
	PUBLIC	_DrawASurf
_DrawASurf	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,188
	call	__aNchkstk
	push	di
	push	si
;	PT = -30
;	PT2 = -40
;	List = -176
;	L = -48
;	OLDOBJ = -44
;	OBJDEFPTR = -4
;	PDEF = -180
;	TOFFS = -24
;	VL = -18
;	V = -36
;	i = -42
;	NUM = -2
;	CLR = -6
;	anm = -46
;	val = -26
;	P = 4
; Line 475
	jmp	$L20063
$FC440:
; Line 476
; Line 477
	test	BYTE PTR es:[bx],128
	jne	$JCC1524
	jmp	$I443
$JCC1524:
; Line 478
; Line 479
	mov	al,BYTE PTR es:[bx]
	and	ax,127
	mov	WORD PTR [bp-46],ax	;anm
; Line 480
	inc	WORD PTR [bp+4]	;P
	mov	bx,WORD PTR [bp+4]	;P
	mov	al,BYTE PTR es:[bx]
	sub	ah,ah
	mov	WORD PTR [bp-26],ax	;val
	lea	ax,WORD PTR [bx+1]
	mov	WORD PTR [bp+4],ax	;P
; Line 481
	mov	bx,WORD PTR _OBJ
	mov	bx,WORD PTR [bx+84]
	mov	si,WORD PTR [bp-46]	;anm
	shl	si,1
	mov	al,BYTE PTR [bx][si]
	sub	ah,ah
	cmp	ax,WORD PTR [bp-26]	;val
	je	$I443
; Line 482
; Line 483
	mov	bx,WORD PTR [bp+4]	;P
	inc	WORD PTR [bp+4]	;P
	mov	al,BYTE PTR es:[bx]
	cbw	
	jmp	SHORT $S444
; Line 484
; Line 488
	nop	
$SC449:
; Line 489
	add	WORD PTR [bp+4],3	;P
; Line 490
	jmp	$L20063
; Line 491
	nop	
$SC448:
; Line 486
	add	WORD PTR [bp+4],2	;P
; Line 487
	jmp	$L20063
; Line 494
	nop	
$SC451:
; Line 495
	les	bx,DWORD PTR [bp+4]	;P
	mov	al,BYTE PTR es:[bx]
	cbw	
$L20055:
	inc	ax
	inc	ax
$L20056:
	add	WORD PTR [bp+4],ax	;P
; Line 496
	jmp	$L20063
; Line 497
	nop	
$SC452:
; Line 498
	les	bx,DWORD PTR [bp+4]	;P
	mov	al,BYTE PTR es:[bx]
	cbw	
	shl	ax,1
	inc	ax
	jmp	SHORT $L20056
; Line 500
$SC453:
; Line 501
	les	bx,DWORD PTR [bp+4]	;P
	mov	al,BYTE PTR es:[bx]
	cbw	
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	jmp	SHORT $L20055
	nop	
$S444:
	cmp	ax,5
	jbe	$JCC1655
	jmp	$EX423
$JCC1655:
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20044[bx]
$L20044:
		DW	$SC448
		DW	$SC449
		DW	$SC448
		DW	$SC451
		DW	$SC452
		DW	$SC453
; Line 507
; Line 508
$I443:
; Line 509
	mov	bx,WORD PTR [bp+4]	;P
	inc	WORD PTR [bp+4]	;P
	mov	al,BYTE PTR es:[bx]
	and	ax,127
	jmp	$S455
; Line 510
; Line 511
	nop	
$SC459:
; Line 512
	les	bx,DWORD PTR [bp+4]	;P
	inc	WORD PTR [bp+4]	;P
	mov	al,BYTE PTR es:[bx]
	cbw	
	push	ax
	call	_CheckPointRot
	add	sp,2
	mov	WORD PTR [bp-30],ax	;PT
	mov	WORD PTR [bp-28],dx
; Line 513
	les	bx,DWORD PTR [bp+4]	;P
	inc	WORD PTR [bp+4]	;P
	mov	bl,BYTE PTR es:[bx]
	sub	bh,bh
	shl	bx,1
	mov	si,WORD PTR _PalPtr3D
	mov	ax,WORD PTR [bx][si]
	mov	WORD PTR [bp-6],ax	;CLR
; Line 514
	push	ax
	push	WORD PTR _NPDEST+2
	push	WORD PTR _NPDEST
	push	dx
	push	WORD PTR [bp-30]	;PT
	call	_NDot3D
	add	sp,10
; Line 515
	jmp	$L20063
; Line 516
	nop	
$SC461:
; Line 517
	les	bx,DWORD PTR [bp+4]	;P
	inc	WORD PTR [bp+4]	;P
	mov	al,BYTE PTR es:[bx]
	cbw	
	push	ax
	call	_CheckPointRot
	add	sp,2
	mov	WORD PTR [bp-30],ax	;PT
	mov	WORD PTR [bp-28],dx
; Line 518
	les	bx,DWORD PTR [bp+4]	;P
	inc	WORD PTR [bp+4]	;P
	mov	al,BYTE PTR es:[bx]
	cbw	
	push	ax
	call	_CheckPointRot
	add	sp,2
	mov	WORD PTR [bp-40],ax	;PT2
	mov	WORD PTR [bp-38],dx
; Line 519
	les	bx,DWORD PTR [bp+4]	;P
	inc	WORD PTR [bp+4]	;P
	mov	bl,BYTE PTR es:[bx]
	sub	bh,bh
	shl	bx,1
	mov	si,WORD PTR _PalPtr3D
	mov	ax,WORD PTR [bx][si]
	mov	WORD PTR [bp-6],ax	;CLR
; Line 520
	push	ax
	push	WORD PTR _NPDEST+2
	push	WORD PTR _NPDEST
	push	dx
	push	WORD PTR [bp-40]	;PT2
	push	WORD PTR [bp-28]
	push	WORD PTR [bp-30]	;PT
	call	_Nline3D
	jmp	$L20062
; Line 522
	nop	
$SC463:
; Line 523
	cmp	WORD PTR _LEV,0
	jle	$JCC1863
	jmp	$EX423
$JCC1863:
; Line 524
	mov	ax,WORD PTR _OBJ
	mov	WORD PTR [bp-44],ax	;OLDOBJ
; Line 526
	inc	WORD PTR _LEV
; Line 529
	mov	bx,ax
	les	si,DWORD PTR [bp+4]	;P
	inc	WORD PTR [bp+4]	;P
	mov	cx,ax
	mov	al,24
	imul	BYTE PTR es:[si]
	add	ax,WORD PTR [bx+20]
	mov	WORD PTR [bp-4],ax	;OBJDEFPTR
; Line 531
	mov	cl,3
	mov	si,WORD PTR [bp+4]	;P
	inc	WORD PTR [bp+4]	;P
	mov	al,BYTE PTR es:[si]
	sub	ah,ah
	shl	ax,cl
	add	ax,WORD PTR [bx+8]
	mov	dx,WORD PTR [bx+10]
	mov	WORD PTR [bp-180],ax	;PDEF
	mov	WORD PTR [bp-178],dx
; Line 533
	mov	si,WORD PTR [bp-4]	;OBJDEFPTR
	mov	ax,WORD PTR [si+2]
	les	di,DWORD PTR [bp-180]	;PDEF
	add	ax,WORD PTR es:[di]
	mov	WORD PTR [bp-36],ax	;V
; Line 534
	mov	cx,WORD PTR es:[di+2]
	add	cx,WORD PTR [si+4]
	mov	WORD PTR [bp-34],cx
; Line 535
	mov	cx,WORD PTR es:[di+4]
	add	cx,WORD PTR [si+6]
	mov	WORD PTR [bp-32],cx
; Line 537
	mov	si,WORD PTR es:[di+6]
	mov	cx,si
	shl	si,1
	add	si,cx
	shl	si,1
	sub	ax,WORD PTR [bx+344][si]
	mov	WORD PTR [bp-24],ax	;TOFFS
; Line 538
	mov	ax,WORD PTR [bp-34]
	mov	si,WORD PTR es:[di+6]
	mov	cx,si
	shl	si,1
	add	si,cx
	shl	si,1
	sub	ax,WORD PTR [bx+346][si]
	mov	WORD PTR [bp-22],ax
; Line 539
	mov	ax,WORD PTR [bp-32]
	mov	si,WORD PTR es:[di+6]
	mov	cx,si
	shl	si,1
	add	si,cx
	shl	si,1
	sub	ax,WORD PTR [bx+348][si]
	mov	WORD PTR [bp-20],ax
; Line 542
	lea	ax,WORD PTR [bp-18]	;VL
	push	ax
	mov	ax,36
	imul	WORD PTR es:[di+6]
	add	ax,WORD PTR [bx+82]
	push	ax
	lea	ax,WORD PTR [bp-24]	;TOFFS
	push	ax
	call	_Mult1X3
	add	sp,6
; Line 544
	mov	ax,WORD PTR [bp-4]	;OBJDEFPTR
	add	ax,12
	push	ax
	mov	cx,ax
	mov	ax,36
	les	bx,DWORD PTR [bp-180]	;PDEF
	imul	WORD PTR es:[bx+6]
	mov	si,WORD PTR _OBJ
	add	ax,WORD PTR [si+82]
	push	ax
	lea	ax,WORD PTR [bp-36]	;V
	push	ax
	mov	si,cx
	call	_Mult1X3
	add	sp,6
; Line 546
	mov	bx,WORD PTR _OBJ
	mov	ax,WORD PTR [bx+22]
	mov	dx,WORD PTR [bx+24]
	add	WORD PTR [si],ax
	adc	WORD PTR [si+2],dx
; Line 547
	mov	bx,WORD PTR _OBJ
	mov	ax,WORD PTR [bx+26]
	mov	dx,WORD PTR [bx+28]
	mov	bx,WORD PTR [bp-4]	;OBJDEFPTR
	add	WORD PTR [bx+16],ax
	adc	WORD PTR [bx+18],dx
; Line 548
	mov	di,WORD PTR _OBJ
	mov	ax,WORD PTR [di+30]
	mov	dx,WORD PTR [di+32]
	add	WORD PTR [bx+20],ax
	adc	WORD PTR [bx+22],dx
; Line 550
	mov	ax,WORD PTR [bp-18]	;VL
	mov	dx,WORD PTR [bp-16]
	sub	WORD PTR [si],ax
	sbb	WORD PTR [si+2],dx
; Line 551
	mov	ax,WORD PTR [bp-14]
	mov	dx,WORD PTR [bp-12]
	sub	WORD PTR [bx+16],ax
	sbb	WORD PTR [bx+18],dx
; Line 552
	mov	ax,WORD PTR [bp-10]
	mov	dx,WORD PTR [bp-8]
	sub	WORD PTR [bx+20],ax
	sbb	WORD PTR [bx+22],dx
; Line 555
	lea	ax,WORD PTR [bp-24]	;TOFFS
	push	ax
	mov	ax,36
	les	si,DWORD PTR [bp-180]	;PDEF
	imul	WORD PTR es:[si+6]
	mov	si,WORD PTR _OBJ
	add	ax,WORD PTR [si+82]
	push	ax
	push	bx
	call	_DrawN3dObject
	add	sp,6
; Line 560
	mov	bx,WORD PTR [bp-44]	;OLDOBJ
	mov	WORD PTR _OBJ,bx
	mov	bx,WORD PTR [bx+20]
	push	WORD PTR [bx]
	call	_MapEMSObject
	add	sp,2
	or	dx,ax
	jne	$JCC2227
	jmp	$EX423
$JCC2227:
; Line 561
	mov	bx,WORD PTR _OBJ
	mov	bx,WORD PTR [bx+20]
	push	WORD PTR [bx]
	call	_MapEMSObjectTexture
	add	sp,2
; Line 562
	dec	WORD PTR _LEV
; Line 564
	jmp	$L20063
; Line 565
$SC466:
; Line 566
	les	bx,DWORD PTR [bp+4]	;P
	inc	WORD PTR [bp+4]	;P
	mov	al,BYTE PTR es:[bx]
	cbw	
	mov	WORD PTR [bp-2],ax	;NUM
; Line 567
	mov	WORD PTR [bp-42],0	;i
	lea	ax,WORD PTR [bp-176]	;List
	mov	WORD PTR [bp-48],ax	;L
	jmp	SHORT $F467
	nop	
$FC468:
; Line 568
	les	bx,DWORD PTR [bp+4]	;P
	inc	WORD PTR [bp+4]	;P
	mov	al,BYTE PTR es:[bx]
	cbw	
	push	ax
	call	_CheckPointRot
	add	sp,2
	mov	bx,WORD PTR [bp-48]	;L
	add	WORD PTR [bp-48],4	;L
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
	inc	WORD PTR [bp-42]	;i
$F467:
	mov	ax,WORD PTR [bp-42]	;i
	cmp	WORD PTR [bp-2],ax	;NUM
	jg	$FC468
	jmp	$I480
; Line 574
	nop	
$SC471:
; Line 575
	les	bx,DWORD PTR [bp+4]	;P
	inc	WORD PTR [bp+4]	;P
	mov	al,BYTE PTR es:[bx]
	cbw	
	mov	WORD PTR [bp-2],ax	;NUM
; Line 576
	mov	WORD PTR [bp-42],0	;i
	lea	ax,WORD PTR [bp-176]	;List
	mov	WORD PTR [bp-48],ax	;L
	jmp	SHORT $F472
	nop	
$FC473:
; Line 577
; Line 578
	les	bx,DWORD PTR [bp+4]	;P
	inc	WORD PTR [bp+4]	;P
	mov	al,BYTE PTR es:[bx]
	cbw	
	push	ax
	call	_CheckPointRot
	add	sp,2
	mov	WORD PTR [bp-30],ax	;PT
	mov	WORD PTR [bp-28],dx
	mov	bx,WORD PTR [bp-48]	;L
	add	WORD PTR [bp-48],4	;L
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
; Line 579
	les	bx,DWORD PTR [bp+4]	;P
	mov	al,BYTE PTR es:[bx]
	cbw	
	les	bx,DWORD PTR [bp-30]	;PT
	mov	WORD PTR es:[bx+24],ax
	inc	WORD PTR [bp+4]	;P
; Line 580
	inc	WORD PTR [bp-42]	;i
$F472:
	mov	ax,WORD PTR [bp-42]	;i
	cmp	WORD PTR [bp-2],ax	;NUM
	jg	$FC473
; Line 581
	sub	ax,ax
	push	ax
	push	ax
	mov	ax,1
	jmp	$L20064
; Line 583
	nop	
$SC475:
; Line 584
	les	bx,DWORD PTR [bp+4]	;P
	inc	WORD PTR [bp+4]	;P
	mov	al,BYTE PTR es:[bx]
	cbw	
	mov	WORD PTR [bp-2],ax	;NUM
; Line 585
	mov	WORD PTR [bp-42],0	;i
	lea	ax,WORD PTR [bp-176]	;List
	mov	WORD PTR [bp-48],ax	;L
	jmp	SHORT $F476
	nop	
$FC477:
; Line 586
; Line 587
	les	bx,DWORD PTR [bp+4]	;P
	inc	WORD PTR [bp+4]	;P
	mov	al,BYTE PTR es:[bx]
	cbw	
	push	ax
	call	_CheckPointRot
	add	sp,2
	mov	WORD PTR [bp-30],ax	;PT
	mov	WORD PTR [bp-28],dx
	mov	bx,WORD PTR [bp-48]	;L
	add	WORD PTR [bp-48],4	;L
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
; Line 588
	les	bx,DWORD PTR [bp+4]	;P
	mov	cl,BYTE PTR es:[bx]
	sub	ch,ch
	mov	es,dx
	mov	bx,ax
	mov	WORD PTR es:[bx+24],cx
	inc	WORD PTR [bp+4]	;P
; Line 589
	les	si,DWORD PTR [bp+4]	;P
	mov	cl,BYTE PTR es:[si]
	mov	es,dx
	mov	WORD PTR es:[bx+26],cx
	inc	WORD PTR [bp+4]	;P
; Line 590
	inc	WORD PTR [bp-42]	;i
$F476:
	mov	ax,WORD PTR [bp-42]	;i
	cmp	WORD PTR [bp-2],ax	;NUM
	jg	$FC477
; Line 591
	mov	bx,WORD PTR _OBJ
	mov	ax,WORD PTR [bx+18]
	or	ax,WORD PTR [bx+16]
	je	$I480
	cmp	WORD PTR _NOTEXTURE,0
	je	$I479
$I480:
; Line 592
; Line 595
	les	bx,DWORD PTR [bp+4]	;P
	inc	WORD PTR [bp+4]	;P
	mov	bl,BYTE PTR es:[bx]
	sub	bh,bh
	shl	bx,1
	mov	si,WORD PTR _PalPtr3D
	mov	ax,WORD PTR [bx][si]
	mov	WORD PTR [bp-6],ax	;CLR
	cmp	ah,255
	jne	$I481
; Line 596
	mov	al,BYTE PTR [bp-6]	;CLR
	mov	ah,al
	mov	WORD PTR [bp-6],ax	;CLR
; Line 597
$I481:
	cwd	
	push	dx
	push	ax
	sub	ax,ax
$L20064:
	push	ax
	push	WORD PTR _NPDEST+2
	push	WORD PTR _NPDEST
	lea	ax,WORD PTR [bp-176]	;List
	push	ax
	push	WORD PTR [bp-2]	;NUM
	call	_Npoly3D
$L20062:
	add	sp,14
; Line 598
; Line 599
	jmp	SHORT $L20063
$I479:
; Line 600
; Line 601
	push	WORD PTR [bx+18]
	push	WORD PTR [bx+16]
	les	bx,DWORD PTR [bp+4]	;P
	inc	WORD PTR [bp+4]	;P
	mov	al,2
	mov	ah,BYTE PTR es:[bx]
	jmp	SHORT $L20064
	nop	
$S455:
	cmp	ax,5
	ja	$EX423
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20045[bx]
	nop	
$L20045:
		DW	$SC459
		DW	$SC461
		DW	$SC463
		DW	$SC466
		DW	$SC471
		DW	$SC475
; Line 608
$L20063:
	les	bx,DWORD PTR [bp+4]	;P
	cmp	BYTE PTR es:[bx],255
	je	$JCC2673
	jmp	$FC440
$JCC2673:
; Line 609
$EX423:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_DrawASurf	ENDP
; Line 612
	PUBLIC	_DrawSurfs
_DrawSurfs	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	si
;	P = -4
;	L = -6
; Line 616
	mov	ax,WORD PTR _OBJ
	add	ax,88
	mov	WORD PTR [bp-6],ax	;L
; Line 617
	mov	bx,WORD PTR _OBJ
	mov	ax,WORD PTR [bx]
	mov	dx,WORD PTR [bx+2]
	mov	WORD PTR [bp-2],dx
; Line 618
	jmp	SHORT $L20066
	nop	
$FC489:
; Line 619
; Line 620
	mov	si,WORD PTR [bx]
	and	si,255
	shl	si,1
	mov	bx,WORD PTR _OBJ
	les	bx,DWORD PTR [bx+4]
	mov	ax,WORD PTR es:[bx][si]
; Line 621
	push	WORD PTR [bp-2]
	push	ax
	call	_DrawASurf
	add	sp,4
; Line 622
	inc	WORD PTR [bp-6]	;L
; Line 623
$L20066:
	mov	bx,WORD PTR [bp-6]	;L
	cmp	BYTE PTR [bx],255
	jne	$FC489
; Line 624
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_DrawSurfs	ENDP
; Line 629
	PUBLIC	_DrawN3dObject
_DrawN3dObject	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,558
	call	__aNchkstk
	push	si
;	object = -558
;	S = -4
;	OFFS = 8
;	VMAT = 6
;	OBJPTR = 4
; Line 633
	lea	ax,WORD PTR [bp-558]	;object
	mov	WORD PTR _OBJ,ax
; Line 637
	mov	ax,WORD PTR [bp+4]	;OBJPTR
	mov	WORD PTR [bp-538],ax
; Line 639
	mov	bx,ax
	push	WORD PTR [bx]
	call	_MapEMSObject
	add	sp,2
	mov	bx,WORD PTR _OBJ
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
	mov	bx,WORD PTR _OBJ
	mov	ax,WORD PTR [bx+2]
	or	ax,WORD PTR [bx]
	je	$EX494
; Line 642
	mov	ax,WORD PTR [bp+8]	;OFFS
	mov	WORD PTR [bx+86],ax
; Line 643
	mov	bx,ax
	mov	si,WORD PTR [bp+4]	;OBJPTR
	mov	cx,WORD PTR [si+2]
	add	WORD PTR [bx],cx
; Line 644
	mov	cx,WORD PTR [si+4]
	add	WORD PTR [bx+2],cx
; Line 645
	mov	cx,WORD PTR [si+6]
	add	WORD PTR [bx+4],cx
; Line 648
	push	WORD PTR [bp+6]	;VMAT
	call	_Reject
	add	sp,2
	or	ax,ax
	jne	$EX494
; Line 651
	mov	bx,WORD PTR [bp+4]	;OBJPTR
	push	WORD PTR [bx]
	call	_MapEMSObjectTexture
	add	sp,2
	mov	bx,WORD PTR _OBJ
	mov	WORD PTR [bx+16],ax
	mov	WORD PTR [bx+18],dx
; Line 653
	mov	bx,WORD PTR [bp+4]	;OBJPTR
	mov	ax,WORD PTR [bx+10]
	mov	bx,WORD PTR _OBJ
	mov	WORD PTR [bx+84],ax
; Line 655
	push	WORD PTR [bp+6]	;VMAT
	call	_SetMatsPtrsOrder
	add	sp,2
; Line 656
	call	_DrawSurfs
; Line 658
	mov	bx,WORD PTR _OBJ
	mov	ax,WORD PTR [bx+12]
	mov	dx,WORD PTR [bx+14]
	mov	WORD PTR _POINTBUF,ax
	mov	WORD PTR _POINTBUF+2,dx
; Line 660
$EX494:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DrawN3dObject	ENDP
; Line 665
	PUBLIC	_NDraw3DObject
_NDraw3DObject	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	OFFS = -6
;	BGS = 16
;	ANIM = 14
;	MAT = 12
;	ZOFF = 10
;	YOFF = 8
;	XOFF = 6
;	N = 4
; Line 668
	mov	ax,WORD PTR [bp+4]	;N
	mov	WORD PTR _OB,ax
; Line 669
	mov	ax,WORD PTR [bp+6]	;XOFF
	mov	WORD PTR _OB+2,ax
; Line 670
	mov	ax,WORD PTR [bp+8]	;YOFF
	mov	WORD PTR _OB+4,ax
; Line 671
	mov	ax,WORD PTR [bp+10]	;ZOFF
	mov	WORD PTR _OB+6,ax
; Line 672
	mov	ax,WORD PTR [bp+12]	;MAT
	mov	WORD PTR _OB+8,ax
; Line 673
	mov	ax,WORD PTR [bp+14]	;ANIM
	mov	WORD PTR _OB+10,ax
; Line 674
	sub	ax,ax
	mov	WORD PTR _OB+22,ax
	mov	WORD PTR _OB+20,ax
	mov	WORD PTR _OB+18,ax
	mov	WORD PTR _OB+16,ax
	mov	WORD PTR _OB+14,ax
	mov	WORD PTR _OB+12,ax
; Line 677
	mov	WORD PTR [bp-6],ax	;OFFS
	mov	WORD PTR [bp-4],ax
	mov	WORD PTR [bp-2],ax
; Line 678
	lea	ax,WORD PTR [bp-6]	;OFFS
	push	ax
	mov	ax,OFFSET _Nviewmat
	push	ax
	mov	ax,OFFSET DGROUP:_OB
	push	ax
	call	_DrawN3dObject
; Line 680
	mov	sp,bp
	pop	bp
	ret	
	nop	

_NDraw3DObject	ENDP
; Line 683
	PUBLIC	_DrawSuper3DObject
_DrawSuper3DObject	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	OFFS = -6
;	ANIM = 16
;	MAT = 14
;	ZOFF = 12
;	YOFF = 10
;	XOFF = 8
;	N = 6
;	OB = 4
; Line 686
	mov	ax,WORD PTR [bp+6]	;N
	mov	bx,WORD PTR [bp+4]	;OB
	mov	WORD PTR [bx],ax
; Line 687
	mov	ax,WORD PTR [bp+8]	;XOFF
	mov	WORD PTR [bx+2],ax
; Line 688
	mov	ax,WORD PTR [bp+10]	;YOFF
	mov	WORD PTR [bx+4],ax
; Line 689
	mov	ax,WORD PTR [bp+12]	;ZOFF
	mov	WORD PTR [bx+6],ax
; Line 690
	mov	ax,WORD PTR [bp+14]	;MAT
	mov	WORD PTR [bx+8],ax
; Line 691
	mov	ax,WORD PTR [bp+16]	;ANIM
	mov	WORD PTR [bx+10],ax
; Line 692
	sub	ax,ax
	mov	WORD PTR [bx+22],ax
	mov	WORD PTR [bx+20],ax
	mov	WORD PTR [bx+18],ax
	mov	WORD PTR [bx+16],ax
	mov	WORD PTR [bx+14],ax
	mov	WORD PTR [bx+12],ax
; Line 695
	mov	WORD PTR [bp-6],ax	;OFFS
	mov	WORD PTR [bp-4],ax
	mov	WORD PTR [bp-2],ax
; Line 697
	lea	ax,WORD PTR [bp-6]	;OFFS
	push	ax
	mov	ax,OFFSET _Nviewmat
	push	ax
	push	bx
	call	_DrawN3dObject
; Line 699
	mov	sp,bp
	pop	bp
	ret	

_DrawSuper3DObject	ENDP
; Line 723
	PUBLIC	_LoadEMSObject
_LoadEMSObject	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,28
	call	__aNchkstk
	push	si
;	objhndl = -6
;	txtrhndl = -8
;	OBJB = -28
;	P = -4
;	str = -24
;	i = -10
;	ID = 6
;	Name = 4
; Line 730
	cmp	WORD PTR [bp+6],0	;ID
	jl	$I531
	cmp	WORD PTR [bp+6],255	;ID
	jle	$I530
$I531:
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 732
$I530:
	push	WORD PTR [bp+4]	;Name
	call	_LoadEmsFile
	add	sp,2
	mov	es,WORD PTR $T20001
	mov	bx,WORD PTR [bp+6]	;ID
	shl	bx,1
	shl	bx,1
	mov	WORD PTR es:_objhndls[bx],ax
	or	ax,ax
	je	$I531
; Line 733
	sub	ax,ax
	push	ax
	mov	bx,WORD PTR [bp+6]	;ID
	shl	bx,1
	shl	bx,1
	push	WORD PTR es:_objhndls[bx]
	call	_MapEmsFile
	add	sp,4
	mov	WORD PTR [bp-26],ax
	or	ax,ax
	je	$I531
; Line 739
	mov	WORD PTR [bp-28],0	;OBJB
; Line 742
	add	WORD PTR [bp-28],2	;OBJB
	mov	ax,WORD PTR [bp-28]	;OBJB
	mov	dx,WORD PTR [bp-26]
	mov	WORD PTR [bp-4],ax	;P
	mov	WORD PTR [bp-2],dx
; Line 744
	mov	es,dx
	mov	bx,ax
	cmp	BYTE PTR es:[bx],0
	je	$I536
	cmp	WORD PTR _NOTEXTURE,0
	je	$I535
$I536:
; Line 745
	mov	es,WORD PTR $T20001
	mov	bx,WORD PTR [bp+6]	;ID
	shl	bx,1
	shl	bx,1
	mov	WORD PTR es:_objhndls[bx+2],0
; Line 746
	jmp	SHORT $I537
	nop	
$I535:
; Line 747
	mov	WORD PTR [bp-10],0	;i
$FC539:
; Line 748
	les	bx,DWORD PTR [bp-4]	;P
	inc	WORD PTR [bp-4]	;P
	mov	al,BYTE PTR es:[bx]
	mov	si,WORD PTR [bp-10]	;i
	mov	BYTE PTR [bp-24][si],al
	inc	WORD PTR [bp-10]	;i
	cmp	WORD PTR [bp-10],13	;i
	jl	$FC539
; Line 749
	mov	si,WORD PTR [bp-10]	;i
	mov	BYTE PTR [bp-24][si],0
; Line 750
	mov	ax,200
	push	ax
	mov	ax,256
	push	ax
	sub	ax,ax
	push	ax
	lea	ax,WORD PTR [bp-24]	;str
	push	ax
	call	_ReadEMSPCXSize
	add	sp,8
	mov	es,WORD PTR $T20001
	mov	bx,WORD PTR [bp+6]	;ID
	shl	bx,1
	shl	bx,1
	mov	WORD PTR es:_objhndls[bx+2],ax
; Line 751
$I537:
; Line 752
	mov	ax,1
; Line 753
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_LoadEMSObject	ENDP
_TEXT	ENDS
END
