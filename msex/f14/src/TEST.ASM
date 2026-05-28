;	Static Name Aliases
;
	TITLE   C:\TEST.C
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
EXTRN	__acrtused:ABS
EXTRN	_printf:NEAR
EXTRN	__aNchkstk:NEAR
_DATA      SEGMENT
$SG229	DB	'>',  00H
$SG231	DB	'<',  00H
$SG233	DB	'=',  00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 2
; Line 5
	PUBLIC	_main
_main	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	t1 = -4
;	t2 = -6
; Line 8
	mov	WORD PTR [bp-4],30000	;t1
	mov	WORD PTR [bp-2],0
; Line 9
	mov	WORD PTR [bp-6],-28536	;t2
; Line 10
	mov	ax,OFFSET DGROUP:$SG229
	push	ax
	call	_printf
	add	sp,2
; Line 11
	mov	ax,WORD PTR [bp-6]	;t2
	cwd	
	cmp	dx,WORD PTR [bp-2]
	jl	$I230
	jg	$L20001
	cmp	ax,WORD PTR [bp-4]	;t1
	jbe	$I230
$L20001:
	mov	ax,OFFSET DGROUP:$SG231
	push	ax
	call	_printf
	add	sp,2
; Line 12
$I230:
	mov	ax,WORD PTR [bp-6]	;t2
	cwd	
	cmp	ax,WORD PTR [bp-4]	;t1
	jne	$I232
	cmp	dx,WORD PTR [bp-2]
	jne	$I232
	mov	ax,OFFSET DGROUP:$SG233
	push	ax
	call	_printf
; Line 13
$I232:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_main	ENDP
_TEXT	ENDS
END
