;	Static Name Aliases
;
;	$S157_lastkey	EQU	lastkey
;	$S188_tickwait	EQU	tickwait
;	$S215_first	EQU	first
	TITLE   C:\SWASYNIO.C
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
EXTRN	_intson:NEAR
EXTRN	_histmult:NEAR
EXTRN	_dispmult:NEAR
EXTRN	_movemult:NEAR
EXTRN	_swgetc:NEAR
EXTRN	_swflush:NEAR
EXTRN	_commterm:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_commin:NEAR
EXTRN	_comminit:NEAR
EXTRN	_clrprmpt:NEAR
EXTRN	_puts:NEAR
EXTRN	_commout:NEAR
EXTRN	_ctlbreak:NEAR
EXTRN	_initpln:NEAR
EXTRN	_swend:NEAR
EXTRN	_initplyr:NEAR
EXTRN	_movmem:NEAR
EXTRN	_intsoff:NEAR
EXTRN	_player:WORD
EXTRN	_swgames:BYTE
EXTRN	_currgame:WORD
EXTRN	_counttick:WORD
EXTRN	_multbuff:WORD
EXTRN	_oobjects:BYTE
EXTRN	_explseed:WORD
_DATA      SEGMENT
$SG186	DB	'Time out on sychronization',  00H
	ORG	$+3
$SG211	DB	'Timeout during play