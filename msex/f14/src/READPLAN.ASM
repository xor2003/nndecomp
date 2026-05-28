;	Static Name Aliases
;
	TITLE   C:\READPLAN.C
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
EXTRN	_strcpy:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fread:NEAR
_BSS      SEGMENT
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
COMM NEAR	_flstat:	BYTE:	 2
COMM NEAR	_i:	BYTE:	 2
COMM NEAR	_planeno:	BYTE:	 2
COMM NEAR	_behav:	BYTE:	 2
COMM NEAR	_ecm:	BYTE:	 2
COMM NEAR	_status:	BYTE:	 2
COMM NEAR	_tfile:	BYTE:	 2
COMM NEAR	_outfile:	BYTE:	 2
COMM NEAR	_buf:	 1:	 15
COMM NEAR	_name:	 1:	 7
_BSS      ENDS
_DATA      SEGMENT
$SG280	DB	'r',  00H
$SG281	DB	'F14PD01.TXT',  00H
$SG282	DB	'wb',  00H
$SG283	DB	'F14PD01.DAT',  00H
$SG287	DB	'%d %s %d %d %d %s %d %d %d %d %d %d %d %d %d',  0aH,  00H
$SG289	DB	'rb',  00H
$SG290	DB	'F14PD01.DAT',  00H
$SG294	DB	'%-3d %-8s %-4d %-3d %-3d %-12s %-3d %-3d %-3d %-3d %-3d %-3d'
	DB	' %-3d %-3d %-3d',  0aH,  00H
	ORG	$+1
_recsize	DW	030H
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
; Line 52
	PUBLIC	_main
_main	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
; Line 53
	mov	ax,OFFSET DGROUP:$SG280
	push	ax
	mov	ax,OFFSET DGROUP:$SG281
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _tfile,ax
; Line 54
	mov	ax,OFFSET DGROUP:$SG282
	push	ax
	mov	ax,OFFSET DGROUP:$SG283
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _outfile,ax
; Line 58
	jmp	$L20001
$FC285:
; Line 59
	mov	ax,WORD PTR _planeno
	mov	WORD PTR _planerec,ax
; Line 60
	mov	ax,OFFSET DGROUP:_name
	push	ax
	mov	ax,OFFSET DGROUP:_planerec+2
	push	ax
	call	_strcpy
	add	sp,4
; Line 61
	mov	ax,WORD PTR _speed
	mov	WORD PTR _planerec+10,ax
; Line 62
	mov	ax,WORD PTR _maneuver
	mov	WORD PTR _planerec+12,ax
; Line 63
	mov	ax,WORD PTR _rclass
	mov	WORD PTR _planerec+14,ax
; Line 64
	mov	ax,OFFSET DGROUP:_filename
	push	ax
	mov	ax,OFFSET DGROUP:_planerec+16
	push	ax
	call	_strcpy
	add	sp,4
; Line 65
	mov	ax,WORD PTR _radarsig
	mov	WORD PTR _planerec+30,ax
; Line 66
	mov	ax,WORD PTR _gun
	mov	WORD PTR _planerec+32,ax
; Line 67
	mov	ax,WORD PTR _alignment
	mov	WORD PTR _planerec+34,ax
; Line 68
	mov	ax,WORD PTR _ecm
	mov	WORD PTR _planerec+36,ax
; Line 69
	mov	ax,WORD PTR _miss1
	mov	WORD PTR _planerec+38,ax
; Line 70
	mov	ax,WORD PTR _miss2
	mov	WORD PTR _planerec+40,ax
; Line 71
	mov	ax,WORD PTR _mcount1
	mov	WORD PTR _planerec+42,ax
; Line 72
	mov	ax,WORD PTR _mcount2
	mov	WORD PTR _planerec+44,ax
; Line 73
	mov	ax,WORD PTR _behav
	mov	WORD PTR _planerec+46,ax
; Line 74
	push	WORD PTR _outfile
	mov	ax,1
	push	ax
	push	WORD PTR _recsize
	mov	ax,OFFSET DGROUP:_planerec
	push	ax
	call	_fwrite
	add	sp,8
; Line 75
	inc	WORD PTR _planecnt
; Line 76
$L20001:
	mov	ax,OFFSET DGROUP:_behav
	push	ax
	mov	cx,OFFSET DGROUP:_mcount2
	push	cx
	mov	dx,OFFSET DGROUP:_mcount1
	push	dx
	mov	bx,OFFSET DGROUP:_miss2
	push	bx
	mov	si,OFFSET DGROUP:_miss1
	push	si
	mov	di,OFFSET DGROUP:_ecm
	push	di
	mov	ax,OFFSET DGROUP:_alignment
	push	ax
	mov	ax,OFFSET DGROUP:_gun
	push	ax
	mov	ax,OFFSET DGROUP:_radarsig
	push	ax
	mov	ax,OFFSET DGROUP:_filename
	push	ax
	mov	ax,OFFSET DGROUP:_rclass
	push	ax
	mov	ax,OFFSET DGROUP:_maneuver
	push	ax
	mov	ax,OFFSET DGROUP:_speed
	push	ax
	mov	ax,OFFSET DGROUP:_name
	push	ax
	mov	ax,OFFSET DGROUP:_planeno
	push	ax
	mov	ax,OFFSET DGROUP:$SG287
	push	ax
	push	WORD PTR _tfile
	call	_fscanf
	add	sp,34
	mov	WORD PTR _flstat,ax
	cmp	ax,-1
	je	$JCC256
	jmp	$FC285
$JCC256:
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
	mov	ax,OFFSET DGROUP:$SG290
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _outfile,ax
; Line 83
	mov	WORD PTR _i,0
	jmp	SHORT $F291
$FC292:
; Line 85
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
; Line 86
	push	WORD PTR _outfile
	mov	ax,1
	push	ax
	push	WORD PTR _recsize
	mov	ax,OFFSET DGROUP:_planerec
	push	ax
	call	_fread
	add	sp,8
; Line 93
	push	WORD PTR _planerec+46
	push	WORD PTR _planerec+44
	push	WORD PTR _planerec+42
	push	WORD PTR _planerec+40
	push	WORD PTR _planerec+38
	push	WORD PTR _planerec+36
	push	WORD PTR _planerec+34
	push	WORD PTR _planerec+32
	push	WORD PTR _planerec+30
	mov	ax,OFFSET DGROUP:_planerec+16
	push	ax
	push	WORD PTR _planerec+14
	push	WORD PTR _planerec+12
	push	WORD PTR _planerec+10
	mov	ax,OFFSET DGROUP:_planerec+2
	push	ax
	push	WORD PTR _planerec
	mov	ax,OFFSET DGROUP:$SG294
	push	ax
	call	_printf
	add	sp,32
; Line 94
	inc	WORD PTR _i
$F291:
	mov	ax,WORD PTR _planecnt
	cmp	WORD PTR _i,ax
	jge	$JCC439
	jmp	$FC292
$JCC439:
; Line 95
	push	WORD PTR _outfile
	call	_fclose
	add	sp,2
; Line 96
	pop	si
	pop	di
	ret	
	nop	

_main	ENDP
_TEXT	ENDS
END
