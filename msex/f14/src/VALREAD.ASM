;	Static Name Aliases
;
	TITLE   C:\VALREAD.C
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
EXTRN	__acrtused:ABS
EXTRN	_printf:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fread:NEAR
_BSS      SEGMENT
COMM NEAR	_offset:	BYTE:	 2
COMM NEAR	_KbSense:	BYTE:	 2
COMM NEAR	_Joystick:	BYTE:	 2
COMM NEAR	_ThrustStick:	BYTE:	 2
COMM NEAR	_CoolyStick:	BYTE:	 2
COMM NEAR	_RudderStick:	BYTE:	 2
COMM NEAR	_MouseSprite:	BYTE:	 2
COMM NEAR	_GRNDDETAIL:	BYTE:	 2
COMM NEAR	_PLANEDETAIL:	BYTE:	 2
COMM NEAR	_SKYDETAIL:	BYTE:	 2
COMM NEAR	_MISSILETRAIL:	BYTE:	 2
COMM NEAR	_MSGDETAIL:	BYTE:	 2
COMM NEAR	_SNDDETAIL:	BYTE:	 2
COMM NEAR	_RudderType:	BYTE:	 2
COMM NEAR	_StickType:	BYTE:	 2
COMM NEAR	_DeadZone:	BYTE:	 1
COMM NEAR	_JoyVals:	 1:	 52
_BSS      ENDS
_DATA      SEGMENT
$SG262	DB	'rb',  00H
$SG263	DB	'JOY.F14',  00H
$SG266	DB	'Offset: %d',  0aH,  00H
$SG267	DB	'Keyboard Sens: %d',  0aH,  00H
$SG268	DB	'Sound Detail: %d',  0aH,  00H
$SG269	DB	'Message Detail: %d',  0aH,  00H
$SG270	DB	'Sky Detail: %d',  0aH,  00H
$SG271	DB	'Ground Detail: %d',  0aH,  00H
$SG272	DB	'Plane Detail: %d',  0aH,  00H
$SG273	DB	'Missile Detail: %d',  0aH,  0aH,  00H
$SG274	DB	'StickType: %d',  0aH,  00H
$SG275	DB	'RudderType: %d',  0aH,  00H
$SG276	DB	'Joystick: %d',  0aH,  00H
$SG277	DB	'ThrustStick: %d',  0aH,  00H
$SG278	DB	'CoolyStick: %d',  0aH,  00H
$SG279	DB	'RudderStick: %d',  0aH,  00H
$SG280	DB	'JoyVals[',  00H
$SG284	DB	'%i',  00H
$SG285	DB	']',  0aH,  00H
$SG286	DB	'DeadZone: %d',  0aH,  00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 2
; Line 3
; Line 27
	PUBLIC	_main
_main	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 28
	call	_GetJoyConfig
; Line 29
	jmp	_PrintJoyConfig
; Line 30
	nop	

_main	ENDP
; Line 36
	PUBLIC	_GetJoyConfig
_GetJoyConfig	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	f = -2
;	offset = -4
; Line 43
	mov	ax,OFFSET DGROUP:$SG262
	push	ax
	mov	ax,OFFSET DGROUP:$SG263
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
; Line 44
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET DGROUP:_KbSense
	push	dx
	call	_fread
	add	sp,8
; Line 45
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET DGROUP:_SNDDETAIL
	push	dx
	call	_fread
	add	sp,8
; Line 46
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET DGROUP:_MSGDETAIL
	push	dx
	call	_fread
	add	sp,8
; Line 47
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET DGROUP:_SKYDETAIL
	push	dx
	call	_fread
	add	sp,8
; Line 48
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET DGROUP:_GRNDDETAIL
	push	dx
	call	_fread
	add	sp,8
; Line 49
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET DGROUP:_PLANEDETAIL
	push	dx
	call	_fread
	add	sp,8
; Line 50
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET DGROUP:_MISSILETRAIL
	push	dx
	call	_fread
	add	sp,8
; Line 52
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET DGROUP:_StickType
	push	dx
	call	_fread
	add	sp,8
; Line 53
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET DGROUP:_RudderType
	push	dx
	call	_fread
	add	sp,8
; Line 54
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET DGROUP:_Joystick
	push	dx
	call	_fread
	add	sp,8
; Line 55
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET DGROUP:_ThrustStick
	push	dx
	call	_fread
	add	sp,8
; Line 56
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET DGROUP:_CoolyStick
	push	dx
	call	_fread
	add	sp,8
; Line 57
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	mov	cx,OFFSET DGROUP:_RudderStick
	push	cx
	call	_fread
	add	sp,8
; Line 59
	push	WORD PTR [bp-2]	;f
	mov	ax,52
	push	ax
	mov	ax,1
	push	ax
	mov	cx,OFFSET DGROUP:_JoyVals
	push	cx
	call	_fread
	add	sp,8
; Line 61
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	push	ax
	mov	ax,OFFSET DGROUP:_DeadZone
	push	ax
	call	_fread
	add	sp,8
; Line 63
	push	WORD PTR [bp-2]	;f
	call	_fclose
; Line 64
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetJoyConfig	ENDP
; Line 68
	PUBLIC	_PrintJoyConfig
_PrintJoyConfig	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 70
	push	WORD PTR _offset
	mov	ax,OFFSET DGROUP:$SG266
	push	ax
	call	_printf
	add	sp,4
; Line 71
	push	WORD PTR _KbSense
	mov	ax,OFFSET DGROUP:$SG267
	push	ax
	call	_printf
	add	sp,4
; Line 72
	push	WORD PTR _SNDDETAIL
	mov	ax,OFFSET DGROUP:$SG268
	push	ax
	call	_printf
	add	sp,4
; Line 73
	push	WORD PTR _MSGDETAIL
	mov	ax,OFFSET DGROUP:$SG269
	push	ax
	call	_printf
	add	sp,4
; Line 74
	push	WORD PTR _SKYDETAIL
	mov	ax,OFFSET DGROUP:$SG270
	push	ax
	call	_printf
	add	sp,4
; Line 75
	push	WORD PTR _GRNDDETAIL
	mov	ax,OFFSET DGROUP:$SG271
	push	ax
	call	_printf
	add	sp,4
; Line 76
	push	WORD PTR _PLANEDETAIL
	mov	ax,OFFSET DGROUP:$SG272
	push	ax
	call	_printf
	add	sp,4
; Line 77
	push	WORD PTR _MISSILETRAIL
	mov	ax,OFFSET DGROUP:$SG273
	push	ax
	call	_printf
	add	sp,4
; Line 78
	push	WORD PTR _StickType
	mov	ax,OFFSET DGROUP:$SG274
	push	ax
	call	_printf
	add	sp,4
; Line 79
	push	WORD PTR _RudderType
	mov	ax,OFFSET DGROUP:$SG275
	push	ax
	call	_printf
	add	sp,4
; Line 80
	push	WORD PTR _Joystick
	mov	ax,OFFSET DGROUP:$SG276
	push	ax
	call	_printf
	add	sp,4
; Line 81
	push	WORD PTR _ThrustStick
	mov	ax,OFFSET DGROUP:$SG277
	push	ax
	call	_printf
	add	sp,4
; Line 82
	push	WORD PTR _CoolyStick
	mov	ax,OFFSET DGROUP:$SG278
	push	ax
	call	_printf
	add	sp,4
; Line 83
	push	WORD PTR _RudderStick
	mov	ax,OFFSET DGROUP:$SG279
	push	ax
	call	_printf
	add	sp,4
; Line 84
	mov	ax,OFFSET DGROUP:$SG280
	push	ax
	call	_printf
	add	sp,2
; Line 85
	mov	WORD PTR [bp-2],0	;i
$FC282:
; Line 86
	mov	bx,WORD PTR [bp-2]	;i
	mov	al,BYTE PTR _JoyVals[bx]
	sub	ah,ah
	push	ax
	mov	ax,OFFSET DGROUP:$SG284
	push	ax
	call	_printf
	add	sp,4
	inc	WORD PTR [bp-2]	;i
	cmp	WORD PTR [bp-2],52	;i
	jl	$FC282
; Line 87
	mov	ax,OFFSET DGROUP:$SG285
	push	ax
	call	_printf
	add	sp,2
; Line 88
	mov	al,BYTE PTR _DeadZone
	sub	ah,ah
	push	ax
	mov	ax,OFFSET DGROUP:$SG286
	push	ax
	call	_printf
; Line 89
	mov	sp,bp
	pop	bp
	ret	

_PrintJoyConfig	ENDP
_TEXT	ENDS
END
