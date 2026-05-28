;	Static Name Aliases
;
	TITLE   C:\LOADMISS.C
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
EXTRN	_sprintf:NEAR
EXTRN	_GetRadarPtr:NEAR
EXTRN	_GetPlanePtr:NEAR
EXTRN	_GetPlaneOrgNum:NEAR
EXTRN	_GetWayPointChanges:NEAR
EXTRN	_fclose:NEAR
EXTRN	_KeepPlaneOnCarrier:NEAR
EXTRN	_RadarAdd:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_fopen:NEAR
EXTRN	_AddSomePlanes2:NEAR
EXTRN	_GetPlanePointXYZ:NEAR
EXTRN	_Load3DPlaneInfo:NEAR
EXTRN	_Ready5:NEAR
EXTRN	_fread:NEAR
EXTRN	_fseek:NEAR
EXTRN	_strcat:NEAR
EXTRN	_MissileAdd:NEAR
EXTRN	_EngineAlreadyOn:NEAR
EXTRN	_Speech:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_RequestCat:NEAR
EXTRN	_Message:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_sinXL:NEAR
EXTRN	_PreparePlane:NEAR
EXTRN	_itoa:NEAR
EXTRN	_cosXL:NEAR
EXTRN	_IsBoat:NEAR
EXTRN	_UpdateOurCarrier:NEAR
_BSS      SEGMENT
COMM NEAR	_World:	BYTE:	 2
_BSS      ENDS
EXTRN	_NGTARGETS:WORD
EXTRN	_warstatus:WORD
EXTRN	_ENEMYNODIE:WORD
EXTRN	_planelanding:WORD
EXTRN	_landingstatus:WORD
EXTRN	_KnockItOffStatus:WORD
EXTRN	_lastCounter:WORD
EXTRN	_lastOClock:WORD
EXTRN	_minTimeAloft:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Txt:BYTE
EXTRN	_Status:WORD
EXTRN	_Diff:WORD
EXTRN	_wps:BYTE
_BSS      SEGMENT
COMM NEAR	_lastadded:	BYTE:	 1
COMM NEAR	_orgPlayernum:	BYTE:	 2
_BSS      ENDS
EXTRN	_OurLoadOut:WORD
EXTRN	_NRADAR:WORD
_BSS      SEGMENT
COMM NEAR	_MissionWeather:	BYTE:	 2
COMM NEAR	_CloudCeiling:	BYTE:	 2
_BSS      ENDS
EXTRN	_OurWingName:BYTE
EXTRN	_NPLANES:WORD
EXTRN	_whichourcarr:WORD
EXTRN	_Rdrs:BYTE
EXTRN	_ps:BYTE
_BSS      SEGMENT
COMM NEAR	_aipaths:	 8:	 40
COMM NEAR	_aiwaypoints:	 14:	 85
COMM NEAR	_aiactions:	 4:	 130
_BSS      ENDS
EXTRN	_PxLng:DWORD
EXTRN	_PyLng:DWORD
EXTRN	_OurHead:WORD
EXTRN	_bv:BYTE
EXTRN	_OurAlt:WORD
EXTRN	_TimeOfDay:WORD
EXTRN	_PlayerCat:WORD
EXTRN	_OurCallSign:BYTE
EXTRN	_Alt:WORD
EXTRN	_OurPath:WORD
EXTRN	_AirSpeed:WORD
EXTRN	_ThrustI:WORD
EXTRN	_LASTPLANE:WORD
EXTRN	_DOINVISIBLE:WORD
EXTRN	_THRUST:WORD
EXTRN	_ONTHECAT:WORD
EXTRN	_gt:BYTE
EXTRN	_TRIM:WORD
_DATA      SEGMENT
$SG1398	DB	'rb',  00H
$SG1399	DB	'mission.f14',  00H
$SG1401	DB	'No Mission Data',  00H
$SG1403	DB	'More paths %d than allocated space: %d',  00H
$SG1405	DB	'More waypoints %d than allocated space: %d',  00H
$SG1407	DB	'More actions %d than allocated space: %d',  00H
$SG1468	DB	'                ',  00H
$SG1470	DB	' ',  00H
$SG1474	DB	'                ',  00H
$SG1475	DB	'(',  00H
$SG1476	DB	')',  00H
$SG1478	DB	'(Wingman)',  00H
$SG1531	DB	'More ground targets ',  00H
$SG1533	DB	' than allocated space: ',  00H
$SG1539	DB	'SA-2',  00H
$SG1543	DB	'SA-3',  00H
$SG1547	DB	'SA-5',  00H
$SG1551	DB	'SA-6',  00H
$SG1555	DB	'Crotale',  00H
$SG1559	DB	'Hawk',  00H
$SG1563	DB	'Nike-Herc',  00H
$SG1571	DB	'More radars ',  00H
$SG1572	DB	' than allocated space: ',  00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 31
; Line 19
; Line 32
; Line 33
; Line 34
; Line 35
; Line 36
; Line 37
; Line 38
; Line 39
; Line 41
; Line 42
; Line 44
; Line 45
; Line 84
	PUBLIC	_LoadScottMission
_LoadScottMission	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,336
	call	__aNchkstk
	push	di
	push	si
;	cnt = -36
;	cnt2 = -202
;	File = -10
;	start_data = -200
;	one_object = -286
;	planeid = -322
;	objtype = -320
;	objside = -8
;	behavenum = -310
;	numwingadd = -328
;	xval = -308
;	yval = -316
;	nxval = -292
;	nyval = -300
;	txval = -336
;	tyval = -6
;	nzval = -304
;	tzval = -18
;	altval = -30
;	headval = -34
;	path = -318
;	speedval = -28
;	numobjects = -296
;	numGTs = -326
;	numpaths = -2
;	numwaypoints = -324
;	numactions = -16
;	formnum = -26
;	attack = -204
;	launch = -302
;	whatside = -288
;	howgood = -42
;	numjump = -312
;	otherplane = -22
;	firstwp = -332
;	lastalt = -32
;	wpflag = -14
;	planeslot = -20
;	otherplane2 = -24
;	bigplaneid = -330
;	tpath = -12
;	tempplane = -40
;	setediff = -294
; Line 109
	mov	WORD PTR [bp-32],1	;lastalt
; Line 116
	sub	ax,ax
	mov	WORD PTR [bp-312],ax	;numjump
	mov	WORD PTR [bp-294],ax	;setediff
; Line 119
	mov	ax,-999
	mov	WORD PTR _whichourcarr,ax
	mov	WORD PTR _PlayerCat,ax
; Line 121
	mov	ax,OFFSET DGROUP:$SG1398
	push	ax
	mov	ax,OFFSET DGROUP:$SG1399
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR [bp-10],ax	;File
	or	ax,ax
	jne	$I1397
; Line 122
	mov	ax,1
	push	ax
	mov	ax,OFFSET DGROUP:$SG1401
	push	ax
	call	_Message
	add	sp,4
; Line 123
	sub	ax,ax
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 124
; Line 126
$I1397:
; Line 127
	mov	WORD PTR _LASTPLANE,70
; Line 129
	mov	WORD PTR _warstatus,2
; Line 132
	mov	WORD PTR _KnockItOffStatus,0
; Line 133
	mov	WORD PTR _planelanding,-999
; Line 135
	sub	ax,ax
	mov	WORD PTR _NPLANES,ax
	mov	WORD PTR _NGTARGETS,ax
	mov	WORD PTR _DOINVISIBLE,ax
	mov	WORD PTR _ENEMYNODIE,ax
	mov	WORD PTR _lastCounter,ax
	mov	WORD PTR _lastOClock,ax
; Line 137
	push	WORD PTR [bp-10]	;File
	mov	ax,1
	push	ax
	mov	ax,158
	push	ax
	lea	ax,WORD PTR [bp-200]	;start_data
	push	ax
	call	_fread
	add	sp,8
; Line 138
	mov	ax,WORD PTR [bp-118]
	mov	WORD PTR _TimeOfDay,ax
; Line 140
	mov	ax,WORD PTR [bp-108]
	mov	WORD PTR [bp-296],ax	;numobjects
; Line 141
	mov	ax,WORD PTR [bp-106]
	mov	WORD PTR [bp-326],ax	;numGTs
; Line 142
	mov	ax,WORD PTR [bp-112]
	mov	WORD PTR _OurLoadOut,ax
; Line 143
	mov	ax,WORD PTR [bp-116]
	mov	WORD PTR _MissionWeather,ax
; Line 144
	mov	ax,WORD PTR [bp-114]
	mov	WORD PTR _CloudCeiling,ax
; Line 145
	mov	ax,WORD PTR [bp-120]
	mov	WORD PTR _World,ax
; Line 146
	mov	ax,WORD PTR [bp-110]
	mov	WORD PTR _minTimeAloft,ax
; Line 148
	mov	ax,WORD PTR [bp-104]
	mov	WORD PTR [bp-2],ax	;numpaths
; Line 149
	mov	cx,WORD PTR [bp-102]
	mov	WORD PTR [bp-324],cx	;numwaypoints
; Line 150
	mov	cx,WORD PTR [bp-100]
	mov	WORD PTR [bp-16],cx	;numactions
; Line 152
	cmp	ax,40
	jl	$I1402
; Line 153
	mov	cx,40
	push	cx
	push	ax
	mov	ax,OFFSET DGROUP:$SG1403
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,8
; Line 154
	mov	ax,1
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 155
; Line 157
$I1402:
	cmp	WORD PTR [bp-324],85	;numwaypoints
	jl	$I1404
; Line 158
	mov	ax,85
	push	ax
	push	WORD PTR [bp-324]	;numwaypoints
	mov	ax,OFFSET DGROUP:$SG1405
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,8
; Line 159
	mov	ax,1
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 160
; Line 162
$I1404:
	cmp	WORD PTR [bp-16],130	;numactions
	jl	$I1406
; Line 163
	mov	ax,130
	push	ax
	push	WORD PTR [bp-16]	;numactions
	mov	ax,OFFSET DGROUP:$SG1407
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,8
; Line 164
	mov	ax,1
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 165
; Line 176
$I1406:
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-86]
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-10]	;File
	call	_fseek
	add	sp,8
; Line 177
	push	WORD PTR [bp-10]	;File
	push	WORD PTR [bp-2]	;numpaths
	mov	ax,8
	push	ax
	mov	ax,OFFSET DGROUP:_aipaths
	push	ax
	call	_fread
	add	sp,8
; Line 179
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-82]
	push	WORD PTR [bp-84]
	push	WORD PTR [bp-10]	;File
	call	_fseek
	add	sp,8
; Line 180
	push	WORD PTR [bp-10]	;File
	push	WORD PTR [bp-324]	;numwaypoints
	mov	ax,14
	push	ax
	mov	ax,OFFSET DGROUP:_aiwaypoints
	push	ax
	call	_fread
	add	sp,8
; Line 182
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-78]
	push	WORD PTR [bp-80]
	push	WORD PTR [bp-10]	;File
	call	_fseek
	add	sp,8
; Line 183
	push	WORD PTR [bp-10]	;File
	push	WORD PTR [bp-16]	;numactions
	mov	ax,4
	push	ax
	mov	ax,OFFSET DGROUP:_aiactions
	push	ax
	call	_fread
	add	sp,8
; Line 185
	mov	WORD PTR [bp-36],0	;cnt
	jmp	SHORT $F1408
$I1412:
; Line 193
	mov	ax,WORD PTR [bp-32]	;lastalt
	mov	bx,WORD PTR [bp-36]	;cnt
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	mov	WORD PTR _aiwaypoints[bx+8],ax
; Line 194
$I1413:
; Line 195
; Line 196
	inc	WORD PTR [bp-36]	;cnt
$F1408:
	mov	ax,WORD PTR [bp-36]	;cnt
	cmp	WORD PTR [bp-324],ax	;numwaypoints
	jle	$FB1410
; Line 186
	mov	bx,ax
	mov	cx,ax
	shl	bx,1
	add	bx,cx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx+8],0
	jne	$I1413
; Line 187
	lea	cx,WORD PTR [bp-14]	;wpflag
	push	cx
	lea	cx,WORD PTR [bp-302]	;launch
	push	cx
	lea	cx,WORD PTR [bp-204]	;attack
	push	cx
	lea	cx,WORD PTR [bp-34]	;headval
	push	cx
	lea	cx,WORD PTR [bp-30]	;altval
	push	cx
	lea	dx,WORD PTR [bp-28]	;speedval
	push	dx
	lea	dx,WORD PTR [bp-26]	;formnum
	push	dx
	lea	dx,WORD PTR [bp-310]	;behavenum
	push	dx
	push	ax
	mov	si,bx
	call	_GetWayPointChanges
	add	sp,18
; Line 188
	cmp	WORD PTR [bp-30],-1	;altval
	je	$I1412
; Line 189
	mov	ax,WORD PTR [bp-30]	;altval
	mov	WORD PTR _aiwaypoints[si+8],ax
; Line 190
	mov	WORD PTR [bp-32],ax	;lastalt
; Line 191
; Line 192
	jmp	SHORT $I1413
	nop	
$FB1410:
; Line 198
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-94]
	push	WORD PTR [bp-96]
	push	WORD PTR [bp-10]	;File
	call	_fseek
	add	sp,8
; Line 201
	mov	WORD PTR [bp-36],0	;cnt
	jmp	SHORT $F1414
; Line 207
; Line 208
	nop	
$I1417:
; Line 212
	cmp	WORD PTR [bp-286],157	;one_object
	je	$I1419
	cmp	WORD PTR [bp-284],12
	je	$I1419
	cmp	WORD PTR [bp-284],19
	je	$I1419
	cmp	WORD PTR [bp-284],15
	je	$I1419
	cmp	WORD PTR [bp-284],16
	je	$I1419
	cmp	WORD PTR [bp-284],17
	je	$I1419
	cmp	WORD PTR [bp-284],18
	je	$I1419
	cmp	WORD PTR [bp-284],20
	je	$I1419
	cmp	WORD PTR [bp-284],21
	jne	$I1418
$I1419:
; Line 214
	push	WORD PTR [bp-36]	;cnt
	sub	sp,82
	lea	si,WORD PTR [bp-286]	;one_object
	mov	di,sp
	push	ss
	pop	es
	mov	cx,41
	rep	movsw
	call	_AddGroundTarget
	add	sp,84
; Line 215
$FC1415:
	inc	WORD PTR [bp-36]	;cnt
$F1414:
	mov	ax,WORD PTR [bp-36]	;cnt
	cmp	WORD PTR [bp-296],ax	;numobjects
	jg	$JCC701
	jmp	$FB1416
$JCC701:
; Line 202
	mov	BYTE PTR _lastadded,al
; Line 203
	push	WORD PTR [bp-10]	;File
	mov	ax,1
	push	ax
	mov	ax,82
	push	ax
	lea	ax,WORD PTR [bp-286]	;one_object
	push	ax
	call	_fread
	add	sp,8
; Line 204
	cmp	WORD PTR [bp-312],0	;numjump
	jg	$JCC736
	jmp	$I1417
$JCC736:
; Line 205
	dec	WORD PTR [bp-312]	;numjump
; Line 206
	jmp	SHORT $FC1415
; Line 216
; Line 217
	nop	
$I1418:
	test	BYTE PTR [bp-224],15
	je	$FC1415
; Line 219
; Line 222
	lea	ax,WORD PTR [bp-14]	;wpflag
	push	ax
	lea	ax,WORD PTR [bp-302]	;launch
	push	ax
	lea	ax,WORD PTR [bp-204]	;attack
	push	ax
	lea	ax,WORD PTR [bp-34]	;headval
	push	ax
	lea	ax,WORD PTR [bp-30]	;altval
	push	ax
	lea	ax,WORD PTR [bp-28]	;speedval
	push	ax
	lea	ax,WORD PTR [bp-26]	;formnum
	push	ax
	lea	cx,WORD PTR [bp-310]	;behavenum
	push	cx
	mov	cl,3
	mov	bx,WORD PTR [bp-218]
	shl	bx,cl
	mov	cx,WORD PTR _aipaths[bx+4]
	mov	WORD PTR [bp-332],cx	;firstwp
	push	cx
	call	_GetWayPointChanges
	add	sp,18
; Line 232
	cmp	WORD PTR [bp-220],-1
	je	$I1421
; Line 233
	mov	ax,WORD PTR [bp-220]
	mov	WORD PTR [bp-26],ax	;formnum
; Line 234
	jmp	SHORT $I1423
	nop	
$I1421:
	cmp	WORD PTR [bp-26],-1	;formnum
	jne	$I1423
; Line 235
	mov	WORD PTR [bp-26],2	;formnum
; Line 237
$I1423:
	cmp	WORD PTR [bp-310],-1	;behavenum
	jne	$I1424
; Line 238
	mov	WORD PTR [bp-310],1	;behavenum
; Line 239
; Line 241
$I1424:
	cmp	WORD PTR [bp-34],-1	;headval
	jne	$I1425
; Line 242
	mov	ax,WORD PTR [bp-226]
	mov	WORD PTR [bp-34],ax	;headval
; Line 243
; Line 245
$I1425:
	cmp	WORD PTR [bp-30],-1	;altval
	je	$L20001
	cmp	WORD PTR [bp-230],-1
	jl	$I1428
	jg	$L20001
	cmp	WORD PTR [bp-232],-1
	jbe	$I1428
$L20001:
; Line 247
	mov	ax,WORD PTR [bp-232]
	mov	dx,WORD PTR [bp-230]
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	mov	WORD PTR [bp-30],ax	;altval
	inc	ax
	jne	$I1428
; Line 248
	mov	WORD PTR [bp-30],0	;altval
; Line 249
; Line 250
$I1428:
; Line 251
	cmp	WORD PTR [bp-30],25	;altval
	jge	$I1429
	cmp	WORD PTR [bp-302],0	;launch
	jne	$I1429
; Line 252
	mov	WORD PTR [bp-30],2500	;altval
; Line 254
$I1429:
	cmp	WORD PTR [bp-28],-1	;speedval
	je	$I1431
	cmp	WORD PTR [bp-228],0
	jle	$I1430
$I1431:
; Line 255
	mov	ax,WORD PTR [bp-228]
	mov	WORD PTR [bp-28],ax	;speedval
; Line 256
; Line 257
$I1430:
	cmp	WORD PTR [bp-28],0	;speedval
	jg	$I1432
	cmp	WORD PTR [bp-302],0	;launch
	je	$I1433
	cmp	WORD PTR [bp-30],50	;altval
	jle	$I1432
$I1433:
; Line 258
	mov	WORD PTR [bp-28],300	;speedval
; Line 259
; Line 264
$I1432:
	mov	ax,WORD PTR [bp-286]	;one_object
	mov	WORD PTR [bp-330],ax	;bigplaneid
; Line 265
	cmp	WORD PTR [bp-284],1
	jne	$SB1436
; Line 266
	mov	ax,WORD PTR _OurLoadOut
	jmp	SHORT $S1435
; Line 267
$SC1439:
; Line 268
	mov	WORD PTR [bp-330],138	;bigplaneid
; Line 269
	jmp	SHORT $SB1436
; Line 270
$SC1440:
; Line 271
	mov	WORD PTR [bp-330],139	;bigplaneid
; Line 272
	jmp	SHORT $SB1436
; Line 273
$SC1441:
; Line 274
	mov	WORD PTR [bp-330],140	;bigplaneid
; Line 275
	jmp	SHORT $SB1436
; Line 276
$SC1442:
; Line 277
	mov	WORD PTR [bp-330],141	;bigplaneid
; Line 278
	jmp	SHORT $SB1436
; Line 279
$SC1443:
; Line 280
	mov	WORD PTR [bp-330],142	;bigplaneid
; Line 281
	jmp	SHORT $SB1436
; Line 282
$SC1444:
; Line 283
	mov	WORD PTR [bp-330],164	;bigplaneid
; Line 284
	jmp	SHORT $SB1436
$S1435:
	cmp	ax,5
	ja	$SB1436
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20002[bx]
	nop	
$L20002:
		DW	$SC1440
		DW	$SC1443
		DW	$SC1439
		DW	$SC1441
		DW	$SC1444
		DW	$SC1442
$SB1436:
; Line 286
; Line 288
	push	WORD PTR [bp-330]	;bigplaneid
	call	_Load3DPlaneInfo
	add	sp,2
	mov	WORD PTR [bp-322],ax	;planeid
; Line 290
	mov	ax,WORD PTR [bp-284]
	mov	WORD PTR [bp-320],ax	;objtype
; Line 291
	mov	ax,WORD PTR [bp-240]
	mov	dx,WORD PTR [bp-238]
	mov	WORD PTR [bp-308],ax	;xval
	mov	WORD PTR [bp-306],dx
; Line 292
	mov	cx,WORD PTR [bp-236]
	mov	bx,WORD PTR [bp-234]
	mov	WORD PTR [bp-316],cx	;yval
	mov	WORD PTR [bp-314],bx
; Line 293
	test	BYTE PTR [bp-13],16
	je	$I1446
; Line 294
	mov	cx,2500
	sub	bx,bx
	push	bx
	push	cx
	mov	si,WORD PTR [bp-34]	;headval
	add	si,-32768
	push	si
	call	_sinXL
	add	sp,6
	add	ax,WORD PTR [bp-308]	;xval
	adc	dx,WORD PTR [bp-306]
	mov	WORD PTR [bp-308],ax	;xval
	mov	WORD PTR [bp-306],dx
; Line 295
	mov	ax,2500
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-34]	;headval
	add	ah,128
	jmp	SHORT $L20013
	nop	
$I1446:
	test	BYTE PTR [bp-13],32
	je	$I1448
; Line 298
	mov	ax,2500
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-34]	;headval
	call	_sinXL
	add	sp,6
	add	WORD PTR [bp-308],ax	;xval
	adc	WORD PTR [bp-306],dx
; Line 299
	mov	ax,2500
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-34]	;headval
	jmp	SHORT $L20014
$I1448:
	test	BYTE PTR [bp-13],64
	je	$I1450
; Line 302
	mov	ax,2500
	cwd	
	push	dx
	push	ax
	mov	cx,WORD PTR [bp-34]	;headval
	add	ch,64
	push	cx
	call	_sinXL
	add	sp,6
	add	WORD PTR [bp-308],ax	;xval
	adc	WORD PTR [bp-306],dx
; Line 303
	mov	ax,2500
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-34]	;headval
	add	ah,64
$L20013:
	push	ax
$L20014:
	call	_cosXL
	add	sp,6
	sub	WORD PTR [bp-316],ax	;yval
	sbb	WORD PTR [bp-314],dx
; Line 304
; Line 306
$I1450:
; Line 308
	mov	al,BYTE PTR [bp-224]
	and	ax,15
	dec	ax
	mov	WORD PTR [bp-328],ax	;numwingadd
	or	ax,ax
	jg	$I1451
; Line 309
	mov	WORD PTR [bp-328],0	;numwingadd
; Line 311
$I1451:
	mov	ax,WORD PTR [bp-328]	;numwingadd
	mov	WORD PTR [bp-312],ax	;numjump
; Line 313
	mov	ax,WORD PTR [bp-218]
	mov	WORD PTR [bp-318],ax	;path
; Line 314
	mov	cx,WORD PTR [bp-242]
	mov	WORD PTR [bp-288],cx	;whatside
; Line 315
	mov	cl,BYTE PTR [bp-246]
	and	cx,15
	inc	cx
	mov	WORD PTR [bp-42],cx	;howgood
; Line 316
	inc	ax
	je	$I1452
; Line 317
	mov	cl,3
	mov	bx,WORD PTR [bp-318]	;path
	shl	bx,cl
	mov	ax,WORD PTR _aipaths[bx+4]
	mov	WORD PTR [bp-332],ax	;firstwp
; Line 318
; Line 319
	jmp	SHORT $I1453
$I1452:
; Line 320
	mov	WORD PTR [bp-332],-1	;firstwp
; Line 321
$I1453:
; Line 323
	cmp	WORD PTR [bp-284],0
	je	$JCC1373
	jmp	$I1454
$JCC1373:
; Line 325
	mov	ax,WORD PTR [bp-308]	;xval
	mov	dx,WORD PTR [bp-306]
	mov	WORD PTR _PxLng,ax
	mov	WORD PTR _PxLng+2,dx
	cmp	dx,-1
	jl	$I1455
	jg	$L20003
	cmp	ax,-1
	jbe	$I1455
$L20003:
; Line 326
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR [bp-316]	;yval
	sbb	dx,WORD PTR [bp-314]
	jmp	SHORT $L20008
$I1455:
; Line 328
	mov	ax,WORD PTR [bp-316]	;yval
	mov	dx,WORD PTR [bp-314]
$L20008:
	mov	WORD PTR _PyLng,ax
	mov	WORD PTR _PyLng+2,dx
; Line 329
	mov	ax,WORD PTR [bp-30]	;altval
	shl	ax,1
	shl	ax,1
	mov	WORD PTR _OurAlt,ax
; Line 330
	cmp	WORD PTR [bp-302],-1	;launch
	jne	$I1457
; Line 332
	sub	ax,ax
	mov	WORD PTR _ONTHECAT,ax
	mov	WORD PTR _TRIM,ax
; Line 333
	mov	ax,WORD PTR [bp-30]	;altval
	mov	WORD PTR _Alt,ax
; Line 334
	cmp	ax,70
	jbe	$I1465
; Line 335
	mov	WORD PTR _AirSpeed,10800
; Line 336
	mov	ax,100
	mov	WORD PTR _THRUST,ax
	mov	WORD PTR _ThrustI,ax
; Line 337
	or	BYTE PTR _Status,1
; Line 338
	and	BYTE PTR _Status,247
; Line 339
	call	_EngineAlreadyOn
; Line 340
; Line 341
; Line 342
	jmp	SHORT $I1465
	nop	
$I1457:
; Line 343
	mov	ax,-1
	push	ax
	mov	al,BYTE PTR [bp-36]	;cnt
	and	ax,3
	push	ax
	call	_RequestCat
	add	sp,4
	mov	WORD PTR _PlayerCat,ax
; Line 344
	or	ax,ax
	jne	$I1462
; Line 345
	or	BYTE PTR _landingstatus,16
; Line 346
	jmp	SHORT $I1464
	nop	
$I1462:
	cmp	ax,1
	jne	$I1464
; Line 347
	or	BYTE PTR _landingstatus,32
; Line 348
$I1464:
	cmp	WORD PTR _PlayerCat,0
	jl	$I1465
; Line 349
	mov	ax,-1
	push	ax
	push	WORD PTR _PlayerCat
	call	_PreparePlane
	add	sp,4
; Line 350
$I1465:
; Line 351
	mov	ax,WORD PTR [bp-34]	;headval
	mov	WORD PTR _OurHead,ax
; Line 352
	mov	ax,WORD PTR [bp-36]	;cnt
	mov	WORD PTR _orgPlayernum,ax
; Line 353
	mov	ax,WORD PTR [bp-318]	;path
	mov	WORD PTR _OurPath,ax
; Line 355
	mov	ax,OFFSET DGROUP:$SG1468
	push	ax
	lea	ax,WORD PTR [bp-264]
	push	ax
	call	_strcmp
	add	sp,4
	or	ax,ax
	je	$I1467
; Line 356
	lea	ax,WORD PTR [bp-264]
$L20015:
	push	ax
	mov	ax,OFFSET _OurCallSign
	push	ax
	call	_strcpy
	add	sp,4
; Line 357
; Line 358
	jmp	$FC1415
	nop	
$I1467:
; Line 359
	mov	ax,OFFSET DGROUP:$SG1470
	jmp	SHORT $L20015
	nop	
$I1454:
; Line 365
	cmp	WORD PTR [bp-284],1
	jne	$I1472
; Line 366
	mov	ax,OFFSET DGROUP:$SG1474
	push	ax
	lea	ax,WORD PTR [bp-264]
	push	ax
	call	_strcmp
	add	sp,4
	or	ax,ax
	je	$I1473
; Line 367
	mov	ax,OFFSET DGROUP:$SG1475
	push	ax
	mov	ax,OFFSET _OurWingName
	push	ax
	call	_strcpy
	add	sp,4
; Line 368
	lea	ax,WORD PTR [bp-264]
	push	ax
	mov	ax,OFFSET _OurWingName
	push	ax
	call	_strcat
	add	sp,4
; Line 369
	mov	ax,OFFSET DGROUP:$SG1476
	push	ax
	mov	ax,OFFSET _OurWingName
	push	ax
	call	_strcat
	jmp	SHORT $L20009
$I1473:
; Line 372
	mov	ax,OFFSET DGROUP:$SG1478
	push	ax
	mov	ax,OFFSET _OurWingName
	push	ax
	call	_strcpy
$L20009:
	add	sp,4
; Line 373
; Line 374
; Line 375
$I1472:
	cmp	WORD PTR [bp-294],0	;setediff
	jne	$I1483
; Line 377
	mov	ax,WORD PTR [bp-42]	;howgood
	dec	ax
	mov	WORD PTR _Diff,ax
	cmp	ax,4
	jl	$I1480
; Line 378
	mov	WORD PTR _Diff,3
; Line 379
	jmp	SHORT $I1482
	nop	
$I1480:
	or	ax,ax
	jge	$I1482
; Line 380
	mov	WORD PTR _Diff,0
; Line 381
$I1482:
	cmp	WORD PTR [bp-288],0	;whatside
	je	$I1483
; Line 382
	mov	WORD PTR [bp-294],1	;setediff
; Line 383
$I1483:
; Line 385
	push	WORD PTR [bp-42]	;howgood
	push	WORD PTR [bp-28]	;speedval
	push	WORD PTR [bp-318]	;path
	push	WORD PTR [bp-34]	;headval
	push	WORD PTR [bp-30]	;altval
	push	WORD PTR [bp-314]
	push	WORD PTR [bp-316]	;yval
	push	WORD PTR [bp-306]
	push	WORD PTR [bp-308]	;xval
	push	WORD PTR [bp-320]	;objtype
	push	WORD PTR [bp-288]	;whatside
	push	WORD PTR [bp-328]	;numwingadd
	mov	ax,1
	push	ax
	push	WORD PTR [bp-26]	;formnum
	push	WORD PTR [bp-310]	;behavenum
	push	WORD PTR [bp-322]	;planeid
	push	WORD PTR [bp-36]	;cnt
	call	_AddSomePlanes2
	add	sp,34
	mov	WORD PTR [bp-20],ax	;planeslot
	mov	cx,46
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR [bp-332]	;firstwp
	mov	WORD PTR _bv[bx+14],ax
; Line 386
	mov	si,ax
	shl	si,1
	add	si,ax
	shl	si,1
	add	si,ax
	shl	si,1
	mov	ax,WORD PTR _aiwaypoints[si]
	mov	dx,WORD PTR _aiwaypoints[si+2]
	mov	WORD PTR _bv[bx+30],ax
	mov	WORD PTR _bv[bx+32],dx
; Line 387
	mov	ax,WORD PTR _aiwaypoints[si+4]
	mov	dx,WORD PTR _aiwaypoints[si+6]
	mov	WORD PTR _bv[bx+34],ax
	mov	WORD PTR _bv[bx+36],dx
; Line 388
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-20],ax	;planeslot
	jg	$JCC1897
	jmp	$FC1415
$JCC1897:
; Line 389
	mov	ax,WORD PTR [bp-216]
	mov	WORD PTR _bv[bx+26],ax
; Line 390
; Line 391
; Line 392
	jmp	$FC1415
	nop	
$FB1416:
; Line 394
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-90]
	push	WORD PTR [bp-92]
	push	WORD PTR [bp-10]	;File
	call	_fseek
	add	sp,8
; Line 396
	mov	WORD PTR [bp-36],0	;cnt
	jmp	SHORT $F1485
	nop	
$FC1486:
; Line 397
	push	WORD PTR [bp-10]	;File
	mov	cx,1
	push	cx
	mov	cx,82
	push	cx
	lea	cx,WORD PTR [bp-286]	;one_object
	push	cx
	call	_fread
	add	sp,8
; Line 399
	mov	ax,WORD PTR [bp-296]	;numobjects
	add	ax,WORD PTR [bp-36]	;cnt
	push	ax
	sub	sp,82
	lea	si,WORD PTR [bp-286]	;one_object
	mov	di,sp
	push	ss
	pop	es
	mov	cx,41
	rep	movsw
	call	_AddGroundTarget
	add	sp,84
; Line 400
	inc	WORD PTR [bp-36]	;cnt
$F1485:
	mov	ax,WORD PTR [bp-36]	;cnt
	cmp	WORD PTR [bp-326],ax	;numGTs
	jg	$FC1486
; Line 403
	mov	WORD PTR [bp-36],0	;cnt
	jmp	$F1488
$I1493:
; Line 426
	mov	ax,40
	imul	WORD PTR [bp-36]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-292]	;nxval
	mov	dx,WORD PTR [bp-290]
	mov	WORD PTR _ps[bx+8],ax
	mov	WORD PTR _ps[bx+10],dx
; Line 427
	mov	ax,53
	imul	WORD PTR [bp-36]	;cnt
	cwd	
	mov	cx,WORD PTR [bp-300]	;nyval
	mov	si,WORD PTR [bp-298]
	sub	cx,ax
	sbb	si,dx
	mov	WORD PTR _ps[bx+12],cx
	mov	WORD PTR _ps[bx+14],si
; Line 428
	mov	ax,WORD PTR [bp-304]	;nzval
	mov	WORD PTR _ps[bx+6],ax
; Line 429
$I1494:
; Line 431
	mov	ax,46
	imul	WORD PTR [bp-36]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	jne	$I1495
; Line 432
	push	WORD PTR [bp-36]	;cnt
	push	WORD PTR _bv[bx+38]
	call	_KeepPlaneOnCarrier
	add	sp,4
; Line 433
; Line 434
$I1495:
	mov	ax,40
	imul	WORD PTR [bp-36]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
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
	mov	WORD PTR _ps[bx+2],ax
; Line 435
	mov	ax,WORD PTR _ps[bx+12]
	mov	dx,WORD PTR _ps[bx+14]
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
	mov	WORD PTR _ps[bx+4],ax
; Line 436
	cmp	WORD PTR [bp-24],0	;otherplane2
	jl	$I1498
	cmp	WORD PTR [bp-24],70	;otherplane2
	jge	$I1498
; Line 437
	mov	ax,40
	imul	WORD PTR [bp-24]	;otherplane2
	mov	si,ax
	push	WORD PTR _ps[si+22]
	mov	si,bx
	call	_IsBoat
	add	sp,2
	or	ax,ax
	je	$I1498
; Line 438
	mov	ax,-1
	sub	ax,WORD PTR [bp-24]	;otherplane2
	mov	WORD PTR _ps[si],ax
; Line 439
; Line 440
$I1498:
; Line 441
; Line 442
	inc	WORD PTR [bp-36]	;cnt
$F1488:
	cmp	WORD PTR [bp-36],70	;cnt
	jl	$JCC2225
	jmp	$FB1490
$JCC2225:
; Line 404
	mov	ax,40
	imul	WORD PTR [bp-36]	;cnt
	mov	bx,ax
	cmp	WORD PTR _ps[bx+10],-1
	jg	$I1498
	jl	$L20004
	cmp	WORD PTR _ps[bx+8],-1
	ja	$I1498
$L20004:
; Line 408
	mov	ax,WORD PTR _ps[bx+12]
	mov	WORD PTR [bp-22],ax	;otherplane
	push	ax
	mov	si,bx
	call	_GetPlaneOrgNum
	add	sp,2
	mov	WORD PTR [bp-24],ax	;otherplane2
; Line 409
	lea	ax,WORD PTR [bp-304]	;nzval
	push	ax
	lea	cx,WORD PTR [bp-300]	;nyval
	push	cx
	lea	dx,WORD PTR [bp-292]	;nxval
	push	dx
	push	WORD PTR [bp-22]	;otherplane
	call	_GetPlanePointXYZ
	add	sp,8
; Line 410
	cmp	WORD PTR _ps[si+8],-2
	jne	$I1492
	cmp	WORD PTR _ps[si+10],-1
	jne	$I1492
; Line 412
	mov	ax,46
	imul	WORD PTR [bp-36]	;cnt
	mov	bx,ax
	mov	bx,WORD PTR _bv[bx+14]
	inc	bx
	mov	WORD PTR [bp-332],bx	;firstwp
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _aiwaypoints[bx]
	mov	dx,WORD PTR _aiwaypoints[bx+2]
	mov	WORD PTR [bp-336],ax	;txval
	mov	WORD PTR [bp-334],dx
; Line 413
	add	WORD PTR [bp-292],ax	;nxval
	adc	WORD PTR [bp-290],dx
; Line 414
	mov	ax,WORD PTR _aiwaypoints[bx+4]
	mov	dx,WORD PTR _aiwaypoints[bx+6]
	mov	WORD PTR [bp-6],ax	;tyval
	mov	WORD PTR [bp-4],dx
; Line 415
	add	WORD PTR [bp-300],ax	;nyval
	adc	WORD PTR [bp-298],dx
; Line 416
	mov	ax,WORD PTR _aiwaypoints[bx+8]
	mov	WORD PTR [bp-18],ax	;tzval
; Line 417
	add	WORD PTR [bp-304],ax	;nzval
; Line 418
; Line 420
$I1492:
	cmp	WORD PTR [bp-304],0	;nzval
	je	$JCC2402
	jmp	$I1493
$JCC2402:
; Line 421
	mov	ax,40
	imul	WORD PTR [bp-36]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR [bp-292]	;nxval
	mov	dx,WORD PTR [bp-290]
	mov	WORD PTR _ps[bx+8],ax
	mov	WORD PTR _ps[bx+10],dx
; Line 422
	mov	ax,WORD PTR [bp-300]	;nyval
	mov	dx,WORD PTR [bp-298]
	mov	WORD PTR _ps[bx+12],ax
	mov	WORD PTR _ps[bx+14],dx
; Line 423
	mov	WORD PTR _ps[bx+6],66
; Line 424
; Line 425
	jmp	$I1494
$FB1490:
; Line 444
	cmp	WORD PTR _PxLng+2,-1
	jle	$JCC2461
	jmp	$I1499
$JCC2461:
	jl	$L20005
	cmp	WORD PTR _PxLng,-1
	jbe	$JCC2473
	jmp	$I1499
$JCC2473:
$L20005:
; Line 446
	mov	ax,WORD PTR _PyLng
	mov	WORD PTR [bp-22],ax	;otherplane
	push	ax
	call	_GetPlaneOrgNum
	add	sp,2
	mov	WORD PTR [bp-24],ax	;otherplane2
; Line 447
	lea	ax,WORD PTR [bp-304]	;nzval
	push	ax
	lea	cx,WORD PTR [bp-300]	;nyval
	push	cx
	lea	dx,WORD PTR [bp-292]	;nxval
	push	dx
	push	WORD PTR [bp-22]	;otherplane
	call	_GetPlanePointXYZ
	add	sp,8
; Line 448
	cmp	WORD PTR _PxLng,-2
	jne	$I1500
	cmp	WORD PTR _PxLng+2,-1
	jne	$I1500
; Line 450
	mov	cl,3
	mov	bx,WORD PTR _OurPath
	shl	bx,cl
	mov	bx,WORD PTR _aipaths[bx+4]
	inc	bx
	mov	WORD PTR [bp-332],bx	;firstwp
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _aiwaypoints[bx]
	mov	dx,WORD PTR _aiwaypoints[bx+2]
	add	WORD PTR [bp-292],ax	;nxval
	adc	WORD PTR [bp-290],dx
; Line 451
	mov	ax,WORD PTR _aiwaypoints[bx+4]
	mov	dx,WORD PTR _aiwaypoints[bx+6]
	add	WORD PTR [bp-300],ax	;nyval
	adc	WORD PTR [bp-298],dx
; Line 452
	mov	ax,WORD PTR _aiwaypoints[bx+8]
	add	WORD PTR [bp-304],ax	;nzval
; Line 453
; Line 454
$I1500:
	mov	ax,WORD PTR [bp-292]	;nxval
	mov	dx,WORD PTR [bp-290]
	mov	WORD PTR _PxLng,ax
	mov	WORD PTR _PxLng+2,dx
; Line 455
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR [bp-300]	;nyval
	sbb	dx,WORD PTR [bp-298]
	mov	WORD PTR _PyLng,ax
	mov	WORD PTR _PyLng+2,dx
; Line 457
	cmp	WORD PTR [bp-24],0	;otherplane2
	jge	$JCC2640
	jmp	$I1503
$JCC2640:
	cmp	WORD PTR [bp-24],70	;otherplane2
	jl	$JCC2649
	jmp	$I1503
$JCC2649:
; Line 458
	mov	ax,40
	imul	WORD PTR [bp-24]	;otherplane2
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR _OurHead,ax
; Line 459
	cmp	WORD PTR _ps[bx+6],66
	jle	$I1502
; Line 460
	mov	ax,WORD PTR _ps[bx+6]
	add	ax,66
	mov	WORD PTR _Alt,ax
; Line 461
$I1502:
	mov	ax,40
	imul	WORD PTR [bp-24]	;otherplane2
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	mov	si,ax
	call	_IsBoat
	add	sp,2
	or	ax,ax
	je	$I1503
; Line 462
	mov	ax,WORD PTR [bp-24]	;otherplane2
	mov	WORD PTR _whichourcarr,ax
; Line 463
	mov	cx,WORD PTR _ps[si+8]
	mov	dx,WORD PTR _ps[si+10]
	mov	WORD PTR _wps+4,cx
	mov	WORD PTR _wps+6,dx
; Line 464
	mov	bx,WORD PTR _ps[si+12]
	mov	di,WORD PTR _ps[si+14]
	mov	WORD PTR _wps+8,bx
	mov	WORD PTR _wps+10,di
; Line 465
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
	mov	WORD PTR _wps,cx
; Line 466
	sar	di,1
	rcr	bx,1
	sar	di,1
	rcr	bx,1
	sar	di,1
	rcr	bx,1
	sar	di,1
	rcr	bx,1
	sar	di,1
	rcr	bx,1
	mov	WORD PTR _wps+2,bx
; Line 467
	push	ax
	call	_UpdateOurCarrier
	add	sp,2
; Line 468
; Line 469
$I1503:
; Line 470
	mov	ax,WORD PTR _Alt
	shl	ax,1
	shl	ax,1
	mov	WORD PTR _OurAlt,ax
; Line 471
; Line 473
$I1499:
	cmp	WORD PTR _whichourcarr,-999
	je	$JCC2819
	jmp	$I1508
$JCC2819:
; Line 475
	mov	ax,WORD PTR _OurPath
	mov	WORD PTR [bp-12],ax	;tpath
	or	ax,ax
	jge	$JCC2832
	jmp	$I1508
$JCC2832:
; Line 476
	mov	bx,ax
	mov	cl,3
	shl	bx,cl
	mov	ax,WORD PTR _aipaths[bx+4]
	add	ax,WORD PTR _aipaths[bx+6]
	dec	ax
	mov	WORD PTR [bp-332],ax	;firstwp
; Line 477
	mov	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jle	$JCC2873
	jmp	$I1508
$JCC2873:
	jl	$L20006
	cmp	WORD PTR _aiwaypoints[bx],-1
	jbe	$JCC2885
	jmp	$I1508
$JCC2885:
$L20006:
; Line 480
	push	WORD PTR _aiwaypoints[bx+4]
	call	_GetPlaneOrgNum
	add	sp,2
	mov	WORD PTR [bp-24],ax	;otherplane2
	or	ax,ax
	jl	$I1508
	cmp	ax,70
	jge	$I1508
; Line 481
	mov	cx,40
	imul	cx
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	mov	si,ax
	call	_IsBoat
	add	sp,2
	or	ax,ax
	je	$I1508
; Line 482
	mov	ax,WORD PTR [bp-24]	;otherplane2
	mov	WORD PTR _whichourcarr,ax
; Line 483
	mov	cx,WORD PTR _ps[si+8]
	mov	dx,WORD PTR _ps[si+10]
	mov	WORD PTR _wps+4,cx
	mov	WORD PTR _wps+6,dx
; Line 484
	mov	bx,WORD PTR _ps[si+12]
	mov	di,WORD PTR _ps[si+14]
	mov	WORD PTR _wps+8,bx
	mov	WORD PTR _wps+10,di
; Line 485
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
	mov	WORD PTR _wps,cx
; Line 486
	sar	di,1
	rcr	bx,1
	sar	di,1
	rcr	bx,1
	sar	di,1
	rcr	bx,1
	sar	di,1
	rcr	bx,1
	sar	di,1
	rcr	bx,1
	mov	WORD PTR _wps+2,bx
; Line 487
	push	ax
	call	_UpdateOurCarrier
	add	sp,2
; Line 488
; Line 489
$I1508:
; Line 490
; Line 491
; Line 492
; Line 494
	cmp	WORD PTR _whichourcarr,-999
	jne	$I1509
; Line 495
	mov	ax,WORD PTR _NPLANES
	mov	WORD PTR [bp-202],ax	;cnt2
	jmp	SHORT $F1510
	nop	
$FC1511:
; Line 496
	mov	ax,40
	imul	WORD PTR [bp-202]	;cnt2
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,2
	je	$I1514
	test	cl,1
	je	$I1514
	test	ch,4
	je	$I1514
; Line 498
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	WORD PTR [bp-40],bx	;tempplane
	mov	WORD PTR [bp-38],es
	cmp	WORD PTR es:[bx+38],60
	jne	$I1514
; Line 499
	mov	ax,WORD PTR [bp-202]	;cnt2
	mov	WORD PTR _whichourcarr,ax
; Line 500
; Line 501
$I1514:
; Line 502
	inc	WORD PTR [bp-202]	;cnt2
$F1510:
	cmp	WORD PTR [bp-202],70	;cnt2
	jl	$FC1511
; Line 503
; Line 505
$I1509:
	mov	WORD PTR [bp-202],0	;cnt2
$FC1516:
; Line 507
	mov	ax,46
	imul	WORD PTR [bp-202]	;cnt2
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+12]
	cbw	
	mov	WORD PTR [bp-12],ax	;tpath
	or	ax,ax
	jl	$I1521
; Line 508
	mov	bx,ax
	mov	cl,3
	shl	bx,cl
	mov	ax,WORD PTR _aipaths[bx+4]
	add	ax,WORD PTR _aipaths[bx+6]
	dec	ax
	mov	WORD PTR [bp-332],ax	;firstwp
; Line 509
	mov	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	WORD PTR _aiwaypoints[bx+2],-1
	jg	$I1521
	jl	$L20007
	cmp	WORD PTR _aiwaypoints[bx],-1
	ja	$I1521
$L20007:
; Line 512
	push	WORD PTR _aiwaypoints[bx+4]
	call	_GetPlaneOrgNum
	add	sp,2
	mov	WORD PTR [bp-24],ax	;otherplane2
	or	ax,ax
	jl	$I1521
	cmp	ax,70
	jge	$I1521
; Line 513
	mov	cx,40
	imul	cx
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_IsBoat
	add	sp,2
	or	ax,ax
	je	$I1521
; Line 514
	mov	ax,40
	imul	WORD PTR [bp-202]	;cnt2
	mov	bx,ax
	mov	ax,-1
	sub	ax,WORD PTR [bp-24]	;otherplane2
	mov	WORD PTR _ps[bx],ax
	mov	ax,40
	imul	WORD PTR [bp-202]	;cnt2
; Line 515
; Line 516
$I1521:
; Line 517
; Line 518
; Line 527
	inc	WORD PTR [bp-202]	;cnt2
	cmp	WORD PTR [bp-202],70	;cnt2
	jge	$JCC3272
	jmp	$FC1516
$JCC3272:
; Line 531
	push	WORD PTR [bp-10]	;File
	call	_fclose
	add	sp,2
; Line 533
	mov	ax,50
	push	ax
	call	_MissileAdd
	add	sp,2
; Line 535
	test	BYTE PTR _Status+1,16
	je	$I1523
	cmp	WORD PTR _ENEMYNODIE,0
	je	$I1523
	cmp	WORD PTR _KnockItOffStatus,0
	je	$I1523
; Line 536
	mov	ax,78
	push	ax
	call	_Speech
	add	sp,2
; Line 538
$I1523:
	mov	ax,1
; Line 539
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_LoadScottMission	ENDP
; Line 743
	PUBLIC	_AddGroundTarget
_AddGroundTarget	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	radarnum = -6
;	tempradar = -4
;	cnt = 86
;	one_object = 4
; Line 744
	mov	WORD PTR [bp-6],27	;radarnum
; Line 747
	cmp	WORD PTR _NGTARGETS,60
	jl	$I1530
; Line 748
	mov	ax,OFFSET DGROUP:$SG1531
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 749
	mov	ax,10
	push	ax
	mov	cx,OFFSET DGROUP:_ntmp
	push	cx
	push	WORD PTR _NGTARGETS
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 750
	mov	ax,OFFSET DGROUP:$SG1533
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 751
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	mov	ax,60
$L20016:
	push	ax
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 752
	mov	ax,1
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 753
	mov	sp,bp
	pop	bp
	ret	
; Line 754
; Line 755
	nop	
$I1530:
	mov	ax,WORD PTR [bp+50]
	mov	dx,WORD PTR [bp+52]
	add	ax,2048
	adc	dx,0
	mov	bx,WORD PTR _NGTARGETS
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	shl	bx,1
	mov	WORD PTR _gt[bx],ax
	mov	WORD PTR _gt[bx+2],dx
; Line 756
	mov	ax,WORD PTR [bp+54]
	mov	dx,WORD PTR [bp+56]
	add	ax,2048
	adc	dx,0
	mov	WORD PTR _gt[bx+4],ax
	mov	WORD PTR _gt[bx+6],dx
; Line 757
	mov	ax,WORD PTR [bp+86]	;cnt
	mov	WORD PTR _gt[bx+8],ax
; Line 758
	mov	WORD PTR _gt[bx+10],8193
; Line 760
	cmp	WORD PTR [bp+48],0
	jne	$I1534
; Line 761
	mov	WORD PTR _gt[bx+10],9217
; Line 762
; Line 763
	jmp	SHORT $I1536
	nop	
$I1534:
	cmp	WORD PTR [bp+48],1
	jne	$I1536
; Line 764
	mov	bx,WORD PTR _NGTARGETS
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	or	BYTE PTR _gt[bx+11],1
; Line 765
; Line 767
$I1536:
	lea	ax,WORD PTR [bp+10]
	push	ax
	mov	ax,OFFSET DGROUP:$SG1539
	push	ax
	call	_strcmp
	add	sp,4
	or	ax,ax
	je	$I1538
	cmp	WORD PTR [bp+6],15
	jne	$I1537
$I1538:
; Line 768
	mov	WORD PTR [bp-6],1	;radarnum
; Line 769
	jmp	$I1564
	nop	
$I1537:
	lea	ax,WORD PTR [bp+10]
	push	ax
	mov	ax,OFFSET DGROUP:$SG1543
	push	ax
	call	_strcmp
	add	sp,4
	or	ax,ax
	je	$I1542
	cmp	WORD PTR [bp+6],16
	jne	$I1541
$I1542:
; Line 770
	mov	WORD PTR [bp-6],2	;radarnum
; Line 771
	jmp	$I1564
$I1541:
	lea	ax,WORD PTR [bp+10]
	push	ax
	mov	ax,OFFSET DGROUP:$SG1547
	push	ax
	call	_strcmp
	add	sp,4
	or	ax,ax
	je	$I1546
	cmp	WORD PTR [bp+6],17
	jne	$I1545
$I1546:
; Line 772
	mov	WORD PTR [bp-6],3	;radarnum
; Line 773
	jmp	$I1564
$I1545:
	lea	ax,WORD PTR [bp+10]
	push	ax
	mov	ax,OFFSET DGROUP:$SG1551
	push	ax
	call	_strcmp
	add	sp,4
	or	ax,ax
	je	$I1550
	cmp	WORD PTR [bp+6],18
	jne	$I1549
$I1550:
; Line 774
	mov	WORD PTR [bp-6],4	;radarnum
; Line 775
	jmp	SHORT $I1564
	nop	
$I1549:
	lea	ax,WORD PTR [bp+10]
	push	ax
	mov	ax,OFFSET DGROUP:$SG1555
	push	ax
	call	_strcmp
	add	sp,4
	or	ax,ax
	je	$I1554
	cmp	WORD PTR [bp+6],22
	jne	$I1553
$I1554:
; Line 776
	mov	WORD PTR [bp-6],12	;radarnum
; Line 777
	jmp	SHORT $I1564
	nop	
$I1553:
	lea	ax,WORD PTR [bp+10]
	push	ax
	mov	ax,OFFSET DGROUP:$SG1559
	push	ax
	call	_strcmp
	add	sp,4
	or	ax,ax
	je	$I1558
	cmp	WORD PTR [bp+6],23
	jne	$I1557
$I1558:
; Line 778
	mov	WORD PTR [bp-6],13	;radarnum
; Line 779
	jmp	SHORT $I1564
	nop	
$I1557:
	lea	ax,WORD PTR [bp+10]
	push	ax
	mov	ax,OFFSET DGROUP:$SG1563
	push	ax
	call	_strcmp
	add	sp,4
	or	ax,ax
	je	$I1562
	cmp	WORD PTR [bp+6],24
	jne	$I1561
$I1562:
; Line 780
	mov	WORD PTR [bp-6],47	;radarnum
; Line 781
	jmp	SHORT $I1564
	nop	
$I1561:
	cmp	WORD PTR [bp+6],19
	jne	$I1565
; Line 782
	mov	WORD PTR [bp-6],27	;radarnum
; Line 783
$I1564:
; Line 790
	inc	WORD PTR _NGTARGETS
; Line 792
	push	WORD PTR [bp-6]	;radarnum
	call	_RadarAdd
	add	sp,2
	or	ax,ax
	jne	$I1569
; Line 793
	mov	sp,bp
	pop	bp
	ret	
$I1565:
; Line 784
	cmp	WORD PTR [bp+6],21
	jne	$I1567
; Line 785
	mov	bx,WORD PTR _NGTARGETS
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	and	BYTE PTR _gt[bx+11],223
; Line 786
; Line 787
$I1567:
	inc	WORD PTR _NGTARGETS
; Line 788
	mov	sp,bp
	pop	bp
	ret	
; Line 789
; Line 795
	nop	
$I1569:
	cmp	WORD PTR _NRADAR,40
	jl	$I1570
; Line 796
	mov	ax,OFFSET DGROUP:$SG1571
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 797
	mov	ax,10
	push	ax
	mov	cx,OFFSET DGROUP:_ntmp
	push	cx
	push	WORD PTR _NRADAR
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 798
	mov	ax,OFFSET DGROUP:$SG1572
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 799
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	mov	ax,40
	jmp	$L20016
; Line 802
; Line 803
$I1570:
; Line 804
	push	WORD PTR [bp-6]	;radarnum
	call	_GetRadarPtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	push	WORD PTR es:[bx+16]
	call	_MissileAdd
	add	sp,2
	or	ax,ax
	jne	$JCC3963
	jmp	$EX1527
$JCC3963:
; Line 807
	mov	ax,WORD PTR [bp+50]
	mov	dx,WORD PTR [bp+52]
	add	ax,2048
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
	mov	bx,WORD PTR _NRADAR
	mov	cx,bx
	shl	bx,1
	shl	bx,1
	add	bx,cx
	shl	bx,1
	mov	WORD PTR _Rdrs[bx],ax
; Line 808
	mov	ax,WORD PTR [bp+54]
	mov	dx,WORD PTR [bp+56]
	add	ax,2048
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
	mov	WORD PTR _Rdrs[bx+2],ax
; Line 809
	mov	al,BYTE PTR [bp-6]	;radarnum
	mov	BYTE PTR _Rdrs[bx+4],al
; Line 810
	cmp	WORD PTR [bp+6],19
	jne	$I1574
; Line 811
	mov	WORD PTR _Rdrs[bx+6],1
; Line 812
	jmp	SHORT $I1575
	nop	
$I1574:
; Line 813
	mov	bx,WORD PTR _NRADAR
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	WORD PTR _Rdrs[bx+6],0
$I1575:
; Line 814
	cmp	WORD PTR [bp+48],0
	jne	$I1576
; Line 815
	mov	bx,WORD PTR _NRADAR
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	or	BYTE PTR _Rdrs[bx+7],4
; Line 816
; Line 817
	jmp	SHORT $I1578
	nop	
$I1576:
	cmp	WORD PTR [bp+48],1
	jne	$I1578
; Line 818
	mov	bx,WORD PTR _NRADAR
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	or	BYTE PTR _Rdrs[bx+7],1
; Line 819
; Line 820
$I1578:
	inc	WORD PTR _NRADAR
; Line 821
$EX1527:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AddGroundTarget	ENDP
_TEXT	ENDS
END
