;	Static Name Aliases
;
;	$S1399_dog	EQU	dog
;	$S1358_psi	EQU	psi
;	$S1359_i	EQU	i
;	$S1361_xd	EQU	xd
;	$S1362_yd	EQU	yd
;	$S1363_zd	EQU	zd
;	$S1364_dist	EQU	dist
;	$S1365_angl	EQU	angl
;	$S1367_dpitch	EQU	dpitch
;	$S2809_aiptype	EQU	aiptype
;	$S3118_WasInFront	EQU	WasInFront
	TITLE   C:\PLANES.C
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
PUBLIC  _PlanesLaunched
PUBLIC  _lastcatused
PUBLIC  _AIWingMan
PUBLIC  _tempvar
PUBLIC  _sotnum
PUBLIC  _tempbehavevar
PUBLIC  _friendfire
PUBLIC  _enemyfire
PUBLIC  _MyWingy
PUBLIC  _OtherAIDo
PUBLIC  _OtherAITime
PUBLIC  _AIWingMenu
PUBLIC  _AIWingMenuTime
EXTRN	_PostHole:NEAR
EXTRN	_FindEmptyMissileSlot2:NEAR
EXTRN	_GetAIBase:NEAR
EXTRN	_AIGoHome:NEAR
EXTRN	_AIGoHome2:NEAR
EXTRN	_BaseBracket:NEAR
EXTRN	_CheckAISix:NEAR
EXTRN	_GetWayPointChanges:NEAR
EXTRN	_GETTIME:FAR
EXTRN	_GorillaBomb:NEAR
EXTRN	_FirstTargInGroup:NEAR
EXTRN	_itoa:NEAR
EXTRN	_DoNextWayPt:NEAR
EXTRN	_PlaneLaunched:NEAR
EXTRN	_GetQHeight:NEAR
EXTRN	_labs:NEAR
EXTRN	_Langle:NEAR
EXTRN	_GetNextLaunch:NEAR
EXTRN	_firemissile2:NEAR
EXTRN	_Dist2D:NEAR
EXTRN	_EvadeMissile:NEAR
EXTRN	_LaunchCall:NEAR
EXTRN	_GetWayXYZ:NEAR
EXTRN	_CheckWingmanSix:NEAR
EXTRN	_EngageTrain:NEAR
EXTRN	_rng:NEAR
EXTRN	_Message:NEAR
EXTRN	_GetSortInfo:NEAR
EXTRN	_NSpeech:NEAR
EXTRN	_Speech:NEAR
EXTRN	_RsignalOne:NEAR
EXTRN	_NoAccel:NEAR
EXTRN	_sinX:NEAR
EXTRN	_LogIt:NEAR
EXTRN	_Ready5:NEAR
EXTRN	_UpdateInterceptGroup:NEAR
EXTRN	_JustPutHere:NEAR
EXTRN	_LGetTargADP:NEAR
EXTRN	_strcat:NEAR
EXTRN	_SetUpLaunch:NEAR
EXTRN	_Rsignal:NEAR
EXTRN	_DoAltHover:NEAR
EXTRN	_ReturnBaseInfo:NEAR
EXTRN	_LFlyTo:NEAR
EXTRN	_rng2:NEAR
EXTRN	_LDist2D:NEAR
EXTRN	_GetPlayerHelp:NEAR
EXTRN	_IndirectWPCorrection:NEAR
EXTRN	_SetUpWingman:NEAR
EXTRN	_absL:NEAR
EXTRN	_ProcessOtherComm:NEAR
EXTRN	_UpdateWing:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_SARWait:NEAR
EXTRN	_GetDAltSpeed:NEAR
EXTRN	_GetSquadLeader:NEAR
EXTRN	__aNlmul:NEAR
EXTRN	_Isin:NEAR
EXTRN	_SAR:NEAR
EXTRN	_SetUpCAP1:NEAR
EXTRN	_IsLand:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_TrgMul:NEAR
EXTRN	_GetBehaviorLeader:NEAR
EXTRN	_SetUpCAP2:NEAR
EXTRN	_CheckTurnStuff:NEAR
EXTRN	__aNuldiv:NEAR
EXTRN	_Icos:NEAR
EXTRN	_SetUpCAP3:NEAR
EXTRN	_AICarrierLand:NEAR
EXTRN	_CAPTurn1:NEAR
EXTRN	_xydist:NEAR
EXTRN	_CAPTurn2:NEAR
EXTRN	_gotcha:NEAR
EXTRN	_sinXL:NEAR
EXTRN	_CAPLeg1:NEAR
EXTRN	_RestoreCover:NEAR
EXTRN	_CAPLeg2:NEAR
EXTRN	_Sound:NEAR
EXTRN	_IsBoat:NEAR
EXTRN	_StartASmoke:NEAR
EXTRN	_cosXL:NEAR
EXTRN	_IsBombing:NEAR
EXTRN	_FlyCruise:NEAR
EXTRN	_CheckAITarget:NEAR
EXTRN	_FriendStatus:NEAR
EXTRN	_GetPlanePtr:NEAR
EXTRN	_TranslateBehavior:NEAR
EXTRN	_MoveAIToCat:NEAR
EXTRN	_GetMissilePtr:NEAR
EXTRN	_LetNextPlaneLand:NEAR
EXTRN	_FriendMatch:NEAR
EXTRN	_GetRadarPtr:NEAR
EXTRN	_FlyWPFollowPlayer:NEAR
EXTRN	_FollowPlayer:NEAR
EXTRN	_FlyWayPoint:NEAR
EXTRN	_GorillaCover:NEAR
EXTRN	_FriendMatchType:NEAR
EXTRN	_RearCover:NEAR
EXTRN	_cosX:NEAR
EXTRN	_ShowJettison:NEAR
EXTRN	_UpdateOurWPS:NEAR
EXTRN	_SARCAP0:NEAR
EXTRN	_Formation:NEAR
EXTRN	_abs:NEAR
EXTRN	_SARCAP1:NEAR
EXTRN	_SARCAP2:NEAR
EXTRN	_BracketLeft:NEAR
EXTRN	_CloseEnoughFor:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_SARCAP3:NEAR
EXTRN	_BracketRight:NEAR
EXTRN	_ARCTAN:NEAR
EXTRN	_FlyStraight:NEAR
EXTRN	_DoOClockCall:NEAR
EXTRN	_Immelmann:NEAR
EXTRN	_CheckRadarSet:NEAR
EXTRN	_FindEmptyMissileSlotP:NEAR
EXTRN	_SplitS:NEAR
EXTRN	_CloseInFight:NEAR
EXTRN	_Jink2:NEAR
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_REALFLIGHT:WORD
EXTRN	_Txt:BYTE
EXTRN	_Rp3D:WORD
EXTRN	_Fticks:WORD
EXTRN	_Speedy:WORD
EXTRN	_whichourcarr:WORD
EXTRN	_LastCall:WORD
EXTRN	_OurLoadOut:WORD
EXTRN	_MyMSGTYP:WORD
EXTRN	_Night:WORD
EXTRN	_msgtime:WORD
EXTRN	_FrameRate:WORD
_BSS      SEGMENT
COMM NEAR	_olddog:	BYTE:	 2
_BSS      ENDS
EXTRN	_Gtime:WORD
EXTRN	_Direction:WORD
_BSS      SEGMENT
COMM NEAR	_planecnt:	BYTE:	 2
_BSS      ENDS
EXTRN	_trs:BYTE
EXTRN	_ss:BYTE
_BSS      SEGMENT
COMM NEAR	_lfpx:	BYTE:	 4
COMM NEAR	_pdest:	BYTE:	 2
COMM NEAR	_lfpy:	BYTE:	 4
COMM NEAR	_droll:	BYTE:	 2
COMM NEAR	_lox:	BYTE:	 4
COMM NEAR	_loy:	BYTE:	 4
COMM NEAR	_AIBOMBX:	BYTE:	 4
COMM NEAR	_AIBOMBY:	BYTE:	 4
COMM NEAR	_oldFPX:	BYTE:	 4
_BSS      ENDS
EXTRN	_NTARGET:WORD
_BSS      SEGMENT
COMM NEAR	_AITTGT:	BYTE:	 2
COMM NEAR	_oldFPZ:	BYTE:	 4
_BSS      ENDS
EXTRN	_NPLANES:WORD
_BSS      SEGMENT
COMM NEAR	_oldAltval:	BYTE:	 2
COMM NEAR	_AITREL:	BYTE:	 2
_BSS      ENDS
EXTRN	_Rdrs:BYTE
_BSS      SEGMENT
COMM NEAR	_OurWingName:	 1:	 20
COMM NEAR	_AIRTGT:	BYTE:	 2
_BSS      ENDS
EXTRN	_ps:BYTE
EXTRN	_ms:BYTE
EXTRN	_DESIGNATED:WORD
EXTRN	_LOCKED:WORD
_BSS      SEGMENT
COMM NEAR	_WingID:	 2:	 3
_BSS      ENDS
EXTRN	_Px:WORD
EXTRN	_aipaths:BYTE
EXTRN	_Py:WORD
_BSS      SEGMENT
COMM NEAR	_bv:	 46:	 70
_BSS      ENDS
EXTRN	_ORDNANCE:BYTE
EXTRN	_aiwaypoints:BYTE
_BSS      SEGMENT
COMM NEAR	_ailoc:	 8:	 70
_BSS      ENDS
EXTRN	_PxLng:DWORD
EXTRN	_PyLng:DWORD
_BSS      SEGMENT
COMM NEAR	_paratroopers:	 8:	 20
_BSS      ENDS
EXTRN	_OurHead:WORD
_BSS      SEGMENT
COMM NEAR	_behavecommands:	BYTE:	 2
_BSS      ENDS
EXTRN	_OurRoll:WORD
_BSS      SEGMENT
COMM NEAR	_PlayerCat:	BYTE:	 2
COMM NEAR	_OurCallSign:	 1:	 20
COMM NEAR	_OurPath:	BYTE:	 2
_BSS      ENDS
EXTRN	_Knots:WORD
_BSS      SEGMENT
COMM NEAR	_LASTPLANE:	BYTE:	 2
COMM NEAR	_DOINVISIBLE:	BYTE:	 2
_BSS      ENDS
EXTRN	_Alt:WORD
_BSS      SEGMENT
COMM NEAR	_ptype:	BYTE:	 4
COMM NEAR	_GLowDroll:	BYTE:	 2
_BSS      ENDS
EXTRN	_FIRST_ENEMY_TRACE:WORD
_BSS      SEGMENT
COMM NEAR	_carrmoveok:	BYTE:	 2
_BSS      ENDS
EXTRN	_FPARAMS:BYTE
_BSS      SEGMENT
COMM NEAR	_gt:	 12:	 60
_BSS      ENDS
EXTRN	_TSpeed:WORD
_BSS      SEGMENT
COMM NEAR	_firstbehaveshow:	BYTE:	 2
COMM NEAR	_NGTARGETS:	BYTE:	 2
_BSS      ENDS
EXTRN	_Rtime:WORD
_BSS      SEGMENT
COMM NEAR	_warstatus:	BYTE:	 2
COMM NEAR	_ENEMYNODIE:	BYTE:	 2
_BSS      ENDS
EXTRN	_detected:WORD
_BSS      SEGMENT
COMM NEAR	_planelanding:	BYTE:	 2
_BSS      ENDS
EXTRN	_atarg:WORD
_BSS      SEGMENT
COMM NEAR	_landingstatus:	BYTE:	 2
_BSS      ENDS
EXTRN	_xlast:BYTE
_BSS      SEGMENT
COMM NEAR	_KnockItOffStatus:	BYTE:	 2
_BSS      ENDS
EXTRN	_ylast:BYTE
_BSS      SEGMENT
COMM NEAR	_lastCounter:	BYTE:	 2
_BSS      ENDS
EXTRN	_zlast:BYTE
_BSS      SEGMENT
COMM NEAR	_lastOClock:	BYTE:	 2
COMM NEAR	_tempgotcha:	BYTE:	 2
COMM NEAR	_minTimeAloft:	BYTE:	 2
COMM NEAR	_TotalGameTicks:	BYTE:	 4
_BSS      ENDS
EXTRN	_CloseGuy:WORD
_DATA      SEGMENT
$SG1424	DB	'(RIO)Cleared To Return',  00H
$SG1428	DB	'(CARRIER) Knock It Off',  00H
	ORG	$+28
$SG1737	DB	'(CARRIER) Knock It Off',  00H
$SG1878	DB	'Gone Winchester',  00H
$SG1958	DB	'Guns',  00H
$SG2045	DB	'Reforming on wing',  00H
$SG2812	DB	'Out of missiles!',  00H
$SG2814	DB	' ',  00H
$SG2820	DB	', ',  00H
$SG2822	DB	' Sparrows',  00H
$SG2825	DB	' Sidewinders',  00H
$SG2828	DB	' AMRAAMs',  00H
$SG2831	DB	' Phoenixs',  00H
$SG2833	DB	' Bombs',  00H
$SG2842	DB	'Radar ',  00H
$SG2844	DB	'Engine ',  00H
$SG2846	DB	'Controls ',  00H
$SG2848	DB	'Damaged!',  00H
$SG2851	DB	'A.O.K',  00H
$SG2854	DB	'Doing Fine',  00H
$SG2857	DB	'Systems Nominal',  00H
$SG2859	DB	'Good',  00H
$SG2868	DB	'1 Bracket Left, 2 Bracket Right, 3 High, 4 Low, 5 Straight',  00H
$SG2870	DB	'1 Parade, 2 Cruise, 3 Combat Spread',  00H
$SG2872	DB	'Sanitize 1 Left, 2 Right, 3 Front, 4 Back',  00H
$SG2874	DB	'Negative 1 1000, 2 2000, ... , 9 9000, 0 10000 Ft Verticle S'
	DB	'eperation',  00H
$SG2876	DB	'Positive 1 1000, 2 2000, ... , 9 9000, 0 10000 Ft Verticle S'
	DB	'eperation',  00H
$SG2911	DB	'Engaging ',  00H
$SG2915	DB	'But Sir, That''s a Friendly',  00H
$SG2917	DB	'Bogey Targeted.',  00H
$SG2919	DB	'Requesting Permission to Fire',  00H
$SG2926	DB	'I''m on him.',  00H
$SG2929	DB	'Here I come.',  00H
$SG2932	DB	'My radar''s out',  00H
$SG2936	DB	'Sorted ',  00H
$SG2939	DB	'Rejoining Wing',  00H
$SG2942	DB	'Roger ',  00H
$SG2943	DB	'Returning To Base',  00H
$SG2958	DB	'Bracketing Left.',  00H
$SG2965	DB	'Bracketing Right.',  00H
$SG2972	DB	'Heading Forward.',  00H
$SG2980	DB	'Parade Formation',  00H
$SG2985	DB	'Combat Spread',  00H
$SG2989	DB	'Cruise Formation.',  00H
$SG2994	DB	'Sanitizing Left.',  00H
$SG2999	DB	'Sanitizing Right.',  00H
$SG3004	DB	'Sanitizing Front.',  00H
$SG3009	DB	'Sanitizing Back.',  00H
$SG3019	DB	'Neg. ',  00H
$SG3021	DB	'Pos. ',  00H
$SG3022	DB	' Ft. Verticle Seperation',  00H
$SG3135	DB	'Bombs Away!',  00H
	ORG	$+3
$SG3301	DB	'Bogeys ',  00H
$SG3302	DB	', ',  00H
$SG3305	DB	'Clean',  00H
$SG3347	DB	'160',  00H
$SG3350	DB	'120',  00H
$SG3353	DB	'80',  00H
$SG3356	DB	'40',  00H
$SG3359	DB	'Contacts, ',  00H
$SG3361	DB	'Contact, ',  00H
$SG3362	DB	', ',  00H
$SG3363	DB	', ',  00H
$SG3366	DB	'in the weeds',  00H
$SG3368	DB	'Clean,',  00H
$SG3452	DB	'Clean',  00H
$SG3470	DB	'Fox 1!',  00H
$SG3472	DB	'Fox 2!',  00H
$SG3474	DB	'Fox 3!',  00H
$SG3476	DB	'Fox 3!',  00H
$SG3482	DB	'(Elf)',  00H
$SG3485	DB	'(Bigmac)',  00H
	ORG	$-1031
_lastcatused	DW	04H
_sotnum	DW	0fc19H
_friendfire	DW	00H
_enemyfire	DW	00H
_PlanesLaunched	DW	00H
_AIWingMan	DW	0fc19H
_tempvar	DW	01H
_tempbehavevar	DW	00H
_MyWingy	DW	00H
_OtherAIDo	DW	00H
_OtherAITime	DW	00H
_AIWingMenu	DW	00H
_AIWingMenuTime	DW	00H
$S1399_dog	DW	00H
	ORG	$+874
$S3118_WasInFront	DW	00H
_DATA      ENDS
_BSS      SEGMENT
	ORG	$+14
$S1358_psi	DW 01H DUP (?)
	ORG	$-12
$S1359_i	DW 01H DUP (?)
$S1361_xd	DW 01H DUP (?)
$S1362_yd	DW 01H DUP (?)
$S1363_zd	DW 01H DUP (?)
	ORG	$-10
$S1364_dist	DW 01H DUP (?)
	ORG	$-4
$S1365_angl	DW 01H DUP (?)
	ORG	$+10
$S1367_dpitch	DW 01H DUP (?)
	ORG	$+2
$S2809_aiptype	DW 02H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 8
; Line 9
; Line 10
; Line 11
; Line 12
; Line 19
; Line 13
; Line 15
; Line 16
; Line 18
; Line 19
; Line 20
; Line 21
; Line 22
; Line 23
; Line 24
; Line 25
; Line 169
	PUBLIC	_doplanes
_doplanes	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,42
	call	__aNchkstk
	push	di
	push	si
;	numldroll = -28
;	numnldroll = -20
;	turnval = -34
;	alteffectval = -2
;	alteffectmax = -12
;	prewing = -32
;	fdroll = -6
;	ldroll = -26
;	minpassed = -10
;	z = -30
;	n = -38
;	droll1 = -40
;	droll2 = -42
;	maxrollval = -4
;	lastbvspeed = -36
;	maxspeedchng = -22
;	tempplane = -18
;	ldrollstat = -14
;	maxfspdchng = -8
; Line 179
	sub	ax,ax
; Line 190
	mov	al,BYTE PTR _Rtime
	and	ax,12
	sar	ax,1
	sar	ax,1
	add	ax,WORD PTR _FIRST_ENEMY_TRACE
; Line 191
	mov	cx,18
	imul	cx
	mov	bx,ax
	sub	ax,ax
	mov	WORD PTR _trs[bx+2],ax
	mov	WORD PTR _trs[bx],ax
; Line 192
	mov	ax,60
	cwd	
	push	dx
	push	ax
	mov	cx,25
	sub	bx,bx
	push	bx
	push	cx
	mov	ax,WORD PTR _Fticks
	cwd	
	push	dx
	push	ax
	mov	si,ax
	mov	di,dx
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-22],ax	;maxspeedchng
; Line 193
	mov	ax,60
	cwd	
	push	dx
	push	ax
	mov	ax,si
	mov	dx,di
	shl	si,1
	rcl	di,1
	shl	si,1
	rcl	di,1
	add	si,ax
	adc	di,dx
	shl	si,1
	rcl	di,1
	push	di
	push	si
	call	__aNldiv
	mov	WORD PTR [bp-8],ax	;maxfspdchng
; Line 198
	cmp	WORD PTR _AIWingMan,-999
	je	$I1420
; Line 199
	mov	ax,40
	imul	WORD PTR _AIWingMan
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],1
	jne	$I1420
; Line 200
	mov	WORD PTR _AIWingMan,-999
; Line 201
; Line 202
$I1420:
; Line 207
	mov	ax,WORD PTR $S1399_dog
	mov	WORD PTR _olddog,ax
; Line 208
	mov	WORD PTR $S1399_dog,0
; Line 209
	mov	WORD PTR _carrmoveok,1
; Line 225
	call	_ProcessOtherComm
; Line 226
	cmp	WORD PTR _minTimeAloft,0
	je	$I1422
; Line 228
	mov	ax,3600
	cwd	
	push	dx
	push	ax
	push	WORD PTR _TotalGameTicks+2
	push	WORD PTR _TotalGameTicks
	call	__aNuldiv
	cmp	ax,WORD PTR _minTimeAloft
	jl	$I1422
; Line 229
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1424
	push	ax
	call	_Message
	add	sp,4
; Line 230
	mov	ax,4
	push	ax
	call	_Speech
	add	sp,2
; Line 231
	sub	ax,ax
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,-999
	push	cx
	push	cx
	push	WORD PTR _Alt
	sub	cx,cx
	mov	dx,16
	sub	cx,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	cx
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	mov	cx,-1
	push	cx
	mov	cx,44
	push	cx
	call	_LogIt
	add	sp,24
; Line 232
	mov	WORD PTR _minTimeAloft,0
; Line 233
; Line 234
$I1422:
; Line 236
	mov	ax,WORD PTR _Alt
	cmp	WORD PTR _KnockItOffStatus,ax
	jbe	$I1427
	cmp	WORD PTR _KnockItOffStatus,1
	jbe	$I1427
; Line 237
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG1428
	push	ax
	call	_Message
	add	sp,4
; Line 238
	mov	ax,79
	push	ax
	call	_Speech
	add	sp,2
; Line 239
	mov	WORD PTR _KnockItOffStatus,1
; Line 240
; Line 242
$I1427:
	mov	ax,WORD PTR _lastOClock
	cmp	WORD PTR _Gtime,ax
	jle	$I1429
; Line 243
	call	_DoOClockCall
; Line 244
; Line 246
$I1429:
	mov	WORD PTR $S1359_i,0
	mov	WORD PTR $S1358_psi,OFFSET _ps
	jmp	$F1430
$I1435:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],64
	je	$I1437
	push	WORD PTR _ps[bx+18]
	call	_abs
	add	sp,2
	cmp	ax,512
	jge	$I1437
; Line 261
$L20037:
	mov	WORD PTR _GLowDroll,1
; Line 262
; Line 263
	jmp	SHORT $I1438
	nop	
$I1437:
; Line 265
	mov	WORD PTR _GLowDroll,0
; Line 266
$I1438:
; Line 268
	mov	WORD PTR [bp-14],0	;ldrollstat
; Line 269
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
	mov	WORD PTR [bp-36],ax	;lastbvspeed
; Line 270
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	and	BYTE PTR _ps[bx+24],127
; Line 278
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	je	$I1439
; Line 279
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+16],cx
; Line 283
$I1439:
	call	_GetDestinationXYZ
; Line 285
	call	_GetDestinationAngles
; Line 288
	call	_ChooseBehavior
; Line 291
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,32
	jne	$I1443
	test	ch,128
	je	$I1442
$I1443:
; Line 292
	mov	WORD PTR _droll,0
; Line 293
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	je	$JCC524
	jmp	$I1461
$JCC524:
; Line 294
	mov	WORD PTR _bv[bx],OFFSET _FlyStraight
; Line 295
	mov	WORD PTR _GLowDroll,0
; Line 296
; Line 297
; Line 298
	jmp	$I1461
$I1442:
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+25],2
	je	$I1446
; Line 299
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$I1447
; Line 300
	call	_AICarrierLand
; Line 301
; Line 302
	jmp	SHORT $I1448
$I1447:
; Line 303
	call	_Landing
; Line 304
$I1448:
; Line 305
	push	WORD PTR $S1359_i
	call	_CheckDetection
	add	sp,2
	cmp	ax,-999
	jne	$JCC592
	jmp	$I1461
$JCC592:
; Line 306
	call	_Jink2
; Line 307
; Line 308
; Line 313
	jmp	$I1461
	nop	
$I1446:
	mov	al,BYTE PTR _Rtime
	inc	al
	xor	al,BYTE PTR $S1359_i
	test	al,3
	je	$I1453
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],64
	je	$I1452
	mov	al,BYTE PTR $S1359_i
	xor	al,BYTE PTR _Rtime
	test	al,3
	je	$I1452
$I1453:
; Line 314
	mov	WORD PTR _droll,0
; Line 315
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],128
	je	$I1454
; Line 316
	mov	WORD PTR _pdest,0
; Line 317
	jmp	SHORT $L20038
$I1454:
; Line 318
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+18]
	mov	WORD PTR _pdest,ax
	jmp	SHORT $L20038
$I1452:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	WORD PTR _ps[bx+24],516
	jne	$I1458
; Line 324
	inc	WORD PTR $S1399_dog
	jmp	SHORT $L20043
	nop	
$I1458:
; Line 337
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
$L20043:
	or	BYTE PTR _ps[bx+24],64
; Line 339
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	call	WORD PTR _bv[bx]
; Line 341
$L20038:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],64
	jne	$I1461
; Line 342
	mov	WORD PTR [bp-14],1	;ldrollstat
; Line 343
$I1461:
; Line 353
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+25],128
	je	$I1462
; Line 354
	call	_TakingOff
; Line 355
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
	mov	WORD PTR [bp-36],ax	;lastbvspeed
; Line 356
; Line 358
$I1462:
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+24],32
	je	$I1464
	mov	WORD PTR _droll,1024
; Line 360
$I1464:
	mov	ax,WORD PTR [bx+24]
	mov	cx,ax
	test	al,16
	je	$I1465
	test	cx,-30688
	jne	$I1465
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FlyCruise
	je	$I1465
	les	si,DWORD PTR _ptype
	cmp	WORD PTR es:[si+38],80
	je	$I1465
	cmp	WORD PTR _bv[bx],OFFSET _EngageTrain
	je	$I1465
; Line 361
	push	WORD PTR $S1359_i
	call	_EvadeMissile
	add	sp,2
; Line 362
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	and	BYTE PTR _ps[bx+24],127
; Line 363
; Line 365
$I1465:
	mov	bx,WORD PTR $S1358_psi
	test	WORD PTR [bx+24],-32640
	je	$JCC893
	jmp	$I1475
$JCC893:
; Line 367
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
	sub	ax,WORD PTR [bp-36]	;lastbvspeed
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR [bp-8]	;maxfspdchng
	jle	$I1467
; Line 368
	mov	WORD PTR [bp-14],1	;ldrollstat
; Line 369
; Line 371
$I1467:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-36]	;lastbvspeed
	cmp	WORD PTR _bv[bx+18],ax
	jle	$I1468
; Line 372
	sub	ax,WORD PTR _bv[bx+18]
	neg	ax
	cmp	ax,WORD PTR [bp-22]	;maxspeedchng
	jle	$I1474
; Line 373
	mov	ax,WORD PTR [bp-22]	;maxspeedchng
	add	ax,WORD PTR [bp-36]	;lastbvspeed
	jmp	SHORT $L20039
$I1468:
; Line 376
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$I1471
; Line 377
	mov	ax,WORD PTR [bp-36]	;lastbvspeed
	sub	ax,WORD PTR _bv[bx+18]
	mov	cx,WORD PTR [bp-22]	;maxspeedchng
	mov	dx,cx
	shl	cx,1
	add	cx,dx
	cmp	ax,cx
	jle	$I1474
; Line 378
	sub	cx,WORD PTR [bp-36]	;lastbvspeed
	neg	cx
	mov	WORD PTR _bv[bx+18],cx
; Line 379
; Line 380
	jmp	SHORT $I1474
$I1471:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-36]	;lastbvspeed
	sub	ax,WORD PTR _bv[bx+18]
	cmp	ax,WORD PTR [bp-22]	;maxspeedchng
	jle	$I1474
	test	BYTE PTR _bv[bx+21],128
	jne	$I1474
; Line 381
	mov	ax,WORD PTR [bp-36]	;lastbvspeed
	sub	ax,WORD PTR [bp-22]	;maxspeedchng
$L20039:
	mov	WORD PTR _bv[bx+18],ax
; Line 382
$I1474:
; Line 384
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],128
	jne	$I1475
	cmp	WORD PTR _bv[bx],OFFSET _Immelmann
	je	$I1475
	cmp	WORD PTR _bv[bx],OFFSET _SplitS
	je	$I1475
; Line 385
	push	WORD PTR $S1359_i
	call	_CheckTurnStuff
	add	sp,2
; Line 386
; Line 388
$I1475:
; Line 390
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],128
	je	$I1476
; Line 391
	mov	cx,2
	mov	ax,WORD PTR _droll
	cwd	
	idiv	cx
	mov	WORD PTR _droll,ax
; Line 393
$I1476:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$I1477
; Line 394
	mov	WORD PTR [bp-34],4	;turnval
; Line 395
; Line 396
	jmp	SHORT $I1482
$I1477:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],8750
	jle	$I1479
; Line 397
	les	bx,DWORD PTR _ptype
	mov	ax,WORD PTR es:[bx+12]
	sub	ax,3
	jmp	SHORT $L20034
$I1479:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],7500
	jle	$I1481
; Line 399
	les	bx,DWORD PTR _ptype
	mov	ax,WORD PTR es:[bx+12]
	dec	ax
	dec	ax
	jmp	SHORT $L20034
	nop	
$I1481:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],5000
	jle	$I1483
; Line 401
	les	bx,DWORD PTR _ptype
	mov	ax,WORD PTR es:[bx+12]
	dec	ax
	jmp	SHORT $L20034
$I1483:
; Line 403
	les	bx,DWORD PTR _ptype
	mov	ax,WORD PTR es:[bx+12]
$L20034:
	mov	WORD PTR [bp-34],ax	;turnval
$I1482:
; Line 405
	cmp	WORD PTR [bp-34],0	;turnval
	jg	$I1485
; Line 406
	les	bx,DWORD PTR _ptype
	cmp	WORD PTR es:[bx+12],1
	jg	$I1486
; Line 407
	mov	WORD PTR [bp-2],256	;alteffectval
; Line 408
	jmp	SHORT $I1487
	nop	
$I1486:
; Line 409
	mov	WORD PTR [bp-2],512	;alteffectval
$I1487:
; Line 410
	mov	WORD PTR [bp-12],0	;alteffectmax
; Line 411
; Line 412
	jmp	SHORT $I1488
$I1485:
; Line 413
	les	bx,DWORD PTR _ptype
	cmp	WORD PTR es:[bx+12],1
	jg	$I1489
; Line 414
	mov	ah,BYTE PTR [bp-34]	;turnval
	jmp	SHORT $L20035
$I1489:
; Line 417
	mov	ah,BYTE PTR [bp-34]	;turnval
	shl	ah,1
$L20035:
	shl	ah,1
	sub	al,al
	mov	WORD PTR [bp-2],ax	;alteffectval
; Line 419
	mov	cl,3
	mov	ah,BYTE PTR [bp-34]	;turnval
	dec	ah
	shl	ax,cl
	mov	WORD PTR [bp-12],ax	;alteffectmax
; Line 420
$I1488:
; Line 421
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-32],ax	;prewing
; Line 424
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Immelmann
	je	$I1498
	cmp	WORD PTR _bv[bx],OFFSET _SplitS
	je	$I1498
; Line 425
	push	WORD PTR _droll
	call	_abs
	add	sp,2
	mov	cx,WORD PTR [bp-2]	;alteffectval
	sar	cx,1
	cmp	ax,cx
	jge	$I1492
	cmp	WORD PTR [bp-32],-1	;prewing
	je	$I1492
; Line 426
	mov	cl,4
	jmp	SHORT $L20040
	nop	
$I1492:
	push	WORD PTR _droll
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR [bp-2]	;alteffectval
	jge	$I1494
	cmp	WORD PTR [bp-32],-1	;prewing
	je	$I1494
; Line 428
	mov	cl,3
	jmp	SHORT $L20040
	nop	
$I1494:
	push	WORD PTR _droll
	call	_abs
	add	sp,2
	mov	cx,WORD PTR [bp-2]	;alteffectval
	shl	cx,1
	shl	cx,1
	cmp	ax,cx
	jge	$I1498
; Line 430
	cmp	WORD PTR [bp-32],-1	;prewing
	jne	$I1497
; Line 431
	sar	WORD PTR [bp-2],1	;alteffectval
; Line 432
	jmp	SHORT $I1498
$I1497:
; Line 433
	mov	cl,2
$L20040:
	sar	WORD PTR [bp-2],cl	;alteffectval
$I1498:
; Line 434
; Line 435
; Line 439
	push	WORD PTR [bp-2]	;alteffectval
	mov	ax,WORD PTR [bp-2]	;alteffectval
	neg	ax
	push	ax
	mov	ax,WORD PTR _droll
	push	ax
	call	_rng2
	add	sp,6
	mov	WORD PTR _droll,ax
; Line 440
	mov	ax,WORD PTR [bp-12]	;alteffectmax
	add	ah,32
	mov	WORD PTR [bp-4],ax	;maxrollval
; Line 442
	cmp	WORD PTR [bp-34],0	;turnval
	jg	$I1500
; Line 443
	mov	WORD PTR [bp-4],6144	;maxrollval
; Line 445
$I1500:
	cmp	WORD PTR [bp-4],14885	;maxrollval
	jle	$I1501
; Line 446
	mov	WORD PTR [bp-4],14885	;maxrollval
; Line 448
$I1501:
; Line 449
	mov	ax,WORD PTR _FrameRate
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _droll
	cwd	
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	__aNldiv
; Line 450
	mov	bx,WORD PTR $S1358_psi
	add	ax,WORD PTR [bx+20]
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR [bp-4]	;maxrollval
	jg	$JCC1549
	jmp	$I1502
$JCC1549:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Immelmann
	jne	$JCC1569
	jmp	$I1502
$JCC1569:
	cmp	WORD PTR _bv[bx],OFFSET _SplitS
	jne	$JCC1580
	jmp	$I1502
$JCC1580:
; Line 452
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+20],16384
	jle	$L20004
	mov	ax,1
	jmp	SHORT $L20005
	nop	
	nop	
	nop	
$L20004:
	sub	ax,ax
$L20005:
	push	ax
	call	_abs
	add	sp,2
	or	ax,ax
	je	$I1503
; Line 453
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+20],0
	jge	$L20044
; Line 454
$L20041:
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+20]
	add	ax,WORD PTR [bp-4]	;maxrollval
	neg	ax
	jmp	SHORT $L20036
	nop	
$I1503:
; Line 459
	cmp	WORD PTR _droll,0
	jl	$L20041
; Line 462
$L20044:
	mov	ax,WORD PTR [bp-4]	;maxrollval
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+20]
$L20036:
	mov	WORD PTR _droll,ax
; Line 463
; Line 466
	push	WORD PTR [bp-2]	;alteffectval
	mov	ax,WORD PTR [bp-2]	;alteffectval
	neg	ax
	push	ax
	mov	ax,4
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _droll
	imul	WORD PTR _FrameRate
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR _droll,ax
	push	ax
	call	_rng2
	add	sp,6
	mov	WORD PTR _droll,ax
; Line 467
; Line 476
$I1502:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],128
	jne	$I1512
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	je	$I1512
	mov	si,WORD PTR $S1358_psi
	test	BYTE PTR [si+25],128
	je	$I1510
	cmp	WORD PTR [si],0
	jge	$I1510
	cmp	WORD PTR _bv[bx+38],0
	jl	$I1512
$I1510:
; Line 477
	call	_AvoidMountains
; Line 480
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],128
	je	$I1511
; Line 481
	call	_UpdateHelicopterHPR_SandP
; Line 482
; Line 483
	jmp	SHORT $I1512
	nop	
$I1511:
; Line 484
	call	_UpdateHeadPitchRoll
; Line 486
	call	_UpdateSpeedAndPosition
; Line 487
$I1512:
; Line 488
; Line 490
	cmp	WORD PTR _Gtime,5
	jg	$I1515
; Line 491
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+16],cx
; Line 493
$I1515:
	cmp	WORD PTR [bp-14],0	;ldrollstat
	je	$I1516
; Line 494
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	and	BYTE PTR _ps[bx+24],191
; Line 496
$I1516:
	mov	bx,WORD PTR $S1358_psi
	and	BYTE PTR [bx+24],239
; Line 498
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],128
	jne	$I1518
	mov	ax,WORD PTR _Rtime
	mov	cx,WORD PTR _FrameRate
	shl	cx,1
	shl	cx,1
	cwd	
	idiv	cx
	mov	al,BYTE PTR $S1359_i
	and	ax,3
	mov	cx,dx
	imul	WORD PTR _FrameRate
	cmp	ax,cx
	jne	$I1518
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FlyCruise
	je	$I1518
; Line 499
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+24],32
	jne	$I1518
; Line 500
	call	_search
; Line 504
; Line 505
$I1518:
; Line 506
	cmp	WORD PTR _sotnum,-999
	je	$FC1431
; Line 507
	mov	ax,18
	imul	WORD PTR _sotnum
	mov	bx,ax
	mov	ax,WORD PTR _trs[bx+2]
	or	ax,WORD PTR _trs[bx]
	jne	$FC1431
; Line 508
	mov	WORD PTR _sotnum,-999
; Line 509
; Line 510
; Line 511
	jmp	SHORT $FC1431
$I1433:
; Line 516
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _ps[bx+26],0
; Line 517
; Line 518
$FC1431:
	inc	WORD PTR $S1359_i
	add	WORD PTR $S1358_psi,40
$F1430:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR $S1359_i,ax
	jge	$FB1432
; Line 247
	mov	ax,WORD PTR $S1359_i
	mov	WORD PTR _planecnt,ax
; Line 248
	mov	BYTE PTR _Txt,0
; Line 251
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+24],1
	je	$I1433
; Line 252
	push	WORD PTR [bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR _ptype,ax
	mov	WORD PTR _ptype+2,dx
; Line 255
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+24],2
	je	$I1433
; Line 256
	cmp	WORD PTR _Gtime,5
	jle	$JCC2059
	jmp	$I1435
$JCC2059:
	jmp	$L20037
	nop	
$FB1432:
; Line 521
	mov	ax,WORD PTR _FPARAMS
	mov	dx,WORD PTR _FPARAMS+2
	mov	WORD PTR _oldFPX,ax
	mov	WORD PTR _oldFPX+2,dx
; Line 522
	mov	ax,WORD PTR _FPARAMS+8
	mov	dx,WORD PTR _FPARAMS+10
	mov	WORD PTR _oldFPZ,ax
	mov	WORD PTR _oldFPZ+2,dx
; Line 523
	mov	ax,WORD PTR _Alt
	mov	WORD PTR _oldAltval,ax
; Line 524
	sub	ax,ax
	mov	WORD PTR _OtherAIDo,ax
	push	ax
	mov	ax,-999
	push	ax
	call	_UpdateOurWPS
	add	sp,4
; Line 539
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_doplanes	ENDP
; Line 543
	PUBLIC	_GetAltPitch
_GetAltPitch	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	tpitch = -2
;	tdist = 8
;	destalt = 6
;	orgalt = 4
; Line 546
	mov	ax,WORD PTR [bp+4]	;orgalt
	cmp	WORD PTR [bp+6],ax	;destalt
	jge	$I1530
; Line 547
	push	WORD PTR [bp+8]	;tdist
	sub	ax,WORD PTR [bp+6]	;destalt
	mov	cl,5
	sar	ax,cl
	push	ax
	call	_ARCTAN
	add	sp,4
	neg	ax
	mov	sp,bp
	pop	bp
	ret	
$I1530:
; Line 550
	push	WORD PTR [bp+8]	;tdist
	mov	cl,5
	mov	ax,WORD PTR [bp+6]	;destalt
	sub	ax,WORD PTR [bp+4]	;orgalt
	sar	ax,cl
	push	ax
	call	_ARCTAN
; Line 551
; Line 553
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetAltPitch	ENDP
; Line 559
	PUBLIC	_GetDestinationXYZ
_GetDestinationXYZ	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__aNchkstk
;	byloc = -8
;	bzloc = -10
;	bhead = -4
;	bret = -14
;	heightval = -12
;	b = -2
;	bxloc = -6
; Line 567
	mov	WORD PTR _CloseGuy,0
; Line 569
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+24]
	mov	cx,ax
	test	al,4
	jne	$JCC2212
	jmp	$I1541
$JCC2212:
	test	ch,128
	je	$JCC2220
	jmp	$I1541
$JCC2220:
; Line 571
	lea	ax,WORD PTR [bp-4]	;bhead
	push	ax
	lea	ax,WORD PTR [bp-10]	;bzloc
	push	ax
	lea	ax,WORD PTR [bp-8]	;byloc
	push	ax
	lea	cx,WORD PTR [bp-6]	;bxloc
	push	cx
	push	WORD PTR [bx]
	call	_ReturnBaseInfo
	add	sp,10
	mov	WORD PTR [bp-14],ax	;bret
; Line 574
	mov	ax,WORD PTR [bp-6]	;bxloc
	mov	WORD PTR $S1361_xd,ax
; Line 578
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+25],2
	je	$I1542
; Line 579
	mov	cx,WORD PTR [bp-8]	;byloc
	sub	dx,dx
	shl	cx,1
	rcl	dx,1
	shl	cx,1
	rcl	dx,1
	shl	cx,1
	rcl	dx,1
	shl	cx,1
	rcl	dx,1
	shl	cx,1
	rcl	dx,1
	push	dx
	push	cx
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
	call	_GetQHeight
	add	sp,8
	sar	ax,1
	sar	ax,1
	mov	WORD PTR [bp-12],ax	;heightval
; Line 581
	mov	ax,WORD PTR [bp-8]	;byloc
	mov	WORD PTR $S1362_yd,ax
; Line 584
	cmp	WORD PTR [bp-14],1	;bret
	sbb	ax,ax
	and	al,245
	add	ax,17
	add	ax,WORD PTR [bp-12]	;heightval
	jmp	SHORT $L20046
$I1542:
; Line 586
	mov	ax,190
	imul	WORD PTR _Direction
	add	ax,WORD PTR [bp-8]	;byloc
	mov	WORD PTR $S1362_yd,ax
; Line 587
	sub	ax,WORD PTR [bx+4]
	neg	ax
	push	ax
	mov	ax,WORD PTR [bx+2]
	sub	ax,WORD PTR $S1361_xd
	push	ax
	call	_Dist2D
	add	sp,4
	add	ax,100
	jmp	SHORT $L20046
$I1541:
; Line 592
; Line 595
	mov	ax,WORD PTR _Px
	mov	WORD PTR $S1361_xd,ax
; Line 596
	mov	ax,WORD PTR _Py
	mov	WORD PTR $S1362_yd,ax
; Line 597
	mov	ax,WORD PTR _Alt
$L20046:
	mov	WORD PTR $S1363_zd,ax
; Line 614
; Line 615
; Line 616
	mov	sp,bp
	pop	bp
	ret	

_GetDestinationXYZ	ENDP
; Line 620
	PUBLIC	_GetDestinationAngles
_GetDestinationAngles	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	dx = -2
;	dy = -4
; Line 623
	mov	ax,WORD PTR $S1361_xd
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-2],ax	;dx
; Line 624
	mov	cx,WORD PTR $S1362_yd
	sub	cx,WORD PTR [bx+4]
	mov	WORD PTR [bp-4],cx	;dy
; Line 625
	neg	cx
	push	cx
	push	ax
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR $S1365_angl,ax
; Line 626
	push	WORD PTR [bp-4]	;dy
	push	WORD PTR [bp-2]	;dx
	call	_Dist2D
	add	sp,4
	mov	WORD PTR $S1364_dist,ax
; Line 628
	push	ax
	mov	cl,5
	mov	ax,WORD PTR $S1363_zd
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+6]
	sar	ax,cl
	push	ax
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR _pdest,ax
; Line 629
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],2
	je	$I1556
; Line 630
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+6]
	sub	ax,WORD PTR $S1363_zd
	cmp	ax,250
	jle	$I1556
; Line 631
	sub	WORD PTR _pdest,2048
; Line 632
; Line 633
$I1556:
; Line 646
	mov	ax,4096
	push	ax
	mov	ax,-8192
	push	ax
	push	WORD PTR _pdest
	call	_rng2
	add	sp,6
	mov	WORD PTR _pdest,ax
; Line 649
	mov	ax,12288
	push	ax
	mov	ax,-12288
	push	ax
	mov	ax,WORD PTR $S1365_angl
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+20]
	sub	ax,WORD PTR [bx+16]
	push	ax
	call	_rng2
	mov	WORD PTR _droll,ax
; Line 668
	mov	sp,bp
	pop	bp
	ret	

_GetDestinationAngles	ENDP
; Line 672
	PUBLIC	_TakingOff
_TakingOff	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,38
	call	__aNchkstk
	push	di
	push	si
;	bxloc = -16
;	byloc = -20
;	bzloc = -26
;	bhead = -10
;	bret = -36
;	prewing = -34
;	wingcnt = -24
;	takeoffOK = -22
;	cattemp = -38
;	oldthreathead = -18
;	oldbasespeed = -32
;	behavenum = -30
;	formnum = -8
;	speedval = -6
;	altval = -4
;	headval = -12
;	attack = -14
;	launch = -28
;	wpflag = -2
; Line 678
	mov	WORD PTR [bp-22],0	;takeoffOK
; Line 685
	cmp	WORD PTR _Gtime,5
	jge	$I1577
; Line 686
$L20047:
	sub	ax,ax
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 688
	nop	
$I1577:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx],0
	jge	$I1579
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	si,ax
	cmp	WORD PTR _bv[si+38],0
	jge	$I1579
	cmp	WORD PTR _bv[si+14],-1
	je	$I1579
; Line 689
	mov	di,WORD PTR _bv[si+14]
	mov	ax,di
	shl	di,1
	add	di,ax
	shl	di,1
	add	di,ax
	shl	di,1
	cmp	WORD PTR _aiwaypoints[di+2],-1
	jg	$I1579
	jl	$L20010
	cmp	WORD PTR _aiwaypoints[di],-1
	ja	$I1579
$L20010:
; Line 691
	sub	ax,ax
	mov	WORD PTR _bv[si+18],ax
	mov	WORD PTR _ps[bx+26],ax
; Line 692
	cmp	WORD PTR _bv[si+38],-5
	jle	$L20047
; Line 694
	mov	ax,-1
	sub	ax,WORD PTR _bv[si+38]
	mov	WORD PTR [bp-38],ax	;cattemp
	push	ax
	push	WORD PTR $S1359_i
	call	_MoveAIToCat
	add	sp,4
; Line 695
; Line 696
	jmp	SHORT $L20047
; Line 697
; Line 698
	nop	
$I1579:
; Line 700
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	jne	$I1582
; Line 703
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	si,ax
	sub	ax,ax
	mov	WORD PTR _bv[bx+18],ax
	mov	WORD PTR _ps[si+26],ax
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 704
; Line 706
$I1582:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],128
	jne	$JCC2790
	jmp	$I1583
$JCC2790:
; Line 707
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	si,ax
	cmp	WORD PTR _bv[si+18],100
	jge	$I1584
; Line 708
	cmp	WORD PTR _bv[bx+18],30
	jg	$I1585
; Line 709
	mov	ax,WORD PTR _bv[bx+18]
	mov	WORD PTR [bp-32],ax	;oldbasespeed
; Line 710
	call	WORD PTR _bv[bx]
; Line 711
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-32]	;oldbasespeed
	mov	WORD PTR _bv[bx+18],ax
; Line 712
; Line 713
$I1585:
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	add	WORD PTR _bv[bx+18],3
; Line 714
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	add	WORD PTR _ps[bx+26],3
; Line 715
	mov	WORD PTR _droll,0
; Line 716
; Line 717
	jmp	$I1586
$I1584:
; Line 718
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	mov	cx,ax
	sar	ax,1
	sar	ax,1
	sub	cx,ax
	mov	WORD PTR _bv[bx+18],cx
; Line 719
	lea	ax,WORD PTR [bp-2]	;wpflag
	push	ax
	lea	ax,WORD PTR [bp-28]	;launch
	push	ax
	lea	ax,WORD PTR [bp-14]	;attack
	push	ax
	lea	ax,WORD PTR [bp-12]	;headval
	push	ax
	lea	ax,WORD PTR [bp-4]	;altval
	push	ax
	lea	ax,WORD PTR [bp-6]	;speedval
	push	ax
	lea	cx,WORD PTR [bp-8]	;formnum
	push	cx
	lea	cx,WORD PTR [bp-30]	;behavenum
	push	cx
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _bv[bx+14]
	call	_GetWayPointChanges
	add	sp,18
; Line 720
	cmp	WORD PTR [bp-6],-1	;speedval
	je	$I1587
; Line 721
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-6]	;speedval
	mov	WORD PTR _bv[bx+18],ax
; Line 722
$I1587:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	and	BYTE PTR _ps[bx+25],127
; Line 723
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR $S1359_i
	mov	ax,32
	push	ax
	call	_LogIt
	add	sp,24
; Line 724
$I1586:
; Line 725
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],200
	jge	$I1588
; Line 726
	mov	WORD PTR _pdest,8192
; Line 727
	jmp	$L20047
$I1588:
; Line 728
	mov	WORD PTR _pdest,0
	jmp	$L20047
; Line 730
; Line 732
	nop	
$I1583:
; Line 735
	lea	ax,WORD PTR [bp-10]	;bhead
	push	ax
	lea	ax,WORD PTR [bp-26]	;bzloc
	push	ax
	lea	ax,WORD PTR [bp-20]	;byloc
	push	ax
	lea	ax,WORD PTR [bp-16]	;bxloc
	push	ax
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx]
	call	_ReturnBaseInfo
	add	sp,10
	mov	WORD PTR [bp-36],ax	;bret
	or	ax,ax
	je	$I1590
; Line 737
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	jmp	SHORT $L20050
	nop	
$FC1595:
; Line 740
	mov	ax,WORD PTR [bp-24]	;wingcnt
	cmp	WORD PTR $S1359_i,ax
	jne	$I1597
; Line 741
	cmp	WORD PTR [bp-22],0	;takeoffOK
	jne	$I1601
; Line 742
	mov	WORD PTR [bp-22],1	;takeoffOK
; Line 743
; Line 744
	jmp	SHORT $I1601
$I1597:
; Line 745
	mov	ax,40
	imul	WORD PTR [bp-24]	;wingcnt
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],128
	je	$I1601
; Line 746
	cmp	WORD PTR [bp-22],0	;takeoffOK
	jne	$I1601
; Line 747
	mov	WORD PTR [bp-22],-1	;takeoffOK
; Line 748
; Line 749
$I1601:
; Line 751
; Line 752
	mov	ax,46
	imul	WORD PTR [bp-24]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-24],ax	;wingcnt
; Line 753
$L20048:
	cmp	WORD PTR [bp-24],0	;wingcnt
	jge	$FC1595
; Line 755
	mov	ax,46
	imul	WORD PTR [bp-34]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
$L20050:
	mov	WORD PTR [bp-34],ax	;prewing
	mov	WORD PTR [bp-24],ax	;wingcnt
; Line 756
	or	ax,ax
	jge	$L20048
; Line 757
; Line 758
$I1590:
	cmp	WORD PTR [bp-22],-1	;takeoffOK
	jne	$I1602
; Line 759
	mov	bx,WORD PTR $S1358_psi
	mov	WORD PTR [bx+26],0
; Line 762
	sub	ax,ax
	mov	WORD PTR _droll,ax
	mov	WORD PTR _pdest,ax
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 763
; Line 766
$I1602:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _bv[bx+22],ax
	jle	$I1603
; Line 767
	mov	bx,WORD PTR $S1358_psi
	mov	WORD PTR [bx+26],0
; Line 771
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	sub	ax,ax
	mov	WORD PTR _bv[bx+18],ax
	mov	WORD PTR _pdest,ax
	mov	WORD PTR _droll,ax
	mov	bx,WORD PTR $S1358_psi
	mov	WORD PTR [bx+20],ax
	jmp	$L20047
$I1603:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+22],0
	je	$I1606
; Line 775
	mov	WORD PTR _bv[bx+18],10
; Line 776
	mov	WORD PTR _bv[bx+22],0
; Line 777
	mov	bx,WORD PTR $S1358_psi
	mov	WORD PTR [bx+26],10
; Line 779
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx],0
	jge	$I1606
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+38],0
	jl	$I1606
	cmp	WORD PTR _bv[bx+38],4
	jge	$I1606
; Line 787
	push	WORD PTR $S1359_i
	push	WORD PTR _bv[bx+38]
	call	_PlaneLaunched
	add	sp,4
; Line 788
	push	WORD PTR $S1359_i
	call	_GetNextLaunch
	add	sp,2
; Line 789
; Line 791
$I1606:
; Line 793
	mov	WORD PTR _droll,0
; Line 795
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+38]
	mov	WORD PTR [bp-18],ax	;oldthreathead
; Line 797
	cmp	WORD PTR _bv[bx+18],30
	jg	$I1609
; Line 798
	mov	ax,WORD PTR _bv[bx+18]
	mov	WORD PTR [bp-32],ax	;oldbasespeed
; Line 799
	call	WORD PTR _bv[bx]
; Line 800
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-32]	;oldbasespeed
	mov	WORD PTR _bv[bx+18],ax
; Line 801
	mov	bx,WORD PTR $S1358_psi
	mov	WORD PTR [bx+20],0
; Line 802
	mov	WORD PTR _droll,0
; Line 803
; Line 805
$I1609:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-18]	;oldthreathead
	mov	WORD PTR _bv[bx+38],ax
; Line 807
	mov	bx,WORD PTR $S1358_psi
	cmp	WORD PTR [bx+26],340
	jge	$I1610
; Line 808
	mov	WORD PTR [bx+18],0
; Line 809
	mov	bx,WORD PTR $S1358_psi
	mov	WORD PTR [bx+20],0
; Line 810
	mov	WORD PTR _droll,0
; Line 811
	jmp	SHORT $I1613
$I1610:
	cmp	WORD PTR [bx+18],1024
	jge	$I1613
; Line 812
	mov	ax,512
	cwd	
	idiv	WORD PTR _FrameRate
	add	WORD PTR [bx+18],ax
; Line 813
	mov	bx,WORD PTR $S1358_psi
	cmp	WORD PTR [bx+20],8192
	jge	$I1613
; Line 814
	mov	WORD PTR _droll,1024
; Line 815
; Line 816
$I1613:
; Line 823
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+18]
	mov	WORD PTR _pdest,ax
; Line 825
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR [bx+26]
	cmp	WORD PTR es:[si+10],ax
	jle	$I1614
; Line 826
	cmp	WORD PTR [bp-36],0	;bret
	jne	$I1615
; Line 827
	mov	ax,20
	cwd	
	idiv	WORD PTR _FrameRate
	add	WORD PTR [bx+26],ax
; Line 828
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,20
$L20051:
	cwd	
	idiv	WORD PTR _FrameRate
	add	WORD PTR _bv[bx+18],ax
; Line 829
; Line 830
	jmp	$I1618
	nop	
$I1615:
; Line 831
	mov	ax,150
	cwd	
	idiv	WORD PTR _FrameRate
	add	WORD PTR [bx+26],ax
; Line 832
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,150
	jmp	SHORT $L20051
	nop	
$I1614:
; Line 835
	push	WORD PTR [bx+14]
	push	WORD PTR [bx+12]
	push	WORD PTR [bx+10]
	push	WORD PTR [bx+8]
	call	_GetQHeight
	add	sp,8
	sar	ax,1
	sar	ax,1
	add	ax,300
	mov	bx,WORD PTR $S1358_psi
	cmp	ax,WORD PTR [bx+6]
	jl	$JCC3682
	jmp	$I1618
$JCC3682:
; Line 836
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	mov	cx,ax
	sar	ax,1
	sar	ax,1
	sub	cx,ax
	mov	WORD PTR _bv[bx+18],cx
; Line 837
	lea	ax,WORD PTR [bp-2]	;wpflag
	push	ax
	lea	ax,WORD PTR [bp-28]	;launch
	push	ax
	lea	ax,WORD PTR [bp-14]	;attack
	push	ax
	lea	ax,WORD PTR [bp-12]	;headval
	push	ax
	lea	ax,WORD PTR [bp-4]	;altval
	push	ax
	lea	ax,WORD PTR [bp-6]	;speedval
	push	ax
	lea	cx,WORD PTR [bp-8]	;formnum
	push	cx
	lea	cx,WORD PTR [bp-30]	;behavenum
	push	cx
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _bv[bx+14]
	call	_GetWayPointChanges
	add	sp,18
; Line 838
	cmp	WORD PTR [bp-6],-1	;speedval
	je	$I1619
; Line 839
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-6]	;speedval
	mov	WORD PTR _bv[bx+18],ax
; Line 840
$I1619:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	and	BYTE PTR _ps[bx+25],127
; Line 841
	sub	ax,ax
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,-999
	push	cx
	push	cx
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR $S1359_i
	mov	cx,32
	push	cx
	call	_LogIt
	add	sp,24
	jmp	$L20047
; Line 849
; Line 850
$I1618:
; Line 851
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	cmp	WORD PTR _bv[bx+18],ax
	jle	$I1620
; Line 852
	mov	WORD PTR _bv[bx+18],ax
; Line 853
$I1620:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_TakingOff	ENDP
; Line 856
	PUBLIC	_AvoidMountains
_AvoidMountains	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__aNchkstk
;	heightval = -14
;	dx = -12
;	dy = -20
;	orgheightval = -6
;	dheight = -16
;	levelarea1 = -2
;	levelarea2 = -4
;	daltclimb = -8
; Line 862
	mov	WORD PTR [bp-4],200	;levelarea2
; Line 863
	mov	ax,50
	mov	WORD PTR [bp-2],ax	;levelarea1
	mov	WORD PTR [bp-8],ax	;daltclimb
; Line 865
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],130
	je	$JCC3923
	jmp	$I1661
$JCC3923:
; Line 868
	mov	al,BYTE PTR $S1359_i
	xor	al,BYTE PTR _Rtime
	test	al,7
	je	$I1632
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],32
	jne	$JCC3953
	jmp	$I1661
$JCC3953:
$I1632:
; Line 869
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],32
	jne	$I1633
; Line 870
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+14]
	push	WORD PTR [bx+12]
	push	WORD PTR [bx+10]
	push	WORD PTR [bx+8]
	call	_IsLand
	add	sp,8
	inc	ax
	jne	$I1636
; Line 871
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1633:
; Line 874
	mov	bx,WORD PTR $S1358_psi
	and	BYTE PTR [bx+25],223
; Line 875
$I1636:
; Line 876
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+14]
	push	WORD PTR [bx+12]
	push	WORD PTR [bx+10]
	push	WORD PTR [bx+8]
	call	_GetQHeight
	add	sp,8
	sar	ax,1
	sar	ax,1
	mov	WORD PTR [bp-14],ax	;heightval
	mov	WORD PTR [bp-6],ax	;orgheightval
; Line 877
	mov	bx,WORD PTR $S1358_psi
	cmp	ax,WORD PTR [bx+6]
	jg	$JCC4051
	jmp	$I1637
$JCC4051:
; Line 878
	test	BYTE PTR [bx+24],32
	je	$I1638
; Line 879
	mov	WORD PTR [bx+24],0
; Line 881
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+4]
	push	WORD PTR [bx+2]
	mov	ax,1
	push	ax
	call	_CloseEnoughFor
	add	sp,6
	or	ax,ax
	je	$I1639
; Line 882
	sub	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,10
	push	ax
	call	_Sound
	add	sp,6
; Line 884
$I1639:
	mov	ax,17
	push	ax
	mov	ax,4
	push	ax
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+14]
	push	WORD PTR [bx+12]
	mov	ax,WORD PTR [bp-14]	;heightval
	add	ax,3
	push	ax
	push	WORD PTR [bx+10]
	push	WORD PTR [bx+8]
	call	_StartASmoke
	add	sp,14
; Line 886
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$I1642
; Line 887
	call	_LetNextPlaneLand
; Line 889
$I1642:
	mov	ax,WORD PTR _atarg
	cmp	WORD PTR $S1359_i,ax
	je	$JCC4172
	jmp	$I1661
$JCC4172:
; Line 890
	mov	WORD PTR _atarg,-1
; Line 891
	mov	sp,bp
	pop	bp
	ret	
; Line 892
; Line 893
	nop	
$I1638:
	or	BYTE PTR [bx+25],32
; Line 894
$L20052:
	mov	WORD PTR _pdest,12288
; Line 895
; Line 896
	mov	sp,bp
	pop	bp
	ret	
$I1637:
; Line 897
	les	bx,DWORD PTR _ptype
	cmp	WORD PTR es:[bx+38],50
	jne	$I1645
; Line 899
	mov	ax,1000
	mov	WORD PTR [bp-2],ax	;levelarea1
	mov	WORD PTR [bp-8],ax	;daltclimb
; Line 900
; Line 901
$I1645:
	cmp	WORD PTR [bp-6],25	;orgheightval
	jle	$I1648
; Line 902
	mov	ax,WORD PTR [bp-14]	;heightval
	add	ax,WORD PTR [bp-2]	;levelarea1
	mov	bx,WORD PTR $S1358_psi
	cmp	ax,WORD PTR [bx+6]
	jle	$I1648
; Line 903
	or	BYTE PTR [bx+25],32
; Line 904
	cmp	WORD PTR _pdest,0
	jge	$I1648
; Line 905
	mov	WORD PTR _pdest,0
; Line 906
; Line 907
$I1648:
; Line 908
; Line 909
	mov	ax,500
	cwd	
	push	dx
	push	ax
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+16]
	call	_sinXL
	add	sp,6
	mov	WORD PTR [bp-12],ax	;dx
	mov	WORD PTR [bp-10],dx
; Line 910
	mov	ax,500
	cwd	
	push	dx
	push	ax
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+16]
	call	_cosXL
	add	sp,6
	neg	ax
	adc	dx,0
	neg	dx
	mov	WORD PTR [bp-20],ax	;dy
	mov	WORD PTR [bp-18],dx
; Line 911
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+12]
	mov	dx,WORD PTR [bx+14]
	add	ax,WORD PTR [bp-20]	;dy
	adc	dx,WORD PTR [bp-18]
	push	dx
	push	ax
	mov	ax,WORD PTR [bx+8]
	mov	dx,WORD PTR [bx+10]
	add	ax,WORD PTR [bp-12]	;dx
	adc	dx,WORD PTR [bp-10]
	push	dx
	push	ax
	call	_GetQHeight
	add	sp,8
	sar	ax,1
	sar	ax,1
	add	ax,WORD PTR [bp-8]	;daltclimb
	mov	WORD PTR [bp-14],ax	;heightval
; Line 912
	mov	bx,WORD PTR $S1358_psi
	cmp	WORD PTR [bx+6],ax
	jge	$I1649
; Line 913
	or	BYTE PTR [bx+25],32
; Line 914
$L20053:
	cmp	WORD PTR _pdest,12288
	jl	$JCC4384
	jmp	$I1661
$JCC4384:
	jmp	$L20052
$I1649:
; Line 918
	add	ax,WORD PTR [bp-4]	;levelarea2
	cmp	ax,WORD PTR [bx+6]
	jle	$I1653
	test	BYTE PTR [bx+25],32
	jne	$I1653
; Line 919
	or	BYTE PTR [bx+25],32
; Line 920
	cmp	WORD PTR _pdest,0
	jge	$I1653
; Line 921
	mov	WORD PTR _pdest,0
; Line 922
$I1653:
; Line 926
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+12]
	mov	dx,WORD PTR [bx+14]
	shl	WORD PTR [bp-20],1	;dy
	rcl	WORD PTR [bp-18],1
	add	ax,WORD PTR [bp-20]	;dy
	adc	dx,WORD PTR [bp-18]
	push	dx
	push	ax
	mov	ax,WORD PTR [bx+8]
	mov	dx,WORD PTR [bx+10]
	shl	WORD PTR [bp-12],1	;dx
	rcl	WORD PTR [bp-10],1
	add	ax,WORD PTR [bp-12]	;dx
	adc	dx,WORD PTR [bp-10]
	push	dx
	push	ax
	call	_GetQHeight
	add	sp,8
	sar	ax,1
	sar	ax,1
	add	ax,WORD PTR [bp-8]	;daltclimb
	mov	WORD PTR [bp-14],ax	;heightval
; Line 927
	mov	bx,WORD PTR $S1358_psi
	cmp	WORD PTR [bx+6],ax
	jge	$I1654
; Line 928
	sub	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-16],ax	;dheight
; Line 929
	or	BYTE PTR [bx+25],32
; Line 930
	cmp	WORD PTR [bp-16],25	;dheight
	jge	$I1655
	cmp	WORD PTR _pdest,4096
	jge	$I1655
; Line 931
	mov	WORD PTR _pdest,4096
; Line 932
; Line 933
	jmp	SHORT $I1657
$I1655:
	cmp	WORD PTR [bp-16],300	;dheight
	jge	$I1657
	cmp	WORD PTR _pdest,8192
	jge	$I1657
; Line 934
	mov	WORD PTR _pdest,8192
; Line 935
; Line 936
$I1657:
	cmp	WORD PTR [bp-16],300	;dheight
	jl	$I1661
	jmp	$L20053
	nop	
$I1654:
	add	ax,WORD PTR [bp-4]	;levelarea2
	cmp	ax,WORD PTR [bx+6]
	jle	$I1661
	test	BYTE PTR [bx+25],32
	jne	$I1661
; Line 941
	or	BYTE PTR [bx+25],32
; Line 942
	cmp	WORD PTR _pdest,0
	jge	$I1661
; Line 943
	mov	WORD PTR _pdest,0
; Line 944
$I1661:
; Line 945
; Line 946
; Line 947
; Line 950
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AvoidMountains	ENDP
; Line 953
	PUBLIC	_UpdateHeadPitchRoll
_UpdateHeadPitchRoll	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
	push	si
;	fdroll = -4
;	ldroll = -8
;	troll = -10
;	odp = -2
;	n = -12
; Line 962
	mov	ax,WORD PTR _FrameRate
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _droll
	cwd	
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	__aNldiv
; Line 963
	mov	WORD PTR [bp-4],ax	;fdroll
; Line 964
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$I1669
	cmp	WORD PTR _bv[bx+38],-1
	jne	$JCC4650
	jmp	$I1668
$JCC4650:
$I1669:
; Line 965
	mov	ax,WORD PTR [bp-4]	;fdroll
	mov	bx,WORD PTR $S1358_psi
	add	WORD PTR [bx+20],ax
; Line 966
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+20]
	call	_abs
	add	sp,2
	cmp	ax,16384
	jle	$I1670
; Line 967
	mov	ax,-32768
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+20]
	jmp	SHORT $L20054
	nop	
$I1670:
; Line 969
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+20]
$L20054:
; Line 970
	mov	cl,3
	sar	ax,cl
	cwd	
	idiv	WORD PTR _FrameRate
	add	WORD PTR [bx+16],ax
; Line 972
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$I1673
	cmp	WORD PTR _bv[bx+38],-1
	je	$I1672
	cmp	WORD PTR _bv[bx+38],0
	je	$I1672
$I1673:
; Line 973
	mov	ax,WORD PTR _pdest
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+18]
	jmp	SHORT $L20055
$I1672:
; Line 975
	mov	ax,4096
	push	ax
	mov	ax,-8192
	push	ax
	mov	ax,2560
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+18]
	push	ax
	call	_rng2
	add	sp,6
$L20055:
	mov	WORD PTR $S1367_dpitch,ax
; Line 976
; Line 987
	push	WORD PTR _droll
	call	_abs
	add	sp,2
	cmp	ax,512
	jg	$I1678
	push	WORD PTR $S1367_dpitch
	call	_abs
	add	sp,2
	cmp	ax,512
	jg	$I1678
	push	WORD PTR $S1359_i
	call	_IsCAPFlier
	add	sp,2
	or	ax,ax
	je	$JCC4828
	jmp	$I1677
$JCC4828:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	je	$JCC4847
	jmp	$I1677
$JCC4847:
$I1678:
; Line 988
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	and	BYTE PTR _ps[bx+24],191
; Line 989
	jmp	$I1679
	nop	
$I1668:
; Line 978
	mov	ax,WORD PTR [bp-4]	;fdroll
	cwd	
	idiv	WORD PTR _FrameRate
	mov	bx,WORD PTR $S1358_psi
	add	WORD PTR [bx+16],ax
; Line 979
	les	bx,DWORD PTR _ptype
	mov	ah,BYTE PTR es:[bx+12]
	shl	ah,1
	sub	al,al
	push	ax
	neg	ax
	push	ax
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+20]
	neg	ax
	push	ax
	call	_rng2
	add	sp,6
	mov	WORD PTR _droll,ax
; Line 980
	mov	ax,WORD PTR _FrameRate
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _droll
	cwd	
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	__aNldiv
; Line 981
	mov	bx,WORD PTR $S1358_psi
	add	WORD PTR [bx+20],ax
; Line 983
	mov	ax,1024
	push	ax
	mov	ax,-1024
	push	ax
	mov	ax,2560
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+18]
	push	ax
	call	_rng2
	add	sp,6
	shl	ax,1
	shl	ax,1
	cwd	
	idiv	WORD PTR _FrameRate
	mov	bx,WORD PTR $S1358_psi
	add	WORD PTR [bx+18],ax
; Line 984
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 985
$I1677:
; Line 990
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],64
$I1679:
; Line 993
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+24],32
	je	$I1681
; Line 995
	cmp	WORD PTR [bx+18],-15872
	jle	$I1681
; Line 996
	mov	WORD PTR $S1367_dpitch,-128
; Line 998
$I1681:
; Line 1003
	cmp	WORD PTR [bx+18],0
	jge	$I1683
	mov	ax,1000
	push	ax
	push	WORD PTR [bx+18]
	call	_sinX
	add	sp,4
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+14]
	push	WORD PTR [bx+12]
	push	WORD PTR [bx+10]
	push	WORD PTR [bx+8]
	mov	si,ax
	call	_GetQHeight
	add	sp,8
	sar	ax,1
	sar	ax,1
	sub	ax,si
	add	ax,20
	mov	bx,WORD PTR $S1358_psi
	cmp	ax,WORD PTR [bx+6]
	jle	$I1683
	test	WORD PTR [bx+24],544
	jne	$I1683
; Line 1004
	mov	WORD PTR $S1367_dpitch,1024
; Line 1005
; Line 1007
$I1683:
	mov	ax,1024
	push	ax
	mov	ax,-1024
	push	ax
	push	WORD PTR $S1367_dpitch
	call	_rng2
	add	sp,6
	mov	WORD PTR $S1367_dpitch,ax
; Line 1008
	shl	ax,1
	shl	ax,1
	cwd	
	idiv	WORD PTR _FrameRate
	mov	bx,WORD PTR $S1358_psi
	add	WORD PTR [bx+18],ax
; Line 1010
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+18]
	call	_abs
	add	sp,2
	cmp	ax,16384
	jle	$I1684
; Line 1011
	mov	bx,WORD PTR $S1358_psi
	add	BYTE PTR [bx+17],128
; Line 1012
	mov	bx,WORD PTR $S1358_psi
	add	BYTE PTR [bx+21],128
; Line 1013
	mov	ax,-32768
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+18]
	mov	WORD PTR [bx+18],ax
; Line 1014
; Line 1015
$I1684:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_UpdateHeadPitchRoll	ENDP
; Line 1025
	PUBLIC	_UpdateSpeedAndPosition
_UpdateSpeedAndPosition	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,72
	call	__aNchkstk
	push	di
	push	si
;	a = -2
;	spd = -18
;	Gspd = -60
;	dx = -44
;	dy = -52
;	spd2 = -30
;	speed2 = -4
;	tspd = -40
;	precval = -48
;	precval2 = -64
;	abspeed = -6
;	alteffect = -56
;	rolleffect = -10
;	rolleffect1 = -14
;	rolleffect2 = -22
;	rolleffect3 = -26
;	rolleffect4 = -34
;	pitchval = -36
; Line 1043
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	cl,3
	mov	bx,WORD PTR $S1359_i
	shl	bx,cl
	push	WORD PTR _ailoc[bx+2]
	push	WORD PTR _ailoc[bx]
	mov	si,bx
	call	__aNldiv
	mov	cx,ax
	mov	ax,40
	mov	bx,dx
	imul	WORD PTR $S1359_i
	mov	di,ax
	cmp	cx,WORD PTR _ps[di+8]
	jne	$L20011
	cmp	bx,WORD PTR _ps[di+10]
	jne	$L20011
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ailoc[si+6]
	push	WORD PTR _ailoc[si+4]
	call	__aNldiv
	cmp	ax,WORD PTR _ps[di+12]
	jne	$L20011
	cmp	dx,WORD PTR _ps[di+14]
	je	$I1704
$L20011:
; Line 1044
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	si,bx
	call	__aNlmul
	mov	cl,3
	mov	bx,WORD PTR $S1359_i
	shl	bx,cl
	mov	WORD PTR _ailoc[bx],ax
	mov	WORD PTR _ailoc[bx+2],dx
; Line 1045
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	mov	si,bx
	call	__aNlmul
	mov	WORD PTR _ailoc[si+4],ax
	mov	WORD PTR _ailoc[si+6],dx
; Line 1046
; Line 1048
$I1704:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],64
	je	$I1707
; Line 1049
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	cwd	
	sub	ax,dx
	sar	ax,1
	cmp	WORD PTR _bv[bx+18],ax
	jle	$I1707
; Line 1050
	mov	WORD PTR _bv[bx+18],ax
; Line 1051
$I1707:
; Line 1052
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	je	$I1709
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],4
	je	$I1714
$I1709:
; Line 1053
	les	bx,DWORD PTR _ptype
	cmp	WORD PTR es:[bx+10],500
	jle	$I1714
; Line 1054
	mov	ax,WORD PTR es:[bx+10]
	sub	ax,200
	mov	WORD PTR [bp-6],ax	;abspeed
; Line 1055
	cmp	ax,450
	jge	$I1711
; Line 1056
	mov	WORD PTR [bp-6],450	;abspeed
; Line 1057
$I1711:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-6]	;abspeed
	cmp	WORD PTR _bv[bx+18],ax
	jle	$I1714
; Line 1058
	cmp	WORD PTR _bv[bx+40],14000
	jle	$I1713
; Line 1059
	mov	ax,100
	imul	WORD PTR _Fticks
	mov	cx,60
	cwd	
	idiv	cx
	sub	WORD PTR _bv[bx+40],ax
; Line 1060
; Line 1061
	jmp	SHORT $I1714
	nop	
$I1713:
; Line 1062
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-6]	;abspeed
	mov	WORD PTR _bv[bx+18],ax
; Line 1063
$I1714:
; Line 1064
; Line 1065
; Line 1066
; Line 1068
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+25],146
	je	$JCC5534
	jmp	$I1715
$JCC5534:
; Line 1069
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	si,ax
	mov	ax,WORD PTR _bv[si+18]
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bx+18]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,-32768
	neg	ax
	sub	dx,dx
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
	mov	WORD PTR [bp-18],ax	;spd
	mov	WORD PTR [bp-16],dx
; Line 1072
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+20]
	call	_abs
	add	sp,2
	cmp	ax,2560
	jle	$I1716
; Line 1075
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;spd
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+20]
	call	_sinXL
	add	sp,6
	push	dx
	push	ax
	call	_absL
	add	sp,4
	sar	dx,1
	rcr	ax,1
	sub	WORD PTR [bp-18],ax	;spd
	sbb	WORD PTR [bp-16],dx
; Line 1076
; Line 1096
$I1716:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],32
	jne	$I1717
; Line 1097
	push	WORD PTR _ps[bx+6]
	call	_GetDAltSpeed
	add	sp,2
	cwd	
	sub	WORD PTR [bp-18],ax	;spd
	sbb	WORD PTR [bp-16],dx
; Line 1098
; Line 1107
$I1717:
	cmp	WORD PTR [bp-16],0
	jge	$I1718
; Line 1108
	sub	ax,ax
	mov	WORD PTR [bp-16],ax
	mov	WORD PTR [bp-18],ax	;spd
; Line 1110
$I1718:
	mov	ax,WORD PTR [bp-18]	;spd
	mov	bx,WORD PTR $S1358_psi
	mov	WORD PTR [bx+26],ax
; Line 1111
	mov	bx,WORD PTR $S1358_psi
	cmp	WORD PTR [bx+26],0
	jg	$I1721
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	si,ax
	cmp	WORD PTR _bv[si+18],0
	jl	$I1721
; Line 1112
	mov	WORD PTR [bx+26],1
; Line 1113
; Line 1114
	jmp	SHORT $I1721
$I1715:
; Line 1115
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$I1721
; Line 1116
	mov	ax,WORD PTR _bv[bx+18]
	mov	bx,WORD PTR $S1358_psi
	mov	WORD PTR [bx+26],ax
; Line 1117
; Line 1118
$I1721:
; Line 1123
	mov	bx,WORD PTR $S1358_psi
	cmp	WORD PTR [bx+6],16000
	jle	$I1723
; Line 1124
	cmp	WORD PTR [bx+18],0
	jle	$I1723
; Line 1125
	mov	WORD PTR [bx+18],0
; Line 1126
$I1723:
; Line 1144
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$I1725
	cmp	WORD PTR _bv[bx+38],-1
	je	$I1724
	cmp	WORD PTR _bv[bx+38],0
	je	$I1724
$I1725:
; Line 1145
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+18]
	jmp	SHORT $L20056
$I1724:
; Line 1147
	mov	ax,WORD PTR _pdest
$L20056:
	mov	WORD PTR [bp-36],ax	;pitchval
; Line 1149
	cmp	WORD PTR _Speedy,1
	je	$JCC5865
	jmp	$I1727
$JCC5865:
; Line 1150
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
	mov	bx,WORD PTR $S1358_psi
	mov	ax,27
	imul	WORD PTR [bx+26]
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
; Line 1151
	mov	WORD PTR [bp-18],ax	;spd
	mov	WORD PTR [bp-16],dx
; Line 1152
	or	dx,dx
	jge	$I1728
; Line 1153
	sub	ax,ax
	mov	WORD PTR [bp-16],ax
	mov	WORD PTR [bp-18],ax	;spd
; Line 1154
$I1728:
	mov	ax,27
	mov	bx,WORD PTR $S1358_psi
	imul	WORD PTR [bx+26]
	mov	cl,6
	sar	ax,cl
	imul	WORD PTR _Fticks
	mov	cx,60
	cwd	
	idiv	cx
; Line 1156
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;spd
	push	WORD PTR [bp-36]	;pitchval
	call	_cosXL
	add	sp,6
	mov	WORD PTR [bp-60],ax	;Gspd
	mov	WORD PTR [bp-58],dx
	or	dx,dx
	jge	$I1729
; Line 1157
	sub	ax,ax
	mov	WORD PTR [bp-58],ax
	mov	WORD PTR [bp-60],ax	;Gspd
; Line 1158
$I1729:
	push	WORD PTR [bp-58]
	push	ax
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+16]
	call	_sinXL
	add	sp,6
	mov	cl,3
	mov	bx,WORD PTR $S1359_i
	shl	bx,cl
	add	WORD PTR _ailoc[bx],ax
	adc	WORD PTR _ailoc[bx+2],dx
; Line 1159
	push	WORD PTR [bp-58]
	push	WORD PTR [bp-60]	;Gspd
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+16]
	call	_cosXL
	add	sp,6
	mov	bx,WORD PTR $S1359_i
	mov	cl,3
	shl	bx,cl
	sub	WORD PTR _ailoc[bx+4],ax
	sbb	WORD PTR _ailoc[bx+6],dx
; Line 1160
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	bx,WORD PTR $S1359_i
	shl	bx,cl
	push	WORD PTR _ailoc[bx+2]
	push	WORD PTR _ailoc[bx]
	mov	si,bx
	call	__aNldiv
	mov	cx,ax
	mov	ax,40
	mov	bx,dx
	imul	WORD PTR $S1359_i
	mov	di,ax
	mov	WORD PTR _ps[di+8],cx
	mov	WORD PTR _ps[di+10],bx
; Line 1161
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ailoc[si+6]
	push	WORD PTR _ailoc[si+4]
	call	__aNldiv
	mov	WORD PTR _ps[di+12],ax
	mov	WORD PTR _ps[di+14],dx
; Line 1162
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;spd
	call	__aNldiv
	push	dx
	push	ax
	push	WORD PTR [bp-36]	;pitchval
	call	_sinX
	jmp	$L20057
	nop	
$I1727:
; Line 1165
	mov	ax,60
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _Fticks
	cwd	
	push	dx
	push	ax
	mov	bx,WORD PTR $S1358_psi
	mov	ax,27
	imul	WORD PTR [bx+26]
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
	call	__aNldiv
	mov	WORD PTR [bp-18],ax	;spd
	mov	WORD PTR [bp-16],dx
; Line 1166
	or	dx,dx
	jge	$I1731
; Line 1167
	sub	ax,ax
	mov	WORD PTR [bp-16],ax
	mov	WORD PTR [bp-18],ax	;spd
; Line 1168
$I1731:
; Line 1169
	push	WORD PTR [bp-16]
	push	ax
	push	WORD PTR [bp-36]	;pitchval
	call	_cosXL
	add	sp,6
	mov	WORD PTR [bp-60],ax	;Gspd
	mov	WORD PTR [bp-58],dx
	or	dx,dx
	jge	$I1732
; Line 1170
	sub	ax,ax
	mov	WORD PTR [bp-58],ax
	mov	WORD PTR [bp-60],ax	;Gspd
; Line 1171
$I1732:
	push	WORD PTR [bp-58]
	push	ax
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+16]
	call	_sinXL
	add	sp,6
	mov	bx,WORD PTR $S1358_psi
	add	WORD PTR [bx+8],ax
	adc	WORD PTR [bx+10],dx
; Line 1172
	push	WORD PTR [bp-58]
	push	WORD PTR [bp-60]	;Gspd
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+16]
	call	_cosXL
	add	sp,6
	mov	bx,WORD PTR $S1358_psi
	sub	WORD PTR [bx+12],ax
	sbb	WORD PTR [bx+14],dx
; Line 1173
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;spd
	push	WORD PTR [bp-36]	;pitchval
	call	_sinXL
$L20057:
	add	sp,6
	mov	bx,WORD PTR $S1358_psi
	add	WORD PTR [bx+6],ax
; Line 1174
; Line 1177
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	je	$I1733
; Line 1178
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	si,bx
	call	__aNlmul
	add	ax,50
	adc	dx,0
	mov	cl,3
	mov	bx,WORD PTR $S1359_i
	shl	bx,cl
	mov	WORD PTR _ailoc[bx],ax
	mov	WORD PTR _ailoc[bx+2],dx
; Line 1179
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	mov	si,bx
	call	__aNlmul
	add	ax,50
	adc	dx,0
	mov	WORD PTR _ailoc[si+4],ax
	mov	WORD PTR _ailoc[si+6],dx
; Line 1180
; Line 1181
	jmp	$I1734
$I1733:
; Line 1184
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	si,bx
	call	__aNlmul
	mov	cx,100
	sub	bx,bx
	push	bx
	push	cx
	mov	di,-100
	mov	cx,-1
	push	cx
	push	di
	push	WORD PTR _FPARAMS+2
	push	WORD PTR _FPARAMS
	mov	di,ax
	mov	WORD PTR [bp-68],di
	mov	WORD PTR [bp-66],dx
	call	__aNldiv
	push	dx
	push	ax
	call	__aNlmul
	add	ax,WORD PTR _FPARAMS
	adc	dx,WORD PTR _FPARAMS+2
	add	ax,WORD PTR [bp-68]
	adc	dx,WORD PTR [bp-66]
	mov	cl,3
	mov	bx,WORD PTR $S1359_i
	shl	bx,cl
	mov	WORD PTR _ailoc[bx],ax
	mov	WORD PTR _ailoc[bx+2],dx
; Line 1186
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	cx,-100
	mov	di,-1
	push	di
	push	cx
	push	WORD PTR _FPARAMS+10
	push	WORD PTR _FPARAMS+8
	mov	di,bx
	call	__aNldiv
	push	dx
	push	ax
	call	__aNlmul
	add	ax,WORD PTR _FPARAMS+8
	adc	dx,WORD PTR _FPARAMS+10
; Line 1187
	mov	cx,100
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	mov	si,ax
	mov	WORD PTR [bp-72],si
	mov	WORD PTR [bp-70],dx
	call	__aNlmul
	add	ax,WORD PTR [bp-72]
	adc	dx,WORD PTR [bp-70]
	mov	WORD PTR _ailoc[di+4],ax
	mov	WORD PTR _ailoc[di+6],dx
; Line 1188
	mov	cx,WORD PTR _FPARAMS
	mov	bx,WORD PTR _FPARAMS+2
	mov	WORD PTR _lfpx,cx
	mov	WORD PTR _lfpx+2,bx
; Line 1189
	mov	cx,WORD PTR _FPARAMS+8
	mov	bx,WORD PTR _FPARAMS+10
	mov	WORD PTR _lfpy,cx
	mov	WORD PTR _lfpy+2,bx
; Line 1190
	mov	cx,WORD PTR _ailoc[di]
	mov	bx,WORD PTR _ailoc[di+2]
	mov	WORD PTR _lox,cx
	mov	WORD PTR _lox+2,bx
; Line 1191
	mov	WORD PTR _loy,ax
	mov	WORD PTR _loy+2,dx
; Line 1192
$I1734:
; Line 1194
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+8]
	mov	dx,WORD PTR [bx+10]
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
	mov	WORD PTR [bx+2],ax
; Line 1195
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+12]
	mov	dx,WORD PTR [bx+14]
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
	mov	WORD PTR [bx+4],ax
; Line 1197
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+24],32
	je	$I1735
; Line 1198
	mov	ax,5
	push	ax
	mov	ax,2
	push	ax
	push	WORD PTR [bx+14]
	push	WORD PTR [bx+12]
	push	WORD PTR [bx+6]
	push	WORD PTR [bx+10]
	push	WORD PTR [bx+8]
	call	_StartASmoke
	add	sp,14
; Line 1199
; Line 1201
$I1735:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _KnockItOffStatus
	cmp	WORD PTR _ps[bx+6],ax
	jae	$I1736
	cmp	ax,1
	jbe	$I1736
	test	WORD PTR _ps[bx+24],-28128
	jne	$I1736
; Line 1202
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG1737
	push	ax
	call	_Message
	add	sp,4
; Line 1203
	mov	ax,79
	push	ax
	call	_Speech
	add	sp,2
; Line 1204
	mov	WORD PTR _KnockItOffStatus,1
; Line 1205
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 1206
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	si,ax
	or	BYTE PTR _ps[si+24],4
; Line 1207
	or	BYTE PTR _bv[bx+21],2
; Line 1208
; Line 1210
$I1736:
	mov	bx,WORD PTR $S1358_psi
	cmp	WORD PTR [bx+6],0
	jl	$JCC6911
	jmp	$I1742
$JCC6911:
; Line 1211
	test	BYTE PTR [bx+24],32
	jne	$I1739
; Line 1212
	push	WORD PTR $S1359_i
	call	_IndirectWPCorrection
	add	sp,2
; Line 1213
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	ax
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+6]
	push	WORD PTR [bx+14]
	push	WORD PTR [bx+12]
	push	WORD PTR [bx+10]
	push	WORD PTR [bx+8]
	push	WORD PTR $S1359_i
	mov	ax,34
	push	ax
	call	_LogIt
	add	sp,24
; Line 1214
; Line 1216
$I1739:
	mov	bx,WORD PTR $S1358_psi
	mov	WORD PTR [bx+24],0
; Line 1218
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+4]
	push	WORD PTR [bx+2]
	mov	ax,1
	push	ax
	call	_CloseEnoughFor
	add	sp,6
	or	ax,ax
	je	$I1740
; Line 1219
	sub	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,10
	push	ax
	call	_Sound
	add	sp,6
; Line 1221
$I1740:
	mov	ax,17
	push	ax
	mov	ax,4
	push	ax
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+14]
	push	WORD PTR [bx+12]
	push	WORD PTR [bx+6]
	push	WORD PTR [bx+10]
	push	WORD PTR [bx+8]
	call	_StartASmoke
	add	sp,14
; Line 1223
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$I1741
; Line 1224
	call	_LetNextPlaneLand
; Line 1226
$I1741:
	mov	ax,WORD PTR _atarg
	cmp	WORD PTR $S1359_i,ax
	jne	$I1742
; Line 1227
	mov	WORD PTR _atarg,-1
; Line 1228
$I1742:
; Line 1251
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_UpdateSpeedAndPosition	ENDP
; Line 1255
	PUBLIC	_Landing
_Landing	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__aNchkstk
;	otherplane = -2
;	dx = -16
;	dy = -22
;	xd = -14
;	yd = -20
;	zd = -24
;	bxloc = -6
;	byloc = -8
;	bzloc = -10
;	bhead = -4
;	bret = -18
;	heightval = -12
; Line 1265
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	je	$I1757
	cmp	WORD PTR _bv[bx],OFFSET _AIGoHome
	jne	$I1756
$I1757:
; Line 1266
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 1267
; Line 1269
$I1756:
	lea	ax,WORD PTR [bp-4]	;bhead
	push	ax
	lea	ax,WORD PTR [bp-10]	;bzloc
	push	ax
	lea	ax,WORD PTR [bp-8]	;byloc
	push	ax
	lea	ax,WORD PTR [bp-6]	;bxloc
	push	ax
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx]
	call	_ReturnBaseInfo
	add	sp,10
	mov	WORD PTR [bp-18],ax	;bret
; Line 1271
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+24]
	mov	cx,ax
	test	al,4
	je	$I1762
; Line 1272
	cmp	WORD PTR $S1364_dist,16
	jae	$I1762
; Line 1274
	test	ch,2
	je	$I1760
; Line 1275
	or	BYTE PTR [bx+25],16
; Line 1277
	jmp	SHORT $I1762
$I1760:
; Line 1278
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AIGoHome
	je	$I1762
; Line 1279
	mov	bx,WORD PTR $S1358_psi
	or	BYTE PTR [bx+25],2
; Line 1280
; Line 1281
$I1762:
; Line 1282
; Line 1283
; Line 1284
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+25],2
	je	$I1764
; Line 1285
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+18],140
	jle	$I1764
; Line 1286
	mov	WORD PTR _bv[bx+18],140
; Line 1287
; Line 1288
$I1764:
; Line 1302
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+25],2
	jne	$JCC7268
	jmp	$I1769
$JCC7268:
; Line 1304
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-2],ax	;otherplane
	or	ax,ax
	jl	$I1767
; Line 1305
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	dx,ax
	test	ah,2
	jne	$I1767
	test	dl,1
	je	$I1767
	test	dl,2
	je	$I1767
	test	dl,32
	jne	$I1767
; Line 1306
	mov	ax,46
	imul	WORD PTR [bp-2]	;otherplane
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 1307
	mov	ax,cx
	imul	WORD PTR [bp-2]	;otherplane
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 1308
	and	BYTE PTR _ps[bx+25],237
; Line 1309
; Line 1310
$I1767:
; Line 1312
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-2],ax	;otherplane
	or	ax,ax
	jl	$I1769
; Line 1313
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	dx,ax
	test	ah,2
	jne	$I1769
	test	dl,1
	je	$I1769
	test	dl,2
	je	$I1769
	test	dl,32
	jne	$I1769
; Line 1314
	mov	ax,46
	imul	WORD PTR [bp-2]	;otherplane
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 1315
	mov	ax,cx
	imul	WORD PTR [bp-2]	;otherplane
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 1316
	and	BYTE PTR _ps[bx+25],237
; Line 1317
; Line 1318
$I1769:
; Line 1319
; Line 1323
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+25],16
	jne	$JCC7449
	jmp	$I1772
$JCC7449:
; Line 1337
	mov	ax,WORD PTR [bp-8]	;byloc
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
	mov	ax,WORD PTR [bp-6]	;bxloc
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
	call	_GetQHeight
	add	sp,8
	sar	ax,1
	sar	ax,1
	mov	WORD PTR [bp-12],ax	;heightval
; Line 1338
	mov	bx,WORD PTR $S1358_psi
	mov	WORD PTR [bx+18],0
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+18]
	mov	WORD PTR [bx+20],ax
; Line 1339
	mov	ax,WORD PTR [bp-4]	;bhead
	mov	bx,WORD PTR $S1358_psi
	mov	WORD PTR [bx+16],ax
; Line 1340
	cmp	WORD PTR [bp-18],1	;bret
	sbb	ax,ax
	and	al,243
	add	ax,15
	add	ax,WORD PTR [bp-12]	;heightval
	mov	bx,WORD PTR $S1358_psi
	mov	WORD PTR [bx+6],ax
; Line 1342
	mov	bx,WORD PTR $S1358_psi
	cmp	WORD PTR [bx+26],0
	jle	$I1771
; Line 1343
	mov	ax,-120
	cwd	
	idiv	WORD PTR _FrameRate
	add	WORD PTR [bx+26],ax
; Line 1344
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,120
	cwd	
	idiv	WORD PTR _FrameRate
	sub	WORD PTR _bv[bx+18],ax
; Line 1345
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1771:
; Line 1346
	mov	WORD PTR [bx+24],0
; Line 1347
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	ax
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR $S1359_i
	mov	ax,33
	push	ax
	call	_LogIt
	add	sp,24
; Line 1348
	push	WORD PTR $S1359_i
	call	_IndirectWPCorrection
; Line 1349
$I1772:
; Line 1357
; Line 1359
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Landing	ENDP
; Line 1366
	PUBLIC	_ReturnToBase
_ReturnToBase	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	si
;	amin = -2
;	j = -4
;	n = -6
; Line 1369
	mov	bx,WORD PTR $S1358_psi
	or	BYTE PTR [bx+24],4
; Line 1371
	mov	WORD PTR [bp-2],32767	;amin
; Line 1372
	mov	WORD PTR [bp-4],3	;j
	jmp	SHORT $F1778
$FC1779:
; Line 1373
	mov	bx,WORD PTR [bp-4]	;j
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _Rdrs[bx+6]
	and	ax,257
	dec	ax
	jne	$I1782
; Line 1375
	mov	si,WORD PTR $S1358_psi
	mov	ax,WORD PTR [si+4]
	sub	ax,WORD PTR _Rdrs[bx+2]
	push	ax
	mov	ax,WORD PTR [si+2]
	sub	ax,WORD PTR _Rdrs[bx]
	push	ax
	call	_xydist
	add	sp,4
	cmp	ax,WORD PTR [bp-2]	;amin
	jge	$I1782
; Line 1376
	mov	cx,WORD PTR [bp-4]	;j
	mov	bx,WORD PTR $S1358_psi
	mov	WORD PTR [bx],cx
; Line 1377
	mov	WORD PTR [bp-2],ax	;amin
; Line 1378
; Line 1379
$I1782:
; Line 1380
	inc	WORD PTR [bp-4]	;j
$F1778:
	mov	ax,WORD PTR _NTARGET
	cmp	WORD PTR [bp-4],ax	;j
	jl	$FC1779
; Line 1381
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_ReturnToBase	ENDP
; Line 1389
	PUBLIC	_search
_search	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,46
	call	__aNchkstk
	push	si
;	targetnum = -26
;	friendflag = -4
;	missilenum = -24
;	imaboat = -36
;	malt = -40
;	mhead = -46
;	mpitch = -18
;	mroll = -22
;	missileangle = -34
;	ddist = -28
;	enemypitch = -20
;	enemyalt = -44
;	pwtargetnum = -38
;	organgl = -30
;	dist = -16
;	signal = -42
;	angl = -6
;	j = -32
;	mrng = -14
;	ssk = -2
;	S = -12
;	tdistnm = -8
; Line 1402
	mov	WORD PTR [bp-36],0	;imaboat
; Line 1410
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR $S1359_i,ax
; Line 1411
	mov	cx,40
	imul	cx
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_IsBoat
	add	sp,2
	or	ax,ax
	je	$I1806
; Line 1412
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],253
; Line 1413
	or	BYTE PTR _bv[bx+21],1
; Line 1414
	mov	WORD PTR [bp-36],1	;imaboat
; Line 1415
; Line 1417
$I1806:
	push	WORD PTR $S1359_i
	call	_FriendStatus
	add	sp,2
	mov	WORD PTR [bp-4],ax	;friendflag
; Line 1418
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],239
; Line 1420
	cmp	WORD PTR [bp-36],0	;imaboat
	je	$JCC7897
	jmp	$I1807
$JCC7897:
	test	BYTE PTR _bv[bx+21],32
	jne	$I1808
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR $S1359_i
	jne	$JCC7923
	jmp	$I1807
$JCC7923:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Formation
	je	$JCC7943
	jmp	$I1807
$JCC7943:
$I1808:
; Line 1421
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Formation
	jne	$I1809
; Line 1422
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR $S1359_i
	call	_AIRadarForwardCheck
	add	sp,6
; Line 1423
$I1809:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _bv[bx+10]
	push	WORD PTR [bp-4]	;friendflag
	lea	ax,WORD PTR [bp-16]	;dist
	push	ax
	lea	ax,WORD PTR [bp-6]	;angl
	push	ax
	les	bx,DWORD PTR _ptype
	push	WORD PTR es:[bx+14]
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+4]
	push	WORD PTR _ps[bx+2]
	call	_RsignalOne
	add	sp,16
	mov	WORD PTR [bp-42],ax	;signal
; Line 1424
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I1811
; Line 1425
	mov	WORD PTR [bp-26],70	;targetnum
; Line 1426
; Line 1427
	jmp	SHORT $I1813
$I1811:
; Line 1428
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR [bp-26],ax	;targetnum
; Line 1429
; Line 1430
	jmp	SHORT $I1813
$I1807:
; Line 1431
	lea	ax,WORD PTR [bp-26]	;targetnum
	push	ax
	push	WORD PTR [bp-4]	;friendflag
	lea	ax,WORD PTR [bp-16]	;dist
	push	ax
	lea	ax,WORD PTR [bp-6]	;angl
	push	ax
	les	bx,DWORD PTR _ptype
	push	WORD PTR es:[bx+14]
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+4]
	push	WORD PTR _ps[bx+2]
	call	_Rsignal
	add	sp,16
	mov	WORD PTR [bp-42],ax	;signal
; Line 1432
$I1813:
; Line 1434
	cmp	WORD PTR [bp-26],-1	;targetnum
	jge	$I1815
; Line 1435
$L20059:
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1437
$I1815:
	cmp	WORD PTR [bp-36],0	;imaboat
	je	$I1818
; Line 1438
	cmp	WORD PTR [bp-26],70	;targetnum
	jne	$I1817
; Line 1439
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	WORD PTR _bv[bx+10],-1
; Line 1440
	jmp	SHORT $I1818
	nop	
$I1817:
; Line 1441
	mov	ax,46
	imul	WORD PTR _planecnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-26]	;targetnum
	mov	WORD PTR _bv[bx+10],ax
$I1818:
; Line 1442
; Line 1445
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-6]	;angl
	mov	WORD PTR [bp-30],ax	;organgl
	sub	ax,WORD PTR _ps[bx+16]
	push	ax
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-6],ax	;angl
; Line 1472
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	and	BYTE PTR _ps[bx+25],191
	test	BYTE PTR _ps[bx+24],4
	je	$JCC8242
	jmp	$I1819
$JCC8242:
	mov	ax,WORD PTR [bp-16]	;dist
	cmp	WORD PTR [bp-42],ax	;signal
	jbe	$I1821
	cmp	WORD PTR [bp-36],0	;imaboat
	jne	$I1820
	cmp	WORD PTR [bp-6],10923	;angl
	jl	$I1820
$I1821:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+42]
	shl	ax,1
	shl	ax,1
	cmp	ax,WORD PTR [bp-16]	;dist
	ja	$JCC8288
	jmp	$I1819
$JCC8288:
	cmp	WORD PTR _Night,0
	je	$JCC8298
	jmp	$I1819
$JCC8298:
$I1820:
; Line 1473
	cmp	WORD PTR _Gtime,5
	jle	$I1822
; Line 1474
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+42]
	inc	ax
	inc	ax
	mov	cl,4
	shl	ax,cl
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	add	WORD PTR _ps[bx+32],cx
; Line 1475
	jmp	SHORT $I1823
$I1822:
; Line 1476
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _ps[bx+32],193
$I1823:
; Line 1477
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+32],192
	jg	$JCC8376
	jmp	$FB1841
$JCC8376:
; Line 1478
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],32
	je	$I1826
	mov	ax,WORD PTR _bv[bx+42]
	shl	ax,1
	shl	ax,1
	cmp	ax,WORD PTR [bp-16]	;dist
	jbe	$I1832
	cmp	WORD PTR _Night,0
	jne	$I1832
$I1826:
; Line 1480
	push	WORD PTR [bp-26]	;targetnum
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-38],ax	;pwtargetnum
	cmp	ax,70
	jge	$I1827
; Line 1481
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _ps[bx+28],ax
	jl	$L20064
	mov	cl,BYTE PTR $S1359_i
	add	cl,al
	test	cl,15
	jmp	SHORT $L20066
	nop	
$I1827:
	cmp	ax,70
$L20066:
	jne	$I1832
; Line 1488
$L20064:
	mov	WORD PTR _tempgotcha,3
; Line 1489
	push	WORD PTR [bp-26]	;targetnum
	call	_gotcha
	add	sp,2
; Line 1490
	mov	WORD PTR _tempgotcha,-999
; Line 1491
; Line 1492
$I1832:
; Line 1494
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	je	$JCC8502
	jmp	$L20059
$JCC8502:
; Line 1496
; Line 1498
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],1
	jne	$L20065
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+42]
	shl	ax,1
	shl	ax,1
	cmp	ax,WORD PTR [bp-16]	;dist
	jbe	$I1836
	cmp	WORD PTR _Night,0
	jne	$I1836
; Line 1502
$L20065:
	or	BYTE PTR _bv[bx+21],16
; Line 1503
; Line 1505
$I1836:
	cmp	WORD PTR _DOINVISIBLE,0
	je	$JCC8562
	jmp	$L20059
$JCC8562:
; Line 1508
	cmp	WORD PTR _Gtime,13
	jge	$JCC8572
	jmp	$L20059
$JCC8572:
; Line 1511
	mov	WORD PTR [bp-32],0	;j
	jmp	$F1839
	nop	
$I1843:
; Line 1522
	mov	ax,40
	imul	WORD PTR [bp-26]	;targetnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
$L20060:
	mov	WORD PTR [bp-44],ax	;enemyalt
; Line 1524
	push	WORD PTR [bp-28]	;ddist
	push	ax
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	call	_GetAltPitch
	add	sp,6
	mov	WORD PTR [bp-20],ax	;enemypitch
; Line 1525
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-20]	;enemypitch
	sub	ax,WORD PTR _ps[bx+18]
	push	ax
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-20],ax	;enemypitch
; Line 1527
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,205
	imul	WORD PTR _bv[bx+42]
	add	ax,3071
	mov	WORD PTR [bp-34],ax	;missileangle
; Line 1534
	mov	ax,20
	imul	WORD PTR $S1359_i
	mov	bx,ax
	add	bx,WORD PTR [bp-32]	;j
	shl	bx,1
	cmp	WORD PTR _ps[bx+34],0
	jg	$JCC8694
	jmp	$I1875
$JCC8694:
	mov	ax,WORD PTR [bp-6]	;angl
	cmp	WORD PTR [bp-34],ax	;missileangle
	jle	$I1847
	mov	ax,WORD PTR [bp-20]	;enemypitch
	cmp	WORD PTR [bp-34],ax	;missileangle
	jg	$I1846
$I1847:
	cmp	WORD PTR [bp-36],0	;imaboat
	jne	$JCC8719
	jmp	$I1875
$JCC8719:
$I1846:
	les	bx,DWORD PTR [bp-12]	;S
	mov	ax,WORD PTR [bp-16]	;dist
	cmp	WORD PTR es:[bx+16],ax
	jb	$JCC8734
	jmp	$I1875
$JCC8734:
	cmp	WORD PTR es:[bx+14],ax
	ja	$JCC8743
	jmp	$I1875
$JCC8743:
	cmp	WORD PTR _OurLoadOut,6
	jne	$JCC8753
	jmp	$I1875
$JCC8753:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	si,ax
	mov	ax,WORD PTR _bv[si+20]
	mov	cx,ax
	test	ah,2
	je	$JCC8776
	jmp	$I1875
$JCC8776:
; Line 1538
	cmp	WORD PTR es:[bx+22],1
	je	$I1851
	test	ch,1
	jne	$I1850
$I1851:
	cmp	WORD PTR es:[bx+22],2
	je	$I1850
	cmp	WORD PTR es:[bx+22],1
	je	$JCC8805
	jmp	$I1875
$JCC8805:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	call	_CheckTailAspect
	add	sp,8
	or	ax,ax
	jne	$JCC8843
	jmp	$I1875
$JCC8843:
$I1850:
; Line 1540
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	or	BYTE PTR _ps[bx+25],64
; Line 1542
	mov	cl,3
	les	bx,DWORD PTR [bp-12]	;S
	mov	ax,WORD PTR es:[bx+14]
	mov	dx,ax
	sar	ax,cl
	sub	dx,ax
	cmp	dx,WORD PTR [bp-16]	;dist
	ja	$JCC8880
	jmp	$I1875
$JCC8880:
; Line 1543
	cmp	WORD PTR [bp-26],70	;targetnum
	jne	$I1853
; Line 1544
	push	WORD PTR $S1359_i
	mov	ax,15
	push	ax
	sub	ax,ax
	push	ax
	call	_FindEmptyMissileSlotP
	jmp	SHORT $L20061
	nop	
$I1853:
; Line 1546
	push	WORD PTR $S1359_i
	mov	ax,15
	push	ax
	sub	ax,ax
	push	ax
	call	_FindEmptyMissileSlot2
$L20061:
	add	sp,6
	mov	WORD PTR [bp-24],ax	;missilenum
; Line 1547
	cmp	ax,-1
	jne	$I1857
; Line 1548
	mov	WORD PTR [bp-2],OFFSET _ss	;ssk
; Line 1549
; Line 1550
	jmp	SHORT $I1858
$I1857:
; Line 1551
	mov	ax,44
	imul	WORD PTR [bp-24]	;missilenum
	add	ax,OFFSET _ss
	mov	WORD PTR [bp-2],ax	;ssk
; Line 1552
$I1858:
; Line 1553
	mov	bx,WORD PTR [bp-2]	;ssk
	cmp	WORD PTR [bx+26],0
	je	$JCC8959
	jmp	$I1875
$JCC8959:
	cmp	WORD PTR [bp-24],-1	;missilenum
	jne	$JCC8968
	jmp	$I1875
$JCC8968:
; Line 1554
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],4
	je	$I1860
; Line 1556
	inc	WORD PTR _friendfire
; Line 1557
; Line 1558
	jmp	SHORT $I1861
	nop	
$I1860:
; Line 1560
	inc	WORD PTR _enemyfire
; Line 1561
$I1861:
; Line 1563
	cmp	WORD PTR [bp-36],0	;imaboat
	je	$I1862
; Line 1564
	mov	WORD PTR [bp-40],15	;malt
; Line 1565
	mov	ax,WORD PTR [bp-30]	;organgl
	mov	WORD PTR [bp-46],ax	;mhead
; Line 1566
	mov	WORD PTR [bp-18],8192	;mpitch
; Line 1567
	mov	WORD PTR [bp-22],0	;mroll
; Line 1568
	mov	ax,1
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	les	bx,DWORD PTR _ptype
	add	bx,26
	mov	si,WORD PTR [bp-32]	;j
	shl	si,1
	push	WORD PTR es:[bx][si]
	mov	cx,-999
	push	cx
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR $S1359_i
	mov	ax,1
	jmp	SHORT $L20062
$I1862:
; Line 1572
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	dec	ax
	dec	ax
	mov	WORD PTR [bp-40],ax	;malt
	or	ax,ax
	jg	$I1864
; Line 1573
	mov	WORD PTR [bp-40],1	;malt
; Line 1574
; Line 1575
$I1864:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-46],ax	;mhead
; Line 1576
	mov	ax,WORD PTR _ps[bx+18]
	sub	ax,1024
	mov	WORD PTR [bp-18],ax	;mpitch
; Line 1577
	mov	ax,WORD PTR _ps[bx+20]
	mov	WORD PTR [bp-22],ax	;mroll
; Line 1578
	sub	ax,ax
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,bx
	les	bx,DWORD PTR _ptype
	lea	bx,WORD PTR [bx+26]
	mov	si,WORD PTR [bp-32]	;j
	shl	si,1
	push	WORD PTR es:[bx][si]
	mov	dx,-999
	push	dx
	mov	bx,cx
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR $S1359_i
$L20062:
	push	ax
	call	_LogIt
	add	sp,24
; Line 1579
; Line 1596
	mov	ax,1
	push	ax
	les	bx,DWORD PTR _ptype
	add	bx,26
	mov	si,WORD PTR [bp-32]	;j
	shl	si,1
	push	WORD PTR es:[bx][si]
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	push	ax
	push	WORD PTR $S1359_i
	push	WORD PTR [bp-26]	;targetnum
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+26]
	push	WORD PTR [bp-22]	;mroll
	push	WORD PTR [bp-18]	;mpitch
	push	WORD PTR [bp-46]	;mhead
	push	WORD PTR [bp-40]	;malt
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-24]	;missilenum
	call	_firemissile2
	add	sp,38
; Line 1598
	cmp	WORD PTR [bp-26],70	;targetnum
	jne	$I1866
	call	_LaunchCall
; Line 1599
$I1866:
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I1868
; Line 1600
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR $S1359_i
	call	_GetWingName
	add	sp,4
; Line 1602
	les	bx,DWORD PTR _ptype
	add	bx,26
	mov	si,WORD PTR [bp-32]	;j
	shl	si,1
	push	WORD PTR es:[bx][si]
	call	_AIFoxCall
	add	sp,2
; Line 1604
; Line 1605
$I1868:
	cmp	WORD PTR [bp-26],70	;targetnum
	je	$I1872
; Line 1606
	push	WORD PTR [bp-26]	;targetnum
	call	_CheckAIBombs
	add	sp,2
	cmp	ax,-999
	je	$I1872
; Line 1607
	push	WORD PTR [bp-26]	;targetnum
	call	_ShowJettison
	add	sp,2
; Line 1609
$I1872:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+4]
	push	WORD PTR _ps[bx+2]
	mov	ax,2
	push	ax
	call	_CloseEnoughFor
	add	sp,6
	or	ax,ax
	je	$I1873
; Line 1610
	call	_NoAccel
; Line 1621
$I1873:
	mov	ax,20
	imul	WORD PTR $S1359_i
	mov	bx,ax
	add	bx,WORD PTR [bp-32]	;j
	shl	bx,1
	dec	WORD PTR _ps[bx+34]
; Line 1622
	cmp	WORD PTR [bp-36],0	;imaboat
	jne	$I1875
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+34],0
	jne	$I1875
	cmp	WORD PTR _ps[bx+36],0
	jne	$I1875
; Line 1623
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I1876
; Line 1624
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR $S1359_i
	call	_GetWingName
	add	sp,4
; Line 1625
	mov	ax,OFFSET DGROUP:$SG1878
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 1626
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 1627
	mov	ax,8
	push	ax
	call	_Speech
	jmp	SHORT $L20063
	nop	
$I1876:
; Line 1630
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 1631
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 1632
	push	WORD PTR $S1359_i
	call	_GetAIBase
$L20063:
	add	sp,2
; Line 1633
; Line 1634
; Line 1635
$I1875:
; Line 1636
; Line 1637
; Line 1638
; Line 1639
	cmp	WORD PTR _tempvar,0
	je	$FC1840
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$FC1840
; Line 1640
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 1641
; Line 1642
$FC1840:
	inc	WORD PTR [bp-32]	;j
$F1839:
	cmp	WORD PTR [bp-32],3	;j
	jge	$FB1841
; Line 1515
	les	bx,DWORD PTR _ptype
	add	bx,26
	mov	si,WORD PTR [bp-32]	;j
	shl	si,1
	push	WORD PTR es:[bx][si]
	call	_GetMissilePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	WORD PTR [bp-12],bx	;S
	mov	WORD PTR [bp-10],es
	cmp	WORD PTR es:[bx+22],1
	je	$I1842
	cmp	WORD PTR es:[bx+22],2
	je	$I1842
	cmp	WORD PTR es:[bx+22],3
	je	$I1842
	cmp	WORD PTR es:[bx+22],4
	jne	$FC1840
; Line 1518
$I1842:
	mov	ax,32
	cwd	
	push	dx
	push	ax
	mov	ax,825
	mul	WORD PTR [bp-16]	;dist
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-28],ax	;ddist
; Line 1519
	cmp	WORD PTR [bp-26],70	;targetnum
	je	$JCC9695
	jmp	$I1843
$JCC9695:
; Line 1520
	mov	ax,WORD PTR _Alt
	jmp	$L20060
$FB1841:
; Line 1643
; Line 1644
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],8
; Line 1645
	jmp	SHORT $I1881
$I1819:
; Line 1646
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	and	BYTE PTR _ps[bx+24],247
; Line 1647
	sub	WORD PTR _ps[bx+32],80
; Line 1648
$I1881:
; Line 1649
	mov	ax,255
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+32]
	mov	si,ax
	call	_rng
	add	sp,6
	mov	WORD PTR _ps[si+32],ax
; Line 1650
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_search	ENDP
; Line 1653
	PUBLIC	_CheckTailAspect
_CheckTailAspect	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	dx = -4
;	dy = -6
;	hd = -2
;	y = 8
;	x = 4
; Line 1656
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	je	$I1888
; Line 1657
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;x
	sub	ax,WORD PTR _ps[bx+8]
	mov	WORD PTR [bp-4],ax	;dx
; Line 1658
	mov	ax,WORD PTR [bp+8]	;y
	sub	ax,WORD PTR _ps[bx+12]
	mov	WORD PTR [bp-6],ax	;dy
; Line 1659
	mov	ax,WORD PTR _ps[bx+16]
	jmp	SHORT $L20067
$I1888:
; Line 1661
	mov	ax,WORD PTR [bp+4]	;x
	sub	ax,WORD PTR _PxLng
	mov	WORD PTR [bp-4],ax	;dx
; Line 1662
	mov	ax,WORD PTR _PyLng
	add	ax,WORD PTR [bp+8]	;y
	mov	WORD PTR [bp-6],ax	;dy
; Line 1663
	mov	ax,WORD PTR _OurHead
$L20067:
	mov	WORD PTR [bp-2],ax	;hd
; Line 1664
; Line 1666
	mov	ax,WORD PTR [bp-6]	;dy
	neg	ax
	push	ax
	push	WORD PTR [bp-4]	;dx
	call	_ARCTAN
	add	sp,4
	sub	ax,WORD PTR [bp-2]	;hd
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,21845
	jle	$L20014
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
$L20014:
	sub	ax,ax
; Line 1667
	mov	sp,bp
	pop	bp
	ret	

_CheckTailAspect	ENDP
; Line 1748
	PUBLIC	_ActivatePlane
_ActivatePlane	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	di
	push	si
;	t = -2
;	i = -8
;	tempplane = -6
;	planeid = 8
;	base = 6
;	pl = 4
; Line 1752
	cmp	WORD PTR [bp+6],0	;base
	jge	$I1898
; Line 1753
	mov	WORD PTR [bp+6],0	;base
; Line 1756
$I1898:
	mov	WORD PTR [bp-2],0	;t
; Line 1758
	mov	ax,40
	imul	WORD PTR [bp+4]	;pl
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],4
	jne	$I1899
; Line 1760
	mov	WORD PTR [bp-2],0	;t
; Line 1762
$I1899:
	cmp	WORD PTR [bp+8],-1	;planeid
	je	$I1900
; Line 1763
	mov	ax,WORD PTR [bp+8]	;planeid
	mov	WORD PTR [bp-2],ax	;t
; Line 1764
; Line 1766
$I1900:
	push	WORD PTR [bp-2]	;t
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-6],ax	;tempplane
	mov	WORD PTR [bp-4],dx
; Line 1768
	mov	ax,40
	imul	WORD PTR [bp+4]	;pl
	mov	bx,ax
	mov	ax,WORD PTR [bp-2]	;t
	mov	WORD PTR _ps[bx+22],ax
; Line 1770
	cmp	WORD PTR _Direction,1
	jne	$L20016
	sub	ax,ax
	jmp	SHORT $L20017
$L20016:
	mov	ax,-32768
$L20017:
	mov	WORD PTR _ps[bx+16],ax
; Line 1772
	mov	si,WORD PTR [bp+6]	;base
	mov	ax,si
	shl	si,1
	shl	si,1
	add	si,ax
	shl	si,1
	test	BYTE PTR _Rdrs[si+7],2
	je	$I1901
; Line 1773
	mov	ax,WORD PTR _Direction
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	add	ax,WORD PTR _Rdrs[si]
	mov	WORD PTR _ps[bx+2],ax
; Line 1774
	mov	ax,WORD PTR _Direction
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	shl	ax,1
	sub	ax,WORD PTR _Rdrs[si+2]
	neg	ax
	mov	WORD PTR _ps[bx+4],ax
; Line 1775
	mov	WORD PTR _ps[bx+6],35
; Line 1776
	mov	WORD PTR _ps[bx+26],100
; Line 1777
	sub	WORD PTR _ps[bx+16],1024
; Line 1779
	jmp	SHORT $I1902
	nop	
$I1901:
; Line 1780
	mov	ax,40
	imul	WORD PTR [bp+4]	;pl
	mov	bx,ax
	mov	si,WORD PTR [bp+6]	;base
	mov	ax,si
	shl	si,1
	shl	si,1
	add	si,ax
	shl	si,1
	mov	ax,WORD PTR _Rdrs[si]
	mov	WORD PTR _ps[bx+2],ax
; Line 1781
	mov	ax,30
	imul	WORD PTR _Direction
	add	ax,WORD PTR _Rdrs[si+2]
	mov	WORD PTR _ps[bx+4],ax
; Line 1782
	mov	WORD PTR _ps[bx+6],3
; Line 1783
	mov	WORD PTR _ps[bx+26],10
; Line 1784
$I1902:
; Line 1786
	mov	ax,40
	imul	WORD PTR [bp+4]	;pl
	mov	bx,ax
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
; Line 1787
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
; Line 1788
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	si,bx
	call	__aNlmul
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;pl
	shl	bx,cl
	mov	WORD PTR _ailoc[bx],ax
	mov	WORD PTR _ailoc[bx+2],dx
; Line 1789
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	mov	di,bx
	call	__aNlmul
	mov	WORD PTR _ailoc[di+4],ax
	mov	WORD PTR _ailoc[di+6],dx
; Line 1791
	sub	ax,ax
	mov	WORD PTR _ps[si+18],ax
	mov	WORD PTR _ps[si+20],ax
; Line 1792
	or	WORD PTR _ps[si+24],-32765
; Line 1793
	mov	ax,WORD PTR [bp+6]	;base
	mov	WORD PTR _ps[si],ax
; Line 1794
	mov	WORD PTR _ps[si+28],0
; Line 1795
	mov	WORD PTR _ps[si+30],-999
; Line 1797
	les	bx,DWORD PTR [bp-6]	;tempplane
	mov	ax,WORD PTR es:[bx+32]
	mov	WORD PTR _ps[si+34],ax
; Line 1798
	mov	ax,WORD PTR es:[bx+34]
	mov	WORD PTR _ps[si+36],ax
; Line 1799
	mov	ax,WORD PTR es:[bx+36]
	mov	WORD PTR _ps[si+38],ax
; Line 1801
	mov	ax,46
	imul	WORD PTR [bp+4]	;pl
	mov	si,ax
	mov	WORD PTR _bv[si],OFFSET _StraightAttack
; Line 1803
	mov	ax,-999
	mov	WORD PTR _bv[si+2],ax
	mov	WORD PTR _bv[si+4],ax
; Line 1805
	mov	WORD PTR _bv[si+6],ax
	mov	WORD PTR _bv[si+8],ax
; Line 1807
	mov	ax,-1
	mov	WORD PTR _bv[si+10],ax
	mov	WORD PTR _bv[si+14],ax
; Line 1808
	mov	WORD PTR _bv[si+16],0
; Line 1809
	mov	ax,WORD PTR es:[bx+10]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR _bv[si+18],ax
; Line 1810
	mov	WORD PTR _bv[si+20],256
; Line 1812
	sub	ax,ax
	mov	WORD PTR _bv[si+22],ax
	mov	WORD PTR _bv[si+24],ax
; Line 1813
	mov	WORD PTR _bv[si+26],ax
; Line 1814
	mov	WORD PTR _bv[si+28],16
; Line 1815
	mov	WORD PTR _bv[si+40],20000
; Line 1816
	mov	WORD PTR _bv[si+42],3
; Line 1817
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_ActivatePlane	ENDP
; Line 1826
	PUBLIC	_GetTargADP
_GetTargADP	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	deltalt = 20
;	enemyalt = 18
;	tdistnm = 16
;	tangle = 14
;	tpitch = 12
;	tdist = 10
;	dy = 8
;	dx = 6
;	planenum = 4
; Line 1827
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I1914
; Line 1828
	push	WORD PTR [bp+8]	;dy
	push	WORD PTR [bp+6]	;dx
	call	_Dist2D
	mov	sp,bp
	mov	bx,WORD PTR [bp+10]	;tdist
	mov	WORD PTR [bx],ax
; Line 1829
	push	ax
	mov	ax,WORD PTR [bp+20]	;deltalt
	add	ax,WORD PTR _Alt
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	call	_GetAltPitch
	mov	sp,bp
	mov	bx,WORD PTR [bp+12]	;tpitch
	mov	WORD PTR [bx],ax
; Line 1830
	mov	ax,WORD PTR _Alt
	jmp	SHORT $L20068
	nop	
$I1914:
; Line 1833
	push	WORD PTR [bp+8]	;dy
	push	WORD PTR [bp+6]	;dx
	call	_Dist2D
	mov	sp,bp
	mov	bx,WORD PTR [bp+10]	;tdist
	mov	WORD PTR [bx],ax
; Line 1834
	push	ax
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	add	ax,WORD PTR [bp+20]	;deltalt
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	call	_GetAltPitch
	mov	sp,bp
	mov	bx,WORD PTR [bp+12]	;tpitch
	mov	WORD PTR [bx],ax
; Line 1835
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
$L20068:
	mov	bx,WORD PTR [bp+18]	;enemyalt
	mov	WORD PTR [bx],ax
; Line 1836
; Line 1837
	mov	ax,WORD PTR [bp+8]	;dy
	neg	ax
	push	ax
	push	WORD PTR [bp+6]	;dx
	call	_ARCTAN
	mov	sp,bp
	mov	bx,WORD PTR [bp+14]	;tangle
	mov	WORD PTR [bx],ax
; Line 1839
	mov	ax,14336
	push	ax
	mov	ax,-14336
	push	ax
	mov	bx,WORD PTR [bp+12]	;tpitch
	push	WORD PTR [bx]
	call	_rng2
	mov	bx,WORD PTR [bp+12]	;tpitch
	mov	WORD PTR [bx],ax
; Line 1840
	mov	bx,WORD PTR [bp+10]	;tdist
	mov	ax,WORD PTR [bx]
	shl	ax,1
	mov	cx,95
	sub	dx,dx
	div	cx
	mov	bx,WORD PTR [bp+16]	;tdistnm
	mov	WORD PTR [bx],ax
; Line 1841
	mov	sp,bp
	pop	bp
	ret	

_GetTargADP	ENDP
; Line 1844
	PUBLIC	_CheckGunFiring
_CheckGunFiring	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,34
	call	__aNchkstk
	push	di
	push	si
;	dbulpitch = -34
;	dbulhead = -16
;	nn = -22
;	tspd = -20
;	othertarget = -14
;	dxb = -28
;	dyb = -32
;	tpitchb = -26
;	tangleb = -24
;	enemyalt = -30
;	tdistb = -18
;	tdistnm = -2
;	lx = -6
;	ly = -10
;	ltangle = -12
;	tpitchl = 8
;	tanglel = 6
;	tdistl = 4
; Line 1853
	cmp	WORD PTR _DOINVISIBLE,0
	je	$JCC10702
	jmp	$EX1919
$JCC10702:
; Line 1860
	les	bx,DWORD PTR _ptype
	cmp	WORD PTR es:[bx+20],0
	jne	$JCC10716
	jmp	$EX1919
$JCC10716:
; Line 1863
	cmp	WORD PTR es:[bx+20],1
	je	$I1938
	cmp	WORD PTR es:[bx+20],3
	je	$JCC10733
	jmp	$I1937
$JCC10733:
$I1938:
; Line 1864
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR [bp-14],ax	;othertarget
; Line 1865
	mov	ax,1
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR $S1359_i
	call	_AIRadarRearCheck
	add	sp,6
; Line 1866
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I1939
; Line 1867
	mov	ax,WORD PTR _Px
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-28],ax	;dxb
; Line 1868
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-32],ax	;dyb
; Line 1869
	mov	ax,WORD PTR _FPARAMS
	mov	dx,WORD PTR _FPARAMS+2
	mov	cl,3
	mov	bx,WORD PTR $S1359_i
	shl	bx,cl
	sub	ax,WORD PTR _ailoc[bx]
	sbb	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-6],ax	;lx
	mov	WORD PTR [bp-4],dx
; Line 1870
	mov	ax,WORD PTR _FPARAMS+8
	mov	dx,WORD PTR _FPARAMS+10
	sub	ax,WORD PTR _ailoc[bx+4]
	sbb	dx,WORD PTR _ailoc[bx+6]
	jmp	SHORT $L20069
	nop	
$I1939:
; Line 1873
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	si,ax
	mov	ax,WORD PTR _ps[si+2]
	mov	di,WORD PTR $S1358_psi
	sub	ax,WORD PTR [di+2]
	mov	WORD PTR [bp-28],ax	;dxb
; Line 1874
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR [di+4]
	mov	WORD PTR [bp-32],ax	;dyb
; Line 1875
	mov	cl,3
	mov	bx,WORD PTR _bv[bx+10]
	shl	bx,cl
	mov	ax,WORD PTR _ailoc[bx]
	mov	dx,WORD PTR _ailoc[bx+2]
	mov	si,WORD PTR $S1359_i
	shl	si,cl
	sub	ax,WORD PTR _ailoc[si]
	sbb	dx,WORD PTR _ailoc[si+2]
	mov	WORD PTR [bp-6],ax	;lx
	mov	WORD PTR [bp-4],dx
; Line 1876
	mov	ax,WORD PTR _ailoc[bx+4]
	mov	dx,WORD PTR _ailoc[bx+6]
	sub	ax,WORD PTR _ailoc[si+4]
	sbb	dx,WORD PTR _ailoc[si+6]
$L20069:
	mov	WORD PTR [bp-10],ax	;ly
	mov	WORD PTR [bp-8],dx
; Line 1877
; Line 1878
	sub	ax,ax
	push	ax
	lea	ax,WORD PTR [bp-30]	;enemyalt
	push	ax
	lea	ax,WORD PTR [bp-2]	;tdistnm
	push	ax
	lea	ax,WORD PTR [bp-24]	;tangleb
	push	ax
	lea	ax,WORD PTR [bp-26]	;tpitchb
	push	ax
	lea	cx,WORD PTR [bp-18]	;tdistb
	push	cx
	push	WORD PTR [bp-32]	;dyb
	push	WORD PTR [bp-28]	;dxb
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 1879
	mov	ax,WORD PTR [bp-10]	;ly
	mov	dx,WORD PTR [bp-8]
	neg	ax
	adc	dx,0
	neg	dx
	push	dx
	push	ax
	push	WORD PTR [bp-4]
	push	WORD PTR [bp-6]	;lx
	call	_Langle
	add	sp,8
	mov	WORD PTR [bp-12],ax	;ltangle
; Line 1881
	mov	ax,48
	push	ax
	mov	ax,6144
	push	ax
	push	ax
	mov	ax,-32768
	push	ax
	push	WORD PTR [bp-26]	;tpitchb
	push	WORD PTR [bp-12]	;ltangle
	push	WORD PTR [bp-18]	;tdistb
	call	_CoreCheckGunFiring
	add	sp,14
; Line 1883
	les	bx,DWORD PTR _ptype
	cmp	WORD PTR es:[bx+20],3
	jne	$I1941
; Line 1884
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	je	$EX1919
; Line 1885
	mov	ax,WORD PTR [bp-14]	;othertarget
	mov	WORD PTR _bv[bx+10],ax
; Line 1886
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 1887
; Line 1888
	nop	
$I1941:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-14]	;othertarget
	mov	WORD PTR _bv[bx+10],ax
; Line 1889
; Line 1891
$I1937:
	mov	ax,24
	push	ax
	mov	ax,512
	push	ax
	mov	ax,2048
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR [bp+8]	;tpitchl
	push	WORD PTR [bp+6]	;tanglel
	push	WORD PTR [bp+4]	;tdistl
	call	_CoreCheckGunFiring
	add	sp,14
; Line 1892
$EX1919:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_CheckGunFiring	ENDP
; Line 1895
	PUBLIC	_CoreCheckGunFiring
_CoreCheckGunFiring	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	si
;	dbulpitch = -8
;	dbulhead = -2
;	nn = -6
;	tspd = -4
;	tdistfire = 16
;	dangle = 14
;	fireangle = 12
;	turretangle = 10
;	tpitchl = 8
;	tanglel = 6
;	tdistl = 4
; Line 1900
	mov	ax,WORD PTR [bp+4]	;tdistl
	cmp	WORD PTR [bp+16],ax	;tdistfire
	ja	$JCC11162
	jmp	$I1955
$JCC11162:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	je	$JCC11181
	jmp	$I1955
$JCC11181:
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+16]
	sub	ax,WORD PTR [bp+6]	;tanglel
	add	ax,WORD PTR [bp+10]	;turretangle
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR [bp+12]	;fireangle
	jl	$JCC11209
	jmp	$I1955
$JCC11209:
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+18]
	sub	ax,WORD PTR [bp+8]	;tpitchl
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR [bp+12]	;fireangle
	jl	$JCC11234
	jmp	$I1955
$JCC11234:
; Line 1902
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I1957
; Line 1903
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _ps[bx+28],ax
	jge	$I1957
; Line 1904
	add	ax,14
	mov	WORD PTR _ps[bx+28],ax
; Line 1910
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR $S1359_i
	call	_GetWingName
	add	sp,4
; Line 1911
	mov	ax,OFFSET DGROUP:$SG1958
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 1912
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 1913
	mov	ax,2
	push	ax
	call	_Speech
	add	sp,2
; Line 1914
; Line 1915
$I1957:
; Line 1917
	cmp	WORD PTR _warstatus,0
	jne	$I1959
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _bv[bx+10]
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I1959
; Line 1918
	mov	WORD PTR _warstatus,1
; Line 1919
	mov	WORD PTR _LastCall,-240
; Line 1920
; Line 1923
$I1959:
	les	bx,DWORD PTR _ptype
	cmp	WORD PTR es:[bx+38],10
	jne	$I1961
	cmp	WORD PTR es:[bx+38],40
	je	$I1960
$I1961:
; Line 1924
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	or	BYTE PTR _ps[bx+25],64
; Line 1925
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],1
; Line 1926
; Line 1928
$I1960:
	mov	al,BYTE PTR _Rtime
	and	ax,12
	sar	ax,1
	sar	ax,1
	add	ax,WORD PTR _FIRST_ENEMY_TRACE
	mov	WORD PTR [bp-6],ax	;nn
; Line 1930
	cmp	WORD PTR _CloseGuy,0
	je	$I1962
	add	ax,4
	mov	WORD PTR [bp-6],ax	;nn
; Line 1931
$I1962:
	mov	ax,WORD PTR _TSpeed
	shl	ax,1
	mov	WORD PTR [bp-4],ax	;tspd
; Line 1932
	mov	ax,WORD PTR [bp+8]	;tpitchl
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+18]
	mov	WORD PTR [bp-8],ax	;dbulpitch
; Line 1933
	mov	cx,WORD PTR [bp+6]	;tanglel
	sub	cx,WORD PTR [bx+16]
	sub	cx,WORD PTR [bp+10]	;turretangle
	mov	WORD PTR [bp-2],cx	;dbulhead
; Line 1934
	or	ax,ax
	jl	$I1963
; Line 1935
	cmp	ax,WORD PTR [bp+14]	;dangle
	jle	$I1966
; Line 1936
	mov	ax,WORD PTR [bp+14]	;dangle
	jmp	SHORT $L20070
	nop	
$I1963:
; Line 1939
	mov	ax,WORD PTR [bp+14]	;dangle
	neg	ax
	cmp	ax,WORD PTR [bp-8]	;dbulpitch
	jle	$I1966
; Line 1940
$L20070:
	mov	WORD PTR [bp-8],ax	;dbulpitch
; Line 1941
$I1966:
; Line 1942
	cmp	WORD PTR [bp-2],0	;dbulhead
	jl	$I1967
; Line 1943
	mov	ax,WORD PTR [bp-2]	;dbulhead
	cmp	WORD PTR [bp+14],ax	;dangle
	jge	$I1970
; Line 1944
	mov	ax,WORD PTR [bp+14]	;dangle
	jmp	SHORT $L20071
$I1967:
; Line 1947
	mov	ax,WORD PTR [bp+14]	;dangle
	neg	ax
	cmp	ax,WORD PTR [bp-2]	;dbulhead
	jle	$I1970
; Line 1948
$L20071:
	mov	WORD PTR [bp-2],ax	;dbulhead
; Line 1949
$I1970:
; Line 1952
	push	WORD PTR [bp-4]	;tspd
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+18]
	add	ax,WORD PTR [bp-8]	;dbulpitch
	push	ax
	call	_sinX
	add	sp,4
	mov	cx,ax
	mov	ax,18
	imul	WORD PTR [bp-6]	;nn
	mov	bx,ax
	mov	WORD PTR _trs[bx+14],cx
; Line 1953
	push	WORD PTR [bp-4]	;tspd
	mov	si,WORD PTR $S1358_psi
	mov	ax,WORD PTR [si+18]
	add	ax,WORD PTR [bp-8]	;dbulpitch
	push	ax
	mov	si,bx
	call	_cosX
	add	sp,4
	mov	WORD PTR [bp-4],ax	;tspd
; Line 1954
	push	ax
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+16]
	add	ax,WORD PTR [bp+10]	;turretangle
	add	ax,WORD PTR [bp-2]	;dbulhead
	push	ax
	call	_sinX
	add	sp,4
	mov	WORD PTR _trs[si+10],ax
; Line 1955
	push	WORD PTR [bp-4]	;tspd
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+16]
	add	ax,WORD PTR [bp+10]	;turretangle
	add	ax,WORD PTR [bp-2]	;dbulhead
	push	ax
	call	_cosX
	add	sp,4
	neg	ax
	mov	WORD PTR _trs[si+12],ax
; Line 1957
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+8]
	mov	dx,WORD PTR [bx+10]
	mov	WORD PTR _trs[si],ax
	mov	WORD PTR _trs[si+2],dx
; Line 1958
	mov	ax,WORD PTR [bx+12]
	mov	dx,WORD PTR [bx+14]
	mov	WORD PTR _trs[si+4],ax
	mov	WORD PTR _trs[si+6],dx
; Line 1959
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR _trs[si+8],ax
; Line 1960
	mov	ax,WORD PTR $S1359_i
	mov	WORD PTR _trs[si+16],ax
; Line 1961
; Line 1962
$I1955:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CoreCheckGunFiring	ENDP
; Line 1965
	PUBLIC	_GetEnemyTarget
_GetEnemyTarget	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,38
	call	__aNchkstk
	push	si
;	targetnum = -18
;	dist = -8
;	dist1 = -12
;	distnm = -36
;	wingnum = -10
;	othertarget = -24
;	otherdist = -16
;	temppath = -4
;	wayval = -6
;	cnt = -14
;	founddist = -2
;	wingrear = -38
;	dx = -28
;	dy = -32
;	dx1 = -30
;	dy1 = -34
;	angle = -20
;	x = -22
;	y = -26
;	ainum = 4
; Line 1974
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-22],ax	;x
; Line 1975
	mov	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-26],ax	;y
; Line 1977
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-999
	je	$I1993
; Line 1978
	mov	ax,WORD PTR _bv[bx+2]
; Line 1979
	jmp	SHORT $I1995
$I1993:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
; Line 1982
$I1995:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-999
	je	$I1996
; Line 1983
	push	WORD PTR _bv[bx+2]
	call	_CheckWingmanSix
	add	sp,2
	or	ax,ax
	je	$JCC11792
	jmp	$I2050
$JCC11792:
; Line 1985
; Line 1987
$I1996:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR [bp-18],ax	;targetnum
; Line 1989
	test	BYTE PTR _bv[bx+21],32
	je	$I1999
; Line 1990
	inc	ax
	jne	$I2000
; Line 1991
; Line 1992
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],4
	jne	$I2003
; Line 1993
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I2000:
; Line 1997
	mov	ax,40
	imul	WORD PTR [bp-18]	;targetnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2003
	test	cl,2
	je	$I2003
	cmp	WORD PTR _ps[bx+26],0
	je	$I2003
	test	cx,2080
	jne	$JCC11876
	jmp	$I2050
$JCC11876:
; Line 1999
; Line 2000
$I2003:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],223
; Line 2001
; Line 2002
$I1999:
	mov	WORD PTR [bp-24],-999	;othertarget
; Line 2003
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	je	$I2005
	cmp	WORD PTR _bv[bx+6],-1
	jne	$I2006
$I2005:
	cmp	WORD PTR _DESIGNATED,-1
	je	$I2006
	mov	ax,WORD PTR $S1359_i
	cmp	WORD PTR _DESIGNATED,ax
	je	$I2006
; Line 2004
	cmp	WORD PTR _DESIGNATED,-1
	je	$I2006
; Line 2005
	mov	ax,WORD PTR _DESIGNATED
	mov	WORD PTR [bp-24],ax	;othertarget
; Line 2006
; Line 2007
$I2006:
; Line 2008
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+6],-1
	jle	$I2007
; Line 2009
	mov	ax,46
	imul	WORD PTR _bv[bx+6]
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR [bp-24],ax	;othertarget
; Line 2010
; Line 2012
$I2007:
	cmp	WORD PTR [bp-24],-1	;othertarget
	jne	$I2008
; Line 2013
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],4
	jmp	SHORT $L20076
$I2008:
; Line 2018
	mov	ax,40
	imul	WORD PTR [bp-24]	;othertarget
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2012
	test	cl,2
	je	$I2012
	test	cx,2080
$L20076:
	je	$I2011
$I2012:
; Line 2019
	mov	WORD PTR [bp-24],-999	;othertarget
; Line 2021
$I2011:
	mov	WORD PTR [bp-2],0	;founddist
; Line 2022
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],4
	jne	$I2013
; Line 2023
	mov	WORD PTR [bp-2],1	;founddist
; Line 2024
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR [bp-22]	;x
; Line 2025
	mov	cx,WORD PTR _Py
	sub	cx,WORD PTR [bp-26]	;y
; Line 2026
	push	cx
	push	ax
	call	_xydist
	add	sp,4
	mov	WORD PTR [bp-8],ax	;dist
; Line 2027
	mov	WORD PTR _CloseGuy,0
; Line 2028
	mov	WORD PTR [bp-18],-1	;targetnum
; Line 2029
; Line 2031
$I2013:
	mov	WORD PTR [bp-14],0	;cnt
	jmp	SHORT $F2014
	nop	
$FC2015:
; Line 2033
	mov	ax,40
	imul	WORD PTR [bp-14]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2019
	test	cl,2
	je	$I2019
	cmp	WORD PTR _ps[bx+26],0
	je	$I2019
	mov	ax,WORD PTR [bp-24]	;othertarget
	cmp	WORD PTR [bp-14],ax	;cnt
	je	$I2019
	test	cx,2080
	jne	$I2019
; Line 2034
	push	WORD PTR [bp-14]	;cnt
	push	WORD PTR [bp+4]	;ainum
	mov	si,bx
	call	_FriendMatch
	add	sp,4
	or	ax,ax
	jne	$I2019
; Line 2035
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR [bp-26]	;y
	mov	cx,WORD PTR _ps[si+2]
	sub	cx,WORD PTR [bp-22]	;x
; Line 2036
	push	ax
	push	cx
	call	_xydist
	add	sp,4
	cmp	ax,WORD PTR [bp-8]	;dist
	jb	$I2020
	cmp	WORD PTR [bp-2],0	;founddist
	jne	$I2019
$I2020:
; Line 2038
	mov	WORD PTR [bp-8],ax	;dist
; Line 2041
	mov	ax,1
	mov	WORD PTR [bp-2],ax	;founddist
	mov	WORD PTR _CloseGuy,ax
; Line 2042
	mov	ax,WORD PTR [bp-14]	;cnt
	mov	WORD PTR [bp-18],ax	;targetnum
; Line 2043
; Line 2044
$I2019:
; Line 2045
; Line 2046
	inc	WORD PTR [bp-14]	;cnt
$F2014:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-14],ax	;cnt
	jl	$FC2015
; Line 2049
	mov	ax,WORD PTR [bp-8]	;dist
	shl	ax,1
	mov	cx,90
	sub	dx,dx
	div	cx
	mov	WORD PTR [bp-36],ax	;distnm
	cmp	ax,200
	jbe	$I2023
; Line 2050
	push	WORD PTR [bp+4]	;ainum
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	je	$I2023
; Line 2056
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 2057
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 2058
	push	WORD PTR [bp+4]	;ainum
	mov	si,bx
	call	_GetAIBase
	add	sp,2
; Line 2059
	cmp	WORD PTR _bv[si+2],-999
	je	$I2023
; Line 2060
	mov	WORD PTR _bv[si],OFFSET _Formation
; Line 2061
$I2023:
; Line 2062
; Line 2064
	cmp	WORD PTR [bp-36],20	;distnm
	jbe	$I2027
	cmp	WORD PTR [bp-24],-1	;othertarget
	jle	$I2027
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _StraightAttack
	je	$I2027
; Line 2066
	mov	ax,40
	imul	WORD PTR [bp-24]	;othertarget
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR [bp-26]	;y
	push	ax
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR [bp-22]	;x
	push	ax
	call	_xydist
	add	sp,4
	cmp	ax,WORD PTR [bp-8]	;dist
	jae	$I2027
; Line 2067
	mov	WORD PTR [bp-2],1	;founddist
; Line 2068
	mov	ax,WORD PTR [bp-24]	;othertarget
	mov	WORD PTR [bp-18],ax	;targetnum
; Line 2069
	inc	ax
	jne	$I2026
; Line 2070
	mov	WORD PTR _CloseGuy,0
; Line 2071
; Line 2072
	jmp	SHORT $I2027
	nop	
$I2026:
; Line 2073
	mov	WORD PTR _CloseGuy,1
; Line 2074
$I2027:
; Line 2075
; Line 2076
; Line 2077
	push	WORD PTR [bp+4]	;ainum
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I2031
; Line 2079
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _BracketLeft
	je	$I2030
	cmp	WORD PTR _bv[bx],OFFSET _BracketRight
	je	$I2030
	cmp	WORD PTR _bv[bx],OFFSET _FlyStraight
	jne	$I2031
$I2030:
; Line 2080
	cmp	WORD PTR [bp-36],60	;distnm
	ja	$I2032
	cmp	WORD PTR [bp-2],0	;founddist
	jne	$I2031
$I2032:
; Line 2081
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
; Line 2082
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 2083
; Line 2084
	nop	
$I2031:
; Line 2085
; Line 2086
	cmp	WORD PTR [bp-36],20	;distnm
	jbe	$I2035
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _StraightAttack
	je	$I2034
$I2035:
	cmp	WORD PTR [bp-2],0	;founddist
	je	$JCC12500
	jmp	$I2049
$JCC12500:
$I2034:
; Line 2087
	cmp	WORD PTR [bp-36],30	;distnm
	jae	$I2036
	cmp	WORD PTR [bp-2],0	;founddist
	je	$I2036
; Line 2088
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	je	$JCC12530
	jmp	$I2049
$JCC12530:
; Line 2089
	mov	ax,-1
	push	ax
	mov	si,bx
	call	_NearWingTarget
	add	sp,2
	or	ax,ax
	jne	$JCC12549
	jmp	$I2049
$JCC12549:
; Line 2090
$L20073:
	and	BYTE PTR _bv[si+21],223
; Line 2091
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I2036:
	cmp	WORD PTR [bp-24],-999	;othertarget
	je	$I2040
; Line 2096
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR [bp-24]	;othertarget
	mov	WORD PTR _bv[bx+10],ax
; Line 2097
; Line 2098
	jmp	$I2049
	nop	
$I2040:
; Line 2099
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jne	$I2042
; Line 2100
	mov	ax,-1
	push	ax
	mov	si,bx
	call	_NearWingTarget
	add	sp,2
	or	ax,ax
	jne	$L20073
; Line 2103
; Line 2104
; Line 2110
$I2042:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 2111
	and	BYTE PTR _bv[bx+21],254
; Line 2112
	or	BYTE PTR _bv[bx+21],2
; Line 2113
	mov	WORD PTR _bv[bx+10],-1
; Line 2115
	push	WORD PTR [bp+4]	;ainum
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I2044
; Line 2116
	mov	ax,3
	push	ax
	call	_Speech
	add	sp,2
; Line 2117
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR [bp+4]	;ainum
	call	_GetWingName
	add	sp,4
; Line 2118
	mov	ax,OFFSET DGROUP:$SG2045
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 2119
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 2120
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR [bp+4]	;ainum
	call	_GetWingName
	jmp	SHORT $L20075
$I2044:
	push	WORD PTR [bp+4]	;ainum
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR [bp+4]	;ainum
	jne	$I2049
; Line 2123
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+14]
; Line 2124
	mov	cx,ax
	mov	al,BYTE PTR _bv[bx+12]
	cbw	
; Line 2125
	mov	dx,cx
	mov	bx,ax
	mov	cl,3
	shl	bx,cl
	mov	ax,WORD PTR _aipaths[bx+4]
	add	ax,WORD PTR _aipaths[bx+6]
	cmp	ax,dx
	jbe	$I2049
; Line 2126
	or	dx,dx
	jl	$I2049
; Line 2127
	push	dx
	push	WORD PTR [bp+4]	;ainum
	call	_DoNextWayPt
$L20075:
	add	sp,4
; Line 2128
$I2049:
; Line 2129
; Line 2130
; Line 2131
; Line 2133
	cmp	WORD PTR [bp-2],0	;founddist
	je	$I2050
; Line 2134
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR [bp-18]	;targetnum
	mov	WORD PTR _bv[bx+10],ax
; Line 2135
$I2050:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetEnemyTarget	ENDP
; Line 2138
	PUBLIC	_IsCAPFlier
_IsCAPFlier	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	ainum = 4
; Line 2145
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _SetUpCAP1
	je	$I2054
	cmp	WORD PTR _bv[bx],OFFSET _SetUpCAP2
	je	$I2054
	cmp	WORD PTR _bv[bx],OFFSET _SetUpCAP3
	je	$I2054
	cmp	WORD PTR _bv[bx],OFFSET _CAPTurn1
	je	$I2054
	cmp	WORD PTR _bv[bx],OFFSET _CAPTurn2
	je	$I2054
	cmp	WORD PTR _bv[bx],OFFSET _CAPLeg1
	je	$I2054
	cmp	WORD PTR _bv[bx],OFFSET _CAPLeg2
	je	$I2054
	cmp	WORD PTR _bv[bx],OFFSET _SARCAP0
	je	$I2054
	cmp	WORD PTR _bv[bx],OFFSET _SARCAP1
	je	$I2054
	cmp	WORD PTR _bv[bx],OFFSET _SARCAP2
	je	$I2054
	cmp	WORD PTR _bv[bx],OFFSET _SARCAP3
	jne	$I2053
$I2054:
; Line 2146
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 2147
; Line 2148
	nop	
$I2053:
	sub	ax,ax
; Line 2149
	mov	sp,bp
	pop	bp
	ret	

_IsCAPFlier	ENDP
; Line 2152
	PUBLIC	_IsRefueling
_IsRefueling	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
;	ainum = 4
; Line 2165
	sub	ax,ax
; Line 2166
	ret	

_IsRefueling	ENDP
; Line 2169
	PUBLIC	_FriendlyChooseBehavior
_FriendlyChooseBehavior	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,50
	call	__aNchkstk
	push	di
	push	si
;	behavechange = -4
;	wingnum = -26
;	leadernum = -46
;	prewing = -42
;	dxl = -36
;	dyl = -38
;	tanglel = -32
;	tanglew = -8
;	tpitchl = -34
;	tpitchw = -12
;	ranglel = -24
;	ranglew = -2
;	rranglel = -30
;	rranglew = -6
;	enemyalt = -50
;	tdistl = -18
;	tdistw = -48
;	tdistnm = -10
;	temphold = -44
;	lx = -16
;	ly = -22
;	ltangle = -28
;	friendval = -40
; Line 2180
	push	WORD PTR $S1359_i
	call	_ProcessAICommunications
	add	sp,2
	or	ax,ax
	je	$JCC12969
	jmp	$I2110
$JCC12969:
; Line 2183
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+24]
	mov	cx,ax
	test	ah,128
	je	$JCC12986
	jmp	$I2110
$JCC12986:
	test	cl,4
	je	$JCC12994
	jmp	$I2110
$JCC12994:
; Line 2186
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-26],ax	;wingnum
; Line 2187
	mov	ax,WORD PTR _bv[bx+2]
	mov	WORD PTR [bp-46],ax	;leadernum
; Line 2189
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-42],ax	;prewing
; Line 2191
	mov	WORD PTR [bp-4],0	;behavechange
; Line 2193
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Formation
	jne	$JCC13055
	jmp	$I2110
$JCC13055:
	cmp	WORD PTR _bv[bx],OFFSET _FlySanitize
	jne	$JCC13066
	jmp	$I2110
$JCC13066:
	push	WORD PTR $S1359_i
	call	_IsBombing
	add	sp,2
	or	ax,ax
	je	$JCC13083
	jmp	$I2110
$JCC13083:
	push	WORD PTR $S1359_i
	call	_IsCAPFlier
	add	sp,2
	or	ax,ax
	je	$JCC13100
	jmp	$I2110
$JCC13100:
	push	WORD PTR $S1359_i
	call	_IsRefueling
	add	sp,2
	or	ax,ax
	je	$JCC13117
	jmp	$I2110
$JCC13117:
; Line 2195
; Line 2197
	push	WORD PTR $S1359_i
	call	_CheckAITarget
	add	sp,2
; Line 2213
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _BracketLeft
	je	$I2089
	cmp	WORD PTR _bv[bx],OFFSET _BracketRight
	je	$I2089
	cmp	WORD PTR _bv[bx],OFFSET _FlyStraight
	je	$JCC13163
	jmp	$I2099
$JCC13163:
$I2089:
; Line 2214
	mov	WORD PTR [bp-44],0	;temphold
; Line 2215
	test	BYTE PTR _Rtime,16
	je	$I2090
; Line 2216
	mov	WORD PTR [bp-44],1	;temphold
; Line 2218
$I2090:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	je	$I2092
; Line 2219
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,32
	jne	$I2093
	test	cl,1
	jne	$I2092
$I2093:
; Line 2220
	mov	WORD PTR [bp-44],1	;temphold
; Line 2221
$I2092:
; Line 2224
	cmp	WORD PTR [bp-44],0	;temphold
	je	$I2099
; Line 2225
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-999
	je	$I2095
; Line 2226
	push	WORD PTR _bv[bx+2]
	call	_CheckWingmanSix
	add	sp,2
	or	ax,ax
	jne	$I2099
$I2095:
; Line 2233
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],32
	jne	$I2099
; Line 2234
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR $S1359_i
	call	_AIRadarForwardCheck
	add	sp,6
; Line 2235
; Line 2236
$I2099:
; Line 2237
; Line 2238
; Line 2240
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Formation
	jne	$JCC13312
	jmp	$I2110
$JCC13312:
; Line 2243
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$JCC13331
	jmp	$I2110
$JCC13331:
; Line 2246
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I2102
; Line 2247
	mov	ax,WORD PTR _Px
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-36],ax	;dxl
; Line 2248
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-38],ax	;dyl
; Line 2249
	mov	ax,WORD PTR _FPARAMS
	mov	dx,WORD PTR _FPARAMS+2
	mov	cl,3
	mov	bx,WORD PTR $S1359_i
	shl	bx,cl
	sub	ax,WORD PTR _ailoc[bx]
	sbb	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-16],ax	;lx
	mov	WORD PTR [bp-14],dx
; Line 2250
	mov	ax,WORD PTR _FPARAMS+8
	mov	dx,WORD PTR _FPARAMS+10
	sub	ax,WORD PTR _ailoc[bx+4]
	sbb	dx,WORD PTR _ailoc[bx+6]
	mov	WORD PTR [bp-22],ax	;ly
	mov	WORD PTR [bp-20],dx
; Line 2251
	mov	WORD PTR [bp-40],1024	;friendval
; Line 2252
; Line 2253
	jmp	SHORT $I2103
	nop	
$I2102:
; Line 2254
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	si,ax
	mov	ax,WORD PTR _ps[si+2]
	mov	di,WORD PTR $S1358_psi
	sub	ax,WORD PTR [di+2]
	mov	WORD PTR [bp-36],ax	;dxl
; Line 2255
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR [di+4]
	mov	WORD PTR [bp-38],ax	;dyl
; Line 2256
	mov	cl,3
	mov	bx,WORD PTR _bv[bx+10]
	mov	ax,bx
	shl	bx,cl
	mov	dx,WORD PTR _ailoc[bx]
	mov	si,WORD PTR _ailoc[bx+2]
	mov	di,WORD PTR $S1359_i
	shl	di,cl
	sub	dx,WORD PTR _ailoc[di]
	sbb	si,WORD PTR _ailoc[di+2]
	mov	WORD PTR [bp-16],dx	;lx
	mov	WORD PTR [bp-14],si
; Line 2257
	mov	cx,WORD PTR _ailoc[bx+4]
	mov	dx,WORD PTR _ailoc[bx+6]
	sub	cx,WORD PTR _ailoc[di+4]
	sbb	dx,WORD PTR _ailoc[di+6]
	mov	WORD PTR [bp-22],cx	;ly
	mov	WORD PTR [bp-20],dx
; Line 2258
	push	ax
	call	_FriendStatus
	add	sp,2
	mov	WORD PTR [bp-40],ax	;friendval
; Line 2259
$I2103:
; Line 2260
	sub	ax,ax
	push	ax
	lea	cx,WORD PTR [bp-50]	;enemyalt
	push	cx
	lea	cx,WORD PTR [bp-10]	;tdistnm
	push	cx
	lea	cx,WORD PTR [bp-32]	;tanglel
	push	cx
	lea	cx,WORD PTR [bp-34]	;tpitchl
	push	cx
	lea	dx,WORD PTR [bp-18]	;tdistl
	push	dx
	push	WORD PTR [bp-38]	;dyl
	push	WORD PTR [bp-36]	;dxl
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 2262
	mov	ax,WORD PTR [bp-22]	;ly
	mov	dx,WORD PTR [bp-20]
	neg	ax
	adc	dx,0
	neg	dx
	push	dx
	push	ax
	push	WORD PTR [bp-14]
	push	WORD PTR [bp-16]	;lx
	call	_Langle
	add	sp,8
	mov	WORD PTR [bp-28],ax	;ltangle
; Line 2278
	push	WORD PTR [bp-40]	;friendval
	push	WORD PTR $S1359_i
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	jne	$I2104
	mov	al,BYTE PTR $S1359_i
	xor	al,BYTE PTR _Rtime
	test	al,7
	je	$I2104
; Line 2279
	push	WORD PTR [bp-34]	;tpitchl
	push	WORD PTR [bp-28]	;ltangle
	push	WORD PTR [bp-18]	;tdistl
	call	_CheckGunFiring
	add	sp,6
; Line 2281
$I2104:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Immelmann
	je	$I2110
	cmp	WORD PTR _bv[bx],OFFSET _SplitS
	je	$I2110
; Line 2283
; Line 2285
	cmp	WORD PTR [bp-10],20	;tdistnm
	jae	$I2108
; Line 2287
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _BracketLeft
	je	$I2109
	cmp	WORD PTR _bv[bx],OFFSET _BracketRight
	je	$I2109
	cmp	WORD PTR _bv[bx],OFFSET _FlyStraight
	jne	$I2108
$I2109:
; Line 2288
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _StraightAttack
; Line 2289
; Line 2290
$I2108:
; Line 2292
	cmp	WORD PTR [bp-10],10	;tdistnm
	ja	$I2110
; Line 2293
	push	WORD PTR [bp-46]	;leadernum
	push	WORD PTR [bp-26]	;wingnum
	push	WORD PTR [bp-32]	;tanglel
	call	_CloseInFight
	add	sp,6
; Line 2295
$I2110:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_FriendlyChooseBehavior	ENDP
; Line 2298
	PUBLIC	_KeepBehavior
_KeepBehavior	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	prewing = 6
;	tdistnm = 4
; Line 2299
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Wall
	je	$I2117
	cmp	WORD PTR _bv[bx],OFFSET _Wall2
	jne	$I2116
$I2117:
; Line 2300
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
$I2116:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Ladder
	je	$I2117
	cmp	WORD PTR _bv[bx],OFFSET _Ladder2
	je	$I2117
	cmp	WORD PTR _bv[bx],OFFSET _LadderCircle
	je	$I2117
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AIBombTarget
	je	$I2117
	cmp	WORD PTR _bv[bx],OFFSET _AIGetBombDist
	je	$I2117
	cmp	WORD PTR _bv[bx],OFFSET _LowBombTarget
	je	$I2117
	push	WORD PTR $S1359_i
	call	_IsBombing
	mov	sp,bp
	or	ax,ax
	jne	$I2117
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AIGoHome
	je	$I2117
	cmp	WORD PTR _bv[bx],OFFSET _AIGoHome2
	je	$I2117
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	je	$I2117
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	je	$I2117
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _GorillaBomb
	jne	$JCC13937
	jmp	$I2117
$JCC13937:
	cmp	WORD PTR _bv[bx],OFFSET _GorillaCover
	jne	$JCC13948
	jmp	$I2117
$JCC13948:
	cmp	WORD PTR _bv[bx],OFFSET _RearCover
	jne	$JCC13959
	jmp	$I2117
$JCC13959:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FlyCruise
	jne	$JCC13979
	jmp	$I2117
$JCC13979:
	cmp	WORD PTR _bv[bx],OFFSET _EngageTrain
	jne	$JCC13990
	jmp	$I2117
$JCC13990:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FlyWayPoint
	jne	$JCC14010
	jmp	$I2117
$JCC14010:
	cmp	WORD PTR _bv[bx],OFFSET _FlyWPFollowPlayer
	jne	$JCC14021
	jmp	$I2117
$JCC14021:
	cmp	WORD PTR _bv[bx],OFFSET _FollowPlayer
	jne	$JCC14032
	jmp	$I2117
$JCC14032:
; Line 2322
; Line 2323
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _SARWait
	jne	$JCC14052
	jmp	$I2117
$JCC14052:
	cmp	WORD PTR _bv[bx],OFFSET _SAR
	jne	$JCC14063
	jmp	$I2117
$JCC14063:
	cmp	WORD PTR _bv[bx],OFFSET _DoAltHover
	jne	$JCC14074
	jmp	$I2117
$JCC14074:
; Line 2325
; Line 2326
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Immelmann
	jne	$JCC14094
	jmp	$I2117
$JCC14094:
	cmp	WORD PTR _bv[bx],OFFSET _SplitS
	jne	$JCC14105
	jmp	$I2117
$JCC14105:
	cmp	WORD PTR _bv[bx],OFFSET _FlySanitize
	jne	$JCC14116
	jmp	$I2117
$JCC14116:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Formation
	jne	$I2143
; Line 2333
	test	BYTE PTR _bv[bx+21],2
	je	$JCC14143
	jmp	$I2117
$JCC14143:
; Line 2334
	sub	ax,ax
	push	ax
	push	WORD PTR $S1359_i
	call	_ImNotaFighter
	mov	sp,bp
	or	ax,ax
	je	$JCC14162
	jmp	$I2117
$JCC14162:
; Line 2335
	cmp	WORD PTR [bp+4],31	;tdistnm
	jge	$I2146
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp+6]	;prewing
	cmp	WORD PTR _bv[bx+6],ax
	jne	$I2146
; Line 2336
	mov	WORD PTR _bv[bx],OFFSET _BracketLeft
; Line 2337
	jmp	$I2117
$I2146:
	cmp	WORD PTR [bp+4],31	;tdistnm
	jge	$I2148
; Line 2338
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _BracketRight
; Line 2339
	jmp	$I2117
$I2148:
	cmp	WORD PTR [bp+4],20	;tdistnm
$L20079:
	jl	$JCC14228
	jmp	$I2117
$JCC14228:
; Line 2340
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _StraightAttack
; Line 2341
; Line 2342
; Line 2343
; Line 2344
	jmp	$I2117
	nop	
$I2143:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _BracketLeft
	je	$I2153
	cmp	WORD PTR _bv[bx],OFFSET _BracketRight
	je	$I2153
	cmp	WORD PTR _bv[bx],OFFSET _FlyStraight
	jne	$I2152
$I2153:
; Line 2347
	cmp	WORD PTR [bp+4],23	;tdistnm
	jmp	SHORT $L20079
	nop	
$I2152:
; Line 2352
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	

_KeepBehavior	ENDP
; Line 2358
	PUBLIC	_ChooseBehavior
_ChooseBehavior	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,68
	call	__aNchkstk
	push	di
	push	si
;	secplace = -6
;	tprewing = -4
;	wingnum = -36
;	leadernum = -60
;	enemyalt = -66
;	lx = -26
;	ly = -34
;	ltangle = -42
;	enemynum = -64
;	friendval = -56
;	checkarmed = -40
;	trainhead = -2
;	bandit = -10
;	dxl = -50
;	dyl = -52
;	dxw = -22
;	dyw = -30
;	tanglel = -46
;	tanglew = -16
;	tpitchl = -48
;	tpitchw = -20
;	ranglel = -38
;	ranglew = -8
;	rranglel = -44
;	rranglew = -14
;	tdistl = -28
;	tdistw = -68
;	tdistnm = -18
;	changew = -62
;	changel = -12
;	prewing = -58
;	wingcnt = -54
; Line 2363
	sub	ax,ax
	mov	WORD PTR [bp-62],ax	;changew
	mov	WORD PTR [bp-12],ax	;changel
; Line 2375
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FlyCruise
	jne	$JCC14332
	jmp	$I2266
$JCC14332:
; Line 2378
	mov	al,BYTE PTR $S1359_i
	xor	al,BYTE PTR _Rtime
	test	al,7
	je	$I2191
; Line 2379
	call	_UpdateWing
; Line 2380
	cmp	WORD PTR _KnockItOffStatus,1
	jne	$I2191
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],146
	jne	$I2191
; Line 2381
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	si,ax
	mov	WORD PTR _bv[si],OFFSET _AIGoHome
; Line 2382
	or	BYTE PTR _ps[bx+24],4
; Line 2383
	or	BYTE PTR _bv[si+21],2
; Line 2384
; Line 2385
$I2191:
; Line 2387
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],32
	je	$JCC14413
	jmp	$I2266
$JCC14413:
; Line 2393
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-58],ax	;prewing
	inc	ax
	jne	$I2193
; Line 2394
	call	_FriendlyChooseBehavior
; Line 2395
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 2396
; Line 2399
	nop	
$I2193:
	mov	ax,WORD PTR [bp-58]	;prewing
	cmp	WORD PTR $S1359_i,ax
	jne	$I2196
	mov	cl,BYTE PTR $S1359_i
	add	cl,BYTE PTR _Rtime
	test	cl,127
	jne	$I2196
; Line 2400
	mov	cx,1024
	push	cx
	push	WORD PTR $S1359_i
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	jne	$I2195
	push	WORD PTR _LOCKED
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR [bp-58]	;prewing
	jne	$I2195
; Line 2401
	mov	WORD PTR _tempgotcha,4
; Line 2402
	push	WORD PTR _LOCKED
	call	_gotcha
	add	sp,2
; Line 2403
	mov	WORD PTR _tempgotcha,5
; Line 2404
	mov	ax,70
	push	ax
	call	_gotcha
	add	sp,2
; Line 2405
	mov	WORD PTR _tempgotcha,-999
; Line 2406
; Line 2407
$I2195:
; Line 2408
	push	WORD PTR $S1359_i
	call	_CheckDetection
	add	sp,2
	mov	WORD PTR [bp-64],ax	;enemynum
	cmp	ax,-999
	je	$I2196
; Line 2409
	mov	WORD PTR _tempgotcha,6
; Line 2410
	push	ax
	call	_gotcha
	add	sp,2
; Line 2411
	mov	WORD PTR _tempgotcha,-999
; Line 2412
; Line 2413
$I2196:
; Line 2417
	mov	al,BYTE PTR $S1359_i
	xor	al,BYTE PTR _Rtime
	test	al,15
	je	$I2199
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	je	$JCC14599
	jmp	$I2266
$JCC14599:
$I2199:
	mov	al,BYTE PTR $S1359_i
	xor	al,BYTE PTR _Rtime
	test	al,7
	je	$JCC14613
	jmp	$I2266
$JCC14613:
; Line 2420
	mov	ax,1
	push	ax
	push	WORD PTR $S1359_i
	call	_ImNotaFighter
	add	sp,4
	or	ax,ax
	je	$I2203
; Line 2421
	mov	WORD PTR [bp-40],0	;checkarmed
; Line 2422
	push	WORD PTR _LOCKED
	call	_GetSquadLeader
	add	sp,2
	cmp	ax,WORD PTR [bp-58]	;prewing
	jne	$I2201
; Line 2423
	mov	WORD PTR [bp-40],1	;checkarmed
; Line 2424
; Line 2425
$I2201:
; Line 2426
	push	WORD PTR $S1359_i
	call	_CheckDetection
	add	sp,2
	mov	WORD PTR [bp-64],ax	;enemynum
	cmp	ax,-999
	je	$I2202
; Line 2427
	mov	WORD PTR [bp-40],1	;checkarmed
; Line 2428
; Line 2429
$I2202:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	je	$I2203
	cmp	WORD PTR [bp-40],0	;checkarmed
	je	$I2203
; Line 2430
	and	BYTE PTR _bv[bx+21],253
; Line 2431
	or	BYTE PTR _bv[bx+21],1
; Line 2432
	sub	ax,ax
	push	ax
	push	WORD PTR $S1359_i
	call	_ChangeGroupBehavior
	add	sp,4
; Line 2434
; Line 2435
$I2203:
; Line 2437
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-36],ax	;wingnum
; Line 2438
	mov	ax,WORD PTR _bv[bx+2]
	mov	WORD PTR [bp-60],ax	;leadernum
; Line 2441
	push	WORD PTR $S1359_i
	call	_CheckDetection
	add	sp,2
	mov	WORD PTR [bp-10],ax	;bandit
	cmp	ax,-999
	jne	$JCC14768
	jmp	$I2213
$JCC14768:
; Line 2442
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],32
	jne	$I2205
; Line 2443
	or	BYTE PTR _bv[bx+21],1
; Line 2444
$I2205:
	push	WORD PTR $S1359_i
	call	_CheckAIBombs
	add	sp,2
	inc	ax
	jne	$JCC14805
	jmp	$I2213
$JCC14805:
; Line 2445
	cmp	WORD PTR [bp-10],-1	;bandit
	jne	$I2207
; Line 2446
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-50],ax	;dxl
; Line 2447
	mov	cx,WORD PTR _Py
	sub	cx,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-52],cx	;dyl
; Line 2448
	push	cx
	jmp	SHORT $L20080
	nop	
$I2207:
; Line 2451
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR [bp-10]	;bandit
	mov	si,ax
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR _ps[bx+4]
	push	ax
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR _ps[bx+2]
$L20080:
	push	ax
	call	_xydist
	add	sp,4
	mov	WORD PTR [bp-28],ax	;tdistl
; Line 2452
; Line 2453
	cmp	ax,450
	jae	$I2213
; Line 2454
	push	WORD PTR $S1359_i
	call	_ShowJettison
	add	sp,2
; Line 2455
	push	WORD PTR $S1359_i
	call	_CheckAIMissiles
	add	sp,2
	inc	ax
	jne	$I2212
	les	bx,DWORD PTR _ptype
	cmp	WORD PTR es:[bx+20],1
	je	$I2212
	cmp	WORD PTR es:[bx+20],2
	jne	$I2211
$I2212:
; Line 2456
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _StraightAttack
; Line 2457
	and	BYTE PTR _bv[bx+21],253
; Line 2458
; Line 2459
	jmp	SHORT $I2213
$I2211:
; Line 2460
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 2461
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 2467
	push	WORD PTR $S1359_i
	call	_GetAIBase
	add	sp,2
; Line 2468
$I2213:
; Line 2469
; Line 2470
; Line 2471
; Line 2473
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _bv[bx+22],ax
	jl	$JCC15017
	jmp	$I2214
$JCC15017:
	cmp	WORD PTR _bv[bx+22],0
	jne	$JCC15027
	jmp	$I2214
$JCC15027:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	si,ax
	test	WORD PTR _ps[si+24],-32764
	je	$JCC15047
	jmp	$I2214
$JCC15047:
	cmp	WORD PTR _DOINVISIBLE,0
	je	$JCC15057
	jmp	$I2214
$JCC15057:
	cmp	WORD PTR _ENEMYNODIE,0
	je	$JCC15067
	jmp	$I2214
$JCC15067:
; Line 2474
	cmp	WORD PTR [bp-60],-999	;leadernum
	je	$I2215
; Line 2475
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 2476
; Line 2477
	jmp	SHORT $I2216
	nop	
$I2215:
; Line 2478
	mov	bx,WORD PTR $S1358_psi
	or	BYTE PTR [bx+24],4
; Line 2479
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 2480
$I2216:
; Line 2481
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+22],0
; Line 2482
	test	BYTE PTR _bv[bx+21],2
	jne	$I2217
; Line 2483
	mov	WORD PTR _tempgotcha,7
; Line 2484
	push	WORD PTR _bv[bx+10]
	call	_gotcha
	add	sp,2
; Line 2485
	mov	WORD PTR _tempgotcha,-999
; Line 2486
; Line 2496
$I2217:
	push	WORD PTR $S1359_i
	call	_GetAIBase
	add	sp,2
; Line 2498
$L20088:
	cmp	WORD PTR [bp-36],0	;wingnum
	jl	$I2219
; Line 2499
	mov	ax,46
	imul	WORD PTR [bp-36]	;wingnum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FreeFighter
	jne	$I2219
; Line 2500
	mov	WORD PTR _bv[bx],OFFSET _StraightAttack
; Line 2501
; Line 2502
$I2219:
; Line 2503
	cmp	WORD PTR [bp-60],0	;leadernum
	jge	$JCC15197
	jmp	$I2266
$JCC15197:
; Line 2504
	mov	ax,46
	imul	WORD PTR [bp-60]	;leadernum
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _FreeFighter
	je	$JCC15216
	jmp	$I2266
$JCC15216:
; Line 2505
	mov	WORD PTR _bv[bx],OFFSET _StraightAttack
; Line 2506
; Line 2507
; Line 2508
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 2509
; Line 2511
	nop	
$I2214:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I2222
; Line 2512
	mov	ax,WORD PTR _Px
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-50],ax	;dxl
; Line 2513
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-52],ax	;dyl
; Line 2514
	mov	ax,WORD PTR _FPARAMS
	mov	dx,WORD PTR _FPARAMS+2
	mov	cl,3
	mov	bx,WORD PTR $S1359_i
	shl	bx,cl
	sub	ax,WORD PTR _ailoc[bx]
	sbb	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-26],ax	;lx
	mov	WORD PTR [bp-24],dx
; Line 2515
	mov	ax,WORD PTR _FPARAMS+8
	mov	dx,WORD PTR _FPARAMS+10
	sub	ax,WORD PTR _ailoc[bx+4]
	sbb	dx,WORD PTR _ailoc[bx+6]
	mov	WORD PTR [bp-34],ax	;ly
	mov	WORD PTR [bp-32],dx
; Line 2516
	mov	WORD PTR [bp-56],1024	;friendval
; Line 2517
	mov	ax,WORD PTR _OurHead
	jmp	$L20081
	nop	
$I2222:
; Line 2520
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	si,ax
	mov	ax,WORD PTR _ps[si+2]
	mov	di,WORD PTR $S1358_psi
	sub	ax,WORD PTR [di+2]
	mov	WORD PTR [bp-50],ax	;dxl
; Line 2521
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR [di+4]
	mov	WORD PTR [bp-52],ax	;dyl
; Line 2522
	mov	cl,3
	mov	bx,WORD PTR _bv[bx+10]
	mov	ax,bx
	shl	bx,cl
	mov	dx,WORD PTR _ailoc[bx]
	mov	si,WORD PTR _ailoc[bx+2]
	mov	di,WORD PTR $S1359_i
	shl	di,cl
	sub	dx,WORD PTR _ailoc[di]
	sbb	si,WORD PTR _ailoc[di+2]
	mov	WORD PTR [bp-26],dx	;lx
	mov	WORD PTR [bp-24],si
; Line 2523
	mov	cx,WORD PTR _ailoc[bx+4]
	mov	dx,WORD PTR _ailoc[bx+6]
	sub	cx,WORD PTR _ailoc[di+4]
	sbb	dx,WORD PTR _ailoc[di+6]
	mov	WORD PTR [bp-34],cx	;ly
	mov	WORD PTR [bp-32],dx
; Line 2524
	push	ax
	call	_FriendStatus
	add	sp,2
	mov	WORD PTR [bp-56],ax	;friendval
; Line 2525
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
$L20081:
	mov	WORD PTR [bp-2],ax	;trainhead
; Line 2526
; Line 2528
	sub	ax,ax
	push	ax
	lea	cx,WORD PTR [bp-66]	;enemyalt
	push	cx
	lea	cx,WORD PTR [bp-18]	;tdistnm
	push	cx
	lea	cx,WORD PTR [bp-46]	;tanglel
	push	cx
	lea	dx,WORD PTR [bp-48]	;tpitchl
	push	dx
	lea	dx,WORD PTR [bp-28]	;tdistl
	push	dx
	push	WORD PTR [bp-52]	;dyl
	push	WORD PTR [bp-50]	;dxl
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 2530
	mov	ax,WORD PTR [bp-34]	;ly
	mov	dx,WORD PTR [bp-32]
	neg	ax
	adc	dx,0
	neg	dx
	push	dx
	push	ax
	push	WORD PTR [bp-24]
	push	WORD PTR [bp-26]	;lx
	call	_Langle
	add	sp,8
	mov	WORD PTR [bp-42],ax	;ltangle
; Line 2533
	push	WORD PTR [bp-56]	;friendval
	push	WORD PTR $S1359_i
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	jne	$I2225
; Line 2534
	cmp	WORD PTR _ENEMYNODIE,ax
	je	$I2226
	mov	ax,WORD PTR [bp-46]	;tanglel
	sub	ax,WORD PTR [bp-2]	;trainhead
	add	ah,128
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,4096
	jg	$I2226
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-46]	;tanglel
	sub	ax,WORD PTR _ps[bx+16]
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,4096
	jle	$I2225
$I2226:
; Line 2535
	push	WORD PTR [bp-48]	;tpitchl
	push	WORD PTR [bp-42]	;ltangle
	push	WORD PTR [bp-28]	;tdistl
	call	_CheckGunFiring
	add	sp,6
; Line 2536
$I2225:
; Line 2538
	mov	bx,WORD PTR $S1358_psi
	test	WORD PTR [bx+24],-32764
	je	$JCC15636
	jmp	$I2266
$JCC15636:
; Line 2541
	push	WORD PTR [bp-58]	;prewing
	call	_IsCAPFlier
	add	sp,2
	or	ax,ax
	jne	$I2229
	push	WORD PTR [bp-58]	;prewing
	call	_IsRefueling
	add	sp,2
	or	ax,ax
	je	$I2228
$I2229:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _StraightAttack
	je	$JCC15682
	jmp	$I2266
$JCC15682:
; Line 2544
$I2228:
	push	WORD PTR $S1359_i
	call	_CheckAITarget
	add	sp,2
; Line 2546
	push	WORD PTR [bp-58]	;prewing
	push	WORD PTR [bp-18]	;tdistnm
	call	_KeepBehavior
	add	sp,4
	or	ax,ax
	je	$JCC15711
	jmp	$I2266
$JCC15711:
; Line 2547
	cmp	WORD PTR [bp-18],33	;tdistnm
	ja	$JCC15720
	jmp	$I2232
$JCC15720:
; Line 2551
	push	WORD PTR $S1359_i
	call	_CheckAnyEnemyLock
	add	sp,2
	or	ax,ax
	jne	$I2235
	cmp	WORD PTR [bp-18],40	;tdistnm
	jbe	$I2234
$I2235:
; Line 2552
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Box
	jne	$JCC15760
	jmp	$I2266
$JCC15760:
; Line 2553
	mov	WORD PTR _bv[bx],OFFSET _Box
; Line 2559
; Line 2560
; Line 2561
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2234:
; Line 2562
	push	WORD PTR $S1359_i
	call	_CheckDetection
	add	sp,2
	cmp	ax,-999
	jne	$JCC15791
	jmp	$I2266
$JCC15791:
; Line 2563
	mov	ax,WORD PTR [bp-58]	;prewing
	mov	WORD PTR [bp-4],ax	;tprewing
; Line 2564
	mov	ax,WORD PTR $S1359_i
	jmp	SHORT $L20086
	nop	
$FC2243:
; Line 2567
	mov	ax,46
	imul	WORD PTR [bp-54]	;wingcnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Champagne
; Line 2568
	mov	al,BYTE PTR _bv[bx+20]
	and	ax,15
	mov	WORD PTR [bp-6],ax	;secplace
; Line 2569
	cmp	ax,2
	jg	$I2245
; Line 2570
	and	BYTE PTR _bv[bx+21],254
; Line 2571
$I2245:
	mov	ax,46
	imul	WORD PTR [bp-54]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-54],ax	;wingcnt
; Line 2572
$L20082:
	cmp	WORD PTR [bp-54],0	;wingcnt
	jge	$FC2243
; Line 2574
	mov	ax,46
	imul	WORD PTR [bp-4]	;tprewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-4],ax	;tprewing
$L20086:
	mov	WORD PTR [bp-54],ax	;wingcnt
; Line 2575
	cmp	WORD PTR [bp-4],0	;tprewing
	jge	$L20082
; Line 2576
; Line 2577
; Line 2578
; Line 2579
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2232:
	cmp	WORD PTR [bp-18],10	;tdistnm
	ja	$JCC15898
	jmp	$I2247
$JCC15898:
; Line 2580
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Box
	jne	$I2248
	cmp	WORD PTR [bp-18],33	;tdistnm
	jae	$I2248
; Line 2587
	mov	ax,46
	imul	WORD PTR [bp-54]	;wingcnt
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+20]
	and	ax,15
	mov	WORD PTR [bp-6],ax	;secplace
	cmp	ax,2
	jg	$I2249
; Line 2588
	and	BYTE PTR _bv[bx+21],254
; Line 2589
$I2249:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Champagne
; Line 2590
; Line 2592
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2248:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Champagne
	jne	$I2251
	cmp	WORD PTR [bp-18],17	;tdistnm
	jb	$I2252
	cmp	WORD PTR [bp-18],20	;tdistnm
	jae	$I2251
	push	WORD PTR [bp-58]	;prewing
	call	_CheckDetection
	add	sp,2
	cmp	ax,-999
	je	$I2251
$I2252:
; Line 2593
; Line 2594
	mov	ax,WORD PTR [bp-58]	;prewing
$L20085:
	mov	WORD PTR [bp-54],ax	;wingcnt
; Line 2595
	or	ax,ax
	jge	$JCC16027
	jmp	$I2266
$JCC16027:
; Line 2596
	jmp	SHORT $L20084
$FC2257:
; Line 2603
	mov	ax,46
	imul	WORD PTR [bp-54]	;wingcnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _FlyStraight
; Line 2604
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-54],ax	;wingcnt
; Line 2605
$L20084:
	or	ax,ax
	jge	$FC2257
; Line 2607
	mov	ax,46
	imul	WORD PTR [bp-58]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-58],ax	;prewing
	jmp	SHORT $L20085
$I2251:
	cmp	WORD PTR [bp-18],15	;tdistnm
	jae	$I2266
; Line 2611
	push	WORD PTR $S1359_i
	call	_CheckDetection
	add	sp,2
	cmp	ax,-999
	je	$I2266
; Line 2612
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Jink2
	jmp	$L20088
	nop	
$I2247:
; Line 2627
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+22],0
	jne	$I2267
; Line 2628
; Line 2629
	mov	ax,WORD PTR _bv[bx+42]
	add	ax,3
	mov	cx,40
	imul	cx
	add	ax,WORD PTR _Gtime
	mov	WORD PTR _bv[bx+22],ax
; Line 2630
; Line 2631
$I2267:
	push	WORD PTR [bp-60]	;leadernum
	push	WORD PTR [bp-36]	;wingnum
	push	WORD PTR [bp-46]	;tanglel
	call	_CloseInFight
	add	sp,6
; Line 2632
$I2266:
; Line 2636
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ChooseBehavior	ENDP
; Line 2638
	PUBLIC	_StraightAttack
_StraightAttack	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,54
	call	__aNchkstk
	push	di
	push	si
;	dx = -40
;	dy = -46
;	dz = -48
;	relangle = -30
;	rrelangle = -38
;	enemyhead = -6
;	tangle = -32
;	tpitch = -36
;	troll = -44
;	enemyalt = -54
;	enemyroll = -20
;	tdist = -24
;	distnm = -52
;	distkm = -34
;	lx = -12
;	ly = -16
;	ldist = -4
;	targetspeed = -22
;	endpitch = -50
;	alttemp = -18
;	tdist2 = -28
;	orgspeed = -26
;	leadernum = -42
;	orgrelangle = -8
; Line 2650
	mov	WORD PTR [bp-42],-999	;leadernum
; Line 2653
	mov	ax,40
	imul	WORD PTR _planecnt
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_IsBoat
	add	sp,2
	or	ax,ax
	jne	$I2294
	push	ax
	push	WORD PTR _planecnt
	call	_ImNotaFighter
	add	sp,4
	or	ax,ax
	je	$I2293
$I2294:
; Line 2654
	call	_FlyWayPoint
; Line 2655
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 2656
; Line 2658
	nop	
$I2293:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
	mov	WORD PTR [bp-26],ax	;orgspeed
; Line 2660
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	mov	WORD PTR _bv[bx+18],ax
; Line 2662
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I2295
; Line 2663
	mov	ax,WORD PTR _Px
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-40],ax	;dx
; Line 2664
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-46],ax	;dy
; Line 2665
	mov	ax,WORD PTR _FPARAMS
	mov	dx,WORD PTR _FPARAMS+2
	mov	cl,3
	mov	bx,WORD PTR $S1359_i
	shl	bx,cl
	sub	ax,WORD PTR _ailoc[bx]
	sbb	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-12],ax	;lx
	mov	WORD PTR [bp-10],dx
; Line 2666
	mov	ax,WORD PTR _FPARAMS+8
	mov	dx,WORD PTR _FPARAMS+10
	sub	ax,WORD PTR _ailoc[bx+4]
	sbb	dx,WORD PTR _ailoc[bx+6]
	jmp	SHORT $L20089
	nop	
$I2295:
; Line 2669
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	si,ax
	mov	ax,WORD PTR _ps[si+2]
	mov	di,WORD PTR $S1358_psi
	sub	ax,WORD PTR [di+2]
	mov	WORD PTR [bp-40],ax	;dx
; Line 2670
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR [di+4]
	mov	WORD PTR [bp-46],ax	;dy
; Line 2671
	mov	cl,3
	mov	bx,WORD PTR _bv[bx+10]
	shl	bx,cl
	mov	ax,WORD PTR _ailoc[bx]
	mov	dx,WORD PTR _ailoc[bx+2]
	mov	si,WORD PTR $S1359_i
	shl	si,cl
	sub	ax,WORD PTR _ailoc[si]
	sbb	dx,WORD PTR _ailoc[si+2]
	mov	WORD PTR [bp-12],ax	;lx
	mov	WORD PTR [bp-10],dx
; Line 2672
	mov	ax,WORD PTR _ailoc[bx+4]
	mov	dx,WORD PTR _ailoc[bx+6]
	sub	ax,WORD PTR _ailoc[si+4]
	sbb	dx,WORD PTR _ailoc[si+6]
$L20089:
	mov	WORD PTR [bp-16],ax	;ly
	mov	WORD PTR [bp-14],dx
; Line 2673
; Line 2676
	lea	ax,WORD PTR [bp-4]	;ldist
	push	ax
	sub	ax,ax
	push	ax
	lea	ax,WORD PTR [bp-54]	;enemyalt
	push	ax
	lea	cx,WORD PTR [bp-52]	;distnm
	push	cx
	lea	cx,WORD PTR [bp-32]	;tangle
	push	cx
	lea	dx,WORD PTR [bp-36]	;tpitch
	push	dx
	lea	dx,WORD PTR [bp-24]	;tdist
	push	dx
	push	WORD PTR [bp-14]
	push	WORD PTR [bp-16]	;ly
	push	WORD PTR [bp-10]
	push	WORD PTR [bp-12]	;lx
	push	WORD PTR $S1359_i
	call	_LGetTargADP
	add	sp,24
; Line 2678
	push	WORD PTR [bp-32]	;tangle
	push	WORD PTR [bp-24]	;tdist
	call	_CheckRadarSet
	add	sp,4
; Line 2680
	mov	ax,WORD PTR [bp-32]	;tangle
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+16]
	mov	WORD PTR [bp-30],ax	;relangle
	mov	WORD PTR [bp-8],ax	;orgrelangle
; Line 2681
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I2297
; Line 2682
	mov	ax,WORD PTR _OurHead
	mov	WORD PTR [bp-6],ax	;enemyhead
; Line 2683
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	call	_GetDAltSpeed
	add	sp,2
	add	ax,WORD PTR _Knots
	mov	WORD PTR [bp-22],ax	;targetspeed
; Line 2684
	mov	ax,WORD PTR _Alt
	mov	WORD PTR [bp-54],ax	;enemyalt
; Line 2685
	mov	ax,WORD PTR _OurRoll
	jmp	SHORT $L20090
$I2297:
; Line 2688
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	si,ax
	mov	ax,WORD PTR _ps[si+16]
	mov	WORD PTR [bp-6],ax	;enemyhead
; Line 2689
	mov	ax,46
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
	mov	WORD PTR [bp-22],ax	;targetspeed
; Line 2690
	mov	ax,WORD PTR _ps[si+6]
	mov	WORD PTR [bp-54],ax	;enemyalt
; Line 2691
	mov	ax,WORD PTR _ps[si+20]
$L20090:
	mov	WORD PTR [bp-20],ax	;enemyroll
; Line 2692
; Line 2693
	mov	ax,WORD PTR [bp-32]	;tangle
	sub	ax,WORD PTR [bp-6]	;enemyhead
	add	ah,128
	mov	WORD PTR [bp-38],ax	;rrelangle
; Line 2694
	mov	ax,WORD PTR [bp-36]	;tpitch
	mov	WORD PTR _pdest,ax
; Line 2696
	push	WORD PTR [bp-30]	;relangle
	call	_abs
	add	sp,2
	cmp	ax,12288
	jl	$JCC16663
	jmp	$I2299
$JCC16663:
; Line 2697
	push	WORD PTR [bp-30]	;relangle
	call	_abs
	add	sp,2
	cmp	ax,6144
	jle	$I2300
	cmp	WORD PTR [bp-52],2	;distnm
	jae	$I2300
; Line 2698
	push	WORD PTR [bp-38]	;rrelangle
	call	_abs
	add	sp,2
	cmp	ax,8192
	jg	$JCC16700
	jmp	$I2311
$JCC16700:
; Line 2700
	cmp	WORD PTR [bp-22],300	;targetspeed
	jle	$I2302
; Line 2701
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-22]	;targetspeed
	sar	ax,1
	jmp	$L20091
	nop	
$I2302:
; Line 2703
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],150
; Line 2704
; Line 2705
; Line 2706
	jmp	$I2311
$I2300:
	cmp	WORD PTR [bp-2],0
	jg	$I2305
	jl	$L20020
	cmp	WORD PTR [bp-4],7500	;ldist
	jae	$I2305
$L20020:
; Line 2708
	mov	ax,-100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;ldist
	call	__aNldiv
	add	ax,WORD PTR [bp-22]	;targetspeed
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],cx
; Line 2709
; Line 2710
	jmp	SHORT $I2311
$I2305:
	cmp	WORD PTR [bp-2],0
	jg	$I2307
	jl	$L20021
	cmp	WORD PTR [bp-4],20000	;ldist
	jae	$I2307
$L20021:
; Line 2711
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-22]	;targetspeed
	jmp	SHORT $L20091
	nop	
$I2307:
	cmp	WORD PTR [bp-2],1
	jg	$I2309
	jl	$L20022
	cmp	WORD PTR [bp-4],19464	;ldist
	jae	$I2309
$L20022:
; Line 2714
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-22]	;targetspeed
	add	ax,50
	jmp	SHORT $L20091
$I2309:
	cmp	WORD PTR [bp-2],2
	jg	$I2311
	jl	$L20023
	cmp	WORD PTR [bp-4],18928	;ldist
	jae	$I2311
$L20023:
; Line 2717
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-22]	;targetspeed
	add	ax,100
$L20091:
	mov	WORD PTR _bv[bx+18],ax
; Line 2718
; Line 2719
$I2311:
	push	WORD PTR [bp-30]	;relangle
	call	_abs
	add	sp,2
	cmp	ax,4096
	jge	$I2312
; Line 2720
	mov	cl,2
	shl	WORD PTR [bp-30],cl	;relangle
; Line 2721
	jmp	SHORT $I2313
	nop	
$I2312:
; Line 2722
	shl	WORD PTR [bp-30],1	;relangle
$I2313:
; Line 2723
	cmp	WORD PTR [bp-52],3	;distnm
	jb	$JCC16923
	jmp	$I2338
$JCC16923:
; Line 2724
	cmp	WORD PTR [bp-38],0	;rrelangle
	jge	$I2315
; Line 2725
	mov	ax,WORD PTR [bp-20]	;enemyroll
	add	ah,64
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,8192
	jl	$JCC16950
	jmp	$I2338
$JCC16950:
; Line 2726
	sub	WORD PTR [bp-30],4096	;relangle
; Line 2727
; Line 2728
; Line 2729
	jmp	$I2338
	nop	
$I2315:
	cmp	WORD PTR [bp-30],0	;relangle
	jg	$JCC16968
	jmp	$I2338
$JCC16968:
; Line 2730
	mov	ax,WORD PTR [bp-20]	;enemyroll
	sub	ax,16384
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,8192
	jl	$JCC16989
	jmp	$I2338
$JCC16989:
; Line 2731
	add	BYTE PTR [bp-29],16
; Line 2732
; Line 2733
; Line 2734
; Line 2735
; Line 2736
	jmp	$I2338
	nop	
$I2299:
	push	WORD PTR [bp-30]	;relangle
	call	_abs
	add	sp,2
	cmp	ax,22528
	jg	$JCC17014
	jmp	$I2321
$JCC17014:
; Line 2737
	push	WORD PTR [bp-38]	;rrelangle
	call	_abs
	add	sp,2
	cmp	ax,16384
	jge	$I2326
; Line 2738
	cmp	WORD PTR [bp-38],0	;rrelangle
	jge	$I2323
; Line 2739
	mov	ax,WORD PTR [bp-6]	;enemyhead
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+16]
	sub	ax,24576
	mov	WORD PTR [bp-30],ax	;relangle
; Line 2740
	or	ax,ax
	jle	$I2326
	jmp	SHORT $L20092
	nop	
$I2323:
; Line 2744
	mov	ax,WORD PTR [bp-6]	;enemyhead
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+16]
	add	ah,96
	mov	WORD PTR [bp-30],ax	;relangle
; Line 2745
	or	ax,ax
	jge	$I2326
; Line 2746
$L20092:
	neg	ax
	mov	WORD PTR [bp-30],ax	;relangle
; Line 2747
$I2326:
; Line 2748
; Line 2749
	push	WORD PTR [bp-30]	;relangle
	call	_abs
	add	sp,2
	cmp	ax,24576
	jg	$JCC17099
	jmp	$I2338
$JCC17099:
	push	WORD PTR [bp-38]	;rrelangle
	call	_abs
	add	sp,2
	cmp	ax,26624
	jg	$JCC17116
	jmp	$I2338
$JCC17116:
; Line 2750
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+42]
	mov	cx,ax
	shl	ax,1
	mov	dl,BYTE PTR $S1359_i
	add	dl,BYTE PTR _Gtime
	and	dx,31
	cmp	ax,dx
	jg	$JCC17151
	jmp	$I2338
$JCC17151:
	cmp	cx,2
	jg	$JCC17159
	jmp	$I2338
$JCC17159:
	test	BYTE PTR _bv[bx+21],128
	je	$JCC17169
	jmp	$I2338
$JCC17169:
	les	si,DWORD PTR _ptype
	cmp	WORD PTR es:[si+12],1
	jg	$JCC17183
	jmp	$I2338
$JCC17183:
; Line 2751
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	si,ax
	cmp	WORD PTR _ps[si+6],1000
	jl	$L20093
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],5250
	jle	$I2331
; Line 2756
$L20095:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _SplitS
; Line 2758
; Line 2759
	jmp	SHORT $I2338
	nop	
$I2331:
	test	BYTE PTR _Rtime,1
	je	$L20095
; Line 2760
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
$L20093:
	mov	WORD PTR _bv[bx],OFFSET _Immelmann
; Line 2766
; Line 2767
	jmp	SHORT $I2338
$I2321:
; Line 2779
	push	WORD PTR [bp-38]	;rrelangle
	call	_abs
	add	sp,2
	cmp	ax,8192
	jle	$I2338
	cmp	WORD PTR [bp-52],2	;distnm
	jae	$I2338
; Line 2780
	cmp	WORD PTR [bp-22],300	;targetspeed
	jle	$I2337
; Line 2781
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-22]	;targetspeed
	sar	ax,1
	mov	WORD PTR _bv[bx+18],ax
; Line 2782
	jmp	SHORT $I2338
	nop	
$I2337:
; Line 2783
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],150
$I2338:
; Line 2784
; Line 2785
; Line 2802
	push	WORD PTR [bp-30]	;relangle
	push	WORD PTR $S1359_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 2804
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR [bp-18],ax	;alttemp
; Line 2806
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	si,ax
	mov	ax,WORD PTR _bv[si+2]
	mov	WORD PTR [bp-42],ax	;leadernum
; Line 2807
	or	ax,ax
	jl	$I2341
; Line 2808
	mov	cx,46
	imul	cx
	mov	di,ax
	cmp	WORD PTR _bv[di],OFFSET _StraightAttack
	jne	$I2341
	mov	ax,WORD PTR _bv[si+10]
	cmp	WORD PTR _bv[di+10],ax
	jne	$I2341
; Line 2809
	cmp	WORD PTR [bp-24],135	;tdist
	jae	$I2341
; Line 2810
	test	BYTE PTR _ps[bx+25],5
	je	$I2342
; Line 2811
	mov	ax,40
	imul	WORD PTR [bp-42]	;leadernum
	mov	si,ax
	mov	ax,WORD PTR _ps[si+20]
	add	ax,WORD PTR _ps[bx+20]
	neg	ax
	mov	WORD PTR _droll,ax
; Line 2812
; Line 2813
$I2342:
	add	WORD PTR [bp-54],600	;enemyalt
; Line 2814
; Line 2815
$I2341:
; Line 2816
; Line 2818
	mov	ax,WORD PTR [bp-54]	;enemyalt
	cmp	WORD PTR [bp-18],ax	;alttemp
	jge	$I2343
; Line 2819
	sub	ax,250
	cmp	ax,WORD PTR [bp-18]	;alttemp
	jle	$I2344
	cmp	WORD PTR [bp-54],50	;enemyalt
	jle	$I2344
; Line 2820
	mov	WORD PTR [bp-50],8192	;endpitch
; Line 2821
	jmp	SHORT $I2347
$I2344:
	mov	ax,WORD PTR [bp-54]	;enemyalt
	sub	ax,5
	cmp	ax,WORD PTR [bp-18]	;alttemp
	jle	$I2346
	cmp	WORD PTR [bp-54],5	;enemyalt
	jle	$I2346
; Line 2822
	mov	WORD PTR [bp-50],2048	;endpitch
; Line 2823
	jmp	SHORT $I2347
$I2346:
; Line 2824
	mov	WORD PTR [bp-50],512	;endpitch
$I2347:
; Line 2825
	mov	ax,WORD PTR [bp-50]	;endpitch
	mov	WORD PTR _pdest,ax
; Line 2826
; Line 2827
	jmp	SHORT $I2354
	nop	
$I2343:
	inc	ax
	inc	ax
	cmp	ax,WORD PTR [bp-18]	;alttemp
	jge	$I2349
; Line 2828
	mov	ax,WORD PTR [bp-54]	;enemyalt
	add	ax,250
	cmp	ax,WORD PTR [bp-18]	;alttemp
	jge	$I2350
; Line 2829
	mov	WORD PTR [bp-50],-12288	;endpitch
; Line 2830
	jmp	SHORT $I2347
	nop	
$I2350:
	mov	ax,WORD PTR [bp-54]	;enemyalt
	add	ax,5
	cmp	ax,WORD PTR [bp-18]	;alttemp
	jge	$I2352
; Line 2831
	mov	WORD PTR [bp-50],-2048	;endpitch
; Line 2832
	jmp	SHORT $I2347
$I2352:
; Line 2833
	mov	WORD PTR [bp-50],-512	;endpitch
	jmp	SHORT $I2347
	nop	
$I2349:
; Line 2837
	mov	WORD PTR _pdest,0
$I2354:
; Line 2839
	cmp	WORD PTR [bp-52],4	;distnm
	jb	$JCC17570
	jmp	$I2362
$JCC17570:
; Line 2840
	push	WORD PTR [bp-38]	;rrelangle
	call	_abs
	add	sp,2
	cmp	ax,16384
	jge	$I2356
	push	WORD PTR [bp-8]	;orgrelangle
	call	_abs
	add	sp,2
	cmp	ax,8192
	jle	$I2356
; Line 2841
	mov	WORD PTR _pdest,10240
; Line 2842
; Line 2843
	jmp	SHORT $I2362
	nop	
$I2356:
	mov	ax,WORD PTR [bp-20]	;enemyroll
	add	ah,64
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,8192
	jl	$I2359
	mov	ax,WORD PTR [bp-20]	;enemyroll
	sub	ax,16384
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,8192
	jge	$I2362
$I2359:
; Line 2844
	push	WORD PTR [bp-38]	;rrelangle
	call	_abs
	add	sp,2
	cmp	ax,20480
	jle	$I2362
	push	WORD PTR [bp-8]	;orgrelangle
	call	_abs
	add	sp,2
	cmp	ax,8192
	jge	$I2362
; Line 2845
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+18],0
	jge	$I2362
	cmp	WORD PTR _ps[bx+6],250
	jle	$I2362
	mov	ax,WORD PTR [bp-54]	;enemyalt
	sub	ax,WORD PTR _ps[bx+6]
	cmp	ax,400
	jge	$I2362
; Line 2846
	cmp	WORD PTR _pdest,-8192
	jle	$I2362
; Line 2847
	mov	WORD PTR _pdest,-8192
; Line 2848
; Line 2849
$I2362:
; Line 2850
; Line 2851
; Line 2852
; Line 2854
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	add	ax,WORD PTR [bp-30]	;relangle
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+16],cx
; Line 2875
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_StraightAttack	ENDP
; Line 2879
	PUBLIC	_Ladder
_Ladder	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,78
	call	__aNchkstk
	push	di
	push	si
;	ty = -58
;	tz = -64
;	txl = -28
;	tyl = -32
;	tzl = -38
;	relangle = -36
;	rrelangle = -48
;	tangle = -40
;	tpitch = -46
;	troll = -56
;	leadhead = -26
;	isleader = -30
;	tanglel = -18
;	enemyalt = -68
;	tdist = -24
;	distkm = -44
;	tdistnm = -6
;	prewing = -42
;	prespeed = -22
;	secplace = -2
;	prewing2 = -62
;	wingcnt = -34
;	temphead = -20
;	tsepangle = -4
;	lx = -10
;	ly = -14
;	tempalt = -16
;	dpwhead = -54
;	dx = -52
;	dy = -60
;	dz = -66
;	tx = -50
; Line 2893
	sub	ax,ax
	mov	WORD PTR [bp-30],ax	;isleader
	mov	WORD PTR [bp-22],ax	;prespeed
; Line 2894
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+20]
	and	ax,15
	dec	ax
	mov	WORD PTR [bp-2],ax	;secplace
; Line 2903
	push	WORD PTR $S1359_i
	call	_GetBehaviorLeader
	add	sp,2
	mov	WORD PTR [bp-42],ax	;prewing
; Line 2905
	cmp	WORD PTR $S1359_i,ax
	je	$I2396
; Line 2906
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	dx,ax
	mov	ax,cx
	mov	bx,dx
	imul	WORD PTR $S1359_i
	mov	si,ax
	mov	WORD PTR _bv[si+10],bx
; Line 2926
$I2396:
; Line 2929
	mov	ax,40
	imul	WORD PTR [bp-42]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-18],ax	;tanglel
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp-42]	;prewing
	mov	si,ax
	sub	cx,WORD PTR _bv[si+16]
	neg	cx
	mov	WORD PTR [bp-54],cx	;dpwhead
; Line 2934
	mov	ax,WORD PTR [bp-42]	;prewing
	cmp	WORD PTR $S1359_i,ax
	jne	$JCC17890
	jmp	$I2397
$JCC17890:
	push	cx
	mov	di,bx
	call	_abs
	add	sp,2
	cmp	ax,1536
	jle	$JCC17907
	jmp	$I2397
$JCC17907:
; Line 2936
	mov	ax,WORD PTR _bv[si+18]
	mov	WORD PTR [bp-22],ax	;prespeed
; Line 2937
	mov	ax,125
	imul	WORD PTR [bp-2]	;secplace
	mov	cx,100
	mov	dx,ax
	mov	bx,dx
	imul	cx
	push	dx
	push	ax
	mov	cx,WORD PTR [bp-18]	;tanglel
	add	ch,128
	mov	WORD PTR [bp-20],cx	;temphead
	push	cx
	mov	si,ax
	mov	WORD PTR [bp-72],si
	mov	WORD PTR [bp-70],dx
	mov	si,bx
	call	_sinXL
	add	sp,6
	mov	cl,3
	mov	bx,WORD PTR [bp-42]	;prewing
	shl	bx,cl
	add	ax,WORD PTR _ailoc[bx]
	adc	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-10],ax	;lx
	mov	WORD PTR [bp-8],dx
; Line 2938
	push	WORD PTR [bp-70]
	push	WORD PTR [bp-72]
	push	WORD PTR [bp-20]	;temphead
	mov	WORD PTR [bp-74],bx
	call	_cosXL
	add	sp,6
	mov	bx,WORD PTR [bp-74]
	mov	WORD PTR [bp-78],ax
	mov	WORD PTR [bp-76],dx
	mov	ax,WORD PTR _ailoc[bx+4]
	mov	dx,WORD PTR _ailoc[bx+6]
	sub	ax,WORD PTR [bp-78]
	sbb	dx,WORD PTR [bp-76]
	mov	WORD PTR [bp-14],ax	;ly
	mov	WORD PTR [bp-12],dx
; Line 2940
	sub	si,WORD PTR _ps[di+6]
	neg	si
	mov	WORD PTR [bp-16],si	;tempalt
; Line 2942
	cmp	si,75
	jge	$I2398
; Line 2943
	mov	WORD PTR [bp-16],75	;tempalt
; Line 2945
$I2398:
	cmp	WORD PTR _GLowDroll,0
	je	$I2399
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],128
	jne	$I2399
; Line 2946
	or	BYTE PTR _ps[bx+24],128
; Line 2947
	push	WORD PTR [bp-42]	;prewing
	push	WORD PTR [bp-16]	;tempalt
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;ly
	push	WORD PTR [bp-8]
	push	WORD PTR [bp-10]	;lx
	push	WORD PTR $S1359_i
	call	_JustPutHere
$L20096:
	add	sp,14
; Line 2948
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 2949
; Line 2951
	nop	
$I2399:
	push	WORD PTR [bp-22]	;prespeed
	push	WORD PTR [bp-42]	;prewing
	push	WORD PTR [bp-16]	;tempalt
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;ly
	push	WORD PTR [bp-8]
	push	WORD PTR [bp-10]	;lx
	call	_LFlyTo
	jmp	SHORT $L20096
$I2397:
; Line 2955
	mov	WORD PTR [bp-30],1	;isleader
; Line 2956
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	je	$JCC18157
	jmp	$I2401
$JCC18157:
; Line 2957
	mov	ax,WORD PTR _Px
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-52],ax	;dx
; Line 2958
	mov	cx,WORD PTR _Py
	sub	cx,WORD PTR [bx+4]
	mov	WORD PTR [bp-60],cx	;dy
; Line 2960
	sub	dx,dx
	push	dx
	lea	bx,WORD PTR [bp-68]	;enemyalt
	push	bx
	lea	bx,WORD PTR [bp-6]	;tdistnm
	push	bx
	lea	bx,WORD PTR [bp-40]	;tangle
	push	bx
	lea	si,WORD PTR [bp-46]	;tpitch
	push	si
	lea	si,WORD PTR [bp-24]	;tdist
	push	si
	push	cx
	push	ax
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 2962
	mov	ax,WORD PTR [bp-40]	;tangle
	sub	ax,WORD PTR _OurHead
	add	ah,128
	mov	WORD PTR [bp-48],ax	;rrelangle
	or	ax,ax
	jge	$I2402
; Line 2963
	mov	WORD PTR [bp-4],-16384	;tsepangle
; Line 2964
	jmp	SHORT $I2403
$I2402:
; Line 2965
	mov	WORD PTR [bp-4],16384	;tsepangle
$I2403:
; Line 2968
	mov	ax,270
	push	ax
	mov	cx,WORD PTR [bp-4]	;tsepangle
	add	cx,WORD PTR _OurHead
	mov	WORD PTR [bp-20],cx	;temphead
	push	cx
	call	_sinX
	add	sp,4
	add	ax,WORD PTR _Px
	mov	WORD PTR [bp-50],ax	;tx
; Line 2969
	mov	ax,270
	push	ax
	push	WORD PTR [bp-20]	;temphead
	call	_cosX
	add	sp,4
	sub	ax,WORD PTR _Py
	neg	ax
	mov	WORD PTR [bp-58],ax	;ty
; Line 2971
; Line 2972
	jmp	$I2404
$I2401:
; Line 2973
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	si,WORD PTR $S1358_psi
	sub	ax,WORD PTR [si+2]
	mov	WORD PTR [bp-52],ax	;dx
; Line 2974
	mov	cx,WORD PTR _ps[bx+4]
	sub	cx,WORD PTR [si+4]
	mov	WORD PTR [bp-60],cx	;dy
; Line 2976
	sub	dx,dx
	push	dx
	lea	bx,WORD PTR [bp-68]	;enemyalt
	push	bx
	lea	bx,WORD PTR [bp-6]	;tdistnm
	push	bx
	lea	bx,WORD PTR [bp-40]	;tangle
	push	bx
	lea	si,WORD PTR [bp-46]	;tpitch
	push	si
	lea	si,WORD PTR [bp-24]	;tdist
	push	si
	push	cx
	push	ax
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 2978
	mov	ax,WORD PTR [bp-40]	;tangle
	sub	ax,WORD PTR _OurHead
	add	ah,128
	mov	WORD PTR [bp-48],ax	;rrelangle
	or	ax,ax
	jge	$I2405
; Line 2979
	mov	WORD PTR [bp-4],-16384	;tsepangle
; Line 2980
	jmp	SHORT $I2406
	nop	
$I2405:
; Line 2981
	mov	WORD PTR [bp-4],16384	;tsepangle
$I2406:
; Line 2983
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	add	ax,WORD PTR [bp-4]	;tsepangle
	mov	WORD PTR [bp-20],ax	;temphead
; Line 2984
	mov	cx,270
	push	cx
	push	ax
	mov	si,bx
	call	_sinX
	add	sp,4
	add	ax,WORD PTR _ps[si+2]
	mov	WORD PTR [bp-50],ax	;tx
; Line 2985
	mov	ax,270
	push	ax
	push	WORD PTR [bp-20]	;temphead
	call	_cosX
	add	sp,4
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	sub	cx,WORD PTR _ps[bx+4]
	neg	cx
	mov	WORD PTR [bp-58],cx	;ty
; Line 2987
$I2404:
; Line 2990
	mov	WORD PTR [bp-64],2500	;tz
; Line 2991
; Line 2993
	cmp	WORD PTR [bp-64],50	;tz
	jge	$I2407
; Line 2994
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-64],ax	;tz
; Line 2995
; Line 2996
$I2407:
	mov	ax,WORD PTR [bp-50]	;tx
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-52],ax	;dx
; Line 2997
	mov	cx,WORD PTR [bp-58]	;ty
	sub	cx,WORD PTR [bx+4]
	mov	WORD PTR [bp-60],cx	;dy
; Line 2999
	sub	dx,dx
	push	dx
	lea	bx,WORD PTR [bp-68]	;enemyalt
	push	bx
	lea	bx,WORD PTR [bp-6]	;tdistnm
	push	bx
	lea	si,WORD PTR [bp-40]	;tangle
	push	si
	lea	si,WORD PTR [bp-46]	;tpitch
	push	si
	lea	si,WORD PTR [bp-24]	;tdist
	push	si
	push	cx
	push	ax
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 3001
	mov	ax,WORD PTR [bp-42]	;prewing
	cmp	WORD PTR $S1359_i,ax
	je	$JCC18584
	jmp	$I2416
$JCC18584:
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+25],128
	je	$JCC18597
	jmp	$I2416
$JCC18597:
; Line 3002
	push	WORD PTR $S1359_i
	call	_CheckAnyEnemyLock
	add	sp,2
	or	ax,ax
	je	$I2409
	cmp	WORD PTR [bp-6],44	;tdistnm
	jae	$I2409
; Line 3003
	mov	ax,WORD PTR [bp-42]	;prewing
	mov	WORD PTR [bp-34],ax	;wingcnt
; Line 3004
	mov	WORD PTR [bp-62],ax	;prewing2
; Line 3010
	jmp	SHORT $L20098
	nop	
$FC2414:
; Line 3012
	mov	ax,46
	imul	WORD PTR [bp-34]	;wingcnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Ladder2
; Line 3013
	and	BYTE PTR _bv[bx+21],253
; Line 3014
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-34],ax	;wingcnt
; Line 3015
$L20097:
	cmp	WORD PTR [bp-34],0	;wingcnt
	jge	$FC2414
; Line 3017
	mov	ax,46
	imul	WORD PTR [bp-62]	;prewing2
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-62],ax	;prewing2
	mov	WORD PTR [bp-34],ax	;wingcnt
; Line 3018
$L20098:
	cmp	WORD PTR [bp-62],0	;prewing2
	jge	$L20097
; Line 3019
; Line 3020
$I2409:
	push	WORD PTR $S1359_i
	call	_CheckAnyEnemyLock
	add	sp,2
	or	ax,ax
	jne	$I2416
	cmp	WORD PTR [bp-6],4	;tdistnm
	jae	$I2416
; Line 3022
	mov	ax,WORD PTR [bp-42]	;prewing
	mov	WORD PTR [bp-34],ax	;wingcnt
	mov	WORD PTR [bp-62],ax	;prewing2
; Line 3023
	jmp	SHORT $L20100
	nop	
$FC2421:
; Line 3025
	mov	ax,46
	imul	WORD PTR [bp-34]	;wingcnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _LadderCircle
; Line 3026
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	mov	WORD PTR _bv[bx+18],ax
; Line 3027
	test	BYTE PTR _bv[bx+20],32
	jne	$I2423
; Line 3028
	or	BYTE PTR _bv[bx+21],1
; Line 3029
$I2423:
	mov	ax,46
	imul	WORD PTR [bp-34]	;wingcnt
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],253
; Line 3030
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-34],ax	;wingcnt
; Line 3031
$L20099:
	cmp	WORD PTR [bp-34],0	;wingcnt
	jge	$FC2421
; Line 3033
	mov	ax,46
	imul	WORD PTR [bp-62]	;prewing2
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-62],ax	;prewing2
	mov	WORD PTR [bp-34],ax	;wingcnt
; Line 3034
$L20100:
	cmp	WORD PTR [bp-62],0	;prewing2
	jge	$L20099
; Line 3035
; Line 3036
$I2416:
; Line 3039
	mov	ax,50
	push	ax
	push	WORD PTR [bp-64]	;tz
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+6]
	call	_GetAltPitch
	add	sp,6
	mov	WORD PTR [bp-46],ax	;tpitch
; Line 3040
	mov	ax,4096
	push	ax
	mov	ax,-8192
	push	ax
	push	WORD PTR [bp-46]	;tpitch
	call	_rng2
	add	sp,6
	mov	WORD PTR [bp-46],ax	;tpitch
; Line 3041
	mov	ax,WORD PTR [bp-24]	;tdist
	mov	cl,5
	shl	ax,cl
	mov	cx,825
	sub	dx,dx
	div	cx
	mov	WORD PTR [bp-44],ax	;distkm
; Line 3043
	mov	ax,WORD PTR [bp-40]	;tangle
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+16]
	mov	WORD PTR [bp-36],ax	;relangle
; Line 3044
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,1024
	jge	$I2424
; Line 3045
	mov	ax,WORD PTR [bp-18]	;tanglel
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+16]
	mov	WORD PTR [bp-36],ax	;relangle
; Line 3047
$I2424:
	mov	ax,WORD PTR [bp-36]	;relangle
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+20]
	mov	WORD PTR [bp-56],ax	;troll
; Line 3048
	mov	ax,WORD PTR [bp-46]	;tpitch
	mov	WORD PTR _pdest,ax
; Line 3050
	push	WORD PTR [bp-36]	;relangle
	push	WORD PTR $S1359_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 3052
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	add	ax,WORD PTR [bp-36]	;relangle
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+16],cx
; Line 3054
	cmp	WORD PTR [bp-22],0	;prespeed
	je	$I2425
; Line 3056
	mov	ax,WORD PTR [bp-22]	;prespeed
	sub	ax,10
	mov	WORD PTR _bv[bx+18],ax
; Line 3057
; Line 3059
$I2425:
	mov	ax,WORD PTR [bp-42]	;prewing
	cmp	WORD PTR $S1359_i,ax
	je	$I2427
	push	WORD PTR [bp-54]	;dpwhead
	call	_abs
	add	sp,2
	cmp	ax,1536
	jle	$I2429
$I2427:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	je	$I2429
; Line 3060
	mov	ax,WORD PTR [bp-42]	;prewing
	cmp	WORD PTR $S1359_i,ax
	je	$I2428
; Line 3061
	mov	cx,46
	imul	cx
	mov	si,ax
	mov	ax,WORD PTR _bv[si+14]
	mov	WORD PTR _bv[bx+14],ax
; Line 3062
	mov	ax,WORD PTR _bv[si+30]
	mov	dx,WORD PTR _bv[si+32]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 3063
	mov	ax,WORD PTR _bv[si+34]
	mov	dx,WORD PTR _bv[si+36]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 3064
; Line 3065
$I2428:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+14],-1
	je	$I2429
; Line 3066
	call	_FlyWayPoint
; Line 3067
$I2429:
; Line 3069
	mov	ax,WORD PTR [bp-42]	;prewing
	cmp	WORD PTR $S1359_i,ax
	je	$I2431
; Line 3070
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],50
	jle	$I2431
; Line 3071
	mov	ax,40
	imul	WORD PTR [bp-42]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+18]
	mov	WORD PTR _pdest,ax
; Line 3072
; Line 3073
$I2431:
; Line 3089
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Ladder	ENDP
; Line 3107
	PUBLIC	_Box
_Box	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,66
	call	__aNchkstk
	push	di
	push	si
;	dx = -52
;	dy = -60
;	dz = -64
;	tx = -50
;	ty = -58
;	tz = -62
;	txl = -32
;	tyl = -36
;	tzl = -40
;	relangle = -38
;	tangle = -42
;	tpitch = -48
;	troll = -56
;	leadhead = -30
;	isleader = -34
;	tanglel = -24
;	enemyalt = -66
;	tdist = -28
;	distkm = -46
;	tdistnm = -8
;	prewing = -44
;	prespeed = -26
;	secplace = -2
;	txi = -20
;	tyi = -22
;	lx = -14
;	ly = -18
;	shw = -6
;	dpwhead = -54
;	tsecplace = -10
;	tsecp2 = -4
; Line 3121
	sub	ax,ax
	mov	WORD PTR [bp-6],ax	;shw
	mov	WORD PTR [bp-34],ax	;isleader
	mov	WORD PTR [bp-26],ax	;prespeed
; Line 3122
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+20]
	and	ax,15
	mov	WORD PTR [bp-2],ax	;secplace
; Line 3128
	push	WORD PTR $S1359_i
	call	_GetBehaviorLeader
	add	sp,2
	mov	WORD PTR [bp-44],ax	;prewing
; Line 3130
	cmp	WORD PTR $S1359_i,ax
	je	$I2464
; Line 3131
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	dx,ax
	mov	ax,cx
	mov	bx,dx
	imul	WORD PTR $S1359_i
	mov	si,ax
	mov	WORD PTR _bv[si+10],bx
; Line 3133
$I2464:
	mov	ax,40
	imul	WORD PTR [bp-44]	;prewing
	mov	bx,ax
	mov	ax,46
	imul	WORD PTR [bp-44]	;prewing
	mov	si,ax
	mov	ax,WORD PTR _bv[si+16]
	sub	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-54],ax	;dpwhead
; Line 3135
	cmp	WORD PTR [bp-2],1	;secplace
	jle	$I2466
	mov	cx,WORD PTR [bp-44]	;prewing
	cmp	WORD PTR $S1359_i,cx
	je	$I2466
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,1536
	jle	$I2468
$I2466:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	je	$I2468
; Line 3136
	mov	ax,WORD PTR [bp-44]	;prewing
	cmp	WORD PTR $S1359_i,ax
	je	$I2467
; Line 3137
	mov	cx,46
	imul	cx
	mov	si,ax
	mov	ax,WORD PTR _bv[si+14]
	mov	WORD PTR _bv[bx+14],ax
; Line 3138
	mov	ax,WORD PTR _bv[si+30]
	mov	dx,WORD PTR _bv[si+32]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 3139
	mov	ax,WORD PTR _bv[si+34]
	mov	dx,WORD PTR _bv[si+36]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 3140
; Line 3141
$I2467:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+14],-1
	je	$I2468
; Line 3142
	call	_FlyWayPoint
; Line 3143
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 3144
; Line 3145
$I2468:
; Line 3147
	cmp	WORD PTR [bp-2],1	;secplace
	jle	$I2470
	mov	ax,WORD PTR [bp-44]	;prewing
	cmp	WORD PTR $S1359_i,ax
	je	$I2470
	push	WORD PTR [bp-54]	;dpwhead
	call	_abs
	add	sp,2
	cmp	ax,1536
	jg	$JCC19413
	jmp	$I2469
$JCC19413:
$I2470:
; Line 3148
	mov	ax,47
	push	ax
	mov	bx,WORD PTR $S1358_psi
	mov	cx,WORD PTR [bx+16]
	add	ch,64
	push	cx
	call	_sinX
	add	sp,4
	mov	bx,WORD PTR $S1358_psi
	add	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-20],ax	;txi
; Line 3149
	mov	ax,47
	push	ax
	mov	ax,WORD PTR [bx+16]
	add	ah,64
	push	ax
	call	_cosX
	add	sp,4
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+4]
	neg	ax
	mov	WORD PTR [bp-22],ax	;tyi
; Line 3150
	mov	WORD PTR [bp-62],2500	;tz
; Line 3151
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I2471
; Line 3152
	mov	ax,WORD PTR _Px
	mov	WORD PTR [bp-50],ax	;tx
; Line 3153
	mov	ax,WORD PTR _Py
$L20104:
	mov	WORD PTR [bp-58],ax	;ty
; Line 3155
; Line 3156
	jmp	$I2473
$I2471:
; Line 3157
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-50],ax	;tx
; Line 3158
	mov	ax,WORD PTR _ps[bx+4]
	jmp	SHORT $L20104
	nop	
$I2469:
; Line 3163
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-20],ax	;txi
; Line 3164
	mov	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-22],ax	;tyi
; Line 3165
	mov	ax,40
	imul	WORD PTR [bp-44]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR [bp-62],ax	;tz
; Line 3173
	mov	ax,46
	imul	WORD PTR [bp-44]	;prewing
	mov	si,ax
	mov	ax,WORD PTR _bv[si+18]
	mov	WORD PTR [bp-26],ax	;prespeed
; Line 3174
	cmp	WORD PTR [bp-2],2	;secplace
	jne	$I2474
; Line 3175
	mov	ax,-27680
	mov	dx,4
	push	dx
	push	ax
	mov	cx,WORD PTR _ps[bx+16]
	add	ch,64
	push	cx
	mov	si,bx
	call	_sinXL
	add	sp,6
	mov	cl,3
	mov	bx,WORD PTR [bp-44]	;prewing
	shl	bx,cl
	add	ax,WORD PTR _ailoc[bx]
	adc	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-14],ax	;lx
	mov	WORD PTR [bp-12],dx
; Line 3176
	mov	ax,-27680
	mov	dx,4
	push	dx
	push	ax
	mov	ax,WORD PTR _ps[si+16]
	add	ah,64
	push	ax
	mov	si,bx
	call	_cosXL
	add	sp,6
	mov	cx,WORD PTR _ailoc[si+4]
	mov	bx,WORD PTR _ailoc[si+6]
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR [bp-18],cx	;ly
	mov	WORD PTR [bp-16],bx
; Line 3177
	mov	WORD PTR [bp-6],1	;shw
; Line 3178
; Line 3179
	jmp	$I2480
	nop	
$I2474:
	cmp	WORD PTR [bp-2],3	;secplace
	jne	$I2476
; Line 3180
	mov	ax,10176
	mov	dx,9
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR [bp-44]	;prewing
	mov	bx,ax
	push	WORD PTR _ps[bx+16]
	mov	si,bx
	call	_sinXL
	add	sp,6
	mov	cl,3
	mov	bx,WORD PTR [bp-44]	;prewing
	shl	bx,cl
	add	ax,WORD PTR _ailoc[bx]
	adc	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-14],ax	;lx
	mov	WORD PTR [bp-12],dx
; Line 3181
	mov	ax,10176
	mov	dx,9
	push	dx
	push	ax
	push	WORD PTR _ps[si+16]
	mov	si,bx
	call	_cosXL
	add	sp,6
	mov	cx,WORD PTR _ailoc[si+4]
	mov	bx,WORD PTR _ailoc[si+6]
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR [bp-18],cx	;ly
	mov	WORD PTR [bp-16],bx
; Line 3182
	add	WORD PTR [bp-62],2500	;tz
; Line 3183
	mov	WORD PTR [bp-6],2	;shw
; Line 3184
; Line 3185
	jmp	$I2480
$I2476:
	cmp	WORD PTR [bp-2],4	;secplace
	je	$JCC19804
	jmp	$I2478
$JCC19804:
; Line 3186
	mov	ax,-27680
	mov	dx,4
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR [bp-44]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	add	ah,64
	push	ax
	mov	si,bx
	call	_sinXL
	add	sp,6
	mov	cl,3
	mov	bx,WORD PTR [bp-44]	;prewing
	shl	bx,cl
	add	ax,WORD PTR _ailoc[bx]
	adc	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-14],ax	;lx
	mov	WORD PTR [bp-12],dx
; Line 3187
	mov	ax,10176
	mov	dx,9
	push	dx
	push	ax
	push	WORD PTR _ps[si+16]
	mov	di,bx
	call	_sinXL
	add	sp,6
	add	WORD PTR [bp-14],ax	;lx
	adc	WORD PTR [bp-12],dx
; Line 3188
	mov	ax,-27680
	mov	dx,4
	push	dx
	push	ax
	mov	ax,WORD PTR _ps[si+16]
	add	ah,64
	push	ax
	call	_cosXL
	add	sp,6
	mov	cx,WORD PTR _ailoc[di+4]
	mov	bx,WORD PTR _ailoc[di+6]
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR [bp-18],cx	;ly
	mov	WORD PTR [bp-16],bx
; Line 3189
	mov	ax,10176
	mov	dx,9
	push	dx
	push	ax
	push	WORD PTR _ps[si+16]
	call	_cosXL
	add	sp,6
	sub	WORD PTR [bp-18],ax	;ly
	sbb	WORD PTR [bp-16],dx
	jmp	$L20105
	nop	
$I2478:
	cmp	WORD PTR [bp-2],4	;secplace
	jg	$JCC19960
	jmp	$I2480
$JCC19960:
; Line 3195
	mov	ax,WORD PTR [bp-2]	;secplace
	sub	ax,4
	mov	WORD PTR [bp-10],ax	;tsecplace
	sar	ax,1
	mov	WORD PTR [bp-4],ax	;tsecp2
; Line 3196
	test	BYTE PTR [bp-10],1	;tsecplace
	je	$I2481
; Line 3197
	mov	cl,3
	mov	bx,WORD PTR [bp-44]	;prewing
	shl	bx,cl
	mov	ax,WORD PTR _ailoc[bx]
	mov	dx,WORD PTR _ailoc[bx+2]
	jmp	SHORT $L20101
$I2481:
; Line 3199
	mov	ax,-27680
	mov	dx,4
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR [bp-44]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	add	ah,64
	push	ax
	call	_sinXL
	add	sp,6
	mov	cl,3
	mov	bx,WORD PTR [bp-44]	;prewing
	shl	bx,cl
	add	ax,WORD PTR _ailoc[bx]
	adc	dx,WORD PTR _ailoc[bx+2]
$L20101:
	mov	WORD PTR [bp-14],ax	;lx
	mov	WORD PTR [bp-12],dx
; Line 3200
	mov	ax,10176
	mov	dx,9
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-4]	;tsecp2
	cwd	
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR [bp-44]	;prewing
	mov	bx,ax
	push	WORD PTR _ps[bx+16]
	call	_sinXL
	add	sp,6
	add	WORD PTR [bp-14],ax	;lx
	adc	WORD PTR [bp-12],dx
; Line 3201
	test	BYTE PTR [bp-10],1	;tsecplace
	je	$I2483
; Line 3202
	mov	cl,3
	mov	bx,WORD PTR [bp-44]	;prewing
	shl	bx,cl
	mov	ax,WORD PTR _ailoc[bx+4]
	mov	dx,WORD PTR _ailoc[bx+6]
	mov	WORD PTR [bp-18],ax	;ly
	mov	WORD PTR [bp-16],dx
; Line 3203
	jmp	SHORT $I2484
	nop	
$I2483:
; Line 3204
	mov	ax,-27680
	mov	dx,4
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR [bp-44]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	add	ah,64
	push	ax
	call	_cosXL
	add	sp,6
	mov	cl,3
	mov	bx,WORD PTR [bp-44]	;prewing
	shl	bx,cl
	mov	cx,WORD PTR _ailoc[bx+4]
	mov	si,WORD PTR _ailoc[bx+6]
	sub	cx,ax
	sbb	si,dx
	mov	WORD PTR [bp-18],cx	;ly
	mov	WORD PTR [bp-16],si
$I2484:
; Line 3205
	mov	ax,10176
	mov	dx,9
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-4]	;tsecp2
	cwd	
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR [bp-44]	;prewing
	mov	bx,ax
	push	WORD PTR _ps[bx+16]
	call	_cosXL
	add	sp,6
	sub	WORD PTR [bp-18],ax	;ly
	sbb	WORD PTR [bp-16],dx
; Line 3206
	jmp	SHORT $L20102
$FC2486:
; Line 3207
	mov	cl,2
	sar	WORD PTR [bp-10],cl	;tsecplace
$L20102:
	cmp	WORD PTR [bp-10],4	;tsecplace
	jg	$FC2486
; Line 3208
	cmp	WORD PTR [bp-10],2	;tsecplace
	jle	$I2488
; Line 3209
$L20105:
	add	WORD PTR [bp-62],2500	;tz
; Line 3210
$I2488:
	mov	WORD PTR [bp-6],3	;shw
; Line 3211
; Line 3212
$I2480:
	cmp	WORD PTR [bp-62],50	;tz
	jge	$I2489
; Line 3213
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-62],ax	;tz
; Line 3214
; Line 3215
$I2489:
	cmp	WORD PTR _GLowDroll,0
	je	$I2490
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],128
	jne	$I2490
; Line 3216
	or	BYTE PTR _ps[bx+24],128
; Line 3217
	cmp	WORD PTR [bp-62],50	;tz
	jge	$I2491
; Line 3218
	mov	WORD PTR [bp-62],50	;tz
; Line 3219
$I2491:
	push	WORD PTR [bp-44]	;prewing
	push	WORD PTR [bp-62]	;tz
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;ly
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;lx
	push	WORD PTR $S1359_i
	call	_JustPutHere
$L20103:
	add	sp,14
; Line 3220
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 3221
; Line 3223
$I2490:
	push	WORD PTR [bp-26]	;prespeed
	push	WORD PTR [bp-44]	;prewing
	push	WORD PTR [bp-62]	;tz
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;ly
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;lx
	call	_LFlyTo
	jmp	SHORT $L20103
; Line 3225
$I2473:
; Line 3227
	cmp	WORD PTR [bp-62],50	;tz
	jge	$I2492
; Line 3228
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-62],ax	;tz
; Line 3229
; Line 3230
$I2492:
; Line 3231
	mov	ax,WORD PTR [bp-58]	;ty
	sub	ax,WORD PTR [bp-22]	;tyi
	mov	WORD PTR [bp-60],ax	;dy
; Line 3233
	sub	cx,cx
	push	cx
	lea	dx,WORD PTR [bp-66]	;enemyalt
	push	dx
	lea	dx,WORD PTR [bp-8]	;tdistnm
	push	dx
	lea	dx,WORD PTR [bp-42]	;tangle
	push	dx
	lea	bx,WORD PTR [bp-48]	;tpitch
	push	bx
	lea	si,WORD PTR [bp-28]	;tdist
	push	si
	push	ax
	mov	ax,WORD PTR [bp-50]	;tx
	sub	ax,WORD PTR [bp-20]	;txi
	mov	WORD PTR [bp-52],ax	;dx
	push	ax
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 3235
	mov	ax,50
	push	ax
	push	WORD PTR [bp-62]	;tz
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+6]
	call	_GetAltPitch
	add	sp,6
	mov	WORD PTR [bp-48],ax	;tpitch
; Line 3236
	mov	ax,4096
	push	ax
	mov	ax,-8192
	push	ax
	push	WORD PTR [bp-48]	;tpitch
	call	_rng2
	add	sp,6
	mov	WORD PTR [bp-48],ax	;tpitch
; Line 3237
	mov	ax,WORD PTR [bp-28]	;tdist
	mov	cl,5
	shl	ax,cl
	mov	cx,825
	sub	dx,dx
	div	cx
	mov	WORD PTR [bp-46],ax	;distkm
; Line 3239
	mov	ax,WORD PTR [bp-42]	;tangle
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+16]
	mov	WORD PTR [bp-38],ax	;relangle
; Line 3241
	sub	ax,WORD PTR [bx+20]
	mov	WORD PTR [bp-56],ax	;troll
; Line 3242
	mov	ax,WORD PTR [bp-48]	;tpitch
	mov	WORD PTR _pdest,ax
; Line 3244
	push	WORD PTR [bp-38]	;relangle
	push	WORD PTR $S1359_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 3246
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	add	ax,WORD PTR [bp-38]	;relangle
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+16],cx
; Line 3248
	cmp	WORD PTR [bp-26],0	;prespeed
	je	$I2493
; Line 3250
	mov	ax,WORD PTR [bp-26]	;prespeed
	sub	ax,10
	mov	WORD PTR _bv[bx+18],ax
; Line 3251
; Line 3264
$I2493:
	mov	ax,WORD PTR [bp-44]	;prewing
	cmp	WORD PTR $S1359_i,ax
	je	$I2495
; Line 3265
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],50
	jle	$I2495
; Line 3266
	mov	ax,40
	imul	WORD PTR [bp-44]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+18]
	mov	WORD PTR _pdest,ax
; Line 3267
; Line 3268
$I2495:
; Line 3287
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_Box	ENDP
; Line 3289
	PUBLIC	_Champagne
_Champagne	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,58
	call	__aNchkstk
	push	si
;	dx = -48
;	dy = -54
;	dz = -58
;	tx = -46
;	ty = -52
;	tz = -56
;	txl = -26
;	tyl = -30
;	tzl = -34
;	relangle = -32
;	tangle = -38
;	tpitch = -44
;	troll = -50
;	leadhead = -24
;	isleader = -28
;	tanglel = -18
;	tdist = -22
;	distkm = -42
;	tdistnm = -4
;	prewing = -40
;	prespeed = -20
;	secplace = -2
;	txi = -14
;	tyi = -16
;	winglead = -36
;	lx = -8
;	ly = -12
; Line 3302
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+20]
	and	ax,15
	mov	WORD PTR [bp-2],ax	;secplace
; Line 3307
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-40],ax	;prewing
; Line 3309
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	mov	WORD PTR _bv[bx+18],ax
; Line 3311
	cmp	WORD PTR [bp-2],3	;secplace
	jl	$I2524
	test	BYTE PTR [bp-2],1	;secplace
	je	$I2524
; Line 3312
	call	_BracketLeft
; Line 3313
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 3314
; Line 3315
	nop	
$I2524:
	cmp	WORD PTR [bp-2],3	;secplace
	jl	$I2525
	test	BYTE PTR [bp-2],1	;secplace
	jne	$I2525
; Line 3316
	call	_BracketRight
; Line 3317
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 3318
; Line 3319
$I2525:
	cmp	WORD PTR [bp-2],3	;secplace
	jl	$JCC20736
	jmp	$I2526
$JCC20736:
; Line 3320
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	sub	WORD PTR _bv[bx+18],200
; Line 3321
	mov	WORD PTR [bp-56],2500	;tz
; Line 3322
	cmp	WORD PTR [bp-2],1	;secplace
	jne	$I2527
; Line 3323
	mov	ax,47
	push	ax
	mov	bx,WORD PTR $S1358_psi
	mov	cx,WORD PTR [bx+16]
	add	ch,64
	push	cx
	call	_sinX
	add	sp,4
	mov	bx,WORD PTR $S1358_psi
	add	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-14],ax	;txi
; Line 3324
	mov	ax,47
	push	ax
	mov	ax,WORD PTR [bx+16]
	add	ah,64
	jmp	SHORT $L20106
$I2527:
; Line 3329
	mov	ax,47
	push	ax
	mov	bx,WORD PTR $S1358_psi
	mov	cx,WORD PTR [bx+16]
	sub	cx,16384
	push	cx
	call	_sinX
	add	sp,4
	mov	bx,WORD PTR $S1358_psi
	add	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-14],ax	;txi
; Line 3330
	mov	ax,47
	push	ax
	mov	ax,WORD PTR [bx+16]
	sub	ax,16384
$L20106:
	push	ax
	call	_cosX
	add	sp,4
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+4]
	neg	ax
	mov	WORD PTR [bp-16],ax	;tyi
; Line 3331
	mov	ax,-27680
	mov	dx,4
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR [bp-40]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	add	ah,64
	push	ax
	mov	si,bx
	call	_sinXL
	add	sp,6
	mov	cl,3
	mov	bx,WORD PTR [bp-40]	;prewing
	shl	bx,cl
; Line 3332
	mov	ax,-27680
	mov	dx,4
	push	dx
	push	ax
	mov	ax,WORD PTR _ps[si+16]
	add	ah,64
	push	ax
	mov	si,bx
	call	_cosXL
	add	sp,6
	mov	cx,WORD PTR _ailoc[si+4]
	sub	cx,ax
; Line 3333
; Line 3334
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I2529
; Line 3335
	mov	ax,WORD PTR _Px
	mov	WORD PTR [bp-46],ax	;tx
; Line 3336
	mov	ax,WORD PTR _Py
	jmp	SHORT $L20107
	nop	
$I2529:
; Line 3340
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-46],ax	;tx
; Line 3341
	mov	ax,WORD PTR _ps[bx+4]
$L20107:
	mov	WORD PTR [bp-52],ax	;ty
; Line 3343
; Line 3344
; Line 3346
$I2526:
	cmp	WORD PTR [bp-56],50	;tz
	jge	$I2531
; Line 3347
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-56],ax	;tz
; Line 3348
; Line 3349
$I2531:
; Line 3350
	mov	ax,WORD PTR [bp-52]	;ty
	sub	ax,WORD PTR [bp-16]	;tyi
	mov	WORD PTR [bp-54],ax	;dy
; Line 3352
	push	ax
	mov	ax,WORD PTR [bp-46]	;tx
	sub	ax,WORD PTR [bp-14]	;txi
	mov	WORD PTR [bp-48],ax	;dx
	push	ax
	call	_Dist2D
	add	sp,4
	shl	ax,1
	mov	cx,95
	sub	dx,dx
	div	cx
; Line 3354
	push	WORD PTR $S1359_i
	mov	si,ax
	call	_CheckDetection
	add	sp,2
	cmp	ax,-999
	je	$I2535
	cmp	si,32
	jae	$I2535
; Line 3356
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+2]
	mov	WORD PTR [bp-36],ax	;winglead
	or	ax,ax
	jl	$I2533
; Line 3357
	push	ax
	call	_CheckDetection
	add	sp,2
	mov	WORD PTR [bp-36],ax	;winglead
; Line 3358
; Line 3359
	jmp	SHORT $I2534
	nop	
$I2533:
; Line 3360
	mov	WORD PTR [bp-36],-999	;winglead
$I2534:
; Line 3361
	cmp	WORD PTR [bp-36],-999	;winglead
	jne	$I2535
; Line 3362
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],32
	jne	$I2536
; Line 3363
	or	BYTE PTR _bv[bx+21],1
; Line 3364
$I2536:
	call	_PostHole
; Line 3365
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 3366
; Line 3367
	nop	
$I2535:
; Line 3370
	mov	ax,50
	push	ax
	push	WORD PTR [bp-56]	;tz
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+6]
	call	_GetAltPitch
	add	sp,6
	mov	WORD PTR [bp-44],ax	;tpitch
; Line 3371
	mov	ax,WORD PTR [bp-54]	;dy
	neg	ax
	push	ax
	push	WORD PTR [bp-48]	;dx
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-38],ax	;tangle
; Line 3372
	mov	ax,4096
	push	ax
	mov	ax,-8192
	push	ax
	push	WORD PTR [bp-44]	;tpitch
	call	_rng2
	add	sp,6
	mov	WORD PTR [bp-44],ax	;tpitch
; Line 3375
	mov	ax,WORD PTR [bp-38]	;tangle
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+16]
	mov	WORD PTR [bp-32],ax	;relangle
; Line 3377
	mov	ax,WORD PTR [bp-44]	;tpitch
	mov	WORD PTR _pdest,ax
; Line 3379
	push	WORD PTR [bp-32]	;relangle
	push	WORD PTR $S1359_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 3400
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_Champagne	ENDP
; Line 3415
	PUBLIC	_Wall
_Wall	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,74
	call	__aNchkstk
	push	di
	push	si
;	txi = -18
;	tyi = -20
;	wingcnt = -36
;	prewing2 = -66
;	lx = -12
;	ly = -16
;	dpwhead = -58
;	dangle = -42
;	tsecplace = -8
;	tsecp2 = -4
;	dadd = -56
;	dx = -54
;	dy = -64
;	dz = -70
;	tx = -52
;	ty = -62
;	tz = -68
;	txl = -30
;	tyl = -34
;	tzl = -40
;	relangle = -38
;	tangle = -44
;	tpitch = -50
;	troll = -60
;	leadhead = -28
;	isleader = -32
;	tanglel = -22
;	tdist = -26
;	distkm = -48
;	tdistnm = -6
;	prewing = -46
;	prespeed = -24
;	secplace = -2
; Line 3429
	sub	ax,ax
	mov	WORD PTR [bp-24],ax	;prespeed
; Line 3430
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+20]
	and	ax,15
	mov	WORD PTR [bp-2],ax	;secplace
; Line 3436
	push	WORD PTR $S1359_i
	call	_GetBehaviorLeader
	add	sp,2
	mov	WORD PTR [bp-46],ax	;prewing
; Line 3438
	mov	ax,40
	imul	WORD PTR [bp-46]	;prewing
	mov	bx,ax
	mov	ax,46
	imul	WORD PTR [bp-46]	;prewing
	mov	si,ax
	mov	ax,WORD PTR _bv[si+16]
	sub	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-58],ax	;dpwhead
; Line 3440
	mov	ax,WORD PTR [bp-46]	;prewing
	cmp	WORD PTR $S1359_i,ax
	je	$I2571
; Line 3441
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[si+10]
	mov	WORD PTR _bv[bx+10],ax
; Line 3443
$I2571:
	cmp	WORD PTR [bp-2],1	;secplace
	jle	$I2573
	mov	ax,WORD PTR [bp-46]	;prewing
	cmp	WORD PTR $S1359_i,ax
	je	$I2573
	push	WORD PTR [bp-58]	;dpwhead
	call	_abs
	add	sp,2
	cmp	ax,1536
	jle	$I2575
$I2573:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	je	$I2575
; Line 3444
	mov	ax,WORD PTR [bp-46]	;prewing
	cmp	WORD PTR $S1359_i,ax
	je	$I2574
; Line 3445
	mov	cx,46
	imul	cx
	mov	si,ax
	mov	ax,WORD PTR _bv[si+14]
	mov	WORD PTR _bv[bx+14],ax
; Line 3446
	mov	ax,WORD PTR _bv[si+30]
	mov	dx,WORD PTR _bv[si+32]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 3447
	mov	ax,WORD PTR _bv[si+34]
	mov	dx,WORD PTR _bv[si+36]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 3448
; Line 3449
$I2574:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+14],-1
	je	$I2575
; Line 3450
	call	_FlyWayPoint
; Line 3451
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 3452
; Line 3453
	nop	
$I2575:
; Line 3455
	cmp	WORD PTR [bp-2],1	;secplace
	jle	$I2577
	mov	ax,WORD PTR [bp-46]	;prewing
	cmp	WORD PTR $S1359_i,ax
	je	$I2577
	push	WORD PTR [bp-58]	;dpwhead
	call	_abs
	add	sp,2
	cmp	ax,1536
	jg	$JCC21501
	jmp	$I2576
$JCC21501:
$I2577:
; Line 3456
	mov	ax,50
	push	ax
	mov	bx,WORD PTR $S1358_psi
	mov	cx,WORD PTR [bx+16]
	sub	cx,16384
	push	cx
	call	_sinX
	add	sp,4
	mov	bx,WORD PTR $S1358_psi
	add	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-18],ax	;txi
; Line 3457
	mov	ax,50
	push	ax
	mov	ax,WORD PTR [bx+16]
	sub	ax,16384
	push	ax
	call	_cosX
	add	sp,4
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+4]
	neg	ax
	mov	WORD PTR [bp-20],ax	;tyi
; Line 3458
	mov	WORD PTR [bp-68],3250	;tz
; Line 3459
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I2578
; Line 3460
	mov	ax,WORD PTR _Px
	mov	WORD PTR [bp-52],ax	;tx
; Line 3461
	mov	ax,WORD PTR _Py
	jmp	SHORT $L20110
	nop	
$I2578:
; Line 3465
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-52],ax	;tx
; Line 3466
	mov	ax,WORD PTR _ps[bx+4]
$L20110:
	mov	WORD PTR [bp-62],ax	;ty
; Line 3468
; Line 3469
; Line 3535
	cmp	WORD PTR [bp-68],50	;tz
	jge	$I2599
; Line 3536
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-68],ax	;tz
; Line 3537
; Line 3538
$I2599:
; Line 3539
	mov	ax,WORD PTR [bp-62]	;ty
	sub	ax,WORD PTR [bp-20]	;tyi
	mov	WORD PTR [bp-64],ax	;dy
; Line 3540
	push	ax
	mov	cx,WORD PTR [bp-52]	;tx
	sub	cx,WORD PTR [bp-18]	;txi
	mov	WORD PTR [bp-54],cx	;dx
	push	cx
	call	_Dist2D
	add	sp,4
	mov	WORD PTR [bp-26],ax	;tdist
; Line 3542
	mov	ax,50
	push	ax
	push	WORD PTR [bp-68]	;tz
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+6]
	call	_GetAltPitch
	add	sp,6
	mov	WORD PTR [bp-50],ax	;tpitch
; Line 3543
	mov	ax,WORD PTR [bp-64]	;dy
	neg	ax
	push	ax
	push	WORD PTR [bp-54]	;dx
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-44],ax	;tangle
; Line 3544
	mov	ax,4096
	push	ax
	mov	ax,-8192
	push	ax
	push	WORD PTR [bp-50]	;tpitch
	call	_rng2
	add	sp,6
	mov	WORD PTR [bp-50],ax	;tpitch
; Line 3545
	mov	ax,WORD PTR [bp-26]	;tdist
	mov	cl,5
	shl	ax,cl
	mov	cx,825
	sub	dx,dx
	div	cx
; Line 3546
	mov	ax,WORD PTR [bp-26]	;tdist
	shl	ax,1
	mov	cx,95
	sub	dx,dx
	div	cx
	mov	WORD PTR [bp-6],ax	;tdistnm
; Line 3548
	mov	cx,WORD PTR [bp-46]	;prewing
	cmp	WORD PTR $S1359_i,cx
	je	$JCC21774
	jmp	$FB2605
$JCC21774:
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+25],128
	je	$JCC21787
	jmp	$FB2605
$JCC21787:
; Line 3549
	cmp	ax,34
	jb	$I2602
	push	WORD PTR $S1359_i
	call	_CheckAnyEnemyLock
	add	sp,2
	or	ax,ax
	jne	$JCC21809
	jmp	$FB2605
$JCC21809:
	cmp	WORD PTR [bp-6],41	;tdistnm
	jb	$JCC21818
	jmp	$FB2605
$JCC21818:
$I2602:
; Line 3551
	mov	ax,WORD PTR [bp-46]	;prewing
	mov	WORD PTR [bp-36],ax	;wingcnt
	mov	WORD PTR [bp-66],ax	;prewing2
; Line 3552
$FC2604:
	or	ax,ax
	jge	$JCC21834
	jmp	$FB2605
$JCC21834:
; Line 3553
$FC2607:
	cmp	WORD PTR [bp-36],0	;wingcnt
	jge	$JCC21843
	jmp	$FB2608
$JCC21843:
; Line 3554
	mov	ax,46
	imul	WORD PTR [bp-36]	;wingcnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Wall2
; Line 3555
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-36],ax	;wingcnt
; Line 3556
	jmp	SHORT $FC2607
	nop	
$I2576:
; Line 3473
	mov	ax,40
	imul	WORD PTR [bp-46]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR [bp-68],ax	;tz
; Line 3480
	mov	ax,46
	imul	WORD PTR [bp-46]	;prewing
	mov	si,ax
	mov	ax,WORD PTR _bv[si+18]
	mov	WORD PTR [bp-24],ax	;prespeed
; Line 3481
	cmp	WORD PTR [bp-2],2	;secplace
	je	$JCC21906
	jmp	$I2581
$JCC21906:
; Line 3482
	mov	ax,2500
	push	ax
	mov	cx,WORD PTR _ps[bx+16]
	add	ch,64
	push	cx
	mov	si,bx
	call	_sinX
	add	sp,4
; Line 3483
	mov	ax,2500
	push	ax
	mov	ax,WORD PTR _ps[si+16]
	add	ah,64
	push	ax
	call	_cosX
	add	sp,4
; Line 3484
	mov	ax,-12144
	mov	dx,3
	push	dx
	push	ax
	mov	cx,WORD PTR _ps[si+16]
	add	ch,64
	push	cx
	call	_sinXL
	add	sp,6
	mov	cl,3
	mov	bx,WORD PTR [bp-46]	;prewing
	shl	bx,cl
	add	ax,WORD PTR _ailoc[bx]
	adc	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-12],ax	;lx
	mov	WORD PTR [bp-10],dx
; Line 3485
	mov	ax,-12144
	mov	dx,3
	push	dx
	push	ax
	mov	ax,WORD PTR _ps[si+16]
	add	ah,64
$L20111:
	push	ax
	mov	si,bx
	call	_cosXL
	add	sp,6
	mov	cx,WORD PTR _ailoc[si+4]
	mov	bx,WORD PTR _ailoc[si+6]
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR [bp-16],cx	;ly
	mov	WORD PTR [bp-14],bx
; Line 3486
$L20112:
	sub	WORD PTR [bp-68],750	;tz
; Line 3487
; Line 3488
	jmp	$I2596
$I2581:
	cmp	WORD PTR [bp-2],3	;secplace
	jne	$I2583
; Line 3489
	mov	ax,2500
	push	ax
	mov	ax,40
	imul	WORD PTR [bp-46]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	sub	ax,16384
	push	ax
	mov	si,bx
	call	_sinX
	add	sp,4
; Line 3490
	mov	ax,2500
	push	ax
	mov	ax,WORD PTR _ps[si+16]
	sub	ax,16384
	push	ax
	call	_cosX
	add	sp,4
; Line 3491
	mov	ax,-12144
	mov	dx,3
	push	dx
	push	ax
	mov	cx,WORD PTR _ps[si+16]
	sub	cx,16384
	push	cx
	call	_sinXL
	add	sp,6
	mov	cl,3
	mov	bx,WORD PTR [bp-46]	;prewing
	shl	bx,cl
	add	ax,WORD PTR _ailoc[bx]
	adc	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-12],ax	;lx
	mov	WORD PTR [bp-10],dx
; Line 3492
	mov	ax,-12144
	mov	dx,3
	push	dx
	push	ax
	mov	ax,WORD PTR _ps[si+16]
	sub	ax,16384
	jmp	$L20111
$I2583:
	cmp	WORD PTR [bp-2],4	;secplace
	je	$JCC22160
	jmp	$I2585
$JCC22160:
; Line 3496
	mov	ax,5000
	push	ax
	mov	ax,40
	imul	WORD PTR [bp-46]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	sub	ax,16384
	push	ax
	mov	si,bx
	call	_sinX
	add	sp,4
; Line 3497
	mov	ax,5000
	push	ax
	mov	ax,WORD PTR _ps[si+16]
	sub	ax,16384
	push	ax
	call	_cosX
	add	sp,4
; Line 3498
	mov	ax,-24288
	mov	dx,7
	push	dx
	push	ax
	mov	cx,WORD PTR _ps[si+16]
	sub	cx,16384
	push	cx
	call	_sinXL
	add	sp,6
	mov	cl,3
	mov	bx,WORD PTR [bp-46]	;prewing
	shl	bx,cl
	add	ax,WORD PTR _ailoc[bx]
	adc	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-12],ax	;lx
	mov	WORD PTR [bp-10],dx
; Line 3499
	mov	ax,-24288
	mov	dx,7
	push	dx
	push	ax
	mov	ax,WORD PTR _ps[si+16]
	sub	ax,16384
	push	ax
	mov	si,bx
	call	_cosXL
	add	sp,6
	mov	cx,WORD PTR _ailoc[si+4]
	mov	bx,WORD PTR _ailoc[si+6]
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR [bp-16],cx	;ly
	mov	WORD PTR [bp-14],bx
	jmp	$L20113
$I2585:
	cmp	WORD PTR [bp-2],4	;secplace
	jg	$JCC22304
	jmp	$I2596
$JCC22304:
; Line 3504
	mov	ax,WORD PTR [bp-2]	;secplace
	sub	ax,4
	mov	WORD PTR [bp-8],ax	;tsecplace
	inc	ax
	inc	ax
	sar	ax,1
	mov	WORD PTR [bp-56],ax	;dadd
; Line 3505
	test	BYTE PTR [bp-8],1	;tsecplace
	je	$I2588
; Line 3506
	mov	WORD PTR [bp-42],16384	;dangle
; Line 3507
; Line 3508
	jmp	SHORT $I2589
$I2588:
; Line 3509
	mov	WORD PTR [bp-42],-16384	;dangle
; Line 3510
$I2589:
; Line 3511
	mov	ax,2500
	imul	WORD PTR [bp-56]	;dadd
	push	ax
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR [bp-46]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	add	ax,WORD PTR [bp-42]	;dangle
	push	ax
	mov	si,cx
	mov	di,bx
	call	_sinX
	add	sp,4
; Line 3512
	push	si
	mov	ax,WORD PTR _ps[di+16]
	add	ax,WORD PTR [bp-42]	;dangle
	push	ax
	call	_cosX
	add	sp,4
; Line 3513
	mov	ax,-12144
	mov	dx,3
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-56]	;dadd
	cwd	
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	mov	cx,WORD PTR _ps[di+16]
	add	cx,WORD PTR [bp-42]	;dangle
	push	cx
	mov	si,ax
	mov	WORD PTR [bp-74],si
	mov	WORD PTR [bp-72],dx
	call	_sinXL
	add	sp,6
	mov	cl,3
	mov	bx,WORD PTR [bp-46]	;prewing
	shl	bx,cl
	add	ax,WORD PTR _ailoc[bx]
	adc	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-12],ax	;lx
	mov	WORD PTR [bp-10],dx
; Line 3514
	push	WORD PTR [bp-72]
	push	WORD PTR [bp-74]
	mov	ax,WORD PTR _ps[di+16]
	add	ax,WORD PTR [bp-42]	;dangle
	push	ax
	mov	si,bx
	call	_cosXL
	add	sp,6
	mov	cx,WORD PTR _ailoc[si+4]
	mov	bx,WORD PTR _ailoc[si+6]
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR [bp-16],cx	;ly
	mov	WORD PTR [bp-14],bx
; Line 3515
	jmp	SHORT $L20108
	nop	
$FC2591:
; Line 3516
	mov	cl,2
	sar	WORD PTR [bp-8],cl	;tsecplace
$L20108:
	cmp	WORD PTR [bp-8],4	;tsecplace
	jg	$FC2591
; Line 3517
	cmp	WORD PTR [bp-8],2	;tsecplace
	jne	$JCC22513
	jmp	$L20112
$JCC22513:
	cmp	WORD PTR [bp-8],3	;tsecplace
	jne	$JCC22522
	jmp	$L20112
$JCC22522:
	cmp	WORD PTR [bp-8],4	;tsecplace
	jne	$I2596
; Line 3521
$L20113:
	add	WORD PTR [bp-68],1500	;tz
; Line 3522
$I2596:
; Line 3523
	cmp	WORD PTR _GLowDroll,0
	je	$I2597
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],128
	jne	$I2597
; Line 3524
	or	BYTE PTR _ps[bx+24],128
; Line 3525
	cmp	WORD PTR [bp-68],50	;tz
	jge	$I2598
; Line 3526
	mov	WORD PTR [bp-68],50	;tz
; Line 3527
$I2598:
	push	WORD PTR [bp-46]	;prewing
	push	WORD PTR [bp-68]	;tz
	push	WORD PTR [bp-14]
	push	WORD PTR [bp-16]	;ly
	push	WORD PTR [bp-10]
	push	WORD PTR [bp-12]	;lx
	push	WORD PTR $S1359_i
	call	_JustPutHere
$L20109:
	add	sp,14
; Line 3528
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 3529
; Line 3531
	nop	
$I2597:
	push	WORD PTR [bp-24]	;prespeed
	push	WORD PTR [bp-46]	;prewing
	push	WORD PTR [bp-68]	;tz
	push	WORD PTR [bp-14]
	push	WORD PTR [bp-16]	;ly
	push	WORD PTR [bp-10]
	push	WORD PTR [bp-12]	;lx
	call	_LFlyTo
	jmp	SHORT $L20109
; Line 3533
$FB2608:
; Line 3558
	mov	ax,46
	imul	WORD PTR [bp-66]	;prewing2
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-66],ax	;prewing2
	mov	WORD PTR [bp-36],ax	;wingcnt
; Line 3559
	jmp	$FC2604
	nop	
$FB2605:
; Line 3560
; Line 3561
; Line 3563
	mov	ax,WORD PTR [bp-44]	;tangle
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+16]
	mov	WORD PTR [bp-38],ax	;relangle
; Line 3566
	mov	ax,WORD PTR [bp-50]	;tpitch
	mov	WORD PTR _pdest,ax
; Line 3568
	push	WORD PTR [bp-38]	;relangle
	push	WORD PTR $S1359_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 3570
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	add	ax,WORD PTR [bp-38]	;relangle
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+16],cx
; Line 3572
	cmp	WORD PTR [bp-24],0	;prespeed
	je	$I2609
; Line 3574
	mov	ax,WORD PTR [bp-24]	;prespeed
	sub	ax,10
	mov	WORD PTR _bv[bx+18],ax
; Line 3575
; Line 3589
$I2609:
	mov	ax,WORD PTR [bp-46]	;prewing
	cmp	WORD PTR $S1359_i,ax
	je	$I2611
; Line 3590
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],75
	jle	$I2611
; Line 3591
	mov	ax,40
	imul	WORD PTR [bp-46]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+18]
	mov	WORD PTR _pdest,ax
; Line 3592
; Line 3593
$I2611:
; Line 3605
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Wall	ENDP
; Line 3607
	PUBLIC	_FreeFighter
_FreeFighter	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__aNchkstk
	push	si
;	tdistnm = -4
;	dx = -16
;	dy = -20
;	dz = -22
;	relangle = -8
;	rrelangle = -14
;	tangle = -10
;	tpitch = -12
;	troll = -18
;	enemyhead = -2
;	enemyalt = -24
;	tdist = -6
; Line 3614
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],5
	jne	$I2625
; Line 3615
	call	_StraightAttack
; Line 3616
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 3617
; Line 3619
$I2625:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	mov	WORD PTR _bv[bx+18],ax
; Line 3620
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I2626
; Line 3621
	mov	ax,WORD PTR _Px
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-16],ax	;dx
; Line 3622
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-20],ax	;dy
; Line 3623
	mov	ax,WORD PTR _OurHead
	jmp	SHORT $L20114
	nop	
$I2626:
; Line 3626
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	si,WORD PTR $S1358_psi
	sub	ax,WORD PTR [si+2]
	mov	WORD PTR [bp-16],ax	;dx
; Line 3627
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR [si+4]
	mov	WORD PTR [bp-20],ax	;dy
; Line 3628
	mov	ax,WORD PTR _ps[bx+16]
$L20114:
	mov	WORD PTR [bp-2],ax	;enemyhead
; Line 3629
; Line 3631
	mov	ax,1250
	push	ax
	lea	ax,WORD PTR [bp-24]	;enemyalt
	push	ax
	lea	ax,WORD PTR [bp-4]	;tdistnm
	push	ax
	lea	cx,WORD PTR [bp-10]	;tangle
	push	cx
	lea	dx,WORD PTR [bp-12]	;tpitch
	push	dx
	lea	bx,WORD PTR [bp-6]	;tdist
	push	bx
	push	WORD PTR [bp-20]	;dy
	push	WORD PTR [bp-16]	;dx
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 3633
	mov	ax,WORD PTR [bp-10]	;tangle
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+16]
	mov	WORD PTR [bp-8],ax	;relangle
; Line 3634
	mov	ax,WORD PTR [bp-10]	;tangle
	sub	ax,WORD PTR [bp-2]	;enemyhead
	add	ah,128
	mov	WORD PTR [bp-14],ax	;rrelangle
; Line 3635
	mov	cx,WORD PTR [bp-12]	;tpitch
	mov	WORD PTR _pdest,cx
; Line 3637
	cmp	WORD PTR [bp-4],7	;tdistnm
	jae	$I2635
; Line 3638
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,16384
	jge	$I2629
; Line 3639
	mov	ax,WORD PTR [bp-2]	;enemyhead
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+16]
	add	ah,128
	mov	WORD PTR [bp-8],ax	;relangle
; Line 3640
; Line 3641
	jmp	SHORT $I2635
	nop	
$I2629:
; Line 3642
	cmp	WORD PTR [bp-14],0	;rrelangle
	jge	$I2631
; Line 3643
	add	BYTE PTR [bp-7],64
; Line 3644
; Line 3645
	jmp	SHORT $I2632
$I2631:
; Line 3646
	sub	WORD PTR [bp-8],16384	;relangle
; Line 3647
$I2632:
; Line 3648
	cmp	WORD PTR [bp-4],2	;tdistnm
	jae	$I2635
; Line 3649
	cmp	WORD PTR [bp-14],0	;rrelangle
	jge	$I2634
; Line 3650
	add	BYTE PTR [bp-7],16
; Line 3651
; Line 3652
	jmp	SHORT $I2635
	nop	
$I2634:
; Line 3653
	sub	WORD PTR [bp-8],4096	;relangle
; Line 3654
$I2635:
; Line 3655
; Line 3656
; Line 3657
; Line 3659
	push	WORD PTR [bp-8]	;relangle
	push	WORD PTR $S1359_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 3672
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_FreeFighter	ENDP
; Line 3675
	PUBLIC	_Wall2
_Wall2	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
	push	si
;	secplace = -2
;	dx = -18
;	dy = -20
;	tdist = -6
;	tdistnm = -4
;	tpitch = -16
;	tangle = -12
;	enemyalt = -22
;	prewing = -14
;	wingcnt = -8
;	winglead = -10
; Line 3683
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+20]
	and	ax,15
	mov	WORD PTR [bp-2],ax	;secplace
; Line 3685
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I2648
; Line 3686
	mov	ax,WORD PTR _Px
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-18],ax	;dx
; Line 3687
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR [bx+4]
	jmp	SHORT $L20115
	nop	
$I2648:
; Line 3690
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	si,WORD PTR $S1358_psi
	sub	ax,WORD PTR [si+2]
	mov	WORD PTR [bp-18],ax	;dx
; Line 3691
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR [si+4]
$L20115:
	mov	WORD PTR [bp-20],ax	;dy
; Line 3692
; Line 3693
	sub	ax,ax
	push	ax
	lea	cx,WORD PTR [bp-22]	;enemyalt
	push	cx
	lea	cx,WORD PTR [bp-4]	;tdistnm
	push	cx
	lea	cx,WORD PTR [bp-12]	;tangle
	push	cx
	lea	cx,WORD PTR [bp-16]	;tpitch
	push	cx
	lea	cx,WORD PTR [bp-6]	;tdist
	push	cx
	push	WORD PTR [bp-20]	;dy
	push	WORD PTR [bp-18]	;dx
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 3695
	push	WORD PTR $S1359_i
	call	_CheckDetection
	add	sp,2
	cmp	ax,-999
	je	$I2655
	cmp	WORD PTR [bp-2],0	;secplace
	je	$I2651
	cmp	WORD PTR [bp-2],3	;secplace
	jne	$I2655
$I2651:
; Line 3696
	cmp	WORD PTR [bp-4],32	;tdistnm
	jae	$I2655
; Line 3698
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+2]
	mov	WORD PTR [bp-10],ax	;winglead
	or	ax,ax
	jl	$I2653
; Line 3699
	push	ax
	call	_CheckDetection
	add	sp,2
	mov	WORD PTR [bp-10],ax	;winglead
; Line 3700
; Line 3701
	jmp	SHORT $I2654
$I2653:
; Line 3702
	mov	WORD PTR [bp-10],-999	;winglead
$I2654:
; Line 3703
	cmp	WORD PTR [bp-10],-999	;winglead
	jne	$I2655
; Line 3704
	call	_PostHole
; Line 3705
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 3706
; Line 3707
$I2655:
; Line 3708
; Line 3710
	cmp	WORD PTR [bp-2],4	;secplace
	jle	$I2656
; Line 3711
	test	BYTE PTR [bp-2],1	;secplace
	je	$L20119
; Line 3712
$L20118:
	call	_BracketRight
; Line 3713
	jmp	SHORT $I2661
	nop	
$I2656:
	cmp	WORD PTR [bp-2],2	;secplace
	jle	$L20118
; Line 3720
$L20119:
	call	_BracketLeft
; Line 3721
$I2661:
; Line 3723
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-14],ax	;prewing
; Line 3724
	cmp	WORD PTR [bp-4],21	;tdistnm
	jae	$I2662
	jmp	SHORT $L20120
$FC2667:
; Line 3729
	mov	ax,46
	imul	WORD PTR [bp-8]	;wingcnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _FlyStraight
; Line 3730
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-8],ax	;wingcnt
; Line 3731
$L20116:
	cmp	WORD PTR [bp-8],0	;wingcnt
	jge	$FC2667
; Line 3733
	mov	ax,46
	imul	WORD PTR [bp-14]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-14],ax	;prewing
$L20120:
	mov	WORD PTR [bp-8],ax	;wingcnt
; Line 3734
	or	ax,ax
	jge	$L20116
; Line 3735
; Line 3736
$I2662:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_Wall2	ENDP
; Line 3739
	PUBLIC	_Ladder2
_Ladder2	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,36
	call	__aNchkstk
	push	si
;	secplace = -4
;	dx = -32
;	dy = -34
;	tdist = -14
;	tdistnm = -10
;	tpitch = -30
;	tangle = -24
;	enemyalt = -36
;	prewing = -28
;	wingcnt = -18
;	tempalt = -12
;	angleinc = -6
;	angleevade = -26
;	designatedsec = -8
;	rrangle = -22
;	enemyhead = -2
;	rangle = -16
;	winglead = -20
; Line 3750
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+20]
	and	ax,15
	mov	WORD PTR [bp-4],ax	;secplace
; Line 3751
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	mov	WORD PTR _bv[bx+18],ax
; Line 3755
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-28],ax	;prewing
	push	ax
	call	_FirstTargInGroup
	add	sp,2
	mov	WORD PTR [bp-8],ax	;designatedsec
	inc	ax
	je	$I2688
; Line 3756
	mov	ax,46
	imul	WORD PTR [bp-8]	;designatedsec
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+20]
	and	ax,15
	mov	WORD PTR [bp-8],ax	;designatedsec
; Line 3758
$I2688:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I2689
; Line 3759
	mov	ax,WORD PTR _Px
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-32],ax	;dx
; Line 3760
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-34],ax	;dy
; Line 3761
	mov	ax,WORD PTR _OurHead
	jmp	SHORT $L20121
$I2689:
; Line 3764
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	si,WORD PTR $S1358_psi
	sub	ax,WORD PTR [si+2]
	mov	WORD PTR [bp-32],ax	;dx
; Line 3765
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR [si+4]
	mov	WORD PTR [bp-34],ax	;dy
; Line 3766
	mov	ax,WORD PTR _ps[bx+16]
$L20121:
	mov	WORD PTR [bp-2],ax	;enemyhead
; Line 3767
; Line 3768
	sub	ax,ax
	push	ax
	lea	cx,WORD PTR [bp-36]	;enemyalt
	push	cx
	lea	cx,WORD PTR [bp-10]	;tdistnm
	push	cx
	lea	dx,WORD PTR [bp-24]	;tangle
	push	dx
	lea	dx,WORD PTR [bp-30]	;tpitch
	push	dx
	lea	dx,WORD PTR [bp-14]	;tdist
	push	dx
	push	WORD PTR [bp-34]	;dy
	push	WORD PTR [bp-32]	;dx
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 3770
	mov	ax,WORD PTR $S1359_i
	cmp	WORD PTR [bp-8],ax	;designatedsec
	jne	$I2696
; Line 3771
	cmp	WORD PTR [bp-10],32	;tdistnm
	jae	$I2692
; Line 3773
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+2]
	mov	WORD PTR [bp-20],ax	;winglead
	or	ax,ax
	jl	$I2693
; Line 3774
	push	ax
	call	_CheckDetection
	add	sp,2
	mov	WORD PTR [bp-20],ax	;winglead
; Line 3775
; Line 3776
	jmp	SHORT $I2694
	nop	
	nop	
$I2693:
; Line 3777
	mov	WORD PTR [bp-20],-999	;winglead
$I2694:
; Line 3778
	cmp	WORD PTR [bp-20],-999	;winglead
	jne	$I2696
; Line 3779
	call	_PostHole
; Line 3780
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 3781
; Line 3782
; Line 3783
$I2696:
; Line 3787
; Line 3789
	cmp	WORD PTR [bp-4],1	;secplace
	jle	$I2698
	cmp	WORD PTR [bp-4],3	;secplace
	je	$JCC23712
	jmp	$I2697
$JCC23712:
	cmp	WORD PTR [bp-8],1	;designatedsec
	je	$JCC23721
	jmp	$I2697
$JCC23721:
$I2698:
; Line 3790
	mov	ax,WORD PTR [bp-24]	;tangle
	sub	ax,WORD PTR [bp-2]	;enemyhead
	add	ah,128
	mov	WORD PTR [bp-22],ax	;rrangle
; Line 3792
	mov	ax,WORD PTR _LOCKED
	cmp	WORD PTR $S1359_i,ax
	jne	$I2699
; Line 3793
	mov	ax,WORD PTR [bp-2]	;enemyhead
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+16]
	add	ah,104
	mov	WORD PTR [bp-16],ax	;rangle
; Line 3795
	push	ax
	push	WORD PTR $S1359_i
	call	_TurnAIPlaneBy
	jmp	SHORT $L20124
	nop	
$I2692:
; Line 3784
	call	_StraightAttack
; Line 3785
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 3786
$I2699:
; Line 3799
	cmp	WORD PTR [bp-22],-8192	;rrangle
	jge	$I2701
; Line 3800
	mov	WORD PTR [bp-6],-4096	;angleinc
; Line 3801
	jmp	SHORT $I2702
$I2701:
; Line 3802
	mov	WORD PTR [bp-6],-6144	;angleinc
$I2702:
; Line 3804
	mov	ax,16384
	mov	WORD PTR [bp-26],ax	;angleevade
	push	ax
	push	WORD PTR [bp-6]	;angleinc
	call	_BaseBracket
$L20124:
	add	sp,4
; Line 3805
; Line 3807
	mov	ax,WORD PTR [bp-36]	;enemyalt
	sub	ax,1000
	mov	WORD PTR [bp-12],ax	;tempalt
	cmp	ax,50
	jge	$I2703
; Line 3808
	mov	WORD PTR [bp-12],50	;tempalt
; Line 3809
$I2703:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-12]	;tempalt
	cmp	WORD PTR _ps[bx+6],ax
	jle	$I2704
; Line 3811
	mov	WORD PTR _pdest,-8192
; Line 3812
; Line 3813
	jmp	SHORT $I2714
	nop	
	nop	
$I2704:
; Line 3814
	mov	WORD PTR _pdest,0
; Line 3815
; Line 3816
	jmp	SHORT $I2714
$I2697:
	cmp	WORD PTR [bp-4],2	;secplace
	je	$I2708
	cmp	WORD PTR [bp-4],4	;secplace
	jne	$I2707
	cmp	WORD PTR [bp-8],2	;designatedsec
	jne	$I2707
$I2708:
; Line 3819
	mov	ax,16384
	mov	WORD PTR [bp-26],ax	;angleevade
	push	ax
	mov	ax,12288
	mov	WORD PTR [bp-6],ax	;angleinc
	push	ax
	call	_BaseBracket
	add	sp,4
; Line 3820
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-36]	;enemyalt
	add	ax,750
	cmp	WORD PTR _ps[bx+6],ax
	jge	$I2704
; Line 3822
	mov	WORD PTR _pdest,8192
; Line 3823
; Line 3824
	jmp	SHORT $I2714
	nop	
$I2707:
	mov	ax,WORD PTR _LOCKED
	cmp	WORD PTR $S1359_i,ax
	je	$I2713
	cmp	WORD PTR [bp-4],4	;secplace
	je	$I2712
$I2713:
; Line 3831
	mov	ax,16384
	mov	WORD PTR [bp-26],ax	;angleevade
	push	ax
	mov	ax,-12288
	mov	WORD PTR [bp-6],ax	;angleinc
	push	ax
	call	_BaseBracket
	add	sp,4
; Line 3832
; Line 3833
	jmp	SHORT $I2714
	nop	
$I2712:
; Line 3834
	call	_StraightAttack
; Line 3835
$I2714:
; Line 3837
	cmp	WORD PTR [bp-4],1	;secplace
	jle	$I2715
	cmp	WORD PTR [bp-4],3	;secplace
	jne	$I2716
	cmp	WORD PTR [bp-8],1	;designatedsec
	je	$I2715
$I2716:
; Line 3838
	cmp	WORD PTR [bp-10],24	;tdistnm
	jb	$JCC24003
	jmp	$I2727
$JCC24003:
; Line 3839
; Line 3840
	mov	ax,WORD PTR [bp-28]	;prewing
	jmp	SHORT $L20126
	nop	
$FC2722:
; Line 3844
	mov	ax,46
	imul	WORD PTR [bp-18]	;wingcnt
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+20]
	and	ax,15
	mov	WORD PTR [bp-4],ax	;secplace
	cmp	ax,1
	jle	$I2724
	cmp	ax,3
	jne	$I2725
	cmp	WORD PTR [bp-8],1	;designatedsec
	je	$I2724
$I2725:
; Line 3845
; Line 3846
	mov	ax,46
	imul	WORD PTR [bp-18]	;wingcnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _FlyStraight
; Line 3847
; Line 3848
$I2724:
	mov	ax,46
	imul	WORD PTR [bp-18]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-18],ax	;wingcnt
; Line 3849
$L20122:
	cmp	WORD PTR [bp-18],0	;wingcnt
	jge	$FC2722
; Line 3851
	mov	ax,46
	imul	WORD PTR [bp-28]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-28],ax	;prewing
$L20126:
	mov	WORD PTR [bp-18],ax	;wingcnt
; Line 3852
	or	ax,ax
	jge	$L20122
; Line 3853
; Line 3854
; Line 3855
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I2715:
; Line 3856
	push	WORD PTR [bp-24]	;tangle
	call	_abs
	add	sp,2
	cmp	ax,20480
	jle	$I2727
; Line 3857
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _FlyStraight
; Line 3858
; Line 3859
$I2727:
; Line 3860
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_Ladder2	ENDP
; Line 3863
	PUBLIC	_LadderCircle
_LadderCircle	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,48
	call	__aNchkstk
	push	di
	push	si
;	wingcnt = -26
;	txi = -8
;	tyi = -12
;	dx = -38
;	dy = -42
;	dz = -46
;	relangle = -28
;	tangle = -30
;	tpitch = -36
;	troll = -40
;	leadhead = -22
;	isleader = -24
;	tanglel = -14
;	enemyalt = -48
;	tdist = -20
;	distkm = -34
;	tdistnm = -6
;	prewing = -32
;	prespeed = -18
;	secplace = -2
;	whofollow = -4
;	tmpcnt = -10
;	temphead = -16
;	prewing2 = -44
; Line 3873
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+24],16
	je	$I2753
; Line 3874
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _StraightAttack
; Line 3875
	sub	ax,ax
	push	ax
	push	WORD PTR $S1359_i
	call	_ChangeGroupBehavior
	add	sp,4
; Line 3876
; Line 3877
$I2753:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+22],0
; Line 3878
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-32],ax	;prewing
; Line 3879
	mov	ax,WORD PTR $S1359_i
	mov	WORD PTR [bp-4],ax	;whofollow
; Line 3880
	mov	cx,46
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],0
	jl	$I2754
; Line 3881
	mov	ax,WORD PTR _bv[bx+2]
	mov	WORD PTR [bp-4],ax	;whofollow
; Line 3882
	jmp	SHORT $I2756
$I2754:
	mov	ax,cx
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+6],0
	jl	$I2756
; Line 3883
	mov	ax,WORD PTR _bv[bx+6]
	jmp	SHORT $L20131
	nop	
$FC2758:
; Line 3885
	mov	ax,WORD PTR [bp-10]	;tmpcnt
	mov	WORD PTR [bp-4],ax	;whofollow
; Line 3886
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
$L20131:
	mov	WORD PTR [bp-10],ax	;tmpcnt
; Line 3887
	or	ax,ax
	jge	$FC2758
; Line 3888
; Line 3890
$I2756:
	mov	WORD PTR [bp-30],0	;tangle
	mov	WORD PTR [bp-20],0	;tdist
; Line 3891
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR _bv[bx+18],ax
; Line 3893
	mov	ax,WORD PTR [bp-32]	;prewing
	cmp	WORD PTR $S1359_i,ax
	je	$I2761
	mov	ax,WORD PTR $S1359_i
	cmp	WORD PTR [bp-4],ax	;whofollow
	je	$JCC24347
	jmp	$I2760
$JCC24347:
$I2761:
; Line 3894
	mov	ax,12288
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+20]
	mov	WORD PTR _droll,ax
; Line 3895
	mov	WORD PTR _pdest,0
; Line 3896
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	si,ax
	cmp	WORD PTR _bv[si+10],-1
	jne	$I2762
; Line 3897
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-38],ax	;dx
; Line 3898
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR [bx+4]
	jmp	SHORT $L20128
$I2762:
; Line 3901
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	si,WORD PTR $S1358_psi
	sub	ax,WORD PTR [si+2]
	mov	WORD PTR [bp-38],ax	;dx
; Line 3902
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR [si+4]
$L20128:
	mov	WORD PTR [bp-42],ax	;dy
; Line 3903
; Line 3905
	sub	ax,ax
	push	ax
	lea	ax,WORD PTR [bp-48]	;enemyalt
	push	ax
	lea	ax,WORD PTR [bp-6]	;tdistnm
	push	ax
	lea	cx,WORD PTR [bp-30]	;tangle
	push	cx
	lea	dx,WORD PTR [bp-36]	;tpitch
	push	dx
	lea	dx,WORD PTR [bp-20]	;tdist
	push	dx
	push	WORD PTR [bp-42]	;dy
	push	WORD PTR [bp-38]	;dx
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 3907
	cmp	WORD PTR [bp-6],30	;tdistnm
	ja	$JCC24489
	jmp	$I2772
$JCC24489:
	mov	ax,WORD PTR [bp-30]	;tangle
	sub	ax,WORD PTR [bp-16]	;temphead
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,16384
	jl	$JCC24510
	jmp	$I2772
$JCC24510:
; Line 3908
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 3909
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 3915
	push	WORD PTR $S1359_i
	call	_GetAIBase
	add	sp,2
; Line 3917
	mov	ax,WORD PTR [bp-32]	;prewing
	jmp	SHORT $L20132
	nop	
$FC2769:
; Line 3920
	mov	ax,WORD PTR [bp-44]	;prewing2
	cmp	WORD PTR [bp-26],ax	;wingcnt
	je	$I2771
; Line 3921
	mov	ax,46
	imul	WORD PTR [bp-26]	;wingcnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 3922
$I2771:
	mov	ax,40
	imul	WORD PTR [bp-26]	;wingcnt
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 3923
	mov	ax,46
	imul	WORD PTR [bp-26]	;wingcnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 3924
	push	WORD PTR [bp-26]	;wingcnt
	mov	si,bx
	call	_GetAIBase
	add	sp,2
; Line 3925
	mov	ax,WORD PTR _bv[si+4]
	mov	WORD PTR [bp-26],ax	;wingcnt
; Line 3926
$L20129:
	cmp	WORD PTR [bp-26],0	;wingcnt
	jge	$FC2769
; Line 3928
	mov	ax,46
	imul	WORD PTR [bp-44]	;prewing2
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
$L20132:
	mov	WORD PTR [bp-44],ax	;prewing2
	mov	WORD PTR [bp-26],ax	;wingcnt
; Line 3929
	or	ax,ax
	jge	$L20129
; Line 3930
; Line 3931
; Line 3932
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2760:
; Line 3933
	mov	ax,40
	imul	WORD PTR [bp-4]	;whofollow
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	add	ah,128
	mov	WORD PTR [bp-16],ax	;temphead
; Line 3936
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-8],ax	;txi
; Line 3937
	mov	cx,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-12],cx	;tyi
; Line 3939
	mov	si,WORD PTR $S1358_psi
	sub	ax,WORD PTR [si+2]
	mov	WORD PTR [bp-38],ax	;dx
; Line 3940
	sub	cx,WORD PTR [si+4]
	mov	WORD PTR [bp-42],cx	;dy
; Line 3942
	sub	dx,dx
	push	dx
	lea	dx,WORD PTR [bp-48]	;enemyalt
	push	dx
	lea	dx,WORD PTR [bp-6]	;tdistnm
	push	dx
	lea	si,WORD PTR [bp-30]	;tangle
	push	si
	lea	di,WORD PTR [bp-36]	;tpitch
	push	di
	lea	dx,WORD PTR [bp-20]	;tdist
	push	dx
	push	cx
	push	ax
	push	WORD PTR $S1359_i
	mov	si,bx
	call	_GetTargADP
	add	sp,18
; Line 3944
	mov	ax,50
	push	ax
	push	WORD PTR _ps[si+6]
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+6]
	call	_GetAltPitch
	add	sp,6
	mov	WORD PTR [bp-36],ax	;tpitch
; Line 3945
	mov	ax,4096
	push	ax
	mov	ax,-8192
	push	ax
	push	WORD PTR [bp-36]	;tpitch
	call	_rng2
	add	sp,6
	mov	WORD PTR [bp-36],ax	;tpitch
; Line 3947
	mov	ax,WORD PTR [bp-30]	;tangle
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+16]
	mov	WORD PTR [bp-28],ax	;relangle
; Line 3949
	sub	ax,WORD PTR [bx+20]
	mov	WORD PTR [bp-40],ax	;troll
; Line 3950
	mov	ax,WORD PTR [bp-36]	;tpitch
	mov	WORD PTR _pdest,ax
; Line 3952
	cmp	WORD PTR [bp-6],1	;tdistnm
	jae	$I2773
; Line 3953
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	sub	WORD PTR _bv[bx+18],100
; Line 3955
$I2773:
	push	WORD PTR [bp-28]	;relangle
	push	WORD PTR $S1359_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 3967
$I2772:
; Line 3981
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_LadderCircle	ENDP
; Line 3984
	PUBLIC	_CheckDetection
_CheckDetection	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__aNchkstk
;	cnt = -4
;	returnval = -2
;	tdist = -8
;	tdist1 = -12
;	dx = -14
;	dy = -16
;	x = -6
;	y = -10
;	planenum = 4
; Line 3986
	mov	WORD PTR [bp-2],-999	;returnval
; Line 3990
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-6],ax	;x
; Line 3991
	mov	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-10],ax	;y
; Line 3993
	mov	ax,WORD PTR _LOCKED
	cmp	WORD PTR [bp+4],ax	;planenum
	jne	$I2784
	mov	ax,1024
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	jne	$I2784
; Line 3995
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR [bp-10]	;y
; Line 3996
	push	ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR [bp-6]	;x
	push	ax
	call	_xydist
	add	sp,4
	mov	WORD PTR [bp-8],ax	;tdist
; Line 3997
	mov	WORD PTR [bp-2],-1	;returnval
; Line 3998
; Line 4000
$I2784:
	mov	WORD PTR [bp-4],0	;cnt
	jmp	SHORT $F2785
$I2790:
; Line 4011
	mov	WORD PTR [bp-8],ax	;tdist
; Line 4012
	mov	ax,WORD PTR [bp-4]	;cnt
	mov	WORD PTR [bp-2],ax	;returnval
; Line 4013
$I2792:
; Line 4014
; Line 4015
; Line 4016
	inc	WORD PTR [bp-4]	;cnt
$F2785:
	mov	ax,WORD PTR [bp-4]	;cnt
	cmp	WORD PTR _NPLANES,ax
	jle	$FB2787
; Line 4001
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;planenum
	cmp	WORD PTR _bv[bx+10],ax
	jne	$I2792
	test	BYTE PTR _bv[bx+21],16
	je	$I2792
	push	WORD PTR [bp-4]	;cnt
	push	ax
	call	_FriendMatch
	add	sp,4
	or	ax,ax
	jne	$I2792
; Line 4002
	mov	ax,40
	imul	WORD PTR [bp-4]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2792
	test	cl,2
	je	$I2792
	test	cl,32
	jne	$I2792
	cmp	WORD PTR _ps[bx+26],0
	je	$I2792
; Line 4003
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR [bp-10]	;y
	push	ax
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR [bp-6]	;x
	push	ax
	call	_xydist
	add	sp,4
	mov	WORD PTR [bp-12],ax	;tdist1
; Line 4004
	cmp	WORD PTR [bp-2],-999	;returnval
	jne	$I2790
; Line 4005
	mov	ax,WORD PTR [bp-8]	;tdist
	cmp	WORD PTR [bp-12],ax	;tdist1
	jae	$I2792
; Line 4006
	mov	ax,WORD PTR [bp-12]	;tdist1
	jmp	$I2790
	nop	
$FB2787:
; Line 4017
	mov	ax,WORD PTR [bp-2]	;returnval
; Line 4018
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CheckDetection	ENDP
; Line 4021
	PUBLIC	_CheckAnyEnemyLock
_CheckAnyEnemyLock	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	cnt = -2
;	planenum = 4
; Line 4024
$L20134:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I2802:
; Line 4037
	inc	WORD PTR [bp-2]	;cnt
	mov	ax,WORD PTR [bp-2]	;cnt
	cmp	WORD PTR _NPLANES,ax
	jle	$L20134
; Line 4032
	push	WORD PTR [bp+4]	;planenum
	push	ax
	call	_FriendMatch
	add	sp,4
	or	ax,ax
	jne	$I2802
	mov	ax,46
	imul	WORD PTR [bp-2]	;cnt
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],16
	je	$I2802
; Line 4033
	mov	ax,40
	imul	WORD PTR [bp-2]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I2802
	test	cl,2
	je	$I2802
	test	cl,32
	jne	$I2802
	cmp	WORD PTR _ps[bx+26],0
	je	$I2802
; Line 4034
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CheckAnyEnemyLock	ENDP
; Line 4042
	PUBLIC	_ShowAIWeaponStatus
_ShowAIWeaponStatus	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,84
	call	__aNchkstk
	push	si
;	Str = -84
;	cnt = -4
;	S = -2
;	ainum = 4
; Line 4048
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR $S2809_aiptype,ax
	mov	WORD PTR $S2809_aiptype+2,dx
; Line 4050
	lea	ax,WORD PTR [bp-84]	;Str
	push	ax
	push	WORD PTR [bp+4]	;ainum
	call	_GetWingName
	add	sp,4
; Line 4051
	lea	ax,WORD PTR [bp-84]	;Str
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 4052
	push	WORD PTR [bp+4]	;ainum
	call	_CheckAIMissiles
	add	sp,2
	inc	ax
	jne	$I2811
; Line 4053
	mov	ax,OFFSET DGROUP:$SG2812
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4054
; Line 4055
	jmp	$FB2817
	nop	
$I2811:
; Line 4056
	mov	ax,OFFSET DGROUP:$SG2814
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4057
	mov	WORD PTR [bp-4],0	;cnt
	jmp	SHORT $F2815
	nop	
$I2821:
	mov	bx,WORD PTR $S2809_aiptype
	add	bx,26
	mov	si,WORD PTR [bp-4]	;cnt
	shl	si,1
	cmp	WORD PTR es:[bx][si],47
	jne	$I2824
; Line 4066
	mov	ax,OFFSET DGROUP:$SG2825
	jmp	SHORT $L20135
	nop	
$I2824:
	mov	bx,WORD PTR $S2809_aiptype
	add	bx,26
	mov	si,WORD PTR [bp-4]	;cnt
	shl	si,1
	cmp	WORD PTR es:[bx][si],49
	jne	$I2827
; Line 4068
	mov	ax,OFFSET DGROUP:$SG2828
	jmp	SHORT $L20135
	nop	
$I2827:
	mov	bx,WORD PTR $S2809_aiptype
	add	bx,26
	mov	si,WORD PTR [bp-4]	;cnt
	shl	si,1
	cmp	WORD PTR es:[bx][si],48
	jne	$I2830
; Line 4070
	mov	ax,OFFSET DGROUP:$SG2831
	jmp	SHORT $L20135
	nop	
$I2830:
; Line 4072
	mov	ax,OFFSET DGROUP:$SG2833
$L20135:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
$I2829:
; Line 4073
	inc	WORD PTR [bp-4]	;cnt
$F2815:
	cmp	WORD PTR [bp-4],3	;cnt
	jge	$FB2817
; Line 4058
	mov	ax,20
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	add	bx,WORD PTR [bp-4]	;cnt
	shl	bx,1
	cmp	WORD PTR _ps[bx+34],0
	je	$I2829
; Line 4060
	cmp	WORD PTR [bp-4],0	;cnt
	jle	$I2819
; Line 4061
	mov	ax,OFFSET DGROUP:$SG2820
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4062
$I2819:
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	mov	ax,20
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	add	bx,WORD PTR [bp-4]	;cnt
	shl	bx,1
	push	WORD PTR _ps[bx+34]
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4063
	les	bx,DWORD PTR $S2809_aiptype
	add	bx,26
	mov	si,WORD PTR [bp-4]	;cnt
	shl	si,1
	cmp	WORD PTR es:[bx][si],46
	je	$JCC25507
	jmp	$I2821
$JCC25507:
; Line 4064
	mov	ax,OFFSET DGROUP:$SG2822
	jmp	$L20135
$FB2817:
; Line 4074
; Line 4075
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 4076
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ShowAIWeaponStatus	ENDP
; Line 4079
	PUBLIC	_ShowAIStatus
_ShowAIStatus	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,164
	call	__aNchkstk
;	isdamaged = -164
;	Str = -82
;	Str2 = -162
;	rtemp = -2
;	otherai = 6
;	ainum = 4
; Line 4085
	mov	WORD PTR [bp-164],0	;isdamaged
; Line 4086
	lea	ax,WORD PTR [bp-82]	;Str
	push	ax
	push	WORD PTR [bp+4]	;ainum
	call	_GetWingName
	add	sp,4
; Line 4087
	lea	ax,WORD PTR [bp-82]	;Str
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 4089
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],32
	je	$I2841
; Line 4090
	mov	ax,OFFSET DGROUP:$SG2842
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4091
	mov	WORD PTR [bp-164],1	;isdamaged
; Line 4092
; Line 4093
$I2841:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],64
	je	$I2843
; Line 4094
	mov	ax,OFFSET DGROUP:$SG2844
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4095
	mov	WORD PTR [bp-164],1	;isdamaged
; Line 4096
; Line 4097
$I2843:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],128
	je	$I2845
; Line 4098
	mov	ax,OFFSET DGROUP:$SG2846
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4099
	mov	WORD PTR [bp-164],1	;isdamaged
; Line 4100
; Line 4102
$I2845:
	cmp	WORD PTR [bp-164],0	;isdamaged
	je	$I2847
; Line 4103
	mov	ax,OFFSET DGROUP:$SG2848
	jmp	SHORT $L20136
	nop	
$I2847:
; Line 4107
	mov	al,BYTE PTR [bp+6]	;otherai
	add	al,BYTE PTR _Rtime
	and	ax,3
	mov	WORD PTR [bp-2],ax	;rtemp
	or	ax,ax
	jne	$I2850
; Line 4108
	mov	ax,OFFSET DGROUP:$SG2851
	jmp	SHORT $L20136
$I2850:
	cmp	ax,1
	jne	$I2853
; Line 4110
	mov	ax,OFFSET DGROUP:$SG2854
	jmp	SHORT $L20136
$I2853:
	cmp	ax,2
	jne	$I2856
; Line 4112
	mov	ax,OFFSET DGROUP:$SG2857
	jmp	SHORT $L20136
$I2856:
; Line 4114
	mov	ax,OFFSET DGROUP:$SG2859
$L20136:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4115
; Line 4116
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 4117
	push	WORD PTR [bp+4]	;ainum
	call	_ShowAIWeaponStatus
; Line 4118
	mov	sp,bp
	pop	bp
	ret	

_ShowAIStatus	ENDP
; Line 4121
	PUBLIC	_ShowMenuStuff
_ShowMenuStuff	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	MenuID = 4
; Line 4122
	mov	ax,WORD PTR [bp+4]	;MenuID
	jmp	SHORT $S2863
; Line 4123
	nop	
$SC2867:
; Line 4126
	mov	ax,6
	push	ax
	mov	ax,OFFSET DGROUP:$SG2868
$L20137:
	push	ax
	call	_Message
	mov	sp,bp
; Line 4127
	mov	sp,bp
	pop	bp
	ret	
; Line 4129
	nop	
$SC2869:
; Line 4132
	mov	ax,6
	push	ax
	mov	ax,OFFSET DGROUP:$SG2870
	jmp	SHORT $L20137
; Line 4135
	nop	
$SC2871:
; Line 4138
	mov	ax,6
	push	ax
	mov	ax,OFFSET DGROUP:$SG2872
	jmp	SHORT $L20137
; Line 4141
	nop	
$SC2873:
; Line 4144
	mov	ax,6
	push	ax
	mov	ax,OFFSET DGROUP:$SG2874
	jmp	SHORT $L20137
; Line 4147
	nop	
$SC2875:
; Line 4150
	mov	ax,6
	push	ax
	mov	ax,OFFSET DGROUP:$SG2876
	jmp	SHORT $L20137
	nop	
$S2863:
	dec	ax
	je	$SC2867
	dec	ax
	je	$SC2869
	dec	ax
	je	$SC2871
	dec	ax
	je	$SC2873
	dec	ax
	je	$SC2875
; Line 4153
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ShowMenuStuff	ENDP
; Line 4156
	PUBLIC	_ProcessAICommunications
_ProcessAICommunications	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,164
	call	__aNchkstk
;	Str = -80
;	Str2 = -160
;	htemp = -164
;	otherai = -162
;	ainum = 4
; Line 4162
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+12],15
; Line 4163
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+16],2
; Line 4170
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+6],-1
	jne	$I2883
; Line 4171
	mov	WORD PTR [bp-162],1	;otherai
; Line 4172
; Line 4173
	jmp	SHORT $I2888
$I2883:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],0
	jl	$I2885
; Line 4174
	mov	ax,46
	imul	WORD PTR _bv[bx+2]
	mov	bx,ax
	cmp	WORD PTR _bv[bx+6],-1
	jne	$I2885
; Line 4175
	mov	WORD PTR [bp-162],2	;otherai
; Line 4176
; Line 4177
	jmp	SHORT $I2888
	nop	
$I2885:
; Line 4181
	mov	WORD PTR [bp-162],0	;otherai
$I2888:
; Line 4183
	test	BYTE PTR _Rtime,31
	jne	$I2889
	push	WORD PTR [bp+4]	;ainum
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I2889
; Line 4184
	push	WORD PTR [bp+4]	;ainum
	call	_CheckAISix
	add	sp,2
; Line 4186
$I2889:
	lea	ax,WORD PTR [bp-80]	;Str
	push	ax
	push	WORD PTR [bp+4]	;ainum
	call	_GetWingName
	add	sp,4
; Line 4188
	lea	ax,WORD PTR [bp-80]	;Str
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 4191
	cmp	WORD PTR _behavecommands,18
	jne	$I2890
	cmp	WORD PTR [bp-162],0	;otherai
	je	$I2890
; Line 4192
	mov	ax,WORD PTR _Gtime
	add	ax,4
	mov	WORD PTR _OtherAITime,ax
; Line 4193
; Line 4195
$I2890:
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _AIWingMenuTime,ax
	jge	$I2891
; Line 4197
	sub	ax,ax
	mov	WORD PTR _AIWingMenuTime,ax
	mov	WORD PTR _AIWingMenu,ax
; Line 4198
; Line 4200
$I2891:
; Line 4201
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+2],-1
	jne	$I2894
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _OtherAITime,ax
	jge	$I2894
	cmp	WORD PTR _OtherAIDo,0
	je	$I2895
$I2894:
	cmp	WORD PTR [bp-162],0	;otherai
	jne	$JCC26097
	jmp	$L20143
$JCC26097:
	cmp	WORD PTR _OtherAIDo,0
	jne	$I2895
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _OtherAITime,ax
	jge	$JCC26116
	jmp	$L20143
$JCC26116:
$I2895:
; Line 4202
	cmp	WORD PTR [bp-162],0	;otherai
	je	$I2896
	cmp	WORD PTR _behavecommands,0
	je	$I2896
; Line 4203
	cmp	WORD PTR _behavecommands,18
	je	$I2897
; Line 4204
	mov	WORD PTR _OtherAITime,0
; Line 4205
$I2897:
	mov	ax,WORD PTR _behavecommands
	mov	WORD PTR _OtherAIDo,ax
; Line 4206
; Line 4207
$I2896:
	cmp	WORD PTR _Gtime,20
	jge	$I2903
; Line 4208
	cmp	WORD PTR _behavecommands,10
	jne	$I2899
	cmp	WORD PTR _MyWingy,3
	jge	$I2899
; Line 4209
$L20145:
	inc	WORD PTR _MyWingy
; Line 4210
; Line 4211
	jmp	SHORT $I2903
	nop	
$I2899:
	cmp	WORD PTR _behavecommands,18
	jne	$I2901
	cmp	WORD PTR _MyWingy,3
	je	$L20145
$I2901:
	cmp	WORD PTR _behavecommands,8
	jne	$I2903
	cmp	WORD PTR _MyWingy,4
	jne	$I2903
; Line 4216
	mov	ax,-999
	mov	WORD PTR _MyWingy,ax
	push	ax
	call	_InitAddedWingmen
	add	sp,2
; Line 4217
; Line 4218
$I2903:
; Line 4222
	cmp	WORD PTR _behavecommands,21
	jl	$I2904
; Line 4223
	push	WORD PTR [bp+4]	;ainum
	call	_ProcessAICommMenu
	add	sp,2
	mov	sp,bp
	pop	bp
	ret	
; Line 4224
; Line 4226
	nop	
$I2904:
	mov	ax,WORD PTR _behavecommands
	jmp	$S2905
; Line 4252
$SC2909:
; Line 4253
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _StraightAttack
; Line 4254
	test	BYTE PTR _bv[bx+20],32
	jne	$I2910
; Line 4255
	or	BYTE PTR _bv[bx+21],1
; Line 4256
$I2910:
; Line 4257
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],221
; Line 4258
	push	WORD PTR [bp+4]	;ainum
	call	_GetEnemyTarget
	add	sp,2
; Line 4259
	mov	ax,OFFSET DGROUP:$SG2911
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4262
	mov	ax,12
	push	ax
	call	_Speech
	add	sp,2
; Line 4263
	push	WORD PTR [bp+4]	;ainum
	call	_GetSortInfo
	add	sp,2
; Line 4264
$L20139:
	push	WORD PTR [bp+4]	;ainum
	call	_ShowAIWeaponStatus
$L20138:
	add	sp,2
; Line 4265
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$SC2912:
; Line 4269
	cmp	WORD PTR _DESIGNATED,-1
	jne	$JCC26353
	jmp	$L20143
$JCC26353:
; Line 4270
	mov	ax,40
	imul	WORD PTR _DESIGNATED
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],4
	je	$I2914
; Line 4271
	mov	ax,OFFSET DGROUP:$SG2915
	jmp	$L20147
$I2914:
; Line 4275
	mov	ax,OFFSET DGROUP:$SG2917
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4276
	mov	ax,3
	push	ax
	mov	cx,OFFSET _Txt
	push	cx
	call	_Message
	add	sp,4
; Line 4277
	mov	ax,12
	push	ax
	call	_Speech
	add	sp,2
; Line 4278
	sub	ax,ax
	push	ax
	call	_Speech
	add	sp,2
; Line 4279
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	je	$I2918
; Line 4280
	lea	ax,WORD PTR [bp-80]	;Str
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 4281
	mov	ax,OFFSET DGROUP:$SG2919
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4282
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 4283
; Line 4284
$I2918:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],32
; Line 4285
	mov	ax,WORD PTR _DESIGNATED
	mov	WORD PTR _bv[bx+10],ax
	jmp	$L20139
; Line 4288
; Line 4292
	nop	
$SC2920:
; Line 4293
	mov	WORD PTR _AIWingMenu,2
; Line 4294
$L20148:
	mov	ax,WORD PTR _Gtime
	add	ax,5
	mov	WORD PTR _AIWingMenuTime,ax
; Line 4295
	cmp	WORD PTR _OtherAIDo,0
	je	$I2921
; Line 4296
	mov	WORD PTR _OtherAITime,ax
; Line 4297
$I2921:
	push	WORD PTR _AIWingMenu
	call	_ShowMenuStuff
	jmp	$L20146
; Line 4300
	nop	
$SC2922:
; Line 4301
	mov	WORD PTR _AIWingMenu,1
	jmp	SHORT $L20148
; Line 4308
$SC2924:
; Line 4309
	mov	ax,12
	push	ax
	call	_Speech
	add	sp,2
; Line 4310
	mov	ax,-1
	push	ax
	call	_CheckWingmanSix
	add	sp,2
	or	ax,ax
	je	$I2925
; Line 4311
	mov	ax,OFFSET DGROUP:$SG2926
$L20147:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4312
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
$L20141:
	add	sp,4
; Line 4313
; Line 4314
	jmp	$L20143
	nop	
$I2925:
	mov	ax,-1
	push	ax
	call	_NearWingTarget
	add	sp,2
	or	ax,ax
	jne	$JCC26620
	jmp	$L20143
$JCC26620:
; Line 4315
	mov	ax,OFFSET DGROUP:$SG2929
	jmp	SHORT $L20147
; Line 4320
$SC2930:
; Line 4321
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],32
	je	$I2931
; Line 4322
	mov	ax,OFFSET DGROUP:$SG2932
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4323
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 4324
; Line 4325
	jmp	SHORT $I2933
	nop	
$I2931:
; Line 4326
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	WORD PTR _bv[bx+24],0
; Line 4328
	mov	ax,WORD PTR _Gtime
	add	ax,5
	mov	WORD PTR _AIWingMenuTime,ax
; Line 4329
	mov	ax,3
	mov	WORD PTR _AIWingMenu,ax
	push	ax
	call	_ShowMenuStuff
	add	sp,2
; Line 4330
$I2933:
; Line 4331
	cmp	WORD PTR _OtherAIDo,0
	jne	$JCC26717
	jmp	$L20143
$JCC26717:
; Line 4332
	mov	ax,WORD PTR _AIWingMenuTime
	mov	WORD PTR _OtherAITime,ax
; Line 4333
	jmp	$L20143
; Line 4335
	nop	
$SC2935:
; Line 4336
	mov	ax,12
	push	ax
	call	_Speech
	add	sp,2
; Line 4337
	mov	ax,OFFSET DGROUP:$SG2936
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4338
	push	WORD PTR [bp+4]	;ainum
	call	_GetSortInfo
	jmp	$L20146
; Line 4341
	nop	
$SC2937:
; Line 4342
	mov	ax,12
	push	ax
	call	_Speech
	add	sp,2
; Line 4343
	push	WORD PTR [bp-162]	;otherai
	push	WORD PTR [bp+4]	;ainum
	call	_ShowAIStatus
	jmp	$L20141
; Line 4346
	nop	
$SC2938:
; Line 4347
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 4348
	and	BYTE PTR _bv[bx+21],254
; Line 4349
	or	BYTE PTR _bv[bx+21],2
; Line 4350
	mov	WORD PTR _bv[bx+26],0
; Line 4351
	mov	ax,OFFSET DGROUP:$SG2939
$L20142:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4352
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 4353
	mov	ax,12
	push	ax
	call	_Speech
	jmp	$L20138
$SC2940:
; Line 4358
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],4
	je	$I2941
; Line 4359
	and	BYTE PTR _ps[bx+24],251
; Line 4360
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 4361
	mov	ax,OFFSET DGROUP:$SG2942
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4362
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 4363
	mov	ax,12
	push	ax
	call	_Speech
$L20146:
	add	sp,2
; Line 4364
$L20143:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 4365
; Line 4366
$I2941:
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 4367
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 4368
	mov	ax,OFFSET DGROUP:$SG2943
	jmp	$L20142
	nop	
$S2905:
	dec	ax
	cmp	ax,9
	ja	$L20143
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20024[bx]
$L20024:
		DW	$SC2909
		DW	$SC2912
		DW	$SC2920
		DW	$SC2922
		DW	$SC2924
		DW	$SC2930
		DW	$SC2935
		DW	$SC2937
		DW	$SC2938
		DW	$SC2940
; Line 4404

_ProcessAICommunications	ENDP
; Line 4409
	PUBLIC	_ProcessAICommMenu
_ProcessAICommMenu	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,164
	call	__aNchkstk
	push	si
;	otherai = -162
;	Str = -80
;	Str2 = -160
;	htemp = -164
;	ainum = 4
; Line 4415
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+12],15
; Line 4416
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+16],2
; Line 4418
	lea	ax,WORD PTR [bp-80]	;Str
	push	ax
	push	WORD PTR [bp+4]	;ainum
	call	_GetWingName
	add	sp,4
; Line 4420
	lea	ax,WORD PTR [bp-80]	;Str
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 4423
	mov	ax,WORD PTR _behavecommands
	jmp	$S2950
; Line 4424
	nop	
$SC2954:
; Line 4425
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _BracketLeft
; Line 4426
	test	BYTE PTR _bv[bx+21],32
	jne	$I2955
; Line 4427
	mov	WORD PTR _bv[bx+10],-1
; Line 4428
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR [bp+4]	;ainum
	call	_AIRadarForwardCheck
	add	sp,6
; Line 4429
; Line 4430
$I2955:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],32
	jne	$I2956
; Line 4431
	or	BYTE PTR _bv[bx+21],1
; Line 4432
$I2956:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],253
; Line 4433
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I2957
; Line 4434
	mov	ax,WORD PTR _OurHead
	mov	WORD PTR _bv[bx+16],ax
; Line 4435
; Line 4437
$I2957:
	mov	ax,OFFSET DGROUP:$SG2958
$L20150:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4438
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 4439
	mov	ax,12
	push	ax
	call	_Speech
	add	sp,2
; Line 4440
	mov	WORD PTR _AIWingMenu,0
; Line 4441
	cmp	WORD PTR _MyMSGTYP,6
	je	$JCC27202
	jmp	$SB2951
$JCC27202:
; Line 4442
	cmp	WORD PTR _msgtime,0
	jne	$JCC27212
	jmp	$SB2951
$JCC27212:
; Line 4443
	call	FAR PTR _GETTIME
	sub	ax,60
	mov	WORD PTR _msgtime,ax
; Line 4444
; Line 4445
	jmp	$SB2951
; Line 4447
	nop	
$SC2961:
; Line 4448
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _BracketRight
; Line 4449
	test	BYTE PTR _bv[bx+21],32
	jne	$I2962
; Line 4450
	mov	WORD PTR _bv[bx+10],-1
; Line 4451
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR [bp+4]	;ainum
	call	_AIRadarForwardCheck
	add	sp,6
; Line 4452
; Line 4453
$I2962:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],32
	jne	$I2963
; Line 4454
	or	BYTE PTR _bv[bx+21],1
; Line 4455
$I2963:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],253
; Line 4456
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I2964
; Line 4457
	mov	ax,WORD PTR _OurHead
	mov	WORD PTR _bv[bx+16],ax
; Line 4458
; Line 4460
$I2964:
	mov	ax,OFFSET DGROUP:$SG2965
	jmp	$L20150
; Line 4470
	nop	
$SC2968:
; Line 4471
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _FlyStraight
; Line 4472
	test	BYTE PTR _bv[bx+21],32
	jne	$I2969
; Line 4473
	mov	WORD PTR _bv[bx+10],-1
; Line 4474
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR [bp+4]	;ainum
	call	_AIRadarForwardCheck
	add	sp,6
; Line 4475
; Line 4476
$I2969:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],32
	jne	$I2970
; Line 4477
	or	BYTE PTR _bv[bx+21],1
; Line 4478
$I2970:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],253
; Line 4479
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I2971
; Line 4480
	mov	ax,WORD PTR _OurHead
	mov	WORD PTR _bv[bx+16],ax
; Line 4481
; Line 4483
$I2971:
	mov	ax,OFFSET DGROUP:$SG2972
	jmp	$L20150
; Line 4493
	nop	
$SC2975:
; Line 4494
	mov	WORD PTR _AIWingMenu,4
; Line 4495
$L20149:
	mov	ax,WORD PTR _Gtime
	add	ax,5
	mov	WORD PTR _AIWingMenuTime,ax
; Line 4496
	cmp	WORD PTR _OtherAIDo,0
	je	$I2976
; Line 4497
	mov	WORD PTR _OtherAITime,ax
; Line 4498
$I2976:
	push	WORD PTR _AIWingMenu
	call	_ShowMenuStuff
	add	sp,2
; Line 4499
	jmp	$SB2951
; Line 4501
$SC2977:
; Line 4502
	mov	WORD PTR _AIWingMenu,5
	jmp	SHORT $L20149
; Line 4509
$SC2979:
; Line 4510
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 4511
	and	BYTE PTR _bv[bx+21],254
; Line 4512
	or	BYTE PTR _bv[bx+21],2
; Line 4513
	and	BYTE PTR _bv[bx+21],191
; Line 4514
	mov	WORD PTR _bv[bx+28],16
; Line 4515
	mov	ax,OFFSET DGROUP:$SG2980
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	mov	si,bx
	call	_strcat
	add	sp,4
; Line 4516
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 4517
	mov	ax,12
	push	ax
	call	_Speech
	add	sp,2
; Line 4519
	sub	ax,ax
	mov	WORD PTR _AIWingMenu,ax
	mov	WORD PTR _bv[si+26],ax
; Line 4520
	cmp	WORD PTR _MyMSGTYP,6
	jne	$I2982
; Line 4521
	cmp	WORD PTR _msgtime,ax
$L20151:
	je	$I2982
; Line 4522
	call	FAR PTR _GETTIME
	sub	ax,60
	mov	WORD PTR _msgtime,ax
; Line 4523
$I2982:
; Line 4524
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$SC2983:
; Line 4528
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 4530
	or	BYTE PTR _bv[bx+21],64
	test	BYTE PTR _bv[bx+20],32
	jne	$I2984
; Line 4531
	mov	ax,WORD PTR _bv[bx+20]
	or	ah,1
	mov	WORD PTR _bv[bx+20],ax
; Line 4532
$I2984:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],253
; Line 4533
	mov	WORD PTR _bv[bx+28],88
; Line 4534
	mov	ax,OFFSET DGROUP:$SG2985
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4535
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 4536
	mov	ax,12
	push	ax
	call	_Speech
	add	sp,2
; Line 4537
	mov	WORD PTR _AIWingMenu,0
; Line 4538
	push	WORD PTR [bp+4]	;ainum
	call	_ShowAIWeaponStatus
	jmp	SHORT $L20152
$SC2988:
; Line 4547
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 4548
	and	BYTE PTR _bv[bx+21],254
; Line 4549
	or	BYTE PTR _bv[bx+21],2
; Line 4550
	and	BYTE PTR _bv[bx+21],191
; Line 4551
	mov	WORD PTR _bv[bx+28],53
; Line 4552
	mov	ax,OFFSET DGROUP:$SG2989
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	mov	si,bx
	call	_strcat
	add	sp,4
; Line 4554
	sub	ax,ax
	mov	WORD PTR _AIWingMenu,ax
	mov	WORD PTR _bv[si+26],ax
; Line 4555
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 4556
	mov	ax,12
	push	ax
	call	_Speech
$L20152:
	add	sp,2
; Line 4557
	cmp	WORD PTR _MyMSGTYP,6
	je	$JCC27779
	jmp	$I2982
$JCC27779:
; Line 4558
	cmp	WORD PTR _msgtime,0
	jmp	$L20151
$SC2992:
; Line 4565
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],32
	jne	$I2993
; Line 4566
	or	BYTE PTR _bv[bx+21],1
; Line 4567
$I2993:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR _OurHead
	sub	ax,16384
	mov	WORD PTR _bv[bx+16],ax
; Line 4568
	mov	WORD PTR _bv[bx],OFFSET _FlySanitize
; Line 4569
	mov	ax,OFFSET DGROUP:$SG2994
$L20153:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4570
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 4571
	mov	ax,12
	push	ax
	call	_Speech
	add	sp,2
; Line 4572
	cmp	WORD PTR _MyMSGTYP,6
	jne	$I2996
; Line 4573
	cmp	WORD PTR _msgtime,0
	je	$I2996
; Line 4574
	call	FAR PTR _GETTIME
	sub	ax,60
	mov	WORD PTR _msgtime,ax
; Line 4575
$I2996:
; Line 4576
	mov	WORD PTR _AIWingMenu,0
; Line 4577
	jmp	$SB2951
; Line 4579
$SC2997:
; Line 4580
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],32
	jne	$I2998
; Line 4581
	or	BYTE PTR _bv[bx+21],1
; Line 4582
$I2998:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR _OurHead
	add	ah,64
	mov	WORD PTR _bv[bx+16],ax
; Line 4583
	mov	WORD PTR _bv[bx],OFFSET _FlySanitize
; Line 4584
	mov	ax,OFFSET DGROUP:$SG2999
	jmp	SHORT $L20153
; Line 4594
	nop	
$SC3002:
; Line 4595
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],32
	jne	$I3003
; Line 4596
	or	BYTE PTR _bv[bx+21],1
; Line 4597
$I3003:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR _OurHead
	mov	WORD PTR _bv[bx+16],ax
; Line 4598
	mov	WORD PTR _bv[bx],OFFSET _FlySanitize
; Line 4599
	mov	ax,OFFSET DGROUP:$SG3004
	jmp	$L20153
; Line 4609
	nop	
$SC3007:
; Line 4610
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],32
	jne	$I3008
; Line 4611
	or	BYTE PTR _bv[bx+21],1
; Line 4612
$I3008:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR _OurHead
	add	ah,128
	mov	WORD PTR _bv[bx+16],ax
; Line 4613
	mov	WORD PTR _bv[bx],OFFSET _FlySanitize
; Line 4614
	mov	ax,OFFSET DGROUP:$SG3009
	jmp	$L20153
$S2950:
	sub	ax,21
	cmp	ax,23
	ja	$SB2951
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20025[bx]
$L20025:
		DW	$SC2954
		DW	$SC2961
		DW	$SC2977
		DW	$SC2975
		DW	$SC2968
		DW	$SB2951
		DW	$SB2951
		DW	$SB2951
		DW	$SB2951
		DW	$SB2951
		DW	$SC2979
		DW	$SC2988
		DW	$SC2983
		DW	$SB2951
		DW	$SB2951
		DW	$SB2951
		DW	$SB2951
		DW	$SB2951
		DW	$SB2951
		DW	$SB2951
		DW	$SC2992
		DW	$SC2997
		DW	$SC3002
		DW	$SC3007
$SB2951:
; Line 4624
	cmp	WORD PTR _behavecommands,50
	jl	$I3012
; Line 4625
	push	WORD PTR [bp+4]	;ainum
	call	_DoVSeperation
	add	sp,2
; Line 4626
	cmp	WORD PTR _MyMSGTYP,6
	jne	$I3014
; Line 4627
	cmp	WORD PTR _msgtime,0
	je	$I3014
; Line 4628
	call	FAR PTR _GETTIME
	sub	ax,60
	mov	WORD PTR _msgtime,ax
; Line 4629
$I3014:
; Line 4630
	mov	WORD PTR _AIWingMenu,0
; Line 4631
; Line 4632
$I3012:
	sub	ax,ax
; Line 4633
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_ProcessAICommMenu	ENDP
; Line 4636
	PUBLIC	_DoVSeperation
_DoVSeperation	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	htemp = -2
;	ainum = 4
; Line 4639
	cmp	WORD PTR _behavecommands,61
	jge	$I3018
; Line 4640
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,50
	sub	ax,WORD PTR _behavecommands
	mov	cx,250
	imul	cx
	mov	WORD PTR _bv[bx+26],ax
; Line 4641
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _bv[bx+26]
	call	_abs
	add	sp,2
	shl	ax,1
	shl	ax,1
	mov	WORD PTR [bp-2],ax	;htemp
; Line 4642
	mov	ax,OFFSET DGROUP:$SG3019
	jmp	SHORT $L20154
	nop	
$I3018:
; Line 4645
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR _behavecommands
	sub	ax,60
	mov	cx,250
	imul	cx
	mov	WORD PTR _bv[bx+26],ax
; Line 4646
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _bv[bx+26]
	call	_abs
	add	sp,2
	shl	ax,1
	shl	ax,1
	mov	WORD PTR [bp-2],ax	;htemp
; Line 4647
	mov	ax,OFFSET DGROUP:$SG3021
$L20154:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4648
; Line 4649
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	push	WORD PTR [bp-2]	;htemp
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4650
	mov	ax,OFFSET DGROUP:$SG3022
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4651
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 4652
	mov	ax,12
	push	ax
	call	_Speech
; Line 4653
	mov	sp,bp
	pop	bp
	ret	

_DoVSeperation	ENDP
; Line 4656
	PUBLIC	_LowBombTarget
_LowBombTarget	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 4658
	call	_AIBombTarget
; Line 4660
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],95
	jge	$I3024
; Line 4661
	mov	ax,8192
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+18]
	mov	WORD PTR _pdest,ax
; Line 4662
	mov	WORD PTR _pdest,8192
; Line 4663
; Line 4664
	ret	
$I3024:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],125
	jle	$I3026
; Line 4666
	mov	WORD PTR _pdest,-12288
; Line 4667
; Line 4668
	ret	
	nop	
$I3026:
; Line 4669
	mov	WORD PTR _pdest,0
; Line 4671
	ret	
	nop	

_LowBombTarget	ENDP
; Line 4674
	PUBLIC	_AIGetBombDist
_AIGetBombDist	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,38
	call	__aNchkstk
	push	si
;	dx = -26
;	dy = -32
;	dz = -34
;	relangle = -8
;	rrelangle = -24
;	enemyhead = -2
;	tangle = -14
;	tpitch = -22
;	troll = -30
;	enemyalt = -38
;	tdist = -6
;	distnm = -36
;	distkm = -20
;	wingman = -4
;	xval = -12
;	yval = -18
;	zval = -28
; Line 4683
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	mov	WORD PTR _bv[bx+18],ax
; Line 4685
	cmp	WORD PTR _bv[bx+14],-1
	jne	$I3046
; Line 4686
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	si,ax
	or	BYTE PTR _ps[si+24],4
; Line 4687
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 4693
	push	WORD PTR $S1359_i
	call	_GetAIBase
	add	sp,2
; Line 4694
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I3046:
; Line 4697
	lea	ax,WORD PTR [bp-28]	;zval
	push	ax
	lea	ax,WORD PTR [bp-18]	;yval
	push	ax
	lea	cx,WORD PTR [bp-12]	;xval
	push	cx
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _bv[bx+14]
	call	_GetWayXYZ
	add	sp,8
; Line 4700
	mov	ax,WORD PTR [bp-12]	;xval
	mov	dx,WORD PTR [bp-10]
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
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-26],ax	;dx
; Line 4701
	mov	ax,WORD PTR [bp-18]	;yval
	mov	dx,WORD PTR [bp-16]
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
	sub	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-32],ax	;dy
; Line 4702
; Line 4704
	sub	ax,ax
	push	ax
	lea	ax,WORD PTR [bp-38]	;enemyalt
	push	ax
	lea	ax,WORD PTR [bp-36]	;distnm
	push	ax
	lea	cx,WORD PTR [bp-14]	;tangle
	push	cx
	lea	dx,WORD PTR [bp-22]	;tpitch
	push	dx
	lea	dx,WORD PTR [bp-6]	;tdist
	push	dx
	push	WORD PTR [bp-32]	;dy
	push	WORD PTR [bp-26]	;dx
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 4706
	add	BYTE PTR [bp-13],128
; Line 4708
	mov	ax,WORD PTR [bp-14]	;tangle
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+16]
	mov	WORD PTR [bp-8],ax	;relangle
; Line 4710
	cmp	WORD PTR [bp-36],5	;distnm
	jbe	$I3048
; Line 4711
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _LowBombTarget
; Line 4712
; Line 4714
$I3048:
	push	WORD PTR [bp-8]	;relangle
	push	WORD PTR $S1359_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 4716
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],95
	jge	$I3049
; Line 4718
	mov	WORD PTR _pdest,8192
; Line 4719
; Line 4720
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I3049:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],125
	jle	$I3051
; Line 4722
	mov	WORD PTR _pdest,-12288
; Line 4723
; Line 4724
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I3051:
; Line 4725
	mov	WORD PTR _pdest,0
; Line 4742
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AIGetBombDist	ENDP
; Line 4745
	PUBLIC	_AIBombTarget
_AIBombTarget	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,48
	call	__aNchkstk
	push	di
	push	si
;	yval = -26
;	zval = -36
;	coverplane = -44
;	makecap = -10
;	dx = -34
;	dy = -40
;	dz = -42
;	relangle = -16
;	rrelangle = -32
;	enemyhead = -4
;	tangle = -22
;	tpitch = -30
;	troll = -38
;	enemyalt = -48
;	tdist = -14
;	distnm = -46
;	distkm = -28
;	wingman = -8
;	bandit = -12
;	bombalt = -6
;	secplace = -2
;	xval = -20
; Line 4757
	mov	WORD PTR [bp-10],0	;makecap
; Line 4759
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+20]
	and	ax,15
	mov	WORD PTR [bp-2],ax	;secplace
; Line 4762
	push	WORD PTR $S1359_i
	call	_CheckDetection
	add	sp,2
	mov	WORD PTR [bp-12],ax	;bandit
	cmp	ax,-999
	jne	$JCC28845
	jmp	$I3081
$JCC28845:
; Line 4763
	inc	ax
	jne	$I3077
; Line 4764
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-34],ax	;dx
; Line 4765
	mov	cx,WORD PTR _Py
	sub	cx,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-40],cx	;dy
; Line 4766
	push	cx
	jmp	SHORT $L20155
$I3077:
; Line 4769
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR [bp-12]	;bandit
	mov	si,ax
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR _ps[bx+4]
	push	ax
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR _ps[bx+2]
$L20155:
	push	ax
	call	_xydist
	add	sp,4
	mov	WORD PTR [bp-14],ax	;tdist
; Line 4770
; Line 4771
	cmp	ax,450
	jae	$I3081
; Line 4772
	push	WORD PTR $S1359_i
	call	_ShowJettison
	add	sp,2
; Line 4773
	push	WORD PTR $S1359_i
	call	_CheckAIMissiles
	add	sp,2
	inc	ax
	je	$I3080
; Line 4774
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _StraightAttack
; Line 4775
; Line 4776
	jmp	SHORT $I3081
	nop	
$I3080:
; Line 4777
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 4783
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 4784
	push	WORD PTR $S1359_i
	call	_GetAIBase
	add	sp,2
; Line 4785
$I3081:
; Line 4786
; Line 4787
; Line 4789
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR _bv[bx+18],ax
; Line 4791
	cmp	WORD PTR _bv[bx+14],-1
	jne	$I3082
; Line 4792
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$JCC29059
	jmp	$I3100
$JCC29059:
; Line 4793
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 4794
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 4800
	push	WORD PTR $S1359_i
	call	_GetAIBase
	add	sp,2
; Line 4801
; Line 4802
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I3082:
; Line 4805
	lea	ax,WORD PTR [bp-36]	;zval
	push	ax
	lea	ax,WORD PTR [bp-26]	;yval
	push	ax
	lea	cx,WORD PTR [bp-20]	;xval
	push	cx
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _bv[bx+14]
	call	_GetWayXYZ
	add	sp,8
; Line 4808
	mov	ax,WORD PTR [bp-20]	;xval
	mov	dx,WORD PTR [bp-18]
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
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-34],ax	;dx
; Line 4809
	mov	ax,WORD PTR [bp-26]	;yval
	mov	dx,WORD PTR [bp-24]
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
	sub	ax,WORD PTR [bx+4]
	mov	WORD PTR [bp-40],ax	;dy
; Line 4810
; Line 4812
	sub	ax,ax
	push	ax
	lea	ax,WORD PTR [bp-48]	;enemyalt
	push	ax
	lea	ax,WORD PTR [bp-46]	;distnm
	push	ax
	lea	cx,WORD PTR [bp-22]	;tangle
	push	cx
	lea	dx,WORD PTR [bp-30]	;tpitch
	push	dx
	lea	dx,WORD PTR [bp-14]	;tdist
	push	dx
	push	WORD PTR [bp-40]	;dy
	push	WORD PTR [bp-34]	;dx
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 4814
	mov	ax,WORD PTR [bp-22]	;tangle
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+16]
	mov	WORD PTR [bp-16],ax	;relangle
; Line 4816
	cmp	WORD PTR [bp-46],10	;distnm
	jbe	$I3088
	cmp	WORD PTR [bp-46],16	;distnm
	jae	$I3088
; Line 4817
	cmp	WORD PTR [bp-2],3	;secplace
	jge	$I3086
; Line 4818
	add	ah,32
	mov	WORD PTR [bp-16],ax	;relangle
; Line 4819
	jmp	SHORT $I3088
	nop	
$I3086:
	cmp	WORD PTR [bp-2],5	;secplace
	jge	$I3088
; Line 4820
	sub	WORD PTR [bp-16],8192	;relangle
; Line 4821
$I3088:
; Line 4823
	cmp	WORD PTR [bp-46],2	;distnm
	jae	$I3089
	push	WORD PTR [bp-16]	;relangle
	call	_abs
	add	sp,2
	cmp	ax,4096
	jle	$I3089
; Line 4824
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGetBombDist
; Line 4825
; Line 4827
$I3089:
	push	WORD PTR [bp-16]	;relangle
	push	WORD PTR $S1359_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 4829
	cmp	WORD PTR [bp-46],20	;distnm
	jb	$JCC29363
	jmp	$I3090
$JCC29363:
; Line 4830
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	mov	WORD PTR _bv[bx+18],ax
; Line 4832
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-8],ax	;wingman
	or	ax,ax
	jl	$I3092
; Line 4834
	push	ax
	call	_CheckAIBombs
	add	sp,2
	inc	ax
	je	$I3092
	push	WORD PTR [bp-8]	;wingman
	call	_IsBombing
	add	sp,2
	or	ax,ax
	jne	$I3092
	mov	ax,46
	imul	WORD PTR [bp-8]	;wingman
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+14]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	si,ax
	cmp	WORD PTR _bv[si+14],cx
	jne	$I3092
; Line 4835
	mov	WORD PTR _bv[bx],OFFSET _AIBombTarget
; Line 4836
	mov	ax,WORD PTR _bv[si+14]
	mov	WORD PTR _bv[bx+14],ax
; Line 4837
	mov	ax,WORD PTR _bv[si+30]
	mov	dx,WORD PTR _bv[si+32]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 4838
	mov	ax,WORD PTR _bv[si+34]
	mov	dx,WORD PTR _bv[si+36]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 4839
	mov	WORD PTR [bp-10],1	;makecap
; Line 4840
; Line 4841
$I3092:
; Line 4843
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-8],ax	;wingman
	or	ax,ax
	jl	$I3094
; Line 4846
	push	ax
	call	_CheckAIBombs
	add	sp,2
	inc	ax
	je	$I3094
	push	WORD PTR [bp-8]	;wingman
	call	_IsBombing
	add	sp,2
	or	ax,ax
	jne	$I3094
	mov	ax,46
	imul	WORD PTR [bp-8]	;wingman
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+14]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	si,ax
	cmp	WORD PTR _bv[si+14],cx
	jne	$I3094
; Line 4847
	mov	WORD PTR _bv[bx],OFFSET _AIBombTarget
; Line 4848
	mov	ax,WORD PTR _bv[si+14]
	mov	WORD PTR _bv[bx+14],ax
; Line 4849
	mov	ax,WORD PTR _bv[si+30]
	mov	dx,WORD PTR _bv[si+32]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 4850
	mov	ax,WORD PTR _bv[si+34]
	mov	dx,WORD PTR _bv[si+36]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 4851
	mov	WORD PTR [bp-10],1	;makecap
; Line 4852
; Line 4853
$I3094:
; Line 4855
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+10]
	mov	WORD PTR [bp-44],ax	;coverplane
	or	ax,ax
	jl	$I3096
	cmp	WORD PTR [bp-10],0	;makecap
	je	$I3096
; Line 4856
	mov	cx,46
	imul	cx
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _GorillaCover
	jne	$I3096
; Line 4857
	mov	WORD PTR _bv[bx],OFFSET _SetUpCAP1
; Line 4858
	mov	ax,40
	imul	WORD PTR [bp-44]	;coverplane
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
	mov	si,ax
	mov	ax,cx
	mov	di,dx
	imul	WORD PTR [bp-44]	;coverplane
	mov	cx,bx
	mov	bx,ax
	mov	WORD PTR _bv[bx+30],si
	mov	WORD PTR _bv[bx+32],di
; Line 4859
	mov	si,cx
	mov	ax,WORD PTR _ps[si+12]
	mov	dx,WORD PTR _ps[si+14]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 4860
	mov	WORD PTR _bv[bx+14],-1
; Line 4861
	mov	ax,1
	push	ax
	push	WORD PTR [bp-44]	;coverplane
	call	_UpdateInterceptGroup
	add	sp,4
; Line 4862
; Line 4863
$I3096:
; Line 4865
	call	_BOMB_TrackingAI
; Line 4866
	push	WORD PTR [bp-16]	;relangle
	call	_DESIGNATED_TrackingAI
	add	sp,2
; Line 4867
; Line 4868
$I3090:
; Line 4869
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-36]	;zval
	mov	WORD PTR [bp-6],ax	;bombalt
	cmp	WORD PTR _ps[bx+6],ax
	jge	$I3097
; Line 4871
	mov	WORD PTR _pdest,8192
; Line 4872
; Line 4873
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
$I3097:
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-6]	;bombalt
	add	ax,10
	cmp	WORD PTR _ps[bx+6],ax
	jle	$I3099
; Line 4875
	mov	WORD PTR _pdest,-12288
; Line 4876
; Line 4877
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I3099:
; Line 4878
	mov	WORD PTR _pdest,0
$I3100:
; Line 4895
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_AIBombTarget	ENDP
; Line 4899
	PUBLIC	_BOMB_TrackingAI
_BOMB_TrackingAI	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	si
;	f = -6
;	dist = -4
;	dpitch = -10
;	BombAngle = -8
; Line 4919
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+18]
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-10],ax	;dpitch
	push	ax
	call	_Isin
	add	sp,2
	sub	ax,32767
	neg	ax
; Line 4920
	push	ax
	push	ax
	call	_TrgMul
	add	sp,4
	cwd	
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
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
	add	ax,WORD PTR [bp-10]	;dpitch
	mov	WORD PTR [bp-8],ax	;BombAngle
; Line 4922
	push	ax
	call	_Isin
	add	sp,2
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-8]	;BombAngle
	call	_Icos
	add	sp,2
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	imul	cx
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-4],ax	;dist
	mov	WORD PTR [bp-2],dx
; Line 4924
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+16]
	mov	si,ax
	call	_sinXL
	add	sp,6
	add	ax,WORD PTR _ps[si+8]
	adc	dx,WORD PTR _ps[si+10]
	mov	WORD PTR _AIBOMBX,ax
	mov	WORD PTR _AIBOMBX+2,dx
; Line 4925
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;dist
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+16]
	mov	si,ax
	call	_cosXL
	add	sp,6
	mov	cx,WORD PTR _ps[si+12]
	mov	bx,WORD PTR _ps[si+14]
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR _AIBOMBY,cx
	mov	WORD PTR _AIBOMBY+2,bx
; Line 4926
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_BOMB_TrackingAI	ENDP
; Line 4931
	PUBLIC	_DESIGNATED_TrackingAI
_DESIGNATED_TrackingAI	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,42
	call	__aNchkstk
	push	si
;	dx = -38
;	dy = -42
;	BOMBdist = -18
;	DROPdist = -30
;	TGTdist = -8
;	angl = -6
;	WentBy = -26
;	tempspeed = -22
;	showpa = -4
;	behavenum = -34
;	formnum = -14
;	speedval = -12
;	altval = -10
;	headval = -20
;	attack = -24
;	launch = -32
;	wpflag = -2
;	relangle = 4
; Line 4942
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,27
	imul	WORD PTR _ps[bx+26]
	mov	WORD PTR [bp-22],ax	;tempspeed
; Line 4945
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+30]
	mov	dx,WORD PTR _bv[bx+32]
	sub	ax,WORD PTR _AIBOMBX
	sbb	dx,WORD PTR _AIBOMBX+2
	mov	WORD PTR [bp-38],ax	;dx
	mov	WORD PTR [bp-36],dx
; Line 4946
	mov	cx,WORD PTR _bv[bx+34]
	mov	si,WORD PTR _bv[bx+36]
	sub	cx,WORD PTR _AIBOMBY
	sbb	si,WORD PTR _AIBOMBY+2
	mov	WORD PTR [bp-42],cx	;dy
	mov	WORD PTR [bp-40],si
; Line 4948
	push	si
	push	cx
	push	dx
	push	ax
	call	_LDist2D
	add	sp,8
	mov	WORD PTR [bp-18],ax	;BOMBdist
	mov	WORD PTR [bp-16],dx
; Line 4952
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-42]	;dy
	mov	dx,WORD PTR [bp-40]
	neg	ax
	adc	dx,0
	neg	dx
	push	dx
	push	ax
	push	WORD PTR [bp-36]
	push	WORD PTR [bp-38]	;dx
	call	_Langle
	add	sp,8
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	sub	cx,WORD PTR _ps[bx+16]
	neg	cx
	mov	WORD PTR [bp-6],cx	;angl
	push	cx
	call	_cosXL
	add	sp,6
	mov	WORD PTR [bp-30],ax	;DROPdist
	mov	WORD PTR [bp-28],dx
	or	dx,dx
	jge	$L20026
	mov	ax,1
	jmp	SHORT $L20027
	nop	
$L20026:
	sub	ax,ax
$L20027:
	mov	WORD PTR [bp-26],ax	;WentBy
; Line 4953
	or	ax,ax
	je	$I3129
	neg	WORD PTR [bp-30]	;DROPdist
	adc	WORD PTR [bp-28],0
	neg	WORD PTR [bp-28]
; Line 4955
$I3129:
; Line 4956
	mov	WORD PTR [bp-4],2	;showpa
; Line 4958
	mov	ax,WORD PTR [bp-22]	;tempspeed
	inc	ax
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-30]	;DROPdist
	mov	dx,WORD PTR [bp-28]
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
	mov	WORD PTR _AITREL,ax
	cmp	ax,6
	jb	$JCC30360
	jmp	$I3133
$JCC30360:
; Line 4959
	push	WORD PTR [bp+4]	;relangle
	call	_abs
	add	sp,2
	cmp	ax,2048
	jle	$I3131
; Line 4960
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _LowBombTarget
; Line 4961
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 4962
; Line 4963
	nop	
$I3131:
	call	_DropAIBomb
	or	ax,ax
	jne	$JCC30405
	jmp	$I3133
$JCC30405:
; Line 4964
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	jne	$I3134
; Line 4965
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR $S1359_i
	call	_GetWingName
	add	sp,4
; Line 4966
	mov	ax,OFFSET DGROUP:$SG3135
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 4967
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 4968
; Line 4969
$I3134:
	lea	ax,WORD PTR [bp-2]	;wpflag
	push	ax
	lea	cx,WORD PTR [bp-32]	;launch
	push	cx
	lea	cx,WORD PTR [bp-24]	;attack
	push	cx
	lea	cx,WORD PTR [bp-20]	;headval
	push	cx
	lea	cx,WORD PTR [bp-10]	;altval
	push	cx
	lea	cx,WORD PTR [bp-12]	;speedval
	push	cx
	lea	cx,WORD PTR [bp-14]	;formnum
	push	cx
	lea	cx,WORD PTR [bp-34]	;behavenum
	push	cx
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _bv[bx+14]
	call	_GetWayPointChanges
	add	sp,18
; Line 4970
	test	BYTE PTR [bp-1],128
	je	$I3136
; Line 4971
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _bv[bx+14]
	mov	al,BYTE PTR _bv[bx+12]
	cbw	
	neg	ax
	push	ax
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR $S1359_i
	mov	ax,43
	push	ax
	call	_LogIt
	add	sp,24
; Line 4973
; Line 4974
$I3136:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _FlyWayPoint
; Line 4976
	inc	WORD PTR _bv[bx+14]
	push	WORD PTR _bv[bx+14]
	push	WORD PTR $S1359_i
	call	_DoNextWayPt
	add	sp,4
; Line 4977
	push	WORD PTR $S1359_i
	call	_RestoreCover
	add	sp,2
; Line 4999
; Line 5000
$I3133:
; Line 5001
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DESIGNATED_TrackingAI	ENDP
; Line 5004
	PUBLIC	_DropAIBomb
_DropAIBomb	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
	push	si
;	type = -4
;	weaponnum = -10
;	aistation = -20
;	ssk = -2
;	S = -6
;	missilenum = -8
;	xval = -14
;	yval = -18
;	zval = -22
; Line 5016
	push	WORD PTR $S1359_i
	call	_CheckAIBombs
	add	sp,2
	mov	WORD PTR [bp-20],ax	;aistation
	inc	ax
	jne	$I3148
; Line 5017
; Line 5018
	push	WORD PTR $S1359_i
	call	_CheckAIMissiles
	add	sp,2
	inc	ax
	je	$I3149
; Line 5019
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _StraightAttack
; Line 5020
$L20156:
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 5021
; Line 5022
	nop	
$I3149:
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	je	$I3150
; Line 5023
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],4
; Line 5024
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _AIGoHome
; Line 5030
	push	WORD PTR $S1359_i
	call	_GetAIBase
	add	sp,2
; Line 5031
; Line 5032
$I3150:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
	jmp	SHORT $L20156
; Line 5034
; Line 5036
	nop	
$I3148:
	mov	WORD PTR [bp-10],1	;weaponnum
; Line 5037
	les	bx,DWORD PTR _ptype
	add	bx,26
	mov	si,WORD PTR [bp-20]	;aistation
	shl	si,1
	cmp	WORD PTR es:[bx][si],50
	jne	$I3151
; Line 5038
	mov	WORD PTR [bp-10],1	;weaponnum
; Line 5040
$I3151:
	mov	ax,24
	imul	WORD PTR [bp-10]	;weaponnum
	mov	bx,ax
	mov	ax,WORD PTR _ORDNANCE[bx+12]
	mov	WORD PTR [bp-4],ax	;type
; Line 5043
	push	WORD PTR $S1359_i
	mov	ax,15
	push	ax
	sub	ax,ax
	push	ax
	call	_FindEmptyMissileSlot2
	add	sp,6
	mov	WORD PTR [bp-8],ax	;missilenum
	mov	cx,44
	imul	cx
	add	ax,OFFSET _ss
	mov	WORD PTR [bp-2],ax	;ssk
; Line 5044
	cmp	WORD PTR [bp-8],-1	;missilenum
	jne	$I3152
; Line 5045
	mov	WORD PTR [bp-2],OFFSET _ss	;ssk
; Line 5046
; Line 5047
	jmp	SHORT $I3153
	nop	
$I3152:
; Line 5048
	mov	ax,cx
	imul	WORD PTR [bp-8]	;missilenum
	add	ax,OFFSET _ss
	mov	WORD PTR [bp-2],ax	;ssk
; Line 5049
$I3153:
; Line 5050
	mov	bx,WORD PTR [bp-2]	;ssk
	cmp	WORD PTR [bx+26],0
	je	$JCC30878
	jmp	$L20156
$JCC30878:
	cmp	WORD PTR [bp-8],-1	;missilenum
	jne	$JCC30887
	jmp	$L20156
$JCC30887:
; Line 5053
	cmp	WORD PTR _warstatus,0
	jne	$I3157
; Line 5054
	mov	ax,40
	imul	WORD PTR _whichourcarr
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I3157
	test	cl,2
	je	$I3157
; Line 5055
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	bx,WORD PTR _bv[bx+14]
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jg	$I3157
	jl	$L20028
	cmp	WORD PTR _aiwaypoints[bx],-1
	ja	$I3157
$L20028:
	mov	ax,46
	imul	WORD PTR _whichourcarr
	mov	si,ax
	mov	al,BYTE PTR _bv[si+44]
	cbw	
	cwd	
	cmp	WORD PTR _aiwaypoints[bx+4],ax
	jne	$I3157
	cmp	WORD PTR _aiwaypoints[bx+6],dx
	jne	$I3157
; Line 5056
	mov	WORD PTR _warstatus,1
; Line 5057
	mov	WORD PTR _LastCall,-240
; Line 5058
; Line 5059
$I3157:
; Line 5060
; Line 5062
	mov	ax,20
	imul	WORD PTR $S1359_i
	mov	bx,ax
	add	bx,WORD PTR [bp-20]	;aistation
	shl	bx,1
	dec	WORD PTR _ps[bx+34]
; Line 5064
	sub	ax,ax
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,50
	push	cx
	mov	cx,-999
	push	cx
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR $S1359_i
	mov	ax,24
	push	ax
	call	_LogIt
	add	sp,24
; Line 5080
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-4]	;type
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	bx,WORD PTR _bv[bx+14]
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	push	WORD PTR _aiwaypoints[bx+6]
	push	WORD PTR _aiwaypoints[bx+4]
	push	WORD PTR _aiwaypoints[bx+2]
	push	WORD PTR _aiwaypoints[bx]
	push	WORD PTR $S1359_i
	mov	ax,-1
	push	ax
	mov	ax,40
	imul	WORD PTR $S1359_i
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
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-8]	;missilenum
	call	_firemissile2
	add	sp,38
; Line 5103
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_DropAIBomb	ENDP
; Line 5109
	PUBLIC	_TurnAIPlaneBy
_TurnAIPlaneBy	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	relangle = 6
;	ainum = 4
; Line 5125
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR [bp+6]	;relangle
	sub	ax,WORD PTR _ps[bx+20]
	mov	WORD PTR _droll,ax
	push	ax
	call	_abs
	mov	sp,bp
	cmp	ax,4096
	jge	$I3161
; Line 5126
	mov	cl,2
	shl	WORD PTR _droll,cl
; Line 5136
$I3161:
	pop	bp
	ret	
	nop	

_TurnAIPlaneBy	ENDP
; Line 5138
	PUBLIC	_InitAddedWingmen
_InitAddedWingmen	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__aNchkstk
	push	di
	push	si
;	cnt = -14
;	numwingmen = -12
;	wingspace = -2
;	lastplane = -8
;	lastsec = -16
;	otherplane = -4
;	otherplane2 = -6
;	wingnum = -10
;	planenum = 4
; Line 5148
	mov	ax,-999
	mov	WORD PTR [bp-4],ax	;otherplane
	mov	WORD PTR [bp-6],ax	;otherplane2
	mov	WORD PTR _MyWingy,ax
; Line 5150
	cmp	WORD PTR [bp+4],ax	;planenum
	jne	$I3172
; Line 5151
	call	_GetPlayerHelp
	jmp	SHORT $L20157
	nop	
$I3172:
; Line 5153
	mov	ax,WORD PTR [bp+4]	;planenum
$L20157:
	mov	WORD PTR [bp-14],ax	;cnt
; Line 5155
	cmp	ax,-999
	jne	$JCC31307
	jmp	$I3178
$JCC31307:
; Line 5158
	mov	ax,46
	imul	WORD PTR [bp-14]	;cnt
	mov	bx,ax
	mov	WORD PTR _bv[bx+6],-1
; Line 5159
	mov	ax,WORD PTR [bp-14]	;cnt
	mov	WORD PTR _WingID+2,ax
; Line 5160
	add	WORD PTR _bv[bx+20],2
; Line 5161
	mov	cx,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-10],cx	;wingnum
; Line 5162
	or	cx,cx
	jl	$I3176
; Line 5163
	mov	WORD PTR _WingID+4,cx
; Line 5164
	mov	ax,cx
	mov	cx,46
	imul	cx
	mov	si,ax
	add	WORD PTR _bv[si+20],2
; Line 5166
	mov	ax,cx
	imul	WORD PTR [bp-10]	;wingnum
	mov	si,ax
	mov	ax,WORD PTR _bv[si+4]
	mov	WORD PTR [bp-6],ax	;otherplane2
	or	ax,ax
	jl	$I3176
; Line 5168
	mov	ax,-999
	mov	WORD PTR _bv[si+4],ax
	mov	dx,ax
	mov	ax,cx
	mov	si,dx
	imul	WORD PTR [bp-6]	;otherplane2
	mov	di,ax
	mov	WORD PTR _bv[di+2],si
; Line 5169
	mov	ax,WORD PTR _bv[bx]
	mov	WORD PTR _bv[di],ax
; Line 5170
; Line 5171
$I3176:
; Line 5173
	cmp	WORD PTR [bp+4],-999	;planenum
	jne	$I3178
; Line 5175
	mov	ax,46
	imul	WORD PTR [bp-14]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-4],ax	;otherplane
	or	ax,ax
	jl	$I3178
; Line 5177
	mov	ax,-999
	mov	WORD PTR _bv[bx+8],ax
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp-4]	;otherplane
	mov	si,ax
	mov	WORD PTR _bv[si+6],cx
; Line 5178
	mov	ax,WORD PTR _bv[bx]
	mov	WORD PTR _bv[si],ax
; Line 5179
; Line 5180
$I3178:
; Line 5181
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_InitAddedWingmen	ENDP
; Line 5184
	PUBLIC	_CheckAIBombs
_CheckAIBombs	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	si
;	aistation = -10
;	S = -4
;	aiptype = -8
;	ainum = 4
; Line 5190
	mov	WORD PTR [bp-10],-1	;aistation
; Line 5197
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	mov	si,bx
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-8],ax	;aiptype
	mov	WORD PTR [bp-6],dx
	mov	es,dx
	mov	bx,ax
	push	WORD PTR es:[bx+26]
	call	_GetMissilePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	cmp	WORD PTR es:[bx+22],1
	je	$I3184
	cmp	WORD PTR es:[bx+22],2
	je	$I3184
	cmp	WORD PTR es:[bx+22],3
	je	$I3184
	cmp	WORD PTR es:[bx+22],4
	je	$I3184
	cmp	WORD PTR _ps[si+34],0
	jle	$I3184
; Line 5198
	mov	WORD PTR [bp-10],0	;aistation
; Line 5199
; Line 5200
	jmp	$I3188
$I3184:
; Line 5204
	les	bx,DWORD PTR [bp-8]	;aiptype
	push	WORD PTR es:[bx+28]
	call	_GetMissilePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	cmp	WORD PTR es:[bx+22],1
	je	$I3186
	cmp	WORD PTR es:[bx+22],2
	je	$I3186
	cmp	WORD PTR es:[bx+22],3
	je	$I3186
	cmp	WORD PTR es:[bx+22],4
	je	$I3186
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _ps[bx+36],0
	jle	$I3186
; Line 5205
	mov	WORD PTR [bp-10],1	;aistation
; Line 5206
; Line 5207
	jmp	SHORT $I3188
	nop	
$I3186:
; Line 5211
	les	bx,DWORD PTR [bp-8]	;aiptype
	push	WORD PTR es:[bx+30]
	call	_GetMissilePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	cmp	WORD PTR es:[bx+22],1
	je	$I3188
	cmp	WORD PTR es:[bx+22],2
	je	$I3188
	cmp	WORD PTR es:[bx+22],3
	je	$I3188
	cmp	WORD PTR es:[bx+22],4
	je	$I3188
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _ps[bx+38],0
	jle	$I3188
; Line 5212
	mov	WORD PTR [bp-10],2	;aistation
; Line 5213
; Line 5214
$I3188:
; Line 5215
; Line 5216
	mov	ax,WORD PTR [bp-10]	;aistation
; Line 5217
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CheckAIBombs	ENDP
; Line 5220
	PUBLIC	_CheckAIMissiles
_CheckAIMissiles	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
;	aistation = -10
;	aiptype = -8
;	S = -4
;	ainum = 4
; Line 5226
	mov	WORD PTR [bp-10],-1	;aistation
; Line 5233
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	WORD PTR [bp-8],bx	;aiptype
	mov	WORD PTR [bp-6],es
	push	WORD PTR es:[bx+26]
	call	_GetMissilePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	cmp	WORD PTR es:[bx+22],1
	je	$I3195
	cmp	WORD PTR es:[bx+22],2
	je	$I3195
	cmp	WORD PTR es:[bx+22],3
	je	$I3195
	cmp	WORD PTR es:[bx+22],4
	jne	$I3194
$I3195:
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _ps[bx+34],0
	jle	$I3194
; Line 5234
	mov	WORD PTR [bp-10],0	;aistation
; Line 5235
; Line 5236
	jmp	$I3200
	nop	
$I3194:
; Line 5240
	les	bx,DWORD PTR [bp-8]	;aiptype
	push	WORD PTR es:[bx+28]
	call	_GetMissilePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	cmp	WORD PTR es:[bx+22],1
	je	$I3198
	cmp	WORD PTR es:[bx+22],2
	je	$I3198
	cmp	WORD PTR es:[bx+22],3
	je	$I3198
	cmp	WORD PTR es:[bx+22],4
	jne	$I3197
$I3198:
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _ps[bx+36],0
	jle	$I3197
; Line 5241
	mov	WORD PTR [bp-10],1	;aistation
; Line 5242
; Line 5243
	jmp	SHORT $I3200
	nop	
$I3197:
; Line 5247
	les	bx,DWORD PTR [bp-8]	;aiptype
	push	WORD PTR es:[bx+30]
	call	_GetMissilePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	cmp	WORD PTR es:[bx+22],1
	je	$I3201
	cmp	WORD PTR es:[bx+22],2
	je	$I3201
	cmp	WORD PTR es:[bx+22],3
	je	$I3201
	cmp	WORD PTR es:[bx+22],4
	jne	$I3200
$I3201:
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	cmp	WORD PTR _ps[bx+38],0
	jle	$I3200
; Line 5248
	mov	WORD PTR [bp-10],2	;aistation
; Line 5249
; Line 5250
$I3200:
; Line 5251
; Line 5252
	mov	ax,WORD PTR [bp-10]	;aistation
; Line 5253
	mov	sp,bp
	pop	bp
	ret	

_CheckAIMissiles	ENDP
; Line 5256
	PUBLIC	_NearWingTarget
_NearWingTarget	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,40
	call	__aNchkstk
	push	di
	push	si
;	returnval = -6
;	x = -18
;	y = -24
;	dx = -36
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
;	wingnum = 4
; Line 5262
	cmp	WORD PTR [bp+4],-1	;wingnum
	jne	$I3224
; Line 5263
	mov	ax,WORD PTR _Px
	mov	WORD PTR [bp-18],ax	;x
; Line 5264
	mov	ax,WORD PTR _Py
	mov	WORD PTR [bp-24],ax	;y
; Line 5265
	mov	ax,WORD PTR _OurHead
	jmp	SHORT $L20158
$I3224:
; Line 5268
	mov	ax,40
	imul	WORD PTR [bp+4]	;wingnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-18],ax	;x
; Line 5269
	mov	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-24],ax	;y
; Line 5270
	mov	ax,WORD PTR _ps[bx+16]
$L20158:
	mov	WORD PTR [bp-12],ax	;winghead
; Line 5271
; Line 5274
	mov	WORD PTR [bp-14],-999	;targetnum
; Line 5275
	mov	WORD PTR [bp-16],0	;tdist
; Line 5277
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;founddist
	mov	WORD PTR [bp-10],ax	;cnt
	jmp	$F3226
$FC3227:
; Line 5279
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	jne	$JCC32068
	jmp	$I3231
$JCC32068:
	test	cl,2
	jne	$JCC32076
	jmp	$I3231
$JCC32076:
	test	cx,2080
	je	$JCC32085
	jmp	$I3231
$JCC32085:
; Line 5280
	push	WORD PTR [bp-10]	;cnt
	push	WORD PTR $S1359_i
	mov	si,bx
	call	_FriendMatch
	add	sp,4
	or	ax,ax
	jne	$I3231
; Line 5281
	mov	ax,WORD PTR [bp-18]	;x
	sub	ax,WORD PTR _ps[si+2]
	mov	WORD PTR [bp-36],ax	;dx
; Line 5282
	mov	cx,WORD PTR [bp-24]	;y
	sub	cx,WORD PTR _ps[si+4]
	mov	WORD PTR [bp-38],cx	;dy
; Line 5283
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
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 5284
	mov	ax,WORD PTR [bp-30]	;tangle
	sub	ax,WORD PTR _ps[si+16]
	mov	WORD PTR [bp-22],ax	;rangle
; Line 5285
	mov	ax,WORD PTR [bp-16]	;tdist
	cmp	WORD PTR [bp-20],ax	;tdist1
	jb	$I3232
	cmp	WORD PTR [bp-4],11	;tdistnm
	jae	$I3231
	cmp	WORD PTR [bp-2],0	;founddist
	jne	$I3231
$I3232:
; Line 5286
	mov	WORD PTR [bp-2],1	;founddist
; Line 5287
	mov	ax,WORD PTR [bp-20]	;tdist1
	mov	WORD PTR [bp-16],ax	;tdist
; Line 5288
	mov	ax,WORD PTR [bp-10]	;cnt
	mov	WORD PTR [bp-14],ax	;targetnum
; Line 5289
	mov	ax,WORD PTR [bp-22]	;rangle
	mov	WORD PTR [bp-26],ax	;rangle1
; Line 5290
	mov	ax,WORD PTR [bp-28]	;rrangle
	mov	WORD PTR [bp-32],ax	;rrangle1
; Line 5291
	mov	ax,WORD PTR [bp-4]	;tdistnm
	mov	WORD PTR [bp-8],ax	;tdistnm1
; Line 5292
; Line 5293
$I3231:
; Line 5294
; Line 5295
	inc	WORD PTR [bp-10]	;cnt
$F3226:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-10],ax	;cnt
	jge	$JCC32238
	jmp	$FC3227
$JCC32238:
; Line 5296
	cmp	WORD PTR [bp-2],0	;founddist
	je	$I3233
; Line 5297
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-14]	;targetnum
	mov	WORD PTR _bv[bx+10],ax
; Line 5298
	mov	WORD PTR _bv[bx],OFFSET _FlyStraight
; Line 5299
	or	BYTE PTR _bv[bx+21],32
; Line 5300
	mov	ax,WORD PTR [bp-2]	;founddist
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 5301
; Line 5303
	nop	
$I3233:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],223
; Line 5304
	sub	ax,ax
; Line 5305
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_NearWingTarget	ENDP
; Line 5308
	PUBLIC	_AIRadarForwardCheck
_AIRadarForwardCheck	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	otherrange = -2
;	CAPrange = 8
;	showinfo = 6
;	wingnum = 4
; Line 5311
	cmp	WORD PTR [bp+8],0	;CAPrange
	je	$I3239
; Line 5312
	mov	WORD PTR [bp-2],150	;otherrange
; Line 5313
	jmp	SHORT $I3240
$I3239:
; Line 5314
	mov	WORD PTR [bp-2],0	;otherrange
$I3240:
; Line 5316
	sub	ax,ax
	push	ax
	mov	ax,8192
	push	ax
	push	WORD PTR [bp-2]	;otherrange
	push	WORD PTR [bp+6]	;showinfo
	push	WORD PTR [bp+4]	;wingnum
	call	_AICoreRadarCheck
; Line 5317
	mov	sp,bp
	pop	bp
	ret	

_AIRadarForwardCheck	ENDP
; Line 5320
	PUBLIC	_AIRadarRearCheck
_AIRadarRearCheck	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	otherrange = -2
;	Bearrange = 8
;	showinfo = 6
;	wingnum = 4
; Line 5323
	cmp	WORD PTR [bp+8],0	;Bearrange
	je	$I3246
; Line 5324
	mov	WORD PTR [bp-2],40	;otherrange
; Line 5325
	jmp	SHORT $I3247
$I3246:
; Line 5326
	mov	WORD PTR [bp-2],0	;otherrange
$I3247:
; Line 5328
	mov	ax,20480
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-2]	;otherrange
	push	WORD PTR [bp+6]	;showinfo
	push	WORD PTR [bp+4]	;wingnum
	call	_AICoreRadarCheck
; Line 5329
	mov	sp,bp
	pop	bp
	ret	

_AIRadarRearCheck	ENDP
; Line 5332
	PUBLIC	_AICoreRadarCheck
_AICoreRadarCheck	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,58
	call	__aNchkstk
	push	si
;	rangle = -30
;	rrangle = -38
;	winghead = -20
;	cnt = -14
;	rangle1 = -34
;	rrangle1 = -46
;	tangle1 = -44
;	tdist = -24
;	tdist1 = -28
;	tdistnm = -8
;	tdistnm1 = -12
;	distkm = -42
;	degreetmp = -52
;	dangle = -36
;	wingptype = -18
;	tempradar = -4
;	radarrangekm = -56
;	returnval = -10
;	x = -26
;	y = -32
;	dx = -50
;	dy = -54
;	founddist = -6
;	targetnum = -22
;	tpitch = -48
;	tangle = -40
;	enemyalt = -58
;	greaterangle = 12
;	lessangle = 10
;	otherrange = 8
;	showinfo = 6
;	wingnum = 4
; Line 5344
	cmp	WORD PTR [bp+4],-1	;wingnum
	jne	$I3281
; Line 5345
	mov	ax,WORD PTR _Px
	mov	WORD PTR [bp-26],ax	;x
; Line 5346
	mov	ax,WORD PTR _Py
	mov	WORD PTR [bp-32],ax	;y
; Line 5347
	mov	ax,WORD PTR _OurHead
	mov	WORD PTR [bp-20],ax	;winghead
; Line 5348
	mov	WORD PTR [bp-56],150	;radarrangekm
; Line 5349
	jmp	SHORT $I3282
	nop	
$I3281:
; Line 5350
	mov	ax,40
	imul	WORD PTR [bp+4]	;wingnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-26],ax	;x
; Line 5351
	mov	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-32],ax	;y
; Line 5352
	mov	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-20],ax	;winghead
; Line 5356
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	WORD PTR [bp-18],bx	;wingptype
	mov	WORD PTR [bp-16],es
	push	WORD PTR es:[bx+14]
	call	_GetRadarPtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	WORD PTR [bp-4],bx	;tempradar
	mov	WORD PTR [bp-2],es
	mov	ax,WORD PTR es:[bx+12]
	mov	WORD PTR [bp-56],ax	;radarrangekm
; Line 5358
$I3282:
; Line 5359
	cmp	WORD PTR [bp+8],0	;otherrange
	je	$I3283
	mov	ax,WORD PTR [bp-56]	;radarrangekm
	cmp	WORD PTR [bp+8],ax	;otherrange
	jge	$I3283
; Line 5360
	mov	ax,WORD PTR [bp+8]	;otherrange
	mov	WORD PTR [bp-56],ax	;radarrangekm
; Line 5362
$I3283:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],1
	jne	$I3284
; Line 5363
	mov	WORD PTR [bp-56],10	;radarrangekm
; Line 5364
; Line 5366
$I3284:
	mov	WORD PTR [bp-6],0	;founddist
; Line 5367
	mov	WORD PTR [bp-22],-999	;targetnum
; Line 5368
	mov	WORD PTR [bp-24],0	;tdist
; Line 5370
	mov	ax,40
	imul	WORD PTR [bp+4]	;wingnum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],4
	je	$JCC32595
	jmp	$I3286
$JCC32595:
; Line 5372
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR [bp-32]	;y
	mov	WORD PTR [bp-54],ax	;dy
; Line 5373
	sub	cx,cx
	push	cx
	lea	dx,WORD PTR [bp-58]	;enemyalt
	push	dx
	lea	dx,WORD PTR [bp-8]	;tdistnm
	push	dx
	lea	dx,WORD PTR [bp-40]	;tangle
	push	dx
	lea	bx,WORD PTR [bp-48]	;tpitch
	push	bx
	lea	bx,WORD PTR [bp-28]	;tdist1
	push	bx
	push	ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR [bp-26]	;x
	mov	WORD PTR [bp-50],ax	;dx
	push	ax
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 5375
	mov	ax,WORD PTR [bp-40]	;tangle
	sub	ax,WORD PTR [bp-20]	;winghead
	mov	WORD PTR [bp-30],ax	;rangle
; Line 5376
	mov	cx,825
	sub	dx,dx
	push	dx
	push	cx
	mov	cx,WORD PTR [bp-28]	;tdist1
	shl	cx,1
	rcl	dx,1
	shl	cx,1
	rcl	dx,1
	shl	cx,1
	rcl	dx,1
	shl	cx,1
	rcl	dx,1
	shl	cx,1
	rcl	dx,1
	push	dx
	push	cx
	call	__aNldiv
	mov	WORD PTR [bp-42],ax	;distkm
	cmp	ax,WORD PTR [bp-56]	;radarrangekm
	jae	$I3286
	push	WORD PTR [bp-30]	;rangle
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR [bp+10]	;lessangle
	jl	$I3287
	cmp	WORD PTR [bp+10],0	;lessangle
	jne	$I3286
$I3287:
	push	WORD PTR [bp-30]	;rangle
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR [bp+12]	;greaterangle
	jg	$I3288
	cmp	WORD PTR [bp+12],0	;greaterangle
	jne	$I3286
$I3288:
; Line 5377
	mov	WORD PTR [bp-6],1	;founddist
; Line 5378
	mov	ax,WORD PTR [bp-28]	;tdist1
	mov	WORD PTR [bp-24],ax	;tdist
; Line 5379
	mov	WORD PTR [bp-22],-1	;targetnum
; Line 5380
	mov	ax,WORD PTR [bp-30]	;rangle
	mov	WORD PTR [bp-34],ax	;rangle1
; Line 5381
	mov	ax,WORD PTR [bp-38]	;rrangle
	mov	WORD PTR [bp-46],ax	;rrangle1
; Line 5382
	mov	ax,WORD PTR [bp-8]	;tdistnm
	mov	WORD PTR [bp-12],ax	;tdistnm1
; Line 5383
	mov	ax,WORD PTR [bp-40]	;tangle
	mov	WORD PTR [bp-44],ax	;tangle1
; Line 5384
; Line 5385
$I3286:
; Line 5388
	mov	WORD PTR [bp-14],0	;cnt
	jmp	$F3289
	nop	
$FC3290:
; Line 5390
	mov	ax,40
	imul	WORD PTR [bp-14]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	jne	$JCC32810
	jmp	$I3294
$JCC32810:
	test	cl,2
	jne	$JCC32818
	jmp	$I3294
$JCC32818:
	cmp	WORD PTR _ps[bx+26],0
	jne	$JCC32828
	jmp	$I3294
$JCC32828:
; Line 5391
	push	WORD PTR [bp-14]	;cnt
	push	WORD PTR $S1359_i
	mov	si,bx
	call	_FriendMatch
	add	sp,4
	or	ax,ax
	je	$JCC32850
	jmp	$I3294
$JCC32850:
; Line 5392
	mov	ax,WORD PTR _ps[si+2]
	sub	ax,WORD PTR [bp-26]	;x
	mov	WORD PTR [bp-50],ax	;dx
; Line 5393
	mov	cx,WORD PTR _ps[si+4]
	sub	cx,WORD PTR [bp-32]	;y
	mov	WORD PTR [bp-54],cx	;dy
; Line 5394
	sub	dx,dx
	push	dx
	lea	bx,WORD PTR [bp-58]	;enemyalt
	push	bx
	lea	bx,WORD PTR [bp-8]	;tdistnm
	push	bx
	lea	bx,WORD PTR [bp-40]	;tangle
	push	bx
	lea	si,WORD PTR [bp-48]	;tpitch
	push	si
	lea	si,WORD PTR [bp-28]	;tdist1
	push	si
	push	cx
	push	ax
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 5395
	mov	ax,825
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-28]	;tdist1
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
	call	__aNldiv
	mov	WORD PTR [bp-42],ax	;distkm
; Line 5396
	mov	cx,WORD PTR [bp-40]	;tangle
	sub	cx,WORD PTR [bp-20]	;winghead
	mov	WORD PTR [bp-30],cx	;rangle
; Line 5397
	mov	cx,WORD PTR [bp-24]	;tdist
	cmp	WORD PTR [bp-28],cx	;tdist1
	jb	$I3295
	cmp	ax,WORD PTR [bp-56]	;radarrangekm
	jae	$I3294
	cmp	WORD PTR [bp-6],0	;founddist
	jne	$I3294
$I3295:
	push	WORD PTR [bp-30]	;rangle
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR [bp+10]	;lessangle
	jl	$I3296
	cmp	WORD PTR [bp+10],0	;lessangle
	jne	$I3294
$I3296:
	push	WORD PTR [bp-30]	;rangle
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR [bp+12]	;greaterangle
	jg	$I3297
	cmp	WORD PTR [bp+12],0	;greaterangle
	jne	$I3294
$I3297:
; Line 5398
	mov	WORD PTR [bp-6],1	;founddist
; Line 5399
	mov	ax,WORD PTR [bp-28]	;tdist1
	mov	WORD PTR [bp-24],ax	;tdist
; Line 5400
	mov	ax,WORD PTR [bp-14]	;cnt
	mov	WORD PTR [bp-22],ax	;targetnum
; Line 5401
	mov	ax,WORD PTR [bp-30]	;rangle
	mov	WORD PTR [bp-34],ax	;rangle1
; Line 5402
	mov	ax,WORD PTR [bp-38]	;rrangle
	mov	WORD PTR [bp-46],ax	;rrangle1
; Line 5403
	mov	ax,WORD PTR [bp-8]	;tdistnm
	mov	WORD PTR [bp-12],ax	;tdistnm1
; Line 5404
	mov	ax,WORD PTR [bp-40]	;tangle
	mov	WORD PTR [bp-44],ax	;tangle1
; Line 5405
; Line 5406
$I3294:
; Line 5407
; Line 5408
	inc	WORD PTR [bp-14]	;cnt
$F3289:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-14],ax	;cnt
	jge	$JCC33067
	jmp	$FC3290
$JCC33067:
; Line 5409
	cmp	WORD PTR [bp-6],0	;founddist
	jne	$JCC33076
	jmp	$I3298
$JCC33076:
; Line 5411
	mov	ax,360
	push	ax
	mov	ax,WORD PTR [bp-44]	;tangle1
	mov	WORD PTR [bp-36],ax	;dangle
	shr	ax,1
	push	ax
	call	_TrgMul
	add	sp,4
	mov	WORD PTR [bp-52],ax	;degreetmp
; Line 5412
	mov	ax,46
	imul	WORD PTR [bp+4]	;wingnum
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],32
	jne	$I3299
; Line 5413
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR [bp-22]	;targetnum
	mov	WORD PTR _bv[bx+10],ax
; Line 5414
; Line 5416
$I3299:
	cmp	WORD PTR [bp+6],0	;showinfo
	je	$I3300
; Line 5417
	mov	ax,OFFSET DGROUP:$SG3301
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 5418
	mov	ax,10
	push	ax
	mov	cx,OFFSET DGROUP:_ntmp
	push	cx
	push	WORD PTR [bp-52]	;degreetmp
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 5419
	mov	ax,OFFSET DGROUP:$SG3302
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 5420
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	push	WORD PTR [bp-12]	;tdistnm1
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 5421
	mov	ax,4
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 5422
; Line 5423
$I3300:
	mov	ax,WORD PTR [bp-6]	;founddist
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I3298:
; Line 5426
	cmp	WORD PTR [bp+6],0	;showinfo
	je	$I3304
; Line 5427
	mov	ax,42
	push	ax
	call	_Speech
	add	sp,2
; Line 5428
	mov	ax,OFFSET DGROUP:$SG3305
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 5429
	mov	ax,4
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 5430
; Line 5431
$I3304:
; Line 5433
	sub	ax,ax
; Line 5434
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AICoreRadarCheck	ENDP
; Line 5438
	PUBLIC	_GiveSanitizeMessage
_GiveSanitizeMessage	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,50
	call	__aNchkstk
	push	di
	push	si
;	tdistnm = -6
;	tdistnm1 = -10
;	degreetmp = -44
;	groupcnt = -4
;	groupalt = -48
;	dangle = -30
;	returnval = -8
;	x = -20
;	y = -26
;	dx = -42
;	dy = -46
;	founddist = -2
;	targetnum = -16
;	tpitch = -40
;	tangle = -34
;	enemyalt = -50
;	rangle = -24
;	rrangle = -32
;	winghead = -14
;	cnt = -12
;	rangle1 = -28
;	rrangle1 = -38
;	tangle1 = -36
;	tdist = -18
;	tdist1 = -22
;	groupcheck = 6
;	wingnum = 4
; Line 5446
	cmp	WORD PTR [bp+4],-1	;wingnum
	jne	$I3334
; Line 5447
	mov	ax,WORD PTR _Px
	mov	WORD PTR [bp-20],ax	;x
; Line 5448
	mov	ax,WORD PTR _Py
	mov	WORD PTR [bp-26],ax	;y
; Line 5449
	mov	ax,WORD PTR _OurHead
	jmp	SHORT $L20161
$I3334:
; Line 5452
	mov	ax,40
	imul	WORD PTR [bp+4]	;wingnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-20],ax	;x
; Line 5453
	mov	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-26],ax	;y
; Line 5454
	mov	ax,WORD PTR _ps[bx+16]
$L20161:
	mov	WORD PTR [bp-14],ax	;winghead
; Line 5455
; Line 5458
	mov	WORD PTR [bp-16],-999	;targetnum
; Line 5459
	mov	WORD PTR [bp-18],0	;tdist
; Line 5462
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;founddist
	mov	WORD PTR [bp-4],ax	;groupcnt
	mov	WORD PTR [bp-12],ax	;cnt
	jmp	$F3336
	nop	
$FC3337:
; Line 5463
	mov	bx,ax
	shl	bx,1
	mov	si,WORD PTR [bp+6]	;groupcheck
	cmp	WORD PTR [bx][si],0
	jne	$JCC33396
	jmp	$I3342
$JCC33396:
; Line 5464
	inc	WORD PTR [bp-4]	;groupcnt
; Line 5465
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR [bp-20]	;x
	mov	WORD PTR [bp-42],ax	;dx
; Line 5466
	mov	cx,WORD PTR _ps[bx+4]
	sub	cx,WORD PTR [bp-26]	;y
	mov	WORD PTR [bp-46],cx	;dy
; Line 5467
	sub	dx,dx
	push	dx
	lea	bx,WORD PTR [bp-50]	;enemyalt
	push	bx
	lea	bx,WORD PTR [bp-6]	;tdistnm
	push	bx
	lea	si,WORD PTR [bp-34]	;tangle
	push	si
	lea	di,WORD PTR [bp-40]	;tpitch
	push	di
	lea	di,WORD PTR [bp-22]	;tdist1
	push	di
	push	cx
	push	ax
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 5468
	mov	ax,WORD PTR [bp-34]	;tangle
	sub	ax,WORD PTR [bp-14]	;winghead
	mov	WORD PTR [bp-24],ax	;rangle
; Line 5469
	mov	ax,WORD PTR [bp-18]	;tdist
	cmp	WORD PTR [bp-22],ax	;tdist1
	jb	$I3341
	cmp	WORD PTR [bp-6],80	;tdistnm
	jae	$I3342
	cmp	WORD PTR [bp-2],0	;founddist
	jne	$I3342
$I3341:
	push	WORD PTR [bp-24]	;rangle
	call	_abs
	add	sp,2
	cmp	ax,8192
	jge	$I3342
; Line 5470
	mov	WORD PTR [bp-2],1	;founddist
; Line 5471
	mov	ax,WORD PTR [bp-22]	;tdist1
	mov	WORD PTR [bp-18],ax	;tdist
; Line 5472
	mov	ax,WORD PTR [bp-12]	;cnt
	mov	WORD PTR [bp-16],ax	;targetnum
; Line 5473
	mov	cx,WORD PTR [bp-24]	;rangle
	mov	WORD PTR [bp-28],cx	;rangle1
; Line 5474
	mov	cx,WORD PTR [bp-32]	;rrangle
	mov	WORD PTR [bp-38],cx	;rrangle1
; Line 5475
	mov	cx,WORD PTR [bp-6]	;tdistnm
	mov	WORD PTR [bp-10],cx	;tdistnm1
; Line 5476
	mov	cx,WORD PTR [bp-34]	;tangle
	mov	WORD PTR [bp-36],cx	;tangle1
; Line 5477
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	shl	ax,1
	shl	ax,1
	mov	cx,1000
	cwd	
	idiv	cx
	mov	WORD PTR [bp-48],ax	;groupalt
; Line 5478
	cmp	ax,1
	jge	$I3342
; Line 5479
	mov	WORD PTR [bp-48],1	;groupalt
; Line 5480
$I3342:
; Line 5481
; Line 5482
	inc	WORD PTR [bp-12]	;cnt
$F3336:
	mov	ax,WORD PTR [bp-12]	;cnt
	cmp	WORD PTR _NPLANES,ax
	jle	$JCC33594
	jmp	$FC3337
$JCC33594:
; Line 5483
	cmp	WORD PTR [bp-2],0	;founddist
	jne	$JCC33603
	jmp	$I3343
$JCC33603:
; Line 5485
	mov	ax,360
	push	ax
	mov	ax,WORD PTR [bp-36]	;tangle1
	mov	WORD PTR [bp-30],ax	;dangle
	shr	ax,1
	push	ax
	call	_TrgMul
	add	sp,4
	mov	WORD PTR [bp-44],ax	;degreetmp
; Line 5486
	mov	ax,46
	imul	WORD PTR [bp+4]	;wingnum
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],32
	jne	$I3344
; Line 5487
	mov	ax,WORD PTR [bp-16]	;targetnum
	mov	WORD PTR _bv[bx+10],ax
; Line 5488
; Line 5490
$I3344:
	mov	ax,18
	push	ax
	call	_Speech
	add	sp,2
; Line 5491
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-4]	;groupcnt
	call	_NSpeech
	add	sp,4
; Line 5493
	mov	ax,10
	push	ax
	call	_Speech
	add	sp,2
; Line 5494
	cmp	WORD PTR [bp-10],160	;tdistnm1
	jb	$I3346
; Line 5495
	mov	ax,OFFSET DGROUP:$SG3347
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 5496
	mov	ax,40
$L20166:
	push	ax
	call	_Speech
	add	sp,2
; Line 5497
	jmp	SHORT $I3357
	nop	
$I3346:
	cmp	WORD PTR [bp-10],120	;tdistnm1
	jb	$I3349
; Line 5498
	mov	ax,OFFSET DGROUP:$SG3350
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 5499
	mov	ax,39
	jmp	SHORT $L20166
	nop	
$I3349:
	cmp	WORD PTR [bp-10],80	;tdistnm1
	jb	$I3352
; Line 5501
	mov	ax,OFFSET DGROUP:$SG3353
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 5502
	mov	ax,38
	jmp	SHORT $L20166
	nop	
$I3352:
	cmp	WORD PTR [bp-10],40	;tdistnm1
	jb	$I3355
; Line 5504
	mov	ax,OFFSET DGROUP:$SG3356
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 5505
	mov	ax,37
	jmp	SHORT $L20166
	nop	
$I3355:
; Line 5507
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-10]	;tdistnm1
	call	_NSpeech
	add	sp,4
; Line 5508
$I3357:
; Line 5509
	mov	ax,17
	push	ax
	call	_Speech
	add	sp,2
; Line 5510
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-48]	;groupalt
	call	_NSpeech
	add	sp,4
; Line 5512
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR [bp+4]	;wingnum
	call	_GetWingName
	add	sp,4
; Line 5513
	cmp	WORD PTR [bp-4],1	;groupcnt
	jle	$I3358
; Line 5514
	mov	ax,OFFSET DGROUP:$SG3359
	jmp	SHORT $L20163
$I3358:
; Line 5516
	mov	ax,OFFSET DGROUP:$SG3361
$L20163:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 5517
	mov	ax,10
	push	ax
	mov	cx,OFFSET DGROUP:_ntmp
	push	cx
	push	WORD PTR [bp-4]	;groupcnt
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 5518
	mov	ax,OFFSET DGROUP:$SG3362
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 5521
	mov	ax,10
	push	ax
	mov	cx,OFFSET DGROUP:_ntmp
	push	cx
	push	WORD PTR [bp-10]	;tdistnm1
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 5522
	mov	ax,OFFSET DGROUP:$SG3363
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 5523
	cmp	WORD PTR [bp-48],0	;groupalt
	je	$I3364
; Line 5524
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	push	WORD PTR [bp-48]	;groupalt
	call	_itoa
	add	sp,6
	jmp	SHORT $L20167
	nop	
$I3364:
; Line 5527
	mov	ax,OFFSET DGROUP:$SG3366
	jmp	SHORT $L20167
	nop	
$I3343:
; Line 5532
	mov	ax,42
	push	ax
	call	_Speech
	add	sp,2
; Line 5533
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR [bp+4]	;wingnum
	call	_GetWingName
	add	sp,4
; Line 5534
	mov	ax,OFFSET DGROUP:$SG3368
$L20167:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 5535
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 5536
; Line 5537
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GiveSanitizeMessage	ENDP
; Line 5540
	PUBLIC	_AISanitizeGroupCheck
_AISanitizeGroupCheck	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,186
	call	__aNchkstk
	push	si
;	tdistnm1 = -8
;	degreetmp = -182
;	cnt2 = -12
;	dangle = -168
;	groupcheck = -166
;	returnval = -6
;	x = -18
;	y = -24
;	dx = -180
;	dy = -184
;	founddist = -2
;	targetnum = -14
;	tpitch = -178
;	tangle = -172
;	enemyalt = -186
;	rangle = -22
;	rrangle = -170
;	cnt = -10
;	rangle1 = -26
;	rrangle1 = -176
;	tangle1 = -174
;	tdist = -16
;	tdist1 = -20
;	tdistnm = -4
;	planecheck = 8
;	enemynum = 6
;	wingnum = 4
; Line 5549
	mov	WORD PTR [bp-10],0	;cnt
$FC3398:
; Line 5550
	mov	si,WORD PTR [bp-10]	;cnt
	shl	si,1
	mov	WORD PTR [bp-166][si],0
	inc	WORD PTR [bp-10]	;cnt
	cmp	WORD PTR [bp-10],70	;cnt
	jl	$FC3398
; Line 5554
	mov	ax,1
	mov	si,WORD PTR [bp+6]	;enemynum
	shl	si,1
	mov	WORD PTR [bp-166][si],ax
	mov	WORD PTR [bp-2],ax	;founddist
; Line 5555
	mov	WORD PTR [bp-14],-999	;targetnum
; Line 5557
	jmp	$L20171
$FC3401:
; Line 5559
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;founddist
	mov	WORD PTR [bp-12],ax	;cnt2
	jmp	$F3403
	nop	
$I3407:
; Line 5566
	mov	ax,40
	imul	WORD PTR [bp-12]	;cnt2
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-18],ax	;x
; Line 5567
	mov	ax,WORD PTR _ps[bx+4]
$L20169:
	mov	WORD PTR [bp-24],ax	;y
; Line 5568
; Line 5570
	mov	WORD PTR [bp-10],0	;cnt
	jmp	SHORT $F3409
	nop	
$FC3410:
; Line 5572
	mov	ax,40
	imul	WORD PTR [bp-10]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I3413
	test	cl,2
	je	$I3413
	cmp	WORD PTR _ps[bx+26],0
	je	$I3413
	mov	si,WORD PTR [bp-10]	;cnt
	shl	si,1
	cmp	WORD PTR [bp-166][si],0
	jne	$I3413
; Line 5573
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR [bp-18]	;x
	mov	WORD PTR [bp-180],ax	;dx
; Line 5574
	mov	cx,WORD PTR _ps[bx+4]
	sub	cx,WORD PTR [bp-24]	;y
	mov	WORD PTR [bp-184],cx	;dy
; Line 5575
	sub	dx,dx
	push	dx
	lea	dx,WORD PTR [bp-186]	;enemyalt
	push	dx
	lea	dx,WORD PTR [bp-4]	;tdistnm
	push	dx
	lea	bx,WORD PTR [bp-172]	;tangle
	push	bx
	lea	bx,WORD PTR [bp-178]	;tpitch
	push	bx
	lea	bx,WORD PTR [bp-20]	;tdist1
	push	bx
	push	cx
	push	ax
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 5576
	cmp	WORD PTR [bp-4],10	;tdistnm
	jae	$I3413
; Line 5579
	mov	ax,1
	mov	WORD PTR [bp-166][si],ax
	mov	bx,WORD PTR [bp+8]	;planecheck
	mov	WORD PTR [bx][si],ax
	mov	WORD PTR [bp-2],ax	;founddist
; Line 5580
; Line 5581
$I3413:
; Line 5582
	inc	WORD PTR [bp-10]	;cnt
$F3409:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-10],ax	;cnt
	jge	$JCC34274
	jmp	$FC3410
$JCC34274:
; Line 5583
; Line 5584
$FC3404:
	inc	WORD PTR [bp-12]	;cnt2
$F3403:
	mov	ax,WORD PTR [bp-12]	;cnt2
	cmp	WORD PTR _NPLANES,ax
	jle	$L20171
; Line 5560
	mov	si,ax
	shl	si,1
	cmp	WORD PTR [bp-166][si],0
	je	$FC3404
; Line 5561
	inc	ax
	je	$JCC34303
	jmp	$I3407
$JCC34303:
; Line 5562
	mov	ax,WORD PTR _Px
	mov	WORD PTR [bp-18],ax	;x
; Line 5563
	mov	ax,WORD PTR _Py
	jmp	$L20169
; Line 5585
$L20171:
	cmp	WORD PTR [bp-2],0	;founddist
	je	$JCC34324
	jmp	$FC3401
$JCC34324:
; Line 5586
	lea	ax,WORD PTR [bp-166]	;groupcheck
	push	ax
	push	WORD PTR [bp+4]	;wingnum
	call	_GiveSanitizeMessage
	add	sp,4
; Line 5587
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_AISanitizeGroupCheck	ENDP
; Line 5590
	PUBLIC	_AISanitizeCheck
_AISanitizeCheck	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,186
	call	__aNchkstk
	push	di
	push	si
;	returnval = -6
;	x = -18
;	y = -24
;	dx = -40
;	dy = -44
;	founddist = -2
;	targetnum = -14
;	tpitch = -38
;	tangle = -32
;	enemyalt = -186
;	rangle = -22
;	rrangle = -30
;	winghead = -12
;	cnt = -10
;	rangle1 = -26
;	rrangle1 = -36
;	tangle1 = -34
;	tdist = -16
;	tdist1 = -20
;	tdistnm = -4
;	tdistnm1 = -8
;	degreetmp = -42
;	dangle = -28
;	planecheck = -184
;	wingnum = 4
; Line 5599
	mov	WORD PTR [bp-10],0	;cnt
$FC3441:
; Line 5600
	mov	si,WORD PTR [bp-10]	;cnt
	shl	si,1
	mov	WORD PTR [bp-184][si],0
	inc	WORD PTR [bp-10]	;cnt
	cmp	WORD PTR [bp-10],70	;cnt
	jl	$FC3441
; Line 5602
	cmp	WORD PTR [bp+4],-1	;wingnum
	jne	$I3443
; Line 5603
	mov	ax,WORD PTR _Px
	mov	WORD PTR [bp-18],ax	;x
; Line 5604
	mov	ax,WORD PTR _Py
	mov	WORD PTR [bp-24],ax	;y
; Line 5605
	mov	ax,WORD PTR _OurHead
	jmp	SHORT $L20173
	nop	
$I3443:
; Line 5608
	mov	ax,40
	imul	WORD PTR [bp+4]	;wingnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-18],ax	;x
; Line 5609
	mov	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-24],ax	;y
; Line 5610
	mov	ax,WORD PTR _ps[bx+16]
$L20173:
	mov	WORD PTR [bp-12],ax	;winghead
; Line 5611
; Line 5614
	mov	WORD PTR [bp-14],-999	;targetnum
; Line 5616
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;founddist
	mov	WORD PTR [bp-10],ax	;cnt
	jmp	$F3445
	nop	
$FC3446:
; Line 5618
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	jne	$JCC34469
	jmp	$I3450
$JCC34469:
	test	cl,2
	jne	$JCC34477
	jmp	$I3450
$JCC34477:
	cmp	WORD PTR _ps[bx+26],0
	jne	$JCC34487
	jmp	$I3450
$JCC34487:
	mov	si,WORD PTR [bp-10]	;cnt
	shl	si,1
	cmp	WORD PTR [bp-184][si],0
	je	$JCC34502
	jmp	$I3450
$JCC34502:
; Line 5619
	push	WORD PTR [bp-10]	;cnt
	push	WORD PTR [bp+4]	;wingnum
	mov	di,bx
	call	_FriendMatch
	add	sp,4
	or	ax,ax
	jne	$I3450
; Line 5620
	mov	ax,WORD PTR _ps[di+2]
	sub	ax,WORD PTR [bp-18]	;x
	mov	WORD PTR [bp-40],ax	;dx
; Line 5621
	mov	cx,WORD PTR _ps[di+4]
	sub	cx,WORD PTR [bp-24]	;y
	mov	WORD PTR [bp-44],cx	;dy
; Line 5622
	sub	dx,dx
	push	dx
	lea	dx,WORD PTR [bp-186]	;enemyalt
	push	dx
	lea	dx,WORD PTR [bp-4]	;tdistnm
	push	dx
	lea	bx,WORD PTR [bp-32]	;tangle
	push	bx
	lea	di,WORD PTR [bp-38]	;tpitch
	push	di
	lea	di,WORD PTR [bp-20]	;tdist1
	push	di
	push	cx
	push	ax
	push	WORD PTR $S1359_i
	call	_GetTargADP
	add	sp,18
; Line 5623
	mov	ax,WORD PTR [bp-32]	;tangle
	sub	ax,WORD PTR [bp-12]	;winghead
	mov	WORD PTR [bp-22],ax	;rangle
; Line 5624
	cmp	WORD PTR [bp-4],80	;tdistnm
	jae	$I3450
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,8192
	jge	$I3450
; Line 5625
	mov	WORD PTR [bp-184][si],1
; Line 5626
	lea	ax,WORD PTR [bp-184]	;planecheck
	push	ax
	push	WORD PTR [bp-10]	;cnt
	push	WORD PTR [bp+4]	;wingnum
	call	_AISanitizeGroupCheck
	add	sp,6
; Line 5627
	mov	WORD PTR [bp-2],1	;founddist
; Line 5628
; Line 5629
$I3450:
; Line 5630
; Line 5631
	inc	WORD PTR [bp-10]	;cnt
$F3445:
	mov	ax,WORD PTR [bp-10]	;cnt
	cmp	WORD PTR _NPLANES,ax
	jle	$JCC34646
	jmp	$FC3446
$JCC34646:
; Line 5632
	cmp	WORD PTR [bp-2],0	;founddist
	jne	$I3451
; Line 5633
	mov	ax,42
	push	ax
	call	_Speech
	add	sp,2
; Line 5634
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR $S1359_i
	call	_GetWingName
	add	sp,4
; Line 5635
	mov	ax,OFFSET DGROUP:$SG3452
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 5636
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 5637
; Line 5638
$I3451:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AISanitizeCheck	ENDP
; Line 5641
	PUBLIC	_FlySanitize
_FlySanitize	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,82
	call	__aNchkstk
	push	si
;	relangle = -82
;	Str = -80
; Line 5645
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	call	_GetDAltSpeed
	add	sp,2
	add	ax,WORD PTR _Knots
	cmp	ax,300
	jle	$I3456
; Line 5646
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	call	_GetDAltSpeed
	add	sp,2
	add	ax,WORD PTR _Knots
	sub	ax,100
	jmp	SHORT $L20175
$I3456:
; Line 5648
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	call	_GetDAltSpeed
	add	sp,2
	add	ax,200
$L20175:
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],cx
; Line 5650
	mov	WORD PTR _pdest,0
; Line 5651
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	si,ax
	mov	ax,WORD PTR _bv[si+16]
	sub	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-82],ax	;relangle
; Line 5652
	push	ax
	push	WORD PTR $S1359_i
	call	_TurnAIPlaneBy
	add	sp,4
; Line 5654
	push	WORD PTR [bp-82]	;relangle
	call	_abs
	add	sp,2
	cmp	ax,1280
	jl	$JCC34877
	jmp	$I3462
$JCC34877:
	cmp	WORD PTR _droll,1280
	jge	$L20029
	mov	ax,1
	jmp	SHORT $L20030
	nop	
	nop	
	nop	
$L20029:
	sub	ax,ax
$L20030:
	push	ax
	call	_abs
	add	sp,2
	or	ax,ax
	je	$I3462
; Line 5655
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+24],0
	jne	$I3459
; Line 5656
	mov	ax,5
	sub	ax,WORD PTR _bv[bx+42]
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	add	ax,WORD PTR _Gtime
	mov	WORD PTR _bv[bx+24],ax
; Line 5657
; Line 5658
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I3459:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _bv[bx+24],ax
	jge	$I3462
; Line 5659
	push	WORD PTR $S1359_i
	call	_AISanitizeCheck
	add	sp,2
; Line 5660
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Formation
; Line 5661
	test	BYTE PTR _bv[bx+21],2
	je	$I3462
; Line 5662
	and	BYTE PTR _bv[bx+21],254
; Line 5663
$I3462:
; Line 5664
; Line 5665
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_FlySanitize	ENDP
; Line 5668
	PUBLIC	_AIFoxCall
_AIFoxCall	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	weapon = 4
; Line 5669
	mov	ax,WORD PTR [bp+4]	;weapon
	jmp	SHORT $S3465
; Line 5670
	nop	
$SC3469:
; Line 5671
	mov	ax,OFFSET DGROUP:$SG3470
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	mov	sp,bp
	mov	ax,19
$L20176:
	push	ax
	call	_Speech
	mov	sp,bp
	jmp	SHORT $SB3466
; Line 5672
$SC3471:
; Line 5673
	mov	ax,OFFSET DGROUP:$SG3472
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	mov	sp,bp
	mov	ax,20
	jmp	SHORT $L20176
; Line 5674
$SC3473:
; Line 5675
	mov	ax,OFFSET DGROUP:$SG3474
$L20177:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	mov	sp,bp
	mov	ax,21
	jmp	SHORT $L20176
; Line 5676
$SC3475:
; Line 5677
	mov	ax,OFFSET DGROUP:$SG3476
	jmp	SHORT $L20177
	nop	
$S3465:
	sub	ax,46
	je	$SC3469
	dec	ax
	je	$SC3471
	dec	ax
	je	$SC3475
	dec	ax
	je	$SC3473
$SB3466:
; Line 5679
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
; Line 5680
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AIFoxCall	ENDP
; Line 5683
	PUBLIC	_GetWingName
_GetWingName	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	Str = 6
;	ainum = 4
; Line 5684
	mov	ax,OFFSET DGROUP:_OurWingName
	push	ax
	push	WORD PTR [bp+6]	;Str
	call	_strcpy
	mov	sp,bp
; Line 5686
	mov	ax,WORD PTR [bp+4]	;ainum
	cmp	WORD PTR _WingID,ax
	je	$I3484
; Line 5688
; Line 5689
	cmp	WORD PTR _WingID+2,ax
	jne	$I3481
; Line 5690
	mov	ax,OFFSET DGROUP:$SG3482
	push	ax
	push	WORD PTR [bp+6]	;Str
	call	_strcpy
	mov	sp,bp
; Line 5691
; Line 5692
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I3481:
	cmp	WORD PTR _WingID+4,ax
	jne	$I3484
; Line 5693
	mov	ax,OFFSET DGROUP:$SG3485
	push	ax
	push	WORD PTR [bp+6]	;Str
	call	_strcpy
; Line 5694
; Line 5695
$I3484:
	mov	sp,bp
	pop	bp
	ret	

_GetWingName	ENDP
; Line 5698
	PUBLIC	_ChangeGroupBehavior
_ChangeGroupBehavior	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
	push	di
	push	si
;	prewing = -10
;	wingcnt = -8
;	radaron = -6
;	enemynofire = -2
;	combatspread = -4
;	pitchup = -12
;	matchenemyfire = 6
;	ainum = 4
; Line 5704
	sub	ax,ax
	mov	WORD PTR [bp-6],ax	;radaron
	mov	WORD PTR [bp-2],ax	;enemynofire
	mov	WORD PTR [bp-4],ax	;combatspread
	mov	WORD PTR [bp-12],ax	;pitchup
; Line 5706
	push	WORD PTR [bp+4]	;ainum
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-10],ax	;prewing
; Line 5707
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],1
	je	$I3495
; Line 5708
	mov	WORD PTR [bp-6],1	;radaron
; Line 5709
$I3495:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	je	$I3496
; Line 5710
	mov	WORD PTR [bp-2],1	;enemynofire
; Line 5711
$I3496:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],64
	je	$I3497
; Line 5712
	mov	WORD PTR [bp-4],1	;combatspread
; Line 5713
$I3497:
	mov	ax,40
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],32
	je	$I3498
; Line 5714
	mov	WORD PTR [bp-12],1	;pitchup
; Line 5716
$I3498:
	mov	ax,WORD PTR [bp-10]	;prewing
	jmp	$L20180
	nop	
$FC3503:
; Line 5719
	cmp	WORD PTR [bp+6],0	;matchenemyfire
	je	$I3506
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,46
	imul	WORD PTR [bp-8]	;wingcnt
	mov	si,ax
	mov	al,BYTE PTR _bv[si+21]
	xor	al,BYTE PTR _bv[bx+21]
	test	al,2
	je	$JCC35354
	jmp	$I3514
$JCC35354:
$I3506:
; Line 5720
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp-8]	;wingcnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],cx
; Line 5722
	cmp	WORD PTR [bp-6],0	;radaron
	je	$I3507
; Line 5723
	or	BYTE PTR _bv[bx+21],1
; Line 5724
	jmp	SHORT $I3508
$I3507:
; Line 5725
	mov	ax,46
	imul	WORD PTR [bp-8]	;wingcnt
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],254
$I3508:
; Line 5726
	cmp	WORD PTR [bp-2],0	;enemynofire
	je	$I3509
; Line 5727
	mov	ax,46
	imul	WORD PTR [bp-8]	;wingcnt
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],2
; Line 5728
	jmp	SHORT $I3510
$I3509:
; Line 5729
	mov	ax,46
	imul	WORD PTR [bp-8]	;wingcnt
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],253
$I3510:
; Line 5730
	cmp	WORD PTR [bp-4],0	;combatspread
	je	$I3511
; Line 5731
	mov	ax,46
	imul	WORD PTR [bp-8]	;wingcnt
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],64
; Line 5732
	jmp	SHORT $I3512
$I3511:
; Line 5733
	mov	ax,46
	imul	WORD PTR [bp-8]	;wingcnt
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],191
$I3512:
; Line 5735
	cmp	WORD PTR [bp-12],0	;pitchup
	je	$I3513
; Line 5736
	mov	ax,40
	imul	WORD PTR [bp-8]	;wingcnt
	mov	bx,ax
	or	BYTE PTR _ps[bx+25],32
; Line 5738
$I3513:
	mov	ax,46
	imul	WORD PTR [bp+4]	;ainum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+28]
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp-8]	;wingcnt
	mov	si,ax
	mov	WORD PTR _bv[si+28],cx
; Line 5739
	mov	ax,40
	imul	WORD PTR [bp-8]	;wingcnt
	mov	di,ax
	test	BYTE PTR _ps[di+25],128
	jne	$I3514
; Line 5740
	mov	ax,WORD PTR _bv[bx+14]
	mov	WORD PTR _bv[si+14],ax
; Line 5741
$I3514:
; Line 5743
	mov	ax,46
	imul	WORD PTR [bp-8]	;wingcnt
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+4]
	mov	WORD PTR [bp-8],ax	;wingcnt
; Line 5744
$L20178:
	cmp	WORD PTR [bp-8],0	;wingcnt
	jl	$JCC35566
	jmp	$FC3503
$JCC35566:
; Line 5746
	mov	ax,46
	imul	WORD PTR [bp-10]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+8]
	mov	WORD PTR [bp-10],ax	;prewing
$L20180:
	mov	WORD PTR [bp-8],ax	;wingcnt
; Line 5747
	or	ax,ax
	jge	$L20178
; Line 5748
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ChangeGroupBehavior	ENDP
; Line 5751
	PUBLIC	_AddSomePlanes2
_AddSomePlanes2	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,26
	call	__aNchkstk
	push	si
;	cnt = -12
;	numwingmen = -10
;	wingspace = -4
;	lastplane = -8
;	lastsec = -26
;	returnval = -6
;	startval = -2
;	endval = -20
;	imaboat = -24
;	incval = -22
;	notdone = -18
;	tempplane = -16
;	howgood = 36
;	speedval = 34
;	path = 32
;	headval = 30
;	altval = 28
;	yval = 24
;	xval = 20
;	whattype = 18
;	isfriend = 16
;	numwingadd = 14
;	numadd = 12
;	formnum = 10
;	AIBehavior = 8
;	planeid = 6
;	planenum = 4
; Line 5757
	mov	WORD PTR [bp-6],-999	;returnval
; Line 5761
	mov	WORD PTR [bp-18],1	;notdone
; Line 5764
	mov	WORD PTR [bp-10],0	;numwingmen
; Line 5767
	push	WORD PTR [bp+6]	;planeid
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-16],ax	;tempplane
	mov	WORD PTR [bp-14],dx
; Line 5769
	push	WORD PTR [bp+6]	;planeid
	call	_IsBoat
	add	sp,2
	or	ax,ax
	je	$I3543
; Line 5770
	mov	WORD PTR [bp-2],69	;startval
; Line 5771
	mov	ax,WORD PTR _NPLANES
	mov	WORD PTR [bp-20],ax	;endval
; Line 5772
	mov	WORD PTR [bp-24],1	;imaboat
; Line 5773
	mov	WORD PTR [bp-22],-1	;incval
; Line 5774
; Line 5775
	jmp	SHORT $I3544
$I3543:
; Line 5777
	mov	ax,WORD PTR _LASTPLANE
	mov	WORD PTR [bp-20],ax	;endval
; Line 5778
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;startval
	mov	WORD PTR [bp-24],ax	;imaboat
; Line 5779
	mov	WORD PTR [bp-22],1	;incval
; Line 5780
$I3544:
; Line 5782
	mov	ax,WORD PTR [bp-2]	;startval
	mov	WORD PTR [bp-12],ax	;cnt
	jmp	$F3545
$I3548:
; Line 5789
	mov	ax,WORD PTR [bp-12]	;cnt
	cmp	WORD PTR [bp-20],ax	;endval
	jg	$I3551
; Line 5790
$L20181:
	mov	WORD PTR [bp-18],0	;notdone
; Line 5791
; Line 5792
$I3551:
; Line 5794
	cmp	WORD PTR [bp-18],0	;notdone
	jne	$JCC35721
	jmp	$FC3546
$JCC35721:
	mov	ax,40
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,2
	je	$I3553
	test	cl,1
	je	$JCC35747
	jmp	$FC3546
$JCC35747:
$I3553:
; Line 5795
	mov	ax,40
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	mov	WORD PTR _ps[bx+24],3
; Line 5796
	les	si,DWORD PTR [bp-16]	;tempplane
	cmp	WORD PTR es:[si+38],50
	jne	$I3554
; Line 5797
	mov	WORD PTR _ps[bx+24],2051
; Line 5798
$I3554:
	mov	ax,WORD PTR [bp-12]	;cnt
	cmp	WORD PTR _NPLANES,ax
	jg	$I3555
	cmp	WORD PTR [bp-24],0	;imaboat
	jne	$I3555
; Line 5799
	inc	ax
	mov	WORD PTR _NPLANES,ax
; Line 5800
$I3555:
	mov	ax,WORD PTR _LASTPLANE
	cmp	WORD PTR [bp-12],ax	;cnt
	jg	$I3556
	cmp	WORD PTR [bp-24],0	;imaboat
	je	$I3556
; Line 5801
	mov	ax,WORD PTR [bp-12]	;cnt
	mov	WORD PTR _LASTPLANE,ax
; Line 5803
$I3556:
	cmp	WORD PTR [bp+16],0	;isfriend
	jne	$I3557
; Line 5804
	mov	ax,40
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	or	BYTE PTR _ps[bx+25],4
; Line 5805
	and	BYTE PTR _ps[bx+25],254
; Line 5806
; Line 5807
	jmp	SHORT $I3559
	nop	
$I3557:
	cmp	WORD PTR [bp+16],1	;isfriend
	jne	$I3559
; Line 5808
	mov	ax,40
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	or	BYTE PTR _ps[bx+25],1
; Line 5809
	and	BYTE PTR _ps[bx+25],251
; Line 5810
; Line 5812
$I3559:
	push	WORD PTR [bp+6]	;planeid
	push	WORD PTR _ms+4
	push	WORD PTR [bp-12]	;cnt
	call	_ActivatePlane
	add	sp,6
; Line 5813
	cmp	WORD PTR [bp+18],10	;whattype
	jne	$I3560
; Line 5815
	mov	ax,40
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	sub	ax,ax
	mov	WORD PTR _ps[bx+34],ax
	mov	WORD PTR _ps[bx+36],ax
; Line 5816
; Line 5818
$I3560:
	les	bx,DWORD PTR [bp-16]	;tempplane
	cmp	WORD PTR es:[bx+38],40
	jne	$I3561
; Line 5819
	mov	ax,46
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],128
; Line 5820
; Line 5822
$I3561:
	cmp	WORD PTR [bp+28],6	;altval
	jle	$I3562
; Line 5823
	mov	ax,40
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR [bp+28]	;altval
	mov	WORD PTR _ps[bx+6],ax
; Line 5824
	jmp	SHORT $I3563
$I3562:
; Line 5825
	mov	WORD PTR [bp+28],6	;altval
$I3563:
; Line 5827
	mov	ax,40
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR [bp+30]	;headval
	mov	WORD PTR _ps[bx+16],ax
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp-12]	;cnt
	mov	si,ax
	mov	WORD PTR _bv[si+38],cx
; Line 5828
	cmp	WORD PTR [bp+34],0	;speedval
	jle	$I3564
; Line 5829
	mov	ax,WORD PTR [bp+34]	;speedval
	mov	WORD PTR _ps[bx+26],ax
; Line 5830
	mov	WORD PTR _bv[si+18],ax
; Line 5831
; Line 5832
	jmp	SHORT $I3565
	nop	
$I3564:
; Line 5834
	mov	ax,40
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	sub	ax,ax
	mov	WORD PTR _ps[bx+26],ax
	mov	cx,ax
	mov	ax,46
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],cx
; Line 5835
$I3565:
; Line 5837
	cmp	WORD PTR [bp+18],1	;whattype
	jne	$I3566
; Line 5838
	cmp	WORD PTR [bp-10],3	;numwingmen
	jge	$I3567
; Line 5839
	mov	ax,WORD PTR [bp-12]	;cnt
	mov	bx,WORD PTR [bp-10]	;numwingmen
	shl	bx,1
	mov	WORD PTR _WingID[bx],ax
; Line 5840
$I3567:
; Line 5841
	mov	ax,WORD PTR [bp-12]	;cnt
	mov	WORD PTR _AIWingMan,ax
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	WORD PTR _bv[bx+2],-1
; Line 5842
	mov	ax,WORD PTR [bp-10]	;numwingmen
	inc	ax
	inc	ax
	add	WORD PTR _bv[bx+20],ax
; Line 5843
	mov	ax,40
	imul	WORD PTR _AIWingMan
	mov	bx,ax
	cmp	WORD PTR _ps[bx+6],25
	jge	$I3568
; Line 5844
	mov	WORD PTR _ps[bx+6],25
; Line 5845
; Line 5846
$I3568:
	mov	ax,cx
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+18],200
	jge	$I3570
; Line 5848
	mov	ax,40
	imul	WORD PTR [bp-12]	;cnt
	mov	si,ax
	mov	ax,200
	mov	WORD PTR _bv[bx+18],ax
	mov	WORD PTR _ps[si+26],ax
; Line 5849
; Line 5850
; Line 5851
	jmp	SHORT $I3570
$I3566:
; Line 5852
	mov	ax,46
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-10]	;numwingmen
	inc	ax
	add	WORD PTR _bv[bx+20],ax
$I3570:
; Line 5854
	cmp	WORD PTR [bp+28],0	;altval
	je	$I3571
; Line 5855
	mov	ax,40
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	and	BYTE PTR _ps[bx+25],127
; Line 5857
$I3571:
	push	WORD PTR [bp+10]	;formnum
	push	WORD PTR [bp+8]	;AIBehavior
	push	WORD PTR [bp-12]	;cnt
	call	_TranslateBehavior
	add	sp,6
; Line 5858
	cmp	WORD PTR [bp+16],1	;isfriend
	jne	$I3572
; Line 5859
	mov	ax,46
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	or	BYTE PTR _bv[bx+21],2
; Line 5860
$I3572:
	mov	ax,46
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	mov	al,BYTE PTR [bp+32]	;path
	mov	BYTE PTR _bv[bx+12],al
; Line 5861
	cmp	WORD PTR [bp+32],-1	;path
	je	$I3573
; Line 5862
	mov	cl,3
	mov	si,WORD PTR [bp+32]	;path
	shl	si,cl
	mov	ax,WORD PTR _aipaths[si+4]
	mov	WORD PTR _bv[bx+14],ax
; Line 5863
; Line 5864
	jmp	SHORT $I3574
	nop	
$I3573:
; Line 5865
	mov	ax,46
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	mov	WORD PTR _bv[bx+14],-1
; Line 5866
$I3574:
; Line 5870
	mov	ax,46
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	mov	si,WORD PTR _ms+4
	mov	ax,si
	shl	si,1
	shl	si,1
	add	si,ax
	shl	si,1
	mov	ax,WORD PTR _Rdrs[si]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],0
; Line 5871
	mov	ax,WORD PTR _Rdrs[si+2]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],0
; Line 5872
	mov	ax,40
	imul	WORD PTR [bp-12]	;cnt
	mov	si,ax
	mov	ax,WORD PTR [bp+20]	;xval
	mov	dx,WORD PTR [bp+22]
	mov	WORD PTR _ps[si+8],ax
	mov	WORD PTR _ps[si+10],dx
; Line 5873
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
; Line 5874
	mov	ax,WORD PTR [bp+24]	;yval
	mov	dx,WORD PTR [bp+26]
	mov	WORD PTR _ps[si+12],ax
	mov	WORD PTR _ps[si+14],dx
; Line 5875
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
; Line 5876
	mov	al,BYTE PTR [bp+4]	;planenum
	mov	BYTE PTR _bv[bx+44],al
; Line 5877
	push	WORD PTR [bp-12]	;cnt
	mov	si,bx
	call	_GetAIBase
	add	sp,2
; Line 5878
	mov	ax,WORD PTR [bp+36]	;howgood
	mov	WORD PTR _bv[si+42],ax
; Line 5880
	cmp	WORD PTR [bp+18],5	;whattype
	jne	$I3575
; Line 5881
	mov	WORD PTR _bv[si],OFFSET _Ready5
; Line 5883
$I3575:
	cmp	WORD PTR [bp+8],5	;AIBehavior
	je	$I3576
; Line 5884
	cmp	WORD PTR [bp+14],0	;numwingadd
	jle	$I3577
; Line 5885
	mov	ax,46
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	mov	WORD PTR _bv[bx+4],0
; Line 5886
$I3577:
	mov	ax,46
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	push	WORD PTR _bv[bx+14]
	push	WORD PTR [bp-12]	;cnt
	mov	si,ax
	call	_DoNextWayPt
	add	sp,4
; Line 5887
	mov	WORD PTR _bv[si+4],-999
; Line 5888
; Line 5901
$I3576:
	cmp	WORD PTR [bp-6],-999	;returnval
	jne	$I3578
; Line 5902
	mov	ax,WORD PTR [bp-12]	;cnt
	mov	WORD PTR [bp-6],ax	;returnval
; Line 5904
$I3578:
	cmp	WORD PTR [bp+18],5	;whattype
	jne	$I3579
; Line 5905
	mov	ax,46
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	mov	WORD PTR _bv[bx],OFFSET _Ready5
; Line 5906
	push	WORD PTR _bv[bx+14]
	push	WORD PTR [bp-12]	;cnt
	call	_SetUpLaunch
	add	sp,4
; Line 5908
; Line 5910
$I3579:
	cmp	WORD PTR [bp+14],0	;numwingadd
	jle	$I3580
; Line 5911
	push	WORD PTR [bp+6]	;planeid
	push	WORD PTR [bp+14]	;numwingadd
	mov	ax,40
	imul	WORD PTR [bp-12]	;cnt
	mov	bx,ax
	push	WORD PTR _ps[bx]
	push	WORD PTR [bp-12]	;cnt
	call	_SetUpWingman
	add	sp,8
; Line 5915
$I3580:
; Line 5916
	mov	ax,WORD PTR [bp+12]	;numadd
	dec	ax
	inc	WORD PTR [bp-10]	;numwingmen
	cmp	ax,WORD PTR [bp-10]	;numwingmen
	jl	$FB3547
; Line 5918
; Line 5919
; Line 5920
$FC3546:
	mov	ax,WORD PTR [bp-22]	;incval
	add	WORD PTR [bp-12],ax	;cnt
$F3545:
	cmp	WORD PTR [bp-18],0	;notdone
	je	$FB3547
; Line 5783
	cmp	WORD PTR [bp-24],0	;imaboat
	jne	$JCC36605
	jmp	$I3548
$JCC36605:
; Line 5784
	mov	ax,WORD PTR [bp-12]	;cnt
	cmp	WORD PTR [bp-20],ax	;endval
	jge	$JCC36616
	jmp	$I3551
$JCC36616:
	jmp	$L20181
$FB3547:
; Line 5922
	mov	ax,WORD PTR [bp-6]	;returnval
; Line 5923
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_AddSomePlanes2	ENDP
; Line 5926
	PUBLIC	_UpdateHelicopterHPR_SandP
_UpdateHelicopterHPR_SandP	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,64
	call	__aNchkstk
	push	di
	push	si
;	spd = -14
;	Gspd = -52
;	dx = -36
;	dy = -44
;	spd2 = -20
;	speed2 = -10
;	tspd = -28
;	precval = -40
;	precval2 = -56
;	n = -48
;	fdroll = -6
;	temppitch = -46
;	temppitch2 = -2
;	dpitchrange = -16
;	temppitchl = -24
;	temppitchl2 = -32
;	a = -4
; Line 5946
	mov	ax,WORD PTR _droll
	shl	ax,1
	shl	ax,1
	cwd	
	idiv	WORD PTR _FrameRate
	mov	bx,WORD PTR $S1358_psi
	add	WORD PTR [bx+20],ax
; Line 5947
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+20]
	mov	cl,3
	sar	ax,cl
	cwd	
	idiv	WORD PTR _FrameRate
	add	WORD PTR [bx+16],ax
; Line 5952
	mov	ax,WORD PTR _pdest
	mov	WORD PTR $S1367_dpitch,ax
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,512
	jg	$I3601
	push	WORD PTR $S1367_dpitch
	call	_abs
	add	sp,2
	cmp	ax,512
	jg	$I3601
	push	WORD PTR $S1359_i
	call	_IsCAPFlier
	add	sp,2
	or	ax,ax
	jne	$I3600
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	jne	$I3600
$I3601:
; Line 5953
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	and	BYTE PTR _ps[bx+24],191
; Line 5954
	jmp	SHORT $I3602
$I3600:
; Line 5955
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],64
$I3602:
; Line 5958
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	cl,3
	mov	bx,WORD PTR $S1359_i
	shl	bx,cl
	push	WORD PTR _ailoc[bx+2]
	push	WORD PTR _ailoc[bx]
	call	__aNldiv
	mov	cx,ax
	mov	ax,40
	mov	bx,dx
	imul	WORD PTR $S1359_i
	mov	si,ax
	cmp	cx,WORD PTR _ps[si+8]
	jne	$L20033
	cmp	bx,WORD PTR _ps[si+10]
	je	$I3603
$L20033:
; Line 5959
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	si,ax
	call	__aNlmul
	mov	cl,3
	mov	bx,WORD PTR $S1359_i
	shl	bx,cl
	mov	WORD PTR _ailoc[bx],ax
	mov	WORD PTR _ailoc[bx+2],dx
; Line 5960
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	mov	si,bx
	call	__aNlmul
	mov	WORD PTR _ailoc[si+4],ax
	mov	WORD PTR _ailoc[si+6],dx
; Line 5961
; Line 5963
$I3603:
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],64
	je	$I3606
; Line 5964
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	cwd	
	sub	ax,dx
	sar	ax,1
	cmp	WORD PTR _bv[bx+18],ax
	jle	$I3606
; Line 5965
	mov	WORD PTR _bv[bx+18],ax
; Line 5966
$I3606:
; Line 5968
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+25],146
	je	$JCC36942
	jmp	$I3612
$JCC36942:
; Line 5973
	mov	ax,4608
	cwd	
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	mov	ax,-1000
	imul	WORD PTR _ps[bx+18]
	push	dx
	push	ax
	call	__aNldiv
; Line 5975
	mov	cx,1000
	sub	bx,bx
	push	bx
	push	cx
	les	bx,DWORD PTR _ptype
	mov	cx,ax
	mov	ax,WORD PTR es:[bx+10]
	mov	bx,dx
	cwd	
	push	dx
	push	ax
	push	bx
	push	cx
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-14],ax	;spd
	mov	WORD PTR [bp-12],dx
; Line 5977
	or	dx,dx
	jge	$I3608
; Line 5978
	sub	ax,ax
	mov	WORD PTR [bp-12],ax
	mov	WORD PTR [bp-14],ax	;spd
; Line 5980
$I3608:
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+20]
	call	_abs
	add	sp,2
	cmp	ax,2560
	jle	$I3609
; Line 5981
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;spd
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+20]
	call	_sinXL
	add	sp,6
	push	dx
	push	ax
	call	_labs
	add	sp,4
	sar	dx,1
	rcr	ax,1
	sub	WORD PTR [bp-14],ax	;spd
	sbb	WORD PTR [bp-12],dx
; Line 5983
$I3609:
	cmp	WORD PTR _REALFLIGHT,0
	je	$I3610
; Line 5985
	mov	ax,15536
	mov	dx,-1
	push	dx
	push	ax
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;spd
	mov	ax,7500
	push	ax
	mov	ax,1250
	push	ax
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+6]
	call	_rng
	add	sp,6
	sub	ax,1250
	cwd	
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	add	WORD PTR [bp-14],ax	;spd
	adc	WORD PTR [bp-12],dx
; Line 5986
; Line 5988
$I3610:
	cmp	WORD PTR [bp-12],0
	jge	$I3611
; Line 5989
	sub	ax,ax
	mov	WORD PTR [bp-12],ax
	mov	WORD PTR [bp-14],ax	;spd
; Line 5991
$I3611:
	mov	ax,WORD PTR [bp-14]	;spd
	mov	bx,WORD PTR $S1358_psi
	mov	WORD PTR [bx+26],ax
; Line 5992
	mov	bx,WORD PTR $S1358_psi
	cmp	WORD PTR [bx+26],0
	jne	$I3612
; Line 5993
	mov	WORD PTR [bx+26],1
; Line 5994
$I3612:
; Line 5998
	mov	bx,WORD PTR $S1358_psi
	cmp	WORD PTR [bx+6],2500
	jle	$I3614
; Line 5999
	cmp	WORD PTR [bx+18],0
	jle	$I3614
; Line 6000
	mov	WORD PTR $S1367_dpitch,0
; Line 6001
$I3614:
; Line 6004
	test	BYTE PTR [bx+24],32
	je	$I3615
; Line 6006
	mov	WORD PTR $S1367_dpitch,0
; Line 6007
	add	BYTE PTR [bx+17],16
; Line 6008
	mov	bx,WORD PTR $S1358_psi
	sub	WORD PTR [bx+6],40
; Line 6009
; Line 6021
$I3615:
	cmp	WORD PTR _Speedy,1
	je	$JCC37232
	jmp	$I3616
$JCC37232:
; Line 6022
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
	mov	bx,WORD PTR $S1358_psi
	mov	ax,27
	imul	WORD PTR [bx+26]
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
; Line 6023
	or	dx,dx
	jl	$I3617
; Line 6024
	mov	WORD PTR [bp-14],ax	;spd
	mov	WORD PTR [bp-12],dx
; Line 6025
	jmp	SHORT $I3618
$I3617:
; Line 6026
	sub	ax,ax
	mov	WORD PTR [bp-12],ax
	mov	WORD PTR [bp-14],ax	;spd
$I3618:
; Line 6027
	mov	ax,60
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _Fticks
	cwd	
	push	dx
	push	ax
	mov	bx,WORD PTR $S1358_psi
	mov	ax,27
	imul	WORD PTR [bx+26]
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
	call	__aNldiv
	mov	WORD PTR [bp-10],ax	;speed2
	mov	WORD PTR [bp-8],dx
; Line 6029
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;spd
	push	WORD PTR $S1367_dpitch
	call	_cosXL
	add	sp,6
	mov	WORD PTR [bp-52],ax	;Gspd
	mov	WORD PTR [bp-50],dx
	or	dx,dx
	jge	$I3619
; Line 6030
	sub	ax,ax
	mov	WORD PTR [bp-50],ax
	mov	WORD PTR [bp-52],ax	;Gspd
; Line 6031
$I3619:
	push	WORD PTR [bp-50]
	push	ax
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+16]
	call	_sinXL
	add	sp,6
	mov	cl,3
	mov	bx,WORD PTR $S1359_i
	shl	bx,cl
	add	WORD PTR _ailoc[bx],ax
	adc	WORD PTR _ailoc[bx+2],dx
; Line 6032
	push	WORD PTR [bp-50]
	push	WORD PTR [bp-52]	;Gspd
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+16]
	call	_cosXL
	add	sp,6
	mov	bx,WORD PTR $S1359_i
	mov	cl,3
	shl	bx,cl
	sub	WORD PTR _ailoc[bx+4],ax
	sbb	WORD PTR _ailoc[bx+6],dx
; Line 6033
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	bx,WORD PTR $S1359_i
	shl	bx,cl
	push	WORD PTR _ailoc[bx+2]
	push	WORD PTR _ailoc[bx]
	mov	si,bx
	call	__aNldiv
	mov	cx,ax
	mov	ax,40
	mov	bx,dx
	imul	WORD PTR $S1359_i
	mov	di,ax
	mov	WORD PTR _ps[di+8],cx
	mov	WORD PTR _ps[di+10],bx
; Line 6034
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ailoc[si+6]
	push	WORD PTR _ailoc[si+4]
	call	__aNldiv
	mov	WORD PTR _ps[di+12],ax
	mov	WORD PTR _ps[di+14],dx
; Line 6035
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+18],3
	jle	$I3620
; Line 6036
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;spd
	call	__aNldiv
	push	dx
	push	ax
$L20182:
	push	WORD PTR $S1367_dpitch
	call	_sinXL
	add	sp,6
	mov	bx,WORD PTR $S1358_psi
	add	WORD PTR [bx+6],ax
; Line 6037
	jmp	$I3626
$I3620:
; Line 6038
	mov	ax,7
	push	ax
	push	WORD PTR $S1367_dpitch
	call	_sinX
	add	sp,4
	mov	cx,100
	sub	dx,dx
	push	dx
	push	cx
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;spd
	mov	si,ax
	call	__aNldiv
	push	dx
	push	ax
	push	WORD PTR $S1367_dpitch
	jmp	$L20183
	nop	
$I3616:
; Line 6042
	mov	ax,60
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _Fticks
	cwd	
	push	dx
	push	ax
	mov	bx,WORD PTR $S1358_psi
	mov	ax,27
	imul	WORD PTR [bx+26]
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
	call	__aNldiv
	mov	WORD PTR [bp-10],ax	;speed2
	mov	WORD PTR [bp-8],dx
; Line 6043
	or	dx,dx
	jge	$I3623
; Line 6044
	sub	ax,ax
	mov	WORD PTR [bp-8],ax
	mov	WORD PTR [bp-10],ax	;speed2
; Line 6045
$I3623:
; Line 6046
	push	WORD PTR [bp-8]
	push	ax
	push	WORD PTR $S1367_dpitch
	call	_cosXL
	add	sp,6
	mov	WORD PTR [bp-52],ax	;Gspd
	mov	WORD PTR [bp-50],dx
	or	dx,dx
	jge	$I3624
; Line 6047
	sub	ax,ax
	mov	WORD PTR [bp-50],ax
	mov	WORD PTR [bp-52],ax	;Gspd
; Line 6048
$I3624:
	push	WORD PTR [bp-50]
	push	ax
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+16]
	call	_sinXL
	add	sp,6
	mov	bx,WORD PTR $S1358_psi
	add	WORD PTR [bx+8],ax
	adc	WORD PTR [bx+10],dx
; Line 6049
	push	WORD PTR [bp-50]
	push	WORD PTR [bp-52]	;Gspd
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+16]
	call	_cosXL
	add	sp,6
	mov	bx,WORD PTR $S1358_psi
	sub	WORD PTR [bx+12],ax
	sbb	WORD PTR [bx+14],dx
; Line 6050
	mov	ax,46
	imul	WORD PTR $S1359_i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+18],3
	jle	$I3625
; Line 6051
	push	WORD PTR [bp-8]
	push	WORD PTR [bp-10]	;speed2
	jmp	$L20182
	nop	
$I3625:
; Line 6053
	mov	ax,7
	push	ax
	push	WORD PTR $S1367_dpitch
	call	_sinX
	add	sp,4
	push	WORD PTR [bp-8]
	push	WORD PTR [bp-10]	;speed2
	push	WORD PTR $S1367_dpitch
	mov	si,ax
$L20183:
	call	_sinXL
	add	sp,6
	add	si,ax
	mov	bx,WORD PTR $S1358_psi
	add	WORD PTR [bx+6],si
; Line 6054
$I3626:
; Line 6055
; Line 6057
	push	WORD PTR $S1359_i
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	je	$I3627
; Line 6058
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	si,ax
	call	__aNlmul
	add	ax,50
	adc	dx,0
	mov	cl,3
	mov	bx,WORD PTR $S1359_i
	shl	bx,cl
	mov	WORD PTR _ailoc[bx],ax
	mov	WORD PTR _ailoc[bx+2],dx
; Line 6059
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	mov	si,bx
	call	__aNlmul
	add	ax,50
	adc	dx,0
	mov	WORD PTR _ailoc[si+4],ax
	mov	WORD PTR _ailoc[si+6],dx
; Line 6060
; Line 6061
	jmp	$I3628
$I3627:
; Line 6064
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR $S1359_i
	mov	bx,ax
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	si,ax
	call	__aNlmul
	mov	cx,100
	sub	bx,bx
	push	bx
	push	cx
	mov	di,-100
	mov	cx,-1
	push	cx
	push	di
	push	WORD PTR _FPARAMS+2
	push	WORD PTR _FPARAMS
	mov	di,ax
	mov	WORD PTR [bp-60],di
	mov	WORD PTR [bp-58],dx
	call	__aNldiv
	push	dx
	push	ax
	call	__aNlmul
	add	ax,WORD PTR _FPARAMS
	adc	dx,WORD PTR _FPARAMS+2
	add	ax,WORD PTR [bp-60]
	adc	dx,WORD PTR [bp-58]
	mov	cl,3
	mov	bx,WORD PTR $S1359_i
	shl	bx,cl
	mov	WORD PTR _ailoc[bx],ax
	mov	WORD PTR _ailoc[bx+2],dx
; Line 6066
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	cx,-100
	mov	di,-1
	push	di
	push	cx
	push	WORD PTR _FPARAMS+10
	push	WORD PTR _FPARAMS+8
	mov	di,bx
	call	__aNldiv
	push	dx
	push	ax
	call	__aNlmul
	add	ax,WORD PTR _FPARAMS+8
	adc	dx,WORD PTR _FPARAMS+10
; Line 6067
	mov	cx,100
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	mov	si,ax
	mov	WORD PTR [bp-64],si
	mov	WORD PTR [bp-62],dx
	call	__aNlmul
	add	ax,WORD PTR [bp-64]
	adc	dx,WORD PTR [bp-62]
	mov	WORD PTR _ailoc[di+4],ax
	mov	WORD PTR _ailoc[di+6],dx
; Line 6068
	mov	cx,WORD PTR _FPARAMS
	mov	bx,WORD PTR _FPARAMS+2
	mov	WORD PTR _lfpx,cx
	mov	WORD PTR _lfpx+2,bx
; Line 6069
	mov	cx,WORD PTR _FPARAMS+8
	mov	bx,WORD PTR _FPARAMS+10
	mov	WORD PTR _lfpy,cx
	mov	WORD PTR _lfpy+2,bx
; Line 6070
	mov	cx,WORD PTR _ailoc[di]
	mov	bx,WORD PTR _ailoc[di+2]
	mov	WORD PTR _lox,cx
	mov	WORD PTR _lox+2,bx
; Line 6071
	mov	WORD PTR _loy,ax
	mov	WORD PTR _loy+2,dx
; Line 6072
$I3628:
; Line 6074
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+8]
	mov	dx,WORD PTR [bx+10]
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
	mov	WORD PTR [bx+2],ax
; Line 6075
	mov	bx,WORD PTR $S1358_psi
	mov	ax,WORD PTR [bx+12]
	mov	dx,WORD PTR [bx+14]
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
	mov	WORD PTR [bx+4],ax
; Line 6081
	mov	ax,1000
	cwd	
	push	dx
	push	ax
	mov	cx,4608
	sub	bx,bx
	push	bx
	push	cx
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	cwd	
	push	dx
	push	ax
	mov	si,WORD PTR $S1358_psi
	mov	di,ax
	mov	ax,-1000
	mov	cx,dx
	imul	WORD PTR [si+26]
	push	dx
	push	ax
	mov	si,cx
	call	__aNldiv
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
; Line 6083
	mov	cx,1000
	sub	bx,bx
	push	bx
	push	cx
	mov	cx,4608
	push	bx
	push	cx
	push	si
	push	di
	mov	cx,ax
	mov	ax,46
	mov	bx,dx
	imul	WORD PTR $S1359_i
	mov	si,ax
	mov	ax,-1000
	imul	WORD PTR _bv[si+18]
	push	dx
	push	ax
	mov	si,cx
	mov	di,bx
	call	__aNldiv
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
; Line 6085
	mov	cx,ax
	mov	ax,4096
	cwd	
	idiv	WORD PTR _FrameRate
; Line 6086
	push	ax
	neg	ax
	push	ax
	sub	cx,si
	push	cx
	call	_rng2
	add	sp,6
; Line 6087
	mov	bx,WORD PTR $S1358_psi
	add	WORD PTR [bx+18],ax
; Line 6088
	mov	ax,2048
	push	ax
	mov	ax,-4608
	push	ax
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+18]
	call	_rng2
	add	sp,6
	mov	bx,WORD PTR $S1358_psi
	mov	WORD PTR [bx+18],ax
; Line 6090
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+18]
	call	_abs
	add	sp,2
	cmp	ax,16384
	jle	$I3629
; Line 6091
	mov	bx,WORD PTR $S1358_psi
	add	BYTE PTR [bx+17],128
; Line 6092
	mov	bx,WORD PTR $S1358_psi
	add	BYTE PTR [bx+21],128
; Line 6093
	mov	ax,-32768
	mov	bx,WORD PTR $S1358_psi
	sub	ax,WORD PTR [bx+18]
	mov	WORD PTR [bx+18],ax
; Line 6094
; Line 6096
$I3629:
	mov	bx,WORD PTR $S1358_psi
	test	BYTE PTR [bx+24],32
	je	$I3630
; Line 6097
	mov	ax,5
	push	ax
	mov	ax,2
	push	ax
	push	WORD PTR [bx+14]
	push	WORD PTR [bx+12]
	push	WORD PTR [bx+6]
	push	WORD PTR [bx+10]
	push	WORD PTR [bx+8]
	call	_StartASmoke
	add	sp,14
; Line 6098
; Line 6100
$I3630:
	mov	bx,WORD PTR $S1358_psi
	cmp	WORD PTR [bx+6],0
	jge	$I3633
; Line 6101
	and	WORD PTR [bx+24],1025
; Line 6103
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+4]
	push	WORD PTR [bx+2]
	mov	ax,1
	push	ax
	call	_CloseEnoughFor
	add	sp,6
	or	ax,ax
	je	$I3632
; Line 6104
	sub	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,10
	push	ax
	call	_Sound
	add	sp,6
; Line 6105
$I3632:
	mov	ax,17
	push	ax
	mov	ax,4
	push	ax
	mov	bx,WORD PTR $S1358_psi
	push	WORD PTR [bx+14]
	push	WORD PTR [bx+12]
	push	WORD PTR [bx+6]
	push	WORD PTR [bx+10]
	push	WORD PTR [bx+8]
	call	_StartASmoke
	add	sp,14
; Line 6107
	mov	ax,WORD PTR _atarg
	cmp	WORD PTR $S1359_i,ax
	jne	$I3633
	mov	WORD PTR _atarg,-1
; Line 6108
$I3633:
; Line 6109
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_UpdateHelicopterHPR_SandP	ENDP
; Line 6113
	PUBLIC	_UpdateI
_UpdateI	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	newi = 4
; Line 6115
	mov	ax,WORD PTR [bp+4]	;newi
	mov	WORD PTR $S1359_i,ax
	mov	cx,40
	imul	cx
	add	ax,OFFSET _ps
	mov	WORD PTR $S1358_psi,ax
; Line 6116
	mov	sp,bp
	pop	bp
	ret	
	nop	

_UpdateI	ENDP
; Line 6119
	PUBLIC	_ImNotaFighter
_ImNotaFighter	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	tempplane = -4
;	checkguns = 6
;	planenum = 4
; Line 6124
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	WORD PTR [bp-4],bx	;tempplane
	mov	WORD PTR [bp-2],es
	cmp	WORD PTR es:[bx+38],10
	je	$I3641
	cmp	WORD PTR es:[bx+38],40
	jne	$I3640
$I3641:
; Line 6125
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 6127
	nop	
$I3640:
	cmp	WORD PTR es:[bx+38],20
	jne	$I3643
; Line 6128
	push	WORD PTR [bp+4]	;planenum
	call	_CheckAIMissiles
	add	sp,2
	inc	ax
	je	$I3643
	push	WORD PTR [bp+4]	;planenum
	call	_CheckAIBombs
	add	sp,2
	inc	ax
	je	$I3641
; Line 6130
$I3643:
; Line 6132
	cmp	WORD PTR [bp+6],0	;checkguns
	jne	$I3644
; Line 6133
$L20185:
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 6135
$I3644:
	les	bx,DWORD PTR [bp-4]	;tempplane
	cmp	WORD PTR es:[bx+20],0
	je	$I3641
	jmp	SHORT $L20185

_ImNotaFighter	ENDP
_TEXT	ENDS
END
