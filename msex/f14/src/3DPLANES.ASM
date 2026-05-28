;	Static Name Aliases
;
;	$S1575_MedWingRot	EQU	MedWingRot
	TITLE   C:\3DPLANES.C
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
PUBLIC  _CoolObj
PUBLIC  _LIGHTS
PUBLIC  _PLANEDETAIL
PUBLIC  _WingRot
PUBLIC  _HookDown
PUBLIC  _HookRot
PUBLIC  _slposx
PUBLIC  _slposy
PUBLIC  _pflashtbl
EXTRN	_DrawDot:FAR
EXTRN	_Trans3X3:NEAR
EXTRN	_Rotate:NEAR
EXTRN	_Stack3DObject:NEAR
EXTRN	_AICarrierLand:NEAR
EXTRN	_DrawSuper3DObject:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_lproject:NEAR
EXTRN	_GetPicType:NEAR
EXTRN	_Do3DObject:NEAR
EXTRN	_abs:NEAR
EXTRN	_GetMissilePtr:NEAR
EXTRN	_GetPlanePtr:NEAR
EXTRN	_rnd2:NEAR
EXTRN	_MakeMatHPR:NEAR
EXTRN	_labs:NEAR
EXTRN	_InvertMatrix:NEAR
EXTRN	_NDraw3DObject:NEAR
EXTRN	_Sound:NEAR
EXTRN	_AnimVals:BYTE
EXTRN	_O:BYTE
EXTRN	_OurHead:WORD
EXTRN	_OurRoll:WORD
EXTRN	_OurPitch:WORD
EXTRN	_Alt:WORD
EXTRN	_ejected:WORD
EXTRN	_ViewX:DWORD
EXTRN	_ViewY:DWORD
EXTRN	_ViewZ:WORD
EXTRN	_PxLng:DWORD
EXTRN	_PyLng:DWORD
EXTRN	_ds:BYTE
EXTRN	_sx:WORD
EXTRN	_sy:WORD
EXTRN	_NDECOY:WORD
EXTRN	_sz:WORD
EXTRN	_chuteX:WORD
EXTRN	_chuteY:WORD
EXTRN	_ss:BYTE
EXTRN	_chuteZ:WORD
EXTRN	_MinAlt:WORD
EXTRN	_THRUST:WORD
EXTRN	_Gees:WORD
EXTRN	_View:WORD
EXTRN	_Knots:WORD
EXTRN	_detected:WORD
EXTRN	_Firing:WORD
EXTRN	_PalPtr3D:WORD
EXTRN	_LightsOn:WORD
EXTRN	_NPLANES:WORD
EXTRN	_ps:BYTE
EXTRN	_mS1n:BYTE
EXTRN	_mS2n:BYTE
EXTRN	_IdentInvMat:BYTE
_BSS      SEGMENT
COMM NEAR	_MissileAnimVals:	 2:	 16
_BSS      ENDS
EXTRN	_whichourcarr:WORD
EXTRN	_Fticks:WORD
EXTRN	_F14_STATION:BYTE
EXTRN	_bv:BYTE
EXTRN	_paratroopers:BYTE
_BSS      SEGMENT
COMM NEAR	_PlaneAnimVals:	 2:	 32
_BSS      ENDS
EXTRN	_LASTPLANE:WORD
EXTRN	_DOINVISIBLE:WORD
EXTRN	_GFLSH:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Rp3D:WORD
EXTRN	_Status:WORD
_DATA      SEGMENT
_LIGHTS	DW	00H
_PLANEDETAIL	DW	02H
_WingRot	DW	02220H
_HookDown	DW	00H
_HookRot	DW	00H
_slposx	DW	00H
_slposy	DW	00H
_pflashtbl	DW	0fbfbH
	DW	09292H
	DW	09393H
	DW	09292H
_CoolObj	DW	0ffffH
	DW	00H
	DW	00H
	DW	00H
	DW	_IdentInvMat
	DW	_AnimVals
	DD	00H
	DD	00H
	DD	00H
	DW	0ffffH
	DW	00H
	DW	00H
	DW	00H
	DW	_IdentInvMat
	DW	DGROUP:_MissileAnimVals+2
	DD	00H
	DD	00H
	DD	00H
	DW	0ffffH
	DW	00H
	DW	00H
	DW	00H
	DW	_IdentInvMat
	DW	DGROUP:_MissileAnimVals+4
	DD	00H
	DD	00H
	DD	00H
	DW	0ffffH
	DW	00H
	DW	00H
	DW	00H
	DW	_IdentInvMat
	DW	DGROUP:_MissileAnimVals+6
	DD	00H
	DD	00H
	DD	00H
	DW	0ffffH
	DW	00H
	DW	00H
	DW	00H
	DW	_IdentInvMat
	DW	DGROUP:_MissileAnimVals+8
	DD	00H
	DD	00H
	DD	00H
	DW	0ffffH
	DW	00H
	DW	00H
	DW	00H
	DW	_IdentInvMat
	DW	DGROUP:_MissileAnimVals+10
	DD	00H
	DD	00H
	DD	00H
	DW	0ffffH
	DW	00H
	DW	00H
	DW	00H
	DW	_IdentInvMat
	DW	DGROUP:_MissileAnimVals+12
	DD	00H
	DD	00H
	DD	00H
	DW	0ffffH
	DW	00H
	DW	00H
	DW	00H
	DW	_IdentInvMat
	DW	DGROUP:_MissileAnimVals+14
	DD	00H
	DD	00H
	DD	00H
	DW	0ffffH
	DW	00H
	DW	00H
	DW	00H
	DW	_IdentInvMat
	DW	DGROUP:_MissileAnimVals+16
	DD	00H
	DD	00H
	DD	00H
	DW	0ffffH
	DW	00H
	DW	00H
	DW	00H
	DW	_IdentInvMat
	DW	DGROUP:_MissileAnimVals+18
	DD	00H
	DD	00H
	DD	00H
	DW	0ffffH
	DW	00H
	DW	00H
	DW	00H
	DW	_IdentInvMat
	DW	DGROUP:_MissileAnimVals+20
	DD	00H
	DD	00H
	DD	00H
	DW	0ffffH
	DW	00H
	DW	00H
	DW	00H
	DW	_IdentInvMat
	DW	DGROUP:_MissileAnimVals+22
	DD	00H
	DD	00H
	DD	00H
	DW	0ffffH
	DW	00H
	DW	00H
	DW	00H
	DW	_IdentInvMat
	DW	DGROUP:_MissileAnimVals+24
	DD	00H
	DD	00H
	DD	00H
	DW	017H
	DW	00H
	DW	00H
	DW	00H
	DW	_IdentInvMat
	DW	DGROUP:_MissileAnimVals+26
	DD	00H
	DD	00H
	DD	00H
	DW	018H
	DW	00H
	DW	00H
	DW	00H
	DW	_IdentInvMat
	DW	DGROUP:_MissileAnimVals+28
	DD	00H
	DD	00H
	DD	00H
 	DB	24 DUP(0)

_DATA      ENDS
_BSS      SEGMENT
$S1575_MedWingRot	DW 01H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 11
; Line 12
; Line 13
; Line 19
; Line 14
; Line 15
; Line 16
; Line 17
; Line 18
; Line 19
; Line 20
; Line 21
; Line 22
; Line 86
	PUBLIC	_Do3dObject
_Do3dObject	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__aNchkstk
;	dx = -14
;	dy = -18
;	dz = -20
;	t1 = -6
;	t2 = -10
;	SCL = -2
;	TYPE = 18
;	ID = 16
;	OZ = 14
;	OY = 10
;	OX = 6
;	Obj = 4
; Line 95
	mov	ax,WORD PTR [bp+6]	;OX
	mov	dx,WORD PTR [bp+8]
	sub	ax,WORD PTR _ViewX
	sbb	dx,WORD PTR _ViewX+2
	mov	WORD PTR [bp-14],ax	;dx
	mov	WORD PTR [bp-12],dx
; Line 96
	mov	ax,WORD PTR [bp+10]	;OY
	mov	dx,WORD PTR [bp+12]
	add	ax,WORD PTR _ViewY
	adc	dx,WORD PTR _ViewY+2
	sub	ax,0
	sbb	dx,16
	mov	WORD PTR [bp-18],ax	;dy
	mov	WORD PTR [bp-16],dx
; Line 97
	mov	ax,WORD PTR [bp+14]	;OZ
	sub	ax,WORD PTR _ViewZ
	mov	WORD PTR [bp-20],ax	;dz
; Line 99
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,16382
	jle	$I1290
$L20029:
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 102
$I1290:
; Line 103
	push	WORD PTR [bp-16]
	push	WORD PTR [bp-18]	;dy
	call	_labs
	add	sp,4
	or	dx,dx
	jl	$I1291
	jg	$L20029
	cmp	ax,16383
	ja	$L20029
; Line 104
$I1291:
; Line 105
	push	WORD PTR [bp-12]
	push	WORD PTR [bp-14]	;dx
	call	_labs
	add	sp,4
	or	dx,dx
	jl	$I1292
	jg	$L20029
	cmp	ax,16383
	ja	$L20029
; Line 108
$I1292:
	mov	ax,WORD PTR [bp+18]	;TYPE
	cmp	ax,90
	je	$SC1299
	ja	$SC1299
	cmp	al,50
	je	$SC1300
	jg	$L20003
	sub	al,30
	je	$SC1297
	sub	al,10
	jne	$SC1299
; Line 109
$SC1297:
; Line 110
	mov	WORD PTR [bp-2],40	;SCL
; Line 111
	jmp	SHORT $SB1294
; Line 118
	nop	
$SC1300:
; Line 119
	mov	WORD PTR [bp-2],30	;SCL
; Line 120
	jmp	SHORT $SB1294
; Line 131
	nop	
$L20003:
	sub	al,55
	jl	$SC1299
	dec	al
	jle	$SC1300
	sub	al,4
	je	$SC1297
$SC1299:
; Line 116
	mov	WORD PTR [bp-2],4	;SCL
; Line 117
$SB1294:
; Line 135
	push	WORD PTR [bp+18]	;TYPE
	push	WORD PTR [bp-2]	;SCL
	push	WORD PTR [bp+16]	;ID
	push	WORD PTR [bp-18]	;dy
	push	WORD PTR [bp-20]	;dz
	push	WORD PTR [bp-14]	;dx
	push	WORD PTR [bp+4]	;Obj
	call	_Stack3DObject
; Line 137
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Do3dObject	ENDP
; Line 142
	PUBLIC	_Boats3D
_Boats3D	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	si
;	i = -6
;	pic = -8
;	tempplane = -4
; Line 148
	mov	ax,WORD PTR _LASTPLANE
	mov	WORD PTR [bp-6],ax	;i
	jmp	SHORT $F1311
$FC1312:
; Line 149
	mov	ax,WORD PTR _whichourcarr
	cmp	WORD PTR [bp-6],ax	;i
	je	$I1317
; Line 150
	mov	ax,40
	imul	WORD PTR [bp-6]	;i
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],2
	je	$I1317
; Line 151
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	si,bx
	call	_lproject
	add	sp,10
; Line 152
	cmp	WORD PTR _sz,0
	jge	$I1317
; Line 153
	push	WORD PTR _ps[si+22]
	call	_GetPicType
	add	sp,2
	mov	WORD PTR [bp-8],ax	;pic
; Line 154
	mov	ax,90
	push	ax
	push	WORD PTR [bp-6]	;i
	push	WORD PTR _ps[si+6]
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	push	WORD PTR _ps[si+10]
	push	WORD PTR _ps[si+8]
	push	WORD PTR [bp-8]	;pic
	call	_Do3dObject
	add	sp,16
; Line 155
; Line 157
$I1317:
; Line 158
	inc	WORD PTR [bp-6]	;i
$F1311:
	cmp	WORD PTR [bp-6],70	;i
	jl	$FC1312
; Line 159
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Boats3D	ENDP
; Line 162
	PUBLIC	_Shift3X3
_Shift3X3	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
;	SHFT = 6
;	M = 4
; Line 164
	mov	WORD PTR [bp-2],0	;i
$FC1324:
; Line 165
; Line 166
	mov	cl,BYTE PTR [bp+6]	;SHFT
	mov	bx,WORD PTR [bp+4]	;M
	sar	WORD PTR [bx],cl
; Line 167
	add	WORD PTR [bp+4],2	;M
; Line 168
	inc	WORD PTR [bp-2]	;i
	cmp	WORD PTR [bp-2],9	;i
	jl	$FC1324
; Line 169
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Shift3X3	ENDP
; Line 174
	PUBLIC	_DrawRegBoat
_DrawRegBoat	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,122
	call	__aNchkstk
;	psi = -104
;	r = -2
;	Anim = -102
;	M = -122
;	SHFT = 14
;	ID = 12
;	Z = 10
;	Y = 8
;	X = 6
;	NUM = 4
; Line 182
	mov	ax,OFFSET _O
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+12]	;ID
	mov	bx,ax
	add	bx,OFFSET _ps
	mov	WORD PTR [bp-104],bx	;psi
	push	WORD PTR [bx+20]
	mov	ax,WORD PTR [bx+18]
	neg	ax
	push	ax
	push	WORD PTR [bx+16]
	call	_MakeMatHPR
	add	sp,8
; Line 183
	call	_InvertMatrix
; Line 185
	cmp	WORD PTR [bp+14],0	;SHFT
	je	$I1340
; Line 186
	push	WORD PTR [bp+14]	;SHFT
	mov	ax,OFFSET _O
	push	ax
	call	_Shift3X3
	add	sp,4
; Line 188
; Line 190
$I1340:
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:_PlaneAnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR [bp+10]	;Z
	push	WORD PTR [bp+8]	;Y
	push	WORD PTR [bp+6]	;X
	push	WORD PTR [bp+4]	;NUM
	call	_NDraw3DObject
; Line 191
	mov	sp,bp
	pop	bp
	ret	

_DrawRegBoat	ENDP
; Line 197
	PUBLIC	_Planes3D
_Planes3D	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	si
;	i = -2
;	pic = -8
;	tempmissile = -6
; Line 204
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1347
	nop	
$I1352:
	cmp	WORD PTR _sz,-64
	jle	$I1355
; Line 212
	cmp	WORD PTR _sx,-1
	je	$I1355
	mov	ax,228
	push	ax
	push	WORD PTR _sy
	push	WORD PTR _sx
	push	WORD PTR _Rp3D
	call	FAR PTR _DrawDot
	add	sp,8
; Line 214
$I1355:
; Line 215
; Line 216
; Line 217
	inc	WORD PTR [bp-2]	;i
$F1347:
	mov	ax,WORD PTR _NPLANES
	cmp	WORD PTR [bp-2],ax	;i
	jl	$JCC559
	jmp	$FB1349
$JCC559:
; Line 205
	mov	ax,40
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	test	BYTE PTR _ps[bx+24],2
	je	$I1355
	cmp	WORD PTR _DOINVISIBLE,0
	jne	$I1355
	mov	ax,46
	imul	WORD PTR [bp-2]	;i
	mov	si,ax
	test	BYTE PTR _bv[si+21],8
	jne	$I1355
; Line 206
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	si,bx
	call	_lproject
	add	sp,10
; Line 207
	cmp	WORD PTR _sz,0
	jge	$I1355
; Line 208
	cmp	WORD PTR _sz,-32
	jg	$JCC641
	jmp	$I1352
$JCC641:
; Line 209
	push	WORD PTR _ps[si+22]
	call	_GetPicType
	add	sp,2
	mov	WORD PTR [bp-8],ax	;pic
; Line 210
	mov	ax,40
	push	ax
	push	WORD PTR [bp-2]	;i
	push	WORD PTR _ps[si+6]
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	push	WORD PTR _ps[si+10]
	push	WORD PTR _ps[si+8]
	push	WORD PTR [bp-8]	;pic
	call	_Do3dObject
	add	sp,16
; Line 211
	jmp	$I1355
$FB1349:
; Line 221
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1356
	nop	
$I1364:
; Line 230
	cmp	WORD PTR _sx,-1
	je	$I1366
	cmp	WORD PTR [bp-2],20	;i
	jl	$L20004
	mov	ax,92
	jmp	SHORT $L20005
$L20004:
	mov	ax,224
$L20005:
	push	ax
	push	WORD PTR _sy
	push	WORD PTR _sx
	push	WORD PTR _Rp3D
	call	FAR PTR _DrawDot
	add	sp,8
; Line 231
$I1366:
; Line 232
; Line 233
; Line 234
; Line 235
	inc	WORD PTR [bp-2]	;i
$F1356:
	cmp	WORD PTR [bp-2],28	;i
	jl	$JCC755
	jmp	$FB1358
$JCC755:
; Line 222
	mov	ax,44
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	cmp	WORD PTR _ss[bx+26],0
	je	$I1366
; Line 223
	cmp	WORD PTR [bp-2],20	;i
	jl	$I1362
	cmp	WORD PTR _ss[bx+36],1
	jne	$I1366
	cmp	WORD PTR _ss[bx+34],70
	jne	$I1366
	push	WORD PTR _ss[bx+32]
	call	_AnimIsRunning
	add	sp,2
	or	ax,ax
	jne	$I1366
$I1362:
; Line 224
	mov	ax,44
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	push	WORD PTR _ss[bx+16]
	push	WORD PTR _ss[bx+6]
	push	WORD PTR _ss[bx+4]
	push	WORD PTR _ss[bx+2]
	push	WORD PTR _ss[bx]
	mov	si,ax
	call	_lproject
	add	sp,10
; Line 225
	cmp	WORD PTR _sz,0
	jge	$I1366
; Line 226
	cmp	WORD PTR _sz,-32
	jg	$JCC857
	jmp	$I1364
$JCC857:
; Line 227
	push	WORD PTR _ss[si+28]
	call	_GetMissilePtr
	add	sp,2
	mov	WORD PTR [bp-6],ax	;tempmissile
	mov	WORD PTR [bp-4],dx
; Line 228
	mov	ax,70
	push	ax
	push	WORD PTR [bp-2]	;i
	push	WORD PTR _ss[si+16]
	push	WORD PTR _ss[si+6]
	push	WORD PTR _ss[si+4]
	push	WORD PTR _ss[si+2]
	push	WORD PTR _ss[si]
	les	bx,DWORD PTR [bp-6]	;tempmissile
	push	WORD PTR es:[bx+30]
	call	_Do3dObject
	add	sp,16
; Line 229
	jmp	$I1366
	nop	
$FB1358:
; Line 238
	cmp	WORD PTR _chuteZ,0
	jle	$I1367
; Line 239
	mov	ax,50
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR _chuteZ
	mov	ax,WORD PTR _chuteY
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
	mov	ax,WORD PTR _chuteX
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
	mov	ax,33
	push	ax
	call	_Do3dObject
	add	sp,16
; Line 240
; Line 242
$I1367:
	mov	WORD PTR [bp-2],0	;i
$FC1369:
; Line 243
	mov	cl,3
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,cl
	cmp	WORD PTR _paratroopers[bx+4],0
	jle	$L20035
; Line 244
	mov	ax,50
	push	ax
	mov	ax,-999
	push	ax
	push	WORD PTR _paratroopers[bx+4]
	mov	ax,WORD PTR _paratroopers[bx+2]
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
	mov	ax,WORD PTR _paratroopers[bx]
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
	mov	ax,33
	push	ax
	call	_Do3dObject
	add	sp,16
; Line 245
; Line 246
$L20035:
	inc	WORD PTR [bp-2]	;i
	cmp	WORD PTR [bp-2],20	;i
	jl	$FC1369
; Line 248
	mov	WORD PTR [bp-2],0	;i
	jmp	$F1372
$I1378:
; Line 256
	mov	ax,56
	push	ax
	mov	ax,-999
	push	ax
	mov	bx,WORD PTR [bp-2]	;i
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	push	WORD PTR _ds[bx+4]
	mov	ax,WORD PTR _ds[bx+2]
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
	mov	ax,WORD PTR _ds[bx]
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
	mov	ax,37
$L20036:
	push	ax
	call	_Do3dObject
	add	sp,16
; Line 257
; Line 258
	jmp	SHORT $I1381
	nop	
$I1377:
; Line 259
	cmp	WORD PTR _sx,-1
	je	$I1381
	mov	bx,WORD PTR [bp-2]	;i
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	cmp	WORD PTR _ds[bx+6],1
	jne	$L20006
	mov	ax,93
	jmp	SHORT $L20007
$L20006:
	mov	ax,225
$L20007:
	push	ax
	push	WORD PTR _sy
	push	WORD PTR _sx
	push	WORD PTR _Rp3D
	call	FAR PTR _DrawDot
	add	sp,8
; Line 260
$I1381:
; Line 261
; Line 262
; Line 263
	inc	WORD PTR [bp-2]	;i
$F1372:
	mov	ax,WORD PTR _NDECOY
	cmp	WORD PTR [bp-2],ax	;i
	jl	$JCC1277
	jmp	$FB1374
$JCC1277:
; Line 249
	mov	bx,WORD PTR [bp-2]	;i
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	cmp	WORD PTR _ds[bx+8],0
	je	$I1381
; Line 250
	push	WORD PTR _ds[bx+4]
	mov	ax,WORD PTR _ds[bx+2]
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
	mov	ax,WORD PTR _ds[bx]
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
	mov	si,bx
	call	_lproject
	add	sp,10
; Line 251
	cmp	WORD PTR _sz,0
	jge	$I1381
; Line 252
	cmp	WORD PTR _sz,-32
	jg	$JCC1382
	jmp	$I1377
$JCC1382:
; Line 253
	cmp	WORD PTR _ds[si+6],1
	je	$JCC1392
	jmp	$I1378
$JCC1392:
; Line 254
	mov	ax,55
	push	ax
	mov	ax,-999
	push	ax
	push	WORD PTR _ds[si+4]
	mov	ax,WORD PTR _ds[si+2]
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
	mov	ax,WORD PTR _ds[si]
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
	mov	ax,38
	jmp	$L20036
	nop	
$FB1374:
; Line 267
	test	BYTE PTR _View,128
	je	$I1382
	cmp	WORD PTR _Alt,0
	jne	$I1383
	cmp	WORD PTR _ejected,0
	jne	$I1382
$I1383:
; Line 268
	mov	ax,30
	push	ax
	push	WORD PTR _OurHead
	mov	ax,WORD PTR _Alt
	inc	ax
	inc	ax
	push	ax
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	ax
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	mov	ax,14
	push	ax
	call	_Do3DObject
	add	sp,16
; Line 269
; Line 271
$I1382:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Planes3D	ENDP
; Line 275
	PUBLIC	_DrawShadow
_DrawShadow	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	SHFT = 14
;	Head = 12
;	Z = 10
;	Y = 8
;	X = 6
;	NUM = 4
; Line 276
	mov	ax,OFFSET _O
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	push	WORD PTR [bp+12]	;Head
	call	_MakeMatHPR
	mov	sp,bp
; Line 277
	call	_InvertMatrix
; Line 278
	cmp	WORD PTR [bp+14],0	;SHFT
	je	$I1393
; Line 279
	push	WORD PTR [bp+14]	;SHFT
	mov	ax,OFFSET _O
	push	ax
	call	_Shift3X3
	mov	sp,bp
; Line 280
$I1393:
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR [bp+10]	;Z
	push	WORD PTR [bp+8]	;Y
	push	WORD PTR [bp+6]	;X
	push	WORD PTR [bp+4]	;NUM
	call	_NDraw3DObject
; Line 281
	mov	sp,bp
	pop	bp
	ret	

_DrawShadow	ENDP
; Line 285
	PUBLIC	_DrawChute
_DrawChute	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	SHFT = 12
;	Z = 10
;	Y = 8
;	X = 6
;	NUM = 4
; Line 286
	mov	ax,OFFSET _O
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	push	cx
	call	_MakeMatHPR
	mov	sp,bp
; Line 287
	call	_InvertMatrix
; Line 288
	cmp	WORD PTR [bp+12],0	;SHFT
	je	$I1401
; Line 289
	push	WORD PTR [bp+12]	;SHFT
	mov	ax,OFFSET _O
	push	ax
	call	_Shift3X3
	mov	sp,bp
; Line 290
$I1401:
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	mov	ax,WORD PTR [bp+10]	;Z
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	mov	ax,WORD PTR [bp+8]	;Y
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	mov	ax,WORD PTR [bp+6]	;X
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	mov	ax,33
	push	ax
	call	_NDraw3DObject
; Line 291
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DrawChute	ENDP
; Line 295
	PUBLIC	_DrawDecoy
_DrawDecoy	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	SHFT = 12
;	Z = 10
;	Y = 8
;	X = 6
;	NUM = 4
; Line 296
	mov	ax,OFFSET _O
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	push	cx
	call	_MakeMatHPR
	mov	sp,bp
; Line 297
	call	_InvertMatrix
; Line 298
	cmp	WORD PTR [bp+12],0	;SHFT
	je	$I1409
; Line 299
	push	WORD PTR [bp+12]	;SHFT
	mov	ax,OFFSET _O
	push	ax
	call	_Shift3X3
	mov	sp,bp
; Line 300
$I1409:
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	mov	ax,WORD PTR [bp+10]	;Z
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	mov	ax,WORD PTR [bp+8]	;Y
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	mov	ax,WORD PTR [bp+6]	;X
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	push	WORD PTR [bp+4]	;NUM
	call	_NDraw3DObject
; Line 301
	mov	sp,bp
	pop	bp
	ret	

_DrawDecoy	ENDP
; Line 307
	PUBLIC	_DrawMissile
_DrawMissile	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	ssi = -2
;	SHFT = 14
;	ID = 12
;	Z = 10
;	Y = 8
;	X = 6
;	NUM = 4
; Line 310
	mov	ax,OFFSET _O
	push	ax
	mov	ax,44
	imul	WORD PTR [bp+12]	;ID
	mov	bx,ax
	push	WORD PTR _ss[bx+24]
	mov	ax,WORD PTR _ss[bx+22]
	neg	ax
	push	ax
	push	WORD PTR _ss[bx+20]
	mov	si,bx
	call	_MakeMatHPR
	add	sp,8
; Line 311
	call	_InvertMatrix
; Line 313
	add	si,OFFSET _ss
	mov	WORD PTR [bp-2],si	;ssi
; Line 315
	cmp	WORD PTR [bp+14],0	;SHFT
	je	$I1419
; Line 316
	push	WORD PTR [bp+14]	;SHFT
	mov	ax,OFFSET _O
	push	ax
	call	_Shift3X3
	add	sp,4
; Line 318
$I1419:
	mov	bx,WORD PTR [bp-2]	;ssi
	cmp	WORD PTR [bx+36],1
	jne	$I1420
	cmp	WORD PTR [bx+34],70
	jne	$I1420
; Line 319
	mov	ax,WORD PTR [bx+30]
	sub	ax,15
	je	$SC1427
	sub	ax,3
	je	$SC1435
; Line 320
$SC1425:
; Line 321
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR [bp+10]	;Z
	push	WORD PTR [bp+8]	;Y
	push	WORD PTR [bp+6]	;X
	mov	ax,26
$L20040:
	push	ax
	call	_NDraw3DObject
	add	sp,12
; Line 333
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 323
$SC1435:
; Line 339
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR [bp+10]	;Z
	push	WORD PTR [bp+8]	;Y
	push	WORD PTR [bp+6]	;X
	mov	ax,25
	jmp	SHORT $L20040
; Line 326
$SC1427:
; Line 327
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR [bp+10]	;Z
	push	WORD PTR [bp+8]	;Y
	push	WORD PTR [bp+6]	;X
	mov	ax,27
	jmp	SHORT $L20040
; Line 329
$I1420:
; Line 334
	mov	ax,WORD PTR [bx+30]
	sub	ax,15
	je	$SC1427
	sub	ax,3
	je	$SC1435
	dec	ax
	dec	ax
	je	$SC1425
; Line 345
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR [bp+10]	;Z
	push	WORD PTR [bp+8]	;Y
	push	WORD PTR [bp+6]	;X
	mov	ax,29
	jmp	SHORT $L20040
	nop	

_DrawMissile	ENDP
; Line 388
	PUBLIC	_Init3DMissiles
_Init3DMissiles	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	i = -2
; Line 391
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1445
; Line 397
	nop	
$SC1452:
; Line 398
	mov	ax,24
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	mov	WORD PTR _CoolObj[bx+24],25
; Line 410
$FC1446:
	inc	WORD PTR [bp-2]	;i
$F1445:
	cmp	WORD PTR [bp-2],12	;i
	jge	$FB1447
; Line 394
	mov	ax,24
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	sub	ax,ax
	mov	si,WORD PTR [bp-2]	;i
	shl	si,1
	mov	WORD PTR _MissileAnimVals[si+2],ax
	mov	WORD PTR _CoolObj[bx+26],ax
	mov	WORD PTR _CoolObj[bx+28],ax
; Line 395
	mov	WORD PTR _CoolObj[bx+30],ax
; Line 396
	mov	ax,WORD PTR _F14_STATION[si]
	sub	ax,15
	je	$SC1454
	dec	ax
	dec	ax
	je	$SC1455
	dec	ax
	je	$SC1452
	dec	ax
	dec	ax
	jne	$FC1446
; Line 401
	mov	ax,24
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	mov	WORD PTR _CoolObj[bx+24],26
; Line 402
	jmp	SHORT $FC1446
; Line 403
$SC1454:
; Line 404
	mov	ax,24
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	mov	WORD PTR _CoolObj[bx+24],27
; Line 405
	jmp	SHORT $FC1446
; Line 406
$SC1455:
; Line 407
	mov	ax,24
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	mov	WORD PTR _CoolObj[bx+24],28
; Line 408
	jmp	SHORT $FC1446
$FB1447:
; Line 411
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Init3DMissiles	ENDP
; Line 415
	PUBLIC	_AnimIsRunning
_AnimIsRunning	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	SlotNMount = 4
; Line 416
	mov	ax,24
	mul	WORD PTR [bp+4]	;SlotNMount
	mov	bx,ax
	cmp	WORD PTR _CoolObj[bx+24],-1
	jne	$I1458
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 417
	nop	
$I1458:
	mov	ax,1
; Line 418
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AnimIsRunning	ENDP
; Line 422
	PUBLIC	_CoolF14MissileAnims
_CoolF14MissileAnims	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	i = -2
; Line 425
	mov	WORD PTR [bp-2],1	;i
	jmp	SHORT $F1462
; Line 431
; Line 432
	nop	
$SC1470:
; Line 433
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,1
	mov	WORD PTR _MissileAnimVals[bx],1
; Line 434
	mov	ax,24
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
$L20050:
	mov	ax,WORD PTR _Fticks
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	sub	WORD PTR _CoolObj[bx+6],ax
	cmp	WORD PTR _CoolObj[bx+6],-1000
$L20049:
	jge	$SB1467
; Line 435
	mov	WORD PTR _CoolObj[bx],-1
; Line 436
$SB1467:
; Line 466
; Line 467
	inc	WORD PTR [bp-2]	;i
$F1462:
	cmp	WORD PTR [bp-2],13	;i
	jl	$JCC2271
	jmp	$FB1464
$JCC2271:
; Line 426
; Line 427
	mov	ax,24
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	cmp	WORD PTR _CoolObj[bx],-1
	je	$SB1467
	mov	si,WORD PTR [bp-2]	;i
	shl	si,1
	cmp	WORD PTR _F14_STATION[si-2],0
	jne	$SB1467
; Line 428
; Line 429
	mov	WORD PTR _MissileAnimVals[si],0
; Line 430
	mov	ax,WORD PTR _CoolObj[bx]
	sub	ax,25
	je	$SC1470
	dec	ax
	dec	ax
	je	$SC1474
	dec	ax
	je	$SC1472
; Line 454
	mov	ax,24
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	cmp	WORD PTR _CoolObj[bx+4],-20
$L20051:
	jge	$I1475
; Line 455
; Line 456
	mov	si,WORD PTR [bp-2]	;i
	shl	si,1
	mov	WORD PTR _MissileAnimVals[si],1
	jmp	SHORT $L20050
; Line 437
	nop	
$SC1472:
; Line 438
	mov	ax,24
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	mov	ax,WORD PTR _Fticks
	sub	WORD PTR _CoolObj[bx+4],ax
	cmp	WORD PTR _CoolObj[bx+4],-400
	jmp	SHORT $L20049
; Line 441
	nop	
$SC1474:
; Line 442
	mov	ax,24
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	cmp	WORD PTR _CoolObj[bx+4],-35
	jmp	SHORT $L20051
; Line 453
	nop	
$I1475:
; Line 449
; Line 450
	mov	ax,24
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	mov	ax,WORD PTR _Fticks
	sub	WORD PTR _CoolObj[bx+4],ax
; Line 451
; Line 452
	jmp	$SB1467
$FB1464:
; Line 468
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_CoolF14MissileAnims	ENDP
; Line 472
	PUBLIC	_DrawCoolF14
_DrawCoolF14	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,34
	call	__aNchkstk
	push	di
	push	si
;	M = -30
;	V2 = -6
;	bgsscl = -32
;	j = -10
;	dst = -12
;	mydetail = -8
;	SHFT = 10
;	Z = 8
;	Y = 6
;	X = 4
; Line 480
	mov	WORD PTR [bp-32],1	;bgsscl
; Line 484
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR _OurRoll
	mov	cx,-546
	sub	cx,WORD PTR _OurPitch
	push	cx
	push	WORD PTR _OurHead
	call	_MakeMatHPR
	add	sp,8
; Line 485
	call	_InvertMatrix
; Line 487
	lea	ax,WORD PTR [bp-30]	;M
	push	ax
	mov	cx,OFFSET _O
	push	cx
	call	_Trans3X3
	add	sp,4
; Line 488
	mov	ax,WORD PTR [bp+4]	;X
	shl	ax,1
	shl	ax,1
	neg	ax
	mov	WORD PTR [bp-6],ax	;V2
; Line 489
	mov	ax,WORD PTR [bp+6]	;Y
	shl	ax,1
	shl	ax,1
	neg	ax
	mov	WORD PTR [bp-4],ax
; Line 490
	mov	ax,WORD PTR [bp+8]	;Z
	shl	ax,1
	shl	ax,1
	neg	ax
	mov	WORD PTR [bp-2],ax
; Line 491
	lea	ax,WORD PTR [bp-30]	;M
	push	ax
	lea	ax,WORD PTR [bp-6]	;V2
	push	ax
	call	_Rotate
	add	sp,4
; Line 493
	mov	ax,WORD PTR [bp+8]	;Z
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,3
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	cx,ax
	mov	ax,WORD PTR [bp+4]	;X
	mov	bx,cx
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,3
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	add	bx,ax
	mov	ax,WORD PTR [bp+6]	;Y
	cwd	
	xor	ax,dx
	sub	ax,dx
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	add	bx,ax
	mov	WORD PTR [bp-12],bx	;dst
; Line 495
	mov	WORD PTR [bp-8],2	;mydetail
; Line 496
	cmp	bx,400
	jle	$I1496
; Line 497
	mov	WORD PTR [bp-8],1	;mydetail
; Line 498
$I1496:
	cmp	bx,800
	jle	$I1497
; Line 499
	dec	WORD PTR [bp-8]	;mydetail
; Line 501
$I1497:
	cmp	WORD PTR [bp+10],0	;SHFT
	je	$I1498
; Line 502
; Line 503
	mov	WORD PTR [bp-8],0	;mydetail
; Line 504
	push	WORD PTR [bp+10]	;SHFT
	mov	ax,OFFSET _O
	push	ax
	call	_Shift3X3
	add	sp,4
; Line 505
; Line 506
$I1498:
	cmp	WORD PTR [bp-8],0	;mydetail
	jge	$I1499
	mov	WORD PTR [bp-8],0	;mydetail
; Line 507
$I1499:
	mov	ax,WORD PTR [bp-8]	;mydetail
	cmp	WORD PTR _PLANEDETAIL,ax
	jge	$I1500
; Line 508
	mov	ax,WORD PTR _PLANEDETAIL
	mov	WORD PTR [bp-8],ax	;mydetail
; Line 511
$I1500:
	or	ax,ax
	jne	$I1501
; Line 512
; Line 513
	test	BYTE PTR _Status,1
	je	$I1502
; Line 514
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	mov	ax,WORD PTR [bp+8]	;Z
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	ax,WORD PTR [bp+6]	;Y
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	ax,WORD PTR [bp+4]	;X
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	ax,22
	jmp	SHORT $L20052
$I1502:
; Line 516
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	mov	ax,WORD PTR [bp+8]	;Z
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	ax,WORD PTR [bp+6]	;Y
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	ax,WORD PTR [bp+4]	;X
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	ax,21
$L20052:
	push	ax
	mov	ax,OFFSET DGROUP:_CoolObj
	push	ax
	call	_DrawSuper3DObject
	add	sp,14
; Line 517
; Line 518
$I1501:
	cmp	WORD PTR [bp-8],1	;mydetail
	je	$JCC2753
	jmp	$I1505
$JCC2753:
; Line 519
; Line 520
	cmp	WORD PTR [bp-6],0	;V2
	jg	$JCC2762
	jmp	$I1506
$JCC2762:
; Line 521
; Line 522
	mov	ax,WORD PTR _WingRot
	mov	WORD PTR _AnimVals+28,ax
; Line 523
	mov	ax,WORD PTR _slposy
	sub	ax,WORD PTR _slposx
	mov	cx,182
	imul	cx
	mov	WORD PTR _AnimVals+60,ax
; Line 524
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	dx,OFFSET _O
	push	dx
	mov	ax,WORD PTR [bp+8]	;Z
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	dx,ax
	mov	ax,WORD PTR [bp+6]	;Y
	mov	bx,dx
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	dx,ax
	mov	ax,WORD PTR [bp+4]	;X
	mov	si,dx
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	dx,18
	push	dx
	mov	dx,OFFSET DGROUP:_CoolObj
	push	dx
	mov	di,ax
	mov	WORD PTR [bp-34],bx
	call	_DrawSuper3DObject
	add	sp,14
; Line 525
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	WORD PTR [bp-34]
	push	si
	push	di
	mov	dx,19
	push	dx
	call	_NDraw3DObject
	add	sp,12
; Line 526
	mov	ax,WORD PTR _WingRot
	neg	ax
	mov	WORD PTR _AnimVals+28,ax
; Line 527
	mov	ax,WORD PTR _slposy
	add	ax,WORD PTR _slposx
	mov	cx,182
	imul	cx
	mov	WORD PTR _AnimVals+60,ax
; Line 528
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR [bp-34]
	push	si
	push	di
	mov	ax,20
	jmp	$L20053
	nop	
$I1506:
; Line 531
; Line 532
	mov	ax,WORD PTR _WingRot
	neg	ax
	mov	WORD PTR _AnimVals+28,ax
; Line 533
	mov	ax,WORD PTR _slposy
	add	ax,WORD PTR _slposx
	mov	cx,182
	imul	cx
	mov	WORD PTR _AnimVals+60,ax
; Line 534
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	dx,OFFSET _O
	push	dx
	mov	ax,WORD PTR [bp+8]	;Z
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	dx,ax
	mov	ax,WORD PTR [bp+6]	;Y
	mov	bx,dx
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	dx,ax
	mov	ax,WORD PTR [bp+4]	;X
	mov	si,dx
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	dx,20
	push	dx
	mov	dx,OFFSET DGROUP:_CoolObj
	push	dx
	mov	di,ax
	mov	WORD PTR [bp-34],bx
	call	_DrawSuper3DObject
	add	sp,14
; Line 535
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	WORD PTR [bp-34]
	push	si
	push	di
	mov	dx,19
	push	dx
	call	_NDraw3DObject
	add	sp,12
; Line 536
	mov	ax,WORD PTR _WingRot
	mov	WORD PTR _AnimVals+28,ax
; Line 537
	mov	ax,WORD PTR _slposy
	sub	ax,WORD PTR _slposx
	mov	cx,182
	imul	cx
	mov	WORD PTR _AnimVals+60,ax
; Line 538
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR [bp-34]
	push	si
	push	di
	mov	ax,18
$L20053:
	push	ax
	mov	ax,OFFSET DGROUP:_CoolObj
	push	ax
	call	_DrawSuper3DObject
	add	sp,14
; Line 539
; Line 540
; Line 541
$I1505:
	cmp	WORD PTR [bp-8],2	;mydetail
	je	$JCC3064
	jmp	$I1508
$JCC3064:
; Line 542
; Line 543
	cmp	WORD PTR [bp-6],0	;V2
	jg	$JCC3073
	jmp	$I1509
$JCC3073:
; Line 544
; Line 546
	mov	ax,WORD PTR _WingRot
	mov	WORD PTR _AnimVals+28,ax
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,3
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	WORD PTR _AnimVals+58,ax
; Line 547
	mov	ax,WORD PTR _slposy
	sub	ax,WORD PTR _slposx
	mov	cx,182
	imul	cx
	mov	WORD PTR _AnimVals+60,ax
; Line 548
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	dx,OFFSET _O
	push	dx
	mov	ax,WORD PTR [bp+8]	;Z
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	dx,ax
	mov	ax,WORD PTR [bp+6]	;Y
	mov	bx,dx
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	dx,ax
	mov	ax,WORD PTR [bp+4]	;X
	mov	si,dx
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	dx,14
	push	dx
	mov	dx,OFFSET DGROUP:_CoolObj
	push	dx
	mov	di,ax
	mov	WORD PTR [bp-34],bx
	call	_DrawSuper3DObject
	add	sp,14
; Line 549
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	WORD PTR [bp-34]
	push	si
	push	di
	mov	dx,15
	push	dx
	mov	dx,OFFSET DGROUP:_CoolObj
	push	dx
	call	_DrawSuper3DObject
	add	sp,14
; Line 550
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	WORD PTR [bp-34]
	push	si
	push	di
	mov	dx,16
	push	dx
	mov	dx,OFFSET DGROUP:_CoolObj
	push	dx
	call	_DrawSuper3DObject
	add	sp,14
; Line 551
	mov	ax,WORD PTR _WingRot
	neg	ax
	mov	WORD PTR _AnimVals+28,ax
; Line 552
	mov	ax,WORD PTR _WingRot
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,3
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	neg	ax
	mov	WORD PTR _AnimVals+58,ax
; Line 553
	mov	ax,WORD PTR _slposy
	add	ax,WORD PTR _slposx
	mov	cx,182
	imul	cx
	mov	WORD PTR _AnimVals+60,ax
; Line 554
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR [bp-34]
	push	si
	push	di
	mov	ax,17
	jmp	$L20054
$I1509:
; Line 557
; Line 558
	mov	ax,WORD PTR _WingRot
	neg	ax
	mov	WORD PTR _AnimVals+28,ax
; Line 559
	mov	ax,WORD PTR _WingRot
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,3
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	neg	ax
	mov	WORD PTR _AnimVals+58,ax
; Line 560
	mov	ax,WORD PTR _slposy
	add	ax,WORD PTR _slposx
	mov	cx,182
	imul	cx
	mov	WORD PTR _AnimVals+60,ax
; Line 561
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	dx,OFFSET _O
	push	dx
	mov	ax,WORD PTR [bp+8]	;Z
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	dx,ax
	mov	ax,WORD PTR [bp+6]	;Y
	mov	bx,dx
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	dx,ax
	mov	ax,WORD PTR [bp+4]	;X
	mov	si,dx
	imul	WORD PTR [bp-32]	;bgsscl
	push	ax
	mov	dx,17
	push	dx
	mov	dx,OFFSET DGROUP:_CoolObj
	push	dx
	mov	di,ax
	mov	WORD PTR [bp-34],bx
	call	_DrawSuper3DObject
	add	sp,14
; Line 562
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	WORD PTR [bp-34]
	push	si
	push	di
	mov	dx,16
	push	dx
	mov	dx,OFFSET DGROUP:_CoolObj
	push	dx
	call	_DrawSuper3DObject
	add	sp,14
; Line 563
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	WORD PTR [bp-34]
	push	si
	push	di
	mov	dx,15
	push	dx
	mov	dx,OFFSET DGROUP:_CoolObj
	push	dx
	call	_DrawSuper3DObject
	add	sp,14
; Line 565
	mov	ax,WORD PTR _WingRot
	mov	WORD PTR _AnimVals+28,ax
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,3
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	neg	ax
	mov	WORD PTR _AnimVals+58,ax
; Line 566
	mov	ax,WORD PTR _slposy
	sub	ax,WORD PTR _slposx
	mov	cx,182
	imul	cx
	mov	WORD PTR _AnimVals+60,ax
; Line 567
	mov	ax,OFFSET _AnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR [bp-34]
	push	si
	push	di
	mov	ax,14
$L20054:
	push	ax
	mov	ax,OFFSET DGROUP:_CoolObj
	push	ax
	call	_DrawSuper3DObject
	add	sp,14
; Line 568
; Line 569
; Line 570
$I1508:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_DrawCoolF14	ENDP
; Line 575
	PUBLIC	_HookDownAnim
_HookDownAnim	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 576
	xor	BYTE PTR _HookDown,1
; Line 577
	ret	
	nop	

_HookDownAnim	ENDP
; Line 581
	PUBLIC	_UpdateOurPlaneAnims
_UpdateOurPlaneAnims	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
;	stickx = -8
;	sticky = -10
;	t1 = -2
;	t2 = -6
;	beforeval = -4
; Line 590
	mov	cl,3
	mov	al,BYTE PTR _mS2n
	shr	al,cl
	sub	ah,ah
	sub	ax,16
	neg	ax
	mov	WORD PTR [bp-10],ax	;sticky
; Line 591
	mov	bx,300
	mov	ax,16
	mov	dl,BYTE PTR _mS1n
	shr	dl,cl
	sub	dh,dh
	sub	ax,dx
	imul	bx
	mov	cx,WORD PTR _Knots
	add	cx,200
	cwd	
	idiv	cx
	mov	WORD PTR _slposx,ax
; Line 592
	mov	ax,bx
	imul	WORD PTR [bp-10]	;sticky
	cwd	
	idiv	cx
	mov	WORD PTR _slposy,ax
; Line 595
	cmp	WORD PTR _HookDown,0
	jne	$I1520
	cmp	WORD PTR _HookRot,0
	jle	$I1520
; Line 596
	sub	WORD PTR _HookRot,364
; Line 597
; Line 599
$I1520:
	cmp	WORD PTR _HookDown,0
	je	$I1521
	cmp	WORD PTR _HookRot,8190
	jge	$I1521
; Line 600
	add	WORD PTR _HookRot,364
; Line 601
; Line 602
$I1521:
	mov	ax,WORD PTR _HookRot
	mov	WORD PTR _AnimVals+54,ax
; Line 605
	cmp	WORD PTR _Knots,275
	jge	$I1522
; Line 606
	mov	ax,-910
	jmp	SHORT $L20055
	nop	
$I1522:
; Line 608
	mov	ax,910
$L20055:
	imul	WORD PTR _Fticks
	mov	cx,60
	cwd	
	idiv	cx
	add	WORD PTR _WingRot,ax
; Line 609
	cmp	WORD PTR _WingRot,1820
	jge	$I1524
	mov	WORD PTR _WingRot,1820
; Line 610
$I1524:
	cmp	WORD PTR _WingRot,8736
	jle	$I1525
	mov	WORD PTR _WingRot,8736
; Line 627
$I1525:
	cmp	WORD PTR _LIGHTS,1
	sbb	ax,ax
	neg	ax
	mov	WORD PTR _AnimVals+18,ax
; Line 628
	mov	ax,WORD PTR _LIGHTS
	mov	WORD PTR _AnimVals+20,ax
; Line 629
	mov	ax,4
	push	ax
	call	_rnd2
	add	sp,2
	or	ax,ax
	je	$L20008
	cmp	WORD PTR _Gees,48
	jle	$L20008
	mov	WORD PTR _AnimVals+30,0
	jmp	SHORT $L20009
$L20008:
	mov	WORD PTR _AnimVals+30,1
$L20009:
; Line 633
	mov	WORD PTR _AnimVals+8,0
; Line 634
	cmp	WORD PTR _Firing,1
	sbb	ax,ax
	inc	ax
	mov	WORD PTR _AnimVals+6,ax
; Line 636
	cmp	WORD PTR _THRUST,100
	jle	$I1527
; Line 637
	mov	WORD PTR _AnimVals+26,1
; Line 638
	sub	WORD PTR _AnimVals+46,30
; Line 639
; Line 640
	jmp	SHORT $I1528
	nop	
$I1527:
; Line 641
	add	WORD PTR _AnimVals+46,30
$I1528:
; Line 643
	cmp	WORD PTR _AnimVals+46,0
	jl	$I1529
; Line 645
	sub	ax,ax
	mov	WORD PTR _AnimVals+26,ax
	mov	WORD PTR _AnimVals+46,ax
; Line 646
; Line 648
$I1529:
	cmp	WORD PTR _AnimVals+46,-182
	jge	$I1530
	mov	WORD PTR _AnimVals+46,-182
; Line 651
$I1530:
	test	BYTE PTR _Status,8
	je	$I1531
	mov	ax,WORD PTR _MinAlt
	cmp	WORD PTR _Alt,ax
	jne	$I1532
	cmp	WORD PTR _OurPitch,0
	je	$I1531
$I1532:
; Line 652
	cmp	WORD PTR _AnimVals+38,16384
	jl	$I1533
; Line 653
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,32
	push	ax
	call	_Sound
	add	sp,6
; Line 654
$I1533:
; Line 656
	mov	ax,WORD PTR _AnimVals+38
	sub	WORD PTR _AnimVals+38,910
	mov	WORD PTR [bp-4],ax	;beforeval
	cmp	ax,8192
	jle	$I1538
	cmp	WORD PTR _AnimVals+38,8192
	jg	$I1538
	jmp	SHORT $L20056
	nop	
$I1531:
; Line 660
	cmp	WORD PTR _AnimVals+38,8192
	jg	$I1537
; Line 661
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,32
	push	ax
	call	_Sound
	add	sp,6
; Line 662
$I1537:
; Line 664
	mov	ax,WORD PTR _AnimVals+38
	add	WORD PTR _AnimVals+38,910
	mov	WORD PTR [bp-4],ax	;beforeval
	cmp	ax,16384
	jge	$I1538
	cmp	WORD PTR _AnimVals+38,16384
	jl	$I1538
; Line 665
$L20056:
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,33
	push	ax
	call	_Sound
	add	sp,6
; Line 666
$I1538:
; Line 668
	cmp	WORD PTR _AnimVals+38,8192
	jge	$I1539
	mov	WORD PTR _AnimVals+38,8192
; Line 670
$I1539:
	mov	WORD PTR _AnimVals+40,1
; Line 671
	cmp	WORD PTR _AnimVals+38,16384
	jl	$I1540
; Line 672
	mov	WORD PTR _AnimVals+38,16384
; Line 673
	mov	WORD PTR _AnimVals+40,0
; Line 674
; Line 688
$I1540:
; Line 689
	mov	ax,182
	imul	WORD PTR _Fticks
	mov	cx,3
	cwd	
	idiv	cx
	mov	WORD PTR [bp-2],ax	;t1
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,2
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	sub	ax,WORD PTR [bp-2]	;t1
	neg	ax
	mov	WORD PTR [bp-6],ax	;t2
; Line 690
	test	BYTE PTR _Status,1
	jne	$I1541
; Line 691
; Line 692
	neg	WORD PTR [bp-2]	;t1
; Line 693
	neg	ax
	mov	WORD PTR [bp-6],ax	;t2
; Line 694
; Line 695
$I1541:
	mov	ax,WORD PTR _AnimVals+50
	mov	WORD PTR [bp-4],ax	;beforeval
; Line 697
	mov	ax,WORD PTR [bp-6]	;t2
	add	WORD PTR _AnimVals+50,ax
; Line 698
	mov	ax,WORD PTR [bp-2]	;t1
	add	WORD PTR _AnimVals+48,ax
	jns	$I1542
; Line 699
	mov	WORD PTR _AnimVals+48,0
; Line 700
$I1542:
	cmp	WORD PTR _AnimVals+50,0
	jge	$I1543
; Line 701
	mov	WORD PTR _AnimVals+50,0
; Line 702
$I1543:
	cmp	WORD PTR [bp-4],0	;beforeval
	jne	$I1546
	cmp	WORD PTR _AnimVals+50,0
	jg	$I1545
$I1546:
	cmp	WORD PTR [bp-4],12740	;beforeval
	jne	$I1544
	cmp	WORD PTR _AnimVals+50,12740
	jge	$I1544
$I1545:
; Line 703
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,34
	push	ax
	call	_Sound
	add	sp,6
; Line 704
$I1544:
	cmp	WORD PTR [bp-4],0	;beforeval
	jle	$I1549
	cmp	WORD PTR _AnimVals+50,0
	jle	$I1548
$I1549:
	cmp	WORD PTR [bp-4],12740	;beforeval
	jge	$I1547
	cmp	WORD PTR _AnimVals+50,12740
	jl	$I1547
$I1548:
; Line 705
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,35
	push	ax
	call	_Sound
	add	sp,6
; Line 707
$I1547:
	cmp	WORD PTR _AnimVals+48,12740
	jl	$I1550
; Line 708
; Line 709
	mov	WORD PTR _AnimVals+48,12740
; Line 710
	mov	WORD PTR _AnimVals+12,0
; Line 711
; Line 712
	jmp	SHORT $I1551
	nop	
$I1550:
; Line 713
; Line 714
	mov	WORD PTR _AnimVals+12,1
; Line 715
$I1551:
; Line 717
	cmp	WORD PTR _AnimVals+50,12740
	jl	$I1552
; Line 718
; Line 719
	mov	WORD PTR _AnimVals+50,12740
; Line 720
	mov	WORD PTR _AnimVals+14,0
; Line 721
; Line 722
	jmp	SHORT $I1553
$I1552:
; Line 723
; Line 724
	mov	WORD PTR _AnimVals+14,1
; Line 725
$I1553:
; Line 727
	cmp	WORD PTR _AnimVals+12,0
	jne	$I1555
	cmp	WORD PTR _AnimVals+14,0
	je	$I1554
$I1555:
; Line 728
	mov	WORD PTR _AnimVals+16,1
; Line 729
	jmp	SHORT $I1556
$I1554:
; Line 730
	mov	WORD PTR _AnimVals+16,0
$I1556:
; Line 732
	call	_CoolF14MissileAnims
; Line 733
	mov	sp,bp
	pop	bp
	ret	
	nop	

_UpdateOurPlaneAnims	ENDP
; Line 737
	PUBLIC	_InitOurCoolPlane
_InitOurCoolPlane	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	InAir = 4
; Line 738
	cmp	WORD PTR [bp+4],0	;InAir
	je	$I1560
; Line 742
	sub	ax,ax
	mov	WORD PTR _AnimVals+16,ax
	mov	WORD PTR _AnimVals+14,ax
	mov	WORD PTR _AnimVals+12,ax
	mov	WORD PTR _AnimVals+10,ax
; Line 744
	mov	ax,16384
	mov	WORD PTR _AnimVals+44,ax
	mov	WORD PTR _AnimVals+42,ax
; Line 745
	jmp	SHORT $I1561
	nop	
$I1560:
; Line 747
	mov	ax,1
	mov	WORD PTR _AnimVals+14,ax
	mov	WORD PTR _AnimVals+12,ax
; Line 751
	sub	ax,ax
	mov	WORD PTR _AnimVals+44,ax
	mov	WORD PTR _AnimVals+42,ax
	mov	WORD PTR _AnimVals+16,ax
	mov	WORD PTR _AnimVals+10,ax
; Line 752
$I1561:
; Line 753
	mov	WORD PTR _AnimVals+38,16384
; Line 754
	mov	WORD PTR _AnimVals+40,0
; Line 755
	mov	sp,bp
	pop	bp
	ret	
	nop	

_InitOurCoolPlane	ENDP
; Line 761
	PUBLIC	_DrawTexPlane
_DrawTexPlane	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,200
	call	__aNchkstk
	push	di
	push	si
;	psi = -178
;	r = -66
;	Anim = -166
;	M = -196
;	MedAnimVals = -64
;	V2 = -176
;	bgsscl = -198
;	planetemp = -170
;	SHFT = 14
;	ID = 12
;	Z = 10
;	Y = 8
;	X = 6
;	NUM = 4
; Line 766
	mov	WORD PTR [bp-64],0	;MedAnimVals
	sub	ax,ax
	mov	cx,62
	lea	di,WORD PTR [bp-62]
	push	ss
	pop	es
	rep	stosb
; Line 773
	mov	WORD PTR [bp-198],1	;bgsscl
; Line 775
	mov	ax,40
	imul	WORD PTR [bp+12]	;ID
	add	ax,OFFSET _ps
	mov	WORD PTR [bp-178],ax	;psi
; Line 781
	mov	bx,ax
	push	WORD PTR [bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	es,dx
	mov	bx,ax
	mov	WORD PTR [bp-170],bx	;planetemp
	mov	WORD PTR [bp-168],es
	cmp	WORD PTR es:[bx],138
	je	$I1580
	cmp	WORD PTR es:[bx],139
	je	$I1580
	cmp	WORD PTR es:[bx],140
	je	$I1580
	cmp	WORD PTR es:[bx],141
	je	$I1580
	cmp	WORD PTR es:[bx],142
	je	$I1580
	cmp	WORD PTR es:[bx],164
	je	$JCC4480
	jmp	$I1579
$JCC4480:
$I1580:
; Line 783
	mov	ax,OFFSET _O
	push	ax
	mov	bx,WORD PTR [bp-178]	;psi
	push	WORD PTR [bx+20]
	mov	cx,WORD PTR [bx+18]
	neg	cx
	push	cx
	push	WORD PTR [bx+16]
	call	_MakeMatHPR
	add	sp,8
; Line 784
	call	_InvertMatrix
; Line 786
	lea	ax,WORD PTR [bp-196]	;M
	push	ax
	mov	cx,OFFSET _O
	push	cx
	call	_Trans3X3
	add	sp,4
; Line 787
	mov	ax,WORD PTR [bp+6]	;X
	shl	ax,1
	shl	ax,1
	neg	ax
	mov	WORD PTR [bp-176],ax	;V2
; Line 788
	mov	ax,WORD PTR [bp+8]	;Y
	shl	ax,1
	shl	ax,1
	neg	ax
	mov	WORD PTR [bp-174],ax
; Line 789
	mov	ax,WORD PTR [bp+10]	;Z
	shl	ax,1
	shl	ax,1
	neg	ax
	mov	WORD PTR [bp-172],ax
; Line 790
	lea	ax,WORD PTR [bp-196]	;M
	push	ax
	lea	ax,WORD PTR [bp-176]	;V2
	push	ax
	call	_Rotate
	add	sp,4
; Line 792
	cmp	WORD PTR [bp+14],0	;SHFT
	je	$I1581
; Line 793
	push	WORD PTR [bp+14]	;SHFT
	mov	ax,OFFSET _O
	push	ax
	call	_Shift3X3
	add	sp,4
; Line 795
$I1581:
	cmp	WORD PTR _LightsOn,1
	sbb	ax,ax
	neg	ax
	mov	WORD PTR [bp-46],ax
; Line 796
	mov	ax,WORD PTR _LightsOn
	mov	WORD PTR [bp-44],ax
; Line 797
	mov	WORD PTR [bp-40],1
; Line 800
	mov	bx,WORD PTR [bp-178]	;psi
	test	BYTE PTR [bx+25],128
	je	$I1582
; Line 802
$L20059:
	mov	ax,1
	jmp	SHORT $L20057
	nop	
$I1582:
	test	BYTE PTR [bx+25],2
	je	$I1584
	mov	ax,46
	imul	WORD PTR [bp+12]	;ID
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$L20059
	cmp	WORD PTR _bv[bx+38],7
	jl	$L20059
$I1584:
; Line 810
	sub	ax,ax
$L20057:
	mov	WORD PTR [bp-52],ax
	mov	WORD PTR [bp-50],ax
; Line 811
; Line 815
	mov	bx,WORD PTR [bp-178]	;psi
	test	BYTE PTR [bx+25],128
	jne	$L20018
	cmp	WORD PTR _detected,0
	je	$L20016
	cmp	WORD PTR [bx+32],0
	jne	$L20016
	cmp	WORD PTR [bp-66],4096	;r
	jge	$L20016
$L20018:
	mov	WORD PTR [bp-38],1
	jmp	SHORT $L20017
$L20016:
	mov	WORD PTR [bp-38],0
$L20017:
; Line 817
	cmp	WORD PTR [bx+26],100
	jge	$I1587
; Line 818
	mov	WORD PTR [bp-38],0
; Line 820
$I1587:
	cmp	WORD PTR [bp-66],12288	;r
	jge	$L20019
	mov	ax,1
	jmp	SHORT $L20020
$L20019:
	sub	ax,ax
$L20020:
	mov	WORD PTR [bp-34],ax
; Line 824
	sub	ax,ax
	mov	WORD PTR [bp-22],ax
	mov	WORD PTR [bp-20],ax
	mov	WORD PTR [bp-10],ax
; Line 827
	mov	WORD PTR $S1575_MedWingRot,8736
; Line 828
	cmp	WORD PTR [bx+26],350
	jge	$I1590
; Line 829
; Line 830
	cmp	WORD PTR [bx+26],250
	jge	$I1589
; Line 831
	mov	WORD PTR $S1575_MedWingRot,8736
; Line 832
	jmp	SHORT $I1590
$I1589:
; Line 833
	mov	cx,38
	mov	ax,WORD PTR [bx+26]
	sub	ax,250
	imul	cx
	mov	cx,100
	cwd	
	idiv	cx
	add	ax,10
	mov	cx,182
	imul	cx
	mov	WORD PTR $S1575_MedWingRot,ax
$I1590:
; Line 834
; Line 853
	cmp	WORD PTR [bp-176],0	;V2
	jle	$I1591
; Line 854
	mov	ax,WORD PTR $S1575_MedWingRot
	mov	WORD PTR [bp-36],ax
; Line 855
	lea	ax,WORD PTR [bp-64]	;MedAnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	mov	ax,WORD PTR [bp+10]	;Z
	imul	WORD PTR [bp-198]	;bgsscl
	push	ax
	mov	dx,ax
	mov	ax,WORD PTR [bp+8]	;Y
	mov	bx,dx
	imul	WORD PTR [bp-198]	;bgsscl
	push	ax
	mov	dx,ax
	mov	ax,WORD PTR [bp+6]	;X
	mov	si,dx
	imul	WORD PTR [bp-198]	;bgsscl
	push	ax
	mov	dx,18
	push	dx
	mov	dx,OFFSET DGROUP:_CoolObj
	push	dx
	mov	di,ax
	mov	WORD PTR [bp-200],bx
	call	_DrawSuper3DObject
	add	sp,14
; Line 856
	lea	ax,WORD PTR [bp-64]	;MedAnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	WORD PTR [bp-200]
	push	si
	push	di
	mov	dx,19
	push	dx
	call	_NDraw3DObject
	add	sp,12
; Line 857
	mov	ax,WORD PTR $S1575_MedWingRot
	neg	ax
	mov	WORD PTR [bp-36],ax
; Line 858
	lea	ax,WORD PTR [bp-64]	;MedAnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR [bp-200]
	push	si
	push	di
	mov	ax,20
	jmp	SHORT $L20058
$I1591:
; Line 860
	mov	ax,WORD PTR $S1575_MedWingRot
	neg	ax
	mov	WORD PTR [bp-36],ax
; Line 861
	lea	ax,WORD PTR [bp-64]	;MedAnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	mov	ax,WORD PTR [bp+10]	;Z
	imul	WORD PTR [bp-198]	;bgsscl
	push	ax
	mov	dx,ax
	mov	ax,WORD PTR [bp+8]	;Y
	mov	bx,dx
	imul	WORD PTR [bp-198]	;bgsscl
	push	ax
	mov	dx,ax
	mov	ax,WORD PTR [bp+6]	;X
	mov	si,dx
	imul	WORD PTR [bp-198]	;bgsscl
	push	ax
	mov	dx,20
	push	dx
	mov	dx,OFFSET DGROUP:_CoolObj
	push	dx
	mov	di,ax
	mov	WORD PTR [bp-200],bx
	call	_DrawSuper3DObject
	add	sp,14
; Line 862
	lea	ax,WORD PTR [bp-64]	;MedAnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	WORD PTR [bp-200]
	push	si
	push	di
	mov	dx,19
	push	dx
	call	_NDraw3DObject
	add	sp,12
; Line 863
	mov	ax,WORD PTR $S1575_MedWingRot
	mov	WORD PTR [bp-36],ax
; Line 864
	lea	ax,WORD PTR [bp-64]	;MedAnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR [bp-200]
	push	si
	push	di
	mov	ax,18
$L20058:
	push	ax
	mov	ax,OFFSET DGROUP:_CoolObj
	push	ax
	call	_DrawSuper3DObject
	add	sp,14
; Line 865
; Line 866
	mov	ax,1
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 867
; Line 869
	nop	
$I1579:
	mov	bl,BYTE PTR _GFLSH
	and	bx,3
	shl	bx,1
	mov	ax,WORD PTR _pflashtbl[bx]
	mov	bx,WORD PTR _PalPtr3D
	mov	WORD PTR [bx+292],ax
; Line 870
	mov	bx,WORD PTR [bp-178]	;psi
	push	WORD PTR [bx+20]
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-66],ax	;r
; Line 872
	mov	bx,WORD PTR [bp-178]	;psi
	cmp	WORD PTR [bx+32],0
	jne	$L20023
	cmp	WORD PTR _LightsOn,0
	jne	$L20021
$L20023:
	mov	WORD PTR _PlaneAnimVals+24,1
	jmp	SHORT $L20022
$L20021:
	mov	WORD PTR _PlaneAnimVals+24,0
$L20022:
	mov	ax,WORD PTR _PlaneAnimVals+24
	mov	WORD PTR _PlaneAnimVals+18,ax
; Line 873
	mov	ax,WORD PTR _LightsOn
	mov	WORD PTR _PlaneAnimVals+20,ax
; Line 875
	test	BYTE PTR [bx+25],128
	je	$I1593
; Line 876
$L20060:
	mov	WORD PTR _PlaneAnimVals+12,1
; Line 877
; Line 878
	jmp	SHORT $I1597
$I1593:
	test	BYTE PTR [bx+25],2
	je	$I1595
	mov	ax,46
	imul	WORD PTR [bp+12]	;ID
	mov	bx,ax
	cmp	WORD PTR _bv[bx],OFFSET _AICarrierLand
	jne	$L20060
	cmp	WORD PTR _bv[bx+38],7
	jl	$L20060
$I1595:
; Line 882
	mov	WORD PTR _PlaneAnimVals+12,0
; Line 883
$I1597:
; Line 886
	mov	bx,WORD PTR [bp-178]	;psi
	test	BYTE PTR [bx+25],128
	jne	$L20026
	cmp	WORD PTR _detected,0
	je	$L20024
	cmp	WORD PTR [bx+32],0
	jne	$L20024
	cmp	WORD PTR [bp-66],4096	;r
	jge	$L20024
$L20026:
	mov	WORD PTR _PlaneAnimVals+26,1
	jmp	SHORT $L20025
	nop	
$L20024:
	mov	WORD PTR _PlaneAnimVals+26,0
$L20025:
; Line 888
	cmp	WORD PTR [bx+26],100
	jge	$I1598
; Line 889
	mov	WORD PTR _PlaneAnimVals+26,0
; Line 891
$I1598:
	cmp	WORD PTR [bp-66],12288	;r
	jge	$L20027
	mov	ax,1
	jmp	SHORT $L20028
$L20027:
	sub	ax,ax
$L20028:
	mov	WORD PTR _PlaneAnimVals+30,ax
; Line 892
	mov	WORD PTR _PlaneAnimVals+50,1
; Line 894
	sub	ax,ax
	mov	WORD PTR _PlaneAnimVals+42,ax
	mov	WORD PTR _PlaneAnimVals+44,ax
; Line 896
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR [bx+20]
	mov	cx,WORD PTR [bx+18]
	neg	cx
	push	cx
	push	WORD PTR [bx+16]
	call	_MakeMatHPR
	add	sp,8
; Line 897
	call	_InvertMatrix
; Line 899
	cmp	WORD PTR [bp+14],0	;SHFT
	je	$I1599
; Line 900
	push	WORD PTR [bp+14]	;SHFT
	mov	ax,OFFSET _O
	push	ax
	call	_Shift3X3
	add	sp,4
; Line 902
$I1599:
	mov	ax,OFFSET DGROUP:_PlaneAnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR [bp+10]	;Z
	push	WORD PTR [bp+8]	;Y
	push	WORD PTR [bp+6]	;X
	push	WORD PTR [bp+4]	;NUM
	call	_NDraw3DObject
	add	sp,12
; Line 904
	mov	bx,WORD PTR _PalPtr3D
	mov	WORD PTR [bx+292],-28014
; Line 905
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DrawTexPlane	ENDP
_TEXT	ENDS
END
