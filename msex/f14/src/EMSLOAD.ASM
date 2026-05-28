;	Static Name Aliases
;
	TITLE   C:\EMSLOAD.C
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
PUBLIC  _EMSPagesFree
PUBLIC  _EMSPagesGrabbed
PUBLIC  _NOTEXTURE
PUBLIC  _ZHEAD
PUBLIC  _NEMSSEG
PUBLIC  _EMSHANDLE
EXTRN	__filbuf:NEAR
EXTRN	__dos_close:NEAR
EXTRN	_fclose:NEAR
EXTRN	_EMMThere:NEAR
EXTRN	_EMSPageFrame:NEAR
EXTRN	_EMSPagesLeft:NEAR
EXTRN	_EMSAllocatePages:NEAR
EXTRN	_EMMMapMultiPage:NEAR
EXTRN	__dos_open:NEAR
EXTRN	_fopen:NEAR
EXTRN	__dos_read:NEAR
EXTRN	_fread:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_LoadEMSObject:NEAR
EXTRN	_int86x:NEAR
EXTRN	_filelength:NEAR
EXTRN	_strcmp:NEAR
EXTRN	_OBJECTS:BYTE
EXTRN	_GroundObjectScale:BYTE
EXTRN	_GroundObjectNames:BYTE
EXTRN	_LandObjectBase:WORD
COMM FAR	_emsfiles:	 20:	 513
COMM FAR	_emspageuse:	 2:	 513
_DATA      SEGMENT
	ORG	$+10
$SG480	DB	'r+b',  00H
	ORG	$+128
$SG512	DB	'rb',  00H
	ORG	$-145
_NEMSSEG	DW	00H
_EMSHANDLE	DW	00H
_EMSPagesFree	DW	00H
_EMSPagesGrabbed	DW	00H
_NOTEXTURE	DW	00H
	ORG	$+4
_ZHEAD	DB	0aH
	DB	05H
	DB	01H
	DB	08H
	DW	00H
	DW	00H
	DW	0280H
	DW	01e0H
	DW	0280H
	DW	01e0H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	00H
	DB	01H
	DW	0280H
 	DB	60 DUP(0)

_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 2
; Line 3
; Line 4
; Line 5
; Line 46
	PUBLIC	_fstrcpy
_fstrcpy	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	S = 8
;	D = 4
; Line 47
$FC309:
	les	bx,DWORD PTR [bp+8]	;S
	inc	WORD PTR [bp+8]	;S
	mov	al,BYTE PTR es:[bx]
	les	bx,DWORD PTR [bp+4]	;D
	inc	WORD PTR [bp+4]	;D
	mov	BYTE PTR es:[bx],al
	or	al,al
	jne	$FC309
; Line 48
	mov	ax,WORD PTR [bp+4]	;D
	mov	dx,WORD PTR [bp+6]
; Line 49
	mov	sp,bp
	pop	bp
	ret	
	nop	

_fstrcpy	ENDP
; Line 52
	PUBLIC	_fstrcmp
_fstrcmp	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,400
	call	__aNchkstk
;	str = -200
;	str2 = -400
;	S = 8
;	D = 4
; Line 56
	push	WORD PTR [bp+6]
	push	WORD PTR [bp+4]	;D
	lea	ax,WORD PTR [bp-200]	;str
	push	ss
	push	ax
	call	_fstrcpy
	add	sp,8
; Line 57
	push	WORD PTR [bp+10]
	push	WORD PTR [bp+8]	;S
	lea	ax,WORD PTR [bp-400]	;str2
	push	ss
	push	ax
	call	_fstrcpy
	add	sp,8
; Line 58
	lea	ax,WORD PTR [bp-400]	;str2
	push	ax
	lea	ax,WORD PTR [bp-200]	;str
	push	ax
	call	_strcmp
; Line 59
	mov	sp,bp
	pop	bp
	ret	

_fstrcmp	ENDP
; Line 70
	PUBLIC	_NewEmsFunction
_NewEmsFunction	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	free = -2
; Line 73
	call	_EMMThere
	or	ax,ax
	je	$I329
; Line 74
	call	_EMSPageFrame
	mov	WORD PTR _NEMSSEG,ax
	or	ax,ax
	je	$I329
; Line 75
	call	_EMSPagesLeft
	mov	WORD PTR _EMSPagesFree,ax
; Line 76
	mov	WORD PTR _EMSPagesGrabbed,176
; Line 77
	cmp	ax,176
	jge	$I331
; Line 78
	mov	WORD PTR _EMSPagesGrabbed,ax
; Line 79
$I331:
	push	WORD PTR _EMSPagesGrabbed
	call	_EMSAllocatePages
	add	sp,2
	mov	WORD PTR _EMSHANDLE,ax
; Line 80
	sub	WORD PTR _EMSPagesGrabbed,76
; Line 82
; Line 83
$I329:
; Line 84
	mov	sp,bp
	pop	bp
	ret	

_NewEmsFunction	ENDP
; Line 88
	PUBLIC	_LoadTheWorld
_LoadTheWorld	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,778
	call	__aNchkstk
;	PBlock = -776
;	DHNDL = -8
;	len = -778
;	PTR = -4
;	i = -6
;	name = 4
; Line 97
	lea	ax,WORD PTR [bp-8]	;DHNDL
	push	ax
	sub	cx,cx
	mov	WORD PTR [bp-4],cx	;PTR
	push	cx
	push	WORD PTR [bp+4]	;name
	call	__dos_open
	add	sp,6
	or	ax,ax
	je	$JCC202
	jmp	$I341
$JCC202:
; Line 98
	lea	ax,WORD PTR [bp-778]	;len
	push	ax
	mov	ax,768
	push	ax
	lea	ax,WORD PTR [bp-776]	;PBlock
	push	ss
	push	ax
	push	WORD PTR [bp-8]	;DHNDL
	call	__dos_read
	add	sp,10
; Line 99
	mov	WORD PTR [bp-6],0	;i
$FC343:
; Line 100
	push	WORD PTR [bp-6]	;i
	call	_MapInBank
	add	sp,2
	mov	WORD PTR [bp-2],ax
; Line 101
	lea	ax,WORD PTR [bp-778]	;len
	push	ax
	mov	cx,-32768
	push	cx
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;PTR
	push	WORD PTR [bp-8]	;DHNDL
	call	__dos_read
	add	sp,10
; Line 102
	lea	ax,WORD PTR [bp-778]	;len
	push	ax
	mov	ax,-32768
	push	ax
	mov	cx,WORD PTR [bp-4]	;PTR
	mov	dx,WORD PTR [bp-2]
	add	ch,128
	push	dx
	push	cx
	push	WORD PTR [bp-8]	;DHNDL
	call	__dos_read
	add	sp,10
; Line 103
	inc	WORD PTR [bp-6]	;i
	cmp	WORD PTR [bp-6],19	;i
	jl	$FC343
; Line 105
	lea	ax,WORD PTR [bp-778]	;len
	push	ax
	mov	cx,9216
	push	cx
	mov	cx,OFFSET _OBJECTS
	mov	dx,SEG _OBJECTS
	push	dx
	push	cx
	push	WORD PTR [bp-8]	;DHNDL
	call	__dos_read
	add	sp,10
; Line 106
	lea	ax,WORD PTR [bp-778]	;len
	push	ax
	mov	cx,400
	push	cx
	mov	cx,OFFSET _GroundObjectScale
	push	ds
	push	cx
	push	WORD PTR [bp-8]	;DHNDL
	call	__dos_read
	add	sp,10
; Line 107
	lea	ax,WORD PTR [bp-778]	;len
	push	ax
	mov	ax,640
	push	ax
	mov	ax,OFFSET _GroundObjectNames
	push	ds
	push	ax
	push	WORD PTR [bp-8]	;DHNDL
	call	__dos_read
	add	sp,10
; Line 109
	push	WORD PTR [bp-8]	;DHNDL
	call	__dos_close
; Line 110
; Line 111
$I341:
	mov	sp,bp
	pop	bp
	ret	

_LoadTheWorld	ENDP
; Line 114
	PUBLIC	_LoadGroundObjects
_LoadGroundObjects	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 117
	mov	WORD PTR _LandObjectBase,200
; Line 119
	mov	WORD PTR [bp-2],0	;i
$FC350:
; Line 120
; Line 121
	mov	ax,20
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	cmp	BYTE PTR _GroundObjectNames[bx],0
	je	$EX347
; Line 122
	mov	ax,WORD PTR _LandObjectBase
	add	ax,WORD PTR [bp-2]	;i
	push	ax
	mov	ax,20
	imul	WORD PTR [bp-2]	;i
	add	ax,OFFSET _GroundObjectNames
	push	ax
	call	_LoadEMSObject
	add	sp,4
; Line 123
	inc	WORD PTR [bp-2]	;i
	cmp	WORD PTR [bp-2],32	;i
	jl	$FC350
; Line 124
$EX347:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_LoadGroundObjects	ENDP
; Line 128
_TEXT      ENDS
CONST      SEGMENT
$T20001	DW SEG _emspageuse 
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_GetEmsMem
_GetEmsMem	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	si
;	i = -2
;	j = -6
;	size = -8
;	lstpg = -4
;	seg = 8
;	page = 6
;	paras = 4
; Line 134
	mov	ax,WORD PTR [bp+4]	;paras
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,10
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	WORD PTR [bp-4],ax	;lstpg
; Line 136
	mov	WORD PTR [bp-2],1	;i
	jmp	SHORT $F363
	nop	
$FC370:
	cmp	WORD PTR [bp-8],0	;size
	jle	$FB371
; Line 145
; Line 146
	mov	bx,ax
	shl	bx,1
	mov	es,WORD PTR $T20001
	mov	ax,WORD PTR [bp-8]	;size
	cmp	ax,1024
	jle	$L20003
	mov	ax,1024
$L20003:
	mov	WORD PTR es:_emspageuse[bx],ax
; Line 147
	inc	WORD PTR [bp-6]	;j
	sub	WORD PTR [bp-8],1024	;size
$F369:
	mov	ax,WORD PTR [bp-6]	;j
	cmp	WORD PTR _EMSPagesGrabbed,ax
	jg	$FC370
$FB371:
; Line 148
	mov	ax,WORD PTR [bp-2]	;i
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 149
; Line 150
	nop	
$FC364:
	inc	WORD PTR [bp-2]	;i
$F363:
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR _EMSPagesGrabbed,ax
	jle	$FB365
; Line 137
; Line 139
	mov	bx,ax
	shl	bx,1
	mov	es,WORD PTR $T20001
	cmp	WORD PTR es:_emspageuse[bx],0
	jne	$I368
	add	ax,WORD PTR [bp-4]	;lstpg
	dec	ax
	cmp	ax,WORD PTR _EMSPagesGrabbed
	jl	$I367
$I368:
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,1
	mov	ax,WORD PTR es:_emspageuse[bx]
	add	ax,WORD PTR [bp+4]	;paras
	cmp	ax,1024
	jg	$FC364
$I367:
; Line 140
; Line 141
	mov	ax,WORD PTR [bp-2]	;i
	add	ax,76
	mov	bx,WORD PTR [bp+6]	;page
	mov	WORD PTR [bx],ax
; Line 142
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,1
	mov	ax,WORD PTR es:_emspageuse[bx]
	mov	si,WORD PTR [bp+8]	;seg
	mov	WORD PTR [si],ax
; Line 143
	mov	ax,WORD PTR es:_emspageuse[bx]
	add	ax,WORD PTR [bp+4]	;paras
	mov	WORD PTR [bp-8],ax	;size
; Line 144
	mov	ax,WORD PTR [bp-2]	;i
	mov	WORD PTR [bp-6],ax	;j
	jmp	SHORT $F369
	nop	
$FB365:
; Line 151
	sub	ax,ax
; Line 152
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetEmsMem	ENDP
; Line 155
	PUBLIC	_ResizeEmsMem
_ResizeEmsMem	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	size = -4
;	j = -2
;	paras = 8
;	oldparas = 6
;	i = 4
; Line 158
	mov	ax,WORD PTR [bp+4]	;i
	inc	ax
	mov	WORD PTR [bp-2],ax	;j
	jmp	SHORT $F379
$FC380:
; Line 159
; Line 160
	mov	es,WORD PTR $T20001
	mov	bx,WORD PTR [bp-2]	;j
	shl	bx,1
	mov	WORD PTR es:_emspageuse[bx],0
; Line 161
	inc	WORD PTR [bp-2]	;j
	sub	WORD PTR [bp+6],1024	;oldparas
$F379:
	cmp	WORD PTR [bp+6],1024	;oldparas
	jg	$FC380
; Line 163
	mov	ax,WORD PTR [bp+6]	;oldparas
	mov	es,WORD PTR $T20001
	mov	bx,WORD PTR [bp+4]	;i
	shl	bx,1
	sub	WORD PTR es:_emspageuse[bx],ax
	mov	ax,WORD PTR es:_emspageuse[bx]
	add	ax,WORD PTR [bp+8]	;paras
	mov	WORD PTR [bp-4],ax	;size
; Line 164
	mov	ax,WORD PTR [bp+4]	;i
	mov	WORD PTR [bp-2],ax	;j
	jmp	SHORT $F382
	nop	
$FC383:
	cmp	WORD PTR [bp-4],0	;size
	jle	$FB384
; Line 165
; Line 166
	mov	bx,ax
	shl	bx,1
	mov	es,WORD PTR $T20001
	mov	ax,WORD PTR [bp-4]	;size
	cmp	ax,1024
	jle	$L20005
	mov	ax,1024
$L20005:
	mov	WORD PTR es:_emspageuse[bx],ax
; Line 167
	inc	WORD PTR [bp-2]	;j
	sub	WORD PTR [bp-4],1024	;size
$F382:
	mov	ax,WORD PTR [bp-2]	;j
	cmp	WORD PTR _EMSPagesGrabbed,ax
	jg	$FC383
$FB384:
; Line 168
	mov	ax,WORD PTR [bp+4]	;i
; Line 169
	mov	sp,bp
	pop	bp
	ret	

_ResizeEmsMem	ENDP
; Line 172
_TEXT      ENDS
CONST      SEGMENT
$T20006	DW SEG _emsfiles 
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_MapEmsFile
_MapEmsFile	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	i = -8
;	lastpara = -6
;	pg = -4
;	pgnum = -2
;	PhysPage = 6
;	hndl = 4
; Line 176
	cmp	WORD PTR [bp+4],1	;hndl
	jge	$I393
$L20016:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 177
	nop	
$I393:
	mov	ax,WORD PTR [bp+4]	;hndl
	mov	WORD PTR [bp-8],ax	;i
; Line 179
	cmp	WORD PTR _EMSHANDLE,0
	je	$L20016
; Line 180
; Line 181
	mov	cx,20
	imul	cx
	mov	bx,ax
	mov	es,WORD PTR $T20006
	mov	ax,WORD PTR es:_emsfiles[bx+16]
	add	ax,WORD PTR es:_emsfiles[bx+18]
; Line 182
	mov	cx,WORD PTR es:_emsfiles[bx+14]
; Line 183
	mov	WORD PTR [bp-2],1	;pgnum
; Line 184
	cmp	ax,1024
	jle	$I395
	mov	WORD PTR [bp-2],2	;pgnum
; Line 185
$I395:
	cmp	ax,2048
	jle	$I396
	inc	WORD PTR [bp-2]	;pgnum
; Line 186
$I396:
	cmp	ax,3072
	jle	$I397
	inc	WORD PTR [bp-2]	;pgnum
; Line 188
$I397:
	mov	ax,WORD PTR [bp+6]	;PhysPage
	add	ax,WORD PTR [bp-2]	;pgnum
	cmp	ax,4
	jle	$I398
	mov	ax,4
	sub	ax,WORD PTR [bp+6]	;PhysPage
	mov	WORD PTR [bp-2],ax	;pgnum
; Line 191
$I398:
	push	cx
	push	WORD PTR [bp-2]	;pgnum
	push	WORD PTR [bp+6]	;PhysPage
	push	WORD PTR _EMSHANDLE
	call	_EMMMapMultiPage
; Line 203
	mov	ax,20
	imul	WORD PTR [bp-8]	;i
	mov	bx,ax
	mov	es,WORD PTR $T20006
	mov	ah,BYTE PTR [bp+6]	;PhysPage
	shl	ah,1
	shl	ah,1
	sub	al,al
	add	ax,WORD PTR es:_emsfiles[bx+16]
	add	ax,WORD PTR _NEMSSEG
	mov	sp,bp
	pop	bp
	ret	

_MapEmsFile	ENDP
; Line 209
	PUBLIC	_MapInBank
_MapInBank	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	BNK = -2
;	BANK = 4
; Line 212
	cmp	WORD PTR _EMSHANDLE,0
	je	$I403
; Line 213
; Line 215
	mov	ax,WORD PTR [bp+4]	;BANK
	shl	ax,1
	shl	ax,1
	push	ax
	mov	ax,4
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR _EMSHANDLE
	call	_EMMMapMultiPage
	add	sp,8
; Line 222
	mov	ax,WORD PTR _NEMSSEG
	mov	sp,bp
	pop	bp
	ret	
; Line 223
; Line 224
$I403:
	sub	ax,ax
; Line 225
	mov	sp,bp
	pop	bp
	ret	

_MapInBank	ENDP
; Line 229
	PUBLIC	_FileInEms
_FileInEms	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
;	Name = 4
; Line 231
	mov	WORD PTR [bp-2],1	;i
	jmp	SHORT $F408
; Line 235
$FC409:
	inc	WORD PTR [bp-2]	;i
$F408:
	cmp	WORD PTR [bp-2],513	;i
	jge	$FB410
; Line 232
; Line 233
	push	ds
	push	WORD PTR [bp+4]	;Name
	mov	ax,20
	imul	WORD PTR [bp-2]	;i
	add	ax,OFFSET _emsfiles
	mov	cx,SEG _emsfiles
	push	cx
	push	ax
	call	_fstrcmp
	add	sp,8
	or	ax,ax
	jne	$FC409
; Line 234
	mov	ax,WORD PTR [bp-2]	;i
	mov	sp,bp
	pop	bp
	ret	
	nop	
$FB410:
; Line 236
	sub	ax,ax
; Line 238
	mov	sp,bp
	pop	bp
	ret	

_FileInEms	ENDP
; Line 241
	PUBLIC	_GetNextEMSfile
_GetNextEMSfile	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 243
	mov	WORD PTR [bp-2],1	;i
	jmp	SHORT $F415
; Line 246
$FC416:
	inc	WORD PTR [bp-2]	;i
$F415:
	cmp	WORD PTR [bp-2],513	;i
	jge	$FB417
; Line 244
; Line 245
	mov	ax,20
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	mov	es,WORD PTR $T20006
	cmp	BYTE PTR es:_emsfiles[bx],0
	jne	$FC416
	mov	ax,WORD PTR [bp-2]	;i
	mov	sp,bp
	pop	bp
	ret	
	nop	
$FB417:
; Line 247
	sub	ax,ax
; Line 249
	mov	sp,bp
	pop	bp
	ret	

_GetNextEMSfile	ENDP
; Line 252
	PUBLIC	_MakeEMSFileBlock
_MakeEMSFileBlock	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	i = -2
;	bank = -4
;	page = -6
;	seg = -8
;	paras = 6
;	name = 4
; Line 256
	push	WORD PTR [bp+4]	;name
	call	_FileInEms
	add	sp,2
	mov	WORD PTR [bp-2],ax	;i
	or	ax,ax
	jne	$EX422
; Line 257
	call	_GetNextEMSfile
	mov	WORD PTR [bp-2],ax	;i
	or	ax,ax
	jne	$I428
$L20017:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 260
	nop	
$I428:
	lea	ax,WORD PTR [bp-8]	;seg
	push	ax
	lea	ax,WORD PTR [bp-6]	;page
	push	ax
	push	WORD PTR [bp+6]	;paras
	call	_GetEmsMem
	add	sp,6
	mov	WORD PTR [bp-4],ax	;bank
	or	ax,ax
	je	$L20017
; Line 261
	mov	ax,20
	imul	WORD PTR [bp-2]	;i
	mov	bx,ax
	mov	es,WORD PTR $T20006
	mov	ax,WORD PTR [bp-6]	;page
	mov	WORD PTR es:_emsfiles[bx+14],ax
; Line 262
	mov	ax,WORD PTR [bp-8]	;seg
	mov	WORD PTR es:_emsfiles[bx+16],ax
; Line 263
	mov	ax,WORD PTR [bp+6]	;paras
	mov	WORD PTR es:_emsfiles[bx+18],ax
; Line 264
	push	ds
	push	WORD PTR [bp+4]	;name
	add	bx,OFFSET _emsfiles
	push	es
	push	bx
	call	_fstrcpy
; Line 265
	mov	ax,WORD PTR [bp-2]	;i
; Line 266
$EX422:
	mov	sp,bp
	pop	bp
	ret	

_MakeEMSFileBlock	ENDP
; Line 269
	PUBLIC	_EMSFileUsage
_EMSFileUsage	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 272
	mov	WORD PTR [bp-2],1	;i
	jmp	SHORT $F433
; Line 275
$FC434:
	inc	WORD PTR [bp-2]	;i
$F433:
	cmp	WORD PTR [bp-2],513	;i
	jge	$FB435
; Line 273
; Line 274
	mov	es,WORD PTR $T20001
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,1
	cmp	WORD PTR es:_emspageuse[bx],0
	jne	$FC434
$FB435:
; Line 276
	mov	ax,WORD PTR [bp-2]	;i
	dec	ax
; Line 277
	mov	sp,bp
	pop	bp
	ret	
	nop	

_EMSFileUsage	ENDP
; Line 285
	PUBLIC	_ReadEMSPCX
_ReadEMSPCX	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	SETPAL = 6
;	name = 4
; Line 286
	mov	ax,200
	push	ax
	mov	ax,320
	push	ax
	push	WORD PTR [bp+6]	;SETPAL
	push	WORD PTR [bp+4]	;name
	call	_ReadEMSPCXSize
; Line 287
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ReadEMSPCX	ENDP
; Line 290
	PUBLIC	_ReadEMSPCXSize
_ReadEMSPCXSize	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__aNchkstk
	push	si
;	size = -14
;	page = -18
;	seg = -20
;	cnt = -6
;	bank = -16
;	DST = -12
;	t = -4
;	i = -8
;	YCLP = 10
;	XCLP = 8
;	SETPAL = 6
;	name = 4
; Line 296
	push	WORD PTR [bp+4]	;name
	call	_FileInEms
	add	sp,2
	mov	WORD PTR [bp-8],ax	;i
	or	ax,ax
	je	$JCC1378
	jmp	$EX446
$JCC1378:
; Line 297
	call	_GetNextEMSfile
	mov	WORD PTR [bp-8],ax	;i
	or	ax,ax
	jne	$I456
$L20018:
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 300
$I456:
; Line 304
	mov	ax,WORD PTR [bp+10]	;YCLP
	imul	WORD PTR [bp+8]	;XCLP
	add	ax,15
	adc	dx,0
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	mov	WORD PTR [bp-4],ax	;t
	mov	WORD PTR [bp-2],dx
	mov	WORD PTR [bp-14],ax	;size
; Line 307
	lea	cx,WORD PTR [bp-20]	;seg
	push	cx
	lea	cx,WORD PTR [bp-18]	;page
	push	cx
	push	ax
	call	_GetEmsMem
	add	sp,6
	mov	WORD PTR [bp-16],ax	;bank
	or	ax,ax
	je	$L20018
; Line 308
	mov	ax,20
	imul	WORD PTR [bp-8]	;i
	mov	bx,ax
	mov	es,WORD PTR $T20006
	mov	ax,WORD PTR [bp-18]	;page
	mov	WORD PTR es:_emsfiles[bx+14],ax
; Line 309
	mov	ax,WORD PTR [bp-20]	;seg
	mov	WORD PTR es:_emsfiles[bx+16],ax
; Line 310
	mov	ax,WORD PTR [bp-14]	;size
	mov	WORD PTR es:_emsfiles[bx+18],ax
; Line 312
	sub	cx,cx
	push	cx
	push	WORD PTR [bp-8]	;i
	mov	si,bx
	call	_MapEmsFile
	add	sp,4
	mov	WORD PTR [bp-10],ax
; Line 313
	mov	WORD PTR [bp-12],0	;DST
; Line 315
	push	WORD PTR [bp+10]	;YCLP
	push	WORD PTR [bp+8]	;XCLP
	push	WORD PTR [bp+6]	;SETPAL
	push	ax
	push	WORD PTR [bp-12]	;DST
	push	WORD PTR [bp+4]	;name
	call	_ReadPCXSize
	add	sp,12
	mov	WORD PTR [bp-6],ax	;cnt
; Line 317
	push	ds
	push	WORD PTR [bp+4]	;name
	mov	ax,si
	add	si,OFFSET _emsfiles
	mov	cx,SEG _emsfiles
	push	cx
	push	si
	mov	si,ax
	call	_fstrcpy
	add	sp,8
; Line 319
	mov	ax,WORD PTR [bp-14]	;size
	cmp	WORD PTR [bp-6],ax	;cnt
	jge	$I459
; Line 320
	push	WORD PTR [bp-6]	;cnt
	push	ax
	push	WORD PTR [bp-16]	;bank
	call	_ResizeEmsMem
	add	sp,6
; Line 321
	mov	ax,WORD PTR [bp-6]	;cnt
	mov	es,WORD PTR $T20006
	mov	WORD PTR es:_emsfiles[si+18],ax
; Line 322
; Line 324
$I459:
	mov	ax,WORD PTR [bp-8]	;i
; Line 325
$EX446:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_ReadEMSPCXSize	ENDP
; Line 333
	PUBLIC	_LoadEmsFile
_LoadEmsFile	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,44
	call	__aNchkstk
;	stream = -38
;	string = -24
;	paras = -14
;	fsize = -4
;	psize = -32
;	loadseg = -44
;	tload = -12
;	ch = -28
;	handle = -36
;	B = -8
;	Page = -40
;	Seg = -42
;	i = -26
;	bank = -34
;	Name = 4
; Line 349
	push	WORD PTR [bp+4]	;Name
	call	_FileInEms
	add	sp,2
	mov	WORD PTR [bp-26],ax	;i
	or	ax,ax
	je	$JCC1629
	jmp	$EX462
$JCC1629:
; Line 350
	call	_GetNextEMSfile
	mov	WORD PTR [bp-26],ax	;i
	or	ax,ax
	jne	$I478
$L20019:
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 353
$I478:
	mov	ax,OFFSET DGROUP:$SG480
	push	ax
	push	WORD PTR [bp+4]	;Name
	call	_fopen
	add	sp,4
	mov	WORD PTR [bp-38],ax	;stream
	or	ax,ax
	je	$L20019
; Line 355
	mov	bx,ax
	mov	al,BYTE PTR [bx+7]
	sub	ah,ah
	push	ax
	call	_filelength
	add	sp,2
	mov	WORD PTR [bp-4],ax	;fsize
	mov	WORD PTR [bp-2],dx
; Line 356
	push	WORD PTR [bp-38]	;stream
	call	_fclose
	add	sp,2
; Line 357
	cmp	WORD PTR [bp-4],-1	;fsize
	jne	$I481
	cmp	WORD PTR [bp-2],-1
	je	$L20019
; Line 358
$I481:
; Line 359
	mov	ax,WORD PTR [bp-4]	;fsize
	mov	dx,WORD PTR [bp-2]
	add	ax,15
	adc	dx,0
	shr	dx,1
	rcr	ax,1
	shr	dx,1
	rcr	ax,1
	shr	dx,1
	rcr	ax,1
	shr	dx,1
	rcr	ax,1
	mov	WORD PTR [bp-32],ax	;psize
	mov	WORD PTR [bp-30],dx
	mov	WORD PTR [bp-14],ax	;paras
; Line 361
	lea	cx,WORD PTR [bp-42]	;Seg
	push	cx
	lea	cx,WORD PTR [bp-40]	;Page
	push	cx
	push	ax
	call	_GetEmsMem
	add	sp,6
	mov	WORD PTR [bp-34],ax	;bank
	or	ax,ax
	je	$L20019
; Line 362
	mov	ax,20
	imul	WORD PTR [bp-26]	;i
	mov	bx,ax
	mov	es,WORD PTR $T20006
	mov	ax,WORD PTR [bp-40]	;Page
	mov	WORD PTR es:_emsfiles[bx+14],ax
; Line 363
	mov	ax,WORD PTR [bp-42]	;Seg
	mov	WORD PTR es:_emsfiles[bx+16],ax
; Line 364
	mov	ax,WORD PTR [bp-14]	;paras
	mov	WORD PTR es:_emsfiles[bx+18],ax
; Line 365
	push	ds
	push	WORD PTR [bp+4]	;Name
	add	bx,OFFSET _emsfiles
	push	es
	push	bx
	call	_fstrcpy
	add	sp,8
; Line 367
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-26]	;i
	call	_MapEmsFile
	add	sp,4
	mov	WORD PTR [bp-6],ax
	or	ax,ax
	jne	$JCC1839
	jmp	$L20019
$JCC1839:
; Line 369
	lea	ax,WORD PTR [bp-36]	;handle
	push	ax
	sub	cx,cx
	mov	WORD PTR [bp-8],cx	;B
	push	cx
	push	WORD PTR [bp+4]	;Name
	call	__dos_open
	add	sp,6
; Line 370
	lea	ax,WORD PTR [bp-4]	;fsize
	push	ax
	push	WORD PTR [bp-4]	;fsize
	push	WORD PTR [bp-6]
	push	WORD PTR [bp-8]	;B
	push	WORD PTR [bp-36]	;handle
	call	__dos_read
	add	sp,10
; Line 371
	push	WORD PTR [bp-36]	;handle
	call	__dos_close
; Line 372
	mov	ax,WORD PTR [bp-26]	;i
; Line 374
$EX462:
	mov	sp,bp
	pop	bp
	ret	

_LoadEmsFile	ENDP
; Line 402
	PUBLIC	_ReadPCX
_ReadPCX	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	SETPAL = 10
;	DST = 6
;	name = 4
; Line 403
	mov	ax,200
	push	ax
	mov	ax,320
	push	ax
	push	WORD PTR [bp+10]	;SETPAL
	push	WORD PTR [bp+8]
	push	WORD PTR [bp+6]	;DST
	push	WORD PTR [bp+4]	;name
	call	_ReadPCXSize
; Line 404
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ReadPCX	ENDP
; Line 409
	PUBLIC	_ReadPCXSize
_ReadPCXSize	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,876
	call	__aNchkstk
	push	si
;	Handle = -870
;	i = -90
;	j = -92
;	Block = -864
;	S = -80
;	sz = -876
;	last = -84
;	cnt = -86
;	numread = -868
;	k = -96
;	m = -872
;	d = -82
;	vs = -88
;	hs = -94
;	YCLP = 14
;	XCLP = 12
;	SETPAL = 10
;	DST = 6
;	name = 4
; Line 428
	mov	ax,OFFSET DGROUP:$SG512
	push	ax
	push	WORD PTR [bp+4]	;name
	call	_fopen
	add	sp,4
	mov	WORD PTR [bp-870],ax	;Handle
	or	ax,ax
	jne	$JCC1963
	jmp	$I511
$JCC1963:
; Line 429
; Line 433
	push	ax
	mov	ax,1
	push	ax
	mov	ax,128
	push	ax
	mov	ax,OFFSET DGROUP:_ZHEAD
	push	ax
	call	_fread
	add	sp,8
; Line 434
	mov	ax,WORD PTR _ZHEAD+8
	inc	ax
	mov	WORD PTR [bp-94],ax	;hs
; Line 435
	mov	ax,WORD PTR _ZHEAD+10
	inc	ax
	mov	WORD PTR [bp-88],ax	;vs
; Line 438
	mov	WORD PTR [bp-84],-32768	;last
; Line 439
	sub	ax,ax
	mov	WORD PTR [bp-866],ax
	mov	WORD PTR [bp-868],ax	;numread
	mov	WORD PTR [bp-86],ax	;cnt
; Line 441
	mov	WORD PTR [bp-90],ax	;i
	jmp	$F513
	nop	
$L20007:
	push	WORD PTR [bp-870]	;Handle
	call	__filbuf
	add	sp,2
$L20008:
	mov	WORD PTR [bp-86],ax	;cnt
	mov	WORD PTR [bp-82],ax	;d
; Line 451
	and	al,192
	cmp	al,192
	jne	$I520
; Line 452
; Line 453
	mov	al,BYTE PTR [bp-86]	;cnt
	and	ax,63
	mov	WORD PTR [bp-86],ax	;cnt
; Line 454
	mov	bx,WORD PTR [bp-870]	;Handle
	dec	WORD PTR [bx+2]
	js	$L20009
	mov	bx,WORD PTR [bp-870]	;Handle
	mov	si,WORD PTR [bx]
	inc	WORD PTR [bx]
	mov	al,BYTE PTR [si]
	sub	ah,ah
	jmp	SHORT $L20010
$L20009:
	push	WORD PTR [bp-870]	;Handle
	call	__filbuf
	add	sp,2
$L20010:
	mov	WORD PTR [bp-82],ax	;d
; Line 456
; Line 457
	jmp	SHORT $I521
	nop	
$I520:
; Line 458
; Line 459
	mov	WORD PTR [bp-86],1	;cnt
; Line 460
$I521:
; Line 461
; Line 463
	mov	ax,WORD PTR [bp+12]	;XCLP
	cmp	WORD PTR [bp-96],ax	;k
	jae	$I522
	mov	ax,WORD PTR [bp+14]	;YCLP
	cmp	WORD PTR [bp-90],ax	;i
	jge	$I522
; Line 464
; Line 465
	mov	al,BYTE PTR [bp-82]	;d
	les	bx,DWORD PTR [bp+6]	;DST
	inc	WORD PTR [bp+6]	;DST
	mov	BYTE PTR es:[bx],al
; Line 466
	add	WORD PTR [bp-868],1	;numread
	adc	WORD PTR [bp-866],0
; Line 467
; Line 468
$I522:
	dec	WORD PTR [bp-86]	;cnt
; Line 469
	inc	WORD PTR [bp-96]	;k
$F516:
	mov	ax,WORD PTR [bp-94]	;hs
	cmp	WORD PTR [bp-96],ax	;k
	jae	$F523
; Line 444
; Line 445
	cmp	WORD PTR [bp-86],0	;cnt
	jne	$I521
; Line 446
; Line 450
	mov	bx,WORD PTR [bp-870]	;Handle
	dec	WORD PTR [bx+2]
	jns	$JCC2166
	jmp	$L20007
$JCC2166:
	mov	bx,WORD PTR [bp-870]	;Handle
	mov	si,WORD PTR [bx]
	inc	WORD PTR [bx]
	mov	al,BYTE PTR [si]
	sub	ah,ah
	jmp	$L20008
$FC524:
	inc	WORD PTR [bp-96]	;k
$F523:
	mov	ax,WORD PTR [bp+12]	;XCLP
	cmp	WORD PTR [bp-96],ax	;k
	jae	$FC514
	mov	ax,WORD PTR [bp+14]	;YCLP
	cmp	WORD PTR [bp-90],ax	;i
	jge	$FC514
; Line 471
; Line 472
	les	bx,DWORD PTR [bp+6]	;DST
	inc	WORD PTR [bp+6]	;DST
	mov	BYTE PTR es:[bx],0
; Line 473
	add	WORD PTR [bp-868],1	;numread
	adc	WORD PTR [bp-866],0
; Line 474
	jmp	SHORT $FC524
; Line 475
	nop	
$FC514:
	inc	WORD PTR [bp-90]	;i
$F513:
	mov	ax,WORD PTR [bp-90]	;i
	cmp	WORD PTR [bp-88],ax	;vs
	jbe	$FB515
; Line 442
; Line 443
	mov	WORD PTR [bp-96],0	;k
	jmp	SHORT $F516
$FB515:
; Line 477
	push	WORD PTR [bp-870]	;Handle
	mov	ax,1
	push	ax
	push	ax
	lea	cx,WORD PTR [bp-82]	;d
	push	cx
	call	_fread
	add	sp,8
; Line 478
	cmp	BYTE PTR [bp-82],12	;d
	jne	$I526
	cmp	WORD PTR [bp+10],0	;SETPAL
	je	$I526
; Line 479
; Line 480
	push	WORD PTR [bp-870]	;Handle
	mov	ax,1
	push	ax
	mov	ax,768
	push	ax
	lea	ax,WORD PTR [bp-864]	;Block
	push	ax
	call	_fread
	add	sp,8
; Line 481
	mov	WORD PTR [bp-90],0	;i
$FC528:
; Line 482
	mov	cl,2
	mov	si,WORD PTR [bp-90]	;i
	sar	BYTE PTR [bp-864][si],cl
	inc	WORD PTR [bp-90]	;i
	cmp	WORD PTR [bp-90],768	;i
	jl	$FC528
; Line 484
; Line 485
$I526:
	push	WORD PTR [bp-870]	;Handle
	call	_fclose
	add	sp,2
; Line 486
; Line 487
$I511:
	mov	ax,WORD PTR [bp-868]	;numread
	mov	dx,WORD PTR [bp-866]
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
; Line 489
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ReadPCXSize	ENDP
; Line 652
	PUBLIC	_GetPallet
_GetPallet	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,26
	call	__aNchkstk
;	P = -4
;	R = -18
;	SR = -26
;	Block = 4
; Line 658
	mov	ax,WORD PTR [bp+4]	;Block
	mov	WORD PTR [bp-4],ax	;P
	mov	WORD PTR [bp-2],ds
; Line 659
	mov	ax,ds
	mov	WORD PTR [bp-26],ax	;SR
; Line 660
	mov	WORD PTR [bp-18],4119	;R
; Line 661
	mov	WORD PTR [bp-16],0
; Line 662
	mov	WORD PTR [bp-14],256
; Line 663
	mov	ax,WORD PTR [bp-4]	;P
	mov	WORD PTR [bp-12],ax
; Line 664
	lea	ax,WORD PTR [bp-26]	;SR
	push	ax
	lea	ax,WORD PTR [bp-18]	;R
	push	ax
	push	ax
	mov	ax,16
	push	ax
	call	_int86x
; Line 665
	mov	sp,bp
	pop	bp
	ret	

_GetPallet	ENDP
; Line 667
	PUBLIC	_SetPallet
_SetPallet	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,26
	call	__aNchkstk
;	P = -4
;	R = -18
;	SR = -26
;	Block = 4
; Line 673
	mov	ax,WORD PTR [bp+4]	;Block
	mov	WORD PTR [bp-4],ax	;P
	mov	WORD PTR [bp-2],ds
; Line 674
	mov	ax,ds
	mov	WORD PTR [bp-26],ax	;SR
; Line 675
	mov	WORD PTR [bp-18],4114	;R
; Line 676
	mov	WORD PTR [bp-16],0
; Line 677
	mov	WORD PTR [bp-14],256
; Line 678
	mov	ax,WORD PTR [bp-4]	;P
	mov	WORD PTR [bp-12],ax
; Line 679
	lea	ax,WORD PTR [bp-26]	;SR
	push	ax
	lea	ax,WORD PTR [bp-18]	;R
	push	ax
	push	ax
	mov	ax,16
	push	ax
	call	_int86x
; Line 680
	mov	sp,bp
	pop	bp
	ret	

_SetPallet	ENDP
_TEXT	ENDS
END
