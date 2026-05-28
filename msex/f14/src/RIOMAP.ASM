;	Static Name Aliases
;
	TITLE   C:\RIOMAP.C
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
PUBLIC  _NextRioTime
PUBLIC  _iconmode
EXTRN	_fseek:NEAR
EXTRN	_SndSounds:FAR
EXTRN	_CenterPrint:NEAR
EXTRN	_itoa:NEAR
EXTRN	_DrawLine:FAR
EXTRN	_pstrlen:NEAR
EXTRN	_RectCopy:FAR
EXTRN	_RpPrint:FAR
EXTRN	_LoadPicture:NEAR
EXTRN	_ScreenOff:FAR
EXTRN	_UpdateOurWPS:NEAR
EXTRN	_GetQHeight:NEAR
EXTRN	_ScreenOn:FAR
EXTRN	_InitScottFlight:NEAR
EXTRN	_RectFill:FAR
EXTRN	_LoadPalNoPic:NEAR
EXTRN	_MulDiv:NEAR
EXTRN	_LoadNewCockpit:NEAR
EXTRN	_WaitTicks:NEAR
EXTRN	_ClearPage:FAR
EXTRN	_toupper:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_MouseSETUP:NEAR
EXTRN	__aNNalshl:NEAR
EXTRN	_ScaleRotate:NEAR
EXTRN	__bios_keybrd:NEAR
EXTRN	_MouseSHOW:FAR
EXTRN	_isspace:NEAR
EXTRN	_MouseHIDE:FAR
EXTRN	_isprint:NEAR
EXTRN	_MouseHITS:FAR
EXTRN	_FontHeight:FAR
EXTRN	_MapInBank:NEAR
EXTRN	_fclose:NEAR
EXTRN	_TacScaleRotate256:NEAR
EXTRN	_kbhit:NEAR
EXTRN	_fopen:NEAR
EXTRN	_InBox:NEAR
EXTRN	_fread:NEAR
EXTRN	_Rp3:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Txt:BYTE
EXTRN	_Status:WORD
EXTRN	_wps:BYTE
EXTRN	_aipaths:BYTE
EXTRN	_View:WORD
EXTRN	_ps:BYTE
EXTRN	_PxLng:DWORD
EXTRN	_PyLng:DWORD
EXTRN	_MouseSprite:WORD
EXTRN	_OurHead:WORD
EXTRN	_OurPath:WORD
EXTRN	_whichourcarr:WORD
EXTRN	_OurAlt:WORD
EXTRN	_Alt:WORD
EXTRN	_lastmsgview:WORD
EXTRN	_MouseX:WORD
EXTRN	_ConfigData:BYTE
EXTRN	_MouseY:WORD
EXTRN	_AIWingMan:WORD
EXTRN	_GRPAGE0:BYTE
EXTRN	_Rp1:WORD
EXTRN	_Rp2:WORD
_DATA      SEGMENT
	ORG	$+4
$SG929	DB	'CARRIER',  00H
$SG936	DB	'WINGMAN',  00H
$SG940	DB	'PLAYER',  00H
$SG944	DB	'WAYPOINTS',  00H
$SG987	DB	'rb',  00H
$SG988	DB	'mission.f14',  00H
$SG994	DB	'map-sprt.PIC',  00H
$SG1000	DB	'map-cape.PIC',  00H
$SG1002	DB	'map-med.PIC',  00H
$SG1004	DB	'map-us.PIC',  00H
$SG1006	DB	'map-us.PIC',  00H
$SG1030	DB	'PRESS ANY KEY TO CONTINUE',  00H
$SG1041	DB	'USE LEFT MOUSE BUTTON TO RE-POSITION YOUR PLANE',  00H
$SG1055	DB	'F14ORG01.PIC',  00H
	ORG	$-199
_NextRioTime	DW	00H
_iconmode	DW	00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 2
; Line 3
; Line 4
; Line 5
; Line 6
; Line 7
; Line 8
; Line 9
; Line 10
; Line 11
; Line 12
; Line 13
; Line 14
; Line 15
; Line 16
; Line 17
; Line 108
	PUBLIC	_BigRioDot
_BigRioDot	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	color = 10
;	y = 8
;	x = 6
;	Rp = 4
; Line 109
	push	WORD PTR [bp+10]	;color
	mov	ax,3
	push	ax
	push	ax
	mov	ax,WORD PTR [bp+8]	;y
	dec	ax
	push	ax
	mov	ax,WORD PTR [bp+6]	;x
	dec	ax
	push	ax
	push	WORD PTR [bp+4]	;Rp
	call	FAR PTR _RectFill
; Line 110
	mov	sp,bp
	pop	bp
	ret	

_BigRioDot	ENDP
; Line 112
	PUBLIC	_WpsStar
_WpsStar	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	color = 10
;	y = 8
;	x = 6
;	Rp = 4
; Line 113
	push	WORD PTR [bp+10]	;color
	push	WORD PTR [bp+8]	;y
	mov	ax,WORD PTR [bp+6]	;x
	inc	ax
	push	ax
	push	WORD PTR [bp+8]	;y
	mov	ax,WORD PTR [bp+6]	;x
	dec	ax
	push	ax
	push	WORD PTR [bp+4]	;Rp
	call	FAR PTR _DrawLine
	mov	sp,bp
; Line 114
	push	WORD PTR [bp+10]	;color
	mov	ax,WORD PTR [bp+8]	;y
	inc	ax
	push	ax
	push	WORD PTR [bp+6]	;x
	mov	ax,WORD PTR [bp+8]	;y
	dec	ax
	push	ax
	push	WORD PTR [bp+6]	;x
	push	WORD PTR [bp+4]	;Rp
	call	FAR PTR _DrawLine
; Line 115
	mov	sp,bp
	pop	bp
	ret	

_WpsStar	ENDP
; Line 119
	PUBLIC	_DrawRioWayPoints
_DrawRioWayPoints	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	di
	push	si
;	cnt = -4
;	i = -6
;	Wpx = -8
;	Wpy = -2
;	type = 6
;	Rp = 4
; Line 123
	mov	cl,3
	mov	bx,WORD PTR _OurPath
	shl	bx,cl
	mov	ax,WORD PTR _aipaths[bx+6]
	mov	WORD PTR [bp-4],ax	;cnt
; Line 125
	cmp	WORD PTR [bp+6],-1	;type
	je	$JCC136
	jmp	$I856
$JCC136:
; Line 126
; Line 127
	mov	WORD PTR [bp-6],1	;i
	jmp	SHORT $F857
$FC858:
	inc	WORD PTR [bp-6]	;i
$F857:
	mov	ax,WORD PTR [bp-4]	;cnt
	cmp	WORD PTR [bp-6],ax	;i
	jl	$JCC157
	jmp	$FB864
$JCC157:
; Line 128
; Line 129
	mov	bx,WORD PTR [bp-6]	;i
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR _wps[bx+4]
	mov	dx,WORD PTR _wps[bx+6]
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
	mov	WORD PTR [bp-8],ax	;Wpx
; Line 131
	mov	ax,256
	push	ax
	mov	ax,192
	push	ax
	mov	ax,WORD PTR _wps[bx+8]
	mov	dx,WORD PTR _wps[bx+10]
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
	push	ax
	call	_MulDiv
	add	sp,6
	mov	WORD PTR [bp-2],ax	;Wpy
; Line 132
	mov	ax,10
	push	ax
	mov	cx,OFFSET _Txt
	push	cx
	push	WORD PTR [bp-6]	;i
	call	_itoa
	add	sp,6
; Line 133
	mov	bx,WORD PTR [bp+4]	;Rp
	mov	WORD PTR [bx+12],3
; Line 134
	mov	ax,OFFSET _Txt
	push	ax
	mov	ax,WORD PTR [bp-2]	;Wpy
	dec	ax
	dec	ax
	push	ax
	mov	cx,WORD PTR [bp-8]	;Wpx
	dec	cx
	dec	cx
	push	cx
	push	bx
	mov	si,ax
	mov	di,cx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 135
	push	si
	push	di
	push	WORD PTR _Rp1
	mov	ax,10
	push	ax
	push	ax
	push	si
	push	di
	push	WORD PTR [bp+4]	;Rp
	call	FAR PTR _RectCopy
	add	sp,16
; Line 136
	mov	ax,30
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 137
	jmp	$FC858
	nop	
$I856:
	mov	WORD PTR [bp-6],1	;i
	jmp	SHORT $F862
	nop	
$I865:
; Line 154
; Line 155
	mov	ax,3
	push	ax
	push	WORD PTR [bp-2]	;Wpy
	push	WORD PTR [bp-8]	;Wpx
	push	WORD PTR [bp+4]	;Rp
	call	_WpsStar
$L20002:
	add	sp,8
; Line 156
; Line 157
	inc	WORD PTR [bp-6]	;i
$F862:
	mov	ax,WORD PTR [bp-4]	;cnt
	cmp	WORD PTR [bp-6],ax	;i
	jl	$JCC392
	jmp	$FB864
$JCC392:
; Line 143
; Line 144
	mov	bx,WORD PTR [bp-6]	;i
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR _wps[bx+4]
	mov	dx,WORD PTR _wps[bx+6]
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
	mov	WORD PTR [bp-8],ax	;Wpx
; Line 146
	mov	ax,256
	push	ax
	mov	ax,192
	push	ax
	mov	ax,WORD PTR _wps[bx+8]
	mov	dx,WORD PTR _wps[bx+10]
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
	push	ax
	call	_MulDiv
	add	sp,6
	mov	WORD PTR [bp-2],ax	;Wpy
; Line 147
	cmp	WORD PTR [bp+6],0	;type
	jne	$JCC503
	jmp	$I865
$JCC503:
; Line 148
; Line 149
	mov	ax,10
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR [bp-6]	;i
	call	_itoa
	add	sp,6
; Line 150
	mov	bx,WORD PTR [bp+4]	;Rp
	mov	WORD PTR [bx+12],3
; Line 151
	mov	ax,OFFSET _Txt
	push	ax
	mov	ax,WORD PTR [bp-2]	;Wpy
	dec	ax
	dec	ax
	push	ax
	mov	ax,WORD PTR [bp-8]	;Wpx
	dec	ax
	dec	ax
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	jmp	$L20002
$FB864:
; Line 158
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_DrawRioWayPoints	ENDP
; Line 161
	PUBLIC	_GetToken
_GetToken	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	l = -2
;	D = 6
;	S = 4
; Line 163
	mov	WORD PTR [bp-2],0	;l
; Line 166
	jmp	SHORT $L20003
$FC874:
; Line 167
; Line 168
	mov	bx,WORD PTR [bp+4]	;S
	mov	al,BYTE PTR [bx]
	mov	bx,WORD PTR [bp+6]	;D
	mov	BYTE PTR [bx],al
	inc	WORD PTR [bp+4]	;S
	inc	WORD PTR [bp+6]	;D
; Line 169
	inc	WORD PTR [bp-2]	;l
; Line 170
$L20003:
	mov	bx,WORD PTR [bp+4]	;S
	mov	al,BYTE PTR [bx]
	cbw	
	push	ax
	call	_isspace
	add	sp,2
	or	ax,ax
	jne	$FC874
; Line 171
	jmp	SHORT $L20004
$FC878:
	mov	bx,WORD PTR [bp+4]	;S
	mov	al,BYTE PTR [bx]
	cbw	
	push	ax
	call	_isspace
	add	sp,2
	or	ax,ax
	jne	$FB879
; Line 172
; Line 173
	mov	bx,WORD PTR [bp+4]	;S
	mov	al,BYTE PTR [bx]
	mov	bx,WORD PTR [bp+6]	;D
	mov	BYTE PTR [bx],al
	inc	WORD PTR [bp+4]	;S
	inc	WORD PTR [bp+6]	;D
; Line 174
	inc	WORD PTR [bp-2]	;l
; Line 175
$L20004:
	mov	bx,WORD PTR [bp+4]	;S
	mov	al,BYTE PTR [bx]
	cbw	
	push	ax
	call	_isprint
	add	sp,2
	or	ax,ax
	jne	$FC878
$FB879:
; Line 177
	mov	bx,WORD PTR [bp+6]	;D
	mov	BYTE PTR [bx],0
; Line 178
	mov	ax,WORD PTR [bp-2]	;l
; Line 179
	mov	sp,bp
	pop	bp
	ret	

_GetToken	ENDP
; Line 182
	PUBLIC	_TextInTheBox
_TextInTheBox	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,136
	call	__aNchkstk
	push	si
;	oldcolor = -136
;	fontht = -4
;	i = -130
;	j = -132
;	l = -134
;	tl = -2
;	T = -124
;	Xp = -126
;	Yp = -128
;	color = 16
;	yh = 14
;	xh = 12
;	yl = 10
;	xl = 8
;	S = 6
;	Rp = 4
; Line 189
	mov	bx,WORD PTR [bp+4]	;Rp
	mov	ax,WORD PTR [bx+12]
	mov	WORD PTR [bp-136],ax	;oldcolor
; Line 190
	mov	ax,WORD PTR [bp+16]	;color
	mov	WORD PTR [bx+12],ax
; Line 192
	add	WORD PTR [bp+8],6	;xl
; Line 194
	sub	WORD PTR [bp+12],6	;xh
; Line 195
	sub	WORD PTR [bp+14],6	;yh
; Line 197
	push	WORD PTR [bx+16]
	call	FAR PTR _FontHeight
	add	sp,2
	mov	WORD PTR [bp-4],ax	;fontht
; Line 199
	add	WORD PTR [bp+10],6	;yl
	mov	ax,WORD PTR [bp+10]	;yl
	mov	WORD PTR [bp-128],ax	;Yp
; Line 200
	mov	WORD PTR [bp-130],0	;i
; Line 201
	jmp	$I910
	nop	
$FC899:
; Line 202
; Line 204
	mov	ax,WORD PTR [bp+8]	;xl
	mov	WORD PTR [bp-126],ax	;Xp
; Line 205
	mov	ax,WORD PTR [bp-130]	;i
	mov	WORD PTR [bp-132],ax	;j
; Line 206
	mov	WORD PTR [bp-134],0	;l
; Line 207
	jmp	SHORT $L20005
$FC903:
; Line 208
	inc	WORD PTR [bp-132]	;j
$L20005:
	mov	bx,WORD PTR [bp+6]	;S
	mov	si,WORD PTR [bp-132]	;j
	mov	al,BYTE PTR [bx][si]
	cbw	
	push	ax
	call	_isspace
	add	sp,2
	or	ax,ax
	jne	$FC903
; Line 209
$FC906:
	mov	si,WORD PTR [bp-134]	;l
	lea	ax,WORD PTR [bp-124][si]
	push	ax
	mov	ax,WORD PTR [bp+6]	;S
	add	ax,WORD PTR [bp-132]	;j
	push	ax
	call	_GetToken
	add	sp,4
	mov	WORD PTR [bp-2],ax	;tl
	or	ax,ax
	je	$FB907
; Line 210
; Line 211
	lea	ax,WORD PTR [bp-124]	;T
	push	ax
	push	WORD PTR [bp+4]	;Rp
	call	_pstrlen
	add	sp,4
	add	ax,WORD PTR [bp-126]	;Xp
	cmp	ax,WORD PTR [bp+12]	;xh
	jle	$I909
$FB907:
; Line 215
	mov	si,WORD PTR [bp-134]	;l
	mov	BYTE PTR [bp-124][si],0
; Line 216
	mov	bx,WORD PTR [bp+4]	;Rp
	mov	WORD PTR [bx+12],4
; Line 217
	lea	ax,WORD PTR [bp-124]	;T
	push	ax
	push	WORD PTR [bp-128]	;Yp
	push	WORD PTR [bp-126]	;Xp
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 218
	mov	ax,WORD PTR [bp-4]	;fontht
	add	WORD PTR [bp-128],ax	;Yp
; Line 219
	mov	ax,WORD PTR [bp-132]	;j
	mov	WORD PTR [bp-130],ax	;i
; Line 220
	cmp	WORD PTR [bp-2],0	;tl
	jne	$I910
	jmp	SHORT $FB900
; Line 212
$I909:
	mov	ax,WORD PTR [bp-2]	;tl
	add	WORD PTR [bp-132],ax	;j
; Line 213
	add	WORD PTR [bp-134],ax	;l
; Line 214
	jmp	SHORT $FC906
; Line 221
	nop	
$I910:
	mov	ax,WORD PTR [bp-4]	;fontht
	add	ax,WORD PTR [bp-128]	;Yp
	cmp	ax,WORD PTR [bp+14]	;yh
	jg	$JCC933
	jmp	$FC899
$JCC933:
$FB900:
; Line 222
	mov	ax,WORD PTR [bp-136]	;oldcolor
	mov	bx,WORD PTR [bp+4]	;Rp
	mov	WORD PTR [bx+12],ax
; Line 223
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_TextInTheBox	ENDP
; Line 228
	PUBLIC	_DrawRioMapInfo
_DrawRioMapInfo	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__aNchkstk
;	Myx = -18
;	Myy = -24
;	Wngx = -2
;	Wngy = -4
;	Carx = -16
;	Cary = -22
;	time = -20
;	i = -8
;	TY = -12
;	WngHead = -14
;	CarHead = -6
;	force = 6
;	Rp = 4
; Line 237
	cmp	WORD PTR [bp+6],-1	;force
	je	$JCC967
	jmp	$I926
$JCC967:
; Line 238
; Line 239
	call	FAR PTR _MouseHIDE
; Line 241
	mov	ax,WORD PTR _PxLng
	mov	dx,WORD PTR _PxLng+2
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
	mov	WORD PTR [bp-18],ax	;Myx
; Line 243
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
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
; Line 245
	mov	cx,256
	push	cx
	mov	bx,192
	push	bx
	push	ax
	call	_MulDiv
	add	sp,6
	mov	WORD PTR [bp-24],ax	;Myy
; Line 248
	cmp	WORD PTR _AIWingMan,-999
	je	$I928
; Line 249
	mov	ax,40
	imul	WORD PTR _AIWingMan
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],1
	je	$I928
; Line 250
; Line 251
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
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
	mov	WORD PTR [bp-2],ax	;Wngx
; Line 253
	mov	ax,256
	push	ax
	mov	ax,192
	push	ax
	mov	ax,WORD PTR _ps[bx+12]
	mov	dx,WORD PTR _ps[bx+14]
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
	push	ax
	call	_MulDiv
	add	sp,6
	mov	WORD PTR [bp-4],ax	;Wngy
; Line 254
	mov	ax,40
	imul	WORD PTR _AIWingMan
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	neg	ax
	mov	WORD PTR [bp-14],ax	;WngHead
; Line 255
; Line 256
$I928:
; Line 258
	mov	ax,40
	imul	WORD PTR _whichourcarr
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
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
	mov	WORD PTR [bp-16],ax	;Carx
; Line 260
	mov	ax,256
	push	ax
	mov	cx,192
	push	cx
	mov	ax,WORD PTR _ps[bx+12]
	mov	dx,WORD PTR _ps[bx+14]
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
	push	ax
	call	_MulDiv
	add	sp,6
	mov	WORD PTR [bp-22],ax	;Cary
; Line 262
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _Rp2
	mov	cx,200
	push	cx
	mov	dx,256
	push	dx
	push	ax
	push	ax
	push	WORD PTR _Rp3
	call	FAR PTR _RectCopy
	add	sp,16
; Line 264
	mov	bx,WORD PTR [bp+4]	;Rp
	mov	WORD PTR [bx+12],3
; Line 265
	mov	ax,OFFSET DGROUP:$SG929
	push	ax
	mov	ax,192
	push	ax
	mov	ax,20
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 266
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _Rp1
	mov	cx,200
	push	cx
	mov	cx,320
	push	cx
	push	ax
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 267
	mov	ax,4
	push	ax
	push	WORD PTR [bp-22]	;Cary
	push	WORD PTR [bp-16]	;Carx
	push	WORD PTR _Rp2
	call	_BigRioDot
	add	sp,8
; Line 268
	mov	WORD PTR [bp-8],0	;i
$FC931:
; Line 269
; Line 270
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	push	WORD PTR [bp-22]	;Cary
	push	WORD PTR [bp-16]	;Carx
	push	WORD PTR _Rp1
	mov	ax,12
	push	ax
	mov	ax,8
	push	ax
	mov	ax,61
	push	ax
	mov	ax,271
	push	ax
	push	WORD PTR _GRPAGE0+4
	call	_ScaleRotate
	add	sp,24
; Line 271
	mov	ax,20
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 272
	mov	ax,WORD PTR [bp-22]	;Cary
	sub	ax,10
	push	ax
	mov	cx,WORD PTR [bp-16]	;Carx
	sub	cx,10
	push	cx
	push	WORD PTR _Rp1
	mov	dx,20
	push	dx
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 273
	mov	ax,20
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 274
	inc	WORD PTR [bp-8]	;i
	cmp	WORD PTR [bp-8],3	;i
	jl	$FC931
; Line 275
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	cx,256
	push	cx
	push	WORD PTR [bp-22]	;Cary
	push	WORD PTR [bp-16]	;Carx
	push	WORD PTR _Rp2
	mov	cx,12
	push	cx
	mov	dx,8
	push	dx
	mov	bx,61
	push	bx
	mov	bx,271
	push	bx
	push	WORD PTR _GRPAGE0+4
	call	_ScaleRotate
	add	sp,24
; Line 277
	cmp	WORD PTR _AIWingMan,-999
	jne	$JCC1575
	jmp	$I935
$JCC1575:
; Line 278
	mov	ax,40
	imul	WORD PTR _AIWingMan
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],1
	jne	$JCC1594
	jmp	$I935
$JCC1594:
; Line 279
; Line 280
	mov	ax,192
	push	ax
	sub	cx,cx
	push	cx
	push	WORD PTR _Rp2
	mov	dx,8
	push	dx
	mov	dx,320
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp3
	call	FAR PTR _RectCopy
	add	sp,16
; Line 281
	mov	ax,2
	push	ax
	push	WORD PTR [bp-4]	;Wngy
	push	WORD PTR [bp-2]	;Wngx
	push	WORD PTR _Rp2
	call	_BigRioDot
	add	sp,8
; Line 282
	mov	bx,WORD PTR [bp+4]	;Rp
	mov	WORD PTR [bx+12],3
; Line 283
	mov	ax,OFFSET DGROUP:$SG936
	push	ax
	mov	ax,192
	push	ax
	mov	ax,20
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 284
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _Rp1
	mov	cx,200
	push	cx
	mov	cx,320
	push	cx
	push	ax
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 285
	mov	WORD PTR [bp-8],0	;i
$FC938:
; Line 286
; Line 287
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR [bp-14]	;WngHead
	mov	ax,256
	push	ax
	push	WORD PTR [bp-4]	;Wngy
	push	WORD PTR [bp-2]	;Wngx
	push	WORD PTR _Rp1
	mov	ax,11
	push	ax
	push	ax
	mov	ax,47
	push	ax
	mov	ax,272
	push	ax
	push	WORD PTR _GRPAGE0+4
	call	_ScaleRotate
	add	sp,24
; Line 288
	mov	ax,20
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 289
	mov	ax,WORD PTR [bp-4]	;Wngy
	sub	ax,10
	push	ax
	mov	cx,WORD PTR [bp-2]	;Wngx
	sub	cx,10
	push	cx
	push	WORD PTR _Rp1
	mov	dx,20
	push	dx
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 290
	mov	ax,20
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 291
	inc	WORD PTR [bp-8]	;i
	cmp	WORD PTR [bp-8],3	;i
	jl	$FC938
; Line 292
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR [bp-14]	;WngHead
	mov	ax,256
	push	ax
	push	WORD PTR [bp-4]	;Wngy
	push	WORD PTR [bp-2]	;Wngx
	push	WORD PTR _Rp2
	mov	ax,11
	push	ax
	push	ax
	mov	ax,47
	push	ax
	mov	ax,272
	push	ax
	push	WORD PTR _GRPAGE0+4
	call	_ScaleRotate
	add	sp,24
; Line 293
; Line 294
$I935:
; Line 296
	mov	ax,192
	push	ax
	sub	cx,cx
	push	cx
	push	WORD PTR _Rp2
	mov	dx,8
	push	dx
	mov	dx,320
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp3
	call	FAR PTR _RectCopy
	add	sp,16
; Line 297
	mov	ax,1
	push	ax
	push	WORD PTR [bp-24]	;Myy
	push	WORD PTR [bp-18]	;Myx
	push	WORD PTR _Rp2
	call	_BigRioDot
	add	sp,8
; Line 298
	mov	bx,WORD PTR [bp+4]	;Rp
	mov	WORD PTR [bx+12],3
; Line 299
	mov	ax,OFFSET DGROUP:$SG940
	push	ax
	mov	ax,192
	push	ax
	mov	ax,20
	push	ax
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 300
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _Rp1
	mov	cx,200
	push	cx
	mov	cx,320
	push	cx
	push	ax
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 302
	mov	WORD PTR [bp-8],0	;i
$FC942:
; Line 303
; Line 304
	sub	ax,ax
	push	ax
	push	ax
	mov	ax,WORD PTR _OurHead
	neg	ax
	push	ax
	mov	ax,256
	push	ax
	push	WORD PTR [bp-24]	;Myy
	push	WORD PTR [bp-18]	;Myx
	push	WORD PTR _Rp1
	mov	ax,11
	push	ax
	push	ax
	mov	ax,33
	push	ax
	mov	ax,272
	push	ax
	push	WORD PTR _GRPAGE0+4
	call	_ScaleRotate
	add	sp,24
; Line 305
	mov	ax,20
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 306
	mov	ax,WORD PTR [bp-24]	;Myy
	sub	ax,10
	push	ax
	mov	cx,WORD PTR [bp-18]	;Myx
	sub	cx,10
	push	cx
	push	WORD PTR _Rp1
	mov	dx,20
	push	dx
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 307
	mov	ax,20
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 308
	inc	WORD PTR [bp-8]	;i
	cmp	WORD PTR [bp-8],3	;i
	jl	$FC942
; Line 309
	sub	ax,ax
	push	ax
	push	ax
	mov	cx,WORD PTR _OurHead
	neg	cx
	push	cx
	mov	cx,256
	push	cx
	push	WORD PTR [bp-24]	;Myy
	push	WORD PTR [bp-18]	;Myx
	push	WORD PTR _Rp2
	mov	cx,11
	push	cx
	push	cx
	mov	cx,33
	push	cx
	mov	cx,272
	push	cx
	push	WORD PTR _GRPAGE0+4
	call	_ScaleRotate
	add	sp,24
; Line 311
	mov	ax,192
	push	ax
	sub	cx,cx
	push	cx
	push	WORD PTR _Rp2
	mov	dx,8
	push	dx
	mov	bx,320
	push	bx
	push	ax
	push	cx
	push	WORD PTR _Rp3
	call	FAR PTR _RectCopy
	add	sp,16
; Line 312
	mov	bx,WORD PTR [bp+4]	;Rp
	mov	WORD PTR [bx+12],3
; Line 313
	mov	ax,OFFSET DGROUP:$SG944
	push	ax
	mov	ax,192
	push	ax
	mov	cx,20
	push	cx
	push	bx
	call	FAR PTR _RpPrint
	add	sp,8
; Line 314
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _Rp1
	mov	cx,200
	push	cx
	mov	dx,320
	push	dx
	push	ax
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 315
	mov	ax,-1
	push	ax
	push	WORD PTR [bp+4]	;Rp
	call	_DrawRioWayPoints
	add	sp,4
; Line 316
	mov	ax,20
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 317
	mov	ax,192
	push	ax
	sub	cx,cx
	push	cx
	push	WORD PTR _Rp2
	mov	dx,8
	push	dx
	mov	dx,320
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp3
	call	FAR PTR _RectCopy
	add	sp,16
; Line 318
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _Rp1
	mov	cx,200
	push	cx
	mov	cx,320
	push	cx
	push	ax
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 320
	call	FAR PTR _MouseSHOW
; Line 322
	mov	sp,bp
	pop	bp
	ret	
; Line 324
; Line 327
	nop	
$I926:
	cmp	WORD PTR [bp+6],0	;force
	jne	$I946
	cmp	WORD PTR _NextRioTime,60
	jg	$JCC2347
	jmp	$I945
$JCC2347:
$I946:
; Line 328
; Line 330
	xor	BYTE PTR _iconmode,1
; Line 332
	sub	ax,ax
	mov	WORD PTR _NextRioTime,ax
	push	ax
	push	ax
	push	WORD PTR _Rp2
	mov	cx,200
	push	cx
	mov	cx,256
	push	cx
	push	ax
	push	ax
	push	WORD PTR _Rp3
	call	FAR PTR _RectCopy
	add	sp,16
; Line 334
	mov	ax,WORD PTR _PxLng
	mov	dx,WORD PTR _PxLng+2
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
	mov	WORD PTR [bp-18],ax	;Myx
; Line 336
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
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
; Line 338
	mov	cx,256
	push	cx
	mov	bx,192
	push	bx
	push	ax
	call	_MulDiv
	add	sp,6
	mov	WORD PTR [bp-24],ax	;Myy
; Line 341
	cmp	WORD PTR _AIWingMan,-999
	je	$I948
; Line 342
	mov	ax,40
	imul	WORD PTR _AIWingMan
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],1
	je	$I948
; Line 343
; Line 344
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
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
	mov	WORD PTR [bp-2],ax	;Wngx
; Line 346
	mov	ax,256
	push	ax
	mov	ax,192
	push	ax
	mov	ax,WORD PTR _ps[bx+12]
	mov	dx,WORD PTR _ps[bx+14]
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
	push	ax
	call	_MulDiv
	add	sp,6
	mov	WORD PTR [bp-4],ax	;Wngy
; Line 347
; Line 348
$I948:
; Line 350
	mov	ax,40
	imul	WORD PTR _whichourcarr
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
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
	mov	WORD PTR [bp-16],ax	;Carx
; Line 352
	mov	ax,256
	push	ax
	mov	cx,192
	push	cx
	mov	ax,WORD PTR _ps[bx+12]
	mov	dx,WORD PTR _ps[bx+14]
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
	push	ax
	call	_MulDiv
	add	sp,6
	mov	WORD PTR [bp-22],ax	;Cary
; Line 358
	cmp	WORD PTR _iconmode,0
	jne	$JCC2699
	jmp	$I949
$JCC2699:
; Line 359
; Line 360
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	cx,256
	push	cx
	push	WORD PTR [bp-22]	;Cary
	push	WORD PTR [bp-16]	;Carx
	push	WORD PTR _Rp2
	mov	dx,12
	push	dx
	mov	dx,8
	push	dx
	mov	dx,61
	push	dx
	mov	dx,271
	push	dx
	push	WORD PTR _GRPAGE0+4
	call	_ScaleRotate
	add	sp,24
; Line 362
	cmp	WORD PTR _AIWingMan,-999
	je	$I951
; Line 363
	mov	ax,40
	imul	WORD PTR _AIWingMan
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],1
	je	$I951
; Line 364
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR [bp-14]	;WngHead
	mov	ax,256
	push	ax
	push	WORD PTR [bp-4]	;Wngy
	push	WORD PTR [bp-2]	;Wngx
	push	WORD PTR _Rp2
	mov	ax,11
	push	ax
	push	ax
	mov	ax,47
	push	ax
	mov	ax,272
	push	ax
	push	WORD PTR _GRPAGE0+4
	call	_ScaleRotate
	add	sp,24
; Line 365
$I951:
; Line 366
	sub	ax,ax
	push	ax
	push	ax
	mov	ax,WORD PTR _OurHead
	neg	ax
	push	ax
	mov	ax,256
	push	ax
	push	WORD PTR [bp-24]	;Myy
	push	WORD PTR [bp-18]	;Myx
	push	WORD PTR _Rp2
	mov	ax,11
	push	ax
	push	ax
	mov	ax,33
	push	ax
	mov	ax,272
	push	ax
	push	WORD PTR _GRPAGE0+4
	call	_ScaleRotate
	add	sp,24
; Line 367
; Line 368
	jmp	SHORT $I952
$I949:
; Line 369
; Line 370
	mov	ax,4
	push	ax
	push	WORD PTR [bp-22]	;Cary
	push	WORD PTR [bp-16]	;Carx
	push	WORD PTR _Rp2
	call	_BigRioDot
	add	sp,8
; Line 372
	cmp	WORD PTR _AIWingMan,-999
	je	$I954
; Line 373
	mov	ax,40
	imul	WORD PTR _AIWingMan
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],1
	je	$I954
; Line 374
	mov	ax,2
	push	ax
	push	WORD PTR [bp-4]	;Wngy
	push	WORD PTR [bp-2]	;Wngx
	push	WORD PTR _Rp2
	call	_BigRioDot
	add	sp,8
; Line 375
$I954:
; Line 376
	mov	ax,1
	push	ax
	push	WORD PTR [bp-24]	;Myy
	push	WORD PTR [bp-18]	;Myx
	push	WORD PTR _Rp2
	call	_BigRioDot
	add	sp,8
; Line 377
$I952:
; Line 378
	push	WORD PTR _iconmode
	push	WORD PTR [bp+4]	;Rp
	call	_DrawRioWayPoints
	add	sp,4
; Line 380
	call	FAR PTR _MouseHIDE
; Line 381
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _Rp1
	mov	cx,200
	push	cx
	mov	cx,320
	push	cx
	push	ax
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 382
	call	FAR PTR _MouseSHOW
; Line 384
; Line 386
$I945:
	cmp	WORD PTR [bp+6],0	;force
	jne	$I955
; Line 387
; Line 388
	mov	ax,1
	push	ax
	call	_WaitTicks
; Line 389
	inc	WORD PTR _NextRioTime
; Line 390
; Line 395
$I955:
	mov	sp,bp
	pop	bp
	ret	

_DrawRioMapInfo	ENDP
; Line 399
	PUBLIC	_RioMap
_RioMap	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,492
	call	__aNchkstk
	push	si
;	j = -472
;	val = -282
;	a = -22
;	b = -24
;	key = -466
;	ssi = -492
;	rri = -490
;	psi = -488
;	tempmissile = -486
;	tempplane = -292
;	MapX = -288
;	MapY = -458
;	Rpdef = -20
;	Rtemp = -464
;	DST = -478
;	SRC = -462
;	done = -284
;	MyMouseHits = -454
;	xpos = -470
;	ypos = -474
;	mseg = -482
;	GroundH = -452
;	S = -280
;	File = -2
;	start_data = -450
;	size = -480
;	i = -468
; Line 409
	mov	WORD PTR [bp-14],319
	mov	WORD PTR [bp-12],199
	mov	ax,2
	mov	WORD PTR [bp-10],ax
	mov	WORD PTR [bp-8],ax
	mov	WORD PTR [bp-4],ax
; Line 410
	lea	ax,WORD PTR [bp-20]	;Rpdef
	mov	WORD PTR [bp-464],ax	;Rtemp
; Line 414
	sub	cx,cx
	mov	WORD PTR [bp-466],cx	;key
	mov	WORD PTR [bp-18],cx
	mov	WORD PTR [bp-16],cx
	mov	WORD PTR [bp-6],cx
	mov	WORD PTR [bp-284],cx	;done
	mov	WORD PTR [bp-454],cx	;MyMouseHits
; Line 424
	mov	cx,1
	mov	WORD PTR [bp-20],cx	;Rpdef
	push	cx
	mov	ax,-999
	push	ax
	call	_UpdateOurWPS
	add	sp,4
; Line 429
	mov	ax,OFFSET DGROUP:$SG987
	push	ax
	mov	ax,OFFSET DGROUP:$SG988
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR [bp-2],ax	;File
	or	ax,ax
	jne	$JCC3122
	jmp	$I986
$JCC3122:
; Line 430
; Line 431
	push	ax
	mov	cx,1
	push	cx
	mov	dx,158
	push	dx
	lea	dx,WORD PTR [bp-450]	;start_data
	push	dx
	call	_fread
	add	sp,8
; Line 433
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-314]
	push	WORD PTR [bp-316]
	push	WORD PTR [bp-2]	;File
	call	_fseek
	add	sp,8
; Line 434
	push	WORD PTR [bp-2]	;File
	push	WORD PTR [bp-312]
	mov	ax,1
	push	ax
	lea	ax,WORD PTR [bp-280]	;S
	push	ax
	call	_fread
	add	sp,8
; Line 435
	push	WORD PTR [bp-2]	;File
	call	_fclose
	add	sp,2
; Line 436
	mov	WORD PTR [bp-468],0	;i
	jmp	SHORT $F989
	nop	
	nop	
$FC990:
; Line 437
	mov	si,ax
	mov	al,BYTE PTR [bp-280][si]
	cbw	
	push	ax
	call	_toupper
	add	sp,2
	mov	BYTE PTR [bp-280][si],al
	inc	WORD PTR [bp-468]	;i
$F989:
	mov	ax,WORD PTR [bp-468]	;i
	cmp	WORD PTR [bp-312],ax
	jg	$FC990
; Line 439
	sub	al,al
	mov	si,WORD PTR [bp-312]
	mov	BYTE PTR [bp-280][si],al
	mov	BYTE PTR [bp-26],al
; Line 440
; Line 441
	jmp	SHORT $I992
	nop	
$I986:
; Line 442
; Line 443
	mov	BYTE PTR [bp-280],0	;S
; Line 444
$I992:
; Line 446
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _MouseSprite
	call	_MouseSETUP
	add	sp,6
; Line 447
	call	FAR PTR _ScreenOff
; Line 448
	mov	ax,6
	push	ax
	call	FAR PTR _SndSounds
	add	sp,2
; Line 452
	mov	ax,OFFSET DGROUP:$SG994
	push	ax
	mov	ax,2
	push	ax
	call	_LoadPicture
	add	sp,4
; Line 454
	mov	ax,WORD PTR _ConfigData+26
	or	ax,ax
	je	$SC999
	dec	ax
	jne	$JCC3314
	jmp	$SC1001
$JCC3314:
	dec	ax
	jne	$JCC3320
	jmp	$SC1003
$JCC3320:
; Line 465
	mov	ax,OFFSET DGROUP:$SG1006
	jmp	SHORT $L20011
; Line 455
$SC999:
; Line 456
	mov	ax,OFFSET DGROUP:$SG1000
$L20011:
	push	ax
	mov	ax,1
	push	ax
	call	_LoadPicture
	add	sp,4
; Line 468
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _Rp3
	mov	cx,200
	push	cx
	mov	cx,256
	push	cx
	push	ax
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 470
	test	BYTE PTR _Status+1,16
	je	$I1007
; Line 471
; Line 473
	mov	ax,152
	push	ax
	mov	cx,265
	push	cx
	push	WORD PTR _Rp2
	mov	dx,13
	push	dx
	mov	dx,52
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp3
	call	FAR PTR _RectCopy
	add	sp,16
; Line 474
; Line 475
$I1007:
	mov	ax,1
	push	ax
	push	WORD PTR [bp-464]	;Rtemp
	call	_DrawRioMapInfo
	add	sp,4
; Line 477
	call	FAR PTR _ScreenOn
; Line 478
	call	FAR PTR _MouseSHOW
; Line 480
$FC1010:
	call	_kbhit
	or	ax,ax
	je	$FB1011
	sub	ax,ax
	push	ax
	call	__bios_keybrd
	add	sp,2
	jmp	SHORT $FC1010
; Line 458
	nop	
$SC1001:
; Line 459
	mov	ax,OFFSET DGROUP:$SG1002
	jmp	$L20011
; Line 461
$SC1003:
; Line 462
	mov	ax,OFFSET DGROUP:$SG1004
	jmp	$L20011
; Line 464
$FB1011:
; Line 482
	mov	WORD PTR [bp-284],0	;done
; Line 483
$FC1013:
	cmp	WORD PTR [bp-284],0	;done
	je	$JCC3481
	jmp	$FB1014
$JCC3481:
; Line 484
; Line 485
	mov	WORD PTR [bp-466],0	;key
; Line 487
	call	FAR PTR _MouseHITS
	mov	WORD PTR [bp-454],ax	;MyMouseHits
; Line 489
	call	_kbhit
	or	ax,ax
	je	$I1015
; Line 490
	sub	ax,ax
	push	ax
	call	__bios_keybrd
	add	sp,2
	mov	WORD PTR [bp-466],ax	;key
; Line 492
$I1015:
	cmp	WORD PTR [bp-466],0	;key
	jne	$I1021
; Line 493
; Line 494
	test	BYTE PTR [bp-454],1	;MyMouseHits
	je	$I1021
; Line 495
; Line 496
	mov	ax,188
	push	ax
	mov	ax,316
	push	ax
	mov	ax,172
	push	ax
	mov	ax,259
	push	ax
	push	WORD PTR _MouseY
	push	WORD PTR _MouseX
	call	_InBox
	add	sp,12
	or	ax,ax
	je	$I1019
; Line 497
	mov	WORD PTR [bp-466],283	;key
; Line 499
$I1019:
	mov	ax,148
	push	ax
	mov	ax,316
	push	ax
	mov	ax,136
	push	ax
	mov	ax,265
	push	ax
	push	WORD PTR _MouseY
	push	WORD PTR _MouseX
	call	_InBox
	add	sp,12
	or	ax,ax
	je	$I1020
; Line 500
	mov	WORD PTR [bp-466],12386	;key
; Line 502
$I1020:
	mov	ax,164
	push	ax
	mov	ax,316
	push	ax
	mov	ax,152
	push	ax
	mov	ax,265
	push	ax
	push	WORD PTR _MouseY
	push	WORD PTR _MouseX
	call	_InBox
	add	sp,12
	or	ax,ax
	je	$I1021
; Line 503
	mov	WORD PTR [bp-466],6512	;key
; Line 505
$I1021:
; Line 506
; Line 508
	cmp	WORD PTR [bp-466],0	;key
	je	$SB1024
; Line 509
; Line 510
	mov	ax,WORD PTR [bp-466]	;key
	sub	ax,283
	je	$SC1027
	sub	ax,4695
	je	$SC1027
	sub	ax,1534
	jne	$JCC3679
	jmp	$SC1039
$JCC3679:
	sub	ax,5874
	je	$SC1028
	sub	ax,1229
	jne	$SB1024
; Line 511
; Line 517
$SC1027:
; Line 520
	inc	WORD PTR [bp-284]	;done
; Line 521
$SB1024:
; Line 588
; Line 589
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-464]	;Rtemp
	call	_DrawRioMapInfo
	add	sp,4
; Line 590
	jmp	$FC1013
; Line 522
	nop	
	nop	
$SC1028:
; Line 523
	mov	ax,-1
	push	ax
	push	WORD PTR [bp-464]	;Rtemp
	call	_DrawRioMapInfo
	add	sp,4
; Line 524
	sub	ax,ax
	push	ax
	mov	cx,101
	push	cx
	mov	dx,181
	push	dx
	mov	bx,64
	push	bx
	mov	si,40
	push	si
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 525
	mov	ax,4
	push	ax
	mov	ax,99
	push	ax
	mov	ax,179
	push	ax
	mov	ax,65
	push	ax
	mov	ax,41
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 526
	sub	ax,ax
	push	ax
	mov	ax,97
	push	ax
	mov	ax,177
	push	ax
	mov	ax,66
	push	ax
	mov	ax,42
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 527
	mov	ax,255
	push	ax
	mov	ax,164
	push	ax
	mov	ax,220
	push	ax
	mov	ax,64
	push	ax
	push	si
	lea	cx,WORD PTR [bp-280]	;S
	push	cx
	push	WORD PTR [bp-464]	;Rtemp
	call	_TextInTheBox
	add	sp,14
; Line 528
	mov	bx,WORD PTR [bp-464]	;Rtemp
	mov	WORD PTR [bx+12],3
; Line 529
	mov	ax,OFFSET DGROUP:$SG1030
	push	ax
	mov	ax,154
	push	ax
	mov	ax,130
	push	ax
	push	bx
	call	_CenterPrint
	add	sp,8
; Line 530
	call	FAR PTR _MouseHIDE
; Line 531
	mov	ax,64
	push	ax
	push	si
	push	WORD PTR _Rp1
	mov	cx,101
	push	cx
	mov	cx,181
	push	cx
	push	ax
	push	si
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 532
$FC1032:
; Line 533
; Line 535
	call	FAR PTR _MouseHITS
	mov	WORD PTR [bp-454],ax	;MyMouseHits
; Line 536
	call	_kbhit
	or	ax,ax
	je	$I1034
$FB1033:
; Line 539
	call	_kbhit
	or	ax,ax
	je	$FB1038
	sub	ax,ax
	push	ax
	call	__bios_keybrd
	add	sp,2
	jmp	SHORT $FB1033
; Line 537
$I1034:
	test	BYTE PTR [bp-454],3	;MyMouseHits
	je	$FC1032
	jmp	SHORT $FB1033
	nop	
$FB1038:
; Line 540
	call	FAR PTR _MouseHITS
; Line 541
	mov	WORD PTR [bp-454],0	;MyMouseHits
; Line 542
	mov	ax,1
	push	ax
	push	WORD PTR [bp-464]	;Rtemp
	call	_DrawRioMapInfo
	add	sp,4
; Line 543
	call	FAR PTR _MouseSHOW
; Line 544
	jmp	$SB1024
; Line 545
	nop	
$SC1039:
; Line 547
	test	BYTE PTR _Status+1,16
	jne	$JCC4003
	jmp	$SB1024
$JCC4003:
; Line 548
; Line 549
	call	FAR PTR _MouseHIDE
; Line 550
	mov	bx,WORD PTR [bp-464]	;Rtemp
	mov	WORD PTR [bx+12],3
; Line 551
	mov	ax,OFFSET DGROUP:$SG1041
	push	ax
	mov	ax,192
	push	ax
	mov	cx,160
	push	cx
	push	bx
	call	_CenterPrint
	add	sp,8
; Line 552
	mov	ax,192
	push	ax
	sub	cx,cx
	push	cx
	push	WORD PTR _Rp1
	mov	dx,8
	push	dx
	mov	dx,320
	push	dx
	push	ax
	push	cx
	push	WORD PTR [bp-464]	;Rtemp
	call	FAR PTR _RectCopy
	add	sp,16
; Line 553
	call	FAR PTR _MouseSHOW
; Line 554
$FC1043:
; Line 555
; Line 556
	mov	WORD PTR [bp-466],0	;key
; Line 558
	call	FAR PTR _MouseHITS
	mov	WORD PTR [bp-454],ax	;MyMouseHits
; Line 559
	call	_kbhit
	or	ax,ax
	je	$I1045
; Line 560
	sub	ax,ax
	push	ax
	call	__bios_keybrd
	add	sp,2
	mov	WORD PTR [bp-466],ax	;key
; Line 561
$I1045:
	cmp	WORD PTR [bp-466],283	;key
	jne	$I1046
$FB1044:
; Line 584
	mov	ax,1
	push	ax
	push	WORD PTR [bp-464]	;Rtemp
	call	_DrawRioMapInfo
	add	sp,4
; Line 585
; Line 586
	jmp	$SB1024
; Line 562
	nop	
$I1046:
	test	BYTE PTR [bp-454],1	;MyMouseHits
	je	$FC1043
; Line 563
; Line 564
	cmp	WORD PTR _MouseX,256
	jge	$FB1044
	cmp	WORD PTR _MouseY,192
	jge	$FB1044
; Line 565
; Line 566
	mov	ax,WORD PTR _MouseX
	cwd	
	mov	WORD PTR _PxLng,ax
	mov	WORD PTR _PxLng+2,dx
; Line 567
	mov	al,12
	push	ax
	mov	cx,OFFSET _PxLng
	push	cx
	call	__aNNalshl
; Line 568
	mov	ax,192
	push	ax
	push	WORD PTR _MouseY
	mov	ax,256
	push	ax
	call	_MulDiv
	add	sp,6
	cwd	
	mov	WORD PTR _PyLng,ax
	mov	WORD PTR _PyLng+2,dx
; Line 572
	mov	al,12
	push	ax
	mov	ax,OFFSET _PyLng
	push	ax
	call	__aNNalshl
	sub	cx,cx
	mov	bx,16
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR _PyLng,cx
	mov	WORD PTR _PyLng+2,bx
	sub	ax,ax
	mov	dx,16
	sub	ax,cx
	sbb	dx,bx
	push	dx
	push	ax
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	call	_GetQHeight
	add	sp,8
	mov	WORD PTR [bp-452],ax	;GroundH
; Line 574
	add	ax,500
	cmp	ax,WORD PTR _OurAlt
	ja	$JCC4273
	jmp	$FB1044
$JCC4273:
; Line 575
; Line 576
	mov	WORD PTR _OurAlt,ax
; Line 577
	shr	ax,1
	shr	ax,1
	mov	WORD PTR _Alt,ax
; Line 578
	call	_InitScottFlight
; Line 579
; Line 580
; Line 581
	jmp	$FB1044
$FB1014:
; Line 592
	call	FAR PTR _MouseHIDE
; Line 593
	call	FAR PTR _ScreenOff
; Line 594
	mov	WORD PTR _lastmsgview,-1
; Line 596
	cmp	WORD PTR _View,70
	jge	$I1052
; Line 597
	call	_LoadNewCockpit
; Line 598
	jmp	SHORT $I1054
$I1052:
; Line 599
	sub	ax,ax
	push	ax
	push	ax
	call	FAR PTR _ClearPage
	add	sp,4
; Line 600
	mov	ax,OFFSET DGROUP:$SG1055
	push	ax
	call	_LoadPalNoPic
	add	sp,2
; Line 601
$I1054:
; Line 602
	mov	ax,7
	push	ax
	call	FAR PTR _SndSounds
	add	sp,2
; Line 603
	mov	ax,1
; Line 807
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_RioMap	ENDP
; Line 813
	PUBLIC	_RioTop
_RioTop	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
;	XP = -10
;	ZP = -12
;	WID = -4
;	HT = -14
;	XDC = -18
;	YDC = -2
;	PTR = -8
;	SEG = -16
;	zoom = 14
;	Z = 10
;	X = 6
;	Rp = 4
; Line 819
	mov	ax,WORD PTR [bp+6]	;X
	mov	dx,WORD PTR [bp+8]
	mov	al,ah
	mov	ah,dl
	mov	dl,dh
	shl	dh,1
	sbb	dh,dh
; Line 820
	mov	ax,WORD PTR [bp+10]	;Z
	mov	dx,WORD PTR [bp+12]
	mov	al,ah
	mov	ah,dl
; Line 827
	sub	ax,ax
	push	ax
	call	_MapInBank
	add	sp,2
; Line 829
	sub	cx,cx
	push	cx
	mov	dx,82
	push	dx
	push	cx
	mov	cx,256
	push	cx
	mov	cx,100
	push	cx
	mov	cx,160
	push	cx
	push	WORD PTR [bp+4]	;Rp
	mov	cx,191
	push	cx
	mov	cx,255
	push	cx
	mov	cx,95
	push	cx
	mov	cx,127
	push	cx
	push	ax
	call	_TacScaleRotate256
; Line 831
	mov	sp,bp
	pop	bp
	ret	
	nop	

_RioTop	ENDP
_TEXT	ENDS
END
