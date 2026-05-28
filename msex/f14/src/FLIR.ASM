;	Static Name Aliases
;
;	$S618_HudIntensity	EQU	HudIntensity
;	$S652_OldNight	EQU	OldNight
;	$S653_OldClouds	EQU	OldClouds
;	$S654_OldCycle	EQU	OldCycle
;	$S655_NextPalFrame	EQU	NextPalFrame
;	$S656_OldPal	EQU	OldPal
;	$S742_ix	EQU	ix
;	$S743_jx	EQU	jx
	TITLE   C:\FLIR.C
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
PUBLIC  _BlueFlame
PUBLIC  _WorldColor
PUBLIC  _OrangeFlame
PUBLIC  _SelectedPal
PUBLIC  _LightsOn
PUBLIC  _OverG
PUBLIC  _PaletteChanged
PUBLIC  _HUDFilterMode
PUBLIC  _OldG
PUBLIC  _OldOvercast
EXTRN	_abs:NEAR
EXTRN	_Sound:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_MCGAColors:NEAR
EXTRN	_LoadPalToPal:NEAR
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Night:WORD
_BSS      SEGMENT
COMM NEAR	_Screen:	BYTE:	 4
COMM NEAR	_Source:	BYTE:	 4
COMM FAR	_Palette:	 1:	 768
COMM FAR	_NitePal:	 1:	 768
COMM FAR	_DayPal:	 1:	 768
COMM FAR	_DawnPal:	 1:	 768
COMM FAR	_DuskPal:	 1:	 768
_BSS      ENDS
EXTRN	_View:WORD
_BSS      SEGMENT
COMM NEAR	_CLOUDAMNT:	BYTE:	 2
COMM NEAR	_TransAmount:	BYTE:	 2
COMM NEAR	_D:	BYTE:	 14
COMM NEAR	_S:	BYTE:	 8
_BSS      ENDS
EXTRN	_InXPLO:WORD
EXTRN	_TimeOfDay:WORD
EXTRN	_FlirTbl:BYTE
EXTRN	_OVERCAST:WORD
EXTRN	_GAMNT:WORD
EXTRN	_BackSeat:WORD
_DATA      SEGMENT
	ORG	$+340
$SG765	DB	'DAYPAL.pic',  00H
$SG770	DB	'NITEPAL.pic',  00H
$SG775	DB	'DAWNPAL.pic',  00H
$SG780	DB	'DUSKPAL.pic',  00H
	ORG	$-387
_WorldColor	DB	00H
	DB	02H
	DB	00H
	DB	02H
	DB	00H
	DB	00H
	DB	00H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	00H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	02H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	02H
	DB	02H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	01H
	DB	00H
_SelectedPal	DW	00H
_LightsOn	DW	00H
_OverG	DW	00H
_PaletteChanged	DW	00H
_HUDFilterMode	DW	00H
$S618_HudIntensity	DW	01fH
_OldG	DW	00H
_OldOvercast	DW	00H
$S652_OldNight	DW	00H
$S653_OldClouds	DW	00H
$S654_OldCycle	DW	00H
$S655_NextPalFrame	DW	00H
$S656_OldPal	DW	00H
_BlueFlame	DB	03fH
	DB	03fH
	DB	03fH
	DB	03cH
	DB	03eH
	DB	03fH
	DB	035H
	DB	03cH
	DB	03fH
	DB	02fH
	DB	039H
	DB	03fH
	DB	02bH
	DB	038H
	DB	03fH
	DB	028H
	DB	037H
	DB	03fH
	DB	032H
	DB	03bH
	DB	03fH
	DB	038H
	DB	03dH
	DB	03fH
_OrangeFlame	DB	03eH
	DB	03fH
	DB	016H
	DB	03dH
	DB	039H
	DB	015H
	DB	03dH
	DB	031H
	DB	015H
	DB	03dH
	DB	029H
	DB	015H
	DB	03dH
	DB	021H
	DB	015H
	DB	03dH
	DB	019H
	DB	015H
	DB	03dH
	DB	021H
	DB	015H
	DB	03dH
	DB	029H
	DB	015H
	DB	03dH
	DB	031H
	DB	015H
	DB	03dH
	DB	039H
	DB	015H
$S742_ix	DW	00H
$S743_jx	DW	00H
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
; Line 81
_TEXT      ENDS
CONST      SEGMENT
$T20001	DW SEG _Palette 
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_InitFlir
_InitFlir	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	i = -2
;	j = -4
; Line 84
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;i
	mov	WORD PTR [bp-4],ax	;j
	jmp	SHORT $F637
	nop	
$FC638:
; Line 85
	mov	es,WORD PTR $T20001
	mov	bx,WORD PTR [bp-4]	;j
	mov	al,59
	mul	BYTE PTR es:_Palette[bx+1]
	mov	cl,BYTE PTR es:_Palette[bx+2]
	sub	ch,ch
	mov	dx,cx
	shl	cx,1
	shl	cx,1
	add	cx,dx
	shl	cx,1
	add	cx,dx
	add	ax,cx
	mov	cx,ax
	mov	al,30
	mul	BYTE PTR es:_Palette[bx]
	add	ax,cx
	mov	cx,832
	cwd	
	idiv	cx
	add	al,82
	mov	bx,WORD PTR [bp-2]	;i
	mov	BYTE PTR _FlirTbl[bx],al
; Line 86
	inc	WORD PTR [bp-2]	;i
	add	WORD PTR [bp-4],3	;j
$F637:
	cmp	WORD PTR [bp-2],256	;i
	jl	$FC638
; Line 90
	mov	al,151
	mov	BYTE PTR _FlirTbl+10,al
	mov	BYTE PTR _FlirTbl+151,al
	mov	BYTE PTR _FlirTbl+15,al
; Line 91
	mov	BYTE PTR _FlirTbl+7,91
; Line 93
	call	_TimeConditionCheck
; Line 94
	mov	sp,bp
	pop	bp
	ret	

_InitFlir	ENDP
; Line 98
	PUBLIC	_UpdatePalBuf
_UpdatePalBuf	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	i = -2
;	j = -4
;	PalPkt = 4
; Line 106
	mov	bx,WORD PTR [bp+4]	;PalPkt
	cmp	BYTE PTR [bx],77
	jne	$I646
	cmp	BYTE PTR [bx+1],48
	jne	$I646
; Line 107
	mov	WORD PTR [bp-4],6	;j
	mov	al,BYTE PTR [bx+4]
	sub	ah,ah
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	mov	WORD PTR [bp-2],ax	;i
	jmp	SHORT $F647
	nop	
$FC648:
; Line 108
	mov	bx,WORD PTR [bp-4]	;j
	mov	si,WORD PTR [bp+4]	;PalPkt
	mov	al,BYTE PTR [bx][si]
	mov	es,WORD PTR $T20001
	mov	bx,WORD PTR [bp-2]	;i
	mov	BYTE PTR es:_Palette[bx],al
; Line 109
	inc	WORD PTR [bp-2]	;i
	inc	WORD PTR [bp-4]	;j
$F647:
	mov	bx,WORD PTR [bp+4]	;PalPkt
	mov	al,BYTE PTR [bx+5]
	sub	ah,ah
	inc	ax
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	cmp	ax,WORD PTR [bp-2]	;i
	jg	$FC648
; Line 110
	mov	WORD PTR _PaletteChanged,1
; Line 111
; Line 112
$I646:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_UpdatePalBuf	ENDP
; Line 118
	PUBLIC	_UpdatePalette
_UpdatePalette	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 125
	cmp	WORD PTR _PaletteChanged,0
	jne	$I657
	xor	WORD PTR $S655_NextPalFrame,1
	je	$I657
; Line 126
	mov	ax,1
	ret	
; Line 128
	nop	
$I657:
	call	_FireColors
; Line 130
	push	WORD PTR _GAMNT
	call	_abs
	add	sp,2
	cmp	ax,30
	jge	$I660
; Line 131
	mov	WORD PTR _OverG,0
; Line 132
	jmp	SHORT $I662
$I660:
	cmp	WORD PTR _OverG,0
	jne	$I662
; Line 133
	mov	WORD PTR _OverG,1
; Line 134
; Line 136
$I662:
	mov	ax,WORD PTR _OldG
	cmp	WORD PTR _GAMNT,ax
	je	$I663
; Line 137
	push	WORD PTR _GAMNT
	call	_abs
	add	sp,2
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	shl	ax,1
	shl	ax,1
	sub	ax,cx
	mov	cx,100
	cwd	
	idiv	cx
	push	ax
	mov	ax,2
	push	ax
	mov	ax,38
	push	ax
	call	_Sound
	add	sp,6
; Line 138
; Line 140
$I663:
	call	_TimeConditionCheck
; Line 142
	mov	ax,WORD PTR _GAMNT
	mov	WORD PTR _OldG,ax
; Line 145
	mov	cx,WORD PTR $S652_OldNight
	cmp	WORD PTR _TransAmount,cx
	jne	$I666
	mov	cx,WORD PTR $S656_OldPal
	cmp	WORD PTR _SelectedPal,cx
	jne	$I666
	mov	cx,WORD PTR _CLOUDAMNT
	cmp	WORD PTR $S653_OldClouds,cx
	jne	$I666
	cmp	WORD PTR _PaletteChanged,0
	jne	$I666
	cmp	WORD PTR _InXPLO,0
	jne	$I666
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,100
	je	$I666
	mov	ax,WORD PTR _OldOvercast
	cmp	WORD PTR _OVERCAST,ax
	je	$I665
$I666:
; Line 147
	mov	ax,WORD PTR _InXPLO
	add	WORD PTR _CLOUDAMNT,ax
	cmp	WORD PTR _CLOUDAMNT,100
	jle	$I667
	mov	WORD PTR _CLOUDAMNT,100
; Line 148
$I667:
	or	ax,ax
	je	$I668
	mov	WORD PTR _InXPLO,100
; Line 150
$I668:
	mov	ax,WORD PTR _InXPLO
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,52
	neg	ax
	push	ax
	push	ax
	push	ax
	call	_NSetGreyPal
	add	sp,6
; Line 153
	mov	ax,WORD PTR _TransAmount
	mov	WORD PTR $S652_OldNight,ax
; Line 154
	mov	ax,WORD PTR _SelectedPal
	mov	WORD PTR $S656_OldPal,ax
; Line 155
	mov	ax,WORD PTR _CLOUDAMNT
	mov	WORD PTR $S653_OldClouds,ax
; Line 156
	mov	ax,WORD PTR _GAMNT
	mov	WORD PTR _OldG,ax
; Line 157
	mov	ax,WORD PTR _OVERCAST
	mov	WORD PTR _OldOvercast,ax
; Line 158
	sub	ax,ax
	mov	WORD PTR _InXPLO,ax
	mov	WORD PTR _PaletteChanged,ax
; Line 159
; Line 160
$I665:
	ret	

_UpdatePalette	ENDP
; Line 164
	PUBLIC	_TimeConditionCheck
_TimeConditionCheck	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 165
	cmp	WORD PTR _TimeOfDay,300
	ja	$I671
; Line 167
	mov	WORD PTR _TransAmount,0
; Line 168
	mov	WORD PTR _SelectedPal,5
; Line 170
	mov	ax,1
	mov	WORD PTR _LightsOn,ax
	mov	WORD PTR _Night,ax
; Line 171
; Line 172
$I671:
	cmp	WORD PTR _TimeOfDay,300
	jb	$I672
	cmp	WORD PTR _TimeOfDay,360
	ja	$I672
; Line 174
	mov	ax,WORD PTR _TimeOfDay
	sub	ax,300
	mov	WORD PTR _TransAmount,ax
; Line 175
	mov	WORD PTR _SelectedPal,0
; Line 177
	mov	ax,1
	mov	WORD PTR _LightsOn,ax
	mov	WORD PTR _Night,ax
; Line 178
; Line 179
$I672:
	cmp	WORD PTR _TimeOfDay,360
	jb	$I673
	cmp	WORD PTR _TimeOfDay,420
	ja	$I673
; Line 181
	mov	ax,WORD PTR _TimeOfDay
	sub	ax,360
	mov	WORD PTR _TransAmount,ax
; Line 183
	mov	ax,1
	mov	WORD PTR _SelectedPal,ax
	mov	WORD PTR _LightsOn,ax
; Line 184
	mov	WORD PTR _Night,0
; Line 185
; Line 186
$I673:
	cmp	WORD PTR _TimeOfDay,420
	jb	$I674
	cmp	WORD PTR _TimeOfDay,1080
	ja	$I674
; Line 188
	mov	WORD PTR _TransAmount,0
; Line 189
	mov	WORD PTR _SelectedPal,2
; Line 191
	sub	ax,ax
	mov	WORD PTR _LightsOn,ax
	mov	WORD PTR _Night,ax
; Line 192
; Line 193
$I674:
	cmp	WORD PTR _TimeOfDay,1080
	jb	$I675
	cmp	WORD PTR _TimeOfDay,1140
	ja	$I675
; Line 195
	mov	ax,WORD PTR _TimeOfDay
	sub	ax,1080
	mov	WORD PTR _TransAmount,ax
; Line 196
	mov	WORD PTR _SelectedPal,3
; Line 198
	sub	ax,ax
	mov	WORD PTR _LightsOn,ax
	mov	WORD PTR _Night,ax
; Line 199
; Line 200
$I675:
	cmp	WORD PTR _TimeOfDay,1140
	jbe	$I676
	cmp	WORD PTR _TimeOfDay,1200
	ja	$I676
; Line 202
	mov	ax,WORD PTR _TimeOfDay
	sub	ax,1140
	mov	WORD PTR _TransAmount,ax
; Line 203
	mov	WORD PTR _SelectedPal,4
; Line 205
	mov	ax,1
	mov	WORD PTR _LightsOn,ax
	mov	WORD PTR _Night,ax
; Line 206
; Line 207
$I676:
	cmp	WORD PTR _TimeOfDay,1200
	jb	$I677
	cmp	WORD PTR _TimeOfDay,1440
	ja	$I677
; Line 209
	mov	WORD PTR _TransAmount,0
; Line 210
	mov	WORD PTR _SelectedPal,5
; Line 212
	mov	ax,1
	mov	WORD PTR _LightsOn,ax
	mov	WORD PTR _Night,ax
; Line 213
; Line 214
$I677:
	ret	
	nop	

_TimeConditionCheck	ENDP
; Line 219
_TEXT      ENDS
CONST      SEGMENT
$T20002	DW SEG _DawnPal 
$T20003	DW SEG _NitePal 
$T20004	DW SEG _DayPal 
$T20005	DW SEG _DuskPal 
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_NSetGreyPal
_NSetGreyPal	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,790
	call	__aNchkstk
	push	di
	push	si
;	i = -16
;	j = -18
;	palpos = -790
;	A = -8
;	P = -4
;	R = -12
;	G = -14
;	B = -10
;	N = -20
;	CockpitLast = -6
;	TBLOCK = -788
;	TB = 8
;	TG = 6
;	TR = 4
; Line 229
	mov	WORD PTR [bp-16],0	;i
	mov	WORD PTR [bp-4],OFFSET _Palette	;P
	mov	WORD PTR [bp-2],SEG _Palette
	jmp	SHORT $F693
$FC694:
; Line 230
	les	bx,DWORD PTR [bp-4]	;P
	mov	al,BYTE PTR es:[bx]
	mov	si,WORD PTR [bp-16]	;i
	mov	BYTE PTR [bp-788][si],al
; Line 231
	inc	WORD PTR [bp-16]	;i
	inc	WORD PTR [bp-4]	;P
$F693:
	cmp	WORD PTR [bp-16],768	;i
	jl	$FC694
; Line 233
	mov	ax,WORD PTR _SelectedPal
	jmp	$S696
; Line 234
$SC700:
; Line 235
	sub	ax,ax
	mov	WORD PTR [bp-16],ax	;i
	mov	WORD PTR [bp-790],ax	;palpos
	jmp	SHORT $F701
	nop	
$FC702:
	inc	WORD PTR [bp-16]	;i
	add	WORD PTR [bp-790],3	;palpos
$F701:
	cmp	WORD PTR [bp-16],256	;i
	jl	$JCC855
	jmp	$SB697
$JCC855:
; Line 236
	mov	bx,WORD PTR [bp-16]	;i
	cmp	BYTE PTR _WorldColor[bx],1
	je	$I706
	cmp	BYTE PTR _WorldColor[bx],2
	jne	$FC702
	cmp	WORD PTR _BackSeat,0
	jne	$FC702
	cmp	WORD PTR _View,0
	je	$I706
	cmp	WORD PTR _View,3
	jne	$FC702
$I706:
; Line 237
	mov	es,WORD PTR $T20002
	mov	bx,WORD PTR [bp-790]	;palpos
	mov	al,BYTE PTR es:_DawnPal[bx]
	sub	ah,ah
	mov	es,WORD PTR $T20003
	mov	cl,BYTE PTR es:_NitePal[bx]
	mov	dx,cx
	sub	ch,ch
	sub	ax,cx
	mov	cx,dx
	mul	WORD PTR _TransAmount
	mov	si,60
	sub	dx,dx
	div	si
	add	cl,al
	mov	di,bx
	mov	BYTE PTR [bp-788][di],cl
; Line 238
	mov	es,WORD PTR $T20002
	mov	al,BYTE PTR es:_DawnPal[bx+1]
	sub	ah,ah
	mov	es,WORD PTR $T20003
	mov	cl,BYTE PTR es:_NitePal[bx+1]
	mov	dx,cx
	sub	ch,ch
	sub	ax,cx
	mov	cx,dx
	mul	WORD PTR _TransAmount
	sub	dx,dx
	div	si
	add	cl,al
	mov	BYTE PTR [bp-787][di],cl
; Line 239
	mov	es,WORD PTR $T20002
	mov	al,BYTE PTR es:_DawnPal[bx+2]
	sub	ah,ah
	mov	es,WORD PTR $T20003
	mov	cl,BYTE PTR es:_NitePal[bx+2]
	mov	dx,cx
	sub	ch,ch
	sub	ax,cx
	mov	cx,dx
	mul	WORD PTR _TransAmount
	sub	dx,dx
	div	si
	add	cl,al
	mov	BYTE PTR [bp-786][di],cl
; Line 240
; Line 241
	jmp	$FC702
$SC707:
; Line 244
	sub	ax,ax
	mov	WORD PTR [bp-16],ax	;i
	mov	WORD PTR [bp-790],ax	;palpos
	jmp	SHORT $F708
	nop	
$FC709:
	inc	WORD PTR [bp-16]	;i
	add	WORD PTR [bp-790],3	;palpos
$F708:
	cmp	WORD PTR [bp-16],256	;i
	jl	$JCC1061
	jmp	$SB697
$JCC1061:
; Line 245
	mov	bx,WORD PTR [bp-16]	;i
	cmp	BYTE PTR _WorldColor[bx],1
	jne	$FC709
; Line 246
	mov	es,WORD PTR $T20004
	mov	bx,WORD PTR [bp-790]	;palpos
	mov	al,BYTE PTR es:_DayPal[bx]
	sub	ah,ah
	mov	es,WORD PTR $T20002
	mov	cl,BYTE PTR es:_DawnPal[bx]
	mov	dx,cx
	sub	ch,ch
	sub	ax,cx
	mov	cx,dx
	mul	WORD PTR _TransAmount
	mov	si,60
	sub	dx,dx
	div	si
	add	cl,al
	mov	di,bx
	mov	BYTE PTR [bp-788][di],cl
; Line 247
	mov	es,WORD PTR $T20004
	mov	al,BYTE PTR es:_DayPal[bx+1]
	sub	ah,ah
	mov	es,WORD PTR $T20002
	mov	cl,BYTE PTR es:_DawnPal[bx+1]
	mov	dx,cx
	sub	ch,ch
	sub	ax,cx
	mov	cx,dx
	mul	WORD PTR _TransAmount
	sub	dx,dx
	div	si
	add	cl,al
	mov	BYTE PTR [bp-787][di],cl
; Line 248
	mov	es,WORD PTR $T20004
	mov	al,BYTE PTR es:_DayPal[bx+2]
	sub	ah,ah
	mov	es,WORD PTR $T20002
	mov	cl,BYTE PTR es:_DawnPal[bx+2]
	mov	dx,cx
	sub	ch,ch
	sub	ax,cx
	mov	cx,dx
	mul	WORD PTR _TransAmount
	sub	dx,dx
	div	si
	add	cl,al
	mov	BYTE PTR [bp-786][di],cl
; Line 249
; Line 250
	jmp	$FC709
$SC712:
; Line 253
	sub	ax,ax
	mov	WORD PTR [bp-16],ax	;i
	mov	WORD PTR [bp-790],ax	;palpos
	jmp	SHORT $F713
	nop	
$FC714:
	inc	WORD PTR [bp-16]	;i
	add	WORD PTR [bp-790],3	;palpos
$F713:
	cmp	WORD PTR [bp-16],256	;i
	jl	$JCC1239
	jmp	$SB697
$JCC1239:
; Line 254
	mov	bx,WORD PTR [bp-16]	;i
	cmp	BYTE PTR _WorldColor[bx],1
	jne	$I716
; Line 255
	mov	es,WORD PTR $T20004
	mov	bx,WORD PTR [bp-790]	;palpos
	mov	al,BYTE PTR es:_DayPal[bx]
	mov	si,bx
	mov	BYTE PTR [bp-788][si],al
; Line 256
	mov	al,BYTE PTR es:_DayPal[bx+1]
	mov	BYTE PTR [bp-787][si],al
; Line 257
	mov	al,BYTE PTR es:_DayPal[bx+2]
	mov	BYTE PTR [bp-786][si],al
; Line 258
; Line 259
$I716:
	mov	bx,WORD PTR [bp-16]	;i
	cmp	BYTE PTR _WorldColor[bx],1
	jne	$FC714
; Line 260
	mov	ax,WORD PTR [bp+4]	;TR
	mov	si,WORD PTR [bp-790]	;palpos
	mov	cl,BYTE PTR [bp-788][si]
	sub	ch,ch
	sub	ax,cx
	imul	WORD PTR _CLOUDAMNT
	mov	cx,100
	cwd	
	idiv	cx
	add	BYTE PTR [bp-788][si],al
; Line 261
	mov	ax,WORD PTR [bp+6]	;TG
	mov	dl,BYTE PTR [bp-787][si]
	sub	dh,dh
	sub	ax,dx
	imul	WORD PTR _CLOUDAMNT
	cwd	
	idiv	cx
	add	BYTE PTR [bp-787][si],al
; Line 262
	mov	ax,WORD PTR [bp+8]	;TB
	mov	dl,BYTE PTR [bp-786][si]
	sub	dh,dh
	sub	ax,dx
	imul	WORD PTR _CLOUDAMNT
	cwd	
	idiv	cx
	add	BYTE PTR [bp-786][si],al
; Line 263
; Line 264
	jmp	$FC714
	nop	
$SC718:
; Line 267
	sub	ax,ax
	mov	WORD PTR [bp-16],ax	;i
	mov	WORD PTR [bp-790],ax	;palpos
	jmp	SHORT $F719
	nop	
$FC720:
	inc	WORD PTR [bp-16]	;i
	add	WORD PTR [bp-790],3	;palpos
$F719:
	cmp	WORD PTR [bp-16],256	;i
	jl	$JCC1403
	jmp	$SB697
$JCC1403:
; Line 268
	mov	bx,WORD PTR [bp-16]	;i
	cmp	BYTE PTR _WorldColor[bx],1
	jne	$FC720
; Line 270
	cmp	WORD PTR _TransAmount,5
	jae	$I723
	mov	WORD PTR _TransAmount,5
; Line 271
$I723:
	mov	es,WORD PTR $T20005
	mov	bx,WORD PTR [bp-790]	;palpos
	mov	al,BYTE PTR es:_DuskPal[bx]
	sub	ah,ah
	mov	es,WORD PTR $T20004
	mov	cl,BYTE PTR es:_DayPal[bx]
	mov	dx,cx
	sub	ch,ch
	sub	ax,cx
	mov	cx,dx
	mul	WORD PTR _TransAmount
	mov	si,60
	sub	dx,dx
	div	si
	add	cl,al
	mov	di,bx
	mov	BYTE PTR [bp-788][di],cl
; Line 272
	mov	es,WORD PTR $T20005
	mov	al,BYTE PTR es:_DuskPal[bx+1]
	sub	ah,ah
	mov	es,WORD PTR $T20004
	mov	cl,BYTE PTR es:_DayPal[bx+1]
	mov	dx,cx
	sub	ch,ch
	sub	ax,cx
	mov	cx,dx
	mul	WORD PTR _TransAmount
	sub	dx,dx
	div	si
	add	cl,al
	mov	BYTE PTR [bp-787][di],cl
; Line 273
	mov	es,WORD PTR $T20005
	mov	al,BYTE PTR es:_DuskPal[bx+2]
	sub	ah,ah
	mov	es,WORD PTR $T20004
	mov	cl,BYTE PTR es:_DayPal[bx+2]
	mov	dx,cx
	sub	ch,ch
	sub	ax,cx
	mov	cx,dx
	mul	WORD PTR _TransAmount
	sub	dx,dx
	div	si
	add	cl,al
	mov	BYTE PTR [bp-786][di],cl
; Line 274
; Line 275
	jmp	$FC720
	nop	
$SC724:
; Line 278
	sub	ax,ax
	mov	WORD PTR [bp-16],ax	;i
	mov	WORD PTR [bp-790],ax	;palpos
	jmp	SHORT $F725
	nop	
$FC726:
	inc	WORD PTR [bp-16]	;i
	add	WORD PTR [bp-790],3	;palpos
$F725:
	cmp	WORD PTR [bp-16],256	;i
	jl	$JCC1595
	jmp	$SB697
$JCC1595:
; Line 279
	mov	bx,WORD PTR [bp-16]	;i
	cmp	BYTE PTR _WorldColor[bx],1
	je	$I730
	cmp	BYTE PTR _WorldColor[bx],2
	jne	$FC726
	cmp	WORD PTR _BackSeat,0
	jne	$FC726
	cmp	WORD PTR _View,0
	je	$I730
	cmp	WORD PTR _View,3
	jne	$FC726
$I730:
; Line 280
	mov	es,WORD PTR $T20003
	mov	bx,WORD PTR [bp-790]	;palpos
	mov	al,BYTE PTR es:_NitePal[bx]
	sub	ah,ah
	mov	es,WORD PTR $T20005
	mov	cl,BYTE PTR es:_DuskPal[bx]
	mov	dx,cx
	sub	ch,ch
	sub	ax,cx
	mov	cx,dx
	mul	WORD PTR _TransAmount
	mov	si,60
	sub	dx,dx
	div	si
	add	cl,al
	mov	di,bx
	mov	BYTE PTR [bp-788][di],cl
; Line 281
	mov	es,WORD PTR $T20003
	mov	al,BYTE PTR es:_NitePal[bx+1]
	sub	ah,ah
	mov	es,WORD PTR $T20005
	mov	cl,BYTE PTR es:_DuskPal[bx+1]
	mov	dx,cx
	sub	ch,ch
	sub	ax,cx
	mov	cx,dx
	mul	WORD PTR _TransAmount
	sub	dx,dx
	div	si
	add	cl,al
	mov	BYTE PTR [bp-787][di],cl
; Line 282
	mov	es,WORD PTR $T20003
	mov	al,BYTE PTR es:_NitePal[bx+2]
	sub	ah,ah
	mov	es,WORD PTR $T20005
	mov	cl,BYTE PTR es:_DuskPal[bx+2]
	mov	dx,cx
	sub	ch,ch
	sub	ax,cx
	mov	cx,dx
	mul	WORD PTR _TransAmount
	sub	dx,dx
	div	si
	add	cl,al
	mov	BYTE PTR [bp-786][di],cl
; Line 283
; Line 284
	jmp	$FC726
$SC731:
; Line 287
	sub	ax,ax
	mov	WORD PTR [bp-16],ax	;i
	mov	WORD PTR [bp-790],ax	;palpos
	jmp	SHORT $F732
	nop	
$FC733:
	inc	WORD PTR [bp-16]	;i
	add	WORD PTR [bp-790],3	;palpos
$F732:
	cmp	WORD PTR [bp-16],256	;i
	jge	$SB697
; Line 288
	mov	bx,WORD PTR [bp-16]	;i
	cmp	BYTE PTR _WorldColor[bx],1
	je	$I737
	cmp	BYTE PTR _WorldColor[bx],2
	jne	$FC733
	cmp	WORD PTR _BackSeat,0
	jne	$FC733
	cmp	WORD PTR _View,0
	je	$I737
	cmp	WORD PTR _View,3
	jne	$FC733
$I737:
; Line 289
	mov	es,WORD PTR $T20003
	mov	bx,WORD PTR [bp-790]	;palpos
	mov	al,BYTE PTR es:_NitePal[bx]
	mov	si,bx
	mov	BYTE PTR [bp-788][si],al
; Line 290
	mov	al,BYTE PTR es:_NitePal[bx+1]
	mov	BYTE PTR [bp-787][si],al
; Line 291
	mov	al,BYTE PTR es:_NitePal[bx+2]
	mov	BYTE PTR [bp-786][si],al
; Line 292
; Line 293
	jmp	SHORT $FC733
$S696:
	cmp	ax,5
	ja	$SB697
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20006[bx]
	nop	
$L20006:
		DW	$SC700
		DW	$SC707
		DW	$SC712
		DW	$SC718
		DW	$SC724
		DW	$SC731
$SB697:
; Line 297
	lea	ax,WORD PTR [bp-788]	;TBLOCK
	push	ax
	mov	ax,256
	push	ax
	sub	ax,ax
	push	ax
	call	_MCGAColors
	add	sp,6
; Line 298
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_NSetGreyPal	ENDP
; Line 315
	PUBLIC	_FireColors
_FireColors	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	Buf = -6
; Line 321
	mov	bx,WORD PTR $S743_jx
	mov	al,BYTE PTR _OrangeFlame[bx]
	mov	BYTE PTR [bp-6],al	;Buf
	mov	es,WORD PTR $T20001
	mov	BYTE PTR es:_Palette+276,al
; Line 322
	inc	WORD PTR $S743_jx
	mov	bx,WORD PTR $S743_jx
	mov	al,BYTE PTR _OrangeFlame[bx]
	mov	BYTE PTR [bp-5],al
	mov	BYTE PTR es:_Palette+277,al
; Line 323
	inc	bx
	mov	WORD PTR $S743_jx,bx
	mov	al,BYTE PTR _OrangeFlame[bx]
	mov	BYTE PTR [bp-4],al
	lea	ax,WORD PTR [bx+1]
	mov	WORD PTR $S743_jx,ax
	mov	al,BYTE PTR [bp-4]
	mov	BYTE PTR es:_Palette+278,al
; Line 324
	mov	bx,WORD PTR $S742_ix
	mov	al,BYTE PTR _BlueFlame[bx]
	mov	BYTE PTR [bp-3],al
	mov	BYTE PTR es:_Palette+279,al
; Line 325
	inc	WORD PTR $S742_ix
	mov	bx,WORD PTR $S742_ix
	mov	al,BYTE PTR _BlueFlame[bx]
	mov	BYTE PTR [bp-2],al
	mov	BYTE PTR es:_Palette+280,al
; Line 326
	inc	bx
	mov	WORD PTR $S742_ix,bx
	mov	al,BYTE PTR _BlueFlame[bx]
	mov	BYTE PTR [bp-1],al
	lea	ax,WORD PTR [bx+1]
	mov	WORD PTR $S742_ix,ax
	mov	al,BYTE PTR [bp-1]
	mov	BYTE PTR es:_Palette+281,al
; Line 328
	lea	ax,WORD PTR [bp-6]	;Buf
	push	ax
	mov	ax,2
	push	ax
	mov	ax,92
	push	ax
	call	_MCGAColors
	add	sp,6
; Line 330
	cmp	WORD PTR $S743_jx,30
	jl	$I745
	mov	WORD PTR $S743_jx,0
; Line 331
$I745:
	cmp	WORD PTR $S742_ix,24
	jl	$I746
	mov	WORD PTR $S742_ix,0
; Line 332
$I746:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_FireColors	ENDP
; Line 336
	PUBLIC	_ChangeHUDColor
_ChangeHUDColor	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	Buf = -4
;	change = 4
; Line 341
	mov	ax,WORD PTR [bp+4]	;change
	add	WORD PTR $S618_HudIntensity,ax
	jns	$I751
	mov	WORD PTR $S618_HudIntensity,0
; Line 342
$I751:
	cmp	WORD PTR $S618_HudIntensity,31
	jle	$I752
	mov	WORD PTR $S618_HudIntensity,31
; Line 344
$I752:
; Line 345
	mov	al,BYTE PTR $S618_HudIntensity
	add	al,32
	mov	BYTE PTR [bp-3],al
	mov	es,WORD PTR $T20001
	mov	BYTE PTR es:_Palette+19,al
; Line 346
	sub	al,al
	mov	BYTE PTR [bp-4],al	;Buf
	mov	BYTE PTR es:_Palette+18,al
	mov	BYTE PTR [bp-2],al
	mov	BYTE PTR es:_Palette+20,al
; Line 348
	lea	ax,WORD PTR [bp-4]	;Buf
	push	ax
	mov	ax,1
	push	ax
	mov	ax,6
	push	ax
	call	_MCGAColors
; Line 349
	mov	sp,bp
	pop	bp
	ret	

_ChangeHUDColor	ENDP
; Line 353
	PUBLIC	_ChangeHUDFilter
_ChangeHUDFilter	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	Buf = -4
; Line 356
	mov	al,100
	mov	BYTE PTR [bp-4],al	;Buf
	mov	es,WORD PTR $T20001
	mov	BYTE PTR es:_Palette+18,al
; Line 357
	mov	al,53
	mov	BYTE PTR [bp-3],al
	mov	BYTE PTR es:_Palette+19,al
; Line 358
	sub	al,al
	mov	BYTE PTR [bp-2],al
	mov	BYTE PTR es:_Palette+20,al
; Line 360
	lea	ax,WORD PTR [bp-4]	;Buf
	push	ax
	mov	ax,1
	push	ax
	mov	ax,6
	push	ax
	call	_MCGAColors
; Line 361
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ChangeHUDFilter	ENDP
; Line 365
	PUBLIC	_InitSpecialPal
_InitSpecialPal	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,782
	call	__aNchkstk
	push	si
;	i = -6
;	j = -8
;	PalPkt = -782
;	P = -4
; Line 371
	mov	WORD PTR [bp-6],0	;i
	mov	WORD PTR [bp-4],OFFSET _Palette	;P
	mov	WORD PTR [bp-2],SEG _Palette
	jmp	SHORT $F762
	nop	
$FC763:
; Line 372
	les	bx,DWORD PTR [bp-4]	;P
	mov	al,BYTE PTR es:[bx]
	mov	es,WORD PTR $T20004
	mov	bx,WORD PTR [bp-6]	;i
	mov	BYTE PTR es:_DayPal[bx],al
; Line 373
	les	si,DWORD PTR [bp-4]	;P
	mov	al,BYTE PTR es:[si]
	mov	es,WORD PTR $T20003
	mov	BYTE PTR es:_NitePal[bx],al
; Line 374
	les	si,DWORD PTR [bp-4]	;P
	mov	al,BYTE PTR es:[si]
	mov	es,WORD PTR $T20002
	mov	BYTE PTR es:_DawnPal[bx],al
; Line 375
	les	si,DWORD PTR [bp-4]	;P
	mov	al,BYTE PTR es:[si]
	mov	es,WORD PTR $T20005
	mov	BYTE PTR es:_DuskPal[bx],al
; Line 376
	inc	WORD PTR [bp-6]	;i
	inc	WORD PTR [bp-4]	;P
$F762:
	cmp	WORD PTR [bp-6],768	;i
	jl	$FC763
; Line 378
	lea	ax,WORD PTR [bp-782]	;PalPkt
	push	ax
	mov	cx,OFFSET DGROUP:$SG765
	push	cx
	call	_LoadPalToPal
	add	sp,4
; Line 380
	cmp	BYTE PTR [bp-782],77	;PalPkt
	jne	$I766
	cmp	BYTE PTR [bp-781],48
	jne	$I766
; Line 381
	mov	WORD PTR [bp-8],6	;j
	mov	al,BYTE PTR [bp-778]
	sub	ah,ah
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	mov	WORD PTR [bp-6],ax	;i
	jmp	SHORT $F767
	nop	
$FC768:
; Line 382
	mov	si,WORD PTR [bp-8]	;j
	mov	al,BYTE PTR [bp-782][si]
	mov	es,WORD PTR $T20004
	mov	bx,WORD PTR [bp-6]	;i
	mov	BYTE PTR es:_DayPal[bx],al
; Line 383
	inc	WORD PTR [bp-6]	;i
	inc	WORD PTR [bp-8]	;j
$F767:
	mov	al,BYTE PTR [bp-777]
	sub	ah,ah
	inc	ax
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	cmp	ax,WORD PTR [bp-6]	;i
	jg	$FC768
; Line 384
; Line 386
$I766:
	lea	ax,WORD PTR [bp-782]	;PalPkt
	push	ax
	mov	cx,OFFSET DGROUP:$SG770
	push	cx
	call	_LoadPalToPal
	add	sp,4
; Line 388
	cmp	BYTE PTR [bp-782],77	;PalPkt
	jne	$I771
	cmp	BYTE PTR [bp-781],48
	jne	$I771
; Line 389
	mov	WORD PTR [bp-8],6	;j
	mov	al,BYTE PTR [bp-778]
	sub	ah,ah
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	mov	WORD PTR [bp-6],ax	;i
	jmp	SHORT $F772
$FC773:
; Line 390
	mov	si,WORD PTR [bp-8]	;j
	mov	al,BYTE PTR [bp-782][si]
	mov	es,WORD PTR $T20003
	mov	bx,WORD PTR [bp-6]	;i
	mov	BYTE PTR es:_NitePal[bx],al
; Line 391
	inc	WORD PTR [bp-6]	;i
	inc	WORD PTR [bp-8]	;j
$F772:
	mov	al,BYTE PTR [bp-777]
	sub	ah,ah
	inc	ax
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	cmp	ax,WORD PTR [bp-6]	;i
	jg	$FC773
; Line 392
; Line 394
$I771:
	lea	ax,WORD PTR [bp-782]	;PalPkt
	push	ax
	mov	cx,OFFSET DGROUP:$SG775
	push	cx
	call	_LoadPalToPal
	add	sp,4
; Line 396
	cmp	BYTE PTR [bp-782],77	;PalPkt
	jne	$I776
	cmp	BYTE PTR [bp-781],48
	jne	$I776
; Line 397
	mov	WORD PTR [bp-8],6	;j
	mov	al,BYTE PTR [bp-778]
	sub	ah,ah
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	mov	WORD PTR [bp-6],ax	;i
	jmp	SHORT $F777
$FC778:
; Line 398
	mov	si,WORD PTR [bp-8]	;j
	mov	al,BYTE PTR [bp-782][si]
	mov	es,WORD PTR $T20002
	mov	bx,WORD PTR [bp-6]	;i
	mov	BYTE PTR es:_DawnPal[bx],al
; Line 399
	inc	WORD PTR [bp-6]	;i
	inc	WORD PTR [bp-8]	;j
$F777:
	mov	al,BYTE PTR [bp-777]
	sub	ah,ah
	inc	ax
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	cmp	ax,WORD PTR [bp-6]	;i
	jg	$FC778
; Line 400
; Line 402
$I776:
	lea	ax,WORD PTR [bp-782]	;PalPkt
	push	ax
	mov	cx,OFFSET DGROUP:$SG780
	push	cx
	call	_LoadPalToPal
	add	sp,4
; Line 404
	cmp	BYTE PTR [bp-782],77	;PalPkt
	jne	$I781
	cmp	BYTE PTR [bp-781],48
	jne	$I781
; Line 405
	mov	WORD PTR [bp-8],6	;j
	mov	al,BYTE PTR [bp-778]
	sub	ah,ah
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	mov	WORD PTR [bp-6],ax	;i
	jmp	SHORT $F782
$FC783:
; Line 406
	mov	si,WORD PTR [bp-8]	;j
	mov	al,BYTE PTR [bp-782][si]
	mov	es,WORD PTR $T20005
	mov	bx,WORD PTR [bp-6]	;i
	mov	BYTE PTR es:_DuskPal[bx],al
; Line 407
	inc	WORD PTR [bp-6]	;i
	inc	WORD PTR [bp-8]	;j
$F782:
	mov	al,BYTE PTR [bp-777]
	sub	ah,ah
	inc	ax
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	cmp	ax,WORD PTR [bp-6]	;i
	jg	$FC783
; Line 408
; Line 410
$I781:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_InitSpecialPal	ENDP
_TEXT	ENDS
END
