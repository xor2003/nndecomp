;	Static Name Aliases
;
;	$S1348_homedist	EQU	homedist
;	$S1349_homeangle	EQU	homeangle
;	$S1350_HomeHead	EQU	HomeHead
;	$S1351_pangle	EQU	pangle
;	$S1352_xd	EQU	xd
;	$S1353_yd	EQU	yd
;	$S1354_dist	EQU	dist
;	$S1355_d	EQU	d
;	$S1356_homer	EQU	homer
;	$S1357_homing	EQU	homing
;	$S1358_zd	EQU	zd
;	$S1359_angl	EQU	angl
;	$S1360_stype	EQU	stype
;	$S1361_ssi	EQU	ssi
;	$S1362_sst	EQU	sst
;	$S1363_EnemySam	EQU	EnemySam
;	$S1364_TargetsHit	EQU	TargetsHit
;	$S1365_PrintedMiss	EQU	PrintedMiss
	TITLE   C:\SAMS.C
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
EXTRN	_CheckMode:NEAR
EXTRN	_CheckPlaneBlast:NEAR
EXTRN	_EngageTrain:NEAR
EXTRN	_DamageAI:NEAR
EXTRN	_GetQHeight:NEAR
EXTRN	_labs:NEAR
EXTRN	__fstrcat:FAR
EXTRN	_Speech:NEAR
EXTRN	__fstrcpy:FAR
EXTRN	_GetRadarGTNum:NEAR
EXTRN	_GetGTRadarNum:NEAR
EXTRN	_LogIt:NEAR
EXTRN	_IndirectWPCorrection:NEAR
EXTRN	_GetSquadLeader:NEAR
EXTRN	_Sound:NEAR
EXTRN	_GetSAR:NEAR
EXTRN	_UpdateTIDTargs:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_ARMT_release:NEAR
EXTRN	_rng2:NEAR
EXTRN	_IsBoat:NEAR
EXTRN	_GetWingName:NEAR
EXTRN	_FlyCruise:NEAR
EXTRN	_sgn:NEAR
EXTRN	__aNNalshr:NEAR
EXTRN	_CheckAIBombs:NEAR
EXTRN	_strcat:NEAR
EXTRN	_FriendMatchType:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_ShowJettison:NEAR
EXTRN	_Dist2D:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_ARCTAN:NEAR
EXTRN	_AAGetPriority:NEAR
EXTRN	_CloseEnoughFor:NEAR
EXTRN	_sinX:NEAR
EXTRN	_GetPlaneOrgNum:NEAR
EXTRN	_cosX:NEAR
EXTRN	_abs:NEAR
EXTRN	_TrgMul:NEAR
EXTRN	_Message:NEAR
EXTRN	_rnd:NEAR
EXTRN	_AnimIsRunning:NEAR
EXTRN	_dropdecoy:NEAR
EXTRN	_GetPlanePtr:NEAR
EXTRN	_ASinB:NEAR
EXTRN	_ACosB:NEAR
EXTRN	_GetMissilePtr:NEAR
EXTRN	_StartASmoke:NEAR
EXTRN	_NGTARGETS:WORD
EXTRN	_warstatus:WORD
EXTRN	_DESIG_TARG:BYTE
EXTRN	_SHOOT:WORD
EXTRN	_ENEMYNODIE:WORD
EXTRN	_ConfigData:BYTE
EXTRN	_KnockItOffStatus:WORD
EXTRN	_lastCounter:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Txt:BYTE
EXTRN	_Damaged:WORD
EXTRN	_Status:WORD
EXTRN	_RIO_ASSIST:WORD
_BSS      SEGMENT
COMM NEAR	_LastMisl:	BYTE:	 2
COMM NEAR	_TargetObj:	BYTE:	 2
_BSS      ENDS
EXTRN	_AutoAlt:WORD
EXTRN	_Diff:WORD
EXTRN	_PxLng:DWORD
EXTRN	_ejected:WORD
EXTRN	_PyLng:DWORD
EXTRN	_FrameRate:WORD
EXTRN	_Gtime:WORD
EXTRN	_OurHead:WORD
EXTRN	_OurRoll:WORD
EXTRN	_OurPitch:WORD
EXTRN	_ds:BYTE
EXTRN	_AirSpeed:WORD
EXTRN	_NDECOY:WORD
EXTRN	_ORDNANCE:BYTE
EXTRN	_Alt:WORD
EXTRN	_ss:BYTE
EXTRN	_PovMisl:WORD
EXTRN	_LastSlotNMount:WORD
EXTRN	_Rtime:WORD
EXTRN	_IneffectiveHit:WORD
EXTRN	_DAMAGELITE:BYTE
EXTRN	_MASTER_CAUTION:WORD
EXTRN	_JAMMER:BYTE
EXTRN	_NPLANES:WORD
EXTRN	_Rdrs:BYTE
EXTRN	_ps:BYTE
EXTRN	_ImHit:WORD
EXTRN	_chuteX:WORD
EXTRN	_chuteY:WORD
EXTRN	_bv:BYTE
EXTRN	_chuteZ:WORD
EXTRN	_AWG9_MODE:WORD
EXTRN	_chuteDZ:WORD
EXTRN	_LastCall:WORD
EXTRN	_LOCKED:WORD
EXTRN	_DOINVISIBLE:WORD
EXTRN	_gt:BYTE
_DATA      SEGMENT
$SG1401	DB	'(RIO) Dropping FLARE',  00H
$SG1406	DB	'(RIO) Dropping CHAFF',  00H
$SG1554	DB	'Ground Impact',  00H
$SG1559	DB	'Ineffective Hit',  00H
$SG1560	DB	'Target missed',  00H
$SG1597	DB	' ',  00H
$SG1599	DB	'Hit by ',  00H
$SG1612	DB	' ',  00H
$SG1617	DB	'ARRRRRRRGGGGHHHHHHH!!!!!',  00H
$SG1620	DB	'EJECT...EJECT...EJECT!!!!!',  00H
$SG1623	DB	'BAILING OUT!!!!!',  00H
$SG1626	DB	'GOING IN!!!!!',  00H
$SG1668	DB	'(RIO) Left Engine is on Fire!',  00H
$SG1670	DB	'(RIO) Right Engine is on Fire!',  00H
$SG1672	DB	'(RIO) Hydraulics are damaged',  00H
$SG1674	DB	'(RIO) Afterburner is damaged',  00H
$SG1676	DB	'(RIO) Left fuel system is damaged',  00H
$SG1678	DB	'(RIO) Right fuel system is damaged',  00H
$SG1680	DB	'(RIO) AWG-15 (Weapon Control) is damaged',  00H
$SG1682	DB	'(RIO) AWG-9 (Radar System) is damaged',  00H
$SG1684	DB	'(RIO) HUD damaged',  00H
$SG1686	DB	'(RIO) Wing Sweep is damaged',  00H
$SG1688	DB	'(RIO) ECM systems are damaged',  00H
$SG1690	DB	'(RIO) Landing Gear is damaged',  00H
$SG1692	DB	'(RIO) Navigation systems are damaged',  00H
$SG1830	DB	'(WingMan) ',  00H
$SG1836	DB	'Fox 1!',  00H
$SG1838	DB	'Fox 2!',  00H
$SG1840	DB	'Fox 3!',  00H
$SG1843	DB	'Launch, Launch!',  00H
$SG1864	DB	'Ground Target Destroyed',  00H
_DATA      ENDS
_BSS      SEGMENT
	ORG	$+10
$S1348_homedist	DW 01H DUP (?)
	ORG	$+4
$S1349_homeangle	DW 01H DUP (?)
	ORG	$-14
$S1350_HomeHead	DW 01H DUP (?)
	ORG	$+20
$S1351_pangle	DW 01H DUP (?)
	ORG	$-8
$S1352_xd	DW 01H DUP (?)
$S1353_yd	DW 01H DUP (?)
	ORG	$-22
$S1354_dist	DW 01H DUP (?)
	ORG	$+2
$S1355_d	DW 01H DUP (?)
	ORG	$+6
$S1356_homer	DW 01H DUP (?)
	ORG	$+12
$S1357_homing	DW 01H DUP (?)
	ORG	$-6
$S1358_zd	DW 01H DUP (?)
	ORG	$-26
$S1359_angl	DW 01H DUP (?)
	ORG	$+16
$S1360_stype	DW 01H DUP (?)
	ORG	$+10
$S1361_ssi	DW 01H DUP (?)
$S1362_sst	DW 02H DUP (?)
	ORG	$-24
$S1363_EnemySam	DW 01H DUP (?)
	ORG	$+22
$S1364_TargetsHit	DW 01H DUP (?)
	ORG	$-30
$S1365_PrintedMiss	DW 01H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 7
; Line 19
; Line 8
; Line 9
; Line 10
; Line 11
; Line 12
; Line 13
; Line 14
; Line 15
; Line 16
; Line 17
; Line 18
; Line 19
; Line 20
; Line 21
; Line 104
	PUBLIC	_dosams
_dosams	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 110
	sub	ax,ax
	mov	WORD PTR $S1364_TargetsHit,ax
	mov	WORD PTR $S1365_PrintedMiss,ax
	mov	WORD PTR [bp-2],ax	;i
	mov	WORD PTR $S1361_ssi,OFFSET _ss
	jmp	SHORT $F1369
$L20001:
	mov	WORD PTR $S1363_EnemySam,ax
; Line 118
	call	_WeaponHoming
; Line 119
	call	_SteerAndMoveMissile
; Line 120
	call	_CheckGroundHit
; Line 121
	call	_CheckProximityHit
; Line 122
; Line 123
$FC1370:
	inc	WORD PTR [bp-2]	;i
	add	WORD PTR $S1361_ssi,44
$F1369:
	cmp	WORD PTR [bp-2],28	;i
	jge	$FB1371
; Line 111
	mov	bx,WORD PTR $S1361_ssi
	cmp	WORD PTR [bx+26],0
	je	$FC1370
; Line 112
	mov	ax,WORD PTR [bx+28]
	mov	WORD PTR $S1360_stype,ax
; Line 113
	push	WORD PTR [bx+28]
	call	_GetMissilePtr
	add	sp,2
	mov	WORD PTR $S1362_sst,ax
	mov	WORD PTR $S1362_sst+2,dx
; Line 114
	les	bx,DWORD PTR $S1362_sst
	mov	ax,WORD PTR es:[bx+22]
	mov	WORD PTR $S1356_homer,ax
; Line 116
	sub	ax,ax
	mov	WORD PTR $S1357_homing,ax
	mov	WORD PTR $S1359_angl,ax
; Line 117
	cmp	WORD PTR [bp-2],20	;i
	jge	$L20001
	mov	ax,1
	jmp	SHORT $L20001
	nop	
$FB1371:
; Line 124
	mov	sp,bp
	pop	bp
	ret	

_dosams	ENDP
; Line 130
	PUBLIC	_WeaponHoming
_WeaponHoming	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	j = -6
;	x = -2
;	y = -4
; Line 133
	mov	bx,WORD PTR $S1361_ssi
	cmp	WORD PTR [bx+40],0
	je	$I1380
; Line 134
	call	_All2AirHoming
; Line 135
	jmp	SHORT $I1382
$I1380:
; Line 136
	call	_Air2GroundHoming
; Line 137
$I1382:
; Line 139
	cmp	WORD PTR $S1357_homing,0
	jne	$I1384
; Line 140
	mov	bx,WORD PTR $S1361_ssi
	inc	WORD PTR [bx+42]
; Line 141
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1384:
; Line 142
	mov	bx,WORD PTR $S1361_ssi
	mov	WORD PTR [bx+42],0
; Line 143
; Line 144
	mov	sp,bp
	pop	bp
	ret	
	nop	

_WeaponHoming	ENDP
; Line 149
	PUBLIC	_All2AirHoming
_All2AirHoming	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	j = -2
; Line 152
	mov	bx,WORD PTR $S1361_ssi
	mov	ax,WORD PTR [bx+38]
	mov	WORD PTR [bp-2],ax	;j
; Line 154
	inc	ax
	jne	$I1388
; Line 155
	mov	WORD PTR $S1357_homing,0
; Line 156
	jmp	$I1389
	nop	
$I1388:
; Line 157
	mov	ax,WORD PTR [bp-2]	;j
	sub	ax,70
	jne	$JCC222
	jmp	$SC1394
$JCC222:
; Line 179
	mov	ax,40
	imul	WORD PTR [bp-2]	;j
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR $S1358_zd,ax
; Line 180
	mov	cx,WORD PTR _ps[bx+16]
	mov	WORD PTR $S1350_HomeHead,cx
; Line 181
	push	WORD PTR $S1356_homer
	push	ax
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	call	home
	add	sp,12
	mov	WORD PTR $S1357_homing,ax
; Line 187
	mov	bx,WORD PTR $S1361_ssi
	cmp	WORD PTR [bx+36],1
	je	$JCC288
	jmp	$I1409
$JCC288:
	cmp	WORD PTR [bx+34],70
	je	$JCC297
	jmp	$I1409
$JCC297:
	cmp	WORD PTR [bx+30],15
	je	$JCC306
	jmp	$I1409
$JCC306:
	mov	ax,30
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$I1410
	mov	ax,40
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$JCC345
	jmp	$I1409
$JCC345:
$I1410:
; Line 188
	cmp	WORD PTR $S1357_homing,0
	jne	$JCC355
	jmp	$I1413
$JCC355:
	cmp	WORD PTR $S1348_homedist,128
	jmp	$L20030
; Line 158
	nop	
$SC1394:
; Line 159
	mov	ax,WORD PTR _Alt
	mov	WORD PTR $S1358_zd,ax
; Line 160
	mov	cx,WORD PTR _OurHead
	mov	WORD PTR $S1350_HomeHead,cx
; Line 161
	push	WORD PTR $S1356_homer
	push	ax
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	ax
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	call	home
	add	sp,12
	mov	WORD PTR $S1357_homing,ax
; Line 163
	cmp	WORD PTR _RIO_ASSIST,0
	je	$JCC426
	jmp	$I1413
$JCC426:
	mov	ax,WORD PTR _lastCounter
	cmp	WORD PTR _Gtime,ax
	jg	$JCC438
	jmp	$I1413
$JCC438:
; Line 164
	cmp	WORD PTR $S1357_homing,0
	jne	$JCC448
	jmp	$I1413
$JCC448:
; Line 165
	cmp	WORD PTR $S1356_homer,1
	je	$I1399
	cmp	WORD PTR $S1356_homer,2
	jne	$I1398
$I1399:
	cmp	WORD PTR $S1348_homedist,50
	jge	$I1398
; Line 166
	mov	ax,WORD PTR _Gtime
	add	ax,3
	mov	WORD PTR _lastCounter,ax
; Line 167
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1401
	push	ax
	call	_Message
	add	sp,4
; Line 168
	mov	ax,70
	push	ax
	mov	ax,1
$L20031:
	push	ax
	call	_dropdecoy
	add	sp,4
; Line 169
; Line 170
	jmp	SHORT $I1413
	nop	
$I1398:
	cmp	WORD PTR $S1356_homer,3
	je	$I1405
	cmp	WORD PTR $S1356_homer,4
	jne	$I1413
$I1405:
	cmp	WORD PTR $S1348_homedist,100
	jge	$I1413
; Line 171
	mov	ax,WORD PTR _Gtime
	add	ax,3
	mov	WORD PTR _lastCounter,ax
; Line 172
	mov	ax,2
	push	ax
	mov	cx,OFFSET DGROUP:$SG1406
	push	cx
	call	_Message
	add	sp,4
; Line 173
	mov	ax,70
	push	ax
	mov	ax,2
	jmp	SHORT $L20031
; Line 178
	nop	
$I1409:
; Line 192
	cmp	WORD PTR $S1357_homing,0
	je	$I1413
	cmp	WORD PTR $S1348_homedist,384
$L20030:
	jge	$I1413
; Line 193
	mov	ax,40
	imul	WORD PTR [bp-2]	;j
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],16
; Line 194
; Line 195
$I1413:
; Line 196
; Line 199
	mov	ax,WORD PTR $S1348_homedist
	mov	WORD PTR $S1354_dist,ax
; Line 200
	mov	ax,WORD PTR $S1349_homeangle
	mov	WORD PTR $S1359_angl,ax
; Line 201
$I1389:
; Line 204
	call	decoyed
; Line 205
	mov	sp,bp
	pop	bp
	ret	
	nop	

_All2AirHoming	ENDP
; Line 210
	PUBLIC	_Air2GroundHoming
_Air2GroundHoming	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	boatnum = -2
; Line 214
	mov	bx,WORD PTR $S1361_ssi
	cmp	WORD PTR [bx+28],51
	jne	$I1417
; Line 216
	sub	ax,ax
	mov	WORD PTR $S1357_homing,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 217
; Line 218
$I1417:
	mov	WORD PTR $S1358_zd,0
; Line 219
	mov	WORD PTR $S1350_HomeHead,-1
; Line 220
	cmp	WORD PTR [bx+10],-1
	jg	$I1418
	jl	$L20003
	cmp	WORD PTR [bx+8],-1
	ja	$I1418
$L20003:
; Line 222
	push	WORD PTR [bx+12]
	call	_GetPlaneOrgNum
	add	sp,2
	mov	WORD PTR [bp-2],ax	;boatnum
	mov	cx,40
	imul	cx
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],32
	je	$I1419
; Line 223
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
	mov	si,WORD PTR $S1361_ssi
	mov	WORD PTR [si+8],ax
	mov	WORD PTR [si+10],dx
; Line 224
	mov	ax,WORD PTR _ps[bx+12]
	mov	dx,WORD PTR _ps[bx+14]
	mov	bx,WORD PTR $S1361_ssi
	mov	WORD PTR [bx+12],ax
	mov	WORD PTR [bx+14],dx
	jmp	SHORT $I1418
$I1419:
; Line 228
	push	WORD PTR $S1356_homer
	sub	ax,ax
	push	ax
	mov	ax,cx
	imul	WORD PTR [bp-2]	;boatnum
	mov	bx,ax
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	jmp	SHORT $L20033
$I1418:
; Line 231
	push	WORD PTR $S1356_homer
	sub	ax,ax
	push	ax
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+14]
	push	WORD PTR [bx+12]
	push	WORD PTR [bx+10]
	push	WORD PTR [bx+8]
$L20033:
	call	home
	add	sp,12
	mov	WORD PTR $S1357_homing,ax
; Line 232
	mov	ax,WORD PTR $S1348_homedist
	mov	WORD PTR $S1354_dist,ax
; Line 233
	mov	ax,WORD PTR $S1349_homeangle
	mov	WORD PTR $S1359_angl,ax
; Line 234
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Air2GroundHoming	ENDP
; Line 238
decoyed	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	j = -6
;	h = -4
;	a = -2
; Line 241
	mov	WORD PTR [bp-6],0	;j
	jmp	SHORT $F1426
; Line 243
$SC1433:
; Line 245
	mov	bx,WORD PTR [bp-6]	;j
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	cmp	WORD PTR _ds[bx+6],1
$L20034:
	je	$SB1430
$FC1427:
	inc	WORD PTR [bp-6]	;j
$F1426:
	mov	ax,WORD PTR [bp-6]	;j
	cmp	WORD PTR _NDECOY,ax
	jg	$JCC864
	jmp	$FB1428
$JCC864:
; Line 242
	mov	ax,WORD PTR $S1356_homer
	dec	ax
	jl	$FC1427
	dec	ax
	jle	$SC1433
	dec	ax
	jl	$FC1427
	dec	ax
	jle	$SC1435
; Line 252
	jmp	SHORT $FC1427
; Line 246
$SB1430:
; Line 257
	push	WORD PTR $S1356_homer
	push	WORD PTR $S1358_zd
	mov	bx,WORD PTR [bp-6]	;j
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR _ds[bx+2]
	sub	dx,dx
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
	push	dx
	push	ax
	mov	ax,WORD PTR _ds[bx]
	sub	dx,dx
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
	push	dx
	push	ax
	call	home
	add	sp,12
	or	ax,ax
	jne	$I1438
; Line 258
	jmp	SHORT $FC1427
; Line 247
	nop	
$SC1435:
; Line 249
	mov	bx,WORD PTR [bp-6]	;j
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	cmp	WORD PTR _ds[bx+6],2
	jmp	$L20034
	nop	
$I1438:
	cmp	WORD PTR $S1348_homedist,238
	jle	$JCC1004
	jmp	$FC1427
$JCC1004:
; Line 261
	mov	ax,WORD PTR $S1354_dist
	sub	ax,WORD PTR $S1348_homedist
	cmp	ax,-48
	jge	$JCC1019
	jmp	$FC1427
$JCC1019:
; Line 264
	push	WORD PTR $S1359_angl
	call	_abs
	add	sp,2
	mov	cx,ax
	mov	ax,182
	les	bx,DWORD PTR $S1362_sst
	imul	WORD PTR es:[bx+26]
	add	cx,ax
	mov	WORD PTR [bp-2],cx	;a
	or	cx,cx
	jge	$I1441
	mov	WORD PTR [bp-2],0	;a
; Line 265
$I1441:
	push	WORD PTR $S1349_homeangle
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR [bp-2]	;a
	jl	$JCC1074
	jmp	$FC1427
$JCC1074:
; Line 267
	mov	ax,WORD PTR $S1349_homeangle
	mov	WORD PTR $S1359_angl,ax
; Line 268
	mov	ax,WORD PTR $S1348_homedist
	mov	WORD PTR $S1354_dist,ax
; Line 269
	mov	WORD PTR $S1357_homing,0
; Line 270
	jmp	$FC1427
$FB1428:
; Line 271
	mov	sp,bp
	pop	bp
	ret	

decoyed	ENDP
; Line 278
home	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	si
;	dx = -6
;	dy = -10
;	angl = -2
;	homer = 14
;	z = 12
;	y = 8
;	x = 4
; Line 282
	mov	ax,WORD PTR [bp+4]	;x
	mov	dx,WORD PTR [bp+6]
	mov	bx,WORD PTR $S1361_ssi
	sub	ax,WORD PTR [bx]
	sbb	dx,WORD PTR [bx+2]
	mov	WORD PTR [bp-6],ax	;dx
	mov	WORD PTR [bp-4],dx
; Line 283
	mov	cx,WORD PTR [bp+8]	;y
	mov	si,WORD PTR [bp+10]
	sub	cx,WORD PTR [bx+4]
	sbb	si,WORD PTR [bx+6]
	mov	WORD PTR [bp-10],cx	;dy
	mov	WORD PTR [bp-8],si
; Line 285
	push	dx
	push	ax
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$L20005
	jl	$L20004
	cmp	ax,23000
	jae	$L20005
$L20004:
	push	WORD PTR [bp-8]
	push	WORD PTR [bp-10]	;dy
	call	_labs
	add	sp,4
	or	dx,dx
	jl	$I1451
	jg	$L20005
	cmp	ax,23000
	jb	$I1451
$L20005:
; Line 288
	mov	al,5
	push	ax
	lea	cx,WORD PTR [bp-10]	;dy
	push	cx
	call	__aNNalshr
	push	ax
	mov	al,5
	push	ax
	lea	ax,WORD PTR [bp-6]	;dx
	push	ax
	call	__aNNalshr
	push	ax
	call	_Dist2D
	add	sp,4
	mov	WORD PTR $S1348_homedist,ax
; Line 289
	cmp	WORD PTR [bp+14],27	;homer
	jne	$I1454
	mov	WORD PTR [bp+12],75	;z
; Line 290
$I1454:
	push	ax
	mov	cl,5
	mov	ax,WORD PTR [bp+12]	;z
	mov	bx,WORD PTR $S1361_ssi
	sub	ax,WORD PTR [bx+16]
	sar	ax,cl
	push	ax
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR $S1351_pangle,ax
; Line 291
	jmp	SHORT $I1456
$I1451:
; Line 292
	push	WORD PTR [bp-10]	;dy
	push	WORD PTR [bp-6]	;dx
	call	_Dist2D
	add	sp,4
	mov	WORD PTR $S1348_homedist,ax
; Line 293
	cmp	ax,1520
	jle	$I1457
	cmp	WORD PTR [bp+14],27	;homer
	jne	$I1457
	mov	WORD PTR [bp+12],75	;z
; Line 294
$I1457:
	push	ax
	mov	ax,WORD PTR [bp+12]	;z
	mov	bx,WORD PTR $S1361_ssi
	sub	ax,WORD PTR [bx+16]
	push	ax
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR $S1351_pangle,ax
; Line 295
	mov	cl,5
	sar	WORD PTR $S1348_homedist,cl
; Line 296
$I1456:
; Line 298
	mov	ax,WORD PTR [bp-10]	;dy
	neg	ax
	push	ax
	push	WORD PTR [bp-6]	;dx
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR $S1349_homeangle,ax
; Line 300
	mov	bx,WORD PTR $S1361_ssi
	cmp	WORD PTR [bx+36],1
	jne	$I1460
; Line 301
	cmp	WORD PTR [bx+34],70
	jge	$I1460
	cmp	WORD PTR [bx+34],0
	jl	$I1460
; Line 302
	mov	ax,40
	imul	WORD PTR [bx+34]
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_IsBoat
	add	sp,2
	or	ax,ax
	je	$I1460
; Line 303
$L20035:
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 304
; Line 305
$I1460:
; Line 306
; Line 309
	cmp	WORD PTR [bp+14],50	;homer
	je	$L20035
	cmp	WORD PTR [bp+14],52	;homer
	je	$L20035
	cmp	WORD PTR [bp+14],51	;homer
	je	$L20035
	cmp	WORD PTR [bp+14],27	;homer
	je	$L20035
	mov	bx,WORD PTR $S1361_ssi
	mov	ax,WORD PTR [bx+18]
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	mov	cl,7
	sar	ax,cl
	cwd	
	idiv	WORD PTR _FrameRate
	cmp	ax,WORD PTR $S1348_homedist
	jg	$L20035
; Line 315
	mov	ax,WORD PTR $S1349_homeangle
	sub	ax,WORD PTR [bx+20]
	push	ax
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-2],ax	;angl
	cmp	ax,4096
	jle	$I1462
; Line 316
$L20036:
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 317
; Line 321
$I1462:
	mov	ax,WORD PTR [bp+14]	;homer
	dec	ax
	je	$L20035
	dec	ax
	je	$SC1471
	dec	ax
	je	$SC1468
	dec	ax
	je	$L20035
	jmp	SHORT $L20036
; Line 326
	nop	
$SC1468:
; Line 327
	call	tracking
	or	ax,ax
	je	$L20036
; Line 330
$SC1471:
; Line 331
	cmp	WORD PTR $S1348_homedist,712
	jg	$L20035
	cmp	WORD PTR $S1348_homedist,238
	jge	$JCC1511
	jmp	$L20035
$JCC1511:
; Line 333
	mov	bx,WORD PTR $S1361_ssi
	mov	ax,WORD PTR [bx+20]
	sub	ax,WORD PTR $S1350_HomeHead
	push	ax
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-2],ax	;angl
	cmp	ax,16384
	jle	$L20007
	sub	ax,-32768
	neg	ax
	mov	WORD PTR [bp-2],ax	;angl
$L20007:
; Line 334
	cmp	ax,14336
	jg	$L20036
; Line 335
; Line 341
; Line 342
	jmp	$L20035
; Line 338

home	ENDP
; Line 347
tracking	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 349
	mov	bx,WORD PTR $S1361_ssi
	cmp	WORD PTR [bx+36],0
	jne	$I1476
; Line 350
	mov	bx,WORD PTR [bx+34]
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	test	BYTE PTR _Rdrs[bx+6],16
	jne	$I1481
$L20037:
	sub	ax,ax
	ret	
$I1476:
	cmp	WORD PTR [bx+34],70
	jne	$I1479
; Line 352
	mov	ax,WORD PTR _LOCKED
	cmp	WORD PTR [bx+38],ax
	je	$I1481
	jmp	SHORT $L20037
$I1479:
; Line 354
	mov	ax,40
	imul	WORD PTR [bx+34]
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],8
	je	$L20037
; Line 355
$I1481:
; Line 356
	mov	ax,1
; Line 357
	ret	
	nop	

tracking	ENDP
; Line 361
	PUBLIC	_CheckIncomingWarning
_CheckIncomingWarning	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 363
; Line 367
; Line 369
; Line 370
; Line 371
	ret	

_CheckIncomingWarning	ENDP
; Line 379
	PUBLIC	_SteerAndMoveMissile
_SteerAndMoveMissile	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,28
	call	__aNchkstk
	push	si
;	dpitch = -24
;	spd = -18
;	turn = -20
;	dx = -22
;	dy = -26
;	dz = -28
;	d = -8
;	lastspeed = -14
;	lx = -6
;	ly = -12
;	lz = -16
;	srclevel = -2
; Line 385
	mov	WORD PTR [bp-2],1	;srclevel
; Line 389
	cmp	WORD PTR $S1357_homing,0
	jne	$JCC1658
	jmp	$I1500
$JCC1658:
; Line 390
	mov	ax,WORD PTR $S1359_angl
	mov	bx,WORD PTR $S1361_ssi
	sub	ax,WORD PTR [bx+20]
	mov	WORD PTR [bp-20],ax	;turn
; Line 391
	cmp	WORD PTR $S1363_EnemySam,0
	je	$I1501
; Line 392
	cmp	WORD PTR [bx+36],1
	jne	$I1502
; Line 393
	mov	ax,46
	imul	WORD PTR [bx+34]
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+42]
	dec	ax
	mov	WORD PTR [bp-2],ax	;srclevel
; Line 394
	cmp	ax,4
	jl	$I1503
; Line 395
	mov	WORD PTR [bp-2],3	;srclevel
; Line 396
	jmp	SHORT $I1505
	nop	
$I1503:
	or	ax,ax
	jge	$I1505
; Line 397
	mov	WORD PTR [bp-2],0	;srclevel
; Line 398
$I1505:
	mov	ah,BYTE PTR [bp-2]	;srclevel
	inc	ah
	sub	al,al
	push	ax
	mov	ah,255
	sub	ah,BYTE PTR [bp-2]	;srclevel
	jmp	SHORT $L20038
$I1502:
; Line 401
	mov	ah,BYTE PTR _Diff
	inc	ah
	sub	al,al
	push	ax
	mov	ah,255
	sub	ah,BYTE PTR _Diff
$L20038:
	sub	al,al
	push	ax
	push	WORD PTR [bp-20]	;turn
	call	_rng2
	add	sp,6
	mov	WORD PTR [bp-20],ax	;turn
; Line 402
; Line 403
; Line 404
$I1501:
	mov	cl,7
	les	bx,DWORD PTR $S1362_sst
	mov	ax,WORD PTR es:[bx+24]
	shl	ax,cl
	push	ax
	neg	ax
	push	ax
	push	WORD PTR [bp-20]	;turn
	call	_rng2
	add	sp,6
; Line 405
	mov	bx,WORD PTR $S1361_ssi
	add	WORD PTR [bx+20],ax
; Line 406
	shl	ax,1
	mov	bx,WORD PTR $S1361_ssi
	mov	WORD PTR [bx+24],ax
; Line 409
	les	bx,DWORD PTR $S1362_sst
	mov	ax,WORD PTR es:[bx+24]
	mov	cx,ax
	mov	ah,al
	shl	ah,1
	sub	al,al
	push	ax
	mov	ch,cl
	sub	cl,cl
	mov	ax,cx
	mov	cl,3
	shl	ax,cl
	neg	ax
	push	ax
	mov	ax,WORD PTR $S1351_pangle
	mov	bx,WORD PTR $S1361_ssi
	sub	ax,WORD PTR [bx+22]
	push	ax
	call	_rng2
	add	sp,6
; Line 410
	mov	bx,WORD PTR $S1361_ssi
	add	WORD PTR [bx+22],ax
; Line 411
	jmp	SHORT $I1509
	nop	
$I1500:
; Line 412
	mov	bx,WORD PTR $S1361_ssi
	cmp	WORD PTR [bx+22],0
	jle	$I1509
	push	WORD PTR [bx+22]
	call	_sgn
	add	sp,2
	mov	ah,al
	sub	al,al
	mov	cl,3
	shl	ax,cl
	cwd	
	idiv	WORD PTR _FrameRate
	mov	bx,WORD PTR $S1361_ssi
	sub	WORD PTR [bx+22],ax
; Line 413
$I1509:
; Line 422
	mov	bx,WORD PTR $S1361_ssi
	cmp	WORD PTR [bx+36],0
	je	$I1511
; Line 423
	cmp	WORD PTR [bx+34],70
	jne	$I1512
; Line 424
	mov	ax,WORD PTR _PxLng
	mov	dx,WORD PTR _PxLng+2
	mov	WORD PTR [bp-6],ax	;lx
	mov	WORD PTR [bp-4],dx
; Line 425
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	mov	WORD PTR [bp-12],ax	;ly
	mov	WORD PTR [bp-10],dx
; Line 426
	mov	ax,WORD PTR _Alt
	jmp	SHORT $L20039
$I1512:
; Line 429
	mov	ax,40
	imul	WORD PTR [bx+34]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
	mov	WORD PTR [bp-6],ax	;lx
	mov	WORD PTR [bp-4],dx
; Line 430
	mov	ax,WORD PTR _ps[bx+12]
	mov	dx,WORD PTR _ps[bx+14]
	mov	WORD PTR [bp-12],ax	;ly
	mov	WORD PTR [bp-10],dx
; Line 431
	mov	ax,WORD PTR _ps[bx+6]
$L20039:
	mov	WORD PTR [bp-16],ax	;lz
; Line 432
; Line 433
; Line 435
$I1511:
	mov	bx,WORD PTR $S1361_ssi
	cmp	WORD PTR [bx+40],0
	je	$I1514
	cmp	WORD PTR [bx+18],75
	jge	$I1514
; Line 436
	mov	ax,20
	jmp	SHORT $L20041
$I1514:
	cmp	WORD PTR [bx+40],0
	je	$I1516
	cmp	WORD PTR [bx+18],175
	jge	$I1516
; Line 439
	mov	ax,50
$L20041:
	cwd	
	idiv	WORD PTR _FrameRate
	jmp	SHORT $L20040
	nop	
$I1516:
	cmp	WORD PTR [bx+40],0
	je	$I1518
	cmp	WORD PTR [bx+36],0
	je	$I1518
	mov	ax,WORD PTR [bx]
	mov	dx,WORD PTR [bx+2]
	sub	ax,WORD PTR [bp-6]	;lx
	sbb	dx,WORD PTR [bp-4]
	push	dx
	push	ax
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$I1518
	jl	$L20009
	cmp	ax,720
	jae	$I1518
$L20009:
	mov	bx,WORD PTR $S1361_ssi
	mov	ax,WORD PTR [bx+4]
	mov	dx,WORD PTR [bx+6]
	sub	ax,WORD PTR [bp-12]	;ly
	sbb	dx,WORD PTR [bp-10]
	push	dx
	push	ax
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$I1518
	jl	$L20010
	cmp	ax,720
	jae	$I1518
$L20010:
	mov	bx,WORD PTR $S1361_ssi
	mov	ax,WORD PTR [bx+16]
	sub	ax,WORD PTR [bp-16]	;lz
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,720
	jge	$I1518
; Line 442
	mov	ax,50
	cwd	
	idiv	WORD PTR _FrameRate
	mov	bx,WORD PTR $S1361_ssi
$L20040:
	add	WORD PTR [bx+18],ax
; Line 443
; Line 444
$I1518:
	les	bx,DWORD PTR $S1362_sst
	mov	si,WORD PTR $S1361_ssi
	mov	ax,WORD PTR [si+18]
	cmp	WORD PTR es:[bx+20],ax
	jle	$I1519
; Line 446
	sub	ax,WORD PTR es:[bx+20]
	neg	ax
	mov	cx,WORD PTR _FrameRate
	shl	cx,1
	shl	cx,1
	add	ax,cx
	dec	ax
	jmp	SHORT $L20042
	nop	
	nop	
$I1519:
	cmp	WORD PTR es:[bx+20],ax
	jge	$I1521
; Line 455
	mov	cx,ax
	mov	ax,WORD PTR es:[bx+20]
	mov	dx,WORD PTR _FrameRate
	shl	dx,1
	shl	dx,1
	sub	ax,dx
	sub	ax,cx
	inc	ax
	mov	cx,dx
$L20042:
	cwd	
	idiv	cx
	add	WORD PTR [si+18],ax
; Line 456
; Line 465
$I1521:
	mov	bx,WORD PTR $S1361_ssi
	mov	ax,WORD PTR [bx+18]
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	mov	cl,3
	sar	ax,cl
	mov	dx,WORD PTR _FrameRate
	sar	dx,1
	add	ax,dx
	cwd	
	idiv	WORD PTR _FrameRate
	mov	WORD PTR [bp-18],ax	;spd
; Line 469
	sar	ax,cl
	cmp	ax,WORD PTR [bx+26]
	jge	$I1522
; Line 470
	sub	WORD PTR [bx+26],ax
; Line 471
	jmp	SHORT $I1523
$I1522:
; Line 472
	mov	WORD PTR [bx+26],0
; Line 473
$I1523:
; Line 475
	push	WORD PTR [bp-18]	;spd
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+22]
	call	_sinX
	add	sp,4
	mov	WORD PTR [bp-28],ax	;dz
; Line 476
	push	WORD PTR [bp-18]	;spd
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+22]
	call	_cosX
	add	sp,4
	mov	WORD PTR [bp-18],ax	;spd
; Line 477
	push	ax
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+20]
	call	_sinX
	add	sp,4
	mov	WORD PTR [bp-22],ax	;dx
; Line 478
	push	WORD PTR [bp-18]	;spd
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+20]
	call	_cosX
	add	sp,4
	mov	WORD PTR [bp-26],ax	;dy
; Line 480
	mov	bx,WORD PTR $S1361_ssi
	mov	ax,WORD PTR [bp-28]	;dz
	neg	ax
	cmp	WORD PTR [bx+16],ax
	jge	$I1526
; Line 481
	cmp	WORD PTR [bp-28],0	;dz
	jne	$I1527
; Line 482
	mov	WORD PTR [bp-28],1	;dz
; Line 483
$I1527:
	mov	ax,WORD PTR [bp-28]	;dz
	neg	ax
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bx+16]
	cwd	
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
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
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-8],ax	;d
; Line 484
	push	ax
	push	WORD PTR [bp-22]	;dx
	call	_TrgMul
	add	sp,4
	mov	WORD PTR [bp-22],ax	;dx
; Line 485
	push	WORD PTR [bp-8]	;d
	push	WORD PTR [bp-26]	;dy
	call	_TrgMul
	add	sp,4
	mov	WORD PTR [bp-26],ax	;dy
; Line 486
	mov	bx,WORD PTR $S1361_ssi
	mov	ax,WORD PTR [bx+16]
	neg	ax
	mov	WORD PTR [bp-28],ax	;dz
; Line 487
; Line 489
$I1526:
	mov	ax,WORD PTR [bp-28]	;dz
	add	WORD PTR [bx+16],ax
; Line 490
	mov	ax,WORD PTR [bp-22]	;dx
	cwd	
	mov	bx,WORD PTR $S1361_ssi
	add	WORD PTR [bx],ax
	adc	WORD PTR [bx+2],dx
; Line 491
	mov	ax,WORD PTR [bp-26]	;dy
	cwd	
	mov	bx,WORD PTR $S1361_ssi
	sub	WORD PTR [bx+4],ax
	sbb	WORD PTR [bx+6],dx
; Line 493
	mov	bx,WORD PTR $S1361_ssi
	cmp	WORD PTR [bx+36],1
	je	$JCC2521
	jmp	$I1529
$JCC2521:
	cmp	WORD PTR [bx+34],70
	je	$JCC2530
	jmp	$I1529
$JCC2530:
; Line 494
; Line 495
	push	WORD PTR [bx+32]
	call	_AnimIsRunning
	add	sp,2
	or	ax,ax
	je	$JCC2546
	jmp	$I1536
$JCC2546:
; Line 496
; Line 497
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+20]
	mov	ax,-50
	push	ax
	call	_ASinB
	add	sp,4
	mov	WORD PTR [bp-22],ax	;dx
; Line 498
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+20]
	mov	ax,-50
	push	ax
	call	_ACosB
	add	sp,4
	neg	ax
	mov	WORD PTR [bp-26],ax	;dy
; Line 499
	mov	ax,15
	push	ax
	mov	ax,9
	push	ax
	mov	ax,WORD PTR [bp-26]	;dy
	cwd	
	mov	bx,WORD PTR $S1361_ssi
	add	ax,WORD PTR [bx+4]
	adc	dx,WORD PTR [bx+6]
	push	dx
	push	ax
	push	WORD PTR [bx+16]
	mov	ax,WORD PTR [bp-22]	;dx
	cwd	
	add	ax,WORD PTR [bx]
	adc	dx,WORD PTR [bx+2]
	push	dx
	push	ax
	call	_StartASmoke
	add	sp,14
; Line 500
	mov	ax,6
	push	ax
	mov	ax,9
	push	ax
	mov	ax,WORD PTR [bp-26]	;dy
	shl	ax,1
	cwd	
	mov	bx,WORD PTR $S1361_ssi
	add	ax,WORD PTR [bx+4]
	adc	dx,WORD PTR [bx+6]
	push	dx
	push	ax
	push	WORD PTR [bx+16]
	mov	ax,WORD PTR [bp-22]	;dx
	shl	ax,1
	jmp	SHORT $L20043
	nop	
$I1529:
; Line 505
; Line 506
	cmp	WORD PTR $S1356_homer,50
	je	$I1536
; Line 507
; Line 508
	push	WORD PTR [bx+20]
	mov	ax,-100
	push	ax
	call	_ASinB
	add	sp,4
	mov	WORD PTR [bp-22],ax	;dx
; Line 509
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+20]
	mov	ax,-100
	push	ax
	call	_ACosB
	add	sp,4
	neg	ax
	mov	WORD PTR [bp-26],ax	;dy
; Line 510
	mov	ax,15
	push	ax
	mov	ax,9
	push	ax
	mov	ax,WORD PTR [bp-26]	;dy
	cwd	
	mov	bx,WORD PTR $S1361_ssi
	add	ax,WORD PTR [bx+4]
	adc	dx,WORD PTR [bx+6]
	push	dx
	push	ax
	push	WORD PTR [bx+16]
	mov	ax,WORD PTR [bp-22]	;dx
$L20043:
	cwd	
	add	ax,WORD PTR [bx]
	adc	dx,WORD PTR [bx+2]
	push	dx
	push	ax
	call	_StartASmoke
	add	sp,14
; Line 511
; Line 512
$I1536:
; Line 514
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_SteerAndMoveMissile	ENDP
; Line 518
	PUBLIC	_CheckGroundHit
_CheckGroundHit	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
;	targ = -12
;	dx = -8
;	dy = -10
;	LastTgt = -2
;	ObjNr = -6
;	NTargetHit = -4
; Line 522
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+6]
	push	WORD PTR [bx+4]
	push	WORD PTR [bx+2]
	push	WORD PTR [bx]
	call	_GetQHeight
	add	sp,8
	sar	ax,1
	sar	ax,1
	mov	bx,WORD PTR $S1361_ssi
	cmp	ax,WORD PTR [bx+16]
	jge	$JCC2809
	jmp	$I1561
$JCC2809:
; Line 523
	mov	WORD PTR [bx+26],0
; Line 525
	mov	bx,WORD PTR $S1361_ssi
	cmp	WORD PTR [bx+30],-1
	jne	$I1546
; Line 526
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 528
	nop	
$I1546:
	mov	ax,WORD PTR [bx+30]
	sub	ax,10
	jl	$SB1548
	dec	ax
	jg	$SB1548
; Line 529
; Line 532
	mov	ax,17
	push	ax
	mov	ax,6
	push	ax
	push	WORD PTR [bx+6]
	push	WORD PTR [bx+4]
	push	WORD PTR [bx+16]
	push	WORD PTR [bx+2]
	push	WORD PTR [bx]
	call	_StartASmoke
	add	sp,14
; Line 533
$SB1548:
; Line 537
	mov	bx,WORD PTR $S1361_ssi
	cmp	WORD PTR [bx+40],0
	je	$I1552
; Line 538
	cmp	WORD PTR $S1363_EnemySam,0
	je	$JCC2890
	jmp	$I1561
$JCC2890:
; Line 539
	mov	ax,4
	push	ax
	mov	ax,OFFSET DGROUP:$SG1554
	push	ax
	call	_Message
	add	sp,4
; Line 540
; Line 541
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1552:
; Line 542
	mov	ax,2
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR [bx+28]
	push	WORD PTR [bx+34]
	mov	ax,1
	push	ax
	push	WORD PTR [bx+6]
	push	WORD PTR [bx+4]
	push	WORD PTR [bx+2]
	push	WORD PTR [bx]
	mov	cx,-999
	push	cx
	mov	dx,27
	push	dx
	call	_LogIt
	add	sp,24
; Line 544
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+28]
	push	WORD PTR [bx+34]
	mov	ax,-999
	push	ax
	mov	cx,25
	push	cx
	mov	cx,1
	push	cx
	mov	cx,WORD PTR [bx+4]
	mov	dx,WORD PTR [bx+6]
	sar	dx,1
	rcr	cx,1
	sar	dx,1
	rcr	cx,1
	sar	dx,1
	rcr	cx,1
	sar	dx,1
	rcr	cx,1
	sar	dx,1
	rcr	cx,1
	push	cx
	mov	cx,WORD PTR [bx]
	mov	dx,WORD PTR [bx+2]
	sar	dx,1
	rcr	cx,1
	sar	dx,1
	rcr	cx,1
	sar	dx,1
	rcr	cx,1
	sar	dx,1
	rcr	cx,1
	sar	dx,1
	rcr	cx,1
	push	cx
	call	_CheckPlaneBlast
	add	sp,14
; Line 546
	mov	ax,-999
	push	ax
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+30]
	push	WORD PTR [bx+6]
	push	WORD PTR [bx+4]
	push	WORD PTR [bx+2]
	push	WORD PTR [bx]
	call	_CheckBlastArea
	add	sp,12
	or	ax,ax
	je	$JCC3068
	jmp	$I1561
$JCC3068:
	cmp	WORD PTR $S1365_PrintedMiss,ax
	jne	$I1561
; Line 547
	mov	WORD PTR $S1365_PrintedMiss,1
; Line 548
	cmp	WORD PTR $S1363_EnemySam,ax
	jne	$I1558
; Line 549
	mov	ax,4
	push	ax
	cmp	WORD PTR _IneffectiveHit,0
	je	$L20012
	mov	ax,OFFSET DGROUP:$SG1559
	jmp	SHORT $L20013
	nop	
$L20012:
	mov	ax,OFFSET DGROUP:$SG1560
$L20013:
	push	ax
	call	_Message
	add	sp,4
; Line 550
; Line 551
$I1558:
	mov	bx,WORD PTR $S1361_ssi
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
	mov	ax,1
	push	ax
	call	_CloseEnoughFor
	add	sp,6
	or	ax,ax
	je	$I1561
; Line 552
	sub	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,10
	push	ax
	call	_Sound
; Line 554
$I1561:
; Line 555
; Line 556
; Line 557
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CheckGroundHit	ENDP
; Line 563
	PUBLIC	_CheckProximityHit
_CheckProximityHit	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__aNchkstk
	push	si
;	n = -20
;	killed = -2
;	InProximity = -16
;	src = -8
;	crashstat = -18
;	gtnum = -10
;	tempplane = -6
;	tempmissile = -14
; Line 573
	mov	bx,WORD PTR $S1361_ssi
	cmp	WORD PTR [bx+40],0
	jne	$JCC3226
	jmp	$EX1563
$JCC3226:
; Line 574
	cmp	WORD PTR [bx+38],-1
	jne	$JCC3235
	jmp	$EX1563
$JCC3235:
; Line 576
	mov	ax,WORD PTR $S1358_zd
	sub	ax,WORD PTR [bx+16]
	push	ax
	call	_abs
	add	sp,2
	mov	cl,5
	sar	ax,cl
	add	ax,WORD PTR $S1354_dist
	mov	WORD PTR [bp-20],ax	;n
; Line 578
	mov	bx,WORD PTR $S1361_ssi
	mov	ax,WORD PTR [bx+18]
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	mov	al,ah
	cbw	
	add	ax,WORD PTR _FrameRate
	dec	ax
	cwd	
	idiv	WORD PTR _FrameRate
	cmp	ax,WORD PTR [bp-20]	;n
	jle	$L20014
	mov	ax,1
	jmp	SHORT $L20015
$L20014:
	sub	ax,ax
$L20015:
	mov	WORD PTR [bp-16],ax	;InProximity
; Line 580
	cmp	WORD PTR $S1357_homing,0
	je	$I1574
; Line 581
	or	ax,ax
	jne	$I1576
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1574:
; Line 583
	mov	ax,WORD PTR _FrameRate
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	cmp	WORD PTR [bx+42],ax
	jge	$JCC3336
	jmp	$EX1563
$JCC3336:
; Line 584
$I1576:
; Line 588
	mov	bx,WORD PTR $S1361_ssi
	mov	WORD PTR [bx+26],0
; Line 590
	cmp	WORD PTR [bp-16],0	;InProximity
	jne	$JCC3354
	jmp	$EX1563
$JCC3354:
; Line 594
	mov	bx,WORD PTR $S1361_ssi
	mov	ax,WORD PTR [bx+38]
	mov	WORD PTR [bp-2],ax	;killed
; Line 595
	cmp	WORD PTR [bx+36],0
	jne	$I1579
; Line 597
	push	WORD PTR [bx+34]
	call	_GetRadarGTNum
	add	sp,2
	mov	WORD PTR [bp-8],ax	;src
	cmp	ax,-999
	je	$L20017
; Line 598
	neg	ax
	mov	WORD PTR [bp-8],ax	;src
; Line 600
; Line 601
	jmp	SHORT $L20017
	nop	
$I1579:
; Line 602
	mov	ax,WORD PTR [bx+34]
	mov	WORD PTR [bp-8],ax	;src
; Line 603
	cmp	ax,70
	jne	$L20017
; Line 604
	inc	ax
$L20017:
; Line 605
; Line 607
	cmp	WORD PTR [bp-2],70	;killed
	je	$JCC3416
	jmp	$I1583
$JCC3416:
; Line 609
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+28]
	call	_GetMissilePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	push	WORD PTR es:[bx+28]
	call	_DamageMe
	add	sp,2
; Line 610
	mov	BYTE PTR _Txt,0
; Line 611
	sub	ax,ax
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+28]
	push	WORD PTR [bp-8]	;src
	push	WORD PTR _Alt
	mov	dx,16
	sub	cx,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	cx
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	mov	cx,-1
	push	cx
	mov	cx,6
	push	cx
	call	_LogIt
	add	sp,24
; Line 612
	mov	ax,10
	push	ax
	sub	ax,ax
	push	ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	ax
	push	WORD PTR _Alt
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	call	_StartASmoke
	add	sp,14
; Line 614
	jmp	$I1596
	nop	
	nop	
$I1583:
; Line 615
	mov	ax,40
	imul	WORD PTR [bp-2]	;killed
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],3
	jne	$JCC3565
	jmp	$EX1563
$JCC3565:
; Line 618
	mov	ax,40
	imul	WORD PTR [bp-2]	;killed
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],32
	je	$I1587
; Line 619
	mov	WORD PTR _ps[bx+24],0
; Line 620
	push	WORD PTR _ps[bx+4]
	push	WORD PTR _ps[bx+2]
	mov	ax,1
	push	ax
	call	_CloseEnoughFor
	add	sp,6
	or	ax,ax
	je	$I1588
; Line 621
	sub	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,10
	push	ax
	call	_Sound
	add	sp,6
; Line 622
$I1588:
	mov	ax,10
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,40
	imul	WORD PTR [bp-2]	;killed
	mov	bx,ax
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	call	_StartASmoke
	add	sp,14
; Line 623
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 624
; Line 625
$I1587:
	cmp	WORD PTR _DOINVISIBLE,0
	je	$JCC3681
	jmp	$I1589
$JCC3681:
	cmp	WORD PTR _ENEMYNODIE,0
	je	$JCC3691
	jmp	$I1589
$JCC3691:
	mov	ax,46
	imul	WORD PTR [bp-2]	;killed
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _EngageTrain
	jne	$JCC3710
	jmp	$I1589
$JCC3710:
; Line 626
	cmp	WORD PTR _bv[bx+2],-1
	je	$I1591
	test	BYTE PTR _Rtime,1
	jne	$JCC3727
	jmp	$I1590
$JCC3727:
$I1591:
; Line 627
	mov	ax,40
	imul	WORD PTR [bp-2]	;killed
	mov	bx,ax
	mov	al,BYTE PTR _ps[bx+24]
	and	ax,32
	mov	WORD PTR [bp-18],ax	;crashstat
; Line 628
	push	WORD PTR [bp-2]	;killed
	mov	si,bx
	call	_DamageAI
	add	sp,2
; Line 629
	mov	al,BYTE PTR _ps[si+24]
	and	ax,32
	cmp	ax,WORD PTR [bp-18]	;crashstat
	je	$I1592
; Line 630
$L20045:
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+28]
	push	WORD PTR [bp-8]	;src
	push	WORD PTR _ps[si+6]
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	push	WORD PTR _ps[si+10]
	push	WORD PTR _ps[si+8]
	push	WORD PTR [bp-2]	;killed
	mov	ax,15
$L20044:
	push	ax
	call	_LogIt
	add	sp,24
; Line 631
	jmp	$I1596
$I1592:
; Line 632
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+28]
	push	WORD PTR [bp-8]	;src
	mov	ax,40
	imul	WORD PTR [bp-2]	;killed
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR [bp-2]	;killed
	mov	ax,6
	jmp	SHORT $L20044
	nop	
$I1590:
; Line 635
	push	WORD PTR [bp-2]	;killed
	call	_AirKill
	add	sp,2
; Line 636
	sub	ax,ax
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+28]
	push	WORD PTR [bp-8]	;src
	mov	ax,40
	imul	WORD PTR [bp-2]	;killed
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR [bp-2]	;killed
	mov	ax,6
	push	ax
	mov	si,bx
	call	_LogIt
	add	sp,24
	jmp	$L20045
$I1589:
; Line 641
	mov	ax,10
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,40
	imul	WORD PTR [bp-2]	;killed
	mov	bx,ax
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	si,ax
	call	_StartASmoke
	add	sp,14
; Line 642
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+28]
	push	WORD PTR [bp-8]	;src
	push	WORD PTR _ps[si+6]
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	push	WORD PTR _ps[si+10]
	push	WORD PTR _ps[si+8]
	push	WORD PTR [bp-2]	;killed
	mov	ax,6
	push	ax
	call	_LogIt
	add	sp,24
; Line 644
	push	WORD PTR _ps[si+22]
	call	_GetPlanePtr
	add	sp,2
	inc	ax
	inc	ax
	push	dx
	push	ax
	mov	ax,OFFSET _Txt
	push	ds
	push	ax
	call	FAR PTR __fstrcpy
	add	sp,8
; Line 645
	mov	ax,OFFSET DGROUP:$SG1597
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 646
$I1596:
; Line 647
; Line 649
	mov	ax,40
	imul	WORD PTR [bp-2]	;killed
	mov	bx,ax
	push	WORD PTR _ps[bx+4]
	push	WORD PTR _ps[bx+2]
	mov	ax,1
	push	ax
	call	_CloseEnoughFor
	add	sp,6
	or	ax,ax
	je	$I1598
; Line 650
	sub	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,10
	push	ax
	call	_Sound
	add	sp,6
; Line 652
$I1598:
	mov	ax,OFFSET DGROUP:$SG1599
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 653
	mov	ax,WORD PTR $S1362_sst
	mov	dx,WORD PTR $S1362_sst+2
	inc	ax
	inc	ax
	push	dx
	push	ax
	mov	ax,OFFSET _Txt
	push	ds
	push	ax
	call	FAR PTR __fstrcat
	add	sp,8
; Line 654
	mov	ax,4
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 656
$EX1563:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_CheckProximityHit	ENDP
; Line 661
	PUBLIC	_AirKill
_AirKill	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,90
	call	__aNchkstk
	push	si
;	LogWho = -2
;	arghtmp = -4
;	Str = -90
;	sarnum = -10
;	tempplane = -8
;	killed = 4
; Line 668
	mov	ax,40
	imul	WORD PTR [bp+4]	;killed
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],32
	je	$JCC4207
	jmp	$I1611
$JCC4207:
; Line 670
	push	WORD PTR [bp+4]	;killed
	mov	si,bx
	call	_IndirectWPCorrection
	add	sp,2
; Line 672
	or	BYTE PTR _ps[si+24],32
; Line 674
	mov	ax,46
	imul	WORD PTR [bp+4]	;killed
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FlyCruise
	je	$I1608
	mov	ax,WORD PTR [bp+4]	;killed
	cmp	WORD PTR _NPLANES,ax
	jle	$I1608
; Line 675
	mov	cx,WORD PTR _ps[si+2]
	mov	WORD PTR _chuteX,cx
; Line 676
	mov	cx,WORD PTR _ps[si+4]
	mov	WORD PTR _chuteY,cx
; Line 677
	mov	cx,WORD PTR _ps[si+6]
	mov	WORD PTR _chuteZ,cx
; Line 678
	mov	WORD PTR _chuteDZ,128
; Line 679
; Line 680
$I1608:
; Line 683
	mov	ax,40
	imul	WORD PTR [bp+4]	;killed
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	WORD PTR [bp-8],bx	;tempplane
	mov	WORD PTR [bp-6],es
	mov	ax,WORD PTR es:[bx]
	mov	WORD PTR [bp-2],ax	;LogWho
; Line 686
	mov	ax,1024
	push	ax
	push	WORD PTR [bp+4]	;killed
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	je	$I1609
	or	BYTE PTR [bp-2],128	;LogWho
; Line 694
$I1609:
	mov	ax,40
	imul	WORD PTR [bp+4]	;killed
	mov	bx,ax
	cmp	WORD PTR _ps[bx+26],0
	jne	$I1610
	and	WORD PTR _ps[bx+24],1025
; Line 696
$I1610:
; Line 698
	les	bx,DWORD PTR [bp-8]	;tempplane
	cmp	WORD PTR es:[bx+38],50
	je	$I1611
	cmp	WORD PTR es:[bx+38],60
	je	$I1611
	cmp	WORD PTR es:[bx+38],70
	je	$I1611
	cmp	WORD PTR es:[bx+38],80
	je	$I1611
	cmp	WORD PTR es:[bx+38],90
	je	$I1611
; Line 699
	push	WORD PTR [bp+4]	;killed
	call	_GetSAR
	add	sp,2
; Line 700
$I1611:
; Line 703
	mov	ax,40
	imul	WORD PTR [bp+4]	;killed
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	mov	si,bx
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-8],ax	;tempplane
	mov	WORD PTR [bp-6],dx
	inc	ax
	inc	ax
	push	dx
	push	ax
	mov	ax,OFFSET _Txt
	push	ds
	push	ax
	call	FAR PTR __fstrcpy
	add	sp,8
; Line 704
	mov	ax,OFFSET DGROUP:$SG1612
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 706
	push	WORD PTR _ps[si+4]
	push	WORD PTR _ps[si+2]
	mov	ax,1
	push	ax
	call	_CloseEnoughFor
	add	sp,6
	or	ax,ax
	je	$I1613
; Line 707
	sub	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,10
	push	ax
	call	_Sound
	add	sp,6
; Line 708
$I1613:
	mov	ax,10
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;killed
	mov	bx,ax
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	call	_StartASmoke
	add	sp,14
; Line 709
	push	WORD PTR [bp+4]	;killed
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I1614
; Line 710
	mov	ax,1
	push	ax
	call	_Speech
	add	sp,2
; Line 711
	mov	al,BYTE PTR _Rtime
	and	ax,3
	mov	WORD PTR [bp-4],ax	;arghtmp
; Line 712
	lea	ax,WORD PTR [bp-90]	;Str
	push	ax
	push	WORD PTR [bp+4]	;killed
	call	_GetWingName
	add	sp,4
; Line 713
	cmp	WORD PTR [bp-4],0	;arghtmp
	jne	$I1616
; Line 714
	mov	ax,OFFSET DGROUP:$SG1617
	jmp	SHORT $L20046
$I1616:
	cmp	WORD PTR [bp-4],1	;arghtmp
	jne	$I1619
; Line 716
	mov	ax,OFFSET DGROUP:$SG1620
	jmp	SHORT $L20046
	nop	
$I1619:
	cmp	WORD PTR [bp-4],2	;arghtmp
	jne	$I1622
; Line 718
	mov	ax,OFFSET DGROUP:$SG1623
	jmp	SHORT $L20046
	nop	
$I1622:
	cmp	WORD PTR [bp-4],3	;arghtmp
	jne	$I1625
; Line 720
	mov	ax,OFFSET DGROUP:$SG1626
$L20046:
	push	ax
	lea	ax,WORD PTR [bp-90]	;Str
	push	ax
	call	_strcat
	add	sp,4
; Line 721
$I1625:
	mov	ax,3
	push	ax
	lea	ax,WORD PTR [bp-90]	;Str
	push	ax
	call	_Message
	add	sp,4
; Line 722
; Line 724
$I1614:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AirKill	ENDP
; Line 728
	PUBLIC	_DamageMe
_DamageMe	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	i = -6
;	x = -4
;	x2 = -8
;	NrHits = -2
;	DamageType = 4
; Line 732
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	mov	cx,12
	push	cx
	call	_Sound
	add	sp,6
; Line 733
	test	BYTE PTR _Status+1,16
	je	$I1633
	cmp	WORD PTR _ENEMYNODIE,0
	je	$I1633
	cmp	WORD PTR [bp+4],9	;DamageType
	jle	$I1633
	cmp	WORD PTR _KnockItOffStatus,0
	je	$I1633
; Line 734
	mov	ax,80
	jmp	SHORT $L20047
$I1633:
; Line 736
	mov	ax,16
$L20047:
	push	ax
	call	_Speech
	add	sp,2
; Line 739
	test	BYTE PTR _Status+1,16
	je	$I1635
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 743
	nop	
$I1635:
	mov	ax,WORD PTR [bp+4]	;DamageType
	jmp	SHORT $S1636
; Line 744
	nop	
$SC1640:
; Line 745
	mov	WORD PTR [bp-2],0	;NrHits
; Line 746
	jmp	SHORT $SB1637
; Line 750
	nop	
$SC1642:
; Line 751
	mov	WORD PTR [bp-2],5	;NrHits
; Line 752
	jmp	SHORT $SB1637
; Line 753
	nop	
$SC1643:
; Line 754
	mov	WORD PTR [bp-2],8	;NrHits
; Line 755
	jmp	SHORT $SB1637
; Line 756
	nop	
$SC1644:
; Line 757
	mov	WORD PTR [bp-2],10	;NrHits
; Line 758
	jmp	SHORT $SB1637
; Line 759
	nop	
$SC1645:
; Line 760
	mov	WORD PTR [bp-2],6	;NrHits
; Line 761
	jmp	SHORT $SB1637
; Line 762
	nop	
$SC1646:
; Line 763
	mov	WORD PTR [bp-2],12	;NrHits
; Line 764
	jmp	SHORT $SB1637
; Line 765
	nop	
$SC1647:
; Line 766
	mov	WORD PTR [bp-2],15	;NrHits
; Line 767
	jmp	SHORT $SB1637
; Line 768
	nop	
$SC1648:
; Line 769
	mov	WORD PTR [bp-2],20	;NrHits
; Line 770
	jmp	SHORT $SB1637
; Line 771
	nop	
$SC1649:
; Line 772
	mov	WORD PTR [bp-2],25	;NrHits
; Line 773
	jmp	SHORT $SB1637
; Line 774
	nop	
$SC1650:
; Line 775
	mov	WORD PTR [bp-2],30	;NrHits
; Line 776
	jmp	SHORT $SB1637
; Line 777
	nop	
$SC1641:
; Line 748
	mov	WORD PTR [bp-2],3	;NrHits
; Line 749
	jmp	SHORT $SB1637
	nop	
$S1636:
	cmp	ax,15
	ja	$SC1641
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20018[bx]
	nop	
$L20018:
		DW	$SC1640
		DW	$SC1641
		DW	$SC1642
		DW	$SC1643
		DW	$SC1644
		DW	$SC1641
		DW	$SC1641
		DW	$SC1641
		DW	$SC1641
		DW	$SC1641
		DW	$SC1645
		DW	$SC1646
		DW	$SC1647
		DW	$SC1648
		DW	$SC1649
		DW	$SC1650
$SB1637:
; Line 782
	cmp	WORD PTR _ConfigData+6,0
	jne	$I1654
; Line 783
	cmp	WORD PTR [bp-2],0	;NrHits
	jne	$I1653
; Line 784
	mov	WORD PTR [bp-2],0	;NrHits
; Line 785
	jmp	SHORT $I1654
$I1653:
; Line 786
	mov	WORD PTR [bp-2],3	;NrHits
$I1654:
; Line 787
; Line 789
	mov	WORD PTR [bp-6],0	;i
	jmp	SHORT $F1655
$FC1656:
; Line 791
	mov	ax,16
	push	ax
	call	_rnd
	add	sp,2
	mov	cx,ax
	mov	WORD PTR [bp-4],cx	;x
	mov	ax,1
	shl	ax,cl
	mov	WORD PTR [bp-8],ax	;x2
; Line 792
	test	ax,WORD PTR _Damaged
	jne	$I1659
	push	ax
	call	_DamageIt
	add	sp,2
; Line 793
$I1659:
	mov	ax,WORD PTR [bp-8]	;x2
	or	WORD PTR _Damaged,ax
; Line 796
	mov	ax,1
	mov	bx,WORD PTR [bp-4]	;x
	shl	bx,1
	mov	WORD PTR _DAMAGELITE[bx],ax
	mov	WORD PTR _MASTER_CAUTION,ax
; Line 797
	inc	WORD PTR [bp-6]	;i
$F1655:
	mov	ax,WORD PTR [bp-6]	;i
	cmp	WORD PTR [bp-2],ax	;NrHits
	jg	$FC1656
; Line 798
	mov	WORD PTR _ImHit,1
; Line 799
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DamageMe	ENDP
; Line 804
	PUBLIC	_DamageIt
_DamageIt	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	x = 4
; Line 805
	mov	ax,WORD PTR [bp+4]	;x
	cmp	ax,64
	je	$SC1679
	jle	$JCC5012
	jmp	$L20019
$JCC5012:
	cmp	ax,32
	je	$SC1677
	ja	$SB1664
	cmp	al,4
	je	$SC1671
	jle	$JCC5028
	jmp	$L20020
$JCC5028:
	dec	al
	je	$SC1667
	dec	al
	je	$SC1669
	jmp	SHORT $SB1664
; Line 806
	nop	
$SC1667:
; Line 807
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1668
$L20050:
	push	ax
	call	_Message
	mov	sp,bp
; Line 808
$SB1664:
; Line 860
	mov	ax,WORD PTR [bp+4]	;x
	jmp	$S1693
; Line 810
	nop	
$SC1669:
; Line 811
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1670
	jmp	SHORT $L20050
; Line 814
	nop	
$SC1671:
; Line 815
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1672
	jmp	SHORT $L20050
; Line 819
	nop	
$SC1673:
; Line 820
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1674
	jmp	SHORT $L20050
; Line 823
	nop	
$SC1675:
; Line 824
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1676
	jmp	SHORT $L20050
; Line 827
	nop	
$SC1677:
; Line 828
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1678
	jmp	SHORT $L20050
; Line 831
	nop	
$SC1679:
; Line 832
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1680
	jmp	SHORT $L20050
; Line 835
	nop	
$SC1681:
; Line 836
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1682
	jmp	SHORT $L20050
; Line 839
	nop	
$SC1683:
; Line 840
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1684
	jmp	SHORT $L20050
; Line 843
	nop	
$SC1685:
; Line 844
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1686
	jmp	SHORT $L20050
; Line 847
	nop	
$SC1687:
; Line 848
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1688
	jmp	SHORT $L20050
; Line 851
	nop	
$SC1689:
; Line 852
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1690
	jmp	SHORT $L20050
; Line 855
	nop	
$SC1691:
; Line 856
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1692
	jmp	$L20050
$L20020:
	sub	al,8
	je	$SC1673
	sub	al,8
	je	$SC1675
	jmp	$SB1664
	nop	
$L20019:
	cmp	ax,2048
	je	$SC1691
	jg	$L20021
	sub	ax,128
	je	$SC1681
	sub	ax,128
	je	$SC1683
	jmp	$SB1664
$L20021:
	sub	ax,4096
	je	$SC1689
	sub	ax,4096
	je	$SC1685
	sub	ax,8192
	je	$SC1687
	jmp	$SB1664
; Line 861
$SC1697:
; Line 862
	mov	WORD PTR _AutoAlt,0
; Line 863
	mov	sp,bp
	pop	bp
	ret	
; Line 865
$SC1698:
; Line 866
	mov	WORD PTR _JAMMER,0
; Line 867
	mov	sp,bp
	pop	bp
	ret	
$S1693:
	sub	ax,2048
	je	$SC1697
	sub	ax,14336
	je	$SC1698
; Line 869
	mov	sp,bp
	pop	bp
	ret	

_DamageIt	ENDP
; Line 873
	PUBLIC	_firemissile
_firemissile	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,26
	call	__aNchkstk
;	lp = -24
;	i = -14
;	k = -18
;	type = -2
;	weapon = -16
;	cnt = -4
;	TgtX = -8
;	TgtY = -12
;	tempmissile = -22
; Line 880
	cmp	WORD PTR _ejected,0
	jne	$I1711
	test	BYTE PTR _Damaged,64
	je	$I1710
$I1711:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 884
	nop	
$I1710:
	mov	ax,30
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$I1713
	mov	ax,40
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$JCC5332
	jmp	$L20051
$JCC5332:
$I1713:
; Line 885
	call	_AAGetPriority
	cmp	ax,15
	jne	$I1711
; Line 887
; Line 891
	jmp	$L20051
$FC1717:
; Line 892
	mov	bx,ax
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-16],ax	;weapon
; Line 893
	mov	cx,24
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ORDNANCE[bx+12]
	mov	WORD PTR [bp-2],ax	;type
; Line 895
	sub	dx,dx
	push	dx
	sub	bx,bx
	push	bx
	push	bx
	push	ax
	mov	ax,-999
	push	ax
	push	WORD PTR _Alt
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	ax
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	mov	ax,-1
	push	ax
	sub	dx,dx
	push	dx
	call	_LogIt
	add	sp,24
; Line 915
	mov	ax,-1
	push	ax
	push	ax
	push	WORD PTR [bp-10]
	push	WORD PTR [bp-12]	;TgtY
	push	WORD PTR [bp-6]
	push	WORD PTR [bp-8]	;TgtX
	mov	cx,70
	push	cx
	cmp	WORD PTR _SHOOT,0
	je	$L20022
	mov	ax,WORD PTR _LOCKED
$L20022:
	push	ax
	mov	al,BYTE PTR _AirSpeed+1
	sub	ah,ah
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,cx
	push	ax
	push	WORD PTR _OurRoll
	push	WORD PTR _OurPitch
	push	WORD PTR _OurHead
	push	WORD PTR _Alt
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	ax
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	push	WORD PTR [bp-16]	;weapon
	mov	ax,-1
	push	ax
	call	_firemissile2
	add	sp,38
	mov	WORD PTR [bp-18],ax	;k
	inc	ax
	je	$L20051
; Line 916
	mov	ax,WORD PTR [bp-18]	;k
	mov	WORD PTR _PovMisl,ax
; Line 917
	mov	ax,24
	imul	WORD PTR [bp-16]	;weapon
	mov	bx,ax
	test	BYTE PTR _ORDNANCE[bx+14],2
	je	$I1721
	mov	ax,WORD PTR [bp-18]	;k
	mov	WORD PTR _LastMisl,ax
; Line 918
$I1721:
; Line 919
	sub	ax,ax
	push	ax
	mov	ax,2
	push	ax
	push	WORD PTR [bp-2]	;type
	call	_GetMissilePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	cmp	WORD PTR es:[bx+14],1
	sbb	ax,ax
	and	ax,3
	add	ax,22
	push	ax
	call	_Sound
	add	sp,6
; Line 920
; Line 921
$L20051:
	call	_ARMT_release
	or	ax,ax
	je	$JCC5601
	jmp	$FC1717
$JCC5601:
; Line 922
	mov	sp,bp
	pop	bp
	ret	

_firemissile	ENDP
; Line 927
	PUBLIC	_firemissile2
_firemissile2	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
;	k = -10
;	type = -6
;	tcnt = -8
;	tempmissile = -14
;	ldist = -4
;	targettype = 40
;	stype = 38
;	TgtY = 34
;	TgtX = 30
;	source = 28
;	gtarg = 26
;	spd = 24
;	r = 22
;	p = 20
;	h = 18
;	z = 16
;	y = 12
;	x = 8
;	weapon = 6
;	misnum = 4
; Line 932
	cmp	WORD PTR [bp+4],-1	;misnum
	jne	$I1743
; Line 934
	cmp	WORD PTR [bp+28],70	;source
	je	$L20026
	push	WORD PTR [bp+28]	;source
	mov	ax,20
	push	ax
	sub	ax,ax
	push	ax
	call	_FindEmptyMissileSlot2
	add	sp,6
	jmp	SHORT $L20052
	nop	
$L20026:
	mov	ax,28
	push	ax
	mov	ax,20
	push	ax
	call	_FindEmptyMissileSlot
	add	sp,4
	jmp	SHORT $L20052
$I1743:
; Line 937
	mov	ax,WORD PTR [bp+4]	;misnum
$L20052:
	mov	WORD PTR [bp-10],ax	;k
; Line 938
; Line 940
	cmp	ax,-1
	jne	$JCC5675
	jmp	$I1770
$JCC5675:
; Line 942
	cmp	WORD PTR [bp+38],-1	;stype
	jne	$I1748
; Line 943
	mov	ax,24
	imul	WORD PTR [bp+6]	;weapon
	mov	bx,ax
	mov	ax,WORD PTR _ORDNANCE[bx+12]
	jmp	SHORT $L20053
$I1748:
; Line 945
	mov	ax,WORD PTR [bp+38]	;stype
$L20053:
	mov	WORD PTR [bp-6],ax	;type
; Line 947
	push	ax
	call	_GetMissilePtr
	add	sp,2
	mov	WORD PTR [bp-14],ax	;tempmissile
	mov	WORD PTR [bp-12],dx
; Line 949
	mov	ax,44
	imul	WORD PTR [bp-10]	;k
	mov	bx,ax
	mov	ax,WORD PTR [bp+8]	;x
	mov	dx,WORD PTR [bp+10]
	mov	WORD PTR _ss[bx],ax
	mov	WORD PTR _ss[bx+2],dx
; Line 950
	mov	ax,WORD PTR [bp+12]	;y
	mov	dx,WORD PTR [bp+14]
	mov	WORD PTR _ss[bx+4],ax
	mov	WORD PTR _ss[bx+6],dx
; Line 951
	mov	ax,WORD PTR [bp+16]	;z
	mov	WORD PTR _ss[bx+16],ax
; Line 952
	mov	ax,WORD PTR [bp+24]	;spd
	mov	WORD PTR _ss[bx+18],ax
; Line 953
	mov	ax,WORD PTR [bp+18]	;h
	mov	WORD PTR _ss[bx+20],ax
; Line 954
	mov	ax,WORD PTR [bp+20]	;p
	mov	WORD PTR _ss[bx+22],ax
; Line 955
	mov	ax,WORD PTR [bp+22]	;r
	mov	WORD PTR _ss[bx+24],ax
; Line 957
	cmp	WORD PTR [bp+6],-1	;weapon
	jne	$I1750
; Line 958
	mov	WORD PTR [bp-4],309	;ldist
; Line 959
	jmp	SHORT $I1751
	nop	
$I1750:
; Line 960
	mov	ax,103
	les	bx,DWORD PTR [bp-14]	;tempmissile
	imul	WORD PTR es:[bx+14]
	cwd	
	mov	WORD PTR [bp-4],ax	;ldist
$I1751:
; Line 961
	mov	ax,44
	imul	WORD PTR [bp-10]	;k
	mov	bx,ax
	mov	ax,WORD PTR [bp-4]	;ldist
	mov	WORD PTR _ss[bx+26],ax
; Line 963
	mov	ax,WORD PTR [bp-6]	;type
	mov	WORD PTR _ss[bx+28],ax
; Line 964
	mov	ax,WORD PTR [bp+6]	;weapon
	mov	WORD PTR _ss[bx+30],ax
; Line 965
	mov	cx,WORD PTR _LastSlotNMount
	mov	WORD PTR _ss[bx+32],cx
; Line 966
	mov	WORD PTR _ss[bx+36],1
; Line 967
	mov	cx,WORD PTR [bp+28]	;source
	mov	WORD PTR _ss[bx+34],cx
; Line 968
	mov	WORD PTR _ss[bx+42],0
; Line 970
	inc	ax
	jne	$I1752
; Line 971
	mov	WORD PTR [bp+6],0	;weapon
; Line 973
$I1752:
; Line 974
	mov	ax,44
	imul	WORD PTR [bp-10]	;k
	mov	bx,ax
	cmp	WORD PTR _ss[bx+36],1
	jne	$I1753
	cmp	WORD PTR _ss[bx+34],70
	jne	$I1753
	cmp	WORD PTR _ss[bx+30],15
	jne	$I1753
	mov	ax,30
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$I1754
	mov	ax,40
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	je	$I1753
$I1754:
; Line 977
	mov	WORD PTR [bp-8],0	;tcnt
$FC1756:
; Line 978
	mov	cl,3
	mov	bx,WORD PTR [bp-8]	;tcnt
	shl	bx,cl
	mov	ax,WORD PTR _LastSlotNMount
	cmp	WORD PTR _DESIG_TARG[bx+6],ax
	jne	$L20054
; Line 979
	mov	WORD PTR _DESIG_TARG[bx],2
; Line 980
	mov	ax,WORD PTR [bp-10]	;k
	mov	WORD PTR _DESIG_TARG[bx+4],ax
; Line 981
	mov	ax,WORD PTR _DESIG_TARG[bx+2]
	mov	WORD PTR [bp+26],ax	;gtarg
; Line 982
; Line 983
$L20054:
	inc	WORD PTR [bp-8]	;tcnt
	cmp	WORD PTR [bp-8],6	;tcnt
	jl	$FC1756
; Line 984
	call	_UpdateTIDTargs
; Line 985
; Line 988
$I1753:
	mov	ax,24
	imul	WORD PTR [bp+6]	;weapon
	mov	bx,ax
	test	BYTE PTR _ORDNANCE[bx+14],2
	jne	$I1761
	cmp	WORD PTR [bp+40],1	;targettype
	je	$JCC6019
	jmp	$I1760
$JCC6019:
$I1761:
; Line 989
	mov	ax,44
	imul	WORD PTR [bp-10]	;k
	mov	bx,ax
	mov	ax,WORD PTR [bp+26]	;gtarg
	mov	WORD PTR _ss[bx+38],ax
; Line 990
	mov	WORD PTR _ss[bx+40],1
; Line 992
	cmp	WORD PTR _warstatus,0
	jne	$I1762
	cmp	ax,70
	jne	$I1762
; Line 993
	mov	WORD PTR _warstatus,1
; Line 994
	mov	WORD PTR _LastCall,-240
; Line 995
; Line 997
$I1762:
; Line 998
	mov	ax,44
	imul	WORD PTR [bp-10]	;k
	mov	bx,ax
	cmp	WORD PTR _ss[bx+36],1
	jne	$I1763
	cmp	WORD PTR _ss[bx+34],70
	jne	$I1763
	cmp	WORD PTR _ss[bx+30],15
	jne	$I1763
	mov	ax,30
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	je	$JCC6114
	jmp	$I1770
$JCC6114:
	mov	ax,40
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	jne	$I1770
; Line 1000
$I1763:
; Line 1001
	cmp	WORD PTR [bp+26],70	;gtarg
	je	$I1770
	cmp	WORD PTR [bp+26],0	;gtarg
	jl	$I1770
	mov	ax,WORD PTR [bp+26]	;gtarg
	cmp	WORD PTR _NPLANES,ax
	jle	$I1770
; Line 1002
	push	ax
	call	_CheckAIBombs
	add	sp,2
	cmp	ax,-999
	je	$I1768
; Line 1003
	push	WORD PTR [bp+26]	;gtarg
	call	_ShowJettison
	add	sp,2
; Line 1004
; Line 1005
$I1768:
	cmp	WORD PTR _warstatus,0
	jne	$I1770
	push	WORD PTR [bp+26]	;gtarg
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I1770
; Line 1006
	mov	WORD PTR _warstatus,1
; Line 1007
	mov	WORD PTR _LastCall,-240
; Line 1008
; Line 1009
; Line 1010
; Line 1011
	jmp	SHORT $I1770
	nop	
	nop	
$I1760:
; Line 1012
	mov	ax,44
	imul	WORD PTR [bp-10]	;k
	mov	bx,ax
	mov	ax,WORD PTR [bp+30]	;TgtX
	mov	dx,WORD PTR [bp+32]
	mov	WORD PTR _ss[bx+8],ax
	mov	WORD PTR _ss[bx+10],dx
; Line 1013
	mov	ax,WORD PTR [bp+34]	;TgtY
	mov	dx,WORD PTR [bp+36]
	mov	WORD PTR _ss[bx+12],ax
	mov	WORD PTR _ss[bx+14],dx
; Line 1014
	mov	WORD PTR _ss[bx+40],0
; Line 1015
$I1770:
; Line 1016
; Line 1017
	mov	ax,WORD PTR [bp-10]	;k
; Line 1018
	mov	sp,bp
	pop	bp
	ret	
	nop	

_firemissile2	ENDP
; Line 1022
	PUBLIC	_FindEmptyMissileSlot
_FindEmptyMissileSlot	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
;	End = 6
;	Start = 4
; Line 1025
	mov	ax,WORD PTR [bp+4]	;Start
	mov	WORD PTR [bp-2],ax	;i
	jmp	SHORT $F1775
; Line 1028
; Line 1029
	nop	
$FC1776:
	inc	WORD PTR [bp-2]	;i
$F1775:
	mov	ax,WORD PTR [bp+6]	;End
	cmp	WORD PTR [bp-2],ax	;i
	jge	$FB1777
; Line 1026
	mov	ax,44
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	cmp	WORD PTR _ss[bx+26],0
	jne	$FC1776
; Line 1027
	mov	ax,WORD PTR [bp-2]	;i
	mov	sp,bp
	pop	bp
	ret	
	nop	
$FB1777:
; Line 1030
	mov	ax,-1
; Line 1031
	mov	sp,bp
	pop	bp
	ret	
	nop	

_FindEmptyMissileSlot	ENDP
; Line 1035
	PUBLIC	_FindEmptyMissileSlot2
_FindEmptyMissileSlot2	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	i = -6
;	returnval = -2
;	playertarget = -4
;	shooter = 8
;	End = 6
;	Start = 4
; Line 1040
	mov	WORD PTR [bp-2],-1	;returnval
; Line 1042
	mov	ax,WORD PTR [bp+4]	;Start
	mov	WORD PTR [bp-6],ax	;i
	jmp	SHORT $F1786
$I1789:
; Line 1047
	mov	ax,44
	imul	WORD PTR [bp-6]	;i
	mov	bx,ax
	mov	ax,WORD PTR [bp+8]	;shooter
	cmp	WORD PTR _ss[bx+34],ax
	jne	$I1791
	cmp	WORD PTR _ss[bx+40],0
	je	$I1791
; Line 1048
	mov	ax,-1
	mov	sp,bp
	pop	bp
	ret	
; Line 1049
; Line 1050
	nop	
$I1791:
; Line 1051
	inc	WORD PTR [bp-6]	;i
$F1786:
	mov	ax,WORD PTR [bp+6]	;End
	cmp	WORD PTR [bp-6],ax	;i
	jge	$FB1788
; Line 1043
	mov	ax,44
	imul	WORD PTR [bp-6]	;i
	mov	bx,ax
	cmp	WORD PTR _ss[bx+26],0
	jne	$I1789
; Line 1044
	mov	ax,WORD PTR [bp-6]	;i
	mov	WORD PTR [bp-2],ax	;returnval
; Line 1045
; Line 1046
	jmp	SHORT $I1791
$FB1788:
; Line 1052
	mov	ax,WORD PTR [bp-2]	;returnval
; Line 1053
	mov	sp,bp
	pop	bp
	ret	
	nop	

_FindEmptyMissileSlot2	ENDP
; Line 1057
	PUBLIC	_FindEmptyMissileSlotP
_FindEmptyMissileSlotP	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	i = -6
;	returnval = -2
;	playertarget = -4
;	shooter = 8
;	End = 6
;	Start = 4
; Line 1062
	mov	WORD PTR [bp-2],-1	;returnval
; Line 1063
	mov	WORD PTR [bp-4],0	;playertarget
; Line 1064
	mov	ax,WORD PTR [bp+4]	;Start
	mov	WORD PTR [bp-6],ax	;i
	jmp	SHORT $F1800
	nop	
$I1803:
; Line 1069
	mov	ax,cx
	imul	WORD PTR [bp-6]	;i
	mov	bx,ax
	cmp	WORD PTR _ss[bx+38],70
	jne	$I1806
; Line 1071
	mov	cl,BYTE PTR _Diff
	mov	ax,2
	shl	ax,cl
	inc	WORD PTR [bp-4]	;playertarget
	cmp	ax,WORD PTR [bp-4]	;playertarget
	jg	$I1806
; Line 1072
$L20055:
	mov	ax,-1
	mov	sp,bp
	pop	bp
	ret	
; Line 1073
$I1806:
; Line 1074
	mov	ax,44
	imul	WORD PTR [bp-6]	;i
	mov	bx,ax
	mov	ax,WORD PTR [bp+8]	;shooter
	cmp	WORD PTR _ss[bx+34],ax
	jne	$I1807
	cmp	WORD PTR _ss[bx+40],0
	jne	$L20055
; Line 1076
$I1807:
; Line 1077
	inc	WORD PTR [bp-6]	;i
$F1800:
	mov	ax,WORD PTR [bp-6]	;i
	cmp	WORD PTR [bp+6],ax	;End
	jle	$FB1802
; Line 1065
	mov	cx,44
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _ss[bx+26],0
	jne	$I1803
; Line 1066
	mov	ax,WORD PTR [bp-6]	;i
	mov	WORD PTR [bp-2],ax	;returnval
; Line 1067
; Line 1068
	jmp	SHORT $I1807
	nop	
$FB1802:
; Line 1078
	mov	ax,WORD PTR [bp-2]	;returnval
; Line 1079
	mov	sp,bp
	pop	bp
	ret	
	nop	

_FindEmptyMissileSlotP	ENDP
; Line 1083
HomeOnClosestPlane	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	j = -2
;	homee = -8
;	tempmissile = -6
;	k = 4
; Line 1087
	mov	WORD PTR [bp-8],-1	;homee
; Line 1089
	mov	ax,44
	imul	WORD PTR [bp+4]	;k
	mov	bx,ax
	push	WORD PTR _ss[bx+28]
	call	_GetMissilePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	ax,WORD PTR es:[bx+22]
	mov	WORD PTR $S1356_homer,ax
; Line 1091
	mov	WORD PTR [bp-2],0	;j
	mov	WORD PTR $S1354_dist,32767
	jmp	SHORT $F1814
$FC1815:
; Line 1092
	mov	cx,40
	imul	cx
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],2
	je	$I1819
	cmp	WORD PTR _ps[bx+26],0
	je	$I1819
; Line 1093
	mov	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR $S1350_HomeHead,ax
; Line 1094
	push	WORD PTR $S1356_homer
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	call	home
	add	sp,12
	or	ax,ax
	je	$I1819
; Line 1095
	mov	ax,WORD PTR $S1354_dist
	cmp	WORD PTR $S1348_homedist,ax
	jae	$I1819
; Line 1096
	mov	ax,WORD PTR $S1348_homedist
	mov	WORD PTR $S1354_dist,ax
; Line 1097
	mov	ax,WORD PTR [bp-2]	;j
	mov	WORD PTR [bp-8],ax	;homee
; Line 1098
; Line 1099
$I1819:
; Line 1100
; Line 1101
	inc	WORD PTR [bp-2]	;j
$F1814:
	mov	ax,WORD PTR [bp-2]	;j
	cmp	WORD PTR _NPLANES,ax
	jg	$FC1815
; Line 1103
	mov	ax,WORD PTR [bp-8]	;homee
; Line 1104
	mov	sp,bp
	pop	bp
	ret	

HomeOnClosestPlane	ENDP
; Line 1108
	PUBLIC	_MissilesInAir
_MissilesInAir	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 1111
	mov	WORD PTR [bp-2],0	;i
	mov	WORD PTR $S1361_ssi,OFFSET _ss
	jmp	SHORT $F1823
; Line 1113
$FC1824:
	inc	WORD PTR [bp-2]	;i
	add	WORD PTR $S1361_ssi,44
$F1823:
	cmp	WORD PTR [bp-2],28	;i
	jge	$FB1825
; Line 1112
	mov	bx,WORD PTR $S1361_ssi
	cmp	WORD PTR [bx+26],0
	je	$FC1824
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$FB1825:
; Line 1115
	sub	ax,ax
; Line 1116
	mov	sp,bp
	pop	bp
	ret	

_MissilesInAir	ENDP
; Line 1120
	PUBLIC	_FoxCall
_FoxCall	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	weapon = 4
; Line 1121
	mov	ax,OFFSET DGROUP:$SG1830
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	mov	sp,bp
; Line 1122
	mov	ax,WORD PTR [bp+4]	;weapon
	jmp	SHORT $S1831
; Line 1123
$SC1835:
; Line 1124
	mov	ax,OFFSET DGROUP:$SG1836
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	mov	sp,bp
; Line 1125
	mov	ax,19
$L20057:
	push	ax
	call	_Speech
	mov	sp,bp
; Line 1126
	jmp	SHORT $SB1832
; Line 1127
$SC1837:
; Line 1128
	mov	ax,OFFSET DGROUP:$SG1838
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	mov	sp,bp
; Line 1129
	mov	ax,20
	jmp	SHORT $L20057
; Line 1131
$SC1839:
; Line 1133
	mov	ax,OFFSET DGROUP:$SG1840
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	mov	sp,bp
; Line 1134
	mov	ax,21
	jmp	SHORT $L20057
$S1831:
	sub	ax,15
	je	$SC1839
	sub	ax,3
	je	$SC1837
	dec	ax
	je	$SC1839
	dec	ax
	je	$SC1835
$SB1832:
; Line 1137
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
; Line 1138
	mov	sp,bp
	pop	bp
	ret	
	nop	

_FoxCall	ENDP
; Line 1142
	PUBLIC	_LaunchCall
_LaunchCall	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 1143
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:$SG1843
	push	ax
	call	_Message
	add	sp,4
; Line 1144
	mov	ax,23
	push	ax
	call	_Speech
	add	sp,2
; Line 1145
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,18
	push	ax
	call	_Sound
	add	sp,6
; Line 1146
	ret	
	nop	

_LaunchCall	ENDP
; Line 1150
	PUBLIC	_CheckBlastArea
_CheckBlastArea	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__aNchkstk
	push	si
;	gdx = -4
;	gdy = -10
;	radarnum = -14
;	targ = -24
;	dx = -20
;	dy = -22
;	LastTgt = -6
;	ObjNr = -16
;	TargetHit = -18
;	cnt = -12
;	cruise = 14
;	weapon = 12
;	yval = 8
;	xval = 4
; Line 1159
	sub	ax,ax
	mov	WORD PTR [bp-18],ax	;TargetHit
	mov	WORD PTR [bp-12],ax	;cnt
	jmp	$F1859
	nop	
$I1866:
; Line 1176
	mov	ax,2
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	mov	bx,WORD PTR $S1361_ssi
	push	WORD PTR [bx+28]
	push	WORD PTR [bx+34]
	mov	ax,1
	push	ax
	mov	bx,WORD PTR [bp-12]	;cnt
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	push	WORD PTR _gt[bx+6]
	push	WORD PTR _gt[bx+4]
	push	WORD PTR _gt[bx+2]
	push	WORD PTR _gt[bx]
	push	WORD PTR _gt[bx+8]
	mov	ax,30
$L20058:
	push	ax
	call	_LogIt
	add	sp,24
; Line 1177
; Line 1179
	mov	ax,WORD PTR [bp+8]	;yval
	mov	dx,WORD PTR [bp+10]
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
	mov	ax,WORD PTR [bp+4]	;xval
	mov	dx,WORD PTR [bp+6]
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
	mov	ax,1
	push	ax
	call	_CloseEnoughFor
	add	sp,6
	or	ax,ax
	je	$I1868
; Line 1180
	sub	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,10
	push	ax
	call	_Sound
	add	sp,6
; Line 1182
$I1868:
; Line 1183
; Line 1184
	inc	WORD PTR [bp-12]	;cnt
$F1859:
	mov	ax,WORD PTR _NGTARGETS
	cmp	WORD PTR [bp-12],ax	;cnt
	jl	$JCC7117
	jmp	$FB1861
$JCC7117:
; Line 1160
	mov	bx,WORD PTR [bp-12]	;cnt
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	cmp	WORD PTR _gt[bx+10],0
	je	$I1868
; Line 1161
	mov	ax,WORD PTR _gt[bx]
	mov	dx,WORD PTR _gt[bx+2]
	sub	ax,WORD PTR [bp+4]	;xval
	sbb	dx,WORD PTR [bp+6]
	push	dx
	push	ax
	mov	si,bx
	call	_labs
	add	sp,4
	mov	WORD PTR [bp-4],ax	;gdx
	mov	WORD PTR [bp-2],dx
; Line 1162
	mov	ax,WORD PTR _gt[si+4]
	mov	dx,WORD PTR _gt[si+6]
	sub	ax,WORD PTR [bp+8]	;yval
	sbb	dx,WORD PTR [bp+10]
	push	dx
	push	ax
	call	_labs
	add	sp,4
; Line 1163
	cmp	WORD PTR [bp-2],0
	jg	$I1868
	jl	$L20028
	cmp	WORD PTR [bp-4],2048	;gdx
	jae	$I1868
$L20028:
	or	dx,dx
	jg	$I1868
	jl	$L20029
	cmp	ax,2048
	jae	$I1868
$L20029:
; Line 1164
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1864
	push	ax
	call	_Message
	add	sp,4
; Line 1165
	mov	WORD PTR _gt[si+10],0
; Line 1166
	mov	ax,30
	push	ax
	mov	ax,1
	push	ax
	push	WORD PTR [bp+10]
	push	WORD PTR [bp+8]	;yval
	mov	ax,120
	push	ax
	push	WORD PTR [bp+6]
	push	WORD PTR [bp+4]	;xval
	call	_StartASmoke
	add	sp,14
; Line 1169
	push	WORD PTR [bp-12]	;cnt
	call	_GetGTRadarNum
	add	sp,2
	cmp	ax,-999
	je	$I1865
; Line 1170
	mov	bx,ax
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	or	BYTE PTR _Rdrs[bx+6],128
; Line 1172
$I1865:
	cmp	WORD PTR [bp+14],-1	;cruise
	jg	$JCC7303
	jmp	$I1866
$JCC7303:
; Line 1173
	mov	ax,2
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+14]	;cruise
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	mov	ax,46
	imul	WORD PTR [bp+14]	;cruise
	mov	bx,ax
	push	WORD PTR _bv[bx+6]
	mov	ax,1
	push	ax
	mov	bx,WORD PTR [bp-12]	;cnt
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	push	WORD PTR _gt[bx+6]
	push	WORD PTR _gt[bx+4]
	push	WORD PTR _gt[bx+2]
	push	WORD PTR _gt[bx]
	push	WORD PTR _gt[bx+8]
	mov	ax,23
	jmp	$L20058
	nop	
$FB1861:
; Line 1185
	mov	ax,WORD PTR [bp-18]	;TargetHit
; Line 1186
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_CheckBlastArea	ENDP
_TEXT	ENDS
END
