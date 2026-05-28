;	Static Name Aliases
;
;	$S972_ASE_Tbl	EQU	ASE_Tbl
;	$S976_Angles	EQU	Angles
;	$S1001_ACQ_X	EQU	ACQ_X
;	$S1002_ACQ_Y	EQU	ACQ_Y
;	$S1006_STABLE_HDG	EQU	STABLE_HDG
;	$S1007_STABLE_PIT	EQU	STABLE_PIT
;	$S1008_BEAM_M	EQU	BEAM_M
;	$S1010_CVG_MAX	EQU	CVG_MAX
;	$S1011_CVG_MIN	EQU	CVG_MIN
;	$S1012_KNOTS	EQU	KNOTS
;	$S1013_ASPDEG	EQU	ASPDEG
;	$S1014_break_mode	EQU	break_mode
;	$S1020_resetmark	EQU	resetmark
;	$S1209_srch	EQU	srch
;	$S1210_SpecialMode	EQU	SpecialMode
;	$S1299_prevaz	EQU	prevaz
;	$S1300_prevbar	EQU	prevbar
;	$S1341_srchmode	EQU	srchmode
;	$S1370_srchmode	EQU	srchmode
;	$S1431_MX	EQU	MX
;	$S1444_prevdesig	EQU	prevdesig
;	$S1717_prev_bad_guy	EQU	prev_bad_guy
;	$S1874_flash	EQU	flash
;	$S1972_lasttime	EQU	lasttime
	TITLE   C:\AWG9.C
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
PUBLIC  _RIO_ASSIST
PUBLIC  _MINRNG
PUBLIC  _LOCKSHOOT
PUBLIC  _DesigTargCnt
PUBLIC  _DataLinkCnt
PUBLIC  _DataLink
PUBLIC  _SELECTED_BAR_NUM
PUBLIC  _SELECTED_AZ
PUBLIC  _AWG9_REALITY_LEVEL
PUBLIC  _AWG9_MODE
PUBLIC  _MAXRNG
PUBLIC  _RANGES
PUBLIC  _BRANGES
PUBLIC  _NumBars
PUBLIC  _AZSweep
PUBLIC  _RANGE
PUBLIC  _ModerateMode
PUBLIC  _InRangeFlash
EXTRN	_TrgMul:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_absL:NEAR
EXTRN	__aNlmul:NEAR
EXTRN	_itoa:NEAR
EXTRN	_labs:NEAR
EXTRN	_GETTIME:FAR
EXTRN	_GetPlanePtr:NEAR
EXTRN	_GetMissilePtr:NEAR
EXTRN	__aNNalshr:NEAR
EXTRN	__aNNalshl:NEAR
EXTRN	_Aim9Sound:NEAR
EXTRN	__aNuldiv:NEAR
EXTRN	_Dist3D:NEAR
EXTRN	_setjmp:NEAR
EXTRN	_longjmp:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_Rotate:NEAR
EXTRN	_MakeMatHPR:NEAR
EXTRN	_ARCTAN:NEAR
EXTRN	_ARMT_get_priority:NEAR
EXTRN	_Message:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_strcat:NEAR
EXTRN	_abs:NEAR
EXTRN	_Sound:NEAR
EXTRN	_strcpy:NEAR
_BSS      SEGMENT
COMM NEAR	_PDT_RNG:	BYTE:	 2
_BSS      ENDS
EXTRN	_SelectedTarg:WORD
_BSS      SEGMENT
COMM NEAR	_ASPECT_S:	 1:	 5
COMM NEAR	_SHOOT:	BYTE:	 2
COMM NEAR	_ASE_RADIUS:	BYTE:	 2
COMM NEAR	_ntmp:	 1:	 10
COMM NEAR	_PW:	BYTE:	 2
_BSS      ENDS
EXTRN	_Txt:BYTE
_BSS      SEGMENT
COMM NEAR	_PDT_PROJ_X:	BYTE:	 2
COMM NEAR	_PDT_PROJ_Y:	BYTE:	 2
COMM NEAR	_PDT_PROJ:	BYTE:	 2
COMM NEAR	_STEER_DOT_X:	BYTE:	 2
COMM NEAR	_STEER_DOT_Y:	BYTE:	 2
COMM NEAR	_STEER_DOT:	BYTE:	 2
COMM NEAR	_TTI:	BYTE:	 2
COMM NEAR	_CLOSURE:	BYTE:	 2
COMM NEAR	_AWG9_SNIFF:	BYTE:	 2
_BSS      ENDS
EXTRN	_FrameRate:WORD
_BSS      SEGMENT
COMM NEAR	_IFF_timer:	BYTE:	 2
_BSS      ENDS
EXTRN	_TIDTargetCnt:WORD
_BSS      SEGMENT
COMM NEAR	_proj_x:	BYTE:	 2
_BSS      ENDS
EXTRN	_TIDTargetList:BYTE
_BSS      SEGMENT
COMM NEAR	_proj_y:	BYTE:	 2
COMM NEAR	_proj_z:	BYTE:	 2
COMM NEAR	_AZSWEEP:	BYTE:	 2
COMM NEAR	_DESIG_TARG:	 8:	 6
COMM NEAR	_DESIG_TARGF:	BYTE:	 50
COMM NEAR	_PREV_DESIG_TARGF:	BYTE:	 50
COMM NEAR	_TARGFILE0:	 50:	 24
COMM NEAR	_TARGFILE1:	 50:	 24
_BSS      ENDS
EXTRN	_ss:BYTE
_BSS      SEGMENT
COMM NEAR	_TARGFILE:	BYTE:	 2
COMM NEAR	_AGEDTARGFILE:	BYTE:	 2
COMM NEAR	_TARGFILE0CNT:	BYTE:	 2
COMM NEAR	_TARGFILE1CNT:	BYTE:	 2
COMM NEAR	_TARGFILECNT:	BYTE:	 2
_BSS      ENDS
EXTRN	_MODE_AA:WORD
_BSS      SEGMENT
COMM NEAR	_AGEDTARGFILECNT:	BYTE:	 2
_BSS      ENDS
EXTRN	_F14_STATION:BYTE
_BSS      SEGMENT
COMM NEAR	_ACQLIST:	 2:	 48
_BSS      ENDS
EXTRN	_ORDNANCE:BYTE
_BSS      SEGMENT
COMM NEAR	_ACQLISTCNT:	BYTE:	 2
COMM NEAR	_FIRINGORDERLIST:	 2:	 48
_BSS      ENDS
EXTRN	_Alt:WORD
_BSS      SEGMENT
COMM NEAR	_FIRINGORDERCNT:	BYTE:	 2
COMM NEAR	_DETECTED_TARG:	 2:	 70
_BSS      ENDS
EXTRN	_NPLANES:WORD
_BSS      SEGMENT
COMM NEAR	_DataLinkList:	 2:	 8
_BSS      ENDS
EXTRN	_OurPitch:WORD
EXTRN	_ps:BYTE
EXTRN	_OurHead:WORD
_BSS      SEGMENT
COMM NEAR	_AZSWEEP_DIR:	BYTE:	 2
COMM NEAR	_CUR_BAR:	BYTE:	 2
_BSS      ENDS
EXTRN	_Px:WORD
EXTRN	_Py:WORD
EXTRN	_PxLng:DWORD
EXTRN	_PyLng:DWORD
_BSS      SEGMENT
COMM NEAR	_BEAM_HDG:	BYTE:	 2
_BSS      ENDS
EXTRN	_FTicks:WORD
_BSS      SEGMENT
COMM NEAR	_BEAM_PIT:	BYTE:	 2
_BSS      ENDS
EXTRN	_Knots:WORD
_BSS      SEGMENT
COMM NEAR	_BEAM_ROL:	BYTE:	 2
_BSS      ENDS
EXTRN	_VM:BYTE
EXTRN	_FM:BYTE
EXTRN	_LastMisl:WORD
EXTRN	_TB_CTRX:WORD
_BSS      SEGMENT
COMM NEAR	_PLYR_M:	 2:	 9
_BSS      ENDS
EXTRN	_TB_CTRY:WORD
EXTRN	_DisplayFrame:WORD
EXTRN	_MouseCrtX:WORD
EXTRN	_MouseCrtY:WORD
EXTRN	_MouseDsp:WORD
_BSS      SEGMENT
COMM NEAR	_BAD_GUY:	BYTE:	 2
_BSS      ENDS
EXTRN	_CrtDisplays:BYTE
_BSS      SEGMENT
COMM NEAR	_DESIGNATED:	BYTE:	 2
COMM NEAR	_LOCKED:	BYTE:	 2
COMM NEAR	_PDT_ALT_1000:	BYTE:	 2
COMM NEAR	_PDT_ALT_100:	BYTE:	 2
_BSS      ENDS
_DATA      SEGMENT
	ORG	$+156
$SG1133	DB	'T',  00H
$SG1135	DB	'H',  00H
$SG1137	DB	'L',  00H
$SG1138	DB	'R',  00H
	ORG	$+12
$SG1390	DB	'(RIO) Radar Active',  00H
$SG1392	DB	'(RIO) Radar Inactive',  00H
	ORG	$+2
$SG1501	DB	'T',  00H
$SG1503	DB	'H',  00H
$SG1505	DB	'L',  00H
$SG1506	DB	'R',  00H
$SG1516	DB	'(RIO) Target Out of Range',  00H
$SG1525	DB	'(RIO) Target Out of Range',  00H
$SG1728	DB	'(RIO) Bandit Locked Up!',  00H
	ORG	$+2
$SG1785	DB	'(RIO) Take the Shot! Take the Shot!',  00H
$SG1787	DB	'(RIO) Hey watch it! That''s a Friendly!',  00H
	ORG	$-379
$S972_ASE_Tbl	DW	05bH
	DW	058H
	DW	055H
	DW	052H
	DW	04bH
	DW	047H
	DW	03fH
	DW	037H
	DW	02eH
	DW	032H
	DW	039H
	DW	041H
	DW	045H
	DW	049H
	DW	04dH
	DW	053H
	DW	059H
	DW	05fH
	DW	064H
	DW	064H
	DW	05fH
	DW	059H
	DW	053H
	DW	04dH
	DW	049H
	DW	045H
	DW	041H
	DW	037H
	DW	032H
	DW	02eH
	DW	037H
	DW	03fH
	DW	047H
	DW	04bH
	DW	052H
	DW	055H
	DW	058H
	DW	05bH
_SELECTED_BAR_NUM	DW	02H
_SELECTED_AZ	DW	01H
_AWG9_REALITY_LEVEL	DW	02H
_RIO_ASSIST	DW	02H
_AWG9_MODE	DW	00H
_MAXRNG	DW	05H
_MINRNG	DW	00H
_RANGES	DW	05H
	DW	0aH
	DW	014H
	DW	032H
	DW	064H
	DW	0c8H
_BRANGES	DW	0eeH
	DW	01dbH
	DW	03b6H
	DW	0947H
	DW	0128eH
	DW	0251cH
_RANGE	DW	05H
_LOCKSHOOT	DW	01H
$S976_Angles	DW	041H
	DW	02e36H
	DW	028H
	DW	01c70H
	DW	014H
	DW	0e38H
	DW	0aH
	DW	071cH
	DW	05H
	DW	038eH
	DW	03H
	DW	0222H
_DesigTargCnt	DW	00H
_DataLinkCnt	DW	00H
_DataLink	DW	00H
_NumBars	DW	00H
_AZSweep	DW	00H
_ModerateMode	DW	00H
_InRangeFlash	DW	00H
	ORG	$+8
$S1209_srch	DW	064H
$S1210_SpecialMode	DW	00H
$S1299_prevaz	DW	02H
$S1300_prevbar	DW	01H
$S1341_srchmode	DW	00H
$S1370_srchmode	DW	00H
	ORG	$+40
$S1431_MX	DW	0ffffH
	ORG	$+84
$S1717_prev_bad_guy	DW	00H
	ORG	$+76
$S1874_flash	DW	01H
_DATA      ENDS
_BSS      SEGMENT
	ORG	$+54
$S1444_prevdesig	DW 01H DUP (?)
	ORG	$-50
$S1001_ACQ_X	DW 01H DUP (?)
$S1002_ACQ_Y	DW 01H DUP (?)
	ORG	$+42
$S1006_STABLE_HDG	DW 01H DUP (?)
	ORG	$-54
$S1007_STABLE_PIT	DW 01H DUP (?)
	ORG	$+30
$S1008_BEAM_M	DW 09H DUP (?)
	ORG	$-46
$S1010_CVG_MAX	DW 01H DUP (?)
	ORG	$-4
$S1011_CVG_MIN	DW 01H DUP (?)
	ORG	$+52
$S1972_lasttime	DW 01H DUP (?)
	ORG	$-48
$S1012_KNOTS	DW 01H DUP (?)
	ORG	$+18
$S1013_ASPDEG	DW 01H DUP (?)
	ORG	$+18
$S1014_break_mode	DW 01H DUP (?)
	ORG	$-40
$S1020_resetmark	DW 09H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 14
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
; Line 26
; Line 27
; Line 28
; Line 29
; Line 184
	PUBLIC	_AWG9
_AWG9	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 185
	mov	ax,OFFSET DGROUP:$S1020_resetmark
	push	ax
	call	_setjmp
	add	sp,2
; Line 186
	call	_InitMode
; Line 188
	call	set_acq
; Line 189
	call	_CheckAZELChange
; Line 190
	call	_UpdateBeam
; Line 191
	call	_TargetTrack
; Line 192
	call	_UpdateSweep
; Line 193
	call	_SearchForTargets
; Line 194
	cmp	WORD PTR _AWG9_REALITY_LEVEL,0
	je	$I1030
	call	_SpecialModeAcq
; Line 195
$I1030:
	cmp	WORD PTR _RIO_ASSIST,0
	jne	$I1032
	call	_RioLockCheck
; Line 196
$I1032:
	cmp	WORD PTR _AWG9_REALITY_LEVEL,0
	je	$I1034
	cmp	WORD PTR _DataLink,0
	je	$I1034
	call	_CheckDataLink
; Line 197
$I1034:
	call	_FiringOrder
; Line 198
	call	_UpdateTWSSelected
; Line 199
	call	_DetermineShootParams
; Line 200
	jmp	_Aim9Sound
; Line 201
	nop	

_AWG9	ENDP
; Line 206
	PUBLIC	_InitTWSData
_InitTWSData	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	i = -4
;	cnt = -2
; Line 211
	mov	WORD PTR _SelectedTarg,-1
; Line 213
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;cnt
	mov	WORD PTR _DesigTargCnt,ax
	mov	WORD PTR [bp-4],ax	;i
	jmp	SHORT $F1044
$FC1045:
; Line 214
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	cmp	WORD PTR _F14_STATION[bx],15
	jne	$L20155
; Line 215
	mov	cl,3
	mov	bx,WORD PTR [bp-2]	;cnt
	shl	bx,cl
	mov	WORD PTR _DESIG_TARG[bx],0
; Line 217
	mov	ax,-1
	mov	WORD PTR _DESIG_TARG[bx+2],ax
	mov	WORD PTR _DESIG_TARG[bx+4],ax
; Line 218
	mov	ax,WORD PTR [bp-4]	;i
	mov	WORD PTR _DESIG_TARG[bx+6],ax
; Line 219
	inc	WORD PTR [bp-2]	;cnt
; Line 220
; Line 221
$L20155:
	inc	WORD PTR [bp-4]	;i
$F1044:
	cmp	WORD PTR [bp-4],12	;i
	jl	$FC1045
; Line 222
	mov	sp,bp
	pop	bp
	ret	
	nop	

_InitTWSData	ENDP
; Line 226
	PUBLIC	_GetWeaponCount
_GetWeaponCount	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	cnt = -2
;	i = -4
;	type = 4
; Line 229
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;cnt
	mov	WORD PTR [bp-4],ax	;i
	jmp	SHORT $F1053
	nop	
$FC1054:
; Line 230
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	mov	ax,WORD PTR [bp+4]	;type
	cmp	WORD PTR _F14_STATION[bx],ax
	jne	$L20156
	inc	WORD PTR [bp-2]	;cnt
; Line 231
$L20156:
	inc	WORD PTR [bp-4]	;i
$F1053:
	cmp	WORD PTR [bp-4],12	;i
	jl	$FC1054
; Line 232
	mov	ax,WORD PTR [bp-2]	;cnt
; Line 233
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetWeaponCount	ENDP
; Line 238
mode_flip	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	mode = 4
; Line 239
	push	WORD PTR [bp+4]	;mode
	call	_AWG9_CHANGE_MODE
	mov	sp,bp
; Line 240
	mov	ax,-1
	push	ax
	mov	ax,OFFSET DGROUP:$S1020_resetmark
	push	ax
	call	_longjmp
; Line 241
	mov	sp,bp
	pop	bp
	ret	
	nop	

mode_flip	ENDP
; Line 245
	PUBLIC	_InitMode
_InitMode	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 246
	mov	ax,OFFSET DGROUP:_PLYR_M
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR _OurPitch
	mov	cx,WORD PTR _OurHead
	neg	cx
	push	cx
	call	_MakeMatHPR
	add	sp,8
; Line 247
	mov	ax,18
	push	ax
	mov	ax,OFFSET _FM
	push	ax
	mov	ax,OFFSET _VM
	push	ax
	call	_memcpy
	add	sp,6
; Line 249
	call	_ARMT_get_priority
	mov	WORD PTR _PW,ax
; Line 251
	cmp	WORD PTR _IFF_timer,0
	je	$I1064
	dec	WORD PTR _IFF_timer
; Line 252
$I1064:
	cmp	WORD PTR _BAD_GUY,0
	je	$I1065
	dec	WORD PTR _BAD_GUY
; Line 254
$I1065:
	cmp	WORD PTR _LOCKED,-1
	jne	$I1066
$L20157:
	sub	ax,ax
	ret	
; Line 256
	nop	
$I1066:
	cmp	WORD PTR _AWG9_MODE,200
	je	$I1068
	cmp	WORD PTR _AWG9_MODE,202
	jne	$I1067
$I1068:
; Line 257
	call	_StandardReset
	jmp	SHORT $L20157
; Line 259
; Line 260
	nop	
$I1067:
	ret	
	nop	

_InitMode	ENDP
; Line 266
	PUBLIC	_AWG9_ACQ
_AWG9_ACQ	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	flag = 4
; Line 267
	push	WORD PTR [bp+4]	;flag
	call	_aa_acquire
; Line 268
	mov	sp,bp
	pop	bp
	ret	

_AWG9_ACQ	ENDP
; Line 272
	PUBLIC	_AWG9_MODE_BREAK
_AWG9_MODE_BREAK	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 275
	cmp	WORD PTR _AWG9_MODE,300
	je	$I1076
	cmp	WORD PTR _AWG9_MODE,202
	je	$I1076
$L20158:
	sub	ax,ax
	ret	
; Line 278
$I1076:
	cmp	WORD PTR _LOCKED,-1
	je	$L20158
; Line 280
; Line 282
	mov	ax,WORD PTR _AWG9_MODE
	jmp	SHORT $S1078
; Line 283
$SC1082:
; Line 285
	mov	ax,-1
	mov	WORD PTR _DESIGNATED,ax
	mov	WORD PTR _LOCKED,ax
; Line 286
	sub	ax,ax
	push	ax
	call	_AWG9_CHANGE_MODE
	add	sp,2
; Line 287
	ret	
	nop	
$S1078:
	sub	ax,202
	je	$SC1082
	sub	ax,98
	je	$SC1082
; Line 294
	ret	
	nop	

_AWG9_MODE_BREAK	ENDP
; Line 298
	PUBLIC	_AWG9_EL
_AWG9_EL	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	dir = 4
; Line 302
	cmp	WORD PTR _AWG9_MODE,300
	je	$I1088
	cmp	WORD PTR _AWG9_MODE,202
	jne	$I1087
$I1088:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 304
$I1087:
	cmp	WORD PTR _AWG9_MODE,154
	je	$I1088
; Line 305
	cmp	WORD PTR _AWG9_MODE,150
	je	$I1088
; Line 307
	cmp	WORD PTR [bp+4],0	;dir
	je	$I1091
; Line 308
	mov	ax,WORD PTR _BEAM_PIT
	add	ax,364
	cmp	ax,10920
	jge	$I1088
; Line 309
	add	WORD PTR _BEAM_PIT,364
; Line 310
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1091:
; Line 311
	mov	ax,WORD PTR _BEAM_PIT
	sub	ax,364
	cmp	ax,-10920
	jle	$I1088
; Line 312
	sub	WORD PTR _BEAM_PIT,364
; Line 313
; Line 314
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AWG9_EL	ENDP
; Line 318
	PUBLIC	_UpdateTWSSelected
_UpdateTWSSelected	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,56
	call	__aNchkstk
	push	si
;	found = -56
;	i = -54
;	t = -52
;	asp = -2
; Line 319
	mov	WORD PTR [bp-56],-1	;found
; Line 324
	mov	ax,30
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$I1102
	mov	ax,40
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$JCC601
	jmp	$I1101
$JCC601:
$I1102:
; Line 325
	cmp	WORD PTR _SelectedTarg,-1
	jne	$I1103
$L20160:
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 326
$I1103:
	mov	WORD PTR [bp-54],0	;i
	jmp	SHORT $F1104
; Line 330
; Line 331
	nop	
$FC1105:
	inc	WORD PTR [bp-54]	;i
$F1104:
	mov	bx,WORD PTR _TARGFILECNT
	mov	ax,WORD PTR [bp-54]	;i
	cmp	WORD PTR [bx],ax
	jle	$FB1106
; Line 327
	mov	cx,50
	imul	cx
	mov	si,ax
	mov	bx,WORD PTR _TARGFILE
	mov	ax,WORD PTR _SelectedTarg
	cmp	WORD PTR [bx+26][si],ax
	jne	$FC1105
; Line 328
	mov	WORD PTR [bp-56],1	;found
; Line 329
$FB1106:
; Line 332
	mov	WORD PTR [bp-54],0	;i
	jmp	SHORT $F1108
; Line 336
; Line 337
	nop	
$FC1109:
	inc	WORD PTR [bp-54]	;i
$F1108:
	mov	bx,WORD PTR _AGEDTARGFILECNT
	mov	ax,WORD PTR [bp-54]	;i
	cmp	WORD PTR [bx],ax
	jle	$FB1110
; Line 333
	mov	cx,50
	imul	cx
	mov	si,ax
	mov	bx,WORD PTR _AGEDTARGFILE
	mov	ax,WORD PTR _SelectedTarg
	cmp	WORD PTR [bx+26][si],ax
	jne	$FC1109
; Line 334
	mov	WORD PTR [bp-56],1	;found
; Line 335
$FB1110:
; Line 338
	mov	WORD PTR [bp-54],0	;i
	jmp	SHORT $F1112
	nop	
$FC1113:
; Line 339
	mov	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _SelectedTarg
	cmp	WORD PTR _DataLinkList[bx],ax
	jne	$L20161
; Line 340
	mov	WORD PTR [bp-56],2	;found
; Line 341
; Line 342
$L20161:
	inc	WORD PTR [bp-54]	;i
$F1112:
	mov	ax,WORD PTR [bp-54]	;i
	cmp	WORD PTR _DataLinkCnt,ax
	jg	$FC1113
; Line 344
	cmp	WORD PTR [bp-56],-1	;found
	jne	$JCC754
	jmp	$L20160
$JCC754:
; Line 346
	push	WORD PTR _SelectedTarg
	lea	ax,WORD PTR [bp-52]	;t
	push	ax
	call	_SetupNewTarget
	add	sp,4
; Line 347
	lea	ax,WORD PTR [bp-52]	;t
	push	ax
	call	_orient_to_player
	add	sp,2
; Line 348
	lea	ax,WORD PTR [bp-52]	;t
	push	ax
	call	orient_to_beam
	add	sp,2
; Line 353
	cmp	WORD PTR [bp-52],0	;t
	je	$L20001
	mov	ax,WORD PTR [bp-32]
	jmp	SHORT $L20002
$L20001:
	mov	ax,WORD PTR [bp-32]
	mov	cl,5
	sar	ax,cl
$L20002:
	mov	WORD PTR _PDT_RNG,ax
	cmp	ax,WORD PTR _BRANGES
	jg	$I1120
; Line 354
	mov	WORD PTR _RANGE,0
; Line 356
$I1120:
	mov	ax,WORD PTR _BRANGES
	cmp	WORD PTR _PDT_RNG,ax
	jle	$I1121
	mov	ax,WORD PTR _BRANGES+2
	cmp	WORD PTR _PDT_RNG,ax
	jge	$I1121
; Line 357
	mov	WORD PTR _RANGE,1
; Line 359
$I1121:
	mov	ax,WORD PTR _BRANGES+2
	cmp	WORD PTR _PDT_RNG,ax
	jle	$I1122
	mov	ax,WORD PTR _BRANGES+4
	cmp	WORD PTR _PDT_RNG,ax
	jge	$I1122
; Line 360
	mov	WORD PTR _RANGE,2
; Line 362
$I1122:
	mov	ax,WORD PTR _BRANGES+4
	cmp	WORD PTR _PDT_RNG,ax
	jle	$I1123
	mov	ax,WORD PTR _BRANGES+6
	cmp	WORD PTR _PDT_RNG,ax
	jge	$I1123
; Line 363
	mov	WORD PTR _RANGE,3
; Line 365
$I1123:
	mov	ax,WORD PTR _BRANGES+6
	cmp	WORD PTR _PDT_RNG,ax
	jle	$I1124
	mov	ax,WORD PTR _BRANGES+8
	cmp	WORD PTR _PDT_RNG,ax
	jge	$I1124
; Line 366
	mov	WORD PTR _RANGE,4
; Line 368
$I1124:
	mov	ax,WORD PTR _BRANGES+8
	cmp	WORD PTR _PDT_RNG,ax
	jle	$I1125
	mov	ax,WORD PTR _BRANGES+10
	cmp	WORD PTR _PDT_RNG,ax
	jge	$I1125
; Line 369
	mov	WORD PTR _RANGE,5
; Line 371
$I1125:
	mov	ax,WORD PTR _BRANGES+10
	cmp	WORD PTR _PDT_RNG,ax
	jle	$I1126
; Line 372
	mov	WORD PTR _RANGE,5
; Line 376
$I1126:
	mov	ax,40
	imul	WORD PTR _SelectedTarg
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR _Py
	push	ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR _ps[bx+2]
	push	ax
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-2],ax	;asp
; Line 379
	mov	ax,40
	imul	WORD PTR _SelectedTarg
	mov	bx,ax
	mov	ax,-32768
	sub	ax,WORD PTR _ps[bx+16]
	add	WORD PTR [bp-2],ax	;asp
	push	WORD PTR [bp-2]	;asp
	call	_abs
	add	sp,2
	mov	cx,182
	cwd	
	idiv	cx
	add	ax,5
	mov	cx,10
	cwd	
	idiv	cx
	mov	WORD PTR $S1013_ASPDEG,ax
; Line 381
	or	ax,ax
	je	$SC1132
	sub	ax,18
	je	$SC1134
; Line 389
	mov	ax,cx
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR $S1013_ASPDEG
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET DGROUP:_ASPECT_S
	push	ax
	call	_strcpy
	add	sp,4
; Line 390
	cmp	WORD PTR [bp-2],0	;asp
	jle	$L20003
	mov	ax,OFFSET DGROUP:$SG1137
	jmp	SHORT $L20004
; Line 382
$SC1132:
; Line 383
	mov	ax,OFFSET DGROUP:$SG1133
$L20162:
	push	ax
	mov	ax,OFFSET DGROUP:_ASPECT_S
	push	ax
	call	_strcpy
$L20163:
	add	sp,4
; Line 395
	mov	ax,40
	imul	WORD PTR _SelectedTarg
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	call	_AWG9_project
	add	sp,10
	inc	ax
	jne	$I1140
	jmp	$L20160
; Line 385
	nop	
$SC1134:
; Line 386
	mov	ax,OFFSET DGROUP:$SG1135
	jmp	SHORT $L20162
; Line 388
	nop	
$L20003:
	mov	ax,OFFSET DGROUP:$SG1138
$L20004:
	push	ax
	mov	ax,OFFSET DGROUP:_ASPECT_S
	push	ax
	call	_strcat
	jmp	SHORT $L20163
	nop	
$I1140:
	mov	ax,WORD PTR _proj_x
	sub	ax,WORD PTR _TB_CTRX
	mov	WORD PTR _PDT_PROJ_X,ax
; Line 400
	mov	ax,WORD PTR _proj_y
	sub	ax,WORD PTR _TB_CTRY
	mov	WORD PTR _PDT_PROJ_Y,ax
; Line 401
	inc	WORD PTR _PDT_PROJ
; Line 402
; Line 403
$I1101:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_UpdateTWSSelected	ENDP
; Line 407
	PUBLIC	_AWG9_IFF
_AWG9_IFF	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 410
	mov	ax,30
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$I1145
	mov	ax,40
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$JCC1239
	jmp	$I1144
$JCC1239:
$I1145:
; Line 411
	cmp	WORD PTR _SelectedTarg,-1
	jne	$I1146
$L20164:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 412
	nop	
$I1146:
	mov	ax,40
	imul	WORD PTR _SelectedTarg
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],4
	je	$I1147
; Line 413
	mov	ax,WORD PTR _FrameRate
	shl	ax,1
	mov	WORD PTR _IFF_timer,ax
; Line 414
	sub	ax,ax
	push	ax
	mov	cx,1
	push	cx
	mov	cx,14
	push	cx
	call	_Sound
	add	sp,6
; Line 416
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1149
; Line 420
; Line 421
	nop	
	nop	
$FC1150:
	inc	WORD PTR [bp-2]	;i
$F1149:
	mov	bx,WORD PTR _TARGFILECNT
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR [bx],ax
	jle	$FB1151
; Line 417
	mov	cx,50
	imul	cx
	mov	bx,ax
	add	bx,WORD PTR _TARGFILE
	mov	ax,WORD PTR _SelectedTarg
	cmp	WORD PTR [bx+26],ax
	jne	$FC1150
; Line 418
	mov	WORD PTR [bx+48],1
; Line 419
$FB1151:
; Line 422
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1153
; Line 426
; Line 427
	nop	
$FC1154:
	inc	WORD PTR [bp-2]	;i
$F1153:
	mov	bx,WORD PTR _AGEDTARGFILECNT
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR [bx],ax
	jle	$L20164
; Line 423
	mov	cx,50
	imul	cx
	mov	bx,ax
	add	bx,WORD PTR _AGEDTARGFILE
	mov	ax,WORD PTR _SelectedTarg
	cmp	WORD PTR [bx+26],ax
	jne	$FC1154
; Line 424
	mov	WORD PTR [bx+48],1
; Line 428
	jmp	$L20164
	nop	
$I1147:
; Line 429
	mov	ax,WORD PTR _FrameRate
	shl	ax,1
	mov	WORD PTR _BAD_GUY,ax
; Line 430
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1158
; Line 434
; Line 435
	nop	
$FC1159:
	inc	WORD PTR [bp-2]	;i
$F1158:
	mov	bx,WORD PTR _TARGFILECNT
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR [bx],ax
	jle	$FB1160
; Line 431
	mov	cx,50
	imul	cx
	mov	bx,ax
	add	bx,WORD PTR _TARGFILE
	mov	ax,WORD PTR _SelectedTarg
	cmp	WORD PTR [bx+26],ax
	jne	$FC1159
; Line 432
	mov	WORD PTR [bx+48],2
; Line 433
$FB1160:
; Line 436
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1162
; Line 440
; Line 441
	nop	
$FC1163:
	inc	WORD PTR [bp-2]	;i
$F1162:
	mov	bx,WORD PTR _AGEDTARGFILECNT
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR [bx],ax
	jg	$JCC1470
	jmp	$L20164
$JCC1470:
; Line 437
	mov	cx,50
	imul	cx
	mov	bx,ax
	add	bx,WORD PTR _AGEDTARGFILE
	mov	ax,WORD PTR _SelectedTarg
	cmp	WORD PTR [bx+26],ax
	jne	$FC1163
; Line 438
	mov	WORD PTR [bx+48],2
; Line 442
	jmp	$L20164
; Line 444
; Line 447
$I1144:
	cmp	WORD PTR _DESIGNATED,-1
	jne	$JCC1507
	jmp	$L20164
$JCC1507:
; Line 449
	mov	ax,40
	imul	WORD PTR _DESIGNATED
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],4
	jne	$JCC1526
	jmp	$I1167
$JCC1526:
; Line 450
	mov	ax,WORD PTR _FrameRate
	shl	ax,1
	mov	WORD PTR _IFF_timer,ax
; Line 451
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,14
	push	ax
	call	_Sound
	add	sp,6
; Line 452
	cmp	WORD PTR _AWG9_MODE,202
	je	$I1169
	cmp	WORD PTR _AWG9_MODE,300
	jne	$I1170
$I1169:
; Line 453
	mov	WORD PTR _DESIG_TARGF+48,1
; Line 454
	mov	ax,WORD PTR _DESIG_TARGF+26
	cmp	WORD PTR _PREV_DESIG_TARGF+26,ax
	jne	$I1170
; Line 455
	mov	WORD PTR _PREV_DESIG_TARGF+48,1
; Line 457
$I1170:
; Line 458
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1171
; Line 462
; Line 463
$FC1172:
	inc	WORD PTR [bp-2]	;i
$F1171:
	mov	bx,WORD PTR _TARGFILECNT
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR [bx],ax
	jle	$FB1173
; Line 459
	mov	cx,50
	imul	cx
	mov	bx,ax
	add	bx,WORD PTR _TARGFILE
	mov	ax,WORD PTR _DESIGNATED
	cmp	WORD PTR [bx+26],ax
	jne	$FC1172
; Line 460
	mov	WORD PTR [bx+48],1
; Line 461
$FB1173:
; Line 464
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1175
; Line 468
; Line 469
	nop	
$FC1176:
	inc	WORD PTR [bp-2]	;i
$F1175:
	mov	bx,WORD PTR _AGEDTARGFILECNT
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR [bx],ax
	jg	$JCC1658
	jmp	$FB1189
$JCC1658:
; Line 465
	mov	cx,50
	imul	cx
	mov	bx,ax
	add	bx,WORD PTR _AGEDTARGFILE
	mov	ax,WORD PTR _DESIGNATED
	cmp	WORD PTR [bx+26],ax
	jne	$FC1176
; Line 466
	mov	WORD PTR [bx+48],1
; Line 470
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1167:
; Line 471
	mov	ax,WORD PTR _FrameRate
	shl	ax,1
	mov	WORD PTR _BAD_GUY,ax
; Line 472
	cmp	WORD PTR _AWG9_MODE,202
	je	$I1181
	cmp	WORD PTR _AWG9_MODE,300
	jne	$I1182
$I1181:
; Line 473
	mov	WORD PTR _DESIG_TARGF+48,2
; Line 474
	mov	ax,WORD PTR _DESIG_TARGF+26
	cmp	WORD PTR _PREV_DESIG_TARGF+26,ax
	jne	$I1182
; Line 475
	mov	WORD PTR _PREV_DESIG_TARGF+48,2
; Line 476
$I1182:
; Line 477
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1183
; Line 481
; Line 482
$FC1184:
	inc	WORD PTR [bp-2]	;i
$F1183:
	mov	bx,WORD PTR _TARGFILECNT
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR [bx],ax
	jle	$FB1185
; Line 478
	mov	cx,50
	imul	cx
	mov	bx,ax
	add	bx,WORD PTR _TARGFILE
	mov	ax,WORD PTR _DESIGNATED
	cmp	WORD PTR [bx+26],ax
	jne	$FC1184
; Line 479
	mov	WORD PTR [bx+48],2
; Line 480
$FB1185:
; Line 483
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1187
; Line 487
; Line 488
	nop	
$FC1188:
	inc	WORD PTR [bp-2]	;i
$F1187:
	mov	bx,WORD PTR _AGEDTARGFILECNT
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR [bx],ax
	jle	$FB1189
; Line 484
	mov	cx,50
	imul	cx
	mov	bx,ax
	add	bx,WORD PTR _AGEDTARGFILE
	mov	ax,WORD PTR _DESIGNATED
	cmp	WORD PTR [bx+26],ax
	jne	$FC1188
; Line 485
	mov	WORD PTR [bx+48],2
; Line 486
$FB1189:
; Line 489
; Line 490
	mov	sp,bp
	pop	bp
	ret	

_AWG9_IFF	ENDP
; Line 494
	PUBLIC	_AWG9_INIT
_AWG9_INIT	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 495
	call	_InitTWSData
; Line 497
	cmp	WORD PTR _Alt,20
	jbe	$I1193
; Line 498
$L20166:
	mov	WORD PTR _AWG9_SNIFF,0
; Line 499
	jmp	SHORT $I1196
	nop	
$I1193:
; Line 500
	cmp	WORD PTR _AWG9_REALITY_LEVEL,0
	je	$L20166
; Line 503
	mov	WORD PTR _AWG9_SNIFF,1
$I1196:
; Line 504
; Line 506
	mov	ax,WORD PTR _AWG9_REALITY_LEVEL
	jmp	SHORT $S1197
; Line 507
$SC1201:
; Line 508
	mov	ax,200
$L20165:
	push	ax
	call	_AWG9_CHANGE_MODE
	add	sp,2
; Line 509
	jmp	SHORT $SB1198
; Line 510
$SC1202:
; Line 511
	mov	ax,100
	jmp	SHORT $L20165
; Line 513
	nop	
$SC1203:
; Line 514
	mov	ax,106
	jmp	SHORT $L20165
	nop	
$S1197:
	or	ax,ax
	je	$SC1201
	dec	ax
	je	$SC1202
	dec	ax
	je	$SC1203
$SB1198:
; Line 518
	mov	WORD PTR _SelectedTarg,-1
; Line 523
	sub	ax,ax
	mov	WORD PTR _LOCKSHOOT,ax
	mov	WORD PTR _AZSWEEP,ax
	mov	WORD PTR _AZSWEEP_DIR,ax
	mov	WORD PTR _IFF_timer,ax
	mov	WORD PTR _BAD_GUY,ax
; Line 524
	cmp	WORD PTR _AWG9_MODE,200
	je	$I1204
	call	_ResetBar
; Line 525
$I1204:
	ret	
	nop	

_AWG9_INIT	ENDP
; Line 529
	PUBLIC	_AWG9_CHANGE_MODE
_AWG9_CHANGE_MODE	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	reset = -2
;	mode = 4
; Line 534
	mov	ax,WORD PTR [bp+4]	;mode
	cmp	WORD PTR _AWG9_MODE,ax
	jne	$I1211
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 537
$I1211:
	sub	ax,ax
	mov	WORD PTR _PREV_DESIG_TARGF+36,ax
	mov	WORD PTR _PREV_DESIG_TARGF+34,ax
; Line 538
	mov	WORD PTR _PREV_DESIG_TARGF+40,ax
	mov	WORD PTR _PREV_DESIG_TARGF+38,ax
; Line 540
	mov	WORD PTR _PREV_DESIG_TARGF+42,ax
	mov	WORD PTR _PREV_DESIG_TARGF+48,ax
; Line 542
	call	_InitTWSData
; Line 544
	cmp	WORD PTR _AWG9_REALITY_LEVEL,0
	jne	$I1213
; Line 545
	cmp	WORD PTR [bp+4],202	;mode
	je	$I1213
	cmp	WORD PTR [bp+4],200	;mode
	je	$I1213
	cmp	WORD PTR [bp+4],0	;mode
	je	$I1213
; Line 546
	mov	WORD PTR [bp+4],200	;mode
; Line 547
$I1213:
; Line 551
	mov	ax,WORD PTR [bp+4]	;mode
	cmp	ax,60
	jne	$JCC2029
	jmp	$SC1258
$JCC2029:
	jbe	$JCC2034
	jmp	$SB1215
$JCC2034:
	cmp	al,30
	jne	$JCC2041
	jmp	$SC1238
$JCC2041:
	jle	$JCC2046
	jmp	$L20005
$JCC2046:
	or	al,al
	jne	$JCC2053
	jmp	$SC1265
$JCC2053:
	sub	al,20
	je	$SC1228
	jmp	$SB1215
; Line 552
	nop	
$SC1218:
; Line 553
	cmp	WORD PTR _AWG9_REALITY_LEVEL,1
	jne	$SB1221
; Line 555
	mov	ax,WORD PTR _ModerateMode
	or	ax,ax
	je	$SC1224
	dec	ax
	je	$SC1225
	dec	ax
	je	$SC1226
	jmp	SHORT $SB1221
; Line 556
$SC1224:
; Line 557
	mov	WORD PTR [bp+4],114	;mode
; Line 558
$SB1221:
; Line 566
; Line 567
	cmp	WORD PTR _AWG9_REALITY_LEVEL,2
	je	$JCC2098
	jmp	$SB1215
$JCC2098:
; Line 568
	mov	WORD PTR [bp+4],116	;mode
; Line 569
; Line 570
	jmp	$SB1215
; Line 559
	nop	
$SC1225:
; Line 560
	mov	WORD PTR [bp+4],112	;mode
; Line 561
	jmp	SHORT $SB1221
; Line 562
	nop	
$SC1226:
; Line 563
	mov	WORD PTR [bp+4],110	;mode
; Line 564
	jmp	SHORT $SB1221
; Line 572
	nop	
$SC1228:
; Line 573
	cmp	WORD PTR _AWG9_REALITY_LEVEL,1
	jne	$SB1231
; Line 575
	mov	ax,WORD PTR _ModerateMode
	or	ax,ax
	je	$SC1234
	dec	ax
	je	$SC1235
	dec	ax
	je	$SC1236
	jmp	SHORT $SB1231
; Line 576
$SC1234:
; Line 577
	mov	WORD PTR [bp+4],104	;mode
; Line 578
$SB1231:
; Line 586
; Line 587
	cmp	WORD PTR _AWG9_REALITY_LEVEL,2
	je	$JCC2160
	jmp	$SB1215
$JCC2160:
; Line 588
	mov	WORD PTR [bp+4],106	;mode
; Line 589
; Line 590
	jmp	$SB1215
; Line 579
	nop	
$SC1235:
; Line 580
	mov	WORD PTR [bp+4],102	;mode
; Line 581
	jmp	SHORT $SB1231
; Line 582
	nop	
$SC1236:
; Line 583
	mov	WORD PTR [bp+4],100	;mode
; Line 584
	jmp	SHORT $SB1231
; Line 591
	nop	
$SC1238:
; Line 592
	cmp	WORD PTR _AWG9_REALITY_LEVEL,1
	jne	$SB1242
; Line 593
	cmp	WORD PTR _ModerateMode,2
	jne	$I1240
	mov	WORD PTR _ModerateMode,0
; Line 594
$I1240:
	mov	ax,WORD PTR _ModerateMode
	or	ax,ax
	je	$SC1245
	dec	ax
	je	$SC1246
	jmp	SHORT $SB1242
; Line 595
$SC1245:
; Line 596
	mov	WORD PTR [bp+4],124	;mode
; Line 597
$SB1242:
; Line 602
; Line 603
	cmp	WORD PTR _AWG9_REALITY_LEVEL,2
	je	$JCC2232
	jmp	$SB1215
$JCC2232:
; Line 604
	mov	WORD PTR [bp+4],126	;mode
; Line 605
; Line 606
	jmp	SHORT $SB1215
; Line 598
	nop	
	nop	
$SC1246:
; Line 599
	mov	WORD PTR [bp+4],122	;mode
; Line 600
	jmp	SHORT $SB1242
; Line 608
	nop	
$SC1248:
; Line 609
	cmp	WORD PTR _AWG9_REALITY_LEVEL,1
	jne	$SB1252
; Line 610
	cmp	WORD PTR _ModerateMode,2
	jne	$I1250
	mov	WORD PTR _ModerateMode,0
; Line 611
$I1250:
	mov	ax,WORD PTR _ModerateMode
	or	ax,ax
	je	$SC1255
	dec	ax
	je	$SC1256
	jmp	SHORT $SB1252
; Line 612
$SC1255:
; Line 613
	mov	WORD PTR [bp+4],134	;mode
; Line 614
$SB1252:
; Line 619
; Line 620
	cmp	WORD PTR _AWG9_REALITY_LEVEL,2
	jne	$SB1215
; Line 621
	mov	WORD PTR [bp+4],136	;mode
; Line 622
; Line 623
	jmp	SHORT $SB1215
; Line 615
	nop	
$SC1256:
; Line 616
	mov	WORD PTR [bp+4],132	;mode
; Line 617
	jmp	SHORT $SB1252
; Line 625
	nop	
$SC1258:
; Line 627
	xor	BYTE PTR $S1210_SpecialMode,1
	mov	ax,WORD PTR $S1210_SpecialMode
	or	ax,ax
	je	$SC1263
	dec	ax
	je	$SC1264
	jmp	SHORT $SB1215
; Line 628
	nop	
$SC1263:
; Line 629
	mov	WORD PTR [bp+4],150	;mode
; Line 635
	jmp	SHORT $SB1215
; Line 631
	nop	
$SC1264:
; Line 632
	mov	WORD PTR [bp+4],154	;mode
; Line 633
	jmp	SHORT $SB1215
; Line 637
	nop	
$SC1265:
; Line 638
	cmp	WORD PTR _AWG9_REALITY_LEVEL,0
	jne	$I1266
; Line 639
	mov	WORD PTR $S1014_break_mode,200
; Line 640
$I1266:
	mov	ax,WORD PTR $S1014_break_mode
	mov	WORD PTR [bp+4],ax	;mode
; Line 641
$SB1215:
; Line 644
	mov	WORD PTR [bp-2],0	;reset
; Line 645
	mov	ax,WORD PTR [bp+4]	;mode
	mov	WORD PTR _AWG9_MODE,ax
; Line 647
	cmp	ax,122
	jne	$JCC2381
	jmp	$SC1282
$JCC2381:
	jbe	$JCC2386
	jmp	$L20006
$JCC2386:
	cmp	ax,116
	jne	$JCC2394
	jmp	$SC1279
$JCC2394:
	ja	$SB1268
	cmp	al,104
	jne	$JCC2403
	jmp	$SC1275
$JCC2403:
	jbe	$JCC2408
	jmp	$L20007
$JCC2408:
	sub	al,30
	jne	$JCC2415
	jmp	$SC1290
$JCC2415:
	sub	al,10
	jne	$JCC2422
	jmp	$SC1289
$JCC2422:
	sub	al,60
	jne	$JCC2429
	jmp	$SC1273
$JCC2429:
	sub	al,2
	jne	$JCC2436
	jmp	$SC1274
$JCC2436:
	jmp	SHORT $SB1268
	nop	
$L20005:
	sub	al,40
	jne	$JCC2446
	jmp	$SC1248
$JCC2446:
	sub	al,10
	jne	$JCC2453
	jmp	$SC1218
$JCC2453:
	jmp	SHORT $SB1215
; Line 648
$SC1271:
; Line 649
	mov	WORD PTR [bp-2],1	;reset
; Line 650
	mov	ax,WORD PTR _AWG9_MODE
	mov	WORD PTR $S1014_break_mode,ax
; Line 652
	mov	ax,-1
	mov	WORD PTR _LOCKED,ax
	mov	WORD PTR _DESIGNATED,ax
; Line 654
	sub	ax,ax
	mov	WORD PTR _BEAM_HDG,ax
	mov	WORD PTR _SELECTED_AZ,ax
; Line 655
	mov	WORD PTR _SELECTED_BAR_NUM,2
; Line 656
$SB1268:
; Line 859
	push	WORD PTR _BEAM_PIT
	call	_abs
	add	sp,2
	mov	cx,182
	mov	dx,ax
	mov	ax,419
	mov	bx,dx
	imul	WORD PTR _SELECTED_BAR_NUM
	cwd	
	idiv	cx
	mov	dx,ax
	mov	ax,bx
	mov	bx,dx
	cwd	
	idiv	cx
	cmp	ax,bx
	jle	$I1292
; Line 863
	mov	WORD PTR _BEAM_PIT,0
; Line 864
; Line 867
$I1292:
	cmp	WORD PTR [bp-2],0	;reset
	je	$I1293
; Line 868
	call	_ClearTargetFile
; Line 869
	mov	ax,33
	push	ax
	mov	ax,41
	push	ax
	call	acquire
	add	sp,4
; Line 870
; Line 873
$I1293:
	push	WORD PTR _AZSWEEP
	call	_abs
	add	sp,2
	mov	bx,WORD PTR _SELECTED_AZ
	shl	bx,1
	shl	bx,1
	cmp	WORD PTR $S976_Angles[bx],ax
	jl	$JCC2585
	jmp	$I1296
$JCC2585:
; Line 874
	cmp	WORD PTR _AZSWEEP,0
	jg	$JCC2595
	jmp	$L20009
$JCC2595:
	mov	bx,WORD PTR _SELECTED_AZ
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR $S976_Angles[bx]
	jmp	$L20010
; Line 658
	nop	
$SC1272:
; Line 659
	mov	WORD PTR [bp-2],1	;reset
; Line 660
	mov	ax,WORD PTR _DESIGNATED
	mov	WORD PTR _LOCKED,ax
; Line 661
	jmp	$SB1268
; Line 663
$SC1273:
; Line 664
	mov	WORD PTR [bp-2],1	;reset
; Line 666
	mov	ax,WORD PTR _AWG9_MODE
	mov	WORD PTR $S1014_break_mode,ax
	mov	WORD PTR $S1209_srch,ax
; Line 668
	mov	WORD PTR _SELECTED_BAR_NUM,2
; Line 669
	sub	ax,ax
	mov	WORD PTR _SELECTED_AZ,ax
	mov	WORD PTR _BEAM_HDG,ax
; Line 671
$L20168:
	mov	ax,-1
	mov	WORD PTR _LOCKED,ax
	mov	WORD PTR _DESIGNATED,ax
; Line 672
	jmp	$SB1268
; Line 674
$SC1274:
; Line 677
	mov	ax,WORD PTR _AWG9_MODE
	mov	WORD PTR $S1014_break_mode,ax
	mov	WORD PTR $S1209_srch,ax
; Line 678
	mov	ax,1
	mov	WORD PTR [bp-2],ax	;reset
	mov	WORD PTR _SELECTED_AZ,ax
; Line 679
$L20175:
	mov	WORD PTR _SELECTED_BAR_NUM,4
; Line 680
$L20169:
	mov	WORD PTR _BEAM_HDG,0
	jmp	SHORT $L20168
; Line 685
$SC1275:
; Line 686
	mov	WORD PTR [bp-2],1	;reset
; Line 688
	mov	ax,WORD PTR _AWG9_MODE
	mov	WORD PTR $S1014_break_mode,ax
	mov	WORD PTR $S1209_srch,ax
; Line 689
	mov	WORD PTR _SELECTED_AZ,2
; Line 690
	mov	WORD PTR _SELECTED_BAR_NUM,8
	jmp	SHORT $L20169
$SC1279:
; Line 730
	mov	WORD PTR [bp-2],1	;reset
; Line 732
	mov	ax,WORD PTR _AWG9_MODE
	mov	WORD PTR $S1014_break_mode,ax
	mov	WORD PTR $S1209_srch,ax
	jmp	SHORT $L20169
$SC1282:
; Line 759
	mov	ax,WORD PTR _AWG9_MODE
	mov	WORD PTR $S1014_break_mode,ax
	mov	WORD PTR $S1209_srch,ax
; Line 760
	mov	ax,1
	mov	WORD PTR [bp-2],ax	;reset
	mov	WORD PTR _SELECTED_AZ,ax
; Line 761
	mov	WORD PTR _SELECTED_BAR_NUM,2
	jmp	SHORT $L20169
$SC1286:
; Line 799
	mov	WORD PTR [bp-2],1	;reset
; Line 801
	mov	ax,WORD PTR _AWG9_MODE
	mov	WORD PTR $S1014_break_mode,ax
	mov	WORD PTR $S1209_srch,ax
; Line 802
	mov	WORD PTR _SELECTED_AZ,2
	jmp	SHORT $L20175
; Line 809
$SC1287:
; Line 810
	mov	WORD PTR [bp-2],1	;reset
; Line 811
	mov	ax,WORD PTR _AWG9_MODE
	mov	WORD PTR $S1014_break_mode,ax
; Line 812
	mov	WORD PTR _BEAM_HDG,7280
	jmp	$L20168
; Line 817
$SC1288:
; Line 818
	mov	WORD PTR [bp-2],1	;reset
; Line 819
	mov	ax,WORD PTR _AWG9_MODE
	mov	WORD PTR $S1014_break_mode,ax
	jmp	$L20169
; Line 825
$SC1289:
; Line 828
	mov	ax,-1
	mov	WORD PTR _DESIGNATED,ax
	mov	WORD PTR _LOCKED,ax
; Line 829
	mov	ax,1
	mov	WORD PTR [bp-2],ax	;reset
	mov	WORD PTR _SELECTED_AZ,ax
; Line 830
	mov	WORD PTR _SELECTED_BAR_NUM,2
; Line 831
	mov	ax,WORD PTR _OurHead
	mov	WORD PTR $S1006_STABLE_HDG,ax
; Line 832
	mov	ax,WORD PTR _OurPitch
$L20177:
	mov	WORD PTR $S1007_STABLE_PIT,ax
; Line 833
	mov	cx,120
	mov	ax,WORD PTR $S1001_ACQ_X
	sub	ax,41
	imul	cx
	mov	cx,83
	cwd	
	idiv	cx
	mov	cx,182
	imul	cx
	mov	WORD PTR _BEAM_HDG,ax
; Line 834
	jmp	$SB1268
; Line 836
$SC1290:
; Line 840
	mov	ax,-1
	mov	WORD PTR _DESIGNATED,ax
	mov	WORD PTR _LOCKED,ax
; Line 841
	mov	ax,OFFSET DGROUP:_PLYR_M
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR _OurPitch
	mov	ax,WORD PTR _OurHead
	neg	ax
	push	ax
	call	_MakeMatHPR
	add	sp,8
; Line 842
	push	WORD PTR _DESIGNATED
	mov	ax,OFFSET DGROUP:_DESIG_TARGF
	push	ax
	call	_SetupNewTarget
	add	sp,4
; Line 843
	mov	ax,OFFSET DGROUP:_DESIG_TARGF
	push	ax
	call	_orient_to_player
	add	sp,2
; Line 844
	mov	ax,1
	mov	WORD PTR [bp-2],ax	;reset
	mov	WORD PTR _SELECTED_AZ,ax
; Line 845
	mov	WORD PTR _SELECTED_BAR_NUM,2
; Line 846
	push	WORD PTR _DESIG_TARGF+12
	push	WORD PTR _DESIG_TARGF+8
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR $S1006_STABLE_HDG,ax
; Line 847
	push	WORD PTR _DESIG_TARGF+12
	push	WORD PTR _DESIG_TARGF+10
	call	_ARCTAN
	add	sp,4
	neg	ax
	jmp	$L20177
	nop	
$L20007:
	sub	al,106
	jne	$JCC3002
	jmp	$SC1279
$JCC3002:
	sub	al,4
	jne	$JCC3009
	jmp	$SC1273
$JCC3009:
	sub	al,2
	jne	$JCC3016
	jmp	$SC1274
$JCC3016:
	sub	al,2
	jne	$JCC3023
	jmp	$SC1275
$JCC3023:
	jmp	$SB1268
	nop	
$L20006:
	cmp	ax,136
	jne	$JCC3035
	jmp	$SC1279
$JCC3035:
	ja	$L20008
	cmp	ax,134
	jne	$JCC3045
	jmp	$SC1286
$JCC3045:
	jbe	$JCC3050
	jmp	$SB1268
$JCC3050:
	sub	al,124
	jne	$JCC3057
	jmp	$SC1286
$JCC3057:
	sub	al,2
	jne	$JCC3064
	jmp	$SC1279
$JCC3064:
	sub	al,6
	jne	$JCC3071
	jmp	$SC1282
$JCC3071:
	jmp	$SB1268
	nop	
$L20008:
	sub	ax,150
	jne	$JCC3083
	jmp	$SC1287
$JCC3083:
	sub	ax,4
	jne	$JCC3091
	jmp	$SC1288
$JCC3091:
	sub	ax,46
	jne	$JCC3099
	jmp	$SC1271
$JCC3099:
	dec	ax
	dec	ax
	jne	$JCC3106
	jmp	$SC1272
$JCC3106:
	sub	ax,98
	jne	$JCC3114
	jmp	$SC1272
$JCC3114:
	jmp	$SB1268
$L20009:
	mov	bx,WORD PTR _SELECTED_AZ
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR $S976_Angles[bx]
	neg	ax
$L20010:
	mov	WORD PTR _AZSWEEP,ax
; Line 875
$I1296:
	mov	ax,WORD PTR _CUR_BAR
	cmp	WORD PTR _SELECTED_BAR_NUM,ax
	jge	$I1297
; Line 876
	mov	ax,WORD PTR _SELECTED_BAR_NUM
	dec	ax
	mov	WORD PTR _CUR_BAR,ax
; Line 877
$I1297:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AWG9_CHANGE_MODE	ENDP
; Line 881
	PUBLIC	_CheckAZELChange
_CheckAZELChange	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 885
	mov	ax,WORD PTR $S1299_prevaz
	cmp	WORD PTR _SELECTED_AZ,ax
	jne	$I1302
	mov	ax,WORD PTR $S1300_prevbar
	cmp	WORD PTR _SELECTED_BAR_NUM,ax
	je	$I1306
$I1302:
; Line 888
	mov	ax,33
	push	ax
	mov	ax,41
	push	ax
	call	acquire
	add	sp,4
; Line 892
	push	WORD PTR _AZSWEEP
	call	_abs
	add	sp,2
	mov	bx,WORD PTR _SELECTED_AZ
	shl	bx,1
	shl	bx,1
	cmp	WORD PTR $S976_Angles[bx],ax
	jge	$I1303
; Line 893
	cmp	WORD PTR _AZSWEEP,0
	jle	$L20011
	mov	bx,WORD PTR _SELECTED_AZ
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR $S976_Angles[bx]
	jmp	SHORT $L20012
	nop	
	nop	
$L20011:
	mov	bx,WORD PTR _SELECTED_AZ
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR $S976_Angles[bx]
	neg	ax
$L20012:
	mov	WORD PTR _AZSWEEP,ax
; Line 896
$I1303:
	mov	ax,WORD PTR _CUR_BAR
	cmp	WORD PTR _SELECTED_BAR_NUM,ax
	jge	$I1304
; Line 897
	mov	ax,WORD PTR _SELECTED_BAR_NUM
	dec	ax
	mov	WORD PTR _CUR_BAR,ax
; Line 899
$I1304:
	mov	ax,WORD PTR $S1299_prevaz
	cmp	WORD PTR _SELECTED_AZ,ax
	je	$I1305
; Line 900
	mov	ax,WORD PTR _SELECTED_AZ
	mov	WORD PTR $S1299_prevaz,ax
; Line 901
$I1305:
	mov	ax,WORD PTR $S1300_prevbar
	cmp	WORD PTR _SELECTED_BAR_NUM,ax
	je	$I1306
; Line 902
	mov	ax,WORD PTR _SELECTED_BAR_NUM
	mov	WORD PTR $S1300_prevbar,ax
; Line 903
$I1306:
; Line 904
	ret	

_CheckAZELChange	ENDP
; Line 910
	PUBLIC	_ClearTargetFile
_ClearTargetFile	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 912
	sub	ax,ax
	mov	WORD PTR _TARGFILE0CNT,ax
	mov	WORD PTR _TARGFILE1CNT,ax
; Line 914
	mov	WORD PTR _TARGFILECNT,OFFSET DGROUP:_TARGFILE0CNT
; Line 915
	mov	WORD PTR _AGEDTARGFILECNT,OFFSET DGROUP:_TARGFILE1CNT
; Line 917
	mov	WORD PTR _TARGFILE,OFFSET DGROUP:_TARGFILE0
; Line 918
	mov	WORD PTR _AGEDTARGFILE,OFFSET DGROUP:_TARGFILE1
; Line 919
	ret	

_ClearTargetFile	ENDP
; Line 923
	PUBLIC	_CheckMode
_CheckMode	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	mastermode = 6
;	mode = 4
; Line 924
	mov	ax,WORD PTR [bp+6]	;mastermode
	jmp	SHORT $S1311
; Line 925
	nop	
$SC1315:
; Line 928
	cmp	WORD PTR _AWG9_MODE,126
	je	$I1317
	cmp	WORD PTR _AWG9_MODE,122
	je	$I1317
	cmp	WORD PTR _AWG9_MODE,124
$L20178:
	jne	$SB1312
$I1317:
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
$SC1318:
; Line 933
	cmp	WORD PTR _AWG9_MODE,136
	je	$I1317
	cmp	WORD PTR _AWG9_MODE,132
	je	$I1317
	cmp	WORD PTR _AWG9_MODE,134
	jmp	SHORT $L20178
$SC1321:
; Line 939
	cmp	WORD PTR _AWG9_MODE,116
	je	$I1317
	cmp	WORD PTR _AWG9_MODE,110
	je	$I1317
	cmp	WORD PTR _AWG9_MODE,112
	je	$I1317
	cmp	WORD PTR _AWG9_MODE,114
	jmp	SHORT $L20178
$S1311:
	cmp	ax,50
	je	$SC1321
	ja	$SB1312
	sub	al,30
	je	$SC1315
	sub	al,10
	je	$SC1318
$SB1312:
; Line 941
	sub	ax,ax
; Line 942
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CheckMode	ENDP
; Line 946
	PUBLIC	_AWG9_LOCK
_AWG9_LOCK	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
;	xmin = -8
;	xmax = -12
;	ymin = -10
;	ymax = -14
;	i = -4
;	new = -6
;	t = -2
; Line 950
	cmp	WORD PTR _AWG9_MODE,200
	je	$I1334
	cmp	WORD PTR _AWG9_MODE,202
	jne	$I1333
$I1334:
; Line 951
	sub	ax,ax
	push	ax
	call	_AWG9_ACQ
	add	sp,2
; Line 952
$L20179:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 953
; Line 955
$I1333:
	mov	ax,30
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$L20179
	mov	ax,40
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$L20179
; Line 958
; Line 960
	cmp	WORD PTR _DESIGNATED,-1
	je	$L20179
; Line 961
	mov	ax,WORD PTR _DESIGNATED
	mov	WORD PTR _LOCKED,ax
; Line 963
	mov	ax,300
	push	ax
	call	_AWG9_CHANGE_MODE
; Line 964
	mov	sp,bp
	pop	bp
	ret	

_AWG9_LOCK	ENDP
; Line 969
	PUBLIC	_ChangeModerateScan
_ChangeModerateScan	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
;	mode = 4
; Line 972
	mov	ax,WORD PTR _AWG9_MODE
	cmp	ax,134
	je	$SC1346
	ja	$SB1343
	sub	al,122
	je	$SC1346
	sub	al,2
	je	$SC1346
	sub	al,8
	jne	$SB1343
; Line 973
$SC1346:
; Line 977
	cmp	WORD PTR $S1341_srchmode,2
	jne	$SB1343
	mov	WORD PTR $S1341_srchmode,0
; Line 978
$SB1343:
; Line 981
	mov	ax,WORD PTR $S1341_srchmode
	or	ax,ax
	je	$SC1352
	dec	ax
	je	$SC1353
	dec	ax
	je	$SC1354
	jmp	SHORT $SB1349
; Line 982
	nop	
$SC1352:
; Line 983
	mov	WORD PTR _ModerateMode,1
; Line 984
$SB1349:
; Line 993
	mov	ax,WORD PTR _AWG9_MODE
	jmp	SHORT $S1355
; Line 985
	nop	
$SC1353:
; Line 986
	mov	WORD PTR _ModerateMode,2
; Line 987
	jmp	SHORT $SB1349
; Line 988
$SC1354:
; Line 989
	mov	WORD PTR _ModerateMode,0
; Line 990
	jmp	SHORT $SB1349
; Line 994
$SC1359:
; Line 996
	cmp	WORD PTR $S1341_srchmode,0
	je	$I1360
; Line 997
	mov	WORD PTR _ModerateMode,0
; Line 998
	jmp	SHORT $I1361
	nop	
$I1360:
; Line 999
	mov	WORD PTR _ModerateMode,1
$I1361:
; Line 1000
	mov	ax,30
$L20180:
	push	ax
	call	_AWG9_CHANGE_MODE
	add	sp,2
; Line 1001
	jmp	SHORT $SB1356
; Line 1002
$SC1362:
; Line 1004
	cmp	WORD PTR $S1341_srchmode,0
	je	$I1363
; Line 1005
	mov	WORD PTR _ModerateMode,0
; Line 1006
	jmp	SHORT $I1364
	nop	
$I1363:
; Line 1007
	mov	WORD PTR _ModerateMode,1
$I1364:
; Line 1008
	mov	ax,40
	jmp	SHORT $L20180
; Line 1010
	nop	
$SC1365:
; Line 1013
	mov	ax,20
	jmp	SHORT $L20180
; Line 1015
	nop	
$SC1366:
; Line 1018
	mov	ax,50
	jmp	SHORT $L20180
	nop	
$S1355:
	sub	ax,100
	test	al,1
	jne	$SB1356
	cmp	ax,34
	ja	$SB1356
	xchg	ax,bx
	jmp	WORD PTR cs:$L20013[bx]
$L20013:
		DW	$SC1365
		DW	$SC1365
		DW	$SC1365
		DW	$SB1356
		DW	$SB1356
		DW	$SC1366
		DW	$SC1366
		DW	$SC1366
		DW	$SB1356
		DW	$SB1356
		DW	$SB1356
		DW	$SC1359
		DW	$SC1359
		DW	$SB1356
		DW	$SB1356
		DW	$SB1356
		DW	$SC1362
		DW	$SC1362
$SB1356:
; Line 1021
	mov	ax,WORD PTR _ModerateMode
	mov	WORD PTR $S1341_srchmode,ax
; Line 1022
	ret	
	nop	

_ChangeModerateScan	ENDP
; Line 1028
	PUBLIC	_ChangeSRCHMode
_ChangeSRCHMode	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	tempmode = -2
;	mode = 4
; Line 1032
	cmp	WORD PTR [bp+4],-1	;mode
	jne	$I1372
; Line 1033
	mov	ax,WORD PTR $S1370_srchmode
	jmp	SHORT $S1373
; Line 1034
$SC1377:
; Line 1035
	mov	ax,20
	push	ax
	call	_AWG9_CHANGE_MODE
	add	sp,2
; Line 1036
	mov	WORD PTR [bp-2],1	;tempmode
; Line 1037
	jmp	SHORT $SB1374
; Line 1038
	nop	
$SC1378:
; Line 1039
	mov	ax,40
	push	ax
	call	_AWG9_CHANGE_MODE
	add	sp,2
; Line 1040
	mov	WORD PTR [bp-2],2	;tempmode
; Line 1041
	jmp	SHORT $SB1374
; Line 1042
	nop	
$SC1379:
; Line 1043
	mov	ax,30
	push	ax
	call	_AWG9_CHANGE_MODE
	add	sp,2
; Line 1044
	mov	WORD PTR [bp-2],3	;tempmode
; Line 1045
	jmp	SHORT $SB1374
; Line 1046
	nop	
$SC1380:
; Line 1047
	mov	ax,50
	push	ax
	call	_AWG9_CHANGE_MODE
	add	sp,2
; Line 1048
	mov	WORD PTR [bp-2],0	;tempmode
; Line 1049
	jmp	SHORT $SB1374
	nop	
$S1373:
	or	ax,ax
	je	$SC1377
	dec	ax
	je	$SC1378
	dec	ax
	je	$SC1379
	dec	ax
	je	$SC1380
$SB1374:
; Line 1051
	mov	ax,WORD PTR [bp-2]	;tempmode
	mov	WORD PTR $S1370_srchmode,ax
; Line 1052
; Line 1054
$I1372:
	cmp	WORD PTR [bp+4],0	;mode
	jne	$I1381
; Line 1055
	mov	ax,20
	push	ax
	call	_AWG9_CHANGE_MODE
	add	sp,2
; Line 1056
	mov	WORD PTR $S1370_srchmode,1
; Line 1057
; Line 1058
$I1381:
	cmp	WORD PTR [bp+4],1	;mode
	jne	$I1382
; Line 1059
	mov	ax,40
	push	ax
	call	_AWG9_CHANGE_MODE
	add	sp,2
; Line 1060
	mov	WORD PTR $S1370_srchmode,2
; Line 1061
; Line 1062
$I1382:
	cmp	WORD PTR [bp+4],2	;mode
	jne	$I1383
; Line 1063
	mov	ax,30
	push	ax
	call	_AWG9_CHANGE_MODE
	add	sp,2
; Line 1064
	mov	WORD PTR $S1370_srchmode,3
; Line 1065
; Line 1066
$I1383:
	cmp	WORD PTR [bp+4],3	;mode
	jne	$I1384
; Line 1067
	mov	ax,50
	push	ax
	call	_AWG9_CHANGE_MODE
; Line 1068
	mov	WORD PTR $S1370_srchmode,0
; Line 1069
; Line 1070
$I1384:
	mov	sp,bp
	pop	bp
	ret	

_ChangeSRCHMode	ENDP
; Line 1074
	PUBLIC	_AWG9_POWERUP
_AWG9_POWERUP	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	bh = -2
; Line 1077
	xor	WORD PTR _AWG9_SNIFF,1
	jne	$I1388
; Line 1078
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:$SG1390
	push	ax
	call	_Message
	add	sp,4
; Line 1079
; Line 1084
	mov	WORD PTR _LOCKED,-1
; Line 1086
	call	_ClearTargetFile
; Line 1088
	mov	ax,WORD PTR _AWG9_MODE
	jmp	SHORT $S1393
$I1388:
; Line 1080
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:$SG1392
	push	ax
	call	_Message
	add	sp,4
; Line 1081
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 1082
; Line 1089
$SC1397:
; Line 1090
	mov	ax,20
	push	ax
	call	_AWG9_CHANGE_MODE
	add	sp,2
; Line 1091
	mov	sp,bp
	pop	bp
	ret	
; Line 1092
$SC1398:
; Line 1096
	mov	ax,WORD PTR _BEAM_HDG
; Line 1098
	mov	sp,bp
	pop	bp
	ret	
	nop	
$S1393:
	sub	ax,30
	je	$SC1398
	sub	ax,270
	je	$SC1397
; Line 1100
	mov	sp,bp
	pop	bp
	ret	

_AWG9_POWERUP	ENDP
; Line 1104
	PUBLIC	_CHANGE_NUM_BARS
_CHANGE_NUM_BARS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	bartemp = -2
; Line 1107
	mov	ax,WORD PTR _SELECTED_BAR_NUM
	jmp	SHORT $S1403
; Line 1108
$SC1407:
; Line 1109
	mov	WORD PTR [bp-2],2	;bartemp
; Line 1110
	jmp	SHORT $SB1404
; Line 1111
	nop	
$SC1408:
; Line 1112
	mov	WORD PTR [bp-2],4	;bartemp
; Line 1113
	jmp	SHORT $SB1404
; Line 1114
	nop	
$SC1409:
; Line 1115
	mov	WORD PTR [bp-2],8	;bartemp
; Line 1116
	jmp	SHORT $SB1404
; Line 1117
	nop	
$SC1410:
; Line 1118
	mov	WORD PTR [bp-2],0	;bartemp
; Line 1119
	jmp	SHORT $SB1404
	nop	
$S1403:
	cmp	ax,8
	je	$SC1410
	ja	$SB1404
	or	al,al
	je	$SC1407
	sub	al,2
	je	$SC1408
	sub	al,2
	je	$SC1409
$SB1404:
; Line 1121
	mov	ax,WORD PTR [bp-2]	;bartemp
	mov	WORD PTR _SELECTED_BAR_NUM,ax
; Line 1122
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CHANGE_NUM_BARS	ENDP
; Line 1126
	PUBLIC	_CHANGE_AZIMUTH
_CHANGE_AZIMUTH	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	aztemp = -2
; Line 1129
	mov	ax,WORD PTR _SELECTED_AZ
	jmp	SHORT $S1414
; Line 1130
$SC1418:
; Line 1131
	mov	WORD PTR [bp-2],2	;aztemp
; Line 1132
	jmp	SHORT $SB1415
; Line 1133
	nop	
$SC1419:
; Line 1134
	mov	WORD PTR [bp-2],1	;aztemp
; Line 1135
	jmp	SHORT $SB1415
; Line 1136
	nop	
$SC1420:
; Line 1137
	mov	WORD PTR [bp-2],0	;aztemp
; Line 1138
	jmp	SHORT $SB1415
; Line 1139
	nop	
$SC1421:
; Line 1140
	mov	WORD PTR [bp-2],3	;aztemp
; Line 1141
	jmp	SHORT $SB1415
	nop	
$S1414:
	or	ax,ax
	je	$SC1421
	dec	ax
	je	$SC1420
	dec	ax
	je	$SC1419
	dec	ax
	je	$SC1418
$SB1415:
; Line 1143
	mov	ax,WORD PTR [bp-2]	;aztemp
	mov	WORD PTR _SELECTED_AZ,ax
; Line 1144
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CHANGE_AZIMUTH	ENDP
; Line 1149
	PUBLIC	_AWG9_INC_RANGE
_AWG9_INC_RANGE	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 1151
	inc	WORD PTR _RANGE
	mov	ax,WORD PTR _MAXRNG
	cmp	WORD PTR _RANGE,ax
	jl	$I1424
	mov	WORD PTR _RANGE,ax
; Line 1152
$I1424:
	ret	

_AWG9_INC_RANGE	ENDP
; Line 1156
	PUBLIC	_AWG9_DEC_RANGE
_AWG9_DEC_RANGE	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 1158
	dec	WORD PTR _RANGE
	cmp	WORD PTR _RANGE,0
	jg	$I1427
	mov	ax,WORD PTR _MINRNG
	mov	WORD PTR _RANGE,ax
; Line 1159
$I1427:
	ret	
	nop	

_AWG9_DEC_RANGE	ENDP
; Line 1163
set_acq	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	x = -2
;	y = -4
; Line 1167
	cmp	WORD PTR _AWG9_MODE,300
	je	$I1433
	cmp	WORD PTR _AWG9_MODE,202
	jne	$I1432
$I1433:
; Line 1168
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 1172
	nop	
$I1432:
	cmp	WORD PTR _MouseCrtX,-1
	je	$I1434
	mov	bx,WORD PTR _MouseDsp
	shl	bx,1
	cmp	WORD PTR _CrtDisplays[bx],16
	jne	$I1434
; Line 1174
	mov	ax,WORD PTR _MouseCrtY
	dec	ax
; Line 1177
	mov	cx,WORD PTR _MouseCrtX
	dec	cx
	js	$I1436
	or	ax,ax
	jl	$I1436
	cmp	cx,83
	jg	$I1436
	cmp	ax,66
	jle	$I1435
$I1436:
; Line 1178
	mov	ax,33
	push	ax
	mov	ax,41
	push	ax
	call	acquire
	add	sp,4
	jmp	SHORT $I1433
; Line 1180
; Line 1181
	nop	
$I1435:
	push	ax
	push	cx
	call	acquire
	add	sp,4
; Line 1182
	jmp	SHORT $I1438
$I1434:
	cmp	WORD PTR _MouseCrtX,-1
	jne	$I1438
	cmp	WORD PTR $S1431_MX,-1
	je	$I1438
; Line 1183
	mov	ax,33
	push	ax
	mov	ax,41
	push	ax
	call	acquire
; Line 1185
$I1438:
	mov	ax,WORD PTR _MouseCrtX
	mov	WORD PTR $S1431_MX,ax
; Line 1186
	mov	sp,bp
	pop	bp
	ret	
	nop	

set_acq	ENDP
; Line 1190
	PUBLIC	_UpdateBeam
_UpdateBeam	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__aNchkstk
;	pts = -14
;	alt = -4
;	found = -16
;	sr = -6
; Line 1198
	cmp	WORD PTR _DESIGNATED,-1
	jne	$I1445
$L20182:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 1200
$I1445:
	push	WORD PTR _DESIGNATED
	mov	ax,OFFSET DGROUP:_DESIG_TARGF
	push	ax
	call	_SetupNewTarget
	add	sp,4
; Line 1201
	mov	ax,OFFSET DGROUP:_DESIG_TARGF
	push	ax
	call	_orient_to_player
	add	sp,2
; Line 1202
	mov	ax,OFFSET DGROUP:_DESIG_TARGF
	push	ax
	call	orient_to_beam
	add	sp,2
; Line 1204
	push	WORD PTR _DESIG_TARGF+12
	push	WORD PTR _DESIG_TARGF+8
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR _DESIG_TARGF+28,ax
; Line 1205
	push	WORD PTR _DESIG_TARGF+12
	push	WORD PTR _DESIG_TARGF+10
	call	_ARCTAN
	add	sp,4
	neg	ax
	mov	WORD PTR _DESIG_TARGF+30,ax
; Line 1207
	mov	ax,WORD PTR _DESIGNATED
	cmp	WORD PTR _PREV_DESIG_TARGF+26,ax
	jne	$I1446
; Line 1208
	mov	ax,WORD PTR _PREV_DESIG_TARGF+34
	mov	dx,WORD PTR _PREV_DESIG_TARGF+36
	mov	WORD PTR _DESIG_TARGF+34,ax
	mov	WORD PTR _DESIG_TARGF+36,dx
; Line 1209
	mov	ax,WORD PTR _PREV_DESIG_TARGF+38
	mov	dx,WORD PTR _PREV_DESIG_TARGF+40
	mov	WORD PTR _DESIG_TARGF+38,ax
	mov	WORD PTR _DESIG_TARGF+40,dx
; Line 1210
	mov	ax,WORD PTR _PREV_DESIG_TARGF+42
	mov	WORD PTR _DESIG_TARGF+42,ax
; Line 1211
	mov	ax,WORD PTR _PREV_DESIG_TARGF+48
	mov	WORD PTR _DESIG_TARGF+48,ax
; Line 1212
; Line 1214
$I1446:
	mov	ax,OFFSET DGROUP:_DESIG_TARGF
	push	ax
	call	_UpdateConsoleXY
	add	sp,2
; Line 1216
	mov	ax,WORD PTR _AWG9_MODE
	cmp	ax,106
	je	$SC1452
	ja	$L20014
	cmp	ax,40
	je	$SC1456
	ja	$SC1453
	sub	al,20
	je	$SC1452
	sub	al,10
$SC1453:
; Line 1251
	cmp	WORD PTR _AWG9_MODE,202
	jne	$I1458
	jmp	$L20182
; Line 1217
	nop	
$SC1452:
; Line 1220
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 1232
	nop	
$SC1455:
; Line 1233
	mov	ax,WORD PTR _DESIG_TARGF+28
	sub	ax,WORD PTR $S1006_STABLE_HDG
	add	WORD PTR _BEAM_HDG,ax
; Line 1234
	mov	ax,WORD PTR $S1007_STABLE_PIT
	sub	ax,WORD PTR _DESIG_TARGF+30
	add	WORD PTR _BEAM_PIT,ax
; Line 1235
	mov	ax,WORD PTR _DESIG_TARGF+28
	mov	WORD PTR $S1006_STABLE_HDG,ax
; Line 1236
	mov	ax,WORD PTR _DESIG_TARGF+30
$L20183:
	mov	WORD PTR $S1007_STABLE_PIT,ax
; Line 1237
	jmp	SHORT $SC1453
; Line 1239
$SC1456:
; Line 1241
	mov	ax,WORD PTR $S1006_STABLE_HDG
	sub	ax,WORD PTR _OurHead
	add	WORD PTR _BEAM_HDG,ax
; Line 1242
	mov	ax,WORD PTR $S1007_STABLE_PIT
	sub	ax,WORD PTR _OurPitch
	add	WORD PTR _BEAM_PIT,ax
; Line 1243
	mov	ax,WORD PTR _OurHead
	mov	WORD PTR $S1006_STABLE_HDG,ax
; Line 1244
	mov	ax,WORD PTR _OurPitch
	jmp	SHORT $L20183
; Line 1247
	nop	
$L20014:
	sub	ax,200
	je	$SC1452
	dec	ax
	dec	ax
	je	$SC1453
	sub	ax,98
	je	$SC1455
; Line 1248
	jmp	SHORT $SC1453
; Line 1253
$I1458:
	mov	ax,OFFSET DGROUP:$S1008_BEAM_M
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR _BEAM_PIT
	add	ax,WORD PTR _OurPitch
	push	ax
	mov	ax,WORD PTR _BEAM_HDG
	add	ax,WORD PTR _OurHead
	neg	ax
	push	ax
	call	_MakeMatHPR
	add	sp,8
; Line 1258
	push	WORD PTR _BEAM_HDG
	call	_abs
	add	sp,2
	mov	cx,182
	cwd	
	idiv	cx
	mov	bx,WORD PTR _SELECTED_AZ
	shl	bx,1
	shl	bx,1
	sub	ax,WORD PTR $S976_Angles[bx]
	cmp	ax,65
	jge	$I1460
	push	WORD PTR _BEAM_PIT
	call	_abs
	add	sp,2
	mov	cx,ax
	mov	ax,419
	imul	WORD PTR _SELECTED_BAR_NUM
	mov	bx,182
	cwd	
	idiv	bx
	mov	dx,ax
	mov	ax,cx
	mov	cx,dx
	cwd	
	idiv	bx
	sub	ax,cx
	cmp	ax,65
	jl	$I1459
$I1460:
; Line 1259
	sub	ax,ax
	push	ax
	call	mode_flip
; Line 1260
$I1459:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_UpdateBeam	ENDP
; Line 1264
	PUBLIC	_UpdateSweep
_UpdateSweep	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	deg = -2
;	ticks = -4
; Line 1267
	mov	ax,WORD PTR _FTicks
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,cx
	mov	cx,6
	sub	dx,dx
	div	cx
; Line 1270
	cmp	WORD PTR _AZSWEEP_DIR,0
	jne	$L20016
	neg	ax
$L20016:
	mov	WORD PTR [bp-2],ax	;deg
	add	ax,WORD PTR _AZSWEEP
	push	ax
	call	_abs
	add	sp,2
	mov	bx,WORD PTR _SELECTED_AZ
	shl	bx,1
	shl	bx,1
	cmp	WORD PTR $S976_Angles[bx],ax
	jge	$I1465
; Line 1271
	xor	BYTE PTR _AZSWEEP_DIR,1
; Line 1272
	neg	WORD PTR [bp-2]	;deg
; Line 1273
	inc	WORD PTR _CUR_BAR
	mov	ax,WORD PTR _SELECTED_BAR_NUM
	cmp	WORD PTR _CUR_BAR,ax
	jne	$I1465
	call	_ResetBar
; Line 1274
$I1465:
; Line 1275
	mov	ax,WORD PTR [bp-2]	;deg
	add	WORD PTR _AZSWEEP,ax
; Line 1276
	mov	sp,bp
	pop	bp
	ret	
	nop	

_UpdateSweep	ENDP
; Line 1280
	PUBLIC	_StandardReset
_StandardReset	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 1282
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1468
$FC1469:
; Line 1283
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,1
	mov	WORD PTR _DETECTED_TARG[bx],0
	inc	WORD PTR [bp-2]	;i
$F1468:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-2],ax	;i
	jl	$FC1469
; Line 1285
	call	_ClearTargetFile
; Line 1286
	mov	sp,bp
	pop	bp
	ret	
	nop	

_StandardReset	ENDP
; Line 1290
	PUBLIC	_TargetTrack
_TargetTrack	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
;	asp = -4
;	b_az = -10
;	b_el = -2
;	found = -8
;	sr = -6
; Line 1294
	mov	WORD PTR _PDT_PROJ,0
; Line 1295
	mov	WORD PTR _TTI,-1
; Line 1297
	cmp	WORD PTR _AWG9_MODE,300
	je	$I1477
	cmp	WORD PTR _AWG9_MODE,202
	je	$I1477
; Line 1298
$L20185:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 1301
	nop	
$I1477:
	cmp	WORD PTR _DESIGNATED,-1
	je	$L20185
; Line 1304
	mov	ax,40
	imul	WORD PTR _DESIGNATED
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],2
	je	$I1480
	cmp	WORD PTR _ps[bx+26],0
	jne	$I1479
$I1480:
; Line 1305
	sub	ax,ax
	push	ax
	call	mode_flip
	add	sp,2
; Line 1308
$I1479:
	cmp	WORD PTR _DESIG_TARGF,0
	jne	$I1481
	cmp	WORD PTR _DESIG_TARGF+20,125
	jg	$I1481
; Line 1309
	sub	ax,ax
	push	ax
	call	mode_flip
	add	sp,2
; Line 1311
$I1481:
	mov	ax,OFFSET DGROUP:_DESIG_TARGF
	push	ax
	call	_LockDistanceCheck
	add	sp,2
	or	ax,ax
	jne	$I1483
; Line 1312
	push	ax
	call	mode_flip
	add	sp,2
; Line 1313
; Line 1316
$I1483:
	push	WORD PTR _DESIG_TARGF+28
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR $S976_Angles+2
	jle	$I1484
; Line 1317
	sub	ax,ax
	push	ax
	call	mode_flip
	add	sp,2
; Line 1320
$I1484:
	push	WORD PTR _DESIG_TARGF+30
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR $S976_Angles+2
	jle	$I1485
; Line 1321
	sub	ax,ax
	push	ax
	call	mode_flip
	add	sp,2
; Line 1326
$I1485:
	call	_ResetTargetTrack
; Line 1327
	mov	ax,OFFSET DGROUP:_DESIG_TARGF
	push	ax
	call	_UpdateTargetClosure
	add	sp,2
; Line 1328
	mov	ax,WORD PTR _DESIG_TARGF+34
	mov	dx,WORD PTR _DESIG_TARGF+36
	mov	WORD PTR _PREV_DESIG_TARGF+34,ax
	mov	WORD PTR _PREV_DESIG_TARGF+36,dx
; Line 1329
	mov	ax,WORD PTR _DESIG_TARGF+38
	mov	dx,WORD PTR _DESIG_TARGF+40
	mov	WORD PTR _PREV_DESIG_TARGF+38,ax
	mov	WORD PTR _PREV_DESIG_TARGF+40,dx
; Line 1330
	mov	ax,WORD PTR _DESIG_TARGF+42
	mov	WORD PTR _PREV_DESIG_TARGF+42,ax
; Line 1331
	mov	ax,WORD PTR _DESIG_TARGF+48
	mov	WORD PTR _PREV_DESIG_TARGF+48,ax
; Line 1334
	mov	ax,OFFSET DGROUP:_DESIG_TARGF
	push	ax
	call	_AddTargetFile
	add	sp,2
; Line 1337
	mov	ax,WORD PTR _DESIG_TARGF+38
	mov	WORD PTR _CLOSURE,ax
; Line 1340
	cmp	WORD PTR _DESIG_TARGF,0
	je	$L20017
	mov	ax,WORD PTR _DESIG_TARGF+20
	jmp	SHORT $L20018
$L20017:
	mov	ax,WORD PTR _DESIG_TARGF+20
	mov	cl,5
	sar	ax,cl
$L20018:
	mov	WORD PTR _PDT_RNG,ax
	cmp	ax,WORD PTR _BRANGES
	jg	$I1489
; Line 1341
	mov	WORD PTR _RANGE,0
; Line 1343
$I1489:
	mov	ax,WORD PTR _BRANGES
	cmp	WORD PTR _PDT_RNG,ax
	jle	$I1490
	mov	ax,WORD PTR _BRANGES+2
	cmp	WORD PTR _PDT_RNG,ax
	jge	$I1490
; Line 1344
	mov	WORD PTR _RANGE,1
; Line 1346
$I1490:
	mov	ax,WORD PTR _BRANGES+2
	cmp	WORD PTR _PDT_RNG,ax
	jle	$I1491
	mov	ax,WORD PTR _BRANGES+4
	cmp	WORD PTR _PDT_RNG,ax
	jge	$I1491
; Line 1347
	mov	WORD PTR _RANGE,2
; Line 1349
$I1491:
	mov	ax,WORD PTR _BRANGES+4
	cmp	WORD PTR _PDT_RNG,ax
	jle	$I1492
	mov	ax,WORD PTR _BRANGES+6
	cmp	WORD PTR _PDT_RNG,ax
	jge	$I1492
; Line 1350
	mov	WORD PTR _RANGE,3
; Line 1352
$I1492:
	mov	ax,WORD PTR _BRANGES+6
	cmp	WORD PTR _PDT_RNG,ax
	jle	$I1493
	mov	ax,WORD PTR _BRANGES+8
	cmp	WORD PTR _PDT_RNG,ax
	jge	$I1493
; Line 1353
	mov	WORD PTR _RANGE,4
; Line 1355
$I1493:
	mov	ax,WORD PTR _BRANGES+8
	cmp	WORD PTR _PDT_RNG,ax
	jle	$I1494
	mov	ax,WORD PTR _BRANGES+10
	cmp	WORD PTR _PDT_RNG,ax
	jge	$I1494
; Line 1356
	mov	WORD PTR _RANGE,5
; Line 1358
$I1494:
	mov	ax,WORD PTR _BRANGES+10
	cmp	WORD PTR _PDT_RNG,ax
	jle	$I1495
; Line 1359
	mov	WORD PTR _RANGE,5
; Line 1363
$I1495:
	mov	ax,40
	imul	WORD PTR _DESIGNATED
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR _Py
	push	ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR _ps[bx+2]
	push	ax
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-4],ax	;asp
; Line 1366
	mov	ax,40
	imul	WORD PTR _DESIGNATED
	mov	bx,ax
	mov	ax,-32768
	sub	ax,WORD PTR _ps[bx+16]
	add	WORD PTR [bp-4],ax	;asp
	push	WORD PTR [bp-4]	;asp
	call	_abs
	add	sp,2
	mov	cx,182
	cwd	
	idiv	cx
	add	ax,5
	mov	cx,10
	cwd	
	idiv	cx
	mov	WORD PTR $S1013_ASPDEG,ax
; Line 1368
	or	ax,ax
	je	$SC1500
	sub	ax,18
	je	$SC1502
; Line 1376
	mov	ax,cx
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR $S1013_ASPDEG
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET DGROUP:_ASPECT_S
	push	ax
	call	_strcpy
	add	sp,4
; Line 1377
	cmp	WORD PTR [bp-4],0	;asp
	jle	$L20019
	mov	ax,OFFSET DGROUP:$SG1505
	jmp	SHORT $L20020
; Line 1369
$SC1500:
; Line 1370
	mov	ax,OFFSET DGROUP:$SG1501
$L20186:
	push	ax
	mov	ax,OFFSET DGROUP:_ASPECT_S
	push	ax
	call	_strcpy
$L20187:
	add	sp,4
; Line 1381
	cmp	WORD PTR _LOCKED,-1
	jne	$I1507
	jmp	$L20185
; Line 1372
$SC1502:
; Line 1373
	mov	ax,OFFSET DGROUP:$SG1503
	jmp	SHORT $L20186
; Line 1375
	nop	
$L20019:
	mov	ax,OFFSET DGROUP:$SG1506
$L20020:
	push	ax
	mov	ax,OFFSET DGROUP:_ASPECT_S
	push	ax
	call	_strcat
	jmp	SHORT $L20187
	nop	
$I1507:
	call	calc_TTI
; Line 1386
	mov	ax,40
	imul	WORD PTR _LOCKED
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	call	_AWG9_project
	add	sp,10
	inc	ax
	jne	$JCC5585
	jmp	$L20185
$JCC5585:
; Line 1390
	mov	ax,WORD PTR _proj_x
	sub	ax,WORD PTR _TB_CTRX
	mov	WORD PTR _PDT_PROJ_X,ax
; Line 1391
	mov	ax,WORD PTR _proj_y
	sub	ax,WORD PTR _TB_CTRY
	mov	WORD PTR _PDT_PROJ_Y,ax
; Line 1392
	inc	WORD PTR _PDT_PROJ
; Line 1393
	mov	sp,bp
	pop	bp
	ret	

_TargetTrack	ENDP
; Line 1397
	PUBLIC	_LockDistanceCheck
_LockDistanceCheck	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	si
;	rng = -8
;	tempplane = -4
;	t = 4
; Line 1398
	sub	ax,ax
	mov	WORD PTR [bp-6],ax
	mov	WORD PTR [bp-8],ax	;rng
; Line 1401
	mov	ax,40
	mov	bx,WORD PTR [bp+4]	;t
	imul	WORD PTR [bx+26]
	mov	si,ax
	push	WORD PTR _ps[si+22]
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-4],ax	;tempplane
	mov	WORD PTR [bp-2],dx
; Line 1403
	cmp	WORD PTR _AWG9_REALITY_LEVEL,0
	jne	$I1514
; Line 1404
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20021
	mov	ax,4750
	cwd	
	jmp	SHORT $L20022
$L20021:
	mov	ax,20928
	mov	dx,2
$L20022:
	mov	WORD PTR [bp-8],ax	;rng
	mov	WORD PTR [bp-6],dx
; Line 1405
	mov	cx,ax
	mov	ax,WORD PTR [bx+20]
	mov	bx,dx
	cwd	
	cmp	bx,dx
	jg	$I1515
	jl	$L20025
	cmp	cx,ax
	jae	$I1515
$L20025:
; Line 1406
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1516
$L20188:
	push	ax
	call	_Message
	add	sp,4
; Line 1407
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1515:
; Line 1409
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1410
; Line 1411
; Line 1413
$I1514:
	cmp	WORD PTR _AWG9_REALITY_LEVEL,0
	jne	$JCC5749
	jmp	$I1518
$JCC5749:
; Line 1414
	les	bx,DWORD PTR [bp-4]	;tempplane
	cmp	WORD PTR es:[bx+18],1
	jne	$I1519
; Line 1415
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20026
	mov	ax,1900
	jmp	SHORT $L20190
	nop	
$L20026:
	mov	ax,-4736
$L20190:
	sub	dx,dx
	mov	WORD PTR [bp-8],ax	;rng
	mov	WORD PTR [bp-6],dx
; Line 1416
; Line 1417
$I1519:
	mov	bx,WORD PTR [bp-4]	;tempplane
	cmp	WORD PTR es:[bx+18],2
	jne	$I1520
; Line 1418
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20028
	mov	ax,4513
	cwd	
	jmp	SHORT $L20029
	nop	
$L20028:
	mov	ax,13344
	mov	dx,2
$L20029:
	mov	WORD PTR [bp-8],ax	;rng
	mov	WORD PTR [bp-6],dx
; Line 1419
; Line 1420
$I1520:
	mov	bx,WORD PTR [bp-4]	;tempplane
	cmp	WORD PTR es:[bx+18],3
	jne	$I1521
; Line 1421
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20030
	mov	ax,4988
	cwd	
	jmp	SHORT $L20031
$L20030:
	mov	ax,28544
	mov	dx,2
$L20031:
	mov	WORD PTR [bp-8],ax	;rng
	mov	WORD PTR [bp-6],dx
; Line 1422
; Line 1423
$I1521:
	mov	bx,WORD PTR [bp-4]	;tempplane
	cmp	WORD PTR es:[bx+18],4
	jne	$I1522
; Line 1424
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20032
	mov	ax,5938
	cwd	
	jmp	SHORT $L20033
$L20032:
	mov	ax,-6592
	mov	dx,2
$L20033:
	mov	WORD PTR [bp-8],ax	;rng
	mov	WORD PTR [bp-6],dx
; Line 1425
; Line 1426
$I1522:
	mov	bx,WORD PTR [bp-4]	;tempplane
	cmp	WORD PTR es:[bx+18],5
	jne	$I1523
; Line 1427
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20034
	mov	ax,6888
	cwd	
	jmp	SHORT $L20035
$L20034:
	mov	ax,23808
	mov	dx,3
$L20035:
	mov	WORD PTR [bp-8],ax	;rng
	mov	WORD PTR [bp-6],dx
; Line 1428
; Line 1430
$I1523:
	mov	bx,WORD PTR [bp+4]	;t
	mov	ax,WORD PTR [bx+20]
	cwd	
	cmp	dx,WORD PTR [bp-6]
	jge	$JCC5944
	jmp	$I1515
$JCC5944:
	jg	$L20036
	cmp	ax,WORD PTR [bp-8]	;rng
	ja	$JCC5954
	jmp	$I1515
$JCC5954:
$L20036:
; Line 1431
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1525
	jmp	$L20188
	nop	
$I1518:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_LockDistanceCheck	ENDP
; Line 1441
	PUBLIC	_UpdateTargetClosure
_UpdateTargetClosure	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
	push	si
;	ncl = -16
;	temptime = -8
;	tempdist = -14
;	curtime = -10
;	dist = -6
;	targcl = -20
;	asp = -2
;	newasp = -22
;	tc = 4
; Line 1450
	call	FAR PTR _GETTIME
	mov	WORD PTR [bp-10],ax	;curtime
; Line 1451
	mov	bx,WORD PTR [bp+4]	;tc
	sub	ax,WORD PTR [bx+42]
	mov	WORD PTR [bp-8],ax	;temptime
; Line 1453
	mov	cx,60
	cwd	
	idiv	cx
	cmp	ax,3
	jge	$I1537
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1455
$I1537:
	cmp	WORD PTR [bp-8],0	;temptime
	jg	$I1538
	mov	WORD PTR [bp-8],1	;temptime
; Line 1457
$I1538:
; Line 1458
	mov	ax,40
	imul	WORD PTR [bx+26]
	mov	si,ax
	mov	ax,WORD PTR _ps[si+6]
	sub	ax,WORD PTR _Alt
	push	ax
	mov	ax,WORD PTR _ps[si+12]
	mov	dx,WORD PTR _ps[si+14]
	add	ax,WORD PTR _PyLng
	adc	dx,WORD PTR _PyLng+2
	sub	ax,0
	sbb	dx,16
	push	dx
	push	ax
	mov	ax,WORD PTR _ps[si+8]
	mov	dx,WORD PTR _ps[si+10]
	sub	ax,WORD PTR _PxLng
	sbb	dx,WORD PTR _PxLng+2
	push	dx
	push	ax
	call	_LDist3D
	add	sp,10
	mov	WORD PTR [bp-14],ax	;tempdist
	mov	WORD PTR [bp-12],dx
; Line 1461
	mov	bx,WORD PTR [bp+4]	;tc
	mov	ax,WORD PTR [bx+34]
	mov	dx,WORD PTR [bx+36]
	sub	ax,WORD PTR [bp-14]	;tempdist
	sbb	dx,WORD PTR [bp-12]
	mov	WORD PTR [bp-6],ax	;dist
	mov	WORD PTR [bp-4],dx
; Line 1466
	mov	ax,WORD PTR [bp-8]	;temptime
	mov	cx,60
	cwd	
	idiv	cx
	cmp	ax,1
	jge	$I1539
; Line 1467
	mov	WORD PTR [bp-8],1	;temptime
; Line 1468
	jmp	SHORT $I1540
$I1539:
; Line 1469
	mov	ax,WORD PTR [bp-8]	;temptime
	cwd	
	idiv	cx
	mov	WORD PTR [bp-8],ax	;temptime
$I1540:
; Line 1474
	mov	ax,2
	cwd	
	push	dx
	push	ax
	mov	ax,168
	cwd	
	push	dx
	push	ax
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-8]	;temptime
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-6]	;dist
	mov	dx,WORD PTR [bp-4]
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	__aNldiv
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	mov	bx,WORD PTR [bp+4]	;tc
	add	ax,WORD PTR [bx+38]
	adc	dx,WORD PTR [bx+40]
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-20],ax	;targcl
	mov	WORD PTR [bp-18],dx
	or	dx,dx
	jl	$I1541
	jg	$L20037
	cmp	ax,1300
	jbe	$I1541
$L20037:
	mov	WORD PTR [bp-20],1300	;targcl
	mov	WORD PTR [bp-18],0
; Line 1475
$I1541:
	cmp	WORD PTR [bp-18],-1
	jg	$I1542
	jl	$L20040
	cmp	WORD PTR [bp-20],-1300	;targcl
	jae	$I1542
$L20040:
	mov	WORD PTR [bp-20],-1300	;targcl
	mov	WORD PTR [bp-18],-1
; Line 1477
$I1542:
	mov	ax,WORD PTR [bp-14]	;tempdist
	mov	dx,WORD PTR [bp-12]
	mov	bx,WORD PTR [bp+4]	;tc
	mov	WORD PTR [bx+34],ax
	mov	WORD PTR [bx+36],dx
; Line 1478
	mov	ax,WORD PTR [bp-10]	;curtime
	mov	WORD PTR [bx+42],ax
; Line 1479
	mov	ax,WORD PTR [bp-20]	;targcl
	mov	dx,WORD PTR [bp-18]
	mov	WORD PTR [bx+38],ax
	mov	WORD PTR [bx+40],dx
; Line 1482
	mov	ax,40
	imul	WORD PTR [bx+26]
	mov	si,ax
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR _Py
	push	ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR _ps[si+2]
	push	ax
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-2],ax	;asp
; Line 1487
	mov	ax,40
	mov	bx,WORD PTR [bp+4]	;tc
	imul	WORD PTR [bx+26]
	mov	si,ax
	mov	ax,-32768
	sub	ax,WORD PTR _ps[si+16]
	add	WORD PTR [bp-2],ax	;asp
	push	WORD PTR [bp-2]	;asp
	call	_abs
	add	sp,2
	mov	cx,182
	cwd	
	idiv	cx
	add	ax,5
	mov	cx,10
	cwd	
	idiv	cx
	mov	WORD PTR [bp-22],ax	;newasp
	or	ax,ax
	jl	$I1543
; Line 1488
	mov	ax,40
	mov	bx,WORD PTR [bp+4]	;tc
	imul	WORD PTR [bx+26]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+26]
	sub	ax,WORD PTR _Knots
; Line 1489
$I1543:
	cmp	WORD PTR [bp-22],9	;newasp
	jle	$I1544
	cmp	WORD PTR [bp-22],27	;newasp
	jge	$I1544
; Line 1490
	mov	ax,40
	mov	bx,WORD PTR [bp+4]	;tc
	imul	WORD PTR [bx+26]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+26]
	add	ax,WORD PTR _Knots
; Line 1491
$I1544:
	cmp	WORD PTR [bp-22],0	;newasp
	jle	$I1545
	cmp	WORD PTR [bp-22],9	;newasp
	jge	$I1545
; Line 1492
	mov	ax,40
	mov	bx,WORD PTR [bp+4]	;tc
	imul	WORD PTR [bx+26]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+26]
	sub	ax,WORD PTR _Knots
; Line 1493
$I1545:
	cmp	WORD PTR [bp-22],27	;newasp
	jle	$I1546
	cmp	WORD PTR [bp-22],36	;newasp
	jge	$I1546
; Line 1494
	mov	ax,40
	mov	bx,WORD PTR [bp+4]	;tc
	imul	WORD PTR [bx+26]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+26]
	sub	ax,WORD PTR _Knots
; Line 1499
$I1546:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_UpdateTargetClosure	ENDP
; Line 1504
	PUBLIC	_LDist3D
_LDist3D	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
	push	di
	push	si
;	shifthold = -10
;	returnval = -8
;	ox = -14
;	oy = -18
;	doshift = -4
;	z = 12
;	y = 8
;	x = 4
; Line 1505
	mov	WORD PTR [bp-10],0	;shifthold
; Line 1508
	mov	WORD PTR [bp-4],16383	;doshift
	mov	WORD PTR [bp-2],0
; Line 1510
	mov	ax,WORD PTR [bp+4]	;x
	mov	dx,WORD PTR [bp+6]
	mov	WORD PTR [bp-14],ax	;ox
	mov	WORD PTR [bp-12],dx
; Line 1511
	mov	cx,WORD PTR [bp+8]	;y
	mov	bx,WORD PTR [bp+10]
	mov	WORD PTR [bp-18],cx	;oy
	mov	WORD PTR [bp-16],bx
; Line 1513
	push	bx
	push	cx
	call	_absL
	add	sp,4
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;ox
	mov	si,ax
	mov	di,dx
	call	_absL
	add	sp,4
	add	si,ax
	adc	di,dx
	or	di,di
	jl	$I1556
	jg	$L20043
	cmp	si,16383
	jbe	$I1556
$L20043:
; Line 1514
	mov	ax,WORD PTR [bp-14]	;ox
	mov	dx,WORD PTR [bp-12]
	mov	al,ah
	mov	ah,dl
	mov	dl,dh
	shl	dh,1
	sbb	dh,dh
	mov	WORD PTR [bp+4],ax	;x
	mov	WORD PTR [bp+6],dx
; Line 1515
	mov	ax,WORD PTR [bp-18]	;oy
	mov	dx,WORD PTR [bp-16]
	mov	al,ah
	mov	ah,dl
	mov	dl,dh
	shl	dh,1
	sbb	dh,dh
	mov	WORD PTR [bp+8],ax	;y
	mov	WORD PTR [bp+10],dx
; Line 1516
	mov	cl,8
	sar	WORD PTR [bp+12],cl	;z
; Line 1517
	mov	WORD PTR [bp-10],8	;shifthold
; Line 1518
; Line 1520
$I1556:
	push	WORD PTR [bp+6]
	push	WORD PTR [bp+4]	;x
	call	_absL
	add	sp,4
	push	WORD PTR [bp+10]
	push	WORD PTR [bp+8]	;y
	mov	si,ax
	mov	di,dx
	call	_absL
	add	sp,4
	add	si,ax
	adc	di,dx
	cmp	di,WORD PTR [bp-2]
	jl	$I1557
	jg	$L20045
	cmp	si,WORD PTR [bp-4]	;doshift
	jbe	$I1557
$L20045:
; Line 1521
	mov	al,8
	push	ax
	lea	cx,WORD PTR [bp+4]	;x
	push	cx
	call	__aNNalshr
; Line 1522
	mov	al,8
	push	ax
	lea	cx,WORD PTR [bp+8]	;y
	push	cx
	call	__aNNalshr
; Line 1523
	mov	cl,8
	sar	WORD PTR [bp+12],cl	;z
; Line 1524
	mov	WORD PTR [bp-10],16	;shifthold
; Line 1525
; Line 1527
$I1557:
	cmp	WORD PTR [bp-10],0	;shifthold
	je	$I1558
; Line 1528
	push	WORD PTR [bp+12]	;z
	push	WORD PTR [bp+8]	;y
	push	WORD PTR [bp+4]	;x
	call	_Dist3D
	add	sp,6
	cwd	
	mov	WORD PTR [bp-8],ax	;returnval
	mov	WORD PTR [bp-6],dx
; Line 1529
	mov	al,BYTE PTR [bp-10]	;shifthold
	push	ax
	lea	ax,WORD PTR [bp-8]	;returnval
	push	ax
	call	__aNNalshl
; Line 1530
; Line 1531
	jmp	SHORT $I1560
	nop	
$I1558:
; Line 1532
	push	WORD PTR [bp+12]	;z
	push	WORD PTR [bp+8]	;y
	push	WORD PTR [bp+4]	;x
	call	_Dist3D
	add	sp,6
	cwd	
	mov	WORD PTR [bp-8],ax	;returnval
	mov	WORD PTR [bp-6],dx
$I1560:
; Line 1534
	mov	ax,WORD PTR [bp-8]	;returnval
	mov	dx,WORD PTR [bp-6]
; Line 1535
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_LDist3D	ENDP
; Line 1540
calc_TTI	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__aNchkstk
	push	di
	push	si
;	x = -12
;	y = -16
;	z = -20
;	d = -6
;	spd = -8
;	sp = -2
;	tempmissile = -24
; Line 1549
	mov	ax,44
	imul	WORD PTR _LastMisl
	mov	bx,ax
	add	bx,OFFSET _ss
	mov	WORD PTR [bp-2],bx	;sp
	cmp	WORD PTR [bx+30],18
	jne	$I1569
$L20191:
	sub	ax,ax
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 1551
	nop	
$I1569:
	cmp	WORD PTR [bx+26],0
	je	$L20191
; Line 1554
	cmp	WORD PTR [bx+36],1
	jne	$L20191
	cmp	WORD PTR [bx+34],70
	jne	$L20191
; Line 1557
	cmp	WORD PTR [bx+42],0
	je	$I1573
; Line 1558
	mov	WORD PTR _TTI,-2
	jmp	SHORT $L20191
; Line 1560
; Line 1562
$I1573:
	mov	ax,40
	imul	WORD PTR [bx+38]
	mov	si,ax
	mov	ax,WORD PTR [bx]
	mov	dx,WORD PTR [bx+2]
	sub	ax,WORD PTR _ps[si+8]
	sbb	dx,WORD PTR _ps[si+10]
	mov	WORD PTR [bp-12],ax	;x
	mov	WORD PTR [bp-10],dx
; Line 1563
	mov	cx,WORD PTR [bx+4]
	mov	di,WORD PTR [bx+6]
	sub	cx,WORD PTR _ps[si+12]
	sbb	di,WORD PTR _ps[si+14]
	mov	WORD PTR [bp-16],cx	;y
	mov	WORD PTR [bp-14],di
; Line 1564
	mov	cx,ax
	mov	ax,WORD PTR _ps[si+6]
	mov	si,dx
	cwd	
	mov	di,ax
	mov	ax,WORD PTR [bx+16]
	mov	bx,dx
	cwd	
	sub	ax,di
	sbb	dx,bx
	mov	WORD PTR [bp-20],ax	;z
	mov	WORD PTR [bp-18],dx
; Line 1568
	push	si
	push	cx
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$L20050
	jl	$L20048
	cmp	ax,18900
	jae	$L20050
$L20048:
	push	WORD PTR [bp-14]
	push	WORD PTR [bp-16]	;y
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$L20050
	jl	$L20049
	cmp	ax,18900
	jae	$L20050
$L20049:
	push	WORD PTR [bp-18]
	push	WORD PTR [bp-20]	;z
	call	_labs
	add	sp,4
	or	dx,dx
	jl	$I1574
	jg	$L20050
	cmp	ax,18900
	jb	$I1574
$L20050:
; Line 1572
	mov	al,5
	push	ax
	lea	cx,WORD PTR [bp-20]	;z
	push	cx
	call	__aNNalshr
	push	ax
	mov	al,5
	push	ax
	lea	cx,WORD PTR [bp-16]	;y
	push	cx
	call	__aNNalshr
	push	ax
	mov	al,5
	push	ax
	lea	cx,WORD PTR [bp-12]	;x
	push	cx
	call	__aNNalshr
	push	ax
	call	_Dist3D
	add	sp,6
	cwd	
	mov	WORD PTR [bp-6],ax	;d
	mov	WORD PTR [bp-4],dx
; Line 1573
	mov	al,5
	push	ax
	lea	ax,WORD PTR [bp-6]	;d
	push	ax
	call	__aNNalshl
; Line 1574
	jmp	SHORT $I1576
	nop	
$I1574:
; Line 1575
	push	WORD PTR [bp-20]	;z
	push	WORD PTR [bp-16]	;y
	push	WORD PTR [bp-12]	;x
	call	_Dist3D
	add	sp,6
	cwd	
	mov	WORD PTR [bp-6],ax	;d
	mov	WORD PTR [bp-4],dx
; Line 1576
$I1576:
; Line 1579
	mov	bx,WORD PTR [bp-2]	;sp
	push	WORD PTR [bx+28]
	call	_GetMissilePtr
	add	sp,2
	mov	WORD PTR [bp-24],ax	;tempmissile
	mov	WORD PTR [bp-22],dx
; Line 1581
	mov	cl,3
	les	bx,DWORD PTR [bp-24]	;tempmissile
	mov	ax,WORD PTR es:[bx+20]
	mov	bx,WORD PTR [bp-2]	;sp
	cmp	ax,WORD PTR [bx+18]
	jge	$L20051
	mov	ax,WORD PTR [bx+18]
$L20051:
	mov	dx,ax
	shl	ax,1
	add	ax,dx
	shr	ax,cl
	mov	WORD PTR [bp-8],ax	;spd
; Line 1584
	or	ax,ax
	je	$L20192
; Line 1587
	sub	dx,dx
	push	dx
	push	ax
	push	WORD PTR [bp-4]
	push	WORD PTR [bp-6]	;d
	call	__aNuldiv
$L20192:
	mov	WORD PTR _TTI,ax
; Line 1588
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

calc_TTI	ENDP
; Line 1592
	PUBLIC	_SearchForTargets
_SearchForTargets	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,66
	call	__aNchkstk
;	i = -60
;	t = -52
;	found = -62
;	sr = -54
;	tempplane = -58
;	asp = -2
;	newasp = -66
;	ncl = -64
; Line 1600
	cmp	WORD PTR _AWG9_SNIFF,0
	je	$I1588
$L20193:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 1603
$I1588:
	cmp	WORD PTR _AWG9_MODE,300
	je	$L20193
; Line 1607
	mov	WORD PTR [bp-60],0	;i
	jmp	$F1590
; Line 1635
; Line 1636
$FC1600:
	inc	WORD PTR [bp-54]	;sr
$F1599:
	mov	bx,WORD PTR _AGEDTARGFILECNT
	mov	ax,WORD PTR [bp-54]	;sr
	cmp	WORD PTR [bx],ax
	jle	$FB1601
; Line 1628
	mov	cx,50
	imul	cx
	mov	bx,ax
	add	bx,WORD PTR _AGEDTARGFILE
	mov	ax,WORD PTR [bp-26]
	cmp	WORD PTR [bx+26],ax
	jne	$FC1600
; Line 1629
	mov	WORD PTR [bp-62],1	;found
; Line 1630
	mov	ax,WORD PTR [bx+34]
	mov	dx,WORD PTR [bx+36]
	mov	WORD PTR [bp-18],ax
	mov	WORD PTR [bp-16],dx
; Line 1631
	mov	ax,WORD PTR [bx+38]
	mov	dx,WORD PTR [bx+40]
	mov	WORD PTR [bp-14],ax
	mov	WORD PTR [bp-12],dx
; Line 1632
	mov	ax,WORD PTR [bx+42]
	mov	WORD PTR [bp-10],ax
; Line 1633
	mov	ax,WORD PTR [bx+48]
	mov	WORD PTR [bp-4],ax
; Line 1634
$FB1601:
; Line 1638
	cmp	WORD PTR [bp-62],0	;found
	je	$JCC7290
	jmp	$L20194
$JCC7290:
; Line 1642
	mov	WORD PTR [bp-4],0
; Line 1644
	mov	ax,40
	imul	WORD PTR [bp-26]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	sub	ax,WORD PTR _Alt
	push	ax
	mov	ax,WORD PTR _ps[bx+12]
	mov	dx,WORD PTR _ps[bx+14]
	add	ax,WORD PTR _PyLng
	adc	dx,WORD PTR _PyLng+2
	sub	ax,0
	sbb	dx,16
	push	dx
	push	ax
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
	sub	ax,WORD PTR _PxLng
	sbb	dx,WORD PTR _PxLng+2
	push	dx
	push	ax
	call	_LDist3D
	add	sp,10
	mov	WORD PTR [bp-18],ax
	mov	WORD PTR [bp-16],dx
; Line 1645
	mov	ax,40
	imul	WORD PTR [bp-26]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR _Py
	push	ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR _ps[bx+2]
	push	ax
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-2],ax	;asp
; Line 1650
	mov	ax,40
	imul	WORD PTR [bp-26]
	mov	bx,ax
	mov	ax,-32768
	sub	ax,WORD PTR _ps[bx+16]
	add	WORD PTR [bp-2],ax	;asp
	push	WORD PTR [bp-2]	;asp
	call	_abs
	add	sp,2
	mov	cx,182
	cwd	
	idiv	cx
	add	ax,5
	mov	cx,10
	cwd	
	idiv	cx
	mov	WORD PTR [bp-66],ax	;newasp
	or	ax,ax
	jl	$I1605
; Line 1651
	mov	ax,40
	imul	WORD PTR [bp-26]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+26]
	sub	ax,WORD PTR _Knots
	mov	WORD PTR [bp-64],ax	;ncl
; Line 1652
$I1605:
	cmp	WORD PTR [bp-66],9	;newasp
	jl	$I1606
; Line 1653
	mov	ax,40
	imul	WORD PTR [bp-26]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+26]
	add	ax,WORD PTR _Knots
	add	ax,100
	mov	WORD PTR [bp-64],ax	;ncl
; Line 1654
$I1606:
	cmp	WORD PTR [bp-66],27	;newasp
	jl	$I1607
; Line 1655
	mov	ax,40
	imul	WORD PTR [bp-26]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+26]
	sub	ax,WORD PTR _Knots
	mov	WORD PTR [bp-64],ax	;ncl
; Line 1656
$I1607:
	mov	ax,WORD PTR [bp-64]	;ncl
	cwd	
	mov	WORD PTR [bp-14],ax
	mov	WORD PTR [bp-12],dx
; Line 1657
	mov	WORD PTR [bp-10],190
; Line 1658
$L20194:
	lea	ax,WORD PTR [bp-52]	;t
	push	ax
	call	_UpdateTargetClosure
	add	sp,2
; Line 1659
; Line 1660
	lea	ax,WORD PTR [bp-52]	;t
	push	ax
	call	_UpdateConsoleXY
	add	sp,2
; Line 1661
	lea	ax,WORD PTR [bp-52]	;t
	push	ax
	call	_AddTargetFile
	add	sp,2
; Line 1662
	mov	bx,WORD PTR [bp-60]	;i
	shl	bx,1
	inc	WORD PTR _DETECTED_TARG[bx]
; Line 1663
$FC1591:
	inc	WORD PTR [bp-60]	;i
$F1590:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-60],ax	;i
	jl	$JCC7589
	jmp	$FB1592
$JCC7589:
; Line 1608
	mov	ax,WORD PTR _DESIGNATED
	cmp	WORD PTR [bp-60],ax	;i
	je	$FC1591
; Line 1609
	mov	ax,40
	imul	WORD PTR [bp-60]	;i
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],2
	je	$FC1591
; Line 1610
	mov	ax,40
	imul	WORD PTR [bp-60]	;i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+26],0
	je	$FC1591
; Line 1612
	mov	bx,WORD PTR [bp-60]	;i
	shl	bx,1
	cmp	WORD PTR _DETECTED_TARG[bx],0
	jne	$FC1591
; Line 1614
	push	WORD PTR [bp-60]	;i
	lea	ax,WORD PTR [bp-52]	;t
	push	ax
	call	_SetupNewTarget
	add	sp,4
; Line 1615
	lea	ax,WORD PTR [bp-52]	;t
	push	ax
	call	_orient_to_player
	add	sp,2
; Line 1617
	mov	ax,OFFSET DGROUP:$S1008_BEAM_M
	push	ax
	sub	ax,ax
	push	ax
	mov	cx,WORD PTR _BEAM_PIT
	add	cx,WORD PTR _OurPitch
	push	cx
	mov	cx,WORD PTR _BEAM_HDG
	add	cx,WORD PTR _OurHead
	neg	cx
	push	cx
	call	_MakeMatHPR
	add	sp,8
; Line 1618
	lea	ax,WORD PTR [bp-52]	;t
	push	ax
	call	orient_to_beam
	add	sp,2
; Line 1620
	lea	ax,WORD PTR [bp-52]	;t
	push	ax
	call	_InBeam
	add	sp,2
	or	ax,ax
	jne	$JCC7722
	jmp	$FC1591
$JCC7722:
; Line 1627
	sub	ax,ax
	mov	WORD PTR [bp-62],ax	;found
	mov	WORD PTR [bp-54],ax	;sr
	jmp	$F1599
$FB1592:
; Line 1664
	mov	sp,bp
	pop	bp
	ret	

_SearchForTargets	ENDP
; Line 1669
	PUBLIC	_ResetTargetTrack
_ResetTargetTrack	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	i = -2
; Line 1672
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1610
; Line 1676
; Line 1677
	nop	
$FC1611:
	inc	WORD PTR [bp-2]	;i
$F1610:
	mov	bx,WORD PTR _TARGFILECNT
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR [bx],ax
	jle	$FB1612
; Line 1673
	mov	cx,50
	imul	cx
	mov	si,ax
	mov	bx,WORD PTR _TARGFILE
	mov	ax,WORD PTR _DESIGNATED
	cmp	WORD PTR [bx+26][si],ax
	jne	$FC1611
; Line 1674
	push	WORD PTR [bp-2]	;i
	call	_DelTargetFile
	add	sp,2
; Line 1675
$FB1612:
; Line 1678
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ResetTargetTrack	ENDP
; Line 1682
	PUBLIC	_ResetBar
_ResetBar	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	t = -4
;	c = -2
;	i = -6
; Line 1686
	call	_ResetTargetTrack
; Line 1688
	mov	WORD PTR [bp-6],0	;i
	jmp	SHORT $F1619
	nop	
$FC1620:
; Line 1689
	mov	bx,WORD PTR [bp-6]	;i
	shl	bx,1
	mov	WORD PTR _DETECTED_TARG[bx],0
	inc	WORD PTR [bp-6]	;i
$F1619:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-6],ax	;i
	jl	$FC1620
; Line 1694
	mov	ax,WORD PTR _TARGFILE
	mov	WORD PTR [bp-4],ax	;t
; Line 1695
	mov	ax,WORD PTR _AGEDTARGFILE
	mov	WORD PTR _TARGFILE,ax
; Line 1696
	mov	ax,WORD PTR [bp-4]	;t
	mov	WORD PTR _AGEDTARGFILE,ax
; Line 1699
	mov	ax,WORD PTR _TARGFILECNT
	mov	WORD PTR [bp-2],ax	;c
; Line 1700
	mov	ax,WORD PTR _AGEDTARGFILECNT
	mov	WORD PTR _TARGFILECNT,ax
; Line 1701
	mov	ax,WORD PTR [bp-2]	;c
	mov	WORD PTR _AGEDTARGFILECNT,ax
; Line 1704
	sub	ax,ax
	mov	WORD PTR _CUR_BAR,ax
	mov	bx,WORD PTR _TARGFILECNT
	mov	WORD PTR [bx],ax
; Line 1705
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ResetBar	ENDP
; Line 1709
	PUBLIC	_SetupNewTarget
_SetupNewTarget	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
	push	si
;	x = -4
;	y = -8
;	z = -12
;	plane = 6
;	t = 4
; Line 1714
	mov	bx,WORD PTR [bp+4]	;t
	mov	WORD PTR [bx],0
; Line 1715
	mov	ax,40
	imul	WORD PTR [bp+6]	;plane
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
	sub	ax,WORD PTR _PxLng
	sbb	dx,WORD PTR _PxLng+2
	mov	WORD PTR [bp-4],ax	;x
	mov	WORD PTR [bp-2],dx
; Line 1716
	mov	cx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	si,dx
	cwd	
	sub	ax,WORD PTR _Alt
	sbb	dx,0
	mov	WORD PTR [bp-8],ax	;y
	mov	WORD PTR [bp-6],dx
; Line 1717
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _ps[bx+12]
	sbb	dx,WORD PTR _ps[bx+14]
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	mov	WORD PTR [bp-12],ax	;z
	mov	WORD PTR [bp-10],dx
; Line 1719
	push	si
	push	cx
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$L20055
	jl	$L20053
	cmp	ax,18900
	jae	$L20055
$L20053:
	push	WORD PTR [bp-6]
	push	WORD PTR [bp-8]	;y
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$L20055
	jl	$L20054
	cmp	ax,18900
	jae	$L20055
$L20054:
	push	WORD PTR [bp-10]
	push	WORD PTR [bp-12]	;z
	call	_labs
	add	sp,4
	or	dx,dx
	jl	$I1628
	jg	$L20055
	cmp	ax,18900
	jb	$I1628
$L20055:
; Line 1720
	mov	al,5
	push	ax
	lea	cx,WORD PTR [bp-4]	;x
	push	cx
	call	__aNNalshr
; Line 1721
	mov	al,5
	push	ax
	lea	cx,WORD PTR [bp-8]	;y
	push	cx
	call	__aNNalshr
; Line 1722
	mov	al,5
	push	ax
	lea	ax,WORD PTR [bp-12]	;z
	push	ax
	call	__aNNalshr
; Line 1723
	mov	bx,WORD PTR [bp+4]	;t
	inc	WORD PTR [bx]
; Line 1724
; Line 1726
$I1628:
	mov	ax,WORD PTR [bp-4]	;x
	mov	bx,WORD PTR [bp+4]	;t
	mov	WORD PTR [bx+2],ax
; Line 1727
	mov	ax,WORD PTR [bp-8]	;y
	mov	WORD PTR [bx+4],ax
; Line 1728
	mov	ax,WORD PTR [bp-12]	;z
	mov	WORD PTR [bx+6],ax
; Line 1731
	mov	ax,40
	imul	WORD PTR [bp+6]	;plane
	mov	si,ax
	mov	ax,WORD PTR _OurHead
	sub	ax,WORD PTR _ps[si+16]
	mov	WORD PTR [bx+32],ax
; Line 1732
	mov	ax,WORD PTR [bp+6]	;plane
	mov	WORD PTR [bx+26],ax
; Line 1733
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_SetupNewTarget	ENDP
; Line 1737
	PUBLIC	_orient_to_player
_orient_to_player	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	V = -6
;	t = 4
; Line 1742
	mov	bx,WORD PTR [bp+4]	;t
	mov	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-6],ax	;V
; Line 1743
	mov	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-4],ax
; Line 1744
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-2],ax
; Line 1745
	mov	ax,OFFSET DGROUP:_PLYR_M
	push	ax
	lea	ax,WORD PTR [bp-6]	;V
	push	ax
	call	_Rotate
	add	sp,4
; Line 1747
	mov	ax,WORD PTR [bp-6]	;V
	mov	bx,WORD PTR [bp+4]	;t
	mov	WORD PTR [bx+8],ax
; Line 1748
	mov	ax,WORD PTR [bp-4]
	mov	WORD PTR [bx+10],ax
; Line 1749
	mov	ax,WORD PTR [bp-2]
	mov	WORD PTR [bx+12],ax
; Line 1750
	push	ax
	push	WORD PTR [bx+10]
	push	WORD PTR [bx+8]
	call	_Dist3D
	mov	bx,WORD PTR [bp+4]	;t
	mov	WORD PTR [bx+20],ax
; Line 1751
	mov	sp,bp
	pop	bp
	ret	
	nop	

_orient_to_player	ENDP
; Line 1755
orient_to_beam	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	V = -6
;	t = 4
; Line 1759
	mov	bx,WORD PTR [bp+4]	;t
	mov	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-6],ax	;V
; Line 1760
	mov	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-4],ax
; Line 1761
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-2],ax
; Line 1763
	mov	ax,OFFSET DGROUP:$S1008_BEAM_M
	push	ax
	lea	ax,WORD PTR [bp-6]	;V
	push	ax
	call	_Rotate
; Line 1764
	mov	ax,WORD PTR [bp-6]	;V
	mov	bx,WORD PTR [bp+4]	;t
	mov	WORD PTR [bx+14],ax
; Line 1765
	mov	ax,WORD PTR [bp-4]
	mov	WORD PTR [bx+16],ax
; Line 1766
	mov	ax,WORD PTR [bp-2]
	mov	WORD PTR [bx+18],ax
; Line 1767
	mov	sp,bp
	pop	bp
	ret	

orient_to_beam	ENDP
; Line 1771
	PUBLIC	_InBeam
_InBeam	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
	push	si
;	az_angle = -2
;	el_angle = -12
;	bar_angle = -14
;	rng = -10
;	tempplane = -6
;	t = 4
; Line 1777
	mov	ax,40
	mov	bx,WORD PTR [bp+4]	;t
	imul	WORD PTR [bx+26]
	mov	si,ax
	push	WORD PTR _ps[si+22]
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-6],ax	;tempplane
	mov	WORD PTR [bp-4],dx
; Line 1782
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20056
	mov	bx,WORD PTR _RANGE
	shl	bx,1
	mov	ax,WORD PTR _BRANGES[bx]
	cwd	
	jmp	SHORT $L20057
$L20056:
	mov	bx,WORD PTR _RANGE
	shl	bx,1
	mov	ax,WORD PTR _BRANGES[bx]
	cwd	
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
$L20057:
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1784
	cmp	WORD PTR _AWG9_REALITY_LEVEL,0
	je	$I1645
; Line 1785
	mov	bx,WORD PTR [bp+4]	;t
	mov	ax,WORD PTR [bx+20]
	cwd	
	cmp	dx,WORD PTR [bp-8]
	jl	$I1645
	jg	$L20058
	cmp	ax,WORD PTR [bp-10]	;rng
	jbe	$I1645
$L20058:
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1786
$I1645:
; Line 1788
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20059
	mov	ax,9500
	cwd	
	jmp	SHORT $L20060
$L20059:
	mov	ax,-23680
	mov	dx,4
$L20060:
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1795
	cmp	WORD PTR _AWG9_REALITY_LEVEL,0
	jne	$JCC8459
	jmp	$SB1648
$JCC8459:
; Line 1796
	mov	ax,WORD PTR _AWG9_MODE
	jmp	$S1647
; Line 1797
$SC1651:
; Line 1802
	les	bx,DWORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],1
	jne	$I1652
; Line 1803
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20061
	mov	ax,1900
	jmp	SHORT $L20196
	nop	
$L20061:
	mov	ax,-4736
$L20196:
	sub	dx,dx
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1804
; Line 1805
$I1652:
	mov	bx,WORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],2
	jne	$I1653
; Line 1806
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20063
	mov	ax,4275
	cwd	
	jmp	SHORT $L20064
	nop	
$L20063:
	mov	ax,5728
	mov	dx,2
$L20064:
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1807
; Line 1808
$I1653:
	mov	bx,WORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],3
	jne	$I1654
; Line 1809
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20065
	mov	ax,4988
	cwd	
	jmp	SHORT $L20066
$L20065:
	mov	ax,28544
	mov	dx,2
$L20066:
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1810
; Line 1811
$I1654:
	mov	bx,WORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],4
	jne	$I1655
; Line 1812
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20067
	mov	ax,5938
	cwd	
	jmp	SHORT $L20068
$L20067:
	mov	ax,-6592
	mov	dx,2
$L20068:
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1813
; Line 1814
$I1655:
	mov	bx,WORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],5
	je	$JCC8622
	jmp	$SB1648
$JCC8622:
; Line 1815
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$JCC8633
	jmp	$L20203
$JCC8633:
$L20069:
	mov	ax,-11328
	mov	dx,3
$L20070:
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1816
; Line 1817
	jmp	$SB1648
; Line 1818
	nop	
$SC1657:
; Line 1824
	les	bx,DWORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],1
	jne	$I1658
; Line 1825
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20071
	mov	ax,1900
	jmp	SHORT $L20197
	nop	
$L20071:
	mov	ax,-4736
$L20197:
	sub	dx,dx
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1826
; Line 1827
$I1658:
	mov	bx,WORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],2
	jne	$I1659
; Line 1828
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20073
	mov	ax,4275
	cwd	
	jmp	SHORT $L20074
	nop	
$L20073:
	mov	ax,5728
	mov	dx,2
$L20074:
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1829
; Line 1830
$I1659:
	mov	bx,WORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],3
	jne	$I1660
; Line 1831
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20075
	mov	ax,4988
	cwd	
	jmp	SHORT $L20076
$L20075:
	mov	ax,28544
	mov	dx,2
$L20076:
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1832
; Line 1833
$I1660:
	mov	bx,WORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],4
	jne	$I1661
; Line 1834
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20077
	mov	ax,5938
	cwd	
	jmp	SHORT $L20078
$L20077:
	mov	ax,-6592
	mov	dx,2
$L20078:
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1835
; Line 1836
$I1661:
	mov	bx,WORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],5
	je	$JCC8806
	jmp	$SB1648
$JCC8806:
; Line 1837
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	jne	$JCC8817
	jmp	$L20069
$JCC8817:
$L20203:
	mov	ax,7838
	jmp	$L20204
$SC1663:
; Line 1844
	les	bx,DWORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],1
	jne	$I1664
; Line 1845
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20081
	mov	ax,2850
	cwd	
	jmp	SHORT $L20082
$L20081:
	mov	ax,25664
	mov	dx,1
$L20082:
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1846
; Line 1847
$I1664:
	mov	bx,WORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],2
	jne	$I1665
; Line 1848
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20083
	mov	ax,5463
	cwd	
	jmp	SHORT $L20084
$L20083:
	mov	ax,-21792
	mov	dx,2
$L20084:
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1849
; Line 1850
$I1665:
	mov	bx,WORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],3
	jne	$I1666
; Line 1851
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20085
	mov	ax,6413
	cwd	
	jmp	SHORT $L20086
$L20085:
	mov	ax,8608
	mov	dx,3
$L20086:
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1852
; Line 1853
$I1666:
	mov	bx,WORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],4
	jne	$I1667
; Line 1854
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20087
	mov	ax,7125
	cwd	
	jmp	SHORT $L20088
$L20087:
	mov	ax,31392
	mov	dx,3
$L20088:
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1855
; Line 1856
$I1667:
	mov	bx,WORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],5
	je	$JCC8980
	jmp	$SB1648
$JCC8980:
; Line 1857
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20089
	mov	ax,9025
$L20204:
	cwd	
	jmp	$L20070
$L20089:
	mov	ax,26656
	mov	dx,4
	jmp	$L20070
; Line 1860
	nop	
$SC1669:
; Line 1863
	les	bx,DWORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],1
	jne	$I1670
; Line 1864
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20091
	mov	ax,238
	jmp	SHORT $L20198
	nop	
$L20091:
	mov	ax,7616
$L20198:
	sub	dx,dx
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1865
; Line 1866
$I1670:
	mov	bx,WORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],2
	jne	$I1671
; Line 1867
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20093
	mov	ax,238
	jmp	SHORT $L20199
$L20093:
	mov	ax,7616
$L20199:
	sub	dx,dx
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1868
; Line 1869
$I1671:
	mov	bx,WORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],3
	jne	$I1672
; Line 1870
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20095
	mov	ax,238
	jmp	SHORT $L20200
$L20095:
	mov	ax,7616
$L20200:
	sub	dx,dx
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1871
; Line 1872
$I1672:
	mov	bx,WORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],4
	jne	$I1673
; Line 1873
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20097
	mov	ax,380
	jmp	SHORT $L20201
$L20097:
	mov	ax,12160
$L20201:
	sub	dx,dx
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1874
; Line 1875
$I1673:
	mov	bx,WORD PTR [bp-6]	;tempplane
	cmp	WORD PTR es:[bx+18],5
	jne	$SB1648
; Line 1876
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20099
	mov	ax,570
	jmp	SHORT $L20202
$L20099:
	mov	ax,18240
$L20202:
	sub	dx,dx
	jmp	$L20070
$S1647:
	sub	ax,100
	test	al,1
	jne	$SB1648
	cmp	ax,54
	ja	$SB1648
	xchg	ax,bx
	jmp	WORD PTR cs:$L20101[bx]
$L20101:
		DW	$SC1663
		DW	$SC1663
		DW	$SC1663
		DW	$SC1663
		DW	$SB1648
		DW	$SC1651
		DW	$SC1651
		DW	$SC1651
		DW	$SC1651
		DW	$SB1648
		DW	$SB1648
		DW	$SC1657
		DW	$SC1657
		DW	$SC1657
		DW	$SB1648
		DW	$SB1648
		DW	$SC1657
		DW	$SC1657
		DW	$SC1657
		DW	$SB1648
		DW	$SB1648
		DW	$SB1648
		DW	$SB1648
		DW	$SB1648
		DW	$SB1648
		DW	$SC1669
		DW	$SB1648
		DW	$SC1669
$SB1648:
; Line 1879
; Line 1883
	cmp	WORD PTR _AWG9_REALITY_LEVEL,0
	jne	$I1675
; Line 1884
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20102
	mov	ax,9500
	cwd	
	jmp	SHORT $L20103
	nop	
$L20102:
	mov	ax,-23680
	mov	dx,4
$L20103:
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1885
; Line 1887
$I1675:
	mov	bx,WORD PTR [bp+4]	;t
	mov	ax,WORD PTR [bx+20]
	cwd	
	cmp	dx,WORD PTR [bp-8]
	jl	$I1676
	jle	$JCC9298
	jmp	$L20058
$JCC9298:
	cmp	ax,WORD PTR [bp-10]	;rng
	jbe	$JCC9306
	jmp	$L20058
$JCC9306:
; Line 1888
$I1676:
	cmp	WORD PTR [bx+12],0
	jge	$JCC9315
	jmp	$L20058
$JCC9315:
; Line 1890
	push	WORD PTR [bx+12]
	push	WORD PTR [bx+8]
	call	_ARCTAN
	add	sp,4
	mov	bx,WORD PTR [bp+4]	;t
	mov	WORD PTR [bx+28],ax
; Line 1891
	push	WORD PTR [bx+12]
	push	WORD PTR [bx+10]
	call	_ARCTAN
	add	sp,4
	neg	ax
	mov	bx,WORD PTR [bp+4]	;t
	mov	WORD PTR [bx+30],ax
; Line 1893
	cmp	WORD PTR [bx],0
	jne	$I1678
	cmp	WORD PTR [bx+20],125
	jg	$JCC9367
	jmp	$L20058
$JCC9367:
; Line 1896
$I1678:
	mov	bx,WORD PTR [bp+4]	;t
	push	WORD PTR [bx+28]
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR $S976_Angles+2
	jle	$JCC9388
	jmp	$L20058
$JCC9388:
; Line 1899
	mov	bx,WORD PTR [bp+4]	;t
	push	WORD PTR [bx+30]
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR $S976_Angles+2
	jle	$JCC9409
	jmp	$L20058
$JCC9409:
; Line 1901
; Line 1903
	cmp	WORD PTR _AWG9_MODE,154
	jne	$I1681
; Line 1904
	mov	bx,WORD PTR [bp+4]	;t
	push	WORD PTR [bx+28]
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR $S976_Angles+14
	jle	$JCC9438
	jmp	$L20058
$JCC9438:
; Line 1905
	mov	bx,WORD PTR [bp+4]	;t
	push	WORD PTR [bx+30]
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR $S976_Angles+14
	jle	$JCC9459
	jmp	$L20058
$JCC9459:
; Line 1906
$I1683:
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1907
; Line 1909
$I1681:
	cmp	WORD PTR _AWG9_MODE,150
	jne	$I1684
; Line 1910
	mov	bx,WORD PTR [bp+4]	;t
	push	WORD PTR [bx+28]
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR $S976_Angles+14
	jle	$I1683
	jmp	$L20058
	nop	
$I1684:
	cmp	WORD PTR _AWG9_MODE,200
	je	$I1683
	cmp	WORD PTR _AWG9_MODE,202
	je	$I1683
; Line 1920
	mov	bx,WORD PTR [bp+4]	;t
	push	WORD PTR [bx+18]
	push	WORD PTR [bx+14]
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-2],ax	;az_angle
; Line 1921
	mov	bx,WORD PTR [bp+4]	;t
	push	WORD PTR [bx+18]
	push	WORD PTR [bx+16]
	call	_ARCTAN
	add	sp,4
	neg	ax
	mov	WORD PTR [bp-12],ax	;el_angle
; Line 1924
	push	WORD PTR [bp-2]	;az_angle
	call	_abs
	add	sp,2
	mov	bx,WORD PTR _SELECTED_AZ
	shl	bx,1
	shl	bx,1
	cmp	WORD PTR $S976_Angles[bx+2],ax
	jge	$JCC9577
	jmp	$L20058
$JCC9577:
; Line 1926
; Line 1928
	push	WORD PTR [bp-12]	;el_angle
	call	_abs
	add	sp,2
	mov	cx,ax
	mov	ax,419
	imul	WORD PTR _SELECTED_BAR_NUM
	cmp	cx,ax
	jle	$JCC9602
	jmp	$L20058
$JCC9602:
; Line 1930
; Line 1933
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],1
	sbb	ax,ax
	and	ax,14725
	add	ax,475
	cwd	
	mov	WORD PTR [bp-10],ax	;rng
	mov	WORD PTR [bp-8],dx
; Line 1934
	mov	cx,ax
	mov	ax,WORD PTR [bx+20]
	mov	bx,dx
	cwd	
	cmp	bx,dx
	jl	$I1690
	jle	$JCC9640
	jmp	$I1683
$JCC9640:
	cmp	cx,ax
	jb	$JCC9647
	jmp	$I1683
$JCC9647:
; Line 1937
$I1690:
	cmp	WORD PTR _AWG9_REALITY_LEVEL,1
	jne	$JCC9657
	jmp	$I1683
$JCC9657:
; Line 1952
	mov	ax,182
	imul	WORD PTR _AZSWEEP
	cmp	ax,WORD PTR [bp-2]	;az_angle
	jge	$I1692
	cmp	WORD PTR _AZSWEEP_DIR,0
	je	$JCC9679
	jmp	$L20058
$JCC9679:
; Line 1954
; Line 1955
$I1692:
	mov	ax,182
	imul	WORD PTR _AZSWEEP
	cmp	ax,WORD PTR [bp-2]	;az_angle
	jg	$JCC9694
	jmp	$I1683
$JCC9694:
	cmp	WORD PTR _AZSWEEP_DIR,0
	je	$JCC9704
	jmp	$I1683
$JCC9704:
	jmp	$L20058

_InBeam	ENDP
; Line 1964
	PUBLIC	_UpdateConsoleXY
_UpdateConsoleXY	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	rng = -2
;	t = 4
; Line 1968
	cmp	WORD PTR _AWG9_REALITY_LEVEL,0
	jne	$I1697
; Line 1969
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20110
	mov	bx,WORD PTR _RANGE
	shl	bx,1
	mov	ax,WORD PTR _BRANGES[bx]
	jmp	SHORT $L20111
$L20110:
	mov	bx,WORD PTR _RANGE
	shl	bx,1
	mov	ax,WORD PTR _BRANGES[bx]
	mov	cl,5
	shl	ax,cl
$L20111:
	mov	WORD PTR [bp-2],ax	;rng
; Line 1970
	mov	ax,120
	cwd	
	push	dx
	push	ax
	mov	bx,WORD PTR [bp+4]	;t
	mov	ax,WORD PTR [bx+28]
	mov	cx,182
	cwd	
	idiv	cx
	mov	cx,83
	imul	cx
	push	dx
	push	ax
	call	__aNldiv
	add	ax,41
	mov	bx,WORD PTR [bp+4]	;t
	mov	WORD PTR [bx+22],ax
; Line 1971
	mov	ax,WORD PTR [bp-2]	;rng
	sub	dx,dx
	push	dx
	push	ax
	mov	ax,-66
	imul	WORD PTR [bx+20]
	push	dx
	push	ax
	call	__aNldiv
	add	ax,66
	mov	bx,WORD PTR [bp+4]	;t
	mov	WORD PTR [bx+24],ax
; Line 1972
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 1973
; Line 1975
$I1697:
	cmp	WORD PTR _AWG9_MODE,300
	je	$I1698
; Line 1976
	mov	ax,120
	cwd	
	push	dx
	push	ax
	mov	bx,WORD PTR [bp+4]	;t
	mov	ax,WORD PTR [bx+28]
	mov	cx,182
	cwd	
	idiv	cx
	mov	cx,83
	imul	cx
	push	dx
	push	ax
	call	__aNldiv
	add	ax,41
	mov	bx,WORD PTR [bp+4]	;t
	mov	WORD PTR [bx+22],ax
; Line 1977
	mov	ax,1300
	cwd	
	push	dx
	push	ax
	mov	ax,-31
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bx+40]
	push	WORD PTR [bx+38]
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	add	ax,32
	jmp	SHORT $L20205
$I1698:
; Line 1979
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20112
	mov	bx,WORD PTR _RANGE
	shl	bx,1
	mov	ax,WORD PTR _BRANGES[bx]
	jmp	SHORT $L20113
$L20112:
	mov	bx,WORD PTR _RANGE
	shl	bx,1
	mov	ax,WORD PTR _BRANGES[bx]
	mov	cl,5
	shl	ax,cl
$L20113:
	mov	WORD PTR [bp-2],ax	;rng
; Line 1980
	mov	ax,120
	cwd	
	push	dx
	push	ax
	mov	bx,WORD PTR [bp+4]	;t
	mov	ax,WORD PTR [bx+28]
	mov	cx,182
	cwd	
	idiv	cx
	mov	cx,83
	imul	cx
	push	dx
	push	ax
	call	__aNldiv
	add	ax,41
	mov	bx,WORD PTR [bp+4]	;t
	mov	WORD PTR [bx+22],ax
; Line 1981
	mov	ax,WORD PTR [bp-2]	;rng
	sub	dx,dx
	push	dx
	push	ax
	mov	ax,-66
	imul	WORD PTR [bx+20]
	push	dx
	push	ax
	call	__aNldiv
	add	ax,66
$L20205:
	mov	bx,WORD PTR [bp+4]	;t
	mov	WORD PTR [bx+24],ax
; Line 1982
; Line 1983
	mov	sp,bp
	pop	bp
	ret	
	nop	

_UpdateConsoleXY	ENDP
; Line 1987
	PUBLIC	_AddTargetFile
_AddTargetFile	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	di
	push	si
;	i = -2
;	j = -4
;	t = 4
; Line 1990
	mov	bx,WORD PTR _TARGFILECNT
	cmp	WORD PTR [bx],24
	jge	$I1704
; Line 1991
	mov	ax,50
	imul	WORD PTR [bx]
	add	ax,WORD PTR _TARGFILE
	mov	WORD PTR [bp-6],ax
	inc	WORD PTR [bx]
	mov	si,WORD PTR [bp+4]	;t
	push	ds
	pop	es
	mov	di,WORD PTR [bp-6]
	mov	cx,25
	rep	movsw
; Line 1992
$I1704:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AddTargetFile	ENDP
; Line 1996
	PUBLIC	_DelTargetFile
_DelTargetFile	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	di
	push	si
;	i = -2
;	n = 4
; Line 1999
	mov	bx,WORD PTR _TARGFILECNT
	mov	ax,WORD PTR [bp+4]	;n
	cmp	WORD PTR [bx],ax
	jg	$I1708
	sub	ax,ax
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 2000
$I1708:
	mov	WORD PTR [bp-2],ax	;i
	jmp	SHORT $F1709
	nop	
$FC1710:
; Line 2001
	mov	ax,50
	imul	WORD PTR [bp-2]	;i
	mov	bx,WORD PTR _TARGFILE
	add	bx,ax
	mov	di,bx
	lea	si,WORD PTR [bx+50]
	mov	ax,ds
	mov	es,ax
	mov	cx,25
	rep	movsw
	inc	WORD PTR [bp-2]	;i
$F1709:
	mov	bx,WORD PTR _TARGFILECNT
	mov	ax,WORD PTR [bx]
	dec	ax
	cmp	ax,WORD PTR [bp-2]	;i
	jg	$FC1710
; Line 2002
	dec	WORD PTR [bx]
; Line 2003
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DelTargetFile	ENDP
; Line 2007
	PUBLIC	_RioLockCheck
_RioLockCheck	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	si
;	dist = -2
;	n = -8
;	i = -6
;	rng = -4
; Line 2013
	cmp	WORD PTR _AWG9_MODE,202
	je	$I1719
	cmp	WORD PTR _AWG9_MODE,300
	jne	$I1718
$I1719:
; Line 2014
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 2016
	nop	
$I1718:
	mov	WORD PTR [bp-6],0	;i
	mov	WORD PTR [bp-2],32767	;dist
	mov	WORD PTR [bp-8],-1	;n
	jmp	SHORT $F1720
	nop	
$FC1721:
; Line 2017
	mov	cx,50
	imul	cx
	mov	bx,ax
	mov	si,WORD PTR _TARGFILE
	cmp	WORD PTR [bx][si],1
	sbb	ax,ax
	and	ax,-13272
	add	ax,3800
; Line 2018
	add	si,bx
	cmp	ax,WORD PTR [si+20]
	jb	$L20208
; Line 2019
	mov	ax,cx
	imul	WORD PTR [bp-6]	;i
	mov	si,ax
	mov	bx,WORD PTR _TARGFILE
	mov	ax,WORD PTR [bp-2]	;dist
	cmp	WORD PTR [bx+20][si],ax
	jge	$L20208
; Line 2020
	mov	ax,WORD PTR [bp-6]	;i
	mov	WORD PTR [bp-8],ax	;n
; Line 2021
	mov	cx,WORD PTR [bx+20][si]
	mov	WORD PTR [bp-2],cx	;dist
; Line 2022
; Line 2023
$L20208:
	inc	WORD PTR [bp-6]	;i
$F1720:
	mov	bx,WORD PTR _TARGFILECNT
	mov	ax,WORD PTR [bp-6]	;i
	cmp	WORD PTR [bx],ax
	jg	$FC1721
; Line 2025
	cmp	WORD PTR [bp-8],-1	;n
	je	$I1719
; Line 2031
	mov	ax,50
	imul	WORD PTR [bp-8]	;n
	mov	si,ax
	mov	bx,WORD PTR _TARGFILE
	mov	ax,40
	imul	WORD PTR [bx+26][si]
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],4
	je	$JCC10315
	jmp	$I1719
$JCC10315:
; Line 2035
	mov	ax,OFFSET DGROUP:$SG1728
	push	ax
	call	_Message
	add	sp,2
; Line 2036
; Line 2039
	mov	ax,50
	imul	WORD PTR [bp-8]	;n
	mov	bx,ax
	add	bx,WORD PTR _TARGFILE
	mov	ax,WORD PTR [bx+26]
	mov	WORD PTR _DESIGNATED,ax
	mov	WORD PTR _LOCKED,ax
; Line 2040
	push	WORD PTR [bx+24]
	push	WORD PTR [bx+22]
	call	acquire
	add	sp,4
; Line 2042
	cmp	WORD PTR _AWG9_REALITY_LEVEL,0
	jne	$I1729
; Line 2043
	mov	ax,202
	jmp	SHORT $L20209
	nop	
$I1729:
; Line 2045
	mov	ax,300
$L20209:
	push	ax
	call	mode_flip
	add	sp,2
; Line 2046
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_RioLockCheck	ENDP
; Line 2052
	PUBLIC	_SpecialModeAcq
_SpecialModeAcq	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	si
;	dist = -2
;	n = -8
;	i = -6
;	rng = -4
; Line 2056
	cmp	WORD PTR _AWG9_MODE,154
	je	$I1736
	cmp	WORD PTR _AWG9_MODE,150
	je	$I1736
$L20210:
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 2058
	nop	
$I1736:
	mov	WORD PTR [bp-6],0	;i
	mov	WORD PTR [bp-2],32767	;dist
	mov	WORD PTR [bp-8],-1	;n
	jmp	SHORT $F1737
	nop	
$FC1738:
; Line 2059
	mov	cx,50
	imul	cx
	mov	bx,ax
	mov	si,WORD PTR _TARGFILE
	cmp	WORD PTR [bx][si],1
	sbb	ax,ax
	and	ax,14725
	add	ax,475
; Line 2060
	add	si,bx
	cmp	ax,WORD PTR [si+20]
	jb	$L20211
; Line 2061
	mov	ax,cx
	imul	WORD PTR [bp-6]	;i
	mov	si,ax
	mov	bx,WORD PTR _TARGFILE
	mov	ax,WORD PTR [bp-2]	;dist
	cmp	WORD PTR [bx+20][si],ax
	jge	$L20211
; Line 2062
	mov	ax,WORD PTR [bp-6]	;i
	mov	WORD PTR [bp-8],ax	;n
; Line 2063
	mov	cx,WORD PTR [bx+20][si]
	mov	WORD PTR [bp-2],cx	;dist
; Line 2064
; Line 2065
$L20211:
	inc	WORD PTR [bp-6]	;i
$F1737:
	mov	bx,WORD PTR _TARGFILECNT
	mov	ax,WORD PTR [bp-6]	;i
	cmp	WORD PTR [bx],ax
	jg	$FC1738
; Line 2067
	cmp	WORD PTR [bp-8],-1	;n
	je	$L20210
; Line 2070
	mov	ax,50
	imul	WORD PTR [bp-8]	;n
	mov	bx,ax
	add	bx,WORD PTR _TARGFILE
	mov	ax,WORD PTR [bx+26]
	mov	WORD PTR _DESIGNATED,ax
	mov	WORD PTR _LOCKED,ax
; Line 2071
	push	WORD PTR [bx+24]
	push	WORD PTR [bx+22]
	call	acquire
	add	sp,4
; Line 2072
	mov	ax,300
	push	ax
	call	mode_flip
	add	sp,2
; Line 2073
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_SpecialModeAcq	ENDP
; Line 2077
	PUBLIC	_StandardSpecialModeAcq
_StandardSpecialModeAcq	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	si
;	dist = -2
;	n = -6
;	i = -4
; Line 2080
	mov	WORD PTR [bp-4],0	;i
	mov	WORD PTR [bp-2],32767	;dist
	mov	WORD PTR [bp-6],-1	;n
	jmp	SHORT $F1748
	nop	
$FC1749:
; Line 2081
	mov	cx,50
	imul	cx
	mov	si,ax
	mov	bx,WORD PTR _TARGFILE
	mov	ax,WORD PTR [bp-2]	;dist
	cmp	WORD PTR [bx+20][si],ax
	jge	$L20212
; Line 2082
	mov	ax,WORD PTR [bp-4]	;i
	mov	WORD PTR [bp-6],ax	;n
; Line 2083
	mov	ax,WORD PTR [bx+20][si]
	mov	WORD PTR [bp-2],ax	;dist
; Line 2084
; Line 2085
$L20212:
	inc	WORD PTR [bp-4]	;i
$F1748:
	mov	bx,WORD PTR _TARGFILECNT
	mov	ax,WORD PTR [bp-4]	;i
	cmp	WORD PTR [bx],ax
	jg	$FC1749
; Line 2087
	cmp	WORD PTR [bp-6],-1	;n
	jne	$I1752
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 2088
$I1752:
; Line 2089
	mov	ax,50
	imul	WORD PTR [bp-6]	;n
	mov	bx,ax
	add	bx,WORD PTR _TARGFILE
	mov	ax,WORD PTR [bx+26]
	mov	WORD PTR _DESIGNATED,ax
	mov	WORD PTR _LOCKED,ax
; Line 2090
	push	WORD PTR [bx+24]
	push	WORD PTR [bx+22]
	call	acquire
	add	sp,4
; Line 2091
	mov	ax,202
	push	ax
	call	mode_flip
	add	sp,2
; Line 2092
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_StandardSpecialModeAcq	ENDP
; Line 2096
acquire	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	y = 6
;	x = 4
; Line 2097
	mov	ax,WORD PTR [bp+4]	;x
	mov	WORD PTR $S1001_ACQ_X,ax
; Line 2098
	mov	ax,WORD PTR [bp+6]	;y
	mov	WORD PTR $S1002_ACQ_Y,ax
; Line 2099
	mov	sp,bp
	pop	bp
	ret	

acquire	ENDP
; Line 2103
	PUBLIC	_aa_acquire
_aa_acquire	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__aNchkstk
;	xmin = -10
;	xmax = -14
;	ymin = -12
;	ymax = -16
;	i = -4
;	new = -8
;	tf = -6
;	t = -2
;	flag = 4
; Line 2107
	call	_BuildAcqList
; Line 2109
	cmp	WORD PTR [bp+4],0	;flag
	je	$JCC10746
	jmp	$I1767
$JCC10746:
; Line 2111
	cmp	WORD PTR _ACQLISTCNT,0
	jne	$I1768
$L20213:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 2113
$I1768:
	mov	WORD PTR [bp-4],0	;i
	jmp	SHORT $F1769
; Line 2116
	nop	
$FC1770:
	inc	WORD PTR [bp-4]	;i
$F1769:
	mov	ax,WORD PTR [bp-4]	;i
	cmp	WORD PTR _ACQLISTCNT,ax
	jle	$FB1771
; Line 2114
	mov	bx,ax
	shl	bx,1
	mov	bx,WORD PTR _ACQLIST[bx]
	mov	ax,WORD PTR _DESIGNATED
	cmp	WORD PTR [bx+26],ax
	jne	$FC1770
$FB1771:
	mov	ax,WORD PTR [bp-4]	;i
	cmp	WORD PTR _ACQLISTCNT,ax
	jne	$I1773
	mov	WORD PTR [bp-4],-1	;i
; Line 2117
$I1773:
	inc	WORD PTR [bp-4]	;i
	mov	ax,WORD PTR _ACQLISTCNT
	cmp	WORD PTR [bp-4],ax	;i
	jl	$I1774
	mov	WORD PTR [bp-4],0	;i
; Line 2119
$I1774:
	cmp	WORD PTR [bp-4],-1	;i
	jne	$I1775
	mov	ax,-1
	mov	sp,bp
	pop	bp
	ret	
; Line 2121
	nop	
$I1775:
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	mov	bx,WORD PTR _ACQLIST[bx]
	mov	ax,WORD PTR [bx+26]
	mov	WORD PTR _DESIGNATED,ax
; Line 2122
	mov	WORD PTR _LOCKED,-1
; Line 2124
	push	WORD PTR [bx+24]
	push	WORD PTR [bx+22]
	call	acquire
	add	sp,4
; Line 2130
	jmp	$I1776
$I1767:
; Line 2133
	mov	ax,WORD PTR _MouseCrtY
	dec	ax
	push	ax
	mov	ax,WORD PTR _MouseCrtX
	dec	ax
	push	ax
	call	acquire
	add	sp,4
; Line 2135
	mov	ax,WORD PTR $S1001_ACQ_X
	sub	ax,4
	mov	WORD PTR [bp-10],ax	;xmin
; Line 2136
	mov	ax,WORD PTR $S1002_ACQ_Y
	sub	ax,3
	mov	WORD PTR [bp-12],ax	;ymin
; Line 2137
	mov	ax,WORD PTR $S1001_ACQ_X
	add	ax,4
	mov	WORD PTR [bp-14],ax	;xmax
; Line 2138
	mov	ax,WORD PTR $S1002_ACQ_Y
	add	ax,3
	mov	WORD PTR [bp-16],ax	;ymax
; Line 2142
	mov	WORD PTR [bp-4],0	;i
	mov	WORD PTR [bp-8],-1	;new
	jmp	SHORT $F1777
; Line 2147
; Line 2148
$FC1778:
	inc	WORD PTR [bp-4]	;i
$F1777:
	mov	ax,WORD PTR [bp-4]	;i
	cmp	WORD PTR _ACQLISTCNT,ax
	jle	$FB1779
; Line 2144
	mov	bx,ax
	shl	bx,1
	mov	bx,WORD PTR _ACQLIST[bx]
	mov	ax,WORD PTR [bp-10]	;xmin
	cmp	WORD PTR [bx+22],ax
	jl	$FC1778
	mov	ax,WORD PTR [bp-12]	;ymin
	cmp	WORD PTR [bx+24],ax
	jl	$FC1778
	mov	ax,WORD PTR [bp-14]	;xmax
	cmp	WORD PTR [bx+22],ax
	jg	$FC1778
	mov	ax,WORD PTR [bp-16]	;ymax
	cmp	WORD PTR [bx+24],ax
	jg	$FC1778
; Line 2145
	mov	ax,WORD PTR [bx+26]
	mov	WORD PTR [bp-8],ax	;new
; Line 2146
$FB1779:
; Line 2150
	cmp	WORD PTR [bp-8],-1	;new
	jne	$JCC11006
	jmp	$L20213
$JCC11006:
; Line 2151
; Line 2152
; Line 2154
; Line 2156
	mov	ax,WORD PTR [bp-8]	;new
	mov	WORD PTR _DESIGNATED,ax
; Line 2157
	mov	WORD PTR _LOCKED,-1
; Line 2158
$I1776:
; Line 2160
	cmp	WORD PTR _RIO_ASSIST,0
	jne	$I1783
; Line 2161
	mov	ax,40
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	mov	bx,WORD PTR _ACQLIST[bx]
	imul	WORD PTR [bx+26]
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],4
	jne	$I1784
; Line 2162
	mov	ax,OFFSET DGROUP:$SG1785
	jmp	SHORT $L20214
	nop	
$I1784:
; Line 2165
	mov	ax,OFFSET DGROUP:$SG1787
$L20214:
	push	ax
	call	_Message
	add	sp,2
; Line 2166
; Line 2167
; Line 2169
$I1783:
	mov	ax,WORD PTR _AWG9_MODE
	jmp	SHORT $S1788
; Line 2170
	nop	
$SC1792:
; Line 2178
	mov	ax,WORD PTR _DESIGNATED
	mov	WORD PTR _LOCKED,ax
; Line 2179
	mov	ax,300
$L20215:
	push	ax
	call	_AWG9_CHANGE_MODE
	add	sp,2
; Line 2180
	mov	sp,bp
	pop	bp
	ret	
; Line 2181
$SC1793:
; Line 2182
	mov	ax,WORD PTR _DESIGNATED
	mov	WORD PTR _LOCKED,ax
; Line 2183
	mov	sp,bp
	pop	bp
	ret	
$SC1795:
; Line 2188
	mov	ax,WORD PTR _DESIGNATED
	mov	WORD PTR _LOCKED,ax
; Line 2189
	mov	ax,202
	jmp	SHORT $L20215
	nop	
$S1788:
	cmp	ax,200
	je	$SC1795
	ja	$L20118
	sub	ax,100
	test	al,1
	jne	$SB1789
	cmp	ax,16
	ja	$SB1789
	xchg	ax,bx
	jmp	WORD PTR cs:$L20119[bx]
	nop	
$L20119:
		DW	$SC1792
		DW	$SC1792
		DW	$SC1792
		DW	$SC1792
		DW	$SB1789
		DW	$SC1792
		DW	$SC1792
		DW	$SC1792
		DW	$SC1792
$L20118:
	sub	ax,202
	je	$SC1793
	sub	ax,98
	je	$SC1793
$SB1789:
; Line 2192
	mov	sp,bp
	pop	bp
	ret	

_aa_acquire	ENDP
; Line 2197
	PUBLIC	_DesignateTIDTarg
_DesignateTIDTarg	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__aNchkstk
;	xmin = -10
;	xmax = -14
;	ymin = -12
;	ymax = -16
;	i = -4
;	new = -8
;	Tidx = -2
;	Tidy = -6
; Line 2203
	mov	ax,30
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$I1806
	mov	ax,40
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$I1806
; Line 2204
$L20217:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 2206
	nop	
$I1806:
; Line 2207
	mov	ax,WORD PTR _MouseCrtY
	dec	ax
; Line 2209
	mov	cx,WORD PTR _MouseCrtX
	dec	cx
	mov	WORD PTR [bp-2],cx	;Tidx
	sub	cx,5
	mov	WORD PTR [bp-10],cx	;xmin
; Line 2210
	mov	cx,ax
	sub	ax,4
	mov	WORD PTR [bp-12],ax	;ymin
; Line 2211
	mov	ax,WORD PTR [bp-2]	;Tidx
	add	ax,5
	mov	WORD PTR [bp-14],ax	;xmax
; Line 2212
	add	cx,4
	mov	WORD PTR [bp-16],cx	;ymax
; Line 2215
	mov	WORD PTR [bp-8],-1	;new
; Line 2217
	mov	WORD PTR [bp-4],0	;i
	jmp	SHORT $F1807
; Line 2224
; Line 2225
	nop	
$FC1808:
	inc	WORD PTR [bp-4]	;i
$F1807:
	mov	ax,WORD PTR _TIDTargetCnt
	cmp	WORD PTR [bp-4],ax	;i
	jge	$FB1809
; Line 2221
	mov	bx,WORD PTR [bp-4]	;i
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR [bp-10]	;xmin
	cmp	WORD PTR _TIDTargetList[bx],ax
	jl	$FC1808
	mov	ax,WORD PTR [bp-12]	;ymin
	cmp	WORD PTR _TIDTargetList[bx+2],ax
	jl	$FC1808
	mov	ax,WORD PTR [bp-14]	;xmax
	cmp	WORD PTR _TIDTargetList[bx],ax
	jg	$FC1808
	mov	ax,WORD PTR [bp-16]	;ymax
	cmp	WORD PTR _TIDTargetList[bx+2],ax
	jg	$FC1808
; Line 2222
	mov	ax,WORD PTR _TIDTargetList[bx+4]
	mov	WORD PTR [bp-8],ax	;new
; Line 2223
$FB1809:
; Line 2227
	cmp	WORD PTR [bp-8],-1	;new
	jne	$JCC11351
	jmp	$L20217
$JCC11351:
; Line 2229
	mov	ax,15
	push	ax
	call	_GetWeaponCount
	add	sp,2
	dec	ax
	cmp	ax,WORD PTR _DesigTargCnt
	jge	$JCC11371
	jmp	$L20217
$JCC11371:
; Line 2233
	mov	cl,3
	mov	bx,WORD PTR _DesigTargCnt
	shl	bx,cl
	mov	WORD PTR _DESIG_TARG[bx],1
; Line 2234
	mov	ax,WORD PTR [bp-8]	;new
	mov	WORD PTR _DESIG_TARG[bx+2],ax
; Line 2235
	inc	WORD PTR _DesigTargCnt
; Line 2236
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DesignateTIDTarg	ENDP
; Line 2240
	PUBLIC	_SelectDesig
_SelectDesig	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__aNchkstk
;	xmin = -10
;	xmax = -14
;	ymin = -12
;	ymax = -16
;	i = -4
;	new = -8
;	Tidx = -2
;	Tidy = -6
; Line 2246
	mov	ax,30
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$I1823
	mov	ax,40
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$I1823
; Line 2247
$L20218:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 2249
	nop	
$I1823:
; Line 2250
	mov	ax,WORD PTR _MouseCrtY
	dec	ax
; Line 2252
	mov	cx,WORD PTR _MouseCrtX
	dec	cx
	mov	WORD PTR [bp-2],cx	;Tidx
	sub	cx,5
	mov	WORD PTR [bp-10],cx	;xmin
; Line 2253
	mov	cx,ax
	sub	ax,4
	mov	WORD PTR [bp-12],ax	;ymin
; Line 2254
	mov	ax,WORD PTR [bp-2]	;Tidx
	add	ax,5
	mov	WORD PTR [bp-14],ax	;xmax
; Line 2255
	add	cx,4
	mov	WORD PTR [bp-16],cx	;ymax
; Line 2258
	mov	WORD PTR [bp-8],-1	;new
; Line 2260
	mov	WORD PTR [bp-4],0	;i
	jmp	SHORT $F1824
; Line 2268
; Line 2269
	nop	
$FC1825:
	inc	WORD PTR [bp-4]	;i
$F1824:
	mov	ax,WORD PTR _TIDTargetCnt
	cmp	WORD PTR [bp-4],ax	;i
	jge	$FB1826
; Line 2264
	mov	bx,WORD PTR [bp-4]	;i
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR [bp-10]	;xmin
	cmp	WORD PTR _TIDTargetList[bx],ax
	jl	$FC1825
	mov	ax,WORD PTR [bp-12]	;ymin
	cmp	WORD PTR _TIDTargetList[bx+2],ax
	jl	$FC1825
	mov	ax,WORD PTR [bp-14]	;xmax
	cmp	WORD PTR _TIDTargetList[bx],ax
	jg	$FC1825
	mov	ax,WORD PTR [bp-16]	;ymax
	cmp	WORD PTR _TIDTargetList[bx+2],ax
	jg	$FC1825
; Line 2265
	mov	ax,WORD PTR _TIDTargetList[bx+4]
	mov	WORD PTR _SelectedTarg,ax
; Line 2267
$FB1826:
; Line 2271
	cmp	WORD PTR [bp-8],-1	;new
	jne	$JCC11581
	jmp	$L20218
$JCC11581:
; Line 2272
	mov	sp,bp
	pop	bp
	ret	

_SelectDesig	ENDP
; Line 2277
	PUBLIC	_UpdateTIDTargs
_UpdateTIDTargs	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 2279
	ret	

_UpdateTIDTargs	ENDP
; Line 2283
	PUBLIC	_BuildAcqList
_BuildAcqList	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	i = -2
;	j = -4
; Line 2289
	sub	ax,ax
	mov	WORD PTR _ACQLISTCNT,ax
	mov	WORD PTR [bp-2],ax	;i
	jmp	SHORT $F1834
$FC1835:
; Line 2290
	sub	cx,cx
	push	cx
	mov	cx,50
	imul	cx
	add	ax,WORD PTR _TARGFILE
	push	ax
	call	_AddAcqList
	add	sp,4
	inc	WORD PTR [bp-2]	;i
$F1834:
	mov	bx,WORD PTR _TARGFILECNT
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR [bx],ax
	jg	$FC1835
; Line 2293
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1838
$FC1839:
; Line 2294
	mov	cx,50
	imul	cx
	mov	si,ax
	mov	bx,WORD PTR _AGEDTARGFILE
	push	WORD PTR [bx+26][si]
	call	_InAcqList
	add	sp,2
	or	ax,ax
	jne	$I1842
; Line 2295
	push	ax
	add	si,WORD PTR _AGEDTARGFILE
	push	si
	call	_AddAcqList
	add	sp,4
; Line 2296
$I1842:
	inc	WORD PTR [bp-2]	;i
$F1838:
	mov	bx,WORD PTR _AGEDTARGFILECNT
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR [bx],ax
	jg	$FC1839
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_BuildAcqList	ENDP
; Line 2300
	PUBLIC	_InAcqList
_InAcqList	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
;	n = 4
; Line 2303
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1846
; Line 2305
$FC1847:
	inc	WORD PTR [bp-2]	;i
$F1846:
	mov	ax,WORD PTR _ACQLISTCNT
	cmp	WORD PTR [bp-2],ax	;i
	jge	$FB1848
; Line 2304
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,1
	mov	bx,WORD PTR _ACQLIST[bx]
	mov	ax,WORD PTR [bp+4]	;n
	cmp	WORD PTR [bx+26],ax
	jne	$FC1847
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$FB1848:
	sub	ax,ax
; Line 2306
	mov	sp,bp
	pop	bp
	ret	

_InAcqList	ENDP
; Line 2310
	PUBLIC	_AddAcqList
_AddAcqList	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
	push	si
;	tempplane = -4
;	i = -10
;	j = -12
;	rng = -8
;	start = 6
;	t = 4
; Line 2317
	cmp	WORD PTR _AWG9_REALITY_LEVEL,0
	jne	$I1858
; Line 2319
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$I1858
	cmp	WORD PTR [bx+20],6175
	jle	$I1858
; Line 2320
$L20220:
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 2321
	nop	
$I1858:
; Line 2324
	mov	ax,40
	mov	bx,WORD PTR [bp+4]	;t
	imul	WORD PTR [bx+26]
	mov	si,ax
	push	WORD PTR _ps[si+22]
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-4],ax	;tempplane
	mov	WORD PTR [bp-2],dx
; Line 2326
	cmp	WORD PTR _AWG9_REALITY_LEVEL,0
	jne	$JCC11842
	jmp	$I1865
$JCC11842:
; Line 2327
	les	bx,DWORD PTR [bp-4]	;tempplane
	cmp	WORD PTR es:[bx+18],1
	jne	$I1860
; Line 2328
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20120
	mov	ax,1900
	jmp	SHORT $L20221
$L20120:
	mov	ax,-4736
$L20221:
	sub	dx,dx
	mov	WORD PTR [bp-8],ax	;rng
	mov	WORD PTR [bp-6],dx
; Line 2329
; Line 2330
$I1860:
	mov	bx,WORD PTR [bp-4]	;tempplane
	cmp	WORD PTR es:[bx+18],2
	jne	$I1861
; Line 2331
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20122
	mov	ax,4513
	cwd	
	jmp	SHORT $L20123
	nop	
$L20122:
	mov	ax,13344
	mov	dx,2
$L20123:
	mov	WORD PTR [bp-8],ax	;rng
	mov	WORD PTR [bp-6],dx
; Line 2332
; Line 2333
$I1861:
	mov	bx,WORD PTR [bp-4]	;tempplane
	cmp	WORD PTR es:[bx+18],3
	jne	$I1862
; Line 2334
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20124
	mov	ax,4988
	cwd	
	jmp	SHORT $L20125
$L20124:
	mov	ax,28544
	mov	dx,2
$L20125:
	mov	WORD PTR [bp-8],ax	;rng
	mov	WORD PTR [bp-6],dx
; Line 2335
; Line 2336
$I1862:
	mov	bx,WORD PTR [bp-4]	;tempplane
	cmp	WORD PTR es:[bx+18],4
	jne	$I1863
; Line 2337
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20126
	mov	ax,5938
	cwd	
	jmp	SHORT $L20127
$L20126:
	mov	ax,-6592
	mov	dx,2
$L20127:
	mov	WORD PTR [bp-8],ax	;rng
	mov	WORD PTR [bp-6],dx
; Line 2338
; Line 2339
$I1863:
	mov	bx,WORD PTR [bp-4]	;tempplane
	cmp	WORD PTR es:[bx+18],5
	jne	$I1864
; Line 2340
	mov	bx,WORD PTR [bp+4]	;t
	cmp	WORD PTR [bx],0
	je	$L20128
	mov	ax,6888
	cwd	
	jmp	SHORT $L20129
$L20128:
	mov	ax,23808
	mov	dx,3
$L20129:
	mov	WORD PTR [bp-8],ax	;rng
	mov	WORD PTR [bp-6],dx
; Line 2341
; Line 2344
$I1864:
	mov	bx,WORD PTR [bp+4]	;t
	mov	ax,WORD PTR [bx+20]
	cwd	
	cmp	dx,WORD PTR [bp-6]
	jl	$I1865
	jle	$JCC12038
	jmp	$L20220
$JCC12038:
	cmp	ax,WORD PTR [bp-8]	;rng
	jbe	$JCC12046
	jmp	$L20220
$JCC12046:
; Line 2346
; Line 2347
$I1865:
; Line 2349
	mov	ax,WORD PTR [bp+6]	;start
	mov	WORD PTR [bp-10],ax	;i
	jmp	SHORT $F1866
	nop	
$FC1871:
	dec	WORD PTR [bp-12]	;j
$F1870:
	mov	ax,WORD PTR [bp-10]	;i
	cmp	WORD PTR [bp-12],ax	;j
	jl	$FB1868
; Line 2352
	mov	bx,WORD PTR [bp-12]	;j
	shl	bx,1
	mov	ax,WORD PTR _ACQLIST[bx]
	mov	WORD PTR _ACQLIST[bx+2],ax
	jmp	SHORT $FC1871
$FC1867:
	inc	WORD PTR [bp-10]	;i
$F1866:
	mov	ax,WORD PTR _ACQLISTCNT
	cmp	WORD PTR [bp-10],ax	;i
	jge	$FB1868
; Line 2350
	mov	bx,WORD PTR [bp-10]	;i
	shl	bx,1
	mov	bx,WORD PTR _ACQLIST[bx]
	mov	si,WORD PTR [bp+4]	;t
	mov	cx,WORD PTR [si+20]
	cmp	WORD PTR [bx+20],cx
	jle	$FC1867
; Line 2351
	dec	ax
	mov	WORD PTR [bp-12],ax	;j
	jmp	SHORT $F1870
	nop	
$FB1868:
; Line 2357
	mov	ax,WORD PTR [bp+4]	;t
	mov	bx,WORD PTR [bp-10]	;i
	shl	bx,1
	mov	WORD PTR _ACQLIST[bx],ax
; Line 2358
	inc	WORD PTR _ACQLISTCNT
; Line 2359
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AddAcqList	ENDP
; Line 2363
	PUBLIC	_DetermineShootParams
_DetermineShootParams	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	si
; Line 2368
	mov	WORD PTR _ASE_RADIUS,-1
; Line 2369
	sub	ax,ax
	mov	WORD PTR _LOCKSHOOT,ax
	mov	WORD PTR _SHOOT,ax
	mov	WORD PTR _STEER_DOT,ax
; Line 2372
	cmp	WORD PTR _PW,ax
	jne	$I1875
$L20222:
	sub	ax,ax
	pop	si
	ret	
; Line 2374
	nop	
$I1875:
	mov	ax,30
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$I1877
	mov	ax,40
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	je	$I1876
$I1877:
; Line 2375
	cmp	WORD PTR _SelectedTarg,-1
	jmp	SHORT $L20223
	nop	
$I1876:
; Line 2378
	cmp	WORD PTR _LOCKED,-1
$L20223:
	je	$L20222
; Line 2379
	mov	WORD PTR _LOCKSHOOT,1
; Line 2380
; Line 2382
	cmp	WORD PTR _PDT_PROJ,0
	je	$L20222
; Line 2383
	call	_ResizeASE
	or	ax,ax
	je	$L20222
; Line 2386
	inc	WORD PTR _STEER_DOT
; Line 2387
	mov	ax,WORD PTR _PDT_PROJ_X
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR _STEER_DOT_X,ax
; Line 2388
	mov	ax,WORD PTR _PDT_PROJ_Y
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR _STEER_DOT_Y,ax
; Line 2391
	mov	ax,475
	cwd	
	push	dx
	push	ax
	mov	ax,100
	imul	WORD PTR _PDT_RNG
	push	dx
	push	ax
	call	__aNldiv
	mov	cx,ax
	mov	ax,24
	mov	bx,dx
	imul	WORD PTR _PW
	mov	si,ax
	mov	ax,WORD PTR _ORDNANCE[si+16]
	cwd	
	cmp	dx,bx
	jg	$I1884
	jge	$JCC12317
	jmp	$L20222
$JCC12317:
	cmp	ax,cx
	jae	$JCC12324
	jmp	$L20222
$JCC12324:
; Line 2393
$I1884:
	inc	WORD PTR _SHOOT
; Line 2394
	mov	ax,WORD PTR $S1874_flash
	mov	WORD PTR _LOCKSHOOT,ax
; Line 2395
	cmp	WORD PTR _DisplayFrame,0
	jne	$I1885
	xor	al,1
	mov	WORD PTR $S1874_flash,ax
; Line 2396
$I1885:
	pop	si
	ret	
	nop	

_DetermineShootParams	ENDP
; Line 2400
	PUBLIC	_ResizeASE
_ResizeASE	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	d = -2
; Line 2406
	cmp	WORD PTR _AWG9_MODE,300
	je	$I1889
	cmp	WORD PTR _AWG9_MODE,202
	jne	$I1890
$I1889:
; Line 2407
	mov	ax,475
	cwd	
	push	dx
	push	ax
	mov	ax,100
	imul	WORD PTR _PDT_RNG
	push	dx
	push	ax
	call	__aNldiv
	mov	cx,ax
	mov	ax,24
	mov	bx,dx
	imul	WORD PTR _PW
	mov	si,ax
	mov	ax,WORD PTR _ORDNANCE[si+18]
	cwd	
	cmp	dx,bx
	jl	$I1890
	jg	$L20136
	cmp	ax,cx
	jbe	$I1890
$L20136:
; Line 2409
	sub	ax,ax
$L20224:
	mov	WORD PTR _ASE_RADIUS,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 2410
; Line 2411
$I1890:
; Line 2415
	mov	ax,WORD PTR _PW
	sub	ax,15
	je	$SC1895
	sub	ax,3
	je	$SC1897
	dec	ax
	dec	ax
	je	$SC1896
	jmp	SHORT $SB1892
; Line 2416
	nop	
$SC1895:
; Line 2417
	mov	WORD PTR _ASE_RADIUS,35
; Line 2418
$SB1892:
; Line 2429
	cmp	WORD PTR _LOCKED,-1
	jne	$I1898
	jmp	SHORT $I1900
; Line 2420
	nop	
$SC1896:
; Line 2421
	mov	WORD PTR _ASE_RADIUS,30
; Line 2422
	jmp	SHORT $SB1892
; Line 2424
$SC1897:
; Line 2425
	mov	WORD PTR _ASE_RADIUS,22
; Line 2426
	jmp	SHORT $SB1892
; Line 2431
$I1898:
	cmp	WORD PTR _AWG9_MODE,200
	je	$I1900
	cmp	WORD PTR _AWG9_MODE,202
	jne	$I1899
$I1900:
; Line 2432
	mov	ax,WORD PTR _ASE_RADIUS
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 2434
$I1899:
; Line 2436
	mov	ax,475
	cwd	
	push	dx
	push	ax
	mov	ax,100
	imul	WORD PTR _PDT_RNG
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-2],ax	;d
	mov	cx,ax
	mov	ax,24
	imul	WORD PTR _PW
	mov	bx,ax
	cmp	cx,WORD PTR _ORDNANCE[bx+16]
	jle	$I1901
; Line 2438
	mov	ax,WORD PTR _ORDNANCE[bx+16]
	sub	ax,cx
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,100
	mov	WORD PTR [bp-2],ax	;d
; Line 2439
	cmp	ax,75
	jge	$I1903
	mov	WORD PTR [bp-2],75	;d
; Line 2440
	jmp	SHORT $I1903
	nop	
$I1901:
; Line 2441
	cmp	WORD PTR _MODE_AA,1
	jne	$L20137
	mov	ax,1
	jmp	SHORT $L20138
$L20137:
	sub	ax,ax
$L20138:
	mov	cx,19
	imul	cx
	mov	bx,ax
	add	bx,WORD PTR $S1013_ASPDEG
	shl	bx,1
	mov	ax,WORD PTR $S972_ASE_Tbl[bx]
	mov	WORD PTR [bp-2],ax	;d
; Line 2442
$I1903:
; Line 2445
	mov	ax,WORD PTR _ASE_RADIUS
	imul	WORD PTR [bp-2]	;d
	add	ax,50
	mov	cx,100
	cwd	
	idiv	cx
	jmp	$L20224
; Line 2446

_ResizeASE	ENDP
; Line 2450
	PUBLIC	_AWG9_project
_AWG9_project	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
;	dx = -4
;	dy = -12
;	dz = -18
;	xe = -8
;	ye = -16
;	ze = -22
;	z = 12
;	y = 8
;	x = 4
; Line 2457
	mov	ax,WORD PTR [bp+8]	;y
	mov	dx,WORD PTR [bp+10]
	add	ax,WORD PTR _PyLng
	adc	dx,WORD PTR _PyLng+2
	sub	ax,0
	sbb	dx,16
	mov	WORD PTR [bp-12],ax	;dy
	mov	WORD PTR [bp-10],dx
; Line 2458
	mov	ax,WORD PTR [bp+12]	;z
	sub	ax,WORD PTR _Alt
	sub	ax,9
	mov	WORD PTR [bp-18],ax	;dz
; Line 2460
	mov	ax,WORD PTR _PxLng
	mov	dx,WORD PTR _PxLng+2
	sub	ax,WORD PTR [bp+4]	;x
	sbb	dx,WORD PTR [bp+6]
	mov	WORD PTR [bp-4],ax	;dx
	mov	WORD PTR [bp-2],dx
	push	dx
	push	ax
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$L20140
	jl	$L20139
	cmp	ax,23000
	ja	$L20140
$L20139:
	push	WORD PTR [bp-10]
	push	WORD PTR [bp-12]	;dy
	call	_labs
	add	sp,4
	or	dx,dx
	jl	$I1915
	jg	$L20140
	cmp	ax,23000
	jbe	$I1915
$L20140:
; Line 2461
	mov	al,5
	push	ax
	lea	cx,WORD PTR [bp-4]	;dx
	push	cx
	call	__aNNalshr
; Line 2462
	mov	al,5
	push	ax
	lea	cx,WORD PTR [bp-12]	;dy
	push	cx
	call	__aNNalshr
; Line 2463
	mov	cl,5
	sar	WORD PTR [bp-18],cl	;dz
; Line 2464
; Line 2466
$I1915:
	push	WORD PTR [bp-18]	;dz
	push	WORD PTR [bp-12]	;dy
	push	WORD PTR [bp-4]	;dx
	sub	ax,ax
	push	ax
	call	row3
	add	sp,8
	mov	WORD PTR [bp-8],ax	;xe
	mov	WORD PTR [bp-6],dx
; Line 2467
	push	WORD PTR [bp-18]	;dz
	push	WORD PTR [bp-12]	;dy
	push	WORD PTR [bp-4]	;dx
	mov	ax,1
	push	ax
	call	row3
	add	sp,8
	mov	WORD PTR [bp-16],ax	;ye
	mov	WORD PTR [bp-14],dx
; Line 2470
	push	WORD PTR [bp-18]	;dz
	push	WORD PTR [bp-12]	;dy
	push	WORD PTR [bp-4]	;dx
	mov	ax,2
	push	ax
	call	row3
	add	sp,8
	mov	WORD PTR [bp-22],ax	;ze
	mov	WORD PTR [bp-20],dx
	or	dx,dx
	jl	$I1917
	mov	ax,-1
	mov	sp,bp
	pop	bp
	ret	
; Line 2473
	nop	
$I1917:
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-8]	;xe
	mov	dx,WORD PTR [bp-6]
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	push	dx
	push	ax
	call	__aNldiv
	add	ax,160
	mov	WORD PTR _proj_x,ax
; Line 2474
	push	WORD PTR [bp-20]
	push	WORD PTR [bp-22]	;ze
	mov	ax,WORD PTR [bp-16]	;ye
	mov	dx,WORD PTR [bp-14]
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR _proj_y,ax
; Line 2475
	mov	cx,ax
	sar	ax,1
	sar	ax,1
	sub	cx,ax
	mov	WORD PTR _proj_y,cx
; Line 2476
	add	cx,50
	mov	WORD PTR _proj_y,cx
; Line 2477
	mov	ax,WORD PTR [bp-22]	;ze
	mov	dx,WORD PTR [bp-20]
	mov	al,ah
	mov	ah,dl
	mov	dl,dh
	shl	dh,1
	sbb	dh,dh
	mov	WORD PTR _proj_z,ax
; Line 2479
	sub	ax,ax
; Line 2480
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AWG9_project	ENDP
; Line 2484
row3	PROC NEAR
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
; Line 2487
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
; Line 2488
	push	WORD PTR [bp+10]	;dz
	push	WORD PTR _VM[si+6]
	call	_TrgMul
	add	sp,4
	cwd	
	add	WORD PTR [bp-4],ax	;z
	adc	WORD PTR [bp-2],dx
; Line 2490
	push	WORD PTR [bp+8]	;dy
	push	WORD PTR _VM[si+12]
	call	_TrgMul
	add	sp,4
	cwd	
	add	WORD PTR [bp-4],ax	;z
	adc	WORD PTR [bp-2],dx
	mov	ax,WORD PTR [bp-4]	;z
	mov	dx,WORD PTR [bp-2]
; Line 2491
	pop	si
	mov	sp,bp
	pop	bp
	ret	

row3	ENDP
; Line 2496
	PUBLIC	_FiringOrder
_FiringOrder	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 2497
	mov	ax,30
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	je	$EX1925
; Line 2499
; Line 2500
	call	_BuildFiringList
; Line 2501
$EX1925:
	ret	
	nop	

_FiringOrder	ENDP
; Line 2506
	PUBLIC	_BuildFiringList
_BuildFiringList	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	si
;	i = -4
;	j = -6
;	cnt = -2
; Line 2512
	sub	ax,ax
	mov	WORD PTR _FIRINGORDERCNT,ax
	mov	WORD PTR [bp-4],ax	;i
	jmp	SHORT $F1932
$FC1933:
; Line 2513
	sub	cx,cx
	push	cx
	mov	cx,50
	imul	cx
	add	ax,WORD PTR _TARGFILE
	push	ax
	call	_AddFiringList
	add	sp,4
; Line 2514
	inc	WORD PTR [bp-4]	;i
$F1932:
	mov	bx,WORD PTR _TARGFILECNT
	mov	ax,WORD PTR [bp-4]	;i
	cmp	WORD PTR [bx],ax
	jg	$FC1933
; Line 2517
	mov	WORD PTR [bp-4],0	;i
	jmp	SHORT $F1936
$FC1937:
; Line 2518
	mov	cx,50
	imul	cx
	mov	si,ax
	mov	bx,WORD PTR _AGEDTARGFILE
	push	WORD PTR [bx+26][si]
	call	_InFiringList
	add	sp,2
	or	ax,ax
	jne	$L20227
; Line 2519
	push	ax
	add	si,WORD PTR _AGEDTARGFILE
	push	si
	call	_AddFiringList
	add	sp,4
; Line 2520
$L20227:
	inc	WORD PTR [bp-4]	;i
$F1936:
	mov	bx,WORD PTR _AGEDTARGFILECNT
	mov	ax,WORD PTR [bp-4]	;i
	cmp	WORD PTR [bx],ax
	jg	$FC1937
; Line 2523
	mov	ax,15
	push	ax
	call	_GetWeaponCount
	add	sp,2
	mov	WORD PTR [bp-2],ax	;cnt
; Line 2525
	sub	ax,ax
	mov	WORD PTR [bp-4],ax	;i
	mov	WORD PTR [bp-6],ax	;j
	jmp	SHORT $F1941
	nop	
$FC1942:
; Line 2526
	mov	bx,ax
	mov	cl,3
	shl	bx,cl
	mov	si,WORD PTR [bp-4]	;i
	shl	si,1
	mov	si,WORD PTR _FIRINGORDERLIST[si]
	mov	ax,WORD PTR [si+26]
	mov	WORD PTR _DESIG_TARG[bx+2],ax
; Line 2527
	mov	WORD PTR _DESIG_TARG[bx],1
; Line 2528
	inc	WORD PTR [bp-4]	;i
	inc	WORD PTR [bp-6]	;j
$F1941:
	mov	ax,WORD PTR [bp-6]	;j
	cmp	WORD PTR [bp-2],ax	;cnt
	jg	$FC1942
; Line 2529
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_BuildFiringList	ENDP
; Line 2533
	PUBLIC	_InFiringList
_InFiringList	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
;	n = 4
; Line 2536
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1947
; Line 2538
$FC1948:
	inc	WORD PTR [bp-2]	;i
$F1947:
	mov	ax,WORD PTR _FIRINGORDERCNT
	cmp	WORD PTR [bp-2],ax	;i
	jge	$FB1949
; Line 2537
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,1
	mov	bx,WORD PTR _FIRINGORDERLIST[bx]
	mov	ax,WORD PTR [bp+4]	;n
	cmp	WORD PTR [bx+26],ax
	jne	$FC1948
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$FB1949:
	sub	ax,ax
; Line 2539
	mov	sp,bp
	pop	bp
	ret	

_InFiringList	ENDP
; Line 2543
	PUBLIC	_AddFiringList
_AddFiringList	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	si
;	i = -4
;	j = -6
;	rng = -2
;	start = 6
;	t = 4
; Line 2549
	mov	ax,WORD PTR [bp+6]	;start
	mov	WORD PTR [bp-4],ax	;i
	jmp	SHORT $F1957
$FC1962:
	dec	WORD PTR [bp-6]	;j
$F1961:
	mov	ax,WORD PTR [bp-4]	;i
	cmp	WORD PTR [bp-6],ax	;j
	jl	$FB1959
; Line 2553
	mov	bx,WORD PTR [bp-6]	;j
	shl	bx,1
	mov	ax,WORD PTR _FIRINGORDERLIST[bx]
	mov	WORD PTR _FIRINGORDERLIST[bx+2],ax
	jmp	SHORT $FC1962
$FC1958:
	inc	WORD PTR [bp-4]	;i
$F1957:
	mov	ax,WORD PTR _FIRINGORDERCNT
	cmp	WORD PTR [bp-4],ax	;i
	jge	$FB1959
; Line 2550
	mov	ax,50
	imul	WORD PTR [bp-4]	;i
	mov	bx,ax
	mov	si,WORD PTR _TARGFILE
	cmp	WORD PTR [bx][si],1
	sbb	ax,ax
	and	ax,2945
	add	ax,95
; Line 2551
	mov	bx,WORD PTR [bp+4]	;t
	add	ax,WORD PTR [bx+20]
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	mov	bx,WORD PTR _FIRINGORDERLIST[bx]
	cmp	ax,WORD PTR [bx+20]
	jae	$FC1958
; Line 2552
	mov	ax,WORD PTR _FIRINGORDERCNT
	dec	ax
	mov	WORD PTR [bp-6],ax	;j
	jmp	SHORT $F1961
	nop	
$FB1959:
; Line 2557
	mov	ax,WORD PTR [bp+4]	;t
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	mov	WORD PTR _FIRINGORDERLIST[bx],ax
; Line 2558
	inc	WORD PTR _FIRINGORDERCNT
; Line 2559
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AddFiringList	ENDP
; Line 2563
	PUBLIC	_CheckDataLink
_CheckDataLink	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,66
	call	__aNchkstk
;	i = -66
;	t = -52
;	rng = -62
;	dlorig = -2
;	tempplane = -58
;	temptime = -54
;	curtime = -64
; Line 2567
	mov	WORD PTR [bp-2],0	;dlorig
; Line 2574
	call	FAR PTR _GETTIME
	mov	WORD PTR [bp-64],ax	;curtime
; Line 2575
	sub	ax,WORD PTR $S1972_lasttime
	mov	WORD PTR [bp-54],ax	;temptime
; Line 2578
	mov	cx,60
	cwd	
	idiv	cx
	cmp	ax,5
	jge	$I1973
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 2580
	nop	
$I1973:
	mov	ax,WORD PTR [bp-64]	;curtime
	mov	WORD PTR $S1972_lasttime,ax
; Line 2582
	mov	WORD PTR [bp-66],0	;i
$FC1975:
; Line 2583
	mov	bx,WORD PTR [bp-66]	;i
	shl	bx,1
	mov	WORD PTR _DataLinkList[bx],-999
; Line 2584
	inc	WORD PTR [bp-66]	;i
	cmp	WORD PTR [bp-66],8	;i
	jl	$FC1975
; Line 2587
	sub	ax,ax
	mov	WORD PTR _DataLinkCnt,ax
	mov	WORD PTR [bp-66],ax	;i
	jmp	SHORT $F1977
	nop	
$L20145:
	mov	ax,20928
	mov	dx,2
$L20146:
	mov	WORD PTR [bp-62],ax	;rng
	mov	WORD PTR [bp-60],dx
	mov	cx,ax
	mov	ax,WORD PTR [bp-32]
	mov	bx,dx
	cwd	
	cmp	bx,dx
	jle	$JCC13550
	jmp	$I1983
$JCC13550:
	jl	$FC1978
	cmp	cx,ax
	jb	$JCC13559
	jmp	$I1983
$JCC13559:
$FC1978:
	inc	WORD PTR [bp-66]	;i
$F1977:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-66],ax	;i
	jl	$JCC13573
	jmp	$FB1979
$JCC13573:
; Line 2588
	mov	ax,40
	imul	WORD PTR [bp-66]	;i
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],2
	je	$FC1978
; Line 2589
	mov	ax,40
	imul	WORD PTR [bp-66]	;i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+26],0
	je	$FC1978
; Line 2598
	mov	ax,40
	imul	WORD PTR [bp-66]	;i
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	WORD PTR [bp-58],bx	;tempplane
	mov	WORD PTR [bp-56],es
	cmp	WORD PTR es:[bx],88
	je	$I1982
	cmp	WORD PTR es:[bx],138
	je	$I1982
	cmp	WORD PTR es:[bx],139
	je	$I1982
	cmp	WORD PTR es:[bx],140
	je	$I1982
	cmp	WORD PTR es:[bx],141
	je	$I1982
	cmp	WORD PTR es:[bx],142
	jne	$FC1978
; Line 2600
$I1982:
	push	WORD PTR [bp-66]	;i
	lea	ax,WORD PTR [bp-52]	;t
	push	ax
	call	_SetupNewTarget
	add	sp,4
; Line 2601
	lea	ax,WORD PTR [bp-52]	;t
	push	ax
	call	_orient_to_player
	add	sp,2
; Line 2603
	cmp	WORD PTR [bp-52],0	;t
	jne	$JCC13704
	jmp	$L20145
$JCC13704:
	mov	ax,4750
	cwd	
	jmp	$L20146
; Line 2605
$I1983:
	les	bx,DWORD PTR [bp-58]	;tempplane
	cmp	WORD PTR es:[bx],88
	je	$JCC13723
	jmp	$FC1978
$JCC13723:
; Line 2606
	mov	WORD PTR [bp-2],1	;dlorig
; Line 2607
; Line 2608
	jmp	$FC1978
$FB1979:
; Line 2610
	mov	WORD PTR [bp-2],1	;dlorig
; Line 2611
; Line 2612
	mov	WORD PTR [bp-66],0	;i
	jmp	SHORT $F1986
$L20150:
	mov	ax,-23680
	mov	dx,4
$L20151:
	mov	WORD PTR [bp-62],ax	;rng
	mov	WORD PTR [bp-60],dx
	mov	cx,ax
	mov	ax,WORD PTR [bp-32]
	mov	bx,dx
	cwd	
	cmp	bx,dx
	jg	$I1993
	jl	$FC1987
	cmp	cx,ax
	jae	$I1993
$FC1987:
	inc	WORD PTR [bp-66]	;i
$F1986:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-66],ax	;i
	jge	$FB1988
; Line 2613
	cmp	WORD PTR _DataLinkCnt,7
	jg	$FB1988
; Line 2614
	mov	ax,40
	imul	WORD PTR [bp-66]	;i
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],2
	je	$FC1987
; Line 2615
	mov	ax,40
	imul	WORD PTR [bp-66]	;i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+26],0
	je	$FC1987
; Line 2616
	mov	bx,WORD PTR [bp-66]	;i
	shl	bx,1
	cmp	WORD PTR _DETECTED_TARG[bx],0
	jne	$FC1987
; Line 2618
	push	WORD PTR [bp-66]	;i
	lea	ax,WORD PTR [bp-52]	;t
	push	ax
	call	_SetupNewTarget
	add	sp,4
; Line 2619
	lea	ax,WORD PTR [bp-52]	;t
	push	ax
	call	_orient_to_player
	add	sp,2
; Line 2621
	cmp	WORD PTR [bp-52],0	;t
	je	$L20150
	mov	ax,9500
	cwd	
	jmp	SHORT $L20151
; Line 2623
	nop	
$I1993:
	mov	ax,40
	imul	WORD PTR [bp-66]	;i
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],4
	jne	$FC1987
; Line 2624
; Line 2626
	mov	ax,WORD PTR [bp-66]	;i
	mov	bx,WORD PTR _DataLinkCnt
	shl	bx,1
	mov	WORD PTR _DataLinkList[bx],ax
; Line 2627
	inc	WORD PTR _DataLinkCnt
; Line 2628
; Line 2629
	jmp	$FC1987
	nop	
$FB1988:
; Line 2630
; Line 2631
	mov	sp,bp
	pop	bp
	ret	

_CheckDataLink	ENDP
_TEXT	ENDS
END
