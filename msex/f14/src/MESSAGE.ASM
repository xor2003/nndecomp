;	Static Name Aliases
;
	TITLE   C:\MESSAGE.C
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
PUBLIC  _MSGRp
PUBLIC  _MRp
PUBLIC  _lastmsgview
PUBLIC  _LastMsgSeat
PUBLIC  _newmsg
PUBLIC  _MyMSG
PUBLIC  _MyMSGTYP
PUBLIC  _msgtime
PUBLIC  _Mupdate
PUBLIC  _MsgEMS
PUBLIC  _MsgOnScreen
EXTRN	_GETTIME:FAR
EXTRN	_itoa:NEAR
EXTRN	_ltoa:NEAR
EXTRN	_DrawLine:FAR
EXTRN	_RectCopy:FAR
EXTRN	_RpPrint:FAR
EXTRN	_RectFill:FAR
EXTRN	_MakeEMSFileBlock:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_MapEmsFile:NEAR
EXTRN	_strcat:NEAR
EXTRN	_fmemcpy:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_strlen:NEAR
EXTRN	_strncpy:NEAR
EXTRN	_mprintf:NEAR
EXTRN	_Sound:NEAR
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_ejected:WORD
EXTRN	_View:WORD
_BSS      SEGMENT
COMM NEAR	_HudMsg:	 1:	 300
COMM NEAR	_MsgCount:	 2:	 5
COMM NEAR	_MsgSrc:	 2:	 5
_BSS      ENDS
EXTRN	_Rp3D:WORD
EXTRN	_Rp1:WORD
EXTRN	_OurAlt:WORD
EXTRN	_OurHead:WORD
EXTRN	_Knots:WORD
EXTRN	_GRPAGE0:BYTE
EXTRN	_BackSeat:WORD
EXTRN	_MSGDETAIL:WORD
EXTRN	_landingstatus:WORD
EXTRN	_Speedy:WORD
_DATA      SEGMENT
	ORG	$+2
$SG699	DB	0aH,  0dH,  00H
$SG730	DB	'MSG.EMS',  00H
	ORG	$+155
$SG835	DB	'HEADING     ALTITUDE       AIRSPEED     ',  00H
$SG839	DB	'X ',  00H
	ORG	$-212
_MsgOnScreen	DW	00H
	ORG	$+12
_MSGRp	DW	01H
	DW	00H
	DW	00H
	DW	013fH
	DW	0c7H
	DW	02H
	DW	02H
	DW	00H
	DW	01H
_MRp	DW	DGROUP:_MSGRp
_lastmsgview	DW	0ffffH
_LastMsgSeat	DW	0ffffH
_newmsg	DW	00H
_MyMSG	DB	00H
 	DB	119 DUP(0)

_MyMSGTYP	DW	00H
_msgtime	DW	00H
_Mupdate	DW	00H
_MsgEMS	DW	00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 2
; Line 19
; Line 3
; Line 4
; Line 5
; Line 6
; Line 7
; Line 8
; Line 9
; Line 36
	PUBLIC	_Messages
_Messages	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 37
	cmp	WORD PTR _View,71
	je	$I688
	cmp	WORD PTR _View,72
	je	$I688
; Line 38
	call	_MyMessages
; Line 39
$I688:
	ret	
	nop	

_Messages	ENDP
; Line 43
	PUBLIC	_Message
_Message	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	i = -6
;	min = -4
;	slot = -2
;	src = 6
;	s = 4
; Line 46
	cmp	WORD PTR _ejected,0
	je	$I697
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 48
	nop	
$I697:
	push	WORD PTR [bp+4]	;s
	call	_mprintf
	add	sp,2
; Line 49
	mov	ax,OFFSET DGROUP:$SG699
	push	ax
	call	_mprintf
	add	sp,2
; Line 51
	cmp	WORD PTR _MSGDETAIL,3
	jne	$I700
$L20003:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 52
$I700:
	cmp	WORD PTR _MSGDETAIL,2
	jne	$I701
	cmp	WORD PTR [bp+6],4	;src
	je	$L20003
; Line 53
$I701:
	cmp	WORD PTR _MSGDETAIL,1
	jne	$I702
	cmp	WORD PTR [bp+6],2	;src
	je	$L20003
; Line 54
$I702:
	push	WORD PTR [bp+6]	;src
	push	WORD PTR [bp+4]	;s
	call	_MyMessage
; Line 55
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Message	ENDP
; Line 59
	PUBLIC	_MsgBox
_MsgBox	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	di
	push	si
;	StartY = 8
;	StartX = 6
;	Len = 4
; Line 60
	mov	ax,7
	push	ax
	push	ax
	mov	ax,WORD PTR [bp+4]	;Len
	inc	ax
	inc	ax
	push	ax
	mov	ax,WORD PTR [bp+8]	;StartY
	dec	ax
	push	ax
	mov	cx,WORD PTR [bp+6]	;StartX
	dec	cx
	push	cx
	push	WORD PTR _Rp3D
	mov	si,ax
	mov	di,cx
	call	FAR PTR _RectFill
	add	sp,12
; Line 61
	mov	ax,15
	push	ax
	mov	cx,WORD PTR [bp+8]	;StartY
	dec	cx
	dec	cx
	push	cx
	mov	dx,WORD PTR [bp+6]	;StartX
	add	dx,WORD PTR [bp+4]	;Len
	inc	dx
	push	dx
	push	cx
	mov	cx,WORD PTR [bp+6]	;StartX
	dec	cx
	dec	cx
	push	cx
	push	WORD PTR _Rp3D
	mov	WORD PTR [bp-2],cx
	mov	WORD PTR [bp-4],dx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 62
	mov	ax,8
	push	ax
	mov	cx,WORD PTR [bp+8]	;StartY
	add	cx,6
	push	cx
	push	WORD PTR [bp-4]
	push	cx
	push	di
	push	WORD PTR _Rp3D
	call	FAR PTR _DrawLine
	add	sp,12
; Line 63
	mov	ax,15
	push	ax
	mov	ax,WORD PTR [bp+8]	;StartY
	add	ax,5
	push	ax
	push	WORD PTR [bp-2]
	push	si
	push	WORD PTR [bp-2]
	push	WORD PTR _Rp3D
	mov	di,ax
	call	FAR PTR _DrawLine
	add	sp,12
; Line 64
	mov	ax,8
	push	ax
	push	di
	push	WORD PTR [bp-4]
	push	si
	push	WORD PTR [bp-4]
	push	WORD PTR _Rp3D
	call	FAR PTR _DrawLine
	add	sp,12
; Line 65
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_MsgBox	ENDP
; Line 82
	PUBLIC	_MyMessages
_MyMessages	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
;	outside = -18
;	P = -4
;	SRC = -10
;	cnt = -6
;	lastmsg = -14
;	lastmsgnum = -12
;	msgplace = -16
; Line 89
	cmp	WORD PTR _MsgEMS,0
	jne	$I729
; Line 91
	mov	ax,320
	push	ax
	mov	ax,OFFSET DGROUP:$SG730
	push	ax
	call	_MakeEMSFileBlock
	add	sp,4
	mov	WORD PTR _MsgEMS,ax
	or	ax,ax
	jne	$I729
; Line 92
	mov	WORD PTR _MsgEMS,-1
; Line 93
$I729:
; Line 95
	mov	bx,WORD PTR _Rp1
	mov	WORD PTR [bx+8],199
; Line 97
	mov	ax,WORD PTR _View
	or	ax,ax
	jl	$SD736
	sub	ax,5
	jle	$SC735
$SD736:
; Line 107
	mov	WORD PTR [bp-18],1	;outside
; Line 108
	jmp	SHORT $SB732
; Line 98
	nop	
$SC735:
; Line 104
	mov	WORD PTR [bp-18],0	;outside
; Line 105
$SB732:
; Line 110
	mov	ax,WORD PTR _View
	cmp	WORD PTR _lastmsgview,ax
	jne	$I738
	mov	ax,WORD PTR _BackSeat
	cmp	WORD PTR _LastMsgSeat,ax
	je	$I737
$I738:
; Line 111
	mov	ax,WORD PTR _View
	mov	WORD PTR _lastmsgview,ax
; Line 112
	mov	ax,WORD PTR _BackSeat
	mov	WORD PTR _LastMsgSeat,ax
; Line 113
	cmp	WORD PTR [bp-18],0	;outside
	jne	$I739
; Line 115
	sub	ax,ax
	push	ax
	push	WORD PTR _MsgEMS
	call	_MapEmsFile
	add	sp,4
	mov	WORD PTR [bp-2],ax
; Line 116
	mov	WORD PTR [bp-4],0	;P
; Line 117
	mov	ax,WORD PTR _GRPAGE0
	mov	WORD PTR [bp-8],ax
; Line 118
	mov	WORD PTR [bp-10],-4096	;SRC
; Line 119
	mov	ax,2560
	push	ax
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;P
	push	WORD PTR [bp-8]
	push	WORD PTR [bp-10]	;SRC
	call	_fmemcpy
	add	sp,10
; Line 120
; Line 121
$I739:
	mov	WORD PTR _Mupdate,1
; Line 122
; Line 125
$I737:
	cmp	WORD PTR [bp-18],0	;outside
	je	$I742
; Line 126
	cmp	WORD PTR _Mupdate,0
	je	$I743
; Line 127
	push	WORD PTR _MRp
	call	_OutSideMSGBox
	add	sp,2
; Line 128
	push	WORD PTR _MRp
	call	_OutSideHeading
	add	sp,2
; Line 130
	mov	ax,170
	push	ax
	sub	cx,cx
	mov	WORD PTR _Mupdate,cx
	push	cx
	push	WORD PTR _Rp1
	mov	cx,30
	push	cx
	mov	cx,320
	push	cx
	push	ax
	sub	ax,ax
	push	ax
$L20007:
	push	WORD PTR _MRp
	call	FAR PTR _RectCopy
	add	sp,16
; Line 131
	jmp	$I750
; Line 106
$I743:
; Line 132
	push	WORD PTR _MRp
	call	_OutSideHeading
	add	sp,2
; Line 133
	mov	ax,176
	push	ax
	sub	cx,cx
	push	cx
	push	WORD PTR _Rp1
	mov	dx,20
	push	dx
	mov	dx,320
	push	dx
	push	ax
	push	cx
	jmp	SHORT $L20007
	nop	
$I742:
; Line 136
	cmp	WORD PTR _MsgEMS,0
	jge	$I748
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 137
	nop	
$I748:
	cmp	WORD PTR _Mupdate,0
	je	$I750
; Line 138
	mov	WORD PTR _Mupdate,0
; Line 139
	cmp	BYTE PTR _MyMSG,0
	je	$I750
; Line 140
	push	WORD PTR _MRp
	call	_InSideMSGBox
	add	sp,2
; Line 142
	sub	ax,ax
	push	ax
	push	WORD PTR _MsgEMS
	call	_MapEmsFile
	add	sp,4
	mov	WORD PTR [bp-2],ax
; Line 143
	mov	WORD PTR [bp-4],2560	;P
; Line 144
	mov	bx,WORD PTR _MRp
	mov	bx,WORD PTR [bx]
	shl	bx,1
	mov	ax,WORD PTR _GRPAGE0[bx]
	mov	WORD PTR [bp-8],ax
; Line 145
	mov	WORD PTR [bp-10],-4096	;SRC
; Line 146
	mov	ax,2560
	push	ax
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;P
	push	WORD PTR [bp-8]
	push	WORD PTR [bp-10]	;SRC
	call	_fmemcpy
	add	sp,10
; Line 148
	mov	ax,WORD PTR _GRPAGE0
	mov	WORD PTR [bp-8],ax
; Line 149
	mov	WORD PTR [bp-10],-4096	;SRC
; Line 150
	mov	ax,2560
	push	ax
	push	WORD PTR [bp-8]
	push	WORD PTR [bp-10]	;SRC
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;P
	call	_fmemcpy
	add	sp,10
; Line 151
; Line 152
$I750:
; Line 154
; Line 163
; Line 164
; Line 166
	cmp	WORD PTR _msgtime,0
	jne	$JCC729
	jmp	$FB770
$JCC729:
; Line 167
	call	FAR PTR _GETTIME
	sub	ax,WORD PTR _msgtime
	neg	ax
	or	ax,ax
	jl	$JCC747
	jmp	$FB770
$JCC747:
; Line 171
	sub	ax,ax
	mov	WORD PTR [bp-14],ax	;lastmsg
	mov	WORD PTR [bp-12],ax	;lastmsgnum
	mov	WORD PTR [bp-6],ax	;cnt
	jmp	SHORT $F755
	nop	
$FC756:
; Line 172
	mov	bx,WORD PTR [bp-6]	;cnt
	shl	bx,1
	cmp	WORD PTR _MsgCount[bx],1
	jne	$I758
; Line 173
	mov	ax,WORD PTR [bp-6]	;cnt
	mov	WORD PTR [bp-12],ax	;lastmsgnum
; Line 174
; Line 175
$I758:
	mov	bx,WORD PTR [bp-6]	;cnt
	shl	bx,1
	mov	ax,WORD PTR [bp-14]	;lastmsg
	cmp	WORD PTR _MsgCount[bx],ax
	jle	$L20004
; Line 176
	mov	ax,WORD PTR _MsgCount[bx]
	mov	WORD PTR [bp-14],ax	;lastmsg
; Line 177
; Line 178
$L20004:
	inc	WORD PTR [bp-6]	;cnt
$F755:
	cmp	WORD PTR [bp-6],5	;cnt
	jl	$FC756
; Line 179
	cmp	WORD PTR [bp-14],0	;lastmsg
	jne	$I760
; Line 180
	cmp	WORD PTR [bp-18],0	;outside
	jne	$I761
; Line 182
	sub	ax,ax
	push	ax
	push	WORD PTR _MsgEMS
	call	_MapEmsFile
	add	sp,4
	mov	WORD PTR [bp-2],ax
; Line 183
	mov	WORD PTR [bp-4],0	;P
; Line 184
	mov	ax,WORD PTR _GRPAGE0
	mov	WORD PTR [bp-8],ax
; Line 185
	mov	WORD PTR [bp-10],-4096	;SRC
; Line 186
	mov	ax,2560
	push	ax
	push	WORD PTR [bp-8]
	push	WORD PTR [bp-10]	;SRC
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;P
	call	_fmemcpy
	add	sp,10
; Line 187
; Line 188
$I761:
	mov	BYTE PTR _MyMSG,0
; Line 189
	mov	WORD PTR _msgtime,0
; Line 190
	mov	WORD PTR _Mupdate,1
; Line 191
; Line 192
$FB770:
; Line 212
; Line 213
; Line 214
; Line 217
	cmp	BYTE PTR _MyMSG,1
	sbb	ax,ax
	inc	ax
	mov	WORD PTR _MsgOnScreen,ax
	or	ax,ax
	jne	$JCC910
	jmp	$I773
$JCC910:
; Line 218
	mov	bx,WORD PTR _Rp1
	mov	WORD PTR [bx+8],191
; Line 219
	mov	sp,bp
	pop	bp
	ret	
$I760:
; Line 193
	sub	ax,ax
	push	ax
	mov	cx,1
	push	cx
	mov	cx,17
	push	cx
	call	_Sound
	add	sp,6
; Line 195
	mov	ax,60
	push	ax
	mov	ax,WORD PTR [bp-12]	;lastmsgnum
	mov	WORD PTR [bp-16],ax	;msgplace
	mov	cx,60
	imul	cx
	add	ax,OFFSET DGROUP:_HudMsg
	push	ax
	mov	ax,OFFSET DGROUP:_MyMSG
	push	ax
	call	_strncpy
	add	sp,6
; Line 196
	mov	BYTE PTR _MyMSG+59,0
; Line 197
	mov	bx,WORD PTR [bp-16]	;msgplace
	shl	bx,1
	mov	ax,WORD PTR _MsgSrc[bx]
	mov	WORD PTR _MyMSGTYP,ax
; Line 198
	test	BYTE PTR _landingstatus,2
	je	$I764
; Line 199
$L20006:
	call	FAR PTR _GETTIME
	add	ax,120
	jmp	SHORT $L20005
$I764:
	cmp	WORD PTR [bp-14],2	;lastmsg
	jg	$L20006
; Line 203
	call	FAR PTR _GETTIME
	add	ax,180
$L20005:
	mov	WORD PTR _msgtime,ax
; Line 204
	mov	WORD PTR _Mupdate,1
; Line 205
	mov	ax,60
	imul	WORD PTR [bp-16]	;msgplace
	mov	bx,ax
	mov	BYTE PTR _HudMsg[bx],0
; Line 206
	mov	WORD PTR [bp-6],0	;cnt
	jmp	SHORT $F768
	nop	
$I771:
; Line 210
	mov	bx,WORD PTR [bp-6]	;cnt
	shl	bx,1
	mov	WORD PTR _MsgCount[bx],0
; Line 211
$FC769:
	inc	WORD PTR [bp-6]	;cnt
$F768:
	cmp	WORD PTR [bp-6],5	;cnt
	jl	$JCC1070
	jmp	$FB770
$JCC1070:
; Line 207
	mov	bx,WORD PTR [bp-6]	;cnt
	shl	bx,1
	cmp	WORD PTR _MsgCount[bx],0
	jle	$I771
; Line 208
	dec	WORD PTR _MsgCount[bx]
; Line 209
	jmp	SHORT $FC769
	nop	
$I773:
; Line 220
	mov	bx,WORD PTR _Rp1
	mov	WORD PTR [bx+8],199
; Line 221
; Line 222
	mov	sp,bp
	pop	bp
	ret	
	nop	

_MyMessages	ENDP
; Line 225
	PUBLIC	_MyMessage
_MyMessage	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
	push	di
	push	si
;	i = -8
;	min = -4
;	slot = -2
;	cnt = -6
;	lastmsg = -12
;	lastmsgnum = -10
;	msgplace = -14
;	src = 6
;	s = 4
; Line 230
	cmp	WORD PTR _ejected,0
	je	$I785
	mov	ax,1
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 232
	nop	
$I785:
	cmp	WORD PTR _msgtime,0
	je	$I788
	cmp	WORD PTR [bp+6],5	;src
	je	$I788
	cmp	WORD PTR [bp+6],6	;src
	jne	$I786
$I788:
; Line 233
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,17
	push	ax
	call	_Sound
	add	sp,6
; Line 234
	mov	ax,60
	push	ax
	push	WORD PTR [bp+4]	;s
	mov	ax,OFFSET DGROUP:_MyMSG
	push	ax
	call	_strncpy
	add	sp,6
; Line 235
	mov	BYTE PTR _MyMSG+59,0
; Line 236
	cmp	WORD PTR [bp+6],5	;src
	jne	$I789
; Line 237
	mov	WORD PTR _MyMSGTYP,2
; Line 238
	call	FAR PTR _GETTIME
	add	ax,120
	jmp	SHORT $L20008
$I789:
	cmp	WORD PTR [bp+6],6	;src
	jne	$I791
; Line 241
	mov	ax,WORD PTR [bp+6]	;src
	mov	WORD PTR _MyMSGTYP,ax
; Line 242
	call	FAR PTR _GETTIME
	add	ax,300
	jmp	SHORT $L20008
$I791:
; Line 245
	mov	ax,WORD PTR [bp+6]	;src
	mov	WORD PTR _MyMSGTYP,ax
; Line 246
	call	FAR PTR _GETTIME
	add	ax,180
$L20008:
	mov	WORD PTR _msgtime,ax
; Line 247
; Line 248
	mov	WORD PTR _Mupdate,1
; Line 249
; Line 250
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I786:
; Line 253
	sub	ax,ax
	mov	WORD PTR [bp-12],ax	;lastmsg
	mov	WORD PTR [bp-10],ax	;lastmsgnum
	mov	WORD PTR [bp-6],ax	;cnt
	jmp	SHORT $F794
	nop	
$FC795:
; Line 254
	mov	bx,WORD PTR [bp-6]	;cnt
	shl	bx,1
	mov	ax,WORD PTR [bp-12]	;lastmsg
	cmp	WORD PTR _MsgCount[bx],ax
	jle	$L20009
; Line 255
	mov	ax,WORD PTR _MsgCount[bx]
	mov	WORD PTR [bp-12],ax	;lastmsg
; Line 256
	mov	ax,WORD PTR [bp-6]	;cnt
	mov	WORD PTR [bp-10],ax	;lastmsgnum
; Line 257
; Line 258
$L20009:
	inc	WORD PTR [bp-6]	;cnt
$F794:
	cmp	WORD PTR [bp-6],5	;cnt
	jl	$FC795
; Line 259
	cmp	WORD PTR [bp-12],5	;lastmsg
	jge	$I798
; Line 260
	cmp	WORD PTR [bp-12],0	;lastmsg
	je	$L20011
; Line 264
	mov	ax,WORD PTR [bp-10]	;lastmsgnum
	inc	ax
	mov	WORD PTR [bp-14],ax	;msgplace
	cmp	ax,5
	jl	$I801
; Line 265
$L20011:
	mov	WORD PTR [bp-14],0	;msgplace
; Line 266
$I801:
; Line 267
	mov	ax,60
	push	ax
	push	WORD PTR [bp+4]	;s
	imul	WORD PTR [bp-14]	;msgplace
	add	ax,OFFSET DGROUP:_HudMsg
	push	ax
	call	_strncpy
	add	sp,6
; Line 268
	mov	ax,WORD PTR [bp-12]	;lastmsg
	inc	ax
	mov	bx,WORD PTR [bp-14]	;msgplace
	shl	bx,1
	mov	WORD PTR _MsgCount[bx],ax
; Line 269
	mov	ax,WORD PTR [bp+6]	;src
	mov	WORD PTR _MsgSrc[bx],ax
; Line 270
; Line 271
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I798:
; Line 272
	sub	ax,ax
	push	ax
	mov	cx,1
	push	cx
	mov	dx,17
	push	dx
	call	_Sound
	add	sp,6
; Line 274
	mov	ax,WORD PTR [bp-10]	;lastmsgnum
	inc	ax
	mov	WORD PTR [bp-14],ax	;msgplace
	cmp	ax,5
	jl	$I803
; Line 275
	mov	WORD PTR [bp-14],0	;msgplace
; Line 276
$I803:
	mov	ax,60
	push	ax
	imul	WORD PTR [bp-14]	;msgplace
	add	ax,OFFSET DGROUP:_HudMsg
	push	ax
	mov	cx,OFFSET DGROUP:_MyMSG
	push	cx
	mov	si,ax
	call	_strncpy
	add	sp,6
; Line 277
	mov	BYTE PTR _MyMSG+59,0
; Line 278
	mov	bx,WORD PTR [bp-14]	;msgplace
	shl	bx,1
	mov	ax,WORD PTR _MsgSrc[bx]
	mov	WORD PTR _MyMSGTYP,ax
; Line 279
	mov	di,bx
	call	FAR PTR _GETTIME
	add	ax,120
	mov	WORD PTR _msgtime,ax
; Line 280
	mov	WORD PTR _Mupdate,1
; Line 281
	mov	ax,60
	push	ax
	push	WORD PTR [bp+4]	;s
	push	si
	call	_strncpy
	add	sp,6
; Line 282
	mov	WORD PTR _MsgCount[di],6
; Line 283
	mov	ax,WORD PTR [bp+6]	;src
	mov	WORD PTR _MsgSrc[di],ax
; Line 284
	mov	WORD PTR [bp-6],0	;cnt
$FC805:
; Line 285
	mov	bx,WORD PTR [bp-6]	;cnt
	shl	bx,1
	dec	WORD PTR _MsgCount[bx]
; Line 286
	inc	WORD PTR [bp-6]	;cnt
	cmp	WORD PTR [bp-6],5	;cnt
	jl	$FC805
; Line 287
; Line 288
; Line 289
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_MyMessage	ENDP
; Line 292
	PUBLIC	_MBox
_MBox	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	EndY = 12
;	EndX = 10
;	StartY = 8
;	StartX = 6
;	Rp = 4
; Line 293
	mov	ax,17
	push	ax
	mov	ax,WORD PTR [bp+12]	;EndY
	sub	ax,WORD PTR [bp+8]	;StartY
	inc	ax
	push	ax
	mov	ax,WORD PTR [bp+10]	;EndX
	sub	ax,WORD PTR [bp+6]	;StartX
	inc	ax
	push	ax
	push	WORD PTR [bp+8]	;StartY
	push	WORD PTR [bp+6]	;StartX
	push	WORD PTR [bp+4]	;Rp
	call	FAR PTR _RectFill
	mov	sp,bp
; Line 295
	mov	ax,18
	push	ax
	push	WORD PTR [bp+8]	;StartY
	push	WORD PTR [bp+10]	;EndX
	push	WORD PTR [bp+8]	;StartY
	push	WORD PTR [bp+6]	;StartX
	push	WORD PTR [bp+4]	;Rp
	call	FAR PTR _DrawLine
	mov	sp,bp
; Line 296
	mov	ax,18
	push	ax
	push	WORD PTR [bp+12]	;EndY
	push	WORD PTR [bp+10]	;EndX
	push	WORD PTR [bp+8]	;StartY
	push	WORD PTR [bp+10]	;EndX
	push	WORD PTR [bp+4]	;Rp
	call	FAR PTR _DrawLine
	mov	sp,bp
; Line 297
	mov	ax,18
	push	ax
	push	WORD PTR [bp+12]	;EndY
	push	WORD PTR [bp+6]	;StartX
	push	WORD PTR [bp+12]	;EndY
	push	WORD PTR [bp+10]	;EndX
	push	WORD PTR [bp+4]	;Rp
	call	FAR PTR _DrawLine
	mov	sp,bp
; Line 298
	mov	ax,18
	push	ax
	push	WORD PTR [bp+8]	;StartY
	push	WORD PTR [bp+6]	;StartX
	push	WORD PTR [bp+12]	;EndY
	push	WORD PTR [bp+6]	;StartX
	push	WORD PTR [bp+4]	;Rp
	call	FAR PTR _DrawLine
; Line 299
	mov	sp,bp
	pop	bp
	ret	

_MBox	ENDP
; Line 302
	PUBLIC	_MsgPrnt
_MsgPrnt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	msgcolor = -2
;	typ = 12
;	S = 10
;	y = 8
;	x = 6
;	Rp = 4
; Line 307
	mov	bx,WORD PTR [bp+4]	;Rp
	mov	WORD PTR [bx+10],0
; Line 308
	mov	ax,15
	mov	WORD PTR [bx+12],ax
; Line 309
	mov	WORD PTR [bx+16],2
; Line 310
	push	WORD PTR [bp+10]	;S
	push	WORD PTR [bp+8]	;y
	push	WORD PTR [bp+6]	;x
	push	bx
	call	FAR PTR _RpPrint
; Line 311
	mov	sp,bp
	pop	bp
	ret	
	nop	

_MsgPrnt	ENDP
; Line 315
	PUBLIC	_InSideMSGBox
_InSideMSGBox	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	Rp = 4
; Line 316
	mov	ax,199
	push	ax
	mov	ax,319
	push	ax
	mov	ax,192
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR [bp+4]	;Rp
	call	_MBox
	mov	sp,bp
; Line 317
	push	WORD PTR _MyMSGTYP
	mov	ax,OFFSET DGROUP:_MyMSG
	push	ax
	mov	ax,193
	push	ax
	mov	ax,10
	push	ax
	push	WORD PTR [bp+4]	;Rp
	call	_MsgPrnt
; Line 318
	mov	sp,bp
	pop	bp
	ret	
	nop	

_InSideMSGBox	ENDP
; Line 321
	PUBLIC	_OutSideMSGBox
_OutSideMSGBox	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	Rp = 4
; Line 322
	mov	ax,199
	push	ax
	mov	ax,319
	push	ax
	mov	ax,170
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR [bp+4]	;Rp
	call	_MBox
	mov	sp,bp
; Line 323
	push	WORD PTR _MyMSGTYP
	mov	ax,OFFSET DGROUP:_MyMSG
	push	ax
	mov	ax,186
	push	ax
	mov	ax,10
	push	ax
	push	WORD PTR [bp+4]	;Rp
	call	_MsgPrnt
; Line 324
	mov	sp,bp
	pop	bp
	ret	
	nop	

_OutSideMSGBox	ENDP
; Line 332
	PUBLIC	_OutSideHeading
_OutSideHeading	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,172
	call	__aNchkstk
;	S = -80
;	N = -172
;	V = -82
;	Rp = 4
; Line 337
	mov	BYTE PTR [bp-80],0	;S
; Line 338
	mov	ax,OFFSET DGROUP:$SG835
	push	ax
	lea	ax,WORD PTR [bp-80]	;S
	push	ax
	call	_strcpy
	add	sp,4
; Line 340
	mov	ax,10
	push	ax
	lea	cx,WORD PTR [bp-172]	;N
	push	cx
	mov	ax,WORD PTR _OurHead
	mov	bx,182
	sub	dx,dx
	div	bx
	push	ax
	call	_itoa
	add	sp,6
; Line 341
	lea	ax,WORD PTR [bp-172]	;N
	push	ax
	push	ax
	call	_strlen
	add	sp,2
	lea	cx,WORD PTR [bp-69]
	sub	cx,ax
	push	cx
	call	_strcpy
	add	sp,4
; Line 342
	mov	BYTE PTR [bp-69],32
; Line 344
	mov	ax,WORD PTR _OurAlt
	mov	WORD PTR [bp-82],ax	;V
; Line 345
	mov	cx,10
	push	cx
	lea	dx,WORD PTR [bp-172]	;N
	push	dx
	sub	dx,dx
	push	dx
	push	ax
	call	_ltoa
	add	sp,8
; Line 346
	lea	ax,WORD PTR [bp-172]	;N
	push	ax
	push	ax
	call	_strlen
	add	sp,2
	lea	cx,WORD PTR [bp-54]
	sub	cx,ax
	push	cx
	call	_strcpy
	add	sp,4
; Line 347
	mov	BYTE PTR [bp-54],32
; Line 349
	mov	ax,10
	push	ax
	lea	cx,WORD PTR [bp-172]	;N
	push	cx
	push	WORD PTR _Knots
	call	_itoa
	add	sp,6
; Line 350
	lea	ax,WORD PTR [bp-172]	;N
	push	ax
	push	ax
	call	_strlen
	add	sp,2
	lea	cx,WORD PTR [bp-41]
	sub	cx,ax
	push	cx
	call	_strcpy
	add	sp,4
; Line 351
	mov	BYTE PTR [bp-41],0
; Line 353
	cmp	WORD PTR _Speedy,1
	jle	$I838
; Line 354
; Line 355
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-172]	;N
	push	ax
	push	WORD PTR _Speedy
	call	_itoa
	add	sp,6
; Line 356
	mov	ax,OFFSET DGROUP:$SG839
	push	ax
	lea	ax,WORD PTR [bp-172]	;N
	push	ax
	call	_strcat
	add	sp,4
; Line 357
; Line 358
	jmp	SHORT $I840
$I838:
; Line 359
	mov	BYTE PTR [bp-172],0	;N
$I840:
; Line 361
	lea	ax,WORD PTR [bp-80]	;S
	push	ax
	lea	ax,WORD PTR [bp-172]	;N
	push	ax
	call	_strcat
	add	sp,4
; Line 364
	mov	bx,WORD PTR [bp+4]	;Rp
	mov	WORD PTR [bx+10],0
; Line 365
	mov	WORD PTR [bx+12],15
; Line 366
	mov	WORD PTR [bx+16],2
; Line 367
	mov	ax,17
	push	ax
	mov	ax,8
	push	ax
	mov	ax,300
	push	ax
	mov	ax,176
	push	ax
	mov	cx,10
	push	cx
	push	bx
	call	FAR PTR _RectFill
	add	sp,12
; Line 368
	lea	ax,WORD PTR [bp-172]	;N
	push	ax
	mov	ax,176
	push	ax
	mov	bx,WORD PTR [bp+4]	;Rp
	mov	ax,WORD PTR [bx+6]
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,78
	push	ax
	push	bx
	call	FAR PTR _RpPrint
; Line 381
	mov	sp,bp
	pop	bp
	ret	
	nop	

_OutSideHeading	ENDP
_TEXT	ENDS
END
