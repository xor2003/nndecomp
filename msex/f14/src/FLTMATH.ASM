;	Static Name Aliases
;
	TITLE   C:\FLTMATH.C
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
EXTRN	__aNchkstk:NEAR
EXTRN	__aNuldiv:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_MatMul:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_Icos:NEAR
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_TRGTB:BYTE
EXTRN	_FM:BYTE
EXTRN	_OurHead:WORD
EXTRN	_OurPitch:WORD
EXTRN	_OurRoll:WORD
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 19
; Line 2
; Line 3
; Line 4
; Line 5
; Line 24
	PUBLIC	_MatrixMul
_MatrixMul	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
;	TM = -18
;	B = 6
;	A = 4
; Line 29
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	push	WORD PTR [bp+6]	;B
	push	WORD PTR [bp+4]	;A
	call	_MatMul
	add	sp,6
; Line 31
	mov	ax,18
	push	ax
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	mov	ax,OFFSET _FM
	push	ax
	call	_memcpy
; Line 33
	mov	sp,bp
	pop	bp
	ret	

_MatrixMul	ENDP
; Line 44
	PUBLIC	_Decompose
_Decompose	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	CosPitch = -2
; Line 48
	mov	ax,WORD PTR _FM+10
	neg	ax
	push	ax
	call	_Iasin
	add	sp,2
	mov	WORD PTR _OurPitch,ax
; Line 51
	push	ax
	call	_Icos
	add	sp,2
	mov	WORD PTR [bp-2],ax	;CosPitch
	or	ax,ax
	jne	$JCC80
	jmp	$I574
$JCC80:
; Line 53
	push	WORD PTR _FM+4
	call	_abs
	add	sp,2
	cmp	ax,23169
	jge	$I576
; Line 54
	push	WORD PTR [bp-2]	;CosPitch
	push	WORD PTR _FM+4
	call	_IntDiv
	add	sp,4
	push	ax
	call	_abs
	add	sp,2
	push	ax
	call	_Iasin
	jmp	SHORT $L20003
$I576:
; Line 56
	push	WORD PTR [bp-2]	;CosPitch
	push	WORD PTR _FM+16
	call	_IntDiv
	add	sp,4
	push	ax
	call	_abs
	add	sp,2
	push	ax
	call	_Iacos
$L20003:
	add	sp,2
	mov	WORD PTR _OurHead,ax
; Line 57
; Line 60
	cmp	WORD PTR _FM+4,0
	jg	$I578
	cmp	WORD PTR _FM+16,0
	jge	$I578
	add	BYTE PTR _OurHead+1,128
; Line 61
$I578:
	cmp	WORD PTR _FM+4,0
	jle	$I579
	cmp	WORD PTR _FM+16,0
	jge	$I579
	mov	ax,-32768
	sub	ax,WORD PTR _OurHead
	mov	WORD PTR _OurHead,ax
; Line 62
$I579:
	cmp	WORD PTR _FM+4,0
	jge	$I580
	cmp	WORD PTR _FM+16,0
	jle	$I580
	neg	WORD PTR _OurHead
; Line 64
$I580:
	push	WORD PTR _FM+6
	call	_abs
	add	sp,2
	cmp	ax,23169
	jge	$I581
; Line 65
	push	WORD PTR [bp-2]	;CosPitch
	push	WORD PTR _FM+6
	call	_IntDiv
	add	sp,4
	push	ax
	call	_abs
	add	sp,2
	push	ax
	call	_Iasin
	jmp	SHORT $L20004
$I581:
; Line 67
	push	WORD PTR [bp-2]	;CosPitch
	push	WORD PTR _FM+8
	call	_IntDiv
	add	sp,4
	push	ax
	call	_abs
	add	sp,2
	push	ax
	call	_Iacos
$L20004:
	add	sp,2
	mov	WORD PTR _OurRoll,ax
; Line 68
; Line 71
	cmp	WORD PTR _FM+6,0
	jg	$I583
	cmp	WORD PTR _FM+8,0
	jge	$I583
	add	BYTE PTR _OurRoll+1,128
; Line 72
$I583:
	cmp	WORD PTR _FM+6,0
	jle	$I584
	cmp	WORD PTR _FM+8,0
	jge	$I584
	mov	ax,-32768
	sub	ax,WORD PTR _OurRoll
	mov	WORD PTR _OurRoll,ax
; Line 73
$I584:
	cmp	WORD PTR _FM+6,0
	jge	$I589
	cmp	WORD PTR _FM+8,0
	jle	$I589
	neg	WORD PTR _OurRoll
; Line 75
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I574:
; Line 76
	mov	WORD PTR _OurRoll,0
; Line 77
	push	WORD PTR _FM+2
	call	_Iasin
	add	sp,2
	mov	WORD PTR _OurHead,ax
; Line 80
	cmp	WORD PTR _FM+6,0
	jg	$I587
	cmp	WORD PTR _FM+8,0
	jge	$I587
	add	BYTE PTR _OurHead+1,128
; Line 81
$I587:
	cmp	WORD PTR _FM+6,0
	jle	$I588
	cmp	WORD PTR _FM+8,0
	jge	$I588
	mov	ax,-32768
	sub	ax,WORD PTR _OurHead
	mov	WORD PTR _OurHead,ax
; Line 82
$I588:
	cmp	WORD PTR _FM+6,0
	jge	$I589
	cmp	WORD PTR _FM+8,0
	jle	$I589
	neg	WORD PTR _OurHead
; Line 83
$I589:
; Line 85
	mov	sp,bp
	pop	bp
	ret	

_Decompose	ENDP
; Line 88
	PUBLIC	_abs
_abs	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	x = 4
; Line 89
	cmp	WORD PTR [bp+4],-32768	;x
	jne	$I592
; Line 90
	mov	ax,32767
	mov	sp,bp
	pop	bp
	ret	
$I592:
	cmp	WORD PTR [bp+4],0	;x
	jge	$I594
; Line 92
	mov	ax,WORD PTR [bp+4]	;x
	neg	ax
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I594:
; Line 94
	mov	ax,WORD PTR [bp+4]	;x
; Line 95
; Line 96
	mov	sp,bp
	pop	bp
	ret	
	nop	

_abs	ENDP
; Line 109
	PUBLIC	_IntDiv
_IntDiv	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
	push	si
;	S1 = -2
;	S2 = -4
;	LA = -8
;	LB = -12
;	B = 6
;	A = 4
; Line 111
	mov	al,1
	mov	BYTE PTR [bp-2],al	;S1
	mov	BYTE PTR [bp-4],al	;S2
; Line 114
	cmp	WORD PTR [bp+4],0	;A
	jge	$I603
	mov	BYTE PTR [bp-2],255	;S1
; Line 116
$I603:
	cmp	WORD PTR [bp+6],0	;B
	jge	$I604
	mov	BYTE PTR [bp-4],255	;S2
; Line 118
$I604:
; Line 119
	mov	ax,WORD PTR [bp+6]	;B
	cwd	
	xor	ax,dx
	sub	ax,dx
	cwd	
; Line 121
	push	dx
	push	ax
	mov	ax,WORD PTR [bp+4]	;A
	cwd	
	xor	ax,dx
	sub	ax,dx
	cwd	
	sub	cx,cx
	push	ax
	push	cx
	call	__aNuldiv
	shr	dx,1
	rcr	ax,1
	mov	cx,ax
	mov	al,BYTE PTR [bp-4]	;S2
	mov	dx,ax
	mov	al,BYTE PTR [bp-2]	;S1
	cbw	
	mov	bx,ax
	mov	al,dl
	cbw	
	mov	si,ax
	mov	ax,cx
	imul	si
	imul	bx
; Line 124
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_IntDiv	ENDP
; Line 137
	PUBLIC	_Iasin
_Iasin	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	AA = -4
;	angl = -2
;	delta = -8
;	i = -6
;	A = 4
; Line 141
	cmp	WORD PTR [bp+4],-32768	;A
	jne	$I612
	mov	ax,-16384
	mov	sp,bp
	pop	bp
	ret	
; Line 143
	nop	
$I612:
; Line 144
	push	WORD PTR [bp+4]	;A
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-4],ax	;AA
	mov	al,ah
	cbw	
	sar	ax,1
	inc	ax
	mov	WORD PTR [bp-6],ax	;i
	jmp	SHORT $F613
; Line 149
; Line 150
	nop	
$FC614:
	dec	WORD PTR [bp-6]	;i
$F613:
	cmp	WORD PTR [bp-6],0	;i
	jl	$FB615
; Line 145
	mov	bx,WORD PTR [bp-6]	;i
	shl	bx,1
	mov	ax,WORD PTR [bp-4]	;AA
	cmp	WORD PTR _TRGTB[bx],ax
	jg	$FC614
; Line 146
	mov	cx,WORD PTR _TRGTB[bx+2]
	sub	cx,WORD PTR _TRGTB[bx]
; Line 147
	mov	ax,cx
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-4]	;AA
	sub	ax,WORD PTR _TRGTB[bx]
	cwd	
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	push	dx
	push	ax
	call	__aNldiv
	mov	ch,BYTE PTR [bp-6]	;i
	sub	cl,cl
	add	ax,cx
	mov	WORD PTR [bp-2],ax	;angl
; Line 148
$FB615:
; Line 151
	cmp	WORD PTR [bp+4],0	;A
	jge	$I617
	neg	WORD PTR [bp-2]	;angl
; Line 152
$I617:
	mov	ax,WORD PTR [bp-2]	;angl
; Line 153
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Iasin	ENDP
; Line 163
	PUBLIC	_Iacos
_Iacos	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	A = 4
; Line 165
	push	WORD PTR [bp+4]	;A
	call	_Iasin
	sub	ax,16384
	neg	ax
; Line 166
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Iacos	ENDP
; Line 169
	PUBLIC	_Sqrt
_Sqrt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	A = -2
;	B = -4
;	N = 4
; Line 173
	push	WORD PTR [bp+4]	;N
	call	_abs
	add	sp,2
	mov	WORD PTR [bp+4],ax	;N
	cmp	ax,4
	jge	$I625
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 174
	nop	
$I625:
	sar	ax,1
	sar	ax,1
	mov	WORD PTR [bp-4],ax	;B
; Line 175
$D626:
; Line 177
	mov	ax,WORD PTR [bp+4]	;N
	cwd	
	idiv	WORD PTR [bp-4]	;B
	mov	WORD PTR [bp-2],ax	;A
	add	ax,WORD PTR [bp-4]	;B
	sar	ax,1
	mov	WORD PTR [bp-4],ax	;B
; Line 178
	sub	ax,WORD PTR [bp-2]	;A
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,1
	jg	$D626
; Line 179
	mov	ax,WORD PTR [bp-4]	;B
; Line 180
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Sqrt	ENDP
_TEXT	ENDS
END
