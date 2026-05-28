;	Static Name Aliases
;
	TITLE   C:\RADCOMP.C
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
PUBLIC  _planecnt
PUBLIC  _recseek
EXTRN	__acrtused:ABS
EXTRN	_fscanf:NEAR
EXTRN	_fseek:NEAR
EXTRN	_fwrite:NEAR
EXTRN	_printf:NEAR
EXTRN	_exit:NEAR
EXTRN	_strcpy:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fread:NEAR
_BSS      SEGMENT
COMM NEAR	_name:	 1:	 10
COMM NEAR	_range:	BYTE:	 2
COMM NEAR	_detectiontype:	BYTE:	 2
COMM NEAR	_missiletype:	BYTE:	 2
COMM NEAR	_missilecount:	BYTE:	 2
COMM NEAR	_jam:	BYTE:	 2
COMM NEAR	_tewsnum:	BYTE:	 2
COMM NEAR	_radarrec:	BYTE:	 24
COMM NEAR	_flstat:	BYTE:	 2
COMM NEAR	_i:	BYTE:	 2
COMM NEAR	_tfile:	BYTE:	 2
COMM NEAR	_outfile:	BYTE:	 2
COMM NEAR	_buf:	 1:	 15
COMM NEAR	_RadarEnumId:	BYTE:	 2
_BSS      ENDS
_DATA      SEGMENT
$SG272	DB	'r',  00H
$SG273	DB	'F14RD01.TXT',  00H
$SG274	DB	0aH, 'Fleet Defender - Radar Data File Compiler',  0aH,  00H
$SG275	DB	0aH, 'Compiling F14RD01.TXT...',  00H
$SG277	DB	0aH, 'Error:  Cannot find file F14RD01.TXT',  0aH,  00H
$SG278	DB	'wb',  00H
$SG279	DB	'F14RD01.DAT',  00H
$SG283	DB	'%d %s %d %d %d %d %d %d',  0aH,  00H
$SG285	DB	'Compile Complete.',  0aH,  00H
$SG286	DB	'rb',  00H
$SG287	DB	'F14RD01.DAT',  00H
$SG291	DB	'%-3d %-12s %-3d %-3d %-3d %-3d %-3d %-3d',  0aH,  00H
	ORG	$+1
_recsize	DW	018H
_planecnt	DW	00H
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
; Line 39
	PUBLIC	_main
_main	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
; Line 40
	mov	ax,OFFSET DGROUP:$SG272
	push	ax
	mov	ax,OFFSET DGROUP:$SG273
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _tfile,ax
; Line 42
	mov	ax,OFFSET DGROUP:$SG274
	push	ax
	call	_printf
	add	sp,2
; Line 43
	mov	ax,OFFSET DGROUP:$SG275
	push	ax
	call	_printf
	add	sp,2
; Line 44
	cmp	WORD PTR _tfile,0
	jne	$I276
; Line 45
	mov	ax,OFFSET DGROUP:$SG277
	push	ax
	call	_printf
	add	sp,2
; Line 46
	mov	ax,-1
	push	ax
	call	_exit
	add	sp,2
; Line 47
; Line 49
$I276:
	mov	ax,OFFSET DGROUP:$SG278
	push	ax
	mov	ax,OFFSET DGROUP:$SG279
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _outfile,ax
; Line 53
	jmp	SHORT $L20001
$FC281:
; Line 54
	mov	ax,WORD PTR _RadarEnumId
	mov	WORD PTR _radarrec,ax
; Line 55
	mov	ax,OFFSET DGROUP:_name
	push	ax
	mov	ax,OFFSET DGROUP:_radarrec+2
	push	ax
	call	_strcpy
	add	sp,4
; Line 56
	mov	ax,WORD PTR _range
	mov	WORD PTR _radarrec+12,ax
; Line 57
	mov	ax,WORD PTR _detectiontype
	mov	WORD PTR _radarrec+14,ax
; Line 58
	mov	ax,WORD PTR _missiletype
	mov	WORD PTR _radarrec+16,ax
; Line 59
	mov	ax,WORD PTR _missilecount
	mov	WORD PTR _radarrec+18,ax
; Line 60
	mov	ax,WORD PTR _jam
	mov	WORD PTR _radarrec+20,ax
; Line 61
	mov	ax,WORD PTR _tewsnum
	mov	WORD PTR _radarrec+22,ax
; Line 62
	push	WORD PTR _outfile
	mov	ax,1
	push	ax
	push	WORD PTR _recsize
	mov	ax,OFFSET DGROUP:_radarrec
	push	ax
	call	_fwrite
	add	sp,8
; Line 63
	inc	WORD PTR _planecnt
; Line 64
$L20001:
	mov	ax,OFFSET DGROUP:_tewsnum
	push	ax
	mov	cx,OFFSET DGROUP:_jam
	push	cx
	mov	dx,OFFSET DGROUP:_missilecount
	push	dx
	mov	bx,OFFSET DGROUP:_missiletype
	push	bx
	mov	si,OFFSET DGROUP:_detectiontype
	push	si
	mov	di,OFFSET DGROUP:_range
	push	di
	mov	ax,OFFSET DGROUP:_name
	push	ax
	mov	ax,OFFSET DGROUP:_RadarEnumId
	push	ax
	mov	ax,OFFSET DGROUP:$SG283
	push	ax
	push	WORD PTR _tfile
	call	_fscanf
	add	sp,20
	mov	WORD PTR _flstat,ax
	cmp	ax,-1
	je	$JCC224
	jmp	$FC281
$JCC224:
; Line 66
	push	WORD PTR _tfile
	call	_fclose
	add	sp,2
; Line 67
	push	WORD PTR _outfile
	call	_fclose
	add	sp,2
; Line 69
	mov	ax,OFFSET DGROUP:$SG285
	push	ax
	call	_printf
	add	sp,2
; Line 71
	mov	ax,OFFSET DGROUP:$SG286
	push	ax
	mov	ax,OFFSET DGROUP:$SG287
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _outfile,ax
; Line 73
	mov	WORD PTR _i,0
	jmp	SHORT $F288
$FC289:
; Line 75
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR _i
	imul	WORD PTR _recsize
	cwd	
	mov	WORD PTR _recseek,ax
	mov	WORD PTR _recseek+2,dx
	push	dx
	push	ax
	push	WORD PTR _outfile
	call	_fseek
	add	sp,8
; Line 76
	push	WORD PTR _outfile
	mov	ax,1
	push	ax
	push	WORD PTR _recsize
	mov	ax,OFFSET DGROUP:_radarrec
	push	ax
	call	_fread
	add	sp,8
; Line 80
	push	WORD PTR _radarrec+22
	push	WORD PTR _radarrec+20
	push	WORD PTR _radarrec+18
	push	WORD PTR _radarrec+16
	push	WORD PTR _radarrec+14
	push	WORD PTR _radarrec+12
	mov	ax,OFFSET DGROUP:_radarrec+2
	push	ax
	push	WORD PTR _radarrec
	mov	ax,OFFSET DGROUP:$SG291
	push	ax
	call	_printf
	add	sp,18
; Line 81
	inc	WORD PTR _i
$F288:
	mov	ax,WORD PTR _planecnt
	cmp	WORD PTR _i,ax
	jl	$FC289
; Line 82
	push	WORD PTR _outfile
	call	_fclose
	add	sp,2
; Line 83
	pop	si
	pop	di
	ret	

_main	ENDP
_TEXT	ENDS
END
