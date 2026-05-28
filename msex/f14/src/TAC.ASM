;	Static Name Aliases
;
;	$S926_RANGES	EQU	RANGES
	TITLE   C:\TAC.C
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
PUBLIC  _tacx
PUBLIC  _tacy
PUBLIC  _tacz
EXTRN	_DrawLine:FAR
EXTRN	_itoa:NEAR
EXTRN	_DrawDot:FAR
EXTRN	_RpPrint:FAR
EXTRN	_ACosB:NEAR
EXTRN	_sinX:NEAR
EXTRN	_ASinB:NEAR
EXTRN	_cosX:NEAR
EXTRN	_MapInEMSSprite:NEAR
EXTRN	_RectFill:FAR
EXTRN	_TacTransScaleLine:NEAR
EXTRN	_Rotate2D:NEAR
EXTRN	_ScaleRotate:NEAR
EXTRN	_draw_circle:NEAR
EXTRN	_GetPlanePtr:NEAR
EXTRN	_GetMissilePtr:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_pstrlen:NEAR
EXTRN	_MapInBank:NEAR
EXTRN	__aNlmul:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_abs:NEAR
EXTRN	_wps:BYTE
EXTRN	_ds:BYTE
EXTRN	_NDECOY:WORD
EXTRN	_ss:BYTE
EXTRN	_RpCRT:WORD
EXTRN	_Px:WORD
EXTRN	_Py:WORD
EXTRN	_OurHead:WORD
EXTRN	_sx:WORD
EXTRN	_sy:WORD
EXTRN	_sz:WORD
EXTRN	_NRADAR:WORD
EXTRN	_Rtime:WORD
EXTRN	_Tscale:WORD
EXTRN	_Rdrs:BYTE
EXTRN	_BackSeat:WORD
EXTRN	_ps:BYTE
EXTRN	_PxLng:DWORD
EXTRN	_PyLng:DWORD
EXTRN	_GRPAGE0:BYTE
EXTRN	_DESIGNATED:WORD
EXTRN	_SHOOT:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Damaged:WORD
_DATA      SEGMENT
_tacx	DW	00H
_tacy	DW	00H
_tacz	DW	00H
$S926_RANGES	DW	0c8H
	DW	064H
	DW	032H
	DW	019H
	DW	0aH
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 7
; Line 8
; Line 9
; Line 10
; Line 19
; Line 11
; Line 12
; Line 13
; Line 14
; Line 15
; Line 16
; Line 52
	PUBLIC	_DoTac
_DoTac	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,40
	call	__aNchkstk
	push	si
;	ypos = -24
;	x = -16
;	y = -20
;	size = -26
;	i = -18
;	a = -6
;	b = -8
;	dalt = -10
;	Colr = -4
;	ssi = -38
;	rri = -36
;	psi = -34
;	dsi = -2
;	tempmissile = -32
;	tempplane = -14
;	mseg = -28
;	xpos = -22
;	CrtNr = 4
; Line 65
	mov	ax,WORD PTR _Tscale
	inc	ax
	mov	WORD PTR [bp-26],ax	;size
; Line 67
	test	BYTE PTR _Damaged,128
	je	$I833
; Line 68
	sub	ax,ax
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
; Line 69
$L20008:
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 70
; Line 72
$I833:
	sub	ax,ax
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
; Line 74
	mov	ax,256
	push	ax
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	ax
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	push	WORD PTR _RpCRT
	call	_TacMap
	add	sp,12
; Line 76
	cmp	WORD PTR _BackSeat,0
	jne	$I834
; Line 77
	call	show_range
; Line 79
$I834:
	mov	WORD PTR [bp-18],0	;i
	mov	WORD PTR [bp-38],OFFSET _ss	;ssi
	jmp	SHORT $F835
	nop	
$L20001:
	mov	ax,14
$L20002:
	mov	WORD PTR [bp-4],ax	;Colr
; Line 85
	mov	bx,WORD PTR [bp-38]	;ssi
	cmp	WORD PTR [bx+42],0
	je	$I841
; Line 86
	mov	WORD PTR [bp-4],7	;Colr
; Line 87
$I841:
	cmp	WORD PTR [bp-18],20	;i
	jl	$I842
; Line 88
	mov	WORD PTR [bp-4],15	;Colr
; Line 89
$I842:
	mov	ax,WORD PTR [bx+20]
	sub	ax,WORD PTR _OurHead
	mov	WORD PTR [bp-6],ax	;a
; Line 90
	push	WORD PTR [bp-4]	;Colr
	push	WORD PTR [bp-26]	;size
	push	ax
	mov	si,ax
	call	_cosX
	add	sp,4
	add	ax,WORD PTR _sy
	push	ax
	push	WORD PTR [bp-26]	;size
	push	si
	call	_sinX
	add	sp,4
	sub	ax,WORD PTR _sx
	neg	ax
	push	ax
	push	WORD PTR _sy
	push	WORD PTR _sx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 91
; Line 92
$I840:
; Line 93
	inc	WORD PTR [bp-18]	;i
	add	WORD PTR [bp-38],44	;ssi
$F835:
	cmp	WORD PTR [bp-18],28	;i
	jge	$FB837
; Line 80
	mov	bx,WORD PTR [bp-38]	;ssi
	cmp	WORD PTR [bx+26],0
	je	$I840
; Line 81
	mov	ax,WORD PTR [bx+4]
	mov	dx,WORD PTR [bx+6]
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
	mov	ax,WORD PTR [bx]
	mov	dx,WORD PTR [bx+2]
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
	call	_Tacxy
	add	sp,4
; Line 82
	cmp	WORD PTR _sz,-1
	je	$I840
; Line 84
	mov	bx,WORD PTR [bp-38]	;ssi
	push	WORD PTR [bx+28]
	call	_GetMissilePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	cmp	WORD PTR es:[bx+22],2
	jg	$JCC355
	jmp	$L20001
$JCC355:
	mov	ax,16
	jmp	$L20002
$FB837:
; Line 95
	mov	WORD PTR [bp-18],0	;i
	mov	WORD PTR [bp-36],OFFSET _Rdrs	;rri
	jmp	SHORT $F845
$I850:
; Line 105
	mov	ax,1
	push	ax
	mov	ax,2
	push	ax
	call	_MapInEMSSprite
	add	sp,4
	or	ax,ax
	je	$I855
; Line 107
	sub	cx,cx
	push	cx
	push	cx
	push	cx
	mov	cx,256
	push	cx
	mov	bx,WORD PTR _RpCRT
	mov	cx,WORD PTR [bx+4]
	add	cx,WORD PTR _sy
	push	cx
	mov	cx,WORD PTR [bx+2]
	add	cx,WORD PTR _sx
	push	cx
	push	bx
	mov	cx,10
	push	cx
	push	cx
	mov	cx,67
	push	cx
	mov	cx,209
$L20011:
	push	cx
	push	ax
	call	_ScaleRotate
	add	sp,24
; Line 108
; Line 109
$I855:
; Line 110
; Line 111
; Line 112
	inc	WORD PTR [bp-18]	;i
	add	WORD PTR [bp-36],10	;rri
$F845:
	mov	ax,WORD PTR [bp-18]	;i
	cmp	WORD PTR _NRADAR,ax
	jle	$FB847
; Line 96
	mov	bx,WORD PTR [bp-36]	;rri
	test	BYTE PTR [bx+6],128
	jne	$I855
; Line 97
	push	WORD PTR [bx+2]
	push	WORD PTR [bx]
	call	_Tacxy
	add	sp,4
; Line 98
	cmp	WORD PTR _sz,-1
	je	$I855
; Line 99
	mov	bx,WORD PTR [bp-36]	;rri
	test	BYTE PTR [bx+7],4
	je	$I850
; Line 100
	mov	ax,1
	push	ax
	mov	ax,2
	push	ax
	call	_MapInEMSSprite
	add	sp,4
	or	ax,ax
	je	$I855
; Line 102
	sub	cx,cx
	push	cx
	push	cx
	push	cx
	mov	cx,256
	push	cx
	mov	bx,WORD PTR _RpCRT
	mov	cx,WORD PTR [bx+4]
	add	cx,WORD PTR _sy
	push	cx
	mov	cx,WORD PTR [bx+2]
	add	cx,WORD PTR _sx
	push	cx
	push	bx
	mov	cx,10
	push	cx
	push	cx
	mov	cx,67
	push	cx
	mov	cx,169
	jmp	SHORT $L20011
$FB847:
; Line 114
	mov	WORD PTR [bp-18],0	;i
	mov	WORD PTR [bp-34],OFFSET _ps	;psi
	jmp	$F856
	nop	
$L20003:
	mov	WORD PTR [bp-40],7
$L20004:
	push	WORD PTR [bp-40]
	call	_TacBox
	add	sp,2
; Line 119
$I861:
	mov	bx,WORD PTR [bp-34]	;psi
	push	WORD PTR [bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-14],ax	;tempplane
	mov	WORD PTR [bp-12],dx
; Line 121
	mov	bx,WORD PTR [bp-34]	;psi
	mov	ax,WORD PTR [bx+16]
	sub	ax,WORD PTR _OurHead
	add	ah,8
	mov	WORD PTR [bp-6],ax	;a
; Line 123
	test	BYTE PTR [bx+25],4
	je	$I863
; Line 124
	mov	WORD PTR [bp-8],2	;b
; Line 125
	jmp	SHORT $I864
	nop	
$I863:
; Line 126
	mov	WORD PTR [bp-8],0	;b
$I864:
; Line 128
	mov	al,BYTE PTR [bp-5]
	cbw	
	mov	cl,4
	sar	ax,cl
	and	ax,15
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,154
	mov	WORD PTR [bp-22],ax	;xpos
; Line 130
	les	bx,DWORD PTR [bp-14]	;tempplane
	mov	ax,WORD PTR es:[bx+38]
	cmp	ax,80
	je	$SC883
	ja	$SD886
	sub	al,10
	je	$SC869
	sub	al,10
	je	$SC874
	sub	al,40
	je	$SC877
	sub	al,10
	je	$SC880
$SD886:
; Line 171
	cmp	WORD PTR [bp-8],2	;b
	jne	$I870
; Line 172
$I871:
; Line 136
	mov	WORD PTR [bp-24],22	;ypos
; Line 137
	jmp	SHORT $SB866
; Line 131
	nop	
$SC869:
; Line 132
	cmp	WORD PTR [bp-8],2	;b
	jne	$I870
; Line 133
	cmp	WORD PTR es:[bx],88
	jne	$I871
; Line 134
	mov	WORD PTR [bp-24],32	;ypos
; Line 135
	jmp	SHORT $SB866
; Line 141
	nop	
$SC874:
; Line 142
	cmp	WORD PTR [bp-8],2	;b
	jne	$I875
; Line 143
	mov	WORD PTR [bp-24],42	;ypos
; Line 144
	jmp	SHORT $SB866
	nop	
$I875:
; Line 145
	mov	WORD PTR [bp-24],102	;ypos
; Line 146
	jmp	SHORT $SB866
; Line 147
	nop	
$SC877:
; Line 148
	cmp	WORD PTR [bp-8],2	;b
	jne	$I878
; Line 149
	mov	WORD PTR [bp-24],52	;ypos
; Line 150
	jmp	SHORT $SB866
	nop	
$I878:
; Line 151
	mov	WORD PTR [bp-22],194	;xpos
; Line 152
	mov	WORD PTR [bp-24],62	;ypos
; Line 153
; Line 154
	jmp	SHORT $SB866
; Line 155
$SC880:
; Line 156
	cmp	WORD PTR [bp-8],2	;b
	jne	$I878
; Line 157
	mov	WORD PTR [bp-22],154	;xpos
	jmp	SHORT $I871
	nop	
$SC883:
; Line 165
	cmp	WORD PTR [bp-8],2	;b
	je	$I871
; Line 168
	mov	WORD PTR [bp-24],72	;ypos
; Line 169
	jmp	SHORT $SB866
; Line 170
	nop	
$I870:
; Line 138
	mov	WORD PTR [bp-24],82	;ypos
; Line 139
; Line 140
$SB866:
; Line 178
	mov	ax,1
	push	ax
	mov	ax,2
	push	ax
	call	_MapInEMSSprite
	add	sp,4
	or	ax,ax
	je	$FC857
; Line 180
	sub	cx,cx
	push	cx
	push	cx
	push	cx
	mov	cx,256
	push	cx
	mov	bx,WORD PTR _RpCRT
	mov	cx,WORD PTR [bx+4]
	add	cx,WORD PTR _sy
	push	cx
	mov	cx,WORD PTR [bx+2]
	add	cx,WORD PTR _sx
	push	cx
	push	bx
	mov	cx,10
	push	cx
	push	cx
	mov	cx,WORD PTR [bp-24]	;ypos
	add	cx,5
	push	cx
	mov	cx,WORD PTR [bp-22]	;xpos
	add	cx,5
	push	cx
	push	ax
	call	_ScaleRotate
	add	sp,24
; Line 181
; Line 182
; Line 183
; Line 184
$FC857:
	inc	WORD PTR [bp-18]	;i
	add	WORD PTR [bp-34],40	;psi
$F856:
	cmp	WORD PTR [bp-18],70	;i
	jge	$FB858
; Line 115
	mov	bx,WORD PTR [bp-34]	;psi
	mov	al,BYTE PTR [bx+24]
	and	al,3
	cmp	al,3
	jne	$FC857
	cmp	WORD PTR [bx+26],0
	je	$FC857
; Line 116
	push	WORD PTR [bx+4]
	push	WORD PTR [bx+2]
	call	_Tacxy
	add	sp,4
; Line 117
	cmp	WORD PTR _sz,-1
	je	$FC857
; Line 118
	mov	ax,WORD PTR [bp-18]	;i
	cmp	WORD PTR _DESIGNATED,ax
	je	$JCC944
	jmp	$I861
$JCC944:
	cmp	WORD PTR _SHOOT,0
	je	$L20005
	test	BYTE PTR _Rtime,2
	jne	$JCC961
	jmp	$L20003
$JCC961:
$L20005:
	mov	WORD PTR [bp-40],15
	jmp	$L20004
$FB858:
; Line 186
	push	WORD PTR _Py
	push	WORD PTR _Px
	call	_Tacxy
	add	sp,4
; Line 187
	mov	ax,1
	push	ax
	mov	ax,2
	push	ax
	call	_MapInEMSSprite
	add	sp,4
	or	ax,ax
	je	$I890
; Line 189
	sub	cx,cx
	push	cx
	push	cx
	push	cx
	mov	cx,256
	push	cx
	mov	bx,WORD PTR _RpCRT
	mov	cx,WORD PTR [bx+4]
	add	cx,WORD PTR _sy
	push	cx
	mov	cx,WORD PTR [bx+2]
	add	cx,WORD PTR _sx
	push	cx
	push	bx
	mov	cx,10
	push	cx
	push	cx
	mov	cx,67
	push	cx
	mov	cx,219
	push	cx
	push	ax
	call	_ScaleRotate
	add	sp,24
; Line 190
; Line 192
$I890:
	mov	WORD PTR [bp-18],0	;i
	mov	WORD PTR [bp-2],OFFSET _ds	;dsi
	jmp	SHORT $F891
; Line 197
$SC900:
; Line 198
	mov	ax,1
	push	ax
	mov	ax,2
	push	ax
	call	_MapInEMSSprite
	add	sp,4
	or	ax,ax
	je	$SB897
; Line 200
	sub	cx,cx
	push	cx
	push	cx
	push	cx
	mov	cx,256
	push	cx
	mov	bx,WORD PTR _RpCRT
	mov	cx,WORD PTR [bx+4]
	add	cx,WORD PTR _sy
	push	cx
	mov	cx,WORD PTR [bx+2]
	add	cx,WORD PTR _sx
	push	cx
	push	bx
	mov	cx,10
	push	cx
	push	cx
	mov	cx,67
	push	cx
	mov	cx,189
	push	cx
	push	ax
	call	_ScaleRotate
	add	sp,24
; Line 201
; Line 202
$SB897:
; Line 210
; Line 211
; Line 212
	inc	WORD PTR [bp-18]	;i
	add	WORD PTR [bp-2],12	;dsi
$F891:
	mov	ax,WORD PTR [bp-18]	;i
	cmp	WORD PTR _NDECOY,ax
	jle	$FB893
; Line 193
	mov	bx,WORD PTR [bp-2]	;dsi
	cmp	WORD PTR [bx+8],0
	je	$SB897
; Line 194
	push	WORD PTR [bx+2]
	push	WORD PTR [bx]
	call	_Tacxy
	add	sp,4
; Line 195
	cmp	WORD PTR _sz,-1
	je	$SB897
; Line 196
	mov	bx,WORD PTR [bp-2]	;dsi
	mov	ax,WORD PTR [bx+6]
	dec	ax
	je	$SC900
	dec	ax
	jne	$SB897
; Line 203
	jmp	SHORT $SC900
	nop	
$FB893:
; Line 214
	mov	WORD PTR [bp-18],0	;i
	jmp	SHORT $F904
	nop	
$FC905:
	inc	WORD PTR [bp-18]	;i
$F904:
	cmp	WORD PTR [bp-18],4	;i
	jl	$JCC1209
	jmp	$L20008
$JCC1209:
; Line 215
	mov	bx,WORD PTR [bp-18]	;i
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	push	WORD PTR _wps[bx+2]
	push	WORD PTR _wps[bx]
	call	_Tacxy
	add	sp,4
; Line 216
	cmp	WORD PTR _sz,-1
	je	$FC905
; Line 217
	mov	ax,90
	push	ax
	push	WORD PTR _sy
	push	WORD PTR _sx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawDot
	add	sp,8
; Line 218
	mov	ax,90
	push	ax
	mov	cx,WORD PTR _sy
	inc	cx
	push	cx
	mov	cx,WORD PTR _sx
	dec	cx
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawDot
	add	sp,8
; Line 219
	mov	ax,90
	push	ax
	mov	cx,WORD PTR _sy
	inc	cx
	push	cx
	mov	cx,WORD PTR _sx
	inc	cx
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawDot
	add	sp,8
; Line 220
	mov	ax,90
	push	ax
	mov	cx,WORD PTR _sy
	inc	cx
	inc	cx
	push	cx
	mov	cx,WORD PTR _sx
	dec	cx
	dec	cx
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawDot
	add	sp,8
; Line 221
	mov	ax,90
	push	ax
	mov	cx,WORD PTR _sy
	inc	cx
	inc	cx
	push	cx
	mov	cx,WORD PTR _sx
	inc	cx
	inc	cx
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawDot
	add	sp,8
; Line 222
	mov	ax,90
	push	ax
	mov	ax,WORD PTR _sy
	add	ax,3
	push	ax
	mov	cx,WORD PTR _sx
	add	cx,3
	push	cx
	push	ax
	mov	ax,WORD PTR _sx
	sub	ax,3
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 223
; Line 224
	jmp	$FC905

_DoTac	ENDP
; Line 231
	PUBLIC	_TacBox
_TacBox	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	color = 4
; Line 232
	push	WORD PTR [bp+4]	;color
	mov	ax,WORD PTR _sy
	sub	ax,5
	push	ax
	mov	cx,WORD PTR _sx
	add	cx,5
	push	cx
	push	ax
	mov	ax,WORD PTR _sx
	sub	ax,5
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	mov	sp,bp
; Line 233
	push	WORD PTR [bp+4]	;color
	mov	ax,WORD PTR _sy
	add	ax,5
	push	ax
	mov	ax,WORD PTR _sx
	add	ax,5
	push	ax
	mov	cx,WORD PTR _sy
	sub	cx,5
	push	cx
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	mov	sp,bp
; Line 234
	push	WORD PTR [bp+4]	;color
	mov	ax,WORD PTR _sy
	add	ax,5
	push	ax
	mov	cx,WORD PTR _sx
	sub	cx,5
	push	cx
	push	ax
	mov	ax,WORD PTR _sx
	add	ax,5
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	mov	sp,bp
; Line 235
	push	WORD PTR [bp+4]	;color
	mov	ax,WORD PTR _sy
	sub	ax,5
	push	ax
	mov	ax,WORD PTR _sx
	sub	ax,5
	push	ax
	mov	cx,WORD PTR _sy
	add	cx,5
	push	cx
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
; Line 236
	mov	sp,bp
	pop	bp
	ret	

_TacBox	ENDP
; Line 240
	PUBLIC	_Tacxy
_Tacxy	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	dx = -2
;	dy = -4
;	y = 6
;	x = 4
; Line 243
	mov	WORD PTR _sz,-1
; Line 245
	mov	cl,7
	sub	cl,BYTE PTR _Tscale
	mov	ax,WORD PTR [bp+4]	;x
	sub	ax,WORD PTR _Px
	sar	ax,cl
	mov	WORD PTR [bp-2],ax	;dx
; Line 246
	mov	dx,WORD PTR [bp+6]	;y
	sub	dx,WORD PTR _Py
	sar	dx,cl
	mov	WORD PTR [bp-4],dx	;dy
; Line 248
	push	ax
	mov	si,dx
	call	_abs
	add	sp,2
	push	si
	mov	si,ax
	call	_abs
	add	sp,2
	add	si,ax
	mov	bx,WORD PTR _RpCRT
	cmp	si,WORD PTR [bx+6]
	ja	$I917
; Line 249
	mov	ax,OFFSET _sy
	push	ax
	mov	cx,OFFSET _sx
	push	cx
	push	WORD PTR _OurHead
	push	WORD PTR [bp-4]	;dy
	push	WORD PTR [bp-2]	;dx
	call	_Rotate2D
	add	sp,10
; Line 251
	mov	cl,3
	mov	ax,WORD PTR _sy
	sar	ax,cl
	sub	WORD PTR _sy,ax
; Line 252
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	add	WORD PTR _sy,ax
; Line 255
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	add	WORD PTR _sx,ax
	js	$I917
	mov	ax,WORD PTR [bx+6]
	cmp	WORD PTR _sx,ax
	jge	$I917
	cmp	WORD PTR _sy,0
	jl	$I917
	mov	ax,WORD PTR _sy
	cmp	WORD PTR [bx+8],ax
	jle	$I917
	mov	WORD PTR _sz,0
; Line 256
$I917:
; Line 259
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Tacxy	ENDP
; Line 282
concentric	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	i = -4
;	r = -2
; Line 285
	mov	WORD PTR [bp-4],0	;i
	mov	WORD PTR [bp-2],7	;r
	jmp	SHORT $F921
	nop	
$FC922:
; Line 286
	sub	ax,ax
	push	ax
	mov	ax,30
	push	ax
	push	WORD PTR [bp-2]	;r
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	push	bx
	call	_draw_circle
	add	sp,12
	inc	WORD PTR [bp-4]	;i
	add	WORD PTR [bp-2],7	;r
$F921:
	cmp	WORD PTR [bp-4],4	;i
	jl	$FC922
; Line 287
	mov	ax,30
	push	ax
	mov	cx,53
	push	cx
	mov	cx,41
	push	cx
	mov	dx,4
	push	dx
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 288
	mov	ax,30
	push	ax
	mov	ax,28
	push	ax
	mov	cx,69
	push	cx
	push	ax
	mov	ax,13
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
; Line 289
	mov	sp,bp
	pop	bp
	ret	
	nop	

concentric	ENDP
; Line 293
show_range	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
;	s = -10
;	l = -12
; Line 298
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+16],4
; Line 299
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+12],15
; Line 301
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	bx,WORD PTR _Tscale
	shl	bx,1
	push	WORD PTR $S926_RANGES[bx]
	call	_itoa
	add	sp,6
	push	ax
	push	WORD PTR _RpCRT
	call	_pstrlen
	add	sp,4
	mov	WORD PTR [bp-12],ax	;l
; Line 303
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	ax,2
	push	ax
	mov	ax,75
	sub	ax,WORD PTR [bp-12]	;l
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
; Line 304
	mov	sp,bp
	pop	bp
	ret	
	nop	

show_range	ENDP
; Line 310
	PUBLIC	_TacScaleRotate256
_TacScaleRotate256	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,678
	call	__aNchkstk
	push	di
	push	si
;	T1 = -10
;	T2 = -14
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
; Line 317
	cmp	WORD PTR [bp+20],1	;SCALE
	jge	$I962
	mov	WORD PTR [bp+20],1	;SCALE
; Line 318
$I962:
; Line 319
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
; Line 321
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
; Line 322
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
; Line 323
	mov	cx,WORD PTR [bp-658]	;X1
	add	cx,WORD PTR [bp-10]	;T1
	mov	WORD PTR [bp-662],cx	;X2
; Line 324
	add	ax,WORD PTR [bp-14]	;T2
	mov	WORD PTR [bp-666],ax	;Y2
; Line 326
	mov	bx,WORD PTR [bp+14]	;Rp
	mov	ax,WORD PTR [bx+2]
	add	ax,WORD PTR [bx+6]
	cmp	WORD PTR [bp-658],ax	;X1
	jle	$I963
$L20018:
	mov	ax,1
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 327
$I963:
	mov	ax,WORD PTR [bx+4]
	add	ax,WORD PTR [bx+8]
	cmp	ax,WORD PTR [bp-664]	;Y1
	jl	$L20018
; Line 328
	mov	ax,cx
	cmp	WORD PTR [bx+2],ax
	jg	$L20018
; Line 329
	mov	ax,WORD PTR [bp-666]	;Y2
	cmp	WORD PTR [bx+4],ax
	jg	$L20018
; Line 331
	mov	ax,WORD PTR [bp-658]	;X1
	cmp	WORD PTR [bx+2],ax
	jle	$I967
	mov	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-658],ax	;X1
; Line 332
$I967:
	mov	ax,WORD PTR [bx+2]
	add	ax,WORD PTR [bx+6]
	cmp	ax,cx
	jge	$I968
	mov	WORD PTR [bp-662],ax	;X2
; Line 333
$I968:
	mov	ax,WORD PTR [bp-664]	;Y1
	cmp	WORD PTR [bx+4],ax
	jle	$I969
	mov	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-664],ax	;Y1
; Line 334
$I969:
	mov	ax,WORD PTR [bx+4]
	add	ax,WORD PTR [bx+8]
	cmp	ax,WORD PTR [bp-666]	;Y2
	jge	$I970
	mov	WORD PTR [bp-666],ax	;Y2
; Line 337
$I970:
	push	WORD PTR [bp+22]	;ROLL
	mov	ax,8192
	push	ax
	call	_ACosB
	add	sp,4
	cwd	
	idiv	WORD PTR [bp+20]	;SCALE
	mov	WORD PTR [bp-670],ax	;TX
	mov	WORD PTR [bp-676],ax	;SSX
; Line 338
	push	WORD PTR [bp+22]	;ROLL
	mov	cx,8192
	push	cx
	call	_ASinB
	add	sp,4
	cwd	
	idiv	WORD PTR [bp+20]	;SCALE
	mov	WORD PTR [bp-674],ax	;TY
	mov	WORD PTR [bp-678],ax	;SSY
; Line 340
	cmp	WORD PTR [bp+26],0	;MIRROR
	je	$I973
	neg	WORD PTR [bp-670]	;TX
; Line 342
$I973:
	mov	WORD PTR [bp-660],0	;i
	jmp	SHORT $F974
$FC975:
; Line 343
	mov	ax,WORD PTR [bp-674]	;TY
	imul	WORD PTR [bp-660]	;i
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,5
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	ah,al
	sub	al,al
	mov	cx,ax
	mov	ax,WORD PTR [bp-670]	;TX
	imul	WORD PTR [bp-660]	;i
	mov	bx,cx
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,5
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	add	bx,ax
	mov	si,WORD PTR [bp-660]	;i
	shl	si,1
	mov	WORD PTR [bp-656][si],bx
; Line 344
	inc	WORD PTR [bp-660]	;i
$F974:
	mov	ax,WORD PTR [bp-662]	;X2
	sub	ax,WORD PTR [bp-658]	;X1
	cmp	ax,WORD PTR [bp-660]	;i
	jge	$FC975
; Line 346
	mov	ax,WORD PTR [bp-664]	;Y1
	mov	WORD PTR [bp-660],ax	;i
	jmp	$F977
	nop	
$FC978:
; Line 350
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
	mov	ax,WORD PTR [bp-658]	;X1
	sub	ax,WORD PTR [bp+16]	;XDC
	mov	cx,ax
	imul	WORD PTR [bp-674]	;TY
	mov	dx,ax
	mov	ax,WORD PTR [bp-660]	;i
	sub	ax,WORD PTR [bp+18]	;YDC
	mov	bx,dx
	imul	WORD PTR [bp-676]	;SSX
	add	ax,bx
	mov	bx,cx
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,5
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	ah,al
	add	ah,BYTE PTR [bp+8]	;YSC
	sub	al,al
	mov	cx,ax
	mov	ax,WORD PTR [bp+18]	;YDC
	sub	ax,WORD PTR [bp-660]	;i
	imul	WORD PTR [bp-674]	;TY
	mov	si,cx
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,5
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	add	si,ax
	mov	ax,bx
	imul	WORD PTR [bp-670]	;TX
	cwd	
	xor	ax,dx
	sub	ax,dx
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	add	si,ax
	add	si,WORD PTR [bp+6]	;XSC
	mov	WORD PTR [bp-6],si	;ADDBASE
	push	si
	push	WORD PTR [bp+4]	;SOURCE
	call	_TacTransScaleLine
	add	sp,16
; Line 351
	inc	WORD PTR [bp-660]	;i
$F977:
	mov	ax,WORD PTR [bp-666]	;Y2
	cmp	WORD PTR [bp-660],ax	;i
	jg	$JCC2580
	jmp	$FC978
$JCC2580:
; Line 352
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_TacScaleRotate256	ENDP
; Line 356
	PUBLIC	_TacMap
_TacMap	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
	push	si
;	XP = -10
;	ZP = -12
;	WID = -4
;	HT = -14
;	XDC = -18
;	YDC = -2
;	PTR = -8
;	SEG = -16
;	zoom = 14
;	Z = 10
;	X = 6
;	Rp = 4
; Line 363
	mov	ax,WORD PTR [bp+10]	;Z
	mov	dx,WORD PTR [bp+12]
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
; Line 364
	mov	bx,WORD PTR [bp+4]	;Rp
	mov	cx,WORD PTR [bx+6]
	inc	cx
	mov	WORD PTR [bp-4],cx	;WID
; Line 365
	mov	dx,WORD PTR [bx+8]
	inc	dx
	mov	WORD PTR [bp-14],dx	;HT
; Line 366
	mov	si,ax
	mov	ax,cx
	mov	cx,dx
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-18],ax	;XDC
; Line 367
	mov	ax,cx
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-2],ax	;YDC
; Line 370
	sub	ax,ax
	push	ax
	call	_MapInBank
	add	sp,2
	mov	WORD PTR [bp-16],ax	;SEG
; Line 372
	sub	cx,cx
	push	cx
	mov	cx,82
	push	cx
	push	WORD PTR _OurHead
	mov	cl,BYTE PTR _Tscale
	mov	dx,256
	shl	dx,cl
	push	dx
	push	WORD PTR [bp-2]	;YDC
	push	WORD PTR [bp-18]	;XDC
	push	WORD PTR [bp+4]	;Rp
	push	WORD PTR [bp-14]	;HT
	push	WORD PTR [bp-4]	;WID
	push	si
	mov	ax,WORD PTR [bp+6]	;X
	mov	dx,WORD PTR [bp+8]
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
	push	ax
	push	WORD PTR [bp-16]	;SEG
	call	_TacScaleRotate256
	add	sp,24
; Line 374
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_TacMap	ENDP
_TEXT	ENDS
END
