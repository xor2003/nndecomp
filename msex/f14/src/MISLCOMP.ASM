;	Static Name Aliases
;
	TITLE   C:\MISLCOMP.C
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
COMM NEAR	_name:	 1:	 12
COMM NEAR	_range:	BYTE:	 2
COMM NEAR	_minrange:	BYTE:	 2
COMM NEAR	_maxalt:	BYTE:	 2
COMM NEAR	_speed:	BYTE:	 2
COMM NEAR	_homing:	BYTE:	 2
COMM NEAR	_maneuver:	BYTE:	 2
COMM NEAR	_cmeffect:	BYTE:	 2
COMM NEAR	_damage:	BYTE:	 2
COMM NEAR	_filename:	 1:	 12
COMM NEAR	_type:	BYTE:	 2
COMM NEAR	_missilerec:	BYTE:	 44
COMM NEAR	_flstat:	BYTE:	 2
COMM NEAR	_i:	BYTE:	 2
COMM NEAR	_tfile:	BYTE:	 2
COMM NEAR	_outfile:	BYTE:	 2
COMM NEAR	_buf:	 1:	 15
COMM NEAR	_MissileEnumId:	BYTE:	 2
_BSS      ENDS
_DATA      SEGMENT
$SG276	DB	'r',  00H
$SG277	DB	'F14MD01.TXT',  00H
$SG278	DB	0aH, 'Fleet Defender - Missile Data File Compiler',  0aH,  00H
$SG279	DB	0aH, 'Compiling F14MD01.TXT...',  00H
$SG281	DB	0aH, 'Error:  Cannot find file F14MD01.TXT',  0aH,  00H
$SG282	DB	'wb',  00H
$SG283	DB	'F14MD01.DAT',  00H
$SG287	DB	'%d %s %d %d %d %d %d %d %d %d %s %d',  0aH,  00H
$SG289	DB	'Compile Complete.',  00H
$SG290	DB	'rb',  00H
$SG291	DB	'F14MD01.DAT',  00H
$SG295	DB	'%-3d %-12s %-3d %-3d %-3d %-3d %-3d %-3d %-3d %-3d %-12s %-3'
	DB	'd',  0aH,  00H
	ORG	$+1
_recsize	DW	02cH
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
; Line 47
	PUBLIC	_main
_main	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
; Line 48
	mov	ax,OFFSET DGROUP:$SG276
	push	ax
	mov	ax,OFFSET DGROUP:$SG277
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _tfile,ax
; Line 50
	mov	ax,OFFSET DGROUP:$SG278
	push	ax
	call	_printf
	add	sp,2
; Line 51
	mov	ax,OFFSET DGROUP:$SG279
	push	ax
	call	_printf
	add	sp,2
; Line 52
	cmp	WORD PTR _tfile,0
	jne	$I280
; Line 53
	mov	ax,OFFSET DGROUP:$SG281
	push	ax
	call	_printf
	add	sp,2
; Line 54
	mov	ax,-1
	push	ax
	call	_exit
	add	sp,2
; Line 55
; Line 57
$I280:
	mov	ax,OFFSET DGROUP:$SG282
	push	ax
	mov	ax,OFFSET DGROUP:$SG283
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _outfile,ax
; Line 61
	jmp	SHORT $L20001
$FC285:
; Line 62
	mov	ax,WORD PTR _MissileEnumId
	mov	WORD PTR _missilerec,ax
; Line 63
	mov	ax,OFFSET DGROUP:_name
	push	ax
	mov	ax,OFFSET DGROUP:_missilerec+2
	push	ax
	call	_strcpy
	add	sp,4
; Line 64
	mov	ax,WORD PTR _range
	mov	WORD PTR _missilerec+14,ax
; Line 65
	mov	ax,WORD PTR _minrange
	mov	WORD PTR _missilerec+16,ax
; Line 66
	mov	ax,WORD PTR _maxalt
	mov	WORD PTR _missilerec+18,ax
; Line 67
	mov	ax,WORD PTR _speed
	mov	WORD PTR _missilerec+20,ax
; Line 68
	mov	ax,WORD PTR _homing
	mov	WORD PTR _missilerec+22,ax
; Line 69
	mov	ax,WORD PTR _maneuver
	mov	WORD PTR _missilerec+24,ax
; Line 70
	mov	ax,WORD PTR _cmeffect
	mov	WORD PTR _missilerec+26,ax
; Line 71
	mov	ax,WORD PTR _damage
	mov	WORD PTR _missilerec+28,ax
; Line 72
	mov	ax,OFFSET DGROUP:_filename
	push	ax
	mov	ax,OFFSET DGROUP:_missilerec+30
	push	ax
	call	_strcpy
	add	sp,4
; Line 73
	mov	ax,WORD PTR _type
	mov	WORD PTR _missilerec+42,ax
; Line 74
	push	WORD PTR _outfile
	mov	ax,1
	push	ax
	push	WORD PTR _recsize
	mov	ax,OFFSET DGROUP:_missilerec
	push	ax
	call	_fwrite
	add	sp,8
; Line 75
	inc	WORD PTR _planecnt
; Line 76
$L20001:
	mov	ax,OFFSET DGROUP:_type
	push	ax
	mov	cx,OFFSET DGROUP:_filename
	push	cx
	mov	dx,OFFSET DGROUP:_damage
	push	dx
	mov	bx,OFFSET DGROUP:_cmeffect
	push	bx
	mov	si,OFFSET DGROUP:_maneuver
	push	si
	mov	di,OFFSET DGROUP:_homing
	push	di
	mov	ax,OFFSET DGROUP:_speed
	push	ax
	mov	ax,OFFSET DGROUP:_maxalt
	push	ax
	mov	ax,OFFSET DGROUP:_minrange
	push	ax
	mov	ax,OFFSET DGROUP:_range
	push	ax
	mov	ax,OFFSET DGROUP:_name
	push	ax
	mov	ax,OFFSET DGROUP:_MissileEnumId
	push	ax
	mov	ax,OFFSET DGROUP:$SG287
	push	ax
	push	WORD PTR _tfile
	call	_fscanf
	add	sp,28
	mov	WORD PTR _flstat,ax
	cmp	ax,-1
	je	$JCC272
	jmp	$FC285
$JCC272:
; Line 78
	push	WORD PTR _tfile
	call	_fclose
	add	sp,2
; Line 79
	push	WORD PTR _outfile
	call	_fclose
	add	sp,2
; Line 81
	mov	ax,OFFSET DGROUP:$SG289
	push	ax
	call	_printf
	add	sp,2
; Line 83
	mov	ax,OFFSET DGROUP:$SG290
	push	ax
	mov	ax,OFFSET DGROUP:$SG291
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _outfile,ax
; Line 85
	mov	WORD PTR _i,0
	jmp	SHORT $F292
$FC293:
; Line 87
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR _recsize
	imul	WORD PTR _i
	cwd	
	mov	WORD PTR _recseek,ax
	mov	WORD PTR _recseek+2,dx
	push	dx
	push	ax
	push	WORD PTR _outfile
	call	_fseek
	add	sp,8
; Line 88
	push	WORD PTR _outfile
	mov	ax,1
	push	ax
	push	WORD PTR _recsize
	mov	ax,OFFSET DGROUP:_missilerec
	push	ax
	call	_fread
	add	sp,8
; Line 93
	push	WORD PTR _missilerec+42
	mov	ax,OFFSET DGROUP:_missilerec+30
	push	ax
	push	WORD PTR _missilerec+28
	push	WORD PTR _missilerec+26
	push	WORD PTR _missilerec+24
	push	WORD PTR _missilerec+22
	push	WORD PTR _missilerec+20
	push	WORD PTR _missilerec+18
	push	WORD PTR _missilerec+16
	push	WORD PTR _missilerec+14
	mov	ax,OFFSET DGROUP:_missilerec+2
	push	ax
	push	WORD PTR _missilerec
	mov	ax,OFFSET DGROUP:$SG295
	push	ax
	call	_printf
	add	sp,26
; Line 94
	inc	WORD PTR _i
$F292:
	mov	ax,WORD PTR _planecnt
	cmp	WORD PTR _i,ax
	jl	$FC293
; Line 95
	push	WORD PTR _outfile
	call	_fclose
	add	sp,2
; Line 96
	pop	si
	pop	di
	ret	

_main	ENDP
_TEXT	ENDS
END
