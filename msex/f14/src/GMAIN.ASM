;	Static Name Aliases
;
	TITLE   C:\GMAIN.C
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
PUBLIC  _ExitCode
PUBLIC  _ExitErrorCode
PUBLIC  _DisplayFrame
PUBLIC  _F14SNUM
PUBLIC  _F14SCNUM
PUBLIC  _F14CNUM
PUBLIC  _F14SNAME
PUBLIC  _F14SPER
PUBLIC  _F14VNUM
PUBLIC  _DifficultyLevel
EXTRN	__acrtused:ABS
EXTRN	_LocalCmds:NEAR
EXTRN	_GenDsp:NEAR
EXTRN	_DoCockpitDisplays:NEAR
EXTRN	_Messages:NEAR
EXTRN	_ProcessInputs:NEAR
EXTRN	_FLIGHT:NEAR
EXTRN	_save_video_state:NEAR
EXTRN	_Stealth:NEAR
EXTRN	_set_ctrl_b:FAR
EXTRN	_TurnOnGraphicsMode:FAR
EXTRN	_DoPlayerOnTheCat:NEAR
EXTRN	_NewEMSFunction:NEAR
EXTRN	_reset_ctrl_b:FAR
EXTRN	_AWG9:NEAR
EXTRN	_mclear_screen:NEAR
EXTRN	_TEWS_SYS:NEAR
EXTRN	_mprintf:NEAR
EXTRN	_LoadOverlay:FAR
EXTRN	_Flip:NEAR
EXTRN	_InitOptions:NEAR
EXTRN	_UnInitSpeech:NEAR
EXTRN	_printf:NEAR
EXTRN	_InitOverlay:FAR
EXTRN	_DumpLogFile:NEAR
EXTRN	_LoadTheWorld:NEAR
EXTRN	_InitSound:NEAR
EXTRN	_GetRidOfKeyJoy:NEAR
EXTRN	_InitGraph:NEAR
EXTRN	_GetJoyConfig:NEAR
EXTRN	_SndShutdown:FAR
EXTRN	_InitSpeech:NEAR
EXTRN	_Init3DPlanes:NEAR
EXTRN	_InitLogFile:NEAR
EXTRN	_LoadSpecialObjects:NEAR
EXTRN	_ConfigCrts:NEAR
EXTRN	_LoadClouds:NEAR
EXTRN	_InitCarrier:NEAR
EXTRN	_AllocGraphicPage:FAR
EXTRN	_LoadEMSPicFile:NEAR
EXTRN	_LoadScottMission:NEAR
EXTRN	_InitStealth:NEAR
EXTRN	_LoadSprites:NEAR
EXTRN	_Init3DPal:NEAR
EXTRN	_InitFlir:NEAR
EXTRN	_ARMT_INIT:NEAR
EXTRN	_AWG9_INIT:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_PutNumLockBack:NEAR
EXTRN	_LoadPicture:NEAR
EXTRN	_FreeEMS:NEAR
EXTRN	_restore_video_state:NEAR
EXTRN	_LoadGroundObjects:NEAR
EXTRN	_Exit:NEAR
EXTRN	_ScreenOff:FAR
EXTRN	_LoadPicToPal:NEAR
EXTRN	_UpdatePalBuf:NEAR
EXTRN	_ScreenOn:FAR
EXTRN	_InitSpecialPal:NEAR
EXTRN	_Release3DMemory:NEAR
EXTRN	_UpdatePalette:NEAR
EXTRN	_SetGraphicPage:FAR
EXTRN	_BuildCockpitSprites:NEAR
EXTRN	_fclose:NEAR
EXTRN	_ClearPage:FAR
EXTRN	_LoadPalToPal:NEAR
EXTRN	_MouseON:FAR
EXTRN	_MouseOFF:FAR
EXTRN	_SetJoysticks:NEAR
EXTRN	_ShowPage:FAR
EXTRN	_MouseHIDE:FAR
EXTRN	_KBInit:NEAR
EXTRN	_fopen:NEAR
EXTRN	_UpdateTime1:NEAR
EXTRN	_UpdateTime2:NEAR
EXTRN	_TakeInputs:NEAR
EXTRN	_fread:NEAR
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Status:WORD
EXTRN	_Rp2:WORD
EXTRN	_BEND:BYTE
EXTRN	_GRPAGE0:BYTE
EXTRN	_Speedy:WORD
EXTRN	_CockpitFiles:BYTE
EXTRN	_RIO_ASSIST:WORD
EXTRN	_StickType:WORD
EXTRN	_View:WORD
_BSS      SEGMENT
COMM NEAR	_Rp:	BYTE:	 2
_BSS      ENDS
EXTRN	_AWG9_REALITY_LEVEL:WORD
_BSS      SEGMENT
COMM NEAR	__training:	BYTE:	 2
COMM NEAR	_ConfigData:	BYTE:	 28
COMM NEAR	_SndData:	BYTE:	 14
_BSS      ENDS
_DATA      SEGMENT
$SG757	DB	'F14R',  00H
$SG759	DB	'Quality Assurance',  00H
$SG761	DB	'Vaughn Thomas',  00H
$SG763	DB	'1.18',  00H
$SG775	DB	'Fonts.F15',  00H
$SG776	DB	'Mgraphic.exe',  00H
$SG779	DB	'****  DEBUGGING INFORMATION IS ON!!! - NOT FOR QA ****',  00H
	ORG	$+156
$SG808	DB	'gm-load.PIC',  00H
$SG816	DB	0aH, 'Program Termination:  ',  00H
$SG822	DB	'Not Enough Memory to load objects.',  0aH,  00H
$SG824	DB	'Not Enough Memory to Load Planes Objects.',  0aH,  00H
$SG826	DB	'Not Enough Memory to Load Missile Objects.',  0aH,  00H
$SG828	DB	'Not Enough Memory to Load Radar Objects.',  0aH,  00H
$SG830	DB	'F14PD01.DAT File Not Found.',  0aH,  00H
$SG832	DB	'F14RD01.DAT File Not Found.',  0aH,  00H
$SG834	DB	'F14MD01.DAT File Not Found.',  0aH,  00H
$SG836	DB	'MISSION.F14 File Not Found.',  0aH,  00H
$SG838	DB	'3D Object Not Found.',  0aH,  00H
$SG847	DB	'NC07F.WLD',  00H
$SG849	DB	'MEDO6.WLD',  00H
$SG851	DB	'USA08.WLD',  00H
$SG853	DB	'USA08.WLD',  00H
$SG859	DB	'EXPAGE1.pic',  00H
$SG860	DB	'EXPAGE2.pic',  00H
$SG861	DB	'EXPAGE3.pic',  00H
$SG862	DB	'EXPAGE4.pic',  00H
$SG863	DB	'EXPAGE5.pic',  00H
$SG865	DB	'F14SPR3.PIC',  00H
$SG866	DB	'F14MISC3.PIC',  00H
$SG868	DB	'RIO-1.PIC',  00H
$SG869	DB	'RIO-2.PIC',  00H
$SG873	DB	'F14ORG01.PIC',  00H
$SG880	DB	'rb',  00H
$SG881	DB	'config.f14',  00H
$SG885	DB	'rb',  00H
$SG886	DB	'config.snd',  00H
	ORG	$-681
_ExitCode	DB	00H
	ORG	$+1
_ExitErrorCode	DW	00H
_DisplayFrame	DW	01H
_F14SNUM	DW	01484H
	DW	012H
_F14SCNUM	DW	09ddH
	DW	012H
_F14CNUM	DW	DGROUP:$SG757
 	DB	8 DUP(0)

_F14SNAME	DW	DGROUP:$SG759
 	DB	58 DUP(0)

_F14SPER	DW	DGROUP:$SG761
 	DB	58 DUP(0)

_F14VNUM	DW	DGROUP:$SG763
 	DB	8 DUP(0)

_DifficultyLevel	DW	00H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 11
; Line 12
; Line 13
; Line 14
; Line 15
; Line 16
; Line 17
; Line 18
; Line 19
; Line 20
; Line 21
; Line 22
; Line 23
; Line 24
; Line 65
	PUBLIC	_main
_main	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	z = -2
;	envp = 8
;	argv = 6
;	argc = 4
; Line 71
	call	_save_video_state
; Line 72
	mov	ax,OFFSET DGROUP:$SG775
	push	ax
	mov	ax,OFFSET DGROUP:$SG776
	push	ax
	call	FAR PTR _LoadOverlay
	add	sp,4
	push	ax
	call	FAR PTR _InitOverlay
	add	sp,2
; Line 73
	sub	ax,ax
	push	ax
	call	FAR PTR _TurnOnGraphicsMode
	add	sp,2
; Line 75
	call	_mclear_screen
; Line 76
	mov	ax,OFFSET DGROUP:$SG779
	push	ax
	call	_mprintf
	add	sp,2
; Line 78
	call	_InitOptions
; Line 79
	call	_LoadSoundConfig
; Line 80
	call	_InitSound
; Line 81
	call	_InitGraphicPages
; Line 82
	mov	ax,77
	push	ax
	call	_InitGraph
	add	sp,2
; Line 84
	call	_WaitScreen
; Line 86
	call	FAR PTR _set_ctrl_b
; Line 87
	call	FAR PTR _MouseON
; Line 89
	call	_GetJoyConfig
; Line 90
	call	_LoadConfig
; Line 91
	call	_LoadFiles
; Line 92
	call	_InitSpeech
; Line 93
	call	_InitLogFile
; Line 95
	call	_ConfigCrts
; Line 96
	call	_InitCarrier
; Line 97
	call	_LoadScottMission
; Line 98
	call	_InitStealth
; Line 100
	call	FAR PTR _ScreenOff
; Line 101
	sub	ax,ax
	push	ax
	push	ax
	call	FAR PTR _ClearPage
	add	sp,4
; Line 103
	call	_LoadSprites
; Line 104
	call	_Init3DPal
; Line 105
	call	_InitDamnPalettes
; Line 106
	call	_InitFlir
; Line 109
	call	_ARMT_INIT
; Line 110
	call	_AWG9_INIT
; Line 112
	call	_MainGameLoop
; Line 114
	call	_PutNumLockBack
; Line 116
	call	FAR PTR _MouseOFF
; Line 117
	call	FAR PTR _reset_ctrl_b
; Line 118
	call	_FreeEMS
; Line 119
	call	_restore_video_state
; Line 120
	call	_DisplayErrorMessages
; Line 121
	mov	al,BYTE PTR _ExitCode
	sub	ah,ah
	push	ax
	call	_Exit
	add	sp,2
; Line 122
	mov	sp,bp
	pop	bp
	ret	
	nop	

_main	ENDP
; Line 126
	PUBLIC	_WaitScreen
_WaitScreen	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 127
	mov	ax,OFFSET DGROUP:$SG808
	push	ax
	mov	ax,1
	push	ax
	call	_LoadPicture
	add	sp,4
; Line 128
	mov	ax,1
	push	ax
	call	FAR PTR _ShowPage
	add	sp,2
; Line 129
	call	FAR PTR _ScreenOn
; Line 130
	ret	
	nop	

_WaitScreen	ENDP
; Line 134
	PUBLIC	_InitAbort
_InitAbort	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 135
	call	_Release3DMemory
; Line 136
	call	FAR PTR _MouseOFF
; Line 137
	call	FAR PTR _reset_ctrl_b
; Line 138
	call	_FreeEMS
; Line 139
	call	_restore_video_state
; Line 141
	call	FAR PTR _SndShutdown
; Line 143
	call	_DisplayErrorMessages
; Line 144
	mov	al,BYTE PTR _ExitCode
	sub	ah,ah
	push	ax
	call	_Exit
	add	sp,2
; Line 145
	ret	
	nop	

_InitAbort	ENDP
; Line 149
	PUBLIC	_InitWeather
_InitWeather	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 150
	ret	

_InitWeather	ENDP
; Line 154
	PUBLIC	_DisplayErrorMessages
_DisplayErrorMessages	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 155
	cmp	WORD PTR _ExitErrorCode,0
	je	$SB818
; Line 156
	mov	ax,OFFSET DGROUP:$SG816
	push	ax
	call	_printf
	add	sp,2
; Line 157
	mov	ax,WORD PTR _ExitErrorCode
	cmp	ax,-40
	je	$SC829
	jg	$L20001
	sub	ax,-60
	je	$SC837
	sub	ax,14
	je	$SC835
	dec	ax
	dec	ax
	je	$SC833
	dec	ax
	dec	ax
	je	$SC831
	ret	
; Line 158
	nop	
$SC821:
; Line 159
	mov	ax,OFFSET DGROUP:$SG822
$L20002:
	push	ax
	call	_printf
	add	sp,2
; Line 160
	ret	
; Line 161
	nop	
$SC823:
; Line 162
	mov	ax,OFFSET DGROUP:$SG824
	jmp	SHORT $L20002
; Line 164
	nop	
$SC825:
; Line 165
	mov	ax,OFFSET DGROUP:$SG826
	jmp	SHORT $L20002
; Line 167
	nop	
$SC827:
; Line 168
	mov	ax,OFFSET DGROUP:$SG828
	jmp	SHORT $L20002
; Line 170
	nop	
$SC829:
; Line 171
	mov	ax,OFFSET DGROUP:$SG830
	jmp	SHORT $L20002
; Line 173
	nop	
$SC831:
; Line 174
	mov	ax,OFFSET DGROUP:$SG832
	jmp	SHORT $L20002
; Line 176
	nop	
$SC833:
; Line 177
	mov	ax,OFFSET DGROUP:$SG834
	jmp	SHORT $L20002
; Line 179
	nop	
$SC835:
; Line 180
	mov	ax,OFFSET DGROUP:$SG836
	jmp	SHORT $L20002
; Line 182
	nop	
$SC837:
; Line 183
	mov	ax,OFFSET DGROUP:$SG838
	jmp	SHORT $L20002
	nop	
$L20001:
	sub	ax,-16
	je	$SC827
	dec	ax
	dec	ax
	je	$SC825
	dec	ax
	dec	ax
	je	$SC823
	dec	ax
	dec	ax
	je	$SC821
$SB818:
; Line 186
; Line 187
	ret	

_DisplayErrorMessages	ENDP
; Line 191
	PUBLIC	_LoadFiles
_LoadFiles	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 192
	call	_NewEMSFunction
; Line 194
	mov	ax,WORD PTR _ConfigData+26
	or	ax,ax
	je	$SC845
	dec	ax
	je	$SC848
	dec	ax
	je	$SC850
; Line 205
	mov	ax,OFFSET DGROUP:$SG853
	jmp	SHORT $L20003
; Line 195
$SC845:
; Line 196
	mov	ax,OFFSET DGROUP:$SG847
$L20003:
	push	ax
	call	_LoadTheWorld
	add	sp,2
; Line 197
	jmp	SHORT $SB842
; Line 198
$SC848:
; Line 199
	mov	ax,OFFSET DGROUP:$SG849
	jmp	SHORT $L20003
; Line 201
	nop	
$SC850:
; Line 202
	mov	ax,OFFSET DGROUP:$SG851
	jmp	SHORT $L20003
; Line 204
	nop	
$SB842:
; Line 209
	call	_Init3DPlanes
; Line 210
	call	_LoadSpecialObjects
; Line 211
	call	_LoadClouds
; Line 214
	mov	ax,21
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	mov	cx,OFFSET DGROUP:$SG859
	push	cx
	call	_LoadEMSPicFile
	add	sp,8
	or	ax,ax
	je	$I858
; Line 215
	sub	ax,ax
	push	ax
	mov	cx,1
	push	cx
	push	ax
	mov	cx,OFFSET DGROUP:$SG860
	push	cx
	call	_LoadEMSPicFile
	add	sp,8
; Line 216
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	push	ax
	mov	cx,OFFSET DGROUP:$SG861
	push	cx
	call	_LoadEMSPicFile
	add	sp,8
; Line 217
	sub	ax,ax
	push	ax
	mov	cx,3
	push	cx
	push	ax
	mov	cx,OFFSET DGROUP:$SG862
	push	cx
	call	_LoadEMSPicFile
	add	sp,8
; Line 218
	sub	ax,ax
	push	ax
	mov	cx,4
	push	cx
	push	ax
	mov	ax,OFFSET DGROUP:$SG863
	push	ax
	call	_LoadEMSPicFile
	add	sp,8
; Line 219
; Line 222
$I858:
	mov	ax,8
	push	ax
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	mov	dx,OFFSET DGROUP:$SG865
	push	dx
	call	_LoadEMSPicFile
	add	sp,8
	or	ax,ax
	je	$I864
; Line 223
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG866
	push	ax
	call	_LoadEMSPicFile
	add	sp,8
; Line 224
; Line 226
$I864:
	mov	ax,8
	push	ax
	sub	ax,ax
	push	ax
	mov	cx,3
	push	cx
	mov	dx,OFFSET DGROUP:$SG868
	push	dx
	call	_LoadEMSPicFile
	add	sp,8
	or	ax,ax
	je	$I867
; Line 227
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,3
	push	ax
	mov	ax,OFFSET DGROUP:$SG869
	push	ax
	call	_LoadEMSPicFile
	add	sp,8
; Line 228
; Line 230
$I867:
	jmp	_LoadGroundObjects
; Line 231

_LoadFiles	ENDP
; Line 235
	PUBLIC	_InitDamnPalettes
_InitDamnPalettes	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,774
	call	__aNchkstk
;	PalPkt = -774
; Line 238
	lea	ax,WORD PTR [bp-774]	;PalPkt
	push	ax
	mov	cx,OFFSET DGROUP:$SG873
	push	cx
	call	_LoadPalToPal
	add	sp,4
; Line 239
	lea	ax,WORD PTR [bp-774]	;PalPkt
	push	ax
	call	_UpdatePalBuf
	add	sp,2
; Line 242
	mov	WORD PTR _View,0
; Line 243
	lea	ax,WORD PTR [bp-774]	;PalPkt
	push	ax
	push	WORD PTR _CockpitFiles
	mov	cx,1
	push	cx
	call	_LoadPicToPal
	add	sp,6
; Line 244
	lea	ax,WORD PTR [bp-774]	;PalPkt
	push	ax
	call	_UpdatePalBuf
	add	sp,2
; Line 246
	call	_InitSpecialPal
; Line 248
	call	_UpdatePalette
; Line 249
	mov	ax,1
	push	ax
	call	FAR PTR _ShowPage
	add	sp,2
; Line 251
	call	_BuildCockpitSprites
; Line 252
	mov	sp,bp
	pop	bp
	ret	

_InitDamnPalettes	ENDP
; Line 257
	PUBLIC	_LoadConfig
_LoadConfig	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	f = -2
; Line 261
	mov	ax,OFFSET DGROUP:$SG880
	push	ax
	mov	ax,OFFSET DGROUP:$SG881
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR [bp-2],ax	;f
	push	ax
	mov	cx,1
	push	cx
	mov	dx,2
	push	dx
	mov	dx,OFFSET DGROUP:__training
	push	dx
	call	_fread
	add	sp,8
; Line 262
	push	WORD PTR [bp-2]	;f
	mov	ax,1
	push	ax
	mov	ax,28
	push	ax
	mov	ax,OFFSET DGROUP:_ConfigData
	push	ax
	call	_fread
	add	sp,8
; Line 263
	push	WORD PTR [bp-2]	;f
	call	_fclose
	add	sp,2
; Line 265
	mov	ax,WORD PTR _ConfigData+16
	mov	WORD PTR _AWG9_REALITY_LEVEL,ax
; Line 266
	mov	ax,WORD PTR _ConfigData+10
	mov	WORD PTR _RIO_ASSIST,ax
; Line 269
	mov	ax,2
	mov	WORD PTR _AWG9_REALITY_LEVEL,ax
	mov	WORD PTR _RIO_ASSIST,ax
; Line 276
	cmp	WORD PTR __training,0
	je	$I882
	xor	BYTE PTR _Status+1,16
; Line 280
$I882:
	mov	sp,bp
	pop	bp
	ret	

_LoadConfig	ENDP
; Line 285
	PUBLIC	_LoadSoundConfig
_LoadSoundConfig	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	f = -2
; Line 289
	mov	ax,OFFSET DGROUP:$SG885
	push	ax
	mov	ax,OFFSET DGROUP:$SG886
	push	ax
	call	_fopen
	add	sp,4
	mov	WORD PTR [bp-2],ax	;f
	push	ax
	mov	cx,1
	push	cx
	mov	cx,14
	push	cx
	mov	cx,OFFSET DGROUP:_SndData
	push	cx
	call	_fread
	add	sp,8
; Line 290
	push	WORD PTR [bp-2]	;f
	call	_fclose
; Line 291
	mov	sp,bp
	pop	bp
	ret	
	nop	

_LoadSoundConfig	ENDP
; Line 295
	PUBLIC	_MainGameLoop
_MainGameLoop	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
; Line 297
	push	WORD PTR _StickType
	call	_SetJoysticks
	add	sp,2
; Line 298
	call	_KBInit
; Line 300
$D890:
; Line 301
	call	_UpdateTime1
; Line 302
	call	_UpdateTime2
; Line 304
	call	_TakeInputs
; Line 305
	call	_LocalCmds
; Line 307
	dec	WORD PTR _DisplayFrame
	jne	$I897
; Line 308
	call	_GenDsp
; Line 309
	call	_DoCockpitDisplays
; Line 310
	call	_Messages
; Line 311
; Line 313
$I897:
	call	_ProcessInputs
; Line 314
	call	_FLIGHT
; Line 316
	call	_Stealth
; Line 318
	call	_DoPlayerOnTheCat
; Line 320
	call	_AWG9
; Line 321
	call	_TEWS_SYS
; Line 322
	call	_UpdatePalette
; Line 324
	cmp	WORD PTR _DisplayFrame,0
	jne	$I907
; Line 325
	call	_Flip
; Line 326
	mov	ax,WORD PTR _Speedy
	mov	WORD PTR _DisplayFrame,ax
; Line 327
; Line 328
$I907:
	cmp	BYTE PTR _BEND,0
	je	$D890
; Line 330
	call	_Release3DMemory
; Line 332
	call	FAR PTR _MouseHIDE
; Line 333
	sub	ax,ax
	push	ax
	push	ax
	call	FAR PTR _ClearPage
	add	sp,4
; Line 334
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	call	FAR PTR _ClearPage
	add	sp,4
; Line 336
	call	FAR PTR _SndShutdown
; Line 337
	call	_UnInitSpeech
; Line 338
	call	_DumpLogFile
; Line 339
	call	_GetRidOfKeyJoy
; Line 340
	mov	sp,bp
	pop	bp
	ret	
	nop	

_MainGameLoop	ENDP
; Line 344
	PUBLIC	_InitGraphicPages
_InitGraphicPages	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 345
	sub	ax,ax
	push	ax
	call	FAR PTR _AllocGraphicPage
	add	sp,2
	mov	WORD PTR _GRPAGE0,ax
	push	ax
	sub	ax,ax
	push	ax
	call	FAR PTR _SetGraphicPage
	add	sp,4
; Line 346
	mov	ax,1
	push	ax
	call	FAR PTR _AllocGraphicPage
	add	sp,2
	mov	WORD PTR _GRPAGE0+2,ax
	push	ax
	mov	ax,1
	push	ax
	call	FAR PTR _SetGraphicPage
	add	sp,4
; Line 347
	mov	ax,2
	push	ax
	call	FAR PTR _AllocGraphicPage
	add	sp,2
	mov	WORD PTR _GRPAGE0+4,ax
	push	ax
	mov	ax,2
	push	ax
	call	FAR PTR _SetGraphicPage
	add	sp,4
; Line 348
	mov	ax,WORD PTR _Rp2
	mov	WORD PTR _Rp,ax
; Line 349
	ret	

_InitGraphicPages	ENDP
_TEXT	ENDS
END
