;	Static Name Aliases
;
	TITLE   C:\3DSCENE.C
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
EXTRN	_Bgn3D:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_DrawNLand:NEAR
EXTRN	_NHorz:NEAR
EXTRN	_HandleSmoke:NEAR
EXTRN	_Carrier3D:NEAR
EXTRN	_Boats3D:NEAR
EXTRN	_Planes3D:NEAR
EXTRN	_DrawAAA:NEAR
EXTRN	_EndStack3D:NEAR
EXTRN	_End3D:NEAR
EXTRN	_DrawBullets:NEAR
EXTRN	_GRPAGE0:BYTE
EXTRN	_PalPtr3D:WORD
EXTRN	_Rp3D:WORD
EXTRN	_ABOVECLOUDS:WORD
EXTRN	_WORLDDETAIL:WORD
EXTRN	_NEMSSEG:WORD
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 11
; Line 19
; Line 12
; Line 13
; Line 32
	PUBLIC	_NDraw3D
_NDraw3D	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
;	zoom = -10
;	ND = -4
;	NE = -8
;	ZP = 18
;	YP = 14
;	XP = 10
;	LRoll = 8
;	LPitch = 6
;	LHead = 4
; Line 39
	mov	ax,256
	push	ax
	mov	ax,1
	push	ax
	push	WORD PTR [bp+18]	;ZP
	sub	cx,cx
	push	cx
	push	cx
	push	WORD PTR [bp+8]	;LRoll
	push	WORD PTR [bp+6]	;LPitch
	push	WORD PTR [bp+4]	;LHead
	push	WORD PTR _Rp3D
	call	_Bgn3D
	add	sp,18
; Line 41
	push	WORD PTR _WORLDDETAIL
	push	WORD PTR _GRPAGE0+4
	mov	ax,1
	push	ax
	push	WORD PTR [bp+8]	;LRoll
	push	WORD PTR [bp+6]	;LPitch
	push	WORD PTR [bp+4]	;LHead
	push	WORD PTR [bp+18]	;ZP
	mov	ax,WORD PTR [bp+14]	;YP
	mov	dx,WORD PTR [bp+16]
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	neg	ax
	adc	dx,0
	neg	dx
	and	ax,-4096
	and	dh,15
	push	dx
	push	ax
	mov	ax,WORD PTR [bp+10]	;XP
	sub	dx,dx
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
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
	call	_NHorz
	add	sp,22
; Line 43
	push	WORD PTR [bp+18]	;ZP
	push	WORD PTR [bp+16]
	push	WORD PTR [bp+14]	;YP
	push	WORD PTR [bp+12]
	push	WORD PTR [bp+10]	;XP
	call	_HandleSmoke
	add	sp,10
; Line 45
	cmp	WORD PTR _ABOVECLOUDS,0
	jne	$I565
; Line 46
	mov	ax,WORD PTR _GRPAGE0+2
	mov	WORD PTR [bp-2],ax
; Line 48
	mov	ax,WORD PTR _NEMSSEG
	mov	WORD PTR [bp-6],ax
; Line 49
	sub	ax,ax
; Line 50
	push	WORD PTR [bp-6]
	push	ax
	push	WORD PTR [bp-2]
	push	ax
	mov	dx,16
	sub	ax,WORD PTR [bp+14]	;YP
	sbb	dx,WORD PTR [bp+16]
	push	dx
	push	ax
	push	WORD PTR [bp+20]
	push	WORD PTR [bp+18]	;ZP
	push	WORD PTR [bp+12]
	push	WORD PTR [bp+10]	;XP
	call	_DrawNLand
	add	sp,20
; Line 51
	call	_Carrier3D
; Line 52
	call	_Boats3D
; Line 53
; Line 55
$I565:
	call	_Planes3D
; Line 57
	call	_DrawAAA
; Line 59
	call	_EndStack3D
; Line 60
	call	_End3D
; Line 61
	call	_DrawBullets
; Line 62
	mov	sp,bp
	pop	bp
	ret	
	nop	

_NDraw3D	ENDP
; Line 67
	PUBLIC	_Init3DPal
_Init3DPal	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	j = -4
;	i = -2
; Line 70
	mov	WORD PTR [bp-2],0	;i
$FC578:
; Line 71
	mov	ax,WORD PTR [bp-2]	;i
	sub	ax,256
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,1
	mov	si,WORD PTR _PalPtr3D
	mov	WORD PTR [bx][si],ax
; Line 72
	inc	WORD PTR [bp-2]	;i
	cmp	WORD PTR [bp-2],256	;i
	jl	$FC578
; Line 74
	mov	bx,WORD PTR _PalPtr3D
	mov	WORD PTR [bx+36],24415
; Line 77
	mov	bx,WORD PTR _PalPtr3D
	mov	WORD PTR [bx+58],-28271
; Line 78
	mov	bx,WORD PTR _PalPtr3D
	mov	WORD PTR [bx+60],-28527
; Line 79
	mov	bx,WORD PTR _PalPtr3D
	mov	WORD PTR [bx+62],-27757
; Line 81
	mov	bx,WORD PTR _PalPtr3D
	mov	WORD PTR [bx+290],-1536
; Line 83
	mov	bx,WORD PTR _PalPtr3D
	mov	WORD PTR [bx+256],-1536
; Line 84
	mov	bx,WORD PTR _PalPtr3D
	mov	WORD PTR [bx+258],-1536
; Line 86
	mov	bx,WORD PTR _PalPtr3D
	mov	WORD PTR [bx+168],23644
; Line 87
	mov	bx,WORD PTR _PalPtr3D
	mov	WORD PTR [bx+26],23901
; Line 88
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_Init3DPal	ENDP
_TEXT	ENDS
END
