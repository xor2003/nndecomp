;	Static Name Aliases
;
;	$S156_dispoff	EQU	dispoff
;	$S157_scrtype	EQU	scrtype
;	$S158_grndsave	EQU	grndsave
;	$S159_dispg	EQU	dispg
;	$S160_drawpnt	EQU	drawpnt
;	$S161_drawsym	EQU	drawsym
;	$S162_palette	EQU	palette
;	$S163_spcbirds	EQU	spcbirds
;	$S417_videoram	EQU	videoram
	TITLE   C:\SWGRPHA.C
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
PUBLIC  _fill
EXTRN	_trap14:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_movmem:NEAR
EXTRN	_swbrdsym:DWORD
EXTRN	_swplnsym:BYTE
EXTRN	_swhitsym:BYTE
EXTRN	_swbmbsym:BYTE
EXTRN	_swtrgsym:BYTE
EXTRN	_swwinsym:BYTE
EXTRN	_swhtrsym:BYTE
EXTRN	_swexpsym:BYTE
EXTRN	_swflksym:BYTE
EXTRN	_swbrdsym:DWORD
EXTRN	_swoxsym:BYTE
EXTRN	_displx:WORD
EXTRN	_disprx:WORD
EXTRN	_dispdx:WORD
EXTRN	_auxdisp:BYTE
EXTRN	_ground:BYTE
EXTRN	_dispinit:WORD
EXTRN	_objtop:WORD
EXTRN	_deltop:WORD
EXTRN	_forcdisp:WORD
_DATA      SEGMENT
$S162_palette	DW	00H
	DW	037H
	DW	0700H
	DW	0777H
	DW	00H
	DW	00H
	DW	00H
	DW	070H
	DW	00H
	DW	0433H
	DW	0420H
	DW	0320H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
_fill	DB	00H
	DB	03H
	DB	03H
	DB	03H
	DB	0cH
	DB	0fH
	DB	0fH
	DB	0fH
	DB	0cH
	DB	0fH
	DB	0fH
	DB	0fH
	DB	0cH
	DB	0fH
	DB	0fH
	DB	0fH
	DB	030H
	DB	033H
	DB	033H
	DB	033H
	DB	03cH
	DB	03fH
	DB	03fH
	DB	03fH
	DB	03cH
	DB	03fH
	DB	03fH
	DB	03fH
	DB	03cH
	DB	03fH
	DB	03fH
	DB	03fH
	DB	030H
	DB	033H
	DB	033H
	DB	033H
	DB	03cH
	DB	03fH
	DB	03fH
	DB	03fH
	DB	03cH
	DB	03fH
	DB	03fH
	DB	03fH
	DB	03cH
	DB	03fH
	DB	03fH
	DB	03fH
	DB	030H
	DB	033H
	DB	033H
	DB	033H
	DB	03cH
	DB	03fH
	DB	03fH
	DB	03fH
	DB	03cH
	DB	03fH
	DB	03fH
	DB	03fH
	DB	03cH
	DB	03fH
	DB	03fH
	DB	03fH
	DB	0c0H
	DB	0c3H
	DB	0c3H
	DB	0c3H
	DB	0ccH
	DB	0cfH
	DB	0cfH
	DB	0cfH
	DB	0ccH
	DB	0cfH
	DB	0cfH
	DB	0cfH
	DB	0ccH
	DB	0cfH
	DB	0cfH
	DB	0cfH
	DB	0f0H
	DB	0f3H
	DB	0f3H
	DB	0f3H
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0f0H
	DB	0f3H
	DB	0f3H
	DB	0f3H
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0f0H
	DB	0f3H
	DB	0f3H
	DB	0f3H
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0c0H
	DB	0c3H
	DB	0c3H
	DB	0c3H
	DB	0ccH
	DB	0cfH
	DB	0cfH
	DB	0cfH
	DB	0ccH
	DB	0cfH
	DB	0cfH
	DB	0cfH
	DB	0ccH
	DB	0cfH
	DB	0cfH
	DB	0cfH
	DB	0f0H
	DB	0f3H
	DB	0f3H
	DB	0f3H
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0f0H
	DB	0f3H
	DB	0f3H
	DB	0f3H
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0f0H
	DB	0f3H
	DB	0f3H
	DB	0f3H
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0c0H
	DB	0c3H
	DB	0c3H
	DB	0c3H
	DB	0ccH
	DB	0cfH
	DB	0cfH
	DB	0cfH
	DB	0ccH
	DB	0cfH
	DB	0cfH
	DB	0cfH
	DB	0ccH
	DB	0cfH
	DB	0cfH
	DB	0cfH
	DB	0f0H
	DB	0f3H
	DB	0f3H
	DB	0f3H
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0f0H
	DB	0f3H
	DB	0f3H
	DB	0f3H
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0f0H
	DB	0f3H
	DB	0f3H
	DB	0f3H
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
	DB	0fcH
	DB	0ffH
	DB	0ffH
	DB	0ffH
$S417_videoram	DW	00H
_DATA      ENDS
_BSS      SEGMENT
$S156_dispoff	DW 01H DUP (?)
	ORG	$+4
$S157_scrtype	DW 01H DUP (?)
	ORG	$+8
$S158_grndsave	DW 0a0H DUP (?)
$S159_dispg	DW 01H DUP (?)
	ORG	$-336
$S160_drawpnt	DW 01H DUP (?)
$S161_drawsym	DW 01H DUP (?)
	ORG	$+2
$S163_spcbirds	DW 04H DUP (?)
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
; Line 83
	PUBLIC	_swdisp
_swdisp	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	si
;	register si = ob
; Line 86
	call	_setvdisp
; Line 87
	mov	si,WORD PTR _objtop
	jmp	SHORT $F168
; Line 101
; Line 102
	nop	
$I175:
; Line 105
	mov	ax,WORD PTR [si+4]
	mov	WORD PTR [si+60],ax
	mov	ax,WORD PTR [si+2]
	sub	ax,WORD PTR _displx
	mov	WORD PTR [si+58],ax
	sub	ax,ax
	push	ax
	push	WORD PTR [si+42]
	push	WORD PTR [si+78]
	push	WORD PTR [si+60]
	push	WORD PTR [si+58]
	push	si
	call	WORD PTR $S161_drawsym
	add	sp,12
; Line 106
; Line 107
$I171:
	cmp	WORD PTR [si+68],0
	je	$FC169
; Line 108
	push	si
	call	WORD PTR [si+68]
	add	sp,2
; Line 109
$FC169:
	mov	si,WORD PTR [si+52]
$F168:
	or	si,si
	je	$FB170
; Line 92
	cmp	WORD PTR [si+64],0
	je	$I172
	cmp	WORD PTR [si+62],0
	je	$I172
	cmp	WORD PTR [si+34],1
	je	$I172
	mov	ax,WORD PTR [si+66]
	cmp	WORD PTR [si+78],ax
	jne	$I172
	mov	ax,WORD PTR [si+60]
	cmp	WORD PTR [si+4],ax
	jne	$I172
	mov	ax,WORD PTR [si+58]
	add	ax,WORD PTR _displx
	cmp	ax,WORD PTR [si+2]
	je	$I171
$I172:
; Line 93
	cmp	WORD PTR [si+64],0
	je	$I173
; Line 95
	sub	ax,ax
	push	ax
	push	WORD PTR [si+42]
	push	WORD PTR [si+66]
	push	WORD PTR [si+60]
	push	WORD PTR [si+58]
	push	si
	call	WORD PTR $S161_drawsym
	add	sp,12
; Line 96
$I173:
	cmp	WORD PTR [si+62],0
	je	$FC169
; Line 98
	mov	ax,WORD PTR _displx
	cmp	WORD PTR [si+2],ax
	jl	$I176
	mov	ax,WORD PTR _disprx
	cmp	WORD PTR [si+2],ax
	jg	$JCC170
	jmp	$I175
$JCC170:
$I176:
; Line 99
	mov	WORD PTR [si+62],0
; Line 100
	jmp	SHORT $FC169
	nop	
	nop	
$FB170:
; Line 111
	mov	si,WORD PTR _deltop
	jmp	SHORT $F178
$FC179:
; Line 112
	cmp	WORD PTR [si+64],0
	je	$I181
; Line 114
	sub	ax,ax
	push	ax
	push	WORD PTR [si+42]
	push	WORD PTR [si+66]
	push	WORD PTR [si+60]
	push	WORD PTR [si+58]
	push	si
	call	WORD PTR $S161_drawsym
	add	sp,12
; Line 116
$I181:
	mov	si,WORD PTR [si+52]
$F178:
	or	si,si
	jne	$FC179
	call	dispgrnd
; Line 118
	sub	ax,ax
	mov	WORD PTR _dispinit,ax
	mov	WORD PTR _forcdisp,ax
; Line 119
	pop	si
	ret	
	nop	

_swdisp	ENDP
; Line 137
dispgrnd	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 138
	cmp	WORD PTR _dispinit,0
	jne	$I184
; Line 139
	cmp	WORD PTR _dispdx,0
	jne	$I185
	cmp	WORD PTR _forcdisp,0
	je	$EX183
; Line 141
$I185:
	mov	ax,OFFSET DGROUP:$S158_grndsave
	push	ax
	call	WORD PTR $S159_dispg
	add	sp,2
; Line 142
; Line 143
$I184:
	mov	ax,320
	push	ax
	mov	ax,OFFSET DGROUP:$S158_grndsave
	push	ax
	mov	ax,WORD PTR _displx
	add	ax,OFFSET _ground
	push	ax
	call	_movmem
	add	sp,6
; Line 144
	mov	ax,WORD PTR _displx
	add	ax,OFFSET _ground
	push	ax
	call	WORD PTR $S159_dispg
	add	sp,2
; Line 145
$EX183:
	ret	
	nop	

dispgrnd	ENDP
; Line 151
dispgm	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	di
	push	si
;	register di = gmask
;	i = -6
;	sptr = -8
;	register si = g
;	gl = -2
;	gc = -4
;	gptr = 4
; Line 157
	mov	WORD PTR [bp-6],320	;i
; Line 158
	mov	si,WORD PTR [bp+4]	;gptr
	mov	bx,si
	mov	al,BYTE PTR [bx]
	mov	BYTE PTR [bp-2],al	;gl
; Line 159
	mov	di,192
; Line 160
	sub	ah,ah
	mov	cx,-160
	imul	cx
	add	ax,WORD PTR $S156_dispoff
	add	ax,31840
	mov	WORD PTR [bp-8],ax	;sptr
; Line 162
	jmp	SHORT $L20006
$FC196:
; Line 163
	lodsb
	mov	BYTE PTR [bp-4],al	;gc
	cmp	al,BYTE PTR [bp-2]	;gl
	jne	$I198
; Line 164
	mov	ax,di
	mov	bx,WORD PTR [bp-8]	;sptr
	xor	BYTE PTR [bx],al
; Line 165
	xor	BYTE PTR [bx+80],al
; Line 166
	jmp	SHORT $I204
	nop	
$I198:
	mov	al,BYTE PTR [bp-2]	;gl
	cmp	BYTE PTR [bp-4],al	;gc
	jbe	$I200
; Line 167
$D201:
; Line 168
	mov	ax,di
	sub	WORD PTR [bp-8],160	;sptr
	mov	bx,WORD PTR [bp-8]	;sptr
	xor	BYTE PTR [bx],al
; Line 169
	xor	BYTE PTR [bx+80],al
; Line 170
	inc	BYTE PTR [bp-2]	;gl
	mov	al,BYTE PTR [bp-4]	;gc
	cmp	BYTE PTR [bp-2],al	;gl
	jb	$D201
; Line 171
	jmp	SHORT $I204
$I200:
; Line 172
; Line 173
	mov	ax,di
	add	WORD PTR [bp-8],160	;sptr
	mov	bx,WORD PTR [bp-8]	;sptr
	xor	BYTE PTR [bx],al
; Line 174
	xor	BYTE PTR [bx-80],al
; Line 175
	dec	BYTE PTR [bp-2]	;gl
	mov	al,BYTE PTR [bp-4]	;gc
	cmp	BYTE PTR [bp-2],al	;gl
	ja	$I200
$I204:
; Line 177
	sar	di,1
	sar	di,1
	or	di,di
	jne	$L20006
; Line 178
	mov	di,192
; Line 179
	inc	WORD PTR [bp-8]	;sptr
; Line 180
; Line 181
$L20006:
	mov	ax,WORD PTR [bp-6]	;i
	dec	WORD PTR [bp-6]	;i
	or	ax,ax
	jne	$FC196
; Line 182
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

dispgm	ENDP
; Line 188
dispgc	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	di
	push	si
;	register si = g
;	gl = -2
;	gc = -4
;	register di = gmask
;	i = -6
;	sptr = -8
;	gptr = 4
; Line 194
	mov	WORD PTR [bp-6],320	;i
; Line 195
	mov	si,WORD PTR [bp+4]	;gptr
	mov	bx,si
	mov	al,BYTE PTR [bx]
	mov	BYTE PTR [bp-2],al	;gl
; Line 196
	mov	di,128
; Line 197
	sub	ah,ah
	mov	cx,-160
	imul	cx
	add	ax,WORD PTR $S156_dispoff
	add	ax,31840
	mov	WORD PTR [bp-8],ax	;sptr
; Line 199
	jmp	SHORT $I233
	nop	
	nop	
$FC219:
; Line 200
	lodsb
	mov	BYTE PTR [bp-4],al	;gc
	cmp	al,BYTE PTR [bp-2]	;gl
	jne	$I221
; Line 201
	mov	ax,di
	mov	bx,WORD PTR [bp-8]	;sptr
	xor	BYTE PTR [bx],al
; Line 202
	xor	BYTE PTR [bx+2],al
; Line 203
	xor	BYTE PTR [bx+4],al
; Line 204
	jmp	SHORT $I227
$I221:
	mov	al,BYTE PTR [bp-2]	;gl
	cmp	BYTE PTR [bp-4],al	;gc
	jbe	$I223
; Line 205
$D224:
; Line 206
	mov	ax,di
	sub	WORD PTR [bp-8],160	;sptr
	mov	bx,WORD PTR [bp-8]	;sptr
	xor	BYTE PTR [bx],al
; Line 207
	xor	BYTE PTR [bx+2],al
; Line 208
	xor	BYTE PTR [bx+4],al
; Line 209
	inc	BYTE PTR [bp-2]	;gl
	mov	al,BYTE PTR [bp-4]	;gc
	cmp	BYTE PTR [bp-2],al	;gl
	jb	$D224
; Line 210
	jmp	SHORT $I227
	nop	
$I223:
; Line 211
; Line 212
	mov	ax,di
	add	WORD PTR [bp-8],160	;sptr
	mov	bx,WORD PTR [bp-8]	;sptr
	xor	BYTE PTR [bx],al
; Line 213
	xor	BYTE PTR [bx+2],al
; Line 214
	xor	BYTE PTR [bx+4],al
; Line 215
	dec	BYTE PTR [bp-2]	;gl
	mov	al,BYTE PTR [bp-4]	;gc
	cmp	BYTE PTR [bp-2],al	;gl
	ja	$I223
$I227:
; Line 217
	sar	di,1
	or	di,di
	jne	$I233
; Line 218
	mov	di,128
; Line 219
	test	BYTE PTR [bp-8],1	;sptr
	je	$I232
; Line 220
	add	WORD PTR [bp-8],7	;sptr
; Line 221
	jmp	SHORT $I233
$I232:
; Line 222
	inc	WORD PTR [bp-8]	;sptr
$I233:
; Line 223
; Line 224
	mov	ax,WORD PTR [bp-6]	;i
	dec	WORD PTR [bp-6]	;i
	or	ax,ax
	jne	$FC219
; Line 225
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

dispgc	ENDP
; Line 239
	PUBLIC	_swground
_swground	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 240
	jmp	dispgrnd
; Line 241

_swground	ENDP
; Line 255
	PUBLIC	_swclrcol
_swclrcol	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	register si = sptr
;	register di = l
; Line 259
	mov	si,WORD PTR $S156_dispoff
	add	si,31840
; Line 260
	cmp	WORD PTR $S157_scrtype,2
	jne	$I240
; Line 261
	mov	di,32
	jmp	SHORT $F241
	nop	
$FC242:
	dec	di
$F241:
	or	di,di
	je	$I244
; Line 262
	sub	ax,ax
	mov	WORD PTR [si+10],ax
	mov	WORD PTR [si+8],ax
	mov	WORD PTR [si+6],ax
	mov	WORD PTR [si+4],ax
	mov	WORD PTR [si+2],ax
	mov	WORD PTR [si],ax
; Line 263
	sub	si,80
; Line 264
	jmp	SHORT $FC242
	nop	
$I240:
; Line 266
	mov	di,16
$FC246:
; Line 268
	sub	ax,ax
	mov	WORD PTR [si+22],ax
	mov	WORD PTR [si+20],ax
	mov	WORD PTR [si+18],ax
	mov	WORD PTR [si+16],ax
	mov	WORD PTR [si+14],ax
	mov	WORD PTR [si+12],ax
	mov	WORD PTR [si+10],ax
	mov	WORD PTR [si+8],ax
	mov	WORD PTR [si+6],ax
	mov	WORD PTR [si+4],ax
	mov	WORD PTR [si+2],ax
	mov	WORD PTR [si],ax
; Line 269
	sub	si,160
; Line 270
	dec	di
	jne	$FC246
$I244:
; Line 271
	pop	si
	pop	di
	ret	

_swclrcol	ENDP
; Line 289
	PUBLIC	_swputsym
_swputsym	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	ob = 8
;	y = 6
;	x = 4
; Line 292
	sub	ax,ax
	push	ax
	mov	bx,WORD PTR [bp+8]	;ob
	push	WORD PTR [bx+42]
	push	WORD PTR [bx+78]
	push	WORD PTR [bp+6]	;y
	push	WORD PTR [bp+4]	;x
	push	bx
	call	WORD PTR $S161_drawsym
; Line 293
	mov	sp,bp
	pop	bp
	ret	
	nop	

_swputsym	ENDP
; Line 298
	PUBLIC	_swputcol
_swputcol	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	retcode = -2
;	ob = 8
;	y = 6
;	x = 4
; Line 301
	mov	WORD PTR [bp-2],0	;retcode
; Line 303
	lea	ax,WORD PTR [bp-2]	;retcode
	push	ax
	mov	bx,WORD PTR [bp+8]	;ob
	push	WORD PTR [bx+42]
	push	WORD PTR [bx+78]
	push	WORD PTR [bp+6]	;y
	push	WORD PTR [bp+4]	;x
	push	bx
	call	WORD PTR $S161_drawsym
; Line 304
	mov	ax,WORD PTR [bp-2]	;retcode
; Line 305
	mov	sp,bp
	pop	bp
	ret	
	nop	

_swputcol	ENDP
; Line 333
drawsm	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
	push	di
	push	si
;	register si = s
;	register di = sptr
;	sym = -12
;	j = -14
;	c = -16
;	cr = -18
;	pc = -20
;	rotr = -6
;	rotl = -2
;	wdth = -4
;	wrap = -8
;	n = -10
;	retcode = 14
;	clr = 12
;	symbol = 10
;	y = 8
;	x = 6
;	ob = 4
; Line 341
	mov	ax,WORD PTR [bp+10]	;symbol
	mov	WORD PTR [bp-12],ax	;sym
	or	ax,ax
	jne	$JCC877
	jmp	$EX267
$JCC877:
; Line 344
	mov	bx,WORD PTR [bp+4]	;ob
	cmp	WORD PTR [bx+34],1
	jne	$I281
	cmp	WORD PTR [bx+36],1
	jne	$I281
; Line 345
	push	WORD PTR [bp+14]	;retcode
	push	ax
	push	WORD PTR [bp+8]	;y
	push	WORD PTR [bp+6]	;x
	call	_drawpm
	add	sp,8
; Line 346
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 347
; Line 349
	nop	
$I281:
; Line 350
	mov	al,BYTE PTR [bp+6]	;x
	and	ax,3
	shl	ax,1
	mov	WORD PTR [bp-6],ax	;rotr
	sub	ax,8
	neg	ax
	mov	WORD PTR [bp-2],ax	;rotl
; Line 353
	mov	ax,WORD PTR [bx+36]
	sar	ax,1
	sar	ax,1
	mov	WORD PTR [bp-4],ax	;wdth
	mov	cx,WORD PTR [bp+6]	;x
	sar	cx,1
	sar	cx,1
	sub	cx,80
	neg	cx
	mov	WORD PTR [bp-10],cx	;n
	sub	ax,cx
	mov	WORD PTR [bp-8],ax	;wrap
	or	ax,ax
	jle	$I283
; Line 354
	mov	WORD PTR [bp-4],cx	;wdth
; Line 356
$I283:
	mov	ax,WORD PTR [bx+34]
	mov	WORD PTR [bp-10],ax	;n
	mov	cx,WORD PTR [bp+8]	;y
	inc	cx
	cmp	ax,cx
	jle	$I284
; Line 357
	mov	WORD PTR [bp-10],cx	;n
; Line 358
$I284:
	mov	ax,160
	imul	WORD PTR [bp+8]	;y
	mov	di,WORD PTR [bp+6]	;x
	sar	di,1
	sar	di,1
	sub	di,ax
	add	di,WORD PTR $S156_dispoff
	add	di,31840
; Line 360
	jmp	$L20010
	nop	
$FC286:
; Line 361
	mov	si,di
; Line 362
	mov	ax,WORD PTR [bp-4]	;wdth
	mov	WORD PTR [bp-14],ax	;j
; Line 363
	mov	WORD PTR [bp-20],0	;pc
; Line 364
	jmp	SHORT $L20009
	nop	
$FC289:
; Line 365
	mov	bx,WORD PTR [bp-12]	;sym
	inc	WORD PTR [bp-12]	;sym
	mov	al,BYTE PTR [bx]
	cbw	
	mov	WORD PTR [bp-16],ax	;c
	mov	cl,BYTE PTR [bp-2]	;rotl
	shl	ax,cl
	mov	WORD PTR [bp-18],ax	;cr
; Line 366
	mov	cl,BYTE PTR [bp-6]	;rotr
	mov	al,BYTE PTR [bp-16]	;c
	sub	ah,ah
	sar	ax,cl
	or	ax,WORD PTR [bp-20]	;pc
	mov	WORD PTR [bp-16],ax	;c
; Line 367
	mov	ax,WORD PTR [bp-18]	;cr
	mov	WORD PTR [bp-20],ax	;pc
; Line 368
	cmp	WORD PTR [bp+14],0	;retcode
	je	$I291
	mov	al,BYTE PTR [si]
	mov	bl,BYTE PTR [bp-16]	;c
	sub	bh,bh
	test	BYTE PTR _fill[bx],al
	je	$I291
; Line 369
	mov	bx,WORD PTR [bp+14]	;retcode
	mov	WORD PTR [bx],1
; Line 370
	mov	WORD PTR [bp+14],0	;retcode
; Line 371
; Line 372
$I291:
	mov	al,BYTE PTR [bp-16]	;c
	xor	BYTE PTR [si],al
; Line 373
	xor	BYTE PTR [si+80],al
	inc	si
; Line 374
$L20009:
	mov	ax,WORD PTR [bp-14]	;j
	dec	WORD PTR [bp-14]	;j
	or	ax,ax
	jne	$FC289
; Line 375
	cmp	WORD PTR [bp-8],ax	;wrap
	jl	$I292
; Line 376
	mov	ax,WORD PTR [bp-8]	;wrap
	add	WORD PTR [bp-12],ax	;sym
; Line 377
	jmp	SHORT $I293
	nop	
$I292:
; Line 378
	cmp	WORD PTR [bp+14],ax	;retcode
	je	$I294
	mov	al,BYTE PTR [si]
	mov	bl,BYTE PTR [bp-20]	;pc
	sub	bh,bh
	test	BYTE PTR _fill[bx],al
	je	$I294
; Line 379
	mov	bx,WORD PTR [bp+14]	;retcode
	mov	WORD PTR [bx],1
; Line 380
	mov	WORD PTR [bp+14],0	;retcode
; Line 381
; Line 382
$I294:
	mov	al,BYTE PTR [bp-20]	;pc
	xor	BYTE PTR [si],al
; Line 383
	xor	BYTE PTR [si+80],al
; Line 384
$I293:
; Line 385
	add	di,160
; Line 386
$L20010:
	mov	ax,WORD PTR [bp-10]	;n
	dec	WORD PTR [bp-10]	;n
	or	ax,ax
	je	$JCC1192
	jmp	$FC286
$JCC1192:
; Line 387
$EX267:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

drawsm	ENDP
; Line 393
drawsc	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,32
	call	__aNchkstk
	push	di
	push	si
;	register si = s
;	register di = sptr
;	sym = -22
;	j = -24
;	c1 = -26
;	c2 = -28
;	c = -30
;	rotr = -14
;	rotl = -2
;	wdth = -12
;	wrap = -18
;	n = -20
;	cr = -10
;	pc1 = -6
;	pc2 = -8
;	invert = -16
;	enhance1 = -4
;	retcode = 14
;	clr = 12
;	symbol = 10
;	y = 8
;	x = 6
;	ob = 4
; Line 403
	mov	ax,WORD PTR [bp+10]	;symbol
	mov	WORD PTR [bp-22],ax	;sym
	or	ax,ax
	jne	$JCC1223
	jmp	$EX302
$JCC1223:
; Line 406
	mov	bx,WORD PTR [bp+4]	;ob
	cmp	WORD PTR [bx+34],1
	jne	$I322
	cmp	WORD PTR [bx+36],1
	jne	$I322
; Line 407
	push	WORD PTR [bp+14]	;retcode
	push	ax
	push	WORD PTR [bp+8]	;y
	push	WORD PTR [bp+6]	;x
	call	_drawpc
	add	sp,8
; Line 408
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 409
; Line 411
	nop	
$I322:
; Line 412
	mov	al,BYTE PTR [bp+6]	;x
	and	ax,7
	mov	WORD PTR [bp-14],ax	;rotr
	sub	ax,8
	neg	ax
	mov	WORD PTR [bp-2],ax	;rotl
; Line 415
	mov	ax,WORD PTR [bx+36]
	sar	ax,1
	sar	ax,1
	mov	WORD PTR [bp-12],ax	;wdth
	mov	cx,WORD PTR [bp+6]	;x
	sar	cx,1
	sar	cx,1
	sub	cx,80
	neg	cx
	mov	WORD PTR [bp-20],cx	;n
	sub	ax,cx
	mov	WORD PTR [bp-18],ax	;wrap
	or	ax,ax
	jle	$I324
; Line 416
	mov	WORD PTR [bp-12],cx	;wdth
; Line 418
$I324:
	mov	ax,WORD PTR [bx+34]
	mov	WORD PTR [bp-20],ax	;n
	mov	cx,WORD PTR [bp+8]	;y
	inc	cx
	cmp	ax,cx
	jle	$I325
; Line 419
	mov	WORD PTR [bp-20],cx	;n
; Line 420
$I325:
; Line 422
	mov	ax,160
	imul	WORD PTR [bp+8]	;y
	mov	cl,3
	mov	di,WORD PTR [bp+6]	;x
	and	di,8
	sar	di,cl
	mov	cx,WORD PTR [bp+6]	;x
	and	cl,241
	shr	cx,1
	add	di,cx
	sub	di,ax
	add	di,WORD PTR $S156_dispoff
	add	di,31840
; Line 424
	mov	al,BYTE PTR [bp+12]	;clr
	and	al,3
	cmp	al,2
	jne	$L20004
	mov	ax,-1
	jmp	SHORT $L20005
	nop	
$L20004:
	sub	ax,ax
$L20005:
	mov	WORD PTR [bp-16],ax	;invert
; Line 426
	mov	ax,WORD PTR [bx+96]
	mov	WORD PTR [bp-24],ax	;j
	cmp	ax,7
	je	$L20003
	cmp	ax,8
	je	$L20003
	cmp	ax,9
	jne	$L20001
$L20003:
	mov	WORD PTR [bp-4],-1	;enhance1
	jmp	SHORT $L20002
	nop	
$L20001:
	mov	WORD PTR [bp-4],0	;enhance1
$L20002:
; Line 427
	cmp	ax,8
	je	$JCC1430
	jmp	$L20012
$JCC1430:
; Line 428
	mov	ax,WORD PTR [bp-22]	;sym
	sub	ax,OFFSET _swbrdsym
	shl	ax,1
	add	ax,OFFSET DGROUP:$S163_spcbirds
	mov	WORD PTR [bp-22],ax	;sym
; Line 430
	jmp	$L20012
$FC328:
; Line 431
	mov	si,di
; Line 432
	mov	ax,WORD PTR [bp-12]	;wdth
	mov	WORD PTR [bp-24],ax	;j
; Line 433
	sub	ax,ax
	mov	WORD PTR [bp-8],ax	;pc2
	mov	WORD PTR [bp-6],ax	;pc1
; Line 434
	jmp	$L20011
	nop	
$FC331:
; Line 435
	cmp	WORD PTR [bp-24],0	;j
	je	$I333
; Line 436
	mov	WORD PTR [bp-30],255	;c
; Line 437
	dec	WORD PTR [bp-24]	;j
; Line 438
	jmp	SHORT $I334
$I333:
; Line 439
	mov	WORD PTR [bp-30],240	;c
$I334:
; Line 441
	mov	bx,WORD PTR [bp-22]	;sym
	inc	WORD PTR [bp-22]	;sym
	mov	al,BYTE PTR [bx]
	cbw	
	and	ax,WORD PTR [bp-30]	;c
	mov	WORD PTR [bp-26],ax	;c1
	mov	cl,BYTE PTR [bp-2]	;rotl
	shl	ax,cl
	mov	WORD PTR [bp-10],ax	;cr
; Line 442
	mov	cl,BYTE PTR [bp-14]	;rotr
	mov	ax,WORD PTR [bp-26]	;c1
	sar	ax,cl
	or	ax,WORD PTR [bp-6]	;pc1
	mov	WORD PTR [bp-26],ax	;c1
; Line 443
	mov	ax,WORD PTR [bp-10]	;cr
	mov	WORD PTR [bp-6],ax	;pc1
; Line 444
	mov	bx,WORD PTR [bp-22]	;sym
	inc	WORD PTR [bp-22]	;sym
	mov	al,BYTE PTR [bx]
	cbw	
	and	ax,WORD PTR [bp-30]	;c
	mov	WORD PTR [bp-28],ax	;c2
	mov	cl,BYTE PTR [bp-2]	;rotl
	shl	ax,cl
	mov	WORD PTR [bp-10],ax	;cr
; Line 445
	mov	cl,BYTE PTR [bp-14]	;rotr
	mov	ax,WORD PTR [bp-28]	;c2
	sar	ax,cl
	or	ax,WORD PTR [bp-8]	;pc2
	mov	WORD PTR [bp-28],ax	;c2
; Line 446
	mov	ax,WORD PTR [bp-10]	;cr
	mov	WORD PTR [bp-8],ax	;pc2
; Line 447
	mov	ax,WORD PTR [bp-28]	;c2
	or	ax,WORD PTR [bp-26]	;c1
	mov	WORD PTR [bp-30],ax	;c
; Line 450
	cmp	WORD PTR [bp+14],0	;retcode
	je	$I335
	mov	cl,BYTE PTR [si+2]
	or	cl,BYTE PTR [si]
	and	cl,al
	test	cl,255
	je	$I335
; Line 451
	mov	bx,WORD PTR [bp+14]	;retcode
	mov	WORD PTR [bx],1
; Line 452
	mov	WORD PTR [bp+14],0	;retcode
; Line 453
; Line 454
$I335:
	mov	al,BYTE PTR [bp-16]	;invert
	mov	cl,BYTE PTR [bp-30]	;c
	and	al,cl
	mov	dx,ax
	xor	al,BYTE PTR [si]
	xor	al,BYTE PTR [bp-26]	;c1
	mov	BYTE PTR [si],al
; Line 455
	xor	dl,BYTE PTR [si+2]
	xor	dl,BYTE PTR [bp-28]	;c2
	mov	BYTE PTR [si+2],dl
; Line 456
	and	cl,BYTE PTR [bp-4]	;enhance1
	xor	BYTE PTR [si+6],cl
; Line 458
	test	si,1
	je	$I336
; Line 459
	add	si,7
; Line 460
	jmp	SHORT $L20011
	nop	
$I336:
; Line 461
	inc	si
; Line 462
$L20011:
	mov	ax,WORD PTR [bp-24]	;j
	dec	WORD PTR [bp-24]	;j
	or	ax,ax
	je	$JCC1671
	jmp	$FC331
$JCC1671:
; Line 463
	cmp	WORD PTR [bp-18],ax	;wrap
	jl	$I338
; Line 464
	mov	ax,WORD PTR [bp-18]	;wrap
	and	al,254
	add	WORD PTR [bp-22],ax	;sym
; Line 465
	jmp	SHORT $I339
	nop	
$I338:
; Line 466
	mov	ax,WORD PTR [bp-8]	;pc2
	or	ax,WORD PTR [bp-6]	;pc1
	mov	WORD PTR [bp-30],ax	;c
; Line 468
	cmp	WORD PTR [bp+14],0	;retcode
	je	$I340
	mov	cl,BYTE PTR [si+2]
	or	cl,BYTE PTR [si]
	and	cl,al
	test	cl,255
	je	$I340
; Line 469
	mov	bx,WORD PTR [bp+14]	;retcode
	mov	WORD PTR [bx],1
; Line 470
	mov	WORD PTR [bp+14],0	;retcode
; Line 471
; Line 472
$I340:
	mov	al,BYTE PTR [bp-16]	;invert
	mov	cl,BYTE PTR [bp-30]	;c
	and	al,cl
	mov	dx,ax
	xor	al,BYTE PTR [bp-6]	;pc1
	xor	al,BYTE PTR [si]
	mov	BYTE PTR [si],al
; Line 473
	xor	dl,BYTE PTR [si+2]
	xor	dl,BYTE PTR [bp-8]	;pc2
	mov	BYTE PTR [si+2],dl
; Line 474
	and	cl,BYTE PTR [bp-4]	;enhance1
	xor	BYTE PTR [si+6],cl
; Line 475
$I339:
; Line 476
	add	di,160
; Line 477
$L20012:
	mov	ax,WORD PTR [bp-20]	;n
	dec	WORD PTR [bp-20]	;n
	or	ax,ax
	je	$JCC1775
	jmp	$FC328
$JCC1775:
; Line 478
$EX302:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

drawsc	ENDP
; Line 497
	PUBLIC	_swpntsym
_swpntsym	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	clr = 8
;	y = 6
;	x = 4
; Line 499
	sub	ax,ax
	push	ax
	push	WORD PTR [bp+8]	;clr
	push	WORD PTR [bp+6]	;y
	push	WORD PTR [bp+4]	;x
	call	WORD PTR $S160_drawpnt
; Line 500
	mov	sp,bp
	pop	bp
	ret	

_swpntsym	ENDP
; Line 505
	PUBLIC	_swpntcol
_swpntcol	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	oldclr = -2
;	clr = 8
;	y = 6
;	x = 4
; Line 509
	lea	ax,WORD PTR [bp-2]	;oldclr
	push	ax
	push	WORD PTR [bp+8]	;clr
	push	WORD PTR [bp+6]	;y
	push	WORD PTR [bp+4]	;x
	call	WORD PTR $S160_drawpnt
; Line 510
	mov	ax,WORD PTR [bp-2]	;oldclr
; Line 511
	mov	sp,bp
	pop	bp
	ret	
	nop	

_swpntcol	ENDP
; Line 516
	PUBLIC	_drawpc
_drawpc	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	di
	push	si
;	register si = c
;	register di = mask
;	sptr = -2
;	oldclr = 10
;	clr = 8
;	y = 6
;	x = 4
; Line 523
	mov	ax,160
	imul	WORD PTR [bp+6]	;y
	mov	cl,3
	mov	dl,BYTE PTR [bp+4]	;x
	and	dx,8
	sar	dx,cl
	mov	cx,WORD PTR [bp+4]	;x
	and	cl,241
	shr	cx,1
	add	dx,cx
	sub	dx,ax
	add	dx,WORD PTR $S156_dispoff
	add	dx,31840
	mov	WORD PTR [bp-2],dx	;sptr
; Line 524
	and	WORD PTR [bp+4],7	;x
	mov	cl,BYTE PTR [bp+4]	;x
	mov	di,128
	sar	di,cl
; Line 526
	cmp	WORD PTR [bp+10],0	;oldclr
	je	$I360
; Line 530
	mov	bx,dx
	mov	al,BYTE PTR [bx]
	mov	dx,ax
	mov	al,BYTE PTR [bx+2]
	mov	cx,ax
	mov	al,BYTE PTR [bx+4]
	mov	WORD PTR [bp-4],ax
	mov	al,BYTE PTR [bx+6]
	mov	bx,ax
	mov	al,dl
	cbw	
	and	ax,di
	mov	dx,ax
	mov	al,cl
	cbw	
	and	ax,di
	mov	cx,ax
	mov	al,BYTE PTR [bp-4]
	cbw	
	and	ax,di
	mov	WORD PTR [bp-6],ax
	mov	al,bl
	cbw	
	and	ax,di
	shl	ax,1
	or	ax,WORD PTR [bp-6]
	shl	ax,1
	or	cx,ax
	shl	cx,1
	or	dx,cx
; Line 531
	mov	cl,7
	sub	cl,BYTE PTR [bp+4]	;x
	sar	dx,cl
	sub	dh,dh
	mov	bx,WORD PTR [bp+10]	;oldclr
	mov	WORD PTR [bx],dx
; Line 532
; Line 534
$I360:
	mov	cl,7
	sub	cl,BYTE PTR [bp+4]	;x
	mov	si,WORD PTR [bp+8]	;clr
	shl	si,cl
; Line 535
	test	BYTE PTR [bp+8],128	;clr
	je	$I361
; Line 536
	mov	ax,si
	mov	cx,di
	and	al,cl
	mov	bx,WORD PTR [bp-2]	;sptr
	xor	BYTE PTR [bx],al
; Line 537
	mov	ax,si
	sar	ax,1
	mov	dx,cx
	and	cl,al
	xor	BYTE PTR [bx+2],cl
; Line 538
	mov	ax,si
	sar	ax,1
	sar	ax,1
	mov	cx,di
	and	dl,al
	xor	BYTE PTR [bx+4],dl
; Line 539
	mov	ax,cx
	mov	cl,3
	mov	dx,si
	sar	dx,cl
	and	al,dl
	xor	BYTE PTR [bx+6],al
; Line 540
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I361:
; Line 542
	not	di
	mov	ax,di
	mov	bx,WORD PTR [bp-2]	;sptr
	and	BYTE PTR [bx],al
; Line 543
	and	BYTE PTR [bx+2],al
; Line 544
	and	BYTE PTR [bx+4],al
; Line 545
	and	BYTE PTR [bx+6],al
; Line 548
	not	ax
	mov	di,ax
	mov	cx,si
	mov	dx,ax
	and	al,cl
	or	BYTE PTR [bx],al
; Line 549
	mov	ax,si
	sar	ax,1
	mov	cx,di
	and	dl,al
	or	BYTE PTR [bx+2],dl
; Line 550
	mov	ax,si
	sar	ax,1
	sar	ax,1
	mov	dx,cx
	and	cl,al
	or	BYTE PTR [bx+4],cl
; Line 551
	mov	cl,3
	mov	ax,si
	sar	ax,cl
	and	dl,al
	or	BYTE PTR [bx+6],dl
; Line 552
; Line 553
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_drawpc	ENDP
; Line 560
	PUBLIC	_drawpm
_drawpm	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	di
	push	si
;	register si = c
;	register di = mask
;	sptr = -2
;	oldclr = 10
;	clr = 8
;	y = 6
;	x = 4
; Line 565
	mov	ax,160
	imul	WORD PTR [bp+6]	;y
	mov	cx,WORD PTR [bp+4]	;x
	sar	cx,1
	sar	cx,1
	sub	cx,ax
	add	cx,WORD PTR $S156_dispoff
	add	cx,31840
	mov	WORD PTR [bp-2],cx	;sptr
; Line 566
	mov	cl,BYTE PTR [bp+4]	;x
	and	cx,3
	shl	cx,1
	mov	WORD PTR [bp+4],cx	;x
	mov	di,192
	sar	di,cl
; Line 568
	cmp	WORD PTR [bp+10],0	;oldclr
	je	$I371
; Line 569
	mov	bx,WORD PTR [bp-2]	;sptr
	mov	al,BYTE PTR [bx]
	cbw	
	and	ax,di
	mov	dx,cx
	mov	cl,6
	sub	cl,dl
	sar	ax,cl
	sub	ah,ah
	mov	bx,WORD PTR [bp+10]	;oldclr
	mov	WORD PTR [bx],ax
; Line 571
$I371:
	mov	cl,6
	sub	cl,BYTE PTR [bp+4]	;x
	mov	si,WORD PTR [bp+8]	;clr
	shl	si,cl
; Line 572
	test	BYTE PTR [bp+8],128	;clr
	je	$I372
; Line 573
	mov	ax,si
	mov	cx,di
	and	al,cl
	mov	bx,WORD PTR [bp-2]	;sptr
	xor	BYTE PTR [bx],al
; Line 574
	xor	BYTE PTR [bx+80],al
; Line 575
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
$I372:
; Line 576
	mov	ax,di
	mov	cx,di
	not	al
	mov	bx,WORD PTR [bp-2]	;sptr
	and	BYTE PTR [bx],al
; Line 577
	and	BYTE PTR [bx+80],al
; Line 578
	mov	ax,si
	and	cl,al
	or	BYTE PTR [bx],cl
; Line 579
	or	BYTE PTR [bx+80],cl
; Line 580
; Line 581
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_drawpm	ENDP
; Line 602
	PUBLIC	_get_type
_get_type	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 603
	mov	ax,4
	push	ax
	call	_trap14
	add	sp,2
	mov	WORD PTR $S157_scrtype,ax
; Line 604
	ret	
	nop	

_get_type	ENDP
; Line 609
	PUBLIC	_set_type
_set_type	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	type = 4
; Line 611
	cmp	WORD PTR [bp+4],2	;type
	jle	$I379
; Line 612
	cmp	WORD PTR $S157_scrtype,2
	jne	$I380
; Line 613
	mov	WORD PTR [bp+4],2	;type
; Line 614
	mov	WORD PTR $S159_dispg,OFFSET dispgm
; Line 615
	mov	WORD PTR $S160_drawpnt,OFFSET _drawpm
; Line 616
	mov	WORD PTR $S161_drawsym,OFFSET drawsm
; Line 617
	jmp	SHORT $I381
$I380:
; Line 618
	cmp	WORD PTR [bp+4],6	;type
	jne	$I382
; Line 619
	mov	WORD PTR [bp+4],1	;type
; Line 620
	jmp	SHORT $I383
	nop	
$I382:
; Line 621
	mov	WORD PTR [bp+4],0	;type
$I383:
; Line 622
	mov	WORD PTR $S159_dispg,OFFSET dispgc
; Line 623
	mov	WORD PTR $S160_drawpnt,OFFSET _drawpc
; Line 624
	mov	WORD PTR $S161_drawsym,OFFSET drawsc
; Line 625
	call	invertsymbols
; Line 626
$I381:
; Line 627
	push	WORD PTR [bp+4]	;type
	mov	ax,-1
	cwd	
	push	dx
	push	ax
	push	dx
	push	ax
	mov	ax,5
	push	ax
	call	_trap14
	mov	sp,bp
; Line 628
	mov	ax,OFFSET DGROUP:$S162_palette
	push	ax
	mov	ax,6
	jmp	SHORT $L20013
	nop	
$I379:
; Line 630
	push	WORD PTR [bp+4]	;type
	mov	ax,-1
	cwd	
	push	dx
	push	ax
	push	dx
	push	ax
	mov	ax,5
	push	ax
	call	_trap14
	add	sp,12
; Line 631
	mov	ax,1
	push	ax
	mov	ax,21
$L20013:
	push	ax
	call	_trap14
; Line 632
; Line 633
	mov	sp,bp
	pop	bp
	ret	

_set_type	ENDP
; Line 638
invertsymbols	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 650
	mov	ax,2048
	push	ax
	mov	ax,OFFSET _swplnsym
	push	ax
	call	invert
	add	sp,4
; Line 651
	mov	ax,128
	push	ax
	mov	cx,OFFSET _swhitsym
	push	cx
	call	invert
	add	sp,4
; Line 652
	mov	ax,128
	push	ax
	mov	cx,OFFSET _swbmbsym
	push	cx
	call	invert
	add	sp,4
; Line 653
	mov	ax,256
	push	ax
	mov	cx,OFFSET _swtrgsym
	push	cx
	call	invert
	add	sp,4
; Line 654
	mov	ax,256
	push	ax
	mov	ax,OFFSET _swwinsym
	push	ax
	call	invert
	add	sp,4
; Line 655
	mov	ax,64
	push	ax
	mov	ax,OFFSET _swhtrsym
	push	ax
	call	invert
	add	sp,4
; Line 656
	mov	ax,128
	push	ax
	mov	cx,OFFSET _swexpsym
	push	cx
	call	invert
	add	sp,4
; Line 657
	mov	ax,128
	push	ax
	mov	cx,OFFSET _swflksym
	push	cx
	call	invert
	add	sp,4
; Line 658
	mov	ax,OFFSET DGROUP:$S163_spcbirds
	push	ax
	mov	cx,OFFSET _swbrdsym
	push	cx
	call	copy
	add	sp,4
; Line 659
	mov	ax,8
	push	ax
	mov	ax,OFFSET DGROUP:$S163_spcbirds
	push	ax
	call	invert
	add	sp,4
; Line 660
	mov	ax,128
	push	ax
	mov	ax,OFFSET _swoxsym
	push	ax
	call	invert
	add	sp,4
; Line 661
	ret	

invertsymbols	ENDP
; Line 666
copy	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
;	to = 6
;	from = 4
; Line 670
	mov	WORD PTR [bp-2],4	;i
$FC404:
; Line 671
	mov	bx,WORD PTR [bp+4]	;from
	inc	WORD PTR [bp+4]	;from
	mov	al,BYTE PTR [bx]
	mov	bx,WORD PTR [bp+6]	;to
	inc	WORD PTR [bp+6]	;to
	mov	BYTE PTR [bx],al
; Line 672
	mov	bx,WORD PTR [bp+6]	;to
	inc	WORD PTR [bp+6]	;to
	mov	BYTE PTR [bx],0
; Line 673
	dec	WORD PTR [bp-2]	;i
	jne	$FC404
; Line 674
	mov	sp,bp
	pop	bp
	ret	

copy	ENDP
; Line 679
invert	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	di
	push	si
;	register si = c1
;	register di = c2
;	s = -4
;	n = -2
;	bytes = 6
;	symbol = 4
; Line 686
	mov	ax,WORD PTR [bp+4]	;symbol
	mov	WORD PTR [bp-4],ax	;s
; Line 687
	mov	ax,WORD PTR [bp+6]	;bytes
	sar	ax,1
	mov	WORD PTR [bp-2],ax	;n
	jmp	$F413
$FC414:
; Line 688
	mov	bx,WORD PTR [bp-4]	;s
	mov	al,BYTE PTR [bx]
	cbw	
	mov	si,ax
; Line 689
	mov	cx,ax
	mov	al,BYTE PTR [bx+1]
	cbw	
	mov	di,ax
; Line 697
	mov	dx,ax
	sub	ah,ah
	and	al,1
	mov	bx,si
	and	cl,1
	shl	cl,1
	mov	WORD PTR [bp-6],bx
	and	bl,4
	or	bl,cl
	shl	bl,1
	mov	cl,BYTE PTR [bp-6]
	and	cl,16
	or	cl,bl
	shl	cl,1
	mov	bl,BYTE PTR [bp-6]
	and	bl,192
	or	cl,bl
	shl	cl,1
	mov	bx,di
	sar	dx,1
	sar	dx,1
	and	dl,4
	or	cl,dl
	mov	dx,cx
	mov	cl,3
	mov	WORD PTR [bp-8],bx
	sar	bx,cl
	and	bl,8
	or	dl,bl
	mov	bx,WORD PTR [bp-8]
	sar	bx,1
	and	bl,2
	or	dl,bl
	or	al,dl
	mov	bx,WORD PTR [bp-4]	;s
	mov	BYTE PTR [bx],al
; Line 705
	inc	bx
	mov	WORD PTR [bp-4],bx	;s
	mov	ax,si
	mov	dx,ax
	and	al,128
	mov	cx,si
	and	dl,2
	shl	dl,1
	mov	bx,cx
	and	cl,8
	or	cl,dl
	shl	cl,1
	and	bl,32
	or	cl,bl
	shl	cl,1
	mov	dx,di
	sar	dx,1
	sar	dx,1
	and	dl,2
	or	cl,dl
	mov	dx,cx
	mov	cl,3
	mov	bx,di
	sar	bx,cl
	and	bl,4
	or	dl,bl
	or	al,dl
	mov	cl,4
	mov	dx,di
	sar	dx,cl
	and	dl,8
	or	al,dl
	mov	dx,di
	sar	dx,1
	and	dl,1
	or	al,dl
	mov	bx,WORD PTR [bp-4]	;s
	mov	BYTE PTR [bx],al
	lea	ax,WORD PTR [bx+1]
	mov	WORD PTR [bp-4],ax	;s
; Line 706
	dec	WORD PTR [bp-2]	;n
$F413:
	cmp	WORD PTR [bp-2],0	;n
	je	$JCC2890
	jmp	$FC414
$JCC2890:
; Line 707
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

invert	ENDP
; Line 725
	PUBLIC	_setvdisp
_setvdisp	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 728
	cmp	WORD PTR $S417_videoram,0
	jne	$I418
; Line 729
	mov	ax,3
	push	ax
	call	_trap14
	add	sp,2
	mov	WORD PTR $S417_videoram,ax
; Line 730
$I418:
	mov	ax,WORD PTR $S417_videoram
	mov	WORD PTR $S156_dispoff,ax
; Line 731
	ret	

_setvdisp	ENDP
; Line 737
	PUBLIC	_setadisp
_setadisp	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 738
	mov	WORD PTR $S156_dispoff,OFFSET _auxdisp-16384
; Line 739
	ret	

_setadisp	ENDP
_TEXT	ENDS
END
