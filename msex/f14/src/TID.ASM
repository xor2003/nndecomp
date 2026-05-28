;	Static Name Aliases
;
;	$S718_hpts	EQU	hpts
;	$S735_RANGES	EQU	RANGES
	TITLE   C:\TID.C
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
PUBLIC  _TID_MODE
PUBLIC  _DesignateMode
PUBLIC  _TIDTargetCnt
EXTRN	_SetupNewTarget:NEAR
EXTRN	_pstrlen:NEAR
EXTRN	_orient_to_player:NEAR
EXTRN	_rotate_pt:NEAR
EXTRN	_CheckMode:NEAR
EXTRN	_DrawLine:FAR
EXTRN	_abs:NEAR
EXTRN	_Rotate2D:NEAR
EXTRN	_DopplerCheck:NEAR
EXTRN	_RpPrint:FAR
EXTRN	_draw_circle:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_RectFill:FAR
EXTRN	_itoa:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_get_count:NEAR
EXTRN	_PDT_RNG:WORD
EXTRN	_ASPECT_S:BYTE
EXTRN	_CLOSURE:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Txt:BYTE
EXTRN	_Rounds:WORD
EXTRN	_MODE_AA:WORD
_BSS      SEGMENT
COMM NEAR	_TIDTargetList:	 6:	 24
_BSS      ENDS
EXTRN	_DESIG_TARG:BYTE
_BSS      SEGMENT
COMM NEAR	_Tscale:	BYTE:	 2
_BSS      ENDS
EXTRN	_RpCRT:WORD
EXTRN	_Px:WORD
EXTRN	_Py:WORD
EXTRN	_OurHead:WORD
EXTRN	_OurRoll:WORD
EXTRN	_ps:BYTE
_BSS      SEGMENT
COMM NEAR	_tempx:	BYTE:	 2
COMM NEAR	_tempy:	BYTE:	 2
_BSS      ENDS
EXTRN	_TARGFILE:WORD
EXTRN	_AGEDTARGFILE:WORD
EXTRN	_TARGFILECNT:WORD
EXTRN	_AGEDTARGFILECNT:WORD
EXTRN	_FIRINGORDERLIST:BYTE
EXTRN	_AWG9_MODE:WORD
EXTRN	_DataLinkCnt:WORD
EXTRN	_DataLinkList:BYTE
EXTRN	_DataLink:WORD
EXTRN	_BackSeat:WORD
_BSS      SEGMENT
COMM NEAR	_SelectedTarg:	BYTE:	 2
_BSS      ENDS
EXTRN	_LOCKED:WORD
_BSS      SEGMENT
COMM NEAR	_HighlightTarg:	BYTE:	 2
COMM NEAR	_ClrTarg:	BYTE:	 2
_BSS      ENDS
_DATA      SEGMENT
	ORG	$+6
$SG686	DB	'RA',  00H
$SG688	DB	'TA %s',  00H
$SG689	DB	'ALT %d',  00H
$SG692	DB	'RA',  00H
$SG693	DB	'TA %s',  00H
$SG694	DB	'ALT %d',  00H
$SG702	DB	'SP',  00H
$SG705	DB	'SW',  00H
$SG707	DB	'PH',  00H
$SG709	DB	'G',  00H
$SG711	DB	'XXX',  00H
	ORG	$+35
$SG779	DB	'1',  00H
$SG781	DB	'2',  00H
$SG783	DB	'3',  00H
$SG785	DB	'4',  00H
$SG787	DB	'5',  00H
	ORG	$-98
_DesignateMode	DW	00H
_TIDTargetCnt	DW	00H
_TID_MODE	DW	01H
	ORG	$+48
$S718_hpts	DW	03cH
	DW	00H
	DW	0ffc4H
	DW	00H
 	DB	16 DUP(0)

$S735_RANGES	DW	0c8H
	DW	064H
	DW	032H
	DW	019H
	DW	0aH
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 14
; Line 19
; Line 15
; Line 16
; Line 17
; Line 18
; Line 19
; Line 20
; Line 59
	PUBLIC	_DoTID
_DoTID	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,56
	call	__aNchkstk
	push	si
;	i = -52
;	psi = -54
;	t = -50
;	CrtNr = 4
; Line 64
	mov	ax,82
	push	ax
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+8]
	inc	ax
	push	ax
	mov	ax,WORD PTR [bx+6]
	inc	ax
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	push	bx
	call	FAR PTR _RectFill
	add	sp,12
; Line 66
	mov	WORD PTR _TIDTargetCnt,0
; Line 68
	cmp	WORD PTR _DataLink,0
	je	$I644
; Line 69
	mov	WORD PTR [bp-52],0	;i
	jmp	SHORT $F645
	nop	
$FC646:
; Line 70
	mov	bx,WORD PTR [bp-52]	;i
	shl	bx,1
	push	WORD PTR _DataLinkList[bx]
	lea	ax,WORD PTR [bp-50]	;t
	push	ax
	call	_SetupNewTarget
	add	sp,4
; Line 71
	lea	ax,WORD PTR [bp-50]	;t
	push	ax
	call	_orient_to_player
	add	sp,2
; Line 72
	mov	ax,1
	push	ax
	sub	cx,cx
	push	cx
	lea	cx,WORD PTR [bp-50]	;t
	push	cx
	call	_TID_draw_target
	add	sp,6
; Line 73
	mov	ax,1
	push	ax
	lea	ax,WORD PTR [bp-50]	;t
	push	ax
	call	_TrackDisplayPosition
	add	sp,4
; Line 74
	inc	WORD PTR [bp-52]	;i
$F645:
	mov	ax,WORD PTR _DataLinkCnt
	cmp	WORD PTR [bp-52],ax	;i
	jl	$FC646
; Line 75
; Line 77
$I644:
	cmp	WORD PTR _AWG9_MODE,20
	jne	$I652
$L20008:
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 78
$I652:
	cmp	WORD PTR _AWG9_MODE,100
	je	$L20008
; Line 79
	cmp	WORD PTR _AWG9_MODE,104
	je	$L20008
; Line 80
	cmp	WORD PTR _AWG9_MODE,102
	je	$L20008
; Line 81
	cmp	WORD PTR _AWG9_MODE,106
	je	$L20008
; Line 83
	cmp	WORD PTR _AWG9_MODE,300
	je	$I657
; Line 84
	call	_TID_DisplayScanLimits
; Line 85
; Line 87
$I657:
	call	_TIDAttkInfo
; Line 89
	cmp	WORD PTR _AWG9_MODE,300
	jne	$I660
; Line 90
	mov	WORD PTR [bp-52],0	;i
	jmp	SHORT $F661
	nop	
$L20001:
	sub	ax,ax
$L20002:
	push	ax
	push	bx
	call	_TID_draw_target
	add	sp,6
; Line 92
	inc	WORD PTR [bp-52]	;i
$F661:
	mov	bx,WORD PTR _TARGFILECNT
	mov	ax,WORD PTR [bp-52]	;i
	cmp	WORD PTR [bx],ax
	jg	$JCC228
	jmp	$FB667
$JCC228:
; Line 91
	sub	cx,cx
	push	cx
	mov	cx,50
	imul	cx
	mov	bx,ax
	add	bx,WORD PTR _TARGFILE
	mov	ax,WORD PTR _LOCKED
	mov	WORD PTR [bp-56],bx
	cmp	WORD PTR [bx+26],ax
	jne	$L20001
	mov	ax,1
	jmp	SHORT $L20002
	nop	
$I660:
; Line 95
	mov	WORD PTR [bp-52],0	;i
	jmp	SHORT $F665
	nop	
$L20003:
	sub	ax,ax
$L20004:
	push	ax
	push	si
	call	_TID_draw_target
	add	sp,6
; Line 98
; Line 99
$I669:
	sub	ax,ax
	push	ax
	mov	ax,50
	imul	WORD PTR [bp-52]	;i
	add	ax,WORD PTR _TARGFILE
	push	ax
	call	_TrackDisplayPosition
	add	sp,4
; Line 100
	inc	WORD PTR [bp-52]	;i
$F665:
	mov	bx,WORD PTR _AGEDTARGFILECNT
	mov	ax,WORD PTR [bp-52]	;i
	cmp	WORD PTR [bx],ax
	jle	$FB667
; Line 96
	mov	cx,50
	imul	cx
	mov	cx,ax
	add	ax,WORD PTR _AGEDTARGFILE
	push	ax
	mov	si,cx
	call	_DopplerCheck
	add	sp,2
	or	ax,ax
	je	$I669
; Line 97
	sub	ax,ax
	push	ax
	add	si,WORD PTR _AGEDTARGFILE
	mov	ax,WORD PTR _LOCKED
	mov	WORD PTR [bp-56],si
	cmp	WORD PTR [si+26],ax
	jne	$L20003
	mov	ax,1
	jmp	SHORT $L20004
	nop	
$FB667:
; Line 101
; Line 104
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR _tempx,ax
; Line 105
	mov	ax,WORD PTR [bx+8]
	mov	WORD PTR _tempy,ax
; Line 106
	sub	ax,ax
	push	ax
	mov	ax,20
	push	ax
	mov	ax,1
	push	ax
	mov	cx,WORD PTR _tempy
	sub	cx,3
	push	cx
	push	WORD PTR _tempx
	push	bx
	call	_draw_circle
	add	sp,12
	jmp	$L20008
; Line 108

_DoTID	ENDP
; Line 112
	PUBLIC	_TrackDisplayPosition
_TrackDisplayPosition	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	tempps = -2
;	dl = 6
;	tc = 4
; Line 115
	cmp	WORD PTR _TIDTargetCnt,23
	jle	$I675
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 117
$I675:
	mov	ax,40
	mov	bx,WORD PTR [bp+4]	;tc
	imul	WORD PTR [bx+26]
	add	ax,OFFSET _ps
; Line 119
	mov	si,ax
	push	WORD PTR [si+4]
	push	WORD PTR [si+2]
	call	_TIDxy
	add	sp,4
; Line 120
	cmp	WORD PTR _tempx,0
	je	$I677
	cmp	WORD PTR _tempy,0
	je	$I677
; Line 121
	mov	ax,WORD PTR _tempx
	mov	bx,WORD PTR _TIDTargetCnt
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	mov	WORD PTR _TIDTargetList[bx],ax
; Line 122
	mov	ax,WORD PTR _tempy
	mov	WORD PTR _TIDTargetList[bx+2],ax
; Line 123
	mov	si,WORD PTR [bp+4]	;tc
	mov	ax,WORD PTR [si+26]
	mov	WORD PTR _TIDTargetList[bx+4],ax
; Line 124
	inc	WORD PTR _TIDTargetCnt
; Line 125
; Line 126
$I677:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_TrackDisplayPosition	ENDP
; Line 130
	PUBLIC	_TIDAttkInfo
_TIDAttkInfo	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__aNchkstk
	push	si
;	s = -8
;	t = -18
;	r = -2
;	l = -24
; Line 136
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+16],2
; Line 140
	cmp	WORD PTR _BackSeat,0
	jne	$JCC552
	jmp	$I683
$JCC552:
; Line 141
	cmp	WORD PTR _AWG9_MODE,300
	je	$JCC563
	jmp	$I691
$JCC563:
; Line 143
	mov	ax,10
	push	ax
	lea	cx,WORD PTR [bp-8]	;s
	push	cx
	mov	dx,475
	sub	bx,bx
	push	bx
	push	dx
	mov	ax,WORD PTR _PDT_RNG
	cwd	
	mov	bx,ax
	mov	si,dx
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	add	ax,bx
	adc	dx,si
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-2],ax	;r
	push	ax
	call	_itoa
	add	sp,6
; Line 144
	mov	ax,OFFSET DGROUP:$SG686
	push	ax
	mov	ax,15
	push	ax
	mov	cx,40
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 145
	lea	ax,WORD PTR [bp-8]	;s
	push	ax
	mov	ax,15
	push	ax
	mov	cx,50
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 147
	mov	ax,OFFSET _ASPECT_S
	push	ax
	mov	ax,OFFSET DGROUP:$SG688
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,6
; Line 148
	mov	ax,OFFSET _Txt
	push	ax
	mov	cx,15
	push	cx
	mov	cx,85
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 150
	mov	ax,40
	imul	WORD PTR _LOCKED
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	mov	ax,OFFSET DGROUP:$SG689
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,6
; Line 151
	mov	ax,OFFSET _Txt
	push	ax
	mov	ax,22
	push	ax
	mov	ax,40
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 152
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-18]	;t
	push	ax
	push	WORD PTR _CLOSURE
	call	_itoa
	add	sp,6
; Line 153
	lea	ax,WORD PTR [bp-18]	;t
	push	ax
	mov	ax,60
	push	ax
	mov	ax,125
	jmp	$L20011
	nop	
$I683:
; Line 156
	cmp	WORD PTR _AWG9_MODE,300
	je	$JCC802
	jmp	$I691
$JCC802:
; Line 158
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-8]	;s
	push	ax
	mov	cx,475
	sub	dx,dx
	push	dx
	push	cx
	mov	ax,WORD PTR _PDT_RNG
	cwd	
	mov	cx,ax
	mov	bx,dx
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	add	ax,cx
	adc	dx,bx
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-2],ax	;r
	push	ax
	call	_itoa
	add	sp,6
; Line 159
	mov	ax,OFFSET DGROUP:$SG692
	push	ax
	mov	ax,5
	push	ax
	mov	cx,8
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 160
	lea	ax,WORD PTR [bp-8]	;s
	push	ax
	mov	ax,5
	push	ax
	mov	cx,18
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 162
	mov	ax,OFFSET _ASPECT_S
	push	ax
	mov	ax,OFFSET DGROUP:$SG693
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,6
; Line 163
	mov	ax,OFFSET _Txt
	push	ax
	mov	cx,5
	push	cx
	mov	cx,60
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 165
	mov	ax,40
	imul	WORD PTR _LOCKED
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	mov	ax,OFFSET DGROUP:$SG694
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,6
; Line 166
	mov	ax,OFFSET _Txt
	push	ax
	mov	ax,12
	push	ax
	mov	ax,8
$L20011:
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 167
; Line 168
$I691:
; Line 202
	cmp	WORD PTR _BackSeat,0
	jne	$JCC1007
	jmp	$I695
$JCC1007:
; Line 205
	mov	ax,WORD PTR _MODE_AA
	jmp	SHORT $S696
; Line 206
	nop	
$SC700:
; Line 207
	mov	ax,OFFSET DGROUP:$SG702
$L20009:
	push	ax
	lea	ax,WORD PTR [bp-24]	;l
	push	ax
	call	_strcpy
	add	sp,4
; Line 208
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-8]	;s
	push	ax
	call	_get_count
	push	ax
	jmp	SHORT $L20012
; Line 211
$SC704:
; Line 212
	mov	ax,OFFSET DGROUP:$SG705
	jmp	SHORT $L20009
; Line 216
	nop	
$SC706:
; Line 217
	mov	ax,OFFSET DGROUP:$SG707
	jmp	SHORT $L20009
; Line 221
	nop	
$SC708:
; Line 222
	mov	ax,OFFSET DGROUP:$SG709
	push	ax
	lea	ax,WORD PTR [bp-24]	;l
	push	ax
	call	_strcpy
	add	sp,4
; Line 223
	cmp	WORD PTR _Rounds,0
	jne	$I710
; Line 224
	mov	ax,OFFSET DGROUP:$SG711
$L20010:
	push	ax
	lea	ax,WORD PTR [bp-18]	;t
	push	ax
	call	_strcpy
	add	sp,4
; Line 225
	jmp	SHORT $SB697
	nop	
$I710:
; Line 226
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-8]	;s
	push	ax
	push	WORD PTR _Rounds
$L20012:
	call	_itoa
	add	sp,6
	jmp	SHORT $L20010
$S696:
	or	ax,ax
	je	$SC700
	dec	ax
	je	$SC704
	dec	ax
	je	$SC708
	dec	ax
	dec	ax
	je	$SC706
$SB697:
; Line 230
	lea	ax,WORD PTR [bp-24]	;l
	push	ax
	mov	cx,90
	push	cx
	push	ax
	push	WORD PTR _RpCRT
	call	_pstrlen
	add	sp,4
	sub	ax,110
	neg	ax
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 231
	lea	ax,WORD PTR [bp-18]	;t
	push	ax
	mov	cx,97
	push	cx
	push	ax
	push	WORD PTR _RpCRT
	call	_pstrlen
	add	sp,4
	sub	ax,110
	neg	ax
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 232
; Line 233
$I695:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_TIDAttkInfo	ENDP
; Line 239
	PUBLIC	_TIDDisplayHorz
_TIDDisplayHorz	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,30
	call	__aNchkstk
	push	si
;	i = -26
;	pts = -24
;	xc = -28
;	yc = -30
; Line 245
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR [bp-28],ax	;xc
; Line 246
	mov	ax,WORD PTR [bx+8]
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR [bp-30],ax	;yc
; Line 250
	mov	WORD PTR [bp-26],0	;i
$FC722:
; Line 251
	push	WORD PTR _OurRoll
	mov	si,WORD PTR [bp-26]	;i
	shl	si,1
	shl	si,1
	lea	ax,WORD PTR [bp-24][si]
	push	ax
	add	si,OFFSET DGROUP:$S718_hpts
	push	si
	call	_rotate_pt
	add	sp,6
	inc	WORD PTR [bp-26]	;i
	cmp	WORD PTR [bp-26],2	;i
	jl	$FC722
; Line 255
	mov	ax,20
	push	ax
	mov	cx,WORD PTR [bp-30]	;yc
	add	cx,WORD PTR [bp-18]
	push	cx
	mov	cx,WORD PTR [bp-28]	;xc
	add	cx,WORD PTR [bp-20]
	push	cx
	mov	cx,WORD PTR [bp-30]	;yc
	add	cx,WORD PTR [bp-22]
	push	cx
	mov	cx,WORD PTR [bp-28]	;xc
	add	cx,WORD PTR [bp-24]	;pts
	push	cx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 256
	mov	ax,20
	push	ax
	mov	ax,WORD PTR [bp-30]	;yc
	add	ax,WORD PTR [bp-6]
	push	ax
	mov	ax,WORD PTR [bp-28]	;xc
	add	ax,WORD PTR [bp-8]
	push	ax
	mov	ax,WORD PTR [bp-30]	;yc
	add	ax,WORD PTR [bp-10]
	push	ax
	mov	ax,WORD PTR [bp-28]	;xc
	add	ax,WORD PTR [bp-12]
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 257
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_TIDDisplayHorz	ENDP
; Line 262
	PUBLIC	_TIDxy
_TIDxy	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	dx = -2
;	dy = -4
;	y = 6
;	x = 4
; Line 265
	mov	cl,7
	sub	cl,BYTE PTR _Tscale
	mov	ax,WORD PTR [bp+4]	;x
	sub	ax,WORD PTR _Px
	sar	ax,cl
	mov	WORD PTR [bp-2],ax	;dx
; Line 266
	mov	dx,WORD PTR [bp+6]	;y
	sub	dx,WORD PTR _Py
	sar	dx,cl
	mov	WORD PTR [bp-4],dx	;dy
; Line 269
	sub	cx,cx
	mov	WORD PTR _tempx,cx
	mov	WORD PTR _tempy,cx
; Line 271
	push	ax
	mov	si,dx
	call	_abs
	add	sp,2
	push	si
	mov	si,ax
	call	_abs
	add	sp,2
	add	si,ax
	mov	bx,WORD PTR _RpCRT
	cmp	si,WORD PTR [bx+6]
	ja	$I731
; Line 272
	mov	ax,OFFSET DGROUP:_tempy
	push	ax
	mov	cx,OFFSET DGROUP:_tempx
	push	cx
	push	WORD PTR _OurHead
	push	WORD PTR [bp-4]	;dy
	push	WORD PTR [bp-2]	;dx
	call	_Rotate2D
	add	sp,10
; Line 273
	mov	ax,WORD PTR _tempy
	sar	ax,1
	add	WORD PTR _tempy,ax
; Line 274
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+8]
	add	WORD PTR _tempy,ax
; Line 275
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	add	WORD PTR _tempx,ax
; Line 276
; Line 277
$I731:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_TIDxy	ENDP
; Line 282
TID_show_range	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
;	s = -10
;	l = -12
; Line 287
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+16],4
; Line 288
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+12],20
; Line 290
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	bx,WORD PTR _Tscale
	shl	bx,1
	push	WORD PTR $S735_RANGES[bx]
	call	_itoa
	add	sp,6
	push	ax
	push	WORD PTR _RpCRT
	call	_pstrlen
	add	sp,4
	mov	WORD PTR [bp-12],ax	;l
; Line 292
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	ax,8
	push	ax
	mov	ax,75
	sub	ax,WORD PTR [bp-12]	;l
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
; Line 293
	mov	sp,bp
	pop	bp
	ret	
	nop	

TID_show_range	ENDP
; Line 297
	PUBLIC	_TID_DisplayScanLimits
_TID_DisplayScanLimits	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 298
	mov	ax,20
	push	ax
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+8]
	mov	cx,ax
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	push	WORD PTR [bx+6]
	push	cx
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	push	bx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 299
	mov	ax,20
	push	ax
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+8]
	mov	cx,ax
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	sub	ax,ax
	push	ax
	push	cx
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	push	ax
	push	bx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 300
	ret	

_TID_DisplayScanLimits	ENDP
; Line 304
	PUBLIC	_TID_draw_target
_TID_draw_target	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,42
	call	__aNchkstk
	push	si
;	d = -16
;	clr = -4
;	temp = -20
;	x1 = -28
;	y1 = -32
;	x2 = -30
;	y2 = -38
;	off = -36
;	taillength = -42
;	font = -22
;	alt = -2
;	i = -26
;	found = -40
;	tempps = -24
;	s = -14
;	cnt = -18
;	ipos = -34
;	dl = 8
;	locked = 6
;	tc = 4
; Line 307
	mov	WORD PTR [bp-42],5	;taillength
; Line 315
	sub	ax,ax
	mov	WORD PTR [bp-18],ax	;cnt
	mov	WORD PTR [bp-34],ax	;ipos
; Line 318
	mov	ax,40
	mov	bx,WORD PTR [bp+4]	;tc
	imul	WORD PTR [bx+26]
	add	ax,OFFSET _ps
	mov	WORD PTR [bp-24],ax	;tempps
; Line 320
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+12],85
; Line 325
	mov	WORD PTR [bp-4],85	;clr
; Line 328
	mov	bx,WORD PTR [bp-24]	;tempps
	mov	ax,WORD PTR [bx+16]
	sub	ax,WORD PTR _OurHead
	add	ah,8
	mov	al,ah
	cbw	
	mov	cl,4
	sar	ax,cl
	and	ax,15
	mov	WORD PTR [bp-16],ax	;d
; Line 329
	mov	WORD PTR [bp-36],0	;off
; Line 331
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+16]
	mov	WORD PTR [bp-22],ax	;font
; Line 332
	mov	WORD PTR [bx+16],4
; Line 334
	mov	bx,WORD PTR [bp+4]	;tc
	mov	ax,WORD PTR _SelectedTarg
	cmp	WORD PTR [bx+26],ax
	jne	$I762
; Line 336
	mov	ax,89
	mov	WORD PTR [bp-4],ax	;clr
	mov	bx,WORD PTR _RpCRT
	mov	WORD PTR [bx+12],ax
; Line 337
; Line 339
$I762:
	cmp	WORD PTR [bp+8],0	;dl
	je	$I763
; Line 340
	mov	bx,WORD PTR [bp+4]	;tc
	mov	WORD PTR [bx+48],0
; Line 342
$I763:
	mov	bx,WORD PTR [bp-24]	;tempps
	push	WORD PTR [bx+4]
	push	WORD PTR [bx+2]
	call	_TIDxy
	add	sp,4
; Line 344
	mov	bx,WORD PTR [bp+4]	;tc
	cmp	WORD PTR [bx+48],0
	je	$JCC1860
	jmp	$I764
$JCC1860:
; Line 345
	cmp	WORD PTR [bp+8],0	;dl
	je	$I765
; Line 346
	push	WORD PTR [bp-4]	;clr
	mov	ax,WORD PTR _tempy
	inc	ax
	inc	ax
	push	ax
	mov	ax,WORD PTR _tempx
	dec	ax
	dec	ax
	push	ax
	push	WORD PTR _tempy
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 347
	push	WORD PTR [bp-4]	;clr
	mov	ax,WORD PTR _tempy
	inc	ax
	inc	ax
	push	ax
	mov	ax,WORD PTR _tempx
	inc	ax
	inc	ax
	push	ax
	push	WORD PTR _tempy
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 348
	push	WORD PTR [bp-4]	;clr
	mov	ax,WORD PTR _tempy
	inc	ax
	inc	ax
	push	ax
	mov	cx,WORD PTR _tempx
	inc	cx
	inc	cx
	push	cx
	push	ax
	mov	ax,WORD PTR _tempx
	dec	ax
	dec	ax
	jmp	SHORT $L20015
	nop	
$I765:
; Line 350
	push	WORD PTR [bp-4]	;clr
	mov	ax,WORD PTR _tempy
	dec	ax
	dec	ax
	push	ax
	mov	cx,WORD PTR _tempx
	inc	cx
	inc	cx
	push	cx
	push	ax
	mov	ax,WORD PTR _tempx
	dec	ax
	dec	ax
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 351
	push	WORD PTR [bp-4]	;clr
	push	WORD PTR _tempy
	mov	ax,WORD PTR _tempx
	dec	ax
	dec	ax
	push	ax
	mov	cx,WORD PTR _tempy
	dec	cx
	push	cx
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 352
	push	WORD PTR [bp-4]	;clr
	push	WORD PTR _tempy
	mov	ax,WORD PTR _tempx
	inc	ax
	inc	ax
	push	ax
	mov	cx,WORD PTR _tempy
	dec	cx
	push	cx
$L20015:
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 353
; Line 354
; Line 356
$I764:
	mov	bx,WORD PTR [bp+4]	;tc
	cmp	WORD PTR [bx+48],1
	je	$JCC2066
	jmp	$I767
$JCC2066:
; Line 357
	cmp	WORD PTR [bp+8],0	;dl
	je	$I768
; Line 358
	push	WORD PTR [bp-4]	;clr
	mov	ax,WORD PTR _tempy
	inc	ax
	inc	ax
	push	ax
	mov	cx,WORD PTR _tempx
	inc	cx
	push	cx
	push	ax
	mov	ax,WORD PTR _tempx
	dec	ax
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 359
	push	WORD PTR [bp-4]	;clr
	push	WORD PTR _tempy
	mov	ax,WORD PTR _tempx
	dec	ax
	dec	ax
	push	ax
	mov	cx,WORD PTR _tempy
	inc	cx
	push	cx
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 360
	push	WORD PTR [bp-4]	;clr
	push	WORD PTR _tempy
	mov	ax,WORD PTR _tempx
	inc	ax
	inc	ax
	push	ax
	mov	cx,WORD PTR _tempy
	inc	cx
	jmp	SHORT $L20016
$I768:
; Line 362
	push	WORD PTR [bp-4]	;clr
	mov	ax,WORD PTR _tempy
	dec	ax
	dec	ax
	push	ax
	mov	cx,WORD PTR _tempx
	inc	cx
	push	cx
	push	ax
	mov	ax,WORD PTR _tempx
	dec	ax
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 363
	push	WORD PTR [bp-4]	;clr
	push	WORD PTR _tempy
	mov	ax,WORD PTR _tempx
	dec	ax
	dec	ax
	push	ax
	mov	cx,WORD PTR _tempy
	dec	cx
	push	cx
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 364
	push	WORD PTR [bp-4]	;clr
	push	WORD PTR _tempy
	mov	ax,WORD PTR _tempx
	inc	ax
	inc	ax
	push	ax
	mov	cx,WORD PTR _tempy
	dec	cx
$L20016:
	push	cx
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 365
; Line 366
; Line 368
$I767:
	mov	bx,WORD PTR [bp+4]	;tc
	cmp	WORD PTR [bx+48],2
	je	$JCC2266
	jmp	$I770
$JCC2266:
; Line 369
	cmp	WORD PTR [bp+8],0	;dl
	je	$I771
; Line 370
	push	WORD PTR [bp-4]	;clr
	mov	ax,WORD PTR _tempy
	inc	ax
	inc	ax
	push	ax
	push	WORD PTR _tempx
	push	WORD PTR _tempy
	mov	ax,WORD PTR _tempx
	dec	ax
	dec	ax
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 371
	push	WORD PTR [bp-4]	;clr
	push	WORD PTR _tempy
	mov	ax,WORD PTR _tempx
	inc	ax
	inc	ax
	push	ax
	mov	ax,WORD PTR _tempy
	inc	ax
	inc	ax
	jmp	SHORT $L20017
$I771:
; Line 373
	push	WORD PTR [bp-4]	;clr
	mov	ax,WORD PTR _tempy
	dec	ax
	dec	ax
	push	ax
	push	WORD PTR _tempx
	push	WORD PTR _tempy
	mov	ax,WORD PTR _tempx
	dec	ax
	dec	ax
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 374
	push	WORD PTR [bp-4]	;clr
	push	WORD PTR _tempy
	mov	ax,WORD PTR _tempx
	inc	ax
	inc	ax
	push	ax
	mov	ax,WORD PTR _tempy
	dec	ax
	dec	ax
$L20017:
	push	ax
	push	WORD PTR _tempx
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 375
; Line 376
; Line 378
$I770:
	cmp	WORD PTR [bp+8],0	;dl
	jne	$I773
; Line 379
	cmp	WORD PTR _AWG9_MODE,116
	jne	$I774
$L20018:
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 380
$I774:
	cmp	WORD PTR _AWG9_MODE,114
	je	$L20018
; Line 381
	cmp	WORD PTR _AWG9_MODE,110
	je	$L20018
; Line 382
	cmp	WORD PTR _AWG9_MODE,112
	je	$L20018
; Line 383
; Line 386
$I773:
; Line 388
	mov	bx,WORD PTR [bp-24]	;tempps
	mov	ax,WORD PTR [bx+6]
	mov	cx,250
	cwd	
	idiv	cx
	mov	WORD PTR [bp-2],ax	;alt
	cmp	ax,5
	jle	$I778
	cmp	ax,15
	jg	$I778
; Line 389
	mov	ax,OFFSET DGROUP:$SG779
	push	ax
	mov	ax,WORD PTR _tempy
	dec	ax
	dec	ax
	push	ax
	mov	ax,WORD PTR _tempx
	sub	ax,6
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 390
$I778:
	cmp	WORD PTR [bp-2],15	;alt
	jle	$I780
	cmp	WORD PTR [bp-2],25	;alt
	jg	$I780
; Line 391
	mov	ax,OFFSET DGROUP:$SG781
	push	ax
	mov	ax,WORD PTR _tempy
	dec	ax
	dec	ax
	push	ax
	mov	ax,WORD PTR _tempx
	sub	ax,6
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 392
$I780:
	cmp	WORD PTR [bp-2],25	;alt
	jle	$I782
	cmp	WORD PTR [bp-2],35	;alt
	jg	$I782
; Line 393
	mov	ax,OFFSET DGROUP:$SG783
	push	ax
	mov	ax,WORD PTR _tempy
	dec	ax
	dec	ax
	push	ax
	mov	ax,WORD PTR _tempx
	sub	ax,6
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 394
$I782:
	cmp	WORD PTR [bp-2],35	;alt
	jle	$I784
	cmp	WORD PTR [bp-2],45	;alt
	jg	$I784
; Line 395
	mov	ax,OFFSET DGROUP:$SG785
	push	ax
	mov	ax,WORD PTR _tempy
	dec	ax
	dec	ax
	push	ax
	mov	ax,WORD PTR _tempx
	sub	ax,6
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 396
$I784:
	cmp	WORD PTR [bp-2],45	;alt
	jle	$I786
	cmp	WORD PTR [bp-2],55	;alt
	jg	$I786
; Line 397
	mov	ax,OFFSET DGROUP:$SG787
	push	ax
	mov	ax,WORD PTR _tempy
	dec	ax
	dec	ax
	push	ax
	mov	ax,WORD PTR _tempx
	sub	ax,6
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 400
$I786:
	cmp	WORD PTR _AWG9_MODE,300
	jne	$JCC2667
	jmp	$I801
$JCC2667:
; Line 401
	mov	WORD PTR [bp-40],0	;found
; Line 402
	mov	ax,30
	push	ax
	push	WORD PTR _AWG9_MODE
	call	_CheckMode
	add	sp,4
	or	ax,ax
	je	$I790
; Line 403
	mov	WORD PTR [bp-26],0	;i
	jmp	SHORT $F791
; Line 407
; Line 408
$FC792:
	inc	WORD PTR [bp-26]	;i
$F791:
	cmp	WORD PTR [bp-26],6	;i
	jge	$FB793
; Line 404
	mov	bx,WORD PTR [bp-26]	;i
	shl	bx,1
	mov	bx,WORD PTR _FIRINGORDERLIST[bx]
	mov	si,WORD PTR [bp+4]	;tc
	mov	ax,WORD PTR [si+26]
	cmp	WORD PTR [bx+26],ax
	jne	$FC792
; Line 405
	mov	WORD PTR [bp-40],1	;found
; Line 406
$FB793:
; Line 409
	mov	ax,WORD PTR [bp-26]	;i
	inc	ax
	jmp	SHORT $L20023
$I790:
; Line 411
	mov	WORD PTR [bp-26],0	;i
	jmp	SHORT $F796
; Line 418
; Line 419
	nop	
$I800:
; Line 420
	inc	WORD PTR [bp-26]	;i
$F796:
	cmp	WORD PTR [bp-26],5	;i
	jge	$FB798
; Line 413
	mov	cl,3
	mov	bx,WORD PTR [bp-26]	;i
	shl	bx,cl
	cmp	WORD PTR _DESIG_TARG[bx],1
	jne	$I800
; Line 414
	inc	WORD PTR [bp-18]	;cnt
; Line 415
	mov	si,WORD PTR [bp+4]	;tc
	mov	ax,WORD PTR [si+26]
	cmp	WORD PTR _DESIG_TARG[bx+2],ax
	jne	$I800
; Line 416
	mov	WORD PTR [bp-40],1	;found
; Line 417
$FB798:
; Line 421
	mov	ax,WORD PTR [bp-18]	;cnt
$L20023:
	mov	WORD PTR [bp-34],ax	;ipos
; Line 422
; Line 424
	cmp	WORD PTR [bp-40],0	;found
	je	$I801
; Line 425
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-14]	;s
	push	ax
	push	WORD PTR [bp-34]	;ipos
	call	_itoa
	add	sp,6
; Line 426
	lea	ax,WORD PTR [bp-14]	;s
	push	ax
	mov	ax,WORD PTR _tempy
	dec	ax
	dec	ax
	push	ax
	mov	ax,WORD PTR _tempx
	add	ax,4
	push	ax
	push	WORD PTR _RpCRT
	call	FAR PTR _RpPrint
	add	sp,8
; Line 427
; Line 428
$I801:
; Line 430
	mov	ax,WORD PTR [bp-16]	;d
	jmp	$S802
; Line 431
	nop	
$SC806:
; Line 433
	mov	ax,WORD PTR _tempx
	mov	WORD PTR [bp-30],ax	;x2
	mov	WORD PTR [bp-28],ax	;x1
; Line 434
	mov	ax,WORD PTR _tempy
	mov	WORD PTR [bp-32],ax	;y1
; Line 435
$L20019:
	sub	ax,WORD PTR [bp-42]	;taillength
$L20020:
	mov	WORD PTR [bp-38],ax	;y2
; Line 436
	jmp	$SB803
; Line 437
$SC807:
; Line 441
	mov	ax,WORD PTR _tempy
	mov	WORD PTR [bp-32],ax	;y1
	sub	ax,WORD PTR [bp-42]	;taillength
	mov	WORD PTR [bp-38],ax	;y2
; Line 442
	mov	ax,WORD PTR _tempx
	mov	WORD PTR [bp-28],ax	;x1
; Line 443
	add	ax,WORD PTR [bp-42]	;taillength
	mov	WORD PTR [bp-30],ax	;x2
; Line 444
	jmp	$SB803
; Line 445
	nop	
$SC808:
; Line 447
	mov	ax,WORD PTR _tempx
	mov	WORD PTR [bp-28],ax	;x1
	add	ax,WORD PTR [bp-42]	;taillength
	mov	WORD PTR [bp-30],ax	;x2
; Line 448
	mov	ax,WORD PTR _tempy
	mov	WORD PTR [bp-32],ax	;y1
	jmp	SHORT $L20020
; Line 451
$SC809:
; Line 455
	mov	ax,WORD PTR _tempy
	mov	WORD PTR [bp-32],ax	;y1
; Line 456
	mov	cx,WORD PTR _tempx
	mov	WORD PTR [bp-28],cx	;x1
	add	cx,WORD PTR [bp-42]	;taillength
$L20022:
	mov	WORD PTR [bp-30],cx	;x2
; Line 457
$L20021:
	add	ax,WORD PTR [bp-42]	;taillength
	jmp	SHORT $L20020
; Line 459
$SC810:
; Line 461
	mov	ax,WORD PTR _tempx
	mov	WORD PTR [bp-30],ax	;x2
	mov	WORD PTR [bp-28],ax	;x1
; Line 462
	mov	ax,WORD PTR _tempy
	mov	WORD PTR [bp-32],ax	;y1
	jmp	SHORT $L20021
; Line 465
	nop	
$SC811:
; Line 469
	mov	ax,WORD PTR _tempy
	mov	WORD PTR [bp-32],ax	;y1
; Line 470
	mov	cx,WORD PTR _tempx
	mov	WORD PTR [bp-28],cx	;x1
	sub	cx,WORD PTR [bp-42]	;taillength
	jmp	SHORT $L20022
; Line 473
$SC812:
; Line 475
	mov	ax,WORD PTR _tempy
	mov	WORD PTR [bp-32],ax	;y1
; Line 476
	mov	cx,WORD PTR _tempx
	mov	WORD PTR [bp-28],cx	;x1
	sub	cx,WORD PTR [bp-42]	;taillength
	mov	WORD PTR [bp-30],cx	;x2
	jmp	$L20020
; Line 479
$SC813:
; Line 483
	mov	ax,WORD PTR _tempy
	mov	WORD PTR [bp-32],ax	;y1
; Line 484
	mov	cx,WORD PTR _tempx
	mov	WORD PTR [bp-28],cx	;x1
	sub	cx,WORD PTR [bp-42]	;taillength
	mov	WORD PTR [bp-30],cx	;x2
	jmp	$L20019
$S802:
	cmp	ax,15
	ja	$SB803
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20006[bx]
	nop	
$L20006:
		DW	$SC806
		DW	$SC807
		DW	$SC807
		DW	$SC807
		DW	$SC808
		DW	$SC809
		DW	$SC809
		DW	$SC809
		DW	$SC810
		DW	$SC811
		DW	$SC811
		DW	$SC811
		DW	$SC812
		DW	$SC813
		DW	$SC813
		DW	$SC813
$SB803:
; Line 488
	push	WORD PTR [bp-4]	;clr
	push	WORD PTR [bp-38]	;y2
	push	WORD PTR [bp-30]	;x2
	push	WORD PTR [bp-32]	;y1
	push	WORD PTR [bp-28]	;x1
	push	WORD PTR _RpCRT
	call	FAR PTR _DrawLine
	add	sp,12
; Line 489
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_TID_draw_target	ENDP
_TEXT	ENDS
END
