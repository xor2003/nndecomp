;	Static Name Aliases
;
;	$S923_OldTime	EQU	OldTime
;	$S929_TickAccum	EQU	TickAccum
	TITLE   C:\STEALTH.C
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
PUBLIC  _Fuel
PUBLIC  _Stores
PUBLIC  _Rounds
PUBLIC  _AutoAlt
PUBLIC  _Diff
PUBLIC  _Night
PUBLIC  _FrameRate
PUBLIC  _wps
PUBLIC  _NextWayPoint
PUBLIC  _ChangeWayPoint
PUBLIC  _NDECOY
PUBLIC  _ds
PUBLIC  _Rtime
PUBLIC  _PlaneDataList
PUBLIC  _QTime
PUBLIC  _RadarDataList
PUBLIC  _MissileDataList
PUBLIC  _QTimer
PUBLIC  _PlaneDataListCnt
PUBLIC  _FrameRate10
PUBLIC  _RadarDataListCnt
PUBLIC  _FTicks
PUBLIC  _MissileDataListCnt
PUBLIC  _AutoGearOk
PUBLIC  _detected
PUBLIC  _atarg
PUBLIC  _gtarg
PUBLIC  _OldClose
PUBLIC  _Speedy
PUBLIC  _AutoLand
PUBLIC  _nextlog
PUBLIC  _Damaged
PUBLIC  _Status
EXTRN	_GETTIME:FAR
EXTRN	_doradar:NEAR
EXTRN	_DumpLogFile:NEAR
EXTRN	_doplanes:NEAR
EXTRN	_doboats:NEAR
EXTRN	_dosams:NEAR
EXTRN	_doaaa:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_dotracers:NEAR
EXTRN	_strcat:NEAR
EXTRN	_itoa:NEAR
EXTRN	_CarrierLanding:NEAR
EXTRN	_UpdateJetSnd:NEAR
EXTRN	_xydist:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_MakeRotationMatrix:NEAR
EXTRN	_ARMT_INIT:NEAR
EXTRN	_GetHPR:NEAR
EXTRN	_MakeMatHPR:NEAR
EXTRN	_Sound:NEAR
EXTRN	_WaitTicks:NEAR
EXTRN	_GetPlanePtr:NEAR
EXTRN	_InitCannonRate:NEAR
EXTRN	_rnd:NEAR
EXTRN	_Message:NEAR
EXTRN	_InitFlightModel:NEAR
EXTRN	_Px:WORD
EXTRN	_Py:WORD
EXTRN	_Alt:WORD
EXTRN	_OurAlt:WORD
_BSS      SEGMENT
COMM NEAR	_AutoHead:	BYTE:	 2
_BSS      ENDS
EXTRN	_RadarAlt:DWORD
_BSS      SEGMENT
COMM NEAR	_ejected:	BYTE:	 2
_BSS      ENDS
EXTRN	_Tscale:WORD
EXTRN	_TickDelay:WORD
_BSS      SEGMENT
COMM NEAR	_Gtime:	BYTE:	 2
COMM NEAR	_Direction:	BYTE:	 2
COMM NEAR	_WPMode:	BYTE:	 2
_BSS      ENDS
EXTRN	_BEND:BYTE
EXTRN	_TimeOfDay:WORD
EXTRN	_FM:BYTE
_BSS      SEGMENT
COMM NEAR	_trs:	 18:	 40
_BSS      ENDS
EXTRN	_REALFLIGHT:WORD
EXTRN	_MASTER_CAUTION:WORD
_BSS      SEGMENT
COMM NEAR	_ss:	 44:	 28
COMM NEAR	_gamelog:	 32:	 32
COMM NEAR	_NRADAR:	BYTE:	 2
COMM NEAR	_NERADAR:	BYTE:	 2
COMM NEAR	_NTARGET:	BYTE:	 2
COMM NEAR	_ImHit:	BYTE:	 2
COMM NEAR	_NPLANES:	BYTE:	 2
COMM NEAR	_xlast:	 2:	 2
COMM NEAR	_ylast:	 2:	 2
COMM NEAR	_ms:	 14:	 3
COMM NEAR	_Rdrs:	 10:	 40
COMM NEAR	_chuteX:	BYTE:	 2
COMM NEAR	_ps:	 40:	 70
COMM NEAR	_chuteY:	BYTE:	 2
COMM NEAR	_zlast:	 2:	 2
COMM NEAR	_chuteZ:	BYTE:	 2
COMM NEAR	_chuteDZ:	BYTE:	 2
COMM NEAR	_MinAlt:	BYTE:	 2
_BSS      ENDS
EXTRN	_bv:BYTE
_BSS      SEGMENT
COMM NEAR	_CloseBase:	 2:	 2
_BSS      ENDS
EXTRN	_paratroopers:BYTE
_BSS      SEGMENT
COMM NEAR	_CloseDist:	 2:	 2
_BSS      ENDS
EXTRN	_FPARAMS:BYTE
EXTRN	_LLowFuelWarn:WORD
EXTRN	_RLowFuelWarn:WORD
EXTRN	_BingoFuelWarn:WORD
EXTRN	_orgPlayernum:WORD
EXTRN	_ConfigData:BYTE
EXTRN	_lastCounter:WORD
EXTRN	_OurHead:WORD
EXTRN	_TotalGameTicks:DWORD
EXTRN	_OurPitch:WORD
EXTRN	_OurRoll:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Knots:WORD
_BSS      SEGMENT
COMM NEAR	_Txt:	 1:	 80
_BSS      ENDS
EXTRN	_PxLng:DWORD
EXTRN	_PyLng:DWORD
_DATA      SEGMENT
	ORG	$+518
$SG826	DB	'(RIO) Flares exhausted',  00H
$SG828	DB	'(RIO) Chaff exhausted',  00H
$SG836	DB	'(RIO) Flare',  00H
$SG838	DB	'(RIO) Chaff',  00H
$SG841	DB	' released (',  00H
$SG843	DB	' left)',  00H
	ORG	$-606
_wps	DW	00H
	DW	00H
	DD	00H
	DD	00H
	DW	00H
	DW	00H
	DD	00H
	DD	00H
	DW	00H
	DW	00H
	DD	00H
	DD	00H
	DW	00H
	DW	00H
	DD	00H
	DD	00H
_NextWayPoint	DW	00H
_ChangeWayPoint	DW	00H
_PlaneDataList	DD	00H
_RadarDataList	DD	00H
_MissileDataList	DD	00H
_PlaneDataListCnt	DW	00H
_RadarDataListCnt	DW	00H
_MissileDataListCnt	DW	00H
_Damaged	DW	04H
_Status	DW	00H
_Fuel	DW	01388H
_Stores	DW	00H
	DW	0cH
	DW	012H
	DW	03H
_Rounds	DW	02a3H
_AutoAlt	DW	00H
_Diff	DW	01H
_Night	DW	00H
_FrameRate	DW	04H
_NDECOY	DW	01eH
_ds	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
_Rtime	DW	00H
_QTime	DW	00H
_QTimer	DW	00H
_FrameRate10	DW	028H
_FTicks	DW	00H
_AutoGearOk	DW	01H
_detected	DW	00H
_atarg	DW	0ffffH
_gtarg	DW	0ffffH
_OldClose	DW	0ffffH
_Speedy	DW	01H
_AutoLand	DW	00H
_nextlog	DW	00H
	ORG	$+88
$S923_OldTime	DW	00H
$S929_TickAccum	DW	00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 9
; Line 10
; Line 19
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
; Line 22
; Line 23
; Line 24
; Line 76
	PUBLIC	_InitStealth
_InitStealth	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	i = -4
;	d = -2
; Line 79
	mov	WORD PTR _detected,0
; Line 81
	mov	ax,1
	mov	WORD PTR _NextWayPoint,ax
	mov	WORD PTR _Tscale,ax
; Line 83
	mov	ax,-1
	mov	WORD PTR _gtarg,ax
	mov	WORD PTR _atarg,ax
; Line 85
	mov	WORD PTR _FrameRate,4
; Line 86
	call	_InitCannonRate
; Line 88
	mov	ax,4096
	push	ax
	call	_rnd
	add	sp,2
	and	ax,32760
	mov	WORD PTR _Rtime,ax
; Line 89
	mov	WORD PTR _Gtime,0
; Line 90
	sub	ax,ax
	mov	WORD PTR _TotalGameTicks+2,ax
	mov	WORD PTR _TotalGameTicks,ax
; Line 92
	call	_InitFlightModel
; Line 93
	call	_UpdateCloseBase
; Line 95
	call	_Help
; Line 96
	mov	sp,bp
	pop	bp
	ret	
	nop	

_InitStealth	ENDP
; Line 100
	PUBLIC	_Stealth
_Stealth	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	d = -2
;	i = -4
;	pl = -6
; Line 103
	call	_doradar
; Line 104
	call	_doplanes
; Line 105
	call	_doboats
; Line 106
	call	_dosams
; Line 108
	call	_doaaa
; Line 110
	call	_dodecoys
; Line 111
	call	_dotracers
; Line 112
	call	_dochute
; Line 114
	cmp	WORD PTR _detected,0
	je	$I777
	dec	WORD PTR _detected
; Line 116
$I777:
	test	BYTE PTR _Rtime,7
	jne	$I778
; Line 117
	call	_UpdateCloseBase
; Line 118
; Line 120
$I778:
	call	_CarrierLanding
; Line 121
	call	_CheckLandingAndCrash
; Line 123
	test	BYTE PTR _QTimer,3
	jne	$I782
; Line 124
	cmp	WORD PTR _Gtime,1
	jne	$I782
; Line 125
	call	_UpdateJetSnd
; Line 126
; Line 127
$I782:
; Line 128
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Stealth	ENDP
; Line 133
	PUBLIC	_UpdateCloseBase
_UpdateCloseBase	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	OldClose = -2
; Line 137
	sub	ax,ax
	push	ax
	push	WORD PTR _Py
	push	WORD PTR _Px
	call	_FindCloseBase
; Line 138
	mov	sp,bp
	pop	bp
	ret	
	nop	

_UpdateCloseBase	ENDP
; Line 142
	PUBLIC	_FindCloseBase
_FindCloseBase	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	d = -2
;	i = -4
;	c = 8
;	y = 6
;	x = 4
; Line 146
	mov	bx,WORD PTR [bp+8]	;c
	shl	bx,1
	mov	WORD PTR _CloseDist[bx],32767
; Line 148
	mov	ax,WORD PTR _NTARGET
	mov	WORD PTR [bp-4],ax	;i
	jmp	SHORT $F794
$FC795:
; Line 150
	mov	bx,ax
	mov	cx,ax
	shl	bx,1
	shl	bx,1
	add	bx,cx
	shl	bx,1
	test	WORD PTR _Rdrs[bx+6],513
	je	$I798
	test	BYTE PTR _Rdrs[bx+7],5
	je	$I798
; Line 152
	mov	cx,WORD PTR [bp+6]	;y
	sub	cx,WORD PTR _Rdrs[bx+2]
	push	cx
	mov	cx,WORD PTR [bp+4]	;x
	sub	cx,WORD PTR _Rdrs[bx]
	push	cx
	call	_xydist
	add	sp,4
; Line 153
	mov	bx,WORD PTR [bp+8]	;c
	shl	bx,1
	cmp	WORD PTR _CloseDist[bx],ax
	jbe	$I798
; Line 154
	mov	WORD PTR _CloseDist[bx],ax
; Line 155
	mov	ax,WORD PTR [bp-4]	;i
	mov	WORD PTR _CloseBase[bx],ax
; Line 156
; Line 157
$I798:
; Line 158
	inc	WORD PTR [bp-4]	;i
$F794:
	mov	ax,WORD PTR [bp-4]	;i
	cmp	WORD PTR _NRADAR,ax
	jg	$FC795
; Line 159
	mov	sp,bp
	pop	bp
	ret	
	nop	

_FindCloseBase	ENDP
; Line 163
	PUBLIC	_CheckLandingAndCrash
_CheckLandingAndCrash	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 165
	mov	WORD PTR _MinAlt,0
; Line 167
	cmp	WORD PTR _RadarAlt+2,0
	jl	$I801
	jg	$L20001
	cmp	WORD PTR _RadarAlt,0
	je	$I801
$L20001:
	cmp	WORD PTR _OurAlt,1
	jb	$JCC344
	jmp	$I814
$JCC344:
$I801:
; Line 168
	test	BYTE PTR _Status+1,16
	jne	$I803
	cmp	WORD PTR _ConfigData+18,0
	je	$JCC361
	jmp	$I802
$JCC361:
$I803:
; Line 171
	add	WORD PTR _RadarAlt,10
	adc	WORD PTR _RadarAlt+2,0
; Line 172
	add	WORD PTR _OurAlt,10
	cmp	WORD PTR _OurAlt,10
	jbe	$I804
; Line 173
	mov	ax,WORD PTR _OurAlt
	add	ax,490
	mov	WORD PTR _OurAlt,ax
; Line 174
	add	WORD PTR _RadarAlt,490
	adc	WORD PTR _RadarAlt+2,0
; Line 175
; Line 177
$I804:
	add	WORD PTR _Alt,2
; Line 179
	sub	ax,ax
	mov	WORD PTR _OurPitch,ax
	mov	WORD PTR _OurRoll,ax
	push	ax
	push	ax
	push	WORD PTR _OurHead
	mov	cx,OFFSET _FM
	push	cx
	call	_MakeRotationMatrix
	add	sp,8
; Line 180
	cmp	WORD PTR _REALFLIGHT,0
	je	$I806
; Line 181
	add	WORD PTR _PxLng,1
	adc	WORD PTR _PxLng+2,0
; Line 182
	mov	ax,OFFSET _OurRoll
	push	ax
	mov	ax,OFFSET _OurPitch
	push	ax
	mov	ax,OFFSET _OurHead
	push	ax
	mov	cx,OFFSET _FPARAMS+24
	push	cx
	call	_GetHPR
	add	sp,8
; Line 183
	mov	ax,OFFSET _FPARAMS+24
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _OurHead
	call	_MakeMatHPR
	add	sp,8
; Line 184
	sub	ax,ax
	mov	WORD PTR _FPARAMS+18,ax
	mov	WORD PTR _FPARAMS+16,ax
; Line 185
; Line 186
$I806:
	mov	ax,1
	ret	
; Line 187
; Line 189
$I802:
	cmp	WORD PTR _ConfigData+18,1
	jne	$I809
; Line 190
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	mov	cx,11
	push	cx
	call	_Sound
	add	sp,6
; Line 191
	mov	ax,60
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 192
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
	mov	cx,34
	push	cx
	call	_LogIt
	add	sp,24
; Line 193
	sub	ax,ax
	push	ax
	call	_EndGame
	add	sp,2
; Line 194
; Line 196
$I809:
	cmp	WORD PTR _ConfigData+18,2
	jne	$I814
; Line 197
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	mov	cx,11
	push	cx
	call	_Sound
	add	sp,6
; Line 198
	mov	ax,60
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 199
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
	mov	cx,34
	push	cx
	call	_LogIt
	add	sp,24
; Line 200
	sub	ax,ax
	push	ax
	call	_EndGame
	add	sp,2
; Line 201
; Line 202
$I814:
; Line 203
	ret	
	nop	

_CheckLandingAndCrash	ENDP
; Line 208
	PUBLIC	_dropdecoy
_dropdecoy	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	si
;	i = -4
;	j = -6
;	Str = -2
;	local = 6
;	type = 4
; Line 212
	mov	WORD PTR [bp-6],-1	;j
; Line 214
	cmp	WORD PTR [bp+6],70	;local
	jne	$I822
; Line 215
	mov	bx,WORD PTR [bp+4]	;type
	shl	bx,1
	mov	ax,WORD PTR _Stores[bx]
	dec	WORD PTR _Stores[bx]
	or	ax,ax
	jg	$I823
; Line 216
	mov	WORD PTR _Stores[bx],0
; Line 217
	cmp	WORD PTR [bp+4],1	;type
	jne	$I824
; Line 218
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG826
	jmp	SHORT $L20003
	nop	
$I824:
; Line 220
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG828
$L20003:
	push	ax
	call	_Message
	add	sp,4
; Line 221
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 222
; Line 223
	nop	
$I823:
	sub	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,24
	push	ax
	call	_Sound
	add	sp,6
; Line 224
	mov	ax,WORD PTR _Gtime
	add	ax,3
	mov	WORD PTR _lastCounter,ax
; Line 225
; Line 227
$I822:
	mov	WORD PTR [bp-4],0	;i
	jmp	SHORT $F829
	nop	
$FC830:
; Line 228
	mov	bx,ax
	mov	cx,ax
	shl	bx,1
	add	bx,cx
	shl	bx,1
	shl	bx,1
	cmp	WORD PTR _ds[bx+8],0
	jne	$L20004
	mov	WORD PTR [bp-6],ax	;j
; Line 229
$L20004:
	inc	WORD PTR [bp-4]	;i
$F829:
	mov	ax,WORD PTR [bp-4]	;i
	cmp	WORD PTR _NDECOY,ax
	jg	$FC830
; Line 231
	cmp	WORD PTR [bp-6],-1	;j
	jne	$JCC854
	jmp	$I844
$JCC854:
; Line 232
	mov	ax,WORD PTR [bp+4]	;type
	mov	bx,WORD PTR [bp-6]	;j
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	shl	bx,1
	mov	WORD PTR _ds[bx+6],ax
; Line 234
	cmp	WORD PTR [bp+6],70	;local
	je	$JCC883
	jmp	$I834
$JCC883:
; Line 235
	mov	ax,5
	sub	ax,WORD PTR _Diff
	imul	WORD PTR _FrameRate
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	mov	WORD PTR _ds[bx+8],ax
; Line 236
	mov	ax,WORD PTR _Px
	mov	WORD PTR _ds[bx],ax
; Line 237
	mov	ax,WORD PTR _Py
	mov	WORD PTR _ds[bx+2],ax
; Line 238
	mov	ax,WORD PTR _Alt
	mov	WORD PTR _ds[bx+4],ax
; Line 240
	cmp	WORD PTR [bp+4],1	;type
	jne	$I835
; Line 241
	mov	WORD PTR [bp-2],OFFSET DGROUP:$SG836	;Str
; Line 242
	jmp	SHORT $I837
	nop	
$I835:
; Line 243
	mov	WORD PTR [bp-2],OFFSET DGROUP:$SG838	;Str
; Line 244
$I837:
; Line 246
	push	WORD PTR [bp-2]	;Str
	mov	ax,OFFSET DGROUP:_Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 247
	mov	ax,OFFSET DGROUP:$SG841
	push	ax
	mov	ax,OFFSET DGROUP:_Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 248
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	mov	bx,WORD PTR [bp+4]	;type
	shl	bx,1
	push	WORD PTR _Stores[bx]
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET DGROUP:_Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 249
	mov	ax,OFFSET DGROUP:$SG843
	push	ax
	mov	ax,OFFSET DGROUP:_Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 250
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:_Txt
	push	ax
	call	_Message
	add	sp,4
; Line 251
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I834:
	cmp	WORD PTR [bp+6],0	;local
	je	$I845
; Line 252
	mov	ax,WORD PTR _FrameRate
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	shl	ax,1
	mov	bx,WORD PTR [bp-6]	;j
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	shl	bx,1
	mov	WORD PTR _ds[bx+8],ax
; Line 253
	mov	ax,40
	imul	WORD PTR [bp+6]	;local
	mov	si,ax
	mov	ax,WORD PTR _ps[si+2]
	mov	WORD PTR _ds[bx],ax
; Line 254
	mov	ax,WORD PTR _ps[si+4]
	mov	WORD PTR _ds[bx+2],ax
; Line 255
	mov	ax,WORD PTR _ps[si+6]
	jmp	SHORT $L20005
$I845:
; Line 257
	mov	ax,WORD PTR _FrameRate
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	shl	ax,1
	mov	bx,WORD PTR [bp-6]	;j
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	shl	bx,1
	mov	WORD PTR _ds[bx+8],ax
; Line 258
	mov	ax,WORD PTR _ps+2
	mov	WORD PTR _ds[bx],ax
; Line 259
	mov	ax,WORD PTR _ps+4
	mov	WORD PTR _ds[bx+2],ax
; Line 260
	mov	ax,WORD PTR _ps+6
$L20005:
	mov	WORD PTR _ds[bx+4],ax
; Line 261
$I844:
; Line 262
; Line 263
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_dropdecoy	ENDP
; Line 269
	PUBLIC	_dodecoys
_dodecoys	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 272
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F849
$I854:
; Line 285
	mov	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	cmp	WORD PTR _ds[bx+4],1
	jle	$I858
; Line 286
	dec	WORD PTR _ds[bx+4]
; Line 287
	jmp	SHORT $I859
	nop	
$I858:
; Line 289
	sub	ax,ax
	mov	bx,WORD PTR [bp-2]	;i
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	shl	bx,1
	mov	WORD PTR _ds[bx+8],ax
	mov	WORD PTR _ds[bx+6],ax
; Line 290
	mov	WORD PTR _ds[bx+4],ax
; Line 291
$I859:
; Line 292
; Line 293
; Line 294
	inc	WORD PTR [bp-2]	;i
$F849:
	mov	ax,WORD PTR _NDECOY
	cmp	WORD PTR [bp-2],ax	;i
	jge	$FB851
; Line 273
	mov	bx,WORD PTR [bp-2]	;i
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	cmp	WORD PTR _ds[bx+8],0
	je	$I859
; Line 275
	dec	WORD PTR _ds[bx+8]
	jne	$I853
	mov	WORD PTR _ds[bx+6],0
; Line 276
$I853:
	mov	bx,WORD PTR [bp-2]	;i
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	cmp	WORD PTR _ds[bx+6],1
	jne	$I854
; Line 277
	cmp	WORD PTR _ds[bx+4],3
	jle	$I858
; Line 278
	sub	WORD PTR _ds[bx+4],3
; Line 279
	jmp	SHORT $I859
$FB851:
; Line 295
	mov	sp,bp
	pop	bp
	ret	

_dodecoys	ENDP
; Line 300
	PUBLIC	_dochute
_dochute	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	cnt = -2
; Line 303
	cmp	WORD PTR _chuteZ,0
	jle	$I862
; Line 304
	cmp	WORD PTR _chuteDZ,-16
	jle	$I863
	sub	WORD PTR _chuteDZ,4
; Line 305
$I863:
	mov	ax,WORD PTR _chuteDZ
	add	WORD PTR _chuteZ,ax
; Line 306
; Line 308
$I862:
	mov	WORD PTR [bp-2],0	;cnt
$FC865:
; Line 309
	mov	cl,3
	mov	bx,WORD PTR [bp-2]	;cnt
	shl	bx,cl
	cmp	WORD PTR _paratroopers[bx+4],0
	jle	$L20007
; Line 312
	cmp	WORD PTR _paratroopers[bx+6],-1
	jle	$I868
; Line 313
	dec	WORD PTR _paratroopers[bx+6]
; Line 314
$I868:
	mov	cl,3
	mov	bx,WORD PTR [bp-2]	;cnt
	shl	bx,cl
	mov	ax,WORD PTR _paratroopers[bx+6]
	add	WORD PTR _paratroopers[bx+4],ax
; Line 315
; Line 316
$L20007:
	inc	WORD PTR [bp-2]	;cnt
	cmp	WORD PTR [bp-2],20	;cnt
	jl	$FC865
; Line 317
	mov	sp,bp
	pop	bp
	ret	
	nop	

_dochute	ENDP
; Line 323
	PUBLIC	_Help
_Help	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 328
	sub	ax,ax
	mov	WORD PTR _Damaged,ax
	mov	WORD PTR _MASTER_CAUTION,ax
; Line 329
	call	_ARMT_INIT
; Line 331
	mov	WORD PTR _Rounds,675
; Line 333
	mov	WORD PTR _Stores+4,18
; Line 334
	mov	WORD PTR _Stores+2,12
; Line 336
; Line 339
	mov	WORD PTR _Fuel,19800
; Line 340
; Line 344
	sub	ax,ax
	mov	WORD PTR _LLowFuelWarn,ax
	mov	WORD PTR _RLowFuelWarn,ax
	mov	WORD PTR _BingoFuelWarn,ax
; Line 345
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Help	ENDP
; Line 349
	PUBLIC	_JettisonFuel
_JettisonFuel	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 350
	cmp	WORD PTR _Fuel,16200
	jle	$I876
	mov	WORD PTR _Fuel,16200
; Line 351
$I876:
	ret	

_JettisonFuel	ENDP
; Line 355
	PUBLIC	_EndGame
_EndGame	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
;	endcode = 4
; Line 357
	mov	BYTE PTR _BEND,1
; Line 364
	ret	
	nop	

_EndGame	ENDP
; Line 366
	PUBLIC	_GetSide
_GetSide	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	planenum = 4
; Line 367
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],4
	je	$I882
; Line 368
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 369
	nop	
$I882:
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	test	BYTE PTR _ps[bx+25],1
	je	$I883
; Line 370
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 371
$I883:
	mov	ax,2
; Line 372
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetSide	ENDP
; Line 393
	PUBLIC	_LogIt
_LogIt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	di
	push	si
;	missileOrgOwner = -8
;	damagelevel = -6
;	ptemp = -4
;	src = 26
;	misc = 22
;	missileType = 20
;	missileOwner = 18
;	z = 16
;	y = 12
;	x = 8
;	donetonum = 6
;	event = 4
; Line 394
	mov	WORD PTR [bp-6],0	;damagelevel
; Line 398
	cmp	WORD PTR _nextlog,31
	jl	$I897
	call	_DumpLogFile
; Line 400
$I897:
	cmp	WORD PTR [bp+18],-1	;missileOwner
	je	$I900
	cmp	WORD PTR [bp+18],70	;missileOwner
	jne	$I899
$I900:
; Line 401
	mov	ax,WORD PTR _orgPlayernum
	jmp	SHORT $L20009
	nop	
$I899:
	cmp	WORD PTR [bp+18],0	;missileOwner
	jl	$I902
	cmp	WORD PTR [bp+18],70	;missileOwner
	jge	$I902
; Line 403
	mov	ax,46
	imul	WORD PTR [bp+18]	;missileOwner
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+44]
	cbw	
	jmp	SHORT $L20009
	nop	
$I902:
	cmp	WORD PTR [bp+18],0	;missileOwner
	jge	$I904
	cmp	WORD PTR [bp+18],-999	;missileOwner
	je	$I904
; Line 405
	mov	ax,WORD PTR [bp+18]	;missileOwner
	neg	ax
	jmp	SHORT $L20009
$I904:
; Line 407
	mov	ax,WORD PTR [bp+18]	;missileOwner
$L20009:
	mov	WORD PTR [bp-8],ax	;missileOrgOwner
; Line 409
	cmp	WORD PTR [bp+26],0	;src
	je	$I907
	cmp	WORD PTR [bp+26],1	;src
	je	$JCC1668
	jmp	$I906
$JCC1668:
$I907:
; Line 410
	cmp	WORD PTR [bp+6],0	;donetonum
	jge	$JCC1677
	jmp	$I908
$JCC1677:
	cmp	WORD PTR [bp+6],70	;donetonum
	jl	$JCC1686
	jmp	$I908
$JCC1686:
; Line 411
	mov	ax,46
	imul	WORD PTR [bp+6]	;donetonum
	mov	bx,ax
	mov	al,BYTE PTR _bv[bx+44]
	cbw	
	mov	cl,5
	mov	bx,WORD PTR _nextlog
	shl	bx,cl
	mov	WORD PTR _gamelog[bx],ax
; Line 412
	mov	ax,40
	imul	WORD PTR [bp+6]	;donetonum
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	mov	si,bx
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-4],ax	;ptemp
	mov	WORD PTR [bp-2],dx
; Line 413
	les	bx,DWORD PTR [bp-4]	;ptemp
	mov	ax,WORD PTR es:[bx]
	mov	cl,5
	mov	di,WORD PTR _nextlog
	shl	di,cl
	mov	WORD PTR _gamelog[di+2],ax
; Line 414
	mov	ax,WORD PTR _ps[si+26]
	mov	WORD PTR _gamelog[di+18],ax
; Line 415
	push	WORD PTR [bp+6]	;donetonum
	call	_GetSide
	add	sp,2
	mov	WORD PTR _gamelog[di+4],ax
; Line 417
	les	bx,DWORD PTR [bp-4]	;ptemp
	cmp	WORD PTR es:[bx+38],50
	jne	$I909
; Line 418
	mov	cl,5
	mov	bx,WORD PTR _nextlog
	shl	bx,cl
	mov	WORD PTR _gamelog[bx+4],3
; Line 420
$I909:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp+6],ax	;donetonum
	jle	$I910
; Line 422
	mov	ax,46
	imul	WORD PTR [bp+6]	;donetonum
	mov	bx,ax
	mov	ax,WORD PTR _bv[bx+26]
	mov	cl,5
	mov	bx,WORD PTR _nextlog
	shl	bx,cl
	mov	WORD PTR _gamelog[bx+30],ax
	cmp	ax,6
	jg	$JCC1840
	jmp	$I918
$JCC1840:
; Line 423
	mov	WORD PTR _gamelog[bx+30],6
; Line 424
; Line 425
	jmp	$I918
$I910:
; Line 426
	mov	ax,46
	imul	WORD PTR [bp+6]	;donetonum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],32
	je	$I913
; Line 427
	add	WORD PTR [bp-6],2	;damagelevel
; Line 428
$I913:
	mov	ax,46
	imul	WORD PTR [bp+6]	;donetonum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],64
	je	$I914
; Line 429
	add	WORD PTR [bp-6],2	;damagelevel
; Line 430
$I914:
	mov	ax,46
	imul	WORD PTR [bp+6]	;donetonum
	mov	bx,ax
	test	BYTE PTR _bv[bx+20],128
	je	$I915
; Line 431
	add	WORD PTR [bp-6],2	;damagelevel
; Line 432
$I915:
	mov	ax,WORD PTR [bp-6]	;damagelevel
	mov	cl,5
	mov	bx,WORD PTR _nextlog
	shl	bx,cl
$L20010:
	mov	WORD PTR _gamelog[bx+30],ax
; Line 433
; Line 434
; Line 435
	jmp	SHORT $I918
$I908:
	cmp	WORD PTR [bp+6],-1	;donetonum
	jne	$I918
; Line 436
	mov	ax,WORD PTR _orgPlayernum
	mov	cl,5
	mov	bx,WORD PTR _nextlog
	shl	bx,cl
	mov	WORD PTR _gamelog[bx],ax
; Line 437
	mov	WORD PTR _gamelog[bx+2],-1
; Line 438
	mov	ax,WORD PTR _Knots
	mov	WORD PTR _gamelog[bx+18],ax
; Line 440
	sub	ax,ax
	mov	WORD PTR _gamelog[bx+4],ax
	jmp	SHORT $L20010
$I906:
; Line 444
	cmp	WORD PTR [bp+6],0	;donetonum
	jl	$I919
; Line 445
	mov	ax,WORD PTR [bp+6]	;donetonum
	mov	cl,5
	mov	bx,WORD PTR _nextlog
	shl	bx,cl
	mov	WORD PTR _gamelog[bx],ax
; Line 446
; Line 447
	jmp	SHORT $I920
	nop	
$I919:
; Line 448
	mov	cl,5
	mov	bx,WORD PTR _nextlog
	shl	bx,cl
	mov	WORD PTR _gamelog[bx],-999
; Line 449
$I920:
; Line 450
	mov	cl,5
	mov	bx,WORD PTR _nextlog
	shl	bx,cl
	mov	WORD PTR _gamelog[bx+2],-999
; Line 451
	mov	WORD PTR _gamelog[bx+18],0
; Line 452
	mov	WORD PTR _gamelog[bx+4],2
; Line 455
$I918:
; Line 456
	mov	ax,WORD PTR [bp+8]	;x
	mov	dx,WORD PTR [bp+10]
	mov	cl,5
	mov	bx,WORD PTR _nextlog
	shl	bx,cl
	mov	WORD PTR _gamelog[bx+6],ax
	mov	WORD PTR _gamelog[bx+8],dx
; Line 457
	mov	ax,WORD PTR [bp+12]	;y
	mov	dx,WORD PTR [bp+14]
	mov	WORD PTR _gamelog[bx+10],ax
	mov	WORD PTR _gamelog[bx+12],dx
; Line 458
	mov	ax,WORD PTR [bp+16]	;z
	mov	WORD PTR _gamelog[bx+14],ax
	mov	WORD PTR _gamelog[bx+16],0
; Line 459
	mov	ax,WORD PTR [bp+4]	;event
	cwd	
	mov	WORD PTR _gamelog[bx+20],ax
	mov	WORD PTR _gamelog[bx+22],dx
; Line 460
	mov	ax,WORD PTR [bp-8]	;missileOrgOwner
	mov	WORD PTR _gamelog[bx+24],ax
; Line 461
	mov	ax,WORD PTR [bp+20]	;missileType
	mov	WORD PTR _gamelog[bx+26],ax
; Line 462
	mov	ax,WORD PTR _TimeOfDay
	mov	WORD PTR _gamelog[bx+28],ax
; Line 464
	inc	WORD PTR _nextlog
; Line 467
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_LogIt	ENDP
; Line 473
	PUBLIC	_UpdateTime1
_UpdateTime1	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 476
	call	FAR PTR _GETTIME
	sub	ax,WORD PTR $S923_OldTime
	mov	WORD PTR _FTicks,ax
; Line 477
	add	WORD PTR $S923_OldTime,ax
; Line 481
	cmp	ax,1000
	jbe	$I924
	mov	WORD PTR _FTicks,1000
; Line 482
$I924:
	cmp	WORD PTR _FTicks,0
	jne	$I925
	mov	WORD PTR _FTicks,1
; Line 484
$I925:
	mov	ax,WORD PTR _FTicks
	sub	dx,dx
	add	WORD PTR _TotalGameTicks,ax
	adc	WORD PTR _TotalGameTicks+2,dx
; Line 486
	mov	ax,600
	div	WORD PTR _FTicks
	mov	WORD PTR _FrameRate10,ax
; Line 488
	cmp	WORD PTR _Speedy,1
	jbe	$I926
	mov	ax,WORD PTR _Speedy
	mul	WORD PTR _FTicks
	mov	WORD PTR _FTicks,ax
; Line 489
$I926:
	ret	

_UpdateTime1	ENDP
; Line 492
	PUBLIC	_UpdateTime2
_UpdateTime2	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 495
	cmp	WORD PTR _FTicks,4
	jae	$I930
; Line 496
	mov	ax,4
	sub	ax,WORD PTR _FTicks
	mov	WORD PTR _TickDelay,ax
; Line 497
	mov	WORD PTR _FTicks,4
; Line 498
	jmp	SHORT $I932
$I930:
; Line 499
	mov	WORD PTR _TickDelay,0
; Line 500
	cmp	WORD PTR _FTicks,20
	jbe	$I932
	mov	WORD PTR _FTicks,20
; Line 501
$I932:
; Line 505
	mov	ax,WORD PTR _FTicks
	mov	cx,ax
	shr	ax,1
	add	ax,60
	sub	dx,dx
	div	cx
	mov	WORD PTR _FrameRate,ax
; Line 507
	add	WORD PTR $S929_TickAccum,cx
	cmp	WORD PTR $S929_TickAccum,15
	jl	$I933
; Line 508
	mov	ax,WORD PTR $S929_TickAccum
	sub	ax,15
	mov	WORD PTR $S929_TickAccum,ax
; Line 510
	mov	ax,WORD PTR _QTime
	inc	WORD PTR _QTime
	mov	WORD PTR _QTimer,ax
	test	al,3
	jne	$I937
; Line 512
	inc	WORD PTR _Gtime
	mov	ax,WORD PTR _Gtime
	mov	cx,30
	cwd	
	idiv	cx
	or	dx,dx
	jne	$I937
; Line 514
	inc	WORD PTR _TimeOfDay
	cmp	WORD PTR _TimeOfDay,1440
	jne	$I937
	mov	WORD PTR _TimeOfDay,dx
; Line 515
; Line 516
; Line 517
	inc	WORD PTR _Rtime
	ret	
$I933:
; Line 518
	mov	WORD PTR _QTimer,-1
; Line 519
$I937:
; Line 521
	inc	WORD PTR _Rtime
; Line 522
	ret	
	nop	

_UpdateTime2	ENDP
_TEXT	ENDS
END
