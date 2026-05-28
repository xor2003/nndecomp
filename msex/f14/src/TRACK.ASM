;	Static Name Aliases
;
;	$S633_Pdist	EQU	Pdist
	TITLE   C:\TRACK.C
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
EXTRN	_labs:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	__aNNalshr:NEAR
EXTRN	_TrgMul:NEAR
EXTRN	_xydist:NEAR
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_View:WORD
EXTRN	_Rp3D:WORD
EXTRN	_Rdrs:BYTE
EXTRN	_Px:WORD
EXTRN	_ps:BYTE
EXTRN	_Py:WORD
EXTRN	_VM:BYTE
EXTRN	_Alt:WORD
EXTRN	_PxLng:DWORD
EXTRN	_PyLng:DWORD
EXTRN	_ViewX:DWORD
EXTRN	_ViewY:DWORD
EXTRN	_ViewZ:WORD
_BSS      SEGMENT
COMM NEAR	_sx:	BYTE:	 2
COMM NEAR	_sy:	BYTE:	 2
COMM NEAR	_sz:	BYTE:	 2
$S633_Pdist	DW 01H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 6
; Line 7
; Line 19
; Line 8
; Line 9
; Line 10
; Line 11
; Line 31
	PUBLIC	_project
_project	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
	push	si
;	dy = -8
;	dz = -14
;	xe = -6
;	ye = -12
;	ze = -18
;	dx = -2
;	z = 8
;	y = 6
;	x = 4
; Line 38
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR [bp+4]	;x
	mov	WORD PTR [bp-2],ax	;dx
; Line 39
	mov	cx,WORD PTR [bp+6]	;y
	sub	cx,WORD PTR _Py
	mov	WORD PTR [bp-8],cx	;dy
; Line 40
	mov	cl,5
	mov	dx,WORD PTR [bp+8]	;z
	sub	dx,WORD PTR _Alt
	sar	dx,cl
	mov	WORD PTR [bp-14],dx	;dz
; Line 42
	test	BYTE PTR _View,128
	je	$I646
; Line 43
	mov	bx,WORD PTR _PxLng
	mov	si,WORD PTR _PxLng+2
	sub	bx,WORD PTR _ViewX
	sbb	si,WORD PTR _ViewX+2
$L20001:
	sar	si,1
	rcr	bx,1
	dec	cl
	jne	$L20001
	sub	ax,bx
	mov	WORD PTR [bp-2],ax	;dx
; Line 44
	mov	ax,WORD PTR _PyLng
	mov	dx,WORD PTR _PyLng+2
	sub	ax,WORD PTR _ViewY
	sbb	dx,WORD PTR _ViewY+2
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
	sub	ax,WORD PTR [bp-8]	;dy
	neg	ax
	mov	WORD PTR [bp-8],ax	;dy
; Line 45
	mov	ax,WORD PTR _ViewZ
	cwd	
	sub	ax,WORD PTR _Alt
	sbb	dx,0
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
	sub	ax,WORD PTR [bp-14]	;dz
	neg	ax
	mov	WORD PTR [bp-14],ax	;dz
; Line 46
; Line 48
$I646:
	push	WORD PTR [bp-14]	;dz
	push	WORD PTR [bp-8]	;dy
	push	WORD PTR [bp-2]	;dx
	sub	ax,ax
	push	ax
	call	_row3
	add	sp,8
	mov	WORD PTR [bp-6],ax	;xe
	mov	WORD PTR [bp-4],dx
; Line 49
	push	WORD PTR [bp-14]	;dz
	push	WORD PTR [bp-8]	;dy
	push	WORD PTR [bp-2]	;dx
	mov	ax,1
	push	ax
	call	_row3
	add	sp,8
	mov	WORD PTR [bp-12],ax	;ye
	mov	WORD PTR [bp-10],dx
; Line 52
	push	WORD PTR [bp-14]	;dz
	push	WORD PTR [bp-8]	;dy
	push	WORD PTR [bp-2]	;dx
	mov	ax,2
	push	ax
	call	_row3
	add	sp,8
	mov	WORD PTR [bp-18],ax	;ze
	mov	WORD PTR [bp-16],dx
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	mov	WORD PTR _sz,ax
; Line 54
	cmp	WORD PTR [bp-16],0
	jl	$JCC254
	jmp	$I655
$JCC254:
; Line 57
; Line 59
	mov	ax,WORD PTR [bp-18]	;ze
	mov	dx,WORD PTR [bp-16]
	neg	ax
	adc	dx,0
	neg	dx
	cmp	dx,WORD PTR [bp-4]
	jge	$JCC275
	jmp	$I655
$JCC275:
	jg	$L20003
	cmp	ax,WORD PTR [bp-6]	;xe
	jae	$JCC285
	jmp	$I655
$JCC285:
$L20003:
	mov	ax,WORD PTR [bp-6]	;xe
	mov	dx,WORD PTR [bp-4]
	cmp	WORD PTR [bp-16],dx
	jl	$I648
	jle	$JCC301
	jmp	$I655
$JCC301:
	cmp	WORD PTR [bp-18],ax	;ze
	jbe	$JCC309
	jmp	$I655
$JCC309:
; Line 62
; Line 64
$I648:
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;ze
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	push	dx
	push	ax
	call	__aNldiv
	add	ax,160
	mov	WORD PTR _sx,ax
; Line 66
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;ze
	mov	ax,WORD PTR [bp-12]	;ye
	mov	dx,WORD PTR [bp-10]
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR _sy,ax
; Line 67
	mov	cx,ax
	sar	ax,1
	sar	ax,1
	sub	cx,ax
	mov	WORD PTR _sy,cx
; Line 69
	test	BYTE PTR _View,64
	je	$I650
; Line 70
	mov	bx,WORD PTR _Rp3D
	mov	ax,WORD PTR [bx+8]
	sar	ax,1
	add	cx,ax
	mov	WORD PTR _sy,cx
; Line 71
	jmp	SHORT $I651
	nop	
$I650:
; Line 72
	add	WORD PTR _sy,56
; Line 73
$I651:
; Line 76
	cmp	WORD PTR _sx,0
	jl	$I653
	cmp	WORD PTR _sx,319
	jle	$I652
$I653:
	mov	WORD PTR _sx,-1
; Line 77
$I652:
	cmp	WORD PTR _sy,0
	jl	$I655
	mov	bx,WORD PTR _Rp3D
	mov	ax,WORD PTR _sy
	cmp	WORD PTR [bx+8],ax
	jge	$I654
$I655:
	mov	WORD PTR _sx,-1
; Line 78
$I654:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_project	ENDP
; Line 82
	PUBLIC	_lproject
_lproject	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__aNchkstk
;	dx = -6
;	dy = -14
;	dz = -20
;	xe = -10
;	ye = -18
;	ze = -24
;	ZShift = -2
;	z = 12
;	y = 8
;	x = 4
; Line 90
	mov	ax,WORD PTR _ViewY
	mov	dx,WORD PTR _ViewY+2
	add	ax,WORD PTR [bp+8]	;y
	adc	dx,WORD PTR [bp+10]
	sub	ax,0
	sbb	dx,16
	mov	WORD PTR [bp-14],ax	;dy
	mov	WORD PTR [bp-12],dx
; Line 91
	mov	ax,WORD PTR [bp+12]	;z
	sub	ax,WORD PTR _ViewZ
	mov	WORD PTR [bp-20],ax	;dz
; Line 93
	mov	WORD PTR [bp-2],8	;ZShift
; Line 95
	mov	ax,WORD PTR _ViewX
	mov	dx,WORD PTR _ViewX+2
	sub	ax,WORD PTR [bp+4]	;x
	sbb	dx,WORD PTR [bp+6]
	mov	WORD PTR [bp-6],ax	;dx
	mov	WORD PTR [bp-4],dx
	push	dx
	push	ax
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$L20008
	jl	$L20007
	cmp	ax,23000
	ja	$L20008
$L20007:
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;dy
	call	_labs
	add	sp,4
	or	dx,dx
	jl	$I668
	jg	$L20008
	cmp	ax,23000
	jbe	$I668
$L20008:
; Line 96
	mov	al,5
	push	ax
	lea	cx,WORD PTR [bp-6]	;dx
	push	cx
	call	__aNNalshr
; Line 97
	mov	al,5
	push	ax
	lea	cx,WORD PTR [bp-14]	;dy
	push	cx
	call	__aNNalshr
; Line 98
	mov	cl,5
	sar	WORD PTR [bp-20],cl	;dz
; Line 100
	sub	WORD PTR [bp-2],5	;ZShift
; Line 101
; Line 103
$I668:
	push	WORD PTR [bp-20]	;dz
	push	WORD PTR [bp-14]	;dy
	push	WORD PTR [bp-6]	;dx
	sub	ax,ax
	push	ax
	call	_row3
	add	sp,8
	mov	WORD PTR [bp-10],ax	;xe
	mov	WORD PTR [bp-8],dx
; Line 104
	push	WORD PTR [bp-20]	;dz
	push	WORD PTR [bp-14]	;dy
	push	WORD PTR [bp-6]	;dx
	mov	ax,1
	push	ax
	call	_row3
	add	sp,8
	mov	WORD PTR [bp-18],ax	;ye
	mov	WORD PTR [bp-16],dx
; Line 107
	push	WORD PTR [bp-20]	;dz
	push	WORD PTR [bp-14]	;dy
	push	WORD PTR [bp-6]	;dx
	mov	ax,2
	push	ax
	call	_row3
	add	sp,8
	mov	WORD PTR [bp-24],ax	;ze
	mov	WORD PTR [bp-22],dx
	mov	cl,BYTE PTR [bp-2]	;ZShift
	or	cl,cl
	je	$L20011
$L20010:
	sar	dx,1
	rcr	ax,1
	dec	cl
	jne	$L20010
$L20011:
	mov	WORD PTR _sz,ax
; Line 109
	cmp	WORD PTR [bp-22],0
	jl	$JCC695
	jmp	$I678
$JCC695:
; Line 112
; Line 114
	mov	ax,WORD PTR [bp-24]	;ze
	mov	dx,WORD PTR [bp-22]
	neg	ax
	adc	dx,0
	neg	dx
	cmp	dx,WORD PTR [bp-8]
	jge	$JCC716
	jmp	$I678
$JCC716:
	jg	$L20012
	cmp	ax,WORD PTR [bp-10]	;xe
	jae	$JCC726
	jmp	$I678
$JCC726:
$L20012:
	mov	ax,WORD PTR [bp-24]	;ze
	mov	dx,WORD PTR [bp-22]
	cmp	WORD PTR [bp-8],dx
	jg	$I671
	jge	$JCC742
	jmp	$I678
$JCC742:
	cmp	WORD PTR [bp-10],ax	;xe
	jae	$JCC750
	jmp	$I678
$JCC750:
; Line 117
; Line 119
$I671:
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-10]	;xe
	mov	dx,WORD PTR [bp-8]
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	push	dx
	push	ax
	call	__aNldiv
	add	ax,160
	mov	WORD PTR _sx,ax
; Line 121
	push	WORD PTR [bp-22]
	push	WORD PTR [bp-24]	;ze
	mov	ax,WORD PTR [bp-18]	;ye
	mov	dx,WORD PTR [bp-16]
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR _sy,ax
; Line 122
	mov	cx,ax
	sar	ax,1
	sar	ax,1
	sub	cx,ax
	mov	WORD PTR _sy,cx
; Line 124
	test	BYTE PTR _View,64
	je	$I673
; Line 125
	mov	bx,WORD PTR _Rp3D
	mov	ax,WORD PTR [bx+8]
	sar	ax,1
	add	cx,ax
	mov	WORD PTR _sy,cx
; Line 126
	jmp	SHORT $I674
$I673:
; Line 127
	add	WORD PTR _sy,56
; Line 128
$I674:
; Line 130
	cmp	WORD PTR _sx,0
	jl	$I676
	cmp	WORD PTR _sx,319
	jle	$I675
$I676:
; Line 131
	mov	WORD PTR _sx,-1
; Line 132
; Line 134
$I675:
	cmp	WORD PTR _sy,0
	jl	$I678
	mov	bx,WORD PTR _Rp3D
	mov	ax,WORD PTR _sy
	cmp	WORD PTR [bx+8],ax
	jge	$I677
$I678:
; Line 135
	mov	WORD PTR _sx,-1
; Line 136
; Line 137
$I677:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_lproject	ENDP
; Line 141
	PUBLIC	_row3
_row3	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	z = -4
;	dz = 10
;	dy = 8
;	dx = 6
;	r = 4
; Line 144
	push	WORD PTR [bp+6]	;dx
	mov	bx,WORD PTR [bp+4]	;r
	shl	bx,1
	push	WORD PTR _VM[bx]
	mov	si,bx
	call	_TrgMul
	add	sp,4
	cwd	
	mov	WORD PTR [bp-4],ax	;z
	mov	WORD PTR [bp-2],dx
; Line 145
	push	WORD PTR [bp+10]	;dz
	push	WORD PTR _VM[si+6]
	call	_TrgMul
	add	sp,4
	cwd	
	add	WORD PTR [bp-4],ax	;z
	adc	WORD PTR [bp-2],dx
; Line 148
	push	WORD PTR [bp+8]	;dy
	push	WORD PTR _VM[si+12]
	call	_TrgMul
	add	sp,4
	cwd	
	add	WORD PTR [bp-4],ax	;z
	adc	WORD PTR [bp-2],dx
	mov	ax,WORD PTR [bp-4]	;z
	mov	dx,WORD PTR [bp-2]
; Line 149
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_row3	ENDP
; Line 152
	PUBLIC	_DistTo
_DistTo	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	i = 4
; Line 153
	mov	ax,1
	push	ax
	mov	bx,WORD PTR [bp+4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	push	WORD PTR _Rdrs[bx+2]
	push	WORD PTR _Rdrs[bx]
	call	_DistOf
; Line 154
	mov	sp,bp
	pop	bp
	ret	

_DistTo	ENDP
; Line 157
	PUBLIC	_DistToPlane
_DistToPlane	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	i = 4
; Line 158
	sub	ax,ax
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;i
	mov	bx,ax
	push	WORD PTR _ps[bx+4]
	push	WORD PTR _ps[bx+2]
	call	_DistOf
; Line 159
	mov	sp,bp
	pop	bp
	ret	

_DistToPlane	ENDP
; Line 162
	PUBLIC	_DistOf
_DistOf	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	dx = -2
;	dy = -4
;	doAngle = 8
;	y = 6
;	x = 4
; Line 166
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR [bp+6]	;y
; Line 168
	push	ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR [bp+4]	;x
	push	ax
	call	_xydist
	mov	WORD PTR $S633_Pdist,ax
; Line 170
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DistOf	ENDP
_TEXT	ENDS
END
