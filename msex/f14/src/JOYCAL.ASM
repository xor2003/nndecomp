;	Static Name Aliases
;
;	$S502_JoyX	EQU	JoyX
;	$S503_JoyY	EQU	JoyY
;	$S504_JoyW	EQU	JoyW
;	$S505_JoyZ	EQU	JoyZ
;	$S506_JoyColor	EQU	JoyColor
;	$S507_RudColor	EQU	RudColor
;	$S508_ThrstColor	EQU	ThrstColor
	TITLE   C:\JOYCAL.C
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
PUBLIC  _RpJoyX
PUBLIC  _RpJoy
EXTRN	_WaitTicks:NEAR
EXTRN	_Trigger2:FAR
EXTRN	_GetRpPixel:NEAR
EXTRN	_InitJoy2:FAR
EXTRN	_ReadJoy2:FAR
EXTRN	_pstrlen:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_DrawLine:FAR
EXTRN	_DrawDot:FAR
EXTRN	_RpPrint:FAR
EXTRN	__bios_keybrd:NEAR
EXTRN	_kbhit:NEAR
EXTRN	_RectFill:FAR
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
_DATA      SEGMENT
$SG517	DB	'Center Stick and Pedals',  00H
$SG518	DB	'Center Joystick',  00H
$SG519	DB	'Center Pedals',  00H
$SG527	DB	'Move Stick Upper Left',  00H
$SG531	DB	'Move Stick Lower Right',  00H
$SG536	DB	'Move Pedals Left',  00H
$SG540	DB	'Move Pedals Right',  00H
$SG545	DB	'Move Throttle Down',  00H
$SG549	DB	'Move Throttle Up',  00H
$SG553	DB	'Adjust Dead Zone (+-)',  00H
	ORG	$+20
$SG578	DB	'Press Fire Button',  00H
	ORG	$-38
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
_DATA      ENDS
_BSS      SEGMENT
	ORG	$+4
$S502_JoyX	DW 01H DUP (?)
$S503_JoyY	DW 01H DUP (?)
	ORG	$-6
$S504_JoyW	DW 01H DUP (?)
	ORG	$+4
$S505_JoyZ	DW 01H DUP (?)
	ORG	$+2
$S506_JoyColor	DW 01H DUP (?)
	ORG	$-4
$S507_RudColor	DW 01H DUP (?)
	ORG	$-12
$S508_ThrstColor	DW 01H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 2
; Line 19
; Line 3
; Line 4
; Line 35
	PUBLIC	_JoyRecal
_JoyRecal	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	y = 6
;	x = 4
; Line 36
	mov	ax,WORD PTR [bp+4]	;x
	mov	bx,WORD PTR _RpJoy
	mov	WORD PTR [bx+2],ax
; Line 37
	mov	ax,WORD PTR [bp+6]	;y
	mov	bx,WORD PTR _RpJoy
	mov	WORD PTR [bx+4],ax
; Line 39
	cmp	WORD PTR _Joystick,0
	jne	$I514
	cmp	WORD PTR _RudderStick,0
	jne	$JCC41
	jmp	$I513
$JCC41:
$I514:
; Line 41
	call	InitShowJoy
; Line 45
	cmp	WORD PTR _Joystick,0
	je	$L20001
	cmp	WORD PTR _RudderStick,0
	je	$L20003
	mov	ax,OFFSET DGROUP:$SG517
	jmp	SHORT $L20002
$L20003:
	mov	ax,OFFSET DGROUP:$SG518
	jmp	SHORT $L20002
	nop	
$L20001:
	mov	ax,OFFSET DGROUP:$SG519
$L20002:
	push	ax
	call	JoyMessage
	add	sp,2
; Line 46
$D520:
; Line 47
	mov	ax,1
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 48
	mov	ax,WORD PTR _Joystick
	or	ax,WORD PTR _RudderStick
	push	ax
	call	FAR PTR _InitJoy2
	add	sp,2
; Line 49
	call	ShowJoy
; Line 50
	call	GetButtonDownUp
	or	ax,ax
	je	$D520
; Line 52
	mov	ax,10
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 54
	cmp	WORD PTR _Joystick,0
	je	$I526
; Line 55
	mov	ax,OFFSET DGROUP:$SG527
	push	ax
	call	JoyMessage
	add	sp,2
; Line 56
$D528:
; Line 58
	mov	ax,WORD PTR _RawJoy
	mov	WORD PTR _MinStick,ax
	sub	ax,WORD PTR _CenterPosition
	neg	ax
	mov	WORD PTR _LowRange,ax
; Line 60
	mov	ax,WORD PTR _RawJoy+2
	mov	WORD PTR _MinStick+2,ax
; Line 61
	sub	ax,WORD PTR _CenterPosition+2
	neg	ax
	mov	WORD PTR _LowRange+2,ax
; Line 63
	call	ShowJoy
; Line 64
	call	GetButtonDownUp
	or	ax,ax
	je	$D528
; Line 66
	mov	ax,10
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 68
	mov	ax,OFFSET DGROUP:$SG531
	push	ax
	call	JoyMessage
	add	sp,2
; Line 69
$D532:
; Line 71
	mov	ax,WORD PTR _RawJoy
	mov	WORD PTR _MaxStick,ax
	sub	ax,WORD PTR _CenterPosition
	mov	WORD PTR _HighRange,ax
; Line 73
	mov	ax,WORD PTR _RawJoy+2
	mov	WORD PTR _MaxStick+2,ax
; Line 74
	sub	ax,WORD PTR _CenterPosition+2
	mov	WORD PTR _HighRange+2,ax
; Line 76
	call	ShowJoy
; Line 77
	call	GetButtonDownUp
	or	ax,ax
	je	$D532
; Line 78
; Line 80
$I526:
	cmp	WORD PTR _RudderStick,0
	je	$I535
; Line 81
	mov	ax,OFFSET DGROUP:$SG536
	push	ax
	call	JoyMessage
	add	sp,2
; Line 82
$D537:
; Line 84
	mov	ax,WORD PTR _RawJoy+4
	mov	WORD PTR _MinStick+4,ax
	sub	ax,WORD PTR _CenterPosition+4
	neg	ax
	mov	WORD PTR _LowRange+4,ax
; Line 86
	call	ShowJoy
; Line 87
	call	GetButtonDownUp
	or	ax,ax
	je	$D537
; Line 89
	mov	ax,10
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 91
	mov	ax,OFFSET DGROUP:$SG540
	push	ax
	call	JoyMessage
	add	sp,2
; Line 92
$D541:
; Line 94
	mov	ax,WORD PTR _RawJoy+4
	mov	WORD PTR _MaxStick+4,ax
	sub	ax,WORD PTR _CenterPosition+4
	mov	WORD PTR _HighRange+4,ax
; Line 96
	call	ShowJoy
; Line 97
	call	GetButtonDownUp
	or	ax,ax
	je	$D541
; Line 98
; Line 100
$I535:
	cmp	WORD PTR _ThrustStick,0
	je	$I544
; Line 101
	mov	ax,OFFSET DGROUP:$SG545
	push	ax
	call	JoyMessage
	add	sp,2
; Line 102
$D546:
; Line 104
	mov	ax,WORD PTR _RawJoy+6
	mov	WORD PTR _MaxStick+6,ax
	sub	ax,WORD PTR _CenterPosition+6
	mov	WORD PTR _HighRange+6,ax
; Line 106
	call	ShowJoy
; Line 107
	call	GetButtonDownUp
	or	ax,ax
	je	$D546
; Line 109
	mov	ax,10
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 111
	mov	ax,OFFSET DGROUP:$SG549
	push	ax
	call	JoyMessage
	add	sp,2
; Line 112
$D550:
; Line 114
	mov	ax,WORD PTR _RawJoy+6
	mov	WORD PTR _MinStick+6,ax
	sub	ax,WORD PTR _CenterPosition+6
	neg	ax
	mov	WORD PTR _LowRange+6,ax
; Line 116
	call	ShowJoy
; Line 117
	call	GetButtonDownUp
	or	ax,ax
	je	$D550
; Line 118
; Line 120
$I544:
	mov	ax,OFFSET DGROUP:$SG553
	push	ax
	call	JoyMessage
	add	sp,2
; Line 121
$D554:
; Line 122
	call	ShowJoy
; Line 123
	call	_kbhit
	or	ax,ax
	je	$I558
; Line 124
	sub	ax,ax
	push	ax
	call	__bios_keybrd
	add	sp,2
	jmp	SHORT $S559
; Line 125
$SC563:
; Line 127
	cmp	BYTE PTR _DeadZone,63
	jae	$SB560
	add	BYTE PTR _DeadZone,4
	jmp	SHORT $SB560
; Line 129
$SC565:
; Line 130
	cmp	BYTE PTR _DeadZone,0
	je	$SB560
	sub	BYTE PTR _DeadZone,4
	jmp	SHORT $SB560
$S559:
	sub	ax,3117
	je	$SC565
	sub	ax,254
	je	$SC563
	sub	ax,18
	je	$SC563
	sub	ax,15600
	je	$SC565
	sub	ax,1022
	je	$SC563
$SB560:
; Line 132
	call	InitShowJoy
; Line 133
; Line 134
$I558:
	call	GetButtonDownUp
	or	ax,ax
	je	$D554
; Line 136
; Line 137
$I513:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_JoyRecal	ENDP
; Line 141
	PUBLIC	_TestJoy
_TestJoy	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
; Line 142
	mov	bx,WORD PTR _RpJoy
	mov	WORD PTR [bx+2],0
; Line 143
	mov	bx,WORD PTR _RpJoy
	mov	WORD PTR [bx+4],0
; Line 145
	cmp	WORD PTR _Joystick,0
	jne	$I570
	cmp	WORD PTR _RudderStick,0
	je	$I569
$I570:
; Line 146
	call	InitShowJoy
; Line 147
$D571:
; Line 148
	call	ShowJoy
; Line 149
	call	_kbhit
	or	ax,ax
	je	$D571
; Line 151
	sub	ax,ax
	push	ax
	call	__bios_keybrd
	add	sp,2
; Line 152
; Line 153
$I569:
	mov	sp,bp
	pop	bp
	ret	

_TestJoy	ENDP
; Line 157
JoyMessage	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	str = 4
; Line 158
	mov	ax,16
	push	ax
	mov	ax,91
	push	ax
	mov	cx,57
	push	cx
	sub	cx,cx
	push	cx
	call	JoyBox
	mov	sp,bp
; Line 159
	mov	ax,91
	push	ax
	push	WORD PTR [bp+4]	;str
	mov	cx,59
	push	cx
	sub	cx,cx
	push	cx
	push	WORD PTR _RpJoy
	call	_CenterPrint
	mov	sp,bp
; Line 160
	mov	ax,91
	push	ax
	mov	ax,OFFSET DGROUP:$SG578
	push	ax
	mov	ax,66
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR _RpJoy
	call	_CenterPrint
; Line 161
	mov	sp,bp
	pop	bp
	ret	
	nop	

JoyMessage	ENDP
; Line 165
InitShowJoy	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	j = -4
; Line 168
	sub	ax,ax
	mov	WORD PTR $S505_JoyZ,ax
	mov	WORD PTR $S504_JoyW,ax
	mov	WORD PTR $S503_JoyY,ax
	mov	WORD PTR $S502_JoyX,ax
; Line 169
	mov	ax,8
	mov	WORD PTR $S508_ThrstColor,ax
	mov	WORD PTR $S507_RudColor,ax
	mov	WORD PTR $S506_JoyColor,ax
; Line 171
	cmp	WORD PTR _Joystick,0
	jne	$JCC696
	jmp	$I581
$JCC696:
; Line 172
	mov	ax,48
	push	ax
	mov	ax,64
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	call	JoyBox
	add	sp,8
; Line 173
	mov	ax,8
	push	ax
	mov	cx,47
	push	cx
	mov	cx,32
	push	cx
	sub	dx,dx
	push	dx
	push	cx
	push	WORD PTR _RpJoy
	call	FAR PTR _DrawLine
	add	sp,12
; Line 174
	mov	ax,8
	push	ax
	mov	cx,24
	push	cx
	mov	dx,63
	push	dx
	push	cx
	sub	dx,dx
	push	dx
	push	WORD PTR _RpJoy
	call	FAR PTR _DrawLine
	add	sp,12
; Line 175
	mov	ax,8
	push	ax
	mov	al,BYTE PTR _DeadZone
	sub	ah,ah
	mov	cx,ax
	inc	ax
	inc	ax
	mov	dx,ax
	shl	ax,1
	add	ax,dx
	mov	bx,cx
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	shl	ax,1
	inc	ax
	push	ax
	mov	al,BYTE PTR _DeadZone
	shr	al,1
	sub	ah,ah
	inc	ax
	push	ax
	mov	ax,-2
	sub	ax,bx
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	add	ax,24
	push	ax
	mov	al,BYTE PTR _DeadZone
	shr	al,1
	shr	al,1
	sub	ah,ah
	sub	ax,32
	neg	ax
	push	ax
	push	WORD PTR _RpJoy
	call	FAR PTR _RectFill
	add	sp,12
; Line 176
; Line 178
$I581:
	cmp	WORD PTR _RudderStick,0
	je	$I582
; Line 179
	mov	ax,5
	push	ax
	mov	ax,64
	push	ax
	mov	ax,50
	push	ax
	sub	ax,ax
	push	ax
	call	JoyBox
	add	sp,8
; Line 180
	mov	ax,8
	push	ax
	mov	ax,3
	push	ax
	mov	al,BYTE PTR _DeadZone
	shr	al,1
	and	ax,254
	inc	ax
	push	ax
	mov	ax,51
	push	ax
	mov	al,BYTE PTR _DeadZone
	shr	al,1
	shr	al,1
	sub	ah,ah
	sub	ax,32
	neg	ax
	push	ax
	push	WORD PTR _RpJoy
	call	FAR PTR _RectFill
	add	sp,12
; Line 181
; Line 183
$I582:
	cmp	WORD PTR _ThrustStick,0
	je	$I583
; Line 184
	mov	ax,48
	push	ax
	mov	ax,5
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,66
	push	ax
	call	JoyBox
	add	sp,8
; Line 185
; Line 186
$I583:
	mov	sp,bp
	pop	bp
	ret	

InitShowJoy	ENDP
; Line 190
ShowJoy	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	j = -4
; Line 193
	mov	ax,1
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 194
	mov	ax,WORD PTR _ThrustStick
	or	ax,WORD PTR _Joystick
	or	ax,WORD PTR _RudderStick
	or	ax,WORD PTR _CoolyStick
	push	ax
	call	FAR PTR _ReadJoy2
	add	sp,2
	mov	WORD PTR [bp-4],ax	;j
	mov	WORD PTR [bp-2],dx
; Line 196
	cmp	WORD PTR _Joystick,0
	je	$I586
; Line 197
	push	WORD PTR $S506_JoyColor
	push	WORD PTR $S503_JoyY
	push	WORD PTR $S502_JoyX
	push	WORD PTR _RpJoy
	call	FAR PTR _DrawDot
	add	sp,8
; Line 199
	mov	al,BYTE PTR [bp-3]
	cbw	
	add	ax,128
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	WORD PTR $S503_JoyY,ax
; Line 200
	push	ax
	mov	al,BYTE PTR [bp-4]	;j
	cbw	
	add	ax,128
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,2
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	WORD PTR $S502_JoyX,ax
	push	ax
	push	WORD PTR _RpJoy
	call	_GetRpPixel
	add	sp,6
	mov	WORD PTR $S506_JoyColor,ax
; Line 201
	mov	ax,15
	push	ax
	push	WORD PTR $S503_JoyY
	push	WORD PTR $S502_JoyX
	push	WORD PTR _RpJoy
	call	FAR PTR _DrawDot
	add	sp,8
; Line 202
; Line 204
$I586:
	cmp	WORD PTR _RudderStick,0
	je	$I587
; Line 205
	push	WORD PTR $S507_RudColor
	mov	ax,52
	push	ax
	push	WORD PTR $S504_JoyW
	push	WORD PTR _RpJoy
	call	FAR PTR _DrawDot
	add	sp,8
; Line 207
	mov	ax,52
	push	ax
	mov	al,BYTE PTR [bp-2]
	cbw	
	add	ax,128
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,2
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	WORD PTR $S504_JoyW,ax
	push	ax
	push	WORD PTR _RpJoy
	call	_GetRpPixel
	add	sp,6
	mov	WORD PTR $S507_RudColor,ax
; Line 208
	mov	ax,15
	push	ax
	mov	ax,52
	push	ax
	push	WORD PTR $S504_JoyW
	push	WORD PTR _RpJoy
	call	FAR PTR _DrawDot
	add	sp,8
; Line 209
; Line 211
$I587:
	cmp	WORD PTR _ThrustStick,0
	je	$I588
; Line 212
	push	WORD PTR $S508_ThrstColor
	push	WORD PTR $S505_JoyZ
	mov	ax,68
	push	ax
	push	WORD PTR _RpJoy
	call	FAR PTR _DrawDot
	add	sp,8
; Line 214
	mov	al,BYTE PTR [bp-1]
	cbw	
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,3
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	WORD PTR $S505_JoyZ,ax
	push	ax
	mov	ax,68
	push	ax
	push	WORD PTR _RpJoy
	call	_GetRpPixel
	add	sp,6
	mov	WORD PTR $S508_ThrstColor,ax
; Line 215
	mov	ax,15
	push	ax
	push	WORD PTR $S505_JoyZ
	mov	ax,68
	push	ax
	push	WORD PTR _RpJoy
	call	FAR PTR _DrawDot
; Line 216
; Line 217
$I588:
	mov	sp,bp
	pop	bp
	ret	
	nop	

ShowJoy	ENDP
; Line 221
JoyBox	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	Length = 10
;	Width = 8
;	StartY = 6
;	StartX = 4
; Line 222
	mov	ax,7
	push	ax
	push	WORD PTR [bp+10]	;Length
	push	WORD PTR [bp+8]	;Width
	push	WORD PTR [bp+6]	;StartY
	push	WORD PTR [bp+4]	;StartX
	push	WORD PTR _RpJoy
	call	FAR PTR _RectFill
	add	sp,12
; Line 223
	mov	ax,8
	push	ax
	push	WORD PTR [bp+6]	;StartY
	mov	cx,WORD PTR [bp+8]	;Width
	add	cx,WORD PTR [bp+4]	;StartX
	dec	cx
	push	cx
	push	WORD PTR [bp+6]	;StartY
	push	WORD PTR [bp+4]	;StartX
	push	WORD PTR _RpJoy
	mov	si,cx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 224
	mov	ax,8
	push	ax
	mov	cx,WORD PTR [bp+10]	;Length
	add	cx,WORD PTR [bp+6]	;StartY
	dec	cx
	push	cx
	push	si
	push	cx
	push	WORD PTR [bp+4]	;StartX
	push	WORD PTR _RpJoy
	mov	di,cx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 225
	mov	ax,8
	push	ax
	push	di
	push	WORD PTR [bp+4]	;StartX
	push	WORD PTR [bp+6]	;StartY
	push	WORD PTR [bp+4]	;StartX
	push	WORD PTR _RpJoy
	call	FAR PTR _DrawLine
	add	sp,12
; Line 226
	mov	ax,8
	push	ax
	push	di
	push	si
	push	WORD PTR [bp+6]	;StartY
	push	si
	push	WORD PTR _RpJoy
	call	FAR PTR _DrawLine
	add	sp,12
; Line 227
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

JoyBox	ENDP
; Line 231
GetButtonDownUp	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 232
	sub	ax,ax
	push	ax
	call	FAR PTR _Trigger2
	add	sp,2
	or	ax,ax
	je	$I595
; Line 233
	mov	ax,10
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 234
$FC597:
	sub	ax,ax
	push	ax
	call	FAR PTR _Trigger2
	add	sp,2
	or	ax,ax
	jne	$FC597
; Line 235
	mov	ax,10
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 236
	mov	ax,1
	ret	
; Line 237
; Line 238
	nop	
$I595:
	sub	ax,ax
; Line 239
	ret	
	nop	

GetButtonDownUp	ENDP
; Line 243
	PUBLIC	_CenterPrint
_CenterPrint	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	width = 12
;	str = 10
;	y = 8
;	x = 6
;	Rp = 4
; Line 245
	push	WORD PTR [bp+10]	;str
	push	WORD PTR [bp+8]	;y
	push	WORD PTR [bp+10]	;str
	push	WORD PTR [bp+4]	;Rp
	call	_pstrlen
	add	sp,4
	sub	ax,WORD PTR [bp+12]	;width
	neg	ax
	inc	ax
	cwd	
	sub	ax,dx
	sar	ax,1
	add	WORD PTR [bp+6],ax	;x
	push	WORD PTR [bp+6]	;x
	push	WORD PTR [bp+4]	;Rp
	call	FAR PTR _RpPrint
; Line 246
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CenterPrint	ENDP
_TEXT	ENDS
END
