;	Static Name Aliases
;
;	$S769_MenuRX	EQU	MenuRX
;	$S770_MenuRp	EQU	MenuRp
;	$S771_MenuRX2	EQU	MenuRX2
;	$S772_MenuRp2	EQU	MenuRp2
;	$S760_R_DISABLE	EQU	R_DISABLE
;	$S761_MOSspr	EQU	MOSspr
;	$S762_MOShotx	EQU	MOShotx
;	$S763_MOShoty	EQU	MOShoty
;	$S764_MosON	EQU	MosON
	TITLE   C:\NMENUS.C
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
PUBLIC  _MISSILETRAIL
PUBLIC  _MSGDETAIL
PUBLIC  _SNDDETAIL
PUBLIC  _menuhotspots
EXTRN	_SndSounds:FAR
EXTRN	_RectCopy:FAR
EXTRN	_RpPrint:FAR
EXTRN	_MapInEMSSprite:NEAR
EXTRN	_LoadPicture:NEAR
EXTRN	_kbhit:NEAR
EXTRN	_EndGame:NEAR
EXTRN	_SaveJoyConfig:NEAR
EXTRN	_LoadNewCockpit:NEAR
EXTRN	_ScreenOff:FAR
EXTRN	_ScreenOn:FAR
EXTRN	_CharWidth:FAR
EXTRN	_RectFill:FAR
EXTRN	_UpdatePalBuf:NEAR
EXTRN	_ClearPage:FAR
EXTRN	_LoadPalToPal:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_ScaleRotate:NEAR
EXTRN	_MouseTYPE:FAR
EXTRN	__bios_keybrd:NEAR
EXTRN	_ShowPage:FAR
EXTRN	_MouseSHOW:FAR
EXTRN	_MouseHIDE:FAR
EXTRN	_MouseHITS:FAR
EXTRN	_SetJoysticks:NEAR
EXTRN	_JoyRecal:NEAR
EXTRN	_LibCanDo:FAR
EXTRN	_RedrawJoyBox:NEAR
_BSS      SEGMENT
COMM NEAR	_mseg:	BYTE:	 2
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_lastmsgview:WORD
EXTRN	_View:WORD
EXTRN	_ExitCode:BYTE
EXTRN	_KbSense:WORD
EXTRN	_RudderStick:WORD
EXTRN	_MouseSprite:WORD
EXTRN	_GRNDDETAIL:WORD
EXTRN	_PLANEDETAIL:WORD
EXTRN	_SKYDETAIL:WORD
_BSS      SEGMENT
COMM NEAR	_RudderType:	BYTE:	 2
_BSS      ENDS
EXTRN	_StickType:WORD
EXTRN	_MouseX:WORD
EXTRN	_MouseY:WORD
_DATA      SEGMENT
$SG785	DB	'CFG-bac2.PIC',  00H
$SG858	DB	'F14ORG01.PIC',  00H
	ORG	$+392
$SG864	DB	'Quality Assurance',  00H
$SG865	DB	'Vaughn Thomas',  00H
$SG866	DB	'Version: 1.18',  00H
$SG892	DB	'CFG-bac2.PIC',  00H
	ORG	$-451
_MISSILETRAIL	DW	01H
_MSGDETAIL	DW	00H
_SNDDETAIL	DW	00H
$S760_R_DISABLE	DW	00H
$S761_MOSspr	DW	00H
$S764_MosON	DW	01H
_menuhotspots	DW	05dH
	DW	01aH
	DW	067H
	DW	020H
	DW	00H
	DW	05dH
	DW	022H
	DW	067H
	DW	028H
	DW	01H
	DW	05dH
	DW	02aH
	DW	067H
	DW	030H
	DW	02H
	DW	05dH
	DW	032H
	DW	067H
	DW	038H
	DW	03H
	DW	05dH
	DW	03aH
	DW	067H
	DW	040H
	DW	04H
	DW	05dH
	DW	042H
	DW	067H
	DW	048H
	DW	06H
	DW	05dH
	DW	04aH
	DW	067H
	DW	050H
	DW	05H
	DW	05dH
	DW	052H
	DW	067H
	DW	058H
	DW	07H
	DW	05dH
	DW	064H
	DW	067H
	DW	06aH
	DW	08H
	DW	05dH
	DW	06cH
	DW	067H
	DW	072H
	DW	09H
	DW	05dH
	DW	074H
	DW	067H
	DW	07aH
	DW	0aH
	DW	06H
	DW	0b3H
	DW	049H
	DW	0c4H
	DW	033H
	DW	051H
	DW	0b3H
	DW	094H
	DW	0c4H
	DW	034H
	DW	0f6H
	DW	0b3H
	DW	0139H
	DW	0c4H
	DW	035H
	DW	0dcH
	DW	098H
	DW	010eH
	DW	0a4H
	DW	032H
	DW	0beH
	DW	01aH
	DW	0c9H
	DW	020H
	DW	0bH
	DW	0beH
	DW	022H
	DW	0c9H
	DW	028H
	DW	0cH
	DW	0beH
	DW	02aH
	DW	0c9H
	DW	030H
	DW	0dH
	DW	0beH
	DW	032H
	DW	0c9H
	DW	039H
	DW	0eH
	DW	0beH
	DW	044H
	DW	0caH
	DW	04bH
	DW	0fH
	DW	0beH
	DW	04cH
	DW	0caH
	DW	053H
	DW	010H
	DW	0beH
	DW	054H
	DW	0caH
	DW	05bH
	DW	011H
	DW	0beH
	DW	05cH
	DW	0caH
	DW	063H
	DW	012H
	DW	09dH
	DW	076H
	DW	0adH
	DW	07dH
	DW	014H
	DW	0adH
	DW	076H
	DW	0bdH
	DW	07dH
	DW	015H
	DW	0bdH
	DW	076H
	DW	0cbH
	DW	07dH
	DW	016H
	DW	09dH
	DW	07eH
	DW	0adH
	DW	085H
	DW	017H
	DW	0adH
	DW	07eH
	DW	0bdH
	DW	085H
	DW	018H
	DW	0bdH
	DW	07eH
	DW	0cbH
	DW	085H
	DW	019H
	DW	09dH
	DW	086H
	DW	0adH
	DW	08dH
	DW	01aH
	DW	0adH
	DW	086H
	DW	0bdH
	DW	08dH
	DW	01bH
	DW	0bdH
	DW	086H
	DW	0cbH
	DW	08dH
	DW	01cH
	DW	0adH
	DW	096H
	DW	0bdH
	DW	09dH
	DW	01dH
	DW	0bdH
	DW	096H
	DW	0cbH
	DW	09dH
	DW	01eH
$S769_MenuRX	DW	00H
	DW	00H
	DW	00H
	DW	013fH
	DW	0c7H
	DW	02H
	DW	02H
	DW	00H
	DW	01H
$S770_MenuRp	DW	DGROUP:$S769_MenuRX
$S771_MenuRX2	DW	01H
	DW	00H
	DW	00H
	DW	013fH
	DW	0c7H
	DW	02H
	DW	02H
	DW	00H
	DW	01H
$S772_MenuRp2	DW	DGROUP:$S771_MenuRX2
_DATA      ENDS
_BSS      SEGMENT
$S762_MOShotx	DW 01H DUP (?)
$S763_MOShoty	DW 01H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
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
; Line 26
; Line 165
	PUBLIC	_MainMenu
_MainMenu	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,784
	call	__aNchkstk
;	key = -10
;	done = -4
;	MyMouseHits = -6
;	selectedfunc = -2
;	i = -8
;	PalPkt = -784
; Line 173
	sub	ax,ax
	mov	WORD PTR [bp-10],ax	;key
	mov	WORD PTR [bp-4],ax	;done
	mov	WORD PTR [bp-6],ax	;MyMouseHits
	mov	WORD PTR [bp-2],ax	;selectedfunc
	push	ax
	push	ax
	push	WORD PTR _MouseSprite
	call	_MouseSETUP
	add	sp,6
; Line 175
	call	FAR PTR _ScreenOff
; Line 177
	mov	ax,6
	push	ax
	call	FAR PTR _SndSounds
	add	sp,2
; Line 179
	call	FAR PTR _MouseHIDE
; Line 182
	mov	ax,OFFSET DGROUP:$SG785
	push	ax
	mov	ax,1
	push	ax
	call	_LoadPicture
	add	sp,4
; Line 186
	sub	ax,ax
	push	ax
	mov	ax,2
	push	ax
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR _mseg,ax
; Line 188
	mov	ax,1
	push	ax
	call	FAR PTR _ShowPage
	add	sp,2
; Line 189
	call	FAR PTR _ScreenOn
; Line 190
	call	_DrawSettings
; Line 192
	call	FAR PTR _MouseSHOW
; Line 195
	jmp	SHORT $L20003
$FC790:
	sub	ax,ax
	push	ax
	call	__bios_keybrd
	add	sp,2
$L20003:
	call	_kbhit
	or	ax,ax
	jne	$FC790
; Line 197
	jmp	$L20013
	nop	
$FC793:
; Line 198
	mov	WORD PTR [bp-10],0	;key
; Line 200
	call	FAR PTR _MouseHITS
	mov	WORD PTR [bp-6],ax	;MyMouseHits
; Line 202
	call	_kbhit
	or	ax,ax
	je	$I795
; Line 203
	sub	ax,ax
	push	ax
	call	__bios_keybrd
	add	sp,2
	mov	WORD PTR [bp-10],ax	;key
; Line 205
$I795:
	cmp	WORD PTR [bp-10],0	;key
	je	$SB798
; Line 206
	mov	ax,WORD PTR [bp-10]	;key
	sub	ax,283
	jne	$SB798
; Line 224
; Line 208
	inc	WORD PTR [bp-4]	;done
; Line 209
$SB798:
; Line 226
; Line 228
	test	BYTE PTR [bp-6],1	;MyMouseHits
	jne	$JCC187
	jmp	$L20013
$JCC187:
; Line 229
	mov	WORD PTR [bp-2],-1	;selectedfunc
; Line 230
	mov	WORD PTR [bp-8],0	;i
; Line 218
$FC805:
; Line 232
	mov	bx,WORD PTR [bp-8]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _MouseX
	cmp	WORD PTR _menuhotspots[bx],ax
	jg	$L20009
	mov	ax,WORD PTR _MouseX
	cmp	WORD PTR _menuhotspots[bx+4],ax
	jl	$L20009
	mov	ax,WORD PTR _MouseY
	cmp	WORD PTR _menuhotspots[bx+2],ax
	jg	$L20009
	mov	ax,WORD PTR _MouseY
	cmp	WORD PTR _menuhotspots[bx+6],ax
	jl	$L20009
; Line 233
	mov	ax,WORD PTR _menuhotspots[bx+8]
	mov	WORD PTR [bp-2],ax	;selectedfunc
; Line 234
; Line 235
$L20009:
	inc	WORD PTR [bp-8]	;i
	cmp	WORD PTR [bp-8],34	;i
	jl	$FC805
; Line 237
	cmp	WORD PTR [bp-2],-1	;selectedfunc
	jne	$JCC271
	jmp	$L20013
$JCC271:
; Line 238
	mov	ax,WORD PTR [bp-2]	;selectedfunc
	jmp	$S809
; Line 239
$SC813:
; Line 240
	sub	ax,ax
	push	ax
	push	WORD PTR _StickType
	call	_ReDraw
	add	sp,4
; Line 241
	sub	ax,ax
	push	ax
	call	_SetJoysticks
	add	sp,2
; Line 409
; Line 410
; Line 412
	jmp	$L20013
; Line 243
	nop	
$SC816:
; Line 244
	mov	ax,1
	push	ax
	push	WORD PTR _StickType
	call	_ReDraw
	add	sp,4
; Line 245
	mov	ax,1
$L20004:
	push	ax
	call	_SetJoysticks
	add	sp,2
	jmp	$L20012
; Line 248
	nop	
$SC818:
; Line 249
	mov	ax,2
$L20005:
	push	ax
	push	WORD PTR _StickType
	call	_ReDraw
	add	sp,4
; Line 250
	mov	ax,2
	jmp	SHORT $L20004
; Line 253
	nop	
$SC819:
; Line 254
	mov	ax,3
	push	ax
	push	WORD PTR _StickType
	call	_ReDraw
	add	sp,4
; Line 255
	mov	ax,3
	jmp	SHORT $L20004
; Line 258
	nop	
$SC820:
; Line 259
	mov	ax,4
	push	ax
	push	WORD PTR _StickType
	call	_ReDraw
	add	sp,4
; Line 260
	mov	ax,4
	jmp	SHORT $L20004
; Line 263
	nop	
$SC821:
; Line 264
	mov	ax,6
	jmp	SHORT $L20005
; Line 268
	nop	
$SC822:
; Line 269
	mov	ax,5
	push	ax
	push	WORD PTR _StickType
	call	_ReDraw
	add	sp,4
; Line 270
	mov	ax,5
	jmp	SHORT $L20004
; Line 274
	nop	
$SC823:
; Line 276
	xor	BYTE PTR _RudderStick,4
	test	BYTE PTR _RudderStick,4
	je	$I824
; Line 277
; Line 278
	mov	ax,7
	push	ax
	push	ax
	call	_ReDraw
	add	sp,4
; Line 279
	jmp	$L20012
$I824:
; Line 282
	push	WORD PTR _StickType
	mov	ax,7
	push	ax
	call	_ReDraw
	jmp	$L20011
; Line 285
$SC826:
; Line 286
	mov	ax,8
	push	ax
	mov	ax,10
	sub	ax,WORD PTR _KbSense
	push	ax
	call	_ReDraw
	add	sp,4
; Line 287
	mov	WORD PTR _KbSense,2
; Line 288
	jmp	$L20013
; Line 289
	nop	
$SC827:
; Line 290
	mov	ax,9
	push	ax
	mov	ax,10
	sub	ax,WORD PTR _KbSense
	push	ax
	call	_ReDraw
	add	sp,4
; Line 291
	mov	WORD PTR _KbSense,1
; Line 292
	jmp	$L20013
; Line 293
	nop	
$SC828:
; Line 294
	mov	ax,10
	push	ax
	sub	ax,WORD PTR _KbSense
	push	ax
	call	_ReDraw
	add	sp,4
; Line 295
	mov	WORD PTR _KbSense,0
; Line 296
	jmp	$L20013
; Line 298
$SC829:
; Line 299
	mov	ax,15
	push	ax
	add	ax,WORD PTR _SNDDETAIL
	push	ax
	call	_ReDraw
	add	sp,4
; Line 300
	mov	WORD PTR _SNDDETAIL,0
; Line 301
	jmp	$L20013
; Line 302
$SC830:
; Line 303
	mov	ax,16
	push	ax
	mov	ax,WORD PTR _SNDDETAIL
	add	ax,15
	push	ax
	call	_ReDraw
	add	sp,4
; Line 304
	mov	WORD PTR _SNDDETAIL,1
; Line 305
	jmp	$L20013
; Line 306
$SC831:
; Line 307
	mov	ax,17
	push	ax
	mov	ax,WORD PTR _SNDDETAIL
	add	ax,15
	push	ax
	call	_ReDraw
	add	sp,4
; Line 308
	mov	WORD PTR _SNDDETAIL,2
; Line 309
	jmp	$L20013
; Line 310
$SC832:
; Line 311
	mov	ax,18
	push	ax
	mov	ax,WORD PTR _SNDDETAIL
	add	ax,15
	push	ax
	call	_ReDraw
	add	sp,4
; Line 312
	mov	WORD PTR _SNDDETAIL,3
; Line 313
	jmp	$L20013
; Line 315
$SC833:
; Line 316
	mov	ax,19
	push	ax
	add	ax,WORD PTR _MSGDETAIL
	push	ax
	call	_ReDraw
	add	sp,4
; Line 317
	mov	WORD PTR _MSGDETAIL,0
; Line 318
	jmp	$L20013
; Line 319
$SC834:
; Line 320
	mov	ax,20
	push	ax
	mov	ax,WORD PTR _MSGDETAIL
	add	ax,19
	push	ax
	call	_ReDraw
	add	sp,4
; Line 321
	mov	WORD PTR _MSGDETAIL,1
; Line 322
	jmp	$L20013
; Line 323
$SC835:
; Line 324
	mov	ax,21
	push	ax
	mov	ax,WORD PTR _MSGDETAIL
	add	ax,19
	push	ax
	call	_ReDraw
	add	sp,4
; Line 325
	mov	WORD PTR _MSGDETAIL,2
; Line 326
	jmp	$L20013
; Line 327
$SC836:
; Line 328
	mov	ax,22
	push	ax
	mov	ax,WORD PTR _MSGDETAIL
	add	ax,19
	push	ax
	call	_ReDraw
	add	sp,4
; Line 329
	mov	WORD PTR _MSGDETAIL,3
; Line 330
	jmp	$L20013
; Line 332
$SC837:
; Line 333
	mov	ax,23
	push	ax
	mov	ax,25
	sub	ax,WORD PTR _SKYDETAIL
	push	ax
	call	_ReDraw
	add	sp,4
; Line 334
	mov	WORD PTR _SKYDETAIL,2
; Line 335
	jmp	$L20013
; Line 337
	nop	
$SC838:
; Line 338
	mov	ax,24
	push	ax
	mov	ax,25
	sub	ax,WORD PTR _SKYDETAIL
	push	ax
	call	_ReDraw
	add	sp,4
; Line 339
	mov	WORD PTR _SKYDETAIL,1
; Line 340
	jmp	$L20013
; Line 342
	nop	
$SC839:
; Line 343
	mov	ax,25
	push	ax
	sub	ax,WORD PTR _SKYDETAIL
	push	ax
	call	_ReDraw
	add	sp,4
; Line 344
	mov	WORD PTR _SKYDETAIL,0
; Line 345
	jmp	$L20013
; Line 347
$SC840:
; Line 348
	mov	ax,26
	push	ax
	mov	ax,28
	sub	ax,WORD PTR _GRNDDETAIL
	push	ax
	call	_ReDraw
	add	sp,4
; Line 349
	mov	WORD PTR _GRNDDETAIL,2
; Line 350
	jmp	$L20013
; Line 352
	nop	
$SC841:
; Line 353
	mov	ax,27
	push	ax
	mov	ax,28
	sub	ax,WORD PTR _GRNDDETAIL
	push	ax
	call	_ReDraw
	add	sp,4
; Line 354
	mov	WORD PTR _GRNDDETAIL,1
; Line 355
	jmp	$L20013
; Line 357
	nop	
$SC842:
; Line 358
	mov	ax,28
	push	ax
	sub	ax,WORD PTR _GRNDDETAIL
	push	ax
	call	_ReDraw
	add	sp,4
; Line 359
	mov	WORD PTR _GRNDDETAIL,0
; Line 360
	jmp	$L20013
; Line 362
$SC843:
; Line 363
	mov	ax,29
	push	ax
	mov	ax,31
	sub	ax,WORD PTR _PLANEDETAIL
	push	ax
	call	_ReDraw
	add	sp,4
; Line 364
	mov	WORD PTR _PLANEDETAIL,2
; Line 365
	jmp	$L20013
; Line 367
	nop	
$SC844:
; Line 368
	mov	ax,30
	push	ax
	mov	ax,31
	sub	ax,WORD PTR _PLANEDETAIL
	push	ax
	call	_ReDraw
	add	sp,4
; Line 369
	mov	WORD PTR _PLANEDETAIL,1
; Line 370
	jmp	$L20013
; Line 372
	nop	
$SC845:
; Line 373
	mov	ax,31
	push	ax
	sub	ax,WORD PTR _PLANEDETAIL
	push	ax
	call	_ReDraw
	add	sp,4
; Line 374
	mov	WORD PTR _PLANEDETAIL,0
; Line 375
	jmp	$L20013
; Line 377
$SC846:
; Line 378
	mov	ax,32
	push	ax
	mov	ax,33
	sub	ax,WORD PTR _MISSILETRAIL
	push	ax
	call	_ReDraw
	add	sp,4
; Line 379
	mov	WORD PTR _MISSILETRAIL,1
; Line 380
	jmp	$L20013
; Line 382
	nop	
$SC847:
; Line 383
	mov	ax,33
	push	ax
	sub	ax,WORD PTR _MISSILETRAIL
	push	ax
	call	_ReDraw
	add	sp,4
; Line 384
	mov	WORD PTR _MISSILETRAIL,0
; Line 385
	jmp	$L20013
; Line 387
$SC848:
; Line 389
	cmp	WORD PTR _StickType,0
	jne	$JCC1043
	jmp	$L20013
$JCC1043:
; Line 390
; Line 391
$L20012:
	mov	ax,120
	push	ax
	mov	ax,153
	push	ax
	call	_MikesJoyStickRecal
$L20011:
	add	sp,4
; Line 392
; Line 393
	jmp	$L20013
; Line 397
	nop	
$SC851:
; Line 399
	inc	WORD PTR [bp-4]	;done
; Line 400
	sub	ax,ax
	push	ax
	call	_EndGame
	add	sp,2
; Line 401
	mov	BYTE PTR _ExitCode,0
; Line 402
	jmp	$L20013
; Line 403
$SC853:
; Line 404
	sub	ax,ax
	push	ax
	call	_EndGame
	add	sp,2
; Line 405
	mov	BYTE PTR _ExitCode,0
$SC850:
; Line 395
	inc	WORD PTR [bp-4]	;done
; Line 396
	jmp	$L20013
	nop	
	nop	
$S809:
	cmp	ax,4096
	je	$SC851
	jg	$L20001
	cmp	ax,53
	ja	$L20013
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20002[bx]
$L20002:
		DW	$SC813
		DW	$SC816
		DW	$SC818
		DW	$SC819
		DW	$SC820
		DW	$SC822
		DW	$SC821
		DW	$SC823
		DW	$SC826
		DW	$SC827
		DW	$SC828
		DW	$SC829
		DW	$SC830
		DW	$SC831
		DW	$SC832
		DW	$SC833
		DW	$SC834
		DW	$SC835
		DW	$SC836
		DW	$L20013
		DW	$SC837
		DW	$SC838
		DW	$SC839
		DW	$SC840
		DW	$SC841
		DW	$SC842
		DW	$SC843
		DW	$SC844
		DW	$SC845
		DW	$SC846
		DW	$SC847
		DW	$L20013
		DW	$L20013
		DW	$L20013
		DW	$L20013
		DW	$L20013
		DW	$L20013
		DW	$L20013
		DW	$L20013
		DW	$L20013
		DW	$L20013
		DW	$L20013
		DW	$L20013
		DW	$L20013
		DW	$L20013
		DW	$L20013
		DW	$L20013
		DW	$L20013
		DW	$L20013
		DW	$L20013
		DW	$SC848
		DW	$SC850
		DW	$SC851
		DW	$SC853
$L20001:
	sub	ax,4978
	jne	$JCC1239
	jmp	$SC848
$JCC1239:
$L20013:
	cmp	WORD PTR [bp-4],0	;done
	jne	$JCC1248
	jmp	$FC793
$JCC1248:
; Line 413
	call	FAR PTR _MouseHIDE
; Line 414
	call	FAR PTR _ScreenOff
; Line 415
	mov	WORD PTR _lastmsgview,-1
; Line 416
	call	_SaveJoyConfig
; Line 420
	cmp	WORD PTR _View,70
	jge	$I855
; Line 421
	call	_LoadNewCockpit
; Line 422
	jmp	SHORT $I857
$I855:
; Line 423
	sub	ax,ax
	push	ax
	push	ax
	call	FAR PTR _ClearPage
	add	sp,4
; Line 424
	lea	ax,WORD PTR [bp-784]	;PalPkt
	push	ax
	mov	cx,OFFSET DGROUP:$SG858
	push	cx
	call	_LoadPalToPal
	add	sp,4
; Line 425
	lea	ax,WORD PTR [bp-784]	;PalPkt
	push	ax
	call	_UpdatePalBuf
	add	sp,2
; Line 426
$I857:
; Line 428
	mov	ax,7
	push	ax
	call	FAR PTR _SndSounds
	add	sp,2
; Line 429
	call	FAR PTR _MouseSHOW
; Line 431
	cmp	WORD PTR _SNDDETAIL,1
	je	$I861
	cmp	WORD PTR _SNDDETAIL,3
	jne	$I860
$I861:
; Line 432
	mov	ax,27
	jmp	SHORT $L20008
$I860:
; Line 434
	mov	ax,28
$L20008:
	push	ax
	call	FAR PTR _SndSounds
; Line 437
	mov	sp,bp
	pop	bp
	ret	
	nop	

_MainMenu	ENDP
; Line 441
	PUBLIC	_DrawSettings
_DrawSettings	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
; Line 442
	mov	bx,WORD PTR $S770_MenuRp
	mov	WORD PTR [bx+16],2
; Line 443
	mov	bx,WORD PTR $S770_MenuRp
	mov	WORD PTR [bx+12],10
; Line 445
	call	FAR PTR _MouseHIDE
; Line 447
	mov	ax,18
	push	ax
	mov	cx,35
	push	cx
	mov	cx,85
	push	cx
	mov	cx,8
	push	cx
	mov	cx,223
	push	cx
	push	WORD PTR $S770_MenuRp
	call	FAR PTR _RectFill
	add	sp,12
; Line 448
	mov	ax,OFFSET DGROUP:$SG864
	push	ax
	mov	ax,10
	push	ax
	mov	cx,225
	push	cx
	push	WORD PTR $S770_MenuRp
	call	FAR PTR _RpPrint
	add	sp,8
; Line 449
	mov	ax,OFFSET DGROUP:$SG865
	push	ax
	mov	ax,18
	push	ax
	mov	ax,225
	push	ax
	push	WORD PTR $S770_MenuRp
	call	FAR PTR _RpPrint
	add	sp,8
; Line 450
	mov	ax,OFFSET DGROUP:$SG866
	push	ax
	mov	ax,26
	push	ax
	mov	ax,225
	push	ax
	push	WORD PTR $S770_MenuRp
	call	FAR PTR _RpPrint
	add	sp,8
; Line 454
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	cx,256
	push	cx
	mov	bx,WORD PTR _StickType
	mov	dx,bx
	shl	bx,1
	shl	bx,1
	add	bx,dx
	shl	bx,1
	mov	dx,WORD PTR _menuhotspots[bx+2]
	add	dx,3
	push	dx
	mov	dx,WORD PTR _menuhotspots[bx]
	add	dx,5
	push	dx
	push	WORD PTR $S770_MenuRp
	mov	dx,6
	push	dx
	push	dx
	mov	bx,104
	push	bx
	mov	si,185
	push	si
	push	WORD PTR _mseg
	call	_ScaleRotate
	add	sp,24
; Line 457
	cmp	WORD PTR _RudderStick,0
	je	$I868
; Line 459
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,WORD PTR _menuhotspots+72
	add	ax,3
	push	ax
	mov	ax,WORD PTR _menuhotspots+70
	add	ax,5
	push	ax
	push	WORD PTR $S770_MenuRp
	mov	ax,6
	push	ax
	push	ax
	mov	ax,104
	push	ax
	push	si
	push	WORD PTR _mseg
	call	_ScaleRotate
	add	sp,24
; Line 462
$I868:
; Line 463
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	cx,256
	push	cx
	mov	bx,OFFSET DGROUP:_menuhotspots+102
	mov	dx,WORD PTR _KbSense
	mov	si,dx
	shl	dx,1
	shl	dx,1
	add	dx,si
	shl	dx,1
	sub	bx,dx
	mov	si,WORD PTR [bx]
	add	si,3
	push	si
	mov	bx,OFFSET DGROUP:_menuhotspots+100
	sub	bx,dx
	mov	dx,WORD PTR [bx]
	add	dx,5
	push	dx
	push	WORD PTR $S770_MenuRp
	mov	dx,6
	push	dx
	push	dx
	mov	bx,104
	push	bx
	mov	si,185
	push	si
	push	WORD PTR _mseg
	call	_ScaleRotate
	add	sp,24
; Line 467
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	cx,256
	push	cx
	mov	bx,WORD PTR _SNDDETAIL
	mov	dx,bx
	shl	bx,1
	shl	bx,1
	add	bx,dx
	shl	bx,1
	mov	dx,WORD PTR _menuhotspots[bx+152]
	add	dx,3
	push	dx
	mov	dx,WORD PTR _menuhotspots[bx+150]
	add	dx,5
	push	dx
	push	WORD PTR $S770_MenuRp
	mov	dx,6
	push	dx
	push	dx
	mov	bx,104
	push	bx
	push	si
	push	WORD PTR _mseg
	call	_ScaleRotate
	add	sp,24
; Line 471
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	cx,256
	push	cx
	mov	bx,WORD PTR _MSGDETAIL
	mov	dx,bx
	shl	bx,1
	shl	bx,1
	add	bx,dx
	shl	bx,1
	mov	dx,WORD PTR _menuhotspots[bx+192]
	add	dx,3
	push	dx
	mov	dx,WORD PTR _menuhotspots[bx+190]
	add	dx,5
	push	dx
	push	WORD PTR $S770_MenuRp
	mov	dx,6
	push	dx
	push	dx
	mov	bx,104
	push	bx
	push	si
	push	WORD PTR _mseg
	call	_ScaleRotate
	add	sp,24
; Line 475
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	cx,256
	push	cx
	mov	bx,OFFSET DGROUP:_menuhotspots+252
	mov	dx,WORD PTR _SKYDETAIL
	mov	di,dx
	shl	dx,1
	shl	dx,1
	add	dx,di
	shl	dx,1
	sub	bx,dx
	mov	di,WORD PTR [bx]
	add	di,3
	push	di
	mov	bx,OFFSET DGROUP:_menuhotspots+250
	sub	bx,dx
	mov	dx,WORD PTR [bx]
	add	dx,5
	push	dx
	push	WORD PTR $S770_MenuRp
	mov	dx,6
	push	dx
	push	dx
	mov	bx,104
	push	bx
	push	si
	push	WORD PTR _mseg
	call	_ScaleRotate
	add	sp,24
; Line 477
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	cx,256
	push	cx
	mov	bx,OFFSET DGROUP:_menuhotspots+282
	mov	dx,WORD PTR _GRNDDETAIL
	mov	di,dx
	shl	dx,1
	shl	dx,1
	add	dx,di
	shl	dx,1
	sub	bx,dx
	mov	di,WORD PTR [bx]
	add	di,3
	push	di
	mov	bx,OFFSET DGROUP:_menuhotspots+280
	sub	bx,dx
	mov	dx,WORD PTR [bx]
	add	dx,5
	push	dx
	push	WORD PTR $S770_MenuRp
	mov	dx,6
	push	dx
	push	dx
	mov	bx,104
	push	bx
	push	si
	push	WORD PTR _mseg
	call	_ScaleRotate
	add	sp,24
; Line 479
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	cx,256
	push	cx
	mov	bx,OFFSET DGROUP:_menuhotspots+312
	mov	dx,WORD PTR _PLANEDETAIL
	mov	di,dx
	shl	dx,1
	shl	dx,1
	add	dx,di
	shl	dx,1
	sub	bx,dx
	mov	di,WORD PTR [bx]
	add	di,3
	push	di
	mov	bx,OFFSET DGROUP:_menuhotspots+310
	sub	bx,dx
	mov	dx,WORD PTR [bx]
	add	dx,5
	push	dx
	push	WORD PTR $S770_MenuRp
	mov	dx,6
	push	dx
	push	dx
	mov	bx,104
	push	bx
	push	si
	push	WORD PTR _mseg
	call	_ScaleRotate
	add	sp,24
; Line 483
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	bx,OFFSET DGROUP:_menuhotspots+332
	mov	ax,WORD PTR _MISSILETRAIL
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	sub	bx,ax
	mov	cx,WORD PTR [bx]
	add	cx,3
	push	cx
	mov	bx,OFFSET DGROUP:_menuhotspots+330
	sub	bx,ax
	mov	ax,WORD PTR [bx]
	add	ax,5
	push	ax
	push	WORD PTR $S770_MenuRp
	mov	ax,6
	push	ax
	push	ax
	mov	ax,104
	push	ax
	push	si
	push	WORD PTR _mseg
	call	_ScaleRotate
	add	sp,24
; Line 485
	call	FAR PTR _MouseSHOW
; Line 487
	pop	si
	pop	di
	ret	
	nop	

_DrawSettings	ENDP
; Line 491
	PUBLIC	_ReDraw
_ReDraw	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	current = 6
;	prev = 4
; Line 492
	call	FAR PTR _MouseHIDE
; Line 496
	mov	bx,WORD PTR [bp+4]	;prev
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	push	WORD PTR _menuhotspots[bx+2]
	push	WORD PTR _menuhotspots[bx]
	push	WORD PTR $S770_MenuRp
	mov	ax,WORD PTR _menuhotspots[bx+6]
	sub	ax,WORD PTR _menuhotspots[bx+2]
	push	ax
	mov	ax,WORD PTR _menuhotspots[bx+4]
	sub	ax,WORD PTR _menuhotspots[bx]
	push	ax
	push	WORD PTR _menuhotspots[bx+2]
	push	WORD PTR _menuhotspots[bx]
	push	WORD PTR $S772_MenuRp2
	call	FAR PTR _RectCopy
	mov	sp,bp
; Line 499
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	bx,WORD PTR [bp+6]	;current
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _menuhotspots[bx+2]
	add	ax,3
	push	ax
	mov	ax,WORD PTR _menuhotspots[bx]
	add	ax,5
	push	ax
	push	WORD PTR $S770_MenuRp
	mov	ax,6
	push	ax
	push	ax
	mov	ax,104
	push	ax
	mov	ax,185
	push	ax
	push	WORD PTR _mseg
	call	_ScaleRotate
	mov	sp,bp
; Line 501
	call	FAR PTR _MouseSHOW
; Line 502
	mov	sp,bp
	pop	bp
	ret	

_ReDraw	ENDP
; Line 506
	PUBLIC	_MouseSETUP
_MouseSETUP	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	MouseHotY = 8
;	MouseHotX = 6
;	MouseSeg = 4
; Line 507
	mov	ax,WORD PTR [bp+4]	;MouseSeg
	cmp	WORD PTR $S761_MOSspr,ax
	jne	$I876
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 509
	nop	
$I876:
; Line 510
	mov	ax,WORD PTR [bp+8]	;MouseHotY
	mov	WORD PTR $S763_MOShoty,ax
; Line 511
	mov	cx,WORD PTR [bp+4]	;MouseSeg
	mov	WORD PTR $S761_MOSspr,cx
; Line 513
	push	cx
	push	ax
	mov	ax,WORD PTR [bp+6]	;MouseHotX
	mov	WORD PTR $S762_MOShotx,ax
	push	ax
	call	FAR PTR _MouseTYPE
; Line 514
	mov	sp,bp
	pop	bp
	ret	
	nop	

_MouseSETUP	ENDP
; Line 518
	PUBLIC	_pstrlen
_pstrlen	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	t = -4
;	fn = -2
;	n = -6
;	s = 6
;	rp = 4
; Line 519
	mov	ax,WORD PTR [bp+6]	;s
	mov	WORD PTR [bp-4],ax	;t
; Line 522
	mov	bx,WORD PTR [bp+4]	;rp
	mov	ax,WORD PTR [bx+16]
	mov	WORD PTR [bp-2],ax	;fn
; Line 523
	mov	WORD PTR [bp-6],0	;n
; Line 524
	jmp	SHORT $L20014
	nop	
$FC885:
	inc	WORD PTR [bp-4]	;t
	mov	al,BYTE PTR [bx]
	push	ax
	push	WORD PTR [bp-2]	;fn
	call	FAR PTR _CharWidth
	add	sp,4
	add	WORD PTR [bp-6],ax	;n
$L20014:
	mov	bx,WORD PTR [bp-4]	;t
	cmp	BYTE PTR [bx],0
	jne	$FC885
; Line 525
	mov	ax,6
	push	ax
	call	FAR PTR _LibCanDo
	add	sp,2
	or	ax,ax
	je	$I887
	mov	cx,2
	mov	ax,WORD PTR [bp-6]	;n
	cwd	
	idiv	cx
	mov	WORD PTR [bp-6],ax	;n
; Line 526
$I887:
	mov	ax,WORD PTR [bp-6]	;n
; Line 527
	mov	sp,bp
	pop	bp
	ret	
	nop	

_pstrlen	ENDP
; Line 529
	PUBLIC	_MikesJoyStickRecal
_MikesJoyStickRecal	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	y = 6
;	x = 4
; Line 530
	call	FAR PTR _MouseHIDE
; Line 531
	push	WORD PTR [bp+6]	;y
	push	WORD PTR [bp+4]	;x
	call	_JoyRecal
	mov	sp,bp
; Line 532
	mov	ax,OFFSET DGROUP:$SG892
	push	ax
	mov	ax,1
	push	ax
	call	_LoadPicture
	mov	sp,bp
; Line 533
	call	_RedrawJoyBox
; Line 534
	call	_DrawSettings
; Line 535
	call	FAR PTR _MouseSHOW
; Line 538
	mov	sp,bp
	pop	bp
	ret	

_MikesJoyStickRecal	ENDP
_TEXT	ENDS
END
