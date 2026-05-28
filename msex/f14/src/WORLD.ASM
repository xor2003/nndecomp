;	Static Name Aliases
;
	TITLE   C:\WORLD.C
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
EXTRN	_fclose:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fread:NEAR
EXTRN	_fwrite:NEAR
EXTRN	_gamelog:BYTE
EXTRN	_nextlog:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
_DATA      SEGMENT
$SG673	DB	'wb',  00H
$SG674	DB	'log.f14',  00H
$SG678	DB	'ab',  00H
$SG679	DB	'log.f14',  00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 2
; Line 4
; Line 19
; Line 5
; Line 6
; Line 7
; Line 8
; Line 9
; Line 10
; Line 16
	PUBLIC	_InitLogFile
_InitLogFile	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	File = -2
; Line 20
	mov	ax,OFFSET DGROUP:$SG673
	push	ax
	mov	ax,OFFSET DGROUP:$SG674
	push	ax
	call	_fopen
	add	sp,4
	push	ax
	call	_fclose
; Line 21
	mov	sp,bp
	pop	bp
	ret	
	nop	

_InitLogFile	ENDP
; Line 25
	PUBLIC	_DumpLogFile
_DumpLogFile	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	File = -2
; Line 28
	mov	ax,OFFSET DGROUP:$SG678
	push	ax
	mov	ax,OFFSET DGROUP:$SG679
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR [bp-2],ax	;File
; Line 30
	push	ax
	push	WORD PTR _nextlog
	mov	ax,32
	push	ax
	mov	ax,OFFSET _gamelog
	push	ax
	call	_fwrite
	add	sp,8
; Line 31
	push	WORD PTR [bp-2]	;File
	call	_fclose
; Line 32
	mov	WORD PTR _nextlog,0
; Line 33
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DumpLogFile	ENDP
; Line 38
	PUBLIC	_farfread
_farfread	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,408
	call	__aNchkstk
	push	si
;	S = -404
;	i = -406
;	j = -408
;	C = -400
;	handle = 12
;	count = 10
;	size = 8
;	B = 4
; Line 43
	mov	ax,WORD PTR [bp+4]	;B
	mov	dx,WORD PTR [bp+6]
	mov	WORD PTR [bp-404],ax	;S
	mov	WORD PTR [bp-402],dx
; Line 44
	mov	WORD PTR [bp-406],0	;i
	jmp	SHORT $F690
$FC694:
	inc	WORD PTR [bp-408]	;j
$F693:
	mov	ax,WORD PTR [bp-408]	;j
	cmp	WORD PTR [bp+8],ax	;size
	jbe	$FC691
; Line 47
	mov	si,ax
	mov	al,BYTE PTR [bp-400][si]
	les	bx,DWORD PTR [bp-404]	;S
	inc	WORD PTR [bp-404]	;S
	mov	BYTE PTR es:[bx],al
; Line 48
	jmp	SHORT $FC694
; Line 49
$FC691:
	inc	WORD PTR [bp-406]	;i
$F690:
	mov	ax,WORD PTR [bp+10]	;count
	cmp	WORD PTR [bp-406],ax	;i
	jae	$FB692
; Line 45
	push	WORD PTR [bp+12]	;handle
	mov	ax,1
	push	ax
	push	WORD PTR [bp+8]	;size
	lea	ax,WORD PTR [bp-400]	;C
	push	ax
	call	_fread
	add	sp,8
; Line 46
	mov	WORD PTR [bp-408],0	;j
	jmp	SHORT $F693
$FB692:
; Line 50
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_farfread	ENDP
_TEXT	ENDS
END
