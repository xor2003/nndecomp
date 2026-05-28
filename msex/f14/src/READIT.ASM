;	Static Name Aliases
;
	TITLE   C:\READIT.C
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
PUBLIC  _PlaneCnt
PUBLIC  _memsize
PUBLIC  _recsize
PUBLIC  _planecnt
PUBLIC  _recseek
EXTRN	__acrtused:ABS
EXTRN	_fseek:NEAR
EXTRN	__dos_allocmem:NEAR
EXTRN	_printf:NEAR
EXTRN	__dos_freemem:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fread:NEAR
_BSS      SEGMENT
COMM NEAR	_planeno:	BYTE:	 2
COMM NEAR	_behav:	BYTE:	 2
COMM NEAR	_MasterList:	BYTE:	 4
COMM NEAR	_templist:	BYTE:	 4
COMM NEAR	_newseg:	BYTE:	 2
COMM NEAR	_planecount:	BYTE:	 2
COMM NEAR	_maxsize:	BYTE:	 2
COMM NEAR	_maxseg:	BYTE:	 2
COMM NEAR	_newmem:	BYTE:	 2
COMM NEAR	_tfile:	BYTE:	 2
COMM NEAR	_outfile:	BYTE:	 2
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
COMM NEAR	_planerec:	BYTE:	 44
COMM NEAR	_flstat:	BYTE:	 2
COMM NEAR	_i:	BYTE:	 2
_BSS      ENDS
_DATA      SEGMENT
$SG338	DB	'rb',  00H
$SG339	DB	'F14PD01.DAT',  00H
$SG344	DB	0aH,  0aH, 'Name: %Fs',  0aH,  00H
	ORG	$+12
$SG352	DB	'%d %d %Fs',  0aH,  00H
	ORG	$-23
_recsize	DW	02cH
_planecnt	DW	00H
_recseek	DD	00H
_PlaneCnt	DW	00H
_memsize	DW	02H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 2
; Line 3
; Line 4
; Line 5
; Line 6
; Line 7
; Line 78
	PUBLIC	_main
_main	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	si
; Line 79
	mov	ax,OFFSET DGROUP:$SG338
	push	ax
	mov	ax,OFFSET DGROUP:$SG339
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _outfile,ax
; Line 81
	mov	ax,OFFSET DGROUP:_newseg
	push	ax
	push	WORD PTR _memsize
	call	__dos_allocmem
	add	sp,4
; Line 82
	mov	ax,WORD PTR _newseg
	mov	WORD PTR _MasterList+2,ax
; Line 83
	mov	WORD PTR _MasterList,0
; Line 85
	jmp	SHORT $L20001
	nop	
$FC341:
; Line 87
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR _recsize
	imul	WORD PTR _PlaneCnt
	cwd	
	mov	WORD PTR _recseek,ax
	mov	WORD PTR _recseek+2,dx
	push	dx
	push	ax
	push	bx
	call	_fseek
	add	sp,8
; Line 88
	push	WORD PTR _outfile
	mov	ax,1
	push	ax
	push	WORD PTR _recsize
	mov	ax,OFFSET DGROUP:_planerec
	push	ax
	call	_fread
	add	sp,8
; Line 89
	mov	ax,30
	imul	WORD PTR _PlaneCnt
	mov	si,ax
	les	bx,DWORD PTR _MasterList
	mov	ax,WORD PTR _planerec+10
	mov	WORD PTR es:[bx+10][si],ax
; Line 90
	mov	ax,30
	imul	WORD PTR _PlaneCnt
	mov	si,ax
	les	bx,DWORD PTR _MasterList
	mov	ax,WORD PTR _planerec+14
	mov	WORD PTR es:[bx+14][si],ax
; Line 91
	mov	ax,OFFSET DGROUP:_planerec+2
	push	ds
	push	ax
	mov	ax,30
	imul	WORD PTR _PlaneCnt
	add	ax,WORD PTR _MasterList
	mov	dx,WORD PTR _MasterList+2
	inc	ax
	inc	ax
	push	dx
	push	ax
	call	_fstrcpy
	add	sp,8
; Line 92
	inc	WORD PTR _PlaneCnt
; Line 93
$L20001:
	mov	bx,WORD PTR _outfile
	test	BYTE PTR [bx+6],16
	jne	$JCC183
	jmp	$FC341
$JCC183:
; Line 95
	push	bx
	call	_fclose
	add	sp,2
; Line 97
	call	_PrintList
; Line 98
	mov	ax,20
	push	ax
	call	_GetPtr
	add	sp,2
	mov	WORD PTR _templist,ax
	mov	WORD PTR _templist+2,dx
; Line 99
	inc	ax
	inc	ax
	push	dx
	push	ax
	mov	ax,OFFSET DGROUP:$SG344
	push	ax
	call	_printf
	add	sp,6
; Line 100
	push	WORD PTR _newseg
	call	__dos_freemem
	add	sp,2
; Line 101
	pop	si
	ret	
	nop	

_main	ENDP
; Line 104
	PUBLIC	_GetPtr
_GetPtr	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	num = 4
; Line 105
	mov	ax,30
	imul	WORD PTR [bp+4]	;num
	add	ax,WORD PTR _MasterList
	mov	dx,WORD PTR _MasterList+2
; Line 106
	mov	sp,bp
	pop	bp
	ret	

_GetPtr	ENDP
; Line 109
	PUBLIC	_PrintList
_PrintList	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	i = -2
; Line 112
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F349
	nop	
$FC350:
; Line 114
	mov	ax,30
	imul	WORD PTR [bp-2]	;i
	add	ax,WORD PTR _MasterList
	mov	dx,WORD PTR _MasterList+2
	mov	cx,ax
	inc	ax
	inc	ax
	push	dx
	push	ax
	mov	es,dx
	mov	si,cx
	push	WORD PTR es:[si+14]
	push	WORD PTR es:[si+10]
	mov	ax,OFFSET DGROUP:$SG352
	push	ax
	call	_printf
	add	sp,10
	inc	WORD PTR [bp-2]	;i
$F349:
	mov	ax,WORD PTR _PlaneCnt
	dec	ax
	cmp	ax,WORD PTR [bp-2]	;i
	jg	$FC350
; Line 115
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_PrintList	ENDP
; Line 118
	PUBLIC	_fstrcpy
_fstrcpy	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	S = 8
;	D = 4
; Line 119
$FC357:
	les	bx,DWORD PTR [bp+8]	;S
	inc	WORD PTR [bp+8]	;S
	mov	al,BYTE PTR es:[bx]
	les	bx,DWORD PTR [bp+4]	;D
	inc	WORD PTR [bp+4]	;D
	mov	BYTE PTR es:[bx],al
	or	al,al
	jne	$FC357
; Line 120
	mov	ax,WORD PTR [bp+4]	;D
	mov	dx,WORD PTR [bp+6]
; Line 121
	mov	sp,bp
	pop	bp
	ret	
	nop	

_fstrcpy	ENDP
_TEXT	ENDS
END
