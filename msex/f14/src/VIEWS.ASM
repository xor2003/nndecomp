;	Static Name Aliases
;
;	$S640_LastView	EQU	LastView
;	$S641_LastSeat	EQU	LastSeat
	TITLE   C:\VIEWS.C
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
PUBLIC  _vScale
PUBLIC  _PadHead
PUBLIC  _PadPitch
PUBLIC  _PadLockee
EXTRN	_GetHPR:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_MouseSETUP:NEAR
EXTRN	_UpdatePalBuf:NEAR
EXTRN	_labs:NEAR
EXTRN	_LoadNewCockpit:NEAR
EXTRN	_sinX:NEAR
EXTRN	_cosX:NEAR
EXTRN	_NDraw3D:NEAR
EXTRN	_ASinB:NEAR
EXTRN	_ACosB:NEAR
EXTRN	_Trans3X3:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_NDraw3DObject:NEAR
EXTRN	_MapInEMSSprite:NEAR
EXTRN	_uangle:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	__aNNalshr:NEAR
EXTRN	_ScreenOff:FAR
EXTRN	_LoadPicToPal:NEAR
EXTRN	_RectFill:FAR
EXTRN	_ScaleRotate:NEAR
EXTRN	__aNlmul:NEAR
EXTRN	_rng:NEAR
EXTRN	_ClearPage:FAR
EXTRN	_OnTheDeck:NEAR
EXTRN	_Copy3X3:NEAR
EXTRN	_HUD:NEAR
EXTRN	_MakeMatHPR:NEAR
EXTRN	_Shake:FAR
EXTRN	_Rotate:NEAR
EXTRN	_MouseHIDE:FAR
EXTRN	_ARCTAN:NEAR
EXTRN	_Dist2D:NEAR
EXTRN	_abs:NEAR
EXTRN	_MakeRotationMatrix:FAR
EXTRN	_MakematHPR:NEAR
EXTRN	_Mult3X3:NEAR
EXTRN	_Px:WORD
EXTRN	_planelanding:WORD
EXTRN	_Py:WORD
EXTRN	_PxLng:DWORD
EXTRN	_PyLng:DWORD
EXTRN	_FM:BYTE
EXTRN	_OurHead:WORD
EXTRN	_OurPitch:WORD
EXTRN	_OurRoll:WORD
EXTRN	_Alt:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_vHead:WORD
EXTRN	_vPitch:WORD
EXTRN	_vRoll:WORD
EXTRN	_HDGRp:WORD
EXTRN	_VM:BYTE
EXTRN	_PLRp:WORD
EXTRN	_ejectX:WORD
EXTRN	_RBRp:WORD
EXTRN	_ejectY:WORD
EXTRN	_TDBRp:WORD
EXTRN	_ejectZ:WORD
EXTRN	_GRPAGE0:BYTE
EXTRN	_BackSeat:WORD
EXTRN	_ImHit:WORD
EXTRN	_GXMID:WORD
EXTRN	_GYMID:WORD
EXTRN	_ejected:WORD
EXTRN	_GRPAGE:WORD
EXTRN	_OutsideWidth:WORD
EXTRN	_OutsideLength:WORD
EXTRN	_SteadyHead:WORD
EXTRN	_SteadyPitch:WORD
EXTRN	_DESIGNATED:WORD
EXTRN	_MouseSprite:WORD
EXTRN	_ss:BYTE
EXTRN	_PlaneAnimVals:BYTE
EXTRN	_View:WORD
EXTRN	_carrier:BYTE
EXTRN	_NPLANES:WORD
EXTRN	_ps:BYTE
EXTRN	_ConfigData:BYTE
_BSS      SEGMENT
COMM NEAR	_Povx:	BYTE:	 4
COMM NEAR	_Povy:	BYTE:	 4
COMM NEAR	_ViewX:	BYTE:	 4
COMM NEAR	_ViewY:	BYTE:	 4
COMM NEAR	_Povz:	BYTE:	 2
COMM NEAR	_ViewZ:	BYTE:	 2
COMM NEAR	_PovPitch:	BYTE:	 2
COMM NEAR	_PovMisl:	BYTE:	 2
COMM NEAR	_RPov:	BYTE:	 2
_BSS      ENDS
EXTRN	_Rp2:WORD
EXTRN	_Rp3D:WORD
_DATA      SEGMENT
$SG654	DB	'F14ORG01.PIC',  00H
$SG659	DB	'F14ORG01.PIC',  00H
_vScale	DW	02H
_PadHead	DW	00H
_PadPitch	DW	00H
_PadLockee	DW	0ffffH
$S640_LastView	DW	00H
$S641_LastSeat	DW	00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 13
; Line 19
; Line 14
; Line 15
; Line 16
; Line 17
; Line 18
; Line 19
; Line 20
; Line 91
	PUBLIC	_GenDsp
_GenDsp	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,774
	call	__aNchkstk
;	PalPkt = -774
; Line 97
	cmp	WORD PTR _ejected,0
	je	$I643
	mov	WORD PTR _View,206
; Line 99
$I643:
	call	_SetupView
; Line 101
	cmp	WORD PTR _View,0
	je	$I646
	cmp	WORD PTR _View,3
	jne	$I645
$I646:
; Line 102
	mov	ax,18
	push	ax
	mov	ax,OFFSET _FM
	push	ax
	mov	ax,OFFSET _VM
	push	ax
	call	_memcpy
	add	sp,6
; Line 103
	jmp	SHORT $I648
	nop	
$I645:
; Line 104
	push	WORD PTR _vRoll
	push	WORD PTR _vPitch
	push	WORD PTR _vHead
	mov	ax,OFFSET _VM
	push	ax
	call	FAR PTR _MakeRotationMatrix
	add	sp,8
; Line 105
$I648:
; Line 108
	mov	ax,WORD PTR _View
	cmp	WORD PTR $S640_LastView,ax
	jne	$I650
	mov	ax,WORD PTR _BackSeat
	cmp	WORD PTR $S641_LastSeat,ax
	jne	$JCC100
	jmp	$I649
$JCC100:
$I650:
; Line 109
	call	FAR PTR _ScreenOff
; Line 110
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _MouseSprite
	call	_MouseSETUP
	add	sp,6
; Line 111
	call	FAR PTR _MouseHIDE
; Line 113
	cmp	WORD PTR _View,70
	jge	$I652
; Line 114
	cmp	WORD PTR $S640_LastView,3
	jne	$I653
; Line 115
	lea	ax,WORD PTR [bp-774]	;PalPkt
	push	ax
	mov	cx,OFFSET DGROUP:$SG654
	push	cx
	mov	cx,1
	push	cx
	call	_LoadPicToPal
	add	sp,6
; Line 116
	lea	ax,WORD PTR [bp-774]	;PalPkt
	push	ax
	call	_UpdatePalBuf
	add	sp,2
; Line 117
; Line 118
$I653:
	call	_LoadNewCockpit
; Line 119
	jmp	SHORT $I657
$I652:
; Line 120
	cmp	WORD PTR $S640_LastView,70
	jge	$I658
; Line 121
	lea	ax,WORD PTR [bp-774]	;PalPkt
	push	ax
	mov	cx,OFFSET DGROUP:$SG659
	push	cx
	mov	cx,1
	push	cx
	call	_LoadPicToPal
	add	sp,6
; Line 122
	lea	ax,WORD PTR [bp-774]	;PalPkt
	push	ax
	call	_UpdatePalBuf
	add	sp,2
; Line 123
; Line 124
$I658:
	cmp	WORD PTR _View,71
	je	$I661
	cmp	WORD PTR _View,72
	jne	$I660
$I661:
; Line 125
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+8],199
	jmp	SHORT $L20013
$I660:
; Line 129
	mov	ax,WORD PTR _OutsideLength
	dec	ax
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+8],ax
; Line 130
$L20013:
	mov	ax,WORD PTR _OutsideWidth
	dec	ax
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+6],ax
; Line 131
	sub	ax,ax
	push	ax
	push	ax
	call	FAR PTR _ClearPage
	add	sp,4
; Line 132
; Line 133
$I657:
; Line 134
	mov	ax,WORD PTR _View
	mov	WORD PTR $S640_LastView,ax
; Line 135
	mov	ax,WORD PTR _BackSeat
	mov	WORD PTR $S641_LastSeat,ax
; Line 136
; Line 138
$I649:
	mov	ax,WORD PTR _ViewZ
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ViewY+2
	push	WORD PTR _ViewY
	push	WORD PTR _ViewX+2
	push	WORD PTR _ViewX
	push	WORD PTR _vRoll
	push	WORD PTR _vPitch
	mov	ax,WORD PTR _vHead
	neg	ax
	push	ax
	call	_NDraw3D
	add	sp,18
; Line 140
	call	_CheckImHit
; Line 141
	mov	ax,1
; Line 142
	mov	sp,bp
	pop	bp
	ret	

_GenDsp	ENDP
; Line 150
_TEXT      ENDS
CONST      SEGMENT
$T20003	DW SEG _carrier 
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_SetupView
_SetupView	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,86
	call	__aNchkstk
	push	si
;	dx = -38
;	dy = -62
;	dz = -66
;	vDist = -28
;	n = -64
;	vvScale = -22
;	vSave = -24
;	TM = -18
;	RM = -84
;	PM = -60
;	phd = -36
;	pptchmin = -20
;	dd = -26
;	whichcarr = -30
;	TX = -34
;	TY = -42
; Line 161
	mov	ax,WORD PTR _PyLng
	mov	dx,WORD PTR _PyLng+2
	mov	WORD PTR _ViewY,ax
	mov	WORD PTR _ViewY+2,dx
; Line 162
	mov	cx,WORD PTR _Alt
	add	cx,3
	mov	WORD PTR _ViewZ,cx
; Line 164
	mov	cx,WORD PTR _PxLng
	mov	bx,WORD PTR _PxLng+2
	mov	WORD PTR _ViewX,cx
	mov	WORD PTR _ViewX+2,bx
	mov	WORD PTR _Povx,cx
	mov	WORD PTR _Povx+2,bx
; Line 165
	sub	cx,cx
	mov	bx,16
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR _Povy,cx
	mov	WORD PTR _Povy+2,bx
; Line 166
	mov	ax,WORD PTR _Alt
	mov	WORD PTR _Povz,ax
; Line 168
	mov	ax,8
	push	ax
	mov	ax,2
	push	ax
	push	WORD PTR _vScale
	call	_rng
	add	sp,6
	mov	WORD PTR _vScale,ax
	mov	WORD PTR [bp-22],ax	;vvScale
; Line 171
	mov	ax,WORD PTR _View
	jmp	$S683
; Line 172
$SC687:
; Line 175
	mov	ax,WORD PTR _OurHead
	mov	WORD PTR _vHead,ax
; Line 176
	mov	ax,WORD PTR _OurPitch
	mov	WORD PTR _vPitch,ax
; Line 177
	mov	ax,WORD PTR _OurRoll
$L20014:
	mov	WORD PTR _vRoll,ax
; Line 178
	jmp	$SB684
; Line 180
	nop	
$SC688:
; Line 182
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	push	WORD PTR _OurRoll
	mov	ax,WORD PTR _OurPitch
	neg	ax
	push	ax
	push	WORD PTR _OurHead
	call	_MakeMatHPR
	add	sp,8
; Line 183
	cmp	WORD PTR _View,71
	jne	$I690
; Line 184
	cmp	WORD PTR _PadLockee,-1
	jne	$I691
; Line 186
	sub	ax,ax
	mov	WORD PTR _PadHead,ax
	jmp	SHORT $L20015
	nop	
$I691:
; Line 188
	mov	ax,40
	imul	WORD PTR _PadLockee
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR _Px
	mov	WORD PTR [bp-60],ax	;PM
; Line 189
	mov	ax,WORD PTR _ps[bx+6]
	sub	ax,WORD PTR _Alt
	mov	cl,5
	sar	ax,cl
	mov	WORD PTR [bp-58],ax
; Line 190
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR _Py
	mov	WORD PTR [bp-56],ax
; Line 192
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	lea	ax,WORD PTR [bp-60]	;PM
	push	ax
	call	_Rotate
	add	sp,4
; Line 193
	mov	ax,WORD PTR [bp-56]
	neg	ax
	push	ax
	push	WORD PTR [bp-60]	;PM
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR _PadHead,ax
; Line 194
	push	WORD PTR [bp-56]
	push	WORD PTR [bp-60]	;PM
	call	_Dist2D
	add	sp,4
	push	ax
	push	WORD PTR [bp-58]
	call	_ARCTAN
	add	sp,4
	neg	ax
$L20015:
	mov	WORD PTR _PadPitch,ax
; Line 195
; Line 196
; Line 198
$I690:
	cmp	WORD PTR _PadHead,-32768
	jne	$I696
; Line 199
	mov	WORD PTR _PadHead,32767
; Line 200
$I696:
	push	WORD PTR _PadHead
	call	_abs
	add	sp,2
	cmp	ax,27648
	jle	$I698
; Line 201
	cmp	WORD PTR _PadHead,0
	jle	$L20001
	mov	ax,27648
	jmp	SHORT $L20002
$L20001:
	mov	ax,-27648
$L20002:
	mov	WORD PTR _PadHead,ax
; Line 202
$I698:
; Line 204
	mov	WORD PTR [bp-20],-5120	;pptchmin
; Line 205
	push	WORD PTR _PadHead
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-36],ax	;phd
	cmp	ax,11776
	jge	$I699
; Line 206
	mov	WORD PTR [bp-20],3328	;pptchmin
; Line 207
	jmp	SHORT $I700
$I699:
; Line 208
	mov	WORD PTR [bp-20],256	;pptchmin
$I700:
; Line 211
	mov	ax,WORD PTR [bp-20]	;pptchmin
	neg	ax
	mov	WORD PTR [bp-20],ax	;pptchmin
	cmp	ax,WORD PTR _PadPitch
	jge	$I701
; Line 212
	mov	WORD PTR _PadPitch,ax
; Line 214
$I701:
	lea	ax,WORD PTR [bp-60]	;PM
	push	ax
	sub	cx,cx
	push	cx
	push	WORD PTR _PadPitch
	push	WORD PTR _PadHead
	call	_MakematHPR
	add	sp,8
; Line 215
	lea	ax,WORD PTR [bp-84]	;RM
	push	ax
	lea	cx,WORD PTR [bp-60]	;PM
	push	cx
	lea	cx,WORD PTR [bp-18]	;TM
	push	cx
	call	_Mult3X3
	add	sp,6
; Line 216
	mov	ax,OFFSET _vRoll
	push	ax
	mov	ax,OFFSET _vPitch
	push	ax
	mov	cx,OFFSET _vHead
	push	cx
	lea	cx,WORD PTR [bp-84]	;RM
	push	cx
	call	_GetHPR
	add	sp,8
	jmp	$L20021
; Line 220
$SC705:
; Line 221
	mov	ax,WORD PTR _OurHead
	add	ah,64
	mov	WORD PTR _vHead,ax
; Line 222
	mov	ax,WORD PTR _OurRoll
	neg	ax
	mov	WORD PTR _vPitch,ax
; Line 223
	mov	ax,WORD PTR _OurPitch
	jmp	$L20014
; Line 225
	nop	
$SC706:
; Line 226
	mov	ax,WORD PTR _OurHead
	sub	ax,16384
	mov	WORD PTR _vHead,ax
; Line 227
	mov	ax,WORD PTR _OurRoll
	mov	WORD PTR _vPitch,ax
; Line 228
	mov	ax,WORD PTR _OurPitch
$L20016:
	neg	ax
	jmp	$L20014
; Line 230
	nop	
$SC707:
; Line 231
	mov	ax,WORD PTR _OurHead
	add	ah,112
$L20017:
	mov	WORD PTR _vHead,ax
; Line 232
	mov	ax,WORD PTR _OurPitch
	neg	ax
	mov	WORD PTR _vPitch,ax
; Line 233
	mov	ax,WORD PTR _OurRoll
	jmp	SHORT $L20016
; Line 235
$SC708:
; Line 236
	mov	ax,WORD PTR _OurHead
	sub	ax,28672
	jmp	SHORT $L20017
; Line 241
$SC709:
; Line 243
	cmp	WORD PTR _View,207
	jne	$I710
; Line 246
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20003
	mov	cx,WORD PTR es:_carrier+192
	mov	bx,WORD PTR es:_carrier+194
	add	cx,WORD PTR es:_carrier
	adc	bx,WORD PTR es:_carrier+2
	sub	cx,450
	sbb	bx,0
	push	bx
	push	cx
	call	__aNldiv
	mov	WORD PTR _ViewX,ax
	mov	WORD PTR _ViewX+2,dx
; Line 247
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,-400
	cwd	
	mov	es,WORD PTR $T20003
	sub	ax,WORD PTR es:_carrier+8
	sbb	dx,WORD PTR es:_carrier+10
	sub	ax,WORD PTR es:_carrier+196
	sbb	dx,WORD PTR es:_carrier+198
	push	dx
	push	ax
	call	__aNldiv
	add	ax,0
	adc	dx,16
	mov	WORD PTR _ViewY,ax
	mov	WORD PTR _ViewY+2,dx
; Line 248
	mov	WORD PTR _ViewZ,28
; Line 249
; Line 250
	jmp	$I711
$I710:
; Line 252
	mov	ax,WORD PTR _ConfigData+22
	mov	WORD PTR [bp-30],ax	;whichcarr
	cmp	ax,2
	jg	$I713
	or	ax,ax
	jge	$I712
$I713:
; Line 253
	mov	WORD PTR [bp-30],0	;whichcarr
; Line 254
$I712:
	cmp	WORD PTR [bp-30],1	;whichcarr
	jne	$I714
; Line 255
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20003
	mov	cx,WORD PTR es:_carrier
	mov	bx,WORD PTR es:_carrier+2
	sub	cx,1700
	sbb	bx,0
	push	bx
	push	cx
	call	__aNldiv
	mov	WORD PTR _ViewX,ax
	mov	WORD PTR _ViewX+2,dx
; Line 256
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,-10200
	cwd	
	jmp	SHORT $L20022
	nop	
$I714:
	cmp	WORD PTR [bp-30],2	;whichcarr
	jne	$I716
; Line 259
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20003
	mov	cx,WORD PTR es:_carrier
	mov	bx,WORD PTR es:_carrier+2
	sub	cx,1700
	sbb	bx,0
	push	bx
	push	cx
	call	__aNldiv
	mov	WORD PTR _ViewX,ax
	mov	WORD PTR _ViewX+2,dx
; Line 260
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,-8800
	jmp	SHORT $L20018
$I716:
; Line 263
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20003
	mov	cx,WORD PTR es:_carrier
	mov	bx,WORD PTR es:_carrier+2
	sub	cx,2500
	sbb	bx,0
	push	bx
	push	cx
	call	__aNldiv
	mov	WORD PTR _ViewX,ax
	mov	WORD PTR _ViewX+2,dx
; Line 264
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,-9500
$L20018:
	mov	dx,-1
$L20022:
	mov	es,WORD PTR $T20003
	sub	ax,WORD PTR es:_carrier+8
	sbb	dx,WORD PTR es:_carrier+10
	push	dx
	push	ax
	call	__aNldiv
	add	ax,0
	adc	dx,16
	mov	WORD PTR _ViewY,ax
	mov	WORD PTR _ViewY+2,dx
; Line 265
; Line 266
	mov	WORD PTR _ViewZ,20
; Line 267
$I711:
; Line 268
	cmp	WORD PTR _planelanding,0
	jge	$I718
; Line 269
	mov	ax,WORD PTR _PxLng
	mov	dx,WORD PTR _PxLng+2
	sub	ax,WORD PTR _ViewX
	sbb	dx,WORD PTR _ViewX+2
	mov	WORD PTR [bp-34],ax	;TX
	mov	WORD PTR [bp-32],dx
; Line 270
	mov	ax,WORD PTR _PyLng
	mov	dx,WORD PTR _PyLng+2
	jmp	SHORT $L20019
$I718:
; Line 273
	mov	ax,40
	imul	WORD PTR _planelanding
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
	sub	ax,WORD PTR _ViewX
	sbb	dx,WORD PTR _ViewX+2
	mov	WORD PTR [bp-34],ax	;TX
	mov	WORD PTR [bp-32],dx
; Line 274
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _ps[bx+12]
	sbb	dx,WORD PTR _ps[bx+14]
$L20019:
	sub	ax,WORD PTR _ViewY
	sbb	dx,WORD PTR _ViewY+2
	mov	WORD PTR [bp-42],ax	;TY
	mov	WORD PTR [bp-40],dx
; Line 275
; Line 276
	push	WORD PTR [bp-32]
	push	WORD PTR [bp-34]	;TX
	call	_labs
	add	sp,4
	cmp	ax,16384
	jg	$I722
	push	WORD PTR [bp-40]
	push	WORD PTR [bp-42]	;TY
	call	_labs
	add	sp,4
	cmp	ax,16384
	jle	$I721
$I722:
; Line 277
; Line 278
	mov	al,8
	push	ax
	lea	cx,WORD PTR [bp-34]	;TX
	push	cx
	call	__aNNalshr
; Line 279
	mov	al,8
	push	ax
	lea	ax,WORD PTR [bp-42]	;TY
	push	ax
	call	__aNNalshr
; Line 280
; Line 281
$I721:
	cmp	WORD PTR _planelanding,0
	jge	$I723
; Line 282
	push	WORD PTR [bp-42]	;TY
	push	WORD PTR [bp-34]	;TX
	call	_Dist2D
	add	sp,4
	push	ax
	mov	ax,WORD PTR _Alt
	jmp	SHORT $L20020
	nop	
$I723:
; Line 285
	push	WORD PTR [bp-42]	;TY
	push	WORD PTR [bp-34]	;TX
	call	_Dist2D
	add	sp,4
	push	ax
	mov	ax,40
	imul	WORD PTR _planelanding
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+6]
$L20020:
	sub	ax,WORD PTR _ViewZ
	push	ax
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR _vPitch,ax
; Line 286
; Line 287
	push	WORD PTR [bp-42]	;TY
	push	WORD PTR [bp-34]	;TX
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR _vHead,ax
; Line 288
	mov	WORD PTR _vRoll,0
; Line 289
	jmp	$SB684
; Line 291
$SC725:
; Line 292
	mov	ax,WORD PTR _OurHead
	sub	ax,16384
	mov	WORD PTR _vHead,ax
; Line 294
	sub	ax,ax
	mov	WORD PTR _vPitch,ax
	mov	WORD PTR _vRoll,ax
; Line 295
	mov	cl,BYTE PTR [bp-22]	;vvScale
	mov	ax,24
	shl	ax,cl
	push	ax
	mov	cx,WORD PTR _OurHead
	add	ch,64
	push	cx
	mov	si,ax
	call	_sinX
	add	sp,4
	cwd	
	add	ax,WORD PTR _PxLng
	adc	dx,WORD PTR _PxLng+2
	mov	WORD PTR _ViewX,ax
	mov	WORD PTR _ViewX+2,dx
; Line 296
	push	si
	mov	ax,WORD PTR _OurHead
	add	ah,64
	push	ax
	call	_cosX
	add	sp,4
	cwd	
	add	ax,WORD PTR _PyLng
	adc	dx,WORD PTR _PyLng+2
	mov	WORD PTR _ViewY,ax
	mov	WORD PTR _ViewY+2,dx
; Line 297
	jmp	$SB684
; Line 299
	nop	
$SC728:
; Line 300
	mov	ax,WORD PTR _SteadyHead
	add	ax,WORD PTR _OurHead
	mov	WORD PTR _vHead,ax
; Line 301
	mov	cx,WORD PTR _SteadyPitch
	mov	WORD PTR _vPitch,cx
; Line 302
	mov	WORD PTR _vRoll,0
; Line 304
	push	ax
	push	cx
	mov	cl,BYTE PTR [bp-22]	;vvScale
	mov	ax,4
	shl	ax,cl
	push	ax
	mov	si,ax
	call	_ACosB
	add	sp,4
	push	ax
	call	_ASinB
	add	sp,4
	cwd	
	mov	cx,WORD PTR _PxLng
	mov	bx,WORD PTR _PxLng+2
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR _ViewX,cx
	mov	WORD PTR _ViewX+2,bx
; Line 305
	push	WORD PTR _vHead
	push	WORD PTR _vPitch
	push	si
	call	_ACosB
	add	sp,4
	push	ax
	call	_ACosB
	add	sp,4
	cwd	
	mov	cx,WORD PTR _PyLng
	mov	bx,WORD PTR _PyLng+2
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR _ViewY,cx
	mov	WORD PTR _ViewY+2,bx
; Line 306
	push	WORD PTR _vPitch
	push	si
	call	_ASinB
	add	sp,4
	mov	cl,BYTE PTR [bp-22]	;vvScale
	mov	dx,1
	shl	dx,cl
	sub	dx,ax
	add	dx,WORD PTR _Alt
	mov	WORD PTR _ViewZ,dx
; Line 307
	jmp	$SB684
; Line 309
$SC731:
; Line 312
	cmp	WORD PTR _View,205
	je	$I732
; Line 313
	mov	WORD PTR _RPov,0
; Line 314
	cmp	WORD PTR _PadLockee,-1
	je	$I734
	mov	WORD PTR _RPov,32
; Line 315
	jmp	SHORT $I734
	nop	
$I732:
; Line 316
	mov	ax,WORD PTR _PovMisl
	mov	WORD PTR _RPov,ax
; Line 318
$I734:
; Line 320
	mov	ax,WORD PTR [bp-22]	;vvScale
	mov	WORD PTR [bp-24],ax	;vSave
; Line 322
	test	BYTE PTR _RPov,64
	je	$JCC1729
	jmp	$I739
$JCC1729:
; Line 323
	test	BYTE PTR _RPov,32
	jne	$I736
; Line 324
	mov	ax,44
	imul	WORD PTR _RPov
	mov	bx,ax
	cmp	WORD PTR _ss[bx+26],0
	je	$I737
; Line 327
	mov	ax,WORD PTR _ss[bx]
	mov	dx,WORD PTR _ss[bx+2]
	mov	WORD PTR _Povx,ax
	mov	WORD PTR _Povx+2,dx
; Line 328
	mov	ax,WORD PTR _ss[bx+4]
	mov	dx,WORD PTR _ss[bx+6]
	mov	WORD PTR _Povy,ax
	mov	WORD PTR _Povy+2,dx
; Line 329
	mov	ax,WORD PTR _ss[bx+16]
	mov	WORD PTR _Povz,ax
; Line 330
	jmp	SHORT $I738
$I737:
; Line 331
	mov	ax,44
	imul	WORD PTR _RPov
	mov	bx,ax
	mov	ax,WORD PTR _OurHead
	mov	WORD PTR _ss[bx+20],ax
; Line 332
	mov	ax,WORD PTR _OurPitch
	mov	WORD PTR _ss[bx+22],ax
; Line 333
$I738:
; Line 334
	mov	WORD PTR [bp-22],5	;vvScale
; Line 335
	jmp	SHORT $I739
$I736:
; Line 336
	mov	ax,40
	imul	WORD PTR _PadLockee
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
	mov	WORD PTR _Povx,ax
	mov	WORD PTR _Povx+2,dx
; Line 337
	mov	ax,WORD PTR _ps[bx+12]
	mov	dx,WORD PTR _ps[bx+14]
	mov	WORD PTR _Povy,ax
	mov	WORD PTR _Povy+2,dx
; Line 338
	mov	ax,WORD PTR _ps[bx+6]
	mov	WORD PTR _Povz,ax
; Line 339
	mov	WORD PTR [bp-22],3	;vvScale
; Line 340
$I739:
; Line 341
; Line 344
	mov	ax,WORD PTR _Povx
	mov	dx,WORD PTR _Povx+2
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
	sub	ax,WORD PTR _Px
	mov	WORD PTR [bp-38],ax	;dx
; Line 345
	mov	cx,WORD PTR _Povy
	mov	dx,WORD PTR _Povy+2
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
	sub	cx,WORD PTR _Py
	mov	WORD PTR [bp-62],cx	;dy
; Line 346
	push	cx
	push	ax
	call	_Dist2D
	add	sp,4
	mov	WORD PTR [bp-26],ax	;dd
; Line 347
	mov	ax,WORD PTR [bp-62]	;dy
	neg	ax
	push	ax
	push	WORD PTR [bp-38]	;dx
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR _vHead,ax
; Line 348
	mov	ax,WORD PTR _SteadyHead
	add	WORD PTR _vHead,ax
; Line 349
	push	WORD PTR [bp-26]	;dd
	mov	cl,5
	mov	ax,WORD PTR _Povz
	sub	ax,WORD PTR _Alt
	sar	ax,cl
	push	ax
	call	_uangle
	add	sp,4
	neg	ax
	mov	WORD PTR _vPitch,ax
; Line 351
	mov	WORD PTR _vRoll,0
; Line 352
	mov	cx,WORD PTR [bp-24]	;vSave
	mov	WORD PTR [bp-22],cx	;vvScale
	mov	ax,4
	shl	ax,cl
	push	ax
	mov	dx,WORD PTR _SteadyPitch
	add	WORD PTR _vPitch,dx
	push	WORD PTR _vPitch
	mov	si,ax
	mov	WORD PTR [bp-86],cx
	call	_cosX
	add	sp,4
	mov	WORD PTR [bp-28],ax	;vDist
; Line 354
	test	BYTE PTR _RPov,96
	jne	$JCC2057
	jmp	$I741
$JCC2057:
; Line 355
	cmp	WORD PTR _View,203
	jne	$I742
; Line 356
	push	ax
	mov	ax,WORD PTR _vHead
	add	ah,128
	push	ax
	call	_sinX
	add	sp,4
	cwd	
	add	ax,WORD PTR _PxLng
	adc	dx,WORD PTR _PxLng+2
	mov	WORD PTR _ViewX,ax
	mov	WORD PTR _ViewX+2,dx
; Line 357
	push	WORD PTR [bp-28]	;vDist
	mov	ax,WORD PTR _vHead
	add	ah,128
	push	ax
	call	_cosX
	add	sp,4
	cwd	
	add	ax,WORD PTR _PyLng
	adc	dx,WORD PTR _PyLng+2
	mov	WORD PTR _ViewY,ax
	mov	WORD PTR _ViewY+2,dx
; Line 358
	push	si
	push	WORD PTR _vPitch
	call	_sinX
	add	sp,4
	mov	cl,BYTE PTR [bp-86]
	mov	dx,1
	shl	dx,cl
	add	ax,dx
	add	ax,WORD PTR _Alt
	mov	WORD PTR _ViewZ,ax
; Line 359
$L20021:
	neg	WORD PTR _vPitch
; Line 360
	jmp	$SB684
	nop	
$I742:
; Line 361
	push	ax
	push	WORD PTR _vHead
	call	_sinX
	add	sp,4
	cwd	
	add	ax,WORD PTR _Povx
	adc	dx,WORD PTR _Povx+2
	mov	WORD PTR _ViewX,ax
	mov	WORD PTR _ViewX+2,dx
; Line 362
	push	WORD PTR [bp-28]	;vDist
	push	WORD PTR _vHead
	call	_cosX
	add	sp,4
	cwd	
	sub	ax,WORD PTR _Povy
	sbb	dx,WORD PTR _Povy+2
	add	ax,0
	adc	dx,16
	mov	WORD PTR _ViewY,ax
	mov	WORD PTR _ViewY+2,dx
; Line 363
	mov	cl,BYTE PTR [bp-22]	;vvScale
	mov	ax,4
	shl	ax,cl
	push	ax
	push	WORD PTR _vPitch
	call	_sinX
	add	sp,4
	mov	dx,1
	mov	cl,BYTE PTR [bp-22]	;vvScale
	shl	dx,cl
	sub	dx,ax
	add	dx,WORD PTR _Povz
	mov	WORD PTR _ViewZ,dx
; Line 364
	add	BYTE PTR _vHead+1,128
; Line 365
; Line 366
	jmp	$SB684
	nop	
$I741:
; Line 368
	mov	ax,44
	imul	WORD PTR _RPov
	mov	bx,ax
	mov	ax,WORD PTR _ss[bx+20]
	add	ax,WORD PTR _SteadyHead
	sub	ax,8192
	mov	WORD PTR _vHead,ax
; Line 369
	mov	ax,WORD PTR _ss[bx+22]
	add	ax,WORD PTR _SteadyPitch
	add	ah,16
	mov	WORD PTR _vPitch,ax
; Line 370
	mov	cl,BYTE PTR [bp-22]	;vvScale
	mov	dx,16
	shl	dx,cl
	push	dx
	push	ax
	mov	si,dx
	call	_cosX
	add	sp,4
	mov	WORD PTR [bp-28],ax	;vDist
; Line 371
	push	ax
	push	WORD PTR _vHead
	call	_sinX
	add	sp,4
	cwd	
	mov	cx,WORD PTR _Povx
	mov	bx,WORD PTR _Povx+2
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR _ViewX,cx
	mov	WORD PTR _ViewX+2,bx
; Line 372
	push	WORD PTR [bp-28]	;vDist
	push	WORD PTR _vHead
	call	_cosX
	add	sp,4
	cwd	
	sub	cx,cx
	mov	bx,16
	sub	cx,ax
	sbb	bx,dx
	sub	cx,WORD PTR _Povy
	sbb	bx,WORD PTR _Povy+2
	mov	WORD PTR _ViewY,cx
	mov	WORD PTR _ViewY+2,bx
; Line 373
	push	si
	push	WORD PTR _vPitch
	call	_sinX
	add	sp,4
	sub	ax,WORD PTR _Povz
	neg	ax
$L20023:
	mov	WORD PTR _ViewZ,ax
; Line 374
; Line 375
	jmp	$SB684
; Line 377
$SC745:
; Line 378
	mov	WORD PTR _vPitch,-3072
; Line 379
	mov	WORD PTR _vRoll,0
; Line 380
	mov	ax,WORD PTR _ejectX
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
	mov	WORD PTR _ViewX,ax
	mov	WORD PTR _ViewX+2,dx
; Line 381
	mov	ax,WORD PTR _ejectY
	cwd	
	mov	cx,-32768
	sub	bx,bx
	sub	cx,ax
	sbb	bx,dx
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
	mov	WORD PTR _ViewY,cx
	mov	WORD PTR _ViewY+2,bx
; Line 382
	mov	ax,WORD PTR _ejectZ
	jmp	SHORT $L20023
	nop	
$S683:
	cmp	ax,70
	jne	$JCC2521
	jmp	$SC687
$JCC2521:
	jg	$L20006
	cmp	ax,5
	ja	$SB684
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20007[bx]
	nop	
$L20007:
		DW	$SC687
		DW	$SC706
		DW	$SC705
		DW	$SC687
		DW	$SC708
		DW	$SC707
$L20006:
	cmp	ax,202
	jne	$JCC2557
	jmp	$SC725
$JCC2557:
	jg	$L20008
	sub	ax,71
	jl	$SB684
	dec	ax
	jg	$JCC2570
	jmp	$SC688
$JCC2570:
	sub	ax,129
	jne	$JCC2578
	jmp	$SC728
$JCC2578:
	jmp	SHORT $SB684
	nop	
$L20008:
	sub	ax,203
	jl	$SB684
	dec	ax
	dec	ax
	jg	$JCC2593
	jmp	$SC731
$JCC2593:
	dec	ax
	jne	$JCC2599
	jmp	$SC745
$JCC2599:
	dec	ax
	jl	$SB684
	dec	ax
	jg	$JCC2608
	jmp	$SC709
$JCC2608:
$SB684:
; Line 386
	push	WORD PTR _vPitch
	call	_abs
	add	sp,2
	cmp	ax,16384
	jg	$I747
	cmp	WORD PTR _vPitch,-32768
	jne	$I746
$I747:
; Line 387
	mov	ax,-32768
	sub	ax,WORD PTR _vPitch
	mov	WORD PTR _vPitch,ax
; Line 388
	add	BYTE PTR _vHead+1,128
; Line 389
	mov	ax,-32768
	sub	ax,WORD PTR _vRoll
	mov	WORD PTR _vRoll,ax
; Line 390
; Line 392
$I746:
	cmp	WORD PTR _ViewZ,9
	jge	$I748
	mov	WORD PTR _ViewZ,9
; Line 394
$I748:
	cmp	WORD PTR _ViewZ,30
	jge	$I753
; Line 395
; Line 396
	mov	ax,100
	cwd	
	push	dx
	push	ax
	sub	cx,cx
	mov	bx,16
	sub	cx,WORD PTR _ViewY
	sbb	bx,WORD PTR _ViewY+2
	push	bx
	push	cx
	call	__aNlmul
	push	dx
	push	ax
	mov	ax,400
	imul	WORD PTR _ViewZ
	push	dx
	push	ax
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ViewX+2
	push	WORD PTR _ViewX
	call	__aNlmul
	push	dx
	push	ax
	call	_OnTheDeck
	add	sp,12
	mov	WORD PTR [bp-64],ax	;n
	or	ax,ax
	je	$I753
; Line 397
; Line 398
	cmp	WORD PTR _ViewZ,18
	jge	$I752
; Line 399
	mov	WORD PTR _ViewZ,18
; Line 400
$I752:
	or	ax,ax
	jge	$I753
; Line 401
	mov	WORD PTR _ViewZ,30
; Line 402
$I753:
; Line 403
; Line 405
	mov	ax,1
; Line 406
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_SetupView	ENDP
; Line 410
	PUBLIC	_NewMissileView
_NewMissileView	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 413
	cmp	WORD PTR _View,205
	jne	$FB760
; Line 414
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F758
; Line 418
$FC759:
	inc	WORD PTR [bp-2]	;i
$F758:
	cmp	WORD PTR [bp-2],28	;i
	jge	$FB760
; Line 416
	inc	WORD PTR _PovMisl
	cmp	WORD PTR _PovMisl,28
	jl	$I761
	mov	WORD PTR _PovMisl,0
; Line 417
$I761:
	mov	ax,44
	imul	WORD PTR _PovMisl
	mov	bx,ax
	cmp	WORD PTR _ss[bx+26],0
	je	$FC759
$FB760:
; Line 419
; Line 420
	mov	WORD PTR _View,205
; Line 421
	mov	ax,1
; Line 422
	mov	sp,bp
	pop	bp
	ret	
	nop	

_NewMissileView	ENDP
; Line 426
	PUBLIC	_NewTacView
_NewTacView	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
;	NewView = 4
; Line 429
	push	WORD PTR [bp+4]	;NewView
	call	_NewLockView
; Line 430
	mov	ax,WORD PTR [bp+4]	;NewView
	mov	WORD PTR _View,ax
; Line 431
	mov	ax,1
; Line 432
	mov	sp,bp
	pop	bp
	ret	

_NewTacView	ENDP
; Line 436
	PUBLIC	_NewLockView
_NewLockView	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
;	NewView = 4
; Line 439
	cmp	WORD PTR _PadLockee,-1
	jne	$I771
	mov	WORD PTR _PadLockee,0
; Line 441
$I771:
	mov	ax,WORD PTR [bp+4]	;NewView
	cmp	WORD PTR _View,ax
	je	$I773
	cmp	WORD PTR _DESIGNATED,-1
	je	$I773
	push	ax
	push	WORD PTR _DESIGNATED
	call	_WithinVisualRange
	add	sp,4
	or	ax,ax
	je	$I773
; Line 442
	mov	ax,WORD PTR _DESIGNATED
	mov	WORD PTR _PadLockee,ax
; Line 443
	jmp	SHORT $I781
	nop	
$I773:
; Line 444
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F775
	nop	
$FC776:
; Line 446
	inc	WORD PTR _PadLockee
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR _PadLockee,ax
	jl	$I778
	mov	WORD PTR _PadLockee,0
; Line 447
$I778:
	mov	ax,40
	imul	WORD PTR _PadLockee
	mov	bx,ax
	cmp	WORD PTR _ps[bx+26],0
	je	$L20024
; Line 448
	push	WORD PTR [bp+4]	;NewView
	push	WORD PTR _PadLockee
	call	_WithinVisualRange
	add	sp,4
	or	ax,ax
	jne	$FB777
; Line 449
; Line 450
$L20024:
	inc	WORD PTR [bp-2]	;i
$F775:
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR _NPLANES,ax
	jg	$FC776
$FB777:
; Line 451
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR _NPLANES,ax
	jne	$I781
	mov	WORD PTR _PadLockee,-1
; Line 452
$I781:
; Line 453
	mov	ax,WORD PTR [bp+4]	;NewView
	mov	WORD PTR _View,ax
; Line 454
	mov	ax,1
; Line 455
	mov	sp,bp
	pop	bp
	ret	

_NewLockView	ENDP
; Line 486
	PUBLIC	_WithinVisualRange
_WithinVisualRange	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	View = 6
;	Plane = 4
; Line 487
	cmp	WORD PTR [bp+6],71	;View
	jne	$L20012
	mov	ax,40
	imul	WORD PTR [bp+4]	;Plane
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+4]
	sub	ax,WORD PTR _Py
	push	ax
	mov	ax,WORD PTR _ps[bx+2]
	sub	ax,WORD PTR _Px
	push	ax
	call	_Dist2D
	mov	sp,bp
	cmp	ax,1024
	jge	$L20010
$L20012:
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$L20010:
	sub	ax,ax
; Line 488
	mov	sp,bp
	pop	bp
	ret	

_WithinVisualRange	ENDP
; Line 503
	PUBLIC	_DoPadLockView
_DoPadLockView	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,42
	call	__aNchkstk
;	VM = -36
;	TM = -18
;	HudOffX = -38
;	HudOffY = -40
;	SEG = -42
; Line 519
	lea	ax,WORD PTR [bp-36]	;VM
	push	ax
	push	WORD PTR _OurRoll
	mov	cx,WORD PTR _OurPitch
	neg	cx
	push	cx
	push	WORD PTR _OurHead
	call	_MakeMatHPR
	add	sp,8
; Line 520
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	lea	cx,WORD PTR [bp-36]	;VM
	push	cx
	call	_Trans3X3
	add	sp,4
; Line 521
	mov	bx,WORD PTR _Rp2
	mov	bx,WORD PTR [bx]
	shl	bx,1
	mov	ax,WORD PTR _GRPAGE0[bx]
	mov	WORD PTR _GRPAGE,ax
; Line 522
	mov	ax,OFFSET _PlaneAnimVals
	push	ax
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,36
	push	ax
	call	_NDraw3DObject
	add	sp,12
; Line 525
	push	WORD PTR _PadHead
	call	_abs
	add	sp,2
	cmp	ax,9728
	jge	$I802
; Line 527
	mov	ax,WORD PTR _PadPitch
	mov	cx,-51
	cwd	
	idiv	cx
	add	ax,WORD PTR _GYMID
	sub	ax,10
	mov	WORD PTR [bp-40],ax	;HudOffY
; Line 528
	push	ax
	mov	ax,WORD PTR _PadHead
	mov	cx,-38
	cwd	
	idiv	cx
	add	ax,WORD PTR _GXMID
	mov	WORD PTR [bp-38],ax	;HudOffX
	push	ax
	call	_FloatingHUD
	add	sp,4
; Line 529
; Line 531
$I802:
	mov	ax,2
	push	ax
	sub	ax,ax
	push	ax
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR [bp-42],ax	;SEG
	or	ax,ax
	jne	$JCC3276
	jmp	$I806
$JCC3276:
; Line 532
	push	WORD PTR _PadHead
	call	_abs
	add	sp,2
	cmp	ax,16896
	jle	$I806
; Line 533
	mov	ax,27648
	sub	ax,WORD PTR _PadHead
	mov	cx,38
	cwd	
	idiv	cx
	add	ax,WORD PTR _GXMID
	mov	WORD PTR [bp-38],ax	;HudOffX
; Line 534
	mov	ax,WORD PTR _PadPitch
	mov	cx,-51
	cwd	
	idiv	cx
	add	ax,WORD PTR _GYMID
	mov	WORD PTR [bp-40],ax	;HudOffY
; Line 535
	cmp	WORD PTR _PadHead,0
	jge	$I807
; Line 536
	mov	cx,1
	push	cx
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,256
	push	cx
	add	ax,31
	push	ax
	mov	ax,WORD PTR [bp-38]	;HudOffX
	add	ax,228
	jmp	SHORT $L20025
	nop	
$I807:
; Line 538
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,WORD PTR [bp-40]	;HudOffY
	add	ax,31
	push	ax
	mov	ax,WORD PTR [bp-38]	;HudOffX
	add	ax,41
$L20025:
	push	ax
	push	WORD PTR _Rp2
	mov	ax,138
	push	ax
	mov	ax,240
	push	ax
	mov	ax,131
	push	ax
	mov	ax,200
	push	ax
	push	WORD PTR [bp-42]	;SEG
	call	_ScaleRotate
; Line 539
; Line 540
$I806:
; Line 541
	mov	ax,1
; Line 542
	mov	sp,bp
	pop	bp
	ret	

_DoPadLockView	ENDP
; Line 546
	PUBLIC	_FloatingHUD
_FloatingHUD	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
;	i = -20
;	TM = -18
;	oldpage = -22
;	HudOffY = 6
;	HudOffX = 4
; Line 554
	mov	bx,WORD PTR _Rp2
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-22],ax	;oldpage
; Line 555
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	mov	cx,OFFSET _VM
	push	cx
	call	_Copy3X3
	add	sp,4
; Line 556
	mov	ax,18
	push	ax
	mov	ax,OFFSET _FM
	push	ax
	mov	ax,OFFSET _VM
	push	ax
	call	_memcpy
	add	sp,6
; Line 561
	mov	bx,WORD PTR _TDBRp
	mov	WORD PTR [bx],2
	mov	bx,WORD PTR _TDBRp
	mov	ax,WORD PTR [bx]
	mov	bx,WORD PTR _RBRp
	mov	WORD PTR [bx],ax
	mov	bx,WORD PTR _RBRp
	mov	ax,WORD PTR [bx]
	mov	bx,WORD PTR _PLRp
	mov	WORD PTR [bx],ax
	mov	bx,WORD PTR _PLRp
	mov	ax,WORD PTR [bx]
	mov	bx,WORD PTR _HDGRp
	mov	WORD PTR [bx],ax
	mov	bx,WORD PTR _HDGRp
	mov	ax,WORD PTR [bx]
	mov	bx,WORD PTR _Rp2
	mov	WORD PTR [bx],ax
; Line 563
	sub	ax,ax
	push	ax
	mov	cx,92
	push	cx
	mov	dx,197
	push	dx
	push	ax
	mov	dx,62
	push	dx
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 564
	call	_HUD
; Line 565
	mov	ax,OFFSET _VM
	push	ax
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	call	_Copy3X3
	add	sp,4
; Line 570
	mov	ax,WORD PTR [bp-22]	;oldpage
	mov	bx,WORD PTR _TDBRp
	mov	WORD PTR [bx],ax
	mov	bx,WORD PTR _TDBRp
	mov	ax,WORD PTR [bx]
	mov	bx,WORD PTR _RBRp
	mov	WORD PTR [bx],ax
	mov	bx,WORD PTR _RBRp
	mov	ax,WORD PTR [bx]
	mov	bx,WORD PTR _PLRp
	mov	WORD PTR [bx],ax
	mov	bx,WORD PTR _PLRp
	mov	ax,WORD PTR [bx]
	mov	bx,WORD PTR _HDGRp
	mov	WORD PTR [bx],ax
	mov	bx,WORD PTR _HDGRp
	mov	ax,WORD PTR [bx]
	mov	bx,WORD PTR _Rp2
	mov	WORD PTR [bx],ax
; Line 571
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	push	WORD PTR [bp+6]	;HudOffY
	push	WORD PTR [bp+4]	;HudOffX
	push	WORD PTR _Rp2
	mov	ax,92
	push	ax
	mov	ax,196
	push	ax
	mov	ax,46
	push	ax
	mov	ax,160
	push	ax
	push	WORD PTR _GRPAGE0+4
	call	_ScaleRotate
; Line 572
	mov	sp,bp
	pop	bp
	ret	

_FloatingHUD	ENDP
; Line 576
	PUBLIC	_CheckImHit
_CheckImHit	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 577
	cmp	WORD PTR _ImHit,0
	je	$I820
; Line 578
	mov	WORD PTR _ImHit,0
; Line 579
	test	BYTE PTR _View,128
	jne	$I820
; Line 580
	mov	ax,92
	push	ax
	mov	bx,WORD PTR _Rp3D
	mov	ax,WORD PTR [bx+8]
	inc	ax
	push	ax
	mov	ax,320
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	push	bx
	call	FAR PTR _RectFill
	add	sp,12
; Line 581
	mov	ax,60
	push	ax
	call	FAR PTR _Shake
	add	sp,2
; Line 582
; Line 583
$I820:
; Line 584
	mov	ax,1
; Line 585
	ret	
	nop	

_CheckImHit	ENDP
_TEXT	ENDS
END
