;	Static Name Aliases
;
;	$S841_CurrRioAnim	EQU	CurrRioAnim
;	$S842_LastDesignated	EQU	LastDesignated
;	$S843_AnimDir	EQU	AnimDir
;	$S844_LastPos	EQU	LastPos
	TITLE   C:\RIOHEAD.C
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
PUBLIC  _head_proj_x
PUBLIC  _head_proj_y
PUBLIC  _head_proj_z
PUBLIC  _behindus
PUBLIC  _closeplane
PUBLIC  _RioHead
PUBLIC  _RioLeftShould
PUBLIC  _RioLeftArm
PUBLIC  _RioRightShould
PUBLIC  _RioAnim
PUBLIC  _AnimCnt
PUBLIC  _TestIt
EXTRN	_labs:NEAR
EXTRN	_TrgMul:NEAR
EXTRN	_MapInEMSSprite:NEAR
EXTRN	_TransRectCopy:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	__aNNalshr:NEAR
EXTRN	__aNldiv:NEAR
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_View:WORD
EXTRN	_ps:BYTE
EXTRN	_Alt:WORD
EXTRN	_PxLng:DWORD
EXTRN	_PyLng:DWORD
EXTRN	_Rp1:WORD
EXTRN	_VM:BYTE
EXTRN	_DESIGNATED:WORD
EXTRN	_LOCKED:WORD
_DATA      SEGMENT
_RioHead	DW	00H
	DW	00H
	DW	04bH
	DW	051H
	DW	00H
	DW	0b4H
	DW	040H
	DW	04cH
	DW	00H
	DW	048H
	DW	050H
	DW	00H
	DW	0baH
	DW	041H
	DW	095H
	DW	00H
	DW	04cH
	DW	050H
	DW	00H
	DW	0baH
	DW	041H
	DW	0e2H
	DW	00H
	DW	050H
	DW	050H
	DW	00H
	DW	0c3H
	DW	041H
	DW	0e6H
	DW	00H
	DW	058H
	DW	04eH
	DW	01H
	DW	0bfH
	DW	043H
	DW	00H
	DW	052H
	DW	058H
	DW	050H
	DW	00H
	DW	0bdH
	DW	041H
	DW	059H
	DW	051H
	DW	062H
	DW	050H
	DW	00H
	DW	0afH
	DW	041H
	DW	00H
	DW	00H
	DW	049H
	DW	04fH
	DW	01H
	DW	0b4H
	DW	042H
	DW	04aH
	DW	00H
	DW	04aH
	DW	04fH
	DW	01H
	DW	0afH
	DW	042H
	DW	095H
	DW	00H
	DW	050H
	DW	04eH
	DW	01H
	DW	0a9H
	DW	043H
	DW	0b4H
	DW	050H
	DW	05bH
	DW	04cH
	DW	01H
	DW	09eH
	DW	045H
	DW	0bdH
	DW	051H
	DW	06dH
	DW	047H
	DW	00H
	DW	08cH
	DW	04aH
	DW	05aH
	DW	050H
	DW	059H
	DW	050H
	DW	01H
	DW	0a0H
	DW	041H
	DW	00H
	DW	050H
	DW	059H
	DW	050H
	DW	01H
	DW	0a0H
	DW	041H
 	DB	14 DUP(0)

_RioLeftShould	DW	00H
	DW	0a3H
	DW	026H
	DW	01fH
	DW	00H
	DW	093H
	DW	083H
	DW	027H
	DW	0a3H
	DW	02fH
	DW	021H
	DW	00H
	DW	093H
	DW	081H
	DW	057H
	DW	0a3H
	DW	02cH
	DW	021H
	DW	00H
	DW	093H
	DW	081H
	DW	0114H
	DW	04fH
	DW	02bH
	DW	01dH
	DW	01H
	DW	093H
	DW	084H
	DW	0114H
	DW	06dH
	DW	02bH
	DW	01dH
	DW	01H
	DW	093H
	DW	085H
	DW	0114H
	DW	08bH
	DW	02bH
	DW	01dH
	DW	01H
	DW	093H
	DW	085H
	DW	0114H
	DW	0a9H
	DW	02bH
	DW	018H
	DW	01H
	DW	093H
	DW	08aH
	DW	0b4H
	DW	09dH
	DW	02eH
	DW	016H
	DW	01H
	DW	090H
	DW	08cH
	DW	0b4H
	DW	0b4H
	DW	02fH
	DW	010H
	DW	01H
	DW	08fH
	DW	092H
	DW	0e6H
	DW	09dH
	DW	02dH
	DW	013H
	DW	01H
	DW	091H
	DW	08fH
	DW	0e6H
	DW	0b1H
	DW	02dH
	DW	015H
	DW	01H
	DW	091H
	DW	08dH
 	DB	28 DUP(0)

_RioLeftArm	DW	00H
	DW	0a1H
	DW	022H
	DW	024H
	DW	01H
	DW	086H
	DW	0a3H
	DW	023H
	DW	0a1H
	DW	020H
	DW	024H
	DW	01H
	DW	086H
	DW	0a3H
	DW	044H
	DW	0a1H
	DW	022H
	DW	024H
	DW	01H
	DW	084H
	DW	0a3H
	DW	067H
	DW	0a1H
	DW	024H
	DW	024H
	DW	01H
	DW	084H
	DW	0a3H
	DW	08cH
	DW	0a1H
	DW	022H
	DW	024H
	DW	01H
	DW	086H
	DW	0a3H
 	DB	14 DUP(0)

_RioRightShould	DW	0edH
	DW	099H
	DW	01bH
	DW	0eH
	DW	00H
	DW	0106H
	DW	089H
	DW	0124H
	DW	0b7H
	DW	01bH
	DW	0eH
	DW	00H
	DW	0106H
	DW	089H
	DW	0edH
	DW	0a8H
	DW	01bH
	DW	0eH
	DW	00H
	DW	0106H
	DW	089H
	DW	0edH
	DW	0b7H
	DW	01bH
	DW	0eH
	DW	00H
	DW	0106H
	DW	089H
	DW	0109H
	DW	099H
	DW	01aH
	DW	0eH
	DW	00H
	DW	0106H
	DW	089H
	DW	0109H
	DW	0a8H
	DW	01aH
	DW	0eH
	DW	00H
	DW	0106H
	DW	089H
	DW	0109H
	DW	0b7H
	DW	019H
	DW	0eH
	DW	00H
	DW	0106H
	DW	089H
	DW	0124H
	DW	099H
	DW	01bH
	DW	0eH
	DW	00H
	DW	0106H
	DW	089H
	DW	0124H
	DW	0a8H
	DW	019H
	DW	0eH
	DW	00H
	DW	0106H
	DW	089H
	DW	0d6H
	DW	099H
	DW	016H
	DW	0eH
	DW	00H
	DW	0106H
	DW	089H
 	DB	14 DUP(0)

_RioAnim	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	01H
	DW	00H
	DW	00H
	DW	00H
	DW	02H
	DW	00H
	DW	00H
	DW	00H
	DW	03H
	DW	01H
	DW	00H
	DW	01H
	DW	04H
	DW	02H
	DW	00H
	DW	02H
	DW	05H
	DW	01H
	DW	00H
	DW	03H
	DW	06H
	DW	03H
	DW	00H
	DW	04H
	DW	07H
	DW	04H
	DW	00H
	DW	00H
	DW	08H
	DW	05H
	DW	00H
	DW	06H
	DW	09H
	DW	06H
	DW	00H
	DW	06H
	DW	0aH
	DW	07H
	DW	01H
	DW	07H
	DW	0bH
	DW	08H
	DW	02H
	DW	08H
	DW	0cH
	DW	09H
	DW	03H
	DW	07H
	DW	0dH
	DW	0aH
	DW	04H
	DW	06H
 	DB	8 DUP(0)

_AnimCnt	DW	00H
_TestIt	DW	00H
_head_proj_x	DW	00H
_head_proj_y	DW	00H
_head_proj_z	DW	00H
_behindus	DW	00H
_closeplane	DW	0ffffH
$S841_CurrRioAnim	DW	00H
$S842_LastDesignated	DW	0ffffH
$S843_AnimDir	DW	01H
$S844_LastPos	DW	00H
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
; Line 8
; Line 9
; Line 10
; Line 11
; Line 12
; Line 13
; Line 14
; Line 153
	PUBLIC	_DisplayRioHead
_DisplayRioHead	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,30
	call	__aNchkstk
;	mseg = -26
;	mpage = -22
;	xheadpos = -24
;	mirrorhead = -28
;	who = -30
;	Rptemp = -20
;	Rtemp = -2
; Line 162
	mov	WORD PTR [bp-30],-1	;who
; Line 164
	mov	WORD PTR [bp-14],319
	mov	WORD PTR [bp-12],198
	mov	ax,2
	mov	WORD PTR [bp-10],ax
	mov	WORD PTR [bp-8],ax
	sub	ax,ax
	mov	WORD PTR [bp-24],ax	;xheadpos
	mov	WORD PTR [bp-18],ax
	mov	WORD PTR [bp-16],ax
	mov	WORD PTR [bp-6],ax
	mov	ax,1
	mov	WORD PTR [bp-20],ax	;Rptemp
	mov	WORD PTR [bp-4],ax
; Line 165
	lea	ax,WORD PTR [bp-20]	;Rptemp
	mov	WORD PTR [bp-2],ax	;Rtemp
; Line 167
	cmp	WORD PTR _View,4
	jne	$I850
; Line 168
	mov	WORD PTR [bp-24],35	;xheadpos
; Line 169
	mov	WORD PTR [bp-28],1	;mirrorhead
; Line 170
	jmp	SHORT $I851
	nop	
$I850:
; Line 171
	mov	WORD PTR [bp-24],139	;xheadpos
; Line 172
	mov	WORD PTR [bp-28],0	;mirrorhead
; Line 173
$I851:
; Line 175
	mov	ax,1
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR [bp-26],ax	;mseg
	or	ax,ax
	je	$I853
; Line 176
	push	WORD PTR [bp-28]	;mirrorhead
	sub	cx,cx
	push	cx
	mov	cx,49
	push	cx
	push	WORD PTR [bp-24]	;xheadpos
	push	WORD PTR [bp-2]	;Rtemp
	mov	cx,113
	push	cx
	mov	cx,145
	push	cx
	mov	cx,1
	push	cx
	mov	cx,2
	push	cx
	push	ax
	call	_TransRectCopy
	add	sp,20
; Line 177
; Line 179
$I853:
	mov	WORD PTR _AnimCnt,1
; Line 181
	cmp	WORD PTR _LOCKED,-1
	je	$I855
; Line 182
	mov	ax,WORD PTR _LOCKED
	mov	WORD PTR [bp-30],ax	;who
; Line 184
$I855:
	cmp	WORD PTR _DESIGNATED,-1
	je	$I856
; Line 185
	mov	ax,WORD PTR _DESIGNATED
	mov	WORD PTR [bp-30],ax	;who
; Line 186
$I856:
	cmp	WORD PTR _closeplane,-1
	je	$I857
; Line 187
	mov	ax,WORD PTR _closeplane
	mov	WORD PTR [bp-30],ax	;who
; Line 189
$I857:
	cmp	WORD PTR [bp-30],-1	;who
	jne	$I861
; Line 190
	mov	ax,40
	imul	WORD PTR [bp-30]	;who
	mov	bx,ax
	push	WORD PTR _ps[bx+6]
	push	WORD PTR _ps[bx+14]
	push	WORD PTR _ps[bx+12]
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	call	_HeadProject
	add	sp,10
	inc	ax
	jne	$I860
; Line 191
	mov	ax,WORD PTR $S844_LastPos
	mov	WORD PTR _AnimCnt,ax
; Line 192
	jmp	SHORT $I861
$I860:
; Line 193
	mov	WORD PTR _AnimCnt,1
; Line 194
$I861:
; Line 195
; Line 197
	mov	ax,WORD PTR _AnimCnt
	mov	WORD PTR $S844_LastPos,ax
; Line 199
	cmp	WORD PTR _head_proj_x,0
	jle	$I862
	cmp	WORD PTR _head_proj_y,0
	jge	$I862
	mov	WORD PTR _AnimCnt,2
; Line 200
$I862:
	cmp	WORD PTR _head_proj_x,0
	jle	$I863
	cmp	WORD PTR _head_proj_y,-15
	jge	$I863
	mov	WORD PTR _AnimCnt,3
; Line 201
$I863:
	cmp	WORD PTR _head_proj_x,0
	jle	$I864
	cmp	WORD PTR _head_proj_y,-40
	jge	$I864
	mov	WORD PTR _AnimCnt,5
; Line 202
$I864:
	cmp	WORD PTR _head_proj_x,0
	jle	$I865
	cmp	WORD PTR _head_proj_y,-60
	jge	$I865
	mov	WORD PTR _AnimCnt,6
; Line 204
$I865:
	cmp	WORD PTR _head_proj_x,0
	jle	$I866
	cmp	WORD PTR _head_proj_y,0
	jle	$I866
	mov	WORD PTR _AnimCnt,2
; Line 205
$I866:
	cmp	WORD PTR _head_proj_x,0
	jle	$I867
	cmp	WORD PTR _head_proj_y,15
	jle	$I867
	mov	WORD PTR _AnimCnt,1
; Line 206
$I867:
	cmp	WORD PTR _head_proj_x,0
	jle	$I868
	cmp	WORD PTR _head_proj_y,40
	jle	$I868
	mov	WORD PTR _AnimCnt,0
; Line 207
$I868:
	cmp	WORD PTR _head_proj_x,0
	jle	$I869
	cmp	WORD PTR _head_proj_y,60
	jle	$I869
	mov	WORD PTR _AnimCnt,4
; Line 209
$I869:
	cmp	WORD PTR _head_proj_x,0
	jge	$I870
	cmp	WORD PTR _head_proj_y,0
	jge	$I870
	mov	WORD PTR _AnimCnt,9
; Line 210
$I870:
	cmp	WORD PTR _head_proj_x,0
	jge	$I871
	cmp	WORD PTR _head_proj_y,-15
	jge	$I871
	mov	WORD PTR _AnimCnt,10
; Line 211
$I871:
	cmp	WORD PTR _head_proj_x,0
	jge	$I872
	cmp	WORD PTR _head_proj_y,-40
	jge	$I872
	mov	WORD PTR _AnimCnt,12
; Line 212
$I872:
	cmp	WORD PTR _head_proj_x,0
	jge	$I873
	cmp	WORD PTR _head_proj_y,-60
	jge	$I873
	mov	WORD PTR _AnimCnt,13
; Line 214
$I873:
	cmp	WORD PTR _head_proj_x,0
	jge	$I874
	cmp	WORD PTR _head_proj_y,0
	jle	$I874
	mov	WORD PTR _AnimCnt,9
; Line 215
$I874:
	cmp	WORD PTR _head_proj_x,0
	jge	$I875
	cmp	WORD PTR _head_proj_y,15
	jle	$I875
	mov	WORD PTR _AnimCnt,8
; Line 216
$I875:
	cmp	WORD PTR _head_proj_x,0
	jge	$I876
	cmp	WORD PTR _head_proj_y,40
	jle	$I876
	mov	WORD PTR _AnimCnt,7
; Line 217
$I876:
	cmp	WORD PTR _head_proj_x,0
	jge	$I877
	cmp	WORD PTR _head_proj_y,60
	jle	$I877
	mov	WORD PTR _AnimCnt,11
; Line 219
$I877:
	mov	cl,3
	mov	bx,WORD PTR _AnimCnt
	shl	bx,cl
	mov	bx,WORD PTR _RioAnim[bx]
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _RioHead[bx+8]
	mov	WORD PTR [bp-22],ax	;mpage
; Line 220
	cmp	WORD PTR _View,4
	jne	$I878
; Line 221
	mov	ax,319
	sub	ax,WORD PTR _RioHead[bx+4]
	sub	ax,WORD PTR _RioHead[bx+10]
	jmp	SHORT $L20006
	nop	
$I878:
; Line 223
	mov	cl,3
	mov	bx,WORD PTR _AnimCnt
	shl	bx,cl
	mov	bx,WORD PTR _RioAnim[bx]
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _RioHead[bx+10]
$L20006:
	mov	WORD PTR [bp-24],ax	;xheadpos
; Line 224
; Line 226
	push	WORD PTR [bp-22]	;mpage
	mov	ax,3
	push	ax
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR [bp-26],ax	;mseg
	or	ax,ax
	je	$I880
; Line 235
	push	WORD PTR [bp-28]	;mirrorhead
	sub	cx,cx
	push	cx
	mov	cl,3
	mov	bx,WORD PTR _AnimCnt
	shl	bx,cl
	mov	bx,WORD PTR _RioAnim[bx]
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	push	WORD PTR _RioHead[bx+12]
	push	WORD PTR [bp-24]	;xheadpos
	push	WORD PTR [bp-2]	;Rtemp
	push	WORD PTR _RioHead[bx+6]
	push	WORD PTR _RioHead[bx+4]
	push	WORD PTR _RioHead[bx+2]
	push	WORD PTR _RioHead[bx]
	push	ax
	call	_TransRectCopy
	add	sp,20
; Line 236
; Line 238
$I880:
	mov	cl,3
	mov	bx,WORD PTR _AnimCnt
	shl	bx,cl
	mov	bx,WORD PTR _RioAnim[bx+2]
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _RioLeftShould[bx+8]
	mov	WORD PTR [bp-22],ax	;mpage
; Line 240
	cmp	WORD PTR _View,4
	jne	$I881
; Line 241
	mov	ax,319
	sub	ax,WORD PTR _RioLeftShould[bx+4]
	sub	ax,WORD PTR _RioLeftShould[bx+10]
	jmp	SHORT $L20007
	nop	
$I881:
; Line 243
	mov	cl,3
	mov	bx,WORD PTR _AnimCnt
	shl	bx,cl
	mov	bx,WORD PTR _RioAnim[bx+2]
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _RioLeftShould[bx+10]
$L20007:
	mov	WORD PTR [bp-24],ax	;xheadpos
; Line 244
; Line 246
	push	WORD PTR [bp-22]	;mpage
	mov	ax,3
	push	ax
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR [bp-26],ax	;mseg
	or	ax,ax
	je	$I883
; Line 255
	push	WORD PTR [bp-28]	;mirrorhead
	sub	cx,cx
	push	cx
	mov	cl,3
	mov	bx,WORD PTR _AnimCnt
	shl	bx,cl
	mov	bx,WORD PTR _RioAnim[bx+2]
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	push	WORD PTR _RioLeftShould[bx+12]
	push	WORD PTR [bp-24]	;xheadpos
	push	WORD PTR [bp-2]	;Rtemp
	push	WORD PTR _RioLeftShould[bx+6]
	push	WORD PTR _RioLeftShould[bx+4]
	push	WORD PTR _RioLeftShould[bx+2]
	push	WORD PTR _RioLeftShould[bx]
	push	ax
	call	_TransRectCopy
	add	sp,20
; Line 256
; Line 258
$I883:
	mov	cl,3
	mov	bx,WORD PTR _AnimCnt
	shl	bx,cl
	mov	bx,WORD PTR _RioAnim[bx+4]
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _RioLeftArm[bx+8]
	mov	WORD PTR [bp-22],ax	;mpage
; Line 260
	cmp	WORD PTR _View,4
	jne	$I884
; Line 261
	mov	ax,319
	sub	ax,WORD PTR _RioLeftArm[bx+4]
	sub	ax,WORD PTR _RioLeftArm[bx+10]
	jmp	SHORT $L20008
	nop	
$I884:
; Line 263
	mov	cl,3
	mov	bx,WORD PTR _AnimCnt
	shl	bx,cl
	mov	bx,WORD PTR _RioAnim[bx+4]
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _RioLeftArm[bx+10]
$L20008:
	mov	WORD PTR [bp-24],ax	;xheadpos
; Line 264
; Line 266
	push	WORD PTR [bp-22]	;mpage
	mov	ax,3
	push	ax
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR [bp-26],ax	;mseg
	or	ax,ax
	je	$I886
; Line 275
	push	WORD PTR [bp-28]	;mirrorhead
	sub	cx,cx
	push	cx
	mov	cl,3
	mov	bx,WORD PTR _AnimCnt
	shl	bx,cl
	mov	bx,WORD PTR _RioAnim[bx+4]
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	push	WORD PTR _RioLeftArm[bx+12]
	push	WORD PTR [bp-24]	;xheadpos
	push	WORD PTR _Rp1
	push	WORD PTR _RioLeftArm[bx+6]
	push	WORD PTR _RioLeftArm[bx+4]
	push	WORD PTR _RioLeftArm[bx+2]
	push	WORD PTR _RioLeftArm[bx]
	push	ax
	call	_TransRectCopy
	add	sp,20
; Line 276
; Line 278
$I886:
	mov	cl,3
	mov	bx,WORD PTR _AnimCnt
	shl	bx,cl
	mov	bx,WORD PTR _RioAnim[bx+6]
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _RioRightShould[bx+8]
	mov	WORD PTR [bp-22],ax	;mpage
; Line 280
	cmp	WORD PTR _View,4
	jne	$I887
; Line 281
	mov	ax,319
	sub	ax,WORD PTR _RioRightShould[bx+4]
	sub	ax,WORD PTR _RioRightShould[bx+10]
	jmp	SHORT $L20009
$I887:
; Line 283
	mov	cl,3
	mov	bx,WORD PTR _AnimCnt
	shl	bx,cl
	mov	bx,WORD PTR _RioAnim[bx+6]
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _RioRightShould[bx+10]
$L20009:
	mov	WORD PTR [bp-24],ax	;xheadpos
; Line 284
; Line 286
	push	WORD PTR [bp-22]	;mpage
	mov	ax,3
	push	ax
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR [bp-26],ax	;mseg
	or	ax,ax
	je	$I889
; Line 295
	push	WORD PTR [bp-28]	;mirrorhead
	sub	cx,cx
	push	cx
	mov	cl,3
	mov	bx,WORD PTR _AnimCnt
	shl	bx,cl
	mov	bx,WORD PTR _RioAnim[bx+6]
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	push	WORD PTR _RioRightShould[bx+12]
	push	WORD PTR [bp-24]	;xheadpos
	push	WORD PTR [bp-2]	;Rtemp
	push	WORD PTR _RioRightShould[bx+6]
	push	WORD PTR _RioRightShould[bx+4]
	push	WORD PTR _RioRightShould[bx+2]
	push	WORD PTR _RioRightShould[bx]
	push	ax
	call	_TransRectCopy
; Line 296
; Line 297
$I889:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DisplayRioHead	ENDP
; Line 301
	PUBLIC	_HeadProject
_HeadProject	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
	push	si
;	dz = -18
;	xe = -8
;	ye = -16
;	ze = -22
;	dx = -4
;	dy = -12
;	z = 12
;	y = 8
;	x = 4
; Line 308
	mov	ax,WORD PTR _PyLng
	mov	dx,WORD PTR _PyLng+2
	add	ax,WORD PTR [bp+8]	;y
	adc	dx,WORD PTR [bp+10]
	sub	ax,0
	sbb	dx,16
	mov	WORD PTR [bp-12],ax	;dy
	mov	WORD PTR [bp-10],dx
; Line 309
	mov	ax,WORD PTR [bp+12]	;z
	sub	ax,WORD PTR _Alt
	sub	ax,9
	mov	WORD PTR [bp-18],ax	;dz
; Line 311
	mov	ax,WORD PTR _PxLng
	mov	dx,WORD PTR _PxLng+2
	sub	ax,WORD PTR [bp+4]	;x
	sbb	dx,WORD PTR [bp+6]
	mov	WORD PTR [bp-4],ax	;dx
	mov	WORD PTR [bp-2],dx
	push	dx
	push	ax
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$L20002
	jl	$L20001
	cmp	ax,23000
	ja	$L20002
$L20001:
	push	WORD PTR [bp-10]
	push	WORD PTR [bp-12]	;dy
	call	_labs
	add	sp,4
	or	dx,dx
	jl	$I901
	jg	$L20002
	cmp	ax,23000
	jbe	$I901
$L20002:
; Line 312
	mov	al,5
	push	ax
	lea	cx,WORD PTR [bp-4]	;dx
	push	cx
	call	__aNNalshr
; Line 313
	mov	al,5
	push	ax
	lea	cx,WORD PTR [bp-12]	;dy
	push	cx
	call	__aNNalshr
; Line 314
	mov	cl,5
	sar	WORD PTR [bp-18],cl	;dz
; Line 315
; Line 317
$I901:
	push	WORD PTR [bp-18]	;dz
	push	WORD PTR [bp-12]	;dy
	push	WORD PTR [bp-4]	;dx
	sub	ax,ax
	push	ax
	call	row3
	add	sp,8
	mov	WORD PTR [bp-8],ax	;xe
	mov	WORD PTR [bp-6],dx
; Line 318
	push	WORD PTR [bp-18]	;dz
	push	WORD PTR [bp-12]	;dy
	push	WORD PTR [bp-4]	;dx
	mov	ax,1
	push	ax
	call	row3
	add	sp,8
	mov	WORD PTR [bp-16],ax	;ye
	mov	WORD PTR [bp-14],dx
; Line 321
	push	WORD PTR [bp-18]	;dz
	push	WORD PTR [bp-12]	;dy
	push	WORD PTR [bp-4]	;dx
	mov	ax,2
	push	ax
	call	row3
	add	sp,8
	mov	WORD PTR [bp-22],ax	;ze
	mov	WORD PTR [bp-20],dx
	or	dx,ax
	jne	$I903
	mov	ax,-1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 323
$I903:
	cmp	WORD PTR [bp-20],0
	jl	$I904
	jg	$L20004
	or	ax,ax
	je	$I904
$L20004:
; Line 324
	neg	WORD PTR [bp-22]	;ze
	adc	WORD PTR [bp-20],0
	neg	WORD PTR [bp-20]
; Line 325
	mov	WORD PTR _behindus,1
; Line 326
	jmp	SHORT $I905
$I904:
; Line 327
	mov	WORD PTR _behindus,0
; Line 328
$I905:
; Line 331
	push	WORD PTR [bp-20]
	push	WORD PTR [bp-22]	;ze
	mov	ax,WORD PTR [bp-16]	;ye
	mov	dx,WORD PTR [bp-14]
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR _head_proj_y,ax
; Line 332
	mov	cx,ax
	sar	ax,1
	sar	ax,1
	sub	cx,ax
	mov	WORD PTR _head_proj_y,cx
; Line 333
	add	cx,50
	mov	WORD PTR _head_proj_y,cx
; Line 334
	mov	ax,WORD PTR [bp-22]	;ze
	mov	dx,WORD PTR [bp-20]
	mov	al,ah
	mov	ah,dl
	mov	dl,dh
	shl	dh,1
	sbb	dh,dh
	mov	WORD PTR _head_proj_z,ax
; Line 336
	push	WORD PTR [bp-20]
	push	WORD PTR [bp-22]	;ze
	mov	ax,WORD PTR [bp-8]	;xe
	mov	dx,WORD PTR [bp-6]
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	push	dx
	push	ax
	mov	si,cx
	call	__aNldiv
	add	ax,160
	mov	WORD PTR _head_proj_x,ax
	sub	ax,159
	mov	WORD PTR _head_proj_x,ax
; Line 337
	lea	ax,WORD PTR [si-99]
	mov	WORD PTR _head_proj_y,ax
; Line 338
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_HeadProject	ENDP
; Line 342
row3	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	z = -4
;	dz = 10
;	dy = 8
;	dx = 6
;	r = 4
; Line 345
	push	WORD PTR [bp+6]	;dx
	mov	bx,WORD PTR [bp+4]	;r
	shl	bx,1
	push	WORD PTR _VM[bx]
	mov	si,bx
	call	_TrgMul
	add	sp,4
	cwd	
	mov	WORD PTR [bp-4],ax	;z
	mov	WORD PTR [bp-2],dx
; Line 346
	push	WORD PTR [bp+10]	;dz
	push	WORD PTR _VM[si+6]
	call	_TrgMul
	add	sp,4
	cwd	
	add	WORD PTR [bp-4],ax	;z
	adc	WORD PTR [bp-2],dx
; Line 348
	push	WORD PTR [bp+8]	;dy
	push	WORD PTR _VM[si+12]
	call	_TrgMul
	add	sp,4
	cwd	
	add	WORD PTR [bp-4],ax	;z
	adc	WORD PTR [bp-2],dx
	mov	ax,WORD PTR [bp-4]	;z
	mov	dx,WORD PTR [bp-2]
; Line 349
	pop	si
	mov	sp,bp
	pop	bp
	ret	

row3	ENDP
_TEXT	ENDS
END
