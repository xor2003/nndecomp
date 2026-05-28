;	Static Name Aliases
;
;	$S1363_i	EQU	i
	TITLE   C:\PLANES3.C
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
PUBLIC  _targetplayer
PUBLIC  _timetargetplayer
EXTRN	_GetTargADP:NEAR
EXTRN	__fstrcpy:NEAR
EXTRN	_PlaneSeek:NEAR
EXTRN	_AIGoHome:NEAR
EXTRN	_DamageMe:NEAR
EXTRN	_cosX:NEAR
EXTRN	_GorillaBomb:NEAR
EXTRN	_RequestCat:NEAR
EXTRN	_StartASmoke:NEAR
EXTRN	_itoa:NEAR
EXTRN	_labs:NEAR
EXTRN	_GetCatHeading:NEAR
EXTRN	_Langle:NEAR
EXTRN	__fstrcat:NEAR
EXTRN	_PreparePlane:NEAR
EXTRN	_AIBombTarget:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_DamageAI:NEAR
EXTRN	_LowBombTarget:NEAR
EXTRN	_GetPlanePtr:NEAR
EXTRN	_AIGetBombDist:NEAR
EXTRN	_Message:NEAR
EXTRN	_CheckAIMissiles:NEAR
EXTRN	_AddSomePlanes2:NEAR
EXTRN	_GetMissilePtr:NEAR
EXTRN	_CheckAIBombs:NEAR
EXTRN	_InitAddedWingmen:NEAR
EXTRN	_ARCTAN:NEAR
EXTRN	_Dist2D:NEAR
EXTRN	_GetAltPitch:NEAR
EXTRN	_CheckCAP:NEAR
EXTRN	_MakeMatHPR:NEAR
EXTRN	_IsCAPFlier:NEAR
EXTRN	_CheckDetection:NEAR
EXTRN	_Rotate:NEAR
EXTRN	_LFlyTo:NEAR
EXTRN	_RsignalOne:NEAR
EXTRN	_CAPAI:NEAR
EXTRN	_LDist2D:NEAR
EXTRN	_gotcha:NEAR
EXTRN	_strcat:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_FlyTo:NEAR
EXTRN	_GetSquadLeader:NEAR
EXTRN	_CheckBlastArea:NEAR
EXTRN	_SetUpCAP1:NEAR
EXTRN	__aNlmul:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_Speech:NEAR
EXTRN	_sinXL:NEAR
EXTRN	_LogIt:NEAR
EXTRN	_BearingToText:NEAR
EXTRN	_xydist:NEAR
EXTRN	_cosXL:NEAR
EXTRN	_StraightAttack:NEAR
EXTRN	_TranslateBehavior:NEAR
EXTRN	_Ladder:NEAR
EXTRN	_Ladder2:NEAR
EXTRN	_FlyWayPoint:NEAR
EXTRN	_Box:NEAR
EXTRN	_FormationSpeedAdjustUS:NEAR
EXTRN	_AirKill:NEAR
EXTRN	_Wall:NEAR
EXTRN	_NSpeech:NEAR
EXTRN	_sinX:NEAR
EXTRN	_abs:NEAR
EXTRN	_Formation:NEAR
EXTRN	_ChangeGroupBehavior:NEAR
EXTRN	_OvalTurn1:NEAR
EXTRN	_TurnTo:NEAR
EXTRN	_FlyStraight:NEAR
EXTRN	_OvalTurn2:NEAR
EXTRN	_DoHover:NEAR
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Txt:BYTE
EXTRN	_Status:WORD
EXTRN	_LastCall:WORD
EXTRN	_AIWingMan:WORD
EXTRN	_closeplane:WORD
EXTRN	_Night:WORD
EXTRN	_wps:BYTE
EXTRN	_ptype:DWORD
EXTRN	_NextWayPoint:WORD
EXTRN	_Gtime:WORD
EXTRN	_planecnt:WORD
EXTRN	_pdest:WORD
EXTRN	_droll:WORD
EXTRN	_lastcatused:WORD
EXTRN	_NRADAR:WORD
_BSS      SEGMENT
COMM NEAR	_spotflags:	 1:	 71
_BSS      ENDS
EXTRN	_MissionWeather:WORD
EXTRN	_orgPlayernum:WORD
EXTRN	_NPLANES:WORD
EXTRN	_Rdrs:BYTE
EXTRN	_aipaths:BYTE
EXTRN	_oldFPX:DWORD
EXTRN	_ps:BYTE
EXTRN	_oldFPZ:DWORD
EXTRN	_aiwaypoints:BYTE
EXTRN	_aiactions:BYTE
EXTRN	_oldAltval:WORD
EXTRN	_Fticks:WORD
EXTRN	_LOCKED:WORD
EXTRN	_Speedy:WORD
EXTRN	_whichourcarr:WORD
EXTRN	_bv:BYTE
EXTRN	_ConfigData:BYTE
EXTRN	_ailoc:BYTE
EXTRN	_paratroopers:BYTE
EXTRN	_Px:WORD
EXTRN	_behavecommands:WORD
EXTRN	_Py:WORD
EXTRN	_PlayerCat:WORD
EXTRN	_PxLng:DWORD
COMM FAR	_carrier:	BYTE:	 208
EXTRN	_PyLng:DWORD
EXTRN	_OurCallSign:BYTE
EXTRN	_LandPat:BYTE
EXTRN	_OurPath:WORD
EXTRN	_OurHead:WORD
EXTRN	_NiteLandPat:BYTE
EXTRN	_OurRoll:WORD
EXTRN	_OurPitch:WORD
EXTRN	_DOINVISIBLE:WORD
EXTRN	_Knots:WORD
EXTRN	_gt:BYTE
EXTRN	_Alt:WORD
EXTRN	_NGTARGETS:WORD
EXTRN	_warstatus:WORD
EXTRN	_ENEMYNODIE:WORD
EXTRN	_planelanding:WORD
EXTRN	_landingstatus:WORD
EXTRN	_OurWingName:BYTE
EXTRN	_KnockItOffStatus:WORD
EXTRN	_Rtime:WORD
EXTRN	_lastOClock:WORD
EXTRN	_tempgotcha:WORD
_DATA      SEGMENT
	ORG	$+4
$SG1612	DB	'(HAWKEYE) ',  00H
$SG1619	DB	'(TOWER) ',  00H
$SG1621	DB	'(CARRIER) ',  00H
$SG1630	DB	' ',  00H
$SG1632	DB	'Status unchanged',  00H
$SG1636	DB	'Clean ',  00H
$SG1639	DB	'Contacts ',  00H
$SG1641	DB	', ',  00H
$SG1643	DB	'160',  00H
$SG1646	DB	'120',  00H
$SG1649	DB	'80',  00H
$SG1652	DB	'40',  00H
$SG1656	DB	' Red and Free ',  00H
$SG1668	DB	' Red and Free ',  00H
$SG1671	DB	' V.I.D ',  00H
$SG1673	DB	' Investigate ',  00H
$SG1676	DB	' Red and Free ',  00H
$SG1678	DB	' No Factor',  00H
$SG1726	DB	' ',  00H
$SG1794	DB	' Forming On Wing',  00H
$SG1824	DB	' Heading Home',  00H
$SG2104	DB	'Recieved New Waypoints',  00H
$SG2137	DB	'No find loc for ',  00H
$SG2176	DB	'(Carrier)Vectoring Assistance ',  00H
$SG2178	DB	'(Carrier)No Assistance Available',  00H
$SG2439	DB	'Damaged By ',  00H
$SG2443	DB	'BOMB',  00H
$SG2459	DB	' Hit By ',  00H
$SG2462	DB	'BOMB',  00H
$SG2468	DB	'Hit by ',  00H
$SG2473	DB	'BOMB',  00H
$SG2647	DB	'Next Sequence Point: ',  00H
$SG2650	DB	'Landing Marshall Point ',  00H
$SG2652	DB	'Carrier ',  00H
$SG2655	DB	'Center of CAP area',  00H
$SG2658	DB	'Way Point ',  00H
$SG2661	DB	' Near',  00H
$SG2663	DB	' Plane ',  00H
$SG2666	DB	' Ground Target ',  00H
$SG2669	DB	' US ',  00H
$SG2672	DB	' Carrier ',  00H
$SG2674	DB	' BOAT ',  00H
$SG2890	DB	'(CARRIER) ',  00H
$SG2892	DB	' Cleared To Land',  00H
$SG2894	DB	' Go To Marshall Point ',  00H
$SG2896	DB	'CHARLIE, Angels ',  00H
$SG2900	DB	'BRAVO, Angels ',  00H
$SG2902	DB	', Angels ',  00H
$SG2904	DB	'ALPHA, Angels ',  00H
$SG2905	DB	'(RIO) Waypoint Updated',  00H
$SG2924	DB	'(CARRIER) ',  00H
$SG2925	DB	' Cleared To Land',  00H
$SG3030	DB	'(RIO) BANDIT ',  00H
$SG3032	DB	'12',  00H
$SG3034	DB	' O''clock ',  00H
$SG3036	DB	'HIGH',  00H
$SG3039	DB	'LOW',  00H
	ORG	$-679
_targetplayer	DW	0fc19H
_timetargetplayer	DW	00H
_DATA      ENDS
_BSS      SEGMENT
$S1363_i	DW 01H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 11
; Line 12
; Line 13
; Line 14
; Line 15
; Line 19
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
; Line 199
	PUBLIC	_InterceptControl
_InterceptControl	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	si
;	intercept = -8
;	prewing = -6
;	ptemp = -4
;	planenum = 4
; Line 204
	cmp	WORD PTR _Gtime,7
	jge	$JCC15
	jmp	$I1413
$JCC15:
; Line 207
	cmp	WORD PTR [bp+4],-1	;planenum
	jge	$JCC24
	jmp	$I1413
$JCC24:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp+4],ax	;planenum
	jle	$JCC35
	jmp	$I1413
$JCC35:
; Line 216
	push	WORD PTR [bp+4]	;planenum
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-6],ax	;prewing
	inc	ax
	jne	$I1400
; Line 217
	mov	ax,WORD PTR _targetplayer
	mov	WORD PTR [bp-8],ax	;intercept
; Line 218
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _timetargetplayer,ax
	jle	$I1406
; Line 219
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1400:
; Line 223
	mov	ax,40
	imul	WORD PTR [bp-6]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+30]
	mov	WORD PTR [bp-8],ax	;intercept
; Line 224
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _ps[bx+28],ax
	jle	$JCC98
	jmp	$I1413
$JCC98:
; Line 226
; Line 227
	mov	ax,40
	imul	WORD PTR [bp-6]	;prewing
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],32
	je	$JCC116
	jmp	$I1413
$JCC116:
; Line 229
	mov	ax,46
	imul	WORD PTR [bp-6]	;prewing
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AIGoHome
	jne	$JCC135
	jmp	$I1413
$JCC135:
; Line 231
	mov	ax,40
	imul	WORD PTR [bp-6]	;prewing
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],8
	je	$I1406
; Line 232
	mov	ax,WORD PTR _Gtime
	add	ax,120
$L20026:
	mov	WORD PTR _ps[bx+28],ax
; Line 233
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 234
; Line 235
$I1406:
; Line 246
	cmp	WORD PTR [bp-8],0	;intercept
	jl	$I1408
	mov	ax,46
	imul	WORD PTR [bp-8]	;intercept
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	jne	$I1408
; Line 247
	mov	ax,40
	imul	WORD PTR [bp-8]	;intercept
	mov	si,ax
	mov	ax,WORD PTR _ps[si+24]
	mov	cx,ax
	test	al,32
	jne	$I1408
	test	cl,1
	je	$I1408
	test	cl,2
	je	$I1408
; Line 251
	push	WORD PTR _bv[bx+10]
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR [bp-6]	;prewing
	je	$I1413
; Line 253
; Line 254
$I1408:
; Line 270
	push	WORD PTR [bp-6]	;prewing
	push	WORD PTR [bp+4]	;planenum
	call	_GetInterceptPlane
	add	sp,4
; Line 272
	cmp	WORD PTR [bp-6],-1	;prewing
	je	$I1410
; Line 273
	mov	ax,40
	imul	WORD PTR [bp-6]	;prewing
	mov	bx,ax
	cmp	WORD PTR _ps[bx+30],-999
	jne	$I1413
; Line 274
	mov	ax,WORD PTR _Gtime
	add	ax,15
	jmp	SHORT $L20026
$I1410:
; Line 285
	cmp	WORD PTR _targetplayer,-999
	jne	$I1413
; Line 286
	mov	ax,WORD PTR _Gtime
	add	ax,15
	mov	WORD PTR _timetargetplayer,ax
; Line 295
$I1413:
; Line 297
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_InterceptControl	ENDP
; Line 300
	PUBLIC	_CheckIfCanIntercept
_CheckIfCanIntercept	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	prewingt = -2
;	tdist2 = -4
;	tdist = 6
;	planenum = 4
; Line 304
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FlyCruise
	je	$I1420
	cmp	WORD PTR _bv[bx],OFFSET _EngageTrain
	jne	$I1419
$I1420:
; Line 305
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 306
; Line 308
	nop	
$I1419:
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],128
	je	$I1421
	cmp	WORD PTR _ps[bx],0
	jge	$I1421
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+38],0
	jl	$I1420
; Line 310
; Line 312
$I1421:
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	jne	$I1422
	cmp	WORD PTR _bv[bx+38],0
	jl	$I1420
; Line 314
; Line 316
$I1422:
	push	WORD PTR [bp+4]	;planenum
	call	_CheckAIMissiles
	add	sp,2
	inc	ax
	je	$I1420
; Line 318
; Line 320
	push	WORD PTR [bp+4]	;planenum
	call	_CheckAIBombs
	add	sp,2
	inc	ax
	jne	$I1420
; Line 322
; Line 323
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],224
	jne	$I1420
; Line 325
; Line 327
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AIGoHome
	jne	$I1428
; Line 328
	cmp	WORD PTR [bp+6],1350	;tdist
	jge	$JCC460
	jmp	$I1420
$JCC460:
; Line 330
; Line 332
$I1428:
; Line 333
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _bv[bx+10]
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-2],ax	;prewingt
	inc	ax
	jne	$I1430
; Line 334
	mov	ax,WORD PTR _targetplayer
	cmp	WORD PTR [bp+4],ax	;planenum
	jne	$I1434
; Line 336
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR _ps[bx+4]
	push	ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR _ps[bx+2]
	jmp	SHORT $L20028
$I1430:
; Line 341
	mov	ax,40
	imul	WORD PTR [bp-2]	;prewingt
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;planenum
	cmp	WORD PTR _ps[bx+30],ax
	jne	$I1434
; Line 343
	mov	cx,40
	imul	cx
	mov	si,ax
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR _ps[si+4]
	push	ax
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR _ps[si+2]
$L20028:
	push	ax
	call	_xydist
	add	sp,4
	mov	cx,WORD PTR [bp+6]	;tdist
	add	cx,45
	cmp	ax,cx
	jbe	$JCC578
	jmp	$I1420
$JCC578:
; Line 345
; Line 346
$I1434:
; Line 348
	mov	ax,1
; Line 349
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CheckIfCanIntercept	ENDP
; Line 352
	PUBLIC	_GetCloseAirBase
_GetCloseAirBase	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	si
;	b = -4
;	r = -2
;	j = -10
;	d = -6
;	tdist = -8
;	distval = 8
;	friend = 6
;	ainum = 4
; Line 356
	mov	WORD PTR [bp-8],32767	;tdist
; Line 357
	mov	WORD PTR [bp-10],0	;j
	jmp	SHORT $F1445
$FC1446:
; Line 359
	mov	bx,WORD PTR [bp-10]	;j
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _Rdrs[bx+6]
	mov	cx,ax
	and	ax,385
	dec	ax
	jne	$I1449
	and	cx,1280
	cmp	cx,WORD PTR [bp+6]	;friend
	je	$I1449
; Line 362
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	si,ax
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR _Rdrs[bx+2]
	push	ax
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR _Rdrs[bx]
	push	ax
	call	_xydist
	add	sp,4
	cmp	ax,WORD PTR [bp-8]	;tdist
	jae	$I1449
; Line 363
	mov	WORD PTR [bp-8],ax	;tdist
; Line 364
	mov	ax,WORD PTR [bp-10]	;j
	mov	WORD PTR [bp-4],ax	;b
; Line 365
; Line 366
$I1449:
; Line 367
	inc	WORD PTR [bp-10]	;j
$F1445:
	mov	ax,WORD PTR _NRADAR
	cmp	WORD PTR [bp-10],ax	;j
	jl	$FC1446
; Line 370
	mov	ax,WORD PTR [bp-8]	;tdist
	mov	bx,WORD PTR [bp+8]	;distval
	mov	WORD PTR [bx],ax
	cmp	ax,32767
	je	$I1450
; Line 371
	mov	ax,WORD PTR [bp-4]	;b
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 372
; Line 373
$I1450:
	mov	ax,-999
; Line 374
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_GetCloseAirBase	ENDP
; Line 377
	PUBLIC	_UpdateInterceptGroup
_UpdateInterceptGroup	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	di
	push	si
;	prewing = -8
;	wingcnt = -6
;	radaron = -4
;	enemynofire = -2
;	dobehave = 6
;	ainum = 4
; Line 381
	sub	ax,ax
	mov	WORD PTR [bp-4],ax	;radaron
	mov	WORD PTR [bp-2],ax	;enemynofire
; Line 385
	push	WORD PTR [bp+4]	;ainum
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-8],ax	;prewing
	inc	ax
	jne	$JCC766
	jmp	$EX1453
$JCC766:
; Line 388
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],1
	je	$I1459
; Line 389
	mov	WORD PTR [bp-4],1	;radaron
; Line 390
$I1459:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	je	$I1460
; Line 391
	mov	WORD PTR [bp-2],1	;enemynofire
; Line 392
$I1460:
	mov	ax,WORD PTR [bp-8]	;prewing
	jmp	$L20032
	nop	
$FC1465:
; Line 397
	push	WORD PTR [bp-6]	;wingcnt
	call	_CheckAIMissiles
	add	sp,2
	inc	ax
	jne	$JCC828
	jmp	$I1476
$JCC828:
	push	WORD PTR [bp-6]	;wingcnt
	call	_CheckAIBombs
	add	sp,2
	inc	ax
	je	$JCC843
	jmp	$I1476
$JCC843:
	mov	ax,46
	imul	WORD PTR [bp-6]	;wingcnt
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],224
	je	$JCC861
	jmp	$I1476
$JCC861:
; Line 398
	cmp	WORD PTR [bp+6],0	;dobehave
	je	$I1471
; Line 399
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	jne	$I1469
; Line 400
	mov	ax,40
	imul	WORD PTR [bp-6]	;wingcnt
	mov	bx,ax
	or	BYTE PTR _ps[bx+25],128
; Line 401
; Line 403
$I1469:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp-6]	;wingcnt
	mov	si,ax
	mov	WORD PTR _bv[si],cx
; Line 404
	mov	ax,WORD PTR _bv[bx+28]
	mov	WORD PTR _bv[si+28],ax
; Line 405
	test	BYTE PTR _bv[bx+21],64
	je	$I1470
; Line 406
	or	BYTE PTR _bv[si+21],64
; Line 407
; Line 408
	jmp	SHORT $I1471
	nop	
$I1470:
; Line 409
	mov	ax,46
	imul	WORD PTR [bp-6]	;wingcnt
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],191
; Line 410
$I1471:
; Line 411
; Line 412
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp-6]	;wingcnt
	mov	si,ax
	mov	WORD PTR _bv[si+10],cx
; Line 413
	mov	ax,WORD PTR _bv[bx+30]
	mov	dx,WORD PTR _bv[bx+32]
	mov	WORD PTR _bv[si+30],ax
	mov	WORD PTR _bv[si+32],dx
; Line 414
	mov	ax,WORD PTR _bv[bx+34]
	mov	dx,WORD PTR _bv[bx+36]
	mov	WORD PTR _bv[si+34],ax
	mov	WORD PTR _bv[si+36],dx
; Line 416
	mov	ax,40
	imul	WORD PTR [bp-6]	;wingcnt
	mov	di,ax
	and	BYTE PTR _ps[di+24],251
	test	BYTE PTR _ps[di+25],128
	jne	$I1472
; Line 417
	mov	WORD PTR _bv[si+22],0
; Line 418
	mov	ax,WORD PTR _bv[bx+14]
	mov	WORD PTR _bv[si+14],ax
; Line 419
; Line 421
$I1472:
	cmp	WORD PTR [bp-4],0	;radaron
	je	$I1473
; Line 422
	mov	ax,46
	imul	WORD PTR [bp-6]	;wingcnt
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],1
; Line 423
	jmp	SHORT $I1474
$I1473:
; Line 424
	mov	ax,46
	imul	WORD PTR [bp-6]	;wingcnt
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],254
$I1474:
; Line 425
	cmp	WORD PTR [bp-2],0	;enemynofire
	je	$I1475
; Line 426
	mov	ax,46
	imul	WORD PTR [bp-6]	;wingcnt
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],2
; Line 427
	jmp	SHORT $I1476
$I1475:
; Line 428
	mov	ax,46
	imul	WORD PTR [bp-6]	;wingcnt
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],253
$I1476:
; Line 429
; Line 431
	mov	ax,46
	imul	WORD PTR [bp-6]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-6],ax	;wingcnt
; Line 432
$L20030:
	cmp	WORD PTR [bp-6],0	;wingcnt
	jl	$JCC1134
	jmp	$FC1465
$JCC1134:
; Line 434
	mov	ax,46
	imul	WORD PTR [bp-8]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-8],ax	;prewing
$L20032:
	mov	WORD PTR [bp-6],ax	;wingcnt
; Line 435
	or	ax,ax
	jge	$L20030
; Line 436
$EX1453:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_UpdateInterceptGroup	ENDP
; Line 439
	PUBLIC	_VectorIntercept
_VectorIntercept	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__aNchkstk
	push	si
;	replacecap = -2
;	whichbehave = -18
;	bogeyangle = -16
;	bogeydist = -8
;	dx = -12
;	dy = -14
;	prewing = -10
;	ptemp = -6
;	targetnum = 6
;	planenum = 4
; Line 467
	cmp	WORD PTR [bp+4],-1	;planenum
	jne	$I1489
; Line 470
	push	WORD PTR [bp+6]	;targetnum
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-10],ax	;prewing
	mov	cx,40
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _ps[bx+30],-1
	jne	$JCC1208
	jmp	$I1519
$JCC1208:
; Line 473
	mov	ax,cx
	imul	WORD PTR [bp-10]	;prewing
	mov	bx,ax
	mov	WORD PTR _ps[bx+30],-1
; Line 474
	mov	ax,cx
	imul	WORD PTR [bp+6]	;targetnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR _Px
	mov	WORD PTR [bp-12],ax	;dx
; Line 475
	mov	cx,WORD PTR _ps[bx+4]
	sub	cx,WORD PTR _Py
	mov	WORD PTR [bp-14],cx	;dy
; Line 476
	neg	cx
	push	cx
	push	ax
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-16],ax	;bogeyangle
; Line 478
	sub	ax,ax
	push	ax
	push	WORD PTR [bp+6]	;targetnum
	push	WORD PTR [bp-14]	;dy
	push	WORD PTR [bp-12]	;dx
	call	_Dist2D
	add	sp,4
	mov	WORD PTR [bp-8],ax	;bogeydist
	push	ax
	push	WORD PTR [bp-16]	;bogeyangle
	sub	ax,ax
	push	ax
	push	ax
	call	_LocationPicture
	add	sp,12
; Line 495
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 496
; Line 498
$I1489:
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp+6]	;targetnum
	cmp	WORD PTR _bv[bx+10],ax
	jne	$I1494
; Line 499
; Line 500
	inc	ax
	je	$I1494
; Line 501
	or	BYTE PTR _bv[bx+21],1
; Line 502
	and	BYTE PTR _bv[bx+21],253
; Line 503
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 504
; Line 505
	nop	
$I1494:
; Line 507
	push	WORD PTR [bp+4]	;planenum
	call	_IsCAPFlier
	add	sp,2
	or	ax,ax
	jne	$JCC1355
	jmp	$I1496
$JCC1355:
; Line 508
	push	WORD PTR [bp+4]	;planenum
	call	_DoCAPReplace
	add	sp,2
; Line 510
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp+6]	;targetnum
	mov	WORD PTR _bv[bx+10],ax
; Line 511
	cmp	WORD PTR _bv[bx+2],-1
	jle	$I1497
; Line 512
	mov	ax,1024
	push	ax
	push	WORD PTR [bp+4]	;planenum
	mov	si,bx
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	jne	$I1498
; Line 513
	mov	WORD PTR _bv[si],OFFSET _Formation
; Line 514
; Line 515
	jmp	SHORT $I1499
$I1498:
; Line 516
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _FlyStraight
$I1499:
; Line 517
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],64
; Line 518
	mov	ax,46
	imul	WORD PTR _bv[bx+2]
	mov	si,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR _bv[si+10],ax
; Line 519
	mov	ax,46
	imul	WORD PTR _bv[bx+2]
	mov	si,ax
	mov	WORD PTR _bv[si],OFFSET _FlyStraight
; Line 520
	mov	ax,46
	imul	WORD PTR _bv[bx+2]
	mov	si,ax
	or	BYTE PTR _bv[si+21],1
; Line 521
	mov	ax,46
	imul	WORD PTR _bv[bx+2]
	jmp	SHORT $L20034
$I1497:
; Line 524
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _FlyStraight
; Line 525
	cmp	WORD PTR _bv[bx+4],-1
	jle	$I1501
; Line 526
	mov	ax,46
	imul	WORD PTR _bv[bx+4]
	mov	si,ax
	mov	WORD PTR _bv[si],OFFSET _Formation
; Line 527
	mov	ax,46
	imul	WORD PTR _bv[bx+4]
	mov	si,ax
	or	BYTE PTR _bv[si+21],64
; Line 528
	mov	ax,46
	imul	WORD PTR _bv[bx+4]
	mov	si,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR _bv[si+10],ax
; Line 529
	mov	ax,46
	imul	WORD PTR _bv[bx+4]
	mov	si,ax
	or	BYTE PTR _bv[si+21],1
; Line 530
	mov	ax,46
	imul	WORD PTR _bv[bx+4]
$L20034:
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],253
; Line 531
; Line 532
$I1501:
; Line 533
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],1
; Line 534
	and	BYTE PTR _bv[bx+21],253
; Line 535
; Line 544
$I1496:
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp+6]	;targetnum
	mov	WORD PTR _bv[bx+10],ax
; Line 546
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	and	BYTE PTR _ps[si+24],251
	test	BYTE PTR _ps[si+25],128
	jne	$I1502
; Line 547
	mov	WORD PTR _bv[bx+22],0
; Line 549
$I1502:
	push	WORD PTR [bp+6]	;targetnum
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,-1
	jle	$I1503
; Line 550
	push	WORD PTR [bp+6]	;targetnum
	call	_GetSquadLeader
	add	sp,2
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;planenum
	mov	WORD PTR _ps[bx+30],ax
; Line 551
	jmp	SHORT $I1504
	nop	
$I1503:
; Line 552
	mov	ax,WORD PTR [bp+4]	;planenum
	mov	WORD PTR _targetplayer,ax
$I1504:
; Line 554
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	add	WORD PTR _bv[bx+18],200
; Line 556
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	push	WORD PTR _ps[si+22]
	mov	si,bx
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-6],ax	;ptemp
	mov	WORD PTR [bp-4],dx
; Line 558
	les	bx,DWORD PTR [bp-6]	;ptemp
	mov	ax,WORD PTR es:[bx+10]
	cmp	WORD PTR _bv[si+18],ax
	jle	$I1507
; Line 559
	cmp	ax,450
	jle	$I1506
; Line 560
	sub	ax,100
	mov	WORD PTR _bv[si+18],ax
; Line 561
	jmp	SHORT $I1507
	nop	
$I1506:
; Line 562
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	si,WORD PTR [bp-6]	;ptemp
	mov	ax,WORD PTR es:[si+10]
	mov	WORD PTR _bv[bx+18],ax
$I1507:
; Line 563
; Line 566
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR [bp+6]	;targetnum
	mov	si,ax
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR _ps[bx+4]
	push	ax
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR _ps[bx+2]
	push	ax
	mov	si,bx
	call	_Dist2D
	add	sp,4
	shl	ax,1
	mov	cx,90
	sub	dx,dx
	div	cx
	mov	WORD PTR [bp-8],ax	;bogeydist
; Line 568
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	jne	$I1508
; Line 569
	or	BYTE PTR _ps[si+25],128
; Line 571
$I1508:
; Line 573
	cmp	WORD PTR [bp-8],30	;bogeydist
	ja	$I1510
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],2
	jne	$JCC1881
	jmp	$I1509
$JCC1881:
$I1510:
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Ladder
	jne	$JCC1900
	jmp	$I1509
$JCC1900:
	cmp	WORD PTR _bv[bx],OFFSET _Wall
	jne	$JCC1911
	jmp	$I1509
$JCC1911:
	cmp	WORD PTR _bv[bx],OFFSET _Box
	jne	$JCC1922
	jmp	$I1509
$JCC1922:
	cmp	WORD PTR _bv[bx],OFFSET _Formation
	jne	$JCC1933
	jmp	$I1509
$JCC1933:
	cmp	WORD PTR _bv[bx],OFFSET _Ladder2
	jne	$JCC1944
	jmp	$I1509
$JCC1944:
	cmp	WORD PTR _bv[bx],OFFSET _FlyStraight
	jne	$JCC1955
	jmp	$I1509
$JCC1955:
; Line 575
	mov	ax,1024
	push	ax
	push	WORD PTR [bp+4]	;planenum
	mov	si,bx
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	je	$I1511
; Line 576
	mov	WORD PTR _bv[si],OFFSET _Formation
; Line 577
	mov	WORD PTR _bv[si+28],88
; Line 578
; Line 579
	jmp	SHORT $I1518
	nop	
$I1511:
; Line 581
	mov	al,BYTE PTR _Gtime
	and	ax,3
	jne	$I1513
; Line 582
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Box
; Line 583
; Line 584
	jmp	SHORT $I1518
$I1513:
	cmp	ax,1
	jne	$I1515
; Line 585
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Ladder
; Line 586
; Line 587
	jmp	SHORT $I1518
	nop	
$I1515:
	cmp	ax,2
	jne	$I1517
; Line 588
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Wall
; Line 589
; Line 590
	jmp	SHORT $I1518
	nop	
$I1517:
; Line 591
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 592
	mov	WORD PTR _bv[bx+28],16
; Line 593
$I1518:
; Line 594
; Line 595
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
$L20035:
	or	BYTE PTR _bv[bx+21],1
; Line 596
	and	BYTE PTR _bv[bx+21],253
; Line 597
	mov	ax,1
	jmp	SHORT $L20033
	nop	
$I1509:
; Line 601
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Ladder
	je	$I1520
	cmp	WORD PTR _bv[bx],OFFSET _Wall
	je	$I1520
	cmp	WORD PTR _bv[bx],OFFSET _Box
	je	$I1520
	cmp	WORD PTR _bv[bx],OFFSET _Formation
	je	$I1520
	cmp	WORD PTR _bv[bx],OFFSET _Ladder2
	je	$I1520
	cmp	WORD PTR _bv[bx],OFFSET _FlyStraight
	je	$I1520
; Line 603
	mov	WORD PTR _bv[bx],OFFSET _FlyStraight
	jmp	SHORT $L20035
$I1520:
; Line 609
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],1
; Line 610
	and	BYTE PTR _bv[bx+21],253
; Line 611
	sub	ax,ax
$L20033:
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_UpdateInterceptGroup
	add	sp,4
; Line 612
$I1519:
; Line 613
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_VectorIntercept	ENDP
; Line 617
	PUBLIC	_GetInterceptPlane
_GetInterceptPlane	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,44
	call	__aNchkstk
	push	si
;	dist = -8
;	dist1 = -12
;	distnm = -42
;	wingnum = -10
;	othertarget = -22
;	otherdist = -16
;	closebasenum = -4
;	basedist = -40
;	isfriend = -6
;	intps = -34
;	ready5num = -26
;	cnt = -14
;	founddist = -2
;	wingrear = -44
;	dx = -28
;	dy = -32
;	dx1 = -30
;	dy1 = -38
;	angle = -18
;	x = -20
;	y = -24
;	interceptnum = -36
;	prewing = 6
;	planenum = 4
; Line 630
	cmp	WORD PTR [bp+4],-1	;planenum
	jle	$I1547
; Line 631
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-20],ax	;x
; Line 632
	mov	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-24],ax	;y
; Line 633
	push	WORD PTR [bp+4]	;planenum
	call	_FriendStatus
	add	sp,2
	mov	WORD PTR [bp-6],ax	;isfriend
; Line 635
; Line 636
	jmp	SHORT $I1548
$I1547:
; Line 637
	mov	ax,WORD PTR _Px
	mov	WORD PTR [bp-20],ax	;x
; Line 638
	mov	ax,WORD PTR _Py
	mov	WORD PTR [bp-24],ax	;y
; Line 639
	mov	WORD PTR [bp-6],1024	;isfriend
; Line 640
$I1548:
; Line 642
	mov	WORD PTR [bp-2],0	;founddist
; Line 643
	cmp	WORD PTR [bp-6],1024	;isfriend
	je	$I1549
; Line 644
	mov	WORD PTR [bp-2],1	;founddist
; Line 645
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR [bp-20]	;x
	mov	WORD PTR [bp-28],ax	;dx
; Line 646
	mov	cx,WORD PTR _Py
	sub	cx,WORD PTR [bp-24]	;y
	mov	WORD PTR [bp-32],cx	;dy
; Line 647
	push	cx
	push	ax
	call	_xydist
	add	sp,4
	mov	WORD PTR [bp-8],ax	;dist
; Line 648
	mov	WORD PTR [bp-36],-1	;interceptnum
; Line 649
; Line 651
$I1549:
	mov	WORD PTR [bp-14],0	;cnt
	jmp	$F1550
	nop	
$FC1551:
; Line 652
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	jne	$JCC2351
	jmp	$I1558
$JCC2351:
	test	cl,2
	jne	$JCC2359
	jmp	$I1558
$JCC2359:
; Line 654
	push	WORD PTR [bp-6]	;isfriend
	push	WORD PTR [bp-14]	;cnt
	mov	si,bx
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	je	$JCC2380
	jmp	$I1558
$JCC2380:
	push	WORD PTR [bp-14]	;cnt
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR [bp-14]	;cnt
	jne	$I1558
; Line 655
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR [bp-24]	;y
	mov	WORD PTR [bp-38],ax	;dy1
	mov	cx,WORD PTR _ps[si+2]
	sub	cx,WORD PTR [bp-20]	;x
	mov	WORD PTR [bp-30],cx	;dx1
; Line 656
	push	ax
	push	cx
	call	_xydist
	add	sp,4
	mov	WORD PTR [bp-12],ax	;dist1
	push	ax
	push	WORD PTR [bp-14]	;cnt
	call	_CheckIfCanIntercept
	add	sp,4
	or	ax,ax
	je	$I1558
; Line 657
	mov	ax,WORD PTR [bp-8]	;dist
	cmp	WORD PTR [bp-12],ax	;dist1
	jb	$I1557
	cmp	WORD PTR [bp-2],0	;founddist
	jne	$I1556
$I1557:
; Line 658
	mov	WORD PTR [bp-2],1	;founddist
; Line 659
	mov	ax,WORD PTR [bp-12]	;dist1
	mov	WORD PTR [bp-8],ax	;dist
; Line 660
	mov	ax,WORD PTR [bp-30]	;dx1
	mov	WORD PTR [bp-28],ax	;dx
; Line 661
	mov	ax,WORD PTR [bp-38]	;dy1
	mov	WORD PTR [bp-32],ax	;dy
; Line 662
	mov	ax,WORD PTR [bp-14]	;cnt
	mov	WORD PTR [bp-36],ax	;interceptnum
; Line 663
; Line 664
$I1556:
	cmp	WORD PTR [bp-12],1800	;dist1
	jae	$I1558
	mov	ax,46
	imul	WORD PTR [bp-14]	;cnt
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	je	$I1558
; Line 665
	push	WORD PTR [bp+4]	;planenum
	push	WORD PTR [bp-14]	;cnt
	call	_VectorIntercept
	add	sp,4
; Line 666
; Line 667
$I1558:
; Line 668
; Line 669
; Line 670
	inc	WORD PTR [bp-14]	;cnt
$F1550:
	mov	ax,WORD PTR [bp-14]	;cnt
	cmp	WORD PTR _NPLANES,ax
	jle	$JCC2531
	jmp	$FC1551
$JCC2531:
; Line 672
	lea	ax,WORD PTR [bp-40]	;basedist
	push	ax
	push	WORD PTR [bp-6]	;isfriend
	push	WORD PTR [bp+4]	;planenum
	call	_GetCloseAirBase
	add	sp,6
	mov	WORD PTR [bp-4],ax	;closebasenum
; Line 673
	cmp	WORD PTR [bp-40],3600	;basedist
	jl	$I1559
; Line 674
	mov	WORD PTR [bp-4],-999	;closebasenum
; Line 676
$I1559:
	cmp	WORD PTR [bp-2],0	;founddist
	jne	$I1561
	cmp	WORD PTR [bp-4],-999	;closebasenum
	je	$I1570
$I1561:
; Line 677
	cmp	WORD PTR [bp-2],0	;founddist
	jne	$I1562
; Line 679
	push	WORD PTR [bp-6]	;isfriend
	push	WORD PTR [bp-4]	;closebasenum
	call	_CheckForMobileR5
	add	sp,4
	mov	WORD PTR [bp-26],ax	;ready5num
	cmp	ax,-999
	je	$I1570
	jmp	SHORT $L20038
	nop	
	nop	
$I1562:
	cmp	WORD PTR [bp-4],-999	;closebasenum
	je	$I1569
; Line 691
	mov	ax,WORD PTR [bp-8]	;dist
	add	ax,1800
	cmp	ax,WORD PTR [bp-40]	;basedist
	jbe	$I1569
	cmp	WORD PTR [bp-40],3600	;basedist
	jge	$I1569
; Line 693
	push	WORD PTR [bp-6]	;isfriend
	push	WORD PTR [bp-4]	;closebasenum
	call	_CheckForMobileR5
	add	sp,4
	mov	WORD PTR [bp-26],ax	;ready5num
	cmp	ax,-999
	je	$I1569
; Line 694
$L20038:
	push	WORD PTR [bp+4]	;planenum
	push	ax
	jmp	SHORT $L20037
; Line 696
; Line 697
	nop	
$I1569:
; Line 698
	cmp	WORD PTR [bp-8],3600	;dist
	jae	$I1570
; Line 699
	push	WORD PTR [bp+4]	;planenum
	push	WORD PTR [bp-36]	;interceptnum
$L20037:
	call	_VectorIntercept
	add	sp,4
; Line 700
; Line 701
$I1570:
; Line 702
; Line 703
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_GetInterceptPlane	ENDP
; Line 706
	PUBLIC	_LocationPicture
_LocationPicture	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,52
	call	__aNchkstk
	push	di
	push	si
;	waynum = -6
;	bogey_org_num = -34
;	whotold = -4
;	psi = -42
;	Mini = -46
;	i = -30
;	dx = -40
;	dy = -44
;	dist = -16
;	angl = -14
;	MinDist = -28
;	MinAngl = -24
;	eyex = -32
;	eyey = -38
;	eyedist = -26
;	bogeyi = -52
;	cnt = -18
;	ptemp = -22
;	carrx = -2
;	carry = -8
;	carrangle = -50
;	carrrelangle = -12
;	carrdist = -36
;	do_id = -48
;	is_target = -10
;	nochange = 14
;	planedetect = 12
;	whatdist = 10
;	whatangle = 8
;	whatis = 6
;	whotoldorg = 4
; Line 712
	mov	WORD PTR [bp-36],18000	;carrdist
; Line 714
	sub	ax,ax
	mov	WORD PTR [bp-48],ax	;do_id
; Line 718
	mov	ax,WORD PTR [bp+4]	;whotoldorg
	mov	WORD PTR [bp-4],ax	;whotold
; Line 720
	or	ax,ax
	jne	$I1610
; Line 721
	mov	WORD PTR [bp-18],ax	;cnt
	jmp	SHORT $F1604
; Line 726
	nop	
	nop	
$I1608:
; Line 727
	inc	WORD PTR [bp-18]	;cnt
$F1604:
	mov	ax,WORD PTR [bp-18]	;cnt
	cmp	WORD PTR _NPLANES,ax
	jle	$FB1606
; Line 722
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I1608
	test	cl,2
	je	$I1608
	test	ch,4
	je	$I1608
; Line 724
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	cmp	WORD PTR es:[bx+38],100
	jne	$I1608
; Line 725
$FB1606:
; Line 729
	mov	ax,WORD PTR [bp-18]	;cnt
	cmp	WORD PTR _NPLANES,ax
	jne	$I1609
; Line 730
	mov	WORD PTR [bp-4],2	;whotold
; Line 731
; Line 732
	jmp	SHORT $I1610
$I1609:
; Line 733
	mov	ax,OFFSET DGROUP:$SG1612
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 734
	mov	ax,40
	imul	WORD PTR [bp-18]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-32],ax	;eyex
; Line 735
	mov	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-38],ax	;eyey
; Line 736
$I1610:
; Line 737
; Line 738
	cmp	WORD PTR [bp-4],2	;whotold
	je	$I1614
	cmp	WORD PTR [bp-4],1	;whotold
	jne	$I1622
$I1614:
; Line 739
	cmp	WORD PTR _whichourcarr,-999
	je	$JCC2854
	jmp	$I1615
$JCC2854:
$I1617:
; Line 751
	mov	WORD PTR [bp-4],3	;whotold
$I1622:
; Line 752
; Line 753
	cmp	WORD PTR [bp-4],3	;whotold
	jne	$I1623
; Line 754
	cmp	WORD PTR _AIWingMan,-999
	jne	$JCC2876
	jmp	$EX1577
$JCC2876:
; Line 756
; Line 757
	mov	ax,40
	imul	WORD PTR _AIWingMan
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	jne	$JCC2898
	jmp	$EX1577
$JCC2898:
	test	cl,2
	jne	$JCC2906
	jmp	$EX1577
$JCC2906:
; Line 758
	cmp	WORD PTR [bp+4],3	;whotoldorg
	je	$I1626
; Line 759
	cmp	WORD PTR [bp+10],1800	;whatdist
	jbe	$JCC2922
	jmp	$EX1577
$JCC2922:
; Line 761
; Line 762
; Line 763
$I1626:
	mov	ax,OFFSET _OurWingName
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 764
	mov	ax,40
	imul	WORD PTR _AIWingMan
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-32],ax	;eyex
; Line 765
	mov	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-38],ax	;eyey
; Line 766
; Line 770
; Line 773
$I1623:
	mov	ax,OFFSET _OurCallSign
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 774
	mov	ax,OFFSET DGROUP:$SG1630
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 776
	cmp	WORD PTR [bp+14],0	;nochange
	je	$I1631
; Line 777
	mov	ax,OFFSET DGROUP:$SG1632
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 778
	jmp	$I1674
	nop	
$I1615:
	mov	ax,40
	imul	WORD PTR _whichourcarr
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	jne	$JCC3033
	jmp	$I1617
$JCC3033:
	test	cl,2
	jne	$JCC3041
	jmp	$I1617
$JCC3041:
; Line 743
	cmp	WORD PTR [bp-4],1	;whotold
	jne	$I1618
; Line 744
	mov	ax,OFFSET DGROUP:$SG1619
	jmp	SHORT $L20040
	nop	
$I1618:
; Line 746
	mov	ax,OFFSET DGROUP:$SG1621
$L20040:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 747
	mov	ax,40
	imul	WORD PTR _whichourcarr
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-32],ax	;eyex
; Line 748
	mov	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-38],ax	;eyey
; Line 749
; Line 750
	jmp	$I1622
$I1631:
; Line 780
	mov	ax,WORD PTR [bp+10]	;whatdist
	mov	WORD PTR [bp-28],ax	;MinDist
; Line 781
	mov	ax,WORD PTR [bp+8]	;whatangle
	mov	WORD PTR [bp-24],ax	;MinAngl
; Line 783
	mov	ax,WORD PTR [bp+12]	;planedetect
	mov	WORD PTR [bp-52],ax	;bogeyi
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR [bp-38]	;eyey
	push	ax
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR [bp-32]	;eyex
	push	ax
	mov	si,bx
	call	_Dist2D
	add	sp,4
	mov	WORD PTR [bp-26],ax	;eyedist
; Line 784
	mov	ax,40
	imul	WORD PTR _whichourcarr
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I1634
	test	cl,2
	je	$I1634
; Line 785
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-2],ax	;carrx
; Line 786
	mov	cx,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-8],cx	;carry
; Line 787
	sub	cx,WORD PTR _ps[si+4]
	push	cx
	sub	ax,WORD PTR _ps[si+2]
	push	ax
	call	_Dist2D
	add	sp,4
	mov	WORD PTR [bp-36],ax	;carrdist
; Line 788
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR [bp-8]	;carry
	push	ax
	mov	ax,WORD PTR [bp-2]	;carrx
	sub	ax,WORD PTR _ps[si+2]
	push	ax
	call	_ARCTAN
	add	sp,4
; Line 789
	sub	ax,WORD PTR _ps[si+16]
	mov	WORD PTR [bp-12],ax	;carrrelangle
; Line 790
; Line 792
$I1634:
	cmp	WORD PTR [bp-28],11250	;MinDist
	jne	$I1635
	cmp	WORD PTR [bp-26],11250	;eyedist
	jl	$I1635
; Line 793
	mov	ax,OFFSET DGROUP:$SG1636
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 794
	mov	ax,42
	jmp	$L20043
$I1635:
; Line 797
	mov	ax,OFFSET DGROUP:$SG1639
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 798
	mov	ax,47
	push	ax
	call	_Speech
	add	sp,2
; Line 800
	mov	ax,1
	push	ax
	push	WORD PTR [bp-24]	;MinAngl
	call	_BearingToText
	add	sp,4
; Line 802
	mov	ax,OFFSET DGROUP:$SG1641
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 807
	mov	ax,WORD PTR [bp-28]	;MinDist
	shl	ax,1
	mov	cx,95
	cwd	
	idiv	cx
	mov	WORD PTR [bp-28],ax	;MinDist
	cmp	ax,160
	jl	$I1642
; Line 808
	mov	ax,OFFSET DGROUP:$SG1643
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 809
	mov	ax,65
$L20045:
	push	ax
	call	_Speech
	add	sp,2
; Line 810
	jmp	SHORT $I1653
$I1642:
	cmp	ax,120
	jl	$I1645
; Line 811
	mov	ax,OFFSET DGROUP:$SG1646
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 812
	mov	ax,64
	jmp	SHORT $L20045
$I1645:
	cmp	ax,80
	jl	$I1648
; Line 814
	mov	ax,OFFSET DGROUP:$SG1649
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 815
	mov	ax,63
	jmp	SHORT $L20045
$I1648:
	cmp	ax,40
	jl	$I1651
; Line 817
	mov	ax,OFFSET DGROUP:$SG1652
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 818
	mov	ax,62
	jmp	SHORT $L20045
$I1651:
; Line 820
	mov	ax,1
	push	ax
	push	WORD PTR [bp-28]	;MinDist
	call	_NSpeech
	add	sp,4
; Line 821
$I1653:
; Line 822
	cmp	WORD PTR _warstatus,1
	jne	$I1655
; Line 823
	mov	ax,OFFSET DGROUP:$SG1656
	jmp	$L20047
$I1655:
	cmp	WORD PTR _warstatus,0
	je	$JCC3469
	jmp	$I1674
$JCC3469:
; Line 829
	cmp	WORD PTR [bp-36],11250	;carrdist
	jb	$I1660
	push	WORD PTR [bp-12]	;carrrelangle
	call	_abs
	add	sp,2
	cmp	ax,1554
	jl	$JCC3493
	jmp	$I1659
$JCC3493:
	cmp	WORD PTR [bp-36],18000	;carrdist
	jb	$JCC3503
	jmp	$I1659
$JCC3503:
$I1660:
; Line 830
	mov	WORD PTR [bp-30],0	;i
	jmp	SHORT $F1661
	nop	
$FC1662:
; Line 831
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	dx,ax
	test	al,2
	je	$I1666
	test	dl,1
	je	$I1666
	test	dh,4
	je	$I1666
	test	dl,32
	jne	$I1666
; Line 832
	mov	ax,WORD PTR _ps[bx+2]
	mov	dx,ax
	mov	ax,cx
	mov	si,dx
	imul	WORD PTR [bp-52]	;bogeyi
	mov	di,ax
	sub	si,WORD PTR _ps[di+2]
; Line 833
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR _ps[di+4]
	mov	WORD PTR [bp-44],ax	;dy
; Line 834
	push	si
	call	_abs
	add	sp,2
	cmp	ax,1800
	jge	$I1666
	push	WORD PTR [bp-44]	;dy
	call	_abs
	add	sp,2
	cmp	ax,1800
	jge	$I1666
; Line 835
	push	WORD PTR [bp-30]	;i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	je	$I1666
; Line 836
	mov	WORD PTR [bp-48],1	;do_id
; Line 837
	mov	ax,WORD PTR _NPLANES
	mov	WORD PTR [bp-30],ax	;i
; Line 838
; Line 839
$I1666:
; Line 840
; Line 841
	inc	WORD PTR [bp-30]	;i
$F1661:
	mov	ax,WORD PTR [bp-30]	;i
	cmp	WORD PTR _NPLANES,ax
	jg	$FC1662
; Line 845
	push	WORD PTR [bp-52]	;bogeyi
	call	_CheckIsWayTarget
	add	sp,2
	or	ax,ax
	je	$I1667
; Line 846
	mov	ax,OFFSET DGROUP:$SG1668
$L20047:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 847
	mov	ax,46
	jmp	SHORT $L20043
	nop	
$I1667:
	cmp	WORD PTR [bp-48],0	;do_id
	je	$I1670
; Line 850
	mov	ax,OFFSET DGROUP:$SG1671
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 851
	mov	ax,45
	jmp	SHORT $L20043
	nop	
$I1670:
; Line 854
	mov	ax,OFFSET DGROUP:$SG1673
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 855
	mov	ax,44
	jmp	SHORT $L20043
	nop	
$I1659:
; Line 862
	push	WORD PTR [bp-52]	;bogeyi
	call	_CheckIsWayTarget
	add	sp,2
	or	ax,ax
	je	$I1675
; Line 863
	mov	ax,OFFSET DGROUP:$SG1676
	jmp	SHORT $L20047
$I1675:
; Line 867
	mov	ax,OFFSET DGROUP:$SG1678
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 868
	mov	ax,43
$L20043:
	push	ax
	call	_Speech
	add	sp,2
; Line 869
; Line 870
$I1674:
; Line 871
; Line 872
; Line 873
; Line 875
	mov	ax,4
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 877
$EX1577:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_LocationPicture	ENDP
; Line 918
	PUBLIC	_CheckE2C
_CheckE2C	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
	push	si
;	targnum = -14
;	targdist = -4
;	ptmptype = -8
;	dist = -10
;	signal = -12
;	angl = -2
;	planenum = 4
; Line 929
	mov	al,BYTE PTR _Rtime
	sub	ah,ah
	mov	WORD PTR [bp-14],ax	;targnum
	cmp	ax,70
	jne	$I1688
; Line 930
	mov	WORD PTR [bp-14],-1	;targnum
; Line 932
$I1688:
	mov	ax,WORD PTR [bp-14]	;targnum
	cmp	WORD PTR _NPLANES,ax
	jl	$I1691
; Line 935
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	mov	si,bx
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-8],ax	;ptmptype
	mov	WORD PTR [bp-6],dx
; Line 937
	push	WORD PTR [bp-14]	;targnum
	push	WORD PTR [bp+4]	;planenum
	call	_FriendStatus
	add	sp,2
	push	ax
	lea	ax,WORD PTR [bp-10]	;dist
	push	ax
	lea	cx,WORD PTR [bp-2]	;angl
	push	cx
	les	bx,DWORD PTR [bp-8]	;ptmptype
	push	WORD PTR es:[bx+14]
	push	WORD PTR _ps[si+6]
	push	WORD PTR _ps[si+4]
	push	WORD PTR _ps[si+2]
	call	_RsignalOne
	add	sp,16
	mov	WORD PTR [bp-12],ax	;signal
; Line 939
	mov	ax,WORD PTR [bp-10]	;dist
	cmp	WORD PTR [bp-12],ax	;signal
	jbe	$I1691
; Line 940
	mov	WORD PTR _tempgotcha,2
; Line 941
	push	WORD PTR [bp-14]	;targnum
	call	_gotcha
	add	sp,2
; Line 942
	mov	WORD PTR _tempgotcha,-999
; Line 943
; Line 944
$I1691:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_CheckE2C	ENDP
; Line 948
	PUBLIC	_TrooperDrop
_TrooperDrop	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	si
;	troopernum = -6
;	ptmptype = -4
;	prewing = -8
;	planenum = 4
; Line 953
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	mov	si,bx
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-4],ax	;ptmptype
	mov	WORD PTR [bp-2],dx
; Line 955
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],150
; Line 957
	mov	ax,WORD PTR _ps[si+34]
	mov	WORD PTR [bp-6],ax	;troopernum
; Line 958
	or	ax,ax
	jle	$I1699
	cmp	ax,19
	jle	$I1698
$I1699:
; Line 959
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	sub	ax,ax
	mov	WORD PTR _ps[bx+34],ax
	mov	WORD PTR [bp-6],ax	;troopernum
; Line 960
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 961
; Line 963
$I1698:
	push	WORD PTR [bp+4]	;planenum
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-8],ax	;prewing
; Line 966
	mov	al,BYTE PTR [bp-8]	;prewing
	xor	al,BYTE PTR _Rtime
	test	al,3
	je	$JCC4035
	jmp	$I1700
$JCC4035:
; Line 967
	les	bx,DWORD PTR [bp-4]	;ptmptype
	mov	ax,WORD PTR [bp-6]	;troopernum
	cmp	WORD PTR es:[bx+32],ax
	jne	$I1701
; Line 968
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	push	WORD PTR es:[bx+26]
	mov	ax,-999
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR [bp+4]	;planenum
	mov	ax,31
	push	ax
	call	_LogIt
	add	sp,24
; Line 970
$I1701:
	mov	al,BYTE PTR [bp+4]	;planenum
	and	ax,3
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	add	WORD PTR [bp-6],ax	;troopernum
; Line 971
	jmp	SHORT $L20048
	nop	
$FC1704:
; Line 972
	sub	WORD PTR [bp-6],20	;troopernum
$L20048:
	cmp	WORD PTR [bp-6],20	;troopernum
	jge	$FC1704
; Line 974
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	cl,3
	mov	si,WORD PTR [bp-6]	;troopernum
	shl	si,cl
	mov	WORD PTR _paratroopers[si],ax
; Line 975
	mov	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR _paratroopers[si+2],ax
; Line 976
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR _paratroopers[si+4],ax
; Line 977
	mov	WORD PTR _paratroopers[si+6],0
; Line 979
	dec	WORD PTR _ps[bx+34]
; Line 987
; Line 990
$I1700:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_TrooperDrop	ENDP
; Line 993
	PUBLIC	_LaunchCruise
_LaunchCruise	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,34
	call	__aNchkstk
	push	di
	push	si
;	planeadded = -6
;	wingcnt = -18
;	tprewing = -2
;	cnt = -8
;	cnt2 = -14
;	aistation = -26
;	tptype = -12
;	planeid = -28
;	tempmissile = -24
;	sideid = -4
;	log_launch = -20
;	log_src = -16
;	planenum = 4
; Line 1005
	push	WORD PTR [bp+4]	;planenum
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR [bp+4]	;planenum
	je	$JCC4213
	jmp	$EX1707
$JCC4213:
; Line 1008
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp+4],ax	;planenum
	jle	$I1721
; Line 1009
	mov	WORD PTR [bp-20],4	;log_launch
; Line 1010
	mov	WORD PTR [bp-16],1	;log_src
; Line 1011
; Line 1012
	jmp	SHORT $I1722
$I1721:
; Line 1013
	mov	WORD PTR [bp-20],3	;log_launch
; Line 1014
	mov	WORD PTR [bp-16],0	;log_src
; Line 1015
$I1722:
; Line 1018
	push	WORD PTR [bp+4]	;planenum
	call	_CheckAIBombs
	add	sp,2
	mov	WORD PTR [bp-26],ax	;aistation
	inc	ax
	jne	$JCC4261
	jmp	$EX1707
$JCC4261:
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FlyCruise
	jne	$JCC4280
	jmp	$EX1707
$JCC4280:
; Line 1019
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-12],ax	;tptype
	mov	WORD PTR [bp-10],dx
; Line 1020
	mov	si,WORD PTR [bp-26]	;aistation
	shl	si,1
	les	bx,DWORD PTR [bp-12]	;tptype
	push	WORD PTR es:[bx+26][si]
	call	_GetMissilePtr
	add	sp,2
	mov	WORD PTR [bp-24],ax	;tempmissile
	mov	WORD PTR [bp-22],dx
; Line 1021
	mov	ax,20
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	add	bx,WORD PTR [bp-26]	;aistation
	shl	bx,1
	cmp	WORD PTR _ps[bx+34],0
	jg	$JCC4351
	jmp	$EX1707
$JCC4351:
	les	bx,DWORD PTR [bp-24]	;tempmissile
	cmp	WORD PTR es:[bx+32],0
	jl	$JCC4364
	jmp	$EX1707
$JCC4364:
; Line 1022
	cmp	WORD PTR [bp+4],0	;planenum
	jl	$I1728
; Line 1023
	mov	ax,OFFSET DGROUP:$SG1726
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 1028
; Line 1029
; Line 1033
; Line 1034
$I1728:
; Line 1038
	mov	ax,20
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	add	bx,WORD PTR [bp-26]	;aistation
	shl	bx,1
	dec	WORD PTR _ps[bx+34]
; Line 1039
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _Gtime
	add	ax,3
	mov	WORD PTR _bv[bx+24],ax
; Line 1041
	les	bx,DWORD PTR [bp-24]	;tempmissile
	mov	ax,WORD PTR es:[bx+32]
	neg	ax
	push	ax
	call	_PlaneSeek
	add	sp,2
	mov	WORD PTR [bp-28],ax	;planeid
; Line 1042
	mov	WORD PTR [bp-4],2	;sideid
; Line 1043
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],4
	je	$I1730
; Line 1044
	mov	WORD PTR [bp-4],0	;sideid
; Line 1045
	jmp	SHORT $I1732
$I1730:
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],1
	je	$I1732
; Line 1046
	mov	WORD PTR [bp-4],1	;sideid
; Line 1048
$I1732:
; Line 1049
	sub	ax,ax
	push	ax
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _bv[bx+18]
	mov	ax,-999
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	push	WORD PTR _ps[si+16]
	mov	ax,WORD PTR _ps[si+6]
	sub	ax,5
	push	ax
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	push	WORD PTR _ps[si+10]
	push	WORD PTR _ps[si+8]
	mov	ax,7
	push	ax
	push	WORD PTR [bp-4]	;sideid
	sub	ax,ax
	push	ax
	mov	cx,1
	push	cx
	push	ax
	mov	dx,5
	push	dx
	push	WORD PTR [bp-28]	;planeid
	mov	dx,-1
	push	dx
	mov	di,bx
	call	_AddSomePlanes2
	add	sp,34
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;planenum
	mov	WORD PTR _bv[bx+6],ax
; Line 1050
	push	WORD PTR [bp-16]	;log_src
	sub	dx,dx
	push	dx
	push	dx
	push	WORD PTR [bp-28]	;planeid
	mov	dx,-999
	push	dx
	push	WORD PTR _ps[si+6]
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	push	WORD PTR _ps[si+10]
	push	WORD PTR _ps[si+8]
	push	ax
	push	WORD PTR [bp-20]	;log_launch
	mov	si,bx
	call	_LogIt
	add	sp,24
; Line 1052
	mov	ax,WORD PTR _bv[di+14]
	mov	WORD PTR _bv[si+14],ax
; Line 1054
	cmp	WORD PTR _warstatus,0
	jne	$I1735
; Line 1055
	mov	ax,40
	imul	WORD PTR _whichourcarr
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I1735
	test	cl,2
	je	$I1735
; Line 1056
	mov	bx,WORD PTR _bv[si+14]
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jg	$I1735
	jl	$L20001
	cmp	WORD PTR _aiwaypoints[bx],-1
	ja	$I1735
$L20001:
	mov	ax,46
	imul	WORD PTR _whichourcarr
	mov	si,ax
	mov	al,BYTE PTR _bv[si+44]
	cbw	
	cwd	
	cmp	WORD PTR _aiwaypoints[bx+4],ax
	jne	$I1735
	cmp	WORD PTR _aiwaypoints[bx+6],dx
	jne	$I1735
; Line 1057
	mov	WORD PTR _warstatus,1
; Line 1058
	mov	WORD PTR _LastCall,-240
; Line 1059
; Line 1060
$I1735:
; Line 1061
; Line 1063
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FlyWayPoint
	jne	$JCC4763
	jmp	$L20049
$JCC4763:
; Line 1066
; Line 1069
	mov	ax,WORD PTR [bp+4]	;planenum
	mov	WORD PTR [bp-2],ax	;tprewing
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
	jmp	$L20052
$FC1741:
; Line 1072
	mov	ax,46
	imul	WORD PTR [bp-18]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	cmp	WORD PTR _bv[si],cx
	je	$JCC4814
	jmp	$I1744
$JCC4814:
; Line 1074
	mov	ax,bx
	mov	bx,WORD PTR [bp-26]	;aistation
	shl	bx,1
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	di,ax
	push	WORD PTR _ps[di+22]
	mov	di,cx
	mov	WORD PTR [bp-30],bx
	call	_GetPlanePtr
	add	sp,2
	mov	bx,WORD PTR [bp-30]
	mov	es,dx
	mov	cx,si
	mov	si,ax
	push	WORD PTR es:[bx+26][si]
	mov	si,cx
	call	_GetMissilePtr
	add	sp,2
	mov	WORD PTR [bp-24],ax	;tempmissile
	mov	WORD PTR [bp-22],dx
; Line 1075
	mov	ax,20
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	add	bx,WORD PTR [bp-26]	;aistation
	shl	bx,1
	cmp	WORD PTR _ps[bx+34],0
	jg	$JCC4896
	jmp	$I1744
$JCC4896:
	les	bx,DWORD PTR [bp-24]	;tempmissile
	cmp	WORD PTR es:[bx+32],0
	jl	$JCC4909
	jmp	$I1744
$JCC4909:
; Line 1076
	mov	ax,WORD PTR es:[bx+32]
	neg	ax
	push	ax
	call	_PlaneSeek
	add	sp,2
	mov	WORD PTR [bp-28],ax	;planeid
; Line 1078
	sub	ax,ax
	push	ax
	push	WORD PTR _bv[di+18]
	mov	cx,-999
	push	cx
	mov	ax,40
	imul	WORD PTR [bp-18]	;wingcnt
	mov	bx,ax
	push	WORD PTR _ps[bx+16]
	mov	ax,WORD PTR _ps[bx+6]
	sub	ax,5
	push	ax
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	ax,7
	push	ax
	push	WORD PTR [bp-4]	;sideid
	sub	ax,ax
	push	ax
	mov	dx,1
	push	dx
	push	ax
	mov	ax,5
	push	ax
	push	WORD PTR [bp-28]	;planeid
	mov	ax,-1
	push	ax
	mov	WORD PTR [bp-32],bx
	call	_AddSomePlanes2
	add	sp,34
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR [bp-18]	;wingcnt
	mov	WORD PTR _bv[bx+6],ax
; Line 1079
	push	WORD PTR [bp-16]	;log_src
	sub	cx,cx
	push	cx
	push	cx
	push	WORD PTR [bp-28]	;planeid
	mov	cx,-999
	push	cx
	mov	cx,bx
	mov	bx,WORD PTR [bp-32]
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	ax
	push	WORD PTR [bp-20]	;log_launch
	mov	WORD PTR [bp-34],cx
	call	_LogIt
	add	sp,24
; Line 1080
	mov	ax,WORD PTR _bv[si+14]
	mov	bx,WORD PTR [bp-34]
	mov	WORD PTR _bv[bx+14],ax
; Line 1081
	mov	ax,20
	imul	WORD PTR [bp-18]	;wingcnt
	mov	bx,ax
	add	bx,WORD PTR [bp-26]	;aistation
	shl	bx,1
	dec	WORD PTR _ps[bx+34]
; Line 1082
	mov	ax,WORD PTR _Gtime
	add	ax,3
	mov	WORD PTR _bv[di+24],ax
; Line 1083
	mov	ax,WORD PTR _bv[si+14]
	inc	ax
	mov	WORD PTR _bv[di+14],ax
; Line 1084
; Line 1085
$I1744:
; Line 1086
	mov	ax,46
	imul	WORD PTR [bp-18]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-18],ax	;wingcnt
; Line 1087
$L20050:
	cmp	WORD PTR [bp-18],0	;wingcnt
	jl	$JCC5144
	jmp	$FC1741
$JCC5144:
; Line 1089
	mov	ax,46
	imul	WORD PTR [bp-2]	;tprewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-2],ax	;tprewing
$L20052:
	mov	WORD PTR [bp-18],ax	;wingcnt
; Line 1090
	cmp	WORD PTR [bp-2],0	;tprewing
	jge	$L20050
; Line 1092
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
$L20049:
	inc	WORD PTR _bv[bx+14]
; Line 1093
$EX1707:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_LaunchCruise	ENDP
; Line 1096
	PUBLIC	_FlyCruise
_FlyCruise	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
	push	si
;	dx = -16
;	dy = -20
;	dz = -22
;	tempalt = -10
;	tdx = -2
;	tdy = -4
;	tdist = -12
;	tdistnm = -6
;	wayval = -8
; Line 1106
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1363_i,ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+14]
	mov	WORD PTR [bp-8],ax	;wayval
; Line 1107
	cmp	ax,-1
	jg	$I1755
; Line 1109
	mov	ax,40
	imul	WORD PTR $S1363_i
$L20053:
	mov	bx,ax
	sub	ax,ax
	mov	WORD PTR _ps[bx+24],ax
	mov	WORD PTR _ps[bx+26],ax
; Line 1110
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1111
; Line 1113
	nop	
$I1755:
	lea	ax,WORD PTR [bp-22]	;dz
	push	ax
	lea	ax,WORD PTR [bp-20]	;dy
	push	ax
	lea	cx,WORD PTR [bp-16]	;dx
	push	cx
	push	WORD PTR [bp-8]	;wayval
	call	_GetWayXYZ
	add	sp,8
; Line 1115
	mov	ax,WORD PTR [bp-20]	;dy
	mov	dx,WORD PTR [bp-18]
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
	mov	WORD PTR [bp-4],ax	;tdy
; Line 1119
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	sub	cx,WORD PTR _ps[bx+4]
	push	cx
	mov	ax,WORD PTR [bp-16]	;dx
	mov	dx,WORD PTR [bp-14]
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
	sub	ax,WORD PTR _ps[bx+2]
	push	ax
	call	_Dist2D
	add	sp,4
	mov	WORD PTR [bp-12],ax	;tdist
	cmp	ax,5
	jae	$I1756
; Line 1120
	push	WORD PTR _planecnt
	call	_CruiseDistruct
	add	sp,2
; Line 1122
	mov	ax,40
	imul	WORD PTR _planecnt
	jmp	$L20053
; Line 1124
; Line 1125
$I1756:
; Line 1126
	shl	ax,1
	mov	cx,90
	sub	dx,dx
	div	cx
	mov	WORD PTR [bp-6],ax	;tdistnm
	cmp	ax,60
	jbe	$I1757
; Line 1127
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR [bp-10],ax	;tempalt
; Line 1128
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	cmp	WORD PTR _bv[bx+18],ax
	jge	$I1760
; Line 1130
	add	WORD PTR _bv[bx+18],5
; Line 1131
; Line 1132
	jmp	SHORT $I1760
	nop	
$I1757:
; Line 1133
	mov	WORD PTR [bp-10],50	;tempalt
; Line 1134
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+18],700
	jle	$I1760
; Line 1135
	sub	WORD PTR _bv[bx+18],10
; Line 1136
$I1760:
; Line 1138
	sub	ax,ax
	push	ax
	mov	ax,-999
	push	ax
	push	WORD PTR [bp-10]	;tempalt
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-18]
	push	WORD PTR [bp-20]	;dy
	call	__aNlmul
	push	dx
	push	ax
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-14]
	push	WORD PTR [bp-16]	;dx
	call	__aNlmul
	push	dx
	push	ax
	call	_LFlyTo
	add	sp,14
; Line 1153
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_FlyCruise	ENDP
; Line 1156
	PUBLIC	_GetLastPosition
_GetLastPosition	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,60
	call	__aNchkstk
	push	di
	push	si
;	a = -2
;	spd = -18
;	Gspd = -50
;	dx = -38
;	dy = -46
;	spd2 = -30
;	speed2 = -4
;	tspd = -34
;	precval = -42
;	precval2 = -54
;	txL = -22
;	tyL = -26
;	taixloc = -8
;	taiyloc = -14
;	talt = -10
;	palt = 10
;	aiyloc = 8
;	aixloc = 6
;	planenum = 4
; Line 1169
	cmp	WORD PTR [bp+4],-1	;planenum
	jne	$I1781
; Line 1170
	mov	ax,WORD PTR _oldFPX
	mov	dx,WORD PTR _oldFPX+2
	mov	bx,WORD PTR [bp+6]	;aixloc
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
; Line 1171
	mov	ax,WORD PTR _oldFPZ
	mov	dx,WORD PTR _oldFPZ+2
	mov	bx,WORD PTR [bp+8]	;aiyloc
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
; Line 1172
	mov	ax,WORD PTR _oldAltval
	jmp	$L20054
; Line 1174
; Line 1176
	nop	
$I1781:
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR [bp-10],ax	;talt
; Line 1177
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
	mov	WORD PTR [bp-22],ax	;txL
	mov	WORD PTR [bp-20],dx
; Line 1178
	mov	cx,WORD PTR _ps[bx+12]
	mov	si,WORD PTR _ps[bx+14]
	mov	WORD PTR [bp-26],cx	;tyL
	mov	WORD PTR [bp-24],si
; Line 1179
	mov	WORD PTR [bp-58],ax
	mov	WORD PTR [bp-56],dx
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-56]
	push	WORD PTR [bp-58]
	mov	di,cx
	mov	WORD PTR [bp-60],bx
	call	__aNlmul
	add	ax,50
	adc	dx,0
	mov	WORD PTR [bp-8],ax	;taixloc
	mov	WORD PTR [bp-6],dx
; Line 1180
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	si
	push	di
	call	__aNlmul
	add	ax,50
	adc	dx,0
	mov	WORD PTR [bp-14],ax	;taiyloc
	mov	WORD PTR [bp-12],dx
; Line 1182
	cmp	WORD PTR _Speedy,1
	je	$JCC5695
	jmp	$I1782
$JCC5695:
; Line 1184
	mov	ax,60
	cwd	
	push	dx
	push	ax
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _Fticks
	cwd	
	push	dx
	push	ax
	mov	bx,WORD PTR [bp-60]
	mov	ax,27
	imul	WORD PTR _ps[bx+26]
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
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-34],ax	;tspd
	mov	WORD PTR [bp-32],dx
	mov	WORD PTR [bp-18],ax	;spd
	mov	WORD PTR [bp-16],dx
; Line 1185
	mov	ax,27
	mov	bx,WORD PTR [bp-60]
	imul	WORD PTR _ps[bx+26]
	mov	cl,6
	sar	ax,cl
	imul	WORD PTR _Fticks
	mov	cx,60
	cwd	
	idiv	cx
; Line 1186
	push	WORD PTR [bp-32]
	push	WORD PTR [bp-34]	;tspd
	push	WORD PTR _ps[bx+18]
	call	_cosXL
	add	sp,6
	mov	WORD PTR [bp-50],ax	;Gspd
	mov	WORD PTR [bp-48],dx
; Line 1187
	push	dx
	push	ax
	mov	bx,WORD PTR [bp-60]
	push	WORD PTR _ps[bx+16]
	call	_sinXL
	add	sp,6
	sub	WORD PTR [bp-8],ax	;taixloc
	sbb	WORD PTR [bp-6],dx
; Line 1189
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-6]
	push	WORD PTR [bp-8]	;taixloc
	call	__aNldiv
	mov	WORD PTR [bp-22],ax	;txL
	mov	WORD PTR [bp-20],dx
; Line 1190
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-48]
	push	WORD PTR [bp-50]	;Gspd
	mov	bx,WORD PTR [bp-60]
	push	WORD PTR _ps[bx+16]
	call	_cosXL
	add	sp,6
	add	WORD PTR [bp-14],ax	;taiyloc
	adc	WORD PTR [bp-12],dx
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;taiyloc
	call	__aNldiv
	mov	WORD PTR [bp-26],ax	;tyL
	mov	WORD PTR [bp-24],dx
; Line 1191
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;spd
	call	__aNldiv
	push	dx
	push	ax
	mov	bx,WORD PTR [bp-60]
	push	WORD PTR _ps[bx+18]
	call	_sinX
	add	sp,6
	sub	WORD PTR [bp-10],ax	;talt
; Line 1192
; Line 1193
	jmp	$I1784
	nop	
$I1782:
; Line 1194
	mov	ax,60
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _Fticks
	cwd	
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,27
	imul	WORD PTR _ps[bx+26]
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
	push	dx
	push	ax
	mov	si,bx
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-18],ax	;spd
	mov	WORD PTR [bp-16],dx
; Line 1195
	push	dx
	push	ax
	push	WORD PTR _ps[si+18]
	call	_cosXL
	add	sp,6
	mov	WORD PTR [bp-50],ax	;Gspd
	mov	WORD PTR [bp-48],dx
; Line 1196
	push	dx
	push	ax
	push	WORD PTR _ps[si+16]
	call	_sinXL
	add	sp,6
	sub	WORD PTR [bp-22],ax	;txL
	sbb	WORD PTR [bp-20],dx
; Line 1197
	push	WORD PTR [bp-48]
	push	WORD PTR [bp-50]	;Gspd
	push	WORD PTR _ps[si+16]
	call	_cosXL
	add	sp,6
	add	WORD PTR [bp-26],ax	;tyL
	adc	WORD PTR [bp-24],dx
; Line 1198
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;spd
	push	WORD PTR _ps[si+18]
	call	_sinXL
	add	sp,6
	add	WORD PTR [bp-10],ax	;talt
; Line 1199
$I1784:
; Line 1202
	push	WORD PTR $S1363_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	je	$I1785
; Line 1203
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-20]
	push	WORD PTR [bp-22]	;txL
	call	__aNlmul
	add	ax,50
	adc	dx,0
	mov	WORD PTR [bp-8],ax	;taixloc
	mov	WORD PTR [bp-6],dx
; Line 1204
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-24]
	push	WORD PTR [bp-26]	;tyL
	call	__aNlmul
	add	ax,50
	adc	dx,0
	jmp	$L20055
$I1785:
; Line 1209
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-20]
	push	WORD PTR [bp-22]	;txL
	call	__aNlmul
	mov	cx,100
	sub	bx,bx
	push	bx
	push	cx
	mov	si,-100
	mov	di,-1
	push	di
	push	si
	push	WORD PTR _oldFPX+2
	push	WORD PTR _oldFPX
	mov	si,ax
	mov	di,dx
	call	__aNldiv
	push	dx
	push	ax
	call	__aNlmul
	add	ax,WORD PTR _oldFPX
	adc	dx,WORD PTR _oldFPX+2
	add	si,ax
	adc	di,dx
	mov	WORD PTR [bp-8],si	;taixloc
	mov	WORD PTR [bp-6],di
; Line 1211
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	cx,-100
	mov	bx,-1
	push	bx
	push	cx
	push	WORD PTR _oldFPZ+2
	push	WORD PTR _oldFPZ
	call	__aNldiv
	push	dx
	push	ax
	call	__aNlmul
	add	ax,WORD PTR _oldFPZ
	adc	dx,WORD PTR _oldFPZ+2
; Line 1212
	mov	cx,100
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR [bp-24]
	push	WORD PTR [bp-26]	;tyL
	mov	si,ax
	mov	di,dx
	call	__aNlmul
	add	ax,si
	adc	dx,di
$L20055:
	mov	WORD PTR [bp-14],ax	;taiyloc
	mov	WORD PTR [bp-12],dx
; Line 1213
; Line 1214
	mov	ax,WORD PTR [bp-8]	;taixloc
	mov	dx,WORD PTR [bp-6]
	mov	bx,WORD PTR [bp+6]	;aixloc
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
; Line 1215
	mov	ax,WORD PTR [bp-14]	;taiyloc
	mov	dx,WORD PTR [bp-12]
	mov	bx,WORD PTR [bp+8]	;aiyloc
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
; Line 1216
	mov	ax,WORD PTR [bp-10]	;talt
$L20054:
	mov	bx,WORD PTR [bp+10]	;palt
	mov	WORD PTR [bx],ax
; Line 1217
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_GetLastPosition	ENDP
; Line 1220
	PUBLIC	_FlyWPFollowPlayer
_FlyWPFollowPlayer	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	tdistnm = -2
;	prewing = -8
;	tempplane = -6
; Line 1227
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1363_i,ax
	push	ax
	call	_GetSquadLeader
	add	sp,2
; Line 1228
	cmp	WORD PTR _planecnt,ax
	je	$I1791
; Line 1229
	call	_Formation
; Line 1230
	mov	sp,bp
	pop	bp
	ret	
; Line 1231
; Line 1233
	nop	
$I1791:
	call	_FlyWayPoint
; Line 1236
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR _Py
	push	ax
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR _Px
	push	ax
	call	_Dist2D
	add	sp,4
	shl	ax,1
	mov	cx,90
	sub	dx,dx
	div	cx
	cmp	ax,3
	jae	$I1792
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _OurHead
	sub	ax,WORD PTR _ps[bx+16]
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,8192
	jge	$I1792
; Line 1238
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	inc	ax
	inc	ax
	push	dx
	push	ax
	mov	ax,OFFSET _Txt
	push	ds
	push	ax
	call	__fstrcpy
	add	sp,8
; Line 1239
	mov	ax,OFFSET DGROUP:$SG1794
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 1240
	mov	ax,4
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
; Line 1241
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _FollowPlayer
; Line 1242
	mov	ax,WORD PTR _Gtime
	add	ax,300
	mov	WORD PTR _bv[bx+22],ax
; Line 1243
	mov	WORD PTR _bv[bx+28],53
; Line 1244
; Line 1252
$I1792:
	mov	sp,bp
	pop	bp
	ret	

_FlyWPFollowPlayer	ENDP
; Line 1255
	PUBLIC	_FollowPlayer
_FollowPlayer	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,64
	call	__aNchkstk
;	dx = -42
;	dy = -52
;	dx2 = -58
;	dy2 = -64
;	dz = -54
;	tx = -38
;	ty = -48
;	relangle = -26
;	tangle = -30
;	tpitch = -36
;	troll = -46
;	enemyalt = -60
;	prewing = -34
;	temphead = -24
;	secplace = -6
;	tempwing = -28
;	prespeed = -22
;	tdist = -20
;	distkm = -32
;	tdistnm = -12
;	tempalt = -18
;	ourleadalt = -44
;	txt = -4
;	tyt = -10
;	tempplane = -16
; Line 1273
	mov	WORD PTR _pdest,0
; Line 1275
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1363_i,ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+20]
	and	ax,15
	mov	WORD PTR [bp-6],ax	;secplace
; Line 1277
	mov	ax,40
	imul	WORD PTR $S1363_i
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	call	_GetDAltSpeed
	add	sp,2
	add	ax,WORD PTR _Knots
	mov	WORD PTR [bp-22],ax	;prespeed
; Line 1279
	mov	ax,WORD PTR _OurHead
	sub	ax,20480
	mov	WORD PTR [bp-24],ax	;temphead
; Line 1284
	lea	ax,WORD PTR [bp-44]	;ourleadalt
	push	ax
	lea	cx,WORD PTR [bp-52]	;dy
	push	cx
	lea	dx,WORD PTR [bp-42]	;dx
	push	dx
	mov	bx,-1
	mov	WORD PTR [bp-34],bx	;prewing
	mov	WORD PTR [bp-28],bx	;tempwing
	push	bx
	call	_GetLastPosition
	add	sp,8
; Line 1285
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	ax,100
	imul	WORD PTR _bv[bx+28]
	push	dx
	push	ax
	push	WORD PTR [bp-24]	;temphead
	call	_sinXL
	add	sp,6
	add	WORD PTR [bp-42],ax	;dx
	adc	WORD PTR [bp-40],dx
; Line 1286
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	ax,100
	imul	WORD PTR _bv[bx+28]
	push	dx
	push	ax
	push	WORD PTR [bp-24]	;temphead
	call	_cosXL
	add	sp,6
	sub	WORD PTR [bp-52],ax	;dy
	sbb	WORD PTR [bp-50],dx
; Line 1288
	mov	ax,WORD PTR [bp-44]	;ourleadalt
	add	ax,10
	mov	WORD PTR [bp-18],ax	;tempalt
; Line 1290
	cmp	ax,75
	jge	$I1821
; Line 1291
	mov	WORD PTR [bp-18],75	;tempalt
; Line 1293
$I1821:
	push	WORD PTR [bp-22]	;prespeed
	push	WORD PTR [bp-34]	;prewing
	push	WORD PTR [bp-18]	;tempalt
	push	WORD PTR [bp-50]
	push	WORD PTR [bp-52]	;dy
	push	WORD PTR [bp-40]
	push	WORD PTR [bp-42]	;dx
	call	_LFlyTo
	add	sp,14
; Line 1295
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+22],0
	je	$I1823
; Line 1296
	mov	ax,WORD PTR _bv[bx+22]
	sub	ax,WORD PTR _Gtime
	cmp	ax,2
	jge	$I1823
; Line 1298
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-16],ax	;tempplane
	mov	WORD PTR [bp-14],dx
	inc	ax
	inc	ax
	push	dx
	push	ax
	mov	ax,OFFSET _Txt
	push	ds
	push	ax
	call	__fstrcpy
	add	sp,8
; Line 1299
	mov	ax,OFFSET DGROUP:$SG1824
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 1300
	mov	ax,4
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
; Line 1301
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _Gtime
	dec	ax
	mov	WORD PTR _bv[bx+22],ax
; Line 1302
; Line 1303
$I1823:
; Line 1322
	mov	sp,bp
	pop	bp
	ret	

_FollowPlayer	ENDP
; Line 1325
	PUBLIC	_GetWhoCover
_GetWhoCover	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	si
;	cnt = -6
;	isfriend = -4
;	returnval = -2
;	tdist = -10
;	cdist = -8
;	planenum = 4
; Line 1328
	mov	WORD PTR [bp-2],-999	;returnval
; Line 1331
	push	WORD PTR [bp+4]	;planenum
	call	_FriendStatus
	add	sp,2
; Line 1333
	mov	WORD PTR [bp-8],1800	;cdist
; Line 1334
	mov	WORD PTR [bp-6],0	;cnt
	jmp	$F1833
	nop	
$FC1834:
; Line 1335
	push	WORD PTR [bp+4]	;planenum
	push	WORD PTR [bp-6]	;cnt
	call	_FriendMatch
	add	sp,4
	or	ax,ax
	jne	$JCC6926
	jmp	$I1841
$JCC6926:
	mov	ax,WORD PTR [bp+4]	;planenum
	cmp	WORD PTR [bp-6],ax	;cnt
	jne	$JCC6937
	jmp	$I1841
$JCC6937:
	mov	ax,40
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I1841
	test	cl,2
	je	$I1841
; Line 1336
	push	WORD PTR [bp-6]	;cnt
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR [bp-6]	;cnt
	jne	$I1841
; Line 1337
	mov	ax,46
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _GorillaBomb
	jne	$I1841
; Line 1338
	cmp	WORD PTR _bv[bx+10],-1
	je	$I1840
	push	WORD PTR [bp+4]	;planenum
	push	WORD PTR _bv[bx+10]
	call	_FriendMatch
	add	sp,4
	or	ax,ax
	je	$I1841
$I1840:
; Line 1340
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR [bp-6]	;cnt
	mov	si,ax
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR _ps[bx+4]
	push	ax
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR _ps[bx+2]
	push	ax
	call	_Dist2D
	add	sp,4
	cmp	ax,WORD PTR [bp-8]	;cdist
	jae	$I1841
; Line 1342
	mov	ax,WORD PTR [bp-6]	;cnt
	mov	WORD PTR [bp-2],ax	;returnval
; Line 1343
; Line 1344
$I1841:
; Line 1345
; Line 1346
; Line 1347
; Line 1348
	inc	WORD PTR [bp-6]	;cnt
$F1833:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-6],ax	;cnt
	jge	$JCC7079
	jmp	$FC1834
$JCC7079:
; Line 1349
	cmp	WORD PTR [bp-2],-999	;returnval
	je	$I1842
; Line 1350
$L20057:
	mov	ax,WORD PTR [bp-2]	;returnval
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1352
	nop	
$I1842:
	mov	WORD PTR [bp-6],0	;cnt
	jmp	SHORT $F1843
	nop	
$FC1844:
	inc	WORD PTR [bp-6]	;cnt
$F1843:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-6],ax	;cnt
	jge	$L20057
; Line 1353
	push	WORD PTR [bp+4]	;planenum
	push	WORD PTR [bp-6]	;cnt
	call	_FriendMatch
	add	sp,4
	or	ax,ax
	je	$FC1844
	mov	ax,WORD PTR [bp+4]	;planenum
	cmp	WORD PTR [bp-6],ax	;cnt
	je	$FC1844
	mov	ax,40
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$FC1844
	test	cl,2
	je	$FC1844
; Line 1354
	push	WORD PTR [bp-6]	;cnt
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR [bp-6]	;cnt
	jne	$FC1844
; Line 1355
	mov	ax,46
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	je	$I1849
	push	WORD PTR [bp+4]	;planenum
	push	WORD PTR _bv[bx+10]
	call	_FriendMatch
	add	sp,4
	or	ax,ax
	jne	$FC1844
$I1849:
; Line 1357
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR [bp-6]	;cnt
	mov	si,ax
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR _ps[bx+4]
	push	ax
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR _ps[bx+2]
	push	ax
	call	_Dist2D
	add	sp,4
	cmp	ax,WORD PTR [bp-8]	;cdist
	jb	$JCC7255
	jmp	$FC1844
$JCC7255:
; Line 1359
	mov	ax,WORD PTR [bp-6]	;cnt
	mov	WORD PTR [bp-2],ax	;returnval
; Line 1360
; Line 1361
; Line 1362
; Line 1363
; Line 1364
	jmp	$FC1844
	nop	

_GetWhoCover	ENDP
; Line 1369
	PUBLIC	_GorillaCover
_GorillaCover	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,52
	call	__aNchkstk
	push	di
	push	si
;	dz = -46
;	relangle = -20
;	tangle = -24
;	tpitch = -28
;	troll = -40
;	enemyalt = -52
;	temphead = -18
;	secplace = -4
;	tempwing = -22
;	prespeed = -16
;	tempspeed = -12
;	tdist = -14
;	distkm = -26
;	tdistnm = -8
;	offangle = -6
;	hsep = -2
;	ourleadalt = -38
;	tempalt = -10
;	dpwhead = -36
;	covernum = -50
;	tnextsec = -48
;	prewing = -34
;	dx = -32
;	dy = -44
; Line 1386
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1363_i,ax
	push	ax
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-34],ax	;prewing
; Line 1388
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I1878
; Line 1389
	push	WORD PTR _planecnt
	mov	si,bx
	call	_GetWhoCover
	add	sp,2
	mov	WORD PTR _bv[si+10],ax
; Line 1390
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-999
	jne	$I1877
; Line 1391
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 1392
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	si,ax
	or	BYTE PTR _ps[si+24],4
; Line 1393
	mov	WORD PTR _bv[bx+10],-1
; Line 1394
	sub	ax,ax
	push	ax
	push	WORD PTR _planecnt
	call	_ChangeGroupBehavior
	add	sp,4
; Line 1395
; Line 1396
$I1877:
	mov	ax,WORD PTR [bp-34]	;prewing
	cmp	WORD PTR _planecnt,ax
	jne	$I1878
; Line 1397
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,46
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR _bv[bx+10],ax
; Line 1398
$I1878:
; Line 1399
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR [bp-50],ax	;covernum
; Line 1401
	mov	ax,WORD PTR [bp-34]	;prewing
	cmp	WORD PTR _planecnt,ax
	jne	$I1880
; Line 1403
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-48],ax	;tnextsec
	cmp	ax,-999
	je	$I1880
; Line 1404
	mov	cx,46
	imul	cx
	mov	si,ax
	mov	WORD PTR _bv[si],OFFSET _RearCover
; Line 1405
	mov	ax,cx
	imul	WORD PTR [bp-48]	;tnextsec
	mov	si,ax
	mov	ax,WORD PTR [bp-50]	;covernum
	mov	WORD PTR _bv[si+10],ax
; Line 1407
	mov	ax,-999
	mov	WORD PTR _bv[si+6],ax
	mov	WORD PTR _bv[bx+8],ax
; Line 1408
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-48]	;tnextsec
	call	_ChangeGroupBehavior
	add	sp,4
; Line 1409
; Line 1410
$I1880:
; Line 1415
	mov	ax,46
	imul	WORD PTR [bp-50]	;covernum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
	mov	WORD PTR [bp-16],ax	;prespeed
; Line 1417
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],0
	jl	$I1881
; Line 1418
	mov	ax,WORD PTR _bv[bx+2]
	mov	WORD PTR [bp-22],ax	;tempwing
; Line 1420
	mov	cx,40
	mov	bx,ax
	imul	cx
	mov	si,ax
	mov	ax,WORD PTR _ps[si+16]
	sub	ax,16384
	mov	WORD PTR [bp-18],ax	;temphead
; Line 1424
	mov	WORD PTR [bp-2],4320	;hsep
; Line 1426
	mov	ax,bx
	mov	cx,46
	imul	cx
	jmp	SHORT $L20058
	nop	
$I1881:
; Line 1431
	mov	ax,WORD PTR [bp-50]	;covernum
	mov	WORD PTR [bp-22],ax	;tempwing
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	add	ah,64
	mov	WORD PTR [bp-18],ax	;temphead
; Line 1435
	mov	WORD PTR [bp-2],720	;hsep
; Line 1437
	mov	ax,46
	imul	WORD PTR [bp-22]	;tempwing
$L20058:
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
	mov	WORD PTR [bp-16],ax	;prespeed
; Line 1438
; Line 1442
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
	mov	bx,WORD PTR [bp-22]	;tempwing
	shl	bx,cl
	add	ax,WORD PTR _ailoc[bx]
	adc	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-32],ax	;dx
	mov	WORD PTR [bp-30],dx
; Line 1443
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
	mov	WORD PTR [bp-44],cx	;dy
	mov	WORD PTR [bp-42],bx
; Line 1444
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],0
	jge	$I1883
; Line 1450
	mov	ax,12032
	mov	dx,13
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR [bp-22]	;tempwing
	mov	bx,ax
	push	WORD PTR _ps[bx+16]
	mov	si,bx
	call	_sinXL
	add	sp,6
	add	WORD PTR [bp-32],ax	;dx
	adc	WORD PTR [bp-30],dx
; Line 1451
	mov	ax,12032
	mov	dx,13
	push	dx
	push	ax
	push	WORD PTR _ps[si+16]
	call	_cosXL
	add	sp,6
	sub	WORD PTR [bp-44],ax	;dy
	sbb	WORD PTR [bp-42],dx
; Line 1452
; Line 1453
$I1883:
	mov	ax,40
	imul	WORD PTR [bp-22]	;tempwing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR [bp-38],ax	;ourleadalt
; Line 1455
	mov	cx,WORD PTR [bp-50]	;covernum
	cmp	WORD PTR [bp-22],cx	;tempwing
	jne	$I1884
; Line 1456
	add	ax,20
	mov	WORD PTR [bp-38],ax	;ourleadalt
; Line 1458
$I1884:
; Line 1460
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+26]
	add	ax,WORD PTR [bp-38]	;ourleadalt
	mov	WORD PTR [bp-10],ax	;tempalt
	cmp	ax,75
	jge	$I1885
; Line 1461
	mov	WORD PTR [bp-10],75	;tempalt
; Line 1463
$I1885:
	push	WORD PTR [bp-16]	;prespeed
	push	WORD PTR [bp-22]	;tempwing
	push	WORD PTR [bp-10]	;tempalt
	push	WORD PTR [bp-42]
	push	WORD PTR [bp-44]	;dy
	push	WORD PTR [bp-30]
	push	WORD PTR [bp-32]	;dx
	call	_LFlyTo
	add	sp,14
; Line 1483
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GorillaCover	ENDP
; Line 1486
	PUBLIC	_RearCover
_RearCover	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,52
	call	__aNchkstk
	push	di
	push	si
;	tnextsec = -48
;	prewing = -34
;	dx = -32
;	dy = -44
;	dz = -46
;	relangle = -20
;	tangle = -24
;	tpitch = -28
;	troll = -40
;	enemyalt = -52
;	temphead = -18
;	secplace = -4
;	tempwing = -22
;	prespeed = -16
;	tempspeed = -12
;	tdist = -14
;	distkm = -26
;	tdistnm = -8
;	offangle = -6
;	hsep = -2
;	ourleadalt = -38
;	tempalt = -10
;	dpwhead = -36
;	covernum = -50
; Line 1503
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1363_i,ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I1912
; Line 1504
	push	WORD PTR $S1363_i
	call	_GetWhoCover
	add	sp,2
; Line 1505
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-999
	jne	$I1912
; Line 1506
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 1507
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 1508
	sub	ax,ax
	push	ax
	push	WORD PTR _planecnt
	call	_ChangeGroupBehavior
	add	sp,4
; Line 1509
; Line 1510
$I1912:
; Line 1511
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR [bp-50],ax	;covernum
; Line 1513
	push	WORD PTR _planecnt
	call	_GetSquadLeader
	add	sp,2
; Line 1515
	cmp	WORD PTR _planecnt,ax
	je	$JCC7981
	jmp	$I1916
$JCC7981:
; Line 1516
	mov	ax,46
	imul	WORD PTR [bp-50]	;covernum
	mov	bx,ax
	mov	ax,46
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _GorillaCover
	jne	$JCC8009
	jmp	$I1916
$JCC8009:
; Line 1517
	cmp	WORD PTR _bv[bx],OFFSET _SetUpCAP1
	jne	$I1915
; Line 1518
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _SetUpCAP1
; Line 1519
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	si,ax
	mov	ax,WORD PTR _ps[si+8]
	mov	dx,WORD PTR _ps[si+10]
	add	ax,21600
	adc	dx,0
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 1520
	mov	ax,WORD PTR _ps[si+12]
	mov	dx,WORD PTR _ps[si+14]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 1521
	mov	ax,1
	push	ax
	push	WORD PTR _planecnt
	call	_UpdateInterceptGroup
	add	sp,4
; Line 1522
; Line 1523
	jmp	SHORT $I1916
$I1915:
; Line 1527
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _GorillaCover
; Line 1528
	cmp	WORD PTR _bv[bx+4],0
	jl	$I1917
; Line 1529
	mov	ax,46
	imul	WORD PTR _bv[bx+4]
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _GorillaCover
; Line 1530
; Line 1531
$I1917:
	mov	ax,46
	imul	WORD PTR [bp-50]	;covernum
	mov	bx,ax
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR _bv[bx+10],ax
; Line 1532
$I1916:
; Line 1533
; Line 1534
; Line 1539
	mov	ax,46
	imul	WORD PTR [bp-50]	;covernum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
	mov	WORD PTR [bp-16],ax	;prespeed
; Line 1541
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],0
	jl	$I1918
; Line 1542
	mov	ax,WORD PTR _bv[bx+2]
	mov	WORD PTR [bp-22],ax	;tempwing
; Line 1544
	mov	cx,40
	mov	bx,ax
	imul	cx
	mov	si,ax
	mov	ax,WORD PTR _ps[si+16]
	sub	ax,16384
	mov	WORD PTR [bp-18],ax	;temphead
; Line 1548
	mov	WORD PTR [bp-2],4320	;hsep
; Line 1550
	mov	ax,bx
	mov	cx,46
	imul	cx
	jmp	SHORT $L20059
	nop	
$I1918:
; Line 1553
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+6],0
	jl	$I1920
; Line 1554
	mov	ax,WORD PTR _bv[bx+6]
	jmp	SHORT $L20060
$I1920:
; Line 1556
	mov	ax,WORD PTR [bp-50]	;covernum
$L20060:
	mov	WORD PTR [bp-22],ax	;tempwing
; Line 1558
	mov	ax,40
	imul	WORD PTR [bp-22]	;tempwing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	add	ah,64
	mov	WORD PTR [bp-18],ax	;temphead
; Line 1562
	mov	WORD PTR [bp-2],720	;hsep
; Line 1564
	mov	ax,46
	imul	WORD PTR [bp-22]	;tempwing
$L20059:
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
	mov	WORD PTR [bp-16],ax	;prespeed
; Line 1565
; Line 1569
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
	mov	bx,WORD PTR [bp-22]	;tempwing
	shl	bx,cl
	add	ax,WORD PTR _ailoc[bx]
	adc	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-32],ax	;dx
	mov	WORD PTR [bp-30],dx
; Line 1570
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
	mov	WORD PTR [bp-44],cx	;dy
	mov	WORD PTR [bp-42],bx
; Line 1571
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],0
	jge	$I1922
; Line 1577
	mov	ax,-26752
	mov	dx,6
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR [bp-22]	;tempwing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	add	ah,128
	push	ax
	mov	si,bx
	call	_sinXL
	add	sp,6
	add	WORD PTR [bp-32],ax	;dx
	adc	WORD PTR [bp-30],dx
; Line 1578
	mov	ax,-26752
	mov	dx,6
	push	dx
	push	ax
	mov	ax,WORD PTR _ps[si+16]
	add	ah,128
	push	ax
	call	_cosXL
	add	sp,6
	sub	WORD PTR [bp-44],ax	;dy
	sbb	WORD PTR [bp-42],dx
; Line 1579
; Line 1580
$I1922:
	mov	ax,40
	imul	WORD PTR [bp-22]	;tempwing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR [bp-38],ax	;ourleadalt
; Line 1582
	mov	cx,WORD PTR [bp-22]	;tempwing
	cmp	WORD PTR [bp-50],cx	;covernum
	jne	$I1923
; Line 1583
	add	ax,20
	mov	WORD PTR [bp-38],ax	;ourleadalt
; Line 1585
$I1923:
; Line 1587
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+26]
	add	ax,WORD PTR [bp-38]	;ourleadalt
	mov	WORD PTR [bp-10],ax	;tempalt
	cmp	ax,75
	jge	$I1924
; Line 1588
	mov	WORD PTR [bp-10],75	;tempalt
; Line 1590
$I1924:
	push	WORD PTR [bp-16]	;prespeed
	push	cx
	push	WORD PTR [bp-10]	;tempalt
	push	WORD PTR [bp-42]
	push	WORD PTR [bp-44]	;dy
	push	WORD PTR [bp-30]
	push	WORD PTR [bp-32]	;dx
	call	_LFlyTo
	add	sp,14
; Line 1591
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_RearCover	ENDP
; Line 1597
	PUBLIC	_SARCAP1
_SARCAP1	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
;	wingnum = -2
;	xval = -6
;	yval = -10
;	zval = -12
; Line 1602
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1363_i,ax
; Line 1604
	call	_CheckCAP
; Line 1606
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+14],-1
	je	$I1930
; Line 1607
	lea	ax,WORD PTR [bp-12]	;zval
	push	ax
	lea	ax,WORD PTR [bp-10]	;yval
	push	ax
	lea	cx,WORD PTR [bp-6]	;xval
	push	cx
	push	WORD PTR _bv[bx+14]
	call	_GetWayXYZ
	add	sp,8
; Line 1608
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-6]	;xval
	mov	dx,WORD PTR [bp-4]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 1609
	mov	ax,WORD PTR [bp-10]	;yval
	mov	dx,WORD PTR [bp-8]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 1610
; Line 1612
$I1930:
	mov	ax,2000
	push	ax
	mov	ax,16627
	cwd	
	push	dx
	push	ax
	sub	ax,ax
	push	ax
	call	_SARCAP0
	add	sp,8
	or	ax,ax
	jne	$JCC8648
	jmp	$I1931
$JCC8648:
; Line 1613
	mov	WORD PTR [bp-2],-999	;wingnum
; Line 1614
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jle	$I1932
; Line 1615
	mov	ax,WORD PTR _bv[bx+2]
	jmp	SHORT $L20061
$I1932:
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+4],-1
	jle	$I1934
; Line 1617
	mov	ax,WORD PTR _bv[bx+4]
$L20061:
	mov	WORD PTR [bp-2],ax	;wingnum
; Line 1618
$I1934:
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _SARCAP2
; Line 1619
	test	BYTE PTR _bv[bx+20],32
	jne	$I1935
; Line 1620
	or	BYTE PTR _bv[bx+21],1
; Line 1621
$I1935:
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+4],-1
	jle	$I1936
; Line 1623
	mov	ax,46
	imul	WORD PTR [bp-2]	;wingnum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _SARCAP1
	je	$I1938
	cmp	WORD PTR _bv[bx],OFFSET _SARCAP2
	je	$I1938
	cmp	WORD PTR _bv[bx],OFFSET _Formation
	jne	$I1937
$I1938:
; Line 1624
	mov	ax,46
	imul	WORD PTR [bp-2]	;wingnum
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],450
; Line 1625
	mov	WORD PTR _bv[bx],OFFSET _SARCAP3
; Line 1626
; Line 1627
$I1937:
	mov	ax,46
	imul	WORD PTR [bp-2]	;wingnum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],32
	jne	$I1939
; Line 1628
	or	BYTE PTR _bv[bx+21],1
; Line 1629
$I1939:
	mov	ax,46
	imul	WORD PTR [bp-2]	;wingnum
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],253
; Line 1630
; Line 1631
$I1936:
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],400
; Line 1632
; Line 1633
$I1931:
	mov	sp,bp
	pop	bp
	ret	

_SARCAP1	ENDP
; Line 1636
	PUBLIC	_SARCAP2
_SARCAP2	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
;	wingnum = -2
;	xval = -6
;	yval = -10
;	zval = -12
; Line 1641
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1363_i,ax
; Line 1643
	call	_CheckCAP
; Line 1645
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+14],-1
	je	$I1945
; Line 1646
	lea	ax,WORD PTR [bp-12]	;zval
	push	ax
	lea	ax,WORD PTR [bp-10]	;yval
	push	ax
	lea	cx,WORD PTR [bp-6]	;xval
	push	cx
	push	WORD PTR _bv[bx+14]
	call	_GetWayXYZ
	add	sp,8
; Line 1647
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-6]	;xval
	mov	dx,WORD PTR [bp-4]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 1648
	mov	ax,WORD PTR [bp-10]	;yval
	mov	dx,WORD PTR [bp-8]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 1649
; Line 1651
$I1945:
	mov	ax,2000
	push	ax
	mov	ax,16627
	cwd	
	push	dx
	push	ax
	mov	ax,-24576
	push	ax
	call	_SARCAP0
	add	sp,8
	or	ax,ax
	jne	$JCC8965
	jmp	$I1946
$JCC8965:
; Line 1652
	mov	WORD PTR [bp-2],-999	;wingnum
; Line 1653
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jle	$I1947
; Line 1654
	mov	ax,WORD PTR _bv[bx+2]
	jmp	SHORT $L20062
	nop	
$I1947:
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+4],-1
	jle	$I1949
; Line 1656
	mov	ax,WORD PTR _bv[bx+4]
$L20062:
	mov	WORD PTR [bp-2],ax	;wingnum
; Line 1657
$I1949:
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _SARCAP3
; Line 1658
	test	BYTE PTR _bv[bx+20],32
	jne	$I1950
; Line 1659
	or	BYTE PTR _bv[bx+21],1
; Line 1660
$I1950:
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+4],-1
	jle	$I1951
; Line 1661
	mov	ax,46
	imul	WORD PTR [bp-2]	;wingnum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _SARCAP3
	jne	$I1952
; Line 1662
	mov	WORD PTR _bv[bx+18],450
; Line 1663
	mov	WORD PTR _bv[bx],OFFSET _SARCAP1
; Line 1664
; Line 1665
$I1952:
	mov	ax,46
	imul	WORD PTR [bp-2]	;wingnum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],32
	jne	$I1953
; Line 1666
	or	BYTE PTR _bv[bx+21],1
; Line 1667
$I1953:
	mov	ax,46
	imul	WORD PTR [bp-2]	;wingnum
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],253
; Line 1668
; Line 1669
$I1951:
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],400
; Line 1670
; Line 1671
$I1946:
	mov	sp,bp
	pop	bp
	ret	

_SARCAP2	ENDP
; Line 1674
	PUBLIC	_SARCAP3
_SARCAP3	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
;	wingnum = -2
;	xval = -6
;	yval = -10
;	zval = -12
; Line 1679
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1363_i,ax
; Line 1681
	call	_CheckCAP
; Line 1683
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+14],-1
	je	$I1959
; Line 1684
	lea	ax,WORD PTR [bp-12]	;zval
	push	ax
	lea	ax,WORD PTR [bp-10]	;yval
	push	ax
	lea	cx,WORD PTR [bp-6]	;xval
	push	cx
	push	WORD PTR _bv[bx+14]
	call	_GetWayXYZ
	add	sp,8
; Line 1685
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-6]	;xval
	mov	dx,WORD PTR [bp-4]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 1686
	mov	ax,WORD PTR [bp-10]	;yval
	mov	dx,WORD PTR [bp-8]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 1687
; Line 1689
$I1959:
	mov	ax,2000
	push	ax
	mov	ax,16627
	cwd	
	push	dx
	push	ax
	mov	ax,24576
	push	ax
	call	_SARCAP0
	add	sp,8
	or	ax,ax
	jne	$JCC9259
	jmp	$I1960
$JCC9259:
; Line 1690
	mov	WORD PTR [bp-2],-999	;wingnum
; Line 1691
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jle	$I1961
; Line 1692
	mov	ax,WORD PTR _bv[bx+2]
	jmp	SHORT $L20063
	nop	
$I1961:
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+4],-1
	jle	$I1963
; Line 1694
	mov	ax,WORD PTR _bv[bx+4]
$L20063:
	mov	WORD PTR [bp-2],ax	;wingnum
; Line 1695
$I1963:
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _SARCAP1
; Line 1696
	test	BYTE PTR _bv[bx+20],32
	jne	$I1964
; Line 1697
	or	BYTE PTR _bv[bx+21],1
; Line 1698
$I1964:
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+4],-1
	jle	$I1965
; Line 1699
	mov	ax,46
	imul	WORD PTR [bp-2]	;wingnum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _SARCAP1
	jne	$I1966
; Line 1700
	mov	WORD PTR _bv[bx+18],450
; Line 1701
	mov	WORD PTR _bv[bx],OFFSET _SARCAP2
; Line 1702
; Line 1703
$I1966:
	mov	ax,46
	imul	WORD PTR [bp-2]	;wingnum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],32
	jne	$I1967
; Line 1704
	or	BYTE PTR _bv[bx+21],1
; Line 1705
$I1967:
	mov	ax,46
	imul	WORD PTR [bp-2]	;wingnum
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],253
; Line 1706
; Line 1707
$I1965:
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],400
; Line 1708
; Line 1709
$I1960:
	mov	sp,bp
	pop	bp
	ret	

_SARCAP3	ENDP
; Line 1712
	PUBLIC	_SARCAP0
_SARCAP0	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,34
	call	__aNchkstk
	push	si
;	tdist = -8
;	distnm = -32
;	distkm = -18
;	smalldist = -26
;	secplace = -2
;	dx = -24
;	dy = -30
;	dalt = -6
;	temphead = -10
;	temphead2 = -14
;	relangle = -12
;	rrelangle = -22
;	enemyhead = -4
;	tangle = -16
;	tpitch = -20
;	troll = -28
;	enemyalt = -34
;	whatalt = 10
;	whatdist = 6
;	whatangle = 4
; Line 1723
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1363_i,ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+20]
	and	ax,15
; Line 1726
	mov	cx,WORD PTR _bv[bx+34]
	mov	dx,WORD PTR _bv[bx+36]
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
	mov	WORD PTR [bp-30],cx	;dy
; Line 1727
	add	ax,16
	mov	cx,125
	imul	cx
	mov	WORD PTR [bp-6],ax	;dalt
; Line 1728
	mov	ax,WORD PTR [bp+4]	;whatangle
	mov	WORD PTR [bp-10],ax	;temphead
; Line 1729
	mov	cx,WORD PTR [bp+6]	;whatdist
	mov	dx,WORD PTR [bp+8]
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
	mov	WORD PTR [bp-26],cx	;smalldist
; Line 1730
	push	cx
	push	ax
	mov	si,bx
	call	_sinX
	add	sp,4
	mov	cx,WORD PTR _bv[si+30]
	mov	dx,WORD PTR _bv[si+32]
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
	add	ax,cx
	mov	WORD PTR [bp-24],ax	;dx
; Line 1733
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-6]	;dalt
	push	WORD PTR [bp-26]	;smalldist
	push	WORD PTR [bp-10]	;temphead
	call	_cosX
	add	sp,4
	sub	WORD PTR [bp-30],ax	;dy
	push	WORD PTR [bp-30]	;dy
	push	WORD PTR [bp-24]	;dx
	call	_FlyTo
	add	sp,8
	or	ax,ax
	je	$I1990
; Line 1734
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1735
; Line 1747
	nop	
$I1990:
	sub	ax,ax
; Line 1749
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_SARCAP0	ENDP
; Line 1752
	PUBLIC	_GetWayPointChanges
_GetWayPointChanges	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
;	cnt = -10
;	numactions = -4
;	startaction = -18
;	whataction = -6
;	temphead = -14
;	temphead2 = -16
;	actionval = -2
;	numwp = -12
;	returnval = -8
;	wpflag = 20
;	launch = 18
;	attack = 16
;	heading = 14
;	elevation = 12
;	nspeed = 10
;	formnum = 8
;	behavenum = 6
;	numorgwp = 4
; Line 1761
	mov	WORD PTR [bp-8],-999	;returnval
; Line 1764
	mov	ax,-1
	mov	bx,WORD PTR [bp+6]	;behavenum
	mov	WORD PTR [bx],ax
	mov	bx,WORD PTR [bp+8]	;formnum
	mov	WORD PTR [bx],ax
; Line 1766
	mov	bx,WORD PTR [bp+10]	;nspeed
	mov	WORD PTR [bx],ax
	mov	bx,WORD PTR [bp+12]	;elevation
	mov	WORD PTR [bx],ax
; Line 1768
	mov	bx,WORD PTR [bp+14]	;heading
	mov	WORD PTR [bx],ax
	mov	bx,WORD PTR [bp+16]	;attack
	mov	WORD PTR [bx],ax
; Line 1769
	mov	bx,WORD PTR [bp+18]	;launch
	mov	WORD PTR [bx],ax
; Line 1770
	mov	bx,WORD PTR [bp+20]	;wpflag
	mov	WORD PTR [bx],0
; Line 1772
	mov	ax,WORD PTR [bp+4]	;numorgwp
	mov	WORD PTR [bp-12],ax	;numwp
; Line 1773
	cmp	ax,-1
	jg	$I2010
; Line 1774
	mov	ax,-999
	mov	sp,bp
	pop	bp
	ret	
; Line 1776
	nop	
$I2010:
	mov	bx,WORD PTR [bp-12]	;numwp
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx],-2
	jne	$I2011
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jne	$I2011
; Line 1777
	inc	WORD PTR [bp-12]	;numwp
; Line 1779
$I2011:
	mov	bx,WORD PTR [bp-12]	;numwp
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _aiwaypoints[bx+12]
	mov	WORD PTR [bp-4],ax	;numactions
; Line 1780
	mov	cx,WORD PTR _aiwaypoints[bx+10]
	mov	WORD PTR [bp-18],cx	;startaction
; Line 1782
	or	ax,ax
	jne	$I2012
; Line 1783
$L20064:
	mov	ax,WORD PTR [bp-8]	;returnval
	mov	sp,bp
	pop	bp
	ret	
; Line 1785
$I2012:
	mov	ax,cx
	mov	WORD PTR [bp-10],ax	;cnt
	jmp	$F2013
$I2016:
	cmp	ax,12
	jne	$I2019
; Line 1794
	mov	ax,cx
	shr	ax,1
	shr	ax,1
	mov	bx,WORD PTR [bp+12]	;elevation
	jmp	$L20068
	nop	
$I2019:
	cmp	ax,16
	jne	$I2021
; Line 1797
	mov	ax,cx
	mov	WORD PTR [bp-14],ax	;temphead
; Line 1798
	jmp	SHORT $L20065
$FC2023:
; Line 1799
	sub	WORD PTR [bp-14],360	;temphead
$L20065:
	cmp	WORD PTR [bp-14],360	;temphead
	jge	$FC2023
; Line 1800
	jmp	SHORT $L20066
$FC2026:
; Line 1801
	add	WORD PTR [bp-14],360	;temphead
$L20066:
	cmp	WORD PTR [bp-14],0	;temphead
	jl	$FC2026
; Line 1803
	mov	WORD PTR [bp-16],0	;temphead2
; Line 1804
	jmp	SHORT $L20067
$FC2029:
; Line 1805
	sub	WORD PTR [bp-14],45	;temphead
; Line 1806
	add	BYTE PTR [bp-15],32
; Line 1807
$L20067:
	cmp	WORD PTR [bp-14],45	;temphead
	jge	$FC2029
; Line 1810
	mov	ax,182
	imul	WORD PTR [bp-14]	;temphead
	add	WORD PTR [bp-16],ax	;temphead2
	mov	ax,WORD PTR [bp-16]	;temphead2
	jmp	SHORT $L20069
$I2021:
	cmp	ax,16
	jne	$I2032
; Line 1813
	mov	ax,cx
$L20069:
	mov	bx,WORD PTR [bp+14]	;heading
	jmp	$L20068
	nop	
$I2032:
	cmp	ax,18
	jne	$I2034
; Line 1816
	mov	bx,WORD PTR [bp+18]	;launch
$L20070:
	mov	WORD PTR [bx],1
; Line 1817
; Line 1818
	jmp	$I2076
	nop	
$I2034:
	cmp	ax,14
	jne	$I2036
; Line 1819
	mov	bx,WORD PTR [bp+16]	;attack
	jmp	SHORT $L20070
$I2036:
	cmp	ax,19
	jne	$I2038
; Line 1822
	mov	bx,WORD PTR [bp+20]	;wpflag
	or	BYTE PTR [bx],32
; Line 1823
; Line 1824
	jmp	$I2076
$I2038:
	cmp	ax,20
	jne	$I2040
; Line 1825
	mov	bx,WORD PTR [bp+20]	;wpflag
	or	BYTE PTR [bx],16
; Line 1826
; Line 1827
	jmp	$I2076
$I2040:
	cmp	ax,21
	jne	$I2042
; Line 1828
	mov	bx,WORD PTR [bp+20]	;wpflag
	or	BYTE PTR [bx],64
; Line 1829
; Line 1830
	jmp	$I2076
$I2042:
	cmp	ax,29
	jne	$I2044
; Line 1831
	mov	bx,WORD PTR [bp+20]	;wpflag
	or	BYTE PTR [bx+1],16
; Line 1832
; Line 1833
	jmp	$I2076
	nop	
$I2044:
	cmp	ax,30
	jne	$I2046
; Line 1834
	mov	bx,WORD PTR [bp+20]	;wpflag
	or	BYTE PTR [bx+1],32
; Line 1835
; Line 1836
	jmp	$I2076
	nop	
$I2046:
	cmp	ax,31
	jne	$I2048
; Line 1837
	mov	bx,WORD PTR [bp+20]	;wpflag
	or	BYTE PTR [bx+1],64
; Line 1838
; Line 1839
	jmp	$I2076
	nop	
$I2048:
	cmp	ax,32
	jne	$I2050
; Line 1840
	cmp	WORD PTR _KnockItOffStatus,0
	je	$JCC10030
	jmp	$I2076
$JCC10030:
; Line 1841
	mov	ax,cx
	shr	ax,1
	shr	ax,1
	mov	WORD PTR _KnockItOffStatus,ax
; Line 1842
; Line 1843
	jmp	$I2076
	nop	
$I2050:
	cmp	ax,33
	jne	$I2053
; Line 1844
	mov	WORD PTR _warstatus,0
; Line 1845
; Line 1846
	jmp	$I2076
$I2053:
	cmp	ax,15
	jne	$I2055
; Line 1847
	mov	bx,WORD PTR [bp+20]	;wpflag
	or	BYTE PTR [bx],128
; Line 1848
	mov	ax,WORD PTR [bp-2]	;actionval
	mov	WORD PTR _OurPath,ax
; Line 1849
; Line 1850
	jmp	$I2076
$I2055:
	cmp	ax,17
	jne	$I2057
; Line 1851
	mov	bx,WORD PTR [bp+20]	;wpflag
	or	BYTE PTR [bx+1],1
; Line 1852
; Line 1853
	jmp	$I2076
	nop	
$I2057:
	cmp	ax,22
	jne	$I2059
; Line 1854
	cmp	WORD PTR _Gtime,0
	je	$I2060
; Line 1855
	push	WORD PTR _planecnt
	call	_TrooperDrop
	add	sp,2
; Line 1856
$I2060:
	mov	bx,WORD PTR [bp+20]	;wpflag
	or	BYTE PTR [bx+1],2
; Line 1857
; Line 1858
	jmp	SHORT $I2076
	nop	
$I2059:
	cmp	ax,23
	jne	$I2062
; Line 1859
	mov	bx,WORD PTR [bp+20]	;wpflag
	or	BYTE PTR [bx+1],4
; Line 1860
; Line 1861
	jmp	SHORT $I2076
$I2062:
	cmp	ax,24
	jne	$I2064
; Line 1862
	mov	WORD PTR _DOINVISIBLE,1
; Line 1863
; Line 1864
	jmp	SHORT $I2076
	nop	
$I2064:
	cmp	ax,28
	jne	$I2066
; Line 1865
	mov	WORD PTR _ENEMYNODIE,1
; Line 1866
; Line 1867
	jmp	SHORT $I2076
	nop	
$I2066:
	cmp	ax,26
	jne	$I2068
; Line 1868
	or	BYTE PTR _Status+1,16
; Line 1869
; Line 1870
	jmp	SHORT $I2076
$I2068:
	cmp	ax,34
	jne	$I2070
; Line 1871
	mov	bx,WORD PTR [bp+20]	;wpflag
	or	BYTE PTR [bx+1],128
; Line 1872
; Line 1873
	jmp	SHORT $I2076
$I2070:
	cmp	ax,1
	jne	$I2072
; Line 1874
	mov	ax,cx
	mov	bx,WORD PTR [bp+8]	;formnum
	mov	WORD PTR [bx],ax
; Line 1875
	mov	bx,WORD PTR [bp+6]	;behavenum
	cmp	WORD PTR [bx],-1
	jne	$I2076
	jmp	$L20070
	nop	
$I2072:
	cmp	ax,27
	jne	$I2075
; Line 1880
	mov	bx,WORD PTR [bp+20]	;wpflag
	or	BYTE PTR [bx+1],8
; Line 1881
	mov	ax,WORD PTR [bp-2]	;actionval
	mov	WORD PTR [bp-8],ax	;returnval
; Line 1882
; Line 1883
	jmp	SHORT $I2076
$I2075:
; Line 1884
	mov	bx,WORD PTR [bp+6]	;behavenum
$L20068:
	mov	WORD PTR [bx],ax
; Line 1885
$I2076:
; Line 1886
	inc	WORD PTR [bp-10]	;cnt
$F2013:
	mov	ax,WORD PTR [bp-18]	;startaction
	add	ax,WORD PTR [bp-4]	;numactions
	cmp	ax,WORD PTR [bp-10]	;cnt
	jg	$JCC10259
	jmp	$L20064
$JCC10259:
; Line 1786
	mov	bx,WORD PTR [bp-10]	;cnt
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR _aiactions[bx]
; Line 1787
	mov	cx,WORD PTR _aiactions[bx+2]
	mov	WORD PTR [bp-2],cx	;actionval
; Line 1789
	cmp	ax,13
	je	$JCC10285
	jmp	$I2016
$JCC10285:
; Line 1790
	or	cx,cx
	je	$I2076
; Line 1791
	mov	bx,WORD PTR [bp+10]	;nspeed
	mov	WORD PTR [bx],cx
; Line 1792
; Line 1793
	jmp	SHORT $I2076
	nop	

_GetWayPointChanges	ENDP
; Line 1891
	PUBLIC	_DoNextWayPt
_DoNextWayPt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,30
	call	__aNchkstk
;	behavenum = -28
;	formnum = -14
;	speedval = -12
;	altval = -10
;	headval = -16
;	attack = -24
;	launch = -26
;	wpflag = -4
;	aistation = -30
;	tptype = -20
;	returnval = -8
;	treturnval = -22
;	temppath = -6
;	basetemp = -2
;	waypt = 6
;	planenum = 4
; Line 1895
	mov	WORD PTR [bp-8],0	;returnval
; Line 1900
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+12]
	cbw	
	mov	WORD PTR [bp-6],ax	;temppath
; Line 1901
	cmp	WORD PTR [bp+6],0	;waypt
	jl	$I2095
	or	ax,ax
	jge	$I2094
$I2095:
; Line 1902
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 1904
$I2094:
	mov	cl,3
	mov	bx,ax
	shl	bx,cl
	mov	ax,WORD PTR _aipaths[bx+4]
	add	ax,WORD PTR _aipaths[bx+6]
	cmp	ax,WORD PTR [bp+6]	;waypt
	ja	$I2096
; Line 1905
	push	WORD PTR [bp+4]	;planenum
	call	_IsBombing
	add	sp,2
	or	ax,ax
	je	$I2095
; Line 1906
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 1907
	jmp	SHORT $I2095
; Line 1908
; Line 1911
$I2096:
	lea	ax,WORD PTR [bp-4]	;wpflag
	push	ax
	lea	ax,WORD PTR [bp-26]	;launch
	push	ax
	lea	ax,WORD PTR [bp-24]	;attack
	push	ax
	lea	ax,WORD PTR [bp-16]	;headval
	push	ax
	lea	ax,WORD PTR [bp-10]	;altval
	push	ax
	lea	ax,WORD PTR [bp-12]	;speedval
	push	ax
	lea	ax,WORD PTR [bp-14]	;formnum
	push	ax
	lea	cx,WORD PTR [bp-28]	;behavenum
	push	cx
	push	WORD PTR [bp+6]	;waypt
	call	_GetWayPointChanges
	add	sp,18
; Line 1913
	cmp	WORD PTR [bp-28],-1	;behavenum
	je	$I2098
; Line 1914
	push	WORD PTR [bp-14]	;formnum
	push	WORD PTR [bp-28]	;behavenum
	push	WORD PTR [bp+4]	;planenum
	call	_TranslateBehavior
	add	sp,6
	mov	WORD PTR [bp-8],ax	;returnval
; Line 1916
$I2098:
	cmp	WORD PTR [bp-24],-1	;attack
	je	$I2099
; Line 1917
	push	WORD PTR [bp+4]	;planenum
	call	_LaunchCruise
	add	sp,2
; Line 1918
; Line 1919
$I2099:
	test	BYTE PTR [bp-4],64	;wpflag
	je	$I2100
; Line 1920
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR $S1363_i
	mov	ax,15
	push	ax
	call	_LogIt
	add	sp,24
; Line 1921
	push	WORD PTR [bp+4]	;planenum
	call	_AirKill
	add	sp,2
; Line 1922
	mov	WORD PTR [bp-8],1	;returnval
; Line 1923
; Line 1924
$I2100:
	test	BYTE PTR [bp-3],2
	je	$I2102
; Line 1925
	sub	ax,ax
	push	ax
	mov	ax,512
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_DoGroupAction
	add	sp,6
; Line 1926
	mov	WORD PTR [bp-8],1	;returnval
; Line 1927
; Line 1928
$I2102:
	test	BYTE PTR [bp-4],128	;wpflag
	je	$I2103
; Line 1929
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG2104
	push	ax
	call	_Message
	add	sp,4
; Line 1930
; Line 1931
$I2103:
	test	BYTE PTR [bp-4],32	;wpflag
	je	$I2105
; Line 1932
	mov	WORD PTR [bp-8],1	;returnval
; Line 1933
; Line 1934
$I2105:
	test	BYTE PTR [bp-4],16	;wpflag
	je	$I2106
; Line 1935
	mov	WORD PTR [bp-8],1	;returnval
; Line 1936
; Line 1941
$I2106:
	cmp	WORD PTR [bp-26],-1	;launch
	je	$I2107
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	je	$I2107
; Line 1942
	push	WORD PTR [bp+6]	;waypt
	push	WORD PTR [bp+4]	;planenum
	call	_SetUpLaunch
	add	sp,4
; Line 1943
; Line 1944
$I2107:
	test	BYTE PTR [bp-3],1
	je	$I2110
; Line 1946
	push	WORD PTR [bp+4]	;planenum
	call	_FormOnWP
	add	sp,2
	mov	WORD PTR [bp-22],ax	;treturnval
	or	ax,ax
	je	$I2110
; Line 1947
	mov	WORD PTR [bp-8],ax	;returnval
; Line 1948
$I2110:
; Line 1949
	mov	ax,WORD PTR [bp-8]	;returnval
; Line 1950
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DoNextWayPt	ENDP
; Line 1953
	PUBLIC	_GetWayXYZ
_GetWayXYZ	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	cnt = -4
;	otherplane = -2
;	zval = 10
;	yval = 8
;	xval = 6
;	waynum = 4
; Line 1957
	mov	bx,WORD PTR [bp+4]	;waynum
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx+2],0
	jl	$I2118
; Line 1958
	mov	ax,WORD PTR _aiwaypoints[bx]
	mov	dx,WORD PTR _aiwaypoints[bx+2]
	mov	si,WORD PTR [bp+6]	;xval
	mov	WORD PTR [si],ax
	mov	WORD PTR [si+2],dx
; Line 1959
	mov	ax,WORD PTR _aiwaypoints[bx+4]
	mov	dx,WORD PTR _aiwaypoints[bx+6]
	mov	si,WORD PTR [bp+8]	;yval
	mov	WORD PTR [si],ax
	mov	WORD PTR [si+2],dx
; Line 1960
	mov	ax,WORD PTR _aiwaypoints[bx+8]
	mov	bx,WORD PTR [bp+10]	;zval
	mov	WORD PTR [bx],ax
; Line 1961
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1962
; Line 1964
$I2118:
; Line 1966
	push	WORD PTR [bp+10]	;zval
	push	WORD PTR [bp+8]	;yval
	push	WORD PTR [bp+6]	;xval
	mov	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _aiwaypoints[bx+4]
	push	ax
	mov	si,bx
	call	_GetPlanePointXYZ
	add	sp,8
; Line 1969
	cmp	WORD PTR _aiwaypoints[si+8],10
	jbe	$I2119
; Line 1970
	mov	ax,WORD PTR _aiwaypoints[si+8]
	mov	bx,WORD PTR [bp+10]	;zval
	mov	WORD PTR [bx],ax
; Line 1972
$I2119:
	mov	bx,WORD PTR [bp+4]	;waynum
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx],-2
	jne	$I2120
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jne	$I2120
; Line 1973
	mov	ax,WORD PTR _aiwaypoints[bx+14]
	mov	dx,WORD PTR _aiwaypoints[bx+16]
	mov	si,WORD PTR [bp+6]	;xval
	add	WORD PTR [si],ax
	adc	WORD PTR [si+2],dx
; Line 1974
	mov	ax,WORD PTR _aiwaypoints[bx+18]
	mov	dx,WORD PTR _aiwaypoints[bx+20]
	mov	bx,WORD PTR [bp+8]	;yval
	add	WORD PTR [bx],ax
	adc	WORD PTR [bx+2],dx
; Line 1977
; Line 1978
$I2120:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_GetWayXYZ	ENDP
; Line 1981
	PUBLIC	_GetPlanePointXYZ
_GetPlanePointXYZ	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
	push	si
;	cnt = -4
;	otherplane = -2
;	tx = -8
;	ty = -12
;	tz = -14
;	zval = 10
;	yval = 8
;	xval = 6
;	planenum = 4
; Line 1991
	mov	ax,WORD PTR [bp+4]	;planenum
	mov	WORD PTR [bp-2],ax	;otherplane
	push	ax
	call	_GetPlaneOrgNum
	add	sp,2
	mov	WORD PTR [bp-4],ax	;cnt
	inc	ax
	jne	$I2131
; Line 1992
	mov	ax,WORD PTR _PxLng
	mov	dx,WORD PTR _PxLng+2
	mov	bx,WORD PTR [bp+6]	;xval
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
; Line 1993
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	mov	bx,WORD PTR [bp+8]	;yval
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
; Line 1994
	mov	ax,WORD PTR _Alt
	jmp	$L20072
; Line 1996
; Line 1997
	nop	
$I2131:
	cmp	WORD PTR [bp-4],70	;cnt
	je	$JCC10954
	jmp	$I2132
$JCC10954:
; Line 1998
	mov	WORD PTR [bp-4],0	;cnt
	jmp	SHORT $F2133
; Line 2004
; Line 2005
$FC2134:
	inc	WORD PTR [bp-4]	;cnt
$F2133:
	mov	ax,WORD PTR [bp-4]	;cnt
	cmp	WORD PTR _NGTARGETS,ax
	jle	$FB2135
; Line 1999
	mov	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR [bp+4]	;planenum
	cmp	WORD PTR _gt[bx+8],ax
	jne	$FC2134
; Line 2000
	mov	ax,WORD PTR _gt[bx]
	mov	dx,WORD PTR _gt[bx+2]
	mov	si,WORD PTR [bp+6]	;xval
	mov	WORD PTR [si],ax
	mov	WORD PTR [si+2],dx
; Line 2001
	mov	ax,WORD PTR _gt[bx+4]
	mov	dx,WORD PTR _gt[bx+6]
	mov	bx,WORD PTR [bp+8]	;yval
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
; Line 2002
	mov	bx,WORD PTR [bp+10]	;zval
	mov	WORD PTR [bx],1
; Line 2003
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$FB2135:
; Line 2007
	mov	ax,3392
	mov	dx,3
	mov	bx,WORD PTR [bp+6]	;xval
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
	mov	bx,WORD PTR [bp+8]	;yval
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
; Line 2008
	mov	bx,WORD PTR [bp+10]	;zval
	mov	WORD PTR [bx],66
; Line 2009
	mov	ax,OFFSET DGROUP:$SG2137
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 2010
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	push	WORD PTR [bp-2]	;otherplane
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2011
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 2012
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 2013
; Line 2015
	nop	
$I2132:
	mov	ax,40
	imul	WORD PTR [bp-4]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
	mov	si,WORD PTR [bp+6]	;xval
	mov	WORD PTR [si],ax
	mov	WORD PTR [si+2],dx
; Line 2016
	mov	ax,WORD PTR _ps[bx+12]
	mov	dx,WORD PTR _ps[bx+14]
	mov	si,WORD PTR [bp+8]	;yval
	mov	WORD PTR [si],ax
	mov	WORD PTR [si+2],dx
; Line 2017
	mov	ax,WORD PTR _ps[bx+6]
$L20072:
	mov	bx,WORD PTR [bp+10]	;zval
	mov	WORD PTR [bx],ax
; Line 2018
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_GetPlanePointXYZ	ENDP
; Line 2021
	PUBLIC	_Ready5
_Ready5	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 2026
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1363_i,ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	sub	ax,ax
	mov	WORD PTR _droll,ax
	mov	WORD PTR _pdest,ax
	mov	WORD PTR _bv[bx+18],ax
; Line 2027
	ret	
	nop	

_Ready5	ENDP
; Line 2030
	PUBLIC	_ReturnBaseInfo
_ReturnBaseInfo	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	si
;	tbnum = -8
;	cnt = -2
;	otherobj = -10
;	tempplane = -6
;	basehead = 12
;	zloc = 10
;	yloc = 8
;	xloc = 6
;	basenum = 4
; Line 2037
	cmp	WORD PTR [bp+4],0	;basenum
	jge	$I2149
; Line 2039
	mov	ax,-1
	sub	ax,WORD PTR [bp+4]	;basenum
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	si,WORD PTR [bp+6]	;xloc
	mov	WORD PTR [si],ax
; Line 2040
	mov	ax,WORD PTR _ps[bx+4]
	mov	si,WORD PTR [bp+8]	;yloc
	mov	WORD PTR [si],ax
; Line 2041
	mov	si,WORD PTR [bp+10]	;zloc
	mov	WORD PTR [si],0
; Line 2042
	mov	ax,WORD PTR _ps[bx+16]
	mov	bx,WORD PTR [bp+12]	;basehead
	mov	WORD PTR [bx],ax
; Line 2047
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2149:
; Line 2050
	mov	bx,WORD PTR [bp+4]	;basenum
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _Rdrs[bx]
	mov	si,WORD PTR [bp+6]	;xloc
	mov	WORD PTR [si],ax
; Line 2051
	mov	ax,WORD PTR _Rdrs[bx+2]
	mov	bx,WORD PTR [bp+8]	;yloc
	mov	WORD PTR [bx],ax
; Line 2052
	mov	bx,WORD PTR [bp+10]	;zloc
	mov	WORD PTR [bx],0
; Line 2054
	sub	ax,ax
	mov	bx,WORD PTR [bp+12]	;basehead
	mov	WORD PTR [bx],ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_ReturnBaseInfo	ENDP
; Line 2183
	PUBLIC	_GetPlayerHelp
_GetPlayerHelp	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	cnt = -4
;	returnval = -2
;	tdist = -8
;	cdist = -6
; Line 2185
	mov	WORD PTR [bp-2],-999	;returnval
; Line 2188
	mov	WORD PTR [bp-6],5400	;cdist
; Line 2189
	mov	WORD PTR [bp-4],0	;cnt
	jmp	$F2156
	nop	
$FC2157:
; Line 2190
	mov	ax,1024
	push	ax
	push	WORD PTR [bp-4]	;cnt
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	jne	$JCC11383
	jmp	$I2163
$JCC11383:
	mov	ax,40
	imul	WORD PTR [bp-4]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2163
	test	cl,2
	je	$I2163
; Line 2191
	push	WORD PTR [bp-4]	;cnt
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR [bp-4]	;cnt
	jne	$I2163
	push	ax
	call	_IsCAPFlier
	add	sp,2
	or	ax,ax
	jne	$I2161
	mov	ax,46
	imul	WORD PTR [bp-4]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	jne	$I2163
	cmp	WORD PTR _bv[bx+38],0
	jl	$I2163
$I2161:
; Line 2192
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-4]	;cnt
	call	_CheckIfCanIntercept
	add	sp,4
	or	ax,ax
	je	$I2163
	mov	ax,46
	imul	WORD PTR [bp-4]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I2163
; Line 2194
	mov	ax,40
	imul	WORD PTR [bp-4]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR _Py
	push	ax
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR _Px
	push	ax
	call	_Dist2D
	add	sp,4
	cmp	ax,WORD PTR [bp-6]	;cdist
	jae	$I2163
; Line 2196
	mov	ax,WORD PTR [bp-4]	;cnt
	mov	WORD PTR [bp-2],ax	;returnval
; Line 2197
; Line 2198
$I2163:
; Line 2199
; Line 2200
; Line 2201
	inc	WORD PTR [bp-4]	;cnt
$F2156:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-4],ax	;cnt
	jge	$JCC11542
	jmp	$FC2157
$JCC11542:
; Line 2202
	mov	ax,WORD PTR [bp-2]	;returnval
; Line 2203
	mov	sp,bp
	pop	bp
	ret	
	nop	
	nop	

_GetPlayerHelp	ENDP
; Line 2206
	PUBLIC	_ProcessOtherComm
_ProcessOtherComm	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	helpai = -2
; Line 2209
	cmp	WORD PTR _behavecommands,0
	jne	$JCC11571
	jmp	$SB2168
$JCC11571:
; Line 2212
	mov	ax,WORD PTR _behavecommands
	jmp	$S2167
; Line 2213
$SC2171:
; Line 2215
	call	_GetPlayerHelp
	mov	WORD PTR [bp-2],ax	;helpai
	cmp	ax,-999
	jne	$JCC11591
	jmp	$I2172
$JCC11591:
; Line 2216
	mov	cx,46
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	jne	$I2173
; Line 2217
	mov	ax,40
	imul	WORD PTR [bp-2]	;helpai
	mov	bx,ax
	or	BYTE PTR _ps[bx+25],128
; Line 2218
; Line 2219
	jmp	SHORT $I2175
$I2173:
	push	WORD PTR [bp-2]	;helpai
	call	_IsCAPFlier
	add	sp,2
	or	ax,ax
	je	$I2175
; Line 2220
	push	WORD PTR [bp-2]	;helpai
	call	_DoCAPReplace
	add	sp,2
; Line 2221
; Line 2222
$I2175:
	mov	ax,46
	imul	WORD PTR [bp-2]	;helpai
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],2
; Line 2223
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 2224
	mov	WORD PTR _bv[bx+28],53
; Line 2225
	and	BYTE PTR _bv[bx+21],191
; Line 2226
	mov	ax,1
	push	ax
	push	WORD PTR [bp-2]	;helpai
	mov	si,bx
	call	_UpdateInterceptGroup
	add	sp,4
; Line 2227
	mov	WORD PTR _bv[si],OFFSET _FollowPlayer
; Line 2228
	mov	ax,OFFSET DGROUP:$SG2176
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 2229
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	push	WORD PTR [bp-2]	;helpai
	call	_itoa
	add	sp,6
$L20074:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2230
	mov	ax,4
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 2231
; Line 2232
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I2172:
; Line 2233
	mov	ax,OFFSET DGROUP:$SG2178
	jmp	SHORT $L20074
	nop	
$S2167:
	sub	ax,11
	jne	$JCC11769
	jmp	$SC2171
$JCC11769:
$SB2168:
; Line 2239
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ProcessOtherComm	ENDP
; Line 2242
	PUBLIC	_DoCAPReplace
_DoCAPReplace	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	di
	push	si
;	cnt = -4
;	isfriend = -2
;	tdist = -10
;	tptype = -8
;	planenum = 4
; Line 2248
	push	WORD PTR [bp+4]	;planenum
	call	_FriendStatus
	add	sp,2
	mov	WORD PTR [bp-2],ax	;isfriend
; Line 2250
	mov	WORD PTR [bp-4],0	;cnt
	jmp	SHORT $F2185
$I2192:
; Line 2261
	mov	ax,46
	imul	WORD PTR [bp-4]	;cnt
	mov	bx,ax
	mov	si,WORD PTR [bp-8]	;tptype
	mov	ax,WORD PTR es:[si+10]
	sub	ax,50
	mov	WORD PTR _bv[bx+18],ax
; Line 2262
$I2193:
; Line 2263
	mov	ax,46
	imul	WORD PTR [bp-4]	;cnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _SetUpCAP1
; Line 2264
	mov	ax,40
	imul	WORD PTR [bp-4]	;cnt
	mov	si,ax
	or	BYTE PTR _ps[si+25],128
; Line 2265
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	mov	ax,WORD PTR _bv[si+14]
	mov	WORD PTR _bv[bx+14],ax
; Line 2266
	mov	al,BYTE PTR _bv[si+12]
	mov	BYTE PTR _bv[bx+12],al
; Line 2267
	mov	ax,WORD PTR _bv[si+30]
	mov	dx,WORD PTR _bv[si+32]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 2268
	mov	ax,WORD PTR _bv[si+34]
	mov	dx,WORD PTR _bv[si+36]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 2269
	mov	ax,1
	push	ax
	push	WORD PTR [bp-4]	;cnt
	call	_UpdateInterceptGroup
	add	sp,4
; Line 2270
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 2271
; Line 2272
$I2191:
; Line 2273
; Line 2274
; Line 2275
	inc	WORD PTR [bp-4]	;cnt
$F2185:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-4],ax	;cnt
	jl	$JCC11943
	jmp	$FB2187
$JCC11943:
; Line 2251
	push	WORD PTR [bp-2]	;isfriend
	push	WORD PTR [bp-4]	;cnt
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	je	$I2191
	mov	ax,WORD PTR [bp+4]	;planenum
	cmp	WORD PTR [bp-4],ax	;cnt
	je	$I2191
; Line 2252
	mov	ax,40
	imul	WORD PTR [bp-4]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2191
	test	cl,2
	je	$I2191
	mov	ax,46
	imul	WORD PTR [bp-4]	;cnt
	mov	si,ax
	cmp	WORD PTR _bv[si],OFFSET _Ready5
	jne	$I2191
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _bv[si+22],ax
	jg	$I2191
	cmp	WORD PTR _bv[si+38],0
	jl	$I2191
; Line 2253
	push	WORD PTR [bp-4]	;cnt
	mov	di,bx
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR [bp-4]	;cnt
	jne	$I2191
; Line 2255
	mov	ax,WORD PTR _ps[di+4]
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	sub	cx,WORD PTR _ps[bx+4]
	push	cx
	mov	ax,WORD PTR _ps[di+2]
	sub	ax,WORD PTR _ps[bx+2]
	push	ax
	call	_Dist2D
	add	sp,4
	cmp	ax,7250
	jb	$JCC12080
	jmp	$I2191
$JCC12080:
; Line 2257
	push	WORD PTR _ps[di+22]
	call	_GetPlanePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	WORD PTR [bp-8],bx	;tptype
	cmp	WORD PTR es:[bx+10],500
	jg	$JCC12108
	jmp	$I2192
$JCC12108:
; Line 2258
	mov	ax,WORD PTR es:[bx+10]
	sub	ax,100
	mov	WORD PTR _bv[si+18],ax
; Line 2259
; Line 2260
	jmp	$I2193
	nop	
$FB2187:
; Line 2276
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_DoCAPReplace	ENDP
; Line 2279
	PUBLIC	_SARWait
_SARWait	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 2283
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1363_i,ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	sub	ax,ax
	mov	WORD PTR _bv[bx+18],ax
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	WORD PTR _ps[bx+26],cx
; Line 2284
	mov	ax,WORD PTR _ps[bx+20]
	neg	ax
	mov	WORD PTR _droll,ax
; Line 2285
	mov	WORD PTR _pdest,cx
; Line 2286
	ret	
	nop	

_SARWait	ENDP
; Line 2289
	PUBLIC	_SAR
_SAR	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	si
;	dx = -6
;	dy = -8
;	dalt = -2
;	tdist = -4
;	covernum = -10
; Line 2296
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1363_i,ax
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
; Line 2297
	mov	cx,WORD PTR _bv[bx+34]
	mov	dx,WORD PTR _bv[bx+36]
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
; Line 2300
	sub	dx,dx
	push	dx
	mov	bx,200
	mov	WORD PTR [bp-2],bx	;dalt
	push	bx
	push	cx
	push	ax
	call	_FlyTo
	add	sp,8
	or	ax,ax
	jne	$JCC12287
	jmp	$I2201
$JCC12287:
; Line 2301
	call	_DoHover
; Line 2302
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],13
	jle	$I2202
; Line 2303
	mov	WORD PTR _pdest,-4096
; Line 2304
; Line 2305
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I2202:
; Line 2306
	mov	WORD PTR _pdest,0
; Line 2307
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+22],0
	jne	$I2204
; Line 2308
	mov	ax,WORD PTR _Gtime
	add	ax,170
	mov	WORD PTR _bv[bx+22],ax
; Line 2309
; Line 2310
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2204:
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+22]
	sub	ax,WORD PTR _Gtime
	cmp	ax,20
	jl	$JCC12380
	jmp	$I2217
$JCC12380:
; Line 2312
	mov	WORD PTR _bv[bx+18],120
; Line 2313
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR [bp-10],ax	;covernum
; Line 2314
	or	ax,ax
	jge	$JCC12400
	jmp	$I2217
$JCC12400:
; Line 2315
	push	ax
	call	_IsCAPFlier
	add	sp,2
	or	ax,ax
	jne	$JCC12414
	jmp	$I2217
$JCC12414:
; Line 2316
	push	WORD PTR [bp-10]	;covernum
	push	WORD PTR _planecnt
	call	_FriendMatch
	add	sp,4
	or	ax,ax
	jne	$JCC12434
	jmp	$I2217
$JCC12434:
; Line 2317
	mov	ax,46
	imul	WORD PTR [bp-10]	;covernum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _GorillaCover
; Line 2318
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR _bv[bx+10],ax
; Line 2319
	mov	ax,1
	push	ax
	push	WORD PTR [bp-10]	;covernum
	mov	si,bx
	call	_UpdateInterceptGroup
	add	sp,4
; Line 2320
	cmp	BYTE PTR _bv[si+12],0
	jge	$JCC12480
	jmp	$I2217
$JCC12480:
; Line 2321
	mov	al,BYTE PTR _bv[si+12]
	cbw	
	mov	bx,ax
	mov	cl,3
	shl	bx,cl
	mov	ax,WORD PTR _aipaths[bx+4]
	mov	WORD PTR _bv[si+14],ax
; Line 2322
; Line 2328
; Line 2329
; Line 2330
; Line 2331
; Line 2332
; Line 2333
; Line 2334
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2201:
; Line 2335
	cmp	WORD PTR [bp-4],40	;tdist
	jbe	$I2212
; Line 2336
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+18],100
	jge	$I2213
; Line 2337
	add	WORD PTR _bv[bx+18],3
; Line 2338
	mov	WORD PTR _droll,0
; Line 2339
; Line 2340
	jmp	SHORT $I2214
	nop	
$I2213:
; Line 2341
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	mov	WORD PTR _bv[bx+18],ax
; Line 2342
$I2214:
; Line 2344
	mov	ax,40
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-2]	;dalt
	cmp	WORD PTR _ps[bx+6],ax
	jge	$I2217
; Line 2345
	mov	WORD PTR _droll,0
; Line 2346
; Line 2347
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I2212:
; Line 2348
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+18],20
	jge	$I2217
; Line 2349
	add	WORD PTR _bv[bx+18],2
; Line 2350
; Line 2351
$I2217:
; Line 2361
; Line 2362
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_SAR	ENDP
; Line 2365
	PUBLIC	_GetSAR
_GetSAR	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	si
;	cnt = -6
;	returnval = -2
;	tdist = -10
;	cdist = -8
;	isfriend = -4
;	planenum = 4
; Line 2367
	mov	WORD PTR [bp-2],-999	;returnval
; Line 2371
	push	WORD PTR [bp+4]	;planenum
	call	_FriendStatus
	add	sp,2
	mov	WORD PTR [bp-4],ax	;isfriend
; Line 2373
	mov	WORD PTR [bp-8],0	;cdist
; Line 2374
	mov	WORD PTR [bp-6],0	;cnt
	jmp	SHORT $F2225
	nop	
$FC2226:
; Line 2375
	push	WORD PTR [bp-4]	;isfriend
	push	WORD PTR [bp-6]	;cnt
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	je	$I2230
	mov	ax,40
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2230
	test	cl,2
	je	$I2230
; Line 2376
	push	WORD PTR [bp-6]	;cnt
	mov	si,bx
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR [bp-6]	;cnt
	jne	$I2230
	mov	ax,46
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _SARWait
	jne	$I2230
; Line 2378
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR _ps[bx+4]
	push	ax
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR _ps[bx+2]
	push	ax
	call	_Dist2D
	add	sp,4
	cmp	ax,WORD PTR [bp-8]	;cdist
	jb	$I2231
	cmp	WORD PTR [bp-2],-999	;returnval
	jne	$I2230
$I2231:
; Line 2380
	mov	ax,WORD PTR [bp-6]	;cnt
	mov	WORD PTR [bp-2],ax	;returnval
; Line 2381
; Line 2382
$I2230:
; Line 2383
; Line 2384
	inc	WORD PTR [bp-6]	;cnt
$F2225:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-6],ax	;cnt
	jge	$JCC12792
	jmp	$FC2226
$JCC12792:
; Line 2385
	cmp	WORD PTR [bp-2],-999	;returnval
	je	$EX2219
; Line 2388
	mov	ax,40
	imul	WORD PTR [bp-2]	;returnval
	mov	bx,ax
	or	BYTE PTR _ps[bx+25],128
; Line 2389
	mov	ax,46
	imul	WORD PTR [bp-2]	;returnval
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _SAR
; Line 2390
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	mov	ax,WORD PTR _ps[si+8]
	mov	dx,WORD PTR _ps[si+10]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 2391
	mov	ax,WORD PTR _ps[si+12]
	mov	dx,WORD PTR _ps[si+14]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 2392
	mov	WORD PTR _bv[bx+18],3
; Line 2393
	push	WORD PTR [bp-2]	;returnval
	call	_GetSARCover
	add	sp,2
; Line 2394
$EX2219:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetSAR	ENDP
; Line 2397
	PUBLIC	_GetSARCover
_GetSARCover	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	si
;	cnt = -6
;	returnval = -2
;	tdist = -10
;	cdist = -8
;	isfriend = -4
;	planenum = 4
; Line 2399
	mov	WORD PTR [bp-2],-999	;returnval
; Line 2403
	push	WORD PTR [bp+4]	;planenum
	call	_FriendStatus
	add	sp,2
	mov	WORD PTR [bp-4],ax	;isfriend
; Line 2405
	mov	WORD PTR [bp-8],0	;cdist
; Line 2406
	mov	WORD PTR [bp-6],0	;cnt
	jmp	$F2240
$FC2241:
; Line 2407
	push	WORD PTR [bp-4]	;isfriend
	push	WORD PTR [bp-6]	;cnt
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	je	$I2245
	mov	ax,40
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2245
	test	cl,2
	je	$I2245
; Line 2408
	push	WORD PTR [bp-6]	;cnt
	mov	si,bx
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR [bp-6]	;cnt
	jne	$I2245
	mov	ax,46
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	jne	$I2245
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _bv[bx+22],ax
	jg	$I2245
	cmp	WORD PTR _bv[bx+38],0
	jl	$I2245
; Line 2410
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR _ps[bx+4]
	push	ax
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR _ps[bx+2]
	push	ax
	call	_Dist2D
	add	sp,4
	cmp	ax,WORD PTR [bp-8]	;cdist
	jb	$I2246
	cmp	WORD PTR [bp-2],-999	;returnval
	jne	$I2245
$I2246:
; Line 2412
	mov	ax,WORD PTR [bp-6]	;cnt
	mov	WORD PTR [bp-2],ax	;returnval
; Line 2413
; Line 2414
$I2245:
; Line 2415
; Line 2416
	inc	WORD PTR [bp-6]	;cnt
$F2240:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-6],ax	;cnt
	jge	$JCC13078
	jmp	$FC2241
$JCC13078:
; Line 2417
	cmp	WORD PTR [bp-2],-999	;returnval
	jne	$JCC13088
	jmp	$EX2234
$JCC13088:
; Line 2420
	mov	ax,46
	imul	WORD PTR [bp-2]	;returnval
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _SARCAP1
; Line 2421
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	mov	ax,WORD PTR _bv[si+30]
	mov	dx,WORD PTR _bv[si+32]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 2422
	mov	ax,WORD PTR _bv[si+34]
	mov	dx,WORD PTR _bv[si+36]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 2423
	mov	WORD PTR _bv[bx+14],-1
; Line 2424
	mov	ax,40
	imul	WORD PTR [bp-2]	;returnval
	mov	si,ax
	or	BYTE PTR _ps[si+25],128
; Line 2425
	mov	ax,WORD PTR [bp+4]	;planenum
	mov	WORD PTR _bv[bx+10],ax
; Line 2426
	cmp	WORD PTR _ps[si],0
	jl	$I2248
; Line 2427
	mov	WORD PTR _ps[si],-1
; Line 2428
; Line 2429
$I2248:
	mov	ax,1
	push	ax
	push	WORD PTR [bp-2]	;returnval
	call	_UpdateInterceptGroup
	add	sp,4
; Line 2430
	mov	ax,46
	imul	WORD PTR [bp-2]	;returnval
	mov	bx,ax
	mov	ax,WORD PTR _Gtime
	add	ax,20
	mov	WORD PTR _bv[bx+22],ax
; Line 2431
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp-2]	;returnval
	mov	WORD PTR _bv[bx+10],ax
; Line 2432
$EX2234:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetSARCover	ENDP
; Line 2435
	PUBLIC	_RestoreCover
_RestoreCover	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
	push	di
	push	si
;	cnt = -6
;	returnval = -2
;	tdist = -12
;	cdist = -8
;	isfriend = -4
;	lastcap = -10
;	prewing = -14
;	planenum = 4
; Line 2437
	mov	WORD PTR [bp-2],-999	;returnval
; Line 2440
	mov	WORD PTR [bp-10],-1	;lastcap
; Line 2443
	push	WORD PTR [bp+4]	;planenum
	call	_FriendStatus
	add	sp,2
	mov	WORD PTR [bp-4],ax	;isfriend
; Line 2444
	push	WORD PTR [bp+4]	;planenum
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-14],ax	;prewing
; Line 2446
	mov	WORD PTR [bp-8],2250	;cdist
; Line 2447
	mov	WORD PTR [bp-6],0	;cnt
	jmp	SHORT $F2258
	nop	
$I2264:
; Line 2468
	mov	ax,46
	imul	WORD PTR [bp-10]	;lastcap
	mov	bx,ax
	mov	ax,WORD PTR [bp-2]	;returnval
	mov	WORD PTR _bv[bx+8],ax
; Line 2469
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR [bp-10]	;lastcap
	mov	WORD PTR _bv[bx+6],ax
; Line 2470
	mov	ax,WORD PTR [bp-2]	;returnval
$L20077:
	mov	WORD PTR [bp-10],ax	;lastcap
; Line 2471
; Line 2472
	mov	ax,1
	push	ax
	push	WORD PTR [bp-2]	;returnval
	call	_UpdateInterceptGroup
	add	sp,4
; Line 2473
; Line 2474
$I2263:
; Line 2475
; Line 2476
	inc	WORD PTR [bp-6]	;cnt
$F2258:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-6],ax	;cnt
	jl	$JCC13353
	jmp	$FB2260
$JCC13353:
; Line 2448
	push	WORD PTR [bp-4]	;isfriend
	push	WORD PTR [bp-6]	;cnt
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	je	$I2263
	mov	ax,40
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2263
	test	cl,2
	je	$I2263
; Line 2449
	push	WORD PTR [bp-6]	;cnt
	mov	si,bx
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR [bp-6]	;cnt
	jne	$I2263
	push	ax
	call	_IsCAPFlier
	add	sp,2
	or	ax,ax
	je	$I2263
	mov	ax,46
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	je	$I2263
; Line 2451
	mov	ax,WORD PTR _ps[si+4]
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	di,ax
	sub	cx,WORD PTR _ps[di+4]
	push	cx
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR _ps[di+2]
	push	ax
	mov	si,bx
	call	_Dist2D
	add	sp,4
	cmp	ax,WORD PTR [bp-8]	;cdist
	jb	$JCC13478
	jmp	$I2263
$JCC13478:
; Line 2457
	mov	ax,WORD PTR [bp-6]	;cnt
	mov	WORD PTR [bp-2],ax	;returnval
; Line 2458
	mov	WORD PTR _bv[si],OFFSET _GorillaCover
; Line 2459
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+30]
	mov	dx,WORD PTR _bv[bx+32]
	mov	WORD PTR _bv[si+30],ax
	mov	WORD PTR _bv[si+32],dx
; Line 2460
	mov	ax,WORD PTR _bv[bx+34]
	mov	dx,WORD PTR _bv[bx+36]
	mov	WORD PTR _bv[si+34],ax
	mov	WORD PTR _bv[si+36],dx
; Line 2461
	mov	WORD PTR _bv[si+14],-1
; Line 2462
	mov	ax,WORD PTR [bp-14]	;prewing
	mov	WORD PTR _bv[si+10],ax
; Line 2463
	cmp	WORD PTR [bp-10],-1	;lastcap
	je	$JCC13552
	jmp	$I2264
$JCC13552:
; Line 2464
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR [bp-6]	;cnt
	mov	WORD PTR _bv[bx+10],ax
	jmp	$L20077
$FB2260:
; Line 2477
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_RestoreCover	ENDP
; Line 2480
	PUBLIC	_IsBombing
_IsBombing	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	planenum = 4
; Line 2481
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AIBombTarget
	je	$I2269
	cmp	WORD PTR _bv[bx],OFFSET _AIGetBombDist
	je	$I2269
	cmp	WORD PTR _bv[bx],OFFSET _LowBombTarget
	jne	$I2268
$I2269:
; Line 2482
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 2483
; Line 2484
	nop	
$I2268:
	sub	ax,ax
; Line 2485
	mov	sp,bp
	pop	bp
	ret	

_IsBombing	ENDP
; Line 2488
	PUBLIC	_FriendStatus
_FriendStatus	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	planenum = 4
; Line 2489
	cmp	WORD PTR [bp+4],-1	;planenum
	jle	$I2273
	cmp	WORD PTR [bp+4],70	;planenum
	jl	$I2272
$I2273:
; Line 2490
	mov	ax,1024
	mov	sp,bp
	pop	bp
	ret	
; Line 2491
	nop	
$I2272:
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ah,BYTE PTR _ps[bx+25]
	and	ax,1280
; Line 2492
	mov	sp,bp
	pop	bp
	ret	
	nop	

_FriendStatus	ENDP
; Line 2495
	PUBLIC	_FriendMatch
_FriendMatch	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	si
;	plane2 = 6
;	plane1 = 4
; Line 2499
	push	WORD PTR [bp+4]	;plane1
	call	_FriendStatus
	add	sp,2
	push	WORD PTR [bp+6]	;plane2
	mov	si,ax
	call	_FriendStatus
	add	sp,2
	cmp	ax,si
	jne	$I2277
; Line 2500
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2277:
; Line 2502
	sub	ax,ax
; Line 2503
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_FriendMatch	ENDP
; Line 2506
	PUBLIC	_FriendMatchType
_FriendMatchType	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	isfriend = 6
;	plane1 = 4
; Line 2510
	push	WORD PTR [bp+4]	;plane1
	call	_FriendStatus
	mov	sp,bp
	cmp	ax,WORD PTR [bp+6]	;isfriend
	jne	$I2282
; Line 2511
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
$I2282:
; Line 2513
	sub	ax,ax
; Line 2514
	mov	sp,bp
	pop	bp
	ret	

_FriendMatchType	ENDP
; Line 2517
	PUBLIC	_UpdateOurWPS
_UpdateOurWPS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,38
	call	__aNchkstk
;	waynum = -4
;	xval = -28
;	yval = -32
;	zval = -34
;	cnt = -16
;	cnt2 = -18
;	iscarr = -12
;	NextNum = -38
;	waystart = -36
;	behavenum = -24
;	formnum = -10
;	speedval = -8
;	altval = -6
;	headval = -14
;	attack = -20
;	launch = -22
;	wpflag = -2
;	updateall = 6
;	lastwp = 4
; Line 2523
	mov	WORD PTR [bp-38],1	;NextNum
; Line 2524
	sub	ax,ax
	mov	WORD PTR [bp-12],ax	;iscarr
	mov	WORD PTR [bp-36],ax	;waystart
; Line 2527
	cmp	WORD PTR _NextWayPoint,ax
	jne	$JCC13792
	jmp	$I2326
$JCC13792:
; Line 2532
	mov	WORD PTR [bp-18],1	;cnt2
; Line 2533
	mov	cl,3
	mov	bx,WORD PTR _OurPath
	shl	bx,cl
	mov	ax,WORD PTR _aipaths[bx+4]
	mov	WORD PTR [bp-4],ax	;waynum
; Line 2535
	mov	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx],-1
	jne	$I2305
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jne	$I2305
	push	WORD PTR _aiwaypoints[bx+4]
	call	_GetPlaneOrgNum
	add	sp,2
	cmp	ax,WORD PTR _whichourcarr
	je	$L20079
$I2305:
	mov	bx,WORD PTR [bp-4]	;waynum
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jl	$I2308
	jg	$L20004
	cmp	WORD PTR _aiwaypoints[bx],-1
	jbe	$I2308
$L20004:
; Line 2540
	lea	ax,WORD PTR [bp-2]	;wpflag
	push	ax
	lea	ax,WORD PTR [bp-22]	;launch
	push	ax
	lea	ax,WORD PTR [bp-20]	;attack
	push	ax
	lea	ax,WORD PTR [bp-14]	;headval
	push	ax
	lea	ax,WORD PTR [bp-6]	;altval
	push	ax
	lea	ax,WORD PTR [bp-8]	;speedval
	push	ax
	lea	ax,WORD PTR [bp-10]	;formnum
	push	ax
	lea	ax,WORD PTR [bp-24]	;behavenum
	push	ax
	push	WORD PTR [bp-4]	;waynum
	call	_GetWayPointChanges
	add	sp,18
; Line 2541
	cmp	WORD PTR [bp-24],0	;behavenum
	je	$I2308
; Line 2542
$L20079:
	inc	WORD PTR [bp-4]	;waynum
; Line 2543
	mov	WORD PTR [bp-36],1	;waystart
; Line 2544
; Line 2545
$I2308:
; Line 2547
	mov	WORD PTR [bp-16],0	;cnt
	jmp	SHORT $F2309
$FC2310:
; Line 2548
	mov	bx,WORD PTR [bp-4]	;waynum
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx],-2
	jne	$I2312
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jne	$I2312
; Line 2549
	inc	WORD PTR [bp-4]	;waynum
; Line 2550
$I2312:
	inc	WORD PTR [bp-4]	;waynum
; Line 2551
	inc	WORD PTR [bp-18]	;cnt2
; Line 2552
	inc	WORD PTR [bp-16]	;cnt
$F2309:
	mov	ax,WORD PTR _NextWayPoint
	dec	ax
	cmp	ax,WORD PTR [bp-16]	;cnt
	jg	$FC2310
; Line 2554
	mov	bx,WORD PTR [bp-4]	;waynum
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx],-1
	jne	$I2313
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jne	$I2313
	push	WORD PTR _aiwaypoints[bx+4]
	call	_GetPlaneOrgNum
	add	sp,2
	cmp	ax,WORD PTR _whichourcarr
	jne	$I2313
; Line 2555
	mov	WORD PTR [bp-12],1	;iscarr
; Line 2557
$I2313:
; Line 2558
	mov	cl,3
	mov	bx,WORD PTR _OurPath
	shl	bx,cl
	mov	ax,WORD PTR _aipaths[bx+4]
	add	ax,WORD PTR _aipaths[bx+6]
	mov	cx,WORD PTR [bp-4]	;waynum
	cmp	ax,cx
	jbe	$I2315
	cmp	WORD PTR [bp-12],0	;iscarr
	je	$I2319
	dec	ax
	cmp	ax,cx
	ja	$I2319
$I2315:
; Line 2559
	cmp	WORD PTR [bp+4],-999	;lastwp
	je	$I2316
; Line 2560
	cmp	WORD PTR [bp+4],0	;lastwp
	jne	$I2317
; Line 2561
	mov	cl,3
	mov	bx,WORD PTR _OurPath
	shl	bx,cl
	mov	ax,WORD PTR _aipaths[bx+4]
	add	ax,WORD PTR _aipaths[bx+6]
	dec	ax
	mov	WORD PTR [bp-4],ax	;waynum
; Line 2562
	mov	ax,WORD PTR [bp-18]	;cnt2
	mov	WORD PTR _NextWayPoint,ax
; Line 2563
; Line 2568
; Line 2569
	jmp	SHORT $I2319
	nop	
$I2317:
; Line 2565
	mov	WORD PTR _NextWayPoint,0
; Line 2566
	mov	sp,bp
	pop	bp
	ret	
; Line 2567
$I2316:
; Line 2570
	mov	cl,3
	mov	bx,WORD PTR _OurPath
	shl	bx,cl
	mov	ax,WORD PTR _aipaths[bx+4]
	add	ax,WORD PTR _aipaths[bx+6]
	dec	ax
	mov	WORD PTR [bp-4],ax	;waynum
$I2319:
; Line 2571
; Line 2574
	cmp	WORD PTR [bp+6],0	;updateall
	jne	$JCC14162
	jmp	$I2320
$JCC14162:
; Line 2575
	mov	ax,WORD PTR [bp-36]	;waystart
	mov	WORD PTR [bp-16],ax	;cnt
	jmp	SHORT $F2321
	nop	
$FC2322:
	inc	WORD PTR [bp-16]	;cnt
$F2321:
	mov	cl,3
	mov	bx,WORD PTR _OurPath
	shl	bx,cl
	mov	ax,WORD PTR [bp-16]	;cnt
	cmp	WORD PTR _aipaths[bx+6],ax
	ja	$JCC14194
	jmp	$I2326
$JCC14194:
; Line 2576
	cmp	WORD PTR [bp-38],4	;NextNum
	jl	$JCC14203
	jmp	$I2325
$JCC14203:
; Line 2578
	lea	cx,WORD PTR [bp-34]	;zval
	push	cx
	lea	cx,WORD PTR [bp-32]	;yval
	push	cx
	lea	dx,WORD PTR [bp-28]	;xval
	push	dx
	add	ax,WORD PTR _aipaths[bx+4]
	mov	WORD PTR [bp-4],ax	;waynum
	push	ax
	call	_GetWayXYZ
	add	sp,8
; Line 2579
	mov	ax,WORD PTR [bp-28]	;xval
	mov	dx,WORD PTR [bp-26]
	mov	bx,WORD PTR [bp-38]	;NextNum
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	shl	bx,1
	mov	WORD PTR _wps[bx+4],ax
	mov	WORD PTR _wps[bx+6],dx
; Line 2580
	mov	ax,WORD PTR [bp-32]	;yval
	mov	dx,WORD PTR [bp-30]
	mov	WORD PTR _wps[bx+8],ax
	mov	WORD PTR _wps[bx+10],dx
; Line 2581
	mov	ax,WORD PTR _wps[bx+4]
	mov	dx,WORD PTR _wps[bx+6]
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
	mov	WORD PTR _wps[bx],ax
; Line 2582
	mov	ax,WORD PTR _wps[bx+8]
	mov	dx,WORD PTR _wps[bx+10]
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
	mov	WORD PTR _wps[bx+2],ax
; Line 2583
	mov	bx,WORD PTR [bp-4]	;waynum
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx],-2
	jne	$I2325
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jne	$I2325
; Line 2584
	inc	WORD PTR [bp-16]	;cnt
; Line 2585
$I2325:
; Line 2586
	inc	WORD PTR [bp-38]	;NextNum
; Line 2587
	jmp	$FC2322
	nop	
$I2320:
; Line 2590
	lea	ax,WORD PTR [bp-34]	;zval
	push	ax
	lea	ax,WORD PTR [bp-32]	;yval
	push	ax
	lea	cx,WORD PTR [bp-28]	;xval
	push	cx
	push	WORD PTR [bp-4]	;waynum
	call	_GetWayXYZ
; Line 2591
	mov	ax,WORD PTR [bp-28]	;xval
	mov	dx,WORD PTR [bp-26]
	mov	bx,WORD PTR _NextWayPoint
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	shl	bx,1
	mov	WORD PTR _wps[bx+4],ax
	mov	WORD PTR _wps[bx+6],dx
; Line 2592
	mov	ax,WORD PTR [bp-32]	;yval
	mov	dx,WORD PTR [bp-30]
	mov	WORD PTR _wps[bx+8],ax
	mov	WORD PTR _wps[bx+10],dx
; Line 2593
	mov	ax,WORD PTR _wps[bx+4]
	mov	dx,WORD PTR _wps[bx+6]
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
	mov	WORD PTR _wps[bx],ax
; Line 2594
	mov	ax,WORD PTR _wps[bx+8]
	mov	dx,WORD PTR _wps[bx+10]
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
	mov	WORD PTR _wps[bx+2],ax
; Line 2595
$I2326:
; Line 2603
	mov	sp,bp
	pop	bp
	ret	

_UpdateOurWPS	ENDP
; Line 2606
	PUBLIC	_CloseEnoughFor
_CloseEnoughFor	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	distval = -2
;	y = 8
;	x = 6
;	whatcheck = 4
; Line 2609
	mov	ax,WORD PTR [bp+4]	;whatcheck
	dec	ax
	je	$SC2336
	dec	ax
	je	$SC2337
	dec	ax
	je	$SC2338
; Line 2623
	mov	WORD PTR [bp-2],0	;distval
; Line 2624
	jmp	SHORT $SB2333
; Line 2610
$SC2336:
; Line 2611
	mov	WORD PTR [bp-2],1800	;distval
; Line 2612
$SB2333:
; Line 2627
	mov	ax,WORD PTR [bp+6]	;x
	sub	ax,WORD PTR _Px
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR [bp-2]	;distval
	jle	$I2340
	jmp	SHORT $L20080
; Line 2614
$SC2337:
; Line 2615
	mov	WORD PTR [bp-2],3600	;distval
; Line 2616
	jmp	SHORT $SB2333
; Line 2618
	nop	
$SC2338:
; Line 2619
	mov	WORD PTR [bp-2],4000	;distval
; Line 2620
	jmp	SHORT $SB2333
; Line 2622
	nop	
$I2340:
	mov	ax,WORD PTR [bp+8]	;y
	sub	ax,WORD PTR _Py
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR [bp-2]	;distval
	jle	$I2341
; Line 2631
$L20080:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 2633
	nop	
$I2341:
	mov	ax,1
; Line 2634
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CloseEnoughFor	ENDP
; Line 2637
	PUBLIC	_FormOnWP
_FormOnWP	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
	push	di
	push	si
;	whofollow = -6
;	planeorg = -16
;	waynum = -4
;	wingcnt = -18
;	tmpcnt = -12
;	secplace = -2
;	orgsecplace = -14
;	orgprewing = -8
;	cnt = -10
;	planenum = 4
; Line 2643
	mov	WORD PTR [bp-2],0	;secplace
; Line 2650
	push	WORD PTR [bp+4]	;planenum
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-8],ax	;orgprewing
	cmp	ax,WORD PTR [bp+4]	;planenum
	je	$I2353
; Line 2651
	sub	ax,ax
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 2653
	nop	
$I2353:
; Line 2654
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	si,WORD PTR _bv[bx+14]
	mov	WORD PTR [bp-4],si	;waynum
	mov	ax,si
	shl	si,1
	add	si,ax
	shl	si,1
	add	si,ax
	shl	si,1
	mov	ax,WORD PTR _aiwaypoints[si+4]
	mov	WORD PTR [bp-16],ax	;planeorg
; Line 2655
	cmp	WORD PTR _aiwaypoints[si+2],-1
	jl	$I2354
	jg	$L20005
	cmp	WORD PTR _aiwaypoints[si],-1
	jbe	$I2354
$L20005:
; Line 2666
	mov	ax,WORD PTR [bp-4]	;waynum
	inc	ax
	mov	WORD PTR _bv[bx+14],ax
	push	ax
$L20081:
	push	WORD PTR [bp+4]	;planenum
	call	_DoNextWayPt
	add	sp,4
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 2667
; Line 2678
$I2354:
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+20]
	and	ax,15
	mov	WORD PTR [bp-14],ax	;orgsecplace
; Line 2680
	push	WORD PTR [bp-16]	;planeorg
	call	_GetPlaneOrgNum
	add	sp,2
	mov	WORD PTR [bp-6],ax	;whofollow
	inc	ax
	jne	$I2360
; Line 2681
	mov	WORD PTR [bp-10],0	;cnt
	jmp	SHORT $F2356
; Line 2685
; Line 2686
$FC2357:
	inc	WORD PTR [bp-10]	;cnt
$F2356:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-10],ax	;cnt
	jge	$FB2358
; Line 2682
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+6],-1
	jne	$FC2357
; Line 2683
	mov	ax,WORD PTR [bp-10]	;cnt
	mov	WORD PTR [bp-6],ax	;whofollow
; Line 2684
$FB2358:
; Line 2687
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-10],ax	;cnt
	jne	$I2360
; Line 2688
	push	WORD PTR [bp+4]	;planenum
	call	_InitAddedWingmen
	add	sp,2
; Line 2690
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	inc	WORD PTR _bv[bx+14]
	jmp	$L20084
; Line 2691
; Line 2692
$I2360:
; Line 2694
	mov	ax,WORD PTR [bp-6]	;whofollow
	mov	WORD PTR [bp-18],ax	;wingcnt
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+14]
	mov	dx,ax
	mov	ax,cx
	mov	si,dx
	imul	WORD PTR [bp+4]	;planenum
	mov	di,ax
	mov	WORD PTR _bv[di+14],si
; Line 2695
	mov	al,BYTE PTR _bv[bx+12]
	mov	BYTE PTR _bv[di+12],al
; Line 2696
	jmp	$L20082
	nop	
$FC2362:
; Line 2697
	mov	ax,46
	imul	WORD PTR [bp-18]	;wingcnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+4],0
	jge	$I2365
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+4],0
	jl	$I2364
$I2365:
; Line 2698
	mov	ax,46
	imul	WORD PTR [bp-18]	;wingcnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+8],0
	jl	$I2366
; Line 2699
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-18],ax	;wingcnt
; Line 2700
	add	WORD PTR [bp-2],2	;secplace
; Line 2701
; Line 2702
	jmp	SHORT $L20082
$I2366:
; Line 2703
	add	WORD PTR [bp-2],2	;secplace
; Line 2704
	mov	ax,46
	imul	WORD PTR [bp-18]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;planenum
	mov	WORD PTR _bv[bx+8],ax
; Line 2705
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR [bp-18]	;wingcnt
	mov	WORD PTR _bv[bx+6],ax
	jmp	SHORT $L20085
	nop	
$I2364:
; Line 2710
	inc	WORD PTR [bp-2]	;secplace
; Line 2711
	mov	ax,46
	imul	WORD PTR [bp-18]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;planenum
	mov	WORD PTR _bv[bx+4],ax
; Line 2712
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR [bp-18]	;wingcnt
	mov	WORD PTR _bv[bx+2],ax
; Line 2713
$L20085:
	mov	WORD PTR [bp-18],-999	;wingcnt
; Line 2714
; Line 2715
$L20082:
	cmp	WORD PTR [bp-18],0	;wingcnt
	jl	$JCC15009
	jmp	$FC2362
$JCC15009:
; Line 2716
	cmp	WORD PTR [bp-2],15	;secplace
	jle	$I2369
; Line 2717
	mov	WORD PTR [bp-2],15	;secplace
; Line 2719
$I2369:
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp-2]	;secplace
	add	WORD PTR _bv[bx+20],ax
; Line 2720
	mov	WORD PTR [bp-14],ax	;orgsecplace
; Line 2721
	mov	ax,WORD PTR [bp-8]	;orgprewing
	mov	WORD PTR [bp-18],ax	;wingcnt
; Line 2722
	jmp	SHORT $I2376
	nop	
$FC2371:
; Line 2724
	mov	ax,46
	imul	WORD PTR [bp-18]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
	or	ax,ax
	jl	$I2374
; Line 2725
	cmp	ax,WORD PTR [bp+4]	;planenum
	je	$I2374
; Line 2726
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR [bp-14]	;orgsecplace
	add	WORD PTR _bv[bx+20],ax
; Line 2727
$I2374:
; Line 2729
	mov	ax,46
	imul	WORD PTR [bp-18]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-18],ax	;wingcnt
	or	ax,ax
	jl	$I2376
; Line 2730
	cmp	ax,WORD PTR [bp+4]	;planenum
	je	$I2376
; Line 2731
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR [bp-14]	;orgsecplace
	add	WORD PTR _bv[bx+20],ax
; Line 2732
$I2376:
; Line 2733
	cmp	WORD PTR [bp-18],0	;wingcnt
	jge	$FC2371
; Line 2734
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
$L20084:
	push	WORD PTR _bv[bx+14]
	jmp	$L20081
; Line 2735

_FormOnWP	ENDP
; Line 2738
	PUBLIC	_GetPlaneOrgNum
_GetPlaneOrgNum	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	cnt = -4
;	otherplane = -2
;	planenum = 4
; Line 2742
	mov	ax,WORD PTR [bp+4]	;planenum
	mov	WORD PTR [bp-2],ax	;otherplane
; Line 2743
	mov	WORD PTR [bp-4],0	;cnt
	jmp	SHORT $F2381
; Line 2747
; Line 2748
$I2385:
; Line 2749
	inc	WORD PTR [bp-4]	;cnt
$F2381:
	cmp	WORD PTR [bp-4],70	;cnt
	jge	$FB2383
; Line 2744
	mov	ax,40
	imul	WORD PTR [bp-4]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,2
	je	$I2385
	test	cl,1
	je	$I2385
; Line 2745
	mov	ax,46
	imul	WORD PTR [bp-4]	;cnt
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+44]
	cbw	
	cmp	ax,WORD PTR [bp-2]	;otherplane
	jne	$I2385
; Line 2746
	mov	ax,WORD PTR [bp-4]	;cnt
	mov	sp,bp
	pop	bp
	ret	
	nop	
$FB2383:
; Line 2750
	mov	ax,WORD PTR [bp-2]	;otherplane
	cmp	WORD PTR _orgPlayernum,ax
	jne	$I2386
; Line 2751
	mov	ax,-1
	mov	sp,bp
	pop	bp
	ret	
; Line 2753
$I2386:
	mov	ax,70
; Line 2754
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetPlaneOrgNum	ENDP
; Line 2757
	PUBLIC	_CheckForMobileR5
_CheckForMobileR5	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__aNchkstk
	push	si
;	cnt = -6
;	returnval = -4
;	tdist = -10
;	cdist = -8
;	wingcnt = -12
;	otherplane = -2
;	xval = -14
;	yval = -16
;	isfriend = 6
;	basenum = 4
; Line 2759
	mov	WORD PTR [bp-4],-999	;returnval
; Line 2765
	mov	WORD PTR [bp-8],0	;cdist
; Line 2767
	mov	bx,WORD PTR [bp+4]	;basenum
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _Rdrs[bx]
	mov	WORD PTR [bp-14],ax	;xval
; Line 2768
	mov	ax,WORD PTR _Rdrs[bx+2]
	mov	WORD PTR [bp-16],ax	;yval
; Line 2770
	mov	WORD PTR [bp-6],0	;cnt
	jmp	SHORT $F2398
	nop	
	nop	
$FC2399:
; Line 2771
	push	WORD PTR [bp+6]	;isfriend
	push	WORD PTR [bp-6]	;cnt
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	jne	$I2403
	mov	ax,40
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2403
	test	cl,2
	je	$I2403
; Line 2772
	push	WORD PTR [bp-6]	;cnt
	mov	si,bx
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR [bp-6]	;cnt
	jne	$I2403
	mov	ax,46
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	jne	$I2403
	cmp	WORD PTR _ps[si],0
	jl	$I2403
; Line 2774
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR [bp-16]	;yval
	push	ax
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR [bp-14]	;xval
	push	ax
	call	_Dist2D
	add	sp,4
	cmp	ax,WORD PTR [bp-8]	;cdist
	jb	$I2404
	cmp	WORD PTR [bp-4],-999	;returnval
	jne	$I2403
$I2404:
; Line 2776
	mov	ax,WORD PTR [bp-6]	;cnt
	mov	WORD PTR [bp-4],ax	;returnval
; Line 2777
; Line 2778
$I2403:
; Line 2779
; Line 2780
	inc	WORD PTR [bp-6]	;cnt
$F2398:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-6],ax	;cnt
	jge	$JCC15433
	jmp	$FC2399
$JCC15433:
; Line 2781
	cmp	WORD PTR [bp-4],-999	;returnval
	jne	$I2405
; Line 2782
$L20087:
	mov	ax,WORD PTR [bp-4]	;returnval
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 2784
	nop	
$I2405:
; Line 2785
	add	WORD PTR [bp-16],30	;yval
	mov	ax,WORD PTR [bp-16]	;yval
	push	ax
	push	WORD PTR [bp-14]	;xval
	push	WORD PTR [bp-4]	;returnval
	call	_MovePlane
	add	sp,6
; Line 2786
	mov	ax,WORD PTR [bp-16]	;yval
	inc	ax
	mov	WORD PTR [bp-16],ax	;yval
; Line 2788
	mov	ax,WORD PTR [bp-4]	;returnval
$L20088:
	mov	WORD PTR [bp-12],ax	;wingcnt
; Line 2789
	or	ax,ax
	jl	$L20087
; Line 2791
	mov	ax,46
	imul	WORD PTR [bp-12]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
	or	ax,ax
	jl	$I2409
; Line 2792
	push	WORD PTR [bp-16]	;yval
	push	WORD PTR [bp-14]	;xval
	push	ax
	call	_MovePlane
	add	sp,6
; Line 2793
	inc	WORD PTR [bp-16]	;yval
; Line 2794
; Line 2795
$I2409:
; Line 2796
	mov	ax,46
	imul	WORD PTR [bp-12]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	or	ax,ax
	jl	$I2410
; Line 2797
	push	WORD PTR [bp-16]	;yval
	push	WORD PTR [bp-14]	;xval
	push	ax
	call	_MovePlane
	add	sp,6
; Line 2798
	inc	WORD PTR [bp-16]	;yval
; Line 2799
; Line 2800
$I2410:
	mov	ax,46
	imul	WORD PTR [bp-12]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	jmp	SHORT $L20088
	nop	

_CheckForMobileR5	ENDP
; Line 2809
	PUBLIC	_MovePlane
_MovePlane	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	yval = 8
;	xval = 6
;	planenum = 4
; Line 2810
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp+6]	;xval
	mov	WORD PTR _ps[bx+2],ax
; Line 2811
	mov	ax,WORD PTR [bp+8]	;yval
	mov	WORD PTR _ps[bx+4],ax
; Line 2812
	mov	ax,WORD PTR _ps[bx+2]
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
	mov	WORD PTR _ps[bx+8],ax
	mov	WORD PTR _ps[bx+10],dx
; Line 2813
	mov	ax,WORD PTR _ps[bx+4]
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
	mov	WORD PTR _ps[bx+12],ax
	mov	WORD PTR _ps[bx+14],dx
; Line 2814
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	si,bx
	call	__aNlmul
	add	ax,50
	adc	dx,0
	mov	cl,3
	mov	bx,WORD PTR $S1363_i
	shl	bx,cl
	mov	WORD PTR _ailoc[bx],ax
	mov	WORD PTR _ailoc[bx+2],dx
; Line 2815
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	mov	di,bx
	call	__aNlmul
	add	ax,50
	adc	dx,0
	mov	WORD PTR _ailoc[di+4],ax
	mov	WORD PTR _ailoc[di+6],dx
; Line 2816
	mov	WORD PTR _ps[si+16],0
; Line 2817
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_MovePlane	ENDP
; Line 2820
	PUBLIC	_CruiseDistruct
_CruiseDistruct	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	si
;	planenum = 4
; Line 2821
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],300
	jge	$I2417
; Line 2822
	mov	ax,2
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _ps[bx+22]
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	push	WORD PTR _bv[si+6]
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	ax,-999
	push	ax
	mov	ax,14
	push	ax
	mov	si,bx
	call	_LogIt
	add	sp,24
; Line 2823
	push	WORD PTR [bp+4]	;planenum
	mov	ax,5
	push	ax
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	push	WORD PTR _ps[si+10]
	push	WORD PTR _ps[si+8]
	call	_CheckBlastArea
	add	sp,12
; Line 2824
; Line 2826
$I2417:
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	push	WORD PTR _bv[si+6]
	push	WORD PTR [bp+4]	;planenum
	mov	ax,10
	push	ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+4]
	push	WORD PTR _ps[bx+2]
	call	_CheckPlaneBlast
	add	sp,14
; Line 2827
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_CruiseDistruct	ENDP
; Line 2830
	PUBLIC	_CheckPlaneBlast
_CheckPlaneBlast	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__aNchkstk
	push	si
;	hitmsg = -20
;	destroymsg = -2
;	crashstat = -22
;	cnt = -6
;	tempplane = -10
;	doKill = -24
;	logtype = -4
;	lxval = -14
;	lyval = -18
;	missiletype = 16
;	camefrom = 14
;	iscruise = 12
;	blastrad = 10
;	zval = 8
;	yval = 6
;	xval = 4
; Line 2833
	mov	WORD PTR [bp-24],0	;doKill
; Line 2839
	mov	ax,WORD PTR [bp+4]	;xval
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
	mov	WORD PTR [bp-14],ax	;lxval
	mov	WORD PTR [bp-12],dx
; Line 2840
	mov	ax,WORD PTR [bp+6]	;yval
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
	mov	WORD PTR [bp-18],ax	;lyval
	mov	WORD PTR [bp-16],dx
; Line 2842
	mov	cx,WORD PTR _Py
	sub	cx,WORD PTR [bp+6]	;yval
	push	cx
	mov	cx,WORD PTR _Px
	sub	cx,WORD PTR [bp+4]	;xval
	push	cx
	call	_xydist
	add	sp,4
	cmp	ax,WORD PTR [bp+10]	;blastrad
	jb	$JCC16024
	jmp	$I2436
$JCC16024:
; Line 2843
	mov	ax,WORD PTR _Alt
	sub	ax,WORD PTR [bp+8]	;zval
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,300
	jl	$JCC16045
	jmp	$I2436
$JCC16045:
; Line 2844
	mov	ax,13
	push	ax
	call	_DamageMe
	add	sp,2
; Line 2845
	mov	BYTE PTR _Txt,0
; Line 2846
	mov	ax,10
	push	ax
	sub	ax,ax
	push	ax
	sub	cx,cx
	mov	dx,16
	sub	cx,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	cx
	push	WORD PTR _Alt
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	call	_StartASmoke
	add	sp,14
; Line 2847
	mov	ax,OFFSET DGROUP:$SG2439
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 2848
	cmp	WORD PTR [bp+12],-1	;iscruise
	jle	$I2440
; Line 2849
	mov	ax,WORD PTR _ptype
	mov	dx,WORD PTR _ptype+2
	inc	ax
	inc	ax
	push	dx
	push	ax
	mov	ax,OFFSET _Txt
	push	ds
	push	ax
	call	__fstrcat
	add	sp,8
; Line 2850
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	push	WORD PTR [bp+16]	;missiletype
	push	WORD PTR [bp+14]	;camefrom
	push	WORD PTR [bp+8]	;zval
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;lyval
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;lxval
	mov	ax,-1
	push	ax
	mov	ax,12
	jmp	SHORT $L20089
$I2440:
; Line 2853
	mov	ax,OFFSET DGROUP:$SG2443
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2854
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	push	WORD PTR [bp+16]	;missiletype
	push	WORD PTR [bp+14]	;camefrom
	push	WORD PTR [bp+8]	;zval
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;lyval
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;lxval
	mov	ax,-1
	push	ax
	mov	ax,25
$L20089:
	push	ax
	call	_LogIt
	add	sp,24
; Line 2855
; Line 2856
	mov	ax,2
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 2857
; Line 2858
$I2436:
; Line 2860
	mov	WORD PTR [bp-6],69	;cnt
	jmp	$F2444
$I2451:
; Line 2872
	mov	WORD PTR [bp-20],26	;hitmsg
; Line 2873
	mov	WORD PTR [bp-2],29	;destroymsg
; Line 2874
; Line 2875
; Line 2876
	jmp	SHORT $I2455
$I2450:
; Line 2877
	mov	WORD PTR [bp-4],0	;logtype
; Line 2878
	cmp	WORD PTR [bp+12],-1	;iscruise
	jle	$I2454
; Line 2879
	mov	WORD PTR [bp-20],12	;hitmsg
; Line 2880
	mov	WORD PTR [bp-2],21	;destroymsg
; Line 2881
; Line 2882
	jmp	SHORT $I2455
	nop	
$I2454:
; Line 2883
	mov	WORD PTR [bp-20],25	;hitmsg
; Line 2884
	mov	WORD PTR [bp-2],28	;destroymsg
; Line 2885
$I2455:
; Line 2886
; Line 2887
	cmp	WORD PTR [bp-6],ax	;cnt
	jg	$JCC16307
	jmp	$I2456
$JCC16307:
	mov	ax,46
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+26],5
	jl	$JCC16325
	jmp	$I2456
$JCC16325:
; Line 2888
	inc	WORD PTR _bv[bx+26]
; Line 2889
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _bv[bx+22],ax
	jle	$I2457
; Line 2890
	add	WORD PTR _bv[bx+22],120
; Line 2891
	jmp	SHORT $I2458
$I2457:
; Line 2892
	mov	ax,46
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _Gtime
	add	ax,120
	mov	WORD PTR _bv[bx+22],ax
$I2458:
; Line 2893
	mov	ax,10
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,40
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	si,bx
	call	_StartASmoke
	add	sp,14
; Line 2895
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
	call	__fstrcpy
	add	sp,8
; Line 2896
	mov	ax,OFFSET DGROUP:$SG2459
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2897
	cmp	WORD PTR [bp+12],-1	;iscruise
	jle	$I2460
; Line 2898
	mov	ax,WORD PTR _ptype
	mov	dx,WORD PTR _ptype+2
	inc	ax
	inc	ax
	push	dx
	push	ax
	mov	ax,OFFSET _Txt
	push	ds
	push	ax
	call	__fstrcat
	add	sp,8
; Line 2899
	mov	ax,1
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR [bp+16]	;missiletype
	push	WORD PTR [bp+14]	;camefrom
	push	WORD PTR [bp+8]	;zval
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;lyval
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;lxval
	push	WORD PTR [bp-6]	;cnt
	mov	ax,13
	jmp	SHORT $L20090
	nop	
$I2460:
; Line 2902
	mov	ax,OFFSET DGROUP:$SG2462
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2903
	mov	ax,1
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR [bp+16]	;missiletype
	push	WORD PTR [bp+14]	;camefrom
	push	WORD PTR [bp+8]	;zval
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;lyval
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;lxval
	push	WORD PTR [bp-6]	;cnt
	mov	ax,26
$L20090:
	push	ax
	call	_LogIt
	add	sp,24
; Line 2904
; Line 2905
	mov	ax,4
	jmp	$L20091
$I2456:
; Line 2908
	mov	WORD PTR [bp-24],0	;doKill
; Line 2909
	mov	ax,46
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	je	$I2465
	test	BYTE PTR _Rtime,1
	jne	$I2465
	mov	ax,WORD PTR [bp-6]	;cnt
	cmp	WORD PTR _whichourcarr,ax
	jne	$I2464
$I2465:
; Line 2910
	mov	ax,40
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	mov	al,BYTE PTR _ps[bx+24]
	and	ax,32
	mov	WORD PTR [bp-22],ax	;crashstat
; Line 2911
	push	WORD PTR [bp-6]	;cnt
	mov	si,bx
	call	_DamageAI
	add	sp,2
; Line 2912
	mov	al,BYTE PTR _ps[si+24]
	and	ax,32
	cmp	ax,WORD PTR [bp-22]	;crashstat
	je	$I2467
	jmp	SHORT $L20093
	nop	
$I2464:
; Line 2916
	push	ax
	call	_AirKill
	add	sp,2
; Line 2917
$L20093:
	mov	WORD PTR [bp-24],1	;doKill
; Line 2918
$I2467:
; Line 2919
	mov	ax,OFFSET DGROUP:$SG2468
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2920
	cmp	WORD PTR [bp+12],-1	;iscruise
	jle	$I2469
; Line 2921
	mov	ax,WORD PTR _ptype
	mov	dx,WORD PTR _ptype+2
	inc	ax
	inc	ax
	push	dx
	push	ax
	mov	ax,OFFSET _Txt
	push	ds
	push	ax
	call	__fstrcat
	add	sp,8
; Line 2922
	cmp	WORD PTR [bp-24],0	;doKill
	je	$L20095
; Line 2923
$L20094:
	push	WORD PTR [bp-4]	;logtype
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR [bp+16]	;missiletype
	push	WORD PTR [bp+14]	;camefrom
	push	WORD PTR [bp+8]	;zval
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;lyval
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;lxval
	push	WORD PTR [bp-6]	;cnt
	push	WORD PTR [bp-2]	;destroymsg
	jmp	SHORT $L20092
$I2469:
; Line 2928
	mov	ax,OFFSET DGROUP:$SG2473
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2929
	cmp	WORD PTR [bp-24],0	;doKill
	jne	$L20094
; Line 2932
$L20095:
	push	WORD PTR [bp-4]	;logtype
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR [bp+16]	;missiletype
	push	WORD PTR [bp+14]	;camefrom
	push	WORD PTR [bp+8]	;zval
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;lyval
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;lxval
	push	WORD PTR [bp-6]	;cnt
	push	WORD PTR [bp-20]	;hitmsg
$L20092:
	call	_LogIt
	add	sp,24
; Line 2933
; Line 2934
	mov	ax,3
$L20091:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 2935
; Line 2936
; Line 2937
$I2449:
; Line 2938
; Line 2939
	dec	WORD PTR [bp-6]	;cnt
$F2444:
	cmp	WORD PTR [bp-6],0	;cnt
	jge	$JCC16835
	jmp	$FB2446
$JCC16835:
; Line 2861
	mov	BYTE PTR _Txt,0
; Line 2862
	mov	ax,40
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2449
	test	cl,2
	je	$I2449
	test	cl,32
	jne	$I2449
; Line 2863
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR [bp+6]	;yval
	push	ax
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR [bp+4]	;xval
	push	ax
	mov	si,bx
	call	_xydist
	add	sp,4
	cmp	ax,WORD PTR [bp+10]	;blastrad
	jae	$I2449
	mov	ax,46
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FlyCruise
	je	$I2449
; Line 2864
	mov	ax,WORD PTR _ps[si+6]
	sub	ax,WORD PTR [bp+8]	;zval
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,300
	jge	$I2449
; Line 2865
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-6],ax	;cnt
	jg	$JCC16943
	jmp	$I2450
$JCC16943:
; Line 2866
	mov	WORD PTR [bp-4],1	;logtype
; Line 2867
	cmp	WORD PTR [bp+12],-1	;iscruise
	jg	$JCC16957
	jmp	$I2451
$JCC16957:
; Line 2868
	mov	WORD PTR [bp-20],13	;hitmsg
; Line 2869
	mov	WORD PTR [bp-2],22	;destroymsg
; Line 2870
; Line 2871
	jmp	$I2455
	nop	
$FB2446:
; Line 2940
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CheckPlaneBlast	ENDP
; Line 2943
	PUBLIC	_EngageTrain
_EngageTrain	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 2944
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,8192
	sub	ax,WORD PTR _ps[bx+20]
	mov	WORD PTR _droll,ax
; Line 2945
	cmp	WORD PTR _ps[bx+6],2500
	jle	$I2477
; Line 2946
	mov	WORD PTR _pdest,-2048
; Line 2947
	ret	
	nop	
$I2477:
; Line 2948
	mov	WORD PTR _pdest,0
; Line 2950
	ret	
	nop	

_EngageTrain	ENDP
; Line 2953
	PUBLIC	_JustPutHere
_JustPutHere	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	di
	push	si
;	prewing = 16
;	altval = 14
;	yval = 10
;	xval = 6
;	planenum = 4
; Line 2954
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp+8]
	push	WORD PTR [bp+6]	;xval
	call	__aNldiv
	mov	cx,ax
	mov	ax,40
	mov	bx,dx
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	mov	WORD PTR _ps[si+8],cx
	mov	WORD PTR _ps[si+10],bx
; Line 2955
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp+12]
	push	WORD PTR [bp+10]	;yval
	call	__aNldiv
	mov	WORD PTR _ps[si+12],ax
	mov	WORD PTR _ps[si+14],dx
; Line 2956
	mov	cx,100
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR _ps[si+10]
	push	WORD PTR _ps[si+8]
	mov	di,ax
	mov	WORD PTR [bp-4],di
	mov	WORD PTR [bp-2],dx
	call	__aNlmul
	add	ax,50
	adc	dx,0
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	mov	WORD PTR _ailoc[bx],ax
	mov	WORD PTR _ailoc[bx+2],dx
; Line 2957
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]
	mov	di,bx
	call	__aNlmul
	add	ax,50
	adc	dx,0
	mov	WORD PTR _ailoc[di+4],ax
	mov	WORD PTR _ailoc[di+6],dx
; Line 2958
	mov	ax,WORD PTR _ps[si+8]
	mov	dx,WORD PTR _ps[si+10]
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
	mov	WORD PTR _ps[si+2],ax
; Line 2959
	mov	ax,WORD PTR _ps[si+12]
	mov	dx,WORD PTR _ps[si+14]
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
	mov	WORD PTR _ps[si+4],ax
; Line 2960
	mov	ax,WORD PTR [bp+14]	;altval
	mov	WORD PTR _ps[si+6],ax
; Line 2961
	cmp	WORD PTR [bp+16],-1	;prewing
	jne	$I2485
; Line 2962
	mov	ax,WORD PTR _OurRoll
	mov	WORD PTR _ps[si+20],ax
; Line 2963
	mov	ax,WORD PTR _OurPitch
	mov	WORD PTR _ps[si+18],ax
; Line 2964
	mov	ax,WORD PTR _OurHead
	mov	WORD PTR _ps[si+16],ax
; Line 2965
	push	WORD PTR [bp+16]	;prewing
	mov	ax,1
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR _Knots
	jmp	SHORT $L20096
	nop	
$I2485:
; Line 2968
	mov	ax,40
	imul	WORD PTR [bp+16]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+20]
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	mov	WORD PTR _ps[si+20],cx
; Line 2969
	mov	ax,WORD PTR _ps[bx+18]
	mov	WORD PTR _ps[si+18],ax
; Line 2970
	mov	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR _ps[si+16],ax
; Line 2973
	push	WORD PTR [bp+16]	;prewing
	mov	ax,1
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,46
	imul	WORD PTR [bp+16]	;prewing
	mov	bx,ax
	push	WORD PTR _bv[bx+18]
$L20096:
	call	_FormationSpeedAdjustUS
	add	sp,8
; Line 2974
; Line 2975
	mov	WORD PTR _droll,0
; Line 2976
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+18]
	mov	WORD PTR _pdest,ax
; Line 2977
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_JustPutHere	ENDP
; Line 2980
	PUBLIC	_SetUpLaunch
_SetUpLaunch	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,34
	call	__aNchkstk
	push	si
;	whichcarr = -26
;	catval = -28
;	numondeck = -12
;	numinfront = -6
;	xplace = -34
;	yplacefront = -18
;	yplacerear = -24
;	waypt = 6
;	planenum = 4
; Line 2982
	mov	WORD PTR [bp-12],10	;numondeck
	mov	ax,9
	mov	WORD PTR [bp-10],ax
	mov	WORD PTR [bp-8],ax
; Line 2983
	mov	WORD PTR [bp-6],8	;numinfront
	mov	WORD PTR [bp-4],7
	mov	WORD PTR [bp-2],5
; Line 2984
	mov	ax,25
	mov	WORD PTR [bp-34],ax	;xplace
	mov	WORD PTR [bp-32],ax
	mov	WORD PTR [bp-30],ax
; Line 2985
	mov	WORD PTR [bp-18],-84	;yplacefront
	mov	WORD PTR [bp-16],-65
	mov	WORD PTR [bp-14],-77
; Line 2986
	mov	WORD PTR [bp-24],-47	;yplacerear
	mov	WORD PTR [bp-22],-26
	mov	WORD PTR [bp-20],-41
; Line 2990
	mov	ax,WORD PTR _ConfigData+22
	mov	WORD PTR [bp-26],ax	;whichcarr
; Line 2991
	cmp	ax,2
	jg	$I2498
	or	ax,ax
	jge	$I2497
$I2498:
; Line 2992
	mov	WORD PTR [bp-26],0	;whichcarr
; Line 2994
$I2497:
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	or	BYTE PTR _ps[bx+25],128
; Line 2996
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	sub	ax,ax
	mov	WORD PTR _bv[si+18],ax
	mov	WORD PTR _ps[bx+26],ax
; Line 2997
	mov	WORD PTR _ps[bx+6],1
; Line 2998
	test	BYTE PTR _bv[si+21],128
	je	$JCC17545
	jmp	$I2509
$JCC17545:
; Line 3000
	mov	bx,WORD PTR [bp+6]	;waypt
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jle	$JCC17570
	jmp	$I2509
$JCC17570:
	jl	$L20006
	cmp	WORD PTR _aiwaypoints[bx],-1
	jbe	$JCC17582
	jmp	$I2509
$JCC17582:
$L20006:
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],4
	jne	$JCC17600
	jmp	$I2509
$JCC17600:
; Line 3007
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	je	$I2501
; Line 3009
	push	WORD PTR [bp+4]	;planenum
	mov	ax,-1
	push	ax
	call	_RequestCat
	add	sp,4
	mov	WORD PTR [bp-28],ax	;catval
	cmp	ax,1
	jg	$I2504
; Line 3010
	mov	cx,ax
	mov	ax,16
	shl	ax,cl
	or	WORD PTR _landingstatus,ax
; Line 3011
; Line 3012
	jmp	SHORT $I2504
	nop	
$I2501:
; Line 3013
	push	WORD PTR [bp+4]	;planenum
	mov	ax,3
	push	ax
	call	_RequestCat
	add	sp,4
	mov	WORD PTR [bp-28],ax	;catval
; Line 3014
$I2504:
; Line 3016
	cmp	WORD PTR [bp-28],-1	;catval
	je	$I2505
; Line 3017
	push	WORD PTR [bp+4]	;planenum
	push	WORD PTR [bp-28]	;catval
	call	_PreparePlane
	add	sp,4
; Line 3018
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp-28]	;catval
	mov	WORD PTR _bv[bx+38],ax
; Line 3019
	cmp	WORD PTR _bv[bx+2],-1
	jne	$I2507
; Line 3020
	add	ax,6
$L20097:
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	add	ax,WORD PTR _Gtime
	mov	WORD PTR _bv[bx+22],ax
; Line 3021
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I2507:
; Line 3022
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp-28]	;catval
	inc	ax
	inc	ax
	jmp	SHORT $L20097
	nop	
$I2505:
; Line 3032
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _bv[bx+38],-5
; Line 3033
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	jne	$I2510
	cmp	WORD PTR _lastcatused,4
	jne	$I2510
; Line 3034
	inc	WORD PTR _lastcatused
; Line 3035
$I2510:
	mov	si,WORD PTR [bp-26]	;whichcarr
	shl	si,1
	mov	ax,WORD PTR _lastcatused
	cmp	WORD PTR [bp-12][si],ax
	jg	$JCC17796
	jmp	$I2511
$JCC17796:
; Line 3036
	mov	ax,100
	imul	WORD PTR [bp-34][si]
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	mov	WORD PTR _ailoc[bx],ax
	mov	WORD PTR _ailoc[bx+2],dx
; Line 3037
	mov	ax,WORD PTR _lastcatused
	cmp	WORD PTR [bp-6][si],ax
	jle	$I2512
; Line 3038
	mov	cx,100
	sub	dx,dx
	push	dx
	push	cx
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,cx
	shl	ax,1
	cwd	
	mov	cx,ax
	mov	ax,WORD PTR [bp-18][si]
	mov	si,dx
	cwd	
	add	cx,ax
	adc	si,dx
	push	si
	push	cx
	mov	si,bx
	call	__aNlmul
	mov	WORD PTR _ailoc[si+4],ax
	mov	WORD PTR _ailoc[si+6],dx
; Line 3039
	jmp	SHORT $I2514
	nop	
$I2512:
; Line 3040
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _lastcatused
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,cx
	shl	ax,1
	cwd	
	mov	si,WORD PTR [bp-26]	;whichcarr
	shl	si,1
	mov	cx,ax
	mov	ax,WORD PTR [bp-24][si]
	mov	bx,dx
	cwd	
	add	cx,ax
	adc	bx,dx
	push	bx
	push	cx
	call	__aNlmul
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	mov	WORD PTR _ailoc[bx+4],ax
	mov	WORD PTR _ailoc[bx+6],dx
; Line 3048
; Line 3049
	jmp	SHORT $I2514
	nop	
$I2511:
; Line 3054
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	mov	WORD PTR _ailoc[bx],-2800
	mov	WORD PTR _ailoc[bx+2],-1
; Line 3055
	mov	WORD PTR _ailoc[bx+4],-3200
	mov	WORD PTR _ailoc[bx+6],-1
; Line 3057
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],8
; Line 3063
$I2514:
; Line 3065
	inc	WORD PTR _lastcatused
; Line 3066
$I2509:
; Line 3067
; Line 3073
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_SetUpLaunch	ENDP
; Line 3075
_TEXT      ENDS
CONST      SEGMENT
$T20007	DW SEG _carrier 
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_GetNextLaunch
_GetNextLaunch	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,60
	call	__aNchkstk
	push	si
;	cnt = -50
;	catval = -58
;	basenum = -56
;	elevX = -24
;	elevY = -48
;	elevnum = -60
;	cnt2 = -52
;	whichcarr = -54
;	planenum = 4
; Line 3081
	mov	ax,25
	mov	WORD PTR [bp-24],ax	;elevX
	mov	WORD PTR [bp-22],ax
	mov	WORD PTR [bp-20],ax
	mov	WORD PTR [bp-16],ax
	mov	WORD PTR [bp-14],ax
	mov	WORD PTR [bp-12],ax
	mov	WORD PTR [bp-8],ax
	mov	WORD PTR [bp-6],ax
	mov	WORD PTR [bp-4],ax
	mov	ax,-27
	mov	WORD PTR [bp-18],ax
	mov	WORD PTR [bp-10],ax
	mov	WORD PTR [bp-2],ax
; Line 3082
	mov	WORD PTR [bp-48],-28	;elevY
	mov	WORD PTR [bp-46],7
	mov	WORD PTR [bp-44],76
	mov	WORD PTR [bp-42],77
; Line 3083
	mov	WORD PTR [bp-40],-17
	mov	WORD PTR [bp-38],21
	mov	WORD PTR [bp-36],82
	mov	WORD PTR [bp-34],89
; Line 3084
	mov	WORD PTR [bp-32],-13
	mov	WORD PTR [bp-30],35
	mov	WORD PTR [bp-28],69
	mov	WORD PTR [bp-26],-33
; Line 3090
	mov	ax,WORD PTR _ConfigData+22
	mov	WORD PTR [bp-54],ax	;whichcarr
; Line 3091
	cmp	ax,2
	jg	$I2527
	or	ax,ax
	jge	$I2526
$I2527:
; Line 3092
	mov	WORD PTR [bp-54],0	;whichcarr
; Line 3094
$I2526:
	cmp	WORD PTR [bp+4],-1	;planenum
	jne	$I2528
; Line 3095
	mov	ax,WORD PTR _PlayerCat
	mov	WORD PTR [bp-58],ax	;catval
; Line 3096
	mov	ax,-1
	sub	ax,WORD PTR _whichourcarr
	mov	WORD PTR [bp-56],ax	;basenum
; Line 3097
; Line 3098
	jmp	SHORT $I2532
$I2528:
; Line 3099
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+38]
	mov	WORD PTR [bp-58],ax	;catval
; Line 3100
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	mov	ax,WORD PTR _ps[si]
	mov	WORD PTR [bp-56],ax	;basenum
; Line 3101
	cmp	WORD PTR _bv[bx+14],-1
	je	$I2530
; Line 3102
	mov	bx,WORD PTR _bv[bx+14]
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx+2],0
	jl	$I2532
; Line 3103
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2530:
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _SARCAP1
	je	$JCC18232
	jmp	$FB2539
$JCC18232:
; Line 3109
$I2532:
; Line 3110
	cmp	WORD PTR [bp-58],0	;catval
	jge	$JCC18241
	jmp	$FB2539
$JCC18241:
	cmp	WORD PTR [bp-58],3	;catval
	jle	$JCC18250
	jmp	$FB2539
$JCC18250:
; Line 3113
	test	BYTE PTR _landingstatus,128
	je	$I2536
	cmp	WORD PTR [bp-58],2	;catval
	jge	$JCC18266
	jmp	$FB2539
$JCC18266:
; Line 3116
$I2536:
	mov	WORD PTR [bp-52],0	;cnt2
	jmp	$F2537
; Line 3133
	nop	
$SC2552:
; Line 3134
	mov	ax,1
	push	ax
	sub	cx,cx
	push	cx
	jmp	$L20098
; Line 3136
$I2554:
; Line 3146
	mov	ax,40
	imul	WORD PTR [bp-50]	;cnt
	mov	bx,ax
	mov	es,WORD PTR $T20007
	mov	ax,WORD PTR es:_carrier+12
	add	ah,64
$L20099:
	mov	WORD PTR _ps[bx+16],ax
; Line 3147
$I2555:
; Line 3148
; Line 3150
	cmp	WORD PTR [bp-58],1	;catval
	jle	$JCC18317
	jmp	$FB2539
$JCC18317:
; Line 3151
	mov	cl,BYTE PTR [bp-58]	;catval
	mov	ax,16
	shl	ax,cl
	or	WORD PTR _landingstatus,ax
; Line 3152
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 3153
; Line 3154
	nop	
$I2544:
; Line 3155
	inc	WORD PTR [bp-50]	;cnt
$F2540:
	mov	ax,WORD PTR [bp-50]	;cnt
	cmp	WORD PTR _NPLANES,ax
	jg	$JCC18350
	jmp	$FC2538
$JCC18350:
; Line 3118
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2544
	test	cl,2
	je	$I2544
; Line 3119
	test	ch,128
	je	$I2544
	mov	ax,WORD PTR [bp-56]	;basenum
	cmp	WORD PTR _ps[bx],ax
	jne	$I2544
	mov	ax,46
	imul	WORD PTR [bp-50]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+38],-5
	jne	$I2544
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	jne	$I2545
	cmp	WORD PTR [bp-52],1	;cnt2
	jne	$I2544
	cmp	WORD PTR [bp-58],1	;catval
	jle	$I2544
$I2545:
; Line 3127
	mov	ax,46
	imul	WORD PTR [bp-50]	;cnt
	mov	bx,ax
	mov	ax,-1
	sub	ax,WORD PTR [bp-58]	;catval
	mov	WORD PTR _bv[bx+38],ax
; Line 3128
	test	BYTE PTR _bv[bx+21],8
	jne	$JCC18449
	jmp	$I2555
$JCC18449:
; Line 3129
	mov	ax,WORD PTR [bp-54]	;whichcarr
	dec	ax
	je	$SC2551
	dec	ax
	jne	$JCC18461
	jmp	$SC2552
$JCC18461:
$SC2551:
; Line 3131
	mov	ax,1
	push	ax
	sub	cx,cx
	push	cx
	mov	cx,3
$L20098:
	push	cx
	mov	cx,2
	push	cx
	push	ax
	call	_GetWhichElevator
	add	sp,10
	mov	WORD PTR [bp-60],ax	;elevnum
; Line 3140
	mov	si,WORD PTR [bp-54]	;whichcarr
	shl	si,1
	shl	si,1
	add	si,ax
	shl	si,1
	mov	ax,100
	imul	WORD PTR [bp-24][si]
	mov	cl,3
	mov	bx,WORD PTR [bp-50]	;cnt
	shl	bx,cl
	mov	WORD PTR _ailoc[bx],ax
	mov	WORD PTR _ailoc[bx+2],dx
; Line 3141
	mov	ax,100
	imul	WORD PTR [bp-48][si]
	mov	WORD PTR _ailoc[bx+4],ax
	mov	WORD PTR _ailoc[bx+6],dx
; Line 3142
	cmp	WORD PTR [bp-60],3	;elevnum
	jl	$JCC18541
	jmp	$I2554
$JCC18541:
; Line 3143
	mov	ax,40
	imul	WORD PTR [bp-50]	;cnt
	mov	bx,ax
	mov	es,WORD PTR $T20007
	mov	ax,WORD PTR es:_carrier+12
	sub	ax,16384
	jmp	$L20099
; Line 3156
$FC2538:
	inc	WORD PTR [bp-52]	;cnt2
$F2537:
	cmp	WORD PTR [bp-52],2	;cnt2
	jge	$FB2539
; Line 3117
	mov	WORD PTR [bp-50],0	;cnt
	jmp	$F2540
	nop	
$FB2539:
; Line 3157
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetNextLaunch	ENDP
; Line 3160
	PUBLIC	_DoAltHover
_DoAltHover	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
;	speedval = -8
;	altval = -6
;	headval = -12
;	attack = -14
;	launch = -16
;	wpflag = -2
;	wayval = -4
;	behavenum = -18
;	formnum = -10
; Line 3162
	mov	WORD PTR [bp-4],0	;wayval
; Line 3164
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _bv[bx+22],ax
	jle	$JCC18622
	jmp	$I2567
$JCC18622:
; Line 3165
	mov	WORD PTR _bv[bx+22],0
; Line 3166
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+14]
	mov	WORD PTR [bp-4],ax	;wayval
; Line 3167
	or	ax,ax
	jge	$JCC18651
	jmp	$I2581
$JCC18651:
; Line 3169
	mov	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx],-2
	jne	$I2569
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jne	$I2569
; Line 3170
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+14]
	inc	ax
	inc	ax
	jmp	SHORT $L20101
	nop	
$I2569:
; Line 3172
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+14]
	inc	ax
$L20101:
	mov	WORD PTR [bp-4],ax	;wayval
; Line 3174
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-4]	;wayval
	mov	WORD PTR _bv[bx+14],ax
; Line 3175
	mov	WORD PTR _bv[bx],OFFSET _FlyWayPoint
; Line 3176
	lea	cx,WORD PTR [bp-2]	;wpflag
	push	cx
	lea	cx,WORD PTR [bp-16]	;launch
	push	cx
	lea	cx,WORD PTR [bp-14]	;attack
	push	cx
	lea	cx,WORD PTR [bp-12]	;headval
	push	cx
	lea	cx,WORD PTR [bp-6]	;altval
	push	cx
	lea	cx,WORD PTR [bp-8]	;speedval
	push	cx
	lea	dx,WORD PTR [bp-10]	;formnum
	push	dx
	lea	dx,WORD PTR [bp-18]	;behavenum
	push	dx
	push	ax
	call	_GetWayPointChanges
	add	sp,18
; Line 3177
	cmp	WORD PTR [bp-8],-1	;speedval
	jne	$I2571
; Line 3178
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],90
; Line 3179
	jmp	SHORT $I2572
	nop	
$I2571:
; Line 3180
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-8]	;speedval
	mov	WORD PTR _bv[bx+18],ax
$I2572:
; Line 3181
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	push	WORD PTR _bv[bx+14]
	push	WORD PTR _planecnt
	call	_DoNextWayPt
	add	sp,4
; Line 3182
	mov	sp,bp
	pop	bp
	ret	
; Line 3183
; Line 3184
	nop	
$I2567:
	call	_DoHover
; Line 3187
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+14]
	mov	WORD PTR [bp-4],ax	;wayval
	or	ax,ax
	jge	$JCC18867
	jmp	$I2581
$JCC18867:
; Line 3190
	lea	ax,WORD PTR [bp-2]	;wpflag
	push	ax
	lea	ax,WORD PTR [bp-16]	;launch
	push	ax
	lea	ax,WORD PTR [bp-14]	;attack
	push	ax
	lea	ax,WORD PTR [bp-12]	;headval
	push	ax
	lea	ax,WORD PTR [bp-6]	;altval
	push	ax
	lea	cx,WORD PTR [bp-8]	;speedval
	push	cx
	lea	cx,WORD PTR [bp-10]	;formnum
	push	cx
	lea	cx,WORD PTR [bp-18]	;behavenum
	push	cx
	push	WORD PTR [bp-4]	;wayval
	call	_GetWayPointChanges
	add	sp,18
; Line 3191
	cmp	WORD PTR [bp-6],-1	;altval
	jne	$I2574
; Line 3192
	mov	WORD PTR [bp-6],1	;altval
; Line 3194
$I2574:
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-6]	;altval
	cmp	WORD PTR _ps[bx+6],ax
	jle	$I2575
; Line 3195
	add	ax,10
	cmp	WORD PTR _ps[bx+6],ax
	jle	$I2576
; Line 3196
	mov	WORD PTR _pdest,-4096
; Line 3197
; Line 3198
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2576:
; Line 3199
	mov	WORD PTR _pdest,-512
; Line 3200
; Line 3201
; Line 3202
	mov	sp,bp
	pop	bp
	ret	
$I2575:
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-6]	;altval
	cmp	WORD PTR _ps[bx+6],ax
	jge	$I2581
; Line 3203
	sub	ax,10
	cmp	WORD PTR _ps[bx+6],ax
	jge	$I2580
; Line 3204
	mov	WORD PTR _pdest,4096
; Line 3205
; Line 3206
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2580:
; Line 3207
	mov	WORD PTR _pdest,512
; Line 3208
$I2581:
; Line 3209
; Line 3210
	mov	sp,bp
	pop	bp
	ret	

_DoAltHover	ENDP
; Line 3213
	PUBLIC	_GetRadarGTNum
_GetRadarGTNum	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	cnt = -2
;	radarnum = 4
; Line 3215
	mov	WORD PTR [bp-2],0	;cnt
	jmp	SHORT $F2585
; Line 3218
	nop	
$FC2586:
	inc	WORD PTR [bp-2]	;cnt
$F2585:
	mov	ax,WORD PTR [bp-2]	;cnt
	cmp	WORD PTR _NGTARGETS,ax
	jle	$FB2587
; Line 3216
	mov	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR _gt[bx]
	mov	dx,WORD PTR _gt[bx+2]
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
	mov	si,WORD PTR [bp+4]	;radarnum
	mov	cx,si
	shl	si,1
	shl	si,1
	add	si,cx
	shl	si,1
	cmp	ax,WORD PTR _Rdrs[si]
	jne	$FC2586
	mov	ax,WORD PTR _gt[bx+4]
	mov	dx,WORD PTR _gt[bx+6]
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
	cmp	ax,WORD PTR _Rdrs[si+2]
	jne	$FC2586
; Line 3217
	mov	ax,WORD PTR _gt[bx+8]
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$FB2587:
; Line 3219
	mov	ax,-999
; Line 3220
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_GetRadarGTNum	ENDP
; Line 3223
	PUBLIC	_GetGTRadarNum
_GetGTRadarNum	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	cnt = -2
;	gtnum = 4
; Line 3225
	mov	WORD PTR [bp-2],0	;cnt
	jmp	SHORT $F2592
; Line 3228
	nop	
$FC2593:
	inc	WORD PTR [bp-2]	;cnt
$F2592:
	mov	ax,WORD PTR _NRADAR
	cmp	WORD PTR [bp-2],ax	;cnt
	jge	$FB2594
; Line 3226
	mov	bx,WORD PTR [bp+4]	;gtnum
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR _gt[bx]
	mov	dx,WORD PTR _gt[bx+2]
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
	mov	si,WORD PTR [bp-2]	;cnt
	mov	cx,si
	shl	si,1
	shl	si,1
	add	si,cx
	shl	si,1
	cmp	ax,WORD PTR _Rdrs[si]
	jne	$FC2593
	mov	ax,WORD PTR _gt[bx+4]
	mov	dx,WORD PTR _gt[bx+6]
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
	cmp	ax,WORD PTR _Rdrs[si+2]
	jne	$FC2593
; Line 3227
	mov	ax,cx
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$FB2594:
; Line 3229
	mov	ax,-999
; Line 3230
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_GetGTRadarNum	ENDP
; Line 3235
	PUBLIC	_IndirectWPCorrection
_IndirectWPCorrection	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
;	newx = -6
;	newy = -10
;	cnt = -12
;	orgnum = -18
;	otherplane = -2
;	done = -14
;	planenum = 4
; Line 3240
	mov	WORD PTR [bp-14],0	;done
; Line 3242
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+44]
	cbw	
	cwd	
	mov	WORD PTR [bp-18],ax	;orgnum
	mov	WORD PTR [bp-16],dx
; Line 3243
	mov	WORD PTR [bp-6],-1	;newx
	mov	WORD PTR [bp-4],-1
; Line 3245
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-2],ax	;otherplane
; Line 3246
	cmp	ax,-999
	je	$I2605
; Line 3247
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,2
	je	$I2605
	test	cl,1
	je	$I2605
; Line 3248
	mov	ax,46
	imul	WORD PTR [bp-2]	;otherplane
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+44]
	cbw	
	cwd	
	mov	WORD PTR [bp-10],ax	;newy
	mov	WORD PTR [bp-8],dx
; Line 3249
	mov	WORD PTR [bp-14],1	;done
; Line 3250
; Line 3251
$I2605:
; Line 3254
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-2],ax	;otherplane
	cmp	ax,-999
	je	$I2607
	cmp	WORD PTR [bp-14],0	;done
	jne	$I2607
; Line 3255
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,2
	je	$I2607
	test	cl,1
	je	$I2607
; Line 3256
	mov	ax,46
	imul	WORD PTR [bp-2]	;otherplane
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+44]
	cbw	
	cwd	
	mov	WORD PTR [bp-10],ax	;newy
	mov	WORD PTR [bp-8],dx
; Line 3257
	mov	WORD PTR [bp-14],1	;done
; Line 3258
; Line 3259
$I2607:
; Line 3261
	cmp	WORD PTR [bp-14],0	;done
	jne	$I2608
; Line 3262
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
	mov	WORD PTR [bp-6],ax	;newx
	mov	WORD PTR [bp-4],dx
; Line 3263
	mov	ax,WORD PTR _ps[bx+12]
	mov	dx,WORD PTR _ps[bx+14]
	mov	WORD PTR [bp-10],ax	;newy
	mov	WORD PTR [bp-8],dx
; Line 3264
; Line 3266
$I2608:
	mov	WORD PTR [bp-12],0	;cnt
	jmp	$F2609
$I2613:
; Line 3274
	mov	bx,WORD PTR [bp-12]	;cnt
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx],-2
	jne	$I2616
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jne	$I2616
	cmp	ax,69
	jge	$I2616
; Line 3275
	mov	ax,WORD PTR _aiwaypoints[bx+14]
	mov	dx,WORD PTR _aiwaypoints[bx+16]
	add	ax,WORD PTR [bp-6]	;newx
	adc	dx,WORD PTR [bp-4]
	mov	WORD PTR _aiwaypoints[bx],ax
	mov	WORD PTR _aiwaypoints[bx+2],dx
; Line 3276
	mov	ax,WORD PTR _aiwaypoints[bx+18]
	mov	dx,WORD PTR _aiwaypoints[bx+20]
	add	ax,WORD PTR [bp-10]	;newy
	adc	dx,WORD PTR [bp-8]
	mov	WORD PTR _aiwaypoints[bx+4],ax
	mov	WORD PTR _aiwaypoints[bx+6],dx
; Line 3278
	mov	ax,WORD PTR [bp-6]	;newx
	mov	dx,WORD PTR [bp-4]
	inc	WORD PTR [bp-12]	;cnt
	mov	bx,WORD PTR [bp-12]	;cnt
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	add	WORD PTR _aiwaypoints[bx],ax
	adc	WORD PTR _aiwaypoints[bx+2],dx
; Line 3279
	mov	ax,WORD PTR [bp-10]	;newy
	mov	dx,WORD PTR [bp-8]
	add	WORD PTR _aiwaypoints[bx+4],ax
	adc	WORD PTR _aiwaypoints[bx+6],dx
; Line 3280
; Line 3281
	jmp	SHORT $I2617
$I2616:
; Line 3282
	mov	ax,WORD PTR [bp-6]	;newx
	mov	dx,WORD PTR [bp-4]
	mov	bx,WORD PTR [bp-12]	;cnt
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	mov	WORD PTR _aiwaypoints[bx],ax
	mov	WORD PTR _aiwaypoints[bx+2],dx
; Line 3283
	mov	ax,WORD PTR [bp-10]	;newy
	mov	dx,WORD PTR [bp-8]
	mov	WORD PTR _aiwaypoints[bx+4],ax
	mov	WORD PTR _aiwaypoints[bx+6],dx
; Line 3284
$I2617:
; Line 3285
; Line 3286
; Line 3287
	inc	WORD PTR [bp-12]	;cnt
$F2609:
	cmp	WORD PTR [bp-12],70	;cnt
	jge	$FB2611
; Line 3267
	mov	bx,WORD PTR [bp-12]	;cnt
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jg	$I2617
	jl	$L20009
	cmp	WORD PTR _aiwaypoints[bx],-1
	ja	$I2617
$L20009:
	mov	ax,WORD PTR [bp-18]	;orgnum
	mov	dx,WORD PTR [bp-16]
	cmp	WORD PTR _aiwaypoints[bx+4],ax
	jne	$I2617
	cmp	WORD PTR _aiwaypoints[bx+6],dx
	jne	$I2617
; Line 3268
	cmp	WORD PTR [bp-6],-1	;newx
	je	$JCC19753
	jmp	$I2613
$JCC19753:
	cmp	WORD PTR [bp-4],-1
	je	$JCC19762
	jmp	$I2613
$JCC19762:
; Line 3269
	mov	ax,WORD PTR [bp-10]	;newy
	mov	dx,WORD PTR [bp-8]
	mov	WORD PTR _aiwaypoints[bx+4],ax
	mov	WORD PTR _aiwaypoints[bx+6],dx
; Line 3270
	cmp	WORD PTR _aiwaypoints[bx],-2
	jne	$I2617
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jne	$I2617
; Line 3271
	inc	WORD PTR [bp-12]	;cnt
; Line 3272
; Line 3273
	jmp	SHORT $I2617
$FB2611:
; Line 3288
	mov	sp,bp
	pop	bp
	ret	

_IndirectWPCorrection	ENDP
; Line 3291
	PUBLIC	_LetWingmenContinue
_LetWingmenContinue	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	otherplane = -2
;	planenum = 4
; Line 3295
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-2],ax	;otherplane
	or	ax,ax
	jl	$I2622
; Line 3296
	mov	cx,46
	imul	cx
	mov	si,ax
	cmp	WORD PTR _bv[si],OFFSET _Formation
	jne	$I2622
; Line 3297
	mov	ax,WORD PTR _bv[bx+14]
	mov	WORD PTR _bv[si+14],ax
; Line 3298
	mov	ax,cx
	imul	WORD PTR [bp-2]	;otherplane
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _FlyWayPoint
; Line 3299
	push	WORD PTR _bv[bx+14]
	push	WORD PTR [bp-2]	;otherplane
	call	_DoNextWayPt
	add	sp,4
; Line 3300
; Line 3301
$I2622:
; Line 3303
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-2],ax	;otherplane
	or	ax,ax
	jl	$I2624
; Line 3304
	mov	cx,46
	imul	cx
	mov	si,ax
	cmp	WORD PTR _bv[si],OFFSET _Formation
	jne	$I2624
; Line 3305
	mov	ax,WORD PTR _bv[bx+14]
	mov	WORD PTR _bv[si+14],ax
; Line 3306
	mov	ax,cx
	imul	WORD PTR [bp-2]	;otherplane
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _FlyWayPoint
; Line 3307
	push	WORD PTR _bv[bx+14]
	push	WORD PTR [bp-2]	;otherplane
	call	_DoNextWayPt
	add	sp,4
; Line 3308
; Line 3309
$I2624:
; Line 3310
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_LetWingmenContinue	ENDP
; Line 3313
	PUBLIC	_ShowOurWPS
_ShowOurWPS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
;	waynum = -4
;	wayobj = -22
;	cnt = -14
;	behavenum = -20
;	formnum = -10
;	speedval = -8
;	altval = -6
;	headval = -12
;	attack = -16
;	launch = -18
;	wpflag = -2
; Line 3323
	mov	cl,3
	mov	bx,WORD PTR _OurPath
	shl	bx,cl
	mov	bx,WORD PTR _aipaths[bx+4]
	mov	WORD PTR [bp-4],bx	;waynum
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx],-1
	jne	$I2638
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jne	$I2638
	push	WORD PTR _aiwaypoints[bx+4]
	call	_GetPlaneOrgNum
	add	sp,2
	cmp	ax,WORD PTR _whichourcarr
	je	$L20104
$I2638:
	mov	bx,WORD PTR [bp-4]	;waynum
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jl	$I2641
	jg	$L20010
	cmp	WORD PTR _aiwaypoints[bx],-1
	jbe	$I2641
$L20010:
; Line 3327
	lea	ax,WORD PTR [bp-2]	;wpflag
	push	ax
	lea	ax,WORD PTR [bp-18]	;launch
	push	ax
	lea	ax,WORD PTR [bp-16]	;attack
	push	ax
	lea	ax,WORD PTR [bp-12]	;headval
	push	ax
	lea	ax,WORD PTR [bp-6]	;altval
	push	ax
	lea	ax,WORD PTR [bp-8]	;speedval
	push	ax
	lea	ax,WORD PTR [bp-10]	;formnum
	push	ax
	lea	ax,WORD PTR [bp-20]	;behavenum
	push	ax
	push	WORD PTR [bp-4]	;waynum
	call	_GetWayPointChanges
	add	sp,18
; Line 3328
	cmp	WORD PTR [bp-20],0	;behavenum
	je	$I2641
; Line 3329
$L20104:
	inc	WORD PTR [bp-4]	;waynum
; Line 3330
; Line 3331
$I2641:
; Line 3333
	mov	WORD PTR [bp-14],0	;cnt
	jmp	SHORT $F2642
$FC2643:
; Line 3334
	mov	bx,WORD PTR [bp-4]	;waynum
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx],-2
	jne	$I2645
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jne	$I2645
; Line 3335
	inc	WORD PTR [bp-4]	;waynum
; Line 3336
$I2645:
	inc	WORD PTR [bp-4]	;waynum
; Line 3337
	inc	WORD PTR [bp-14]	;cnt
$F2642:
	mov	ax,WORD PTR _NextWayPoint
	dec	ax
	cmp	ax,WORD PTR [bp-14]	;cnt
	jg	$FC2643
; Line 3339
	mov	cl,3
	mov	bx,WORD PTR _OurPath
	shl	bx,cl
	mov	ax,WORD PTR _aipaths[bx+4]
	add	ax,WORD PTR _aipaths[bx+6]
	cmp	ax,WORD PTR [bp-4]	;waynum
	ja	$I2646
; Line 3340
	dec	ax
	mov	WORD PTR [bp-4],ax	;waynum
; Line 3341
; Line 3343
$I2646:
	lea	ax,WORD PTR [bp-2]	;wpflag
	push	ax
	lea	ax,WORD PTR [bp-18]	;launch
	push	ax
	lea	ax,WORD PTR [bp-16]	;attack
	push	ax
	lea	ax,WORD PTR [bp-12]	;headval
	push	ax
	lea	ax,WORD PTR [bp-6]	;altval
	push	ax
	lea	ax,WORD PTR [bp-8]	;speedval
	push	ax
	lea	ax,WORD PTR [bp-10]	;formnum
	push	ax
	lea	ax,WORD PTR [bp-20]	;behavenum
	push	ax
	push	WORD PTR [bp-4]	;waynum
	call	_GetWayPointChanges
	add	sp,18
; Line 3345
	mov	ax,OFFSET DGROUP:$SG2647
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 3347
	cmp	WORD PTR _NextWayPoint,0
	jne	$I2648
; Line 3348
	test	BYTE PTR _landingstatus,1
	je	$I2649
; Line 3349
	mov	ax,OFFSET DGROUP:$SG2650
	jmp	$L20103
	nop	
$I2649:
; Line 3351
	mov	ax,OFFSET DGROUP:$SG2652
	jmp	$L20103
$I2648:
	cmp	WORD PTR [bp-20],0	;behavenum
	jne	$I2654
; Line 3354
	mov	ax,OFFSET DGROUP:$SG2655
	jmp	$L20103
$I2654:
	mov	bx,WORD PTR [bp-4]	;waynum
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx+2],0
	jl	$I2657
; Line 3357
	mov	ax,OFFSET DGROUP:$SG2658
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 3358
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	push	WORD PTR _NextWayPoint
	call	_itoa
	add	sp,6
	jmp	$L20103
	nop	
$I2657:
; Line 3361
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	push	WORD PTR _NextWayPoint
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 3362
	mov	bx,WORD PTR [bp-4]	;waynum
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx],-2
	jne	$I2660
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jne	$I2660
; Line 3363
	mov	ax,OFFSET DGROUP:$SG2661
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 3364
$I2660:
	mov	bx,WORD PTR [bp-4]	;waynum
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	push	WORD PTR _aiwaypoints[bx+4]
	call	_GetPlaneOrgNum
	add	sp,2
	mov	WORD PTR [bp-22],ax	;wayobj
; Line 3365
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-22],ax	;wayobj
	jge	$I2662
; Line 3366
	mov	ax,OFFSET DGROUP:$SG2663
	jmp	SHORT $L20103
	nop	
$I2662:
	cmp	WORD PTR [bp-22],70	;wayobj
	jne	$I2665
; Line 3369
	mov	ax,OFFSET DGROUP:$SG2666
	jmp	SHORT $L20103
	nop	
$I2665:
	cmp	WORD PTR [bp-22],-1	;wayobj
	jne	$I2668
; Line 3372
	mov	ax,OFFSET DGROUP:$SG2669
	jmp	SHORT $L20103
	nop	
$I2668:
	mov	ax,WORD PTR [bp-22]	;wayobj
	cmp	WORD PTR _whichourcarr,ax
	jne	$I2671
; Line 3375
	mov	ax,OFFSET DGROUP:$SG2672
	jmp	SHORT $L20103
$I2671:
; Line 3378
	mov	ax,OFFSET DGROUP:$SG2674
$L20103:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 3379
; Line 3380
; Line 3382
	mov	ax,5
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
; Line 3383
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ShowOurWPS	ENDP
; Line 3386
	PUBLIC	_GetDAltSpeed
_GetDAltSpeed	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	alteffect = -4
;	alt = 4
; Line 3390
	cmp	WORD PTR [bp+4],2500	;alt
	jbe	$I2678
; Line 3391
	mov	ax,1000
	cwd	
	push	dx
	push	ax
	les	bx,DWORD PTR _ptype
	mov	ax,WORD PTR es:[bx+10]
	cwd	
	push	dx
	push	ax
	mov	ax,25
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp+4]	;alt
	sub	dx,dx
	sub	ax,2500
	sbb	dx,dx
	push	dx
	push	ax
	call	__aNldiv
	add	ax,100
	adc	dx,0
$L20105:
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
; Line 3392
	mov	sp,bp
	pop	bp
	ret	
$I2678:
	cmp	WORD PTR [bp+4],1250	;alt
	jbe	$I2680
; Line 3395
	mov	ax,500
	cwd	
	push	dx
	push	ax
	mov	ax,25
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp+4]	;alt
	sub	dx,dx
	sub	ax,1250
	sbb	dx,dx
	push	dx
	push	ax
	call	__aNldiv
	push	dx
	push	ax
	les	bx,DWORD PTR _ptype
	mov	ax,WORD PTR es:[bx+10]
	cwd	
	jmp	SHORT $L20105
; Line 3397
; Line 3403
	nop	
$I2680:
	sub	ax,ax
; Line 3404
	mov	sp,bp
	pop	bp
	ret	

_GetDAltSpeed	ENDP
; Line 3407
	PUBLIC	_CheckTurnStuff
_CheckTurnStuff	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,66
	call	__aNchkstk
	push	di
	push	si
;	tempspd = -42
;	i = -40
;	maxspeed = -34
;	wingkludge = -2
;	spd = -32
;	MinSpdG = -26
;	GAngle = -66
;	planeG = -36
;	tempg = -44
;	tdroll = -4
;	cnt = -28
;	altspd = -38
;	planenum = 4
; Line 3413
	mov	ax,150
	mov	WORD PTR [bp-26],ax	;MinSpdG
	mov	WORD PTR [bp-24],ax
	mov	WORD PTR [bp-22],225
	mov	WORD PTR [bp-20],250
	mov	WORD PTR [bp-18],275
	mov	WORD PTR [bp-16],300
	mov	WORD PTR [bp-14],325
	mov	WORD PTR [bp-12],350
	mov	ax,5000
	mov	WORD PTR [bp-10],ax
	mov	WORD PTR [bp-8],ax
	mov	WORD PTR [bp-6],ax
; Line 3414
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;wingkludge
	mov	WORD PTR [bp-66],ax	;GAngle
	mov	WORD PTR [bp-64],ax
	mov	WORD PTR [bp-62],10920
	mov	WORD PTR [bp-60],12836
	mov	WORD PTR [bp-58],13745
	mov	WORD PTR [bp-56],14280
	mov	WORD PTR [bp-54],14633
	mov	WORD PTR [bp-52],14885
	mov	WORD PTR [bp-50],15073
	mov	WORD PTR [bp-48],15218
	mov	WORD PTR [bp-46],15335
; Line 3417
	mov	ax,WORD PTR [bp+4]	;planenum
	mov	WORD PTR [bp-40],ax	;i
; Line 3419
	mov	cx,40
	imul	cx
	mov	bx,ax
	test	WORD PTR _ps[bx+24],4640
	je	$JCC20781
	jmp	$I2714
$JCC20781:
; Line 3422
	push	WORD PTR [bp+4]	;planenum
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR [bp+4]	;planenum
	je	$I2696
; Line 3423
	mov	WORD PTR [bp-2],-20	;wingkludge
; Line 3425
$I2696:
; Line 3426
	mov	ax,100
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+20]
	call	_cosX
	add	sp,4
	push	ax
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-44],ax	;tempg
	or	ax,ax
	je	$I2697
; Line 3427
	mov	cx,ax
	mov	ax,100
	cwd	
	idiv	cx
	mov	WORD PTR [bp-36],ax	;planeG
; Line 3428
	cmp	ax,9
	jle	$I2699
$I2697:
; Line 3432
	mov	WORD PTR [bp-36],9	;planeG
$I2699:
; Line 3434
	les	bx,DWORD PTR _ptype
	mov	ax,WORD PTR es:[bx+10]
	mov	WORD PTR [bp-34],ax	;maxspeed
; Line 3436
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],64
	je	$I2700
; Line 3437
	sar	cx,1
	mov	WORD PTR [bp-34],cx	;maxspeed
; Line 3439
$I2700:
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	je	$I2702
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],4
	je	$I2704
$I2702:
; Line 3440
	cmp	cx,500
	jle	$I2704
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+40],14000
	jg	$I2704
; Line 3442
	sub	WORD PTR [bp-34],200	;maxspeed
	cmp	WORD PTR [bp-34],450	;maxspeed
	jge	$I2704
; Line 3443
	mov	WORD PTR [bp-34],450	;maxspeed
; Line 3444
$I2704:
; Line 3445
; Line 3447
	cmp	WORD PTR [bp-36],2	;planeG
	jl	$JCC20968
	jmp	$I2705
$JCC20968:
; Line 3448
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	si,WORD PTR [bp-36]	;planeG
	shl	si,1
	mov	ax,WORD PTR [bp-26][si]
	add	ax,WORD PTR [bp-2]	;wingkludge
	cmp	ax,WORD PTR _ps[bx+26]
	jg	$JCC20996
	jmp	$I2706
$JCC20996:
; Line 3449
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	mov	ax,WORD PTR [bp-34]	;maxspeed
	cmp	WORD PTR _bv[si+18],ax
	jl	$JCC21018
	jmp	$I2707
$JCC21018:
; Line 3451
	push	WORD PTR _ps[bx+6]
	mov	si,cx
	mov	di,bx
	call	_GetDAltSpeed
	add	sp,2
	mov	WORD PTR [bp-38],ax	;altspd
	add	si,ax
	mov	WORD PTR [bp-42],si	;tempspd
; Line 3452
	cmp	WORD PTR _ps[di+18],0
	jle	$I2708
; Line 3453
	mov	ax,WORD PTR _ps[di+18]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,-32768
	neg	ax
	sub	dx,dx
	push	dx
	push	ax
	mov	ax,si
	cwd	
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
	mov	WORD PTR [bp-32],ax	;spd
	mov	WORD PTR [bp-30],dx
; Line 3454
	shl	si,1
	sub	si,ax
	mov	WORD PTR [bp-42],si	;tempspd
; Line 3455
; Line 3456
$I2708:
	push	si
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+20]
	call	_sinX
	add	sp,4
	push	ax
	call	_abs
	add	sp,2
	sar	ax,1
	add	WORD PTR [bp-42],ax	;tempspd
; Line 3458
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp-42]	;tempspd
	cmp	WORD PTR _bv[bx+18],ax
	jge	$I2709
; Line 3459
	mov	WORD PTR _bv[bx+18],ax
; Line 3460
$I2709:
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp-34]	;maxspeed
	cmp	WORD PTR _bv[bx+18],ax
	jg	$JCC21196
	jmp	$I2714
$JCC21196:
; Line 3462
; Line 3463
$I2707:
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	mov	WORD PTR _bv[bx+18],ax
; Line 3464
	cmp	WORD PTR _pdest,-4096
	jg	$JCC21227
	jmp	$I2714
$JCC21227:
; Line 3465
	mov	WORD PTR _pdest,-4096
; Line 3466
; Line 3467
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
$I2706:
; Line 3468
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp-34]	;maxspeed
	cmp	WORD PTR _bv[bx+18],ax
	jg	$JCC21259
	jmp	$I2714
$JCC21259:
; Line 3469
	mov	si,WORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	sub	ax,WORD PTR [bp-2]	;wingkludge
	mov	WORD PTR _bv[bx+18],ax
; Line 3470
; Line 3471
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 3472
; Line 3474
	nop	
$I2705:
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	si,WORD PTR [bp-36]	;planeG
	shl	si,1
	mov	ax,WORD PTR [bp-26][si]
	cmp	WORD PTR _ps[bx+26],ax
	jl	$JCC21306
	jmp	$I2714
$JCC21306:
; Line 3475
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	si,ax
	mov	ax,WORD PTR [bp-34]	;maxspeed
	cmp	WORD PTR _bv[si+18],ax
	jl	$JCC21328
	jmp	$I2715
$JCC21328:
	cmp	WORD PTR _ps[bx+6],1250
	jl	$JCC21339
	jmp	$I2715
$JCC21339:
; Line 3477
	push	WORD PTR _ps[bx+6]
	mov	si,cx
	mov	di,bx
	call	_GetDAltSpeed
	add	sp,2
	mov	WORD PTR [bp-38],ax	;altspd
	add	si,ax
	mov	WORD PTR [bp-42],si	;tempspd
; Line 3478
	cmp	WORD PTR _ps[di+18],0
	jle	$I2716
; Line 3479
	mov	ax,WORD PTR _ps[di+18]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,-32768
	neg	ax
	sub	dx,dx
	push	dx
	push	ax
	mov	ax,si
	cwd	
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
	mov	WORD PTR [bp-32],ax	;spd
	mov	WORD PTR [bp-30],dx
; Line 3480
	shl	si,1
	sub	si,ax
	mov	WORD PTR [bp-42],si	;tempspd
; Line 3481
; Line 3482
$I2716:
	push	si
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+20]
	call	_sinX
	add	sp,4
	push	ax
	call	_abs
	add	sp,2
	sar	ax,1
	add	WORD PTR [bp-42],ax	;tempspd
; Line 3484
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp-42]	;tempspd
	cmp	WORD PTR _bv[bx+18],ax
	jge	$I2717
; Line 3485
	mov	WORD PTR _bv[bx+18],ax
; Line 3486
$I2717:
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp-34]	;maxspeed
	cmp	WORD PTR _bv[bx+18],ax
	jle	$I2714
; Line 3487
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	mov	WORD PTR _bv[bx+18],ax
$I2715:
	cmp	WORD PTR _pdest,-4096
	jle	$I2722
; Line 3496
	mov	WORD PTR _pdest,-4096
; Line 3498
$I2722:
; Line 3499
	sub	ax,ax
	mov	WORD PTR [bp-4],ax	;tdroll
	mov	WORD PTR [bp-28],ax	;cnt
	jmp	SHORT $F2723
	nop	
$FC2724:
; Line 3500
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	si,WORD PTR [bp-36]	;planeG
	shl	si,1
	mov	ax,WORD PTR [bp-26][si]
	cmp	WORD PTR _ps[bx+26],ax
	jl	$L20106
; Line 3501
	mov	ax,WORD PTR [bp-28]	;cnt
	mov	WORD PTR [bp-4],ax	;tdroll
; Line 3502
$L20106:
	inc	WORD PTR [bp-28]	;cnt
$F2723:
	cmp	WORD PTR [bp-28],10	;cnt
	jl	$FC2724
; Line 3503
	mov	si,WORD PTR [bp-4]	;tdroll
	shl	si,1
	mov	ax,WORD PTR [bp-66][si]
	mov	WORD PTR [bp-4],ax	;tdroll
; Line 3504
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _ps[bx+20],0
	jge	$I2727
; Line 3505
	neg	WORD PTR [bp-4]	;tdroll
; Line 3506
$I2727:
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp-4]	;tdroll
	sub	ax,WORD PTR _ps[bx+20]
	mov	WORD PTR _droll,ax
; Line 3507
; Line 3509
$I2714:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_CheckTurnStuff	ENDP
; Line 3513
	PUBLIC	_AICarrierLand
_AICarrierLand	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,102
	call	__aNchkstk
	push	di
	push	si
;	usedlpatstart = -2
;	V = -40
;	M = -82
;	TM = -26
;	H = -46
;	landpnt = -8
;	i = -48
;	dx = -60
;	dy = -64
;	dx2 = -90
;	dy2 = -98
;	dx3 = -94
;	dy3 = -6
;	dz = -86
;	rearhead = -56
;	ptdist = -44
;	ptdistl = -32
;	tempalt = -42
;	ptangle = -54
;	landangle = -34
;	droll1 = -84
;	otherplane = -28
;	whichcarr = -52
;	usedlpattern = -50
; Line 3536
	cmp	WORD PTR _Night,0
	jne	$I2753
	cmp	WORD PTR _MissionWeather,2
	je	$I2753
; Line 3537
	mov	ax,OFFSET _LandPat
	jmp	SHORT $L20108
$I2753:
; Line 3539
	mov	ax,OFFSET _NiteLandPat
$L20108:
	mov	WORD PTR [bp-2],ax	;usedlpatstart
	mov	WORD PTR [bp-50],ax	;usedlpattern
; Line 3540
; Line 3543
	mov	ax,WORD PTR _ConfigData+22
	mov	WORD PTR [bp-52],ax	;whichcarr
	cmp	ax,2
	jg	$I2756
	or	ax,ax
	jge	$I2755
$I2756:
; Line 3544
	mov	WORD PTR [bp-52],0	;whichcarr
; Line 3546
$I2755:
; Line 3548
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR [bp-48],ax	;i
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+38]
	mov	WORD PTR [bp-8],ax	;landpnt
; Line 3549
	cmp	ax,20
	jg	$JCC21728
	jmp	$I2757
$JCC21728:
; Line 3550
	push	WORD PTR [bp-48]	;i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I2762
; Line 3551
	test	BYTE PTR _landingstatus,3
	je	$I2762
; Line 3552
	cmp	WORD PTR _whichourcarr,0
	jl	$I2762
; Line 3553
	mov	ax,40
	imul	WORD PTR _whichourcarr
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2762
	test	cl,2
	je	$I2762
; Line 3554
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR _Px
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,1800
	jl	$I2762
	mov	ax,40
	imul	WORD PTR _whichourcarr
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR _Py
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,1800
	jl	$I2762
; Line 3555
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	and	WORD PTR _ps[bx+24],-517
; Line 3556
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 3557
; Line 3558
$I2762:
; Line 3559
; Line 3560
; Line 3561
; Line 3563
	mov	ax,-1792
	mov	dx,21
	push	dx
	push	ax
	mov	es,WORD PTR $T20007
	mov	cx,WORD PTR es:_carrier+12
	add	ch,128
	mov	WORD PTR [bp-56],cx	;rearhead
	push	cx
	call	_sinXL
	add	sp,6
	mov	es,WORD PTR $T20007
	add	ax,WORD PTR es:_carrier
	adc	dx,WORD PTR es:_carrier+2
	mov	WORD PTR [bp-60],ax	;dx
	mov	WORD PTR [bp-58],dx
; Line 3564
	mov	ax,-1792
	mov	dx,21
	push	dx
	push	ax
	push	WORD PTR [bp-56]	;rearhead
	call	_cosXL
	add	sp,6
	mov	es,WORD PTR $T20007
	mov	cx,WORD PTR es:_carrier+8
	mov	bx,WORD PTR es:_carrier+10
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR [bp-64],cx	;dy
	mov	WORD PTR [bp-62],bx
; Line 3565
	cmp	WORD PTR [bp-8],100	;landpnt
	jle	$I2763
; Line 3566
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],250
; Line 3567
	push	WORD PTR [bp-56]	;rearhead
	push	WORD PTR [bp-62]
	push	WORD PTR [bp-64]	;dy
	push	WORD PTR [bp-58]
	push	WORD PTR [bp-60]	;dx
	call	_DoLandWait
	add	sp,10
; Line 3568
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 3569
; Line 3570
	nop	
$I2763:
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+18],400
	jge	$I2764
; Line 3571
	mov	WORD PTR _bv[bx+18],400
; Line 3572
$I2764:
	mov	cl,3
	mov	bx,WORD PTR _planecnt
	shl	bx,cl
	mov	ax,WORD PTR _ailoc[bx]
	mov	dx,WORD PTR _ailoc[bx+2]
	sub	ax,WORD PTR [bp-60]	;dx
	sbb	dx,WORD PTR [bp-58]
	mov	WORD PTR [bp-90],ax	;dx2
	mov	WORD PTR [bp-88],dx
; Line 3573
	mov	cx,WORD PTR _ailoc[bx+4]
	mov	si,WORD PTR _ailoc[bx+6]
	sub	cx,WORD PTR [bp-64]	;dy
	sbb	si,WORD PTR [bp-62]
	mov	WORD PTR [bp-98],cx	;dy2
	mov	WORD PTR [bp-96],si
; Line 3575
	mov	bx,100
	sub	di,di
	push	di
	push	bx
	push	si
	push	cx
	push	dx
	push	ax
	call	_LDist2D
	add	sp,8
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
	mov	WORD PTR [bp-44],ax	;ptdist
	cmp	ax,20
	jl	$JCC22121
	jmp	$I2769
$JCC22121:
; Line 3576
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	WORD PTR _bv[bx+38],20
; Line 3577
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-28],ax	;otherplane
; Line 3578
	or	ax,ax
	jl	$I2767
; Line 3579
	mov	cx,46
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	je	$I2767
	mov	ax,40
	imul	WORD PTR [bp-28]	;otherplane
	mov	si,ax
	mov	ax,WORD PTR _ps[si+24]
	mov	cx,ax
	test	al,1
	je	$I2767
	test	cl,2
	je	$I2767
	test	cl,32
	jne	$I2767
; Line 3580
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 3581
	mov	ax,40
	imul	WORD PTR [bp-28]	;otherplane
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 3582
	and	BYTE PTR _ps[bx+25],237
; Line 3583
; Line 3584
$I2767:
; Line 3586
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-28],ax	;otherplane
	or	ax,ax
	jl	$I2769
; Line 3587
	mov	cx,46
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	je	$I2769
	mov	ax,40
	imul	WORD PTR [bp-28]	;otherplane
	mov	si,ax
	mov	ax,WORD PTR _ps[si+24]
	mov	cx,ax
	test	al,1
	je	$I2769
	test	cl,2
	je	$I2769
	test	cl,32
	jne	$I2769
; Line 3588
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 3589
	mov	ax,40
	imul	WORD PTR [bp-28]	;otherplane
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 3590
	and	BYTE PTR _ps[bx+25],237
; Line 3591
; Line 3592
$I2769:
; Line 3593
; Line 3595
	sub	ax,ax
	push	ax
	mov	ax,-1
	push	ax
	mov	ax,1250
	mov	WORD PTR [bp-42],ax	;tempalt
	push	ax
	push	WORD PTR [bp-62]
	push	WORD PTR [bp-64]	;dy
	push	WORD PTR [bp-58]
	push	WORD PTR [bp-60]	;dx
	call	_LFlyTo
	add	sp,14
; Line 3596
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
$I2757:
; Line 3599
	or	ax,ax
	jge	$I2771
; Line 3600
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20007
	push	WORD PTR es:_carrier+130
	push	WORD PTR es:_carrier+128
	call	__aNldiv
	mov	WORD PTR [bp-40],ax	;V
; Line 3601
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20007
	push	WORD PTR es:_carrier+22
	push	WORD PTR es:_carrier+20
	call	__aNldiv
	inc	ax
	inc	ax
	mov	WORD PTR [bp-38],ax
; Line 3602
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20007
	push	WORD PTR es:_carrier+134
	push	WORD PTR es:_carrier+132
	call	__aNldiv
	mov	WORD PTR [bp-36],ax
; Line 3604
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	si,WORD PTR [bp-2]	;usedlpatstart
	jmp	$L20109
	nop	
	nop	
	nop	
$I2771:
; Line 3607
	cmp	WORD PTR _Night,0
	jne	$I2774
	cmp	WORD PTR _MissionWeather,2
	jne	$I2773
$I2774:
	cmp	ax,4
	jle	$I2773
; Line 3608
	mov	ax,cx
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,4
	mov	WORD PTR _bv[bx+38],ax
	mov	WORD PTR [bp-8],ax	;landpnt
; Line 3609
$I2773:
; Line 3614
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20007
	push	WORD PTR es:_carrier+130
	push	WORD PTR es:_carrier+128
	call	__aNldiv
	mov	cx,ax
	mov	ax,24
	mov	bx,dx
	imul	WORD PTR [bp-8]	;landpnt
	mov	si,ax
	add	si,WORD PTR [bp-2]	;usedlpatstart
	mov	WORD PTR [bp-50],si	;usedlpattern
	add	cx,WORD PTR [si]
	mov	WORD PTR [bp-40],cx	;V
; Line 3615
	mov	ax,WORD PTR [si+4]
	mov	WORD PTR [bp-38],ax
; Line 3616
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20007
	push	WORD PTR es:_carrier+134
	push	WORD PTR es:_carrier+132
	call	__aNldiv
	add	ax,WORD PTR [si+2]
	mov	WORD PTR [bp-36],ax
; Line 3617
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
$L20109:
	mov	ax,WORD PTR [si+12]
	mov	WORD PTR _bv[bx+18],ax
; Line 3618
; Line 3619
; Line 3622
	lea	ax,WORD PTR [bp-82]	;M
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	mov	es,WORD PTR $T20007
	mov	cx,WORD PTR es:_carrier+12
	mov	WORD PTR [bp-46],cx	;H
	push	cx
	call	_MakeMatHPR
	add	sp,8
; Line 3623
	lea	ax,WORD PTR [bp-82]	;M
	push	ax
	lea	ax,WORD PTR [bp-40]	;V
	push	ax
	call	_Rotate
	add	sp,4
; Line 3625
	mov	ax,100
	imul	WORD PTR [bp-36]
	mov	es,WORD PTR $T20007
	add	ax,WORD PTR es:_carrier+8
	adc	dx,WORD PTR es:_carrier+10
	mov	WORD PTR [bp-64],ax	;dy
	mov	WORD PTR [bp-62],dx
; Line 3626
	mov	cx,WORD PTR [bp-38]
	sar	cx,1
	sar	cx,1
	mov	WORD PTR [bp-42],cx	;tempalt
; Line 3627
	mov	cx,ax
	mov	WORD PTR [bp-102],ax
	mov	WORD PTR [bp-100],dx
	mov	ax,100
	imul	WORD PTR [bp-40]	;V
	add	ax,WORD PTR es:_carrier
	adc	dx,WORD PTR es:_carrier+2
	mov	WORD PTR [bp-60],ax	;dx
	mov	WORD PTR [bp-58],dx
	mov	cl,3
	mov	bx,WORD PTR _planecnt
	shl	bx,cl
	sub	ax,WORD PTR _ailoc[bx]
	sbb	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-90],ax	;dx2
	mov	WORD PTR [bp-88],dx
; Line 3628
	mov	cx,WORD PTR [bp-102]
	mov	si,WORD PTR [bp-100]
	sub	cx,WORD PTR _ailoc[bx+4]
	sbb	si,WORD PTR _ailoc[bx+6]
	mov	WORD PTR [bp-98],cx	;dy2
	mov	WORD PTR [bp-96],si
; Line 3629
	push	si
	push	cx
	push	dx
	push	ax
	call	_LDist2D
	add	sp,8
	mov	WORD PTR [bp-32],ax	;ptdistl
	mov	WORD PTR [bp-30],dx
; Line 3630
	mov	ax,WORD PTR [bp-98]	;dy2
	mov	dx,WORD PTR [bp-96]
	neg	ax
	adc	dx,0
	neg	dx
	push	dx
	push	ax
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;dx2
	call	_Langle
	add	sp,8
	mov	WORD PTR [bp-54],ax	;ptangle
; Line 3632
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	sub	WORD PTR [bp-54],ax	;ptangle
	mov	ax,WORD PTR [bp-54]	;ptangle
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,4096
	jge	$I2777
; Line 3633
	mov	ax,WORD PTR [bp-54]	;ptangle
	shl	ax,1
	shl	ax,1
	mov	WORD PTR [bp-54],ax	;ptangle
; Line 3634
	jmp	SHORT $I2780
$I2777:
	cmp	WORD PTR [bp-54],0	;ptangle
	jge	$I2779
; Line 3635
	mov	WORD PTR [bp-54],-16384	;ptangle
; Line 3636
	jmp	SHORT $I2780
	nop	
$I2779:
; Line 3637
	mov	WORD PTR [bp-54],16384	;ptangle
$I2780:
; Line 3639
	cmp	WORD PTR [bp-8],10	;landpnt
	jge	$I2781
; Line 3640
	or	BYTE PTR _landingstatus,64
; Line 3642
$I2781:
	cmp	WORD PTR [bp-8],-1	;landpnt
	jle	$JCC22852
	jmp	$I2782
$JCC22852:
; Line 3643
	cmp	WORD PTR [bp-8],-2	;landpnt
	je	$JCC22861
	jmp	$I2783
$JCC22861:
; Line 3648
	mov	WORD PTR [bp-40],-13	;V
; Line 3649
	mov	bx,WORD PTR [bp-2]	;usedlpatstart
	mov	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-38],ax
; Line 3650
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20007
	push	WORD PTR es:_carrier+134
	push	WORD PTR es:_carrier+132
	call	__aNldiv
	mov	bx,WORD PTR [bp-2]	;usedlpatstart
	sub	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-36],ax
; Line 3651
	lea	ax,WORD PTR [bp-82]	;M
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	push	WORD PTR [bp-46]	;H
	call	_MakeMatHPR
	add	sp,8
; Line 3652
	lea	ax,WORD PTR [bp-82]	;M
	push	ax
	lea	ax,WORD PTR [bp-40]	;V
	push	ax
	call	_Rotate
	add	sp,4
; Line 3654
	mov	ax,100
	imul	WORD PTR [bp-36]
	mov	es,WORD PTR $T20007
	add	ax,WORD PTR es:_carrier+8
	adc	dx,WORD PTR es:_carrier+10
	mov	WORD PTR [bp-6],ax	;dy3
	mov	WORD PTR [bp-4],dx
; Line 3655
	mov	cl,3
	mov	bx,WORD PTR _planecnt
	shl	bx,cl
	mov	si,WORD PTR _ailoc[bx+4]
	mov	di,WORD PTR _ailoc[bx+6]
	sub	si,ax
	sbb	di,dx
	push	di
	push	si
	mov	ax,100
	imul	WORD PTR [bp-40]	;V
	add	ax,WORD PTR es:_carrier
	adc	dx,WORD PTR es:_carrier+2
	mov	WORD PTR [bp-94],ax	;dx3
	mov	WORD PTR [bp-92],dx
	sub	ax,WORD PTR _ailoc[bx]
	sbb	dx,WORD PTR _ailoc[bx+2]
	push	dx
	push	ax
	call	_Langle
	add	sp,8
	mov	WORD PTR [bp-34],ax	;landangle
; Line 3656
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-34]	;landangle
	mov	WORD PTR _ps[bx+16],ax
; Line 3659
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	si,ax
	sub	ax,ax
	mov	WORD PTR _bv[si+18],ax
	mov	WORD PTR _pdest,ax
	mov	WORD PTR _droll,ax
; Line 3660
	mov	ax,WORD PTR [bp-42]	;tempalt
	mov	WORD PTR _ps[bx+6],ax
; Line 3661
	cmp	WORD PTR _ps[bx+26],0
	je	$JCC23081
	jmp	$I2805
$JCC23081:
; Line 3662
	mov	es,WORD PTR $T20007
	mov	ax,WORD PTR es:_carrier
	mov	dx,WORD PTR es:_carrier+2
	mov	cl,3
	mov	si,WORD PTR _planecnt
	shl	si,cl
	sub	WORD PTR _ailoc[si],ax
	sbb	WORD PTR _ailoc[si+2],dx
; Line 3663
	mov	ax,WORD PTR es:_carrier+8
	mov	dx,WORD PTR es:_carrier+10
	sub	WORD PTR _ailoc[si+4],ax
	sbb	WORD PTR _ailoc[si+6],dx
; Line 3664
	or	BYTE PTR _ps[bx+24],128
; Line 3666
	mov	ax,WORD PTR [bp-52]	;whichcarr
	dec	ax
	je	$SC2789
	dec	ax
	je	$SC2790
; Line 3667
$SC2789:
; Line 3668
	mov	ax,1
	push	ax
	mov	cx,3
	push	cx
	mov	cx,2
$L20110:
	push	cx
	sub	cx,cx
	push	cx
	push	ax
	call	_GetWhichElevator
	add	sp,10
	sub	ax,-6
	neg	ax
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	WORD PTR _bv[bx+38],cx
; Line 3677
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _Gtime
	add	ax,5
	mov	WORD PTR _bv[bx+22],ax
; Line 3678
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
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
	mov	ax,33
	push	ax
	call	_LogIt
	add	sp,24
; Line 3679
	call	_LetNextPlaneLand
; Line 3680
	call	_GetPlaneLanding
; Line 3681
; Line 3682
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 3670
$SC2790:
; Line 3671
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	cx,3
	jmp	$L20110
; Line 3673
$I2783:
	cmp	WORD PTR [bp-8],-3	;landpnt
	jg	$I2793
; Line 3685
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	push	WORD PTR _bv[bx+38]
	push	WORD PTR _planecnt
	call	_MoveAIToElevator
	add	sp,4
; Line 3686
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],128
; Line 3687
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 3688
; Line 3689
	nop	
$I2793:
	cmp	WORD PTR [bp-30],0
	jl	$I2795
	jg	$L20011
	cmp	WORD PTR [bp-32],1000	;ptdistl
	jb	$I2795
$L20011:
	cmp	WORD PTR [bp-30],0
	jg	$I2794
	jl	$L20012
	cmp	WORD PTR [bp-32],8000	;ptdistl
	jae	$I2794
$L20012:
	push	WORD PTR [bp-54]	;ptangle
	call	_abs
	add	sp,2
	cmp	ax,12288
	jle	$I2794
$I2795:
; Line 3690
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	dec	WORD PTR _bv[bx+38]
; Line 3692
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	si,ax
	mov	ax,WORD PTR [bp-42]	;tempalt
	mov	WORD PTR _ps[si+6],ax
; Line 3694
	sub	ax,ax
	mov	WORD PTR _bv[bx+18],ax
	mov	WORD PTR _pdest,ax
	mov	WORD PTR _droll,ax
; Line 3695
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 3696
; Line 3697
	nop	
$I2794:
	mov	ax,WORD PTR [bp-54]	;ptangle
	jmp	SHORT $L20111
	nop	
$I2782:
; Line 3700
	cmp	WORD PTR [bp-30],0
	jl	$I2798
	jg	$L20013
	cmp	WORD PTR [bp-32],12000	;ptdistl
	jb	$I2798
$L20013:
	cmp	WORD PTR [bp-30],0
	jg	$I2801
	jl	$L20014
	cmp	WORD PTR [bp-32],25000	;ptdistl
	jae	$I2801
$L20014:
	push	WORD PTR [bp-54]	;ptangle
	call	_abs
	add	sp,2
	cmp	ax,12288
	jle	$I2801
$I2798:
; Line 3702
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	dec	WORD PTR _bv[bx+38]
	cmp	WORD PTR _bv[bx+38],19
	je	$I2800
	cmp	WORD PTR _bv[bx+38],10
	jne	$I2801
$I2800:
; Line 3703
	mov	ax,WORD PTR _planelanding
	cmp	WORD PTR _planecnt,ax
	jne	$I2801
; Line 3704
	call	_LetNextPlaneLand
; Line 3705
$I2801:
; Line 3708
; Line 3709
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-54]	;ptangle
	sub	ax,WORD PTR _ps[bx+20]
$L20111:
	mov	WORD PTR _droll,ax
; Line 3710
; Line 3714
	mov	WORD PTR [bp-84],ax	;droll1
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,8192
	jge	$I2802
; Line 3715
	mov	cl,2
	shl	WORD PTR _droll,cl
; Line 3717
$I2802:
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-30]
	push	WORD PTR [bp-32]	;ptdistl
	call	__aNldiv
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-42]	;tempalt
	sub	ax,WORD PTR _ps[bx+6]
	cwd	
	push	dx
	push	ax
	call	_Langle
	add	sp,8
	mov	WORD PTR _pdest,ax
; Line 3718
	cmp	WORD PTR [bp-8],0	;landpnt
	je	$I2804
	cmp	WORD PTR [bp-8],-1	;landpnt
	jne	$I2805
$I2804:
; Line 3719
	cmp	ax,-546
	jle	$I2805
	or	ax,ax
	jge	$I2805
; Line 3720
	mov	WORD PTR _pdest,0
; Line 3721
; Line 3722
$I2805:
; Line 3723
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AICarrierLand	ENDP
; Line 3726
	PUBLIC	_MoveAIToElevator
_MoveAIToElevator	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,60
	call	__aNchkstk
	push	si
;	elevindx = -60
;	xval = -52
;	yval = -56
;	tx = -54
;	ty = -58
;	elevX = -24
;	elevY = -48
;	whichcarr = -50
;	elevator = 6
;	planenum = 4
; Line 3731
	mov	ax,25
	mov	WORD PTR [bp-24],ax	;elevX
	mov	WORD PTR [bp-22],ax
	mov	WORD PTR [bp-20],ax
	mov	WORD PTR [bp-16],ax
	mov	WORD PTR [bp-14],ax
	mov	WORD PTR [bp-12],ax
	mov	WORD PTR [bp-8],ax
	mov	WORD PTR [bp-6],ax
	mov	WORD PTR [bp-4],ax
	mov	ax,-27
	mov	WORD PTR [bp-18],ax
	mov	WORD PTR [bp-10],ax
	mov	WORD PTR [bp-2],ax
; Line 3732
	mov	WORD PTR [bp-48],-28	;elevY
	mov	WORD PTR [bp-46],7
	mov	WORD PTR [bp-44],76
	mov	WORD PTR [bp-42],77
; Line 3733
	mov	WORD PTR [bp-40],-17
	mov	WORD PTR [bp-38],21
	mov	WORD PTR [bp-36],82
	mov	WORD PTR [bp-34],89
; Line 3734
	mov	WORD PTR [bp-32],-13
	mov	WORD PTR [bp-30],35
	mov	WORD PTR [bp-28],69
	mov	WORD PTR [bp-26],-33
; Line 3739
	mov	ax,WORD PTR _ConfigData+22
	mov	WORD PTR [bp-50],ax	;whichcarr
; Line 3740
	cmp	ax,2
	jg	$I2818
	or	ax,ax
	jge	$I2817
$I2818:
; Line 3741
	mov	WORD PTR [bp-50],0	;whichcarr
; Line 3743
$I2817:
; Line 3744
	push	WORD PTR [bp+6]	;elevator
	call	_abs
	add	sp,2
	sub	ax,6
	mov	WORD PTR [bp-60],ax	;elevindx
	or	ax,ax
	jl	$I2820
	cmp	ax,3
	jle	$I2819
$I2820:
; Line 3745
	mov	WORD PTR [bp-60],1	;elevindx
; Line 3747
$I2819:
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _bv[bx+22],ax
	jle	$JCC23813
	jmp	$I2838
$JCC23813:
; Line 3750
	mov	si,WORD PTR [bp-50]	;whichcarr
	shl	si,1
	shl	si,1
	add	si,WORD PTR [bp-60]	;elevindx
	shl	si,1
	mov	ax,WORD PTR [bp-24][si]
	mov	WORD PTR [bp-52],ax	;xval
; Line 3751
	mov	ax,WORD PTR [bp-48][si]
	mov	WORD PTR [bp-56],ax	;yval
; Line 3753
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	mov	ax,WORD PTR _ailoc[bx]
	mov	cx,100
	cwd	
	idiv	cx
	mov	WORD PTR [bp-54],ax	;tx
; Line 3754
	mov	ax,WORD PTR _ailoc[bx+4]
	cwd	
	idiv	cx
	mov	WORD PTR [bp-58],ax	;ty
; Line 3756
	cmp	WORD PTR [bp-56],ax	;yval
	je	$I2822
; Line 3757
	jle	$I2823
; Line 3758
	mov	ax,2
	push	ax
	mov	si,bx
	call	_GetCatHeading
	add	sp,2
	add	ah,128
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_TurnTo
	add	sp,4
	or	ax,ax
	jne	$JCC23906
	jmp	$I2838
$JCC23906:
; Line 3759
	add	WORD PTR _ailoc[si+4],100
	adc	WORD PTR _ailoc[si+6],0
; Line 3760
; Line 3761
; Line 3762
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I2823:
; Line 3763
	mov	ax,2
	push	ax
	call	_GetCatHeading
	add	sp,2
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_TurnTo
	add	sp,4
	or	ax,ax
	jne	$JCC23948
	jmp	$I2838
$JCC23948:
; Line 3764
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	sub	WORD PTR _ailoc[bx+4],100
	sbb	WORD PTR _ailoc[bx+6],0
; Line 3765
; Line 3766
; Line 3767
; Line 3768
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2822:
	mov	ax,WORD PTR [bp-52]	;xval
	cmp	WORD PTR [bp-54],ax	;tx
	jne	$JCC23982
	jmp	$I2829
$JCC23982:
; Line 3769
	jge	$I2830
; Line 3770
	mov	ax,2
	push	ax
	call	_GetCatHeading
	add	sp,2
	sub	ax,16384
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_TurnTo
	add	sp,4
	or	ax,ax
	je	$I2833
; Line 3771
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	add	WORD PTR _ailoc[bx],100
	adc	WORD PTR _ailoc[bx+2],0
; Line 3772
; Line 3773
; Line 3774
	jmp	SHORT $I2833
	nop	
$I2830:
; Line 3775
	mov	ax,2
	push	ax
	call	_GetCatHeading
	add	sp,2
	add	ah,64
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_TurnTo
	add	sp,4
	or	ax,ax
	je	$I2833
; Line 3776
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	sub	WORD PTR _ailoc[bx],100
	sbb	WORD PTR _ailoc[bx+2],0
; Line 3777
; Line 3778
$I2833:
; Line 3779
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	push	WORD PTR _ailoc[bx+2]
	push	WORD PTR _ailoc[bx]
	call	__aNldiv
	mov	cx,ax
	mov	ax,WORD PTR [bp-52]	;xval
	mov	bx,dx
	cwd	
	cmp	cx,ax
	jne	$I2838
	cmp	bx,dx
	jne	$I2838
; Line 3780
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _Gtime
	add	ax,3
	jmp	SHORT $L20113
	nop	
	nop	
$I2829:
; Line 3783
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],8
	je	$I2836
; Line 3784
	push	WORD PTR [bp+4]	;planenum
	call	_IndirectWPCorrection
	add	sp,2
; Line 3785
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	WORD PTR _ps[bx+24],0
; Line 3786
	and	BYTE PTR _landingstatus,191
; Line 3787
	call	_GetPlaneLanding
; Line 3788
	test	BYTE PTR _landingstatus,66
	jne	$I2837
; Line 3789
	and	BYTE PTR _landingstatus+1,254
; Line 3790
$I2837:
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],247
; Line 3791
; Line 3792
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I2836:
; Line 3793
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],8
; Line 3794
	mov	al,BYTE PTR _Rtime
	and	ax,3
	add	ax,WORD PTR _Gtime
	inc	ax
$L20113:
	mov	WORD PTR _bv[bx+22],ax
; Line 3795
$I2838:
; Line 3796
; Line 3797
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_MoveAIToElevator	ENDP
; Line 3803
	PUBLIC	_DoLandWait
_DoLandWait	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
	push	si
;	whichwait = -8
;	i = -10
;	whichside = -6
;	dx2 = -14
;	dy2 = -18
;	newangle = -2
;	returnval = -4
;	rearhead = 12
;	dy = 8
;	dx = 4
; Line 3813
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR [bp-10],ax	;i
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+38]
	mov	WORD PTR [bp-8],ax	;whichwait
; Line 3814
	cmp	ax,700
	jl	$I2850
; Line 3815
	sub	ax,700
	mov	WORD PTR [bp-6],ax	;whichside
; Line 3816
	mov	WORD PTR [bp-8],700	;whichwait
; Line 3817
	mov	ax,WORD PTR [bp+12]	;rearhead
	add	ah,32
	jmp	SHORT $L20114
$I2850:
	cmp	ax,600
	jl	$I2852
; Line 3820
	sub	ax,600
	mov	WORD PTR [bp-6],ax	;whichside
; Line 3821
	mov	WORD PTR [bp-8],600	;whichwait
; Line 3822
	mov	ax,cx
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR [bp+12]	;rearhead
	jmp	SHORT $L20114
	nop	
$I2852:
; Line 3825
	sub	ax,500
	mov	WORD PTR [bp-6],ax	;whichside
; Line 3826
	mov	WORD PTR [bp-8],500	;whichwait
; Line 3827
	mov	ax,cx
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR [bp+12]	;rearhead
	sub	ax,8192
$L20114:
	mov	WORD PTR _bv[bx+38],ax
	mov	WORD PTR [bp-2],ax	;newangle
; Line 3828
; Line 3829
	mov	ax,-1792
	mov	dx,21
	push	dx
	push	ax
	push	WORD PTR [bp-2]	;newangle
	call	_sinXL
	add	sp,6
	add	ax,WORD PTR [bp+4]	;dx
	adc	dx,WORD PTR [bp+6]
	mov	WORD PTR [bp-14],ax	;dx2
	mov	WORD PTR [bp-12],dx
; Line 3830
	mov	ax,-1792
	mov	dx,21
	push	dx
	push	ax
	push	WORD PTR [bp-2]	;newangle
	call	_cosXL
	add	sp,6
	mov	cx,WORD PTR [bp+8]	;dy
	mov	bx,WORD PTR [bp+10]
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR [bp-18],cx	;dy2
	mov	WORD PTR [bp-16],bx
; Line 3831
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;dx2
	call	__aNldiv
	mov	cx,ax
	mov	ax,46
	mov	bx,dx
	imul	WORD PTR [bp-10]	;i
	mov	si,ax
	mov	WORD PTR _bv[si+30],cx
	mov	WORD PTR _bv[si+32],bx
; Line 3832
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;dy2
	call	__aNldiv
	mov	WORD PTR _bv[si+34],ax
	mov	WORD PTR _bv[si+36],dx
; Line 3833
	mov	ax,WORD PTR [bp-6]	;whichside
	or	ax,ax
	je	$SC2858
	dec	ax
	je	$SC2859
	dec	ax
	je	$SC2860
	dec	ax
	je	$SC2861
; Line 3834
$SC2858:
; Line 3835
	mov	ax,338
	push	ax
	mov	ax,225
	push	ax
	mov	ax,90
	push	ax
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+26]
	add	ax,1250
	push	ax
	sub	ax,ax
$L20118:
	push	ax
	call	_CAPAI
	add	sp,10
; Line 3836
	jmp	SHORT $SB2855
; Line 3837
$SC2859:
; Line 3838
	mov	ax,225
	push	ax
	mov	ax,90
	push	ax
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+26]
	add	ax,1250
	push	ax
	call	_OvalTurn1
$L20117:
	add	sp,6
	jmp	SHORT $SB2855
; Line 3840
	nop	
$SC2860:
; Line 3841
	mov	ax,338
	push	ax
	mov	ax,225
	push	ax
	mov	ax,90
	push	ax
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+26]
	add	ax,1250
	push	ax
	mov	ax,1
	jmp	SHORT $L20118
; Line 3843
$SC2861:
; Line 3844
	mov	ax,225
	push	ax
	mov	ax,90
	push	ax
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+26]
	add	ax,1250
	push	ax
	call	_OvalTurn2
	jmp	SHORT $L20117
; Line 3846
$SB2855:
; Line 3850
	or	ax,ax
	je	$I2864
; Line 3852
	inc	WORD PTR [bp-6]	;whichside
	cmp	WORD PTR [bp-6],3	;whichside
	jle	$I2864
; Line 3853
	mov	WORD PTR [bp-6],0	;whichside
; Line 3854
$I2864:
; Line 3855
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-6]	;whichside
	add	ax,WORD PTR [bp-8]	;whichwait
	mov	WORD PTR _bv[bx+38],ax
; Line 3856
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_DoLandWait	ENDP
; Line 3859
	PUBLIC	_CheckPlaneLand
_CheckPlaneLand	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
;	cnt = -6
;	altplus = -4
;	startval = -2
;	rearhead = -14
;	dx = -12
;	dy = -18
;	angels = -8
;	planenum = 4
; Line 3861
	mov	WORD PTR [bp-4],0	;altplus
; Line 3862
	mov	WORD PTR [bp-2],100	;startval
; Line 3868
	or	BYTE PTR _landingstatus,128
	test	BYTE PTR _landingstatus,48
	je	$I2874
; Line 3869
	mov	WORD PTR [bp-2],500	;startval
; Line 3871
$I2874:
	test	BYTE PTR _landingstatus,3
	je	$I2875
; Line 3872
	cmp	WORD PTR [bp+4],-1	;planenum
	jne	$JCC24727
	jmp	$I2889
$JCC24727:
; Line 3874
	mov	WORD PTR [bp-2],500	;startval
; Line 3875
; Line 3876
$I2875:
	cmp	WORD PTR _Night,0
	jne	$I2878
	cmp	WORD PTR _MissionWeather,2
	jne	$I2877
$I2878:
	cmp	WORD PTR [bp-2],500	;startval
	jne	$I2877
; Line 3877
	mov	WORD PTR [bp-2],600	;startval
; Line 3878
; Line 3879
$I2877:
	mov	WORD PTR [bp-6],0	;cnt
	jmp	SHORT $F2879
$I2885:
; Line 3892
	mov	WORD PTR [bp-2],600	;startval
; Line 3893
	add	WORD PTR [bp-4],250	;altplus
; Line 3894
$I2887:
; Line 3895
; Line 3896
; Line 3897
	inc	WORD PTR [bp-6]	;cnt
$F2879:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-6],ax	;cnt
	jge	$FB2881
; Line 3880
	mov	ax,40
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2887
	test	cl,2
	je	$I2887
	test	cl,32
	jne	$I2887
; Line 3881
	mov	ax,46
	imul	WORD PTR [bp-6]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$I2887
	cmp	WORD PTR _bv[bx+38],20
	jle	$I2887
; Line 3882
	cmp	WORD PTR [bp-2],100	;startval
	jne	$I2884
; Line 3883
	mov	WORD PTR [bp-2],400	;startval
; Line 3884
$I2884:
	cmp	WORD PTR _Night,0
	jne	$I2885
	cmp	WORD PTR _MissionWeather,2
	je	$I2885
; Line 3886
	add	WORD PTR [bp-2],100	;startval
	cmp	WORD PTR [bp-2],800	;startval
	jne	$I2887
; Line 3887
	add	WORD PTR [bp-4],250	;altplus
; Line 3888
	mov	WORD PTR [bp-2],500	;startval
; Line 3889
; Line 3890
; Line 3891
	jmp	SHORT $I2887
$FB2881:
; Line 3898
	cmp	WORD PTR [bp+4],0	;planenum
	jl	$I2888
; Line 3899
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp-2]	;startval
	mov	WORD PTR _bv[bx+38],ax
; Line 3900
	mov	ax,WORD PTR [bp-4]	;altplus
	mov	WORD PTR _bv[bx+26],ax
; Line 3910
; Line 3911
	mov	sp,bp
	pop	bp
	ret	
$I2888:
; Line 3912
	mov	WORD PTR _planelanding,-1
; Line 3913
	mov	ax,OFFSET DGROUP:$SG2890
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 3914
	mov	ax,OFFSET _OurCallSign
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 3915
	cmp	WORD PTR [bp-2],100	;startval
	jne	$I2891
; Line 3916
	mov	ax,OFFSET DGROUP:$SG2892
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 3917
	or	BYTE PTR _landingstatus,2
; Line 3918
	mov	ax,76
	push	ax
	call	_Speech
	add	sp,2
; Line 3919
; Line 3920
	jmp	$I2893
$I2891:
; Line 3921
	mov	ax,11
	push	ax
	call	_Speech
	add	sp,2
; Line 3922
	or	BYTE PTR _landingstatus,1
; Line 3923
	mov	ax,WORD PTR [bp-4]	;altplus
	add	ax,1250
	mov	cx,250
	cwd	
	idiv	cx
	mov	WORD PTR [bp-8],ax	;angels
; Line 3924
	mov	es,WORD PTR $T20007
	mov	ax,WORD PTR es:_carrier+12
	add	ah,128
	mov	WORD PTR [bp-14],ax	;rearhead
; Line 3925
	mov	cx,-1792
	mov	dx,21
	push	dx
	push	cx
	push	ax
	call	_sinXL
	add	sp,6
	mov	es,WORD PTR $T20007
	add	ax,WORD PTR es:_carrier
	adc	dx,WORD PTR es:_carrier+2
	mov	WORD PTR [bp-12],ax	;dx
	mov	WORD PTR [bp-10],dx
; Line 3926
	mov	ax,-1792
	mov	dx,21
	push	dx
	push	ax
	push	WORD PTR [bp-14]	;rearhead
	call	_cosXL
	add	sp,6
	mov	es,WORD PTR $T20007
	mov	cx,WORD PTR es:_carrier+8
	mov	bx,WORD PTR es:_carrier+10
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR [bp-18],cx	;dy
	mov	WORD PTR [bp-16],bx
; Line 3927
	mov	ax,OFFSET DGROUP:$SG2894
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 3928
	cmp	WORD PTR [bp-2],700	;startval
	jne	$I2895
; Line 3929
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-14]	;rearhead
	add	ah,32
	mov	WORD PTR _bv[bx+38],ax
	mov	WORD PTR [bp-14],ax	;rearhead
; Line 3930
	mov	ax,OFFSET DGROUP:$SG2896
	jmp	SHORT $L20119
$I2895:
	cmp	WORD PTR [bp-2],600	;startval
	jne	$I2898
; Line 3933
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-14]	;rearhead
	mov	WORD PTR _bv[bx+38],ax
	mov	WORD PTR [bp-14],ax	;rearhead
; Line 3934
	cmp	WORD PTR _Night,0
	jne	$I2899
	cmp	WORD PTR _MissionWeather,2
	je	$I2899
; Line 3935
	mov	ax,OFFSET DGROUP:$SG2900
	jmp	SHORT $L20119
	nop	
$I2899:
; Line 3937
	mov	ax,OFFSET DGROUP:$SG2902
	jmp	SHORT $L20119
	nop	
$I2898:
; Line 3940
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-14]	;rearhead
	sub	ax,8192
	mov	WORD PTR _bv[bx+38],ax
	mov	WORD PTR [bp-14],ax	;rearhead
; Line 3941
	mov	ax,OFFSET DGROUP:$SG2904
$L20119:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 3942
; Line 3943
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	push	WORD PTR [bp-8]	;angels
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 3944
	mov	ax,4
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 3945
	mov	ax,OFFSET DGROUP:$SG2905
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 3946
	mov	ax,-1792
	mov	dx,21
	push	dx
	push	ax
	push	WORD PTR [bp-14]	;rearhead
	call	_sinXL
	add	sp,6
	add	WORD PTR [bp-12],ax	;dx
	adc	WORD PTR [bp-10],dx
; Line 3947
	mov	ax,-1792
	mov	dx,21
	push	dx
	push	ax
	push	WORD PTR [bp-14]	;rearhead
	call	_cosXL
	add	sp,6
	sub	WORD PTR [bp-18],ax	;dy
	sbb	WORD PTR [bp-16],dx
; Line 3948
	mov	WORD PTR _NextWayPoint,0
; Line 3949
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-10]
	push	WORD PTR [bp-12]	;dx
	call	__aNldiv
	mov	WORD PTR _wps+4,ax
	mov	WORD PTR _wps+6,dx
; Line 3950
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;dy
	call	__aNldiv
	mov	WORD PTR _wps+8,ax
	mov	WORD PTR _wps+10,dx
; Line 3951
	mov	ax,WORD PTR _wps+4
	mov	dx,WORD PTR _wps+6
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
	mov	WORD PTR _wps,ax
; Line 3952
	mov	ax,WORD PTR _wps+8
	mov	dx,WORD PTR _wps+10
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
	mov	WORD PTR _wps+2,ax
; Line 3953
$I2893:
; Line 3954
	mov	ax,4
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
; Line 3955
$I2889:
; Line 3969
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CheckPlaneLand	ENDP
; Line 3972
	PUBLIC	_LetNextPlaneLand
_LetNextPlaneLand	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
;	cnt = -8
;	altplus = -6
;	startval = -2
;	gotone = -10
;	letland = -4
; Line 3975
	mov	WORD PTR [bp-2],100	;startval
; Line 3976
	sub	ax,ax
	mov	WORD PTR [bp-6],ax	;altplus
	mov	WORD PTR [bp-10],ax	;gotone
; Line 3977
	mov	WORD PTR [bp-4],-1	;letland
; Line 3979
	test	BYTE PTR _landingstatus,50
	je	$JCC25510
	jmp	$EX2906
$JCC25510:
; Line 3981
; Line 3982
; Line 3984
; Line 3986
	test	BYTE PTR _landingstatus,1
	je	$I2914
; Line 3987
	mov	WORD PTR [bp-4],70	;letland
; Line 3988
; Line 3990
$I2914:
	mov	WORD PTR [bp-8],ax	;cnt
	jmp	SHORT $F2915
; Line 4006
; Line 4007
$I2921:
; Line 4008
	inc	WORD PTR [bp-8]	;cnt
$F2915:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-8],ax	;cnt
	jge	$FB2917
; Line 3991
	mov	ax,40
	imul	WORD PTR [bp-8]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2921
	test	cl,2
	je	$I2921
	test	cl,32
	jne	$I2921
; Line 3992
	mov	ax,46
	imul	WORD PTR [bp-8]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$I2920
	cmp	WORD PTR _bv[bx+38],100
	jle	$I2920
; Line 3993
	cmp	WORD PTR [bp-10],0	;gotone
	jne	$I2920
; Line 3994
	mov	ax,WORD PTR [bp-8]	;cnt
	mov	WORD PTR [bp-4],ax	;letland
; Line 3995
	mov	WORD PTR [bp-10],1	;gotone
; Line 3996
; Line 3997
$I2920:
; Line 3998
	mov	ax,46
	imul	WORD PTR [bp-8]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$I2921
	cmp	WORD PTR _bv[bx+38],100
	jne	$I2921
; Line 3999
	mov	WORD PTR _bv[bx+18],700
; Line 4005
	mov	sp,bp
	pop	bp
	ret	
$FB2917:
; Line 4009
	cmp	WORD PTR [bp-4],0	;letland
	jge	$JCC25648
	jmp	$I2922
$JCC25648:
; Line 4010
	test	BYTE PTR _landingstatus,1
	je	$I2923
; Line 4011
	mov	ax,OFFSET DGROUP:$SG2924
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 4012
	mov	ax,OFFSET _OurCallSign
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4013
	mov	ax,OFFSET DGROUP:$SG2925
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4014
	mov	ax,4
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 4015
	mov	ax,76
	push	ax
	call	_Speech
	add	sp,2
; Line 4016
	and	BYTE PTR _landingstatus,254
; Line 4017
	or	BYTE PTR _landingstatus,2
; Line 4018
	mov	WORD PTR _planelanding,-1
; Line 4019
	mov	sp,bp
	pop	bp
	ret	
; Line 4020
; Line 4021
$I2923:
	mov	ax,46
	imul	WORD PTR [bp-4]	;letland
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+26]
	mov	WORD PTR [bp-6],ax	;altplus
; Line 4022
	mov	ax,WORD PTR _bv[bx+38]
	mov	cx,100
	cwd	
	idiv	cx
	mov	WORD PTR [bp-2],dx	;startval
; Line 4023
	mov	WORD PTR _bv[bx+38],cx
; Line 4024
	mov	WORD PTR _bv[bx+26],0
; Line 4032
; Line 4033
$I2922:
	mov	WORD PTR [bp-8],0	;cnt
	jmp	SHORT $F2926
	nop	
$FC2927:
; Line 4034
	mov	ax,40
	imul	WORD PTR [bp-8]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2932
	test	cl,2
	je	$I2932
; Line 4035
	mov	ax,46
	imul	WORD PTR [bp-8]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$I2932
	cmp	WORD PTR _bv[bx+38],100
	jle	$I2932
; Line 4036
	mov	ax,WORD PTR [bp-2]	;startval
	cmp	WORD PTR _bv[bx+38],ax
	jl	$I2932
	add	ax,100
	cmp	WORD PTR _bv[bx+38],ax
	jge	$I2932
; Line 4037
	mov	ax,WORD PTR [bp-6]	;altplus
	cmp	WORD PTR _bv[bx+26],ax
	jle	$I2932
; Line 4038
	sub	WORD PTR _bv[bx+26],250
; Line 4039
$I2932:
; Line 4040
; Line 4041
; Line 4042
	inc	WORD PTR [bp-8]	;cnt
$F2926:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-8],ax	;cnt
	jl	$FC2927
; Line 4043
$EX2906:
	mov	sp,bp
	pop	bp
	ret	

_LetNextPlaneLand	ENDP
; Line 4046
	PUBLIC	_GetPlaneLanding
_GetPlaneLanding	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	cnt = -4
;	landval = -2
; Line 4048
	mov	WORD PTR [bp-2],1000	;landval
; Line 4050
	test	BYTE PTR _landingstatus,2
	je	$I2936
; Line 4051
	mov	WORD PTR _planelanding,-1
; Line 4053
$I2936:
	cmp	WORD PTR _planelanding,-1
	je	$EX2933
; Line 4056
	mov	WORD PTR _planelanding,-999
; Line 4057
	mov	WORD PTR [bp-4],0	;cnt
	jmp	SHORT $F2938
	nop	
$FC2939:
; Line 4058
	mov	ax,40
	imul	WORD PTR [bp-4]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2944
	test	cl,2
	je	$I2944
	test	cl,32
	jne	$I2944
; Line 4059
	mov	ax,46
	imul	WORD PTR [bp-4]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$I2944
	mov	ax,WORD PTR [bp-2]	;landval
	cmp	WORD PTR _bv[bx+38],ax
	jge	$I2944
; Line 4060
	cmp	WORD PTR _bv[bx+38],-2
	jle	$I2944
; Line 4061
	mov	ax,WORD PTR [bp-4]	;cnt
	mov	WORD PTR _planelanding,ax
; Line 4062
	mov	cx,WORD PTR _bv[bx+38]
	mov	WORD PTR [bp-2],cx	;landval
; Line 4063
	cmp	cx,10
	jge	$I2944
; Line 4064
	or	BYTE PTR _landingstatus,64
; Line 4065
$I2944:
; Line 4066
; Line 4067
; Line 4068
	inc	WORD PTR [bp-4]	;cnt
$F2938:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-4],ax	;cnt
	jl	$FC2939
; Line 4069
$EX2933:
	mov	sp,bp
	pop	bp
	ret	

_GetPlaneLanding	ENDP
; Line 4072
	PUBLIC	_GetWhichElevator
_GetWhichElevator	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,66
	call	__aNchkstk
	push	di
	push	si
;	cnt = -50
;	cnt2 = -54
;	elevorder = -62
;	elevX = -24
;	elevY = -48
;	elevnum = -66
;	elevOK = -52
;	whichcarr = -64
;	yesinvis = 12
;	try3 = 10
;	try2 = 8
;	try1 = 6
;	try0 = 4
; Line 4079
	mov	ax,25
	mov	WORD PTR [bp-24],ax	;elevX
	mov	WORD PTR [bp-22],ax
	mov	WORD PTR [bp-20],ax
	mov	WORD PTR [bp-16],ax
	mov	WORD PTR [bp-14],ax
	mov	WORD PTR [bp-12],ax
	mov	WORD PTR [bp-8],ax
	mov	WORD PTR [bp-6],ax
	mov	WORD PTR [bp-4],ax
	mov	ax,-27
	mov	WORD PTR [bp-18],ax
	mov	WORD PTR [bp-10],ax
	mov	WORD PTR [bp-2],ax
; Line 4080
	mov	WORD PTR [bp-48],-28	;elevY
	mov	WORD PTR [bp-46],7
	mov	WORD PTR [bp-44],76
	mov	WORD PTR [bp-42],77
; Line 4081
	mov	WORD PTR [bp-40],-17
	mov	WORD PTR [bp-38],21
	mov	WORD PTR [bp-36],82
	mov	WORD PTR [bp-34],89
; Line 4082
	mov	WORD PTR [bp-32],-13
	mov	WORD PTR [bp-30],35
	mov	WORD PTR [bp-28],69
	mov	WORD PTR [bp-26],-33
; Line 4088
	mov	ax,WORD PTR _ConfigData+22
	mov	WORD PTR [bp-64],ax	;whichcarr
; Line 4089
	cmp	ax,2
	jg	$I2960
	or	ax,ax
	jge	$I2959
$I2960:
; Line 4090
	mov	WORD PTR [bp-64],0	;whichcarr
; Line 4092
$I2959:
	mov	ax,WORD PTR [bp+4]	;try0
	mov	WORD PTR [bp-62],ax	;elevorder
; Line 4093
	mov	ax,WORD PTR [bp+6]	;try1
	mov	WORD PTR [bp-60],ax
; Line 4094
	mov	ax,WORD PTR [bp+8]	;try2
	mov	WORD PTR [bp-58],ax
; Line 4095
	mov	ax,WORD PTR [bp+10]	;try3
	mov	WORD PTR [bp-56],ax
; Line 4096
	mov	WORD PTR [bp-50],0	;cnt
	jmp	$F2961
	nop	
$FC2965:
; Line 4100
	mov	ax,40
	imul	WORD PTR [bp-54]	;cnt2
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	jne	$JCC26214
	jmp	$I2972
$JCC26214:
	test	cl,2
	jne	$JCC26222
	jmp	$I2972
$JCC26222:
	mov	ax,WORD PTR _ps[bx]
	add	ax,WORD PTR _whichourcarr
	inc	ax
	je	$JCC26236
	jmp	$I2972
$JCC26236:
	mov	ax,46
	imul	WORD PTR [bp-54]	;cnt2
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],8
	je	$I2968
	cmp	WORD PTR [bp+12],0	;yesinvis
	jne	$JCC26260
	jmp	$I2972
$JCC26260:
$I2968:
; Line 4102
	mov	ax,46
	imul	WORD PTR [bp-54]	;cnt2
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	je	$I2970
	cmp	WORD PTR _bv[bx],OFFSET _SARWait
	je	$I2970
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$I2971
	cmp	WORD PTR _bv[bx+38],-3
	jle	$I2970
$I2971:
	mov	ax,40
	imul	WORD PTR [bp-54]	;cnt2
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],128
	jne	$JCC26317
	jmp	$I2972
$JCC26317:
	cmp	WORD PTR _ps[bx+26],1
	jg	$I2972
$I2970:
; Line 4103
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	cl,3
	mov	bx,WORD PTR [bp-54]	;cnt2
	shl	bx,cl
	push	WORD PTR _ailoc[bx+2]
	push	WORD PTR _ailoc[bx]
	mov	si,bx
	call	__aNldiv
	mov	di,WORD PTR [bp-64]	;whichcarr
	shl	di,1
	shl	di,1
	add	di,WORD PTR [bp-66]	;elevnum
	shl	di,1
	mov	cx,ax
	mov	ax,WORD PTR [bp-24][di]
	mov	bx,dx
	cwd	
	sub	cx,ax
	sbb	bx,dx
	push	bx
	push	cx
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$I2972
	jl	$L20018
	cmp	ax,12
	jae	$I2972
$L20018:
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ailoc[si+6]
	push	WORD PTR _ailoc[si+4]
	call	__aNldiv
	mov	cx,ax
	mov	ax,WORD PTR [bp-48][di]
	mov	bx,dx
	cwd	
	sub	cx,ax
	sbb	bx,dx
	push	bx
	push	cx
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$I2972
	jl	$L20021
	cmp	ax,12
	jae	$I2972
$L20021:
; Line 4104
	mov	WORD PTR [bp-52],0	;elevOK
; Line 4105
; Line 4106
$I2972:
; Line 4107
; Line 4108
	inc	WORD PTR [bp-54]	;cnt2
$F2964:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-54],ax	;cnt2
	jge	$JCC26460
	jmp	$FC2965
$JCC26460:
; Line 4109
	cmp	WORD PTR [bp-52],0	;elevOK
	je	$FC2962
; Line 4110
$L20123:
	mov	ax,WORD PTR [bp-66]	;elevnum
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 4111
; Line 4112
	nop	
	nop	
$FC2962:
	inc	WORD PTR [bp-50]	;cnt
$F2961:
	cmp	WORD PTR [bp-50],4	;cnt
	jge	$L20123
; Line 4097
	mov	si,WORD PTR [bp-50]	;cnt
	shl	si,1
	mov	ax,WORD PTR [bp-62][si]
	mov	WORD PTR [bp-66],ax	;elevnum
; Line 4098
	mov	WORD PTR [bp-52],1	;elevOK
; Line 4099
	mov	WORD PTR [bp-54],0	;cnt2
	jmp	SHORT $F2964

_GetWhichElevator	ENDP
; Line 4117
	PUBLIC	_CheckIsWayTarget
_CheckIsWayTarget	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	bogey_org_num = -8
;	waynum = -2
;	cnt = -6
;	is_target = -4
;	bogeyi = 4
; Line 4119
	mov	WORD PTR [bp-4],0	;is_target
; Line 4123
	push	WORD PTR [bp+4]	;bogeyi
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-8],ax	;bogey_org_num
	inc	ax
	jne	$I2980
; Line 4124
	mov	ax,WORD PTR _orgPlayernum
	jmp	SHORT $L20124
$I2980:
; Line 4126
	mov	ax,46
	imul	WORD PTR [bp-8]	;bogey_org_num
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+44]
	cbw	
$L20124:
	mov	WORD PTR [bp-8],ax	;bogey_org_num
; Line 4128
	mov	WORD PTR [bp-6],0	;cnt
	jmp	SHORT $F2982
	nop	
$FC2983:
; Line 4130
	mov	bx,WORD PTR _aipaths[bx+4]
	add	bx,ax
	mov	WORD PTR [bp-2],bx	;waynum
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jg	$I2986
	jl	$L20022
	cmp	WORD PTR _aiwaypoints[bx],-1
	ja	$I2986
$L20022:
; Line 4131
	mov	ax,WORD PTR [bp-8]	;bogey_org_num
	cwd	
	cmp	WORD PTR _aiwaypoints[bx+4],ax
	jne	$I2986
	cmp	WORD PTR _aiwaypoints[bx+6],dx
	jne	$I2986
; Line 4132
	mov	WORD PTR [bp-4],1	;is_target
; Line 4133
; Line 4134
$I2986:
; Line 4135
	mov	bx,WORD PTR [bp-2]	;waynum
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx],-2
	jne	$L20125
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jne	$L20125
; Line 4136
	inc	WORD PTR [bp-6]	;cnt
; Line 4137
$L20125:
	inc	WORD PTR [bp-6]	;cnt
$F2982:
	mov	cl,3
	mov	bx,WORD PTR _OurPath
	shl	bx,cl
	mov	ax,WORD PTR [bp-6]	;cnt
	cmp	WORD PTR _aipaths[bx+6],ax
	ja	$FC2983
; Line 4138
	mov	ax,WORD PTR [bp-4]	;is_target
; Line 4139
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CheckIsWayTarget	ENDP
; Line 4142
	PUBLIC	_DoGroupAction
_DoGroupAction	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	wingcnt = -4
;	tprewing = -2
;	waypt = 8
;	actionflag = 6
;	planenum = 4
; Line 4146
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FlyWayPoint
	jne	$JCC26713
	jmp	$EX2991
$JCC26713:
; Line 4150
	mov	ax,WORD PTR [bp+4]	;planenum
	mov	WORD PTR [bp-2],ax	;tprewing
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
	jmp	$L20128
$FC2999:
; Line 4153
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp-4]	;wingcnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx],cx
	jne	$I3004
; Line 4154
	cmp	WORD PTR [bp+6],512	;actionflag
	jne	$I3003
; Line 4155
	cmp	WORD PTR _Gtime,0
	je	$I3003
; Line 4156
	push	WORD PTR [bp-4]	;wingcnt
	call	_TrooperDrop
	add	sp,2
; Line 4157
$I3003:
; Line 4158
	cmp	WORD PTR [bp+6],-32768	;actionflag
	jne	$I3004
; Line 4159
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	push	WORD PTR [bp+8]	;waypt
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+12]
	cbw	
	neg	ax
	push	ax
	mov	ax,40
	imul	WORD PTR [bp-4]	;wingcnt
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR [bp-4]	;wingcnt
	mov	ax,43
	push	ax
	call	_LogIt
	add	sp,24
; Line 4160
; Line 4161
$I3004:
; Line 4162
	mov	ax,46
	imul	WORD PTR [bp-4]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-4],ax	;wingcnt
; Line 4163
$L20126:
	cmp	WORD PTR [bp-4],0	;wingcnt
	jl	$JCC26880
	jmp	$FC2999
$JCC26880:
; Line 4165
	mov	ax,46
	imul	WORD PTR [bp-2]	;tprewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-2],ax	;tprewing
$L20128:
	mov	WORD PTR [bp-4],ax	;wingcnt
; Line 4166
	cmp	WORD PTR [bp-2],0	;tprewing
	jge	$L20126
; Line 4167
$EX2991:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DoGroupAction	ENDP
; Line 4170
	PUBLIC	_DoOClockCall
_DoOClockCall	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,26
	call	__aNchkstk
	push	si
;	ldist = -4
;	tldist = -8
;	dx = -22
;	dy = -26
;	aoclock = -18
;	noclock = -14
;	tpitch = -16
;	cnt = -10
;	targUS = -12
; Line 4179
	mov	WORD PTR _closeplane,-1
; Line 4180
	mov	WORD PTR [bp-4],-1	;ldist
	mov	WORD PTR [bp-2],-1
; Line 4181
	sub	ax,ax
	mov	WORD PTR [bp-12],ax	;targUS
	mov	WORD PTR [bp-10],ax	;cnt
	jmp	$F3015
	nop	
$FC3016:
; Line 4182
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	jne	$JCC26968
	jmp	$I3022
$JCC26968:
	test	cl,2
	jne	$JCC26976
	jmp	$I3022
$JCC26976:
	test	cx,3104
	je	$JCC26985
	jmp	$I3022
$JCC26985:
; Line 4183
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR _Px
	push	ax
	mov	si,bx
	call	_abs
	add	sp,2
	cmp	ax,450
	jl	$JCC27010
	jmp	$I3022
$JCC27010:
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR _Py
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,450
	jl	$JCC27033
	jmp	$I3022
$JCC27033:
; Line 4184
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	push	WORD PTR _bv[bx+10]
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	je	$I3021
	cmp	WORD PTR [bp-12],0	;targUS
	jne	$I3022
$I3021:
; Line 4186
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
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
	call	_LDist2D
	add	sp,8
	mov	WORD PTR [bp-8],ax	;tldist
	mov	WORD PTR [bp-6],dx
	cmp	dx,WORD PTR [bp-2]
	jl	$I3023
	jg	$L20025
	cmp	ax,WORD PTR [bp-4]	;ldist
	jb	$I3023
$L20025:
	cmp	WORD PTR [bp-2],0
	jl	$I3023
	mov	ax,46
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	push	WORD PTR _bv[bx+10]
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I3022
	cmp	WORD PTR [bp-12],0	;targUS
	jne	$I3022
$I3023:
; Line 4187
	mov	ax,WORD PTR [bp-8]	;tldist
	mov	dx,WORD PTR [bp-6]
	mov	WORD PTR [bp-4],ax	;ldist
	mov	WORD PTR [bp-2],dx
; Line 4188
	mov	ax,WORD PTR [bp-10]	;cnt
	mov	WORD PTR _closeplane,ax
; Line 4189
; Line 4190
$I3022:
; Line 4191
; Line 4192
; Line 4193
	inc	WORD PTR [bp-10]	;cnt
$F3015:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-10],ax	;cnt
	jge	$JCC27199
	jmp	$FC3016
$JCC27199:
; Line 4194
	cmp	WORD PTR _closeplane,-1
	jne	$I3024
; Line 4195
	mov	ax,WORD PTR _Gtime
	add	ax,45
	mov	WORD PTR _lastOClock,ax
; Line 4196
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I3024:
	mov	cl,5
	mov	ax,WORD PTR [bp-4]	;ldist
	shl	ax,cl
	cmp	ax,90
	jle	$I3026
; Line 4199
	mov	ax,WORD PTR _Gtime
	add	ax,20
	jmp	SHORT $L20130
$I3026:
; Line 4202
	mov	ax,WORD PTR _Gtime
	add	ax,5
$L20130:
	mov	WORD PTR _lastOClock,ax
; Line 4203
; Line 4204
	mov	ax,WORD PTR _LOCKED
	cmp	WORD PTR _closeplane,ax
	jne	$JCC27262
	jmp	$EX3005
$JCC27262:
; Line 4206
; Line 4207
	mov	ax,40
	imul	WORD PTR _closeplane
	mov	bx,ax
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _ps[bx+12]
	sbb	dx,WORD PTR _ps[bx+14]
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	ax
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
	sub	ax,WORD PTR _PxLng
	sbb	dx,WORD PTR _PxLng+2
	push	dx
	push	ax
	call	_Langle
	add	sp,8
	mov	WORD PTR [bp-18],ax	;aoclock
; Line 4210
	mov	ax,2730
	sub	ax,WORD PTR _OurHead
	add	WORD PTR [bp-18],ax	;aoclock
	mov	ax,WORD PTR [bp-18]	;aoclock
	mov	cx,5461
	sub	dx,dx
	div	cx
	mov	WORD PTR [bp-14],ax	;noclock
; Line 4211
	mov	cx,WORD PTR [bp-4]	;ldist
	mov	dx,WORD PTR [bp-2]
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
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR _closeplane
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _Alt
	mov	si,cx
	call	_GetAltPitch
	add	sp,6
	mov	WORD PTR [bp-16],ax	;tpitch
; Line 4212
	mov	ax,OFFSET DGROUP:$SG3030
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 4213
	or	si,si
	jne	$I3031
; Line 4214
	mov	ax,OFFSET DGROUP:$SG3032
	jmp	SHORT $L20131
	nop	
$I3031:
; Line 4216
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	push	WORD PTR [bp-14]	;noclock
	call	_itoa
	add	sp,6
$L20131:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4217
	mov	ax,OFFSET DGROUP:$SG3034
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4218
	cmp	WORD PTR [bp-16],4608	;tpitch
	jle	$I3035
; Line 4219
	mov	ax,OFFSET DGROUP:$SG3036
	jmp	SHORT $L20132
$I3035:
	cmp	WORD PTR [bp-16],-4608	;tpitch
	jge	$I3038
; Line 4222
	mov	ax,OFFSET DGROUP:$SG3039
$L20132:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4223
; Line 4224
$I3038:
	mov	ax,2
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 4225
$EX3005:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_DoOClockCall	ENDP
; Line 4228
	PUBLIC	_Immelmann
_Immelmann	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	i = -2
; Line 4231
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR [bp-2],ax	;i
; Line 4232
	mov	cx,46
	imul	cx
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	mov	WORD PTR _bv[bx+18],ax
; Line 4234
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	push	WORD PTR _ps[bx+20]
	call	_abs
	add	sp,2
	cmp	ax,16384
	jle	$I3042
; Line 4236
$L20133:
	mov	ax,46
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	mov	ax,OFFSET _StraightAttack
$L20134:
	mov	WORD PTR _bv[bx],ax
	call	ax
; Line 4239
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 4240
; Line 4241
	nop	
$I3042:
	mov	ax,40
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+26],150
	jge	$I3043
; Line 4242
	cmp	WORD PTR _ps[bx+6],1000
	jle	$L20133
; Line 4245
	mov	ax,46
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	mov	ax,OFFSET _SplitS
	jmp	SHORT $L20134
	nop	
$I3043:
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	cmp	WORD PTR _ps[bx+20],-4096
	jge	$I3046
; Line 4256
	mov	ax,-4096
	jmp	SHORT $L20135
$I3046:
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	cmp	WORD PTR _ps[bx+20],4096
	jle	$I3048
; Line 4259
	mov	ax,4096
$L20135:
	sub	ax,WORD PTR _ps[bx+20]
	mov	WORD PTR _droll,ax
; Line 4260
; Line 4261
$I3048:
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	cmp	WORD PTR _ps[bx+18],0
	jle	$I3049
; Line 4262
	mov	WORD PTR _pdest,24576
; Line 4263
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I3049:
; Line 4264
	mov	WORD PTR _pdest,12288
; Line 4265
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Immelmann	ENDP
; Line 4268
	PUBLIC	_SplitS
_SplitS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,32
	call	__aNchkstk
	push	si
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
;	targetspeed = -14
; Line 4277
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1363_i,ax
	mov	cx,40
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],500
	jl	$I3069
	push	WORD PTR _ps[bx+20]
	call	_abs
	add	sp,2
	cmp	ax,6144
	jge	$I3068
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	cmp	WORD PTR _ps[bx+18],-10752
	jge	$I3068
$I3069:
; Line 4279
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	ax,OFFSET _StraightAttack
	mov	WORD PTR _bv[bx],ax
	call	ax
; Line 4281
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 4282
; Line 4283
$I3068:
; Line 4284
	push	WORD PTR $S1363_i
	call	_CheckDetection
	add	sp,2
	mov	WORD PTR [bp-30],ax	;enemynum
	cmp	ax,-999
	jne	$I3070
; Line 4285
	mov	ax,46
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR [bp-30],ax	;enemynum
; Line 4287
$I3070:
	cmp	ax,-1
	jne	$I3071
; Line 4288
	mov	ax,40
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-24],ax	;dx
; Line 4289
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-28],ax	;dy
; Line 4290
	mov	ax,WORD PTR _OurRoll
	mov	WORD PTR [bp-12],ax	;enemyroll
; Line 4291
	mov	ax,WORD PTR _OurHead
	mov	WORD PTR [bp-2],ax	;enemyhead
; Line 4292
	mov	ax,WORD PTR _OurPitch
	mov	WORD PTR [bp-6],ax	;enemypitch
; Line 4293
	mov	ax,WORD PTR _Knots
	jmp	SHORT $L20136
	nop	
$I3071:
; Line 4296
	mov	ax,40
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR [bp-30]	;enemynum
	mov	si,ax
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-24],ax	;dx
; Line 4297
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-28],ax	;dy
; Line 4298
	mov	ax,WORD PTR _ps[si+20]
	mov	WORD PTR [bp-12],ax	;enemyroll
; Line 4299
	mov	ax,WORD PTR _ps[si+16]
	mov	WORD PTR [bp-2],ax	;enemyhead
; Line 4300
	mov	ax,WORD PTR _ps[si+18]
	mov	WORD PTR [bp-6],ax	;enemypitch
; Line 4301
	mov	ax,46
	imul	WORD PTR [bp-30]	;enemynum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
$L20136:
	mov	WORD PTR [bp-14],ax	;targetspeed
; Line 4302
; Line 4303
	sub	ax,ax
	push	ax
	lea	ax,WORD PTR [bp-32]	;enemyalt
	push	ax
	lea	ax,WORD PTR [bp-4]	;tdistnm
	push	ax
	lea	ax,WORD PTR [bp-20]	;tangle
	push	ax
	lea	cx,WORD PTR [bp-22]	;tpitch
	push	cx
	lea	cx,WORD PTR [bp-16]	;tdist
	push	cx
	push	WORD PTR [bp-28]	;dy
	push	WORD PTR [bp-24]	;dx
	push	WORD PTR $S1363_i
	call	_GetTargADP
	add	sp,18
; Line 4306
	mov	ax,40
	imul	WORD PTR $S1363_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-20]	;tangle
	sub	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-18],ax	;relangle
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,28672
	jle	$I3074
; Line 4307
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,-32768
	jmp	SHORT $L20137
	nop	
$I3074:
	cmp	WORD PTR [bp-18],0	;relangle
	jge	$I3076
; Line 4310
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,-28672
	jmp	SHORT $L20137
$I3076:
; Line 4313
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,28672
$L20137:
	sub	ax,WORD PTR _ps[bx+20]
	mov	WORD PTR _droll,ax
; Line 4314
; Line 4316
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	push	WORD PTR _ps[bx+20]
	call	_abs
	add	sp,2
	cmp	ax,26624
	jl	$I3078
; Line 4317
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	cmp	WORD PTR _ps[bx+18],0
	jge	$I3082
; Line 4318
	mov	WORD PTR _pdest,-24576
; Line 4319
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I3078:
; Line 4323
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	cmp	WORD PTR _ps[bx+18],0
	jge	$I3082
; Line 4324
	mov	ax,WORD PTR _ps[bx+18]
	mov	WORD PTR _pdest,ax
; Line 4325
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I3082:
; Line 4326
	mov	WORD PTR _pdest,-12288
; Line 4327
; Line 4328
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_SplitS	ENDP
; Line 4331
	PUBLIC	_ReArmWingman
_ReArmWingman	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	di
	push	si
;	cnt = -2
;	ptemp = -6
; Line 4335
	mov	WORD PTR [bp-2],0	;cnt
	jmp	SHORT $F3088
$FC3089:
; Line 4336
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$L20139
	test	cl,2
	je	$L20139
	mov	ax,46
	imul	WORD PTR [bp-2]	;cnt
	mov	si,ax
	cmp	WORD PTR _bv[si+2],-1
	jne	$L20139
	test	ch,4
	je	$L20139
	test	cl,32
	jne	$L20139
; Line 4338
	push	WORD PTR _ps[bx+22]
	mov	di,bx
	call	_GetPlanePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	ax,WORD PTR es:[bx+32]
	mov	WORD PTR _ps[di+34],ax
; Line 4339
	mov	ax,WORD PTR es:[bx+34]
	mov	WORD PTR _ps[di+36],ax
; Line 4340
	and	BYTE PTR _bv[si+20],31
; Line 4341
; Line 4342
$L20139:
	inc	WORD PTR [bp-2]	;cnt
$F3088:
	mov	ax,WORD PTR [bp-2]	;cnt
	cmp	WORD PTR _NPLANES,ax
	jg	$FC3089
; Line 4343
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_ReArmWingman	ENDP
_TEXT	ENDS
END
