;	Static Name Aliases
;
	TITLE   C:\3DLOADER.C
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
PUBLIC  _PlaneDataSize
PUBLIC  _MissileDataSize
PUBLIC  _RadarDataSize
PUBLIC  _planerecsize
PUBLIC  _missilerecsize
PUBLIC  _radarrecsize
PUBLIC  _EMS3DObjectSlot
EXTRN	_fseek:NEAR
EXTRN	_sprintf:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_EMSReleasePages:NEAR
EXTRN	_fstrcpy:NEAR
EXTRN	_InitAbort:NEAR
EXTRN	_fclose:NEAR
EXTRN	__dos_allocmem:NEAR
EXTRN	_Message:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_exit:NEAR
EXTRN	_strcat:NEAR
EXTRN	_itoa:NEAR
EXTRN	_fopen:NEAR
EXTRN	_LoadEMSObject:NEAR
EXTRN	_fread:NEAR
EXTRN	_PlaneDataList:DWORD
EXTRN	_RadarDataList:DWORD
EXTRN	_MissileDataList:DWORD
EXTRN	_PlaneDataListCnt:WORD
EXTRN	_RadarDataListCnt:WORD
EXTRN	_MissileDataListCnt:WORD
EXTRN	_EMSHANDLE:WORD
_BSS      SEGMENT
COMM NEAR	_PlaneListSeg:	BYTE:	 2
COMM NEAR	_RadarListSeg:	BYTE:	 2
COMM NEAR	_MissileListSeg:	BYTE:	 2
_BSS      ENDS
EXTRN	_ExitErrorCode:WORD
EXTRN	_ConfigData:BYTE
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Txt:BYTE
_DATA      SEGMENT
$SG368	DB	'PlaneData List exceeds MAX_PLANE: %d %d',  00H
$SG372	DB	'rb',  00H
$SG373	DB	'F14PD01.DAT',  00H
$SG375	DB	'Plane Data File Not Found',  00H
$SG380	DB	'Plane Object %d Not Found: %s',  0aH,  00H
	ORG	$+14
$SG401	DB	'RadarData List exceeded MAX_RADAR_LIST_CNT',  00H
$SG407	DB	'rb',  00H
$SG408	DB	'F14RD01.DAT',  00H
$SG410	DB	'Radar Data File Not Found',  00H
$SG412	DB	'Radar Data File Read Error',  00H
$SG421	DB	'MissileData List exceeded MAX_MISSILE_LIST_CNT',  00H
$SG427	DB	'rb',  00H
$SG428	DB	'F14MD01.DAT',  00H
$SG430	DB	'Missile Data File Not Found',  00H
$SG433	DB	'Missile Object %d Not Found: %s',  0aH,  00H
$SG440	DB	'Bad Plane Pic Type < 0',  00H
$SG444	DB	'Bad Plane Pic Type > PDLC',  00H
$SG449	DB	'Bad Plane Pic Type < 0: ',  00H
$SG451	DB	'Bad Plane Ptr type > PDLC',  00H
$SG458	DB	'Bad Missile Type < 0: ',  00H
$SG464	DB	'Bad Missile ID - Missile ID Not Found: ',  00H
$SG471	DB	'Bad Radar Type < 0: ',  00H
$SG477	DB	'Bad Radar ID - Radar ID Not Found: ',  00H
$SG494	DB	'AMERB14.3DZ',  00H
$SG495	DB	'AMERT9.3DZ',  00H
$SG496	DB	'AMERT108.3DZ',  00H
$SG497	DB	'AMERWIR.3DZ',  00H
$SG498	DB	'AMERLIT.3DZ',  00H
$SG499	DB	'ABL1.3DZ',  00H
$SG500	DB	'ABL2.3DZ',  00H
$SG501	DB	'ABL3.3DZ',  00H
$SG502	DB	'ABL4.3DZ',  00H
$SG503	DB	'AMERTMB5.3DZ',  00H
$SG504	DB	'AMERTSB2.3DZ',  00H
$SG505	DB	'AMERTST1.3DZ',  00H
$SG506	DB	'AMERTSS4.3DZ',  00H
$SG507	DB	'AMERWAKE.3DZ',  00H
$SG509	DB	'NIMB08.3DZ',  00H
$SG510	DB	'NIMNT06.3DZ',  00H
$SG511	DB	'NIMT109.3DZ',  00H
$SG512	DB	'WIREN.3DZ',  00H
$SG513	DB	'LIGHTN.3DZ',  00H
$SG514	DB	'NBL1.3DZ',  00H
$SG515	DB	'NBL2.3DZ',  00H
$SG516	DB	'NBL3.3DZ',  00H
$SG517	DB	'NBL4.3DZ',  00H
$SG518	DB	'NIMBM02.3DZ',  00H
$SG519	DB	'NIMBS02.3DZ',  00H
$SG520	DB	'NIMST02.3DZ',  00H
$SG521	DB	'NIMBSS01.3DZ',  00H
$SG522	DB	'NIMWAKE.3DZ',  00H
$SG524	DB	'SARAB09.3DZ',  00H
$SG525	DB	'SARATOW.3DZ',  00H
$SG526	DB	'SARAT108.3DZ',  00H
$SG527	DB	'WIRESR.3DZ',  00H
$SG528	DB	'LIGHTSR.3DZ',  00H
$SG529	DB	'SBL1.3DZ',  00H
$SG530	DB	'SBL2.3DZ',  00H
$SG531	DB	'SBL3.3DZ',  00H
$SG532	DB	'SBL4.3DZ',  00H
$SG533	DB	'SARABM03.3DZ',  00H
$SG534	DB	'SARABS02.3DZ',  00H
$SG535	DB	'SARATS01.3DZ',  00H
$SG536	DB	'SARABSS1.3DZ',  00H
$SG537	DB	'SARAWAKE.3DZ',  00H
$SG539	DB	'F14L09B.3DZ',  00H
$SG540	DB	'F14MNS1H.3DZ',  00H
$SG541	DB	'F14MPS1H.3DZ',  00H
$SG542	DB	'F14R09B.3DZ',  00H
$SG543	DB	'F14SMLO2.3DZ',  00H
$SG544	DB	'F14SMC01.3DZ',  00H
$SG545	DB	'F14SMR01.3DZ',  00H
$SG546	DB	'F14SMM03.3DZ',  00H
$SG547	DB	'F14SMX01.3DZ',  00H
$SG549	DB	'F14LT014.3DZ',  00H
$SG550	DB	'F14RT014.3DZ',  00H
$SG551	DB	'F14LT032.3DZ',  00H
$SG552	DB	'F14RT032.3DZ',  00H
$SG553	DB	'F14LT033.3DZ',  00H
$SG554	DB	'F14RT033.3DZ',  00H
$SG555	DB	'F14LT041.3DZ',  00H
$SG556	DB	'F14RT041.3DZ',  00H
$SG557	DB	'F14LT074.3DZ',  00H
$SG558	DB	'F14RT074.3DZ',  00H
$SG559	DB	'F14LT084.3DZ',  00H
$SG560	DB	'F14RT084.3DZ',  00H
$SG561	DB	'F14LT102.3DZ',  00H
$SG562	DB	'F14RT102.3DZ',  00H
$SG563	DB	'F14LT103.3DZ',  00H
$SG564	DB	'F14RT103.3DZ',  00H
$SG565	DB	'F14LT142.3DZ',  00H
$SG566	DB	'F14RT142.3DZ',  00H
$SG567	DB	'F14LT143.3DZ',  00H
$SG568	DB	'F14RT143.3DZ',  00H
$SG569	DB	'F14LT101.3DZ',  00H
$SG570	DB	'F14RT101.3DZ',  00H
$SG572	DB	'SDWNDR3.3DZ',  00H
$SG573	DB	'SPARROW3.3DZ',  00H
$SG574	DB	'PHOENIX.3DZ',  00H
$SG575	DB	'FUELTANK.3DZ',  00H
$SG576	DB	'HARPOON.3DZ',  00H
$SG577	DB	'SDWNDR.3DZ',  00H
$SG578	DB	'MK82.3DZ',  00H
$SG580	DB	'SHADOW.3DZ',  00H
$SG581	DB	'AMERCHUT.3DZ',  00H
$SG582	DB	'RAMP02.3DZ',  00H
$SG583	DB	'TRPLAAA.3DZ',  00H
$SG584	DB	'CANOPY06.3DZ',  00H
$SG585	DB	'CHAFF.3DZ',  00H
$SG586	DB	'FLARE.3DZ',  00H
$SG596	DB	'Special Object Not Found: %s',  0aH,  00H
$SG599	DB	'Special Object Not Found: %s',  0aH,  00H
$SG602	DB	'Special Object Not Found: %s',  0aH,  00H
$SG605	DB	'Special Object Not Found: %s',  0aH,  00H
$SG610	DB	'Special Object Not Found: %s',  0aH,  00H
$SG614	DB	'Special Object Not Found: %s',  0aH,  00H
$SG616	DB	'Special Object Not Found: %s',  0aH,  00H
$SG621	DB	'Special Object Not Found: %s',  0aH,  00H
$SG626	DB	'Special Object Not Found: %s',  0aH,  00H
	ORG	$-1776
_PlaneDataSize	DW	03H
_MissileDataSize	DW	03H
_RadarDataSize	DW	02H
_planerecsize	DW	034H
_missilerecsize	DW	02cH
_radarrecsize	DW	018H
_EMS3DObjectSlot	DW	00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 15
; Line 16
; Line 17
; Line 18
; Line 19
; Line 20
; Line 21
; Line 22
; Line 100
	PUBLIC	_Load3DPlaneInfo
_Load3DPlaneInfo	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,68
	call	__aNchkstk
	push	si
;	i = -12
;	PlaneId = -68
;	PlaneDataFile = -66
;	recseek = -4
;	planerec = -64
;	missile0 = -8
;	missile1 = -10
;	returnval = -6
;	PlaneEnumId = 4
; Line 102
	mov	WORD PTR [bp-68],-1	;PlaneId
; Line 113
	mov	ax,WORD PTR _PlaneDataListCnt
	inc	ax
	cmp	ax,40
	jle	$I367
; Line 115
	mov	ax,40
	push	ax
	push	WORD PTR _PlaneDataListCnt
	mov	ax,OFFSET DGROUP:$SG368
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,8
; Line 116
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 117
$L20001:
	mov	ax,-1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 118
; Line 120
	nop	
$I367:
; Line 122
	push	WORD PTR [bp+4]	;PlaneEnumId
	call	_PlaneSeek
	add	sp,2
	mov	WORD PTR [bp-68],ax	;PlaneId
	inc	ax
	je	$I371
	mov	ax,WORD PTR [bp-68]	;PlaneId
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 124
	nop	
$I371:
; Line 127
	mov	ax,OFFSET DGROUP:$SG372
	push	ax
	mov	ax,OFFSET DGROUP:$SG373
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR [bp-66],ax	;PlaneDataFile
	or	ax,ax
	jne	$I374
; Line 128
	push	ax
	mov	ax,OFFSET DGROUP:$SG375
	push	ax
	call	_Message
	add	sp,4
; Line 129
	mov	ax,-1
	push	ax
	call	_exit
	add	sp,2
; Line 130
; Line 132
$I374:
; Line 133
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR [bp+4]	;PlaneEnumId
	imul	WORD PTR _planerecsize
	cwd	
	mov	WORD PTR [bp-4],ax	;recseek
	mov	WORD PTR [bp-2],dx
	push	dx
	push	ax
	push	WORD PTR [bp-66]	;PlaneDataFile
	call	_fseek
	add	sp,8
; Line 134
	mov	bx,WORD PTR [bp-66]	;PlaneDataFile
	test	BYTE PTR [bx+6],16
	jne	$L20001
; Line 136
	push	bx
	mov	ax,1
	push	ax
	push	WORD PTR _planerecsize
	lea	ax,WORD PTR [bp-64]	;planerec
	push	ax
	call	_fread
	add	sp,8
; Line 139
	push	WORD PTR _EMS3DObjectSlot
	lea	ax,WORD PTR [bp-48]
	push	ax
	call	_LoadEMSObject
	add	sp,4
	or	ax,ax
	jne	$I379
; Line 140
	lea	ax,WORD PTR [bp-48]
	push	ax
	push	WORD PTR [bp-64]	;planerec
	mov	ax,OFFSET DGROUP:$SG380
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,8
; Line 141
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 142
; Line 143
$I379:
	mov	ax,40
	imul	WORD PTR _PlaneDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR _EMS3DObjectSlot
	mov	WORD PTR es:[bx+16][si],ax
; Line 144
	inc	WORD PTR _EMS3DObjectSlot
; Line 147
	mov	ax,40
	imul	WORD PTR _PlaneDataListCnt
	mov	bx,ax
	les	si,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR [bp-64]	;planerec
	mov	WORD PTR es:[bx][si],ax
; Line 148
	lea	ax,WORD PTR [bp-62]
	push	ss
	push	ax
	mov	ax,40
	imul	WORD PTR _PlaneDataListCnt
	add	ax,WORD PTR _PlaneDataList
	mov	dx,WORD PTR _PlaneDataList+2
	inc	ax
	inc	ax
	push	dx
	push	ax
	call	_fstrcpy
	add	sp,8
; Line 149
	mov	ax,40
	imul	WORD PTR _PlaneDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR [bp-54]
	mov	WORD PTR es:[bx+10][si],ax
; Line 150
	mov	ax,40
	imul	WORD PTR _PlaneDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR [bp-52]
	mov	WORD PTR es:[bx+12][si],ax
; Line 155
	push	WORD PTR [bp-50]
	call	_RadarAdd
	add	sp,2
; Line 157
	mov	ax,40
	imul	WORD PTR _PlaneDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR [bp-50]
	mov	WORD PTR es:[bx+14][si],ax
; Line 159
	mov	ax,40
	imul	WORD PTR _PlaneDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR [bp-34]
	mov	WORD PTR es:[bx+18][si],ax
; Line 160
	mov	ax,40
	imul	WORD PTR _PlaneDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR [bp-32]
	mov	WORD PTR es:[bx+20][si],ax
; Line 161
	mov	ax,40
	imul	WORD PTR _PlaneDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR [bp-30]
	mov	WORD PTR es:[bx+22][si],ax
; Line 162
	mov	ax,40
	imul	WORD PTR _PlaneDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR [bp-28]
	mov	WORD PTR es:[bx+24][si],ax
; Line 165
	push	WORD PTR [bp-26]
	call	_MissileAdd
	add	sp,2
	mov	WORD PTR [bp-8],ax	;missile0
; Line 166
	mov	ax,40
	imul	WORD PTR _PlaneDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR [bp-26]
	mov	WORD PTR es:[bx+26][si],ax
; Line 167
	push	WORD PTR [bp-24]
	call	_MissileAdd
	add	sp,2
; Line 168
	mov	ax,40
	imul	WORD PTR _PlaneDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR [bp-24]
	mov	WORD PTR es:[bx+28][si],ax
; Line 169
	push	WORD PTR [bp-22]
	call	_MissileAdd
	add	sp,2
	mov	WORD PTR [bp-10],ax	;missile1
; Line 170
	mov	ax,40
	imul	WORD PTR _PlaneDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR [bp-22]
	mov	WORD PTR es:[bx+30][si],ax
; Line 174
	mov	ax,40
	imul	WORD PTR _PlaneDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR [bp-20]
	mov	WORD PTR es:[bx+32][si],ax
; Line 175
	mov	ax,40
	imul	WORD PTR _PlaneDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR [bp-18]
	mov	WORD PTR es:[bx+34][si],ax
; Line 176
	mov	ax,40
	imul	WORD PTR _PlaneDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR [bp-16]
	mov	WORD PTR es:[bx+36][si],ax
; Line 178
	mov	ax,40
	imul	WORD PTR _PlaneDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR [bp-14]
	mov	WORD PTR es:[bx+38][si],ax
; Line 180
	inc	WORD PTR _PlaneDataListCnt
; Line 182
	push	WORD PTR [bp-66]	;PlaneDataFile
	call	_fclose
	add	sp,2
; Line 183
	mov	ax,WORD PTR _PlaneDataListCnt
	dec	ax
	mov	WORD PTR [bp-6],ax	;returnval
; Line 185
	cmp	WORD PTR [bp-8],0	;missile0
	jge	$I383
; Line 186
	mov	ax,WORD PTR [bp-8]	;missile0
	neg	ax
	push	ax
	call	_Load3DPlaneInfo
	add	sp,2
; Line 187
$I383:
	cmp	WORD PTR [bp-10],0	;missile1
	jge	$I384
; Line 188
	mov	ax,WORD PTR [bp-10]	;missile1
	neg	ax
	push	ax
	call	_Load3DPlaneInfo
	add	sp,2
; Line 190
$I384:
	mov	ax,WORD PTR [bp-6]	;returnval
; Line 191
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Load3DPlaneInfo	ENDP
; Line 196
	PUBLIC	_PlaneSeek
_PlaneSeek	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	i = -4
;	cnt = -2
;	PlaneEnumId = 4
; Line 198
	mov	WORD PTR [bp-2],-1	;cnt
; Line 200
	mov	WORD PTR [bp-4],0	;i
	jmp	SHORT $F389
; Line 204
; Line 205
$FC390:
	inc	WORD PTR [bp-4]	;i
$F389:
	mov	ax,WORD PTR [bp-4]	;i
	cmp	WORD PTR _PlaneDataListCnt,ax
	jle	$FB391
; Line 201
	mov	cx,40
	imul	cx
	mov	bx,ax
	les	si,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR [bp+4]	;PlaneEnumId
	cmp	WORD PTR es:[bx][si],ax
	jne	$FC390
; Line 202
	mov	ax,WORD PTR [bp-4]	;i
	mov	WORD PTR [bp-2],ax	;cnt
; Line 203
$FB391:
; Line 207
	mov	ax,WORD PTR [bp-2]	;cnt
; Line 208
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_PlaneSeek	ENDP
; Line 212
	PUBLIC	_RadarAdd
_RadarAdd	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,34
	call	__aNchkstk
	push	si
;	i = -30
;	cnt = -28
;	RadarDataFile = -26
;	radarrecseek = -34
;	radarrec = -24
;	RadarEnumId = 4
; Line 214
	mov	WORD PTR [bp-28],-1	;cnt
; Line 224
	mov	ax,WORD PTR _RadarDataListCnt
	inc	ax
	cmp	ax,30
	jle	$I400
; Line 225
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG401
	push	ax
	call	_Message
	add	sp,4
; Line 226
	mov	ax,-1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 227
; Line 229
	nop	
$I400:
	mov	WORD PTR [bp-30],0	;i
	jmp	SHORT $F402
; Line 233
; Line 234
	nop	
$FC403:
	inc	WORD PTR [bp-30]	;i
$F402:
	mov	ax,WORD PTR [bp-30]	;i
	cmp	WORD PTR _RadarDataListCnt,ax
	jle	$FB404
; Line 230
	mov	cx,24
	imul	cx
	mov	bx,ax
	les	si,DWORD PTR _RadarDataList
	mov	ax,WORD PTR [bp+4]	;RadarEnumId
	cmp	WORD PTR es:[bx][si],ax
	jne	$FC403
; Line 231
	mov	ax,WORD PTR [bp-30]	;i
	mov	WORD PTR [bp-28],ax	;cnt
; Line 232
$FB404:
; Line 236
	cmp	WORD PTR [bp-28],-1	;cnt
	je	$JCC865
	jmp	$L20002
$JCC865:
; Line 241
	mov	ax,OFFSET DGROUP:$SG407
	push	ax
	mov	ax,OFFSET DGROUP:$SG408
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR [bp-26],ax	;RadarDataFile
	or	ax,ax
	jne	$I409
; Line 242
	push	ax
	mov	ax,OFFSET DGROUP:$SG410
	push	ax
	call	_Message
	add	sp,4
; Line 243
	mov	ax,-1
	push	ax
	call	_exit
	add	sp,2
; Line 244
; Line 246
$I409:
; Line 247
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR _radarrecsize
	imul	WORD PTR [bp+4]	;RadarEnumId
	cwd	
	mov	WORD PTR [bp-34],ax	;radarrecseek
	mov	WORD PTR [bp-32],dx
	push	dx
	push	ax
	push	WORD PTR [bp-26]	;RadarDataFile
	call	_fseek
	add	sp,8
; Line 249
	mov	bx,WORD PTR [bp-26]	;RadarDataFile
	test	BYTE PTR [bx+6],16
	je	$I411
; Line 250
	sub	ax,ax
	push	ax
	mov	cx,OFFSET DGROUP:$SG412
	push	cx
	call	_Message
	add	sp,4
; Line 251
	push	WORD PTR [bp-26]	;RadarDataFile
	call	_fclose
	add	sp,2
; Line 252
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 253
; Line 255
	nop	
$I411:
	push	bx
	mov	ax,1
	push	ax
	push	WORD PTR _radarrecsize
	lea	ax,WORD PTR [bp-24]	;radarrec
	push	ax
	call	_fread
	add	sp,8
; Line 257
	mov	ax,24
	imul	WORD PTR _RadarDataListCnt
	mov	bx,ax
	les	si,DWORD PTR _RadarDataList
	mov	ax,WORD PTR [bp-24]	;radarrec
	mov	WORD PTR es:[bx][si],ax
; Line 258
	lea	ax,WORD PTR [bp-22]
	push	ss
	push	ax
	mov	ax,24
	imul	WORD PTR _RadarDataListCnt
	add	ax,WORD PTR _RadarDataList
	mov	dx,WORD PTR _RadarDataList+2
	inc	ax
	inc	ax
	push	dx
	push	ax
	call	_fstrcpy
	add	sp,8
; Line 259
	mov	ax,24
	imul	WORD PTR _RadarDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _RadarDataList
	mov	ax,WORD PTR [bp-12]
	mov	cl,4
	shl	ax,cl
	mov	cx,10
	cwd	
	idiv	cx
	mov	WORD PTR es:[bx+12][si],ax
; Line 260
	mov	ax,24
	imul	WORD PTR _RadarDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _RadarDataList
	mov	ax,WORD PTR [bp-10]
	mov	WORD PTR es:[bx+14][si],ax
; Line 263
	push	WORD PTR [bp-8]
	call	_MissileAdd
	add	sp,2
; Line 264
	mov	ax,24
	imul	WORD PTR _RadarDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _RadarDataList
	mov	ax,WORD PTR [bp-8]
	mov	WORD PTR es:[bx+16][si],ax
; Line 266
	mov	ax,24
	imul	WORD PTR _RadarDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _RadarDataList
	mov	ax,WORD PTR [bp-6]
	mov	WORD PTR es:[bx+18][si],ax
; Line 267
	mov	ax,24
	imul	WORD PTR _RadarDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _RadarDataList
	mov	ax,WORD PTR [bp-4]
	mov	WORD PTR es:[bx+20][si],ax
; Line 268
	mov	ax,24
	imul	WORD PTR _RadarDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _RadarDataList
	mov	ax,WORD PTR [bp-2]
	mov	WORD PTR es:[bx+22][si],ax
; Line 270
	inc	WORD PTR _RadarDataListCnt
; Line 271
	push	WORD PTR [bp-26]	;RadarDataFile
	call	_fclose
	add	sp,2
; Line 272
$L20002:
	mov	ax,1
; Line 273
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_RadarAdd	ENDP
; Line 277
	PUBLIC	_MissileAdd
_MissileAdd	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,54
	call	__aNchkstk
	push	di
	push	si
;	i = -54
;	cnt = -48
;	MissileDataFile = -46
;	missilerecseek = -52
;	missilerec = -44
;	MissileEnumId = 4
; Line 279
	mov	WORD PTR [bp-48],-1	;cnt
; Line 284
	mov	ax,WORD PTR _MissileDataListCnt
	inc	ax
	cmp	ax,30
	jle	$I420
; Line 285
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG421
	push	ax
	call	_Message
	add	sp,4
; Line 286
	mov	ax,-1
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 287
; Line 290
	nop	
$I420:
	mov	WORD PTR [bp-54],0	;i
	jmp	SHORT $F422
; Line 294
; Line 295
	nop	
$FC423:
	inc	WORD PTR [bp-54]	;i
$F422:
	mov	ax,WORD PTR [bp-54]	;i
	cmp	WORD PTR _MissileDataListCnt,ax
	jle	$FB424
; Line 291
	mov	cx,34
	imul	cx
	mov	bx,ax
	les	si,DWORD PTR _MissileDataList
	mov	ax,WORD PTR [bp+4]	;MissileEnumId
	cmp	WORD PTR es:[bx][si],ax
	jne	$FC423
; Line 292
	mov	ax,WORD PTR [bp-54]	;i
	mov	WORD PTR [bp-48],ax	;cnt
; Line 293
$FB424:
; Line 297
	cmp	WORD PTR [bp-48],-1	;cnt
	je	$JCC1303
	jmp	$I434
$JCC1303:
; Line 302
	mov	ax,OFFSET DGROUP:$SG427
	push	ax
	mov	ax,OFFSET DGROUP:$SG428
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR [bp-46],ax	;MissileDataFile
	or	ax,ax
	jne	$I429
; Line 303
	push	ax
	mov	ax,OFFSET DGROUP:$SG430
	push	ax
	call	_Message
	add	sp,4
; Line 304
	mov	ax,-1
	push	ax
	call	_exit
	add	sp,2
; Line 305
; Line 307
$I429:
; Line 308
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR [bp+4]	;MissileEnumId
	imul	WORD PTR _missilerecsize
	cwd	
	mov	WORD PTR [bp-52],ax	;missilerecseek
	mov	WORD PTR [bp-50],dx
	push	dx
	push	ax
	push	WORD PTR [bp-46]	;MissileDataFile
	call	_fseek
	add	sp,8
; Line 310
	mov	bx,WORD PTR [bp-46]	;MissileDataFile
	test	BYTE PTR [bx+6],16
	je	$I431
; Line 311
	push	bx
	call	_fclose
	add	sp,2
; Line 312
	sub	ax,ax
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 313
; Line 314
$I431:
	push	bx
	mov	ax,1
	push	ax
	push	WORD PTR _missilerecsize
	lea	ax,WORD PTR [bp-44]	;missilerec
	push	ax
	call	_fread
	add	sp,8
; Line 316
	mov	ax,34
	imul	WORD PTR _MissileDataListCnt
	mov	bx,ax
	les	si,DWORD PTR _MissileDataList
	mov	ax,WORD PTR [bp-44]	;missilerec
	mov	WORD PTR es:[bx][si],ax
; Line 317
	lea	ax,WORD PTR [bp-42]
	push	ss
	push	ax
	mov	ax,34
	imul	WORD PTR _MissileDataListCnt
	add	ax,WORD PTR _MissileDataList
	mov	dx,WORD PTR _MissileDataList+2
	inc	ax
	inc	ax
	push	dx
	push	ax
	call	_fstrcpy
	add	sp,8
; Line 318
	mov	ax,34
	imul	WORD PTR _MissileDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _MissileDataList
	mov	ax,WORD PTR [bp-30]
	mov	cl,4
	shl	ax,cl
	mov	di,10
	cwd	
	idiv	di
	mov	WORD PTR es:[bx+14][si],ax
; Line 319
	mov	ax,34
	imul	WORD PTR _MissileDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _MissileDataList
	mov	ax,WORD PTR [bp-28]
	shl	ax,cl
	cwd	
	idiv	di
	mov	WORD PTR es:[bx+16][si],ax
; Line 320
	mov	ax,34
	imul	WORD PTR _MissileDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _MissileDataList
	mov	ax,WORD PTR [bp-26]
	mov	WORD PTR es:[bx+18][si],ax
; Line 321
	mov	ax,34
	imul	WORD PTR _MissileDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _MissileDataList
	mov	ax,WORD PTR [bp-24]
	mov	WORD PTR es:[bx+20][si],ax
; Line 322
	mov	ax,34
	imul	WORD PTR _MissileDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _MissileDataList
	mov	ax,WORD PTR [bp-22]
	mov	WORD PTR es:[bx+22][si],ax
; Line 323
	mov	ax,34
	imul	WORD PTR _MissileDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _MissileDataList
	mov	ax,WORD PTR [bp-20]
	mov	WORD PTR es:[bx+24][si],ax
; Line 324
	mov	ax,34
	imul	WORD PTR _MissileDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _MissileDataList
	mov	ax,WORD PTR [bp-18]
	mov	WORD PTR es:[bx+26][si],ax
; Line 325
	mov	ax,34
	imul	WORD PTR _MissileDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _MissileDataList
	mov	ax,WORD PTR [bp-16]
	mov	WORD PTR es:[bx+28][si],ax
; Line 326
	mov	ax,34
	imul	WORD PTR _MissileDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _MissileDataList
	mov	ax,WORD PTR _EMS3DObjectSlot
	mov	WORD PTR es:[bx+30][si],ax
; Line 327
	mov	ax,34
	imul	WORD PTR _MissileDataListCnt
	mov	si,ax
	les	bx,DWORD PTR _MissileDataList
	mov	ax,WORD PTR [bp-2]
	mov	WORD PTR es:[bx+32][si],ax
; Line 330
	push	WORD PTR _EMS3DObjectSlot
	lea	ax,WORD PTR [bp-14]
	push	ax
	call	_LoadEMSObject
	add	sp,4
	or	ax,ax
	jne	$I432
; Line 331
	lea	ax,WORD PTR [bp-14]
	push	ax
	push	WORD PTR [bp-44]	;missilerec
	mov	ax,OFFSET DGROUP:$SG433
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,8
; Line 332
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 333
; Line 335
$I432:
	inc	WORD PTR _EMS3DObjectSlot
; Line 336
	inc	WORD PTR _MissileDataListCnt
; Line 337
	push	WORD PTR [bp-46]	;MissileDataFile
	call	_fclose
	add	sp,2
; Line 339
	cmp	WORD PTR [bp-2],0
	jge	$I434
; Line 340
	mov	ax,WORD PTR [bp-2]
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 342
	nop	
$I434:
	mov	ax,1
; Line 343
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_MissileAdd	ENDP
; Line 349
	PUBLIC	_GetPicType
_GetPicType	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	si
;	PlaneNo = 4
; Line 350
	cmp	WORD PTR [bp+4],0	;PlaneNo
	jge	$I438
; Line 351
	mov	ax,OFFSET DGROUP:$SG440
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 352
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	push	WORD PTR [bp+4]	;PlaneNo
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 353
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
$L20003:
	push	ax
	call	_Message
	add	sp,4
; Line 354
	mov	ax,-1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 355
; Line 357
$I438:
	mov	ax,WORD PTR [bp+4]	;PlaneNo
	cmp	WORD PTR _PlaneDataListCnt,ax
	jge	$I443
; Line 358
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG444
	jmp	SHORT $L20003
; Line 360
; Line 362
	nop	
$I443:
	mov	ax,40
	imul	WORD PTR [bp+4]	;PlaneNo
	mov	si,ax
	les	bx,DWORD PTR _PlaneDataList
	mov	ax,WORD PTR es:[bx+16][si]
; Line 363
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetPicType	ENDP
; Line 367
	PUBLIC	_GetPlanePtr
_GetPlanePtr	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	PlaneNo = 4
; Line 369
	cmp	WORD PTR [bp+4],0	;PlaneNo
	jge	$I448
; Line 370
	mov	ax,OFFSET DGROUP:$SG449
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
$L20004:
	call	_strcpy
	mov	sp,bp
; Line 371
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	push	WORD PTR [bp+4]	;PlaneNo
	call	_itoa
	mov	sp,bp
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	mov	sp,bp
; Line 372
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	mov	sp,bp
; Line 373
	sub	ax,ax
	cwd	
	mov	sp,bp
	pop	bp
	ret	
; Line 374
; Line 376
$I448:
	mov	ax,WORD PTR [bp+4]	;PlaneNo
	cmp	WORD PTR _PlaneDataListCnt,ax
	jge	$I450
; Line 377
	mov	cx,OFFSET DGROUP:$SG451
	push	cx
	mov	cx,OFFSET _Txt
	push	cx
	jmp	SHORT $L20004
; Line 381
; Line 382
	nop	
$I450:
	mov	ax,40
	imul	WORD PTR [bp+4]	;PlaneNo
	add	ax,WORD PTR _PlaneDataList
	mov	dx,WORD PTR _PlaneDataList+2
; Line 383
	mov	sp,bp
	pop	bp
	ret	

_GetPlanePtr	ENDP
; Line 387
	PUBLIC	_GetMissilePtr
_GetMissilePtr	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	i = -4
;	FoundNo = -2
;	MissileNo = 4
; Line 389
	mov	WORD PTR [bp-2],-1	;FoundNo
; Line 391
	cmp	WORD PTR [bp+4],0	;MissileNo
	jge	$I457
; Line 392
	mov	ax,OFFSET DGROUP:$SG458
$L20005:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 393
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	push	WORD PTR [bp+4]	;MissileNo
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 394
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 395
	sub	ax,ax
	cwd	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 396
; Line 398
$I457:
	mov	WORD PTR [bp-4],0	;i
	jmp	SHORT $F459
; Line 402
; Line 403
	nop	
$FC460:
	inc	WORD PTR [bp-4]	;i
$F459:
	mov	ax,WORD PTR [bp-4]	;i
	cmp	WORD PTR _MissileDataListCnt,ax
	jle	$FB461
; Line 399
	mov	cx,34
	imul	cx
	mov	bx,ax
	les	si,DWORD PTR _MissileDataList
	mov	ax,WORD PTR [bp+4]	;MissileNo
	cmp	WORD PTR es:[bx][si],ax
	jne	$FC460
; Line 400
	mov	ax,WORD PTR [bp-4]	;i
	mov	WORD PTR [bp-2],ax	;FoundNo
; Line 401
$FB461:
; Line 405
	cmp	WORD PTR [bp-2],-1	;FoundNo
	jne	$I463
; Line 406
	mov	ax,OFFSET DGROUP:$SG464
	jmp	SHORT $L20005
; Line 410
; Line 411
$I463:
	mov	ax,34
	imul	WORD PTR [bp-2]	;FoundNo
	add	ax,WORD PTR _MissileDataList
	mov	dx,WORD PTR _MissileDataList+2
; Line 412
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetMissilePtr	ENDP
; Line 416
	PUBLIC	_GetRadarPtr
_GetRadarPtr	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	i = -4
;	FoundNo = -2
;	RadarNo = 4
; Line 418
	mov	WORD PTR [bp-2],-1	;FoundNo
; Line 420
	cmp	WORD PTR [bp+4],0	;RadarNo
	jge	$I470
; Line 421
	mov	ax,OFFSET DGROUP:$SG471
$L20006:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 422
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	push	WORD PTR [bp+4]	;RadarNo
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 423
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 424
	sub	ax,ax
	cwd	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 425
; Line 427
$I470:
	mov	WORD PTR [bp-4],0	;i
	jmp	SHORT $F472
; Line 431
; Line 432
	nop	
$FC473:
	inc	WORD PTR [bp-4]	;i
$F472:
	mov	ax,WORD PTR [bp-4]	;i
	cmp	WORD PTR _RadarDataListCnt,ax
	jle	$FB474
; Line 428
	mov	cx,24
	imul	cx
	mov	bx,ax
	les	si,DWORD PTR _RadarDataList
	mov	ax,WORD PTR [bp+4]	;RadarNo
	cmp	WORD PTR es:[bx][si],ax
	jne	$FC473
; Line 429
	mov	ax,WORD PTR [bp-4]	;i
	mov	WORD PTR [bp-2],ax	;FoundNo
; Line 430
$FB474:
; Line 434
	cmp	WORD PTR [bp-2],-1	;FoundNo
	jne	$I476
; Line 435
	mov	ax,OFFSET DGROUP:$SG477
	jmp	SHORT $L20006
; Line 439
; Line 440
$I476:
	mov	ax,24
	imul	WORD PTR [bp-2]	;FoundNo
	add	ax,WORD PTR _RadarDataList
	mov	dx,WORD PTR _RadarDataList+2
; Line 441
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetRadarPtr	ENDP
; Line 446
	PUBLIC	_Release3DMemory
_Release3DMemory	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 447
	cmp	WORD PTR _EMSHANDLE,0
	je	$I480
; Line 448
	push	WORD PTR _EMSHANDLE
	call	_EMSReleasePages
	add	sp,2
; Line 449
$I480:
	ret	
	nop	

_Release3DMemory	ENDP
; Line 453
	PUBLIC	_Init3DPlanes
_Init3DPlanes	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 455
	mov	ax,OFFSET DGROUP:_PlaneListSeg
	push	ax
	mov	ax,40
	imul	WORD PTR _PlaneDataSize
	push	ax
	call	__dos_allocmem
	add	sp,4
	or	ax,ax
	je	$I484
; Line 456
	mov	WORD PTR _ExitErrorCode,-12
; Line 457
	call	_InitAbort
; Line 458
; Line 459
$I484:
	mov	ax,WORD PTR _PlaneListSeg
	mov	WORD PTR _PlaneDataList+2,ax
; Line 460
	mov	WORD PTR _PlaneDataList,0
; Line 462
	mov	ax,OFFSET DGROUP:_RadarListSeg
	push	ax
	mov	ax,30
	imul	WORD PTR _RadarDataSize
	push	ax
	call	__dos_allocmem
	add	sp,4
	or	ax,ax
	je	$I486
; Line 463
	mov	WORD PTR _ExitErrorCode,-16
; Line 464
	call	_InitAbort
; Line 465
; Line 466
$I486:
	mov	ax,WORD PTR _RadarListSeg
	mov	WORD PTR _RadarDataList+2,ax
; Line 467
	mov	WORD PTR _RadarDataList,0
; Line 469
	mov	ax,OFFSET DGROUP:_MissileListSeg
	push	ax
	mov	ax,30
	imul	WORD PTR _MissileDataSize
	push	ax
	call	__dos_allocmem
	add	sp,4
	or	ax,ax
	je	$I487
; Line 470
	mov	WORD PTR _ExitErrorCode,-14
; Line 471
	call	_InitAbort
; Line 472
; Line 473
$I487:
	mov	ax,WORD PTR _MissileListSeg
	mov	WORD PTR _MissileDataList+2,ax
; Line 474
	mov	WORD PTR _MissileDataList,0
; Line 475
	ret	
	nop	

_Init3DPlanes	ENDP
; Line 479
	PUBLIC	_LoadSpecialObjects
_LoadSpecialObjects	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,184
	call	__aNchkstk
	push	di
	push	si
;	MiscSpecial = -182
;	CarrierSaratoga = -134
;	CoolF14Objects = -18
;	CoolF14Tails = -90
;	i = -106
;	j = -164
;	squad = -184
;	CarrierAmerica = -162
;	Missiles = -104
;	CarrierNimitz = -46
; Line 483
	mov	WORD PTR [bp-162],OFFSET DGROUP:$SG494	;CarrierAmerica
; Line 484
	mov	WORD PTR [bp-160],OFFSET DGROUP:$SG495
; Line 485
	mov	WORD PTR [bp-158],OFFSET DGROUP:$SG496
; Line 486
	mov	WORD PTR [bp-156],OFFSET DGROUP:$SG497
; Line 487
	mov	WORD PTR [bp-154],OFFSET DGROUP:$SG498
; Line 488
	mov	WORD PTR [bp-152],OFFSET DGROUP:$SG499
; Line 489
	mov	WORD PTR [bp-150],OFFSET DGROUP:$SG500
; Line 490
	mov	WORD PTR [bp-148],OFFSET DGROUP:$SG501
; Line 491
	mov	WORD PTR [bp-146],OFFSET DGROUP:$SG502
; Line 492
	mov	WORD PTR [bp-144],OFFSET DGROUP:$SG503
; Line 493
	mov	WORD PTR [bp-142],OFFSET DGROUP:$SG504
; Line 494
	mov	WORD PTR [bp-140],OFFSET DGROUP:$SG505
; Line 495
	mov	WORD PTR [bp-138],OFFSET DGROUP:$SG506
; Line 497
	mov	WORD PTR [bp-136],OFFSET DGROUP:$SG507
; Line 500
	mov	WORD PTR [bp-46],OFFSET DGROUP:$SG509	;CarrierNimitz
; Line 501
	mov	WORD PTR [bp-44],OFFSET DGROUP:$SG510
; Line 502
	mov	WORD PTR [bp-42],OFFSET DGROUP:$SG511
; Line 503
	mov	WORD PTR [bp-40],OFFSET DGROUP:$SG512
; Line 504
	mov	WORD PTR [bp-38],OFFSET DGROUP:$SG513
; Line 505
	mov	WORD PTR [bp-36],OFFSET DGROUP:$SG514
; Line 506
	mov	WORD PTR [bp-34],OFFSET DGROUP:$SG515
; Line 507
	mov	WORD PTR [bp-32],OFFSET DGROUP:$SG516
; Line 508
	mov	WORD PTR [bp-30],OFFSET DGROUP:$SG517
; Line 509
	mov	WORD PTR [bp-28],OFFSET DGROUP:$SG518
; Line 510
	mov	WORD PTR [bp-26],OFFSET DGROUP:$SG519
; Line 511
	mov	WORD PTR [bp-24],OFFSET DGROUP:$SG520
; Line 512
	mov	WORD PTR [bp-22],OFFSET DGROUP:$SG521
; Line 514
	mov	WORD PTR [bp-20],OFFSET DGROUP:$SG522
; Line 517
	mov	WORD PTR [bp-134],OFFSET DGROUP:$SG524	;CarrierSaratoga
; Line 518
	mov	WORD PTR [bp-132],OFFSET DGROUP:$SG525
; Line 519
	mov	WORD PTR [bp-130],OFFSET DGROUP:$SG526
; Line 520
	mov	WORD PTR [bp-128],OFFSET DGROUP:$SG527
; Line 521
	mov	WORD PTR [bp-126],OFFSET DGROUP:$SG528
; Line 522
	mov	WORD PTR [bp-124],OFFSET DGROUP:$SG529
; Line 523
	mov	WORD PTR [bp-122],OFFSET DGROUP:$SG530
; Line 524
	mov	WORD PTR [bp-120],OFFSET DGROUP:$SG531
; Line 525
	mov	WORD PTR [bp-118],OFFSET DGROUP:$SG532
; Line 526
	mov	WORD PTR [bp-116],OFFSET DGROUP:$SG533
; Line 527
	mov	WORD PTR [bp-114],OFFSET DGROUP:$SG534
; Line 528
	mov	WORD PTR [bp-112],OFFSET DGROUP:$SG535
; Line 529
	mov	WORD PTR [bp-110],OFFSET DGROUP:$SG536
; Line 531
	mov	WORD PTR [bp-108],OFFSET DGROUP:$SG537
; Line 534
	mov	WORD PTR [bp-18],OFFSET DGROUP:$SG539	;CoolF14Objects
; Line 535
	mov	WORD PTR [bp-16],OFFSET DGROUP:$SG540
; Line 536
	mov	WORD PTR [bp-14],OFFSET DGROUP:$SG541
; Line 537
	mov	WORD PTR [bp-12],OFFSET DGROUP:$SG542
; Line 538
	mov	WORD PTR [bp-10],OFFSET DGROUP:$SG543
; Line 539
	mov	WORD PTR [bp-8],OFFSET DGROUP:$SG544
; Line 540
	mov	WORD PTR [bp-6],OFFSET DGROUP:$SG545
; Line 541
	mov	WORD PTR [bp-4],OFFSET DGROUP:$SG546
; Line 542
	mov	WORD PTR [bp-2],OFFSET DGROUP:$SG547
; Line 548
	mov	WORD PTR [bp-90],OFFSET DGROUP:$SG549	;CoolF14Tails
; Line 549
	mov	WORD PTR [bp-88],OFFSET DGROUP:$SG550
; Line 550
	mov	WORD PTR [bp-86],OFFSET DGROUP:$SG551
; Line 551
	mov	WORD PTR [bp-84],OFFSET DGROUP:$SG552
; Line 552
	mov	WORD PTR [bp-82],OFFSET DGROUP:$SG553
; Line 553
	mov	WORD PTR [bp-80],OFFSET DGROUP:$SG554
; Line 554
	mov	WORD PTR [bp-78],OFFSET DGROUP:$SG555
; Line 555
	mov	WORD PTR [bp-76],OFFSET DGROUP:$SG556
; Line 556
	mov	WORD PTR [bp-74],OFFSET DGROUP:$SG557
; Line 557
	mov	WORD PTR [bp-72],OFFSET DGROUP:$SG558
; Line 558
	mov	WORD PTR [bp-70],OFFSET DGROUP:$SG559
; Line 559
	mov	WORD PTR [bp-68],OFFSET DGROUP:$SG560
; Line 560
	mov	WORD PTR [bp-66],OFFSET DGROUP:$SG561
; Line 561
	mov	WORD PTR [bp-64],OFFSET DGROUP:$SG562
; Line 562
	mov	WORD PTR [bp-62],OFFSET DGROUP:$SG563
; Line 563
	mov	WORD PTR [bp-60],OFFSET DGROUP:$SG564
; Line 564
	mov	WORD PTR [bp-58],OFFSET DGROUP:$SG565
; Line 565
	mov	WORD PTR [bp-56],OFFSET DGROUP:$SG566
; Line 566
	mov	WORD PTR [bp-54],OFFSET DGROUP:$SG567
; Line 567
	mov	WORD PTR [bp-52],OFFSET DGROUP:$SG568
; Line 568
	mov	WORD PTR [bp-50],OFFSET DGROUP:$SG569
; Line 570
	mov	WORD PTR [bp-48],OFFSET DGROUP:$SG570
; Line 573
	mov	WORD PTR [bp-104],OFFSET DGROUP:$SG572	;Missiles
; Line 574
	mov	WORD PTR [bp-102],OFFSET DGROUP:$SG573
; Line 575
	mov	WORD PTR [bp-100],OFFSET DGROUP:$SG574
; Line 576
	mov	WORD PTR [bp-98],OFFSET DGROUP:$SG575
; Line 577
	mov	WORD PTR [bp-96],OFFSET DGROUP:$SG576
; Line 578
	mov	WORD PTR [bp-94],OFFSET DGROUP:$SG577
; Line 580
	mov	WORD PTR [bp-92],OFFSET DGROUP:$SG578
; Line 583
	mov	WORD PTR [bp-182],OFFSET DGROUP:$SG580	;MiscSpecial
; Line 584
	mov	WORD PTR [bp-180],OFFSET DGROUP:$SG581
; Line 585
	mov	WORD PTR [bp-178],OFFSET DGROUP:$SG582
; Line 586
	mov	WORD PTR [bp-176],OFFSET DGROUP:$SG583
; Line 587
	mov	WORD PTR [bp-174],OFFSET DGROUP:$SG584
; Line 588
	mov	WORD PTR [bp-172],OFFSET DGROUP:$SG585
; Line 590
	mov	WORD PTR [bp-170],OFFSET DGROUP:$SG586
	sub	ax,ax
	mov	cx,4
	lea	di,WORD PTR [bp-168]
	push	ss
	pop	es
	rep	stosb
; Line 593
	mov	WORD PTR [bp-106],0	;i
	jmp	SHORT $F587
; Line 595
$SC594:
; Line 596
	push	WORD PTR [bp-106]	;i
	mov	si,WORD PTR [bp-106]	;i
	shl	si,1
	push	WORD PTR [bp-162][si]
	call	_LoadEMSObject
	add	sp,4
	or	ax,ax
	jne	$FC588
; Line 597
	push	WORD PTR [bp-162][si]
	mov	ax,OFFSET DGROUP:$SG596
$L20010:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,6
; Line 598
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 599
; Line 620
$FC588:
	inc	WORD PTR [bp-106]	;i
$F587:
	cmp	WORD PTR [bp-106],14	;i
	jge	$FB589
; Line 594
	mov	ax,WORD PTR _ConfigData+22
	or	ax,ax
	je	$SC594
	dec	ax
	je	$SC597
	dec	ax
	je	$SC600
; Line 614
	push	WORD PTR [bp-106]	;i
	mov	si,WORD PTR [bp-106]	;i
	shl	si,1
	push	WORD PTR [bp-162][si]
	call	_LoadEMSObject
	add	sp,4
	or	ax,ax
	jne	$FC588
; Line 615
	push	WORD PTR [bp-162][si]
	mov	ax,OFFSET DGROUP:$SG605
	jmp	SHORT $L20010
; Line 601
$SC597:
; Line 602
	push	WORD PTR [bp-106]	;i
	mov	si,WORD PTR [bp-106]	;i
	shl	si,1
	push	WORD PTR [bp-46][si]
	call	_LoadEMSObject
	add	sp,4
	or	ax,ax
	jne	$FC588
; Line 603
	push	WORD PTR [bp-46][si]
	mov	ax,OFFSET DGROUP:$SG599
	jmp	SHORT $L20010
; Line 607
	nop	
$SC600:
; Line 608
	push	WORD PTR [bp-106]	;i
	mov	si,WORD PTR [bp-106]	;i
	shl	si,1
	push	WORD PTR [bp-134][si]
	call	_LoadEMSObject
	add	sp,4
	or	ax,ax
	jne	$FC588
; Line 609
	push	WORD PTR [bp-134][si]
	mov	ax,OFFSET DGROUP:$SG602
	jmp	$L20010
; Line 613
$FB589:
; Line 624
	mov	WORD PTR [bp-164],0	;j
	mov	WORD PTR [bp-106],14	;i
$FC607:
; Line 625
	push	WORD PTR [bp-106]	;i
	mov	si,WORD PTR [bp-164]	;j
	shl	si,1
	push	WORD PTR [bp-18][si]
	call	_LoadEMSObject
	add	sp,4
	or	ax,ax
	jne	$L20007
; Line 626
	push	WORD PTR [bp-18][si]
	mov	ax,OFFSET DGROUP:$SG610
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,6
; Line 627
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 628
; Line 629
$L20007:
	inc	WORD PTR [bp-164]	;j
	inc	WORD PTR [bp-106]	;i
	cmp	WORD PTR [bp-106],23	;i
	jl	$FC607
; Line 634
	mov	ax,WORD PTR _ConfigData+24
	mov	WORD PTR [bp-184],ax	;squad
	or	ax,ax
	jge	$I611
	mov	WORD PTR [bp-184],20	;squad
; Line 635
$I611:
	cmp	WORD PTR [bp-184],9	;squad
	jle	$I612
	mov	WORD PTR [bp-184],20	;squad
; Line 636
$I612:
; Line 638
	mov	ax,23
	push	ax
	shl	WORD PTR [bp-184],1	;squad
	mov	si,WORD PTR [bp-184]	;squad
	shl	si,1
	push	WORD PTR [bp-90][si]
	call	_LoadEMSObject
	add	sp,4
	or	ax,ax
	jne	$I613
; Line 639
	push	WORD PTR [bp-90][si]
	mov	ax,OFFSET DGROUP:$SG614
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,6
; Line 640
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 641
; Line 644
$I613:
	mov	ax,24
	push	ax
	mov	si,WORD PTR [bp-184]	;squad
	shl	si,1
	push	WORD PTR [bp-88][si]
	call	_LoadEMSObject
	add	sp,4
	or	ax,ax
	jne	$I615
; Line 645
	push	WORD PTR [bp-88][si]
	mov	ax,OFFSET DGROUP:$SG616
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,6
; Line 646
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 647
; Line 651
$I615:
	mov	WORD PTR [bp-164],0	;j
	mov	WORD PTR [bp-106],25	;i
$FC618:
; Line 652
	push	WORD PTR [bp-106]	;i
	mov	si,WORD PTR [bp-164]	;j
	shl	si,1
	push	WORD PTR [bp-104][si]
	call	_LoadEMSObject
	add	sp,4
	or	ax,ax
	jne	$L20008
; Line 653
	push	WORD PTR [bp-104][si]
	mov	ax,OFFSET DGROUP:$SG621
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,6
; Line 654
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 655
; Line 656
$L20008:
	inc	WORD PTR [bp-164]	;j
	inc	WORD PTR [bp-106]	;i
	cmp	WORD PTR [bp-106],32	;i
	jl	$FC618
; Line 660
	mov	WORD PTR [bp-164],0	;j
	mov	WORD PTR [bp-106],32	;i
$FC623:
; Line 661
	push	WORD PTR [bp-106]	;i
	mov	si,WORD PTR [bp-164]	;j
	shl	si,1
	push	WORD PTR [bp-182][si]
	call	_LoadEMSObject
	add	sp,4
	or	ax,ax
	jne	$L20009
; Line 662
	push	WORD PTR [bp-182][si]
	mov	ax,OFFSET DGROUP:$SG626
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,6
; Line 663
	sub	ax,ax
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 664
; Line 665
$L20009:
	inc	WORD PTR [bp-164]	;j
	inc	WORD PTR [bp-106]	;i
	cmp	WORD PTR [bp-106],39	;i
	jl	$FC623
; Line 667
	mov	WORD PTR _EMS3DObjectSlot,39
; Line 668
	mov	ax,48
	push	ax
	call	_MissileAdd
	add	sp,2
; Line 669
	mov	ax,46
	push	ax
	call	_MissileAdd
	add	sp,2
; Line 670
	mov	ax,47
	push	ax
	call	_MissileAdd
	add	sp,2
; Line 671
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_LoadSpecialObjects	ENDP
_TEXT	ENDS
END
