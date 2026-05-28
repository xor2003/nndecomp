;	Static Name Aliases
;
	TITLE   C:\RADARS.C
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
EXTRN	_GetMissilePtr:NEAR
EXTRN	_InterceptControl:NEAR
EXTRN	_CheckTailAspect:NEAR
EXTRN	_GetRadarPtr:NEAR
EXTRN	_FindEmptyMissileSlot2:NEAR
EXTRN	_GetRadarGTNum:NEAR
EXTRN	_rng:NEAR
EXTRN	_LogIt:NEAR
EXTRN	_CloseEnoughFor:NEAR
EXTRN	_NoAccel:NEAR
EXTRN	_rnd:NEAR
EXTRN	_xydist:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_Sound:NEAR
EXTRN	_FriendMatchType:NEAR
EXTRN	_Message:NEAR
EXTRN	_Speech:NEAR
EXTRN	_ARCTAN:NEAR
EXTRN	_TEWS_SPOTTED:NEAR
EXTRN	_tempgotcha:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_AWG9_SNIFF:WORD
EXTRN	_Damaged:WORD
EXTRN	_Diff:WORD
EXTRN	_Night:WORD
EXTRN	_FrameRate:WORD
EXTRN	_Gtime:WORD
EXTRN	_ss:BYTE
EXTRN	_NRADAR:WORD
EXTRN	_timetargetplayer:WORD
EXTRN	_NPLANES:WORD
EXTRN	_Rdrs:BYTE
EXTRN	_Px:WORD
EXTRN	_ps:BYTE
EXTRN	_Py:WORD
EXTRN	_Alt:WORD
EXTRN	_detected:WORD
EXTRN	_xlast:BYTE
EXTRN	_ylast:BYTE
EXTRN	_AWG9_REALITY_LEVEL:WORD
EXTRN	_zlast:BYTE
EXTRN	_Rtime:WORD
EXTRN	_JAMMER:BYTE
EXTRN	_FTicks:WORD
_BSS      SEGMENT
COMM NEAR	_CloseGuy:	BYTE:	 2
COMM NEAR	_DMAX9:	BYTE:	 2
COMM NEAR	_LastSpike:	BYTE:	 2
COMM NEAR	_LastMud:	BYTE:	 2
_BSS      ENDS
_DATA      SEGMENT
$SG690	DB	'Singer!',  00H
$SG698	DB	'Spike!',  00H
$SG715	DB	'Singer Launch!',  00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 7
; Line 19
; Line 9
; Line 10
; Line 11
; Line 12
; Line 13
; Line 14
; Line 15
; Line 16
; Line 17
; Line 49
	PUBLIC	_doradar
_doradar	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	i = -4
;	r = -2
; Line 53
	cmp	WORD PTR _LastSpike,0
	je	$I649
	mov	ax,WORD PTR _FTicks
	sub	WORD PTR _LastSpike,ax
; Line 54
$I649:
	cmp	WORD PTR _LastMud,0
	je	$I650
	mov	ax,WORD PTR _FTicks
	sub	WORD PTR _LastMud,ax
; Line 62
$I650:
	mov	WORD PTR [bp-4],0	;i
	jmp	SHORT $F651
$I655:
	mov	bx,WORD PTR [bp-2]	;r
	cmp	WORD PTR [bx+8],0
	jne	$I657
; Line 72
	or	BYTE PTR [bx+6],2
; Line 73
	push	WORD PTR [bp-4]	;i
	call	_detect
	add	sp,2
; Line 74
; Line 75
$I657:
; Line 76
	inc	WORD PTR [bp-4]	;i
$F651:
	mov	ax,WORD PTR _NRADAR
	cmp	WORD PTR [bp-4],ax	;i
	jge	$FB653
; Line 64
	mov	bx,WORD PTR [bp-4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,OFFSET _Rdrs
	mov	WORD PTR [bp-2],bx	;r
	and	BYTE PTR [bx+6],253
; Line 65
	cmp	BYTE PTR [bx+4],0
	je	$I657
	test	BYTE PTR [bx+6],128
	jne	$I657
; Line 66
	dec	WORD PTR [bx+8]
; Line 67
	jns	$I655
; Line 69
	mov	ah,BYTE PTR _FrameRate
	shl	ah,1
	sub	al,al
	mov	bl,BYTE PTR [bx+5]
	mov	cl,4
	shr	bl,cl
	sub	bh,bh
	add	bx,32
	cwd	
	idiv	bx
	add	ax,WORD PTR [bp-4]	;i
	mov	bx,WORD PTR [bp-2]	;r
	mov	WORD PTR [bx+8],ax
; Line 70
; Line 71
	jmp	SHORT $I657
$FB653:
; Line 77
	mov	sp,bp
	pop	bp
	ret	

_doradar	ENDP
; Line 82
	PUBLIC	_detect
_detect	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,38
	call	__aNchkstk
	push	di
	push	si
;	dist = -14
;	signal = -38
;	j = -26
;	k = -30
;	angl = -12
;	a = -10
;	m = -36
;	x = -20
;	y = -24
;	targetnum = -16
;	tempradar = -8
;	tempmissile = -34
;	ldist = -4
;	gtnum = -28
;	i = 4
; Line 99
	mov	bx,WORD PTR [bp+4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	al,BYTE PTR _Rdrs[bx+4]
	cbw	
	mov	WORD PTR [bp-26],ax	;j
	push	ax
	mov	si,bx
	call	_GetRadarPtr
	add	sp,2
	mov	WORD PTR [bp-8],ax	;tempradar
	mov	WORD PTR [bp-6],dx
; Line 100
	lea	ax,WORD PTR [bp-16]	;targetnum
	push	ax
	mov	ch,BYTE PTR _Rdrs[si+7]
	and	cx,1280
	push	cx
	lea	cx,WORD PTR [bp-14]	;dist
	push	cx
	lea	cx,WORD PTR [bp-12]	;angl
	push	cx
	push	WORD PTR [bp-26]	;j
	sub	cx,cx
	push	cx
	push	WORD PTR _Rdrs[si+2]
	push	WORD PTR _Rdrs[si]
	call	_Rsignal
	add	sp,16
	mov	WORD PTR [bp-38],ax	;signal
; Line 102
	cmp	WORD PTR [bp-16],-1	;targetnum
	jge	$I677
; Line 103
$L20011:
	sub	ax,ax
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 105
	nop	
$I677:
	cmp	WORD PTR _Night,0
	jne	$I678
	cmp	WORD PTR [bp-14],2	;dist
	ja	$I678
; Line 106
	mov	ax,WORD PTR [bp-14]	;dist
	inc	ax
	mov	WORD PTR [bp-38],ax	;signal
; Line 107
	mov	bx,WORD PTR [bp+4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	BYTE PTR _Rdrs[bx+5],255
; Line 108
; Line 112
$I678:
	mov	ax,WORD PTR [bp-14]	;dist
	cmp	WORD PTR [bp-38],ax	;signal
	ja	$JCC306
	jmp	$I679
$JCC306:
; Line 113
	mov	bx,WORD PTR [bp+4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	al,BYTE PTR _Rdrs[bx+5]
	sub	ah,ah
	mov	cl,BYTE PTR _Diff
	mov	dx,5
	shl	dx,cl
	add	ax,dx
	cmp	ax,256
	jge	$I680
; Line 114
	mov	al,5
	shl	al,cl
	add	BYTE PTR _Rdrs[bx+5],al
; Line 115
	jmp	SHORT $I681
$I680:
; Line 116
	mov	bx,WORD PTR [bp+4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	BYTE PTR _Rdrs[bx+5],255
; Line 117
$I681:
; Line 119
	mov	bx,WORD PTR [bp+4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	BYTE PTR _Rdrs[bx+5],127
	ja	$JCC392
	jmp	$I682
$JCC392:
; Line 120
	mov	WORD PTR _tempgotcha,1
; Line 121
	push	WORD PTR [bp-16]	;targetnum
	mov	si,bx
	call	_gotcha
	add	sp,2
; Line 122
	mov	WORD PTR _tempgotcha,-999
; Line 123
	test	BYTE PTR _Rdrs[si+6],16
	jne	$I688
	les	bx,DWORD PTR [bp-8]	;tempradar
	cmp	WORD PTR es:[bx+14],2
	jne	$I688
; Line 124
	test	BYTE PTR _Damaged+1,64
	jne	$I688
; Line 125
	cmp	WORD PTR [bp-16],70	;targetnum
	jne	$I686
; Line 126
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,17
	push	ax
	call	_Sound
	add	sp,6
; Line 127
$I686:
	cmp	WORD PTR _CloseGuy,0
	jne	$I688
	cmp	WORD PTR _LastMud,0
	jne	$I688
; Line 128
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG690
	push	ax
	call	_Message
	add	sp,4
; Line 129
	mov	ax,14
	push	ax
	call	_Speech
	add	sp,2
; Line 130
	mov	WORD PTR _LastMud,480
; Line 131
; Line 132
$I688:
; Line 133
; Line 134
	mov	bx,WORD PTR [bp+4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	or	BYTE PTR _Rdrs[bx+6],16
; Line 135
; Line 137
$I682:
	mov	bx,WORD PTR [bp+4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	test	BYTE PTR _Rdrs[bx+6],16
	jne	$I697
	les	bx,DWORD PTR [bp-8]	;tempradar
	cmp	WORD PTR es:[bx+14],2
	jne	$I697
; Line 138
	test	BYTE PTR _Damaged+1,64
	jne	$I697
; Line 139
	cmp	WORD PTR [bp-16],70	;targetnum
	jne	$I694
; Line 140
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,17
	push	ax
	call	_Sound
	add	sp,6
; Line 141
$I694:
	cmp	WORD PTR _CloseGuy,0
	jne	$I697
; Line 142
	push	WORD PTR [bp+4]	;i
	call	_TEWS_SPOTTED
	add	sp,2
; Line 143
	mov	bx,WORD PTR [bp+4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	test	BYTE PTR _Rdrs[bx+6],4
	jne	$I697
	cmp	WORD PTR _LastSpike,0
	jne	$I697
; Line 144
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG698
	push	ax
	call	_Message
	add	sp,4
; Line 145
	mov	ax,22
	push	ax
	call	_Speech
	add	sp,2
; Line 146
	mov	WORD PTR _LastSpike,480
; Line 147
; Line 148
$I697:
; Line 149
; Line 150
; Line 152
	mov	bx,WORD PTR [bp+4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	or	BYTE PTR _Rdrs[bx+6],4
; Line 162
	les	bx,DWORD PTR [bp-8]	;tempradar
	push	WORD PTR es:[bx+16]
	call	_GetMissilePtr
	add	sp,2
	mov	WORD PTR [bp-34],ax	;tempmissile
	mov	WORD PTR [bp-32],dx
; Line 163
	cmp	WORD PTR _CloseGuy,0
	je	$L20001
	mov	ax,40
	imul	WORD PTR [bp-16]	;targetnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	jmp	SHORT $L20002
	nop	
	nop	
$L20001:
	mov	ax,WORD PTR _Alt
$L20002:
	mov	WORD PTR [bp-10],ax	;a
; Line 165
	les	bx,DWORD PTR [bp-8]	;tempradar
	cmp	WORD PTR es:[bx+16],0
	jne	$JCC736
	jmp	$L20011
$JCC736:
; Line 166
	mov	bx,WORD PTR [bp+4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	test	BYTE PTR _Rdrs[bx+6],32
	je	$JCC759
	jmp	$L20011
$JCC759:
; Line 167
	mov	bx,ax
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	cmp	BYTE PTR _Rdrs[bx+5],250
	ja	$JCC779
	jmp	$L20011
$JCC779:
; Line 169
	les	bx,DWORD PTR [bp-34]	;tempmissile
	mov	ax,WORD PTR [bp-14]	;dist
	cmp	WORD PTR es:[bx+14],ax
	jae	$JCC794
	jmp	$L20011
$JCC794:
; Line 170
	cmp	WORD PTR es:[bx+16],ax
	jbe	$JCC803
	jmp	$L20011
$JCC803:
; Line 171
	mov	ax,4
	cwd	
	push	dx
	push	ax
	mov	ax,3281
	imul	WORD PTR es:[bx+18]
	push	dx
	push	ax
	call	__aNldiv
	mov	cx,ax
	mov	ax,WORD PTR [bp-10]	;a
	mov	bx,dx
	cwd	
	cmp	bx,dx
	jg	$I704
	jge	$JCC838
	jmp	$L20011
$JCC838:
	cmp	cx,ax
	jae	$JCC845
	jmp	$L20011
$JCC845:
; Line 173
$I704:
	mov	bx,WORD PTR _CloseGuy
	shl	bx,1
	cmp	WORD PTR _JAMMER[bx],0
	je	$I705
; Line 174
	mov	ax,WORD PTR [bp+4]	;i
	add	ax,WORD PTR _Rtime
	mov	cx,10
	cwd	
	idiv	cx
	les	bx,DWORD PTR [bp-8]	;tempradar
	cmp	dx,WORD PTR es:[bx+20]
	jge	$JCC883
	jmp	$L20011
$JCC883:
; Line 175
; Line 177
$I705:
	mov	bx,WORD PTR [bp+4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _Rdrs[bx]
	add	ax,8
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
	mov	WORD PTR [bp-20],ax	;x
	mov	WORD PTR [bp-18],dx
; Line 178
	mov	cx,WORD PTR _Rdrs[bx+2]
	sub	bx,bx
	shl	cx,1
	rcl	bx,1
	shl	cx,1
	rcl	bx,1
	shl	cx,1
	rcl	bx,1
	shl	cx,1
	rcl	bx,1
	shl	cx,1
	rcl	bx,1
	mov	WORD PTR [bp-24],cx	;y
	mov	WORD PTR [bp-22],bx
; Line 180
	les	si,DWORD PTR [bp-34]	;tempmissile
	cmp	WORD PTR es:[si+22],1
	jne	$I708
	push	bx
	push	cx
	push	dx
	push	ax
	call	_CheckTailAspect
	add	sp,8
	or	ax,ax
	jne	$JCC990
	jmp	$L20011
$JCC990:
; Line 184
$I708:
; Line 187
	push	WORD PTR [bp+4]	;i
	mov	ax,20
	push	ax
	mov	ax,15
	push	ax
	call	_FindEmptyMissileSlot2
	add	sp,6
	mov	WORD PTR [bp-30],ax	;k
	inc	ax
	jne	$JCC1016
	jmp	$L20011
$JCC1016:
; Line 190
	mov	ax,44
	imul	WORD PTR [bp-30]	;k
	mov	bx,ax
	cmp	WORD PTR _ss[bx+26],0
	je	$JCC1034
	jmp	$L20011
$JCC1034:
; Line 192
	mov	cl,3
	sub	cl,BYTE PTR _Diff
	mov	al,50
	shl	al,cl
	mov	bx,WORD PTR [bp+4]	;i
	mov	cx,bx
	shl	bx,1
	shl	bx,1
	add	bx,cx
	shl	bx,1
	sub	BYTE PTR _Rdrs[bx+5],al
; Line 194
	mov	ax,44
	imul	WORD PTR [bp-30]	;k
	mov	bx,ax
	mov	ax,WORD PTR [bp-20]	;x
	mov	dx,WORD PTR [bp-18]
	mov	WORD PTR _ss[bx],ax
	mov	WORD PTR _ss[bx+2],dx
; Line 195
	mov	cx,WORD PTR [bp-24]	;y
	mov	si,WORD PTR [bp-22]
	mov	WORD PTR _ss[bx+4],cx
	mov	WORD PTR _ss[bx+6],si
; Line 196
	mov	WORD PTR _ss[bx+16],25
; Line 197
	mov	WORD PTR _ss[bx+18],1
; Line 198
	mov	di,WORD PTR [bp-12]	;angl
	mov	WORD PTR _ss[bx+20],di
; Line 199
	mov	WORD PTR _ss[bx+22],16384
; Line 200
	les	di,DWORD PTR [bp-34]	;tempmissile
	mov	ax,103
	imul	WORD PTR es:[di+14]
	mov	WORD PTR [bp-4],ax	;ldist
	mov	WORD PTR [bp-2],dx
; Line 201
	mov	WORD PTR _ss[bx+26],ax
; Line 202
	mov	ax,WORD PTR es:[di]
	mov	WORD PTR _ss[bx+28],ax
; Line 203
	mov	ax,WORD PTR [bp+4]	;i
	mov	WORD PTR _ss[bx+34],ax
; Line 204
	mov	WORD PTR _ss[bx+36],0
; Line 206
	mov	dx,WORD PTR [bp-16]	;targetnum
	mov	WORD PTR _ss[bx+38],dx
; Line 207
	mov	WORD PTR _ss[bx+40],1
; Line 208
	mov	WORD PTR _ss[bx+42],0
; Line 210
	push	ax
	call	_GetRadarGTNum
	add	sp,2
	mov	WORD PTR [bp-28],ax	;gtnum
; Line 212
	mov	ax,2
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	les	bx,DWORD PTR [bp-34]	;tempmissile
	push	WORD PTR es:[bx]
	mov	cx,-999
	push	cx
	mov	cx,1
	push	cx
	push	WORD PTR [bp-22]
	push	WORD PTR [bp-24]	;y
	push	WORD PTR [bp-18]
	push	WORD PTR [bp-20]	;x
	push	WORD PTR [bp-28]	;gtnum
	push	ax
	call	_LogIt
	add	sp,24
; Line 214
	cmp	WORD PTR _CloseGuy,0
	jne	$I714
; Line 215
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,18
	push	ax
	call	_Sound
	add	sp,6
; Line 216
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG715
	push	ax
	call	_Message
	add	sp,4
; Line 217
	mov	ax,13
	push	ax
	call	_Speech
	add	sp,2
; Line 218
; Line 220
$I714:
	mov	ax,WORD PTR [bp-24]	;y
	mov	dx,WORD PTR [bp-22]
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
	mov	ax,WORD PTR [bp-20]	;x
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
	push	ax
	mov	ax,2
	push	ax
	call	_CloseEnoughFor
	add	sp,6
	or	ax,ax
	je	$I717
; Line 221
	call	_NoAccel
; Line 223
$I717:
	les	bx,DWORD PTR [bp-8]	;tempradar
	push	WORD PTR es:[bx+18]
	call	_rnd
	add	sp,2
	or	ax,ax
	jne	$I723
; Line 224
	mov	bx,WORD PTR [bp+4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	or	BYTE PTR _Rdrs[bx+6],32
	jmp	$L20011
	nop	
$I679:
; Line 229
	mov	bx,WORD PTR [bp+4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	and	BYTE PTR _Rdrs[bx+6],235
; Line 231
	mov	al,BYTE PTR _Rdrs[bx+5]
	sub	ah,ah
	mov	cl,3
	sub	cl,BYTE PTR _Diff
	mov	dx,2
	shl	dx,cl
	cmp	ax,dx
	jl	$I722
; Line 232
	mov	al,2
	shl	al,cl
	sub	BYTE PTR _Rdrs[bx+5],al
; Line 233
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I722:
; Line 234
	mov	bx,WORD PTR [bp+4]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	BYTE PTR _Rdrs[bx+5],0
; Line 235
$I723:
; Line 237
; Line 238
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_detect	ENDP
; Line 243
	PUBLIC	_Rsignal
_Rsignal	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,30
	call	__aNchkstk
	push	si
;	dist = -14
;	dist1 = -18
;	dx = -22
;	dy = -26
;	dx1 = -24
;	dy1 = -30
;	signal = -28
;	alt = -8
;	DeadZone = -20
;	cap = -12
;	founddist = -6
;	cnt = -16
;	friendflag = -10
;	tempradar = -4
;	targetnum = 18
;	isfriend = 16
;	dst = 14
;	ang = 12
;	type = 10
;	z = 8
;	y = 6
;	x = 4
; Line 251
	mov	bx,WORD PTR [bp+18]	;targetnum
	mov	WORD PTR [bx],-999
; Line 252
	mov	WORD PTR [bp-6],0	;founddist
; Line 255
	cmp	WORD PTR [bp+16],1024	;isfriend
	je	$I747
; Line 256
	mov	WORD PTR [bp-6],1	;founddist
; Line 257
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR [bp+4]	;x
	mov	WORD PTR [bp-22],ax	;dx
; Line 258
	mov	cx,WORD PTR _Py
	sub	cx,WORD PTR [bp+6]	;y
	mov	WORD PTR [bp-26],cx	;dy
; Line 259
	push	cx
	push	ax
	call	_xydist
	add	sp,4
	mov	WORD PTR [bp-14],ax	;dist
; Line 260
	mov	WORD PTR _CloseGuy,0
; Line 261
	mov	bx,WORD PTR [bp+18]	;targetnum
	mov	WORD PTR [bx],70
; Line 262
; Line 264
$I747:
	mov	WORD PTR [bp-16],0	;cnt
	jmp	$F748
	nop	
$FC749:
; Line 265
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I754
	test	cl,2
	je	$I754
	test	cx,2080
	jne	$I754
	cmp	WORD PTR _ps[bx+26],0
	je	$I754
; Line 266
	push	WORD PTR [bp+16]	;isfriend
	push	WORD PTR [bp-16]	;cnt
	mov	si,bx
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	jne	$I754
; Line 267
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR [bp+6]	;y
	mov	WORD PTR [bp-30],ax	;dy1
	mov	cx,WORD PTR _ps[si+2]
	sub	cx,WORD PTR [bp+4]	;x
	mov	WORD PTR [bp-24],cx	;dx1
; Line 268
	push	ax
	push	cx
	call	_xydist
	add	sp,4
	cmp	ax,WORD PTR [bp-14]	;dist
	jb	$I755
	cmp	WORD PTR [bp-6],0	;founddist
	jne	$I754
$I755:
; Line 270
	mov	WORD PTR [bp-14],ax	;dist
; Line 271
	mov	ax,WORD PTR [bp-24]	;dx1
	mov	WORD PTR [bp-22],ax	;dx
; Line 272
	mov	ax,WORD PTR [bp-30]	;dy1
	mov	WORD PTR [bp-26],ax	;dy
; Line 273
	mov	ax,1
	mov	WORD PTR [bp-6],ax	;founddist
	mov	WORD PTR _CloseGuy,ax
; Line 274
	mov	ax,WORD PTR [bp-16]	;cnt
	mov	bx,WORD PTR [bp+18]	;targetnum
	mov	WORD PTR [bx],ax
; Line 275
; Line 276
$I754:
; Line 277
; Line 278
	inc	WORD PTR [bp-16]	;cnt
$F748:
	mov	ax,WORD PTR [bp-16]	;cnt
	cmp	WORD PTR _NPLANES,ax
	jle	$JCC1696
	jmp	$FC749
$JCC1696:
; Line 280
	mov	ax,825
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-14]	;dist
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
	mov	bx,WORD PTR [bp+14]	;dst
	mov	WORD PTR [bx],ax
; Line 281
	mov	ax,WORD PTR [bp-26]	;dy
	neg	ax
	push	ax
	push	WORD PTR [bp-22]	;dx
	call	_ARCTAN
	add	sp,4
	mov	bx,WORD PTR [bp+12]	;ang
	mov	WORD PTR [bx],ax
; Line 285
	push	WORD PTR [bp+10]	;type
	call	_GetRadarPtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	WORD PTR [bp-4],bx	;tempradar
	mov	WORD PTR [bp-2],es
	mov	ax,WORD PTR es:[bx+12]
	mov	WORD PTR [bp-28],ax	;signal
; Line 287
	cmp	WORD PTR [bp-6],0	;founddist
	jne	$I757
; Line 288
	mov	bx,WORD PTR [bp+18]	;targetnum
	mov	WORD PTR [bx],-999
; Line 292
$I757:
	cmp	WORD PTR [bp+8],0	;z
	je	$JCC1805
	jmp	$I761
$JCC1805:
	les	bx,DWORD PTR [bp-4]	;tempradar
	cmp	WORD PTR es:[bx+14],2
	je	$JCC1818
	jmp	$I761
$JCC1818:
; Line 293
	cmp	WORD PTR _CloseGuy,0
	je	$L20007
	mov	ax,40
	mov	bx,WORD PTR [bp+18]	;targetnum
	imul	WORD PTR [bx]
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	jmp	SHORT $L20008
$L20007:
	mov	ax,WORD PTR _Alt
$L20008:
	mov	WORD PTR [bp-8],ax	;alt
; Line 301
	cmp	WORD PTR [bp-14],475	;dist
	jae	$I759
	mov	WORD PTR [bp-14],475	;dist
; Line 302
$I759:
; Line 303
	mov	ax,8
	sub	ax,WORD PTR _Diff
	mov	cx,500
	imul	cx
	mov	WORD PTR [bp-12],ax	;cap
; Line 304
	mov	ax,WORD PTR _Diff
	add	ax,3
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-14]	;dist
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
	mov	WORD PTR [bp-20],ax	;DeadZone
	cmp	ax,WORD PTR [bp-12]	;cap
	jle	$I760
	mov	ax,WORD PTR [bp-12]	;cap
	mov	WORD PTR [bp-20],ax	;DeadZone
; Line 305
$I760:
	mov	ax,WORD PTR [bp-8]	;alt
	cmp	WORD PTR [bp-20],ax	;DeadZone
	jle	$I761
	mov	bx,WORD PTR [bp+14]	;dst
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-28],ax	;signal
; Line 306
$I761:
; Line 308
	cmp	WORD PTR _AWG9_REALITY_LEVEL,2
	jne	$I762
	cmp	WORD PTR _AWG9_SNIFF,0
	je	$I762
	cmp	WORD PTR _Diff,2
	jl	$I762
; Line 309
	mov	ax,WORD PTR [bp-28]	;signal
	shl	ax,1
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,3
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	sub	WORD PTR [bp-28],ax	;signal
; Line 310
	jmp	SHORT $I763
	nop	
$I762:
; Line 311
	mov	ax,WORD PTR _Diff
	sub	ax,3
	imul	WORD PTR [bp-28]	;signal
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,3
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	add	WORD PTR [bp-28],ax	;signal
; Line 312
$I763:
; Line 314
	mov	ax,WORD PTR [bp-28]	;signal
; Line 315
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_Rsignal	ENDP
; Line 320
	PUBLIC	_gotcha
_gotcha	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	i = -2
;	targetnum = 4
; Line 323
	mov	ah,BYTE PTR _FrameRate
	sub	al,al
	mov	WORD PTR _detected,ax
; Line 324
	mov	cl,6
	mov	ax,WORD PTR _FrameRate
	shl	ax,cl
	mov	WORD PTR _DMAX9,ax
; Line 326
	cmp	WORD PTR [bp+4],70	;targetnum
	je	$I767
; Line 327
	mov	ax,40
	imul	WORD PTR [bp+4]	;targetnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,32
	jne	$I770
	test	cl,1
	je	$I770
	test	cl,2
	jne	$I768
$I770:
; Line 328
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 329
$I768:
	mov	ax,40
	imul	WORD PTR [bp+4]	;targetnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	mov	WORD PTR _xlast+2,ax
; Line 330
	mov	ax,WORD PTR _ps[bx+4]
	mov	WORD PTR _ylast+2,ax
; Line 331
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR _zlast+2,ax
; Line 332
	push	WORD PTR [bp+4]	;targetnum
	mov	si,bx
	call	_InterceptControl
	add	sp,2
; Line 333
	mov	ax,WORD PTR _Gtime
	mov	WORD PTR _ps[si+28],ax
; Line 335
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I767:
; Line 336
	mov	ax,WORD PTR _Px
	mov	WORD PTR _xlast,ax
; Line 337
	mov	ax,WORD PTR _Py
	mov	WORD PTR _ylast,ax
; Line 338
	mov	ax,WORD PTR _Alt
	mov	WORD PTR _zlast,ax
; Line 339
	mov	ax,-1
	push	ax
	call	_InterceptControl
	add	sp,2
; Line 341
	mov	ax,WORD PTR _Gtime
	mov	WORD PTR _timetargetplayer,ax
; Line 342
; Line 346
; Line 351
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_gotcha	ENDP
; Line 357
	PUBLIC	_RsignalOne
_RsignalOne	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,26
	call	__aNchkstk
	push	si
;	dist = -12
;	dist1 = -14
;	dx = -18
;	dy = -22
;	dx1 = -20
;	dy1 = -26
;	signal = -24
;	alt = -6
;	DeadZone = -16
;	cap = -10
;	friendflag = -8
;	tempradar = -4
;	targetnum = 18
;	isfriend = 16
;	dst = 14
;	ang = 12
;	type = 10
;	z = 8
;	y = 6
;	x = 4
; Line 364
	cmp	WORD PTR [bp+18],-1	;targetnum
	jge	$I800
; Line 366
	push	WORD PTR [bp+10]	;type
	call	_GetRadarPtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	WORD PTR [bp-4],bx	;tempradar
	mov	WORD PTR [bp-2],es
	mov	ax,WORD PTR es:[bx+12]
	mov	WORD PTR [bp-24],ax	;signal
; Line 368
	add	ax,100
	mov	bx,WORD PTR [bp+14]	;dst
	mov	WORD PTR [bx],ax
; Line 369
	mov	bx,WORD PTR [bp+12]	;ang
	mov	WORD PTR [bx],0
; Line 371
$L20013:
	mov	ax,WORD PTR [bp-24]	;signal
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 372
; Line 375
	nop	
$I800:
	cmp	WORD PTR [bp+16],0	;isfriend
	jne	$I801
	cmp	WORD PTR [bp+18],-1	;targetnum
	jne	$I801
; Line 377
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR [bp+6]	;y
	mov	WORD PTR [bp-22],ax	;dy
; Line 378
	push	ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR [bp+4]	;x
	mov	WORD PTR [bp-18],ax	;dx
	push	ax
	call	_xydist
	add	sp,4
	mov	WORD PTR [bp-12],ax	;dist
; Line 379
	mov	WORD PTR _CloseGuy,0
; Line 380
; Line 382
$I801:
	cmp	WORD PTR [bp+18],0	;targetnum
	jl	$I804
; Line 384
	mov	ax,40
	imul	WORD PTR [bp+18]	;targetnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,1
	je	$I804
	test	cl,2
	je	$I804
	test	cx,2080
	jne	$I804
	cmp	WORD PTR _ps[bx+26],0
	je	$I804
; Line 385
	push	WORD PTR [bp+16]	;isfriend
	push	WORD PTR [bp+18]	;targetnum
	mov	si,bx
	call	_FriendMatchType
	add	sp,4
	or	ax,ax
	jne	$I804
; Line 386
	mov	ax,WORD PTR _ps[si+4]
	sub	ax,WORD PTR [bp+6]	;y
	mov	WORD PTR [bp-26],ax	;dy1
	mov	cx,WORD PTR _ps[si+2]
	sub	cx,WORD PTR [bp+4]	;x
	mov	WORD PTR [bp-20],cx	;dx1
; Line 387
	push	ax
	push	cx
	call	_xydist
	add	sp,4
	mov	WORD PTR [bp-12],ax	;dist
; Line 388
	mov	ax,WORD PTR [bp-20]	;dx1
	mov	WORD PTR [bp-18],ax	;dx
; Line 389
	mov	ax,WORD PTR [bp-26]	;dy1
	mov	WORD PTR [bp-22],ax	;dy
; Line 390
	mov	WORD PTR _CloseGuy,1
; Line 391
; Line 392
$I804:
; Line 393
; Line 395
	mov	ax,825
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-12]	;dist
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
	mov	bx,WORD PTR [bp+14]	;dst
	mov	WORD PTR [bx],ax
; Line 396
	mov	ax,WORD PTR [bp-22]	;dy
	neg	ax
	push	ax
	push	WORD PTR [bp-18]	;dx
	call	_ARCTAN
	add	sp,4
	mov	bx,WORD PTR [bp+12]	;ang
	mov	WORD PTR [bx],ax
; Line 398
	les	bx,DWORD PTR [bp-4]	;tempradar
	mov	ax,WORD PTR es:[bx+12]
	mov	WORD PTR [bp-24],ax	;signal
; Line 402
	cmp	WORD PTR [bp+8],0	;z
	je	$JCC2497
	jmp	$I808
$JCC2497:
	cmp	WORD PTR es:[bx+14],2
	je	$JCC2507
	jmp	$I808
$JCC2507:
; Line 403
	cmp	WORD PTR _CloseGuy,0
	je	$L20009
	mov	ax,40
	imul	WORD PTR [bp+18]	;targetnum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
	jmp	SHORT $L20010
	nop	
$L20009:
	mov	ax,WORD PTR _Alt
$L20010:
	mov	WORD PTR [bp-6],ax	;alt
; Line 411
	cmp	WORD PTR [bp-12],475	;dist
	jae	$I806
	mov	WORD PTR [bp-12],475	;dist
; Line 412
$I806:
; Line 413
	mov	ax,8
	sub	ax,WORD PTR _Diff
	mov	cx,500
	imul	cx
	mov	WORD PTR [bp-10],ax	;cap
; Line 414
	mov	ax,WORD PTR _Diff
	add	ax,3
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-12]	;dist
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
	mov	WORD PTR [bp-16],ax	;DeadZone
	cmp	ax,WORD PTR [bp-10]	;cap
	jle	$I807
	mov	ax,WORD PTR [bp-10]	;cap
	mov	WORD PTR [bp-16],ax	;DeadZone
; Line 415
$I807:
	mov	ax,WORD PTR [bp-6]	;alt
	cmp	WORD PTR [bp-16],ax	;DeadZone
	jle	$I808
	mov	bx,WORD PTR [bp+14]	;dst
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-24],ax	;signal
; Line 416
$I808:
; Line 418
	cmp	WORD PTR _AWG9_REALITY_LEVEL,2
	jne	$I809
	cmp	WORD PTR _AWG9_SNIFF,0
	je	$I809
	cmp	WORD PTR _Diff,2
	jl	$I809
; Line 419
	mov	ax,WORD PTR [bp-24]	;signal
	shl	ax,1
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,3
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	sub	WORD PTR [bp-24],ax	;signal
; Line 420
	jmp	$L20013
$I809:
; Line 421
	mov	ax,WORD PTR _Diff
	sub	ax,3
	imul	WORD PTR [bp-24]	;signal
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,3
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	add	WORD PTR [bp-24],ax	;signal
; Line 422
	jmp	$L20013
; Line 425
	nop	

_RsignalOne	ENDP
_TEXT	ENDS
END
