;	Static Name Aliases
;
;	$S652_ThrustVals	EQU	ThrustVals
;	$S653_CoolyVals	EQU	CoolyVals
;	$S654_RudderVals	EQU	RudderVals
	TITLE   C:\NJOYCAL.C
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
PUBLIC  _KeyJoyInstalled
PUBLIC  _RpJoyX
PUBLIC  _RpJoy
PUBLIC  _RpJoyBackX
PUBLIC  _RpJoyBack
EXTRN	_fwrite:NEAR
EXTRN	_ScaleRotate:NEAR
EXTRN	_Trigger2:FAR
EXTRN	_kbhit:NEAR
EXTRN	_InitJoy2:FAR
EXTRN	_RemoveKeyJoy:NEAR
EXTRN	_ReadJoy2:FAR
EXTRN	_InstallKeyJoy:NEAR
EXTRN	_WaitTicks:NEAR
EXTRN	_DrawLine:FAR
EXTRN	_RectCopy:FAR
EXTRN	__aNchkstk:NEAR
EXTRN	_RpPrint:FAR
EXTRN	__bios_keybrd:NEAR
EXTRN	_fclose:NEAR
EXTRN	_LoadPicNoPal:NEAR
EXTRN	_fopen:NEAR
EXTRN	_pstrlen:NEAR
EXTRN	_fread:NEAR
EXTRN	_GRPAGE0:BYTE
EXTRN	_Joystick:WORD
EXTRN	_ThrustStick:WORD
EXTRN	_CoolyStick:WORD
EXTRN	_RudderStick:WORD
EXTRN	_MinStick:BYTE
EXTRN	_MaxStick:BYTE
EXTRN	_CenterPosition:BYTE
EXTRN	_LowRange:BYTE
EXTRN	_HighRange:BYTE
EXTRN	_RawJoy:BYTE
EXTRN	_DeadZone:BYTE
EXTRN	_JoyVals:BYTE
EXTRN	_KbSense:WORD
EXTRN	_GRNDDETAIL:WORD
EXTRN	_PLANEDETAIL:WORD
EXTRN	_SKYDETAIL:WORD
EXTRN	_MISSILETRAIL:WORD
EXTRN	_MSGDETAIL:WORD
EXTRN	_SNDDETAIL:WORD
EXTRN	_StickType:WORD
EXTRN	_RudderType:WORD
_DATA      SEGMENT
	ORG	$+84
$SG673	DB	'joypic.pic',  00H
$SG678	DB	'Center Stick and Pedals',  00H
$SG679	DB	'Center Joystick',  00H
$SG680	DB	'Center Pedals',  00H
$SG683	DB	'Move Stick Upper Left',  00H
$SG685	DB	'Move Stick Lower Right',  00H
$SG688	DB	'Move Pedals Left',  00H
$SG690	DB	'Move Pedals Right',  00H
$SG693	DB	'Move Throttle Down',  00H
$SG695	DB	'Move Throttle Up',  00H
$SG696	DB	'Adjust Dead Zone (+-)',  00H
$SG713	DB	'Then press Trigger',  00H
$SG714	DB	'Then press Trigger',  00H
$SG769	DB	'rb',  00H
$SG770	DB	'JOY.F14',  00H
$SG789	DB	'wb',  00H
$SG790	DB	'JOY.f14',  00H
	ORG	$-347
_RpJoyX	DW	00H
	DW	00H
	DW	00H
	DW	013fH
	DW	0c7H
	DW	02H
	DW	0fH
	DW	07H
	DW	02H
_RpJoy	DW	DGROUP:_RpJoyX
_RpJoyBackX	DW	01H
	DW	00H
	DW	00H
	DW	013fH
	DW	0c7H
	DW	02H
	DW	0fH
	DW	07H
	DW	02H
_RpJoyBack	DW	DGROUP:_RpJoyBackX
$S652_ThrustVals	DW	00H
	DW	00H
	DW	08H
	DW	08H
	DW	00H
	DW	08H
	DW	08H
$S653_CoolyVals	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	08H
	DW	00H
	DW	00H
$S654_RudderVals	DW	00H
	DW	00H
	DW	04H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
_KeyJoyInstalled	DW	00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 2
; Line 3
; Line 4
; Line 19
; Line 5
; Line 6
; Line 106
	PUBLIC	_SetJoysticks
_SetJoysticks	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	i = 4
; Line 109
	mov	ax,WORD PTR [bp+4]	;i
	mov	WORD PTR _StickType,ax
	cmp	ax,1
	cmc	
	sbb	cx,cx
	and	cx,3
	mov	WORD PTR _Joystick,cx
; Line 110
	mov	bx,ax
	shl	bx,1
	mov	cx,WORD PTR $S652_ThrustVals[bx]
	mov	WORD PTR _ThrustStick,cx
; Line 111
	mov	cx,WORD PTR $S653_CoolyVals[bx]
	mov	WORD PTR _CoolyStick,cx
; Line 112
	mov	cx,WORD PTR $S654_RudderVals[bx]
	or	WORD PTR _RudderStick,cx
; Line 114
	or	ax,ax
	je	$I659
; Line 115
; Line 116
	cmp	WORD PTR _KeyJoyInstalled,0
	je	$I663
; Line 117
; Line 118
	call	_RemoveKeyJoy
; Line 119
	mov	WORD PTR _KeyJoyInstalled,0
; Line 120
; Line 121
; Line 122
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I659:
; Line 123
; Line 124
	cmp	WORD PTR _KeyJoyInstalled,0
	jne	$I663
; Line 125
; Line 126
	call	_InstallKeyJoy
; Line 127
	mov	WORD PTR _KeyJoyInstalled,1
; Line 128
; Line 129
$I663:
; Line 130
	mov	sp,bp
	pop	bp
	ret	

_SetJoysticks	ENDP
; Line 132
	PUBLIC	_GetRidOfKeyJoy
_GetRidOfKeyJoy	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 133
	cmp	WORD PTR _KeyJoyInstalled,0
	je	$I667
; Line 134
; Line 135
	call	_RemoveKeyJoy
; Line 136
	mov	WORD PTR _KeyJoyInstalled,0
; Line 137
; Line 138
$I667:
	ret	

_GetRidOfKeyJoy	ENDP
; Line 143
	PUBLIC	_JoyRecal
_JoyRecal	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	b = -2
;	y = 6
;	x = 4
; Line 146
	mov	ax,OFFSET DGROUP:$SG673
	push	ax
	mov	ax,1
	push	ax
	call	_LoadPicNoPal
	add	sp,4
; Line 148
	cmp	WORD PTR _Joystick,0
	jne	$I675
	cmp	WORD PTR _RudderStick,0
	jne	$JCC157
	jmp	$I674
$JCC157:
$I675:
; Line 149
	mov	BYTE PTR _DeadZone,12
; Line 150
	mov	ax,WORD PTR _RudderStick
	or	ax,WORD PTR _Joystick
	push	ax
	call	FAR PTR _InitJoy2
	add	sp,2
; Line 154
	mov	ax,-1
	push	ax
	cmp	WORD PTR _Joystick,0
	je	$L20003
	cmp	WORD PTR _RudderStick,0
	je	$L20005
	mov	ax,OFFSET DGROUP:$SG678
	jmp	SHORT $L20004
$L20005:
	mov	ax,OFFSET DGROUP:$SG679
	jmp	SHORT $L20004
	nop	
$L20003:
	mov	ax,OFFSET DGROUP:$SG680
$L20004:
	push	ax
	call	_NWaitShowJoy
	add	sp,4
	inc	ax
	jne	$JCC223
	jmp	$I674
$JCC223:
; Line 157
	cmp	WORD PTR _Joystick,0
	je	$I681
; Line 158
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:$SG683
	push	ax
	call	_NWaitShowJoy
	add	sp,4
	inc	ax
	je	$I674
; Line 160
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:$SG685
	push	ax
	call	_NWaitShowJoy
	add	sp,4
	inc	ax
	je	$I674
; Line 162
; Line 164
$I681:
	cmp	WORD PTR _RudderStick,0
	je	$I686
; Line 165
	mov	ax,16
	push	ax
	mov	ax,OFFSET DGROUP:$SG688
	push	ax
	call	_NWaitShowJoy
	add	sp,4
	inc	ax
	je	$I674
; Line 167
	mov	ax,32
	push	ax
	mov	ax,OFFSET DGROUP:$SG690
	push	ax
	call	_NWaitShowJoy
	add	sp,4
	inc	ax
	je	$I674
; Line 169
; Line 171
$I686:
	cmp	WORD PTR _ThrustStick,0
	je	$I691
; Line 172
	mov	ax,64
	push	ax
	mov	ax,OFFSET DGROUP:$SG693
	push	ax
	call	_NWaitShowJoy
	add	sp,4
	inc	ax
	je	$I674
; Line 174
	mov	ax,128
	push	ax
	mov	ax,OFFSET DGROUP:$SG695
	push	ax
	call	_NWaitShowJoy
	add	sp,4
	inc	ax
	je	$I674
; Line 176
; Line 177
$I691:
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG696
	push	ax
	call	_NWaitShowJoy
	add	sp,4
; Line 178
; Line 179
$I674:
	mov	sp,bp
	pop	bp
	ret	
	nop	
	nop	

_JoyRecal	ENDP
; Line 183
	PUBLIC	_NShowJoy
_NShowJoy	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
	push	si
;	w = -4
;	z = -12
;	d = -2
;	i = -8
;	SEG = -14
;	x = -6
;	y = -10
;	j = 6
;	msg = 4
; Line 187
	mov	bx,WORD PTR _RpJoyBack
	mov	bx,WORD PTR [bx]
	shl	bx,1
	mov	ax,WORD PTR _GRPAGE0[bx]
	mov	WORD PTR [bp-14],ax	;SEG
; Line 194
	mov	al,BYTE PTR [bp+6]	;j
	mov	cl,4
	cbw	
	idiv	cl
	cbw	
	mov	WORD PTR [bp-6],ax	;x
; Line 195
	mov	dx,ax
	mov	al,BYTE PTR [bp+7]
	cbw	
	idiv	cl
	cbw	
	mov	WORD PTR [bp-10],ax	;y
; Line 196
	mov	bx,ax
	mov	al,BYTE PTR [bp+8]
	cbw	
	idiv	cl
	cbw	
	mov	WORD PTR [bp-4],ax	;w
; Line 197
	mov	al,BYTE PTR [bp+9]
	cbw	
	idiv	cl
	cbw	
	mov	WORD PTR [bp-12],ax	;z
; Line 200
	mov	ax,dx
	mov	cx,dx
	imul	cx
	mov	cx,ax
	mov	ax,bx
	imul	bx
	add	cx,ax
	mov	WORD PTR [bp-2],cx	;d
; Line 201
	mov	WORD PTR [bp-8],1	;i
	jmp	SHORT $F708
; Line 203
	nop	
$FC709:
	inc	WORD PTR [bp-8]	;i
$F708:
	cmp	WORD PTR [bp-8],65	;i
	jge	$FB710
; Line 202
	mov	ax,WORD PTR [bp-8]	;i
	mov	cx,ax
	imul	cx
	cmp	ax,WORD PTR [bp-2]	;d
	jle	$FC709
$FB710:
; Line 205
	cmp	WORD PTR [bp-6],0	;x
	jl	$L20007
	mov	ax,WORD PTR [bp-6]	;x
	mov	cx,ax
	imul	cx
	cwd	
	idiv	WORD PTR [bp-8]	;i
	jmp	SHORT $L20008
$L20007:
	mov	ax,WORD PTR [bp-6]	;x
	mov	cx,ax
	imul	cx
	cwd	
	idiv	WORD PTR [bp-8]	;i
	neg	ax
$L20008:
	mov	WORD PTR [bp-6],ax	;x
; Line 209
	mov	ax,20
	push	ax
	mov	cx,158
	push	cx
	push	WORD PTR _RpJoyBack
	mov	dx,129
	push	dx
	mov	bx,117
	push	bx
	mov	si,70
	push	si
	sub	si,si
	push	si
	push	WORD PTR _RpJoyBack
	call	FAR PTR _RectCopy
	add	sp,16
; Line 212
	mov	ax,15
	push	ax
	mov	cl,BYTE PTR _DeadZone
	shr	cl,1
	sub	ch,ch
	mov	dx,cx
	mov	bx,cx
	sub	cx,84
	neg	cx
	push	cx
	add	dx,210
	push	dx
	push	cx
	sub	bx,210
	neg	bx
	push	bx
	push	WORD PTR _RpJoyBack
	call	FAR PTR _DrawLine
	add	sp,12
; Line 213
	mov	ax,15
	push	ax
	mov	cl,BYTE PTR _DeadZone
	shr	cl,1
	sub	ch,ch
	mov	dx,cx
	add	cx,84
	push	cx
	mov	cx,dx
	add	dx,210
	push	dx
	sub	cx,84
	neg	cx
	push	cx
	push	dx
	push	WORD PTR _RpJoyBack
	call	FAR PTR _DrawLine
	add	sp,12
; Line 214
	mov	ax,15
	push	ax
	mov	cl,BYTE PTR _DeadZone
	shr	cl,1
	sub	ch,ch
	mov	dx,cx
	add	cx,84
	push	cx
	mov	bx,dx
	sub	dx,210
	neg	dx
	push	dx
	push	cx
	lea	cx,WORD PTR [bx+210]
	push	cx
	push	WORD PTR _RpJoyBack
	call	FAR PTR _DrawLine
	add	sp,12
; Line 215
	mov	ax,15
	push	ax
	mov	al,BYTE PTR _DeadZone
	shr	al,1
	sub	ah,ah
	mov	cx,ax
	mov	dx,ax
	sub	ax,84
	neg	ax
	push	ax
	sub	dx,210
	neg	dx
	push	dx
	add	cx,84
	push	cx
	push	dx
	push	WORD PTR _RpJoyBack
	call	FAR PTR _DrawLine
	add	sp,12
; Line 219
	push	si
	push	si
	push	si
	mov	ax,256
	push	ax
	cmp	WORD PTR [bp-10],0	;y
	jl	$L20009
	mov	ax,WORD PTR [bp-10]	;y
	mov	cx,ax
	imul	cx
	cwd	
	idiv	WORD PTR [bp-8]	;i
	jmp	SHORT $L20010
$L20009:
	mov	ax,WORD PTR [bp-10]	;y
	mov	cx,ax
	imul	cx
	cwd	
	idiv	WORD PTR [bp-8]	;i
	neg	ax
$L20010:
	add	ax,84
	push	ax
	mov	ax,WORD PTR [bp-6]	;x
	add	ax,210
	push	ax
	push	WORD PTR _RpJoyBack
	mov	ax,6
	push	ax
	push	ax
	mov	ax,72
	push	ax
	mov	ax,123
	push	ax
	push	WORD PTR [bp-14]	;SEG
	call	_ScaleRotate
	add	sp,24
; Line 224
	mov	ax,86
	sub	ax,WORD PTR [bp-12]	;z
	push	ax
	mov	ax,257
	push	ax
	push	WORD PTR _RpJoyBack
	mov	ax,4
	push	ax
	mov	ax,8
	push	ax
	mov	cx,90
	push	cx
	mov	cx,121
	push	cx
	push	WORD PTR _RpJoyBack
	call	FAR PTR _RectCopy
	add	sp,16
; Line 230
	mov	ax,132
	push	ax
	mov	ax,WORD PTR [bp-4]	;w
	add	ax,208
	push	ax
	push	WORD PTR _RpJoyBack
	mov	ax,8
	push	ax
	mov	ax,5
	push	ax
	mov	ax,78
	push	ax
	mov	ax,121
	push	ax
	push	WORD PTR _RpJoyBack
	call	FAR PTR _RectCopy
	add	sp,16
; Line 233
	mov	bx,WORD PTR _RpJoyBack
	mov	WORD PTR [bx+12],0
; Line 234
	push	WORD PTR [bp+4]	;msg
	mov	ax,27
	push	ax
	mov	ax,211
	push	ax
	push	WORD PTR _RpJoyBack
	call	_CenterPrint
	add	sp,8
; Line 235
	mov	ax,OFFSET DGROUP:$SG713
	push	ax
	mov	ax,33
	push	ax
	mov	ax,211
	push	ax
	push	WORD PTR _RpJoyBack
	call	_CenterPrint
	add	sp,8
; Line 236
	mov	bx,WORD PTR _RpJoyBack
	mov	WORD PTR [bx+12],51
; Line 237
	push	WORD PTR [bp+4]	;msg
	mov	ax,26
	push	ax
	mov	ax,210
	push	ax
	push	WORD PTR _RpJoyBack
	call	_CenterPrint
	add	sp,8
; Line 238
	mov	ax,OFFSET DGROUP:$SG714
	push	ax
	mov	ax,32
	push	ax
	mov	ax,210
	push	ax
	push	WORD PTR _RpJoyBack
	call	_CenterPrint
	add	sp,8
; Line 240
	mov	ax,20
	push	ax
	mov	cx,158
	push	cx
	push	WORD PTR _RpJoy
	mov	dx,129
	push	dx
	mov	dx,117
	push	dx
	push	ax
	push	cx
	push	WORD PTR _RpJoyBack
	call	FAR PTR _RectCopy
	add	sp,16
; Line 241
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_NShowJoy	ENDP
; Line 245
	PUBLIC	_NWaitShowJoy
_NWaitShowJoy	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	i = -4
;	v = -2
;	j = -8
;	vals = 6
;	msg = 4
; Line 249
$FC722:
	sub	ax,ax
	push	ax
	call	FAR PTR _Trigger2
	add	sp,2
	or	ax,ax
	je	$JCC1070
	jmp	$FB723
$JCC1070:
; Line 250
; Line 251
	call	_kbhit
	or	ax,ax
	je	$SB727
; Line 252
; Line 253
	sub	ax,ax
	push	ax
	call	__bios_keybrd
	add	sp,2
	cmp	ax,3389
	je	$SC730
	ja	$L20011
	sub	ax,283
	je	$SC734
	sub	ax,2834
	je	$SC732
	sub	ax,254
	jmp	SHORT $L20014
; Line 254
; Line 255
	nop	
$SC730:
; Line 258
	cmp	BYTE PTR _DeadZone,63
	jae	$SB727
	add	BYTE PTR _DeadZone,4
; Line 259
$SB727:
; Line 270
; Line 272
	mov	ax,1
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 273
	mov	ax,WORD PTR _RudderStick
	or	ax,WORD PTR _CoolyStick
	or	ax,WORD PTR _ThrustStick
	or	ax,WORD PTR _Joystick
	push	ax
	call	FAR PTR _ReadJoy2
	add	sp,2
	mov	WORD PTR [bp-8],ax	;j
	mov	WORD PTR [bp-6],dx
; Line 275
	cmp	WORD PTR [bp+6],-1	;vals
	jne	$I737
; Line 276
; Line 277
	mov	WORD PTR [bp-4],0	;i
	jmp	SHORT $F738
; Line 261
	nop	
$SC732:
; Line 263
	cmp	BYTE PTR _DeadZone,7
	jbe	$SB727
	sub	BYTE PTR _DeadZone,4
; Line 264
	jmp	SHORT $SB727
; Line 265
$SC734:
; Line 266
	mov	ax,-1
	mov	sp,bp
	pop	bp
	ret	
; Line 267
	nop	
$SC735:
; Line 268
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
$L20011:
	sub	ax,7181
	je	$SC735
	sub	ax,11808
	je	$SC732
	sub	ax,1022
$L20014:
	je	$SC730
	jmp	SHORT $SB727
	nop	
$FC739:
	inc	WORD PTR [bp-4]	;i
$F738:
	cmp	WORD PTR [bp-4],4	;i
	jge	$FB740
; Line 278
; Line 280
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	mov	ax,WORD PTR _RawJoy[bx]
	mov	WORD PTR _MinStick[bx],ax
	mov	cx,ax
	sub	ax,WORD PTR _CenterPosition[bx]
	neg	ax
	mov	WORD PTR _LowRange[bx],ax
; Line 281
	mov	WORD PTR _MaxStick[bx],cx
; Line 282
	sub	cx,WORD PTR _CenterPosition[bx]
	mov	WORD PTR _HighRange[bx],cx
; Line 283
	jmp	SHORT $FC739
$FB740:
; Line 284
	sub	al,al
	mov	BYTE PTR [bp-5],al
	mov	BYTE PTR [bp-6],al
	mov	BYTE PTR [bp-7],al
	mov	BYTE PTR [bp-8],al	;j
; Line 285
; Line 286
	jmp	SHORT $I741
$I737:
; Line 287
; Line 288
	mov	WORD PTR [bp-4],0	;i
	mov	ax,WORD PTR [bp+6]	;vals
	mov	WORD PTR [bp-2],ax	;v
	jmp	SHORT $F742
	nop	
$FC743:
; Line 289
; Line 290
	test	BYTE PTR [bp-2],1	;v
	je	$I745
; Line 291
; Line 293
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	mov	ax,WORD PTR _RawJoy[bx]
	mov	WORD PTR _MinStick[bx],ax
	sub	ax,WORD PTR _CenterPosition[bx]
	neg	ax
	mov	WORD PTR _LowRange[bx],ax
; Line 294
; Line 295
$I745:
	test	BYTE PTR [bp-2],2	;v
	je	$L20015
; Line 296
; Line 298
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	mov	ax,WORD PTR _RawJoy[bx]
	mov	WORD PTR _MaxStick[bx],ax
	sub	ax,WORD PTR _CenterPosition[bx]
	mov	WORD PTR _HighRange[bx],ax
; Line 299
; Line 300
$L20015:
	inc	WORD PTR [bp-4]	;i
	mov	cl,2
	sar	WORD PTR [bp-2],cl	;v
$F742:
	cmp	WORD PTR [bp-4],4	;i
	jl	$FC743
; Line 301
$I741:
; Line 303
	mov	ax,10
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 304
	push	WORD PTR [bp-6]
	push	WORD PTR [bp-8]	;j
	push	WORD PTR [bp+4]	;msg
	call	_NShowJoy
	add	sp,6
; Line 305
	jmp	$FC722
$FB723:
; Line 307
	cmp	WORD PTR [bp+6],-1	;vals
	jne	$I747
; Line 308
	mov	ax,WORD PTR _RudderStick
	or	ax,WORD PTR _Joystick
	push	ax
	call	FAR PTR _InitJoy2
	add	sp,2
; Line 311
$I747:
	sub	ax,ax
	push	ax
	call	FAR PTR _Trigger2
	add	sp,2
	or	ax,ax
	jne	$JCC1437
	jmp	$SC735
$JCC1437:
; Line 312
; Line 313
	call	_kbhit
	or	ax,ax
	je	$I751
; Line 314
; Line 315
	sub	ax,ax
	push	ax
	call	__bios_keybrd
	add	sp,2
	sub	ax,283
	jne	$JCC1461
	jmp	$SC734
$JCC1461:
; Line 320
; Line 321
$I751:
	mov	ax,10
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 322
	push	WORD PTR [bp-6]
	push	WORD PTR [bp-8]	;j
	push	WORD PTR [bp+4]	;msg
	call	_NShowJoy
	add	sp,6
; Line 323
	jmp	SHORT $I747
	nop	

_NWaitShowJoy	ENDP
; Line 328
	PUBLIC	_RedrawJoyBox
_RedrawJoyBox	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 329
	mov	ax,20
	push	ax
	mov	cx,158
	push	cx
	push	WORD PTR _RpJoy
	mov	dx,129
	push	dx
	mov	dx,117
	push	dx
	push	ax
	push	cx
	push	WORD PTR _RpJoyBack
	call	FAR PTR _RectCopy
	add	sp,16
; Line 331
	ret	

_RedrawJoyBox	ENDP
; Line 335
	PUBLIC	_CenterPrint
_CenterPrint	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	str = 10
;	y = 8
;	x = 6
;	Rp = 4
; Line 337
	push	WORD PTR [bp+10]	;str
	push	WORD PTR [bp+8]	;y
	push	WORD PTR [bp+10]	;str
	push	WORD PTR [bp+4]	;Rp
	call	_pstrlen
	add	sp,4
	sub	ax,-1
	neg	ax
	cwd	
	sub	ax,dx
	sar	ax,1
	add	WORD PTR [bp+6],ax	;x
	push	WORD PTR [bp+6]	;x
	push	WORD PTR [bp+4]	;Rp
	call	FAR PTR _RpPrint
; Line 338
	mov	sp,bp
	pop	bp
	ret	

_CenterPrint	ENDP
; Line 342
	PUBLIC	_GetJoyConfig
_GetJoyConfig	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	offset = -4
;	f = -2
; Line 349
	mov	ax,OFFSET DGROUP:$SG769
	push	ax
	mov	ax,OFFSET DGROUP:$SG770
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR [bp-2],ax	;f
	push	ax
	mov	cx,1
	push	cx
	mov	dx,2
	push	dx
	lea	bx,WORD PTR [bp-4]	;offset
	push	bx
	call	_fread
	add	sp,8
; Line 350
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	ax,2
	push	ax
	mov	ax,OFFSET _KbSense
	push	ax
	call	_fread
	add	sp,8
; Line 351
	cmp	WORD PTR _KbSense,0
	jl	$I772
	cmp	WORD PTR _KbSense,2
	jle	$I771
$I772:
	mov	WORD PTR _KbSense,0
; Line 352
$I771:
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	ax,2
	push	ax
	mov	ax,OFFSET _SNDDETAIL
	push	ax
	call	_fread
	add	sp,8
; Line 353
	cmp	WORD PTR _SNDDETAIL,0
	jl	$I774
	cmp	WORD PTR _SNDDETAIL,3
	jle	$I773
$I774:
	mov	WORD PTR _SNDDETAIL,0
; Line 354
$I773:
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	ax,2
	push	ax
	mov	ax,OFFSET _MSGDETAIL
	push	ax
	call	_fread
	add	sp,8
; Line 355
	cmp	WORD PTR _MSGDETAIL,0
	jl	$I776
	cmp	WORD PTR _MSGDETAIL,3
	jle	$I775
$I776:
	mov	WORD PTR _MSGDETAIL,0
; Line 356
$I775:
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	ax,2
	push	ax
	mov	ax,OFFSET _SKYDETAIL
	push	ax
	call	_fread
	add	sp,8
; Line 357
	cmp	WORD PTR _SKYDETAIL,0
	jl	$I778
	cmp	WORD PTR _SKYDETAIL,3
	jle	$I777
$I778:
	mov	WORD PTR _SKYDETAIL,0
; Line 358
$I777:
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	ax,2
	push	ax
	mov	ax,OFFSET _GRNDDETAIL
	push	ax
	call	_fread
	add	sp,8
; Line 359
	cmp	WORD PTR _GRNDDETAIL,0
	jl	$I780
	cmp	WORD PTR _GRNDDETAIL,3
	jle	$I779
$I780:
	mov	WORD PTR _GRNDDETAIL,0
; Line 360
$I779:
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	ax,2
	push	ax
	mov	ax,OFFSET _PLANEDETAIL
	push	ax
	call	_fread
	add	sp,8
; Line 361
	cmp	WORD PTR _PLANEDETAIL,0
	jl	$I782
	cmp	WORD PTR _PLANEDETAIL,3
	jle	$I781
$I782:
	mov	WORD PTR _PLANEDETAIL,3
; Line 362
$I781:
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	ax,2
	push	ax
	mov	ax,OFFSET _MISSILETRAIL
	push	ax
	call	_fread
	add	sp,8
; Line 363
	cmp	WORD PTR _MISSILETRAIL,0
	jl	$I784
	cmp	WORD PTR _MISSILETRAIL,2
	jle	$I783
$I784:
	mov	WORD PTR _MISSILETRAIL,0
; Line 365
$I783:
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET _StickType
	push	dx
	call	_fread
	add	sp,8
; Line 366
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET _RudderType
	push	dx
	call	_fread
	add	sp,8
; Line 367
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET _Joystick
	push	dx
	call	_fread
	add	sp,8
; Line 368
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET _ThrustStick
	push	dx
	call	_fread
	add	sp,8
; Line 369
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET _CoolyStick
	push	dx
	call	_fread
	add	sp,8
; Line 370
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	cx,OFFSET _RudderStick
	push	cx
	call	_fread
	add	sp,8
; Line 372
	push	WORD PTR [bp-2]	;f
	mov	ax,52
	push	ax
	mov	ax,1
	push	ax
	mov	cx,OFFSET _JoyVals
	push	cx
	call	_fread
	add	sp,8
; Line 374
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	push	ax
	mov	ax,OFFSET _DeadZone
	push	ax
	call	_fread
	add	sp,8
; Line 376
	push	WORD PTR [bp-2]	;f
	call	_fclose
; Line 377
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetJoyConfig	ENDP
; Line 381
	PUBLIC	_SaveJoyConfig
_SaveJoyConfig	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	f = -2
;	offset = -4
; Line 383
	mov	WORD PTR [bp-4],16	;offset
; Line 387
	mov	ax,OFFSET DGROUP:$SG789
	push	ax
	mov	ax,OFFSET DGROUP:$SG790
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR [bp-2],ax	;f
	push	ax
	mov	cx,1
	push	cx
	mov	dx,2
	push	dx
	lea	bx,WORD PTR [bp-4]	;offset
	push	bx
	call	_fwrite
	add	sp,8
; Line 388
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET _KbSense
	push	dx
	call	_fwrite
	add	sp,8
; Line 389
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET _SNDDETAIL
	push	dx
	call	_fwrite
	add	sp,8
; Line 390
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET _MSGDETAIL
	push	dx
	call	_fwrite
	add	sp,8
; Line 391
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET _SKYDETAIL
	push	dx
	call	_fwrite
	add	sp,8
; Line 392
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET _GRNDDETAIL
	push	dx
	call	_fwrite
	add	sp,8
; Line 393
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET _PLANEDETAIL
	push	dx
	call	_fwrite
	add	sp,8
; Line 394
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET _MISSILETRAIL
	push	dx
	call	_fwrite
	add	sp,8
; Line 396
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET _StickType
	push	dx
	call	_fwrite
	add	sp,8
; Line 397
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET _RudderType
	push	dx
	call	_fwrite
	add	sp,8
; Line 399
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET _Joystick
	push	dx
	call	_fwrite
	add	sp,8
; Line 400
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET _ThrustStick
	push	dx
	call	_fwrite
	add	sp,8
; Line 401
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET _CoolyStick
	push	dx
	call	_fwrite
	add	sp,8
; Line 402
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	cx,OFFSET _RudderStick
	push	cx
	call	_fwrite
	add	sp,8
; Line 403
	push	WORD PTR [bp-2]	;f
	mov	ax,52
	push	ax
	mov	ax,1
	push	ax
	mov	cx,OFFSET _JoyVals
	push	cx
	call	_fwrite
	add	sp,8
; Line 404
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	push	ax
	mov	ax,OFFSET _DeadZone
	push	ax
	call	_fwrite
	add	sp,8
; Line 405
	push	WORD PTR [bp-2]	;f
	call	_fclose
; Line 406
	mov	sp,bp
	pop	bp
	ret	

_SaveJoyConfig	ENDP
_TEXT	ENDS
END
