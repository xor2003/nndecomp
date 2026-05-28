;	Static Name Aliases
;
;	$S836_HDGRpX	EQU	HDGRpX
;	$S838_PLRpX	EQU	PLRpX
;	$S840_RBRpX	EQU	RBRpX
;	$S844_VEL_VECT_Y	EQU	VEL_VECT_Y
;	$S871_scanx	EQU	scanx
;	$S872_scany	EQU	scany
;	$S873_dir	EQU	dir
;	$S874_dir2	EQU	dir2
;	$S902_t	EQU	t
;	$S943_hpts	EQU	hpts
;	$S955_hpts	EQU	hpts
;	$S956_hpts2	EQU	hpts2
;	$S957_hpts3	EQU	hpts3
;	$S958_hpts4	EQU	hpts4
;	$S991_hpts0	EQU	hpts0
;	$S992_hpts1	EQU	hpts1
;	$S1036_off	EQU	off
;	$S1053_mo	EQU	mo
;	$S1054_so	EQU	so
;	$S1146_off	EQU	off
;	$S1154_off	EQU	off
	TITLE   C:\HUD2.C
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
PUBLIC  _HDGRp
PUBLIC  _PLRp
PUBLIC  _RBRp
PUBLIC  _TDBRpX
PUBLIC  _TDBRp
PUBLIC  _TB_CTRX
PUBLIC  _TB_CTRY
EXTRN	_draw_circle:NEAR
EXTRN	_DrawLine:FAR
EXTRN	_DrawDot:FAR
EXTRN	_RpPrint:FAR
EXTRN	_rng:NEAR
EXTRN	_CheckMode:NEAR
EXTRN	_strcat:NEAR
EXTRN	_rotate_pt:NEAR
EXTRN	_ClipSprite:FAR
EXTRN	__aNchkstk:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_strlen:NEAR
EXTRN	_abs:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_itoa:NEAR
EXTRN	_pstrlen:NEAR
EXTRN	_Rounds:WORD
EXTRN	_AutoHead:WORD
EXTRN	_MODE_MASTER:WORD
EXTRN	_MODE_AA:WORD
EXTRN	_F14_STATION:BYTE
EXTRN	_ORDNANCE:BYTE
EXTRN	_RpX2:BYTE
EXTRN	_Rp2:WORD
EXTRN	_HudSprite1:WORD
EXTRN	_HudSprite3:WORD
EXTRN	_HudSprite4:WORD
EXTRN	_OurHead:WORD
EXTRN	_OurPitch:WORD
EXTRN	_OurRoll:WORD
EXTRN	_AWG9_MODE:WORD
EXTRN	_RANGES:BYTE
EXTRN	_BRANGES:BYTE
EXTRN	_PitchAngle:WORD
EXTRN	_RANGE:WORD
EXTRN	_DeClutter:WORD
EXTRN	_PDT_ALT_1000:WORD
EXTRN	_PDT_ALT_100:WORD
EXTRN	_PDT_RNG:WORD
EXTRN	_SHOOT:WORD
EXTRN	_ASE_RADIUS:WORD
EXTRN	_PW:WORD
EXTRN	_PDT_PROJ_X:WORD
EXTRN	_PDT_PROJ_Y:WORD
EXTRN	_sightX:WORD
EXTRN	_PDT_PROJ:WORD
EXTRN	_sightY:WORD
EXTRN	_STEER_DOT_X:WORD
EXTRN	_STEER_DOT_Y:WORD
EXTRN	_STEER_DOT:WORD
EXTRN	_MasterArmSW:WORD
EXTRN	_CLOSURE:WORD
EXTRN	_SelectedTarg:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Damaged:WORD
_DATA      SEGMENT
	ORG	$+92
$SG908	DB	'0',  00H
	ORG	$+154
$SG1060	DB	'SP',  00H
$SG1063	DB	'SW',  00H
$SG1065	DB	'PH',  00H
$SG1067	DB	'G',  00H
$SG1069	DB	'XXX',  00H
	ORG	$+5
$SG1121	DB	'10',  00H
$SG1122	DB	'0',  00H
$SG1123	DB	'-2',  00H
$SG1140	DB	'-',  00H
	ORG	$-278
_TB_CTRX	DW	09fH
_TB_CTRY	DW	033H
$S836_HDGRpX	DW	01H
	DW	07bH
	DW	0dH
	DW	04bH
	DW	0cH
	DW	00H
	DW	06H
	DW	00H
	DW	01H
_HDGRp	DW	DGROUP:$S836_HDGRpX
$S838_PLRpX	DW	01H
	DW	068H
	DW	017H
	DW	06fH
	DW	03eH
	DW	00H
	DW	06H
	DW	00H
	DW	01H
_PLRp	DW	DGROUP:$S838_PLRpX
$S840_RBRpX	DW	01H
	DW	0c8H
	DW	01eH
	DW	09H
	DW	02fH
	DW	00H
	DW	06H
	DW	00H
	DW	01H
_RBRp	DW	DGROUP:$S840_RBRpX
_TDBRpX	DW	01H
	DW	064H
	DW	0fH
	DW	076H
	DW	048H
	DW	00H
	DW	06H
	DW	00H
	DW	01H
_TDBRp	DW	DGROUP:_TDBRpX
$S871_scanx	DW	09fH
$S872_scany	DW	030H
$S873_dir	DW	01H
$S874_dir2	DW	01H
	ORG	$+2
$S943_hpts	DW	09H
	DW	00H
	DW	01eH
	DW	00H
	DW	026H
	DW	03H
	DW	0fff7H
	DW	00H
	DW	0ffe2H
	DW	00H
	DW	0ffdaH
	DW	03H
$S955_hpts	DW	0ffe5H
	DW	00H
	DW	01bH
	DW	00H
$S956_hpts2	DW	0ffe5H
	DW	00H
	DW	0fff8H
	DW	00H
	DW	0fffaH
	DW	00H
	DW	06H
	DW	00H
	DW	08H
	DW	00H
	DW	01bH
	DW	00H
$S957_hpts3	DW	0ffe5H
	DW	00H
	DW	0fffbH
	DW	00H
	DW	05H
	DW	00H
	DW	01bH
	DW	00H
	DW	0ffe5H
	DW	06H
	DW	01bH
	DW	06H
$S958_hpts4	DW	0ffe5H
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
	DW	01bH
	DW	00H
	DW	01bH
	DW	06H
	DW	0ffe5H
	DW	06H
$S991_hpts0	DW	00H
	DW	00H
	DW	0cH
	DW	00H
	DW	0cH
	DW	03H
	DW	014H
	DW	00H
$S992_hpts1	DW	00H
	DW	00H
	DW	0cH
	DW	00H
	DW	0cH
	DW	0fffdH
	DW	014H
	DW	00H
$S1036_off	DW	01H
	ORG	$+16
$S1053_mo	DB	00H
 	DB	1 DUP(0)

$S1054_so	DB	00H
 	DB	1 DUP(0)

	ORG	$+10
$S1146_off	DW	00H
$S1154_off	DW	00H
_DATA      ENDS
_BSS      SEGMENT
	ORG	$+2
$S902_t	DB 03H DUP (?)
	ORG	$-5
$S844_VEL_VECT_Y	DW 01H DUP (?)
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
; Line 24
; Line 25
; Line 144
	PUBLIC	_HUD
_HUD	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 145
	mov	WORD PTR _RpX2+12,6
; Line 146
	test	BYTE PTR _Damaged+1,1
	je	$I847
	sub	ax,ax
	ret	
; Line 147
	nop	
$I847:
	call	_HUD_standard
; Line 148
	call	_HUD_master
; Line 149
	ret	
	nop	

_HUD	ENDP
; Line 154
	PUBLIC	_HUD_master
_HUD_master	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
; Line 155
	mov	ax,WORD PTR _MODE_MASTER
	jmp	SHORT $S851
; Line 156
	nop	
$SC855:
; Line 157
	call	_HUD_nav
; Line 158
	mov	sp,bp
	pop	bp
	ret	
; Line 159
	nop	
$SC857:
; Line 160
	call	_HUD_aa
; Line 161
	mov	sp,bp
	pop	bp
	ret	
	nop	
$S851:
	or	ax,ax
	je	$SC855
	dec	ax
	je	$SC857
; Line 163
	mov	sp,bp
	pop	bp
	ret	
	nop	

_HUD_master	ENDP
; Line 167
	PUBLIC	_HUD_standard
_HUD_standard	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 168
	call	_waterline
; Line 169
	call	_vel_vector
; Line 170
	call	_pitch_ladder
; Line 171
	jmp	_hdg_scale
; Line 172
	nop	

_HUD_standard	ENDP
; Line 176
	PUBLIC	_waterline
_waterline	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 177
	cmp	WORD PTR _DeClutter,0
	je	$I865
	sub	ax,ax
	ret	
; Line 178
	nop	
$I865:
	mov	ax,6
	push	ax
	mov	cx,58
	push	cx
	mov	dx,156
	push	dx
	push	cx
	mov	bx,147
	push	bx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 179
	mov	ax,6
	push	ax
	mov	cx,60
	push	cx
	mov	dx,156
	push	dx
	mov	bx,58
	push	bx
	push	dx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 180
	mov	ax,6
	push	ax
	mov	cx,60
	push	cx
	mov	cx,162
	push	cx
	mov	dx,58
	push	dx
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 181
	mov	ax,6
	push	ax
	mov	cx,58
	push	cx
	mov	dx,171
	push	dx
	push	cx
	mov	cx,162
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 182
	mov	ax,6
	push	ax
	mov	cx,34
	push	cx
	mov	cx,159
	push	cx
	mov	dx,28
	push	dx
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 183
	mov	ax,6
	push	ax
	mov	ax,31
	push	ax
	mov	cx,162
	push	cx
	push	ax
	mov	ax,156
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 184
	ret	
	nop	

_waterline	ENDP
; Line 188
	PUBLIC	_vel_vector
_vel_vector	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 189
	cmp	WORD PTR _MODE_MASTER,0
	jne	$I867
; Line 190
	mov	cl,6
	mov	ax,WORD PTR _PitchAngle
	sar	ax,cl
	add	ax,35
	mov	WORD PTR $S844_VEL_VECT_Y,ax
; Line 191
	cmp	WORD PTR _DeClutter,0
	je	$I868
	sub	ax,ax
	ret	
; Line 192
	nop	
$I868:
	push	WORD PTR _HudSprite1
	sub	ax,4
	push	ax
	mov	ax,51
	push	ax
	push	WORD PTR _PLRp
	call	FAR PTR _ClipSprite
	add	sp,8
; Line 193
; Line 194
$I867:
	ret	
	nop	

_vel_vector	ENDP
; Line 199
	PUBLIC	_VSLScan
_VSLScan	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 205
	cmp	WORD PTR $S873_dir,0
	je	$I875
; Line 206
	add	WORD PTR $S872_scany,10
; Line 207
	cmp	WORD PTR $S874_dir2,0
	je	$L20013
; Line 208
$L20012:
	add	WORD PTR $S871_scanx,2
; Line 209
	jmp	SHORT $I880
	nop	
$I875:
; Line 212
	sub	WORD PTR $S872_scany,10
; Line 213
	cmp	WORD PTR $S874_dir2,0
	jne	$L20012
; Line 216
$L20013:
	sub	WORD PTR $S871_scanx,2
$I880:
; Line 217
; Line 219
	cmp	WORD PTR $S873_dir,0
	je	$I881
	cmp	WORD PTR $S872_scany,48
	jle	$I881
; Line 220
	mov	WORD PTR $S874_dir2,0
; Line 222
$I881:
	cmp	WORD PTR $S873_dir,0
	jne	$I882
	cmp	WORD PTR $S872_scany,48
	jge	$I882
; Line 223
	mov	WORD PTR $S874_dir2,1
; Line 225
$I882:
	cmp	WORD PTR $S872_scany,73
	jle	$I883
; Line 226
	mov	WORD PTR $S873_dir,0
; Line 227
	mov	WORD PTR $S871_scanx,159
; Line 228
; Line 230
$I883:
	cmp	WORD PTR $S872_scany,23
	jge	$I884
; Line 231
	mov	WORD PTR $S873_dir,1
; Line 232
	mov	WORD PTR $S871_scanx,159
; Line 233
; Line 235
$I884:
	push	WORD PTR $S872_scany
	push	WORD PTR $S871_scanx
	push	WORD PTR _Rp2
	call	_diamondbox
	add	sp,6
; Line 236
	ret	

_VSLScan	ENDP
; Line 240
	PUBLIC	_hdg_scale
_hdg_scale	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
;	deg10 = -4
;	off = -18
;	i = -16
;	x = -14
;	deg = -2
;	deg2 = -6
;	ang = -12
;	s = -10
; Line 249
	mov	ax,WORD PTR _OurHead
	mov	cx,91
	sub	dx,dx
	div	cx
	mov	WORD PTR [bp-2],ax	;deg
	mov	cx,20
	sub	dx,dx
	div	cx
	mov	WORD PTR [bp-18],dx	;off
; Line 250
	mov	ax,WORD PTR [bp-2]	;deg
	sub	dx,dx
	div	cx
	dec	ax
	mov	WORD PTR [bp-4],ax	;deg10
; Line 254
	mov	ax,6
	push	ax
	mov	ax,1
	push	ax
	mov	cx,75
	push	cx
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR _HDGRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 256
	mov	ax,-2
	sub	ax,WORD PTR [bp-18]	;off
	mov	WORD PTR [bp-14],ax	;x
	mov	WORD PTR [bp-16],0	;i
	jmp	SHORT $F895
	nop	
$L20001:
	mov	ax,WORD PTR [bp-14]	;x
	sub	ax,4
$L20002:
	push	ax
	push	WORD PTR _HDGRp
	call	FAR PTR _RpPrint
	add	sp,8
; Line 261
	mov	WORD PTR [bp-16],0	;i
; Line 262
; Line 263
$FC896:
	add	WORD PTR [bp-14],4	;x
	add	WORD PTR [bp-16],4	;i
$F895:
	cmp	WORD PTR [bp-14],76	;x
	jge	$FB897
; Line 257
	mov	ax,6
	push	ax
	mov	cx,2
	push	cx
	push	WORD PTR [bp-14]	;x
	push	WORD PTR _HDGRp
	call	FAR PTR _DrawDot
	add	sp,8
; Line 258
	cmp	WORD PTR [bp-16],20	;i
	jne	$FC896
; Line 259
	mov	ax,6
	push	ax
	mov	ax,3
	push	ax
	push	WORD PTR [bp-14]	;x
	push	WORD PTR _HDGRp
	call	FAR PTR _DrawDot
	add	sp,8
; Line 260
	mov	ax,WORD PTR [bp-4]	;deg10
	inc	WORD PTR [bp-4]	;deg10
	push	ax
	call	deg_prt
	add	sp,2
	push	ax
	mov	ax,4
	push	ax
	cmp	WORD PTR [bp-14],0	;x
	je	$L20001
	mov	ax,WORD PTR [bp-14]	;x
	sub	ax,3
	jmp	SHORT $L20002
$FB897:
; Line 264
	call	_hdg_indicator
; Line 265
	mov	sp,bp
	pop	bp
	ret	
	nop	

_hdg_scale	ENDP
; Line 270
deg_prt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	s = -4
;	deg = 4
; Line 274
	cmp	WORD PTR [bp+4],0	;deg
	jg	$I904
	add	WORD PTR [bp+4],36	;deg
; Line 275
	jmp	SHORT $I906
	nop	
$I904:
; Line 276
	cmp	WORD PTR [bp+4],36	;deg
	jle	$I906
	sub	WORD PTR [bp+4],36	;deg
; Line 278
$I906:
	mov	BYTE PTR $S902_t,0
; Line 280
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-4]	;s
	push	ax
	push	WORD PTR [bp+4]	;deg
	call	_itoa
	add	sp,6
	push	ax
	call	_strlen
	add	sp,2
	dec	ax
	jne	$I907
; Line 281
	mov	ax,OFFSET DGROUP:$SG908
	push	ax
	mov	ax,OFFSET DGROUP:$S902_t
	push	ax
	call	_strcat
	add	sp,4
; Line 282
$I907:
	lea	ax,WORD PTR [bp-4]	;s
	push	ax
	mov	ax,OFFSET DGROUP:$S902_t
	push	ax
	call	_strcat
; Line 283
	mov	ax,OFFSET DGROUP:$S902_t
; Line 284
	mov	sp,bp
	pop	bp
	ret	

deg_prt	ENDP
; Line 288
	PUBLIC	_hdg_indicator
_hdg_indicator	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	ang = -2
; Line 291
	mov	ax,199
	push	ax
	mov	ax,123
	push	ax
	mov	ax,WORD PTR _AutoHead
	sub	ax,WORD PTR _OurHead
	mov	cx,182
	cwd	
	idiv	cx
	add	ax,80
	shl	ax,1
	push	ax
	call	_rng
	add	sp,6
	mov	WORD PTR [bp-2],ax	;ang
; Line 293
	mov	ax,6
	push	ax
	mov	cx,28
	push	cx
	mov	dx,WORD PTR [bp-2]	;ang
	dec	dx
	dec	dx
	push	dx
	mov	dx,26
	push	dx
	push	WORD PTR [bp-2]	;ang
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 294
	mov	ax,6
	push	ax
	mov	ax,28
	push	ax
	mov	ax,WORD PTR [bp-2]	;ang
	inc	ax
	inc	ax
	push	ax
	mov	ax,26
	push	ax
	push	WORD PTR [bp-2]	;ang
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
; Line 295
	mov	sp,bp
	pop	bp
	ret	

_hdg_indicator	ENDP
; Line 300
	PUBLIC	_pitch_ladder
_pitch_ladder	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,30
	call	__aNchkstk
	push	si
;	i = -20
;	base_deg = -22
;	deg = -2
;	off = -24
;	dx = -26
;	dy = -28
;	pts = -18
; Line 304
	cmp	WORD PTR _DeClutter,0
	je	$I920
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 308
$I920:
; Line 310
	mov	WORD PTR [bp-16],20
; Line 311
	mov	cx,20
	mov	dx,910
	mov	ax,WORD PTR _OurPitch
	mov	bx,dx
	cwd	
	idiv	bx
	mov	ax,dx
	imul	cx
	cwd	
	idiv	bx
	mov	WORD PTR [bp-12],ax
; Line 313
	sub	ax,ax
	mov	WORD PTR [bp-14],ax
	mov	WORD PTR [bp-18],ax	;pts
	mov	WORD PTR [bp-20],ax	;i
	jmp	SHORT $F921
$FC922:
; Line 314
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
$F921:
	cmp	WORD PTR [bp-20],2	;i
	jl	$FC922
; Line 318
	mov	ax,WORD PTR _OurPitch
	mov	cx,910
	cwd	
	idiv	cx
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	mov	WORD PTR [bp-22],ax	;base_deg
; Line 320
	mov	WORD PTR [bp-20],-2	;i
	jmp	SHORT $F925
; Line 326
	nop	
$SC932:
; Line 327
	push	WORD PTR [bp-28]	;dy
	push	WORD PTR [bp-26]	;dx
	push	WORD PTR [bp-2]	;deg
	call	_horiz_line
$L20015:
	add	sp,6
; Line 337
$FC926:
	inc	WORD PTR [bp-20]	;i
$F925:
	cmp	WORD PTR [bp-20],2	;i
	jle	$JCC1066
	jmp	$FB927
$JCC1066:
; Line 321
	mov	ax,WORD PTR [bp-10]
	imul	WORD PTR [bp-20]	;i
	sub	ax,WORD PTR [bp-6]
	neg	ax
	add	ax,56
	mov	WORD PTR [bp-26],ax	;dx
; Line 322
	mov	ax,WORD PTR [bp-8]
	imul	WORD PTR [bp-20]	;i
	sub	ax,WORD PTR [bp-4]
	neg	ax
	add	ax,35
	mov	WORD PTR [bp-28],ax	;dy
; Line 323
	mov	ax,WORD PTR [bp-20]	;i
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	add	ax,WORD PTR [bp-22]	;base_deg
	mov	WORD PTR [bp-2],ax	;deg
; Line 325
	sub	ax,-90
	je	$SC934
	sub	ax,90
	je	$SC932
	sub	ax,90
	je	$SC934
; Line 334
	push	WORD PTR [bp-28]	;dy
	push	WORD PTR [bp-26]	;dx
	push	WORD PTR [bp-2]	;deg
	call	_HUDPitchLine
	jmp	SHORT $L20015
; Line 329
	nop	
	nop	
	nop	
$SC934:
; Line 331
	cmp	WORD PTR [bp-2],0	;deg
	jl	$L20003
	mov	ax,WORD PTR _HudSprite4
	jmp	SHORT $L20004
	nop	
$L20003:
	mov	ax,WORD PTR _HudSprite3
$L20004:
	push	ax
	mov	ax,WORD PTR [bp-28]	;dy
	sub	ax,4
	push	ax
	mov	ax,WORD PTR [bp-26]	;dx
	sub	ax,4
	push	ax
	push	WORD PTR _PLRp
	call	FAR PTR _ClipSprite
	add	sp,8
; Line 332
	jmp	$FC926
; Line 333
	nop	
$FB927:
; Line 339
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_pitch_ladder	ENDP
; Line 343
	PUBLIC	_horiz_line
_horiz_line	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,26
	call	__aNchkstk
	push	si
;	i = -26
;	pts = -24
;	yc = 8
;	xc = 6
;	deg = 4
; Line 351
	mov	WORD PTR [bp-26],0	;i
$FC945:
; Line 352
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-26]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-24][si]
	push	ax
	add	si,OFFSET DGROUP:$S943_hpts
	push	si
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-26]	;i
	cmp	WORD PTR [bp-26],6	;i
	jl	$FC945
; Line 356
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp-18]
	add	cx,WORD PTR [bp+8]	;yc
	push	cx
	mov	cx,WORD PTR [bp+6]	;xc
	add	cx,WORD PTR [bp-20]
	push	cx
	mov	cx,WORD PTR [bp-22]
	add	cx,WORD PTR [bp+8]	;yc
	push	cx
	mov	cx,WORD PTR [bp+6]	;xc
	add	cx,WORD PTR [bp-24]	;pts
	push	cx
	push	WORD PTR _PLRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 357
	mov	ax,6
	push	ax
	mov	ax,WORD PTR [bp-6]
	add	ax,WORD PTR [bp+8]	;yc
	push	ax
	mov	ax,WORD PTR [bp+6]	;xc
	add	ax,WORD PTR [bp-8]
	push	ax
	mov	ax,WORD PTR [bp-10]
	add	ax,WORD PTR [bp+8]	;yc
	push	ax
	mov	ax,WORD PTR [bp+6]	;xc
	add	ax,WORD PTR [bp-12]
	push	ax
	push	WORD PTR _PLRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 358
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_horiz_line	ENDP
; Line 362
	PUBLIC	_HUDPitchLine
_HUDPitchLine	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,54
	call	__aNchkstk
	push	si
;	i = -52
;	l = -54
;	pts = -50
;	s = -10
;	yc = 8
;	xc = 6
;	deg = 4
; Line 372
	mov	ax,10
	push	ax
	lea	cx,WORD PTR [bp-10]	;s
	push	cx
	push	WORD PTR [bp+4]	;deg
	call	_itoa
	add	sp,6
	push	ax
	push	WORD PTR _PLRp
	call	_pstrlen
	add	sp,4
	dec	ax
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR [bp-54],ax	;l
; Line 375
	cmp	WORD PTR [bp+4],0	;deg
	jg	$JCC1401
	jmp	$I966
$JCC1401:
; Line 376
	mov	ax,WORD PTR [bp+4]	;deg
	mov	cx,10
	cwd	
	idiv	cx
	or	dx,dx
	jne	$I961
; Line 377
	mov	WORD PTR [bp-52],dx	;i
$FC963:
; Line 378
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-52]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-50][si]
	push	ax
	add	si,OFFSET DGROUP:$S957_hpts3
	push	si
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-52]	;i
	cmp	WORD PTR [bp-52],7	;i
	jl	$FC963
	jmp	SHORT $L20021
	nop	
$I961:
; Line 385
	cmp	WORD PTR _MODE_MASTER,0
	je	$JCC1465
	jmp	$I966
$JCC1465:
; Line 386
	mov	WORD PTR [bp-52],0	;i
$FC968:
; Line 387
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-52]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-50][si]
	push	ax
	add	si,OFFSET DGROUP:$S957_hpts3
	push	si
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-52]	;i
	cmp	WORD PTR [bp-52],7	;i
	jl	$FC968
; Line 388
$L20021:
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp-44]
	add	cx,WORD PTR [bp+8]	;yc
	push	cx
	mov	cx,WORD PTR [bp-46]
	add	cx,WORD PTR [bp+6]	;xc
	push	cx
	mov	cx,WORD PTR [bp-48]
	add	cx,WORD PTR [bp+8]	;yc
	push	cx
	mov	cx,WORD PTR [bp-50]	;pts
	add	cx,WORD PTR [bp+6]	;xc
	push	cx
	push	WORD PTR _PLRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 389
	mov	ax,6
	push	ax
	mov	ax,WORD PTR [bp-36]
	add	ax,WORD PTR [bp+8]	;yc
	push	ax
	mov	ax,WORD PTR [bp-38]
	add	ax,WORD PTR [bp+6]	;xc
	push	ax
	mov	ax,WORD PTR [bp-40]
	add	ax,WORD PTR [bp+8]	;yc
	push	ax
	mov	ax,WORD PTR [bp-42]
	add	ax,WORD PTR [bp+6]	;xc
	push	ax
	push	WORD PTR _PLRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 390
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	cx,WORD PTR [bp-32]
	add	cx,WORD PTR [bp+8]	;yc
	sub	cx,3
	push	cx
	mov	cx,WORD PTR [bp-34]
	sub	cx,WORD PTR [bp-54]	;l
	add	cx,WORD PTR [bp+6]	;xc
	push	cx
	push	WORD PTR _PLRp
	call	FAR PTR _RpPrint
	add	sp,8
; Line 391
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	ax,WORD PTR [bp-28]
	add	ax,WORD PTR [bp+8]	;yc
	sub	ax,3
	push	ax
	mov	ax,WORD PTR [bp-30]
	sub	ax,WORD PTR [bp-54]	;l
	add	ax,WORD PTR [bp+6]	;xc
	push	ax
	push	WORD PTR _PLRp
	call	FAR PTR _RpPrint
	add	sp,8
; Line 392
; Line 393
$I966:
; Line 394
; Line 396
	cmp	WORD PTR [bp+4],0	;deg
	jl	$JCC1674
	jmp	$I976
$JCC1674:
; Line 397
	mov	ax,WORD PTR [bp+4]	;deg
	mov	cx,10
	cwd	
	idiv	cx
	or	dx,dx
	jne	$I971
; Line 398
	mov	WORD PTR [bp-52],dx	;i
$FC973:
; Line 399
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-52]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-50][si]
	push	ax
	add	si,OFFSET DGROUP:$S958_hpts4
	push	si
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-52]	;i
	cmp	WORD PTR [bp-52],10	;i
	jl	$FC973
	jmp	SHORT $L20022
$I971:
; Line 408
	cmp	WORD PTR _MODE_MASTER,0
	je	$JCC1737
	jmp	$I976
$JCC1737:
; Line 409
	mov	WORD PTR [bp-52],0	;i
$FC978:
; Line 410
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-52]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-50][si]
	push	ax
	add	si,OFFSET DGROUP:$S958_hpts4
	push	si
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-52]	;i
	cmp	WORD PTR [bp-52],10	;i
	jl	$FC978
; Line 411
$L20022:
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp-44]
	add	cx,WORD PTR [bp+8]	;yc
	push	cx
	mov	cx,WORD PTR [bp-46]
	add	cx,WORD PTR [bp+6]	;xc
	push	cx
	mov	cx,WORD PTR [bp-48]
	add	cx,WORD PTR [bp+8]	;yc
	push	cx
	mov	cx,WORD PTR [bp-50]	;pts
	add	cx,WORD PTR [bp+6]	;xc
	push	cx
	push	WORD PTR _PLRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 412
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp-36]
	add	cx,WORD PTR [bp+8]	;yc
	push	cx
	mov	cx,WORD PTR [bp-38]
	add	cx,WORD PTR [bp+6]	;xc
	push	cx
	mov	cx,WORD PTR [bp-40]
	add	cx,WORD PTR [bp+8]	;yc
	push	cx
	mov	cx,WORD PTR [bp-42]
	add	cx,WORD PTR [bp+6]	;xc
	push	cx
	push	WORD PTR _PLRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 413
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp-28]
	add	cx,WORD PTR [bp+8]	;yc
	push	cx
	mov	cx,WORD PTR [bp-30]
	add	cx,WORD PTR [bp+6]	;xc
	push	cx
	mov	cx,WORD PTR [bp-32]
	add	cx,WORD PTR [bp+8]	;yc
	push	cx
	mov	cx,WORD PTR [bp-34]
	add	cx,WORD PTR [bp+6]	;xc
	push	cx
	push	WORD PTR _PLRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 414
	mov	ax,6
	push	ax
	mov	ax,WORD PTR [bp-20]
	add	ax,WORD PTR [bp+8]	;yc
	push	ax
	mov	ax,WORD PTR [bp-22]
	add	ax,WORD PTR [bp+6]	;xc
	push	ax
	mov	ax,WORD PTR [bp-24]
	add	ax,WORD PTR [bp+8]	;yc
	push	ax
	mov	ax,WORD PTR [bp-26]
	add	ax,WORD PTR [bp+6]	;xc
	push	ax
	push	WORD PTR _PLRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 415
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	cx,WORD PTR [bp-16]
	add	cx,WORD PTR [bp+8]	;yc
	sub	cx,3
	push	cx
	mov	cx,WORD PTR [bp-18]
	sub	cx,WORD PTR [bp-54]	;l
	add	cx,WORD PTR [bp+6]	;xc
	push	cx
	push	WORD PTR _PLRp
	call	FAR PTR _RpPrint
	add	sp,8
; Line 416
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	ax,WORD PTR [bp-12]
	add	ax,WORD PTR [bp+8]	;yc
	sub	ax,3
	push	ax
	mov	ax,WORD PTR [bp-14]
	sub	ax,WORD PTR [bp-54]	;l
	add	ax,WORD PTR [bp+6]	;xc
	push	ax
	push	WORD PTR _PLRp
	call	FAR PTR _RpPrint
	add	sp,8
; Line 417
; Line 418
$I976:
; Line 419
; Line 420
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_HUDPitchLine	ENDP
; Line 424
	PUBLIC	_pitch_line
_pitch_line	PROC NEAR
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
; Line 433
	mov	ax,WORD PTR [bp+4]	;deg
	mov	WORD PTR [bp-12],ax	;d
	cmp	ax,90
	jle	$I993
	sub	ax,180
	mov	WORD PTR [bp+4],ax	;deg
; Line 434
$I993:
	cmp	ax,-90
	jge	$I994
	add	WORD PTR [bp+4],180	;deg
; Line 438
$I994:
	mov	WORD PTR [bp-110],0	;i
	jmp	SHORT $F995
	nop	
$L20005:
	mov	ax,WORD PTR [bp-110]	;i
	shl	ax,1
	shl	ax,1
	add	ax,OFFSET DGROUP:$S992_hpts1
$L20006:
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
; Line 441
	add	WORD PTR [di],5
	mov	ax,WORD PTR [di]
	neg	ax
	mov	WORD PTR [bp-36][si],ax
; Line 442
	mov	ax,WORD PTR [bp-58][si]
	mov	WORD PTR [bp-34][si],ax
; Line 443
	inc	WORD PTR [bp-110]	;i
$F995:
	cmp	WORD PTR [bp-110],4	;i
	jge	$FB997
; Line 439
	cmp	WORD PTR [bp+4],0	;deg
	jl	$L20005
	mov	ax,WORD PTR [bp-110]	;i
	shl	ax,1
	shl	ax,1
	add	ax,OFFSET DGROUP:$S991_hpts0
	jmp	SHORT $L20006
	nop	
$FB997:
; Line 445
	mov	WORD PTR [bp-110],0	;i
$FC999:
; Line 446
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
	jl	$FC999
; Line 450
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
	push	WORD PTR _Rp2
	call	_pstrlen
	add	sp,4
	dec	ax
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR [bp-112],ax	;l
; Line 452
	mov	WORD PTR [bp-110],0	;i
	jmp	$F1001
	nop	
$I1004:
; Line 458
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
	push	WORD PTR _PLRp
	call	_dashline
	add	sp,14
$I1005:
; Line 460
	mov	ax,6
	push	ax
	mov	si,WORD PTR [bp-110]	;i
	mov	cx,si
	shl	si,1
	add	si,cx
	shl	si,1
	mov	cx,WORD PTR [bp-94][si]
	add	cx,WORD PTR [bp+8]	;yc
	push	cx
	mov	cx,WORD PTR [bp-96][si]
	add	cx,WORD PTR [bp+6]	;xc
	push	cx
	mov	cx,WORD PTR [bp-100][si]
	add	cx,WORD PTR [bp+8]	;yc
	push	cx
	mov	cx,WORD PTR [bp-102][si]
	add	cx,WORD PTR [bp+6]	;xc
	push	cx
	push	WORD PTR _PLRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 461
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	ax,WORD PTR [bp-88][si]
	add	ax,WORD PTR [bp+8]	;yc
	sub	ax,3
	push	ax
	mov	ax,WORD PTR [bp-90][si]
	sub	ax,WORD PTR [bp-112]	;l
	add	ax,WORD PTR [bp+6]	;xc
	push	ax
	push	WORD PTR _PLRp
	call	FAR PTR _RpPrint
	add	sp,8
; Line 462
	add	WORD PTR [bp-110],4	;i
$F1001:
	cmp	WORD PTR [bp-110],8	;i
	jge	$FB1003
; Line 453
	cmp	WORD PTR [bp-12],0	;d
	jg	$JCC2430
	jmp	$I1004
$JCC2430:
; Line 455
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
	push	WORD PTR _PLRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 456
	jmp	$I1005
	nop	
$FB1003:
; Line 463
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_pitch_line	ENDP
; Line 467
	PUBLIC	_dashline
_dashline	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__aNchkstk
;	y = -16
;	t = -8
;	dx = -18
;	dy = -20
;	xi = -2
;	yi = -4
;	d = -10
;	n = -22
;	c = -6
;	f = -12
;	x = -14
;	pix = 16
;	clr = 14
;	y1 = 12
;	x1 = 10
;	y0 = 8
;	x0 = 6
;	rp = 4
; Line 471
	mov	ax,WORD PTR [bp+6]	;x0
	cmp	WORD PTR [bp+10],ax	;x1
	jge	$I1026
; Line 472
	mov	WORD PTR [bp-22],ax	;n
; Line 473
	mov	ax,WORD PTR [bp+10]	;x1
	mov	WORD PTR [bp+6],ax	;x0
; Line 474
	mov	ax,WORD PTR [bp-22]	;n
	mov	WORD PTR [bp+10],ax	;x1
; Line 475
	mov	ax,WORD PTR [bp+8]	;y0
	mov	WORD PTR [bp-22],ax	;n
; Line 476
	mov	ax,WORD PTR [bp+12]	;y1
	mov	WORD PTR [bp+8],ax	;y0
; Line 477
	mov	ax,WORD PTR [bp-22]	;n
	mov	WORD PTR [bp+12],ax	;y1
; Line 478
; Line 480
$I1026:
	mov	WORD PTR [bp-2],1	;xi
; Line 481
	mov	ax,WORD PTR [bp+8]	;y0
	cmp	WORD PTR [bp+12],ax	;y1
	jl	$L20007
	mov	ax,1
	jmp	SHORT $L20008
$L20007:
	mov	ax,-1
$L20008:
	mov	WORD PTR [bp-4],ax	;yi
; Line 482
	mov	ax,WORD PTR [bp+10]	;x1
	sub	ax,WORD PTR [bp+6]	;x0
	mov	WORD PTR [bp-18],ax	;dx
; Line 484
	lea	ax,WORD PTR [bp+6]	;x0
	mov	WORD PTR [bp-14],ax	;x
; Line 485
	lea	cx,WORD PTR [bp+8]	;y0
	mov	WORD PTR [bp-16],cx	;y
; Line 487
	mov	dx,WORD PTR [bp+12]	;y1
	sub	dx,WORD PTR [bp+8]	;y0
	push	dx
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-20],ax	;dy
	cmp	ax,WORD PTR [bp-18]	;dx
	jle	$I1027
; Line 488
	mov	cx,WORD PTR [bp-18]	;dx
; Line 489
	mov	WORD PTR [bp-18],ax	;dx
; Line 490
	mov	ax,cx
	mov	WORD PTR [bp-20],ax	;dy
; Line 492
	mov	ax,WORD PTR [bp-4]	;yi
	mov	WORD PTR [bp-2],ax	;xi
; Line 493
	mov	ax,1
	mov	WORD PTR [bp-22],ax	;n
	mov	WORD PTR [bp-4],ax	;yi
; Line 495
	lea	ax,WORD PTR [bp+8]	;y0
	mov	WORD PTR [bp-14],ax	;x
; Line 496
	lea	ax,WORD PTR [bp+6]	;x0
	mov	WORD PTR [bp-16],ax	;y
; Line 497
; Line 499
$I1027:
	mov	WORD PTR [bp-12],1	;f
; Line 500
	mov	ax,WORD PTR [bp+16]	;pix
	mov	WORD PTR [bp-6],ax	;c
; Line 501
	mov	ax,WORD PTR [bp-18]	;dx
	mov	WORD PTR [bp-22],ax	;n
; Line 502
	sub	ax,-1
	neg	ax
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR [bp-10],ax	;d
; Line 504
	jmp	SHORT $L20024
$FC1029:
; Line 505
	cmp	WORD PTR [bp-12],0	;f
	je	$I1031
	push	WORD PTR [bp+14]	;clr
	push	WORD PTR [bp+8]	;y0
	push	WORD PTR [bp+6]	;x0
	push	WORD PTR [bp+4]	;rp
	call	FAR PTR _DrawDot
	add	sp,8
; Line 506
$I1031:
	dec	WORD PTR [bp-6]	;c
	jne	$I1032
; Line 507
	xor	BYTE PTR [bp-12],1	;f
; Line 508
	mov	ax,WORD PTR [bp+16]	;pix
	mov	WORD PTR [bp-6],ax	;c
; Line 509
; Line 510
$I1032:
	mov	ax,WORD PTR [bp-2]	;xi
	mov	bx,WORD PTR [bp-14]	;x
	add	WORD PTR [bx],ax
; Line 513
	mov	ax,WORD PTR [bp-20]	;dy
	add	WORD PTR [bp-10],ax	;d
	cmp	WORD PTR [bp-10],0	;d
	jle	$L20024
; Line 514
	mov	ax,WORD PTR [bp-10]	;d
	sub	ax,WORD PTR [bp-18]	;dx
	mov	WORD PTR [bp-10],ax	;d
; Line 515
	mov	ax,WORD PTR [bp-4]	;yi
	mov	bx,WORD PTR [bp-16]	;y
	add	WORD PTR [bx],ax
; Line 516
; Line 517
$L20024:
	mov	ax,WORD PTR [bp-22]	;n
	dec	WORD PTR [bp-22]	;n
	or	ax,ax
	jne	$FC1029
; Line 518
	mov	sp,bp
	pop	bp
	ret	

_dashline	ENDP
; Line 527
	PUBLIC	_HUD_nav
_HUD_nav	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 528
	ret	

_HUD_nav	ENDP
; Line 536
	PUBLIC	_HUD_aa
_HUD_aa	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 539
	call	_missile_cnt
; Line 540
	call	_bst_circle
; Line 541
	cmp	WORD PTR _AWG9_MODE,150
	jne	$I1039
; Line 542
	call	_VSLScan
; Line 544
$I1039:
	cmp	WORD PTR _SHOOT,0
	je	$I1040
; Line 545
	xor	BYTE PTR $S1036_off,1
; Line 546
	jmp	SHORT $I1041
$I1040:
; Line 547
	mov	WORD PTR $S1036_off,1
$I1041:
; Line 549
	cmp	WORD PTR $S1036_off,0
	je	$I1042
; Line 550
	call	_range_bar
; Line 551
	call	_PDT_range
; Line 552
	call	_PDT_closure
; Line 553
	call	_TD_box
; Line 554
; Line 556
$I1042:
	call	_gun_reticle
; Line 557
	jmp	_break_x
; Line 558
	nop	

_HUD_aa	ENDP
; Line 565
	PUBLIC	_missile_cnt
_missile_cnt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
	push	si
;	t = -16
;	s = -6
;	l = -22
; Line 569
	mov	bx,WORD PTR _Rp2
	mov	WORD PTR [bx+16],2
; Line 572
	mov	ax,WORD PTR _MODE_AA
	jmp	SHORT $S1055
; Line 573
$SC1059:
; Line 574
	mov	ax,OFFSET DGROUP:$SG1060
$L20025:
	push	ax
	lea	ax,WORD PTR [bp-22]	;l
	push	ax
	call	_strcpy
	add	sp,4
; Line 575
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-6]	;s
	push	ax
	call	_get_count
	push	ax
	jmp	SHORT $L20027
; Line 578
$SC1062:
; Line 579
	mov	ax,OFFSET DGROUP:$SG1063
	jmp	SHORT $L20025
; Line 583
	nop	
$SC1064:
; Line 584
	mov	ax,OFFSET DGROUP:$SG1065
	jmp	SHORT $L20025
; Line 588
	nop	
$SC1066:
; Line 589
	mov	ax,OFFSET DGROUP:$SG1067
	push	ax
	lea	ax,WORD PTR [bp-22]	;l
	push	ax
	call	_strcpy
	add	sp,4
; Line 590
	cmp	WORD PTR _Rounds,0
	jne	$I1068
; Line 591
	mov	ax,OFFSET DGROUP:$SG1069
$L20026:
	push	ax
	lea	ax,WORD PTR [bp-16]	;t
	push	ax
	call	_strcpy
	add	sp,4
; Line 592
	jmp	SHORT $SB1056
	nop	
$I1068:
; Line 593
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-6]	;s
	push	ax
	push	WORD PTR _Rounds
$L20027:
	call	_itoa
	add	sp,6
	jmp	SHORT $L20026
$S1055:
	or	ax,ax
	je	$SC1059
	dec	ax
	je	$SC1062
	dec	ax
	je	$SC1066
	dec	ax
	dec	ax
	je	$SC1064
$SB1056:
; Line 597
	lea	ax,WORD PTR [bp-22]	;l
	push	ax
	mov	cx,78
	push	cx
	push	ax
	push	WORD PTR _Rp2
	call	_pstrlen
	add	sp,4
	sub	ax,165
	neg	ax
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RpPrint
	add	sp,8
; Line 598
	lea	ax,WORD PTR [bp-16]	;t
	push	ax
	mov	cx,86
	push	cx
	push	ax
	push	WORD PTR _Rp2
	call	_pstrlen
	add	sp,4
	sub	ax,164
	neg	ax
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RpPrint
	add	sp,8
; Line 599
	cmp	WORD PTR _MasterArmSW,0
	jne	$I1071
; Line 600
	mov	ax,6
	push	ax
	mov	cx,87
	push	cx
	mov	dx,168
	push	dx
	mov	bx,78
	push	bx
	mov	si,152
	push	si
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 601
	mov	ax,6
	push	ax
	mov	ax,87
	push	ax
	push	si
	mov	ax,78
	push	ax
	mov	ax,168
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 602
; Line 603
$I1071:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_missile_cnt	ENDP
; Line 607
	PUBLIC	_get_count
_get_count	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	cnt = -2
;	i = -4
; Line 610
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;cnt
	mov	WORD PTR [bp-4],ax	;i
	jmp	SHORT $F1075
; Line 612
	nop	
$SC1082:
; Line 613
	cmp	WORD PTR _MODE_AA,1
$L20028:
	jne	$FC1076
	inc	WORD PTR [bp-2]	;cnt
; Line 614
$FC1076:
	inc	WORD PTR [bp-4]	;i
$F1075:
	cmp	WORD PTR [bp-4],12	;i
	jge	$FB1077
; Line 611
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	mov	ax,WORD PTR _F14_STATION[bx]
	sub	ax,15
	je	$SC1084
	sub	ax,3
	je	$SC1082
	dec	ax
	jl	$FC1076
	dec	ax
	jle	$SC1086
	jmp	SHORT $FC1076
; Line 615
$SC1084:
; Line 616
	cmp	WORD PTR _MODE_AA,4
	jmp	SHORT $L20028
; Line 618
	nop	
$SC1086:
; Line 620
	cmp	WORD PTR _MODE_AA,0
	jmp	SHORT $L20028
	nop	
$FB1077:
; Line 623
	mov	ax,WORD PTR [bp-2]	;cnt
; Line 624
	mov	sp,bp
	pop	bp
	ret	
	nop	

_get_count	ENDP
; Line 628
	PUBLIC	_ase_circle
_ase_circle	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	d = -2
; Line 629
	mov	WORD PTR [bp-2],0	;d
; Line 631
	cmp	WORD PTR _ASE_RADIUS,0
	jg	$I1091
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 632
	nop	
$I1091:
	cmp	WORD PTR _PW,19
	jne	$I1092
	cmp	WORD PTR _ASE_RADIUS,25
	jl	$L20009
	mov	ax,3
	jmp	SHORT $L20010
	nop	
$L20009:
	mov	ax,2
$L20010:
	mov	WORD PTR [bp-2],ax	;d
; Line 633
$I1092:
	push	WORD PTR [bp-2]	;d
	mov	ax,6
	push	ax
	push	WORD PTR _ASE_RADIUS
	mov	ax,53
	push	ax
	mov	ax,159
	push	ax
	push	WORD PTR _Rp2
	call	_draw_circle
; Line 634
	mov	sp,bp
	pop	bp
	ret	

_ase_circle	ENDP
; Line 638
	PUBLIC	_bst_circle
_bst_circle	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 639
	cmp	WORD PTR _AWG9_MODE,154
	je	$I1095
	sub	ax,ax
	ret	
; Line 640
$I1095:
	sub	ax,ax
	push	ax
	mov	ax,6
	push	ax
	mov	ax,12
	push	ax
	mov	ax,58
	push	ax
	mov	ax,159
	push	ax
	push	WORD PTR _Rp2
	call	_draw_circle
	add	sp,12
; Line 641
	ret	

_bst_circle	ENDP
; Line 646
	PUBLIC	_range_bar
_range_bar	PROC NEAR
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
;	s = -6
;	mindist = -10
; Line 649
	mov	WORD PTR [bp-10],0	;mindist
; Line 653
	cmp	WORD PTR _AWG9_MODE,300
	jne	$JCC3378
	jmp	$I1105
$JCC3378:
	cmp	WORD PTR _AWG9_MODE,202
	jne	$JCC3389
	jmp	$I1105
$JCC3389:
	mov	ax,30
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	cmp	ax,0
	je	$JCC3411
	jmp	$I1105
$JCC3411:
	mov	ax,40
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	cmp	ax,0
	je	$JCC3433
	jmp	$I1105
$JCC3433:
	cmp	WORD PTR _SelectedTarg,-1
	je	$JCC3443
	jmp	$I1105
$JCC3443:
; Line 654
	mov	ax,0
	jmp	$EX1096
; Line 658
$I1105:
	mov	ax,0
	mov	WORD PTR [bp-12],ax	;i
	mov	WORD PTR [bp-14],ax	;y1
	jmp	$F1106
$FC1107:
	inc	WORD PTR [bp-12]	;i
	add	WORD PTR [bp-14],5	;y1
$F1106:
	cmp	WORD PTR [bp-12],10	;i
	jl	$JCC3477
	jmp	$FB1108
$JCC3477:
; Line 659
	mov	ax,6
	push	ax
	push	WORD PTR [bp-14]	;y1
	mov	cx,2
	push	cx
	push	WORD PTR [bp-14]	;y1
	mov	dx,1
	push	dx
	push	WORD PTR _RBRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 660
	mov	ax,6
	push	ax
	mov	ax,WORD PTR [bp-14]	;y1
	inc	ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,WORD PTR [bp-14]	;y1
	inc	ax
	push	ax
	mov	ax,1
	push	ax
	push	WORD PTR _RBRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 661
	jmp	$FC1107
$FB1108:
; Line 665
	mov	bx,WORD PTR _RANGE
	shl	bx,1
	mov	ax,WORD PTR _RANGES[bx]
	mov	WORD PTR [bp-2],ax	;r
; Line 666
	mov	ax,10
	push	ax
	lea	cx,WORD PTR [bp-6]	;s
	push	cx
	push	WORD PTR [bp-2]	;r
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,31
	push	ax
	mov	ax,204
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RpPrint
	add	sp,8
; Line 667
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-6]	;s
	push	ax
	push	WORD PTR [bp-10]	;mindist
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,75
	push	ax
	mov	ax,204
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RpPrint
	add	sp,8
; Line 671
	cmp	WORD PTR _PW,0
	jne	$JCC3643
	jmp	$I1109
$JCC3643:
; Line 672
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
; Line 673
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
; Line 674
	mov	ax,6
	push	ax
	push	WORD PTR [bp-14]	;y1
	mov	cx,8
	push	cx
	push	WORD PTR [bp-14]	;y1
	mov	dx,4
	push	dx
	push	WORD PTR _RBRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 675
	mov	ax,6
	push	ax
	push	WORD PTR [bp-16]	;y2
	mov	ax,8
	push	ax
	push	WORD PTR [bp-16]	;y2
	mov	ax,4
	push	ax
	push	WORD PTR _RBRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 676
; Line 677
$I1109:
$EX1096:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_range_bar	ENDP
; Line 682
	PUBLIC	_PDT_closure
_PDT_closure	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__aNchkstk
;	i = -16
;	y1 = -18
;	y2 = -20
;	r = -2
;	v = -14
;	s = -12
; Line 688
	cmp	WORD PTR _AWG9_MODE,300
	je	$I1117
	cmp	WORD PTR _AWG9_MODE,202
	je	$I1117
	mov	ax,30
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$I1117
	mov	ax,40
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$I1117
	cmp	WORD PTR _SelectedTarg,-1
	jne	$JCC3862
	jmp	$EX1110
$JCC3862:
; Line 693
$I1117:
	sub	ax,ax
	mov	WORD PTR [bp-16],ax	;i
	mov	WORD PTR [bp-18],ax	;y1
	jmp	SHORT $F1118
	nop	
$FC1119:
; Line 694
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp-18]	;y1
	add	cx,30
	push	cx
	mov	dx,115
	push	dx
	push	cx
	mov	cx,114
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 695
	mov	ax,6
	push	ax
	mov	ax,WORD PTR [bp-18]	;y1
	add	ax,31
	push	ax
	mov	cx,115
	push	cx
	push	ax
	mov	ax,114
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 696
	inc	WORD PTR [bp-16]	;i
	add	WORD PTR [bp-18],5	;y1
$F1118:
	cmp	WORD PTR [bp-16],8	;i
	jl	$FC1119
; Line 697
	mov	ax,OFFSET DGROUP:$SG1121
	push	ax
	mov	ax,31
	push	ax
	mov	cx,106
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RpPrint
	add	sp,8
; Line 698
	mov	ax,OFFSET DGROUP:$SG1122
	push	ax
	mov	ax,56
	push	ax
	mov	ax,110
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RpPrint
	add	sp,8
; Line 699
	mov	ax,OFFSET DGROUP:$SG1123
	push	ax
	mov	ax,65
	push	ax
	mov	ax,106
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RpPrint
	add	sp,8
; Line 701
	mov	ax,1000
	sub	ax,WORD PTR _CLOSURE
	push	ax
	call	_abs
	add	sp,2
	mov	cx,35
	cwd	
	idiv	cx
	mov	WORD PTR [bp-18],ax	;y1
; Line 703
	add	WORD PTR [bp-18],31	;y1
	cmp	WORD PTR [bp-18],63	;y1
	jle	$I1124
	mov	WORD PTR [bp-18],63	;y1
; Line 704
$I1124:
	cmp	WORD PTR [bp-18],31	;y1
	jge	$I1125
	mov	WORD PTR [bp-18],34	;y1
; Line 705
$I1125:
	mov	ax,6
	push	ax
	push	WORD PTR [bp-18]	;y1
	mov	cx,117
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
	add	sp,8
; Line 706
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp-18]	;y1
	dec	cx
	push	cx
	mov	cx,118
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
	add	sp,8
; Line 707
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp-18]	;y1
	dec	cx
	dec	cx
	push	cx
	mov	cx,119
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
	add	sp,8
; Line 708
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp-18]	;y1
	inc	cx
	push	cx
	mov	cx,118
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
	add	sp,8
; Line 709
	mov	ax,6
	push	ax
	mov	ax,WORD PTR [bp-18]	;y1
	inc	ax
	inc	ax
	push	ax
	mov	ax,119
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
; Line 710
$EX1110:
	mov	sp,bp
	pop	bp
	ret	

_PDT_closure	ENDP
; Line 714
	PUBLIC	_PDT_range
_PDT_range	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,28
	call	__aNchkstk
;	i = -28
;	y = -26
;	r = -12
;	r10 = -24
;	s = -22
;	txt = -10
; Line 720
	cmp	WORD PTR _AWG9_MODE,300
	je	$I1133
	cmp	WORD PTR _AWG9_MODE,202
	je	$I1133
	mov	ax,30
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$I1133
	mov	ax,40
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$I1133
	cmp	WORD PTR _SelectedTarg,-1
	jne	$JCC4268
	jmp	$I1134
$JCC4268:
; Line 725
$I1133:
; Line 727
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
	mov	WORD PTR [bp-26],ax	;y
	or	ax,ax
	jge	$JCC4306
	jmp	$I1134
$JCC4306:
	cmp	ax,40
	jg	$I1134
; Line 728
	add	ax,30
	mov	WORD PTR [bp-26],ax	;y
; Line 729
	mov	cx,6
	push	cx
	dec	ax
	dec	ax
	push	ax
	mov	ax,198
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
	add	sp,8
; Line 730
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp-26]	;y
	dec	cx
	push	cx
	mov	cx,199
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
	add	sp,8
; Line 731
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp-26]	;y
	inc	cx
	push	cx
	mov	cx,199
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
	add	sp,8
; Line 732
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp-26]	;y
	inc	cx
	inc	cx
	push	cx
	mov	cx,198
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
	add	sp,8
; Line 733
	mov	ax,6
	push	ax
	push	WORD PTR [bp-26]	;y
	mov	ax,200
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
; Line 734
; Line 735
$I1134:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_PDT_range	ENDP
; Line 739
PDT_alt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
;	l = -12
;	s = -10
; Line 745
	cmp	WORD PTR _AWG9_MODE,300
	je	$I1139
	cmp	WORD PTR _AWG9_MODE,202
	je	$I1139
	mov	ax,30
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$I1139
	mov	ax,40
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$I1139
	cmp	WORD PTR _SelectedTarg,-1
	je	$EX1136
; Line 748
$I1139:
	mov	ax,10
	push	ax
	lea	cx,WORD PTR [bp-10]	;s
	push	cx
	push	WORD PTR _PDT_ALT_1000
	call	_itoa
	add	sp,6
	push	ax
	push	WORD PTR _Rp2
	call	_pstrlen
	add	sp,4
	mov	WORD PTR [bp-12],ax	;l
; Line 750
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	cx,58
	push	cx
	mov	dx,219
	sub	dx,WORD PTR [bp-12]	;l
	push	dx
	push	WORD PTR _Rp2
	call	FAR PTR _RpPrint
	add	sp,8
; Line 751
	mov	ax,OFFSET DGROUP:$SG1140
	push	ax
	mov	ax,58
	push	ax
	mov	cx,220
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RpPrint
	add	sp,8
; Line 752
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	push	WORD PTR _PDT_ALT_100
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,58
	push	ax
	mov	ax,224
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RpPrint
; Line 753
$EX1136:
	mov	sp,bp
	pop	bp
	ret	
	nop	

PDT_alt	ENDP
; Line 757
	PUBLIC	_gun_reticle
_gun_reticle	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	sx = -2
;	sy = -4
; Line 760
	cmp	WORD PTR _MODE_AA,2
	je	$I1144
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 762
$I1144:
; Line 763
	mov	cl,4
	mov	ax,WORD PTR _sightY
	sar	ax,cl
	add	ax,43
	mov	WORD PTR [bp-4],ax	;sy
; Line 764
	mov	dx,6
	push	dx
	mov	bx,ax
	sub	ax,dx
	push	ax
	mov	ax,WORD PTR _sightX
	sar	ax,cl
	add	ax,60
	mov	WORD PTR [bp-2],ax	;sx
	push	ax
	lea	cx,WORD PTR [bx-10]
	push	cx
	push	ax
	push	WORD PTR _TDBRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 765
	mov	ax,6
	push	ax
	push	WORD PTR [bp-4]	;sy
	mov	cx,WORD PTR [bp-2]	;sx
	add	cx,10
	push	cx
	push	WORD PTR [bp-4]	;sy
	add	ax,WORD PTR [bp-2]	;sx
	push	ax
	push	WORD PTR _TDBRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 766
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp-4]	;sy
	add	cx,10
	push	cx
	push	WORD PTR [bp-2]	;sx
	add	ax,WORD PTR [bp-4]	;sy
	push	ax
	push	WORD PTR [bp-2]	;sx
	push	WORD PTR _TDBRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 767
	mov	ax,6
	push	ax
	push	WORD PTR [bp-4]	;sy
	mov	cx,WORD PTR [bp-2]	;sx
	sub	cx,10
	push	cx
	push	WORD PTR [bp-4]	;sy
	sub	ax,WORD PTR [bp-2]	;sx
	neg	ax
	push	ax
	push	WORD PTR _TDBRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 768
	mov	ax,6
	push	ax
	push	WORD PTR [bp-4]	;sy
	push	WORD PTR [bp-2]	;sx
	push	WORD PTR _TDBRp
	call	FAR PTR _DrawDot
; Line 769
	mov	sp,bp
	pop	bp
	ret	
	nop	

_gun_reticle	ENDP
; Line 773
	PUBLIC	_break_x
_break_x	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	si
; Line 776
	cmp	WORD PTR _ASE_RADIUS,0
	jne	$I1148
	cmp	WORD PTR _MODE_AA,4
	jne	$I1147
$I1148:
	sub	ax,ax
	pop	si
	ret	
; Line 778
$I1147:
	cmp	WORD PTR $S1146_off,0
	jne	$I1149
; Line 779
	mov	ax,6
	push	ax
	mov	cx,68
	push	cx
	mov	dx,177
	push	dx
	mov	bx,34
	push	bx
	mov	si,143
	push	si
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 780
	mov	ax,6
	push	ax
	mov	ax,34
	push	ax
	mov	ax,177
	push	ax
	mov	ax,68
	push	ax
	push	si
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 781
; Line 783
$I1149:
	xor	BYTE PTR $S1146_off,1
; Line 784
	pop	si
	ret	
	nop	

_break_x	ENDP
; Line 788
	PUBLIC	_TD_box
_TD_box	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	y = -4
;	l = -6
;	x = -2
; Line 792
	cmp	WORD PTR _PDT_PROJ,0
	jne	$I1155
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 794
$I1155:
; Line 795
	mov	ax,WORD PTR _PDT_PROJ_Y
	add	ax,WORD PTR _TB_CTRY
	sub	ax,15
	mov	WORD PTR [bp-4],ax	;y
; Line 799
	mov	WORD PTR [bp-6],0	;l
; Line 801
	mov	cx,WORD PTR _PDT_PROJ_X
	add	cx,WORD PTR _TB_CTRX
	sub	cx,100
	mov	WORD PTR [bp-2],cx	;x
	cmp	cx,8
	jl	$I1157
	cmp	cx,119
	jg	$I1157
	or	ax,ax
	jl	$I1157
	cmp	ax,68
	jle	$I1156
$I1157:
	inc	WORD PTR [bp-6]	;l
; Line 803
$I1156:
	cmp	WORD PTR [bp-6],0	;l
	je	$I1162
; Line 804
	cmp	cx,8
	jge	$I1159
	mov	WORD PTR [bp-2],10	;x
; Line 805
$I1159:
	cmp	WORD PTR [bp-2],119	;x
	jle	$I1160
	mov	WORD PTR [bp-2],115	;x
; Line 806
$I1160:
	or	ax,ax
	jge	$I1161
	mov	WORD PTR [bp-4],4	;y
; Line 807
$I1161:
	cmp	WORD PTR [bp-4],68	;y
	jle	$I1162
	mov	WORD PTR [bp-4],68	;y
; Line 808
$I1162:
; Line 810
	push	WORD PTR [bp-4]	;y
	push	WORD PTR [bp-2]	;x
	push	WORD PTR _TDBRp
	call	_diamondbox
; Line 811
	mov	sp,bp
	pop	bp
	ret	

_TD_box	ENDP
; Line 815
	PUBLIC	_steering_dot
_steering_dot	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	x = -2
;	y = -4
; Line 818
	cmp	WORD PTR _STEER_DOT,0
	jne	$I1167
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 819
$I1167:
; Line 820
	mov	ax,WORD PTR _STEER_DOT_Y
	add	ax,WORD PTR _TB_CTRY
	sub	ax,15
	mov	WORD PTR [bp-4],ax	;y
; Line 821
	mov	cx,6
	push	cx
	dec	ax
	push	ax
	mov	dx,WORD PTR _STEER_DOT_X
	add	dx,WORD PTR _TB_CTRX
	sub	dx,100
	mov	WORD PTR [bp-2],dx	;x
	push	dx
	push	ax
	dec	dx
	push	dx
	push	WORD PTR _TDBRp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 822
	mov	ax,6
	push	ax
	push	WORD PTR [bp-4]	;y
	push	WORD PTR [bp-2]	;x
	push	WORD PTR [bp-4]	;y
	mov	ax,WORD PTR [bp-2]	;x
	dec	ax
	push	ax
	push	WORD PTR _TDBRp
	call	FAR PTR _DrawLine
; Line 823
	mov	sp,bp
	pop	bp
	ret	

_steering_dot	ENDP
; Line 828
rectbox	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	h = 12
;	w = 10
;	y = 8
;	x = 6
;	RP = 4
; Line 830
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp+12]	;h
	add	cx,WORD PTR [bp+8]	;y
	dec	cx
	push	cx
	push	WORD PTR [bp+6]	;x
	push	WORD PTR [bp+8]	;y
	push	WORD PTR [bp+6]	;x
	push	WORD PTR [bp+4]	;RP
	mov	si,cx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 831
	mov	ax,6
	push	ax
	push	WORD PTR [bp+8]	;y
	mov	cx,WORD PTR [bp+10]	;w
	add	cx,WORD PTR [bp+6]	;x
	dec	cx
	push	cx
	push	WORD PTR [bp+8]	;y
	push	WORD PTR [bp+6]	;x
	push	WORD PTR [bp+4]	;RP
	mov	di,cx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 832
	mov	ax,6
	push	ax
	push	si
	push	WORD PTR [bp+6]	;x
	push	si
	push	di
	push	WORD PTR [bp+4]	;RP
	call	FAR PTR _DrawLine
	add	sp,12
; Line 833
	mov	ax,6
	push	ax
	push	WORD PTR [bp+8]	;y
	push	di
	push	si
	push	di
	push	WORD PTR [bp+4]	;RP
	call	FAR PTR _DrawLine
	add	sp,12
; Line 835
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

rectbox	ENDP
; Line 839
	PUBLIC	_diamondbox
_diamondbox	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	y = 8
;	x = 6
;	RP = 4
; Line 840
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp+8]	;y
	add	cx,4
	push	cx
	mov	dx,WORD PTR [bp+6]	;x
	add	dx,4
	push	dx
	push	WORD PTR [bp+8]	;y
	push	WORD PTR [bp+6]	;x
	push	WORD PTR [bp+4]	;RP
	mov	si,cx
	mov	di,dx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 841
	mov	ax,6
	push	ax
	mov	cx,WORD PTR [bp+8]	;y
	add	cx,8
	push	cx
	push	WORD PTR [bp+6]	;x
	push	si
	push	di
	push	WORD PTR [bp+4]	;RP
	mov	di,cx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 842
	mov	ax,6
	push	ax
	push	si
	mov	cx,WORD PTR [bp+6]	;x
	sub	cx,4
	push	cx
	push	di
	push	WORD PTR [bp+6]	;x
	push	WORD PTR [bp+4]	;RP
	mov	di,cx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 843
	mov	ax,6
	push	ax
	push	WORD PTR [bp+8]	;y
	push	WORD PTR [bp+6]	;x
	push	si
	push	di
	push	WORD PTR [bp+4]	;RP
	call	FAR PTR _DrawLine
	add	sp,12
; Line 844
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_diamondbox	ENDP
; Line 848
	PUBLIC	_draw_shoot_cue
_draw_shoot_cue	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	di
	push	si
;	color = 12
;	y = 10
;	x = 8
;	rp = 6
;	missile = 4
; Line 849
	mov	ax,WORD PTR [bp+4]	;missile
	sub	ax,18
	je	$SC1190
	dec	ax
	dec	ax
	jne	$SD1191
; Line 850
$SC1190:
; Line 852
	push	WORD PTR [bp+12]	;color
	mov	ax,WORD PTR [bp+10]	;y
	add	ax,3
	push	ax
	mov	cx,WORD PTR [bp+8]	;x
	sub	cx,3
	push	cx
	push	WORD PTR [bp+10]	;y
	push	WORD PTR [bp+8]	;x
	push	WORD PTR [bp+6]	;rp
	mov	si,ax
	mov	di,cx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 853
	push	WORD PTR [bp+12]	;color
	push	si
	mov	ax,WORD PTR [bp+8]	;x
	add	ax,3
	push	ax
	push	WORD PTR [bp+10]	;y
	push	WORD PTR [bp+8]	;x
	push	WORD PTR [bp+6]	;rp
	mov	WORD PTR [bp-2],ax
	call	FAR PTR _DrawLine
	add	sp,12
; Line 854
	push	WORD PTR [bp+12]	;color
	push	si
	push	WORD PTR [bp-2]
	push	si
	push	di
	push	WORD PTR [bp+6]	;rp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 857
$SD1191:
; Line 858
; Line 860
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_draw_shoot_cue	ENDP
_TEXT	ENDS
END
