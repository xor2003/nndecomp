;	Static Name Aliases
;
;	$S235_savescore	EQU	savescore
;	$S236_ghost	EQU	ghost
;	$S237_helptxt	EQU	helptxt
;	$S530_inits	EQU	inits
;	$S531_initc	EQU	initc
;	$S532_initm	EQU	initm
;	$S704_ifdx	EQU	ifdx
;	$S702_ifx	EQU	ifx
;	$S703_ify	EQU	ify
;	$S723_ibx	EQU	ibx
;	$S724_iby	EQU	iby
;	$S725_ibdx	EQU	ibdx
;	$S726_ibdy	EQU	ibdy
;	$S731_iox	EQU	iox
;	$S732_ioy	EQU	ioy
	TITLE   C:\SWINIT.C
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
EXTRN	_puts:NEAR
EXTRN	_dispcomp:NEAR
EXTRN	_longjmp:NEAR
EXTRN	_movecomp:NEAR
EXTRN	_dispplyr:NEAR
EXTRN	_moveplyr:NEAR
EXTRN	_moveshot:NEAR
EXTRN	_dispbomb:NEAR
EXTRN	_deallobj:NEAR
EXTRN	_movebomb:NEAR
EXTRN	_movetarg:NEAR
EXTRN	_disptarg:NEAR
EXTRN	_moveexpl:NEAR
EXTRN	_deletex:NEAR
EXTRN	_dispexpl:NEAR
EXTRN	_swpntsym:NEAR
EXTRN	_movesmok:NEAR
EXTRN	_movebird:NEAR
EXTRN	_getflags:NEAR
EXTRN	_dispbird:NEAR
EXTRN	_moveflck:NEAR
EXTRN	_swflush:NEAR
EXTRN	_dispflck:NEAR
EXTRN	_abs:NEAR
EXTRN	_moveox:NEAR
EXTRN	_setvdisp:NEAR
EXTRN	_movemiss:NEAR
EXTRN	_exit:NEAR
EXTRN	_dispmiss:NEAR
EXTRN	_dispscore:NEAR
EXTRN	_moveburst:NEAR
EXTRN	_dispburst:NEAR
EXTRN	_histinit:NEAR
EXTRN	_allocobj:NEAR
EXTRN	_initsndt:NEAR
EXTRN	_swbreak:NEAR
EXTRN	_intsoff:NEAR
EXTRN	_swtick:NEAR
EXTRN	__intsetup:NEAR
EXTRN	_csseg:NEAR
EXTRN	_swshfprt:NEAR
EXTRN	_dsseg:NEAR
EXTRN	_swkeyint:NEAR
EXTRN	_swtitln:NEAR
EXTRN	_intson:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_setadisp:NEAR
EXTRN	_swposcur:NEAR
EXTRN	_sysint:NEAR
EXTRN	_swtitlf:NEAR
EXTRN	_inportb:NEAR
EXTRN	_init1mul:NEAR
EXTRN	_setdxdy:NEAR
EXTRN	_swputsym:NEAR
EXTRN	_init1asy:NEAR
EXTRN	_init2mul:NEAR
EXTRN	_insertx:NEAR
EXTRN	_movblock:NEAR
EXTRN	_swend:NEAR
EXTRN	_toupper:NEAR
EXTRN	_init2asy:NEAR
EXTRN	_swgetc:NEAR
EXTRN	_movmem:NEAR
EXTRN	_outportb:NEAR
EXTRN	_initsound:NEAR
EXTRN	_dispwobj:NEAR
EXTRN	_setmem:NEAR
EXTRN	_swsetblk:NEAR
EXTRN	_oxsplatted:WORD
EXTRN	_movemax:WORD
EXTRN	__systype:WORD
EXTRN	_playmode:WORD
EXTRN	_swgames:BYTE
EXTRN	_currgame:WORD
EXTRN	_ground:BYTE
EXTRN	_orground:BYTE
EXTRN	_multbuff:WORD
EXTRN	_hires:WORD
EXTRN	_titleflg:WORD
EXTRN	_keydelay:WORD
EXTRN	_counttick:WORD
EXTRN	_soundflg:WORD
EXTRN	_sintab:BYTE
EXTRN	_joystick:WORD
EXTRN	_swghtsym:BYTE
EXTRN	_ibmkeybd:WORD
EXTRN	_envrestart:BYTE
EXTRN	_endsts:BYTE
EXTRN	_endcount:WORD
EXTRN	_inplay:WORD
EXTRN	_goingsun:WORD
EXTRN	_koveride:WORD
EXTRN	_compnear:BYTE
EXTRN	_missok:WORD
EXTRN	_gamenum:WORD
EXTRN	_explseed:WORD
EXTRN	_gmaxspeed:WORD
EXTRN	_gminspeed:WORD
EXTRN	_targrnge:WORD
EXTRN	_displx:WORD
EXTRN	_maxcrash:WORD
EXTRN	_disprx:WORD
EXTRN	_ctlbflag:WORD
EXTRN	_auxdisp:BYTE
EXTRN	_dispinit:WORD
EXTRN	_nobjects:WORD
EXTRN	_oobjects:BYTE
EXTRN	_objbot:WORD
EXTRN	_objtop:WORD
EXTRN	_objfree:WORD
EXTRN	_deltop:WORD
EXTRN	_delbot:WORD
EXTRN	_targets:BYTE
EXTRN	_numtarg:BYTE
EXTRN	_topobj:BYTE
EXTRN	_botobj:BYTE
EXTRN	_player:WORD
EXTRN	_compplane:WORD
EXTRN	_wdisp:BYTE
EXTRN	_splatox:WORD
_DATA      SEGMENT
$SG238	DB	00H
$SG239	DB	'SOPWITH, Distribution Version',  00H
$SG240	DB	'(c) Copyright 1984-2000 David L. Clark',  00H
$SG241	DB	'Modification Date:  October 29, 2000',  00H
$SG242	DB	00H
$SG243	DB	'Usage:  sopwith [options]',  00H
$SG244	DB	'The options are:',  00H
$SG245	DB	'        -n :  novice single player',  00H
$SG246	DB	'        -s :  single player',  00H
$SG247	DB	'        -c :  single player against computer',  00H
$SG248	DB	'        -a :  2 players over asynchrounous communications li'
	DB	'ne',  00H
$SG249	DB	'              (Only one of -n, -s, -c, -a may be specified)',  00H
$SG250	DB	'        -k :  keyboard only',  00H
$SG251	DB	'        -j :  joystick and keyboard',  00H
$SG252	DB	'              (Only one of -k and -j  may be specified)',  00H
$SG253	DB	'        -q :  begin game with sound off',  00H
$SG254	DB	'        -p#:  overrides asynchronous port 1 as the asynchrou'
	DB	'nous port',  00H
$SG255	DB	'                  to use',  00H
$SG270	DB	00H, '              ',  00H
$SG274	DB	'n&s&c&a&k&j&q&x&:',  00H
	ORG	$+39
$SG321	DB	0dH,  0aH,  00H
$SG325	DB	0dH,  0aH,  00H
$SG359	DB	'Key: K - Keyboard Only',  0dH,  0aH,  00H
$SG360	DB	'     J - Joystick and Keyboard',  0dH,  0aH,  00H
$SG371	DB	'Key: S - single player',  0dH,  0aH,  00H
$SG372	DB	'     C - single player against computer',  0dH,  0aH,  00H
$SG374	DB	'     A - 2 players on asynchronous line',  00H
$SG384	DB	'Key: N - novice player',  0dH,  0aH,  00H
$SG385	DB	'     E - expert player',  0dH,  0aH,  00H
$SG404	DB	'         Key a game number',  00H
	ORG	$-286
$S237_helptxt	DW	DGROUP:$SG238
	DW	DGROUP:$SG239
	DW	DGROUP:$SG240
	DW	DGROUP:$SG241
	DW	DGROUP:$SG242
	DW	DGROUP:$SG243
	DW	DGROUP:$SG244
	DW	DGROUP:$SG245
	DW	DGROUP:$SG246
	DW	DGROUP:$SG247
	DW	DGROUP:$SG248
	DW	DGROUP:$SG249
	DW	DGROUP:$SG250
	DW	DGROUP:$SG251
	DW	DGROUP:$SG252
	DW	DGROUP:$SG253
	DW	DGROUP:$SG254
	DW	DGROUP:$SG255
	DW	00H
	ORG	$+248
$S530_inits	DW	00H
	DW	07H
$S531_initc	DW	00H
	DW	07H
	DW	01H
	DW	06H
$S532_initm	DW	00H
	DW	07H
	DW	03H
	DW	04H
	DW	02H
	DW	05H
	DW	01H
	DW	06H
$S702_ifx	DW	0172H
	DW	055aH
	DW	065eH
	DW	0a46H
$S703_ify	DW	0c7H
	DW	0c7H
	DW	0c7H
	DW	0c7H
$S704_ifdx	DW	02H
	DW	02H
	DW	0fffeH
	DW	0fffeH
$S723_ibx	DW	08H
	DW	03H
	DW	00H
	DW	06H
	DW	07H
	DW	0eH
	DW	0aH
	DW	0cH
$S724_iby	DW	010H
	DW	01H
	DW	08H
	DW	03H
	DW	0cH
	DW	0aH
	DW	07H
	DW	0eH
$S725_ibdx	DW	0fffeH
	DW	02H
	DW	0fffdH
	DW	03H
	DW	0ffffH
	DW	01H
	DW	00H
	DW	00H
$S726_ibdy	DW	0ffffH
	DW	0fffeH
	DW	0ffffH
	DW	0fffeH
	DW	0ffffH
	DW	0fffeH
	DW	0ffffH
	DW	0fffeH
$S731_iox	DW	0560H
	DW	0648H
$S732_ioy	DW	050H
	DW	05bH
_DATA      ENDS
_BSS      SEGMENT
	ORG	$+2
$S235_savescore	DW 01H DUP (?)
	ORG	$-4
$S236_ghost	DW 01H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 38
; Line 27
; Line 28
; Line 29
; Line 30
; Line 31
; Line 177
	PUBLIC	_swinit
_swinit	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__aNchkstk
	push	di
	push	si
;	reset = -12
;	n = -20
;	s = -10
;	c = -8
;	m = -18
;	a = -6
;	k = -16
;	modeset = -4
;	keyset = -14
;	device = -2
;	argv = 6
;	argc = 4
; Line 186
	sub	ax,ax
	mov	WORD PTR [bp-12],ax	;reset
	mov	WORD PTR [bp-20],ax	;n
	mov	WORD PTR [bp-10],ax	;s
	mov	WORD PTR [bp-8],ax	;c
	mov	WORD PTR [bp-18],ax	;m
	mov	WORD PTR [bp-6],ax	;a
	mov	WORD PTR [bp-16],ax	;k
; Line 188
	mov	WORD PTR [bp-2],OFFSET DGROUP:$SG270	;device
; Line 210
	mov	ax,OFFSET _missok
	push	ax
	mov	ax,OFFSET _soundflg
	push	ax
	mov	ax,OFFSET _joystick
	push	ax
	lea	cx,WORD PTR [bp-16]	;k
	push	cx
	lea	dx,WORD PTR [bp-6]	;a
	push	dx
	lea	bx,WORD PTR [bp-8]	;c
	push	bx
	lea	si,WORD PTR [bp-10]	;s
	push	si
	lea	di,WORD PTR [bp-20]	;n
	push	di
	mov	ax,OFFSET DGROUP:$SG274
	push	ax
	lea	ax,WORD PTR [bp+6]	;argv
	push	ax
	lea	ax,WORD PTR [bp+4]	;argc
	push	ax
	call	_getflags
	add	sp,22
	or	ax,ax
	jne	$I273
	mov	ax,WORD PTR [bp-6]	;a
	add	ax,WORD PTR [bp-8]	;c
	add	ax,WORD PTR [bp-10]	;s
	add	ax,WORD PTR [bp-20]	;n
	mov	WORD PTR [bp-4],ax	;modeset
	cmp	ax,1
	jg	$I273
	mov	ax,WORD PTR [bp-16]	;k
	add	ax,WORD PTR _joystick
	mov	WORD PTR [bp-14],ax	;keyset
	cmp	ax,1
	jle	$I272
$I273:
; Line 211
	mov	ax,OFFSET DGROUP:$S237_helptxt
	push	ax
	call	disphelp
	add	sp,2
; Line 212
	mov	ax,1
	push	ax
	call	_exit
	add	sp,2
; Line 213
; Line 215
$I272:
	cmp	WORD PTR _soundflg,1
	sbb	ax,ax
	neg	ax
	mov	WORD PTR _soundflg,ax
; Line 216
	cmp	WORD PTR [bp-4],0	;modeset
	je	$I277
	cmp	WORD PTR [bp-14],0	;keyset
	je	$I277
; Line 217
	mov	WORD PTR _titleflg,1
; Line 219
$I277:
	mov	WORD PTR _movemax,15
; Line 220
	call	_initseed
; Line 221
	push	WORD PTR _explseed
	call	_histinit
	add	sp,2
	mov	WORD PTR _explseed,ax
; Line 222
	call	_initsndt
; Line 223
	call	_intsoff
; Line 224
	call	_dsseg
	push	ax
	call	_csseg
	push	ax
	mov	ax,OFFSET _swbreak
	push	ax
	mov	ax,27
	push	ax
	call	__intsetup
	add	sp,8
; Line 225
	call	_dsseg
	push	ax
	call	_csseg
	push	ax
	mov	ax,OFFSET _swtick
	push	ax
	mov	ax,28
	push	ax
	call	__intsetup
	add	sp,8
; Line 226
	call	initgrnd
; Line 227
	call	_swtitln
; Line 228
	call	_intson
; Line 230
	cmp	WORD PTR [bp-4],0	;modeset
	je	$I288
; Line 234
	cmp	WORD PTR [bp-20],0	;n
	je	$L20003
	mov	ax,4
	jmp	SHORT $L20008
$L20003:
	cmp	WORD PTR [bp-10],0	;s
	je	$L20005
	sub	ax,ax
	jmp	SHORT $L20008
$L20005:
	cmp	WORD PTR [bp-8],0	;c
	je	$L20007
	mov	ax,2
	jmp	SHORT $L20008
	nop	
$L20007:
	cmp	WORD PTR [bp-18],1	;m
	sbb	ax,ax
	and	ax,2
	inc	ax
$L20008:
	mov	WORD PTR _playmode,ax
; Line 235
	jmp	SHORT $I289
	nop	
$I288:
; Line 236
	call	getmode
$I289:
; Line 238
	cmp	WORD PTR [bp-14],0	;keyset
	jne	$I291
; Line 239
	call	getkey
; Line 241
$I291:
	cmp	WORD PTR _playmode,1
	je	$I294
	cmp	WORD PTR _playmode,3
	jne	$I293
$I294:
; Line 242
	mov	WORD PTR _maxcrash,10
; Line 243
	cmp	WORD PTR _playmode,1
	jne	$I295
; Line 244
	push	WORD PTR [bp-2]	;device
	push	WORD PTR [bp-12]	;reset
	call	_init1mul
	add	sp,4
; Line 245
	jmp	SHORT $I297
	nop	
$I295:
; Line 246
	call	_init1asy
$I297:
; Line 247
	call	initgrnd
; Line 248
	call	initobjs
; Line 249
	cmp	WORD PTR _playmode,1
	jne	$I300
; Line 250
	call	_init2mul
; Line 251
	jmp	SHORT $I302
	nop	
$I300:
; Line 252
	call	_init2asy
$I302:
; Line 253
	call	inittarg
; Line 254
	mov	bx,WORD PTR _currgame
	cmp	WORD PTR [bx+36],0
	je	$I305
; Line 255
	call	WORD PTR [bx+36]
; Line 256
$I305:
	sub	ax,ax
	push	ax
	call	_initdisp
	add	sp,2
; Line 257
	cmp	WORD PTR _keydelay,-1
	jne	$I308
; Line 258
	mov	WORD PTR _keydelay,1
; Line 259
	jmp	SHORT $I308
	nop	
$I293:
; Line 260
	cmp	WORD PTR _keydelay,-1
	jne	$I309
; Line 261
	mov	WORD PTR _keydelay,1
; Line 262
$I309:
	mov	WORD PTR _maxcrash,5
; Line 263
	mov	WORD PTR _currgame,OFFSET _swgames
; Line 264
	call	_clrprmpt
; Line 265
	call	initobjs
; Line 266
	sub	ax,ax
	push	ax
	call	_initplyr
	add	sp,2
; Line 267
	sub	ax,ax
	push	ax
	call	_initcomp
	add	sp,2
; Line 268
	sub	ax,ax
	push	ax
	call	_initcomp
	add	sp,2
; Line 269
	sub	ax,ax
	push	ax
	call	_initcomp
	add	sp,2
; Line 270
	call	inittarg
; Line 271
	mov	bx,WORD PTR _currgame
	cmp	WORD PTR [bx+36],0
	je	$I313
; Line 272
	call	WORD PTR [bx+36]
; Line 273
$I313:
	sub	ax,ax
	push	ax
	call	_initdisp
	add	sp,2
; Line 274
$I308:
; Line 276
	call	_initflck
; Line 277
	call	_initoxen
; Line 279
	call	_initgdep
; Line 281
	call	_intsoff
; Line 282
	call	_dsseg
	push	ax
	call	_csseg
	push	ax
	mov	ax,OFFSET _swshfprt
	push	ax
	mov	ax,5
	push	ax
	call	__intsetup
	add	sp,8
; Line 283
	call	_dsseg
	push	ax
	call	_csseg
	push	ax
	mov	ax,OFFSET _swkeyint
	push	ax
	mov	ax,9
	push	ax
	call	__intsetup
	add	sp,8
	mov	WORD PTR _koveride,ax
; Line 284
	mov	WORD PTR _inplay,1
; Line 285
	call	_intson
; Line 286
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_swinit	ENDP
; Line 291
disphelp	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	register si = h
;	hp = 4
; Line 295
	mov	si,WORD PTR [bp+4]	;hp
; Line 296
	mov	ax,OFFSET DGROUP:$SG321
	jmp	SHORT $L20029
$FC323:
; Line 298
	mov	WORD PTR [bp-2],si
	inc	si
	inc	si
	mov	bx,WORD PTR [bp-2]
	push	WORD PTR [bx]
	call	_puts
	add	sp,2
; Line 299
	mov	ax,OFFSET DGROUP:$SG325
$L20029:
	push	ax
	call	_puts
	add	sp,2
; Line 300
	cmp	WORD PTR [si],0
	jne	$FC323
; Line 301
	pop	si
	mov	sp,bp
	pop	bp
	ret	

disphelp	ENDP
; Line 308
	PUBLIC	_initseed
_initseed	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	si
; Line 310
	jmp	SHORT $L20030
$FC328:
; Line 311
	sub	ax,ax
	push	ax
	mov	ax,67
	push	ax
	call	_outportb
	add	sp,4
; Line 313
	mov	ax,64
	push	ax
	call	_inportb
	add	sp,2
	mov	cx,64
	push	cx
	mov	si,ax
	call	_inportb
	add	sp,2
	mov	cx,si
	and	cl,255
	mov	dl,cl
	mov	dh,al
	mov	WORD PTR _explseed,dx
; Line 314
$L20030:
	cmp	WORD PTR _explseed,0
	je	$FC328
; Line 321
	pop	si
	ret	
	nop	

_initseed	ENDP
; Line 328
	PUBLIC	_swrestart
_swrestart	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = tickwait
;	inc = -2
; Line 332
	mov	bx,WORD PTR _player
	shl	bx,1
	cmp	WORD PTR _endsts[bx],1
	jne	$I335
; Line 333
	mov	ax,118
	imul	WORD PTR _player
	mov	si,ax
	add	si,WORD PTR _nobjects
; Line 334
	mov	WORD PTR [bp-2],0	;inc
; Line 335
$L20031:
	mov	ax,WORD PTR [si+76]
	inc	WORD PTR [si+76]
	cmp	WORD PTR _maxcrash,ax
	jg	$FC337
; Line 346
	inc	WORD PTR _gamenum
; Line 347
	mov	ax,WORD PTR [si+22]
	jmp	SHORT $L20032
	nop	
$FC337:
; Line 336
	add	WORD PTR [bp-2],25	;inc
	mov	ax,WORD PTR [bp-2]	;inc
	add	WORD PTR [si+22],ax
; Line 337
	call	_setvdisp
; Line 338
	push	si
	call	_dispcgge
	add	sp,2
; Line 339
	push	si
	call	_dispscore
	add	sp,2
; Line 340
	call	_intsoff
; Line 341
	mov	di,5
; Line 342
	mov	WORD PTR _counttick,0
; Line 343
	call	_intson
; Line 344
$FC343:
	cmp	WORD PTR _counttick,di
	jge	$L20031
	jmp	SHORT $FC343
; Line 345
$I335:
; Line 350
	sub	ax,ax
	mov	WORD PTR _gamenum,ax
$L20032:
	mov	WORD PTR $S235_savescore,ax
; Line 351
; Line 353
	call	_initsndt
; Line 354
	call	initgrnd
; Line 355
	call	initobjs
; Line 356
	sub	ax,ax
	push	ax
	call	_initplyr
	add	sp,2
; Line 357
	sub	ax,ax
	push	ax
	call	_initcomp
	add	sp,2
; Line 358
	sub	ax,ax
	push	ax
	call	_initcomp
	add	sp,2
; Line 359
	sub	ax,ax
	push	ax
	call	_initcomp
	add	sp,2
; Line 360
	call	inittarg
; Line 361
	mov	bx,WORD PTR _currgame
	cmp	WORD PTR [bx+36],0
	je	$I346
; Line 362
	call	WORD PTR [bx+36]
; Line 364
$I346:
	sub	ax,ax
	push	ax
	call	_initdisp
	add	sp,2
; Line 365
	call	_initflck
; Line 366
	call	_initoxen
; Line 367
	call	_initgdep
; Line 369
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _envrestart
	push	ax
	call	_longjmp
	add	sp,4
; Line 370
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_swrestart	ENDP
; Line 375
	PUBLIC	_initgdep
_initgdep	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 377
	mov	ax,WORD PTR _gamenum
	add	ax,8
	mov	WORD PTR _gmaxspeed,ax
; Line 378
	mov	ax,WORD PTR _gamenum
	add	ax,4
	mov	WORD PTR _gminspeed,ax
; Line 380
	mov	WORD PTR _targrnge,150
; Line 381
	cmp	WORD PTR _gamenum,6
	jge	$I348
; Line 382
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	shl	ax,1
	shl	ax,1
	sub	ax,cx
	mov	WORD PTR _targrnge,ax
; Line 383
$I348:
	mov	ax,WORD PTR _targrnge
	imul	ax
	mov	WORD PTR _targrnge,ax
; Line 384
	ret	

_initgdep	ENDP
; Line 392
	PUBLIC	_clrprmpt
_clrprmpt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__aNchkstk
	push	si
;	register si = i
;	reg = -16
; Line 397
	sub	si,si
$FC353:
; Line 398
	lea	ax,WORD PTR [si+20]
	push	ax
	sub	ax,ax
	push	ax
	call	_swposcur
	add	sp,4
; Line 399
	mov	WORD PTR [bp-16],2592	;reg
; Line 400
	mov	WORD PTR [bp-14],0
; Line 401
	cmp	WORD PTR _hires,1
	sbb	ax,ax
	and	al,216
	add	ax,80
	mov	WORD PTR [bp-12],ax
; Line 402
	lea	ax,WORD PTR [bp-16]	;reg
	push	ax
	push	ax
	mov	ax,16
	push	ax
	call	_sysint
	add	sp,6
; Line 403
	inc	si
	cmp	si,4
	jl	$FC353
; Line 404
	mov	ax,20
	push	ax
	sub	ax,ax
	push	ax
	call	_swposcur
	add	sp,4
; Line 416
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_clrprmpt	ENDP
; Line 422
getkey	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	key = -2
; Line 442
	call	_clrprmpt
; Line 443
	mov	ax,OFFSET DGROUP:$SG359
	push	ax
	call	_puts
	add	sp,2
; Line 444
	mov	ax,OFFSET DGROUP:$SG360
	push	ax
	call	_puts
	add	sp,2
; Line 445
$FC362:
; Line 446
	call	_ctlbreak
	or	ax,ax
	je	$I365
; Line 447
	sub	ax,ax
	push	ax
	push	ax
	call	_swend
	add	sp,4
; Line 448
$I365:
; Line 449
	call	_swgetc
	sub	ah,ah
	push	ax
	call	_toupper
	add	sp,2
	mov	BYTE PTR [bp-2],al	;key
	cmp	al,75
	je	$I369
	cmp	al,74
	jne	$FC362
; Line 451
$I369:
	cmp	BYTE PTR [bp-2],74	;key
	jne	$L20013
	mov	ax,1
	jmp	SHORT $L20014
	nop	
$L20013:
	sub	ax,ax
$L20014:
	mov	WORD PTR _joystick,ax
; Line 452
	mov	WORD PTR _ibmkeybd,1
; Line 453
; Line 455
	mov	sp,bp
	pop	bp
	ret	
	nop	

getkey	ENDP
; Line 462
getmode	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 463
	call	_clrprmpt
; Line 464
	mov	ax,OFFSET DGROUP:$SG371
	push	ax
	call	_puts
	add	sp,2
; Line 465
	mov	ax,OFFSET DGROUP:$SG372
	push	ax
	call	_puts
	add	sp,2
; Line 466
	cmp	WORD PTR __systype,0
	jne	$I373
; Line 470
	mov	ax,OFFSET DGROUP:$SG374
	push	ax
	call	_puts
	add	sp,2
; Line 471
; Line 472
$I373:
; Line 473
	call	_ctlbreak
	or	ax,ax
	je	$I378
; Line 474
	sub	ax,ax
	push	ax
	push	ax
	call	_swend
	add	sp,4
; Line 475
$I378:
	call	_swgetc
	sub	ah,ah
	push	ax
	call	_toupper
	add	sp,2
	cmp	ax,83
	je	$SC383
	ja	$I373
	sub	al,65
	je	$SC398
	sub	al,2
	je	$SC397
	sub	al,10
; Line 511
	jmp	SHORT $I373
; Line 476
	nop	
$SC383:
; Line 477
	call	_clrprmpt
; Line 478
	mov	ax,OFFSET DGROUP:$SG384
	push	ax
	call	_puts
	add	sp,2
; Line 479
	mov	ax,OFFSET DGROUP:$SG385
	push	ax
	call	_puts
	add	sp,2
; Line 480
$FC387:
; Line 481
	call	_ctlbreak
	or	ax,ax
	je	$I389
; Line 482
	sub	ax,ax
	push	ax
	push	ax
	call	_swend
	add	sp,4
; Line 483
$I389:
; Line 484
	call	_swgetc
	sub	ah,ah
	push	ax
	call	_toupper
	add	sp,2
	sub	ax,69
	je	$SC395
	sub	ax,9
	jne	$FC387
; Line 492
; Line 486
	mov	WORD PTR _playmode,4
; Line 487
	ret	
; Line 488
	nop	
$SC395:
; Line 489
	mov	WORD PTR _playmode,0
; Line 490
	ret	
	nop	
$SC397:
; Line 502
	mov	WORD PTR _playmode,2
; Line 503
	ret	
; Line 504
	nop	
$SC398:
; Line 505
	cmp	WORD PTR __systype,0
	je	$JCC1375
	jmp	$I373
$JCC1375:
; Line 506
	mov	WORD PTR _playmode,3
; Line 507
	ret	
	nop	

getmode	ENDP
; Line 520
	PUBLIC	_getgame
_getgame	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	si
;	register si = game
; Line 523
	call	_clrprmpt
; Line 524
	mov	ax,OFFSET DGROUP:$SG404
	push	ax
	call	_puts
	add	sp,2
; Line 525
$FC406:
; Line 526
	call	_ctlbreak
	or	ax,ax
	je	$I408
; Line 527
	sub	ax,ax
	push	ax
	push	ax
	call	_swend
	add	sp,4
; Line 528
$I408:
; Line 529
	call	_swgetc
	mov	si,ax
	and	si,255
	sub	si,48
	js	$FC406
	cmp	si,7
	jg	$FC406
; Line 530
	mov	ax,si
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_getgame	ENDP
; Line 538
	PUBLIC	_ctlbreak
_ctlbreak	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 539
	mov	ax,WORD PTR _ctlbflag
; Line 540
	ret	
	nop	

_ctlbreak	ENDP
; Line 546
initgrnd	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 547
	mov	ax,3000
	push	ax
	mov	ax,OFFSET _ground
	push	ax
	mov	ax,OFFSET _orground
	push	ax
	call	_movmem
	add	sp,6
; Line 548
	ret	

initgrnd	ENDP
; Line 554
	PUBLIC	_initdisp
_initdisp	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,118
	call	__aNchkstk
	push	si
;	register si = ob
;	ghostob = -118
;	reset = 4
; Line 560
	sub	ax,ax
	mov	WORD PTR _oxsplatted,ax
	mov	WORD PTR _splatox,ax
; Line 561
	cmp	WORD PTR [bp+4],ax	;reset
	jne	$I417
; Line 562
	call	clrdispa
; Line 563
	call	_setadisp
; Line 564
	call	dispworld
; Line 565
	call	_swtitlf
; Line 566
	mov	WORD PTR $S236_ghost,0
; Line 567
; Line 568
$I417:
	call	movedisp
; Line 569
	call	_setvdisp
; Line 570
	call	initwobj
; Line 571
	call	initscore
; Line 573
	mov	ax,118
	imul	WORD PTR _player
	mov	si,ax
	add	si,WORD PTR _nobjects
; Line 574
	cmp	WORD PTR $S236_ghost,0
	je	$I425
; Line 575
	mov	WORD PTR [bp-22],99
; Line 576
	mov	ax,8
	mov	WORD PTR [bp-82],ax
	mov	WORD PTR [bp-84],ax
; Line 577
	mov	ax,WORD PTR [si+42]
	mov	WORD PTR [bp-76],ax
; Line 578
	mov	WORD PTR [bp-40],OFFSET _swghtsym
; Line 579
	lea	ax,WORD PTR [bp-118]	;ghostob
	push	ax
	mov	ax,12
	push	ax
	mov	ax,131
	push	ax
	call	_swputsym
	add	sp,6
; Line 580
	jmp	SHORT $I427
$I425:
; Line 581
	push	si
	call	_dispfgge
	add	sp,2
; Line 582
	push	si
	call	_dispbgge
	add	sp,2
; Line 583
	push	si
	call	_dispmgge
	add	sp,2
; Line 584
	push	si
	call	_dispsbgge
	add	sp,2
; Line 585
	push	si
	call	_dispsgge
	add	sp,2
; Line 586
	push	si
	call	_dispcgge
	add	sp,2
; Line 587
$I427:
; Line 588
	mov	WORD PTR _dispinit,1
; Line 589
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_initdisp	ENDP
; Line 594
initscore	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 595
	cmp	WORD PTR $S235_savescore,0
	je	$I434
; Line 596
	mov	ax,WORD PTR $S235_savescore
	mov	bx,WORD PTR _nobjects
	mov	WORD PTR [bx+22],ax
; Line 597
	mov	WORD PTR $S235_savescore,0
; Line 598
; Line 600
$I434:
	push	WORD PTR _nobjects
	call	_dispscore
	add	sp,2
; Line 602
	cmp	WORD PTR _playmode,1
	je	$I436
	cmp	WORD PTR _playmode,3
	jne	$I435
$I436:
	mov	bx,WORD PTR _multbuff
	cmp	WORD PTR [bx],1
	jbe	$I435
; Line 603
	mov	ax,WORD PTR _nobjects
	add	ax,118
	push	ax
	call	_dispscore
	add	sp,2
; Line 604
$I435:
	ret	
	nop	

initscore	ENDP
; Line 610
	PUBLIC	_dispcgge
_dispcgge	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	ob = 4
; Line 612
	mov	bx,WORD PTR [bp+4]	;ob
	push	WORD PTR [bx+42]
	push	WORD PTR _maxcrash
	mov	ax,WORD PTR _maxcrash
	sub	ax,WORD PTR [bx+76]
	push	ax
	mov	ax,127
	push	ax
	call	dispgge
; Line 613
	mov	sp,bp
	pop	bp
	ret	

_dispcgge	ENDP
; Line 619
	PUBLIC	_dispfgge
_dispfgge	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	ob = 4
; Line 621
	mov	bx,WORD PTR [bp+4]	;ob
	push	WORD PTR [bx+42]
	mov	ax,562
	push	ax
	mov	cl,4
	mov	ax,WORD PTR [bx+30]
	sar	ax,cl
	push	ax
	mov	ax,130
	push	ax
	call	dispgge
; Line 622
	mov	sp,bp
	pop	bp
	ret	
	nop	

_dispfgge	ENDP
; Line 628
	PUBLIC	_dispbgge
_dispbgge	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	ob = 4
; Line 630
	mov	ax,3
	mov	bx,WORD PTR [bp+4]	;ob
	sub	ax,WORD PTR [bx+42]
	push	ax
	mov	ax,5
	push	ax
	push	WORD PTR [bx+40]
	mov	ax,133
	push	ax
	call	dispgge
; Line 631
	mov	sp,bp
	pop	bp
	ret	

_dispbgge	ENDP
; Line 637
	PUBLIC	_dispsgge
_dispsgge	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	ob = 4
; Line 639
	mov	ax,3
	push	ax
	mov	ax,200
	push	ax
	mov	bx,WORD PTR [bp+4]	;ob
	push	WORD PTR [bx+24]
	mov	ax,136
	push	ax
	call	dispgge
; Line 640
	mov	sp,bp
	pop	bp
	ret	
	nop	

_dispsgge	ENDP
; Line 646
	PUBLIC	_dispmgge
_dispmgge	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	ob = 4
; Line 648
	mov	bx,WORD PTR [bp+4]	;ob
	push	WORD PTR [bx+42]
	mov	ax,5
	push	ax
	push	WORD PTR [bx+104]
	mov	ax,139
	push	ax
	call	dispgge
; Line 649
	mov	sp,bp
	pop	bp
	ret	

_dispmgge	ENDP
; Line 655
	PUBLIC	_dispsbgge
_dispsbgge	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	ob = 4
; Line 657
	mov	ax,3
	mov	bx,WORD PTR [bp+4]	;ob
	sub	ax,WORD PTR [bx+42]
	push	ax
	mov	ax,5
	push	ax
	push	WORD PTR [bx+112]
	mov	ax,142
	push	ax
	call	dispgge
; Line 658
	mov	sp,bp
	pop	bp
	ret	

_dispsbgge	ENDP
; Line 664
dispgge	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	si
;	register si = y
;	clr = 10
;	maxy = 8
;	cury = 6
;	x = 4
; Line 668
	cmp	WORD PTR $S236_ghost,0
	jne	$FB464
; Line 672
	mov	ax,WORD PTR [bp+6]	;cury
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	cwd	
	idiv	WORD PTR [bp+8]	;maxy
	dec	ax
	mov	WORD PTR [bp+6],ax	;cury
	cmp	ax,9
	jle	$I457
; Line 673
	mov	WORD PTR [bp+6],9	;cury
; Line 674
$I457:
	sub	si,si
	jmp	SHORT $F458
	nop	
$FC459:
	inc	si
$F458:
	cmp	WORD PTR [bp+6],si	;cury
	jl	$F462
; Line 675
	push	WORD PTR [bp+10]	;clr
	push	si
	push	WORD PTR [bp+4]	;x
	call	_swpntsym
	add	sp,6
	jmp	SHORT $FC459
	nop	
$FC463:
	inc	si
$F462:
	cmp	si,9
	jg	$FB464
; Line 677
	sub	ax,ax
	push	ax
	push	si
	push	WORD PTR [bp+4]	;x
	call	_swpntsym
	add	sp,6
	jmp	SHORT $FC463
	nop	
$FB464:
; Line 678
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

dispgge	ENDP
; Line 683
dispworld	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	di
	push	si
;	register si = x
;	register di = y
;	dx = -2
;	maxh = -4
;	sx = -6
; Line 687
	mov	WORD PTR [bp-6],152	;sx
; Line 691
	sub	si,si
	mov	WORD PTR [bp-2],si	;dx
	mov	WORD PTR [bp-4],si	;maxh
	mov	di,si
	jmp	SHORT $F471
$I476:
; Line 701
	cmp	ax,di
	jle	$FC484
$FC480:
	inc	di
	cmp	WORD PTR [bp-4],di	;maxh
	jl	$FB485
; Line 703
	mov	ax,7
	push	ax
	push	di
	push	WORD PTR [bp-6]	;sx
	call	_swpntsym
	add	sp,6
	jmp	SHORT $FC480
$FC484:
	dec	di
	cmp	WORD PTR [bp-4],di	;maxh
	jg	$FB485
; Line 706
	mov	ax,7
	push	ax
	push	di
	push	WORD PTR [bp-6]	;sx
	call	_swpntsym
	add	sp,6
	jmp	SHORT $FC484
$FB485:
; Line 707
	mov	di,WORD PTR [bp-4]	;maxh
; Line 708
	mov	ax,11
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-6]	;sx
	call	_swpntsym
	add	sp,6
; Line 709
	inc	WORD PTR [bp-6]	;sx
; Line 710
	sub	ax,ax
	mov	WORD PTR [bp-4],ax	;maxh
	mov	WORD PTR [bp-2],ax	;dx
; Line 711
; Line 712
$FC472:
	inc	si
$F471:
	cmp	si,3000
	jge	$FB473
; Line 693
	mov	al,BYTE PTR _ground[si]
	sub	ah,ah
	cmp	ax,WORD PTR [bp-4]	;maxh
	jle	$I474
; Line 694
	mov	WORD PTR [bp-4],ax	;maxh
; Line 696
$I474:
	inc	WORD PTR [bp-2]	;dx
	cmp	WORD PTR [bp-2],19	;dx
	jne	$FC472
; Line 698
	mov	cx,13
	mov	ax,WORD PTR [bp-4]	;maxh
	cwd	
	idiv	cx
	mov	WORD PTR [bp-4],ax	;maxh
	cmp	ax,di
	jne	$I476
; Line 699
	mov	cx,7
	push	cx
	push	ax
	push	WORD PTR [bp-6]	;sx
	call	_swpntsym
	add	sp,6
; Line 700
	jmp	SHORT $FB485
$FB473:
; Line 713
	mov	WORD PTR [bp-4],15	;maxh
; Line 714
	sub	di,di
	jmp	SHORT $F486
	nop	
$FC487:
; Line 715
	mov	ax,11
	push	ax
	push	di
	mov	cx,152
	push	cx
	call	_swpntsym
	add	sp,6
; Line 716
	mov	ax,11
	push	ax
	push	di
	push	WORD PTR [bp-6]	;sx
	call	_swpntsym
	add	sp,6
; Line 717
	inc	di
$F486:
	cmp	WORD PTR [bp-4],di	;maxh
	jge	$FC487
; Line 719
	sub	si,si
$FC490:
; Line 720
	mov	ax,7
	push	ax
	mov	ax,18
	push	ax
	push	si
	call	_swpntsym
	add	sp,6
	inc	si
	cmp	si,320
	jl	$FC490
; Line 721
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

dispworld	ENDP
; Line 728
initwobj	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	di
	push	si
;	x = -2
;	register si = ob
;	register di = ow
; Line 733
	mov	di,OFFSET _wdisp
; Line 734
	mov	si,WORD PTR _nobjects
; Line 735
	mov	WORD PTR [bp-2],0	;x
$FC497:
; Line 736
	sub	ax,ax
	mov	WORD PTR [si+64],ax
	mov	WORD PTR [si+62],ax
	mov	WORD PTR [di],ax
	inc	WORD PTR [bp-2]	;x
	add	di,6
	add	si,118
	cmp	WORD PTR [bp-2],100	;x
	jl	$FC497
; Line 738
	mov	WORD PTR [bp-2],ax	;x
$FC500:
; Line 739
	mov	bx,WORD PTR [bp-2]	;x
	shl	bx,1
	mov	si,WORD PTR _targets[bx]
	or	si,si
	je	$I502
	cmp	WORD PTR [si],91
	je	$I502
; Line 740
	push	si
	call	_dispwobj
	add	sp,2
; Line 742
$I502:
	inc	WORD PTR [bp-2]	;x
	cmp	WORD PTR [bp-2],20	;x
	jl	$FC500
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

initwobj	ENDP
; Line 747
movedisp	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 749
	sub	ax,ax
	push	ax
	mov	cx,4096
	push	cx
	mov	dx,-18432
	push	dx
	push	ax
	call	_swsetblk
	add	sp,8
; Line 750
	sub	ax,ax
	push	ax
	mov	ax,4096
	push	ax
	mov	ax,-18432
	push	ax
	mov	cx,8192
	push	cx
	call	_swsetblk
	add	sp,8
; Line 751
	mov	ax,4096
	push	ax
	mov	cx,-18432
	push	cx
	push	ax
	call	_dsseg
	push	ax
	mov	ax,OFFSET _auxdisp
	push	ax
	call	_movblock
	add	sp,10
; Line 752
	mov	ax,4096
	push	ax
	mov	ax,-18432
	push	ax
	mov	ax,12288
	push	ax
	call	_dsseg
	push	ax
	mov	ax,OFFSET _auxdisp+4096
	push	ax
	call	_movblock
	add	sp,10
; Line 762
	ret	

movedisp	ENDP
; Line 768
clrdispa	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 770
	sub	ax,ax
	push	ax
	mov	ax,8192
	push	ax
	mov	ax,OFFSET _auxdisp
	push	ax
	call	_setmem
	add	sp,6
; Line 776
	ret	
	nop	

clrdispa	ENDP
; Line 782
initobjs	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = o
; Line 786
	mov	ax,OFFSET _botobj
	mov	WORD PTR _topobj+52,ax
	mov	WORD PTR _topobj+72,ax
; Line 787
	mov	ax,OFFSET _topobj
	mov	WORD PTR _botobj+54,ax
	mov	WORD PTR _botobj+74,ax
; Line 788
	mov	WORD PTR _topobj+2,-32767
; Line 789
	mov	WORD PTR _botobj+2,32767
; Line 791
	sub	ax,ax
	mov	WORD PTR _delbot,ax
	mov	WORD PTR _deltop,ax
	mov	WORD PTR _objtop,ax
	mov	WORD PTR _objbot,ax
; Line 792
	mov	si,WORD PTR _nobjects
	mov	ax,si
	mov	WORD PTR _objfree,ax
; Line 794
	sub	di,di
$FC511:
; Line 795
	lea	ax,WORD PTR [si+118]
	mov	WORD PTR [si+52],ax
; Line 796
	mov	WORD PTR [si+56],di
	mov	si,ax
; Line 797
	inc	di
	cmp	di,100
	jl	$FC511
; Line 799
	sub	si,118
	mov	WORD PTR [si+52],0
; Line 801
	pop	si
	pop	di
	ret	

initobjs	ENDP
; Line 806
	PUBLIC	_initcomp
_initcomp	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	si
;	register si = ob
;	obp = 4
; Line 812
	push	WORD PTR [bp+4]	;obp
	call	_initpln
	add	sp,2
	mov	si,ax
; Line 813
	cmp	WORD PTR [bp+4],0	;obp
	jne	$I517
; Line 814
	mov	WORD PTR [si+68],OFFSET _dispcomp
; Line 815
	mov	WORD PTR [si+70],OFFSET _movecomp
; Line 816
	mov	WORD PTR [si+42],2
; Line 817
	cmp	WORD PTR _playmode,1
	je	$I518
	cmp	WORD PTR _playmode,3
	je	$I518
; Line 818
	mov	ax,WORD PTR _nobjects
	add	ax,118
	jmp	SHORT $L20038
	nop	
$I518:
; Line 820
	cmp	WORD PTR [si+56],1
	jne	$I520
; Line 821
	mov	WORD PTR [si+32],si
; Line 822
	jmp	SHORT $I521
	nop	
$I520:
; Line 823
	lea	ax,WORD PTR [si-236]
$L20038:
	mov	WORD PTR [si+32],ax
$I521:
; Line 824
	mov	ax,118
	push	ax
	imul	WORD PTR [si+56]
	add	ax,OFFSET _oobjects
	push	ax
	push	si
	call	_movmem
	add	sp,6
; Line 825
; Line 826
$I517:
	cmp	WORD PTR _playmode,0
	je	$I523
	cmp	WORD PTR _playmode,4
	jne	$I522
$I523:
; Line 827
	mov	WORD PTR [si],91
; Line 828
	push	si
	call	_deletex
	add	sp,2
; Line 829
; Line 830
$I522:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_initcomp	ENDP
; Line 835
	PUBLIC	_initplyr
_initplyr	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	si
;	register si = ob
;	obp = 4
; Line 840
	push	WORD PTR [bp+4]	;obp
	call	_initpln
	add	sp,2
	mov	si,ax
; Line 841
	cmp	WORD PTR [bp+4],0	;obp
	jne	$I528
; Line 842
	mov	WORD PTR [si+68],OFFSET _dispplyr
; Line 843
	mov	WORD PTR [si+70],OFFSET _moveplyr
; Line 844
	mov	ax,WORD PTR [si+56]
	mov	cx,2
	cwd	
	idiv	cx
	inc	dx
	mov	WORD PTR [si+42],dx
; Line 845
	mov	WORD PTR [si+32],si
; Line 846
	mov	ax,118
	push	ax
	imul	WORD PTR [si+56]
	add	ax,OFFSET _oobjects
	push	ax
	push	si
	call	_movmem
	add	sp,6
; Line 848
	sub	ax,ax
	mov	WORD PTR _goingsun,ax
	mov	WORD PTR _endcount,ax
; Line 849
; Line 851
$I528:
; Line 852
	mov	ax,WORD PTR [si+2]
	sub	ax,152
	mov	WORD PTR _displx,ax
	add	ax,319
	mov	WORD PTR _disprx,ax
; Line 854
	call	_swflush
; Line 855
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_initplyr	ENDP
; Line 866
	PUBLIC	_initpln
_initpln	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = x
;	height = -2
;	minx = -4
;	maxx = -6
;	n = -8
;	obp = 4
; Line 871
	cmp	WORD PTR [bp+4],0	;obp
	jne	$I541
; Line 872
	call	_allocobj
	mov	si,ax
; Line 873
	jmp	SHORT $I542
$I541:
; Line 874
	mov	si,WORD PTR [bp+4]	;obp
$I542:
; Line 876
	mov	ax,WORD PTR _playmode
	or	ax,ax
	je	$SC547
	dec	ax
	je	$SC548
	dec	ax
	je	$SC549
	dec	ax
	je	$SC548
	dec	ax
	jne	$SB544
; Line 877
$SC547:
; Line 879
	mov	bx,WORD PTR [si+56]
	shl	bx,1
	mov	ax,WORD PTR $S530_inits[bx]
$L20039:
	mov	WORD PTR [bp-8],ax	;n
; Line 880
$SB544:
; Line 890
	mov	WORD PTR [si+96],1
; Line 893
	mov	bx,WORD PTR [bp-8]	;n
	shl	bx,1
	add	bx,WORD PTR _currgame
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [si+2],ax
; Line 894
	add	ax,20
	mov	WORD PTR [bp-6],ax	;maxx
; Line 895
	mov	WORD PTR [bp-2],0	;height
; Line 896
	mov	di,WORD PTR [si+2]
	jmp	SHORT $F550
; Line 881
	nop	
$SC548:
; Line 883
	mov	bx,WORD PTR [si+56]
	shl	bx,1
	mov	ax,WORD PTR $S532_initm[bx]
	jmp	SHORT $L20039
; Line 885
	nop	
$SC549:
; Line 886
	mov	bx,WORD PTR [si+56]
	shl	bx,1
	mov	ax,WORD PTR $S531_initc[bx]
	jmp	SHORT $L20039
	nop	
$FC551:
	inc	di
$F550:
	cmp	WORD PTR [bp-6],di	;maxx
	jl	$FB552
; Line 897
	mov	al,BYTE PTR _ground[di]
	sub	ah,ah
	cmp	ax,WORD PTR [bp-2]	;height
	jle	$FC551
; Line 898
	mov	WORD PTR [bp-2],ax	;height
; Line 899
	jmp	SHORT $FC551
$FB552:
	mov	ax,WORD PTR [bp-2]	;height
	add	ax,13
	mov	WORD PTR [si+4],ax
; Line 902
	sub	ax,ax
	mov	WORD PTR [si+116],ax
	mov	WORD PTR [si+108],ax
	mov	WORD PTR [si+80],ax
	mov	WORD PTR [si+26],ax
	mov	WORD PTR [si+16],ax
	mov	WORD PTR [si+18],ax
	mov	WORD PTR [si+14],ax
	mov	WORD PTR [si+46],ax
; Line 903
	mov	WORD PTR [si+44],ax
	push	ax
	push	ax
	push	si
	call	_setdxdy
	add	sp,6
; Line 905
	mov	bx,WORD PTR [bp-8]	;n
	shl	bx,1
	add	bx,WORD PTR _currgame
	mov	ax,WORD PTR [bx+16]
	mov	WORD PTR [si+12],ax
	cmp	ax,1
	cmc	
	sbb	ax,ax
	and	ax,8
	mov	WORD PTR [si+10],ax
; Line 906
	sub	ax,ax
	mov	WORD PTR [si+106],ax
	mov	WORD PTR [si+20],ax
	mov	WORD PTR [si+110],ax
; Line 907
	mov	WORD PTR [si+82],ax
	mov	WORD PTR [si+114],ax
	mov	WORD PTR [si+38],ax
; Line 909
	mov	ax,16
	mov	WORD PTR [si+34],ax
	mov	WORD PTR [si+36],ax
; Line 910
	mov	WORD PTR [si+100],1
; Line 912
	cmp	WORD PTR [bp+4],0	;obp
	je	$I556
	cmp	WORD PTR [si],4
	je	$I556
	cmp	WORD PTR [si],93
	jne	$I555
$I556:
; Line 913
	mov	WORD PTR [si+24],200
; Line 915
	mov	ax,5
	mov	WORD PTR [si+40],ax
	mov	WORD PTR [si+104],ax
; Line 916
	mov	WORD PTR [si+112],ax
; Line 917
	mov	WORD PTR [si+30],9000
; Line 918
; Line 919
$I555:
	cmp	WORD PTR [bp+4],0	;obp
	jne	$I557
; Line 921
	mov	bx,WORD PTR [si+56]
	shl	bx,1
	mov	WORD PTR _endsts[bx],0
	mov	bx,WORD PTR [si+56]
	shl	bx,1
	mov	ax,WORD PTR _endsts[bx]
	mov	WORD PTR [si+76],ax
	mov	WORD PTR [si+28],ax
	mov	WORD PTR [si+22],ax
; Line 922
	mov	bx,WORD PTR [si+56]
	shl	bx,1
	mov	WORD PTR _compnear[bx],0
; Line 923
	mov	ax,OFFSET _topobj
	push	ax
	jmp	SHORT $L20040
$I557:
; Line 925
	push	si
	call	_deletex
	add	sp,2
; Line 926
	push	WORD PTR [si+72]
$L20040:
	push	si
	call	_insertx
	add	sp,4
; Line 927
; Line 930
	cmp	WORD PTR _playmode,1
	je	$I561
	cmp	WORD PTR _playmode,3
	jne	$I560
$I561:
	mov	ax,WORD PTR _maxcrash
	cmp	WORD PTR [si+76],ax
	jl	$I560
; Line 931
	mov	WORD PTR [si],92
; Line 932
	mov	ax,WORD PTR _player
	cmp	WORD PTR [si+56],ax
	jne	$I563
; Line 933
	mov	WORD PTR $S236_ghost,1
; Line 934
	jmp	SHORT $I563
	nop	
$I560:
; Line 935
	mov	WORD PTR [si],1
$I563:
; Line 937
	mov	ax,si
; Line 938
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_initpln	ENDP
; Line 943
	PUBLIC	_initshot
_initshot	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__aNchkstk
	push	di
	push	si
;	x = -8
;	y = -10
;	register si = ob
;	register di = obo
;	nangle = -6
;	nspeed = -16
;	dx = -12
;	dy = -14
;	r = -2
;	bspeed = -4
;	targ = 6
;	obop = 4
; Line 949
	cmp	WORD PTR [bp+6],0	;targ
	jne	$I578
	cmp	WORD PTR _compplane,0
	jne	$I578
	cmp	WORD PTR [di+24],0
	jne	$JCC3266
	jmp	$EX567
$JCC3266:
; Line 952
$I578:
	call	_allocobj
	mov	si,ax
	or	si,si
	jne	$JCC3278
	jmp	$EX567
$JCC3278:
; Line 955
	mov	di,WORD PTR [bp+4]	;obop
; Line 956
	cmp	WORD PTR _playmode,4
	je	$I580
; Line 957
	dec	WORD PTR [di+24]
; Line 959
$I580:
	mov	ax,WORD PTR _gamenum
	add	ax,10
	mov	WORD PTR [bp-4],ax	;bspeed
; Line 961
	cmp	WORD PTR [bp+6],0	;targ
	je	$I581
; Line 962
	mov	bx,WORD PTR [bp+6]	;targ
	mov	ax,WORD PTR [bx+6]
	shl	ax,1
	shl	ax,1
	add	ax,WORD PTR [bx+2]
; Line 963
	mov	cx,WORD PTR [bx+8]
	shl	cx,1
	shl	cx,1
	add	cx,WORD PTR [bx+4]
; Line 964
	mov	dx,ax
	sub	ax,WORD PTR [di+2]
	mov	WORD PTR [bp-12],ax	;dx
; Line 965
	mov	ax,cx
	sub	cx,WORD PTR [di+4]
	mov	WORD PTR [bp-14],cx	;dy
; Line 966
	push	WORD PTR [di+4]
	push	WORD PTR [di+2]
	push	ax
	push	dx
	call	isrange
	add	sp,8
	mov	WORD PTR [bp-2],ax	;r
	cmp	ax,1
	jge	$I583
; Line 967
	push	si
	call	_deallobj
	add	sp,2
; Line 968
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 969
; Line 970
	nop	
$I583:
	mov	ax,WORD PTR [bp-4]	;bspeed
	imul	WORD PTR [bp-12]	;dx
	cwd	
	idiv	WORD PTR [bp-2]	;r
	mov	WORD PTR [si+6],ax
; Line 971
	mov	ax,WORD PTR [bp-4]	;bspeed
	imul	WORD PTR [bp-14]	;dy
	cwd	
	idiv	WORD PTR [bp-2]	;r
	mov	WORD PTR [si+8],ax
; Line 972
	sub	ax,ax
	mov	WORD PTR [si+50],ax
	mov	WORD PTR [si+48],ax
; Line 973
	jmp	SHORT $I585
$I581:
; Line 974
	mov	ax,WORD PTR [di+14]
	add	ax,WORD PTR [bp-4]	;bspeed
; Line 975
	mov	cx,WORD PTR [di+10]
; Line 977
	mov	dx,ax
	mov	ax,cx
	mov	bx,16
	mov	cx,dx
	cwd	
	idiv	bx
	mov	bx,dx
	shl	bx,1
	mov	ax,WORD PTR _sintab[bx]
	imul	cx
	push	ax
	mov	ax,WORD PTR [di+10]
	add	ax,4
	mov	dx,16
	mov	bx,dx
	cwd	
	idiv	bx
	mov	bx,dx
	shl	bx,1
	mov	ax,WORD PTR _sintab[bx]
	imul	cx
	push	ax
	push	si
	call	_setdxdy
	add	sp,6
; Line 978
$I585:
; Line 980
	mov	WORD PTR [si+96],3
; Line 981
	mov	ax,WORD PTR [di+2]
	add	ax,8
	mov	WORD PTR [si+2],ax
; Line 982
	mov	ax,WORD PTR [di+4]
	sub	ax,8
	mov	WORD PTR [si+4],ax
; Line 983
	mov	ax,WORD PTR [di+44]
	mov	WORD PTR [si+44],ax
; Line 984
	mov	ax,WORD PTR [di+46]
	mov	WORD PTR [si+46],ax
; Line 987
	mov	WORD PTR [si+30],10
; Line 988
	mov	WORD PTR [si+32],di
; Line 989
	mov	ax,WORD PTR [di+42]
	mov	WORD PTR [si+42],ax
; Line 990
	mov	ax,1
	mov	WORD PTR [si+36],ax
	mov	WORD PTR [si+34],ax
; Line 991
	mov	WORD PTR [si+68],0
; Line 992
	mov	WORD PTR [si+70],OFFSET _moveshot
; Line 993
	mov	WORD PTR [si+14],0
; Line 995
	push	di
	push	si
	call	_insertx
	add	sp,4
; Line 997
$EX567:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_initshot	ENDP
; Line 1004
isrange	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	di
	push	si
;	register si = dx
;	register di = dy
;	t = -2
;	ay = 10
;	ax = 8
;	y = 6
;	x = 4
; Line 1009
	mov	ax,WORD PTR [bp+6]	;y
	sub	ax,WORD PTR [bp+10]	;ay
	push	ax
	call	_abs
	add	sp,2
	mov	di,ax
	sar	ax,1
	add	di,ax
; Line 1010
	mov	ax,WORD PTR [bp+4]	;x
	sub	ax,WORD PTR [bp+8]	;ax
	push	ax
	call	_abs
	add	sp,2
	mov	si,ax
	cmp	si,100
	jg	$I596
	cmp	di,100
	jle	$I595
$I596:
; Line 1011
	mov	ax,-1
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 1013
$I595:
	cmp	di,si
	jle	$I597
; Line 1014
	mov	WORD PTR [bp-2],si	;t
; Line 1015
	mov	si,di
; Line 1016
	mov	di,WORD PTR [bp-2]	;t
; Line 1017
; Line 1019
$I597:
	mov	ax,si
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,cx
	mov	cx,di
	shl	cx,1
	shl	cx,1
	add	ax,cx
	mov	cl,3
	sar	ax,cl
; Line 1020
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

isrange	ENDP
; Line 1025
	PUBLIC	_initbomb
_initbomb	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = obo
;	angle = -2
;	obop = 4
; Line 1030
	mov	di,WORD PTR [bp+4]	;obop
; Line 1031
	cmp	WORD PTR _compplane,0
	jne	$I606
	cmp	WORD PTR [di+40],0
	jne	$JCC3705
	jmp	$EX600
$JCC3705:
$I606:
	cmp	WORD PTR [di+80],0
	je	$JCC3714
	jmp	$EX600
$JCC3714:
; Line 1033
	call	_allocobj
	mov	si,ax
	or	si,si
	jne	$JCC3726
	jmp	$EX600
$JCC3726:
; Line 1036
	cmp	WORD PTR _playmode,4
	je	$I608
; Line 1037
	dec	WORD PTR [di+40]
; Line 1039
$I608:
	mov	WORD PTR [di+80],10
; Line 1041
	mov	WORD PTR [si+96],2
; Line 1042
	mov	WORD PTR [si],5
; Line 1043
	mov	ax,WORD PTR [di+6]
	mov	WORD PTR [si+6],ax
; Line 1044
	mov	ax,WORD PTR [di+8]
	mov	WORD PTR [si+8],ax
; Line 1046
	cmp	WORD PTR [di+12],0
	je	$I609
; Line 1047
	mov	ax,WORD PTR [di+10]
	add	ax,4
	jmp	SHORT $L20041
	nop	
$I609:
; Line 1049
	mov	ax,WORD PTR [di+10]
	add	ax,12
$L20041:
	mov	cx,16
	cwd	
	idiv	cx
	mov	WORD PTR [bp-2],dx	;angle
; Line 1050
	mov	ax,dx
	add	ax,4
	cwd	
	idiv	cx
	mov	bx,dx
	shl	bx,1
	mov	ax,WORD PTR _sintab[bx]
	mov	dx,ax
	shl	ax,1
	shl	ax,1
	add	ax,dx
	shl	ax,1
	mov	al,ah
	cbw	
	add	ax,WORD PTR [di+2]
	add	ax,4
	mov	WORD PTR [si+2],ax
; Line 1051
	mov	ax,WORD PTR [bp-2]	;angle
	cwd	
	idiv	cx
	mov	bx,dx
	shl	bx,1
	mov	ax,WORD PTR _sintab[bx]
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	mov	al,ah
	cbw	
	add	ax,WORD PTR [di+4]
	sub	ax,4
	mov	WORD PTR [si+4],ax
; Line 1052
	sub	ax,ax
	mov	WORD PTR [si+50],ax
	mov	WORD PTR [si+48],ax
	mov	WORD PTR [si+46],ax
	mov	WORD PTR [si+44],ax
; Line 1054
	mov	WORD PTR [si+30],5
; Line 1055
	mov	WORD PTR [si+32],di
; Line 1056
	mov	ax,WORD PTR [di+42]
	mov	WORD PTR [si+42],ax
; Line 1057
	mov	ax,8
	mov	WORD PTR [si+36],ax
	mov	WORD PTR [si+34],ax
; Line 1058
	mov	WORD PTR [si+68],OFFSET _dispbomb
; Line 1059
	mov	WORD PTR [si+70],OFFSET _movebomb
; Line 1061
	push	di
	push	si
	call	_insertx
	add	sp,4
; Line 1063
$EX600:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_initbomb	ENDP
; Line 1068
	PUBLIC	_initmiss
_initmiss	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = obo
;	angle = -2
;	nspeed = -4
;	obop = 4
; Line 1074
	mov	di,WORD PTR [bp+4]	;obop
	cmp	WORD PTR [di+108],0
	je	$JCC3950
	jmp	$EX613
$JCC3950:
	cmp	WORD PTR [di+104],0
	jne	$JCC3959
	jmp	$EX613
$JCC3959:
	cmp	WORD PTR _missok,0
	jne	$JCC3969
	jmp	$EX613
$JCC3969:
; Line 1076
	call	_allocobj
	mov	si,ax
	or	si,si
	jne	$JCC3981
	jmp	$EX613
$JCC3981:
; Line 1079
	cmp	WORD PTR _playmode,4
	je	$I621
; Line 1080
	dec	WORD PTR [di+104]
; Line 1082
$I621:
	mov	WORD PTR [di+108],5
; Line 1084
	mov	WORD PTR [si+96],10
; Line 1085
	mov	WORD PTR [si],1
; Line 1087
	mov	ax,WORD PTR [di+10]
	mov	WORD PTR [si+10],ax
	mov	WORD PTR [bp-2],ax	;angle
; Line 1088
	add	ax,4
	mov	cx,16
	cwd	
	idiv	cx
	mov	bx,dx
	shl	bx,1
	mov	ax,WORD PTR _sintab[bx]
	mov	cl,4
	sar	ax,cl
	add	ax,WORD PTR [di+2]
	add	ax,4
	mov	WORD PTR [si+2],ax
; Line 1089
	mov	ax,WORD PTR [bp-2]	;angle
	mov	dx,16
	mov	bx,dx
	cwd	
	idiv	bx
	mov	bx,dx
	shl	bx,1
	mov	ax,WORD PTR _sintab[bx]
	sar	ax,cl
	add	ax,WORD PTR [di+4]
	sub	ax,4
	mov	WORD PTR [si+4],ax
; Line 1090
	sub	ax,ax
	mov	WORD PTR [si+46],ax
	mov	WORD PTR [si+44],ax
; Line 1091
	mov	ax,WORD PTR _gmaxspeed
	sar	ax,1
	add	ax,WORD PTR _gmaxspeed
	mov	WORD PTR [bp-4],ax	;nspeed
	mov	WORD PTR [si+14],ax
; Line 1092
	mov	ax,WORD PTR _sintab[bx]
	imul	WORD PTR [bp-4]	;nspeed
	push	ax
	mov	ax,WORD PTR [bp-2]	;angle
	add	ax,4
	mov	cx,16
	cwd	
	idiv	cx
	mov	bx,dx
	shl	bx,1
	mov	ax,WORD PTR _sintab[bx]
	imul	WORD PTR [bp-4]	;nspeed
	push	ax
	push	si
	call	_setdxdy
	add	sp,6
; Line 1094
	mov	WORD PTR [si+30],50
; Line 1095
	mov	WORD PTR [si+32],di
; Line 1096
	mov	ax,WORD PTR [di+42]
	mov	WORD PTR [si+42],ax
; Line 1097
	mov	ax,8
	mov	WORD PTR [si+36],ax
	mov	WORD PTR [si+34],ax
; Line 1098
	mov	WORD PTR [si+68],OFFSET _dispmiss
; Line 1099
	mov	WORD PTR [si+70],OFFSET _movemiss
; Line 1100
	mov	ax,WORD PTR [di+106]
	mov	WORD PTR [si+110],ax
; Line 1101
	sub	ax,ax
	mov	WORD PTR [si+18],ax
	mov	WORD PTR [si+16],ax
	mov	WORD PTR [si+12],ax
; Line 1103
	push	di
	push	si
	call	_insertx
	add	sp,4
; Line 1105
$EX613:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_initmiss	ENDP
; Line 1110
	PUBLIC	_initburst
_initburst	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = obo
;	angle = -2
;	obop = 4
; Line 1116
	mov	di,WORD PTR [bp+4]	;obop
	cmp	WORD PTR [di+116],0
	je	$JCC4224
	jmp	$EX624
$JCC4224:
	cmp	WORD PTR [di+112],0
	jne	$JCC4233
	jmp	$EX624
$JCC4233:
	cmp	WORD PTR _missok,0
	jne	$JCC4243
	jmp	$EX624
$JCC4243:
; Line 1118
	call	_allocobj
	mov	si,ax
	or	si,si
	jne	$JCC4255
	jmp	$EX624
$JCC4255:
; Line 1121
	mov	WORD PTR [si+116],5
; Line 1123
	cmp	WORD PTR _playmode,4
	je	$I631
; Line 1124
	dec	WORD PTR [di+112]
; Line 1126
$I631:
	mov	WORD PTR [si+96],11
; Line 1127
	mov	WORD PTR [si],5
; Line 1129
	cmp	WORD PTR [di+12],0
	je	$I632
; Line 1130
	mov	ax,WORD PTR [di+10]
	add	ax,6
	jmp	SHORT $L20042
$I632:
; Line 1132
	mov	ax,WORD PTR [di+10]
	add	ax,10
$L20042:
	mov	cx,16
	cwd	
	idiv	cx
	mov	WORD PTR [bp-2],dx	;angle
; Line 1133
	mov	ax,dx
	cwd	
	idiv	cx
	mov	bx,dx
	shl	bx,1
	mov	ax,WORD PTR _sintab[bx]
	imul	WORD PTR _gminspeed
	push	ax
	mov	ax,WORD PTR [bp-2]	;angle
	add	ax,4
	cwd	
	idiv	cx
	mov	ax,bx
	mov	bx,dx
	shl	bx,1
	mov	cx,ax
	mov	ax,WORD PTR _sintab[bx]
	imul	WORD PTR _gminspeed
	push	ax
	push	si
	mov	WORD PTR [bp-4],cx
	mov	WORD PTR [bp-6],bx
	call	_setdxdy
	add	sp,6
; Line 1134
	mov	ax,WORD PTR [di+6]
	add	WORD PTR [si+6],ax
; Line 1135
	mov	ax,WORD PTR [di+8]
	add	WORD PTR [si+8],ax
; Line 1137
	mov	bx,WORD PTR [bp-6]
	mov	ax,WORD PTR _sintab[bx]
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	mov	al,ah
	cbw	
	sar	ax,1
	sar	ax,1
	add	ax,WORD PTR [di+2]
	add	ax,4
	mov	WORD PTR [si+2],ax
; Line 1138
	mov	bx,WORD PTR [bp-4]
	mov	ax,WORD PTR _sintab[bx]
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	mov	al,ah
	cbw	
	sar	ax,1
	sar	ax,1
	add	ax,WORD PTR [di+4]
	sub	ax,4
	mov	WORD PTR [si+4],ax
; Line 1139
	sub	ax,ax
	mov	WORD PTR [si+46],ax
	mov	WORD PTR [si+44],ax
; Line 1141
	mov	WORD PTR [si+30],20
; Line 1142
	mov	WORD PTR [si+32],di
; Line 1143
	mov	ax,WORD PTR [di+42]
	mov	WORD PTR [si+42],ax
; Line 1144
	mov	ax,8
	mov	WORD PTR [si+36],ax
	mov	WORD PTR [si+34],ax
; Line 1145
	mov	WORD PTR [si+68],OFFSET _dispburst
; Line 1146
	mov	WORD PTR [si+70],OFFSET _moveburst
; Line 1148
	push	di
	push	si
	call	_insertx
	add	sp,4
; Line 1150
$EX624:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_initburst	ENDP
; Line 1155
inittarg	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
	push	di
	push	si
;	minh = -8
;	maxh = -14
;	aveh = -2
;	minx = -6
;	maxx = -12
;	register si = ob
;	register di = x
;	i = -16
;	tx = -10
;	tt = -4
; Line 1161
	mov	ax,WORD PTR _currgame
	add	ax,38
	mov	WORD PTR [bp-10],ax	;tx
; Line 1162
	mov	ax,WORD PTR _currgame
	add	ax,78
	mov	WORD PTR [bp-4],ax	;tt
; Line 1165
	cmp	WORD PTR _playmode,1
	je	$I647
	cmp	WORD PTR _playmode,3
	jne	$I646
$I647:
	mov	bx,WORD PTR _multbuff
	cmp	WORD PTR [bx],1
	jne	$I645
$I646:
; Line 1166
	mov	WORD PTR _numtarg,0
; Line 1167
	mov	WORD PTR _numtarg+2,17
; Line 1168
	jmp	SHORT $I648
$I645:
; Line 1169
	mov	ax,10
	mov	WORD PTR _numtarg+2,ax
	mov	WORD PTR _numtarg,ax
$I648:
; Line 1171
	mov	WORD PTR [bp-16],0	;i
	jmp	$F649
	nop	
$FC653:
; Line 1178
	mov	al,BYTE PTR _ground[di]
	sub	ah,ah
	cmp	ax,WORD PTR [bp-14]	;maxh
	jle	$I655
; Line 1179
	mov	WORD PTR [bp-14],ax	;maxh
; Line 1180
$I655:
	mov	al,BYTE PTR _ground[di]
	sub	ah,ah
	cmp	ax,WORD PTR [bp-8]	;minh
	jge	$L20043
; Line 1181
	mov	WORD PTR [bp-8],ax	;minh
; Line 1182
$L20043:
	inc	di
$F652:
	cmp	WORD PTR [bp-12],di	;maxx
	jge	$FC653
; Line 1183
	mov	ax,WORD PTR [bp-14]	;maxh
	add	ax,WORD PTR [bp-8]	;minh
	sar	ax,1
	mov	WORD PTR [bp-2],ax	;aveh
; Line 1185
	jmp	SHORT $L20044
	nop	
$FC658:
; Line 1186
	dec	WORD PTR [bp-2]	;aveh
$L20044:
	mov	ax,WORD PTR [bp-2]	;aveh
	add	ax,16
	mov	WORD PTR [si+4],ax
	cmp	ax,200
	jge	$FC658
; Line 1188
	mov	di,WORD PTR [bp-6]	;minx
	jmp	SHORT $F660
$FC661:
; Line 1189
	mov	al,BYTE PTR [bp-2]	;aveh
	mov	BYTE PTR _ground[di],al
	inc	di
$F660:
	cmp	WORD PTR [bp-12],di	;maxx
	jge	$FC661
; Line 1192
	sub	ax,ax
	mov	WORD PTR [si+26],ax
	mov	WORD PTR [si+10],ax
	mov	WORD PTR [si+50],ax
	mov	WORD PTR [si+48],ax
	mov	WORD PTR [si+46],ax
	mov	WORD PTR [si+44],ax
	mov	WORD PTR [si+8],ax
	mov	WORD PTR [si+6],ax
; Line 1193
	mov	WORD PTR [si+96],4
; Line 1194
	mov	WORD PTR [si],6
; Line 1195
	mov	bx,WORD PTR [bp-4]	;tt
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [si+12],ax
; Line 1196
	mov	ax,WORD PTR [bp-16]	;i
	mov	WORD PTR [si+30],ax
; Line 1199
	cmp	WORD PTR _playmode,1
	je	$I665
	cmp	WORD PTR _playmode,3
	jne	$I664
$I665:
	mov	bx,WORD PTR _multbuff
	cmp	WORD PTR [bx],1
	jne	$I663
$I664:
; Line 1202
	cmp	WORD PTR [bp-16],10	;i
	jge	$L20017
	cmp	WORD PTR [bp-16],6	;i
	jle	$L20017
	mov	WORD PTR [bp-18],0
	jmp	SHORT $L20018
$L20017:
	mov	WORD PTR [bp-18],1
$L20018:
	mov	ax,118
	imul	WORD PTR [bp-18]
	jmp	SHORT $L20046
	nop	
$I663:
; Line 1204
	cmp	WORD PTR [bp-16],10	;i
	jl	$L20019
	mov	ax,1
	jmp	SHORT $L20020
	nop	
$L20019:
	sub	ax,ax
$L20020:
	mov	cx,118
	imul	cx
$L20046:
	add	ax,WORD PTR _nobjects
	mov	WORD PTR [si+32],ax
; Line 1205
	mov	bx,ax
	mov	ax,WORD PTR [bx+42]
	mov	WORD PTR [si+42],ax
; Line 1206
	mov	ax,16
	mov	WORD PTR [si+36],ax
	mov	WORD PTR [si+34],ax
; Line 1207
	mov	WORD PTR [si+68],OFFSET _disptarg
; Line 1208
	mov	WORD PTR [si+70],OFFSET _movetarg
; Line 1210
	mov	ax,OFFSET _topobj
	push	ax
	push	si
	call	_insertx
	add	sp,4
; Line 1211
	inc	WORD PTR [bp-16]	;i
	add	WORD PTR [bp-10],2	;tx
	add	WORD PTR [bp-4],2	;tt
$F649:
	cmp	WORD PTR [bp-16],20	;i
	jge	$FB651
; Line 1172
	call	_allocobj
	mov	si,ax
	mov	bx,WORD PTR [bp-16]	;i
	shl	bx,1
	mov	WORD PTR _targets[bx],si
; Line 1173
	mov	bx,WORD PTR [bp-10]	;tx
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [si+2],ax
	mov	WORD PTR [bp-6],ax	;minx
; Line 1174
	mov	cx,ax
	add	ax,15
	mov	WORD PTR [bp-12],ax	;maxx
; Line 1175
	mov	WORD PTR [bp-8],999	;minh
; Line 1176
	mov	WORD PTR [bp-14],0	;maxh
; Line 1177
	mov	di,cx
	jmp	$F652
	nop	
$FB651:
; Line 1212
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

inittarg	ENDP
; Line 1217
	PUBLIC	_initexpl
_initexpl	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = obo
;	i = -18
;	ic = -22
;	life = -2
;	speed = -8
;	obox = -14
;	oboy = -16
;	obodx = -20
;	obody = -24
;	oboclr = -6
;	obotype = -10
;	mansym = -12
;	orient = -4
;	small = 6
;	obop = 4
; Line 1228
	mov	di,WORD PTR [bp+4]	;obop
	mov	ax,WORD PTR [di+36]
	sar	ax,1
	add	ax,WORD PTR [di+2]
	mov	WORD PTR [bp-14],ax	;obox
; Line 1229
	mov	ax,WORD PTR [di+34]
	sar	ax,1
	add	ax,WORD PTR [di+4]
	mov	WORD PTR [bp-16],ax	;oboy
; Line 1230
	mov	ax,WORD PTR [di+6]
	sar	ax,1
	sar	ax,1
	mov	WORD PTR [bp-20],ax	;obodx
; Line 1231
	mov	ax,WORD PTR [di+8]
	sar	ax,1
	sar	ax,1
	mov	WORD PTR [bp-24],ax	;obody
; Line 1232
	mov	ax,WORD PTR [di+42]
	mov	WORD PTR [bp-6],ax	;oboclr
; Line 1235
	mov	ax,WORD PTR [di+96]
	mov	WORD PTR [bp-10],ax	;obotype
	cmp	ax,4
	jne	$I685
	cmp	WORD PTR [di+12],2
	jne	$I685
; Line 1236
	mov	WORD PTR [bp-22],1	;ic
; Line 1237
	mov	ax,WORD PTR _gminspeed
	jmp	SHORT $L20047
	nop	
$I685:
; Line 1239
	cmp	WORD PTR [bp+6],1	;small
	sbb	ax,ax
	and	al,252
	add	ax,6
	mov	WORD PTR [bp-22],ax	;ic
; Line 1240
	mov	al,BYTE PTR _explseed
	and	al,7
	cmp	al,7
	je	$L20023
	mov	cl,1
	jmp	SHORT $L20024
	nop	
$L20023:
	sub	cl,cl
$L20024:
	mov	ax,WORD PTR _gminspeed
	sar	ax,cl
$L20047:
	mov	WORD PTR [bp-8],ax	;speed
; Line 1241
; Line 1243
	cmp	WORD PTR [bp-10],1	;obotype
	jne	$L20025
	cmp	WORD PTR [di],1
	je	$L20027
	cmp	WORD PTR [di],9
	jne	$L20025
$L20027:
	mov	WORD PTR [bp-12],1	;mansym
	jmp	SHORT $L20026
	nop	
$L20025:
	mov	WORD PTR [bp-12],0	;mansym
$L20026:
; Line 1245
	mov	WORD PTR [bp-18],1	;i
$FC688:
; Line 1246
	call	_allocobj
	mov	si,ax
	or	si,si
	jne	$JCC5081
	jmp	$EX670
$JCC5081:
; Line 1249
	mov	WORD PTR [si+96],5
; Line 1251
	mov	ax,WORD PTR [bp-18]	;i
	mov	cx,16
	cwd	
	idiv	cx
	mov	bx,dx
	shl	bx,1
	mov	ax,WORD PTR _sintab[bx]
	imul	WORD PTR [bp-8]	;speed
	push	ax
	mov	ax,WORD PTR [bp-18]	;i
	add	ax,4
	cwd	
	idiv	cx
	mov	bx,dx
	shl	bx,1
	mov	ax,WORD PTR _sintab[bx]
	imul	WORD PTR [bp-8]	;speed
	push	ax
	push	si
	call	_setdxdy
	add	sp,6
; Line 1252
	mov	ax,WORD PTR [bp-20]	;obodx
	add	WORD PTR [si+6],ax
; Line 1253
	mov	ax,WORD PTR [bp-24]	;obody
	add	WORD PTR [si+8],ax
; Line 1257
	mov	ax,WORD PTR [si+6]
	add	ax,WORD PTR [bp-14]	;obox
	mov	WORD PTR [si+2],ax
	mov	ax,WORD PTR [si+8]
	add	ax,WORD PTR [bp-16]	;oboy
	mov	WORD PTR [si+4],ax
	mov	ax,WORD PTR [si+2]
	imul	WORD PTR [si+4]
	mul	WORD PTR _explseed
	add	ax,7491
	mov	WORD PTR _explseed,ax
	or	ax,ax
	jne	$I691
; Line 1258
	mov	WORD PTR _explseed,10129
; Line 1260
$I691:
	mov	WORD PTR [si+30],3
; Line 1261
	mov	cl,6
	mov	ax,WORD PTR _explseed
	and	ax,448
	shr	ax,cl
	mov	WORD PTR [si+12],ax
	mov	WORD PTR [bp-4],ax	;orient
; Line 1262
	cmp	WORD PTR [bp-12],0	;mansym
	je	$I692
	or	ax,ax
	je	$I693
	cmp	ax,7
	jne	$I692
$I693:
; Line 1263
	sub	ax,ax
	mov	WORD PTR [si+12],ax
	mov	WORD PTR [bp-4],ax	;orient
	mov	WORD PTR [bp-12],ax	;mansym
; Line 1264
	mov	ax,WORD PTR [bp-20]	;obodx
	mov	WORD PTR [si+6],ax
; Line 1265
	mov	ax,WORD PTR _gminspeed
	neg	ax
	mov	WORD PTR [si+8],ax
; Line 1266
; Line 1268
$I692:
	sub	ax,ax
	mov	WORD PTR [si+14],ax
	mov	WORD PTR [si+26],ax
	mov	WORD PTR [si+46],ax
	mov	WORD PTR [si+44],ax
; Line 1269
	mov	WORD PTR [si+32],di
; Line 1270
	mov	ax,WORD PTR [bp-6]	;oboclr
	mov	WORD PTR [si+42],ax
; Line 1271
	mov	ax,8
	mov	WORD PTR [si+36],ax
	mov	WORD PTR [si+34],ax
; Line 1272
	mov	WORD PTR [si+68],OFFSET _dispexpl
; Line 1273
	mov	WORD PTR [si+70],OFFSET _moveexpl
; Line 1275
	cmp	WORD PTR [bp-4],0	;orient
	je	$I694
; Line 1276
	mov	ax,10
	push	ax
	push	si
	call	_initsound
	add	sp,4
; Line 1278
$I694:
	push	di
	push	si
	call	_insertx
	add	sp,4
; Line 1279
	mov	ax,WORD PTR [bp-22]	;ic
	add	WORD PTR [bp-18],ax	;i
	cmp	WORD PTR [bp-18],15	;i
	jg	$JCC5334
	jmp	$FC688
$JCC5334:
; Line 1280
$EX670:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_initexpl	ENDP
; Line 1285
	PUBLIC	_initsmok
_initsmok	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	si
;	register si = ob
;	register di = obo
;	obop = 4
; Line 1290
	call	_allocobj
	mov	si,ax
	or	si,si
	je	$EX698
; Line 1293
	mov	WORD PTR [si+96],6
; Line 1295
	mov	bx,WORD PTR [bp+4]	;obop
	mov	ax,WORD PTR [bx+2]
	add	ax,8
	mov	WORD PTR [si+2],ax
; Line 1296
	mov	ax,WORD PTR [bx+4]
	sub	ax,8
	mov	WORD PTR [si+4],ax
; Line 1297
	mov	ax,WORD PTR [bx+6]
	mov	WORD PTR [si+6],ax
; Line 1298
	mov	ax,WORD PTR [bx+8]
	mov	WORD PTR [si+8],ax
; Line 1299
	sub	ax,ax
	mov	WORD PTR [si+50],ax
	mov	WORD PTR [si+48],ax
	mov	WORD PTR [si+46],ax
	mov	WORD PTR [si+44],ax
; Line 1300
	mov	WORD PTR [si+30],10
; Line 1301
	mov	WORD PTR [si+32],bx
; Line 1302
	mov	ax,1
	mov	WORD PTR [si+36],ax
	mov	WORD PTR [si+34],ax
; Line 1303
	mov	WORD PTR [si+68],0
; Line 1304
	mov	WORD PTR [si+70],OFFSET _movesmok
; Line 1305
	mov	ax,WORD PTR [bx+42]
	mov	WORD PTR [si+42],ax
; Line 1306
$EX698:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_initsmok	ENDP
; Line 1318
	PUBLIC	_initflck
_initflck	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = i
;	j = -2
; Line 1322
	cmp	WORD PTR _playmode,4
	jne	$JCC5470
	jmp	$FB712
$JCC5470:
; Line 1325
	sub	di,di
	jmp	SHORT $F710
	nop	
$FC715:
	inc	WORD PTR [bp-2]	;j
$F714:
	cmp	WORD PTR [bp-2],1	;j
	jge	$FC711
; Line 1345
	mov	ax,1
	push	ax
	push	si
	call	_initbird
	add	sp,4
	jmp	SHORT $FC715
; Line 1346
$FC711:
	inc	di
$F710:
	cmp	di,4
	jge	$FB712
; Line 1327
	call	_allocobj
	mov	si,ax
	or	si,si
	je	$FB712
; Line 1330
	mov	WORD PTR [si+96],7
; Line 1331
	mov	WORD PTR [si],1
; Line 1332
	mov	bx,di
	shl	bx,1
	mov	ax,WORD PTR $S702_ifx[bx]
	mov	WORD PTR [si+2],ax
; Line 1333
	mov	ax,WORD PTR $S703_ify[bx]
	mov	WORD PTR [si+4],ax
; Line 1334
	mov	ax,WORD PTR $S704_ifdx[bx]
	mov	WORD PTR [si+6],ax
; Line 1335
	sub	ax,ax
	mov	WORD PTR [si+50],ax
	mov	WORD PTR [si+48],ax
	mov	WORD PTR [si+46],ax
	mov	WORD PTR [si+44],ax
; Line 1336
	mov	WORD PTR [si+8],ax
	mov	WORD PTR [si+12],ax
; Line 1337
	mov	WORD PTR [si+30],5
; Line 1338
	mov	WORD PTR [si+32],si
; Line 1339
	mov	ax,16
	mov	WORD PTR [si+36],ax
	mov	WORD PTR [si+34],ax
; Line 1340
	mov	WORD PTR [si+68],OFFSET _dispflck
; Line 1341
	mov	WORD PTR [si+70],OFFSET _moveflck
; Line 1342
	mov	WORD PTR [si+42],9
; Line 1343
	mov	ax,OFFSET _topobj
	push	ax
	push	si
	call	_insertx
	add	sp,4
; Line 1344
	mov	WORD PTR [bp-2],0	;j
	jmp	$F714
$FB712:
; Line 1347
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_initflck	ENDP
; Line 1352
	PUBLIC	_initbird
_initbird	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	si
;	register si = ob
;	register di = obo
;	i = 6
;	obop = 4
; Line 1362
	call	_allocobj
	mov	si,ax
	or	si,si
	je	$EX720
; Line 1365
	mov	WORD PTR [si+96],8
; Line 1367
	mov	bx,WORD PTR [bp+6]	;i
	shl	bx,1
	mov	ax,WORD PTR $S723_ibx[bx]
	mov	cx,bx
	mov	bx,WORD PTR [bp+4]	;obop
	add	ax,WORD PTR [bx+2]
	mov	WORD PTR [si+2],ax
; Line 1368
	mov	bx,cx
	mov	ax,WORD PTR $S724_iby[bx]
	mov	bx,WORD PTR [bp+4]	;obop
	sub	ax,WORD PTR [bx+4]
	neg	ax
	mov	WORD PTR [si+4],ax
; Line 1369
	mov	bx,cx
	mov	ax,WORD PTR $S725_ibdx[bx]
	mov	WORD PTR [si+6],ax
; Line 1370
	mov	ax,WORD PTR $S726_ibdy[bx]
	mov	WORD PTR [si+8],ax
; Line 1371
	sub	ax,ax
	mov	WORD PTR [si+50],ax
	mov	WORD PTR [si+48],ax
	mov	WORD PTR [si+46],ax
	mov	WORD PTR [si+44],ax
	mov	WORD PTR [si+12],ax
; Line 1372
	mov	WORD PTR [si+30],4
; Line 1373
	mov	ax,WORD PTR [bp+4]	;obop
	mov	WORD PTR [si+32],ax
; Line 1374
	mov	WORD PTR [si+34],2
; Line 1375
	mov	WORD PTR [si+36],4
; Line 1376
	mov	WORD PTR [si+68],OFFSET _dispbird
; Line 1377
	mov	WORD PTR [si+70],OFFSET _movebird
; Line 1378
	mov	bx,ax
	mov	cx,WORD PTR [bx+42]
	mov	WORD PTR [si+42],cx
; Line 1379
	push	ax
	push	si
	call	_insertx
	add	sp,4
; Line 1380
$EX720:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_initbird	ENDP
; Line 1385
	PUBLIC	_initoxen
_initoxen	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = i
; Line 1391
	cmp	WORD PTR _playmode,4
	jne	$I733
; Line 1392
	sub	di,di
	jmp	SHORT $F734
$FC735:
	inc	di
$F734:
	cmp	di,2
	jge	$EX728
; Line 1393
	mov	bx,di
	mov	WORD PTR _targets[bx+40][di],0
	jmp	SHORT $FC735
$I733:
	sub	di,di
$FC738:
; Line 1398
	call	_allocobj
	mov	si,ax
	mov	bx,di
	mov	WORD PTR _targets[bx+40][di],si
	or	si,si
	je	$EX728
; Line 1401
	mov	WORD PTR [si+96],9
; Line 1402
	mov	WORD PTR [si],6
; Line 1403
	shl	bx,1
	mov	ax,WORD PTR $S731_iox[bx]
	mov	WORD PTR [si+2],ax
; Line 1404
	mov	ax,WORD PTR $S732_ioy[bx]
	mov	WORD PTR [si+4],ax
; Line 1406
	sub	ax,ax
	mov	WORD PTR [si+8],ax
	mov	WORD PTR [si+6],ax
	mov	WORD PTR [si+50],ax
	mov	WORD PTR [si+48],ax
	mov	WORD PTR [si+46],ax
	mov	WORD PTR [si+44],ax
	mov	WORD PTR [si+12],ax
; Line 1407
	mov	WORD PTR [si+32],si
; Line 1409
	mov	ax,16
	mov	WORD PTR [si+34],ax
	mov	WORD PTR [si+36],ax
; Line 1410
	mov	WORD PTR [si+68],0
; Line 1411
	mov	WORD PTR [si+70],OFFSET _moveox
; Line 1412
	mov	WORD PTR [si+42],1
; Line 1413
	mov	ax,OFFSET _topobj
	push	ax
	push	si
	call	_insertx
	add	sp,4
; Line 1414
	inc	di
	cmp	di,2
	jl	$FC738
; Line 1415
$EX728:
	pop	si
	pop	di
	ret	

_initoxen	ENDP
_TEXT	ENDS
END
