;	Static Name Aliases
;
;	$S1338_i	EQU	i
	TITLE   C:\PLANES2.C
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
EXTRN	_GetWayPointChanges:NEAR
EXTRN	_AirKill:NEAR
EXTRN	_ActivatePlane:NEAR
EXTRN	_CheckAIBombs:NEAR
EXTRN	_DoNextWayPt:NEAR
EXTRN	_itoa:NEAR
EXTRN	_Isin:NEAR
EXTRN	_sinX:NEAR
EXTRN	_TrgMul:NEAR
EXTRN	_cosX:NEAR
EXTRN	_Icos:NEAR
EXTRN	_AIBombTarget:NEAR
EXTRN	_GetAltPitch:NEAR
EXTRN	_GetWayXYZ:NEAR
EXTRN	_CheckAIMissiles:NEAR
EXTRN	_EngageTrain:NEAR
EXTRN	_GetEnemyTarget:NEAR
EXTRN	_rng2:NEAR
EXTRN	_FormationBoat:NEAR
EXTRN	_FindEmptyMissileSlot2:NEAR
EXTRN	_TurnAIPlaneBy:NEAR
EXTRN	_Ready5:NEAR
EXTRN	_firemissile2:NEAR
EXTRN	_JustPutHere:NEAR
EXTRN	_GetTargADP:NEAR
EXTRN	_StartASmoke:NEAR
EXTRN	_GetPlanePtr:NEAR
EXTRN	_Dist2D:NEAR
EXTRN	_Speech:NEAR
EXTRN	_dropdecoy:NEAR
EXTRN	_GetMissilePtr:NEAR
EXTRN	_ImNotaFighter:NEAR
EXTRN	_SetUpLaunch:NEAR
EXTRN	_DoAltHover:NEAR
EXTRN	_ReturnBaseInfo:NEAR
EXTRN	_CheckDetection:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_LogIt:NEAR
EXTRN	_AIRadarForwardCheck:NEAR
EXTRN	_xydist:NEAR
EXTRN	_strcat:NEAR
EXTRN	_LetWingmenContinue:NEAR
EXTRN	_Message:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_SARWait:NEAR
EXTRN	__fstrcpy:NEAR
EXTRN	_GetDAltSpeed:NEAR
EXTRN	_LocationPicture:NEAR
EXTRN	_AICarrierLand:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_CheckE2C:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	__aNlmul:NEAR
EXTRN	_LaunchCruise:NEAR
EXTRN	_IsBoat:NEAR
EXTRN	_FlyCruise:NEAR
EXTRN	_GetWingName:NEAR
EXTRN	__aNNalshr:NEAR
EXTRN	_FriendStatus:NEAR
EXTRN	_CheckPlaneLand:NEAR
EXTRN	_StraightAttack:NEAR
EXTRN	_GetPlaneLanding:NEAR
EXTRN	_GetLastPosition:NEAR
EXTRN	_FriendMatch:NEAR
EXTRN	_FlyWPFollowPlayer:NEAR
EXTRN	_gotcha:NEAR
EXTRN	_Ladder:NEAR
EXTRN	_GorillaCover:NEAR
EXTRN	_FriendMatchType:NEAR
EXTRN	_CheckAnyEnemyLock:NEAR
EXTRN	_Box:NEAR
EXTRN	__aNNalshl:NEAR
EXTRN	_ARCTAN:NEAR
EXTRN	_Wall:NEAR
EXTRN	_FormationSpeedAdjustBoat:NEAR
EXTRN	_FreeFighter:NEAR
EXTRN	_abs:NEAR
EXTRN	_ChangeGroupBehavior:NEAR
EXTRN	_SARCAP1:NEAR
EXTRN	_DoGroupAction:NEAR
EXTRN	_Immelmann:NEAR
EXTRN	_SplitS:NEAR
EXTRN	_AIBOMBX:DWORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_AIBOMBY:DWORD
EXTRN	_Txt:BYTE
EXTRN	_aipaths:BYTE
EXTRN	_aiwaypoints:BYTE
EXTRN	_Night:WORD
EXTRN	_PlanesLaunched:WORD
EXTRN	_targetplayer:WORD
EXTRN	_timetargetplayer:WORD
EXTRN	_Gtime:WORD
EXTRN	_whichourcarr:WORD
EXTRN	_Direction:WORD
EXTRN	_ss:BYTE
_BSS      SEGMENT
COMM NEAR	_whichdefensethreat:	 2:	 70
_BSS      ENDS
EXTRN	_ptype:DWORD
EXTRN	_LOCKED:WORD
EXTRN	_ConfigData:BYTE
EXTRN	_Px:WORD
EXTRN	_NRADAR:WORD
EXTRN	_Py:WORD
EXTRN	_OurHead:WORD
EXTRN	_NPLANES:WORD
EXTRN	_Rdrs:BYTE
EXTRN	_OurRoll:WORD
EXTRN	_OurPitch:WORD
EXTRN	_ps:BYTE
EXTRN	_Knots:WORD
EXTRN	_Alt:WORD
EXTRN	_bv:BYTE
EXTRN	_ORDNANCE:BYTE
EXTRN	_ailoc:BYTE
EXTRN	_Rtime:WORD
EXTRN	_LASTPLANE:WORD
EXTRN	_GLowDroll:WORD
EXTRN	_landingstatus:WORD
EXTRN	_planecnt:WORD
EXTRN	_tempgotcha:WORD
EXTRN	_pdest:WORD
EXTRN	_droll:WORD
EXTRN	_tempvar:WORD
_DATA      SEGMENT
$SG1567	DB	'Engaging Rear Bogey ',  00H
$SG1637	DB	' ',  00H
$SG1638	DB	' Speed ',  00H
$SG1639	DB	' prespeed ',  00H
$SG1640	DB	', tdist ',  00H
$SG1641	DB	', ra ',  00H
$SG1642	DB	', PE ',  00H
$SG2005	DB	'Dropping Flare',  00H
$SG2013	DB	'Dropping Chaff',  00H
$SG2072	DB	'I''m Hit, Radar Out!',  00H
$SG2075	DB	'I''m Hit, Engine Damaged!',  00H
$SG2078	DB	'I''m Hit, Control Surfaces Damaged!',  00H
$SG2080	DB	'I''m Hit, Missiles Out',  00H
$SG2082	DB	' ',  00H
$SG2119	DB	'none',  00H
$SG2121	DB	'unknown',  00H
$SG2126	DB	'none',  00H
$SG2138	DB	'locked',  00H
$SG2157	DB	'Left',  00H
$SG2159	DB	'Right',  00H
$SG2164	DB	'Lead',  00H
$SG2166	DB	'Trail',  00H
$SG2173	DB	'Left ',  00H
$SG2175	DB	'Right ',  00H
$SG2178	DB	'Lead',  00H
$SG2180	DB	'Trail',  00H
$SG2183	DB	'Left ',  00H
$SG2185	DB	'Right ',  00H
$SG2187	DB	'Lead',  00H
$SG2189	DB	'Trail',  00H
$SG2192	DB	'Left ',  00H
$SG2195	DB	'Left ',  00H
$SG2198	DB	'Right ',  00H
$SG2201	DB	'Right ',  00H
$SG2203	DB	'Lead',  00H
$SG2205	DB	'Trail',  00H
$SG2206	DB	'?',  00H
$SG2264	DB	'Going Cold',  00H
$SG2366	DB	'Going Hot',  00H
$SG2399	DB	'Going Cold',  00H
$SG2418	DB	'(Bandit)Unidentified Aircraft Turn Back Now!!!',  00H
$SG2487	DB	'FT ',  00H
$SG2488	DB	' d ',  00H
$SG2755	DB	'Engaged Defensive',  00H
$SG2906	DB	'%d Sin Goof d %ld, a %x',  00H
$SG2917	DB	'%d Cos Goof d %ld, a %x',  00H
_DATA      ENDS
_BSS      SEGMENT
$S1338_i	DW 01H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 7
; Line 8
; Line 9
; Line 10
; Line 11
; Line 19
; Line 12
; Line 14
; Line 15
; Line 17
; Line 18
; Line 19
; Line 20
; Line 21
; Line 22
; Line 23
; Line 108
	PUBLIC	_SetUpWingman
_SetUpWingman	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,26
	call	__aNchkstk
	push	si
;	cnt = -10
;	numflight = -24
;	lastleader = -8
;	wingspace = -6
;	whichbehave = -22
;	radaron = -12
;	enemynofire = -4
;	lastsec = -26
;	updatecnt = -14
;	imaboat = -20
;	startval = -2
;	endval = -18
;	wingdist = -16
;	planeid = 10
;	numadd = 8
;	b = 6
;	leadnum = 4
; Line 118
	sub	ax,ax
	mov	WORD PTR [bp-12],ax	;radaron
	mov	WORD PTR [bp-4],ax	;enemynofire
	mov	WORD PTR [bp-14],ax	;updatecnt
	mov	WORD PTR [bp-20],ax	;imaboat
; Line 121
	mov	ax,1
	mov	WORD PTR [bp-24],ax	;numflight
	mov	WORD PTR [bp-16],ax	;wingdist
; Line 123
	mov	ax,WORD PTR [bp+4]	;leadnum
	mov	WORD PTR [bp-8],ax	;lastleader
; Line 124
	mov	WORD PTR [bp-26],ax	;lastsec
; Line 126
	mov	cx,46
	imul	cx
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],1
	je	$I1389
; Line 127
	mov	WORD PTR [bp-12],1	;radaron
; Line 128
$I1389:
	mov	ax,cx
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	je	$I1390
; Line 129
	mov	WORD PTR [bp-4],1	;enemynofire
; Line 131
$I1390:
	mov	ax,WORD PTR _NPLANES
	sub	ax,WORD PTR [bp+4]	;leadnum
	dec	ax
	jne	$I1391
; Line 132
	mov	WORD PTR [bp-14],1	;updatecnt
; Line 134
$I1391:
	push	WORD PTR [bp+10]	;planeid
	call	_IsBoat
	add	sp,2
	or	ax,ax
	je	$I1392
; Line 135
	mov	WORD PTR [bp-20],1	;imaboat
; Line 136
	mov	ax,WORD PTR _LASTPLANE
	sub	ax,WORD PTR [bp+8]	;numadd
	mov	WORD PTR [bp-2],ax	;startval
; Line 137
	mov	WORD PTR [bp-18],70	;endval
; Line 138
	mov	WORD PTR [bp-16],10	;wingdist
; Line 139
; Line 140
	jmp	SHORT $I1393
	nop	
$I1392:
; Line 141
	mov	ax,WORD PTR [bp+4]	;leadnum
	inc	ax
	mov	WORD PTR [bp-2],ax	;startval
; Line 142
	mov	ax,WORD PTR [bp+8]	;numadd
	add	ax,WORD PTR [bp+4]	;leadnum
	inc	ax
	mov	WORD PTR [bp-18],ax	;endval
; Line 143
$I1393:
; Line 145
	mov	ax,46
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _StraightAttack
	jne	$I1401
; Line 147
	mov	ax,WORD PTR [bp+6]	;b
	mov	cx,4
	cwd	
	idiv	cx
	or	dx,dx
	jne	$I1395
; Line 148
	mov	WORD PTR _bv[bx],OFFSET _Box
; Line 149
; Line 150
	jmp	SHORT $I1401
$I1395:
	cmp	dx,1
	jne	$I1397
; Line 151
	mov	ax,46
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Ladder
; Line 152
; Line 153
	jmp	SHORT $I1401
	nop	
$I1397:
	cmp	dx,2
	jne	$I1399
; Line 154
	mov	ax,46
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Wall
; Line 155
; Line 156
	jmp	SHORT $I1401
	nop	
$I1399:
	cmp	dx,3
	jne	$I1401
; Line 157
	mov	ax,46
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 158
; Line 159
$I1401:
; Line 169
	cmp	WORD PTR _Direction,1
	jne	$L20001
	mov	ax,WORD PTR [bp-16]	;wingdist
	jmp	SHORT $L20002
	nop	
$L20001:
	mov	ax,WORD PTR [bp-16]	;wingdist
	neg	ax
$L20002:
	mov	WORD PTR [bp-6],ax	;wingspace
; Line 170
	mov	ax,WORD PTR [bp-2]	;startval
	mov	WORD PTR [bp-10],ax	;cnt
	jmp	$F1402
	nop	
$I1407:
; Line 181
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	and	BYTE PTR _ps[bx+25],251
$I1408:
; Line 183
	mov	ax,40
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],1
	je	$I1409
; Line 184
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	or	BYTE PTR _ps[bx+25],1
; Line 185
	jmp	SHORT $I1410
	nop	
$I1409:
; Line 186
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	and	BYTE PTR _ps[bx+25],254
$I1410:
; Line 188
	mov	ax,40
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],8
	je	$I1411
; Line 189
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	or	BYTE PTR _ps[bx+25],8
; Line 190
	jmp	SHORT $I1412
	nop	
$I1411:
; Line 191
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	and	BYTE PTR _ps[bx+25],247
$I1412:
; Line 193
	push	WORD PTR [bp+10]	;planeid
	push	WORD PTR [bp+6]	;b
	push	WORD PTR [bp-10]	;cnt
	call	_ActivatePlane
	add	sp,6
; Line 194
	mov	ax,46
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],cx
; Line 195
	cmp	WORD PTR [bp-12],0	;radaron
	je	$I1414
; Line 196
	or	BYTE PTR _bv[bx+21],1
; Line 197
	jmp	SHORT $I1415
	nop	
$I1414:
; Line 198
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],254
$I1415:
; Line 199
	cmp	WORD PTR [bp-4],0	;enemynofire
	je	$I1416
; Line 200
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],2
; Line 201
	jmp	SHORT $I1417
$I1416:
; Line 202
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	and	WORD PTR _bv[bx+20],512
$I1417:
; Line 204
	mov	ax,46
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],128
	je	$I1418
; Line 205
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],128
; Line 206
; Line 208
$I1418:
	mov	ax,40
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	cmp	WORD PTR _ps[bx+34],0
	jne	$I1419
; Line 209
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	mov	WORD PTR _ps[bx+34],0
; Line 210
$I1419:
	mov	ax,40
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	cmp	WORD PTR _ps[bx+36],0
	jne	$I1420
; Line 211
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	mov	WORD PTR _ps[bx+36],0
; Line 212
$I1420:
	test	BYTE PTR [bp-24],1	;numflight
	jne	$I1421
; Line 213
	mov	ax,46
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	si,ax
	mov	WORD PTR _bv[si],cx
; Line 214
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR _bv[si+10],ax
; Line 216
	mov	ax,46
	imul	WORD PTR [bp-26]	;lastsec
	mov	bx,ax
	mov	ax,WORD PTR [bp-10]	;cnt
	mov	WORD PTR _bv[bx+8],ax
; Line 217
	mov	cx,WORD PTR [bp-26]	;lastsec
	mov	WORD PTR _bv[si+6],cx
; Line 218
	mov	WORD PTR _bv[si+2],-999
; Line 219
	mov	WORD PTR [bp-8],ax	;lastleader
; Line 220
	mov	WORD PTR [bp-26],ax	;lastsec
; Line 221
; Line 222
	jmp	SHORT $I1422
$I1421:
; Line 224
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-8]	;lastleader
	mov	WORD PTR _bv[bx+2],ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR [bp-10]	;cnt
	mov	WORD PTR _bv[bx+4],ax
; Line 225
	mov	WORD PTR [bp-8],ax	;lastleader
; Line 226
$I1422:
; Line 228
	mov	ax,40
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	si,ax
	mov	WORD PTR _ps[si+2],cx
; Line 229
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
	mov	WORD PTR _ps[si+8],ax
	mov	WORD PTR _ps[si+10],dx
; Line 230
	cmp	WORD PTR _ps[bx+10],-1
	jg	$I1423
	jl	$L20003
	cmp	WORD PTR _ps[bx+8],-1
	ja	$I1423
$L20003:
; Line 231
	mov	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR _ps[si+4],ax
; Line 232
	mov	ax,WORD PTR _ps[bx+12]
	mov	dx,WORD PTR _ps[bx+14]
	mov	WORD PTR _ps[si+12],ax
	mov	WORD PTR _ps[si+14],dx
; Line 233
; Line 234
	jmp	SHORT $I1424
$I1423:
; Line 236
	mov	ax,40
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	mov	ax,WORD PTR [bp-6]	;wingspace
	imul	WORD PTR [bp-24]	;numflight
	add	ax,WORD PTR _ps[bx+4]
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	mov	WORD PTR _ps[bx+4],cx
	sub	ax,ax
	shl	cx,1
	rcl	ax,1
	shl	cx,1
	rcl	ax,1
	shl	cx,1
	rcl	ax,1
	shl	cx,1
	rcl	ax,1
	shl	cx,1
	rcl	ax,1
	mov	WORD PTR _ps[bx+12],cx
	mov	WORD PTR _ps[bx+14],ax
; Line 237
$I1424:
; Line 238
	mov	ax,40
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	si,ax
	mov	WORD PTR _ps[si+16],cx
; Line 239
	mov	ax,WORD PTR _ps[bx+26]
	mov	WORD PTR _ps[si+26],ax
; Line 240
	mov	ax,46
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	si,ax
	mov	WORD PTR _bv[si+18],cx
; Line 241
	mov	ax,WORD PTR [bp-24]	;numflight
	inc	ax
	add	WORD PTR _bv[si+20],ax
; Line 242
	mov	al,BYTE PTR _bv[bx+12]
	mov	BYTE PTR _bv[si+12],al
; Line 243
	mov	ax,WORD PTR _bv[bx+14]
	mov	WORD PTR _bv[si+14],ax
; Line 244
	mov	ax,WORD PTR _bv[bx+30]
	mov	dx,WORD PTR _bv[bx+32]
	mov	WORD PTR _bv[si+30],ax
	mov	WORD PTR _bv[si+32],dx
; Line 245
	mov	ax,WORD PTR _bv[bx+34]
	mov	dx,WORD PTR _bv[bx+36]
	mov	WORD PTR _bv[si+34],ax
	mov	WORD PTR _bv[si+36],dx
; Line 247
	mov	ax,WORD PTR _bv[bx+28]
	mov	WORD PTR _bv[si+28],ax
; Line 248
	mov	ax,WORD PTR _bv[bx+38]
	mov	WORD PTR _bv[si+38],ax
; Line 249
	test	BYTE PTR _bv[bx+21],64
	je	$I1425
; Line 250
	or	BYTE PTR _bv[si+21],64
; Line 251
; Line 252
	jmp	SHORT $I1426
$I1425:
; Line 253
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],191
; Line 254
$I1426:
; Line 256
	mov	ax,40
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	si,ax
	mov	WORD PTR _ps[si+6],cx
; Line 257
	test	BYTE PTR _ps[bx+25],128
	jne	$I1427
; Line 258
	and	BYTE PTR _ps[si+25],127
; Line 259
	cmp	WORD PTR _ps[si+10],-1
	jl	$I1428
	jg	$L20004
	cmp	WORD PTR _ps[si+8],-1
	jbe	$I1428
$L20004:
; Line 261
	mov	ax,WORD PTR [bp-6]	;wingspace
	imul	WORD PTR [bp-24]	;numflight
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	add	WORD PTR _ps[si+4],ax
	mov	ax,WORD PTR _ps[si+4]
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
	mov	WORD PTR _ps[si+12],ax
	mov	WORD PTR _ps[si+14],dx
; Line 262
; Line 263
	jmp	SHORT $I1429
	nop	
$I1428:
; Line 264
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-10]	;cnt
	sub	ax,WORD PTR [bp+4]	;leadnum
	mov	cx,20
	imul	cx
	add	WORD PTR _ps[bx+6],ax
; Line 265
$I1429:
; Line 266
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	mov	WORD PTR _bv[bx+22],0
; Line 267
	cmp	WORD PTR _bv[bx+18],0
	jne	$I1431
	jmp	SHORT $L20024
$I1427:
; Line 271
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-24]	;numflight
	shl	ax,1
	shl	ax,1
	add	ax,WORD PTR _Gtime
	mov	WORD PTR _bv[bx+22],ax
; Line 272
$L20024:
	mov	WORD PTR _bv[bx+18],1
; Line 273
$I1431:
; Line 275
	mov	ax,46
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+44]
	add	al,BYTE PTR [bp-24]	;numflight
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	si,ax
	mov	BYTE PTR _bv[si+44],cl
; Line 276
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	jne	$I1432
; Line 277
	mov	WORD PTR _bv[si],OFFSET _Ready5
; Line 278
	push	WORD PTR _bv[si+14]
	jmp	SHORT $L20025
$I1432:
	mov	ax,40
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],128
	je	$I1434
; Line 282
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	push	WORD PTR _bv[bx+14]
$L20025:
	push	WORD PTR [bp-10]	;cnt
	call	_SetUpLaunch
	add	sp,4
; Line 283
; Line 285
$I1434:
; Line 286
	inc	WORD PTR [bp-24]	;numflight
	mov	ax,WORD PTR [bp+8]	;numadd
	cmp	WORD PTR [bp-24],ax	;numflight
	jg	$FB1404
; Line 288
	inc	WORD PTR [bp-10]	;cnt
$F1402:
	mov	ax,WORD PTR [bp-18]	;endval
	cmp	WORD PTR [bp-10],ax	;cnt
	jge	$FB1404
; Line 171
	inc	WORD PTR _PlanesLaunched
; Line 172
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-10],ax	;cnt
	jl	$I1405
	cmp	WORD PTR [bp-14],0	;updatecnt
	je	$I1405
; Line 173
	mov	ax,WORD PTR [bp-10]	;cnt
	inc	ax
	mov	WORD PTR _NPLANES,ax
; Line 175
$I1405:
	cmp	WORD PTR [bp-20],0	;imaboat
	je	$I1406
	mov	ax,WORD PTR _LASTPLANE
	cmp	WORD PTR [bp-10],ax	;cnt
	jge	$I1406
; Line 176
	mov	ax,WORD PTR [bp-10]	;cnt
	mov	WORD PTR _LASTPLANE,ax
; Line 178
$I1406:
	mov	ax,40
	imul	WORD PTR [bp+4]	;leadnum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],4
	jne	$JCC1334
	jmp	$I1407
$JCC1334:
; Line 179
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	or	BYTE PTR _ps[bx+25],4
; Line 180
	jmp	$I1408
	nop	
$FB1404:
; Line 289
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_SetUpWingman	ENDP
; Line 292
	PUBLIC	_UpdateWing
_UpdateWing	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	bvl = -2
; Line 296
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],0
	jge	$JCC1390
	jmp	$I1439
$JCC1390:
; Line 297
	mov	ax,40
	imul	WORD PTR _bv[bx+2]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,32
	jne	$I1441
	test	cl,1
	je	$I1441
	test	cl,2
	je	$JCC1422
	jmp	$I1439
$JCC1422:
$I1441:
; Line 307
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+2]
	mov	WORD PTR [bp-2],ax	;bvl
	mov	cx,46
	imul	cx
	mov	si,ax
	mov	ax,WORD PTR _bv[si+2]
	mov	WORD PTR _bv[bx+2],ax
; Line 308
	mov	ax,cx
	imul	WORD PTR [bp-2]	;bvl
	mov	si,ax
	mov	ax,WORD PTR _bv[si+6]
	mov	WORD PTR _bv[bx+6],ax
; Line 309
	mov	ax,WORD PTR _bv[si+8]
	mov	WORD PTR _bv[bx+8],ax
; Line 310
	cmp	WORD PTR _bv[bx+6],0
	jl	$I1442
; Line 311
	mov	ax,cx
	imul	WORD PTR _bv[bx+6]
	mov	bx,ax
	mov	ax,WORD PTR $S1338_i
	mov	WORD PTR _bv[bx+8],ax
; Line 312
$I1442:
	mov	ax,cx
	imul	WORD PTR [bp-2]	;bvl
	mov	bx,ax
	cmp	WORD PTR _bv[bx+8],0
	jl	$I1443
; Line 313
	mov	ax,cx
	imul	WORD PTR _bv[bx+8]
	mov	bx,ax
	mov	ax,WORD PTR $S1338_i
	mov	WORD PTR _bv[bx+6],ax
; Line 314
$I1443:
	mov	ax,cx
	imul	WORD PTR [bp-2]	;bvl
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+20]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	si,ax
	mov	WORD PTR _bv[si+20],cx
; Line 315
	mov	WORD PTR _bv[bx+20],0
; Line 317
	mov	ax,-999
	mov	WORD PTR _bv[bx+4],ax
	mov	WORD PTR _bv[bx+2],ax
; Line 319
$L20026:
	mov	ax,-999
	mov	WORD PTR _bv[bx+6],ax
	mov	WORD PTR _bv[bx+8],ax
; Line 320
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 342
; Line 343
	nop	
$I1439:
; Line 344
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+4],0
	jl	$I1448
; Line 345
	mov	ax,40
	imul	WORD PTR _bv[bx+4]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,32
	jne	$I1447
	test	cl,1
	je	$I1447
	test	cl,2
	jne	$I1448
$I1447:
; Line 353
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,46
	imul	WORD PTR _bv[bx+4]
	mov	si,ax
	mov	WORD PTR _bv[si+2],-999
; Line 355
	mov	ax,46
	imul	WORD PTR _bv[bx+4]
	mov	si,ax
	mov	ax,WORD PTR _bv[si+4]
	mov	WORD PTR _bv[bx+4],ax
	or	ax,ax
	jl	$I1448
; Line 356
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR $S1338_i
	mov	WORD PTR _bv[bx+2],ax
; Line 357
$I1448:
; Line 358
; Line 359
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+6],0
	jl	$I1450
	mov	ax,46
	imul	WORD PTR _bv[bx+6]
	mov	si,ax
	cmp	WORD PTR _bv[si+4],0
	jge	$I1450
; Line 360
	mov	ax,40
	imul	WORD PTR _bv[bx+6]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,32
	jne	$I1452
	test	cl,1
	je	$I1452
	test	cl,2
	jne	$I1450
$I1452:
; Line 371
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+6]
	mov	WORD PTR [bp-2],ax	;bvl
	mov	cx,46
	imul	cx
	mov	si,ax
	mov	ax,WORD PTR _bv[si+6]
	mov	WORD PTR _bv[bx+6],ax
	or	ax,ax
	jl	$I1453
; Line 372
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR $S1338_i
	mov	WORD PTR _bv[bx+8],ax
; Line 373
$I1453:
	mov	ax,cx
	imul	WORD PTR [bp-2]	;bvl
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+20]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	si,ax
	mov	WORD PTR _bv[si+20],cx
	jmp	$L20026
; Line 377
; Line 378
	nop	
	nop	
$I1450:
; Line 379
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+8],0
	jl	$I1458
	mov	ax,46
	imul	WORD PTR _bv[bx+8]
	mov	si,ax
	cmp	WORD PTR _bv[si+4],0
	jge	$I1458
; Line 380
	mov	ax,40
	imul	WORD PTR _bv[bx+8]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,32
	jne	$I1457
	test	cl,1
	je	$I1457
	test	cl,2
	jne	$I1458
$I1457:
; Line 388
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,46
	imul	WORD PTR _bv[bx+8]
	mov	si,ax
	mov	WORD PTR _bv[si+6],-999
; Line 390
	mov	ax,46
	imul	WORD PTR _bv[bx+8]
	mov	si,ax
	mov	ax,WORD PTR _bv[si+8]
	mov	WORD PTR _bv[bx+8],ax
	or	ax,ax
	jl	$I1458
; Line 391
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR $S1338_i
	mov	WORD PTR _bv[bx+6],ax
; Line 392
$I1458:
; Line 393
; Line 394
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_UpdateWing	ENDP
; Line 397
	PUBLIC	_GetSquadLeader
_GetSquadLeader	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	prewing = -2
;	planenum = 4
; Line 401
	mov	ax,1
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_GetLeaderCore
	add	sp,4
	mov	cx,46
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	je	$I1463
	cmp	WORD PTR _bv[bx+6],-1
	jne	$I1462
$I1463:
; Line 403
	mov	ax,-1
; Line 404
; Line 405
$I1462:
	mov	sp,bp
	pop	bp
	ret	

_GetSquadLeader	ENDP
; Line 418
	PUBLIC	_GetBehaviorLeader
_GetBehaviorLeader	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	planenum = 4
; Line 419
	sub	ax,ax
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_GetLeaderCore
; Line 420
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetBehaviorLeader	ENDP
; Line 423
	PUBLIC	_GetLeaderCore
_GetLeaderCore	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	si
;	prewing = -4
;	iamdone = -6
;	otherplane = -2
;	nobehave = 6
;	planenum = 4
; Line 428
	cmp	WORD PTR [bp+4],-1	;planenum
	jne	$I1472
; Line 429
	mov	ax,-1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 431
$I1472:
; Line 433
	mov	ax,WORD PTR [bp+4]	;planenum
	mov	WORD PTR [bp-4],ax	;prewing
	mov	cx,46
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jle	$I1482
; Line 434
	mov	ax,WORD PTR _bv[bx+2]
	mov	WORD PTR [bp-2],ax	;otherplane
; Line 435
	imul	cx
	mov	si,ax
	mov	ax,WORD PTR _bv[bx]
	cmp	WORD PTR _bv[si],ax
	je	$I1475
	cmp	WORD PTR [bp+6],0	;nobehave
	jne	$JCC2101
	jmp	$I1479
$JCC2101:
$I1475:
; Line 436
	mov	WORD PTR [bp-6],0	;iamdone
; Line 437
	mov	ax,WORD PTR [bp-2]	;otherplane
$L20028:
	mov	WORD PTR [bp-4],ax	;prewing
; Line 438
	mov	ax,46
	imul	WORD PTR [bp-4]	;prewing
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jle	$I1482
	cmp	WORD PTR [bp-6],0	;iamdone
	jne	$I1482
; Line 439
	mov	ax,WORD PTR _bv[bx+2]
	mov	WORD PTR [bp-2],ax	;otherplane
; Line 440
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx]
	mov	bx,46
	mov	dx,ax
	mov	ax,cx
	mov	cx,dx
	imul	bx
	mov	bx,ax
	cmp	WORD PTR _bv[bx],cx
	je	$I1480
	cmp	WORD PTR [bp+6],0	;nobehave
	jne	$JCC2182
	jmp	$I1479
$JCC2182:
$I1480:
; Line 441
	mov	ax,46
	imul	WORD PTR [bp-4]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+2]
	jmp	SHORT $L20028
; Line 445
; Line 446
	nop	
$I1482:
; Line 448
; Line 449
	mov	ax,46
	imul	WORD PTR [bp-4]	;prewing
	mov	bx,ax
	cmp	WORD PTR _bv[bx+6],-1
	jg	$JCC2215
	jmp	$I1483
$JCC2215:
; Line 450
	mov	ax,WORD PTR _bv[bx+6]
	mov	WORD PTR [bp-2],ax	;otherplane
; Line 451
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx]
	mov	bx,46
	mov	dx,ax
	mov	ax,cx
	mov	cx,dx
	imul	bx
	mov	bx,ax
	cmp	WORD PTR _bv[bx],cx
	je	$I1485
	cmp	WORD PTR [bp+6],0	;nobehave
	je	$I1479
$I1485:
; Line 452
	mov	WORD PTR [bp-6],0	;iamdone
; Line 453
	mov	ax,WORD PTR [bp-2]	;otherplane
$L20029:
	mov	WORD PTR [bp-4],ax	;prewing
; Line 454
	mov	ax,46
	imul	WORD PTR [bp-4]	;prewing
	mov	bx,ax
	cmp	WORD PTR _bv[bx+6],-1
	jle	$I1479
	cmp	WORD PTR [bp-6],0	;iamdone
	jne	$I1479
; Line 455
	mov	ax,WORD PTR _bv[bx+6]
	mov	WORD PTR [bp-2],ax	;otherplane
; Line 456
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx]
	mov	bx,46
	mov	dx,ax
	mov	ax,cx
	mov	cx,dx
	imul	bx
	mov	bx,ax
	cmp	WORD PTR _bv[bx],cx
	je	$I1490
	cmp	WORD PTR [bp+6],0	;nobehave
	je	$I1479
$I1490:
; Line 457
	mov	ax,46
	imul	WORD PTR [bp-4]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+6]
	jmp	SHORT $L20029
$I1479:
; Line 443
	mov	ax,WORD PTR [bp-2]	;otherplane
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I1483:
	mov	ax,WORD PTR [bp-4]	;prewing
; Line 466
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_GetLeaderCore	ENDP
; Line 469
	PUBLIC	_CloseInFight
_CloseInFight	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	ranglel = -2
;	rranglel = -4
;	leadernum = 8
;	wingnum = 6
;	tanglel = 4
; Line 474
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;tanglel
	sub	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-2],ax	;ranglel
; Line 476
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I1499
; Line 477
	mov	ax,WORD PTR [bp+4]	;tanglel
	sub	ax,WORD PTR _OurHead
	jmp	SHORT $L20030
$I1499:
; Line 480
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,cx
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;tanglel
	sub	ax,WORD PTR _ps[bx+16]
$L20030:
	add	ah,128
	mov	WORD PTR [bp-4],ax	;rranglel
; Line 481
; Line 483
	push	WORD PTR $S1338_i
	call	_CheckDetection
	add	sp,2
	cmp	ax,-999
	je	$I1501
; Line 484
; Line 485
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Jink2
	jmp	SHORT $L20033
$I1501:
	push	WORD PTR [bp-2]	;ranglel
	call	_abs
	add	sp,2
	cmp	ax,20480
	jle	$I1507
	push	WORD PTR [bp-4]	;rranglel
	call	_abs
	add	sp,2
	cmp	ax,10240
	jge	$I1507
; Line 498
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Jink
; Line 499
; Line 500
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I1507:
; Line 501
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _StraightAttack
	je	$JCC2557
	jmp	$I1509
$JCC2557:
; Line 502
	push	WORD PTR [bp-2]	;ranglel
	call	_abs
	add	sp,2
	cmp	ax,8192
	jle	$I1510
; Line 503
$L20033:
	cmp	WORD PTR [bp+6],-1	;wingnum
	jle	$I1512
; Line 504
	mov	ax,46
	imul	WORD PTR [bp+6]	;wingnum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FreeFighter
	jne	$I1512
; Line 510
	mov	WORD PTR _bv[bx],OFFSET _StraightAttack
; Line 511
; Line 512
$I1512:
; Line 513
	cmp	WORD PTR [bp+8],-1	;leadernum
	jg	$JCC2608
	jmp	$I1528
$JCC2608:
; Line 514
	mov	ax,46
	imul	WORD PTR [bp+8]	;leadernum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FreeFighter
	je	$JCC2627
	jmp	$I1528
$JCC2627:
	jmp	$L20031
	nop	
$I1510:
	push	WORD PTR [bp-2]	;ranglel
	call	_abs
	add	sp,2
	cmp	ax,8192
	jle	$JCC2648
	jmp	$I1528
$JCC2648:
; Line 525
	cmp	WORD PTR [bp+6],-1	;wingnum
	jle	$I1518
; Line 526
	mov	ax,46
	imul	WORD PTR [bp+6]	;wingnum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _StraightAttack
	jne	$I1518
; Line 532
	mov	WORD PTR _bv[bx],OFFSET _FreeFighter
; Line 533
; Line 534
$I1518:
; Line 535
	cmp	WORD PTR [bp+8],-1	;leadernum
	jg	$JCC2685
	jmp	$I1528
$JCC2685:
; Line 536
	mov	ax,46
	imul	WORD PTR [bp+8]	;leadernum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _StraightAttack
	jne	$I1528
; Line 542
	mov	WORD PTR _bv[bx],OFFSET _FreeFighter
; Line 543
; Line 544
; Line 545
; Line 546
; Line 547
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1509:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FreeFighter
	jne	$I1522
; Line 548
	cmp	WORD PTR [bp+6],-1	;wingnum
	jle	$I1524
; Line 549
	mov	ax,46
	imul	WORD PTR [bp+6]	;wingnum
	mov	si,ax
	cmp	WORD PTR _bv[si],OFFSET _StraightAttack
	jne	$I1524
; Line 550
	mov	ax,WORD PTR _bv[si+10]
	mov	WORD PTR _bv[bx+10],ax
; Line 551
; Line 552
$I1524:
; Line 553
	cmp	WORD PTR [bp+8],-1	;leadernum
	jle	$I1528
; Line 554
	mov	ax,46
	imul	WORD PTR [bp+8]	;leadernum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _StraightAttack
	jne	$I1528
; Line 555
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	si,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR _bv[si+10],ax
; Line 556
; Line 557
; Line 558
; Line 559
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1522:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FreeFighter
	je	$I1528
; Line 560
$L20031:
	mov	WORD PTR _bv[bx],OFFSET _StraightAttack
; Line 561
; Line 562
$I1528:
; Line 563
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_CloseInFight	ENDP
; Line 566
	PUBLIC	_CheckWingmanSix
_CheckWingmanSix	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,40
	call	__aNchkstk
	push	di
	push	si
;	dy = -38
;	founddist = -2
;	targetnum = -14
;	tpitch = -34
;	tangle = -30
;	enemyalt = -40
;	rangle = -22
;	rrangle = -28
;	winghead = -12
;	cnt = -10
;	rangle1 = -26
;	rrangle1 = -32
;	tdist = -16
;	tdist1 = -20
;	tdistnm = -4
;	tdistnm1 = -8
;	returnval = -6
;	x = -18
;	y = -24
;	dx = -36
;	wingnum = 4
; Line 572
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
; Line 574
	cmp	WORD PTR [bp+4],-1	;wingnum
	jne	$I1552
; Line 575
	mov	ax,WORD PTR _Px
	mov	WORD PTR [bp-18],ax	;x
; Line 576
	mov	ax,WORD PTR _Py
	mov	WORD PTR [bp-24],ax	;y
; Line 577
	mov	ax,WORD PTR _OurHead
	jmp	SHORT $L20034
$I1552:
; Line 580
	mov	ax,40
	imul	WORD PTR [bp+4]	;wingnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-18],ax	;x
; Line 581
	mov	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-24],ax	;y
; Line 582
	mov	ax,WORD PTR _ps[bx+16]
$L20034:
	mov	WORD PTR [bp-12],ax	;winghead
; Line 583
; Line 585
	mov	WORD PTR [bp-2],0	;founddist
; Line 586
	mov	WORD PTR [bp-14],-999	;targetnum
; Line 587
	mov	WORD PTR [bp-16],0	;tdist
; Line 588
	mov	ax,1024
	push	ax
	push	WORD PTR _planecnt
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	je	$JCC2938
	jmp	$I1556
$JCC2938:
	mov	ax,WORD PTR _LOCKED
	cmp	WORD PTR [bp+4],ax	;wingnum
	je	$JCC2949
	jmp	$I1556
$JCC2949:
; Line 590
	mov	ax,WORD PTR [bp-24]	;y
	sub	ax,WORD PTR _Py
	mov	WORD PTR [bp-38],ax	;dy
; Line 591
	sub	cx,cx
	push	cx
	lea	cx,WORD PTR [bp-40]	;enemyalt
	push	cx
	lea	cx,WORD PTR [bp-4]	;tdistnm
	push	cx
	lea	dx,WORD PTR [bp-30]	;tangle
	push	dx
	lea	bx,WORD PTR [bp-34]	;tpitch
	push	bx
	lea	bx,WORD PTR [bp-20]	;tdist1
	push	bx
	push	ax
	mov	ax,WORD PTR [bp-18]	;x
	sub	ax,WORD PTR _Px
	mov	WORD PTR [bp-36],ax	;dx
	push	ax
	push	WORD PTR $S1338_i
	call	_GetTargADP
	add	sp,18
; Line 592
	mov	ax,WORD PTR [bp-30]	;tangle
	sub	ax,WORD PTR _OurHead
	mov	WORD PTR [bp-22],ax	;rangle
; Line 593
	mov	cx,WORD PTR [bp-30]	;tangle
	sub	cx,WORD PTR [bp-12]	;winghead
	add	ch,128
	mov	WORD PTR [bp-28],cx	;rrangle
; Line 594
	cmp	WORD PTR [bp-4],8	;tdistnm
	jae	$I1556
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,8192
	jge	$I1556
	push	WORD PTR [bp-28]	;rrangle
	call	_abs
	add	sp,2
	cmp	ax,16384
	jle	$I1556
; Line 595
	mov	WORD PTR [bp-14],-1	;targetnum
; Line 596
	mov	ax,WORD PTR [bp-22]	;rangle
	mov	WORD PTR [bp-26],ax	;rangle1
; Line 597
	mov	ax,WORD PTR [bp-28]	;rrangle
	mov	WORD PTR [bp-32],ax	;rrangle1
; Line 598
	mov	ax,WORD PTR [bp-4]	;tdistnm
	mov	WORD PTR [bp-8],ax	;tdistnm1
; Line 599
	mov	ax,WORD PTR [bp-20]	;tdist1
	mov	WORD PTR [bp-16],ax	;tdist
; Line 600
	mov	WORD PTR [bp-2],1	;founddist
; Line 601
; Line 602
$I1556:
; Line 604
	mov	WORD PTR [bp-10],0	;cnt
	jmp	$F1557
	nop	
$FC1558:
; Line 606
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	jne	$JCC3121
	jmp	$I1562
$JCC3121:
	test	cl,2
	jne	$JCC3129
	jmp	$I1562
$JCC3129:
	test	cx,2080
	je	$JCC3138
	jmp	$I1562
$JCC3138:
	cmp	WORD PTR _ps[bx+26],0
	jne	$JCC3148
	jmp	$I1562
$JCC3148:
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	si,ax
	mov	ax,WORD PTR [bp+4]	;wingnum
	cmp	WORD PTR _bv[si+10],ax
	je	$JCC3168
	jmp	$I1562
$JCC3168:
; Line 607
	push	WORD PTR [bp-10]	;cnt
	push	ax
	mov	si,bx
	call	_FriendMatch
	add	sp,4
	or	ax,ax
	je	$JCC3187
	jmp	$I1562
$JCC3187:
; Line 608
	mov	ax,WORD PTR [bp-18]	;x
	sub	ax,WORD PTR _ps[si+2]
	mov	WORD PTR [bp-36],ax	;dx
; Line 609
	mov	cx,WORD PTR [bp-24]	;y
	sub	cx,WORD PTR _ps[si+4]
	mov	WORD PTR [bp-38],cx	;dy
; Line 610
	sub	dx,dx
	push	dx
	lea	bx,WORD PTR [bp-40]	;enemyalt
	push	bx
	lea	bx,WORD PTR [bp-4]	;tdistnm
	push	bx
	lea	di,WORD PTR [bp-30]	;tangle
	push	di
	lea	dx,WORD PTR [bp-34]	;tpitch
	push	dx
	lea	dx,WORD PTR [bp-20]	;tdist1
	push	dx
	push	cx
	push	ax
	push	WORD PTR $S1338_i
	call	_GetTargADP
	add	sp,18
; Line 611
	mov	ax,WORD PTR [bp-30]	;tangle
	sub	ax,WORD PTR _ps[si+16]
	mov	WORD PTR [bp-22],ax	;rangle
; Line 612
	mov	ax,WORD PTR [bp-30]	;tangle
	sub	ax,WORD PTR [bp-12]	;winghead
	add	ah,128
	mov	WORD PTR [bp-28],ax	;rrangle
; Line 614
	mov	ax,WORD PTR [bp-16]	;tdist
	cmp	WORD PTR [bp-20],ax	;tdist1
	jb	$I1563
	cmp	WORD PTR [bp-4],8	;tdistnm
	jae	$I1562
	cmp	WORD PTR [bp-2],0	;founddist
	jne	$I1562
$I1563:
	push	WORD PTR [bp-22]	;rangle
	call	_abs
	add	sp,2
	cmp	ax,8192
	jge	$I1562
	push	WORD PTR [bp-28]	;rrangle
	call	_abs
	add	sp,2
	cmp	ax,16384
	jle	$I1562
; Line 615
	mov	WORD PTR [bp-2],1	;founddist
; Line 616
	mov	ax,WORD PTR [bp-20]	;tdist1
	mov	WORD PTR [bp-16],ax	;tdist
; Line 617
	mov	ax,WORD PTR [bp-10]	;cnt
	mov	WORD PTR [bp-14],ax	;targetnum
; Line 618
	mov	ax,WORD PTR [bp-22]	;rangle
	mov	WORD PTR [bp-26],ax	;rangle1
; Line 619
	mov	ax,WORD PTR [bp-28]	;rrangle
	mov	WORD PTR [bp-32],ax	;rrangle1
; Line 620
	mov	ax,WORD PTR [bp-4]	;tdistnm
	mov	WORD PTR [bp-8],ax	;tdistnm1
; Line 621
; Line 622
$I1562:
; Line 623
; Line 624
	inc	WORD PTR [bp-10]	;cnt
$F1557:
	mov	ax,WORD PTR [bp-10]	;cnt
	cmp	WORD PTR _NPLANES,ax
	jle	$JCC3362
	jmp	$FC1558
$JCC3362:
; Line 625
	cmp	WORD PTR [bp-2],0	;founddist
	je	$I1564
; Line 627
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],32
	jne	$I1565
	cmp	WORD PTR _bv[bx+2],-1
	jne	$I1565
	mov	ax,WORD PTR [bp-14]	;targetnum
	cmp	WORD PTR _bv[bx+10],ax
	je	$I1565
; Line 628
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR $S1338_i
	call	_GetWingName
	add	sp,4
; Line 629
	mov	ax,OFFSET DGROUP:$SG1567
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 631
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 632
; Line 633
$I1565:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-14]	;targetnum
	mov	WORD PTR _bv[bx+10],ax
; Line 634
	mov	WORD PTR _bv[bx],OFFSET _StraightAttack
; Line 635
	or	BYTE PTR _bv[bx+21],32
; Line 636
	mov	ax,WORD PTR [bp-2]	;founddist
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 637
; Line 640
	nop	
$I1564:
	sub	ax,ax
; Line 641
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_CheckWingmanSix	ENDP
; Line 644
	PUBLIC	_CheckAITarget
_CheckAITarget	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	targetdead = -6
;	orgt = -8
;	preorgt = -2
;	prenewt = -4
;	ainum = 4
; Line 645
	mov	WORD PTR [bp-6],0	;targetdead
; Line 648
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
; Line 650
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR [bp-8],ax	;orgt
; Line 652
	inc	ax
	je	$I1578
; Line 653
	mov	ax,40
	imul	WORD PTR [bp-8]	;orgt
	mov	bx,ax
	test	WORD PTR _ps[bx+24],2080
	jne	$I1577
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I1577
	test	cl,2
	jne	$I1576
$I1577:
; Line 654
	mov	WORD PTR [bp-6],1	;targetdead
; Line 655
; Line 656
$I1576:
	mov	ax,WORD PTR [bp+4]	;ainum
	cmp	WORD PTR [bp-8],ax	;orgt
	jne	$I1578
; Line 657
	mov	WORD PTR [bp-6],1	;targetdead
; Line 658
; Line 659
$I1578:
; Line 661
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _StraightAttack
	je	$I1580
	cmp	WORD PTR [bp-6],0	;targetdead
	jne	$I1580
	test	BYTE PTR _bv[bx+21],2
	jne	$I1583
	mov	ax,1
	push	ax
	push	WORD PTR [bp+4]	;ainum
	call	_ImNotaFighter
	add	sp,4
	or	ax,ax
	je	$I1583
$I1580:
; Line 662
	mov	al,BYTE PTR [bp+4]	;ainum
	xor	al,BYTE PTR _Rtime
	test	al,31
	jne	$I1581
; Line 663
	push	WORD PTR [bp+4]	;ainum
	call	_GetEnemyTarget
	add	sp,2
; Line 664
; Line 665
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1581:
; Line 666
	cmp	WORD PTR [bp-6],0	;targetdead
	je	$I1583
; Line 667
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	WORD PTR _bv[bx+10],-1
; Line 668
	push	WORD PTR [bp+4]	;ainum
	call	_GetEnemyTarget
; Line 669
; Line 670
$I1583:
; Line 671
; Line 695
	mov	sp,bp
	pop	bp
	ret	

_CheckAITarget	ENDP
; Line 698
	PUBLIC	_FormationSpeedAdjustUS
_FormationSpeedAdjustUS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__aNchkstk
	push	si
;	temphead1 = -20
;	temphead2 = -22
;	junkthis = -4
;	oldbasespeed = -24
;	whatmaneuver = -18
;	speed1 = -6
;	speed2 = -8
;	speed3 = -10
;	ppspd = -16
;	tempplane = -14
;	prewing = 10
;	tdist = 8
;	relangle = 6
;	prespeed = 4
; Line 716
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	mov	cx,40
	imul	cx
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_IsBoat
	add	sp,2
	or	ax,ax
	je	$I1599
; Line 717
	push	WORD PTR [bp+10]	;prewing
	push	WORD PTR [bp+8]	;tdist
	push	WORD PTR [bp+6]	;relangle
	push	WORD PTR [bp+4]	;prespeed
	call	_FormationSpeedAdjustBoat
	add	sp,8
; Line 718
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 719
; Line 721
$I1599:
	cmp	WORD PTR [bp+10],-1	;prewing
	je	$I1601
; Line 722
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+22]
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR [bp+10]	;prewing
	mov	bx,ax
	cmp	WORD PTR _ps[bx+22],cx
	je	$I1601
; Line 723
	mov	ax,WORD PTR _ptype
	mov	dx,WORD PTR _ptype+2
	mov	WORD PTR [bp-14],ax	;tempplane
	mov	WORD PTR [bp-12],dx
; Line 724
	push	WORD PTR _ps[bx+22]
	mov	si,bx
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR _ptype,ax
	mov	WORD PTR _ptype+2,dx
; Line 725
	push	WORD PTR _ps[si+6]
	call	_GetDAltSpeed
	add	sp,2
	sub	WORD PTR [bp+4],ax	;prespeed
; Line 726
	mov	ax,WORD PTR [bp-14]	;tempplane
	mov	dx,WORD PTR [bp-12]
	mov	WORD PTR _ptype,ax
	mov	WORD PTR _ptype+2,dx
; Line 727
	push	WORD PTR _ps[si+6]
	call	_GetDAltSpeed
	add	sp,2
	add	WORD PTR [bp+4],ax	;prespeed
; Line 728
; Line 729
$I1601:
; Line 732
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	ax,WORD PTR es:[bx+12]
	mov	WORD PTR [bp-18],ax	;whatmaneuver
; Line 734
	mov	ax,46
	imul	WORD PTR $S1338_i
; Line 735
	push	WORD PTR [bp+6]	;relangle
	call	_abs
	add	sp,2
	cmp	ax,16384
	jg	$I1603
	push	WORD PTR [bp+6]	;relangle
	call	_abs
	add	sp,2
	cmp	ax,8192
	jg	$JCC3909
	jmp	$I1602
$JCC3909:
	cmp	WORD PTR [bp-18],2	;whatmaneuver
	jl	$JCC3918
	jmp	$I1602
$JCC3918:
$I1603:
; Line 736
	cmp	WORD PTR [bp+8],960	;tdist
	jge	$I1604
; Line 737
	cmp	WORD PTR [bp+8],156	;tdist
	jge	$I1605
; Line 738
	cmp	WORD PTR [bp+10],-1	;prewing
	jne	$I1606
; Line 739
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;prespeed
	sub	ax,WORD PTR [bp+8]	;tdist
	sub	ax,44
	jmp	SHORT $L20036
	nop	
$I1606:
; Line 741
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;prespeed
	sub	ax,WORD PTR [bp+8]	;tdist
	sub	ax,4
	jmp	SHORT $L20036
$I1605:
; Line 743
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;prespeed
	sub	ax,160
$L20036:
	mov	WORD PTR _bv[bx+18],ax
; Line 744
	cmp	WORD PTR [bp+6],0	;relangle
	jge	$I1609
; Line 745
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,-6144
$L20040:
	sub	ax,WORD PTR _ps[bx+20]
	mov	WORD PTR _droll,ax
; Line 746
	jmp	SHORT $I1634
$I1609:
; Line 747
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,6144
	jmp	SHORT $L20040
$I1604:
; Line 750
	cmp	WORD PTR [bp+4],400	;prespeed
	jle	$I1612
; Line 751
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;prespeed
	sub	ax,200
	jmp	SHORT $L20038
$I1612:
	cmp	WORD PTR [bp+4],200	;prespeed
	jle	$I1627
; Line 753
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],200
; Line 754
	jmp	SHORT $I1634
$I1627:
; Line 794
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;prespeed
$L20038:
	mov	WORD PTR _bv[bx+18],ax
; Line 795
$I1634:
; Line 796
; Line 808
	cmp	WORD PTR _tempvar,0
	jne	$JCC4113
	jmp	$I1635
$JCC4113:
	cmp	WORD PTR $S1338_i,62
	je	$JCC4123
	jmp	$I1635
$JCC4123:
; Line 809
; Line 810
	mov	ax,OFFSET DGROUP:$SG1637
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 811
	mov	ax,10
	push	ax
	mov	cx,OFFSET DGROUP:_ntmp
	push	cx
	push	WORD PTR $S1338_i
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 812
	mov	ax,OFFSET DGROUP:$SG1638
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 813
	mov	ax,10
	push	ax
	mov	cx,OFFSET DGROUP:_ntmp
	push	cx
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	push	WORD PTR _bv[bx+18]
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 814
	mov	ax,OFFSET DGROUP:$SG1639
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 815
	mov	ax,10
	push	ax
	mov	cx,OFFSET DGROUP:_ntmp
	push	cx
	push	WORD PTR [bp+4]	;prespeed
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 816
	mov	ax,OFFSET DGROUP:$SG1640
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 817
	mov	ax,10
	push	ax
	mov	cx,OFFSET DGROUP:_ntmp
	push	cx
	push	WORD PTR [bp+8]	;tdist
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 818
	mov	ax,OFFSET DGROUP:$SG1641
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 819
	mov	ax,10
	push	ax
	mov	cx,OFFSET DGROUP:_ntmp
	push	cx
	push	WORD PTR [bp+6]	;relangle
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 820
	mov	ax,OFFSET DGROUP:$SG1642
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 821
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	les	bx,DWORD PTR _ptype
	push	WORD PTR es:[bx]
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 822
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 823
; Line 826
$I1635:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+18],150
	jl	$JCC4423
	jmp	$I1646
$JCC4423:
; Line 827
	test	BYTE PTR _bv[bx+21],128
	je	$JCC4433
	jmp	$I1644
$JCC4433:
; Line 828
	mov	WORD PTR _bv[bx+18],150
; Line 829
; Line 830
	jmp	$I1646
	nop	
$I1602:
	cmp	WORD PTR [bp+10],-1	;prewing
	jne	$I1617
; Line 759
	cmp	WORD PTR [bp+8],4	;tdist
	jle	$I1623
; Line 760
	cmp	WORD PTR [bp+8],3200	;tdist
	jle	$I1619
; Line 761
$L20041:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	jmp	$L20038
	nop	
$I1619:
	cmp	WORD PTR [bp+8],1000	;tdist
	jg	$L20042
	cmp	WORD PTR [bp+8],25	;tdist
	jle	$I1623
; Line 768
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;prespeed
	add	ax,5
	jmp	$L20038
	nop	
$I1623:
; Line 771
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp+8]	;tdist
	add	ax,WORD PTR [bp+4]	;prespeed
	sub	ax,45
	jmp	$L20038
	nop	
$I1617:
; Line 779
	cmp	WORD PTR [bp+8],4	;tdist
	jg	$JCC4546
	jmp	$I1627
$JCC4546:
; Line 780
	cmp	WORD PTR [bp+8],3200	;tdist
	jg	$L20041
	cmp	WORD PTR [bp+8],1000	;tdist
	jle	$I1630
; Line 784
$L20042:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;prespeed
	add	ax,200
	jmp	$L20038
	nop	
$I1630:
	cmp	WORD PTR [bp+8],25	;tdist
	jle	$I1632
; Line 787
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;prespeed
	add	ax,25
	jmp	$L20038
$I1632:
; Line 790
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp+8]	;tdist
	add	ax,WORD PTR [bp+4]	;prespeed
	jmp	$L20038
$I1644:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+18],0
	jge	$I1646
; Line 831
	mov	WORD PTR _bv[bx+18],0
; Line 832
; Line 833
$I1646:
; Line 835
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	cmp	WORD PTR _bv[bx+18],ax
	jle	$I1647
; Line 836
	mov	WORD PTR _bv[bx+18],ax
; Line 837
$I1647:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_FormationSpeedAdjustUS	ENDP
; Line 840
	PUBLIC	_Jink
_Jink	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,32
	call	__aNchkstk
	push	si
;	targetspeed = -14
;	distkm = -26
;	tdist = -16
;	tdistnm = -4
;	relangle = -18
;	dojinkangle = -8
;	dx = -24
;	dy = -28
;	tpitch = -22
;	tangle = -20
;	enemyroll = -12
;	enemyhead = -2
;	enemyalt = -32
;	enemypitch = -6
;	e2uspitch = -10
;	enemynum = -30
; Line 851
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	push	ax
	call	_CheckDetection
	add	sp,2
	mov	WORD PTR [bp-30],ax	;enemynum
	cmp	ax,-999
	jne	$I1665
; Line 852
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR [bp-30],ax	;enemynum
; Line 854
$I1665:
	cmp	ax,-1
	jne	$I1666
; Line 855
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-24],ax	;dx
; Line 856
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-28],ax	;dy
; Line 857
	mov	ax,WORD PTR _OurRoll
	mov	WORD PTR [bp-12],ax	;enemyroll
; Line 858
	mov	ax,WORD PTR _OurHead
	mov	WORD PTR [bp-2],ax	;enemyhead
; Line 859
	mov	ax,WORD PTR _OurPitch
	mov	WORD PTR [bp-6],ax	;enemypitch
; Line 860
	mov	ax,WORD PTR _Knots
	jmp	SHORT $L20045
$I1666:
; Line 863
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR [bp-30]	;enemynum
	mov	si,ax
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-24],ax	;dx
; Line 864
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-28],ax	;dy
; Line 865
	mov	ax,WORD PTR _ps[si+20]
	mov	WORD PTR [bp-12],ax	;enemyroll
; Line 866
	mov	ax,WORD PTR _ps[si+16]
	mov	WORD PTR [bp-2],ax	;enemyhead
; Line 867
	mov	ax,WORD PTR _ps[si+18]
	mov	WORD PTR [bp-6],ax	;enemypitch
; Line 868
	mov	ax,46
	imul	WORD PTR [bp-30]	;enemynum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
$L20045:
	mov	WORD PTR [bp-14],ax	;targetspeed
; Line 869
; Line 870
	sub	ax,ax
	push	ax
	lea	cx,WORD PTR [bp-32]	;enemyalt
	push	cx
	lea	cx,WORD PTR [bp-4]	;tdistnm
	push	cx
	lea	cx,WORD PTR [bp-20]	;tangle
	push	cx
	lea	dx,WORD PTR [bp-22]	;tpitch
	push	dx
	lea	bx,WORD PTR [bp-16]	;tdist
	push	bx
	push	WORD PTR [bp-28]	;dy
	push	WORD PTR [bp-24]	;dx
	push	WORD PTR $S1338_i
	call	_GetTargADP
	add	sp,18
; Line 871
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-20]	;tangle
	sub	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-18],ax	;relangle
; Line 872
	mov	ax,WORD PTR [bp-20]	;tangle
	sub	ax,WORD PTR [bp-2]	;enemyhead
	add	ah,128
	mov	WORD PTR [bp-8],ax	;dojinkangle
; Line 873
	mov	ax,WORD PTR [bp-22]	;tpitch
	neg	ax
	mov	WORD PTR [bp-10],ax	;e2uspitch
; Line 875
	push	WORD PTR [bp-12]	;enemyroll
	call	_abs
	add	sp,2
	cmp	ax,6144
	jl	$JCC4949
	jmp	$I1668
$JCC4949:
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	push	WORD PTR _ps[bx+20]
	call	_abs
	add	sp,2
	push	WORD PTR [bp-12]	;enemyroll
	mov	si,ax
	call	_abs
	add	sp,2
	cmp	ax,si
	jl	$JCC4986
	jmp	$I1668
$JCC4986:
; Line 876
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+20],0
	jge	$I1672
; Line 877
$L20048:
	mov	ax,-16384
	jmp	SHORT $L20046
$I1672:
; Line 887
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,16384
$L20046:
	sub	ax,WORD PTR _ps[bx+20]
	mov	WORD PTR _droll,ax
; Line 888
; Line 910
	cmp	WORD PTR [bp-16],105	;tdist
	jb	$JCC5035
	jmp	$I1674
$JCC5035:
; Line 911
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+42]
	mov	cx,ax
	shl	ax,1
	mov	dl,BYTE PTR _planecnt
	add	dl,BYTE PTR _Gtime
	and	dx,31
	cmp	ax,dx
	jg	$JCC5070
	jmp	$I1679
$JCC5070:
	cmp	cx,2
	jg	$JCC5078
	jmp	$I1679
$JCC5078:
	test	BYTE PTR _bv[bx+21],128
	je	$JCC5088
	jmp	$I1679
$JCC5088:
	les	bx,DWORD PTR _ptype
	cmp	WORD PTR es:[bx+12],1
	jg	$JCC5102
	jmp	$I1679
$JCC5102:
; Line 912
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+18]
	sub	ax,WORD PTR [bp-6]	;enemypitch
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,4096
	jle	$I1679
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	push	WORD PTR _ps[bx+20]
	call	_abs
	add	sp,2
	cmp	ax,4096
	jge	$I1679
; Line 913
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+18],0
	jg	$I1678
	cmp	WORD PTR _ps[bx+6],1000
	jge	$I1677
$I1678:
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],5250
	jge	$I1677
; Line 914
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Immelmann
; Line 916
; Line 917
	jmp	SHORT $I1679
	nop	
$I1668:
	cmp	WORD PTR [bp-12],0	;enemyroll
	jg	$JCC5222
	jmp	$I1672
$JCC5222:
; Line 884
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	jmp	$L20048
	nop	
$I1677:
; Line 918
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _SplitS
; Line 920
$I1679:
; Line 921
; Line 922
; Line 925
	mov	ax,WORD PTR [bp-6]	;enemypitch
	sub	ax,WORD PTR [bp-10]	;e2uspitch
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,4096
	jge	$I1680
; Line 926
	mov	ax,WORD PTR [bp-6]	;enemypitch
	cmp	WORD PTR [bp-10],ax	;e2uspitch
	jle	$L20050
; Line 927
$L20049:
	mov	WORD PTR _pdest,10240
; Line 928
; Line 929
	jmp	SHORT $I1688
	nop	
$I1680:
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-10]	;e2uspitch
	cmp	WORD PTR _ps[bx+18],ax
	jge	$L20049
	jmp	SHORT $L20050
$I1674:
; Line 943
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-10]	;e2uspitch
	cmp	WORD PTR _ps[bx+18],ax
	jg	$L20049
; Line 947
$L20050:
	mov	WORD PTR _pdest,-12288
; Line 948
$I1688:
; Line 949
; Line 959
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],6000
	jle	$I1689
; Line 961
	mov	WORD PTR _pdest,-12288
; Line 962
; Line 963
	jmp	SHORT $I1691
	nop	
$I1689:
; Line 964
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],500
	jge	$I1691
	cmp	WORD PTR _ps[bx+18],-2048
	jbe	$I1691
; Line 965
	mov	WORD PTR _pdest,12288
; Line 966
; Line 967
$I1691:
; Line 969
	cmp	WORD PTR [bp-4],2	;tdistnm
	jae	$I1692
; Line 970
	cmp	WORD PTR [bp-14],300	;targetspeed
	jle	$I1693
; Line 971
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-14]	;targetspeed
	sar	ax,1
	jmp	SHORT $L20047
$I1693:
; Line 973
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],150
; Line 974
; Line 975
	jmp	SHORT $I1695
	nop	
$I1692:
; Line 976
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
$L20047:
	mov	WORD PTR _bv[bx+18],ax
$I1695:
; Line 978
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],20
	jge	$I1696
	cmp	WORD PTR _ps[bx+18],0
	jge	$I1696
; Line 979
; Line 981
	mov	WORD PTR _pdest,0
; Line 982
; Line 1002
$I1696:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Jink	ENDP
; Line 1004
	PUBLIC	_Formation
_Formation	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,66
	call	__aNchkstk
	push	si
;	dx = -48
;	dy = -62
;	dz = -64
;	tx = -44
;	ty = -58
;	relangle = -24
;	tangle = -32
;	tpitch = -42
;	troll = -56
;	enemyalt = -66
;	prewing = -40
;	temphead = -20
;	secplace = -2
;	tempwing = -30
;	prespeed = -18
;	tempspeed = -14
;	tdist = -16
;	distkm = -38
;	tdistnm = -6
;	offangle = -4
;	tempalt = -12
;	ourleadalt = -54
;	dpwhead = -52
;	craps = -22
;	xval = -28
;	yval = -36
;	zval = -50
;	tempplane = -10
; Line 1024
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	push	ax
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-40],ax	;prewing
	inc	ax
	jne	$I1726
; Line 1025
	call	_FormationUS
; Line 1026
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1027
; Line 1029
	nop	
$I1726:
; Line 1031
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	WORD PTR [bp-10],bx	;tempplane
	mov	WORD PTR [bp-8],es
	cmp	WORD PTR es:[bx+12],2
	jge	$I1728
; Line 1032
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+28],53
	jge	$I1728
; Line 1033
	mov	WORD PTR _bv[bx+28],53
; Line 1034
$I1728:
; Line 1036
	push	WORD PTR $S1338_i
	call	_GetBehaviorLeader
	add	sp,2
	mov	WORD PTR [bp-40],ax	;prewing
; Line 1038
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+20]
	mov	cx,ax
	and	ax,15
	mov	WORD PTR [bp-2],ax	;secplace
; Line 1040
	mov	WORD PTR [bp-4],24576	;offangle
; Line 1041
	test	ch,64
	je	$I1729
; Line 1042
	mov	WORD PTR [bp-4],16384	;offangle
; Line 1043
; Line 1045
$I1729:
	mov	WORD PTR [bp-18],0	;prespeed
; Line 1046
	mov	ax,WORD PTR $S1338_i
	cmp	WORD PTR [bp-40],ax	;prewing
	je	$I1730
; Line 1047
	mov	ax,46
	imul	WORD PTR [bp-40]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
	mov	WORD PTR [bp-18],ax	;prespeed
; Line 1048
; Line 1050
$I1730:
	mov	ax,40
	imul	WORD PTR [bp-40]	;prewing
	mov	bx,ax
	mov	ax,46
	imul	WORD PTR [bp-40]	;prewing
	mov	si,ax
	mov	ax,WORD PTR _bv[si+16]
	sub	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-52],ax	;dpwhead
; Line 1052
	mov	cx,WORD PTR $S1338_i
	cmp	WORD PTR [bp-40],cx	;prewing
	je	$I1732
	cmp	WORD PTR [bp-2],1	;secplace
	jle	$I1732
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,1536
	jg	$JCC5719
	jmp	$I1731
$JCC5719:
$I1732:
; Line 1053
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
	mov	WORD PTR [bp-14],ax	;tempspeed
; Line 1054
	test	BYTE PTR _bv[bx+21],2
	jne	$I1734
	sub	ax,ax
	push	ax
	push	WORD PTR $S1338_i
	call	_ImNotaFighter
	add	sp,4
	or	ax,ax
	jne	$JCC5762
	jmp	$I1733
$JCC5762:
$I1734:
; Line 1055
	mov	ax,WORD PTR $S1338_i
	cmp	WORD PTR [bp-40],ax	;prewing
	je	$I1735
; Line 1057
	lea	cx,WORD PTR [bp-50]	;zval
	push	cx
	lea	cx,WORD PTR [bp-36]	;yval
	push	cx
	lea	dx,WORD PTR [bp-28]	;xval
	push	dx
	mov	ax,46
	imul	WORD PTR [bp-40]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+14]
	mov	dx,ax
	mov	ax,46
	mov	bx,dx
	imul	WORD PTR $S1338_i
	mov	si,ax
	mov	WORD PTR _bv[si+14],bx
	push	bx
	call	_GetWayXYZ
	add	sp,8
; Line 1058
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-28]	;xval
	mov	dx,WORD PTR [bp-26]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 1059
	mov	ax,WORD PTR [bp-36]	;yval
	mov	dx,WORD PTR [bp-34]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 1060
; Line 1061
$I1735:
	call	_FlyWayPoint
; Line 1063
	mov	ax,WORD PTR $S1338_i
	cmp	WORD PTR [bp-40],ax	;prewing
	je	$I1738
; Line 1064
	mov	cx,46
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Formation
	je	$I1738
	mov	ax,cx
	imul	WORD PTR [bp-40]	;prewing
	mov	si,ax
	test	BYTE PTR _bv[si+21],2
	je	$I1738
; Line 1065
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 1066
; Line 1088
; Line 1089
	jmp	SHORT $I1738
$I1733:
; Line 1090
	call	_StraightAttack
; Line 1091
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-14]	;tempspeed
	mov	WORD PTR _bv[bx+18],ax
; Line 1092
$I1738:
; Line 1098
	cmp	WORD PTR [bp-18],0	;prespeed
	je	$I1739
; Line 1099
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-18]	;prespeed
	sub	ax,10
	mov	WORD PTR _bv[bx+18],ax
; Line 1101
$I1739:
	mov	ax,WORD PTR $S1338_i
	cmp	WORD PTR [bp-40],ax	;prewing
	jne	$JCC5958
	jmp	$EX1697
$JCC5958:
; Line 1102
	mov	cx,40
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],75
	jg	$JCC5975
	jmp	$EX1697
$JCC5975:
; Line 1103
	mov	ax,cx
	imul	WORD PTR [bp-40]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+18]
	mov	WORD PTR _pdest,ax
; Line 1104
; Line 1105
; Line 1106
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1107
; Line 1108
	nop	
$I1731:
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_IsBoat
	add	sp,2
	or	ax,ax
	je	$I1742
; Line 1109
	call	_FormationBoat
; Line 1110
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1742:
	cmp	WORD PTR [bp-2],2	;secplace
	jne	$I1745
; Line 1113
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+6],0
	jl	$I1746
; Line 1114
	mov	ax,WORD PTR _bv[bx+6]
	jmp	SHORT $L20052
$I1746:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],0
	jl	$I1748
; Line 1116
	mov	ax,WORD PTR _bv[bx+2]
	jmp	SHORT $L20052
$I1748:
; Line 1118
	mov	ax,WORD PTR [bp-40]	;prewing
$L20052:
	mov	WORD PTR [bp-30],ax	;tempwing
$I1753:
; Line 1129
	mov	ax,40
	imul	WORD PTR [bp-30]	;tempwing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	add	ax,WORD PTR [bp-4]	;offangle
	jmp	$L20058
$I1745:
; Line 1123
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+28],16
	jne	$I1751
; Line 1124
	cmp	WORD PTR _bv[bx+6],0
	jl	$I1752
; Line 1125
	mov	ax,WORD PTR _bv[bx+6]
	mov	WORD PTR [bp-30],ax	;tempwing
; Line 1126
	cmp	ax,WORD PTR [bp-40]	;prewing
	jne	$I1753
	jmp	SHORT $L20060
	nop	
$I1752:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],0
	jl	$I1756
; Line 1132
	mov	ax,WORD PTR _bv[bx+2]
	jmp	SHORT $L20055
$I1756:
; Line 1137
	mov	ax,WORD PTR [bp-40]	;prewing
$L20055:
	mov	WORD PTR [bp-30],ax	;tempwing
$L20060:
	mov	cx,40
	imul	cx
	jmp	SHORT $L20054
	nop	
$I1751:
; Line 1141
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+6],0
	jl	$I1759
; Line 1142
	mov	ax,WORD PTR _bv[bx+6]
	mov	WORD PTR [bp-30],ax	;tempwing
; Line 1143
	cmp	ax,WORD PTR [bp-40]	;prewing
	je	$I1762
; Line 1144
	mov	cx,46
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _bv[bx+4],0
	jl	$I1762
; Line 1145
	mov	ax,WORD PTR _bv[bx+4]
	jmp	SHORT $L20056
$I1759:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],0
	jl	$I1763
; Line 1149
	mov	ax,WORD PTR _bv[bx+2]
	jmp	SHORT $L20056
$I1763:
; Line 1152
	mov	ax,WORD PTR [bp-40]	;prewing
$L20056:
	mov	WORD PTR [bp-30],ax	;tempwing
; Line 1153
$I1762:
; Line 1154
	mov	ax,40
	imul	WORD PTR [bp-30]	;tempwing
$L20054:
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	sub	ax,WORD PTR [bp-4]	;offangle
$L20058:
	mov	WORD PTR [bp-20],ax	;temphead
; Line 1155
; Line 1156
	mov	ax,46
	imul	WORD PTR [bp-30]	;tempwing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
	mov	WORD PTR [bp-18],ax	;prespeed
; Line 1157
; Line 1166
	mov	ax,46
	imul	WORD PTR [bp-40]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+14]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+14],cx
; Line 1168
	mov	ax,WORD PTR [bp-30]	;tempwing
	cmp	WORD PTR $S1338_i,ax
	jle	$I1765
; Line 1169
	lea	cx,WORD PTR [bp-54]	;ourleadalt
	push	cx
	lea	cx,WORD PTR [bp-62]	;dy
	push	cx
	lea	cx,WORD PTR [bp-48]	;dx
	push	cx
	push	ax
	call	_GetLastPosition
	add	sp,8
; Line 1170
; Line 1171
	jmp	SHORT $I1766
$I1765:
; Line 1172
	mov	cl,3
	mov	bx,ax
	shl	bx,cl
	mov	ax,WORD PTR _ailoc[bx]
	mov	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-48],ax	;dx
	mov	WORD PTR [bp-46],dx
; Line 1173
	mov	ax,WORD PTR _ailoc[bx+4]
	mov	dx,WORD PTR _ailoc[bx+6]
	mov	WORD PTR [bp-62],ax	;dy
	mov	WORD PTR [bp-60],dx
; Line 1174
	mov	ax,40
	imul	WORD PTR [bp-30]	;tempwing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR [bp-54],ax	;ourleadalt
; Line 1175
$I1766:
; Line 1177
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,100
	imul	WORD PTR _bv[bx+28]
	push	dx
	push	ax
	push	WORD PTR [bp-20]	;temphead
	call	_sinXL
	add	sp,6
	add	WORD PTR [bp-48],ax	;dx
	adc	WORD PTR [bp-46],dx
; Line 1178
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,100
	imul	WORD PTR _bv[bx+28]
	push	dx
	push	ax
	push	WORD PTR [bp-20]	;temphead
	call	_cosXL
	add	sp,6
	sub	WORD PTR [bp-62],ax	;dy
	sbb	WORD PTR [bp-60],dx
; Line 1180
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+26]
	add	ax,WORD PTR [bp-54]	;ourleadalt
	mov	WORD PTR [bp-12],ax	;tempalt
; Line 1183
	cmp	ax,50
	jge	$I1767
; Line 1184
	mov	WORD PTR [bp-12],50	;tempalt
; Line 1186
$I1767:
	cmp	WORD PTR _GLowDroll,0
	je	$I1768
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],128
	jne	$I1768
; Line 1187
	or	BYTE PTR _ps[bx+24],128
; Line 1188
	push	WORD PTR [bp-30]	;tempwing
	push	WORD PTR [bp-12]	;tempalt
	push	WORD PTR [bp-60]
	push	WORD PTR [bp-62]	;dy
	push	WORD PTR [bp-46]
	push	WORD PTR [bp-48]	;dx
	push	WORD PTR $S1338_i
	call	_JustPutHere
	jmp	SHORT $L20057
; Line 1190
; Line 1193
	nop	
$I1768:
	push	WORD PTR [bp-18]	;prespeed
	push	WORD PTR [bp-30]	;tempwing
	push	WORD PTR [bp-12]	;tempalt
	push	WORD PTR [bp-60]
	push	WORD PTR [bp-62]	;dy
	push	WORD PTR [bp-46]
	push	WORD PTR [bp-48]	;dx
	call	_LFlyTo
$L20057:
	add	sp,14
; Line 1217
$EX1697:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_Formation	ENDP
; Line 1220
	PUBLIC	_FormationUS
_FormationUS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,60
	call	__aNchkstk
	push	si
;	txt = -4
;	tyt = -10
;	dx = -38
;	dy = -48
;	dx2 = -54
;	dy2 = -60
;	dz = -50
;	tx = -34
;	ty = -44
;	relangle = -22
;	tangle = -26
;	tpitch = -32
;	troll = -42
;	enemyalt = -56
;	prewing = -30
;	temphead = -20
;	secplace = -6
;	tempwing = -24
;	prespeed = -18
;	tdist = -16
;	distkm = -28
;	tdistnm = -12
;	tempalt = -14
;	ourleadalt = -40
; Line 1233
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
; Line 1235
	mov	WORD PTR [bp-30],-1	;prewing
; Line 1237
	test	BYTE PTR _landingstatus,3
	je	$I1797
; Line 1238
	cmp	WORD PTR _whichourcarr,0
	jl	$I1797
; Line 1239
	mov	ax,40
	imul	WORD PTR _whichourcarr
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I1797
	test	cl,2
	je	$I1797
; Line 1240
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR _Px
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,1800
	jge	$I1797
	mov	ax,40
	imul	WORD PTR _whichourcarr
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR _Py
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,1800
	jge	$I1797
; Line 1241
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 1242
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 1243
; Line 1244
$I1797:
; Line 1245
; Line 1246
; Line 1247
	mov	WORD PTR _pdest,0
; Line 1249
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+20]
	and	ax,15
	mov	WORD PTR [bp-6],ax	;secplace
; Line 1251
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	call	_GetDAltSpeed
	add	sp,2
	add	ax,WORD PTR _Knots
	mov	WORD PTR [bp-18],ax	;prespeed
; Line 1253
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+20]
	mov	cx,ax
	test	ah,64
	je	$I1798
; Line 1254
	test	ch,2
	je	$I1800
; Line 1256
	and	BYTE PTR _bv[bx+21],253
	test	BYTE PTR _bv[bx+20],32
	jne	$I1800
; Line 1257
	mov	ax,WORD PTR _bv[bx+20]
	or	ah,1
	mov	WORD PTR _bv[bx+20],ax
; Line 1258
$I1800:
; Line 1259
	cmp	WORD PTR [bp-6],2	;secplace
	jne	$I1801
; Line 1260
	mov	ax,WORD PTR _OurHead
	add	ah,64
	jmp	SHORT $L20061
$I1801:
; Line 1263
	mov	ax,WORD PTR _OurHead
	sub	ax,16384
	jmp	SHORT $L20061
$I1798:
; Line 1267
	cmp	WORD PTR [bp-6],2	;secplace
	jne	$I1804
; Line 1268
	mov	ax,WORD PTR _OurHead
	add	ah,96
	jmp	SHORT $L20061
$I1804:
; Line 1271
	mov	ax,WORD PTR _OurHead
	sub	ax,24576
$L20061:
	mov	WORD PTR [bp-20],ax	;temphead
; Line 1272
; Line 1273
; Line 1275
	mov	WORD PTR [bp-24],-1	;tempwing
; Line 1277
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-999
	je	$I1806
; Line 1278
	mov	ax,WORD PTR _bv[bx+2]
	jmp	SHORT $L20064
	nop	
$I1806:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+6],-999
	je	$I1808
; Line 1281
	mov	ax,WORD PTR _bv[bx+6]
$L20064:
	mov	WORD PTR [bp-24],ax	;tempwing
; Line 1282
; Line 1284
$I1808:
	cmp	WORD PTR [bp-24],-1	;tempwing
	jne	$I1809
; Line 1287
	lea	ax,WORD PTR [bp-40]	;ourleadalt
	push	ax
	lea	ax,WORD PTR [bp-48]	;dy
	push	ax
	lea	cx,WORD PTR [bp-38]	;dx
	push	cx
	mov	dx,-1
	push	dx
$L20065:
	call	_GetLastPosition
	add	sp,8
	jmp	SHORT $I1812
$I1809:
; Line 1292
	mov	ax,WORD PTR $S1338_i
	cmp	WORD PTR [bp-24],ax	;tempwing
	jge	$I1811
; Line 1293
	lea	ax,WORD PTR [bp-40]	;ourleadalt
	push	ax
	lea	ax,WORD PTR [bp-48]	;dy
	push	ax
	lea	ax,WORD PTR [bp-38]	;dx
	push	ax
	push	WORD PTR [bp-24]	;tempwing
	jmp	SHORT $L20065
	nop	
$I1811:
; Line 1296
	mov	cl,3
	mov	bx,WORD PTR [bp-24]	;tempwing
	shl	bx,cl
	mov	ax,WORD PTR _ailoc[bx]
	mov	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-38],ax	;dx
	mov	WORD PTR [bp-36],dx
; Line 1297
	mov	ax,WORD PTR _ailoc[bx+4]
	mov	dx,WORD PTR _ailoc[bx+6]
	mov	WORD PTR [bp-48],ax	;dy
	mov	WORD PTR [bp-46],dx
; Line 1298
	mov	ax,40
	imul	WORD PTR [bp-24]	;tempwing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR [bp-40],ax	;ourleadalt
; Line 1299
$I1812:
; Line 1300
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,100
	imul	WORD PTR _bv[bx+28]
	push	dx
	push	ax
	push	WORD PTR [bp-20]	;temphead
	call	_sinXL
	add	sp,6
	add	WORD PTR [bp-38],ax	;dx
	adc	WORD PTR [bp-36],dx
; Line 1301
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,100
	imul	WORD PTR _bv[bx+28]
	push	dx
	push	ax
	push	WORD PTR [bp-20]	;temphead
	call	_cosXL
	add	sp,6
	sub	WORD PTR [bp-48],ax	;dy
	sbb	WORD PTR [bp-46],dx
; Line 1304
; Line 1307
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	cx,WORD PTR [bp-48]	;dy
	mov	bx,WORD PTR [bp-46]
	add	cx,16
	adc	bx,0
	push	bx
	push	cx
	call	__aNldiv
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
	mov	WORD PTR [bp-44],ax	;ty
; Line 1310
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	sub	cx,WORD PTR _ps[bx+4]
	push	cx
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-38]	;dx
	mov	dx,WORD PTR [bp-36]
	add	ax,16
	adc	dx,0
	push	dx
	push	ax
	mov	si,bx
	call	__aNldiv
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
	mov	WORD PTR [bp-34],ax	;tx
	sub	ax,WORD PTR _ps[si+2]
	push	ax
	call	_Dist2D
	add	sp,4
	mov	WORD PTR [bp-16],ax	;tdist
	cmp	ax,128
	jae	$I1815
; Line 1311
	cmp	WORD PTR _Alt,0
	jne	$I1815
; Line 1312
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,16384
	sub	ax,WORD PTR _ps[bx+20]
	mov	WORD PTR _droll,ax
; Line 1313
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+18],180
	jge	$EX1769
; Line 1314
	mov	WORD PTR _bv[bx+18],180
; Line 1315
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1316
; Line 1317
	nop	
$I1815:
; Line 1319
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+26],0
	jne	$I1817
; Line 1320
	mov	ax,WORD PTR _bv[bx+26]
	add	ax,WORD PTR [bp-40]	;ourleadalt
	jmp	SHORT $L20063
	nop	
$I1817:
; Line 1322
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+26]
	add	ax,WORD PTR _Alt
	add	ax,4
$L20063:
	mov	WORD PTR [bp-14],ax	;tempalt
; Line 1323
	cmp	ax,75
	jge	$I1819
; Line 1324
	mov	WORD PTR [bp-14],75	;tempalt
; Line 1326
$I1819:
	push	WORD PTR [bp-18]	;prespeed
	push	WORD PTR [bp-30]	;prewing
	push	WORD PTR [bp-14]	;tempalt
	push	WORD PTR [bp-46]
	push	WORD PTR [bp-48]	;dy
	push	WORD PTR [bp-36]
	push	WORD PTR [bp-38]	;dx
	call	_LFlyTo
	add	sp,14
; Line 1337
$EX1769:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_FormationUS	ENDP
; Line 1339
	PUBLIC	_BracketLeft
_BracketLeft	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	angleinc = -2
;	angleevade = -4
; Line 1344
	mov	ax,16384
	push	ax
	mov	ax,-10240
	push	ax
	call	_BaseBracket
; Line 1345
	mov	sp,bp
	pop	bp
	ret	

_BracketLeft	ENDP
; Line 1347
	PUBLIC	_BracketRight
_BracketRight	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	angleinc = -2
;	angleevade = -4
; Line 1352
	mov	ax,-16384
	push	ax
	mov	ax,10240
	push	ax
	call	_BaseBracket
; Line 1353
	mov	sp,bp
	pop	bp
	ret	

_BracketRight	ENDP
; Line 1355
	PUBLIC	_FlyStraight
_FlyStraight	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	angleinc = -2
;	angleevade = -4
; Line 1360
	sub	ax,ax
	push	ax
	push	ax
	call	_BaseBracket
; Line 1361
	mov	sp,bp
	pop	bp
	ret	

_FlyStraight	ENDP
; Line 1364
	PUBLIC	_CheckRadarSet
_CheckRadarSet	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__aNchkstk
	push	si
;	distkm = -14
;	j = -12
;	radaron = -8
;	S = -6
;	ssk = -2
;	missileinair = -10
;	misslcnt = -16
;	tangle = 6
;	tdist = 4
; Line 1375
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],32
	je	$JCC7456
	jmp	$L20066
$JCC7456:
; Line 1378
; Line 1380
	mov	WORD PTR [bp-8],1	;radaron
; Line 1383
	mov	ax,825
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp+4]	;tdist
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
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-14],ax	;distkm
; Line 1384
	sub	ax,ax
	mov	WORD PTR [bp-10],ax	;missileinair
	mov	WORD PTR [bp-12],ax	;j
	jmp	$F1840
; Line 1396
; Line 1397
	nop	
$I1851:
; Line 1398
	inc	WORD PTR [bp-16]	;misslcnt
	add	WORD PTR [bp-2],44	;ssk
$F1847:
	cmp	WORD PTR [bp-16],28	;misslcnt
	jge	$FB1849
; Line 1392
	mov	bx,WORD PTR [bp-2]	;ssk
	cmp	WORD PTR [bx+26],0
	je	$I1851
; Line 1393
	mov	ax,WORD PTR $S1338_i
	cmp	WORD PTR [bx+34],ax
	jne	$I1851
; Line 1394
	mov	WORD PTR [bp-10],1	;missileinair
; Line 1395
$FB1849:
; Line 1399
	cmp	WORD PTR [bp-10],0	;missileinair
	je	$I1858
; Line 1400
	jmp	SHORT $FB1842
	nop	
$I1844:
	cmp	WORD PTR es:[bx+22],2
	jne	$I1858
	cmp	WORD PTR es:[bx+16],ax
	jae	$I1858
	cmp	WORD PTR es:[bx+14],ax
	jbe	$I1858
; Line 1404
	cmp	WORD PTR _Night,0
	je	$I1856
	cmp	WORD PTR [bp+4],90	;tdist
	jge	$I1855
	push	WORD PTR [bp+6]	;tangle
	call	_abs
	add	sp,2
	cmp	ax,8192
	jge	$I1855
$I1856:
; Line 1405
	mov	WORD PTR [bp-8],0	;radaron
; Line 1406
$FB1842:
; Line 1414
	cmp	WORD PTR [bp-8],0	;radaron
	jne	$JCC7615
	jmp	$I1859
$JCC7615:
; Line 1415
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],1
; Line 1416
; Line 1417
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1855:
	cmp	WORD PTR _Night,0
	je	$I1858
; Line 1409
	mov	WORD PTR [bp-8],1	;radaron
; Line 1410
; Line 1411
$I1858:
; Line 1412
; Line 1413
	inc	WORD PTR [bp-12]	;j
$F1840:
	cmp	WORD PTR [bp-12],3	;j
	jge	$FB1842
; Line 1385
	mov	ax,20
	imul	WORD PTR $S1338_i
	mov	bx,ax
	add	bx,WORD PTR [bp-12]	;j
	shl	bx,1
	cmp	WORD PTR _ps[bx+34],0
	jle	$I1858
; Line 1388
	mov	si,WORD PTR [bp-12]	;j
	shl	si,1
	les	bx,DWORD PTR _ptype
	push	WORD PTR es:[bx+26][si]
	call	_GetMissilePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	ax,WORD PTR [bp-14]	;distkm
	cmp	WORD PTR es:[bx+16],ax
	jb	$JCC7712
	jmp	$I1844
$JCC7712:
	cmp	WORD PTR es:[bx+22],3
	je	$I1845
	cmp	WORD PTR es:[bx+22],4
	je	$JCC7729
	jmp	$I1844
$JCC7729:
$I1845:
; Line 1389
	mov	WORD PTR [bp-8],1	;radaron
; Line 1390
	cmp	WORD PTR es:[bx+22],3
	jne	$I1858
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],1
	je	$I1858
; Line 1391
	mov	WORD PTR [bp-16],0	;misslcnt
	mov	WORD PTR [bp-2],OFFSET _ss	;ssk
	jmp	$F1847
	nop	
$I1859:
; Line 1418
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
$L20066:
	and	BYTE PTR _bv[bx+21],254
; Line 1419
; Line 1420
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CheckRadarSet	ENDP
; Line 1422
	PUBLIC	_Jink2
_Jink2	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,42
	call	__aNchkstk
	push	si
;	misslcnt = -34
;	dx = -28
;	dy = -32
;	dz = -38
;	dxw = -10
;	dyw = -12
;	relangle = -20
;	rrelangle = -26
;	tangle = -22
;	tpitch = -24
;	troll = -30
;	twangle = -6
;	enemyhead = -2
;	tdist = -16
;	tdistnm = -8
;	ssk = -4
;	missileinair = -18
;	wingnum = -14
;	enemyalt = -42
;	enemynum = -36
;	enemyspeed = -40
; Line 1437
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	push	ax
	call	_CheckDetection
	add	sp,2
	cmp	ax,-999
	jne	$I1883
; Line 1439
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,OFFSET _StraightAttack
	mov	WORD PTR _bv[bx],ax
	call	ax
; Line 1440
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1441
; Line 1443
	nop	
$I1883:
; Line 1444
	push	WORD PTR $S1338_i
	call	_CheckDetection
	add	sp,2
	mov	WORD PTR [bp-36],ax	;enemynum
	cmp	ax,-999
	jne	$I1884
; Line 1445
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR [bp-36],ax	;enemynum
; Line 1447
$I1884:
	mov	WORD PTR [bp-18],0	;missileinair
; Line 1448
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	mov	WORD PTR _bv[bx+18],ax
; Line 1449
	cmp	WORD PTR [bp-36],-1	;enemynum
	jne	$I1885
; Line 1450
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-28],ax	;dx
; Line 1451
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-32],ax	;dy
; Line 1452
	mov	ax,WORD PTR _Knots
	jmp	SHORT $L20067
$I1885:
; Line 1455
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR [bp-36]	;enemynum
	mov	si,ax
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-28],ax	;dx
; Line 1456
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-32],ax	;dy
; Line 1457
	mov	ax,46
	imul	WORD PTR [bp-36]	;enemynum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
$L20067:
	mov	WORD PTR [bp-40],ax	;enemyspeed
; Line 1458
; Line 1459
	sub	ax,ax
	push	ax
	lea	ax,WORD PTR [bp-42]	;enemyalt
	push	ax
	lea	ax,WORD PTR [bp-8]	;tdistnm
	push	ax
	lea	ax,WORD PTR [bp-22]	;tangle
	push	ax
	lea	cx,WORD PTR [bp-24]	;tpitch
	push	cx
	lea	cx,WORD PTR [bp-16]	;tdist
	push	cx
	push	WORD PTR [bp-32]	;dy
	push	WORD PTR [bp-28]	;dx
	push	WORD PTR $S1338_i
	call	_GetTargADP
	add	sp,18
; Line 1461
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-22]	;tangle
	sub	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-20],ax	;relangle
; Line 1462
	cmp	WORD PTR [bp-36],-1	;enemynum
	jne	$I1887
; Line 1463
	mov	ax,WORD PTR _OurHead
	jmp	SHORT $L20068
	nop	
$I1887:
; Line 1466
	mov	ax,40
	imul	WORD PTR [bp-36]	;enemynum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
$L20068:
	mov	WORD PTR [bp-2],ax	;enemyhead
; Line 1467
; Line 1468
	mov	ax,WORD PTR [bp-22]	;tangle
	sub	ax,WORD PTR [bp-2]	;enemyhead
	add	ah,128
	mov	WORD PTR [bp-26],ax	;rrelangle
; Line 1469
	mov	ax,WORD PTR [bp-24]	;tpitch
	mov	WORD PTR _pdest,ax
; Line 1485
	push	WORD PTR [bp-20]	;relangle
	call	_abs
	add	sp,2
	cmp	ax,8192
	jge	$I1895
; Line 1486
	mov	WORD PTR [bp-34],0	;misslcnt
	mov	WORD PTR [bp-4],OFFSET _ss	;ssk
	jmp	SHORT $F1890
; Line 1491
; Line 1492
	nop	
$I1894:
; Line 1493
	inc	WORD PTR [bp-34]	;misslcnt
	add	WORD PTR [bp-4],44	;ssk
$F1890:
	cmp	WORD PTR [bp-34],28	;misslcnt
	jge	$FB1892
; Line 1487
	mov	bx,WORD PTR [bp-4]	;ssk
	cmp	WORD PTR [bx+26],0
	je	$I1894
; Line 1488
	mov	ax,WORD PTR $S1338_i
	cmp	WORD PTR [bx+34],ax
	jne	$I1894
; Line 1489
	mov	WORD PTR [bp-18],1	;missileinair
; Line 1490
$FB1892:
; Line 1494
	cmp	WORD PTR [bp-18],0	;missileinair
	jne	$I1895
; Line 1503
	call	_StraightAttack
; Line 1504
	push	WORD PTR [bp-20]	;relangle
	call	_abs
	add	sp,2
	cmp	ax,2048
	jg	$JCC8188
	jmp	$I1923
$JCC8188:
	cmp	WORD PTR [bp-16],90	;tdist
	jb	$JCC8197
	jmp	$I1923
$JCC8197:
; Line 1505
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],250
	jg	$JCC8217
	jmp	$I1923
$JCC8217:
; Line 1506
	mov	WORD PTR _pdest,-7168
; Line 1507
; Line 1508
; Line 1509
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1510
; Line 1511
	nop	
$I1895:
; Line 1512
	push	WORD PTR [bp-20]	;relangle
	call	_abs
	add	sp,2
	cmp	ax,20480
	jge	$I1898
	push	WORD PTR [bp-26]	;rrelangle
	call	_abs
	add	sp,2
	cmp	ax,10240
	jge	$I1898
	cmp	WORD PTR [bp-16],60	;tdist
	jae	$I1898
; Line 1513
	call	_StraightAttack
; Line 1514
	push	WORD PTR [bp-20]	;relangle
	call	_abs
	add	sp,2
	cmp	ax,16384
	jle	$I1899
; Line 1515
	cmp	WORD PTR [bp-40],300	;enemyspeed
	jle	$I1900
; Line 1516
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-40]	;enemyspeed
	sar	ax,1
	jmp	SHORT $L20069
$I1900:
; Line 1518
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],150
; Line 1519
; Line 1520
	jmp	SHORT $I1902
	nop	
$I1899:
; Line 1521
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
$L20069:
	mov	WORD PTR _bv[bx+18],ax
$I1902:
; Line 1523
	mov	WORD PTR _pdest,12288
; Line 1537
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1538
; Line 1539
$I1898:
	mov	WORD PTR [bp-14],-999	;wingnum
; Line 1540
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],0
	jl	$I1903
; Line 1541
	mov	ax,WORD PTR _bv[bx+2]
	jmp	SHORT $L20071
	nop	
$I1903:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+4],0
	jl	$I1905
; Line 1543
	mov	ax,WORD PTR _bv[bx+4]
$L20071:
	mov	WORD PTR [bp-14],ax	;wingnum
; Line 1545
$I1905:
	cmp	WORD PTR [bp-14],-999	;wingnum
	jne	$JCC8414
	jmp	$I1906
$JCC8414:
; Line 1546
	mov	ax,46
	imul	WORD PTR [bp-14]	;wingnum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I1907
; Line 1547
	mov	ax,40
	imul	WORD PTR [bp-14]	;wingnum
	mov	bx,ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-10],ax	;dxw
; Line 1548
	mov	cx,WORD PTR _Py
	jmp	SHORT $L20070
$I1907:
; Line 1552
	mov	ax,40
	imul	WORD PTR [bp-14]	;wingnum
	mov	bx,ax
	mov	ax,46
	imul	WORD PTR [bp-14]	;wingnum
	mov	si,ax
	mov	ax,40
	imul	WORD PTR _bv[si+10]
	mov	si,ax
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-10],ax	;dxw
; Line 1553
	mov	cx,WORD PTR _ps[si+4]
$L20070:
	sub	cx,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-12],cx	;dyw
; Line 1554
	push	cx
	push	ax
	call	_Dist2D
	add	sp,4
	mov	WORD PTR [bp-16],ax	;tdist
; Line 1555
; Line 1556
	mov	ax,WORD PTR [bp-12]	;dyw
	neg	ax
	push	ax
	push	WORD PTR [bp-10]	;dxw
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-6],ax	;twangle
; Line 1558
	mov	ax,-32768
	sub	ax,WORD PTR [bp-2]	;enemyhead
	add	WORD PTR [bp-6],ax	;twangle
	jns	$L20073
; Line 1559
$L20072:
	sub	WORD PTR [bp-20],8192	;relangle
; Line 1560
; Line 1561
	jmp	SHORT $I1920
$I1906:
; Line 1566
	push	WORD PTR [bp-20]	;relangle
	call	_abs
	add	sp,2
	cmp	ax,20480
	jle	$I1913
	push	WORD PTR [bp-26]	;rrelangle
	call	_abs
	add	sp,2
	cmp	ax,10240
	jge	$I1913
	cmp	WORD PTR [bp-16],200	;tdist
	jae	$I1913
; Line 1567
	call	_Jink
; Line 1568
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1913:
; Line 1571
	cmp	WORD PTR [bp-20],0	;relangle
	jle	$I1915
; Line 1572
	cmp	WORD PTR [bp-26],0	;rrelangle
	jge	$L20072
	jmp	SHORT $L20073
$I1915:
; Line 1578
	cmp	WORD PTR [bp-26],0	;rrelangle
	jg	$L20072
; Line 1581
$L20073:
	add	BYTE PTR [bp-19],32
$I1920:
; Line 1582
; Line 1583
; Line 1585
; Line 1587
	push	WORD PTR [bp-20]	;relangle
	push	WORD PTR $S1338_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 1589
	cmp	WORD PTR [bp-24],0	;tpitch
	jge	$I1921
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],20
	jle	$I1921
	cmp	WORD PTR [bp-42],300	;enemyalt
	jle	$I1921
; Line 1591
	mov	WORD PTR _pdest,-14336
; Line 1592
; Line 1593
	jmp	SHORT $I1922
$I1921:
; Line 1595
	mov	WORD PTR _pdest,10240
; Line 1596
$I1922:
; Line 1598
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],6000
	jle	$I1923
; Line 1600
	mov	WORD PTR _pdest,-14336
; Line 1601
; Line 1615
$I1923:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_Jink2	ENDP
; Line 1618
	PUBLIC	_PostHole
_PostHole	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,26
	call	__aNchkstk
	push	si
;	dx = -16
;	dy = -20
;	dz = -24
;	relangle = -8
;	rrelangle = -14
;	tangle = -10
;	tpitch = -12
;	troll = -18
;	enemyhead = -2
;	enemyalt = -26
;	tdist = -6
;	tdistnm = -4
;	enemynum = -22
; Line 1629
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	push	ax
	call	_CheckDetection
	add	sp,2
	mov	WORD PTR [bp-22],ax	;enemynum
	cmp	ax,-999
	jne	$I1938
; Line 1630
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR [bp-22],ax	;enemynum
; Line 1632
$I1938:
	cmp	ax,-1
	jne	$I1939
; Line 1633
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-16],ax	;dx
; Line 1634
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-20],ax	;dy
; Line 1635
	mov	ax,WORD PTR _OurHead
	jmp	SHORT $L20074
$I1939:
; Line 1638
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR [bp-22]	;enemynum
	mov	si,ax
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-16],ax	;dx
; Line 1639
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-20],ax	;dy
; Line 1640
	mov	ax,WORD PTR _ps[si+16]
$L20074:
	mov	WORD PTR [bp-2],ax	;enemyhead
; Line 1641
; Line 1642
	sub	ax,ax
	push	ax
	lea	cx,WORD PTR [bp-26]	;enemyalt
	push	cx
	lea	cx,WORD PTR [bp-4]	;tdistnm
	push	cx
	lea	cx,WORD PTR [bp-10]	;tangle
	push	cx
	lea	dx,WORD PTR [bp-12]	;tpitch
	push	dx
	lea	dx,WORD PTR [bp-6]	;tdist
	push	dx
	push	WORD PTR [bp-20]	;dy
	push	WORD PTR [bp-16]	;dx
	push	WORD PTR $S1338_i
	call	_GetTargADP
	add	sp,18
; Line 1645
	mov	ax,WORD PTR [bp-10]	;tangle
	sub	ax,WORD PTR [bp-2]	;enemyhead
	add	ah,128
	mov	WORD PTR [bp-14],ax	;rrelangle
	or	ax,ax
	jge	$I1941
; Line 1646
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,20480
	jmp	SHORT $L20075
	nop	
$I1941:
; Line 1649
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,-20480
$L20075:
	sub	ax,WORD PTR _ps[bx+20]
	mov	WORD PTR _droll,ax
; Line 1650
; Line 1651
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],250
	jle	$I1943
; Line 1653
	mov	WORD PTR _pdest,-4096
; Line 1654
; Line 1655
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1943:
; Line 1656
	mov	WORD PTR _pdest,0
; Line 1668
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_PostHole	ENDP
; Line 1671
	PUBLIC	_BaseBracket
_BaseBracket	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,34
	call	__aNchkstk
	push	si
;	dx = -26
;	dy = -30
;	dz = -32
;	relangle = -12
;	tempalt = -8
;	tangle = -16
;	tpitch = -24
;	troll = -28
;	tangle1 = -22
;	enemyalt = -34
;	tdist = -10
;	distkm = -20
;	tdistnm = -2
;	ttdist = -18
;	ttdistnm = -6
;	ttdistkm = -4
;	winglead = -14
;	angleevade = 6
;	angleinc = 4
; Line 1680
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I1965
; Line 1681
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-26],ax	;dx
; Line 1682
	mov	ax,WORD PTR _Py
	jmp	SHORT $L20076
$I1965:
; Line 1685
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,cx
	imul	WORD PTR $S1338_i
	mov	si,ax
	mov	ax,40
	imul	WORD PTR _bv[si+10]
	mov	si,ax
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-26],ax	;dx
; Line 1686
	mov	ax,WORD PTR _ps[si+4]
$L20076:
	sub	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-30],ax	;dy
; Line 1687
; Line 1689
	sub	ax,ax
	push	ax
	lea	cx,WORD PTR [bp-34]	;enemyalt
	push	cx
	lea	cx,WORD PTR [bp-2]	;tdistnm
	push	cx
	lea	dx,WORD PTR [bp-16]	;tangle
	push	dx
	lea	dx,WORD PTR [bp-24]	;tpitch
	push	dx
	lea	dx,WORD PTR [bp-10]	;tdist
	push	dx
	push	WORD PTR [bp-30]	;dy
	push	WORD PTR [bp-26]	;dx
	push	WORD PTR $S1338_i
	call	_GetTargADP
	add	sp,18
; Line 1692
	push	WORD PTR $S1338_i
	call	_CheckDetection
	add	sp,2
	cmp	ax,-999
	je	$I1970
	cmp	WORD PTR [bp-2],32	;tdistnm
	jae	$I1970
; Line 1694
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+2]
	mov	WORD PTR [bp-14],ax	;winglead
	or	ax,ax
	jl	$I1968
; Line 1695
	push	ax
	call	_CheckDetection
	add	sp,2
	mov	WORD PTR [bp-14],ax	;winglead
; Line 1696
; Line 1697
	jmp	SHORT $I1969
	nop	
	nop	
$I1968:
; Line 1698
	mov	WORD PTR [bp-14],-999	;winglead
$I1969:
; Line 1699
	cmp	WORD PTR [bp-14],-999	;winglead
	jne	$I1970
; Line 1700
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I1971
; Line 1701
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _OurHead
	jmp	SHORT $L20077
$I1971:
; Line 1703
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	si,ax
	mov	ax,40
	imul	WORD PTR _bv[si+10]
	mov	si,ax
	mov	ax,WORD PTR _ps[si+16]
$L20077:
	sub	ax,WORD PTR _ps[bx+16]
	add	ax,WORD PTR [bp+6]	;angleevade
	jmp	$L20079
; Line 1707
; Line 1708
	nop	
$I1970:
; Line 1711
	mov	WORD PTR [bp-24],0	;tpitch
; Line 1712
	push	WORD PTR $S1338_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I1978
; Line 1714
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+26]
	add	ax,WORD PTR _Alt
	mov	WORD PTR [bp-8],ax	;tempalt
	cmp	ax,75
	jge	$I1974
; Line 1715
	mov	WORD PTR [bp-8],75	;tempalt
; Line 1716
$I1974:
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-8]	;tempalt
	cmp	WORD PTR _ps[bx+6],ax
	jge	$I1975
; Line 1717
	mov	ax,8192
$L20080:
	sub	ax,WORD PTR _ps[bx+18]
	mov	WORD PTR [bp-24],ax	;tpitch
; Line 1718
	jmp	SHORT $I1978
$I1975:
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-8]	;tempalt
	add	ax,50
	cmp	WORD PTR _ps[bx+6],ax
	jle	$I1977
; Line 1719
	mov	ax,-12288
	jmp	SHORT $L20080
$I1977:
; Line 1722
	mov	WORD PTR [bp-24],0	;tpitch
$I1978:
; Line 1723
; Line 1724
	mov	ax,WORD PTR [bp-16]	;tangle
	mov	WORD PTR [bp-22],ax	;tangle1
; Line 1725
	mov	ax,WORD PTR [bp+4]	;angleinc
	add	WORD PTR [bp-16],ax	;tangle
; Line 1726
	mov	ax,WORD PTR [bp-10]	;tdist
	mov	cl,5
	shl	ax,cl
	mov	cx,825
	sub	dx,dx
	div	cx
	mov	WORD PTR [bp-20],ax	;distkm
; Line 1728
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I1979
	push	WORD PTR $S1338_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I1979
; Line 1729
	cmp	WORD PTR [bp-20],10	;distkm
	ja	$L20082
; Line 1734
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+16]
	add	ax,WORD PTR [bp+4]	;angleinc
	jmp	$L20081
$I1979:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jne	$I1983
; Line 1739
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR _ps[bx+4]
	push	ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR _ps[bx+2]
	push	ax
	call	_Dist2D
	add	sp,4
	mov	WORD PTR [bp-18],ax	;ttdist
	mov	cl,5
	shl	ax,cl
	mov	cx,825
	sub	dx,dx
	div	cx
	mov	WORD PTR [bp-4],ax	;ttdistkm
; Line 1740
	cmp	ax,10
	ja	$JCC9505
	jmp	$I1987
$JCC9505:
; Line 1741
$L20082:
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	call	_GetDAltSpeed
	add	sp,2
	add	ax,WORD PTR _Knots
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],cx
; Line 1742
	mov	ax,WORD PTR _OurHead
	jmp	SHORT $L20081
	nop	
$I1983:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],0
	jl	$I1987
; Line 1747
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	si,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+2]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR _ps[si+4]
	push	ax
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR _ps[si+2]
	push	ax
	call	_Dist2D
	add	sp,4
	mov	WORD PTR [bp-18],ax	;ttdist
	shl	ax,1
	mov	cx,90
	sub	dx,dx
	div	cx
	mov	WORD PTR [bp-6],ax	;ttdistnm
; Line 1748
	cmp	ax,15
	jbe	$I1987
; Line 1749
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,46
	imul	WORD PTR _bv[bx+2]
	mov	si,ax
	mov	ax,WORD PTR _bv[si+18]
	mov	WORD PTR _bv[bx+18],ax
; Line 1750
	mov	ax,40
	imul	WORD PTR _bv[bx+2]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
$L20081:
	mov	WORD PTR [bp-16],ax	;tangle
; Line 1751
; Line 1752
$I1987:
; Line 1762
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	sub	WORD PTR [bp-22],ax	;tangle1
; Line 1763
	mov	cx,WORD PTR [bp-24]	;tpitch
	mov	WORD PTR _pdest,cx
; Line 1765
	sub	ax,WORD PTR [bp-16]	;tangle
	neg	ax
$L20079:
	mov	WORD PTR [bp-12],ax	;relangle
	push	ax
	push	WORD PTR $S1338_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 1780
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_BaseBracket	ENDP
; Line 1821
	PUBLIC	_DoAICounters
_DoAICounters	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	emsltype = -4
;	difftime = -6
;	enemymissile = 8
;	distnm = 6
;	ainum = 4
; Line 1826
	mov	WORD PTR [bp-6],8	;difftime
; Line 1827
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+42],1
	jg	$I1994
; Line 1828
	mov	WORD PTR [bp-6],-1	;difftime
; Line 1829
	jmp	SHORT $I1998
$I1994:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+42],2
	jne	$I1996
; Line 1830
	mov	WORD PTR [bp-6],14	;difftime
; Line 1831
	jmp	SHORT $I1998
$I1996:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+42],3
	jne	$I1998
; Line 1832
	mov	WORD PTR [bp-6],12	;difftime
; Line 1834
$I1998:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],4
	je	$JCC9813
	jmp	$I1999
$JCC9813:
; Line 1839
	mov	bx,WORD PTR [bp+8]	;enemymissile
	push	WORD PTR [bx+28]
	call	_GetMissilePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	WORD PTR [bp-4],bx	;emsltype
	mov	WORD PTR [bp-2],es
	cmp	WORD PTR es:[bx+22],1
	je	$I2001
	cmp	WORD PTR es:[bx+22],2
	je	$JCC9852
	jmp	$I2000
$JCC9852:
$I2001:
	mov	ax,WORD PTR _Gtime
	test	WORD PTR [bp-6],ax	;difftime
	jne	$I2003
	cmp	WORD PTR [bp+6],1	;distnm
	jne	$I2003
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jne	$I2002
$I2003:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jne	$I2000
	cmp	WORD PTR [bp+6],2	;distnm
	jne	$I2000
$I2002:
; Line 1840
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jne	$I2004
; Line 1841
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR [bp+4]	;ainum
	call	_GetWingName
	add	sp,4
; Line 1842
	mov	ax,OFFSET DGROUP:$SG2005
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 1843
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 1844
; Line 1845
$I2004:
	push	WORD PTR [bp+4]	;ainum
	mov	ax,1
$L20083:
	push	ax
	call	_dropdecoy
	add	sp,4
; Line 1846
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],4
; Line 1847
; Line 1848
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2000:
; Line 1850
	les	bx,DWORD PTR [bp-4]	;emsltype
	cmp	WORD PTR es:[bx+22],3
	je	$I2009
	cmp	WORD PTR es:[bx+22],4
	je	$JCC10009
	jmp	$I2015
$JCC10009:
$I2009:
	cmp	WORD PTR [bp+6],3	;distnm
	jne	$I2011
	mov	ax,WORD PTR _Gtime
	test	WORD PTR [bp-6],ax	;difftime
	jne	$I2011
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jne	$I2010
$I2011:
	cmp	WORD PTR [bp+6],2	;distnm
	je	$JCC10047
	jmp	$I2015
$JCC10047:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	je	$JCC10065
	jmp	$I2015
$JCC10065:
$I2010:
; Line 1851
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jne	$I2012
	cmp	WORD PTR [bp+6],2	;distnm
	jne	$I2012
; Line 1852
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR [bp+4]	;ainum
	call	_GetWingName
	add	sp,4
; Line 1853
	mov	ax,OFFSET DGROUP:$SG2013
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 1854
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 1855
; Line 1856
$I2012:
	push	WORD PTR [bp+4]	;ainum
	mov	ax,2
	jmp	$L20083
	nop	
$I1999:
	cmp	WORD PTR [bp+6],1	;distnm
	je	$I2017
	cmp	WORD PTR [bp+6],3	;distnm
	je	$I2017
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jne	$I2016
$I2017:
	cmp	WORD PTR [bp+6],2	;distnm
	je	$I2015
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jne	$I2015
$I2016:
; Line 1861
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],251
; Line 1862
; Line 1863
$I2015:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DoAICounters	ENDP
; Line 1867
	PUBLIC	_EvadeMissile
_EvadeMissile	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,26
	call	__aNchkstk
	push	di
	push	si
;	enemymissile = -6
;	emsltype = -4
;	cnt = -8
;	dx = -16
;	dy = -24
;	tempangle = -20
;	relangle = -12
;	homedist = -18
;	distnm = -26
;	tenemymissile = -10
;	thomedist = -2
;	ainum = 4
; Line 1877
	mov	WORD PTR [bp-10],0	;tenemymissile
; Line 1878
	mov	WORD PTR [bp-8],0	;cnt
	mov	WORD PTR [bp-6],OFFSET _ss	;enemymissile
	jmp	SHORT $F2032
$I2036:
; Line 1900
	mov	ax,WORD PTR [bx+20]
	sub	ax,16384
	mov	WORD PTR [bp-20],ax	;tempangle
$I2037:
; Line 1904
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR [bp-20]	;tempangle
	sub	ax,WORD PTR _ps[bx+16]
	push	ax
	push	WORD PTR [bp+4]	;ainum
	call	_TurnAIPlaneBy
	add	sp,4
; Line 1906
	mov	ax,1024
	push	ax
	push	WORD PTR [bp+4]	;ainum
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	jne	$I2038
; Line 1908
	push	WORD PTR [bp-6]	;enemymissile
	mov	ax,WORD PTR [bp-18]	;homedist
	jmp	$L20084
$I2038:
; Line 1912
	cmp	WORD PTR [bp-10],0	;tenemymissile
	jne	$I2040
; Line 1913
	mov	ax,WORD PTR [bp-6]	;enemymissile
	mov	WORD PTR [bp-10],ax	;tenemymissile
; Line 1914
	mov	ax,WORD PTR [bp-18]	;homedist
	jmp	SHORT $L20085
	nop	
$I2040:
; Line 1917
	mov	ax,WORD PTR [bp-18]	;homedist
	cmp	WORD PTR [bp-2],ax	;thomedist
	jbe	$I2042
; Line 1918
	mov	cx,WORD PTR [bp-6]	;enemymissile
	mov	WORD PTR [bp-10],cx	;tenemymissile
; Line 1919
$L20085:
	mov	WORD PTR [bp-2],ax	;thomedist
; Line 1920
; Line 1921
$I2042:
; Line 1922
; Line 1923
; Line 1924
	inc	WORD PTR [bp-8]	;cnt
	add	WORD PTR [bp-6],44	;enemymissile
$F2032:
	cmp	WORD PTR [bp-8],28	;cnt
	jl	$JCC10342
	jmp	$FB2034
$JCC10342:
; Line 1879
	mov	bx,WORD PTR [bp-6]	;enemymissile
	cmp	WORD PTR [bx+26],0
	je	$I2042
	mov	ax,WORD PTR [bp+4]	;ainum
	cmp	WORD PTR [bx+38],ax
	jne	$I2042
; Line 1880
	mov	cx,46
	imul	cx
	mov	si,ax
	les	di,DWORD PTR _ptype
	mov	ax,WORD PTR es:[di+10]
	mov	WORD PTR _bv[si+18],ax
; Line 1881
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	si,ax
	mov	ax,WORD PTR _ps[si+8]
	mov	dx,WORD PTR _ps[si+10]
	sub	ax,WORD PTR [bx]
	sbb	dx,WORD PTR [bx+2]
; Line 1882
	mov	cx,WORD PTR _ps[si+12]
	mov	di,WORD PTR _ps[si+14]
	sub	cx,WORD PTR [bx+4]
	sbb	di,WORD PTR [bx+6]
; Line 1894
	push	di
	push	cx
	push	dx
	push	ax
	call	_LDist2D
	add	sp,8
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
	mov	WORD PTR [bp-18],ax	;homedist
; Line 1896
	mov	bx,WORD PTR [bp-6]	;enemymissile
	mov	ax,WORD PTR [bx+20]
	mov	cx,ax
	sub	ax,WORD PTR _ps[si+16]
	mov	WORD PTR [bp-20],ax	;tempangle
; Line 1897
	or	ax,ax
	jl	$JCC10468
	jmp	$I2036
$JCC10468:
; Line 1898
	add	ch,64
	mov	WORD PTR [bp-20],cx	;tempangle
; Line 1899
	jmp	$I2037
$FB2034:
; Line 1926
	cmp	WORD PTR [bp-10],0	;tenemymissile
	je	$I2043
	cmp	WORD PTR _ConfigData+2,1
	je	$I2044
	cmp	WORD PTR _ConfigData+2,2
	jne	$I2043
$I2044:
; Line 1928
	push	WORD PTR [bp-10]	;tenemymissile
	mov	ax,WORD PTR [bp-2]	;thomedist
$L20084:
	shl	ax,1
	mov	cx,95
	sub	dx,dx
	div	cx
	push	ax
	push	WORD PTR [bp+4]	;ainum
	call	_DoAICounters
	add	sp,6
; Line 1929
; Line 1930
$I2043:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_EvadeMissile	ENDP
; Line 1933
	PUBLIC	_DamageAI
_DamageAI	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,88
	call	__aNchkstk
	push	si
;	damageeffect = -86
;	Str = -84
;	tempplane = -4
;	damagenum = -88
;	planenum = 4
; Line 1939
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],32
	je	$JCC10557
	jmp	$EX2046
$JCC10557:
; Line 1942
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FlyCruise
	jne	$I2052
; Line 1943
$L20086:
	push	WORD PTR [bp+4]	;planenum
	call	_AirKill
	add	sp,2
; Line 1944
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1945
; Line 1947
$I2052:
; Line 1948
	mov	WORD PTR [bp-86],0	;damageeffect
; Line 1949
	mov	al,BYTE PTR _Rtime
	and	ax,3
	mov	WORD PTR [bp-88],ax	;damagenum
	or	ax,ax
	jne	$I2054
; Line 1950
	mov	WORD PTR [bp-86],32	;damageeffect
; Line 1951
	cmp	WORD PTR _Night,ax
	jne	$JCC10619
	jmp	$I2065
$JCC10619:
	jmp	SHORT $L20089
$I2054:
	cmp	ax,1
	jne	$I2057
; Line 1964
	mov	WORD PTR [bp-86],64	;damageeffect
; Line 1965
; Line 1966
	jmp	$I2065
	nop	
$I2057:
	cmp	ax,2
	jne	$I2059
; Line 1967
	mov	WORD PTR [bp-86],128	;damageeffect
; Line 1968
$L20089:
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	je	$I2065
	cmp	WORD PTR _bv[bx],OFFSET _FlyCruise
	je	$I2065
; Line 1969
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	or	BYTE PTR _ps[si+24],4
; Line 1970
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
	jmp	SHORT $L20088
	nop	
	nop	
$I2059:
; Line 1981
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _ps[bx+34],0
	jne	$I2063
	cmp	WORD PTR _ps[bx+36],0
	jne	$JCC10716
	jmp	$L20086
$JCC10716:
$I2063:
; Line 1983
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	sub	ax,ax
	mov	WORD PTR _ps[bx+34],ax
	mov	WORD PTR _ps[bx+36],ax
; Line 1984
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	cmp	WORD PTR _bv[si+2],-1
	je	$I2065
	cmp	WORD PTR _bv[si],OFFSET _FlyCruise
	je	$I2065
; Line 1985
	or	BYTE PTR _ps[bx+24],4
; Line 1986
	mov	WORD PTR _bv[si],OFFSET _AIGoHome
; Line 1987
$L20088:
	push	WORD PTR [bp+4]	;planenum
	call	_LetWingmenContinue
	add	sp,2
; Line 1993
	push	WORD PTR [bp+4]	;planenum
	call	_GetAIBase
	add	sp,2
; Line 1994
; Line 1995
; Line 1996
$I2065:
; Line 2000
; Line 2002
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp-86]	;damageeffect
	test	WORD PTR _bv[bx+20],ax
	je	$JCC10806
	jmp	$L20086
$JCC10806:
; Line 2007
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp-86]	;damageeffect
	or	WORD PTR _bv[bx+20],ax
; Line 2008
	mov	ax,20
	push	ax
	mov	ax,5
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	call	_StartASmoke
	add	sp,14
; Line 2009
; Line 2011
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jne	$I2069
; Line 2012
	mov	ax,1
	push	ax
	call	_Speech
	add	sp,2
; Line 2013
	lea	ax,WORD PTR [bp-84]	;Str
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_GetWingName
	add	sp,4
; Line 2014
	cmp	WORD PTR [bp-88],0	;damagenum
	jne	$I2071
; Line 2015
	mov	ax,OFFSET DGROUP:$SG2072
	jmp	SHORT $L20087
	nop	
$I2071:
	cmp	WORD PTR [bp-88],1	;damagenum
	jne	$I2074
; Line 2017
	mov	ax,OFFSET DGROUP:$SG2075
	jmp	SHORT $L20087
	nop	
$I2074:
	cmp	WORD PTR [bp-88],2	;damagenum
	jne	$I2077
; Line 2019
	mov	ax,OFFSET DGROUP:$SG2078
	jmp	SHORT $L20087
	nop	
$I2077:
; Line 2021
	mov	ax,OFFSET DGROUP:$SG2080
$L20087:
	push	ax
	lea	ax,WORD PTR [bp-84]	;Str
	push	ax
	call	_strcat
	add	sp,4
; Line 2022
	mov	ax,3
	push	ax
	lea	ax,WORD PTR [bp-84]	;Str
	push	ax
	call	_Message
	add	sp,4
; Line 2023
; Line 2025
$I2069:
; Line 2026
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-4],ax	;tempplane
	mov	WORD PTR [bp-2],dx
	inc	ax
	inc	ax
	push	dx
	push	ax
	mov	ax,OFFSET _Txt
	push	ds
	push	ax
	call	__fstrcpy
	add	sp,8
; Line 2027
	mov	ax,OFFSET DGROUP:$SG2082
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2028
$EX2046:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_DamageAI	ENDP
; Line 2031
	PUBLIC	_GetSortInfo
_GetSortInfo	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,90
	call	__aNchkstk
	push	di
	push	si
;	cnt = -16
;	wingcnt = -52
;	cnt2 = -20
;	tempsort = -76
;	tempother = -38
;	tempme = -36
;	prewing = -72
;	x = -42
;	y = -50
;	dx = -70
;	dy = -74
;	tpitch = -68
;	tangle = -60
;	enemyalt = -90
;	rangle = -48
;	rrangle = -58
;	winghead = -34
;	rangle1 = -56
;	rrangle1 = -66
;	tangle1 = -64
;	tdist = -40
;	tdist1 = -46
;	tdistnm = -12
;	tdistnm1 = -14
;	targnm = -44
;	aihead = -62
;	targetnum = -32
;	rangarray = -30
;	distarray = -10
;	numarray = -88
;	rangtemp = -78
;	disttemp = -54
;	numtemp = -18
;	ainum = 4
; Line 2046
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I2118
; Line 2047
	mov	ax,OFFSET DGROUP:$SG2119
$L20090:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2048
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 2049
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 2050
; Line 2051
$I2118:
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-42],ax	;x
; Line 2052
	mov	cx,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-50],cx	;y
; Line 2053
	mov	dx,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-62],dx	;aihead
; Line 2054
	mov	dx,ax
	mov	ax,46
	mov	bx,dx
	imul	WORD PTR [bp+4]	;ainum
	mov	si,ax
	mov	ax,WORD PTR _bv[si+10]
	mov	WORD PTR [bp-32],ax	;targetnum
; Line 2055
	mov	si,40
	imul	si
	mov	si,ax
	sub	bx,WORD PTR _ps[si+2]
	neg	bx
	mov	WORD PTR [bp-70],bx	;dx
; Line 2056
	sub	cx,WORD PTR _ps[si+4]
	neg	cx
	mov	WORD PTR [bp-74],cx	;dy
; Line 2057
	sub	ax,ax
	push	ax
	lea	ax,WORD PTR [bp-90]	;enemyalt
	push	ax
	lea	ax,WORD PTR [bp-12]	;tdistnm
	push	ax
	lea	dx,WORD PTR [bp-60]	;tangle
	push	dx
	lea	dx,WORD PTR [bp-68]	;tpitch
	push	dx
	lea	dx,WORD PTR [bp-46]	;tdist1
	push	dx
	push	cx
	push	bx
	push	WORD PTR [bp+4]	;ainum
	call	_GetTargADP
	add	sp,18
; Line 2058
	cmp	WORD PTR [bp-12],5	;tdistnm
	ja	$I2120
; Line 2059
	mov	ax,OFFSET DGROUP:$SG2121
	jmp	$L20090
; Line 2062
; Line 2063
	nop	
$I2120:
; Line 2065
	mov	ax,WORD PTR [bp-60]	;tangle
	sub	ax,WORD PTR [bp-62]	;aihead
	mov	WORD PTR [bp-48],ax	;rangle
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,14336
	jle	$I2124
	cmp	WORD PTR [bp-12],20	;tdistnm
	ja	$I2125
$I2124:
	cmp	WORD PTR [bp-12],80	;tdistnm
	ja	$I2125
	mov	ax,40
	imul	WORD PTR [bp-32]	;targetnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2125
	test	cl,2
	je	$I2125
	cmp	WORD PTR _ps[bx+26],0
	jne	$I2122
$I2125:
; Line 2066
	mov	ax,OFFSET DGROUP:$SG2126
	jmp	$L20090
; Line 2069
; Line 2070
	nop	
$I2122:
	mov	ax,WORD PTR [bp-12]	;tdistnm
	mov	WORD PTR [bp-44],ax	;targnm
; Line 2071
	mov	WORD PTR [bp-16],0	;cnt
$FC2128:
; Line 2074
	mov	ax,-1
	mov	si,WORD PTR [bp-16]	;cnt
	shl	si,1
	mov	WORD PTR [bp-30][si],ax
	mov	WORD PTR [bp-10][si],ax
	mov	WORD PTR [bp-88][si],ax
; Line 2075
	inc	WORD PTR [bp-16]	;cnt
	cmp	WORD PTR [bp-16],5	;cnt
	jl	$FC2128
; Line 2078
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR [bp-32],ax	;targetnum
	push	ax
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-72],ax	;prewing
	mov	WORD PTR [bp-52],ax	;wingcnt
; Line 2079
	mov	WORD PTR [bp-16],0	;cnt
; Line 2080
	jmp	$L20093
	nop	
$FC2134:
; Line 2082
	mov	ax,40
	imul	WORD PTR [bp-52]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR [bp-42]	;x
	mov	WORD PTR [bp-70],ax	;dx
; Line 2083
	mov	cx,WORD PTR _ps[bx+4]
	sub	cx,WORD PTR [bp-50]	;y
	mov	WORD PTR [bp-74],cx	;dy
; Line 2084
	sub	dx,dx
	push	dx
	lea	dx,WORD PTR [bp-90]	;enemyalt
	push	dx
	lea	dx,WORD PTR [bp-12]	;tdistnm
	push	dx
	lea	bx,WORD PTR [bp-60]	;tangle
	push	bx
	lea	si,WORD PTR [bp-68]	;tpitch
	push	si
	lea	si,WORD PTR [bp-40]	;tdist
	push	si
	push	cx
	push	ax
	push	WORD PTR [bp+4]	;ainum
	call	_GetTargADP
	add	sp,18
; Line 2085
	mov	ax,WORD PTR [bp-12]	;tdistnm
	sub	ax,WORD PTR [bp-44]	;targnm
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,30
	jge	$I2136
; Line 2087
	mov	ax,WORD PTR [bp-60]	;tangle
	sub	ax,WORD PTR [bp-62]	;aihead
	mov	WORD PTR [bp-48],ax	;rangle
	mov	di,WORD PTR [bp-16]	;cnt
	shl	di,1
	mov	WORD PTR [bp-30][di],ax
; Line 2088
	mov	ax,WORD PTR [bp-40]	;tdist
	mov	WORD PTR [bp-10][di],ax
; Line 2089
	mov	ax,WORD PTR [bp-52]	;wingcnt
	mov	WORD PTR [bp-88][di],ax
; Line 2090
	inc	WORD PTR [bp-16]	;cnt
; Line 2091
; Line 2092
$I2136:
	mov	ax,46
	imul	WORD PTR [bp-52]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-52],ax	;wingcnt
; Line 2093
$L20092:
	cmp	WORD PTR [bp-52],0	;wingcnt
	jl	$JCC11483
	jmp	$FC2134
$JCC11483:
; Line 2095
	mov	ax,46
	imul	WORD PTR [bp-72]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-72],ax	;prewing
	mov	WORD PTR [bp-52],ax	;wingcnt
; Line 2096
$L20093:
	or	ax,ax
	jge	$L20092
; Line 2097
	cmp	WORD PTR [bp-16],1	;cnt
	jg	$I2137
; Line 2098
	mov	ax,OFFSET DGROUP:$SG2138
	jmp	$L20090
; Line 2101
; Line 2102
$I2137:
	mov	WORD PTR [bp-20],0	;cnt2
	jmp	SHORT $F2139
; Line 2118
	nop	
$FC2140:
	inc	WORD PTR [bp-20]	;cnt2
$F2139:
	cmp	WORD PTR [bp-20],4	;cnt2
	jge	$FB2141
; Line 2103
	mov	WORD PTR [bp-16],0	;cnt
; Line 2104
$FC2143:
	cmp	WORD PTR [bp-16],4	;cnt
	jge	$FC2140
	mov	si,WORD PTR [bp-16]	;cnt
	shl	si,1
	cmp	WORD PTR [bp-86][si],-1
	je	$FC2140
; Line 2105
	mov	ax,WORD PTR [bp-30][si]
	cmp	WORD PTR [bp-28][si],ax
	jge	$I2145
; Line 2106
	mov	WORD PTR [bp-78],ax	;rangtemp
; Line 2107
	mov	ax,WORD PTR [bp-10][si]
	mov	WORD PTR [bp-54],ax	;disttemp
; Line 2108
	mov	ax,WORD PTR [bp-88][si]
	mov	WORD PTR [bp-18],ax	;numtemp
; Line 2109
	mov	ax,WORD PTR [bp-28][si]
	mov	WORD PTR [bp-30][si],ax
; Line 2110
	mov	ax,WORD PTR [bp-8][si]
	mov	WORD PTR [bp-10][si],ax
; Line 2111
	mov	ax,WORD PTR [bp-86][si]
	mov	WORD PTR [bp-88][si],ax
; Line 2112
	mov	ax,WORD PTR [bp-78]	;rangtemp
	mov	WORD PTR [bp-28][si],ax
; Line 2113
	mov	ax,WORD PTR [bp-54]	;disttemp
	mov	WORD PTR [bp-8][si],ax
; Line 2114
	mov	ax,WORD PTR [bp-18]	;numtemp
	mov	WORD PTR [bp-86][si],ax
; Line 2115
; Line 2116
$I2145:
	inc	WORD PTR [bp-16]	;cnt
; Line 2117
	jmp	SHORT $FC2143
	nop	
$FB2141:
; Line 2119
	push	WORD PTR [bp-32]	;targetnum
	lea	ax,WORD PTR [bp-10]	;distarray
	push	ax
	lea	ax,WORD PTR [bp-88]	;numarray
	push	ax
	lea	ax,WORD PTR [bp-30]	;rangarray
	push	ax
	call	_GiveSortInfo
	add	sp,8
; Line 2120
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetSortInfo	ENDP
; Line 2123
	PUBLIC	_GiveSortInfo
_GiveSortInfo	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	si
;	tempme = -4
;	tempother = -2
;	tempsort = -6
;	targetnum = 10
;	distarray = 8
;	numarray = 6
;	rangarray = 4
; Line 2126
	mov	bx,WORD PTR [bp+6]	;numarray
	cmp	WORD PTR [bx+4],-1
	je	$JCC11671
	jmp	$I2154
$JCC11671:
; Line 2127
	mov	si,WORD PTR [bp+8]	;distarray
	mov	ax,WORD PTR [si]
	sub	ax,WORD PTR [si+2]
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,10
	jge	$I2155
; Line 2128
	mov	bx,WORD PTR [bp+6]	;numarray
	mov	ax,WORD PTR [bp+10]	;targetnum
	cmp	WORD PTR [bx],ax
	jne	$I2156
; Line 2129
	mov	ax,OFFSET DGROUP:$SG2157
$L20094:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2130
$L20095:
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 2131
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2156:
; Line 2134
	mov	ax,OFFSET DGROUP:$SG2159
	jmp	SHORT $L20094
	nop	
$I2155:
; Line 2140
	mov	bx,WORD PTR [bp+6]	;numarray
	mov	ax,WORD PTR [bp+10]	;targetnum
	cmp	WORD PTR [bx],ax
	jne	$I2161
; Line 2141
	mov	WORD PTR [bp-4],0	;tempme
; Line 2142
	mov	WORD PTR [bp-2],1	;tempother
; Line 2143
; Line 2144
	jmp	SHORT $I2162
$I2161:
; Line 2145
	mov	WORD PTR [bp-4],1	;tempme
; Line 2146
	mov	WORD PTR [bp-2],0	;tempother
; Line 2147
$I2162:
; Line 2148
	mov	bx,WORD PTR [bp-4]	;tempme
	shl	bx,1
	mov	si,WORD PTR [bp+8]	;distarray
	mov	ax,WORD PTR [bx][si]
	mov	bx,WORD PTR [bp-2]	;tempother
	shl	bx,1
	cmp	WORD PTR [bx][si],ax
	jle	$I2163
; Line 2149
	mov	ax,OFFSET DGROUP:$SG2164
	jmp	SHORT $L20094
$I2163:
; Line 2154
	mov	ax,OFFSET DGROUP:$SG2166
	jmp	SHORT $L20094
	nop	
$I2154:
	cmp	WORD PTR [bx+6],-1
	je	$JCC11812
	jmp	$I2168
$JCC11812:
; Line 2161
	mov	bx,WORD PTR [bp+4]	;rangarray
	mov	ax,WORD PTR [bx+4]
	sub	ax,WORD PTR [bx+2]
	push	ax
	call	_abs
	add	sp,2
	mov	bx,WORD PTR [bp+4]	;rangarray
	mov	cx,WORD PTR [bx]
	sub	cx,WORD PTR [bx+2]
	push	cx
	mov	si,ax
	call	_abs
	add	sp,2
	cmp	ax,si
	jge	$I2169
; Line 2162
	mov	WORD PTR [bp-6],0	;tempsort
; Line 2163
	jmp	SHORT $I2170
	nop	
$I2169:
; Line 2164
	mov	WORD PTR [bp-6],1	;tempsort
$I2170:
; Line 2165
	mov	bx,WORD PTR [bp+6]	;numarray
	mov	ax,WORD PTR [bp+10]	;targetnum
	cmp	WORD PTR [bx+2],ax
	je	$I2171
; Line 2166
	cmp	WORD PTR [bx],ax
	jne	$I2172
; Line 2167
	mov	ax,OFFSET DGROUP:$SG2173
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2168
	mov	WORD PTR [bp-4],0	;tempme
; Line 2169
; Line 2170
	jmp	SHORT $I2174
	nop	
$I2172:
; Line 2171
	mov	ax,OFFSET DGROUP:$SG2175
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2172
	mov	WORD PTR [bp-4],2	;tempme
; Line 2173
$I2174:
; Line 2174
	cmp	WORD PTR [bp-6],0	;tempsort
	je	$JCC11927
	jmp	$L20095
$JCC11927:
; Line 2175
	mov	bx,WORD PTR [bp-4]	;tempme
	shl	bx,1
	mov	si,WORD PTR [bp+8]	;distarray
	mov	ax,WORD PTR [si+2]
	cmp	WORD PTR [bx][si],ax
	jge	$I2177
; Line 2176
	mov	ax,OFFSET DGROUP:$SG2178
	jmp	$L20094
	nop	
$I2177:
; Line 2179
	mov	ax,OFFSET DGROUP:$SG2180
	jmp	$L20094
$I2171:
; Line 2186
	cmp	WORD PTR [bp-6],0	;tempsort
	je	$I2182
; Line 2187
	mov	ax,OFFSET DGROUP:$SG2183
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2188
	mov	WORD PTR [bp-2],0	;tempother
; Line 2189
; Line 2190
	jmp	SHORT $I2184
	nop	
$I2182:
; Line 2191
	mov	ax,OFFSET DGROUP:$SG2185
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2192
	mov	WORD PTR [bp-2],1	;tempother
; Line 2193
$I2184:
; Line 2194
	mov	bx,WORD PTR [bp-2]	;tempother
	shl	bx,1
	mov	si,WORD PTR [bp+8]	;distarray
	mov	ax,WORD PTR [si+2]
	cmp	WORD PTR [bx][si],ax
	jle	$I2186
; Line 2195
	mov	ax,OFFSET DGROUP:$SG2187
	jmp	$L20094
$I2186:
; Line 2198
	mov	ax,OFFSET DGROUP:$SG2189
	jmp	$L20094
$I2168:
; Line 2205
	mov	ax,WORD PTR [bp+10]	;targetnum
	cmp	WORD PTR [bx],ax
	jne	$I2191
; Line 2206
	mov	WORD PTR [bp-4],0	;tempme
; Line 2207
	mov	WORD PTR [bp-2],1	;tempother
; Line 2208
	mov	ax,OFFSET DGROUP:$SG2192
	jmp	SHORT $L20097
$I2191:
	cmp	WORD PTR [bx+2],ax
	jne	$I2194
; Line 2211
	mov	WORD PTR [bp-4],1	;tempme
; Line 2212
	mov	WORD PTR [bp-2],0	;tempother
; Line 2213
	mov	ax,OFFSET DGROUP:$SG2195
	jmp	SHORT $L20097
$I2194:
	cmp	WORD PTR [bx+4],ax
	jne	$I2197
; Line 2216
	mov	WORD PTR [bp-4],2	;tempme
; Line 2217
	mov	WORD PTR [bp-2],3	;tempother
; Line 2218
	mov	ax,OFFSET DGROUP:$SG2198
	jmp	SHORT $L20097
$I2197:
	cmp	WORD PTR [bx+6],ax
	jne	$I2200
; Line 2221
	mov	WORD PTR [bp-4],3	;tempme
; Line 2222
	mov	WORD PTR [bp-2],2	;tempother
; Line 2223
	mov	ax,OFFSET DGROUP:$SG2201
$L20097:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2224
; Line 2225
$I2200:
	mov	bx,WORD PTR [bp-4]	;tempme
	shl	bx,1
	mov	si,WORD PTR [bp+8]	;distarray
	mov	ax,WORD PTR [bx][si]
	mov	bx,WORD PTR [bp-2]	;tempother
	shl	bx,1
	cmp	WORD PTR [bx][si],ax
	jle	$I2202
; Line 2226
	mov	ax,OFFSET DGROUP:$SG2203
	jmp	$L20094
$I2202:
; Line 2231
	mov	ax,OFFSET DGROUP:$SG2205
	jmp	$L20094

_GiveSortInfo	ENDP
; Line 2246
	PUBLIC	_SetUpCAP1
_SetUpCAP1	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
	push	di
	push	si
;	othersec = -14
;	prewing = -10
;	xval = -4
;	yval = -8
;	zval = -12
; Line 2254
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	push	ax
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-10],ax	;prewing
; Line 2256
	call	_CheckCAP
; Line 2258
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+14],-1
	je	$I2213
; Line 2259
	lea	ax,WORD PTR [bp-12]	;zval
	push	ax
	lea	ax,WORD PTR [bp-8]	;yval
	push	ax
	lea	cx,WORD PTR [bp-4]	;xval
	push	cx
	push	WORD PTR _bv[bx+14]
	call	_GetWayXYZ
	add	sp,8
; Line 2260
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-4]	;xval
	mov	dx,WORD PTR [bp-2]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 2261
	mov	ax,WORD PTR [bp-8]	;yval
	mov	dx,WORD PTR [bp-6]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 2262
; Line 2264
$I2213:
	mov	ax,338
	push	ax
	mov	ax,90
	push	ax
	mov	ax,6250
	push	ax
	call	_SetUpOval1
	add	sp,6
	or	ax,ax
	jne	$JCC12281
	jmp	$I2214
$JCC12281:
; Line 2265
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+8],-1
	jg	$JCC12300
	jmp	$I2215
$JCC12300:
; Line 2266
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-14],ax	;othersec
; Line 2267
	mov	cx,28800
	sub	dx,dx
	push	dx
	push	cx
	mov	si,WORD PTR _bv[bx+38]
	add	si,16384
	push	si
	mov	si,ax
	call	_sinXL
	add	sp,6
	mov	cx,46
	mov	bx,ax
	mov	ax,si
	mov	si,dx
	imul	cx
	mov	di,ax
	add	WORD PTR _bv[di+30],bx
	adc	WORD PTR _bv[di+32],si
; Line 2268
	mov	ax,28800
	cwd	
	push	dx
	push	ax
	mov	ax,cx
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+38]
	add	ah,64
	push	ax
	call	_cosXL
	add	sp,6
	mov	cx,ax
	mov	ax,46
	mov	bx,dx
	imul	WORD PTR [bp-14]	;othersec
	mov	si,ax
	sub	WORD PTR _bv[si+34],cx
	sbb	WORD PTR _bv[si+36],bx
; Line 2269
	cmp	WORD PTR _bv[si+4],-1
	jle	$I2216
; Line 2270
	mov	ax,28800
	cwd	
	push	dx
	push	ax
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+38]
	add	ah,64
	push	ax
	call	_sinXL
	add	sp,6
	mov	cx,ax
	mov	ax,46
	mov	bx,dx
	imul	WORD PTR _bv[si+4]
	mov	di,ax
	add	WORD PTR _bv[di+30],cx
	adc	WORD PTR _bv[di+32],bx
; Line 2271
	mov	ax,28800
	cwd	
	push	dx
	push	ax
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+38]
	add	ah,64
	push	ax
	call	_cosXL
	add	sp,6
	mov	cx,ax
	mov	ax,46
	mov	bx,dx
	imul	WORD PTR _bv[si+4]
	mov	si,ax
	sub	WORD PTR _bv[si+34],cx
	sbb	WORD PTR _bv[si+36],bx
; Line 2272
; Line 2273
$I2216:
; Line 2274
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,-999
	mov	WORD PTR _bv[bx+8],ax
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp-14]	;othersec
	mov	bx,ax
	mov	WORD PTR _bv[bx+6],cx
; Line 2275
	mov	WORD PTR _bv[bx],OFFSET _SetUpCAP1
; Line 2276
; Line 2277
$I2215:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _SetUpCAP2
; Line 2278
; Line 2280
$I2214:
	mov	ax,WORD PTR [bp-10]	;prewing
	cmp	WORD PTR $S1338_i,ax
	je	$I2217
	inc	ax
	je	$I2217
; Line 2281
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 2282
	or	BYTE PTR _bv[bx+21],64
; Line 2283
	mov	WORD PTR _bv[bx+28],88
; Line 2284
; Line 2286
$I2217:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_SetUpCAP1	ENDP
; Line 2289
	PUBLIC	_SetUpOval1
_SetUpOval1	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,46
	call	__aNchkstk
;	altval = -6
;	headval = -12
;	attack = -16
;	launch = -26
;	wpflag = -4
;	dx = -38
;	dy = -42
;	dalt = -14
;	temphead = -20
;	temphead2 = -24
;	relangle = -22
;	rrelangle = -36
;	enemyhead = -2
;	tangle = -30
;	tpitch = -34
;	troll = -40
;	enemyalt = -46
;	tdist = -18
;	distnm = -44
;	distkm = -32
;	behavenum = -28
;	formnum = -10
;	speedval = -8
;	ovallength = 8
;	ovalwidth = 6
;	ovalheight = 4
; Line 2300
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+30]
	mov	dx,WORD PTR _bv[bx+32]
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
	mov	WORD PTR [bp-38],ax	;dx
; Line 2301
	mov	ax,WORD PTR _bv[bx+34]
	mov	dx,WORD PTR _bv[bx+36]
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
	mov	WORD PTR [bp-42],ax	;dy
; Line 2303
	lea	ax,WORD PTR [bp-4]	;wpflag
	push	ax
	lea	ax,WORD PTR [bp-26]	;launch
	push	ax
	lea	ax,WORD PTR [bp-16]	;attack
	push	ax
	lea	ax,WORD PTR [bp-12]	;headval
	push	ax
	lea	dx,WORD PTR [bp-6]	;altval
	push	dx
	lea	dx,WORD PTR [bp-8]	;speedval
	push	dx
	lea	dx,WORD PTR [bp-10]	;formnum
	push	dx
	lea	dx,WORD PTR [bp-28]	;behavenum
	push	dx
	push	WORD PTR _bv[bx+14]
	call	_GetWayPointChanges
	add	sp,18
; Line 2305
	cmp	WORD PTR [bp-12],-1	;headval
	je	$I2245
; Line 2306
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-12]	;headval
	mov	WORD PTR _bv[bx+38],ax
; Line 2308
$I2245:
	cmp	WORD PTR [bp-6],-1	;altval
	je	$I2246
; Line 2309
	mov	ax,WORD PTR [bp-6]	;altval
	jmp	SHORT $L20098
	nop	
$I2246:
; Line 2311
	mov	ax,WORD PTR [bp+4]	;ovalheight
$L20098:
	mov	WORD PTR [bp-14],ax	;dalt
; Line 2313
	cmp	WORD PTR [bp-8],-1	;speedval
	je	$I2248
; Line 2314
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-8]	;speedval
	mov	WORD PTR _bv[bx+18],ax
; Line 2316
$I2248:
; Line 2317
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+38]
	mov	WORD PTR [bp-20],ax	;temphead
	add	ah,64
	mov	WORD PTR [bp-24],ax	;temphead2
; Line 2318
	push	WORD PTR [bp+6]	;ovalwidth
	push	ax
	call	_sinX
	add	sp,4
	add	WORD PTR [bp-38],ax	;dx
; Line 2319
	push	WORD PTR [bp+6]	;ovalwidth
	push	WORD PTR [bp-24]	;temphead2
	call	_cosX
	add	sp,4
	sub	WORD PTR [bp-42],ax	;dy
; Line 2320
	mov	ax,WORD PTR [bp-20]	;temphead
	add	ah,128
	mov	WORD PTR [bp-24],ax	;temphead2
; Line 2321
	push	WORD PTR [bp+8]	;ovallength
	push	ax
	call	_sinX
	add	sp,4
	add	WORD PTR [bp-38],ax	;dx
; Line 2324
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-14]	;dalt
	push	WORD PTR [bp+8]	;ovallength
	push	WORD PTR [bp-24]	;temphead2
	call	_cosX
	add	sp,4
	sub	WORD PTR [bp-42],ax	;dy
	push	WORD PTR [bp-42]	;dy
	push	WORD PTR [bp-38]	;dx
	call	_FlyTo
	add	sp,8
	or	ax,ax
	je	$I2251
; Line 2325
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 2326
; Line 2338
$I2251:
	sub	ax,ax
; Line 2340
	mov	sp,bp
	pop	bp
	ret	

_SetUpOval1	ENDP
; Line 2343
	PUBLIC	_SetUpCAP2
_SetUpCAP2	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
;	dx = -10
;	dy = -12
;	dalt = -4
;	temphead = -6
;	temphead2 = -8
;	wingnum = -2
; Line 2348
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
; Line 2350
	call	_CheckCAP
; Line 2352
	mov	WORD PTR [bp-2],-999	;wingnum
; Line 2353
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jle	$I2259
; Line 2354
	mov	ax,WORD PTR _bv[bx+2]
	jmp	SHORT $L20099
	nop	
$I2259:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+4],-1
	jle	$I2261
; Line 2356
	mov	ax,WORD PTR _bv[bx+4]
$L20099:
	mov	WORD PTR [bp-2],ax	;wingnum
; Line 2357
$I2261:
	mov	ax,338
	push	ax
	mov	ax,90
	push	ax
	mov	ax,6250
	push	ax
	call	_SetUpOval2
	add	sp,6
	or	ax,ax
	jne	$JCC13007
	jmp	$I2266
$JCC13007:
; Line 2358
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _CAPLeg1
; Line 2359
	push	WORD PTR $S1338_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I2263
; Line 2360
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _SetUpCAP3
; Line 2361
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR $S1338_i
	call	_GetWingName
	add	sp,4
; Line 2362
	mov	ax,OFFSET DGROUP:$SG2264
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2363
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 2364
; Line 2365
$I2263:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],300
; Line 2366
	test	BYTE PTR _bv[bx+20],32
	jne	$I2265
; Line 2367
	or	BYTE PTR _bv[bx+21],1
; Line 2368
$I2265:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],253
; Line 2369
	cmp	WORD PTR _bv[bx+4],-1
	jle	$I2266
; Line 2370
	mov	ax,46
	imul	WORD PTR [bp-2]	;wingnum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _SetUpCAP3
; Line 2371
	mov	WORD PTR _bv[bx+18],400
; Line 2372
	test	BYTE PTR _bv[bx+20],32
	jne	$I2267
; Line 2373
	or	BYTE PTR _bv[bx+21],1
; Line 2374
$I2267:
	mov	ax,46
	imul	WORD PTR [bp-2]	;wingnum
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],253
; Line 2375
; Line 2376
$I2266:
; Line 2379
	mov	sp,bp
	pop	bp
	ret	

_SetUpCAP2	ENDP
; Line 2382
	PUBLIC	_SetUpOval2
_SetUpOval2	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,28
	call	__aNchkstk
;	dx = -26
;	dy = -28
;	dalt = -14
;	temphead = -18
;	temphead2 = -20
;	wingnum = -12
;	behavenum = -24
;	formnum = -8
;	speedval = -6
;	altval = -4
;	headval = -10
;	attack = -16
;	launch = -22
;	wpflag = -2
;	ovallength = 8
;	ovalwidth = 6
;	ovalheight = 4
; Line 2391
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+30]
	mov	dx,WORD PTR _bv[bx+32]
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
	mov	WORD PTR [bp-26],ax	;dx
; Line 2392
	mov	ax,WORD PTR _bv[bx+34]
	mov	dx,WORD PTR _bv[bx+36]
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
	mov	WORD PTR [bp-28],ax	;dy
; Line 2394
	lea	ax,WORD PTR [bp-2]	;wpflag
	push	ax
	lea	ax,WORD PTR [bp-22]	;launch
	push	ax
	lea	ax,WORD PTR [bp-16]	;attack
	push	ax
	lea	ax,WORD PTR [bp-10]	;headval
	push	ax
	lea	ax,WORD PTR [bp-4]	;altval
	push	ax
	lea	cx,WORD PTR [bp-6]	;speedval
	push	cx
	lea	cx,WORD PTR [bp-8]	;formnum
	push	cx
	lea	cx,WORD PTR [bp-24]	;behavenum
	push	cx
	push	WORD PTR _bv[bx+14]
	call	_GetWayPointChanges
	add	sp,18
; Line 2395
	cmp	WORD PTR [bp-4],-1	;altval
	je	$I2286
; Line 2396
	mov	ax,WORD PTR [bp-4]	;altval
	jmp	SHORT $L20100
	nop	
$I2286:
; Line 2398
	mov	ax,WORD PTR [bp+4]	;ovalheight
$L20100:
	mov	WORD PTR [bp-14],ax	;dalt
; Line 2401
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+38]
	mov	WORD PTR [bp-18],ax	;temphead
	add	ah,64
	mov	WORD PTR [bp-20],ax	;temphead2
; Line 2402
	push	WORD PTR [bp+6]	;ovalwidth
	push	ax
	call	_sinX
	add	sp,4
	add	WORD PTR [bp-26],ax	;dx
; Line 2404
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-14]	;dalt
	push	WORD PTR [bp+6]	;ovalwidth
	push	WORD PTR [bp-20]	;temphead2
	call	_cosX
	add	sp,4
	sub	WORD PTR [bp-28],ax	;dy
	push	WORD PTR [bp-28]	;dy
	push	WORD PTR [bp-26]	;dx
	call	_FlyTo
	add	sp,8
	or	ax,ax
	je	$I2288
; Line 2405
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 2406
; Line 2418
	nop	
$I2288:
	sub	ax,ax
; Line 2419
	mov	sp,bp
	pop	bp
	ret	

_SetUpOval2	ENDP
; Line 2422
	PUBLIC	_SetUpCAP3
_SetUpCAP3	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
;	dx = -8
;	dy = -10
;	dalt = -2
;	temphead = -4
;	temphead2 = -6
; Line 2426
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
; Line 2428
	call	_CheckCAP
; Line 2429
	mov	ax,338
	push	ax
	mov	ax,90
	push	ax
	mov	ax,6250
	push	ax
	call	_SetUpOval3
	add	sp,6
	or	ax,ax
	je	$I2295
; Line 2430
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _CAPTurn2
; Line 2431
$I2295:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_SetUpCAP3	ENDP
; Line 2434
	PUBLIC	_SetUpOval3
_SetUpOval3	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,26
	call	__aNchkstk
;	temphead2 = -18
;	behavenum = -22
;	formnum = -8
;	speedval = -6
;	altval = -4
;	headval = -10
;	attack = -14
;	launch = -20
;	wpflag = -2
;	dx = -24
;	dy = -26
;	dalt = -12
;	temphead = -16
;	ovallength = 8
;	ovalwidth = 6
;	ovalheight = 4
; Line 2442
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+30]
	mov	dx,WORD PTR _bv[bx+32]
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
	mov	WORD PTR [bp-24],ax	;dx
; Line 2443
	mov	ax,WORD PTR _bv[bx+34]
	mov	dx,WORD PTR _bv[bx+36]
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
	mov	WORD PTR [bp-26],ax	;dy
; Line 2445
	lea	ax,WORD PTR [bp-2]	;wpflag
	push	ax
	lea	ax,WORD PTR [bp-20]	;launch
	push	ax
	lea	ax,WORD PTR [bp-14]	;attack
	push	ax
	lea	ax,WORD PTR [bp-10]	;headval
	push	ax
	lea	ax,WORD PTR [bp-4]	;altval
	push	ax
	lea	cx,WORD PTR [bp-6]	;speedval
	push	cx
	lea	cx,WORD PTR [bp-8]	;formnum
	push	cx
	lea	cx,WORD PTR [bp-22]	;behavenum
	push	cx
	push	WORD PTR _bv[bx+14]
	call	_GetWayPointChanges
	add	sp,18
; Line 2446
	cmp	WORD PTR [bp-4],-1	;altval
	je	$I2313
; Line 2447
	mov	ax,WORD PTR [bp-4]	;altval
	jmp	SHORT $L20101
	nop	
$I2313:
; Line 2449
	mov	ax,WORD PTR [bp+4]	;ovalheight
$L20101:
	sub	ax,500
	mov	WORD PTR [bp-12],ax	;dalt
; Line 2451
	cmp	ax,5
	jge	$I2315
; Line 2452
	mov	WORD PTR [bp-12],5	;dalt
; Line 2454
$I2315:
; Line 2455
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+38]
	mov	WORD PTR [bp-16],ax	;temphead
	sub	ax,16384
	mov	WORD PTR [bp-18],ax	;temphead2
; Line 2456
	push	WORD PTR [bp+6]	;ovalwidth
	push	ax
	call	_sinX
	add	sp,4
	add	WORD PTR [bp-24],ax	;dx
; Line 2457
	push	WORD PTR [bp+6]	;ovalwidth
	push	WORD PTR [bp-18]	;temphead2
	call	_cosX
	add	sp,4
	sub	WORD PTR [bp-26],ax	;dy
; Line 2458
	mov	ax,WORD PTR [bp-16]	;temphead
	add	ah,128
	mov	WORD PTR [bp-18],ax	;temphead2
; Line 2459
	push	WORD PTR [bp+8]	;ovallength
	push	ax
	call	_sinX
	add	sp,4
	add	WORD PTR [bp-24],ax	;dx
; Line 2461
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-12]	;dalt
	push	WORD PTR [bp+8]	;ovallength
	push	WORD PTR [bp-18]	;temphead2
	call	_cosX
	add	sp,4
	sub	WORD PTR [bp-26],ax	;dy
	push	WORD PTR [bp-26]	;dy
	push	WORD PTR [bp-24]	;dx
	call	_FlyTo
	add	sp,8
	or	ax,ax
	je	$I2316
; Line 2462
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 2463
; Line 2475
	nop	
$I2316:
	sub	ax,ax
; Line 2476
	mov	sp,bp
	pop	bp
	ret	

_SetUpOval3	ENDP
; Line 2479
	PUBLIC	_CAPTurn1
_CAPTurn1	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__aNchkstk
;	dx = -16
;	dy = -20
;	dalt = -2
;	temphead = -4
;	temphead2 = -6
;	xval = -10
;	yval = -14
;	zval = -18
; Line 2487
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _bv[bx+14],-1
	je	$I2326
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	je	$I2326
	test	BYTE PTR _Rtime,63
	jne	$I2326
; Line 2488
	lea	ax,WORD PTR [bp-18]	;zval
	push	ax
	lea	ax,WORD PTR [bp-14]	;yval
	push	ax
	lea	dx,WORD PTR [bp-10]	;xval
	push	dx
	push	WORD PTR _bv[bx+14]
	call	_GetWayXYZ
	add	sp,8
; Line 2489
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-10]	;xval
	mov	dx,WORD PTR [bp-8]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 2490
	mov	ax,WORD PTR [bp-14]	;yval
	mov	dx,WORD PTR [bp-12]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 2491
; Line 2493
$I2326:
	call	_CheckCAP
; Line 2495
	mov	ax,338
	push	ax
	mov	ax,90
	push	ax
	mov	ax,6250
	push	ax
	call	_OvalTurn1
	add	sp,6
	or	ax,ax
	je	$I2327
; Line 2496
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _CAPLeg2
; Line 2497
; Line 2498
$I2327:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CAPTurn1	ENDP
; Line 2501
	PUBLIC	_OvalTurn1
_OvalTurn1	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,26
	call	__aNchkstk
;	dx = -24
;	dy = -26
;	dalt = -12
;	temphead = -16
;	temphead2 = -18
;	behavenum = -22
;	formnum = -8
;	speedval = -6
;	altval = -4
;	headval = -10
;	attack = -14
;	launch = -20
;	wpflag = -2
;	ovallength = 8
;	ovalwidth = 6
;	ovalheight = 4
; Line 2509
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+30]
	mov	dx,WORD PTR _bv[bx+32]
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
	mov	WORD PTR [bp-24],ax	;dx
; Line 2510
	mov	ax,WORD PTR _bv[bx+34]
	mov	dx,WORD PTR _bv[bx+36]
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
	mov	WORD PTR [bp-26],ax	;dy
; Line 2512
	lea	ax,WORD PTR [bp-2]	;wpflag
	push	ax
	lea	ax,WORD PTR [bp-20]	;launch
	push	ax
	lea	ax,WORD PTR [bp-14]	;attack
	push	ax
	lea	ax,WORD PTR [bp-10]	;headval
	push	ax
	lea	ax,WORD PTR [bp-4]	;altval
	push	ax
	lea	dx,WORD PTR [bp-6]	;speedval
	push	dx
	lea	dx,WORD PTR [bp-8]	;formnum
	push	dx
	lea	dx,WORD PTR [bp-22]	;behavenum
	push	dx
	push	WORD PTR _bv[bx+14]
	call	_GetWayPointChanges
	add	sp,18
; Line 2513
	cmp	WORD PTR [bp-4],-1	;altval
	je	$I2345
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	je	$I2345
; Line 2514
	mov	ax,WORD PTR [bp-4]	;altval
	jmp	SHORT $L20102
$I2345:
; Line 2516
	mov	ax,WORD PTR [bp+4]	;ovalheight
$L20102:
	mov	WORD PTR [bp-12],ax	;dalt
; Line 2518
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jle	$I2347
; Line 2519
	sub	WORD PTR [bp-12],500	;dalt
; Line 2521
$I2347:
	cmp	WORD PTR [bp-12],5	;dalt
	jge	$I2348
; Line 2522
	mov	WORD PTR [bp-12],5	;dalt
; Line 2524
$I2348:
; Line 2525
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+38]
	mov	WORD PTR [bp-16],ax	;temphead
	sub	ax,16384
	mov	WORD PTR [bp-18],ax	;temphead2
; Line 2526
	push	WORD PTR [bp+6]	;ovalwidth
	push	ax
	call	_sinX
	add	sp,4
	add	WORD PTR [bp-24],ax	;dx
; Line 2527
	push	WORD PTR [bp+6]	;ovalwidth
	push	WORD PTR [bp-18]	;temphead2
	call	_cosX
	add	sp,4
	sub	WORD PTR [bp-26],ax	;dy
; Line 2528
	mov	ax,WORD PTR [bp-16]	;temphead
	mov	WORD PTR [bp-18],ax	;temphead2
; Line 2529
	push	WORD PTR [bp+8]	;ovallength
	push	ax
	call	_sinX
	add	sp,4
	add	WORD PTR [bp-24],ax	;dx
; Line 2531
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-12]	;dalt
	push	WORD PTR [bp+8]	;ovallength
	push	WORD PTR [bp-18]	;temphead2
	call	_cosX
	add	sp,4
	sub	WORD PTR [bp-26],ax	;dy
	push	WORD PTR [bp-26]	;dy
	push	WORD PTR [bp-24]	;dx
	call	_FlyTo
	add	sp,8
	or	ax,ax
	je	$I2349
; Line 2532
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 2533
; Line 2545
	nop	
$I2349:
	sub	ax,ax
; Line 2546
	mov	sp,bp
	pop	bp
	ret	

_OvalTurn1	ENDP
; Line 2549
	PUBLIC	_CAPTurn2
_CAPTurn2	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
	push	si
;	dx = -10
;	dy = -12
;	dalt = -4
;	temphead = -6
;	temphead2 = -8
;	wingnum = -2
; Line 2554
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
; Line 2556
	call	_CheckCAP
; Line 2558
	mov	WORD PTR [bp-2],-999	;wingnum
; Line 2559
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jle	$I2357
; Line 2560
	mov	ax,WORD PTR _bv[bx+2]
	jmp	SHORT $L20103
$I2357:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+4],-1
	jle	$I2359
; Line 2562
	mov	ax,WORD PTR _bv[bx+4]
$L20103:
	mov	WORD PTR [bp-2],ax	;wingnum
; Line 2569
$I2359:
	mov	ax,338
	push	ax
	mov	ax,90
	push	ax
	mov	ax,6250
	push	ax
	call	_OvalTurn2
	add	sp,6
	or	ax,ax
	je	$I2365
; Line 2570
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _CAPLeg1
; Line 2571
	cmp	WORD PTR [bp-2],-1	;wingnum
	jle	$I2361
; Line 2572
	mov	ax,46
	imul	WORD PTR [bp-2]	;wingnum
	mov	si,ax
	mov	WORD PTR _bv[si+18],450
; Line 2573
	cmp	WORD PTR _bv[si],OFFSET _CAPLeg1
	jne	$I2361
; Line 2574
	mov	WORD PTR _bv[bx+18],225
; Line 2575
; Line 2576
	jmp	SHORT $I2364
	nop	
	nop	
$I2361:
; Line 2580
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],275
$I2364:
; Line 2582
	push	WORD PTR $S1338_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I2365
; Line 2583
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR $S1338_i
	call	_GetWingName
	add	sp,4
; Line 2584
	mov	ax,OFFSET DGROUP:$SG2366
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2585
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 2586
; Line 2587
$I2365:
; Line 2589
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CAPTurn2	ENDP
; Line 2592
	PUBLIC	_OvalTurn2
_OvalTurn2	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,28
	call	__aNchkstk
;	dx = -26
;	dy = -28
;	dalt = -14
;	temphead = -18
;	temphead2 = -20
;	wingnum = -12
;	behavenum = -24
;	formnum = -8
;	speedval = -6
;	altval = -4
;	headval = -10
;	attack = -16
;	launch = -22
;	wpflag = -2
;	ovallength = 8
;	ovalwidth = 6
;	ovalheight = 4
; Line 2600
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+30]
	mov	dx,WORD PTR _bv[bx+32]
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
	mov	WORD PTR [bp-26],ax	;dx
; Line 2601
	mov	ax,WORD PTR _bv[bx+34]
	mov	dx,WORD PTR _bv[bx+36]
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
	mov	WORD PTR [bp-28],ax	;dy
; Line 2603
	lea	ax,WORD PTR [bp-2]	;wpflag
	push	ax
	lea	ax,WORD PTR [bp-22]	;launch
	push	ax
	lea	ax,WORD PTR [bp-16]	;attack
	push	ax
	lea	ax,WORD PTR [bp-10]	;headval
	push	ax
	lea	ax,WORD PTR [bp-4]	;altval
	push	ax
	lea	dx,WORD PTR [bp-6]	;speedval
	push	dx
	lea	dx,WORD PTR [bp-8]	;formnum
	push	dx
	lea	dx,WORD PTR [bp-24]	;behavenum
	push	dx
	push	WORD PTR _bv[bx+14]
	call	_GetWayPointChanges
	add	sp,18
; Line 2604
	cmp	WORD PTR [bp-4],-1	;altval
	je	$I2385
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	je	$I2385
; Line 2605
	mov	ax,WORD PTR [bp-4]	;altval
	jmp	SHORT $L20105
$I2385:
; Line 2607
	mov	ax,WORD PTR [bp+4]	;ovalheight
$L20105:
	mov	WORD PTR [bp-14],ax	;dalt
; Line 2609
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jle	$I2387
; Line 2610
	sub	WORD PTR [bp-14],500	;dalt
; Line 2612
$I2387:
	cmp	WORD PTR [bp-14],5	;dalt
	jge	$I2388
; Line 2613
	mov	WORD PTR [bp-14],5	;dalt
; Line 2615
$I2388:
; Line 2616
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+38]
	mov	WORD PTR [bp-18],ax	;temphead
	add	ah,64
	mov	WORD PTR [bp-20],ax	;temphead2
; Line 2617
	push	WORD PTR [bp+6]	;ovalwidth
	push	ax
	call	_sinX
	add	sp,4
	add	WORD PTR [bp-26],ax	;dx
; Line 2618
	push	WORD PTR [bp+6]	;ovalwidth
	push	WORD PTR [bp-20]	;temphead2
	call	_cosX
	add	sp,4
	sub	WORD PTR [bp-28],ax	;dy
; Line 2619
	mov	ax,WORD PTR [bp-18]	;temphead
	add	ah,128
	mov	WORD PTR [bp-20],ax	;temphead2
; Line 2620
	push	WORD PTR [bp+8]	;ovallength
	push	ax
	call	_sinX
	add	sp,4
	add	WORD PTR [bp-26],ax	;dx
; Line 2622
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-14]	;dalt
	push	WORD PTR [bp+8]	;ovallength
	push	WORD PTR [bp-20]	;temphead2
	call	_cosX
	add	sp,4
	sub	WORD PTR [bp-28],ax	;dy
	push	WORD PTR [bp-28]	;dy
	push	WORD PTR [bp-26]	;dx
	call	_FlyTo
	add	sp,8
	or	ax,ax
	je	$I2389
; Line 2623
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 2624
; Line 2636
$I2389:
	sub	ax,ax
; Line 2637
	mov	sp,bp
	pop	bp
	ret	

_OvalTurn2	ENDP
; Line 2640
	PUBLIC	_CAPLeg1
_CAPLeg1	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	wingnum = -2
; Line 2643
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
; Line 2645
	call	_CheckCAP
; Line 2647
	mov	ax,450
	push	ax
	mov	ax,338
	push	ax
	mov	ax,90
	push	ax
	mov	ax,6250
	push	ax
	sub	ax,ax
	push	ax
	call	_CAPAI
	add	sp,10
	or	ax,ax
	jne	$JCC14803
	jmp	$I2398
$JCC14803:
; Line 2648
	mov	WORD PTR [bp-2],-999	;wingnum
; Line 2649
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jle	$I2393
; Line 2650
	mov	ax,WORD PTR _bv[bx+2]
	jmp	SHORT $L20106
	nop	
$I2393:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+4],-1
	jle	$I2395
; Line 2652
	mov	ax,WORD PTR _bv[bx+4]
$L20106:
	mov	WORD PTR [bp-2],ax	;wingnum
; Line 2654
$I2395:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _CAPTurn1
; Line 2656
	cmp	WORD PTR [bp-2],-1	;wingnum
	jle	$I2397
; Line 2657
	mov	ax,46
	imul	WORD PTR [bp-2]	;wingnum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _CAPLeg1
	je	$I2397
; Line 2658
	mov	WORD PTR _bv[bx+18],550
; Line 2659
; Line 2660
$I2397:
; Line 2661
	push	WORD PTR $S1338_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I2398
; Line 2662
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR $S1338_i
	call	_GetWingName
	add	sp,4
; Line 2663
	mov	ax,OFFSET DGROUP:$SG2399
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2664
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
; Line 2665
; Line 2666
$I2398:
; Line 2676
	mov	sp,bp
	pop	bp
	ret	

_CAPLeg1	ENDP
; Line 2679
	PUBLIC	_CAPLeg2
_CAPLeg2	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	wingnum = -2
; Line 2682
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
; Line 2684
	call	_CheckCAP
; Line 2686
	mov	ax,450
	push	ax
	mov	ax,338
	push	ax
	mov	ax,90
	push	ax
	mov	ax,6250
	push	ax
	mov	ax,1
	push	ax
	call	_CAPAI
	add	sp,10
	or	ax,ax
	je	$I2402
; Line 2687
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _CAPTurn2
; Line 2688
; Line 2698
$I2402:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CAPLeg2	ENDP
; Line 2701
	PUBLIC	_CheckCAP
_CheckCAP	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__aNchkstk
	push	si
;	targnum = -20
;	targdist = -4
;	bogeyangle = -18
;	bogeydist = -12
;	oldtarget = -10
;	newtarget = -2
;	dx = -14
;	dy = -16
;	tempplane = -8
; Line 2714
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	mov	cx,40
	imul	cx
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	cmp	WORD PTR es:[bx+38],100
	jne	$I2413
; Line 2715
	push	WORD PTR _planecnt
	call	_CheckE2C
	add	sp,2
; Line 2719
$I2413:
	test	BYTE PTR _Gtime,3
	je	$JCC15085
	jmp	$I2420
$JCC15085:
; Line 2720
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	push	WORD PTR _bv[bx+10]
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-10],ax	;oldtarget
; Line 2721
	mov	ax,1
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR $S1338_i
	call	_AIRadarForwardCheck
	add	sp,6
	or	ax,ax
	jne	$JCC15131
	jmp	$I2420
$JCC15131:
; Line 2722
	mov	WORD PTR _tempgotcha,8
; Line 2723
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	push	WORD PTR _bv[bx+10]
	call	_gotcha
	add	sp,2
; Line 2724
	mov	WORD PTR _tempgotcha,-999
; Line 2731
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	push	WORD PTR _bv[bx+10]
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I2417
	cmp	WORD PTR _targetplayer,0
	jge	$I2417
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _timetargetplayer,ax
	jge	$I2417
; Line 2732
	mov	ax,4
	push	ax
	mov	ax,OFFSET DGROUP:$SG2418
	push	ax
	call	_Message
	add	sp,4
; Line 2734
	mov	ax,WORD PTR _Gtime
	add	ax,8
	mov	WORD PTR _timetargetplayer,ax
; Line 2735
; Line 2737
$I2417:
	push	WORD PTR $S1338_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	je	$JCC15239
	jmp	$I2420
$JCC15239:
; Line 2739
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR [bp-2],ax	;newtarget
	push	ax
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR [bp-10]	;oldtarget
	je	$I2420
; Line 2740
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR [bp-2]	;newtarget
	mov	si,ax
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-14],ax	;dx
; Line 2741
	mov	cx,WORD PTR _ps[si+4]
	sub	cx,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-16],cx	;dy
; Line 2742
	neg	cx
	push	cx
	push	ax
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-18],ax	;bogeyangle
; Line 2743
	push	WORD PTR [bp-16]	;dy
	push	WORD PTR [bp-14]	;dx
	call	_Dist2D
	add	sp,4
	mov	WORD PTR [bp-12],ax	;bogeydist
; Line 2744
	sub	ax,ax
	push	ax
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	push	WORD PTR _bv[bx+10]
	push	WORD PTR [bp-12]	;bogeydist
	push	WORD PTR [bp-18]	;bogeyangle
	sub	ax,ax
	push	ax
	mov	ax,3
	push	ax
	call	_LocationPicture
	add	sp,12
; Line 2745
; Line 2746
$I2420:
; Line 2780
; Line 2781
; Line 2782
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CheckCAP	ENDP
; Line 2785
	PUBLIC	_CAPAI
_CAPAI	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,48
	call	__aNchkstk
	push	di
	push	si
;	enemyhead = -2
;	tangle = -28
;	tpitch = -32
;	troll = -38
;	enemyalt = -48
;	tdist = -20
;	distnm = -46
;	distkm = -30
;	wingman = -6
;	alttemp = -16
;	hangle = -44
;	behavenum = -26
;	formnum = -12
;	speedval = -10
;	altval = -8
;	headval = -14
;	attack = -18
;	launch = -24
;	wpflag = -4
;	dx = -36
;	dy = -40
;	dz = -42
;	relangle = -22
;	rrelangle = -34
;	ovaldist = 12
;	ovallength = 10
;	ovalwidth = 8
;	ovalheight = 6
;	side = 4
; Line 2800
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	si,ax
	mov	ax,WORD PTR _bv[si+30]
	mov	dx,WORD PTR _bv[si+32]
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
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-36],ax	;dx
; Line 2801
	mov	dx,WORD PTR _bv[si+34]
	mov	di,WORD PTR _bv[si+36]
	sar	di,1
	rcr	dx,1
	sar	di,1
	rcr	dx,1
	sar	di,1
	rcr	dx,1
	sar	di,1
	rcr	dx,1
	sar	di,1
	rcr	dx,1
	sub	dx,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-40],dx	;dy
; Line 2803
	sub	bx,bx
	push	bx
	lea	si,WORD PTR [bp-48]	;enemyalt
	push	si
	lea	si,WORD PTR [bp-46]	;distnm
	push	si
	lea	si,WORD PTR [bp-28]	;tangle
	push	si
	lea	di,WORD PTR [bp-32]	;tpitch
	push	di
	lea	di,WORD PTR [bp-20]	;tdist
	push	di
	push	dx
	push	ax
	push	WORD PTR $S1338_i
	call	_GetTargADP
	add	sp,18
; Line 2805
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-28]	;tangle
	sub	ax,WORD PTR _bv[bx+38]
	add	ah,128
	mov	WORD PTR [bp-44],ax	;hangle
; Line 2806
	cmp	WORD PTR [bp+4],0	;side
	je	$I2451
; Line 2807
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	si,ax
	mov	ax,WORD PTR _bv[bx+38]
	sub	ax,WORD PTR _ps[si+16]
	add	ah,128
	jmp	SHORT $L20107
$I2451:
; Line 2810
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	si,ax
	mov	ax,WORD PTR _bv[si+38]
	sub	ax,WORD PTR _ps[bx+16]
$L20107:
	mov	WORD PTR [bp-22],ax	;relangle
; Line 2811
; Line 2813
	mov	ax,WORD PTR [bp-20]	;tdist
	cmp	WORD PTR [bp+12],ax	;ovaldist
	jae	$I2453
; Line 2814
	mov	ax,1
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 2816
$I2453:
	push	WORD PTR [bp-22]	;relangle
	push	WORD PTR $S1338_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 2818
	lea	ax,WORD PTR [bp-4]	;wpflag
	push	ax
	lea	ax,WORD PTR [bp-24]	;launch
	push	ax
	lea	ax,WORD PTR [bp-18]	;attack
	push	ax
	lea	ax,WORD PTR [bp-14]	;headval
	push	ax
	lea	ax,WORD PTR [bp-8]	;altval
	push	ax
	lea	cx,WORD PTR [bp-10]	;speedval
	push	cx
	lea	cx,WORD PTR [bp-12]	;formnum
	push	cx
	lea	cx,WORD PTR [bp-26]	;behavenum
	push	cx
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	push	WORD PTR _bv[bx+14]
	call	_GetWayPointChanges
	add	sp,18
; Line 2819
	cmp	WORD PTR [bp-8],-1	;altval
	je	$I2454
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	je	$I2454
; Line 2820
	mov	ax,WORD PTR [bp-8]	;altval
	jmp	SHORT $L20108
$I2454:
; Line 2822
	mov	ax,WORD PTR [bp+6]	;ovalheight
$L20108:
	mov	WORD PTR [bp-16],ax	;alttemp
; Line 2824
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jle	$I2456
; Line 2825
	sub	WORD PTR [bp-16],500	;alttemp
; Line 2827
$I2456:
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-16]	;alttemp
	cmp	WORD PTR _ps[bx+6],ax
	jge	$I2457
; Line 2829
	mov	WORD PTR _pdest,8192
; Line 2830
; Line 2831
	jmp	SHORT $I2460
	nop	
$I2457:
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-16]	;alttemp
	add	ax,500
	cmp	WORD PTR _ps[bx+6],ax
	jle	$I2459
; Line 2833
	mov	WORD PTR _pdest,-12288
; Line 2834
; Line 2835
	jmp	SHORT $I2460
	nop	
$I2459:
; Line 2836
	mov	WORD PTR _pdest,0
$I2460:
; Line 2838
	sub	ax,ax
; Line 2839
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_CAPAI	ENDP
; Line 2842
	PUBLIC	_FlyTo
_FlyTo	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,30
	call	__aNchkstk
	push	si
;	dx = -20
;	dy = -24
;	dz = -26
;	relangle = -10
;	rrelangle = -18
;	enemyhead = -2
;	tangle = -12
;	tpitch = -16
;	troll = -22
;	enemyalt = -30
;	tdist = -8
;	distnm = -28
;	distkm = -14
;	wingman = -4
;	alttemp = -6
;	ignoredist = 10
;	altdim = 8
;	ydim = 6
;	xdim = 4
; Line 2855
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;xdim
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-20],ax	;dx
; Line 2856
	mov	dx,WORD PTR [bp+6]	;ydim
	sub	dx,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-24],dx	;dy
; Line 2858
	sub	bx,bx
	push	bx
	lea	bx,WORD PTR [bp-30]	;enemyalt
	push	bx
	lea	bx,WORD PTR [bp-28]	;distnm
	push	bx
	lea	bx,WORD PTR [bp-12]	;tangle
	push	bx
	lea	si,WORD PTR [bp-16]	;tpitch
	push	si
	lea	si,WORD PTR [bp-8]	;tdist
	push	si
	push	dx
	push	ax
	push	WORD PTR $S1338_i
	call	_GetTargADP
	add	sp,18
; Line 2862
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-12]	;tangle
	sub	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-10],ax	;relangle
	push	ax
	push	WORD PTR $S1338_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 2866
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR [bp-6],ax	;alttemp
	cmp	ax,WORD PTR [bp+8]	;altdim
	jge	$I2481
; Line 2868
	mov	WORD PTR _pdest,8192
; Line 2869
; Line 2870
	jmp	SHORT $I2484
	nop	
$I2481:
	mov	ax,WORD PTR [bp+8]	;altdim
	add	ax,50
	cmp	ax,WORD PTR [bp-6]	;alttemp
	jge	$I2483
; Line 2872
	mov	WORD PTR _pdest,-12288
; Line 2873
; Line 2874
	jmp	SHORT $I2484
	nop	
$I2483:
; Line 2875
	mov	WORD PTR _pdest,0
$I2484:
; Line 2877
	cmp	WORD PTR [bp-8],20	;tdist
	jae	$I2485
	cmp	WORD PTR [bp+10],0	;ignoredist
	jne	$I2485
; Line 2878
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 2879
; Line 2882
$I2485:
	cmp	WORD PTR _tempvar,0
	je	$I2486
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AIGoHome
	jne	$I2486
; Line 2883
	mov	ax,OFFSET DGROUP:$SG2487
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 2884
	mov	ax,10
	push	ax
	mov	cx,OFFSET DGROUP:_ntmp
	push	cx
	push	WORD PTR $S1338_i
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2885
	mov	ax,OFFSET DGROUP:$SG2488
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2886
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	push	WORD PTR [bp-8]	;tdist
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2889
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 2890
; Line 2892
$I2486:
	sub	ax,ax
; Line 2893
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_FlyTo	ENDP
; Line 2897
	PUBLIC	_TranslateBehavior
_TranslateBehavior	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	returnval = -2
;	formnum = 8
;	behavenum = 6
;	planenum = 4
; Line 2898
	mov	WORD PTR [bp-2],0	;returnval
; Line 2900
	mov	ax,WORD PTR [bp+6]	;behavenum
	jmp	$S2494
; Line 2902
$SC2498:
; Line 2903
	mov	WORD PTR [bp-2],1	;returnval
; Line 2904
	mov	ax,WORD PTR [bp+8]	;formnum
	jmp	$S2499
; Line 2905
	nop	
$SC2503:
; Line 2906
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 2907
	and	BYTE PTR _bv[bx+21],191
; Line 2908
	mov	WORD PTR _bv[bx+28],16
; Line 2909
	jmp	SHORT $L20117
; Line 2916
	nop	
$SD2511:
; Line 2986
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 2987
	and	BYTE PTR _bv[bx+21],191
; Line 2988
$L20118:
	mov	WORD PTR _bv[bx+28],53
; Line 2989
$L20117:
	and	BYTE PTR _bv[bx+21],254
; Line 2990
	or	BYTE PTR _bv[bx+21],2
; Line 2994
	jmp	$SB2495
; Line 2927
$SC2505:
; Line 2928
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 2929
	or	BYTE PTR _bv[bx+21],64
; Line 2930
	mov	WORD PTR _bv[bx+28],88
; Line 2931
	jmp	SHORT $L20117
; Line 2949
	nop	
$SC2507:
; Line 2950
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Ladder
; Line 2951
	jmp	SHORT $L20117
; Line 2958
$SC2508:
; Line 2959
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Box
; Line 2960
	jmp	SHORT $L20117
; Line 2967
$SC2509:
; Line 2968
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Wall
; Line 2969
	jmp	SHORT $L20117
; Line 2976
$SC2510:
; Line 2977
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _GorillaBomb
; Line 2978
	jmp	SHORT $L20117
; Line 2985
$S2499:
	cmp	ax,8
	jbe	$JCC16311
	jmp	$SD2511
$JCC16311:
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20006[bx]
$L20006:
		DW	$SD2511
		DW	$SC2503
		DW	$SD2511
		DW	$SC2505
		DW	$SC2507
		DW	$SC2508
		DW	$SC2509
		DW	$SD2511
		DW	$SC2510
; Line 2999
$SC2519:
; Line 3078
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _SetUpCAP1
	jmp	$L20117
; Line 3008
	nop	
$SC2513:
; Line 3009
	mov	WORD PTR [bp-2],1	;returnval
$SD2522:
; Line 3109
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _FlyWayPoint
	jmp	$L20117
; Line 3018
$SC2514:
; Line 3019
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIBombTarget
; Line 3023
	jmp	$SB2495
; Line 3037
	nop	
$SC2515:
; Line 3038
	mov	WORD PTR [bp-2],1	;returnval
; Line 3039
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _FlyCruise
	jmp	$L20117
; Line 3047
$SC2516:
; Line 3048
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _FlyWPFollowPlayer
	jmp	$L20118
; Line 3057
	nop	
$SC2517:
; Line 3058
	mov	WORD PTR [bp-2],1	;returnval
; Line 3059
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _GorillaCover
	jmp	$L20117
; Line 3067
$SC2518:
; Line 3068
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _SARCAP1
	jmp	$L20117
; Line 3086
	nop	
$SC2520:
; Line 3087
	mov	WORD PTR [bp-2],1	;returnval
; Line 3088
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _SARWait
; Line 3089
	and	BYTE PTR _bv[bx+21],254
; Line 3091
	or	BYTE PTR _bv[bx+21],130
; Line 3092
	mov	WORD PTR _bv[bx+38],5
; Line 3093
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	and	BYTE PTR _ps[bx+25],127
; Line 3097
	jmp	SHORT $SB2495
; Line 3099
$SC2521:
; Line 3100
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _EngageTrain
	jmp	$L20117
; Line 3108
	nop	
$S2494:
	cmp	ax,25
	jbe	$JCC16551
	jmp	$SD2522
$JCC16551:
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20007[bx]
$L20007:
		DW	$SC2519
		DW	$SC2498
		DW	$SC2513
		DW	$SC2514
		DW	$SD2522
		DW	$SC2515
		DW	$SC2520
		DW	$SC2518
		DW	$SC2517
		DW	$SC2516
		DW	$SC2519
		DW	$SD2522
		DW	$SD2522
		DW	$SD2522
		DW	$SD2522
		DW	$SD2522
		DW	$SD2522
		DW	$SD2522
		DW	$SD2522
		DW	$SD2522
		DW	$SD2522
		DW	$SD2522
		DW	$SD2522
		DW	$SD2522
		DW	$SD2522
		DW	$SC2521
$SB2495:
; Line 3119
	mov	ax,WORD PTR [bp-2]	;returnval
; Line 3120
	mov	sp,bp
	pop	bp
	ret	
	nop	

_TranslateBehavior	ENDP
; Line 3340
	PUBLIC	_FlyWayPoint
_FlyWayPoint	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,78
	call	__aNchkstk
	push	si
;	dx = -56
;	dy = -66
;	dz = -72
;	relangle = -32
;	rrelangle = -54
;	enemyhead = -2
;	tangle = -42
;	tpitch = -52
;	troll = -64
;	enemyalt = -78
;	tdist = -30
;	distnm = -76
;	distkm = -50
;	wingman = -6
;	wayval = -18
;	wayval2 = -26
;	temppath = -10
;	xval = -40
;	yval = -48
;	zval = -62
;	xval2 = -60
;	yval2 = -70
;	zval2 = -74
;	behavenum = -36
;	formnum = -16
;	speedval = -14
;	altval = -12
;	headval = -20
;	attack = -28
;	launch = -34
;	wpflag = -4
;	aistation = -44
;	tptype = -24
;	timeval = -8
; Line 3347
	sub	ax,ax
	mov	WORD PTR [bp-18],ax	;wayval
	mov	WORD PTR [bp-26],ax	;wayval2
; Line 3361
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
; Line 3363
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _bv[bx+24],ax
	jge	$I2558
; Line 3364
	mov	WORD PTR _bv[bx+24],0
; Line 3365
; Line 3367
$I2558:
	mov	ax,1
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR $S1338_i
	call	_AIRadarForwardCheck
	add	sp,6
	or	ax,ax
	je	$I2559
; Line 3368
	mov	WORD PTR _tempgotcha,10
; Line 3369
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	push	WORD PTR _bv[bx+10]
	call	_gotcha
	add	sp,2
; Line 3370
	mov	WORD PTR _tempgotcha,-999
; Line 3371
; Line 3373
$I2559:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+14],-1
	jne	$JCC16736
	jmp	$I2561
$JCC16736:
	cmp	BYTE PTR _bv[bx+12],255
	jne	$JCC16746
	jmp	$I2561
$JCC16746:
; Line 3374
	mov	al,BYTE PTR _bv[bx+12]
	cbw	
	mov	WORD PTR [bp-10],ax	;temppath
; Line 3375
	mov	cx,WORD PTR _bv[bx+14]
	mov	WORD PTR [bp-18],cx	;wayval
; Line 3377
	mov	bx,ax
	mov	ax,cx
	mov	cl,3
	shl	bx,cl
	mov	cx,WORD PTR _aipaths[bx+4]
	add	cx,WORD PTR _aipaths[bx+6]
	cmp	cx,ax
	jbe	$JCC16784
	jmp	$I2561
$JCC16784:
; Line 3378
	lea	ax,WORD PTR [bp-4]	;wpflag
	push	ax
	lea	ax,WORD PTR [bp-34]	;launch
	push	ax
	lea	ax,WORD PTR [bp-28]	;attack
	push	ax
	lea	ax,WORD PTR [bp-20]	;headval
	push	ax
	lea	ax,WORD PTR [bp-12]	;altval
	push	ax
	lea	ax,WORD PTR [bp-14]	;speedval
	push	ax
	lea	dx,WORD PTR [bp-16]	;formnum
	push	dx
	lea	dx,WORD PTR [bp-36]	;behavenum
	push	dx
	dec	cx
	push	cx
	call	_GetWayPointChanges
	add	sp,18
; Line 3380
	cmp	WORD PTR [bp-14],-1	;speedval
	je	$I2562
; Line 3381
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-14]	;speedval
	mov	WORD PTR _bv[bx+18],ax
; Line 3382
; Line 3383
$I2562:
	cmp	WORD PTR [bp-20],-1	;headval
	je	$I2563
; Line 3385
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-20]	;headval
	sub	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-32],ax	;relangle
	push	ax
	push	WORD PTR $S1338_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 3386
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_IsBoat
	add	sp,2
	or	ax,ax
	jne	$I2564
; Line 3387
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-20]	;headval
	mov	WORD PTR _bv[bx+16],ax
; Line 3388
	jmp	SHORT $I2566
$I2564:
; Line 3389
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+16],cx
; Line 3390
; Line 3391
	jmp	SHORT $I2566
$I2563:
; Line 3392
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+20]
	neg	ax
	mov	WORD PTR _droll,ax
; Line 3393
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	si,ax
	mov	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR _bv[si+16],ax
; Line 3394
$I2566:
; Line 3396
	cmp	WORD PTR [bp-12],5	;altval
	jg	$JCC16997
	jmp	$I2572
$JCC16997:
; Line 3397
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-12]	;altval
	cmp	WORD PTR _ps[bx+6],ax
	jge	$I2568
; Line 3398
	sub	ax,3
	cmp	WORD PTR _ps[bx+6],ax
	jge	$I2569
; Line 3400
	mov	WORD PTR _pdest,8192
; Line 3401
; Line 3402
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I2569:
; Line 3404
	mov	WORD PTR _pdest,512
; Line 3405
; Line 3406
; Line 3407
	jmp	$I2611
	nop	
$I2568:
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-12]	;altval
	add	ax,25
	cmp	WORD PTR _ps[bx+6],ax
	jg	$JCC17069
	jmp	$I2572
$JCC17069:
; Line 3408
	mov	ax,WORD PTR [bp-12]	;altval
	add	ax,30
	cmp	WORD PTR _ps[bx+6],ax
	jle	$I2573
; Line 3409
	mov	ax,-12288
	sub	ax,WORD PTR _ps[bx+18]
	mov	WORD PTR _pdest,ax
; Line 3410
$L20124:
	mov	WORD PTR _pdest,-12288
; Line 3411
; Line 3412
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2573:
; Line 3413
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,-512
	sub	ax,WORD PTR _ps[bx+18]
	mov	WORD PTR _pdest,ax
; Line 3414
	mov	WORD PTR _pdest,-512
; Line 3415
; Line 3416
; Line 3417
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 3423
; Line 3424
$I2561:
; Line 3426
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+14],-1
	je	$I2578
	cmp	BYTE PTR _bv[bx+12],255
	jne	$I2577
$I2578:
; Line 3427
	push	WORD PTR $S1338_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	je	$I2579
; Line 3428
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 3429
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 3435
	push	WORD PTR $S1338_i
	call	_GetAIBase
	add	sp,2
; Line 3436
; Line 3437
	jmp	$I2611
$I2579:
; Line 3438
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 3439
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I2577:
; Line 3444
	lea	ax,WORD PTR [bp-62]	;zval
	push	ax
	lea	ax,WORD PTR [bp-48]	;yval
	push	ax
	lea	cx,WORD PTR [bp-40]	;xval
	push	cx
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+14]
	mov	WORD PTR [bp-18],ax	;wayval
	push	ax
	call	_GetWayXYZ
	add	sp,8
; Line 3447
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-40]	;xval
	mov	dx,WORD PTR [bp-38]
	add	ax,16
	adc	dx,0
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
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-56],ax	;dx
; Line 3448
	mov	ax,WORD PTR [bp-48]	;yval
	mov	dx,WORD PTR [bp-46]
	add	ax,16
	adc	dx,0
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
	sub	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-66],ax	;dy
; Line 3449
; Line 3451
	sub	ax,ax
	push	ax
	lea	cx,WORD PTR [bp-78]	;enemyalt
	push	cx
	lea	cx,WORD PTR [bp-76]	;distnm
	push	cx
	lea	cx,WORD PTR [bp-42]	;tangle
	push	cx
	lea	dx,WORD PTR [bp-52]	;tpitch
	push	dx
	lea	dx,WORD PTR [bp-30]	;tdist
	push	dx
	push	WORD PTR [bp-66]	;dy
	push	WORD PTR [bp-56]	;dx
	push	WORD PTR $S1338_i
	call	_GetTargADP
	add	sp,18
; Line 3453
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-42]	;tangle
	sub	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-32],ax	;relangle
; Line 3455
	cmp	WORD PTR [bp-30],10	;tdist
	jb	$JCC17420
	jmp	$I2582
$JCC17420:
; Line 3456
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+12]
	cbw	
	mov	WORD PTR [bp-10],ax	;temppath
; Line 3457
	lea	ax,WORD PTR [bp-4]	;wpflag
	push	ax
	lea	cx,WORD PTR [bp-34]	;launch
	push	cx
	lea	cx,WORD PTR [bp-28]	;attack
	push	cx
	lea	cx,WORD PTR [bp-20]	;headval
	push	cx
	lea	cx,WORD PTR [bp-12]	;altval
	push	cx
	lea	cx,WORD PTR [bp-14]	;speedval
	push	cx
	lea	cx,WORD PTR [bp-16]	;formnum
	push	cx
	lea	cx,WORD PTR [bp-36]	;behavenum
	push	cx
	push	WORD PTR [bp-18]	;wayval
	call	_GetWayPointChanges
	add	sp,18
	mov	WORD PTR [bp-8],ax	;timeval
; Line 3458
	test	BYTE PTR [bp-3],4
	je	$I2583
; Line 3459
	push	WORD PTR _planecnt
	call	_GetAIBase
	add	sp,2
; Line 3460
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 3461
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 3462
; Line 3463
$I2583:
	test	BYTE PTR [bp-3],128
	je	$I2584
; Line 3464
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	push	WORD PTR [bp-18]	;wayval
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+12]
	cbw	
	neg	ax
	push	ax
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR _planecnt
	mov	ax,43
	push	ax
	call	_LogIt
	add	sp,24
; Line 3465
	push	WORD PTR [bp-18]	;wayval
	mov	ax,-32768
	push	ax
	push	WORD PTR _planecnt
	call	_DoGroupAction
	add	sp,6
; Line 3466
; Line 3467
$I2584:
	test	BYTE PTR [bp-3],8
	je	$I2586
; Line 3468
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _DoAltHover
; Line 3469
	mov	ax,WORD PTR [bp-8]	;timeval
	add	ax,WORD PTR _Gtime
	mov	WORD PTR _bv[bx+22],ax
; Line 3470
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 3471
; Line 3473
	nop	
$I2586:
	mov	cl,3
	mov	bx,WORD PTR [bp-10]	;temppath
	shl	bx,cl
	mov	ax,WORD PTR _aipaths[bx+4]
	add	ax,WORD PTR _aipaths[bx+6]
	mov	cx,WORD PTR [bp-18]	;wayval
	inc	cx
	cmp	ax,cx
	ja	$I2587
; Line 3495
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+14],cx
; Line 3496
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+20]
	neg	ax
	mov	WORD PTR _droll,ax
$I2572:
; Line 3418
	mov	WORD PTR _pdest,0
; Line 3419
; Line 3420
	jmp	$I2611
	nop	
$I2587:
; Line 3503
	mov	bx,WORD PTR [bp-18]	;wayval
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx],-2
	jne	$I2589
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jne	$I2589
; Line 3504
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+14]
	inc	ax
	inc	ax
	jmp	SHORT $L20123
$I2589:
; Line 3506
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+14]
	inc	ax
$L20123:
	mov	WORD PTR [bp-26],ax	;wayval2
; Line 3508
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-26]	;wayval2
	mov	WORD PTR _bv[bx+14],ax
; Line 3511
	lea	cx,WORD PTR [bp-74]	;zval2
	push	cx
	lea	cx,WORD PTR [bp-70]	;yval2
	push	cx
	lea	dx,WORD PTR [bp-60]	;xval2
	push	dx
	push	ax
	call	_GetWayXYZ
	add	sp,8
; Line 3512
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-60]	;xval2
	mov	dx,WORD PTR [bp-58]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 3513
	mov	ax,WORD PTR [bp-70]	;yval2
	mov	dx,WORD PTR [bp-68]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 3514
	push	WORD PTR [bp-26]	;wayval2
	push	WORD PTR $S1338_i
	call	_DoNextWayPt
	add	sp,4
	or	ax,ax
	jne	$JCC17874
	jmp	$I2601
$JCC17874:
; Line 3515
	push	WORD PTR _planecnt
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR _planecnt
	je	$JCC17893
	jmp	$I2601
$JCC17893:
; Line 3516
	mov	ax,1
	push	ax
	push	WORD PTR _planecnt
	call	_ChangeGroupBehavior
	add	sp,4
; Line 3517
; Line 3518
; Line 3519
; Line 3520
	jmp	$I2601
	nop	
$I2582:
; Line 3521
	lea	ax,WORD PTR [bp-4]	;wpflag
	push	ax
	lea	ax,WORD PTR [bp-34]	;launch
	push	ax
	lea	ax,WORD PTR [bp-28]	;attack
	push	ax
	lea	ax,WORD PTR [bp-20]	;headval
	push	ax
	lea	ax,WORD PTR [bp-12]	;altval
	push	ax
	lea	ax,WORD PTR [bp-14]	;speedval
	push	ax
	lea	cx,WORD PTR [bp-16]	;formnum
	push	cx
	lea	cx,WORD PTR [bp-36]	;behavenum
	push	cx
	push	WORD PTR [bp-18]	;wayval
	call	_GetWayPointChanges
	add	sp,18
; Line 3522
	cmp	WORD PTR [bp-14],-1	;speedval
	je	$I2594
; Line 3523
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-14]	;speedval
	mov	WORD PTR _bv[bx+18],ax
; Line 3524
; Line 3525
$I2594:
	cmp	WORD PTR [bp-28],-1	;attack
	je	$I2595
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+24],0
	jne	$I2595
; Line 3526
	push	WORD PTR _planecnt
	call	_LaunchCruise
	add	sp,2
; Line 3527
; Line 3528
$I2595:
	test	BYTE PTR [bp-4],16	;wpflag
	je	$I2596
; Line 3529
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],125
	jl	$I2598
	push	WORD PTR [bp-32]	;relangle
	call	_abs
	add	sp,2
	cmp	ax,16384
	jg	$JCC18045
	jmp	$L20124
$JCC18045:
$I2598:
; Line 3530
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],32
; Line 3531
; Line 3537
; Line 3538
$I2596:
	test	BYTE PTR [bp-4],64	;wpflag
	je	$I2600
; Line 3539
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	ax
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR $S1338_i
	mov	ax,15
	push	ax
	call	_LogIt
	add	sp,24
; Line 3540
	push	WORD PTR $S1338_i
	call	_AirKill
	add	sp,2
; Line 3541
; Line 3542
$I2600:
	test	BYTE PTR [bp-3],2
	je	$I2601
; Line 3543
	sub	ax,ax
	push	ax
	mov	ax,512
	push	ax
	push	WORD PTR _planecnt
	call	_DoGroupAction
	add	sp,6
; Line 3544
; Line 3545
$I2601:
; Line 3547
	push	WORD PTR [bp-32]	;relangle
	push	WORD PTR $S1338_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 3549
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-62]	;zval
	cmp	WORD PTR _ps[bx+6],ax
	jae	$I2602
; Line 3550
	sub	ax,5
	cmp	WORD PTR _ps[bx+6],ax
	jae	$I2603
; Line 3552
	mov	WORD PTR _pdest,8192
; Line 3553
; Line 3554
	jmp	SHORT $I2609
$I2603:
; Line 3556
	mov	WORD PTR _pdest,512
; Line 3557
; Line 3558
; Line 3559
	jmp	SHORT $I2609
$I2602:
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-62]	;zval
	add	ax,25
	cmp	WORD PTR _ps[bx+6],ax
	jbe	$I2606
; Line 3560
	mov	ax,WORD PTR [bp-62]	;zval
	add	ax,30
	cmp	WORD PTR _ps[bx+6],ax
	jbe	$I2607
; Line 3562
	mov	WORD PTR _pdest,-12288
; Line 3563
; Line 3564
	jmp	SHORT $I2609
	nop	
$I2607:
; Line 3566
	mov	WORD PTR _pdest,-512
; Line 3567
; Line 3568
; Line 3569
	jmp	SHORT $I2609
$I2606:
; Line 3570
	mov	WORD PTR _pdest,0
$I2609:
; Line 3572
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_IsBoat
	add	sp,2
	or	ax,ax
	jne	$I2610
; Line 3573
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-42]	;tangle
	mov	WORD PTR _bv[bx+16],ax
; Line 3574
	jmp	SHORT $I2611
	nop	
$I2610:
; Line 3575
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+16],cx
$I2611:
; Line 3611
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_FlyWayPoint	ENDP
; Line 3614
	PUBLIC	_ShowJettison
_ShowJettison	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,30
	call	__aNchkstk
	push	si
;	otherplane = -4
;	ptargettype = -24
;	doshowdrop = -20
;	missilenum = -14
;	type = -6
;	weaponnum = -26
;	aistation = -30
;	ssk = -2
;	S = -8
;	f = -16
;	dist = -12
;	dpitch = -28
;	BombAngle = -18
;	planenum = 4
; Line 3627
	mov	WORD PTR [bp-20],0	;doshowdrop
; Line 3630
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FlyCruise
	jne	$JCC18373
	jmp	$I2641
$JCC18373:
; Line 3633
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	mov	si,ax
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-24],ax	;ptargettype
	mov	WORD PTR [bp-22],dx
; Line 3635
	cmp	WORD PTR _ps[si+6],5000
	jle	$I2629
	les	bx,DWORD PTR [bp-24]	;ptargettype
	cmp	WORD PTR es:[bx+20],0
	jne	$JCC18420
	jmp	$I2641
$JCC18420:
	cmp	WORD PTR es:[bx+20],3
	jne	$JCC18430
	jmp	$I2641
$JCC18430:
; Line 3638
$I2629:
; Line 3640
	push	WORD PTR [bp+4]	;planenum
	call	_CheckAIBombs
	add	sp,2
	mov	WORD PTR [bp-30],ax	;aistation
	inc	ax
	jne	$JCC18448
	jmp	$I2641
$JCC18448:
; Line 3641
; Line 3643
; Line 3647
	mov	WORD PTR [bp-20],1	;doshowdrop
; Line 3651
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+18]
	mov	si,ax
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-28],ax	;dpitch
	push	ax
	call	_Isin
	add	sp,2
	sub	ax,32767
	neg	ax
; Line 3652
	push	ax
	push	ax
	call	_TrgMul
	add	sp,4
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _ps[si+6]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,3
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	cwd	
	add	ax,1500
	adc	dx,0
	push	dx
	push	ax
	call	__aNlmul
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
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	add	ax,WORD PTR [bp-28]	;dpitch
	mov	WORD PTR [bp-18],ax	;BombAngle
; Line 3654
	push	ax
	call	_Isin
	add	sp,2
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-18]	;BombAngle
	call	_Icos
	add	sp,2
	mov	cx,ax
	mov	ax,WORD PTR _ps[si+6]
	imul	cx
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-12],ax	;dist
	mov	WORD PTR [bp-10],dx
; Line 3656
	push	dx
	push	ax
	push	WORD PTR _ps[si+16]
	call	_sinXL
	add	sp,6
	add	ax,WORD PTR _ps[si+8]
	adc	dx,WORD PTR _ps[si+10]
	mov	WORD PTR _AIBOMBX,ax
	mov	WORD PTR _AIBOMBX+2,dx
; Line 3657
	push	WORD PTR [bp-10]
	push	WORD PTR [bp-12]	;dist
	push	WORD PTR _ps[si+16]
	call	_cosXL
	add	sp,6
	mov	cx,WORD PTR _ps[si+12]
	mov	bx,WORD PTR _ps[si+14]
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR _AIBOMBY,cx
	mov	WORD PTR _AIBOMBY+2,bx
; Line 3659
	mov	ax,20
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	add	bx,WORD PTR [bp-30]	;aistation
	shl	bx,1
	mov	WORD PTR _ps[bx+34],0
; Line 3661
	push	WORD PTR [bp+4]	;planenum
	mov	si,ax
	call	_CheckAIBombs
	add	sp,2
	mov	WORD PTR [bp-30],ax	;aistation
	inc	ax
	je	$I2636
; Line 3662
	add	si,WORD PTR [bp-30]	;aistation
	shl	si,1
	mov	WORD PTR _ps[si+34],0
; Line 3665
$I2636:
	push	WORD PTR [bp+4]	;planenum
	call	_LetWingmenContinue
	add	sp,2
; Line 3667
	push	WORD PTR [bp+4]	;planenum
	call	_CheckAIMissiles
	add	sp,2
	inc	ax
	jne	$I2639
	les	bx,DWORD PTR [bp-24]	;ptargettype
	cmp	WORD PTR es:[bx+20],1
	je	$I2639
	cmp	WORD PTR es:[bx+20],2
	jne	$I2638
$I2639:
; Line 3668
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _StraightAttack
; Line 3669
	and	BYTE PTR _bv[bx+21],253
; Line 3670
	push	WORD PTR [bp+4]	;planenum
	call	_GetEnemyTarget
	jmp	SHORT $L20127
	nop	
$I2638:
; Line 3673
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 3674
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 3680
	push	WORD PTR [bp+4]	;planenum
	call	_GetAIBase
$L20127:
	add	sp,2
; Line 3681
; Line 3685
	cmp	WORD PTR [bp-20],0	;doshowdrop
	jne	$JCC18832
	jmp	$I2641
$JCC18832:
; Line 3686
	mov	ax,WORD PTR _ORDNANCE+36
	mov	WORD PTR [bp-6],ax	;type
; Line 3690
	push	WORD PTR [bp+4]	;planenum
	mov	ax,15
	push	ax
	sub	ax,ax
	push	ax
	call	_FindEmptyMissileSlot2
	add	sp,6
	mov	WORD PTR [bp-14],ax	;missilenum
; Line 3705
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-6]	;type
	push	WORD PTR _AIBOMBY+2
	push	WORD PTR _AIBOMBY
	push	WORD PTR _AIBOMBX+2
	push	WORD PTR _AIBOMBX
	push	WORD PTR [bp+4]	;planenum
	mov	ax,-1
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,27
	imul	WORD PTR _ps[bx+26]
	mov	al,ah
	cbw	
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,cx
	push	ax
	push	WORD PTR _ps[bx+20]
	push	WORD PTR _ps[bx+18]
	push	WORD PTR _ps[bx+16]
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	ax,-1
	push	ax
	push	WORD PTR [bp-14]	;missilenum
	call	_firemissile2
	add	sp,38
; Line 3706
; Line 3707
$I2641:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_ShowJettison	ENDP
; Line 3710
	PUBLIC	_SlewOurWingmen
_SlewOurWingmen	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	cnt = -2
;	yslew = 8
;	xslew = 4
; Line 3713
	mov	WORD PTR [bp-2],0	;cnt
	jmp	SHORT $F2648
	nop	
$FC2649:
; Line 3714
	mov	ax,40
	imul	WORD PTR [bp-2]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2652
	test	cl,2
	je	$I2652
	cmp	WORD PTR _ps[bx+26],0
	je	$I2652
; Line 3715
	push	WORD PTR [bp-2]	;cnt
	mov	si,bx
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I2652
; Line 3716
	mov	ax,WORD PTR [bp+4]	;xslew
	mov	dx,WORD PTR [bp+6]
	add	WORD PTR _ps[si+8],ax
	adc	WORD PTR _ps[si+10],dx
; Line 3717
	mov	ax,WORD PTR [bp+8]	;yslew
	mov	dx,WORD PTR [bp+10]
	add	WORD PTR _ps[si+12],ax
	adc	WORD PTR _ps[si+14],dx
; Line 3718
; Line 3719
$I2652:
; Line 3720
	inc	WORD PTR [bp-2]	;cnt
$F2648:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-2],ax	;cnt
	jl	$FC2649
; Line 3721
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_SlewOurWingmen	ENDP
; Line 4065
	PUBLIC	_DoHover
_DoHover	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 4066
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+20]
	neg	ax
	mov	WORD PTR _droll,ax
; Line 4068
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	sub	ax,ax
	mov	WORD PTR _bv[bx+18],ax
	mov	WORD PTR _pdest,ax
; Line 4069
	ret	

_DoHover	ENDP
; Line 4072
	PUBLIC	_GetAIBase
_GetAIBase	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	di
	push	si
;	b = -4
;	r = -2
;	j = -10
;	d = -6
;	tdist = -8
;	ainum = 4
; Line 4076
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _ps[bx],0
	jge	$JCC19144
	jmp	$I2667
$JCC19144:
; Line 4079
	mov	WORD PTR [bp-8],32767	;tdist
; Line 4080
	mov	WORD PTR [bp-10],0	;j
	jmp	SHORT $F2662
	nop	
$FC2663:
; Line 4082
	mov	bx,WORD PTR [bp-10]	;j
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _Rdrs[bx+6]
	mov	cx,ax
	and	ax,129
	dec	ax
	jne	$I2666
	push	WORD PTR [bp+4]	;ainum
	mov	si,cx
	mov	di,bx
	call	_FriendStatus
	add	sp,2
	mov	cx,si
	and	cx,1280
	cmp	cx,ax
	jne	$I2666
; Line 4085
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR _Rdrs[di+2]
	push	ax
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR _Rdrs[di]
	push	ax
	call	_xydist
	add	sp,4
	cmp	ax,WORD PTR [bp-8]	;tdist
	jae	$I2666
; Line 4086
	mov	WORD PTR [bp-8],ax	;tdist
; Line 4087
	mov	ax,WORD PTR [bp-10]	;j
	mov	WORD PTR [bp-4],ax	;b
; Line 4088
; Line 4089
$I2666:
; Line 4090
	inc	WORD PTR [bp-10]	;j
$F2662:
	mov	ax,WORD PTR _NRADAR
	cmp	WORD PTR [bp-10],ax	;j
	jl	$FC2663
; Line 4091
	cmp	WORD PTR [bp-8],32767	;tdist
	je	$I2667
; Line 4092
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR [bp-4]	;b
	mov	WORD PTR _ps[bx],ax
; Line 4093
$I2667:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetAIBase	ENDP
; Line 4096
	PUBLIC	_AIGoHome
_AIGoHome	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,40
	call	__aNchkstk
;	dist = -4
;	dx = -28
;	dy = -34
;	dz = -36
;	relangle = -18
;	rrelangle = -26
;	enemyhead = -2
;	tangle = -20
;	tpitch = -24
;	troll = -32
;	enemyalt = -40
;	tdist = -12
;	distnm = -38
;	distkm = -22
;	bxloc = -10
;	byloc = -14
;	bzloc = -16
;	bhead = -6
;	bret = -30
;	dalt = -8
; Line 4111
	lea	ax,WORD PTR [bp-6]	;bhead
	push	ax
	lea	ax,WORD PTR [bp-16]	;bzloc
	push	ax
	lea	ax,WORD PTR [bp-14]	;byloc
	push	ax
	lea	ax,WORD PTR [bp-10]	;bxloc
	push	ax
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	mov	cx,40
	imul	cx
	mov	bx,ax
	push	WORD PTR _ps[bx]
	call	_ReturnBaseInfo
	add	sp,10
	mov	WORD PTR [bp-30],ax	;bret
	or	ax,ax
	je	$I2689
; Line 4112
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx]
	add	ax,WORD PTR _whichourcarr
	inc	ax
	jne	$I2690
; Line 4113
	mov	WORD PTR [bp-4],225	;dist
; Line 4114
	jmp	SHORT $I2691
$I2690:
; Line 4115
	mov	WORD PTR [bp-4],500	;dist
$I2691:
; Line 4116
	push	WORD PTR [bp-4]	;dist
	mov	ax,WORD PTR [bp-6]	;bhead
	add	ah,128
	push	ax
	call	_sinX
	add	sp,4
	add	ax,WORD PTR [bp-10]	;bxloc
	mov	WORD PTR [bp-28],ax	;dx
; Line 4117
	push	WORD PTR [bp-4]	;dist
	mov	ax,WORD PTR [bp-6]	;bhead
	add	ah,128
	push	ax
	call	_cosX
	add	sp,4
	sub	ax,WORD PTR [bp-14]	;byloc
	neg	ax
	jmp	SHORT $L20130
$I2689:
; Line 4120
	mov	ax,WORD PTR [bp-10]	;bxloc
	mov	WORD PTR [bp-28],ax	;dx
; Line 4121
	mov	ax,WORD PTR [bp-14]	;byloc
	add	ax,500
$L20130:
	mov	WORD PTR [bp-34],ax	;dy
; Line 4122
; Line 4125
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR [bp-8],ax	;dalt
	cmp	ax,500
	jge	$I2693
; Line 4126
	mov	WORD PTR [bp-8],500	;dalt
; Line 4127
; Line 4129
$I2693:
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-8]	;dalt
	push	WORD PTR [bp-34]	;dy
	push	WORD PTR [bp-28]	;dx
	call	_FlyTo
	add	sp,8
	or	ax,ax
	je	$I2696
; Line 4130
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx]
	add	ax,WORD PTR _whichourcarr
	inc	ax
	jne	$I2695
; Line 4138
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	or	BYTE PTR _ps[bx+25],2
; Line 4139
	push	WORD PTR $S1338_i
	call	_CheckPlaneLand
	add	sp,2
; Line 4140
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AICarrierLand
; Line 4141
	call	_GetPlaneLanding
; Line 4142
; Line 4143
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2695:
; Line 4144
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome2
; Line 4145
$I2696:
; Line 4146
; Line 4148
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AIGoHome	ENDP
; Line 4151
	PUBLIC	_AIGoHome2
_AIGoHome2	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,38
	call	__aNchkstk
;	dx = -26
;	dy = -32
;	dz = -34
;	relangle = -16
;	rrelangle = -24
;	enemyhead = -2
;	tangle = -18
;	tpitch = -22
;	troll = -30
;	enemyalt = -38
;	tdist = -10
;	distnm = -36
;	distkm = -20
;	bxloc = -8
;	byloc = -12
;	bzloc = -14
;	bhead = -4
;	bret = -28
;	dalt = -6
; Line 4165
	lea	ax,WORD PTR [bp-4]	;bhead
	push	ax
	lea	cx,WORD PTR [bp-14]	;bzloc
	push	cx
	lea	cx,WORD PTR [bp-12]	;byloc
	push	cx
	lea	dx,WORD PTR [bp-8]	;bxloc
	push	dx
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	mov	bx,40
	imul	bx
	mov	bx,ax
	push	WORD PTR _ps[bx]
	call	_ReturnBaseInfo
	add	sp,10
	mov	WORD PTR [bp-28],ax	;bret
	or	ax,ax
	je	$I2717
; Line 4166
	mov	ax,225
	push	ax
	mov	cx,WORD PTR [bp-4]	;bhead
	add	ch,128
	push	cx
	call	_sinX
	add	sp,4
	add	ax,WORD PTR [bp-8]	;bxloc
	mov	WORD PTR [bp-26],ax	;dx
; Line 4167
	mov	ax,225
	push	ax
	mov	ax,WORD PTR [bp-4]	;bhead
	add	ah,128
	push	ax
	call	_cosX
	add	sp,4
	sub	ax,WORD PTR [bp-12]	;byloc
	neg	ax
	jmp	SHORT $L20131
$I2717:
; Line 4170
	mov	ax,WORD PTR [bp-8]	;bxloc
	mov	WORD PTR [bp-26],ax	;dx
; Line 4171
	mov	ax,WORD PTR [bp-12]	;byloc
	add	ax,225
$L20131:
	mov	WORD PTR [bp-32],ax	;dy
; Line 4172
; Line 4175
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR [bp-6],ax	;dalt
	cmp	ax,500
	jge	$I2719
; Line 4176
	mov	WORD PTR [bp-6],500	;dalt
; Line 4177
; Line 4179
$I2719:
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-6]	;dalt
	push	WORD PTR [bp-32]	;dy
	push	WORD PTR [bp-26]	;dx
	call	_FlyTo
	add	sp,8
	or	ax,ax
	je	$I2720
; Line 4180
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _FlyWayPoint
; Line 4181
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	or	BYTE PTR _ps[bx+25],2
; Line 4182
; Line 4184
$I2720:
	mov	sp,bp
	pop	bp
	ret	

_AIGoHome2	ENDP
; Line 4187
	PUBLIC	_CheckAISix
_CheckAISix	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,124
	call	__aNchkstk
	push	di
	push	si
;	returnval = -6
;	x = -18
;	y = -104
;	dx = -118
;	dy = -122
;	founddist = -2
;	targetnum = -14
;	tpitch = -116
;	tangle = -110
;	enemyalt = -124
;	rangle = -102
;	rrangle = -108
;	winghead = -12
;	cnt = -10
;	rangle1 = -106
;	rrangle1 = -114
;	tdist = -16
;	tdist1 = -100
;	tdistnm = -4
;	tdistnm1 = -8
;	threatdist = -112
;	threatcone = -120
;	Str = -98
;	wingnum = 4
; Line 4197
	mov	ax,40
	imul	WORD PTR [bp+4]	;wingnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-18],ax	;x
; Line 4198
	mov	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-104],ax	;y
; Line 4199
	mov	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-12],ax	;winghead
; Line 4200
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,-545
	imul	WORD PTR _bv[bx+42]
	add	ax,6821
	mov	WORD PTR [bp-120],ax	;threatcone
; Line 4201
	mov	ax,10
	sub	ax,WORD PTR _bv[bx+42]
	mov	WORD PTR [bp-112],ax	;threatdist
; Line 4205
	mov	WORD PTR [bp-14],-999	;targetnum
; Line 4206
	mov	WORD PTR [bp-16],0	;tdist
; Line 4208
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;founddist
	mov	WORD PTR [bp-10],ax	;cnt
	jmp	$F2746
	nop	
$FC2747:
; Line 4210
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	jne	$JCC19890
	jmp	$I2751
$JCC19890:
	test	cl,2
	jne	$JCC19898
	jmp	$I2751
$JCC19898:
	test	cl,32
	je	$JCC19906
	jmp	$I2751
$JCC19906:
	cmp	WORD PTR _ps[bx+26],0
	jne	$JCC19916
	jmp	$I2751
$JCC19916:
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	si,ax
	mov	ax,WORD PTR [bp+4]	;wingnum
	cmp	WORD PTR _bv[si+10],ax
	je	$JCC19936
	jmp	$I2751
$JCC19936:
; Line 4211
	push	WORD PTR [bp-10]	;cnt
	push	WORD PTR _planecnt
	mov	si,bx
	call	_FriendMatch
	add	sp,4
	or	ax,ax
	je	$JCC19958
	jmp	$I2751
$JCC19958:
; Line 4212
	mov	ax,WORD PTR [bp-18]	;x
	sub	ax,WORD PTR _ps[si+2]
	mov	WORD PTR [bp-118],ax	;dx
; Line 4213
	mov	cx,WORD PTR [bp-104]	;y
	sub	cx,WORD PTR _ps[si+4]
	mov	WORD PTR [bp-122],cx	;dy
; Line 4214
	sub	dx,dx
	push	dx
	lea	bx,WORD PTR [bp-124]	;enemyalt
	push	bx
	lea	bx,WORD PTR [bp-4]	;tdistnm
	push	bx
	lea	di,WORD PTR [bp-110]	;tangle
	push	di
	lea	dx,WORD PTR [bp-116]	;tpitch
	push	dx
	lea	dx,WORD PTR [bp-100]	;tdist1
	push	dx
	push	cx
	push	ax
	push	WORD PTR $S1338_i
	call	_GetTargADP
	add	sp,18
; Line 4215
	mov	ax,WORD PTR [bp-110]	;tangle
	sub	ax,WORD PTR _ps[si+16]
	mov	WORD PTR [bp-102],ax	;rangle
; Line 4216
	mov	ax,WORD PTR [bp-110]	;tangle
	sub	ax,WORD PTR [bp-12]	;winghead
	add	ah,128
	mov	WORD PTR [bp-108],ax	;rrangle
; Line 4218
	mov	ax,WORD PTR [bp-16]	;tdist
	cmp	WORD PTR [bp-100],ax	;tdist1
	jb	$I2752
	mov	ax,WORD PTR [bp-4]	;tdistnm
	cmp	WORD PTR [bp-112],ax	;threatdist
	jbe	$I2751
	cmp	WORD PTR [bp-2],0	;founddist
	jne	$I2751
$I2752:
	push	WORD PTR [bp-102]	;rangle
	call	_abs
	add	sp,2
	cmp	ax,8192
	jge	$I2751
	push	WORD PTR [bp-108]	;rrangle
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR [bp-120]	;threatcone
	jle	$I2751
; Line 4219
	mov	WORD PTR [bp-2],1	;founddist
; Line 4220
	mov	ax,WORD PTR [bp-100]	;tdist1
	mov	WORD PTR [bp-16],ax	;tdist
; Line 4221
	mov	ax,WORD PTR [bp-10]	;cnt
	mov	WORD PTR [bp-14],ax	;targetnum
; Line 4222
	mov	ax,WORD PTR [bp-102]	;rangle
	mov	WORD PTR [bp-106],ax	;rangle1
; Line 4223
	mov	ax,WORD PTR [bp-108]	;rrangle
	mov	WORD PTR [bp-114],ax	;rrangle1
; Line 4224
	mov	ax,WORD PTR [bp-4]	;tdistnm
	mov	WORD PTR [bp-8],ax	;tdistnm1
; Line 4225
; Line 4226
$I2751:
; Line 4227
; Line 4228
	inc	WORD PTR [bp-10]	;cnt
$F2746:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-10],ax	;cnt
	jge	$JCC20134
	jmp	$FC2747
$JCC20134:
; Line 4229
	cmp	WORD PTR [bp-2],0	;founddist
	je	$I2754
; Line 4230
	mov	bx,WORD PTR [bp+4]	;wingnum
	shl	bx,1
	mov	ax,WORD PTR [bp-14]	;targetnum
	cmp	WORD PTR _whichdefensethreat[bx],ax
	je	$I2754
; Line 4231
	mov	WORD PTR _whichdefensethreat[bx],ax
; Line 4232
	lea	ax,WORD PTR [bp-98]	;Str
	push	ax
	push	WORD PTR [bp+4]	;wingnum
	call	_GetWingName
	add	sp,4
; Line 4233
	mov	ax,OFFSET DGROUP:$SG2755
	push	ax
	lea	ax,WORD PTR [bp-98]	;Str
	push	ax
	call	_strcat
	add	sp,4
; Line 4234
	mov	ax,3
	push	ax
	lea	ax,WORD PTR [bp-98]	;Str
	push	ax
	call	_Message
	add	sp,4
; Line 4235
	mov	ax,7
	push	ax
	call	_Speech
	add	sp,2
; Line 4236
; Line 4237
$I2754:
; Line 4239
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_CheckAISix	ENDP
; Line 4242
	PUBLIC	_GorillaBomb
_GorillaBomb	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,60
	call	__aNchkstk
	push	di
	push	si
;	dx = -42
;	dy = -54
;	dz = -56
;	relangle = -20
;	tangle = -28
;	tpitch = -38
;	troll = -50
;	enemyalt = -60
;	prewing = -36
;	temphead = -18
;	secplace = -4
;	tempwing = -26
;	prespeed = -16
;	tempspeed = -12
;	tdist = -14
;	distkm = -34
;	tdistnm = -8
;	offangle = -6
;	hsep = -2
;	ourleadalt = -48
;	tempalt = -10
;	dpwhead = -46
;	xval = -24
;	yval = -32
;	zval = -44
;	coverplane = -58
; Line 4260
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
	push	ax
	call	_GetBehaviorLeader
	add	sp,2
	mov	WORD PTR [bp-36],ax	;prewing
; Line 4262
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+20]
	and	ax,15
	mov	WORD PTR [bp-4],ax	;secplace
; Line 4264
	mov	WORD PTR [bp-6],16384	;offangle
; Line 4266
	mov	WORD PTR [bp-16],0	;prespeed
; Line 4267
	mov	ax,WORD PTR $S1338_i
	cmp	WORD PTR [bp-36],ax	;prewing
	je	$I2783
; Line 4268
	mov	ax,46
	imul	WORD PTR [bp-36]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
	mov	WORD PTR [bp-16],ax	;prespeed
; Line 4269
; Line 4271
$I2783:
	mov	ax,40
	imul	WORD PTR [bp-36]	;prewing
	mov	bx,ax
	mov	ax,46
	imul	WORD PTR [bp-36]	;prewing
	mov	si,ax
	mov	ax,WORD PTR _bv[si+16]
	sub	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-46],ax	;dpwhead
; Line 4273
	mov	cx,WORD PTR $S1338_i
	cmp	WORD PTR [bp-36],cx	;prewing
	je	$I2785
	cmp	WORD PTR [bp-4],1	;secplace
	jle	$I2785
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,1536
	jg	$I2785
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+6],0
	jl	$JCC20367
	jmp	$I2784
$JCC20367:
	cmp	WORD PTR _bv[bx+2],0
	jl	$JCC20377
	jmp	$I2784
$JCC20377:
$I2785:
; Line 4279
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	jne	$I2787
	push	WORD PTR $S1338_i
	call	_CheckAIBombs
	add	sp,2
	inc	ax
	jne	$JCC20409
	jmp	$I2786
$JCC20409:
$I2787:
; Line 4280
	mov	ax,WORD PTR $S1338_i
	cmp	WORD PTR [bp-36],ax	;prewing
	je	$I2788
; Line 4282
	lea	cx,WORD PTR [bp-44]	;zval
	push	cx
	lea	cx,WORD PTR [bp-32]	;yval
	push	cx
	lea	dx,WORD PTR [bp-24]	;xval
	push	dx
	mov	ax,46
	imul	WORD PTR [bp-36]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+14]
	mov	dx,ax
	mov	ax,46
	mov	bx,dx
	imul	WORD PTR $S1338_i
	mov	si,ax
	mov	WORD PTR _bv[si+14],bx
	push	bx
	call	_GetWayXYZ
	add	sp,8
; Line 4283
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-24]	;xval
	mov	dx,WORD PTR [bp-22]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 4284
	mov	ax,WORD PTR [bp-32]	;yval
	mov	dx,WORD PTR [bp-30]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 4285
; Line 4286
$I2788:
	call	_FlyWayPoint
; Line 4287
	mov	ax,WORD PTR $S1338_i
	cmp	WORD PTR [bp-36],ax	;prewing
	je	$I2791
; Line 4288
	mov	cx,46
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _GorillaBomb
	je	$I2791
	mov	ax,cx
	imul	WORD PTR [bp-36]	;prewing
	mov	si,ax
	test	BYTE PTR _bv[si+21],2
	je	$I2791
; Line 4289
	mov	WORD PTR _bv[bx],OFFSET _GorillaBomb
; Line 4290
; Line 4291
; Line 4292
	jmp	SHORT $I2791
	nop	
$I2786:
; Line 4293
	call	_StraightAttack
$I2791:
; Line 4295
	cmp	WORD PTR [bp-16],0	;prespeed
	jne	$JCC20563
	jmp	$EX2756
$JCC20563:
; Line 4296
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-16]	;prespeed
	sub	ax,20
	mov	WORD PTR _bv[bx+18],ax
; Line 4298
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2784:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+6],0
	jl	$I2794
; Line 4301
	mov	ax,WORD PTR _bv[bx+6]
	mov	WORD PTR [bp-26],ax	;tempwing
; Line 4302
	mov	WORD PTR [bp-6],-32768	;offangle
; Line 4303
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	add	ah,128
	mov	WORD PTR [bp-18],ax	;temphead
; Line 4307
	mov	WORD PTR [bp-2],4320	;hsep
; Line 4309
; Line 4310
	jmp	SHORT $I2795
$I2794:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],0
	jge	$JCC20660
	jmp	$I2796
$JCC20660:
; Line 4311
	mov	ax,WORD PTR _bv[bx+2]
	mov	WORD PTR [bp-26],ax	;tempwing
; Line 4312
	mov	WORD PTR [bp-6],-16384	;offangle
; Line 4313
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	sub	ax,16384
	mov	WORD PTR [bp-18],ax	;temphead
; Line 4317
	mov	WORD PTR [bp-2],2880	;hsep
; Line 4319
; Line 4320
$I2795:
; Line 4345
	mov	ax,WORD PTR $S1338_i
	cmp	WORD PTR [bp-36],ax	;prewing
	je	$I2798
	mov	ax,46
	imul	WORD PTR [bp-26]	;tempwing
	mov	bx,ax
	cmp	WORD PTR _bv[bx+14],0
	jl	$I2798
; Line 4346
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	si,ax
	mov	ax,WORD PTR _bv[bx+14]
	mov	WORD PTR _bv[si+14],ax
; Line 4348
$I2798:
	mov	ax,46
	imul	WORD PTR [bp-26]	;tempwing
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _GorillaBomb
	jne	$JCC20753
	jmp	$I2800
$JCC20753:
	cmp	WORD PTR _bv[bx],OFFSET _AIBombTarget
	jne	$JCC20764
	jmp	$I2800
$JCC20764:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ah,BYTE PTR _bv[bx+21]
	and	ax,512
	je	$JCC20785
	jmp	$I2800
$JCC20785:
; Line 4349
	or	ax,ax
	jne	$I2801
	push	WORD PTR $S1338_i
	call	_CheckAIBombs
	add	sp,2
	inc	ax
	je	$I2800
$I2801:
; Line 4350
	mov	ax,WORD PTR $S1338_i
	cmp	WORD PTR [bp-36],ax	;prewing
	je	$I2802
	mov	ax,46
	imul	WORD PTR [bp-26]	;tempwing
	mov	bx,ax
	cmp	WORD PTR _bv[bx+14],0
	jl	$I2802
; Line 4352
	lea	ax,WORD PTR [bp-44]	;zval
	push	ax
	lea	ax,WORD PTR [bp-32]	;yval
	push	ax
	lea	cx,WORD PTR [bp-24]	;xval
	push	cx
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	si,ax
	mov	ax,WORD PTR _bv[bx+14]
	mov	WORD PTR _bv[si+14],ax
	push	ax
	call	_GetWayXYZ
	add	sp,8
; Line 4353
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-24]	;xval
	mov	dx,WORD PTR [bp-22]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 4354
	mov	ax,WORD PTR [bp-32]	;yval
	mov	dx,WORD PTR [bp-30]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 4355
; Line 4356
$I2802:
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _FlyWayPoint
; Line 4357
	push	WORD PTR _bv[bx+14]
	push	WORD PTR $S1338_i
	call	_DoNextWayPt
	add	sp,4
; Line 4358
; Line 4359
$I2800:
; Line 4363
	mov	ax,100
	imul	WORD PTR [bp-2]	;hsep
	push	dx
	push	ax
	push	WORD PTR [bp-18]	;temphead
	mov	si,ax
	mov	di,dx
	call	_sinXL
	add	sp,6
	mov	cl,3
	mov	bx,WORD PTR [bp-26]	;tempwing
	shl	bx,cl
	add	ax,WORD PTR _ailoc[bx]
	adc	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-42],ax	;dx
	mov	WORD PTR [bp-40],dx
; Line 4364
	push	di
	push	si
	push	WORD PTR [bp-18]	;temphead
	mov	si,bx
	call	_cosXL
	add	sp,6
	mov	cx,WORD PTR _ailoc[si+4]
	mov	bx,WORD PTR _ailoc[si+6]
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR [bp-54],cx	;dy
	mov	WORD PTR [bp-52],bx
; Line 4365
	mov	ax,40
	imul	WORD PTR [bp-26]	;tempwing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR [bp-48],ax	;ourleadalt
; Line 4367
	mov	ax,46
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-48]	;ourleadalt
	add	ax,WORD PTR _bv[bx+26]
	mov	WORD PTR [bp-10],ax	;tempalt
; Line 4369
	cmp	ax,75
	jge	$I2803
; Line 4370
	mov	WORD PTR [bp-10],75	;tempalt
; Line 4372
$I2803:
	cmp	WORD PTR _GLowDroll,0
	je	$I2804
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],128
	jne	$I2804
; Line 4373
	or	BYTE PTR _ps[bx+24],128
; Line 4374
	push	WORD PTR [bp-26]	;tempwing
	push	WORD PTR [bp-10]	;tempalt
	push	WORD PTR [bp-52]
	push	WORD PTR [bp-54]	;dy
	push	WORD PTR [bp-40]
	push	WORD PTR [bp-42]	;dx
	push	WORD PTR $S1338_i
	call	_JustPutHere
	jmp	SHORT $L20133
	nop	
	nop	
$I2796:
; Line 4321
	call	_FlyWayPoint
; Line 4322
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 4323
; Line 4376
; Line 4378
	nop	
$I2804:
	push	WORD PTR [bp-16]	;prespeed
	push	WORD PTR [bp-26]	;tempwing
	push	WORD PTR [bp-10]	;tempalt
	push	WORD PTR [bp-52]
	push	cx
	push	WORD PTR [bp-40]
	push	WORD PTR [bp-42]	;dx
	call	_LFlyTo
$L20133:
	add	sp,14
; Line 4396
$EX2756:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GorillaBomb	ENDP
; Line 4399
	PUBLIC	_Langle
_Langle	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	y = 8
;	x = 4
; Line 4401
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
	or	di,di
	jl	$I2808
	jg	$L20010
	cmp	si,16383
	jbe	$I2808
$L20010:
; Line 4404
	mov	al,8
	push	ax
	lea	cx,WORD PTR [bp+4]	;x
	push	cx
	call	__aNNalshr
; Line 4405
	mov	al,8
	push	ax
	lea	ax,WORD PTR [bp+8]	;y
	push	ax
	call	__aNNalshr
; Line 4406
; Line 4407
$I2808:
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
	or	di,di
	jl	$I2809
	jg	$L20013
	cmp	si,16383
	jbe	$I2809
$L20013:
; Line 4410
	mov	al,8
	push	ax
	lea	cx,WORD PTR [bp+4]	;x
	push	cx
	call	__aNNalshr
; Line 4411
	mov	al,8
	push	ax
	lea	ax,WORD PTR [bp+8]	;y
	push	ax
	call	__aNNalshr
; Line 4412
; Line 4413
$I2809:
	push	WORD PTR [bp+8]	;y
	push	WORD PTR [bp+4]	;x
	call	_ARCTAN
	add	sp,4
; Line 4414
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_Langle	ENDP
; Line 4417
	PUBLIC	_LGetTargADP
_LGetTargADP	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
	push	si
;	holddist = -8
;	tdx = -2
;	tdy = -6
;	junkangle = -14
;	junkangle2 = -4
;	holddist2 = -12
;	ldist = 26
;	deltalt = 24
;	enemyalt = 22
;	tdistnm = 20
;	tangle = 18
;	tpitch = 16
;	tdist = 14
;	dy = 10
;	dx = 6
;	planenum = 4
; Line 4424
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	cx,WORD PTR [bp+10]	;dy
	mov	bx,WORD PTR [bp+12]
	add	cx,16
	adc	bx,0
	push	bx
	push	cx
	call	__aNldiv
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
	mov	WORD PTR [bp-6],ax	;tdy
; Line 4426
	mov	bx,WORD PTR [bp+26]	;ldist
	sub	cx,cx
	mov	WORD PTR [bx+2],cx
	mov	WORD PTR [bx],cx
; Line 4427
	push	ax
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp+6]	;dx
	mov	dx,WORD PTR [bp+8]
	add	ax,16
	adc	dx,cx
	push	dx
	push	ax
	call	__aNldiv
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
	mov	WORD PTR [bp-2],ax	;tdx
	push	ax
	call	_Dist2D
	add	sp,4
	mov	bx,WORD PTR [bp+14]	;tdist
	mov	WORD PTR [bx],ax
; Line 4428
	push	WORD PTR [bp+12]
	push	WORD PTR [bp+10]	;dy
	push	WORD PTR [bp+8]
	push	WORD PTR [bp+6]	;dx
	call	_LDist2D
	add	sp,8
	mov	bx,WORD PTR [bp+26]	;ldist
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
; Line 4430
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I2827
; Line 4431
	mov	bx,WORD PTR [bp+14]	;tdist
	push	WORD PTR [bx]
	mov	ax,WORD PTR [bp+24]	;deltalt
	add	ax,WORD PTR _Alt
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	call	_GetAltPitch
	add	sp,6
	mov	bx,WORD PTR [bp+16]	;tpitch
	mov	WORD PTR [bx],ax
; Line 4432
	mov	ax,WORD PTR _Alt
	jmp	SHORT $L20134
$I2827:
; Line 4435
	mov	bx,WORD PTR [bp+14]	;tdist
	push	WORD PTR [bx]
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	si,ax
	mov	ax,WORD PTR _ps[si+6]
	add	ax,WORD PTR [bp+24]	;deltalt
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	push	WORD PTR _ps[si+6]
	mov	si,bx
	call	_GetAltPitch
	add	sp,6
	mov	bx,WORD PTR [bp+16]	;tpitch
	mov	WORD PTR [bx],ax
; Line 4436
	mov	ax,40
	imul	WORD PTR _bv[si+10]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
$L20134:
	mov	bx,WORD PTR [bp+22]	;enemyalt
	mov	WORD PTR [bx],ax
; Line 4437
; Line 4438
	mov	ax,WORD PTR [bp+10]	;dy
	mov	dx,WORD PTR [bp+12]
	neg	ax
	adc	dx,0
	neg	dx
	push	dx
	push	ax
	push	WORD PTR [bp+8]
	push	WORD PTR [bp+6]	;dx
	call	_Langle
	add	sp,8
	mov	bx,WORD PTR [bp+18]	;tangle
	mov	WORD PTR [bx],ax
; Line 4439
	push	WORD PTR [bp-6]	;tdy
	push	WORD PTR [bp-2]	;tdx
	call	_ARCTAN
	add	sp,4
; Line 4440
	mov	ax,4096
	push	ax
	mov	ax,-8192
	push	ax
	mov	bx,WORD PTR [bp+16]	;tpitch
	push	WORD PTR [bx]
	call	_rng2
	add	sp,6
	mov	bx,WORD PTR [bp+16]	;tpitch
	mov	WORD PTR [bx],ax
; Line 4441
	mov	bx,WORD PTR [bp+14]	;tdist
	mov	ax,WORD PTR [bx]
	shl	ax,1
	mov	cx,95
	sub	dx,dx
	div	cx
	mov	bx,WORD PTR [bp+20]	;tdistnm
	mov	WORD PTR [bx],ax
; Line 4454
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_LGetTargADP	ENDP
; Line 4457
	PUBLIC	_LFlyTo
_LFlyTo	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,52
	call	__aNchkstk
	push	di
	push	si
;	dx = -36
;	dy = -42
;	dz = -46
;	relangle = -24
;	rrelangle = -32
;	enemyhead = -6
;	tangle = -26
;	tpitch = -30
;	troll = -38
;	enemyalt = -52
;	tdist = -20
;	distnm = -50
;	distkm = -28
;	tdist2 = -22
;	ldist = -4
;	wingman = -8
;	alttemp = -16
;	leadhead = -18
;	prespeedL = -12
;	showwww = -14
;	leadpitch = -44
;	endpitch = -48
;	prespeed = 16
;	prewing = 14
;	altdim = 12
;	ydim = 8
;	xdim = 4
; Line 4474
	mov	WORD PTR [bp-32],-999	;rrelangle
; Line 4475
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
; Line 4480
	mov	bx,ax
	mov	cl,3
	shl	bx,cl
	mov	cx,WORD PTR [bp+4]	;xdim
	mov	dx,WORD PTR [bp+6]
	sub	cx,WORD PTR _ailoc[bx]
	sbb	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-36],cx	;dx
	mov	WORD PTR [bp-34],dx
; Line 4481
	mov	si,WORD PTR [bp+8]	;ydim
	mov	di,WORD PTR [bp+10]
	sub	si,WORD PTR _ailoc[bx+4]
	sbb	di,WORD PTR _ailoc[bx+6]
	mov	WORD PTR [bp-42],si	;dy
	mov	WORD PTR [bp-40],di
; Line 4483
	lea	bx,WORD PTR [bp-4]	;ldist
	push	bx
	sub	bx,bx
	push	bx
	lea	ax,WORD PTR [bp-52]	;enemyalt
	push	ax
	lea	ax,WORD PTR [bp-50]	;distnm
	push	ax
	lea	ax,WORD PTR [bp-26]	;tangle
	push	ax
	lea	ax,WORD PTR [bp-30]	;tpitch
	push	ax
	lea	ax,WORD PTR [bp-20]	;tdist
	push	ax
	push	di
	push	si
	push	dx
	push	cx
	push	WORD PTR _planecnt
	call	_LGetTargADP
	add	sp,24
; Line 4485
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-26]	;tangle
	sub	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-24],ax	;relangle
; Line 4487
	push	ax
	push	WORD PTR $S1338_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 4489
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR [bp-16],ax	;alttemp
; Line 4491
	cmp	WORD PTR [bp+14],-999	;prewing
	jne	$I2859
; Line 4492
	mov	WORD PTR [bp-44],0	;leadpitch
; Line 4493
	jmp	SHORT $I2860
	nop	
$I2859:
	cmp	WORD PTR [bp+14],-1	;prewing
	jne	$I2861
; Line 4494
	mov	ax,WORD PTR _OurPitch
	jmp	SHORT $L20135
	nop	
$I2861:
; Line 4496
	mov	ax,40
	imul	WORD PTR [bp+14]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+18]
$L20135:
	mov	WORD PTR [bp-44],ax	;leadpitch
$I2860:
; Line 4498
	mov	ax,WORD PTR [bp+12]	;altdim
	sub	ax,3
	cmp	ax,WORD PTR [bp-16]	;alttemp
	jle	$I2863
; Line 4499
	mov	ax,WORD PTR [bp+12]	;altdim
	sub	ax,250
	cmp	ax,WORD PTR [bp-16]	;alttemp
	jle	$I2864
; Line 4500
	mov	ax,WORD PTR [bp-44]	;leadpitch
	add	ah,32
	jmp	SHORT $L20136
	nop	
$I2864:
	mov	ax,WORD PTR [bp+12]	;altdim
	sub	ax,15
	cmp	ax,WORD PTR [bp-16]	;alttemp
	jle	$I2866
; Line 4502
	mov	ax,WORD PTR [bp-44]	;leadpitch
	add	ah,8
	jmp	SHORT $L20136
	nop	
$I2866:
; Line 4504
	mov	ax,WORD PTR [bp-44]	;leadpitch
	add	ah,1
$L20136:
	mov	WORD PTR [bp-48],ax	;endpitch
; Line 4505
	cmp	ax,14336
	jle	$I2868
; Line 4506
	mov	WORD PTR [bp-48],14336	;endpitch
; Line 4508
$I2868:
	mov	ax,WORD PTR [bp-48]	;endpitch
	jmp	SHORT $L20138
$I2863:
	mov	ax,WORD PTR [bp+12]	;altdim
	add	ax,3
	cmp	ax,WORD PTR [bp-16]	;alttemp
	jge	$I2870
; Line 4511
	mov	ax,WORD PTR [bp+12]	;altdim
	add	ax,250
	cmp	ax,WORD PTR [bp-16]	;alttemp
	jge	$I2871
; Line 4512
	mov	ax,WORD PTR [bp-44]	;leadpitch
	sub	ax,12288
	jmp	SHORT $L20137
$I2871:
	mov	ax,WORD PTR [bp+12]	;altdim
	add	ax,15
	cmp	ax,WORD PTR [bp-16]	;alttemp
	jge	$I2873
; Line 4514
	mov	ax,WORD PTR [bp-44]	;leadpitch
	sub	ax,2048
	jmp	SHORT $L20137
	nop	
$I2873:
; Line 4516
	mov	ax,WORD PTR [bp-44]	;leadpitch
	sub	ax,256
$L20137:
	mov	WORD PTR [bp-48],ax	;endpitch
; Line 4517
	cmp	ax,-14336
	jge	$I2868
; Line 4518
	mov	WORD PTR [bp-48],-14336	;endpitch
; Line 4520
	jmp	SHORT $I2868
	nop	
$I2870:
; Line 4524
	mov	ax,WORD PTR [bp-44]	;leadpitch
$L20138:
	mov	WORD PTR _pdest,ax
; Line 4526
	cmp	WORD PTR [bp+16],0	;prespeed
	je	$I2877
; Line 4527
	mov	ax,WORD PTR [bp-20]	;tdist
	mov	WORD PTR [bp-22],ax	;tdist2
; Line 4528
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;ldist
	call	__aNldiv
	or	dx,dx
	jg	$I2878
	jl	$L20014
	cmp	ax,32000
	jae	$I2878
$L20014:
; Line 4535
	mov	WORD PTR [bp-22],ax	;tdist2
	cmp	ax,15
	jbe	$I2880
; Line 4536
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	and	BYTE PTR _ps[bx+24],191
; Line 4537
; Line 4544
; Line 4545
	jmp	SHORT $I2880
$I2878:
; Line 4546
	mov	WORD PTR [bp-22],4000	;tdist2
; Line 4547
$I2880:
; Line 4548
	push	WORD PTR [bp+14]	;prewing
	push	WORD PTR [bp-22]	;tdist2
	push	WORD PTR [bp-24]	;relangle
	push	WORD PTR [bp+16]	;prespeed
	call	_FormationSpeedAdjustUS
	add	sp,8
; Line 4549
; Line 4551
$I2877:
	cmp	WORD PTR [bp-20],5	;tdist
	jb	$JCC22115
	jmp	$I2881
$JCC22115:
	cmp	WORD PTR [bp+14],-999	;prewing
	jne	$JCC22125
	jmp	$I2881
$JCC22125:
; Line 4552
	cmp	WORD PTR [bp+14],-1	;prewing
	jne	$I2882
; Line 4553
	mov	ax,WORD PTR _OurHead
	jmp	SHORT $L20139
	nop	
$I2882:
; Line 4555
	mov	ax,40
	imul	WORD PTR [bp+14]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
$L20139:
	mov	WORD PTR [bp-18],ax	;leadhead
; Line 4556
	mov	ax,5000
	push	ax
	push	WORD PTR [bp-18]	;leadhead
	call	_sinX
	add	sp,4
	cwd	
	add	ax,WORD PTR [bp+4]	;xdim
	adc	dx,WORD PTR [bp+6]
	mov	WORD PTR [bp-36],ax	;dx
	mov	WORD PTR [bp-34],dx
; Line 4557
	mov	ax,5000
	push	ax
	push	WORD PTR [bp-18]	;leadhead
	call	_cosX
	add	sp,4
	cwd	
	mov	cx,WORD PTR [bp+8]	;ydim
	mov	bx,WORD PTR [bp+10]
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR [bp-42],cx	;dy
	mov	WORD PTR [bp-40],bx
; Line 4558
	mov	cl,3
	mov	bx,WORD PTR $S1338_i
	shl	bx,cl
	mov	ax,WORD PTR _ailoc[bx]
	mov	dx,WORD PTR _ailoc[bx+2]
	sub	WORD PTR [bp-36],ax	;dx
	sbb	WORD PTR [bp-34],dx
; Line 4560
	mov	ax,WORD PTR _ailoc[bx+4]
	mov	dx,WORD PTR _ailoc[bx+6]
	sub	WORD PTR [bp-42],ax	;dy
	sbb	WORD PTR [bp-40],dx
	mov	ax,WORD PTR [bp-42]	;dy
	mov	dx,WORD PTR [bp-40]
	neg	ax
	adc	dx,0
	neg	dx
	push	dx
	push	ax
	push	WORD PTR [bp-34]
	push	WORD PTR [bp-36]	;dx
	call	_Langle
	add	sp,8
	mov	WORD PTR [bp-26],ax	;tangle
; Line 4561
	mov	ax,WORD PTR [bp-24]	;relangle
	mov	WORD PTR [bp-32],ax	;rrelangle
; Line 4562
	mov	ax,40
	imul	WORD PTR $S1338_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-26]	;tangle
	sub	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-24],ax	;relangle
; Line 4563
	push	ax
	push	WORD PTR $S1338_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 4564
; Line 4579
$I2881:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_LFlyTo	ENDP
; Line 4582
	PUBLIC	_LDist2D
_LDist2D	PROC NEAR
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
;	y = 8
;	x = 4
; Line 4583
	mov	WORD PTR [bp-10],0	;shifthold
; Line 4586
	mov	WORD PTR [bp-4],16383	;doshift
	mov	WORD PTR [bp-2],0
; Line 4588
	mov	ax,WORD PTR [bp+4]	;x
	mov	dx,WORD PTR [bp+6]
	mov	WORD PTR [bp-14],ax	;ox
	mov	WORD PTR [bp-12],dx
; Line 4589
	mov	cx,WORD PTR [bp+8]	;y
	mov	bx,WORD PTR [bp+10]
	mov	WORD PTR [bp-18],cx	;oy
	mov	WORD PTR [bp-16],bx
; Line 4590
	push	dx
	push	ax
	call	_absL
	add	sp,4
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;oy
	mov	si,ax
	mov	di,dx
	call	_absL
	add	sp,4
	add	si,ax
	adc	di,dx
	or	di,di
	jl	$I2892
	jg	$L20017
	cmp	si,16383
	jbe	$I2892
$L20017:
; Line 4591
	mov	ax,WORD PTR [bp-14]	;ox
	mov	dx,WORD PTR [bp-12]
	mov	al,ah
	mov	ah,dl
	mov	dl,dh
	shl	dh,1
	sbb	dh,dh
	mov	WORD PTR [bp+4],ax	;x
	mov	WORD PTR [bp+6],dx
; Line 4592
	mov	ax,WORD PTR [bp-18]	;oy
	mov	dx,WORD PTR [bp-16]
	mov	al,ah
	mov	ah,dl
	mov	dl,dh
	shl	dh,1
	sbb	dh,dh
	mov	WORD PTR [bp+8],ax	;y
	mov	WORD PTR [bp+10],dx
; Line 4593
	mov	WORD PTR [bp-10],8	;shifthold
; Line 4594
; Line 4595
$I2892:
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
	jl	$I2893
	jg	$L20019
	cmp	si,WORD PTR [bp-4]	;doshift
	jbe	$I2893
$L20019:
; Line 4596
	mov	al,8
	push	ax
	lea	cx,WORD PTR [bp+4]	;x
	push	cx
	call	__aNNalshr
; Line 4597
	mov	al,8
	push	ax
	lea	ax,WORD PTR [bp+8]	;y
	push	ax
	call	__aNNalshr
; Line 4598
	mov	WORD PTR [bp-10],16	;shifthold
; Line 4599
; Line 4600
$I2893:
	cmp	WORD PTR [bp-10],0	;shifthold
	je	$I2894
; Line 4601
	push	WORD PTR [bp+8]	;y
	push	WORD PTR [bp+4]	;x
	call	_Dist2D
	add	sp,4
	cwd	
	mov	WORD PTR [bp-8],ax	;returnval
	mov	WORD PTR [bp-6],dx
; Line 4602
	mov	al,BYTE PTR [bp-10]	;shifthold
	push	ax
	lea	ax,WORD PTR [bp-8]	;returnval
	push	ax
	call	__aNNalshl
; Line 4603
; Line 4604
	jmp	SHORT $I2895
$I2894:
; Line 4605
	push	WORD PTR [bp+8]	;y
	push	WORD PTR [bp+4]	;x
	call	_Dist2D
	add	sp,4
	cwd	
	mov	WORD PTR [bp-8],ax	;returnval
	mov	WORD PTR [bp-6],dx
$I2895:
; Line 4614
	mov	ax,WORD PTR [bp-8]	;returnval
	mov	dx,WORD PTR [bp-6]
; Line 4615
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_LDist2D	ENDP
; Line 4618
	PUBLIC	_absL
_absL	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	x = 4
; Line 4619
	mov	ax,WORD PTR [bp+4]	;x
	mov	dx,WORD PTR [bp+6]
	or	dx,dx
	jge	$EX2897
	neg	ax
	adc	dx,0
	neg	dx
; Line 4621
$EX2897:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_absL	ENDP
; Line 4625
	PUBLIC	_sinXL
_sinXL	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
;	holdval = -12
;	tdist = -8
;	cnt = -4
;	shwnum = -2
;	idist = 6
;	tangle = 4
; Line 4631
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
; Line 4633
	sub	cx,cx
	mov	WORD PTR [bp-10],cx
	mov	WORD PTR [bp-12],cx	;holdval
; Line 4634
	mov	cx,WORD PTR [bp+6]	;idist
	mov	dx,WORD PTR [bp+8]
	mov	WORD PTR [bp-8],cx	;tdist
	mov	WORD PTR [bp-6],dx
; Line 4635
	or	dx,dx
	jge	$I2905
; Line 4637
	push	WORD PTR [bp+4]	;tangle
	push	dx
	push	cx
	push	ax
	mov	ax,OFFSET DGROUP:$SG2906
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,12
; Line 4638
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 4639
; Line 4640
$I2905:
	cmp	WORD PTR [bp-6],0
	jl	$FB2909
	jg	$L20022
	cmp	WORD PTR [bp-8],16000	;tdist
	jbe	$FB2909
$L20022:
; Line 4641
	mov	ax,16000
	push	ax
	push	WORD PTR [bp+4]	;tangle
	call	_sinX
	add	sp,4
	cwd	
	add	WORD PTR [bp-12],ax	;holdval
	adc	WORD PTR [bp-10],dx
; Line 4642
	sub	WORD PTR [bp-8],16000	;tdist
	sbb	WORD PTR [bp-6],0
; Line 4644
	jmp	SHORT $I2905
$FB2909:
; Line 4657
	push	WORD PTR [bp-8]	;tdist
	push	WORD PTR [bp+4]	;tangle
	call	_sinX
	cwd	
	add	WORD PTR [bp-12],ax	;holdval
	adc	WORD PTR [bp-10],dx
	mov	ax,WORD PTR [bp-12]	;holdval
	mov	dx,WORD PTR [bp-10]
; Line 4658
	mov	sp,bp
	pop	bp
	ret	

_sinXL	ENDP
; Line 4661
	PUBLIC	_cosXL
_cosXL	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
;	holdval = -10
;	tdist = -6
;	cnt = -2
;	idist = 6
;	tangle = 4
; Line 4666
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1338_i,ax
; Line 4668
	sub	cx,cx
	mov	WORD PTR [bp-8],cx
	mov	WORD PTR [bp-10],cx	;holdval
; Line 4669
	mov	cx,WORD PTR [bp+6]	;idist
	mov	dx,WORD PTR [bp+8]
	mov	WORD PTR [bp-6],cx	;tdist
	mov	WORD PTR [bp-4],dx
; Line 4671
	or	dx,dx
	jge	$I2916
; Line 4673
	push	WORD PTR [bp+4]	;tangle
	push	dx
	push	cx
	push	ax
	mov	ax,OFFSET DGROUP:$SG2917
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,12
; Line 4674
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 4675
; Line 4677
$I2916:
	cmp	WORD PTR [bp-4],0
	jl	$FB2920
	jg	$L20023
	cmp	WORD PTR [bp-6],16000	;tdist
	jbe	$FB2920
$L20023:
; Line 4678
	mov	ax,16000
	push	ax
	push	WORD PTR [bp+4]	;tangle
	call	_cosX
	add	sp,4
	cwd	
	add	WORD PTR [bp-10],ax	;holdval
	adc	WORD PTR [bp-8],dx
; Line 4679
	sub	WORD PTR [bp-6],16000	;tdist
	sbb	WORD PTR [bp-4],0
; Line 4681
	jmp	SHORT $I2916
$FB2920:
; Line 4702
	push	WORD PTR [bp-6]	;tdist
	push	WORD PTR [bp+4]	;tangle
	call	_cosX
	cwd	
	add	WORD PTR [bp-10],ax	;holdval
	adc	WORD PTR [bp-8],dx
	mov	ax,WORD PTR [bp-10]	;holdval
	mov	dx,WORD PTR [bp-8]
; Line 4703
	mov	sp,bp
	pop	bp
	ret	

_cosXL	ENDP
; Line 4951
	PUBLIC	_FirstTargInGroup
_FirstTargInGroup	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	wingcnt = -2
;	prewing2 = -4
;	prewing = 4
; Line 4956
	mov	ax,WORD PTR [bp+4]	;prewing
	mov	WORD PTR [bp-2],ax	;wingcnt
	mov	WORD PTR [bp-4],ax	;prewing2
; Line 4957
	jmp	SHORT $L20141
$FC2929:
; Line 4959
	push	WORD PTR [bp-2]	;wingcnt
	call	_CheckAnyEnemyLock
	add	sp,2
	or	ax,ax
	je	$I2932
; Line 4960
	mov	ax,WORD PTR [bp-2]	;wingcnt
	mov	sp,bp
	pop	bp
	ret	
; Line 4961
; Line 4962
$I2932:
	mov	ax,46
	imul	WORD PTR [bp-2]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-2],ax	;wingcnt
; Line 4963
$L20140:
	cmp	WORD PTR [bp-2],0	;wingcnt
	jge	$FC2929
; Line 4965
	mov	ax,46
	imul	WORD PTR [bp-4]	;prewing2
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-4],ax	;prewing2
	mov	WORD PTR [bp-2],ax	;wingcnt
; Line 4966
$L20141:
	cmp	WORD PTR [bp-4],0	;prewing2
	jge	$L20140
; Line 4967
	mov	ax,-1
; Line 4968
	mov	sp,bp
	pop	bp
	ret	

_FirstTargInGroup	ENDP
_TEXT	ENDS
END
