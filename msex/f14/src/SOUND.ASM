;	Static Name Aliases
;
;	$S806_aimon	EQU	aimon
	TITLE   C:\SOUND.C
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
PUBLIC  _SndPriority
PUBLIC  _CanDoSpeech
PUBLIC  _SoundFile
PUBLIC  _SpeechDriver
EXTRN	__dos_open:NEAR
EXTRN	_AvailSysMem:FAR
EXTRN	_filelength:NEAR
EXTRN	_dig_load_overlay:NEAR
EXTRN	_LoadBigEMSFile:NEAR
EXTRN	_strcpy:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_strcat:NEAR
EXTRN	_itoa:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_Message:NEAR
EXTRN	__dos_close:NEAR
EXTRN	_LoadOverlay:FAR
EXTRN	_InitOverlay:FAR
EXTRN	_SndSysSetup:FAR
EXTRN	_SndSounds:FAR
EXTRN	_ejected:WORD
EXTRN	_SNDDETAIL:WORD
EXTRN	_ObjHands:BYTE
EXTRN	_ObjSegs:BYTE
EXTRN	_SndData:BYTE
_BSS      SEGMENT
COMM NEAR	_DigSysSetup:	BYTE:	 4
COMM NEAR	_DigQueue:	BYTE:	 4
COMM NEAR	_DigFlushQueue:	BYTE:	 4
COMM NEAR	_DigStatus:	BYTE:	 4
COMM NEAR	_DigAllOff:	BYTE:	 4
COMM NEAR	_DigShutDown:	BYTE:	 4
_BSS      ENDS
EXTRN	_SHOOT:WORD
EXTRN	_PW:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Txt:BYTE
_DATA      SEGMENT
	ORG	$+28
$SG783	DB	'game.dgt',  00H
$SG800	DB	'Sounds ',  00H
	ORG	$-45
_SndPriority	DW	00H
_CanDoSpeech	DW	00H
_SoundFile	DB	'Psound.14g',  00H
	ORG	$+1
_SpeechDriver	DB	'Digital.f14',  00H
	ORG	$+18
$S806_aimon	DW	00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 2
; Line 3
; Line 4
; Line 19
; Line 5
; Line 6
; Line 7
; Line 8
; Line 9
; Line 10
; Line 11
; Line 12
; Line 13
; Line 42
	PUBLIC	_InitSound
_InitSound	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 45
	mov	ax,WORD PTR _SndData+2
	cmp	ax,56
	je	$SC755
	ja	$SC750
	cmp	al,18
	jg	$L20001
	cmp	al,16
	jge	$SC752
	or	al,al
	je	$SC750
	dec	al
	jne	$SC750
; Line 50
	mov	BYTE PTR _SoundFile,73
; Line 51
	jmp	SHORT $SB747
; Line 52
$SC752:
; Line 57
	mov	BYTE PTR _SoundFile,65
; Line 58
	jmp	SHORT $SB747
; Line 59
	nop	
$SC753:
; Line 62
	mov	BYTE PTR _SoundFile,80
; Line 63
	jmp	SHORT $SB747
; Line 64
	nop	
$SC754:
; Line 66
	mov	BYTE PTR _SoundFile,82
; Line 67
	jmp	SHORT $SB747
; Line 68
	nop	
$SC755:
; Line 69
	mov	BYTE PTR _SoundFile,71
; Line 70
	jmp	SHORT $SB747
; Line 71
	nop	
$L20001:
	sub	al,24
	jl	$SC750
	dec	al
	jle	$SC752
	sub	al,7
	jl	$SC750
	sub	al,2
	jle	$SC753
	sub	al,14
	jl	$SC750
	dec	al
	jle	$SC754
$SC750:
; Line 47
	mov	BYTE PTR _SoundFile,78
; Line 48
$SB747:
; Line 76
	sub	ax,ax
	push	ax
	mov	ax,OFFSET DGROUP:_SoundFile
	push	ax
	call	FAR PTR _LoadOverlay
	add	sp,4
	push	ax
	call	FAR PTR _InitOverlay
	add	sp,2
; Line 77
	push	WORD PTR _SndData+4
	push	WORD PTR _SndData+2
	push	WORD PTR _SndData
	call	FAR PTR _SndSysSetup
	add	sp,6
; Line 79
	mov	al,BYTE PTR _SoundFile
	cbw	
	cmp	ax,105
	je	$I758
	cmp	ax,73
	jne	$I757
$I758:
	mov	WORD PTR _SndPriority,1
; Line 80
$I757:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_InitSound	ENDP
; Line 84
	PUBLIC	_OtherJetSound
_OtherJetSound	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	mode = 8
;	plane = 6
;	n = 4
; Line 85
	push	WORD PTR [bp+8]	;mode
	push	WORD PTR [bp+6]	;plane
	push	WORD PTR [bp+4]	;n
	call	FAR PTR _SndSounds
; Line 86
	mov	sp,bp
	pop	bp
	ret	

_OtherJetSound	ENDP
; Line 91
	PUBLIC	_Sound
_Sound	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	param = 8
;	priority = 6
;	n = 4
; Line 92
	cmp	WORD PTR _SNDDETAIL,3
	jne	$I769
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 93
	nop	
$I769:
	mov	ax,WORD PTR _SndPriority
	cmp	WORD PTR [bp+6],ax	;priority
	jle	$I770
	cmp	WORD PTR _ejected,0
	jne	$I770
; Line 98
	push	WORD PTR [bp+8]	;param
	push	WORD PTR [bp+4]	;n
	call	FAR PTR _SndSounds
	mov	sp,bp
; Line 99
; Line 101
$I770:
	call	_UpdateJetSnd
; Line 102
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Sound	ENDP
; Line 106
	PUBLIC	_InitSpeech
_InitSpeech	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
	push	si
;	fptr = -12
;	fhand = -4
;	size = -8
;	pages = -2
; Line 112
	mov	WORD PTR _CanDoSpeech,0
; Line 113
	cmp	WORD PTR _SndData+8,0
	jne	$I778
	mov	ax,-1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 115
	nop	
$I778:
	lea	ax,WORD PTR [bp-4]	;fhand
	push	ax
	sub	cx,cx
	push	cx
	mov	cx,OFFSET DGROUP:_SpeechDriver
	push	cx
	call	__dos_open
	add	sp,6
; Line 117
	mov	ax,16
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-4]	;fhand
	call	_filelength
	add	sp,2
	cwd	
	mov	WORD PTR [bp-8],ax	;size
	mov	WORD PTR [bp-6],dx
	add	ax,15
	adc	dx,0
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-2],ax	;pages
; Line 118
	push	WORD PTR [bp-4]	;fhand
	mov	si,ax
	call	__dos_close
	add	sp,2
; Line 120
	call	FAR PTR _AvailSysMem
	cmp	si,ax
	jae	$I785
; Line 121
	mov	ax,OFFSET DGROUP:_SpeechDriver
	push	ax
	call	_dig_load_overlay
	add	sp,2
	or	ax,ax
	jne	$I785
; Line 123
	mov	ax,1
	push	ax
	mov	cx,OFFSET DGROUP:$SG783
	push	cx
	call	_LoadBigEMSFile
	add	sp,4
	mov	WORD PTR [bp-8],ax	;size
	mov	WORD PTR [bp-6],dx
	or	dx,ax
	je	$I785
; Line 130
	push	WORD PTR _ObjHands+2
	push	WORD PTR _ObjSegs+2
	push	WORD PTR [bp-6]
	push	ax
	push	WORD PTR _SndData+12
	push	WORD PTR _SndData+10
	push	WORD PTR _SndData+8
	push	WORD PTR _SndData+6
	call	DWORD PTR _DigSysSetup
	add	sp,16
	or	ax,ax
	jne	$I785
; Line 131
	mov	WORD PTR _CanDoSpeech,1
; Line 132
; Line 133
$I785:
; Line 134
; Line 135
; Line 136
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_InitSpeech	ENDP
; Line 141
	PUBLIC	_Speech
_Speech	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	n = 4
; Line 142
	cmp	WORD PTR _CanDoSpeech,0
	je	$I789
	cmp	WORD PTR _SNDDETAIL,2
	jge	$I789
	cmp	WORD PTR _ejected,0
	jne	$I789
; Line 143
	push	WORD PTR [bp+4]	;n
	call	DWORD PTR _DigQueue
; Line 144
; Line 145
$I789:
	mov	sp,bp
	pop	bp
	ret	

_Speech	ENDP
; Line 149
	PUBLIC	_UnInitSpeech
_UnInitSpeech	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 150
	cmp	WORD PTR _CanDoSpeech,0
	je	$I792
; Line 151
	call	DWORD PTR _DigShutDown
; Line 152
; Line 153
$I792:
	ret	
	nop	

_UnInitSpeech	ENDP
; Line 157
	PUBLIC	_UpdateJetSnd
_UpdateJetSnd	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 158
	cmp	WORD PTR _SNDDETAIL,1
	je	$I795
	cmp	WORD PTR _ejected,0
	je	$I794
$I795:
; Line 159
	mov	ax,28
	jmp	SHORT $L20004
$I794:
; Line 161
	mov	ax,27
$L20004:
	push	ax
	call	FAR PTR _SndSounds
	add	sp,2
; Line 162
; Line 163
	ret	
	nop	

_UpdateJetSnd	ENDP
; Line 167
	PUBLIC	_AdjustSounds
_AdjustSounds	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 168
	inc	WORD PTR _SNDDETAIL
	and	WORD PTR _SNDDETAIL,3
; Line 169
	mov	ax,OFFSET DGROUP:$SG800
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 170
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	mov	ax,3
	sub	ax,WORD PTR _SNDDETAIL
	push	ax
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 171
	mov	ax,1
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	add	sp,4
; Line 172
	jmp	_UpdateJetSnd
; Line 173

_AdjustSounds	ENDP
; Line 177
	PUBLIC	_Aim9Sound
_Aim9Sound	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 180
	cmp	WORD PTR _PW,18
	jne	$I807
	cmp	WORD PTR _ejected,0
	jne	$I807
; Line 181
	mov	WORD PTR $S806_aimon,1
; Line 182
	cmp	WORD PTR _SHOOT,0
	je	$I808
; Line 183
	mov	ax,1
	push	ax
	mov	ax,2
	push	ax
	mov	ax,16
$L20005:
	push	ax
	call	_Sound
	add	sp,6
; Line 184
	ret	
	nop	
$I808:
; Line 185
	mov	ax,1
	push	ax
	mov	ax,2
	push	ax
	mov	ax,15
	jmp	SHORT $L20005
	nop	
$I807:
; Line 188
	cmp	WORD PTR $S806_aimon,0
	je	$I811
; Line 189
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	mov	dx,16
	push	dx
	call	_Sound
	add	sp,6
; Line 190
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	mov	cx,15
	push	cx
	call	_Sound
	add	sp,6
; Line 191
	mov	WORD PTR $S806_aimon,0
; Line 192
; Line 193
$I811:
; Line 194
	ret	

_Aim9Sound	ENDP
_TEXT	ENDS
END
