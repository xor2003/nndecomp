;	Static Name Aliases
;
	TITLE   C:\TGTFLIR.C
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
PUBLIC  _GunRp
PUBLIC  _GunZoom
EXTRN	_ARCTAN:NEAR
EXTRN	_Dist2D:NEAR
EXTRN	_itoa:NEAR
EXTRN	_OnTheDeck:NEAR
EXTRN	__fstrcpy:NEAR
EXTRN	_strcat:NEAR
EXTRN	_RpPrint:FAR
EXTRN	__aNchkstk:NEAR
EXTRN	__aNNaldiv:NEAR
EXTRN	__aNlmul:NEAR
EXTRN	_GetPlanePtr:NEAR
EXTRN	_abs:NEAR
EXTRN	_NDraw3D:NEAR
EXTRN	_RpCRT:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Rp3D:WORD
EXTRN	_Txt:BYTE
EXTRN	_OurHead:WORD
EXTRN	_OurPitch:WORD
EXTRN	_OurRoll:WORD
EXTRN	_PxLng:DWORD
EXTRN	_PyLng:DWORD
EXTRN	_Alt:WORD
EXTRN	_ViewX:DWORD
EXTRN	_ViewY:DWORD
EXTRN	_ViewZ:WORD
EXTRN	_vHead:WORD
EXTRN	_vPitch:WORD
EXTRN	_vRoll:WORD
EXTRN	_ps:BYTE
EXTRN	_DESIGNATED:WORD
_DATA      SEGMENT
$SG831	DB	'NO LOCK 1X',  00H
$SG845	DB	'X',  00H
	ORG	$+1
_GunRp	DW	01H
	DW	077H
	DW	08aH
	DW	052H
	DW	039H
	DW	02H
	DW	02H
	DW	00H
	DW	01H
_GunZoom	DW	01H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 19
; Line 2
; Line 3
; Line 4
; Line 5
; Line 6
; Line 7
; Line 8
; Line 9
; Line 53
	PUBLIC	_DrawGunCameraView
_DrawGunCameraView	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,168
	call	__aNchkstk
	push	di
	push	si
;	TM = -18
;	RM = -160
;	PM = -134
;	phd = -110
;	pptchmin = -22
;	Rtmp = -20
;	PadHead = -28
;	PadPitch = -116
;	delx = -114
;	dely = -140
;	delz = -142
;	n = -136
;	str = -108
;	tempplane = -26
; Line 63
	mov	ax,WORD PTR _Rp3D
	mov	WORD PTR [bp-20],ax	;Rtmp
; Line 64
	mov	ax,WORD PTR _RpCRT
	mov	WORD PTR _Rp3D,ax
; Line 66
	mov	bx,ax
	mov	WORD PTR [bx+16],2
; Line 68
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+12],1
; Line 70
	cmp	WORD PTR _DESIGNATED,-1
	je	$JCC44
	jmp	$I826
$JCC44:
; Line 72
	mov	ax,WORD PTR _PxLng
	mov	dx,WORD PTR _PxLng+2
	mov	WORD PTR _ViewX,ax
	mov	WORD PTR _ViewX+2,dx
; Line 73
	mov	ax,WORD PTR _PyLng
	mov	dx,WORD PTR _PyLng+2
	mov	WORD PTR _ViewY,ax
	mov	WORD PTR _ViewY+2,dx
; Line 74
	mov	ax,WORD PTR _Alt
	add	ax,3
	mov	WORD PTR _ViewZ,ax
; Line 75
	mov	ax,WORD PTR _OurHead
	mov	WORD PTR _vHead,ax
; Line 76
	mov	ax,WORD PTR _OurPitch
	mov	WORD PTR _vPitch,ax
; Line 77
	mov	cx,WORD PTR _OurRoll
	mov	WORD PTR _vRoll,cx
; Line 79
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,16384
	jg	$I828
	cmp	WORD PTR _vPitch,-32768
	jne	$I827
$I828:
; Line 80
	mov	ax,-32768
	sub	ax,WORD PTR _vPitch
	mov	WORD PTR _vPitch,ax
; Line 81
	add	BYTE PTR _vHead+1,128
; Line 82
	mov	ax,-32768
	sub	ax,WORD PTR _vRoll
	mov	WORD PTR _vRoll,ax
; Line 83
; Line 85
$I827:
	cmp	WORD PTR _ViewZ,9
	jge	$I829
	mov	WORD PTR _ViewZ,9
; Line 86
$I829:
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
; Line 87
	mov	ax,OFFSET DGROUP:$SG831
	jmp	$L20003
$I826:
; Line 89
	mov	ax,40
	imul	WORD PTR _DESIGNATED
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+8]
	mov	dx,WORD PTR _ps[bx+10]
	mov	WORD PTR _ViewX,ax
	mov	WORD PTR _ViewX+2,dx
; Line 90
	sub	cx,cx
	mov	si,16
	sub	cx,WORD PTR _ps[bx+12]
	sbb	si,WORD PTR _ps[bx+14]
	mov	WORD PTR _ViewY,cx
	mov	WORD PTR _ViewY+2,si
; Line 91
	mov	di,WORD PTR _ps[bx+6]
	mov	WORD PTR _ViewZ,di
; Line 97
	mov	WORD PTR [bp-164],ax
	mov	WORD PTR [bp-162],dx
	mov	ax,WORD PTR _PxLng
	mov	dx,WORD PTR _PxLng+2
	sub	ax,WORD PTR [bp-164]
	sbb	dx,WORD PTR [bp-162]
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	mov	WORD PTR [bp-114],ax	;delx
	mov	WORD PTR [bp-112],dx
; Line 98
	mov	WORD PTR [bp-168],ax
	mov	WORD PTR [bp-166],dx
	mov	ax,WORD PTR _PyLng
	mov	dx,WORD PTR _PyLng+2
	sub	ax,cx
	sbb	dx,si
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	mov	WORD PTR [bp-140],ax	;dely
	mov	WORD PTR [bp-138],dx
; Line 99
	sub	di,WORD PTR _Alt
	neg	di
	sar	di,1
	sar	di,1
	mov	WORD PTR [bp-142],di	;delz
; Line 101
	mov	cx,WORD PTR [bp-168]
	neg	cx
	mov	WORD PTR [bp-134],cx	;PM
; Line 102
	neg	di
	mov	WORD PTR [bp-132],di
; Line 103
	neg	ax
	mov	WORD PTR [bp-130],ax
; Line 104
	push	ax
	push	cx
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-28],ax	;PadHead
; Line 105
	mov	ax,WORD PTR [bp-130]
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	mov	ax,WORD PTR [bp-134]	;PM
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	call	_Dist2D
	add	sp,4
	push	ax
	mov	ax,WORD PTR [bp-132]
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-116],ax	;PadPitch
; Line 107
	mov	ax,WORD PTR [bp-28]	;PadHead
	mov	WORD PTR _vHead,ax
; Line 108
	mov	ax,WORD PTR [bp-116]	;PadPitch
	mov	WORD PTR _vPitch,ax
; Line 109
	mov	cx,WORD PTR _OurRoll
	mov	WORD PTR _vRoll,cx
; Line 114
	mov	ax,WORD PTR _GunZoom
	cwd	
	push	dx
	push	ax
	lea	cx,WORD PTR [bp-114]	;delx
	push	cx
	mov	si,ax
	mov	di,dx
	call	__aNNaldiv
	add	WORD PTR _ViewX,ax
	adc	WORD PTR _ViewX+2,dx
; Line 115
	push	di
	push	si
	lea	ax,WORD PTR [bp-140]	;dely
	push	ax
	call	__aNNaldiv
	add	WORD PTR _ViewY,ax
	adc	WORD PTR _ViewY+2,dx
; Line 116
	mov	ax,WORD PTR [bp-142]	;delz
	cwd	
	idiv	WORD PTR _GunZoom
	mov	WORD PTR [bp-142],ax	;delz
	add	WORD PTR _ViewZ,ax
; Line 118
	push	WORD PTR [bp-116]	;PadPitch
	call	_abs
	add	sp,2
	cmp	ax,16384
	jg	$I836
	cmp	WORD PTR _vPitch,-32768
	jne	$I835
$I836:
; Line 119
	mov	ax,-32768
	sub	ax,WORD PTR _vPitch
	mov	WORD PTR _vPitch,ax
; Line 120
	add	BYTE PTR _vHead+1,128
; Line 121
	mov	ax,-32768
	sub	ax,WORD PTR _vRoll
	mov	WORD PTR _vRoll,ax
; Line 122
; Line 124
$I835:
	cmp	WORD PTR _ViewZ,9
	jge	$I837
	mov	WORD PTR _ViewZ,9
; Line 126
$I837:
	cmp	WORD PTR _ViewZ,30
	jge	$I842
; Line 127
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
	mov	WORD PTR [bp-136],ax	;n
	or	ax,ax
	je	$I842
; Line 128
	cmp	WORD PTR _ViewZ,18
	jge	$I841
; Line 129
	mov	WORD PTR _ViewZ,18
; Line 130
$I841:
	or	ax,ax
	jge	$I842
; Line 131
	mov	WORD PTR _ViewZ,30
; Line 132
$I842:
; Line 133
; Line 135
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
; Line 138
	mov	ax,40
	imul	WORD PTR _DESIGNATED
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-26],ax	;tempplane
	mov	WORD PTR [bp-24],dx
	inc	ax
	inc	ax
	push	dx
	push	ax
	mov	ax,OFFSET _Txt
	push	ds
	push	ax
	call	__fstrcpy
	add	sp,8
; Line 139
	mov	ax,OFFSET _Txt
	push	ax
	mov	ax,40
	push	ax
	mov	ax,8
	push	ax
	push	WORD PTR _Rp3D
	call	FAR PTR _RpPrint
	add	sp,8
; Line 141
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-108]	;str
	push	ax
	push	WORD PTR _GunZoom
	call	_itoa
	add	sp,6
; Line 142
	mov	ax,OFFSET DGROUP:$SG845
	push	ax
	lea	ax,WORD PTR [bp-108]	;str
	push	ax
	call	_strcat
	add	sp,4
; Line 143
	lea	ax,WORD PTR [bp-108]	;str
$L20003:
	push	ax
	mov	ax,48
	push	ax
	mov	ax,8
	push	ax
	push	WORD PTR _Rp3D
	call	FAR PTR _RpPrint
	add	sp,8
; Line 144
; Line 145
	mov	ax,WORD PTR [bp-20]	;Rtmp
	mov	WORD PTR _Rp3D,ax
; Line 146
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_DrawGunCameraView	ENDP
; Line 149
	PUBLIC	_GunCameraZoom
_GunCameraZoom	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	dir = 4
; Line 151
	mov	ax,WORD PTR [bp+4]	;dir
	add	WORD PTR _GunZoom,ax
	cmp	WORD PTR _GunZoom,1
	jge	$I849
	mov	WORD PTR _GunZoom,1
; Line 152
$I849:
	cmp	WORD PTR _GunZoom,20
	jle	$I850
	mov	WORD PTR _GunZoom,20
; Line 153
$I850:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GunCameraZoom	ENDP
_TEXT	ENDS
END
