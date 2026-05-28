;	Static Name Aliases
;
	TITLE   C:\OBJCHECK.C
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
PUBLIC  _recsize
PUBLIC  _i
PUBLIC  _recseek
EXTRN	__acrtused:ABS
EXTRN	_fseek:NEAR
EXTRN	_printf:NEAR
EXTRN	_exit:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fread:NEAR
_BSS      SEGMENT
COMM NEAR	_buf:	 1:	 15
COMM NEAR	_name:	 1:	 7
COMM NEAR	_speed:	BYTE:	 2
COMM NEAR	_maneuver:	BYTE:	 2
COMM NEAR	_rclass:	BYTE:	 2
COMM NEAR	_filename:	 1:	 13
COMM NEAR	_miss1:	BYTE:	 2
COMM NEAR	_miss2:	BYTE:	 2
COMM NEAR	_mcount1:	BYTE:	 2
COMM NEAR	_mcount2:	BYTE:	 2
COMM NEAR	_radarsig:	BYTE:	 2
COMM NEAR	_gun:	BYTE:	 2
COMM NEAR	_alignment:	BYTE:	 2
COMM NEAR	_planerec:	BYTE:	 48
COMM NEAR	_tfile:	BYTE:	 2
COMM NEAR	_planefile:	BYTE:	 2
COMM NEAR	_radarfile:	BYTE:	 2
COMM NEAR	_missilefile:	BYTE:	 2
_BSS      ENDS
_DATA      SEGMENT
$SG276	DB	'rb',  00H
$SG277	DB	'F14PD01.DAT',  00H
$SG278	DB	'rb',  00H
$SG279	DB	'F14MD01.DAT',  00H
$SG280	DB	'rb',  00H
$SG281	DB	'F14RD01.DAT',  00H
$SG283	DB	'Error:  Plane Data File (F14PD01.TXT) Not Found',  0aH,  00H
$SG285	DB	'Error:  Missile Data File (F14MD01.TXT) Not Found',  0aH,  00H
$SG287	DB	'Error:  Radar Data File (F14RD01.TXT) Not Found',  0aH,  00H
$SG291	DB	'%d %s ',  00H
$SG292	DB	'rb',  00H
$SG294	DB	'NO 3D OBJECT FOUND',  0aH,  00H
$SG296	DB	'%s',  0aH,  00H
_recsize	DW	030H
_i	DW	00H
_recseek	DD	00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 2
; Line 3
; Line 4
; Line 5
; Line 6
; Line 48
	PUBLIC	_main
_main	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 49
	mov	ax,OFFSET DGROUP:$SG276
	push	ax
	mov	ax,OFFSET DGROUP:$SG277
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _planefile,ax
; Line 50
	mov	ax,OFFSET DGROUP:$SG278
	push	ax
	mov	ax,OFFSET DGROUP:$SG279
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _missilefile,ax
; Line 51
	mov	ax,OFFSET DGROUP:$SG280
	push	ax
	mov	ax,OFFSET DGROUP:$SG281
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _radarfile,ax
; Line 53
	cmp	WORD PTR _planefile,0
	jne	$I282
; Line 54
	mov	ax,OFFSET DGROUP:$SG283
	push	ax
	call	_printf
	add	sp,2
; Line 55
	mov	ax,-1
	push	ax
	call	_exit
	add	sp,2
; Line 56
; Line 58
$I282:
	cmp	WORD PTR _missilefile,0
	jne	$I284
; Line 59
	mov	ax,OFFSET DGROUP:$SG285
	push	ax
	call	_printf
	add	sp,2
; Line 60
	mov	ax,-1
	push	ax
	call	_exit
	add	sp,2
; Line 61
; Line 63
$I284:
	cmp	WORD PTR _radarfile,0
	je	$JCC115
	jmp	$L20001
$JCC115:
; Line 64
	mov	ax,OFFSET DGROUP:$SG287
	push	ax
	call	_printf
	add	sp,2
; Line 65
	mov	ax,-1
	push	ax
	call	_exit
	jmp	SHORT $L20002
	nop	
$FC289:
; Line 70
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR _i
	imul	WORD PTR _recsize
	cwd	
	mov	WORD PTR _recseek,ax
	mov	WORD PTR _recseek+2,dx
	push	dx
	push	ax
	push	bx
	call	_fseek
	add	sp,8
; Line 71
	push	WORD PTR _planefile
	mov	ax,1
	push	ax
	push	WORD PTR _recsize
	mov	ax,OFFSET DGROUP:_planerec
	push	ax
	call	_fread
	add	sp,8
; Line 72
	inc	WORD PTR _i
; Line 73
	mov	ax,OFFSET DGROUP:_planerec+2
	push	ax
	push	WORD PTR _planerec
	mov	ax,OFFSET DGROUP:$SG291
	push	ax
	call	_printf
	add	sp,6
; Line 74
	mov	ax,OFFSET DGROUP:$SG292
	push	ax
	mov	ax,OFFSET DGROUP:_planerec+16
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _tfile,ax
; Line 75
	or	ax,ax
	jne	$I293
; Line 76
	mov	ax,OFFSET DGROUP:$SG294
	push	ax
	call	_printf
	jmp	SHORT $L20002
	nop	
$I293:
; Line 78
	mov	ax,OFFSET DGROUP:_planerec+16
	push	ax
	mov	ax,OFFSET DGROUP:$SG296
	push	ax
	call	_printf
	add	sp,4
; Line 79
	push	WORD PTR _tfile
	call	_fclose
$L20002:
	add	sp,2
; Line 80
; Line 81
$L20001:
	mov	bx,WORD PTR _planefile
	test	BYTE PTR [bx+6],16
	jne	$JCC274
	jmp	$FC289
$JCC274:
; Line 83
	push	bx
	call	_fclose
	add	sp,2
; Line 84
	push	WORD PTR _missilefile
	call	_fclose
	add	sp,2
; Line 85
	push	WORD PTR _radarfile
	call	_fclose
	add	sp,2
; Line 86
	ret	
	nop	

_main	ENDP
_TEXT	ENDS
END
