;	Static Name Aliases
;
;	$S768_BITPERPIX_Y	EQU	BITPERPIX_Y
;	$S769_MAXBITS	EQU	MAXBITS
;	$S770_OORBITS	EQU	OORBITS
;	$S771_CRT_X	EQU	CRT_X
;	$S772_CRT_Y	EQU	CRT_Y
;	$S773_TEWS_RNG	EQU	TEWS_RNG
;	$S774_flash_off	EQU	flash_off
;	$S758_SYMBL_T	EQU	SYMBL_T
;	$S759_MISSL_T	EQU	MISSL_T
;	$S760_TOTAL_T	EQU	TOTAL_T
;	$S765_MTHREATS	EQU	MTHREATS
;	$S766_QUADLITE	EQU	QUADLITE
;	$S767_BITPERPIX_X	EQU	BITPERPIX_X
;	$S914_RANGES	EQU	RANGES
;	$S940_ticks	EQU	ticks
;	$S941_off	EQU	off
	TITLE   C:\TEWS.C
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
PUBLIC  _JAMMER_ACTIVE
PUBLIC  _JAMMER
EXTRN	_itoa:NEAR
EXTRN	_draw_circle:NEAR
EXTRN	_GetPlanePtr:NEAR
EXTRN	_GetMissilePtr:NEAR
EXTRN	_GetRadarPtr:NEAR
EXTRN	_DrawLine:FAR
EXTRN	_pstrlen:NEAR
EXTRN	_RpPrint:FAR
EXTRN	_ChangeColor:FAR
EXTRN	_Dist2D:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_RectFill:FAR
EXTRN	_ClipSprite:FAR
EXTRN	_ARCTAN:NEAR
EXTRN	_ACosB:NEAR
EXTRN	_ASinB:NEAR
EXTRN	_cosX:NEAR
EXTRN	_sinX:NEAR
_BSS      SEGMENT
COMM NEAR	_MLAUNCH:	BYTE:	 2
COMM NEAR	_ntmp:	 1:	 10
COMM NEAR	_AIDETECT:	BYTE:	 2
_BSS      ENDS
EXTRN	_Damaged:WORD
EXTRN	_FrameRate:WORD
EXTRN	_ss:BYTE
EXTRN	_NRADAR:WORD
EXTRN	_NPLANES:WORD
EXTRN	_Rdrs:BYTE
EXTRN	_ps:BYTE
EXTRN	_RpCRT:WORD
EXTRN	_Px:WORD
EXTRN	_Py:WORD
EXTRN	_bv:BYTE
EXTRN	_OurHead:WORD
EXTRN	_TEWSprites:BYTE
EXTRN	_FTicks:WORD
COMM FAR	_THREATS:	 4:	 50
COMM FAR	_SYMBOLS:	 4:	 10
_DATA      SEGMENT
	ORG	$+48
$SG943	DB	'JAMMER ACTIVE',  00H
	ORG	$-62
$S766_QUADLITE	DW	00H
	DW	00H
	DW	00H
	DW	00H
$S767_BITPERPIX_X	DW	017H
	DW	02dH
	DW	05aH
$S768_BITPERPIX_Y	DW	019H
	DW	032H
	DW	064H
$S769_MAXBITS	DW	01dbH
	DW	03b6H
	DW	076cH
$S770_OORBITS	DW	0251H
	DW	04a4H
	DW	0947H
$S773_TEWS_RNG	DW	02H
$S774_flash_off	DW	00H
_JAMMER_ACTIVE	DW	00H
_JAMMER	DW	01H
	DW	00H
$S914_RANGES	DW	0aH
	DW	014H
	DW	028H
	ORG	$+14
$S940_ticks	DW	00H
$S941_off	DW	00H
_DATA      ENDS
_BSS      SEGMENT
	ORG	$+26
$S771_CRT_X	DW 01H DUP (?)
$S772_CRT_Y	DW 01H DUP (?)
	ORG	$-28
$S758_SYMBL_T	DW 01H DUP (?)
$S759_MISSL_T	DW 01H DUP (?)
	ORG	$-6
$S760_TOTAL_T	DW 01H DUP (?)
	ORG	$+4
$S765_MTHREATS	DW 0aH DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 15
; Line 16
; Line 17
; Line 18
; Line 19
; Line 20
; Line 21
; Line 22
; Line 23
; Line 102
	PUBLIC	_TEWS_SYS
_TEWS_SYS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 106
	sub	ax,ax
	mov	WORD PTR $S760_TOTAL_T,ax
	mov	WORD PTR [bp-2],ax	;i
	jmp	SHORT $F788
	nop	
$FC789:
; Line 107
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,1
	cmp	WORD PTR $S766_QUADLITE[bx],0
	jle	$I791
	dec	WORD PTR $S766_QUADLITE[bx]
; Line 109
$I791:
	inc	WORD PTR [bp-2]	;i
$F788:
	cmp	WORD PTR [bp-2],4	;i
	jl	$FC789
	call	_RadarThreats
; Line 110
	call	_PlaneThreats
; Line 111
	call	_MissileThreats
; Line 112
	call	_SortThreats
; Line 113
	mov	sp,bp
	pop	bp
	ret	
	nop	

_TEWS_SYS	ENDP
; Line 117
_TEXT      ENDS
CONST      SEGMENT
$T20003	DW SEG _THREATS 
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_RadarThreats
_RadarThreats	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
;	i = -6
;	w = -4
;	p = -2
;	rri = -14
;	tempmissile = -10
; Line 123
	sub	ax,ax
	mov	WORD PTR _JAMMER_ACTIVE,ax
	mov	WORD PTR [bp-6],ax	;i
	jmp	SHORT $F802
	nop	
$L20001:
	mov	ax,3
$L20002:
	mov	es,WORD PTR $T20003
	mov	bx,WORD PTR $S760_TOTAL_T
	shl	bx,1
	shl	bx,1
	mov	WORD PTR es:_THREATS[bx],ax
; Line 136
	mov	ax,WORD PTR [bp-6]	;i
	mov	WORD PTR es:_THREATS[bx+2],ax
	inc	WORD PTR $S760_TOTAL_T
; Line 137
	les	bx,DWORD PTR [bp-14]	;rri
	cmp	WORD PTR es:[bx+16],0
	jne	$I810
$FC803:
	inc	WORD PTR [bp-6]	;i
$F802:
	mov	ax,WORD PTR [bp-6]	;i
	cmp	WORD PTR _NRADAR,ax
	jle	$FB804
; Line 125
	mov	bx,ax
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,OFFSET _Rdrs
	cmp	BYTE PTR [bx+4],0
	je	$FC803
; Line 126
	test	BYTE PTR [bx+6],128
	jne	$FC803
; Line 127
	test	BYTE PTR [bx+6],16
	je	$FC803
; Line 129
	cmp	WORD PTR $S760_TOTAL_T,50
	jge	$FB804
; Line 132
	mov	al,BYTE PTR [bx+4]
	cbw	
	push	ax
	call	_GetRadarPtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	WORD PTR [bp-14],bx	;rri
	mov	WORD PTR [bp-12],es
	cmp	WORD PTR es:[bx+14],2
	jne	$FC803
; Line 134
	push	WORD PTR es:[bx+16]
	call	_GetMissilePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	ax,WORD PTR es:[bx+22]
; Line 135
	cmp	ax,5
	je	$JCC224
	jmp	$L20001
$JCC224:
	mov	ax,2
	jmp	$L20002
; Line 138
	nop	
$I810:
	cmp	WORD PTR _JAMMER,0
	je	$FC803
	mov	WORD PTR _JAMMER_ACTIVE,1
; Line 139
	jmp	SHORT $FC803
	nop	
$FB804:
; Line 140
	mov	sp,bp
	pop	bp
	ret	

_RadarThreats	ENDP
; Line 144
	PUBLIC	_PlaneThreats
_PlaneThreats	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	i = -6
;	tempplane = -4
; Line 148
	sub	ax,ax
	mov	WORD PTR [bp-6],ax	;i
	mov	WORD PTR _AIDETECT,ax
	jmp	$F815
$FC816:
; Line 149
	mov	ax,40
	imul	WORD PTR [bp-6]	;i
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],2
	jne	$JCC289
	jmp	$L20007
$JCC289:
; Line 150
	mov	ax,46
	imul	WORD PTR [bp-6]	;i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	je	$JCC307
	jmp	$L20007
$JCC307:
; Line 151
	mov	ax,40
	imul	WORD PTR [bp-6]	;i
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],64
	jne	$JCC325
	jmp	$L20007
$JCC325:
; Line 152
	mov	ax,40
	imul	WORD PTR [bp-6]	;i
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],32
	jne	$L20007
; Line 153
	mov	ax,40
	imul	WORD PTR [bp-6]	;i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+26],0
	je	$L20007
; Line 154
	mov	ax,40
	imul	WORD PTR [bp-6]	;i
	mov	bx,ax
	push	WORD PTR _ps[bx+4]
	push	WORD PTR _ps[bx+2]
	call	threat_in_rng
	add	sp,4
	or	ax,ax
	je	$L20007
; Line 156
	mov	ax,40
	imul	WORD PTR [bp-6]	;i
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	cmp	WORD PTR es:[bx+14],0
	je	$L20007
; Line 157
	mov	ax,46
	imul	WORD PTR [bp-6]	;i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],1
	je	$L20007
; Line 158
	cmp	WORD PTR $S760_TOTAL_T,50
	jge	$FB817
; Line 160
	mov	ax,1
	mov	WORD PTR _AIDETECT,ax
	mov	es,WORD PTR $T20003
	mov	bx,WORD PTR $S760_TOTAL_T
	shl	bx,1
	shl	bx,1
	mov	WORD PTR es:_THREATS[bx],ax
; Line 161
	mov	ax,WORD PTR [bp-6]	;i
	mov	WORD PTR es:_THREATS[bx+2],ax
	inc	WORD PTR $S760_TOTAL_T
; Line 162
$L20007:
	inc	WORD PTR [bp-6]	;i
$F815:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-6],ax	;i
	jge	$JCC481
	jmp	$FC816
$JCC481:
$FB817:
; Line 163
	mov	sp,bp
	pop	bp
	ret	
	nop	
	nop	

_PlaneThreats	ENDP
; Line 168
	PUBLIC	_MissileThreats
_MissileThreats	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	si
;	i = -2
;	tempmissile = -6
; Line 172
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;i
	mov	WORD PTR $S759_MISSL_T,ax
	mov	WORD PTR _MLAUNCH,ax
	jmp	$F831
$FC832:
; Line 173
	mov	ax,44
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	push	WORD PTR _ss[bx+28]
	mov	si,bx
	call	_GetMissilePtr
	add	sp,2
	mov	WORD PTR [bp-6],ax	;tempmissile
	mov	WORD PTR [bp-4],dx
; Line 174
	cmp	WORD PTR _ss[si+26],0
	jne	$JCC547
	jmp	$L20008
$JCC547:
; Line 175
	mov	ax,44
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	mov	ax,WORD PTR _ss[bx+4]
	mov	dx,WORD PTR _ss[bx+6]
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
	mov	ax,WORD PTR _ss[bx]
	mov	dx,WORD PTR _ss[bx+2]
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
	call	threat_in_rng
	add	sp,4
	or	ax,ax
	je	$L20008
; Line 176
	mov	ax,44
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	cmp	WORD PTR _ss[bx+36],1
	jne	$I836
	cmp	WORD PTR _ss[bx+34],70
	je	$L20008
; Line 177
$I836:
	mov	ax,44
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	cmp	WORD PTR _ss[bx+36],0
	jne	$I837
	mov	WORD PTR _MLAUNCH,1
; Line 178
$I837:
; Line 179
	les	bx,DWORD PTR [bp-6]	;tempmissile
	cmp	WORD PTR es:[bx+22],3
	je	$I838
	cmp	WORD PTR es:[bx+22],4
	jne	$L20008
; Line 180
$I838:
	push	WORD PTR [bp-2]	;i
	call	launch_chk
	add	sp,2
; Line 181
	cmp	WORD PTR $S759_MISSL_T,10
	jge	$FB833
; Line 182
	mov	ax,WORD PTR [bp-2]	;i
	mov	bx,WORD PTR $S759_MISSL_T
	shl	bx,1
	mov	WORD PTR $S765_MTHREATS[bx],ax
	inc	WORD PTR $S759_MISSL_T
; Line 183
$L20008:
	inc	WORD PTR [bp-2]	;i
$F831:
	cmp	WORD PTR [bp-2],28	;i
	jge	$JCC728
	jmp	$FC832
$JCC728:
$FB833:
; Line 184
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_MissileThreats	ENDP
; Line 189
_TEXT      ENDS
CONST      SEGMENT
$T20004	DW SEG _SYMBOLS 
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_SortThreats
_SortThreats	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	i = -2
;	j = -4
; Line 192
	sub	ax,ax
	mov	WORD PTR [bp-4],ax	;j
	mov	WORD PTR $S758_SYMBL_T,ax
	jmp	SHORT $F844
	nop	
$I851:
; Line 198
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR es:_THREATS[bx]
	mov	dx,WORD PTR es:_THREATS[bx+2]
	mov	es,WORD PTR $T20004
	mov	bx,WORD PTR $S758_SYMBL_T
	shl	bx,1
	shl	bx,1
	mov	WORD PTR es:_SYMBOLS[bx],ax
	mov	WORD PTR es:_SYMBOLS[bx+2],dx
	inc	WORD PTR $S758_SYMBL_T
; Line 199
$FC848:
	inc	WORD PTR [bp-2]	;i
$F847:
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR $S760_TOTAL_T,ax
	jle	$FC845
; Line 194
	mov	bx,ax
	shl	bx,1
	shl	bx,1
	mov	es,WORD PTR $T20003
	mov	ax,WORD PTR [bp-4]	;j
	cmp	WORD PTR es:_THREATS[bx],ax
	jne	$FC848
; Line 195
	cmp	WORD PTR $S758_SYMBL_T,10
	jl	$I851
; Line 196
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
$FC845:
	inc	WORD PTR [bp-4]	;j
$F844:
	cmp	WORD PTR [bp-4],3	;j
	jg	$FB846
; Line 193
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F847
$FB846:
	mov	sp,bp
	pop	bp
	ret	

_SortThreats	ENDP
; Line 204
launch_chk	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	j = -2
;	i = 4
; Line 207
	mov	ax,44
	imul	WORD PTR [bp+4]	;i
	mov	bx,ax
	cmp	WORD PTR _ss[bx+36],0
	je	$I856
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 209
$I856:
	mov	WORD PTR [bp-2],0	;j
	jmp	SHORT $F857
	nop	
$FC858:
; Line 210
	mov	bx,ax
	shl	bx,1
	shl	bx,1
	mov	es,WORD PTR $T20003
	cmp	WORD PTR es:_THREATS[bx],3
	jne	$I860
	mov	ax,44
	imul	WORD PTR [bp+4]	;i
	mov	si,ax
	mov	ax,WORD PTR _ss[si+34]
	cmp	WORD PTR es:_THREATS[bx+2],ax
	jne	$I860
; Line 211
	mov	WORD PTR es:_THREATS[bx],0
; Line 212
$I860:
	inc	WORD PTR [bp-2]	;j
$F857:
	mov	ax,WORD PTR [bp-2]	;j
	cmp	WORD PTR $S760_TOTAL_T,ax
	jg	$FC858
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

launch_chk	ENDP
; Line 217
threat_in_rng	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	y = 6
;	x = 4
; Line 218
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR [bp+6]	;y
	push	ax
	mov	ax,WORD PTR [bp+4]	;x
	sub	ax,WORD PTR _Px
	push	ax
	call	_Dist2D
	mov	sp,bp
	cmp	ax,3800
	ja	$L20005
	mov	ax,1
	pop	bp
	ret	
$L20005:
	sub	ax,ax
; Line 219
	pop	bp
	ret	

threat_in_rng	ENDP
; Line 227
	PUBLIC	_TEWS_RANGE
_TEWS_RANGE	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	i = 4
; Line 230
	mov	ax,WORD PTR [bp+4]	;i
	add	WORD PTR $S773_TEWS_RNG,ax
	cmp	WORD PTR $S773_TEWS_RNG,2
	jle	$I868
	mov	WORD PTR $S773_TEWS_RNG,2
; Line 231
$I868:
	cmp	WORD PTR $S773_TEWS_RNG,0
	jge	$I869
	mov	WORD PTR $S773_TEWS_RNG,0
; Line 232
$I869:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_TEWS_RANGE	ENDP
; Line 240
	PUBLIC	_TEWS_SPOTTED
_TEWS_SPOTTED	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	a = -2
;	quad = -4
;	i = 4
; Line 242
	mov	ax,WORD PTR _Py
	mov	bx,WORD PTR [bp+4]	;i
	mov	cx,bx
	shl	bx,1
	shl	bx,1
	add	bx,cx
	shl	bx,1
	sub	ax,WORD PTR _Rdrs[bx+2]
	push	ax
	mov	ax,WORD PTR _Rdrs[bx]
	sub	ax,WORD PTR _Px
	push	ax
	call	_ARCTAN
	mov	WORD PTR [bp-2],ax	;a
; Line 244
	mov	cl,6
	mov	ax,WORD PTR _OurHead
	sub	WORD PTR [bp-2],ax	;a
	mov	ax,WORD PTR [bp-2]	;a
	add	ah,32
	mov	al,ah
	sub	ah,ah
	shr	ax,cl
; Line 245
	mov	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _FrameRate
	mov	WORD PTR $S766_QUADLITE[bx],ax
; Line 246
	mov	sp,bp
	pop	bp
	ret	

_TEWS_SPOTTED	ENDP
; Line 254
	PUBLIC	_TEWS_GFX
_TEWS_GFX	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	f = -2
;	i = -4
; Line 257
	test	BYTE PTR _Damaged+1,64
	je	$I880
; Line 258
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
; Line 259
$L20009:
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 260
; Line 263
	nop	
$I880:
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+16]
	mov	WORD PTR [bp-2],ax	;f
; Line 264
	mov	WORD PTR [bx+16],4
; Line 265
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+12],19
; Line 266
	xor	BYTE PTR $S774_flash_off,1
; Line 268
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
; Line 270
	call	_concentric
; Line 271
	call	arrows
; Line 275
	mov	ax,WORD PTR $S758_SYMBL_T
	dec	ax
	mov	WORD PTR [bp-4],ax	;i
	jmp	SHORT $F883
; Line 277
$SC890:
; Line 278
	mov	ax,1
$L20010:
	push	ax
	mov	es,WORD PTR $T20004
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	shl	bx,1
	push	WORD PTR es:_SYMBOLS[bx+2]
	call	_show_radar
	add	sp,4
; Line 279
$FC884:
	dec	WORD PTR [bp-4]	;i
$F883:
	cmp	WORD PTR [bp-4],0	;i
	jl	$FB885
; Line 276
	mov	es,WORD PTR $T20004
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR es:_SYMBOLS[bx]
	or	ax,ax
	je	$SC890
	dec	ax
	je	$SC892
	dec	ax
	jl	$FC884
	dec	ax
	jle	$SC894
	jmp	SHORT $FC884
; Line 280
$SC892:
; Line 281
	mov	es,WORD PTR $T20004
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	shl	bx,1
	push	WORD PTR es:_SYMBOLS[bx+2]
	call	_show_plane
	add	sp,2
; Line 282
	jmp	SHORT $FC884
; Line 283
$SC894:
; Line 285
	sub	ax,ax
	jmp	SHORT $L20010
$FB885:
; Line 289
	call	_show_missiles
; Line 290
	call	_show_range
; Line 291
	call	_show_jamming
; Line 293
	mov	ax,WORD PTR [bp-2]	;f
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+16],ax
	jmp	$L20009
; Line 295

_TEWS_GFX	ENDP
; Line 299
	PUBLIC	_concentric
_concentric	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	i = -4
;	r = -2
; Line 302
	mov	WORD PTR [bp-4],0	;i
	mov	WORD PTR [bp-2],5	;r
	jmp	SHORT $F901
	nop	
$FC902:
; Line 303
	sub	ax,ax
	push	ax
	mov	ax,82
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
	add	WORD PTR [bp-2],5	;r
$F901:
	cmp	WORD PTR [bp-4],4	;i
	jl	$FC902
; Line 306
	mov	ax,82
	push	ax
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	cx,ax
	add	ax,20
	push	ax
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	sub	cx,20
	push	cx
	push	ax
	push	bx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 308
	mov	ax,82
	push	ax
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	mov	cx,ax
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	dx,ax
	add	ax,24
	push	ax
	push	cx
	sub	dx,24
	push	dx
	push	bx
	call	FAR PTR _DrawLine
; Line 309
	mov	sp,bp
	pop	bp
	ret	
	nop	

_concentric	ENDP
; Line 314
arrows	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	x = -2
;	y = -4
;	color = -6
; Line 323
	cmp	WORD PTR $S766_QUADLITE,0
	je	$I909
; Line 325
	mov	ax,86
	push	ax
	mov	ax,82
	push	ax
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	push	WORD PTR [bx+6]
	sub	ax,ax
	push	ax
	push	ax
	push	bx
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 326
; Line 327
$I909:
	cmp	WORD PTR $S766_QUADLITE+2,0
	je	$I910
; Line 329
	mov	ax,86
	push	ax
	mov	ax,82
	push	ax
	mov	bx,WORD PTR _RpCRT
	push	WORD PTR [bx+8]
	push	WORD PTR [bx+6]
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	push	bx
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 330
; Line 331
$I910:
	cmp	WORD PTR $S766_QUADLITE+4,0
	je	$I911
; Line 333
	mov	ax,86
	push	ax
	mov	ax,82
	push	ax
	mov	bx,WORD PTR _RpCRT
	push	WORD PTR [bx+8]
	push	WORD PTR [bx+6]
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	sub	ax,ax
	push	ax
	push	bx
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 334
; Line 335
$I911:
	cmp	WORD PTR $S766_QUADLITE+6,0
	je	$I912
; Line 337
	mov	ax,86
	push	ax
	mov	ax,82
	push	ax
	mov	bx,WORD PTR _RpCRT
	push	WORD PTR [bx+8]
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	push	bx
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 338
; Line 383
$I912:
	mov	sp,bp
	pop	bp
	ret	
	nop	

arrows	ENDP
; Line 388
	PUBLIC	_show_range
_show_range	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	s = -4
;	l = -6
; Line 393
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-4]	;s
	push	ax
	mov	bx,WORD PTR $S773_TEWS_RNG
	shl	bx,1
	push	WORD PTR $S914_RANGES[bx]
	call	_itoa
	add	sp,6
	push	ax
	push	WORD PTR _RpCRT
	call	_pstrlen
	add	sp,4
	mov	WORD PTR [bp-6],ax	;l
; Line 394
	lea	ax,WORD PTR [bp-4]	;s
	push	ax
	mov	ax,4
	push	ax
	mov	ax,64
	sub	ax,WORD PTR [bp-6]	;l
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
; Line 395
	mov	sp,bp
	pop	bp
	ret	
	nop	

_show_range	ENDP
; Line 400
	PUBLIC	_show_missiles
_show_missiles	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	i = -2
;	j = -4
; Line 402
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F921
$FC922:
; Line 404
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,1
	mov	ax,WORD PTR $S765_MTHREATS[bx]
	mov	cx,44
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ss[bx+4]
	mov	dx,WORD PTR _ss[bx+6]
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
	mov	ax,WORD PTR _ss[bx]
	mov	dx,WORD PTR _ss[bx+2]
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
	call	_convert_xy
	add	sp,4
; Line 405
	push	WORD PTR _TEWSprites+8
	mov	ax,WORD PTR $S772_CRT_Y
	dec	ax
	push	ax
	mov	ax,WORD PTR $S771_CRT_X
	dec	ax
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _ClipSprite
	add	sp,8
; Line 406
	inc	WORD PTR [bp-2]	;i
$F921:
	mov	ax,WORD PTR $S759_MISSL_T
	cmp	WORD PTR [bp-2],ax	;i
	jl	$FC922
; Line 407
	mov	sp,bp
	pop	bp
	ret	
	nop	

_show_missiles	ENDP
; Line 412
	PUBLIC	_show_radar
_show_radar	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
;	x = -12
;	s = -10
;	tempradar = -4
;	flash = 6
;	i = 4
; Line 417
	mov	bx,WORD PTR [bp+4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	push	WORD PTR _Rdrs[bx+2]
	push	WORD PTR _Rdrs[bx]
	call	_convert_xy
	add	sp,4
; Line 418
	cmp	WORD PTR [bp+6],0	;flash
	je	$I931
	cmp	WORD PTR $S774_flash_off,0
	je	$I931
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 420
	nop	
$I931:
	push	WORD PTR _TEWSprites+4
	mov	ax,WORD PTR $S772_CRT_Y
	sub	ax,5
	push	ax
	mov	ax,WORD PTR $S771_CRT_X
	sub	ax,5
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _ClipSprite
	add	sp,8
; Line 421
	mov	bx,WORD PTR [bp+4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	al,BYTE PTR _Rdrs[bx+4]
	cbw	
	push	ax
	call	_GetRadarPtr
	add	sp,2
	mov	WORD PTR [bp-4],ax	;tempradar
	mov	WORD PTR [bp-2],dx
; Line 422
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	les	bx,DWORD PTR [bp-4]	;tempradar
	push	WORD PTR es:[bx+22]
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
	mov	WORD PTR [bp-12],ax	;x
; Line 423
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	ax,WORD PTR $S772_CRT_Y
	dec	ax
	dec	ax
	push	ax
	mov	ax,WORD PTR $S771_CRT_X
	sub	ax,WORD PTR [bp-12]	;x
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
; Line 424
	mov	sp,bp
	pop	bp
	ret	

_show_radar	ENDP
; Line 429
	PUBLIC	_show_plane
_show_plane	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
	push	si
;	start = -18
;	x = -16
;	s = -10
;	tempplane = -14
;	tempradar = -4
;	i = 4
; Line 435
	mov	ax,40
	imul	WORD PTR [bp+4]	;i
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	mov	si,ax
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-14],ax	;tempplane
	mov	WORD PTR [bp-12],dx
; Line 437
	push	WORD PTR _ps[si+4]
	push	WORD PTR _ps[si+2]
	call	_convert_xy
	add	sp,4
; Line 438
	push	WORD PTR _TEWSprites
	mov	ax,WORD PTR $S772_CRT_Y
	sub	ax,5
	push	ax
	mov	ax,WORD PTR $S771_CRT_X
	sub	ax,5
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _ClipSprite
	add	sp,8
; Line 439
	les	bx,DWORD PTR [bp-14]	;tempplane
	push	WORD PTR es:[bx+14]
	call	_GetRadarPtr
	add	sp,2
	mov	WORD PTR [bp-4],ax	;tempradar
	mov	WORD PTR [bp-2],dx
; Line 440
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	les	bx,DWORD PTR [bp-4]	;tempradar
	push	WORD PTR es:[bx+22]
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
	mov	WORD PTR [bp-16],ax	;x
; Line 441
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	ax,WORD PTR $S772_CRT_Y
	dec	ax
	dec	ax
	push	ax
	mov	ax,WORD PTR $S771_CRT_X
	sub	ax,WORD PTR [bp-16]	;x
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 442
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_show_plane	ENDP
; Line 447
	PUBLIC	_show_jamming
_show_jamming	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 450
	cmp	WORD PTR _JAMMER_ACTIVE,0
	je	$I942
	cmp	WORD PTR $S941_off,0
	jne	$I942
; Line 451
	mov	ax,OFFSET DGROUP:$SG943
	push	ax
	mov	ax,8
	push	ax
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 453
$I942:
; Line 454
	mov	ax,WORD PTR _FTicks
	add	WORD PTR $S940_ticks,ax
	cmp	WORD PTR $S940_ticks,20
	jle	$I944
; Line 455
	mov	WORD PTR $S940_ticks,0
; Line 456
	xor	BYTE PTR $S941_off,1
; Line 457
; Line 458
$I944:
	ret	

_show_jamming	ENDP
; Line 463
	PUBLIC	_convert_xy
_convert_xy	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	si
;	dx = -6
;	dy = -8
;	r = -4
;	a = -2
;	y = 6
;	x = 4
; Line 467
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR [bp+6]	;y
	mov	WORD PTR [bp-8],ax	;dy
; Line 468
	push	ax
	mov	ax,WORD PTR [bp+4]	;x
	sub	ax,WORD PTR _Px
	mov	WORD PTR [bp-6],ax	;dx
	push	ax
	call	_Dist2D
	add	sp,4
; Line 470
	mov	bx,WORD PTR $S773_TEWS_RNG
	shl	bx,1
	cmp	WORD PTR $S769_MAXBITS[bx],ax
	jge	$I952
; Line 471
	push	WORD PTR [bp-6]	;dx
	push	WORD PTR [bp-8]	;dy
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-2],ax	;a
; Line 472
	push	ax
	mov	bx,WORD PTR $S773_TEWS_RNG
	shl	bx,1
	push	WORD PTR $S770_OORBITS[bx]
	call	_ACosB
	add	sp,4
	mov	WORD PTR [bp-6],ax	;dx
; Line 473
	push	WORD PTR [bp-2]	;a
	mov	bx,WORD PTR $S773_TEWS_RNG
	shl	bx,1
	push	WORD PTR $S770_OORBITS[bx]
	call	_ASinB
	add	sp,4
	mov	WORD PTR [bp-8],ax	;dy
; Line 474
; Line 476
$I952:
	push	WORD PTR [bp-8]	;dy
	push	WORD PTR _OurHead
	call	_sinX
	add	sp,4
	push	WORD PTR [bp-6]	;dx
	push	WORD PTR _OurHead
	mov	si,ax
	call	_cosX
	add	sp,4
	sub	ax,si
	mov	WORD PTR $S771_CRT_X,ax
; Line 477
	push	WORD PTR [bp-6]	;dx
	push	WORD PTR _OurHead
	call	_sinX
	add	sp,4
	push	WORD PTR [bp-8]	;dy
	push	WORD PTR _OurHead
	mov	si,ax
	call	_cosX
	add	sp,4
	add	si,ax
	mov	WORD PTR $S772_CRT_Y,si
; Line 478
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	cx,ax
	mov	ax,WORD PTR $S771_CRT_X
	mov	si,WORD PTR $S773_TEWS_RNG
	shl	si,1
	cwd	
	idiv	WORD PTR $S767_BITPERPIX_X[si]
	add	cx,ax
	dec	cx
	mov	WORD PTR $S771_CRT_X,cx
; Line 479
	mov	ax,WORD PTR $S772_CRT_Y
	cwd	
	idiv	WORD PTR $S768_BITPERPIX_Y[si]
	mov	cx,ax
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,cx
	dec	ax
	mov	WORD PTR $S772_CRT_Y,ax
; Line 480
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_convert_xy	ENDP
_TEXT	ENDS
END
