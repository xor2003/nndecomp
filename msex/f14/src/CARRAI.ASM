;	Static Name Aliases
;
	TITLE   C:\CARRAI.C
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
PUBLIC  _AvailCat
PUBLIC  _BlastShield
PUBLIC  _CatReady
PUBLIC  _WingsReady
EXTRN	_SetUpLaunch:NEAR
EXTRN	_Sound:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_LetNextPlaneLand:NEAR
EXTRN	_OnTheDeck:NEAR
EXTRN	_FPARAMS:BYTE
EXTRN	_bv:BYTE
EXTRN	_landingstatus:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
_DATA      SEGMENT
_AvailCat	DW	0fc19H
	DW	0fc19H
	DW	0fc19H
	DW	0fc19H
_BlastShield	DW	00H
	DW	00H
	DW	00H
	DW	00H
_CatReady	DW	00H
	DW	00H
	DW	00H
	DW	00H
_WingsReady	DW	00H
_DATA      ENDS
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
; Line 23
; Line 70
	PUBLIC	_RequestCat
_RequestCat	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	i = -4
;	catplane = -2
;	planenum = 6
;	cat = 4
; Line 74
	cmp	WORD PTR [bp+4],-1	;cat
	jne	$I1261
; Line 75
	test	BYTE PTR _landingstatus,128
	je	$I1262
; Line 76
	mov	WORD PTR [bp-4],2	;i
; Line 77
	jmp	SHORT $L20001
	nop	
$I1262:
; Line 78
	mov	WORD PTR [bp-4],0	;i
; Line 79
	jmp	SHORT $L20001
	nop	
$FC1265:
	cmp	WORD PTR [bp-4],4	;i
	jge	$FB1266
; Line 80
	inc	WORD PTR [bp-4]	;i
; Line 81
$L20001:
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	cmp	WORD PTR _AvailCat[bx],-999
	jne	$FC1265
$FB1266:
; Line 82
	cmp	WORD PTR [bp-4],4	;i
	jge	$I1267
; Line 83
	mov	ax,WORD PTR [bp+6]	;planenum
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	mov	WORD PTR _AvailCat[bx],ax
; Line 84
	mov	ax,WORD PTR [bp-4]	;i
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1267:
; Line 86
	cmp	WORD PTR [bp+6],-1	;planenum
	je	$JCC90
	jmp	$I1269
$JCC90:
; Line 87
	mov	ax,WORD PTR _AvailCat+4
	mov	WORD PTR [bp-2],ax	;catplane
; Line 88
	mov	ax,WORD PTR [bp+6]	;planenum
	mov	WORD PTR _AvailCat+4,ax
; Line 89
	mov	ax,46
	imul	WORD PTR [bp-2]	;catplane
	mov	bx,ax
	push	WORD PTR _bv[bx+14]
	push	WORD PTR [bp-2]	;catplane
	call	_SetUpLaunch
	add	sp,4
; Line 95
	mov	ax,2
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1261:
; Line 100
	cmp	WORD PTR [bp+4],-1	;cat
	jle	$I1269
	cmp	WORD PTR [bp+4],4	;cat
	jge	$I1269
; Line 101
	mov	bx,WORD PTR [bp+4]	;cat
	shl	bx,1
	cmp	WORD PTR _AvailCat[bx],-999
	jne	$I1272
	cmp	WORD PTR [bp+4],0	;cat
	jl	$I1273
	cmp	WORD PTR [bp+4],1	;cat
	jg	$I1273
	test	BYTE PTR _landingstatus,128
	jne	$I1272
$I1273:
; Line 102
	mov	ax,WORD PTR [bp+6]	;planenum
	mov	bx,WORD PTR [bp+4]	;cat
	shl	bx,1
	mov	WORD PTR _AvailCat[bx],ax
; Line 103
$L20002:
	mov	ax,WORD PTR [bp+4]	;cat
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1272:
; Line 105
	cmp	WORD PTR [bp+6],-1	;planenum
	jne	$I1269
; Line 106
	cmp	WORD PTR [bp+4],1	;cat
	jg	$I1276
	test	BYTE PTR _landingstatus,128
	je	$I1276
; Line 107
	mov	WORD PTR [bp+4],2	;cat
; Line 108
$I1276:
	mov	bx,WORD PTR [bp+4]	;cat
	shl	bx,1
	mov	ax,WORD PTR _AvailCat[bx]
	mov	WORD PTR [bp-2],ax	;catplane
; Line 109
	mov	ax,WORD PTR [bp+6]	;planenum
	mov	WORD PTR _AvailCat[bx],ax
; Line 110
	mov	ax,46
	imul	WORD PTR [bp-2]	;catplane
	mov	bx,ax
	push	WORD PTR _bv[bx+14]
	push	WORD PTR [bp-2]	;catplane
	call	_SetUpLaunch
	add	sp,4
	jmp	SHORT $L20002
; Line 117
; Line 118
$I1269:
	mov	ax,-1
; Line 123
; Line 124
	mov	sp,bp
	pop	bp
	ret	
	nop	

_RequestCat	ENDP
; Line 128
	PUBLIC	_PreparePlane
_PreparePlane	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	PlaneId = 6
;	cat = 4
; Line 136
	mov	ax,1
	mov	bx,WORD PTR [bp+4]	;cat
	shl	bx,1
	mov	WORD PTR _BlastShield[bx],ax
; Line 137
	mov	sp,bp
	pop	bp
	ret	

_PreparePlane	ENDP
; Line 141
	PUBLIC	_ReadyLaunch
_ReadyLaunch	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	planeid = 6
;	cat = 4
; Line 144
	mov	bx,WORD PTR [bp+4]	;cat
	shl	bx,1
	cmp	WORD PTR _CatReady[bx],0
	je	$I1286
; Line 145
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1286:
; Line 147
	sub	ax,ax
; Line 148
	mov	sp,bp
	pop	bp
	ret	

_ReadyLaunch	ENDP
; Line 152
	PUBLIC	_SaluteCatOfficer
_SaluteCatOfficer	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
;	planeid = 6
;	cat = 4
; Line 155
	ret	

_SaluteCatOfficer	ENDP
; Line 159
	PUBLIC	_PlaneLaunched
_PlaneLaunched	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	planeid = 6
;	cat = 4
; Line 162
	push	WORD PTR _FPARAMS+10
	push	WORD PTR _FPARAMS+8
	push	WORD PTR _FPARAMS+6
	push	WORD PTR _FPARAMS+4
	push	WORD PTR _FPARAMS+2
	push	WORD PTR _FPARAMS
	call	_OnTheDeck
	mov	sp,bp
	or	ax,ax
	je	$I1296
; Line 163
	sub	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,36
	push	ax
	call	_Sound
	mov	sp,bp
; Line 164
$I1296:
	mov	bx,WORD PTR [bp+4]	;cat
	shl	bx,1
	mov	WORD PTR _BlastShield[bx],0
; Line 165
	mov	WORD PTR _AvailCat[bx],-999
; Line 166
	cmp	WORD PTR [bp+4],1	;cat
	jg	$I1298
; Line 167
	mov	cl,BYTE PTR [bp+4]	;cat
	mov	ax,16
	shl	ax,cl
	not	ax
	and	WORD PTR _landingstatus,ax
; Line 168
	call	_LetNextPlaneLand
; Line 169
; Line 170
$I1298:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_PlaneLaunched	ENDP
; Line 174
	PUBLIC	_LaunchAircraft
_LaunchAircraft	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 184
	xor	BYTE PTR _BlastShield+6,1
; Line 185
	ret	
	nop	

_LaunchAircraft	ENDP
_TEXT	ENDS
END
