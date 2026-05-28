;	Static Name Aliases
;
	TITLE   C:\OPTIONS.C
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
EXTRN	_seedme:NEAR
EXTRN	__aNchkstk:NEAR
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
COMM NEAR	_RealLandings:	BYTE:	 2
COMM NEAR	_Joystick:	BYTE:	 2
COMM NEAR	_ThrustStick:	BYTE:	 2
COMM NEAR	_CoolyStick:	BYTE:	 2
COMM NEAR	_RudderStick:	BYTE:	 2
COMM NEAR	_StickType:	BYTE:	 2
COMM NEAR	_TimeOfDay:	BYTE:	 2
_BSS      ENDS
EXTRN	_REALFLIGHT:WORD
_BSS      SEGMENT
COMM NEAR	_SKYDETAIL:	BYTE:	 2
_BSS      ENDS
EXTRN	_Direction:WORD
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
; Line 8
; Line 9
; Line 28
	PUBLIC	_InitOptions
_InitOptions	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 30
	mov	WORD PTR _RealLandings,1
; Line 31
	mov	ax,1
	mov	WORD PTR _Direction,ax
	mov	WORD PTR _REALFLIGHT,ax
; Line 32
	jmp	_seedme
; Line 33
	nop	

_InitOptions	ENDP
_TEXT	ENDS
END
