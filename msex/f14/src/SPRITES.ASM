;	Static Name Aliases
;
	TITLE   C:\SPRITES.C
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
PUBLIC  _InXPLO
PUBLIC  _XPLODETAIL
PUBLIC  _SPRTVLS
PUBLIC  _XPLOANIMS
EXTRN	_ASinB:NEAR
EXTRN	_MapInEMSSprite:NEAR
EXTRN	_TransScaleLine:NEAR
EXTRN	_OpenSprite:FAR
EXTRN	_labs:NEAR
EXTRN	_MouseSETUP:NEAR
EXTRN	_BuildSprite:FAR
EXTRN	_Rnd2:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	__aNlmul:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_LoadPicGmem:NEAR
EXTRN	_CloseSprite:FAR
EXTRN	_Stack3Dobject:NEAR
EXTRN	_abs:NEAR
EXTRN	_Rotate:NEAR
EXTRN	_ACosB:NEAR
_BSS      SEGMENT
COMM NEAR	_RadarCursorSprite:	 2:	 3
COMM NEAR	_HudSprite3:	BYTE:	 2
COMM NEAR	_HudSprite4:	BYTE:	 2
COMM NEAR	_HudSprite5:	BYTE:	 2
COMM NEAR	_MouseSprite:	BYTE:	 2
COMM NEAR	_TEWSprites:	 2:	 6
_BSS      ENDS
EXTRN	_Rp3D:WORD
EXTRN	_RpCRT:WORD
EXTRN	_GRPAGE0:BYTE
EXTRN	_GXMID:WORD
EXTRN	_GYMID:WORD
EXTRN	_Nviewmat:BYTE
EXTRN	_vRoll:WORD
EXTRN	_ABOVECLOUDS:WORD
EXTRN	_MISSILETRAIL:WORD
_BSS      SEGMENT
COMM NEAR	_SMOKES:	 18:	 30
COMM NEAR	_HudSprite1:	BYTE:	 2
_BSS      ENDS
_DATA      SEGMENT
$SG661	DB	'f14.pic',  00H
_InXPLO	DW	00H
_XPLODETAIL	DW	01H
_SPRTVLS	DW	00H
	DW	026H
	DW	02dH
	DW	015H
	DW	011H
	DW	00H
	DW	073H
	DW	02cH
	DW	029H
	DW	021H
	DW	00H
	DW	0c0H
	DW	02aH
	DW	031H
	DW	027H
	DW	00H
	DW	010cH
	DW	02bH
	DW	035H
	DW	02bH
	DW	00H
	DW	037H
	DW	09aH
	DW	035H
	DW	02bH
	DW	00H
	DW	074H
	DW	069H
	DW	037H
	DW	02dH
	DW	00H
	DW	0bfH
	DW	094H
	DW	03fH
	DW	033H
	DW	00H
	DW	0107H
	DW	06eH
	DW	03fH
	DW	033H
	DW	01H
	DW	02bH
	DW	02aH
	DW	035H
	DW	02bH
	DW	01H
	DW	075H
	DW	02cH
	DW	037H
	DW	02dH
	DW	01H
	DW	0c0H
	DW	02dH
	DW	039H
	DW	02fH
	DW	01H
	DW	0110H
	DW	035H
	DW	03fH
	DW	033H
	DW	01H
	DW	035H
	DW	066H
	DW	03dH
	DW	031H
	DW	01H
	DW	095H
	DW	065H
	DW	03fH
	DW	033H
	DW	01H
	DW	0110H
	DW	07bH
	DW	03bH
	DW	031H
	DW	01H
	DW	064H
	DW	09fH
	DW	03bH
	DW	031H
	DW	01H
	DW	0c3H
	DW	09fH
	DW	03fH
	DW	033H
	DW	02H
	DW	0eH
	DW	0aH
	DW	01bH
	DW	013H
	DW	02H
	DW	02dH
	DW	0dH
	DW	021H
	DW	018H
	DW	02H
	DW	052H
	DW	0eH
	DW	027H
	DW	01bH
	DW	02H
	DW	07eH
	DW	011H
	DW	02fH
	DW	021H
	DW	02H
	DW	0b0H
	DW	011H
	DW	032H
	DW	021H
	DW	02H
	DW	0dfH
	DW	0fH
	DW	028H
	DW	01cH
	DW	02H
	DW	0105H
	DW	0dH
	DW	021H
	DW	018H
	DW	02H
	DW	0125H
	DW	0bH
	DW	01cH
	DW	014H
	DW	02H
	DW	0b6H
	DW	02fH
	DW	018H
	DW	012H
	DW	02H
	DW	0d8H
	DW	02fH
	DW	01dH
	DW	015H
	DW	02H
	DW	0fbH
	DW	02bH
	DW	021H
	DW	017H
	DW	02H
	DW	0125H
	DW	027H
	DW	02bH
	DW	01bH
	DW	02H
	DW	019H
	DW	028H
	DW	02bH
	DW	01dH
	DW	02H
	DW	04bH
	DW	02dH
	DW	02bH
	DW	020H
	DW	02H
	DW	074H
	DW	02fH
	DW	021H
	DW	016H
	DW	02H
	DW	096H
	DW	02cH
	DW	01bH
	DW	011H
	DW	03H
	DW	010H
	DW	014H
	DW	014H
	DW	0eH
	DW	03H
	DW	019H
	DW	02aH
	DW	029H
	DW	01cH
	DW	03H
	DW	048H
	DW	027H
	DW	033H
	DW	022H
	DW	03H
	DW	07cH
	DW	02bH
	DW	033H
	DW	02aH
	DW	03H
	DW	0b0H
	DW	021H
	DW	033H
	DW	032H
	DW	03H
	DW	0e5H
	DW	01fH
	DW	035H
	DW	036H
	DW	03H
	DW	0120H
	DW	01bH
	DW	03eH
	DW	035H
	DW	03H
	DW	036H
	DW	055H
	DW	03eH
	DW	038H
	DW	03H
	DW	070H
	DW	059H
	DW	035H
	DW	02fH
	DW	03H
	DW	0a8H
	DW	059H
	DW	039H
	DW	031H
	DW	03H
	DW	0e3H
	DW	054H
	DW	03aH
	DW	033H
	DW	03H
	DW	0120H
	DW	052H
	DW	03eH
	DW	037H
	DW	03H
	DW	023H
	DW	08dH
	DW	03eH
	DW	036H
	DW	03H
	DW	062H
	DW	08dH
	DW	03eH
	DW	036H
	DW	03H
	DW	0a1H
	DW	08dH
	DW	03eH
	DW	035H
	DW	03H
	DW	0dfH
	DW	08eH
	DW	03cH
	DW	034H
	DW	03H
	DW	011eH
	DW	08bH
	DW	041H
	DW	039H
	DW	04H
	DW	03H
	DW	03H
	DW	04H
	DW	04H
	DW	04H
	DW	09H
	DW	04H
	DW	07H
	DW	06H
	DW	04H
	DW	08H
	DW	0eH
	DW	0eH
	DW	0dH
	DW	04H
	DW	01eH
	DW	0eH
	DW	01cH
	DW	01aH
	DW	04H
	DW	013H
	DW	02cH
	DW	024H
	DW	020H
	DW	04H
	DW	043H
	DW	013H
	DW	02dH
	DW	025H
	DW	04H
	DW	077H
	DW	019H
	DW	038H
	DW	030H
	DW	04H
	DW	0b5H
	DW	01dH
	DW	043H
	DW	039H
	DW	04H
	DW	0105H
	DW	020H
	DW	05aH
	DW	03eH
	DW	04H
	DW	03H
	DW	043H
	DW	04H
	DW	06H
	DW	04H
	DW	09H
	DW	043H
	DW	07H
	DW	06H
	DW	04H
	DW	08H
	DW	04dH
	DW	0fH
	DW	0dH
	DW	04H
	DW	021H
	DW	04eH
	DW	020H
	DW	01cH
	DW	04H
	DW	019H
	DW	072H
	DW	030H
	DW	02aH
	DW	04H
	DW	050H
	DW	05bH
	DW	03cH
	DW	037H
	DW	04H
	DW	052H
	DW	096H
	DW	040H
	DW	03dH
	DW	04H
	DW	096H
	DW	064H
	DW	047H
	DW	049H
	DW	04H
	DW	0e2H
	DW	065H
	DW	04eH
	DW	04bH
	DW	04H
	DW	075H
	DW	090H
	DW	05H
	DW	09H
	DW	04H
	DW	07fH
	DW	094H
	DW	0cH
	DW	011H
	DW	04H
	DW	08dH
	DW	097H
	DW	0eH
	DW	016H
	DW	04H
	DW	09eH
	DW	097H
	DW	013H
	DW	017H
	DW	04H
	DW	0b4H
	DW	097H
	DW	017H
	DW	017H
	DW	04H
	DW	0cdH
	DW	098H
	DW	018H
	DW	018H
	DW	04H
	DW	0e5H
	DW	099H
	DW	016H
	DW	01aH
	DW	04H
	DW	0feH
	DW	09aH
	DW	01bH
	DW	01cH
	DW	04H
	DW	0118H
	DW	098H
	DW	016H
	DW	018H
	DW	04H
	DW	012fH
	DW	099H
	DW	016H
	DW	01aH
	DW	04H
	DW	07eH
	DW	0b6H
	DW	017H
	DW	01aH
	DW	04H
	DW	097H
	DW	0b7H
	DW	019H
	DW	01cH
	DW	04H
	DW	0b1H
	DW	0b7H
	DW	018H
	DW	01cH
	DW	04H
	DW	0caH
	DW	0b7H
	DW	018H
	DW	01cH
	DW	04H
	DW	0e3H
	DW	0b7H
	DW	018H
	DW	01cH
	DW	04H
	DW	0fcH
	DW	0b7H
	DW	018H
	DW	01cH
	DW	04H
	DW	0116H
	DW	0b8H
	DW	01aH
	DW	01eH
_XPLOANIMS	DW	00H
	DW	010H
	DW	011H
	DW	018H
	DW	019H
	DW	020H
	DW	021H
	DW	031H
	DW	032H
	DW	03aH
	DW	03bH
	DW	043H
	DW	044H
	DW	054H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 2
; Line 19
; Line 3
; Line 4
; Line 5
; Line 31
	PUBLIC	_LoadSprites
_LoadSprites	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	i = -2
;	j = -4
; Line 34
	call	FAR PTR _OpenSprite
; Line 35
	mov	ax,1
	push	ax
	mov	cx,OFFSET DGROUP:$SG661
	push	cx
	call	_LoadPicGmem
	add	sp,4
; Line 37
	mov	ax,11
	push	ax
	push	ax
	mov	cx,1
	push	cx
	mov	dx,34
	push	dx
	push	cx
	call	FAR PTR _BuildSprite
	add	sp,10
	mov	WORD PTR _TEWSprites,ax
; Line 38
	mov	ax,11
	push	ax
	push	ax
	mov	cx,1
	push	cx
	mov	dx,45
	push	dx
	push	cx
	call	FAR PTR _BuildSprite
	add	sp,10
	mov	WORD PTR _TEWSprites+2,ax
; Line 39
	mov	ax,8
	push	ax
	mov	cx,6
	push	cx
	mov	dx,2
	push	dx
	mov	bx,58
	push	bx
	mov	si,1
	push	si
	call	FAR PTR _BuildSprite
	add	sp,10
	mov	WORD PTR _TEWSprites+4,ax
; Line 40
	mov	ax,8
	push	ax
	mov	ax,6
	push	ax
	mov	cx,2
	push	cx
	mov	dx,69
	push	dx
	push	si
	call	FAR PTR _BuildSprite
	add	sp,10
	mov	WORD PTR _TEWSprites+6,ax
; Line 41
	mov	ax,3
	push	ax
	push	ax
	mov	cx,13
	push	cx
	mov	dx,58
	push	dx
	push	si
	call	FAR PTR _BuildSprite
	add	sp,10
	mov	WORD PTR _TEWSprites+8,ax
; Line 42
	mov	ax,3
	push	ax
	push	ax
	mov	ax,13
	push	ax
	mov	cx,61
	push	cx
	push	si
	call	FAR PTR _BuildSprite
	add	sp,10
	mov	WORD PTR _TEWSprites+10,ax
; Line 44
	mov	ax,6
	push	ax
	push	ax
	push	si
	mov	ax,14
	push	ax
	push	si
	call	FAR PTR _BuildSprite
	add	sp,10
	mov	WORD PTR _RadarCursorSprite,ax
; Line 45
	mov	ax,5
	push	ax
	mov	ax,7
	push	ax
	mov	cx,2
	push	cx
	mov	dx,23
	push	dx
	push	si
	call	FAR PTR _BuildSprite
	add	sp,10
	mov	WORD PTR _RadarCursorSprite+4,ax
; Line 47
	mov	ax,7
	push	ax
	mov	ax,11
	push	ax
	sub	cx,cx
	push	cx
	push	si
	push	si
	call	FAR PTR _BuildSprite
	add	sp,10
	mov	WORD PTR _HudSprite1,ax
; Line 48
	mov	ax,9
	push	ax
	push	ax
	mov	cx,13
	push	cx
	mov	dx,2
	push	dx
	push	si
	call	FAR PTR _BuildSprite
	add	sp,10
	mov	WORD PTR _HudSprite3,ax
; Line 49
	mov	ax,9
	push	ax
	push	ax
	mov	cx,13
	push	cx
	mov	cx,11
	push	cx
	push	si
	call	FAR PTR _BuildSprite
	add	sp,10
	mov	WORD PTR _HudSprite4,ax
; Line 51
	mov	ax,11
	push	ax
	mov	ax,9
	push	ax
	mov	ax,14
	push	ax
	mov	ax,27
	push	ax
	push	si
	call	FAR PTR _BuildSprite
	add	sp,10
	mov	WORD PTR _MouseSprite,ax
; Line 52
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _MouseSprite
	call	_MouseSETUP
	add	sp,6
; Line 53
	call	FAR PTR _CloseSprite
; Line 54
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_LoadSprites	ENDP
; Line 58
	PUBLIC	_ScaleRotate
_ScaleRotate	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,678
	call	__aNchkstk
	push	di
	push	si
;	ADDRESS = -656
;	ADDBASE = -6
;	i = -660
;	XS = -668
;	YS = -672
;	XADD = -2
;	YADD = -4
;	TX = -670
;	TY = -674
;	SSX = -676
;	SSY = -678
;	X1 = -658
;	Y1 = -664
;	X2 = -662
;	Y2 = -666
;	T1 = -10
;	T2 = -14
;	MIRROR = 26
;	TRNSCLR = 24
;	ROLL = 22
;	SCALE = 20
;	YDC = 18
;	XDC = 16
;	Rp = 14
;	HT = 12
;	WID = 10
;	YSC = 8
;	XSC = 6
;	SOURCE = 4
; Line 65
	cmp	WORD PTR [bp+20],1	;SCALE
	jge	$I694
	mov	WORD PTR [bp+20],1	;SCALE
; Line 66
$I694:
; Line 67
	mov	ax,WORD PTR [bp+12]	;HT
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp+20]	;SCALE
	cwd	
	push	dx
	push	ax
	mov	si,ax
	mov	di,dx
	call	__aNlmul
	mov	al,ah
	mov	ah,dl
	mov	dl,dh
	sub	dh,dh
	mov	WORD PTR [bp-14],ax	;T2
	mov	WORD PTR [bp-12],dx
; Line 69
	mov	cx,2
	sub	bx,bx
	push	bx
	push	cx
	mov	ax,WORD PTR [bp+10]	;WID
	cwd	
	push	dx
	push	ax
	push	di
	push	si
	call	__aNlmul
	mov	al,ah
	mov	ah,dl
	mov	dl,dh
	sub	dh,dh
	mov	WORD PTR [bp-10],ax	;T1
	mov	WORD PTR [bp-8],dx
	push	dx
	push	ax
	call	__aNldiv
	sub	ax,WORD PTR [bp+16]	;XDC
	neg	ax
	mov	WORD PTR [bp-658],ax	;X1
; Line 70
	mov	cx,2
	sub	dx,dx
	push	dx
	push	cx
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;T2
	call	__aNldiv
	sub	ax,WORD PTR [bp+18]	;YDC
	neg	ax
	mov	WORD PTR [bp-664],ax	;Y1
; Line 73
	mov	cx,WORD PTR [bp-658]	;X1
	add	cx,WORD PTR [bp-10]	;T1
	mov	WORD PTR [bp-662],cx	;X2
; Line 74
	add	ax,WORD PTR [bp-14]	;T2
	mov	WORD PTR [bp-666],ax	;Y2
; Line 76
	mov	bx,WORD PTR [bp+14]	;Rp
	mov	ax,WORD PTR [bx+2]
	add	ax,WORD PTR [bx+6]
	cmp	WORD PTR [bp-658],ax	;X1
	jle	$I695
$L20011:
	mov	ax,1
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 77
$I695:
	mov	ax,WORD PTR [bx+4]
	add	ax,WORD PTR [bx+8]
	cmp	ax,WORD PTR [bp-664]	;Y1
	jl	$L20011
; Line 78
	mov	ax,cx
	cmp	WORD PTR [bx+2],ax
	jg	$L20011
; Line 79
	mov	ax,WORD PTR [bp-666]	;Y2
	cmp	WORD PTR [bx+4],ax
	jg	$L20011
; Line 81
	mov	ax,WORD PTR [bp-658]	;X1
	cmp	WORD PTR [bx+2],ax
	jle	$I699
	mov	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-658],ax	;X1
; Line 82
$I699:
	mov	ax,WORD PTR [bx+2]
	add	ax,WORD PTR [bx+6]
	cmp	ax,cx
	jge	$I700
	mov	WORD PTR [bp-662],ax	;X2
; Line 83
$I700:
	mov	ax,WORD PTR [bp-664]	;Y1
	cmp	WORD PTR [bx+4],ax
	jle	$I701
	mov	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-664],ax	;Y1
; Line 84
$I701:
	mov	ax,WORD PTR [bx+4]
	add	ax,WORD PTR [bx+8]
	cmp	ax,WORD PTR [bp-666]	;Y2
	jge	$I702
	mov	WORD PTR [bp-666],ax	;Y2
; Line 95
$I702:
	push	WORD PTR [bp+22]	;ROLL
	mov	ax,8192
	push	ax
	call	_ACosB
	add	sp,4
	cwd	
	idiv	WORD PTR [bp+20]	;SCALE
	mov	WORD PTR [bp-670],ax	;TX
	mov	WORD PTR [bp-676],ax	;SSX
; Line 96
	push	WORD PTR [bp+22]	;ROLL
	mov	cx,8192
	push	cx
	call	_ASinB
	add	sp,4
	cwd	
	idiv	WORD PTR [bp+20]	;SCALE
	mov	WORD PTR [bp-674],ax	;TY
	mov	WORD PTR [bp-678],ax	;SSY
; Line 101
	cmp	WORD PTR [bp+26],0	;MIRROR
	je	$I705
	neg	WORD PTR [bp-670]	;TX
; Line 103
$I705:
	mov	WORD PTR [bp-660],0	;i
	jmp	SHORT $F706
$FC707:
; Line 104
	mov	ax,WORD PTR [bp-660]	;i
	imul	WORD PTR [bp-670]	;TX
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,5
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	cx,ax
	mov	ax,WORD PTR [bp-660]	;i
	imul	WORD PTR [bp-674]	;TY
	mov	bx,cx
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,5
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	cx,320
	imul	cx
	add	bx,ax
	mov	si,WORD PTR [bp-660]	;i
	shl	si,1
	mov	WORD PTR [bp-656][si],bx
; Line 105
	inc	WORD PTR [bp-660]	;i
$F706:
	mov	ax,WORD PTR [bp-662]	;X2
	sub	ax,WORD PTR [bp-658]	;X1
	cmp	ax,WORD PTR [bp-660]	;i
	jge	$FC707
; Line 107
	mov	ax,WORD PTR [bp-664]	;Y1
	mov	WORD PTR [bp-660],ax	;i
	jmp	$F709
$FC710:
; Line 111
	push	WORD PTR [bp+24]	;TRNSCLR
	mov	bx,WORD PTR [bp+14]	;Rp
	mov	bx,WORD PTR [bx]
	shl	bx,1
	push	WORD PTR _GRPAGE0[bx]
	mov	ax,WORD PTR [bp-662]	;X2
	sub	ax,WORD PTR [bp-658]	;X1
	inc	ax
	push	ax
	push	WORD PTR [bp-660]	;i
	push	WORD PTR [bp-658]	;X1
	lea	ax,WORD PTR [bp-656]	;ADDRESS
	push	ax
	mov	ax,WORD PTR [bp+18]	;YDC
	sub	ax,WORD PTR [bp-660]	;i
	imul	WORD PTR [bp-674]	;TY
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,5
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	cx,ax
	mov	ax,WORD PTR [bp-658]	;X1
	sub	ax,WORD PTR [bp+16]	;XDC
	mov	bx,ax
	imul	WORD PTR [bp-674]	;TY
	mov	dx,ax
	mov	ax,WORD PTR [bp-660]	;i
	sub	ax,WORD PTR [bp+18]	;YDC
	mov	si,dx
	imul	WORD PTR [bp-676]	;SSX
	add	ax,si
	mov	si,cx
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,5
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	add	ax,WORD PTR [bp+8]	;YSC
	mov	cx,320
	imul	cx
	add	si,ax
	mov	ax,bx
	imul	WORD PTR [bp-670]	;TX
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,5
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	add	si,ax
	add	si,WORD PTR [bp+6]	;XSC
	mov	WORD PTR [bp-6],si	;ADDBASE
	push	si
	push	WORD PTR [bp+4]	;SOURCE
	call	_TransScaleLine
	add	sp,16
; Line 112
	inc	WORD PTR [bp-660]	;i
$F709:
	mov	ax,WORD PTR [bp-666]	;Y2
	cmp	WORD PTR [bp-660],ax	;i
	jg	$JCC954
	jmp	$FC710
$JCC954:
; Line 113
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ScaleRotate	ENDP
; Line 117
	PUBLIC	_TransRectCopy
_TransRectCopy	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,664
	call	__aNchkstk
	push	si
;	ADDRESS = -652
;	ADDBASE = -2
;	i = -656
;	j = -662
;	X1 = -654
;	Y1 = -660
;	X2 = -658
;	Y2 = -664
;	T1 = -6
;	T2 = -10
;	MIRROR = 22
;	TRNSCLR = 20
;	YD = 18
;	XD = 16
;	Rp = 14
;	HT = 12
;	WID = 10
;	YSL = 8
;	XSL = 6
;	SOURCE = 4
; Line 124
	mov	ax,WORD PTR [bp+18]	;YD
	mov	WORD PTR [bp-660],ax	;Y1
; Line 125
	mov	cx,WORD PTR [bp+16]	;XD
	mov	WORD PTR [bp-654],cx	;X1
	add	cx,WORD PTR [bp+10]	;WID
	mov	WORD PTR [bp-658],cx	;X2
; Line 126
	add	ax,WORD PTR [bp+12]	;HT
	mov	WORD PTR [bp-664],ax	;Y2
; Line 128
	mov	bx,WORD PTR [bp+14]	;Rp
	mov	ax,WORD PTR [bx+2]
	add	ax,WORD PTR [bx+6]
	cmp	ax,WORD PTR [bp-654]	;X1
	jge	$I735
$L20014:
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 129
	nop	
$I735:
	mov	ax,WORD PTR [bx+8]
	add	ax,WORD PTR [bx+4]
	cmp	ax,WORD PTR [bp-660]	;Y1
	jl	$L20014
; Line 130
	mov	ax,cx
	cmp	WORD PTR [bx+2],ax
	jg	$L20014
; Line 131
	mov	ax,WORD PTR [bp-664]	;Y2
	cmp	WORD PTR [bx+4],ax
	jg	$L20014
; Line 134
	mov	ax,WORD PTR [bp-654]	;X1
	cmp	WORD PTR [bx+2],ax
	jle	$I739
; Line 135
	cmp	WORD PTR [bp+22],0	;MIRROR
	je	$L20003
	sub	ax,WORD PTR [bx+2]
	jmp	SHORT $L20004
$L20003:
	mov	ax,WORD PTR [bx+2]
	sub	ax,WORD PTR [bp-654]	;X1
$L20004:
	add	WORD PTR [bp+6],ax	;XSL
; Line 136
	mov	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-654],ax	;X1
; Line 137
; Line 138
$I739:
	mov	ax,WORD PTR [bx+2]
	add	ax,WORD PTR [bx+6]
	cmp	ax,cx
	jge	$I740
	mov	WORD PTR [bp-658],ax	;X2
; Line 139
$I740:
	mov	ax,WORD PTR [bp-660]	;Y1
	cmp	WORD PTR [bx+4],ax
	jle	$I741
; Line 140
	sub	ax,WORD PTR [bx+4]
	neg	ax
	add	WORD PTR [bp+8],ax	;YSL
; Line 141
	mov	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-660],ax	;Y1
; Line 142
; Line 143
$I741:
	mov	ax,WORD PTR [bx+8]
	add	ax,WORD PTR [bx+4]
	cmp	ax,WORD PTR [bp-664]	;Y2
	jge	$I742
	mov	WORD PTR [bp-664],ax	;Y2
; Line 145
$I742:
	cmp	WORD PTR [bp+22],0	;MIRROR
	je	$I743
; Line 146
	mov	WORD PTR [bp-656],0	;i
	mov	ax,WORD PTR [bp-658]	;X2
	sub	ax,WORD PTR [bp-654]	;X1
	add	ax,WORD PTR [bp+6]	;XSL
	mov	WORD PTR [bp-662],ax	;j
	jmp	SHORT $F744
$FC745:
	inc	WORD PTR [bp-656]	;i
$F744:
	mov	ax,WORD PTR [bp-658]	;X2
	sub	ax,WORD PTR [bp-654]	;X1
	cmp	ax,WORD PTR [bp-656]	;i
	jl	$I747
; Line 147
	mov	ax,WORD PTR [bp-662]	;j
	mov	si,WORD PTR [bp-656]	;i
	shl	si,1
	mov	WORD PTR [bp-652][si],ax
	dec	WORD PTR [bp-662]	;j
	jmp	SHORT $FC745
$I743:
; Line 149
	mov	WORD PTR [bp-656],0	;i
	jmp	SHORT $F748
$FC749:
; Line 150
	mov	ax,WORD PTR [bp+6]	;XSL
	mov	si,WORD PTR [bp-656]	;i
	shl	si,1
	mov	WORD PTR [bp-652][si],ax
	inc	WORD PTR [bp+6]	;XSL
	inc	WORD PTR [bp-656]	;i
$F748:
	mov	ax,WORD PTR [bp-658]	;X2
	sub	ax,WORD PTR [bp-654]	;X1
	cmp	ax,WORD PTR [bp-656]	;i
	jge	$FC749
; Line 151
$I747:
; Line 153
	mov	ax,320
	imul	WORD PTR [bp+8]	;YSL
	mov	WORD PTR [bp-2],ax	;ADDBASE
; Line 155
	mov	ax,WORD PTR [bp-660]	;Y1
	mov	WORD PTR [bp-656],ax	;i
	jmp	SHORT $F751
	nop	
$FC752:
; Line 157
	push	WORD PTR [bp+20]	;TRNSCLR
	mov	bx,WORD PTR [bp+14]	;Rp
	mov	bx,WORD PTR [bx]
	shl	bx,1
	push	WORD PTR _GRPAGE0[bx]
	mov	cx,WORD PTR [bp-658]	;X2
	sub	cx,WORD PTR [bp-654]	;X1
	inc	cx
	push	cx
	push	ax
	push	WORD PTR [bp-654]	;X1
	lea	ax,WORD PTR [bp-652]	;ADDRESS
	push	ax
	push	WORD PTR [bp-2]	;ADDBASE
	push	WORD PTR [bp+4]	;SOURCE
	call	_TransScaleLine
	add	sp,16
; Line 158
	add	WORD PTR [bp-2],320	;ADDBASE
; Line 159
	inc	WORD PTR [bp-656]	;i
$F751:
	mov	ax,WORD PTR [bp-656]	;i
	cmp	WORD PTR [bp-664],ax	;Y2
	jge	$FC752
; Line 160
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_TransRectCopy	ENDP
; Line 289
	PUBLIC	_DrawXploSprite
_DrawXploSprite	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	SEG = -2
;	ROLL = 14
;	SCL = 12
;	NUM = 10
;	Y = 8
;	X = 6
;	Rp = 4
; Line 292
	mov	bx,WORD PTR [bp+10]	;NUM
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	push	WORD PTR _SPRTVLS[bx]
	sub	ax,ax
	push	ax
	mov	si,bx
	call	_MapInEMSSprite
	add	sp,4
	or	ax,ax
	je	$I770
; Line 294
	sub	cx,cx
	push	cx
	push	cx
	push	WORD PTR [bp+14]	;ROLL
	push	WORD PTR [bp+12]	;SCL
	push	WORD PTR [bp+8]	;Y
	push	WORD PTR [bp+6]	;X
	push	WORD PTR [bp+4]	;Rp
	push	WORD PTR _SPRTVLS[si+8]
	push	WORD PTR _SPRTVLS[si+6]
	push	WORD PTR _SPRTVLS[si+4]
	push	WORD PTR _SPRTVLS[si+2]
	push	ax
	call	_ScaleRotate
	add	sp,24
; Line 295
; Line 296
$I770:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DrawXploSprite	ENDP
; Line 299
	PUBLIC	_StartASmoke
_StartASmoke	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	si
;	i = -8
;	locnt = -2
;	loi = -6
;	R = -4
;	CNT = 16
;	TYPE = 14
;	Z = 10
;	Y = 8
;	X = 4
; Line 304
	mov	WORD PTR [bp-6],0	;loi
	jmp	SHORT $F782
; Line 306
	nop	
$FC783:
	inc	WORD PTR [bp-6]	;loi
$F782:
	cmp	WORD PTR [bp-6],30	;loi
	jae	$FB784
; Line 305
	mov	ax,18
	mul	WORD PTR [bp-6]	;loi
	mov	bx,ax
	cmp	WORD PTR _SMOKES[bx+12],0
	jg	$FC783
$FB784:
; Line 307
	cmp	WORD PTR [bp-6],30	;loi
	jne	$I786
; Line 308
	sub	ax,ax
	mov	WORD PTR [bp-8],ax	;i
	mov	WORD PTR [bp-2],ax	;locnt
	mov	WORD PTR [bp-6],ax	;loi
	jmp	SHORT $F787
	nop	
$FC788:
; Line 309
	mov	ax,18
	mul	WORD PTR [bp-6]	;loi
	mov	bx,ax
	mov	ax,WORD PTR [bp-2]	;locnt
	cmp	WORD PTR _SMOKES[bx+16],ax
	jbe	$L20017
; Line 310
	mov	ax,WORD PTR _SMOKES[bx+16]
	mov	WORD PTR [bp-2],ax	;locnt
; Line 311
	mov	ax,WORD PTR [bp-6]	;loi
	mov	WORD PTR [bp-8],ax	;i
; Line 312
; Line 313
$L20017:
	inc	WORD PTR [bp-6]	;loi
$F787:
	cmp	WORD PTR [bp-6],30	;loi
	jb	$FC788
; Line 314
	mov	ax,WORD PTR [bp-8]	;i
	mov	WORD PTR [bp-6],ax	;loi
; Line 315
; Line 316
$I786:
	mov	ax,18
	mul	WORD PTR [bp-6]	;loi
	mov	bx,ax
	mov	ax,WORD PTR [bp+16]	;CNT
	mov	WORD PTR _SMOKES[bx+12],ax
; Line 317
	mov	ax,WORD PTR [bp+4]	;X
	mov	dx,WORD PTR [bp+6]
	mov	WORD PTR _SMOKES[bx],ax
	mov	WORD PTR _SMOKES[bx+2],dx
; Line 318
	mov	ax,WORD PTR [bp+8]	;Y
	mov	WORD PTR _SMOKES[bx+4],ax
; Line 319
	mov	ax,WORD PTR [bp+10]	;Z
	mov	dx,WORD PTR [bp+12]
	mov	WORD PTR _SMOKES[bx+6],ax
	mov	WORD PTR _SMOKES[bx+8],dx
; Line 320
	mov	ax,WORD PTR [bp+14]	;TYPE
	mov	WORD PTR _SMOKES[bx+10],ax
; Line 321
	mov	WORD PTR _SMOKES[bx+14],-1
; Line 322
	mov	WORD PTR _SMOKES[bx+16],0
; Line 324
	mov	ax,WORD PTR _SMOKES[bx+10]
	jmp	$S791
; Line 330
	nop	
$SC797:
; Line 331
	mov	ax,18
	mul	WORD PTR [bp-6]	;loi
	mov	bx,ax
	mov	WORD PTR _SMOKES[bx+14],0
; Line 332
	mov	WORD PTR _SMOKES[bx+4],50
; Line 333
	mov	WORD PTR _SMOKES[bx+12],17
; Line 334
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 335
	nop	
$SC798:
; Line 337
	mov	ax,256
	push	ax
	call	_Rnd2
	add	sp,2
	mov	cx,256
	push	cx
	mov	si,ax
	call	_Rnd2
	add	sp,2
	and	ax,3
	mov	bx,si
	and	bx,1
	shl	bx,1
	shl	bx,1
	add	ax,WORD PTR _XPLOANIMS[bx+4]
$L20019:
	mov	cx,ax
	mov	ax,18
	mul	WORD PTR [bp-6]	;loi
	mov	bx,ax
	mov	WORD PTR _SMOKES[bx+14],cx
; Line 338
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 339
	nop	
$SC799:
; Line 340
	mov	ax,256
	push	ax
	call	_Rnd2
	add	sp,2
	mov	bx,ax
	and	bx,1
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR _XPLOANIMS[bx+4]
	jmp	SHORT $L20019
; Line 342
	nop	
$SC800:
; Line 343
	mov	ax,18
	mul	WORD PTR [bp-6]	;loi
	mov	bx,ax
	mov	WORD PTR _SMOKES[bx+14],0
; Line 344
	mov	WORD PTR _SMOKES[bx+4],50
; Line 345
	mov	ax,95
	push	ax
	mov	si,bx
	call	_Rnd2
	add	sp,2
	cwd	
	add	WORD PTR _SMOKES[si],ax
	adc	WORD PTR _SMOKES[si+2],dx
; Line 346
	mov	ax,95
	push	ax
	call	_Rnd2
	add	sp,2
	cwd	
	add	WORD PTR _SMOKES[si+6],ax
	adc	WORD PTR _SMOKES[si+8],dx
; Line 347
	mov	WORD PTR _SMOKES[si+12],17
; Line 348
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 349
	nop	
$SC795:
; Line 327
	mov	ax,255
	push	ax
	call	_Rnd2
	add	sp,2
	mov	bx,ax
	and	bx,3
	add	bx,3
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR _XPLOANIMS[bx]
	mov	cx,ax
	mov	ax,18
	mul	WORD PTR [bp-6]	;loi
	mov	si,ax
	mov	WORD PTR _SMOKES[si+14],cx
; Line 328
	sub	cx,WORD PTR _XPLOANIMS[bx+2]
	neg	cx
	mov	WORD PTR _SMOKES[si+12],cx
; Line 329
	jmp	$SB792
; Line 354
	nop	
$SC802:
; Line 356
	mov	ax,18
	mul	WORD PTR [bp-6]	;loi
	mov	bx,ax
	mov	ax,WORD PTR _XPLOANIMS+12
	mov	WORD PTR _SMOKES[bx+14],ax
; Line 357
	mov	WORD PTR _SMOKES[bx+12],20
; Line 358
$L20020:
	mov	WORD PTR _SMOKES[bx+4],30
; Line 359
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 360
$SC803:
; Line 362
	mov	ax,18
	mul	WORD PTR [bp-6]	;loi
	mov	bx,ax
	mov	ax,WORD PTR _XPLOANIMS+12
	mov	WORD PTR _SMOKES[bx+14],ax
; Line 363
	sub	ax,WORD PTR _XPLOANIMS+14
	neg	ax
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,2
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	WORD PTR _SMOKES[bx+12],ax
	jmp	SHORT $L20020
; Line 366
	nop	
$SC804:
; Line 367
	mov	ax,18
	mul	WORD PTR [bp-6]	;loi
	mov	bx,ax
	mov	WORD PTR _SMOKES[bx+14],0
; Line 368
	mov	WORD PTR _SMOKES[bx+4],50
; Line 369
	mov	WORD PTR _SMOKES[bx+12],2
; Line 370
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$S791:
	cmp	ax,9
	ja	$SB792
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20005[bx]
	nop	
$L20005:
		DW	$SC795
		DW	$SC797
		DW	$SC798
		DW	$SC799
		DW	$SC800
		DW	$SC795
		DW	$SC802
		DW	$SC803
		DW	$SC804
		DW	$SC798
$SB792:
; Line 375
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_StartASmoke	ENDP
; Line 379
	PUBLIC	_DrawASmoke
_DrawASmoke	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,26
	call	__aNchkstk
	push	di
	push	si
;	V = -16
;	size = -26
;	T = -8
;	R = -2
;	XR = -24
;	i = -18
;	CNT = -10
;	D = -4
;	SCL = 12
;	ID = 10
;	Z = 8
;	Y = 6
;	X = 4
; Line 392
	mov	ax,18
	imul	WORD PTR [bp+10]	;ID
	mov	bx,ax
	cmp	WORD PTR _SMOKES[bx+10],3
	je	$JCC2032
	jmp	$I820
$JCC2032:
; Line 394
	mov	ax,WORD PTR [bp+6]	;Y
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,2
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	push	ax
	call	_abs
	add	sp,2
	push	WORD PTR [bp+4]	;X
	mov	si,ax
	call	_abs
	add	sp,2
	push	WORD PTR [bp+8]	;Z
	mov	di,ax
	call	_abs
	add	sp,2
	add	di,ax
	add	si,di
	mov	WORD PTR [bp-4],si	;D
	cmp	si,1000
	jae	$I822
	mov	ax,WORD PTR _Rp3D
	cmp	WORD PTR _RpCRT,ax
	je	$I822
; Line 395
	mov	ax,si
	mov	cx,10
	sub	dx,dx
	div	cx
	sub	ax,100
	neg	ax
	mov	WORD PTR [bp-2],ax	;R
; Line 396
	cmp	ax,WORD PTR _InXPLO
	jle	$I822
	mov	WORD PTR _InXPLO,ax
; Line 397
$I822:
; Line 399
	mov	ax,18
	imul	WORD PTR [bp+10]	;ID
	mov	bx,ax
	mov	ax,WORD PTR _SMOKES[bx+12]
	mov	WORD PTR [bp-10],ax	;CNT
; Line 400
	mov	WORD PTR [bp-18],0	;i
$FC824:
; Line 401
	cmp	WORD PTR [bp-10],0	;CNT
	jne	$I826
; Line 402
	mov	ax,256
	push	ax
	call	_Rnd2
	add	sp,2
	mov	bx,ax
	and	bx,1
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR _XPLOANIMS[bx+4]
	mov	cx,ax
	mov	ax,18
	imul	WORD PTR [bp+10]	;ID
	mov	bx,ax
	mov	WORD PTR _SMOKES[bx+14],cx
; Line 403
$I826:
	mov	ax,7
	mov	cl,BYTE PTR [bp-10]	;CNT
	and	cx,ax
	sub	ax,cx
	mov	bx,50
	imul	bx
	add	ax,WORD PTR [bp+6]	;Y
	mov	WORD PTR [bp-22],ax
; Line 404
	mov	ax,31
	push	ax
	mov	si,cx
	call	_Rnd2
	add	sp,2
	mov	cx,si
	shl	si,1
	shl	si,1
	add	si,cx
	shl	si,1
	add	ax,si
	mov	cl,BYTE PTR [bp-10]	;CNT
	and	cx,24
	add	ax,cx
	add	ax,WORD PTR [bp+4]	;X
	mov	WORD PTR [bp-24],ax	;XR
; Line 405
	mov	ax,31
	push	ax
	mov	di,cx
	call	_Rnd2
	add	sp,2
	add	ax,si
	add	di,ax
	add	di,WORD PTR [bp+8]	;Z
	mov	WORD PTR [bp-20],di
; Line 406
	mov	ax,OFFSET _Nviewmat
	push	ax
	lea	ax,WORD PTR [bp-24]	;XR
	push	ax
	call	_Rotate
	add	sp,4
; Line 407
	cmp	WORD PTR [bp-20],16
	jge	$JCC2293
	jmp	$L20021
$JCC2293:
; Line 408
	jge	$I829
	mov	WORD PTR [bp-20],16
; Line 409
$I829:
; Line 412
	mov	ax,WORD PTR [bp-20]
	cwd	
	push	dx
	push	ax
	mov	cx,ax
	mov	ax,WORD PTR [bp-24]	;XR
	mov	bx,dx
	cwd	
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	push	dx
	push	ax
	mov	si,cx
	mov	di,bx
	call	__aNldiv
	mov	WORD PTR [bp-24],ax	;XR
; Line 415
	push	di
	push	si
	mov	ax,WORD PTR [bp-22]
	cwd	
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-8],ax	;T
	mov	WORD PTR [bp-6],dx
; Line 416
	mov	WORD PTR [bp-22],ax
; Line 419
	mov	ax,32767
	cwd	
	idiv	WORD PTR [bp-20]
	cwd	
	idiv	WORD PTR [bp+12]	;SCL
	inc	ax
	shl	ax,1
	shl	ax,1
	mov	WORD PTR [bp-26],ax	;size
; Line 420
	sub	cx,cx
	push	cx
	push	ax
	mov	ax,18
	imul	WORD PTR [bp+10]	;ID
	mov	bx,ax
	mov	al,255
	sub	al,BYTE PTR [bp-10]	;CNT
	and	ax,7
	add	ax,WORD PTR _SMOKES[bx+14]
	push	ax
	mov	ax,WORD PTR _GYMID
	add	WORD PTR [bp-22],ax
	push	WORD PTR [bp-22]
	mov	ax,WORD PTR _GXMID
	add	WORD PTR [bp-24],ax	;XR
	push	WORD PTR [bp-24]	;XR
	push	WORD PTR _Rp3D
	call	_DrawXploSprite
	add	sp,12
; Line 421
	cmp	WORD PTR _XPLODETAIL,0
	jne	$L20021
	mov	WORD PTR [bp-18],4	;i
; Line 422
$L20021:
	inc	WORD PTR [bp-18]	;i
	add	WORD PTR [bp-10],2	;CNT
	cmp	WORD PTR [bp-18],4	;i
	jge	$JCC2462
	jmp	$FC824
$JCC2462:
; Line 423
$L20022:
	mov	ax,1
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 424
; Line 427
$I820:
	lea	ax,WORD PTR [bp+8]	;Z
	push	ax
	lea	cx,WORD PTR [bp+6]	;Y
	push	cx
	mov	cx,OFFSET _Nviewmat
	push	cx
	lea	cx,WORD PTR [bp+4]	;X
	push	cx
	call	_Rotate
	add	sp,8
; Line 428
	cmp	WORD PTR [bp+8],16	;Z
	jl	$L20022
; Line 434
	mov	ax,WORD PTR [bp+8]	;Z
	cwd	
	push	dx
	push	ax
	mov	cx,ax
	mov	ax,WORD PTR [bp+4]	;X
	mov	bx,dx
	cwd	
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	push	dx
	push	ax
	mov	si,cx
	mov	di,bx
	call	__aNldiv
	mov	WORD PTR [bp+4],ax	;X
; Line 437
	push	di
	push	si
	mov	ax,WORD PTR [bp+6]	;Y
	cwd	
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-8],ax	;T
	mov	WORD PTR [bp-6],dx
; Line 438
	mov	WORD PTR [bp+6],ax	;Y
; Line 440
	mov	ax,WORD PTR _GXMID
	add	WORD PTR [bp+4],ax	;X
; Line 441
	mov	ax,WORD PTR _GYMID
	add	WORD PTR [bp+6],ax	;Y
; Line 443
	mov	ax,32767
	cwd	
	idiv	WORD PTR [bp+8]	;Z
	cwd	
	idiv	WORD PTR [bp+12]	;SCL
	inc	ax
	shl	ax,1
	shl	ax,1
	mov	WORD PTR [bp-26],ax	;size
; Line 444
	mov	ax,18
	imul	WORD PTR [bp+10]	;ID
	mov	bx,ax
	mov	ax,WORD PTR _SMOKES[bx+10]
	jmp	$S832
; Line 448
$SC837:
; Line 449
	push	WORD PTR _vRoll
	push	WORD PTR [bp-26]	;size
	jmp	SHORT $L20024
; Line 451
	nop	
$SC838:
; Line 452
	sub	ax,ax
	push	ax
$L20025:
	mov	ax,WORD PTR [bp-26]	;size
	sar	ax,1
	jmp	SHORT $L20023
; Line 454
$SC839:
; Line 455
	cmp	WORD PTR _MISSILETRAIL,0
	jne	$JCC2637
	jmp	$SB833
$JCC2637:
; Line 456
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR [bp-26]	;size
	sar	ax,1
	sar	ax,1
	push	ax
	mov	ax,18
	imul	WORD PTR [bp+10]	;ID
	mov	bx,ax
	mov	al,BYTE PTR _SMOKES[bx+16]
	and	ax,3
	add	ax,WORD PTR _SMOKES[bx+14]
	jmp	SHORT $L20027
; Line 458
$SC841:
; Line 459
	push	WORD PTR _vRoll
	jmp	SHORT $L20026
; Line 461
$SC836:
; Line 446
	sub	ax,ax
	push	ax
$L20026:
	mov	ax,WORD PTR [bp-26]	;size
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	cx,ax
	shl	ax,1
	add	ax,cx
$L20023:
	push	ax
$L20024:
	mov	ax,18
	imul	WORD PTR [bp+10]	;ID
	mov	bx,ax
	mov	ax,WORD PTR _SMOKES[bx+14]
	add	ax,WORD PTR _SMOKES[bx+16]
$L20027:
	push	ax
	push	WORD PTR [bp+6]	;Y
	push	WORD PTR [bp+4]	;X
	push	WORD PTR _Rp3D
	call	_DrawXploSprite
	add	sp,12
; Line 447
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	
$SC844:
; Line 468
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR [bp-26]	;size
	mov	cx,5
	cwd	
	idiv	cx
	jmp	SHORT $L20023
; Line 470
$SC845:
; Line 471
	push	WORD PTR _vRoll
	jmp	$L20025
	nop	
$S832:
	cmp	ax,9
	ja	$SB833
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20006[bx]
	nop	
$L20006:
		DW	$SC836
		DW	$SC837
		DW	$SC838
		DW	$SB833
		DW	$SC841
		DW	$SC836
		DW	$SB833
		DW	$SC844
		DW	$SC845
		DW	$SC839
$SB833:
; Line 474
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_DrawASmoke	ENDP
; Line 478
	PUBLIC	_ShowSmokesNoChange
_ShowSmokesNoChange	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,122
	call	__aNchkstk
	push	si
;	i = -122
;	OLDUP = -120
;	OLDCNT = -60
;	ViewZ = 12
;	ViewY = 8
;	ViewX = 4
; Line 483
	mov	WORD PTR [bp-122],0	;i
$FC855:
; Line 484
	mov	ax,18
	imul	WORD PTR [bp-122]	;i
	mov	bx,ax
	mov	ax,WORD PTR _SMOKES[bx+16]
	mov	si,WORD PTR [bp-122]	;i
	shl	si,1
	mov	WORD PTR [bp-120][si],ax
; Line 485
	mov	ax,WORD PTR _SMOKES[bx+12]
	mov	WORD PTR [bp-60][si],ax
; Line 486
	inc	WORD PTR [bp-122]	;i
	cmp	WORD PTR [bp-122],30	;i
	jl	$FC855
; Line 488
	push	WORD PTR [bp+12]	;ViewZ
	push	WORD PTR [bp+10]
	push	WORD PTR [bp+8]	;ViewY
	push	WORD PTR [bp+6]
	push	WORD PTR [bp+4]	;ViewX
	call	_HandleSmoke
	add	sp,10
; Line 490
	mov	WORD PTR [bp-122],0	;i
$FC859:
; Line 491
	mov	ax,18
	imul	WORD PTR [bp-122]	;i
	mov	bx,ax
	mov	si,WORD PTR [bp-122]	;i
	shl	si,1
	mov	ax,WORD PTR [bp-120][si]
	mov	WORD PTR _SMOKES[bx+16],ax
; Line 492
	mov	ax,WORD PTR [bp-60][si]
	mov	WORD PTR _SMOKES[bx+12],ax
; Line 493
	inc	WORD PTR [bp-122]	;i
	cmp	WORD PTR [bp-122],30	;i
	jl	$FC859
; Line 494
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_ShowSmokesNoChange	ENDP
; Line 498
	PUBLIC	_HandleSmoke
_HandleSmoke	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
	push	si
;	i = -14
;	Y = -12
;	X = -10
;	Z = -18
;	V = -6
;	ViewZ = 12
;	ViewY = 8
;	ViewX = 4
; Line 503
	mov	WORD PTR [bp-14],0	;i
	jmp	$F870
$I874:
; Line 520
	cmp	WORD PTR _ABOVECLOUDS,0
	je	$I881
	mov	ax,18
	imul	WORD PTR [bp-14]	;i
	mov	bx,ax
	cmp	WORD PTR _SMOKES[bx+10],0
	je	$I881
	cmp	WORD PTR _SMOKES[bx+10],5
	je	$I881
	cmp	WORD PTR _SMOKES[bx+10],2
	je	$I881
	cmp	WORD PTR _SMOKES[bx+10],9
	jne	$I880
$I881:
; Line 521
	mov	ax,80
	push	ax
	mov	ax,1
	push	ax
	push	WORD PTR [bp-14]	;i
	push	WORD PTR [bp-18]	;Z
	push	WORD PTR [bp-12]	;Y
	push	WORD PTR [bp-10]	;X
	sub	ax,ax
	push	ax
	call	_Stack3Dobject
	add	sp,14
; Line 522
$I880:
; Line 525
	mov	ax,18
	imul	WORD PTR [bp-14]	;i
	mov	bx,ax
	mov	ax,WORD PTR _SMOKES[bx+10]
	or	ax,ax
	je	$SC887
	dec	ax
	jne	$JCC3025
	jmp	$SC889
$JCC3025:
	dec	ax
	dec	ax
	jne	$JCC3032
	jmp	$SC895
$JCC3032:
	sub	ax,3
	jne	$JCC3040
	jmp	$SC893
$JCC3040:
	dec	ax
	dec	ax
	jne	$JCC3047
	jmp	$SC897
$JCC3047:
	jmp	SHORT $SB884
; Line 526
$SC887:
; Line 527
	mov	ax,18
	imul	WORD PTR [bp-14]	;i
	mov	bx,ax
	cmp	WORD PTR _SMOKES[bx+16],3
	jae	$SB884
; Line 528
	mov	ax,20
	push	ax
	mov	ax,5
	push	ax
	mov	ax,127
	push	ax
	mov	si,bx
	call	_Rnd2
	add	sp,2
	cwd	
	add	ax,WORD PTR _SMOKES[si+6]
	adc	dx,WORD PTR _SMOKES[si+8]
	push	dx
	push	ax
	mov	ax,127
	push	ax
	call	_Rnd2
	add	sp,2
	add	ax,WORD PTR _SMOKES[si+4]
	push	ax
	mov	ax,127
	push	ax
	call	_Rnd2
	add	sp,2
	cwd	
	add	ax,WORD PTR _SMOKES[si]
	adc	dx,WORD PTR _SMOKES[si+2]
	push	dx
	push	ax
$L20031:
	call	_StartASmoke
	add	sp,14
; Line 529
$SB884:
; Line 552
	mov	ax,18
	imul	WORD PTR [bp-14]	;i
	mov	bx,ax
	inc	WORD PTR _SMOKES[bx+16]
; Line 553
	dec	WORD PTR _SMOKES[bx+12]
; Line 554
; Line 555
$FC871:
	inc	WORD PTR [bp-14]	;i
$F870:
	cmp	WORD PTR [bp-14],30	;i
	jl	$JCC3165
	jmp	$FB872
$JCC3165:
; Line 504
	mov	ax,18
	imul	WORD PTR [bp-14]	;i
	mov	bx,ax
	cmp	WORD PTR _SMOKES[bx+12],0
	jle	$FC871
; Line 505
	mov	ax,WORD PTR _SMOKES[bx]
	mov	dx,WORD PTR _SMOKES[bx+2]
	sub	ax,WORD PTR [bp+4]	;ViewX
	sbb	dx,WORD PTR [bp+6]
	mov	WORD PTR [bp-10],ax	;X
	mov	WORD PTR [bp-8],dx
; Line 506
	mov	cx,WORD PTR _SMOKES[bx+4]
	sub	cx,WORD PTR [bp+12]	;ViewZ
	mov	WORD PTR [bp-12],cx	;Y
; Line 507
	mov	cx,WORD PTR _SMOKES[bx+6]
	mov	si,WORD PTR _SMOKES[bx+8]
	add	cx,WORD PTR [bp+8]	;ViewY
	adc	si,WORD PTR [bp+10]
	sub	cx,0
	sbb	si,16
	mov	WORD PTR [bp-18],cx	;Z
	mov	WORD PTR [bp-16],si
; Line 508
	push	dx
	push	ax
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$L20008
	jl	$L20007
	cmp	ax,8192
	ja	$L20008
$L20007:
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;Z
	call	_labs
	add	sp,4
	or	dx,dx
	jge	$JCC3274
	jmp	$I874
$JCC3274:
	jg	$L20008
	cmp	ax,8192
	ja	$JCC3284
	jmp	$I874
$JCC3284:
$L20008:
; Line 509
	push	WORD PTR [bp-8]
	push	WORD PTR [bp-10]	;X
	call	_labs
	add	sp,4
	or	dx,dx
	jle	$JCC3303
	jmp	$I880
$JCC3303:
	jl	$L20009
	cmp	ax,12288
	jb	$JCC3313
	jmp	$I880
$JCC3313:
$L20009:
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;Z
	call	_labs
	add	sp,4
	or	dx,dx
	jle	$JCC3332
	jmp	$I880
$JCC3332:
	jl	$L20010
	cmp	ax,12288
	jb	$JCC3342
	jmp	$I880
$JCC3342:
$L20010:
; Line 513
	cmp	WORD PTR _ABOVECLOUDS,0
	je	$I878
	mov	ax,18
	imul	WORD PTR [bp-14]	;i
	mov	bx,ax
	cmp	WORD PTR _SMOKES[bx+10],0
	je	$I878
	cmp	WORD PTR _SMOKES[bx+10],5
	je	$I878
	cmp	WORD PTR _SMOKES[bx+10],2
	je	$I878
	cmp	WORD PTR _SMOKES[bx+10],9
	je	$JCC3388
	jmp	$I880
$JCC3388:
$I878:
; Line 514
	mov	ax,1
	push	ax
	push	WORD PTR [bp-14]	;i
	push	WORD PTR [bp-18]	;Z
	push	WORD PTR [bp-12]	;Y
	push	WORD PTR [bp-10]	;X
	call	_DrawASmoke
	add	sp,10
; Line 515
; Line 516
	jmp	$I880
; Line 530
$SC889:
; Line 531
	mov	ax,18
	imul	WORD PTR [bp-14]	;i
	mov	bx,ax
	cmp	WORD PTR _SMOKES[bx+12],4
	jge	$I891
; Line 532
	mov	ax,255
	push	ax
	mov	si,bx
	call	_Rnd2
	add	sp,2
	test	al,3
	je	$I891
; Line 533
	mov	ax,20
	push	ax
	mov	ax,4
	push	ax
	push	WORD PTR _SMOKES[si+8]
	push	WORD PTR _SMOKES[si+6]
	push	WORD PTR _SMOKES[si+4]
	push	WORD PTR _SMOKES[si+2]
	push	WORD PTR _SMOKES[si]
	call	_StartASmoke
	add	sp,14
; Line 534
$I891:
	mov	ax,18
	imul	WORD PTR [bp-14]	;i
	mov	bx,ax
	cmp	WORD PTR _SMOKES[bx+12],1
	je	$JCC3496
	jmp	$SB884
$JCC3496:
; Line 535
	mov	ax,2000
	push	ax
	mov	ax,3
	jmp	$L20032
; Line 537
	nop	
$SC893:
; Line 538
	mov	ax,18
	imul	WORD PTR [bp-14]	;i
	mov	bx,ax
	cmp	WORD PTR _SMOKES[bx+16],15
	jb	$JCC3525
	jmp	$SB884
$JCC3525:
; Line 539
	mov	ax,20
	push	ax
	mov	ax,7
	push	ax
	mov	ax,255
	push	ax
	mov	si,bx
	call	_Rnd2
	add	sp,2
	cwd	
	mov	cx,WORD PTR _SMOKES[si+6]
	mov	bx,WORD PTR _SMOKES[si+8]
	sub	cx,ax
	sbb	bx,dx
	add	cx,127
	adc	bx,0
	push	bx
	push	cx
	push	WORD PTR _SMOKES[si+4]
	mov	ax,255
	push	ax
	call	_Rnd2
	add	sp,2
	cwd	
	mov	cx,WORD PTR _SMOKES[si]
	mov	bx,WORD PTR _SMOKES[si+2]
	sub	cx,ax
	sbb	bx,dx
	add	cx,127
	adc	bx,0
	push	bx
	push	cx
	jmp	$L20031
; Line 541
	nop	
$SC895:
; Line 542
	mov	ax,255
	push	ax
	call	_Rnd2
	add	sp,2
	mov	cx,ax
	mov	ax,18
	imul	WORD PTR [bp-14]	;i
	mov	bx,ax
	mov	al,BYTE PTR _SMOKES[bx+12]
	add	al,cl
	test	al,60
	je	$JCC3638
	jmp	$SB884
$JCC3638:
; Line 543
	mov	ax,20
	push	ax
	mov	ax,4
$L20032:
	push	ax
	push	WORD PTR _SMOKES[bx+8]
	push	WORD PTR _SMOKES[bx+6]
	push	WORD PTR _SMOKES[bx+4]
	push	WORD PTR _SMOKES[bx+2]
	push	WORD PTR _SMOKES[bx]
	jmp	$L20031
; Line 545
$SC897:
; Line 546
	mov	ax,18
	imul	WORD PTR [bp-14]	;i
	mov	bx,ax
	cmp	WORD PTR _SMOKES[bx+12],4
	jl	$JCC3687
	jmp	$SB884
$JCC3687:
; Line 547
	mov	ax,255
	push	ax
	mov	si,bx
	call	_Rnd2
	add	sp,2
	test	al,31
	je	$JCC3706
	jmp	$SB884
$JCC3706:
; Line 548
	mov	ax,20
	push	ax
	mov	ax,4
	push	ax
	push	WORD PTR _SMOKES[si+8]
	push	WORD PTR _SMOKES[si+6]
	push	WORD PTR _SMOKES[si+4]
	push	WORD PTR _SMOKES[si+2]
	push	WORD PTR _SMOKES[si]
	jmp	$L20031
$FB872:
; Line 556
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_HandleSmoke	ENDP
_TEXT	ENDS
END
