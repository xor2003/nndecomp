;	Static Name Aliases
;
	TITLE   C:\PLANREAD.C
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
EXTRN	__acrtused:ABS
EXTRN	_fscanf:NEAR
EXTRN	_fwrite:NEAR
EXTRN	_printf:NEAR
EXTRN	_strcpy:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fread:NEAR
_BSS      SEGMENT
COMM NEAR	_speed:	BYTE:	 2
COMM NEAR	_maneuver:	BYTE:	 2
COMM NEAR	_rclass:	BYTE:	 2
COMM NEAR	_filename:	 1:	 12
COMM NEAR	_miss1:	BYTE:	 2
COMM NEAR	_miss2:	BYTE:	 2
COMM NEAR	_mcount1:	BYTE:	 2
COMM NEAR	_mcount2:	BYTE:	 2
COMM NEAR	_planerec:	BYTE:	 34
COMM NEAR	_tfile:	BYTE:	 2
COMM NEAR	_outfile:	BYTE:	 2
COMM NEAR	_buf:	 1:	 15
COMM NEAR	_name:	 1:	 7
_BSS      ENDS
_DATA      SEGMENT
$SG269	DB	'r',  00H
$SG270	DB	'F14PD01.TXT',  00H
$SG271	DB	'%s %d %d %d %s %d %d %d %d',  0aH,  00H
$SG272	DB	'%s %d %d %d %s %d %d %d %d',  0aH,  00H
$SG274	DB	'wb',  00H
$SG275	DB	'F14PL01.DAT',  00H
$SG276	DB	'rb',  00H
$SG277	DB	'F14PL01.DAT',  00H
$SG278	DB	'Bin Read: %s %d %d %d %s %d %d %d %d',  0aH,  00H
_recsize	DW	022H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 2
; Line 3
; Line 4
; Line 5
; Line 6
; Line 35
	PUBLIC	_main
_main	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
; Line 36
	mov	ax,OFFSET DGROUP:$SG269
	push	ax
	mov	ax,OFFSET DGROUP:$SG270
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _tfile,ax
; Line 38
	mov	ax,OFFSET DGROUP:_mcount2
	push	ax
	mov	cx,OFFSET DGROUP:_mcount1
	push	cx
	mov	dx,OFFSET DGROUP:_miss2
	push	dx
	mov	bx,OFFSET DGROUP:_miss1
	push	bx
	mov	si,OFFSET DGROUP:_filename
	push	si
	mov	di,OFFSET DGROUP:_rclass
	push	di
	mov	ax,OFFSET DGROUP:_maneuver
	push	ax
	mov	ax,OFFSET DGROUP:_speed
	push	ax
	mov	ax,OFFSET DGROUP:_name
	push	ax
	mov	ax,OFFSET DGROUP:$SG271
	push	ax
	push	WORD PTR _tfile
	call	_fscanf
	add	sp,22
; Line 40
	push	WORD PTR _mcount2
	push	WORD PTR _mcount1
	push	WORD PTR _miss2
	push	WORD PTR _miss1
	push	si
	push	WORD PTR _rclass
	push	WORD PTR _maneuver
	push	WORD PTR _speed
	mov	ax,OFFSET DGROUP:_name
	push	ax
	mov	cx,OFFSET DGROUP:$SG272
	push	cx
	call	_printf
	add	sp,20
; Line 41
	push	WORD PTR _tfile
	call	_fclose
	add	sp,2
; Line 43
	mov	ax,OFFSET DGROUP:_name
	push	ax
	mov	ax,OFFSET DGROUP:_planerec
	push	ax
	call	_strcpy
	add	sp,4
; Line 44
	mov	ax,WORD PTR _speed
	mov	WORD PTR _planerec+8,ax
; Line 45
	mov	ax,WORD PTR _maneuver
	mov	WORD PTR _planerec+10,ax
; Line 46
	mov	ax,WORD PTR _rclass
	mov	WORD PTR _planerec+12,ax
; Line 47
	push	si
	mov	ax,OFFSET DGROUP:_planerec+14
	push	ax
	call	_strcpy
	add	sp,4
; Line 48
	mov	ax,WORD PTR _miss1
	mov	WORD PTR _planerec+26,ax
; Line 49
	mov	ax,WORD PTR _miss2
	mov	WORD PTR _planerec+28,ax
; Line 50
	mov	ax,WORD PTR _mcount1
	mov	WORD PTR _planerec+30,ax
; Line 51
	mov	ax,WORD PTR _mcount2
	mov	WORD PTR _planerec+32,ax
; Line 53
	mov	ax,OFFSET DGROUP:$SG274
	push	ax
	mov	ax,OFFSET DGROUP:$SG275
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _outfile,ax
; Line 54
	push	ax
	mov	ax,1
	push	ax
	push	WORD PTR _recsize
	mov	cx,OFFSET DGROUP:_planerec
	push	cx
	call	_fwrite
	add	sp,8
; Line 55
	push	WORD PTR _outfile
	call	_fclose
	add	sp,2
; Line 57
	mov	ax,OFFSET DGROUP:$SG276
	push	ax
	mov	ax,OFFSET DGROUP:$SG277
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _outfile,ax
; Line 58
	push	ax
	mov	ax,1
	push	ax
	push	WORD PTR _recsize
	mov	ax,OFFSET DGROUP:_planerec
	push	ax
	call	_fread
	add	sp,8
; Line 61
	push	WORD PTR _planerec+32
	push	WORD PTR _planerec+30
	push	WORD PTR _planerec+28
	push	WORD PTR _planerec+26
	mov	ax,OFFSET DGROUP:_planerec+14
	push	ax
	push	WORD PTR _planerec+12
	push	WORD PTR _planerec+10
	push	WORD PTR _planerec+8
	mov	ax,OFFSET DGROUP:_planerec
	push	ax
	mov	ax,OFFSET DGROUP:$SG278
	push	ax
	call	_printf
	add	sp,20
; Line 63
	push	WORD PTR _outfile
	call	_fclose
	add	sp,2
; Line 64
	pop	si
	pop	di
	ret	
	nop	

_main	ENDP
_TEXT	ENDS
END
