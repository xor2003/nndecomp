;	Static Name Aliases
;
	TITLE   C:\BOATS.C
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
PUBLIC  _junktime
EXTRN	_AIGoHome:NEAR
EXTRN	_Langle:NEAR
EXTRN	_GetPlanePtr:NEAR
EXTRN	_GetTargADP:NEAR
EXTRN	_sinX:NEAR
EXTRN	_cosX:NEAR
EXTRN	_Ready5:NEAR
EXTRN	_JustPutHere:NEAR
EXTRN	_UpdateI:NEAR
EXTRN	_StartASmoke:NEAR
EXTRN	_LFlyTo:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_GetSquadLeader:NEAR
EXTRN	_SARWait:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_GetBehaviorLeader:NEAR
EXTRN	_AICarrierLand:NEAR
EXTRN	__aNlmul:NEAR
EXTRN	_IsLand:NEAR
EXTRN	_sinXL:NEAR
EXTRN	_cosXL:NEAR
EXTRN	_KeepPlaneOnCarrier:NEAR
EXTRN	_FriendStatus:NEAR
EXTRN	_rng2:NEAR
EXTRN	_GetLastPosition:NEAR
EXTRN	_search:NEAR
EXTRN	_FriendMatchType:NEAR
EXTRN	_abs:NEAR
EXTRN	_ChangeGroupBehavior:NEAR
EXTRN	_SARCAP1:NEAR
EXTRN	_CloseGuy:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_ptype:DWORD
EXTRN	_planecnt:WORD
EXTRN	_wps:BYTE
EXTRN	_droll:WORD
EXTRN	_FrameRate:WORD
EXTRN	_Gtime:WORD
EXTRN	_tempvar:WORD
EXTRN	_aiwaypoints:BYTE
EXTRN	_trs:BYTE
EXTRN	_Fticks:WORD
EXTRN	_Speedy:WORD
EXTRN	_FPARAMS:BYTE
EXTRN	_carrier:BYTE
_BSS      SEGMENT
COMM NEAR	_whichourcarr:	BYTE:	 2
COMM NEAR	_boatnum:	BYTE:	 2
_BSS      ENDS
EXTRN	_NPLANES:WORD
EXTRN	_firstbehaveshow:WORD
EXTRN	_ps:BYTE
EXTRN	_bv:BYTE
EXTRN	_Px:WORD
EXTRN	_ailoc:BYTE
EXTRN	_Py:WORD
EXTRN	_LASTPLANE:WORD
EXTRN	_GLowDroll:WORD
EXTRN	_FIRST_ENEMY_TRACE:WORD
EXTRN	_TSpeed:WORD
EXTRN	_Rtime:WORD
EXTRN	_landingstatus:WORD
_DATA      SEGMENT
_junktime	DW	0fc19H
_DATA      ENDS
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
; Line 24
; Line 109
_TEXT      ENDS
CONST      SEGMENT
$T20001	DW SEG _carrier 
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_doboats
_doboats	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__aNchkstk
;	i = -10
;	maxrollval = -6
;	psi = -14
;	cdx = -20
;	cdy = -4
;	orgbasespeed = -8
;	z = -12
;	n = -16
; Line 120
	mov	ax,WORD PTR _LASTPLANE
	mov	WORD PTR [bp-10],ax	;i
	mov	cx,40
	imul	cx
	add	ax,OFFSET _ps
	jmp	$F1380
$I1385:
; Line 144
	mov	WORD PTR _droll,0
$I1386:
; Line 146
	mov	ax,46
	imul	WORD PTR [bp-10]	;i
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AIGoHome
	jne	$I1387
; Line 147
	mov	WORD PTR _droll,0
; Line 149
$I1387:
	mov	ax,46
	imul	WORD PTR [bp-10]	;i
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],128
	je	$I1388
; Line 150
	mov	cx,2
	mov	ax,WORD PTR _droll
	cwd	
	idiv	cx
	mov	WORD PTR _droll,ax
; Line 152
$I1388:
	les	bx,DWORD PTR _ptype
	mov	ah,BYTE PTR es:[bx+12]
	shl	ah,1
	sub	al,al
	push	ax
	neg	ax
	push	ax
	push	WORD PTR _droll
	call	_rng2
	add	sp,6
	mov	WORD PTR _droll,ax
; Line 156
	mov	ax,40
	imul	WORD PTR _boatnum
	mov	bx,ax
	and	BYTE PTR _ps[bx+24],239
; Line 158
	mov	ax,40
	imul	WORD PTR [bp-10]	;i
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],32
	je	$I1390
; Line 159
	mov	ax,46
	imul	WORD PTR [bp-10]	;i
	mov	bx,ax
	mov	ax,WORD PTR [bp-8]	;orgbasespeed
	mov	WORD PTR _bv[bx+18],ax
; Line 161
$I1390:
	call	_AvoidLand
; Line 163
	push	WORD PTR [bp-10]	;i
	call	_UpdateBoatHeadPitchRoll
	add	sp,2
; Line 165
	push	WORD PTR [bp-10]	;i
	call	_UpdateBoatSpeedAndPosition
	add	sp,2
; Line 167
	mov	ax,WORD PTR _Rtime
	mov	cx,WORD PTR _FrameRate
	shl	cx,1
	shl	cx,1
	cwd	
	idiv	cx
	mov	al,BYTE PTR [bp-10]	;i
	and	ax,3
	mov	cx,dx
	imul	WORD PTR _FrameRate
	cmp	ax,cx
	jne	$I1392
; Line 168
	mov	ax,40
	imul	WORD PTR _boatnum
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],32
	jne	$I1392
; Line 170
	call	_search
; Line 171
; Line 172
$I1392:
; Line 174
	mov	ax,46
	imul	WORD PTR [bp-10]	;i
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	jne	$I1394
	les	bx,DWORD PTR _ptype
	cmp	WORD PTR es:[bx+20],0
	je	$I1394
; Line 175
	call	_CheckBoatGunFiring
; Line 176
; Line 178
$I1394:
	mov	ax,WORD PTR [bp-10]	;i
	cmp	WORD PTR _whichourcarr,ax
	jne	$FC1381
; Line 183
	mov	es,WORD PTR $T20001
	mov	cx,WORD PTR es:_carrier
	mov	dx,WORD PTR es:_carrier+2
	mov	WORD PTR [bp-20],cx	;cdx
	mov	WORD PTR [bp-18],dx
; Line 184
	mov	cx,WORD PTR es:_carrier+8
	mov	dx,WORD PTR es:_carrier+10
	mov	WORD PTR [bp-4],cx	;cdy
	mov	WORD PTR [bp-2],dx
; Line 185
	push	ax
	call	_UpdateOurCarrier
	add	sp,2
; Line 188
	mov	es,WORD PTR $T20001
	mov	ax,WORD PTR es:_carrier+8
	mov	dx,WORD PTR es:_carrier+10
	sub	ax,WORD PTR [bp-4]	;cdy
	sbb	dx,WORD PTR [bp-2]
	mov	WORD PTR [bp-4],ax	;cdy
	mov	WORD PTR [bp-2],dx
	push	dx
	push	ax
	mov	ax,WORD PTR es:_carrier
	mov	dx,WORD PTR es:_carrier+2
	sub	ax,WORD PTR [bp-20]	;cdx
	sbb	dx,WORD PTR [bp-18]
	mov	WORD PTR [bp-20],ax	;cdx
	mov	WORD PTR [bp-18],dx
	push	dx
	push	ax
	push	WORD PTR [bp-10]	;i
	call	_UpdateAIsOnCarrier
	add	sp,10
; Line 189
; Line 191
	jmp	SHORT $FC1381
$I1384:
; Line 192
	mov	ax,40
	jmp	SHORT $L20006
	nop	
$I1383:
; Line 196
	mov	ax,cx
$L20006:
	imul	WORD PTR [bp-10]	;i
	mov	bx,ax
	mov	WORD PTR _ps[bx+26],0
; Line 197
; Line 198
$FC1381:
	inc	WORD PTR [bp-10]	;i
$F1380:
	cmp	WORD PTR [bp-10],70	;i
	jge	$FB1382
; Line 121
	mov	ax,WORD PTR [bp-10]	;i
	mov	WORD PTR _boatnum,ax
; Line 122
	mov	WORD PTR _planecnt,ax
; Line 124
	mov	cx,40
	imul	cx
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],1
	je	$I1383
; Line 125
	push	WORD PTR [bp-10]	;i
	call	_UpdateI
	add	sp,2
; Line 129
	mov	ax,40
	imul	WORD PTR _boatnum
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR _ptype,ax
	mov	WORD PTR _ptype+2,dx
; Line 132
	mov	ax,40
	imul	WORD PTR _boatnum
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],2
	je	$I1384
; Line 134
	mov	ax,46
	imul	WORD PTR [bp-10]	;i
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
	mov	WORD PTR [bp-8],ax	;orgbasespeed
; Line 141
	mov	al,BYTE PTR [bp-10]	;i
	xor	al,BYTE PTR _Rtime
	test	al,7
	je	$JCC492
	jmp	$I1385
$JCC492:
; Line 142
	call	WORD PTR _bv[bx]
; Line 143
	jmp	$I1386
$FB1382:
; Line 199
	cmp	WORD PTR _tempvar,0
	je	$I1398
; Line 200
	add	WORD PTR _firstbehaveshow,4
; Line 201
$I1398:
	cmp	WORD PTR _firstbehaveshow,70
	jl	$I1399
; Line 202
	mov	WORD PTR _firstbehaveshow,0
; Line 203
$I1399:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_doboats	ENDP
; Line 207
	PUBLIC	_UpdateBoatHeadPitchRoll
_UpdateBoatHeadPitchRoll	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	si
;	n = -6
;	fdroll = -2
;	troll = -4
;	bnum = 4
; Line 215
	mov	ax,40
	imul	WORD PTR [bp+4]	;bnum
	mov	bx,ax
	mov	ax,WORD PTR _droll
	mov	cl,3
	sar	ax,cl
	cwd	
	idiv	WORD PTR _FrameRate
	add	WORD PTR _ps[bx+16],ax
; Line 217
	mov	ax,WORD PTR _whichourcarr
	cmp	WORD PTR [bp+4],ax	;bnum
	jne	$I1405
; Line 218
	mov	WORD PTR _ps[bx+16],0
; Line 220
$I1405:
	mov	ax,40
	imul	WORD PTR [bp+4]	;bnum
	mov	bx,ax
	push	WORD PTR _ps[bx+18]
	mov	si,ax
	call	_abs
	add	sp,2
	cmp	ax,16384
	jle	$I1406
; Line 221
	add	BYTE PTR _ps[si+17],128
; Line 222
	add	BYTE PTR _ps[si+21],128
; Line 223
	mov	ax,-32768
	sub	ax,WORD PTR _ps[si+18]
	mov	WORD PTR _ps[si+18],ax
; Line 224
; Line 225
$I1406:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_UpdateBoatHeadPitchRoll	ENDP
; Line 228
	PUBLIC	_UpdateBoatSpeedAndPosition
_UpdateBoatSpeedAndPosition	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,36
	call	__aNchkstk
	push	di
	push	si
;	a = -2
;	spd = -8
;	Gspd = -32
;	dx = -20
;	dy = -28
;	spd2 = -12
;	speed2 = -4
;	tspd = -16
;	precval = -24
;	precval2 = -36
;	bnum = 4
; Line 238
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;bnum
	shl	bx,cl
	push	WORD PTR _ailoc[bx+2]
	push	WORD PTR _ailoc[bx]
	call	__aNldiv
	mov	cx,ax
	mov	ax,40
	mov	bx,dx
	imul	WORD PTR [bp+4]	;bnum
	mov	si,ax
	cmp	cx,WORD PTR _ps[si+8]
	jne	$L20003
	cmp	bx,WORD PTR _ps[si+10]
	je	$I1419
$L20003:
; Line 239
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;bnum
	mov	bx,ax
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	si,ax
	call	__aNlmul
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;bnum
	shl	bx,cl
	mov	WORD PTR _ailoc[bx],ax
	mov	WORD PTR _ailoc[bx+2],dx
; Line 240
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
; Line 241
; Line 243
$I1419:
	mov	ax,46
	imul	WORD PTR [bp+4]	;bnum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],64
	je	$I1422
; Line 244
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	cwd	
	sub	ax,dx
	sar	ax,1
	cmp	ax,WORD PTR _bv[bx+18]
	jge	$I1422
; Line 245
	mov	WORD PTR _bv[bx+18],ax
; Line 246
$I1422:
; Line 248
	mov	ax,46
	imul	WORD PTR [bp+4]	;bnum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+18],0
	jge	$I1423
; Line 249
	mov	WORD PTR _bv[bx+18],0
; Line 251
$I1423:
; Line 252
	mov	ax,46
	imul	WORD PTR [bp+4]	;bnum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
	cwd	
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;bnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+18]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,-32768
	neg	ax
	sub	dx,dx
	push	dx
	push	ax
	mov	si,bx
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
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR _boatnum
	mov	bx,ax
	mov	WORD PTR _ps[bx+26],cx
; Line 254
	cmp	WORD PTR _Speedy,1
	je	$JCC925
	jmp	$I1424
$JCC925:
; Line 256
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
	mov	ax,27
	imul	WORD PTR _ps[si+26]
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
	mov	WORD PTR [bp-16],ax	;tspd
	mov	WORD PTR [bp-14],dx
; Line 257
	mov	ax,27
	imul	WORD PTR _ps[si+26]
	mov	cl,6
	sar	ax,cl
	imul	WORD PTR _Fticks
	mov	cx,60
	cwd	
	idiv	cx
; Line 258
	push	WORD PTR [bp-14]
	push	WORD PTR [bp-16]	;tspd
	push	WORD PTR _ps[si+18]
	call	_cosXL
	add	sp,6
	mov	WORD PTR [bp-32],ax	;Gspd
	mov	WORD PTR [bp-30],dx
; Line 259
	push	dx
	push	ax
	push	WORD PTR _ps[si+16]
	call	_sinXL
	add	sp,6
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;bnum
	shl	bx,cl
	add	WORD PTR _ailoc[bx],ax
	adc	WORD PTR _ailoc[bx+2],dx
; Line 260
	push	WORD PTR [bp-30]
	push	WORD PTR [bp-32]	;Gspd
	push	WORD PTR _ps[si+16]
	mov	di,bx
	call	_cosXL
	add	sp,6
	sub	WORD PTR _ailoc[di+4],ax
	sbb	WORD PTR _ailoc[di+6],dx
; Line 261
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ailoc[di+2]
	push	WORD PTR _ailoc[di]
	call	__aNldiv
	mov	WORD PTR _ps[si+8],ax
	mov	WORD PTR _ps[si+10],dx
; Line 262
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ailoc[di+6]
	push	WORD PTR _ailoc[di+4]
	call	__aNldiv
	mov	WORD PTR _ps[si+12],ax
	mov	WORD PTR _ps[si+14],dx
; Line 264
; Line 265
	jmp	SHORT $I1425
$I1424:
; Line 266
	mov	ax,60
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _Fticks
	cwd	
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;bnum
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
; Line 267
	push	dx
	push	ax
	push	WORD PTR _ps[si+18]
	call	_cosXL
	add	sp,6
	mov	WORD PTR [bp-32],ax	;Gspd
	mov	WORD PTR [bp-30],dx
; Line 268
	push	dx
	push	ax
	push	WORD PTR _ps[si+16]
	call	_sinXL
	add	sp,6
	add	WORD PTR _ps[si+8],ax
	adc	WORD PTR _ps[si+10],dx
; Line 269
	push	WORD PTR [bp-30]
	push	WORD PTR [bp-32]	;Gspd
	push	WORD PTR _ps[si+16]
	call	_cosXL
	add	sp,6
	sub	WORD PTR _ps[si+12],ax
	sbb	WORD PTR _ps[si+14],dx
; Line 271
$I1425:
; Line 273
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;bnum
	mov	bx,ax
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	si,ax
	call	__aNlmul
	add	ax,50
	adc	dx,0
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;bnum
	shl	bx,cl
	mov	WORD PTR _ailoc[bx],ax
	mov	WORD PTR _ailoc[bx+2],dx
; Line 274
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
; Line 275
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
; Line 276
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
; Line 279
	mov	ax,46
	imul	WORD PTR [bp+4]	;bnum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+26],0
	je	$I1429
	mov	ax,WORD PTR _Gtime
	cmp	WORD PTR _bv[bx+22],ax
	jle	$I1429
; Line 281
	test	BYTE PTR _Rtime,15
	jne	$I1427
; Line 282
	mov	ax,2
	push	ax
	mov	ax,8
	push	ax
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	push	WORD PTR _ps[si+6]
	push	WORD PTR _ps[si+10]
	push	WORD PTR _ps[si+8]
	call	_StartASmoke
	add	sp,14
; Line 283
; Line 284
$I1427:
	test	BYTE PTR _Rtime,31
	jne	$I1429
; Line 285
	mov	ax,35
	push	ax
	mov	ax,3
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;bnum
	mov	bx,ax
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	call	_StartASmoke
	add	sp,14
; Line 286
; Line 287
$I1429:
; Line 289
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_UpdateBoatSpeedAndPosition	ENDP
; Line 293
	PUBLIC	_IsBoat
_IsBoat	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	tempplane = -4
;	itemid = 4
; Line 299
	push	WORD PTR [bp+4]	;itemid
	call	_GetPlanePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	cmp	WORD PTR es:[bx+38],60
	je	$I1434
	cmp	WORD PTR es:[bx+38],70
	jne	$I1433
$I1434:
; Line 300
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 301
; Line 302
	nop	
$I1433:
	sub	ax,ax
; Line 303
	mov	sp,bp
	pop	bp
	ret	

_IsBoat	ENDP
; Line 307
	PUBLIC	_UpdateOurCarrier
_UpdateOurCarrier	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	di
	push	si
;	cnt = -2
;	boatnum = 4
; Line 310
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;boatnum
	shl	bx,cl
	mov	ax,WORD PTR _ailoc[bx]
	mov	dx,WORD PTR _ailoc[bx+2]
	mov	es,WORD PTR $T20001
	mov	WORD PTR es:_carrier,ax
	mov	WORD PTR es:_carrier+2,dx
; Line 311
	mov	cx,WORD PTR _ailoc[bx+4]
	mov	si,WORD PTR _ailoc[bx+6]
	mov	WORD PTR es:_carrier+8,cx
	mov	WORD PTR es:_carrier+10,si
; Line 312
	sub	bx,bx
	mov	WORD PTR es:_carrier+6,bx
	mov	WORD PTR es:_carrier+4,bx
; Line 314
	test	BYTE PTR _landingstatus,1
	jne	$I1438
; Line 315
	mov	bx,100
	sub	di,di
	push	di
	push	bx
	push	dx
	push	ax
	mov	di,cx
	call	__aNldiv
	mov	WORD PTR _wps+4,ax
	mov	WORD PTR _wps+6,dx
; Line 316
	mov	cx,100
	sub	bx,bx
	push	bx
	push	cx
	push	si
	push	di
	mov	si,ax
	mov	di,dx
	call	__aNldiv
	mov	WORD PTR _wps+8,ax
	mov	WORD PTR _wps+10,dx
; Line 317
	sar	di,1
	rcr	si,1
	sar	di,1
	rcr	si,1
	sar	di,1
	rcr	si,1
	sar	di,1
	rcr	si,1
	sar	di,1
	rcr	si,1
	mov	WORD PTR _wps,si
; Line 318
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
; Line 319
; Line 327
$I1438:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_UpdateOurCarrier	ENDP
; Line 330
	PUBLIC	_UpdateAIsOnCarrier
_UpdateAIsOnCarrier	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	di
	push	si
;	cnt = -2
;	cdy = 10
;	cdx = 6
;	boatnum = 4
; Line 333
	mov	WORD PTR [bp-2],0	;cnt
	jmp	$F1444
	nop	
$I1450:
	mov	ax,46
	imul	WORD PTR [bp-2]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx+14],0
	jl	$I1453
; Line 344
	mov	si,WORD PTR _bv[bx+14]
	mov	ax,si
	shl	si,1
	add	si,ax
	shl	si,1
	add	si,ax
	shl	si,1
	cmp	WORD PTR _aiwaypoints[si],-1
	je	$JCC1830
	jmp	$I1458
$JCC1830:
	cmp	WORD PTR _aiwaypoints[si+2],-1
$L20008:
	je	$JCC1840
	jmp	$I1458
$JCC1840:
; Line 345
$L20007:
	push	WORD PTR [bp-2]	;cnt
	push	WORD PTR _bv[bx+38]
	call	_KeepPlaneOnCarrier
	add	sp,4
; Line 346
; Line 347
; Line 348
	jmp	$I1458
	nop	
$I1453:
	mov	ax,46
	imul	WORD PTR [bp-2]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _SARCAP1
	jmp	SHORT $L20008
$I1447:
; Line 356
	mov	ax,40
	imul	WORD PTR [bp-2]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	jne	$JCC1894
	jmp	$I1458
$JCC1894:
	test	cl,2
	jne	$JCC1902
	jmp	$I1458
$JCC1902:
	mov	ax,46
	imul	WORD PTR [bp-2]	;cnt
	mov	si,ax
	cmp	WORD PTR _bv[si],OFFSET _AICarrierLand
	je	$JCC1921
	jmp	$I1458
$JCC1921:
	cmp	WORD PTR _bv[si+38],1
	jl	$JCC1931
	jmp	$I1458
$JCC1931:
; Line 357
	mov	ax,WORD PTR [bp+6]	;cdx
	mov	dx,WORD PTR [bp+8]
	mov	cl,3
	mov	si,WORD PTR [bp-2]	;cnt
	shl	si,cl
	add	WORD PTR _ailoc[si],ax
	adc	WORD PTR _ailoc[si+2],dx
; Line 358
	mov	ax,WORD PTR [bp+10]	;cdy
	mov	dx,WORD PTR [bp+12]
	add	WORD PTR _ailoc[si+4],ax
	adc	WORD PTR _ailoc[si+6],dx
; Line 359
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ailoc[si+2]
	push	WORD PTR _ailoc[si]
	mov	di,bx
	call	__aNldiv
	mov	WORD PTR _ps[di+8],ax
	mov	WORD PTR _ps[di+10],dx
; Line 360
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ailoc[si+6]
	push	WORD PTR _ailoc[si+4]
	call	__aNldiv
	mov	WORD PTR _ps[di+12],ax
	mov	WORD PTR _ps[di+14],dx
; Line 361
	mov	ax,WORD PTR _ps[di+8]
	mov	dx,WORD PTR _ps[di+10]
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
	mov	WORD PTR _ps[di+2],ax
; Line 362
	mov	ax,WORD PTR _ps[di+12]
	mov	dx,WORD PTR _ps[di+14]
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
	mov	WORD PTR _ps[di+4],ax
; Line 363
; Line 364
$I1458:
	inc	WORD PTR [bp-2]	;cnt
$F1444:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-2],ax	;cnt
	jl	$JCC2108
	jmp	$FB1446
$JCC2108:
; Line 336
	mov	ax,40
	imul	WORD PTR [bp-2]	;cnt
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	jne	$JCC2129
	jmp	$I1447
$JCC2129:
	test	cl,2
	jne	$JCC2137
	jmp	$I1447
$JCC2137:
	cmp	WORD PTR _ps[bx],0
	jl	$JCC2147
	jmp	$I1447
$JCC2147:
	mov	ax,46
	imul	WORD PTR [bp-2]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _Ready5
	je	$I1448
	cmp	WORD PTR _bv[bx],OFFSET _SARWait
	je	$I1448
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$I1449
	cmp	WORD PTR _bv[bx+38],-3
	jle	$I1448
$I1449:
	mov	ax,40
	imul	WORD PTR [bp-2]	;cnt
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],128
	jne	$JCC2204
	jmp	$I1447
$JCC2204:
	cmp	WORD PTR _ps[bx+26],1
	jle	$JCC2214
	jmp	$I1447
$JCC2214:
$I1448:
; Line 340
	mov	ax,46
	imul	WORD PTR [bp-2]	;cnt
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	je	$JCC2233
	jmp	$I1450
$JCC2233:
	jmp	$L20007
	nop	
$FB1446:
; Line 365
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_UpdateAIsOnCarrier	ENDP
; Line 368
	PUBLIC	_CheckBoatGunFiring
_CheckBoatGunFiring	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,46
	call	__aNchkstk
	push	di
	push	si
;	lx = -8
;	ly = -12
;	ltangle = -16
;	dxl = -20
;	dyl = -22
;	friendval = -30
;	tdistl = -4
;	tanglel = -14
;	tpitchl = -18
;	dbulpitch = -46
;	dbulhead = -26
;	nn = -34
;	tspd = -32
;	othertarget = -24
;	dxb = -40
;	dyb = -44
;	tpitchb = -38
;	tangleb = -36
;	enemyalt = -42
;	tdistb = -28
;	tdistnm = -2
; Line 381
	test	BYTE PTR _Rtime,3
	je	$JCC2264
	jmp	$I1487
$JCC2264:
; Line 384
	mov	ax,46
	imul	WORD PTR _boatnum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+10],-1
	jne	$I1482
; Line 385
	mov	ax,40
	imul	WORD PTR _boatnum
	mov	bx,ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-20],ax	;dxl
; Line 386
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-22],ax	;dyl
; Line 387
	mov	ax,WORD PTR _FPARAMS
	mov	dx,WORD PTR _FPARAMS+2
	mov	cl,3
	mov	bx,WORD PTR _boatnum
	shl	bx,cl
	sub	ax,WORD PTR _ailoc[bx]
	sbb	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-8],ax	;lx
	mov	WORD PTR [bp-6],dx
; Line 388
	mov	ax,WORD PTR _FPARAMS+8
	mov	dx,WORD PTR _FPARAMS+10
	sub	ax,WORD PTR _ailoc[bx+4]
	sbb	dx,WORD PTR _ailoc[bx+6]
	mov	WORD PTR [bp-12],ax	;ly
	mov	WORD PTR [bp-10],dx
; Line 389
	mov	WORD PTR [bp-30],1024	;friendval
; Line 390
; Line 391
	jmp	$I1483
$I1482:
; Line 392
	mov	ax,46
	imul	WORD PTR _boatnum
	mov	bx,ax
	mov	ax,40
	imul	WORD PTR _bv[bx+10]
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],2
	jne	$JCC2395
	jmp	$I1487
$JCC2395:
; Line 394
	mov	ax,40
	imul	WORD PTR _boatnum
	mov	bx,ax
	mov	ax,46
	imul	WORD PTR _boatnum
	mov	si,ax
	mov	ax,40
	imul	WORD PTR _bv[si+10]
	mov	di,ax
	mov	ax,WORD PTR _ps[di+2]
	sub	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR [bp-20],ax	;dxl
; Line 395
	mov	ax,WORD PTR _ps[di+4]
	sub	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR [bp-22],ax	;dyl
; Line 396
	mov	cl,3
	mov	bx,WORD PTR _bv[si+10]
	mov	ax,bx
	shl	bx,cl
	mov	dx,WORD PTR _ailoc[bx]
	mov	si,WORD PTR _ailoc[bx+2]
	mov	di,WORD PTR _boatnum
	shl	di,cl
	sub	dx,WORD PTR _ailoc[di]
	sbb	si,WORD PTR _ailoc[di+2]
	mov	WORD PTR [bp-8],dx	;lx
	mov	WORD PTR [bp-6],si
; Line 397
	mov	cx,WORD PTR _ailoc[bx+4]
	mov	dx,WORD PTR _ailoc[bx+6]
	sub	cx,WORD PTR _ailoc[di+4]
	sbb	dx,WORD PTR _ailoc[di+6]
	mov	WORD PTR [bp-12],cx	;ly
	mov	WORD PTR [bp-10],dx
; Line 398
	push	ax
	call	_FriendStatus
	add	sp,2
	mov	WORD PTR [bp-30],ax	;friendval
; Line 399
$I1483:
; Line 401
	sub	ax,ax
	push	ax
	lea	cx,WORD PTR [bp-42]	;enemyalt
	push	cx
	lea	cx,WORD PTR [bp-2]	;tdistnm
	push	cx
	lea	cx,WORD PTR [bp-14]	;tanglel
	push	cx
	lea	cx,WORD PTR [bp-18]	;tpitchl
	push	cx
	lea	cx,WORD PTR [bp-4]	;tdistl
	push	cx
	push	WORD PTR [bp-22]	;dyl
	push	WORD PTR [bp-20]	;dxl
	push	WORD PTR _boatnum
	call	_GetTargADP
	add	sp,18
; Line 403
	mov	ax,WORD PTR [bp-12]	;ly
	mov	dx,WORD PTR [bp-10]
	neg	ax
	adc	dx,0
	neg	dx
	push	dx
	push	ax
	push	WORD PTR [bp-6]
	push	WORD PTR [bp-8]	;lx
	call	_Langle
	add	sp,8
	mov	WORD PTR [bp-16],ax	;ltangle
; Line 405
	push	WORD PTR [bp-30]	;friendval
	push	WORD PTR _boatnum
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	je	$JCC2603
	jmp	$I1487
$JCC2603:
; Line 416
	cmp	WORD PTR [bp-4],24	;tdistl
	jb	$JCC2612
	jmp	$I1487
$JCC2612:
	mov	ax,46
	imul	WORD PTR _boatnum
	mov	bx,ax
	test	BYTE PTR _bv[bx+21],2
	je	$JCC2631
	jmp	$I1487
$JCC2631:
; Line 421
	mov	al,BYTE PTR _Rtime
	and	ax,12
	sar	ax,1
	sar	ax,1
	add	ax,WORD PTR _FIRST_ENEMY_TRACE
	mov	WORD PTR [bp-34],ax	;nn
; Line 422
	cmp	WORD PTR _CloseGuy,0
	je	$I1488
	add	ax,4
	mov	WORD PTR [bp-34],ax	;nn
; Line 423
$I1488:
; Line 426
	mov	ax,WORD PTR _TSpeed
	mov	WORD PTR [bp-32],ax	;tspd
	push	ax
	push	WORD PTR [bp-18]	;tpitchl
	call	_sinX
	add	sp,4
	mov	cx,ax
	mov	ax,18
	imul	WORD PTR [bp-34]	;nn
	mov	bx,ax
	mov	WORD PTR _trs[bx+14],cx
; Line 428
	push	WORD PTR [bp-32]	;tspd
	push	WORD PTR [bp-18]	;tpitchl
	mov	si,bx
	call	_cosX
	add	sp,4
	mov	WORD PTR [bp-32],ax	;tspd
	push	ax
	push	WORD PTR [bp-16]	;ltangle
	call	_sinX
	add	sp,4
	mov	WORD PTR _trs[si+10],ax
; Line 429
	push	WORD PTR [bp-32]	;tspd
	push	WORD PTR [bp-16]	;ltangle
	call	_cosX
	add	sp,4
	neg	ax
	mov	WORD PTR _trs[si+12],ax
; Line 431
	mov	ax,40
	imul	WORD PTR _boatnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
	mov	WORD PTR _trs[si],ax
	mov	WORD PTR _trs[si+2],dx
; Line 432
	mov	ax,WORD PTR _ps[bx+12]
	mov	dx,WORD PTR _ps[bx+14]
	mov	WORD PTR _trs[si+4],ax
	mov	WORD PTR _trs[si+6],dx
; Line 433
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR _trs[si+8],ax
; Line 434
	mov	ax,WORD PTR _boatnum
	mov	WORD PTR _trs[si+16],ax
; Line 435
; Line 436
$I1487:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CheckBoatGunFiring	ENDP
; Line 439
	PUBLIC	_FormationSpeedAdjustBoat
_FormationSpeedAdjustBoat	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
	push	si
;	temphead1 = -14
;	temphead2 = -16
;	junkthis = -4
;	oldbasespeed = -18
;	whatmaneuver = -10
;	i = -12
;	tempplane = -8
;	prewing = 10
;	tdist = 8
;	relangle = 6
;	prespeed = 4
; Line 448
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR [bp-12],ax	;i
; Line 450
	cmp	WORD PTR [bp+8],15	;tdist
	jle	$I1503
; Line 451
	mov	cx,40
	imul	cx
	mov	bx,ax
	and	BYTE PTR _ps[bx+24],191
; Line 452
; Line 454
$I1503:
; Line 456
	mov	ax,40
	imul	WORD PTR [bp-12]	;i
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	es,dx
; Line 460
	mov	ax,46
	imul	WORD PTR [bp-12]	;i
; Line 461
	push	WORD PTR [bp+6]	;relangle
	mov	si,ax
	call	_abs
	add	sp,2
	cmp	ax,2048
	jg	$JCC2882
	jmp	$I1504
$JCC2882:
; Line 462
	cmp	WORD PTR [bp+8],960	;tdist
	jge	$I1505
; Line 463
	cmp	WORD PTR [bp+8],200	;tdist
	jge	$I1506
; Line 464
	mov	cl,3
	mov	ax,WORD PTR [bp+8]	;tdist
	add	ax,4
	sar	ax,cl
	sub	ax,WORD PTR [bp+4]	;prespeed
	neg	ax
	mov	WORD PTR _bv[si+18],ax
; Line 465
	jmp	SHORT $I1507
$I1506:
; Line 466
	mov	ax,46
	imul	WORD PTR [bp-12]	;i
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;prespeed
	sub	ax,10
	mov	WORD PTR _bv[bx+18],ax
$I1507:
; Line 468
	cmp	WORD PTR [bp+6],0	;relangle
	jge	$I1508
; Line 469
	mov	ax,40
	imul	WORD PTR [bp-12]	;i
	mov	bx,ax
	mov	ax,-6144
$L20010:
	sub	ax,WORD PTR _ps[bx+20]
	mov	WORD PTR _droll,ax
; Line 470
	jmp	SHORT $I1510
$I1508:
; Line 471
	mov	ax,40
	imul	WORD PTR [bp-12]	;i
	mov	bx,ax
	mov	ax,6144
	jmp	SHORT $L20010
	nop	
$I1505:
; Line 474
	mov	ax,46
	imul	WORD PTR [bp-12]	;i
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;prespeed
	mov	WORD PTR _bv[bx+18],ax
; Line 475
$I1510:
; Line 477
	mov	ax,46
	imul	WORD PTR [bp-12]	;i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+18],0
	jg	$I1511
; Line 478
	mov	WORD PTR _bv[bx+18],5
; Line 480
$I1511:
	mov	ax,46
	imul	WORD PTR [bp-12]	;i
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;prespeed
	cmp	WORD PTR _bv[bx+18],ax
	jle	$I1517
	jmp	SHORT $L20009
	nop	
$I1504:
; Line 484
	cmp	WORD PTR [bp+8],4	;tdist
	jle	$I1514
; Line 485
	cmp	WORD PTR [bp+8],200	;tdist
	jle	$I1515
; Line 486
	mov	ax,46
	imul	WORD PTR [bp-12]	;i
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	add	ax,30
	jmp	SHORT $L20009
$I1515:
; Line 489
	mov	ax,46
	imul	WORD PTR [bp-12]	;i
	mov	bx,ax
	mov	cl,3
	mov	ax,WORD PTR [bp+8]	;tdist
	sar	ax,cl
	add	ax,WORD PTR [bp+4]	;prespeed
	jmp	SHORT $L20009
$I1514:
; Line 493
	mov	ax,46
	imul	WORD PTR [bp-12]	;i
	mov	bx,ax
	mov	ax,WORD PTR [bp+4]	;prespeed
$L20009:
	mov	WORD PTR _bv[bx+18],ax
; Line 494
$I1517:
; Line 495
; Line 516
	mov	ax,46
	imul	WORD PTR [bp-12]	;i
	mov	bx,ax
	les	si,DWORD PTR _ptype
	mov	ax,WORD PTR es:[si+10]
	add	ax,30
	cmp	WORD PTR _bv[bx+18],ax
	jle	$I1518
; Line 517
	mov	WORD PTR _bv[bx+18],ax
; Line 518
$I1518:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_FormationSpeedAdjustBoat	ENDP
; Line 520
	PUBLIC	_FormationBoat
_FormationBoat	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,58
	call	__aNchkstk
	push	si
;	distkm = -30
;	tdistnm = -6
;	offangle = -4
;	ourleadalt = -46
;	dpwhead = -44
;	craps = -16
;	xval = -22
;	yval = -28
;	zval = -42
;	i = -14
;	dx = -40
;	dy = -54
;	dz = -56
;	tx = -36
;	ty = -50
;	relangle = -18
;	tangle = -24
;	tpitch = -34
;	troll = -48
;	enemyalt = -58
;	prewing = -32
;	temphead = -12
;	secplace = -2
;	prespeed = -10
;	tdist = -8
; Line 538
	mov	ax,WORD PTR _planecnt
	mov	WORD PTR [bp-14],ax	;i
	push	ax
	call	_GetSquadLeader
	add	sp,2
	mov	WORD PTR [bp-32],ax	;prewing
; Line 540
	mov	ax,46
	imul	WORD PTR [bp-14]	;i
	mov	bx,ax
	cmp	WORD PTR _bv[bx+28],14400
	jge	$I1546
; Line 541
	mov	WORD PTR _bv[bx+28],14400
; Line 543
$I1546:
	push	WORD PTR [bp-14]	;i
	call	_GetBehaviorLeader
	add	sp,2
	mov	WORD PTR [bp-32],ax	;prewing
; Line 545
	mov	ax,46
	imul	WORD PTR [bp-14]	;i
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+20]
	and	ax,15
	mov	WORD PTR [bp-2],ax	;secplace
; Line 548
	jmp	SHORT $S1547
; Line 549
$SC1551:
; Line 550
	mov	WORD PTR [bp-4],-4096	;offangle
; Line 551
	jmp	$SB1548
; Line 552
$SC1552:
; Line 553
	mov	WORD PTR [bp-4],4096	;offangle
; Line 554
	jmp	SHORT $SB1548
; Line 555
	nop	
$SC1553:
; Line 556
	mov	WORD PTR [bp-4],8192	;offangle
; Line 557
	jmp	SHORT $SB1548
; Line 558
	nop	
$SC1554:
; Line 559
	mov	WORD PTR [bp-4],-8192	;offangle
; Line 560
	jmp	SHORT $SB1548
; Line 561
	nop	
$SC1555:
; Line 562
	mov	WORD PTR [bp-4],24576	;offangle
; Line 563
	jmp	SHORT $SB1548
; Line 564
	nop	
$SC1556:
; Line 565
	mov	WORD PTR [bp-4],-24576	;offangle
; Line 566
	jmp	SHORT $SB1548
; Line 567
	nop	
$SC1557:
; Line 568
	mov	WORD PTR [bp-4],16384	;offangle
; Line 569
	jmp	SHORT $SB1548
; Line 570
	nop	
$SC1558:
; Line 571
	mov	WORD PTR [bp-4],-16384	;offangle
; Line 572
	jmp	SHORT $SB1548
; Line 573
	nop	
$SC1559:
; Line 574
	mov	WORD PTR [bp-4],-32768	;offangle
; Line 575
	jmp	SHORT $SB1548
; Line 576
	nop	
$SC1560:
; Line 577
	mov	WORD PTR [bp-4],0	;offangle
; Line 578
	jmp	SHORT $SB1548
; Line 579
	nop	
$SC1561:
; Line 580
	mov	WORD PTR [bp-4],12288	;offangle
; Line 581
	jmp	SHORT $SB1548
; Line 582
	nop	
$SD1562:
; Line 583
	mov	cl,5
	mov	ah,BYTE PTR [bp-2]	;secplace
	sub	al,al
	shl	ax,cl
	sub	ax,28672
	mov	WORD PTR [bp-4],ax	;offangle
; Line 584
	jmp	SHORT $SB1548
	nop	
$S1547:
	dec	ax
	cmp	ax,10
	ja	$SD1562
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20005[bx]
$L20005:
		DW	$SC1551
		DW	$SC1552
		DW	$SC1553
		DW	$SC1554
		DW	$SC1555
		DW	$SC1556
		DW	$SC1557
		DW	$SC1558
		DW	$SC1559
		DW	$SC1560
		DW	$SC1561
$SB1548:
; Line 587
	mov	WORD PTR [bp-10],0	;prespeed
; Line 588
	mov	ax,WORD PTR [bp-14]	;i
	cmp	WORD PTR [bp-32],ax	;prewing
	je	$I1563
; Line 589
	mov	ax,46
	imul	WORD PTR [bp-32]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+18]
	mov	WORD PTR [bp-10],ax	;prespeed
; Line 590
; Line 592
$I1563:
	mov	ax,40
	imul	WORD PTR [bp-32]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	add	ax,WORD PTR [bp-4]	;offangle
	mov	WORD PTR [bp-12],ax	;temphead
; Line 594
	mov	ax,WORD PTR [bp-14]	;i
	cmp	WORD PTR [bp-32],ax	;prewing
	jge	$I1564
; Line 595
	lea	ax,WORD PTR [bp-46]	;ourleadalt
	push	ax
	lea	ax,WORD PTR [bp-54]	;dy
	push	ax
	lea	ax,WORD PTR [bp-40]	;dx
	push	ax
	push	WORD PTR [bp-32]	;prewing
	call	_GetLastPosition
	add	sp,8
; Line 596
; Line 597
	jmp	SHORT $I1565
	nop	
$I1564:
; Line 598
	mov	cl,3
	mov	bx,WORD PTR [bp-32]	;prewing
	shl	bx,cl
	mov	ax,WORD PTR _ailoc[bx]
	mov	dx,WORD PTR _ailoc[bx+2]
	mov	WORD PTR [bp-40],ax	;dx
	mov	WORD PTR [bp-38],dx
; Line 599
	mov	ax,WORD PTR _ailoc[bx+4]
	mov	dx,WORD PTR _ailoc[bx+6]
	mov	WORD PTR [bp-54],ax	;dy
	mov	WORD PTR [bp-52],dx
; Line 600
	mov	ax,40
	imul	WORD PTR [bp-32]	;prewing
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR [bp-46],ax	;ourleadalt
; Line 601
$I1565:
; Line 603
	mov	ax,46
	imul	WORD PTR [bp-14]	;i
	mov	bx,ax
	mov	ax,100
	imul	WORD PTR _bv[bx+28]
	push	dx
	push	ax
	push	WORD PTR [bp-12]	;temphead
	mov	si,bx
	call	_sinXL
	add	sp,6
	add	WORD PTR [bp-40],ax	;dx
	adc	WORD PTR [bp-38],dx
; Line 604
	mov	ax,100
	imul	WORD PTR _bv[si+28]
	push	dx
	push	ax
	push	WORD PTR [bp-12]	;temphead
	call	_cosXL
	add	sp,6
	sub	WORD PTR [bp-54],ax	;dy
	sbb	WORD PTR [bp-52],dx
; Line 606
	cmp	WORD PTR _GLowDroll,0
	je	$I1566
; Line 607
	mov	ax,40
	imul	WORD PTR [bp-14]	;i
	mov	bx,ax
	or	BYTE PTR _ps[bx+24],128
; Line 608
	push	WORD PTR [bp-32]	;prewing
	push	WORD PTR _ps[bx+6]
	push	WORD PTR [bp-52]
	push	WORD PTR [bp-54]	;dy
	push	WORD PTR [bp-38]
	push	WORD PTR [bp-40]	;dx
	push	WORD PTR [bp-14]	;i
	call	_JustPutHere
	jmp	SHORT $L20011
; Line 610
; Line 612
	nop	
$I1566:
	push	WORD PTR [bp-10]	;prespeed
	push	WORD PTR [bp-32]	;prewing
	mov	ax,40
	imul	WORD PTR [bp-14]	;i
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR [bp-52]
	push	WORD PTR [bp-54]	;dy
	push	WORD PTR [bp-38]
	push	WORD PTR [bp-40]	;dx
	call	_LFlyTo
$L20011:
	add	sp,14
; Line 636
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_FormationBoat	ENDP
; Line 639
	PUBLIC	_AvoidLand
_AvoidLand	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 641
	cmp	WORD PTR _Gtime,3
	jge	$JCC3648
	jmp	$I1575
$JCC3648:
; Line 644
	mov	ax,WORD PTR _boatnum
	xor	ax,WORD PTR _Rtime
	mov	cx,ax
	test	al,7
	jne	$I1575
; Line 645
	mov	ax,40
	imul	WORD PTR _boatnum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],32
	je	$I1570
; Line 646
	mov	ax,46
	imul	WORD PTR _boatnum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+18],0
	jle	$I1571
; Line 647
	test	cl,15
	jne	$I1575
; Line 651
	dec	WORD PTR _bv[bx+18]
; Line 652
; Line 653
; Line 654
	ret	
	nop	
	nop	
$I1571:
; Line 655
	mov	ax,46
	imul	WORD PTR _boatnum
	mov	bx,ax
	mov	WORD PTR _bv[bx+18],0
; Line 656
	ret	
; Line 657
; Line 658
$I1570:
	mov	ax,40
	imul	WORD PTR _boatnum
	mov	bx,ax
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	call	_IsLand
	add	sp,8
	inc	ax
	je	$I1575
; Line 659
	mov	ax,40
	imul	WORD PTR _boatnum
	mov	bx,ax
	or	BYTE PTR _ps[bx+25],32
; Line 660
	sub	ax,ax
	push	ax
	push	WORD PTR _boatnum
	call	_ChangeGroupBehavior
	add	sp,4
; Line 666
; Line 667
$I1575:
; Line 669
	ret	

_AvoidLand	ENDP
_TEXT	ENDS
END
