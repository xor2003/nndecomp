;	Static Name Aliases
;
	TITLE   C:\BULLETS.C
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
EXTRN	_AirKill:NEAR
EXTRN	_StartASmoke:NEAR
EXTRN	_Langle:NEAR
EXTRN	_sinX:NEAR
EXTRN	_labs:NEAR
EXTRN	_DrawLine:FAR
EXTRN	_strcpy:NEAR
EXTRN	_cosX:NEAR
EXTRN	_DamageMe:NEAR
EXTRN	_EngageTrain:NEAR
EXTRN	_DamageAI:NEAR
EXTRN	_TrgMul:NEAR
EXTRN	__fstrcat:NEAR
EXTRN	_LDist2D:NEAR
EXTRN	_ARCTAN:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_Dist2D:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_GetSquadLeader:NEAR
EXTRN	__aNNalshl:NEAR
EXTRN	__aNNalmul:NEAR
EXTRN	_sinXL:NEAR
EXTRN	_GetPlanePtr:NEAR
EXTRN	_GetWingName:NEAR
EXTRN	_lproject:NEAR
EXTRN	_FriendMatch:NEAR
EXTRN	_rng:NEAR
EXTRN	_LogIt:NEAR
EXTRN	_strcat:NEAR
EXTRN	_abs:NEAR
EXTRN	_Dist3D:NEAR
EXTRN	_Sound:NEAR
EXTRN	_Message:NEAR
EXTRN	_OnTheDeck:NEAR
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Txt:BYTE
EXTRN	_Rounds:WORD
EXTRN	_Diff:WORD
EXTRN	_ejected:WORD
EXTRN	_FrameRate:WORD
EXTRN	_trs:BYTE
_BSS      SEGMENT
COMM NEAR	_TargetObj:	BYTE:	 2
_BSS      ENDS
EXTRN	_PxLng:DWORD
EXTRN	_PyLng:DWORD
EXTRN	_Rp3D:WORD
EXTRN	_NPLANES:WORD
EXTRN	_OurHead:WORD
EXTRN	_OurPitch:WORD
EXTRN	_ps:BYTE
EXTRN	_Alt:WORD
EXTRN	_Rtime:WORD
EXTRN	_sx:WORD
EXTRN	_sy:WORD
EXTRN	_KEYPRINT:WORD
EXTRN	_ORDNANCE:BYTE
EXTRN	_bv:BYTE
_BSS      SEGMENT
COMM NEAR	_Firing:	BYTE:	 2
COMM NEAR	_NTRACE:	BYTE:	 2
COMM NEAR	_NTRACE2:	BYTE:	 2
COMM NEAR	_FIRST_ENEMY_TRACE:	BYTE:	 2
COMM NEAR	_LastRate:	BYTE:	 2
_BSS      ENDS
EXTRN	_DOINVISIBLE:WORD
_BSS      SEGMENT
COMM NEAR	_TSpeed:	BYTE:	 2
_BSS      ENDS
EXTRN	_FPARAMS:BYTE
EXTRN	_ENEMYNODIE:WORD
_DATA      SEGMENT
$SG1401	DB	' destroyed by ',  00H
$SG1403	DB	'wingman ',  00H
$SG1404	DB	'gunfire',  00H
$SG1409	DB	' destroyed by ',  00H
$SG1411	DB	'wingman ',  00H
$SG1412	DB	'gunfire',  00H
$SG1419	DB	'Hit by gunfire',  00H
$SG1434	DB	'OPPS! ',  00H
$SG1435	DB	'Splash ',  00H
$SG1437	DB	'!',  00H
$SG1441	DB	'(Wingman)Splash ',  00H
$SG1442	DB	'!',  00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 6
; Line 7
; Line 8
; Line 9
; Line 10
; Line 19
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
; Line 82
	PUBLIC	_InitCannonRate
_InitCannonRate	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 86
	mov	ax,16
	push	ax
	mov	ax,3
	push	ax
	mov	ax,WORD PTR _FrameRate
	mov	WORD PTR _LastRate,ax
	push	ax
	call	_rng
	add	sp,6
	mov	WORD PTR _NTRACE,ax
; Line 88
	add	ax,4
	mov	WORD PTR _NTRACE2,ax
; Line 90
	mov	ax,WORD PTR _NTRACE
	mov	WORD PTR _FIRST_ENEMY_TRACE,ax
; Line 92
	mov	cx,250
	mov	ax,6
	sub	ax,WORD PTR _Diff
	imul	cx
	cwd	
	idiv	WORD PTR _LastRate
	mov	WORD PTR _TSpeed,ax
; Line 93
	ret	

_InitCannonRate	ENDP
; Line 97
	PUBLIC	_docannon
_docannon	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	n = -6
;	i = -2
;	tspd = -4
; Line 100
	cmp	WORD PTR _KEYPRINT,7181
	jne	$I1339
	cmp	WORD PTR _Rounds,0
	jle	$I1339
	cmp	WORD PTR _ejected,0
	jne	$I1339
; Line 101
	mov	ax,1000
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,-40
	cwd	
	idiv	WORD PTR _LastRate
	add	ax,WORD PTR _Rounds
	push	ax
	call	_rng
	add	sp,6
	mov	WORD PTR _Rounds,ax
; Line 102
	sub	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,13
	push	ax
	call	_Sound
	add	sp,6
; Line 103
	mov	ax,1
	push	ax
	push	WORD PTR _OurPitch
	push	WORD PTR _OurHead
	push	WORD PTR _Alt
	sub	cx,cx
	mov	dx,16
	sub	cx,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	cx
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	call	_firecannon
	add	sp,16
; Line 104
	mov	WORD PTR _Firing,1
; Line 105
	mov	sp,bp
	pop	bp
	ret	
$I1339:
; Line 107
	mov	ax,WORD PTR _Rtime
	cwd	
	idiv	WORD PTR _NTRACE
	mov	ax,dx
	mov	cx,18
	imul	cx
	mov	bx,ax
	sub	ax,ax
	mov	WORD PTR _trs[bx+2],ax
	mov	WORD PTR _trs[bx],ax
; Line 108
	mov	WORD PTR _Firing,ax
; Line 109
; Line 110
	mov	sp,bp
	pop	bp
	ret	

_docannon	ENDP
; Line 114
	PUBLIC	_firecannon
_firecannon	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	n = -4
;	tspd = -2
;	local = 18
;	Pitch = 16
;	Head = 14
;	z = 12
;	y = 8
;	x = 4
; Line 117
	mov	ax,WORD PTR _Rtime
	cwd	
	idiv	WORD PTR _NTRACE
	mov	WORD PTR [bp-4],dx	;n
; Line 118
	cmp	WORD PTR [bp+18],0	;local
	jne	$I1352
	add	dx,WORD PTR _NTRACE
	mov	WORD PTR [bp-4],dx	;n
; Line 120
$I1352:
; Line 121
	mov	ax,WORD PTR _TSpeed
	mov	WORD PTR [bp-2],ax	;tspd
	push	ax
	push	WORD PTR [bp+16]	;Pitch
	call	_sinX
	add	sp,4
	mov	cx,ax
	mov	ax,18
	imul	WORD PTR [bp-4]	;n
	mov	bx,ax
	mov	WORD PTR _trs[bx+14],cx
; Line 124
	push	WORD PTR [bp-2]	;tspd
	push	WORD PTR [bp+16]	;Pitch
	mov	si,ax
	call	_cosX
	add	sp,4
	mov	WORD PTR [bp-2],ax	;tspd
	push	ax
	push	WORD PTR [bp+14]	;Head
	call	_sinX
	add	sp,4
	mov	WORD PTR _trs[si+10],ax
; Line 125
	push	WORD PTR [bp-2]	;tspd
	push	WORD PTR [bp+14]	;Head
	call	_cosX
	add	sp,4
	neg	ax
	mov	WORD PTR _trs[si+12],ax
; Line 127
	mov	ax,WORD PTR [bp+4]	;x
	mov	dx,WORD PTR [bp+6]
	mov	WORD PTR _trs[si],ax
	mov	WORD PTR _trs[si+2],dx
; Line 128
	mov	ax,WORD PTR [bp+8]	;y
	mov	dx,WORD PTR [bp+10]
	mov	WORD PTR _trs[si+4],ax
	mov	WORD PTR _trs[si+6],dx
; Line 129
	mov	ax,WORD PTR [bp+12]	;z
	mov	WORD PTR _trs[si+8],ax
; Line 130
	mov	WORD PTR _trs[si+16],-1
; Line 131
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_firecannon	ENDP
; Line 135
	PUBLIC	_dotracers
_dotracers	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	i = -4
;	d = -2
; Line 138
	cmp	WORD PTR _Rtime,4
	jne	$I1359
	call	_InitCannonRate
; Line 140
$I1359:
	mov	WORD PTR [bp-4],0	;i
	jmp	$F1360
$FC1361:
; Line 145
	mov	cx,18
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _trs[bx+2]
	or	ax,WORD PTR _trs[bx]
	jne	$JCC431
	jmp	$L20009
$JCC431:
; Line 146
	mov	ax,WORD PTR _trs[bx+14]
	neg	ax
	cmp	ax,WORD PTR _trs[bx+8]
	jle	$I1364
; Line 147
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _trs[bx+8]
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
	mov	si,bx
	call	__aNldiv
	mov	WORD PTR [bp-2],ax	;d
; Line 149
	push	ax
	push	WORD PTR _trs[si+10]
	call	_TrgMul
	add	sp,4
	mov	WORD PTR _trs[si+10],ax
; Line 150
	push	WORD PTR [bp-2]	;d
	push	WORD PTR _trs[si+12]
	call	_TrgMul
	add	sp,4
	mov	WORD PTR _trs[si+12],ax
; Line 151
	mov	ax,WORD PTR _trs[si+8]
	neg	ax
	mov	WORD PTR _trs[si+14],ax
; Line 152
; Line 154
$I1364:
	mov	ax,18
	imul	WORD PTR [bp-4]	;i
	mov	bx,ax
	mov	ax,WORD PTR _trs[bx+10]
	cwd	
	add	WORD PTR _trs[bx],ax
	adc	WORD PTR _trs[bx+2],dx
; Line 155
	mov	ax,WORD PTR _trs[bx+12]
	cwd	
	add	WORD PTR _trs[bx+4],ax
	adc	WORD PTR _trs[bx+6],dx
; Line 156
	mov	ax,WORD PTR _trs[bx+14]
	add	WORD PTR _trs[bx+8],ax
; Line 157
; Line 158
$L20009:
	inc	WORD PTR [bp-4]	;i
$F1360:
	mov	ax,WORD PTR [bp-4]	;i
	cmp	WORD PTR _NTRACE2,ax
	jle	$JCC596
	jmp	$FC1361
$JCC596:
; Line 159
	call	_TrackBullets
; Line 160
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_dotracers	ENDP
; Line 164
	PUBLIC	_TrackBullets
_TrackBullets	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,40
	call	__aNchkstk
	push	di
	push	si
;	size = -28
;	i = -24
;	j = -26
;	n = -36
;	r = -6
;	angl = -4
;	cnt = -8
;	dx = -30
;	dy = -34
;	targt = -2
;	tsize = -38
;	Radii = -22
;	planetemp = -12
;	src = -14
;	crashstat = -32
; Line 168
	mov	WORD PTR [bp-22],50	;Radii
	mov	WORD PTR [bp-20],25
	mov	WORD PTR [bp-18],17
	mov	WORD PTR [bp-16],13
; Line 175
	mov	si,WORD PTR _Diff
	shl	si,1
	mov	al,BYTE PTR [bp-22][si]
	mov	BYTE PTR _ORDNANCE+524,al
; Line 177
	mov	ax,WORD PTR [bp-22][si]
	add	ax,WORD PTR _TSpeed
	mov	WORD PTR [bp-38],ax	;tsize
; Line 179
	mov	WORD PTR [bp-24],0	;i
	jmp	$F1383
	nop	
$I1398:
; Line 205
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	WORD PTR [bp-14]	;src
	mov	ax,40
	imul	WORD PTR [bp-26]	;j
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR [bp-26]	;j
	mov	ax,9
	push	ax
	call	_LogIt
	add	sp,24
; Line 206
; Line 207
; Line 208
	jmp	$I1413
$I1397:
; Line 209
	push	WORD PTR [bp-26]	;j
	call	_AirKill
	add	sp,2
; Line 211
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	WORD PTR [bp-14]	;src
	mov	ax,40
	imul	WORD PTR [bp-26]	;j
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR [bp-26]	;j
	mov	ax,18
	push	ax
	call	_LogIt
	add	sp,24
; Line 212
	mov	ax,OFFSET DGROUP:$SG1409
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 213
	mov	ax,WORD PTR [bp-24]	;i
	cmp	WORD PTR _NTRACE,ax
	jg	$I1410
	mov	ax,OFFSET DGROUP:$SG1411
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 214
$I1410:
	mov	ax,OFFSET DGROUP:$SG1412
$L20010:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 215
	mov	ax,4
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 216
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	bx,ax
	sub	ax,ax
	mov	WORD PTR _trs[bx+2],ax
	mov	WORD PTR _trs[bx],ax
; Line 217
; Line 218
; Line 219
	jmp	SHORT $I1413
	nop	
$I1396:
; Line 220
	sub	ax,ax
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,-999
	push	cx
	push	WORD PTR [bp-14]	;src
	mov	ax,40
	imul	WORD PTR [bp-26]	;j
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR [bp-26]	;j
	mov	ax,9
	push	ax
	mov	si,bx
	call	_LogIt
	add	sp,24
; Line 221
	mov	ax,10
	push	ax
	sub	cx,cx
	push	cx
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	push	WORD PTR _ps[si+6]
	push	WORD PTR _ps[si+10]
	push	WORD PTR _ps[si+8]
	call	_StartASmoke
	add	sp,14
; Line 222
	sub	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,10
	push	ax
	call	_Sound
	add	sp,6
; Line 223
$I1413:
; Line 224
; Line 225
; Line 226
; Line 227
; Line 228
	inc	WORD PTR [bp-26]	;j
$F1388:
	mov	ax,WORD PTR [bp-26]	;j
	cmp	WORD PTR _NPLANES,ax
	jg	$JCC993
	jmp	$FB1423
$JCC993:
; Line 183
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	al,BYTE PTR _ps[bx+24]
	and	al,34
	cmp	al,2
	jne	$I1413
; Line 185
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	cx,ax
	add	ax,OFFSET _trs
	push	ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	si,ax
	mov	di,cx
	mov	WORD PTR [bp-40],bx
	call	_BulletDist
	add	sp,12
	mov	WORD PTR [bp-36],ax	;n
	mov	cx,WORD PTR [bp-38]	;tsize
	shl	cx,1
	cmp	ax,cx
	jge	$I1413
; Line 186
	mov	bx,WORD PTR [bp-40]
	or	BYTE PTR _ps[bx+24],16
; Line 189
	cmp	ax,WORD PTR [bp-38]	;tsize
	jge	$I1413
; Line 190
	push	WORD PTR [bp-26]	;j
	push	si
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	call	_CheckBulletBetter
	add	sp,14
	or	ax,ax
	jne	$JCC1117
	jmp	$I1413
$JCC1117:
; Line 191
	mov	ax,WORD PTR _trs[di+16]
	mov	WORD PTR [bp-14],ax	;src
; Line 192
	cmp	WORD PTR _DOINVISIBLE,0
	je	$JCC1134
	jmp	$I1396
$JCC1134:
	cmp	WORD PTR _ENEMYNODIE,0
	je	$JCC1144
	jmp	$I1396
$JCC1144:
	mov	ax,46
	imul	WORD PTR [bp-26]	;j
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _EngageTrain
	jne	$JCC1163
	jmp	$I1396
$JCC1163:
; Line 193
	test	BYTE PTR _Rtime,1
	jne	$JCC1173
	jmp	$I1397
$JCC1173:
; Line 194
	mov	bx,WORD PTR [bp-40]
	mov	al,BYTE PTR _ps[bx+24]
	and	ax,32
	mov	WORD PTR [bp-32],ax	;crashstat
; Line 195
	push	WORD PTR [bp-26]	;j
	call	_DamageAI
	add	sp,2
; Line 196
	mov	bx,WORD PTR [bp-40]
	mov	al,BYTE PTR _ps[bx+24]
	and	ax,32
	cmp	ax,WORD PTR [bp-32]	;crashstat
	jne	$JCC1213
	jmp	$I1398
$JCC1213:
; Line 197
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	WORD PTR [bp-14]	;src
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR [bp-26]	;j
	mov	ax,18
	push	ax
	call	_LogIt
	add	sp,24
; Line 198
	mov	ax,OFFSET DGROUP:$SG1401
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 199
	mov	ax,WORD PTR [bp-24]	;i
	cmp	WORD PTR _NTRACE,ax
	jg	$I1402
	mov	ax,OFFSET DGROUP:$SG1403
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 200
$I1402:
	mov	ax,OFFSET DGROUP:$SG1404
	jmp	$L20010
$I1387:
; Line 233
	mov	ax,cx
	imul	WORD PTR [bp-24]	;i
	mov	cx,ax
	add	ax,OFFSET _trs
	push	ax
	push	WORD PTR _Alt
	sub	dx,dx
	mov	bx,16
	sub	dx,WORD PTR _PyLng
	sbb	bx,WORD PTR _PyLng+2
	push	bx
	push	dx
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	mov	si,ax
	mov	di,cx
	call	_BulletDist
	add	sp,12
	mov	WORD PTR [bp-36],ax	;n
	mov	cx,WORD PTR [bp-38]	;tsize
	shl	cx,1
	cmp	ax,cx
	jl	$JCC1364
	jmp	$I1417
$JCC1364:
; Line 234
	mov	ax,-1
	push	ax
	push	si
	push	WORD PTR _Alt
	sub	cx,cx
	mov	dx,16
	sub	cx,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	cx
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	call	_CheckBulletBetter
	add	sp,14
	or	ax,ax
	je	$I1417
; Line 235
	mov	ax,OFFSET DGROUP:$SG1419
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 236
	mov	ax,4
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 237
	mov	ax,WORD PTR _trs[di+16]
	mov	WORD PTR [bp-14],ax	;src
; Line 239
	mov	ax,2
	push	ax
	call	_DamageMe
	add	sp,2
; Line 240
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	WORD PTR [bp-14]	;src
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
	mov	ax,9
	push	ax
	call	_LogIt
	add	sp,24
; Line 247
	sub	ax,ax
	mov	WORD PTR [si+2],ax
	mov	WORD PTR [si],ax
; Line 248
; Line 249
$I1417:
; Line 250
	mov	WORD PTR [bp-26],0	;j
	jmp	$F1421
$I1431:
; Line 282
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	WORD PTR [bp-14]	;src
	mov	ax,40
	imul	WORD PTR [bp-26]	;j
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR [bp-26]	;j
	mov	ax,9
	push	ax
	call	_LogIt
	add	sp,24
; Line 283
; Line 284
; Line 285
	jmp	$I1443
$I1429:
; Line 286
	push	WORD PTR [bp-26]	;j
	call	_AirKill
	add	sp,2
; Line 288
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	WORD PTR [bp-14]	;src
	mov	ax,40
	imul	WORD PTR [bp-26]	;j
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR [bp-26]	;j
	mov	ax,18
	push	ax
	mov	si,bx
	call	_LogIt
	add	sp,24
; Line 289
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	bx,ax
	push	WORD PTR _trs[bx+16]
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	je	$JCC1663
	jmp	$I1443
$JCC1663:
; Line 290
	mov	ax,OFFSET DGROUP:$SG1441
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 292
	push	WORD PTR _ps[si+22]
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-12],ax	;planetemp
	mov	WORD PTR [bp-10],dx
	inc	ax
	inc	ax
	push	dx
	push	ax
	mov	ax,OFFSET _Txt
	push	ds
	push	ax
	call	__fstrcat
	add	sp,8
; Line 293
	mov	ax,OFFSET DGROUP:$SG1442
$L20011:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 294
	mov	ax,3
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 295
; Line 296
; Line 297
; Line 298
	jmp	SHORT $I1443
	nop	
$I1428:
; Line 299
	sub	ax,ax
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,-999
	push	cx
	push	WORD PTR [bp-14]	;src
	mov	ax,40
	imul	WORD PTR [bp-26]	;j
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR [bp-26]	;j
	mov	ax,9
	push	ax
	mov	si,bx
	call	_LogIt
	add	sp,24
; Line 300
	mov	ax,10
	push	ax
	sub	cx,cx
	push	cx
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	push	WORD PTR _ps[si+6]
	push	WORD PTR _ps[si+10]
	push	WORD PTR _ps[si+8]
	call	_StartASmoke
	add	sp,14
; Line 301
	sub	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,10
	push	ax
	call	_Sound
	add	sp,6
; Line 302
$I1443:
; Line 303
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	bx,ax
	sub	ax,ax
	mov	WORD PTR _trs[bx+2],ax
	mov	WORD PTR _trs[bx],ax
; Line 304
; Line 305
$I1427:
; Line 306
; Line 307
; Line 308
	inc	WORD PTR [bp-26]	;j
$F1421:
	mov	ax,WORD PTR [bp-26]	;j
	cmp	WORD PTR _NPLANES,ax
	jg	$JCC1879
	jmp	$FB1423
$JCC1879:
; Line 251
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	al,BYTE PTR _ps[bx+24]
	and	al,34
	cmp	al,2
	jne	$I1427
; Line 253
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	cx,ax
	add	ax,OFFSET _trs
	push	ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	si,ax
	mov	di,cx
	mov	WORD PTR [bp-40],bx
	call	_BulletDist
	add	sp,12
	mov	WORD PTR [bp-36],ax	;n
	mov	cx,WORD PTR [bp-38]	;tsize
	shl	cx,1
	cmp	ax,cx
	jge	$I1427
; Line 254
	mov	bx,WORD PTR [bp-40]
	or	BYTE PTR _ps[bx+24],16
; Line 256
	cmp	ax,WORD PTR [bp-38]	;tsize
	jge	$I1427
	mov	ax,WORD PTR [bp-26]	;j
	cmp	WORD PTR _trs[di+16],ax
	je	$I1427
; Line 257
	push	ax
	push	si
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	call	_CheckBulletBetter
	add	sp,14
	or	ax,ax
	jne	$JCC2010
	jmp	$I1427
$JCC2010:
; Line 260
	mov	ax,WORD PTR _trs[di+16]
	mov	WORD PTR [bp-14],ax	;src
; Line 261
	cmp	WORD PTR _DOINVISIBLE,0
	je	$JCC2027
	jmp	$I1428
$JCC2027:
	cmp	WORD PTR _ENEMYNODIE,0
	je	$JCC2037
	jmp	$I1428
$JCC2037:
	mov	ax,46
	imul	WORD PTR [bp-26]	;j
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _EngageTrain
	jne	$JCC2056
	jmp	$I1428
$JCC2056:
; Line 262
	cmp	WORD PTR _bv[bx+2],-1
	je	$I1430
	test	BYTE PTR _Rtime,1
	jne	$JCC2073
	jmp	$I1429
$JCC2073:
$I1430:
; Line 263
	mov	ax,40
	imul	WORD PTR [bp-26]	;j
	mov	bx,ax
	mov	al,BYTE PTR _ps[bx+24]
	and	ax,32
	mov	WORD PTR [bp-32],ax	;crashstat
; Line 264
	push	WORD PTR [bp-26]	;j
	mov	si,bx
	call	_DamageAI
	add	sp,2
; Line 265
	mov	al,BYTE PTR _ps[si+24]
	and	ax,32
	cmp	ax,WORD PTR [bp-32]	;crashstat
	jne	$JCC2117
	jmp	$I1431
$JCC2117:
; Line 266
	sub	ax,ax
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,-999
	push	cx
	push	WORD PTR [bp-14]	;src
	push	WORD PTR _ps[si+6]
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	push	WORD PTR _ps[si+10]
	push	WORD PTR _ps[si+8]
	push	WORD PTR [bp-26]	;j
	mov	cx,18
	push	cx
	call	_LogIt
	add	sp,24
; Line 267
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	bx,ax
	push	WORD PTR _trs[bx+16]
	mov	di,bx
	call	_GetSquadLeader
	add	sp,2
	inc	ax
	je	$JCC2190
	jmp	$I1443
$JCC2190:
; Line 268
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR _trs[di+16]
	call	_GetWingName
	add	sp,4
; Line 271
	test	BYTE PTR _ps[si+25],4
	je	$I1433
; Line 272
	mov	ax,OFFSET DGROUP:$SG1434
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 274
$I1433:
	mov	ax,OFFSET DGROUP:$SG1435
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 276
	mov	ax,40
	imul	WORD PTR [bp-26]	;j
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-12],ax	;planetemp
	mov	WORD PTR [bp-10],dx
	inc	ax
	inc	ax
	push	dx
	push	ax
	mov	ax,OFFSET _Txt
	push	ds
	push	ax
	call	__fstrcat
	add	sp,8
; Line 277
	mov	ax,OFFSET DGROUP:$SG1437
	jmp	$L20011
	nop	
$FB1423:
; Line 309
; Line 312
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	bx,ax
	cmp	WORD PTR _trs[bx+8],0
	jne	$I1444
; Line 323
	sub	ax,ax
	mov	WORD PTR _trs[bx+2],ax
	mov	WORD PTR _trs[bx],ax
; Line 324
; Line 325
$I1444:
; Line 326
	inc	WORD PTR [bp-24]	;i
$F1383:
	mov	ax,WORD PTR [bp-24]	;i
	cmp	WORD PTR _NTRACE2,ax
	jle	$FB1385
; Line 180
	mov	cx,18
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _trs[bx+2]
	or	ax,WORD PTR _trs[bx]
	je	$I1444
; Line 181
	mov	ax,WORD PTR [bp-24]	;i
	cmp	WORD PTR _FIRST_ENEMY_TRACE,ax
	jg	$JCC2351
	jmp	$I1387
$JCC2351:
; Line 182
	mov	WORD PTR [bp-26],0	;j
	jmp	$F1388
$FB1385:
; Line 327
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_TrackBullets	ENDP
; Line 332
	PUBLIC	_DrawBullets
_DrawBullets	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	si
;	i = -2
;	ssx = -4
;	ssy = -6
; Line 335
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1450
	nop	
$L20002:
	mov	ax,92
$L20003:
	push	ax
	push	WORD PTR [bp-6]	;ssy
	push	WORD PTR [bp-4]	;ssx
	push	WORD PTR _sy
	push	WORD PTR _sx
	push	WORD PTR _Rp3D
	call	FAR PTR _DrawLine
	add	sp,12
; Line 343
; Line 344
$I1455:
; Line 345
	inc	WORD PTR [bp-2]	;i
$F1450:
	mov	ax,WORD PTR _NTRACE2
	cmp	WORD PTR [bp-2],ax	;i
	jl	$JCC2427
	jmp	$FB1452
$JCC2427:
; Line 336
	mov	ax,18
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	mov	ax,WORD PTR _trs[bx+2]
	or	ax,WORD PTR _trs[bx]
	je	$I1455
; Line 337
	push	WORD PTR _trs[bx+8]
	push	WORD PTR _trs[bx+6]
	push	WORD PTR _trs[bx+4]
	push	WORD PTR _trs[bx+2]
	push	WORD PTR _trs[bx]
	mov	si,bx
	call	_lproject
	add	sp,10
; Line 338
	mov	ax,WORD PTR _sx
	mov	WORD PTR [bp-4],ax	;ssx
	mov	ax,WORD PTR _sy
	mov	WORD PTR [bp-6],ax	;ssy
; Line 339
	mov	ax,WORD PTR _trs[si+14]
	sar	ax,1
	sar	ax,1
	add	ax,WORD PTR _trs[si+8]
	and	al,252
	push	ax
	mov	ax,WORD PTR _trs[si+12]
	sar	ax,1
	sar	ax,1
	cwd	
	add	ax,WORD PTR _trs[si+4]
	adc	dx,WORD PTR _trs[si+6]
	and	al,252
	push	dx
	push	ax
	mov	ax,WORD PTR _trs[si+10]
	sar	ax,1
	sar	ax,1
	cwd	
	add	ax,WORD PTR _trs[si]
	adc	dx,WORD PTR _trs[si+2]
	and	al,252
	push	dx
	push	ax
	call	_lproject
	add	sp,10
; Line 341
	cmp	WORD PTR _sx,-1
	jne	$JCC2558
	jmp	$I1455
$JCC2558:
	cmp	WORD PTR [bp-4],-1	;ssx
	jne	$JCC2567
	jmp	$I1455
$JCC2567:
; Line 342
	mov	ax,WORD PTR _FIRST_ENEMY_TRACE
	cmp	WORD PTR [bp-2],ax	;i
	jge	$JCC2578
	jmp	$L20002
$JCC2578:
	mov	ax,93
	jmp	$L20003
	nop	
$FB1452:
; Line 346
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DrawBullets	ENDP
; Line 350
	PUBLIC	_BulletDist
_BulletDist	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
;	dx = -4
;	dy = -8
;	dz = -10
;	t = 14
;	z = 12
;	y = 8
;	x = 4
; Line 354
	mov	ax,WORD PTR [bp+4]	;x
	mov	dx,WORD PTR [bp+6]
	mov	bx,WORD PTR [bp+14]	;t
	sub	ax,WORD PTR [bx]
	sbb	dx,WORD PTR [bx+2]
	push	dx
	push	ax
	call	_labs
	add	sp,4
	mov	WORD PTR [bp-4],ax	;dx
	mov	WORD PTR [bp-2],dx
; Line 355
	mov	ax,WORD PTR [bp+8]	;y
	mov	dx,WORD PTR [bp+10]
	mov	bx,WORD PTR [bp+14]	;t
	sub	ax,WORD PTR [bx+4]
	sbb	dx,WORD PTR [bx+6]
	push	dx
	push	ax
	call	_labs
	add	sp,4
	mov	WORD PTR [bp-8],ax	;dy
	mov	WORD PTR [bp-6],dx
; Line 358
	mov	ax,WORD PTR [bp+12]	;z
	mov	bx,WORD PTR [bp+14]	;t
	sub	ax,WORD PTR [bx+8]
	push	ax
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-10],ax	;dz
	cwd	
	add	ax,WORD PTR [bp-4]	;dx
	adc	dx,WORD PTR [bp-2]
	add	ax,WORD PTR [bp-8]	;dy
	adc	dx,WORD PTR [bp-6]
	or	dx,dx
	jl	$I1464
	jg	$L20004
	cmp	ax,23000
	jb	$I1464
$L20004:
; Line 359
	mov	ax,32767
	mov	sp,bp
	pop	bp
	ret	
$I1464:
; Line 361
	push	WORD PTR [bp-10]	;dz
	push	WORD PTR [bp-8]	;dy
	push	WORD PTR [bp-4]	;dx
	call	_Dist3D
; Line 362
; Line 363
	mov	sp,bp
	pop	bp
	ret	

_BulletDist	ENDP
; Line 367
	PUBLIC	_CheckBulletBetter
_CheckBulletBetter	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,50
	call	__aNchkstk
	push	di
	push	si
;	dx = -34
;	dy = -42
;	dz = -50
;	xydval = -24
;	xyzdval = -6
;	xyangle = -20
;	xyzpitch = -8
;	trshead = -30
;	trspitch = -2
;	trsxydist = -48
;	conewidth = -16
;	coneheight = -46
;	dwidth = -12
;	dheight = -38
;	whofired = -18
;	ptargettype = -28
;	targnum = 16
;	t = 14
;	z = 12
;	y = 8
;	x = 4
; Line 388
	mov	bx,WORD PTR [bp+14]	;t
	mov	ax,WORD PTR [bx+16]
	mov	WORD PTR [bp-18],ax	;whofired
	or	ax,ax
	jl	$I1490
; Line 391
	mov	cx,40
	imul	cx
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	WORD PTR [bp-28],bx	;ptargettype
	mov	WORD PTR [bp-26],es
	cmp	WORD PTR es:[bx+20],1
	je	$I1491
	cmp	WORD PTR es:[bx+20],3
	jne	$I1490
$I1491:
; Line 392
	mov	ax,1
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 393
$I1490:
; Line 396
	mov	ax,6
	cwd	
	mov	WORD PTR [bp-16],ax	;conewidth
	mov	WORD PTR [bp-14],dx
	mov	WORD PTR [bp-46],ax	;coneheight
	mov	WORD PTR [bp-44],dx
; Line 398
	cmp	WORD PTR [bp-18],-1	;whofired
	je	$I1492
; Line 399
	cmp	WORD PTR [bp+16],0	;targnum
	jl	$I1493
; Line 400
	mov	ax,40
	imul	WORD PTR [bp+16]	;targnum
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-28],ax	;ptargettype
	mov	WORD PTR [bp-26],dx
; Line 401
; Line 402
$I1493:
	mov	ax,WORD PTR [bp-18]	;whofired
	cmp	WORD PTR _NPLANES,ax
	jge	$I1494
; Line 403
	push	WORD PTR [bp+16]	;targnum
	push	ax
	call	_IsDeckPlane
	add	sp,4
	or	ax,ax
	je	$I1495
; Line 404
$L20013:
	sub	ax,ax
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 406
	nop	
$I1495:
	mov	al,5
	push	ax
	lea	cx,WORD PTR [bp-16]	;conewidth
	push	cx
	call	__aNNalshl
; Line 407
	mov	al,5
	jmp	SHORT $L20014
$I1494:
; Line 410
	mov	al,3
	push	ax
	lea	cx,WORD PTR [bp-16]	;conewidth
	push	cx
	call	__aNNalshl
; Line 411
	mov	al,3
$L20014:
	push	ax
	lea	ax,WORD PTR [bp-46]	;coneheight
	push	ax
	call	__aNNalshl
; Line 412
; Line 413
	cmp	WORD PTR [bp+16],0	;targnum
	jl	$I1503
; Line 414
	les	bx,DWORD PTR [bp-28]	;ptargettype
	cmp	WORD PTR es:[bx+12],2
	jge	$I1503
; Line 415
	shl	WORD PTR [bp-16],1	;conewidth
	rcl	WORD PTR [bp-14],1
; Line 416
	shl	WORD PTR [bp-46],1	;coneheight
	rcl	WORD PTR [bp-44],1
; Line 417
; Line 418
; Line 419
	jmp	SHORT $I1503
$I1492:
; Line 420
	mov	ax,40
	imul	WORD PTR [bp+16]	;targnum
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-28],ax	;ptargettype
	mov	WORD PTR [bp-26],dx
; Line 421
	cmp	WORD PTR [bp+16],0	;targnum
	jl	$I1500
; Line 422
	les	bx,DWORD PTR [bp-28]	;ptargettype
	cmp	WORD PTR es:[bx+12],2
	jge	$I1500
; Line 423
	mov	ax,5
	cwd	
	push	dx
	push	ax
	lea	cx,WORD PTR [bp-16]	;conewidth
	push	cx
	call	__aNNalmul
; Line 424
	mov	ax,5
	cwd	
	push	dx
	push	ax
	lea	ax,WORD PTR [bp-46]	;coneheight
	push	ax
	call	__aNNalmul
; Line 425
	jmp	SHORT $I1503
$I1500:
; Line 431
	mov	al,2
	push	ax
	lea	cx,WORD PTR [bp-16]	;conewidth
	push	cx
	call	__aNNalshl
; Line 432
	mov	al,2
	push	ax
	lea	ax,WORD PTR [bp-46]	;coneheight
	push	ax
	call	__aNNalshl
; Line 433
$I1503:
; Line 434
; Line 436
	mov	ax,WORD PTR [bp+4]	;x
	mov	dx,WORD PTR [bp+6]
	mov	bx,WORD PTR [bp+14]	;t
	sub	ax,WORD PTR [bx]
	sbb	dx,WORD PTR [bx+2]
	push	dx
	push	ax
	call	_labs
	add	sp,4
	mov	WORD PTR [bp-34],ax	;dx
	mov	WORD PTR [bp-32],dx
; Line 437
	mov	ax,WORD PTR [bp+8]	;y
	mov	dx,WORD PTR [bp+10]
	mov	bx,WORD PTR [bp+14]	;t
	sub	ax,WORD PTR [bx+4]
	sbb	dx,WORD PTR [bx+6]
	push	dx
	push	ax
	call	_labs
	add	sp,4
	mov	WORD PTR [bp-42],ax	;dy
	mov	WORD PTR [bp-40],dx
; Line 438
	mov	ax,WORD PTR [bp+12]	;z
	mov	bx,WORD PTR [bp+14]	;t
	sub	ax,WORD PTR [bx+8]
	push	ax
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-50],ax	;dz
; Line 440
	mov	bx,WORD PTR [bp+14]	;t
	push	WORD PTR [bx+12]
	push	WORD PTR [bx+10]
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-30],ax	;trshead
; Line 441
	mov	bx,WORD PTR [bp+14]	;t
	push	WORD PTR [bx+12]
	push	WORD PTR [bx+10]
	call	_Dist2D
	add	sp,4
	mov	WORD PTR [bp-48],ax	;trsxydist
; Line 442
	push	WORD PTR [bp-40]
	push	WORD PTR [bp-42]	;dy
	push	WORD PTR [bp-32]
	push	WORD PTR [bp-34]	;dx
	call	_LDist2D
	add	sp,8
	mov	WORD PTR [bp-24],ax	;xydval
	mov	WORD PTR [bp-22],dx
; Line 443
	mov	ax,WORD PTR [bp-42]	;dy
	mov	dx,WORD PTR [bp-40]
	neg	ax
	adc	dx,0
	neg	dx
	push	dx
	push	ax
	push	WORD PTR [bp-32]
	push	WORD PTR [bp-34]	;dx
	call	_Langle
	add	sp,8
	mov	WORD PTR [bp-20],ax	;xyangle
; Line 447
	push	WORD PTR [bp-22]
	push	WORD PTR [bp-24]	;xydval
	mov	ax,WORD PTR [bp-30]	;trshead
	sub	WORD PTR [bp-20],ax	;xyangle
	push	WORD PTR [bp-20]	;xyangle
	call	_sinXL
	add	sp,6
	mov	WORD PTR [bp-12],ax	;dwidth
	mov	WORD PTR [bp-10],dx
	push	dx
	push	ax
	call	_labs
	add	sp,4
	cmp	dx,WORD PTR [bp-14]
	jle	$JCC3242
	jmp	$L20013
$JCC3242:
	jl	$L20007
	cmp	ax,WORD PTR [bp-16]	;conewidth
	jb	$JCC3252
	jmp	$L20013
$JCC3252:
$L20007:
; Line 448
	push	WORD PTR [bp-48]	;trsxydist
	mov	bx,WORD PTR [bp+14]	;t
	push	WORD PTR [bx+14]
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-2],ax	;trspitch
; Line 449
	push	WORD PTR [bp-22]
	push	WORD PTR [bp-24]	;xydval
	mov	ax,WORD PTR [bp-50]	;dz
	cwd	
	push	dx
	push	ax
	mov	si,ax
	mov	di,dx
	call	_Langle
	add	sp,8
	mov	WORD PTR [bp-8],ax	;xyzpitch
; Line 453
	push	WORD PTR [bp-22]
	push	WORD PTR [bp-24]	;xydval
	push	di
	push	si
	call	_LDist2D
	add	sp,8
	mov	WORD PTR [bp-6],ax	;xyzdval
	mov	WORD PTR [bp-4],dx
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-2]	;trspitch
	sub	WORD PTR [bp-8],ax	;xyzpitch
	push	WORD PTR [bp-8]	;xyzpitch
	call	_sinXL
	add	sp,6
	mov	WORD PTR [bp-38],ax	;dheight
	mov	WORD PTR [bp-36],dx
	push	dx
	push	ax
	call	_labs
	add	sp,4
	cmp	dx,WORD PTR [bp-44]
	jle	$JCC3354
	jmp	$L20013
$JCC3354:
	jge	$JCC3359
	jmp	$I1491
$JCC3359:
	cmp	ax,WORD PTR [bp-46]	;coneheight
	jb	$JCC3367
	jmp	$L20013
$JCC3367:
	jmp	$I1491
	nop	

_CheckBulletBetter	ENDP
; Line 481
	PUBLIC	_IsDeckPlane
_IsDeckPlane	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	targnum = 6
;	whofired = 4
; Line 482
	push	WORD PTR [bp+6]	;targnum
	push	WORD PTR [bp+4]	;whofired
	call	_FriendMatch
	mov	sp,bp
	or	ax,ax
	jne	$I1513
; Line 483
$L20016:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 485
	nop	
$I1513:
	cmp	WORD PTR [bp+6],-1	;targnum
	jne	$I1514
; Line 486
	push	WORD PTR _FPARAMS+10
	push	WORD PTR _FPARAMS+8
	push	WORD PTR _FPARAMS+6
	push	WORD PTR _FPARAMS+4
	push	WORD PTR _FPARAMS+2
	push	WORD PTR _FPARAMS
	call	_OnTheDeck
	mov	sp,bp
	or	ax,ax
	je	$L20016
; Line 487
$L20017:
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
$I1514:
; Line 490
	mov	ax,40
	imul	WORD PTR [bp+6]	;targnum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],128
	jne	$L20017
	mov	ax,46
	imul	WORD PTR [bp+6]	;targnum
	mov	bx,ax
	cmp	WORD PTR _bv[bx+18],0
	jne	$L20016
	jmp	SHORT $L20017

_IsDeckPlane	ENDP
_TEXT	ENDS
END
