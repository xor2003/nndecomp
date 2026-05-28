;	Static Name Aliases
;
	TITLE   C:\BILLASM.C
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
EXTRN	_SinB:NEAR
EXTRN	_CosB:NEAR
EXTRN	_MOUSE:BYTE
EXTRN	_MouseX:WORD
EXTRN	_MouseY:WORD
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 20
	PUBLIC	_rotate_pt
_rotate_pt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	di
	push	si
;	x = -2
;	y = -4
;	ang = 8
;	d = 6
;	s = 4
; Line 24
	mov	bx,WORD PTR [bp+4]	;s
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-2],ax	;x
; Line 25
	mov	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-4],ax	;y
; Line 27
; Line 28
	mov	ax,WORD PTR [bp+8]	;ang
; Line 29
	neg	ax
; Line 30
	push	ax
; Line 31
	call	_CosB
; Line 32
	mov	si,ax
; Line 33
	call	_SinB
; Line 34
	add	sp,2
; Line 35
	mov	di,ax
; Line 37
	mov	bx,WORD PTR [bp+4]	;s
; Line 38
	imul	WORD PTR [bp-4]	;y
; Line 39
	shl	ax,1
; Line 40
	rcl	dx,1
; Line 41
	mov	cx,dx
; Line 43
	mov	ax,si
; Line 44
	imul	WORD PTR [bp-2]	;x
; Line 45
	shl	ax,1
; Line 46
	rcl	dx,1
; Line 47
	sub	dx,cx
; Line 49
	mov	bx,WORD PTR [bp+6]	;d
; Line 50
	mov	WORD PTR [bx],dx
; Line 52
	mov	ax,si
; Line 53
	imul	WORD PTR [bp-4]	;y
; Line 54
	shl	ax,1
; Line 55
	rcl	dx,1
; Line 56
	mov	cx,dx
; Line 58
	mov	ax,di
; Line 59
	imul	WORD PTR [bp-2]	;x
; Line 60
	shl	ax,1
; Line 61
	rcl	dx,1
; Line 62
	add	dx,cx
; Line 63
	mov	WORD PTR [bx+2],dx
; Line 65
; Line 66
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_rotate_pt	ENDP
; Line 70
	PUBLIC	_MousePOS
_MousePOS	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	y = 6
;	x = 4
; Line 71
	cmp	BYTE PTR _MOUSE,0
	jne	$I116
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 73
	nop	
$I116:
; Line 74
	mov	ax,4
; Line 75
	mov	cx,WORD PTR [bp+4]	;x
; Line 76
	shl	cx,1
; Line 77
	mov	WORD PTR _MouseX,cx
; Line 78
	mov	dx,WORD PTR [bp+6]	;y
; Line 79
	mov	WORD PTR _MouseY,dx
; Line 80
	int	51
; Line 81
; Line 82
	mov	sp,bp
	pop	bp
	ret	
	nop	

_MousePOS	ENDP
_TEXT	ENDS
END
