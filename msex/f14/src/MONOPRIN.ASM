;	Static Name Aliases
;
	TITLE   C:\MONOPRIN.C
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
PUBLIC  __mono_attribute
PUBLIC  __mono_x
PUBLIC  __mono_y
PUBLIC  __mono_loc
EXTRN	__fmemcpy:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_vsprintf:NEAR
_BSS      SEGMENT
COMM NEAR	__mono_buffer:	 1:	 2000
_BSS      ENDS
_DATA      SEGMENT
__mono_attribute	DB	07H
	ORG	$+1
__mono_x	DW	00H
__mono_y	DW	00H
__mono_loc	DD	0b0000000H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 32
; Line 33
; Line 34
; Line 50
	PUBLIC	_mprintf
_mprintf	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	args = -4
;	length = -2
;	fmt = 4
; Line 60
	lea	ax,WORD PTR [bp+6]
	push	ax
	push	WORD PTR [bp+4]	;fmt
	mov	ax,OFFSET DGROUP:__mono_buffer
	push	ax
	call	_vsprintf
	add	sp,6
; Line 65
	mov	ax,OFFSET DGROUP:__mono_buffer
	push	ax
	call	_mono_out
; Line 68
	mov	sp,bp
	pop	bp
	ret	
	nop	

_mprintf	ENDP
; Line 70
	PUBLIC	_mono_scroll
_mono_scroll	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
;	blank = -10
;	from = -8
;	to = -4
; Line 72
	mov	ax,WORD PTR __mono_loc
	mov	dx,WORD PTR __mono_loc+2
; Line 76
	mov	cx,3840
	push	cx
	add	ax,160
	push	dx
	push	ax
	push	dx
	push	WORD PTR __mono_loc
	call	__fmemcpy
	add	sp,10
; Line 78
	mov	ax,1824
	push	ax
	mov	ax,80
	push	ax
	mov	ax,WORD PTR __mono_loc
	mov	dx,WORD PTR __mono_loc+2
	add	ah,15
	push	dx
	push	ax
	call	__fimemset
; Line 81
	mov	sp,bp
	pop	bp
	ret	
	nop	

_mono_scroll	ENDP
; Line 87
	PUBLIC	_mono_out
_mono_out	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	c = -6
;	attribute = -8
;	to = -4
;	buffer = 4
; Line 89
	mov	ah,BYTE PTR __mono_attribute
	sub	al,al
	mov	WORD PTR [bp-8],ax	;attribute
; Line 93
	mov	ax,80
	imul	WORD PTR __mono_y
	add	ax,WORD PTR __mono_x
	shl	ax,1
$L20001:
	add	ax,WORD PTR __mono_loc
	mov	dx,WORD PTR __mono_loc+2
$L20004:
	mov	WORD PTR [bp-4],ax	;to
	mov	WORD PTR [bp-2],dx
; Line 95
	jmp	$I219
$FC201:
; Line 97
	mov	al,BYTE PTR [bx]
	cbw	
	mov	WORD PTR [bp-6],ax	;c
	inc	WORD PTR [bp+4]	;buffer
	sub	ax,9
	jne	$JCC162
	jmp	$SC212
$JCC162:
	dec	ax
	je	$SC208
	dec	ax
	dec	ax
	je	$SC211
	dec	ax
	je	$SC207
; Line 167
	mov	ax,WORD PTR [bp-8]	;attribute
	or	WORD PTR [bp-6],ax	;c
	mov	ax,WORD PTR [bp-6]	;c
	les	bx,DWORD PTR [bp-4]	;to
	add	WORD PTR [bp-4],2	;to
	mov	WORD PTR es:[bx],ax
; Line 172
	inc	WORD PTR __mono_x
	cmp	WORD PTR __mono_x,80
	je	$JCC205
	jmp	$I219
$JCC205:
; Line 173
	cmp	WORD PTR __mono_y,24
	je	$JCC215
	jmp	$I218
$JCC215:
; Line 175
	mov	WORD PTR __mono_x,0
; Line 177
	mov	ax,WORD PTR __mono_loc
	mov	dx,WORD PTR __mono_loc+2
	add	ah,15
	jmp	SHORT $L20004
; Line 101
$SC207:
; Line 103
	mov	WORD PTR __mono_x,0
; Line 105
	mov	ax,160
	imul	WORD PTR __mono_y
	jmp	SHORT $L20001
; Line 110
	nop	
$SC208:
; Line 112
	cmp	WORD PTR __mono_y,24
	jne	$I209
; Line 113
	call	_mono_scroll
; Line 115
	jmp	$I219
	nop	
$I209:
; Line 116
	add	WORD PTR [bp-4],160	;to
; Line 117
	jmp	$L20005
; Line 124
$SC211:
; Line 127
	sub	ax,ax
	mov	WORD PTR __mono_x,ax
	mov	WORD PTR __mono_y,ax
; Line 130
	mov	ax,WORD PTR __mono_loc
	mov	dx,WORD PTR __mono_loc+2
	mov	WORD PTR [bp-4],ax	;to
	mov	WORD PTR [bp-2],dx
; Line 132
	mov	cx,WORD PTR [bp-8]	;attribute
	or	cl,32
	mov	WORD PTR [bp-6],cx	;c
; Line 134
	push	cx
	mov	cx,2000
	push	cx
	push	dx
	push	ax
	call	__fimemset
	add	sp,8
; Line 136
	jmp	SHORT $I219
; Line 138
	nop	
$SC212:
; Line 140
	cmp	WORD PTR __mono_y,24
	jne	$I213
	cmp	WORD PTR __mono_x,71
	jle	$I213
; Line 141
	call	_mono_scroll
; Line 142
	mov	WORD PTR __mono_y,23
; Line 143
	mov	ax,WORD PTR __mono_loc
	mov	dx,WORD PTR __mono_loc+2
	add	ax,3680
	mov	WORD PTR [bp-4],ax	;to
	mov	WORD PTR [bp-2],dx
; Line 145
; Line 147
$I213:
; Line 149
	mov	ax,WORD PTR [bp-8]	;attribute
	or	al,32
	mov	WORD PTR [bp-6],ax	;c
	push	ax
	mov	ax,8
	push	ax
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;to
	call	__fimemset
	add	sp,8
; Line 151
	add	WORD PTR [bp-4],16	;to
; Line 153
	cmp	WORD PTR __mono_x,71
	jle	$I214
; Line 154
	mov	ax,WORD PTR __mono_x
	add	ax,8
	mov	cx,80
	cwd	
	idiv	cx
	mov	WORD PTR __mono_x,dx
	jmp	SHORT $L20005
	nop	
$I214:
; Line 158
	add	WORD PTR __mono_x,8
; Line 161
	jmp	SHORT $I219
; Line 163
	nop	
$I218:
; Line 181
	mov	WORD PTR __mono_x,0
; Line 182
$L20005:
	inc	WORD PTR __mono_y
; Line 184
$I219:
; Line 186
; Line 188
	mov	bx,WORD PTR [bp+4]	;buffer
	cmp	BYTE PTR [bx],0
	je	$JCC440
	jmp	$FC201
$JCC440:
; Line 194
	sub	ax,ax
; Line 196
	mov	sp,bp
	pop	bp
	ret	
	nop	

_mono_out	ENDP
; Line 203
	PUBLIC	__fimemset
__fimemset	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	c = 10
;	n = 8
;	to = 4
; Line 207
; Line 209
	push	es
; Line 211
	mov	cx,WORD PTR [bp+8]	;n
; Line 212
	mov	ax,WORD PTR [bp+10]	;c
; Line 214
	les	di,DWORD PTR [bp+4]	;to
; Line 216
	repnz	stosw
; Line 218
	pop	es
; Line 221
; Line 223
	sub	ax,ax
; Line 225
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

__fimemset	ENDP
; Line 233
	PUBLIC	_mset_pos
_mset_pos	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	y = 6
;	x = 4
; Line 236
	mov	ax,WORD PTR [bp+4]	;x
	mov	cx,80
	cwd	
	idiv	cx
	mov	WORD PTR __mono_x,dx
; Line 237
	mov	ax,WORD PTR [bp+6]	;y
	mov	cx,25
	cwd	
	idiv	cx
	mov	WORD PTR __mono_y,dx
; Line 239
	sub	ax,ax
; Line 242
	mov	sp,bp
	pop	bp
	ret	

_mset_pos	ENDP
; Line 248
	PUBLIC	_mclear_screen
_mclear_screen	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	blank = -6
;	to = -4
; Line 252
	mov	ax,WORD PTR __mono_loc
	mov	dx,WORD PTR __mono_loc+2
; Line 254
	mov	cl,32
	mov	ch,BYTE PTR __mono_attribute
	push	cx
	mov	cx,2000
	push	cx
	push	dx
	push	ax
	call	__fimemset
; Line 256
	mov	sp,bp
	pop	bp
	ret	

_mclear_screen	ENDP
_TEXT	ENDS
END
