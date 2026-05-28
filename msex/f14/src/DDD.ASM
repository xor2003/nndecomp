;	Static Name Aliases
;
;	$S1161_hpts	EQU	hpts
	TITLE   C:\DDD.C
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
EXTRN	_rotate_pt:NEAR
EXTRN	_DrawLine:FAR
EXTRN	_DrawDot:FAR
EXTRN	__aNchkstk:NEAR
EXTRN	_ARMT_get_priority:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_RectFill:FAR
EXTRN	_CheckMode:NEAR
EXTRN	_PDT_RNG:WORD
_BSS      SEGMENT
COMM NEAR	_BAD_GUY:	BYTE:	 2
_BSS      ENDS
EXTRN	_OurPitch:WORD
EXTRN	_ASE_RADIUS:WORD
EXTRN	_OurRoll:WORD
EXTRN	_PW:WORD
EXTRN	_DESIG_TARGF:BYTE
EXTRN	_TARGFILE:WORD
EXTRN	_AGEDTARGFILE:WORD
EXTRN	_TARGFILECNT:WORD
EXTRN	_STEER_DOT_X:WORD
EXTRN	_AGEDTARGFILECNT:WORD
EXTRN	_STEER_DOT_Y:WORD
EXTRN	_STEER_DOT:WORD
_BSS      SEGMENT
COMM NEAR	_CLOSURE:	BYTE:	 2
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_AWG9_SNIFF:WORD
EXTRN	_Damaged:WORD
_BSS      SEGMENT
COMM NEAR	_AZSWEEP:	BYTE:	 2
_BSS      ENDS
EXTRN	_ORDNANCE:BYTE
EXTRN	_AWG9_MODE:WORD
EXTRN	_RANGES:BYTE
EXTRN	_BRANGES:BYTE
EXTRN	_RANGE:WORD
EXTRN	_RpCRT:WORD
_BSS      SEGMENT
COMM NEAR	_BEAM_HDG:	BYTE:	 2
COMM NEAR	_BEAM_PIT:	BYTE:	 2
COMM NEAR	_BEAM_ROL:	BYTE:	 2
COMM NEAR	_AZSWEEP_DIR:	BYTE:	 2
COMM NEAR	_CUR_BAR:	BYTE:	 2
_BSS      ENDS
_DATA      SEGMENT
$S1161_hpts	DW	0ffddH
	DW	00H
	DW	0fff7H
	DW	00H
	DW	023H
	DW	00H
	DW	0cH
	DW	00H
 	DB	8 DUP(0)

_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 19
; Line 2
; Line 3
; Line 4
; Line 5
; Line 6
; Line 7
; Line 8
; Line 40
	PUBLIC	_DoDDD
_DoDDD	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
;	CrtNr = 4
; Line 41
	test	BYTE PTR _Damaged,128
	je	$I1164
; Line 42
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
; Line 43
	mov	ax,1
	ret	
; Line 44
; Line 46
$I1164:
	mov	ax,21
	push	ax
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+8]
	inc	ax
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
; Line 47
	cmp	WORD PTR _AWG9_SNIFF,0
	jne	$I1168
; Line 48
	call	_show_az_carat
; Line 49
	call	_ShowTargets
; Line 50
	cmp	WORD PTR _AWG9_MODE,300
	je	$I1169
	cmp	WORD PTR _AWG9_MODE,202
	jne	$I1168
$I1169:
; Line 51
	call	_DDD_horizon_line
; Line 52
	call	_DDDWeaponRanges
; Line 53
	sub	ax,ax
	push	ax
	mov	ax,20
	push	ax
	mov	ax,10
	push	ax
	mov	ax,29
	push	ax
	mov	ax,42
	push	ax
	push	WORD PTR _RpCRT
	call	_draw_circle
	add	sp,12
; Line 54
; Line 55
$I1168:
; Line 56
	ret	

_DoDDD	ENDP
; Line 60
	PUBLIC	_show_az_carat
_show_az_carat	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	x = -2
; Line 63
	cmp	WORD PTR _AWG9_MODE,300
	je	$I1176
	cmp	WORD PTR _AWG9_MODE,202
	jne	$I1175
$I1176:
; Line 64
	mov	cx,83
	mov	ax,WORD PTR _DESIG_TARGF+28
	mov	bx,182
	cwd	
	idiv	bx
	jmp	SHORT $L20004
	nop	
$I1175:
; Line 66
	mov	cx,83
	mov	ax,WORD PTR _BEAM_HDG
	mov	bx,182
	cwd	
	idiv	bx
	add	ax,WORD PTR _AZSWEEP
$L20004:
	imul	cx
	mov	cx,120
	cwd	
	idiv	cx
	add	ax,41
	mov	WORD PTR [bp-2],ax	;x
; Line 70
	cmp	WORD PTR _AZSWEEP_DIR,0
	je	$I1178
; Line 71
	mov	ax,19
	push	ax
	mov	ax,73
	push	ax
	push	WORD PTR [bp-2]	;x
	mov	cx,3
	push	cx
	push	WORD PTR [bp-2]	;x
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 72
	mov	ax,20
	push	ax
	mov	cx,73
	push	cx
	mov	dx,WORD PTR [bp-2]	;x
	dec	dx
	push	dx
	mov	bx,3
	push	bx
	push	dx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 73
	mov	ax,20
	push	ax
	mov	ax,73
	push	ax
	mov	ax,WORD PTR [bp-2]	;x
	dec	ax
	dec	ax
	push	ax
	mov	cx,3
	push	cx
	push	ax
	jmp	SHORT $L20005
$I1178:
; Line 75
	mov	ax,20
	push	ax
	mov	cx,73
	push	cx
	mov	dx,WORD PTR [bp-2]	;x
	inc	dx
	push	dx
	mov	bx,3
	push	bx
	push	dx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 76
	mov	ax,20
	push	ax
	mov	ax,73
	push	ax
	mov	cx,WORD PTR [bp-2]	;x
	inc	cx
	inc	cx
	push	cx
	mov	dx,3
	push	dx
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 77
	mov	ax,19
	push	ax
	mov	ax,73
	push	ax
	push	WORD PTR [bp-2]	;x
	mov	ax,3
	push	ax
	push	WORD PTR [bp-2]	;x
$L20005:
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
; Line 78
; Line 79
	mov	sp,bp
	pop	bp
	ret	

_show_az_carat	ENDP
; Line 84
	PUBLIC	_DDDWeaponRanges
_DDDWeaponRanges	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	di
	push	si
;	CurrentWeapon = -8
;	CurrentRange = -2
;	y1 = -4
;	y2 = -6
; Line 89
	mov	bx,WORD PTR _RANGE
	shl	bx,1
	mov	ax,WORD PTR _RANGES[bx]
	mov	WORD PTR [bp-2],ax	;CurrentRange
; Line 92
	call	_ARMT_get_priority
	mov	WORD PTR [bp-8],ax	;CurrentWeapon
	or	ax,ax
	jne	$JCC422
	jmp	$I1186
$JCC422:
; Line 93
	mov	ax,WORD PTR [bp-2]	;CurrentRange
	cwd	
	push	dx
	push	ax
	mov	cx,10
	sub	bx,bx
	push	bx
	push	cx
	mov	si,ax
	mov	ax,24
	mov	di,dx
	imul	WORD PTR [bp-8]	;CurrentWeapon
	mov	bx,ax
	mov	ax,-56
	imul	WORD PTR _ORDNANCE[bx+18]
	push	dx
	push	ax
	mov	WORD PTR [bp-10],bx
	call	__aNldiv
	push	dx
	push	ax
	call	__aNldiv
	add	ax,54
	mov	WORD PTR [bp-4],ax	;y1
; Line 94
	push	di
	push	si
	mov	ax,10
	cwd	
	push	dx
	push	ax
	mov	bx,WORD PTR [bp-10]
	mov	ax,-56
	imul	WORD PTR _ORDNANCE[bx+16]
	push	dx
	push	ax
	call	__aNldiv
	push	dx
	push	ax
	call	__aNldiv
	add	ax,54
	mov	WORD PTR [bp-6],ax	;y2
; Line 95
	cmp	ax,4
	jge	$I1187
	mov	WORD PTR [bp-6],4	;y2
; Line 96
$I1187:
	cmp	WORD PTR [bp-4],58	;y1
	jle	$I1188
	mov	WORD PTR [bp-4],58	;y1
; Line 98
$I1188:
	mov	ax,19
	push	ax
	push	WORD PTR [bp-4]	;y1
	mov	cx,18
	push	cx
	push	WORD PTR [bp-4]	;y1
	mov	dx,12
	push	dx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 99
	mov	ax,19
	push	ax
	push	WORD PTR [bp-6]	;y2
	mov	ax,18
	push	ax
	push	WORD PTR [bp-6]	;y2
	mov	ax,12
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 100
; Line 101
$I1186:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DDDWeaponRanges	ENDP
; Line 105
	PUBLIC	_DopplerCheck
_DopplerCheck	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	t = 4
; Line 106
	mov	ax,30
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	mov	sp,bp
	or	ax,ax
	jne	$I1194
	mov	ax,40
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	mov	sp,bp
	or	ax,ax
	je	$I1193
$I1194:
; Line 107
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 109
	nop	
$I1193:
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx+40],-1
	jl	$I1194
	jg	$L20002
	cmp	WORD PTR [bx+38],-50
	jbe	$I1194
$L20002:
	cmp	WORD PTR [bx+40],0
	jg	$I1194
	jl	$L20003
	cmp	WORD PTR [bx+38],50
	jae	$I1194
$L20003:
; Line 110
	cmp	WORD PTR [bx+32],16016
	jbe	$I1198
	cmp	WORD PTR [bx+32],16926
	jb	$I1197
$I1198:
	cmp	WORD PTR [bx+32],-16926
	jbe	$I1194
	cmp	WORD PTR [bx+32],-16016
	jae	$I1194
$I1197:
; Line 111
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DopplerCheck	ENDP
; Line 119
	PUBLIC	_ShowTargets
_ShowTargets	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	i = -2
; Line 123
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1201
	nop	
$FC1202:
; Line 124
	mov	cx,50
	imul	cx
	mov	cx,ax
	add	ax,WORD PTR _AGEDTARGFILE
	push	ax
	mov	si,cx
	call	_DopplerCheck
	add	sp,2
	or	ax,ax
	je	$I1204
; Line 125
	mov	ax,1
	push	ax
	add	si,WORD PTR _AGEDTARGFILE
	push	si
	call	_DDDTargetDraw
	add	sp,4
; Line 128
$I1204:
	inc	WORD PTR [bp-2]	;i
$F1201:
	mov	bx,WORD PTR _AGEDTARGFILECNT
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR [bx],ax
	jg	$FC1202
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1206
$FC1207:
; Line 129
	mov	cx,50
	imul	cx
	mov	cx,ax
	add	ax,WORD PTR _TARGFILE
	push	ax
	mov	si,cx
	call	_DopplerCheck
	add	sp,2
	or	ax,ax
	je	$I1209
; Line 130
	sub	ax,ax
	push	ax
	add	si,WORD PTR _TARGFILE
	push	si
	call	_DDDTargetDraw
	add	sp,4
; Line 131
$I1209:
	inc	WORD PTR [bp-2]	;i
$F1206:
	mov	bx,WORD PTR _TARGFILECNT
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR [bx],ax
	jg	$FC1207
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ShowTargets	ENDP
; Line 135
	PUBLIC	_DDDTargetDraw
_DDDTargetDraw	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
	push	si
;	y1 = -10
;	x2 = -8
;	y2 = -14
;	off = -12
;	d = -4
;	clr = -2
;	x1 = -6
;	age = 6
;	t = 4
; Line 142
	mov	ax,WORD PTR [bp+6]	;age
	add	ax,19
	mov	WORD PTR [bp-2],ax	;clr
	push	ax
	mov	bx,WORD PTR [bp+4]	;t
	mov	cx,WORD PTR [bx+24]
	dec	cx
	push	cx
	mov	dx,WORD PTR [bx+22]
	mov	si,dx
	inc	dx
	push	dx
	push	cx
	lea	cx,WORD PTR [si-1]
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 143
	push	WORD PTR [bp-2]	;clr
	mov	bx,WORD PTR [bp+4]	;t
	push	WORD PTR [bx+24]
	mov	ax,WORD PTR [bx+22]
	mov	cx,ax
	inc	ax
	push	ax
	push	WORD PTR [bx+24]
	dec	cx
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 144
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_DDDTargetDraw	ENDP
; Line 148
	PUBLIC	_DDD_horizon_line
_DDD_horizon_line	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,34
	call	__aNchkstk
	push	di
	push	si
;	i = -34
;	pts = -24
;	ctr = -32
; Line 152
	mov	WORD PTR [bp-32],0	;ctr
; Line 153
	mov	ax,16384
	cwd	
	push	dx
	push	ax
	mov	ax,33
	imul	WORD PTR _OurPitch
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-30],ax
; Line 154
	push	WORD PTR _OurRoll
	lea	ax,WORD PTR [bp-28]
	push	ax
	lea	ax,WORD PTR [bp-32]	;ctr
	push	ax
	call	_rotate_pt
	add	sp,6
; Line 156
	mov	WORD PTR [bp-34],0	;i
$FC1226:
; Line 157
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-34]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-24][si]
	push	ax
	mov	cx,si
	add	si,OFFSET DGROUP:$S1161_hpts
	push	si
	mov	si,ax
	mov	di,cx
	call	_rotate_pt
	add	sp,6
; Line 158
	mov	ax,WORD PTR [bp-28]
	add	ax,41
	add	WORD PTR [si],ax
; Line 159
	mov	ax,WORD PTR [bp-26]
	add	ax,29
	add	WORD PTR [bp-22][di],ax
; Line 160
	inc	WORD PTR [bp-34]	;i
	cmp	WORD PTR [bp-34],4	;i
	jl	$FC1226
; Line 162
	mov	ax,19
	push	ax
	push	WORD PTR [bp-18]
	push	WORD PTR [bp-20]
	push	WORD PTR [bp-22]
	push	WORD PTR [bp-24]	;pts
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 163
	mov	ax,19
	push	ax
	push	WORD PTR [bp-10]
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]
	push	WORD PTR [bp-16]
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 164
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_DDD_horizon_line	ENDP
; Line 168
	PUBLIC	_show_rmin_rmax
_show_rmin_rmax	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	y = -2
; Line 171
	cmp	WORD PTR _AWG9_MODE,300
	jne	$I1232
	cmp	WORD PTR _AWG9_MODE,202
	je	$I1231
$I1232:
; Line 172
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 173
	nop	
$I1231:
	cmp	WORD PTR _PW,0
	je	$I1232
; Line 178
	mov	ax,20
	push	ax
	mov	bx,WORD PTR _RANGE
	shl	bx,1
	mov	ax,WORD PTR _RANGES[bx]
	cwd	
	push	dx
	push	ax
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,24
	imul	WORD PTR _PW
	mov	bx,ax
	mov	ax,-66
	imul	WORD PTR _ORDNANCE[bx+18]
	push	dx
	push	ax
	call	__aNldiv
	push	dx
	push	ax
	call	__aNldiv
	add	ax,66
	push	ax
	mov	cx,83
	push	cx
	push	ax
	mov	ax,80
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 183
	mov	ax,20
	push	ax
	mov	bx,WORD PTR _RANGE
	shl	bx,1
	mov	ax,WORD PTR _RANGES[bx]
	cwd	
	push	dx
	push	ax
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,24
	imul	WORD PTR _PW
	mov	bx,ax
	mov	ax,-66
	imul	WORD PTR _ORDNANCE[bx+16]
	push	dx
	push	ax
	call	__aNldiv
	push	dx
	push	ax
	call	__aNldiv
	add	ax,66
	push	ax
	mov	cx,83
	push	cx
	push	ax
	mov	ax,80
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
; Line 184
	mov	sp,bp
	pop	bp
	ret	

_show_rmin_rmax	ENDP
; Line 188
show_range_carat	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
;	i = -20
;	cl = -22
;	y = -18
;	p = -16
; Line 192
	cmp	WORD PTR _AWG9_MODE,300
	jne	$I1241
	cmp	WORD PTR _AWG9_MODE,202
	je	$I1240
$I1241:
; Line 193
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 195
	nop	
$I1240:
; Line 199
	mov	ax,20
	push	ax
	mov	bx,WORD PTR _RANGE
	shl	bx,1
	mov	ax,WORD PTR _BRANGES[bx]
	cwd	
	push	dx
	push	ax
	mov	ax,-66
	imul	WORD PTR _PDT_RNG
	push	dx
	push	ax
	call	__aNldiv
	add	ax,66
	mov	WORD PTR [bp-18],ax	;y
	dec	ax
	push	ax
	mov	ax,82
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawDot
	add	sp,8
; Line 200
	mov	ax,20
	push	ax
	mov	cx,WORD PTR [bp-18]	;y
	inc	cx
	push	cx
	mov	cx,82
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawDot
	add	sp,8
; Line 201
	mov	ax,20
	push	ax
	push	WORD PTR [bp-18]	;y
	mov	ax,83
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawDot
; Line 202
	mov	sp,bp
	pop	bp
	ret	

show_range_carat	ENDP
; Line 206
show_steer_dot	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	x = -2
;	y = -4
; Line 209
	cmp	WORD PTR _STEER_DOT,0
	jne	$I1246
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 211
$I1246:
; Line 212
	mov	ax,WORD PTR _STEER_DOT_Y
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,15
	mov	cx,30
	cwd	
	idiv	cx
	add	ax,33
; Line 214
	mov	dx,19
	push	dx
	push	ax
	mov	ax,WORD PTR _STEER_DOT_X
	mov	dx,ax
	shl	ax,1
	shl	ax,1
	add	ax,dx
	shl	ax,1
	add	ax,15
	cwd	
	idiv	cx
	add	ax,41
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawDot
; Line 215
	mov	sp,bp
	pop	bp
	ret	

show_steer_dot	ENDP
; Line 219
show_ase_circle	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	r = -2
; Line 222
	cmp	WORD PTR _ASE_RADIUS,0
	jg	$I1250
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 225
$I1250:
; Line 226
	sub	ax,ax
	push	ax
	mov	ax,20
	push	ax
	mov	ax,WORD PTR _ASE_RADIUS
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,15
	mov	cx,30
	cwd	
	idiv	cx
	push	ax
	mov	ax,33
	push	ax
	mov	ax,41
	push	ax
	push	WORD PTR _RpCRT
	call	_draw_circle
; Line 227
	mov	sp,bp
	pop	bp
	ret	
	nop	

show_ase_circle	ENDP
; Line 231
	PUBLIC	_draw_circle
_draw_circle	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
;	x = -8
;	y = -10
;	d = -4
;	delE = -12
;	delSE = -14
;	c1 = -2
;	c2 = -6
;	dash = 14
;	color = 12
;	r = 10
;	yc = 8
;	xc = 6
;	rp = 4
; Line 240
	mov	ax,WORD PTR [bp+14]	;dash
	mov	WORD PTR [bp-6],ax	;c2
	mov	WORD PTR [bp-2],ax	;c1
; Line 242
	mov	cx,WORD PTR [bp+10]	;r
	mov	WORD PTR [bp-10],cx	;y
; Line 243
	dec	cx
	neg	cx
	mov	WORD PTR [bp-4],cx	;d
; Line 244
	mov	WORD PTR [bp-12],3	;delE
; Line 245
	mov	cx,WORD PTR [bp+10]	;r
	shl	cx,1
	sub	cx,5
	neg	cx
	mov	WORD PTR [bp-14],cx	;delSE
; Line 247
	push	ax
	lea	ax,WORD PTR [bp-6]	;c2
	push	ax
	lea	ax,WORD PTR [bp-2]	;c1
	push	ax
	push	WORD PTR [bp+12]	;color
	push	WORD PTR [bp+8]	;yc
	push	WORD PTR [bp+6]	;xc
	push	WORD PTR [bp+10]	;r
	sub	ax,ax
	mov	WORD PTR [bp-8],ax	;x
	push	ax
	jmp	SHORT $L20010
	nop	
$FC1267:
; Line 250
	cmp	WORD PTR [bp-4],0	;d
	jge	$I1269
; Line 251
	mov	ax,WORD PTR [bp-12]	;delE
	add	WORD PTR [bp-4],ax	;d
; Line 252
	add	WORD PTR [bp-12],2	;delE
; Line 253
	add	WORD PTR [bp-14],2	;delSE
; Line 254
	inc	WORD PTR [bp-8]	;x
; Line 255
	jmp	SHORT $I1270
	nop	
$I1269:
; Line 256
	mov	ax,WORD PTR [bp-14]	;delSE
	add	WORD PTR [bp-4],ax	;d
; Line 257
	add	WORD PTR [bp-12],2	;delE
; Line 258
	add	WORD PTR [bp-14],4	;delSE
; Line 259
	inc	WORD PTR [bp-8]	;x
; Line 260
	dec	WORD PTR [bp-10]	;y
; Line 261
$I1270:
; Line 262
	push	WORD PTR [bp+14]	;dash
	lea	ax,WORD PTR [bp-6]	;c2
	push	ax
	lea	ax,WORD PTR [bp-2]	;c1
	push	ax
	push	WORD PTR [bp+12]	;color
	push	WORD PTR [bp+8]	;yc
	push	WORD PTR [bp+6]	;xc
	push	WORD PTR [bp-10]	;y
	push	WORD PTR [bp-8]	;x
$L20010:
	push	WORD PTR [bp+4]	;rp
	call	circle_pt
	add	sp,18
; Line 263
	mov	ax,WORD PTR [bp-8]	;x
	cmp	WORD PTR [bp-10],ax	;y
	jg	$FC1267
; Line 264
	mov	sp,bp
	pop	bp
	ret	
	nop	

_draw_circle	ENDP
; Line 269
circle_pt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	di
	push	si
;	dash = 20
;	c2 = 18
;	c1 = 16
;	clr = 14
;	yc = 12
;	xc = 10
;	y = 8
;	x = 6
;	rp = 4
; Line 271
	mov	bx,WORD PTR [bp+16]	;c1
	cmp	WORD PTR [bx],0
	je	$I1281
$L20011:
	dec	WORD PTR [bx]
; Line 272
	jmp	SHORT $I1284
	nop	
$I1281:
	mov	bx,WORD PTR [bp+18]	;c2
	cmp	WORD PTR [bx],0
	jne	$L20011
	mov	ax,WORD PTR [bp+20]	;dash
	mov	WORD PTR [bx],ax
	mov	bx,WORD PTR [bp+16]	;c1
	mov	WORD PTR [bx],ax
$I1284:
; Line 275
	mov	bx,WORD PTR [bp+16]	;c1
	cmp	WORD PTR [bx],0
	je	$JCC1824
	jmp	$I1285
$JCC1824:
; Line 277
	push	WORD PTR [bp+14]	;clr
	mov	cl,3
	mov	ax,WORD PTR [bp+8]	;y
	sar	ax,cl
	sub	ax,WORD PTR [bp+12]	;yc
	neg	ax
	add	ax,WORD PTR [bp+8]	;y
	push	ax
	mov	dx,WORD PTR [bp+10]	;xc
	add	dx,WORD PTR [bp+6]	;x
	push	dx
	push	WORD PTR [bp+4]	;rp
	mov	si,ax
	mov	di,dx
	call	FAR PTR _DrawDot
	add	sp,8
; Line 278
	push	WORD PTR [bp+14]	;clr
	mov	cl,3
	mov	ax,WORD PTR [bp+6]	;x
	sar	ax,cl
	sub	ax,WORD PTR [bp+12]	;yc
	neg	ax
	add	ax,WORD PTR [bp+6]	;x
	push	ax
	mov	dx,WORD PTR [bp+10]	;xc
	add	dx,WORD PTR [bp+8]	;y
	push	dx
	push	WORD PTR [bp+4]	;rp
	mov	WORD PTR [bp-2],ax
	mov	WORD PTR [bp-4],dx
	call	FAR PTR _DrawDot
	add	sp,8
; Line 279
	push	WORD PTR [bp+14]	;clr
	mov	cl,3
	mov	ax,WORD PTR [bp+6]	;x
	neg	ax
	sar	ax,cl
	sub	ax,WORD PTR [bp+12]	;yc
	neg	ax
	sub	ax,WORD PTR [bp+6]	;x
	push	ax
	push	WORD PTR [bp-4]
	push	WORD PTR [bp+4]	;rp
	mov	WORD PTR [bp-6],ax
	call	FAR PTR _DrawDot
	add	sp,8
; Line 280
	push	WORD PTR [bp+14]	;clr
	mov	cl,3
	mov	ax,WORD PTR [bp+8]	;y
	neg	ax
	sar	ax,cl
	sub	ax,WORD PTR [bp+12]	;yc
	neg	ax
	sub	ax,WORD PTR [bp+8]	;y
	push	ax
	push	di
	push	WORD PTR [bp+4]	;rp
	mov	di,ax
	call	FAR PTR _DrawDot
	add	sp,8
; Line 281
	push	WORD PTR [bp+14]	;clr
	push	di
	mov	ax,WORD PTR [bp+10]	;xc
	sub	ax,WORD PTR [bp+6]	;x
	push	ax
	push	WORD PTR [bp+4]	;rp
	mov	di,ax
	call	FAR PTR _DrawDot
	add	sp,8
; Line 282
	push	WORD PTR [bp+14]	;clr
	push	WORD PTR [bp-6]
	mov	ax,WORD PTR [bp+10]	;xc
	sub	ax,WORD PTR [bp+8]	;y
	push	ax
	push	WORD PTR [bp+4]	;rp
	mov	WORD PTR [bp-8],ax
	call	FAR PTR _DrawDot
	add	sp,8
; Line 283
	push	WORD PTR [bp+14]	;clr
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-8]
	push	WORD PTR [bp+4]	;rp
	call	FAR PTR _DrawDot
	add	sp,8
; Line 284
	push	WORD PTR [bp+14]	;clr
	push	si
	push	di
	push	WORD PTR [bp+4]	;rp
	call	FAR PTR _DrawDot
	add	sp,8
; Line 286
; Line 287
$I1285:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

circle_pt	ENDP
_TEXT	ENDS
END
