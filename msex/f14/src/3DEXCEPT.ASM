;	Static Name Aliases
;
	TITLE   C:\3DEXCEPT.C
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
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
COMM NEAR	_IneffectiveHit:	BYTE:	 2
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 19
; Line 2
; Line 3
; Line 4
; Line 5
; Line 6
; Line 7
; Line 15
	PUBLIC	_CheckTargetHit
_CheckTargetHit	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
;	Wpn = 12
;	Z = 8
;	X = 4
; Line 16
	sub	ax,ax
; Line 17
	ret	

_CheckTargetHit	ENDP
_TEXT	ENDS
END
