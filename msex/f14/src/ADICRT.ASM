;	Static Name Aliases
;
;	$S1336_pos	EQU	pos
;	$S1337_t1	EQU	t1
;	$S1340_ypos	EQU	ypos
;	$S1341_ypos2	EQU	ypos2
	TITLE   C:\ADICRT.C
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
EXTRN	_MapInEMSSprite:NEAR
EXTRN	_DrawPoly:FAR
EXTRN	_TransRectCopy:NEAR
EXTRN	_RectFill:FAR
EXTRN	_rotate_pt:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_RpCRT:WORD
EXTRN	_OurRoll:WORD
EXTRN	_OurPitch:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
_DATA      SEGMENT
$S1340_ypos	DW	0ffe2H
$S1341_ypos2	DW	0fff6H
_DATA      ENDS
_BSS      SEGMENT
$S1336_pos	DW 01H DUP (?)
$S1337_t1	DW 01H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 2
; Line 3
; Line 5
; Line 19
; Line 6
; Line 7
; Line 8
; Line 9
; Line 10
; Line 11
; Line 12
; Line 31
	PUBLIC	_AdiCrt
_AdiCrt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,82
	call	__aNchkstk
	push	si
;	p3 = -22
;	p4 = -40
;	p5 = -42
;	p6 = -44
;	p7 = -62
;	p8 = -64
;	x1 = -68
;	x2 = -72
;	y1 = -70
;	y2 = -78
;	i = -66
;	basedeg = -76
;	pts = -60
;	a = -16
;	t = -38
;	mseg = -80
;	xpos = -74
;	xpos2 = -82
;	p1 = -18
;	p2 = -20
;	CrtNr = 4
; Line 35
	mov	WORD PTR [bp-82],25	;xpos2
; Line 48
	mov	ax,10
	mov	WORD PTR [bp-14],ax
	mov	WORD PTR [bp-10],ax
; Line 49
	mov	ax,15
	mov	WORD PTR [bp-12],ax
	mov	WORD PTR [bp-8],ax
; Line 50
	mov	ax,-15
	mov	WORD PTR [bp-16],ax	;a
	mov	WORD PTR [bp-4],ax
; Line 56
	sub	ax,ax
	mov	WORD PTR [bp-74],ax	;xpos
	mov	WORD PTR [bp-6],ax
	mov	WORD PTR [bp-2],ax
	mov	WORD PTR [bp-38],ax	;t
	mov	WORD PTR [bp-36],ax
	mov	WORD PTR [bp-34],ax
	mov	WORD PTR [bp-32],ax
	mov	WORD PTR [bp-30],ax
	mov	WORD PTR [bp-28],ax
	mov	WORD PTR [bp-26],ax
	mov	WORD PTR [bp-24],ax
	push	ax
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+8]
	inc	ax
	push	ax
	mov	ax,WORD PTR [bx+6]
	inc	ax
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	push	bx
	call	FAR PTR _RectFill
	add	sp,12
; Line 58
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR [bp-80],ax	;mseg
	or	ax,ax
	je	$I1361
; Line 59
	sub	cx,cx
	push	cx
	mov	cx,140
	push	cx
	mov	cx,227
	push	cx
	push	WORD PTR _RpCRT
	mov	cx,21
	push	cx
	mov	cx,24
	push	cx
	mov	cx,35
	push	cx
	mov	cx,37
	push	cx
	push	ax
	call	_TransRectCopy
	add	sp,18
; Line 60
; Line 62
$I1361:
; Line 64
	mov	ax,WORD PTR _OurPitch
	mov	cx,182
	cwd	
	idiv	cx
	mov	WORD PTR [bp-76],ax	;basedeg
	or	ax,ax
	jle	$I1363
; Line 65
	add	WORD PTR [bp-6],ax
; Line 66
	add	WORD PTR [bp-2],ax
; Line 67
; Line 68
$I1363:
	or	ax,ax
	jge	$I1364
; Line 69
	add	WORD PTR [bp-6],ax
; Line 70
	add	WORD PTR [bp-2],ax
; Line 71
; Line 74
$I1364:
	mov	WORD PTR [bp-66],0	;i
$FC1366:
; Line 75
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-66]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-60][si]
	push	ax
	lea	ax,WORD PTR [bp-16][si]
	push	ax
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-66]	;i
	cmp	WORD PTR [bp-66],4	;i
	jl	$FC1366
; Line 77
	mov	ax,WORD PTR [bp-60]	;pts
	add	ax,13
	mov	WORD PTR [bp-38],ax	;t
; Line 78
	mov	ax,WORD PTR [bp-58]
	add	ax,13
	mov	WORD PTR [bp-36],ax
; Line 79
	mov	ax,WORD PTR [bp-56]
	add	ax,13
	mov	WORD PTR [bp-34],ax
; Line 80
	mov	ax,WORD PTR [bp-54]
	add	ax,13
	mov	WORD PTR [bp-32],ax
; Line 81
	mov	ax,WORD PTR [bp-52]
	add	ax,13
	mov	WORD PTR [bp-30],ax
; Line 82
	mov	ax,WORD PTR [bp-50]
	add	ax,13
	mov	WORD PTR [bp-28],ax
; Line 83
	mov	ax,WORD PTR [bp-48]
	add	ax,13
	mov	WORD PTR [bp-26],ax
; Line 84
	mov	ax,WORD PTR [bp-46]
	add	ax,13
	mov	WORD PTR [bp-24],ax
; Line 86
	sub	ax,ax
	push	ax
	lea	cx,WORD PTR [bp-38]	;t
	push	cx
	mov	cx,4
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawPoly
	add	sp,8
; Line 88
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR [bp-80],ax	;mseg
	or	ax,ax
	je	$I1369
; Line 89
	sub	cx,cx
	push	cx
	mov	cx,150
	push	cx
	mov	cx,235
	push	cx
	push	WORD PTR _RpCRT
	mov	cx,10
	push	cx
	mov	cx,8
	push	cx
	mov	cx,35
	push	cx
	mov	cx,66
	push	cx
	push	ax
	call	_TransRectCopy
	add	sp,18
; Line 90
; Line 92
$I1369:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_AdiCrt	ENDP
_TEXT	ENDS
END
