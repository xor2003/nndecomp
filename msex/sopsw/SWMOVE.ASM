;	Static Name Aliases
;
;	$S194_quit	EQU	quit
;	$S326_gravity	EQU	gravity
	TITLE   C:\SWMOVE.C
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
EXTRN	_dispmgge:NEAR
EXTRN	_dispsbgge:NEAR
EXTRN	_setdxdy:NEAR
EXTRN	_aim:NEAR
EXTRN	_dispfgge:NEAR
EXTRN	_gohome:NEAR
EXTRN	_multput:NEAR
EXTRN	_deallobj:NEAR
EXTRN	_movexy:NEAR
EXTRN	_asynput:NEAR
EXTRN	_initsound:NEAR
EXTRN	_swrestart:NEAR
EXTRN	_swend:NEAR
EXTRN	_stopsound:NEAR
EXTRN	_range:NEAR
EXTRN	_multget:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_initsmok:NEAR
EXTRN	_dispwobj:NEAR
EXTRN	_asynget:NEAR
EXTRN	_sound:NEAR
EXTRN	_swsound:NEAR
EXTRN	_swgetc:NEAR
EXTRN	_swflush:NEAR
EXTRN	_scorepln:NEAR
EXTRN	_initshot:NEAR
EXTRN	_loser:NEAR
EXTRN	_initbomb:NEAR
EXTRN	_initplyr:NEAR
EXTRN	_dispcomp:NEAR
EXTRN	_equal:NEAR
EXTRN	_initmiss:NEAR
EXTRN	_initdisp:NEAR
EXTRN	_initburst:NEAR
EXTRN	_ctlbreak:NEAR
EXTRN	_abs:NEAR
EXTRN	_swauto:NEAR
EXTRN	_winner:NEAR
EXTRN	_initcomp:NEAR
EXTRN	_setvdisp:NEAR
EXTRN	_dispsgge:NEAR
EXTRN	_dispbgge:NEAR
EXTRN	_endstat:WORD
EXTRN	_displx:WORD
EXTRN	_disprx:WORD
EXTRN	_dispdx:WORD
EXTRN	_objtop:WORD
EXTRN	_objfree:WORD
EXTRN	_deltop:WORD
EXTRN	_delbot:WORD
EXTRN	_oobjects:BYTE
EXTRN	_compnear:BYTE
EXTRN	_lcompter:BYTE
EXTRN	_rcompter:BYTE
EXTRN	_playmode:WORD
EXTRN	_multbuff:WORD
EXTRN	_sintab:BYTE
EXTRN	_ground:BYTE
EXTRN	_keydelay:WORD
EXTRN	_multkey:WORD
EXTRN	_swplnsym:BYTE
EXTRN	_swhitsym:BYTE
EXTRN	_swbmbsym:BYTE
EXTRN	_swmscsym:BYTE
EXTRN	_swbstsym:BYTE
EXTRN	_swtrgsym:BYTE
EXTRN	_swwinsym:BYTE
EXTRN	_swhtrsym:BYTE
EXTRN	_swexpsym:BYTE
EXTRN	_swflksym:BYTE
EXTRN	_swbrdsym:BYTE
EXTRN	_swoxsym:BYTE
EXTRN	_countmove:WORD
EXTRN	_compplane:WORD
EXTRN	_plyrplane:WORD
EXTRN	_currobx:WORD
EXTRN	_player:WORD
EXTRN	_soundflg:WORD
EXTRN	_endsts:BYTE
EXTRN	_endcount:WORD
EXTRN	_goingsun:WORD
EXTRN	_gamenum:WORD
EXTRN	_gminspeed:WORD
EXTRN	_targrnge:WORD
EXTRN	_dispcnt:WORD
_DATA      SEGMENT
$S326_gravity	DB	00H
	DB	0ffH
	DB	0feH
	DB	0fdH
	DB	0fcH
	DB	0fdH
	DB	0feH
	DB	0ffH
	DB	00H
	DB	01H
	DB	02H
	DB	03H
	DB	04H
	DB	03H
	DB	02H
	DB	01H
_DATA      ENDS
_BSS      SEGMENT
$S194_quit	DW 01H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 28
; Line 27
; Line 28
; Line 29
; Line 30
; Line 31
; Line 84
	PUBLIC	_swmove
_swmove	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,0
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = obn
; Line 87
	cmp	WORD PTR _deltop,0
	jne	$JCC16
	jmp	$I199
$JCC16:
; Line 88
	mov	ax,WORD PTR _objfree
	mov	bx,WORD PTR _delbot
	mov	WORD PTR [bx+52],ax
; Line 89
	mov	ax,WORD PTR _deltop
	mov	WORD PTR _objfree,ax
; Line 90
	mov	ax,0
	mov	WORD PTR _delbot,ax
	mov	WORD PTR _deltop,ax
; Line 91
; Line 93
$I199:
	inc	WORD PTR _dispcnt
	mov	ax,WORD PTR _keydelay
	cmp	WORD PTR _dispcnt,ax
	jge	$JCC57
	jmp	$I200
$JCC57:
; Line 94
	mov	WORD PTR _dispcnt,0
; Line 96
$I200:
	mov	si,WORD PTR _objtop
; Line 97
$FC202:
	cmp	si,0
	jne	$JCC75
	jmp	$FB203
$JCC75:
; Line 98
	mov	di,WORD PTR [si+52]
; Line 99
	mov	ax,WORD PTR [si+62]
	mov	WORD PTR [si+64],ax
; Line 100
	mov	ax,WORD PTR [si+78]
	mov	WORD PTR [si+66],ax
; Line 101
	push	si
	call	WORD PTR [si+70]
	add	sp,2
	mov	WORD PTR [si+62],ax
; Line 104
	cmp	WORD PTR _playmode,1
	jne	$JCC110
	jmp	$I205
$JCC110:
	cmp	WORD PTR _playmode,3
	je	$JCC120
	jmp	$I204
$JCC120:
$I205:
	mov	bx,WORD PTR _multbuff
	mov	ax,WORD PTR [bx]
	cmp	WORD PTR [si+56],ax
	je	$JCC134
	jmp	$I204
$JCC134:
	cmp	WORD PTR _dispcnt,0
	je	$JCC144
	jmp	$I204
$JCC144:
; Line 105
	cmp	WORD PTR _playmode,1
	je	$JCC154
	jmp	$I206
$JCC154:
; Line 106
	call	_multput
; Line 107
	jmp	$I208
$I206:
; Line 108
	call	_asynput
$I208:
; Line 109
$I204:
	mov	si,di
; Line 110
	jmp	$FC202
$FB203:
; Line 111
	inc	WORD PTR _countmove
; Line 113
$EX196:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_swmove	ENDP
; Line 118
	PUBLIC	_moveplyr
_moveplyr	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = rc
;	oldx = -2
;	obp = 4
; Line 124
	mov	WORD PTR _compplane,0
; Line 125
	mov	WORD PTR _plyrplane,1
; Line 127
	mov	si,WORD PTR [bp+4]	;obp
; Line 128
	mov	ax,WORD PTR [si+56]
	mov	WORD PTR _currobx,ax
; Line 130
	mov	bx,WORD PTR _player
	shl	bx,1
	mov	ax,WORD PTR _endsts[bx]
	mov	WORD PTR _endstat,ax
	cmp	ax,0
	jne	$JCC231
	jmp	$I216
$JCC231:
; Line 131
	dec	WORD PTR _endcount
	cmp	WORD PTR _endcount,0
	jle	$JCC245
	jmp	$I217
$JCC245:
; Line 134
	cmp	WORD PTR _playmode,1
	jne	$JCC255
	jmp	$I218
$JCC255:
	cmp	WORD PTR _playmode,3
	jne	$JCC265
	jmp	$I218
$JCC265:
	cmp	WORD PTR $S194_quit,0
	je	$JCC275
	jmp	$I218
$JCC275:
; Line 135
	call	_swrestart
; Line 136
$I218:
	mov	ax,1
	push	ax
	mov	ax,0
	push	ax
	call	_swend
	add	sp,4
; Line 137
; Line 139
$I217:
$I216:
	cmp	WORD PTR _dispcnt,0
	je	$JCC302
	jmp	$I221
$JCC302:
; Line 140
	cmp	WORD PTR _playmode,1
	je	$JCC312
	jmp	$I222
$JCC312:
; Line 141
	push	si
	call	_multget
	add	sp,2
	mov	WORD PTR _multkey,ax
; Line 142
	jmp	$I224
$I222:
	cmp	WORD PTR _playmode,3
	je	$JCC335
	jmp	$I225
$JCC335:
; Line 143
	push	si
	call	_asynget
	add	sp,2
	mov	WORD PTR _multkey,ax
; Line 144
	jmp	$I227
$I225:
; Line 145
	call	_swgetc
	mov	WORD PTR _multkey,ax
; Line 146
	call	_swflush
; Line 147
$I227:
$I224:
; Line 148
	push	WORD PTR _multkey
	push	si
	call	_interpret
	add	sp,4
; Line 149
	jmp	$I231
$I221:
; Line 150
	mov	WORD PTR [si+18],0
; Line 151
	mov	ax,0
	mov	WORD PTR [si+38],ax
	mov	WORD PTR [si+114],ax
; Line 152
	mov	WORD PTR [si+106],0
; Line 153
$I231:
; Line 156
	cmp	WORD PTR [si],4
	jne	$JCC398
	jmp	$I233
$JCC398:
	cmp	WORD PTR [si],93
	je	$JCC406
	jmp	$I232
$JCC406:
$I233:
	cmp	WORD PTR [si+26],0
	jle	$JCC415
	jmp	$I232
$JCC415:
; Line 157
	inc	WORD PTR [si+76]
; Line 162
	cmp	WORD PTR _endstat,1
	jne	$JCC428
	jmp	$I234
$JCC428:
	cmp	WORD PTR [si+30],-5000
	jg	$JCC438
	jmp	$I235
$JCC438:
	cmp	WORD PTR _playmode,1
	jne	$JCC448
	jmp	$I234
$JCC448:
	cmp	WORD PTR _playmode,3
	jne	$JCC458
	jmp	$I234
$JCC458:
	cmp	WORD PTR [si+76],5
	jge	$JCC467
	jmp	$I234
$JCC467:
$I235:
; Line 163
	cmp	WORD PTR _endstat,0
	je	$JCC477
	jmp	$I236
$JCC477:
; Line 164
	push	si
	call	_loser
	add	sp,2
; Line 165
$I236:
	jmp	$I238
$I234:
; Line 166
	push	si
	call	_initplyr
	add	sp,2
; Line 167
	mov	ax,1
	push	ax
	call	_initdisp
	add	sp,2
; Line 168
	cmp	WORD PTR _endstat,1
	je	$JCC514
	jmp	$I241
$JCC514:
; Line 169
	call	_ctlbreak
	cmp	ax,0
	jne	$JCC525
	jmp	$I243
$JCC525:
; Line 170
	mov	ax,1
	push	ax
	mov	ax,0
	push	ax
	call	_swend
	add	sp,4
; Line 171
$I243:
	push	si
	call	_winner
	add	sp,2
; Line 172
; Line 173
$I241:
$I238:
; Line 174
; Line 176
$I232:
	mov	ax,WORD PTR [si+2]
	mov	WORD PTR [bp-2],ax	;oldx
; Line 177
	push	si
	call	_movepln
	add	sp,2
	mov	di,ax
; Line 178
	cmp	WORD PTR [bp-2],180	;oldx
	jg	$JCC571
	jmp	$I247
$JCC571:
	cmp	WORD PTR [bp-2],2820	;oldx
	jge	$JCC581
	jmp	$I246
$JCC581:
$I247:
; Line 179
	mov	WORD PTR _dispdx,0
; Line 180
	jmp	$I248
$I246:
; Line 181
	mov	ax,WORD PTR [si+2]
	sub	ax,WORD PTR [bp-2]	;oldx
	mov	WORD PTR _dispdx,ax
	add	WORD PTR _displx,ax
; Line 182
	mov	ax,WORD PTR _dispdx
	add	WORD PTR _disprx,ax
; Line 183
$I248:
; Line 185
	cmp	WORD PTR [si+100],0
	je	$JCC619
	jmp	$I249
$JCC619:
; Line 186
	call	_setvdisp
; Line 187
	cmp	WORD PTR [si+20],0
	jne	$JCC631
	jmp	$I251
$JCC631:
; Line 188
	push	si
	call	_dispsgge
	add	sp,2
; Line 189
$I251:
	cmp	WORD PTR [si+38],0
	jne	$JCC647
	jmp	$I253
$JCC647:
; Line 190
	push	si
	call	_dispbgge
	add	sp,2
; Line 191
$I253:
	cmp	WORD PTR [si+106],0
	jne	$JCC663
	jmp	$I255
$JCC663:
; Line 192
	push	si
	call	_dispmgge
	add	sp,2
; Line 193
$I255:
	cmp	WORD PTR [si+114],0
	jne	$JCC679
	jmp	$I257
$JCC679:
; Line 194
	push	si
	call	_dispsbgge
	add	sp,2
; Line 195
$I257:
; Line 197
$I249:
	mov	ax,di
	jmp	$EX212
; Line 198
$EX212:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_moveplyr	ENDP
; Line 204
	PUBLIC	_interpret
_interpret	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,0
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = state
;	key = 6
;	obp = 4
; Line 210
	mov	si,WORD PTR [bp+4]	;obp
; Line 211
	mov	WORD PTR [si+18],0
; Line 212
	mov	ax,0
	mov	WORD PTR [si+114],ax
	mov	WORD PTR [si+38],ax
; Line 213
	mov	ax,0
	mov	WORD PTR [si+20],ax
	mov	WORD PTR [si+106],ax
; Line 220
	mov	di,WORD PTR [si]
	cmp	di,1
	jne	$JCC744
	jmp	$I264
$JCC744:
	cmp	di,7
	jne	$JCC752
	jmp	$I264
$JCC752:
	cmp	di,5
	jne	$JCC760
	jmp	$I264
$JCC760:
	cmp	di,9
	jne	$JCC768
	jmp	$I264
$JCC768:
	cmp	di,10
	jne	$JCC776
	jmp	$I264
$JCC776:
	cmp	di,92
	jne	$JCC784
	jmp	$I264
$JCC784:
	cmp	di,94
	jne	$JCC792
	jmp	$I264
$JCC792:
; Line 221
	jmp	$EX261
; Line 223
$I264:
	cmp	di,5
	jne	$JCC803
	jmp	$I265
$JCC803:
; Line 224
	cmp	WORD PTR _endstat,0
	jne	$JCC813
	jmp	$I266
$JCC813:
; Line 225
	cmp	WORD PTR _endstat,2
	je	$JCC823
	jmp	$I267
$JCC823:
	cmp	WORD PTR _plyrplane,0
	jne	$JCC833
	jmp	$I267
$JCC833:
; Line 226
	push	si
	call	_gohome
	add	sp,2
; Line 227
$I267:
	jmp	$EX261
; Line 228
; Line 230
$I266:
	test	BYTE PTR [bp+7],8
	jne	$JCC852
	jmp	$I269
$JCC852:
; Line 231
	mov	WORD PTR [si+30],-5000
; Line 232
	mov	WORD PTR [si+82],0
; Line 233
	cmp	WORD PTR [si+100],0
	jne	$JCC871
	jmp	$I270
$JCC871:
; Line 235
	cmp	di,91
	jge	$JCC879
	jmp	$L20001
$JCC879:
	mov	ax,93
	jmp	$L20002
$L20001:
	mov	ax,4
$L20002:
	mov	di,ax
	mov	WORD PTR [si],di
; Line 236
	mov	WORD PTR [si+26],0
; Line 237
; Line 238
$I270:
	cmp	WORD PTR _plyrplane,0
	jne	$JCC907
	jmp	$I271
$JCC907:
; Line 239
	mov	WORD PTR $S194_quit,1
; Line 240
$I271:
; Line 242
$I269:
	test	BYTE PTR [bp+7],2
	jne	$JCC922
	jmp	$I272
$JCC922:
; Line 245
	cmp	di,1
	jne	$JCC930
	jmp	$I274
$JCC930:
	cmp	di,92
	jne	$JCC938
	jmp	$I274
$JCC938:
	cmp	di,9
	je	$JCC946
	jmp	$I273
$JCC946:
$I274:
; Line 246
	mov	WORD PTR [si+82],1
; Line 247
$I273:
$I272:
; Line 249
$I265:
; Line 250
	test	BYTE PTR _countmove,1
	je	$JCC961
	jmp	$I276
$JCC961:
	cmp	di,9
	jne	$JCC969
	jmp	$I275
$JCC969:
	cmp	di,10
	jne	$JCC977
	jmp	$I275
$JCC977:
$I276:
; Line 251
	test	BYTE PTR [bp+6],4	;key
	jne	$JCC986
	jmp	$I277
$JCC986:
; Line 252
	inc	WORD PTR [si+18]
; Line 253
	mov	WORD PTR [si+82],0
; Line 254
; Line 256
$I277:
	test	BYTE PTR [bp+6],8	;key
	jne	$JCC1003
	jmp	$I278
$JCC1003:
; Line 257
	dec	WORD PTR [si+18]
; Line 258
	mov	WORD PTR [si+82],0
; Line 259
; Line 261
$I278:
	test	BYTE PTR [bp+6],16	;key
	jne	$JCC1020
	jmp	$I279
$JCC1020:
; Line 262
	cmp	WORD PTR [si+12],1
	sbb	ax,ax
	neg	ax
	mov	WORD PTR [si+12],ax
; Line 263
	mov	WORD PTR [si+82],0
; Line 264
; Line 266
$I279:
	test	BYTE PTR [bp+6],2	;key
	jne	$JCC1045
	jmp	$I280
$JCC1045:
; Line 267
	cmp	WORD PTR [si+16],0
	jne	$JCC1054
	jmp	$I281
$JCC1054:
; Line 268
	dec	WORD PTR [si+16]
; Line 269
$I281:
	mov	WORD PTR [si+82],0
; Line 270
; Line 272
$I280:
	test	BYTE PTR [bp+6],1	;key
	jne	$JCC1071
	jmp	$I282
$JCC1071:
; Line 273
	cmp	WORD PTR [si+16],4
	jl	$JCC1080
	jmp	$I283
$JCC1080:
; Line 274
	inc	WORD PTR [si+16]
; Line 275
$I283:
	mov	WORD PTR [si+82],0
; Line 276
; Line 277
$I282:
; Line 279
$I275:
	test	BYTE PTR [bp+6],32	;key
	jne	$JCC1097
	jmp	$I284
$JCC1097:
	cmp	di,91
	jl	$JCC1105
	jmp	$I284
$JCC1105:
; Line 280
	mov	WORD PTR [si+20],si
; Line 282
$I284:
	test	BYTE PTR [bp+7],16
	jne	$JCC1117
	jmp	$I285
$JCC1117:
	cmp	di,91
	jl	$JCC1125
	jmp	$I285
$JCC1125:
; Line 283
	mov	WORD PTR [si+106],si
; Line 285
$I285:
	test	BYTE PTR [bp+7],1
	jne	$JCC1137
	jmp	$I286
$JCC1137:
	cmp	di,91
	jl	$JCC1145
	jmp	$I286
$JCC1145:
; Line 286
	mov	WORD PTR [si+38],1
; Line 288
$I286:
	test	BYTE PTR [bp+7],32
	jne	$JCC1159
	jmp	$I287
$JCC1159:
	cmp	di,91
	jl	$JCC1167
	jmp	$I287
$JCC1167:
; Line 289
	mov	WORD PTR [si+114],1
; Line 291
$I287:
	test	BYTE PTR [bp+7],4
	jne	$JCC1181
	jmp	$I288
$JCC1181:
; Line 292
	cmp	WORD PTR _plyrplane,0
	jne	$JCC1191
	jmp	$I289
$JCC1191:
; Line 293
	cmp	WORD PTR _soundflg,0
	jne	$JCC1201
	jmp	$I290
$JCC1201:
; Line 294
	mov	ax,0
	push	ax
	mov	ax,0
	push	ax
	push	ax
	call	_sound
	add	sp,6
; Line 295
	call	_swsound
; Line 296
; Line 297
$I290:
	cmp	WORD PTR _soundflg,1
	sbb	ax,ax
	neg	ax
	mov	WORD PTR _soundflg,ax
; Line 298
; Line 300
$I289:
$I288:
	cmp	WORD PTR [si+82],0
	jne	$JCC1240
	jmp	$I293
$JCC1240:
; Line 301
	push	si
	call	_gohome
	add	sp,2
; Line 302
$I293:
$EX261:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_interpret	ENDP
; Line 307
	PUBLIC	_movecomp
_movecomp	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,0
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	obp = 4
; Line 311
	mov	WORD PTR _compplane,1
; Line 312
	mov	WORD PTR _plyrplane,0
; Line 314
	mov	si,WORD PTR [bp+4]	;obp
; Line 315
	mov	WORD PTR [si+18],0
; Line 316
	mov	ax,0
	mov	WORD PTR [si+38],ax
	mov	WORD PTR [si+114],ax
; Line 317
	mov	WORD PTR [si+106],0
; Line 319
	mov	bx,WORD PTR [si+56]
	mov	WORD PTR _currobx,bx
	shl	bx,1
	mov	ax,WORD PTR _endsts[bx]
	mov	WORD PTR _endstat,ax
; Line 321
	cmp	WORD PTR _dispcnt,0
	je	$JCC1324
	jmp	$I298
$JCC1324:
; Line 322
	mov	WORD PTR [si+20],0
; Line 324
$I298:
	mov	ax,WORD PTR [si]
	jmp	$S299
; Line 326
$SC303:
; Line 328
	test	BYTE PTR _countmove,1
	jne	$JCC1344
	jmp	$I304
$JCC1344:
; Line 329
	jmp	$SB300
; Line 331
$I304:
$SC305:
; Line 333
	cmp	WORD PTR _endstat,0
	jne	$JCC1357
	jmp	$I306
$JCC1357:
; Line 334
	push	si
	call	_gohome
	add	sp,2
; Line 335
	jmp	$SB300
; Line 336
; Line 337
$I306:
	cmp	WORD PTR _dispcnt,0
	je	$JCC1377
	jmp	$I307
$JCC1377:
; Line 338
	push	si
	call	_swauto
	add	sp,2
; Line 339
$I307:
	jmp	$SB300
; Line 341
$SC309:
; Line 342
	mov	WORD PTR [si+20],0
; Line 343
	cmp	WORD PTR [si+26],0
	jle	$JCC1401
	jmp	$I310
$JCC1401:
	cmp	WORD PTR _endstat,0
	je	$JCC1411
	jmp	$I310
$JCC1411:
; Line 344
	push	si
	call	_initcomp
	add	sp,2
; Line 345
$I310:
	jmp	$SB300
; Line 347
$SD312:
; Line 348
	mov	WORD PTR [si+20],0
; Line 349
	jmp	$SB300
; Line 350
	jmp	$SB300
$S299:
	dec	ax
	cmp	ax,9
	jbe	$JCC1441
	jmp	$SD312
$JCC1441:
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20007[bx]
$L20007:
		DW	$SC305
		DW	$SD312
		DW	$SD312
		DW	$SC309
		DW	$SD312
		DW	$SD312
		DW	$SC305
		DW	$SD312
		DW	$SC303
		DW	$SC303
$SB300:
; Line 352
	push	si
	call	_movepln
	add	sp,2
	jmp	$EX296
; Line 353
$EX296:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_movecomp	ENDP
; Line 358
	PUBLIC	_movepln
_movepln	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,18
	call	__aNchkstk
	push	di
	push	si
;	update = -18
;	x = -2
;	y = -6
;	newstate = -8
;	stalled = -4
;	grv = -10
;	register si = ob
;	register di = nangle
;	nspeed = -12
;	state = -14
;	limit = -16
;	obp = 4
; Line 366
	mov	si,WORD PTR [bp+4]	;obp
; Line 367
	mov	ax,WORD PTR [si]
	mov	WORD PTR [bp-14],ax	;state
	jmp	$S327
; Line 368
$SC331:
; Line 370
	mov	ax,0
	jmp	$EX314
; Line 372
$SC332:
; Line 374
	dec	WORD PTR [si+26]
; Line 375
	jmp	$SB328
; Line 377
$SC333:
; Line 378
	sub	WORD PTR [si+26],2
; Line 379
	cmp	WORD PTR [si+8],0
	jl	$JCC1532
	jmp	$I334
$JCC1532:
	cmp	WORD PTR [si+6],0
	jne	$JCC1541
	jmp	$I334
$JCC1541:
; Line 380
	cmp	WORD PTR [si+6],0
	jl	$JCC1550
	jmp	$L20008
$JCC1550:
	mov	ax,1
	jmp	$L20009
$L20008:
	mov	ax,0
$L20009:
	xor	ax,WORD PTR [si+12]
	cmp	ax,0
	jne	$JCC1570
	jmp	$I335
$JCC1570:
; Line 381
	mov	ax,WORD PTR [si+18]
	sub	WORD PTR [si+26],ax
; Line 382
	jmp	$I336
$I335:
; Line 383
	mov	ax,WORD PTR [si+18]
	add	WORD PTR [si+26],ax
$I336:
; Line 385
$I334:
	cmp	WORD PTR [si+26],0
	jle	$JCC1594
	jmp	$I337
$JCC1594:
; Line 386
	cmp	WORD PTR [si+8],0
	jl	$JCC1603
	jmp	$I338
$JCC1603:
; Line 387
	cmp	WORD PTR [si+6],0
	jl	$JCC1612
	jmp	$I339
$JCC1612:
; Line 388
	inc	WORD PTR [si+6]
; Line 389
	jmp	$I340
$I339:
	cmp	WORD PTR [si+6],0
	jg	$JCC1627
	jmp	$I341
$JCC1627:
; Line 390
	dec	WORD PTR [si+6]
; Line 391
	jmp	$I342
$I341:
; Line 392
	cmp	WORD PTR [si+12],1
	sbb	ax,ax
	neg	ax
	mov	WORD PTR [si+12],ax
$I342:
$I340:
; Line 394
$I338:
	cmp	WORD PTR [si+8],-10
	jg	$JCC1653
	jmp	$I343
$JCC1653:
; Line 395
	dec	WORD PTR [si+8]
; Line 396
$I343:
	mov	WORD PTR [si+26],10
; Line 397
; Line 398
$I337:
	push	si
	call	symangle
	add	sp,2
	shl	ax,1
	mov	WORD PTR [si+10],ax
; Line 399
	cmp	WORD PTR [si+8],0
	jle	$JCC1682
	jmp	$I345
$JCC1682:
; Line 400
	mov	ax,40
	push	ax
	push	si
	call	_initsound
	add	sp,4
; Line 401
$I345:
	jmp	$SB328
; Line 403
$SC347:
; Line 404
	mov	WORD PTR [bp-8],1	;newstate
; Line 405
	jmp	$commonstall348
; Line 407
$SC349:
; Line 408
	mov	WORD PTR [bp-8],92	;newstate
; Line 409
	jmp	$commonstall348
; Line 411
$SC350:
; Line 412
	mov	WORD PTR [bp-8],9	;newstate
; Line 414
$commonstall348:
; Line 416
	cmp	WORD PTR [si+10],12
	je	$JCC1726
	jmp	$L20014
$JCC1726:
	mov	ax,WORD PTR _gminspeed
	cmp	WORD PTR [si+14],ax
	jl	$JCC1737
	jmp	$L20012
$JCC1737:
$L20014:
	mov	WORD PTR [bp-4],1	;stalled
	jmp	$L20013
$L20012:
	mov	WORD PTR [bp-4],0	;stalled
$L20013:
	cmp	WORD PTR [bp-4],0	;stalled
	je	$JCC1759
	jmp	$I351
$JCC1759:
; Line 417
	mov	ax,WORD PTR [bp-8]	;newstate
	mov	WORD PTR [bp-14],ax	;state
	mov	WORD PTR [si],ax
; Line 418
$I351:
	jmp	$controlled352
; Line 420
$SC353:
; Line 423
	cmp	WORD PTR [si+4],200
	jge	$JCC1780
	jmp	$L20015
$JCC1780:
	mov	ax,1
	jmp	$L20016
$L20015:
	mov	ax,0
$L20016:
	mov	WORD PTR [bp-4],ax	;stalled
	cmp	ax,0
	jne	$JCC1800
	jmp	$I354
$JCC1800:
; Line 424
	cmp	WORD PTR _playmode,4
	je	$JCC1810
	jmp	$I355
$JCC1810:
; Line 425
	mov	WORD PTR [si+10],12
; Line 426
	mov	WORD PTR [bp-4],0	;stalled
; Line 427
	jmp	$I356
$I355:
; Line 428
	push	si
	call	_stallpln
	add	sp,2
; Line 429
	mov	ax,WORD PTR [si]
	mov	WORD PTR [bp-14],ax	;state
; Line 430
$I356:
; Line 431
; Line 433
$I354:
$controlled352:
; Line 434
	cmp	WORD PTR _goingsun,0
	jne	$JCC1845
	jmp	$I358
$JCC1845:
	cmp	WORD PTR _plyrplane,0
	jne	$JCC1855
	jmp	$I358
$JCC1855:
; Line 435
	jmp	$SB328
; Line 437
$I358:
; Line 441
	cmp	WORD PTR [si+30],0
	jle	$JCC1867
	jmp	$I359
$JCC1867:
	cmp	WORD PTR [si+100],0
	je	$JCC1876
	jmp	$I359
$JCC1876:
	cmp	WORD PTR [bp-14],1	;state
	jne	$JCC1885
	jmp	$I360
$JCC1885:
	cmp	WORD PTR [bp-14],7	;state
	jne	$JCC1894
	jmp	$I360
$JCC1894:
	cmp	WORD PTR [bp-14],9	;state
	jne	$JCC1903
	jmp	$I360
$JCC1903:
	cmp	WORD PTR [bp-14],10	;state
	je	$JCC1912
	jmp	$I359
$JCC1912:
$I360:
; Line 442
	push	si
	call	_hitpln
	add	sp,2
; Line 443
	push	si
	call	_scorepln
	add	sp,2
; Line 444
	push	si
	call	_movepln
	add	sp,2
	jmp	$EX314
; Line 445
; Line 447
$I359:
	cmp	WORD PTR [si+20],0
	jne	$JCC1945
	jmp	$I363
$JCC1945:
; Line 448
	mov	ax,0
	push	ax
	push	si
	call	_initshot
	add	sp,4
; Line 450
$I363:
	cmp	WORD PTR [si+38],0
	jne	$JCC1965
	jmp	$I365
$JCC1965:
; Line 451
	push	si
	call	_initbomb
	add	sp,2
; Line 453
$I365:
	cmp	WORD PTR [si+106],0
	jne	$JCC1981
	jmp	$I367
$JCC1981:
; Line 454
	push	si
	call	_initmiss
	add	sp,2
; Line 456
$I367:
	cmp	WORD PTR [si+114],0
	jne	$JCC1997
	jmp	$I369
$JCC1997:
; Line 457
	push	si
	call	_initburst
	add	sp,2
; Line 459
$I369:
	mov	di,WORD PTR [si+10]
; Line 460
	mov	ax,WORD PTR [si+14]
	mov	WORD PTR [bp-12],ax	;nspeed
; Line 461
	mov	WORD PTR [bp-18],0	;update
; Line 463
	mov	ax,WORD PTR [si+18]
	mov	WORD PTR [bp-18],ax	;update
	cmp	ax,0
	jne	$JCC2032
	jmp	$I371
$JCC2032:
; Line 464
	cmp	WORD PTR [si+12],0
	jne	$JCC2041
	jmp	$I372
$JCC2041:
; Line 465
	sub	di,WORD PTR [bp-18]	;update
; Line 466
	jmp	$I373
$I372:
; Line 467
	add	di,WORD PTR [bp-18]	;update
$I373:
; Line 468
	lea	ax,WORD PTR [di+16]
	mov	cx,16
	cwd	
	idiv	cx
	mov	di,dx
; Line 469
; Line 471
$I371:
	test	BYTE PTR _countmove,3
	je	$JCC2071
	jmp	$I374
$JCC2071:
; Line 473
	cmp	WORD PTR [bp-4],0	;stalled
	je	$JCC2080
	jmp	$I375
$JCC2080:
	mov	ax,WORD PTR _gminspeed
	cmp	WORD PTR [bp-12],ax	;nspeed
	jl	$JCC2091
	jmp	$I375
$JCC2091:
	cmp	WORD PTR _playmode,4
	jne	$JCC2101
	jmp	$I375
$JCC2101:
; Line 474
	dec	WORD PTR [bp-12]	;nspeed
; Line 475
	mov	WORD PTR [bp-18],1	;update
; Line 476
	jmp	$I376
$I375:
; Line 479
	mov	al,BYTE PTR $S326_gravity[di]
	cbw	
	add	ax,WORD PTR [si+16]
	add	ax,WORD PTR _gminspeed
	mov	WORD PTR [bp-16],ax	;limit
; Line 480
	mov	ax,WORD PTR [bp-12]	;nspeed
	cmp	WORD PTR [bp-16],ax	;limit
	jg	$JCC2138
	jmp	$I377
$JCC2138:
; Line 481
	inc	WORD PTR [bp-12]	;nspeed
; Line 482
	mov	WORD PTR [bp-18],1	;update
; Line 483
	jmp	$I378
$I377:
	mov	ax,WORD PTR [bp-12]	;nspeed
	cmp	WORD PTR [bp-16],ax	;limit
	jl	$JCC2160
	jmp	$I379
$JCC2160:
; Line 484
	dec	WORD PTR [bp-12]	;nspeed
; Line 485
	mov	WORD PTR [bp-18],1	;update
; Line 486
; Line 487
$I379:
$I378:
$I376:
; Line 488
; Line 490
$I374:
	cmp	WORD PTR [bp-18],0	;update
	jne	$JCC2177
	jmp	$I380
$JCC2177:
; Line 491
	cmp	WORD PTR [si+100],0
	jne	$JCC2186
	jmp	$I381
$JCC2186:
; Line 492
	cmp	WORD PTR [si+16],0
	je	$JCC2195
	jmp	$I383
$JCC2195:
	cmp	WORD PTR [si+18],0
	jne	$JCC2204
	jmp	$I382
$JCC2204:
$I383:
; Line 493
	mov	ax,WORD PTR _gminspeed
	mov	WORD PTR [bp-12],ax	;nspeed
; Line 494
	jmp	$I384
$I382:
; Line 495
	mov	WORD PTR [bp-12],0	;nspeed
$I384:
; Line 497
	jmp	$I385
$I381:
	cmp	WORD PTR [bp-12],0	;nspeed
	jle	$JCC2230
	jmp	$I386
$JCC2230:
	cmp	WORD PTR [bp-4],0	;stalled
	je	$JCC2239
	jmp	$I386
$JCC2239:
; Line 498
	cmp	WORD PTR _playmode,4
	je	$JCC2249
	jmp	$I387
$JCC2249:
; Line 499
	mov	WORD PTR [bp-12],1	;nspeed
; Line 500
	jmp	$I388
$I387:
; Line 501
	push	si
	call	_stallpln
	add	sp,2
; Line 502
	push	si
	call	_movepln
	add	sp,2
	jmp	$EX314
; Line 503
$I388:
; Line 504
; Line 506
$I386:
$I385:
	mov	ax,WORD PTR [bp-12]	;nspeed
	mov	WORD PTR [si+14],ax
; Line 507
	mov	WORD PTR [si+10],di
; Line 509
	cmp	WORD PTR [bp-4],0	;stalled
	jne	$JCC2292
	jmp	$I389
$JCC2292:
; Line 510
	mov	ax,0
	mov	WORD PTR [si+50],ax
	mov	WORD PTR [si+48],ax
	mov	WORD PTR [si+6],ax
; Line 511
	mov	ax,WORD PTR [bp-12]	;nspeed
	neg	ax
	mov	WORD PTR [si+8],ax
; Line 512
	jmp	$I390
$I389:
; Line 516
	mov	ax,di
	mov	cx,16
	cwd	
	idiv	cx
	mov	bx,dx
	shl	bx,1
	mov	ax,WORD PTR _sintab[bx]
	imul	WORD PTR [bp-12]	;nspeed
	push	ax
	lea	ax,WORD PTR [di+4]
	cwd	
	idiv	cx
	mov	bx,dx
	shl	bx,1
	mov	ax,WORD PTR _sintab[bx]
	imul	WORD PTR [bp-12]	;nspeed
	push	ax
	push	si
	call	_setdxdy
	add	sp,6
$I390:
; Line 517
; Line 519
$I380:
	cmp	WORD PTR [bp-4],0	;stalled
	jne	$JCC2369
	jmp	$I392
$JCC2369:
; Line 520
	dec	WORD PTR [si+26]
	cmp	WORD PTR [si+26],0
	je	$JCC2381
	jmp	$I393
$JCC2381:
; Line 521
	cmp	WORD PTR [si+12],1
	sbb	ax,ax
	neg	ax
	mov	WORD PTR [si+12],ax
; Line 524
	mov	ax,24
	sub	ax,WORD PTR [si+10]
	mov	cx,16
	cwd	
	idiv	cx
	mov	WORD PTR [si+10],dx
; Line 525
	mov	WORD PTR [si+26],6
; Line 526
; Line 527
$I393:
; Line 529
$I392:
	cmp	WORD PTR _compplane,0
	je	$JCC2422
	jmp	$I394
$JCC2422:
; Line 532
	cmp	WORD PTR _plyrplane,0
	jne	$JCC2432
	jmp	$I395
$JCC2432:
	mov	ax,WORD PTR [si+30]
	mov	cx,900
	cwd	
	idiv	cx
	cmp	dx,WORD PTR [si+14]
	jl	$JCC2449
	jmp	$I395
$JCC2449:
; Line 533
	call	_setvdisp
; Line 534
	push	si
	call	_dispfgge
	add	sp,2
; Line 535
; Line 536
$I395:
	mov	ax,WORD PTR [si+14]
	sub	WORD PTR [si+30],ax
; Line 537
; Line 539
$I394:
	cmp	WORD PTR [si+14],0
	jne	$JCC2474
	jmp	$I397
$JCC2474:
; Line 540
	mov	WORD PTR [si+100],0
; Line 541
$I397:
	jmp	$SB328
; Line 542
	jmp	$SB328
$S327:
	cmp	ax,9
	jne	$JCC2493
	jmp	$SC353
$JCC2493:
	jle	$JCC2498
	jmp	$L20019
$JCC2498:
	or	ax,ax
	jne	$JCC2505
	jmp	$SC331
$JCC2505:
	dec	ax
	jne	$JCC2511
	jmp	$SC353
$JCC2511:
	sub	ax,3
	jne	$JCC2519
	jmp	$SC332
$JCC2519:
	dec	ax
	jne	$JCC2525
	jmp	$SC333
$JCC2525:
	dec	ax
	dec	ax
	jne	$JCC2532
	jmp	$SC347
$JCC2532:
	jmp	$SB328
$L20019:
	sub	ax,10
	jne	$JCC2543
	jmp	$SC350
$JCC2543:
	sub	ax,81
	jne	$JCC2551
	jmp	$SC331
$JCC2551:
	dec	ax
	jne	$JCC2557
	jmp	$SC353
$JCC2557:
	dec	ax
	jne	$JCC2563
	jmp	$SC332
$JCC2563:
	dec	ax
	jne	$JCC2569
	jmp	$SC349
$JCC2569:
	jmp	$SB328
$SB328:
; Line 544
	cmp	WORD PTR _endstat,1
	je	$JCC2582
	jmp	$I398
$JCC2582:
	cmp	WORD PTR _plyrplane,0
	jne	$JCC2592
	jmp	$I398
$JCC2592:
	cmp	WORD PTR _goingsun,0
	jne	$JCC2602
	jmp	$I398
$JCC2602:
; Line 545
	mov	ax,WORD PTR _endcount
	mov	cx,18
	cwd	
	idiv	cx
	mov	cl,6
	shl	ax,cl
	add	ax,OFFSET _swwinsym
	mov	WORD PTR [si+78],ax
; Line 546
	jmp	$I399
$I398:
; Line 552
	cmp	WORD PTR [si],91
	je	$JCC2632
	jmp	$L20020
$JCC2632:
	mov	WORD PTR [si+78],0
	jmp	$L20021
$L20020:
	cmp	WORD PTR [si],5
	je	$JCC2648
	jmp	$L20022
$JCC2648:
	cmp	WORD PTR [si+6],0
	je	$JCC2657
	jmp	$L20022
$JCC2657:
	cmp	WORD PTR [si+8],0
	jl	$JCC2666
	jmp	$L20022
$JCC2666:
	mov	cl,6
	mov	ax,WORD PTR [si+12]
	shl	ax,cl
	add	ax,OFFSET _swhitsym
	mov	WORD PTR [si+78],ax
	jmp	$L20023
$L20022:
	mov	cl,4
	mov	ax,WORD PTR [si+12]
	shl	ax,cl
	add	ax,WORD PTR [si+10]
	mov	cl,6
	shl	ax,cl
	add	ax,OFFSET _swplnsym
	mov	WORD PTR [si+78],ax
$L20023:
$L20021:
$I399:
; Line 554
	lea	ax,WORD PTR [bp-6]	;y
	push	ax
	lea	ax,WORD PTR [bp-2]	;x
	push	ax
	push	si
	call	_movexy
	add	sp,6
; Line 556
	cmp	WORD PTR [bp-2],0	;x
	jl	$JCC2726
	jmp	$I401
$JCC2726:
; Line 557
	mov	ax,0
	mov	WORD PTR [si+2],ax
	mov	WORD PTR [bp-2],ax	;x
; Line 558
	jmp	$I402
$I401:
; Line 559
	cmp	WORD PTR [bp-2],2984	;x
	jge	$JCC2748
	jmp	$I403
$JCC2748:
; Line 560
	mov	ax,2984
	mov	WORD PTR [si+2],ax
	mov	WORD PTR [bp-2],ax	;x
; Line 562
$I403:
$I402:
; Line 567
	cmp	WORD PTR _compplane,0
	je	$JCC2767
	jmp	$I404
$JCC2767:
	cmp	WORD PTR [si],1
	jne	$JCC2775
	jmp	$I405
$JCC2775:
	cmp	WORD PTR [si],7
	jne	$JCC2783
	jmp	$I405
$JCC2783:
	cmp	WORD PTR [si],9
	jne	$JCC2791
	jmp	$I405
$JCC2791:
	cmp	WORD PTR [si],10
	je	$JCC2799
	jmp	$I404
$JCC2799:
$I405:
	mov	bx,WORD PTR _player
	shl	bx,1
	cmp	WORD PTR _endsts[bx],0
	je	$JCC2815
	jmp	$I404
$JCC2815:
; Line 568
	push	si
	call	nearpln
	add	sp,2
; Line 570
$I404:
	push	si
	call	_deletex
	add	sp,2
; Line 571
	push	WORD PTR [si+72]
	push	si
	call	_insertx
	add	sp,4
; Line 573
	cmp	WORD PTR [si+80],0
	jne	$JCC2848
	jmp	$I409
$JCC2848:
; Line 574
	dec	WORD PTR [si+80]
; Line 575
$I409:
	cmp	WORD PTR [si+108],0
	jne	$JCC2860
	jmp	$I410
$JCC2860:
; Line 576
	dec	WORD PTR [si+108]
; Line 577
$I410:
	cmp	WORD PTR [si+116],0
	jne	$JCC2872
	jmp	$I411
$JCC2872:
; Line 578
	dec	WORD PTR [si+116]
; Line 580
$I411:
	cmp	WORD PTR _compplane,0
	je	$JCC2885
	jmp	$I412
$JCC2885:
	cmp	WORD PTR [si+100],0
	jne	$JCC2894
	jmp	$I412
$JCC2894:
	cmp	WORD PTR [si],1
	je	$JCC2902
	jmp	$I412
$JCC2902:
; Line 581
	push	si
	call	refuel
	add	sp,2
; Line 583
$I412:
	cmp	WORD PTR [bp-6],200	;y
	jl	$JCC2919
	jmp	$I414
$JCC2919:
	cmp	WORD PTR [bp-6],0	;y
	jge	$JCC2928
	jmp	$I414
$JCC2928:
; Line 586
	cmp	WORD PTR [si],5
	jne	$JCC2936
	jmp	$I416
$JCC2936:
	cmp	WORD PTR [si],9
	jne	$JCC2944
	jmp	$I416
$JCC2944:
	cmp	WORD PTR [si],10
	je	$JCC2952
	jmp	$I415
$JCC2952:
$I416:
; Line 587
	push	si
	call	_initsmok
	add	sp,2
; Line 588
$I415:
	call	_setvdisp
; Line 589
	push	si
	call	_dispwobj
	add	sp,2
; Line 590
	cmp	WORD PTR _plyrplane,0
	je	$JCC2979
	jmp	$L20026
$JCC2979:
	cmp	WORD PTR [si],91
	jl	$JCC2987
	jmp	$L20024
$JCC2987:
$L20026:
	mov	ax,1
	jmp	$L20025
$L20024:
	mov	ax,0
$L20025:
	jmp	$EX314
; Line 591
; Line 593
$I414:
	mov	ax,0
	jmp	$EX314
; Line 594
$EX314:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_movepln	ENDP
; Line 599
nearpln	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = obt
;	obc = -2
;	i = -4
;	obx = -6
;	r = -8
;	obclr = -10
;	obp = 4
; Line 604
	mov	si,WORD PTR [bp+4]	;obp
; Line 605
	mov	di,WORD PTR _objtop
	add	di,118
; Line 607
	mov	ax,WORD PTR [si+2]
	mov	WORD PTR [bp-6],ax	;obx
; Line 608
	mov	bx,WORD PTR [si+32]
	mov	ax,WORD PTR [bx+42]
	mov	WORD PTR [bp-10],ax	;obclr
; Line 610
	mov	WORD PTR [bp-4],1	;i
	jmp	$F428
$FC429:
	inc	WORD PTR [bp-4]	;i
	add	di,118
$F428:
	cmp	WORD PTR [di+96],1
	je	$JCC3070
	jmp	$FB430
$JCC3070:
; Line 611
	mov	bx,WORD PTR [di+32]
	mov	ax,WORD PTR [bp-10]	;obclr
	cmp	WORD PTR [bx+42],ax
	je	$JCC3084
	jmp	$I431
$JCC3084:
; Line 612
	jmp	$FC429
; Line 614
$I431:
	mov	ax,OFFSET _dispcomp
	push	ax
	push	WORD PTR [di+68]
	call	_equal
	add	sp,4
	cmp	ax,0
	jne	$JCC3108
	jmp	$I433
$JCC3108:
; Line 618
	cmp	WORD PTR _playmode,2
	je	$JCC3118
	jmp	$I435
$JCC3118:
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	mov	ax,WORD PTR [bp-6]	;obx
	cmp	WORD PTR _lcompter[bx],ax
	jle	$JCC3135
	jmp	$I434
$JCC3135:
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	mov	ax,WORD PTR [bp-6]	;obx
	cmp	WORD PTR _rcompter[bx],ax
	jge	$JCC3152
	jmp	$I434
$JCC3152:
$I435:
; Line 621
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	mov	ax,WORD PTR _compnear[bx]
	mov	WORD PTR [bp-2],ax	;obc
	cmp	ax,0
	jne	$JCC3172
	jmp	$I438
$JCC3172:
	mov	bx,WORD PTR [bp-2]	;obc
	mov	ax,WORD PTR [bx+2]
	sub	ax,WORD PTR [di+2]
	push	ax
	call	_abs
	add	sp,2
	mov	cx,WORD PTR [bp-6]	;obx
	sub	cx,WORD PTR [di+2]
	push	cx
	mov	WORD PTR [bp-12],ax
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR [bp-12]
	jl	$JCC3212
	jmp	$I437
$JCC3212:
$I438:
; Line 622
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	mov	WORD PTR _compnear[bx],si
; Line 623
$I437:
$I434:
$I433:
	jmp	$FC429
$FB430:
; Line 624
$EX420:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

nearpln	ENDP
; Line 632
refuel	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,0
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	obp = 4
; Line 636
	mov	si,WORD PTR [bp+4]	;obp
; Line 637
	call	_setvdisp
; Line 638
	mov	ax,9000
	push	ax
	lea	ax,WORD PTR [si+30]
	push	ax
	call	topup
	add	sp,4
	cmp	ax,0
	jne	$JCC3269
	jmp	$I443
$JCC3269:
; Line 639
	push	si
	call	_dispfgge
	add	sp,2
; Line 640
$I443:
	mov	ax,200
	push	ax
	lea	ax,WORD PTR [si+24]
	push	ax
	call	topup
	add	sp,4
	cmp	ax,0
	jne	$JCC3298
	jmp	$I444
$JCC3298:
; Line 641
	push	si
	call	_dispsgge
	add	sp,2
; Line 642
$I444:
	mov	ax,5
	push	ax
	lea	ax,WORD PTR [si+40]
	push	ax
	call	topup
	add	sp,4
	cmp	ax,0
	jne	$JCC3327
	jmp	$I445
$JCC3327:
; Line 643
	push	si
	call	_dispbgge
	add	sp,2
; Line 644
$I445:
	mov	ax,5
	push	ax
	lea	ax,WORD PTR [si+104]
	push	ax
	call	topup
	add	sp,4
	cmp	ax,0
	jne	$JCC3356
	jmp	$I446
$JCC3356:
; Line 645
	push	si
	call	_dispmgge
	add	sp,2
; Line 646
$I446:
	mov	ax,5
	push	ax
	lea	ax,WORD PTR [si+112]
	push	ax
	call	topup
	add	sp,4
	cmp	ax,0
	jne	$JCC3385
	jmp	$I447
$JCC3385:
; Line 647
	push	si
	call	_dispsbgge
	add	sp,2
; Line 648
$I447:
$EX440:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

refuel	ENDP
; Line 654
topup	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	di
	push	si
;	rc = -2
;	max = 6
;	counter = 4
; Line 658
	mov	WORD PTR [bp-2],0	;rc
; Line 659
	mov	bx,WORD PTR [bp+4]	;counter
	mov	ax,WORD PTR [bp+6]	;max
	cmp	WORD PTR [bx],ax
	je	$JCC3427
	jmp	$I452
$JCC3427:
; Line 660
	mov	ax,WORD PTR [bp-2]	;rc
	jmp	$EX450
; Line 661
$I452:
	cmp	WORD PTR [bp+6],20	;max
	jl	$JCC3442
	jmp	$I453
$JCC3442:
; Line 662
	mov	ax,WORD PTR _countmove
	mov	cx,20
	cwd	
	idiv	cx
	cmp	dx,0
	je	$JCC3459
	jmp	$I454
$JCC3459:
; Line 663
	mov	bx,WORD PTR [bp+4]	;counter
	inc	WORD PTR [bx]
; Line 664
	mov	ax,WORD PTR _plyrplane
	mov	WORD PTR [bp-2],ax	;rc
; Line 665
; Line 666
$I454:
	jmp	$I455
$I453:
; Line 667
	mov	ax,WORD PTR [bp+6]	;max
	mov	cx,100
	cwd	
	idiv	cx
	mov	bx,WORD PTR [bp+4]	;counter
	add	WORD PTR [bx],ax
; Line 668
	mov	ax,WORD PTR _plyrplane
	mov	WORD PTR [bp-2],ax	;rc
; Line 669
$I455:
; Line 670
	mov	bx,WORD PTR [bp+4]	;counter
	mov	ax,WORD PTR [bp+6]	;max
	cmp	WORD PTR [bx],ax
	jg	$JCC3506
	jmp	$I456
$JCC3506:
; Line 671
	mov	ax,WORD PTR [bp+6]	;max
	mov	bx,WORD PTR [bp+4]	;counter
	mov	WORD PTR [bx],ax
; Line 672
$I456:
	mov	ax,WORD PTR [bp-2]	;rc
	jmp	$EX450
; Line 673
$EX450:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

topup	ENDP
; Line 680
	PUBLIC	_moveshot
_moveshot	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	x = -2
;	y = -4
;	obp = 4
; Line 685
	mov	si,WORD PTR [bp+4]	;obp
; Line 686
	push	si
	call	_deletex
	add	sp,2
; Line 687
	dec	WORD PTR [si+30]
	cmp	WORD PTR [si+30],0
	je	$JCC3559
	jmp	$I463
$JCC3559:
; Line 688
	push	si
	call	_deallobj
	add	sp,2
; Line 689
	mov	ax,0
	jmp	$EX459
; Line 690
; Line 692
$I463:
	lea	ax,WORD PTR [bp-4]	;y
	push	ax
	lea	cx,WORD PTR [bp-2]	;x
	push	cx
	push	si
	call	_movexy
	add	sp,6
; Line 695
	cmp	WORD PTR [bp-4],200	;y
	jl	$JCC3597
	jmp	$I466
$JCC3597:
	mov	bx,WORD PTR [bp-2]	;x
	mov	al,BYTE PTR _ground[bx]
	sub	ah,ah
	cmp	ax,WORD PTR [bp-4]	;y
	jl	$JCC3614
	jmp	$I466
$JCC3614:
	cmp	WORD PTR [bp-2],0	;x
	jge	$JCC3623
	jmp	$I466
$JCC3623:
	cmp	WORD PTR [bp-2],3000	;x
	jge	$JCC3633
	jmp	$I465
$JCC3633:
$I466:
; Line 696
	push	si
	call	_deallobj
	add	sp,2
; Line 697
	mov	ax,0
	jmp	$EX459
; Line 698
; Line 700
$I465:
	push	WORD PTR [si+72]
	push	si
	call	_insertx
	add	sp,4
; Line 701
	mov	WORD PTR [si+78],131
; Line 702
	mov	ax,1
	jmp	$EX459
; Line 703
$EX459:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_moveshot	ENDP
; Line 708
	PUBLIC	_movebomb
_movebomb	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	x = -2
;	y = -4
;	obp = 4
; Line 713
	mov	si,WORD PTR [bp+4]	;obp
; Line 715
	push	si
	call	_deletex
	add	sp,2
; Line 717
	cmp	WORD PTR [si+30],0
	jl	$JCC3703
	jmp	$I473
$JCC3703:
; Line 718
	push	si
	call	_deallobj
	add	sp,2
; Line 719
	mov	WORD PTR [si],91
; Line 720
	call	_setvdisp
; Line 721
	push	si
	call	_dispwobj
	add	sp,2
; Line 722
	mov	ax,0
	jmp	$EX469
; Line 723
; Line 725
$I473:
	push	si
	call	adjustfall
	add	sp,2
; Line 727
	cmp	WORD PTR [si+8],0
	jle	$JCC3746
	jmp	$I475
$JCC3746:
; Line 728
	mov	ax,20
	push	ax
	push	si
	call	_initsound
	add	sp,4
; Line 730
$I475:
	lea	ax,WORD PTR [bp-4]	;y
	push	ax
	lea	cx,WORD PTR [bp-2]	;x
	push	cx
	push	si
	call	_movexy
	add	sp,6
; Line 732
	cmp	WORD PTR [bp-4],0	;y
	jge	$JCC3781
	jmp	$I477
$JCC3781:
	cmp	WORD PTR [bp-2],0	;x
	jge	$JCC3790
	jmp	$I477
$JCC3790:
	cmp	WORD PTR [bp-2],3000	;x
	jge	$JCC3800
	jmp	$I476
$JCC3800:
$I477:
; Line 733
	push	si
	call	_deallobj
	add	sp,2
; Line 734
	push	si
	call	_stopsound
	add	sp,2
; Line 735
	mov	WORD PTR [si],91
; Line 736
	call	_setvdisp
; Line 737
	push	si
	call	_dispwobj
	add	sp,2
; Line 738
	mov	ax,0
	jmp	$EX469
; Line 739
; Line 741
$I476:
	push	si
	call	symangle
	add	sp,2
	mov	cl,4
	shl	ax,cl
	add	ax,OFFSET _swbmbsym
	mov	WORD PTR [si+78],ax
; Line 742
	push	WORD PTR [si+72]
	push	si
	call	_insertx
	add	sp,4
; Line 744
	cmp	WORD PTR [bp-4],200	;y
	jge	$JCC3871
	jmp	$I479
$JCC3871:
; Line 745
	mov	ax,0
	jmp	$EX469
; Line 747
$I479:
	call	_setvdisp
; Line 748
	push	si
	call	_dispwobj
	add	sp,2
; Line 749
	mov	ax,1
	jmp	$EX469
; Line 750
$EX469:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_movebomb	ENDP
; Line 755
adjustfall	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,0
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	obp = 4
; Line 759
	mov	si,WORD PTR [bp+4]	;obp
; Line 760
	dec	WORD PTR [si+30]
	cmp	WORD PTR [si+30],0
	je	$JCC3925
	jmp	$I483
$JCC3925:
; Line 761
	cmp	WORD PTR [si+8],0
	jl	$JCC3934
	jmp	$I484
$JCC3934:
; Line 762
	cmp	WORD PTR [si+6],0
	jl	$JCC3943
	jmp	$I485
$JCC3943:
; Line 763
	inc	WORD PTR [si+6]
; Line 764
	jmp	$I486
$I485:
; Line 765
	cmp	WORD PTR [si+6],0
	jg	$JCC3958
	jmp	$I487
$JCC3958:
; Line 766
	dec	WORD PTR [si+6]
; Line 767
$I487:
$I486:
$I484:
	cmp	WORD PTR [si+8],-10
	jg	$JCC3970
	jmp	$I488
$JCC3970:
; Line 768
	dec	WORD PTR [si+8]
; Line 769
$I488:
	mov	WORD PTR [si+30],5
; Line 770
; Line 771
$I483:
$EX481:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

adjustfall	ENDP
; Line 776
symangle	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,0
	call	__aNchkstk
	push	di
	push	si
;	register si = dx
;	register di = dy
;	ob = 4
; Line 780
	mov	bx,WORD PTR [bp+4]	;ob
	mov	si,WORD PTR [bx+6]
; Line 781
	mov	bx,WORD PTR [bp+4]	;ob
	mov	di,WORD PTR [bx+8]
; Line 782
	cmp	si,0
	je	$JCC4015
	jmp	$I493
$JCC4015:
; Line 783
	cmp	di,0
	jl	$JCC4023
	jmp	$I494
$JCC4023:
; Line 784
	mov	ax,6
	jmp	$EX490
; Line 785
	jmp	$I495
$I494:
; Line 786
	cmp	di,0
	jg	$JCC4040
	jmp	$I496
$JCC4040:
; Line 787
	mov	ax,2
	jmp	$EX490
; Line 788
	jmp	$I497
$I496:
; Line 789
	mov	ax,6
	jmp	$EX490
$I497:
$I495:
; Line 790
	jmp	$I498
$I493:
; Line 791
	cmp	si,0
	jg	$JCC4066
	jmp	$I499
$JCC4066:
; Line 792
	cmp	di,0
	jl	$JCC4074
	jmp	$I500
$JCC4074:
; Line 793
	mov	ax,7
	jmp	$EX490
; Line 794
	jmp	$I501
$I500:
; Line 795
	cmp	di,0
	jg	$JCC4091
	jmp	$I502
$JCC4091:
; Line 796
	mov	ax,1
	jmp	$EX490
; Line 797
	jmp	$I503
$I502:
; Line 798
	mov	ax,0
	jmp	$EX490
$I503:
$I501:
; Line 799
	jmp	$I504
$I499:
; Line 800
	cmp	di,0
	jl	$JCC4117
	jmp	$I505
$JCC4117:
; Line 801
	mov	ax,5
	jmp	$EX490
; Line 802
	jmp	$I506
$I505:
; Line 803
	cmp	di,0
	jg	$JCC4134
	jmp	$I507
$JCC4134:
; Line 804
	mov	ax,3
	jmp	$EX490
; Line 805
	jmp	$I508
$I507:
; Line 806
	mov	ax,4
	jmp	$EX490
$I508:
$I506:
$I504:
$I498:
; Line 807
$EX490:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

symangle	ENDP
; Line 812
	PUBLIC	_movemiss
_movemiss	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	x = -6
;	y = -8
;	angle = -4
;	obt = -2
;	obp = 4
; Line 818
	mov	si,WORD PTR [bp+4]	;obp
; Line 820
	push	si
	call	_deletex
	add	sp,2
; Line 822
	cmp	WORD PTR [si+30],0
	jl	$JCC4185
	jmp	$I517
$JCC4185:
; Line 823
	push	si
	call	_deallobj
	add	sp,2
; Line 824
	mov	WORD PTR [si],91
; Line 825
	call	_setvdisp
; Line 826
	push	si
	call	_dispwobj
	add	sp,2
; Line 827
	mov	ax,0
	jmp	$EX511
; Line 828
; Line 830
$I517:
	cmp	WORD PTR [si],1
	je	$JCC4220
	jmp	$I518
$JCC4220:
; Line 832
	mov	ax,WORD PTR [si+110]
	mov	WORD PTR [bp-2],ax	;obt
	mov	ax,WORD PTR [bp-2]	;obt
	cmp	WORD PTR [si+32],ax
	jne	$JCC4237
	jmp	$I519
$JCC4237:
	test	BYTE PTR [si+30],1
	jne	$JCC4246
	jmp	$I519
$JCC4246:
; Line 833
	mov	bx,WORD PTR [bp-2]	;obt
	cmp	WORD PTR [bx+110],0
	jne	$JCC4258
	jmp	$I520
$JCC4258:
; Line 834
	mov	bx,WORD PTR [bp-2]	;obt
	mov	ax,WORD PTR [bx+110]
	mov	WORD PTR [bp-2],ax	;obt
; Line 835
$I520:
	mov	ax,0
	push	ax
	mov	ax,0
	push	ax
	mov	bx,WORD PTR [bp-2]	;obt
	push	WORD PTR [bx+4]
	mov	bx,WORD PTR [bp-2]	;obt
	push	WORD PTR [bx+2]
	push	si
	call	_aim
	add	sp,10
; Line 837
	mov	ax,WORD PTR [si+10]
	add	ax,WORD PTR [si+18]
	add	ax,16
	mov	cx,16
	cwd	
	idiv	cx
	mov	WORD PTR [si+10],dx
	mov	WORD PTR [bp-4],dx	;angle
; Line 839
	mov	ax,WORD PTR [bp-4]	;angle
	cwd	
	idiv	cx
	mov	bx,dx
	shl	bx,1
	mov	ax,WORD PTR _sintab[bx]
	imul	WORD PTR [si+14]
	push	ax
	mov	ax,WORD PTR [bp-4]	;angle
	add	ax,4
	cwd	
	idiv	cx
	mov	bx,dx
	shl	bx,1
	mov	ax,WORD PTR _sintab[bx]
	imul	WORD PTR [si+14]
	push	ax
	push	si
	call	_setdxdy
	add	sp,6
; Line 840
; Line 841
$I519:
	lea	ax,WORD PTR [bp-8]	;y
	push	ax
	lea	cx,WORD PTR [bp-6]	;x
	push	cx
	push	si
	call	_movexy
	add	sp,6
; Line 842
	dec	WORD PTR [si+30]
	cmp	WORD PTR [si+30],0
	jne	$JCC4388
	jmp	$I523
$JCC4388:
	cmp	WORD PTR [bp-8],300	;y
	jge	$JCC4398
	jmp	$I522
$JCC4398:
$I523:
; Line 843
	mov	WORD PTR [si],5
; Line 844
	inc	WORD PTR [si+30]
; Line 845
; Line 846
$I522:
	jmp	$I524
$I518:
; Line 847
	push	si
	call	adjustfall
	add	sp,2
; Line 848
	mov	ax,WORD PTR [si+10]
	inc	ax
	mov	cx,16
	cwd	
	idiv	cx
	mov	WORD PTR [si+10],dx
; Line 849
	lea	ax,WORD PTR [bp-8]	;y
	push	ax
	lea	ax,WORD PTR [bp-6]	;x
	push	ax
	push	si
	call	_movexy
	add	sp,6
; Line 850
$I524:
; Line 852
	cmp	WORD PTR [bp-8],0	;y
	jge	$JCC4452
	jmp	$I526
$JCC4452:
	cmp	WORD PTR [bp-6],0	;x
	jge	$JCC4461
	jmp	$I526
$JCC4461:
	cmp	WORD PTR [bp-6],3000	;x
	jge	$JCC4471
	jmp	$I525
$JCC4471:
$I526:
; Line 853
	push	si
	call	_deallobj
	add	sp,2
; Line 854
	mov	WORD PTR [si],91
; Line 855
	call	_setvdisp
; Line 856
	push	si
	call	_dispwobj
	add	sp,2
; Line 857
	mov	ax,0
	jmp	$EX511
; Line 858
; Line 860
$I525:
	mov	cl,4
	mov	ax,WORD PTR [si+10]
	shl	ax,cl
	add	ax,OFFSET _swmscsym
	mov	WORD PTR [si+78],ax
; Line 861
	push	WORD PTR [si+72]
	push	si
	call	_insertx
	add	sp,4
; Line 863
	cmp	WORD PTR [bp-8],200	;y
	jge	$JCC4531
	jmp	$I527
$JCC4531:
; Line 864
	mov	ax,0
	jmp	$EX511
; Line 866
$I527:
	call	_setvdisp
; Line 867
	push	si
	call	_dispwobj
	add	sp,2
; Line 868
	mov	ax,1
	jmp	$EX511
; Line 869
$EX511:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_movemiss	ENDP
; Line 874
	PUBLIC	_moveburst
_moveburst	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	x = -2
;	y = -4
;	obp = 4
; Line 879
	mov	si,WORD PTR [bp+4]	;obp
; Line 880
	push	si
	call	_deletex
	add	sp,2
; Line 881
	cmp	WORD PTR [si+30],0
	jl	$JCC4589
	jmp	$I534
$JCC4589:
; Line 882
	mov	bx,WORD PTR [si+32]
	mov	WORD PTR [bx+110],0
; Line 883
	push	si
	call	_deallobj
	add	sp,2
; Line 884
	mov	ax,0
	jmp	$EX530
; Line 885
; Line 887
$I534:
	push	si
	call	adjustfall
	add	sp,2
; Line 888
	lea	ax,WORD PTR [bp-4]	;y
	push	ax
	lea	cx,WORD PTR [bp-2]	;x
	push	cx
	push	si
	call	_movexy
	add	sp,6
; Line 890
	mov	bx,WORD PTR [bp-2]	;x
	mov	al,BYTE PTR _ground[bx]
	sub	ah,ah
	cmp	ax,WORD PTR [bp-4]	;y
	jl	$JCC4649
	jmp	$I536
$JCC4649:
	cmp	WORD PTR [bp-2],0	;x
	jge	$JCC4658
	jmp	$I536
$JCC4658:
	cmp	WORD PTR [bp-2],3000	;x
	jge	$JCC4668
	jmp	$I535
$JCC4668:
$I536:
; Line 891
	mov	bx,WORD PTR [si+32]
	mov	WORD PTR [bx+110],0
; Line 892
	push	si
	call	_deallobj
	add	sp,2
; Line 893
	mov	ax,0
	jmp	$EX530
; Line 894
; Line 896
$I535:
	mov	bx,WORD PTR [si+32]
	mov	WORD PTR [bx+110],si
; Line 897
	mov	cl,4
	mov	al,BYTE PTR [si+30]
	and	ax,1
	shl	ax,cl
	add	ax,OFFSET _swbstsym
	mov	WORD PTR [si+78],ax
; Line 898
	push	WORD PTR [si+72]
	push	si
	call	_insertx
	add	sp,4
; Line 899
	cmp	WORD PTR [bp-4],200	;y
	jl	$JCC4731
	jmp	$L20027
$JCC4731:
	mov	ax,1
	jmp	$L20028
$L20027:
	mov	ax,0
$L20028:
	jmp	$EX530
; Line 900
$EX530:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_moveburst	ENDP
; Line 906
	PUBLIC	_movetarg
_movetarg	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	di
	push	si
;	r = -2
;	register si = obp
;	register di = ob
;	obt = 4
; Line 911
	mov	di,WORD PTR [bp+4]	;obt
; Line 912
	mov	si,WORD PTR _objtop
; Line 913
	mov	WORD PTR [di+20],0
; Line 923
	cmp	WORD PTR _gamenum,0
	jne	$JCC4782
	jmp	$I544
$JCC4782:
	cmp	WORD PTR [di],6
	je	$JCC4790
	jmp	$I544
$JCC4790:
	cmp	WORD PTR [si],1
	jne	$JCC4798
	jmp	$I545
$JCC4798:
	cmp	WORD PTR [si],7
	jne	$JCC4806
	jmp	$I545
$JCC4806:
	cmp	WORD PTR [si],9
	jne	$JCC4814
	jmp	$I545
$JCC4814:
	cmp	WORD PTR [si],10
	je	$JCC4822
	jmp	$I544
$JCC4822:
$I545:
	mov	ax,WORD PTR [si+42]
	cmp	WORD PTR [di+42],ax
	jne	$JCC4833
	jmp	$I544
$JCC4833:
	cmp	WORD PTR _gamenum,1
	jle	$JCC4843
	jmp	$I546
$JCC4843:
	test	BYTE PTR _countmove,1
	jne	$JCC4853
	jmp	$I544
$JCC4853:
$I546:
	push	WORD PTR [si+4]
	push	WORD PTR [si+2]
	push	WORD PTR [di+4]
	push	WORD PTR [di+2]
	call	_range
	add	sp,8
	mov	WORD PTR [bp-2],ax	;r
	cmp	ax,0
	jg	$JCC4882
	jmp	$I544
$JCC4882:
	mov	ax,WORD PTR _targrnge
	cmp	WORD PTR [bp-2],ax	;r
	jl	$JCC4893
	jmp	$I544
$JCC4893:
; Line 924
	mov	WORD PTR [di+20],si
	push	si
	push	di
	call	_initshot
	add	sp,4
; Line 926
$I544:
	dec	WORD PTR [di+26]
	cmp	WORD PTR [di+26],0
	jl	$JCC4916
	jmp	$I547
$JCC4916:
; Line 927
	mov	WORD PTR [di+26],0
; Line 929
$I547:
; Line 931
	cmp	WORD PTR [di],6
	je	$JCC4929
	jmp	$L20029
$JCC4929:
	mov	ax,WORD PTR [di+12]
	mov	cl,6
	shl	ax,cl
	add	ax,OFFSET _swtrgsym
	jmp	$L20030
$L20029:
	mov	ax,OFFSET _swhtrsym
$L20030:
	mov	WORD PTR [di+78],ax
; Line 932
	mov	ax,1
	jmp	$EX539
; Line 933
$EX539:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_movetarg	ENDP
; Line 938
	PUBLIC	_moveexpl
_moveexpl	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	x = -2
;	y = -4
;	register di = orient
;	obp = 4
; Line 944
	mov	si,WORD PTR [bp+4]	;obp
; Line 945
	mov	di,WORD PTR [si+12]
; Line 946
	push	si
	call	_deletex
	add	sp,2
; Line 947
	cmp	WORD PTR [si+30],0
	jl	$JCC4993
	jmp	$I555
$JCC4993:
; Line 948
	cmp	di,0
	jne	$JCC5001
	jmp	$I556
$JCC5001:
; Line 949
	push	si
	call	_stopsound
	add	sp,2
; Line 950
$I556:
	push	si
	call	_deallobj
	add	sp,2
; Line 951
	mov	ax,0
	jmp	$EX550
; Line 952
; Line 954
$I555:
	dec	WORD PTR [si+30]
	cmp	WORD PTR [si+30],0
	je	$JCC5033
	jmp	$I557
$JCC5033:
; Line 955
	cmp	WORD PTR [si+8],0
	jl	$JCC5042
	jmp	$I558
$JCC5042:
; Line 956
	cmp	WORD PTR [si+6],0
	jl	$JCC5051
	jmp	$I559
$JCC5051:
; Line 957
	inc	WORD PTR [si+6]
; Line 958
	jmp	$I560
$I559:
; Line 959
	cmp	WORD PTR [si+6],0
	jg	$JCC5066
	jmp	$I561
$JCC5066:
; Line 960
	dec	WORD PTR [si+6]
; Line 961
$I561:
$I560:
$I558:
; Line 962
	cmp	WORD PTR [si+12],0
	jne	$JCC5078
	jmp	$I564
$JCC5078:
	cmp	WORD PTR [si+8],-10
	jle	$JCC5087
	jmp	$I563
$JCC5087:
$I564:
	cmp	WORD PTR [si+12],0
	je	$JCC5096
	jmp	$I562
$JCC5096:
	mov	ax,WORD PTR _gminspeed
	neg	ax
	cmp	WORD PTR [si+8],ax
	jg	$JCC5109
	jmp	$I562
$JCC5109:
$I563:
; Line 963
	dec	WORD PTR [si+8]
; Line 964
$I562:
	mov	WORD PTR [si+30],3
; Line 965
; Line 967
$I557:
	lea	ax,WORD PTR [bp-4]	;y
	push	ax
	lea	cx,WORD PTR [bp-2]	;x
	push	cx
	push	si
	call	_movexy
	add	sp,6
; Line 970
	mov	bx,WORD PTR [bp-2]	;x
	mov	al,BYTE PTR _ground[bx]
	sub	ah,ah
	cmp	ax,WORD PTR [bp-4]	;y
	jl	$JCC5149
	jmp	$I566
$JCC5149:
	cmp	WORD PTR [bp-2],0	;x
	jge	$JCC5158
	jmp	$I566
$JCC5158:
	cmp	WORD PTR [bp-2],3000	;x
	jge	$JCC5168
	jmp	$I565
$JCC5168:
$I566:
; Line 971
	cmp	di,0
	jne	$JCC5176
	jmp	$I567
$JCC5176:
; Line 972
	push	si
	call	_stopsound
	add	sp,2
; Line 973
$I567:
	push	si
	call	_deallobj
	add	sp,2
; Line 974
	mov	ax,0
	jmp	$EX550
; Line 975
; Line 976
$I565:
	inc	WORD PTR [si+26]
; Line 978
	push	WORD PTR [si+72]
	push	si
	call	_insertx
	add	sp,4
; Line 979
	mov	cl,4
	mov	ax,WORD PTR [si+12]
	shl	ax,cl
	add	ax,OFFSET _swexpsym
	mov	WORD PTR [si+78],ax
; Line 980
	cmp	WORD PTR [bp-4],200	;y
	jl	$JCC5232
	jmp	$L20031
$JCC5232:
	mov	ax,1
	jmp	$L20032
$L20031:
	mov	ax,0
$L20032:
	jmp	$EX550
; Line 981
$EX550:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_moveexpl	ENDP
; Line 986
	PUBLIC	_movesmok
_movesmok	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,0
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = state
;	obp = 4
; Line 991
	mov	si,WORD PTR [bp+4]	;obp
; Line 996
	dec	WORD PTR [si+30]
	cmp	WORD PTR [si+30],0
	jne	$JCC5276
	jmp	$I574
$JCC5276:
	mov	bx,WORD PTR [si+32]
	mov	di,WORD PTR [bx]
	cmp	di,5
	jne	$JCC5289
	jmp	$I573
$JCC5289:
	cmp	di,9
	jne	$JCC5297
	jmp	$I573
$JCC5297:
	cmp	di,10
	jne	$JCC5305
	jmp	$I573
$JCC5305:
	cmp	di,4
	jne	$JCC5313
	jmp	$I573
$JCC5313:
$I574:
; Line 997
	push	si
	call	_deallobj
	add	sp,2
; Line 998
	mov	ax,0
	jmp	$EX570
; Line 999
; Line 1000
$I573:
	mov	ax,WORD PTR [si+42]
	add	ax,128
	mov	WORD PTR [si+78],ax
; Line 1002
	mov	ax,1
	jmp	$EX570
; Line 1003
$EX570:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_movesmok	ENDP
; Line 1008
	PUBLIC	_moveflck
_moveflck	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	x = -2
;	y = -4
;	obp = 4
; Line 1013
	mov	si,WORD PTR [bp+4]	;obp
; Line 1014
	push	si
	call	_deletex
	add	sp,2
; Line 1016
	cmp	WORD PTR [si+30],-1
	je	$JCC5377
	jmp	$I581
$JCC5377:
; Line 1017
	call	_setvdisp
; Line 1018
	push	si
	call	_dispwobj
	add	sp,2
; Line 1019
	push	si
	call	_deallobj
	add	sp,2
; Line 1020
	mov	ax,0
	jmp	$EX577
; Line 1021
; Line 1023
$I581:
	dec	WORD PTR [si+30]
	cmp	WORD PTR [si+30],0
	je	$JCC5412
	jmp	$I582
$JCC5412:
; Line 1024
	cmp	WORD PTR [si+12],1
	sbb	ax,ax
	neg	ax
	mov	WORD PTR [si+12],ax
; Line 1025
	mov	WORD PTR [si+30],5
; Line 1026
; Line 1028
$I582:
	cmp	WORD PTR [si+2],370
	jge	$JCC5438
	jmp	$I584
$JCC5438:
	cmp	WORD PTR [si+2],2630
	jg	$JCC5448
	jmp	$I583
$JCC5448:
$I584:
; Line 1029
	neg	WORD PTR [si+6]
; Line 1031
$I583:
	lea	ax,WORD PTR [bp-4]	;y
	push	ax
	lea	ax,WORD PTR [bp-2]	;x
	push	ax
	push	si
	call	_movexy
	add	sp,6
; Line 1032
	push	WORD PTR [si+72]
	push	si
	call	_insertx
	add	sp,4
; Line 1033
	mov	cl,6
	mov	ax,WORD PTR [si+12]
	shl	ax,cl
	add	ax,OFFSET _swflksym
	mov	WORD PTR [si+78],ax
; Line 1034
	call	_setvdisp
; Line 1035
	push	si
	call	_dispwobj
	add	sp,2
; Line 1036
	mov	ax,1
	jmp	$EX577
; Line 1037
$EX577:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_moveflck	ENDP
; Line 1042
	PUBLIC	_movebird
_movebird	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	x = -2
;	y = -4
;	obp = 4
; Line 1047
	mov	si,WORD PTR [bp+4]	;obp
; Line 1049
	push	si
	call	_deletex
	add	sp,2
; Line 1051
	cmp	WORD PTR [si+30],-1
	je	$JCC5541
	jmp	$I591
$JCC5541:
; Line 1052
	push	si
	call	_deallobj
	add	sp,2
; Line 1053
	mov	ax,0
	jmp	$EX587
; Line 1054
; Line 1055
	jmp	$I592
$I591:
	cmp	WORD PTR [si+30],-2
	je	$JCC5566
	jmp	$I593
$JCC5566:
; Line 1056
	neg	WORD PTR [si+8]
; Line 1057
	mov	al,BYTE PTR _countmove
	and	ax,7
	sub	ax,4
	mov	WORD PTR [si+6],ax
; Line 1058
	mov	WORD PTR [si+30],4
; Line 1059
; Line 1060
	jmp	$I594
$I593:
	dec	WORD PTR [si+30]
	cmp	WORD PTR [si+30],0
	je	$JCC5601
	jmp	$I595
$JCC5601:
; Line 1061
	cmp	WORD PTR [si+12],1
	sbb	ax,ax
	neg	ax
	mov	WORD PTR [si+12],ax
; Line 1062
	mov	WORD PTR [si+30],4
; Line 1063
; Line 1065
$I595:
$I594:
$I592:
	lea	ax,WORD PTR [bp-4]	;y
	push	ax
	lea	cx,WORD PTR [bp-2]	;x
	push	cx
	push	si
	call	_movexy
	add	sp,6
; Line 1067
	push	WORD PTR [si+72]
	push	si
	call	_insertx
	add	sp,4
; Line 1068
	mov	ax,WORD PTR [si+12]
	shl	ax,1
	add	ax,OFFSET _swbrdsym
	mov	WORD PTR [si+78],ax
; Line 1070
	cmp	WORD PTR [bp-4],200	;y
	jl	$JCC5663
	jmp	$I597
$JCC5663:
	mov	bx,WORD PTR [bp-2]	;x
	mov	al,BYTE PTR _ground[bx]
	sub	ah,ah
	cmp	ax,WORD PTR [bp-4]	;y
	jl	$JCC5680
	jmp	$I597
$JCC5680:
	cmp	WORD PTR [bp-2],0	;x
	jge	$JCC5689
	jmp	$I597
$JCC5689:
	cmp	WORD PTR [bp-2],3000	;x
	jge	$JCC5699
	jmp	$I596
$JCC5699:
$I597:
; Line 1071
	mov	ax,WORD PTR [si+8]
	sub	WORD PTR [si+4],ax
; Line 1072
	mov	WORD PTR [si+30],-2
; Line 1073
	mov	ax,0
	jmp	$EX587
; Line 1074
; Line 1075
$I596:
	mov	ax,1
	jmp	$EX587
; Line 1076
$EX587:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_movebird	ENDP
; Line 1082
	PUBLIC	_moveox
_moveox	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,0
	call	__aNchkstk
	push	di
	push	si
;	ob = 4
; Line 1085
	mov	bx,WORD PTR [bp+4]	;ob
	cmp	WORD PTR [bx],6
	jne	$JCC5750
	jmp	$L20037
$JCC5750:
	mov	ax,1
	jmp	$L20038
$L20037:
	mov	ax,0
$L20038:
	mov	cl,6
	shl	ax,cl
	add	ax,OFFSET _swoxsym
	mov	bx,WORD PTR [bp+4]	;ob
	mov	WORD PTR [bx+78],ax
; Line 1086
	mov	ax,1
	jmp	$EX600
; Line 1087
$EX600:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_moveox	ENDP
; Line 1093
	PUBLIC	_crashpln
_crashpln	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,0
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = obo
;	obp = 4
; Line 1097
	mov	si,WORD PTR [bp+4]	;obp
; Line 1099
	cmp	WORD PTR [si+6],0
	jl	$JCC5807
	jmp	$I606
$JCC5807:
; Line 1100
	mov	ax,WORD PTR [si+10]
	add	ax,2
	mov	cx,16
	cwd	
	idiv	cx
	mov	WORD PTR [si+10],dx
; Line 1101
	jmp	$I607
$I606:
; Line 1102
	mov	ax,WORD PTR [si+10]
	add	ax,14
	mov	cx,16
	cwd	
	idiv	cx
	mov	WORD PTR [si+10],dx
$I607:
; Line 1104
	cmp	WORD PTR [si],92
	jge	$JCC5848
	jmp	$L20041
$JCC5848:
	mov	ax,93
	jmp	$L20042
$L20041:
	mov	ax,4
$L20042:
	mov	WORD PTR [si],ax
; Line 1105
	mov	WORD PTR [si+100],0
; Line 1106
	mov	ax,0
	mov	WORD PTR [si+14],ax
	mov	WORD PTR [si+50],ax
	mov	WORD PTR [si+48],ax
	mov	WORD PTR [si+8],ax
	mov	WORD PTR [si+6],ax
; Line 1108
	mov	ax,118
	imul	WORD PTR [si+56]
	mov	di,ax
	add	di,OFFSET _oobjects
; Line 1111
	mov	ax,WORD PTR [di+2]
	sub	ax,WORD PTR [si+2]
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,32
	jl	$JCC5915
	jmp	$L20039
$JCC5915:
	mov	ax,WORD PTR [di+4]
	sub	ax,WORD PTR [si+4]
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,32
	jl	$JCC5936
	jmp	$L20039
$JCC5936:
	mov	WORD PTR [si+26],20
	jmp	$L20040
$L20039:
	mov	WORD PTR [si+26],10
$L20040:
; Line 1113
$EX603:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_crashpln	ENDP
; Line 1118
	PUBLIC	_hitpln
_hitpln	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,0
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	obp = 4
; Line 1122
	mov	si,WORD PTR [bp+4]	;obp
; Line 1123
	mov	ax,0
	mov	WORD PTR [si+50],ax
	mov	WORD PTR [si+48],ax
; Line 1124
	mov	WORD PTR [si+26],10
; Line 1125
	mov	WORD PTR [si],5
; Line 1126
	mov	WORD PTR [si+100],0
; Line 1127
$EX609:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_hitpln	ENDP
; Line 1132
	PUBLIC	_stallpln
_stallpln	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,0
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	obp = 4
; Line 1136
	mov	si,WORD PTR [bp+4]	;obp
; Line 1137
	mov	ax,0
	mov	WORD PTR [si+6],ax
	mov	WORD PTR [si+12],ax
	mov	WORD PTR [si+50],ax
	mov	WORD PTR [si+48],ax
; Line 1138
	mov	WORD PTR [si+10],14
; Line 1139
	mov	WORD PTR [si+14],0
; Line 1140
	mov	WORD PTR [si+8],0
; Line 1141
	mov	WORD PTR [si+26],6
; Line 1143
	cmp	WORD PTR [si],92
	jge	$JCC6055
	jmp	$L20043
$JCC6055:
	mov	ax,94
	jmp	$L20044
$L20043:
	cmp	WORD PTR [si],9
	je	$JCC6069
	jmp	$L20045
$JCC6069:
	mov	ax,10
	jmp	$L20046
$L20045:
	mov	ax,7
$L20046:
$L20044:
	mov	WORD PTR [si],ax
; Line 1144
	mov	WORD PTR [si+100],0
; Line 1145
$EX612:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_stallpln	ENDP
; Line 1151
	PUBLIC	_insertx
_insertx	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,0
	call	__aNchkstk
	push	di
	push	si
;	register si = obs
;	register di = obx
;	obp = 6
;	ob = 4
; Line 1156
	mov	si,WORD PTR [bp+6]	;obp
; Line 1157
	mov	bx,WORD PTR [bp+4]	;ob
	mov	di,WORD PTR [bx+2]
; Line 1158
	cmp	WORD PTR [si+2],di
	jg	$JCC6119
	jmp	$I619
$JCC6119:
; Line 1159
$D620:
; Line 1160
	mov	si,WORD PTR [si+74]
; Line 1161
$DC621:
	cmp	WORD PTR [si+2],di
	jle	$JCC6130
	jmp	$D620
$JCC6130:
$DB622:
; Line 1162
	jmp	$I623
$I619:
; Line 1163
$FC625:
	cmp	WORD PTR [si+2],di
	jle	$JCC6141
	jmp	$FB626
$JCC6141:
; Line 1164
	mov	si,WORD PTR [si+72]
	jmp	$FC625
$FB626:
; Line 1165
	mov	si,WORD PTR [si+74]
; Line 1166
$I623:
; Line 1167
	mov	ax,WORD PTR [si+72]
	mov	bx,WORD PTR [bp+4]	;ob
	mov	WORD PTR [bx+72],ax
; Line 1168
	mov	bx,WORD PTR [bp+4]	;ob
	mov	WORD PTR [bx+74],si
; Line 1169
	mov	ax,WORD PTR [bp+4]	;ob
	mov	bx,WORD PTR [si+72]
	mov	WORD PTR [bx+74],ax
; Line 1170
	mov	ax,WORD PTR [bp+4]	;ob
	mov	WORD PTR [si+72],ax
; Line 1171
$EX616:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_insertx	ENDP
; Line 1177
	PUBLIC	_deletex
_deletex	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,0
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	obp = 4
; Line 1181
	mov	si,WORD PTR [bp+4]	;obp
; Line 1182
	mov	ax,WORD PTR [si+74]
	mov	bx,WORD PTR [si+72]
	mov	WORD PTR [bx+74],ax
; Line 1183
	mov	ax,WORD PTR [si+72]
	mov	bx,WORD PTR [si+74]
	mov	WORD PTR [bx+72],ax
; Line 1184
$EX628:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_deletex	ENDP
_TEXT	ENDS
END
