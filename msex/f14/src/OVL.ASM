;	Static Name Aliases
;
;	$S118_header	EQU	header
;	$S121_param	EQU	param
	TITLE   C:\OVL.C
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
EXTRN	__aNchkstk:NEAR
_BSS      SEGMENT
COMM NEAR	_DigSysSetup:	BYTE:	 4
COMM NEAR	_DigQueue:	BYTE:	 4
COMM NEAR	_DigFlushQueue:	BYTE:	 4
COMM NEAR	_DigStatus:	BYTE:	 4
COMM NEAR	_DigAllOff:	BYTE:	 4
COMM NEAR	_DigShutDown:	BYTE:	 4
	ORG	$+4
$S118_header	DW 02H DUP (?)
	ORG	$-8
$S121_param	DW 02H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 22
	PUBLIC	_dig_load_overlay
_dig_load_overlay	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__aNchkstk
;	fname = -12
;	code_ptr = -4
;	code_offset_ptr = -8
;	err = -16
;	i = -14
;	filename = 4
; Line 37
	mov	ax,WORD PTR [bp+4]	;filename
	mov	WORD PTR [bp-12],ax	;fname
	mov	WORD PTR [bp-10],ds
; Line 39
; Line 40
	mov	bx,-1
; Line 41
	mov	ah,72
; Line 42
	int	33
; Line 44
	mov	ah,72
; Line 45
	int	33
; Line 46
	mov	WORD PTR $S121_param,ax
; Line 47
	mov	WORD PTR $S121_param+2,ax
; Line 48
	mov	ax,SEG $S121_param
; Line 49
	mov	es,ax
; Line 50
	mov	bx,OFFSET DGROUP:$S121_param
; Line 51
	lds	dx,DWORD PTR [bp-12]	;fname
; Line 52
	mov	ax,19203
; Line 53
	int	33
; Line 54
	mov	ax,ss
; Line 55
	mov	ds,ax
; Line 56
	mov	ax,0
; Line 57
	adc	ax,0
; Line 58
	mov	WORD PTR [bp-16],ax	;err
; Line 59
; Line 60
	cmp	WORD PTR [bp-16],0	;err
	je	$I126
; Line 61
; Line 62
	mov	ah,73
; Line 63
	mov	es,WORD PTR $S121_param
; Line 64
	int	33
; Line 65
; Line 66
	mov	WORD PTR $S121_param,0
; Line 67
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 68
; Line 69
	nop	
$I126:
	mov	ax,40
	mov	dx,WORD PTR $S121_param
	mov	WORD PTR $S118_header,ax
	mov	WORD PTR $S118_header+2,dx
; Line 70
	mov	es,dx
	mov	bx,ax
	mov	ax,WORD PTR es:[bx+4]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	add	ax,WORD PTR es:[bx+2]
	sub	ax,WORD PTR es:[bx]
	inc	ax
	mov	WORD PTR [bp-14],ax	;i
; Line 72
; Line 73
	mov	ah,74
; Line 74
	mov	bx,WORD PTR [bp-14]	;i
; Line 75
	int	33
; Line 76
; Line 77
	les	bx,DWORD PTR $S118_header
	mov	ax,WORD PTR es:[bx]
	sub	cx,cx
	mov	WORD PTR [bp-4],cx	;code_ptr
	mov	WORD PTR [bp-2],ax
; Line 80
	add	cx,WORD PTR es:[bx+10]
	mov	WORD PTR _DigSysSetup,cx
	mov	WORD PTR _DigSysSetup+2,ax
; Line 81
	lea	bx,WORD PTR [bx+10]
	mov	ax,WORD PTR es:[bx+2]
	add	ax,WORD PTR [bp-4]	;code_ptr
	mov	dx,WORD PTR [bp-2]
	mov	WORD PTR _DigShutDown,ax
	mov	WORD PTR _DigShutDown+2,dx
; Line 82
	inc	bx
	inc	bx
	mov	ax,WORD PTR es:[bx+2]
	add	ax,WORD PTR [bp-4]	;code_ptr
	mov	WORD PTR _DigQueue,ax
	mov	WORD PTR _DigQueue+2,dx
; Line 83
	inc	bx
	inc	bx
	mov	ax,WORD PTR es:[bx+2]
	add	ax,WORD PTR [bp-4]	;code_ptr
	mov	WORD PTR _DigFlushQueue,ax
	mov	WORD PTR _DigFlushQueue+2,dx
; Line 84
	inc	bx
	inc	bx
	mov	ax,WORD PTR es:[bx+2]
	add	ax,WORD PTR [bp-4]	;code_ptr
	mov	WORD PTR _DigAllOff,ax
	mov	WORD PTR _DigAllOff+2,dx
; Line 85
	inc	bx
	inc	bx
	mov	ax,WORD PTR es:[bx+2]
	add	ax,WORD PTR [bp-4]	;code_ptr
	mov	WORD PTR _DigStatus,ax
	mov	WORD PTR _DigStatus+2,dx
	mov	dx,es
; Line 86
	sub	ax,ax
; Line 87
	mov	sp,bp
	pop	bp
	ret	

_dig_load_overlay	ENDP
_TEXT	ENDS
END
