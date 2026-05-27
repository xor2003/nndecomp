;	Static Name Aliases
;
	TITLE   C:\SWOBJECT.C
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
EXTRN	__aNchkstk:NEAR
EXTRN	_objbot:WORD
EXTRN	_objtop:WORD
EXTRN	_objfree:WORD
EXTRN	_deltop:WORD
EXTRN	_delbot:WORD
EXTRN	_objsmax:WORD
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 19
; Line 27
; Line 28
; Line 29
; Line 30
; Line 31
; Line 32
	PUBLIC	_allocobj
_allocobj	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
	push	si
;	register si = ob
; Line 35
	cmp	WORD PTR _objfree,0
	jne	$I156
; Line 36
	sub	ax,ax
	pop	si
	ret	
; Line 38
	nop	
$I156:
; Line 39
	mov	si,WORD PTR _objfree
	mov	ax,WORD PTR [si+52]
	mov	WORD PTR _objfree,ax
; Line 41
	mov	WORD PTR [si+52],0
; Line 42
	mov	ax,WORD PTR _objbot
	mov	WORD PTR [si+54],ax
; Line 44
	cmp	WORD PTR _objbot,0
	je	$I157
; Line 45
	mov	bx,WORD PTR _objbot
	mov	WORD PTR [bx+52],si
; Line 46
	jmp	SHORT $I158
	nop	
$I157:
; Line 47
	mov	WORD PTR _objtop,si
$I158:
; Line 49
	mov	WORD PTR [si+102],0
; Line 50
	sub	ax,ax
	mov	WORD PTR [si+64],ax
	mov	WORD PTR [si+62],ax
; Line 51
	cmp	WORD PTR _objsmax,si
	jae	$I159
; Line 52
	mov	WORD PTR _objsmax,si
; Line 53
$I159:
	mov	WORD PTR _objbot,si
	mov	ax,si
; Line 54
	pop	si
	ret	
	nop	

_allocobj	ENDP
; Line 59
	PUBLIC	_deallobj
_deallobj	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	di
	push	si
;	register si = ob
;	register di = obb
;	obp = 4
; Line 64
	mov	si,WORD PTR [bp+4]	;obp
	mov	di,WORD PTR [si+54]
	or	di,di
	je	$I165
; Line 65
	mov	ax,WORD PTR [si+52]
	mov	WORD PTR [di+52],ax
; Line 66
	jmp	SHORT $I166
$I165:
; Line 67
	mov	ax,WORD PTR [si+52]
	mov	WORD PTR _objtop,ax
$I166:
; Line 69
	mov	di,WORD PTR [si+52]
	or	di,di
	je	$I167
; Line 70
	mov	ax,WORD PTR [si+54]
	mov	WORD PTR [di+54],ax
; Line 71
	jmp	SHORT $I168
	nop	
$I167:
; Line 72
	mov	ax,WORD PTR [si+54]
	mov	WORD PTR _objbot,ax
$I168:
; Line 74
	mov	WORD PTR [si+52],0
; Line 75
	cmp	WORD PTR _delbot,0
	je	$I169
; Line 76
	mov	bx,WORD PTR _delbot
	mov	WORD PTR [bx+52],si
; Line 77
	jmp	SHORT $I170
	nop	
$I169:
; Line 78
	mov	WORD PTR _deltop,si
$I170:
; Line 80
	mov	WORD PTR _delbot,si
; Line 83
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_deallobj	ENDP
_TEXT	ENDS
END
