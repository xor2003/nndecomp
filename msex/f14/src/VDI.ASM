;	Static Name Aliases
;
;	$S1366_pos	EQU	pos
;	$S1367_t1	EQU	t1
;	$S1370_ypos	EQU	ypos
;	$S1371_ypos2	EQU	ypos2
;	$S1387_hpts	EQU	hpts
;	$S1395_cpts	EQU	cpts
;	$S1445_hpts	EQU	hpts
;	$S1457_hpts	EQU	hpts
;	$S1458_hpts2	EQU	hpts2
;	$S1459_hpts3	EQU	hpts3
;	$S1460_hpts4	EQU	hpts4
;	$S1490_hpts0	EQU	hpts0
;	$S1491_hpts1	EQU	hpts1
;	$S1542_RANGES	EQU	RANGES
;	$S1599_off	EQU	off
	TITLE   C:\VDI.C
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
PUBLIC  _inity
EXTRN	_Rotate2D:NEAR
EXTRN	_DrawLine:FAR
EXTRN	_vdiils:NEAR
EXTRN	_DrawDot:FAR
EXTRN	_RpPrint:FAR
EXTRN	_DrawPoly:FAR
EXTRN	_RectFill:FAR
EXTRN	__aNchkstk:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_abs:NEAR
EXTRN	_pstrlen:NEAR
EXTRN	_draw_circle:NEAR
EXTRN	_itoa:NEAR
EXTRN	_rotate_pt:NEAR
EXTRN	_MODE_MASTER:WORD
EXTRN	_ORDNANCE:BYTE
EXTRN	_Tscale:WORD
EXTRN	_AWG9_MODE:WORD
EXTRN	_RANGES:BYTE
EXTRN	_BRANGES:BYTE
EXTRN	_RANGE:WORD
EXTRN	_RpCRT:WORD
EXTRN	_Px:WORD
EXTRN	_Py:WORD
EXTRN	_OurHead:WORD
EXTRN	_sx:WORD
EXTRN	_PDT_RNG:WORD
EXTRN	_sy:WORD
EXTRN	_sz:WORD
EXTRN	_OurRoll:WORD
EXTRN	_PW:WORD
EXTRN	_OurPitch:WORD
EXTRN	_PDT_PROJ_X:WORD
EXTRN	_PDT_PROJ_Y:WORD
EXTRN	_PDT_PROJ:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Damaged:WORD
_DATA      SEGMENT
	ORG	$+174
$SG1561	DB	'1',  00H
$SG1563	DB	'2',  00H
$SG1565	DB	'3',  00H
$SG1567	DB	'4',  00H
$SG1569	DB	'5',  00H
$SG1570	DB	'1',  00H
	ORG	$-186
_inity	DW	01eH
$S1370_ypos	DW	0ffe2H
$S1371_ypos2	DW	0fff6H
$S1387_hpts	DW	0ffceH
	DW	00H
	DW	0fff6H
	DW	00H
$S1395_cpts	DW	01dH
	DW	01cH
	DW	024H
	DW	01cH
	DW	024H
	DW	01fH
	DW	02eH
	DW	01fH
	DW	02eH
	DW	01cH
	DW	035H
	DW	01cH
$S1445_hpts	DW	0fffeH
	DW	00H
	DW	02H
	DW	00H
$S1457_hpts	DW	0fff4H
	DW	00H
	DW	0cH
	DW	00H
$S1458_hpts2	DW	0fff4H
	DW	00H
	DW	0fff8H
	DW	00H
	DW	0fffaH
	DW	00H
	DW	06H
	DW	00H
	DW	08H
	DW	00H
	DW	0cH
	DW	00H
$S1459_hpts3	DW	0ffe7H
	DW	00H
	DW	0fffbH
	DW	00H
	DW	05H
	DW	00H
	DW	019H
	DW	00H
	DW	00H
	DW	00H
$S1460_hpts4	DW	0ffe7H
	DW	00H
	DW	0ffecH
	DW	00H
	DW	0ffeeH
	DW	00H
	DW	0fffbH
	DW	00H
	DW	05H
	DW	00H
	DW	012H
	DW	00H
	DW	014H
	DW	00H
	DW	019H
	DW	00H
	DW	00H
	DW	00H
$S1490_hpts0	DW	00H
	DW	00H
	DW	0cH
	DW	00H
	DW	0cH
	DW	03H
	DW	014H
	DW	00H
$S1491_hpts1	DW	00H
	DW	00H
	DW	0cH
	DW	00H
	DW	0cH
	DW	0fffdH
	DW	014H
	DW	00H
$S1542_RANGES	DW	050H
	DW	028H
	DW	014H
	DW	0aH
	ORG	$+12
$S1599_off	DW	00H
_DATA      ENDS
_BSS      SEGMENT
$S1366_pos	DW 01H DUP (?)
$S1367_t1	DW 01H DUP (?)
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
; Line 48
	PUBLIC	_VdiCrt
_VdiCrt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,144
	call	__aNchkstk
	push	si
;	xpos = -122
;	xpos2 = -128
;	p1 = -18
;	p2 = -36
;	p3 = -54
;	p4 = -88
;	p5 = -90
;	p6 = -92
;	p7 = -110
;	p8 = -112
;	x1 = -116
;	x2 = -120
;	y1 = -118
;	y2 = -126
;	i = -114
;	basedeg = -124
;	pts = -108
;	a = -16
;	l1 = -136
;	l2 = -144
;	b = -34
;	t = -86
;	c = -52
;	d = -70
;	CrtNr = 4
; Line 52
	mov	WORD PTR [bp-128],25	;xpos2
; Line 63
	mov	ax,-45
	mov	WORD PTR [bp-14],ax
	mov	WORD PTR [bp-10],ax
; Line 64
	mov	ax,50
	mov	WORD PTR [bp-12],ax
	mov	WORD PTR [bp-8],ax
; Line 65
	mov	ax,-50
	mov	WORD PTR [bp-16],ax	;a
	mov	WORD PTR [bp-4],ax
; Line 66
	mov	WORD PTR [bp-136],-40	;l1
	mov	WORD PTR [bp-132],-30
; Line 67
	mov	WORD PTR [bp-144],40	;l2
; Line 68
	mov	ax,30
	mov	WORD PTR [bp-140],ax
	mov	WORD PTR [bp-32],ax
	mov	WORD PTR [bp-28],ax
	mov	ax,71
	mov	WORD PTR [bp-30],ax
	mov	WORD PTR [bp-26],ax
	mov	ax,54
	mov	WORD PTR [bp-24],ax
	mov	WORD PTR [bp-20],ax
; Line 71
	sub	ax,ax
	mov	WORD PTR [bp-122],ax	;xpos
	mov	WORD PTR [bp-6],ax
	mov	WORD PTR [bp-2],ax
	mov	WORD PTR [bp-134],ax
	mov	WORD PTR [bp-130],ax
	mov	WORD PTR [bp-142],ax
	mov	WORD PTR [bp-138],ax
	mov	WORD PTR [bp-34],ax	;b
	mov	WORD PTR [bp-22],ax
	mov	WORD PTR [bp-86],ax	;t
	mov	WORD PTR [bp-84],ax
	mov	WORD PTR [bp-82],ax
	mov	WORD PTR [bp-80],ax
	mov	WORD PTR [bp-78],ax
	mov	WORD PTR [bp-76],ax
	mov	WORD PTR [bp-74],ax
	mov	WORD PTR [bp-72],ax
	mov	WORD PTR [bp-52],ax	;c
	mov	WORD PTR [bp-50],ax
	mov	WORD PTR [bp-48],ax
	mov	WORD PTR [bp-46],ax
	mov	WORD PTR [bp-44],ax
	mov	WORD PTR [bp-42],ax
	mov	WORD PTR [bp-40],ax
	mov	WORD PTR [bp-38],ax
	mov	WORD PTR [bp-70],ax	;d
	mov	WORD PTR [bp-68],ax
	mov	WORD PTR [bp-66],ax
	mov	WORD PTR [bp-64],ax
	mov	WORD PTR [bp-62],ax
	mov	WORD PTR [bp-60],ax
	mov	WORD PTR [bp-58],ax
	mov	WORD PTR [bp-56],ax
; Line 76
	test	BYTE PTR _Damaged+1,2
	je	$I1396
; Line 77
	push	ax
	mov	bx,WORD PTR _RpCRT
	mov	cx,WORD PTR [bx+8]
	inc	cx
	push	cx
	mov	cx,WORD PTR [bx+6]
	inc	cx
	push	cx
	push	ax
	push	ax
	push	bx
	call	FAR PTR _RectFill
	add	sp,12
; Line 78
$L20007:
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 79
; Line 81
	nop	
$I1396:
	mov	ax,1
	push	ax
	mov	bx,WORD PTR _RpCRT
	add	ax,WORD PTR [bx+8]
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
; Line 85
	mov	ax,WORD PTR _OurPitch
	mov	cx,182
	cwd	
	idiv	cx
	mov	WORD PTR [bp-124],ax	;basedeg
	or	ax,ax
	jle	$I1397
; Line 86
	add	WORD PTR [bp-6],ax
; Line 87
	add	WORD PTR [bp-2],ax
; Line 88
; Line 89
$I1397:
	or	ax,ax
	jge	$I1398
; Line 90
	add	WORD PTR [bp-6],ax
; Line 91
	add	WORD PTR [bp-2],ax
; Line 92
; Line 95
$I1398:
	mov	WORD PTR [bp-18],-16	;p1
; Line 96
	mov	WORD PTR [bp-36],-24	;p2
; Line 97
	mov	WORD PTR [bp-54],-27	;p3
; Line 98
	mov	WORD PTR [bp-88],-13	;p4
; Line 100
	mov	WORD PTR [bp-90],16	;p5
; Line 101
	mov	WORD PTR [bp-92],24	;p6
; Line 102
	mov	WORD PTR [bp-110],27	;p7
; Line 103
	mov	WORD PTR [bp-112],13	;p8
; Line 106
	add	WORD PTR $S1371_ypos2,2
; Line 108
	add	WORD PTR $S1370_ypos,2
	cmp	WORD PTR $S1370_ypos,30
	jl	$I1399
; Line 109
	mov	ax,WORD PTR [bp-6]
	sub	ax,5
	mov	WORD PTR $S1370_ypos,ax
; Line 110
$I1399:
	cmp	WORD PTR $S1371_ypos2,30
	jl	$I1400
; Line 111
	mov	ax,WORD PTR [bp-6]
	sub	ax,5
	mov	WORD PTR $S1371_ypos2,ax
; Line 114
$I1400:
	mov	ax,WORD PTR [bp-18]	;p1
	mov	WORD PTR [bp-52],ax	;c
; Line 115
	mov	ax,WORD PTR $S1370_ypos
	mov	WORD PTR [bp-50],ax
; Line 117
	mov	cx,WORD PTR [bp-36]	;p2
	mov	WORD PTR [bp-48],cx
; Line 118
	mov	WORD PTR [bp-46],ax
; Line 120
	mov	cx,WORD PTR [bp-54]	;p3
	mov	WORD PTR [bp-44],cx
; Line 121
	add	ax,7
	mov	WORD PTR [bp-42],ax
; Line 123
	mov	cx,WORD PTR [bp-88]	;p4
	mov	WORD PTR [bp-40],cx
; Line 124
	mov	WORD PTR [bp-38],ax
; Line 127
	mov	ax,WORD PTR [bp-90]	;p5
	mov	WORD PTR [bp-70],ax	;d
; Line 128
	mov	ax,WORD PTR $S1371_ypos2
	mov	WORD PTR [bp-68],ax
; Line 130
	mov	cx,WORD PTR [bp-92]	;p6
	mov	WORD PTR [bp-66],cx
; Line 131
	mov	WORD PTR [bp-64],ax
; Line 133
	mov	cx,WORD PTR [bp-110]	;p7
	mov	WORD PTR [bp-62],cx
; Line 134
	add	ax,7
	mov	WORD PTR [bp-60],ax
; Line 136
	mov	cx,WORD PTR [bp-112]	;p8
	mov	WORD PTR [bp-58],cx
; Line 137
	mov	WORD PTR [bp-56],ax
; Line 139
	mov	WORD PTR [bp-114],0	;i
$FC1402:
; Line 140
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-114]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-108][si]
	push	ax
	lea	ax,WORD PTR [bp-52][si]
	push	ax
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-114]	;i
	cmp	WORD PTR [bp-114],4	;i
	jl	$FC1402
; Line 142
	mov	ax,WORD PTR [bp-108]	;pts
	add	ax,41
	mov	WORD PTR [bp-86],ax	;t
; Line 143
	mov	ax,WORD PTR [bp-106]
	add	ax,28
	mov	WORD PTR [bp-84],ax
; Line 144
	mov	ax,WORD PTR [bp-104]
	add	ax,41
	mov	WORD PTR [bp-82],ax
; Line 145
	mov	ax,WORD PTR [bp-102]
	add	ax,28
	mov	WORD PTR [bp-80],ax
; Line 146
	mov	ax,WORD PTR [bp-100]
	add	ax,41
	mov	WORD PTR [bp-78],ax
; Line 147
	mov	ax,WORD PTR [bp-98]
	add	ax,28
	mov	WORD PTR [bp-76],ax
; Line 148
	mov	ax,WORD PTR [bp-96]
	add	ax,41
	mov	WORD PTR [bp-74],ax
; Line 149
	mov	ax,WORD PTR [bp-94]
	add	ax,28
	mov	WORD PTR [bp-72],ax
; Line 151
	mov	ax,19
	push	ax
	lea	ax,WORD PTR [bp-86]	;t
	push	ax
	mov	ax,4
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawPoly
	add	sp,8
; Line 154
	mov	WORD PTR [bp-114],0	;i
$FC1406:
; Line 155
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-114]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-108][si]
	push	ax
	lea	ax,WORD PTR [bp-70][si]
	push	ax
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-114]	;i
	cmp	WORD PTR [bp-114],4	;i
	jl	$FC1406
; Line 157
	mov	ax,WORD PTR [bp-108]	;pts
	add	ax,41
	mov	WORD PTR [bp-86],ax	;t
; Line 158
	mov	ax,WORD PTR [bp-106]
	add	ax,28
	mov	WORD PTR [bp-84],ax
; Line 159
	mov	ax,WORD PTR [bp-104]
	add	ax,41
	mov	WORD PTR [bp-82],ax
; Line 160
	mov	ax,WORD PTR [bp-102]
	add	ax,28
	mov	WORD PTR [bp-80],ax
; Line 161
	mov	ax,WORD PTR [bp-100]
	add	ax,41
	mov	WORD PTR [bp-78],ax
; Line 162
	mov	ax,WORD PTR [bp-98]
	add	ax,28
	mov	WORD PTR [bp-76],ax
; Line 163
	mov	ax,WORD PTR [bp-96]
	add	ax,41
	mov	WORD PTR [bp-74],ax
; Line 164
	mov	ax,WORD PTR [bp-94]
	add	ax,28
	mov	WORD PTR [bp-72],ax
; Line 166
	mov	ax,19
	push	ax
	lea	ax,WORD PTR [bp-86]	;t
	push	ax
	mov	ax,4
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawPoly
	add	sp,8
; Line 170
	mov	WORD PTR [bp-114],0	;i
$FC1409:
; Line 171
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-114]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-108][si]
	push	ax
	lea	ax,WORD PTR [bp-16][si]
	push	ax
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-114]	;i
	cmp	WORD PTR [bp-114],4	;i
	jl	$FC1409
; Line 173
	mov	ax,WORD PTR [bp-108]	;pts
	add	ax,41
	mov	WORD PTR [bp-86],ax	;t
; Line 174
	mov	ax,WORD PTR [bp-106]
	add	ax,28
	mov	WORD PTR [bp-84],ax
; Line 175
	mov	ax,WORD PTR [bp-104]
	add	ax,41
	mov	WORD PTR [bp-82],ax
; Line 176
	mov	ax,WORD PTR [bp-102]
	add	ax,28
	mov	WORD PTR [bp-80],ax
; Line 177
	mov	ax,WORD PTR [bp-100]
	add	ax,41
	mov	WORD PTR [bp-78],ax
; Line 178
	mov	ax,WORD PTR [bp-98]
	add	ax,28
	mov	WORD PTR [bp-76],ax
; Line 179
	mov	ax,WORD PTR [bp-96]
	add	ax,41
	mov	WORD PTR [bp-74],ax
; Line 180
	mov	ax,WORD PTR [bp-94]
	add	ax,28
	mov	WORD PTR [bp-72],ax
; Line 182
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-86]	;t
	push	ax
	mov	ax,4
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawPoly
	add	sp,8
; Line 186
	mov	WORD PTR [bp-114],0	;i
$FC1412:
; Line 187
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-114]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-108][si]
	push	ax
	lea	ax,WORD PTR [bp-136][si]
	push	ax
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-114]	;i
	cmp	WORD PTR [bp-114],2	;i
	jl	$FC1412
; Line 189
	mov	ax,WORD PTR [bp-106]
	add	ax,28
	mov	WORD PTR [bp-118],ax	;y1
; Line 190
	mov	cx,WORD PTR [bp-104]
	add	cx,41
	mov	WORD PTR [bp-120],cx	;x2
; Line 191
	mov	dx,WORD PTR [bp-102]
	add	dx,28
	mov	WORD PTR [bp-126],dx	;y2
; Line 193
	mov	bx,19
	push	bx
	push	dx
	push	cx
	push	ax
	mov	ax,WORD PTR [bp-108]	;pts
	add	ax,41
	mov	WORD PTR [bp-116],ax	;x1
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 195
	mov	WORD PTR [bp-114],0	;i
$FC1415:
; Line 196
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-114]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-108][si]
	push	ax
	lea	ax,WORD PTR [bp-144][si]
	push	ax
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-114]	;i
	cmp	WORD PTR [bp-114],2	;i
	jl	$FC1415
; Line 198
	mov	ax,WORD PTR [bp-106]
	add	ax,28
	mov	WORD PTR [bp-118],ax	;y1
; Line 199
	mov	cx,WORD PTR [bp-104]
	add	cx,41
	mov	WORD PTR [bp-120],cx	;x2
; Line 200
	mov	dx,WORD PTR [bp-102]
	add	dx,28
	mov	WORD PTR [bp-126],dx	;y2
; Line 202
	mov	bx,19
	push	bx
	push	dx
	push	cx
	push	ax
	mov	ax,WORD PTR [bp-108]	;pts
	add	ax,41
	mov	WORD PTR [bp-116],ax	;x1
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 204
	call	VdiPitchLadder
; Line 205
	cmp	WORD PTR _MODE_MASTER,0
	jne	$I1417
; Line 206
	mov	ax,6
	push	ax
	mov	ax,28
	push	ax
	mov	ax,41
	push	ax
	push	WORD PTR _RpCRT
	call	_vdiils
	add	sp,8
; Line 207
; Line 208
$I1417:
	mov	ax,6
	push	ax
	push	WORD PTR $S1395_cpts+6
	push	WORD PTR $S1395_cpts+4
	push	WORD PTR $S1395_cpts+2
	push	WORD PTR $S1395_cpts
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 209
	mov	ax,6
	push	ax
	push	WORD PTR $S1395_cpts+10
	push	WORD PTR $S1395_cpts+8
	push	WORD PTR $S1395_cpts+6
	push	WORD PTR $S1395_cpts+4
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 210
	mov	ax,6
	push	ax
	push	WORD PTR $S1395_cpts+18
	push	WORD PTR $S1395_cpts+16
	push	WORD PTR $S1395_cpts+14
	push	WORD PTR $S1395_cpts+12
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 211
	mov	ax,6
	push	ax
	push	WORD PTR $S1395_cpts+22
	push	WORD PTR $S1395_cpts+20
	push	WORD PTR $S1395_cpts+18
	push	WORD PTR $S1395_cpts+16
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 213
	call	RangeBar
	jmp	$L20007
; Line 216
	nop	

_VdiCrt	ENDP
; Line 220
VdiPitchLadder	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,28
	call	__aNchkstk
	push	si
;	i = -20
;	base_deg = -22
;	deg = -2
;	off = -24
;	dx = -26
;	dy = -28
;	pts = -18
; Line 229
	mov	WORD PTR [bp-16],10
; Line 230
	mov	cx,1820
	mov	ax,WORD PTR _OurPitch
	cwd	
	idiv	cx
	mov	ax,dx
	shl	ax,1
	shl	ax,1
	add	ax,dx
	shl	ax,1
	cwd	
	idiv	cx
	mov	WORD PTR [bp-12],ax
; Line 232
	sub	ax,ax
	mov	WORD PTR [bp-14],ax
	mov	WORD PTR [bp-18],ax	;pts
	mov	WORD PTR [bp-20],ax	;i
	jmp	SHORT $F1427
	nop	
$FC1428:
; Line 233
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-20]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-10][si]
	push	ax
	lea	ax,WORD PTR [bp-18][si]
	push	ax
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-20]	;i
$F1427:
	cmp	WORD PTR [bp-20],2	;i
	jl	$FC1428
; Line 237
	mov	ax,WORD PTR _OurPitch
	mov	cx,1820
	cwd	
	idiv	cx
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	mov	WORD PTR [bp-22],ax	;base_deg
; Line 239
	mov	WORD PTR [bp-20],-2	;i
	jmp	SHORT $F1430
; Line 245
	nop	
$SC1437:
; Line 246
	push	WORD PTR [bp-28]	;dy
	push	WORD PTR [bp-26]	;dx
	push	ax
	call	horiz_line
$L20014:
	add	sp,6
; Line 254
	inc	WORD PTR [bp-20]	;i
$F1430:
	cmp	WORD PTR [bp-20],2	;i
	jg	$FB1432
; Line 240
	mov	ax,WORD PTR [bp-10]
	imul	WORD PTR [bp-20]	;i
	sub	ax,WORD PTR [bp-6]
	neg	ax
	add	ax,41
	mov	WORD PTR [bp-26],ax	;dx
; Line 241
	mov	ax,WORD PTR [bp-8]
	imul	WORD PTR [bp-20]	;i
	sub	ax,WORD PTR [bp-4]
	neg	ax
	add	ax,28
	mov	WORD PTR [bp-28],ax	;dy
; Line 242
	mov	ax,WORD PTR [bp-20]	;i
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,WORD PTR [bp-22]	;base_deg
	mov	WORD PTR [bp-2],ax	;deg
; Line 244
	or	ax,ax
	je	$SC1437
; Line 251
	push	WORD PTR [bp-28]	;dy
	push	WORD PTR [bp-26]	;dx
	push	ax
	call	new_horiz
	jmp	SHORT $L20014
; Line 250
	nop	
$FB1432:
; Line 255
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

VdiPitchLadder	ENDP
; Line 260
horiz_line	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	si
;	i = -10
;	pts = -8
;	yc = 8
;	xc = 6
;	deg = 4
; Line 265
	mov	WORD PTR [bp-10],0	;i
$FC1447:
; Line 266
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-10]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-8][si]
	push	ax
	add	si,OFFSET DGROUP:$S1445_hpts
	push	si
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-10]	;i
	cmp	WORD PTR [bp-10],2	;i
	jl	$FC1447
; Line 268
	mov	ax,6
	push	ax
	mov	ax,WORD PTR [bp-2]
	add	ax,WORD PTR [bp+8]	;yc
	push	ax
	mov	ax,WORD PTR [bp-4]
	add	ax,WORD PTR [bp+6]	;xc
	push	ax
	mov	ax,WORD PTR [bp-6]
	add	ax,WORD PTR [bp+8]	;yc
	push	ax
	mov	ax,WORD PTR [bp-8]	;pts
	add	ax,WORD PTR [bp+6]	;xc
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 269
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

horiz_line	ENDP
; Line 274
new_horiz	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,50
	call	__aNchkstk
	push	si
;	i = -48
;	l = -50
;	pts = -46
;	s = -10
;	yc = 8
;	xc = 6
;	deg = 4
; Line 284
	mov	ax,10
	push	ax
	lea	cx,WORD PTR [bp-10]	;s
	push	cx
	mov	ax,WORD PTR [bp+4]	;deg
	mov	cx,10
	cwd	
	idiv	cx
	push	ax
	call	_itoa
	add	sp,6
	push	ax
	push	WORD PTR _RpCRT
	call	_pstrlen
	add	sp,4
	dec	ax
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR [bp-50],ax	;l
; Line 287
	cmp	WORD PTR [bp+4],0	;deg
	jg	$JCC1604
	jmp	$I1467
$JCC1604:
; Line 288
	mov	ax,WORD PTR [bp+4]	;deg
	mov	cx,30
	cwd	
	idiv	cx
	or	dx,dx
	je	$JCC1620
	jmp	$I1463
$JCC1620:
; Line 289
	mov	WORD PTR [bp-48],dx	;i
$FC1465:
; Line 290
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-48]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-46][si]
	push	ax
	add	si,OFFSET DGROUP:$S1459_hpts3
	push	si
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-48]	;i
	cmp	WORD PTR [bp-48],5	;i
	jl	$FC1465
; Line 291
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp+8]	;yc
	add	cx,WORD PTR [bp-40]
	push	cx
	mov	cx,WORD PTR [bp+6]	;xc
	add	cx,WORD PTR [bp-42]
	push	cx
	mov	cx,WORD PTR [bp+8]	;yc
	add	cx,WORD PTR [bp-44]
	push	cx
	mov	cx,WORD PTR [bp+6]	;xc
	add	cx,WORD PTR [bp-46]	;pts
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 292
	mov	ax,6
	push	ax
	mov	ax,WORD PTR [bp+8]	;yc
	add	ax,WORD PTR [bp-32]
	push	ax
	mov	ax,WORD PTR [bp+6]	;xc
	add	ax,WORD PTR [bp-34]
	push	ax
	mov	ax,WORD PTR [bp+8]	;yc
	add	ax,WORD PTR [bp-36]
	push	ax
	mov	ax,WORD PTR [bp+6]	;xc
	add	ax,WORD PTR [bp-38]
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 293
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	ax,WORD PTR [bp+8]	;yc
	add	ax,WORD PTR [bp-28]
	sub	ax,3
	push	ax
	mov	ax,WORD PTR [bp+6]	;xc
	sub	ax,WORD PTR [bp-50]	;l
	add	ax,WORD PTR [bp-30]
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 294
; Line 295
	jmp	SHORT $I1467
	nop	
$I1463:
; Line 296
	mov	WORD PTR [bp-48],0	;i
$FC1469:
; Line 297
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-48]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-46][si]
	push	ax
	add	si,OFFSET DGROUP:$S1457_hpts
	push	si
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-48]	;i
	cmp	WORD PTR [bp-48],2	;i
	jl	$FC1469
; Line 298
	mov	ax,6
	push	ax
	mov	ax,WORD PTR [bp+8]	;yc
	add	ax,WORD PTR [bp-40]
	push	ax
	mov	ax,WORD PTR [bp+6]	;xc
	add	ax,WORD PTR [bp-42]
	push	ax
	mov	ax,WORD PTR [bp+8]	;yc
	add	ax,WORD PTR [bp-44]
	push	ax
	mov	ax,WORD PTR [bp+6]	;xc
	add	ax,WORD PTR [bp-46]	;pts
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 299
$I1467:
; Line 300
; Line 302
	cmp	WORD PTR [bp+4],0	;deg
	jl	$JCC1878
	jmp	$I1476
$JCC1878:
; Line 303
	mov	ax,WORD PTR [bp+4]	;deg
	mov	cx,30
	cwd	
	idiv	cx
	or	dx,dx
	je	$JCC1894
	jmp	$I1472
$JCC1894:
; Line 304
	mov	WORD PTR [bp-48],dx	;i
$FC1474:
; Line 305
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-48]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-46][si]
	push	ax
	add	si,OFFSET DGROUP:$S1460_hpts4
	push	si
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-48]	;i
	cmp	WORD PTR [bp-48],9	;i
	jl	$FC1474
; Line 306
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp+8]	;yc
	add	cx,WORD PTR [bp-40]
	push	cx
	mov	cx,WORD PTR [bp+6]	;xc
	add	cx,WORD PTR [bp-42]
	push	cx
	mov	cx,WORD PTR [bp+8]	;yc
	add	cx,WORD PTR [bp-44]
	push	cx
	mov	cx,WORD PTR [bp+6]	;xc
	add	cx,WORD PTR [bp-46]	;pts
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 307
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp+8]	;yc
	add	cx,WORD PTR [bp-32]
	push	cx
	mov	cx,WORD PTR [bp+6]	;xc
	add	cx,WORD PTR [bp-34]
	push	cx
	mov	cx,WORD PTR [bp+8]	;yc
	add	cx,WORD PTR [bp-36]
	push	cx
	mov	cx,WORD PTR [bp+6]	;xc
	add	cx,WORD PTR [bp-38]
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 308
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp+8]	;yc
	add	cx,WORD PTR [bp-24]
	push	cx
	mov	cx,WORD PTR [bp+6]	;xc
	add	cx,WORD PTR [bp-26]
	push	cx
	mov	cx,WORD PTR [bp+8]	;yc
	add	cx,WORD PTR [bp-28]
	push	cx
	mov	cx,WORD PTR [bp+6]	;xc
	add	cx,WORD PTR [bp-30]
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 309
	mov	ax,6
	push	ax
	mov	ax,WORD PTR [bp+8]	;yc
	add	ax,WORD PTR [bp-16]
	push	ax
	mov	ax,WORD PTR [bp+6]	;xc
	add	ax,WORD PTR [bp-18]
	push	ax
	mov	ax,WORD PTR [bp+8]	;yc
	add	ax,WORD PTR [bp-20]
	push	ax
	mov	ax,WORD PTR [bp+6]	;xc
	add	ax,WORD PTR [bp-22]
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 310
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	ax,WORD PTR [bp+8]	;yc
	add	ax,WORD PTR [bp-12]
	sub	ax,3
	push	ax
	mov	ax,WORD PTR [bp+6]	;xc
	sub	ax,WORD PTR [bp-50]	;l
	add	ax,WORD PTR [bp-14]
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 311
; Line 312
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I1472:
; Line 313
	mov	WORD PTR [bp-48],0	;i
$FC1478:
; Line 314
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-48]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-46][si]
	push	ax
	add	si,OFFSET DGROUP:$S1458_hpts2
	push	si
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-48]	;i
	cmp	WORD PTR [bp-48],6	;i
	jl	$FC1478
; Line 315
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp+8]	;yc
	add	cx,WORD PTR [bp-40]
	push	cx
	mov	cx,WORD PTR [bp+6]	;xc
	add	cx,WORD PTR [bp-42]
	push	cx
	mov	cx,WORD PTR [bp+8]	;yc
	add	cx,WORD PTR [bp-44]
	push	cx
	mov	cx,WORD PTR [bp+6]	;xc
	add	cx,WORD PTR [bp-46]	;pts
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 316
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp+8]	;yc
	add	cx,WORD PTR [bp-32]
	push	cx
	mov	cx,WORD PTR [bp+6]	;xc
	add	cx,WORD PTR [bp-34]
	push	cx
	mov	cx,WORD PTR [bp+8]	;yc
	add	cx,WORD PTR [bp-36]
	push	cx
	mov	cx,WORD PTR [bp+6]	;xc
	add	cx,WORD PTR [bp-38]
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 317
	mov	ax,6
	push	ax
	mov	ax,WORD PTR [bp+8]	;yc
	add	ax,WORD PTR [bp-24]
	push	ax
	mov	ax,WORD PTR [bp+6]	;xc
	add	ax,WORD PTR [bp-26]
	push	ax
	mov	ax,WORD PTR [bp+8]	;yc
	add	ax,WORD PTR [bp-28]
	push	ax
	mov	ax,WORD PTR [bp+6]	;xc
	add	ax,WORD PTR [bp-30]
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 318
$I1476:
; Line 319
; Line 320
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

new_horiz	ENDP
; Line 329
pitch_line	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,114
	call	__aNchkstk
	push	di
	push	si
;	i = -110
;	l = -112
;	d = -12
;	pts = -60
;	rpts = -108
;	s = -10
;	yc = 8
;	xc = 6
;	deg = 4
; Line 338
	mov	ax,WORD PTR [bp+4]	;deg
	mov	WORD PTR [bp-12],ax	;d
	cmp	ax,90
	jle	$I1492
	sub	ax,180
	mov	WORD PTR [bp+4],ax	;deg
; Line 339
$I1492:
	cmp	ax,-90
	jge	$I1493
	add	WORD PTR [bp+4],180	;deg
; Line 343
$I1493:
	mov	WORD PTR [bp-110],0	;i
	jmp	SHORT $F1494
	nop	
$L20001:
	mov	ax,WORD PTR [bp-110]	;i
	shl	ax,1
	shl	ax,1
	add	ax,OFFSET DGROUP:$S1491_hpts1
$L20002:
	mov	WORD PTR [bp-114],ax
	mov	ax,91
	imul	WORD PTR [bp+4]	;deg
	push	ax
	mov	si,WORD PTR [bp-110]	;i
	mov	ax,si
	shl	si,1
	add	si,ax
	shl	si,1
	lea	ax,WORD PTR [bp-60][si]
	push	ax
	push	WORD PTR [bp-114]
	mov	di,ax
	call	_rotate_pt
	add	sp,6
; Line 346
	add	WORD PTR [di],5
	mov	ax,WORD PTR [di]
	neg	ax
	mov	WORD PTR [bp-36][si],ax
; Line 347
	mov	ax,WORD PTR [bp-58][si]
	mov	WORD PTR [bp-34][si],ax
; Line 348
	inc	WORD PTR [bp-110]	;i
$F1494:
	cmp	WORD PTR [bp-110],4	;i
	jge	$FB1496
; Line 344
	cmp	WORD PTR [bp+4],0	;deg
	jl	$L20001
	mov	ax,WORD PTR [bp-110]	;i
	shl	ax,1
	shl	ax,1
	add	ax,OFFSET DGROUP:$S1490_hpts0
	jmp	SHORT $L20002
	nop	
$FB1496:
; Line 350
	mov	WORD PTR [bp-110],0	;i
$FC1498:
; Line 351
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-110]	;i
	mov	ax,si
	shl	si,1
	add	si,ax
	shl	si,1
	lea	ax,WORD PTR [bp-108][si]
	push	ax
	lea	ax,WORD PTR [bp-60][si]
	push	ax
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-110]	;i
	cmp	WORD PTR [bp-110],8	;i
	jl	$FC1498
; Line 355
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	push	WORD PTR [bp+4]	;deg
	call	_abs
	add	sp,2
	push	ax
	call	_itoa
	add	sp,6
	push	ax
	push	WORD PTR _RpCRT
	call	_pstrlen
	add	sp,4
	dec	ax
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR [bp-112],ax	;l
; Line 357
	mov	WORD PTR [bp-110],0	;i
	jmp	SHORT $F1500
$I1503:
; Line 363
	mov	ax,2
	push	ax
	mov	ax,6
	push	ax
	mov	si,WORD PTR [bp-110]	;i
	mov	cx,si
	shl	si,1
	add	si,cx
	shl	si,1
	mov	cx,WORD PTR [bp-100][si]
	add	cx,WORD PTR [bp+8]	;yc
	push	cx
	mov	cx,WORD PTR [bp-102][si]
	add	cx,WORD PTR [bp+6]	;xc
	push	cx
	mov	cx,WORD PTR [bp-106][si]
	add	cx,WORD PTR [bp+8]	;yc
	push	cx
	mov	cx,WORD PTR [bp-108][si]
	add	cx,WORD PTR [bp+6]	;xc
	push	cx
	push	WORD PTR _RpCRT
	call	dashline
	add	sp,14
$I1504:
; Line 364
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	si,WORD PTR [bp-110]	;i
	mov	ax,si
	shl	si,1
	add	si,ax
	shl	si,1
	mov	ax,WORD PTR [bp-88][si]
	add	ax,WORD PTR [bp+8]	;yc
	sub	ax,3
	push	ax
	mov	ax,WORD PTR [bp-90][si]
	sub	ax,WORD PTR [bp-112]	;l
	add	ax,WORD PTR [bp+6]	;xc
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 365
	add	WORD PTR [bp-110],4	;i
$F1500:
	cmp	WORD PTR [bp-110],8	;i
	jge	$FB1502
; Line 358
	cmp	WORD PTR [bp-12],0	;d
	jle	$I1503
; Line 360
	mov	ax,6
	push	ax
	mov	si,WORD PTR [bp-110]	;i
	mov	cx,si
	shl	si,1
	add	si,cx
	shl	si,1
	mov	cx,WORD PTR [bp-100][si]
	add	cx,WORD PTR [bp+8]	;yc
	push	cx
	mov	cx,WORD PTR [bp-102][si]
	add	cx,WORD PTR [bp+6]	;xc
	push	cx
	mov	cx,WORD PTR [bp-106][si]
	add	cx,WORD PTR [bp+8]	;yc
	push	cx
	mov	cx,WORD PTR [bp-108][si]
	add	cx,WORD PTR [bp+6]	;xc
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 361
	jmp	SHORT $I1504
	nop	
$FB1502:
; Line 366
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

pitch_line	ENDP
; Line 373
dashline	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__aNchkstk
;	dx = -18
;	dy = -20
;	xi = -2
;	yi = -4
;	d = -10
;	n = -22
;	c = -6
;	f = -12
;	x = -14
;	y = -16
;	t = -8
;	pix = 16
;	clr = 14
;	y1 = 12
;	x1 = 10
;	y0 = 8
;	x0 = 6
;	rp = 4
; Line 377
	mov	ax,WORD PTR [bp+6]	;x0
	cmp	WORD PTR [bp+10],ax	;x1
	jge	$I1524
; Line 378
	mov	WORD PTR [bp-22],ax	;n
	mov	ax,WORD PTR [bp+10]	;x1
	mov	WORD PTR [bp+6],ax	;x0
	mov	ax,WORD PTR [bp-22]	;n
	mov	WORD PTR [bp+10],ax	;x1
; Line 379
	mov	ax,WORD PTR [bp+8]	;y0
	mov	WORD PTR [bp-22],ax	;n
	mov	ax,WORD PTR [bp+12]	;y1
	mov	WORD PTR [bp+8],ax	;y0
	mov	ax,WORD PTR [bp-22]	;n
	mov	WORD PTR [bp+12],ax	;y1
; Line 380
; Line 382
$I1524:
	mov	WORD PTR [bp-2],1	;xi
; Line 383
	mov	ax,WORD PTR [bp+8]	;y0
	cmp	WORD PTR [bp+12],ax	;y1
	jl	$L20003
	mov	ax,1
	jmp	SHORT $L20004
$L20003:
	mov	ax,-1
$L20004:
	mov	WORD PTR [bp-4],ax	;yi
; Line 384
	mov	ax,WORD PTR [bp+10]	;x1
	sub	ax,WORD PTR [bp+6]	;x0
	mov	WORD PTR [bp-18],ax	;dx
; Line 386
	lea	ax,WORD PTR [bp+6]	;x0
	mov	WORD PTR [bp-14],ax	;x
; Line 387
	lea	cx,WORD PTR [bp+8]	;y0
	mov	WORD PTR [bp-16],cx	;y
; Line 389
	mov	dx,WORD PTR [bp+12]	;y1
	sub	dx,WORD PTR [bp+8]	;y0
	push	dx
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-20],ax	;dy
	cmp	ax,WORD PTR [bp-18]	;dx
	jle	$I1525
; Line 390
	mov	cx,WORD PTR [bp-18]	;dx
	mov	WORD PTR [bp-18],ax	;dx
	mov	ax,cx
	mov	WORD PTR [bp-20],ax	;dy
; Line 391
	mov	ax,WORD PTR [bp-4]	;yi
	mov	WORD PTR [bp-2],ax	;xi
	mov	ax,1
	mov	WORD PTR [bp-22],ax	;n
	mov	WORD PTR [bp-4],ax	;yi
; Line 392
	lea	ax,WORD PTR [bp+8]	;y0
	mov	WORD PTR [bp-14],ax	;x
	lea	ax,WORD PTR [bp+6]	;x0
	mov	WORD PTR [bp-16],ax	;y
; Line 393
; Line 395
$I1525:
	mov	WORD PTR [bp-12],1	;f
; Line 396
	mov	ax,WORD PTR [bp+16]	;pix
	mov	WORD PTR [bp-6],ax	;c
; Line 397
	mov	ax,WORD PTR [bp-18]	;dx
	mov	WORD PTR [bp-22],ax	;n
; Line 398
	sub	ax,-1
	neg	ax
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR [bp-10],ax	;d
; Line 400
	jmp	SHORT $L20021
$FC1527:
; Line 401
	cmp	WORD PTR [bp-12],0	;f
	je	$I1529
	push	WORD PTR [bp+14]	;clr
	push	WORD PTR [bp+8]	;y0
	push	WORD PTR [bp+6]	;x0
	push	WORD PTR [bp+4]	;rp
	call	FAR PTR _DrawDot
	add	sp,8
; Line 402
$I1529:
	dec	WORD PTR [bp-6]	;c
	jne	$I1530
; Line 403
	xor	BYTE PTR [bp-12],1	;f
; Line 404
	mov	ax,WORD PTR [bp+16]	;pix
	mov	WORD PTR [bp-6],ax	;c
; Line 405
; Line 406
$I1530:
	mov	ax,WORD PTR [bp-2]	;xi
	mov	bx,WORD PTR [bp-14]	;x
	add	WORD PTR [bx],ax
; Line 408
	mov	ax,WORD PTR [bp-20]	;dy
	add	WORD PTR [bp-10],ax	;d
	cmp	WORD PTR [bp-10],0	;d
	jle	$L20021
; Line 409
	mov	ax,WORD PTR [bp-10]	;d
	sub	ax,WORD PTR [bp-18]	;dx
	mov	WORD PTR [bp-10],ax	;d
; Line 410
	mov	ax,WORD PTR [bp-4]	;yi
	mov	bx,WORD PTR [bp-16]	;y
	add	WORD PTR [bx],ax
; Line 411
; Line 412
$L20021:
	mov	ax,WORD PTR [bp-22]	;n
	dec	WORD PTR [bp-22]	;n
	or	ax,ax
	jne	$FC1527
; Line 413
	mov	sp,bp
	pop	bp
	ret	

dashline	ENDP
; Line 419
	PUBLIC	_VDITacxy
_VDITacxy	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	dy = -4
;	dx = -2
;	y = 6
;	x = 4
; Line 423
	mov	WORD PTR _sz,-1
; Line 425
	mov	cl,7
	sub	cl,BYTE PTR _Tscale
	mov	ax,WORD PTR [bp+4]	;x
	sub	ax,WORD PTR _Px
	sar	ax,cl
	mov	WORD PTR [bp-2],ax	;dx
; Line 426
	mov	dx,WORD PTR [bp+6]	;y
	sub	dx,WORD PTR _Py
	sar	dx,cl
	mov	WORD PTR [bp-4],dx	;dy
; Line 428
	push	ax
	mov	si,dx
	call	_abs
	add	sp,2
	push	si
	mov	si,ax
	call	_abs
	add	sp,2
	add	si,ax
	cmp	si,82
	ja	$I1540
; Line 429
	mov	ax,OFFSET _sy
	push	ax
	mov	cx,OFFSET _sx
	push	cx
	push	WORD PTR _OurHead
	push	WORD PTR [bp-4]	;dy
	push	WORD PTR [bp-2]	;dx
	call	_Rotate2D
	add	sp,10
; Line 432
	mov	cl,3
	mov	ax,WORD PTR _sy
	sar	ax,cl
	sub	ax,57
	neg	ax
	add	WORD PTR _sy,ax
; Line 435
	add	WORD PTR _sx,41
	js	$I1539
	cmp	WORD PTR _sx,82
	jge	$I1539
	cmp	WORD PTR _sy,0
	jl	$I1539
	cmp	WORD PTR _sy,57
	jge	$I1539
	mov	WORD PTR _sz,0
; Line 436
$I1539:
	cmp	WORD PTR _sy,57
	jle	$I1540
	mov	WORD PTR _sz,-1
; Line 437
$I1540:
; Line 440
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_VDITacxy	ENDP
; Line 446
show_range	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	s = -4
;	l = -6
; Line 451
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+16],4
; Line 452
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+12],15
; Line 454
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-4]	;s
	push	ax
	mov	bx,WORD PTR _Tscale
	shl	bx,1
	push	WORD PTR $S1542_RANGES[bx]
	call	_itoa
	add	sp,6
	push	ax
	push	WORD PTR _RpCRT
	call	_pstrlen
	add	sp,4
	mov	WORD PTR [bp-6],ax	;l
; Line 456
	lea	ax,WORD PTR [bp-4]	;s
	push	ax
	mov	ax,3
	push	ax
	mov	ax,65
	sub	ax,WORD PTR [bp-6]	;l
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
; Line 458
	mov	sp,bp
	pop	bp
	ret	
	nop	

show_range	ENDP
; Line 462
DisplayScanLimits	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 463
	mov	ax,30
	push	ax
	mov	cx,28
	push	cx
	mov	dx,82
	push	dx
	mov	dx,57
	push	dx
	mov	bx,41
	push	bx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 464
	mov	ax,30
	push	ax
	mov	ax,28
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,57
	push	ax
	mov	ax,41
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 465
	ret	
	nop	

DisplayScanLimits	ENDP
; Line 469
draw_target	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
	push	si
;	d = -6
;	clr = -4
;	temp = -8
;	x1 = -12
;	y1 = -16
;	x2 = -14
;	y2 = -20
;	off = -18
;	taillength = -22
;	font = -10
;	alt = -2
;	age = 6
;	t = 4
; Line 472
	mov	WORD PTR [bp-22],5	;taillength
; Line 478
	mov	bx,WORD PTR [bp+4]	;t
	mov	ax,WORD PTR [bx+16]
	sub	ax,WORD PTR _OurHead
	add	ah,8
	mov	al,ah
	cbw	
	mov	cl,4
	sar	ax,cl
	and	ax,15
	mov	WORD PTR [bp-6],ax	;d
; Line 483
	mov	si,WORD PTR _RpCRT
	mov	ax,WORD PTR [si+16]
	mov	WORD PTR [bp-10],ax	;font
; Line 484
	mov	WORD PTR [si+16],4
; Line 485
	mov	ax,15
	mov	WORD PTR [bp-4],ax	;clr
	mov	si,WORD PTR _RpCRT
	mov	WORD PTR [si+12],ax
; Line 488
	push	WORD PTR [bx+4]
	push	WORD PTR [bx+2]
	call	_VDITacxy
	add	sp,4
; Line 490
	mov	ax,15
	push	ax
	mov	cx,WORD PTR _sy
	dec	cx
	dec	cx
	push	cx
	mov	dx,WORD PTR _sx
	inc	dx
	inc	dx
	push	dx
	push	cx
	mov	cx,WORD PTR _sx
	dec	cx
	dec	cx
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 491
	mov	ax,15
	push	ax
	push	WORD PTR _sy
	mov	cx,WORD PTR _sx
	dec	cx
	dec	cx
	push	cx
	mov	dx,WORD PTR _sy
	dec	dx
	dec	dx
	push	dx
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 492
	mov	ax,15
	push	ax
	push	WORD PTR _sy
	mov	cx,WORD PTR _sx
	inc	cx
	inc	cx
	push	cx
	mov	dx,WORD PTR _sy
	dec	dx
	dec	dx
	push	dx
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 495
	mov	bx,WORD PTR [bp+4]	;t
	mov	ax,WORD PTR [bx+6]
	mov	cx,250
	cwd	
	idiv	cx
	mov	WORD PTR [bp-2],ax	;alt
; Line 497
	cmp	ax,5
	jle	$I1560
	cmp	ax,15
	jg	$I1560
; Line 498
	mov	ax,OFFSET DGROUP:$SG1561
	push	ax
	mov	ax,WORD PTR _sy
	dec	ax
	dec	ax
	push	ax
	mov	ax,WORD PTR _sx
	sub	ax,6
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 499
$I1560:
	cmp	WORD PTR [bp-2],15	;alt
	jle	$I1562
	cmp	WORD PTR [bp-2],25	;alt
	jg	$I1562
; Line 500
	mov	ax,OFFSET DGROUP:$SG1563
	push	ax
	mov	ax,WORD PTR _sy
	dec	ax
	dec	ax
	push	ax
	mov	ax,WORD PTR _sx
	sub	ax,6
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 501
$I1562:
	cmp	WORD PTR [bp-2],25	;alt
	jle	$I1564
	cmp	WORD PTR [bp-2],35	;alt
	jg	$I1564
; Line 502
	mov	ax,OFFSET DGROUP:$SG1565
	push	ax
	mov	ax,WORD PTR _sy
	dec	ax
	dec	ax
	push	ax
	mov	ax,WORD PTR _sx
	sub	ax,6
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 503
$I1564:
	cmp	WORD PTR [bp-2],35	;alt
	jle	$I1566
	cmp	WORD PTR [bp-2],45	;alt
	jg	$I1566
; Line 504
	mov	ax,OFFSET DGROUP:$SG1567
	push	ax
	mov	ax,WORD PTR _sy
	dec	ax
	dec	ax
	push	ax
	mov	ax,WORD PTR _sx
	sub	ax,6
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 505
$I1566:
	cmp	WORD PTR [bp-2],45	;alt
	jle	$I1568
	cmp	WORD PTR [bp-2],55	;alt
	jg	$I1568
; Line 506
	mov	ax,OFFSET DGROUP:$SG1569
	push	ax
	mov	ax,WORD PTR _sy
	dec	ax
	dec	ax
	push	ax
	mov	ax,WORD PTR _sx
	sub	ax,6
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 509
$I1568:
	mov	ax,OFFSET DGROUP:$SG1570
	push	ax
	mov	ax,WORD PTR _sy
	dec	ax
	dec	ax
	push	ax
	mov	ax,WORD PTR _sx
	add	ax,4
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 510
	mov	ax,WORD PTR [bp-10]	;font
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+16],ax
; Line 513
	mov	ax,WORD PTR [bp-6]	;d
	jmp	$S1571
; Line 514
$SC1575:
; Line 516
	mov	ax,WORD PTR _sx
	mov	WORD PTR [bp-14],ax	;x2
	mov	WORD PTR [bp-12],ax	;x1
; Line 517
	mov	ax,WORD PTR _sy
	mov	WORD PTR [bp-16],ax	;y1
; Line 518
$L20022:
	sub	ax,WORD PTR [bp-22]	;taillength
$L20023:
	mov	WORD PTR [bp-20],ax	;y2
; Line 519
	jmp	$SB1572
; Line 520
$SC1576:
; Line 524
	mov	ax,WORD PTR _sy
	mov	WORD PTR [bp-16],ax	;y1
	sub	ax,WORD PTR [bp-22]	;taillength
	mov	WORD PTR [bp-20],ax	;y2
; Line 525
	mov	ax,WORD PTR _sx
	mov	WORD PTR [bp-12],ax	;x1
; Line 526
	add	ax,WORD PTR [bp-22]	;taillength
	mov	WORD PTR [bp-14],ax	;x2
; Line 527
	jmp	$SB1572
; Line 528
	nop	
$SC1577:
; Line 530
	mov	ax,WORD PTR _sx
	mov	WORD PTR [bp-12],ax	;x1
	add	ax,WORD PTR [bp-22]	;taillength
	mov	WORD PTR [bp-14],ax	;x2
; Line 531
	mov	ax,WORD PTR _sy
	mov	WORD PTR [bp-16],ax	;y1
	jmp	SHORT $L20023
; Line 534
$SC1578:
; Line 538
	mov	ax,WORD PTR _sy
	mov	WORD PTR [bp-16],ax	;y1
; Line 539
	mov	cx,WORD PTR _sx
	mov	WORD PTR [bp-12],cx	;x1
	add	cx,WORD PTR [bp-22]	;taillength
$L20025:
	mov	WORD PTR [bp-14],cx	;x2
; Line 540
$L20024:
	add	ax,WORD PTR [bp-22]	;taillength
	jmp	SHORT $L20023
; Line 542
$SC1579:
; Line 544
	mov	ax,WORD PTR _sx
	mov	WORD PTR [bp-14],ax	;x2
	mov	WORD PTR [bp-12],ax	;x1
; Line 545
	mov	ax,WORD PTR _sy
	mov	WORD PTR [bp-16],ax	;y1
	jmp	SHORT $L20024
; Line 548
	nop	
$SC1580:
; Line 552
	mov	ax,WORD PTR _sy
	mov	WORD PTR [bp-16],ax	;y1
; Line 553
	mov	cx,WORD PTR _sx
	mov	WORD PTR [bp-12],cx	;x1
	sub	cx,WORD PTR [bp-22]	;taillength
	jmp	SHORT $L20025
; Line 556
$SC1581:
; Line 558
	mov	ax,WORD PTR _sy
	mov	WORD PTR [bp-16],ax	;y1
; Line 559
	mov	cx,WORD PTR _sx
	mov	WORD PTR [bp-12],cx	;x1
	sub	cx,WORD PTR [bp-22]	;taillength
	mov	WORD PTR [bp-14],cx	;x2
	jmp	$L20023
; Line 562
$SC1582:
; Line 566
	mov	ax,WORD PTR _sy
	mov	WORD PTR [bp-16],ax	;y1
; Line 567
	mov	cx,WORD PTR _sx
	mov	WORD PTR [bp-12],cx	;x1
	sub	cx,WORD PTR [bp-22]	;taillength
	mov	WORD PTR [bp-14],cx	;x2
	jmp	$L20022
$S1571:
	cmp	ax,15
	ja	$SB1572
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20005[bx]
	nop	
$L20005:
		DW	$SC1575
		DW	$SC1576
		DW	$SC1576
		DW	$SC1576
		DW	$SC1577
		DW	$SC1578
		DW	$SC1578
		DW	$SC1578
		DW	$SC1579
		DW	$SC1580
		DW	$SC1580
		DW	$SC1580
		DW	$SC1581
		DW	$SC1582
		DW	$SC1582
		DW	$SC1582
$SB1572:
; Line 572
	push	WORD PTR [bp-4]	;clr
	push	WORD PTR [bp-20]	;y2
	push	WORD PTR [bp-14]	;x2
	push	WORD PTR [bp-16]	;y1
	push	WORD PTR [bp-12]	;x1
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 574
	pop	si
	mov	sp,bp
	pop	bp
	ret	

draw_target	ENDP
; Line 581
RangeBar	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__aNchkstk
	push	di
	push	si
;	i = -12
;	y1 = -14
;	y2 = -16
;	r = -2
;	v = -8
;	y = -10
;	s = -6
; Line 586
	cmp	WORD PTR _AWG9_MODE,300
	jne	$JCC4075
	jmp	$I1591
$JCC4075:
	cmp	WORD PTR _AWG9_MODE,202
	jne	$JCC4086
	jmp	$I1591
$JCC4086:
; Line 587
	mov	ax,0
	jmp	$EX1583
; Line 589
$I1591:
	mov	ax,6
	push	ax
	mov	cx,15
	push	cx
	mov	cx,28
	push	cx
	mov	cx,41
	push	cx
	push	WORD PTR _RpCRT
	call	_draw_circle
	add	sp,10
; Line 591
	mov	bx,WORD PTR _RANGE
	shl	bx,1
	mov	ax,WORD PTR _BRANGES[bx]
	cwd	
	push	dx
	push	ax
	mov	ax,-40
	imul	WORD PTR _PDT_RNG
	push	dx
	push	ax
	call	__aNldiv
	add	ax,39
	mov	WORD PTR [bp-10],ax	;y
; Line 593
	mov	ax,19
	push	ax
	mov	cx,45
	push	cx
	mov	dx,17
	push	dx
	mov	bx,5
	push	bx
	push	dx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 594
	mov	ax,19
	push	ax
	mov	cx,45
	push	cx
	mov	cx,16
	push	cx
	mov	dx,5
	push	dx
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 598
	mov	bx,WORD PTR _RANGE
	shl	bx,1
	mov	ax,WORD PTR _RANGES[bx]
	mov	WORD PTR [bp-2],ax	;r
; Line 600
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+12],19
; Line 601
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-6]	;s
	push	ax
	push	WORD PTR [bp-2]	;r
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,48
	push	ax
	mov	ax,17
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 605
	cmp	WORD PTR _PW,0
	jne	$JCC4277
	jmp	$I1593
$JCC4277:
; Line 606
	mov	ax,WORD PTR [bp-2]	;r
	cwd	
	push	dx
	push	ax
	mov	ax,24
	imul	WORD PTR _PW
	mov	bx,ax
	mov	ax,WORD PTR _ORDNANCE[bx+18]
	cwd	
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	__aNldiv
	sub	ax,39
	neg	ax
	mov	WORD PTR [bp-14],ax	;y1
; Line 607
	mov	ax,WORD PTR [bp-2]	;r
	cwd	
	push	dx
	push	ax
	mov	ax,24
	imul	WORD PTR _PW
	mov	bx,ax
	mov	ax,WORD PTR _ORDNANCE[bx+16]
	cwd	
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	__aNldiv
	sub	ax,39
	neg	ax
	mov	WORD PTR [bp-16],ax	;y2
; Line 608
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp-14]	;y1
	add	cx,5
	push	cx
	mov	cx,20
	push	cx
	mov	dx,WORD PTR [bp-14]	;y1
	add	dx,5
	push	dx
	mov	dx,17
	push	dx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 609
	mov	ax,6
	push	ax
	add	ax,WORD PTR [bp-14]	;y1
	push	ax
	mov	ax,20
	push	ax
	mov	cx,WORD PTR [bp-14]	;y1
	add	cx,6
	push	cx
	mov	cx,17
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 610
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp-16]	;y2
	add	cx,5
	push	cx
	mov	cx,20
	push	cx
	mov	dx,WORD PTR [bp-16]	;y2
	add	dx,5
	push	dx
	mov	dx,17
	push	dx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 611
	mov	ax,6
	push	ax
	add	ax,WORD PTR [bp-16]	;y2
	push	ax
	mov	ax,20
	push	ax
	mov	ax,WORD PTR [bp-16]	;y2
	add	ax,6
	push	ax
	mov	ax,17
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 612
; Line 614
$I1593:
	cmp	WORD PTR [bp-10],0	;y
	jge	$JCC4514
	jmp	$I1594
$JCC4514:
	cmp	WORD PTR [bp-10],50	;y
	jle	$JCC4523
	jmp	$I1594
$JCC4523:
; Line 615
	add	WORD PTR [bp-10],4	;y
; Line 616
	mov	ax,6
	push	ax
	push	WORD PTR [bp-10]	;y
	mov	cx,12
	push	cx
	push	WORD PTR [bp-10]	;y
	mov	dx,16
	push	dx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 617
	mov	ax,6
	push	ax
	mov	ax,WORD PTR [bp-10]	;y
	inc	ax
	push	ax
	mov	ax,12
	push	ax
	mov	ax,WORD PTR [bp-10]	;y
	inc	ax
	push	ax
	mov	ax,16
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 618
; Line 619
$I1594:
	call	TD_box
; Line 620
$EX1583:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

RangeBar	ENDP
; Line 627
TD_box	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	di
	push	si
;	x = -2
;	y = -4
;	l = -6
; Line 631
	cmp	WORD PTR _PDT_PROJ,0
	jne	$I1600
	sub	ax,ax
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 633
	nop	
$I1600:
; Line 634
	mov	ax,WORD PTR _PDT_PROJ_Y
	add	ax,28
	mov	WORD PTR [bp-4],ax	;y
; Line 638
	mov	cx,19
	push	cx
	sub	ax,3
	push	ax
	mov	dx,WORD PTR _PDT_PROJ_X
	add	dx,41
	mov	WORD PTR [bp-2],dx	;x
	inc	dx
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-2]	;x
	dec	ax
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 639
	mov	ax,19
	push	ax
	mov	cx,WORD PTR [bp-4]	;y
	dec	cx
	dec	cx
	push	cx
	mov	dx,WORD PTR [bp-2]	;x
	inc	dx
	push	dx
	push	cx
	mov	cx,WORD PTR [bp-2]	;x
	dec	cx
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 640
	mov	ax,19
	push	ax
	mov	cx,WORD PTR [bp-4]	;y
	dec	cx
	push	cx
	mov	dx,WORD PTR [bp-2]	;x
	add	dx,3
	push	dx
	push	cx
	mov	cx,WORD PTR [bp-2]	;x
	sub	cx,3
	push	cx
	push	WORD PTR _RpCRT
	mov	si,cx
	mov	di,dx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 641
	mov	ax,19
	push	ax
	push	WORD PTR [bp-4]	;y
	push	di
	push	WORD PTR [bp-4]	;y
	push	si
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 642
	mov	ax,19
	push	ax
	mov	ax,WORD PTR [bp-4]	;y
	inc	ax
	push	ax
	push	di
	push	ax
	push	si
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 643
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

TD_box	ENDP
_TEXT	ENDS
END
