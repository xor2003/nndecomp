;	Static Name Aliases
;
	TITLE   C:\SAVEMODE.C
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
PUBLIC  __current_mode
PUBLIC  __current_video_mode
PUBLIC  __current_video_font
PUBLIC  __current_video_rows
EXTRN	__aNchkstk:NEAR
_DATA      SEGMENT
__current_mode	DW	01H
__current_video_mode	DW	03H
__current_video_font	DW	012H
__current_video_rows	DW	019H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 48
	PUBLIC	_save_video_state
_save_video_state	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,72
	call	__aNchkstk
;	num_blocks = -72
;	return_val = -2
;	table = -70
;	ptable = -6
; Line 53
	lea	ax,WORD PTR [bp-70]	;table
	mov	WORD PTR [bp-6],ax	;ptable
	mov	WORD PTR [bp-4],ss
; Line 56
; Line 58
	mov	ah,28
; Line 59
	mov	al,0
; Line 60
	mov	cx,7
; Line 62
	int	16
; Line 64
	mov	WORD PTR [bp-72],bx	;num_blocks
; Line 66
	mov	WORD PTR [bp-2],ax	;return_val
; Line 68
; Line 70
	mov	al,BYTE PTR [bp-2]	;return_val
	sub	ah,ah
	cmp	ax,28
	je	$I110
; Line 71
	mov	WORD PTR __current_mode,0
; Line 73
	mov	sp,bp
	pop	bp
	ret	
; Line 74
; Line 77
	nop	
$I110:
; Line 78
	mov	ah,27
; Line 79
	mov	bx,0
; Line 80
	les	di,DWORD PTR [bp-6]	;ptable
; Line 82
	int	16
; Line 84
; Line 90
	mov	al,BYTE PTR [bp-66]
	cbw	
	mov	WORD PTR __current_video_mode,ax
	cmp	ax,3
	jle	$I112
	cmp	ax,7
	jne	$I111
$I112:
; Line 91
	cmp	BYTE PTR [bp-35],8
	je	$L20001
	cmp	BYTE PTR [bp-35],14
	jne	$I115
; Line 94
	mov	WORD PTR __current_video_font,17
; Line 95
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I115:
	cmp	BYTE PTR [bp-35],16
	jne	$I124
; Line 96
	mov	WORD PTR __current_video_font,20
; Line 98
	mov	sp,bp
	pop	bp
	ret	
$I111:
; Line 106
	mov	al,BYTE PTR [bp-36]
	cbw	
	mov	WORD PTR __current_video_rows,ax
; Line 108
	cmp	BYTE PTR [bp-35],8
	jne	$I120
; Line 109
	mov	WORD PTR __current_video_font,35
; Line 110
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I120:
	cmp	BYTE PTR [bp-35],14
	jne	$I122
; Line 111
	mov	WORD PTR __current_video_font,34
; Line 112
	mov	sp,bp
	pop	bp
	ret	
$I122:
	cmp	BYTE PTR [bp-35],16
	jne	$I124
; Line 113
	mov	WORD PTR __current_video_font,36
; Line 115
	jmp	SHORT $I125
$I124:
; Line 116
	mov	WORD PTR __current_video_mode,3
; Line 117
$L20001:
	mov	WORD PTR __current_video_font,18
; Line 119
$I125:
; Line 122
; Line 126
	mov	sp,bp
	pop	bp
	ret	

_save_video_state	ENDP
; Line 129
	PUBLIC	_restore_video_state
_restore_video_state	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
;	num_blocks = -10
;	return_val = -2
;	font = -6
;	mode = -4
;	rows = -8
; Line 135
	cmp	WORD PTR __current_mode,0
	je	$EX127
; Line 139
	mov	ax,WORD PTR __current_video_font
	mov	WORD PTR [bp-6],ax	;font
; Line 140
	mov	ax,WORD PTR __current_video_mode
	mov	WORD PTR [bp-4],ax	;mode
; Line 141
	mov	ax,WORD PTR __current_video_rows
	mov	WORD PTR [bp-8],ax	;rows
; Line 144
; Line 146
	mov	ah,0
; Line 147
	mov	al,BYTE PTR [bp-4]	;mode
; Line 149
	int	16
; Line 152
	mov	ah,17
; Line 153
	mov	al,BYTE PTR [bp-6]	;font
; Line 154
	mov	bl,0
; Line 155
	mov	dl,BYTE PTR [bp-8]	;rows
; Line 157
	int	16
; Line 159
; Line 162
$EX127:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_restore_video_state	ENDP
_TEXT	ENDS
END
