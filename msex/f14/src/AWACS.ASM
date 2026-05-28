;	Static Name Aliases
;
;	$S643_JstarTimer	EQU	JstarTimer
;	$S644_JstarX	EQU	JstarX
	TITLE   C:\AWACS.C
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
PUBLIC  _LastCall
EXTRN	_itoa:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_LocationPicture:NEAR
EXTRN	_Dist2D:NEAR
EXTRN	_ARCTAN:NEAR
EXTRN	_strcat:NEAR
EXTRN	_TrgMul:NEAR
EXTRN	_Speech:NEAR
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Txt:BYTE
EXTRN	_Diff:WORD
EXTRN	_Gtime:WORD
EXTRN	_NPLANES:WORD
EXTRN	_ps:BYTE
EXTRN	_Px:WORD
EXTRN	_Py:WORD
_DATA      SEGMENT
	ORG	$+2
$SG694	DB	'00',  00H
$SG700	DB	'0',  00H
	ORG	$-7
_LastCall	DW	0ff10H
_DATA      ENDS
_BSS      SEGMENT
$S643_JstarTimer	DW 01H DUP (?)
$S644_JstarX	DW 01H DUP (?)
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
; Line 27
	PUBLIC	_AwacsPicture
_AwacsPicture	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,52
	call	__aNchkstk
;	psi = -42
;	Mini = -46
;	i = -28
;	dx = -40
;	dy = -44
;	dist = -14
;	angl = -12
;	MinDist = -26
;	MinAngl = -22
;	eyex = -30
;	eyey = -38
;	eyedist = -24
;	bogeyi = -52
;	cnt = -16
;	ptemp = -20
;	carrx = -2
;	carry = -6
;	carrangle = -50
;	carrrelangle = -10
;	carrdist = -36
;	do_id = -48
;	is_target = -8
;	waynum = -4
;	bogey_org_num = -34
;	whatsrc = -32
; Line 39
	mov	WORD PTR [bp-26],11250	;MinDist
; Line 40
	mov	ax,WORD PTR _Diff
	inc	ax
	mov	cx,60
	imul	cx
	mov	cx,WORD PTR _Gtime
	sub	cx,WORD PTR _LastCall
	cmp	cx,ax
	jge	$I678
; Line 41
	mov	ax,1
	push	ax
	sub	ax,ax
	push	ax
	mov	cx,11250
	push	cx
	push	ax
	jmp	$L20001
$I678:
; Line 43
	mov	ax,WORD PTR _Gtime
	mov	WORD PTR _LastCall,ax
; Line 45
	mov	WORD PTR [bp-52],-999	;bogeyi
; Line 46
	mov	WORD PTR [bp-28],0	;i
	mov	WORD PTR [bp-42],OFFSET _ps	;psi
	jmp	SHORT $F681
	nop	
$FC682:
; Line 47
	mov	bx,WORD PTR [bp-42]	;psi
	mov	cx,WORD PTR [bx+24]
	mov	dx,cx
	test	cl,2
	je	$I687
	cmp	WORD PTR [bx+26],0
	je	$I687
	test	dx,1056
	jne	$I687
; Line 48
	mov	cx,WORD PTR [bx+2]
	sub	cx,WORD PTR _Px
	mov	WORD PTR [bp-40],cx	;dx
; Line 49
	mov	dx,WORD PTR [bx+4]
	sub	dx,WORD PTR _Py
	mov	WORD PTR [bp-44],dx	;dy
; Line 51
	push	dx
	push	cx
	call	_Dist2D
	add	sp,4
	mov	WORD PTR [bp-14],ax	;dist
; Line 52
	mov	ax,WORD PTR [bp-44]	;dy
	neg	ax
	push	ax
	push	WORD PTR [bp-40]	;dx
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-12],ax	;angl
; Line 54
	mov	ax,WORD PTR [bp-14]	;dist
	cmp	WORD PTR [bp-26],ax	;MinDist
	jle	$I687
; Line 55
	mov	cx,WORD PTR [bp-28]	;i
	mov	WORD PTR [bp-52],cx	;bogeyi
; Line 56
	mov	WORD PTR [bp-26],ax	;MinDist
; Line 58
	mov	ax,WORD PTR [bp-12]	;angl
	mov	WORD PTR [bp-22],ax	;MinAngl
; Line 59
; Line 60
$I687:
; Line 61
	inc	WORD PTR [bp-28]	;i
	add	WORD PTR [bp-42],40	;psi
$F681:
	mov	ax,WORD PTR [bp-28]	;i
	cmp	WORD PTR _NPLANES,ax
	jg	$FC682
; Line 62
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-52]	;bogeyi
	push	WORD PTR [bp-26]	;MinDist
	push	WORD PTR [bp-22]	;MinAngl
$L20001:
	push	ax
	push	ax
	call	_LocationPicture
; Line 63
; Line 64
	sub	ax,ax
; Line 65
	mov	sp,bp
	pop	bp
	ret	

_AwacsPicture	ENDP
; Line 69
	PUBLIC	_BearingToText
_BearingToText	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	isawac = 6
;	angl = 4
; Line 72
	mov	ax,360
	push	ax
	mov	ax,WORD PTR [bp+4]	;angl
	shr	ax,1
	push	ax
	call	_TrgMul
	mov	sp,bp
	mov	WORD PTR [bp+4],ax	;angl
	cmp	ax,10
	jae	$I693
; Line 73
	mov	ax,OFFSET DGROUP:$SG694
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	mov	sp,bp
; Line 74
	cmp	WORD PTR [bp+6],0	;isawac
	je	$I695
; Line 75
	mov	ax,49
	push	ax
	call	_Speech
	mov	sp,bp
; Line 76
$L20004:
	mov	ax,49
	jmp	SHORT $L20003
$I695:
; Line 79
	mov	ax,24
	push	ax
	call	_Speech
	mov	sp,bp
	jmp	SHORT $L20005
	nop	
$I693:
	cmp	ax,100
	jae	$I699
; Line 83
	mov	ax,OFFSET DGROUP:$SG700
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	mov	sp,bp
; Line 84
	cmp	WORD PTR [bp+6],0	;isawac
	jne	$L20004
; Line 88
$L20005:
	mov	ax,24
$L20003:
	push	ax
	call	_Speech
	mov	sp,bp
; Line 89
; Line 90
; Line 92
$I699:
	push	WORD PTR [bp+6]	;isawac
	push	WORD PTR [bp+4]	;angl
	call	_NSpeech
; Line 94
	mov	sp,bp
	pop	bp
	ret	

_BearingToText	ENDP
; Line 98
	PUBLIC	_NSpeech
_NSpeech	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
	push	si
;	s = -10
;	i = -12
;	isawac = 6
;	num = 4
; Line 102
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	push	WORD PTR [bp+4]	;num
	call	_itoa
	add	sp,6
; Line 103
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 105
	mov	WORD PTR [bp-12],0	;i
	jmp	SHORT $F710
$I713:
; Line 109
	mov	al,BYTE PTR [bp-10][si]
	cbw	
	sub	ax,24
$L20006:
	push	ax
	call	_Speech
	add	sp,2
; Line 110
	inc	WORD PTR [bp-12]	;i
$F710:
	mov	si,WORD PTR [bp-12]	;i
	cmp	BYTE PTR [bp-10][si],0
	je	$FB712
; Line 106
	cmp	WORD PTR [bp+6],0	;isawac
	je	$I713
; Line 107
	mov	al,BYTE PTR [bp-10][si]
	cbw	
	inc	ax
	jmp	SHORT $L20006
	nop	
$FB712:
; Line 111
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_NSpeech	ENDP
_TEXT	ENDS
END
