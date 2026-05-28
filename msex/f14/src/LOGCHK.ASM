;	Static Name Aliases
;
	TITLE   C:\LOGCHK.C
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
EXTRN	_printf:NEAR
EXTRN	_exit:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_fclose:NEAR
EXTRN	_fopen:NEAR
EXTRN	_fread:NEAR
_BSS      SEGMENT
COMM NEAR	__logObject:	BYTE:	 32
COMM NEAR	_tfile:	BYTE:	 2
COMM NEAR	_outfile:	BYTE:	 2
COMM NEAR	_buf:	 1:	 15
COMM NEAR	_flstat:	BYTE:	 2
COMM NEAR	_i:	BYTE:	 2
_BSS      ENDS
_DATA      SEGMENT
$SG285	DB	'rb',  00H
$SG286	DB	'log.f14',  00H
$SG288	DB	0aH, 'Error:  Cannot find file log.f14',  0aH,  00H
$SG289	DB	'LOG Start',  0aH,  00H
$SG293	DB	' ',  0aH,  00H
$SG300	DB	'AIR MISSILE LAUNCH',  00H
$SG302	DB	'BOAT MISSILE LAUNCH',  00H
$SG304	DB	'GROUND MISSILE LAUNCH',  00H
$SG306	DB	'AIR CRUISE LAUNCH',  00H
$SG308	DB	'BOAT CRUISE LAUNCH',  00H
$SG310	DB	'GROUND CRUISE LAUNCH',  00H
$SG312	DB	'AIR MISSILE HIT',  00H
$SG314	DB	'BOAT MISSILE HIT',  00H
$SG316	DB	'GROUND MISSILE HIT',  00H
$SG318	DB	'AIR BULLET HIT',  00H
$SG320	DB	'BOAT BULLET HIT',  00H
$SG322	DB	'GROUND BULLET HIT',  00H
$SG324	DB	'AIR CRUISE HIT',  00H
$SG326	DB	'BOAT CRUISE HIT',  00H
$SG328	DB	'GROUND CRUISE HIT',  00H
$SG330	DB	'AIR DESTROYED MISSILE',  00H
$SG332	DB	'BOAT DESTROYED MISSILE',  00H
$SG334	DB	'GROUND DESTROYED MISSILE',  00H
$SG336	DB	'AIR DESTROYED BULLET',  00H
$SG338	DB	'BOAT DESTROYED BULLET',  00H
$SG340	DB	'GROUND DESTROYED BULLET',  00H
$SG342	DB	'AIR DESTROYED CRUISE',  00H
$SG344	DB	'BOAT DESTROYED CRUISE',  00H
$SG346	DB	'GROUND DESTROYED CRUISE',  00H
$SG348	DB	'AIR BOMB DROP',  00H
$SG350	DB	'AIR BOMB HIT',  00H
$SG352	DB	'BOAT BOMB HIT',  00H
$SG354	DB	'GROUND BOMB HIT',  00H
$SG356	DB	'AIR DESTORYED BOMB',  00H
$SG358	DB	'BOAT DESTORYED BOMB',  00H
$SG360	DB	'GROUND DESTORYED BOMB',  00H
$SG362	DB	'AIR TROOP DROP',  00H
$SG364	DB	'AIR TAKEOFF',  00H
$SG366	DB	'AIR LAND',  00H
$SG368	DB	'AIR CRASH',  00H
$SG370	DB	'AIR REFUEL',  00H
$SG372	DB	'CONFIG CHANGE',  00H
$SG374	DB	'BAD EJECTION',  00H
$SG376	DB	'GOOD EJECTION',  00H
$SG378	DB	'TRAINING NOW ON',  00H
$SG380	DB	'TRAINING NOW OFF',  00H
$SG382	DB	'AAA HIT',  00H
$SG384	DB	'AAA DESTROY',  00H
$SG386	DB	'WAY POINT GOAL',  00H
$SG388	DB	'REACHED MIN TIME ALOFT',  00H
$SG390	DB	'UNKNOWN',  00H
$SG391	DB	'%d: %d %d %s %d %ld %ld %ld %d Owner %d missile %d, time %d '
	DB	'%d',  0aH,  00H
$SG392	DB	'LOG END',  0aH,  00H
	ORG	$+1
_recsize	DW	020H
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
; Line 7
; Line 51
	PUBLIC	_main
_main	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,82
	call	__aNchkstk
;	s = -80
;	cnt = -82
; Line 53
	mov	WORD PTR [bp-82],0	;cnt
; Line 56
	mov	ax,OFFSET DGROUP:$SG285
	push	ax
	mov	ax,OFFSET DGROUP:$SG286
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR _outfile,ax
; Line 58
	or	ax,ax
	jne	$I287
; Line 59
	mov	ax,OFFSET DGROUP:$SG288
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
$I287:
	mov	ax,OFFSET DGROUP:$SG289
	push	ax
	call	_printf
	add	sp,2
; Line 65
	jmp	$L20003
$FC291:
; Line 67
	push	ax
	mov	ax,OFFSET DGROUP:$SG293
	push	ax
	call	_printf
	add	sp,4
; Line 68
	mov	ax,WORD PTR __logObject+20
	mov	dx,WORD PTR __logObject+22
	jmp	$S294
; Line 69
	nop	
$SC298:
; Line 70
	mov	ax,OFFSET DGROUP:$SG300
$L20002:
	push	ax
	lea	ax,WORD PTR [bp-80]	;s
	push	ax
	call	_strcpy
	add	sp,4
; Line 71
	jmp	$SB295
; Line 73
	nop	
$SC301:
; Line 74
	mov	ax,OFFSET DGROUP:$SG302
	jmp	SHORT $L20002
; Line 77
	nop	
$SC303:
; Line 78
	mov	ax,OFFSET DGROUP:$SG304
	jmp	SHORT $L20002
; Line 81
	nop	
$SC305:
; Line 82
	mov	ax,OFFSET DGROUP:$SG306
	jmp	SHORT $L20002
; Line 85
	nop	
$SC307:
; Line 86
	mov	ax,OFFSET DGROUP:$SG308
	jmp	SHORT $L20002
; Line 89
	nop	
$SC309:
; Line 90
	mov	ax,OFFSET DGROUP:$SG310
	jmp	SHORT $L20002
; Line 93
	nop	
$SC311:
; Line 94
	mov	ax,OFFSET DGROUP:$SG312
	jmp	SHORT $L20002
; Line 97
	nop	
$SC313:
; Line 98
	mov	ax,OFFSET DGROUP:$SG314
	jmp	SHORT $L20002
; Line 101
	nop	
$SC315:
; Line 102
	mov	ax,OFFSET DGROUP:$SG316
	jmp	SHORT $L20002
; Line 105
	nop	
$SC317:
; Line 106
	mov	ax,OFFSET DGROUP:$SG318
	jmp	SHORT $L20002
; Line 109
	nop	
$SC319:
; Line 110
	mov	ax,OFFSET DGROUP:$SG320
	jmp	SHORT $L20002
; Line 113
	nop	
$SC321:
; Line 114
	mov	ax,OFFSET DGROUP:$SG322
	jmp	SHORT $L20002
; Line 117
	nop	
$SC323:
; Line 118
	mov	ax,OFFSET DGROUP:$SG324
	jmp	SHORT $L20002
; Line 121
	nop	
$SC325:
; Line 122
	mov	ax,OFFSET DGROUP:$SG326
	jmp	SHORT $L20002
; Line 125
	nop	
$SC327:
; Line 126
	mov	ax,OFFSET DGROUP:$SG328
	jmp	SHORT $L20002
; Line 129
	nop	
$SC329:
; Line 130
	mov	ax,OFFSET DGROUP:$SG330
	jmp	SHORT $L20002
; Line 133
	nop	
$SC331:
; Line 134
	mov	ax,OFFSET DGROUP:$SG332
	jmp	SHORT $L20002
; Line 137
	nop	
$SC333:
; Line 138
	mov	ax,OFFSET DGROUP:$SG334
	jmp	SHORT $L20002
; Line 141
	nop	
$SC335:
; Line 142
	mov	ax,OFFSET DGROUP:$SG336
	jmp	SHORT $L20002
; Line 145
	nop	
$SC337:
; Line 146
	mov	ax,OFFSET DGROUP:$SG338
	jmp	$L20002
; Line 149
$SC339:
; Line 150
	mov	ax,OFFSET DGROUP:$SG340
	jmp	$L20002
; Line 153
$SC341:
; Line 154
	mov	ax,OFFSET DGROUP:$SG342
	jmp	$L20002
; Line 157
$SC343:
; Line 158
	mov	ax,OFFSET DGROUP:$SG344
	jmp	$L20002
; Line 161
$SC345:
; Line 162
	mov	ax,OFFSET DGROUP:$SG346
	jmp	$L20002
; Line 165
$SC347:
; Line 166
	mov	ax,OFFSET DGROUP:$SG348
	jmp	$L20002
; Line 169
$SC349:
; Line 170
	mov	ax,OFFSET DGROUP:$SG350
	jmp	$L20002
; Line 173
$SC351:
; Line 174
	mov	ax,OFFSET DGROUP:$SG352
	jmp	$L20002
; Line 177
$SC353:
; Line 178
	mov	ax,OFFSET DGROUP:$SG354
	jmp	$L20002
; Line 181
$SC355:
; Line 182
	mov	ax,OFFSET DGROUP:$SG356
	jmp	$L20002
; Line 185
$SC357:
; Line 186
	mov	ax,OFFSET DGROUP:$SG358
	jmp	$L20002
; Line 189
$SC359:
; Line 190
	mov	ax,OFFSET DGROUP:$SG360
	jmp	$L20002
; Line 193
$SC361:
; Line 194
	mov	ax,OFFSET DGROUP:$SG362
	jmp	$L20002
; Line 197
$SC363:
; Line 198
	mov	ax,OFFSET DGROUP:$SG364
	jmp	$L20002
; Line 201
$SC365:
; Line 202
	mov	ax,OFFSET DGROUP:$SG366
	jmp	$L20002
; Line 205
$SC367:
; Line 206
	mov	ax,OFFSET DGROUP:$SG368
	jmp	$L20002
; Line 209
$SC369:
; Line 210
	mov	ax,OFFSET DGROUP:$SG370
	jmp	$L20002
; Line 213
$SC371:
; Line 214
	mov	ax,OFFSET DGROUP:$SG372
	jmp	$L20002
; Line 217
$SC373:
; Line 218
	mov	ax,OFFSET DGROUP:$SG374
	jmp	$L20002
; Line 221
$SC375:
; Line 222
	mov	ax,OFFSET DGROUP:$SG376
	jmp	$L20002
; Line 225
$SC377:
; Line 226
	mov	ax,OFFSET DGROUP:$SG378
	jmp	$L20002
; Line 229
$SC379:
; Line 230
	mov	ax,OFFSET DGROUP:$SG380
	jmp	$L20002
; Line 233
$SC381:
; Line 234
	mov	ax,OFFSET DGROUP:$SG382
	jmp	$L20002
; Line 237
$SC383:
; Line 238
	mov	ax,OFFSET DGROUP:$SG384
	jmp	$L20002
; Line 241
$SC385:
; Line 242
	mov	ax,OFFSET DGROUP:$SG386
	jmp	$L20002
; Line 245
$SC387:
; Line 246
	mov	ax,OFFSET DGROUP:$SG388
	jmp	$L20002
; Line 249
$SD389:
; Line 250
	mov	ax,OFFSET DGROUP:$SG390
	jmp	$L20002
$S294:
	or	dx,dx
	jne	$SD389
	cmp	ax,44
	ja	$SD389
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20001[bx]
	nop	
$L20001:
		DW	$SC298
		DW	$SC301
		DW	$SC303
		DW	$SC305
		DW	$SC307
		DW	$SC309
		DW	$SC311
		DW	$SC313
		DW	$SC315
		DW	$SC317
		DW	$SC319
		DW	$SC321
		DW	$SC323
		DW	$SC325
		DW	$SC327
		DW	$SC329
		DW	$SC331
		DW	$SC333
		DW	$SC335
		DW	$SC337
		DW	$SC339
		DW	$SC341
		DW	$SC343
		DW	$SC345
		DW	$SC347
		DW	$SC349
		DW	$SC351
		DW	$SC353
		DW	$SC355
		DW	$SC357
		DW	$SC359
		DW	$SC361
		DW	$SC363
		DW	$SC365
		DW	$SC367
		DW	$SC369
		DW	$SC371
		DW	$SC373
		DW	$SC375
		DW	$SC377
		DW	$SC379
		DW	$SC381
		DW	$SC383
		DW	$SC385
		DW	$SC387
$SB295:
; Line 257
	push	WORD PTR __logObject+30
	push	WORD PTR __logObject+28
	push	WORD PTR __logObject+26
	push	WORD PTR __logObject+24
	push	WORD PTR __logObject+18
	push	WORD PTR __logObject+16
	push	WORD PTR __logObject+14
	push	WORD PTR __logObject+12
	push	WORD PTR __logObject+10
	push	WORD PTR __logObject+8
	push	WORD PTR __logObject+6
	push	WORD PTR __logObject+4
	lea	ax,WORD PTR [bp-80]	;s
	push	ax
	push	WORD PTR __logObject+2
	push	WORD PTR __logObject
	push	WORD PTR [bp-82]	;cnt
	mov	ax,OFFSET DGROUP:$SG391
	push	ax
	call	_printf
	add	sp,34
; Line 258
	inc	WORD PTR [bp-82]	;cnt
; Line 259
$L20003:
	push	WORD PTR _outfile
	mov	ax,1
	push	ax
	push	WORD PTR _recsize
	mov	ax,OFFSET DGROUP:__logObject
	push	ax
	call	_fread
	add	sp,8
	mov	WORD PTR _flstat,ax
	or	ax,ax
	je	$JCC589
	jmp	$FC291
$JCC589:
; Line 261
	push	WORD PTR _outfile
	call	_fclose
	add	sp,2
; Line 262
	mov	ax,OFFSET DGROUP:$SG392
	push	ax
	call	_printf
; Line 263
	mov	sp,bp
	pop	bp
	ret	
	nop	

_main	ENDP
_TEXT	ENDS
END
