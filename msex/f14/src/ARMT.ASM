;	Static Name Aliases
;
;	$S940_n	EQU	n
	TITLE   C:\ARMT.C
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
PUBLIC  _OurLoadOut
PUBLIC  _MODE_MASTER
PUBLIC  _MODE_NAV
PUBLIC  _MODE_AA
PUBLIC  _F14_STATION
PUBLIC  _ORDNANCE
EXTRN	_JettisonFuel:NEAR
EXTRN	_Init3DMissiles:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_Rotate:NEAR
EXTRN	_Sound:NEAR
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_PLYR_M:BYTE
_BSS      SEGMENT
COMM NEAR	_LastSlotNMount:	BYTE:	 2
_BSS      ENDS
EXTRN	_MasterArmSW:WORD
_BSS      SEGMENT
COMM NEAR	_LP:	BYTE:	 8
_BSS      ENDS
EXTRN	_AWG9_REALITY_LEVEL:WORD
_DATA      SEGMENT
_MODE_MASTER	DW	00H
_MODE_NAV	DW	00H
_MODE_AA	DW	00H
_F14_STATION	DW	012H
	DW	012H
	DW	0ffffH
	DW	0ffffH
	DW	011H
	DW	011H
	DW	0ffffH
	DW	0ffffH
	DW	0ffffH
	DW	0ffffH
	DW	0ffffH
	DW	0ffffH
_OurLoadOut	DW	00H
_ORDNANCE	DB	00H
 	DB	9 DUP(0)

	DB	00H
 	DB	1 DUP(0)

	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DB	00H
	DB	00H
	DB	00H
 	DB	1 DUP(0)

	DB	'MK82',  00H
 	DB	5 DUP(0)

	DB	00H
 	DB	1 DUP(0)

	DW	032H
	DW	0cH
	DW	03e7H
	DW	00H
	DB	07dH
	DB	032H
	DB	064H
 	DB	1 DUP(0)

	DB	'BSU49',  00H
 	DB	4 DUP(0)

	DB	00H
 	DB	1 DUP(0)

	DW	034H
	DW	0cH
	DW	03e7H
	DW	00H
	DB	07dH
	DB	032H
	DB	064H
 	DB	1 DUP(0)

	DB	'MK20',  00H
 	DB	5 DUP(0)

	DB	00H
 	DB	1 DUP(0)

	DW	032H
	DW	0cH
	DW	03e7H
	DW	00H
	DB	0ffH
	DB	03cH
	DB	0fH
 	DB	1 DUP(0)

	DB	'AGM65',  00H
 	DB	4 DUP(0)

	DB	'D',  00H
	DW	01bH
	DW	014H
	DW	06cH
	DW	00H
	DB	02H
	DB	03cH
	DB	019H
 	DB	1 DUP(0)

	DB	'MK84',  00H
 	DB	5 DUP(0)

	DB	00H
 	DB	1 DUP(0)

	DW	032H
	DW	0cH
	DW	03e7H
	DW	00H
	DB	07dH
	DB	064H
	DB	0c8H
 	DB	1 DUP(0)

	DB	'BSU50',  00H
 	DB	4 DUP(0)

	DB	00H
 	DB	1 DUP(0)

	DW	034H
	DW	0cH
	DW	03e7H
	DW	00H
	DB	07dH
	DB	064H
	DB	0c8H
 	DB	1 DUP(0)

	DB	'GBU10',  00H
 	DB	4 DUP(0)

	DB	00H
 	DB	1 DUP(0)

	DW	033H
	DW	014H
	DW	064H
	DW	00H
	DB	02H
	DB	06eH
	DB	0c8H
 	DB	1 DUP(0)

	DB	'GBU12',  00H
 	DB	4 DUP(0)

	DB	00H
 	DB	1 DUP(0)

	DW	033H
	DW	014H
	DW	064H
	DW	00H
	DB	02H
	DB	03cH
	DB	064H
 	DB	1 DUP(0)

	DB	'GBU15',  00H
 	DB	4 DUP(0)

	DB	00H
 	DB	1 DUP(0)

	DW	033H
	DW	014H
	DW	06cH
	DW	00H
	DB	02H
	DB	0c8H
	DB	0d2H
 	DB	1 DUP(0)

	DB	'CBU87',  00H
 	DB	4 DUP(0)

	DB	00H
 	DB	1 DUP(0)

	DW	032H
	DW	0cH
	DW	03e7H
	DW	00H
	DB	0ffH
	DB	03cH
	DB	032H
 	DB	1 DUP(0)

	DB	'CBU89',  00H
 	DB	4 DUP(0)

	DB	00H
 	DB	1 DUP(0)

	DW	032H
	DW	0cH
	DW	03e7H
	DW	00H
	DB	0ffH
	DB	03cH
	DB	014H
 	DB	1 DUP(0)

	DB	'AGM88',  00H
 	DB	4 DUP(0)

	DB	00H
 	DB	1 DUP(0)

	DW	01aH
	DW	014H
	DW	087H
	DW	010H
	DB	02H
	DB	06eH
	DB	06eH
 	DB	1 DUP(0)

	DB	'AGM84',  00H
 	DB	4 DUP(0)

	DB	'A',  00H
	DW	01bH
	DW	014H
	DW	0288H
	DW	06cH
	DB	02H
	DB	0c8H
	DB	0c8H
 	DB	1 DUP(0)

	DB	'AGM84',  00H
 	DB	4 DUP(0)

	DB	'E',  00H
	DW	01bH
	DW	014H
	DW	021cH
	DW	06cH
	DB	02H
	DB	0c8H
	DB	0c8H
 	DB	1 DUP(0)

	DB	'PHNIX',  00H
 	DB	4 DUP(0)

	DB	'A',  00H
	DW	030H
	DW	012H
	DW	023aH
	DW	010H
	DB	01H
	DB	00H
	DB	00H
 	DB	1 DUP(0)

	DB	'AXQ14',  00H
 	DB	4 DUP(0)

	DB	00H
 	DB	1 DUP(0)

	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DB	00H
	DB	00H
	DB	00H
 	DB	1 DUP(0)

	DB	'FUEL',  00H
 	DB	5 DUP(0)

	DB	00H
 	DB	1 DUP(0)

	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DB	00H
	DB	00H
	DB	00H
 	DB	1 DUP(0)

	DB	'9',  00H
 	DB	8 DUP(0)

	DB	'M',  00H
	DW	02fH
	DW	012H
	DW	02bH
	DW	02H
	DB	01H
	DB	00H
	DB	00H
 	DB	1 DUP(0)

	DB	'120',  00H
 	DB	6 DUP(0)

	DB	'A',  00H
	DW	031H
	DW	012H
	DW	010eH
	DW	010H
	DB	01H
	DB	00H
	DB	00H
 	DB	1 DUP(0)

	DB	'7',  00H
 	DB	8 DUP(0)

	DB	'M',  00H
	DW	02eH
	DW	012H
	DW	0d8H
	DW	010H
	DB	01H
	DB	00H
	DB	00H
 	DB	1 DUP(0)

	DB	'CANNON',  00H
 	DB	3 DUP(0)

	DB	00H
 	DB	1 DUP(0)

	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DB	01H
	DB	02dH
	DB	032H
 	DB	1 DUP(0)

$S940_n	DW	00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 12
; Line 13
; Line 14
; Line 15
; Line 16
; Line 17
; Line 18
; Line 19
; Line 20
; Line 21
; Line 22
; Line 23
; Line 24
; Line 25
; Line 94
	PUBLIC	_ARMT_MODE
_ARMT_MODE	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	MODE = 4
; Line 97
	mov	ax,WORD PTR [bp+4]	;MODE
	mov	WORD PTR _MODE_MASTER,ax
	cmp	ax,3
	jl	$I876
; Line 98
	mov	WORD PTR _MODE_MASTER,0
; Line 110
$I876:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ARMT_MODE	ENDP
; Line 114
	PUBLIC	_AA_MODE
_AA_MODE	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	MODE = 4
; Line 115
	cmp	WORD PTR _MODE_MASTER,1
	je	$I880
; Line 116
	mov	ax,1
	push	ax
	call	_ARMT_MODE
; Line 117
$I880:
	mov	ax,WORD PTR [bp+4]	;MODE
	mov	WORD PTR _MODE_AA,ax
; Line 118
	mov	sp,bp
	pop	bp
	ret	

_AA_MODE	ENDP
; Line 122
	PUBLIC	_ARMT_INIT
_ARMT_INIT	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 124
	cmp	WORD PTR _AWG9_REALITY_LEVEL,0
	jne	$I883
; Line 125
	mov	WORD PTR _MasterArmSW,1
; Line 126
; Line 127
$I883:
	jmp	_load_aa_stations
; Line 128
	nop	

_ARMT_INIT	ENDP
; Line 132
	PUBLIC	_load_aa_stations
_load_aa_stations	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 133
	mov	ax,WORD PTR _OurLoadOut
	jmp	$S886
; Line 134
	nop	
$SC890:
; Line 136
	mov	ax,18
	mov	WORD PTR _F14_STATION,ax
	mov	WORD PTR _F14_STATION+2,ax
; Line 140
	mov	ax,17
	mov	WORD PTR _F14_STATION+8,ax
	mov	WORD PTR _F14_STATION+10,ax
; Line 144
	mov	ax,15
	mov	WORD PTR _F14_STATION+4,ax
	mov	WORD PTR _F14_STATION+6,ax
$L20004:
	mov	WORD PTR _F14_STATION+12,ax
	mov	WORD PTR _F14_STATION+14,ax
	mov	WORD PTR _F14_STATION+16,ax
	mov	WORD PTR _F14_STATION+18,ax
; Line 146
	mov	ax,-1
$L20002:
	mov	WORD PTR _F14_STATION+20,ax
	mov	WORD PTR _F14_STATION+22,ax
; Line 147
	jmp	$SB887
; Line 149
	nop	
$SC891:
; Line 151
	mov	ax,18
	mov	WORD PTR _F14_STATION,ax
	mov	WORD PTR _F14_STATION+2,ax
; Line 155
	mov	ax,17
	mov	WORD PTR _F14_STATION+8,ax
	mov	WORD PTR _F14_STATION+10,ax
; Line 159
	mov	ax,-1
	mov	WORD PTR _F14_STATION+16,ax
	mov	WORD PTR _F14_STATION+18,ax
; Line 161
	mov	ax,20
	mov	WORD PTR _F14_STATION+4,ax
	mov	WORD PTR _F14_STATION+6,ax
$L20003:
	mov	WORD PTR _F14_STATION+12,ax
	mov	WORD PTR _F14_STATION+14,ax
	jmp	SHORT $L20002
; Line 163
$SC892:
; Line 165
	mov	ax,18
	mov	WORD PTR _F14_STATION,ax
	mov	WORD PTR _F14_STATION+2,ax
; Line 167
	mov	ax,20
	jmp	SHORT $L20005
; Line 177
$SC893:
; Line 181
	mov	ax,18
	mov	WORD PTR _F14_STATION,ax
	mov	WORD PTR _F14_STATION+2,ax
	mov	WORD PTR _F14_STATION+4,ax
	mov	WORD PTR _F14_STATION+6,ax
; Line 183
	mov	ax,17
	mov	WORD PTR _F14_STATION+8,ax
	mov	WORD PTR _F14_STATION+10,ax
; Line 185
	mov	ax,15
	mov	WORD PTR _F14_STATION+12,ax
	mov	WORD PTR _F14_STATION+14,ax
; Line 188
	mov	ax,-1
	mov	WORD PTR _F14_STATION+16,ax
	mov	WORD PTR _F14_STATION+18,ax
	mov	WORD PTR _F14_STATION+20,ax
; Line 189
	mov	WORD PTR _F14_STATION+22,20
; Line 190
	jmp	$SB887
; Line 191
$SC894:
; Line 195
	mov	ax,18
	mov	WORD PTR _F14_STATION,ax
	mov	WORD PTR _F14_STATION+2,ax
$L20005:
	mov	WORD PTR _F14_STATION+4,ax
	mov	WORD PTR _F14_STATION+6,ax
; Line 197
	mov	ax,17
	mov	WORD PTR _F14_STATION+8,ax
	mov	WORD PTR _F14_STATION+10,ax
; Line 201
	mov	ax,15
	jmp	$L20004
; Line 205
$SC895:
; Line 209
	mov	ax,18
	mov	WORD PTR _F14_STATION,ax
	mov	WORD PTR _F14_STATION+2,ax
	mov	WORD PTR _F14_STATION+4,ax
	mov	WORD PTR _F14_STATION+6,ax
; Line 211
	mov	ax,17
	mov	WORD PTR _F14_STATION+8,ax
	mov	WORD PTR _F14_STATION+10,ax
; Line 215
	mov	ax,-1
	mov	WORD PTR _F14_STATION+16,ax
	mov	WORD PTR _F14_STATION+18,ax
; Line 217
	mov	ax,20
	jmp	$L20003
; Line 219
	nop	
$SD896:
; Line 221
	mov	ax,18
	mov	WORD PTR _F14_STATION,ax
	mov	WORD PTR _F14_STATION+2,ax
; Line 225
	mov	ax,17
	mov	WORD PTR _F14_STATION+8,ax
	mov	WORD PTR _F14_STATION+10,ax
; Line 231
	mov	ax,-1
	mov	WORD PTR _F14_STATION+4,ax
	mov	WORD PTR _F14_STATION+6,ax
	mov	WORD PTR _F14_STATION+12,ax
	mov	WORD PTR _F14_STATION+14,ax
	mov	WORD PTR _F14_STATION+16,ax
	mov	WORD PTR _F14_STATION+18,ax
	jmp	$L20002
$S886:
	cmp	ax,5
	ja	$SD896
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20001[bx]
	nop	
$L20001:
		DW	$SC890
		DW	$SC891
		DW	$SC892
		DW	$SC893
		DW	$SC894
		DW	$SC895
$SB887:
; Line 234
	jmp	_Init3DMissiles
; Line 235
	nop	

_load_aa_stations	ENDP
; Line 239
	PUBLIC	_ARMT_get_priority
_ARMT_get_priority	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 240
	mov	ax,WORD PTR _MODE_MASTER
	jmp	SHORT $S900
; Line 241
$SC904:
; Line 242
	call	_AAGetPriority
	ret	
; Line 243
$SC906:
; Line 244
	sub	ax,ax
	ret	
	nop	
$S900:
	or	ax,ax
	je	$SC906
	dec	ax
	je	$SC904
; Line 246
	ret	

_ARMT_get_priority	ENDP
; Line 250
	PUBLIC	_AAGetPriority
_AAGetPriority	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	p = -2
; Line 253
	call	_AAGetStation
	mov	WORD PTR [bp-2],ax	;p
	inc	ax
	jne	$I910
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 254
$I910:
	mov	bx,WORD PTR [bp-2]	;p
	shl	bx,1
	mov	ax,WORD PTR _F14_STATION[bx]
; Line 255
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AAGetPriority	ENDP
; Line 260
	PUBLIC	_AAGetStation
_AAGetStation	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 263
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F913
$FC914:
	inc	WORD PTR [bp-2]	;i
$F913:
	cmp	WORD PTR [bp-2],12	;i
	jge	$FB915
; Line 264
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,1
	mov	ax,WORD PTR _F14_STATION[bx]
	sub	ax,15
	je	$SC922
	sub	ax,3
	je	$SC920
	dec	ax
	jl	$FC914
	dec	ax
	jle	$SC924
	jmp	SHORT $FC914
; Line 265
$SC920:
; Line 266
	cmp	WORD PTR _MODE_AA,1
$L20007:
	jne	$FC914
	mov	ax,WORD PTR [bp-2]	;i
	mov	sp,bp
	pop	bp
	ret	
$SC922:
; Line 269
	cmp	WORD PTR _MODE_AA,4
	jmp	SHORT $L20007
	nop	
$SC924:
; Line 273
	cmp	WORD PTR _MODE_AA,0
	jmp	SHORT $L20007
	nop	
$FB915:
; Line 276
	mov	ax,-1
; Line 277
	mov	sp,bp
	pop	bp
	ret	
	nop	

_AAGetStation	ENDP
; Line 282
	PUBLIC	_aa_cnt_weapons
_aa_cnt_weapons	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	i = -4
;	cnt = -2
; Line 287
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;cnt
	mov	WORD PTR [bp-4],ax	;i
	jmp	SHORT $F930
; Line 289
	nop	
$SC937:
; Line 293
	inc	WORD PTR [bp-2]	;cnt
; Line 294
$FC931:
	inc	WORD PTR [bp-4]	;i
$F930:
	cmp	WORD PTR [bp-4],12	;i
	jge	$FB932
; Line 288
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	mov	ax,WORD PTR _F14_STATION[bx]
	sub	ax,15
	je	$SC937
	sub	ax,3
	jl	$FC931
	dec	ax
	dec	ax
	jle	$SC937
	jmp	SHORT $FC931
	nop	
$FB932:
; Line 296
	mov	ax,WORD PTR [bp-2]	;cnt
; Line 297
	mov	sp,bp
	pop	bp
	ret	
	nop	

_aa_cnt_weapons	ENDP
; Line 301
aa_release	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
;	p = -2
;	VL = -14
; Line 306
	cmp	WORD PTR $S940_n,0
	jle	$I943
; Line 307
	mov	WORD PTR $S940_n,0
; Line 308
$L20008:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
$I943:
; Line 310
	call	_AAGetStation
	mov	WORD PTR [bp-2],ax	;p
	inc	ax
	je	$L20008
; Line 314
	mov	ax,WORD PTR [bp-2]	;p
	mov	WORD PTR _LastSlotNMount,ax
; Line 316
	mov	WORD PTR $S940_n,1
; Line 320
	sub	cx,cx
	mov	WORD PTR _LP+2,cx
	mov	WORD PTR _LP+4,cx
	mov	WORD PTR _LP+6,cx
; Line 322
	mov	cx,OFFSET _PLYR_M
	push	cx
	mov	cx,OFFSET DGROUP:_LP+2
	push	cx
	call	_Rotate
; Line 324
	mov	bx,WORD PTR [bp-2]	;p
	shl	bx,1
	mov	ax,WORD PTR _F14_STATION[bx]
	mov	WORD PTR _LP,ax
; Line 325
	mov	WORD PTR _F14_STATION[bx],0
; Line 327
	mov	ax,OFFSET DGROUP:_LP
; Line 328
; Line 329
	mov	sp,bp
	pop	bp
	ret	
	nop	

aa_release	ENDP
; Line 333
	PUBLIC	_ARMT_release
_ARMT_release	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 334
	mov	ax,WORD PTR _MODE_MASTER
	jmp	SHORT $S948
; Line 335
$SC952:
; Line 336
	call	aa_release
	ret	
; Line 337
$SC953:
; Line 338
	sub	ax,ax
	ret	
	nop	
$S948:
	or	ax,ax
	je	$SC953
	dec	ax
	je	$SC952
; Line 340
	ret	

_ARMT_release	ENDP
; Line 344
	PUBLIC	_ARMT_jettison_all
_ARMT_jettison_all	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	i = -2
;	DroppedSomething = -4
; Line 351
	call	_JettisonFuel
; Line 356
	mov	WORD PTR [bp-2],0	;i
$FC962:
; Line 357
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,1
	cmp	WORD PTR _F14_STATION[bx],17
	jne	$L20009
; Line 358
	mov	WORD PTR _F14_STATION[bx],0
; Line 359
$L20009:
	inc	WORD PTR [bp-2]	;i
	cmp	WORD PTR [bp-2],12	;i
	jl	$FC962
; Line 360
	mov	sp,bp
	pop	bp
	ret	

_ARMT_jettison_all	ENDP
_TEXT	ENDS
END
