;	Static Name Aliases
;
;	$S767_BadWeather	EQU	BadWeather
;	$S791_LASTHEIGHT	EQU	LASTHEIGHT
;	$S974_Angle1	EQU	Angle1
	TITLE   C:\NHORZ.C
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
PUBLIC  _GREYSEG
PUBLIC  _CLOUDSEG
PUBLIC  _GRYSFHTTBL
PUBLIC  _cldhndl
PUBLIC  _CLOUDHEIGHT
PUBLIC  _CLOUDTHICK
PUBLIC  _LASTSTACK
PUBLIC  _FARSTACK
PUBLIC  _ABOVECLOUDS
PUBLIC  _GRNDDETAIL
PUBLIC  _OVERCAST
PUBLIC  _SKYDETAIL
PUBLIC  _WORLDDETAIL
PUBLIC  _MTNRAD
PUBLIC  _STKWID
PUBLIC  _GFLSH
PUBLIC  _MYWID
EXTRN	_ASinB:NEAR
EXTRN	_ACosB:NEAR
EXTRN	_ReadEMSPCXSize:NEAR
EXTRN	_labs:NEAR
EXTRN	_DrawCarrier:NEAR
EXTRN	_DrawCoolF14:NEAR
EXTRN	_NXSLine:NEAR
EXTRN	_DrawMissile:NEAR
EXTRN	_MapIn3dObjects:NEAR
EXTRN	_GetQHeight:NEAR
EXTRN	_NXSADDLine:NEAR
EXTRN	_DrawASmoke:NEAR
EXTRN	_fmemfill:NEAR
EXTRN	_DrawShadow:NEAR
EXTRN	_DrawTexPlane:NEAR
EXTRN	_MakeMatRPH:NEAR
EXTRN	_DrawChute:NEAR
EXTRN	_NDraw3DObject:NEAR
EXTRN	_DrawDecoy:NEAR
EXTRN	_DrawRegBoat:NEAR
EXTRN	_MyWaterline2:NEAR
EXTRN	_Message:NEAR
EXTRN	_MyWaterline:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	__dos_close:NEAR
EXTRN	_Dist3D:NEAR
EXTRN	__aNlmul:NEAR
EXTRN	_NScaleLine:NEAR
EXTRN	_Rotate:NEAR
EXTRN	__aNNalshr:NEAR
EXTRN	_abs:NEAR
EXTRN	__dos_open:NEAR
EXTRN	__dos_read:NEAR
EXTRN	_MapEmsFile:NEAR
EXTRN	_FrameRate:WORD
EXTRN	_NGXLO:WORD
EXTRN	_NGYLO:WORD
EXTRN	_NGXHI:WORD
EXTRN	_NGYHI:WORD
EXTRN	_NGYMID:WORD
EXTRN	_HorzHeave:WORD
EXTRN	_GRPAGE0:BYTE
EXTRN	_Seg3D:WORD
EXTRN	_Nviewmat:BYTE
EXTRN	_CLOUDAMNT:WORD
EXTRN	_ViewZ:WORD
_BSS      SEGMENT
COMM NEAR	_GrndAnimVals:	 2:	 32
_BSS      ENDS
EXTRN	_GRTBLSEG:BYTE
COMM FAR	_OBJECTS:	 6:	 1536
_BSS      SEGMENT
COMM NEAR	_GroundObjectScale:	 2:	 200
_BSS      ENDS
EXTRN	_gt:BYTE
_BSS      SEGMENT
COMM NEAR	_GroundObjectNames:	 1:	 640
_BSS      ENDS
EXTRN	_NGTARGETS:WORD
COMM FAR	_STACK3D:	 18:	 52
_BSS      SEGMENT
COMM NEAR	_FLSHXOFF:	BYTE:	 2
COMM NEAR	_FLSHZOFF:	BYTE:	 2
COMM NEAR	_ADDRESS:	 2:	 320
_BSS      ENDS
EXTRN	_ViewX:DWORD
EXTRN	_ViewY:DWORD
EXTRN	_AAFIRE:BYTE
_DATA      SEGMENT
	ORG	$+34
$SG775	DB	'cldwtr5.pcx',  00H
$SG777	DB	'wld.gry',  00H
	ORG	$+34
$SG929	DB	'Error',  00H
	ORG	$-94
_GREYSEG	DW	0a000H
_CLOUDSEG	DW	0a000H
_cldhndl	DW	00H
_CLOUDHEIGHT	DW	01fd6H
_CLOUDTHICK	DW	01f4H
_LASTSTACK	DW	00H
_FARSTACK	DW	0ffffH
_ABOVECLOUDS	DW	00H
_GRNDDETAIL	DW	01H
_OVERCAST	DW	00H
_SKYDETAIL	DW	01H
_WORLDDETAIL	DW	00H
_MTNRAD	DW	06H
_STKWID	DW	02H
_GFLSH	DW	00H
_MYWID	DW	0d0H
$S767_BadWeather	DW	00H
	ORG	$+20
_GRYSFHTTBL	DW	0800H
	DW	01000H
	DW	01800H
	DW	02000H
	DW	02800H
	DW	03000H
	DW	03800H
	DW	04000H
	DW	04800H
	DW	05000H
	DW	05800H
	DW	06000H
	DW	06800H
	DW	07000H
	DW	07000H
	DW	07000H
$S791_LASTHEIGHT	DW	0ffffH
	ORG	$+6
$S974_Angle1	DW	00H
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
; Line 7
; Line 8
; Line 9
; Line 111
	PUBLIC	_ChangeWeather
_ChangeWeather	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 114
	cmp	WORD PTR $S767_BadWeather,0
	je	$I768
; Line 115
	mov	WORD PTR _CLOUDHEIGHT,8150
; Line 116
	mov	WORD PTR _CLOUDTHICK,500
; Line 117
	mov	WORD PTR $S767_BadWeather,0
; Line 118
	ret	
	nop	
$I768:
; Line 119
	mov	WORD PTR _CLOUDHEIGHT,125
; Line 120
	mov	WORD PTR _CLOUDTHICK,1000
; Line 121
	mov	WORD PTR $S767_BadWeather,1
; Line 122
; Line 123
	ret	
	nop	

_ChangeWeather	ENDP
; Line 127
	PUBLIC	_LoadClouds
_LoadClouds	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	DHNDL = -2
;	len = -4
; Line 131
	mov	ax,256
	push	ax
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG775
	push	ax
	call	_ReadEMSPCXSize
	add	sp,8
	mov	WORD PTR _cldhndl,ax
; Line 132
	lea	ax,WORD PTR [bp-2]	;DHNDL
	push	ax
	sub	cx,cx
	push	cx
	mov	dx,OFFSET DGROUP:$SG777
	push	dx
	call	__dos_open
	add	sp,6
	or	ax,ax
	jne	$I776
; Line 133
	lea	ax,WORD PTR [bp-4]	;len
	push	ax
	mov	ax,4096
	push	ax
	mov	ax,OFFSET _GRTBLSEG
	mov	cx,SEG _GRTBLSEG
	push	cx
	push	ax
	push	WORD PTR [bp-2]	;DHNDL
	call	__dos_read
	add	sp,10
; Line 134
	push	WORD PTR [bp-2]	;DHNDL
	call	__dos_close
; Line 135
; Line 136
$I776:
	mov	sp,bp
	pop	bp
	ret	

_LoadClouds	ENDP
; Line 150
	PUBLIC	_NHorz
_NHorz	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,786
	call	__aNchkstk
	push	di
	push	si
;	ADDRESS = -716
;	i = -732
;	P = -4
;	XS = -750
;	ZS = -762
;	XADD = -10
;	ZADD = -60
;	FA = -724
;	FB = -728
;	HT = -756
;	CHT = -784
;	FC = -730
;	FD = -738
;	FE = -746
;	FF = -754
;	ARADD = -752
;	M = -758
;	LinesToDo = -6
;	T1DEL = -736
;	T2DEL = -744
;	DELSWITCH = -720
;	W = -718
;	CXS = -780
;	CYS = -782
;	CXADD = -64
;	CYADD = -70
;	ZD = -778
;	XZD = -76
;	YM = -74
;	XM = -68
;	N = -776
;	S = -56
;	ADDBASE = -62
;	NWID = -14
;	GSEG = -72
;	GRY = -12
;	MSK = -740
;	SHFT = -66
;	MYM = -16
;	HRES = 24
;	BUFFER = 22
;	ARIEL = 20
;	ROLL = 18
;	PITCH = 16
;	HEAD = 14
;	YC = 12
;	ZC = 8
;	XC = 4
; Line 173
	mov	WORD PTR [bp-76],1	;XZD
; Line 174
	mov	WORD PTR [bp-778],64	;ZD
; Line 176
	sub	ax,ax
	push	ax
	push	WORD PTR _cldhndl
	call	_MapEmsFile
	add	sp,4
	mov	WORD PTR _CLOUDSEG,ax
; Line 178
	mov	ax,WORD PTR [bp+12]	;YC
	shl	ax,1
	mov	WORD PTR [bp-756],ax	;HT
; Line 181
	mov	cx,WORD PTR _SKYDETAIL
	mov	WORD PTR [bp+24],cx	;HRES
; Line 184
	mov	WORD PTR _ABOVECLOUDS,0
; Line 185
	sub	ax,WORD PTR _CLOUDHEIGHT
	neg	ax
	mov	WORD PTR [bp-784],ax	;CHT
; Line 186
	or	ax,ax
	jge	$I832
; Line 187
	sar	ax,1
	neg	ax
	mov	WORD PTR [bp-784],ax	;CHT
; Line 188
	mov	WORD PTR _ABOVECLOUDS,1
; Line 189
; Line 191
$I832:
	cmp	WORD PTR _CLOUDTHICK,ax
	jg	$L20001
	sub	ax,ax
	jmp	SHORT $L20002
$L20001:
	mov	ax,WORD PTR _CLOUDTHICK
	mov	cx,-100
	cwd	
	idiv	cx
	mov	cx,ax
	mov	ax,WORD PTR [bp-784]	;CHT
	cwd	
	idiv	cx
	add	ax,100
$L20002:
	mov	WORD PTR _CLOUDAMNT,ax
; Line 193
	cmp	WORD PTR _SKYDETAIL,0
	jne	$I833
	mov	cl,2
	sar	WORD PTR _CLOUDAMNT,cl
; Line 195
$I833:
; Line 196
	mov	ax,WORD PTR [bp+12]	;YC
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,3
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	WORD PTR [bp-752],ax	;ARADD
	cmp	ax,4
	jge	$I834
	mov	WORD PTR [bp-752],4	;ARADD
; Line 198
$I834:
	cmp	WORD PTR [bp-752],28	;ARADD
	jle	$I835
	mov	WORD PTR [bp-752],28	;ARADD
; Line 200
$I835:
; Line 201
	mov	ax,WORD PTR _NGYHI
	sub	ax,WORD PTR _NGYMID
	inc	ax
	inc	ax
	mov	WORD PTR [bp-6],ax	;LinesToDo
	mov	cx,WORD PTR _NGYMID
	sub	cx,WORD PTR _NGYLO
	cmp	ax,cx
	jge	$I836
	mov	WORD PTR [bp-6],cx	;LinesToDo
; Line 203
$I836:
	mov	ax,WORD PTR _NGXHI
	sub	ax,WORD PTR _NGXLO
	add	ax,7
	and	al,248
	mov	WORD PTR [bp-14],ax	;NWID
; Line 206
	push	WORD PTR [bp+18]	;ROLL
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	cl,7
	shl	ax,cl
	mov	cx,160
	cwd	
	idiv	cx
	push	ax
	call	_ASinB
	add	sp,4
	push	ax
	call	_abs
	add	sp,2
	push	WORD PTR [bp+18]	;ROLL
	push	WORD PTR [bp-6]	;LinesToDo
	mov	si,ax
	call	_ACosB
	add	sp,4
	push	ax
	call	_abs
	add	sp,2
	add	si,ax
	mov	WORD PTR [bp-74],si	;YM
	cmp	si,152
	jle	$I839
	mov	WORD PTR [bp-74],152	;YM
; Line 207
$I839:
	mov	ax,WORD PTR [bp-74]	;YM
	cmp	WORD PTR [bp-6],ax	;LinesToDo
	jle	$I840
	mov	ax,WORD PTR [bp-6]	;LinesToDo
	mov	WORD PTR [bp-74],ax	;YM
; Line 209
$I840:
; Line 210
	push	WORD PTR [bp+18]	;ROLL
	mov	ax,148
	imul	WORD PTR [bp-6]	;LinesToDo
	mov	cx,100
	cwd	
	idiv	cx
	push	ax
	call	_ASinB
	add	sp,4
	push	ax
	call	_abs
	add	sp,2
	push	WORD PTR [bp+18]	;ROLL
	mov	cx,ax
	mov	ax,WORD PTR [bp-14]	;NWID
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,8
	push	ax
	mov	si,cx
	call	_ACosB
	add	sp,4
	push	ax
	call	_abs
	add	sp,2
	add	si,ax
	mov	WORD PTR [bp-68],si	;XM
	cmp	si,208
	jle	$I841
	mov	WORD PTR [bp-68],208	;XM
; Line 211
$I841:
	cmp	WORD PTR [bp-68],160	;XM
	jge	$I842
	mov	WORD PTR [bp-68],160	;XM
; Line 213
$I842:
	mov	ax,WORD PTR [bp-68]	;XM
	mov	WORD PTR _MYWID,ax
; Line 216
	push	WORD PTR [bp+14]	;HEAD
	push	WORD PTR [bp+16]	;PITCH
	mov	ax,256
	cwd	
	idiv	WORD PTR [bp-76]	;XZD
	push	ax
	mov	si,ax
	call	_ACosB
	add	sp,4
	push	ax
	call	_ASinB
	add	sp,4
	push	WORD PTR [bp+14]	;HEAD
	push	WORD PTR [bp-68]	;XM
	mov	di,ax
	call	_ACosB
	add	sp,4
	add	ax,di
	mov	WORD PTR [bp-732],ax	;i
	cwd	
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	mov	WORD PTR [bp-724],ax	;FA
	mov	WORD PTR [bp-722],dx
; Line 218
	push	WORD PTR [bp+14]	;HEAD
	mov	ax,WORD PTR _MYWID
	neg	ax
	push	ax
	call	_ASinB
	add	sp,4
	push	WORD PTR [bp+14]	;HEAD
	push	WORD PTR [bp+16]	;PITCH
	push	si
	mov	si,ax
	call	_ACosB
	add	sp,4
	push	ax
	call	_ACosB
	add	sp,4
	add	ax,si
	mov	WORD PTR [bp-732],ax	;i
	cwd	
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	mov	WORD PTR [bp-728],ax	;FB
	mov	WORD PTR [bp-726],dx
; Line 220
	push	WORD PTR [bp+14]	;HEAD
	mov	ax,-2048
	push	ax
	call	_ACosB
	add	sp,4
	mov	WORD PTR [bp-730],ax	;FC
; Line 221
	push	WORD PTR [bp+14]	;HEAD
	mov	ax,2048
	push	ax
	call	_ASinB
	add	sp,4
	mov	WORD PTR [bp-738],ax	;FD
; Line 223
	push	WORD PTR [bp+14]	;HEAD
	push	WORD PTR [bp+16]	;PITCH
	mov	ax,1024
	push	ax
	call	_ASinB
	add	sp,4
	push	ax
	call	_ASinB
	add	sp,4
	neg	ax
	mov	WORD PTR [bp-746],ax	;FE
; Line 224
	push	WORD PTR [bp+14]	;HEAD
	push	WORD PTR [bp+16]	;PITCH
	mov	ax,1024
	push	ax
	call	_ASinB
	add	sp,4
	push	ax
	call	_ACosB
	add	sp,4
	neg	ax
	mov	WORD PTR [bp-754],ax	;FF
; Line 226
	mov	ax,152
	sub	ax,WORD PTR [bp-74]	;YM
	mov	WORD PTR [bp-732],ax	;i
	jmp	$F843
	nop	
$L20003:
	mov	ax,-2
$L20004:
	mov	WORD PTR [bp-758],ax	;M
; Line 242
$I847:
	cmp	WORD PTR _SKYDETAIL,0
	je	$JCC798
	jmp	$I848
$JCC798:
; Line 243
; Line 244
	mov	ax,WORD PTR [bp+22]	;BUFFER
	mov	WORD PTR [bp-2],ax
; Line 245
	mov	ax,WORD PTR _MYWID
	imul	WORD PTR [bp-732]	;i
	mov	WORD PTR [bp-4],ax	;P
; Line 246
	cmp	WORD PTR [bp-758],0	;M
	jle	$I849
; Line 247
; Line 248
	cmp	WORD PTR [bp-758],8	;M
	jl	$L20005
	mov	ax,136
	jmp	SHORT $L20010
$L20005:
	mov	al,BYTE PTR [bp-758]	;M
	jmp	SHORT $L20038
$I849:
; Line 251
; Line 252
	cmp	WORD PTR [bp-758],-12	;M
	jg	$L20007
	mov	ax,252
	jmp	SHORT $L20008
$L20007:
	mov	ax,WORD PTR [bp-758]	;M
	neg	ax
	and	ax,15
	add	ax,240
$L20008:
	mov	WORD PTR [bp-12],ax	;GRY
; Line 253
	cmp	WORD PTR _ABOVECLOUDS,0
	je	$I851
; Line 254
	cmp	WORD PTR [bp-758],-3	;M
	jg	$L20009
	mov	ax,130
	jmp	SHORT $L20010
$L20009:
	mov	ax,WORD PTR [bp-758]	;M
	neg	ax
$L20038:
	and	ax,15
	add	ax,128
$L20010:
	mov	WORD PTR [bp-12],ax	;GRY
; Line 256
$I851:
; Line 258
	push	WORD PTR _MYWID
	mov	ah,BYTE PTR [bp-12]	;GRY
$L20029:
	sub	al,al
	or	WORD PTR [bp-12],ax	;GRY
	push	WORD PTR [bp-12]	;GRY
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;P
	call	_fmemfill
	add	sp,8
; Line 259
$FC844:
	inc	WORD PTR [bp-732]	;i
$F843:
	mov	ax,WORD PTR [bp-74]	;YM
	add	ax,152
	cmp	ax,WORD PTR [bp-732]	;i
	jge	$JCC946
	jmp	$FB845
$JCC946:
; Line 227
	push	WORD PTR [bp+16]	;PITCH
	mov	ax,256
	cwd	
	idiv	WORD PTR [bp-76]	;XZD
	push	ax
	call	_ASinB
	add	sp,4
	push	WORD PTR [bp+16]	;PITCH
	mov	cx,ax
	mov	ax,152
	sub	ax,WORD PTR [bp-732]	;i
	shl	ax,1
	shl	ax,1
	mov	bx,3
	cwd	
	idiv	bx
	push	ax
	mov	si,cx
	call	_ACosB
	add	sp,4
	add	si,ax
	mov	WORD PTR [bp-758],si	;M
; Line 230
	mov	ax,WORD PTR _HorzHeave
	dec	ax
	add	WORD PTR [bp-758],ax	;M
; Line 233
	cmp	WORD PTR _ABOVECLOUDS,0
	jne	$I846
; Line 234
; Line 235
	mov	ax,WORD PTR [bp-756]	;HT
	mov	cx,300
	cwd	
	idiv	cx
	add	WORD PTR [bp-758],ax	;M
; Line 236
; Line 239
$I846:
; Line 240
	mov	ax,WORD PTR [bp-758]	;M
	mov	WORD PTR [bp-16],ax	;MYM
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,2
	jl	$JCC1051
	jmp	$I847
$JCC1051:
	cmp	WORD PTR [bp-16],0	;MYM
	jge	$JCC1060
	jmp	$L20003
$JCC1060:
	mov	ax,2
	jmp	$L20004
; Line 260
; Line 262
	nop	
$I848:
	cmp	WORD PTR [bp-758],0	;M
	jg	$JCC1077
	jmp	$I853
$JCC1077:
; Line 263
	cmp	WORD PTR _ABOVECLOUDS,0
	jne	$I855
	cmp	WORD PTR _SKYDETAIL,0
	jne	$I854
$I855:
; Line 264
	mov	ax,WORD PTR [bp+22]	;BUFFER
	mov	WORD PTR [bp-2],ax
; Line 265
	mov	ax,WORD PTR _MYWID
	imul	WORD PTR [bp-732]	;i
	mov	WORD PTR [bp-4],ax	;P
; Line 268
	push	WORD PTR _MYWID
	cmp	WORD PTR [bp-758],16	;M
	jl	$L20011
	mov	ax,143
	jmp	SHORT $L20012
$L20011:
	mov	al,BYTE PTR [bp-758]	;M
	and	ax,15
	add	ax,128
$L20012:
	mov	WORD PTR [bp-12],ax	;GRY
	mov	ah,al
	jmp	$L20029
$I854:
; Line 270
	push	WORD PTR [bp-758]	;M
	push	WORD PTR [bp-784]	;CHT
	mov	ax,152
	sub	ax,WORD PTR [bp-732]	;i
	shl	ax,1
	shl	ax,1
	mov	cx,3
	cwd	
	idiv	cx
	push	ax
	push	WORD PTR [bp-746]	;FE
	push	WORD PTR [bp-722]
	push	WORD PTR [bp-724]	;FA
	mov	si,ax
	call	_NXSLine
	add	sp,12
	mov	WORD PTR [bp-750],ax	;XS
	mov	WORD PTR [bp-748],dx
; Line 271
	push	WORD PTR [bp-758]	;M
	push	WORD PTR [bp-784]	;CHT
	push	si
	push	WORD PTR [bp-754]	;FF
	push	WORD PTR [bp-726]
	push	WORD PTR [bp-728]	;FB
	call	_NXSLine
	add	sp,12
	mov	WORD PTR [bp-762],ax	;ZS
	mov	WORD PTR [bp-760],dx
; Line 272
	push	WORD PTR [bp-758]	;M
	push	WORD PTR [bp-784]	;CHT
	push	WORD PTR [bp-730]	;FC
	call	_NXSADDLine
	add	sp,6
	mov	WORD PTR [bp-10],ax	;XADD
	mov	WORD PTR [bp-8],dx
; Line 273
	push	WORD PTR [bp-758]	;M
	push	WORD PTR [bp-784]	;CHT
	push	WORD PTR [bp-738]	;FD
	call	_NXSADDLine
	add	sp,6
	mov	WORD PTR [bp-60],ax	;ZADD
	mov	WORD PTR [bp-58],dx
; Line 274
	shl	WORD PTR [bp-750],1	;XS
	rcl	WORD PTR [bp-748],1
; Line 275
	shl	WORD PTR [bp-762],1	;ZS
	rcl	WORD PTR [bp-760],1
; Line 277
	mov	WORD PTR [bp-12],2048	;GRY
; Line 279
	mov	WORD PTR [bp-740],127	;MSK
; Line 281
	mov	WORD PTR [bp-720],0	;DELSWITCH
; Line 283
	cmp	WORD PTR [bp-66],512	;SHFT
	jle	$I857
; Line 284
	mov	WORD PTR [bp-720],1	;DELSWITCH
; Line 285
	mov	WORD PTR [bp-740],63	;MSK
; Line 286
; Line 287
$I857:
	cmp	WORD PTR [bp-66],1024	;SHFT
	jle	$I858
; Line 288
	inc	WORD PTR [bp-720]	;DELSWITCH
; Line 289
	sar	WORD PTR [bp-740],1	;MSK
; Line 290
; Line 291
$I858:
	cmp	WORD PTR [bp-66],2048	;SHFT
	jle	$I859
; Line 292
	inc	WORD PTR [bp-720]	;DELSWITCH
; Line 293
	sar	WORD PTR [bp-740],1	;MSK
; Line 294
; Line 296
$I859:
	mov	WORD PTR [bp-740],0	;MSK
; Line 297
	push	WORD PTR [bp-16]	;MYM
	call	_abs
	add	sp,2
	cmp	ax,16
	jge	$I860
; Line 298
	mov	WORD PTR [bp-4],OFFSET _GRTBLSEG	;P
	mov	WORD PTR [bp-2],SEG _GRTBLSEG
; Line 299
	push	WORD PTR [bp-16]	;MYM
	call	_abs
	add	sp,2
	sub	ax,15
	neg	ax
	mov	cl,4
	shl	ax,cl
	add	ax,WORD PTR [bp-2]
	mov	WORD PTR [bp-740],ax	;MSK
; Line 300
; Line 303
$I860:
	cmp	WORD PTR [bp+24],1	;HRES
	je	$JCC1424
	jmp	$I861
$JCC1424:
; Line 304
; Line 308
	push	WORD PTR _MYWID
	push	WORD PTR [bp-740]	;MSK
	push	WORD PTR [bp+22]	;BUFFER
	mov	ax,WORD PTR _MYWID
	imul	WORD PTR [bp-732]	;i
	push	ax
	mov	ax,WORD PTR _CLOUDSEG
	add	ax,WORD PTR [bp-12]	;GRY
	push	ax
	mov	ax,WORD PTR [bp-60]	;ZADD
	mov	dx,WORD PTR [bp-58]
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
	push	ax
	mov	ax,WORD PTR [bp-10]	;XADD
	mov	dx,WORD PTR [bp-8]
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
	push	ax
	mov	ax,WORD PTR [bp-762]	;ZS
	mov	dx,WORD PTR [bp-760]
	mov	cx,WORD PTR [bp+8]	;ZC
	mov	bx,WORD PTR [bp+10]
	shl	cx,1
	rcl	bx,1
	sub	ax,cx
	sbb	dx,bx
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
	push	ax
	mov	ax,WORD PTR [bp-750]	;XS
	mov	dx,WORD PTR [bp-748]
	mov	cx,WORD PTR [bp+4]	;XC
	mov	bx,WORD PTR [bp+6]
	shl	cx,1
	rcl	bx,1
	sub	ax,cx
	sbb	dx,bx
	mov	al,ah
	mov	ah,dl
	mov	dl,dh
	shl	dh,1
	sbb	dh,dh
	jmp	$L20037
	nop	
$I861:
; Line 311
; Line 315
	push	WORD PTR _MYWID
	push	WORD PTR [bp-740]	;MSK
	push	WORD PTR [bp+22]	;BUFFER
	mov	ax,WORD PTR _MYWID
	imul	WORD PTR [bp-732]	;i
	push	ax
	mov	ax,WORD PTR _CLOUDSEG
	add	ax,WORD PTR [bp-12]	;GRY
	push	ax
	mov	ax,WORD PTR [bp-60]	;ZADD
	mov	dx,WORD PTR [bp-58]
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
	push	ax
	mov	ax,WORD PTR [bp-10]	;XADD
	mov	dx,WORD PTR [bp-8]
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
	push	ax
	mov	ax,WORD PTR [bp-762]	;ZS
	mov	dx,WORD PTR [bp-760]
	mov	cx,WORD PTR [bp+8]	;ZC
	mov	bx,WORD PTR [bp+10]
	shl	cx,1
	rcl	bx,1
	sub	ax,cx
	sbb	dx,bx
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
	push	ax
	mov	ax,WORD PTR [bp-750]	;XS
	mov	dx,WORD PTR [bp-748]
	mov	cx,WORD PTR [bp+4]	;XC
	mov	bx,WORD PTR [bp+6]
	shl	cx,1
	rcl	bx,1
	sub	ax,cx
	sbb	dx,bx
	mov	al,ah
	mov	ah,dl
	mov	dl,dh
	shl	dh,1
	sbb	dh,dh
	jmp	$L20041
$I853:
; Line 321
	cmp	WORD PTR _ABOVECLOUDS,0
	je	$L20013
	mov	ax,WORD PTR _CLOUDSEG
	add	ax,2056
	jmp	SHORT $L20014
	nop	
$L20013:
	mov	ax,WORD PTR _CLOUDSEG
	add	ax,8
$L20014:
	mov	WORD PTR [bp-72],ax	;GSEG
; Line 322
	cmp	WORD PTR _ABOVECLOUDS,0
	jne	$JCC1836
	jmp	$I866
$JCC1836:
; Line 323
	mov	ax,WORD PTR [bp-758]	;M
	neg	ax
	push	ax
	push	WORD PTR [bp-784]	;CHT
	mov	cx,ax
	mov	ax,152
	sub	ax,WORD PTR [bp-732]	;i
	shl	ax,1
	shl	ax,1
	mov	bx,3
	cwd	
	idiv	bx
	push	ax
	push	WORD PTR [bp-746]	;FE
	push	WORD PTR [bp-722]
	push	WORD PTR [bp-724]	;FA
	mov	si,ax
	mov	di,cx
	call	_NXSLine
	add	sp,12
	mov	WORD PTR [bp-750],ax	;XS
	mov	WORD PTR [bp-748],dx
; Line 324
	push	di
	push	WORD PTR [bp-784]	;CHT
	push	si
	push	WORD PTR [bp-754]	;FF
	push	WORD PTR [bp-726]
	push	WORD PTR [bp-728]	;FB
	call	_NXSLine
	add	sp,12
	mov	WORD PTR [bp-762],ax	;ZS
	mov	WORD PTR [bp-760],dx
; Line 325
	push	di
	push	WORD PTR [bp-784]	;CHT
	push	WORD PTR [bp-730]	;FC
	call	_NXSADDLine
	add	sp,6
	mov	WORD PTR [bp-10],ax	;XADD
	mov	WORD PTR [bp-8],dx
; Line 326
	push	di
	push	WORD PTR [bp-784]	;CHT
	push	WORD PTR [bp-738]	;FD
	call	_NXSADDLine
	add	sp,6
	mov	WORD PTR [bp-60],ax	;ZADD
	mov	WORD PTR [bp-58],dx
; Line 327
	shl	WORD PTR [bp-750],1	;XS
	rcl	WORD PTR [bp-748],1
; Line 328
	shl	WORD PTR [bp-762],1	;ZS
	rcl	WORD PTR [bp-760],1
; Line 329
	mov	WORD PTR [bp-12],2056	;GRY
; Line 330
	mov	WORD PTR [bp-740],127	;MSK
; Line 333
	mov	WORD PTR [bp-720],0	;DELSWITCH
; Line 334
	cmp	WORD PTR [bp-66],512	;SHFT
	jle	$I867
; Line 335
	mov	WORD PTR [bp-720],1	;DELSWITCH
; Line 336
	mov	WORD PTR [bp-740],63	;MSK
; Line 337
; Line 339
$I867:
	cmp	WORD PTR [bp-66],1024	;SHFT
	jle	$I868
; Line 340
	inc	WORD PTR [bp-720]	;DELSWITCH
; Line 341
	sar	WORD PTR [bp-740],1	;MSK
; Line 342
; Line 343
$I868:
	cmp	WORD PTR [bp-66],2048	;SHFT
	jle	$I869
; Line 344
	inc	WORD PTR [bp-720]	;DELSWITCH
; Line 345
	sar	WORD PTR [bp-740],1	;MSK
; Line 346
; Line 348
$I869:
	mov	WORD PTR [bp-740],0	;MSK
; Line 349
	push	WORD PTR [bp-16]	;MYM
	call	_abs
	add	sp,2
	cmp	ax,16
	jge	$I870
; Line 350
	mov	WORD PTR [bp-4],OFFSET _GRTBLSEG	;P
	mov	WORD PTR [bp-2],SEG _GRTBLSEG
; Line 351
	push	WORD PTR [bp-16]	;MYM
	call	_abs
	add	sp,2
	sub	ax,15
	neg	ax
	mov	cl,4
	shl	ax,cl
	add	ax,WORD PTR [bp-2]
	mov	WORD PTR [bp-740],ax	;MSK
; Line 352
; Line 354
$I870:
	cmp	WORD PTR [bp+24],1	;HRES
	je	$JCC2117
	jmp	$I871
$JCC2117:
; Line 355
; Line 359
	push	WORD PTR _MYWID
	push	WORD PTR [bp-740]	;MSK
	push	WORD PTR [bp+22]	;BUFFER
	mov	ax,WORD PTR _MYWID
	imul	WORD PTR [bp-732]	;i
	push	ax
	mov	ax,WORD PTR _CLOUDSEG
	add	ax,WORD PTR [bp-12]	;GRY
	push	ax
	mov	ax,WORD PTR [bp-60]	;ZADD
	mov	dx,WORD PTR [bp-58]
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
	push	ax
	mov	ax,WORD PTR [bp-10]	;XADD
	mov	dx,WORD PTR [bp-8]
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
	push	ax
	mov	ax,WORD PTR [bp-762]	;ZS
	mov	dx,WORD PTR [bp-760]
	mov	cx,WORD PTR [bp+8]	;ZC
	mov	bx,WORD PTR [bp+10]
	shl	cx,1
	rcl	bx,1
	sub	ax,cx
	sbb	dx,bx
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
	push	ax
	mov	ax,WORD PTR [bp-750]	;XS
	mov	dx,WORD PTR [bp-748]
	mov	cx,WORD PTR [bp+4]	;XC
	mov	bx,WORD PTR [bp+6]
	shl	cx,1
	rcl	bx,1
	sub	ax,cx
	sbb	dx,bx
	mov	al,ah
	mov	ah,dl
	mov	dl,dh
	shl	dh,1
	sbb	dh,dh
$L20040:
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	push	ax
	call	_MyWaterline2
	jmp	$L20036
$I871:
; Line 363
; Line 367
	push	WORD PTR _MYWID
	push	WORD PTR [bp-740]	;MSK
	push	WORD PTR [bp+22]	;BUFFER
	mov	ax,WORD PTR _MYWID
	imul	WORD PTR [bp-732]	;i
	push	ax
	mov	ax,WORD PTR _CLOUDSEG
	add	ax,WORD PTR [bp-12]	;GRY
	push	ax
	mov	ax,WORD PTR [bp-60]	;ZADD
	mov	dx,WORD PTR [bp-58]
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
	push	ax
	mov	ax,WORD PTR [bp-10]	;XADD
	mov	dx,WORD PTR [bp-8]
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
	push	ax
	mov	ax,WORD PTR [bp-762]	;ZS
	mov	dx,WORD PTR [bp-760]
	mov	cx,WORD PTR [bp+8]	;ZC
	mov	bx,WORD PTR [bp+10]
	shl	cx,1
	rcl	bx,1
	sub	ax,cx
	sbb	dx,bx
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
	push	ax
	mov	ax,WORD PTR [bp-750]	;XS
	mov	dx,WORD PTR [bp-748]
	mov	cx,WORD PTR [bp+4]	;XC
	mov	bx,WORD PTR [bp+6]
	shl	cx,1
	rcl	bx,1
	sub	ax,cx
	sbb	dx,bx
	mov	al,ah
	mov	ah,dl
	mov	dl,dh
	shl	dh,1
	sbb	dh,dh
$L20039:
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	push	ax
	call	_MyWaterline
$L20036:
	add	sp,18
; Line 369
; Line 370
	jmp	$FC844
	nop	
$I866:
; Line 371
	mov	ax,WORD PTR [bp-758]	;M
	neg	ax
	push	ax
	push	WORD PTR [bp-756]	;HT
	mov	cx,ax
	mov	ax,152
	sub	ax,WORD PTR [bp-732]	;i
	shl	ax,1
	shl	ax,1
	mov	bx,3
	cwd	
	idiv	bx
	push	ax
	push	WORD PTR [bp-746]	;FE
	push	WORD PTR [bp-722]
	push	WORD PTR [bp-724]	;FA
	mov	si,ax
	mov	di,cx
	call	_NXSLine
	add	sp,12
	mov	WORD PTR [bp-750],ax	;XS
	mov	WORD PTR [bp-748],dx
; Line 372
	push	di
	push	WORD PTR [bp-756]	;HT
	push	si
	push	WORD PTR [bp-754]	;FF
	push	WORD PTR [bp-726]
	push	WORD PTR [bp-728]	;FB
	call	_NXSLine
	add	sp,12
	mov	WORD PTR [bp-762],ax	;ZS
	mov	WORD PTR [bp-760],dx
; Line 373
	push	di
	push	WORD PTR [bp-756]	;HT
	push	WORD PTR [bp-730]	;FC
	call	_NXSADDLine
	add	sp,6
	mov	WORD PTR [bp-10],ax	;XADD
	mov	WORD PTR [bp-8],dx
; Line 374
	push	di
	push	WORD PTR [bp-756]	;HT
	push	WORD PTR [bp-738]	;FD
	call	_NXSADDLine
	add	sp,6
	mov	WORD PTR [bp-60],ax	;ZADD
	mov	WORD PTR [bp-58],dx
; Line 375
	shl	WORD PTR [bp-750],1	;XS
	rcl	WORD PTR [bp-748],1
; Line 376
	shl	WORD PTR [bp-762],1	;ZS
	rcl	WORD PTR [bp-760],1
; Line 377
	mov	WORD PTR [bp-12],8	;GRY
; Line 379
	mov	ax,WORD PTR [bp-10]	;XADD
	mov	dx,WORD PTR [bp-8]
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
	push	ax
	mov	si,ax
	call	_abs
	add	sp,2
	mov	cx,WORD PTR [bp-60]	;ZADD
	mov	dx,WORD PTR [bp-58]
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
	sar	dx,1
	rcr	cx,1
	push	cx
	mov	di,ax
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-786],si
	cmp	ax,di
	jge	$L20015
	push	si
	jmp	SHORT $L20031
	nop	
$L20015:
	mov	ax,WORD PTR [bp-60]	;ZADD
	mov	dx,WORD PTR [bp-58]
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
	push	ax
$L20031:
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-66],ax	;SHFT
; Line 381
	mov	WORD PTR [bp-740],0	;MSK
; Line 382
	push	WORD PTR [bp-758]	;M
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR [bp-752]	;ARADD
	jge	$I874
; Line 383
	push	WORD PTR [bp-758]	;M
	call	_abs
	add	sp,2
	sub	ax,WORD PTR [bp-752]	;ARADD
	neg	ax
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR [bp-740],ax	;MSK
; Line 384
	mov	WORD PTR [bp-4],OFFSET _GRTBLSEG	;P
	mov	WORD PTR [bp-2],SEG _GRTBLSEG
; Line 385
	mov	cl,4
	shl	ax,cl
	add	ax,WORD PTR [bp-2]
	mov	WORD PTR [bp-740],ax	;MSK
; Line 386
; Line 400
$I874:
	cmp	WORD PTR [bp+24],1	;HRES
	je	$JCC2844
	jmp	$I875
$JCC2844:
; Line 401
; Line 405
	push	WORD PTR _MYWID
	push	WORD PTR [bp-740]	;MSK
	push	WORD PTR [bp+22]	;BUFFER
	mov	ax,WORD PTR _MYWID
	imul	WORD PTR [bp-732]	;i
	push	ax
	mov	ax,WORD PTR _CLOUDSEG
	add	ax,WORD PTR [bp-12]	;GRY
	push	ax
	mov	ax,WORD PTR [bp-60]	;ZADD
	mov	dx,WORD PTR [bp-58]
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
	push	ax
	mov	ax,WORD PTR [bp-10]	;XADD
	mov	dx,WORD PTR [bp-8]
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
	push	ax
	mov	ax,WORD PTR [bp-762]	;ZS
	mov	dx,WORD PTR [bp-760]
	mov	cx,WORD PTR [bp+8]	;ZC
	mov	bx,WORD PTR [bp+10]
	shl	cx,1
	rcl	bx,1
	sub	ax,cx
	sbb	dx,bx
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
	push	ax
	mov	ax,WORD PTR [bp-750]	;XS
	mov	dx,WORD PTR [bp-748]
	mov	cx,WORD PTR [bp+4]	;XC
	mov	bx,WORD PTR [bp+6]
	shl	cx,1
	rcl	bx,1
	sub	ax,cx
	sbb	dx,bx
	sar	dx,1
	rcr	ax,1
$L20037:
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	jmp	$L20040
	nop	
$I875:
; Line 408
; Line 412
	push	WORD PTR _MYWID
	push	WORD PTR [bp-740]	;MSK
	push	WORD PTR [bp+22]	;BUFFER
	mov	ax,WORD PTR _MYWID
	imul	WORD PTR [bp-732]	;i
	push	ax
	mov	ax,WORD PTR _CLOUDSEG
	add	ax,WORD PTR [bp-12]	;GRY
	push	ax
	mov	ax,WORD PTR [bp-60]	;ZADD
	mov	dx,WORD PTR [bp-58]
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
	push	ax
	mov	ax,WORD PTR [bp-10]	;XADD
	mov	dx,WORD PTR [bp-8]
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
	push	ax
	mov	ax,WORD PTR [bp-762]	;ZS
	mov	dx,WORD PTR [bp-760]
	mov	cx,WORD PTR [bp+8]	;ZC
	mov	bx,WORD PTR [bp+10]
	shl	cx,1
	rcl	bx,1
	sub	ax,cx
	sbb	dx,bx
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
	push	ax
	mov	ax,WORD PTR [bp-750]	;XS
	mov	dx,WORD PTR [bp-748]
	mov	cx,WORD PTR [bp+4]	;XC
	mov	bx,WORD PTR [bp+6]
	shl	cx,1
	rcl	bx,1
	sub	ax,cx
	sbb	dx,bx
	sar	dx,1
	rcr	ax,1
$L20041:
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	jmp	$L20039
$FB845:
; Line 420
; Line 424
	push	WORD PTR [bp+18]	;ROLL
	mov	ax,64
	push	ax
	call	_ACosB
	add	sp,4
	mov	WORD PTR [bp-64],ax	;CXADD
; Line 426
	mov	ax,WORD PTR [bp-14]	;NWID
	mov	WORD PTR [bp-718],ax	;W
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	cx,ax
	imul	WORD PTR [bp-64]	;CXADD
	neg	ax
	mov	WORD PTR [bp-780],ax	;CXS
; Line 427
	push	WORD PTR [bp+18]	;ROLL
	mov	ax,48
	push	ax
	mov	si,cx
	call	_ASinB
	add	sp,4
	mov	WORD PTR [bp-70],ax	;CYADD
	imul	si
	neg	ax
	mov	WORD PTR [bp-782],ax	;CYS
; Line 429
	mov	WORD PTR [bp-732],0	;i
	jmp	SHORT $F878
	nop	
$FC879:
; Line 430
	mov	ax,WORD PTR [bp-780]	;CXS
	mov	cx,WORD PTR [bp-778]	;ZD
	shl	cx,1
	cwd	
	idiv	cx
	mov	cx,ax
	mov	ax,WORD PTR [bp-782]	;CYS
	cwd	
	idiv	WORD PTR [bp-778]	;ZD
	imul	WORD PTR _MYWID
	add	cx,ax
	mov	si,WORD PTR [bp-732]	;i
	shl	si,1
	mov	WORD PTR [bp-716][si],cx
; Line 431
	mov	ax,WORD PTR [bp-64]	;CXADD
	add	WORD PTR [bp-780],ax	;CXS
; Line 432
	mov	ax,WORD PTR [bp-70]	;CYADD
	add	WORD PTR [bp-782],ax	;CYS
; Line 433
	inc	WORD PTR [bp-732]	;i
$F878:
	mov	ax,WORD PTR [bp-732]	;i
	cmp	WORD PTR [bp-718],ax	;W
	jg	$FC879
; Line 436
	mov	ax,WORD PTR _NGYLO
	mov	WORD PTR [bp-732],ax	;i
	jmp	SHORT $F881
	nop	
$FC882:
; Line 437
	push	WORD PTR [bp+18]	;ROLL
	sub	ax,WORD PTR _NGYMID
	neg	ax
	shl	ax,1
	mov	cx,3
	cwd	
	idiv	cx
	push	ax
	call	_ASinB
	add	sp,4
	push	WORD PTR [bp+18]	;ROLL
	mov	cx,WORD PTR [bp-732]	;i
	sub	cx,WORD PTR _NGYMID
	push	cx
	mov	si,ax
	call	_ACosB
	add	sp,4
	add	ax,152
	imul	WORD PTR _MYWID
	add	si,ax
	mov	ax,WORD PTR _MYWID
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,si
	mov	WORD PTR [bp-62],ax	;ADDBASE
; Line 440
	push	WORD PTR _GRPAGE0+2
	push	WORD PTR [bp-14]	;NWID
	push	WORD PTR [bp-732]	;i
	push	WORD PTR _NGXLO
	lea	ax,WORD PTR [bp-716]	;ADDRESS
	push	ax
	push	WORD PTR [bp-62]	;ADDBASE
	push	WORD PTR [bp+22]	;BUFFER
	call	_NScaleLine
	add	sp,14
; Line 452
	inc	WORD PTR [bp-732]	;i
$F881:
	mov	ax,WORD PTR [bp-732]	;i
	cmp	WORD PTR _NGYHI,ax
	jge	$FC882
; Line 453
; Line 454
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_NHorz	ENDP
; Line 458
_TEXT      ENDS
CONST      SEGMENT
$T20017	DW SEG _STACK3D 
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_EndStack3D
_EndStack3D	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,34
	call	__aNchkstk
	push	di
	push	si
;	i = -24
;	SCL = -4
;	SHFT = -10
;	t1 = -8
;	t2 = -14
;	t3 = -18
;	X = -20
;	Y = -22
;	Z = -26
; Line 465
	mov	ax,WORD PTR _FARSTACK
$L20044:
	mov	WORD PTR [bp-24],ax	;i
	cmp	ax,-1
	jne	$JCC3484
	jmp	$FB898
$JCC3484:
; Line 466
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	bx,ax
	mov	es,WORD PTR $T20017
	mov	ax,WORD PTR es:_STACK3D[bx+16]
	cwd	
	mov	WORD PTR [bp-4],ax	;SCL
	mov	WORD PTR [bp-2],dx
; Line 467
	mov	cx,WORD PTR es:_STACK3D[bx+2]
	mov	WORD PTR [bp-20],cx	;X
; Line 468
	mov	si,WORD PTR es:_STACK3D[bx+4]
	mov	WORD PTR [bp-22],si	;Y
; Line 469
	mov	di,WORD PTR es:_STACK3D[bx+6]
	mov	WORD PTR [bp-26],di	;Z
; Line 470
	or	dx,dx
	jge	$JCC3539
	jmp	$I902
$JCC3539:
	jg	$L20018
	cmp	ax,1
	ja	$JCC3549
	jmp	$I902
$JCC3549:
$L20018:
; Line 471
; Line 473
	push	dx
	push	ax
	mov	bx,ax
	mov	ax,cx
	mov	cx,dx
	cwd	
	push	dx
	push	ax
	mov	WORD PTR [bp-30],bx
	mov	WORD PTR [bp-28],cx
	call	__aNlmul
	mov	WORD PTR [bp-8],ax	;t1
	mov	WORD PTR [bp-6],dx
; Line 475
	push	WORD PTR [bp-28]
	push	WORD PTR [bp-30]
	mov	cx,ax
	mov	ax,si
	mov	bx,dx
	cwd	
	push	dx
	push	ax
	mov	si,cx
	mov	WORD PTR [bp-34],si
	mov	WORD PTR [bp-32],bx
	call	__aNlmul
	mov	WORD PTR [bp-14],ax	;t2
	mov	WORD PTR [bp-12],dx
; Line 477
	push	WORD PTR [bp-28]
	push	WORD PTR [bp-30]
	mov	ax,di
	cwd	
	push	dx
	push	ax
	call	__aNlmul
	mov	WORD PTR [bp-18],ax	;t3
	mov	WORD PTR [bp-16],dx
; Line 478
	push	WORD PTR [bp-32]
	push	WORD PTR [bp-34]
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$L20022
	jl	$L20020
	cmp	ax,6000
	ja	$L20022
$L20020:
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;t2
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$L20022
	jl	$L20021
	cmp	ax,6000
	ja	$L20022
$L20021:
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;t3
	call	_labs
	add	sp,4
	or	dx,dx
	jl	$I900
	jg	$L20022
	cmp	ax,6000
	jbe	$I900
$L20022:
; Line 479
; Line 480
	mov	al,3
	push	ax
	lea	cx,WORD PTR [bp-8]	;t1
	push	cx
	call	__aNNalshr
	mov	WORD PTR [bp-20],ax	;X
; Line 481
	mov	al,3
	push	ax
	lea	cx,WORD PTR [bp-14]	;t2
	push	cx
	call	__aNNalshr
	mov	WORD PTR [bp-22],ax	;Y
; Line 482
	mov	al,3
	push	ax
	lea	ax,WORD PTR [bp-18]	;t3
	push	ax
	call	__aNNalshr
	mov	WORD PTR [bp-26],ax	;Z
; Line 483
	mov	WORD PTR [bp-10],3	;SHFT
; Line 484
; Line 485
	jmp	SHORT $I902
	nop	
$I900:
; Line 486
; Line 487
	mov	ax,WORD PTR [bp-8]	;t1
	mov	WORD PTR [bp-20],ax	;X
; Line 488
	mov	ax,WORD PTR [bp-14]	;t2
	mov	WORD PTR [bp-22],ax	;Y
; Line 489
	mov	ax,WORD PTR [bp-18]	;t3
	mov	WORD PTR [bp-26],ax	;Z
; Line 490
	mov	WORD PTR [bp-10],0	;SHFT
; Line 491
$I902:
; Line 492
; Line 494
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	bx,ax
	mov	es,WORD PTR $T20017
	mov	ax,WORD PTR es:_STACK3D[bx+14]
	jmp	$S903
; Line 495
	nop	
$SC907:
; Line 503
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	bx,ax
	mov	es,WORD PTR $T20017
	push	WORD PTR es:_STACK3D[bx+14]
	push	WORD PTR [bp-10]	;SHFT
	push	WORD PTR es:_STACK3D[bx+8]
	push	WORD PTR [bp-26]	;Z
	push	WORD PTR [bp-22]	;Y
	push	WORD PTR [bp-20]	;X
	call	_DrawCarrier
$L20042:
	add	sp,12
; Line 504
$SB904:
; Line 537
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	bx,ax
	mov	es,WORD PTR $T20017
	mov	ax,WORD PTR es:_STACK3D[bx+10]
	jmp	$L20044
; Line 505
$SC909:
; Line 506
	push	WORD PTR [bp-10]	;SHFT
	push	WORD PTR [bp-26]	;Z
	push	WORD PTR [bp-22]	;Y
	push	WORD PTR [bp-20]	;X
	call	_DrawCoolF14
	add	sp,8
; Line 507
	jmp	SHORT $SB904
; Line 509
$SC911:
; Line 510
	push	WORD PTR [bp-10]	;SHFT
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	bx,ax
	mov	es,WORD PTR $T20017
	push	WORD PTR es:_STACK3D[bx+8]
	push	WORD PTR [bp-26]	;Z
	push	WORD PTR [bp-22]	;Y
	push	WORD PTR [bp-20]	;X
	push	WORD PTR es:_STACK3D[bx]
	call	_DrawMissile
	jmp	SHORT $L20042
; Line 512
	nop	
$SC913:
; Line 513
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	bx,ax
	mov	es,WORD PTR $T20017
	mov	al,BYTE PTR es:_STACK3D[bx+1]
	cbw	
	push	ax
	mov	si,bx
	call	_MapIn3dObjects
	add	sp,2
	or	ax,ax
	je	$SB904
; Line 514
	push	WORD PTR [bp-10]	;SHFT
	mov	ax,1
	push	ax
	mov	es,WORD PTR $T20017
	push	WORD PTR es:_STACK3D[si+8]
	push	WORD PTR [bp-26]	;Z
	push	WORD PTR [bp-22]	;Y
	push	WORD PTR [bp-20]	;X
	call	_DrawASmoke
	jmp	$L20042
; Line 517
$SC917:
; Line 518
	push	WORD PTR [bp-10]	;SHFT
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	bx,ax
	mov	es,WORD PTR $T20017
	push	WORD PTR es:_STACK3D[bx+8]
	push	WORD PTR [bp-26]	;Z
	push	WORD PTR [bp-22]	;Y
	push	WORD PTR [bp-20]	;X
	push	WORD PTR es:_STACK3D[bx]
	call	_DrawShadow
	jmp	$L20042
; Line 520
$SC919:
; Line 521
	push	WORD PTR [bp-10]	;SHFT
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	bx,ax
	mov	es,WORD PTR $T20017
	push	WORD PTR es:_STACK3D[bx+8]
	push	WORD PTR [bp-26]	;Z
	push	WORD PTR [bp-22]	;Y
	push	WORD PTR [bp-20]	;X
	push	WORD PTR es:_STACK3D[bx]
	call	_DrawTexPlane
	jmp	$L20042
; Line 523
$SC921:
; Line 524
	push	WORD PTR [bp-10]	;SHFT
	push	WORD PTR [bp-26]	;Z
	push	WORD PTR [bp-22]	;Y
	push	WORD PTR [bp-20]	;X
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	bx,ax
	mov	es,WORD PTR $T20017
	push	WORD PTR es:_STACK3D[bx]
	call	_DrawChute
$L20043:
	add	sp,10
; Line 525
	jmp	$SB904
; Line 526
$SC923:
; Line 528
	push	WORD PTR [bp-10]	;SHFT
	push	WORD PTR [bp-26]	;Z
	push	WORD PTR [bp-22]	;Y
	push	WORD PTR [bp-20]	;X
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	bx,ax
	mov	es,WORD PTR $T20017
	push	WORD PTR es:_STACK3D[bx]
	call	_DrawDecoy
	jmp	SHORT $L20043
; Line 530
$SC925:
; Line 531
	push	WORD PTR [bp-10]	;SHFT
	mov	ax,18
	imul	WORD PTR [bp-24]	;i
	mov	bx,ax
	mov	es,WORD PTR $T20017
	push	WORD PTR es:_STACK3D[bx+8]
	push	WORD PTR [bp-26]	;Z
	push	WORD PTR [bp-22]	;Y
	push	WORD PTR [bp-20]	;X
	push	WORD PTR es:_STACK3D[bx]
	call	_DrawRegBoat
	jmp	$L20042
; Line 533
$S903:
	cmp	ax,90
	je	$SC925
	ja	$SD927
	cmp	al,50
	je	$SC921
	jg	$L20024
	dec	al
	cmp	ax,39
	ja	$SD927
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20025[bx]
	nop	
	nop	
$L20025:
		DW	$SC907
		DW	$SC907
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SC907
		DW	$SC907
		DW	$SC907
		DW	$SC907
		DW	$SC907
		DW	$SC907
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SC909
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SD927
		DW	$SC919
$L20024:
	cmp	al,60
	jne	$JCC4278
	jmp	$SC917
$JCC4278:
	jg	$L20026
	sub	al,55
	jl	$SD927
	dec	al
	jg	$JCC4291
	jmp	$SC923
$JCC4291:
$SD927:
; Line 534
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG929
	push	ax
	call	_Message
	add	sp,4
; Line 535
	jmp	$SB904
$L20026:
	sub	al,70
	jne	$JCC4314
	jmp	$SC911
$JCC4314:
	sub	al,10
	jne	$JCC4321
	jmp	$SC913
$JCC4321:
	jmp	SHORT $SD927
$FB898:
; Line 540
	mov	WORD PTR _LASTSTACK,0
; Line 541
	mov	WORD PTR _FARSTACK,-1
; Line 543
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_EndStack3D	ENDP
; Line 547
	PUBLIC	_Stack3Dobject
_Stack3Dobject	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
;	i = -8
;	prev = -12
;	DST = -10
;	V = -6
;	objtype = 16
;	SCL = 14
;	ID = 12
;	Z = 10
;	Y = 8
;	X = 6
;	OBJ = 4
; Line 552
	cmp	WORD PTR _LASTSTACK,49
	jle	$I943
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 554
$I943:
	push	WORD PTR [bp+10]	;Z
	push	WORD PTR [bp+8]	;Y
	push	WORD PTR [bp+6]	;X
	call	_Dist3D
	add	sp,6
	mov	WORD PTR [bp-10],ax	;DST
; Line 558
	cmp	WORD PTR [bp+16],2	;objtype
	jne	$I946
; Line 559
	cmp	ax,30000
	jae	$I946
; Line 560
	add	WORD PTR [bp-10],2000	;DST
; Line 561
$I946:
; Line 563
	cmp	WORD PTR [bp+16],1	;objtype
	jne	$I950
; Line 564
; Line 565
	cmp	WORD PTR _ViewZ,16
	jge	$I948
; Line 566
; Line 567
	mov	WORD PTR [bp-10],0	;DST
; Line 574
	jmp	SHORT $I950
$I948:
; Line 575
; Line 576
	cmp	WORD PTR [bp-10],30000	;DST
	jae	$I950
; Line 577
	add	WORD PTR [bp-10],1000	;DST
; Line 578
$I950:
; Line 579
; Line 581
	mov	ax,WORD PTR [bp+6]	;X
	mov	WORD PTR [bp-6],ax	;V
; Line 582
	mov	cx,WORD PTR [bp+8]	;Y
	mov	WORD PTR [bp-4],cx
; Line 583
	mov	dx,WORD PTR [bp+10]	;Z
	mov	WORD PTR [bp-2],dx
; Line 584
	mov	bx,OFFSET _Nviewmat
	push	bx
	lea	bx,WORD PTR [bp-6]	;V
	push	bx
	call	_Rotate
	add	sp,4
; Line 585
	add	WORD PTR [bp-2],500
; Line 590
	mov	ax,18
	imul	WORD PTR _LASTSTACK
	mov	bx,ax
	mov	es,WORD PTR $T20017
	mov	ax,WORD PTR [bp+4]	;OBJ
	mov	WORD PTR es:_STACK3D[bx],ax
; Line 591
	mov	ax,WORD PTR [bp+6]	;X
	mov	WORD PTR es:_STACK3D[bx+2],ax
; Line 592
	mov	ax,WORD PTR [bp+8]	;Y
	mov	WORD PTR es:_STACK3D[bx+4],ax
; Line 593
	mov	ax,WORD PTR [bp+10]	;Z
	mov	WORD PTR es:_STACK3D[bx+6],ax
; Line 594
	mov	ax,WORD PTR [bp+12]	;ID
	mov	WORD PTR es:_STACK3D[bx+8],ax
; Line 595
	mov	WORD PTR es:_STACK3D[bx+10],-1
; Line 596
	mov	ax,WORD PTR [bp-10]	;DST
	mov	WORD PTR es:_STACK3D[bx+12],ax
; Line 597
	mov	ax,WORD PTR [bp+16]	;objtype
	mov	WORD PTR es:_STACK3D[bx+14],ax
; Line 598
	mov	ax,WORD PTR [bp+14]	;SCL
	mov	WORD PTR es:_STACK3D[bx+16],ax
; Line 600
	cmp	WORD PTR _LASTSTACK,0
	jne	$I952
; Line 601
	mov	WORD PTR _FARSTACK,0
; Line 602
$L20045:
	inc	WORD PTR _LASTSTACK
; Line 603
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 604
; Line 606
	nop	
$I952:
	mov	ax,WORD PTR _FARSTACK
	mov	WORD PTR [bp-8],ax	;i
	mov	WORD PTR [bp-12],-1	;prev
$FC954:
	cmp	ax,-1
	je	$FB955
; Line 608
	mov	ax,18
	imul	WORD PTR [bp-8]	;i
	mov	bx,ax
	mov	ax,WORD PTR [bp-10]	;DST
	cmp	WORD PTR es:_STACK3D[bx+12],ax
	jae	$I956
$FB955:
; Line 612
	mov	ax,18
	imul	WORD PTR _LASTSTACK
	mov	bx,ax
	mov	ax,WORD PTR [bp-8]	;i
	mov	WORD PTR es:_STACK3D[bx+10],ax
; Line 614
	cmp	WORD PTR [bp-12],-1	;prev
	jne	$I957
; Line 615
	mov	ax,WORD PTR _LASTSTACK
	mov	WORD PTR _FARSTACK,ax
; Line 616
	jmp	SHORT $L20045
; Line 609
	nop	
$I956:
; Line 610
	mov	ax,WORD PTR [bp-8]	;i
	mov	WORD PTR [bp-12],ax	;prev
	mov	cx,18
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR es:_STACK3D[bx+10]
	mov	WORD PTR [bp-8],ax	;i
; Line 611
	jmp	SHORT $FC954
	nop	
$I957:
; Line 617
	mov	ax,18
	imul	WORD PTR [bp-12]	;prev
	mov	bx,ax
	mov	ax,WORD PTR _LASTSTACK
	mov	WORD PTR es:_STACK3D[bx+10],ax
	jmp	SHORT $L20045
; Line 621

_Stack3Dobject	ENDP
; Line 626
	PUBLIC	_DrawAAA
_DrawAAA	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,68
	call	__aNchkstk
	push	si
;	dx = -40
;	dy = -54
;	dz = -66
;	t1 = -28
;	t2 = -34
;	cnt = -24
;	acnt = -30
;	adx = -50
;	ady = -64
;	Save = -68
;	VM = -22
;	Angle2 = -36
;	Fred = -4
; Line 634
	mov	ax,525
	mov	WORD PTR [bp-50],ax	;adx
	mov	WORD PTR [bp-48],ax
	mov	WORD PTR [bp-62],ax
	mov	WORD PTR [bp-58],ax
	mov	ax,-525
	mov	WORD PTR [bp-44],ax
	mov	WORD PTR [bp-42],ax
	mov	WORD PTR [bp-64],ax	;ady
	mov	WORD PTR [bp-56],ax
; Line 639
	mov	WORD PTR [bp-4],OFFSET _AAFIRE	;Fred
	mov	WORD PTR [bp-2],SEG _AAFIRE
; Line 642
	mov	ax,WORD PTR _Seg3D
	mov	WORD PTR [bp-68],ax	;Save
; Line 643
	mov	ax,WORD PTR [bp-2]
	mov	WORD PTR _Seg3D,ax
; Line 645
	sub	ax,ax
	mov	WORD PTR [bp-46],ax
	mov	WORD PTR [bp-60],ax
	mov	WORD PTR [bp-24],ax	;cnt
	jmp	$F975
; Line 658
$I984:
; Line 659
	push	WORD PTR [bp-38]
	push	WORD PTR [bp-40]	;dx
	call	_labs
	add	sp,4
	mov	WORD PTR [bp-28],ax	;t1
	mov	WORD PTR [bp-26],dx
	or	dx,dx
	jge	$JCC4784
	jmp	$I985
$JCC4784:
	jg	$FC982
	cmp	ax,16383
	jbe	$I985
; Line 660
$FC982:
	inc	WORD PTR [bp-30]	;acnt
$F981:
	cmp	WORD PTR [bp-30],5	;acnt
	jl	$JCC4803
	jmp	$FB983
$JCC4803:
; Line 652
	mov	si,WORD PTR [bp-30]	;acnt
	shl	si,1
	mov	ax,WORD PTR [bp-50][si]
	cwd	
	mov	bx,WORD PTR [bp-24]	;cnt
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	shl	bx,1
	add	ax,WORD PTR _gt[bx]
	adc	dx,WORD PTR _gt[bx+2]
	sub	ax,WORD PTR _ViewX
	sbb	dx,WORD PTR _ViewX+2
	mov	WORD PTR [bp-40],ax	;dx
	mov	WORD PTR [bp-38],dx
; Line 653
	mov	ax,WORD PTR [bp-64][si]
	cwd	
	add	ax,WORD PTR _gt[bx+4]
	adc	dx,WORD PTR _gt[bx+6]
	add	ax,WORD PTR _ViewY
	adc	dx,WORD PTR _ViewY+2
	sub	ax,0
	sbb	dx,16
	mov	WORD PTR [bp-54],ax	;dy
	mov	WORD PTR [bp-52],dx
; Line 656
	push	dx
	push	ax
	call	_labs
	add	sp,4
	mov	WORD PTR [bp-28],ax	;t1
	mov	WORD PTR [bp-26],dx
	or	dx,dx
	jge	$JCC4900
	jmp	$I984
$JCC4900:
	jg	$FC982
	cmp	ax,16383
	ja	$JCC4910
	jmp	$I984
$JCC4910:
; Line 657
	jmp	SHORT $FC982
; Line 662
	nop	
$I985:
	mov	ax,WORD PTR [bp-30]	;acnt
	shl	ax,1
	shl	ax,1
	add	ax,WORD PTR [bp-24]	;cnt
	mov	cx,ax
	mov	ah,al
	shl	ah,1
	sub	al,al
	add	ax,WORD PTR $S974_Angle1
	and	ah,31
	mov	WORD PTR [bp-36],ax	;Angle2
; Line 663
	lea	ax,WORD PTR [bp-22]	;VM
	push	ax
	mov	ch,cl
	sub	cl,cl
	mov	dx,cx
	mov	cl,4
	shl	dx,cl
	push	dx
	mov	cx,5471
	push	cx
	sub	cx,cx
	push	cx
	call	_MakeMatRPH
	add	sp,8
; Line 664
	sub	ax,ax
	push	ax
	lea	ax,WORD PTR [bp-36]	;Angle2
	push	ax
	lea	ax,WORD PTR [bp-22]	;VM
	push	ax
	push	WORD PTR [bp-54]	;dy
	push	WORD PTR [bp-66]	;dz
	push	WORD PTR [bp-40]	;dx
	mov	ax,35
	push	ax
	call	_NDraw3DObject
	add	sp,14
; Line 665
	jmp	$FC982
	nop	
$FB983:
; Line 666
; Line 667
	inc	WORD PTR [bp-24]	;cnt
$F975:
	mov	ax,WORD PTR _NGTARGETS
	cmp	WORD PTR [bp-24],ax	;cnt
	jge	$FB977
; Line 646
	mov	bx,WORD PTR [bp-24]	;cnt
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	test	BYTE PTR _gt[bx+11],64
	je	$FB983
; Line 648
	push	WORD PTR _gt[bx+6]
	push	WORD PTR _gt[bx+4]
	push	WORD PTR _gt[bx+2]
	push	WORD PTR _gt[bx]
	call	_GetQHeight
	add	sp,8
	sub	ax,WORD PTR _ViewZ
	mov	WORD PTR [bp-66],ax	;dz
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,16382
	jg	$FB983
; Line 650
	mov	WORD PTR [bp-30],0	;acnt
	jmp	$F981
$FB977:
; Line 669
	mov	ax,2048
	cwd	
	idiv	WORD PTR _FrameRate
	add	WORD PTR $S974_Angle1,ax
; Line 670
	mov	ax,WORD PTR [bp-68]	;Save
	mov	WORD PTR _Seg3D,ax
; Line 671
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DrawAAA	ENDP
_TEXT	ENDS
END
