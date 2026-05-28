;	Static Name Aliases
;
;	$S569_CColors	EQU	CColors
	TITLE   C:\MAP.C
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
PUBLIC  _Mscale
PUBLIC  _Mapx
PUBLIC  _Mapy
EXTRN	_DrawDot:FAR
EXTRN	__aNchkstk:NEAR
EXTRN	__aNNaldiv:NEAR
EXTRN	__aNNalmul:NEAR
EXTRN	_ACosB:NEAR
EXTRN	_ASinB:NEAR
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_RpCRT:WORD
_DATA      SEGMENT
_Mscale	DW	05H
_Mapx	DW	00H
_Mapy	DW	00H
$S569_CColors	DW	014H
	DW	0eH
	DW	010H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 8
; Line 19
; Line 9
; Line 10
; Line 11
; Line 12
; Line 116
	PUBLIC	_X2map
_X2map	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	x = 4
; Line 117
	mov	ax,WORD PTR [bp+4]	;x
	sub	ax,WORD PTR _Mapx
	mov	cl,BYTE PTR _Mscale
	inc	cl
	sar	ax,cl
	add	ax,41
; Line 118
	mov	sp,bp
	pop	bp
	ret	

_X2map	ENDP
; Line 122
	PUBLIC	_Y2map
_Y2map	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	y = 4
; Line 123
	mov	ax,WORD PTR [bp+4]	;y
	sub	ax,WORD PTR _Mapy
	mov	cl,BYTE PTR _Mscale
	inc	cl
	sar	ax,cl
	add	ax,28
; Line 124
	mov	sp,bp
	pop	bp
	ret	

_Y2map	ENDP
; Line 129
	PUBLIC	_mplot
_mplot	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	di
	push	si
;	x = -2
;	y = -4
;	size = 10
;	color = 8
;	py = 6
;	px = 4
; Line 134
	push	WORD PTR [bp+4]	;px
	call	_X2map
	add	sp,2
	mov	WORD PTR [bp-2],ax	;x
; Line 135
	push	WORD PTR [bp+6]	;py
	call	_Y2map
	add	sp,2
	mov	WORD PTR [bp-4],ax	;y
; Line 136
	cmp	WORD PTR [bp+8],-1	;color
	je	$I585
; Line 137
	push	WORD PTR [bp+8]	;color
	push	ax
	push	WORD PTR [bp-2]	;x
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawDot
	add	sp,8
; Line 138
	cmp	WORD PTR [bp+10],0	;size
	je	$I585
; Line 139
	push	WORD PTR [bp+8]	;color
	push	WORD PTR [bp-4]	;y
	mov	ax,WORD PTR [bp-2]	;x
	inc	ax
	push	ax
	push	WORD PTR _RpCRT
	mov	si,ax
	call	FAR PTR _DrawDot
	add	sp,8
; Line 140
	push	WORD PTR [bp+8]	;color
	mov	ax,WORD PTR [bp-4]	;y
	inc	ax
	push	ax
	push	WORD PTR [bp-2]	;x
	push	WORD PTR _RpCRT
	mov	di,ax
	call	FAR PTR _DrawDot
	add	sp,8
; Line 141
	push	WORD PTR [bp+8]	;color
	push	di
	push	si
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawDot
	add	sp,8
; Line 142
; Line 143
$I585:
; Line 144
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_mplot	ENDP
; Line 148
	PUBLIC	_MapLoc
_MapLoc	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	si
;	y = 10
;	x = 8
;	py = 6
;	px = 4
; Line 151
	push	WORD PTR [bp+4]	;px
	call	_X2map
	add	sp,2
	mov	bx,WORD PTR [bp+8]	;x
	mov	WORD PTR [bx],ax
; Line 152
	push	WORD PTR [bp+6]	;py
	call	_Y2map
	add	sp,2
	mov	bx,WORD PTR [bp+10]	;y
	mov	WORD PTR [bx],ax
; Line 154
	mov	si,WORD PTR [bp+8]	;x
	cmp	WORD PTR [si],0
	jl	$I592
	cmp	WORD PTR [si],82
	jge	$I592
	or	ax,ax
	jl	$I592
	cmp	ax,57
	jge	$I592
; Line 155
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I592:
; Line 157
	sub	ax,ax
; Line 158
; Line 159
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_MapLoc	ENDP
; Line 182
	PUBLIC	_Project2D
_Project2D	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	y = 18
;	x = 16
;	Scale = 14
;	Angle = 12
;	y0 = 8
;	x0 = 4
; Line 184
	mov	ax,WORD PTR [bp+14]	;Scale
	cwd	
	push	dx
	push	ax
	lea	cx,WORD PTR [bp+4]	;x0
	push	cx
	mov	si,ax
	mov	di,dx
	call	__aNNaldiv
; Line 185
	push	di
	push	si
	lea	ax,WORD PTR [bp+8]	;y0
	push	ax
	call	__aNNaldiv
; Line 187
	cmp	WORD PTR [bp+12],0	;Angle
	jne	$I602
; Line 188
	mov	ax,WORD PTR [bp+4]	;x0
	mov	bx,WORD PTR [bp+16]	;x
	mov	WORD PTR [bx],ax
; Line 189
	mov	ax,WORD PTR [bp+8]	;y0
	mov	bx,WORD PTR [bp+18]	;y
	mov	WORD PTR [bx],ax
; Line 190
	jmp	SHORT $I603
$I602:
; Line 191
	push	WORD PTR [bp+18]	;y
	push	WORD PTR [bp+16]	;x
	push	WORD PTR [bp+12]	;Angle
	push	WORD PTR [bp+8]	;y0
	push	WORD PTR [bp+4]	;x0
	call	_Rotate2D
	add	sp,10
; Line 192
$I603:
; Line 194
	mov	bx,WORD PTR [bp+16]	;x
	add	WORD PTR [bx],41
; Line 195
	mov	bx,WORD PTR [bp+18]	;y
	add	WORD PTR [bx],28
; Line 196
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Project2D	ENDP
; Line 199
	PUBLIC	_DeProject2D
_DeProject2D	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	y = 18
;	x = 16
;	Scale = 14
;	Angle = 12
;	y0 = 8
;	x0 = 4
; Line 201
	mov	bx,WORD PTR [bp+18]	;y
	sub	WORD PTR [bx],28
; Line 202
	mov	si,WORD PTR [bp+16]	;x
	sub	WORD PTR [si],41
; Line 204
	cmp	WORD PTR [bp+12],0	;Angle
	jne	$I613
; Line 205
	mov	ax,WORD PTR [bp+4]	;x0
	mov	WORD PTR [si],ax
; Line 206
	mov	ax,WORD PTR [bp+8]	;y0
	mov	WORD PTR [bx],ax
; Line 207
	jmp	SHORT $I614
$I613:
; Line 208
	push	WORD PTR [bp+18]	;y
	push	WORD PTR [bp+16]	;x
	mov	ax,WORD PTR [bp+12]	;Angle
	neg	ax
	push	ax
	push	WORD PTR [bp+8]	;y0
	push	WORD PTR [bp+4]	;x0
	call	_Rotate2D
	add	sp,10
; Line 209
$I614:
; Line 211
	mov	ax,WORD PTR [bp+14]	;Scale
	cwd	
	push	dx
	push	ax
	lea	cx,WORD PTR [bp+4]	;x0
	push	cx
	mov	si,ax
	mov	di,dx
	call	__aNNalmul
; Line 212
	push	di
	push	si
	lea	ax,WORD PTR [bp+8]	;y0
	push	ax
	call	__aNNalmul
; Line 214
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_DeProject2D	ENDP
; Line 217
	PUBLIC	_Rotate2D
_Rotate2D	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	si
;	y = 12
;	x = 10
;	Angle = 8
;	y0 = 6
;	x0 = 4
; Line 219
	push	WORD PTR [bp+8]	;Angle
	push	WORD PTR [bp+4]	;x0
	call	_ACosB
	add	sp,4
	push	WORD PTR [bp+8]	;Angle
	push	WORD PTR [bp+6]	;y0
	mov	si,ax
	call	_ASinB
	add	sp,4
	add	si,ax
	mov	bx,WORD PTR [bp+10]	;x
	mov	WORD PTR [bx],si
; Line 220
	push	WORD PTR [bp+8]	;Angle
	push	WORD PTR [bp+4]	;x0
	call	_ASinB
	add	sp,4
	push	WORD PTR [bp+8]	;Angle
	push	WORD PTR [bp+6]	;y0
	mov	si,ax
	call	_ACosB
	add	sp,4
	sub	ax,si
	mov	bx,WORD PTR [bp+12]	;y
	mov	WORD PTR [bx],ax
; Line 221
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_Rotate2D	ENDP
_TEXT	ENDS
END
