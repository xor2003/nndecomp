;	Static Name Aliases
;
;	$S643_rand2	EQU	rand2
	TITLE   C:\SUPPORT.C
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
EXTRN	_srand:NEAR
EXTRN	_rand:NEAR
EXTRN	_inp:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_abs:NEAR
EXTRN	__aNlmul:NEAR
EXTRN	_ARCTAN:NEAR
EXTRN	_TrgMul:NEAR
EXTRN	_Isin:NEAR
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
_DATA      SEGMENT
$S643_rand2	DW	00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 19
; Line 2
; Line 3
; Line 4
; Line 7
	PUBLIC	_rng
_rng	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	b = 8
;	a = 6
;	x = 4
; Line 8
	mov	ax,WORD PTR [bp+4]	;x
	cmp	WORD PTR [bp+8],ax	;b
	jge	$I602
$L20015:
	mov	ax,WORD PTR [bp+8]	;b
	mov	sp,bp
	pop	bp
	ret	
; Line 9
	nop	
$I602:
	cmp	WORD PTR [bp+6],ax	;a
	jle	$EX601
; Line 10
	cmp	ax,-16384
	jle	$L20015
	mov	ax,WORD PTR [bp+6]	;a
$EX601:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_rng	ENDP
; Line 15
	PUBLIC	_rng2
_rng2	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	b = 8
;	a = 6
;	x = 4
; Line 16
	mov	ax,WORD PTR [bp+4]	;x
	cmp	WORD PTR [bp+8],ax	;b
	jge	$I610
	mov	ax,WORD PTR [bp+8]	;b
	mov	sp,bp
	pop	bp
	ret	
; Line 17
	nop	
$I610:
	cmp	WORD PTR [bp+6],ax	;a
	jle	$I611
	mov	ax,WORD PTR [bp+6]	;a
; Line 18
$I611:
; Line 19
	mov	sp,bp
	pop	bp
	ret	

_rng2	ENDP
; Line 22
	PUBLIC	_xydist
_xydist	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	d = -4
;	y = 6
;	x = 4
; Line 25
	push	WORD PTR [bp+4]	;x
	call	_abs
	add	sp,2
	mov	WORD PTR [bp+4],ax	;x
; Line 27
	push	WORD PTR [bp+6]	;y
	call	_abs
	add	sp,2
	mov	WORD PTR [bp+6],ax	;y
	cmp	ax,WORD PTR [bp+4]	;x
	jge	$L20001
	mov	ax,WORD PTR [bp+4]	;x
	cwd	
	mov	cx,ax
	mov	ax,WORD PTR [bp+6]	;y
	jmp	SHORT $L20016
	nop	
$L20001:
	cwd	
	mov	cx,ax
	mov	ax,WORD PTR [bp+4]	;x
$L20016:
	sar	ax,1
	mov	bx,dx
	cwd	
	add	ax,cx
	adc	dx,bx
	mov	WORD PTR [bp-4],ax	;d
	or	dx,dx
	jl	$I618
	jg	$L20009
	cmp	ax,32767
	jbe	$I618
$L20009:
	mov	WORD PTR [bp-4],32767	;d
; Line 28
$I618:
	mov	ax,WORD PTR [bp-4]	;d
; Line 29
	mov	sp,bp
	pop	bp
	ret	
	nop	

_xydist	ENDP
; Line 32
	PUBLIC	_uangle
_uangle	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	b = 6
;	a = 4
; Line 33
	cmp	WORD PTR [bp+6],32767	;b
	jbe	$I623
; Line 34
	shr	WORD PTR [bp+6],1	;b
; Line 35
	sar	WORD PTR [bp+4],1	;a
; Line 36
; Line 37
$I623:
	push	WORD PTR [bp+6]	;b
	push	WORD PTR [bp+4]	;a
	call	_ARCTAN
; Line 38
	mov	sp,bp
	pop	bp
	ret	

_uangle	ENDP
; Line 92
	PUBLIC	_sinX
_sinX	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	x = 6
;	angle = 4
; Line 93
	push	WORD PTR [bp+6]	;x
	push	WORD PTR [bp+4]	;angle
	call	_Isin
	add	sp,2
	push	ax
	call	_TrgMul
; Line 94
	mov	sp,bp
	pop	bp
	ret	

_sinX	ENDP
; Line 97
	PUBLIC	_cosX
_cosX	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	x = 6
;	angle = 4
; Line 98
	push	WORD PTR [bp+6]	;x
	mov	ax,WORD PTR [bp+4]	;angle
	add	ah,64
	push	ax
	call	_sinX
; Line 99
	mov	sp,bp
	pop	bp
	ret	
	nop	

_cosX	ENDP
; Line 102
	PUBLIC	_wrd
_wrd	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	x = 4
; Line 103
	mov	al,BYTE PTR [bp+4]	;x
	sub	ah,ah
	cmp	ax,128
	jl	$L20010
	sub	ax,256
	mov	WORD PTR [bp+4],ax	;x
	jmp	SHORT $L20011
$L20010:
	mov	BYTE PTR [bp+5],0
$L20011:
; Line 104
	mov	ax,WORD PTR [bp+4]	;x
; Line 105
	mov	sp,bp
	pop	bp
	ret	
	nop	

_wrd	ENDP
; Line 108
	PUBLIC	_sgn
_sgn	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	x = 4
; Line 109
	cmp	WORD PTR [bp+4],0	;x
	jne	$I641
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 110
$I641:
	cmp	WORD PTR [bp+4],0	;x
	jle	$L20012
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$L20012:
	mov	ax,-1
; Line 111
	mov	sp,bp
	pop	bp
	ret	
	nop	

_sgn	ENDP
; Line 117
	PUBLIC	_seedme
_seedme	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 119
	mov	cl,5
	sub	bx,bx
	mov	es,bx
	mov	bx,1132
	mov	ah,BYTE PTR es:[bx]
	sub	al,al
	shl	ax,cl
	mov	WORD PTR $S643_rand2,ax
	push	ax
	call	_srand
	add	sp,2
; Line 120
	ret	

_seedme	ENDP
; Line 123
	PUBLIC	_seedme2
_seedme2	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 124
	mov	cl,5
	sub	bx,bx
	mov	es,bx
	mov	bx,1132
	mov	ah,BYTE PTR es:[bx]
	sub	al,al
	shl	ax,cl
	mov	WORD PTR $S643_rand2,ax
; Line 125
	ret	
	nop	

_seedme2	ENDP
; Line 128
	PUBLIC	_rnd
_rnd	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	Max = 4
; Line 129
	call	_rand
	imul	WORD PTR [bp+4]	;Max
	mov	al,ah
	mov	ah,dl
	mov	dl,dh
	shl	dh,1
	sbb	dh,dh
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
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
; Line 130
	mov	sp,bp
	pop	bp
	ret	

_rnd	ENDP
; Line 134
	PUBLIC	_rnd2
_rnd2	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	Max = 4
; Line 138
	mov	ax,WORD PTR [bp+4]	;Max
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR $S643_rand2
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	add	ax,8191
	mov	WORD PTR $S643_rand2,ax
	sub	dx,dx
	push	dx
	push	ax
	call	__aNlmul
	mov	ax,dx
; Line 139
	mov	sp,bp
	pop	bp
	ret	

_rnd2	ENDP
; Line 145
	PUBLIC	_WaitTicks
_WaitTicks	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	ticks = 4
; Line 146
	jmp	SHORT $L20017
	nop	
$FC660:
; Line 147
	mov	ax,986
	push	ax
	call	_inp
	add	sp,2
	test	al,8
	je	$FC660
; Line 148
$FC667:
	mov	ax,986
	push	ax
	call	_inp
	add	sp,2
	test	al,8
	jne	$FC667
; Line 149
$L20017:
	mov	ax,WORD PTR [bp+4]	;ticks
	dec	WORD PTR [bp+4]	;ticks
	or	ax,ax
	jne	$FC660
; Line 150
	mov	sp,bp
	pop	bp
	ret	

_WaitTicks	ENDP
_TEXT	ENDS
END
