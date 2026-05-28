;	Static Name Aliases
;
;	$S935_CoolyKeys	EQU	CoolyKeys
;	$S936_CHKeys	EQU	CHKeys
;	$S962_OldMouseX	EQU	OldMouseX
;	$S963_OldMouseY	EQU	OldMouseY
;	$S964_WasInCrt	EQU	WasInCrt
;	$S965_lasttime	EQU	lasttime
	TITLE   C:\CMDS.C
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
PUBLIC  _SteadyHead
PUBLIC  _SteadyPitch
PUBLIC  _RUDDERVALS
PUBLIC  _FrontTopSpots
PUBLIC  _FrontLeftSpots
PUBLIC  _FrontRightSpots
PUBLIC  _BackTopSpots
PUBLIC  _BackBotSpots
PUBLIC  _BackLeftSpots
PUBLIC  _mapmode
PUBLIC  _PauseHit
PUBLIC  _TickDelay
PUBLIC  _KbSense
PUBLIC  _DBlaunch
PUBLIC  _ThrustChange
PUBLIC  _MouseCrtX
PUBLIC  _MouseCrtY
PUBLIC  _MouseDsp
PUBLIC  _ShowMouse
PUBLIC  _tempsound
PUBLIC  _tempsound2
EXTRN	_AWG9_LOCK:NEAR
EXTRN	_rng:NEAR
EXTRN	_ltoa:NEAR
EXTRN	_AWG9_MODE_BREAK:NEAR
EXTRN	_ReadJoy2:FAR
EXTRN	_CHANGE_NUM_BARS:NEAR
EXTRN	_SndSounds:FAR
EXTRN	_AWG9_EL:NEAR
EXTRN	_GETTIME:FAR
EXTRN	_Message:NEAR
EXTRN	_ARMT_MODE:NEAR
EXTRN	_RioMap:NEAR
EXTRN	_AWG9_IFF:NEAR
EXTRN	_mprintf:NEAR
EXTRN	_AWG9_CHANGE_MODE:NEAR
EXTRN	_AvailSysMem:FAR
EXTRN	_OnTheDeck:NEAR
EXTRN	_AWG9_ACQ:NEAR
EXTRN	_Help:NEAR
EXTRN	_ReArmWingman:NEAR
EXTRN	_MouseSETUP:NEAR
EXTRN	_SlewOurWingmen:NEAR
EXTRN	_DesignateTIDTarg:NEAR
EXTRN	_SelectDesig:NEAR
EXTRN	__bios_keybrd:NEAR
EXTRN	_InitTWSData:NEAR
EXTRN	_JetisonSwitch:NEAR
EXTRN	_kbhit:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_ARMT_jettison_all:NEAR
EXTRN	_ChangeHUDFilter:NEAR
EXTRN	_LaunchAircraft:NEAR
EXTRN	_ZoomDisplay:NEAR
EXTRN	_getch:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_EasyLanding:NEAR
EXTRN	_strcat:NEAR
EXTRN	_UnZoomDisplay:NEAR
EXTRN	_ClearPage:FAR
EXTRN	_LookDown:NEAR
EXTRN	_ChangeWeather:NEAR
EXTRN	_MainMenu:NEAR
EXTRN	_UpdateOurWPS:NEAR
EXTRN	_ShowOurWPS:NEAR
EXTRN	_LogIt:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_AdjustSounds:NEAR
EXTRN	_EndGame:NEAR
EXTRN	_ChangeHUDColor:NEAR
EXTRN	_CheckPlaneLand:NEAR
EXTRN	_MouseSHOW:FAR
EXTRN	_AwacsPicture:NEAR
EXTRN	_MouseHIDE:FAR
EXTRN	_SetHook:NEAR
EXTRN	_TrimIt:NEAR
EXTRN	_abs:NEAR
EXTRN	_LookUp:NEAR
EXTRN	_docannon:NEAR
EXTRN	_MouseHITS:FAR
EXTRN	_ToggleAutoTrim:NEAR
EXTRN	_firemissile:NEAR
EXTRN	_inp:NEAR
EXTRN	_AWG9_POWERUP:NEAR
EXTRN	_dropdecoy:NEAR
EXTRN	_NewMissileView:NEAR
EXTRN	_ChangeModerateScan:NEAR
EXTRN	_Sound:NEAR
EXTRN	_NewLockView:NEAR
EXTRN	_CHANGE_AZIMUTH:NEAR
EXTRN	_NewTacView:NEAR
EXTRN	_ChangeSRCHMode:NEAR
EXTRN	_AA_MODE:NEAR
EXTRN	_EMSpages:NEAR
EXTRN	_itoa:NEAR
EXTRN	_ThrustI:WORD
EXTRN	_ejectX:WORD
_BSS      SEGMENT
COMM NEAR	_KEYPRINT:	BYTE:	 2
_BSS      ENDS
EXTRN	_ejectY:WORD
_BSS      SEGMENT
COMM NEAR	_KEYPRINT2:	BYTE:	 2
_BSS      ENDS
EXTRN	_ejectZ:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
COMM NEAR	_mS1n:	BYTE:	 1
_BSS      ENDS
EXTRN	_Txt:BYTE
EXTRN	_Knots:WORD
_BSS      SEGMENT
COMM NEAR	_mS2n:	BYTE:	 1
_BSS      ENDS
EXTRN	_OurRoll:WORD
EXTRN	_Damaged:WORD
EXTRN	_OurPitch:WORD
EXTRN	_Status:WORD
EXTRN	_THRUST:WORD
EXTRN	_DesignateMode:WORD
EXTRN	_DataLink:WORD
EXTRN	_AutoGearOk:WORD
EXTRN	_ClrTarg:WORD
EXTRN	_AutoAlt:WORD
EXTRN	_AirSpeed:WORD
EXTRN	_MyMSGTYP:WORD
EXTRN	_HighlightTarg:WORD
EXTRN	_msgtime:WORD
EXTRN	_SelectedPal:WORD
EXTRN	_TransAmount:WORD
EXTRN	_Speedy:WORD
EXTRN	_ejected:WORD
EXTRN	_FPARAMS:BYTE
EXTRN	_FrameRate10:WORD
EXTRN	_FrameRate:WORD
EXTRN	_NextWayPoint:WORD
EXTRN	_FTicks:WORD
EXTRN	_ExitCode:BYTE
EXTRN	_BackSeat:WORD
EXTRN	_Joystick:WORD
EXTRN	_ThrustStick:WORD
EXTRN	_CoolyStick:WORD
EXTRN	_OutsideWidth:WORD
EXTRN	_OutsideLength:WORD
_BSS      SEGMENT
COMM NEAR	_PoliticallyCorrectNumlock:	BYTE:	 1
_BSS      ENDS
EXTRN	_TimeOfDay:WORD
EXTRN	_CrtDisplays:BYTE
EXTRN	_CrtRps:BYTE
EXTRN	_View:WORD
EXTRN	_PadPitch:WORD
EXTRN	_PadHead:WORD
EXTRN	_DeClutter:WORD
EXTRN	_REALFLIGHT:WORD
EXTRN	_JAMMER:WORD
EXTRN	_LIGHTS:WORD
EXTRN	_ctrl_b_flag:BYTE
EXTRN	_StickType:WORD
EXTRN	_HookDown:WORD
EXTRN	_KeyJoyX:BYTE
EXTRN	_KeyJoyY:BYTE
EXTRN	_VdiMode:WORD
EXTRN	_AWG9_REALITY_LEVEL:WORD
EXTRN	_tempvar:WORD
EXTRN	_AIWingMenu:WORD
EXTRN	_MasterArmSW:WORD
EXTRN	_behavecommands:WORD
EXTRN	_RadarRepeat:WORD
EXTRN	_AnimCnt:WORD
EXTRN	_Rp3D:WORD
EXTRN	_RudderStick:WORD
EXTRN	_SNDDETAIL:WORD
EXTRN	_RadarCursorSprite:BYTE
EXTRN	_MouseSprite:WORD
EXTRN	_Px:WORD
EXTRN	_Py:WORD
EXTRN	_Alt:WORD
EXTRN	_MouseX:WORD
EXTRN	_MouseY:WORD
EXTRN	_Mscale:WORD
EXTRN	_Button:WORD
EXTRN	_vScale:WORD
EXTRN	_Rtime:WORD
EXTRN	_PxLng:DWORD
_BSS      SEGMENT
COMM NEAR	_MyMouseHits:	BYTE:	 2
_BSS      ENDS
EXTRN	_PyLng:DWORD
_DATA      SEGMENT
	ORG	$+474
$SG1098	DB	'Air brake on',  00H
$SG1100	DB	'Air brake off',  00H
$SG1109	DB	'Landing gear raised',  00H
$SG1111	DB	'Landing gear lowered',  00H
$SG1117	DB	'AnimCnt: %i',  00H
$SG1132	DB	'Autopilot off',  00H
$SG1135	DB	'Autopilot on',  00H
$SG1271	DB	'F/S: ',  00H
$SG1272	DB	', FTicks: ',  00H
$SG1276	DB	'Conventional Memory Available: ',  00H
$SG1278	DB	'EMS memory: free-',  00H
$SG1279	DB	'  total-',  00H
$SG1291	DB	'Time Of Day: %i  SP: %d TRANS: %d',  0aH,  0dH,  00H
$SG1295	DB	'Time Of Day: %i  SP: %d TRANS: %d',  0aH,  0dH,  00H
$SG1318	DB	'                                 ...PAUSE...',  00H
	ORG	$-774
_mapmode	DW	00H
_PauseHit	DW	00H
_TickDelay	DW	01H
_KbSense	DW	02H
_DBlaunch	DW	00H
_ThrustChange	DW	00H
_MouseCrtX	DW	0ffffH
_MouseCrtY	DW	0ffffH
_MouseDsp	DW	0ffffH
_ShowMouse	DW	00H
_tempsound	DW	00H
_tempsound2	DW	00H
_SteadyHead	DW	00H
_SteadyPitch	DW	00H
_RUDDERVALS	DW	00H
_FrontTopSpots	DW	05aH
	DW	069H
	DW	068H
	DW	077H
	DW	0244aH
	DW	0d7H
	DW	06bH
	DW	0dfH
	DW	076H
	DW	0326dH
	DW	0d0H
	DW	0a3H
	DW	0d9H
	DW	0afH
	DW	09H
_FrontLeftSpots	DW	0ffH
	DW	08bH
	DW	011cH
	DW	0a7H
	DW	02267H
	DW	04dH
	DW	08eH
	DW	071H
	DW	0b3H
	DW	0aH
	DW	06eH
	DW	08eH
	DW	092H
	DW	0b1H
	DW	0bH
	DW	092H
	DW	090H
	DW	0b4H
	DW	0b2H
	DW	0cH
	DW	0b4H
	DW	090H
	DW	0d2H
	DW	0b2H
	DW	0dH
	DW	0d0H
	DW	090H
	DW	0faH
	DW	0b2H
	DW	0eH
_FrontRightSpots	DW	0bH
	DW	06eH
	DW	02eH
	DW	08eH
	DW	02368H
_BackTopSpots	DW	0e5H
	DW	070H
	DW	0f3H
	DW	075H
	DW	01372H
	DW	0f5H
	DW	070H
	DW	0103H
	DW	075H
	DW	01769H
	DW	0e1H
	DW	086H
	DW	0f1H
	DW	08bH
	DW	0266cH
	DW	0f3H
	DW	086H
	DW	0103H
	DW	08aH
	DW	04H
	DW	0e1H
	DW	094H
	DW	0f1H
	DW	098H
	DW	01H
	DW	0f3H
	DW	094H
	DW	0103H
	DW	098H
	DW	02H
	DW	0f3H
	DW	09fH
	DW	0103H
	DW	0a3H
	DW	03H
	DW	056H
	DW	069H
	DW	063H
	DW	072H
	DW	01cH
	DW	056H
	DW	073H
	DW	063H
	DW	07aH
	DW	01bH
	DW	056H
	DW	07aH
	DW	063H
	DW	082H
	DW	01aH
	DW	056H
	DW	082H
	DW	064H
	DW	08aH
	DW	019H
	DW	056H
	DW	08aH
	DW	064H
	DW	092H
	DW	018H
	DW	056H
	DW	092H
	DW	064H
	DW	09aH
	DW	017H
	DW	058H
	DW	09aH
	DW	066H
	DW	0a2H
	DW	016H
	DW	071H
	DW	04dH
	DW	07dH
	DW	059H
	DW	010H
	DW	082H
	DW	04cH
	DW	08eH
	DW	059H
	DW	011H
	DW	093H
	DW	04cH
	DW	09fH
	DW	059H
	DW	012H
	DW	0a4H
	DW	04cH
	DW	0b0H
	DW	059H
	DW	013H
	DW	0b5H
	DW	04cH
	DW	0c1H
	DW	059H
	DW	014H
	DW	0c6H
	DW	04cH
	DW	0d2H
	DW	059H
	DW	015H
_BackBotSpots	DW	0e5H
	DW	070H
	DW	0f3H
	DW	075H
	DW	01372H
	DW	0f3H
	DW	09fH
	DW	0103H
	DW	0a3H
	DW	05300H
	DW	072H
	DW	0a9H
	DW	080H
	DW	0b3H
	DW	05H
	DW	082H
	DW	0a9H
	DW	090H
	DW	0b3H
	DW	06H
	DW	092H
	DW	0a9H
	DW	0a0H
	DW	0b3H
	DW	08H
	DW	072H
	DW	0b5H
	DW	080H
	DW	0bfH
	DW	07H
	DW	0d5H
	DW	028H
	DW	0faH
	DW	03eH
	DW	020H
	DW	0a6H
	DW	0a5H
	DW	0d0H
	DW	0c2H
	DW	021H
_BackLeftSpots	DW	062H
	DW	090H
	DW	07eH
	DW	0a6H
	DW	01dH
	DW	052H
	DW	0a8H
	DW	06cH
	DW	0b6H
	DW	01eH
$S935_CoolyKeys	DW	00H
	DW	04b34H
	DW	05032H
	DW	04d36H
	DW	04838H
$S936_CHKeys	DW	00H
	DW	0ffffH
	DW	0fffeH
	DW	04b34H
	DW	0fffcH
	DW	00H
	DW	00H
	DW	05032H
	DW	0fff8H
	DW	00H
	DW	00H
	DW	04d36H
	DW	0256bH
	DW	00H
	DW	00H
	DW	04838H
$S964_WasInCrt	DW	00H
_DATA      ENDS
_BSS      SEGMENT
$S962_OldMouseX	DW 01H DUP (?)
$S963_OldMouseY	DW 01H DUP (?)
$S965_lasttime	DW 01H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 9
; Line 10
; Line 12
; Line 19
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
; Line 247
	PUBLIC	_TakeInputs
_TakeInputs	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 248
	sub	bx,bx
	mov	es,bx
	mov	bx,1047
	and	BYTE PTR es:[bx],47
; Line 250
	mov	WORD PTR _KEYPRINT,es
; Line 251
	call	_kbhit
	or	ax,ax
	je	$I924
; Line 252
	sub	ax,ax
	push	ax
	call	__bios_keybrd
	add	sp,2
	mov	WORD PTR _KEYPRINT,ax
; Line 253
; Line 255
$I924:
	call	_CheckMouseInput
; Line 256
	jmp	SHORT $L20060
$FC927:
	sub	ax,ax
	push	ax
	call	__bios_keybrd
	add	sp,2
$L20060:
	call	_kbhit
	or	ax,ax
	jne	$FC927
; Line 258
	cmp	WORD PTR _Joystick,ax
	je	$I929
; Line 259
	call	_GetJoystickInputs
; Line 260
	jmp	SHORT $I931
	nop	
$I929:
; Line 261
	mov	cx,WORD PTR _KbSense
	inc	cx
	mov	al,BYTE PTR _KeyJoyX
	sub	ah,ah
	sub	ax,128
	imul	cx
	mov	bx,3
	cwd	
	idiv	bx
	add	al,128
	mov	BYTE PTR _mS1n,al
; Line 262
	mov	al,BYTE PTR _KeyJoyY
	sub	ah,ah
	sub	ax,128
	imul	cx
	cwd	
	idiv	bx
	add	al,128
	mov	BYTE PTR _mS2n,al
; Line 263
$I931:
; Line 264
	cmp	BYTE PTR _ctrl_b_flag,0
	je	$I932
	mov	WORD PTR _KEYPRINT,4096
; Line 265
$I932:
	ret	

_TakeInputs	ENDP
; Line 269
	PUBLIC	_GetJoystickInputs
_GetJoystickInputs	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	j = -8
;	CoolyVal = -4
;	Trigs = -2
; Line 277
	mov	ax,WORD PTR _Joystick
	or	ax,WORD PTR _RudderStick
	or	ax,WORD PTR _CoolyStick
	or	ax,WORD PTR _ThrustStick
	push	ax
	call	FAR PTR _ReadJoy2
	add	sp,2
	mov	WORD PTR [bp-8],ax	;j
	mov	WORD PTR [bp-6],dx
; Line 278
	mov	al,BYTE PTR [bp-8]	;j
	add	al,128
	mov	BYTE PTR _mS1n,al
; Line 279
	mov	al,BYTE PTR [bp-7]
	add	al,128
	mov	BYTE PTR _mS2n,al
; Line 282
	cmp	WORD PTR _RudderStick,0
	je	$I939
; Line 284
	mov	al,BYTE PTR [bp-6]
	cbw	
	mov	WORD PTR _RUDDERVALS,ax
	or	ax,ax
	jl	$L20001
	and	al,248
	jmp	SHORT $L20002
	nop	
$L20001:
	push	ax
	call	_abs
	add	sp,2
	and	al,248
	neg	ax
$L20002:
	mov	WORD PTR _RUDDERVALS,ax
; Line 285
; Line 287
$I939:
	mov	WORD PTR _ThrustChange,0
; Line 288
	cmp	WORD PTR _ThrustStick,0
	je	$I941
; Line 290
	mov	al,BYTE PTR [bp-5]
	cbw	
	sub	ax,128
	neg	ax
	mov	WORD PTR _ThrustChange,ax
	cmp	ax,5
	jge	$I941
	mov	WORD PTR _ThrustChange,1
; Line 291
$I941:
; Line 294
	cmp	WORD PTR _CoolyStick,0
	je	$I943
; Line 296
	mov	al,BYTE PTR [bp-5]
	cbw	
	sub	ax,144
	neg	ax
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,5
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	je	$I943
	mov	bx,ax
	shl	bx,1
	mov	ax,WORD PTR $S935_CoolyKeys[bx]
	mov	WORD PTR _KEYPRINT,ax
; Line 297
$I943:
; Line 300
	cmp	WORD PTR _StickType,0
	jne	$I944
; Line 301
	mov	WORD PTR [bp-2],0	;Trigs
; Line 302
	jmp	SHORT $I945
	nop	
$I944:
; Line 303
	mov	ax,513
	push	ax
	call	_inp
	add	sp,2
	mov	cl,4
	sar	ax,cl
	not	ax
	and	ax,15
	mov	WORD PTR [bp-2],ax	;Trigs
$I945:
; Line 306
	cmp	WORD PTR _StickType,5
	jne	$I947
; Line 308
	mov	bx,WORD PTR [bp-2]	;Trigs
	shl	bx,1
	mov	ax,WORD PTR $S936_CHKeys[bx]
	mov	WORD PTR [bp-2],ax	;Trigs
	or	ax,ax
	jle	$I948
; Line 309
	mov	WORD PTR _KEYPRINT,ax
; Line 310
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 311
; Line 312
	nop	
$I948:
	neg	WORD PTR [bp-2]	;Trigs
; Line 313
; Line 316
$I947:
	test	BYTE PTR [bp-2],1	;Trigs
	je	$I949
	mov	WORD PTR _KEYPRINT,7181
; Line 318
$I949:
	test	BYTE PTR [bp-2],14	;Trigs
	jne	$I950
; Line 319
	mov	WORD PTR _DBlaunch,0
; Line 320
; Line 322
$I950:
	cmp	WORD PTR _DBlaunch,0
	jle	$I951
; Line 323
	dec	WORD PTR _DBlaunch
; Line 325
	mov	sp,bp
	pop	bp
	ret	
$I951:
	test	BYTE PTR [bp-2],2	;Trigs
	je	$I953
; Line 326
	mov	WORD PTR _KEYPRINT,14624
; Line 327
	mov	ax,90
	jmp	SHORT $L20061
	nop	
$I953:
	test	BYTE PTR [bp-2],4	;Trigs
	je	$I955
; Line 330
	mov	WORD PTR _KEYPRINT,3592
	jmp	SHORT $L20062
$I955:
	test	BYTE PTR [bp-2],8	;Trigs
	je	$I957
; Line 334
	mov	WORD PTR _KEYPRINT,9836
; Line 335
$L20062:
	mov	ax,30
$L20061:
	sub	dx,dx
	div	WORD PTR _FTicks
	mov	WORD PTR _DBlaunch,ax
; Line 336
; Line 337
$I957:
	mov	sp,bp
	pop	bp
	ret	

_GetJoystickInputs	ENDP
; Line 341
	PUBLIC	_CheckMouseInput
_CheckMouseInput	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	spr = -4
;	MouseMoved = -2
;	curtime = -6
;	i = -8
; Line 350
	mov	WORD PTR _MouseDsp,-1
; Line 353
	mov	ax,WORD PTR $S962_OldMouseX
	cmp	WORD PTR _MouseX,ax
	jne	$L20005
	mov	ax,WORD PTR $S963_OldMouseY
	cmp	WORD PTR _MouseY,ax
	je	$L20003
$L20005:
	mov	WORD PTR [bp-2],1	;MouseMoved
	jmp	SHORT $L20004
$L20003:
	mov	WORD PTR [bp-2],0	;MouseMoved
$L20004:
; Line 355
	cmp	WORD PTR [bp-2],0	;MouseMoved
	je	$I967
; Line 356
	mov	ax,WORD PTR _MouseX
	mov	WORD PTR $S962_OldMouseX,ax
; Line 357
	mov	ax,WORD PTR _MouseY
	mov	WORD PTR $S963_OldMouseY,ax
; Line 358
	mov	ax,WORD PTR _FrameRate
	mov	WORD PTR _ShowMouse,ax
; Line 359
	jmp	SHORT $I969
	nop	
$I967:
; Line 360
	cmp	WORD PTR _ShowMouse,0
	je	$I969
	dec	WORD PTR _ShowMouse
; Line 361
$I969:
; Line 363
	call	FAR PTR _MouseHITS
	mov	WORD PTR _MyMouseHits,ax
; Line 366
	cmp	WORD PTR _View,70
	jl	$I972
; Line 367
	cmp	WORD PTR _Button,0
	je	$I972
; Line 368
	cmp	WORD PTR _MouseX,160
	jle	$I972
	cmp	WORD PTR _MouseY,100
	jle	$I972
; Line 369
	mov	ax,WORD PTR _MouseX
	sub	ax,160
	shl	ax,1
	mov	WORD PTR _OutsideWidth,ax
; Line 370
	dec	ax
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+6],ax
; Line 372
	mov	ax,WORD PTR _MouseY
	sub	ax,100
	shl	ax,1
	mov	WORD PTR _OutsideLength,ax
; Line 373
	cmp	ax,170
	jle	$I973
	mov	WORD PTR _OutsideLength,170
; Line 374
$I973:
	mov	ax,WORD PTR _OutsideLength
	dec	ax
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+8],ax
; Line 376
	call	FAR PTR _MouseHIDE
; Line 377
	sub	ax,ax
	push	ax
	push	ax
	call	FAR PTR _ClearPage
	add	sp,4
; Line 378
	call	FAR PTR _MouseSHOW
; Line 379
; Line 380
$I972:
; Line 381
; Line 383
	cmp	WORD PTR _BackSeat,0
	je	$JCC673
	jmp	$I974
$JCC673:
; Line 384
	cmp	WORD PTR _View,0
	je	$JCC683
	jmp	$I983
$JCC683:
; Line 385
	cmp	WORD PTR $S964_WasInCrt,0
	jne	$I978
	cmp	WORD PTR [bp-2],0	;MouseMoved
	je	$I977
$I978:
	call	_CursorInCrt
	or	ax,ax
	je	$I977
; Line 386
	mov	cx,4
	push	cx
	push	cx
	push	ax
	call	_MouseSETUP
	add	sp,6
; Line 387
	cmp	WORD PTR $S964_WasInCrt,0
	jne	$I980
	xor	BYTE PTR $S964_WasInCrt,1
; Line 388
$I980:
	mov	ax,WORD PTR _FrameRate
	mov	WORD PTR _ShowMouse,ax
; Line 389
	jmp	SHORT $I983
$I977:
; Line 390
	cmp	WORD PTR $S964_WasInCrt,0
	je	$I982
; Line 391
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _MouseSprite
	call	_MouseSETUP
	add	sp,6
; Line 392
	xor	BYTE PTR $S964_WasInCrt,1
; Line 393
; Line 394
$I982:
	test	BYTE PTR _MyMouseHits,1
	je	$I983
; Line 395
	mov	WORD PTR [bp-8],0	;i
$FC985:
; Line 397
	mov	bx,WORD PTR [bp-8]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _MouseX
	cmp	WORD PTR _FrontTopSpots[bx],ax
	jg	$L20063
	mov	ax,WORD PTR _MouseX
	cmp	WORD PTR _FrontTopSpots[bx+4],ax
	jl	$L20063
	mov	ax,WORD PTR _MouseY
	cmp	WORD PTR _FrontTopSpots[bx+2],ax
	jg	$L20063
	mov	ax,WORD PTR _MouseY
	cmp	WORD PTR _FrontTopSpots[bx+6],ax
	jl	$L20063
; Line 398
	mov	ax,WORD PTR _FrontTopSpots[bx+8]
	mov	WORD PTR _KEYPRINT,ax
; Line 399
; Line 400
$L20063:
	inc	WORD PTR [bp-8]	;i
	cmp	WORD PTR [bp-8],3	;i
	jl	$FC985
; Line 401
; Line 402
$I983:
; Line 403
; Line 404
	cmp	WORD PTR _View,1
	je	$JCC848
	jmp	$I994
$JCC848:
; Line 405
	cmp	WORD PTR $S964_WasInCrt,0
	jne	$I990
	cmp	WORD PTR [bp-2],0	;MouseMoved
	je	$I989
$I990:
	call	_CursorInCrt
	or	ax,ax
	je	$I989
; Line 406
	mov	cx,4
	push	cx
	push	cx
	push	ax
	call	_MouseSETUP
	add	sp,6
; Line 407
	cmp	WORD PTR $S964_WasInCrt,0
	jne	$I991
	xor	BYTE PTR $S964_WasInCrt,1
; Line 408
$I991:
	mov	ax,WORD PTR _FrameRate
	mov	WORD PTR _ShowMouse,ax
; Line 409
	jmp	SHORT $I994
	nop	
$I989:
; Line 410
	cmp	WORD PTR $S964_WasInCrt,0
	je	$I993
; Line 411
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _MouseSprite
	call	_MouseSETUP
	add	sp,6
; Line 412
	xor	BYTE PTR $S964_WasInCrt,1
; Line 413
; Line 414
$I993:
	test	BYTE PTR _MyMouseHits,1
	je	$I994
; Line 415
	mov	WORD PTR [bp-8],0	;i
$FC996:
; Line 417
	mov	bx,WORD PTR [bp-8]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _MouseX
	cmp	WORD PTR _FrontLeftSpots[bx],ax
	jg	$L20064
	mov	ax,WORD PTR _MouseX
	cmp	WORD PTR _FrontLeftSpots[bx+4],ax
	jl	$L20064
	mov	ax,WORD PTR _MouseY
	cmp	WORD PTR _FrontLeftSpots[bx+2],ax
	jg	$L20064
	mov	ax,WORD PTR _MouseY
	cmp	WORD PTR _FrontLeftSpots[bx+6],ax
	jl	$L20064
; Line 418
	mov	ax,WORD PTR _FrontLeftSpots[bx+8]
	mov	WORD PTR _KEYPRINT,ax
; Line 419
; Line 420
$L20064:
	inc	WORD PTR [bp-8]	;i
	cmp	WORD PTR [bp-8],6	;i
	jl	$FC996
; Line 421
; Line 422
$I994:
; Line 423
; Line 424
	cmp	WORD PTR _View,2
	je	$JCC1014
	jmp	$I1039
$JCC1014:
; Line 425
	cmp	WORD PTR $S964_WasInCrt,0
	jne	$I1001
	cmp	WORD PTR [bp-2],0	;MouseMoved
	je	$I1000
$I1001:
	call	_CursorInCrt
	or	ax,ax
	je	$I1000
; Line 426
$L20069:
	mov	cx,4
	push	cx
	push	cx
	push	ax
	call	_MouseSETUP
	add	sp,6
; Line 427
	cmp	WORD PTR $S964_WasInCrt,0
	jne	$I1002
	xor	BYTE PTR $S964_WasInCrt,1
; Line 428
$I1002:
	mov	ax,WORD PTR _FrameRate
	mov	WORD PTR _ShowMouse,ax
; Line 429
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1000:
; Line 430
	cmp	WORD PTR $S964_WasInCrt,0
	je	$I1004
; Line 431
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _MouseSprite
	call	_MouseSETUP
	add	sp,6
; Line 432
	xor	BYTE PTR $S964_WasInCrt,1
; Line 433
; Line 434
$I1004:
	test	BYTE PTR _MyMouseHits,1
	jne	$JCC1105
	jmp	$I1039
$JCC1105:
; Line 435
	mov	WORD PTR [bp-8],0	;i
$FC1007:
; Line 437
	mov	bx,WORD PTR [bp-8]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _MouseX
	cmp	WORD PTR _FrontRightSpots[bx],ax
	jg	$L20065
	mov	ax,WORD PTR _MouseX
	cmp	WORD PTR _FrontRightSpots[bx+4],ax
	jl	$L20065
	mov	ax,WORD PTR _MouseY
	cmp	WORD PTR _FrontRightSpots[bx+2],ax
	jg	$L20065
	mov	ax,WORD PTR _MouseY
	cmp	WORD PTR _FrontRightSpots[bx+6],ax
	jl	$L20065
; Line 438
	mov	ax,WORD PTR _FrontRightSpots[bx+8]
	mov	WORD PTR _KEYPRINT,ax
; Line 439
; Line 440
$L20065:
	inc	WORD PTR [bp-8]	;i
	cmp	WORD PTR [bp-8],1	;i
	jl	$FC1007
; Line 441
; Line 442
; Line 443
; Line 445
	mov	sp,bp
	pop	bp
	ret	
$I974:
; Line 446
	cmp	WORD PTR _View,0
	je	$JCC1189
	jmp	$I1017
$JCC1189:
; Line 447
	cmp	WORD PTR $S964_WasInCrt,0
	jne	$I1013
	cmp	WORD PTR [bp-2],0	;MouseMoved
	je	$I1012
$I1013:
	call	_CursorInCrt
	or	ax,ax
	je	$I1012
; Line 448
	mov	cx,4
	push	cx
	push	cx
	push	ax
	call	_MouseSETUP
	add	sp,6
; Line 449
	cmp	WORD PTR $S964_WasInCrt,0
	jne	$I1014
	xor	BYTE PTR $S964_WasInCrt,1
; Line 450
$I1014:
	mov	ax,WORD PTR _FrameRate
	mov	WORD PTR _ShowMouse,ax
; Line 451
	jmp	SHORT $I1017
$I1012:
; Line 452
	cmp	WORD PTR $S964_WasInCrt,0
	je	$I1016
; Line 453
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _MouseSprite
	call	_MouseSETUP
	add	sp,6
; Line 454
	xor	BYTE PTR $S964_WasInCrt,1
; Line 455
; Line 456
$I1016:
	test	BYTE PTR _MyMouseHits,1
	je	$I1017
; Line 457
	mov	WORD PTR [bp-8],0	;i
$FC1019:
; Line 459
	mov	bx,WORD PTR [bp-8]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _MouseX
	cmp	WORD PTR _BackTopSpots[bx],ax
	jg	$L20066
	mov	ax,WORD PTR _MouseX
	cmp	WORD PTR _BackTopSpots[bx+4],ax
	jl	$L20066
	mov	ax,WORD PTR _MouseY
	cmp	WORD PTR _BackTopSpots[bx+2],ax
	jg	$L20066
	mov	ax,WORD PTR _MouseY
	cmp	WORD PTR _BackTopSpots[bx+6],ax
	jl	$L20066
; Line 460
	mov	ax,WORD PTR _BackTopSpots[bx+8]
	mov	WORD PTR _KEYPRINT,ax
; Line 461
; Line 462
$L20066:
	inc	WORD PTR [bp-8]	;i
	cmp	WORD PTR [bp-8],20	;i
	jl	$FC1019
; Line 463
; Line 464
$I1017:
; Line 465
; Line 466
	cmp	WORD PTR _View,1
	je	$JCC1354
	jmp	$I1028
$JCC1354:
; Line 467
	cmp	WORD PTR $S964_WasInCrt,0
	jne	$I1024
	cmp	WORD PTR [bp-2],0	;MouseMoved
	je	$I1023
$I1024:
	call	_CursorInCrt
	or	ax,ax
	je	$I1023
; Line 468
	mov	cx,4
	push	cx
	push	cx
	push	ax
	call	_MouseSETUP
	add	sp,6
; Line 469
	cmp	WORD PTR $S964_WasInCrt,0
	jne	$I1025
	xor	BYTE PTR $S964_WasInCrt,1
; Line 470
$I1025:
	mov	ax,WORD PTR _FrameRate
	mov	WORD PTR _ShowMouse,ax
; Line 471
	jmp	SHORT $I1028
	nop	
$I1023:
; Line 472
	cmp	WORD PTR $S964_WasInCrt,0
	je	$I1027
; Line 473
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _MouseSprite
	call	_MouseSETUP
	add	sp,6
; Line 474
	xor	BYTE PTR $S964_WasInCrt,1
; Line 475
; Line 476
$I1027:
	test	BYTE PTR _MyMouseHits,1
	je	$I1028
; Line 477
	mov	WORD PTR [bp-8],0	;i
$FC1030:
; Line 479
	mov	bx,WORD PTR [bp-8]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _MouseX
	cmp	WORD PTR _BackLeftSpots[bx],ax
	jg	$L20067
	mov	ax,WORD PTR _MouseX
	cmp	WORD PTR _BackLeftSpots[bx+4],ax
	jl	$L20067
	mov	ax,WORD PTR _MouseY
	cmp	WORD PTR _BackLeftSpots[bx+2],ax
	jg	$L20067
	mov	ax,WORD PTR _MouseY
	cmp	WORD PTR _BackLeftSpots[bx+6],ax
	jl	$L20067
; Line 480
	mov	ax,WORD PTR _BackLeftSpots[bx+8]
	mov	WORD PTR _KEYPRINT,ax
; Line 481
; Line 482
$L20067:
	inc	WORD PTR [bp-8]	;i
	cmp	WORD PTR [bp-8],2	;i
	jl	$FC1030
; Line 483
; Line 484
$I1028:
; Line 485
; Line 487
	cmp	WORD PTR _View,3
	jne	$I1039
; Line 488
	cmp	WORD PTR $S964_WasInCrt,0
	jne	$I1035
	cmp	WORD PTR [bp-2],0	;MouseMoved
	je	$I1034
$I1035:
	call	_CursorInCrt
	or	ax,ax
	je	$JCC1540
	jmp	$L20069
$JCC1540:
$I1034:
; Line 493
	cmp	WORD PTR $S964_WasInCrt,0
	je	$I1038
; Line 494
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _MouseSprite
	call	_MouseSETUP
	add	sp,6
; Line 495
	xor	BYTE PTR $S964_WasInCrt,1
; Line 496
; Line 497
$I1038:
	test	BYTE PTR _MyMouseHits,1
	je	$I1039
; Line 498
	mov	WORD PTR [bp-8],0	;i
$FC1041:
; Line 500
	mov	bx,WORD PTR [bp-8]	;i
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR _MouseX
	cmp	WORD PTR _BackBotSpots[bx],ax
	jg	$L20068
	mov	ax,WORD PTR _MouseX
	cmp	WORD PTR _BackBotSpots[bx+4],ax
	jl	$L20068
	mov	ax,WORD PTR _MouseY
	cmp	WORD PTR _BackBotSpots[bx+2],ax
	jg	$L20068
	mov	ax,WORD PTR _MouseY
	cmp	WORD PTR _BackBotSpots[bx+6],ax
	jl	$L20068
; Line 501
	mov	ax,WORD PTR _BackBotSpots[bx+8]
	mov	WORD PTR _KEYPRINT,ax
; Line 502
; Line 503
$L20068:
	inc	WORD PTR [bp-8]	;i
	cmp	WORD PTR [bp-8],8	;i
	jl	$FC1041
; Line 504
; Line 505
$I1039:
; Line 506
; Line 507
; Line 508
	mov	sp,bp
	pop	bp
	ret	
	nop	
	nop	

_CheckMouseInput	ENDP
; Line 513
	PUBLIC	_CursorInCrt
_CursorInCrt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
;	Start = -12
;	End = -6
;	i = -8
;	j = -10
;	dtype = -4
;	Rp = -2
; Line 517
	mov	WORD PTR _MouseCrtX,-1
; Line 519
	cmp	WORD PTR _BackSeat,0
	jne	$JCC1674
	jmp	$I1065
$JCC1674:
; Line 520
	cmp	WORD PTR _View,0
	jne	$I1052
; Line 521
	mov	WORD PTR [bp-8],4	;i
; Line 522
$I1052:
	cmp	WORD PTR _View,3
	jne	$I1053
; Line 523
	mov	WORD PTR [bp-8],5	;i
; Line 525
$I1053:
	mov	bx,WORD PTR [bp-8]	;i
	shl	bx,1
	mov	ax,WORD PTR _CrtDisplays[bx]
; Line 526
	mov	cx,WORD PTR _CrtRps[bx]
; Line 527
	mov	bx,cx
	mov	dx,WORD PTR _MouseX
	sub	dx,WORD PTR [bx+2]
	mov	WORD PTR _MouseCrtX,dx
; Line 528
	mov	dx,WORD PTR _MouseY
	sub	dx,WORD PTR [bx+4]
	mov	WORD PTR _MouseCrtY,dx
; Line 529
	mov	dx,WORD PTR [bp-8]	;i
	mov	WORD PTR _MouseDsp,dx
; Line 533
	cmp	WORD PTR _MouseCrtX,0
	jl	$I1054
	mov	dx,WORD PTR _MouseCrtX
	cmp	WORD PTR [bx+6],dx
	jl	$I1054
	cmp	WORD PTR _MouseCrtY,0
	jl	$I1054
	mov	dx,WORD PTR _MouseCrtY
	cmp	WORD PTR [bx+8],dx
	jl	$I1054
; Line 534
	cmp	ax,17
	je	$SC1061
	ja	$I1065
	sub	al,2
	je	$SC1059
	sub	al,14
	jne	$I1065
; Line 545
; Line 535
$SC1059:
; Line 536
	cmp	WORD PTR _MyMouseHits,0
	je	$I1060
	mov	al,BYTE PTR _MyMouseHits
	and	ax,1
	cmp	ax,1
	sbb	ax,ax
	and	ax,10091
	add	ax,-255
	mov	WORD PTR _KEYPRINT,ax
; Line 537
$I1060:
	mov	ax,WORD PTR _RadarCursorSprite+4
	mov	sp,bp
	pop	bp
	ret	
; Line 538
	nop	
	nop	
$SC1061:
; Line 539
	cmp	WORD PTR _MyMouseHits,0
	je	$I1062
	mov	al,BYTE PTR _MyMouseHits
	and	ax,1
	cmp	ax,1
	sbb	ax,ax
	and	ax,10091
	add	ax,-255
	mov	WORD PTR _KEYPRINT,ax
; Line 540
$I1062:
	mov	ax,WORD PTR _RadarCursorSprite
	mov	sp,bp
	pop	bp
	ret	
$I1054:
; Line 546
	mov	WORD PTR _MouseCrtX,-1
; Line 547
$I1065:
; Line 548
; Line 549
	sub	ax,ax
; Line 550
	mov	sp,bp
	pop	bp
	ret	

_CursorInCrt	ENDP
; Line 554
	PUBLIC	_ProcessInputs
_ProcessInputs	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 555
	cmp	WORD PTR _ThrustChange,0
	je	$I1071
; Line 557
	mov	cx,144
	mov	ax,WORD PTR _ThrustChange
	dec	ax
	imul	cx
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,7
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	WORD PTR _THRUST,ax
	cmp	ax,130
	jle	$I1069
; Line 558
	mov	WORD PTR _THRUST,144
; Line 559
	jmp	SHORT $I1071
	nop	
$I1069:
; Line 560
	cmp	ax,100
	jle	$I1071
; Line 561
	mov	WORD PTR _THRUST,100
; Line 562
$I1071:
; Line 563
; Line 565
	cmp	WORD PTR _MasterArmSW,0
	je	$I1072
; Line 566
	call	_docannon
; Line 568
$I1072:
	cmp	WORD PTR _KEYPRINT,0
	je	$I1074
; Line 569
	call	_Cmds
; Line 570
; Line 572
$I1074:
	cmp	WORD PTR _THRUST,0
	je	$I1078
	cmp	WORD PTR _ThrustI,0
	jne	$I1078
; Line 573
	and	BYTE PTR _Status,247
; Line 574
	cmp	WORD PTR _AirSpeed,0
	jne	$I1078
; Line 575
	cmp	WORD PTR _SNDDETAIL,1
	je	$I1078
	cmp	WORD PTR _SNDDETAIL,3
	je	$I1078
; Line 576
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,19
	push	ax
	call	_Sound
	add	sp,6
; Line 577
$I1078:
; Line 578
; Line 579
	ret	
	nop	

_ProcessInputs	ENDP
; Line 583
	PUBLIC	_Cmds
_Cmds	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	si
;	i = -6
;	Move = -4
;	prevwps = -2
; Line 586
	mov	ax,WORD PTR _KEYPRINT
	jmp	$S1084
; Line 587
$SC1088:
; Line 588
	mov	ax,100
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,WORD PTR _THRUST
	sub	ax,10
$L20071:
	push	ax
	call	_rng
	add	sp,6
	mov	WORD PTR _THRUST,ax
; Line 589
$SB1085:
; Line 1043
	test	BYTE PTR _Status+1,16
	jne	$JCC2062
	jmp	$SB1286
$JCC2062:
; Line 1044
	mov	ax,WORD PTR _KEYPRINT
	cmp	ax,11520
	jne	$JCC2073
	jmp	$SC1301
$JCC2073:
	jbe	$JCC2078
	jmp	$L20044
$JCC2078:
	sub	ax,4864
	jne	$JCC2086
	jmp	$SC1296
$JCC2086:
	sub	ax,3072
	jne	$JCC2094
	jmp	$SC1299
$JCC2094:
	sub	ax,3328
	jne	$JCC2102
	jmp	$SC1302
$JCC2102:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 591
$SC1090:
; Line 592
	mov	ax,100
	push	ax
	sub	ax,ax
	push	ax
	cmp	WORD PTR _THRUST,10
	jl	$L20012
	mov	ax,10
	jmp	SHORT $L20013
	nop	
$L20012:
	mov	ax,5
$L20013:
	add	ax,WORD PTR _THRUST
	jmp	SHORT $L20071
; Line 595
	nop	
$SC1091:
; Line 596
	mov	WORD PTR _THRUST,144
; Line 597
$L20072:
	and	BYTE PTR _Status,247
; Line 598
	jmp	SHORT $SB1085
; Line 600
	nop	
$SC1092:
; Line 601
	xor	BYTE PTR _VdiMode,1
; Line 602
	jmp	SHORT $SB1085
; Line 604
	nop	
$SC1093:
; Line 605
	mov	WORD PTR _THRUST,100
	jmp	SHORT $L20072
; Line 609
$SC1094:
; Line 610
	mov	WORD PTR _THRUST,0
; Line 611
	jmp	SHORT $SB1085
; Line 613
$SC1095:
; Line 615
	xor	BYTE PTR _Status,8
	test	BYTE PTR _Status,8
	je	$I1096
; Line 616
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:$SG1098
$L20073:
	push	ax
	call	_Message
$L20074:
	add	sp,4
; Line 617
	jmp	$SB1085
	nop	
$I1096:
; Line 618
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:$SG1100
	jmp	SHORT $L20073
; Line 621
	nop	
$SC1101:
; Line 622
	push	WORD PTR _FPARAMS+10
	push	WORD PTR _FPARAMS+8
	push	WORD PTR _FPARAMS+6
	push	WORD PTR _FPARAMS+4
	push	WORD PTR _FPARAMS+2
	push	WORD PTR _FPARAMS
	call	_OnTheDeck
	add	sp,12
	or	ax,ax
	jne	$I1106
	cmp	WORD PTR _ejected,ax
	jne	$I1106
; Line 623
	test	BYTE PTR _Status,1
	je	$I1105
	cmp	WORD PTR _Knots,350
	jl	$I1105
	cmp	WORD PTR _REALFLIGHT,ax
	jne	$I1106
$I1105:
; Line 624
	cmp	WORD PTR _REALFLIGHT,ax
	je	$I1107
	test	BYTE PTR _Status,1
	jne	$I1107
	test	BYTE PTR _Damaged,4
	jne	$I1106
$I1107:
; Line 626
	xor	BYTE PTR _Status,1
	test	BYTE PTR _Status,1
	je	$I1108
; Line 627
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:$SG1109
	jmp	SHORT $L20075
$I1108:
; Line 629
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:$SG1111
$L20075:
	push	ax
	call	_Message
	add	sp,4
; Line 631
	mov	WORD PTR _AutoGearOk,0
; Line 633
; Line 634
$I1106:
; Line 635
; Line 636
	test	BYTE PTR _Status,1
	je	$JCC2347
	jmp	$SB1085
$JCC2347:
$L20090:
	call	_NoAccel
; Line 637
	jmp	$SB1085
; Line 639
$SC1114:
; Line 641
	inc	WORD PTR _AnimCnt
	cmp	WORD PTR _AnimCnt,13
	jle	$I1115
	mov	WORD PTR _AnimCnt,0
; Line 642
$I1115:
	push	WORD PTR _AnimCnt
	mov	ax,OFFSET DGROUP:$SG1117
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,6
; Line 643
	mov	ax,OFFSET _Txt
	push	ax
	call	_Message
	jmp	$L20091
; Line 646
	nop	
$SC1118:
; Line 647
	call	_LaunchAircraft
; Line 648
	jmp	$SB1085
; Line 649
$SC1120:
; Line 650
	call	_EasyLanding
; Line 651
	jmp	$SB1085
; Line 653
$SC1122:
; Line 654
	call	_ChangeWeather
; Line 655
	jmp	$SB1085
; Line 657
$SC1124:
; Line 658
	cmp	WORD PTR _ejected,0
	je	$JCC2427
	jmp	$SB1085
$JCC2427:
; Line 659
	mov	WORD PTR _ejected,1
; Line 660
	mov	ax,WORD PTR _Px
	mov	WORD PTR _ejectX,ax
; Line 661
	mov	ax,WORD PTR _Py
	mov	WORD PTR _ejectY,ax
; Line 662
	mov	ax,WORD PTR _Alt
	add	ax,8
	mov	WORD PTR _ejectZ,ax
; Line 664
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	mov	cx,26
	push	cx
	call	_Sound
	add	sp,6
; Line 666
	push	WORD PTR _OurRoll
	call	_abs
	add	sp,2
	push	WORD PTR _OurPitch
	mov	si,ax
	call	_abs
	add	sp,2
	mov	cx,ax
	mov	ax,WORD PTR _Rtime
	mov	dx,500
	mov	bx,dx
	cwd	
	idiv	bx
	mov	al,5
	xchg	cx,ax
	sar	ax,cl
	mov	cl,5
	sar	si,cl
	add	ax,si
	add	ax,WORD PTR _Knots
	add	bx,dx
	cmp	ax,bx
	jle	$I1126
; Line 667
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	ax
	push	WORD PTR _Alt
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	ax
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	mov	ax,-1
	push	ax
	mov	ax,37
	push	ax
	call	_LogIt
	add	sp,24
; Line 668
	mov	ax,16
	push	ax
	call	_EndGame
$L20091:
	add	sp,2
; Line 669
; Line 670
	jmp	$SB1085
$I1126:
; Line 671
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	ax
	push	WORD PTR _Alt
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	ax
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	mov	ax,-1
	push	ax
	mov	ax,38
$L20097:
	push	ax
	call	_LogIt
	add	sp,24
; Line 672
; Line 673
; Line 674
	jmp	$SB1085
; Line 676
$SC1130:
; Line 677
	cmp	WORD PTR _AutoAlt,0
	je	$I1131
; Line 678
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:$SG1132
	push	ax
	call	_Message
	add	sp,4
; Line 679
	mov	WORD PTR _AutoAlt,0
; Line 680
	jmp	$SB1085
$I1131:
	test	BYTE PTR _Damaged+1,8
	je	$JCC2685
	jmp	$SB1085
$JCC2685:
; Line 681
	mov	ax,WORD PTR _Alt
	cmp	ax,25
	jge	$L20014
	mov	ax,25
$L20014:
	mov	WORD PTR _AutoAlt,ax
; Line 682
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:$SG1135
	jmp	$L20073
; Line 686
$SC1136:
; Line 687
	cmp	WORD PTR _MasterArmSW,0
	jne	$JCC2719
	jmp	$SB1085
$JCC2719:
; Line 688
	call	_firemissile
; Line 689
	jmp	$SB1085
; Line 691
$SC1139:
; Line 692
	mov	ax,70
	push	ax
	mov	ax,1
$L20077:
	push	ax
	call	_dropdecoy
	jmp	$L20074
; Line 695
$SC1141:
; Line 696
	mov	ax,70
	push	ax
	mov	ax,2
	jmp	SHORT $L20077
; Line 699
	nop	
$SC1142:
; Line 700
	test	BYTE PTR _Damaged+1,64
	je	$JCC2759
	jmp	$SB1085
$JCC2759:
; Line 701
	xor	BYTE PTR _JAMMER,1
; Line 702
; Line 703
	jmp	$SB1085
; Line 705
$SC1144:
; Line 706
	xor	BYTE PTR _MasterArmSW,1
; Line 707
	jmp	$SB1085
; Line 709
$SC1145:
; Line 710
	cmp	WORD PTR _AIWingMenu,0
	je	$JCC2785
	jmp	$L20095
$JCC2785:
; Line 713
	mov	ax,2
	jmp	SHORT $L20094
; Line 715
	nop	
$SC1149:
; Line 716
	cmp	WORD PTR _AIWingMenu,0
	je	$I1150
; Line 717
$L20098:
	mov	ax,WORD PTR _AIWingMenu
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,12
	jmp	SHORT $L20082
	nop	
$I1150:
; Line 719
	mov	ax,1
	jmp	SHORT $L20094
; Line 722
	nop	
$SC1152:
; Line 723
	cmp	WORD PTR _AIWingMenu,0
	je	$I1153
; Line 724
$L20099:
	mov	ax,WORD PTR _AIWingMenu
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,13
	jmp	SHORT $L20082
	nop	
$I1153:
; Line 726
	sub	ax,ax
	jmp	SHORT $L20094
; Line 729
$SC1155:
; Line 730
	cmp	WORD PTR _AIWingMenu,0
	je	$I1156
; Line 731
$L20100:
	mov	ax,WORD PTR _AIWingMenu
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,14
	jmp	SHORT $L20082
	nop	
$I1156:
; Line 733
	mov	ax,4
$L20094:
	push	ax
	call	_AA_MODE
	jmp	$L20091
; Line 736
$SC1158:
; Line 737
	cmp	WORD PTR _AIWingMenu,0
	je	$I1159
; Line 738
	mov	ax,WORD PTR _AIWingMenu
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,15
$L20082:
	mov	WORD PTR _behavecommands,ax
; Line 739
	jmp	$SB1085
	nop	
$I1159:
; Line 740
	sub	ax,ax
	push	ax
	call	_ARMT_MODE
	jmp	$L20091
; Line 743
	nop	
$SC1162:
; Line 744
	cmp	WORD PTR _AIWingMenu,0
	jne	$JCC2939
	jmp	$SB1085
$JCC2939:
; Line 745
	mov	ax,WORD PTR _AIWingMenu
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,16
	jmp	SHORT $L20082
; Line 748
$SC1164:
; Line 749
	cmp	WORD PTR _AIWingMenu,0
	jne	$JCC2967
	jmp	$SB1085
$JCC2967:
; Line 750
	mov	ax,WORD PTR _AIWingMenu
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,17
	jmp	SHORT $L20082
; Line 753
$SC1166:
; Line 754
	cmp	WORD PTR _AIWingMenu,0
	jne	$JCC2995
	jmp	$SB1085
$JCC2995:
; Line 755
	mov	ax,WORD PTR _AIWingMenu
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,18
	jmp	SHORT $L20082
; Line 757
$SC1168:
; Line 758
	mov	ax,WORD PTR _AIWingMenu
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,19
	jmp	SHORT $L20082
; Line 761
$SC1169:
; Line 762
	mov	ax,WORD PTR _AIWingMenu
	inc	ax
	inc	ax
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	jmp	$L20082
; Line 765
$SC1170:
; Line 766
	cmp	WORD PTR _AIWingMenu,0
	jne	$JCC3059
	jmp	$SB1085
$JCC3059:
	cmp	WORD PTR _StickType,0
	jne	$JCC3069
	jmp	$SB1085
$JCC3069:
; Line 767
$L20095:
	mov	ax,WORD PTR _AIWingMenu
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,11
	jmp	$L20082
; Line 770
	nop	
$SC1172:
; Line 771
	cmp	WORD PTR _AIWingMenu,0
	jne	$JCC3099
	jmp	$SB1085
$JCC3099:
	cmp	WORD PTR _StickType,0
	jne	$JCC3109
	jmp	$SB1085
$JCC3109:
	jmp	$L20098
; Line 775
	nop	
$SC1174:
; Line 776
	cmp	WORD PTR _AIWingMenu,0
	jne	$JCC3123
	jmp	$SB1085
$JCC3123:
	cmp	WORD PTR _StickType,0
	jne	$JCC3133
	jmp	$SB1085
$JCC3133:
	jmp	$L20099
; Line 780
	nop	
$SC1176:
; Line 781
	cmp	WORD PTR _AIWingMenu,0
	jne	$JCC3147
	jmp	$SB1085
$JCC3147:
	cmp	WORD PTR _StickType,0
	jne	$JCC3157
	jmp	$SB1085
$JCC3157:
	jmp	$L20100
; Line 785
	nop	
$SC1178:
; Line 786
	mov	ax,1
	push	ax
	call	_JetisonSwitch
	add	sp,2
; Line 787
	call	_ARMT_jettison_all
; Line 788
	jmp	$SB1085
; Line 790
$SC1181:
; Line 791
	test	BYTE PTR _View,128
	je	$JCC3187
	jmp	$SB1085
$JCC3187:
; Line 792
	call	_ZoomDisplay
; Line 793
	jmp	$SB1085
; Line 794
$SC1184:
; Line 795
	test	BYTE PTR _View,128
	je	$JCC3203
	jmp	$SB1085
$JCC3203:
; Line 796
	call	_UnZoomDisplay
; Line 797
	jmp	$SB1085
; Line 798
$SC1187:
; Line 799
	xor	BYTE PTR _RadarRepeat,1
; Line 800
	jmp	$SB1085
; Line 802
$SC1188:
; Line 803
	mov	ax,WORD PTR _NextWayPoint
	inc	WORD PTR _NextWayPoint
	mov	WORD PTR [bp-2],ax	;prevwps
; Line 804
	cmp	WORD PTR _NextWayPoint,3
	jle	$I1189
; Line 805
	mov	WORD PTR _NextWayPoint,0
; Line 806
$I1189:
	push	ax
	call	_UpdateOurWPS
	add	sp,2
; Line 807
	call	_ShowOurWPS
; Line 808
	jmp	$SB1085
; Line 810
$SC1192:
; Line 811
	mov	ax,WORD PTR _NextWayPoint
	dec	WORD PTR _NextWayPoint
	mov	WORD PTR [bp-2],ax	;prevwps
; Line 812
	cmp	WORD PTR _NextWayPoint,0
	jge	$I1189
; Line 813
	mov	WORD PTR _NextWayPoint,3
; Line 814
	jmp	SHORT $I1189
; Line 818
	nop	
$SC1194:
; Line 819
	mov	ax,-1
	push	ax
	call	_CheckPlaneLand
	jmp	$L20091
; Line 822
$SC1196:
; Line 823
	call	_AwacsPicture
; Line 824
	jmp	$SB1085
; Line 826
$SC1198:
; Line 827
	mov	ax,2
$L20083:
	push	ax
	call	_TrimIt
	jmp	$L20091
; Line 830
$SC1200:
; Line 831
	mov	ax,-2
	jmp	SHORT $L20083
; Line 834
	nop	
$SC1201:
; Line 836
	call	_ToggleAutoTrim
; Line 837
	jmp	$SB1085
; Line 839
$SC1203:
; Line 840
	call	_AWG9_POWERUP
; Line 841
	jmp	$SB1085
; Line 843
$SC1205:
; Line 845
	cmp	WORD PTR _AWG9_REALITY_LEVEL,1
	jne	$I1206
; Line 846
	mov	ax,-1
	push	ax
	call	_ChangeModerateScan
	add	sp,2
; Line 847
; Line 848
$I1206:
	cmp	WORD PTR _AWG9_REALITY_LEVEL,2
	je	$JCC3350
	jmp	$SB1085
$JCC3350:
; Line 849
	call	_CHANGE_AZIMUTH
; Line 850
; Line 851
	jmp	$SB1085
; Line 853
	nop	
$SC1210:
; Line 855
	mov	ax,-1
$L20084:
	push	ax
	call	_ChangeSRCHMode
	jmp	$L20091
; Line 857
$SC1212:
; Line 858
	mov	ax,2
	jmp	SHORT $L20084
; Line 860
	nop	
$SC1213:
; Line 861
	mov	ax,1
	jmp	SHORT $L20084
; Line 863
	nop	
$SC1214:
; Line 864
	mov	ax,3
	jmp	SHORT $L20084
; Line 866
	nop	
$SC1215:
; Line 867
	sub	ax,ax
	jmp	SHORT $L20084
; Line 870
$SC1216:
; Line 871
	call	_AWG9_LOCK
; Line 872
	jmp	$SB1085
; Line 874
$SC1218:
; Line 875
	call	_AWG9_MODE_BREAK
; Line 876
	jmp	$SB1085
; Line 878
$SC1220:
; Line 880
	cmp	WORD PTR _AWG9_REALITY_LEVEL,2
	je	$JCC3411
	jmp	$SB1085
$JCC3411:
; Line 881
	call	_CHANGE_NUM_BARS
; Line 882
; Line 883
	jmp	$SB1085
; Line 885
$SC1223:
; Line 887
	mov	ax,1
$L20085:
	push	ax
	call	_AWG9_EL
	jmp	$L20091
; Line 890
$SC1225:
; Line 892
	sub	ax,ax
	jmp	SHORT $L20085
; Line 895
$SC1226:
; Line 896
	call	_AWG9_IFF
; Line 897
	jmp	$SB1085
; Line 899
$SC1228:
; Line 901
	mov	ax,60
	push	ax
	call	_AWG9_CHANGE_MODE
	jmp	$L20091
; Line 904
$SC1230:
; Line 905
	sub	ax,ax
	push	ax
	call	_AWG9_ACQ
	jmp	$L20091
; Line 908
	nop	
$SC1232:
; Line 909
	cmp	WORD PTR _BackSeat,0
	je	$I1233
	cmp	WORD PTR _View,0
	jne	$I1233
; Line 910
	mov	ax,1
	push	ax
	call	_AWG9_ACQ
	add	sp,2
; Line 911
; Line 912
$I1233:
	cmp	WORD PTR _BackSeat,0
	jne	$JCC3491
	jmp	$SB1085
$JCC3491:
	cmp	WORD PTR _View,3
	je	$JCC3501
	jmp	$SB1085
$JCC3501:
; Line 913
	cmp	WORD PTR _DesignateMode,0
	je	$I1235
; Line 914
	call	_DesignateTIDTarg
; Line 915
$I1235:
	cmp	WORD PTR _HighlightTarg,0
	jne	$JCC3521
	jmp	$SB1085
$JCC3521:
; Line 916
$L20101:
	call	_SelectDesig
; Line 917
; Line 918
	jmp	$SB1085
; Line 920
$SC1239:
; Line 921
	xor	BYTE PTR _DesignateMode,1
; Line 922
	mov	WORD PTR _HighlightTarg,0
; Line 923
	jmp	$SB1085
; Line 925
$SC1240:
; Line 926
	call	_InitTWSData
; Line 928
	sub	ax,ax
	mov	WORD PTR _DesignateMode,ax
	mov	WORD PTR _HighlightTarg,ax
; Line 929
	mov	WORD PTR _ClrTarg,10
; Line 930
	jmp	$SB1085
; Line 932
$SC1242:
; Line 933
	xor	BYTE PTR _DataLink,1
; Line 934
	jmp	$SB1085
; Line 936
$SC1243:
; Line 937
	xor	BYTE PTR _HighlightTarg,1
; Line 938
	mov	WORD PTR _DesignateMode,0
	jmp	SHORT $L20101
; Line 942
	nop	
$SC1244:
; Line 943
	call	_ChangeHUDFilter
; Line 944
	jmp	$SB1085
$SC1264:
; Line 987
	xor	BYTE PTR _BackSeat,1
; Line 988
	mov	WORD PTR _View,0
; Line 989
	call	_LookUp
; Line 990
	jmp	$SB1085
	nop	
$SC1267:
; Line 997
	cmp	WORD PTR _Speedy,8
	jl	$JCC3617
	jmp	$SB1085
$JCC3617:
; Line 998
	inc	WORD PTR _Speedy
; Line 1000
	mov	ax,WORD PTR _FrameRate
	imul	WORD PTR _Speedy
	mov	cx,WORD PTR _Speedy
	dec	cx
	cwd	
	idiv	cx
	mov	WORD PTR _FrameRate,ax
	cmp	ax,15
	jg	$JCC3647
	jmp	$SB1085
$JCC3647:
	mov	WORD PTR _FrameRate,15
; Line 1001
; Line 1002
	jmp	$SB1085
; Line 1004
	nop	
$SC1270:
; Line 1005
	mov	ax,OFFSET DGROUP:$SG1271
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 1006
	mov	ax,10
	push	ax
	mov	cx,OFFSET DGROUP:_ntmp
	push	cx
	push	WORD PTR _FrameRate10
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 1007
	mov	ax,OFFSET DGROUP:$SG1272
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 1008
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	push	WORD PTR _FTicks
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 1009
	sub	ax,ax
$L20086:
	push	ax
	mov	ax,OFFSET _Txt
	jmp	$L20073
; Line 1012
	nop	
$SC1273:
;	free = -8
;	total = -10
; Line 1015
	mov	ax,OFFSET DGROUP:$SG1276
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 1016
	call	FAR PTR _AvailSysMem
	mov	WORD PTR [bp-8],ax	;free
; Line 1017
	mov	ax,10
	push	ax
	mov	cx,OFFSET DGROUP:_ntmp
	push	cx
	mov	dx,WORD PTR [bp-8]	;free
	sub	bx,bx
	shl	dx,1
	rcl	bx,1
	shl	dx,1
	rcl	bx,1
	shl	dx,1
	rcl	bx,1
	shl	dx,1
	rcl	bx,1
	push	bx
	push	dx
	call	_ltoa
	add	sp,8
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 1018
	mov	ax,1
	push	ax
	mov	cx,OFFSET _Txt
	push	cx
	call	_Message
	add	sp,4
; Line 1020
	lea	ax,WORD PTR [bp-10]	;total
	push	ax
	lea	cx,WORD PTR [bp-8]	;free
	push	cx
	call	_EMSpages
	add	sp,4
; Line 1021
	mov	ax,OFFSET DGROUP:$SG1278
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 1022
	mov	ax,10
	push	ax
	mov	cx,OFFSET DGROUP:_ntmp
	push	cx
	mov	ax,WORD PTR [bp-8]	;free
	sub	dx,dx
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	_ltoa
	add	sp,8
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 1023
	mov	ax,OFFSET DGROUP:$SG1279
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 1024
	mov	ax,10
	push	ax
	mov	ax,OFFSET DGROUP:_ntmp
	push	ax
	mov	ax,WORD PTR [bp-10]	;total
	sub	dx,dx
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	_ltoa
	add	sp,8
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_strcat
	add	sp,4
; Line 1025
	mov	ax,1
	jmp	$L20086
; Line 1029
$SC1280:
; Line 1030
	sub	ax,ax
	push	ax
	call	_EndGame
	add	sp,2
; Line 1031
	mov	BYTE PTR _ExitCode,0
; Line 1032
	jmp	$SB1085
; Line 1034
	nop	
$SC1281:
; Line 1036
	xor	BYTE PTR _Status+1,16
	test	BYTE PTR _Status+1,16
	je	$I1282
; Line 1037
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	ax
	push	WORD PTR _Alt
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	ax
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	mov	ax,-1
	push	ax
	mov	ax,39
	jmp	$L20097
	nop	
$I1282:
; Line 1039
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	ax
	push	WORD PTR _Alt
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	ax
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	mov	ax,-1
	push	ax
	mov	ax,40
	jmp	$L20097
	nop	
$S1084:
	cmp	ax,561
	jne	$JCC4147
	jmp	$SC1145
$JCC4147:
	ja	$L20015
	dec	ax
	cmp	ax,27
	jbe	$JCC4158
	jmp	$SB1085
$JCC4158:
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20016[bx]
	nop	
$L20016:
		DW	$SC1212
		DW	$SC1213
		DW	$SC1214
		DW	$SC1215
		DW	$SC1239
		DW	$SC1240
		DW	$SC1242
		DW	$SC1243
		DW	$SC1244
		DW	$SB1085
		DW	$SB1085
		DW	$SB1085
		DW	$SB1085
		DW	$SB1085
		DW	$SB1085
		DW	$SB1085
		DW	$SB1085
		DW	$SB1085
		DW	$SB1085
		DW	$SB1085
		DW	$SB1085
		DW	$SB1085
		DW	$SB1085
		DW	$SB1085
		DW	$SB1085
		DW	$SB1085
		DW	$SB1085
		DW	$SB1085
$L20015:
	cmp	ax,7681
	jne	$JCC4231
	jmp	$SC1210
$JCC4231:
	jbe	$JCC4236
	jmp	$L20017
$JCC4236:
	cmp	ax,4439
	jne	$JCC4244
	jmp	$SC1122
$JCC4244:
	jbe	$JCC4249
	jmp	$L20018
$JCC4249:
	cmp	ax,2617
	jne	$JCC4257
	jmp	$SC1168
$JCC4257:
	ja	$L20019
	cmp	ax,1589
	jne	$JCC4267
	jmp	$SC1158
$JCC4267:
	ja	$L20020
	sub	ax,818
	jne	$JCC4277
	jmp	$SC1149
$JCC4277:
	sub	ax,257
	jne	$JCC4285
	jmp	$SC1152
$JCC4285:
	sub	ax,257
	jne	$JCC4293
	jmp	$SC1155
$JCC4293:
	jmp	$SB1085
	nop	
$L20020:
	sub	ax,1846
	jne	$JCC4305
	jmp	$SC1162
$JCC4305:
	sub	ax,257
	jne	$JCC4313
	jmp	$SC1164
$JCC4313:
	sub	ax,257
	jne	$JCC4321
	jmp	$SC1166
$JCC4321:
	jmp	$SB1085
	nop	
$L20019:
	cmp	ax,3371
	jne	$JCC4333
	jmp	$SC1093
$JCC4333:
	ja	$L20021
	sub	ax,2864
	jne	$JCC4343
	jmp	$SC1169
$JCC4343:
	sub	ax,253
	jne	$JCC4351
	jmp	$SC1088
$JCC4351:
	sub	ax,50
	jne	$JCC4359
	jmp	$SC1094
$JCC4359:
	jmp	$SB1085
	nop	
$L20021:
	sub	ax,3389
	jne	$JCC4371
	jmp	$SC1090
$JCC4371:
	sub	ax,203
	jne	$JCC4379
	jmp	$SC1230
$JCC4379:
	sub	ax,504
	jne	$JCC4387
	jmp	$SC1280
$JCC4387:
	sub	ax,17
	jne	$JCC4395
	jmp	$SC1205
$JCC4395:
	jmp	$SB1085
	nop	
$L20018:
	cmp	ax,5236
	jne	$JCC4407
	jmp	$L20090
$JCC4407:
	ja	$L20022
	cmp	ax,4882
	jne	$JCC4417
	jmp	$SC1223
$JCC4417:
	ja	$L20023
	sub	ax,4613
	jne	$JCC4427
	jmp	$SC1220
$JCC4427:
	sub	ax,64
	jne	$JCC4435
	jmp	$SC1124
$JCC4435:
	sub	ax,32
	jne	$JCC4443
	jmp	$SC1120
$JCC4443:
	jmp	$SB1085
	nop	
$L20023:
	sub	ax,4946
	jne	$JCC4455
	jmp	$SC1187
$JCC4455:
	sub	ax,32
	jne	$JCC4463
	jmp	$SC1203
$JCC4463:
	sub	ax,142
	jne	$JCC4471
	jmp	$SC1281
$JCC4471:
	sub	ax,84
	jne	$JCC4479
	jmp	$SC1267
$JCC4479:
	jmp	$SB1085
	nop	
$L20022:
	cmp	ax,6747
	jne	$JCC4491
	jmp	$SC1200
$JCC4491:
	ja	$L20024
	sub	ax,5993
	jne	$JCC4501
	jmp	$SC1226
$JCC4501:
	sub	ax,487
	jne	$JCC4509
	jmp	$SC1196
$JCC4509:
	sub	ax,32
	jne	$JCC4517
	jmp	$SC1130
$JCC4517:
	jmp	$SB1085
	nop	
$L20024:
	sub	ax,7005
	jne	$JCC4529
	jmp	$SC1198
$JCC4529:
	sub	ax,30
	jne	$JCC4537
	jmp	$SC1201
$JCC4537:
	dec	ax
	dec	ax
	jne	$JCC4544
	jmp	$SC1201
$JCC4544:
	sub	ax,643
	jne	$JCC4552
	jmp	$SC1114
$JCC4552:
	jmp	$SB1085
$L20017:
	cmp	ax,11640
	jne	$JCC4563
	jmp	$SC1184
$JCC4563:
	jbe	$JCC4568
	jmp	$L20025
$JCC4568:
	cmp	ax,8807
	jne	$JCC4576
	jmp	$SC1101
$JCC4576:
	ja	$L20026
	cmp	ax,8196
	jne	$JCC4586
	jmp	$SC1228
$JCC4586:
	ja	$L20027
	sub	ax,7777
	jne	$JCC4596
	jmp	$SC1091
$JCC4596:
	sub	ax,242
	jne	$JCC4604
	jmp	$SC1192
$JCC4604:
	sub	ax,32
	jne	$JCC4612
	jmp	$SC1188
$JCC4612:
	jmp	$SB1085
	nop	
	nop	
$L20027:
	sub	ax,8448
	jne	$JCC4625
	jmp	$SC1270
$JCC4625:
	sub	ax,6
	jne	$JCC4633
	jmp	$SC1225
$JCC4633:
	sub	ax,96
	jne	$JCC4641
	jmp	$SC1139
$JCC4641:
	jmp	$SB1085
	nop	
$L20026:
	cmp	ax,9728
	jne	$JCC4653
	jmp	$SC1194
$JCC4653:
	ja	$L20028
	sub	ax,9290
	jne	$JCC4663
	jmp	$SC1178
$JCC4663:
	sub	ax,32
	jne	$JCC4671
	jmp	$SC1142
$JCC4671:
	sub	ax,257
	jne	$JCC4679
	jmp	$SC1218
$JCC4679:
	jmp	$SB1085
	nop	
$L20028:
	sub	ax,9740
	jne	$JCC4691
	jmp	$SC1118
$JCC4691:
	sub	ax,96
	jne	$JCC4699
	jmp	$SC1216
$JCC4699:
	sub	ax,443
	jne	$JCC4707
	jmp	$SC1264
$JCC4707:
	sub	ax,1107
	jne	$JCC4715
	jmp	$SC1181
$JCC4715:
	jmp	$SB1085
	nop	
$L20025:
	cmp	ax,18688
	jne	$JCC4727
	jmp	$SC1223
$JCC4727:
	ja	$L20029
	cmp	ax,12800
	jne	$JCC4737
	jmp	$SC1273
$JCC4737:
	ja	$L20030
	sub	ax,11875
	jne	$JCC4747
	jmp	$SC1141
$JCC4747:
	sub	ax,275
	jne	$JCC4755
	jmp	$SC1092
$JCC4755:
	sub	ax,236
	jne	$JCC4763
	jmp	$SC1095
$JCC4763:
	jmp	$SB1085
	nop	
$L20030:
	sub	ax,12909
	jne	$JCC4775
	jmp	$SC1144
$JCC4775:
	sub	ax,1715
	jne	$JCC4783
	jmp	$SC1136
$JCC4783:
	sub	ax,3552
	jne	$JCC4791
	jmp	$SC1220
$JCC4791:
	sub	ax,256
	jne	$JCC4799
	jmp	$SC1174
$JCC4799:
	jmp	$SB1085
	nop	
$L20029:
	cmp	ax,20480
	jne	$JCC4811
	jmp	$SC1176
$JCC4811:
	ja	$L20031
	sub	ax,19200
	jne	$JCC4821
	jmp	$SC1170
$JCC4821:
	sub	ax,512
	jne	$JCC4829
	jmp	$SC1172
$JCC4829:
	sub	ax,512
	jne	$JCC4837
	jmp	$SC1228
$JCC4837:
	jmp	$SB1085
	nop	
$L20031:
	sub	ax,20736
	jne	$JCC4849
	jmp	$SC1225
$JCC4849:
	sub	ax,256
	jne	$JCC4857
	jmp	$SC1205
$JCC4857:
	sub	ax,256
	jne	$JCC4865
	jmp	$SC1210
$JCC4865:
	sub	ax,-21503
	jne	$JCC4873
	jmp	$SC1232
$JCC4873:
	jmp	$SB1085
; Line 1045
	nop	
$SC1289:
; Line 1046
	cmp	WORD PTR _TimeOfDay,4
	jae	$I1290
	mov	WORD PTR _TimeOfDay,1435
; Line 1047
$I1290:
; Line 1048
	push	WORD PTR _TransAmount
	push	WORD PTR _SelectedPal
	sub	WORD PTR _TimeOfDay,5
	mov	ax,WORD PTR _TimeOfDay
	mov	cx,60
	sub	dx,dx
	div	cx
	push	ax
	mov	ax,OFFSET DGROUP:$SG1291
$L20087:
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	call	_sprintf
	add	sp,10
; Line 1049
	mov	ax,OFFSET _Txt
	push	ax
	call	_mprintf
	add	sp,2
; Line 1050
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1052
$SC1293:
; Line 1054
	add	WORD PTR _TimeOfDay,5
	cmp	WORD PTR _TimeOfDay,1440
	jb	$I1294
	mov	ax,WORD PTR _TimeOfDay
	sub	ax,1440
	mov	WORD PTR _TimeOfDay,ax
; Line 1055
$I1294:
	push	WORD PTR _TransAmount
	push	WORD PTR _SelectedPal
	mov	ax,WORD PTR _TimeOfDay
	mov	cx,60
	sub	dx,dx
	div	cx
	push	ax
	mov	ax,OFFSET DGROUP:$SG1295
	jmp	SHORT $L20087
; Line 1059
$SC1296:
; Line 1060
	call	_Help
; Line 1061
	call	_ReArmWingman
; Line 1062
	sub	ax,ax
	push	ax
	call	_JetisonSwitch
	add	sp,2
; Line 1063
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	push	ax
	push	ax
	push	WORD PTR _Alt
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	ax
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	mov	ax,-1
	push	ax
	mov	ax,35
	push	ax
	call	_LogIt
	add	sp,24
; Line 1064
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1066
	nop	
$SC1299:
; Line 1067
	mov	ax,256
	cwd	
	mov	cl,BYTE PTR _Mscale
	or	cl,cl
	je	$L20033
$L20032:
	shl	ax,1
	rcl	dx,1
	dec	cl
	jne	$L20032
$L20033:
	add	WORD PTR _PyLng,ax
	adc	WORD PTR _PyLng+2,dx
; Line 1068
	mov	ax,-256
	cwd	
	mov	cl,BYTE PTR _Mscale
	or	cl,cl
	je	$L20035
$L20034:
	shl	ax,1
	rcl	dx,1
	dec	cl
	jne	$L20034
$L20035:
	push	dx
	push	ax
	sub	ax,ax
	push	ax
$L20088:
	push	ax
	call	_SlewOurWingmen
	add	sp,8
; Line 1069
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1070
	nop	
$SC1301:
; Line 1071
	mov	ax,-256
	cwd	
	mov	cl,BYTE PTR _Mscale
	or	cl,cl
	je	$L20037
$L20036:
	shl	ax,1
	rcl	dx,1
	dec	cl
	jne	$L20036
$L20037:
	add	WORD PTR _PyLng,ax
	adc	WORD PTR _PyLng+2,dx
; Line 1072
	mov	ax,256
	cwd	
	mov	cl,BYTE PTR _Mscale
	or	cl,cl
	je	$L20035
$L20038:
	shl	ax,1
	rcl	dx,1
	dec	cl
	jne	$L20038
	jmp	SHORT $L20035
; Line 1074
$SC1302:
; Line 1075
	mov	ax,-256
	cwd	
	mov	cl,BYTE PTR _Mscale
	or	cl,cl
	je	$L20041
$L20040:
	shl	ax,1
	rcl	dx,1
	dec	cl
	jne	$L20040
$L20041:
	add	WORD PTR _PxLng,ax
	adc	WORD PTR _PxLng+2,dx
; Line 1076
	sub	cx,cx
	push	cx
	push	cx
	push	dx
	jmp	SHORT $L20088
; Line 1078
	nop	
$SC1303:
; Line 1079
	mov	ax,256
	cwd	
	mov	cl,BYTE PTR _Mscale
$L20089:
	or	cl,cl
	je	$L20041
	shl	ax,1
	rcl	dx,1
	dec	cl
	jmp	SHORT $L20089
$L20044:
	sub	ax,11776
	je	$SC1303
	sub	ax,21504
	jne	$JCC5246
	jmp	$SC1289
$JCC5246:
	sub	ax,256
	jne	$JCC5254
	jmp	$SC1293
$JCC5254:
$SB1286:
; Line 1083
; Line 1084
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_Cmds	ENDP
; Line 1089
	PUBLIC	_LocalCmds
_LocalCmds	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 1093
	sub	ax,ax
	mov	WORD PTR _tempvar,ax
	mov	WORD PTR _behavecommands,ax
; Line 1094
	cmp	WORD PTR _PauseHit,ax
	je	$I1307
; Line 1095
	call	_PauseMode
; Line 1096
; Line 1097
$I1307:
	mov	WORD PTR _PauseHit,0
; Line 1099
	test	BYTE PTR _View,128
	jne	$I1309
	cmp	WORD PTR _KEYPRINT,11386
	je	$I1310
	cmp	WORD PTR _KEYPRINT,11640
	jne	$I1309
$I1310:
; Line 1100
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 1102
$I1309:
	mov	ax,WORD PTR _KEYPRINT
	cmp	ax,18745
	jne	$JCC5332
	jmp	$SC1341
$JCC5332:
	jbe	$JCC5337
	jmp	$L20045
$JCC5337:
	cmp	ax,13615
	jne	$JCC5345
	jmp	$SC1353
$JCC5345:
	jbe	$JCC5350
	jmp	$L20046
$JCC5350:
	cmp	ax,9064
	je	$SC1325
	jbe	$JCC5360
	jmp	$L20047
$JCC5360:
	sub	ax,283
	je	$SC1315
	sub	ax,6117
	je	$SC1317
	sub	ax,1892
	je	$SC1327
	sub	ax,676
	je	$SC1322
	sub	ax,64
	je	$SC1324
	jmp	SHORT $I1310
; Line 1103
$SC1315:
; Line 1104
	call	_MainMenu
; Line 1105
	jmp	$SB1312
; Line 1107
$SC1317:
; Line 1109
	mov	ax,6
	push	ax
	mov	ax,OFFSET DGROUP:$SG1318
	push	ax
	call	_Message
	add	sp,4
; Line 1110
	mov	WORD PTR _PauseHit,1
; Line 1111
	jmp	$SB1312
; Line 1113
	nop	
$SC1319:
; Line 1114
	call	_AdjustSounds
; Line 1115
	jmp	$SB1312
; Line 1117
$SC1321:
; Line 1118
	xor	BYTE PTR _LIGHTS,1
; Line 1119
	jmp	$SB1312
; Line 1121
$SC1322:
; Line 1122
	mov	ax,2
$L20104:
	push	ax
	call	_ChangeHUDColor
$L20103:
	add	sp,2
; Line 1123
	jmp	$SB1312
; Line 1125
	nop	
$SC1324:
; Line 1126
	mov	ax,-2
	jmp	SHORT $L20104
; Line 1129
	nop	
$SC1325:
; Line 1130
	mov	ax,WORD PTR _HookDown
	xor	al,1
	push	ax
	call	_SetHook
	jmp	SHORT $L20103
; Line 1133
	nop	
$SC1327:
; Line 1134
	xor	BYTE PTR _DeClutter,1
; Line 1135
	jmp	$SB1312
; Line 1137
$SC1328:
; Line 1138
	mov	WORD PTR _View,0
; Line 1139
	call	_LookUp
; Line 1140
	jmp	$SB1312
; Line 1141
$SC1329:
; Line 1142
	mov	WORD PTR _View,70
; Line 1143
	jmp	$SB1312
; Line 1144
	nop	
$SC1330:
; Line 1145
	mov	WORD PTR _View,208
; Line 1146
	jmp	$SB1312
; Line 1147
	nop	
$SC1331:
; Line 1148
	mov	WORD PTR _View,207
; Line 1149
	jmp	$SB1312
; Line 1150
	nop	
$SC1332:
; Line 1151
	mov	WORD PTR _View,201
; Line 1152
	jmp	$SB1312
; Line 1153
	nop	
$SC1333:
; Line 1154
	mov	WORD PTR _View,72
; Line 1155
	jmp	$SB1312
; Line 1156
	nop	
$SC1334:
; Line 1157
	call	_NewMissileView
; Line 1158
	jmp	$SB1312
; Line 1159
$SC1336:
; Line 1160
	mov	ax,71
	push	ax
	call	_NewLockView
	jmp	SHORT $L20103
; Line 1162
	nop	
$SC1338:
; Line 1163
	mov	ax,203
$L20105:
	push	ax
	call	_NewTacView
	jmp	SHORT $L20103
; Line 1165
	nop	
$SC1340:
; Line 1166
	mov	ax,204
	jmp	SHORT $L20105
; Line 1169
	nop	
$SC1341:
; Line 1178
	call	_ProcessCoolyCmds
; Line 1179
	jmp	$SB1312
; Line 1180
$SC1343:
; Line 1181
	cmp	WORD PTR _RudderStick,0
	je	$JCC5581
	jmp	$SB1312
$JCC5581:
; Line 1182
; Line 1183
	cmp	WORD PTR _RUDDERVALS,0
	jg	$L20107
	mov	ax,WORD PTR _RUDDERVALS
	sub	ax,8
	cmp	ax,-127
	jg	$JCC5602
	jmp	$SB1312
$JCC5602:
; Line 1186
$L20108:
	mov	WORD PTR _RUDDERVALS,ax
; Line 1187
; Line 1188
; Line 1189
	jmp	$SB1312
; Line 1191
	nop	
$SC1348:
; Line 1192
	cmp	WORD PTR _RudderStick,0
	je	$JCC5619
	jmp	$SB1312
$JCC5619:
; Line 1193
; Line 1194
	cmp	WORD PTR _RUDDERVALS,0
	jge	$I1350
; Line 1195
$L20107:
	mov	WORD PTR _RUDDERVALS,0
; Line 1196
	jmp	$SB1312
$I1350:
	mov	ax,WORD PTR _RUDDERVALS
	add	ax,8
	cmp	ax,127
	jl	$JCC5649
	jmp	$SB1312
$JCC5649:
	jmp	SHORT $L20108
; Line 1202
$SC1353:
; Line 1203
	call	_RioMap
; Line 1204
	jmp	$SB1312
; Line 1206
$SC1355:
; Line 1207
	dec	WORD PTR _vScale
; Line 1208
	jmp	$SB1312
; Line 1209
	nop	
$SC1356:
; Line 1210
	inc	WORD PTR _vScale
; Line 1211
	jmp	$SB1312
; Line 1215
	nop	
$SC1357:
; Line 1225
	mov	ax,WORD PTR _KEYPRINT
	sub	ax,26624
	mov	al,ah
	sub	ah,ah
	inc	ax
$L20106:
	mov	WORD PTR _behavecommands,ax
; Line 1226
	jmp	$SB1312
; Line 1228
	nop	
$SC1358:
; Line 1238
	mov	ax,WORD PTR _KEYPRINT
	sub	ax,21504
	mov	al,ah
	sub	ah,ah
	add	ax,11
	jmp	SHORT $L20106
; Line 1240
	nop	
$L20047:
	cmp	ax,11640
	je	$SC1356
	ja	$L20048
	sub	ax,9804
	jne	$JCC5722
	jmp	$SC1321
$JCC5722:
	sub	ax,1582
	je	$SC1355
	jmp	$I1310
	nop	
$L20048:
	sub	ax,12032
	jne	$JCC5739
	jmp	$SC1319
$JCC5739:
	sub	ax,1068
	jne	$JCC5747
	jmp	$SC1343
$JCC5747:
	sub	ax,258
	jne	$JCC5755
	jmp	$SC1348
$JCC5755:
	jmp	$I1310
	nop	
$L20046:
	cmp	ax,18231
	jne	$JCC5767
	jmp	$SC1341
$JCC5767:
	cmp	ax,18488
	jne	$JCC5775
	jmp	$SC1341
$JCC5775:
	sub	ax,15104
	test	al,255
	je	$JCC5785
	jmp	$I1310
$JCC5785:
	mov	cl,7
	shr	ax,cl
	cmp	ax,18
	jbe	$JCC5797
	jmp	$I1310
$JCC5797:
	xchg	ax,bx
	jmp	WORD PTR cs:$L20049[bx]
$L20049:
		DW	$SC1328
		DW	$SC1329
		DW	$SC1330
		DW	$SC1331
		DW	$SC1332
		DW	$SC1333
		DW	$SC1334
		DW	$SC1336
		DW	$SC1338
		DW	$SC1340
$L20045:
	cmp	ax,23040
	jne	$JCC5831
	jmp	$SC1358
$JCC5831:
	ja	$L20050
	cmp	ax,20787
	jne	$JCC5841
	jmp	$SC1341
$JCC5841:
	ja	$L20051
	sub	ax,19252
	jne	$JCC5851
	jmp	$SC1341
$JCC5851:
	sub	ax,257
	jne	$JCC5859
	jmp	$SC1341
$JCC5859:
	sub	ax,257
	jne	$JCC5867
	jmp	$SC1341
$JCC5867:
	sub	ax,507
	jne	$JCC5875
	jmp	$SC1341
$JCC5875:
	sub	ax,257
	jne	$JCC5883
	jmp	$SC1341
$JCC5883:
	jmp	$I1310
	nop	
$L20051:
	sub	ax,21504
	test	al,255
	je	$JCC5897
	jmp	$I1310
$JCC5897:
	mov	cl,7
	shr	ax,cl
	cmp	ax,10
	jbe	$JCC5909
	jmp	$I1310
$JCC5909:
	xchg	ax,bx
	jmp	WORD PTR cs:$L20052[bx]
$L20052:
		DW	$SC1358
		DW	$SC1358
		DW	$SC1358
		DW	$SC1358
		DW	$SC1358
		DW	$SC1358
$L20050:
	sub	ax,23296
	test	al,255
	je	$JCC5937
	jmp	$I1310
$JCC5937:
	mov	cl,7
	shr	ax,cl
	cmp	ax,44
	jbe	$JCC5949
	jmp	$I1310
$JCC5949:
	xchg	ax,bx
	jmp	WORD PTR cs:$L20053[bx]
$L20053:
		DW	$SC1358
		DW	$SC1358
		DW	$SC1358
		DW	$I1310
		DW	$I1310
		DW	$I1310
		DW	$I1310
		DW	$I1310
		DW	$I1310
		DW	$I1310
		DW	$I1310
		DW	$I1310
		DW	$I1310
		DW	$SC1357
		DW	$SC1357
		DW	$SC1357
		DW	$SC1357
		DW	$SC1357
		DW	$SC1357
		DW	$SC1357
		DW	$SC1357
		DW	$SC1357
		DW	$SC1357
$SB1312:
; Line 1242
	mov	WORD PTR _KEYPRINT,0
; Line 1243
	mov	sp,bp
	pop	bp
	ret	

_LocalCmds	ENDP
; Line 1247
	PUBLIC	_ProcessCoolyCmds
_ProcessCoolyCmds	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 1250
	cmp	WORD PTR _View,201
	je	$I1362
	cmp	WORD PTR _View,203
	je	$I1362
	cmp	WORD PTR _View,204
	je	$I1362
	cmp	WORD PTR _View,207
	je	$I1362
	cmp	WORD PTR _View,205
	jne	$I1361
$I1362:
; Line 1251
	call	_UpdateSteadyAngles
; Line 1253
	jmp	SHORT $I1370
$I1361:
	cmp	WORD PTR _View,72
	jne	$I1365
; Line 1254
	call	_UpdatePadlockAngles
; Line 1256
	jmp	SHORT $I1370
$I1365:
	cmp	WORD PTR _BackSeat,0
	je	$I1368
; Line 1257
	call	_BackSeatCoolyCmds
; Line 1259
	jmp	SHORT $I1370
$I1368:
; Line 1260
	call	_FrontSeatCoolyCmds
; Line 1261
$I1370:
; Line 1263
	mov	WORD PTR _KEYPRINT,0
; Line 1264
	ret	

_ProcessCoolyCmds	ENDP
; Line 1268
	PUBLIC	_FrontSeatCoolyCmds
_FrontSeatCoolyCmds	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 1269
	mov	ax,WORD PTR _KEYPRINT
	cmp	ax,19766
	je	$SC1382
	ja	$L20054
	sub	ax,18488
	je	$SC1377
	sub	ax,764
	je	$SC1383
	sub	ax,257
	jne	$SB1374
; Line 1270
$SC1377:
; Line 1271
	mov	WORD PTR _View,0
; Line 1272
	call	_LookUp
; Line 1273
	jmp	SHORT $SB1374
; Line 1275
	nop	
$SC1378:
; Line 1276
	mov	WORD PTR _View,3
; Line 1277
	call	_LookDown
; Line 1278
	ret	
; Line 1280
$SC1380:
; Line 1281
	mov	WORD PTR _View,4
; Line 1282
	ret	
; Line 1284
	nop	
$SC1381:
; Line 1285
	mov	WORD PTR _View,5
; Line 1286
	ret	
; Line 1288
	nop	
$SC1382:
; Line 1289
	mov	WORD PTR _View,2
; Line 1290
	ret	
; Line 1292
	nop	
$SC1383:
; Line 1293
	mov	WORD PTR _View,1
; Line 1294
	ret	
	nop	
$L20054:
	sub	ax,20273
	je	$SC1380
	sub	ax,257
	je	$SC1378
	sub	ax,257
	je	$SC1381
$SB1374:
; Line 1302
	ret	

_FrontSeatCoolyCmds	ENDP
; Line 1306
	PUBLIC	_BackSeatCoolyCmds
_BackSeatCoolyCmds	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 1307
	mov	ax,WORD PTR _KEYPRINT
	cmp	ax,19766
	je	$SC1394
	ja	$L20055
	sub	ax,18488
	je	$SC1390
	sub	ax,764
	je	$SC1395
	sub	ax,257
	jne	$SB1387
; Line 1308
$SC1390:
; Line 1309
	mov	WORD PTR _View,0
; Line 1310
	jmp	SHORT $SB1387
; Line 1311
$SC1391:
; Line 1312
	mov	WORD PTR _View,3
; Line 1313
	ret	
; Line 1314
	nop	
$SC1392:
; Line 1315
	mov	WORD PTR _View,4
; Line 1316
	ret	
; Line 1317
	nop	
$SC1393:
; Line 1318
	mov	WORD PTR _View,5
; Line 1319
	ret	
; Line 1320
	nop	
$SC1394:
; Line 1321
	mov	WORD PTR _View,2
; Line 1322
	ret	
; Line 1323
	nop	
$SC1395:
; Line 1324
	mov	WORD PTR _View,1
; Line 1325
	ret	
	nop	
$L20055:
	sub	ax,20273
	je	$SC1392
	sub	ax,257
	je	$SC1391
	sub	ax,257
	je	$SC1393
$SB1387:
; Line 1330
	ret	

_BackSeatCoolyCmds	ENDP
; Line 1334
	PUBLIC	_UpdateSteadyAngles
_UpdateSteadyAngles	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 1335
	mov	ax,WORD PTR _KEYPRINT
	sub	ax,18488
	je	$SC1402
	sub	ax,764
	je	$SC1404
	sub	ax,257
	je	$SC1406
	sub	ax,257
	je	$SC1405
	sub	ax,764
	je	$SC1403
	jmp	SHORT $SB1399
; Line 1336
	nop	
$SC1402:
; Line 1337
	sub	WORD PTR _SteadyPitch,512
; Line 1338
$SB1399:
; Line 1358
	push	WORD PTR _SteadyPitch
	call	_abs
	add	sp,2
	cmp	ax,15360
	jle	$I1407
; Line 1359
	cmp	WORD PTR _SteadyPitch,0
	jle	$L20056
	mov	ax,15360
	jmp	SHORT $L20057
; Line 1340
	nop	
$SC1403:
; Line 1341
	add	BYTE PTR _SteadyPitch+1,2
; Line 1342
	jmp	SHORT $SB1399
; Line 1344
	nop	
$SC1404:
; Line 1345
	sub	WORD PTR _SteadyHead,1024
; Line 1346
	jmp	SHORT $SB1399
; Line 1348
$SC1405:
; Line 1349
	add	BYTE PTR _SteadyHead+1,4
; Line 1350
	jmp	SHORT $SB1399
; Line 1352
	nop	
$SC1406:
; Line 1354
	sub	ax,ax
	mov	WORD PTR _SteadyHead,ax
	mov	WORD PTR _SteadyPitch,ax
; Line 1355
	jmp	SHORT $SB1399
$L20056:
	mov	ax,-15360
$L20057:
	mov	WORD PTR _SteadyPitch,ax
; Line 1360
; Line 1361
$I1407:
	ret	
	nop	

_UpdateSteadyAngles	ENDP
; Line 1365
	PUBLIC	_UpdatePadlockAngles
_UpdatePadlockAngles	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 1366
	mov	ax,WORD PTR _KEYPRINT
	sub	ax,18488
	je	$SC1413
	sub	ax,764
	je	$SC1415
	sub	ax,257
	je	$SC1419
	sub	ax,257
	je	$SC1417
	sub	ax,764
	je	$SC1414
	jmp	SHORT $SB1410
; Line 1367
	nop	
$SC1413:
; Line 1368
	sub	WORD PTR _PadPitch,512
; Line 1369
$SB1410:
; Line 1391
	push	WORD PTR _PadPitch
	call	_abs
	add	sp,2
	cmp	ax,15360
	jle	$I1420
; Line 1392
	cmp	WORD PTR _PadPitch,0
	jle	$L20058
	mov	ax,15360
	jmp	SHORT $L20059
; Line 1371
	nop	
$SC1414:
; Line 1372
	add	BYTE PTR _PadPitch+1,2
; Line 1373
	jmp	SHORT $SB1410
; Line 1375
	nop	
$SC1415:
; Line 1377
	sub	WORD PTR _PadHead,1024
	cmp	WORD PTR _PadHead,-27648
	jge	$SB1410
	mov	WORD PTR _PadHead,27648
; Line 1378
	jmp	SHORT $SB1410
; Line 1380
$SC1417:
; Line 1382
	add	BYTE PTR _PadHead+1,4
	cmp	WORD PTR _PadHead,27648
	jle	$SB1410
	mov	WORD PTR _PadHead,-27648
; Line 1383
	jmp	SHORT $SB1410
; Line 1385
	nop	
$SC1419:
; Line 1387
	sub	ax,ax
	mov	WORD PTR _PadHead,ax
	mov	WORD PTR _PadPitch,ax
; Line 1388
	jmp	SHORT $SB1410
$L20058:
	mov	ax,-15360
$L20059:
	mov	WORD PTR _PadPitch,ax
; Line 1393
; Line 1394
$I1420:
	ret	
	nop	

_UpdatePadlockAngles	ENDP
; Line 1398
	PUBLIC	_PauseMode
_PauseMode	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	z = -2
; Line 1401
	mov	ax,6
	push	ax
	call	FAR PTR _SndSounds
	add	sp,2
; Line 1403
$D1423:
; Line 1404
	call	_kbhit
	or	ax,ax
	je	$D1423
; Line 1405
	sub	ax,ax
	push	ax
	call	__bios_keybrd
	add	sp,2
	cmp	ax,6400
	je	$D1423
; Line 1407
	mov	ax,7
	push	ax
	call	FAR PTR _SndSounds
	add	sp,2
; Line 1409
	cmp	WORD PTR _MyMSGTYP,6
	jne	$I1430
; Line 1410
	cmp	WORD PTR _msgtime,0
	je	$I1430
; Line 1411
	call	FAR PTR _GETTIME
	sub	ax,60
	mov	WORD PTR _msgtime,ax
; Line 1412
$I1430:
; Line 1413
	mov	sp,bp
	pop	bp
	ret	
	nop	

_PauseMode	ENDP
; Line 1418
	PUBLIC	_NoAccel
_NoAccel	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 1419
	cmp	WORD PTR _Speedy,1
	je	$I1432
; Line 1421
	mov	ax,WORD PTR _FrameRate
	cwd	
	idiv	WORD PTR _Speedy
	mov	WORD PTR _FrameRate,ax
	cmp	ax,3
	jge	$I1433
	mov	WORD PTR _FrameRate,3
; Line 1422
$I1433:
	mov	WORD PTR _Speedy,1
; Line 1423
; Line 1424
$I1432:
	ret	
	nop	

_NoAccel	ENDP
; Line 1429
	PUBLIC	_KBInit
_KBInit	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
; Line 1430
	jmp	SHORT $L20111
$FC1438:
	call	_getch
$L20111:
	call	_kbhit
	or	ax,ax
	jne	$FC1438
; Line 1432
	sub	bx,bx
	mov	es,bx
	mov	bx,1174
	test	BYTE PTR es:[bx],16
	je	$I1441
; Line 1433
; Line 1434
	mov	bx,1047
	mov	al,BYTE PTR es:[bx]
	mov	BYTE PTR _PoliticallyCorrectNumlock,al
; Line 1435
	or	BYTE PTR es:[bx],32
; Line 1436
; Line 1440
$I1441:
	mov	sp,bp
	pop	bp
	ret	

_KBInit	ENDP
; Line 1442
	PUBLIC	_PutNumLockBack
_PutNumLockBack	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 1443
	sub	bx,bx
	mov	es,bx
	mov	bx,1174
	test	BYTE PTR es:[bx],16
	je	$I1444
; Line 1444
; Line 1445
	mov	al,BYTE PTR _PoliticallyCorrectNumlock
	mov	bx,1047
	mov	BYTE PTR es:[bx],al
; Line 1446
; Line 1447
$I1444:
	ret	

_PutNumLockBack	ENDP
_TEXT	ENDS
END
