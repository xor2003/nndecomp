;	Static Name Aliases
;
;	$S1489_StrobeLight	EQU	StrobeLight
;	$S1490_tempflag	EQU	tempflag
	TITLE   C:\CARR.C
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
PUBLIC  _Coursestr
PUBLIC  _Slopestr
PUBLIC  _Rangestr
PUBLIC  _Decentstr
PUBLIC  _lastlso
PUBLIC  _lsomsgptrs
PUBLIC  _HorzHeave
PUBLIC  _Heaving
PUBLIC  _HeavAngle
PUBLIC  _HeaveDir
PUBLIC  _CATVEL
PUBLIC  _TimeOnHook
PUBLIC  _WavedOff
PUBLIC  _BallCalled
PUBLIC  _LSOMSGTIME
PUBLIC  _debugstr
PUBLIC  _CarrierScale
PUBLIC  _CARRIERSCALEKLUDGE
PUBLIC  _landpt
PUBLIC  _PlaneScale
PUBLIC  _LandPat
PUBLIC  _StormLevel
PUBLIC  _NiteLandPat
PUBLIC  _WireCaught
PUBLIC  _PreparePlaneWings
EXTRN	_Dist2D:NEAR
EXTRN	_MakeMatHPR:NEAR
EXTRN	_strcpy:NEAR
EXTRN	_ARCTAN:NEAR
EXTRN	_Trans3x3:NEAR
EXTRN	_DrawLine:FAR
EXTRN	_Rotate:NEAR
EXTRN	_strcat:NEAR
EXTRN	_InitScottFlight:NEAR
EXTRN	_ASinB:NEAR
EXTRN	_Message:NEAR
EXTRN	_PreparePlane:NEAR
EXTRN	_ReadyLaunch:NEAR
EXTRN	_sprintf:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	__aNlmul:NEAR
EXTRN	_PlaneLaunched:NEAR
EXTRN	_GetNextLaunch:NEAR
EXTRN	_Stack3DObject:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_LogIt:NEAR
EXTRN	_rng2:NEAR
EXTRN	_Shift3X3:NEAR
EXTRN	_abs:NEAR
EXTRN	_InvertMatrix:NEAR
EXTRN	_labs:NEAR
EXTRN	_EndGame:NEAR
EXTRN	_MulDiv:NEAR
EXTRN	_NDraw3DObject:NEAR
EXTRN	_Dist3D:NEAR
EXTRN	_Speech:NEAR
EXTRN	_Get1GTrim:NEAR
EXTRN	_ConfigData:BYTE
EXTRN	_Night:WORD
EXTRN	_ejected:WORD
EXTRN	_Gtime:WORD
EXTRN	_MissionWeather:WORD
EXTRN	_OurRoll:WORD
EXTRN	_OurPitch:WORD
EXTRN	_OurHead:WORD
EXTRN	_Alt:WORD
EXTRN	_OurAlt:WORD
EXTRN	_RadarAlt:DWORD
EXTRN	_MinAlt:WORD
EXTRN	_View:WORD
EXTRN	_ViewX:DWORD
EXTRN	_ViewY:DWORD
EXTRN	_ViewZ:WORD
EXTRN	_PxLng:DWORD
EXTRN	_PyLng:DWORD
EXTRN	_Knots:WORD
EXTRN	_AirSpeed:WORD
EXTRN	_THRUST:WORD
EXTRN	_ps:BYTE
EXTRN	_ThrustI:WORD
EXTRN	_O:BYTE
EXTRN	_whichourcarr:WORD
EXTRN	_Fticks:WORD
EXTRN	_bv:BYTE
EXTRN	_LightsOn:WORD
EXTRN	_ailoc:BYTE
_BSS      SEGMENT
COMM NEAR	_LandingAngle:	BYTE:	 2
_BSS      ENDS
EXTRN	_DEBUG1:WORD
_BSS      SEGMENT
COMM NEAR	_bogusx:	BYTE:	 2
COMM NEAR	_LandingVel:	BYTE:	 2
_BSS      ENDS
EXTRN	_ONTHECAT:WORD
_BSS      SEGMENT
COMM NEAR	_bogusy:	BYTE:	 2
_BSS      ENDS
EXTRN	_ONTHEHOOK:WORD
EXTRN	_Scale3d:WORD
_BSS      SEGMENT
COMM NEAR	_bogusz:	BYTE:	 2
_BSS      ENDS
EXTRN	_PlayerCat:WORD
EXTRN	_AnimVals:BYTE
_BSS      SEGMENT
COMM NEAR	_XSpot:	BYTE:	 4
COMM NEAR	_lodetailcqr:	BYTE:	 2
_BSS      ENDS
EXTRN	_HookRot:WORD
_BSS      SEGMENT
COMM NEAR	_ZSpot:	BYTE:	 4
_BSS      ENDS
EXTRN	_FPARAMS:BYTE
_BSS      SEGMENT
COMM NEAR	_CarrierAnimVals:	 2:	 48
_BSS      ENDS
EXTRN	_carrmoveok:WORD
EXTRN	_RUDDERVALS:WORD
_BSS      SEGMENT
COMM NEAR	_MeatBall:	BYTE:	 2
COMM NEAR	_WaveHeight:	BYTE:	 2
_BSS      ENDS
EXTRN	_landingstatus:WORD
_BSS      SEGMENT
COMM NEAR	_WaveSpeed:	BYTE:	 2
COMM FAR	_carrier:	BYTE:	 208
_BSS      ENDS
EXTRN	_BlastShield:BYTE
EXTRN	_CatReady:BYTE
_BSS      SEGMENT
COMM NEAR	_ntmp:	 1:	 10
COMM NEAR	_BelowDeck:	BYTE:	 2
_BSS      ENDS
EXTRN	_TRIM:WORD
EXTRN	_Damaged:WORD
EXTRN	_DirectLiftControl:WORD
EXTRN	_Status:WORD
EXTRN	_HookDown:WORD
_DATA      SEGMENT
	ORG	$+12
$SG1362	DB	'No Cats Available',  00H
	ORG	$+22
$SG1692	DB	'Landing gear lowered',  00H
$SG1697	DB	'Landing gear raised',  00H
$SG1706	DB	'Hook Lowered',  00H
$SG1708	DB	'Hook Raised',  00H
	ORG	$+746
$SG1735	DB	00H
$SG1736	DB	'COME RIGHT',  00H
$SG1737	DB	'COME LEFT',  00H
$SG1738	DB	'REDUCE POWER',  00H
$SG1739	DB	'ADD POWER',  00H
$SG1740	DB	'YOU''RE FAST',  00H
$SG1741	DB	'YOU''RE SLOW',  00H
$SG1742	DB	'DROP YOUR GEAR',  00H
$SG1743	DB	'DROP YOUR FLAPS',  00H
$SG1744	DB	'DROP YOUR HOOK',  00H
$SG1745	DB	'LEFT THE PATTERN-SEE YA',  00H
$SG1792	DB	'CALL THE BALL',  00H
$SG1797	DB	'WAVEOFF',  00H
$SG1816	DB	'ON CENTERLINE',  00H
$SG1818	DB	'ON GLIDESLOPE',  00H
$SG1822	DB	'%i FT OUT',  00H
$SG1824	DB	'COME LEFT %i FT',  00H
$SG1826	DB	'COME RIGHT %i FT',  00H
$SG1828	DB	'%i FT TOO HIGH',  00H
$SG1830	DB	'%i FT TOO LOW',  00H
$SG1831	DB	'DESCENT %i',  00H
	ORG	$-1136
_CarrierScale	DW	04H
_CARRIERSCALEKLUDGE	DW	00H
_PlaneScale	DW	028H
_StormLevel	DW	00H
_WireCaught	DW	00H
_PreparePlaneWings	DW	00H
	ORG	$+18
$S1489_StrobeLight	DW	00H
$S1490_tempflag	DW	00H
_HorzHeave	DW	00H
_Heaving	DW	00H
_HeavAngle	DW	00H
_HeaveDir	DW	01H
_CATVEL	DW	00H
_TimeOnHook	DW	00H
_WavedOff	DW	00H
_BallCalled	DW	00H
_LSOMSGTIME	DW	00H
	ORG	$+66
_debugstr	DB	00H
 	DB	119 DUP(0)

_landpt	DW	014H
_LandPat	DW	01aH
	DW	06eH
	DW	060H
	DW	071cH
	DW	0fddeH
	DW	00H
	DW	087H
	DW	028H
	DW	01H
	DW	01H
	DW	01H
	DW	064H
	DW	0d6H
	DW	0450H
	DW	0162H
	DW	060bH
	DW	0fe0bH
	DW	00H
	DW	087H
	DW	032H
	DW	01H
	DW	01H
	DW	01H
	DW	064H
	DW	0ff90H
	DW	072dH
	DW	0190H
	DW	0f1c8H
	DW	00H
	DW	0e38H
	DW	08cH
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	0fe89H
	DW	09e9H
	DW	0190H
	DW	0e390H
	DW	00H
	DW	011c6H
	DW	096H
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	0fd12H
	DW	0a0fH
	DW	01c2H
	DW	0c004H
	DW	00H
	DW	011c6H
	DW	096H
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	0fb76H
	DW	09e9H
	DW	01c2H
	DW	0b8e8H
	DW	00H
	DW	011c6H
	DW	096H
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	0f9f2H
	DW	0915H
	DW	01f4H
	DW	0a006H
	DW	00H
	DW	011c6H
	DW	0aaH
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	0f8d3H
	DW	072dH
	DW	0226H
	DW	0955cH
	DW	00H
	DW	011c6H
	DW	0beH
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	0f888H
	DW	0601H
	DW	0258H
	DW	08ab2H
	DW	00H
	DW	00H
	DW	0c8H
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	0f888H
	DW	0465H
	DW	0258H
	DW	08008H
	DW	00H
	DW	00H
	DW	0dcH
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	0f888H
	DW	02c8H
	DW	0258H
	DW	08008H
	DW	00H
	DW	00H
	DW	0faH
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	0f888H
	DW	096H
	DW	0258H
	DW	08008H
	DW	00H
	DW	00H
	DW	0104H
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	0f888H
	DW	0ff90H
	DW	0258H
	DW	08008H
	DW	00H
	DW	00H
	DW	0118H
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	0f905H
	DW	0fdc1H
	DW	028aH
	DW	071d0H
	DW	00H
	DW	01554H
	DW	012cH
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	0fa24H
	DW	0fc57H
	DW	028aH
	DW	06398H
	DW	00H
	DW	01554H
	DW	0145H
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	0fbb4H
	DW	0fbb4H
	DW	02bcH
	DW	05560H
	DW	00H
	DW	01554H
	DW	015eH
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	0fd8fH
	DW	0fb76H
	DW	02bcH
	DW	0400cH
	DW	00H
	DW	01c70H
	DW	0177H
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	0ff06H
	DW	0fbc1H
	DW	0320H
	DW	02ab8H
	DW	00H
	DW	01ffeH
	DW	0177H
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	019H
	DW	0fd38H
	DW	0320H
	DW	018f2H
	DW	00H
	DW	01ffeH
	DW	0190H
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	07dH
	DW	0ff38H
	DW	0320H
	DW	00H
	DW	00H
	DW	01ffeH
	DW	0190H
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
	DW	07dH
	DW	00H
	DW	0320H
	DW	00H
	DW	00H
	DW	00H
	DW	0190H
	DW	032H
	DW	00H
	DW	00H
	DW	01H
	DW	040H
_NiteLandPat	DW	01aH
	DW	06eH
	DW	060H
	DW	071cH
	DW	0fddeH
	DW	00H
	DW	087H
	DW	028H
	DW	01H
	DW	01H
	DW	01H
	DW	064H
	DW	078H
	DW	025fH
	DW	0e1H
	DW	071cH
	DW	0fe0bH
	DW	00H
	DW	087H
	DW	032H
	DW	01H
	DW	01H
	DW	01H
	DW	064H
	DW	0a7H
	DW	0357H
	DW	0122H
	DW	071cH
	DW	0fe0bH
	DW	00H
	DW	087H
	DW	032H
	DW	01H
	DW	01H
	DW	01H
	DW	064H
	DW	0d6H
	DW	0450H
	DW	0162H
	DW	071cH
	DW	0fe0bH
	DW	00H
	DW	087H
	DW	032H
	DW	01H
	DW	01H
	DW	01H
	DW	064H
	DW	0208H
	DW	08a0H
	DW	02c4H
	DW	071cH
	DW	0fe0bH
	DW	00H
	DW	08cH
	DW	032H
	DW	01H
	DW	00H
	DW	01H
	DW	040H
	ORG	$+272
_Coursestr	DB	00H
 	DB	29 DUP(0)

_Slopestr	DB	00H
 	DB	29 DUP(0)

_Rangestr	DB	00H
 	DB	29 DUP(0)

_Decentstr	DB	00H
 	DB	39 DUP(0)

_lastlso	DW	00H
_lsomsgptrs	DW	DGROUP:$SG1735
	DW	DGROUP:$SG1736
	DW	DGROUP:$SG1737
	DW	DGROUP:$SG1738
	DW	DGROUP:$SG1739
	DW	DGROUP:$SG1740
	DW	DGROUP:$SG1741
	DW	DGROUP:$SG1742
	DW	DGROUP:$SG1743
	DW	DGROUP:$SG1744
	DW	DGROUP:$SG1745
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
; Line 12
; Line 13
; Line 14
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
; Line 25
; Line 101
_TEXT      ENDS
CONST      SEGMENT
$T20002	DW SEG _carrier 
CONST      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
	PUBLIC	_InitCarrier
_InitCarrier	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,268
	call	__aNchkstk
	push	si
;	i = -152
;	CAT0X = -36
;	CAT0Z = -84
;	CAT1X = -60
;	CAT1Z = -102
;	CAT2X = -78
;	CAT2Z = -114
;	CAT3X = -96
;	CAT3Z = -126
;	WIR0X1 = -160
;	WIR0Z1 = -196
;	WIR0X2 = -172
;	WIR0Z2 = -232
;	WIR0CX = -190
;	WIR0CZ = -268
;	WIR1X1 = -166
;	WIR1Z1 = -226
;	WIR1X2 = -184
;	WIR1Z2 = -262
;	WIR1CX = -220
;	WIR1CZ = -30
;	WIR2X1 = -178
;	WIR2Z1 = -256
;	WIR2X2 = -214
;	WIR2Z2 = -24
;	WIR2CX = -250
;	WIR2CZ = -54
;	WIR3X1 = -208
;	WIR3Z1 = -18
;	WIR3X2 = -244
;	WIR3Z2 = -48
;	WIR3CX = -12
;	WIR3CZ = -72
;	CBX1 = -202
;	CBX2 = -238
;	CBZ1 = -6
;	CBZ2 = -42
;	WBX1 = -66
;	WBX2 = -90
;	WBZ1 = -108
;	WBZ2 = -120
;	TWRX1 = -132
;	TWRZ1 = -144
;	TWRX2 = -138
;	TWRZ2 = -150
;	whichcarr = -154
; Line 103
	mov	WORD PTR [bp-36],-108	;CAT0X
	mov	WORD PTR [bp-34],-102
	mov	WORD PTR [bp-32],-107
; Line 104
	mov	WORD PTR [bp-84],170	;CAT0Z
	mov	WORD PTR [bp-82],190
	mov	WORD PTR [bp-80],184
; Line 105
	mov	WORD PTR [bp-60],-66	;CAT1X
	mov	WORD PTR [bp-56],-60
; Line 106
	mov	WORD PTR [bp-102],130	;CAT1Z
	mov	WORD PTR [bp-100],124
	mov	WORD PTR [bp-98],146
; Line 107
	mov	WORD PTR [bp-76],-20
	mov	WORD PTR [bp-74],-42
; Line 108
	mov	WORD PTR [bp-114],-214	;CAT2Z
	mov	WORD PTR [bp-112],-168
; Line 109
	mov	ax,55
	mov	WORD PTR [bp-96],ax	;CAT3X
	mov	WORD PTR [bp-94],ax
; Line 110
	mov	WORD PTR [bp-126],-216	;CAT3Z
	mov	WORD PTR [bp-124],-185
	mov	ax,-187
	mov	WORD PTR [bp-110],ax
	mov	WORD PTR [bp-122],ax
; Line 112
	mov	WORD PTR [bp-160],-61	;WIR0X1
	mov	WORD PTR [bp-158],-51
	mov	WORD PTR [bp-156],-53
; Line 113
	mov	WORD PTR [bp-196],348	;WIR0Z1
	mov	WORD PTR [bp-194],368
	mov	WORD PTR [bp-192],340
; Line 115
	mov	WORD PTR [bp-232],324	;WIR0Z2
	mov	WORD PTR [bp-230],356
	mov	WORD PTR [bp-228],330
; Line 116
	mov	WORD PTR [bp-190],-1	;WIR0CX
	mov	WORD PTR [bp-186],-11
; Line 117
	mov	WORD PTR [bp-268],336	;WIR0CZ
	mov	WORD PTR [bp-266],362
	mov	WORD PTR [bp-264],334
; Line 118
	mov	WORD PTR [bp-164],-57
	mov	WORD PTR [bp-162],-62
; Line 119
	mov	WORD PTR [bp-226],308	;WIR1Z1
	mov	WORD PTR [bp-224],326
	mov	WORD PTR [bp-222],298
; Line 120
	mov	WORD PTR [bp-184],51	;WIR1X2
	mov	WORD PTR [bp-182],27
	mov	WORD PTR [bp-180],24
; Line 121
	mov	WORD PTR [bp-260],314
	mov	WORD PTR [bp-258],288
; Line 122
	mov	ax,-9
	mov	WORD PTR [bp-188],ax
	mov	WORD PTR [bp-220],ax	;WIR1CX
	mov	WORD PTR [bp-218],-15
	mov	ax,-18
	mov	WORD PTR [bp-78],ax	;CAT2X
	mov	WORD PTR [bp-216],ax
; Line 123
	mov	WORD PTR [bp-30],296	;WIR1CZ
	mov	WORD PTR [bp-28],320
	mov	WORD PTR [bp-26],292
; Line 124
	mov	WORD PTR [bp-178],-77	;WIR2X1
	mov	ax,-63
	mov	WORD PTR [bp-58],ax
	mov	WORD PTR [bp-176],ax
	mov	WORD PTR [bp-174],-67
; Line 125
	mov	WORD PTR [bp-256],268	;WIR2Z1
	mov	ax,284
	mov	WORD PTR [bp-262],ax	;WIR1Z2
	mov	WORD PTR [bp-254],ax
; Line 126
	mov	ax,43
	mov	WORD PTR [bp-92],ax
	mov	WORD PTR [bp-214],ax	;WIR2X2
	mov	WORD PTR [bp-212],21
	mov	WORD PTR [bp-210],17
; Line 127
	mov	WORD PTR [bp-24],244	;WIR2Z2
	mov	WORD PTR [bp-22],272
	mov	WORD PTR [bp-20],246
; Line 128
	mov	WORD PTR [bp-250],-17	;WIR2CX
	mov	WORD PTR [bp-248],-21
; Line 129
	mov	ax,256
	mov	WORD PTR [bp-252],ax
	mov	WORD PTR [bp-54],ax	;WIR2CZ
	mov	WORD PTR [bp-52],278
; Line 131
	mov	WORD PTR [bp-16],242
	mov	WORD PTR [bp-14],214
; Line 132
	mov	WORD PTR [bp-244],35	;WIR3X2
	mov	WORD PTR [bp-242],15
	mov	WORD PTR [bp-240],10
; Line 133
	mov	WORD PTR [bp-48],199	;WIR3Z2
; Line 134
	mov	ax,-25
	mov	WORD PTR [bp-246],ax
	mov	WORD PTR [bp-12],ax	;WIR3CX
	mov	WORD PTR [bp-10],-27
	mov	WORD PTR [bp-8],-32
; Line 135
	mov	WORD PTR [bp-72],211	;WIR3CZ
	mov	WORD PTR [bp-70],236
	mov	WORD PTR [bp-68],208
; Line 137
	mov	WORD PTR [bp-202],-145	;CBX1
	mov	WORD PTR [bp-200],-130
	mov	WORD PTR [bp-198],-134
; Line 138
	mov	WORD PTR [bp-236],114
	mov	WORD PTR [bp-234],116
; Line 139
	mov	WORD PTR [bp-6],-520	;CBZ1
	mov	WORD PTR [bp-4],-524
	mov	WORD PTR [bp-2],-498
; Line 140
	mov	WORD PTR [bp-42],545	;CBZ2
	mov	WORD PTR [bp-40],564
	mov	WORD PTR [bp-38],575
; Line 142
	mov	ax,-85
	mov	WORD PTR [bp-208],ax	;WIR3X1
	mov	WORD PTR [bp-66],ax	;WBX1
	mov	ax,-69
	mov	WORD PTR [bp-166],ax	;WIR1X1
	mov	WORD PTR [bp-206],ax
	mov	WORD PTR [bp-64],ax
	mov	ax,-74
	mov	WORD PTR [bp-204],ax
	mov	WORD PTR [bp-62],ax
; Line 143
	mov	ax,59
	mov	WORD PTR [bp-172],ax	;WIR0X2
	mov	WORD PTR [bp-90],ax	;WBX2
	mov	ax,33
	mov	WORD PTR [bp-170],ax
	mov	WORD PTR [bp-88],ax
	mov	ax,31
	mov	WORD PTR [bp-168],ax
	mov	WORD PTR [bp-86],ax
; Line 144
	mov	ax,223
	mov	WORD PTR [bp-18],ax	;WIR3Z1
	mov	WORD PTR [bp-108],ax	;WBZ1
	mov	ax,204
	mov	WORD PTR [bp-44],ax
	mov	WORD PTR [bp-104],ax
; Line 145
	mov	WORD PTR [bp-120],348	;WBZ2
	mov	WORD PTR [bp-118],368
	mov	WORD PTR [bp-116],340
; Line 147
	mov	WORD PTR [bp-132],95	;TWRX1
	mov	WORD PTR [bp-130],90
	mov	WORD PTR [bp-128],76
; Line 148
	mov	WORD PTR [bp-144],84	;TWRZ1
	mov	WORD PTR [bp-142],135
	mov	WORD PTR [bp-140],-30
; Line 149
	mov	ax,120
	mov	WORD PTR [bp-238],ax	;CBX2
	mov	WORD PTR [bp-138],ax	;TWRX2
	mov	WORD PTR [bp-136],110
	mov	WORD PTR [bp-134],101
; Line 150
	mov	ax,230
	mov	WORD PTR [bp-46],ax
	mov	WORD PTR [bp-106],ax
	mov	WORD PTR [bp-150],ax	;TWRZ2
	mov	ax,250
	mov	WORD PTR [bp-50],ax
	mov	WORD PTR [bp-148],ax
	mov	WORD PTR [bp-146],80
; Line 154
	cmp	WORD PTR _whichourcarr,0
	jl	$I1329
; Line 155
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,40
	imul	WORD PTR _whichourcarr
	mov	bx,ax
	push	WORD PTR _ps[bx+10]
	push	WORD PTR _ps[bx+8]
	mov	si,bx
	call	__aNlmul
	mov	es,WORD PTR $T20002
	mov	WORD PTR es:_carrier,ax
	mov	WORD PTR es:_carrier+2,dx
; Line 156
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _ps[si+14]
	push	WORD PTR _ps[si+12]
	call	__aNlmul
	mov	es,WORD PTR $T20002
	mov	WORD PTR es:_carrier+8,ax
	mov	WORD PTR es:_carrier+10,dx
; Line 157
; Line 158
	jmp	SHORT $I1330
$I1329:
; Line 159
	mov	es,WORD PTR $T20002
	mov	WORD PTR es:_carrier,-6956
	mov	WORD PTR es:_carrier+2,1395
; Line 160
	mov	WORD PTR es:_carrier+8,-11296
	mov	WORD PTR es:_carrier+10,1135
; Line 161
$I1330:
; Line 163
	sub	ax,ax
	mov	WORD PTR es:_carrier+6,ax
	mov	WORD PTR es:_carrier+4,ax
; Line 164
	mov	WORD PTR es:_carrier+18,-2016
; Line 165
	mov	WORD PTR es:_carrier+12,ax
; Line 166
	mov	WORD PTR es:_carrier+20,6600
	mov	WORD PTR es:_carrier+22,ax
; Line 168
	mov	WORD PTR es:_carrier+14,ax
	mov	WORD PTR es:_carrier+16,ax
; Line 170
	mov	ax,WORD PTR _ConfigData+22
	mov	WORD PTR [bp-154],ax	;whichcarr
; Line 171
	cmp	ax,2
	jg	$I1332
	or	ax,ax
	jge	$I1331
$I1332:
; Line 172
	mov	WORD PTR [bp-154],0	;whichcarr
; Line 174
$I1331:
	mov	si,WORD PTR [bp-154]	;whichcarr
	shl	si,1
	mov	ax,25
	imul	WORD PTR [bp-36][si]
	mov	WORD PTR es:_carrier+24,ax
	mov	WORD PTR es:_carrier+26,dx
; Line 175
	mov	ax,25
	imul	WORD PTR [bp-84][si]
	mov	WORD PTR es:_carrier+28,ax
	mov	WORD PTR es:_carrier+30,dx
; Line 178
	mov	ax,25
	imul	WORD PTR [bp-60][si]
	mov	WORD PTR es:_carrier+34,ax
	mov	WORD PTR es:_carrier+36,dx
; Line 179
	mov	ax,25
	imul	WORD PTR [bp-102][si]
	mov	WORD PTR es:_carrier+38,ax
	mov	WORD PTR es:_carrier+40,dx
; Line 180
	mov	WORD PTR es:_carrier+42,-1024
; Line 182
	mov	ax,25
	imul	WORD PTR [bp-78][si]
	mov	WORD PTR es:_carrier+44,ax
	mov	WORD PTR es:_carrier+46,dx
; Line 183
	mov	ax,25
	imul	WORD PTR [bp-114][si]
	mov	WORD PTR es:_carrier+48,ax
	mov	WORD PTR es:_carrier+50,dx
; Line 184
	sub	ax,ax
	mov	WORD PTR es:_carrier+32,ax
	mov	WORD PTR es:_carrier+52,ax
; Line 186
	mov	ax,25
	imul	WORD PTR [bp-96][si]
	mov	WORD PTR es:_carrier+54,ax
	mov	WORD PTR es:_carrier+56,dx
; Line 187
	mov	ax,25
	imul	WORD PTR [bp-126][si]
	mov	WORD PTR es:_carrier+58,ax
	mov	WORD PTR es:_carrier+60,dx
; Line 188
	mov	WORD PTR es:_carrier+62,-640
; Line 190
	mov	ax,25
	imul	WORD PTR [bp-160][si]
	mov	WORD PTR es:_carrier+64,ax
	mov	WORD PTR es:_carrier+66,dx
; Line 191
	mov	ax,25
	imul	WORD PTR [bp-196][si]
	mov	WORD PTR es:_carrier+68,ax
	mov	WORD PTR es:_carrier+70,dx
; Line 192
	mov	ax,25
	imul	WORD PTR [bp-172][si]
	mov	WORD PTR es:_carrier+72,ax
	mov	WORD PTR es:_carrier+74,dx
; Line 193
	mov	ax,25
	imul	WORD PTR [bp-232][si]
	mov	WORD PTR es:_carrier+76,ax
	mov	WORD PTR es:_carrier+78,dx
; Line 194
	mov	ax,25
	imul	WORD PTR [bp-190][si]
	mov	WORD PTR es:_carrier+80,ax
	mov	WORD PTR es:_carrier+82,dx
; Line 195
	mov	ax,25
	imul	WORD PTR [bp-268][si]
	mov	WORD PTR es:_carrier+84,ax
	mov	WORD PTR es:_carrier+86,dx
; Line 197
	mov	ax,25
	imul	WORD PTR [bp-166][si]
	mov	WORD PTR es:_carrier+88,ax
	mov	WORD PTR es:_carrier+90,dx
; Line 198
	mov	ax,25
	imul	WORD PTR [bp-226][si]
	mov	WORD PTR es:_carrier+92,ax
	mov	WORD PTR es:_carrier+94,dx
; Line 199
	mov	ax,25
	imul	WORD PTR [bp-184][si]
	mov	WORD PTR es:_carrier+96,ax
	mov	WORD PTR es:_carrier+98,dx
; Line 200
	mov	ax,25
	imul	WORD PTR [bp-262][si]
	mov	WORD PTR es:_carrier+100,ax
	mov	WORD PTR es:_carrier+102,dx
; Line 201
	mov	ax,25
	imul	WORD PTR [bp-220][si]
	mov	WORD PTR es:_carrier+104,ax
	mov	WORD PTR es:_carrier+106,dx
; Line 202
	mov	ax,25
	imul	WORD PTR [bp-30][si]
	mov	WORD PTR es:_carrier+108,ax
	mov	WORD PTR es:_carrier+110,dx
; Line 204
	mov	ax,25
	imul	WORD PTR [bp-178][si]
	mov	WORD PTR es:_carrier+112,ax
	mov	WORD PTR es:_carrier+114,dx
; Line 205
	mov	ax,25
	imul	WORD PTR [bp-256][si]
	mov	WORD PTR es:_carrier+116,ax
	mov	WORD PTR es:_carrier+118,dx
; Line 206
	mov	ax,25
	imul	WORD PTR [bp-214][si]
	mov	WORD PTR es:_carrier+120,ax
	mov	WORD PTR es:_carrier+122,dx
; Line 207
	mov	ax,25
	imul	WORD PTR [bp-24][si]
	mov	WORD PTR es:_carrier+124,ax
	mov	WORD PTR es:_carrier+126,dx
; Line 208
	mov	ax,25
	imul	WORD PTR [bp-250][si]
	mov	WORD PTR es:_carrier+128,ax
	mov	WORD PTR es:_carrier+130,dx
; Line 209
	mov	ax,25
	imul	WORD PTR [bp-54][si]
	mov	WORD PTR es:_carrier+132,ax
	mov	WORD PTR es:_carrier+134,dx
; Line 211
	mov	ax,25
	imul	WORD PTR [bp-208][si]
	mov	WORD PTR es:_carrier+136,ax
	mov	WORD PTR es:_carrier+138,dx
; Line 212
	mov	ax,25
	imul	WORD PTR [bp-18][si]
	mov	WORD PTR es:_carrier+140,ax
	mov	WORD PTR es:_carrier+142,dx
; Line 213
	mov	ax,25
	imul	WORD PTR [bp-244][si]
	mov	WORD PTR es:_carrier+144,ax
	mov	WORD PTR es:_carrier+146,dx
; Line 214
	mov	ax,25
	imul	WORD PTR [bp-48][si]
	mov	WORD PTR es:_carrier+148,ax
	mov	WORD PTR es:_carrier+150,dx
; Line 215
	mov	ax,25
	imul	WORD PTR [bp-12][si]
	mov	WORD PTR es:_carrier+152,ax
	mov	WORD PTR es:_carrier+154,dx
; Line 216
	mov	ax,25
	imul	WORD PTR [bp-72][si]
	mov	WORD PTR es:_carrier+156,ax
	mov	WORD PTR es:_carrier+158,dx
; Line 218
	mov	ax,25
	imul	WORD PTR [bp-202][si]
	mov	WORD PTR es:_carrier+160,ax
	mov	WORD PTR es:_carrier+162,dx
; Line 219
	mov	ax,25
	imul	WORD PTR [bp-238][si]
	mov	WORD PTR es:_carrier+168,ax
	mov	WORD PTR es:_carrier+170,dx
; Line 220
	mov	ax,25
	imul	WORD PTR [bp-6][si]
	mov	WORD PTR es:_carrier+164,ax
	mov	WORD PTR es:_carrier+166,dx
; Line 221
	mov	ax,25
	imul	WORD PTR [bp-42][si]
	mov	WORD PTR es:_carrier+172,ax
	mov	WORD PTR es:_carrier+174,dx
; Line 223
	mov	ax,25
	imul	WORD PTR [bp-66][si]
	mov	WORD PTR es:_carrier+176,ax
	mov	WORD PTR es:_carrier+178,dx
; Line 224
	mov	ax,25
	imul	WORD PTR [bp-90][si]
	mov	WORD PTR es:_carrier+180,ax
	mov	WORD PTR es:_carrier+182,dx
; Line 225
	mov	ax,25
	imul	WORD PTR [bp-108][si]
	mov	WORD PTR es:_carrier+184,ax
	mov	WORD PTR es:_carrier+186,dx
; Line 226
	mov	ax,25
	imul	WORD PTR [bp-120][si]
	mov	WORD PTR es:_carrier+188,ax
	mov	WORD PTR es:_carrier+190,dx
; Line 228
	mov	ax,25
	imul	WORD PTR [bp-132][si]
	mov	WORD PTR es:_carrier+192,ax
	mov	WORD PTR es:_carrier+194,dx
; Line 229
	mov	ax,25
	imul	WORD PTR [bp-144][si]
	mov	WORD PTR es:_carrier+196,ax
	mov	WORD PTR es:_carrier+198,dx
; Line 230
	mov	ax,25
	imul	WORD PTR [bp-138][si]
	mov	WORD PTR es:_carrier+200,ax
	mov	WORD PTR es:_carrier+202,dx
; Line 231
	mov	ax,25
	imul	WORD PTR [bp-150][si]
	mov	WORD PTR es:_carrier+204,ax
	mov	WORD PTR es:_carrier+206,dx
; Line 233
	mov	WORD PTR [bp-152],0	;i
$FC1334:
; Line 234
	mov	bx,WORD PTR [bp-152]	;i
	shl	bx,1
	mov	WORD PTR _CarrierAnimVals[bx],0
	inc	WORD PTR [bp-152]	;i
	cmp	WORD PTR [bp-152],47	;i
	jl	$FC1334
; Line 236
	mov	WORD PTR [bp-152],3	;i
$FC1337:
; Line 237
	mov	bx,WORD PTR [bp-152]	;i
	shl	bx,1
	mov	WORD PTR _CarrierAnimVals[bx],8190
	add	WORD PTR [bp-152],2	;i
	cmp	WORD PTR [bp-152],10	;i
	jl	$FC1337
; Line 238
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_InitCarrier	ENDP
; Line 243
	PUBLIC	_InitCarrierObjects
_InitCarrierObjects	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,48
	call	__aNchkstk
;	V = -24
;	M = -48
;	TM = -18
;	XP = -26
;	YP = -28
;	ZP = -30
; Line 249
	mov	es,WORD PTR $T20002
	mov	ax,WORD PTR es:_carrier+80
	mov	WORD PTR [bp-24],ax	;V
; Line 250
	mov	ax,WORD PTR es:_carrier+20
	mov	WORD PTR [bp-22],ax
; Line 251
	mov	ax,WORD PTR es:_carrier+84
	add	ax,850
	mov	WORD PTR [bp-20],ax
; Line 254
	lea	ax,WORD PTR [bp-48]	;M
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	push	WORD PTR es:_carrier+12
	call	_MakeMatHPR
	add	sp,8
; Line 255
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	lea	cx,WORD PTR [bp-48]	;M
	push	cx
	call	_Trans3x3
	add	sp,4
; Line 256
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	lea	ax,WORD PTR [bp-24]	;V
	push	ax
	call	_Rotate
	add	sp,4
; Line 259
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-24]	;V
	cwd	
	mov	es,WORD PTR $T20002
	add	ax,WORD PTR es:_carrier
	adc	dx,WORD PTR es:_carrier+2
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR _PxLng,ax
	mov	WORD PTR _PxLng+2,dx
; Line 260
	mov	ax,-100
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-20]
	cwd	
	mov	es,WORD PTR $T20002
	add	ax,WORD PTR es:_carrier+8
	adc	dx,WORD PTR es:_carrier+10
	push	dx
	push	ax
	call	__aNldiv
	add	ax,0
	adc	dx,16
	mov	WORD PTR _PyLng,ax
	mov	WORD PTR _PyLng+2,dx
; Line 262
	mov	es,WORD PTR $T20002
	mov	ax,WORD PTR es:_carrier+12
	mov	WORD PTR _OurHead,ax
; Line 263
	mov	ax,WORD PTR [bp-22]
	mov	cx,100
	cwd	
	idiv	cx
	mov	cx,ax
	mov	WORD PTR _OurAlt,ax
; Line 264
	mov	WORD PTR _MinAlt,cx
; Line 265
	mov	WORD PTR _RadarAlt,ax
	mov	WORD PTR _RadarAlt+2,0
; Line 266
	shr	ax,1
	shr	ax,1
	mov	WORD PTR _Alt,ax
; Line 273
	sub	ax,ax
	mov	WORD PTR _CarrierAnimVals+4,ax
	mov	WORD PTR _CarrierAnimVals+8,ax
	mov	WORD PTR _CarrierAnimVals+12,ax
	mov	WORD PTR _CarrierAnimVals+16,ax
; Line 274
	mov	ax,90
	mov	WORD PTR _CarrierAnimVals+6,ax
	mov	WORD PTR _CarrierAnimVals+10,ax
	mov	WORD PTR _CarrierAnimVals+14,ax
	mov	WORD PTR _CarrierAnimVals+18,ax
; Line 275
	mov	sp,bp
	pop	bp
	ret	

_InitCarrierObjects	ENDP
; Line 279
	PUBLIC	_InitPlaneOnCarrier
_InitPlaneOnCarrier	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,44
	call	__aNchkstk
;	V = -24
;	M = -44
;	TM = -18
;	cat = -26
;	reqcat = 4
; Line 285
	cmp	WORD PTR _Alt,20
	ja	$I1358
	cmp	WORD PTR _PlayerCat,0
	jge	$I1357
$I1358:
; Line 286
	call	_InitScottFlight
; Line 287
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
; Line 288
; Line 300
$I1357:
	cmp	WORD PTR [bp-26],-1	;cat
	jne	$I1360
; Line 302
	sub	ax,ax
	mov	WORD PTR [bp-26],ax	;cat
	push	ax
	mov	ax,OFFSET DGROUP:$SG1362
	push	ax
	call	_Message
	add	sp,4
; Line 303
; Line 305
$I1360:
	mov	WORD PTR _AirSpeed,0
; Line 306
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+22
	push	WORD PTR es:_carrier+20
	call	__aNldiv
	mov	WORD PTR _OurAlt,ax
; Line 308
	mov	es,WORD PTR $T20002
	mov	bx,WORD PTR [bp-26]	;cat
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR es:_carrier[bx+24]
	mov	WORD PTR [bp-24],ax	;V
; Line 309
	mov	ax,WORD PTR es:_carrier+20
	mov	WORD PTR [bp-22],ax
; Line 310
	mov	ax,WORD PTR es:_carrier[bx+28]
	add	ax,350
	mov	WORD PTR [bp-20],ax
; Line 312
	lea	ax,WORD PTR [bp-44]	;M
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	push	WORD PTR es:_carrier+12
	call	_MakeMatHPR
	add	sp,8
; Line 313
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	lea	cx,WORD PTR [bp-44]	;M
	push	cx
	call	_Trans3x3
	add	sp,4
; Line 314
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	lea	ax,WORD PTR [bp-24]	;V
	push	ax
	call	_Rotate
	add	sp,4
; Line 316
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-24]	;V
	cwd	
	mov	es,WORD PTR $T20002
	add	ax,WORD PTR es:_carrier
	adc	dx,WORD PTR es:_carrier+2
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR _PxLng,ax
	mov	WORD PTR _PxLng+2,dx
; Line 317
	mov	ax,-100
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-20]
	cwd	
	mov	es,WORD PTR $T20002
	add	ax,WORD PTR es:_carrier+8
	adc	dx,WORD PTR es:_carrier+10
	push	dx
	push	ax
	call	__aNldiv
	add	ax,0
	adc	dx,16
	mov	WORD PTR _PyLng,ax
	mov	WORD PTR _PyLng+2,dx
; Line 319
	mov	WORD PTR _OurPitch,8192
; Line 320
	push	WORD PTR [bp-26]	;cat
	call	_GetCatHeading
	add	sp,2
	mov	WORD PTR _OurHead,ax
; Line 321
	call	_InitScottFlight
; Line 323
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+22
	push	WORD PTR es:_carrier+20
	call	__aNldiv
	mov	WORD PTR _MinAlt,ax
; Line 324
	mov	ax,WORD PTR _OurAlt
	mov	WORD PTR _RadarAlt,ax
	mov	WORD PTR _RadarAlt+2,0
; Line 325
	shr	ax,1
	shr	ax,1
	mov	WORD PTR _Alt,ax
; Line 326
	sub	ax,ax
	mov	WORD PTR _ThrustI,ax
	mov	WORD PTR _THRUST,ax
; Line 327
	mov	sp,bp
	pop	bp
	ret	

_InitPlaneOnCarrier	ENDP
; Line 331
	PUBLIC	_GetCatHeading
_GetCatHeading	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	cat = 4
; Line 332
	mov	es,WORD PTR $T20002
	mov	bx,WORD PTR [bp+4]	;cat
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR es:_carrier[bx+32]
	add	ax,WORD PTR es:_carrier+12
; Line 333
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GetCatHeading	ENDP
; Line 339
	PUBLIC	_Carrier3D
_Carrier3D	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,44
	call	__aNchkstk
	push	si
;	dx = -20
;	dy = -42
;	dz = -44
;	V = -12
;	M = -38
;	t1 = -4
;	t2 = -6
;	t3 = -16
; Line 341
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+2
	push	WORD PTR es:_carrier
	call	__aNldiv
	sub	ax,WORD PTR _ViewX
	sbb	dx,WORD PTR _ViewX+2
	mov	WORD PTR [bp-20],ax	;dx
	mov	WORD PTR [bp-18],dx
; Line 342
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+10
	push	WORD PTR es:_carrier+8
	call	__aNldiv
	add	ax,WORD PTR _ViewY
	adc	dx,WORD PTR _ViewY+2
	sub	ax,0
	sbb	dx,16
	mov	WORD PTR [bp-42],ax	;dy
	mov	WORD PTR [bp-40],dx
; Line 343
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+6
	push	WORD PTR es:_carrier+4
	call	__aNldiv
	sub	ax,WORD PTR _ViewZ
	mov	WORD PTR [bp-44],ax	;dz
; Line 352
	push	ax
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-6],ax	;t2
	cmp	ax,16000
	jle	$I1376
$L20036:
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 354
	nop	
$I1376:
; Line 355
	push	WORD PTR [bp-18]
	push	WORD PTR [bp-20]	;dx
	call	_labs
	add	sp,4
	mov	WORD PTR [bp-4],ax	;t1
	mov	WORD PTR [bp-2],dx
	or	dx,dx
	jl	$I1377
	jg	$L20036
	cmp	ax,16000
	ja	$L20036
; Line 357
$I1377:
; Line 358
	push	WORD PTR [bp-40]
	push	WORD PTR [bp-42]	;dy
	call	_labs
	add	sp,4
	mov	WORD PTR [bp-4],ax	;t1
	mov	WORD PTR [bp-2],dx
	or	dx,dx
	jl	$I1378
	jg	$L20036
	cmp	ax,16000
	ja	$L20036
; Line 360
$I1378:
; Line 366
	mov	ax,1
	push	ax
	push	WORD PTR _CarrierScale
	sub	ax,ax
	mov	es,WORD PTR $T20002
	mov	WORD PTR es:_carrier+12,ax
	push	ax
	push	WORD PTR [bp-42]	;dy
	push	WORD PTR [bp-44]	;dz
	push	WORD PTR [bp-20]	;dx
	push	ax
	call	_Stack3DObject
	add	sp,14
; Line 369
	lea	ax,WORD PTR [bp-38]	;M
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+12
	call	_MakeMatHPR
	add	sp,8
; Line 370
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+26
	push	WORD PTR es:_carrier+24
	call	__aNldiv
	mov	WORD PTR [bp-12],ax	;V
; Line 371
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+30
	push	WORD PTR es:_carrier+28
	call	__aNldiv
	add	ax,20
	mov	WORD PTR [bp-8],ax
; Line 372
	mov	WORD PTR [bp-10],0
; Line 373
	lea	ax,WORD PTR [bp-38]	;M
	push	ax
	lea	cx,WORD PTR [bp-12]	;V
	push	cx
	call	_Rotate
	add	sp,4
; Line 375
	mov	ax,6
	push	ax
	push	WORD PTR _CarrierScale
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+12
	mov	ax,WORD PTR [bp-42]	;dy
	add	ax,WORD PTR [bp-8]
	push	ax
	mov	ax,WORD PTR [bp-44]	;dz
	add	ax,16
	push	ax
	mov	cx,WORD PTR [bp-20]	;dx
	add	cx,WORD PTR [bp-12]	;V
	push	cx
	sub	cx,cx
	push	cx
	mov	si,ax
	call	_Stack3DObject
	add	sp,14
; Line 377
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+36
	push	WORD PTR es:_carrier+34
	call	__aNldiv
	mov	WORD PTR [bp-12],ax	;V
; Line 378
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+40
	push	WORD PTR es:_carrier+38
	call	__aNldiv
	add	ax,20
	mov	WORD PTR [bp-8],ax
; Line 379
	mov	WORD PTR [bp-10],0
; Line 380
	lea	ax,WORD PTR [bp-38]	;M
	push	ax
	lea	cx,WORD PTR [bp-12]	;V
	push	cx
	call	_Rotate
	add	sp,4
; Line 381
	mov	ax,7
	push	ax
	push	WORD PTR _CarrierScale
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+12
	mov	ax,WORD PTR [bp-42]	;dy
	add	ax,WORD PTR [bp-8]
	push	ax
	push	si
	mov	ax,WORD PTR [bp-20]	;dx
	add	ax,WORD PTR [bp-12]	;V
	push	ax
	sub	ax,ax
	push	ax
	call	_Stack3DObject
	add	sp,14
; Line 383
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+46
	push	WORD PTR es:_carrier+44
	call	__aNldiv
	mov	WORD PTR [bp-12],ax	;V
; Line 384
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+50
	push	WORD PTR es:_carrier+48
	call	__aNldiv
	add	ax,20
	mov	WORD PTR [bp-8],ax
; Line 385
	mov	WORD PTR [bp-10],0
; Line 386
	lea	ax,WORD PTR [bp-38]	;M
	push	ax
	lea	cx,WORD PTR [bp-12]	;V
	push	cx
	call	_Rotate
	add	sp,4
; Line 387
	mov	ax,8
	push	ax
	push	WORD PTR _CarrierScale
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+12
	mov	ax,WORD PTR [bp-42]	;dy
	add	ax,WORD PTR [bp-8]
	push	ax
	push	si
	mov	ax,WORD PTR [bp-20]	;dx
	add	ax,WORD PTR [bp-12]	;V
	push	ax
	sub	ax,ax
	push	ax
	call	_Stack3DObject
	add	sp,14
; Line 389
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+56
	push	WORD PTR es:_carrier+54
	call	__aNldiv
	mov	WORD PTR [bp-12],ax	;V
; Line 390
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+60
	push	WORD PTR es:_carrier+58
	call	__aNldiv
	add	ax,20
	mov	WORD PTR [bp-8],ax
; Line 391
	mov	WORD PTR [bp-10],0
; Line 392
	lea	ax,WORD PTR [bp-38]	;M
	push	ax
	lea	cx,WORD PTR [bp-12]	;V
	push	cx
	call	_Rotate
	add	sp,4
; Line 393
	mov	ax,9
	push	ax
	push	WORD PTR _CarrierScale
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+12
	mov	ax,WORD PTR [bp-42]	;dy
	add	ax,WORD PTR [bp-8]
	push	ax
	push	si
	mov	ax,WORD PTR [bp-20]	;dx
	add	ax,WORD PTR [bp-12]	;V
	push	ax
	sub	ax,ax
	push	ax
	call	_Stack3DObject
	add	sp,14
; Line 396
	mov	ax,25
	mov	WORD PTR [bp-12],ax	;V
	mov	WORD PTR [bp-8],ax
; Line 397
	mov	WORD PTR [bp-10],0
; Line 398
	lea	ax,WORD PTR [bp-38]	;M
	push	ax
	lea	ax,WORD PTR [bp-12]	;V
	push	ax
	call	_Rotate
	add	sp,4
; Line 399
	mov	ax,10
	push	ax
	push	WORD PTR _CarrierScale
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+12
	mov	ax,WORD PTR [bp-42]	;dy
	add	ax,WORD PTR [bp-8]
	push	ax
	push	si
	mov	ax,WORD PTR [bp-20]	;dx
	add	ax,WORD PTR [bp-12]	;V
	push	ax
	sub	ax,ax
	push	ax
	call	_Stack3DObject
	add	sp,14
; Line 402
	cmp	WORD PTR _ViewZ,16
	jge	$I1380
; Line 403
	mov	ax,2
	push	ax
	push	WORD PTR _CarrierScale
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+12
	push	WORD PTR [bp-42]	;dy
	push	WORD PTR [bp-44]	;dz
	push	WORD PTR [bp-20]	;dx
	sub	ax,ax
	push	ax
	call	_Stack3DObject
	add	sp,14
; Line 404
$I1380:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_Carrier3D	ENDP
; Line 413
	PUBLIC	_DrawCarrier
_DrawCarrier	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,50
	call	__aNchkstk
	push	di
	push	si
;	M = -46
;	V = -26
;	MYO = -20
;	i = -28
;	dist = -2
;	bgsscl = -48
;	objtype = 14
;	SHFT = 12
;	heading = 10
;	Z = 8
;	Y = 6
;	X = 4
; Line 421
	mov	WORD PTR [bp-48],1	;bgsscl
; Line 423
	mov	ax,OFFSET _O
	push	ax
	sub	ax,ax
	push	ax
	push	ax
	push	WORD PTR [bp+10]	;heading
	call	_MakeMatHPR
	add	sp,8
; Line 424
	call	_InvertMatrix
; Line 427
	cmp	WORD PTR [bp+14],2	;objtype
	jne	$I1400
; Line 428
	mov	ax,WORD PTR [bp+4]	;X
	mov	WORD PTR _bogusx,ax
; Line 429
	mov	ax,WORD PTR [bp+6]	;Y
	mov	WORD PTR _bogusy,ax
; Line 430
	mov	ax,WORD PTR [bp+8]	;Z
	mov	WORD PTR _bogusz,ax
; Line 431
$L20037:
	mov	ax,1
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 432
; Line 434
	nop	
$I1400:
	cmp	WORD PTR [bp+14],1	;objtype
	je	$JCC3196
	jmp	$I1401
$JCC3196:
; Line 435
	call	_UpdateCarrierAnim
; Line 445
	cmp	WORD PTR [bp+12],0	;SHFT
	je	$I1403
; Line 446
	push	WORD PTR [bp+12]	;SHFT
	mov	ax,OFFSET _O
	push	ax
	call	_Shift3X3
	add	sp,4
; Line 447
	mov	ax,WORD PTR [bp+12]	;SHFT
	mov	WORD PTR _Scale3d,ax
; Line 448
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	mov	ax,WORD PTR [bp-48]	;bgsscl
	imul	WORD PTR [bp+8]	;Z
	push	ax
	mov	ax,WORD PTR [bp-48]	;bgsscl
	imul	WORD PTR [bp+6]	;Y
	push	ax
	mov	ax,WORD PTR [bp-48]	;bgsscl
	imul	WORD PTR [bp+4]	;X
	push	ax
	mov	ax,12
	push	ax
	call	_NDraw3DObject
	add	sp,12
; Line 451
	mov	ax,1
	mov	WORD PTR _Scale3d,ax
	mov	WORD PTR _lodetailcqr,ax
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 452
; Line 454
	nop	
$I1403:
; Line 456
	push	WORD PTR [bp+8]	;Z
	push	WORD PTR [bp+6]	;Y
	push	WORD PTR [bp+4]	;X
	call	_Dist3D
	add	sp,6
	cmp	ax,8000
	jbe	$I1406
; Line 457
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	mov	ax,WORD PTR [bp-48]	;bgsscl
	imul	WORD PTR [bp+8]	;Z
	push	ax
	mov	ax,WORD PTR [bp-48]	;bgsscl
	imul	WORD PTR [bp+6]	;Y
	push	ax
	mov	ax,WORD PTR [bp-48]	;bgsscl
	imul	WORD PTR [bp+4]	;X
	push	ax
	mov	ax,12
$L20038:
	push	ax
	call	_NDraw3DObject
	add	sp,12
; Line 458
	mov	WORD PTR _lodetailcqr,1
; Line 459
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 460
; Line 461
	nop	
$I1406:
	cmp	ax,5000
	jbe	$I1407
; Line 462
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	mov	ax,WORD PTR [bp-48]	;bgsscl
	imul	WORD PTR [bp+8]	;Z
	push	ax
	mov	dx,ax
	mov	ax,WORD PTR [bp-48]	;bgsscl
	mov	bx,dx
	imul	WORD PTR [bp+6]	;Y
	push	ax
	mov	dx,ax
	mov	ax,WORD PTR [bp-48]	;bgsscl
	mov	si,dx
	imul	WORD PTR [bp+4]	;X
	push	ax
	mov	dx,13
	push	dx
	mov	di,ax
	mov	WORD PTR [bp-50],bx
	call	_NDraw3DObject
	add	sp,12
; Line 463
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	WORD PTR [bp-50]
	push	si
	push	di
	mov	dx,10
	push	dx
	call	_NDraw3DObject
	add	sp,12
; Line 464
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR [bp-50]
	push	si
	push	di
	mov	ax,11
	jmp	SHORT $L20038
; Line 467
; Line 468
$I1407:
	cmp	ax,1750
	ja	$JCC3457
	jmp	$I1408
$JCC3457:
; Line 469
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	mov	ax,WORD PTR [bp-48]	;bgsscl
	imul	WORD PTR [bp+8]	;Z
	push	ax
	mov	dx,ax
	mov	ax,WORD PTR [bp-48]	;bgsscl
	mov	bx,dx
	imul	WORD PTR [bp+6]	;Y
	push	ax
	mov	dx,ax
	mov	ax,WORD PTR [bp-48]	;bgsscl
	mov	si,dx
	imul	WORD PTR [bp+4]	;X
	push	ax
	mov	dx,13
	push	dx
	mov	di,ax
	mov	WORD PTR [bp-50],bx
	call	_NDraw3DObject
	add	sp,12
; Line 470
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	WORD PTR [bp-50]
	push	si
	push	di
	mov	dx,9
	push	dx
	call	_NDraw3DObject
	add	sp,12
; Line 471
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	WORD PTR [bp-50]
	push	si
	push	di
	mov	dx,2
	push	dx
	call	_NDraw3DObject
	add	sp,12
; Line 472
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	WORD PTR [bp-50]
	push	si
	push	di
	mov	dx,1
	push	dx
	call	_NDraw3DObject
	add	sp,12
; Line 473
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR [bp-50]
	push	si
	push	di
	mov	ax,4
	jmp	$L20038
; Line 476
; Line 478
$I1408:
	mov	WORD PTR _lodetailcqr,0
; Line 480
	cmp	WORD PTR _ViewZ,16
	jge	$JCC3613
	jmp	$I1409
$JCC3613:
; Line 481
	mov	ax,WORD PTR [bp-48]	;bgsscl
	imul	WORD PTR [bp+4]	;X
	mov	WORD PTR _bogusx,ax
; Line 482
	mov	cx,ax
	mov	ax,WORD PTR [bp-48]	;bgsscl
	imul	WORD PTR [bp+6]	;Y
	mov	WORD PTR _bogusy,ax
; Line 483
	mov	dx,ax
	mov	ax,WORD PTR [bp-48]	;bgsscl
	mov	bx,dx
	imul	WORD PTR [bp+8]	;Z
	mov	WORD PTR _bogusz,ax
; Line 484
	mov	dx,OFFSET DGROUP:_CarrierAnimVals
	push	dx
	mov	si,OFFSET _O
	push	si
	push	ax
	push	bx
	push	cx
	mov	di,13
	push	di
	mov	di,ax
	mov	si,cx
	mov	WORD PTR [bp-50],bx
	call	_NDraw3DObject
	add	sp,12
; Line 485
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	di
	push	WORD PTR [bp-50]
	push	si
	sub	dx,dx
	push	dx
	call	_NDraw3DObject
	add	sp,12
; Line 486
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	di
	push	WORD PTR [bp-50]
	push	si
	mov	dx,2
	push	dx
	call	_NDraw3DObject
	add	sp,12
; Line 487
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	di
	push	WORD PTR [bp-50]
	push	si
	mov	dx,3
	push	dx
	call	_NDraw3DObject
	add	sp,12
; Line 488
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	di
	push	WORD PTR [bp-50]
	push	si
	mov	ax,4
	jmp	SHORT $L20043
	nop	
$I1409:
; Line 490
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	WORD PTR _bogusz
	push	WORD PTR _bogusy
	push	WORD PTR _bogusx
	mov	dx,4
	push	dx
	call	_NDraw3DObject
	add	sp,12
; Line 491
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	WORD PTR _bogusz
	push	WORD PTR _bogusy
	push	WORD PTR _bogusx
	mov	dx,3
	push	dx
	call	_NDraw3DObject
	add	sp,12
; Line 492
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	cx,OFFSET _O
	push	cx
	push	WORD PTR _bogusz
	push	WORD PTR _bogusy
	push	WORD PTR _bogusx
	mov	dx,2
	push	dx
	call	_NDraw3DObject
	add	sp,12
; Line 493
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR _bogusz
	push	WORD PTR _bogusy
	push	WORD PTR _bogusx
	sub	ax,ax
$L20043:
	push	ax
	call	_NDraw3DObject
	add	sp,12
; Line 494
	jmp	$L20037
; Line 496
; Line 498
$I1401:
	cmp	WORD PTR [bp+12],0	;SHFT
	je	$JCC3892
	jmp	$L20037
$JCC3892:
	cmp	WORD PTR _lodetailcqr,0
	je	$JCC3902
	jmp	$L20037
$JCC3902:
; Line 500
; Line 506
	mov	ax,WORD PTR [bp+14]	;objtype
	sub	ax,6
	je	$SC1417
	dec	ax
	je	$SC1418
	dec	ax
	je	$SC1419
	dec	ax
	je	$SC1420
	dec	ax
	je	$SC1421
	jmp	$L20037
; Line 507
$SC1417:
; Line 508
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR _bogusz
	push	WORD PTR _bogusy
	push	WORD PTR _bogusx
	mov	ax,5
	jmp	SHORT $L20043
; Line 510
	nop	
$SC1418:
; Line 511
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR _bogusz
	push	WORD PTR _bogusy
	push	WORD PTR _bogusx
	mov	ax,6
	jmp	SHORT $L20043
; Line 513
	nop	
$SC1419:
; Line 514
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR _bogusz
	push	WORD PTR _bogusy
	push	WORD PTR _bogusx
	mov	ax,7
	jmp	$L20043
; Line 516
$SC1420:
; Line 517
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR _bogusz
	push	WORD PTR _bogusy
	push	WORD PTR _bogusx
	mov	ax,8
	jmp	$L20043
; Line 519
$SC1421:
; Line 520
	mov	ax,OFFSET DGROUP:_CarrierAnimVals
	push	ax
	mov	ax,OFFSET _O
	push	ax
	push	WORD PTR _bogusz
	push	WORD PTR _bogusy
	push	WORD PTR _bogusx
	mov	ax,1
	jmp	$L20043

_DrawCarrier	ENDP
; Line 529
	PUBLIC	_InBox
_InBox	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	zh = 14
;	xh = 12
;	zl = 10
;	xl = 8
;	z = 6
;	x = 4
; Line 530
	mov	ax,WORD PTR [bp+4]	;x
	cmp	WORD PTR [bp+8],ax	;xl
	jg	$I1431
	cmp	WORD PTR [bp+12],ax	;xh
	jl	$I1431
	mov	ax,WORD PTR [bp+6]	;z
	cmp	WORD PTR [bp+10],ax	;zl
	jg	$I1431
	cmp	WORD PTR [bp+14],ax	;zh
	jge	$I1430
$I1431:
; Line 531
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
$I1430:
; Line 533
	mov	ax,1
; Line 534
	mov	sp,bp
	pop	bp
	ret	
	nop	

_InBox	ENDP
; Line 538
	PUBLIC	_InBoxLng
_InBoxLng	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	zh = 24
;	xh = 20
;	zl = 16
;	xl = 12
;	z = 8
;	x = 4
; Line 539
	mov	ax,WORD PTR [bp+4]	;x
	mov	dx,WORD PTR [bp+6]
	cmp	WORD PTR [bp+14],dx
	jg	$L20009
	jl	$L20006
	cmp	WORD PTR [bp+12],ax	;xl
	ja	$L20009
$L20006:
	cmp	dx,WORD PTR [bp+22]
	jg	$L20009
	jl	$L20007
	cmp	ax,WORD PTR [bp+20]	;xh
	ja	$L20009
$L20007:
	mov	ax,WORD PTR [bp+16]	;zl
	mov	dx,WORD PTR [bp+18]
	cmp	WORD PTR [bp+10],dx
	jl	$L20009
	jg	$L20008
	cmp	WORD PTR [bp+8],ax	;z
	jb	$L20009
$L20008:
	mov	ax,WORD PTR [bp+24]	;zh
	mov	dx,WORD PTR [bp+26]
	cmp	WORD PTR [bp+10],dx
	jl	$I1441
	jg	$L20009
	cmp	WORD PTR [bp+8],ax	;z
	jbe	$I1441
$L20009:
; Line 540
	sub	ax,ax
	mov	sp,bp
	pop	bp
	ret	
$I1441:
; Line 542
	mov	ax,1
; Line 543
	mov	sp,bp
	pop	bp
	ret	
	nop	

_InBoxLng	ENDP
; Line 547
	PUBLIC	_OnCarrier
_OnCarrier	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,56
	call	__aNchkstk
;	V = -28
;	M = -52
;	TM = -22
;	cbx1 = -54
;	cbx2 = -56
;	cbz1 = -2
;	cbz2 = -4
;	px = -30
;	py = -32
;	pz = -34
;	PY = 12
;	PZ = 8
;	PX = 4
; Line 556
	mov	ax,WORD PTR [bp+4]	;PX
	mov	dx,WORD PTR [bp+6]
	mov	es,WORD PTR $T20002
	sub	ax,WORD PTR es:_carrier
	sbb	dx,WORD PTR es:_carrier+2
	push	dx
	push	ax
	call	_labs
	add	sp,4
	or	dx,dx
	jle	$JCC4235
	jmp	$I1460
$JCC4235:
	jl	$L20011
	cmp	ax,20479
	jb	$JCC4245
	jmp	$I1460
$JCC4245:
$L20011:
	mov	ax,WORD PTR [bp+8]	;PZ
	mov	dx,WORD PTR [bp+10]
	mov	es,WORD PTR $T20002
	sub	ax,WORD PTR es:_carrier+8
	sbb	dx,WORD PTR es:_carrier+10
	push	dx
	push	ax
	call	_labs
	add	sp,4
	or	dx,dx
	jle	$JCC4280
	jmp	$I1460
$JCC4280:
	jl	$L20013
	cmp	ax,20479
	jb	$JCC4290
	jmp	$I1460
$JCC4290:
$L20013:
; Line 557
	mov	ax,WORD PTR [bp+4]	;PX
	mov	es,WORD PTR $T20002
	sub	ax,WORD PTR es:_carrier
	mov	WORD PTR [bp-28],ax	;V
; Line 558
	mov	ax,WORD PTR [bp+12]	;PY
	sub	ax,WORD PTR es:_carrier+20
	mov	WORD PTR [bp-26],ax
; Line 559
	mov	ax,WORD PTR [bp+8]	;PZ
	sub	ax,WORD PTR es:_carrier+8
	mov	WORD PTR [bp-24],ax
; Line 561
	lea	ax,WORD PTR [bp-52]	;M
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	mov	dx,WORD PTR es:_carrier+12
	neg	dx
	push	dx
	call	_MakeMatHPR
	add	sp,8
; Line 562
	lea	ax,WORD PTR [bp-22]	;TM
	push	ax
	lea	cx,WORD PTR [bp-52]	;M
	push	cx
	call	_Trans3x3
	add	sp,4
; Line 563
	lea	ax,WORD PTR [bp-22]	;TM
	push	ax
	lea	ax,WORD PTR [bp-28]	;V
	push	ax
	call	_Rotate
	add	sp,4
; Line 565
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+172
	push	WORD PTR es:_carrier+168
	push	WORD PTR es:_carrier+164
	push	WORD PTR es:_carrier+160
	push	WORD PTR [bp-24]
	push	WORD PTR [bp-28]	;V
	call	_InBox
	add	sp,12
	or	ax,ax
	je	$I1460
; Line 566
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 567
; Line 568
	nop	
$I1460:
; Line 569
	sub	ax,ax
; Line 570
	mov	sp,bp
	pop	bp
	ret	

_OnCarrier	ENDP
; Line 574
	PUBLIC	_GlideScopeCheck
_GlideScopeCheck	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,60
	call	__aNchkstk
;	V = -26
;	M = -52
;	TM = -18
;	x = -28
;	y = -30
;	dx = -34
;	dy = -56
;	dz = -60
;	xoff = -20
;	PY = 12
;	PZ = 8
;	PX = 4
; Line 585
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	mov	cx,WORD PTR es:_carrier+128
	mov	bx,WORD PTR es:_carrier+130
	add	cx,WORD PTR es:_carrier
	adc	bx,WORD PTR es:_carrier+2
	sub	cx,WORD PTR [bp+4]	;PX
	sbb	bx,WORD PTR [bp+6]
	push	bx
	push	cx
	call	__aNldiv
	push	dx
	push	ax
	call	_labs
	add	sp,4
	mov	WORD PTR [bp-34],ax	;dx
; Line 586
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	mov	cx,WORD PTR es:_carrier+8
	mov	bx,WORD PTR es:_carrier+10
	add	cx,WORD PTR es:_carrier+132
	adc	bx,WORD PTR es:_carrier+134
	sub	cx,WORD PTR [bp+8]	;PZ
	sbb	bx,WORD PTR [bp+10]
	push	bx
	push	cx
	call	__aNldiv
	push	dx
	push	ax
	call	_labs
	add	sp,4
	mov	WORD PTR [bp-60],ax	;dz
; Line 588
	mov	ax,4
	cwd	
	push	dx
	push	ax
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp+12]	;PY
	mov	dx,WORD PTR [bp+14]
	mov	es,WORD PTR $T20002
	sub	ax,WORD PTR es:_carrier+20
	sbb	dx,WORD PTR es:_carrier+22
	push	dx
	push	ax
	call	__aNldiv
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-56],ax	;dy
; Line 610
	push	WORD PTR [bp-60]	;dz
	push	WORD PTR [bp-34]	;dx
	call	_Dist2D
	add	sp,4
	push	ax
	push	WORD PTR [bp-56]	;dy
	call	_ARCTAN
; Line 612
	mov	sp,bp
	pop	bp
	ret	
	nop	

_GlideScopeCheck	ENDP
; Line 617
	PUBLIC	_DisplayBall
_DisplayBall	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,2
	call	__aNchkstk
;	y = -2
; Line 621
	push	WORD PTR _FPARAMS+6
	push	WORD PTR _FPARAMS+4
	push	WORD PTR _FPARAMS+10
	push	WORD PTR _FPARAMS+8
	push	WORD PTR _FPARAMS+2
	push	WORD PTR _FPARAMS
	call	_GlideScopeCheck
	add	sp,12
	cmp	ax,455
	jg	$I1480
	mov	WORD PTR _MeatBall,4
; Line 622
$I1480:
	cmp	ax,455
	jle	$I1481
	cmp	ax,545
	jge	$I1481
	mov	WORD PTR _MeatBall,3
; Line 623
$I1481:
	cmp	ax,545
	jle	$I1482
	cmp	ax,728
	jge	$I1482
	mov	WORD PTR _MeatBall,2
; Line 624
$I1482:
	cmp	ax,728
	jle	$I1483
	cmp	ax,819
	jge	$I1483
	mov	WORD PTR _MeatBall,1
; Line 625
$I1483:
	cmp	ax,819
	jl	$I1484
	mov	WORD PTR _MeatBall,0
; Line 626
$I1484:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DisplayBall	ENDP
; Line 631
	PUBLIC	_CarrierLanding
_CarrierLanding	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 632
	jmp	_DoLSO
; Line 633

_CarrierLanding	ENDP
; Line 638
	PUBLIC	_UpdateCarrierAnim
_UpdateCarrierAnim	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 643
	inc	WORD PTR $S1489_StrobeLight
	cmp	WORD PTR $S1489_StrobeLight,8
	jle	$I1491
	mov	WORD PTR $S1489_StrobeLight,1
; Line 644
$I1491:
	mov	ax,WORD PTR $S1489_StrobeLight
	mov	WORD PTR _CarrierAnimVals+52,ax
; Line 645
	mov	ax,WORD PTR _LightsOn
	mov	WORD PTR _CarrierAnimVals+56,ax
; Line 649
	cmp	WORD PTR _BlastShield,0
	je	$I1493
	cmp	WORD PTR _CarrierAnimVals+6,2730
	jle	$I1493
; Line 650
	mov	WORD PTR _CarrierAnimVals+4,1
; Line 652
	sub	WORD PTR _CarrierAnimVals+6,910
	cmp	WORD PTR _CarrierAnimVals+6,2730
	jne	$I1493
	mov	WORD PTR _CatReady,1
; Line 653
$I1493:
; Line 654
	cmp	WORD PTR _BlastShield,0
	jne	$I1495
	cmp	WORD PTR _CarrierAnimVals+6,16380
	jge	$I1495
; Line 656
	add	WORD PTR _CarrierAnimVals+6,910
	cmp	WORD PTR _CarrierAnimVals+6,16380
	jne	$I1495
; Line 658
	sub	ax,ax
	mov	WORD PTR _CarrierAnimVals+4,ax
	mov	WORD PTR _CatReady,ax
; Line 659
; Line 660
$I1495:
; Line 663
	cmp	WORD PTR _BlastShield+2,0
	je	$I1497
	cmp	WORD PTR _CarrierAnimVals+10,2730
	jle	$I1497
; Line 664
	mov	WORD PTR _CarrierAnimVals+8,1
; Line 666
	sub	WORD PTR _CarrierAnimVals+10,910
	cmp	WORD PTR _CarrierAnimVals+10,2730
	jne	$I1497
	mov	WORD PTR _CatReady+2,1
; Line 667
$I1497:
; Line 668
	cmp	WORD PTR _BlastShield+2,0
	jne	$I1499
	cmp	WORD PTR _CarrierAnimVals+10,16380
	jge	$I1499
; Line 670
	add	WORD PTR _CarrierAnimVals+10,910
	cmp	WORD PTR _CarrierAnimVals+10,16380
	jne	$I1499
; Line 672
	sub	ax,ax
	mov	WORD PTR _CarrierAnimVals+8,ax
	mov	WORD PTR _CatReady+2,ax
; Line 673
; Line 674
$I1499:
; Line 677
	cmp	WORD PTR _BlastShield+4,0
	je	$I1501
	cmp	WORD PTR _CarrierAnimVals+14,2730
	jle	$I1501
; Line 678
	mov	WORD PTR _CarrierAnimVals+12,1
; Line 680
	sub	WORD PTR _CarrierAnimVals+14,910
	cmp	WORD PTR _CarrierAnimVals+14,2730
	jne	$I1501
	mov	WORD PTR _CatReady+4,1
; Line 681
$I1501:
; Line 682
	cmp	WORD PTR _BlastShield+4,0
	jne	$I1503
	cmp	WORD PTR _CarrierAnimVals+14,16380
	jge	$I1503
; Line 684
	add	WORD PTR _CarrierAnimVals+14,910
	cmp	WORD PTR _CarrierAnimVals+14,16380
	jne	$I1503
; Line 686
	sub	ax,ax
	mov	WORD PTR _CarrierAnimVals+12,ax
	mov	WORD PTR _CatReady+4,ax
; Line 687
; Line 688
$I1503:
; Line 691
	cmp	WORD PTR _BlastShield+6,0
	je	$I1505
	cmp	WORD PTR _CarrierAnimVals+18,2730
	jle	$I1505
; Line 692
	mov	WORD PTR _CarrierAnimVals+16,1
; Line 694
	sub	WORD PTR _CarrierAnimVals+18,910
	cmp	WORD PTR _CarrierAnimVals+18,2730
	jne	$I1505
	mov	WORD PTR _CatReady+6,1
; Line 695
$I1505:
; Line 696
	cmp	WORD PTR _BlastShield+6,0
	jne	$I1507
	cmp	WORD PTR _CarrierAnimVals+18,16380
	jge	$I1507
; Line 698
	add	WORD PTR _CarrierAnimVals+18,910
	cmp	WORD PTR _CarrierAnimVals+18,16380
	jne	$I1507
; Line 700
	sub	ax,ax
	mov	WORD PTR _CarrierAnimVals+16,ax
	mov	WORD PTR _CatReady+6,ax
; Line 701
; Line 702
$I1507:
; Line 708
	mov	ax,1
	mov	WORD PTR _CarrierAnimVals+20,ax
	mov	WORD PTR _CarrierAnimVals+22,ax
	mov	WORD PTR _CarrierAnimVals+48,ax
; Line 716
	sub	ax,ax
	mov	WORD PTR _CarrierAnimVals+50,ax
	mov	WORD PTR _CarrierAnimVals+36,ax
	mov	WORD PTR _CarrierAnimVals+38,ax
	mov	WORD PTR _CarrierAnimVals+40,ax
	mov	WORD PTR _CarrierAnimVals+42,ax
	mov	WORD PTR _CarrierAnimVals+44,ax
	mov	WORD PTR _CarrierAnimVals+46,ax
; Line 718
	mov	ax,WORD PTR _MeatBall
	jmp	SHORT $S1508
; Line 719
$SC1512:
; Line 720
	mov	ax,1
	mov	WORD PTR _CarrierAnimVals+36,ax
	mov	WORD PTR _CarrierAnimVals+38,ax
; Line 721
	ret	
; Line 722
$SC1513:
; Line 723
	mov	ax,1
	mov	WORD PTR _CarrierAnimVals+38,ax
	mov	WORD PTR _CarrierAnimVals+40,ax
; Line 724
	ret	
; Line 725
$SC1514:
; Line 726
	mov	ax,1
	mov	WORD PTR _CarrierAnimVals+40,ax
	mov	WORD PTR _CarrierAnimVals+46,ax
; Line 727
	ret	
; Line 728
$SC1515:
; Line 729
	mov	ax,1
	mov	WORD PTR _CarrierAnimVals+46,ax
	mov	WORD PTR _CarrierAnimVals+42,ax
; Line 730
	ret	
; Line 731
$SC1516:
; Line 732
	mov	ax,1
	mov	WORD PTR _CarrierAnimVals+42,ax
	mov	WORD PTR _CarrierAnimVals+44,ax
; Line 733
	ret	
$S1508:
	or	ax,ax
	je	$SC1512
	dec	ax
	je	$SC1513
	dec	ax
	je	$SC1514
	dec	ax
	je	$SC1515
	dec	ax
	je	$SC1516
; Line 735
	ret	
	nop	

_UpdateCarrierAnim	ENDP
; Line 740
	PUBLIC	_KeepPlaneOnCarrier
_KeepPlaneOnCarrier	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,60
	call	__aNchkstk
	push	di
	push	si
;	V = -24
;	M = -60
;	TM = -18
;	cat = -26
;	basenum = -30
;	whichcarr = -28
;	ONDECKX = -36
;	ONDECKY = -42
;	planenum = 6
;	reqcat = 4
; Line 747
	mov	WORD PTR [bp-36],16	;ONDECKX
	mov	WORD PTR [bp-34],14
	mov	WORD PTR [bp-32],12
; Line 748
	mov	WORD PTR [bp-42],30	;ONDECKY
	mov	WORD PTR [bp-40],52
	mov	WORD PTR [bp-38],10
; Line 750
	mov	ax,WORD PTR _ConfigData+22
	mov	WORD PTR [bp-28],ax	;whichcarr
; Line 751
	cmp	ax,2
	jg	$I1530
	or	ax,ax
	jge	$I1529
$I1530:
; Line 752
	mov	WORD PTR [bp-28],0	;whichcarr
; Line 755
$I1529:
	mov	ax,WORD PTR [bp+4]	;reqcat
	mov	WORD PTR [bp-26],ax	;cat
; Line 756
	cmp	WORD PTR [bp+6],-1	;planenum
	jne	$I1531
; Line 757
	mov	ax,WORD PTR _whichourcarr
	jmp	SHORT $L20044
$I1531:
; Line 759
	mov	ax,40
	imul	WORD PTR [bp+6]	;planenum
	mov	bx,ax
	mov	ax,-1
	sub	ax,WORD PTR _ps[bx]
$L20044:
	mov	WORD PTR [bp-30],ax	;basenum
; Line 761
	mov	ax,WORD PTR _whichourcarr
	cmp	WORD PTR [bp-30],ax	;basenum
	je	$I1533
; Line 762
	mov	WORD PTR [bp-26],-1	;cat
; Line 764
	mov	es,WORD PTR $T20002
	mov	ax,WORD PTR es:_carrier+20
	mov	WORD PTR [bp-22],ax
; Line 765
	sub	ax,ax
	mov	WORD PTR [bp-24],ax	;V
	jmp	SHORT $L20045
	nop	
$I1533:
	cmp	WORD PTR [bp-26],0	;cat
	jl	$I1535
; Line 768
	cmp	WORD PTR [bp-26],4	;cat
	jl	$I1536
; Line 769
	mov	ax,100
	mov	si,WORD PTR [bp-28]	;whichcarr
	shl	si,1
	imul	WORD PTR [bp-36][si]
	mov	WORD PTR [bp-24],ax	;V
; Line 770
	mov	es,WORD PTR $T20002
	mov	ax,WORD PTR es:_carrier+20
	mov	WORD PTR [bp-22],ax
; Line 771
	mov	ax,100
	imul	WORD PTR [bp-42][si]
	jmp	SHORT $L20045
	nop	
$I1536:
; Line 774
	mov	es,WORD PTR $T20002
	mov	bx,WORD PTR [bp-26]	;cat
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR es:_carrier[bx+24]
	mov	WORD PTR [bp-24],ax	;V
; Line 775
	mov	ax,WORD PTR es:_carrier+20
	mov	WORD PTR [bp-22],ax
; Line 776
	mov	ax,WORD PTR es:_carrier[bx+28]
	add	ax,350
	jmp	SHORT $L20045
$I1535:
; Line 780
	mov	cl,3
	mov	bx,WORD PTR [bp+6]	;planenum
	shl	bx,cl
	mov	ax,WORD PTR _ailoc[bx]
	mov	WORD PTR [bp-24],ax	;V
; Line 781
	mov	es,WORD PTR $T20002
	mov	ax,WORD PTR es:_carrier+20
	mov	WORD PTR [bp-22],ax
; Line 782
	mov	ax,WORD PTR _ailoc[bx+4]
$L20045:
	mov	WORD PTR [bp-20],ax
; Line 783
; Line 785
	lea	ax,WORD PTR [bp-60]	;M
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	push	WORD PTR es:_carrier+12
	call	_MakeMatHPR
	add	sp,8
; Line 786
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	lea	cx,WORD PTR [bp-60]	;M
	push	cx
	call	_Trans3x3
	add	sp,4
; Line 787
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	lea	ax,WORD PTR [bp-24]	;V
	push	ax
	call	_Rotate
	add	sp,4
; Line 790
	cmp	WORD PTR [bp+6],-1	;planenum
	jne	$I1539
; Line 791
	mov	ax,1
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
$I1539:
	mov	ax,WORD PTR _whichourcarr
	cmp	WORD PTR [bp-30],ax	;basenum
	je	$JCC5510
	jmp	$I1542
$JCC5510:
; Line 810
	cmp	WORD PTR [bp-26],0	;cat
	jl	$I1543
; Line 811
	mov	ax,WORD PTR [bp-24]	;V
	cwd	
	mov	es,WORD PTR $T20002
	add	ax,WORD PTR es:_carrier
	adc	dx,WORD PTR es:_carrier+2
	mov	cl,3
	mov	bx,WORD PTR [bp+6]	;planenum
	shl	bx,cl
	mov	WORD PTR _ailoc[bx],ax
	mov	WORD PTR _ailoc[bx+2],dx
; Line 812
	mov	ax,WORD PTR [bp-20]
	cwd	
	add	ax,WORD PTR es:_carrier+8
	adc	dx,WORD PTR es:_carrier+10
	mov	WORD PTR _ailoc[bx+4],ax
	mov	WORD PTR _ailoc[bx+6],dx
; Line 813
	push	WORD PTR [bp-26]	;cat
	call	_GetCatHeading
	add	sp,2
	jmp	SHORT $L20046
	nop	
$I1543:
	cmp	WORD PTR [bp-26],-5	;cat
	jne	$I1545
; Line 816
	mov	cl,3
	mov	bx,WORD PTR [bp+6]	;planenum
	shl	bx,cl
	cmp	WORD PTR _ailoc[bx],0
	jle	$I1546
; Line 817
	mov	ax,2
	push	ax
	call	_GetCatHeading
	add	sp,2
	sub	ax,16384
	jmp	SHORT $L20046
	nop	
$I1546:
; Line 820
	mov	ax,2
	push	ax
	call	_GetCatHeading
	add	sp,2
	add	ah,64
$L20046:
	mov	cx,ax
	mov	ax,40
	imul	WORD PTR [bp+6]	;planenum
	mov	bx,ax
	mov	WORD PTR _ps[bx+16],cx
; Line 821
; Line 822
; Line 823
$I1545:
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-24]	;V
	cwd	
	mov	es,WORD PTR $T20002
	add	ax,WORD PTR es:_carrier
	adc	dx,WORD PTR es:_carrier+2
	push	dx
	push	ax
	call	__aNldiv
	mov	cx,ax
	mov	ax,40
	mov	bx,dx
	imul	WORD PTR [bp+6]	;planenum
	mov	si,ax
	mov	WORD PTR _ps[si+8],cx
	mov	WORD PTR _ps[si+10],bx
; Line 824
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-20]
	cwd	
	mov	es,WORD PTR $T20002
	add	ax,WORD PTR es:_carrier+8
	adc	dx,WORD PTR es:_carrier+10
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR _ps[si+12],ax
	mov	WORD PTR _ps[si+14],dx
; Line 825
	mov	ax,WORD PTR _ps[si+8]
	mov	dx,WORD PTR _ps[si+10]
	add	ax,16
	adc	dx,0
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	mov	WORD PTR _ps[si+2],ax
; Line 826
	mov	ax,WORD PTR _ps[si+12]
	mov	dx,WORD PTR _ps[si+14]
	add	ax,16
	adc	dx,0
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	mov	WORD PTR _ps[si+4],ax
; Line 829
	sub	ax,ax
	mov	WORD PTR _ps[si+18],ax
	mov	WORD PTR _ps[si+20],ax
; Line 830
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+22
	push	WORD PTR es:_carrier+20
	call	__aNldiv
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	inc	ax
	inc	ax
	mov	WORD PTR _ps[si+6],ax
; Line 831
; Line 832
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
$I1542:
; Line 833
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-24]	;V
	cwd	
	mov	cl,3
	mov	bx,WORD PTR [bp-30]	;basenum
	shl	bx,cl
	add	ax,WORD PTR _ailoc[bx]
	adc	dx,WORD PTR _ailoc[bx+2]
	push	dx
	push	ax
	mov	si,bx
	call	__aNldiv
	mov	cx,ax
	mov	ax,40
	mov	bx,dx
	imul	WORD PTR [bp+6]	;planenum
	mov	di,ax
	mov	WORD PTR _ps[di+8],cx
	mov	WORD PTR _ps[di+10],bx
; Line 834
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-20]
	cwd	
	add	ax,WORD PTR _ailoc[si+4]
	adc	dx,WORD PTR _ailoc[si+6]
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR _ps[di+12],ax
	mov	WORD PTR _ps[di+14],dx
; Line 835
	mov	ax,WORD PTR _ps[di+8]
	mov	dx,WORD PTR _ps[di+10]
	add	ax,16
	adc	dx,0
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	mov	WORD PTR _ps[di+2],ax
; Line 836
	mov	ax,WORD PTR _ps[di+12]
	mov	dx,WORD PTR _ps[di+14]
	add	ax,16
	adc	dx,0
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	mov	WORD PTR _ps[di+4],ax
; Line 837
	mov	ax,40
	imul	WORD PTR [bp-30]	;basenum
	mov	bx,ax
	mov	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR _ps[di+16],ax
; Line 840
	sub	ax,ax
	mov	WORD PTR _ps[di+18],ax
	mov	WORD PTR _ps[di+20],ax
; Line 841
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+22
	push	WORD PTR es:_carrier+20
	call	__aNldiv
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	inc	ax
	inc	ax
	mov	WORD PTR _ps[di+6],ax
; Line 842
; Line 843
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_KeepPlaneOnCarrier	ENDP
; Line 870
	PUBLIC	_ils
_ils	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
;	x = -6
;	y = -8
;	radius = -4
;	dx = -10
;	dz = -12
;	ang = -2
;	color = 10
;	oy = 8
;	ox = 6
;	rp = 4
; Line 875
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	mov	cx,WORD PTR es:_carrier+128
	mov	bx,WORD PTR es:_carrier+130
	add	cx,WORD PTR es:_carrier
	adc	bx,WORD PTR es:_carrier+2
	push	bx
	push	cx
	call	__aNldiv
	sub	ax,WORD PTR _PxLng
	mov	WORD PTR [bp-10],ax	;dx
; Line 878
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	mov	ax,WORD PTR es:_carrier+8
	mov	dx,WORD PTR es:_carrier+10
	add	ax,WORD PTR es:_carrier+132
	adc	dx,WORD PTR es:_carrier+134
	push	dx
	push	ax
	call	__aNldiv
	add	ax,WORD PTR _PyLng
	push	ax
	call	_abs
	add	sp,2
	push	ax
	push	WORD PTR [bp-10]	;dx
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-2],ax	;ang
; Line 883
	mov	ax,WORD PTR _OurHead
	sub	ax,WORD PTR [bp-2]	;ang
	mov	cx,50
	cwd	
	idiv	cx
; Line 885
	push	WORD PTR [bp+10]	;color
	mov	cx,WORD PTR [bp+8]	;oy
	add	cx,15
	push	cx
	sub	ax,WORD PTR [bp+6]	;ox
	neg	ax
	push	ax
	mov	cx,WORD PTR [bp+8]	;oy
	sub	cx,15
	push	cx
	push	ax
	push	WORD PTR [bp+4]	;rp
	call	FAR PTR _DrawLine
; Line 886
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ils	ENDP
; Line 890
	PUBLIC	_vdiils
_vdiils	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,14
	call	__aNchkstk
	push	di
	push	si
;	x = -6
;	y = -8
;	radius = -4
;	dx = -10
;	dz = -12
;	ang = -2
;	color = 10
;	oy = 8
;	ox = 6
;	rp = 4
; Line 895
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	mov	cx,WORD PTR es:_carrier+128
	mov	bx,WORD PTR es:_carrier+130
	add	cx,WORD PTR es:_carrier
	adc	bx,WORD PTR es:_carrier+2
	push	bx
	push	cx
	call	__aNldiv
	sub	ax,WORD PTR _PxLng
	mov	WORD PTR [bp-10],ax	;dx
; Line 898
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	mov	ax,WORD PTR es:_carrier+8
	mov	dx,WORD PTR es:_carrier+10
	add	ax,WORD PTR es:_carrier+132
	adc	dx,WORD PTR es:_carrier+134
	push	dx
	push	ax
	call	__aNldiv
	add	ax,WORD PTR _PyLng
	push	ax
	call	_abs
	add	sp,2
	push	ax
	push	WORD PTR [bp-10]	;dx
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-2],ax	;ang
; Line 903
	mov	ax,WORD PTR _OurHead
	sub	ax,WORD PTR [bp-2]	;ang
	mov	cx,50
	cwd	
	idiv	cx
	mov	WORD PTR [bp-6],ax	;x
; Line 905
	push	WORD PTR [bp+10]	;color
	mov	cx,WORD PTR [bp+8]	;oy
	add	cx,15
	push	cx
	sub	ax,WORD PTR [bp+6]	;ox
	neg	ax
	push	ax
	mov	dx,WORD PTR [bp+8]	;oy
	sub	dx,15
	push	dx
	push	ax
	push	WORD PTR [bp+4]	;rp
	mov	si,cx
	mov	di,dx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 906
	push	WORD PTR [bp+10]	;color
	push	si
	mov	ax,WORD PTR [bp+6]	;ox
	sub	ax,WORD PTR [bp-6]	;x
	mov	cx,ax
	dec	ax
	push	ax
	push	di
	push	ax
	push	WORD PTR [bp+4]	;rp
	mov	WORD PTR [bp-14],cx
	call	FAR PTR _DrawLine
	add	sp,12
; Line 907
	push	WORD PTR [bp+10]	;color
	push	si
	mov	ax,WORD PTR [bp-14]
	inc	ax
	push	ax
	push	di
	push	ax
	push	WORD PTR [bp+4]	;rp
	call	FAR PTR _DrawLine
	add	sp,12
; Line 908
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_vdiils	ENDP
; Line 916
	PUBLIC	_OnTheDeck
_OnTheDeck	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,58
	call	__aNchkstk
;	V = -24
;	V2 = -30
;	M = -58
;	TM = -18
;	x1 = -34
;	x2 = -36
;	z1 = -38
;	z2 = -40
;	i = -32
;	Z = 12
;	Y = 8
;	X = 4
; Line 924
	mov	ax,WORD PTR [bp+4]	;X
	mov	dx,WORD PTR [bp+6]
	mov	es,WORD PTR $T20002
	sub	ax,WORD PTR es:_carrier
	sbb	dx,WORD PTR es:_carrier+2
	push	dx
	push	ax
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$L20017
	jl	$L20015
	cmp	ax,-15536
	ja	$L20017
$L20015:
	mov	ax,WORD PTR [bp+12]	;Z
	mov	dx,WORD PTR [bp+14]
	mov	es,WORD PTR $T20002
	sub	ax,WORD PTR es:_carrier+8
	sbb	dx,WORD PTR es:_carrier+10
	push	dx
	push	ax
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$L20017
	jl	$L20016
	cmp	ax,-15536
	ja	$L20017
$L20016:
	cmp	WORD PTR [bp+10],0
	jl	$I1589
	jg	$L20017
	cmp	WORD PTR [bp+8],12000	;Y
	jbe	$I1589
$L20017:
; Line 925
	sub	ax,ax
	jmp	$EX1579
; Line 927
	nop	
$I1589:
	mov	ax,10
	cwd	
	push	dx
	push	ax
	mov	cx,WORD PTR [bp+4]	;X
	mov	bx,WORD PTR [bp+6]
	mov	es,WORD PTR $T20002
	sub	cx,WORD PTR es:_carrier
	sbb	bx,WORD PTR es:_carrier+2
	push	bx
	push	cx
	call	__aNldiv
	mov	WORD PTR [bp-24],ax	;V
; Line 928
	mov	ax,10
	cwd	
	push	dx
	push	ax
	mov	cx,WORD PTR [bp+12]	;Z
	mov	bx,WORD PTR [bp+14]
	mov	es,WORD PTR $T20002
	sub	cx,WORD PTR es:_carrier+8
	sbb	bx,WORD PTR es:_carrier+10
	push	bx
	push	cx
	call	__aNldiv
	mov	WORD PTR [bp-20],ax
; Line 930
	lea	ax,WORD PTR [bp-58]	;M
	push	ax
	sub	cx,cx
	mov	WORD PTR [bp-22],cx
	push	cx
	push	cx
	mov	es,WORD PTR $T20002
	mov	dx,WORD PTR es:_carrier+12
	neg	dx
	push	dx
	call	_MakeMatHPR
	add	sp,8
; Line 931
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	lea	cx,WORD PTR [bp-58]	;M
	push	cx
	call	_Trans3x3
	add	sp,4
; Line 932
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	lea	ax,WORD PTR [bp-24]	;V
	push	ax
	call	_Rotate
	add	sp,4
; Line 935
	mov	ax,10
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+206
	push	WORD PTR es:_carrier+204
	call	__aNldiv
	push	ax
	mov	ax,10
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+202
	push	WORD PTR es:_carrier+200
	call	__aNldiv
	push	ax
	mov	ax,10
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+198
	push	WORD PTR es:_carrier+196
	call	__aNldiv
	push	ax
	mov	ax,10
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+194
	push	WORD PTR es:_carrier+192
	call	__aNldiv
	push	ax
	push	WORD PTR [bp-20]
	push	WORD PTR [bp-24]	;V
	call	_InBox
	add	sp,12
	or	ax,ax
	je	$I1591
; Line 936
; Line 937
	mov	ax,-1
	mov	sp,bp
	pop	bp
	ret	
; Line 938
; Line 939
$I1591:
	cmp	WORD PTR [bp+10],0
	jl	$I1592
	jle	$JCC6834
	jmp	$L20017
$JCC6834:
	cmp	WORD PTR [bp+8],7100	;Y
	jb	$JCC6844
	jmp	$L20017
$JCC6844:
; Line 941
$I1592:
; Line 942
	mov	ax,10
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+174
	push	WORD PTR es:_carrier+172
	call	__aNldiv
	push	ax
	mov	ax,10
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+170
	push	WORD PTR es:_carrier+168
	call	__aNldiv
	push	ax
	mov	ax,10
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+166
	push	WORD PTR es:_carrier+164
	call	__aNldiv
	push	ax
	mov	ax,10
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+162
	push	WORD PTR es:_carrier+160
	call	__aNldiv
	push	ax
	push	WORD PTR [bp-20]
	push	WORD PTR [bp-24]	;V
	call	_InBox
	add	sp,12
	or	ax,ax
	jne	$JCC6959
	jmp	$L20017
$JCC6959:
; Line 943
; Line 947
	mov	ax,-10
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+66
	push	WORD PTR es:_carrier+64
	call	__aNldiv
	add	WORD PTR [bp-24],ax	;V
; Line 948
	mov	ax,-10
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+70
	push	WORD PTR es:_carrier+68
	call	__aNldiv
	add	WORD PTR [bp-20],ax
; Line 949
	lea	ax,WORD PTR [bp-58]	;M
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+18
	call	_MakeMatHPR
	add	sp,8
; Line 950
	lea	ax,WORD PTR [bp-58]	;M
	push	ax
	lea	ax,WORD PTR [bp-24]	;V
	push	ax
	call	_Rotate
	add	sp,4
; Line 951
	mov	WORD PTR [bp-36],200	;x2
; Line 952
	mov	WORD PTR [bp-40],120	;z2
; Line 956
	sub	ax,ax
	push	ax
	mov	cx,800
	push	cx
	mov	cx,-480
	push	cx
	push	ax
	push	WORD PTR [bp-20]
	push	WORD PTR [bp-24]	;V
	call	_InBox
	add	sp,12
	or	ax,ax
	je	$I1594
	cmp	WORD PTR _HookDown,0
	je	$I1594
	mov	ax,WORD PTR _OurHead
	mov	es,WORD PTR $T20002
	sub	ax,WORD PTR es:_carrier+12
	sub	ax,WORD PTR es:_carrier+18
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,3640
	jge	$I1594
; Line 957
; Line 958
	cmp	WORD PTR [bp-20],-120
	jle	$I1595
	mov	ax,2
	mov	sp,bp
	pop	bp
	ret	
; Line 959
$I1595:
	mov	ax,WORD PTR [bp-40]	;z2
	shl	ax,1
	neg	ax
	cmp	ax,WORD PTR [bp-20]
	jge	$I1596
	mov	ax,3
	mov	sp,bp
	pop	bp
	ret	
; Line 960
	nop	
$I1596:
	mov	ax,WORD PTR [bp-40]	;z2
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	neg	ax
	cmp	ax,WORD PTR [bp-20]
	jge	$I1597
	mov	ax,4
	mov	sp,bp
	pop	bp
	ret	
; Line 961
	nop	
$I1597:
	mov	ax,5
	mov	sp,bp
	pop	bp
	ret	
; Line 962
; Line 963
	nop	
$I1594:
	mov	ax,1
$EX1579:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_OnTheDeck	ENDP
; Line 969
	PUBLIC	_SetPosOnCat
_SetPosOnCat	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,42
	call	__aNchkstk
;	V = -24
;	M = -42
;	TM = -18
;	Length = 12
;	Cat = 10
;	Z = 8
;	Y = 6
;	X = 4
; Line 977
	sub	ax,ax
	mov	WORD PTR [bp-24],ax	;V
	mov	WORD PTR [bp-22],ax
	mov	WORD PTR [bp-20],ax
; Line 978
	cmp	WORD PTR [bp+12],1	;Length
	jle	$I1608
; Line 979
	mov	ax,WORD PTR [bp+12]	;Length
	neg	ax
	mov	WORD PTR [bp-20],ax
; Line 980
	lea	ax,WORD PTR [bp-42]	;M
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	mov	es,WORD PTR $T20002
	mov	bx,WORD PTR [bp+10]	;Cat
	mov	cx,bx
	shl	bx,1
	shl	bx,1
	add	bx,cx
	shl	bx,1
	mov	cx,WORD PTR es:_carrier[bx+32]
	neg	cx
	push	cx
	call	_MakeMatHPR
	add	sp,8
; Line 981
	lea	ax,WORD PTR [bp-42]	;M
	push	ax
	lea	ax,WORD PTR [bp-24]	;V
	push	ax
	call	_Rotate
	add	sp,4
; Line 982
; Line 983
$I1608:
	mov	es,WORD PTR $T20002
	mov	bx,WORD PTR [bp+10]	;Cat
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR es:_carrier[bx+24]
	add	WORD PTR [bp-24],ax	;V
; Line 984
	mov	ax,WORD PTR es:_carrier+20
	add	WORD PTR [bp-22],ax
; Line 985
	mov	ax,WORD PTR es:_carrier[bx+28]
	add	ax,350
	add	WORD PTR [bp-20],ax
; Line 986
	lea	ax,WORD PTR [bp-42]	;M
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	push	WORD PTR es:_carrier+12
	call	_MakeMatHPR
	add	sp,8
; Line 987
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	lea	cx,WORD PTR [bp-42]	;M
	push	cx
	call	_Trans3x3
	add	sp,4
; Line 988
	lea	ax,WORD PTR [bp-18]	;TM
	push	ax
	lea	ax,WORD PTR [bp-24]	;V
	push	ax
	call	_Rotate
; Line 992
	mov	ax,WORD PTR [bp-24]	;V
	cwd	
	mov	es,WORD PTR $T20002
	add	ax,WORD PTR es:_carrier
	adc	dx,WORD PTR es:_carrier+2
	mov	bx,WORD PTR [bp+4]	;X
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
; Line 993
	mov	ax,WORD PTR [bp-22]
	cwd	
	mov	bx,WORD PTR [bp+6]	;Y
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
; Line 994
	mov	ax,WORD PTR [bp-20]
	cwd	
	add	ax,WORD PTR es:_carrier+8
	adc	dx,WORD PTR es:_carrier+10
	mov	bx,WORD PTR [bp+8]	;Z
	mov	WORD PTR [bx],ax
	mov	WORD PTR [bx+2],dx
; Line 995
	mov	sp,bp
	pop	bp
	ret	

_SetPosOnCat	ENDP
; Line 1004
	PUBLIC	_DoPlayerOnTheCat
_DoPlayerOnTheCat	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,12
	call	__aNchkstk
;	X = -4
;	Y = -8
;	Z = -12
; Line 1027
	mov	WORD PTR _HorzHeave,0
; Line 1028
	mov	ax,WORD PTR _View
	cmp	ax,203
	je	$SC1623
	jg	$L20019
	cmp	ax,72
	jg	$L20020
	cmp	ax,70
	jge	$SC1623
	or	ax,ax
	jl	$SB1620
	sub	ax,5
	jg	$SB1620
; Line 1029
; Line 1030
$SC1623:
; Line 1043
	cmp	WORD PTR _ONTHECAT,0
	jne	$I1625
	cmp	WORD PTR _ONTHEHOOK,0
	je	$SB1620
$I1625:
; Line 1044
	mov	ax,WORD PTR _Heaving
	inc	ax
	inc	ax
$L20048:
	mov	WORD PTR _HorzHeave,ax
; Line 1045
$SB1620:
; Line 1056
	cmp	WORD PTR _ONTHECAT,0
	jne	$I1628
; Line 1057
; Line 1058
	call	_DoPlayerOnTheHook
; Line 1059
	mov	sp,bp
	pop	bp
	ret	
; Line 1046
$SC1626:
; Line 1048
	mov	ax,WORD PTR _Heaving
	jmp	SHORT $L20048
	nop	
$L20020:
	sub	ax,201
	je	$SC1623
	dec	ax
	jmp	SHORT $SB1620
$L20019:
	sub	ax,204
	je	$SB1620
	dec	ax
	je	$SC1623
	dec	ax
	je	$SB1620
	dec	ax
	jl	$SB1620
	dec	ax
	jle	$SC1626
	jmp	SHORT $SB1620
; Line 1060
; Line 1062
	nop	
$I1628:
	cmp	WORD PTR _ONTHECAT,1
	jne	$I1630
; Line 1063
; Line 1065
	mov	WORD PTR _OurPitch,-182
; Line 1066
	sub	ax,ax
	mov	WORD PTR _CATVEL,ax
	mov	WORD PTR _Knots,ax
	mov	WORD PTR _AirSpeed,ax
; Line 1067
	cmp	WORD PTR _ThrustI,100
	jl	$I1632
	mov	WORD PTR _ONTHECAT,2
; Line 1068
; Line 1069
	jmp	SHORT $I1632
	nop	
$I1630:
; Line 1070
; Line 1073
	mov	ax,30
	imul	WORD PTR _Fticks
	add	WORD PTR _CATVEL,ax
	mov	ax,WORD PTR _CATVEL
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	cl,4
	shl	ax,cl
	mov	WORD PTR _AirSpeed,ax
; Line 1078
	mov	ax,WORD PTR _CATVEL
	mov	cx,60
	cwd	
	idiv	cx
	imul	WORD PTR _Fticks
	add	WORD PTR _ONTHECAT,ax
	mov	ax,WORD PTR _ONTHECAT
	and	ax,2040
	mov	cl,3
	sar	ax,cl
	sub	ax,546
	mov	WORD PTR _OurPitch,ax
; Line 1080
$I1632:
; Line 1082
	push	WORD PTR _ONTHECAT
	push	WORD PTR _PlayerCat
	lea	ax,WORD PTR [bp-12]	;Z
	push	ax
	lea	cx,WORD PTR [bp-8]	;Y
	push	cx
	lea	dx,WORD PTR [bp-4]	;X
	push	dx
	call	_SetPosOnCat
	add	sp,10
; Line 1083
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-6]
	push	WORD PTR [bp-8]	;Y
	call	__aNldiv
	mov	WORD PTR _OurAlt,ax
; Line 1084
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;X
	call	__aNldiv
	mov	WORD PTR _PxLng,ax
	mov	WORD PTR _PxLng+2,dx
; Line 1085
	mov	ax,-100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-10]
	push	WORD PTR [bp-12]	;Z
	call	__aNldiv
	add	ax,0
	adc	dx,16
	mov	WORD PTR _PyLng,ax
	mov	WORD PTR _PyLng+2,dx
; Line 1086
	push	WORD PTR _PlayerCat
	call	_GetCatHeading
	add	sp,2
	mov	WORD PTR _OurHead,ax
; Line 1087
	call	_InitScottFlight
; Line 1088
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+22
	push	WORD PTR es:_carrier+20
	call	__aNldiv
	mov	WORD PTR _MinAlt,ax
; Line 1089
	mov	ax,WORD PTR _OurAlt
	mov	WORD PTR _RadarAlt,ax
	mov	WORD PTR _RadarAlt+2,0
; Line 1090
	shr	ax,1
	shr	ax,1
	mov	WORD PTR _Alt,ax
; Line 1092
	cmp	WORD PTR _ONTHECAT,8900
	jle	$I1633
; Line 1093
	sub	ax,ax
	mov	WORD PTR _Heaving,ax
	mov	WORD PTR _ONTHECAT,ax
; Line 1094
	mov	ax,-1
	push	ax
	push	WORD PTR _PlayerCat
	call	_PlaneLaunched
	add	sp,4
; Line 1095
	mov	ax,-1
	push	ax
	call	_GetNextLaunch
	add	sp,2
; Line 1097
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	mov	ax,-999
	mov	WORD PTR _PlayerCat,ax
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
	mov	ax,32
	push	ax
	call	_LogIt
; Line 1098
; Line 1101
$I1633:
	mov	ax,WORD PTR _ONTHECAT
	mov	WORD PTR _DEBUG1,ax
; Line 1102
	mov	sp,bp
	pop	bp
	ret	

_DoPlayerOnTheCat	ENDP
; Line 1116
	PUBLIC	_DoPlayerOnTheHook
_DoPlayerOnTheHook	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,38
	call	__aNchkstk
	push	di
	push	si
;	V = -16
;	M = -34
;	D = -10
;	WX = -38
;	WY = -4
;	WZ = -8
; Line 1122
	cmp	WORD PTR _ONTHEHOOK,0
	jne	$I1652
; Line 1123
; Line 1124
	mov	WORD PTR [bp-10],36	;D
	jmp	SHORT $F1653
	nop	
$FC1654:
	inc	WORD PTR [bp-10]	;D
$F1653:
	cmp	WORD PTR [bp-10],48	;D
	jl	$JCC7949
	jmp	$I1663
$JCC7949:
; Line 1125
	mov	bx,WORD PTR [bp-10]	;D
	shl	bx,1
	mov	WORD PTR _CarrierAnimVals[bx],0
	jmp	SHORT $FC1654
	nop	
$I1652:
	cmp	WORD PTR _TimeOnHook,0
	jne	$I1656
; Line 1131
; Line 1132
	mov	WORD PTR _LandingVel,600
; Line 1133
	mov	ax,WORD PTR _OurHead
	mov	WORD PTR _LandingAngle,ax
; Line 1134
	mov	ax,WORD PTR _FPARAMS
	mov	dx,WORD PTR _FPARAMS+2
	mov	es,WORD PTR $T20002
	sub	ax,WORD PTR es:_carrier
	sbb	dx,WORD PTR es:_carrier+2
	mov	WORD PTR _XSpot,ax
	mov	WORD PTR _XSpot+2,dx
; Line 1135
	mov	ax,WORD PTR _FPARAMS+8
	mov	dx,WORD PTR _FPARAMS+10
	sub	ax,WORD PTR es:_carrier+8
	sbb	dx,WORD PTR es:_carrier+10
	mov	WORD PTR _ZSpot,ax
	mov	WORD PTR _ZSpot+2,dx
; Line 1136
; Line 1138
$I1656:
	cmp	WORD PTR _TimeOnHook,1200
	jg	$I1658
	cmp	WORD PTR _TimeOnHook,180
	jle	$I1657
	cmp	WORD PTR _THRUST,0
	jne	$I1657
$I1658:
; Line 1140
	sub	ax,ax
	push	ax
	call	_EndGame
	add	sp,2
; Line 1142
$I1657:
; Line 1145
	mov	ax,30
	push	ax
	push	WORD PTR _Fticks
	mov	cx,WORD PTR _Fticks
	add	WORD PTR _TimeOnHook,cx
	cmp	WORD PTR _TimeOnHook,100
	jl	$L20021
	sub	ax,ax
	jmp	SHORT $L20022
$L20021:
	mov	ax,-900
$L20022:
	sub	ax,WORD PTR _OurPitch
	neg	ax
	push	ax
	call	_MulDiv
	add	sp,6
	sub	WORD PTR _OurPitch,ax
; Line 1146
	mov	WORD PTR _OurRoll,0
; Line 1149
	mov	es,WORD PTR $T20002
	mov	ax,WORD PTR es:_carrier+18
	add	ax,WORD PTR es:_carrier+12
	mov	WORD PTR [bp-10],ax	;D
; Line 1150
	mov	cx,30
	push	cx
	push	WORD PTR _Fticks
	sub	ax,WORD PTR _OurHead
	neg	ax
	push	ax
	call	_MulDiv
	add	sp,6
	sub	WORD PTR _OurHead,ax
; Line 1151
	mov	ax,240
	push	ax
	push	WORD PTR _Fticks
	mov	cx,400
	push	cx
	call	_MulDiv
	add	sp,6
	sub	WORD PTR _LandingVel,ax
; Line 1152
	cmp	WORD PTR _LandingVel,240
	jge	$I1661
	mov	WORD PTR _LandingVel,0
; Line 1154
$I1661:
	lea	ax,WORD PTR [bp-34]	;M
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	push	WORD PTR _OurHead
	call	_MakeMatHPR
	add	sp,8
; Line 1155
	sub	ax,ax
	mov	WORD PTR [bp-14],ax
	mov	WORD PTR [bp-16],ax	;V
; Line 1156
	mov	ax,WORD PTR _LandingVel
	neg	ax
	mov	WORD PTR [bp-12],ax
; Line 1157
	lea	ax,WORD PTR [bp-34]	;M
	push	ax
	lea	cx,WORD PTR [bp-16]	;V
	push	cx
	call	_Rotate
	add	sp,4
; Line 1158
	mov	ax,60
	push	ax
	push	WORD PTR _Fticks
	push	WORD PTR [bp-16]	;V
	call	_MulDiv
	add	sp,6
	cwd	
	add	WORD PTR _XSpot,ax
	adc	WORD PTR _XSpot+2,dx
; Line 1159
	mov	ax,60
	push	ax
	push	WORD PTR _Fticks
	push	WORD PTR [bp-12]
	call	_MulDiv
	add	sp,6
	cwd	
	add	WORD PTR _ZSpot,ax
	adc	WORD PTR _ZSpot+2,dx
; Line 1160
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	mov	cx,WORD PTR es:_carrier
	mov	bx,WORD PTR es:_carrier+2
	add	cx,WORD PTR _XSpot
	adc	bx,WORD PTR _XSpot+2
	push	bx
	push	cx
	call	__aNldiv
	mov	WORD PTR _PxLng,ax
	mov	WORD PTR _PxLng+2,dx
; Line 1161
	mov	ax,-100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	mov	ax,WORD PTR es:_carrier+8
	mov	dx,WORD PTR es:_carrier+10
	add	ax,WORD PTR _ZSpot
	adc	dx,WORD PTR _ZSpot+2
	push	dx
	push	ax
	call	__aNldiv
	add	ax,0
	adc	dx,16
	mov	WORD PTR _PyLng,ax
	mov	WORD PTR _PyLng+2,dx
; Line 1164
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+22
	push	WORD PTR es:_carrier+20
	call	__aNldiv
	mov	WORD PTR _OurAlt,ax
	mov	WORD PTR _MinAlt,ax
; Line 1165
	mov	WORD PTR _RadarAlt,ax
	mov	WORD PTR _RadarAlt+2,0
; Line 1166
	shr	ax,1
	shr	ax,1
	mov	WORD PTR _Alt,ax
; Line 1167
	mov	ax,WORD PTR _LandingVel
	mov	WORD PTR _AirSpeed,ax
; Line 1171
	mov	WORD PTR [bp-16],0	;V
; Line 1172
	mov	WORD PTR [bp-14],2
; Line 1173
	mov	WORD PTR [bp-12],25
; Line 1174
	lea	ax,WORD PTR [bp-34]	;M
	push	ax
	lea	ax,WORD PTR [bp-16]	;V
	push	ax
	call	_Rotate
	add	sp,4
; Line 1175
	mov	ax,25
	cwd	
	push	dx
	push	ax
	mov	ax,24
	imul	WORD PTR _ONTHEHOOK
	mov	bx,ax
	mov	es,WORD PTR $T20002
	mov	ax,WORD PTR _ZSpot
	mov	dx,WORD PTR _ZSpot+2
	sub	ax,WORD PTR es:_carrier[bx+60]
	sbb	dx,WORD PTR es:_carrier[bx+62]
	push	dx
	push	ax
	mov	si,bx
	call	__aNldiv
	add	ax,WORD PTR [bp-12]
	cwd	
	mov	WORD PTR [bp-8],ax	;WZ
	mov	WORD PTR [bp-6],dx
; Line 1176
	mov	cx,25
	sub	bx,bx
	push	bx
	push	cx
	mov	cx,WORD PTR _XSpot
	mov	bx,WORD PTR _XSpot+2
	mov	es,WORD PTR $T20002
	sub	cx,WORD PTR es:_carrier[si+56]
	sbb	bx,WORD PTR es:_carrier[si+58]
	push	bx
	push	cx
	mov	si,ax
	mov	di,dx
	call	__aNldiv
	sub	ax,WORD PTR [bp-16]	;V
	cwd	
	mov	WORD PTR [bp-38],ax	;WX
	mov	WORD PTR [bp-36],dx
; Line 1177
	mov	ax,WORD PTR [bp-14]
	cwd	
	mov	WORD PTR [bp-4],ax	;WY
	mov	WORD PTR [bp-2],dx
; Line 1179
	or	di,di
	jl	$I1662
	jg	$L20023
	or	si,si
	je	$I1662
$L20023:
; Line 1180
; Line 1181
	sub	ax,ax
	mov	WORD PTR [bp-2],ax
	mov	WORD PTR [bp-4],ax	;WY
	mov	WORD PTR [bp-36],ax
	mov	WORD PTR [bp-38],ax	;WX
	mov	WORD PTR [bp-6],ax
	mov	WORD PTR [bp-8],ax	;WZ
; Line 1182
; Line 1184
$I1662:
	mov	ax,WORD PTR [bp-38]	;WX
	mov	bx,WORD PTR _ONTHEHOOK
	mov	cx,bx
	shl	bx,1
	add	bx,cx
	shl	bx,1
	mov	WORD PTR _CarrierAnimVals[bx+66],ax
; Line 1185
	mov	ax,WORD PTR [bp-4]	;WY
	mov	WORD PTR _CarrierAnimVals[bx+68],ax
; Line 1186
	mov	ax,WORD PTR [bp-8]	;WZ
	mov	WORD PTR _CarrierAnimVals[bx+70],ax
; Line 1187
	cmp	WORD PTR _AnimVals+54,1820
	jle	$I1663
; Line 1188
; Line 1190
	mov	ax,1820
	mov	WORD PTR _AnimVals+54,ax
	mov	WORD PTR _HookRot,ax
; Line 1192
; Line 1196
$I1663:
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DoPlayerOnTheHook	ENDP
; Line 1199
	PUBLIC	_SlopeCheck
_SlopeCheck	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,36
	call	__aNchkstk
;	dx = -10
;	dy = -32
;	dz = -36
;	V = -6
;	M = -28
;	DST = 22
;	DELHT = 20
;	PTCH = 18
;	HD = 16
;	Z = 12
;	Y = 8
;	X = 4
; Line 1209
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	cx,WORD PTR [bp+12]	;Z
	mov	bx,WORD PTR [bp+14]
	mov	es,WORD PTR $T20002
	sub	cx,WORD PTR es:_carrier+8
	sbb	bx,WORD PTR es:_carrier+10
	sub	cx,WORD PTR es:_carrier+132
	sbb	bx,WORD PTR es:_carrier+134
	push	bx
	push	cx
	call	__aNldiv
	mov	WORD PTR [bp-36],ax	;dz
	mov	WORD PTR [bp-34],dx
; Line 1210
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	cx,WORD PTR [bp+8]	;Y
	mov	bx,WORD PTR [bp+10]
	sub	cx,6600
	sbb	bx,0
	push	bx
	push	cx
	call	__aNldiv
	mov	WORD PTR [bp-32],ax	;dy
; Line 1212
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp+4]	;X
	mov	dx,WORD PTR [bp+6]
	mov	es,WORD PTR $T20002
	sub	ax,WORD PTR es:_carrier+128
	sbb	dx,WORD PTR es:_carrier+130
	sub	ax,WORD PTR es:_carrier
	sbb	dx,WORD PTR es:_carrier+2
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-10],ax	;dx
	push	dx
	push	ax
	call	_labs
	add	sp,4
	or	dx,dx
	jg	$L20027
	jl	$L20026
	cmp	ax,8000
	ja	$L20027
$L20026:
	push	WORD PTR [bp-34]
	push	WORD PTR [bp-36]	;dz
	call	_labs
	add	sp,4
	or	dx,dx
	jl	$I1678
	jg	$L20027
	cmp	ax,8000
	jbe	$I1678
$L20027:
; Line 1213
; Line 1214
	mov	bx,WORD PTR [bp+22]	;DST
	mov	WORD PTR [bx],32767
; Line 1215
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 1216
; Line 1217
	nop	
$I1678:
; Line 1219
	mov	cx,WORD PTR [bp-36]	;dz
; Line 1222
	push	cx
	mov	dx,WORD PTR [bp-10]	;dx
	mov	WORD PTR [bp-6],dx	;V
	push	dx
	call	_Dist2D
	add	sp,4
	mov	bx,WORD PTR [bp+22]	;DST
	mov	WORD PTR [bx],ax
; Line 1223
	push	WORD PTR [bp-36]	;dz
	push	WORD PTR [bp-6]	;V
	call	_ARCTAN
	add	sp,4
	mov	es,WORD PTR $T20002
	add	ax,WORD PTR es:_carrier+18
	mov	bx,WORD PTR [bp+16]	;HD
	mov	WORD PTR [bx],ax
; Line 1224
	mov	bx,WORD PTR [bp+22]	;DST
	mov	ax,WORD PTR [bx]
	shl	ax,1
	shl	ax,1
	push	ax
	push	WORD PTR [bp-32]	;dy
	call	_ARCTAN
	add	sp,4
	sub	ax,637
	mov	bx,WORD PTR [bp+18]	;PTCH
	mov	WORD PTR [bx],ax
; Line 1225
	mov	ax,637
	push	ax
	mov	bx,WORD PTR [bp+22]	;DST
	mov	ax,WORD PTR [bx]
	shl	ax,1
	shl	ax,1
	push	ax
	call	_ASinB
	sub	ax,WORD PTR [bp-32]	;dy
	neg	ax
	mov	bx,WORD PTR [bp+20]	;DELHT
	mov	WORD PTR [bx],ax
; Line 1227
	mov	sp,bp
	pop	bp
	ret	

_SlopeCheck	ENDP
; Line 1233
	PUBLIC	_SetGear
_SetGear	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	G = 4
; Line 1234
	cmp	WORD PTR _ejected,0
	jne	$SB1686
; Line 1235
	mov	ax,WORD PTR [bp+4]	;G
	jmp	SHORT $S1685
; Line 1236
; Line 1237
$SC1689:
; Line 1238
	test	BYTE PTR _Status,1
	je	$SB1686
; Line 1239
	cmp	WORD PTR _Knots,350
	jg	$SB1686
; Line 1240
	and	BYTE PTR _Status,254
; Line 1241
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1692
$L20049:
	push	ax
	call	_Message
	mov	sp,bp
; Line 1242
	mov	sp,bp
	pop	bp
	ret	
; Line 1243
	nop	
$SC1693:
; Line 1244
	test	BYTE PTR _Status,1
	jne	$SB1686
; Line 1245
	mov	ax,WORD PTR _Alt
	cmp	WORD PTR _MinAlt,ax
	je	$SB1686
	test	BYTE PTR _Damaged,4
	jne	$SB1686
; Line 1246
	or	BYTE PTR _Status,1
; Line 1247
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1697
	jmp	SHORT $L20049
	nop	
$S1685:
	or	ax,ax
	je	$SC1693
	dec	ax
	je	$SC1689
$SB1686:
; Line 1250
	mov	sp,bp
	pop	bp
	ret	
	nop	

_SetGear	ENDP
; Line 1252
	PUBLIC	_SetDLC
_SetDLC	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	DLC = 4
; Line 1253
	mov	ax,WORD PTR [bp+4]	;DLC
	mov	WORD PTR _DirectLiftControl,ax
; Line 1254
	mov	sp,bp
	pop	bp
	ret	

_SetDLC	ENDP
; Line 1257
	PUBLIC	_SetHook
_SetHook	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	Hook = 4
; Line 1258
	mov	ax,WORD PTR [bp+4]	;Hook
	cmp	WORD PTR _HookDown,ax
	jne	$I1704
; Line 1259
	mov	ax,1
	mov	sp,bp
	pop	bp
	ret	
; Line 1260
; Line 1262
$I1704:
; Line 1263
	mov	WORD PTR _HookDown,ax
	or	ax,ax
	je	$I1705
; Line 1264
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:$SG1706
	jmp	SHORT $L20050
$I1705:
; Line 1266
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:$SG1708
$L20050:
	push	ax
	call	_Message
; Line 1267
	mov	sp,bp
	pop	bp
	ret	
	nop	

_SetHook	ENDP
; Line 1339
	PUBLIC	_EasyLanding
_EasyLanding	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,48
	call	__aNchkstk
	push	si
;	V = -26
;	M = -48
;	TM = -20
;	H = -28
;	usedlpattern = -30
;	usedlpatstart = -2
; Line 1347
	cmp	WORD PTR _landpt,0
	jge	$JCC9151
	jmp	$I1728
$JCC9151:
; Line 1349
	cmp	WORD PTR _Night,0
	jne	$I1724
	cmp	WORD PTR _MissionWeather,2
	je	$I1724
; Line 1350
	mov	ax,OFFSET DGROUP:_LandPat
	mov	WORD PTR [bp-2],ax	;usedlpatstart
	mov	WORD PTR [bp-30],ax	;usedlpattern
; Line 1351
	jmp	SHORT $I1726
	nop	
$I1724:
; Line 1352
	mov	ax,OFFSET DGROUP:_NiteLandPat
	mov	WORD PTR [bp-2],ax	;usedlpatstart
	mov	WORD PTR [bp-30],ax	;usedlpattern
; Line 1353
	cmp	WORD PTR _landpt,4
	jle	$I1726
; Line 1354
	mov	WORD PTR _landpt,4
; Line 1355
$I1726:
; Line 1360
	sub	ax,ax
	mov	WORD PTR _TimeOnHook,ax
	mov	WORD PTR _ONTHEHOOK,ax
	mov	WORD PTR _ONTHECAT,ax
	mov	WORD PTR _WireCaught,ax
; Line 1362
	mov	ax,24
	imul	WORD PTR _landpt
	add	ax,WORD PTR [bp-2]	;usedlpatstart
	mov	WORD PTR [bp-30],ax	;usedlpattern
; Line 1369
	mov	cx,100
	sub	dx,dx
	push	dx
	push	cx
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+130
	push	WORD PTR es:_carrier+128
	mov	si,ax
	call	__aNldiv
	add	ax,WORD PTR [si]
	mov	WORD PTR [bp-26],ax	;V
; Line 1370
	mov	ax,WORD PTR [si+4]
	mov	WORD PTR [bp-24],ax
; Line 1371
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+134
	push	WORD PTR es:_carrier+132
	call	__aNldiv
	add	ax,WORD PTR [si+2]
	mov	WORD PTR [bp-22],ax
; Line 1376
	mov	es,WORD PTR $T20002
	mov	ax,WORD PTR es:_carrier+12
	mov	WORD PTR [bp-28],ax	;H
; Line 1378
	lea	cx,WORD PTR [bp-48]	;M
	push	cx
	sub	dx,dx
	push	dx
	push	dx
	push	ax
	call	_MakeMatHPR
	add	sp,8
; Line 1379
	lea	ax,WORD PTR [bp-48]	;M
	push	ax
	lea	ax,WORD PTR [bp-26]	;V
	push	ax
	call	_Rotate
	add	sp,4
; Line 1380
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+2
	push	WORD PTR es:_carrier
	call	__aNldiv
	mov	cx,ax
	mov	ax,WORD PTR [bp-26]	;V
	mov	bx,dx
	cwd	
	add	ax,cx
	adc	dx,bx
	mov	WORD PTR _PxLng,ax
	mov	WORD PTR _PxLng+2,dx
; Line 1381
	mov	ax,-100
	cwd	
	push	dx
	push	ax
	mov	es,WORD PTR $T20002
	push	WORD PTR es:_carrier+10
	push	WORD PTR es:_carrier+8
	call	__aNldiv
	mov	cx,ax
	mov	ax,WORD PTR [bp-22]
	mov	bx,dx
	cwd	
	sub	cx,ax
	sbb	bx,dx
	add	cx,0
	adc	bx,16
	mov	WORD PTR _PyLng,cx
	mov	WORD PTR _PyLng+2,bx
; Line 1382
	mov	ax,WORD PTR [bp-24]
	mov	WORD PTR _OurAlt,ax
; Line 1389
	mov	bx,WORD PTR [bp-30]	;usedlpattern
	mov	ax,WORD PTR [bx+6]
	mov	es,WORD PTR $T20002
	add	ax,WORD PTR es:_carrier+12
	neg	ax
	mov	WORD PTR _OurHead,ax
; Line 1390
	mov	ax,WORD PTR [bx+8]
	neg	ax
	mov	WORD PTR _OurPitch,ax
; Line 1391
	mov	ax,WORD PTR [bx+10]
	neg	ax
	mov	WORD PTR _OurRoll,ax
; Line 1394
	neg	WORD PTR _OurPitch
; Line 1404
	mov	ax,27
	imul	WORD PTR [bx+12]
	mov	WORD PTR _AirSpeed,ax
; Line 1405
	mov	ax,WORD PTR [bx+14]
	mov	WORD PTR _ThrustI,ax
	mov	WORD PTR _THRUST,ax
; Line 1406
	push	WORD PTR [bx+16]
	call	_SetGear
	add	sp,2
; Line 1407
	mov	bx,WORD PTR [bp-30]	;usedlpattern
	push	WORD PTR [bx+18]
	call	_SetDLC
	add	sp,2
; Line 1408
	mov	bx,WORD PTR [bp-30]	;usedlpattern
	push	WORD PTR [bx+20]
	call	_SetHook
	add	sp,2
; Line 1410
	push	WORD PTR _AirSpeed
	call	_Get1GTrim
	add	sp,2
	mov	WORD PTR _TRIM,ax
; Line 1412
	mov	WORD PTR _RUDDERVALS,0
; Line 1413
	call	_InitScottFlight
; Line 1415
	dec	WORD PTR _landpt
	jns	$I1728
	mov	WORD PTR _landpt,20
; Line 1418
$I1728:
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_EasyLanding	ENDP
; Line 1443
	PUBLIC	_DoLSO
_DoLSO	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,196
	call	__aNchkstk
;	DHEAD = -8
;	DPTCH = -4
;	DST = -180
;	DELHT = -2
;	DX = -186
;	DY = -190
;	DZ = -194
;	j = -138
;	str = -132
;	str2 = -178
;	strptr = -196
;	HT = -182
;	LFT = -6
;	CLMBRATE = -134
;	WVOFF = -10
;	i = -12
; Line 1451
	cmp	WORD PTR _ONTHEHOOK,0
	je	$JCC9578
	jmp	$I1820
$JCC9578:
	cmp	WORD PTR _ONTHECAT,0
	je	$JCC9588
	jmp	$I1820
$JCC9588:
; Line 1455
; Line 1457
	test	BYTE PTR _landingstatus,2
	jne	$JCC9598
	jmp	$I1832
$JCC9598:
; Line 1462
	lea	ax,WORD PTR [bp-180]	;DST
	push	ax
	lea	cx,WORD PTR [bp-2]	;DELHT
	push	cx
	lea	cx,WORD PTR [bp-4]	;DPTCH
	push	cx
	lea	cx,WORD PTR [bp-8]	;DHEAD
	push	cx
	push	WORD PTR _FPARAMS+10
	push	WORD PTR _FPARAMS+8
	push	WORD PTR _FPARAMS+6
	push	WORD PTR _FPARAMS+4
	push	WORD PTR _FPARAMS+2
	push	WORD PTR _FPARAMS
	call	_SlopeCheck
	add	sp,20
; Line 1464
	cmp	WORD PTR [bp-180],2000	;DST
	jl	$JCC9656
	jmp	$I1766
$JCC9656:
; Line 1465
; Line 1466
	mov	WORD PTR [bp-10],0	;WVOFF
; Line 1467
	mov	ax,637
	push	ax
	mov	ax,WORD PTR [bp-180]	;DST
	shl	ax,1
	shl	ax,1
	push	ax
	call	_ASinB
	add	sp,4
	add	ax,66
	mov	WORD PTR [bp-182],ax	;HT
; Line 1468
	push	WORD PTR [bp-8]	;DHEAD
	push	WORD PTR [bp-180]	;DST
	call	_ASinB
	add	sp,4
	mov	WORD PTR [bp-6],ax	;LFT
; Line 1469
	mov	ax,10
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+18
	push	WORD PTR _FPARAMS+16
	call	__aNldiv
	mov	WORD PTR [bp-134],ax	;CLMBRATE
; Line 1471
	cmp	WORD PTR _Knots,145
	jle	$I1767
	mov	WORD PTR [bp-10],5	;WVOFF
; Line 1472
$I1767:
	cmp	WORD PTR _Knots,125
	jge	$I1768
	mov	WORD PTR [bp-10],6	;WVOFF
; Line 1473
$I1768:
	test	BYTE PTR _Status,1
	je	$I1769
	mov	WORD PTR [bp-10],7	;WVOFF
; Line 1475
$I1769:
	cmp	WORD PTR _HookDown,0
	jne	$I1770
	mov	WORD PTR [bp-10],9	;WVOFF
; Line 1477
$I1770:
	cmp	WORD PTR [bp-180],300	;DST
	jge	$I1775
	cmp	WORD PTR [bp-180],100	;DST
	jle	$I1775
	push	WORD PTR [bp-8]	;DHEAD
	call	_abs
	add	sp,2
	cmp	ax,16384
	jge	$I1775
; Line 1478
; Line 1479
	cmp	WORD PTR [bp-6],25	;LFT
	jle	$I1772
	mov	WORD PTR [bp-10],1	;WVOFF
; Line 1480
$I1772:
	cmp	WORD PTR [bp-6],-25	;LFT
	jge	$I1773
	mov	WORD PTR [bp-10],2	;WVOFF
; Line 1481
$I1773:
	cmp	WORD PTR [bp-2],20	;DELHT
	jle	$I1774
	mov	WORD PTR [bp-10],3	;WVOFF
; Line 1482
$I1774:
	cmp	WORD PTR [bp-2],-15	;DELHT
	jge	$I1775
	mov	WORD PTR [bp-10],4	;WVOFF
; Line 1483
$I1775:
; Line 1484
	cmp	WORD PTR [bp-180],300	;DST
	jge	$JCC9857
	jmp	$I1789
$JCC9857:
; Line 1485
; Line 1486
	cmp	WORD PTR [bp-180],500	;DST
	jle	$I1777
; Line 1487
; Line 1488
	cmp	WORD PTR [bp-6],35	;LFT
	jle	$I1778
	mov	WORD PTR [bp-10],1	;WVOFF
; Line 1489
$I1778:
	cmp	WORD PTR [bp-6],-35	;LFT
	jge	$I1779
	mov	WORD PTR [bp-10],2	;WVOFF
; Line 1490
$I1779:
	cmp	WORD PTR [bp-2],40	;DELHT
	jle	$I1780
	mov	WORD PTR [bp-10],3	;WVOFF
; Line 1491
$I1780:
	cmp	WORD PTR [bp-2],-25	;DELHT
	jmp	SHORT $L20056
	nop	
$I1777:
; Line 1494
; Line 1495
	cmp	WORD PTR [bp-6],25	;LFT
	jle	$I1783
	mov	WORD PTR [bp-10],1	;WVOFF
; Line 1496
$I1783:
	cmp	WORD PTR [bp-6],-25	;LFT
	jge	$I1784
	mov	WORD PTR [bp-10],2	;WVOFF
; Line 1497
$I1784:
	cmp	WORD PTR [bp-2],20	;DELHT
	jle	$I1785
	mov	WORD PTR [bp-10],3	;WVOFF
; Line 1498
$I1785:
	cmp	WORD PTR [bp-2],-15	;DELHT
$L20056:
	jge	$I1786
	mov	WORD PTR [bp-10],4	;WVOFF
; Line 1499
$I1786:
; Line 1500
	push	WORD PTR [bp-8]	;DHEAD
	call	_abs
	add	sp,2
	cmp	ax,1820
	jg	$I1788
	push	WORD PTR [bp-4]	;DPTCH
	call	_abs
	add	sp,2
	cmp	ax,910
	jg	$I1788
	cmp	WORD PTR _Knots,160
	jle	$I1787
$I1788:
; Line 1501
; Line 1502
	mov	WORD PTR [bp-10],10	;WVOFF
; Line 1503
	mov	WORD PTR _BallCalled,0
; Line 1504
; Line 1505
	jmp	SHORT $I1789
	nop	
$I1787:
; Line 1506
; Line 1507
	mov	WORD PTR _WavedOff,0
; Line 1508
	cmp	WORD PTR _BallCalled,0
	jne	$I1790
; Line 1511
	mov	ax,67
	push	ax
	call	_Speech
	add	sp,2
; Line 1512
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1792
	push	ax
	call	_Message
	add	sp,4
; Line 1514
; Line 1515
$I1790:
	mov	WORD PTR _BallCalled,1
; Line 1516
$I1789:
; Line 1517
; Line 1519
	push	WORD PTR [bp-180]	;DST
	call	_abs
	add	sp,2
	cmp	ax,100
	jle	$I1793
	push	WORD PTR [bp-8]	;DHEAD
	call	_abs
	add	sp,2
	cmp	ax,16384
	jle	$I1793
; Line 1521
	sub	ax,ax
	mov	WORD PTR [bp-10],ax	;WVOFF
	mov	WORD PTR _BallCalled,ax
; Line 1522
; Line 1524
$I1793:
	cmp	WORD PTR [bp-10],0	;WVOFF
	je	$I1794
	cmp	WORD PTR [bp-180],300	;DST
	jge	$I1794
; Line 1525
; Line 1527
	cmp	WORD PTR _WavedOff,0
	jne	$I1795
; Line 1528
; Line 1529
	mov	ax,OFFSET DGROUP:$SG1797
	push	ax
	lea	ax,WORD PTR [bp-132]	;str
	push	ax
	call	_strcpy
	add	sp,4
; Line 1530
	mov	bx,WORD PTR [bp-10]	;WVOFF
	shl	bx,1
	push	WORD PTR _lsomsgptrs[bx]
	lea	ax,WORD PTR [bp-132]	;str
	push	ax
	call	_strcat
	add	sp,4
; Line 1531
	mov	ax,68
	push	ax
	call	_Speech
	add	sp,2
; Line 1532
	mov	ax,5
	push	ax
	lea	ax,WORD PTR [bp-132]	;str
	push	ax
	call	_Message
	add	sp,4
; Line 1534
; Line 1535
$I1795:
	mov	WORD PTR _WavedOff,1
; Line 1537
; Line 1539
$I1794:
	cmp	WORD PTR _WavedOff,0
	je	$JCC10176
	jmp	$I1819
$JCC10176:
	cmp	WORD PTR _BallCalled,0
	jne	$JCC10186
	jmp	$I1819
$JCC10186:
; Line 1540
; Line 1541
	mov	ax,WORD PTR _Fticks
	sub	WORD PTR _LSOMSGTIME,ax
	js	$JCC10198
	jmp	$I1819
$JCC10198:
; Line 1542
; Line 1543
	mov	WORD PTR _LSOMSGTIME,0
; Line 1544
	cmp	WORD PTR [bp-10],0	;WVOFF
	je	$I1801
; Line 1545
; Line 1546
	mov	ax,WORD PTR [bp-10]	;WVOFF
	mov	WORD PTR _lastlso,ax
; Line 1548
	dec	ax
	je	$SC1806
	dec	ax
	je	$SC1807
	dec	ax
	je	$SC1808
	dec	ax
	je	$SC1809
	jmp	SHORT $SB1803
; Line 1549
	nop	
$SC1806:
; Line 1550
	mov	ax,73
$L20051:
	push	ax
	call	_Speech
	add	sp,2
; Line 1551
$SB1803:
; Line 1563
	mov	ax,5
	push	ax
	mov	bx,WORD PTR [bp-10]	;WVOFF
	shl	bx,1
	push	WORD PTR _lsomsgptrs[bx]
	call	_Message
	add	sp,4
; Line 1564
	mov	WORD PTR _LSOMSGTIME,120
; Line 1565
; Line 1566
	jmp	SHORT $I1819
; Line 1552
	nop	
$SC1807:
; Line 1553
	mov	ax,72
	jmp	SHORT $L20051
; Line 1555
	nop	
$SC1808:
; Line 1556
	mov	ax,71
	jmp	SHORT $L20051
; Line 1558
	nop	
$SC1809:
; Line 1559
	mov	ax,70
	jmp	SHORT $L20051
	nop	
$I1801:
; Line 1567
; Line 1568
	mov	ax,WORD PTR _lastlso
	dec	ax
	jl	$SB1812
	dec	ax
	jle	$SC1815
	dec	ax
	jl	$SB1812
	dec	ax
	jle	$SC1817
	jmp	SHORT $SB1812
; Line 1569
; Line 1570
	nop	
$SC1815:
; Line 1572
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1816
$L20052:
	push	ax
	call	_Message
	add	sp,4
; Line 1573
$SB1812:
; Line 1579
	mov	WORD PTR _lastlso,0
; Line 1580
; Line 1582
; Line 1583
; Line 1584
; Line 1585
	jmp	SHORT $I1819
; Line 1574
$SC1817:
; Line 1576
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1818
	jmp	SHORT $L20052
	nop	
$I1766:
; Line 1586
; Line 1587
	sub	ax,ax
	mov	WORD PTR _BallCalled,ax
	mov	WORD PTR _WavedOff,ax
	sub	al,al
	mov	BYTE PTR _Slopestr,al
	mov	BYTE PTR _Coursestr,al
	mov	BYTE PTR _Rangestr,al
; Line 1588
$I1819:
; Line 1590
	cmp	WORD PTR _BallCalled,0
	je	$I1820
; Line 1591
; Line 1593
	mov	ax,WORD PTR [bp-180]	;DST
	shl	ax,1
	shl	ax,1
	push	ax
	mov	ax,OFFSET DGROUP:$SG1822
	push	ax
	mov	ax,OFFSET DGROUP:_Rangestr
	push	ax
	call	_sprintf
	add	sp,6
; Line 1594
	cmp	WORD PTR [bp-6],0	;LFT
	jl	$I1823
; Line 1595
	push	WORD PTR [bp-6]	;LFT
	mov	ax,OFFSET DGROUP:$SG1824
	jmp	SHORT $L20053
	nop	
$I1823:
; Line 1597
	mov	ax,WORD PTR [bp-6]	;LFT
	neg	ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG1826
$L20053:
	push	ax
	mov	ax,OFFSET DGROUP:_Coursestr
	push	ax
	call	_sprintf
	add	sp,6
; Line 1598
	cmp	WORD PTR [bp-2],0	;DELHT
	jl	$I1827
; Line 1599
	push	WORD PTR [bp-2]	;DELHT
	mov	ax,OFFSET DGROUP:$SG1828
	jmp	SHORT $L20054
$I1827:
; Line 1601
	mov	ax,WORD PTR [bp-2]	;DELHT
	neg	ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG1830
$L20054:
	push	ax
	mov	ax,OFFSET DGROUP:_Slopestr
	push	ax
	call	_sprintf
	add	sp,6
; Line 1602
	mov	ax,WORD PTR [bp-134]	;CLMBRATE
	mov	cx,ax
	shl	ax,1
	add	ax,cx
	shl	ax,1
	neg	ax
	push	ax
	mov	ax,OFFSET DGROUP:$SG1831
	push	ax
	mov	ax,OFFSET DGROUP:_Decentstr
	push	ax
	call	_sprintf
	add	sp,6
; Line 1603
; Line 1604
	mov	sp,bp
	pop	bp
	ret	
	nop	
$I1820:
; Line 1605
; Line 1606
	sub	al,al
	mov	BYTE PTR _Slopestr,al
	mov	BYTE PTR _Coursestr,al
	mov	BYTE PTR _Rangestr,al
; Line 1607
$I1832:
; Line 1608
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DoLSO	ENDP
; Line 1750
	PUBLIC	_MoveAIToCat
_MoveAIToCat	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__aNchkstk
;	xval = -2
;	yval = -8
;	tx = -6
;	ty = -10
;	bottomy = -12
;	topy = -4
;	ty2 = -16
;	cat = 6
;	planenum = 4
; Line 1756
	cmp	WORD PTR [bp+6],0	;cat
	jge	$JCC10523
	jmp	$I1888
$JCC10523:
	cmp	WORD PTR [bp+6],3	;cat
	jle	$JCC10532
	jmp	$I1888
$JCC10532:
; Line 1759
	test	BYTE PTR _landingstatus+1,1
	je	$I1846
; Line 1760
	mov	WORD PTR _carrmoveok,0
; Line 1761
; Line 1763
$I1846:
	mov	es,WORD PTR $T20002
	mov	bx,WORD PTR [bp+6]	;cat
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ax,WORD PTR es:_carrier[bx+24]
	mov	cx,100
	cwd	
	idiv	cx
	mov	WORD PTR [bp-2],ax	;xval
; Line 1764
	mov	ax,WORD PTR es:_carrier[bx+28]
	add	ax,350
	cwd	
	idiv	cx
	mov	WORD PTR [bp-8],ax	;yval
; Line 1765
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	mov	ax,WORD PTR _ailoc[bx]
	mov	cx,100
	cwd	
	idiv	cx
	mov	WORD PTR [bp-6],ax	;tx
; Line 1766
	mov	ax,WORD PTR _ailoc[bx+4]
	cwd	
	idiv	cx
	mov	WORD PTR [bp-10],ax	;ty
; Line 1768
	cmp	ax,62
	jle	$I1847
; Line 1769
	cmp	WORD PTR _carrmoveok,0
	jne	$JCC10635
	jmp	$I1888
$JCC10635:
; Line 1771
; Line 1773
$I1847:
; Line 1774
	mov	ax,WORD PTR es:_carrier+28
	cwd	
	idiv	cx
	add	ax,20
	mov	WORD PTR [bp-4],ax	;topy
; Line 1775
	mov	ax,WORD PTR es:_carrier+48
	cwd	
	idiv	cx
	add	ax,24
	mov	WORD PTR [bp-12],ax	;bottomy
	cmp	ax,WORD PTR [bp-10]	;ty
	jge	$I1851
	cmp	WORD PTR [bp+6],1	;cat
	jg	$I1850
$I1851:
	mov	ax,WORD PTR [bp-10]	;ty
	cmp	WORD PTR [bp-4],ax	;topy
	jg	$JCC10683
	jmp	$I1849
$JCC10683:
	cmp	WORD PTR [bp+6],2	;cat
	jl	$JCC10692
	jmp	$I1849
$JCC10692:
	cmp	WORD PTR [bp-6],2	;tx
	jge	$JCC10701
	jmp	$I1849
$JCC10701:
$I1850:
; Line 1776
	cmp	WORD PTR _carrmoveok,0
	jne	$JCC10711
	jmp	$I1888
$JCC10711:
; Line 1779
	mov	WORD PTR _carrmoveok,0
; Line 1781
	cmp	WORD PTR [bp-6],2	;tx
	je	$I1854
; Line 1782
	jle	$I1855
; Line 1783
	mov	ax,2
	push	ax
	call	_GetCatHeading
	add	sp,2
	sub	ax,16384
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_TurnTo
	add	sp,4
	or	ax,ax
	jne	$JCC10755
	jmp	$I1866
$JCC10755:
; Line 1784
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	sub	WORD PTR _ailoc[bx],100
	sbb	WORD PTR _ailoc[bx+2],0
; Line 1785
; Line 1786
	jmp	$I1866
$I1855:
	cmp	WORD PTR [bp-6],2	;tx
	jl	$JCC10784
	jmp	$I1866
$JCC10784:
; Line 1787
	mov	ax,2
	push	ax
	call	_GetCatHeading
	add	sp,2
	add	ah,64
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_TurnTo
	add	sp,4
	or	ax,ax
	jne	$JCC10814
	jmp	$I1866
$JCC10814:
; Line 1788
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	add	WORD PTR _ailoc[bx],100
	adc	WORD PTR _ailoc[bx+2],0
; Line 1789
; Line 1790
; Line 1791
	jmp	$I1866
	nop	
$I1854:
; Line 1792
	cmp	WORD PTR [bp+6],2	;cat
	jge	$I1861
; Line 1793
	mov	ax,2
	push	ax
	call	_GetCatHeading
	add	sp,2
	add	ah,128
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_TurnTo
	add	sp,4
	or	ax,ax
	je	$I1864
; Line 1794
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	add	WORD PTR _ailoc[bx+4],100
	adc	WORD PTR _ailoc[bx+6],0
; Line 1795
; Line 1796
	jmp	SHORT $I1864
$I1861:
; Line 1797
	mov	ax,2
	push	ax
	call	_GetCatHeading
	add	sp,2
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_TurnTo
	add	sp,4
	or	ax,ax
	je	$I1864
; Line 1798
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	sub	WORD PTR _ailoc[bx+4],100
	sbb	WORD PTR _ailoc[bx+6],0
; Line 1799
$I1864:
; Line 1800
	test	BYTE PTR _landingstatus,66
	je	$I1866
; Line 1802
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	mov	ax,WORD PTR _ailoc[bx+4]
	mov	cx,100
	cwd	
	idiv	cx
	cwd	
	mov	cx,ax
	mov	ax,WORD PTR [bp-12]	;bottomy
	mov	bx,dx
	cwd	
	cmp	bx,dx
	jl	$I1867
	jg	$L20030
	cmp	cx,ax
	jbe	$I1867
$L20030:
	cmp	WORD PTR [bp+6],1	;cat
	jg	$I1866
$I1867:
	mov	ax,WORD PTR [bp-4]	;topy
	cwd	
	cmp	dx,bx
	jl	$I1868
	jg	$L20031
	cmp	ax,cx
	jbe	$I1868
$L20031:
	cmp	WORD PTR [bp+6],2	;cat
	jge	$I1868
	cmp	WORD PTR [bp-6],2	;tx
	jge	$I1866
$I1868:
; Line 1803
	or	BYTE PTR _landingstatus+1,1
; Line 1804
; Line 1805
$I1866:
; Line 1806
; Line 1807
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],247
; Line 1808
	mov	sp,bp
	pop	bp
	ret	
$I1849:
	mov	ax,WORD PTR [bp-2]	;xval
	cmp	WORD PTR [bp-6],ax	;tx
	jge	$I1870
; Line 1811
	mov	ax,2
	push	ax
	call	_GetCatHeading
	add	sp,2
	add	ah,64
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_TurnTo
	add	sp,4
	or	ax,ax
	jne	$JCC11063
	jmp	$I1886
$JCC11063:
; Line 1812
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	add	WORD PTR _ailoc[bx],100
	adc	WORD PTR _ailoc[bx+2],0
; Line 1813
; Line 1814
	jmp	$I1886
$I1870:
	cmp	WORD PTR [bp-6],ax	;tx
	jle	$I1873
; Line 1815
	mov	ax,2
	push	ax
	call	_GetCatHeading
	add	sp,2
	sub	ax,16384
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_TurnTo
	add	sp,4
	or	ax,ax
	jne	$JCC11118
	jmp	$I1886
$JCC11118:
; Line 1816
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	sub	WORD PTR _ailoc[bx],100
	sbb	WORD PTR _ailoc[bx+2],0
; Line 1817
; Line 1818
	jmp	$I1886
	nop	
$I1873:
	mov	ax,WORD PTR [bp-8]	;yval
	cmp	WORD PTR [bp-10],ax	;ty
	jge	$I1876
; Line 1819
	mov	cx,2
	push	cx
	call	_GetCatHeading
	add	sp,2
	add	ah,128
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_TurnTo
	add	sp,4
	or	ax,ax
	jne	$JCC11177
	jmp	$I1886
$JCC11177:
; Line 1820
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	add	WORD PTR _ailoc[bx+4],100
	adc	WORD PTR _ailoc[bx+6],0
; Line 1821
	mov	ax,WORD PTR [bp-10]	;ty
	sub	ax,WORD PTR [bp-8]	;yval
	inc	ax
$L20057:
	jne	$I1886
; Line 1822
	push	WORD PTR [bp+4]	;planenum
	push	WORD PTR [bp+6]	;cat
	call	_PreparePlane
	add	sp,4
; Line 1823
; Line 1824
; Line 1825
; Line 1826
	jmp	SHORT $I1886
$I1876:
	cmp	WORD PTR [bp-10],ax	;ty
	jle	$I1881
; Line 1827
	mov	cx,2
	push	cx
	call	_GetCatHeading
	add	sp,2
	push	ax
	push	WORD PTR [bp+4]	;planenum
	call	_TurnTo
	add	sp,4
	or	ax,ax
	je	$I1886
; Line 1828
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	sub	WORD PTR _ailoc[bx+4],100
	sbb	WORD PTR _ailoc[bx+6],0
; Line 1829
	mov	ax,WORD PTR [bp-10]	;ty
	sub	ax,WORD PTR [bp-8]	;yval
	dec	ax
	jmp	SHORT $L20057
	nop	
$I1881:
; Line 1835
	push	WORD PTR [bp+4]	;planenum
	push	WORD PTR [bp+6]	;cat
	call	_ReadyLaunch
	add	sp,4
	or	ax,ax
	je	$I1886
; Line 1836
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp+6]	;cat
	mov	WORD PTR _bv[bx+38],ax
; Line 1837
	mov	ax,WORD PTR _Gtime
	inc	ax
	inc	ax
	mov	WORD PTR _bv[bx+22],ax
; Line 1838
; Line 1839
$I1886:
; Line 1841
	mov	ax,46
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	and	BYTE PTR _bv[bx+21],247
; Line 1843
	cmp	WORD PTR [bp-10],62	;ty
	jle	$I1888
; Line 1844
	mov	WORD PTR _carrmoveok,0
; Line 1845
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	cl,3
	mov	bx,WORD PTR [bp+4]	;planenum
	shl	bx,cl
	push	WORD PTR _ailoc[bx+6]
	push	WORD PTR _ailoc[bx+4]
	call	__aNldiv
	or	dx,dx
	jg	$I1888
	jl	$L20033
	cmp	ax,62
	ja	$I1888
$L20033:
	test	BYTE PTR _landingstatus,66
	je	$I1888
; Line 1846
	or	BYTE PTR _landingstatus+1,1
; Line 1847
$I1888:
; Line 1848
	mov	sp,bp
	pop	bp
	ret	

_MoveAIToCat	ENDP
; Line 1852
	PUBLIC	_TurnTo
_TurnTo	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	thead = -2
;	thead2 = -4
;	heading = 6
;	planenum = 4
; Line 1858
	mov	ax,1536
	push	ax
	mov	ax,-1536
	push	ax
	mov	ax,40
	imul	WORD PTR [bp+4]	;planenum
	mov	bx,ax
	mov	ax,WORD PTR [bp+6]	;heading
	sub	ax,WORD PTR _ps[bx+16]
	mov	WORD PTR [bp-2],ax	;thead
	push	ax
	mov	si,bx
	call	_rng2
	add	sp,6
	add	WORD PTR _ps[si+16],ax
; Line 1860
	cmp	ax,WORD PTR [bp-2]	;thead
	jne	$I1895
; Line 1861
	mov	ax,1
	pop	si
	mov	sp,bp
	pop	bp
	ret	
; Line 1863
$I1895:
	sub	ax,ax
; Line 1864
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_TurnTo	ENDP
_TEXT	ENDS
END
