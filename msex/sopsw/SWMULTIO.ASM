;	Static Name Aliases
;
;	$S192_first	EQU	first
;	$S193_errormsg	EQU	errormsg
;	$S194_errflg1	EQU	errflg1
;	$S195_errorflg	EQU	errorflg
;	$S196_multterm	EQU	multterm
;	$S197_swlocked	EQU	swlocked
;	$S198_errtab	EQU	errtab
;	$S199_errwhr	EQU	errwhr
;	$S200_errptr	EQU	errptr
;	$S179_prtbuf	EQU	prtbuf
;	$S180_swbpb	EQU	swbpb
;	$S181_devfd	EQU	devfd
;	$S182_multdriv	EQU	multdriv
;	$S183_commdriv	EQU	commdriv
;	$S184_multhead	EQU	multhead
;	$S185_commhead	EQU	commhead
;	$S186_multtrk	EQU	multtrk
;	$S187_commtrk	EQU	commtrk
;	$S188_multsect	EQU	multsect
;	$S189_commsect	EQU	commsect
;	$S190_multasect	EQU	multasect
;	$S191_commasect	EQU	commasect
;	$S453_first	EQU	first
;	$S446_curtry	EQU	curtry
;	$S579_nextdelay	EQU	nextdelay
;	$S580_maxtry	EQU	maxtry
;	$S581_mintry	EQU	mintry
;	$S582_numtry	EQU	numtry
;	$S583_nummov	EQU	nummov
;	$S584_numdel	EQU	numdel
;	$S585_numadjup	EQU	numadjup
;	$S586_numadjdn	EQU	numadjdn
;	$S594_upcnt	EQU	upcnt
;	$S595_dncnt	EQU	dncnt
	TITLE   C:\SWMULTIO.C
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
PUBLIC  _multfile
PUBLIC  _cmndfile
EXTRN	__dkioset:NEAR
EXTRN	_intsoff:NEAR
EXTRN	_bseek:NEAR
EXTRN	_intson:NEAR
EXTRN	_bread:NEAR
EXTRN	_puts:NEAR
EXTRN	_dispd:NEAR
EXTRN	_swgetc:NEAR
EXTRN	_swflush:NEAR
EXTRN	_clrprmpt:NEAR
EXTRN	__dkproc:NEAR
EXTRN	__dkiosts:NEAR
EXTRN	_interpret:NEAR
EXTRN	_asynget:NEAR
EXTRN	_initplyr:NEAR
EXTRN	_movepln:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_initcomp:NEAR
EXTRN	_dispmult:NEAR
EXTRN	_histmult:NEAR
EXTRN	_tolower:NEAR
EXTRN	_setvdisp:NEAR
EXTRN	_bopen:NEAR
EXTRN	__dktick:NEAR
EXTRN	_dispwobj:NEAR
EXTRN	_strncmp:NEAR
EXTRN	_swend:NEAR
EXTRN	_ctlbreak:NEAR
EXTRN	_initpln:NEAR
EXTRN	_movmem:NEAR
EXTRN	__dkio:NEAR
EXTRN	_toupper:NEAR
EXTRN	_dsseg:NEAR
EXTRN	_sysint21:NEAR
EXTRN	_bioerr:NEAR
EXTRN	_bwrite:NEAR
EXTRN	_getgame:NEAR
EXTRN	_playmode:WORD
EXTRN	_swgames:BYTE
EXTRN	_currgame:WORD
EXTRN	_multbuff:WORD
EXTRN	_player:WORD
EXTRN	_nobjects:WORD
EXTRN	_oobjects:BYTE
EXTRN	_repflag:WORD
EXTRN	_counttick:WORD
EXTRN	_multtick:WORD
EXTRN	_auxdisp:BYTE
EXTRN	_explseed:WORD
EXTRN	_compplane:WORD
EXTRN	_plyrplane:WORD
EXTRN	_currobx:WORD
EXTRN	_endsts:BYTE
EXTRN	_dispcnt:WORD
EXTRN	_endstat:WORD
EXTRN	_multaddr:WORD
_BSS      SEGMENT
COMM NEAR	_multstck:	 1:	 400
COMM NEAR	_multstack:	BYTE:	 2
_BSS      ENDS
_DATA      SEGMENT
$SG173	DB	'c:sopwith?.dta',  00H
$SG175	DB	'c:semaphor',  00H, '   ',  00H
	ORG	$+14
$SG238	DB	'rw',  00H
$SG240	DB	'Improper device specification',  00H
$SG247	DB	'File not found',  00H
$SG398	DB	'Read error on communications file during close',  00H
$SG401	DB	'Communications file locked during close',  00H
$SG405	DB	'Bad player counter',  00H
$SG416	DB	'Write error on communications file',  00H
$SG419	DB	'Unlock error on communications file',  00H
$SG438	DB	'Read error during wait',  00H
$SG440	DB	'Bad player count',  00H
$SG471	DB	'Write error during play',  00H
$SG473	DB	'Bad Player count',  00H
	ORG	$+4
$SG510	DB	'Read error during play',  00H
$SG512	DB	'Bad player count',  00H
$SG523	DB	0dH,  0aH,  0dH,  0aH,  00H
$SG525	DB	' i/o errors recorded',  0dH,  0aH,  0dH,  0aH,  00H
$SG527	DB	'last 50:',  0dH,  0aH,  0dH,  0aH,  00H
$SG546	DB	'READ      ',  00H
$SG548	DB	'WRITE     ',  00H
$SG550	DB	'READPLAY  ',  00H
$SG552	DB	'WRITEPLAY ',  00H
$SG558	DB	'TIME OUT',  00H
$SG560	DB	'BAD SEEK',  00H
$SG562	DB	'BAD NEC',  00H
$SG564	DB	'BAD CRC',  00H
$SG566	DB	'DMA BOUNDARY ',  00H
$SG568	DB	'BAD DMA',  00H
$SG570	DB	'RECORD NOT FOUND',  00H
$SG572	DB	'WRITE PROTECT',  00H
$SG574	DB	'BAD ADDR MARK ',  00H
$SG576	DB	'BAD COMMAND',  00H
$SG578	DB	0dH,  0aH,  00H
	ORG	$+16
$SG605	DB	0dH,  0aH, 'Number of moves:        ',  00H
$SG606	DB	0dH,  0aH, 'Number of read tries:   ',  00H
$SG607	DB	0dH,  0aH, 'Minimum tries/move:     ',  00H
$SG610	DB	0dH,  0aH, 'Maximum tries/move:     ',  00H
$SG611	DB	0dH,  0aH, 'Number of tick delays:  ',  00H
$SG612	DB	0dH,  0aH, '# of tick adjusts up:   ',  00H
$SG613	DB	0dH,  0aH, '# of tick adjusts down: ',  00H
$SG617	DB	0aH,  0dH,  0aH,  0dH,  00H
$SG619	DB	'Bad player count',  00H
$SG623	DB	0dH,  0aH, 'Player: ',  00H
$SG625	DB	'  <- last update ',  00H
$SG649	DB	'Read error on communications file ',  00H
$SG651	DB	'Communications file locked ',  00H
$SG659	DB	'Mamimum number of players already playing',  00H
$SG675	DB	'Write error on communications file',  00H
$SG677	DB	'Unlock error on communications file',  00H
$SG678	DB	'      Waiting for other player(s)',  00H
$SG681	DB	' Key maximum number of players allowed',  00H
	ORG	$-1073
_multfile	DW	DGROUP:$SG173
_cmndfile	DW	DGROUP:$SG175
$S179_prtbuf	DW	_auxdisp
$S195_errorflg	DW	00H
$S196_multterm	DW	00H
$S197_swlocked	DW	00H
$S200_errptr	DW	0ffffH
	ORG	$+306
$S446_curtry	DW	00H
$S453_first	DW	01H
	ORG	$+244
$S579_nextdelay	DW	02H
$S580_maxtry	DW	00H
$S581_mintry	DW	02710H
$S582_numtry	DW	00H
$S583_nummov	DW	00H
$S584_numdel	DW	00H
$S585_numadjup	DW	00H
$S586_numadjdn	DW	00H
_DATA      ENDS
_BSS      SEGMENT
	ORG	$+22
$S192_first	DW 01H DUP (?)
	ORG	$-10
$S193_errormsg	DW 01H DUP (?)
	ORG	$+116
$S194_errflg1	DW 01H DUP (?)
	ORG	$-102
$S198_errtab	DW 032H DUP (?)
	ORG	$+2
$S199_errwhr	DW 032H DUP (?)
	ORG	$+2
$S594_upcnt	DW 01H DUP (?)
	ORG	$-4
$S595_dncnt	DW 01H DUP (?)
	ORG	$-216
$S180_swbpb	DW 01H DUP (?)
	ORG	$-10
$S181_devfd	DW 01H DUP (?)
	ORG	$+4
$S182_multdriv	DW 01H DUP (?)
	ORG	$-10
$S183_commdriv	DW 01H DUP (?)
	ORG	$-6
$S184_multhead	DW 01H DUP (?)
	ORG	$-4
$S185_commhead	DW 01H DUP (?)
	ORG	$-4
$S186_multtrk	DW 01H DUP (?)
	ORG	$-4
$S187_commtrk	DW 01H DUP (?)
	ORG	$+14
$S188_multsect	DW 01H DUP (?)
	ORG	$-10
$S189_commsect	DW 01H DUP (?)
	ORG	$+18
$S190_multasect	DW 02H DUP (?)
	ORG	$-8
$S191_commasect	DW 02H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 24
; Line 27
; Line 28
; Line 29
; Line 30
; Line 31
; Line 123
	PUBLIC	__word
__word	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	ptr = 4
; Line 125
	mov	bx,WORD PTR [bp+4]	;ptr
	mov	ah,BYTE PTR [bx+1]
	sub	al,al
	mov	cl,BYTE PTR [bx]
	sub	ch,ch
	or	ax,cx
; Line 126
	mov	sp,bp
	pop	bp
	ret	

__word	ENDP
; Line 131
	PUBLIC	__byte
__byte	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	ptr = 4
; Line 133
	mov	bx,WORD PTR [bp+4]	;ptr
	mov	al,BYTE PTR [bx]
	sub	ah,ah
; Line 134
	mov	sp,bp
	pop	bp
	ret	
	nop	

__byte	ENDP
; Line 139
	PUBLIC	__fromintel
__fromintel	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 149
	ret	

__fromintel	ENDP
; Line 154
	PUBLIC	__tointel
__tointel	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 156
	mov	ax,WORD PTR _multbuff
; Line 172
	ret	
	nop	

__tointel	ENDP
; Line 178
	PUBLIC	_movemult
_movemult	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	register si = ob
;	obp = 4
; Line 182
	sub	ax,ax
	mov	WORD PTR _compplane,ax
	mov	WORD PTR _plyrplane,ax
; Line 184
	mov	si,WORD PTR [bp+4]	;obp
	mov	bx,WORD PTR [si+56]
	mov	WORD PTR _currobx,bx
	shl	bx,1
	mov	ax,WORD PTR _endsts[bx]
	mov	WORD PTR _endstat,ax
; Line 186
	cmp	WORD PTR _dispcnt,0
	jne	$I214
; Line 188
	cmp	WORD PTR _playmode,1
	jne	$L20001
	push	si
	call	_multget
	jmp	SHORT $L20011
	nop	
$L20001:
	push	si
	call	_asynget
$L20011:
	add	sp,2
	mov	WORD PTR [bp-2],ax
	push	ax
	push	si
	call	_interpret
	add	sp,4
; Line 189
	jmp	SHORT $I218
$I214:
; Line 191
	sub	ax,ax
	mov	WORD PTR [si+18],ax
	mov	WORD PTR [si+38],ax
; Line 192
$I218:
; Line 194
	cmp	WORD PTR [si],4
	je	$I220
	cmp	WORD PTR [si],93
	jne	$I221
$I220:
	cmp	WORD PTR [si+26],0
	jg	$I221
; Line 195
	cmp	WORD PTR [si+30],-5000
	jle	$I221
; Line 196
	inc	WORD PTR [si+76]
; Line 197
	push	si
	call	_initpln
	add	sp,2
; Line 198
; Line 199
$I221:
	push	si
	call	_movepln
	add	sp,2
; Line 200
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_movemult	ENDP
; Line 204
	PUBLIC	_multopen
_multopen	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	multfile = 6
;	cmndfile = 4
; Line 208
	push	WORD PTR [bp+4]	;cmndfile
	call	_multparm
	mov	sp,bp
; Line 210
	mov	ax,WORD PTR $S182_multdriv
	mov	WORD PTR $S183_commdriv,ax
; Line 211
	mov	ax,WORD PTR $S184_multhead
	mov	WORD PTR $S185_commhead,ax
; Line 212
	mov	ax,WORD PTR $S186_multtrk
	mov	WORD PTR $S187_commtrk,ax
; Line 213
	mov	ax,WORD PTR $S188_multsect
	mov	WORD PTR $S189_commsect,ax
; Line 214
	mov	ax,WORD PTR $S190_multasect
	mov	dx,WORD PTR $S190_multasect+2
	mov	WORD PTR $S191_commasect,ax
	mov	WORD PTR $S191_commasect+2,dx
; Line 216
	push	WORD PTR [bp+6]	;multfile
	call	_multparm
; Line 218
	mov	sp,bp
	pop	bp
	ret	

_multopen	ENDP
; Line 223
	PUBLIC	_multparm
_multparm	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	di
	push	si
;	dev = -6
;	fd = -2
;	register si = i
;	register di = mf
;	multfile = 4
; Line 231
	mov	BYTE PTR [bp-4],0
; Line 235
	mov	ax,WORD PTR [bp+4]	;multfile
	mov	WORD PTR [bp-8],ax
	mov	di,1
	add	di,ax
	mov	bx,ax
	mov	al,BYTE PTR [bx]
	cbw	
	push	ax
	call	_tolower
	add	sp,2
	mov	BYTE PTR [bp-6],al	;dev
	cbw	
	sub	ax,97
	mov	WORD PTR $S182_multdriv,ax
	or	ax,ax
	jl	$I237
	cmp	ax,25
	jg	$I237
	mov	al,BYTE PTR [di]
	mov	BYTE PTR [bp-5],al
	inc	di
	cmp	al,58
	jne	$I237
	mov	ax,OFFSET DGROUP:$SG238
	push	ax
	lea	ax,WORD PTR [bp-6]	;dev
	push	ax
	call	_bopen
	add	sp,4
	mov	WORD PTR $S181_devfd,ax
	mov	WORD PTR [bp-2],ax	;fd
	or	ax,ax
	jne	$I236
$I237:
; Line 236
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG240
	push	ax
	call	_swend
	add	sp,4
; Line 239
$I236:
	sub	si,si
; Line 240
	jmp	SHORT $L20012
$FC242:
; Line 241
	mov	al,BYTE PTR [bx]
	cbw	
	push	ax
	mov	WORD PTR [bp-8],bx
	call	_toupper
	add	sp,2
	mov	bx,WORD PTR [bp-8]
	mov	BYTE PTR [bx],al
; Line 242
	inc	si
; Line 243
$L20012:
	mov	bx,di
	add	bx,si
	cmp	BYTE PTR [bx],0
	jne	$FC242
; Line 244
	push	di
	push	WORD PTR [bp-2]	;fd
	call	name_to_sec
	add	sp,4
	mov	WORD PTR $S188_multsect,ax
	or	ax,ax
	jne	$I246
; Line 245
	push	ax
	mov	ax,OFFSET DGROUP:$SG247
	push	ax
	call	_swend
	add	sp,4
; Line 247
$I246:
	dec	WORD PTR $S188_multsect
	mov	ax,WORD PTR $S188_multsect
	cwd	
	mov	WORD PTR $S190_multasect,ax
	mov	WORD PTR $S190_multasect+2,dx
; Line 248
	call	_sectparm
; Line 249
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_multparm	ENDP
; Line 254
name_to_sec	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,52
	call	__aNchkstk
;	bpb = -52
;	entry = -32
;	name = 6
;	fd = 4
; Line 260
	lea	ax,WORD PTR [bp-52]	;bpb
	push	ax
	push	WORD PTR [bp+4]	;fd
	call	make_bpb
	add	sp,4
; Line 261
	lea	ax,WORD PTR [bp-32]	;entry
	push	ax
	push	WORD PTR [bp+6]	;name
	lea	ax,WORD PTR [bp-52]	;bpb
	push	ax
	push	WORD PTR [bp+4]	;fd
	call	get_ent
	add	sp,8
	or	ax,ax
	je	$EX251
; Line 263
	lea	ax,WORD PTR [bp-52]	;bpb
	push	ax
	lea	ax,WORD PTR [bp-6]
	push	ax
	call	__word
	add	sp,2
	push	ax
	call	clu_to_sec
; Line 264
$EX251:
	mov	sp,bp
	pop	bp
	ret	

name_to_sec	ENDP
; Line 269
clu_to_sec	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	di
	push	si
;	bpb = 6
;	cluster = 4
; Line 277
	mov	ax,WORD PTR [bp+6]	;bpb
	add	ax,6
	push	ax
	call	__word
	add	sp,2
	mov	cl,4
	sar	ax,cl
	mov	cx,WORD PTR [bp+6]	;bpb
	inc	cx
	inc	cx
	push	cx
	mov	si,ax
	call	__byte
	add	sp,2
	mov	cx,WORD PTR [bp+6]	;bpb
	add	cx,5
	push	cx
	mov	di,ax
	call	__byte
	add	sp,2
	mov	cx,WORD PTR [bp+6]	;bpb
	add	cx,11
	push	cx
	mov	WORD PTR [bp-2],ax
	call	__word
	add	sp,2
	mov	cx,WORD PTR [bp+6]	;bpb
	add	cx,3
	push	cx
	mov	WORD PTR [bp-4],ax
	call	__word
	add	sp,2
	mov	cx,WORD PTR [bp+4]	;cluster
	dec	cx
	dec	cx
	mov	dx,ax
	mov	ax,di
	mov	bx,dx
	imul	cx
	mov	cx,ax
	mov	ax,WORD PTR [bp-4]
	imul	WORD PTR [bp-2]
	add	ax,cx
	add	ax,si
	add	ax,bx
	inc	ax
; Line 278
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

clu_to_sec	ENDP
; Line 283
make_bpb	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	bpb = 6
;	fd = 4
; Line 286
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	push	WORD PTR [bp+4]	;fd
	call	_bseek
	mov	sp,bp
; Line 287
	push	WORD PTR [bp+4]	;fd
	mov	ax,512
	push	ax
	push	WORD PTR $S179_prtbuf
	call	_bread
	mov	sp,bp
; Line 288
	mov	ax,19
	push	ax
	push	WORD PTR [bp+6]	;bpb
	mov	ax,WORD PTR $S179_prtbuf
	add	ax,11
	push	ax
	call	_movmem
; Line 289
	mov	ax,WORD PTR [bp+6]	;bpb
	mov	WORD PTR $S180_swbpb,ax
; Line 290
	mov	sp,bp
	pop	bp
	ret	

make_bpb	ENDP
; Line 296
get_ent	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	entry = 10
;	name = 8
;	bpb = 6
;	fd = 4
; Line 301
	mov	bx,WORD PTR [bp+8]	;name
	cmp	BYTE PTR [bx],92
	jne	$I271
; Line 302
	inc	WORD PTR [bp+8]	;name
; Line 303
$I271:
	push	WORD PTR [bp+10]	;entry
	push	WORD PTR [bp+8]	;name
	push	WORD PTR [bp+6]	;bpb
	push	WORD PTR [bp+4]	;fd
	call	lookup
; Line 304
	mov	sp,bp
	pop	bp
	ret	

get_ent	ENDP
; Line 309
lookup	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
	push	di
	push	si
;	block = -16
;	strtdir = -18
;	register si = i
;	register di = current
;	want = -12
;	entry = 10
;	name = 8
;	bpb = 6
;	fd = 4
; Line 320
	sub	si,si
	jmp	SHORT $F283
	nop	
$I286:
; Line 325
	mov	al,BYTE PTR [bx]
	mov	BYTE PTR [bp-12][si],al
	inc	si
; Line 326
$FC284:
	inc	WORD PTR [bp+8]	;name
$F283:
	mov	bx,WORD PTR [bp+8]	;name
	cmp	BYTE PTR [bx],0
	je	$L20013
	cmp	si,12
	jge	$L20013
; Line 321
	cmp	BYTE PTR [bx],46
	jne	$I286
; Line 322
$FC288:
	cmp	si,8
	jge	$FC284
; Line 323
	mov	BYTE PTR [bp-12][si],32
	inc	si
	jmp	SHORT $FC288
	nop	
$FC292:
; Line 328
	mov	BYTE PTR [bp-12][si],32
	inc	si
$L20013:
	cmp	si,11
	jl	$FC292
; Line 329
	mov	BYTE PTR [bp-1],0
; Line 333
	sub	ax,ax
	push	ax
	mov	cx,WORD PTR [bp+6]	;bpb
	add	cx,3
	push	cx
	call	__word
	add	sp,2
	mov	cx,WORD PTR [bp+6]	;bpb
	add	cx,5
	push	cx
	mov	WORD PTR [bp-20],ax
	call	__byte
	add	sp,2
	mov	cx,WORD PTR [bp+6]	;bpb
	add	cx,11
	push	cx
	mov	WORD PTR [bp-22],ax
	call	__word
	add	sp,2
	imul	WORD PTR [bp-22]
	add	ax,WORD PTR [bp-20]
	inc	ax
	cwd	
	mov	WORD PTR [bp-16],ax	;block
	mov	WORD PTR [bp-14],dx
	sub	ax,1
	sbb	dx,0
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	push	WORD PTR [bp+4]	;fd
	call	_bseek
	add	sp,8
; Line 336
	mov	WORD PTR [bp-18],0	;strtdir
	jmp	SHORT $F294
; Line 343
$I300:
	mov	ax,11
	push	ax
	push	di
	lea	ax,WORD PTR [bp-12]	;want
	push	ax
	call	_strncmp
	add	sp,6
	or	ax,ax
	jne	$FC298
; Line 344
	mov	ax,32
	push	ax
	push	WORD PTR [bp+10]	;entry
	push	di
	call	_movmem
	add	sp,6
; Line 345
	mov	ax,1
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 346
; Line 347
$FC298:
	inc	si
	add	di,32
$F297:
	cmp	si,16
	jge	$FC295
; Line 341
	cmp	BYTE PTR [di],0
	jne	$I300
; Line 342
$L20014:
	sub	ax,ax
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 348
$FC295:
	add	WORD PTR [bp-18],16	;strtdir
$F294:
	mov	ax,WORD PTR [bp+6]	;bpb
	add	ax,6
	push	ax
	call	__word
	add	sp,2
	cmp	ax,WORD PTR [bp-18]	;strtdir
	jle	$L20014
; Line 337
	push	WORD PTR [bp+4]	;fd
	mov	ax,512
	push	ax
	push	WORD PTR $S179_prtbuf
	call	_bread
	add	sp,6
; Line 340
	mov	di,WORD PTR $S179_prtbuf
	sub	si,si
	jmp	SHORT $F297
	nop	

lookup	ENDP
; Line 355
	PUBLIC	_sectparm
_sectparm	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,90
	call	__aNchkstk
	push	si
;	key = -74
;	reg = -90
;	iocbuf = -72
;	spc = -2
; Line 369
	mov	ax,WORD PTR $S180_swbpb
	add	ax,15
	push	ax
	call	__word
	add	sp,2
	mov	cx,ax
	mov	ax,WORD PTR $S180_swbpb
	add	ax,13
	push	ax
	mov	si,cx
	call	__word
	add	sp,2
	imul	si
	mov	WORD PTR [bp-2],ax	;spc
; Line 370
	mov	ax,WORD PTR $S188_multsect
	cwd	
	idiv	WORD PTR [bp-2]	;spc
	mov	WORD PTR $S186_multtrk,ax
; Line 371
	imul	WORD PTR [bp-2]	;spc
	sub	WORD PTR $S188_multsect,ax
; Line 372
	mov	ax,WORD PTR $S180_swbpb
	add	ax,13
	push	ax
	call	__word
	add	sp,2
	mov	cx,ax
	mov	ax,WORD PTR $S188_multsect
	cwd	
	idiv	cx
	mov	WORD PTR $S184_multhead,ax
; Line 373
	mov	ax,WORD PTR $S180_swbpb
	add	ax,13
	push	ax
	call	__word
	add	sp,2
	imul	WORD PTR $S184_multhead
	dec	ax
	neg	ax
	add	WORD PTR $S188_multsect,ax
; Line 375
	mov	WORD PTR [bp-90],17412	;reg
; Line 376
	mov	ax,WORD PTR $S182_multdriv
	inc	ax
	mov	WORD PTR [bp-88],ax
; Line 377
	mov	WORD PTR [bp-86],70
; Line 378
	lea	ax,WORD PTR [bp-72]	;iocbuf
	mov	WORD PTR [bp-84],ax
; Line 379
	call	_dsseg
	mov	WORD PTR [bp-78],ax
; Line 380
	lea	ax,WORD PTR [bp-90]	;reg
	push	ax
	push	ax
	call	_sysint21
	add	sp,4
; Line 381
	cmp	WORD PTR [bp-4],16387
	jne	$I311
; Line 382
	mov	ax,WORD PTR [bp-12]
	mov	WORD PTR _multaddr,ax
; Line 384
	mov	ax,WORD PTR [bp-16]
	sub	WORD PTR $S182_multdriv,ax
	mov	ax,WORD PTR $S182_multdriv
	mov	cx,3
	cwd	
	idiv	cx
	inc	dx
	mov	cl,6
	shl	dx,cl
	or	WORD PTR $S184_multhead,dx
; Line 385
	mov	ax,WORD PTR $S182_multdriv
	mov	cx,-3
	cwd	
	idiv	cx
	add	ax,3
	mov	WORD PTR $S182_multdriv,ax
; Line 386
; Line 414
$I311:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_sectparm	ENDP
; Line 419
	PUBLIC	_multread
_multread	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 421
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR $S191_commasect
	mov	dx,WORD PTR $S191_commasect+2
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	push	WORD PTR $S181_devfd
	call	_bseek
	add	sp,8
; Line 422
	push	WORD PTR $S181_devfd
	mov	ax,512
	push	ax
	push	WORD PTR $S179_prtbuf
	call	_bread
	add	sp,6
	cmp	ax,512
	je	$I314
; Line 423
	mov	ax,1
	push	ax
	call	_bioerr
	mov	cl,1
$L20015:
	mov	ch,ah
	push	cx
	call	errlog
	add	sp,4
; Line 424
	sub	ax,ax
	ret	
; Line 425
; Line 426
	nop	
$I314:
	mov	bx,WORD PTR $S179_prtbuf
	mov	al,BYTE PTR [bx]
	cbw	
	cmp	ax,254
	je	$I317
; Line 427
$L20016:
	mov	ax,-1
	ret	
; Line 429
$I317:
	mov	BYTE PTR [bx],255
; Line 430
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR $S191_commasect
	mov	dx,WORD PTR $S191_commasect+2
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	push	WORD PTR $S181_devfd
	call	_bseek
	add	sp,8
; Line 431
	push	WORD PTR $S181_devfd
	mov	ax,512
	push	ax
	push	WORD PTR $S179_prtbuf
	call	_bwrite
	add	sp,6
	cmp	ax,512
	je	$I319
; Line 432
	mov	ax,1
	push	ax
	call	_bioerr
	mov	cl,2
	jmp	SHORT $L20015
; Line 434
; Line 436
	nop	
$I319:
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR $S191_commasect
	mov	dx,WORD PTR $S191_commasect+2
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	push	WORD PTR $S181_devfd
	call	_bseek
	add	sp,8
; Line 437
	push	WORD PTR $S181_devfd
	mov	ax,512
	push	ax
	push	WORD PTR $S179_prtbuf
	call	_bread
	add	sp,6
	cmp	ax,512
	je	$I320
; Line 438
	mov	ax,1
	push	ax
	call	_bioerr
	mov	cl,3
	jmp	$L20015
; Line 440
; Line 441
	nop	
$I320:
	mov	bx,WORD PTR $S179_prtbuf
	mov	al,BYTE PTR [bx]
	cbw	
	cmp	ax,255
	je	$JCC1480
	jmp	$L20016
$JCC1480:
; Line 444
	mov	WORD PTR $S197_swlocked,1
; Line 446
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR $S190_multasect
	mov	dx,WORD PTR $S190_multasect+2
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	push	WORD PTR $S181_devfd
	call	_bseek
	add	sp,8
; Line 447
	push	WORD PTR $S181_devfd
	mov	ax,512
	push	ax
	push	WORD PTR _multbuff
	call	_bread
	add	sp,6
	cmp	ax,512
	je	$I322
; Line 448
	mov	ax,1
	push	ax
	call	_bioerr
	mov	cl,4
	jmp	$L20015
; Line 450
; Line 451
$I322:
	call	__fromintel
; Line 452
	mov	ax,1
; Line 453
	ret	
	nop	

_multread	ENDP
; Line 460
	PUBLIC	_multwrite
_multwrite	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	register si = dkerr
;	register di = buff
; Line 464
$FC328:
; Line 465
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR $S190_multasect
	mov	dx,WORD PTR $S190_multasect+2
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	push	WORD PTR $S181_devfd
	call	_bseek
	add	sp,8
; Line 466
	call	__tointel
	mov	di,ax
; Line 467
	push	WORD PTR $S181_devfd
	mov	ax,512
	push	ax
	push	di
	call	_bwrite
	add	sp,6
	cmp	ax,512
	jne	$I330
; Line 468
	mov	ax,1
	pop	si
	pop	di
	ret	
; Line 469
$I330:
; Line 470
	mov	ax,2
	push	ax
	call	_bioerr
	sub	al,al
	mov	si,ax
	push	si
	call	errlog
	add	sp,4
; Line 471
	cmp	si,768
	je	$FC328
; Line 472
	sub	ax,ax
	pop	si
	pop	di
	ret	
	nop	

_multwrite	ENDP
; Line 480
	PUBLIC	_multunlock
_multunlock	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 481
	cmp	WORD PTR $S197_swlocked,0
	jne	$I334
; Line 482
$L20017:
	mov	ax,1
	ret	
; Line 484
$I334:
	mov	bx,WORD PTR $S179_prtbuf
	mov	BYTE PTR [bx],254
; Line 485
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR $S191_commasect
	mov	dx,WORD PTR $S191_commasect+2
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	push	WORD PTR $S181_devfd
	call	_bseek
	add	sp,8
; Line 486
	push	WORD PTR $S181_devfd
	mov	ax,512
	push	ax
	push	WORD PTR $S179_prtbuf
	call	_bwrite
	add	sp,6
	cmp	ax,512
	je	$I335
; Line 487
	sub	ax,ax
	ret	
; Line 489
	nop	
$I335:
	mov	WORD PTR $S197_swlocked,0
	jmp	SHORT $L20017
; Line 492

_multunlock	ENDP
; Line 498
	PUBLIC	_multwait
_multwait	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
; Line 501
	push	WORD PTR _multstack
	mov	ax,OFFSET _multwait
	push	ax
	call	__dkproc
	add	sp,4
; Line 502
$FC342:
	call	__dkiosts
	or	ax,ax
	jne	$FC342
; Line 503
	cmp	WORD PTR $S195_errorflg,ax
	je	$I344
; Line 504
	push	WORD PTR $S194_errflg1
	push	WORD PTR $S193_errormsg
	call	_swend
	add	sp,4
; Line 505
$I344:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_multwait	ENDP
; Line 512
	PUBLIC	_multget
_multget	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	register si = o
;	ob = 4
; Line 516
	cmp	WORD PTR $S195_errorflg,0
	je	$I348
; Line 517
	push	WORD PTR $S194_errflg1
	push	WORD PTR $S193_errormsg
	call	_swend
	add	sp,4
; Line 519
$I348:
	call	__dkiosts
	or	ax,ax
	jne	$I348
; Line 520
	cmp	WORD PTR $S195_errorflg,ax
	je	$I352
; Line 521
	push	WORD PTR $S194_errflg1
	push	WORD PTR $S193_errormsg
	call	_swend
	add	sp,4
; Line 523
$I352:
	mov	bx,WORD PTR [bp+4]	;ob
	mov	si,WORD PTR [bx+56]
; Line 524
	mov	ax,WORD PTR _player
	cmp	si,ax
	je	$I353
; Line 525
	mov	di,si
	shl	di,1
	mov	bx,WORD PTR _multbuff
	push	WORD PTR [bx+14][di]
	push	WORD PTR [bp+4]	;ob
	call	updstate
	add	sp,4
; Line 526
$I353:
	mov	di,si
	shl	di,1
	mov	bx,WORD PTR _multbuff
	push	WORD PTR [bx+6][di]
	push	si
	call	_histmult
	add	sp,4
; Line 527
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_multget	ENDP
; Line 532
updstate	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = state
;	statep = 6
;	obp = 4
; Line 542
	mov	di,WORD PTR [bp+6]	;statep
	mov	si,WORD PTR [bp+4]	;obp
	cmp	WORD PTR [si],di
	je	$I361
	cmp	di,91
	je	$I362
	or	di,di
	je	$I362
	cmp	WORD PTR [si],91
	je	$I362
	cmp	WORD PTR [si],0
	jne	$I361
$I362:
; Line 543
	mov	WORD PTR [si],di
; Line 544
	call	_setvdisp
; Line 545
	push	si
	call	_dispwobj
	add	sp,2
; Line 546
; Line 547
$I361:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

updstate	ENDP
; Line 553
	PUBLIC	_multput
_multput	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
; Line 556
$FC369:
	call	__dkiosts
	or	ax,ax
	jne	$FC369
; Line 557
	cmp	WORD PTR $S195_errorflg,ax
	je	$I371
; Line 558
	push	WORD PTR $S194_errflg1
	push	WORD PTR $S193_errormsg
	call	_swend
	add	sp,4
; Line 559
$I371:
	push	WORD PTR _multstack
	mov	ax,OFFSET _multput
	push	ax
	call	__dkproc
	add	sp,4
; Line 560
	mov	sp,bp
	pop	bp
	ret	
	nop	

_multput	ENDP
; Line 567
	PUBLIC	_multclos
_multclos	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	di
	push	si
;	register si = rc
;	register di = n
;	closeret = -4
;	alldone = -6
;	tickwait = -2
;	update = 4
; Line 570
	mov	WORD PTR [bp-4],0	;closeret
; Line 574
	cmp	WORD PTR _repflag,0
	je	$I380
; Line 575
	call	errrep
; Line 576
	call	_delayrep
; Line 577
	call	_statrep
; Line 578
; Line 580
$I380:
	mov	WORD PTR $S196_multterm,1
; Line 581
$FC385:
	call	__dkiosts
	or	ax,ax
	jne	$FC385
; Line 583
	cmp	WORD PTR [bp+4],ax	;update
	jne	$JCC2092
	jmp	$I415
$JCC2092:
; Line 584
	sub	di,di
	jmp	SHORT $F388
; Line 587
	nop	
$I391:
	call	_intsoff
; Line 588
	mov	WORD PTR [bp-2],18	;tickwait
; Line 589
	mov	WORD PTR _counttick,0
; Line 590
	call	_intson
; Line 591
$FC395:
	mov	ax,WORD PTR [bp-2]	;tickwait
	cmp	WORD PTR _counttick,ax
	jl	$FC395
; Line 592
	inc	di
$F388:
	cmp	di,25
	jge	$FB390
; Line 585
	call	_multread
	mov	si,ax
	or	si,si
	jl	$I391
; Line 586
$FB390:
; Line 593
	or	si,si
	jne	$I397
; Line 594
	mov	WORD PTR [bp-4],OFFSET DGROUP:$SG398	;closeret
; Line 595
	jmp	$I415
	nop	
$I397:
; Line 596
	or	si,si
	jge	$I400
; Line 597
	mov	WORD PTR [bp-4],OFFSET DGROUP:$SG401	;closeret
; Line 598
	jmp	$I415
$I400:
; Line 599
	call	_editnum
	or	ax,ax
	je	$I404
; Line 600
	mov	WORD PTR [bp-4],OFFSET DGROUP:$SG405	;closeret
; Line 601
	jmp	SHORT $I415
	nop	
	nop	
$I404:
; Line 602
	mov	bx,WORD PTR _player
	shl	bx,1
	add	bx,WORD PTR _multbuff
	mov	WORD PTR [bx+14],91
; Line 603
	mov	bx,WORD PTR _player
	shl	bx,1
	add	bx,WORD PTR _multbuff
	mov	WORD PTR [bx+6],0
; Line 604
	mov	WORD PTR [bp-6],1	;alldone
; Line 605
	sub	di,di
	jmp	SHORT $F407
; Line 609
; Line 610
	nop	
$FC408:
	inc	di
$F407:
	mov	bx,WORD PTR _multbuff
	cmp	WORD PTR [bx],di
	jbe	$FB409
; Line 606
	mov	ax,di
	shl	ax,1
	add	bx,ax
	cmp	WORD PTR [bx+14],91
	je	$FC408
; Line 607
	mov	WORD PTR [bp-6],0	;alldone
; Line 608
$FB409:
	cmp	WORD PTR [bp-6],0	;alldone
	je	$I411
; Line 611
	mov	bx,WORD PTR _multbuff
	mov	WORD PTR [bx+2],0
; Line 612
	mov	bx,WORD PTR _multbuff
	mov	WORD PTR [bx+4],0
; Line 613
	sub	di,di
$FC413:
; Line 614
	mov	bx,di
	shl	bx,1
	add	bx,WORD PTR _multbuff
	mov	WORD PTR [bx+14],0
	inc	di
	cmp	di,4
	jl	$FC413
; Line 615
; Line 617
$I411:
	call	_multwrite
	or	ax,ax
	jne	$I415
; Line 619
	mov	WORD PTR [bp-4],OFFSET DGROUP:$SG416	;closeret
; Line 620
$I415:
; Line 621
; Line 623
	cmp	WORD PTR $S197_swlocked,0
	je	$I418
; Line 624
	call	_multunlock
	or	ax,ax
	jne	$I418
; Line 625
	mov	WORD PTR [bp-4],OFFSET DGROUP:$SG419	;closeret
; Line 627
$I418:
	mov	ax,WORD PTR [bp-4]	;closeret
; Line 628
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_multclos	ENDP
; Line 635
_multwait	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	di
	push	si
;	register si = mu
;	register di = i
;	count = -4
;	dkerr = -2
; Line 640
	mov	si,WORD PTR _multbuff
; Line 641
$FC426:
; Line 642
	mov	ax,18
	push	ax
	call	__dktick
	add	sp,2
; Line 643
	mov	WORD PTR [bp-4],0	;count
	jmp	SHORT $F429
; Line 647
; Line 648
$I433:
; Line 650
	call	_dsseg
	push	ax
	push	si
	mov	ax,1
	push	ax
	push	WORD PTR $S188_multsect
	push	WORD PTR $S186_multtrk
	push	WORD PTR $S184_multhead
	push	WORD PTR $S182_multdriv
	mov	ax,2
	push	ax
	call	__dkio
	add	sp,16
	sub	al,al
	mov	WORD PTR [bp-2],ax	;dkerr
	or	ax,ax
	jne	$I436
; Line 651
$FB431:
; Line 655
	call	__fromintel
; Line 656
	cmp	WORD PTR [bp-4],25	;count
	jne	$I437
; Line 657
	mov	ax,1
	push	ax
	mov	ax,OFFSET DGROUP:$SG438
	jmp	SHORT $L20019
; Line 652
$I436:
	mov	ax,3
	push	ax
	push	WORD PTR [bp-2]	;dkerr
	call	errlog
	add	sp,4
; Line 653
	sub	ax,ax
	push	ax
	call	__dkio
	add	sp,2
; Line 654
	inc	WORD PTR [bp-4]	;count
$F429:
	cmp	WORD PTR [bp-4],25	;count
	jge	$FB431
; Line 644
	call	_ctlbreak
	or	ax,ax
	je	$I433
; Line 645
	mov	ax,1
	push	ax
	sub	ax,ax
$L20019:
	push	ax
	call	error
	add	sp,4
; Line 646
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 659
; Line 660
	nop	
$I437:
	call	_editnum
	or	ax,ax
	je	$I439
; Line 661
	mov	ax,1
	push	ax
	mov	ax,OFFSET DGROUP:$SG440
	jmp	SHORT $L20019
; Line 663
; Line 664
$I439:
	sub	di,di
	jmp	SHORT $F441
; Line 668
$FC442:
	inc	di
$F441:
	cmp	WORD PTR [si],di
	jbe	$FB443
; Line 666
	mov	bx,di
	shl	bx,1
	cmp	WORD PTR [bx+14][si],1
	je	$FC442
	cmp	WORD PTR [bx+14][si],91
	je	$FC442
; Line 667
$FB443:
	cmp	WORD PTR [si],di
	je	$JCC2531
	jmp	$FC426
$JCC2531:
; Line 669
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_multwait	ENDP
; Line 681
_multput	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	di
	push	si
;	register si = mu
;	register di = ob
;	count = -8
;	dkerr = -6
;	tickwait = -2
;	buff = -4
; Line 689
	mov	ax,118
	imul	WORD PTR _player
	mov	di,ax
	add	di,WORD PTR _nobjects
; Line 690
	mov	si,WORD PTR _multbuff
; Line 692
	call	_delaymov
; Line 693
	push	WORD PTR _player
	sub	ax,ax
	push	ax
	call	updated
	add	sp,4
; Line 695
	cmp	WORD PTR $S196_multterm,0
	je	$JCC2591
	jmp	$EX447
$JCC2591:
; Line 697
	call	_ctlbreak
	or	ax,ax
	je	$I458
; Line 698
$L20021:
	mov	ax,1
	push	ax
	sub	ax,ax
$L20020:
	push	ax
	call	error
	add	sp,4
; Line 699
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 700
; Line 702
$I458:
	cmp	WORD PTR $S453_first,0
	je	$I459
; Line 703
	mov	WORD PTR $S453_first,0
; Line 704
	jmp	SHORT $I460
	nop	
$I459:
; Line 705
	call	_swgetc
	mov	bx,WORD PTR _player
	shl	bx,1
	mov	WORD PTR [bx+6][si],ax
$I460:
; Line 707
	mov	ax,WORD PTR [di]
	mov	bx,WORD PTR _player
	shl	bx,1
	mov	WORD PTR [bx+14][si],ax
; Line 708
	mov	ax,WORD PTR _player
	mov	WORD PTR [si+4],ax
; Line 709
	call	_swflush
; Line 711
	call	_intsoff
; Line 712
	mov	WORD PTR [bp-2],180	;tickwait
; Line 713
	mov	WORD PTR _counttick,0
; Line 714
	call	_intson
; Line 715
	mov	WORD PTR [bp-8],0	;count
; Line 716
	call	__tointel
	mov	WORD PTR [bp-4],ax	;buff
; Line 717
$FC464:
	cmp	WORD PTR [bp-8],25	;count
	jge	$FB465
; Line 719
	call	_dsseg
	push	ax
	push	WORD PTR [bp-4]	;buff
	mov	ax,1
	push	ax
	push	WORD PTR $S188_multsect
	push	WORD PTR $S186_multtrk
	push	WORD PTR $S184_multhead
	push	WORD PTR $S182_multdriv
	mov	ax,3
	push	ax
	call	__dkio
	add	sp,16
	sub	al,al
	mov	WORD PTR [bp-6],ax	;dkerr
	or	ax,ax
	jne	$I466
; Line 720
$FB465:
; Line 733
	cmp	WORD PTR [bp-8],25	;count
	jne	$I470
; Line 734
	mov	ax,1
	push	ax
	mov	ax,OFFSET DGROUP:$SG471
	jmp	$L20020
; Line 721
$I466:
	sub	ax,ax
	push	ax
	call	__dkio
	add	sp,2
; Line 723
	mov	ax,WORD PTR _counttick
	cmp	WORD PTR [bp-2],ax	;tickwait
	jge	$I467
	call	_ctlbreak
	or	ax,ax
	je	$JCC2788
	jmp	$L20021
$JCC2788:
; Line 726
; Line 728
$I467:
	call	delay
; Line 729
	mov	ax,4
	push	ax
	push	WORD PTR [bp-6]	;dkerr
	call	errlog
	add	sp,4
; Line 730
	cmp	WORD PTR [bp-6],768	;dkerr
	je	$FC464
; Line 731
	inc	WORD PTR [bp-8]	;count
; Line 732
	jmp	SHORT $FC464
; Line 736
; Line 738
	nop	
$I470:
	call	delay
; Line 740
	call	_editnum
	or	ax,ax
	je	$I472
; Line 741
	mov	ax,1
	push	ax
	mov	ax,OFFSET DGROUP:$SG473
	push	ax
	call	error
	add	sp,4
; Line 743
$I472:
	push	WORD PTR [si]
	mov	ax,WORD PTR _player
	inc	ax
	push	ax
	call	updated
	add	sp,4
; Line 744
	call	_changedelay
; Line 745
$EX447:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_multput	ENDP
; Line 750
updated	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__aNchkstk
	push	si
;	n = -14
;	count = -12
;	register si = mu
;	ob = -16
;	done = -8
;	dkerr = -10
;	last = -6
;	tickwait = -2
;	readdone = -4
;	n2 = 6
;	n1 = 4
; Line 760
	mov	si,WORD PTR _multbuff
; Line 761
	call	_intsoff
; Line 762
	mov	WORD PTR [bp-2],180	;tickwait
; Line 763
	sub	ax,ax
	mov	WORD PTR [bp-4],ax	;readdone
	mov	WORD PTR _counttick,ax
; Line 764
	call	_intson
; Line 765
$FC488:
; Line 766
	mov	ax,WORD PTR [si+4]
	mov	WORD PTR [bp-6],ax	;last
; Line 767
	mov	WORD PTR [bp-8],1	;done
; Line 768
	mov	ax,WORD PTR [bp+4]	;n1
	mov	WORD PTR [bp-14],ax	;n
	jmp	SHORT $F490
; Line 771
$FC491:
	inc	WORD PTR [bp-14]	;n
$F490:
	mov	ax,WORD PTR [bp+6]	;n2
	cmp	WORD PTR [bp-14],ax	;n
	jge	$FB492
; Line 769
	mov	bx,WORD PTR [bp-14]	;n
	shl	bx,1
	cmp	WORD PTR [bx+14][si],91
	je	$FC491
; Line 770
$FB492:
	cmp	WORD PTR [bp-14],ax	;n
	jge	$FB500
; Line 772
	mov	ax,WORD PTR _player
	cmp	WORD PTR [bp-6],ax	;last
	jne	$I495
; Line 773
	mov	WORD PTR [bp-8],0	;done
; Line 774
$FB500:
	cmp	WORD PTR [bp-8],0	;done
	je	$JCC2964
	jmp	$EX477
$JCC2964:
; Line 782
	cmp	WORD PTR [bp-4],0	;readdone
	je	$I503
; Line 783
	call	delay
; Line 785
$I503:
	mov	WORD PTR [bp-12],0	;count
	jmp	SHORT $F504
	nop	
$I495:
; Line 775
	mov	ax,WORD PTR [bp-14]	;n
	cmp	WORD PTR [bp-6],ax	;last
	jl	$FB500
; Line 776
	jmp	SHORT $F498
$L20003:
	sub	ax,ax
$L20004:
	mov	WORD PTR [bp-8],ax	;done
; Line 779
$FC499:
	inc	WORD PTR [bp-14]	;n
$F498:
	mov	ax,WORD PTR [bp+6]	;n2
	cmp	WORD PTR [bp-14],ax	;n
	jge	$FB500
; Line 777
	mov	bx,WORD PTR [bp-14]	;n
	shl	bx,1
	cmp	WORD PTR [bx+14][si],91
	je	$FC499
; Line 778
	mov	ax,WORD PTR [bp-14]	;n
	cmp	WORD PTR [bp-6],ax	;last
	jne	$L20003
	mov	ax,1
	jmp	SHORT $L20004
; Line 790
$I507:
	mov	ax,3
	push	ax
	push	WORD PTR [bp-10]	;dkerr
	call	errlog
	add	sp,4
; Line 791
	sub	ax,ax
	push	ax
	call	__dkio
	add	sp,2
; Line 793
	mov	ax,WORD PTR _counttick
	cmp	WORD PTR [bp-2],ax	;tickwait
	jge	$FC505
	call	_ctlbreak
	or	ax,ax
	je	$FC505
; Line 794
	mov	ax,1
	push	ax
	sub	ax,ax
$L20022:
	push	ax
	call	error
	add	sp,4
; Line 795
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 796
; Line 797
	nop	
$FC505:
	inc	WORD PTR [bp-12]	;count
$F504:
	cmp	WORD PTR [bp-12],25	;count
	jge	$FB506
; Line 788
	call	_dsseg
	push	ax
	push	si
	mov	ax,1
	push	ax
	push	WORD PTR $S188_multsect
	push	WORD PTR $S186_multtrk
	push	WORD PTR $S184_multhead
	push	WORD PTR $S182_multdriv
	mov	ax,2
	push	ax
	call	__dkio
	add	sp,16
	sub	al,al
	mov	WORD PTR [bp-10],ax	;dkerr
	or	ax,ax
	jne	$I507
; Line 789
$FB506:
; Line 798
	call	__fromintel
; Line 799
	cmp	WORD PTR [bp-12],25	;count
	jne	$I509
; Line 800
	mov	ax,1
	push	ax
	mov	ax,OFFSET DGROUP:$SG510
	jmp	SHORT $L20022
; Line 802
; Line 803
	nop	
$I509:
	call	_editnum
	or	ax,ax
	je	$I511
; Line 804
	mov	ax,1
	push	ax
	mov	ax,OFFSET DGROUP:$SG512
	push	ax
	call	error
	add	sp,4
; Line 806
$I511:
	mov	WORD PTR [bp-4],1	;readdone
; Line 807
	inc	WORD PTR $S446_curtry
; Line 808
	jmp	$FC488
; Line 809
	nop	
$EX477:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

updated	ENDP
; Line 815
error	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	flag1 = 6
;	msg = 4
; Line 819
	mov	WORD PTR $S195_errorflg,1
; Line 820
	mov	ax,WORD PTR [bp+6]	;flag1
	mov	WORD PTR $S194_errflg1,ax
; Line 821
	mov	ax,WORD PTR [bp+4]	;msg
	mov	WORD PTR $S193_errormsg,ax
; Line 822
	mov	sp,bp
	pop	bp
	ret	

error	ENDP
; Line 828
errlog	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	register si = i
;	where = 6
;	err = 4
; Line 832
	inc	WORD PTR $S200_errptr
	mov	ax,WORD PTR $S200_errptr
	mov	cx,50
	cwd	
	idiv	cx
	mov	ax,WORD PTR [bp+4]	;err
	mov	bx,dx
	shl	bx,1
	mov	WORD PTR $S198_errtab[bx],ax
; Line 833
	mov	ax,WORD PTR [bp+6]	;where
	mov	WORD PTR $S199_errwhr[bx],ax
; Line 834
	mov	sp,bp
	pop	bp
	ret	
	nop	

errlog	ENDP
; Line 840
errrep	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	si
;	register si = i
; Line 843
	mov	ax,OFFSET DGROUP:$SG523
	push	ax
	call	_puts
	add	sp,2
; Line 844
	mov	ax,5
	push	ax
	mov	ax,WORD PTR $S200_errptr
	inc	ax
	push	ax
	call	_dispd
	add	sp,4
; Line 845
	mov	ax,OFFSET DGROUP:$SG525
	push	ax
	call	_puts
	add	sp,2
; Line 846
	cmp	WORD PTR $S200_errptr,50
	jl	$I526
; Line 847
	mov	ax,OFFSET DGROUP:$SG527
	push	ax
	call	_puts
	add	sp,2
; Line 848
	mov	ax,WORD PTR $S200_errptr
	mov	cx,50
	cwd	
	idiv	cx
	mov	si,dx
	jmp	SHORT $L20024
	nop	
$FC529:
; Line 849
	push	si
	call	errrepl
	add	sp,2
$L20024:
	inc	si
	cmp	si,50
	jl	$FC529
; Line 850
	sub	si,si
	jmp	SHORT $F532
	nop	
$FC533:
	inc	si
$F532:
	mov	ax,WORD PTR $S200_errptr
	mov	cx,50
	cwd	
	idiv	cx
	cmp	dx,si
	jl	$I535
; Line 851
	push	si
	call	errrepl
	add	sp,2
	jmp	SHORT $FC533
	nop	
$I526:
; Line 853
	sub	si,si
	jmp	SHORT $F536
$FC537:
; Line 854
	push	si
	call	errrepl
	add	sp,2
	inc	si
$F536:
	cmp	WORD PTR $S200_errptr,si
	jge	$FC537
$I535:
; Line 855
	pop	si
	ret	

errrep	ENDP
; Line 860
errrepl	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	i = 4
; Line 863
	mov	bx,WORD PTR [bp+4]	;i
	shl	bx,1
	mov	ax,WORD PTR $S199_errwhr[bx]
	dec	ax
	je	$SC545
	dec	ax
	je	$SC547
	dec	ax
	je	$SC549
	dec	ax
	je	$SC551
	jmp	SHORT $SB542
; Line 864
	nop	
$SC545:
	mov	ax,OFFSET DGROUP:$SG546
$L20025:
	push	ax
	call	_puts
	mov	sp,bp
; Line 865
$SB542:
; Line 873
	mov	bx,WORD PTR [bp+4]	;i
	shl	bx,1
	mov	ax,WORD PTR $S198_errtab[bx]
	cmp	ax,2048
	je	$SC567
	ja	$L20005
	sub	ax,256
	je	$SC575
	sub	ax,256
	je	$SC573
	sub	ax,256
	je	$SC571
	sub	ax,256
	je	$SC569
$SD577:
	mov	ax,6
	push	ax
	mov	bx,WORD PTR [bp+4]	;i
	shl	bx,1
	push	WORD PTR $S198_errtab[bx]
	call	_dispd
	jmp	SHORT $L20027
; Line 866
	nop	
$SC547:
	mov	ax,OFFSET DGROUP:$SG548
	jmp	SHORT $L20025
; Line 868
	nop	
$SC549:
	mov	ax,OFFSET DGROUP:$SG550
	jmp	SHORT $L20025
; Line 870
	nop	
$SC551:
	mov	ax,OFFSET DGROUP:$SG552
	jmp	SHORT $L20025
; Line 875
	nop	
$SC557:
	mov	ax,OFFSET DGROUP:$SG558
$L20026:
	push	ax
	call	_puts
$L20027:
	mov	sp,bp
; Line 876
	jmp	SHORT $SB554
; Line 877
	nop	
$SC559:
	mov	ax,OFFSET DGROUP:$SG560
	jmp	SHORT $L20026
; Line 879
	nop	
$SC561:
	mov	ax,OFFSET DGROUP:$SG562
	jmp	SHORT $L20026
; Line 881
	nop	
$SC563:
	mov	ax,OFFSET DGROUP:$SG564
	jmp	SHORT $L20026
; Line 883
	nop	
$SC565:
	mov	ax,OFFSET DGROUP:$SG566
	jmp	SHORT $L20026
; Line 885
	nop	
$SC567:
	mov	ax,OFFSET DGROUP:$SG568
	jmp	SHORT $L20026
; Line 887
	nop	
$SC569:
	mov	ax,OFFSET DGROUP:$SG570
	jmp	SHORT $L20026
; Line 889
	nop	
$SC571:
	mov	ax,OFFSET DGROUP:$SG572
	jmp	SHORT $L20026
; Line 891
	nop	
$SC573:
	mov	ax,OFFSET DGROUP:$SG574
	jmp	SHORT $L20026
; Line 893
	nop	
$SC575:
	mov	ax,OFFSET DGROUP:$SG576
	jmp	SHORT $L20026
; Line 896
	nop	
$L20005:
	sub	ax,2304
	je	$SC565
	sub	ax,1792
	je	$SC563
	sub	ax,4096
	je	$SC561
	sub	ax,8192
	je	$SC559
	sub	ax,16384
	je	$SC557
	jmp	$SD577
$SB554:
; Line 899
	mov	ax,OFFSET DGROUP:$SG578
	push	ax
	call	_puts
; Line 900
	mov	sp,bp
	pop	bp
	ret	
	nop	

errrepl	ENDP
; Line 915
delay	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	si
;	register si = t
; Line 918
	cmp	WORD PTR _multtick,-1
	je	$EX587
; Line 921
	cmp	WORD PTR _multtick,0
	je	$I590
; Line 922
	mov	si,WORD PTR _multtick
; Line 923
	jmp	SHORT $I591
$I590:
; Line 924
	mov	si,WORD PTR $S579_nextdelay
$I591:
; Line 926
	add	WORD PTR $S584_numdel,si
; Line 927
	push	si
	call	__dktick
	add	sp,2
; Line 928
$EX587:
	pop	si
	ret	
	nop	

delay	ENDP
; Line 934
	PUBLIC	_delaymov
_delaymov	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 935
	inc	WORD PTR $S583_nummov
; Line 936
	mov	WORD PTR $S446_curtry,0
; Line 937
	ret	

_delaymov	ENDP
; Line 942
	PUBLIC	_changedelay
_changedelay	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 945
	mov	ax,WORD PTR $S446_curtry
	add	WORD PTR $S582_numtry,ax
; Line 946
	cmp	ax,WORD PTR $S580_maxtry
	jbe	$I596
; Line 947
	mov	WORD PTR $S580_maxtry,ax
; Line 948
$I596:
	or	ax,ax
	je	$I597
	mov	ax,WORD PTR $S581_mintry
	cmp	WORD PTR $S446_curtry,ax
	jae	$I597
; Line 949
	mov	ax,WORD PTR $S446_curtry
	mov	WORD PTR $S581_mintry,ax
; Line 951
$I597:
	cmp	WORD PTR $S446_curtry,1
	ja	$I598
; Line 952
	inc	WORD PTR $S595_dncnt
	cmp	WORD PTR $S595_dncnt,3
	jne	$I599
; Line 953
	cmp	WORD PTR $S579_nextdelay,0
	je	$I600
; Line 954
	dec	WORD PTR $S579_nextdelay
; Line 955
	inc	WORD PTR $S586_numadjdn
; Line 956
; Line 957
$I600:
	mov	WORD PTR $S595_dncnt,0
; Line 958
; Line 959
$I599:
	mov	WORD PTR $S594_upcnt,0
; Line 960
	ret	
$I598:
; Line 961
	inc	WORD PTR $S594_upcnt
	cmp	WORD PTR $S594_upcnt,3
	jne	$I602
; Line 962
	cmp	WORD PTR $S579_nextdelay,5
	jae	$I603
; Line 963
	inc	WORD PTR $S579_nextdelay
; Line 964
	inc	WORD PTR $S585_numadjup
; Line 965
; Line 966
$I603:
	mov	WORD PTR $S594_upcnt,0
; Line 967
; Line 968
$I602:
	mov	WORD PTR $S595_dncnt,0
; Line 969
; Line 970
	ret	
	nop	

_changedelay	ENDP
; Line 976
	PUBLIC	_delayrep
_delayrep	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 977
	mov	ax,OFFSET DGROUP:$SG605
	push	ax
	call	_puts
	add	sp,2
	mov	ax,6
	push	ax
	push	WORD PTR $S583_nummov
	call	_dispd
	add	sp,4
; Line 978
	mov	ax,OFFSET DGROUP:$SG606
	push	ax
	call	_puts
	add	sp,2
	mov	ax,6
	push	ax
	push	WORD PTR $S582_numtry
	call	_dispd
	add	sp,4
; Line 979
	mov	ax,OFFSET DGROUP:$SG607
	push	ax
	call	_puts
	add	sp,2
	cmp	WORD PTR $S581_mintry,10000
	jne	$I608
; Line 980
	mov	ax,6
	push	ax
	sub	ax,ax
	push	ax
	jmp	SHORT $L20028
$I608:
; Line 982
	mov	ax,6
	push	ax
	push	WORD PTR $S581_mintry
$L20028:
	call	_dispd
	add	sp,4
; Line 983
	mov	ax,OFFSET DGROUP:$SG610
	push	ax
	call	_puts
	add	sp,2
	mov	ax,6
	push	ax
	push	WORD PTR $S580_maxtry
	call	_dispd
	add	sp,4
; Line 984
	mov	ax,OFFSET DGROUP:$SG611
	push	ax
	call	_puts
	add	sp,2
	mov	ax,6
	push	ax
	push	WORD PTR $S584_numdel
	call	_dispd
	add	sp,4
; Line 985
	mov	ax,OFFSET DGROUP:$SG612
	push	ax
	call	_puts
	add	sp,2
	mov	ax,6
	push	ax
	push	WORD PTR $S585_numadjup
	call	_dispd
	add	sp,4
; Line 986
	mov	ax,OFFSET DGROUP:$SG613
	push	ax
	call	_puts
	add	sp,2
	mov	ax,6
	push	ax
	push	WORD PTR $S586_numadjdn
	call	_dispd
	add	sp,4
; Line 987
	ret	
	nop	

_delayrep	ENDP
; Line 993
	PUBLIC	_statrep
_statrep	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = i
; Line 997
	mov	ax,OFFSET DGROUP:$SG617
	push	ax
	call	_puts
	add	sp,2
; Line 998
	call	_editnum
	or	ax,ax
	je	$I618
; Line 999
	mov	ax,OFFSET DGROUP:$SG619
	push	ax
	call	_puts
	add	sp,2
; Line 1000
	pop	si
	pop	di
	ret	
; Line 1001
; Line 1003
	nop	
$I618:
	sub	di,di
	jmp	SHORT $F620
$FC621:
; Line 1004
	mov	ax,di
	mov	cx,118
	imul	cx
	mov	si,ax
	add	si,WORD PTR _nobjects
; Line 1005
	mov	ax,OFFSET DGROUP:$SG623
	push	ax
	call	_puts
	add	sp,2
; Line 1006
	mov	ax,2
	push	ax
	push	di
	call	_dispd
	add	sp,4
; Line 1007
	mov	ax,3
	push	ax
	push	WORD PTR [si]
	call	_dispd
	add	sp,4
; Line 1008
	mov	ax,3
	push	ax
	mov	bx,di
	shl	bx,1
	add	bx,WORD PTR _multbuff
	push	WORD PTR [bx+14]
	call	_dispd
	add	sp,4
; Line 1009
	mov	bx,WORD PTR _multbuff
	cmp	WORD PTR [bx+4],di
	jne	$L20029
; Line 1010
	mov	ax,OFFSET DGROUP:$SG625
	push	ax
	call	_puts
	add	sp,2
; Line 1011
$L20029:
	inc	di
$F620:
	mov	bx,WORD PTR _multbuff
	cmp	WORD PTR [bx],di
	ja	$FC621
; Line 1012
	pop	si
	pop	di
	ret	

_statrep	ENDP
; Line 1019
	PUBLIC	_editnum
_editnum	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	max = -2
;	num = -4
;	lst = -6
; Line 1027
	mov	bx,WORD PTR _multbuff
	mov	al,BYTE PTR [bx]
	or	al,al
	jl	$L20008
	cmp	al,4
	jg	$L20008
	mov	cl,BYTE PTR [bx+2]
	or	cl,cl
	jl	$L20008
	cmp	cl,al
	jg	$L20008
	mov	cl,BYTE PTR [bx+4]
	or	cl,cl
	jl	$L20008
	cmp	cl,al
	jl	$L20006
$L20008:
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
$L20006:
	sub	ax,ax
; Line 1028
	mov	sp,bp
	pop	bp
	ret	

_editnum	ENDP
; Line 1034
	PUBLIC	_init1mul
_init1mul	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	di
	push	si
;	register si = mu
;	register di = n
;	tickwait = -2
;	rc = -4
;	device = 6
;	reset = 4
; Line 1042
	mov	bx,WORD PTR [bp+6]	;device
	cmp	BYTE PTR [bx],0
	je	$I638
; Line 1043
	mov	al,BYTE PTR [bx]
	mov	bx,WORD PTR _multfile
	mov	BYTE PTR [bx],al
	mov	bx,WORD PTR _multfile
	mov	al,BYTE PTR [bx]
	mov	bx,WORD PTR _cmndfile
	mov	BYTE PTR [bx],al
; Line 1045
$I638:
	call	_getgame
	add	al,48
	mov	bx,WORD PTR _multfile
	mov	BYTE PTR [bx+9],al
; Line 1047
	push	WORD PTR _multfile
	push	WORD PTR _cmndfile
	call	_multopen
	add	sp,4
; Line 1048
	push	WORD PTR _multaddr
	call	__dkioset
	add	sp,2
; Line 1050
	mov	WORD PTR _multstack,OFFSET DGROUP:_multstck+398
; Line 1052
	sub	di,di
	jmp	SHORT $F641
; Line 1055
	nop	
$I644:
	call	_intsoff
; Line 1056
	mov	WORD PTR [bp-2],18	;tickwait
; Line 1057
	mov	WORD PTR _counttick,0
; Line 1058
	call	_intson
; Line 1059
$FC646:
	mov	ax,WORD PTR [bp-2]	;tickwait
	cmp	WORD PTR _counttick,ax
	jl	$FC646
; Line 1060
	inc	di
$F641:
	cmp	di,25
	jge	$FB643
; Line 1053
	call	_multread
	mov	WORD PTR [bp-4],ax	;rc
	or	ax,ax
	jl	$I644
; Line 1054
$FB643:
; Line 1061
	cmp	WORD PTR [bp-4],0	;rc
	jne	$I648
; Line 1062
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG649
	push	ax
	call	_swend
	add	sp,4
; Line 1063
$I648:
	cmp	WORD PTR [bp-4],0	;rc
	jge	$I650
; Line 1064
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG651
	push	ax
	call	_swend
	add	sp,4
; Line 1066
$I650:
	cmp	WORD PTR [bp+4],0	;reset
	je	$I652
; Line 1067
	call	mulreset
; Line 1069
$I652:
; Line 1070
	mov	si,WORD PTR _multbuff
	cmp	WORD PTR [si+2],1
	sbb	ax,ax
	neg	ax
	mov	WORD PTR $S192_first,ax
	or	ax,ax
	je	$I654
; Line 1071
	call	getmaxplyr
	mov	WORD PTR [si],ax
; Line 1072
	mov	WORD PTR [si+2],0
; Line 1073
	mov	ax,WORD PTR _explseed
	mov	WORD PTR [si+22],ax
; Line 1074
	jmp	SHORT $I656
$I654:
; Line 1075
	mov	ax,WORD PTR [si+22]
	mov	WORD PTR _explseed,ax
$I656:
; Line 1077
	call	_clrprmpt
; Line 1078
	mov	WORD PTR _currgame,OFFSET _swgames
; Line 1079
	mov	ax,WORD PTR [si]
	cmp	WORD PTR [si+2],ax
	jb	$I658
; Line 1080
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG659
	push	ax
	call	_swend
	add	sp,4
; Line 1081
$I658:
	inc	WORD PTR [si+2]
; Line 1082
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_init1mul	ENDP
; Line 1087
	PUBLIC	_init2mul
_init2mul	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	n = -4
;	register di = mu
;	playinit = -2
; Line 1093
	mov	di,WORD PTR _multbuff
; Line 1094
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;playinit
	mov	WORD PTR [bp-4],ax	;n
	jmp	SHORT $F666
	nop	
$I669:
; Line 1104
	sub	ax,ax
	push	ax
	call	_initpln
	add	sp,2
	mov	si,ax
	mov	WORD PTR [si+68],OFFSET _dispmult
; Line 1105
	mov	WORD PTR [si+70],OFFSET _movemult
; Line 1106
	mov	ax,WORD PTR [si+56]
	mov	cx,2
	cwd	
	idiv	cx
	inc	dx
	mov	WORD PTR [si+42],dx
; Line 1107
	mov	WORD PTR [si+32],si
; Line 1108
	mov	bx,WORD PTR [bp-4]	;n
	shl	bx,1
	mov	ax,WORD PTR [bx+14][di]
	mov	WORD PTR [si],ax
; Line 1109
	mov	ax,118
	push	ax
	imul	WORD PTR [si+56]
	add	ax,OFFSET _oobjects
	push	ax
	push	si
	call	_movmem
	add	sp,6
; Line 1110
; Line 1111
$FC667:
	inc	WORD PTR [bp-4]	;n
$F666:
	mov	ax,WORD PTR [di]
	cmp	WORD PTR [bp-4],ax	;n
	jae	$FB668
; Line 1095
	cmp	WORD PTR [bp-2],0	;playinit
	jne	$I669
	mov	bx,WORD PTR [bp-4]	;n
	shl	bx,1
	add	bx,di
	cmp	WORD PTR [bx+14],0
	jne	$I669
; Line 1096
	mov	ax,WORD PTR [bp-4]	;n
	mov	WORD PTR _player,ax
; Line 1097
	sub	ax,ax
	push	ax
	mov	WORD PTR [bp-6],bx
	call	_initplyr
	add	sp,2
; Line 1098
	mov	bx,WORD PTR [bp-6]
	mov	WORD PTR [bx+6],0
; Line 1099
	mov	WORD PTR [bx+14],1
; Line 1100
	mov	ax,WORD PTR [bp-4]	;n
	mov	WORD PTR [di+4],ax
; Line 1101
	mov	WORD PTR [bp-2],1	;playinit
; Line 1102
	jmp	SHORT $FC667
$FB668:
; Line 1112
	test	BYTE PTR [di],1
	je	$I672
; Line 1113
	sub	ax,ax
	push	ax
	call	_initcomp
	add	sp,2
; Line 1115
$I672:
	call	_multwrite
	or	ax,ax
	jne	$I674
; Line 1116
	push	ax
	mov	ax,OFFSET DGROUP:$SG675
	push	ax
	call	_swend
	add	sp,4
; Line 1117
$I674:
	call	_multunlock
	or	ax,ax
	jne	$I676
; Line 1118
	mov	ax,1
	push	ax
	mov	ax,OFFSET DGROUP:$SG677
	push	ax
	call	_swend
	add	sp,4
; Line 1120
$I676:
	call	_clrprmpt
; Line 1121
	mov	ax,OFFSET DGROUP:$SG678
	push	ax
	call	_puts
	add	sp,2
; Line 1122
	call	_multwait
; Line 1123
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_init2mul	ENDP
; Line 1129
getmaxplyr	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	si
;	register si = max
; Line 1132
	call	_clrprmpt
; Line 1133
	mov	ax,OFFSET DGROUP:$SG681
	push	ax
	call	_puts
	add	sp,2
; Line 1134
$FC683:
; Line 1135
	call	_ctlbreak
	or	ax,ax
	je	$I685
; Line 1136
	sub	ax,ax
	push	ax
	push	ax
	call	_swend
	add	sp,4
; Line 1137
$I685:
; Line 1138
	call	_swgetc
	mov	si,ax
	and	si,255
	sub	si,48
	cmp	si,1
	jl	$FC683
	cmp	si,4
	jg	$FC683
; Line 1139
	mov	ax,si
	pop	si
	mov	sp,bp
	pop	bp
	ret	

getmaxplyr	ENDP
; Line 1146
mulreset	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	register si = i
; Line 1149
	mov	bx,WORD PTR _multbuff
	mov	WORD PTR [bx],0
; Line 1150
	mov	bx,WORD PTR _multbuff
	mov	WORD PTR [bx+2],0
; Line 1151
	mov	bx,WORD PTR _multbuff
	mov	WORD PTR [bx+4],0
; Line 1152
	mov	bx,WORD PTR _multbuff
	mov	WORD PTR [bx+22],0
; Line 1154
	sub	si,si
$FC690:
; Line 1155
	mov	di,si
	shl	di,1
	mov	bx,WORD PTR _multbuff
	mov	WORD PTR [bx+6][di],0
; Line 1156
	mov	bx,WORD PTR _multbuff
	mov	WORD PTR [bx+14][di],0
; Line 1157
	inc	si
	cmp	si,4
	jl	$FC690
; Line 1158
	pop	si
	pop	di
	ret	
	nop	

mulreset	ENDP
_TEXT	ENDS
END
