;	Static Name Aliases
;
	TITLE   C:\INIT.C
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
EXTRN	_convallocate:NEAR
EXTRN	_xmsallocate:NEAR
EXTRN	_kgif:NEAR
EXTRN	__dos_setvect:NEAR
EXTRN	_time:NEAR
EXTRN	__enable:NEAR
EXTRN	_setupmouse:NEAR
EXTRN	_printf:NEAR
EXTRN	_close:NEAR
EXTRN	_exit:NEAR
EXTRN	_keyhandler:FAR
EXTRN	__aNchkstk:NEAR
EXTRN	_open:NEAR
EXTRN	_read:NEAR
EXTRN	_divzerohandler:FAR
EXTRN	_loadtables:NEAR
EXTRN	__disable:NEAR
EXTRN	_srand:NEAR
EXTRN	_loadwalls:NEAR
EXTRN	_reset_dsp:NEAR
EXTRN	_loadmusic:NEAR
EXTRN	_musicon:NEAR
EXTRN	_outp:NEAR
EXTRN	_musicoff:NEAR
EXTRN	_fade:NEAR
EXTRN	__dos_getvect:NEAR
EXTRN	_emmallocate:NEAR
EXTRN	_palette:BYTE
EXTRN	_speed:WORD
EXTRN	_hiscorenamstat:BYTE
EXTRN	_note:WORD
EXTRN	_lastunlock:WORD
EXTRN	_paldef:BYTE
EXTRN	_lastshoot:WORD
EXTRN	_saidwelcome:WORD
EXTRN	_memtype:BYTE
EXTRN	_convavailpages:WORD
EXTRN	_convwalls:WORD
EXTRN	_cheatenable:WORD
EXTRN	_oldlogpage:WORD
EXTRN	_oldphyspage:WORD
EXTRN	_snd:WORD
EXTRN	_oldsourhand:WORD
EXTRN	_lastsoundnum:WORD
EXTRN	_emmhandle:WORD
EXTRN	_speechstatus:WORD
EXTRN	_sndaddr:DWORD
EXTRN	_emmpageframe:WORD
EXTRN	_emswalls:WORD
EXTRN	_xmshandle:WORD
EXTRN	_xmspageframe:WORD
EXTRN	_times90:BYTE
EXTRN	_vms:WORD
EXTRN	_less64inc:BYTE
EXTRN	_xmswalls:WORD
EXTRN	_lzwbuf:WORD
EXTRN	_moustat:WORD
EXTRN	_pic:WORD
EXTRN	_walseg:BYTE
EXTRN	_oldsouroff:DWORD
EXTRN	_bstatus:WORD
EXTRN	_joyx1:WORD
EXTRN	_boleng:BYTE
EXTRN	_joyy1:WORD
EXTRN	_joyx2:WORD
_BSS      SEGMENT
COMM NEAR	_oldkeyhandler:	BYTE:	 4
_BSS      ENDS
EXTRN	_joyy2:WORD
EXTRN	_walrec:BYTE
EXTRN	_joyx3:WORD
EXTRN	_numcells:WORD
_BSS      SEGMENT
COMM NEAR	_oldhand:	BYTE:	 4
_BSS      ENDS
EXTRN	_joyy3:WORD
_BSS      SEGMENT
COMM NEAR	_olddivzerohandler:	BYTE:	 4
_BSS      ENDS
EXTRN	_joystat:WORD
EXTRN	_keystatus:BYTE
EXTRN	_clockspeed:WORD
EXTRN	_slottime:WORD
EXTRN	_slotpos:FWORD
EXTRN	_owecoins:WORD
EXTRN	_owecoinwait:WORD
EXTRN	_vidmode:WORD
EXTRN	_lastbarchange:DWORD
EXTRN	_mute:WORD
EXTRN	_numboards:WORD
EXTRN	_musicsource:WORD
EXTRN	_skilevel:WORD
EXTRN	_option:DWORD
_DATA      SEGMENT
$SG688	DB	'Error #1:  Memory allocation failed.',  00H
$SG690	DB	'Error #2:  Memory allocation failed.',  00H
$SG705	DB	'Error #3:  Memory allocation failed.',  00H
$SG710	DB	'Error #4:  This computer does not have enough memory.',  0aH
	DB	00H
$SG711	DB	' - Ken''s Labyrinth needs about 365K in conventional memory '
	DB	'to run.',  0aH,  00H
$SG740	DB	'BEGIN',  00H
$SG776	DB	'boards.kzp',  00H
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
; Line 4
	PUBLIC	_initialize
_initialize	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,32
	call	__aNchkstk
	push	di
	push	si
;	ksmfile = -28
;	i = -8
;	j = -10
;	k = -12
;	walcounter = -2
;	oclockspeed = -32
;	l = -30
;	tnow = -6
; Line 10
	call	_loadtables
; Line 11
	mov	al,BYTE PTR _option
	sub	ah,ah
	mov	WORD PTR _vidmode,ax
; Line 12
	mov	WORD PTR _mute,0
; Line 13
	mov	al,BYTE PTR _option+1
	sub	ah,ah
	mov	WORD PTR _speechstatus,ax
; Line 14
	mov	al,BYTE PTR _option+2
	sub	ah,ah
	dec	ax
	mov	WORD PTR _musicsource,ax
; Line 15
	mov	al,255
	sub	al,BYTE PTR _option+3
	and	ax,1
	mov	WORD PTR _moustat,ax
; Line 16
	mov	al,BYTE PTR _option+3
	sub	ah,ah
	sub	ax,3
	neg	ax
	sar	ax,1
	mov	WORD PTR _joystat,ax
; Line 17
	mov	WORD PTR _lastsoundnum,-1
; Line 18
	mov	ax,WORD PTR _joyx1
	cmp	WORD PTR _joyx2,ax
	jne	$JCC85
	jmp	$I686
$JCC85:
	mov	ax,WORD PTR _joyx2
	cmp	WORD PTR _joyx3,ax
	jne	$JCC97
	jmp	$I686
$JCC97:
	mov	ax,WORD PTR _joyy1
	cmp	WORD PTR _joyy2,ax
	jne	$JCC109
	jmp	$I686
$JCC109:
	mov	ax,WORD PTR _joyy2
	cmp	WORD PTR _joyy3,ax
	je	$JCC121
	jmp	$I685
$JCC121:
$I686:
; Line 19
	mov	WORD PTR _joystat,1
; Line 20
$I685:
	lea	ax,WORD PTR [bp-6]	;tnow
	push	ax
	call	_time
	add	sp,2
; Line 21
	push	WORD PTR [bp-6]	;tnow
	call	_srand
	add	sp,2
; Line 22
	mov	ax,1024
	push	ax
	call	_convallocate
	add	sp,2
	mov	WORD PTR _note,ax
	cmp	WORD PTR _note,-1
	je	$JCC169
	jmp	$I687
$JCC169:
; Line 23
; Line 24
	mov	ax,OFFSET DGROUP:$SG688
	push	ax
	call	_printf
	add	sp,2
; Line 25
	mov	ax,-1
	push	ax
	call	_exit
	add	sp,2
; Line 26
; Line 27
$I687:
	mov	ax,4096
	push	ax
	call	_convallocate
	add	sp,2
	mov	WORD PTR _snd,ax
	cmp	WORD PTR _snd,-1
	je	$JCC212
	jmp	$I689
$JCC212:
; Line 28
; Line 29
	mov	ax,OFFSET DGROUP:$SG690
	push	ax
	call	_printf
	add	sp,2
; Line 30
	mov	ax,-1
	push	ax
	call	_exit
	add	sp,2
; Line 31
; Line 32
$I689:
	cmp	WORD PTR _speechstatus,2
	jae	$JCC242
	jmp	$I691
$JCC242:
; Line 33
; Line 34
	call	_reset_dsp
; Line 35
; Line 37
	mov	dx,524
; Line 38
	mov	ax,WORD PTR _speechstatus
; Line 39
	mov	cl,4
; Line 40
	shl	ax,cl
; Line 41
	add	dx,ax
; Line 42
$ksbsetwait1693:
; Line 43
	in	al,dx
; Line 44
	test	al,128
; Line 45
	jne	$ksbsetwait1693
; Line 46
	mov	al,209
; Line 47
	out	dx, al

; Line 48
$ksbsetwait2694:
; Line 49
	in	al,dx
; Line 50
	test	al,128
; Line 51
	jne	$ksbsetwait2694
; Line 52
	mov	al,64
; Line 53
	out	dx, al

; Line 54
$ksbsetwait3695:
; Line 55
	in	al,dx
; Line 56
	test	al,128
; Line 57
	jne	$ksbsetwait3695
; Line 58
	mov	al,165
; Line 59
	out	dx, al

; Line 60
; Line 61
; Line 62
$I691:
	mov	ax,WORD PTR _snd
	sub	dx,dx
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	mov	WORD PTR _sndaddr,ax
	mov	WORD PTR _sndaddr+2,dx
; Line 63
	mov	al,BYTE PTR _sndaddr+1
	and	al,128
	cmp	al,0
	ja	$JCC321
	jmp	$I696
$JCC321:
; Line 64
; Line 65
	mov	ax,WORD PTR _sndaddr
	mov	dx,WORD PTR _sndaddr+2
	shr	dx,1
	rcr	ax,1
	shr	dx,1
	rcr	ax,1
	shr	dx,1
	rcr	ax,1
	shr	dx,1
	rcr	ax,1
	mov	WORD PTR [bp-30],ax	;l
; Line 66
	mov	WORD PTR [bp-8],0	;i
	jmp	$F697
$FC698:
	inc	WORD PTR [bp-8]	;i
$F697:
	cmp	WORD PTR [bp-8],8	;i
	jl	$JCC367
	jmp	$FB699
$JCC367:
; Line 67
; Line 68
	mov	bx,WORD PTR [bp-8]	;i
	shl	bx,1
	mov	WORD PTR _memtype[bx],-1
; Line 69
	mov	ax,WORD PTR [bp-30]	;l
	mov	bx,WORD PTR [bp-8]	;i
	shl	bx,1
	mov	WORD PTR _walseg[bx],ax
; Line 70
	add	WORD PTR [bp-30],256	;l
; Line 71
	jmp	$FC698
$FB699:
; Line 72
; Line 73
	jmp	$I700
$I696:
; Line 74
; Line 75
	mov	ax,WORD PTR _sndaddr
	mov	dx,WORD PTR _sndaddr+2
	add	ax,-32768
	adc	dx,0
	shr	dx,1
	rcr	ax,1
	shr	dx,1
	rcr	ax,1
	shr	dx,1
	rcr	ax,1
	shr	dx,1
	rcr	ax,1
	mov	WORD PTR [bp-30],ax	;l
; Line 76
	mov	WORD PTR [bp-8],0	;i
	jmp	$F701
$FC702:
	inc	WORD PTR [bp-8]	;i
$F701:
	cmp	WORD PTR [bp-8],8	;i
	jl	$JCC453
	jmp	$FB703
$JCC453:
; Line 77
; Line 78
	mov	bx,WORD PTR [bp-8]	;i
	shl	bx,1
	mov	WORD PTR _memtype[bx],-1
; Line 79
	mov	ax,WORD PTR [bp-30]	;l
	mov	bx,WORD PTR [bp-8]	;i
	shl	bx,1
	mov	WORD PTR _walseg[bx],ax
; Line 80
	add	WORD PTR [bp-30],256	;l
; Line 81
	jmp	$FC702
$FB703:
; Line 82
$I700:
; Line 83
	mov	ax,769
	push	ax
	call	_convallocate
	add	sp,2
	mov	WORD PTR _lzwbuf,ax
	cmp	WORD PTR _lzwbuf,-1
	je	$JCC507
	jmp	$I704
$JCC507:
; Line 84
; Line 85
	mov	ax,OFFSET DGROUP:$SG705
	push	ax
	call	_printf
	add	sp,2
; Line 86
	mov	ax,-1
	push	ax
	call	_exit
	add	sp,2
; Line 87
; Line 88
$I704:
	mov	WORD PTR _oldlogpage,-1
; Line 89
	mov	WORD PTR _oldphyspage,-1
; Line 90
	mov	WORD PTR _oldsourhand,-1
; Line 91
	mov	WORD PTR _oldsouroff,-1
	mov	WORD PTR _oldsouroff+2,-1
; Line 92
	mov	WORD PTR _convwalls,448
; Line 93
	mov	WORD PTR _emswalls,0
; Line 94
	mov	WORD PTR _xmswalls,0
; Line 95
	mov	ax,-26624
	push	ax
	call	_convallocate
	add	sp,2
	mov	WORD PTR _pic,ax
	cmp	WORD PTR _pic,-1
	je	$JCC598
	jmp	$I706
$JCC598:
; Line 96
; Line 97
	mov	al,BYTE PTR _convavailpages+1
	sub	ah,ah
	add	ax,8
	mov	WORD PTR _convwalls,ax
; Line 98
	mov	ax,448
	sub	ax,WORD PTR _convwalls
	mov	WORD PTR _emswalls,ax
; Line 99
	mov	ah,BYTE PTR _convwalls
	sub	ah,8
	sub	al,al
	push	ax
	call	_convallocate
	add	sp,2
	mov	WORD PTR _pic,ax
; Line 100
	mov	ax,WORD PTR _emswalls
	add	ax,3
	shr	ax,1
	shr	ax,1
	push	ax
	call	_emmallocate
	add	sp,2
	mov	WORD PTR _emmhandle,ax
	cmp	WORD PTR _emmhandle,-1
	je	$JCC668
	jmp	$I707
$JCC668:
; Line 101
; Line 102
	dec	WORD PTR _convwalls
; Line 103
	mov	ah,BYTE PTR _convwalls
	sub	ah,8
	sub	al,al
	add	ax,WORD PTR _pic
	mov	WORD PTR _xmspageframe,ax
; Line 104
	mov	ax,448
	sub	ax,WORD PTR _convwalls
	mov	WORD PTR _xmswalls,ax
; Line 105
	mov	WORD PTR _emswalls,0
; Line 106
	mov	ax,WORD PTR _xmswalls
	shl	ax,1
	shl	ax,1
	push	ax
	call	_xmsallocate
	add	sp,2
	mov	WORD PTR _xmshandle,ax
	cmp	WORD PTR _xmshandle,-1
	je	$JCC731
	jmp	$I708
$JCC731:
; Line 107
; Line 108
	cmp	WORD PTR _convwalls,32
	jb	$JCC741
	jmp	$I709
$JCC741:
; Line 109
; Line 110
	mov	ax,OFFSET DGROUP:$SG710
	push	ax
	call	_printf
	add	sp,2
; Line 111
	mov	ax,OFFSET DGROUP:$SG711
	push	ax
	call	_printf
	add	sp,2
; Line 112
	mov	ax,-1
	push	ax
	call	_exit
	add	sp,2
; Line 113
; Line 114
$I709:
	mov	WORD PTR _xmswalls,0
; Line 115
	mov	WORD PTR _vms,1
; Line 116
; Line 117
$I708:
; Line 118
$I707:
; Line 119
$I706:
	mov	WORD PTR [bp-2],8	;walcounter
; Line 120
	cmp	WORD PTR _convwalls,8
	ja	$JCC798
	jmp	$I712
$JCC798:
; Line 121
; Line 122
	mov	ax,WORD PTR _pic
	mov	WORD PTR [bp-30],ax	;l
; Line 123
	mov	WORD PTR [bp-8],0	;i
	jmp	$F713
$FC714:
	inc	WORD PTR [bp-8]	;i
$F713:
	mov	ax,WORD PTR _convwalls
	sub	ax,8
	cmp	ax,WORD PTR [bp-8]	;i
	ja	$JCC829
	jmp	$FB715
$JCC829:
; Line 124
; Line 125
	mov	bx,WORD PTR [bp-2]	;walcounter
	shl	bx,1
	mov	WORD PTR _memtype[bx],-1
; Line 126
	mov	ax,WORD PTR [bp-30]	;l
	mov	bx,WORD PTR [bp-2]	;walcounter
	shl	bx,1
	mov	WORD PTR _walseg[bx],ax
; Line 127
	inc	WORD PTR [bp-2]	;walcounter
; Line 128
	add	WORD PTR [bp-30],256	;l
; Line 129
	jmp	$FC714
$FB715:
; Line 130
; Line 131
$I712:
	cmp	WORD PTR _emswalls,0
	ja	$JCC873
	jmp	$I716
$JCC873:
; Line 132
	mov	WORD PTR [bp-8],0	;i
	jmp	$F717
$FC718:
	inc	WORD PTR [bp-8]	;i
$F717:
	mov	ax,WORD PTR _emswalls
	cmp	WORD PTR [bp-8],ax	;i
	jb	$JCC895
	jmp	$FB719
$JCC895:
; Line 133
; Line 134
	mov	ax,WORD PTR [bp-8]	;i
	sar	ax,1
	sar	ax,1
	add	ax,1024
	mov	bx,WORD PTR [bp-2]	;walcounter
	shl	bx,1
	mov	WORD PTR _memtype[bx],ax
; Line 135
	mov	ah,BYTE PTR [bp-8]	;i
	and	ax,768
	add	ax,WORD PTR _emmpageframe
	mov	bx,WORD PTR [bp-2]	;walcounter
	shl	bx,1
	mov	WORD PTR _walseg[bx],ax
; Line 136
	inc	WORD PTR [bp-2]	;walcounter
; Line 137
	jmp	$FC718
$FB719:
; Line 138
$I716:
	cmp	WORD PTR _xmswalls,0
	ja	$JCC949
	jmp	$I720
$JCC949:
; Line 139
	mov	WORD PTR [bp-8],0	;i
	jmp	$F721
$FC722:
	inc	WORD PTR [bp-8]	;i
$F721:
	mov	ax,WORD PTR _xmswalls
	cmp	WORD PTR [bp-8],ax	;i
	jb	$JCC971
	jmp	$FB723
$JCC971:
; Line 140
; Line 141
	mov	ax,WORD PTR [bp-8]	;i
	add	ax,2048
	mov	bx,WORD PTR [bp-2]	;walcounter
	shl	bx,1
	mov	WORD PTR _memtype[bx],ax
; Line 142
	mov	ax,WORD PTR _xmspageframe
	mov	bx,WORD PTR [bp-2]	;walcounter
	shl	bx,1
	mov	WORD PTR _walseg[bx],ax
; Line 143
	inc	WORD PTR [bp-2]	;walcounter
; Line 144
	jmp	$FC722
$FB723:
; Line 145
$I720:
	cmp	WORD PTR _vms,1
	je	$JCC1014
	jmp	$I724
$JCC1014:
; Line 146
; Line 147
	mov	ax,WORD PTR [bp-2]	;walcounter
	mov	WORD PTR _numcells,ax
; Line 148
	mov	WORD PTR [bp-8],0	;i
	jmp	$F725
$FC726:
	inc	WORD PTR [bp-8]	;i
$F725:
	cmp	WORD PTR [bp-8],448	;i
	jl	$JCC1041
	jmp	$FB727
$JCC1041:
; Line 149
	mov	bx,WORD PTR [bp-8]	;i
	shl	bx,1
	shl	bx,1
	sub	ax,ax
	mov	WORD PTR _walrec[bx+2],ax
	mov	WORD PTR _walrec[bx],ax
	jmp	$FC726
$FB727:
; Line 150
	mov	ax,WORD PTR _numcells
	mov	WORD PTR [bp-8],ax	;i
	jmp	$F728
$FC729:
	inc	WORD PTR [bp-8]	;i
$F728:
	cmp	WORD PTR [bp-8],448	;i
	jl	$JCC1083
	jmp	$FB730
$JCC1083:
; Line 151
; Line 152
	mov	bx,WORD PTR [bp-8]	;i
	shl	bx,1
	mov	WORD PTR _memtype[bx],0
; Line 153
	mov	ax,WORD PTR _walseg
	mov	bx,WORD PTR [bp-8]	;i
	shl	bx,1
	mov	WORD PTR _walseg[bx],ax
; Line 154
	jmp	$FC729
$FB730:
; Line 155
; Line 156
$I724:
	mov	WORD PTR [bp-30],0	;l
; Line 157
	mov	WORD PTR [bp-8],0	;i
	jmp	$F731
$FC732:
	inc	WORD PTR [bp-8]	;i
$F731:
	cmp	WORD PTR [bp-8],240	;i
	jl	$JCC1135
	jmp	$FB733
$JCC1135:
; Line 158
; Line 159
	mov	ax,WORD PTR [bp-30]	;l
	mov	bx,WORD PTR [bp-8]	;i
	shl	bx,1
	mov	WORD PTR _times90[bx],ax
; Line 160
	add	WORD PTR [bp-30],90	;l
; Line 161
	jmp	$FC732
$FB733:
; Line 162
	mov	WORD PTR _less64inc,16384
; Line 163
	mov	WORD PTR [bp-8],1	;i
	jmp	$F734
$FC735:
	inc	WORD PTR [bp-8]	;i
$F734:
	cmp	WORD PTR [bp-8],64	;i
	jl	$JCC1180
	jmp	$FB736
$JCC1180:
; Line 164
	mov	ax,16384
	cwd	
	idiv	WORD PTR [bp-8]	;i
	mov	bx,WORD PTR [bp-8]	;i
	shl	bx,1
	mov	WORD PTR _less64inc[bx],ax
	jmp	$FC735
$FB736:
; Line 165
	mov	WORD PTR _speed,240
; Line 166
	mov	WORD PTR [bp-8],0	;i
	jmp	$F737
$FC738:
	inc	WORD PTR [bp-8]	;i
$F737:
	cmp	WORD PTR [bp-8],256	;i
	jl	$JCC1226
	jmp	$FB739
$JCC1226:
; Line 167
	mov	bx,WORD PTR [bp-8]	;i
	mov	BYTE PTR _keystatus[bx],0
	jmp	$FC738
$FB739:
; Line 168
	mov	ax,9
	push	ax
	call	__dos_getvect
	add	sp,2
	mov	WORD PTR _oldkeyhandler,ax
	mov	WORD PTR _oldkeyhandler+2,dx
; Line 169
	call	__disable
	mov	ax,OFFSET _keyhandler
	mov	dx,SEG _keyhandler
	push	dx
	push	ax
	mov	ax,9
	push	ax
	call	__dos_setvect
	add	sp,6
	call	__enable
; Line 170
	mov	ax,0
	push	ax
	call	__dos_getvect
	add	sp,2
	mov	WORD PTR _olddivzerohandler,ax
	mov	WORD PTR _olddivzerohandler+2,dx
; Line 171
	call	__disable
	mov	ax,OFFSET _divzerohandler
	mov	dx,SEG _divzerohandler
	push	dx
	push	ax
	mov	ax,0
	push	ax
	call	__dos_setvect
	add	sp,6
	call	__enable
; Line 172
	mov	ax,8
	push	ax
	call	__dos_getvect
	add	sp,2
	mov	WORD PTR _oldhand,ax
	mov	WORD PTR _oldhand+2,dx
; Line 173
	mov	WORD PTR _saidwelcome,0
; Line 174
	mov	ax,OFFSET DGROUP:$SG740
	push	ax
	call	_loadmusic
	add	sp,2
; Line 175
	mov	WORD PTR _clockspeed,0
; Line 176
	mov	WORD PTR _slottime,0
; Line 177
	mov	WORD PTR _owecoins,0
; Line 178
	mov	WORD PTR _owecoinwait,0
; Line 179
	mov	WORD PTR _slotpos,0
; Line 180
	mov	WORD PTR _slotpos+2,0
; Line 181
	mov	WORD PTR _slotpos+4,0
; Line 182
	mov	WORD PTR _clockspeed,0
; Line 183
	mov	WORD PTR _skilevel,0
; Line 184
	call	_musicon
; Line 185
	mov	ax,0
	push	ax
	call	_fade
	add	sp,2
; Line 186
	mov	ax,0
	push	ax
	call	_kgif
	add	sp,2
; Line 187
	call	_loadwalls
; Line 188
	mov	ax,1
	push	ax
	call	_kgif
	add	sp,2
; Line 189
	mov	ax,12
	push	ax
	mov	ax,980
	push	ax
	call	_outp
	add	sp,4
	mov	ax,0
	push	ax
	mov	ax,981
	push	ax
	call	_outp
	add	sp,4
; Line 190
	mov	ax,13
	push	ax
	mov	ax,980
	push	ax
	call	_outp
	add	sp,4
	mov	ax,5
	push	ax
	mov	ax,981
	push	ax
	call	_outp
	add	sp,4
; Line 191
; Line 193
	mov	dx,986
; Line 194
$retraceholdfadeinitsnotxmea741:
; Line 195
	in	al,dx
; Line 196
	test	al,8
; Line 197
	je	$retraceholdfadeinitsnotxmea741
; Line 198
$retraceholdfadeinitsnotxmeb742:
; Line 199
	in	al,dx
; Line 200
	test	al,8
; Line 201
	jne	$retraceholdfadeinitsnotxmeb742
; Line 202
; Line 203
	mov	ax,63
	push	ax
	call	_fade
	add	sp,2
; Line 204
	cmp	WORD PTR _moustat,0
	je	$JCC1531
	jmp	$I743
$JCC1531:
; Line 205
	call	_setupmouse
	mov	WORD PTR _moustat,ax
; Line 206
$I743:
	mov	ax,WORD PTR _clockspeed
	mov	WORD PTR [bp-32],ax	;oclockspeed
; Line 207
$FC745:
	cmp	BYTE PTR _keystatus+1,0
	je	$JCC1553
	jmp	$FB746
$JCC1553:
	cmp	BYTE PTR _keystatus+57,0
	je	$JCC1563
	jmp	$FB746
$JCC1563:
	cmp	BYTE PTR _keystatus+28,0
	je	$JCC1573
	jmp	$FB746
$JCC1573:
	cmp	WORD PTR _bstatus,0
	je	$JCC1583
	jmp	$FB746
$JCC1583:
	mov	ax,WORD PTR [bp-32]	;oclockspeed
	add	ax,960
	cmp	ax,WORD PTR _clockspeed
	jg	$JCC1598
	jmp	$FB746
$JCC1598:
; Line 208
; Line 209
	mov	WORD PTR _bstatus,0
; Line 210
	cmp	WORD PTR _moustat,0
	je	$JCC1614
	jmp	$I747
$JCC1614:
; Line 211
; Line 213
	mov	ax,5
; Line 214
	int	51
; Line 215
	mov	WORD PTR _bstatus,ax
; Line 216
; Line 217
$I747:
	cmp	WORD PTR _joystat,0
	je	$JCC1632
	jmp	$I748
$JCC1632:
; Line 218
; Line 220
	mov	dx,513
; Line 221
	in	al,dx
; Line 222
	and	ax,48
; Line 223
	xor	al,48
; Line 224
	or	WORD PTR _bstatus,ax
; Line 225
; Line 226
$I748:
	jmp	$FC745
$FB746:
; Line 227
	mov	ax,0
	push	ax
	call	_fade
	add	sp,2
; Line 228
	mov	ax,2
	push	ax
	call	_kgif
	add	sp,2
; Line 229
	mov	WORD PTR [bp-30],25200	;l
; Line 230
	mov	WORD PTR [bp-8],1	;i
; Line 231
	mov	ax,12
	push	ax
	mov	ax,980
	push	ax
	call	_outp
	add	sp,4
	mov	al,BYTE PTR [bp-29]
	sub	ah,ah
	push	ax
	mov	ax,981
	push	ax
	call	_outp
	add	sp,4
; Line 232
	mov	ax,13
	push	ax
	mov	ax,980
	push	ax
	call	_outp
	add	sp,4
	mov	al,BYTE PTR [bp-30]	;l
	sub	ah,ah
	push	ax
	mov	ax,981
	push	ax
	call	_outp
	add	sp,4
; Line 233
	mov	ax,63
	push	ax
	call	_fade
	add	sp,2
; Line 234
$FC750:
	cmp	BYTE PTR _keystatus+1,0
	je	$JCC1758
	jmp	$FB751
$JCC1758:
	cmp	BYTE PTR _keystatus+57,0
	je	$JCC1768
	jmp	$FB751
$JCC1768:
	cmp	BYTE PTR _keystatus+28,0
	je	$JCC1778
	jmp	$FB751
$JCC1778:
	cmp	WORD PTR _bstatus,0
	je	$JCC1788
	jmp	$FB751
$JCC1788:
	cmp	WORD PTR _clockspeed,7680
	jl	$JCC1799
	jmp	$FB751
$JCC1799:
; Line 235
; Line 236
	cmp	WORD PTR [bp-8],0	;i
	je	$JCC1808
	jmp	$I752
$JCC1808:
; Line 237
; Line 238
	add	WORD PTR [bp-30],90	;l
; Line 239
	cmp	WORD PTR [bp-30],25200	;l
	jae	$JCC1822
	jmp	$I753
$JCC1822:
; Line 240
; Line 241
	mov	WORD PTR [bp-8],1	;i
; Line 242
	mov	WORD PTR [bp-30],25200	;l
; Line 243
; Line 244
$I753:
; Line 245
$I752:
	cmp	WORD PTR [bp-8],1	;i
	je	$JCC1841
	jmp	$I754
$JCC1841:
; Line 246
; Line 247
	sub	WORD PTR [bp-30],90	;l
; Line 248
	cmp	WORD PTR [bp-30],-32768	;l
	ja	$JCC1855
	jmp	$I755
$JCC1855:
; Line 249
; Line 250
	mov	WORD PTR [bp-30],0	;l
; Line 251
	mov	WORD PTR [bp-8],0	;i
; Line 252
; Line 253
$I755:
; Line 254
$I754:
; Line 256
	mov	dx,986
; Line 257
$retraceholdfadeinita756:
; Line 258
	in	al,dx
; Line 259
	test	al,8
; Line 260
	je	$retraceholdfadeinita756
; Line 261
$retraceholdfadeinitb757:
; Line 262
	in	al,dx
; Line 263
	test	al,8
; Line 264
	jne	$retraceholdfadeinitb757
; Line 265
	mov	dx,986
; Line 266
$retraceholdfadeinitc758:
; Line 267
	in	al,dx
; Line 268
	test	al,8
; Line 269
	je	$retraceholdfadeinitc758
; Line 270
$retraceholdfadeinitd759:
; Line 271
	in	al,dx
; Line 272
	test	al,8
; Line 273
	jne	$retraceholdfadeinitd759
; Line 274
$retraceholdfadeinite760:
; Line 275
	in	al,dx
; Line 276
	test	al,8
; Line 277
	je	$retraceholdfadeinite760
; Line 278
$retraceholdfadeinitf761:
; Line 279
	in	al,dx
; Line 280
	test	al,8
; Line 281
	jne	$retraceholdfadeinitf761
; Line 282
; Line 283
	mov	ax,12
	push	ax
	mov	ax,980
	push	ax
	call	_outp
	add	sp,4
	mov	al,BYTE PTR [bp-29]
	sub	ah,ah
	push	ax
	mov	ax,981
	push	ax
	call	_outp
	add	sp,4
; Line 284
	mov	ax,13
	push	ax
	mov	ax,980
	push	ax
	call	_outp
	add	sp,4
	mov	al,BYTE PTR [bp-30]	;l
	sub	ah,ah
	push	ax
	mov	ax,981
	push	ax
	call	_outp
	add	sp,4
; Line 285
	mov	WORD PTR _bstatus,0
; Line 286
	cmp	WORD PTR _moustat,0
	je	$JCC1977
	jmp	$I762
$JCC1977:
; Line 287
; Line 289
	mov	ax,5
; Line 290
	int	51
; Line 291
	mov	WORD PTR _bstatus,ax
; Line 292
; Line 293
$I762:
	cmp	WORD PTR _joystat,0
	je	$JCC1995
	jmp	$I763
$JCC1995:
; Line 294
; Line 296
	mov	dx,513
; Line 297
	in	al,dx
; Line 298
	and	ax,48
; Line 299
	xor	al,48
; Line 300
	or	WORD PTR _bstatus,ax
; Line 301
; Line 302
$I763:
	jmp	$FC750
$FB751:
; Line 303
	mov	WORD PTR [bp-8],63	;i
	jmp	$F764
$FC765:
	sub	WORD PTR [bp-8],4	;i
$F764:
	cmp	WORD PTR [bp-8],0	;i
	jge	$JCC2032
	jmp	$FB766
$JCC2032:
; Line 304
; Line 305
; Line 307
	mov	dx,986
; Line 308
$retraceholdfade9767:
; Line 309
	in	al,dx
; Line 310
	test	al,8
; Line 311
	je	$retraceholdfade9767
; Line 312
$retraceholdfade10768:
; Line 313
	in	al,dx
; Line 314
	test	al,8
; Line 315
	jne	$retraceholdfade10768
; Line 316
; Line 317
	mov	ax,WORD PTR [bp-8]	;i
	add	ax,64
	push	ax
	call	_fade
	add	sp,2
; Line 318
	jmp	$FC765
$FB766:
; Line 319
	mov	WORD PTR [bp-12],0	;k
; Line 320
	mov	WORD PTR [bp-8],0	;i
	jmp	$F769
$FC770:
	inc	WORD PTR [bp-8]	;i
$F769:
	cmp	WORD PTR [bp-8],16	;i
	jl	$JCC2086
	jmp	$FB771
$JCC2086:
; Line 321
	mov	WORD PTR [bp-10],1	;j
	jmp	$F772
$FC773:
	inc	WORD PTR [bp-10]	;j
$F772:
	cmp	WORD PTR [bp-10],17	;j
	jl	$JCC2106
	jmp	$FB774
$JCC2106:
; Line 322
; Line 323
	mov	bx,WORD PTR [bp-8]	;i
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	mov	al,BYTE PTR _paldef[bx]
	sub	ah,ah
	imul	WORD PTR [bp-10]	;j
	mov	cx,17
	cwd	
	idiv	cx
	mov	bx,WORD PTR [bp-12]	;k
	mov	BYTE PTR _palette[bx],al
	inc	WORD PTR [bp-12]	;k
; Line 324
	mov	bx,WORD PTR [bp-8]	;i
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	mov	al,BYTE PTR _paldef[bx+1]
	sub	ah,ah
	imul	WORD PTR [bp-10]	;j
	cwd	
	idiv	cx
	mov	bx,WORD PTR [bp-12]	;k
	mov	BYTE PTR _palette[bx],al
	inc	WORD PTR [bp-12]	;k
; Line 325
	mov	bx,WORD PTR [bp-8]	;i
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	mov	al,BYTE PTR _paldef[bx+2]
	sub	ah,ah
	imul	WORD PTR [bp-10]	;j
	cwd	
	idiv	cx
	mov	bx,WORD PTR [bp-12]	;k
	mov	BYTE PTR _palette[bx],al
	inc	WORD PTR [bp-12]	;k
; Line 326
	jmp	$FC773
$FB774:
	jmp	$FC770
$FB771:
; Line 327
	mov	WORD PTR _lastunlock,1
; Line 328
	mov	WORD PTR _lastshoot,1
; Line 329
	mov	WORD PTR _lastbarchange,1
	mov	WORD PTR _lastbarchange+2,0
; Line 330
	mov	WORD PTR _cheatenable,0
; Line 331
	mov	BYTE PTR _hiscorenamstat,0
; Line 332
	mov	ax,256
	push	ax
	mov	ax,-32766
	push	ax
	mov	ax,OFFSET DGROUP:$SG776
	push	ax
	call	_open
	add	sp,6
	mov	WORD PTR [bp-8],ax	;i
	dec	ax
	jne	$JCC2270
	jmp	$I775
$JCC2270:
; Line 333
; Line 334
	mov	ax,120
	push	ax
	mov	ax,OFFSET _boleng
	push	ax
	push	WORD PTR [bp-8]	;i
	call	_read
	add	sp,6
; Line 335
	mov	WORD PTR _numboards,30
; Line 336
	mov	ax,WORD PTR _boleng+80
	or	ax,WORD PTR _boleng+82
	cmp	ax,0
	je	$JCC2308
	jmp	$I777
$JCC2308:
; Line 337
	mov	WORD PTR _numboards,20
; Line 338
$I777:
	mov	ax,WORD PTR _boleng+40
	or	ax,WORD PTR _boleng+42
	cmp	ax,0
	je	$JCC2329
	jmp	$I778
$JCC2329:
; Line 339
	mov	WORD PTR _numboards,10
; Line 340
$I778:
	push	WORD PTR [bp-8]	;i
	call	_close
	add	sp,2
; Line 341
; Line 342
$I775:
	call	_musicoff
; Line 343
$EX676:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_initialize	ENDP
_TEXT	ENDS
END
