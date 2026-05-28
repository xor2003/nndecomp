;	Static Name Aliases
;
;	$S614_Dx	EQU	Dx
;	$S615_Dy	EQU	Dy
;	$S616_Dz	EQU	Dz
;	$S679_LizardMouth	EQU	LizardMouth
;	$S680_beacon	EQU	beacon
	TITLE   C:\3DOBJECT.C
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
PUBLIC  _Object
PUBLIC  _OX
PUBLIC  _OY
PUBLIC  _OZ
PUBLIC  _SecondMatrix
PUBLIC  _Dist2Obj
PUBLIC  _Class
PUBLIC  _VX
PUBLIC  _VY
PUBLIC  _VZ
PUBLIC  _SinHead
PUBLIC  _CosHead
PUBLIC  _SinPitch
PUBLIC  _CosPitch
PUBLIC  _SinRoll
PUBLIC  _CosRoll
PUBLIC  _V
PUBLIC  _O
PUBLIC  _C
EXTRN	_MakeRotationMatrix:FAR
EXTRN	_MakeMatHPR:FAR
EXTRN	__aNchkstk:NEAR
EXTRN	_UpdateOurPlaneAnims:NEAR
EXTRN	_memcpy:NEAR
EXTRN	_SetOvrlyRp:NEAR
EXTRN	_NSetViewMat:NEAR
EXTRN	_GXMID:WORD
EXTRN	_GYMID:WORD
EXTRN	_NGXLO:WORD
EXTRN	_NGYLO:WORD
EXTRN	_NGXHI:WORD
EXTRN	_NGYHI:WORD
EXTRN	_NGXMID:WORD
EXTRN	_NGYMID:WORD
EXTRN	_GRPAGE:WORD
EXTRN	_GRPAGE0:BYTE
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_FTicks:WORD
EXTRN	_GrndAnimVals:BYTE
EXTRN	_PlaneAnimVals:BYTE
EXTRN	_CarrierAnimVals:BYTE
EXTRN	_NPDEST:DWORD
EXTRN	_PalPtr3D:WORD
_BSS      SEGMENT
COMM NEAR	_XEB:	BYTE:	 4
COMM NEAR	_YEB:	BYTE:	 4
COMM NEAR	_ZEB:	BYTE:	 4
_BSS      ENDS
EXTRN	_View:WORD
_BSS      SEGMENT
COMM NEAR	_HCent:	BYTE:	 2
COMM NEAR	_VCent:	BYTE:	 2
COMM NEAR	_AnimVals:	 2:	 32
COMM NEAR	_HitMe:	BYTE:	 2
COMM NEAR	_CRASHED:	BYTE:	 2
_BSS      ENDS
EXTRN	_GXLO:WORD
EXTRN	_GYLO:WORD
EXTRN	_GXHI:WORD
EXTRN	_GYHI:WORD
_DATA      SEGMENT
_Object	DW	00H
_OX	DW	00H
_OY	DW	00H
_OZ	DW	00H
_SecondMatrix	DW	00H
$S614_Dx	DW	00H
$S615_Dy	DW	00H
$S616_Dz	DW	00H
_Dist2Obj	DW	00H
_Class	DW	00H
_VX	DW	00H
_VY	DW	00H
_VZ	DW	00H
_SinHead	DW	00H
_CosHead	DW	00H
_SinPitch	DW	00H
_CosPitch	DW	00H
_SinRoll	DW	00H
_CosRoll	DW	00H
_V	DW	00H
 	DB	16 DUP(0)

_O	DW	00H
 	DB	16 DUP(0)

_C	DW	00H
 	DB	16 DUP(0)

$S680_beacon	DW	00H
_DATA      ENDS
_BSS      SEGMENT
$S679_LizardMouth	DW 01H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 14
; Line 19
; Line 16
; Line 17
; Line 18
; Line 19
; Line 20
; Line 78
	PUBLIC	_Bgn3D
_Bgn3D	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	Zoom = 20
;	Std = 18
;	Z = 16
;	Y = 14
;	X = 12
;	LRoll = 10
;	LPitch = 8
;	LHead = 6
;	Rp = 4
; Line 79
	push	WORD PTR [bp+4]	;Rp
	call	_SetDrawWindow
	mov	sp,bp
; Line 80
	push	WORD PTR [bp+20]	;Zoom
	push	WORD PTR [bp+10]	;LRoll
	push	WORD PTR [bp+8]	;LPitch
	push	WORD PTR [bp+6]	;LHead
	call	_SetViewRot
	mov	sp,bp
; Line 81
	push	WORD PTR [bp+16]	;Z
	push	WORD PTR [bp+14]	;Y
	push	WORD PTR [bp+12]	;X
	call	_SetViewPos
; Line 82
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Bgn3D	ENDP
; Line 86
	PUBLIC	_End3D
_End3D	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	d5 = -6
;	d10 = -2
;	d20 = -4
;	L = -8
; Line 95
	mov	cl,7
	mov	ax,WORD PTR _FTicks
	shl	ax,cl
	mov	WORD PTR [bp-6],ax	;d5
	shl	ax,1
	mov	WORD PTR [bp-2],ax	;d10
; Line 96
	shl	ax,1
; Line 98
	shl	ax,1
	add	WORD PTR _GrndAnimVals+32,ax
; Line 100
	mov	ax,WORD PTR [bp-2]	;d10
	add	WORD PTR _GrndAnimVals+34,ax
	mov	ax,WORD PTR _GrndAnimVals+34
	mov	WORD PTR _PlaneAnimVals+34,ax
; Line 101
	xor	BYTE PTR _PlaneAnimVals+36,1
; Line 103
	inc	WORD PTR $S679_LizardMouth
	cmp	WORD PTR $S679_LizardMouth,20
	jle	$I682
	mov	WORD PTR $S679_LizardMouth,0
; Line 104
$I682:
; Line 105
	mov	ax,WORD PTR $S679_LizardMouth
	mov	WORD PTR [bp-8],ax	;L
	cmp	ax,10
	jle	$I683
	sub	ax,20
	neg	ax
	mov	WORD PTR [bp-8],ax	;L
; Line 106
$I683:
	mov	ax,182
	imul	WORD PTR [bp-8]	;L
	mov	WORD PTR _GrndAnimVals+28,ax
; Line 107
	cmp	WORD PTR [bp-8],4	;L
	jle	$L20001
	mov	ax,1
	jmp	SHORT $L20002
$L20001:
	sub	ax,ax
$L20002:
	mov	WORD PTR _GrndAnimVals+26,ax
; Line 109
	inc	WORD PTR $S680_beacon
	cmp	WORD PTR $S680_beacon,2
	jle	$I684
	mov	WORD PTR $S680_beacon,0
; Line 110
$I684:
	cmp	WORD PTR $S680_beacon,0
	jne	$I685
; Line 111
	mov	bx,WORD PTR _PalPtr3D
	mov	WORD PTR [bx+62],-27757
; Line 112
	jmp	SHORT $I686
$I685:
; Line 113
	mov	bx,WORD PTR _PalPtr3D
	mov	WORD PTR [bx+62],-28014
$I686:
; Line 115
	call	_UpdateOurPlaneAnims
; Line 117
	mov	ax,WORD PTR [bp-2]	;d10
	shl	ax,1
	add	WORD PTR _CarrierAnimVals+32,ax
; Line 118
	mov	ax,WORD PTR [bp-6]	;d5
	shl	ax,1
	add	WORD PTR _CarrierAnimVals+34,ax
; Line 120
	mov	ax,18
	push	ax
	mov	ax,OFFSET DGROUP:_V
	push	ax
	mov	ax,OFFSET DGROUP:_C
	push	ax
	call	_memcpy
; Line 121
	mov	sp,bp
	pop	bp
	ret	
	nop	

_End3D	ENDP
; Line 125
	PUBLIC	_SetDrawWindow
_SetDrawWindow	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	LWidth = -4
;	LHeight = -2
;	Rp = 4
; Line 129
	mov	bx,WORD PTR [bp+4]	;Rp
	mov	ax,WORD PTR [bx+6]
	inc	ax
	sar	ax,1
	mov	WORD PTR _HCent,ax
; Line 130
	mov	ax,WORD PTR [bx+8]
	inc	ax
	sar	ax,1
	mov	WORD PTR _VCent,ax
; Line 132
	cmp	WORD PTR [bx+4],0
	jne	$I694
; Line 134
	test	BYTE PTR _View,64
	jne	$I694
; Line 135
	mov	WORD PTR _VCent,56
; Line 137
; Line 138
$I694:
; Line 140
	push	bx
	call	_SetOvrlyRp
; Line 143
	mov	bx,WORD PTR [bp+4]	;Rp
	mov	ax,WORD PTR [bx+2]
	mov	WORD PTR _GXLO,ax
; Line 144
	mov	ax,WORD PTR [bx+4]
	mov	WORD PTR _GYLO,ax
; Line 145
	mov	ax,WORD PTR [bx+2]
	add	ax,WORD PTR [bx+6]
	mov	WORD PTR _GXHI,ax
; Line 146
	mov	ax,WORD PTR [bx+4]
	add	ax,WORD PTR [bx+8]
	mov	WORD PTR _GYHI,ax
; Line 147
	mov	ax,WORD PTR [bx+2]
	add	ax,WORD PTR _HCent
	mov	WORD PTR _GXMID,ax
; Line 148
	mov	ax,WORD PTR [bx+4]
	add	ax,WORD PTR _VCent
	mov	WORD PTR _GYMID,ax
; Line 149
	mov	bx,WORD PTR [bx]
	shl	bx,1
	mov	ax,WORD PTR _GRPAGE0[bx]
	mov	WORD PTR _GRPAGE,ax
; Line 150
	mov	ax,WORD PTR _GXLO
	mov	WORD PTR _NGXLO,ax
; Line 151
	mov	ax,WORD PTR _GXHI
	mov	WORD PTR _NGXHI,ax
; Line 152
	mov	ax,WORD PTR _GYLO
	mov	WORD PTR _NGYLO,ax
; Line 153
	mov	ax,WORD PTR _GYHI
	mov	WORD PTR _NGYHI,ax
; Line 154
	mov	ax,WORD PTR _GXMID
	mov	WORD PTR _NGXMID,ax
; Line 155
	mov	ax,WORD PTR _GYMID
	mov	WORD PTR _NGYMID,ax
; Line 157
	mov	ax,WORD PTR _GRPAGE
	mov	WORD PTR _NPDEST+2,ax
; Line 158
	mov	WORD PTR _NPDEST,0
; Line 159
	mov	sp,bp
	pop	bp
	ret	
	nop	

_SetDrawWindow	ENDP
; Line 163
	PUBLIC	_SetViewRot
_SetViewRot	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	Zoom = 10
;	LRoll = 8
;	LPitch = 6
;	LHead = 4
; Line 164
	mov	ax,WORD PTR [bp+8]	;LRoll
	neg	ax
	push	ax
	mov	ax,WORD PTR [bp+6]	;LPitch
	neg	ax
	push	ax
	mov	cx,WORD PTR [bp+4]	;LHead
	neg	cx
	push	cx
	mov	dx,OFFSET DGROUP:_V
	push	dx
	mov	si,ax
	mov	di,cx
	call	FAR PTR _MakeRotationMatrix
	add	sp,8
; Line 165
	mov	ax,OFFSET DGROUP:_O
	push	ax
	push	WORD PTR [bp+8]	;LRoll
	push	si
	push	di
	call	FAR PTR _MakeMatHPR
	add	sp,8
; Line 167
	push	WORD PTR [bp+10]	;Zoom
	mov	ax,OFFSET DGROUP:_O
	push	ax
	call	_NSetViewMat
	add	sp,4
; Line 168
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_SetViewRot	ENDP
; Line 173
	PUBLIC	_SetViewPos
_SetViewPos	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	Z = 8
;	Y = 6
;	X = 4
; Line 174
	mov	ax,WORD PTR [bp+4]	;X
	mov	WORD PTR _VX,ax
; Line 175
	mov	ax,WORD PTR [bp+6]	;Y
	mov	WORD PTR _VY,ax
; Line 176
	mov	ax,WORD PTR [bp+8]	;Z
	mov	WORD PTR _VZ,ax
; Line 177
	mov	sp,bp
	pop	bp
	ret	

_SetViewPos	ENDP
_TEXT	ENDS
END
