;	Static Name Aliases
;
;	$S744_s	EQU	s
;	$S773_color	EQU	color
	TITLE   C:\HSD.C
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
PUBLIC  _hsdmode
EXTRN	_pstrlen:NEAR
EXTRN	_DrawLine:FAR
EXTRN	_sprintf:NEAR
EXTRN	_DrawDot:FAR
EXTRN	_RpPrint:FAR
EXTRN	_TAStoIAS:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_draw_circle:NEAR
EXTRN	_RectFill:FAR
EXTRN	_ARCTAN:NEAR
EXTRN	_abs:NEAR
EXTRN	_Rotate2D:NEAR
EXTRN	_MDiv:NEAR
EXTRN	_Dist2D:NEAR
EXTRN	_rng:NEAR
EXTRN	_itoa:NEAR
EXTRN	_labs:NEAR
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Txt:BYTE
EXTRN	_Damaged:WORD
EXTRN	_AutoHead:WORD
EXTRN	_wps:BYTE
EXTRN	_NextWayPoint:WORD
EXTRN	_RpCRT:WORD
EXTRN	_GRPAGE0:BYTE
EXTRN	_Px:WORD
EXTRN	_Py:WORD
EXTRN	_OurHead:WORD
EXTRN	_OurRoll:WORD
EXTRN	_Knots:WORD
EXTRN	_PxLng:DWORD
EXTRN	_PyLng:DWORD
_DATA      SEGMENT
	ORG	$+2
$SG699	DB	'0',  00H
$SG796	DB	'WPD %d',  00H
$SG797	DB	'TAS%d',  00H
$SG799	DB	'GS%d',  00H
$SG800	DB	'N',  00H
$SG801	DB	'E',  00H
$SG802	DB	'W',  00H
$SG803	DB	'S',  00H
$SG804	DB	'3',  00H
$SG805	DB	'30',  00H
$SG806	DB	'12',  00H
$SG807	DB	'21',  00H
$SG808	DB	'6',  00H
$SG809	DB	'33',  00H
$SG810	DB	'15',  00H
$SG811	DB	'24',  00H
	ORG	$-52
_hsdmode	DW	00H
	ORG	$+50
$S773_color	DW	08H
_DATA      ENDS
_BSS      SEGMENT
$S744_s	DB 03H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 19
; Line 3
; Line 4
; Line 5
; Line 6
; Line 7
; Line 29
	PUBLIC	_scaley
_scaley	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	y = 4
; Line 30
	mov	ax,WORD PTR [bp+4]	;y
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,cx
	shl	ax,1
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
; Line 31
	mov	sp,bp
	pop	bp
	ret	
	nop	

_scaley	ENDP
; Line 33
	PUBLIC	_fourpoints
_fourpoints	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	color = 12
;	y = 10
;	x = 8
;	screen = 4
; Line 34
	mov	al,BYTE PTR [bp+12]	;color
	les	bx,DWORD PTR [bp+4]	;screen
	add	bx,WORD PTR [bp+8]	;x
	mov	si,WORD PTR [bp+10]	;y
	mov	BYTE PTR es:[bx][si],al
; Line 35
	les	bx,DWORD PTR [bp+4]	;screen
	sub	bx,si
	mov	di,WORD PTR [bp+8]	;x
	mov	BYTE PTR es:[bx][di],al
; Line 36
	mov	cx,bx
	mov	dx,es
	les	bx,DWORD PTR [bp+4]	;screen
	sub	bx,di
	mov	BYTE PTR es:[bx][si],al
; Line 37
	mov	es,dx
	mov	bx,cx
	sub	bx,di
	mov	BYTE PTR es:[bx],al
; Line 38
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_fourpoints	ENDP
; Line 40
	PUBLIC	_circlepoints
_circlepoints	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	color = 16
;	oy = 14
;	ox = 12
;	y = 10
;	x = 8
;	screen = 4
; Line 42
	push	WORD PTR [bp+16]	;color
	mov	ax,WORD PTR [bp+10]	;y
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,cx
	shl	ax,1
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	cx,320
	imul	cx
	push	ax
	push	WORD PTR [bp+8]	;x
	mov	ax,cx
	imul	WORD PTR [bp+14]	;oy
	add	ax,WORD PTR [bp+12]	;ox
	add	WORD PTR [bp+4],ax	;screen
	mov	ax,WORD PTR [bp+4]	;screen
	mov	dx,WORD PTR [bp+6]
	push	dx
	push	ax
	call	_fourpoints
	mov	sp,bp
; Line 43
	push	WORD PTR [bp+16]	;color
	mov	ax,WORD PTR [bp+8]	;x
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,cx
	shl	ax,1
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	cx,320
	imul	cx
	push	ax
	push	WORD PTR [bp+10]	;y
	push	WORD PTR [bp+6]
	push	WORD PTR [bp+4]	;screen
	call	_fourpoints
; Line 44
	mov	sp,bp
	pop	bp
	ret	
	nop	

_circlepoints	ENDP
; Line 46
	PUBLIC	_drawcircle
_drawcircle	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
;	x = -4
;	y = -8
;	d = -2
;	de = -6
;	dse = -10
;	color = 14
;	radius = 12
;	oy = 10
;	ox = 8
;	screen = 4
; Line 49
	mov	ax,WORD PTR [bp+12]	;radius
	mov	WORD PTR [bp-8],ax	;y
; Line 50
	dec	ax
	neg	ax
	mov	WORD PTR [bp-2],ax	;d
; Line 51
	mov	WORD PTR [bp-6],3	;de
; Line 52
	mov	ax,WORD PTR [bp+12]	;radius
	shl	ax,1
	sub	ax,5
	neg	ax
	mov	WORD PTR [bp-10],ax	;dse
; Line 54
	push	WORD PTR [bp+14]	;color
	push	WORD PTR [bp+10]	;oy
	push	WORD PTR [bp+8]	;ox
	push	WORD PTR [bp+12]	;radius
	sub	ax,ax
	mov	WORD PTR [bp-4],ax	;x
	push	ax
	jmp	SHORT $L20013
	nop	
$FC673:
; Line 56
	add	WORD PTR [bp-6],2	;de
	add	WORD PTR [bp-10],2	;dse
; Line 57
	cmp	WORD PTR [bp-2],0	;d
	jge	$I675
; Line 58
	mov	ax,WORD PTR [bp-6]	;de
	add	WORD PTR [bp-2],ax	;d
; Line 59
	push	WORD PTR [bp+14]	;color
	push	WORD PTR [bp+10]	;oy
	push	WORD PTR [bp+8]	;ox
	push	WORD PTR [bp-8]	;y
	jmp	SHORT $L20014
$I675:
; Line 62
	mov	ax,WORD PTR [bp-10]	;dse
	add	WORD PTR [bp-2],ax	;d
; Line 63
	add	WORD PTR [bp-10],2	;dse
; Line 64
	push	WORD PTR [bp+14]	;color
	push	WORD PTR [bp+10]	;oy
	push	WORD PTR [bp+8]	;ox
	push	WORD PTR [bp-8]	;y
	dec	WORD PTR [bp-8]	;y
$L20014:
	push	WORD PTR [bp-4]	;x
$L20013:
	push	WORD PTR [bp+6]
	push	WORD PTR [bp+4]	;screen
	call	_circlepoints
	add	sp,14
; Line 65
; Line 66
	mov	ax,WORD PTR [bp-4]	;x
	inc	WORD PTR [bp-4]	;x
	cmp	ax,WORD PTR [bp-8]	;y
	jl	$FC673
; Line 67
	mov	sp,bp
	pop	bp
	ret	
	nop	

_drawcircle	ENDP
; Line 70
	PUBLIC	_pitchbar
_pitchbar	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	x = -2
;	y = -4
;	x2 = -6
;	y2 = -8
;	oy = 10
;	ox = 8
;	dist = 6
;	w = 4
; Line 73
	lea	ax,WORD PTR [bp-4]	;y
	push	ax
	lea	cx,WORD PTR [bp-2]	;x
	push	cx
	push	WORD PTR _OurRoll
	push	WORD PTR [bp+6]	;dist
	push	WORD PTR [bp+4]	;w
	call	_Rotate2D
	add	sp,10
; Line 74
	mov	ax,22
	imul	WORD PTR [bp-2]	;x
	mov	cx,30
	cwd	
	idiv	cx
	mov	WORD PTR [bp-2],ax	;x
; Line 76
	mov	ax,22
	imul	WORD PTR [bp-4]	;y
	cwd	
	idiv	cx
	mov	WORD PTR [bp-4],ax	;y
	push	ax
	call	_scaley
	add	sp,2
	mov	WORD PTR [bp-4],ax	;y
; Line 77
	lea	ax,WORD PTR [bp-8]	;y2
	push	ax
	lea	cx,WORD PTR [bp-6]	;x2
	push	cx
	push	WORD PTR _OurRoll
	push	WORD PTR [bp+6]	;dist
	mov	dx,WORD PTR [bp+4]	;w
	neg	dx
	push	dx
	call	_Rotate2D
	add	sp,10
; Line 78
	mov	ax,22
	imul	WORD PTR [bp-6]	;x2
	mov	cx,30
	cwd	
	idiv	cx
	mov	WORD PTR [bp-6],ax	;x2
; Line 80
	mov	ax,22
	imul	WORD PTR [bp-8]	;y2
	cwd	
	idiv	cx
	mov	WORD PTR [bp-8],ax	;y2
	push	ax
	call	_scaley
	add	sp,2
	mov	WORD PTR [bp-8],ax	;y2
; Line 81
	mov	ax,15
	push	ax
	mov	ax,WORD PTR [bp+10]	;oy
	add	ax,WORD PTR [bp-8]	;y2
	push	ax
	mov	ax,WORD PTR [bp+8]	;ox
	add	ax,WORD PTR [bp-6]	;x2
	push	ax
	mov	ax,WORD PTR [bp+10]	;oy
	add	ax,WORD PTR [bp-4]	;y
	push	ax
	mov	ax,WORD PTR [bp+8]	;ox
	add	ax,WORD PTR [bp-2]	;x
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
; Line 82
	mov	sp,bp
	pop	bp
	ret	
	nop	

_pitchbar	ENDP
; Line 84
	PUBLIC	_pitchnum
_pitchnum	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	x = -2
;	y = -4
;	oy = 14
;	ox = 12
;	off = 10
;	dist = 8
;	pitch = 6
;	w = 4
; Line 87
	mov	ax,WORD PTR [bp+6]	;pitch
	sub	ax,WORD PTR [bp+8]	;dist
	sub	ax,WORD PTR [bp+10]	;off
	push	ax
	call	_abs
	add	sp,2
	mov	cx,10
	cwd	
	idiv	cx
	mov	WORD PTR [bp-2],ax	;x
; Line 88
	cmp	ax,8
	jle	$I698
	mov	cx,8
	cwd	
	idiv	cx
	sub	dx,9
	neg	dx
	mov	WORD PTR [bp-2],dx	;x
; Line 89
$I698:
	mov	ax,10
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR [bp-2]	;x
	call	_itoa
	add	sp,6
; Line 90
	lea	ax,WORD PTR [bp-4]	;y
	push	ax
	lea	cx,WORD PTR [bp-2]	;x
	push	cx
	push	WORD PTR _OurRoll
	mov	dx,WORD PTR [bp+8]	;dist
	add	dx,WORD PTR [bp+10]	;off
	push	dx
	push	WORD PTR [bp+4]	;w
	mov	si,dx
	call	_Rotate2D
	add	sp,10
; Line 91
	mov	ax,22
	imul	WORD PTR [bp-2]	;x
	mov	cx,30
	cwd	
	idiv	cx
	mov	WORD PTR [bp-2],ax	;x
; Line 93
	mov	ax,OFFSET DGROUP:$SG699
	push	ax
	mov	ax,22
	imul	WORD PTR [bp-4]	;y
	cwd	
	idiv	cx
	mov	WORD PTR [bp-4],ax	;y
	push	ax
	call	_scaley
	add	sp,2
	add	ax,WORD PTR [bp+14]	;oy
	dec	ax
	push	ax
	mov	ax,WORD PTR [bp-2]	;x
	add	ax,WORD PTR [bp+12]	;ox
	dec	ax
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 94
	lea	ax,WORD PTR [bp-4]	;y
	push	ax
	lea	cx,WORD PTR [bp-2]	;x
	push	cx
	push	WORD PTR _OurRoll
	push	si
	mov	dx,WORD PTR [bp+4]	;w
	neg	dx
	push	dx
	call	_Rotate2D
	add	sp,10
; Line 95
	mov	ax,22
	imul	WORD PTR [bp-2]	;x
	mov	cx,30
	cwd	
	idiv	cx
	mov	WORD PTR [bp-2],ax	;x
; Line 96
	mov	ax,22
	imul	WORD PTR [bp-4]	;y
	cwd	
	idiv	cx
	mov	WORD PTR [bp-4],ax	;y
; Line 97
	cmp	BYTE PTR _Txt,49
	jne	$I700
	add	WORD PTR [bp-2],2	;x
; Line 98
$I700:
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR [bp-4]	;y
	call	_scaley
	add	sp,2
	add	ax,WORD PTR [bp+14]	;oy
	dec	ax
	push	ax
	mov	ax,WORD PTR [bp-2]	;x
	add	ax,WORD PTR [bp+12]	;ox
	dec	ax
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 99
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_pitchnum	ENDP
; Line 102
	PUBLIC	_scaler
_scaler	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	x = 4
	mov	ax,22
	imul	WORD PTR [bp+4]	;x
	mov	cx,30
	cwd	
	idiv	cx
	mov	sp,bp
	pop	bp
	ret	

_scaler	ENDP
; Line 104
	PUBLIC	_pitchbar2
_pitchbar2	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__aNchkstk
	push	di
	push	si
;	x1 = -14
;	y1 = -18
;	x2 = -16
;	y2 = -22
;	x3 = -20
;	y3 = -24
;	a = -4
;	b = -6
;	c = -8
;	d = -12
;	p = -2
;	t = -10
;	text = 16
;	dir = 14
;	oy = 12
;	ox = 10
;	dist = 8
;	pitch = 6
;	w = 4
; Line 105
	cmp	WORD PTR [bp+14],1	;dir
	sbb	ax,ax
	and	ax,8
	add	ax,-4
	mov	WORD PTR [bp-18],ax	;y1
	mov	ax,WORD PTR [bp+4]	;w
	mov	WORD PTR [bp-14],ax	;x1
	mov	WORD PTR [bp-16],ax	;x2
	mov	WORD PTR [bp-20],6	;x3
	sub	ax,ax
	mov	WORD PTR [bp-22],ax	;y2
	mov	WORD PTR [bp-24],ax	;y3
; Line 106
	push	WORD PTR [bp+16]	;text
	push	WORD PTR _RpCRT
	call	_pstrlen
	add	sp,4
	cwd	
	sub	ax,dx
	sar	ax,1
	dec	ax
	mov	WORD PTR [bp-10],ax	;t
; Line 108
	lea	ax,WORD PTR [bp-6]	;b
	push	ax
	lea	cx,WORD PTR [bp-4]	;a
	push	cx
	push	WORD PTR _OurRoll
	push	WORD PTR [bp+8]	;dist
	sub	dx,dx
	push	dx
	call	_Rotate2D
	add	sp,10
; Line 109
	push	WORD PTR [bp-4]	;a
	call	_scaler
	add	sp,2
	add	WORD PTR [bp+10],ax	;ox
; Line 110
	push	WORD PTR [bp-6]	;b
	call	_scaler
	add	sp,2
	push	ax
	call	_scaley
	add	sp,2
	add	WORD PTR [bp+12],ax	;oy
; Line 112
	cmp	WORD PTR [bp+14],1	;dir
	sbb	ax,ax
	and	ax,2
	add	ax,-1
	imul	WORD PTR [bp+6]	;pitch
	mov	cx,91
	imul	cx
	mov	WORD PTR [bp-2],ax	;p
; Line 113
	lea	cx,WORD PTR [bp-6]	;b
	push	cx
	lea	dx,WORD PTR [bp-4]	;a
	push	dx
	push	ax
	push	WORD PTR [bp-18]	;y1
	mov	bx,WORD PTR [bp-14]	;x1
	add	bx,8
	push	bx
	mov	si,ax
	call	_Rotate2D
	add	sp,10
; Line 114
	lea	ax,WORD PTR [bp-12]	;d
	push	ax
	lea	cx,WORD PTR [bp-8]	;c
	push	cx
	push	WORD PTR _OurRoll
	push	WORD PTR [bp-6]	;b
	push	WORD PTR [bp-4]	;a
	call	_Rotate2D
	add	sp,10
; Line 115
	push	WORD PTR [bp-8]	;c
	call	_scaler
	add	sp,2
	mov	WORD PTR [bp-8],ax	;c
; Line 116
	push	WORD PTR [bp-12]	;d
	call	_scaler
	add	sp,2
	mov	WORD PTR [bp-12],ax	;d
; Line 117
	push	WORD PTR [bp+16]	;text
	mov	ax,WORD PTR [bp+12]	;oy
	add	ax,WORD PTR [bp-12]	;d
	dec	ax
	push	ax
	mov	ax,WORD PTR [bp+10]	;ox
	sub	ax,WORD PTR [bp-10]	;t
	mov	cx,ax
	add	ax,WORD PTR [bp-8]	;c
	push	ax
	push	WORD PTR _RpCRT
	mov	di,cx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 118
	lea	ax,WORD PTR [bp-12]	;d
	push	ax
	lea	cx,WORD PTR [bp-8]	;c
	push	cx
	push	WORD PTR _OurRoll
	push	WORD PTR [bp-6]	;b
	mov	dx,WORD PTR [bp-4]	;a
	neg	dx
	push	dx
	call	_Rotate2D
	add	sp,10
; Line 119
	push	WORD PTR [bp-8]	;c
	call	_scaler
	add	sp,2
	mov	WORD PTR [bp-8],ax	;c
; Line 120
	push	WORD PTR [bp-12]	;d
	call	_scaler
	add	sp,2
	mov	WORD PTR [bp-12],ax	;d
; Line 121
	push	WORD PTR [bp+16]	;text
	mov	ax,WORD PTR [bp+12]	;oy
	add	ax,WORD PTR [bp-12]	;d
	dec	ax
	push	ax
	add	di,WORD PTR [bp-8]	;c
	push	di
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 123
	lea	ax,WORD PTR [bp-18]	;y1
	push	ax
	lea	cx,WORD PTR [bp-14]	;x1
	push	cx
	push	si
	push	WORD PTR [bp-18]	;y1
	push	WORD PTR [bp-14]	;x1
	call	_Rotate2D
	add	sp,10
; Line 124
	lea	ax,WORD PTR [bp-22]	;y2
	push	ax
	lea	cx,WORD PTR [bp-16]	;x2
	push	cx
	push	si
	push	WORD PTR [bp-22]	;y2
	push	WORD PTR [bp-16]	;x2
	call	_Rotate2D
	add	sp,10
; Line 125
	lea	ax,WORD PTR [bp-24]	;y3
	push	ax
	lea	cx,WORD PTR [bp-20]	;x3
	push	cx
	push	si
	push	WORD PTR [bp-24]	;y3
	push	WORD PTR [bp-20]	;x3
	call	_Rotate2D
	add	sp,10
; Line 127
	lea	ax,WORD PTR [bp-6]	;b
	push	ax
	lea	cx,WORD PTR [bp-4]	;a
	push	cx
	push	WORD PTR _OurRoll
	push	WORD PTR [bp-18]	;y1
	push	WORD PTR [bp-14]	;x1
	call	_Rotate2D
	add	sp,10
; Line 128
	push	WORD PTR [bp-4]	;a
	call	_scaler
	add	sp,2
	mov	WORD PTR [bp-4],ax	;a
; Line 129
	push	WORD PTR [bp-6]	;b
	call	_scaler
	add	sp,2
	mov	WORD PTR [bp-6],ax	;b
; Line 130
	lea	ax,WORD PTR [bp-12]	;d
	push	ax
	lea	cx,WORD PTR [bp-8]	;c
	push	cx
	push	WORD PTR _OurRoll
	push	WORD PTR [bp-22]	;y2
	push	WORD PTR [bp-16]	;x2
	call	_Rotate2D
	add	sp,10
; Line 131
	push	WORD PTR [bp-8]	;c
	call	_scaler
	add	sp,2
	mov	WORD PTR [bp-8],ax	;c
; Line 132
	push	WORD PTR [bp-12]	;d
	call	_scaler
	add	sp,2
	mov	WORD PTR [bp-12],ax	;d
; Line 133
	mov	ax,15
	push	ax
	mov	cx,WORD PTR [bp+12]	;oy
	add	cx,WORD PTR [bp-12]	;d
	push	cx
	mov	cx,WORD PTR [bp+10]	;ox
	add	cx,WORD PTR [bp-8]	;c
	push	cx
	mov	cx,WORD PTR [bp+12]	;oy
	add	cx,WORD PTR [bp-6]	;b
	push	cx
	mov	cx,WORD PTR [bp+10]	;ox
	add	cx,WORD PTR [bp-4]	;a
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 134
	lea	ax,WORD PTR [bp-6]	;b
	push	ax
	lea	cx,WORD PTR [bp-4]	;a
	push	cx
	push	WORD PTR _OurRoll
	push	WORD PTR [bp-24]	;y3
	push	WORD PTR [bp-20]	;x3
	call	_Rotate2D
	add	sp,10
; Line 135
	push	WORD PTR [bp-4]	;a
	call	_scaler
	add	sp,2
	mov	WORD PTR [bp-4],ax	;a
; Line 136
	push	WORD PTR [bp-6]	;b
	call	_scaler
	add	sp,2
	mov	WORD PTR [bp-6],ax	;b
; Line 137
	mov	ax,15
	push	ax
	mov	cx,WORD PTR [bp+12]	;oy
	add	cx,WORD PTR [bp-6]	;b
	push	cx
	mov	cx,WORD PTR [bp+10]	;ox
	add	cx,WORD PTR [bp-4]	;a
	push	cx
	mov	cx,WORD PTR [bp+12]	;oy
	add	cx,WORD PTR [bp-12]	;d
	push	cx
	mov	cx,WORD PTR [bp+10]	;ox
	add	cx,WORD PTR [bp-8]	;c
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 139
	lea	ax,WORD PTR [bp-6]	;b
	push	ax
	lea	cx,WORD PTR [bp-4]	;a
	push	cx
	push	WORD PTR _OurRoll
	push	WORD PTR [bp-18]	;y1
	mov	dx,WORD PTR [bp-14]	;x1
	neg	dx
	push	dx
	call	_Rotate2D
	add	sp,10
	push	WORD PTR [bp-4]	;a
	call	_scaler
	add	sp,2
	mov	WORD PTR [bp-4],ax	;a
	push	WORD PTR [bp-6]	;b
	call	_scaler
	add	sp,2
	mov	WORD PTR [bp-6],ax	;b
; Line 140
	lea	ax,WORD PTR [bp-12]	;d
	push	ax
	lea	cx,WORD PTR [bp-8]	;c
	push	cx
	push	WORD PTR _OurRoll
	push	WORD PTR [bp-22]	;y2
	mov	dx,WORD PTR [bp-16]	;x2
	neg	dx
	push	dx
	call	_Rotate2D
	add	sp,10
	push	WORD PTR [bp-8]	;c
	call	_scaler
	add	sp,2
	mov	WORD PTR [bp-8],ax	;c
	push	WORD PTR [bp-12]	;d
	call	_scaler
	add	sp,2
	mov	WORD PTR [bp-12],ax	;d
; Line 141
	mov	ax,15
	push	ax
	mov	cx,WORD PTR [bp+12]	;oy
	add	cx,WORD PTR [bp-12]	;d
	push	cx
	mov	cx,WORD PTR [bp+10]	;ox
	add	cx,WORD PTR [bp-8]	;c
	push	cx
	mov	cx,WORD PTR [bp+12]	;oy
	add	cx,WORD PTR [bp-6]	;b
	push	cx
	mov	cx,WORD PTR [bp+10]	;ox
	add	cx,WORD PTR [bp-4]	;a
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 142
	lea	ax,WORD PTR [bp-6]	;b
	push	ax
	lea	cx,WORD PTR [bp-4]	;a
	push	cx
	push	WORD PTR _OurRoll
	push	WORD PTR [bp-24]	;y3
	mov	dx,WORD PTR [bp-20]	;x3
	neg	dx
	push	dx
	call	_Rotate2D
	add	sp,10
	push	WORD PTR [bp-4]	;a
	call	_scaler
	add	sp,2
	mov	WORD PTR [bp-4],ax	;a
	push	WORD PTR [bp-6]	;b
	call	_scaler
	add	sp,2
	mov	WORD PTR [bp-6],ax	;b
; Line 143
	mov	ax,15
	push	ax
	mov	ax,WORD PTR [bp+12]	;oy
	add	ax,WORD PTR [bp-6]	;b
	push	ax
	mov	ax,WORD PTR [bp+10]	;ox
	add	ax,WORD PTR [bp-4]	;a
	push	ax
	mov	ax,WORD PTR [bp+12]	;oy
	add	ax,WORD PTR [bp-12]	;d
	push	ax
	mov	ax,WORD PTR [bp+10]	;ox
	add	ax,WORD PTR [bp-8]	;c
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 144
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_pitchbar2	ENDP
; Line 146
	PUBLIC	_pitchnum2
_pitchnum2	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	x = -4
;	y = -6
;	a = -2
;	oy = 14
;	ox = 12
;	off = 10
;	dist = 8
;	pitch = 6
;	w = 4
; Line 149
	mov	ax,WORD PTR [bp+6]	;pitch
	sub	ax,WORD PTR [bp+10]	;off
	sub	ax,WORD PTR [bp+8]	;dist
	mov	WORD PTR [bp-2],ax	;a
	push	ax
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-4],ax	;x
; Line 150
	mov	ax,WORD PTR [bp+10]	;off
	add	ax,WORD PTR [bp+8]	;dist
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	mov	WORD PTR [bp+8],ax	;dist
; Line 151
	cmp	WORD PTR [bp-4],90	;x
	jne	$I737
; Line 152
	lea	ax,WORD PTR [bp-6]	;y
	push	ax
	lea	cx,WORD PTR [bp-4]	;x
	push	cx
	push	WORD PTR _OurRoll
	push	WORD PTR [bp+8]	;dist
	sub	dx,dx
	push	dx
	call	_Rotate2D
	add	sp,10
; Line 153
	push	WORD PTR [bp-4]	;x
	call	_scaler
	add	sp,2
	mov	WORD PTR [bp-4],ax	;x
; Line 154
	push	WORD PTR [bp-6]	;y
	call	_scaler
	add	sp,2
	push	ax
	call	_scaley
	add	sp,2
	mov	WORD PTR [bp-6],ax	;y
; Line 155
	sub	ax,ax
	push	ax
	mov	ax,15
	push	ax
	mov	ax,3
	push	ax
	mov	ax,WORD PTR [bp+14]	;oy
	add	ax,WORD PTR [bp-6]	;y
	push	ax
	mov	ax,WORD PTR [bp+12]	;ox
	add	ax,WORD PTR [bp-4]	;x
	push	ax
	push	WORD PTR _RpCRT
	call	_draw_circle
	add	sp,12
; Line 156
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I737:
; Line 158
	cmp	WORD PTR [bp-4],85	;x
	jle	$I740
	mov	ax,WORD PTR [bp-4]	;x
	mov	cx,85
	cwd	
	idiv	cx
	sub	dx,95
	neg	dx
	mov	WORD PTR [bp-4],dx	;x
; Line 159
$I740:
	mov	ax,10
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR [bp-4]	;x
	call	_itoa
	add	sp,6
; Line 160
	cmp	WORD PTR [bp-2],0	;a
	jge	$L20008
	cmp	WORD PTR [bp-2],-90	;a
	jg	$L20007
$L20008:
	cmp	WORD PTR [bp-2],85	;a
	jle	$L20005
$L20007:
	mov	WORD PTR [bp-8],1
	jmp	SHORT $L20006
	nop	
$L20005:
	mov	WORD PTR [bp-8],0
$L20006:
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR [bp-8]
	push	WORD PTR [bp+14]	;oy
	push	WORD PTR [bp+12]	;ox
	push	WORD PTR [bp+8]	;dist
	push	WORD PTR [bp-4]	;x
	mov	ax,WORD PTR [bp+4]	;w
	sub	ax,3
	push	ax
	call	_pitchbar2
; Line 161
	mov	sp,bp
	pop	bp
	ret	

_pitchnum2	ENDP
; Line 165
degrees	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	deg = 4
; Line 168
	mov	ax,10
	push	ax
	mov	cx,OFFSET DGROUP:$S744_s
	push	cx
	mov	ax,WORD PTR [bp+4]	;deg
	mov	dx,36
	mov	bx,dx
	cwd	
	idiv	bx
	inc	dx
	mov	WORD PTR [bp+4],dx	;deg
	push	dx
	call	_itoa
	mov	sp,bp
; Line 169
	cmp	WORD PTR [bp+4],10	;deg
	jge	$I745
	mov	BYTE PTR $S744_s+2,0
	mov	al,BYTE PTR $S744_s
	mov	BYTE PTR $S744_s+1,al
	mov	BYTE PTR $S744_s,48
; Line 170
$I745:
	mov	ax,OFFSET DGROUP:$S744_s
; Line 171
	pop	bp
	ret	

degrees	ENDP
; Line 173
	PUBLIC	_headingscale
_headingscale	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
;	deg = -2
;	i = -8
;	x = -6
;	deg10 = -4
;	xmin = -10
;	xmax = -12
;	color2 = 8
;	color1 = 6
;	w = 4
; Line 175
	mov	ax,WORD PTR _OurHead
	mov	cx,91
	sub	dx,dx
	div	cx
	mov	WORD PTR [bp-2],ax	;deg
	mov	cx,20
	sub	dx,dx
	div	cx
	add	ax,33
	mov	WORD PTR [bp-4],ax	;deg10
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	dx,ax
	sub	ax,WORD PTR [bp+4]	;w
	inc	ax
	mov	WORD PTR [bp-10],ax	;xmin
	add	dx,WORD PTR [bp+4]	;w
	mov	WORD PTR [bp-12],dx	;xmax
; Line 177
	mov	ax,WORD PTR [bp+6]	;color1
	mov	WORD PTR [bx+12],ax
; Line 178
	push	WORD PTR [bp+8]	;color2
	mov	ax,5
	push	ax
	push	WORD PTR [bp-12]	;xmax
	push	ax
	push	WORD PTR [bp-10]	;xmin
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 179
	mov	ax,WORD PTR [bp-2]	;deg
	mov	cx,20
	sub	dx,dx
	div	cx
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+6]
	mov	cx,dx
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,cx
	sub	ax,40
	mov	WORD PTR [bp-6],ax	;x
	mov	WORD PTR [bp-8],0	;i
	jmp	SHORT $F757
	nop	
$L20009:
	mov	ax,WORD PTR [bp-6]	;x
	sub	ax,4
$L20010:
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 185
; Line 186
$I761:
	mov	ax,WORD PTR [bp-8]	;i
	mov	cx,5
	cwd	
	idiv	cx
	or	dx,dx
	jne	$FC758
	inc	WORD PTR [bp-4]	;deg10
; Line 187
$FC758:
	add	WORD PTR [bp-6],4	;x
	inc	WORD PTR [bp-8]	;i
$F757:
	mov	ax,WORD PTR [bp-12]	;xmax
	inc	ax
	cmp	ax,WORD PTR [bp-6]	;x
	jle	$FB759
; Line 180
	mov	ax,WORD PTR [bp-6]	;x
	cmp	WORD PTR [bp-10],ax	;xmin
	jg	$I761
; Line 181
	push	WORD PTR [bp+8]	;color2
	mov	cx,4
	push	cx
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawDot
	add	sp,8
; Line 182
	mov	ax,WORD PTR [bp-8]	;i
	mov	cx,5
	cwd	
	idiv	cx
	or	dx,dx
	jne	$I761
; Line 183
	push	WORD PTR [bp+8]	;color2
	mov	ax,3
	push	ax
	push	WORD PTR [bp-6]	;x
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawDot
	add	sp,8
; Line 184
	push	WORD PTR [bp-4]	;deg10
	call	degrees
	add	sp,2
	push	ax
	sub	ax,ax
	push	ax
	cmp	WORD PTR [bp-6],ax	;x
	jne	$JCC2320
	jmp	$L20009
$JCC2320:
	mov	ax,WORD PTR [bp-6]	;x
	sub	ax,3
	jmp	$L20010
$FB759:
; Line 188
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	cx,ax
	add	ax,WORD PTR [bp+4]	;w
	push	ax
	mov	ax,cx
	sub	cx,WORD PTR [bp+4]	;w
	push	cx
	mov	cx,ax
	mov	ax,WORD PTR _AutoHead
	sub	ax,WORD PTR _OurHead
	mov	bx,182
	cwd	
	idiv	bx
	shl	ax,1
	add	cx,ax
	push	cx
	call	_rng
	add	sp,6
	mov	WORD PTR [bp-6],ax	;x
; Line 189
	push	WORD PTR [bp+6]	;color1
	mov	ax,7
	push	ax
	mov	cx,WORD PTR [bp-6]	;x
	dec	cx
	dec	cx
	push	cx
	mov	cx,5
	push	cx
	push	WORD PTR [bp-6]	;x
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
	push	WORD PTR [bp+6]	;color1
	mov	ax,7
	push	ax
	mov	ax,WORD PTR [bp-6]	;x
	inc	ax
	inc	ax
	push	ax
	mov	ax,5
	push	ax
	push	WORD PTR [bp-6]	;x
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
; Line 190
	mov	sp,bp
	pop	bp
	ret	

_headingscale	ENDP
; Line 248
	PUBLIC	_HsdCrt
_HsdCrt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,62
	call	__aNchkstk
	push	di
	push	si
;	radius = -30
;	ox = -24
;	oy = -28
;	i = -34
;	x = -26
;	y = -32
;	x2 = -38
;	y2 = -44
;	bx = -36
;	by = -42
;	heading = -10
;	screen = -4
;	s = -20
;	off = -40
;	font = -22
;	CrtNr = 4
; Line 250
	mov	WORD PTR [bp-30],26	;radius
; Line 251
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+6]
	mov	cx,ax
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-24],ax	;ox
; Line 252
	mov	ax,WORD PTR [bx+8]
	mov	si,ax
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-28],ax	;oy
; Line 259
	test	BYTE PTR _Damaged+1,2
	je	$I789
; Line 260
	sub	ax,ax
	push	ax
	lea	dx,WORD PTR [si+1]
	push	dx
	inc	cx
	push	cx
	push	ax
	push	ax
	push	bx
	call	FAR PTR _RectFill
	add	sp,12
; Line 261
$L20015:
	mov	ax,1
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 262
; Line 264
$I789:
	mov	ax,WORD PTR [bx+16]
	mov	WORD PTR [bp-22],ax	;font
; Line 265
	mov	ax,WORD PTR _GRPAGE0+2
	mov	WORD PTR [bp-4],0	;screen
	mov	WORD PTR [bp-2],ax
; Line 266
	sub	ax,ax
	push	ax
	push	WORD PTR [bx+8]
	push	WORD PTR [bx+6]
	push	ax
	push	ax
	push	bx
	call	FAR PTR _RectFill
	add	sp,12
; Line 268
	mov	ax,7
	push	ax
	push	WORD PTR [bp-28]	;oy
	push	WORD PTR [bp-24]	;ox
	mov	cx,WORD PTR [bp-30]	;radius
	add	cx,4
	push	cx
	sub	cx,cx
	push	cx
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;screen
	call	_circlepoints
	add	sp,14
; Line 269
	mov	ax,7
	push	ax
	push	WORD PTR [bp-28]	;oy
	push	WORD PTR [bp-24]	;ox
	mov	cx,WORD PTR [bp-30]	;radius
	add	cx,3
	push	cx
	sub	cx,cx
	push	cx
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;screen
	call	_circlepoints
	add	sp,14
; Line 270
	mov	ax,7
	push	ax
	push	WORD PTR [bp-28]	;oy
	push	WORD PTR [bp-24]	;ox
	mov	cx,WORD PTR [bp-30]	;radius
	sub	cx,4
	push	cx
	push	cx
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;screen
	call	_circlepoints
	add	sp,14
; Line 271
	mov	ax,7
	push	ax
	push	WORD PTR [bp-28]	;oy
	push	WORD PTR [bp-24]	;ox
	mov	ax,WORD PTR [bp-30]	;radius
	sub	ax,5
	push	ax
	push	ax
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;screen
	call	_circlepoints
	add	sp,14
; Line 272
	mov	ax,320
	imul	WORD PTR [bp-28]	;oy
	add	ax,WORD PTR [bp-24]	;ox
	add	WORD PTR [bp-4],ax	;screen
; Line 273
	mov	WORD PTR [bp-34],0	;i
	jmp	$L20016
	nop	
$FC791:
; Line 274
	lea	ax,WORD PTR [bp-32]	;y
	push	ax
	lea	cx,WORD PTR [bp-26]	;x
	push	cx
	mov	ax,910
	imul	WORD PTR [bp-34]	;i
	mov	dx,ax
	add	ax,WORD PTR _OurHead
	push	ax
	mov	ax,-1
	sub	ax,WORD PTR [bp-30]	;radius
	push	ax
	sub	ax,ax
	push	ax
	mov	si,dx
	call	_Rotate2D
	add	sp,10
; Line 275
	push	WORD PTR [bp-32]	;y
	call	_scaley
	add	sp,2
	mov	WORD PTR [bp-48],ax
	mov	ax,320
	imul	WORD PTR [bp-48]
	mov	bx,ax
	add	bx,WORD PTR [bp-4]	;screen
	mov	es,WORD PTR [bp-2]
	mov	di,WORD PTR [bp-26]	;x
	mov	al,BYTE PTR $S773_color
	mov	BYTE PTR es:[bx][di],al
; Line 276
	push	WORD PTR [bp-32]	;y
	call	_scaley
	add	sp,2
	mov	WORD PTR [bp-50],ax
	mov	ax,-320
	imul	WORD PTR [bp-50]
	mov	bx,ax
	sub	bx,WORD PTR [bp-26]	;x
	les	di,DWORD PTR [bp-4]	;screen
	mov	al,BYTE PTR $S773_color
	mov	BYTE PTR es:[bx][di],al
; Line 277
	push	WORD PTR [bp-26]	;x
	call	_scaley
	add	sp,2
	mov	WORD PTR [bp-52],ax
	mov	ax,-320
	imul	WORD PTR [bp-52]
	mov	bx,ax
	add	bx,WORD PTR [bp-4]	;screen
	mov	es,WORD PTR [bp-2]
	mov	di,WORD PTR [bp-32]	;y
	mov	al,BYTE PTR $S773_color
	mov	BYTE PTR es:[bx][di],al
; Line 278
	push	WORD PTR [bp-26]	;x
	call	_scaley
	add	sp,2
	mov	WORD PTR [bp-54],ax
	mov	ax,320
	imul	WORD PTR [bp-54]
	mov	bx,ax
	sub	bx,WORD PTR [bp-32]	;y
	les	di,DWORD PTR [bp-4]	;screen
	mov	al,BYTE PTR $S773_color
	mov	BYTE PTR es:[bx][di],al
; Line 279
	mov	ax,WORD PTR [bp-34]	;i
	mov	cx,2
	cwd	
	idiv	cx
	or	dx,dx
	jne	$JCC2906
	jmp	$L20016
$JCC2906:
; Line 280
	lea	ax,WORD PTR [bp-32]	;y
	push	ax
	lea	cx,WORD PTR [bp-26]	;x
	push	cx
	add	si,WORD PTR _OurHead
	push	si
	mov	dx,WORD PTR [bp-30]	;radius
	neg	dx
	push	dx
	sub	dx,dx
	push	dx
	call	_Rotate2D
	add	sp,10
; Line 281
	push	WORD PTR [bp-32]	;y
	call	_scaley
	add	sp,2
	mov	WORD PTR [bp-56],ax
	mov	ax,320
	imul	WORD PTR [bp-56]
	mov	bx,ax
	add	bx,WORD PTR [bp-4]	;screen
	mov	es,WORD PTR [bp-2]
	mov	si,WORD PTR [bp-26]	;x
	mov	al,BYTE PTR $S773_color
	mov	BYTE PTR es:[bx][si],al
; Line 282
	push	WORD PTR [bp-32]	;y
	call	_scaley
	add	sp,2
	mov	WORD PTR [bp-58],ax
	mov	ax,-320
	imul	WORD PTR [bp-58]
	mov	bx,ax
	sub	bx,WORD PTR [bp-26]	;x
	les	si,DWORD PTR [bp-4]	;screen
	mov	al,BYTE PTR $S773_color
	mov	BYTE PTR es:[bx][si],al
; Line 283
	push	WORD PTR [bp-26]	;x
	call	_scaley
	add	sp,2
	mov	WORD PTR [bp-60],ax
	mov	ax,-320
	imul	WORD PTR [bp-60]
	mov	bx,ax
	add	bx,WORD PTR [bp-4]	;screen
	mov	es,WORD PTR [bp-2]
	mov	si,WORD PTR [bp-32]	;y
	mov	al,BYTE PTR $S773_color
	mov	BYTE PTR es:[bx][si],al
; Line 284
	push	WORD PTR [bp-26]	;x
	call	_scaley
	add	sp,2
	mov	WORD PTR [bp-62],ax
	mov	ax,320
	imul	WORD PTR [bp-62]
	mov	bx,ax
	sub	bx,WORD PTR [bp-32]	;y
	les	si,DWORD PTR [bp-4]	;screen
	mov	al,BYTE PTR $S773_color
	mov	BYTE PTR es:[bx][si],al
; Line 285
; Line 286
$L20016:
	mov	ax,WORD PTR [bp-34]	;i
	inc	WORD PTR [bp-34]	;i
	cmp	ax,18
	jge	$JCC3082
	jmp	$FC791
$JCC3082:
; Line 288
	mov	ax,7
	push	ax
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	cx,ax
	sub	ax,18
	push	ax
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	sub	cx,26
	push	cx
	push	ax
	push	bx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 290
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+16],2
; Line 291
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+12],15
; Line 292
	call	_SteerRange
	push	ax
	mov	ax,OFFSET DGROUP:$SG796
	push	ax
	lea	ax,WORD PTR [bp-20]	;s
	push	ax
	call	_sprintf
	add	sp,6
; Line 293
	lea	ax,WORD PTR [bp-20]	;s
	push	ax
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,6
	push	ax
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,12
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 295
	push	WORD PTR _Knots
	mov	ax,OFFSET DGROUP:$SG797
	push	ax
	lea	ax,WORD PTR [bp-20]	;s
	push	ax
	call	_sprintf
	add	sp,6
; Line 296
	lea	ax,WORD PTR [bp-20]	;s
	push	ax
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	inc	ax
	inc	ax
	push	ax
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,10
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 297
	push	WORD PTR _Knots
	call	_TAStoIAS
	add	sp,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG799
	push	ax
	lea	ax,WORD PTR [bp-20]	;s
	push	ax
	call	_sprintf
	add	sp,6
; Line 298
	lea	ax,WORD PTR [bp-20]	;s
	push	ax
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,10
	push	ax
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,9
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 301
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+16],2
; Line 302
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+12],15
; Line 303
	lea	ax,WORD PTR [bp-32]	;y
	push	ax
	lea	cx,WORD PTR [bp-26]	;x
	push	cx
	push	WORD PTR _OurHead
	mov	dx,-1
	sub	dx,WORD PTR [bp-30]	;radius
	push	dx
	sub	bx,bx
	push	bx
	mov	si,dx
	call	_Rotate2D
	add	sp,10
; Line 304
	mov	ax,OFFSET DGROUP:$SG800
	push	ax
	push	WORD PTR [bp-32]	;y
	call	_scaley
	add	sp,2
	mov	bx,WORD PTR _RpCRT
	mov	cx,ax
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	add	cx,ax
	dec	cx
	dec	cx
	push	cx
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,WORD PTR [bp-26]	;x
	dec	ax
	dec	ax
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 305
	mov	ax,OFFSET DGROUP:$SG801
	push	ax
	push	WORD PTR [bp-26]	;x
	call	_scaley
	add	sp,2
	mov	bx,WORD PTR _RpCRT
	mov	cx,ax
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	add	cx,ax
	dec	cx
	dec	cx
	push	cx
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,WORD PTR [bp-32]	;y
	dec	ax
	dec	ax
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 306
	mov	ax,OFFSET DGROUP:$SG802
	push	ax
	push	WORD PTR [bp-26]	;x
	call	_scaley
	add	sp,2
	mov	bx,WORD PTR _RpCRT
	mov	cx,ax
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,cx
	dec	ax
	dec	ax
	push	ax
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,WORD PTR [bp-32]	;y
	dec	ax
	dec	ax
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 307
	mov	ax,OFFSET DGROUP:$SG803
	push	ax
	push	WORD PTR [bp-32]	;y
	call	_scaley
	add	sp,2
	mov	bx,WORD PTR _RpCRT
	mov	cx,ax
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,cx
	dec	ax
	dec	ax
	push	ax
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,WORD PTR [bp-26]	;x
	dec	ax
	dec	ax
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 308
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+16],4
; Line 309
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+12],7
; Line 310
	lea	ax,WORD PTR [bp-32]	;y
	push	ax
	lea	cx,WORD PTR [bp-26]	;x
	push	cx
	mov	dx,WORD PTR _OurHead
	sub	dx,5461
	push	dx
	push	si
	sub	dx,dx
	push	dx
	call	_Rotate2D
	add	sp,10
; Line 311
	mov	ax,OFFSET DGROUP:$SG804
	push	ax
	push	WORD PTR [bp-32]	;y
	call	_scaley
	add	sp,2
	mov	bx,WORD PTR _RpCRT
	mov	cx,ax
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	add	cx,ax
	dec	cx
	push	cx
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,WORD PTR [bp-26]	;x
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 312
	mov	ax,OFFSET DGROUP:$SG805
	push	ax
	push	WORD PTR [bp-26]	;x
	call	_scaley
	add	sp,2
	mov	bx,WORD PTR _RpCRT
	mov	cx,ax
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,cx
	dec	ax
	push	ax
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,WORD PTR [bp-32]	;y
	sub	ax,3
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 313
	mov	ax,OFFSET DGROUP:$SG806
	push	ax
	push	WORD PTR [bp-26]	;x
	call	_scaley
	add	sp,2
	mov	bx,WORD PTR _RpCRT
	mov	cx,ax
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	add	cx,ax
	dec	cx
	push	cx
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,WORD PTR [bp-32]	;y
	dec	ax
	dec	ax
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 314
	mov	ax,OFFSET DGROUP:$SG807
	push	ax
	push	WORD PTR [bp-32]	;y
	call	_scaley
	add	sp,2
	mov	bx,WORD PTR _RpCRT
	mov	cx,ax
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,cx
	dec	ax
	push	ax
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,WORD PTR [bp-26]	;x
	dec	ax
	dec	ax
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 315
	lea	ax,WORD PTR [bp-32]	;y
	push	ax
	lea	cx,WORD PTR [bp-26]	;x
	push	cx
	mov	dx,WORD PTR _OurHead
	sub	dx,10922
	push	dx
	push	si
	sub	dx,dx
	push	dx
	call	_Rotate2D
	add	sp,10
; Line 316
	mov	ax,OFFSET DGROUP:$SG808
	push	ax
	push	WORD PTR [bp-32]	;y
	call	_scaley
	add	sp,2
	mov	bx,WORD PTR _RpCRT
	mov	cx,ax
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	add	cx,ax
	dec	cx
	push	cx
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,WORD PTR [bp-26]	;x
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 317
	mov	ax,OFFSET DGROUP:$SG809
	push	ax
	push	WORD PTR [bp-26]	;x
	call	_scaley
	add	sp,2
	mov	bx,WORD PTR _RpCRT
	mov	cx,ax
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,cx
	dec	ax
	push	ax
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,WORD PTR [bp-32]	;y
	sub	ax,3
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 318
	mov	ax,OFFSET DGROUP:$SG810
	push	ax
	push	WORD PTR [bp-26]	;x
	call	_scaley
	add	sp,2
	mov	bx,WORD PTR _RpCRT
	mov	cx,ax
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	add	cx,ax
	dec	cx
	push	cx
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,WORD PTR [bp-32]	;y
	dec	ax
	dec	ax
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 319
	mov	ax,OFFSET DGROUP:$SG811
	push	ax
	push	WORD PTR [bp-32]	;y
	call	_scaley
	add	sp,2
	mov	bx,WORD PTR _RpCRT
	mov	cx,ax
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,cx
	dec	ax
	push	ax
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,WORD PTR [bp-26]	;x
	sub	ax,3
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 323
	lea	ax,WORD PTR [bp-32]	;y
	push	ax
	lea	cx,WORD PTR [bp-26]	;x
	push	cx
	mov	dx,WORD PTR _Py
	mov	bx,WORD PTR _NextWayPoint
	mov	si,bx
	shl	bx,1
	add	bx,si
	shl	bx,1
	shl	bx,1
	sub	dx,WORD PTR _wps[bx+2]
	push	dx
	mov	dx,WORD PTR _wps[bx]
	sub	dx,WORD PTR _Px
	push	dx
	call	_ARCTAN
	add	sp,4
	sub	ax,WORD PTR _OurHead
	neg	ax
	mov	WORD PTR [bp-34],ax	;i
	push	ax
	mov	cx,-6
	sub	cx,WORD PTR [bp-30]	;radius
	push	cx
	sub	cx,cx
	push	cx
	call	_Rotate2D
	add	sp,10
; Line 324
	push	WORD PTR [bp-32]	;y
	call	_scaley
	add	sp,2
	mov	WORD PTR [bp-32],ax	;y
; Line 325
	lea	ax,WORD PTR [bp-44]	;y2
	push	ax
	lea	cx,WORD PTR [bp-38]	;x2
	push	cx
	push	WORD PTR [bp-34]	;i
	mov	dx,-3
	sub	dx,WORD PTR [bp-30]	;radius
	push	dx
	mov	bx,-2
	push	bx
	mov	si,dx
	call	_Rotate2D
	add	sp,10
; Line 326
	push	WORD PTR [bp-44]	;y2
	call	_scaley
	add	sp,2
	mov	WORD PTR [bp-44],ax	;y2
; Line 327
	mov	ax,15
	push	ax
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	cx,ax
	add	ax,WORD PTR [bp-44]	;y2
	inc	ax
	push	ax
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	dx,ax
	add	ax,WORD PTR [bp-38]	;x2
	inc	ax
	push	ax
	add	cx,WORD PTR [bp-32]	;y
	inc	cx
	push	cx
	add	dx,WORD PTR [bp-26]	;x
	inc	dx
	push	dx
	push	bx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 328
	lea	ax,WORD PTR [bp-44]	;y2
	push	ax
	lea	cx,WORD PTR [bp-38]	;x2
	push	cx
	push	WORD PTR [bp-34]	;i
	push	si
	mov	dx,2
	push	dx
	call	_Rotate2D
	add	sp,10
; Line 329
	push	WORD PTR [bp-44]	;y2
	call	_scaley
	add	sp,2
	mov	WORD PTR [bp-44],ax	;y2
; Line 330
	mov	ax,15
	push	ax
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	cx,ax
	add	ax,WORD PTR [bp-44]	;y2
	inc	ax
	push	ax
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	dx,ax
	add	ax,WORD PTR [bp-38]	;x2
	inc	ax
	push	ax
	add	cx,WORD PTR [bp-32]	;y
	inc	cx
	push	cx
	add	dx,WORD PTR [bp-26]	;x
	inc	dx
	push	dx
	push	bx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 332
	mov	ax,WORD PTR [bp-22]	;font
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+16],ax
	jmp	$L20015
; Line 337
	nop	

_HsdCrt	ENDP
; Line 341
	PUBLIC	_SteerRange
_SteerRange	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	dx = -2
;	dy = -4
; Line 345
	mov	bx,WORD PTR _NextWayPoint
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR _wps[bx+4]
	mov	dx,WORD PTR _wps[bx+6]
	sub	ax,WORD PTR _PxLng
	sbb	dx,WORD PTR _PxLng+2
	push	dx
	push	ax
	call	_labs
	add	sp,4
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	mov	WORD PTR [bp-2],ax	;dx
; Line 347
	mov	ax,95
	push	ax
	mov	ax,2
	push	ax
	mov	bx,WORD PTR _NextWayPoint
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR _wps[bx+8]
	mov	dx,WORD PTR _wps[bx+10]
	add	ax,WORD PTR _PyLng
	adc	dx,WORD PTR _PyLng+2
	sub	ax,0
	sbb	dx,16
	push	dx
	push	ax
	call	_labs
	add	sp,4
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	push	ax
	push	WORD PTR [bp-2]	;dx
	call	_Dist2D
	add	sp,4
	push	ax
	call	_MDiv
; Line 348
	mov	sp,bp
	pop	bp
	ret	

_SteerRange	ENDP
_TEXT	ENDS
END
