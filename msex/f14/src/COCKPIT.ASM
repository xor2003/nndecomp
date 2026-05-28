;	Static Name Aliases
;
;	$S923_OLDMM	EQU	OLDMM
;	$S924_OldFuel	EQU	OldFuel
;	$S925_OldThrust	EQU	OldThrust
;	$S926_OldLights	EQU	OldLights
;	$S927_OldEMIS	EQU	OldEMIS
;	$S928_OldMC	EQU	OldMC
;	$S993_lastview	EQU	lastview
;	$S1031_LastCur	EQU	LastCur
;	$S1039_FirstArm	EQU	FirstArm
;	$S1084_prevcaut	EQU	prevcaut
;	$S1159_prevstat	EQU	prevstat
;	$S1257_NumBars	EQU	NumBars
;	$S1258_SweepSize	EQU	SweepSize
;	$S1278_RANGES	EQU	RANGES
;	$S1336_RadarOn	EQU	RadarOn
;	$S1337_RadarMode	EQU	RadarMode
;	$S1338_PrevRadar	EQU	PrevRadar
;	$S1480_prevrot	EQU	prevrot
;	$S1620_tempflash	EQU	tempflash
	TITLE   C:\COCKPIT.C
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
COCKPIT5_DATA	SEGMENT  PARA PUBLIC 'FAR_DATA'
COCKPIT5_DATA	ENDS
DGROUP	GROUP	CONST, _BSS, _DATA
	ASSUME DS: DGROUP, SS: DGROUP
PUBLIC  _OutsideLength
PUBLIC  _RpCX1
PUBLIC  _RpCRT1
PUBLIC  _RpCX2
PUBLIC  _RpCRT2
PUBLIC  _RpCX3
PUBLIC  _RpCRT3
PUBLIC  _RpCX4
PUBLIC  _RpCRT4
PUBLIC  _RpCX5
PUBLIC  _RpCRT5
PUBLIC  _RpCX6
PUBLIC  _RpCRT6
PUBLIC  _RpCX7
PUBLIC  _RpCRT7
PUBLIC  _CrtRps
PUBLIC  _CrtConfig
PUBLIC  _CurCRT
PUBLIC  _MasterArmSW
PUBLIC  _JetisonSW
PUBLIC  _Lightemup
PUBLIC  _lighton
PUBLIC  _VdiMode
PUBLIC  _CockpitFiles
PUBLIC  _msiz
PUBLIC  _EgtL
PUBLIC  _EgtR
PUBLIC  _ls
PUBLIC  _Lengths
PUBLIC  _CockpitLights
PUBLIC  _RadarRange
PUBLIC  _MASTER_CAUTION
PUBLIC  _RadarRepeat
PUBLIC  _BackSeat
PUBLIC  _Panning
PUBLIC  _DeClutter
PUBLIC  _LLowFuelWarn
PUBLIC  _RLowFuelWarn
PUBLIC  _BingoFuelWarn
PUBLIC  _OutsideWidth
EXTRN	_TransRectCopy:NEAR
EXTRN	_MDiv:NEAR
EXTRN	_VdiCrt:NEAR
EXTRN	_FlirCopy:NEAR
EXTRN	_Rotate2D:NEAR
EXTRN	_scaley:NEAR
EXTRN	_ChangeHUDColor:NEAR
EXTRN	_DrawGunCameraView:NEAR
EXTRN	_MapInEMSSprite:NEAR
EXTRN	_ScaleRotate:NEAR
EXTRN	__fstrcpy:FAR
EXTRN	_DoTac:NEAR
EXTRN	_TAStoIAS:NEAR
EXTRN	_SndSounds:FAR
EXTRN	_DoTID:NEAR
EXTRN	_ACosB:NEAR
EXTRN	_ASinB:NEAR
EXTRN	_HsdCrt:NEAR
EXTRN	_DoDDD:NEAR
EXTRN	_DrawLine:FAR
EXTRN	_DoTAC:NEAR
EXTRN	_RectCopy:FAR
EXTRN	_TEWS_GFX:NEAR
EXTRN	_DrawDot:FAR
EXTRN	_AdiCrt:NEAR
EXTRN	_HUD:NEAR
EXTRN	_RpPrint:FAR
EXTRN	_MouseShow:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_DisplayBall:NEAR
EXTRN	_GunCameraZoom:NEAR
EXTRN	_ChangeColor:FAR
EXTRN	_ScreenOff:FAR
EXTRN	_strcat:NEAR
EXTRN	_ScreenOn:FAR
EXTRN	_LoadPicToPal:NEAR
EXTRN	_RectFill:FAR
EXTRN	_DisplayRioHead:NEAR
EXTRN	_AWG9_DEC_RANGE:NEAR
EXTRN	_AAGetStation:NEAR
EXTRN	_abs:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_MaskCopy:NEAR
EXTRN	_pstrlen:NEAR
EXTRN	_GetPlanePtr:NEAR
EXTRN	_AWG9_INC_RANGE:NEAR
EXTRN	_MouseSHOW:FAR
EXTRN	_ShowPage:FAR
EXTRN	_MouseHIDE:FAR
EXTRN	_UpdatePalBuf:NEAR
EXTRN	_DoPadLockView:NEAR
EXTRN	_itoa:NEAR
EXTRN	_MouseHide:NEAR
EXTRN	_BuildMask:NEAR
EXTRN	_BingoFuel:WORD
EXTRN	_LOCKED:WORD
EXTRN	_VVI:WORD
EXTRN	_LightsOn:WORD
EXTRN	_BEAM_PIT:WORD
EXTRN	_MsgOnScreen:WORD
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Txt:BYTE
EXTRN	_HookDown:WORD
EXTRN	_Damaged:WORD
EXTRN	_Gees:WORD
EXTRN	_Status:WORD
EXTRN	_Fuel:WORD
_BSS      SEGMENT
COMM NEAR	_RpCRT:	BYTE:	 2
COMM NEAR	_CrtDisplays:	 2:	 8
COMM NEAR	_CrtUpdate:	 2:	 8
_BSS      ENDS
EXTRN	_AWG9_SNIFF:WORD
EXTRN	_NextWayPoint:WORD
EXTRN	_PadLockee:WORD
EXTRN	_DifficultyLevel:WORD
EXTRN	_Speedy:WORD
EXTRN	_SNDDETAIL:WORD
EXTRN	_Rp1:WORD
EXTRN	_Rp2:WORD
_BSS      SEGMENT
COMM NEAR	_View:	BYTE:	 2
_BSS      ENDS
EXTRN	_Rp3D:WORD
EXTRN	_TDBRpX:BYTE
EXTRN	_WingRot:WORD
EXTRN	_MeatBall:WORD
EXTRN	_THRUST:WORD
EXTRN	_ThrustI:WORD
EXTRN	_LastSpike:WORD
EXTRN	_Knots:WORD
EXTRN	_LastMud:WORD
EXTRN	_ConfigData:BYTE
EXTRN	_ps:BYTE
COMM FAR	_VdiMask:	 2:	 250
EXTRN	_DataLink:WORD
COMM FAR	_AdiMask:	 2:	 170
EXTRN	_ClrTarg:WORD
COMM FAR	_LookDownLMask:	 2:	 130
EXTRN	_DesignateMode:WORD
COMM FAR	_LookDownRMask:	 2:	 105
EXTRN	_HighlightTarg:WORD
COMM FAR	_RawMask:	 2:	 185
EXTRN	_F14_STATION:BYTE
COMM FAR	_TopCockpitMask:	 2:	 2400
EXTRN	_ShowMouse:WORD
COMM FAR	_HsdMask:	 2:	 300
COMM FAR	_DDDMask:	 2:	 888
EXTRN	_Tscale:WORD
COMM FAR	_TIDMask:	 2:	 480
COMM FAR	_ElevMask:	 2:	 600
EXTRN	_PitchAngle:WORD
EXTRN	_MLAUNCH:WORD
_BSS      SEGMENT
COMM NEAR	_DAMAGELITE:	 2:	 16
_BSS      ENDS
EXTRN	_AIDETECT:WORD
EXTRN	_SELECTED_BAR_NUM:WORD
EXTRN	_OurAlt:WORD
EXTRN	_SELECTED_AZ:WORD
EXTRN	_AWG9_REALITY_LEVEL:WORD
EXTRN	_RadarAlt:DWORD
EXTRN	_AWG9_MODE:WORD
EXTRN	_OurHead:WORD
EXTRN	_REALFLIGHT:WORD
_DATA      SEGMENT
$SG858	DB	'cpft2.pic',  00H
$SG859	DB	'f14lft6.pic',  00H
$SG860	DB	'f14rt8.pic',  00H
$SG861	DB	'cpfd2.pic',  00H
$SG862	DB	'BG-c2.pic',  00H
$SG863	DB	'BG-c1.pic',  00H
$SG864	DB	'f14bac6.pic',  00H
$SG865	DB	'f14bl6.pic',  00H
$SG866	DB	'f14brt8.pic',  00H
$SG867	DB	'f14bac5b.pic',  00H
$SG868	DB	'RB-2L.PIC',  00H
$SG869	DB	'RB-2R.PIC',  00H
	ORG	$+451
$SG1010	DB	'TRNG',  00H
$SG1012	DB	'x',  00H
	ORG	$+9
$SG1097	DB	'PDSRCH - WIDE',  00H
$SG1099	DB	'PDSRCH - MED',  00H
$SG1101	DB	'PDSRCH - NRW',  00H
$SG1103	DB	'PDSRCH',  00H
$SG1105	DB	'RWS - WIDE',  00H
$SG1107	DB	'RWS - MED',  00H
$SG1109	DB	'RWS - NRW',  00H
$SG1111	DB	'RWS',  00H
$SG1113	DB	'TWSA - MED',  00H
$SG1115	DB	'TWSA - NRW',  00H
$SG1117	DB	'TWSA',  00H
$SG1119	DB	'TWSM - MED',  00H
$SG1121	DB	'TWSM - NRW',  00H
$SG1123	DB	'TWSM',  00H
$SG1125	DB	'SEARCH',  00H
$SG1127	DB	'TRACK',  00H
$SG1129	DB	'PDSTT',  00H
$SG1131	DB	'BRST',  00H
$SG1133	DB	'VSL',  00H
$SG1135	DB	'BAD MODE',  00H
$SG1144	DB	'-',  00H
$SG1145	DB	'.',  00H
	ORG	$+17
$SG1314	DB	'5',  00H
$SG1316	DB	'10',  00H
$SG1318	DB	'20',  00H
$SG1320	DB	'50',  00H
$SG1322	DB	'100',  00H
$SG1324	DB	'200',  00H
$SG1348	DB	'5',  00H
$SG1350	DB	'10',  00H
$SG1352	DB	'20',  00H
$SG1354	DB	'50',  00H
$SG1356	DB	'100',  00H
$SG1358	DB	'200',  00H
	ORG	$-698
_ls	DW	0a3H
	DW	0bfH
	DW	0a9H
	DW	0c5H
	DW	03H
	DW	0b4H
	DW	0bfH
	DW	0baH
	DW	0c5H
	DW	03H
	DW	0d6H
	DW	0bfH
	DW	0dcH
	DW	0c5H
	DW	03H
	DW	0c5H
	DW	0bfH
	DW	0cbH
	DW	0c5H
	DW	03H
	DW	02H
	DW	085H
	DW	010H
	DW	08aH
	DW	00H
	DW	011fH
	DW	085H
	DW	0129H
	DW	08aH
	DW	00H
	DW	011fH
	DW	090H
	DW	0129H
	DW	095H
	DW	00H
	DW	011fH
	DW	09bH
	DW	0129H
	DW	0a0H
	DW	00H
	DW	098H
	DW	072H
	DW	0a8H
	DW	075H
	DW	03H
	DW	098H
	DW	0b4H
	DW	0a8H
	DW	0b7H
	DW	03H
	DW	0aH
	DW	074H
	DW	010H
	DW	078H
	DW	0aH
	DW	013H
	DW	074H
	DW	019H
	DW	078H
	DW	0aH
	DW	01cH
	DW	074H
	DW	023H
	DW	078H
	DW	0aH
	DW	0aH
	DW	079H
	DW	010H
	DW	07cH
	DW	0aH
	DW	013H
	DW	079H
	DW	019H
	DW	07cH
	DW	0aH
	DW	01cH
	DW	079H
	DW	023H
	DW	07cH
	DW	0aH
	DW	0aH
	DW	07dH
	DW	010H
	DW	080H
	DW	0aH
	DW	013H
	DW	07dH
	DW	019H
	DW	080H
	DW	0aH
	DW	01cH
	DW	07dH
	DW	023H
	DW	080H
	DW	0aH
_CockpitFiles	DW	DGROUP:$SG858
	DW	DGROUP:$SG859
	DW	DGROUP:$SG860
	DW	DGROUP:$SG861
	DW	DGROUP:$SG862
	DW	DGROUP:$SG863
	DW	DGROUP:$SG864
	DW	DGROUP:$SG865
	DW	DGROUP:$SG866
	DW	DGROUP:$SG867
	DW	DGROUP:$SG868
	DW	DGROUP:$SG869
_Lengths	DW	096H
	DW	06eH
	DW	06eH
	DW	032H
	DW	0a2H
	DW	0a2H
	DW	08bH
	DW	06eH
	DW	06eH
	DW	0aH
	DW	08cH
	DW	08cH
_DATA      ENDS
COCKPIT5_DATA      SEGMENT
_CockpitLights	DW	050H
	DW	03fH
	DW	016H
	DW	06H
	DW	01fH
	DW	011H
	DW	058H
	DW	049H
	DW	0cH
	DW	04H
	DW	012H
	DW	011H
	DW	059H
	DW	04eH
	DW	0bH
	DW	04H
	DW	012H
	DW	011H
	DW	05aH
	DW	053H
	DW	0bH
	DW	04H
	DW	012H
	DW	011H
	DW	0dbH
	DW	03fH
	DW	015H
	DW	06H
	DW	01fH
	DW	011H
	DW	0dcH
	DW	049H
	DW	0cH
	DW	04H
	DW	012H
	DW	011H
	DW	0dcH
	DW	04eH
	DW	0cH
	DW	04H
	DW	012H
	DW	011H
	DW	0dbH
	DW	053H
	DW	0cH
	DW	04H
	DW	012H
	DW	011H
	DW	077H
	DW	070H
	DW	0bH
	DW	03H
	DW	012H
	DW	011H
	DW	077H
	DW	074H
	DW	0bH
	DW	03H
	DW	012H
	DW	011H
	DW	077H
	DW	078H
	DW	0bH
	DW	03H
	DW	012H
	DW	010H
	DW	05bH
	DW	08bH
	DW	013H
	DW	05H
	DW	01dH
	DW	010H
	DW	063H
	DW	096H
	DW	0cH
	DW	02H
	DW	012H
	DW	011H
	DW	063H
	DW	099H
	DW	0cH
	DW	02H
	DW	012H
	DW	011H
	DW	063H
	DW	09cH
	DW	0cH
	DW	02H
	DW	012H
	DW	011H
	DW	063H
	DW	09fH
	DW	0cH
	DW	02H
	DW	012H
	DW	011H
	DW	063H
	DW	0a2H
	DW	0cH
	DW	02H
	DW	012H
	DW	011H
	DW	064H
	DW	0a5H
	DW	0cH
	DW	02H
	DW	012H
	DW	011H
	DW	064H
	DW	0a8H
	DW	0cH
	DW	02H
	DW	012H
	DW	011H
	DW	0d2H
	DW	08bH
	DW	013H
	DW	05H
	DW	01dH
	DW	010H
	DW	0d1H
	DW	096H
	DW	0cH
	DW	05H
	DW	012H
	DW	011H
	DW	0d1H
	DW	099H
	DW	0cH
	DW	05H
	DW	012H
	DW	011H
	DW	0d1H
	DW	09cH
	DW	0cH
	DW	05H
	DW	012H
	DW	011H
	DW	0d1H
	DW	09fH
	DW	0cH
	DW	05H
	DW	012H
	DW	011H
	DW	08eH
	DW	06aH
	DW	0aH
	DW	03H
	DW	012H
	DW	011H
	DW	08eH
	DW	06fH
	DW	0aH
	DW	03H
	DW	012H
	DW	011H
	DW	09bH
	DW	06aH
	DW	0aH
	DW	03H
	DW	012H
	DW	011H
	DW	09bH
	DW	06fH
	DW	0aH
	DW	03H
	DW	012H
	DW	011H
	DW	0a8H
	DW	06aH
	DW	0aH
	DW	03H
	DW	012H
	DW	011H
	DW	0a8H
	DW	06fH
	DW	0aH
	DW	03H
	DW	012H
	DW	011H
	DW	0c0H
	DW	073H
	DW	0aH
	DW	03H
	DW	012H
	DW	011H
	DW	0c0H
	DW	078H
	DW	0aH
	DW	03H
	DW	012H
	DW	011H
	DW	060H
	DW	07fH
	DW	06H
	DW	02H
	DW	01bH
	DW	01H
	DW	06bH
	DW	07fH
	DW	06H
	DW	02H
	DW	01bH
	DW	01H
	DW	076H
	DW	07fH
	DW	06H
	DW	02H
	DW	01bH
	DW	01H
	DW	081H
	DW	07fH
	DW	06H
	DW	02H
	DW	01bH
	DW	01H
	DW	0b9H
	DW	07fH
	DW	06H
	DW	02H
	DW	01bH
	DW	01H
	DW	0c4H
	DW	07fH
	DW	06H
	DW	02H
	DW	01bH
	DW	01H
	DW	0cfH
	DW	07fH
	DW	06H
	DW	02H
	DW	01bH
	DW	01H
	DW	0daH
	DW	07fH
	DW	06H
	DW	02H
	DW	01bH
	DW	01H
COCKPIT5_DATA      ENDS
_DATA      SEGMENT
_MASTER_CAUTION	DW	00H
_RadarRepeat	DW	00H
_BackSeat	DW	00H
_Panning	DW	00H
_DeClutter	DW	00H
_LLowFuelWarn	DW	00H
_RLowFuelWarn	DW	00H
_BingoFuelWarn	DW	00H
_OutsideWidth	DW	0140H
_OutsideLength	DW	0aaH
_RpCX1	DW	01H
	DW	077H
	DW	08aH
	DW	052H
	DW	039H
	DW	02H
	DW	02H
	DW	00H
	DW	01H
_RpCRT1	DW	DGROUP:_RpCX1
_RpCX2	DW	01H
	DW	0e2H
	DW	088H
	DW	01eH
	DW	02cH
	DW	02H
	DW	02H
	DW	00H
	DW	01H
_RpCRT2	DW	DGROUP:_RpCX2
_RpCX3	DW	01H
	DW	076H
	DW	064H
	DW	053H
	DW	044H
	DW	02H
	DW	02H
	DW	00H
	DW	01H
_RpCRT3	DW	DGROUP:_RpCX3
_RpCX4	DW	01H
	DW	0104H
	DW	096H
	DW	02aH
	DW	029H
	DW	02H
	DW	02H
	DW	00H
	DW	01H
_RpCRT4	DW	DGROUP:_RpCX4
_RpCX5	DW	01H
	DW	077H
	DW	06aH
	DW	053H
	DW	03bH
	DW	02H
	DW	02H
	DW	00H
	DW	01H
_RpCRT5	DW	DGROUP:_RpCX5
_RpCX6	DW	01H
	DW	058H
	DW	021H
	DW	092H
	DW	075H
	DW	02H
	DW	02H
	DW	00H
	DW	01H
_RpCRT6	DW	DGROUP:_RpCX6
_RpCX7	DW	01H
	DW	0eeH
	DW	081H
	DW	051H
	DW	038H
	DW	02H
	DW	02H
	DW	00H
	DW	01H
_RpCRT7	DW	DGROUP:_RpCX7
_CrtRps	DW	DGROUP:_RpCX1
	DW	DGROUP:_RpCX2
	DW	DGROUP:_RpCX3
	DW	DGROUP:_RpCX4
	DW	DGROUP:_RpCX5
	DW	DGROUP:_RpCX6
	DW	DGROUP:_RpCX7
	DW	_TDBRpX
_CrtConfig	DW	03H
	DW	08H
	DW	09H
	DW	0fH
	DW	010H
	DW	011H
	DW	0aH
	DW	0eH
_CurCRT	DW	02H
_MasterArmSW	DW	00H
_JetisonSW	DW	00H
_Lightemup	DW	00H
_lighton	DW	00H
_VdiMode	DW	01H
_msiz	DW	00H
_EgtL	DW	0fH
_EgtR	DW	0fH
_RadarRange	DW	05H
	ORG	$+8
$S993_lastview	DW	0ffffH
$S1031_LastCur	DW	02H
$S1039_FirstArm	DW	00H
$S1084_prevcaut	DW	0ffffH
	ORG	$+178
$S1159_prevstat	DW	0ffffH
$S1257_NumBars	DW	00H
$S1258_SweepSize	DW	00H
$S1278_RANGES	DW	0c8H
	DW	064H
	DW	032H
	DW	019H
	DW	0aH
	ORG	$+38
$S1336_RadarOn	DW	00H
$S1337_RadarMode	DW	00H
$S1338_PrevRadar	DW	00H
$S1620_tempflash	DW	00H
_DATA      ENDS
_BSS      SEGMENT
	ORG	$+90
$S1480_prevrot	DW 01H DUP (?)
	ORG	$-86
$S923_OLDMM	DW 01H DUP (?)
	ORG	$-8
$S924_OldFuel	DW 01H DUP (?)
	ORG	$+86
$S925_OldThrust	DW 01H DUP (?)
	ORG	$-82
$S926_OldLights	DW 028H DUP (?)
	ORG	$-86
$S927_OldEMIS	DW 01H DUP (?)
$S928_OldMC	DW 01H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 12
; Line 19
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
; Line 255
	PUBLIC	_LoadNewCockpit
_LoadNewCockpit	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,774
	call	__aNchkstk
	push	si
;	PalPkt = -774
; Line 258
	lea	ax,WORD PTR [bp-774]	;PalPkt
	push	ax
	mov	si,WORD PTR _View
	and	si,-193
	shl	si,1
	mov	bx,WORD PTR _BackSeat
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	shl	bx,1
	push	WORD PTR _CockpitFiles[bx][si]
	mov	cx,1
	push	cx
	call	_LoadPicToPal
	add	sp,6
; Line 259
	lea	ax,WORD PTR [bp-774]	;PalPkt
	push	ax
	call	_UpdatePalBuf
	add	sp,2
; Line 261
	call	FAR PTR _ScreenOff
; Line 262
	mov	ax,1
	push	ax
	call	FAR PTR _ShowPage
	add	sp,2
; Line 264
	call	_ResetCockpitLights
; Line 267
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+6],319
; Line 268
	mov	si,WORD PTR _View
	and	si,-193
	shl	si,1
	mov	bx,WORD PTR _BackSeat
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR _Lengths[bx][si]
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+8],ax
; Line 270
	cmp	WORD PTR _View,71
	je	$I952
	cmp	WORD PTR _View,72
	jne	$I951
$I952:
; Line 271
	mov	WORD PTR _OutsideLength,199
; Line 272
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+8],199
; Line 273
	jmp	SHORT $I953
	nop	
$I951:
; Line 274
	mov	WORD PTR _OutsideLength,170
; Line 275
$I953:
; Line 277
	mov	ax,WORD PTR _View
	cmp	ax,72
	jle	$JCC172
	jmp	$L20001
$JCC172:
	cmp	ax,71
	jl	$JCC180
	jmp	$L20001
$JCC180:
	dec	ax
	jl	$SD966
	dec	ax
	jle	$SC962
	dec	ax
	je	$SC963
	dec	ax
	je	$SC958
	dec	ax
	jne	$SD966
; Line 278
$SC958:
; Line 279
	mov	ax,1
	push	ax
	mov	ax,163
$L20074:
	push	ax
	mov	ax,319
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	mov	ax,OFFSET _TopCockpitMask
	mov	cx,SEG _TopCockpitMask
	jmp	SHORT $L20076
	nop	
	nop	
$SC962:
; Line 291
	mov	ax,1
	push	ax
	mov	ax,110
	jmp	SHORT $L20074
; Line 293
	nop	
$SC963:
; Line 294
	cmp	WORD PTR _BackSeat,0
	jne	$I964
; Line 295
	mov	ax,1
	push	ax
	mov	ax,70
	push	ax
	mov	ax,86
	push	ax
	mov	ax,100
	push	ax
	mov	ax,117
	push	ax
	mov	ax,OFFSET _HsdMask
	mov	cx,SEG _HsdMask
$L20076:
	push	cx
	push	ax
	call	_BuildMask
	add	sp,14
	mov	WORD PTR _msiz,ax
; Line 296
	jmp	SHORT $L20001
$I964:
; Line 297
	mov	ax,1
	push	ax
	mov	ax,114
	push	ax
	mov	ax,140
	push	ax
	mov	ax,36
	push	ax
	mov	ax,91
	push	ax
	mov	ax,OFFSET _TIDMask
	mov	cx,SEG _TIDMask
	jmp	SHORT $L20076
; Line 301
$SD966:
; Line 302
	call	_BuildCockpitSprites
; Line 303
$L20001:
; Line 305
	cmp	WORD PTR _View,4
	je	$I968
	cmp	WORD PTR _View,5
	je	$I968
; Line 306
	sub	ax,ax
	push	ax
	call	_ChangeHUDColor
	add	sp,2
; Line 307
$I968:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_LoadNewCockpit	ENDP
; Line 312
_TEXT      ENDS
CONST      SEGMENT
$T20002	DW SEG _LookDownRMask 
$T20003	DW SEG _LookDownLMask 
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_BuildCockpitSprites
_BuildCockpitSprites	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
	push	si
;	x = -8
;	ch = -10
;	temp = -6
; Line 317
	cmp	WORD PTR _BackSeat,0
	je	$JCC357
	jmp	$I974
$JCC357:
; Line 318
	cmp	WORD PTR _View,0
	je	$JCC367
	jmp	$I978
$JCC367:
; Line 319
	mov	ax,1
	push	ax
	mov	cx,150
	push	cx
	mov	dx,319
	push	dx
	sub	dx,dx
	push	dx
	push	dx
	mov	bx,OFFSET _TopCockpitMask
	mov	si,SEG _TopCockpitMask
	push	si
	push	bx
	call	_BuildMask
	add	sp,14
; Line 320
	mov	ax,1
	push	ax
	mov	cx,57
	push	cx
	mov	dx,82
	push	dx
	mov	dx,138
	push	dx
	mov	dx,119
	push	dx
	mov	dx,OFFSET _VdiMask
	mov	bx,SEG _VdiMask
	push	bx
	push	dx
	call	_BuildMask
	add	sp,14
; Line 321
	mov	ax,1
	push	ax
	mov	cx,34
	push	cx
	mov	cx,30
	push	cx
	mov	cx,136
	push	cx
	mov	cx,226
	push	cx
	mov	cx,OFFSET _AdiMask
	mov	dx,SEG _AdiMask
	push	dx
	push	cx
	call	_BuildMask
	add	sp,14
; Line 322
	mov	ax,1
	push	ax
	mov	cx,44
	push	cx
	mov	cx,57
	push	cx
	mov	cx,110
	push	cx
	sub	dx,dx
	push	dx
	mov	dx,OFFSET _LookDownLMask
	mov	bx,SEG _LookDownLMask
	push	bx
	push	dx
	call	_BuildMask
	add	sp,14
; Line 323
	mov	ax,1
	push	ax
	mov	cx,39
	push	cx
	mov	cx,59
	push	cx
	mov	cx,110
	push	cx
	mov	cx,261
	push	cx
	mov	cx,OFFSET _LookDownRMask
	mov	dx,SEG _LookDownRMask
	push	dx
	push	cx
	call	_BuildMask
	add	sp,14
; Line 324
	mov	ax,1
	push	ax
	mov	ax,41
	push	ax
	mov	ax,42
	push	ax
	mov	ax,150
	push	ax
	mov	ax,260
	push	ax
	mov	ax,OFFSET _RawMask
	mov	cx,SEG _RawMask
	push	cx
	push	ax
	call	_BuildMask
	add	sp,14
; Line 326
	sub	ax,ax
	mov	es,WORD PTR $T20002
	mov	WORD PTR es:_LookDownRMask+2,ax
	mov	es,WORD PTR $T20003
	mov	WORD PTR es:_LookDownLMask+2,ax
; Line 327
	call	_UpdateLights
; Line 328
; Line 329
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I974:
; Line 330
	cmp	WORD PTR _View,0
	jne	$I978
; Line 331
	mov	ax,1
	push	ax
	mov	cx,150
	push	cx
	mov	cx,319
	push	cx
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,OFFSET _TopCockpitMask
	mov	dx,SEG _TopCockpitMask
	push	dx
	push	cx
	call	_BuildMask
	add	sp,14
; Line 332
	mov	ax,1
	push	ax
	mov	cx,60
	push	cx
	mov	cx,88
	push	cx
	mov	cx,106
	push	cx
	mov	dx,116
	push	dx
	mov	dx,OFFSET _DDDMask
	mov	bx,SEG _DDDMask
	push	bx
	push	dx
	call	_BuildMask
	add	sp,14
; Line 333
	mov	ax,1
	push	ax
	mov	ax,58
	push	ax
	mov	ax,16
	push	ax
	mov	ax,106
	push	ax
	mov	ax,86
	push	ax
	mov	ax,OFFSET _ElevMask
	mov	cx,SEG _ElevMask
	push	cx
	push	ax
	call	_BuildMask
	add	sp,14
; Line 334
	call	_DDDSwitchRefresh
; Line 335
; Line 336
$I978:
; Line 337
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_BuildCockpitSprites	ENDP
; Line 341
_TEXT      ENDS
CONST      SEGMENT
$T20004	DW SEG _VdiMask 
$T20005	DW SEG _AdiMask 
$T20006	DW SEG _RawMask 
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_LookDown
_LookDown	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 342
	cmp	WORD PTR _BackSeat,0
	jne	$I982
; Line 343
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+8],50
; Line 344
	mov	bx,WORD PTR _RpCRT1
	mov	WORD PTR [bx+4],27
; Line 345
	mov	bx,WORD PTR _RpCRT2
	mov	WORD PTR [bx+4],25
; Line 346
	mov	bx,WORD PTR _RpCRT4
	mov	WORD PTR [bx+4],39
; Line 348
	mov	es,WORD PTR $T20004
	mov	WORD PTR es:_VdiMask+2,27
; Line 349
	mov	es,WORD PTR $T20005
	mov	WORD PTR es:_AdiMask+2,25
; Line 350
	mov	es,WORD PTR $T20006
	mov	WORD PTR es:_RawMask+2,39
; Line 351
	ret	
$I982:
; Line 352
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+8],50
; Line 353
; Line 354
	ret	

_LookDown	ENDP
; Line 358
	PUBLIC	_LookUp
_LookUp	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 359
	cmp	WORD PTR _BackSeat,0
	jne	$I986
; Line 360
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+8],150
; Line 361
	mov	bx,WORD PTR _RpCRT1
	mov	WORD PTR [bx+4],138
; Line 362
	mov	bx,WORD PTR _RpCRT2
	mov	WORD PTR [bx+4],136
; Line 363
	mov	bx,WORD PTR _RpCRT4
	mov	WORD PTR [bx+4],150
; Line 365
	mov	es,WORD PTR $T20004
	mov	WORD PTR es:_VdiMask+2,138
; Line 366
	mov	es,WORD PTR $T20005
	mov	WORD PTR es:_AdiMask+2,136
; Line 367
	mov	es,WORD PTR $T20006
	mov	WORD PTR es:_RawMask+2,150
; Line 368
	ret	
$I986:
; Line 369
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+8],139
; Line 370
; Line 371
	ret	

_LookUp	ENDP
; Line 375
	PUBLIC	_Flip
_Flip	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,124
	call	__aNchkstk
;	str = -124
;	tmp = -80
;	s = -90
;	tempplane = -94
; Line 384
	call	FAR PTR _MouseHIDE
; Line 386
	mov	ax,WORD PTR _View
	jmp	$S995
; Line 387
$SC999:
; Line 389
	sub	ax,ax
	push	ax
	mov	cx,320
	sub	cx,WORD PTR _OutsideWidth
	shr	cx,1
	push	cx
	push	WORD PTR _Rp1
	mov	cx,199
	push	cx
$L20077:
	push	WORD PTR _OutsideWidth
	push	ax
	push	ax
	push	WORD PTR _Rp3D
	call	FAR PTR _RectCopy
	add	sp,16
; Line 391
$SB996:
; Line 460
	cmp	WORD PTR _ShowMouse,0
	je	$I1020
	call	FAR PTR _MouseSHOW
; Line 462
$I1020:
	call	FAR PTR _ScreenOn
; Line 465
	cmp	WORD PTR _SNDDETAIL,1
	jne	$I1022
	cmp	WORD PTR _SNDDETAIL,3
	jne	$JCC984
	jmp	$I1021
$JCC984:
$I1022:
; Line 466
	cmp	WORD PTR _View,70
	jg	$JCC994
	jmp	$L20010
$JCC994:
	mov	ax,31
	jmp	$L20011
; Line 392
	nop	
$SC1000:
; Line 393
	cmp	WORD PTR _DifficultyLevel,0
	jne	$SC1003
	cmp	WORD PTR _PadLockee,-1
	jle	$SC1003
; Line 395
	mov	ax,40
	imul	WORD PTR _PadLockee
	mov	bx,ax
	push	WORD PTR _ps[bx+22]
	call	_GetPlanePtr
	add	sp,2
	mov	WORD PTR [bp-94],ax	;tempplane
	mov	WORD PTR [bp-92],dx
	inc	ax
	inc	ax
	push	dx
	push	ax
	lea	ax,WORD PTR [bp-80]	;tmp
	push	ss
	push	ax
	call	FAR PTR __fstrcpy
	add	sp,8
; Line 396
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+16],2
; Line 397
	lea	ax,WORD PTR [bp-80]	;tmp
	push	ax
	mov	ax,10
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR _Rp3D
	call	FAR PTR _RpPrint
	add	sp,8
; Line 398
; Line 403
$SC1003:
; Line 410
	sub	ax,ax
	push	ax
	mov	cx,320
	sub	cx,WORD PTR _OutsideWidth
	shr	cx,1
	push	cx
	push	WORD PTR _Rp1
	push	WORD PTR _OutsideLength
	jmp	$L20077
; Line 416
$SC1004:
; Line 414
	mov	ax,OFFSET _TopCockpitMask
	mov	cx,SEG _TopCockpitMask
	jmp	$L20082
; Line 419
	nop	
$SC1007:
; Line 420
	cmp	WORD PTR _BackSeat,0
	je	$JCC1133
	jmp	$I1008
$JCC1133:
; Line 421
	test	BYTE PTR _Status+1,16
	je	$I1009
	mov	ax,OFFSET DGROUP:$SG1010
	push	ax
	mov	ax,2
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR _Rp3D
	call	FAR PTR _RpPrint
	add	sp,8
; Line 422
$I1009:
	cmp	WORD PTR _Speedy,1
	jle	$I1011
; Line 423
	mov	bx,WORD PTR _Rp3D
	mov	WORD PTR [bx+16],4
; Line 424
	mov	ax,OFFSET DGROUP:$SG1012
	push	ax
	mov	ax,8
	push	ax
	mov	cx,5
	push	cx
	push	WORD PTR _Rp3D
	call	FAR PTR _RpPrint
	add	sp,8
; Line 425
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-90]	;s
	push	ax
	push	WORD PTR _Speedy
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,8
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR _Rp3D
	call	FAR PTR _RpPrint
	add	sp,8
; Line 426
; Line 427
$I1011:
	mov	ax,OFFSET _TopCockpitMask
	mov	cx,SEG _TopCockpitMask
	push	cx
	push	ax
	call	_MaskCopy
	add	sp,4
; Line 428
	cmp	WORD PTR _MsgOnScreen,0
	jne	$I1013
; Line 429
	mov	es,WORD PTR $T20004
	mov	WORD PTR es:_VdiMask+6,57
; Line 430
	jmp	SHORT $I1014
$I1013:
; Line 431
	mov	es,WORD PTR $T20004
	mov	WORD PTR es:_VdiMask+6,52
$I1014:
; Line 432
	mov	ax,OFFSET _VdiMask
	mov	cx,SEG _VdiMask
	push	cx
	push	ax
	call	_MaskCopy
	add	sp,4
; Line 433
	mov	ax,OFFSET _AdiMask
	mov	cx,SEG _AdiMask
	push	cx
	push	ax
	call	_MaskCopy
	add	sp,4
; Line 434
	mov	ax,OFFSET _RawMask
	mov	cx,SEG _RawMask
	jmp	SHORT $L20082
	nop	
$I1008:
; Line 436
	mov	ax,OFFSET _TopCockpitMask
	mov	cx,SEG _TopCockpitMask
	push	cx
	push	ax
	call	_MaskCopy
	add	sp,4
; Line 437
	mov	ax,OFFSET _DDDMask
	mov	cx,SEG _DDDMask
	push	cx
	push	ax
	call	_MaskCopy
	add	sp,4
; Line 438
	mov	ax,OFFSET _ElevMask
	mov	cx,SEG _ElevMask
$L20082:
	push	cx
	push	ax
	call	_MaskCopy
	add	sp,4
; Line 439
; Line 440
	jmp	$SB996
; Line 441
	nop	
$SC1016:
; Line 442
	cmp	WORD PTR _BackSeat,0
	jne	$I1017
; Line 443
	mov	ax,OFFSET _LookDownLMask
	mov	cx,SEG _LookDownLMask
	push	cx
	push	ax
	call	_MaskCopy
	add	sp,4
; Line 444
	mov	ax,OFFSET _LookDownRMask
	mov	cx,SEG _LookDownRMask
	push	cx
	push	ax
	call	_MaskCopy
	add	sp,4
; Line 445
	mov	ax,OFFSET _AdiMask
	mov	cx,SEG _AdiMask
	push	cx
	push	ax
	call	_MaskCopy
	add	sp,4
; Line 446
	mov	ax,OFFSET _RawMask
	mov	cx,SEG _RawMask
	push	cx
	push	ax
	call	_MaskCopy
	add	sp,4
; Line 447
	mov	ax,OFFSET _HsdMask
	mov	cx,SEG _HsdMask
	push	cx
	push	ax
	call	_MaskCopy
	add	sp,4
; Line 448
	mov	ax,OFFSET _VdiMask
	mov	cx,SEG _VdiMask
	jmp	SHORT $L20082
	nop	
$I1017:
; Line 450
	mov	ax,OFFSET _TIDMask
	mov	cx,SEG _TIDMask
	jmp	SHORT $L20082
$S995:
	cmp	ax,70
	jne	$JCC1471
	jmp	$SC1003
$JCC1471:
	jg	$L20007
	cmp	ax,5
	jbe	$JCC1481
	jmp	$SB996
$JCC1481:
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20008[bx]
$L20008:
		DW	$SC1007
		DW	$SC1004
		DW	$SC1004
		DW	$SC1016
		DW	$SC1004
		DW	$SC1004
$L20007:
	cmp	ax,203
	jg	$L20009
	cmp	ax,201
	jl	$JCC1514
	jmp	$SC1003
$JCC1514:
	sub	ax,71
	jge	$JCC1522
	jmp	$SB996
$JCC1522:
	dec	ax
	jg	$JCC1528
	jmp	$SC999
$JCC1528:
	jmp	$SB996
$L20009:
	sub	ax,204
	jne	$JCC1539
	jmp	$SC1000
$JCC1539:
	dec	ax
	jge	$JCC1545
	jmp	$SB996
$JCC1545:
	sub	ax,3
	jg	$JCC1553
	jmp	$SC1003
$JCC1553:
	jmp	$SB996
	nop	
$L20010:
	mov	ax,30
$L20011:
	push	ax
	call	FAR PTR _SndSounds
; Line 467
$I1021:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_Flip	ENDP
; Line 472
	PUBLIC	_ConfigCrts
_ConfigCrts	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 475
	mov	WORD PTR [bp-2],0	;i
$FC1027:
; Line 476
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,1
	mov	ax,WORD PTR _CrtConfig[bx]
	mov	WORD PTR _CrtDisplays[bx],ax
; Line 477
	inc	WORD PTR [bp-2]	;i
	cmp	WORD PTR [bp-2],8	;i
	jl	$FC1027
; Line 478
	mov	sp,bp
	pop	bp
	ret	

_ConfigCrts	ENDP
; Line 483
	PUBLIC	_DoCockpitDisplays
_DoCockpitDisplays	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,24
	call	__aNchkstk
;	s = -14
;	alt = -4
;	x = -16
;	y = -20
;	althund = -2
;	x2 = -22
;	y2 = -24
;	i = -18
; Line 492
	cmp	WORD PTR _BackSeat,0
	je	$JCC1630
	jmp	$I1041
$JCC1630:
; Line 493
	cmp	WORD PTR _View,3
	jne	$I1042
; Line 494
	sub	ax,ax
	push	ax
	call	_DoCRT
	add	sp,2
; Line 495
	mov	ax,1
	push	ax
	call	_DoCRT
	add	sp,2
; Line 496
	mov	ax,2
	push	ax
	call	_DoCRT
	add	sp,2
; Line 497
	mov	ax,3
	push	ax
	call	_DoCRT
	add	sp,2
; Line 498
	call	_DrawVVGauge
; Line 499
	call	_DrawAirSpeedGauge
; Line 500
	call	_DrawAltGauge
; Line 501
	call	_DrawRadarAlt
; Line 502
	call	_DrawCompass
; Line 503
	call	_DrawStores
; Line 504
	call	_ShowFuel
; Line 505
	call	_DrawEngineStat
; Line 506
; Line 508
$I1042:
	cmp	WORD PTR _View,0
	jne	$I1052
; Line 509
	call	_HUD
; Line 510
	call	_DrawVVGauge
; Line 511
	call	_DrawAirSpeedGauge
; Line 512
	call	_DrawAltGauge
; Line 513
	call	_DrawRadarAlt
; Line 514
	call	_DrawAOADisplay
; Line 515
	call	_DrawSweepDisplay
; Line 516
	call	_DrawStores
; Line 517
	call	_DrawCompass
; Line 518
	call	_DrawIndexer
; Line 519
	sub	ax,ax
	push	ax
	call	_DoCRT
	add	sp,2
; Line 520
	mov	ax,1
	push	ax
	call	_DoCRT
	add	sp,2
; Line 521
	mov	ax,3
	push	ax
	call	_DoCRT
	add	sp,2
; Line 522
	call	_UpdateCockpitLites
; Line 523
	call	_DisplayBall
; Line 524
	call	_DisplayMaster
; Line 525
	call	_GDisplay
; Line 526
; Line 527
$I1052:
	cmp	WORD PTR _View,4
	je	$I1062
	cmp	WORD PTR _View,5
	jne	$I1061
$I1062:
; Line 528
	call	_DisplayRioHead
; Line 529
; Line 530
$I1061:
	cmp	WORD PTR _View,1
	jne	$I1064
; Line 531
	call	_DisplayLeftStuff
; Line 532
; Line 533
$I1064:
	cmp	WORD PTR _View,2
	jne	$I1078
; Line 534
	call	_DisplayRightStuff
; Line 535
; Line 536
	jmp	SHORT $I1078
$I1041:
; Line 537
	cmp	WORD PTR _View,0
	jne	$I1069
; Line 538
	mov	ax,4
	push	ax
	call	_DoCRT
	add	sp,2
; Line 539
	call	_DDDSwitches
; Line 540
	call	_DrawRadarElev
; Line 541
	call	_DrawRadarStatus
; Line 542
	call	_DrawRadarRange
; Line 543
; Line 544
$I1069:
	cmp	WORD PTR _View,3
	jne	$I1074
; Line 545
	mov	ax,5
	push	ax
	call	_DoCRT
	add	sp,2
; Line 546
	call	_DrawRadarStatus
; Line 547
	call	_TIDShowRange
; Line 548
	call	_DrawWayPoint
; Line 550
	call	_DisplayTIDSwitches
; Line 551
; Line 552
$I1074:
	cmp	WORD PTR _View,1
	jne	$I1078
; Line 553
	call	_DrawRadarDials
; Line 554
; Line 556
$I1078:
; Line 557
	cmp	WORD PTR _View,71
	je	$I1081
	cmp	WORD PTR _View,72
	jne	$I1080
$I1081:
; Line 558
	call	_DoPadLockView
; Line 559
; Line 560
$I1080:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DoCockpitDisplays	ENDP
; Line 564
	PUBLIC	_DisplayMaster
_DisplayMaster	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 567
	mov	ax,WORD PTR $S1084_prevcaut
	cmp	WORD PTR _MASTER_CAUTION,ax
	je	$I1085
; Line 568
	cmp	WORD PTR _MASTER_CAUTION,0
	je	$I1086
; Line 569
	mov	ax,16
	push	ax
	mov	cx,2
	push	cx
	jmp	SHORT $L20084
	nop	
$I1086:
; Line 571
	mov	ax,18
	push	ax
	mov	ax,2
	push	ax
	mov	ax,16
$L20084:
	push	ax
	mov	ax,119
	push	ax
	mov	ax,152
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _RectFill
	add	sp,12
; Line 572
; Line 573
; Line 574
$I1085:
	mov	ax,WORD PTR _MASTER_CAUTION
	mov	WORD PTR $S1084_prevcaut,ax
; Line 575
	ret	
	nop	

_DisplayMaster	ENDP
; Line 579
	PUBLIC	_DrawRadarStatus
_DrawRadarStatus	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,30
	call	__aNchkstk
	push	si
;	s = -26
;	l = -30
;	offset = -28
; Line 582
	mov	WORD PTR [bp-28],0	;offset
; Line 584
	mov	bx,WORD PTR _Rp2
	mov	WORD PTR [bx+16],2
; Line 585
	mov	bx,WORD PTR _Rp2
	mov	WORD PTR [bx+12],34
; Line 587
	mov	ax,WORD PTR _AWG9_MODE
	jmp	$S1092
; Line 590
	nop	
$SC1096:
; Line 591
	mov	ax,OFFSET DGROUP:$SG1097
$L20085:
	push	ax
	lea	ax,WORD PTR [bp-26]	;s
	push	ax
	call	_strcpy
	add	sp,4
; Line 665
	lea	ax,WORD PTR [bp-26]	;s
	push	ax
	push	WORD PTR _Rp2
	call	_pstrlen
	add	sp,4
	mov	WORD PTR [bp-30],ax	;l
; Line 667
	cmp	WORD PTR _View,0
	je	$JCC2060
	jmp	$I1137
$JCC2060:
; Line 668
	mov	WORD PTR [bp-28],171	;offset
; Line 669
	jmp	$I1138
; Line 593
	nop	
$SC1098:
; Line 594
	mov	ax,OFFSET DGROUP:$SG1099
	jmp	SHORT $L20085
; Line 596
	nop	
$SC1100:
; Line 597
	mov	ax,OFFSET DGROUP:$SG1101
	jmp	SHORT $L20085
; Line 599
	nop	
$SC1102:
; Line 600
	mov	ax,OFFSET DGROUP:$SG1103
	jmp	SHORT $L20085
; Line 605
	nop	
$SC1104:
; Line 606
	mov	ax,OFFSET DGROUP:$SG1105
	jmp	SHORT $L20085
; Line 608
	nop	
$SC1106:
; Line 609
	mov	ax,OFFSET DGROUP:$SG1107
	jmp	SHORT $L20085
; Line 611
	nop	
$SC1108:
; Line 612
	mov	ax,OFFSET DGROUP:$SG1109
	jmp	SHORT $L20085
; Line 614
	nop	
$SC1110:
; Line 615
	mov	ax,OFFSET DGROUP:$SG1111
	jmp	SHORT $L20085
; Line 619
	nop	
$SC1112:
; Line 620
	mov	ax,OFFSET DGROUP:$SG1113
	jmp	SHORT $L20085
; Line 622
	nop	
$SC1114:
; Line 623
	mov	ax,OFFSET DGROUP:$SG1115
	jmp	SHORT $L20085
; Line 625
	nop	
$SC1116:
; Line 626
	mov	ax,OFFSET DGROUP:$SG1117
	jmp	SHORT $L20085
; Line 630
	nop	
$SC1118:
; Line 631
	mov	ax,OFFSET DGROUP:$SG1119
	jmp	SHORT $L20085
; Line 633
	nop	
$SC1120:
; Line 634
	mov	ax,OFFSET DGROUP:$SG1121
	jmp	SHORT $L20085
; Line 636
	nop	
$SC1122:
; Line 637
	mov	ax,OFFSET DGROUP:$SG1123
	jmp	SHORT $L20085
; Line 641
	nop	
$SC1124:
; Line 642
	mov	ax,OFFSET DGROUP:$SG1125
	jmp	$L20085
; Line 644
$SC1126:
; Line 645
	mov	ax,OFFSET DGROUP:$SG1127
	jmp	$L20085
; Line 649
$SC1128:
; Line 650
	mov	ax,OFFSET DGROUP:$SG1129
	jmp	$L20085
; Line 654
$SC1130:
; Line 655
	mov	ax,OFFSET DGROUP:$SG1131
	jmp	$L20085
; Line 657
$SC1132:
; Line 658
	mov	ax,OFFSET DGROUP:$SG1133
	jmp	$L20085
; Line 660
$S1092:
	cmp	ax,150
	je	$SC1132
	ja	$L20012
	sub	ax,100
	test	al,1
	jne	$SD1134
	cmp	ax,36
	ja	$SD1134
	xchg	ax,bx
	jmp	WORD PTR cs:$L20013[bx]
	nop	
$L20013:
		DW	$SC1096
		DW	$SC1098
		DW	$SC1100
		DW	$SC1102
		DW	$SD1134
		DW	$SC1104
		DW	$SC1106
		DW	$SC1108
		DW	$SC1110
		DW	$SD1134
		DW	$SD1134
		DW	$SC1112
		DW	$SC1114
		DW	$SC1116
		DW	$SD1134
		DW	$SD1134
		DW	$SC1118
		DW	$SC1120
		DW	$SC1122
$L20012:
	sub	ax,154
	je	$SC1130
	sub	ax,46
	je	$SC1124
	dec	ax
	dec	ax
	je	$SC1126
	sub	ax,98
	je	$SC1128
$SD1134:
; Line 661
	mov	ax,OFFSET DGROUP:$SG1135
	jmp	$L20085
	nop	
$I1137:
; Line 670
	mov	WORD PTR [bp-28],0	;offset
$I1138:
; Line 672
	mov	ax,37
	push	ax
	mov	ax,6
	push	ax
	mov	cx,57
	push	cx
	mov	dx,WORD PTR [bp-28]	;offset
	add	dx,5
	push	dx
	mov	bx,131
	push	bx
	push	WORD PTR _Rp2
	mov	si,dx
	call	FAR PTR _RectFill
	add	sp,12
; Line 673
	lea	ax,WORD PTR [bp-26]	;s
	push	ax
	push	si
	mov	ax,WORD PTR [bp-30]	;l
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,159
	neg	ax
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RpPrint
	add	sp,8
; Line 674
	push	si
	mov	ax,131
	push	ax
	push	WORD PTR _Rp1
	mov	cx,6
	push	cx
	mov	cx,57
	push	cx
	push	si
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 675
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DrawRadarStatus	ENDP
; Line 679
	PUBLIC	_GDisplay
_GDisplay	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
;	txt = -10
;	s = -20
;	N = -22
; Line 683
	mov	bx,WORD PTR _Rp2
	mov	WORD PTR [bx+16],2
; Line 684
	mov	bx,WORD PTR _Rp2
	mov	WORD PTR [bx+12],83
; Line 686
	mov	ax,63
	push	ax
	mov	ax,5
	push	ax
	mov	ax,20
	push	ax
	mov	ax,140
	push	ax
	mov	ax,267
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 687
	mov	ax,WORD PTR _Gees
	inc	ax
	push	ax
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-22],ax	;N
; Line 688
	mov	BYTE PTR [bp-10],0	;txt
; Line 689
	cmp	WORD PTR _Gees,-1
	jge	$I1143
	mov	ax,OFFSET DGROUP:$SG1144
	push	ax
	lea	ax,WORD PTR [bp-10]	;txt
	push	ax
	call	_strcpy
	add	sp,4
; Line 690
$I1143:
	mov	ax,10
	push	ax
	lea	cx,WORD PTR [bp-20]	;s
	push	cx
	mov	ax,WORD PTR [bp-22]	;N
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	push	ax
	call	_itoa
	add	sp,6
	push	ax
	lea	ax,WORD PTR [bp-10]	;txt
	push	ax
	call	_strcat
	add	sp,4
; Line 691
	mov	ax,OFFSET DGROUP:$SG1145
	push	ax
	lea	ax,WORD PTR [bp-10]	;txt
	push	ax
	call	_strcat
	add	sp,4
; Line 692
	mov	ax,10
	push	ax
	lea	cx,WORD PTR [bp-20]	;s
	push	cx
	mov	al,BYTE PTR [bp-22]	;N
	and	ax,15
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	add	ax,cx
	shl	ax,1
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	push	ax
	call	_itoa
	add	sp,6
	push	ax
	lea	ax,WORD PTR [bp-10]	;txt
	push	ax
	call	_strcat
	add	sp,4
; Line 693
	lea	ax,WORD PTR [bp-10]	;txt
	push	ax
	mov	ax,140
	push	ax
	mov	cx,269
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RpPrint
	add	sp,8
; Line 694
	mov	ax,140
	push	ax
	mov	cx,267
	push	cx
	push	WORD PTR _Rp1
	mov	dx,5
	push	dx
	mov	dx,20
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
; Line 695
	mov	sp,bp
	pop	bp
	ret	

_GDisplay	ENDP
; Line 701
	PUBLIC	_DisplayTIDSwitches
_DisplayTIDSwitches	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 702
	cmp	WORD PTR _DesignateMode,0
	je	$I1147
; Line 703
	mov	ax,17
	push	ax
	mov	ax,5
	push	ax
	jmp	SHORT $L20086
$I1147:
; Line 705
	mov	ax,5
	push	ax
	mov	cx,17
	push	cx
$L20086:
	push	ax
	mov	ax,8
	push	ax
	mov	ax,172
	push	ax
	mov	ax,117
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 706
; Line 708
	cmp	WORD PTR _ClrTarg,0
	je	$I1149
; Line 709
	mov	ax,17
	push	ax
	mov	ax,5
	push	ax
	push	ax
	mov	ax,8
	push	ax
	mov	ax,172
	push	ax
	mov	ax,133
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 711
	dec	WORD PTR _ClrTarg
	jns	$I1151
	mov	WORD PTR _ClrTarg,0
; Line 712
	jmp	SHORT $I1151
	nop	
$I1149:
; Line 713
	mov	ax,5
	push	ax
	mov	cx,17
	push	cx
	push	ax
	mov	ax,8
	push	ax
	mov	ax,172
	push	ax
	mov	ax,133
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 714
$I1151:
; Line 716
	cmp	WORD PTR _HighlightTarg,0
	je	$I1152
; Line 717
	mov	ax,17
	push	ax
	mov	ax,5
	push	ax
	jmp	SHORT $L20087
$I1152:
; Line 719
	mov	ax,5
	push	ax
	mov	cx,17
	push	cx
$L20087:
	push	ax
	mov	ax,8
	push	ax
	mov	ax,172
	push	ax
	mov	ax,149
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 720
; Line 722
	cmp	WORD PTR _DataLink,0
	je	$I1154
; Line 723
	mov	ax,17
	push	ax
	mov	ax,5
	push	ax
	jmp	SHORT $L20088
$I1154:
; Line 725
	mov	ax,5
	push	ax
	mov	cx,17
	push	cx
$L20088:
	push	ax
	mov	ax,8
	push	ax
	mov	ax,184
	push	ax
	mov	ax,117
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 726
; Line 728
	ret	

_DisplayTIDSwitches	ENDP
; Line 732
	PUBLIC	_DisplayLeftStuff
_DisplayLeftStuff	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	di
	push	si
;	i = -4
;	mseg = -8
;	stat = -6
;	prevthrust = -2
; Line 737
	mov	WORD PTR [bp-2],-1	;prevthrust
; Line 739
	call	FAR PTR _MouseHIDE
; Line 741
	mov	al,BYTE PTR _Status
	and	ax,1
	cmp	ax,1
	sbb	ax,ax
	neg	ax
	mov	WORD PTR [bp-6],ax	;stat
; Line 743
	mov	ax,1
	push	ax
	mov	ax,2
	push	ax
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR [bp-8],ax	;mseg
	or	ax,ax
	je	$I1163
; Line 744
	sub	cx,cx
	push	cx
	push	cx
	push	cx
	mov	cx,256
	push	cx
	mov	cx,152
	push	cx
	mov	cx,173
	push	cx
	push	WORD PTR _Rp2
	mov	cx,51
	push	cx
	mov	cx,208
	push	cx
	mov	cx,145
	push	cx
	mov	cx,105
	push	cx
	push	ax
	call	_ScaleRotate
	add	sp,24
; Line 745
; Line 747
$I1163:
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR [bp-8],ax	;mseg
	or	ax,ax
	jne	$JCC3016
	jmp	$I1165
$JCC3016:
; Line 748
	cmp	WORD PTR [bp-6],0	;stat
	jne	$JCC3025
	jmp	$I1166
$JCC3025:
; Line 753
	sub	cx,cx
	push	cx
	push	cx
	push	cx
	mov	dx,256
	push	dx
	mov	bx,155
	push	bx
	mov	bx,250
	push	bx
	push	WORD PTR _Rp2
	mov	bx,12
	push	bx
	mov	bx,26
	push	bx
	mov	bx,7
	push	bx
	mov	bx,143
	push	bx
	push	ax
	call	_ScaleRotate
	add	sp,24
; Line 755
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	cx,256
	push	cx
	mov	dx,121
	push	dx
	mov	bx,284
	push	bx
	push	WORD PTR _Rp1
	mov	bx,6
	push	bx
	mov	si,8
	push	si
	mov	di,109
	push	di
	mov	ax,209
	push	ax
	push	WORD PTR [bp-8]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 756
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	cx,256
	push	cx
	mov	dx,121
	push	dx
	mov	dx,298
	push	dx
	push	WORD PTR _Rp1
	mov	dx,6
	push	dx
	push	si
	push	di
	mov	bx,209
	push	bx
	push	WORD PTR [bp-8]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 757
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,131
	push	ax
	mov	ax,302
	push	ax
	push	WORD PTR _Rp1
	mov	ax,6
	push	ax
	push	si
	push	di
	mov	ax,209
	jmp	$L20089
	nop	
$I1166:
; Line 764
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	cx,256
	push	cx
	mov	dx,145
	push	dx
	mov	dx,269
	push	dx
	push	WORD PTR _Rp2
	mov	dx,34
	push	dx
	mov	dx,14
	push	dx
	mov	dx,18
	push	dx
	mov	dx,176
	push	dx
	push	WORD PTR [bp-8]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 766
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	cx,256
	push	cx
	mov	dx,121
	push	dx
	mov	bx,284
	push	bx
	push	WORD PTR _Rp1
	mov	bx,6
	push	bx
	mov	si,8
	push	si
	mov	di,97
	push	di
	mov	ax,210
	push	ax
	push	WORD PTR [bp-8]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 767
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	cx,256
	push	cx
	mov	dx,121
	push	dx
	mov	dx,298
	push	dx
	push	WORD PTR _Rp1
	mov	dx,6
	push	dx
	push	si
	push	di
	mov	bx,210
	push	bx
	push	WORD PTR [bp-8]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 768
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,131
	push	ax
	mov	ax,302
	push	ax
	push	WORD PTR _Rp1
	mov	ax,6
	push	ax
	push	si
	push	di
	mov	ax,210
$L20089:
	push	ax
	push	WORD PTR [bp-8]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 769
; Line 771
	test	BYTE PTR _Status,8
	je	$I1168
	cmp	WORD PTR _REALFLIGHT,0
	je	$I1169
	test	BYTE PTR _Damaged,4
	jne	$I1168
$I1169:
; Line 772
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,131
	push	ax
	mov	ax,288
	push	ax
	push	WORD PTR _Rp1
	mov	ax,6
	push	ax
	mov	ax,si
	push	ax
	mov	ax,109
	push	ax
	mov	ax,209
	jmp	SHORT $L20090
$I1168:
; Line 774
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,131
	push	ax
	mov	ax,288
	push	ax
	push	WORD PTR _Rp1
	mov	ax,6
	push	ax
	mov	ax,si
	push	ax
	mov	ax,97
	push	ax
	mov	ax,210
$L20090:
	push	ax
	push	WORD PTR [bp-8]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 776
	mov	ax,WORD PTR _THRUST
	cmp	WORD PTR [bp-2],ax	;prevthrust
	jne	$JCC3475
	jmp	$I1180
$JCC3475:
; Line 779
	cmp	ax,25
	jg	$I1172
; Line 780
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,155
	push	ax
	mov	ax,86
	push	ax
	push	WORD PTR _Rp2
	mov	ax,38
	push	ax
	mov	ax,29
	push	ax
	mov	ax,71
	push	ax
	mov	ax,144
	push	ax
	push	WORD PTR [bp-8]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 781
$I1172:
	cmp	WORD PTR _THRUST,25
	jle	$I1175
	cmp	WORD PTR _THRUST,50
	jl	$I1174
$I1175:
	cmp	WORD PTR _THRUST,50
	jne	$I1173
$I1174:
; Line 782
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,151
	push	ax
	mov	ax,124
	push	ax
	push	WORD PTR _Rp2
	mov	ax,36
	push	ax
	mov	ax,31
	push	ax
	mov	ax,70
	push	ax
	mov	ax,181
	push	ax
	push	WORD PTR [bp-8]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 783
$I1173:
	cmp	WORD PTR _THRUST,50
	jle	$I1178
	cmp	WORD PTR _THRUST,75
	jl	$I1177
$I1178:
	cmp	WORD PTR _THRUST,75
	jne	$I1176
$I1177:
; Line 784
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,147
	push	ax
	mov	ax,160
	push	ax
	push	WORD PTR _Rp2
	mov	ax,35
	push	ax
	mov	ax,29
	push	ax
	mov	ax,69
	push	ax
	mov	ax,220
	push	ax
	push	WORD PTR [bp-8]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 785
$I1176:
	cmp	WORD PTR _THRUST,75
	jle	$I1179
	cmp	WORD PTR _THRUST,100
	jge	$I1179
; Line 786
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,150
	push	ax
	mov	ax,197
	push	ax
	push	WORD PTR _Rp2
	mov	ax,33
	push	ax
	push	ax
	mov	ax,69
	push	ax
	mov	ax,258
	push	ax
	push	WORD PTR [bp-8]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 787
$I1179:
	cmp	WORD PTR _THRUST,100
	jl	$I1180
; Line 788
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,155
	push	ax
	mov	ax,237
	push	ax
	push	WORD PTR _Rp2
	mov	ax,33
	push	ax
	mov	ax,34
	push	ax
	mov	ax,69
	push	ax
	mov	ax,299
	push	ax
	push	WORD PTR [bp-8]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 789
$I1180:
; Line 790
	mov	ax,126
	push	ax
	mov	cx,69
	push	cx
	push	WORD PTR _Rp1
	mov	dx,51
	push	dx
	mov	dx,208
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 791
; Line 793
$I1165:
	mov	ax,WORD PTR [bp-6]	;stat
	mov	WORD PTR $S1159_prevstat,ax
; Line 794
	mov	ax,WORD PTR _THRUST
; Line 796
	cmp	WORD PTR _ShowMouse,0
	je	$I1181
	call	_MouseShow
; Line 797
$I1181:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_DisplayLeftStuff	ENDP
; Line 802
	PUBLIC	_DisplayRightStuff
_DisplayRightStuff	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	i = -2
;	mseg = -4
; Line 806
	call	FAR PTR _MouseHIDE
; Line 808
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR [bp-4],ax	;mseg
	or	ax,ax
	je	$I1186
; Line 809
	cmp	WORD PTR _HookDown,0
	je	$I1187
; Line 810
	sub	cx,cx
	push	cx
	push	cx
	push	cx
	mov	cx,256
	push	cx
	mov	cx,129
	push	cx
	mov	cx,35
	push	cx
	push	WORD PTR _Rp1
	mov	cx,46
	push	cx
	mov	cx,40
	push	cx
	mov	cx,116
	push	cx
	mov	cx,294
	push	cx
	push	ax
	jmp	SHORT $L20091
	nop	
$I1187:
; Line 812
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,129
	push	ax
	mov	ax,35
	push	ax
	push	WORD PTR _Rp1
	mov	ax,46
	push	ax
	mov	ax,40
	push	ax
	mov	ax,116
	push	ax
	mov	ax,250
	push	ax
	push	WORD PTR [bp-4]	;mseg
$L20091:
	call	_ScaleRotate
	add	sp,24
; Line 813
; Line 817
$I1186:
	test	BYTE PTR _Damaged+1,16
	je	$I1189
; Line 818
	mov	ax,16
	push	ax
	mov	ax,2
	push	ax
	mov	ax,72
	push	ax
	mov	cx,28
	push	cx
	mov	dx,172
	push	dx
	mov	bx,84
	push	bx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 819
	mov	ax,17
	push	ax
	mov	ax,4
	push	ax
	mov	ax,72
	push	ax
	mov	ax,28
	push	ax
	mov	ax,172
	push	ax
	mov	ax,84
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 820
; Line 822
$I1189:
	test	BYTE PTR _Damaged+1,4
	je	$I1190
; Line 823
	mov	ax,62
	push	ax
	mov	ax,3
	push	ax
	mov	ax,20
	push	ax
	mov	cx,25
	push	cx
	mov	dx,172
	push	dx
	mov	bx,99
	push	bx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 824
	mov	ax,63
	push	ax
	mov	ax,5
	push	ax
	mov	ax,20
	push	ax
	mov	ax,25
	push	ax
	mov	ax,172
	push	ax
	mov	ax,99
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 825
; Line 827
$I1190:
	cmp	WORD PTR _BingoFuelWarn,0
	je	$I1191
; Line 828
	mov	ax,16
	push	ax
	mov	ax,2
	push	ax
	mov	ax,24
	push	ax
	mov	cx,26
	push	cx
	mov	dx,168
	push	dx
	mov	bx,113
	push	bx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 829
	mov	ax,17
	push	ax
	mov	ax,4
	push	ax
	mov	ax,24
	push	ax
	mov	ax,26
	push	ax
	mov	ax,168
	push	ax
	mov	ax,113
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 830
; Line 832
$I1191:
	test	BYTE PTR _Damaged,4
	je	$I1192
; Line 833
	mov	ax,16
	push	ax
	mov	ax,2
	push	ax
	mov	ax,35
	push	ax
	mov	cx,23
	push	cx
	mov	dx,157
	push	dx
	mov	bx,143
	push	bx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 834
	mov	ax,17
	push	ax
	mov	ax,4
	push	ax
	mov	ax,35
	push	ax
	mov	ax,23
	push	ax
	mov	ax,157
	push	ax
	mov	ax,143
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 835
; Line 837
$I1192:
	test	BYTE PTR _Damaged,1
	je	$I1193
; Line 838
	mov	ax,62
	push	ax
	mov	ax,3
	push	ax
	mov	ax,35
	push	ax
	mov	cx,18
	push	cx
	mov	dx,157
	push	dx
	mov	bx,158
	push	bx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 839
	mov	ax,63
	push	ax
	mov	ax,5
	push	ax
	mov	ax,35
	push	ax
	mov	ax,18
	push	ax
	mov	ax,157
	push	ax
	mov	ax,158
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 840
; Line 842
$I1193:
	cmp	WORD PTR _LLowFuelWarn,0
	je	$I1194
; Line 843
	mov	ax,16
	push	ax
	mov	ax,2
	push	ax
	mov	ax,36
	push	ax
	mov	cx,13
	push	cx
	mov	dx,156
	push	dx
	mov	bx,173
	push	bx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 844
	mov	ax,17
	push	ax
	mov	ax,4
	push	ax
	mov	ax,36
	push	ax
	mov	ax,13
	push	ax
	mov	ax,156
	push	ax
	mov	ax,173
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 845
; Line 847
$I1194:
	cmp	WORD PTR _RLowFuelWarn,0
	je	$I1195
; Line 848
	mov	ax,62
	push	ax
	mov	ax,3
	push	ax
	mov	ax,36
	push	ax
	mov	cx,13
	push	cx
	mov	dx,156
	push	dx
	mov	bx,188
	push	bx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 849
	mov	ax,63
	push	ax
	mov	ax,5
	push	ax
	mov	ax,36
	push	ax
	mov	ax,13
	push	ax
	mov	ax,156
	push	ax
	mov	ax,188
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 850
; Line 853
$I1195:
	test	BYTE PTR _Damaged,2
	je	$I1196
; Line 854
	mov	ax,16
	push	ax
	mov	ax,2
	push	ax
	mov	ax,35
	push	ax
	mov	cx,17
	push	cx
	mov	dx,157
	push	dx
	mov	bx,199
	push	bx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 855
	mov	ax,17
	push	ax
	mov	cx,4
	push	cx
	mov	cx,35
	push	cx
	push	ax
	mov	ax,157
	push	ax
	mov	ax,199
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 856
; Line 863
$I1196:
	test	BYTE PTR _Damaged,128
	je	$I1197
; Line 864
	mov	ax,62
	push	ax
	mov	ax,3
	push	ax
	mov	ax,26
	push	ax
	mov	cx,29
	push	cx
	mov	dx,166
	push	dx
	mov	bx,247
	push	bx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 865
	mov	ax,63
	push	ax
	mov	ax,5
	push	ax
	mov	ax,26
	push	ax
	mov	ax,29
	push	ax
	mov	ax,166
	push	ax
	mov	ax,247
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 866
; Line 868
$I1197:
	test	BYTE PTR _Damaged,64
	je	$I1198
; Line 869
	mov	ax,62
	push	ax
	mov	ax,3
	push	ax
	mov	ax,26
	push	ax
	mov	cx,34
	push	cx
	mov	dx,166
	push	dx
	mov	bx,257
	push	bx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 870
	mov	ax,63
	push	ax
	mov	ax,5
	push	ax
	mov	ax,26
	push	ax
	mov	ax,34
	push	ax
	mov	ax,166
	push	ax
	mov	ax,257
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 871
; Line 873
$I1198:
	test	BYTE PTR _Damaged+1,8
	je	$I1199
; Line 874
	mov	ax,62
	push	ax
	mov	ax,3
	push	ax
	mov	ax,18
	push	ax
	mov	cx,29
	push	cx
	mov	dx,174
	push	dx
	mov	bx,277
	push	bx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 875
	mov	ax,63
	push	ax
	mov	ax,5
	push	ax
	mov	ax,18
	push	ax
	mov	ax,29
	push	ax
	mov	ax,174
	push	ax
	mov	ax,277
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 876
; Line 878
$I1199:
	cmp	WORD PTR _ShowMouse,0
	je	$I1200
	call	_MouseShow
; Line 879
$I1200:
	mov	sp,bp
	pop	bp
	ret	

_DisplayRightStuff	ENDP
; Line 883
	PUBLIC	_DrawRadarElev
_DrawRadarElev	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	beampit = -2
; Line 885
	mov	ax,33
	push	ax
	mov	ax,58
	push	ax
	mov	ax,16
	push	ax
	mov	ax,106
	push	ax
	mov	ax,86
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 888
	mov	ax,WORD PTR _BEAM_PIT
	mov	WORD PTR [bp-2],ax	;beampit
	cmp	ax,9100
	jle	$I1203
	mov	WORD PTR [bp-2],9100	;beampit
; Line 889
$I1203:
	cmp	WORD PTR [bp-2],-8736	;beampit
	jge	$I1204
	mov	WORD PTR [bp-2],-8736	;beampit
; Line 891
$I1204:
	cmp	WORD PTR _LightsOn,0
	je	$I1205
; Line 892
	mov	ax,54
	jmp	SHORT $L20092
	nop	
$I1205:
; Line 894
	mov	ax,16
$L20092:
	push	ax
	mov	ax,WORD PTR [bp-2]	;beampit
	mov	cx,-182
	cwd	
	idiv	cx
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,133
	push	ax
	mov	cx,100
	push	cx
	push	ax
	mov	ax,88
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
; Line 895
	mov	sp,bp
	pop	bp
	ret	

_DrawRadarElev	ENDP
; Line 900
	PUBLIC	_DrawRadarAlt
_DrawRadarAlt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
;	newalt = -12
;	soffset = -8
;	x2 = -6
;	y2 = -10
;	mseg = -14
;	t = -4
;	b = -2
; Line 907
	cmp	WORD PTR _View,0
	jne	$I1215
; Line 908
	mov	WORD PTR [bp-8],0	;soffset
; Line 909
	jmp	SHORT $I1216
	nop	
$I1215:
; Line 910
	mov	WORD PTR [bp-8],112	;soffset
$I1216:
; Line 912
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR [bp-14],ax	;mseg
	or	ax,ax
	je	$I1217
; Line 913
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,162
	sub	cx,WORD PTR [bp-8]	;soffset
	push	cx
	mov	cx,9
	push	cx
	push	WORD PTR _Rp2
	mov	cx,29
	push	cx
	mov	cx,35
	push	cx
	mov	cx,2
	push	cx
	mov	cx,254
	push	cx
	push	ax
	call	_TransRectCopy
	add	sp,20
; Line 914
; Line 915
$I1217:
; Line 916
	mov	ax,WORD PTR _RadarAlt
	mov	dx,WORD PTR _RadarAlt+2
	or	dx,dx
	jl	$L20016
	jg	$L20017
	cmp	ax,3000
	jbe	$L20016
$L20017:
	sub	dx,dx
	mov	ax,3000
$L20016:
	mov	WORD PTR [bp-12],ax	;newalt
	cmp	ax,500
	jge	$I1219
; Line 917
; Line 918
	mov	cx,500
	push	cx
	mov	cx,8192
	push	cx
	push	ax
	call	_MDiv
	add	sp,6
	jmp	SHORT $L20093
	nop	
$I1219:
; Line 921
; Line 922
	cmp	ax,1000
	jge	$I1222
; Line 923
; Line 924
	mov	ax,500
	push	ax
	mov	cx,4096
	push	cx
	sub	ax,WORD PTR [bp-12]	;newalt
	neg	ax
	push	ax
	call	_MDiv
	add	sp,6
	add	ah,32
	jmp	SHORT $L20093
$I1222:
; Line 927
; Line 928
	mov	ax,4000
	push	ax
	mov	ax,4096
	push	ax
	mov	ax,WORD PTR [bp-12]	;newalt
	sub	ax,1000
	push	ax
	call	_MDiv
	add	sp,6
	add	ah,48
$L20093:
	mov	WORD PTR [bp-4],ax	;t
; Line 929
; Line 930
; Line 933
	lea	ax,WORD PTR [bp-10]	;y2
	push	ax
	lea	cx,WORD PTR [bp-6]	;x2
	push	cx
	mov	cl,2
	shl	WORD PTR [bp-4],cl	;t
	push	WORD PTR [bp-4]	;t
	mov	cx,-10
	push	cx
	sub	cx,cx
	push	cx
	call	_Rotate2D
	add	sp,10
; Line 935
	cmp	WORD PTR _LightsOn,1
	sbb	ax,ax
	and	al,204
	add	ax,54
	push	ax
	push	WORD PTR [bp-10]	;y2
	call	_scaley
	add	sp,2
	sub	ax,WORD PTR [bp-8]	;soffset
	add	ax,176
	push	ax
	mov	ax,26
	sub	ax,WORD PTR [bp-6]	;x2
	push	ax
	mov	ax,176
	sub	ax,WORD PTR [bp-8]	;soffset
	push	ax
	mov	ax,26
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 936
	mov	ax,163
	sub	ax,WORD PTR [bp-8]	;soffset
	push	ax
	mov	cx,10
	push	cx
	push	WORD PTR _Rp1
	mov	dx,26
	push	dx
	mov	dx,32
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
; Line 937
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DrawRadarAlt	ENDP
; Line 941
	PUBLIC	_DrawAirSpeedGauge
_DrawAirSpeedGauge	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
	push	si
;	s = -10
;	soffset = -12
; Line 945
	cmp	WORD PTR _View,0
	jne	$I1229
; Line 946
	mov	WORD PTR [bp-12],0	;soffset
; Line 947
	jmp	SHORT $I1230
$I1229:
; Line 948
	mov	WORD PTR [bp-12],110	;soffset
$I1230:
; Line 950
	mov	bx,WORD PTR _Rp2
	mov	WORD PTR [bx+16],2
; Line 951
	cmp	WORD PTR _LightsOn,1
	sbb	ax,ax
	and	al,204
	add	ax,54
	mov	bx,WORD PTR _Rp2
	mov	WORD PTR [bx+12],ax
; Line 952
	cmp	WORD PTR _LightsOn,1
	cmc	
	sbb	ax,ax
	and	ax,22
	push	ax
	mov	ax,5
	push	ax
	mov	cx,11
	push	cx
	mov	dx,144
	sub	dx,WORD PTR [bp-12]	;soffset
	push	dx
	mov	bx,70
	push	bx
	push	WORD PTR _Rp2
	mov	si,dx
	call	FAR PTR _RectFill
	add	sp,12
; Line 953
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	push	WORD PTR _Knots
	call	_TAStoIAS
	add	sp,2
	push	ax
	call	_itoa
	add	sp,6
; Line 954
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	push	si
	mov	ax,70
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RpPrint
	add	sp,8
; Line 955
	push	si
	mov	ax,70
	push	ax
	push	WORD PTR _Rp1
	mov	cx,5
	push	cx
	mov	cx,11
	push	cx
	push	si
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 956
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_DrawAirSpeedGauge	ENDP
; Line 960
	PUBLIC	_DrawIndexer
_DrawIndexer	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	tempknot = -4
;	pos = -2
;	ballcolor = -6
; Line 976
	mov	ax,WORD PTR _MeatBall
	jmp	SHORT $S1236
; Line 977
$SC1240:
; Line 978
	mov	WORD PTR [bp-6],22	;ballcolor
; Line 979
	jmp	SHORT $SB1237
	nop	
$SC1242:
; Line 984
	mov	WORD PTR [bp-6],19	;ballcolor
; Line 985
	jmp	SHORT $SB1237
; Line 986
	nop	
$SC1243:
; Line 987
	mov	WORD PTR [bp-6],17	;ballcolor
; Line 988
	jmp	SHORT $SB1237
	nop	
$S1236:
	or	ax,ax
	je	$SC1240
	dec	ax
	je	$SC1240
	dec	ax
	je	$SC1242
	dec	ax
	je	$SC1243
	dec	ax
	je	$SC1243
$SB1237:
; Line 993
	push	WORD PTR [bp-6]	;ballcolor
	mov	ax,2
	push	ax
	mov	ax,3
	push	ax
	mov	ax,78
	push	ax
	mov	ax,80
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _RectFill
; Line 994
	mov	sp,bp
	pop	bp
	ret	

_DrawIndexer	ENDP
; Line 999
	PUBLIC	_DrawWayPoint
_DrawWayPoint	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	mseg = -2
; Line 1002
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR [bp-2],ax	;mseg
	or	ax,ax
	jne	$JCC5589
	jmp	$I1247
$JCC5589:
; Line 1003
	sub	cx,cx
	push	cx
	push	cx
	push	cx
	mov	cx,256
	push	cx
	mov	cx,52
	push	cx
	mov	cx,232
	push	cx
	push	WORD PTR _Rp2
	mov	cx,26
	push	cx
	mov	cx,34
	push	cx
	mov	cx,102
	push	cx
	push	cx
	push	ax
	call	_ScaleRotate
	add	sp,24
; Line 1004
	mov	ax,WORD PTR _NextWayPoint
	jmp	$S1248
; Line 1005
	nop	
$SC1252:
; Line 1006
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,56
	push	ax
	mov	ax,233
	push	ax
	push	WORD PTR _Rp2
	mov	ax,16
	push	ax
	push	ax
	mov	ax,98
	push	ax
	mov	ax,69
$L20096:
	push	ax
	push	WORD PTR [bp-2]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 1007
	jmp	$SB1249
; Line 1008
$SC1253:
; Line 1009
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,56
	push	ax
	mov	ax,231
	push	ax
	push	WORD PTR _Rp2
	mov	ax,16
	push	ax
	push	ax
	mov	ax,98
	push	ax
	mov	ax,18
	jmp	SHORT $L20096
; Line 1011
	nop	
$SC1254:
; Line 1012
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,56
	push	ax
	mov	ax,231
	push	ax
	push	WORD PTR _Rp2
	mov	ax,16
	push	ax
	mov	ax,12
	push	ax
	mov	ax,98
	push	ax
	mov	ax,36
	jmp	SHORT $L20096
; Line 1014
$SC1255:
; Line 1015
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,56
	push	ax
	mov	ax,232
	push	ax
	push	WORD PTR _Rp2
	mov	ax,16
	push	ax
	mov	ax,10
	push	ax
	mov	ax,98
	push	ax
	mov	ax,51
	jmp	SHORT $L20096
$S1248:
	or	ax,ax
	jne	$JCC5802
	jmp	$SC1252
$JCC5802:
	dec	ax
	je	$SC1253
	dec	ax
	je	$SC1254
	dec	ax
	je	$SC1255
$SB1249:
; Line 1018
	mov	ax,39
	push	ax
	mov	cx,215
	push	cx
	push	WORD PTR _Rp1
	mov	dx,26
	push	dx
	mov	dx,34
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
; Line 1019
; Line 1020
$I1247:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DrawWayPoint	ENDP
; Line 1023
	PUBLIC	_DrawRadarDials
_DrawRadarDials	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	mseg = -2
; Line 1028
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR [bp-2],ax	;mseg
	or	ax,ax
	jne	$JCC5880
	jmp	$SB1270
$JCC5880:
; Line 1029
	sub	cx,cx
	push	cx
	push	cx
	push	cx
	mov	dx,256
	push	dx
	mov	bx,154
	push	bx
	mov	bx,107
	push	bx
	push	WORD PTR _Rp1
	mov	bx,16
	push	bx
	mov	si,26
	push	si
	mov	si,124
	push	si
	mov	si,51
	push	si
	push	ax
	call	_ScaleRotate
	add	sp,24
; Line 1030
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,177
	push	ax
	mov	ax,94
	push	ax
	push	WORD PTR _Rp1
	mov	ax,16
	push	ax
	mov	ax,28
	push	ax
	mov	ax,123
	push	ax
	mov	ax,19
	push	ax
	push	WORD PTR [bp-2]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 1033
	mov	ax,WORD PTR _SELECTED_BAR_NUM
	cmp	ax,8
	jne	$JCC5981
	jmp	$SC1268
$JCC5981:
	ja	$SB1262
	or	al,al
	je	$SC1265
	sub	al,2
	je	$SC1266
	sub	al,2
	je	$SC1267
	jmp	SHORT $SB1262
; Line 1034
$SC1265:
; Line 1035
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	cx,256
	push	cx
	mov	cx,176
	push	cx
	mov	cx,94
	push	cx
	push	WORD PTR _Rp1
	mov	cx,12
	push	cx
	mov	cx,26
	push	cx
	mov	cx,76
	push	cx
	mov	cx,16
	push	cx
	push	WORD PTR [bp-2]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 1036
	mov	WORD PTR $S1257_NumBars,0
; Line 1037
$SB1262:
; Line 1055
	mov	ax,WORD PTR _SELECTED_AZ
	jmp	$S1269
; Line 1038
$SC1266:
; Line 1039
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,176
	push	ax
	mov	ax,94
	push	ax
	push	WORD PTR _Rp1
	mov	ax,12
	push	ax
	mov	ax,26
	push	ax
	mov	ax,76
	push	ax
	mov	ax,44
	push	ax
	push	WORD PTR [bp-2]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 1040
	mov	WORD PTR $S1257_NumBars,1
; Line 1041
	jmp	SHORT $SB1262
; Line 1042
$SC1267:
; Line 1043
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,176
	push	ax
	mov	ax,94
	push	ax
	push	WORD PTR _Rp1
	mov	ax,12
	push	ax
	mov	ax,26
	push	ax
	mov	ax,77
	push	ax
	mov	ax,72
	push	ax
	push	WORD PTR [bp-2]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 1044
	mov	WORD PTR $S1257_NumBars,2
; Line 1045
	jmp	SHORT $SB1262
; Line 1046
$SC1268:
; Line 1047
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,176
	push	ax
	mov	ax,94
	push	ax
	push	WORD PTR _Rp1
	mov	ax,12
	push	ax
	mov	ax,26
	push	ax
	mov	ax,78
	push	ax
	mov	ax,100
	push	ax
	push	WORD PTR [bp-2]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 1048
	mov	WORD PTR $S1257_NumBars,3
; Line 1049
	jmp	$SB1262
; Line 1056
	nop	
$SC1273:
; Line 1057
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	cx,256
	push	cx
	mov	cx,153
	push	cx
	mov	cx,107
	push	cx
	push	WORD PTR _Rp1
	mov	cx,12
	push	cx
	mov	cx,26
	push	cx
	mov	cx,76
	push	cx
	mov	cx,16
	push	cx
	push	WORD PTR [bp-2]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 1058
	mov	WORD PTR $S1258_SweepSize,0
; Line 1059
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1060
	nop	
$SC1274:
; Line 1061
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,153
	push	ax
	mov	ax,107
	push	ax
	push	WORD PTR _Rp1
	mov	ax,12
	push	ax
	mov	ax,26
	push	ax
	mov	ax,76
	push	ax
	mov	ax,44
	push	ax
	push	WORD PTR [bp-2]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 1062
	mov	WORD PTR $S1258_SweepSize,1
; Line 1063
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1064
	nop	
$SC1275:
; Line 1065
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,153
	push	ax
	mov	ax,107
	push	ax
	push	WORD PTR _Rp1
	mov	ax,12
	push	ax
	mov	ax,26
	push	ax
	mov	ax,77
	push	ax
	mov	ax,72
	push	ax
	push	WORD PTR [bp-2]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 1066
	mov	WORD PTR $S1258_SweepSize,2
; Line 1067
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1068
	nop	
$SC1276:
; Line 1069
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,153
	push	ax
	mov	ax,107
	push	ax
	push	WORD PTR _Rp1
	mov	ax,12
	push	ax
	mov	ax,26
	push	ax
	mov	ax,78
	push	ax
	mov	ax,100
	push	ax
	push	WORD PTR [bp-2]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 1070
	mov	WORD PTR $S1258_SweepSize,3
; Line 1071
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$S1269:
	or	ax,ax
	je	$SC1276
	dec	ax
	je	$SC1275
	dec	ax
	jne	$JCC6464
	jmp	$SC1274
$JCC6464:
	dec	ax
	jne	$JCC6470
	jmp	$SC1273
$JCC6470:
$SB1270:
; Line 1073
; Line 1074
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_DrawRadarDials	ENDP
; Line 1078
	PUBLIC	_TIDShowRange
_TIDShowRange	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
	push	si
;	l = -14
;	mseg = -12
;	s = -10
; Line 1084
	sub	ax,ax
	push	ax
	mov	cx,9
	push	cx
	mov	dx,29
	push	dx
	mov	bx,21
	push	bx
	mov	si,146
	push	si
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1085
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	bx,WORD PTR _Tscale
	shl	bx,1
	push	WORD PTR $S1278_RANGES[bx]
	call	_itoa
	add	sp,6
	push	ax
	push	WORD PTR _Rp2
	call	_pstrlen
	add	sp,4
	mov	WORD PTR [bp-14],ax	;l
; Line 1086
	lea	ax,WORD PTR [bp-10]	;s
	push	ax
	mov	ax,23
	push	ax
	mov	ax,WORD PTR [bp-14]	;l
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,160
	neg	ax
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RpPrint
	add	sp,8
; Line 1087
	mov	ax,21
	push	ax
	push	si
	push	WORD PTR _Rp1
	mov	cx,9
	push	cx
	mov	cx,29
	push	cx
	push	ax
	push	si
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 1089
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR [bp-12],ax	;mseg
	or	ax,ax
	jne	$JCC6642
	jmp	$I1282
$JCC6642:
; Line 1090
	sub	cx,cx
	push	cx
	push	cx
	push	cx
	mov	cx,256
	push	cx
	mov	cx,179
	push	cx
	mov	cx,187
	push	cx
	push	WORD PTR _Rp2
	mov	cx,31
	push	cx
	mov	cx,46
	push	cx
	mov	cx,175
	push	cx
	mov	cx,25
	push	cx
	push	ax
	call	_ScaleRotate
	add	sp,24
; Line 1091
	mov	ax,WORD PTR _Tscale
	jmp	$S1283
; Line 1092
	nop	
$SC1287:
; Line 1093
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,184
	push	ax
	mov	ax,183
	push	ax
	push	WORD PTR _Rp2
	mov	ax,13
	push	ax
	mov	ax,18
	push	ax
	mov	ax,145
	push	ax
	mov	ax,63
$L20097:
	push	ax
	push	WORD PTR [bp-12]	;mseg
	call	_ScaleRotate
	add	sp,24
; Line 1094
	jmp	$SB1284
; Line 1095
	nop	
$SC1288:
; Line 1096
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,182
	push	ax
	mov	ax,185
	push	ax
	push	WORD PTR _Rp2
	mov	ax,18
	push	ax
	mov	ax,16
	push	ax
	mov	ax,145
	push	ax
	mov	ax,23
	jmp	SHORT $L20097
; Line 1098
$SC1289:
; Line 1099
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,182
	push	ax
	mov	ax,187
	push	ax
	push	WORD PTR _Rp2
	mov	ax,17
	push	ax
	mov	ax,9
	push	ax
	mov	ax,145
	push	ax
	mov	ax,7
	jmp	SHORT $L20097
; Line 1101
$SC1290:
; Line 1102
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,182
	push	ax
	mov	ax,186
	push	ax
	push	WORD PTR _Rp2
	mov	ax,18
	push	ax
	mov	ax,16
	push	ax
	mov	ax,145
	push	ax
	mov	ax,42
	jmp	$L20097
; Line 1104
	nop	
$SC1291:
; Line 1105
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,256
	push	ax
	mov	ax,183
	push	ax
	mov	ax,187
	push	ax
	push	WORD PTR _Rp2
	mov	ax,13
	push	ax
	mov	ax,20
	push	ax
	mov	ax,145
	push	ax
	mov	ax,87
	jmp	$L20097
	nop	
$S1283:
	or	ax,ax
	je	$SC1291
	dec	ax
	je	$SC1290
	dec	ax
	jne	$JCC6912
	jmp	$SC1289
$JCC6912:
	dec	ax
	jne	$JCC6918
	jmp	$SC1288
$JCC6918:
	dec	ax
	jne	$JCC6924
	jmp	$SC1287
$JCC6924:
$SB1284:
; Line 1108
	mov	ax,164
	push	ax
	push	ax
	push	WORD PTR _Rp1
	mov	cx,31
	push	cx
	mov	cx,46
	push	cx
	push	ax
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 1109
; Line 1110
$I1282:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_TIDShowRange	ENDP
; Line 1115
	PUBLIC	_DrawRadarRange
_DrawRadarRange	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
;	s = -12
;	temprange = -2
;	l = -14
; Line 1120
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;temprange
	mov	WORD PTR [bp-14],ax	;l
	push	ax
	mov	ax,9
	push	ax
	mov	ax,23
	push	ax
	mov	ax,92
	push	ax
	mov	ax,150
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1121
	mov	ax,WORD PTR _RadarRange
	jmp	SHORT $S1296
; Line 1122
	nop	
$SC1300:
; Line 1123
	mov	WORD PTR [bp-2],5	;temprange
; Line 1124
	jmp	SHORT $SB1297
; Line 1125
	nop	
$SC1301:
; Line 1126
	mov	WORD PTR [bp-2],10	;temprange
; Line 1127
	jmp	SHORT $SB1297
; Line 1128
	nop	
$SC1302:
; Line 1129
	mov	WORD PTR [bp-2],20	;temprange
; Line 1130
	jmp	SHORT $SB1297
; Line 1131
	nop	
$SC1303:
; Line 1132
	mov	WORD PTR [bp-2],50	;temprange
; Line 1133
	jmp	SHORT $SB1297
; Line 1134
	nop	
$SC1304:
; Line 1135
	mov	WORD PTR [bp-2],100	;temprange
; Line 1136
	jmp	SHORT $SB1297
; Line 1137
	nop	
$SC1305:
; Line 1138
	mov	WORD PTR [bp-2],200	;temprange
; Line 1139
	jmp	SHORT $SB1297
	nop	
$S1296:
	cmp	ax,5
	ja	$SB1297
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20024[bx]
	nop	
$L20024:
		DW	$SC1300
		DW	$SC1301
		DW	$SC1302
		DW	$SC1303
		DW	$SC1304
		DW	$SC1305
$SB1297:
; Line 1141
	mov	ax,10
	push	ax
	lea	ax,WORD PTR [bp-12]	;s
	push	ax
	push	WORD PTR [bp-2]	;temprange
	call	_itoa
	add	sp,6
; Line 1142
	lea	ax,WORD PTR [bp-12]	;s
	push	ax
	push	WORD PTR _Rp2
	call	_pstrlen
	add	sp,4
	mov	WORD PTR [bp-14],ax	;l
; Line 1143
	lea	ax,WORD PTR [bp-12]	;s
	push	ax
	mov	ax,94
	push	ax
	mov	ax,WORD PTR [bp-14]	;l
	cwd	
	sub	ax,dx
	sar	ax,1
	sub	ax,162
	neg	ax
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RpPrint
	add	sp,8
; Line 1144
	mov	ax,92
	push	ax
	mov	cx,150
	push	cx
	push	WORD PTR _Rp1
	mov	dx,9
	push	dx
	mov	dx,23
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
; Line 1145
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DrawRadarRange	ENDP
; Line 1149
	PUBLIC	_DDDSwitchRefresh
_DDDSwitchRefresh	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
; Line 1150
	call	FAR PTR _MouseHIDE
; Line 1152
	cmp	WORD PTR _AWG9_SNIFF,0
	je	$I1307
; Line 1153
	mov	ax,34
	push	ax
	mov	ax,16
	push	ax
	mov	ax,5
	push	ax
	mov	ax,14
	push	ax
	mov	ax,112
	push	ax
	mov	cx,229
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1154
	mov	ax,27
	push	ax
	mov	cx,117
	push	cx
	mov	dx,229
	push	dx
	mov	bx,112
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1155
	mov	ax,26
	push	ax
	mov	ax,111
	push	ax
	mov	cx,243
	push	cx
	push	ax
	mov	ax,229
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1156
	mov	ax,27
	push	ax
	mov	ax,117
	push	ax
	mov	ax,243
	push	ax
	mov	cx,112
	push	cx
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1157
; Line 1158
$I1307:
	cmp	WORD PTR _AWG9_SNIFF,0
	jne	$I1308
; Line 1159
	mov	ax,16
	push	ax
	mov	ax,34
	push	ax
	mov	ax,5
	push	ax
	mov	ax,14
	push	ax
	mov	ax,112
	push	ax
	mov	cx,229
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1160
	mov	ax,29
	push	ax
	mov	cx,117
	push	cx
	mov	dx,229
	push	dx
	mov	bx,112
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1161
	mov	ax,29
	push	ax
	mov	cx,111
	push	cx
	mov	dx,243
	push	dx
	push	cx
	mov	cx,229
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1162
	mov	ax,29
	push	ax
	mov	ax,117
	push	ax
	mov	ax,243
	push	ax
	mov	cx,112
	push	cx
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1163
; Line 1165
$I1308:
	mov	ax,WORD PTR _RadarRange
	jmp	$S1309
; Line 1166
	nop	
$SC1313:
; Line 1167
	mov	ax,16
	push	ax
	mov	ax,34
	push	ax
	mov	ax,10
	push	ax
	mov	ax,11
	push	ax
	mov	ax,77
	push	ax
	mov	ax,113
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1168
	mov	ax,OFFSET DGROUP:$SG1314
	push	ax
	mov	ax,92
	push	ax
	mov	ax,150
	push	ax
	push	WORD PTR _Rp2
$L20098:
	call	FAR PTR _RpPrint
	add	sp,8
; Line 1169
	jmp	$SB1310
; Line 1170
	nop	
$SC1315:
; Line 1171
	mov	ax,16
	push	ax
	mov	ax,34
	push	ax
	mov	ax,10
	push	ax
	mov	ax,11
	push	ax
	mov	ax,77
	push	ax
	mov	ax,130
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1172
	mov	ax,OFFSET DGROUP:$SG1316
$L20099:
	push	ax
	mov	ax,92
	push	ax
	mov	ax,150
	push	ax
$L20100:
	push	WORD PTR _Rp1
	jmp	SHORT $L20098
; Line 1174
$SC1317:
; Line 1175
	mov	ax,16
	push	ax
	mov	ax,34
	push	ax
	mov	ax,10
	push	ax
	mov	ax,11
	push	ax
	mov	ax,77
	push	ax
	mov	ax,147
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1176
	mov	ax,OFFSET DGROUP:$SG1318
	jmp	SHORT $L20099
; Line 1178
	nop	
$SC1319:
; Line 1179
	mov	ax,16
	push	ax
	mov	ax,34
	push	ax
	mov	ax,10
	push	ax
	mov	ax,11
	push	ax
	mov	ax,77
	push	ax
	mov	ax,164
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1180
	mov	ax,OFFSET DGROUP:$SG1320
	jmp	SHORT $L20099
; Line 1182
	nop	
$SC1321:
; Line 1183
	mov	ax,16
	push	ax
	mov	ax,34
	push	ax
	mov	ax,10
	push	ax
	mov	ax,11
	push	ax
	mov	ax,77
	push	ax
	mov	ax,181
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1184
	mov	ax,OFFSET DGROUP:$SG1322
	jmp	$L20099
; Line 1186
$SC1323:
; Line 1187
	mov	ax,16
	push	ax
	mov	ax,34
	push	ax
	mov	ax,10
	push	ax
	mov	ax,12
	push	ax
	mov	ax,77
	push	ax
	mov	ax,198
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1188
	mov	ax,OFFSET DGROUP:$SG1324
	push	ax
	mov	ax,92
	push	ax
	mov	cx,150
	push	cx
	jmp	$L20100
	nop	
$S1309:
	cmp	ax,5
	ja	$SB1310
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20025[bx]
	nop	
$L20025:
		DW	$SC1313
		DW	$SC1315
		DW	$SC1317
		DW	$SC1319
		DW	$SC1321
		DW	$SC1323
$SB1310:
; Line 1193
	mov	ax,WORD PTR _AWG9_MODE
	cmp	ax,114
	jne	$JCC7804
	jmp	$SC1333
$JCC7804:
	jbe	$JCC7809
	jmp	$L20026
$JCC7809:
	cmp	ax,112
	jne	$JCC7817
	jmp	$SC1333
$JCC7817:
	jbe	$JCC7822
	jmp	$SB1326
$JCC7822:
	cmp	al,102
	je	$SC1329
	jbe	$JCC7831
	jmp	$L20027
$JCC7831:
	sub	al,30
	jne	$JCC7838
	jmp	$SC1331
$JCC7838:
	sub	al,10
	jne	$JCC7845
	jmp	$SC1332
$JCC7845:
	sub	al,60
	je	$JCC7852
	jmp	$SB1326
$JCC7852:
; Line 1194
$SC1329:
; Line 1198
	mov	ax,16
	push	ax
	mov	cx,34
	push	cx
	mov	cx,6
	push	cx
	push	ax
	mov	ax,133
	push	ax
	mov	cx,243
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1199
	mov	ax,29
	push	ax
	mov	cx,138
	push	cx
	mov	dx,243
	push	dx
	mov	bx,134
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1200
	mov	ax,29
	push	ax
	mov	cx,133
	push	cx
	mov	dx,259
	push	dx
	push	cx
	mov	cx,243
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1201
	mov	ax,29
	push	ax
	mov	ax,138
	push	ax
	mov	ax,259
$L20102:
	push	ax
	mov	cx,134
$L20101:
	push	cx
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1202
	jmp	$SB1326
; Line 1203
$SC1330:
; Line 1204
	mov	ax,16
	push	ax
	mov	cx,34
	push	cx
	mov	cx,6
	push	cx
	push	ax
	mov	ax,133
	push	ax
	mov	cx,225
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1205
	mov	ax,29
	push	ax
	mov	cx,139
	push	cx
	mov	dx,225
	push	dx
	mov	bx,134
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1206
	mov	ax,29
	push	ax
	mov	cx,133
	push	cx
	mov	dx,241
	push	dx
	push	cx
	mov	cx,225
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1207
	mov	ax,29
	push	ax
	mov	ax,139
	push	ax
	mov	ax,241
	jmp	SHORT $L20102
; Line 1209
$SC1331:
; Line 1213
	mov	ax,16
	push	ax
	mov	cx,34
	push	cx
	mov	cx,6
	push	cx
	push	ax
	mov	ax,147
	push	ax
	mov	cx,225
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1214
	mov	ax,29
	push	ax
	mov	cx,152
	push	cx
	mov	dx,225
	push	dx
	mov	bx,148
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1215
	mov	ax,29
	push	ax
	mov	cx,147
	push	cx
	mov	dx,241
	push	dx
	push	cx
	mov	cx,225
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1216
	mov	ax,29
	push	ax
	mov	ax,152
	push	ax
	mov	ax,241
$L20103:
	push	ax
	mov	cx,148
	jmp	$L20101
; Line 1218
	nop	
$SC1332:
; Line 1222
	mov	ax,16
	push	ax
	mov	cx,34
	push	cx
	mov	cx,6
	push	cx
	push	ax
	mov	ax,147
	push	ax
	mov	cx,243
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1223
	mov	ax,29
	push	ax
	mov	cx,152
	push	cx
	mov	dx,243
	push	dx
	mov	bx,148
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1224
	mov	ax,29
	push	ax
	mov	cx,147
	push	cx
	mov	dx,259
	push	dx
	push	cx
	mov	cx,243
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1225
	mov	ax,29
	push	ax
	mov	ax,152
	push	ax
	mov	ax,259
	jmp	SHORT $L20103
; Line 1227
$SC1333:
; Line 1231
	mov	ax,16
	push	ax
	mov	cx,34
	push	cx
	mov	cx,6
	push	cx
	push	ax
	mov	ax,158
	push	ax
	mov	cx,243
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1232
	mov	ax,29
	push	ax
	mov	cx,163
	push	cx
	mov	dx,243
	push	dx
	mov	bx,159
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1233
	mov	ax,29
	push	ax
	mov	cx,158
	push	cx
	mov	dx,259
	push	dx
	push	cx
	mov	cx,243
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1234
	mov	ax,29
	push	ax
	mov	ax,163
	push	ax
	mov	ax,259
	push	ax
	mov	cx,159
	jmp	$L20101
	nop	
$L20027:
	sub	al,104
	jne	$JCC8410
	jmp	$SC1329
$JCC8410:
	sub	al,2
	jne	$JCC8417
	jmp	$SC1329
$JCC8417:
	sub	al,4
	jne	$JCC8424
	jmp	$SC1333
$JCC8424:
	jmp	SHORT $SB1326
	nop	
$L20026:
	cmp	ax,126
	jne	$JCC8435
	jmp	$SC1331
$JCC8435:
	ja	$L20028
	cmp	ax,124
	jne	$JCC8445
	jmp	$SC1331
$JCC8445:
	ja	$SB1326
	sub	al,116
	jne	$JCC8454
	jmp	$SC1333
$JCC8454:
	sub	al,6
	jne	$JCC8461
	jmp	$SC1331
$JCC8461:
	jmp	SHORT $SB1326
$L20028:
	sub	ax,132
	jne	$JCC8471
	jmp	$SC1332
$JCC8471:
	dec	ax
	dec	ax
	jne	$JCC8478
	jmp	$SC1332
$JCC8478:
	dec	ax
	dec	ax
	jne	$JCC8485
	jmp	$SC1332
$JCC8485:
	sub	ax,164
	jne	$JCC8493
	jmp	$SC1330
$JCC8493:
$SB1326:
; Line 1237
	cmp	WORD PTR _ShowMouse,0
	je	$I1334
	call	_MouseShow
; Line 1238
$I1334:
	mov	sp,bp
	pop	bp
	ret	

_DDDSwitchRefresh	ENDP
; Line 1242
	PUBLIC	_DDDSwitches
_DDDSwitches	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
;	s = -10
; Line 1247
	mov	bx,WORD PTR _Rp2
	mov	WORD PTR [bx+16],2
; Line 1248
	mov	bx,WORD PTR _Rp2
	mov	WORD PTR [bx+12],1
; Line 1249
	mov	bx,WORD PTR _Rp2
	mov	WORD PTR [bx+14],1
; Line 1252
	call	FAR PTR _MouseHIDE
; Line 1254
	cmp	WORD PTR _AWG9_SNIFF,0
	jne	$JCC8558
	jmp	$I1340
$JCC8558:
	cmp	WORD PTR $S1336_RadarOn,0
	jne	$JCC8568
	jmp	$I1340
$JCC8568:
; Line 1255
	mov	ax,34
	push	ax
	mov	ax,16
	push	ax
	mov	ax,5
	push	ax
	mov	ax,14
	push	ax
	mov	ax,112
	push	ax
	mov	cx,229
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1256
	mov	WORD PTR $S1336_RadarOn,0
; Line 1257
	mov	ax,27
	push	ax
	mov	cx,117
	push	cx
	mov	dx,229
	push	dx
	mov	bx,112
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1258
	mov	ax,26
	push	ax
	mov	ax,111
	push	ax
	mov	cx,243
	push	cx
	push	ax
	mov	ax,229
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1259
	mov	ax,27
	push	ax
	mov	ax,117
	push	ax
	mov	ax,243
	push	ax
	mov	cx,112
	push	cx
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1260
; Line 1261
$I1340:
	cmp	WORD PTR _AWG9_SNIFF,0
	je	$JCC8707
	jmp	$I1341
$JCC8707:
	cmp	WORD PTR $S1336_RadarOn,0
	je	$JCC8717
	jmp	$I1341
$JCC8717:
; Line 1262
	mov	ax,16
	push	ax
	mov	ax,34
	push	ax
	mov	ax,5
	push	ax
	mov	ax,14
	push	ax
	mov	ax,112
	push	ax
	mov	cx,229
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1263
	mov	WORD PTR $S1336_RadarOn,1
; Line 1264
	mov	ax,29
	push	ax
	mov	cx,117
	push	cx
	mov	dx,229
	push	dx
	mov	bx,112
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1265
	mov	ax,29
	push	ax
	mov	cx,111
	push	cx
	mov	dx,243
	push	dx
	push	cx
	mov	cx,229
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1266
	mov	ax,29
	push	ax
	mov	ax,117
	push	ax
	mov	ax,243
	push	ax
	mov	cx,112
	push	cx
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1267
; Line 1270
$I1341:
	mov	ax,WORD PTR $S1338_PrevRadar
	cmp	WORD PTR _RadarRange,ax
	jne	$JCC8858
	jmp	$I1342
$JCC8858:
; Line 1271
	mov	ax,WORD PTR _RadarRange
	jmp	$S1343
; Line 1272
	nop	
$SC1347:
; Line 1273
	mov	ax,16
	push	ax
	mov	ax,34
	push	ax
	mov	ax,10
	push	ax
	mov	ax,11
	push	ax
	mov	ax,77
	push	ax
	mov	ax,113
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1274
	mov	ax,OFFSET DGROUP:$SG1348
	push	ax
	mov	ax,92
	push	ax
	mov	ax,150
	push	ax
	push	WORD PTR _Rp2
$L20104:
	call	FAR PTR _RpPrint
	add	sp,8
; Line 1275
	jmp	$SB1344
; Line 1276
	nop	
$SC1349:
; Line 1277
	mov	ax,16
	push	ax
	mov	ax,34
	push	ax
	mov	ax,10
	push	ax
	mov	ax,11
	push	ax
	mov	ax,77
	push	ax
	mov	ax,130
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1278
	mov	ax,OFFSET DGROUP:$SG1350
$L20105:
	push	ax
	mov	ax,92
	push	ax
	mov	ax,150
	push	ax
$L20106:
	push	WORD PTR _Rp1
	jmp	SHORT $L20104
; Line 1280
$SC1351:
; Line 1281
	mov	ax,16
	push	ax
	mov	ax,34
	push	ax
	mov	ax,10
	push	ax
	mov	ax,11
	push	ax
	mov	ax,77
	push	ax
	mov	ax,147
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1282
	mov	ax,OFFSET DGROUP:$SG1352
	jmp	SHORT $L20105
; Line 1284
	nop	
$SC1353:
; Line 1285
	mov	ax,16
	push	ax
	mov	ax,34
	push	ax
	mov	ax,10
	push	ax
	mov	ax,11
	push	ax
	mov	ax,77
	push	ax
	mov	ax,164
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1286
	mov	ax,OFFSET DGROUP:$SG1354
	jmp	SHORT $L20105
; Line 1288
	nop	
$SC1355:
; Line 1289
	mov	ax,16
	push	ax
	mov	ax,34
	push	ax
	mov	ax,10
	push	ax
	mov	ax,11
	push	ax
	mov	ax,77
	push	ax
	mov	ax,181
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1290
	mov	ax,OFFSET DGROUP:$SG1356
	jmp	$L20105
; Line 1292
$SC1357:
; Line 1293
	mov	ax,16
	push	ax
	mov	ax,34
	push	ax
	mov	ax,10
	push	ax
	mov	ax,12
	push	ax
	mov	ax,77
	push	ax
	mov	ax,198
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1294
	mov	ax,OFFSET DGROUP:$SG1358
	push	ax
	mov	ax,92
	push	ax
	mov	cx,150
	push	cx
	jmp	$L20106
	nop	
$S1343:
	cmp	ax,5
	ja	$SB1344
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20029[bx]
	nop	
$L20029:
		DW	$SC1347
		DW	$SC1349
		DW	$SC1351
		DW	$SC1353
		DW	$SC1355
		DW	$SC1357
$SB1344:
; Line 1298
	mov	ax,WORD PTR $S1338_PrevRadar
	jmp	$S1359
; Line 1299
$SC1363:
; Line 1300
	mov	ax,34
	push	ax
	mov	ax,16
	push	ax
	mov	ax,10
	push	ax
	mov	ax,11
	push	ax
	mov	ax,77
	push	ax
	mov	ax,113
$L20107:
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1301
	jmp	$SB1360
; Line 1302
	nop	
$SC1364:
; Line 1303
	mov	ax,34
	push	ax
	mov	ax,16
	push	ax
	mov	ax,10
	push	ax
	mov	ax,11
	push	ax
	mov	ax,77
	push	ax
	mov	ax,130
	jmp	SHORT $L20107
; Line 1305
	nop	
$SC1365:
; Line 1306
	mov	ax,34
	push	ax
	mov	ax,16
	push	ax
	mov	ax,10
	push	ax
	mov	ax,11
	push	ax
	mov	ax,77
	push	ax
	mov	ax,147
	jmp	SHORT $L20107
; Line 1308
	nop	
$SC1366:
; Line 1309
	mov	ax,34
	push	ax
	mov	ax,16
	push	ax
	mov	ax,10
	push	ax
	mov	ax,11
	push	ax
	mov	ax,77
	push	ax
	mov	ax,164
	jmp	SHORT $L20107
; Line 1311
	nop	
$SC1367:
; Line 1312
	mov	ax,34
	push	ax
	mov	ax,16
	push	ax
	mov	ax,10
	push	ax
	mov	ax,11
	push	ax
	mov	ax,77
	push	ax
	mov	ax,181
	jmp	SHORT $L20107
; Line 1314
	nop	
$SC1368:
; Line 1315
	mov	ax,34
	push	ax
	mov	ax,16
	push	ax
	mov	ax,10
	push	ax
	mov	ax,12
	push	ax
	mov	ax,77
	push	ax
	mov	ax,198
	jmp	$L20107
$S1359:
	cmp	ax,5
	ja	$SB1360
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20030[bx]
	nop	
$L20030:
		DW	$SC1363
		DW	$SC1364
		DW	$SC1365
		DW	$SC1366
		DW	$SC1367
		DW	$SC1368
$SB1360:
; Line 1318
	mov	ax,WORD PTR _RadarRange
	mov	WORD PTR $S1338_PrevRadar,ax
; Line 1319
; Line 1321
$I1342:
	mov	ax,WORD PTR _AWG9_MODE
	cmp	WORD PTR $S1337_RadarMode,ax
	jne	$JCC9407
	jmp	$I1369
$JCC9407:
; Line 1322
	cmp	ax,114
	jne	$JCC9415
	jmp	$SC1384
$JCC9415:
	jbe	$JCC9420
	jmp	$L20031
$JCC9420:
	cmp	ax,112
	jne	$JCC9428
	jmp	$SC1384
$JCC9428:
	ja	$SB1371
	cmp	al,102
	je	$SC1374
	jbe	$JCC9439
	jmp	$L20032
$JCC9439:
	sub	al,30
	jne	$JCC9446
	jmp	$SC1378
$JCC9446:
	sub	al,10
	jne	$JCC9453
	jmp	$SC1381
$JCC9453:
	sub	al,60
	jne	$SB1371
; Line 1323
$SC1374:
; Line 1328
	cmp	WORD PTR $S1337_RadarMode,100
	je	$SB1371
	cmp	WORD PTR $S1337_RadarMode,104
	je	$SB1371
	cmp	WORD PTR $S1337_RadarMode,102
	jne	$I1375
$SB1371:
; Line 1373
	mov	ax,WORD PTR $S1337_RadarMode
	cmp	ax,114
	jne	$JCC9489
	jmp	$SC1401
$JCC9489:
	jle	$JCC9494
	jmp	$L20034
$JCC9494:
	cmp	ax,112
	jne	$JCC9502
	jmp	$SC1401
$JCC9502:
	jbe	$JCC9507
	jmp	$SB1388
$JCC9507:
	cmp	al,102
	jne	$JCC9514
	jmp	$SC1391
$JCC9514:
	jle	$JCC9519
	jmp	$L20035
$JCC9519:
	sub	al,30
	jne	$JCC9526
	jmp	$SC1395
$JCC9526:
	sub	al,10
	jne	$JCC9533
	jmp	$SC1398
$JCC9533:
	sub	al,60
	jne	$JCC9540
	jmp	$SC1391
$JCC9540:
	jmp	$SB1388
; Line 1329
$I1375:
	mov	ax,16
	push	ax
	mov	cx,34
	push	cx
	mov	cx,6
	push	cx
	push	ax
	mov	ax,133
	push	ax
	mov	cx,243
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1330
	mov	ax,29
	push	ax
	mov	cx,138
	push	cx
	mov	dx,243
	push	dx
	mov	bx,134
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1331
	mov	ax,29
	push	ax
	mov	cx,133
	push	cx
	mov	dx,259
	push	dx
	push	cx
	mov	cx,243
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1332
	mov	ax,29
	push	ax
	mov	ax,138
	push	ax
	mov	ax,259
$L20109:
	push	ax
	mov	cx,134
$L20108:
	push	cx
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1333
	jmp	$SB1371
; Line 1334
	nop	
$SC1377:
; Line 1335
	mov	ax,16
	push	ax
	mov	cx,34
	push	cx
	mov	cx,6
	push	cx
	push	ax
	mov	ax,133
	push	ax
	mov	cx,225
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1336
	mov	ax,29
	push	ax
	mov	cx,139
	push	cx
	mov	dx,225
	push	dx
	mov	bx,134
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1337
	mov	ax,29
	push	ax
	mov	cx,133
	push	cx
	mov	dx,241
	push	dx
	push	cx
	mov	cx,225
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1338
	mov	ax,29
	push	ax
	mov	ax,139
	push	ax
	mov	ax,241
	jmp	SHORT $L20109
; Line 1340
$SC1378:
; Line 1344
	cmp	WORD PTR $S1337_RadarMode,124
	jne	$JCC9781
	jmp	$SB1371
$JCC9781:
	cmp	WORD PTR $S1337_RadarMode,122
	jne	$JCC9791
	jmp	$SB1371
$JCC9791:
; Line 1345
	mov	ax,16
	push	ax
	mov	cx,34
	push	cx
	mov	cx,6
	push	cx
	push	ax
	mov	ax,147
	push	ax
	mov	cx,225
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1346
	mov	ax,29
	push	ax
	mov	cx,152
	push	cx
	mov	dx,225
	push	dx
	mov	bx,148
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1347
	mov	ax,29
	push	ax
	mov	cx,147
	push	cx
	mov	dx,241
	push	dx
	push	cx
	mov	cx,225
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1348
	mov	ax,29
	push	ax
	mov	ax,152
	push	ax
	mov	ax,241
$L20110:
	push	ax
	mov	cx,148
	jmp	$L20108
; Line 1350
	nop	
$SC1381:
; Line 1354
	cmp	WORD PTR $S1337_RadarMode,134
	jne	$JCC9912
	jmp	$SB1371
$JCC9912:
	cmp	WORD PTR $S1337_RadarMode,132
	jne	$JCC9923
	jmp	$SB1371
$JCC9923:
; Line 1355
	mov	ax,16
	push	ax
	mov	cx,34
	push	cx
	mov	cx,6
	push	cx
	push	ax
	mov	ax,147
	push	ax
	mov	cx,243
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1356
	mov	ax,29
	push	ax
	mov	cx,152
	push	cx
	mov	dx,243
	push	dx
	mov	bx,148
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1357
	mov	ax,29
	push	ax
	mov	cx,147
	push	cx
	mov	dx,259
	push	dx
	push	cx
	mov	cx,243
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1358
	mov	ax,29
	push	ax
	mov	ax,152
	push	ax
	mov	ax,259
	jmp	$L20110
; Line 1360
	nop	
$SC1384:
; Line 1365
	cmp	WORD PTR $S1337_RadarMode,110
	jne	$JCC10039
	jmp	$SB1371
$JCC10039:
	cmp	WORD PTR $S1337_RadarMode,114
	jne	$JCC10049
	jmp	$SB1371
$JCC10049:
	cmp	WORD PTR $S1337_RadarMode,112
	jne	$JCC10059
	jmp	$SB1371
$JCC10059:
; Line 1366
	mov	ax,16
	push	ax
	mov	cx,34
	push	cx
	mov	cx,6
	push	cx
	push	ax
	mov	ax,158
	push	ax
	mov	cx,243
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1367
	mov	ax,29
	push	ax
	mov	cx,163
	push	cx
	mov	dx,243
	push	dx
	mov	bx,159
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1368
	mov	ax,29
	push	ax
	mov	cx,158
	push	cx
	mov	dx,259
	push	dx
	push	cx
	mov	cx,243
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1369
	mov	ax,29
	push	ax
	mov	ax,163
	push	ax
	mov	ax,259
	push	ax
	mov	cx,159
	jmp	$L20108
	nop	
$L20032:
	sub	al,104
	jne	$JCC10176
	jmp	$SC1374
$JCC10176:
	sub	al,2
	jne	$JCC10183
	jmp	$SC1374
$JCC10183:
	sub	al,4
	jne	$JCC10190
	jmp	$SC1384
$JCC10190:
	jmp	$SB1371
$L20031:
	cmp	ax,126
	jne	$JCC10201
	jmp	$SC1378
$JCC10201:
	ja	$L20033
	cmp	ax,124
	jne	$JCC10211
	jmp	$SC1378
$JCC10211:
	jbe	$JCC10216
	jmp	$SB1371
$JCC10216:
	sub	al,116
	jne	$JCC10223
	jmp	$SC1384
$JCC10223:
	sub	al,6
	jne	$JCC10230
	jmp	$SC1378
$JCC10230:
	jmp	$SB1371
$L20033:
	sub	ax,132
	jne	$JCC10241
	jmp	$SC1381
$JCC10241:
	dec	ax
	dec	ax
	jne	$JCC10248
	jmp	$SC1381
$JCC10248:
	dec	ax
	dec	ax
	jne	$JCC10255
	jmp	$SC1381
$JCC10255:
	sub	ax,164
	jne	$JCC10263
	jmp	$SC1377
$JCC10263:
	jmp	$SB1371
; Line 1374
	nop	
$SC1391:
; Line 1379
	cmp	WORD PTR _AWG9_MODE,100
	jne	$JCC10277
	jmp	$SB1388
$JCC10277:
	cmp	WORD PTR _AWG9_MODE,104
	jne	$JCC10287
	jmp	$SB1388
$JCC10287:
	cmp	WORD PTR _AWG9_MODE,102
	jne	$JCC10297
	jmp	$SB1388
$JCC10297:
; Line 1380
	mov	ax,34
	push	ax
	mov	ax,16
	push	ax
	mov	cx,6
	push	cx
	push	ax
	mov	ax,133
	push	ax
	mov	cx,243
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1381
	mov	ax,28
	push	ax
	mov	cx,138
	push	cx
	mov	dx,243
	push	dx
	mov	bx,134
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1382
	mov	ax,26
	push	ax
	mov	ax,133
	push	ax
	mov	cx,259
	push	cx
	push	ax
	mov	ax,243
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1383
	mov	ax,28
	push	ax
	mov	ax,138
	push	ax
	mov	ax,259
$L20112:
	push	ax
	mov	cx,134
$L20111:
	push	cx
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1384
	jmp	$SB1388
; Line 1385
	nop	
$SC1394:
; Line 1386
	mov	ax,34
	push	ax
	mov	ax,16
	push	ax
	mov	cx,6
	push	cx
	push	ax
	mov	ax,133
	push	ax
	mov	cx,225
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1387
	mov	ax,28
	push	ax
	mov	cx,139
	push	cx
	mov	dx,225
	push	dx
	mov	bx,134
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1388
	mov	ax,26
	push	ax
	mov	ax,133
	push	ax
	mov	cx,241
	push	cx
	push	ax
	mov	ax,225
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1389
	mov	ax,28
	push	ax
	mov	ax,139
	push	ax
	mov	ax,241
	jmp	SHORT $L20112
; Line 1391
$SC1395:
; Line 1395
	cmp	WORD PTR _AWG9_MODE,124
	jne	$JCC10535
	jmp	$SB1388
$JCC10535:
	cmp	WORD PTR _AWG9_MODE,122
	jne	$JCC10545
	jmp	$SB1388
$JCC10545:
; Line 1396
	mov	ax,34
	push	ax
	mov	ax,16
	push	ax
	mov	cx,6
	push	cx
	push	ax
	mov	ax,147
	push	ax
	mov	cx,225
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1397
	mov	ax,28
	push	ax
	mov	cx,152
	push	cx
	mov	dx,225
	push	dx
	mov	bx,148
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1398
	mov	ax,26
	push	ax
	mov	ax,147
	push	ax
	mov	cx,241
	push	cx
	push	ax
	mov	ax,225
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1399
	mov	ax,28
	push	ax
	mov	ax,152
	push	ax
	mov	ax,241
$L20113:
	push	ax
	mov	cx,148
	jmp	$L20111
; Line 1401
	nop	
$SC1398:
; Line 1405
	cmp	WORD PTR _AWG9_MODE,134
	jne	$JCC10666
	jmp	$SB1388
$JCC10666:
	cmp	WORD PTR _AWG9_MODE,132
	jne	$JCC10677
	jmp	$SB1388
$JCC10677:
; Line 1406
	mov	ax,34
	push	ax
	mov	ax,16
	push	ax
	mov	cx,6
	push	cx
	push	ax
	mov	ax,147
	push	ax
	mov	cx,243
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1407
	mov	ax,28
	push	ax
	mov	cx,152
	push	cx
	mov	dx,243
	push	dx
	mov	bx,148
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1408
	mov	ax,26
	push	ax
	mov	ax,147
	push	ax
	mov	cx,259
	push	cx
	push	ax
	mov	ax,243
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1409
	mov	ax,28
	push	ax
	mov	ax,152
	push	ax
	mov	ax,259
	jmp	$L20113
; Line 1411
	nop	
$SC1401:
; Line 1416
	cmp	WORD PTR _AWG9_MODE,110
	jne	$JCC10793
	jmp	$SB1388
$JCC10793:
	cmp	WORD PTR _AWG9_MODE,114
	jne	$JCC10803
	jmp	$SB1388
$JCC10803:
	cmp	WORD PTR _AWG9_MODE,112
	jne	$JCC10813
	jmp	$SB1388
$JCC10813:
; Line 1417
	mov	ax,34
	push	ax
	mov	ax,16
	push	ax
	mov	cx,6
	push	cx
	push	ax
	mov	ax,158
	push	ax
	mov	cx,243
	push	cx
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1418
	mov	ax,28
	push	ax
	mov	cx,163
	push	cx
	mov	dx,243
	push	dx
	mov	bx,159
	push	bx
	push	dx
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1419
	mov	ax,26
	push	ax
	mov	ax,158
	push	ax
	mov	cx,259
	push	cx
	push	ax
	mov	ax,243
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1420
	mov	ax,28
	push	ax
	mov	ax,163
	push	ax
	mov	ax,259
	push	ax
	mov	cx,159
	jmp	$L20111
	nop	
$L20035:
	sub	al,104
	jne	$JCC10930
	jmp	$SC1391
$JCC10930:
	sub	al,2
	jne	$JCC10937
	jmp	$SC1391
$JCC10937:
	sub	al,4
	jne	$JCC10944
	jmp	$SC1401
$JCC10944:
	jmp	SHORT $SB1388
	nop	
$L20034:
	cmp	ax,126
	jne	$JCC10955
	jmp	$SC1395
$JCC10955:
	jg	$L20036
	cmp	ax,124
	jne	$JCC10965
	jmp	$SC1395
$JCC10965:
	ja	$SB1388
	sub	al,116
	jne	$JCC10974
	jmp	$SC1401
$JCC10974:
	sub	al,6
	jne	$JCC10981
	jmp	$SC1395
$JCC10981:
	jmp	SHORT $SB1388
$L20036:
	sub	ax,132
	jne	$JCC10991
	jmp	$SC1398
$JCC10991:
	dec	ax
	dec	ax
	jne	$JCC10998
	jmp	$SC1398
$JCC10998:
	dec	ax
	dec	ax
	jne	$JCC11005
	jmp	$SC1398
$JCC11005:
	sub	ax,164
	jne	$JCC11013
	jmp	$SC1394
$JCC11013:
$SB1388:
; Line 1423
	mov	ax,WORD PTR _AWG9_MODE
	mov	WORD PTR $S1337_RadarMode,ax
; Line 1424
; Line 1426
$I1369:
	cmp	WORD PTR _ShowMouse,0
	je	$I1404
	call	_MouseShow
; Line 1427
$I1404:
	mov	sp,bp
	pop	bp
	ret	

_DDDSwitches	ENDP
; Line 1432
	PUBLIC	_DrawCompass
_DrawCompass	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	soffset = -6
;	mseg = -8
;	x = -2
;	y = -4
; Line 1437
	cmp	WORD PTR _View,0
	jne	$I1410
; Line 1438
	mov	WORD PTR [bp-6],0	;soffset
; Line 1439
	jmp	SHORT $I1411
	nop	
$I1410:
; Line 1440
	mov	WORD PTR [bp-6],112	;soffset
$I1411:
; Line 1442
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR [bp-8],ax	;mseg
	or	ax,ax
	je	$I1412
; Line 1443
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,166
	sub	cx,WORD PTR [bp-6]	;soffset
	push	cx
	mov	cx,219
	push	cx
	push	WORD PTR _Rp2
	mov	cx,35
	push	cx
	mov	cx,32
	push	cx
	mov	cx,2
	push	cx
	mov	cx,218
	push	cx
	push	ax
	call	_TransRectCopy
	add	sp,20
; Line 1444
; Line 1446
$I1412:
	lea	ax,WORD PTR [bp-4]	;y
	push	ax
	lea	cx,WORD PTR [bp-2]	;x
	push	cx
	mov	dx,WORD PTR _OurHead
	neg	dx
	push	dx
	mov	dx,10
	push	dx
	sub	dx,dx
	push	dx
	call	_Rotate2D
	add	sp,10
; Line 1447
	cmp	WORD PTR _LightsOn,1
	sbb	ax,ax
	and	al,204
	add	ax,54
	push	ax
	push	WORD PTR [bp-4]	;y
	call	_scaley
	add	sp,2
	sub	ax,178
	neg	ax
	sub	ax,WORD PTR [bp-6]	;soffset
	push	ax
	mov	ax,235
	sub	ax,WORD PTR [bp-2]	;x
	push	ax
	mov	ax,178
	sub	ax,WORD PTR [bp-6]	;soffset
	push	ax
	mov	ax,235
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1449
	mov	ax,166
	sub	ax,WORD PTR [bp-6]	;soffset
	push	ax
	mov	cx,219
	push	cx
	push	WORD PTR _Rp1
	mov	dx,27
	push	dx
	mov	dx,32
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
; Line 1450
	mov	sp,bp
	pop	bp
	ret	

_DrawCompass	ENDP
; Line 1454
	PUBLIC	_DrawVVGauge
_DrawVVGauge	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
	push	si
;	vv = -12
;	x = -2
;	y = -4
;	soffset = -8
;	mseg = -10
;	tv = -6
; Line 1461
	cmp	WORD PTR _View,0
	jne	$I1420
; Line 1462
	mov	WORD PTR [bp-8],0	;soffset
; Line 1463
	jmp	SHORT $I1421
$I1420:
; Line 1464
	mov	WORD PTR [bp-8],112	;soffset
$I1421:
; Line 1466
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	or	ax,ax
	je	$I1422
; Line 1467
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,136
	sub	cx,WORD PTR [bp-8]	;soffset
	push	cx
	mov	cx,26
	push	cx
	push	WORD PTR _Rp2
	mov	cx,22
	push	cx
	mov	cx,25
	push	cx
	mov	cx,2
	push	cx
	mov	cx,189
	push	cx
	push	ax
	call	_TransRectCopy
	add	sp,20
; Line 1468
; Line 1470
$I1422:
; Line 1471
	mov	ax,WORD PTR _VVI
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	mov	WORD PTR [bp-6],ax	;tv
	cmp	ax,400
	jle	$I1423
	mov	WORD PTR [bp-6],400	;tv
; Line 1472
$I1423:
	cmp	WORD PTR [bp-6],-400	;tv
	jge	$I1424
	mov	WORD PTR [bp-6],-400	;tv
; Line 1473
$I1424:
; Line 1474
	mov	ax,65
	imul	WORD PTR [bp-6]	;tv
	push	ax
	mov	cx,8
	push	cx
	mov	si,ax
	call	_ACosB
	add	sp,4
	neg	ax
	mov	WORD PTR [bp-2],ax	;x
; Line 1475
	push	si
	mov	ax,8
	push	ax
	call	_ASinB
	add	sp,4
	mov	WORD PTR [bp-4],ax	;y
; Line 1477
	cmp	WORD PTR _LightsOn,1
	sbb	ax,ax
	and	al,204
	add	ax,54
	push	ax
	push	WORD PTR [bp-4]	;y
	call	_scaley
	add	sp,2
	sub	ax,147
	neg	ax
	sub	ax,WORD PTR [bp-8]	;soffset
	push	ax
	mov	ax,WORD PTR [bp-2]	;x
	add	ax,38
	push	ax
	mov	ax,147
	sub	ax,WORD PTR [bp-8]	;soffset
	push	ax
	mov	ax,38
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1478
	mov	ax,137
	sub	ax,WORD PTR [bp-8]	;soffset
	push	ax
	mov	cx,26
	push	cx
	push	WORD PTR _Rp1
	mov	dx,19
	push	dx
	mov	dx,23
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 1479
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DrawVVGauge	ENDP
; Line 1483
	PUBLIC	_DrawAltGauge
_DrawAltGauge	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,26
	call	__aNchkstk
	push	si
;	font = -16
;	alt = -4
;	x = -18
;	y = -20
;	althund = -2
;	newalt = -24
;	s = -14
;	soffset = -22
;	mseg = -26
; Line 1484
	mov	WORD PTR [bp-16],0	;font
; Line 1494
	cmp	WORD PTR _View,0
	jne	$I1437
; Line 1495
	mov	WORD PTR [bp-22],0	;soffset
; Line 1496
	jmp	SHORT $I1438
	nop	
$I1437:
; Line 1497
	mov	WORD PTR [bp-22],110	;soffset
$I1438:
; Line 1500
	mov	bx,WORD PTR _Rp2
	mov	WORD PTR [bx+16],2
; Line 1501
	cmp	WORD PTR _LightsOn,1
	sbb	ax,ax
	and	al,204
	add	ax,54
	mov	bx,WORD PTR _Rp2
	mov	WORD PTR [bx+12],ax
; Line 1503
	mov	ax,WORD PTR _OurAlt
	mov	WORD PTR [bp-4],ax	;alt
	mov	cx,1000
	sub	dx,dx
	div	cx
	mov	WORD PTR [bp-2],dx	;althund
; Line 1505
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	mov	WORD PTR [bp-26],ax	;mseg
	or	ax,ax
	je	$I1439
; Line 1506
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,164
	sub	cx,WORD PTR [bp-22]	;soffset
	push	cx
	mov	cx,55
	push	cx
	push	WORD PTR _Rp2
	mov	cx,29
	push	cx
	mov	cx,33
	push	cx
	mov	cx,35
	push	cx
	mov	cx,1
	push	cx
	push	ax
	call	_TransRectCopy
	add	sp,20
; Line 1507
; Line 1509
$I1439:
	mov	ax,10
	push	ax
	lea	cx,WORD PTR [bp-14]	;s
	push	cx
	mov	ax,WORD PTR [bp-4]	;alt
	mov	bx,1000
	sub	dx,dx
	div	bx
	push	ax
	call	_itoa
	add	sp,6
; Line 1510
	mov	ax,22
	push	ax
	mov	ax,6
	push	ax
	mov	ax,10
	push	ax
	mov	ax,175
	sub	ax,WORD PTR [bp-22]	;soffset
	push	ax
	mov	cx,59
	push	cx
	push	WORD PTR _Rp2
	mov	si,ax
	call	FAR PTR _RectFill
	add	sp,12
; Line 1511
	lea	ax,WORD PTR [bp-14]	;s
	push	ax
	push	si
	mov	ax,61
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RpPrint
	add	sp,8
; Line 1512
	lea	ax,WORD PTR [bp-20]	;y
	push	ax
	lea	cx,WORD PTR [bp-18]	;x
	push	cx
	mov	ax,65
	mul	WORD PTR [bp-2]	;althund
	push	ax
	mov	ax,-10
	push	ax
	sub	ax,ax
	push	ax
	call	_Rotate2D
	add	sp,10
; Line 1513
	cmp	WORD PTR _LightsOn,1
	sbb	ax,ax
	and	al,204
	add	ax,54
	push	ax
	push	WORD PTR [bp-20]	;y
	call	_scaley
	add	sp,2
	sub	ax,WORD PTR [bp-22]	;soffset
	add	ax,177
	push	ax
	mov	ax,70
	sub	ax,WORD PTR [bp-18]	;x
	push	ax
	mov	ax,177
	sub	ax,WORD PTR [bp-22]	;soffset
	push	ax
	mov	ax,71
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1518
	mov	ax,162
	sub	ax,WORD PTR [bp-22]	;soffset
	push	ax
	mov	cx,52
	push	cx
	push	WORD PTR _Rp1
	mov	dx,28
	push	dx
	mov	dx,39
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 1520
	mov	ax,WORD PTR [bp-16]	;font
	mov	bx,WORD PTR _Rp2
	mov	WORD PTR [bx+16],ax
; Line 1521
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DrawAltGauge	ENDP
; Line 1525
	PUBLIC	_DrawStores
_DrawStores	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,48
	call	__aNchkstk
	push	di
	push	si
;	i = -36
;	j = -38
;	status = -2
;	ypos = -40
;	prior = -42
;	storelight = -34
; Line 1531
	mov	WORD PTR [bp-34],96	;storelight
; Line 1532
	mov	WORD PTR [bp-30],107
; Line 1533
	mov	WORD PTR [bp-26],118
; Line 1534
	mov	WORD PTR [bp-22],129
; Line 1535
	mov	WORD PTR [bp-18],185
; Line 1536
	mov	WORD PTR [bp-14],196
; Line 1537
	mov	WORD PTR [bp-10],207
; Line 1538
	mov	WORD PTR [bp-6],218
	mov	ax,127
	mov	WORD PTR [bp-32],ax
	mov	WORD PTR [bp-28],ax
	mov	WORD PTR [bp-24],ax
	mov	WORD PTR [bp-20],ax
	mov	WORD PTR [bp-16],ax
	mov	WORD PTR [bp-12],ax
	mov	WORD PTR [bp-8],ax
	mov	WORD PTR [bp-4],ax
; Line 1541
	call	_AAGetStation
	mov	WORD PTR [bp-42],ax	;prior
; Line 1543
	cmp	WORD PTR _View,0
	jne	$I1450
; Line 1544
	mov	WORD PTR [bp-40],127	;ypos
; Line 1545
	jmp	SHORT $I1451
$I1450:
; Line 1546
	mov	WORD PTR [bp-40],16	;ypos
$I1451:
; Line 1548
	mov	WORD PTR [bp-36],0	;i
	jmp	$F1452
	nop	
$I1458:
; Line 1562
	mov	WORD PTR [bp-2],5	;status
$I1461:
; Line 1564
	mov	ax,WORD PTR [bp-36]	;i
	cmp	WORD PTR [bp-42],ax	;prior
	jne	$I1462
	mov	WORD PTR [bp-2],16	;status
; Line 1566
$I1462:
	or	ax,ax
	jne	$I1463
	mov	WORD PTR [bp-38],ax	;j
; Line 1567
$I1463:
	cmp	ax,1
	jne	$I1464
	mov	WORD PTR [bp-38],7	;j
; Line 1569
$I1464:
	cmp	ax,2
	jne	$I1465
	mov	WORD PTR [bp-38],1	;j
; Line 1570
$I1465:
	cmp	ax,3
	jne	$I1466
	mov	WORD PTR [bp-38],6	;j
; Line 1572
$I1466:
	cmp	ax,6
	jne	$I1467
	mov	WORD PTR [bp-38],2	;j
; Line 1573
$I1467:
	cmp	ax,7
	jne	$I1468
	mov	WORD PTR [bp-38],5	;j
; Line 1576
$I1468:
	cmp	ax,8
	jne	$I1469
	mov	WORD PTR [bp-38],4	;j
; Line 1577
$I1469:
	cmp	ax,9
	jne	$I1470
	mov	WORD PTR [bp-38],3	;j
; Line 1579
$I1470:
	cmp	ax,10
	jne	$I1471
	mov	WORD PTR [bp-38],4	;j
; Line 1580
$I1471:
	cmp	ax,11
	jne	$I1472
	mov	WORD PTR [bp-38],3	;j
; Line 1582
$I1472:
	cmp	WORD PTR [bp-2],16	;status
	je	$JCC12117
	jmp	$I1473
$JCC12117:
; Line 1583
	sub	ax,ax
	push	ax
	mov	ax,3
	push	ax
	mov	cx,6
	push	cx
	push	WORD PTR [bp-40]	;ypos
	mov	si,WORD PTR [bp-38]	;j
	shl	si,1
	shl	si,1
	push	WORD PTR [bp-34][si]
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1584
	mov	ax,15
	push	ax
	push	WORD PTR [bp-40]	;ypos
	mov	cx,WORD PTR [bp-34][si]
	mov	dx,cx
	inc	cx
	push	cx
	push	WORD PTR _Rp2
	mov	si,cx
	mov	di,dx
	call	FAR PTR _DrawDot
	add	sp,8
; Line 1585
	mov	ax,15
	push	ax
	push	WORD PTR [bp-40]	;ypos
	lea	cx,WORD PTR [di+3]
	push	cx
	push	WORD PTR _Rp2
	mov	WORD PTR [bp-44],cx
	call	FAR PTR _DrawDot
	add	sp,8
; Line 1586
	mov	ax,15
	push	ax
	push	WORD PTR [bp-40]	;ypos
	lea	cx,WORD PTR [di+5]
	push	cx
	push	WORD PTR _Rp2
	mov	WORD PTR [bp-46],cx
	call	FAR PTR _DrawDot
	add	sp,8
; Line 1587
	mov	ax,15
	push	ax
	mov	cx,WORD PTR [bp-40]	;ypos
	inc	cx
	push	cx
	push	di
	push	WORD PTR _Rp2
	mov	WORD PTR [bp-48],cx
	call	FAR PTR _DrawDot
	add	sp,8
; Line 1588
	mov	ax,15
	push	ax
	push	WORD PTR [bp-48]
	lea	cx,WORD PTR [di+2]
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
	add	sp,8
; Line 1589
	mov	ax,15
	push	ax
	push	WORD PTR [bp-48]
	lea	cx,WORD PTR [di+4]
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
	add	sp,8
; Line 1590
	mov	ax,15
	push	ax
	mov	cx,WORD PTR [bp-40]	;ypos
	inc	cx
	inc	cx
	push	cx
	push	si
	push	WORD PTR _Rp2
	mov	si,cx
	call	FAR PTR _DrawDot
	add	sp,8
; Line 1591
	mov	ax,15
	push	ax
	push	si
	push	WORD PTR [bp-44]
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
	add	sp,8
; Line 1592
	mov	ax,15
	push	ax
	push	si
	push	WORD PTR [bp-46]
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
	add	sp,8
; Line 1593
	jmp	SHORT $I1474
$I1473:
; Line 1594
	push	WORD PTR [bp-2]	;status
	mov	ax,3
	push	ax
	mov	ax,6
	push	ax
	push	WORD PTR [bp-40]	;ypos
	mov	si,WORD PTR [bp-38]	;j
	shl	si,1
	shl	si,1
	push	WORD PTR [bp-34][si]
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1595
$I1474:
; Line 1596
	push	WORD PTR [bp-40]	;ypos
	mov	si,WORD PTR [bp-38]	;j
	shl	si,1
	shl	si,1
	push	WORD PTR [bp-34][si]
	push	WORD PTR _Rp1
	mov	ax,2
	push	ax
	mov	ax,6
	push	ax
	push	WORD PTR [bp-40]	;ypos
	push	WORD PTR [bp-34][si]
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 1597
$FC1453:
	inc	WORD PTR [bp-36]	;i
$F1452:
	cmp	WORD PTR [bp-36],12	;i
	jge	$FB1454
; Line 1549
	cmp	WORD PTR [bp-36],4	;i
	je	$FC1453
; Line 1550
	cmp	WORD PTR [bp-36],5	;i
	je	$FC1453
; Line 1552
	mov	bx,WORD PTR [bp-36]	;i
	shl	bx,1
	cmp	WORD PTR _F14_STATION[bx],-1
	je	$FC1453
; Line 1556
	mov	bx,WORD PTR [bp-36]	;i
	shl	bx,1
	cmp	WORD PTR _F14_STATION[bx],0
	jne	$JCC12500
	jmp	$I1458
$JCC12500:
; Line 1560
	mov	WORD PTR [bp-2],2	;status
; Line 1561
	jmp	$I1461
	nop	
$FB1454:
; Line 1598
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_DrawStores	ENDP
; Line 1603
	PUBLIC	_DrawAOADisplay
_DrawAOADisplay	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	inewaoa = -2
; Line 1606
	mov	ax,29
	push	ax
	mov	ax,17
	push	ax
	mov	ax,3
	push	ax
	mov	cx,109
	push	cx
	mov	cx,82
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1608
	mov	ax,WORD PTR _PitchAngle
	mov	cx,182
	cwd	
	idiv	cx
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	mov	WORD PTR [bp-2],ax	;inewaoa
	cmp	ax,30
	jle	$I1477
	mov	WORD PTR [bp-2],30	;inewaoa
; Line 1609
$I1477:
	cmp	WORD PTR [bp-2],0	;inewaoa
	jge	$I1478
	mov	WORD PTR [bp-2],0	;inewaoa
; Line 1610
$I1478:
	mov	ax,2
	push	ax
	push	WORD PTR [bp-2]	;inewaoa
	mov	ax,3
	push	ax
	mov	cx,125
	sub	cx,WORD PTR [bp-2]	;inewaoa
	push	cx
	mov	cx,82
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1611
	mov	ax,34
	push	ax
	mov	cx,110
	push	cx
	mov	dx,84
	push	dx
	push	cx
	mov	cx,82
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1612
	mov	ax,34
	push	ax
	mov	cx,115
	push	cx
	mov	dx,84
	push	dx
	push	cx
	mov	cx,82
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1613
	mov	ax,34
	push	ax
	mov	cx,120
	push	cx
	mov	dx,84
	push	dx
	push	cx
	mov	cx,82
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1614
	mov	ax,34
	push	ax
	mov	ax,125
	push	ax
	mov	cx,84
	push	cx
	push	ax
	mov	ax,82
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1615
	mov	ax,109
	push	ax
	mov	cx,82
	push	cx
	push	WORD PTR _Rp1
	mov	dx,17
	push	dx
	mov	dx,3
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
; Line 1616
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DrawAOADisplay	ENDP
; Line 1621
	PUBLIC	_DrawSweepDisplay
_DrawSweepDisplay	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	pos = -2
; Line 1626
	mov	ax,WORD PTR _WingRot
	cmp	WORD PTR $S1480_prevrot,ax
	jne	$JCC12802
	jmp	$I1482
$JCC12802:
; Line 1627
	cmp	ax,5460
	jg	$I1483
; Line 1628
	mov	WORD PTR [bp-2],0	;pos
; Line 1629
$I1483:
	cmp	ax,5460
	jle	$I1486
	cmp	ax,7280
	jl	$I1485
$I1486:
	cmp	ax,7280
	jne	$I1484
$I1485:
; Line 1630
	mov	WORD PTR [bp-2],1	;pos
; Line 1631
$I1484:
	cmp	ax,7280
	jle	$I1489
	cmp	ax,9100
	jl	$I1488
$I1489:
	cmp	ax,9100
	jne	$I1487
$I1488:
; Line 1632
	mov	WORD PTR [bp-2],2	;pos
; Line 1633
$I1487:
	cmp	ax,9100
	jle	$I1490
	cmp	ax,10920
	jge	$I1490
; Line 1634
	mov	WORD PTR [bp-2],3	;pos
; Line 1635
$I1490:
	cmp	ax,10920
	jl	$I1491
; Line 1636
	mov	WORD PTR [bp-2],4	;pos
; Line 1638
$I1491:
	mov	WORD PTR $S1480_prevrot,ax
; Line 1639
	mov	ax,33
	push	ax
	mov	ax,21
	push	ax
	mov	cx,1
	push	cx
	mov	dx,105
	push	dx
	mov	bx,234
	push	bx
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1640
	mov	ax,32
	push	ax
	mov	cx,108
	push	cx
	mov	cx,234
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
	add	sp,8
; Line 1641
	mov	ax,32
	push	ax
	mov	cx,113
	push	cx
	mov	cx,234
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
	add	sp,8
; Line 1642
	mov	ax,32
	push	ax
	mov	cx,118
	push	cx
	mov	cx,234
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
	add	sp,8
; Line 1643
	mov	ax,32
	push	ax
	mov	ax,123
	push	ax
	mov	ax,234
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _DrawDot
	add	sp,8
; Line 1644
	mov	ax,105
	push	ax
	mov	cx,234
	push	cx
	push	WORD PTR _Rp1
	mov	dx,21
	push	dx
	mov	dx,1
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 1646
	mov	ax,WORD PTR [bp-2]	;pos
	jmp	SHORT $S1492
; Line 1647
$SC1496:
; Line 1648
	mov	ax,2
	push	ax
	mov	ax,107
	push	ax
	mov	ax,234
	push	ax
	mov	cx,105
$L20116:
	push	cx
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _DrawLine
	add	sp,12
; Line 1649
	jmp	SHORT $SB1493
; Line 1650
	nop	
$SC1497:
; Line 1651
	mov	ax,2
	push	ax
	mov	ax,112
	push	ax
	mov	ax,234
	push	ax
	mov	cx,109
	jmp	SHORT $L20116
; Line 1653
	nop	
$SC1498:
; Line 1654
	mov	ax,2
	push	ax
	mov	ax,117
	push	ax
	mov	ax,234
	push	ax
	mov	cx,114
	jmp	SHORT $L20116
; Line 1656
	nop	
$SC1499:
; Line 1657
	mov	ax,2
	push	ax
	mov	ax,122
	push	ax
	mov	ax,234
	push	ax
	mov	cx,119
	jmp	SHORT $L20116
; Line 1659
	nop	
$SC1500:
; Line 1660
	mov	ax,2
	push	ax
	mov	ax,126
	push	ax
	mov	ax,234
	push	ax
	mov	cx,124
	jmp	SHORT $L20116
	nop	
$S1492:
	or	ax,ax
	je	$SC1496
	dec	ax
	je	$SC1497
	dec	ax
	je	$SC1498
	dec	ax
	je	$SC1499
	dec	ax
	je	$SC1500
$SB1493:
; Line 1663
	mov	ax,105
	push	ax
	mov	cx,234
	push	cx
	push	WORD PTR _Rp1
	mov	dx,21
	push	dx
	mov	dx,1
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
; Line 1664
; Line 1665
$I1482:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DrawSweepDisplay	ENDP
; Line 1669
	PUBLIC	_DrawEngineStat
_DrawEngineStat	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
	push	di
	push	si
;	Lrpm = -6
;	Rrpm = -2
;	Lff = -4
;	Rff = -8
; Line 1674
	mov	ax,WORD PTR _ThrustI
	cmp	ax,144
	jle	$L20045
	mov	ax,144
$L20045:
	mov	WORD PTR [bp-6],ax	;Lrpm
	mov	WORD PTR [bp-2],ax	;Rrpm
; Line 1676
	mov	ax,WORD PTR _THRUST
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,2
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	sub	ax,6
	mov	WORD PTR [bp-4],ax	;Lff
; Line 1677
	mov	WORD PTR [bp-8],ax	;Rff
; Line 1679
	cmp	WORD PTR [bp-6],0	;Lrpm
	jge	$I1506
	mov	WORD PTR [bp-6],0	;Lrpm
; Line 1680
$I1506:
	cmp	WORD PTR [bp-2],0	;Rrpm
	jge	$I1507
	mov	WORD PTR [bp-2],0	;Rrpm
; Line 1681
$I1507:
	or	ax,ax
	jge	$I1508
	mov	WORD PTR [bp-4],0	;Lff
; Line 1682
$I1508:
	cmp	WORD PTR [bp-8],0	;Rff
	jge	$I1509
	mov	WORD PTR [bp-8],0	;Rff
; Line 1684
$I1509:
	cmp	WORD PTR [bp-6],22	;Lrpm
	jle	$I1510
	cmp	WORD PTR _EgtL,15
	jge	$I1510
	inc	WORD PTR _EgtL
; Line 1685
$I1510:
	cmp	WORD PTR [bp-2],22	;Rrpm
	jle	$I1511
	cmp	WORD PTR _EgtR,15
	jge	$I1511
	inc	WORD PTR _EgtR
; Line 1686
$I1511:
	cmp	WORD PTR [bp-6],102	;Lrpm
	jle	$I1512
	cmp	WORD PTR _EgtL,22
	jge	$I1512
	inc	WORD PTR _EgtL
; Line 1687
$I1512:
	cmp	WORD PTR [bp-2],102	;Rrpm
	jle	$I1513
	cmp	WORD PTR _EgtR,22
	jge	$I1513
	inc	WORD PTR _EgtR
; Line 1688
$I1513:
	cmp	WORD PTR [bp-4],20	;Lff
	jge	$I1514
	cmp	WORD PTR _EgtL,15
	jle	$I1514
	dec	WORD PTR _EgtL
; Line 1689
$I1514:
	cmp	WORD PTR [bp-8],20	;Rff
	jge	$I1515
	cmp	WORD PTR _EgtR,15
	jle	$I1515
	dec	WORD PTR _EgtR
; Line 1691
$I1515:
	cmp	WORD PTR [bp-4],3	;Lff
	jge	$I1516
	cmp	WORD PTR _EgtL,5
	jle	$I1516
	dec	WORD PTR _EgtL
; Line 1692
$I1516:
	cmp	WORD PTR [bp-8],3	;Rff
	jge	$I1517
	cmp	WORD PTR _EgtR,5
	jle	$I1517
	dec	WORD PTR _EgtR
; Line 1694
$I1517:
	mov	ax,WORD PTR [bp-6]	;Lrpm
	cwd	
	xor	ax,dx
	sub	ax,dx
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	sub	ax,5
	mov	WORD PTR [bp-6],ax	;Lrpm
; Line 1695
	mov	ax,WORD PTR [bp-2]	;Rrpm
	cwd	
; Line 1698
	sub	ax,ax
	push	ax
	mov	cx,31
	push	cx
	mov	dx,3
	push	dx
	mov	bx,103
	push	bx
	mov	si,51
	push	si
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1699
	sub	ax,ax
	push	ax
	mov	cx,31
	push	cx
	mov	dx,3
	push	dx
	mov	bx,103
	push	bx
	mov	di,59
	push	di
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1701
	sub	ax,ax
	push	ax
	mov	cx,31
	push	cx
	mov	dx,3
	push	dx
	mov	bx,103
	push	bx
	mov	ax,71
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1702
	sub	ax,ax
	push	ax
	mov	cx,31
	push	cx
	mov	dx,3
	push	dx
	mov	bx,103
	push	bx
	mov	ax,79
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1704
	sub	ax,ax
	push	ax
	mov	cx,31
	push	cx
	mov	dx,3
	push	dx
	mov	bx,103
	push	bx
	mov	ax,91
	push	ax
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1705
	sub	ax,ax
	push	ax
	mov	ax,31
	push	ax
	mov	cx,3
	push	cx
	mov	dx,103
	push	dx
	mov	bx,99
	push	bx
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1707
	cmp	WORD PTR _LightsOn,1
	sbb	ax,ax
	and	al,204
	add	ax,54
	push	ax
	push	WORD PTR [bp-6]	;Lrpm
	mov	ax,3
	push	ax
	mov	cx,135
	sub	cx,WORD PTR [bp-6]	;Lrpm
	push	cx
	push	si
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1708
	cmp	WORD PTR _LightsOn,1
	sbb	ax,ax
	and	al,204
	add	ax,54
	push	ax
	push	WORD PTR [bp-6]	;Lrpm
	mov	ax,3
	push	ax
	mov	cx,135
	sub	cx,WORD PTR [bp-6]	;Lrpm
	push	cx
	push	di
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1710
	mov	ax,103
	push	ax
	push	si
	push	WORD PTR _Rp1
	mov	cx,31
	push	cx
	mov	dx,3
	push	dx
	push	ax
	push	si
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 1711
	mov	ax,103
	push	ax
	push	di
	push	WORD PTR _Rp1
	mov	cx,31
	push	cx
	mov	dx,3
	push	dx
	push	ax
	push	di
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 1713
	cmp	WORD PTR _LightsOn,1
	sbb	ax,ax
	and	al,204
	add	ax,54
	push	ax
	push	WORD PTR _EgtL
	mov	ax,3
	push	ax
	mov	cx,135
	sub	cx,WORD PTR _EgtL
	push	cx
	mov	cx,71
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1714
	cmp	WORD PTR _LightsOn,1
	sbb	ax,ax
	and	al,204
	add	ax,54
	push	ax
	push	WORD PTR _EgtR
	mov	ax,3
	push	ax
	mov	cx,135
	sub	cx,WORD PTR _EgtR
	push	cx
	mov	cx,79
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1716
	mov	ax,103
	push	ax
	mov	cx,71
	push	cx
	push	WORD PTR _Rp1
	mov	dx,31
	push	dx
	mov	bx,3
	push	bx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 1717
	mov	ax,103
	push	ax
	mov	cx,79
	push	cx
	push	WORD PTR _Rp1
	mov	dx,31
	push	dx
	mov	bx,3
	push	bx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 1719
	cmp	WORD PTR _LightsOn,1
	sbb	ax,ax
	and	al,204
	add	ax,54
	push	ax
	push	WORD PTR [bp-4]	;Lff
	mov	ax,3
	push	ax
	mov	cx,135
	sub	cx,WORD PTR [bp-4]	;Lff
	push	cx
	mov	cx,91
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1720
	cmp	WORD PTR _LightsOn,1
	sbb	ax,ax
	and	al,204
	add	ax,54
	push	ax
	push	WORD PTR [bp-8]	;Rff
	mov	ax,3
	push	ax
	mov	cx,135
	sub	cx,WORD PTR [bp-8]	;Rff
	push	cx
	mov	cx,99
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 1722
	mov	ax,103
	push	ax
	mov	cx,91
	push	cx
	push	WORD PTR _Rp1
	mov	dx,31
	push	dx
	mov	bx,3
	push	bx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 1723
	mov	ax,103
	push	ax
	mov	cx,99
	push	cx
	push	WORD PTR _Rp1
	mov	dx,31
	push	dx
	mov	dx,3
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 1724
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_DrawEngineStat	ENDP
; Line 1728
	PUBLIC	_DisplayBackLights
_DisplayBackLights	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 1729
	mov	ax,5
	push	ax
	call	CheckLights
	add	sp,2
	or	ax,ax
	je	$I1521
; Line 1730
	mov	ax,17
	push	ax
	mov	ax,18
	jmp	SHORT $L20117
$I1521:
; Line 1732
	mov	ax,18
	push	ax
	mov	ax,17
$L20117:
	push	ax
	mov	ax,77
	push	ax
	mov	ax,309
	push	ax
	mov	ax,72
	push	ax
	mov	ax,290
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1734
	mov	ax,6
	push	ax
	call	CheckLights
	add	sp,2
	or	ax,ax
	je	$I1523
; Line 1735
	mov	ax,17
	push	ax
	mov	ax,18
	jmp	SHORT $L20118
	nop	
$I1523:
; Line 1737
	mov	ax,18
	push	ax
	mov	ax,17
$L20118:
	push	ax
	mov	ax,85
	push	ax
	mov	ax,309
	push	ax
	mov	ax,80
	push	ax
	mov	ax,290
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1740
	mov	ax,7
	push	ax
	call	CheckLights
	add	sp,2
	or	ax,ax
	je	$I1525
; Line 1741
	mov	ax,17
	push	ax
	mov	ax,18
	jmp	SHORT $L20119
	nop	
$I1525:
; Line 1743
	mov	ax,18
	push	ax
	mov	ax,17
$L20119:
	push	ax
	mov	ax,93
	push	ax
	mov	ax,309
	push	ax
	mov	ax,88
	push	ax
	mov	ax,290
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 1745
	ret	
	nop	

_DisplayBackLights	ENDP
; Line 1750
_TEXT      ENDS
CONST      SEGMENT
$T20058	DW SEG _CockpitLights 
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_DisplayLights
_DisplayLights	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	mode = 6
;	lightnumber = 4
; Line 1751
	cmp	WORD PTR [bp+6],0	;mode
	je	$I1531
; Line 1757
	mov	es,WORD PTR $T20058
	mov	bx,WORD PTR [bp+4]	;lightnumber
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	push	WORD PTR es:_CockpitLights[bx+10]
	push	WORD PTR es:_CockpitLights[bx+8]
	jmp	SHORT $L20120
	nop	
$I1531:
; Line 1765
	mov	es,WORD PTR $T20058
	mov	bx,WORD PTR [bp+4]	;lightnumber
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	push	WORD PTR es:_CockpitLights[bx+8]
	push	WORD PTR es:_CockpitLights[bx+10]
$L20120:
	push	WORD PTR es:_CockpitLights[bx+6]
	push	WORD PTR es:_CockpitLights[bx+4]
	push	WORD PTR es:_CockpitLights[bx+2]
	push	WORD PTR es:_CockpitLights[bx]
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
; Line 1766
; Line 1767
	mov	sp,bp
	pop	bp
	ret	

_DisplayLights	ENDP
; Line 1771
	PUBLIC	_DoCRT
_DoCRT	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	d = -4
;	a = -2
;	i = 4
; Line 1774
	mov	bx,WORD PTR [bp+4]	;i
	shl	bx,1
	mov	ax,WORD PTR _CrtRps[bx]
	mov	WORD PTR _RpCRT,ax
; Line 1775
	mov	ax,WORD PTR _CrtDisplays[bx]
; Line 1777
	jmp	$S1537
; Line 1778
$SC1541:
; Line 1779
	cmp	WORD PTR _VdiMode,0
	je	$I1542
; Line 1780
	push	WORD PTR [bp+4]	;i
	call	_VdiCrt
	add	sp,2
	mov	WORD PTR [bp-2],ax	;a
; Line 1781
$L20127:
	mov	ax,OFFSET _VdiMask
	mov	cx,SEG _VdiMask
$L20124:
	push	cx
	push	ax
	call	_FlirCopy
	add	sp,4
; Line 1782
	jmp	$SB1538
$I1542:
; Line 1783
	call	_DrawGunCameraView
	mov	WORD PTR [bp-2],ax	;a
; Line 1784
	cmp	WORD PTR _ConfigData+14,2
	je	$JCC14475
	jmp	$SB1538
$JCC14475:
	jmp	SHORT $L20127
; Line 1788
$SC1548:
; Line 1789
	cmp	WORD PTR _RadarRepeat,0
	je	$I1549
; Line 1790
	cmp	WORD PTR _AWG9_REALITY_LEVEL,0
	jne	$I1550
; Line 1791
	push	WORD PTR [bp+4]	;i
	call	_DoTac
$L20125:
	add	sp,2
; Line 1792
	jmp	$SB1538
$I1550:
; Line 1793
	push	WORD PTR [bp+4]	;i
	call	_DoTID
	jmp	SHORT $L20125
$I1549:
; Line 1796
	push	WORD PTR [bp+4]	;i
	call	_HsdCrt
	add	sp,2
	mov	WORD PTR [bp-2],ax	;a
; Line 1797
	mov	ax,OFFSET _HsdMask
	mov	cx,SEG _HsdMask
	jmp	SHORT $L20124
; Line 1800
$SC1556:
; Line 1801
	push	WORD PTR [bp+4]	;i
	call	_DoDDD
	jmp	SHORT $L20126
; Line 1803
$SC1558:
; Line 1804
	cmp	WORD PTR _AWG9_REALITY_LEVEL,0
	jne	$I1559
; Line 1805
	push	WORD PTR [bp+4]	;i
	call	_DoTAC
$L20126:
	add	sp,2
$L20123:
	mov	WORD PTR [bp-2],ax	;a
; Line 1806
	jmp	SHORT $SB1538
	nop	
$I1559:
; Line 1807
	push	WORD PTR [bp+4]	;i
	call	_DoTID
	jmp	SHORT $L20126
; Line 1810
$SC1562:
; Line 1811
	call	_TEWS_GFX
	jmp	SHORT $L20123
; Line 1813
	nop	
$SC1564:
; Line 1814
	push	WORD PTR [bp+4]	;i
	call	_AdiCrt
	jmp	SHORT $L20126
; Line 1816
$SD1566:
; Line 1817
	mov	WORD PTR [bp-2],0	;a
; Line 1818
	jmp	SHORT $SB1538
	nop	
$S1537:
	sub	ax,3
	cmp	ax,14
	ja	$SD1566
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20059[bx]
$L20059:
		DW	$SC1541
		DW	$SD1566
		DW	$SD1566
		DW	$SD1566
		DW	$SD1566
		DW	$SC1564
		DW	$SC1548
		DW	$SD1566
		DW	$SD1566
		DW	$SD1566
		DW	$SD1566
		DW	$SD1566
		DW	$SC1562
		DW	$SC1556
		DW	$SC1558
$SB1538:
; Line 1820
	mov	ax,WORD PTR [bp-2]	;a
	mov	bx,WORD PTR [bp+4]	;i
	shl	bx,1
	mov	WORD PTR _CrtUpdate[bx],ax
; Line 1821
	mov	sp,bp
	pop	bp
	ret	

_DoCRT	ENDP
; Line 1826
	PUBLIC	_ZoomDisplay
_ZoomDisplay	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 1827
	cmp	WORD PTR _BackSeat,0
	jne	$I1569
; Line 1828
	cmp	WORD PTR _View,0
	jne	$I1577
; Line 1829
	mov	ax,1
	push	ax
	call	_GunCameraZoom
	add	sp,2
; Line 1830
; Line 1831
	jmp	SHORT $I1577
	nop	
$I1569:
; Line 1835
	cmp	WORD PTR _View,0
	jne	$I1577
; Line 1836
	call	_AWG9_DEC_RANGE
; Line 1837
	cmp	WORD PTR _RadarRange,0
	jle	$I1577
	dec	WORD PTR _RadarRange
; Line 1838
$I1577:
; Line 1839
	cmp	WORD PTR _View,3
	jne	$I1579
; Line 1840
	cmp	WORD PTR _Tscale,4
	jge	$I1579
	inc	WORD PTR _Tscale
; Line 1841
$I1579:
; Line 1842
; Line 1843
	ret	

_ZoomDisplay	ENDP
; Line 1847
	PUBLIC	_UnZoomDisplay
_UnZoomDisplay	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 1848
	cmp	WORD PTR _BackSeat,0
	jne	$I1582
; Line 1849
	cmp	WORD PTR _View,0
	jne	$I1589
; Line 1850
	mov	ax,-1
	push	ax
	call	_GunCameraZoom
	add	sp,2
; Line 1851
; Line 1852
	jmp	SHORT $I1589
	nop	
$I1582:
; Line 1856
	cmp	WORD PTR _View,0
	jne	$I1589
; Line 1857
	call	_AWG9_INC_RANGE
; Line 1858
	cmp	WORD PTR _RadarRange,5
	jge	$I1589
	inc	WORD PTR _RadarRange
; Line 1859
$I1589:
; Line 1860
	cmp	WORD PTR _View,3
	jne	$I1591
; Line 1861
	cmp	WORD PTR _Tscale,0
	jle	$I1591
	dec	WORD PTR _Tscale
; Line 1862
$I1591:
; Line 1863
; Line 1864
	ret	

_UnZoomDisplay	ENDP
; Line 1868
	PUBLIC	_MakeItGreen
_MakeItGreen	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 1869
	mov	bx,WORD PTR _RpCRT
	mov	ax,WORD PTR [bx+2]
	mov	es,WORD PTR $T20004
	mov	WORD PTR es:_VdiMask,ax
; Line 1870
	mov	ax,WORD PTR [bx+4]
	mov	WORD PTR es:_VdiMask+2,ax
; Line 1871
	mov	ax,OFFSET _VdiMask
	push	es
	push	ax
	call	_FlirCopy
	add	sp,4
; Line 1872
	ret	
	nop	

_MakeItGreen	ENDP
; Line 1876
	PUBLIC	_ResetCockpitLights
_ResetCockpitLights	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 1883
	mov	ax,-1
	mov	WORD PTR $S925_OldThrust,ax
	mov	WORD PTR $S928_OldMC,ax
	mov	WORD PTR $S927_OldEMIS,ax
	mov	WORD PTR $S924_OldFuel,ax
	mov	WORD PTR $S923_OLDMM,ax
; Line 1885
	mov	WORD PTR [bp-2],0	;i
$FC1597:
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,1
	mov	WORD PTR $S926_OldLights[bx],0
	inc	WORD PTR [bp-2]	;i
	cmp	WORD PTR [bp-2],40	;i
	jl	$FC1597
; Line 1886
	mov	sp,bp
	pop	bp
	ret	

_ResetCockpitLights	ENDP
; Line 1890
	PUBLIC	_UpdateCockpitLites
_UpdateCockpitLites	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 1891
	jmp	_UpdateLights
; Line 1892

_UpdateCockpitLites	ENDP
; Line 1897
	PUBLIC	_UpdateLights
_UpdateLights	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	status = -2
;	mseg = -4
; Line 1903
	mov	ax,1
	push	ax
	call	CheckLights
	add	sp,2
	mov	WORD PTR [bp-2],ax	;status
; Line 1904
	mov	ax,WORD PTR $S926_OldLights+2
	cmp	WORD PTR [bp-2],ax	;status
	je	$I1603
; Line 1905
	push	WORD PTR [bp-2]	;status
	mov	ax,1
	push	ax
	call	_DisplayLights
	add	sp,4
; Line 1906
	mov	ax,WORD PTR [bp-2]	;status
	mov	WORD PTR $S926_OldLights+2,ax
; Line 1907
; Line 1909
$I1603:
	mov	ax,2
	push	ax
	call	CheckLights
	add	sp,2
	mov	WORD PTR [bp-2],ax	;status
; Line 1910
	mov	ax,WORD PTR $S926_OldLights+4
	cmp	WORD PTR [bp-2],ax	;status
	je	$I1604
; Line 1911
	push	WORD PTR [bp-2]	;status
	mov	ax,2
	push	ax
	call	_DisplayLights
	add	sp,4
; Line 1912
	mov	ax,WORD PTR [bp-2]	;status
	mov	WORD PTR $S926_OldLights+4,ax
; Line 1913
; Line 1915
$I1604:
	mov	ax,10
	push	ax
	call	CheckLights
	add	sp,2
	mov	WORD PTR [bp-2],ax	;status
; Line 1917
	mov	ax,WORD PTR $S926_OldLights+20
	cmp	WORD PTR [bp-2],ax	;status
	jne	$JCC15014
	jmp	$I1611
$JCC15014:
; Line 1918
	push	WORD PTR [bp-2]	;status
	mov	ax,10
	push	ax
	call	_DisplayLights
	add	sp,4
; Line 1919
	mov	ax,WORD PTR [bp-2]	;status
	mov	WORD PTR $S926_OldLights+20,ax
; Line 1920
	or	ax,ax
	je	$I1606
; Line 1921
	call	FAR PTR _MouseHIDE
; Line 1922
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	or	ax,ax
	je	$I1610
; Line 1923
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,102
	push	cx
	mov	cx,213
	push	cx
	push	WORD PTR _Rp2
	mov	cx,19
	push	cx
	mov	cx,18
	push	cx
	mov	cx,149
	push	cx
	mov	cx,113
	jmp	SHORT $L20131
	nop	
$I1606:
; Line 1928
	call	FAR PTR _MouseHIDE
; Line 1929
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	or	ax,ax
	je	$I1610
; Line 1930
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,102
	push	cx
	mov	cx,213
	push	cx
	push	WORD PTR _Rp2
	mov	cx,19
	push	cx
	mov	cx,18
	push	cx
	mov	cx,149
	push	cx
	mov	cx,134
$L20131:
	push	cx
	push	ax
	call	_TransRectCopy
	add	sp,20
; Line 1931
; Line 1932
$I1610:
	mov	ax,102
	push	ax
	mov	cx,213
	push	cx
	push	WORD PTR _Rp1
	mov	dx,19
	push	dx
	mov	dx,18
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 1933
	cmp	WORD PTR _ShowMouse,0
	je	$I1611
	call	_MouseShow
; Line 1934
$I1611:
; Line 1935
; Line 1937
	mov	ax,8
	push	ax
	call	CheckLights
	add	sp,2
	mov	WORD PTR [bp-2],ax	;status
; Line 1938
	mov	ax,WORD PTR $S926_OldLights+16
	cmp	WORD PTR [bp-2],ax	;status
	je	$I1612
; Line 1939
	push	WORD PTR [bp-2]	;status
	mov	ax,8
	push	ax
	call	_DisplayLights
	add	sp,4
; Line 1940
	mov	ax,WORD PTR [bp-2]	;status
	mov	WORD PTR $S926_OldLights+16,ax
; Line 1941
; Line 1942
$I1612:
	mov	ax,5
	push	ax
	call	CheckLights
	add	sp,2
	mov	WORD PTR [bp-2],ax	;status
; Line 1943
	mov	ax,WORD PTR $S926_OldLights+10
	cmp	WORD PTR [bp-2],ax	;status
	je	$I1613
; Line 1944
	push	WORD PTR [bp-2]	;status
	mov	ax,5
	push	ax
	call	_DisplayLights
	add	sp,4
; Line 1945
	mov	ax,WORD PTR [bp-2]	;status
	mov	WORD PTR $S926_OldLights+10,ax
; Line 1946
; Line 1948
$I1613:
	mov	ax,7
	push	ax
	call	CheckLights
	add	sp,2
	mov	WORD PTR [bp-2],ax	;status
; Line 1949
	mov	ax,WORD PTR $S926_OldLights+14
	cmp	WORD PTR [bp-2],ax	;status
	je	$I1614
; Line 1950
	push	WORD PTR [bp-2]	;status
	mov	ax,7
	push	ax
	call	_DisplayLights
	add	sp,4
; Line 1951
	mov	ax,WORD PTR [bp-2]	;status
	mov	WORD PTR $S926_OldLights+14,ax
; Line 1952
; Line 1954
$I1614:
	mov	ax,6
	push	ax
	call	CheckLights
	add	sp,2
	mov	WORD PTR [bp-2],ax	;status
; Line 1955
	mov	ax,WORD PTR $S926_OldLights+12
	cmp	WORD PTR [bp-2],ax	;status
	je	$I1615
; Line 1956
	push	WORD PTR [bp-2]	;status
	mov	ax,6
	push	ax
	call	_DisplayLights
	add	sp,4
; Line 1957
	mov	ax,WORD PTR [bp-2]	;status
	mov	WORD PTR $S926_OldLights+12,ax
; Line 1958
; Line 1959
$I1615:
	mov	ax,11
	push	ax
	call	CheckLights
	add	sp,2
	mov	WORD PTR [bp-2],ax	;status
; Line 1960
	mov	ax,WORD PTR $S926_OldLights+22
	cmp	WORD PTR [bp-2],ax	;status
	je	$I1616
; Line 1961
	push	WORD PTR [bp-2]	;status
	mov	ax,11
	push	ax
	call	_DisplayLights
	add	sp,4
; Line 1962
	mov	ax,WORD PTR [bp-2]	;status
	mov	WORD PTR $S926_OldLights+22,ax
; Line 1963
; Line 1964
$I1616:
	mov	ax,19
	push	ax
	call	CheckLights
	add	sp,2
	mov	WORD PTR [bp-2],ax	;status
; Line 1965
	mov	ax,WORD PTR $S926_OldLights+38
	cmp	WORD PTR [bp-2],ax	;status
	je	$I1617
; Line 1966
	push	WORD PTR [bp-2]	;status
	mov	ax,19
	push	ax
	call	_DisplayLights
; Line 1967
	mov	ax,WORD PTR [bp-2]	;status
	mov	WORD PTR $S926_OldLights+38,ax
; Line 1968
; Line 1970
$I1617:
	mov	sp,bp
	pop	bp
	ret	

_UpdateLights	ENDP
; Line 1974
CheckLights	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	i = 4
; Line 1977
	mov	ax,WORD PTR [bp+4]	;i
	jmp	$S1621
; Line 1980
$SC1626:
; Line 1981
	mov	al,BYTE PTR _Status
	and	ax,1
	cmp	ax,1
	sbb	ax,ax
	neg	ax
	mov	sp,bp
	pop	bp
	ret	
; Line 1982
	nop	
$SC1627:
; Line 1983
	test	BYTE PTR _Status,8
	je	$SC1625
	cmp	WORD PTR _REALFLIGHT,0
	je	$L20133
	test	BYTE PTR _Damaged,4
	jne	$SC1625
	jmp	SHORT $L20133
	nop	
$SC1628:
; Line 1985
	mov	ax,WORD PTR _HookDown
	mov	sp,bp
	pop	bp
	ret	
; Line 1986
	nop	
$SC1629:
; Line 1987
	mov	ax,WORD PTR _MLAUNCH
	mov	sp,bp
	pop	bp
	ret	
; Line 1988
	nop	
$SC1630:
; Line 1989
	cmp	WORD PTR _LastMud,1
	jle	$I1631
; Line 1990
	cmp	WORD PTR $S1620_tempflash,0
	je	$I1632
; Line 1991
	xor	BYTE PTR $S1620_tempflash,1
	jmp	SHORT $L20133
	nop	
$I1632:
; Line 1994
	xor	BYTE PTR $S1620_tempflash,1
$SC1625:
; Line 1979
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 1996
; Line 1997
; Line 1998
	nop	
$I1631:
	cmp	WORD PTR _LastSpike,1
	jle	$SC1625
	jmp	SHORT $L20133
	nop	
$SC1636:
; Line 2004
	mov	ax,WORD PTR _AIDETECT
	mov	sp,bp
	pop	bp
	ret	
; Line 2005
	nop	
$SC1637:
; Line 2006
	cmp	WORD PTR _LOCKED,-1
	je	$SC1625
$L20133:
	mov	ax,1
	jmp	SHORT $SB1622
$SC1638:
; Line 2008
	mov	ax,WORD PTR _MasterArmSW
	jmp	SHORT $SB1622
; Line 2009
	nop	
$SC1639:
; Line 2010
	mov	al,BYTE PTR _Damaged
	and	ax,1
	jmp	SHORT $SB1622
; Line 2011
$SC1640:
; Line 2012
	mov	al,BYTE PTR _Damaged
	and	ax,2
	jmp	SHORT $SB1622
$S1621:
	cmp	ax,19
	ja	$SB1622
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20067[bx]
	nop	
$L20067:
		DW	$SC1625
		DW	$SC1626
		DW	$SC1627
		DW	$SC1628
		DW	$SB1622
		DW	$SC1629
		DW	$SC1630
		DW	$SC1636
		DW	$SC1637
		DW	$SB1622
		DW	$SC1638
		DW	$SC1639
		DW	$SB1622
		DW	$SB1622
		DW	$SB1622
		DW	$SB1622
		DW	$SB1622
		DW	$SB1622
		DW	$SB1622
		DW	$SC1640
$SB1622:
; Line 2014
	mov	sp,bp
	pop	bp
	ret	

CheckLights	ENDP
; Line 2018
	PUBLIC	_ShowFuel
_ShowFuel	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
	push	si
;	f = -4
;	val = -2
;	Lfuel = -8
;	Rfuel = -12
;	Rfbar = -10
;	Lfbar = -6
; Line 2026
	mov	ax,WORD PTR _Fuel
	mov	WORD PTR [bp-4],ax	;f
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	WORD PTR [bp-8],ax	;Lfuel
; Line 2027
	mov	WORD PTR [bp-12],ax	;Rfuel
; Line 2029
	mov	cx,WORD PTR $S924_OldFuel
	cmp	WORD PTR [bp-4],cx	;f
	jne	$JCC15694
	jmp	$I1648
$JCC15694:
; Line 2030
	mov	cx,WORD PTR [bp-4]	;f
	mov	WORD PTR $S924_OldFuel,cx
; Line 2032
	mov	cx,300
	cwd	
	idiv	cx
	mov	WORD PTR [bp-6],ax	;Lfbar
; Line 2033
	mov	WORD PTR [bp-10],ax	;Rfbar
; Line 2035
	cmp	ax,140
	jle	$I1649
	mov	WORD PTR [bp-6],140	;Lfbar
; Line 2036
$I1649:
	cmp	WORD PTR [bp-10],140	;Rfbar
	jle	$I1650
	mov	WORD PTR [bp-6],140	;Lfbar
; Line 2038
$I1650:
	call	FAR PTR _MouseHIDE
; Line 2039
	mov	bx,WORD PTR _Rp1
	mov	WORD PTR [bx+16],1
; Line 2040
	cmp	WORD PTR _LightsOn,1
	sbb	ax,ax
	and	al,204
	add	ax,54
	mov	bx,WORD PTR _Rp1
	mov	WORD PTR [bx+12],ax
; Line 2042
	sub	ax,ax
	push	ax
	mov	cx,5
	push	cx
	mov	dx,20
	push	dx
	mov	bx,96
	push	bx
	mov	si,234
	push	si
	push	WORD PTR _Rp1
	call	FAR PTR _RectFill
	add	sp,12
; Line 2043
	mov	ax,10
	push	ax
	mov	cx,OFFSET _Txt
	push	cx
	push	WORD PTR [bp-4]	;f
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,96
	push	ax
	push	si
	push	WORD PTR _Rp1
	call	FAR PTR _RpPrint
	add	sp,8
; Line 2044
	sub	ax,ax
	push	ax
	mov	cx,5
	push	cx
	mov	dx,20
	push	dx
	mov	dx,106
	push	dx
	push	si
	push	WORD PTR _Rp1
	call	FAR PTR _RectFill
	add	sp,12
; Line 2045
	mov	ax,10
	push	ax
	mov	cx,OFFSET _Txt
	push	cx
	push	WORD PTR _BingoFuel
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,106
	push	ax
	push	si
	push	WORD PTR _Rp1
	call	FAR PTR _RpPrint
	add	sp,8
; Line 2047
	sub	ax,ax
	push	ax
	mov	cx,5
	push	cx
	mov	dx,15
	push	dx
	mov	bx,122
	push	bx
	mov	si,220
	push	si
	push	WORD PTR _Rp1
	call	FAR PTR _RectFill
	add	sp,12
; Line 2048
	mov	ax,10
	push	ax
	mov	cx,OFFSET _Txt
	push	cx
	push	WORD PTR [bp-8]	;Lfuel
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,122
	push	ax
	push	si
	push	WORD PTR _Rp1
	call	FAR PTR _RpPrint
	add	sp,8
; Line 2050
	sub	ax,ax
	push	ax
	mov	cx,5
	push	cx
	mov	dx,15
	push	dx
	mov	dx,122
	push	dx
	mov	bx,252
	push	bx
	push	WORD PTR _Rp1
	call	FAR PTR _RectFill
	add	sp,12
; Line 2051
	mov	ax,10
	push	ax
	mov	ax,OFFSET _Txt
	push	ax
	push	WORD PTR [bp-12]	;Rfuel
	call	_itoa
	add	sp,6
	push	ax
	mov	ax,122
	push	ax
	mov	ax,252
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _RpPrint
	add	sp,8
; Line 2053
	sub	ax,ax
	push	ax
	mov	cx,27
	push	cx
	mov	dx,5
	push	dx
	mov	bx,114
	push	bx
	mov	si,238
	push	si
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 2054
	cmp	WORD PTR _LightsOn,1
	sbb	ax,ax
	and	al,204
	add	ax,54
	push	ax
	push	WORD PTR [bp-6]	;Lfbar
	mov	ax,5
	push	ax
	mov	cx,141
	sub	cx,WORD PTR [bp-6]	;Lfbar
	push	cx
	push	si
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 2055
	mov	ax,114
	push	ax
	push	si
	push	WORD PTR _Rp1
	mov	cx,27
	push	cx
	mov	dx,5
	push	dx
	push	ax
	push	si
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 2057
	sub	ax,ax
	push	ax
	mov	ax,27
	push	ax
	mov	cx,5
	push	cx
	mov	dx,114
	push	dx
	mov	bx,244
	push	bx
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 2058
	cmp	WORD PTR _LightsOn,1
	sbb	ax,ax
	and	al,204
	add	ax,54
	push	ax
	push	WORD PTR [bp-10]	;Rfbar
	mov	ax,5
	push	ax
	mov	cx,141
	sub	cx,WORD PTR [bp-10]	;Rfbar
	push	cx
	mov	cx,244
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectFill
	add	sp,12
; Line 2059
	mov	ax,114
	push	ax
	mov	cx,244
	push	cx
	push	WORD PTR _Rp1
	mov	dx,27
	push	dx
	mov	dx,5
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 2060
; Line 2061
$I1648:
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ShowFuel	ENDP
; Line 2066
	PUBLIC	_EngineAlreadyOn
_EngineAlreadyOn	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 2067
	ret	

_EngineAlreadyOn	ENDP
; Line 2071
	PUBLIC	_EngineMonitor
_EngineMonitor	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 2099
	ret	

_EngineMonitor	ENDP
; Line 2103
	PUBLIC	_JetisonSwitch
_JetisonSwitch	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	mseg = -2
;	mode = 4
; Line 2106
	call	_MouseHide
; Line 2107
	cmp	WORD PTR [bp+4],0	;mode
	je	$I1660
; Line 2108
	inc	WORD PTR _JetisonSW
; Line 2109
	cmp	WORD PTR _View,0
	je	$JCC16293
	jmp	$I1664
$JCC16293:
	cmp	WORD PTR _BackSeat,0
	je	$JCC16303
	jmp	$I1664
$JCC16303:
; Line 2110
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	or	ax,ax
	je	$I1665
; Line 2111
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,102
	push	cx
	mov	cx,88
	push	cx
	push	WORD PTR _Rp2
	mov	cx,20
	push	cx
	push	cx
	mov	cx,125
	push	cx
	mov	cx,111
	jmp	SHORT $L20135
	nop	
$I1660:
; Line 2117
; Line 2118
	mov	WORD PTR _JetisonSW,0
; Line 2119
	cmp	WORD PTR _View,0
	jne	$I1664
	cmp	WORD PTR _BackSeat,0
	jne	$I1664
; Line 2120
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	or	ax,ax
	je	$I1665
; Line 2121
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,102
	push	cx
	mov	cx,88
	push	cx
	push	WORD PTR _Rp2
	mov	cx,20
	push	cx
	push	cx
	mov	cx,125
	push	cx
	mov	cx,134
$L20135:
	push	cx
	push	ax
	call	_TransRectCopy
	add	sp,20
; Line 2122
; Line 2123
$I1665:
	mov	ax,102
	push	ax
	mov	cx,88
	push	cx
	push	WORD PTR _Rp1
	mov	dx,20
	push	dx
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 2124
; Line 2125
$I1664:
; Line 2126
	cmp	WORD PTR _ShowMouse,0
	je	$I1666
	call	FAR PTR _MouseSHOW
; Line 2127
$I1666:
	mov	sp,bp
	pop	bp
	ret	

_JetisonSwitch	ENDP
; Line 2131
	PUBLIC	_MasterArmSwitch
_MasterArmSwitch	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	mseg = -2
; Line 2133
	call	FAR PTR _MouseHIDE
; Line 2135
	cmp	WORD PTR _MasterArmSW,0
	jne	$I1670
; Line 2136
	inc	WORD PTR _MasterArmSW
; Line 2137
	cmp	WORD PTR _View,0
	je	$JCC16506
	jmp	$I1674
$JCC16506:
; Line 2138
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	or	ax,ax
	je	$I1672
; Line 2139
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,102
	push	cx
	mov	cx,213
	push	cx
	push	WORD PTR _Rp2
	mov	cx,19
	push	cx
	mov	cx,18
	push	cx
	mov	cx,149
	push	cx
	mov	cx,113
	push	cx
	push	ax
	call	_TransRectCopy
	add	sp,20
; Line 2140
; Line 2141
$I1672:
	mov	ax,102
	push	ax
	mov	cx,213
	push	cx
	push	WORD PTR _Rp1
	mov	dx,19
	push	dx
	mov	dx,18
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 2142
	mov	ax,16
	push	ax
	mov	ax,18
	jmp	SHORT $L20136
$I1670:
; Line 2146
; Line 2147
	mov	WORD PTR _MasterArmSW,0
; Line 2148
	cmp	WORD PTR _View,0
	jne	$I1674
; Line 2149
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	call	_MapInEMSSprite
	add	sp,4
	or	ax,ax
	je	$I1675
; Line 2150
	sub	cx,cx
	push	cx
	push	cx
	mov	cx,102
	push	cx
	mov	cx,213
	push	cx
	push	WORD PTR _Rp2
	mov	cx,19
	push	cx
	mov	cx,18
	push	cx
	mov	cx,149
	push	cx
	mov	cx,134
	push	cx
	push	ax
	call	_TransRectCopy
	add	sp,20
; Line 2151
; Line 2152
$I1675:
	mov	ax,102
	push	ax
	mov	cx,213
	push	cx
	push	WORD PTR _Rp1
	mov	dx,19
	push	dx
	mov	dx,18
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 2153
	mov	ax,18
	push	ax
	mov	ax,16
$L20136:
	push	ax
	mov	ax,3
	push	ax
	mov	ax,11
	push	ax
	mov	ax,120
	push	ax
	mov	ax,119
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 2154
; Line 2155
$I1674:
; Line 2156
	cmp	WORD PTR _ShowMouse,0
	je	$I1676
	call	FAR PTR _MouseSHOW
; Line 2157
$I1676:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_MasterArmSwitch	ENDP
_TEXT	ENDS
END
