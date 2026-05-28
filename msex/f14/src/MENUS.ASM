;	Static Name Aliases
;
;	$S832_P80	EQU	P80
;	$S833_P81	EQU	P81
;	$S834_P82	EQU	P82
;	$S835_P83	EQU	P83
;	$S836_P90	EQU	P90
;	$S837_P91	EQU	P91
;	$S838_P92	EQU	P92
;	$S839_P93	EQU	P93
;	$S840_P110	EQU	P110
;	$S841_P111	EQU	P111
;	$S842_P112	EQU	P112
;	$S843_SoundEntry	EQU	SoundEntry
;	$S844_SoundMenu	EQU	SoundMenu
;	$S845_MtnDetailEntry	EQU	MtnDetailEntry
;	$S846_MtnDetailMenu	EQU	MtnDetailMenu
;	$S847_PlaneDetailEntry	EQU	PlaneDetailEntry
;	$S848_PlaneDetailMenu	EQU	PlaneDetailMenu
;	$S849_ObjDetailEntry	EQU	ObjDetailEntry
;	$S850_ObjDetailMenu	EQU	ObjDetailMenu
;	$S851_GrndDetailEntry	EQU	GrndDetailEntry
;	$S852_GrndDetailMenu	EQU	GrndDetailMenu
;	$S853_XploDetailEntry	EQU	XploDetailEntry
;	$S790_MenuSpr1W	EQU	MenuSpr1W
;	$S854_XploDetailMenu	EQU	XploDetailMenu
;	$S855_ConditionsEntry	EQU	ConditionsEntry
;	$S791_MenuSpr1H	EQU	MenuSpr1H
;	$S792_MenuSpr2W	EQU	MenuSpr2W
;	$S856_ConditionsMenu	EQU	ConditionsMenu
;	$S793_MenuSpr2H	EQU	MenuSpr2H
;	$S857_JoyEntry	EQU	JoyEntry
;	$S794_MenuSpr3W	EQU	MenuSpr3W
;	$S858_JoyMenu	EQU	JoyMenu
;	$S795_MenuSpr3H	EQU	MenuSpr3H
;	$S859_KbEntry	EQU	KbEntry
;	$S796_MenuRX	EQU	MenuRX
;	$S860_KbMenu	EQU	KbMenu
;	$S797_MenuRp	EQU	MenuRp
;	$S861_RollEntry	EQU	RollEntry
;	$S798_hs_st	EQU	hs_st
;	$S862_RollMenu	EQU	RollMenu
;	$S863_OptnEntry	EQU	OptnEntry
;	$S799_hs_cb	EQU	hs_cb
;	$S864_OptnMenu	EQU	OptnMenu
;	$S800_P00	EQU	P00
;	$S865_FileEntry	EQU	FileEntry
;	$S801_P01	EQU	P01
;	$S802_P02	EQU	P02
;	$S866_FileMenu	EQU	FileMenu
;	$S867_FileEntry2	EQU	FileEntry2
;	$S803_P10	EQU	P10
;	$S804_P12	EQU	P12
;	$S868_FileMenu2	EQU	FileMenu2
;	$S869_CtrlEntry	EQU	CtrlEntry
;	$S805_P13	EQU	P13
;	$S806_P14	EQU	P14
;	$S870_CtrlMenu	EQU	CtrlMenu
;	$S807_P21	EQU	P21
;	$S871_BarEntry	EQU	BarEntry
;	$S872_Bar	EQU	Bar
;	$S808_P22	EQU	P22
;	$S873_R_DISABLE	EQU	R_DISABLE
;	$S809_P36	EQU	P36
;	$S874_MOSspr	EQU	MOSspr
;	$S810_P30	EQU	P30
;	$S811_P31	EQU	P31
;	$S875_MOShotx	EQU	MOShotx
;	$S812_P32	EQU	P32
;	$S876_MOShoty	EQU	MOShoty
;	$S813_P33	EQU	P33
;	$S877_kb_sens	EQU	kb_sens
;	$S878_MosON	EQU	MosON
;	$S814_P34	EQU	P34
;	$S815_P35	EQU	P35
;	$S816_P50	EQU	P50
;	$S817_P51	EQU	P51
;	$S818_P52	EQU	P52
;	$S819_P60	EQU	P60
;	$S820_P61	EQU	P61
;	$S821_P62	EQU	P62
;	$S822_P73	EQU	P73
;	$S823_P100	EQU	P100
;	$S824_P101	EQU	P101
;	$S825_P102	EQU	P102
;	$S826_P103	EQU	P103
;	$S827_P104	EQU	P104
;	$S828_P105	EQU	P105
;	$S829_P106	EQU	P106
;	$S830_P107	EQU	P107
;	$S831_P108	EQU	P108
;	$S948_done	EQU	done
	TITLE   C:\MENUS.C
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
EXTRN	_ReadJoy2:FAR
EXTRN	_SndSounds:FAR
EXTRN	_kbhit:NEAR
EXTRN	_RectCopy:FAR
EXTRN	_RpPrint:FAR
EXTRN	_ChangeColor:FAR
EXTRN	_CharWidth:FAR
EXTRN	_RectFill:FAR
EXTRN	_EndGame:NEAR
EXTRN	_CursorInCrt:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_UpdateJetSnd:NEAR
EXTRN	_MouseTYPE:FAR
EXTRN	__bios_keybrd:NEAR
EXTRN	_ShowPage:FAR
EXTRN	_MouseSHOW:FAR
EXTRN	_MouseHIDE:FAR
EXTRN	_ShowSprite:FAR
EXTRN	_MouseHITS:FAR
EXTRN	_RemoveKeyJoy:NEAR
EXTRN	_InstallKeyJoy:NEAR
EXTRN	_SetJoysticks:NEAR
EXTRN	_WaitTicks:NEAR
EXTRN	_LibCanDo:FAR
EXTRN	_JoyRecal:NEAR
EXTRN	_InitJoy2:FAR
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
_BSS      ENDS
EXTRN	_Rp1:WORD
EXTRN	_Rp2:WORD
EXTRN	_MenuSpr1:WORD
EXTRN	_MenuSpr2:BYTE
EXTRN	_MenuSpr3:BYTE
EXTRN	_ExitCode:BYTE
EXTRN	_KbSense:WORD
EXTRN	_SndPriority:WORD
EXTRN	_Joystick:WORD
EXTRN	_ThrustStick:WORD
EXTRN	_CoolyStick:WORD
EXTRN	_RudderStick:WORD
EXTRN	_MouseSprite:WORD
EXTRN	_MTNDETAIL:WORD
EXTRN	_GRNDDETAIL:WORD
EXTRN	_OBJECTDETAIL:WORD
EXTRN	_PLANEDETAIL:WORD
EXTRN	_XPLODETAIL:WORD
EXTRN	_SKYDETAIL:WORD
EXTRN	_FASTROLL:WORD
EXTRN	_StickType:WORD
EXTRN	_MouseX:WORD
EXTRN	_Fencer:WORD
EXTRN	_MouseY:WORD
EXTRN	_MinStick:BYTE
EXTRN	_Button:WORD
EXTRN	_MaxStick:BYTE
EXTRN	_CenterPosition:BYTE
EXTRN	_LowRange:BYTE
EXTRN	_HighRange:BYTE
_DATA      SEGMENT
$S796_MenuRX	DW	00H
	DW	00H
	DW	00H
	DW	013fH
	DW	0c7H
	DW	00H
	DW	0fH
	DW	07H
	DW	02H
$S797_MenuRp	DW	DGROUP:$S796_MenuRX
$S799_hs_cb	DW	014H
	DW	00H
	DW	0ffffH
	DW	DGROUP:$S798_hs_st
$S800_P00	DB	0c6H, 'G',  8fH, 'AME',  00H
	ORG	$+1
$S801_P01	DB	0c6H, 'C',  8fH, 'ONTROL',  00H
$S802_P02	DB	'O',  0c6H, 'P',  8fH, 'TIONS',  00H
$S803_P10	DB	0c6H, 'R',  8fH, 'ESUME GAME',  00H
$S804_P12	DB	0c6H, 'A',  8fH, 'BORT MISSION',  00H
$S805_P13	DB	'E',  0c6H, 'X',  8fH, 'IT TO DOS',  00H
$S806_P14	DB	0c6H, 'E',  8fH, 'ND MISSION',  00H
$S807_P21	DB	0c6H, 'J',  8fH, 'OYSTICK',  00H
	ORG	$+1
$S808_P22	DB	0c6H, 'K',  8fH, 'EYBOARD SENSITIVITY',  00H
	ORG	$+1
$S809_P36	DB	0c6H, 'N',  8fH, 'O JOYSTICK',  00H
$S810_P30	DB	0c6H, 'O',  8fH, 'NE JOYSTICK',  00H
	ORG	$+1
$S811_P31	DB	'JOYSTICK ',  0c6H, 'W',  8fH, '/ THROTTLE',  00H
	ORG	$+1
$S812_P32	DB	0c6H, 'T',  8fH, 'WO JOYSTICKS',  00H
$S813_P33	DB	'THRUST',  0c6H, 'M',  8fH, 'ASTER',  00H
	ORG	$+1
$S814_P34	DB	0c6H, 'V',  8fH, 'IRT PILT, FLTSTK PRO',  00H
$S815_P35	DB	0c6H, 'F',  8fH, 'OOT PEDALS',  00H
$S816_P50	DB	0c6H, 'H',  8fH, 'IGH',  00H
	ORG	$+1
$S817_P51	DB	'M',  0c6H, 'E',  8fH, 'DIUM',  00H
	ORG	$+1
$S818_P52	DB	0c6H, 'L',  8fH, 'OW',  00H
$S819_P60	DB	0c6H, 'E',  8fH, 'NABLE',  00H
	ORG	$+1
$S820_P61	DB	0c6H, 'D',  8fH, 'ISABLE',  00H
$S821_P62	DB	0c6H, 'R',  8fH, 'ECALIBRATE',  00H
$S822_P73	DB	0c6H, 'S',  8fH, 'OUND',  00H
$S823_P100	DB	0c6H, 'M',  8fH, 'OUNTAIN DETAIL',  00H
$S824_P101	DB	0c6H, 'F',  8fH, 'IGHTER DETAIL',  00H
	ORG	$+1
$S825_P102	DB	'O',  0c6H, 'B',  8fH, 'JECT DETAIL',  00H
$S826_P103	DB	'G',  0c6H, 'R',  8fH, 'OUND DETAIL',  00H
$S827_P104	DB	'E',  0c6H, 'X',  8fH, 'PLOSION DETAIL',  00H
	ORG	$+1
$S828_P105	DB	'S',  0c6H, 'K',  8fH, 'Y DETAIL',  00H
	ORG	$+1
$S829_P106	DB	'C',  0c6H, 'L',  8fH, 'EAR',  00H
$S830_P107	DB	0c6H, 'H',  8fH, 'IGH CLOUDS',  00H
$S831_P108	DB	0c6H, 'O',  8fH, 'VERCAST',  00H
	ORG	$+1
$S832_P80	DB	0c6H, 'M',  8fH, 'AXIMUM',  00H
$S833_P81	DB	0c6H, 'H',  8fH, 'IGH',  00H
	ORG	$+1
$S834_P82	DB	'M',  0c6H, 'E',  8fH, 'DIUM',  00H
	ORG	$+1
$S835_P83	DB	0c6H, 'L',  8fH, 'OW',  00H
$S836_P90	DB	'A',  0c6H, 'L',  8fH, 'L ON',  00H
	ORG	$+1
$S837_P91	DB	0c6H, 'N',  8fH, 'O ENGINE',  00H
$S838_P92	DB	'SP',  0c6H, 'E',  8fH, 'ECH & WARNINGS OFF',  00H
$S839_P93	DB	'ALL ',  0c6H, 'O',  8fH, 'FF',  00H
$S840_P110	DB	'ROLL R',  0c6H, 'A',  8fH, 'TE',  00H
$S841_P111	DB	0c6H, 'S',  8fH, 'TANDARD',  00H
	ORG	$+1
$S842_P112	DB	0c6H, 'A',  8fH, 'UTHENTIC',  00H
$S843_SoundEntry	DW	07H
	DW	04H
	DW	DGROUP:$S836_P90
	DB	02H
 	DB	1 DUP(0)

	DW	set_sound
	DW	0266cH
	DW	07H
	DW	04H
	DW	DGROUP:$S837_P91
	DB	02H
 	DB	1 DUP(0)

	DW	set_sound
	DW	0316eH
	DW	07H
	DW	04H
	DW	DGROUP:$S838_P92
	DB	02H
 	DB	1 DUP(0)

	DW	set_sound
	DW	01265H
	DW	07H
	DW	04H
	DW	DGROUP:$S839_P93
	DB	02H
 	DB	1 DUP(0)

	DW	set_sound
	DW	0186fH
$S844_SoundMenu	DW	0d1H
	DW	0bH
	DW	04H
	DW	DGROUP:$S843_SoundEntry
$S845_MtnDetailEntry	DW	07H
	DW	04H
	DW	DGROUP:$S816_P50
	DB	02H
 	DB	1 DUP(0)

	DW	set_mtn_detail
	DW	02368H
	DW	07H
	DW	04H
	DW	DGROUP:$S817_P51
	DB	02H
 	DB	1 DUP(0)

	DW	set_mtn_detail
	DW	01265H
	DW	07H
	DW	04H
	DW	DGROUP:$S818_P52
	DB	02H
 	DB	1 DUP(0)

	DW	set_mtn_detail
	DW	0266cH
$S846_MtnDetailMenu	DW	0d1H
	DW	018H
	DW	03H
	DW	DGROUP:$S845_MtnDetailEntry
$S847_PlaneDetailEntry	DW	07H
	DW	04H
	DW	DGROUP:$S816_P50
	DB	02H
 	DB	1 DUP(0)

	DW	set_plane_detail
	DW	02368H
	DW	07H
	DW	04H
	DW	DGROUP:$S817_P51
	DB	02H
 	DB	1 DUP(0)

	DW	set_plane_detail
	DW	01265H
	DW	07H
	DW	04H
	DW	DGROUP:$S818_P52
	DB	02H
 	DB	1 DUP(0)

	DW	set_plane_detail
	DW	0266cH
$S848_PlaneDetailMenu	DW	0d1H
	DW	025H
	DW	03H
	DW	DGROUP:$S847_PlaneDetailEntry
$S849_ObjDetailEntry	DW	07H
	DW	04H
	DW	DGROUP:$S816_P50
	DB	02H
 	DB	1 DUP(0)

	DW	set_obj_detail
	DW	02368H
	DW	07H
	DW	04H
	DW	DGROUP:$S818_P52
	DB	02H
 	DB	1 DUP(0)

	DW	set_obj_detail
	DW	0266cH
$S850_ObjDetailMenu	DW	0d1H
	DW	032H
	DW	02H
	DW	DGROUP:$S849_ObjDetailEntry
$S851_GrndDetailEntry	DW	07H
	DW	04H
	DW	DGROUP:$S816_P50
	DB	02H
 	DB	1 DUP(0)

	DW	set_grnd_detail
	DW	02368H
	DW	07H
	DW	04H
	DW	DGROUP:$S818_P52
	DB	02H
 	DB	1 DUP(0)

	DW	set_grnd_detail
	DW	0266cH
$S852_GrndDetailMenu	DW	0d1H
	DW	03fH
	DW	02H
	DW	DGROUP:$S851_GrndDetailEntry
$S853_XploDetailEntry	DW	07H
	DW	04H
	DW	DGROUP:$S816_P50
	DB	02H
 	DB	1 DUP(0)

	DW	set_xplo_detail
	DW	02368H
	DW	07H
	DW	04H
	DW	DGROUP:$S818_P52
	DB	02H
 	DB	1 DUP(0)

	DW	set_xplo_detail
	DW	0266cH
$S854_XploDetailMenu	DW	0d1H
	DW	04cH
	DW	02H
	DW	DGROUP:$S853_XploDetailEntry
$S855_ConditionsEntry	DW	07H
	DW	04H
	DW	DGROUP:$S816_P50
	DB	02H
 	DB	1 DUP(0)

	DW	set_conditions
	DW	02368H
	DW	07H
	DW	04H
	DW	DGROUP:$S818_P52
	DB	02H
 	DB	1 DUP(0)

	DW	set_conditions
	DW	0266cH
$S856_ConditionsMenu	DW	0d1H
	DW	059H
	DW	02H
	DW	DGROUP:$S855_ConditionsEntry
$S857_JoyEntry	DW	07H
	DW	04H
	DW	DGROUP:$S809_P36
	DB	02H
 	DB	1 DUP(0)

	DW	joy_on
	DW	0316eH
	DW	07H
	DW	04H
	DW	DGROUP:$S810_P30
	DB	02H
 	DB	1 DUP(0)

	DW	joy_on
	DW	0186fH
	DW	07H
	DW	04H
	DW	DGROUP:$S811_P31
	DB	02H
 	DB	1 DUP(0)

	DW	joy_on
	DW	01177H
	DW	07H
	DW	04H
	DW	DGROUP:$S812_P32
	DB	02H
 	DB	1 DUP(0)

	DW	joy_on
	DW	01474H
	DW	07H
	DW	04H
	DW	DGROUP:$S813_P33
	DB	02H
 	DB	1 DUP(0)

	DW	joy_on
	DW	0326dH
	DW	07H
	DW	04H
	DW	DGROUP:$S814_P34
	DB	02H
 	DB	1 DUP(0)

	DW	joy_on
	DW	02f76H
	DW	07H
	DW	04H
	DW	DGROUP:$S815_P35
	DB	02H
 	DB	1 DUP(0)

	DW	ped_on
	DW	02166H
	DW	07H
	DW	04H
	DW	DGROUP:$S821_P62
	DB	00H
 	DB	1 DUP(0)

	DW	joy_recal2
	DW	01372H
$S858_JoyMenu	DW	099H
	DW	0bH
	DW	08H
	DW	DGROUP:$S857_JoyEntry
$S859_KbEntry	DW	07H
	DW	04H
	DW	DGROUP:$S816_P50
	DB	02H
 	DB	1 DUP(0)

	DW	set_kb_sens
	DW	02368H
	DW	07H
	DW	04H
	DW	DGROUP:$S817_P51
	DB	02H
 	DB	1 DUP(0)

	DW	set_kb_sens
	DW	01265H
	DW	07H
	DW	04H
	DW	DGROUP:$S818_P52
	DB	02H
 	DB	1 DUP(0)

	DW	set_kb_sens
	DW	0266cH
$S860_KbMenu	DW	099H
	DW	018H
	DW	03H
	DW	DGROUP:$S859_KbEntry
$S861_RollEntry	DW	07H
	DW	04H
	DW	DGROUP:$S841_P111
	DB	02H
 	DB	1 DUP(0)

	DW	set_rollrate
	DW	01f73H
	DW	07H
	DW	04H
	DW	DGROUP:$S842_P112
	DB	02H
 	DB	1 DUP(0)

	DW	set_rollrate
	DW	01e61H
$S862_RollMenu	DW	099H
	DW	025H
	DW	02H
	DW	DGROUP:$S861_RollEntry
$S863_OptnEntry	DW	07H
	DW	04H
	DW	DGROUP:$S822_P73
	DB	01H
 	DB	1 DUP(0)

	DW	DGROUP:$S844_SoundMenu
	DW	01f73H
	DW	07H
	DW	04H
	DW	DGROUP:$S823_P100
	DB	01H
 	DB	1 DUP(0)

	DW	DGROUP:$S846_MtnDetailMenu
	DW	0326dH
	DW	07H
	DW	04H
	DW	DGROUP:$S824_P101
	DB	01H
 	DB	1 DUP(0)

	DW	DGROUP:$S848_PlaneDetailMenu
	DW	02166H
	DW	07H
	DW	04H
	DW	DGROUP:$S825_P102
	DB	01H
 	DB	1 DUP(0)

	DW	DGROUP:$S850_ObjDetailMenu
	DW	03062H
	DW	07H
	DW	04H
	DW	DGROUP:$S826_P103
	DB	01H
 	DB	1 DUP(0)

	DW	DGROUP:$S852_GrndDetailMenu
	DW	01372H
	DW	07H
	DW	04H
	DW	DGROUP:$S827_P104
	DB	01H
 	DB	1 DUP(0)

	DW	DGROUP:$S854_XploDetailMenu
	DW	02d78H
	DW	07H
	DW	04H
	DW	DGROUP:$S828_P105
	DB	01H
 	DB	1 DUP(0)

	DW	DGROUP:$S856_ConditionsMenu
	DW	0256bH
$S864_OptnMenu	DW	084H
	DW	0bH
	DW	07H
	DW	DGROUP:$S863_OptnEntry
$S865_FileEntry	DW	07H
	DW	04H
	DW	DGROUP:$S803_P10
	DB	00H
 	DB	1 DUP(0)

	DW	resume_game
	DW	01372H
	DW	07H
	DW	04H
	DW	DGROUP:$S804_P12
	DB	00H
 	DB	1 DUP(0)

	DW	abort_mission
	DW	01e61H
	DW	07H
	DW	04H
	DW	DGROUP:$S805_P13
	DB	00H
 	DB	1 DUP(0)

	DW	exit_to_dos
	DW	02d78H
$S866_FileMenu	DW	00H
	DW	0bH
	DW	03H
	DW	DGROUP:$S865_FileEntry
$S867_FileEntry2	DW	07H
	DW	04H
	DW	DGROUP:$S803_P10
	DB	00H
 	DB	1 DUP(0)

	DW	resume_game
	DW	01372H
	DW	07H
	DW	04H
	DW	DGROUP:$S806_P14
	DB	00H
 	DB	1 DUP(0)

	DW	end_mission
	DW	01265H
	DW	07H
	DW	04H
	DW	DGROUP:$S804_P12
	DB	00H
 	DB	1 DUP(0)

	DW	abort_mission
	DW	01e61H
	DW	07H
	DW	04H
	DW	DGROUP:$S805_P13
	DB	00H
 	DB	1 DUP(0)

	DW	exit_to_dos
	DW	02d78H
$S868_FileMenu2	DW	00H
	DW	0bH
	DW	04H
	DW	DGROUP:$S867_FileEntry2
$S869_CtrlEntry	DW	07H
	DW	04H
	DW	DGROUP:$S807_P21
	DB	01H
 	DB	1 DUP(0)

	DW	DGROUP:$S858_JoyMenu
	DW	0246aH
	DW	07H
	DW	04H
	DW	DGROUP:$S808_P22
	DB	01H
 	DB	1 DUP(0)

	DW	DGROUP:$S860_KbMenu
	DW	0256bH
	DW	07H
	DW	04H
	DW	DGROUP:$S840_P110
	DB	01H
 	DB	1 DUP(0)

	DW	DGROUP:$S862_RollMenu
	DW	01e61H
$S870_CtrlMenu	DW	03fH
	DW	0bH
	DW	03H
	DW	DGROUP:$S869_CtrlEntry
$S871_BarEntry	DW	07H
	DW	03H
	DW	DGROUP:$S800_P00
	DB	01H
 	DB	1 DUP(0)

	DW	DGROUP:$S866_FileMenu
	DW	02267H
	DW	046H
	DW	03H
	DW	DGROUP:$S801_P01
	DB	01H
 	DB	1 DUP(0)

	DW	DGROUP:$S870_CtrlMenu
	DW	02e63H
	DW	08bH
	DW	03H
	DW	DGROUP:$S802_P02
	DB	01H
 	DB	1 DUP(0)

	DW	DGROUP:$S864_OptnMenu
	DW	01970H
$S872_Bar	DW	00H
	DW	00H
	DW	03H
	DW	DGROUP:$S871_BarEntry
$S873_R_DISABLE	DW	00H
$S874_MOSspr	DW	00H
$S877_kb_sens	DW	00H
	DW	00H
	DW	01H
$S878_MosON	DW	01H
$S948_done	DW	00H
_DATA      ENDS
_BSS      SEGMENT
	ORG	$+10
$S790_MenuSpr1W	DW 01H DUP (?)
	ORG	$-8
$S791_MenuSpr1H	DW 01H DUP (?)
	ORG	$+6
$S792_MenuSpr2W	DW 01H DUP (?)
	ORG	$-8
$S793_MenuSpr2H	DW 01H DUP (?)
	ORG	$+6
$S794_MenuSpr3W	DW 01H DUP (?)
	ORG	$-8
$S795_MenuSpr3H	DW 01H DUP (?)
	ORG	$+6
$S798_hs_st	DW 08cH DUP (?)
	ORG	$-296
$S875_MOShotx	DW 01H DUP (?)
$S876_MOShoty	DW 01H DUP (?)
_BSS      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 16
; Line 17
; Line 18
; Line 19
; Line 20
; Line 21
; Line 22
; Line 23
; Line 24
; Line 25
; Line 26
; Line 27
; Line 330
	PUBLIC	_MainMenu
_MainMenu	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 331
	cmp	WORD PTR _Fencer,2
	jne	$I881
	mov	WORD PTR $S871_BarEntry+8,OFFSET DGROUP:$S868_FileMenu2
; Line 332
$I881:
	mov	ax,6
	push	ax
	call	FAR PTR _SndSounds
	add	sp,2
; Line 333
	mov	ax,OFFSET DGROUP:$S872_Bar
	push	ax
	call	bar_menu
	add	sp,2
; Line 334
	mov	ax,7
	push	ax
	call	FAR PTR _SndSounds
	add	sp,2
; Line 335
	ret	
	nop	

_MainMenu	ENDP
; Line 339
bar_menu	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
;	lopt = -14
;	fopt = -12
;	last = -4
;	key = -10
;	s = -2
;	done = -8
;	latched = -6
;	m = 4
; Line 343
	sub	ax,ax
	mov	WORD PTR [bp-8],ax	;done
	mov	WORD PTR [bp-6],ax	;latched
; Line 347
	mov	ax,WORD PTR $S874_MOSspr
	cmp	WORD PTR _MouseSprite,ax
	je	$I892
; Line 348
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _MouseSprite
	call	_MouseSETUP
	add	sp,6
; Line 350
$I892:
	call	FAR PTR _MouseHIDE
; Line 351
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR _Rp2
	mov	cx,200
	push	cx
	mov	cx,320
	push	cx
	push	ax
	push	ax
	push	WORD PTR _Rp1
	call	FAR PTR _RectCopy
	add	sp,16
; Line 353
	call	menu_setup
; Line 354
	push	WORD PTR [bp+4]	;m
	call	bar_show
	add	sp,2
; Line 356
	mov	ax,1
	push	ax
	sub	cx,cx
	push	cx
	push	WORD PTR [bp+4]	;m
	call	hs_find
	add	sp,6
	mov	WORD PTR [bp-12],ax	;fopt
; Line 357
	mov	ax,1
	push	ax
	mov	bx,WORD PTR [bp+4]	;m
	sub	ax,WORD PTR [bx+4]
	neg	ax
	push	ax
	push	bx
	call	hs_find
	add	sp,6
	mov	WORD PTR [bp-14],ax	;lopt
; Line 359
	mov	ax,-1
	mov	WORD PTR $S799_hs_cb+4,ax
	mov	WORD PTR [bp-4],ax	;last
; Line 361
	jmp	$I924
	nop	
$FC898:
; Line 362
	mov	ax,WORD PTR $S799_hs_cb+4
	cmp	WORD PTR [bp-4],ax	;last
	jne	$JCC202
	jmp	$I900
$JCC202:
; Line 363
	call	FAR PTR _MouseHIDE
; Line 365
	cmp	WORD PTR [bp-4],-1	;last
	je	$I901
; Line 372
	mov	ax,7
	push	ax
	mov	ax,234
	push	ax
	mov	bx,WORD PTR [bp-4]	;last
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,WORD PTR $S799_hs_cb+6
	mov	ax,WORD PTR [bx+6]
	sub	ax,WORD PTR [bx+2]
	inc	ax
	push	ax
	mov	ax,WORD PTR [bx+4]
	sub	ax,WORD PTR [bx]
	inc	ax
	push	ax
	push	WORD PTR [bx+2]
	push	WORD PTR [bx]
	push	WORD PTR $S797_MenuRp
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 374
$I901:
; Line 376
	mov	ax,WORD PTR $S799_hs_cb+4
	mov	WORD PTR [bp-4],ax	;last
	inc	ax
	je	$I902
; Line 383
	mov	ax,234
	push	ax
	mov	ax,7
	push	ax
	mov	bx,WORD PTR [bp-4]	;last
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,WORD PTR $S799_hs_cb+6
	mov	ax,WORD PTR [bx+6]
	sub	ax,WORD PTR [bx+2]
	inc	ax
	push	ax
	mov	ax,WORD PTR [bx+4]
	sub	ax,WORD PTR [bx]
	inc	ax
	push	ax
	push	WORD PTR [bx+2]
	push	WORD PTR [bx]
	push	WORD PTR $S797_MenuRp
	call	FAR PTR _ChangeColor
	add	sp,14
; Line 385
$I902:
	call	FAR PTR _MouseSHOW
; Line 386
; Line 390
$I900:
	push	WORD PTR [bp+4]	;m
	call	menu_activate
	add	sp,2
	mov	WORD PTR [bp-10],ax	;key
; Line 394
	call	_kbhit
	or	ax,ax
	jne	$I906
	cmp	WORD PTR [bp-10],ax	;key
	je	$I905
$I906:
; Line 397
	call	_kbhit
	or	ax,ax
	je	$I907
	sub	ax,ax
	push	ax
	call	__bios_keybrd
	add	sp,2
	mov	WORD PTR [bp-10],ax	;key
; Line 399
$I907:
	mov	ax,WORD PTR [bp-10]	;key
	sub	ax,283
	je	$L20023
	sub	ax,18917
	je	$SC913
	sub	ax,512
	je	$SC915
; Line 414
	mov	ax,1
	push	ax
	push	WORD PTR [bp-10]	;key
	call	hs_find_altkey
	add	sp,4
	jmp	SHORT $L20024
	nop	
	nop	
$SC913:
; Line 405
	mov	ax,WORD PTR $S799_hs_cb+4
	cmp	WORD PTR [bp-12],ax	;fopt
	jl	$I914
	mov	ax,WORD PTR [bp-14]	;lopt
	inc	ax
	mov	WORD PTR $S799_hs_cb+4,ax
; Line 406
$I914:
	dec	WORD PTR $S799_hs_cb+4
; Line 407
	jmp	SHORT $I924
; Line 409
	nop	
$SC915:
; Line 410
	inc	WORD PTR $S799_hs_cb+4
	mov	ax,WORD PTR [bp-14]	;lopt
	cmp	WORD PTR $S799_hs_cb+4,ax
	jle	$I924
	mov	ax,WORD PTR [bp-12]	;fopt
$L20024:
	mov	WORD PTR $S799_hs_cb+4,ax
; Line 411
	jmp	SHORT $I924
; Line 413
	nop	
$I905:
; Line 419
	cmp	WORD PTR _Button,ax
	je	$I920
; Line 420
	mov	ax,WORD PTR _Button
	mov	WORD PTR [bp-6],ax	;latched
; Line 421
	push	WORD PTR _MouseY
	push	WORD PTR _MouseX
	call	hs_setcur
	add	sp,4
; Line 422
	jmp	SHORT $I924
$I920:
	cmp	WORD PTR [bp-6],ax	;latched
	je	$I924
; Line 423
	mov	WORD PTR [bp-6],ax	;latched
; Line 424
	push	WORD PTR _MouseY
	push	WORD PTR _MouseX
	call	hs_setcur
	add	sp,4
	inc	ax
	jne	$I924
; Line 425
$L20023:
	inc	WORD PTR [bp-8]	;done
; Line 426
; Line 427
$I924:
; Line 428
; Line 429
	cmp	WORD PTR [bp-8],0	;done
	jne	$JCC532
	jmp	$FC898
$JCC532:
; Line 431
	push	WORD PTR [bp+4]	;m
	call	bar_hide
	add	sp,2
; Line 433
	call	_CursorInCrt
	or	ax,ax
	je	$I927
; Line 434
	mov	cx,5
	push	cx
	push	cx
	push	ax
	call	_MouseSETUP
	add	sp,6
; Line 436
$I927:
	mov	ax,1
	push	ax
	call	FAR PTR _ShowPage
	add	sp,2
; Line 437
	call	FAR PTR _MouseHITS
; Line 438
	mov	sp,bp
	pop	bp
	ret	

bar_menu	ENDP
; Line 442
bar_show	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,22
	call	__aNchkstk
	push	si
;	i = -8
;	x = -4
;	y = -6
;	hs = -22
;	e = -2
;	m = 4
; Line 447
	call	FAR PTR _MouseHIDE
; Line 448
	push	WORD PTR _MenuSpr1
	mov	bx,WORD PTR [bp+4]	;m
	push	WORD PTR [bx+2]
	push	WORD PTR [bx]
	push	WORD PTR $S797_MenuRp
	call	FAR PTR _ShowSprite
	add	sp,8
; Line 449
	call	FAR PTR _MouseSHOW
; Line 451
	mov	WORD PTR [bp-8],0	;i
	jmp	$F935
$FC936:
; Line 453
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	shl	ax,1
	add	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-2],ax	;e
; Line 454
	mov	si,ax
	mov	cx,WORD PTR [si]
	add	cx,WORD PTR [bx]
	mov	WORD PTR [bp-4],cx	;x
; Line 455
	mov	cx,WORD PTR [si+2]
	add	cx,WORD PTR [bx+2]
	mov	WORD PTR [bp-6],cx	;y
; Line 460
	mov	si,WORD PTR $S797_MenuRp
	mov	WORD PTR [si+12],15
; Line 461
	call	FAR PTR _MouseHIDE
; Line 462
	mov	bx,WORD PTR [bp-2]	;e
	push	WORD PTR [bx+4]
	push	WORD PTR [bp-6]	;y
	push	WORD PTR [bp-4]	;x
	push	WORD PTR $S797_MenuRp
	call	FAR PTR _RpPrint
	add	sp,8
; Line 463
	call	FAR PTR _MouseSHOW
; Line 467
	mov	ax,WORD PTR [bp-4]	;x
	sub	ax,5
	mov	WORD PTR [bp-22],ax	;hs
; Line 468
	mov	bx,WORD PTR [bp-2]	;e
	push	WORD PTR [bx+4]
	push	WORD PTR $S797_MenuRp
	call	_pstrlen
	add	sp,4
	add	ax,WORD PTR [bp-4]	;x
	add	ax,4
	mov	WORD PTR [bp-18],ax
; Line 469
	mov	bx,WORD PTR [bp+4]	;m
	mov	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-20],ax
; Line 470
	mov	ax,WORD PTR [bx+2]
	add	ax,WORD PTR $S791_MenuSpr1H
	dec	ax
	mov	WORD PTR [bp-16],ax
; Line 471
	mov	BYTE PTR [bp-14],1
; Line 472
	mov	WORD PTR [bp-12],bx
; Line 473
	mov	ax,WORD PTR [bp-8]	;i
	mov	WORD PTR [bp-10],ax
; Line 475
	lea	ax,WORD PTR [bp-22]	;hs
	push	ax
	call	hs_push
	add	sp,2
; Line 477
	inc	WORD PTR [bp-8]	;i
$F935:
	mov	bx,WORD PTR [bp+4]	;m
	mov	ax,WORD PTR [bp-8]	;i
	cmp	WORD PTR [bx+4],ax
	jle	$JCC804
	jmp	$FC936
$JCC804:
; Line 479
	pop	si
	mov	sp,bp
	pop	bp
	ret	

bar_show	ENDP
; Line 483
bar_hide	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
;	m = 4
; Line 487
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F943
$FC944:
; Line 488
	call	hs_pop
	inc	WORD PTR [bp-2]	;i
$F943:
	mov	bx,WORD PTR [bp+4]	;m
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR [bx+4],ax
	jg	$FC944
; Line 489
	mov	sp,bp
	pop	bp
	ret	
	nop	

bar_hide	ENDP
; Line 493
menu_setup	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	s = -4
; Line 497
	cmp	WORD PTR $S948_done,0
	je	$I950
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 498
$I950:
	inc	WORD PTR $S948_done
; Line 500
	mov	WORD PTR [bp-4],0	;s
; Line 501
	mov	ax,WORD PTR _MenuSpr1
	mov	WORD PTR [bp-2],ax
; Line 502
	les	bx,DWORD PTR [bp-4]	;s
	mov	ax,WORD PTR es:[bx]
	mov	WORD PTR $S790_MenuSpr1W,ax
; Line 503
	mov	ax,WORD PTR es:[bx+2]
	mov	WORD PTR $S791_MenuSpr1H,ax
; Line 505
	mov	ax,WORD PTR _MenuSpr2
; Line 506
	mov	es,ax
	mov	ax,WORD PTR es:[bx]
	mov	WORD PTR $S792_MenuSpr2W,ax
; Line 507
	mov	ax,WORD PTR es:[bx+2]
	mov	WORD PTR $S793_MenuSpr2H,ax
; Line 509
	mov	ax,WORD PTR _MenuSpr3
; Line 510
	mov	es,ax
	mov	ax,WORD PTR es:[bx]
	mov	WORD PTR $S794_MenuSpr3W,ax
; Line 511
	mov	ax,WORD PTR es:[bx+2]
	mov	WORD PTR $S795_MenuSpr3H,ax
; Line 512
	mov	sp,bp
	pop	bp
	ret	
	nop	

menu_setup	ENDP
; Line 516
	PUBLIC	_menu
_menu	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__aNchkstk
	push	si
;	latched = -4
;	done = -6
;	last = -2
;	lopt = -16
;	fopt = -10
;	cur = -12
;	active = -14
;	key = -8
;	m = 4
; Line 523
	mov	ax,1
	push	ax
	push	WORD PTR [bp+4]	;m
	call	menu_show
	add	sp,4
; Line 524
	sub	ax,ax
	mov	WORD PTR [bp-14],ax	;active
	mov	WORD PTR [bp-8],ax	;key
	mov	WORD PTR [bp-4],ax	;latched
	mov	WORD PTR [bp-6],ax	;done
	push	ax
	mov	ax,1
	push	ax
	sub	cx,cx
	push	cx
	push	WORD PTR [bp+4]	;m
	call	entry_draw
	add	sp,8
; Line 528
	mov	ax,1
	push	ax
	sub	cx,cx
	push	cx
	push	WORD PTR [bp+4]	;m
	call	hs_find
	add	sp,6
	mov	WORD PTR $S799_hs_cb+4,ax
	mov	WORD PTR [bp-2],ax	;last
	mov	WORD PTR [bp-10],ax	;fopt
; Line 529
	mov	ax,1
	push	ax
	mov	bx,WORD PTR [bp+4]	;m
	sub	ax,WORD PTR [bx+4]
	neg	ax
	push	ax
	push	bx
	call	hs_find
	add	sp,6
	mov	WORD PTR [bp-16],ax	;lopt
; Line 531
	jmp	$I999
	nop	
$FC965:
; Line 532
	mov	WORD PTR [bp-8],0	;key
; Line 536
	mov	si,WORD PTR $S799_hs_cb+4
	mov	ax,si
	shl	si,1
	add	si,ax
	shl	si,1
	add	si,ax
	shl	si,1
	mov	bx,WORD PTR $S799_hs_cb+6
	mov	ax,WORD PTR [bp+4]	;m
	cmp	WORD PTR [bx+10][si],ax
	je	$I967
; Line 538
	inc	WORD PTR [bp-6]	;done
; Line 540
	jmp	SHORT $I969
$I967:
	mov	ax,WORD PTR $S799_hs_cb+4
	cmp	WORD PTR [bp-2],ax	;last
	je	$I969
; Line 542
	sub	ax,ax
	push	ax
	push	ax
	mov	si,WORD PTR [bp-2]	;last
	mov	cx,si
	shl	si,1
	add	si,cx
	shl	si,1
	add	si,cx
	shl	si,1
	push	WORD PTR [bx+12][si]
	push	WORD PTR [bp+4]	;m
	call	entry_draw
	add	sp,8
; Line 543
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	si,WORD PTR $S799_hs_cb+4
	mov	ax,si
	shl	si,1
	add	si,ax
	shl	si,1
	add	si,ax
	shl	si,1
	mov	bx,WORD PTR $S799_hs_cb+6
	push	WORD PTR [bx+12][si]
	push	WORD PTR [bp+4]	;m
	call	entry_draw
	add	sp,8
; Line 545
; Line 547
$I969:
	cmp	WORD PTR [bp-14],0	;active
	je	$I970
	cmp	WORD PTR [bp-6],0	;done
	jne	$I970
; Line 549
	inc	WORD PTR $S873_R_DISABLE
; Line 551
	push	WORD PTR [bp+4]	;m
	call	menu_activate
	add	sp,2
	mov	WORD PTR [bp-8],ax	;key
; Line 552
	dec	WORD PTR $S873_R_DISABLE
; Line 553
	sub	ax,ax
	push	ax
	push	WORD PTR [bp+4]	;m
	call	menu_show
	add	sp,4
; Line 554
	sub	ax,ax
	push	ax
	mov	cx,1
	push	cx
	mov	si,WORD PTR $S799_hs_cb+4
	mov	cx,si
	shl	si,1
	add	si,cx
	shl	si,1
	add	si,cx
	shl	si,1
	mov	bx,WORD PTR $S799_hs_cb+6
	push	WORD PTR [bx+12][si]
	push	WORD PTR [bp+4]	;m
	call	entry_draw
	add	sp,8
; Line 555
	mov	WORD PTR [bp-14],0	;active
; Line 557
; Line 559
$I970:
	mov	ax,WORD PTR $S799_hs_cb+4
	mov	WORD PTR [bp-2],ax	;last
; Line 563
	call	_kbhit
	or	ax,ax
	jne	$I972
	cmp	WORD PTR [bp-8],ax	;key
	jne	$JCC1272
	jmp	$I971
$JCC1272:
$I972:
; Line 567
	call	_kbhit
	or	ax,ax
	je	$I973
	sub	ax,ax
	push	ax
	call	__bios_keybrd
	add	sp,2
	mov	WORD PTR [bp-8],ax	;key
; Line 569
$I973:
	mov	ax,WORD PTR [bp-8]	;key
	cmp	ax,18432
	je	$SC983
	jle	$JCC1304
	jmp	$L20001
$JCC1304:
	sub	ax,283
	je	$SC978
	sub	ax,6898
	jne	$JCC1317
	jmp	$I998
$JCC1317:
	jmp	$SD987
; Line 570
	nop	
$SC978:
; Line 572
	cmp	WORD PTR $S873_R_DISABLE,0
	je	$I979
	mov	WORD PTR [bp-8],0	;key
; Line 573
$I979:
	inc	WORD PTR [bp-6]	;done
; Line 606
	jmp	$I999
; Line 576
$SC980:
; Line 578
	cmp	WORD PTR $S873_R_DISABLE,0
	je	$JCC1349
	jmp	$I999
$JCC1349:
	jmp	SHORT $I979
$SC983:
; Line 588
	mov	ax,WORD PTR [bp-10]	;fopt
	cmp	WORD PTR $S799_hs_cb+4,ax
	jg	$I984
	mov	ax,WORD PTR [bp-16]	;lopt
	inc	ax
	mov	WORD PTR $S799_hs_cb+4,ax
; Line 589
$I984:
	dec	WORD PTR $S799_hs_cb+4
; Line 590
	jmp	$I999
; Line 592
	nop	
$SC985:
; Line 593
	inc	WORD PTR $S799_hs_cb+4
	mov	ax,WORD PTR [bp-16]	;lopt
	cmp	WORD PTR $S799_hs_cb+4,ax
	jg	$JCC1391
	jmp	$I999
$JCC1391:
	mov	ax,WORD PTR [bp-10]	;fopt
$L20029:
	mov	WORD PTR $S799_hs_cb+4,ax
; Line 594
	jmp	$I999
; Line 596
	nop	
$I988:
; Line 600
	mov	si,ax
	shl	si,1
	add	si,ax
	shl	si,1
	add	si,ax
	shl	si,1
	mov	bx,WORD PTR $S799_hs_cb+6
	mov	ax,WORD PTR [bp+4]	;m
	cmp	WORD PTR [bx+10][si],ax
	jne	$JCC1428
	jmp	$I998
$JCC1428:
	inc	WORD PTR [bp-6]	;done
; Line 601
	jmp	$I998
	nop	
$L20001:
	sub	ax,19200
	je	$SC978
	sub	ax,512
	je	$SC980
	sub	ax,768
	je	$SC985
$SD987:
; Line 597
	mov	ax,1
	push	ax
	push	WORD PTR [bp-8]	;key
	call	hs_find_altkey
	add	sp,4
	mov	WORD PTR $S799_hs_cb+4,ax
	cmp	ax,-1
	jne	$I988
; Line 598
$L20030:
	mov	ax,WORD PTR [bp-2]	;last
	jmp	SHORT $L20029
	nop	
$I971:
; Line 610
	cmp	WORD PTR _Button,ax
	je	$I992
; Line 611
	mov	ax,WORD PTR _Button
	mov	WORD PTR [bp-4],ax	;latched
; Line 612
	push	WORD PTR _MouseY
	push	WORD PTR _MouseX
	call	hs_setcur
	add	sp,4
	inc	ax
	je	$L20030
	mov	si,WORD PTR $S799_hs_cb+4
	mov	ax,si
	shl	si,1
	add	si,ax
	shl	si,1
	add	si,ax
	shl	si,1
	mov	bx,WORD PTR $S799_hs_cb+6
	mov	si,WORD PTR [bx+12][si]
	mov	ax,si
	shl	si,1
	add	si,ax
	shl	si,1
	shl	si,1
	mov	bx,WORD PTR [bp+4]	;m
	mov	bx,WORD PTR [bx+6]
	cmp	BYTE PTR [bx+6][si],1
	jne	$I999
; Line 615
	inc	WORD PTR [bp-14]	;active
; Line 616
	mov	WORD PTR [bp-4],0	;latched
; Line 617
; Line 619
	jmp	SHORT $I999
$I992:
	cmp	WORD PTR [bp-4],ax	;latched
	je	$I999
; Line 620
	mov	WORD PTR [bp-4],ax	;latched
; Line 621
	push	WORD PTR _MouseY
	push	WORD PTR _MouseX
	call	hs_setcur
	add	sp,4
	inc	ax
	jne	$I998
; Line 622
	mov	ax,WORD PTR [bp-2]	;last
	mov	WORD PTR $S799_hs_cb+4,ax
; Line 623
	inc	WORD PTR [bp-6]	;done
; Line 624
	mov	WORD PTR [bp-8],283	;key
; Line 625
	jmp	SHORT $I999
	nop	
$I998:
; Line 626
	inc	WORD PTR [bp-14]	;active
; Line 627
$I999:
; Line 628
; Line 630
; Line 632
	cmp	WORD PTR [bp-6],0	;done
	jne	$JCC1615
	jmp	$FC965
$JCC1615:
; Line 634
	push	WORD PTR [bp+4]	;m
	call	menu_hide
	add	sp,2
; Line 636
	mov	ax,WORD PTR [bp-8]	;key
; Line 638
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_menu	ENDP
; Line 642
menu_show	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
;	hsflag = 6
;	m = 4
; Line 645
	push	WORD PTR [bp+4]	;m
	call	draw_dropshadow
	add	sp,2
; Line 647
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1006
	nop	
$FC1007:
; Line 648
	push	WORD PTR [bp+6]	;hsflag
	sub	cx,cx
	push	cx
	push	ax
	push	bx
	call	entry_draw
	add	sp,8
	inc	WORD PTR [bp-2]	;i
$F1006:
	mov	bx,WORD PTR [bp+4]	;m
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR [bx+4],ax
	jg	$FC1007
; Line 649
	mov	sp,bp
	pop	bp
	ret	

menu_show	ENDP
; Line 653
menu_hide	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	w = -2
;	h = -4
;	i = -6
;	m = 4
; Line 658
	mov	ax,WORD PTR $S794_MenuSpr3W
	add	ax,WORD PTR $S792_MenuSpr2W
	add	ax,5
	mov	WORD PTR [bp-2],ax	;w
; Line 659
	mov	bx,WORD PTR [bp+4]	;m
	mov	ax,WORD PTR [bx+4]
	imul	WORD PTR $S793_MenuSpr2H
	add	ax,5
	mov	WORD PTR [bp-4],ax	;h
; Line 661
	call	FAR PTR _MouseHIDE
; Line 662
	mov	bx,WORD PTR [bp+4]	;m
	push	WORD PTR [bx+2]
	push	WORD PTR [bx]
	push	WORD PTR $S797_MenuRp
	push	WORD PTR [bp-4]	;h
	push	WORD PTR [bp-2]	;w
	push	WORD PTR [bx+2]
	push	WORD PTR [bx]
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 663
	call	FAR PTR _MouseSHOW
; Line 667
	mov	WORD PTR [bp-6],0	;i
	jmp	SHORT $F1014
$FC1015:
; Line 668
	call	hs_pop
	inc	WORD PTR [bp-6]	;i
$F1014:
	mov	bx,WORD PTR [bp+4]	;m
	mov	ax,WORD PTR [bp-6]	;i
	cmp	WORD PTR [bx+4],ax
	jg	$FC1015
; Line 670
	mov	sp,bp
	pop	bp
	ret	
	nop	

menu_hide	ENDP
; Line 674
menu_activate	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	si
;	key = -4
;	cur = -6
;	e = -2
;	m = 4
; Line 675
	mov	WORD PTR [bp-4],0	;key
; Line 680
	cmp	WORD PTR $S799_hs_cb+4,-1
	jne	$JCC1828
	jmp	$SD1032
$JCC1828:
; Line 681
	mov	si,WORD PTR $S799_hs_cb+4
	mov	ax,si
	shl	si,1
	add	si,ax
	shl	si,1
	add	si,ax
	shl	si,1
	mov	bx,WORD PTR $S799_hs_cb+6
	mov	ax,WORD PTR [bx+12][si]
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	shl	ax,1
	mov	bx,WORD PTR [bp+4]	;m
	add	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-2],ax	;e
; Line 683
	mov	bx,ax
	mov	al,BYTE PTR [bx+6]
	cbw	
	or	ax,ax
	je	$SC1027
	dec	ax
	je	$SC1028
	dec	ax
	je	$SC1031
	jmp	SHORT $SD1032
; Line 685
	nop	
$SC1027:
; Line 687
	call	WORD PTR [bx+8]
; Line 688
	mov	WORD PTR [bp-4],283	;key
; Line 689
	jmp	SHORT $SD1032
; Line 691
$SC1028:
; Line 694
	mov	ax,WORD PTR $S799_hs_cb+4
	mov	WORD PTR [bp-6],ax	;cur
	push	ax
	call	hs_disable
	add	sp,2
; Line 695
	mov	bx,WORD PTR [bp-2]	;e
	push	WORD PTR [bx+8]
	call	_menu
	add	sp,2
	mov	WORD PTR [bp-4],ax	;key
; Line 696
	push	WORD PTR [bp-6]	;cur
	call	hs_enable
	add	sp,2
; Line 697
	mov	ax,WORD PTR [bp-6]	;cur
	mov	WORD PTR $S799_hs_cb+4,ax
; Line 698
	jmp	SHORT $SD1032
; Line 700
	nop	
$SC1031:
; Line 702
	mov	si,WORD PTR $S799_hs_cb+4
	mov	ax,si
	shl	si,1
	add	si,ax
	shl	si,1
	add	si,ax
	shl	si,1
	mov	bx,WORD PTR $S799_hs_cb+6
	push	WORD PTR [bx+12][si]
	mov	ax,1
	push	ax
	mov	bx,WORD PTR [bp-2]	;e
	call	WORD PTR [bx+8]
	add	sp,4
; Line 703
	mov	WORD PTR [bp-4],19200	;key
; Line 706
$SD1032:
; Line 707
; Line 710
; Line 712
	mov	ax,WORD PTR [bp-4]	;key
; Line 713
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

menu_activate	ENDP
; Line 717
entry_draw	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__aNchkstk
	push	si
;	x = -4
;	y = -6
;	hs = -20
;	e = -2
;	hsflg = 10
;	hiflg = 8
;	i = 6
;	m = 4
; Line 724
	mov	ax,WORD PTR [bp+6]	;i
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	shl	ax,1
	mov	bx,WORD PTR [bp+4]	;m
	add	ax,WORD PTR [bx+6]
	mov	WORD PTR [bp-2],ax	;e
; Line 725
	mov	ax,WORD PTR [bx]
	mov	WORD PTR [bp-4],ax	;x
; Line 726
	mov	ax,cx
	imul	WORD PTR $S793_MenuSpr2H
	add	ax,WORD PTR [bx+2]
	mov	WORD PTR [bp-6],ax	;y
; Line 728
	mov	bx,WORD PTR $S797_MenuRp
	mov	WORD PTR [bx+12],15
; Line 729
	call	FAR PTR _MouseHIDE
; Line 730
	mov	bx,WORD PTR [bp+8]	;hiflg
	shl	bx,1
	push	WORD PTR _MenuSpr2[bx]
	push	WORD PTR [bp-6]	;y
	push	WORD PTR [bp-4]	;x
	push	WORD PTR $S797_MenuRp
	call	FAR PTR _ShowSprite
	add	sp,8
; Line 731
	mov	bx,WORD PTR [bp-2]	;e
	mov	al,BYTE PTR [bx+6]
	cbw	
	mov	si,ax
	shl	si,1
	push	WORD PTR _MenuSpr3[si]
	push	WORD PTR [bp-6]	;y
	mov	ax,WORD PTR [bp-4]	;x
	add	ax,WORD PTR $S792_MenuSpr2W
	push	ax
	push	WORD PTR $S797_MenuRp
	call	FAR PTR _ShowSprite
	add	sp,8
; Line 732
	mov	bx,WORD PTR [bp-2]	;e
	push	WORD PTR [bx+4]
	mov	ax,WORD PTR [bx+2]
	add	ax,WORD PTR [bp-6]	;y
	push	ax
	mov	ax,WORD PTR [bx]
	add	ax,WORD PTR [bp-4]	;x
	push	ax
	push	WORD PTR $S797_MenuRp
	call	FAR PTR _RpPrint
	add	sp,8
; Line 733
	call	FAR PTR _MouseSHOW
; Line 735
	mov	bx,WORD PTR [bp-2]	;e
	cmp	BYTE PTR [bx+6],2
	jne	$I1042
	push	WORD PTR [bp+6]	;i
	sub	ax,ax
	push	ax
	call	WORD PTR [bx+8]
	add	sp,4
	or	ax,ax
	je	$I1042
; Line 736
	call	FAR PTR _MouseHIDE
; Line 737
	push	WORD PTR _MenuSpr3+6
	push	WORD PTR [bp-6]	;y
	mov	ax,WORD PTR [bp-4]	;x
	add	ax,WORD PTR $S792_MenuSpr2W
	push	ax
	push	WORD PTR $S797_MenuRp
	call	FAR PTR _ShowSprite
	add	sp,8
; Line 738
	call	FAR PTR _MouseSHOW
; Line 739
; Line 741
$I1042:
	cmp	WORD PTR [bp+10],0	;hsflg
	jne	$I1043
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 745
	nop	
$I1043:
; Line 746
	mov	ax,WORD PTR [bp-6]	;y
	mov	WORD PTR [bp-18],ax
; Line 747
	mov	cx,WORD PTR [bp-4]	;x
	mov	WORD PTR [bp-20],cx	;hs
	add	cx,WORD PTR $S794_MenuSpr3W
	add	cx,WORD PTR $S792_MenuSpr2W
	dec	cx
	mov	WORD PTR [bp-16],cx
; Line 748
	add	ax,WORD PTR $S793_MenuSpr2H
	dec	ax
	mov	WORD PTR [bp-14],ax
; Line 749
	mov	BYTE PTR [bp-12],1
; Line 750
	mov	ax,WORD PTR [bp+4]	;m
	mov	WORD PTR [bp-10],ax
; Line 751
	mov	ax,WORD PTR [bp+6]	;i
	mov	WORD PTR [bp-8],ax
; Line 753
	lea	ax,WORD PTR [bp-20]	;hs
	push	ax
	call	hs_push
	add	sp,2
; Line 755
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

entry_draw	ENDP
; Line 759
draw_dropshadow	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	m = 4
; Line 761
	call	FAR PTR _MouseHIDE
; Line 767
	sub	ax,ax
	push	ax
	mov	bx,WORD PTR [bp+4]	;m
	mov	ax,WORD PTR [bx+4]
	imul	WORD PTR $S793_MenuSpr2H
	push	ax
	mov	ax,WORD PTR $S793_MenuSpr2H
	add	ax,WORD PTR $S792_MenuSpr2W
	push	ax
	mov	ax,WORD PTR [bx+2]
	add	ax,3
	push	ax
	mov	ax,WORD PTR [bx]
	add	ax,3
	push	ax
	push	WORD PTR $S797_MenuRp
	call	FAR PTR _RectFill
	mov	sp,bp
; Line 769
	call	FAR PTR _MouseSHOW
; Line 770
	mov	sp,bp
	pop	bp
	ret	

draw_dropshadow	ENDP
; Line 774
	PUBLIC	_MouseSETUP
_MouseSETUP	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	MouseHotY = 8
;	MouseHotX = 6
;	MouseSeg = 4
; Line 775
	mov	ax,WORD PTR $S874_MOSspr
	cmp	WORD PTR [bp+4],ax	;MouseSeg
	jne	$I1050
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 777
$I1050:
; Line 778
	mov	ax,WORD PTR [bp+8]	;MouseHotY
	mov	WORD PTR $S876_MOShoty,ax
; Line 779
	mov	cx,WORD PTR [bp+4]	;MouseSeg
	mov	WORD PTR $S874_MOSspr,cx
; Line 781
	push	cx
	push	ax
	mov	ax,WORD PTR [bp+6]	;MouseHotX
	mov	WORD PTR $S875_MOShotx,ax
	push	ax
	call	FAR PTR _MouseTYPE
; Line 783
	mov	sp,bp
	pop	bp
	ret	
	nop	

_MouseSETUP	ENDP
; Line 790
hs_push	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	di
	push	si
;	next = -2
;	hs = 4
; Line 793
	mov	ax,WORD PTR $S799_hs_cb
	cmp	WORD PTR $S799_hs_cb+2,ax
	jne	$I1054
	sub	ax,ax
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 795
$I1054:
	mov	ax,WORD PTR $S799_hs_cb+2
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,cx
	shl	ax,1
	add	ax,WORD PTR $S799_hs_cb+6
	mov	WORD PTR [bp-2],ax	;next
; Line 796
	inc	WORD PTR $S799_hs_cb+2
; Line 798
	mov	ax,WORD PTR [bp+4]	;hs
	mov	si,ax
	push	ds
	pop	es
	mov	di,WORD PTR [bp-2]	;next
	mov	cx,7
	rep	movsw
; Line 799
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

hs_push	ENDP
; Line 803
hs_pop	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 804
	cmp	WORD PTR $S799_hs_cb+2,0
	je	$I1056
	dec	WORD PTR $S799_hs_cb+2
; Line 806
$I1056:
	mov	ax,WORD PTR $S799_hs_cb+4
	cmp	WORD PTR $S799_hs_cb+2,ax
	jne	$I1057
; Line 807
	mov	WORD PTR $S799_hs_cb+4,-1
; Line 808
$I1057:
	ret	

hs_pop	ENDP
; Line 812
hs_disable_all	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 815
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1061
$FC1062:
; Line 816
	push	ax
	call	hs_disable
	add	sp,2
	inc	WORD PTR [bp-2]	;i
$F1061:
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR $S799_hs_cb+2,ax
	jg	$FC1062
; Line 818
	mov	sp,bp
	pop	bp
	ret	
	nop	

hs_disable_all	ENDP
; Line 822
hs_disable	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	si
;	n = 4
; Line 824
	mov	ax,WORD PTR [bp+4]	;n
	cmp	WORD PTR $S799_hs_cb+2,ax
	jne	$I1066
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 826
	nop	
$I1066:
	mov	si,ax
	shl	si,1
	add	si,ax
	shl	si,1
	add	si,ax
	shl	si,1
	mov	bx,WORD PTR $S799_hs_cb+6
	and	BYTE PTR [bx+8][si],254
; Line 828
	mov	ax,WORD PTR [bp+4]	;n
	cmp	WORD PTR $S799_hs_cb+4,ax
	jne	$I1067
; Line 829
	mov	WORD PTR $S799_hs_cb+4,-1
; Line 831
$I1067:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

hs_disable	ENDP
; Line 835
hs_enable_all	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
; Line 838
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1071
$FC1072:
; Line 839
	push	ax
	call	hs_enable
	add	sp,2
	inc	WORD PTR [bp-2]	;i
$F1071:
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR $S799_hs_cb+2,ax
	jg	$FC1072
; Line 841
	mov	sp,bp
	pop	bp
	ret	
	nop	

hs_enable_all	ENDP
; Line 845
hs_enable	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
	push	si
;	n = 4
; Line 846
	mov	ax,WORD PTR $S799_hs_cb+2
	cmp	WORD PTR [bp+4],ax	;n
	jne	$I1076
	sub	ax,ax
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 847
$I1076:
	mov	si,WORD PTR [bp+4]	;n
	mov	ax,si
	shl	si,1
	add	si,ax
	shl	si,1
	add	si,ax
	shl	si,1
	mov	bx,WORD PTR $S799_hs_cb+6
	or	BYTE PTR [bx+8][si],1
; Line 848
	pop	si
	mov	sp,bp
	pop	bp
	ret	

hs_enable	ENDP
; Line 852
hs_setcur	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	i = -2
;	hs = -4
;	y = 6
;	x = 4
; Line 858
	mov	bx,WORD PTR $S799_hs_cb+4
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,WORD PTR $S799_hs_cb+6
	mov	ax,WORD PTR [bp+4]	;x
	cmp	WORD PTR [bx],ax
	jg	$I1082
	mov	cx,WORD PTR [bp+6]	;y
	cmp	WORD PTR [bx+2],cx
	jg	$I1082
	cmp	WORD PTR [bx+4],ax
	jl	$I1082
	cmp	WORD PTR [bx+6],cx
	jge	$done1083
; Line 860
$I1082:
	mov	ax,WORD PTR $S799_hs_cb+2
	dec	ax
	mov	WORD PTR [bp-2],ax	;i
	jmp	SHORT $F1084
; Line 869
; Line 870
	nop	
$FC1085:
	dec	WORD PTR [bp-2]	;i
$F1084:
	cmp	WORD PTR [bp-2],0	;i
	jl	$FB1086
; Line 864
	mov	bx,WORD PTR [bp-2]	;i
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,WORD PTR $S799_hs_cb+6
	mov	ax,WORD PTR [bp+4]	;x
	cmp	WORD PTR [bx],ax
	jg	$FC1085
	mov	cx,WORD PTR [bp+6]	;y
	cmp	WORD PTR [bx+2],cx
	jg	$FC1085
	cmp	WORD PTR [bx+4],ax
	jl	$FC1085
	cmp	WORD PTR [bx+6],cx
	jl	$FC1085
	test	BYTE PTR [bx+8],1
	je	$FC1085
; Line 866
	mov	ax,WORD PTR [bp-2]	;i
	mov	WORD PTR $S799_hs_cb+4,ax
; Line 867
	jmp	SHORT $done1083
	nop	
$FB1086:
; Line 872
	mov	WORD PTR $S799_hs_cb+4,-1
; Line 874
$done1083:
; Line 876
	mov	ax,WORD PTR $S799_hs_cb+4
; Line 877
	mov	sp,bp
	pop	bp
	ret	
	nop	

hs_setcur	ENDP
; Line 881
hs_find	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	i = -2
;	status = 8
;	entry = 6
;	menu = 4
; Line 884
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1093
; Line 890
$FC1094:
	inc	WORD PTR [bp-2]	;i
$F1093:
	mov	ax,WORD PTR $S799_hs_cb+2
	cmp	WORD PTR [bp-2],ax	;i
	jge	$FB1095
; Line 887
	mov	bx,WORD PTR [bp-2]	;i
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,ax
	shl	bx,1
	add	bx,WORD PTR $S799_hs_cb+6
	mov	al,BYTE PTR [bx+8]
	cbw	
	test	ax,WORD PTR [bp+8]	;status
	je	$FC1094
	mov	ax,WORD PTR [bp+4]	;menu
	cmp	WORD PTR [bx+10],ax
	jne	$FC1094
	mov	ax,WORD PTR [bp+6]	;entry
	cmp	WORD PTR [bx+12],ax
	jne	$FC1094
; Line 888
	mov	ax,WORD PTR [bp-2]	;i
	mov	sp,bp
	pop	bp
	ret	
$FB1095:
	mov	ax,-1
; Line 891
	mov	sp,bp
	pop	bp
	ret	
	nop	

hs_find	ENDP
; Line 895
hs_find_altkey	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
	push	si
;	i = -2
;	status = 6
;	key = 4
; Line 898
	mov	WORD PTR [bp-2],0	;i
	jmp	SHORT $F1101
; Line 902
	nop	
$FC1102:
	inc	WORD PTR [bp-2]	;i
$F1101:
	mov	ax,WORD PTR [bp-2]	;i
	cmp	WORD PTR $S799_hs_cb+2,ax
	jle	$FB1103
; Line 900
	mov	bx,ax
	mov	cx,ax
	shl	bx,1
	add	bx,cx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	add	bx,WORD PTR $S799_hs_cb+6
	mov	al,BYTE PTR [bx+8]
	cbw	
	test	ax,WORD PTR [bp+6]	;status
	je	$FC1102
	mov	si,WORD PTR [bx+10]
	mov	si,WORD PTR [si+6]
	mov	bx,WORD PTR [bx+12]
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR [bp+4]	;key
	cmp	WORD PTR [bx+10][si],ax
	jne	$FC1102
; Line 901
	mov	ax,cx
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	
$FB1103:
	mov	ax,-1
; Line 903
	pop	si
	mov	sp,bp
	pop	bp
	ret	

hs_find_altkey	ENDP
; Line 907
	PUBLIC	_pstrlen
_pstrlen	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	t = -4
;	fn = -2
;	n = -6
;	s = 6
;	rp = 4
; Line 908
	mov	ax,WORD PTR [bp+6]	;s
	mov	WORD PTR [bp-4],ax	;t
; Line 911
	mov	bx,WORD PTR [bp+4]	;rp
	mov	ax,WORD PTR [bx+16]
	mov	WORD PTR [bp-2],ax	;fn
; Line 912
	mov	WORD PTR [bp-6],0	;n
; Line 914
	jmp	SHORT $L20035
	nop	
$FC1112:
	inc	WORD PTR [bp-4]	;t
	mov	al,BYTE PTR [bx]
	push	ax
	push	WORD PTR [bp-2]	;fn
	call	FAR PTR _CharWidth
	add	sp,4
	add	WORD PTR [bp-6],ax	;n
$L20035:
	mov	bx,WORD PTR [bp-4]	;t
	cmp	BYTE PTR [bx],0
	jne	$FC1112
; Line 915
	mov	ax,6
	push	ax
	call	FAR PTR _LibCanDo
	add	sp,2
	or	ax,ax
	je	$I1114
	mov	cx,2
	mov	ax,WORD PTR [bp-6]	;n
	cwd	
	idiv	cx
	mov	WORD PTR [bp-6],ax	;n
; Line 917
$I1114:
	mov	ax,WORD PTR [bp-6]	;n
; Line 919
	mov	sp,bp
	pop	bp
	ret	
	nop	

_pstrlen	ENDP
; Line 923
exit_to_dos	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 924
	sub	ax,ax
	push	ax
	call	_EndGame
	add	sp,2
; Line 925
	mov	BYTE PTR _ExitCode,3
; Line 926
	ret	

exit_to_dos	ENDP
; Line 930
resume_game	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 931
	ret	

resume_game	ENDP
; Line 935
abort_mission	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 936
	sub	ax,ax
	push	ax
	call	_EndGame
	add	sp,2
; Line 937
	mov	BYTE PTR _ExitCode,1
; Line 938
	ret	

abort_mission	ENDP
; Line 942
end_mission	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 943
	mov	ax,20
	push	ax
	call	_EndGame
	add	sp,2
; Line 944
	ret	

end_mission	ENDP
; Line 948
set_sound	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	i = 6
;	tog = 4
; Line 949
	cmp	WORD PTR [bp+4],0	;tog
	je	$I1123
; Line 950
	mov	ax,WORD PTR [bp+6]	;i
	mov	WORD PTR _SndPriority,ax
; Line 951
	call	_UpdateJetSnd
; Line 952
; Line 953
$I1123:
	mov	ax,WORD PTR _SndPriority
	cmp	WORD PTR [bp+6],ax	;i
	jne	$L20002
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
$L20002:
	sub	ax,ax
; Line 954
	mov	sp,bp
	pop	bp
	ret	

set_sound	ENDP
; Line 958
ped_on	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	i = 6
;	tog = 4
; Line 959
	cmp	WORD PTR [bp+4],0	;tog
	je	$I1130
; Line 960
	cmp	WORD PTR _RudderStick,0
	je	$I1129
	cmp	WORD PTR _StickType,3
	je	$I1129
; Line 961
	mov	WORD PTR _RudderStick,0
; Line 962
	jmp	SHORT $I1130
$I1129:
; Line 963
	mov	WORD PTR _RudderStick,4
; Line 964
	call	joy_recal
; Line 965
$I1130:
; Line 967
; Line 968
	cmp	WORD PTR _RudderStick,0
	je	$L20004
	cmp	WORD PTR _StickType,3
	je	$L20004
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
$L20004:
	sub	ax,ax
; Line 969
	mov	sp,bp
	pop	bp
	ret	

ped_on	ENDP
; Line 973
joy_on	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	i = 6
;	tog = 4
; Line 974
	cmp	WORD PTR [bp+4],0	;tog
	je	$I1134
; Line 975
	cmp	WORD PTR [bp+6],0	;i
	je	$I1135
; Line 976
	cmp	WORD PTR _StickType,0
	jne	$I1139
	call	_RemoveKeyJoy
; Line 977
	jmp	SHORT $I1139
$I1135:
; Line 978
	cmp	WORD PTR _StickType,0
	je	$I1139
	call	_InstallKeyJoy
; Line 979
$I1139:
; Line 981
	push	WORD PTR [bp+6]	;i
	call	_SetJoysticks
	mov	sp,bp
; Line 983
	call	joy_recal
; Line 985
; Line 986
$I1134:
	mov	ax,WORD PTR [bp+6]	;i
	cmp	WORD PTR _StickType,ax
	jne	$L20006
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$L20006:
	sub	ax,ax
; Line 987
	mov	sp,bp
	pop	bp
	ret	

joy_on	ENDP
; Line 991
joy_recal2	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
;	i = -2
;	j = -4
; Line 994
	mov	ax,WORD PTR _RudderStick
	or	ax,WORD PTR _Joystick
	push	ax
	call	FAR PTR _InitJoy2
	add	sp,2
; Line 995
	mov	ax,1
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 997
	mov	ax,WORD PTR _RudderStick
	or	ax,WORD PTR _CoolyStick
	or	ax,WORD PTR _ThrustStick
	or	ax,WORD PTR _Joystick
	push	ax
	call	FAR PTR _ReadJoy2
	add	sp,2
; Line 998
	mov	ax,1
	push	ax
	call	_WaitTicks
	add	sp,2
; Line 1000
	mov	WORD PTR [bp-2],0	;i
$FC1147:
; Line 1003
	mov	bx,WORD PTR [bp-2]	;i
	shl	bx,1
	mov	ax,WORD PTR _CenterPosition[bx]
	mov	WORD PTR [bp-4],ax	;j
	cwd	
	sub	ax,dx
	sar	ax,1
	mov	cx,ax
	sub	ax,WORD PTR [bp-4]	;j
	neg	ax
	mov	WORD PTR _MinStick[bx],ax
; Line 1004
	mov	ax,cx
	add	cx,WORD PTR [bp-4]	;j
	mov	WORD PTR _MaxStick[bx],cx
; Line 1005
	mov	WORD PTR _LowRange[bx],ax
; Line 1006
	mov	WORD PTR _HighRange[bx],ax
; Line 1007
	inc	WORD PTR [bp-2]	;i
	cmp	WORD PTR [bp-2],2	;i
	jl	$FC1147
; Line 1008
	mov	sp,bp
	pop	bp
	ret	

joy_recal2	ENDP
; Line 1012
joy_recal	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 1013
	mov	ax,120
	push	ax
	mov	cx,153
	push	cx
	call	_JoyRecal
	add	sp,4
; Line 1014
	mov	ax,120
	push	ax
	mov	cx,153
	push	cx
	push	WORD PTR _Rp1
	mov	dx,73
	push	dx
	mov	dx,91
	push	dx
	push	ax
	push	cx
	push	WORD PTR _Rp2
	call	FAR PTR _RectCopy
	add	sp,16
; Line 1016
	ret	

joy_recal	ENDP
; Line 1020
set_kb_sens	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	i = 6
;	tog = 4
; Line 1021
	cmp	WORD PTR [bp+4],0	;tog
	je	$I1154
; Line 1022
	mov	bx,WORD PTR _KbSense
	shl	bx,1
	mov	WORD PTR $S877_kb_sens[bx],0
; Line 1023
	mov	ax,2
	sub	ax,WORD PTR [bp+6]	;i
	mov	WORD PTR _KbSense,ax
; Line 1024
	mov	bx,ax
	shl	bx,1
	mov	WORD PTR $S877_kb_sens[bx],1
; Line 1025
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1154:
	mov	bx,OFFSET DGROUP:$S877_kb_sens+4
	mov	ax,WORD PTR [bp+6]	;i
	shl	ax,1
	sub	bx,ax
	mov	ax,WORD PTR [bx]
; Line 1026
	mov	sp,bp
	pop	bp
	ret	

set_kb_sens	ENDP
; Line 1030
set_mtn_detail	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	i = 6
;	tog = 4
; Line 1031
	cmp	WORD PTR [bp+4],0	;tog
	je	$I1159
; Line 1032
	mov	ax,2
	sub	ax,WORD PTR [bp+6]	;i
	mov	WORD PTR _MTNDETAIL,ax
; Line 1033
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1159:
; Line 1034
	mov	ax,2
	sub	ax,WORD PTR _MTNDETAIL
	cmp	ax,WORD PTR [bp+6]	;i
	jne	$L20008
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$L20008:
	sub	ax,ax
; Line 1035
	mov	sp,bp
	pop	bp
	ret	

set_mtn_detail	ENDP
; Line 1039
set_plane_detail	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	i = 6
;	tog = 4
; Line 1040
	cmp	WORD PTR [bp+4],0	;tog
	je	$I1164
; Line 1041
	mov	ax,2
	sub	ax,WORD PTR [bp+6]	;i
	mov	WORD PTR _PLANEDETAIL,ax
; Line 1042
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1164:
; Line 1043
	mov	ax,2
	sub	ax,WORD PTR _PLANEDETAIL
	cmp	ax,WORD PTR [bp+6]	;i
	jne	$L20010
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$L20010:
	sub	ax,ax
; Line 1044
	mov	sp,bp
	pop	bp
	ret	

set_plane_detail	ENDP
; Line 1048
set_grnd_detail	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	i = 6
;	tog = 4
; Line 1049
	cmp	WORD PTR [bp+4],0	;tog
	je	$I1169
; Line 1050
	mov	ax,1
	sub	ax,WORD PTR [bp+6]	;i
	mov	WORD PTR _GRNDDETAIL,ax
; Line 1051
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1169:
; Line 1052
	mov	ax,1
	sub	ax,WORD PTR [bp+6]	;i
	cmp	ax,WORD PTR _GRNDDETAIL
	jne	$L20012
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$L20012:
	sub	ax,ax
; Line 1053
	mov	sp,bp
	pop	bp
	ret	

set_grnd_detail	ENDP
; Line 1057
set_obj_detail	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	i = 6
;	tog = 4
; Line 1058
	cmp	WORD PTR [bp+4],0	;tog
	je	$I1174
; Line 1059
	mov	ax,1
	sub	ax,WORD PTR [bp+6]	;i
	mov	WORD PTR _OBJECTDETAIL,ax
; Line 1060
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1174:
; Line 1061
	mov	ax,1
	sub	ax,WORD PTR _OBJECTDETAIL
	cmp	ax,WORD PTR [bp+6]	;i
	jne	$L20014
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$L20014:
	sub	ax,ax
; Line 1062
	mov	sp,bp
	pop	bp
	ret	

set_obj_detail	ENDP
; Line 1066
set_xplo_detail	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	i = 6
;	tog = 4
; Line 1067
	cmp	WORD PTR [bp+4],0	;tog
	je	$I1179
; Line 1068
	mov	ax,1
	sub	ax,WORD PTR [bp+6]	;i
	mov	WORD PTR _XPLODETAIL,ax
; Line 1069
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1179:
; Line 1070
	mov	ax,1
	sub	ax,WORD PTR _XPLODETAIL
	cmp	ax,WORD PTR [bp+6]	;i
	jne	$L20016
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$L20016:
	sub	ax,ax
; Line 1071
	mov	sp,bp
	pop	bp
	ret	

set_xplo_detail	ENDP
; Line 1075
set_conditions	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	i = 6
;	tog = 4
; Line 1076
	cmp	WORD PTR [bp+4],0	;tog
	je	$I1184
; Line 1077
	mov	ax,1
	sub	ax,WORD PTR [bp+6]	;i
	mov	WORD PTR _SKYDETAIL,ax
; Line 1078
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1184:
; Line 1079
	mov	ax,1
	sub	ax,WORD PTR [bp+6]	;i
	cmp	ax,WORD PTR _SKYDETAIL
	jne	$L20018
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$L20018:
	sub	ax,ax
; Line 1080
	mov	sp,bp
	pop	bp
	ret	

set_conditions	ENDP
; Line 1084
set_rollrate	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	i = 6
;	tog = 4
; Line 1085
	cmp	WORD PTR [bp+4],0	;tog
	je	$I1189
; Line 1086
	mov	ax,WORD PTR [bp+6]	;i
	mov	WORD PTR _FASTROLL,ax
; Line 1087
	mov	sp,bp
	pop	bp
	ret	
$I1189:
; Line 1088
	mov	ax,WORD PTR _FASTROLL
	cmp	WORD PTR [bp+6],ax	;i
	jne	$L20020
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
	nop	
$L20020:
	sub	ax,ax
; Line 1089
	mov	sp,bp
	pop	bp
	ret	

set_rollrate	ENDP
_TEXT	ENDS
END
