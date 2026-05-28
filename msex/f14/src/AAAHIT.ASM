;	Static Name Aliases
;
;	$S1308_MapX	EQU	MapX
;	$S1309_MapZ	EQU	MapZ
;	$S1310_Dist2Obj	EQU	Dist2Obj
;	$S1311_HitFlags	EQU	HitFlags
;	$S1312_NUM	EQU	NUM
;	$S1313_k	EQU	k
	TITLE   C:\AAAHIT.C
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
EXTRN	_gotcha:NEAR
EXTRN	_labs:NEAR
EXTRN	_DamageMe:NEAR
EXTRN	_LogIt:NEAR
EXTRN	_Message:NEAR
EXTRN	_strcat:NEAR
EXTRN	_DamageAI:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_LDist2D:NEAR
EXTRN	_FriendStatus:NEAR
EXTRN	_gt:BYTE
EXTRN	_NGTARGETS:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Txt:BYTE
EXTRN	_Rtime:WORD
EXTRN	_Alt:WORD
EXTRN	_PxLng:DWORD
EXTRN	_PyLng:DWORD
EXTRN	_NPLANES:WORD
EXTRN	_ps:BYTE
_DATA      SEGMENT
$SG1354	DB	'Hit by AAA',  00H
$SG1359	DB	' destroyed by ',  00H
$SG1360	DB	'AAA',  00H
_DATA      ENDS
_BSS      SEGMENT
	ORG	$+2
$S1308_MapX	DW 01H DUP (?)
$S1309_MapZ	DW 01H DUP (?)
	ORG	$-6
$S1310_Dist2Obj	DW 01H DUP (?)
	ORG	$+6
$S1311_HitFlags	DW 01H DUP (?)
$S1312_NUM	DW 01H DUP (?)
	ORG	$-6
$S1313_k	DW 01H DUP (?)
_BSS      ENDS
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
; Line 10
; Line 11
; Line 12
; Line 13
; Line 31
	PUBLIC	_doaaa
_doaaa	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
	push	di
	push	si
;	cnt = -8
;	pcnt = -6
;	pstart = -22
;	dx = -16
;	dy = -20
;	ldistval = -4
;	thistime = -10
;	lastfire = -12
; Line 40
	mov	al,BYTE PTR _Rtime
	and	ax,7
	mov	WORD PTR [bp-22],ax	;pstart
; Line 41
	mov	WORD PTR [bp-8],0	;cnt
	jmp	$F1323
$FC1328:
; Line 48
	mov	cx,40
	imul	cx
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+24]
	mov	cx,ax
	test	al,32
	je	$JCC43
	jmp	$I1332
$JCC43:
	and	cx,2
	jne	$JCC51
	jmp	$I1332
$JCC51:
	or	cx,cx
	jne	$JCC58
	jmp	$I1332
$JCC58:
	cmp	WORD PTR _ps[bx+6],2000
	jle	$JCC69
	jmp	$I1332
$JCC69:
	push	WORD PTR [bp-6]	;pcnt
	mov	si,bx
	call	_FriendStatus
	add	sp,2
	mov	bx,WORD PTR [bp-8]	;cnt
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	shl	bx,1
	mov	ch,BYTE PTR _gt[bx+11]
	and	cx,1280
	cmp	cx,ax
	jne	$JCC108
	jmp	$I1332
$JCC108:
; Line 49
	mov	ax,WORD PTR _gt[bx]
	mov	dx,WORD PTR _gt[bx+2]
	sub	ax,WORD PTR _ps[si+8]
	sbb	dx,WORD PTR _ps[si+10]
	push	dx
	push	ax
	mov	di,bx
	call	_labs
	add	sp,4
	mov	WORD PTR [bp-16],ax	;dx
	mov	WORD PTR [bp-14],dx
; Line 50
	mov	ax,WORD PTR _gt[di+4]
	mov	dx,WORD PTR _gt[di+6]
	sub	ax,WORD PTR _ps[si+12]
	sbb	dx,WORD PTR _ps[si+14]
	push	dx
	push	ax
	call	_labs
	add	sp,4
	mov	WORD PTR [bp-20],ax	;dy
	mov	WORD PTR [bp-18],dx
; Line 51
	cmp	WORD PTR [bp-14],0
	jg	$I1332
	jl	$L20001
	cmp	WORD PTR [bp-16],17600	;dx
	jae	$I1332
$L20001:
	or	dx,dx
	jg	$I1332
	jl	$L20002
	cmp	ax,17600
	jae	$I1332
$L20002:
; Line 52
	or	BYTE PTR _gt[di+11],64
; Line 54
	push	WORD PTR [bp-18]
	push	WORD PTR [bp-20]	;dy
	push	WORD PTR [bp-14]
	push	WORD PTR [bp-16]	;dx
	call	_LDist2D
	add	sp,8
	mov	cx,ax
	mov	ax,WORD PTR _ps[si+6]
	mov	bx,dx
	cwd	
	add	cx,ax
	adc	bx,dx
	or	bx,bx
	jg	$I1332
	jl	$L20005
	cmp	cx,4101
	jae	$I1332
$L20005:
; Line 55
	mov	WORD PTR $S1310_Dist2Obj,cx
; Line 56
	push	WORD PTR [bp-8]	;cnt
	push	WORD PTR [bp-6]	;pcnt
	call	_CheckAAAHit
	add	sp,4
; Line 57
; Line 58
$I1332:
; Line 59
; Line 60
	add	WORD PTR [bp-6],8	;pcnt
$F1327:
	mov	ax,WORD PTR [bp-6]	;pcnt
	cmp	WORD PTR _NPLANES,ax
	jle	$JCC276
	jmp	$FC1328
$JCC276:
; Line 61
	cmp	WORD PTR [bp-22],0	;pstart
	je	$I1334
	cmp	WORD PTR [bp-22],4	;pstart
	je	$JCC291
	jmp	$I1336
$JCC291:
$I1334:
	mov	bx,WORD PTR [bp-8]	;cnt
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	test	BYTE PTR _gt[bx+11],4
	je	$JCC314
	jmp	$I1336
$JCC314:
; Line 62
	mov	ax,WORD PTR _gt[bx]
	mov	dx,WORD PTR _gt[bx+2]
	sub	ax,WORD PTR _PxLng
	sbb	dx,WORD PTR _PxLng+2
	push	dx
	push	ax
	mov	si,bx
	call	_labs
	add	sp,4
	mov	WORD PTR [bp-16],ax	;dx
	mov	WORD PTR [bp-14],dx
; Line 63
	mov	ax,WORD PTR _gt[si+4]
	mov	dx,WORD PTR _gt[si+6]
	add	ax,WORD PTR _PyLng
	adc	dx,WORD PTR _PyLng+2
	sub	ax,0
	sbb	dx,16
	push	dx
	push	ax
	call	_labs
	add	sp,4
	mov	WORD PTR [bp-20],ax	;dy
	mov	WORD PTR [bp-18],dx
; Line 64
	push	dx
	push	ax
	push	WORD PTR [bp-14]
	push	WORD PTR [bp-16]	;dx
	call	_LDist2D
	add	sp,8
	add	ax,WORD PTR _Alt
	adc	dx,0
; Line 65
	cmp	WORD PTR [bp-14],0
	jg	$I1336
	jl	$L20006
	cmp	WORD PTR [bp-16],17600	;dx
	jae	$I1336
$L20006:
	cmp	WORD PTR [bp-18],0
	jg	$I1336
	jl	$L20007
	cmp	WORD PTR [bp-20],17600	;dy
	jae	$I1336
$L20007:
; Line 66
	or	BYTE PTR _gt[si+11],64
; Line 68
	push	WORD PTR [bp-18]
	push	WORD PTR [bp-20]	;dy
	push	WORD PTR [bp-14]
	push	WORD PTR [bp-16]	;dx
	call	_LDist2D
	add	sp,8
	add	ax,WORD PTR _Alt
	adc	dx,0
	or	dx,dx
	jg	$I1336
	jl	$L20008
	cmp	ax,4101
	jae	$I1336
$L20008:
; Line 69
	mov	WORD PTR $S1310_Dist2Obj,ax
; Line 70
	push	WORD PTR [bp-8]	;cnt
	mov	ax,70
	push	ax
	call	_CheckAAAHit
	add	sp,4
; Line 71
; Line 72
$I1336:
; Line 73
; Line 74
	mov	bx,WORD PTR [bp-8]	;cnt
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR _gt[bx+10]
	mov	cx,ax
	test	ah,64
	je	$I1337
; Line 75
	and	cx,14
	sar	cx,1
	mov	WORD PTR [bp-12],cx	;lastfire
; Line 76
; Line 77
	jmp	SHORT $I1340
	nop	
$I1337:
	cmp	WORD PTR [bp-10],0	;thistime
	je	$I1340
; Line 78
	cmp	WORD PTR [bp-12],7	;lastfire
	je	$I1340
; Line 81
	mov	al,BYTE PTR [bp-12]	;lastfire
	inc	al
	and	al,7
	mov	ah,32
	shl	ax,1
	mov	bx,WORD PTR [bp-8]	;cnt
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	shl	bx,1
	or	WORD PTR _gt[bx+10],ax
	mov	al,BYTE PTR _gt[bx+10]
	and	ax,14
	sar	ax,1
	mov	WORD PTR [bp-12],ax	;lastfire
; Line 82
; Line 83
$I1340:
; Line 84
; Line 85
	inc	WORD PTR [bp-8]	;cnt
$F1323:
	mov	ax,WORD PTR _NGTARGETS
	cmp	WORD PTR [bp-8],ax	;cnt
	jge	$FB1325
; Line 42
	mov	bx,WORD PTR [bp-8]	;cnt
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR _gt[bx+10]
	mov	cx,ax
	test	ah,32
	je	$I1340
; Line 43
	and	cx,14
	sar	cx,1
	mov	WORD PTR [bp-12],cx	;lastfire
; Line 45
	and	BYTE PTR _gt[bx+10],241
	mov	ax,WORD PTR _gt[bx+10]
	mov	cx,ax
	and	ax,16384
	mov	WORD PTR [bp-10],ax	;thistime
; Line 46
	and	ch,191
	mov	WORD PTR _gt[bx+10],cx
; Line 47
	mov	ax,WORD PTR [bp-22]	;pstart
	mov	WORD PTR [bp-6],ax	;pcnt
	jmp	$F1327
$FB1325:
; Line 86
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_doaaa	ENDP
; Line 90
	PUBLIC	_CheckAAAHit
_CheckAAAHit	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	crashstat = -4
;	src = -2
;	gtnum = 6
;	planenum = 4
; Line 94
	mov	bx,WORD PTR [bp+6]	;gtnum
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR _gt[bx+8]
	neg	ax
	mov	WORD PTR [bp-2],ax	;src
; Line 96
	cmp	WORD PTR $S1310_Dist2Obj,820
	jae	$I1346
	push	WORD PTR [bp+4]	;planenum
	call	_gotcha
	add	sp,2
; Line 98
$I1346:
	cmp	WORD PTR $S1310_Dist2Obj,4101
	jb	$JCC719
	jmp	$I1361
$JCC719:
; Line 99
	cmp	WORD PTR [bp+4],70	;planenum
	jne	$I1349
; Line 100
	mov	al,BYTE PTR $S1310_Dist2Obj
	xor	al,BYTE PTR _Rtime
	test	al,127
	je	$JCC739
	jmp	$I1361
$JCC739:
; Line 102
	mov	ax,3
	push	ax
	call	_DamageMe
	add	sp,2
; Line 104
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	WORD PTR [bp-2]	;src
	push	WORD PTR _Alt
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	ax
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	mov	ax,-1
	push	ax
	mov	ax,41
	push	ax
	call	_LogIt
	add	sp,24
; Line 106
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1354
$L20010:
	push	ax
	call	_Message
	add	sp,4
; Line 107
; Line 108
; Line 109
	pop	si
	mov	sp,bp
	pop	bp
	ret	
$I1349:
; Line 110
	mov	al,BYTE PTR $S1310_Dist2Obj
	xor	al,BYTE PTR _Rtime
	test	al,255
	je	$JCC835
	jmp	$I1361
$JCC835:
; Line 111
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	al,BYTE PTR _ps[bx+24]
	and	ax,32
	mov	WORD PTR [bp-4],ax	;crashstat
; Line 112
	push	WORD PTR [bp+4]	;planenum
	mov	si,bx
	call	_DamageAI
	add	sp,2
; Line 113
	mov	al,BYTE PTR _ps[si+24]
	and	ax,32
	cmp	ax,WORD PTR [bp-4]	;crashstat
	je	$I1357
; Line 114
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	WORD PTR [bp-2]	;src
	push	WORD PTR _ps[si+6]
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	push	WORD PTR _ps[si+10]
	push	WORD PTR _ps[si+8]
	push	WORD PTR [bp+4]	;planenum
	mov	ax,42
	push	ax
	call	_LogIt
	add	sp,24
; Line 115
	mov	ax,OFFSET DGROUP:$SG1359
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 116
	mov	ax,OFFSET DGROUP:$SG1360
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 117
	mov	ax,4
	push	ax
	mov	ax,OFFSET _Txt
	jmp	$L20010
$I1357:
; Line 120
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	WORD PTR [bp-2]	;src
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	push	WORD PTR [bp+4]	;planenum
	mov	ax,41
	push	ax
	call	_LogIt
	add	sp,24
; Line 121
$I1361:
; Line 122
; Line 123
; Line 124
; Line 125
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_CheckAAAHit	ENDP
_TEXT	ENDS
END
