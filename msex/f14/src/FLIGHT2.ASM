;	Static Name Aliases
;
	TITLE   C:\FLIGHT2.C
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
PUBLIC  _TFAS
PUBLIC  _TFAPTR
PUBLIC  _TFAPTRCNT
PUBLIC  _ROLLINERTIA
PUBLIC  _ReqdGees
PUBLIC  _DirectLiftControl
PUBLIC  _DIRECTLIFTSPEED
PUBLIC  _DEBUG1
PUBLIC  _DEBUG2
PUBLIC  _Weight
PUBLIC  _FM
PUBLIC  _HC
PUBLIC  _PC
PUBLIC  _RC
PUBLIC  _TM
PUBLIC  _OurHead
PUBLIC  _DNSTSQR
PUBLIC  _OurPitch
PUBLIC  _DEBG1
PUBLIC  _OurRoll
PUBLIC  _DEBG2
PUBLIC  _AutoTrim
PUBLIC  _AUTOCARLAND
PUBLIC  _Alt
PUBLIC  _OurAlt
PUBLIC  _OldAlt
PUBLIC  _RadarAlt
PUBLIC  _TrimAOA
PUBLIC  _ONTHECAT
PUBLIC  _FrameCnt
PUBLIC  _ONTHEHOOK
PUBLIC  _ScottFlightMode
PUBLIC  _ScottLandingMode
PUBLIC  _LSORating
PUBLIC  _tchdwnrating
PUBLIC  _TRIM
PUBLIC  _PrevRoll
PUBLIC  _PrevAOA
PUBLIC  _AOARepCnt
PUBLIC  _PrevROLLRATE
PUBLIC  _RollRepCnt
PUBLIC  _fueltime
PUBLIC  _GTABLE
PUBLIC  _MilFuelTBLperhour
PUBLIC  _MaxFuelTBLperhour
PUBLIC  _DNSTBL
PUBLIC  _MilFuelTBL
PUBLIC  _W_WEIGHTS
PUBLIC  _MaxFuelTBL
PUBLIC  _loadout
PUBLIC  _loadstrs
PUBLIC  _MAXENGAIR
PUBLIC  _MILENGAIR
PUBLIC  _MYLOAD
PUBLIC  _REALFLIGHT
PUBLIC  _STTBL
PUBLIC  _LOADDRAG
PUBLIC  _MYCLCD
PUBLIC  _loadoutweight
PUBLIC  _THRUST
PUBLIC  _MYCP
PUBLIC  _MYTFACT
PUBLIC  _GEFFECT
PUBLIC  _PRESSUREBLACK
PUBLIC  _FASTROLL
PUBLIC  _OldAutoAlt
PUBLIC  _GAMNT
PUBLIC  _OLDAOA
PUBLIC  _OLDSLEW
PUBLIC  _SLEW
EXTRN	_Copy3X3:NEAR
EXTRN	_sgn:NEAR
EXTRN	_rnd2:NEAR
EXTRN	_rng:NEAR
EXTRN	_SndSounds:FAR
EXTRN	__aNNalmul:NEAR
EXTRN	_InitPlaneOnCarrier:NEAR
EXTRN	__aNNaldiv:NEAR
EXTRN	_labs:NEAR
EXTRN	_Message:NEAR
EXTRN	_rnd:NEAR
EXTRN	_Speech:NEAR
EXTRN	_MakeRotationMatrix:NEAR
EXTRN	_cosX:NEAR
EXTRN	_Dist2D:NEAR
EXTRN	_Rotate2D:NEAR
EXTRN	_InitOurCoolPlane:NEAR
EXTRN	_ACosB:NEAR
EXTRN	_MakeMatRPH:NEAR
EXTRN	_GetQHeight:NEAR
EXTRN	_MDiv:NEAR
EXTRN	_TrgMul:NEAR
EXTRN	_EndGame:NEAR
EXTRN	__aNchkstk:NEAR
EXTRN	_Isin:NEAR
EXTRN	_MakeMatHPR:NEAR
EXTRN	_Icos:NEAR
EXTRN	_StartASmoke:NEAR
EXTRN	_Trans3X3:NEAR
EXTRN	_sprintf:NEAR
EXTRN	_Rotate:NEAR
EXTRN	__aNldiv:NEAR
EXTRN	_OnTheDeck:NEAR
EXTRN	_SinX:NEAR
EXTRN	_Sqrt:NEAR
EXTRN	_CosX:NEAR
EXTRN	_EngineMonitor:NEAR
EXTRN	_ASinB:NEAR
EXTRN	_LogIt:NEAR
EXTRN	__aNlmul:NEAR
EXTRN	_sinX:NEAR
EXTRN	_Sound:NEAR
EXTRN	_ARCTAN:NEAR
EXTRN	_abs:NEAR
EXTRN	_MatrixMul:NEAR
EXTRN	__aNNalshl:NEAR
EXTRN	_Mult3X3:NEAR
EXTRN	_Decompose:NEAR
EXTRN	_rng2:NEAR
EXTRN	_GetHPR:NEAR
EXTRN	_BingoFuelWarn:WORD
EXTRN	_ConfigData:BYTE
EXTRN	_MasterArmSW:WORD
EXTRN	_SNDDETAIL:WORD
_BSS      SEGMENT
COMM NEAR	_D:	BYTE:	 14
COMM NEAR	_ntmp:	 1:	 10
COMM NEAR	_PxLng:	BYTE:	 4
_BSS      ENDS
EXTRN	_Damaged:WORD
_BSS      SEGMENT
COMM NEAR	_PyLng:	BYTE:	 4
_BSS      ENDS
EXTRN	_Status:WORD
_BSS      SEGMENT
COMM NEAR	_Px:	BYTE:	 2
_BSS      ENDS
EXTRN	_Fuel:WORD
_BSS      SEGMENT
COMM NEAR	_Py:	BYTE:	 2
COMM NEAR	_AirSpeed:	BYTE:	 2
_BSS      ENDS
EXTRN	_AutoAlt:WORD
EXTRN	_AutoHead:WORD
EXTRN	_Diff:WORD
EXTRN	_ejected:WORD
EXTRN	_FrameRate:WORD
EXTRN	_wps:BYTE
EXTRN	_Gtime:WORD
EXTRN	_NextWayPoint:WORD
EXTRN	_Direction:WORD
_BSS      SEGMENT
COMM NEAR	_Gees:	BYTE:	 2
COMM NEAR	_FPARAMS:	BYTE:	 42
COMM NEAR	_Accel:	BYTE:	 2
COMM NEAR	_VVI:	BYTE:	 2
_BSS      ENDS
EXTRN	_Rdrs:BYTE
EXTRN	_ps:BYTE
_BSS      SEGMENT
COMM NEAR	_ThrustI:	BYTE:	 2
_BSS      ENDS
EXTRN	_ms:BYTE
_BSS      SEGMENT
COMM NEAR	_PitchAngle:	BYTE:	 2
_BSS      ENDS
EXTRN	_F14_STATION:BYTE
EXTRN	_Rtime:WORD
_BSS      SEGMENT
COMM NEAR	_MinSpd:	BYTE:	 2
COMM NEAR	_MinKnots:	BYTE:	 2
COMM NEAR	_ROLLRATE:	BYTE:	 2
COMM NEAR	_AOARATE:	BYTE:	 2
COMM NEAR	_Knots:	BYTE:	 2
COMM NEAR	_AOAttack:	BYTE:	 2
COMM NEAR	_vHead:	BYTE:	 2
COMM NEAR	_vPitch:	BYTE:	 2
COMM NEAR	_vRoll:	BYTE:	 2
_BSS      ENDS
EXTRN	_MinAlt:WORD
_BSS      SEGMENT
COMM NEAR	_VM:	 2:	 9
_BSS      ENDS
EXTRN	_DESIGNATED:WORD
_BSS      SEGMENT
COMM NEAR	_DoPitchLines:	BYTE:	 1
_BSS      ENDS
EXTRN	_AutoGearOk:WORD
_BSS      SEGMENT
COMM NEAR	_ejectX:	BYTE:	 2
_BSS      ENDS
EXTRN	_AutoLand:WORD
_BSS      SEGMENT
COMM NEAR	_ejectY:	BYTE:	 2
_BSS      ENDS
EXTRN	_Speedy:WORD
_BSS      SEGMENT
COMM NEAR	_ejectZ:	BYTE:	 2
_BSS      ENDS
EXTRN	_Fticks:WORD
_BSS      SEGMENT
COMM NEAR	_BEND:	BYTE:	 1
_BSS      ENDS
EXTRN	_RudderStick:WORD
EXTRN	_RUDDERVALS:WORD
EXTRN	_KbSense:WORD
_BSS      SEGMENT
COMM NEAR	_sightX:	BYTE:	 2
_BSS      ENDS
EXTRN	_RealLandings:WORD
_BSS      SEGMENT
COMM NEAR	_sightY:	BYTE:	 2
_BSS      ENDS
EXTRN	_Firing:WORD
_BSS      SEGMENT
COMM NEAR	_BingoFuel:	BYTE:	 2
_BSS      ENDS
EXTRN	_mS1n:BYTE
_BSS      SEGMENT
COMM NEAR	_FuelFlow:	BYTE:	 4
_BSS      ENDS
EXTRN	_mS2n:BYTE
EXTRN	_LastRate:WORD
EXTRN	_LLowFuelWarn:WORD
_BSS      SEGMENT
COMM NEAR	_chs:	 16:	 16
_BSS      ENDS
EXTRN	_RLowFuelWarn:WORD
_DATA      SEGMENT
$SG844	DB	'(Tower) Cleared for Takeoff',  00H
	ORG	$+254
$SG884	DB	'Landing gear raised',  00H
$SG887	DB	'Brakes on',  00H
$SG892	DB	'Autopilot off',  00H
	ORG	$+34
$SG1006	DB	'3C5 FLEET DEFENSE BRAVO',  00H
$SG1007	DB	'2B3 MIG CAP BRAVO',  00H
$SG1008	DB	'3B3 FLEET DEFENSE ALPHA',  00H
$SG1009	DB	'SPC FLEET DEFENSE CHARLIE',  00H
$SG1010	DB	'3B1 MIG CAP CHARLIE',  00H
$SG1011	DB	'2B1 MIG CAP ALPHA',  00H
$SG1012	DB	'CLEAN clcd=27',  00H
	ORG	$+398
$SG1112	DB	'Auto trim ON',  00H
$SG1114	DB	'Auto trim OFF',  00H
$SG1116	DB	'Trim disabled',  00H
	ORG	$+3
$SG1122	DB	'Trim disabled',  00H
$SG1126	DB	'Trim = %i',  00H
$SG1140	DB	'Warning, Low Fuel',  00H
$SG1142	DB	'Bingo Fuel',  00H
	ORG	$+93
$SG1201	DB	'Got The %i Wire',  00H
$SG1202	DB	'LSO rating: %i',  00H
$SG1208	DB	'Landing gear raised',  00H
$SG1228	DB	'Autopilot off',  00H
$SG1297	DB	'STALL WARNING',  00H
$SG1309	DB	'STRUCTURAL DAMAGE !!',  00H
$SG1311	DB	'OVER G !!',  00H
	ORG	$+6
$SG1338	DB	'Good VVi',  00H
$SG1340	DB	'Good Roll',  00H
$SG1342	DB	'Good Speed',  00H
$SG1343	DB	'Touch rating: %i',  00H
$SG1358	DB	'BAD VVI',  00H
$SG1360	DB	'SPLAT!!!',  00H
$SG1362	DB	'THRU THE DECK',  00H
$SG1364	DB	'BAD ROLL',  00H
$SG1366	DB	'TOO NOSE DOWN',  00H
$SG1368	DB	'NOSE TOO HIGH',  00H
$SG1370	DB	'HIT THE TOWER',  00H
	ORG	$-1309
_ReqdGees	DB	010H
	DB	010H
	DB	010H
	DB	010H
	DB	010H
	DB	010H
	DB	011H
	DB	011H
	DB	011H
	DB	011H
	DB	011H
	DB	011H
	DB	011H
	DB	011H
	DB	012H
	DB	012H
	DB	012H
	DB	012H
	DB	012H
	DB	012H
	DB	012H
	DB	013H
	DB	013H
	DB	014H
	DB	014H
	DB	015H
	DB	016H
	DB	016H
	DB	017H
	DB	018H
	DB	019H
	DB	019H
	DB	01aH
	DB	01bH
	DB	01bH
	DB	01cH
	DB	01dH
	DB	01dH
	DB	01eH
	DB	01fH
	DB	01fH
	DB	020H
	DB	022H
	DB	024H
	DB	025H
	DB	027H
	DB	029H
	DB	02bH
	DB	02cH
	DB	02eH
	DB	030H
	DB	034H
	DB	038H
	DB	03cH
	DB	040H
	DB	048H
	DB	050H
	DB	060H
	DB	070H
	DB	080H
	DB	090H
	DB	0a0H
	DB	0b0H
	DB	0c0H
	DB	0d0H
	DB	0c0H
	DB	0b0H
	DB	0a0H
	DB	090H
	DB	080H
	DB	070H
	DB	060H
	DB	050H
	DB	048H
	DB	040H
	DB	03cH
	DB	038H
	DB	034H
	DB	030H
	DB	02eH
	DB	02cH
	DB	02bH
	DB	029H
	DB	027H
	DB	025H
	DB	024H
	DB	022H
	DB	020H
	DB	01fH
	DB	01fH
	DB	01eH
	DB	01dH
	DB	01dH
	DB	01cH
	DB	01bH
	DB	01bH
	DB	01aH
	DB	019H
	DB	019H
	DB	018H
	DB	017H
	DB	016H
	DB	016H
	DB	015H
	DB	014H
	DB	014H
	DB	013H
	DB	013H
	DB	012H
	DB	012H
	DB	012H
	DB	012H
	DB	012H
	DB	012H
	DB	012H
	DB	011H
	DB	011H
	DB	011H
	DB	011H
	DB	011H
	DB	011H
	DB	011H
	DB	011H
	DB	010H
	DB	010H
	DB	010H
	DB	010H
	DB	010H
_Weight	DW	08H
_FM	DW	07fffH
	DW	00H
	DW	00H
	DW	00H
	DW	07fffH
	DW	00H
	DW	00H
	DW	00H
	DW	07fffH
_HC	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	07fffH
	DW	00H
	DW	00H
	DW	00H
	DW	00H
_PC	DW	07fffH
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
_RC	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	07fffH
_TM	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
_OurHead	DW	00H
_OurPitch	DW	00H
_OurRoll	DW	00H
_Alt	DW	00H
_OurAlt	DW	00H
_OldAlt	DW	00H
_RadarAlt	DD	00H
_TrimAOA	DB	0cH
	ORG	$+1
_FrameCnt	DD	00H
_PrevRoll	DB	00H
_PrevAOA	DB	00H
_AOARepCnt	DB	01H
_PrevROLLRATE	DB	00H
_RollRepCnt	DB	00H
	ORG	$+1
_REALFLIGHT	DW	00H
_THRUST	DW	00H
_GAMNT	DW	00H
	ORG	$+44
_DNSTSQR	DW	03e8H
	DW	0435H
	DW	048cH
	DW	04edH
	DW	055aH
	DW	05d6H
	DW	0663H
	DW	0704H
	DW	07e0H
	DW	08e1H
	DW	0a03H
	DW	0b4aH
	DW	0cbbH
	DW	0e5bH
	DW	0103cH
	DW	01259H
	DW	014b9H
	ORG	$+144
_W_WEIGHTS	DW	00H
	DW	021cH
	DW	0226H
	DW	01e6H
	DW	01f4H
	DW	07b2H
	DW	07daH
	DW	0821H
	DW	01f4H
	DW	09c6H
	DW	03b6H
	DW	02c2H
	DW	0320H
	DW	0492H
	DW	0578H
	DW	03d9H
	DW	01c2H
	DW	0140H
	DW	0b4H
	DW	0152H
	DW	01feH
	DW	00H
	DW	00H
_loadout	DW	0187eH
	DW	038H
	DW	0d5cH
	DW	01fH
	DW	014c8H
	DW	022H
	DW	0c80H
	DW	022H
	DW	01234H
	DW	022H
	DW	0ac8H
	DW	01fH
	DW	00H
	DW	01bH
_loadstrs	DW	DGROUP:$SG1006
	DW	DGROUP:$SG1007
	DW	DGROUP:$SG1008
	DW	DGROUP:$SG1009
	DW	DGROUP:$SG1010
	DW	DGROUP:$SG1011
	DW	DGROUP:$SG1012
_MYLOAD	DW	00H
_LOADDRAG	DW	064H
_loadoutweight	DW	00H
_DEBG1	DW	00H
_DEBG2	DW	00H
_AUTOCARLAND	DW	00H
_ONTHECAT	DW	01H
_ONTHEHOOK	DW	00H
_ScottFlightMode	DW	00H
_ScottLandingMode	DW	00H
_LSORating	DW	00H
_tchdwnrating	DW	00H
_TRIM	DW	00H
_GTABLE	DW	00H
	DW	00H
	DW	019H
	DW	032H
	DW	064H
	DW	096H
	DW	0c8H
	DW	0e1H
	DW	0f0H
	DW	0113H
	DW	0135H
	DW	01c2H
	DW	0219H
	DW	0320H
	DW	0339H
	DW	0384H
	DW	03e8H
	DW	04b0H
	DW	04b0H
	DW	04b0H
	DW	04b0H
	DW	04b0H
	DW	04b0H
_DNSTBL	DW	064H
	DW	056H
	DW	049H
	DW	03eH
	DW	035H
	DW	02cH
	DW	025H
	DW	01eH
	DW	018H
	DW	013H
	DW	0fH
	DW	0bH
	DW	09H
	DW	07H
	DW	06H
	DW	05H
	DW	03H
_MAXENGAIR	DW	064H
	DW	064H
	DW	055H
	DW	04bH
	DW	041H
	DW	032H
	DW	0aH
	DW	05H
	DW	00H
	DW	00H
	DW	00H
_MILENGAIR	DW	064H
	DW	057H
	DW	046H
	DW	03cH
	DW	034H
	DW	02dH
	DW	0aH
	DW	05H
	DW	00H
	DW	00H
	DW	00H
_STTBL	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	01H
	DW	01H
	DW	02H
	DW	02H
	DW	03H
	DW	03H
	DW	04H
	DW	04H
	DW	05H
	DW	06H
	DW	07H
	DW	08H
	DW	09H
	DW	0aH
	DW	0bH
	DW	0cH
	DW	0dH
	DW	0eH
	DW	0fH
	DW	010H
	DW	014H
	DW	018H
	DW	01cH
	DW	020H
	DW	020H
	DW	020H
_GEFFECT	DW	00H
_PRESSUREBLACK	DW	00H
_FASTROLL	DW	01H
_OldAutoAlt	DW	00H
_OLDAOA	DW	00H
_OLDSLEW	DW	00H
_SLEW	DW	00H
_TFAS	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
	DW	00H
_TFAPTR	DW	00H
_TFAPTRCNT	DW	00H
_ROLLINERTIA	DD	00H
_DirectLiftControl	DW	00H
_DIRECTLIFTSPEED	DW	0d2H
_DEBUG1	DW	00H
_DEBUG2	DW	00H
	ORG	$+42
_AutoTrim	DW	00H
	ORG	$+54
_fueltime	DW	00H
_MilFuelTBLperhour	DD	02710H
	DD	01f40H
	DD	01770H
	DD	0fa0H
	DD	0bb8H
	DD	07d0H
	DD	03e8H
	DD	03e8H
_MaxFuelTBLperhour	DD	0f618H
	DD	0a410H
	DD	07b0cH
	DD	06270H
	DD	05974H
	DD	05208H
	DD	05208H
_MilFuelTBL	DW	0a7H
	DW	085H
	DW	064H
	DW	043H
	DW	032H
	DW	021H
	DW	011H
	DW	011H
_MaxFuelTBL	DW	041aH
	DW	02bcH
	DW	020dH
	DW	01a4H
	DW	017dH
	DW	015eH
	DW	015eH
	ORG	$+110
_MYCLCD	DW	023H
_MYCP	DW	022H
_MYTFACT	DW	064H
_DATA      ENDS
_TEXT      SEGMENT
	ASSUME	CS: _TEXT
; Line 1
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
; Line 26
; Line 27
; Line 28
; Line 29
; Line 127
	PUBLIC	_InitFlightModel
_InitFlightModel	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,4
	call	__aNchkstk
	push	si
;	f = -4
;	d = -2
; Line 131
	mov	ax,2
	push	ax
	call	_InitPlaneOnCarrier
	add	sp,2
; Line 133
	cmp	WORD PTR _Alt,20
	jbe	$I841
; Line 134
	mov	WORD PTR _MasterArmSW,1
; Line 135
	jmp	SHORT $I842
	nop	
$I841:
; Line 136
	mov	ax,4
	push	ax
	mov	ax,OFFSET DGROUP:$SG844
	push	ax
	call	_Message
	add	sp,4
; Line 137
	mov	ax,2
	push	ax
	mov	ax,81
	push	ax
	call	_Speech
	add	sp,4
; Line 138
$I842:
; Line 141
	mov	ax,WORD PTR _PxLng
	mov	dx,WORD PTR _PxLng+2
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
	mov	WORD PTR _Px,ax
; Line 142
	mov	ax,WORD PTR _PyLng
	mov	dx,WORD PTR _PyLng+2
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
	sub	ax,-32768
	neg	ax
	mov	WORD PTR _Py,ax
; Line 144
	push	WORD PTR _OurRoll
	push	WORD PTR _OurPitch
	push	WORD PTR _OurHead
	mov	ax,OFFSET DGROUP:_FM
	push	ax
	call	_MakeRotationMatrix
	add	sp,8
; Line 145
	call	_InitScottFlight
; Line 146
	mov	ax,WORD PTR _REALFLIGHT
	inc	ax
	mov	WORD PTR _KbSense,ax
; Line 151
	mov	ax,WORD PTR _wps+14
	sub	ax,WORD PTR _Py
	push	ax
	mov	ax,WORD PTR _wps+12
	sub	ax,WORD PTR _Px
	push	ax
	call	_Dist2D
	add	sp,4
	mov	cx,WORD PTR _wps+26
	sub	cx,WORD PTR _Py
	push	cx
	mov	cx,WORD PTR _wps+24
	sub	cx,WORD PTR _Px
	push	cx
	mov	si,ax
	call	_Dist2D
	add	sp,4
	cmp	ax,si
	jge	$L20001
	mov	ax,WORD PTR _wps+14
	sub	ax,WORD PTR _Py
	push	ax
	mov	ax,WORD PTR _wps+12
	jmp	SHORT $L20093
$L20001:
	mov	ax,WORD PTR _wps+26
	sub	ax,WORD PTR _Py
	push	ax
	mov	ax,WORD PTR _wps+24
$L20093:
	sub	ax,WORD PTR _Px
	push	ax
	call	_Dist2D
	add	sp,4
; Line 152
	mov	ax,10
	cwd	
	push	dx
	push	ax
	call	_PlaneWeight
	push	dx
	push	ax
	call	__aNldiv
	add	ax,1000
	mov	WORD PTR _BingoFuel,ax
; Line 154
	cmp	WORD PTR _OurAlt,1
	sbb	ax,ax
	inc	ax
	push	ax
	call	_InitOurCoolPlane
	add	sp,2
; Line 155
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_InitFlightModel	ENDP
; Line 160
	PUBLIC	_FLIGHT
_FLIGHT	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,66
	call	__aNchkstk
	push	si
;	FrameAccel = -16
;	GndSpeed = -34
;	TurnRate = -22
;	EqV = -50
;	EqSpeed = -26
;	HeadChg = -20
;	PitchChg = -32
;	RollChg = -40
;	sRoll = -48
;	z1 = -38
;	z2 = -46
;	z3 = -54
;	z4 = -58
;	z = -30
;	n = -56
;	dH = -44
;	dP = -18
;	b = -14
;	dx = -42
;	dy = -52
;	angl = -12
;	wobble = -36
;	KEY = -28
;	maxroll = -60
;	txt = -10
;	GroundH = -24
; Line 170
	call	_EngineMonitor
; Line 172
	mov	ax,WORD PTR _OurAlt
	mov	WORD PTR _OldAlt,ax
; Line 174
	mov	cl,4
	mov	al,BYTE PTR _mS1n
	shr	al,cl
	sub	ah,ah
	sub	ax,8
	mov	WORD PTR _ROLLRATE,ax
	or	ax,ax
	jge	$I879
	inc	ax
	mov	WORD PTR _ROLLRATE,ax
; Line 175
$I879:
	mov	cl,4
	mov	al,BYTE PTR _mS2n
	shr	al,cl
	sub	ah,ah
	sub	ax,8
	mov	WORD PTR _AOARATE,ax
	or	ax,ax
	jge	$I880
	inc	ax
	mov	WORD PTR _AOARATE,ax
; Line 177
$I880:
	push	WORD PTR _ROLLRATE
	call	_abs
	add	sp,2
	sub	ax,-2
	neg	ax
	imul	WORD PTR _ROLLRATE
	shl	ax,1
	mov	WORD PTR _ROLLRATE,ax
; Line 178
	mov	ax,6
	imul	WORD PTR _AOARATE
	mov	WORD PTR _AOARATE,ax
; Line 180
	cmp	WORD PTR _Speedy,1
	je	$I881
; Line 181
	mov	ax,WORD PTR _ROLLRATE
	cwd	
	idiv	WORD PTR _Speedy
	mov	WORD PTR _ROLLRATE,ax
; Line 182
	mov	ax,WORD PTR _AOARATE
	cwd	
	idiv	WORD PTR _Speedy
	mov	WORD PTR _AOARATE,ax
; Line 183
; Line 185
$I881:
	mov	ax,WORD PTR _MinAlt
	cmp	WORD PTR _Alt,ax
	jne	$I882
	cmp	WORD PTR _AOARATE,0
	jge	$I882
	cmp	WORD PTR _OurPitch,0
	jg	$I882
	mov	WORD PTR _AOARATE,0
; Line 187
$I882:
	cmp	WORD PTR _REALFLIGHT,0
	jne	$I883
	cmp	WORD PTR _OurAlt,100
	jb	$I883
	test	BYTE PTR _Status,1
	jne	$I883
	cmp	WORD PTR _AutoGearOk,0
	je	$I883
; Line 188
	mov	WORD PTR _AutoGearOk,0
; Line 189
	or	BYTE PTR _Status,1
; Line 190
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG884
	push	ax
	call	_Message
	add	sp,4
; Line 191
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,34
	push	ax
	call	_Sound
	add	sp,6
; Line 192
; Line 194
$I883:
	cmp	WORD PTR _REALFLIGHT,0
	jne	$I886
	mov	ax,WORD PTR _MinAlt
	cmp	WORD PTR _Alt,ax
	jne	$I886
	cmp	WORD PTR _THRUST,0
	jne	$I886
	test	BYTE PTR _Status,8
	jne	$I886
; Line 195
	or	BYTE PTR _Status,8
; Line 196
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG887
	push	ax
	call	_Message
	add	sp,4
; Line 197
; Line 200
$I886:
	mov	bx,WORD PTR _NextWayPoint
	mov	ax,bx
	shl	bx,1
	add	bx,ax
	shl	bx,1
	shl	bx,1
	mov	ax,WORD PTR _wps[bx]
	sub	ax,WORD PTR _Px
	mov	WORD PTR [bp-42],ax	;dx
; Line 201
	mov	cx,WORD PTR _wps[bx+2]
	sub	cx,WORD PTR _Py
	mov	WORD PTR [bp-52],cx	;dy
; Line 202
	neg	cx
	push	cx
	push	ax
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR _AutoHead,ax
; Line 204
	cmp	WORD PTR _AutoAlt,0
	jne	$JCC630
	jmp	$I905
$JCC630:
	cmp	WORD PTR _REALFLIGHT,0
	je	$JCC640
	jmp	$I905
$JCC640:
; Line 205
	cmp	WORD PTR _ROLLRATE,0
	jne	$I891
	cmp	WORD PTR _AOARATE,0
	je	$I890
$I891:
; Line 206
	mov	WORD PTR _AutoAlt,0
; Line 207
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG892
	push	ax
	call	_Message
	add	sp,4
; Line 208
; Line 210
$I890:
; Line 211
	mov	ax,5120
	push	ax
	mov	ax,-5120
	push	ax
	mov	cx,WORD PTR _AutoHead
	sub	cx,WORD PTR _OurHead
	push	cx
	call	_rng2
	add	sp,6
	shl	ax,1
	mov	WORD PTR [bp-44],ax	;dH
; Line 212
	mov	ax,24
	push	ax
	mov	ax,-24
	push	ax
	mov	cl,6
	mov	ax,WORD PTR [bp-44]	;dH
	sub	ax,WORD PTR _OurRoll
	sar	ax,cl
	push	ax
	call	_rng2
	add	sp,6
	neg	ax
	mov	WORD PTR _ROLLRATE,ax
; Line 214
	mov	ax,3072
	push	ax
	mov	ax,-5120
	push	ax
	mov	cl,4
	mov	ax,WORD PTR _AutoAlt
	sub	ax,WORD PTR _Alt
	shl	ax,cl
	sub	ax,WORD PTR _PitchAngle
	push	ax
	call	_rng2
	add	sp,6
	mov	WORD PTR [bp-18],ax	;dP
; Line 215
	mov	ax,8
	push	ax
	mov	ax,-8
	push	ax
	mov	cl,7
	mov	ax,WORD PTR [bp-18]	;dP
	sub	ax,WORD PTR _OurPitch
	sar	ax,cl
	push	ax
	call	_rng2
	add	sp,6
	mov	WORD PTR _AOARATE,ax
; Line 218
	cmp	WORD PTR _NextWayPoint,3
	je	$JCC805
	jmp	$I905
$JCC805:
	cmp	WORD PTR _Diff,0
	jg	$JCC815
	jmp	$I905
$JCC815:
	mov	bx,WORD PTR _ms+18
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	test	BYTE PTR _Rdrs[bx+7],16
	je	$JCC839
	jmp	$I905
$JCC839:
;	MyDir = -62
; Line 221
	mov	ax,WORD PTR _Direction
	mov	WORD PTR [bp-62],ax	;MyDir
; Line 222
	mov	ax,WORD PTR _ms+18
	mov	WORD PTR [bp-14],ax	;b
; Line 223
	mov	ax,WORD PTR _Rdrs[bx]
	sub	ax,WORD PTR _Px
	mov	WORD PTR [bp-42],ax	;dx
; Line 224
	mov	ax,WORD PTR _Rdrs[bx+2]
	sub	ax,WORD PTR _Py
	mov	WORD PTR [bp-52],ax	;dy
; Line 225
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,800
	jge	$I896
	and	BYTE PTR _Status,254
; Line 226
$I896:
	mov	bx,WORD PTR [bp-14]	;b
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	test	BYTE PTR _Rdrs[bx+7],2
	jne	$I897
	push	WORD PTR [bp-52]	;dy
	call	_sgn
	add	sp,2
	neg	ax
	mov	WORD PTR [bp-62],ax	;MyDir
; Line 227
$I897:
	mov	bx,WORD PTR [bp-14]	;b
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	mov	ah,BYTE PTR _Rdrs[bx+7]
	and	ax,512
	cmp	ax,1
	sbb	ax,ax
	and	ax,24
	add	ax,28
	imul	WORD PTR [bp-62]	;MyDir
	add	WORD PTR [bp-52],ax	;dy
; Line 229
	push	WORD PTR _OurHead
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-44],ax	;dH
; Line 231
	cmp	WORD PTR [bp-62],-1	;MyDir
	jne	$I899
; Line 232
	neg	WORD PTR [bp-42]	;dx
; Line 233
	neg	WORD PTR [bp-52]	;dy
; Line 234
	mov	ax,WORD PTR _OurHead
	add	ah,128
	push	ax
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-44],ax	;dH
; Line 235
; Line 237
$I899:
	mov	ax,4096
	push	ax
	mov	ax,50
	push	ax
	push	WORD PTR [bp-42]	;dx
	call	_abs
	add	sp,2
	push	WORD PTR [bp-52]	;dy
	mov	si,ax
	call	_abs
	add	sp,2
	add	si,ax
	shl	si,1
	mov	ax,WORD PTR [bp-44]	;dH
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,5
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	add	si,ax
	push	si
	call	_rng
	add	sp,6
	mov	WORD PTR [bp-18],ax	;dP
; Line 239
	mov	bx,WORD PTR [bp-14]	;b
	mov	ax,bx
	shl	bx,1
	shl	bx,1
	add	bx,ax
	shl	bx,1
	test	BYTE PTR _Rdrs[bx+7],2
	je	$I901
	add	WORD PTR [bp-18],100	;dP
; Line 242
$I901:
; Line 244
	mov	ax,768
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-42]	;dx
	call	_abs
	add	sp,2
	mov	cx,ax
	mov	ax,WORD PTR [bp-44]	;dH
	mov	bx,cx
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,6
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	add	bx,ax
	push	bx
	call	_rng
	add	sp,6
	mov	bx,WORD PTR [bp-14]	;b
	mov	cx,bx
	shl	bx,1
	shl	bx,1
	add	bx,cx
	shl	bx,1
	mov	ch,BYTE PTR _Rdrs[bx+7]
	and	cx,512
	cmp	cx,1
	sbb	cx,cx
	and	cx,24
	add	cx,28
	add	ax,cx
	imul	WORD PTR [bp-62]	;MyDir
	add	ax,WORD PTR _Rdrs[bx+2]
	sub	ax,WORD PTR _Py
	mov	WORD PTR [bp-52],ax	;dy
; Line 246
	and	BYTE PTR _Status,247
; Line 248
	cmp	WORD PTR [bp-44],16384	;dH
	jle	$I902
; Line 249
	mov	ax,WORD PTR _Rdrs[bx]
	sub	ax,WORD PTR _Px
	mov	WORD PTR [bp-42],ax	;dx
; Line 250
	mov	WORD PTR [bp-18],4096	;dP
; Line 251
; Line 252
	jmp	SHORT $I904
$I902:
; Line 253
	mov	ax,WORD PTR [bp-42]	;dx
	imul	WORD PTR [bp-62]	;MyDir
	shl	ax,1
	mov	bx,WORD PTR [bp-14]	;b
	mov	cx,bx
	shl	bx,1
	shl	bx,1
	add	bx,cx
	shl	bx,1
	add	ax,WORD PTR _Rdrs[bx]
	sub	ax,WORD PTR _Px
	mov	WORD PTR [bp-42],ax	;dx
; Line 254
	mov	ax,80
	imul	WORD PTR _THRUST
	cmp	ax,WORD PTR _Knots
	jge	$I904
	or	BYTE PTR _Status,8
; Line 255
$I904:
; Line 257
	mov	ax,WORD PTR [bp-52]	;dy
	neg	ax
	push	ax
	push	WORD PTR [bp-42]	;dx
	call	_ARCTAN
	add	sp,4
	mov	WORD PTR [bp-12],ax	;angl
; Line 259
	mov	ax,WORD PTR _Knots
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,4
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	WORD PTR [bp-60],ax	;maxroll
; Line 260
	mov	ah,al
	sub	al,al
	push	ax
	neg	ax
	push	ax
	mov	ax,WORD PTR [bp-12]	;angl
	sub	ax,WORD PTR _OurHead
	push	ax
	call	_rng2
	add	sp,6
	shl	ax,1
	mov	WORD PTR [bp-44],ax	;dH
; Line 262
	mov	ax,32
	push	ax
	mov	ax,-32
	push	ax
	mov	cl,6
	mov	ax,WORD PTR [bp-44]	;dH
	sub	ax,WORD PTR _OurRoll
	sar	ax,cl
	push	ax
	call	_rng2
	add	sp,6
	neg	ax
	mov	WORD PTR _ROLLRATE,ax
; Line 263
	mov	ax,80
	push	ax
	mov	ax,35
	push	ax
	push	WORD PTR [bp-44]	;dH
	call	_abs
	add	sp,2
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,8
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	cx,ax
	mov	ax,WORD PTR [bp-18]	;dP
	mov	bx,cx
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,6
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	add	bx,ax
	push	bx
	call	_rng
	add	sp,6
	mov	WORD PTR _THRUST,ax
; Line 265
	mov	ax,24
	push	ax
	mov	ax,-24
	push	ax
	mov	ax,WORD PTR [bp-18]	;dP
	sar	ax,1
	sar	ax,1
	sub	ax,WORD PTR _Alt
	sar	ax,1
	mov	cl,7
	mov	dx,WORD PTR _PitchAngle
	sar	dx,cl
	add	ax,dx
	push	ax
	call	_rng2
	add	sp,6
	mov	WORD PTR [bp-18],ax	;dP
; Line 266
	mov	ax,16
	push	ax
	mov	ax,-16
	push	ax
	mov	cl,7
	mov	ax,WORD PTR _OurPitch
	add	ax,64
	sar	ax,cl
	sub	ax,WORD PTR [bp-18]	;dP
	neg	ax
	push	ax
	call	_rng2
	add	sp,6
	mov	WORD PTR _AOARATE,ax
; Line 268
	mov	ax,WORD PTR _MinAlt
	cmp	WORD PTR _Alt,ax
	jne	$I905
; Line 271
	or	BYTE PTR _Status,8
; Line 272
	sub	ax,ax
	mov	WORD PTR _THRUST,ax
	mov	WORD PTR _ROLLRATE,ax
	mov	WORD PTR _AOARATE,ax
; Line 273
; Line 274
$I905:
; Line 275
; Line 278
	mov	WORD PTR [bp-36],0	;wobble
; Line 280
	test	BYTE PTR _Damaged,4
	je	$I906
	mov	WORD PTR [bp-36],64	;wobble
; Line 282
$I906:
	cmp	WORD PTR [bp-36],0	;wobble
	jle	$I907
	mov	ax,WORD PTR _MinAlt
	cmp	WORD PTR _Alt,ax
	jbe	$I907
; Line 283
	push	WORD PTR [bp-36]	;wobble
	call	_rnd
	add	sp,2
	mov	cx,WORD PTR [bp-36]	;wobble
	sar	cx,1
	sub	ax,cx
	add	WORD PTR _ROLLRATE,ax
; Line 284
	push	WORD PTR [bp-36]	;wobble
	mov	si,cx
	call	_rnd
	add	sp,2
	sub	ax,si
	sar	ax,1
	add	WORD PTR _AOARATE,ax
; Line 285
; Line 288
$I907:
; Line 289
	test	BYTE PTR _Status,1
	jne	$JCC1601
	jmp	$I916
$JCC1601:
	cmp	WORD PTR _AOARATE,0
	je	$JCC1611
	jmp	$I916
$JCC1611:
	mov	ax,WORD PTR _MinSpd
	cmp	WORD PTR _AirSpeed,ax
	ja	$JCC1623
	jmp	$I916
$JCC1623:
	push	WORD PTR _OurRoll
	call	_abs
	add	sp,2
	cmp	ax,12288
	jl	$JCC1641
	jmp	$I916
$JCC1641:
	cmp	WORD PTR _Firing,0
	je	$JCC1651
	jmp	$I916
$JCC1651:
;	x = -62
;	y = -64
;	TFAlt = -66
; Line 293
	lea	ax,WORD PTR [bp-64]	;y
	push	ax
	lea	cx,WORD PTR [bp-62]	;MyDir
	push	cx
	push	WORD PTR _OurHead
	mov	dx,1024
	push	dx
	sub	dx,dx
	push	dx
	call	_Rotate2D
	add	sp,10
; Line 294
	mov	ax,WORD PTR [bp-64]	;y
	cwd	
	sub	cx,cx
	mov	bx,16
	sub	cx,ax
	sbb	bx,dx
	sub	cx,WORD PTR _PyLng
	sbb	bx,WORD PTR _PyLng+2
	push	bx
	push	cx
	mov	ax,WORD PTR [bp-62]	;MyDir
	cwd	
	add	ax,WORD PTR _PxLng
	adc	dx,WORD PTR _PxLng+2
	push	dx
	push	ax
	call	_GetQHeight
	add	sp,8
	sub	ax,WORD PTR _Alt
	neg	ax
	mov	WORD PTR [bp-66],ax	;TFAlt
; Line 295
	cwd	
	mov	cx,WORD PTR _RadarAlt
	mov	bx,WORD PTR _RadarAlt+2
	sar	bx,1
	rcr	cx,1
	sar	bx,1
	rcr	cx,1
	cmp	bx,dx
	jg	$I915
	jl	$L20010
	cmp	cx,ax
	jae	$I915
$L20010:
	mov	WORD PTR [bp-66],cx	;TFAlt
; Line 296
$I915:
; Line 297
	mov	cl,5
	mov	ax,WORD PTR _PitchAngle
	sub	ax,WORD PTR _OurPitch
	sar	ax,cl
	sub	WORD PTR [bp-66],62	;TFAlt
	sub	ax,WORD PTR [bp-66]	;TFAlt
	mov	WORD PTR [bp-18],ax	;dP
; Line 298
	or	ax,ax
	jle	$I916
; Line 299
	mov	cx,32
	push	cx
	sub	cx,cx
	push	cx
	shl	ax,1
	push	ax
	call	_rng
	add	sp,6
	mov	WORD PTR _AOARATE,ax
; Line 300
; Line 301
$I916:
; Line 304
	test	BYTE PTR _Damaged,8
	je	$I917
	cmp	WORD PTR _THRUST,100
	jle	$I917
; Line 305
	mov	WORD PTR _THRUST,100
; Line 306
; Line 309
$I917:
; Line 310
	mov	al,BYTE PTR _Damaged
	and	ax,3
	mov	WORD PTR [bp-30],ax	;z
	or	ax,ax
	je	$I922
; Line 311
	cmp	ax,3
	jne	$I919
; Line 312
	test	BYTE PTR _Damaged,4
	je	$I920
; Line 313
	mov	WORD PTR _ROLLRATE,64
; Line 314
	push	WORD PTR _OurRoll
	call	_abs
	add	sp,2
	cmp	ax,16384
	jle	$L20011
	mov	ax,16
	jmp	SHORT $L20012
$L20011:
	mov	ax,-8
$L20012:
	mov	WORD PTR _AOARATE,ax
; Line 315
; Line 316
$I920:
	mov	WORD PTR _THRUST,0
; Line 317
	jmp	SHORT $I922
$I919:
; Line 318
	cmp	WORD PTR _THRUST,50
	jle	$I922
	mov	WORD PTR _THRUST,50
; Line 319
$I922:
; Line 320
; Line 323
	cmp	WORD PTR _ejected,0
	jne	$JCC1910
	jmp	$I929
$JCC1910:
; Line 324
	mov	WORD PTR _GAMNT,0
; Line 326
	mov	WORD PTR _ROLLRATE,64
; Line 327
	push	WORD PTR _OurRoll
	call	_abs
	add	sp,2
	cmp	ax,16384
	jle	$L20013
	mov	ax,16
	jmp	SHORT $L20014
	nop	
$L20013:
	mov	ax,-8
$L20014:
	mov	WORD PTR _AOARATE,ax
; Line 329
	mov	ax,WORD PTR _ejected
	and	al,252
	cmp	ax,16
	jne	$I924
	mov	al,BYTE PTR _Rtime
	and	al,3
	cmp	al,1
	jne	$I924
; Line 330
	mov	WORD PTR _OurPitch,-16384
; Line 331
; Line 334
$I924:
	mov	ax,128
	cwd	
	idiv	WORD PTR _FrameRate
	push	ax
	mov	ax,-128
	cwd	
	idiv	WORD PTR _FrameRate
	push	ax
	mov	ax,32
	inc	WORD PTR _ejected
	sub	ax,WORD PTR _ejected
	push	ax
	call	_rng
	add	sp,6
	add	WORD PTR _ejectZ,ax
; Line 335
	js	$I926
	mov	ax,20
	imul	WORD PTR _FrameRate
	cmp	ax,WORD PTR _ejected
	jge	$I927
$I926:
; Line 336
	mov	WORD PTR _ejectZ,0
; Line 337
	test	BYTE PTR _Gtime,3
	jne	$I927
	mov	ax,13
	push	ax
	call	_EndGame
	add	sp,2
; Line 338
$I927:
; Line 340
	cmp	WORD PTR _Alt,0
	jne	$I929
; Line 341
	cmp	WORD PTR _AirSpeed,0
	je	$I930
; Line 342
	mov	ax,17
	push	ax
	mov	ax,4
	push	ax
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	ax
	push	WORD PTR _Alt
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	call	_StartASmoke
	add	sp,14
; Line 343
	sub	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,11
	push	ax
	call	_Sound
	add	sp,6
; Line 344
; Line 345
$I930:
	mov	WORD PTR _THRUST,0
	mov	WORD PTR _AirSpeed,0
; Line 346
; Line 347
$I929:
; Line 351
	mov	ax,WORD PTR _THRUST
	sub	ax,WORD PTR _ThrustI
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,2
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	cwd	
	idiv	WORD PTR _FrameRate
	add	WORD PTR _ThrustI,ax
	mov	ax,WORD PTR _THRUST
	cmp	WORD PTR _ThrustI,ax
	jge	$I932
	mov	ax,WORD PTR _ThrustI
	inc	ax
	mov	WORD PTR _ThrustI,ax
; Line 352
$I932:
	mov	ax,WORD PTR _ThrustI
	cmp	WORD PTR _THRUST,ax
	jge	$I933
	mov	ax,WORD PTR _THRUST
	mov	WORD PTR _ThrustI,ax
; Line 386
$I933:
	cmp	WORD PTR _Fuel,0
	jg	$I934
	sub	ax,ax
	mov	WORD PTR _ThrustI,ax
	mov	WORD PTR _THRUST,ax
	mov	WORD PTR _Fuel,ax
; Line 400
$I934:
	push	WORD PTR _OurRoll
	call	_abs
	add	sp,2
	mov	bx,ax
	and	bx,32512
	mov	cl,8
	sar	bx,cl
	mov	al,BYTE PTR _ReqdGees[bx]
	sub	ah,ah
	mov	WORD PTR _Gees,ax
; Line 401
	mov	ax,WORD PTR _MinAlt
	cmp	WORD PTR _Alt,ax
	jbe	$I935
	mov	ax,WORD PTR _AOARATE
	cwd	
	sub	ax,dx
	sar	ax,1
	add	WORD PTR _Gees,ax
; Line 402
$I935:
	cmp	WORD PTR _Gees,128
	jle	$I936
; Line 403
	mov	WORD PTR _Gees,128
; Line 404
	push	WORD PTR _AOARATE
	sub	ax,ax
	push	ax
	push	WORD PTR _OurRoll
	call	_abs
	add	sp,2
	mov	bx,ax
	and	bx,32512
	mov	cl,8
	sar	bx,cl
	mov	al,BYTE PTR _ReqdGees[bx]
	sub	ah,ah
	sub	ax,128
	neg	ax
	push	ax
	call	_rng
	add	sp,6
	mov	WORD PTR _AOARATE,ax
; Line 405
; Line 408
$I936:
	mov	ax,80
	push	ax
	push	WORD PTR _OurPitch
	call	_SinX
	add	sp,4
	sub	ax,WORD PTR _ThrustI
	neg	ax
	mov	cl,3
	shl	ax,cl
	mov	WORD PTR [bp-50],ax	;EqV
; Line 409
	mov	WORD PTR _MinKnots,100
; Line 413
	mov	ax,WORD PTR _OurAlt
	mov	cl,6
	shr	ax,cl
	add	ah,4
	mov	cx,100
	mul	cx
	mov	al,ah
	mov	ah,dl
	mov	dl,dh
	shl	dh,1
	sbb	dh,dh
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	mov	WORD PTR _MinKnots,ax
; Line 416
	mov	cx,ax
	mov	ax,WORD PTR [bp-50]	;EqV
	cwd	
	push	dx
	push	ax
	mov	ax,cx
	mov	cl,7
	mov	dx,WORD PTR _Alt
	shr	dx,cl
	add	dh,4
	sub	bx,bx
	push	bx
	push	dx
	mov	si,ax
	call	__aNlmul
	mov	al,ah
	mov	ah,dl
	mov	dl,dh
	shl	dh,1
	sbb	dh,dh
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	mov	WORD PTR [bp-50],ax	;EqV
	mov	cx,128
	sub	cx,WORD PTR _Gees
	imul	cx
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
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	mov	WORD PTR [bp-50],ax	;EqV
; Line 417
	mov	ax,WORD PTR _Gees
	shl	ax,1
	shl	ax,1
	push	ax
	call	_Sqrt
	add	sp,2
	mov	cx,ax
	mov	ax,si
	imul	cx
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	sar	dx,1
	rcr	ax,1
	mov	WORD PTR _MinKnots,ax
; Line 418
	push	ax
	call	_abs
	add	sp,2
	mov	WORD PTR _MinKnots,ax
; Line 421
	test	BYTE PTR _Status,1
	jne	$I939
; Line 422
	mov	cl,3
	mov	ax,WORD PTR [bp-50]	;EqV
	sar	ax,cl
	sub	WORD PTR [bp-50],ax	;EqV
; Line 423
; Line 425
$I939:
	mov	ax,27
	imul	WORD PTR _MinKnots
	mov	WORD PTR _MinSpd,ax
; Line 427
	mov	ax,899
	push	ax
	sub	ax,ax
	push	ax
	push	WORD PTR [bp-50]	;EqV
	call	_rng
	add	sp,6
	mov	cx,27
	imul	cx
	mov	WORD PTR [bp-26],ax	;EqSpeed
; Line 432
	mov	ax,WORD PTR _FrameRate
	cwd	
	push	dx
	push	ax
	mov	ax,16
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _AirSpeed
	cwd	
	mov	cx,ax
	mov	ax,WORD PTR [bp-26]	;EqSpeed
	mov	bx,dx
	cwd	
	sub	ax,cx
	sbb	dx,bx
	push	dx
	push	ax
	call	__aNldiv
	push	dx
	push	ax
	call	__aNldiv
	add	WORD PTR _AirSpeed,ax
	push	WORD PTR _AirSpeed
	call	_abs
	add	sp,2
	inc	ax
	cwd	
	push	dx
	push	ax
	mov	ax,3072
	imul	WORD PTR _MinSpd
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR _AOAttack,ax
; Line 433
	cmp	ax,8192
	jbe	$I940
	mov	WORD PTR _AOAttack,8192
; Line 434
$I940:
	mov	ax,WORD PTR _AOAttack
	sub	ax,768
	push	ax
	push	WORD PTR _OurRoll
	call	_CosX
	add	sp,4
	mov	WORD PTR _PitchAngle,ax
; Line 436
	test	BYTE PTR _Status,8
	je	$I945
; Line 437
	mov	ax,WORD PTR _MinAlt
	cmp	WORD PTR _Alt,ax
	jne	$I943
; Line 439
	mov	cx,-27
	cmp	WORD PTR _RealLandings,1
	sbb	ax,ax
	and	ax,4
	add	ax,8
	imul	cx
	cwd	
	idiv	WORD PTR _FrameRate
	add	WORD PTR _AirSpeed,ax
	cmp	WORD PTR _AirSpeed,32
	jae	$I945
	mov	WORD PTR _AirSpeed,0
; Line 440
	jmp	SHORT $I945
$I943:
; Line 441
	mov	ax,WORD PTR _AirSpeed
	sub	dx,dx
	div	WORD PTR _FrameRate
	mov	cl,4
	shr	ax,cl
	sub	WORD PTR _AirSpeed,ax
$I945:
; Line 442
; Line 444
	cmp	WORD PTR _AirSpeed,-20536
	jbe	$I946
	mov	WORD PTR _AirSpeed,0
; Line 446
$I946:
	push	WORD PTR _AirSpeed
	push	WORD PTR _OurPitch
	call	_CosX
	add	sp,4
	mov	WORD PTR [bp-34],ax	;GndSpeed
; Line 448
	mov	ax,WORD PTR _AirSpeed
	mov	cx,27
	sub	dx,dx
	div	cx
	mov	WORD PTR _Knots,ax
; Line 450
	cmp	WORD PTR _SNDDETAIL,1
	je	$I947
	cmp	WORD PTR _SNDDETAIL,3
	je	$I947
; Line 451
	push	WORD PTR _ThrustI
	push	ax
	mov	ax,29
	push	ax
	call	FAR PTR _SndSounds
	add	sp,6
; Line 452
; Line 461
$I947:
	mov	al,BYTE PTR _AirSpeed+1
	shr	al,1
	sub	ah,ah
	add	ax,32
	cwd	
	push	dx
	push	ax
	mov	cl,4
	mov	ax,WORD PTR _Gees
	shl	ax,cl
	push	ax
	push	WORD PTR _OurRoll
	call	_sinX
	add	sp,4
	cwd	
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
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-22],ax	;TurnRate
; Line 462
	push	ax
	push	WORD PTR _OurPitch
	call	_CosX
	add	sp,4
	mov	WORD PTR [bp-22],ax	;TurnRate
; Line 474
	mov	ax,WORD PTR _MinAlt
	cmp	WORD PTR _Alt,ax
	jne	$I950
; Line 475
	mov	cl,6
	mov	ax,WORD PTR _ROLLRATE
	shl	ax,cl
	neg	ax
	mov	WORD PTR [bp-22],ax	;TurnRate
; Line 476
	mov	WORD PTR _ROLLRATE,0
; Line 477
	mov	ax,WORD PTR _MinKnots
	cmp	WORD PTR _Knots,ax
	jge	$I950
; Line 478
	mov	WORD PTR _AOARATE,0
; Line 479
; Line 480
$I950:
; Line 482
	cmp	WORD PTR _ejected,0
	jne	$I952
	cmp	WORD PTR _REALFLIGHT,0
	je	$JCC2976
	jmp	$I951
$JCC2976:
$I952:
; Line 485
	mov	ax,WORD PTR _FrameRate
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _ROLLRATE
	cwd	
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
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-40],ax	;RollChg
	or	ax,ax
	je	$I953
; Line 486
	push	ax
	call	_Icos
	add	sp,2
	mov	WORD PTR _RC+8,ax
	mov	WORD PTR _RC,ax
; Line 487
	push	WORD PTR [bp-40]	;RollChg
	call	_Isin
	add	sp,2
	mov	WORD PTR _RC+2,ax
; Line 488
	neg	ax
	mov	WORD PTR _RC+6,ax
; Line 489
	mov	ax,OFFSET DGROUP:_RC
	push	ax
	mov	ax,OFFSET DGROUP:_FM
	push	ax
	call	_MatrixMul
	add	sp,4
; Line 490
; Line 492
$I953:
; Line 494
	mov	ax,WORD PTR _AOARATE
	mov	cl,7
	shl	ax,cl
	cwd	
	idiv	WORD PTR _FrameRate
	mov	WORD PTR [bp-32],ax	;PitchChg
	or	ax,ax
	je	$I955
; Line 495
	push	ax
	call	_Icos
	add	sp,2
	mov	WORD PTR _PC+16,ax
	mov	WORD PTR _PC+8,ax
; Line 496
	push	WORD PTR [bp-32]	;PitchChg
	call	_Isin
	add	sp,2
	mov	WORD PTR _PC+14,ax
; Line 497
	neg	ax
	mov	WORD PTR _PC+10,ax
; Line 498
	mov	ax,OFFSET DGROUP:_PC
	push	ax
	mov	ax,OFFSET DGROUP:_FM
	push	ax
	call	_MatrixMul
	add	sp,4
; Line 499
; Line 502
$I955:
; Line 503
	mov	ax,WORD PTR [bp-22]	;TurnRate
	cwd	
	idiv	WORD PTR _FrameRate
	mov	WORD PTR [bp-20],ax	;HeadChg
	or	ax,ax
	je	$I956
; Line 504
	push	ax
	call	_Icos
	add	sp,2
	mov	WORD PTR _HC+16,ax
	mov	WORD PTR _HC,ax
; Line 505
	push	WORD PTR [bp-20]	;HeadChg
	call	_Isin
	add	sp,2
	mov	WORD PTR _HC+4,ax
; Line 506
	neg	ax
	mov	WORD PTR _HC+12,ax
; Line 507
	mov	ax,OFFSET DGROUP:_FM
	push	ax
	mov	ax,OFFSET DGROUP:_HC
	push	ax
	call	_MatrixMul
	add	sp,4
; Line 508
; Line 510
$I956:
	call	_Decompose
; Line 512
	mov	ax,WORD PTR _MinSpd
	cmp	WORD PTR _AirSpeed,ax
	jae	$I959
	mov	cx,WORD PTR _MinAlt
	cmp	WORD PTR _Alt,cx
	jbe	$I959
; Line 514
	sub	ax,WORD PTR _AirSpeed
	mov	cl,BYTE PTR _RealLandings
	inc	cl
	shr	ax,cl
	sub	WORD PTR _OurPitch,ax
	js	$I960
	cmp	WORD PTR _Alt,200
	jae	$I959
$I960:
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,23
	push	ax
	call	_Sound
	add	sp,6
; Line 515
$I959:
; Line 517
	mov	ax,WORD PTR _MinAlt
	cmp	WORD PTR _Alt,ax
	jne	$I963
; Line 518
	cmp	WORD PTR _OurRoll,0
	je	$I962
; Line 519
	mov	WORD PTR _OurRoll,0
; Line 520
; Line 521
$I962:
	cmp	WORD PTR _OurPitch,0
	jl	$I964
	jle	$I963
	mov	ax,WORD PTR _MinKnots
	cmp	WORD PTR _Knots,ax
	jge	$I963
$I964:
; Line 522
	mov	WORD PTR _OurPitch,0
; Line 523
; Line 524
$I963:
; Line 527
	push	WORD PTR _OurRoll
	call	_abs
	add	sp,2
	cwd	
	sub	ax,dx
	sar	ax,1
	push	WORD PTR _OurPitch
	mov	si,ax
	call	_abs
	add	sp,2
	sub	ax,si
	cmp	ax,4096
	jle	$L20022
	mov	al,1
	jmp	SHORT $L20023
$L20022:
	sub	al,al
$L20023:
	mov	BYTE PTR _DoPitchLines,al
; Line 529
	push	WORD PTR _OurRoll
	push	WORD PTR _OurPitch
	push	WORD PTR _OurHead
	mov	ax,OFFSET DGROUP:_FM
	push	ax
	call	_MakeRotationMatrix
	add	sp,8
; Line 539
	mov	ax,WORD PTR _OurAlt
	mov	WORD PTR _OldAlt,ax
; Line 540
	mov	ax,WORD PTR _OurPitch
	sub	ax,WORD PTR _PitchAngle
	push	ax
	call	_Isin
	add	sp,2
	push	ax
	mov	cl,6
	mov	ax,WORD PTR _AirSpeed
	shr	ax,cl
	push	ax
	call	_TrgMul
	add	sp,4
	mov	WORD PTR _VVI,ax
; Line 542
	cmp	WORD PTR _AutoLand,0
	jne	$I966
; Line 543
	cwd	
	idiv	WORD PTR _FrameRate
	add	WORD PTR _OurAlt,ax
; Line 545
	push	WORD PTR _OurHead
	call	_Isin
	add	sp,2
	push	ax
	push	WORD PTR [bp-34]	;GndSpeed
	call	_TrgMul
	add	sp,4
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,6
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	cwd	
	idiv	WORD PTR _FrameRate
	cwd	
	add	WORD PTR _PxLng,ax
	adc	WORD PTR _PxLng+2,dx
; Line 546
	push	WORD PTR _OurHead
	call	_Icos
	add	sp,2
	push	ax
	push	WORD PTR [bp-34]	;GndSpeed
	call	_TrgMul
	add	sp,4
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,6
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	cwd	
	idiv	WORD PTR _FrameRate
	cwd	
	add	WORD PTR _PyLng,ax
	adc	WORD PTR _PyLng+2,dx
; Line 548
; Line 550
	jmp	SHORT $I966
	nop	
$I951:
; Line 551
	call	_ScottFlight
; Line 552
$I966:
; Line 557
	mov	ax,16
	mov	dx,ax
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
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
	mov	WORD PTR _Py,ax
; Line 560
	mov	ax,32256
	push	ax
	mov	ax,256
	push	ax
	mov	ax,WORD PTR _PxLng
	mov	dx,WORD PTR _PxLng+2
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
	mov	WORD PTR _Px,ax
	push	ax
	call	_rng
	add	sp,6
	mov	WORD PTR [bp-30],ax	;z
; Line 561
	mov	ax,WORD PTR _Px
	cmp	WORD PTR [bp-30],ax	;z
	je	$I968
; Line 562
	mov	ax,WORD PTR [bp-30]	;z
	mov	WORD PTR _Px,ax
; Line 563
	sub	dx,dx
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
	mov	WORD PTR _PxLng,ax
	mov	WORD PTR _PxLng+2,dx
; Line 564
; Line 565
$I968:
	mov	ax,32000
	push	ax
	mov	ax,512
	push	ax
	push	WORD PTR _Py
	call	_rng
	add	sp,6
	mov	WORD PTR [bp-30],ax	;z
; Line 566
	mov	ax,WORD PTR _Py
	cmp	WORD PTR [bp-30],ax	;z
	je	$I969
; Line 567
	mov	ax,WORD PTR [bp-30]	;z
	mov	WORD PTR _Py,ax
; Line 568
	sub	ax,-32768
	neg	ax
	sub	dx,dx
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
	mov	WORD PTR _PyLng,ax
	mov	WORD PTR _PyLng+2,dx
; Line 569
; Line 571
$I969:
	cmp	WORD PTR _OurAlt,-3536
	ja	$I971
	mov	ax,WORD PTR _MinAlt
	cmp	WORD PTR _OurAlt,ax
	jae	$I970
$I971:
	mov	ax,WORD PTR _MinAlt
	mov	WORD PTR _OurAlt,ax
; Line 572
$I970:
	cmp	WORD PTR _OurAlt,-5536
	jbe	$I972
	mov	WORD PTR _OurAlt,-5536
; Line 574
$I972:
	mov	ax,WORD PTR _OurAlt
	shr	ax,1
	shr	ax,1
	mov	WORD PTR _Alt,ax
; Line 577
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	ax
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	call	_GetQHeight
	add	sp,8
	mov	WORD PTR [bp-24],ax	;GroundH
; Line 579
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	ax
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	call	_GetQHeight
	add	sp,8
	cwd	
	mov	cx,WORD PTR _OurAlt
	sub	bx,bx
	sub	cx,ax
	sbb	bx,dx
	mov	WORD PTR _RadarAlt,cx
	mov	WORD PTR _RadarAlt+2,bx
; Line 584
	mov	al,BYTE PTR _Rtime
	and	ax,15
	mov	WORD PTR [bp-56],ax	;n
; Line 585
	mov	bx,ax
	mov	cl,4
	shl	bx,cl
	mov	ax,WORD PTR _OurHead
	mov	WORD PTR _chs[bx+10],ax
; Line 586
	mov	ax,WORD PTR _OurPitch
	mov	WORD PTR _chs[bx+12],ax
; Line 587
	mov	ax,WORD PTR _OurRoll
	mov	WORD PTR _chs[bx+14],ax
; Line 588
	mov	ax,WORD PTR _PxLng
	mov	dx,WORD PTR _PxLng+2
	mov	WORD PTR _chs[bx],ax
	mov	WORD PTR _chs[bx+2],dx
; Line 589
	mov	ax,WORD PTR _PyLng
	mov	dx,WORD PTR _PyLng+2
	mov	WORD PTR _chs[bx+4],ax
	mov	WORD PTR _chs[bx+6],dx
; Line 590
	mov	ax,WORD PTR _Alt
	mov	WORD PTR _chs[bx+8],ax
; Line 592
	cmp	WORD PTR _DESIGNATED,-1
	je	$I973
; Line 593
	mov	ax,12
	push	ax
	sub	ax,ax
	push	ax
	mov	ax,40
	imul	WORD PTR _DESIGNATED
	mov	bx,ax
	mov	ax,WORD PTR _Py
	sub	ax,WORD PTR _ps[bx+4]
	push	ax
	mov	ax,WORD PTR _Px
	sub	ax,WORD PTR _ps[bx+2]
	push	ax
	call	_Dist2D
	add	sp,4
	imul	WORD PTR _LastRate
	mov	al,ah
	cbw	
	push	ax
	call	_rng
	add	sp,6
	jmp	SHORT $L20094
$I973:
; Line 595
	mov	ax,WORD PTR _LastRate
	dec	ax
$L20094:
	mov	WORD PTR [bp-56],ax	;n
; Line 596
; Line 598
	mov	ax,WORD PTR _OurHead
	mov	cl,4
	mov	bl,BYTE PTR _Rtime
	sub	bl,BYTE PTR [bp-56]	;n
	and	bx,15
	mov	WORD PTR [bp-56],bx	;n
	shl	bx,cl
	sub	ax,WORD PTR _chs[bx+10]
	mov	WORD PTR [bp-44],ax	;dH
; Line 599
	mov	cx,WORD PTR _OurPitch
	sub	cx,WORD PTR _chs[bx+12]
	mov	WORD PTR [bp-18],cx	;dP
; Line 600
	sar	cx,1
	sar	cx,1
	push	cx
	push	WORD PTR _OurRoll
	mov	si,ax
	call	_sinX
	add	sp,4
	neg	si
	sar	si,1
	sar	si,1
	push	si
	push	WORD PTR _OurRoll
	mov	si,ax
	call	_cosX
	add	sp,4
	add	si,ax
	mov	WORD PTR _sightX,si
; Line 601
	mov	ax,WORD PTR [bp-18]	;dP
	sar	ax,1
	push	ax
	push	WORD PTR _OurRoll
	call	_cosX
	add	sp,4
	mov	cx,WORD PTR [bp-44]	;dH
	sar	cx,1
	sar	cx,1
	push	cx
	push	WORD PTR _OurRoll
	mov	si,ax
	call	_sinX
	add	sp,4
	add	si,ax
	mov	WORD PTR _sightY,si
; Line 602
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_FLIGHT	ENDP
; Line 613
	PUBLIC	_TAStoIAS
_TAStoIAS	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	si
;	i = -4
;	j = -6
;	D = -2
;	TAS = 4
; Line 618
	mov	cx,-5000
	mov	ax,WORD PTR _OurAlt
	mov	bx,5000
	sub	dx,dx
	div	bx
	mov	WORD PTR [bp-4],ax	;i
	imul	cx
	add	ax,WORD PTR _OurAlt
	mov	cx,10
	cwd	
	idiv	cx
; Line 621
	mov	cx,500
	push	cx
	push	ax
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	mov	ax,WORD PTR _DNSTSQR[bx+2]
	sub	ax,WORD PTR _DNSTSQR[bx]
	push	ax
	mov	si,bx
	call	_MDiv
	add	sp,6
	add	ax,WORD PTR _DNSTSQR[si]
	push	ax
	mov	ax,1000
	push	ax
	push	WORD PTR [bp+4]	;TAS
	call	_MDiv
	add	sp,6
; Line 622
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_TAStoIAS	ENDP
; Line 626
	PUBLIC	_TblTRPL
_TblTRPL	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	si
;	i = -4
;	j = -6
;	D = -2
;	interval = 8
;	val = 6
;	TBL = 4
; Line 631
	mov	ax,WORD PTR [bp+6]	;val
	sub	dx,dx
	div	WORD PTR [bp+8]	;interval
	mov	WORD PTR [bp-4],ax	;i
	mul	WORD PTR [bp+8]	;interval
	sub	ax,WORD PTR [bp+6]	;val
	neg	ax
; Line 633
	mov	cx,WORD PTR [bp+8]	;interval
	shr	cx,1
	push	cx
	shr	ax,1
	push	ax
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	add	bx,WORD PTR [bp+4]	;TBL
	mov	ax,WORD PTR [bx+2]
	sub	ax,WORD PTR [bx]
	push	ax
	mov	si,bx
	call	_MDiv
	add	sp,6
	add	ax,WORD PTR [si]
; Line 635
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	nop	

_TblTRPL	ENDP
; Line 638
; Line 704
	PUBLIC	_PlaneDrag
_PlaneDrag	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
;	i = -6
;	p = -2
;	t = -4
; Line 707
	sub	ax,ax
	mov	WORD PTR [bp-2],ax	;p
	mov	WORD PTR [bp-6],ax	;i
	jmp	SHORT $F1021
; Line 710
; Line 711
	nop	
$SC1028:
; Line 712
	cmp	WORD PTR [bp-6],4	;i
	jge	$I1029
; Line 713
	add	WORD PTR [bp-2],20	;p
; Line 714
$I1029:
	add	WORD PTR [bp-2],3	;p
; Line 725
$FC1022:
	inc	WORD PTR [bp-6]	;i
$F1021:
	cmp	WORD PTR [bp-6],12	;i
	jge	$FB1023
; Line 708
; Line 709
	mov	bx,WORD PTR [bp-6]	;i
	shl	bx,1
	mov	ax,WORD PTR _F14_STATION[bx]
	sub	ax,15
	je	$SC1028
	sub	ax,3
	je	$SC1030
	dec	ax
	dec	ax
	jne	$FC1022
; Line 716
$SC1030:
; Line 718
	inc	WORD PTR [bp-2]	;p
; Line 719
	jmp	SHORT $FC1022
; Line 720
	nop	
$FB1023:
; Line 726
	mov	ax,WORD PTR [bp-2]	;p
	cwd	
	sub	ax,dx
	sar	ax,1
	add	ax,26
; Line 727
	mov	sp,bp
	pop	bp
	ret	
	nop	

_PlaneDrag	ENDP
; Line 730
	PUBLIC	_PlaneWeight
_PlaneWeight	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,10
	call	__aNchkstk
;	i = -8
;	j = -10
;	c = -2
;	W = -6
; Line 734
	mov	WORD PTR [bp-6],-25536	;W
	mov	WORD PTR [bp-4],0
; Line 735
	mov	WORD PTR [bp-8],0	;i
$FC1038:
; Line 736
	mov	bx,WORD PTR [bp-8]	;i
	shl	bx,1
	cmp	WORD PTR _F14_STATION[bx],0
	jle	$L20095
; Line 737
	mov	bx,WORD PTR _F14_STATION[bx]
	shl	bx,1
	mov	ax,WORD PTR _W_WEIGHTS[bx]
	cwd	
	add	WORD PTR [bp-6],ax	;W
	adc	WORD PTR [bp-4],dx
; Line 738
$L20095:
	inc	WORD PTR [bp-8]	;i
	cmp	WORD PTR [bp-8],12	;i
	jl	$FC1038
; Line 743
	mov	ax,WORD PTR _Fuel
	cwd	
	add	WORD PTR [bp-6],ax	;W
	adc	WORD PTR [bp-4],dx
	mov	ax,WORD PTR [bp-6]	;W
	mov	dx,WORD PTR [bp-4]
; Line 744
	mov	sp,bp
	pop	bp
	ret	

_PlaneWeight	ENDP
; Line 774
	PUBLIC	_InitScottFlight
_InitScottFlight	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,32
	call	__aNchkstk
	push	di
	push	si
;	T = -4
;	V = -10
;	M = -28
; Line 780
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	call	__aNlmul
	mov	WORD PTR _FPARAMS,ax
	mov	WORD PTR _FPARAMS+2,dx
; Line 781
	mov	ax,WORD PTR _OurAlt
	sub	dx,dx
	mov	WORD PTR [bp-4],ax	;T
	mov	WORD PTR [bp-2],dx
; Line 782
	mov	cx,100
	sub	bx,bx
	push	bx
	push	cx
	push	dx
	push	ax
	call	__aNlmul
	mov	WORD PTR _FPARAMS+4,ax
	mov	WORD PTR _FPARAMS+6,dx
; Line 783
	mov	ax,100
	cwd	
	push	dx
	push	ax
	sub	cx,cx
	mov	bx,16
	sub	cx,WORD PTR _PyLng
	sbb	bx,WORD PTR _PyLng+2
	push	bx
	push	cx
	call	__aNlmul
	mov	WORD PTR _FPARAMS+8,ax
	mov	WORD PTR _FPARAMS+10,dx
; Line 784
	mov	ax,OFFSET DGROUP:_FPARAMS+24
	push	ax
	push	WORD PTR _OurRoll
	mov	cx,WORD PTR _OurPitch
	neg	cx
	push	cx
	push	WORD PTR _OurHead
	call	_MakeMatHPR
	add	sp,8
; Line 786
	sub	ax,ax
	mov	WORD PTR [bp-8],ax
	mov	WORD PTR [bp-10],ax	;V
; Line 787
	mov	cl,4
	mov	ax,WORD PTR _AirSpeed
	shr	ax,cl
	neg	ax
	mov	WORD PTR [bp-6],ax
; Line 794
	lea	ax,WORD PTR [bp-28]	;M
	push	ax
	mov	cx,OFFSET DGROUP:_FPARAMS+24
	push	cx
	call	_Trans3X3
	add	sp,4
; Line 795
	lea	ax,WORD PTR [bp-28]	;M
	push	ax
	lea	ax,WORD PTR [bp-10]	;V
	push	ax
	call	_Rotate
	add	sp,4
; Line 798
	mov	ax,WORD PTR [bp-8]
	cwd	
	mov	WORD PTR _FPARAMS+16,ax
	mov	WORD PTR _FPARAMS+18,dx
; Line 799
	mov	cx,ax
	mov	ax,WORD PTR [bp-6]
	mov	bx,dx
	cwd	
	mov	WORD PTR _FPARAMS+20,ax
	mov	WORD PTR _FPARAMS+22,dx
; Line 800
	mov	si,100
	sub	di,di
	push	di
	push	si
	mov	si,ax
	mov	ax,WORD PTR [bp-10]	;V
	mov	di,dx
	cwd	
	mov	WORD PTR _FPARAMS+12,ax
	mov	WORD PTR _FPARAMS+14,dx
	push	dx
	push	ax
	mov	WORD PTR [bp-32],cx
	mov	WORD PTR [bp-30],bx
	call	__aNlmul
	mov	WORD PTR _FPARAMS+12,ax
	mov	WORD PTR _FPARAMS+14,dx
; Line 801
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-30]
	push	WORD PTR [bp-32]
	call	__aNlmul
	mov	WORD PTR _FPARAMS+16,ax
	mov	WORD PTR _FPARAMS+18,dx
; Line 802
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	di
	push	si
	call	__aNlmul
	mov	WORD PTR _FPARAMS+20,ax
	mov	WORD PTR _FPARAMS+22,dx
; Line 804
	push	WORD PTR _AirSpeed
	call	_Get1GTrim
	add	sp,2
	mov	WORD PTR _TRIM,ax
; Line 807
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	

_InitScottFlight	ENDP
; Line 827
	PUBLIC	_Density
_Density	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,6
	call	__aNchkstk
	push	si
;	i = -4
;	j = -6
;	D = -2
;	ALT = 4
; Line 833
	mov	cx,-5000
	mov	ax,WORD PTR [bp+4]	;ALT
	mov	bx,5000
	sub	dx,dx
	div	bx
	mov	WORD PTR [bp-4],ax	;i
	mul	cx
	add	ax,WORD PTR [bp+4]	;ALT
	mov	cx,10
	sub	dx,dx
	div	cx
; Line 836
	mov	cx,500
	push	cx
	push	ax
	mov	bx,WORD PTR [bp-4]	;i
	shl	bx,1
	mov	ax,WORD PTR _DNSTBL[bx+2]
	sub	ax,WORD PTR _DNSTBL[bx]
	push	ax
	mov	si,bx
	call	_MDiv
	add	sp,6
	add	ax,WORD PTR _DNSTBL[si]
; Line 837
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_Density	ENDP
; Line 843
	PUBLIC	_EngineBreathe
_EngineBreathe	PROC NEAR
	push	bp
	mov	bp,sp
	xor	ax,ax
	call	__aNchkstk
;	ALT = 4
; Line 845
	cmp	WORD PTR _THRUST,100
	jle	$I1077
; Line 846
	mov	ax,10000
	push	ax
	push	WORD PTR [bp+4]	;ALT
	mov	ax,OFFSET DGROUP:_MAXENGAIR
$L20096:
	push	ax
	call	_TblTRPL
	mov	sp,bp
	pop	bp
	ret	
; Line 848
	nop	
$I1077:
	mov	ax,10000
	push	ax
	push	WORD PTR [bp+4]	;ALT
	mov	ax,OFFSET DGROUP:_MILENGAIR
	jmp	SHORT $L20096
; Line 850

_EngineBreathe	ENDP
; Line 884
	PUBLIC	_Get1GTrim
_Get1GTrim	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,16
	call	__aNchkstk
	push	si
;	RELWND = -12
;	i = -10
;	STICKGS = -8
;	WEIGHT = -4
;	MAXSTICKGS = -16
;	AirSpeed = 4
; Line 888
	mov	cl,4
	mov	ax,WORD PTR [bp+4]	;AirSpeed
	sar	ax,cl
	push	ax
	call	_TAStoIAS
	add	sp,2
	mov	WORD PTR [bp-12],ax	;RELWND
; Line 889
	call	_PlaneWeight
	mov	WORD PTR [bp-4],ax	;WEIGHT
	mov	WORD PTR [bp-2],dx
; Line 890
	cmp	WORD PTR [bp-12],680	;RELWND
	jl	$I1103
; Line 891
	mov	ax,WORD PTR _GTABLE+34
	jmp	SHORT $L20097
$I1103:
; Line 893
; Line 896
	mov	ax,WORD PTR [bp-12]	;RELWND
	mov	cx,40
	cwd	
	idiv	cx
	mov	bx,ax
	shl	bx,1
	mov	si,-40
	mov	ax,WORD PTR [bp-12]	;RELWND
	cwd	
	idiv	si
	imul	cx
	mov	si,ax
	add	si,WORD PTR [bp-12]	;RELWND
	mov	WORD PTR [bp-10],si	;i
	mov	ax,WORD PTR _GTABLE[bx+2]
	sub	ax,WORD PTR _GTABLE[bx]
	imul	si
	cwd	
	idiv	cx
	add	ax,WORD PTR _GTABLE[bx]
$L20097:
	cwd	
	mov	WORD PTR [bp-16],ax	;MAXSTICKGS
	mov	WORD PTR [bp-14],dx
; Line 897
; Line 900
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-2]
	push	WORD PTR [bp-4]	;WEIGHT
	call	__aNldiv
	push	dx
	push	ax
	mov	ax,400
	cwd	
	push	dx
	push	ax
	mov	al,5
	push	ax
	lea	ax,WORD PTR [bp-16]	;MAXSTICKGS
	push	ax
	call	__aNNalshl
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-16],ax	;MAXSTICKGS
	mov	WORD PTR [bp-14],dx
	or	dx,dx
	jl	$I1105
	jg	$L20028
	cmp	ax,28800
	jbe	$I1105
$L20028:
	mov	WORD PTR [bp-16],28800	;MAXSTICKGS
	mov	WORD PTR [bp-14],0
; Line 902
$I1105:
; Line 903
	mov	ax,WORD PTR [bp-16]	;MAXSTICKGS
	mov	dx,WORD PTR [bp-14]
	add	ax,1
	adc	dx,0
	push	dx
	push	ax
	mov	ax,16384
	mov	dx,6
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-8],ax	;STICKGS
	mov	WORD PTR [bp-6],dx
	or	dx,dx
	jl	$I1106
	jg	$L20029
	cmp	ax,128
	jbe	$I1106
$L20029:
; Line 904
	mov	WORD PTR [bp-8],128	;STICKGS
	mov	WORD PTR [bp-6],0
; Line 905
$I1106:
	mov	ax,WORD PTR [bp-8]	;STICKGS
; Line 906
	pop	si
	mov	sp,bp
	pop	bp
	ret	

_Get1GTrim	ENDP
; Line 910
	PUBLIC	_ToggleAutoTrim
_ToggleAutoTrim	PROC NEAR
	xor	ax,ax
	call	__aNchkstk
; Line 911
	xor	BYTE PTR _AutoTrim,1
; Line 912
	cmp	WORD PTR _ConfigData+4,2
	jne	$I1110
; Line 913
; Line 914
	cmp	WORD PTR _AutoTrim,0
	je	$I1111
; Line 915
; Line 916
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:$SG1112
	jmp	SHORT $L20098
	nop	
$I1111:
; Line 919
; Line 920
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:$SG1114
	jmp	SHORT $L20098
	nop	
$I1110:
; Line 924
; Line 925
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:$SG1116
$L20098:
	push	ax
	call	_Message
	add	sp,4
; Line 926
; Line 927
	ret	
	nop	

_ToggleAutoTrim	ENDP
; Line 932
	PUBLIC	_TrimIt
_TrimIt	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,20
	call	__aNchkstk
;	str = -20
;	amnt = 4
; Line 935
	cmp	WORD PTR _ConfigData+4,2
	je	$I1121
; Line 936
; Line 937
	mov	ax,5
	push	ax
	mov	ax,OFFSET DGROUP:$SG1122
	jmp	SHORT $L20099
; Line 939
; Line 942
	nop	
$I1121:
; Line 944
	mov	ax,WORD PTR [bp+4]	;amnt
	add	WORD PTR _TRIM,ax
	cmp	WORD PTR _TRIM,126
	jle	$I1123
	mov	WORD PTR _TRIM,126
; Line 945
$I1123:
	cmp	WORD PTR _TRIM,-126
	jge	$I1124
	mov	WORD PTR _TRIM,-126
; Line 946
$I1124:
	push	WORD PTR _TRIM
	mov	ax,OFFSET DGROUP:$SG1126
	push	ax
	lea	ax,WORD PTR [bp-20]	;str
	push	ax
	call	_sprintf
	add	sp,6
; Line 947
	mov	ax,5
	push	ax
	lea	ax,WORD PTR [bp-20]	;str
$L20099:
	push	ax
	call	_Message
; Line 948
	mov	sp,bp
	pop	bp
	ret	

_TrimIt	ENDP
; Line 958
	PUBLIC	_DoFuel
_DoFuel	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,8
	call	__aNchkstk
;	T = -8
;	TBL = -2
;	D = -6
; Line 965
	mov	ax,WORD PTR _Fticks
	add	WORD PTR _fueltime,ax
	cmp	WORD PTR _fueltime,180
	jg	$JCC5274
	jmp	$I1137
$JCC5274:
; Line 966
; Line 970
	mov	ax,10000
	push	ax
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+6
	push	WORD PTR _FPARAMS+4
	call	__aNldiv
	push	ax
	cmp	WORD PTR _THRUST,100
	jle	$L20030
	mov	ax,OFFSET DGROUP:_MaxFuelTBL
	jmp	SHORT $L20031
	nop	
$L20030:
	mov	ax,OFFSET DGROUP:_MilFuelTBL
$L20031:
	push	ax
	call	_TblTRPL
	add	sp,6
	mov	WORD PTR [bp-8],ax	;T
; Line 973
	mov	ax,3600
	push	ax
	push	WORD PTR [bp-8]	;T
	push	WORD PTR _fueltime
	call	_MDiv
	add	sp,6
	mov	WORD PTR [bp-8],ax	;T
	cmp	ax,1
	jge	$I1138
	mov	WORD PTR [bp-8],1	;T
; Line 975
$I1138:
	cmp	WORD PTR _Fuel,1500
	jl	$I1139
	mov	ax,WORD PTR _Fuel
	sub	ax,WORD PTR [bp-8]	;T
	cmp	ax,1500
	jge	$I1139
; Line 976
; Line 977
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1140
	push	ax
	call	_Message
	add	sp,4
; Line 979
	mov	ax,1
	mov	WORD PTR _LLowFuelWarn,ax
	mov	WORD PTR _RLowFuelWarn,ax
; Line 980
; Line 981
$I1139:
	mov	ax,WORD PTR _BingoFuel
	cmp	WORD PTR _Fuel,ax
	jl	$I1141
	mov	cx,WORD PTR _Fuel
	sub	cx,WORD PTR [bp-8]	;T
	cmp	cx,ax
	jge	$I1141
; Line 982
; Line 983
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1142
	push	ax
	call	_Message
; Line 984
	mov	WORD PTR _BingoFuelWarn,1
; Line 985
; Line 987
$I1141:
	mov	ax,WORD PTR [bp-8]	;T
	sub	WORD PTR _Fuel,ax
; Line 988
	mov	WORD PTR _fueltime,0
; Line 989
; Line 990
$I1137:
	mov	sp,bp
	pop	bp
	ret	
	nop	

_DoFuel	ENDP
; Line 997
	PUBLIC	_ScottFlight
_ScottFlight	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,260
	call	__aNchkstk
	push	di
	push	si
;	DELHEAD = -104
;	TMP = -16
;	MASS = -66
;	STICKGS = -112
;	WEIGHT = -108
;	MAXSTICKGS = -222
;	G = -102
;	LIFTGS = -158
;	DRAGS = -10
;	NEWAOA = -180
;	V = -82
;	FPV = -196
;	VSQ = -176
;	XR = -164
;	RELWND = -184
;	LTHRUST = -76
;	stx = -228
;	sty = -2
;	DVX = -42
;	DVY = -52
;	DVZ = -62
;	SFticks = -90
;	CLCD = -72
;	CP = -48
;	DNSTY = -38
;	i = -154
;	OLDH = -86
;	OLDP = -226
;	OLDR = -6
;	n = -218
;	dH = -182
;	dP = -58
;	ALT = -4
;	D = -56
;	UTMP = -68
;	UTMP1 = -84
;	CLEAN = -44
;	str = -152
;	TM = -34
;	PM = -216
;	RM = -246
;	DELROLL = -224
;	DELPITCH = -198
; Line 1024
	call	_DoFuel
; Line 1033
	cmp	WORD PTR _ONTHECAT,0
	jne	$I1191
	cmp	WORD PTR _ONTHEHOOK,0
	je	$I1190
$I1191:
; Line 1034
	mov	ax,1
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
; Line 1035
; Line 1038
	nop	
$I1190:
	push	WORD PTR _FPARAMS+10
	push	WORD PTR _FPARAMS+8
	push	WORD PTR _FPARAMS+6
	push	WORD PTR _FPARAMS+4
	push	WORD PTR _FPARAMS+2
	push	WORD PTR _FPARAMS
	call	_OnTheDeck
	add	sp,12
	mov	WORD PTR [bp-154],ax	;i
	or	ax,ax
	jne	$JCC5528
	jmp	$I1193
$JCC5528:
; Line 1039
	push	ax
	mov	ax,OFFSET DGROUP:_FPARAMS
	push	ax
	call	_Splatted
	add	sp,4
	or	ax,ax
	jne	$I1191
; Line 1042
; Line 1043
	cmp	WORD PTR _FPARAMS+6,ax
	jge	$JCC5552
	jmp	$I1204
$JCC5552:
	jg	$L20032
	cmp	WORD PTR _FPARAMS+4,6600
	jae	$JCC5565
	jmp	$I1204
$JCC5565:
$L20032:
; Line 1044
	cmp	WORD PTR [bp-154],2	;i
	jge	$JCC5575
	jmp	$I1204
$JCC5575:
; Line 1045
	mov	ax,WORD PTR [bp-154]	;i
	dec	ax
	mov	WORD PTR _ONTHEHOOK,ax
; Line 1046
	mov	ax,WORD PTR _tchdwnrating
	mov	WORD PTR _LSORating,ax
; Line 1047
	cmp	WORD PTR [bp-154],3	;i
	je	$I1199
	cmp	WORD PTR [bp-154],4	;i
	jne	$I1198
$I1199:
	add	WORD PTR _LSORating,10
; Line 1048
$I1198:
	cmp	WORD PTR _LSORating,0
	jge	$I1200
	mov	WORD PTR _LSORating,0
; Line 1049
$I1200:
	push	WORD PTR _ONTHEHOOK
	mov	ax,OFFSET DGROUP:$SG1201
	push	ax
	lea	ax,WORD PTR [bp-152]	;str
	push	ax
	call	_sprintf
	add	sp,6
; Line 1050
	mov	ax,2
	push	ax
	lea	cx,WORD PTR [bp-152]	;str
	push	cx
	call	_Message
	add	sp,4
; Line 1051
	push	WORD PTR _LSORating
	mov	ax,OFFSET DGROUP:$SG1202
	push	ax
	lea	ax,WORD PTR [bp-152]	;str
	push	ax
	call	_sprintf
	add	sp,6
; Line 1052
	mov	ax,2
	push	ax
	lea	ax,WORD PTR [bp-152]	;str
	push	ax
	call	_Message
	add	sp,4
; Line 1053
	sub	ax,ax
	push	ax
	push	ax
	push	ax
	push	WORD PTR _ONTHEHOOK
	mov	ax,WORD PTR _LSORating
	neg	ax
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
	mov	ax,33
	push	ax
	call	_LogIt
	add	sp,24
; Line 1054
	mov	ax,77
	push	ax
	call	_Speech
	add	sp,2
; Line 1055
; Line 1056
; Line 1057
	jmp	SHORT $I1204
$I1193:
; Line 1058
	mov	WORD PTR _tchdwnrating,0
; Line 1059
$I1204:
; Line 1061
	mov	WORD PTR _FASTROLL,1
; Line 1062
	cmp	WORD PTR _ConfigData+4,2
	jne	$I1205
	cmp	WORD PTR _AutoTrim,0
	jne	$I1206
	cmp	WORD PTR _Speedy,1
	jle	$I1205
$I1206:
; Line 1063
; Line 1064
	push	WORD PTR _AirSpeed
	call	_Get1GTrim
	add	sp,2
	mov	WORD PTR _TRIM,ax
; Line 1065
; Line 1068
$I1205:
	cmp	WORD PTR _Knots,350
	jle	$I1207
	test	BYTE PTR _Status,1
	jne	$I1207
	test	BYTE PTR _Damaged,4
	jne	$I1207
; Line 1069
	mov	WORD PTR _AutoGearOk,0
; Line 1070
	or	BYTE PTR _Status,1
; Line 1071
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1208
	push	ax
	call	_Message
	add	sp,4
; Line 1072
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,34
	push	ax
	call	_Sound
	add	sp,6
; Line 1073
; Line 1076
$I1207:
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+2
	push	WORD PTR _FPARAMS
	call	__aNldiv
	cmp	ax,WORD PTR _PxLng
	jne	$L20034
	cmp	dx,WORD PTR _PxLng+2
	je	$I1209
$L20034:
; Line 1077
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	call	__aNlmul
	mov	WORD PTR _FPARAMS,ax
	mov	WORD PTR _FPARAMS+2,dx
; Line 1078
	mov	ax,100
	mul	WORD PTR _OurAlt
	mov	WORD PTR _FPARAMS+4,ax
	mov	WORD PTR _FPARAMS+6,dx
; Line 1079
; Line 1080
$I1209:
	mov	ax,-100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+10
	push	WORD PTR _FPARAMS+8
	call	__aNldiv
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	or	ax,ax
	jne	$L20035
	cmp	dx,-16
	je	$I1210
$L20035:
; Line 1081
	mov	ax,100
	cwd	
	push	dx
	push	ax
	sub	cx,cx
	mov	bx,16
	sub	cx,WORD PTR _PyLng
	sbb	bx,WORD PTR _PyLng+2
	push	bx
	push	cx
	call	__aNlmul
	mov	WORD PTR _FPARAMS+8,ax
	mov	WORD PTR _FPARAMS+10,dx
; Line 1082
	mov	ax,100
	mul	WORD PTR _OurAlt
	mov	WORD PTR _FPARAMS+4,ax
	mov	WORD PTR _FPARAMS+6,dx
; Line 1083
; Line 1088
$I1210:
	mov	WORD PTR _MYCLCD,35
	mov	WORD PTR [bp-72],35	;CLCD
	mov	WORD PTR [bp-70],0
; Line 1093
	call	_PlaneDrag
	mov	WORD PTR _MYCP,ax
	cwd	
	mov	WORD PTR [bp-48],ax	;CP
	mov	WORD PTR [bp-46],dx
; Line 1095
	mov	ax,WORD PTR _Fticks
	cwd	
	mov	WORD PTR [bp-90],ax	;SFticks
	mov	WORD PTR [bp-88],dx
; Line 1096
	or	dx,dx
	jg	$I1211
	jl	$L20036
	cmp	ax,1
	jae	$I1211
$L20036:
	mov	WORD PTR [bp-90],1	;SFticks
	mov	WORD PTR [bp-88],0
; Line 1098
$I1211:
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+6
	push	WORD PTR _FPARAMS+4
	call	__aNldiv
	mov	WORD PTR [bp-4],ax	;ALT
; Line 1100
	mov	WORD PTR [bp-44],0	;CLEAN
; Line 1101
	call	_PlaneWeight
	mov	WORD PTR [bp-108],ax	;WEIGHT
	mov	WORD PTR [bp-106],dx
	mov	WORD PTR [bp-56],ax	;D
	mov	WORD PTR [bp-54],dx
; Line 1114
	push	WORD PTR [bp-4]	;ALT
	call	_Density
	add	sp,2
	cwd	
	mov	WORD PTR [bp-38],ax	;DNSTY
	mov	WORD PTR [bp-36],dx
; Line 1115
	cmp	WORD PTR _THRUST,100
	jl	$I1212
	mov	WORD PTR _DirectLiftControl,0
; Line 1117
$I1212:
	mov	ax,32
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-106]
	push	WORD PTR [bp-108]	;WEIGHT
	call	__aNldiv
	mov	WORD PTR [bp-66],ax	;MASS
	mov	WORD PTR [bp-64],dx
; Line 1121
	cmp	WORD PTR _THRUST,100
	jle	$L20037
	mov	ax,160
	jmp	SHORT $L20038
$L20037:
	mov	ax,WORD PTR _THRUST
$L20038:
	mov	cx,388
	imul	cx
	mov	WORD PTR [bp-76],ax	;LTHRUST
	mov	WORD PTR [bp-74],dx
; Line 1122
	or	dx,dx
	jl	$I1213
	jg	$L20039
	cmp	ax,-9536
	jbe	$I1213
$L20039:
	mov	WORD PTR [bp-76],-9536	;LTHRUST
	mov	WORD PTR [bp-74],0
; Line 1124
$I1213:
	cmp	WORD PTR _ConfigData+4,0
	jne	$I1214
; Line 1125
	mov	WORD PTR [bp-56],100	;D
	mov	WORD PTR [bp-54],0
; Line 1126
	jmp	SHORT $I1215
$I1214:
; Line 1127
	push	WORD PTR [bp-4]	;ALT
	call	_EngineBreathe
	add	sp,2
	cwd	
	mov	WORD PTR [bp-56],ax	;D
	mov	WORD PTR [bp-54],dx
$I1215:
; Line 1131
	push	WORD PTR [bp-54]
	push	WORD PTR [bp-56]	;D
	lea	ax,WORD PTR [bp-76]	;LTHRUST
	push	ax
	call	__aNNalmul
; Line 1133
	push	WORD PTR [bp-64]
	push	WORD PTR [bp-66]	;MASS
	lea	ax,WORD PTR [bp-76]	;LTHRUST
	push	ax
	call	__aNNaldiv
; Line 1136
	lea	ax,WORD PTR [bp-216]	;PM
	push	ax
	mov	cx,OFFSET DGROUP:_FPARAMS+24
	push	cx
	call	_Copy3X3
	add	sp,4
; Line 1138
	mov	ax,10
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+14
	push	WORD PTR _FPARAMS+12
	call	__aNldiv
	mov	WORD PTR [bp-82],ax	;V
; Line 1139
	mov	ax,10
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+18
	push	WORD PTR _FPARAMS+16
	call	__aNldiv
	mov	WORD PTR [bp-80],ax
; Line 1140
	mov	ax,10
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+22
	push	WORD PTR _FPARAMS+20
	call	__aNldiv
	mov	WORD PTR [bp-78],ax
; Line 1141
	lea	ax,WORD PTR [bp-216]	;PM
	push	ax
	lea	cx,WORD PTR [bp-82]	;V
	push	cx
	call	_Rotate
	add	sp,4
; Line 1142
	mov	ax,WORD PTR [bp-82]	;V
	cwd	
	mov	WORD PTR [bp-196],ax	;FPV
	mov	WORD PTR [bp-194],dx
; Line 1143
	mov	cx,ax
	mov	bx,dx
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	add	ax,cx
	adc	dx,bx
	shl	ax,1
	rcl	dx,1
	mov	WORD PTR [bp-196],ax	;FPV
	mov	WORD PTR [bp-194],dx
; Line 1144
	mov	ax,WORD PTR [bp-80]
	cwd	
	mov	WORD PTR [bp-192],ax
	mov	WORD PTR [bp-190],dx
; Line 1145
	mov	cx,ax
	mov	bx,dx
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	add	ax,cx
	adc	dx,bx
	shl	ax,1
	rcl	dx,1
	mov	WORD PTR [bp-192],ax
	mov	WORD PTR [bp-190],dx
; Line 1146
	mov	ax,WORD PTR [bp-78]
	cwd	
	mov	WORD PTR [bp-188],ax
	mov	WORD PTR [bp-186],dx
; Line 1147
	mov	cx,ax
	mov	bx,dx
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	add	ax,cx
	adc	dx,bx
	shl	ax,1
	rcl	dx,1
	mov	WORD PTR [bp-188],ax
	mov	WORD PTR [bp-186],dx
; Line 1150
	mov	ax,cx
	mov	cx,10
	cwd	
	idiv	cx
	push	ax
	call	_abs
	add	sp,2
	mov	WORD PTR [bp-184],ax	;RELWND
	push	ax
	call	_TAStoIAS
	add	sp,2
	mov	WORD PTR [bp-184],ax	;RELWND
; Line 1153
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-186]
	push	WORD PTR [bp-188]
	call	__aNldiv
	mov	WORD PTR [bp-168],ax
	mov	WORD PTR [bp-166],dx
; Line 1154
	push	dx
	push	ax
	push	dx
	push	ax
	call	__aNlmul
	mov	WORD PTR [bp-168],ax
	mov	WORD PTR [bp-166],dx
; Line 1158
	mov	WORD PTR [bp-14],-3200
; Line 1159
	sub	ax,ax
	mov	WORD PTR [bp-16],ax	;TMP
	mov	WORD PTR [bp-12],ax
; Line 1160
	lea	ax,WORD PTR [bp-216]	;PM
	push	ax
	lea	ax,WORD PTR [bp-16]	;TMP
	push	ax
	call	_Rotate
	add	sp,4
; Line 1161
	mov	ax,WORD PTR [bp-16]	;TMP
	cwd	
	mov	WORD PTR [bp-102],ax	;G
	mov	WORD PTR [bp-100],dx
; Line 1162
	mov	ax,WORD PTR [bp-14]
	cwd	
	mov	WORD PTR [bp-98],ax
	mov	WORD PTR [bp-96],dx
; Line 1163
	mov	ax,WORD PTR [bp-12]
	cwd	
	mov	WORD PTR [bp-94],ax
	mov	WORD PTR [bp-92],dx
; Line 1169
	mov	al,BYTE PTR _mS1n
	sub	ah,ah
	sub	ax,128
	mov	WORD PTR [bp-228],ax	;stx
; Line 1170
	mov	al,BYTE PTR _mS2n
	sub	ah,ah
	sub	ax,128
	mov	WORD PTR [bp-2],ax	;sty
; Line 1172
	cmp	ax,-128
	jge	$I1217
	mov	WORD PTR [bp-2],-128	;sty
; Line 1173
$I1217:
	cmp	WORD PTR [bp-2],128	;sty
	jle	$I1218
	mov	WORD PTR [bp-2],128	;sty
; Line 1176
$I1218:
	cmp	WORD PTR [bp-228],0	;stx
	jl	$L20042
	push	WORD PTR [bp-228]	;stx
	call	_abs
	add	sp,2
	mov	bx,ax
	and	bl,253
	sar	bx,1
	mov	ax,WORD PTR _STTBL[bx]
	jmp	SHORT $L20043
	nop	
$L20042:
	push	WORD PTR [bp-228]	;stx
	call	_abs
	add	sp,2
	mov	bx,ax
	and	bl,253
	sar	bx,1
	mov	ax,WORD PTR _STTBL[bx]
	neg	ax
$L20043:
	mov	WORD PTR [bp-228],ax	;stx
; Line 1177
	cmp	WORD PTR [bp-2],0	;sty
	jl	$L20044
	push	WORD PTR [bp-2]	;sty
	call	_abs
	add	sp,2
	mov	bx,ax
	and	bl,253
	sar	bx,1
	mov	ax,WORD PTR _STTBL[bx]
	jmp	SHORT $L20045
	nop	
$L20044:
	push	WORD PTR [bp-2]	;sty
	call	_abs
	add	sp,2
	mov	bx,ax
	and	bl,253
	sar	bx,1
	mov	ax,WORD PTR _STTBL[bx]
	neg	ax
$L20045:
	mov	WORD PTR [bp-2],ax	;sty
; Line 1181
	test	BYTE PTR _Damaged,4
	je	$I1219
	cmp	WORD PTR _ConfigData+4,2
	jne	$I1219
; Line 1182
; Line 1183
	mov	cx,2
	cwd	
	idiv	cx
	mov	WORD PTR [bp-2],ax	;sty
; Line 1184
	call	_rnd2
	and	ax,31
	mov	cx,ax
	mov	ax,WORD PTR [bp-228]	;stx
	cwd	
	sub	ax,dx
	sar	ax,1
	add	cx,ax
	add	cx,16
	mov	WORD PTR [bp-228],cx	;stx
; Line 1185
; Line 1190
$I1219:
	cmp	WORD PTR [bp-184],680	;RELWND
	jl	$I1221
; Line 1191
	mov	ax,WORD PTR _GTABLE+34
	jmp	SHORT $L20101
	nop	
$I1221:
; Line 1193
; Line 1196
	mov	ax,WORD PTR [bp-184]	;RELWND
	mov	cx,40
	cwd	
	idiv	cx
	mov	bx,ax
	shl	bx,1
	mov	si,-40
	mov	ax,WORD PTR [bp-184]	;RELWND
	cwd	
	idiv	si
	imul	cx
	mov	si,ax
	add	si,WORD PTR [bp-184]	;RELWND
	mov	WORD PTR [bp-154],si	;i
	mov	ax,WORD PTR _GTABLE[bx+2]
	sub	ax,WORD PTR _GTABLE[bx]
	imul	si
	cwd	
	idiv	cx
	add	ax,WORD PTR _GTABLE[bx]
$L20101:
	cwd	
	mov	WORD PTR [bp-222],ax	;MAXSTICKGS
	mov	WORD PTR [bp-220],dx
; Line 1197
; Line 1206
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-106]
	push	WORD PTR [bp-108]	;WEIGHT
	call	__aNldiv
	push	dx
	push	ax
	mov	ax,400
	cwd	
	push	dx
	push	ax
	mov	al,5
	push	ax
	lea	ax,WORD PTR [bp-222]	;MAXSTICKGS
	push	ax
	call	__aNNalshl
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-222],ax	;MAXSTICKGS
	mov	WORD PTR [bp-220],dx
	or	dx,dx
	jl	$I1223
	jg	$L20049
	cmp	ax,28800
	jbe	$I1223
$L20049:
	mov	WORD PTR [bp-222],28800	;MAXSTICKGS
	mov	WORD PTR [bp-220],0
; Line 1208
$I1223:
; Line 1210
	mov	ax,WORD PTR _Speedy
	cwd	
	push	dx
	push	ax
	mov	ax,31
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-220]
	push	WORD PTR [bp-222]	;MAXSTICKGS
	mov	ax,WORD PTR [bp-2]	;sty
	cwd	
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-112],ax	;STICKGS
	mov	WORD PTR [bp-110],dx
; Line 1217
	cmp	WORD PTR _AutoAlt,0
	je	$I1225
; Line 1218
; Line 1220
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,3200
	jg	$I1227
	cmp	WORD PTR _OurRoll,-8190
	jl	$I1227
	cmp	WORD PTR _OurRoll,8190
	jle	$I1225
$I1227:
; Line 1221
; Line 1222
	mov	WORD PTR _AutoAlt,0
; Line 1223
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1228
	push	ax
	call	_Message
	add	sp,4
; Line 1224
; Line 1225
$I1225:
; Line 1226
	cmp	WORD PTR _ConfigData+4,2
	jne	$I1229
; Line 1227
; Line 1229
	mov	ax,128
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-220]
	push	WORD PTR [bp-222]	;MAXSTICKGS
	mov	ax,WORD PTR _TRIM
	cwd	
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	add	WORD PTR [bp-112],ax	;STICKGS
	adc	WORD PTR [bp-110],dx
; Line 1230
; Line 1233
$I1229:
	cmp	WORD PTR _AutoAlt,0
	jne	$JCC7117
	jmp	$I1253
$JCC7117:
; Line 1234
; Line 1236
	cmp	WORD PTR _ConfigData+4,2
	je	$JCC7127
	jmp	$I1231
$JCC7127:
; Line 1237
; Line 1239
	mov	ax,WORD PTR [bp-4]	;ALT
	shr	ax,1
	shr	ax,1
	sub	ax,WORD PTR _AutoAlt
	neg	ax
	mov	WORD PTR [bp-154],ax	;i
	cmp	ax,-50
	jge	$I1232
	mov	WORD PTR [bp-154],-50	;i
; Line 1240
$I1232:
	cmp	WORD PTR [bp-154],400	;i
	jle	$I1233
	mov	WORD PTR [bp-154],400	;i
; Line 1241
$I1233:
	push	WORD PTR _AirSpeed
	call	_Get1GTrim
	add	sp,2
	mov	WORD PTR _TRIM,ax
; Line 1243
	mov	ax,WORD PTR [bp-154]	;i
	cwd	
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
	mov	cx,WORD PTR _FPARAMS+16
	mov	bx,WORD PTR _FPARAMS+18
	sub	cx,ax
	sbb	bx,dx
	sub	WORD PTR [bp-112],cx	;STICKGS
	sbb	WORD PTR [bp-110],bx
; Line 1246
	push	WORD PTR _OurRoll
	call	_abs
	add	sp,2
	push	ax
	mov	ax,100
	push	ax
	call	_ACosB
	add	sp,4
	mov	cx,ax
	mov	ax,10000
	cwd	
	idiv	cx
	sub	ax,100
	mov	cl,5
	shl	ax,cl
	cwd	
	add	WORD PTR [bp-112],ax	;STICKGS
	adc	WORD PTR [bp-110],dx
	cmp	WORD PTR [bp-110],-1
	jg	$I1235
	jl	$L20053
	cmp	WORD PTR [bp-112],-4800	;STICKGS
	jae	$I1235
$L20053:
	mov	WORD PTR [bp-112],-4800	;STICKGS
	mov	WORD PTR [bp-110],-1
; Line 1247
$I1235:
	cmp	WORD PTR [bp-110],0
	jge	$JCC7306
	jmp	$I1253
$JCC7306:
	jg	$L20054
	cmp	WORD PTR [bp-112],9600	;STICKGS
	ja	$JCC7318
	jmp	$I1253
$JCC7318:
$L20054:
	mov	WORD PTR [bp-112],9600	;STICKGS
	mov	WORD PTR [bp-110],0
; Line 1249
; Line 1250
	jmp	$I1253
$I1231:
; Line 1251
; Line 1252
	cmp	WORD PTR _AutoAlt,0
	je	$I1238
	mov	ax,WORD PTR _AutoAlt
	cmp	WORD PTR _OldAutoAlt,ax
	je	$I1238
; Line 1253
; Line 1254
	sub	ax,ax
	mov	WORD PTR _TFAPTR,ax
	mov	WORD PTR [bp-154],ax	;i
	jmp	SHORT $F1239
	nop	
$FC1240:
; Line 1255
	mov	bx,WORD PTR [bp-154]	;i
	shl	bx,1
	mov	WORD PTR _TFAS[bx],0
	inc	WORD PTR [bp-154]	;i
$F1239:
	cmp	WORD PTR [bp-154],4	;i
	jl	$FC1240
; Line 1256
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+6
	push	WORD PTR _FPARAMS+4
	call	__aNldiv
	mov	WORD PTR _AutoAlt,ax
; Line 1257
; Line 1258
$I1238:
; Line 1260
	mov	ax,WORD PTR _AutoAlt
	mov	WORD PTR _OldAutoAlt,ax
	mov	WORD PTR [bp-84],ax	;UTMP1
; Line 1263
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+10
	push	WORD PTR _FPARAMS+8
	call	__aNldiv
	mov	cx,100
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR _FPARAMS+22
	push	WORD PTR _FPARAMS+20
	mov	si,ax
	mov	di,dx
	call	__aNldiv
	add	si,ax
	adc	di,dx
	push	di
	push	si
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+2
	push	WORD PTR _FPARAMS
	call	__aNldiv
	mov	cx,100
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR _FPARAMS+14
	push	WORD PTR _FPARAMS+12
	mov	si,ax
	mov	di,dx
	call	__aNldiv
	add	si,ax
	adc	di,dx
	push	di
	push	si
	call	_GetQHeight
	add	sp,8
	add	ax,125
	shl	ax,1
	shl	ax,1
	mov	WORD PTR [bp-68],ax	;UTMP
; Line 1264
	mov	bx,WORD PTR _TFAPTR
	shl	bx,1
	cmp	WORD PTR _TFAS[bx],ax
	jae	$I1242
	mov	WORD PTR _TFAS[bx],ax
; Line 1265
$I1242:
; Line 1266
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+10
	push	WORD PTR _FPARAMS+8
	call	__aNldiv
	mov	cx,25
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR _FPARAMS+22
	push	WORD PTR _FPARAMS+20
	mov	si,ax
	mov	di,dx
	call	__aNldiv
	add	si,ax
	adc	di,dx
	push	di
	push	si
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+2
	push	WORD PTR _FPARAMS
	call	__aNldiv
	mov	cx,25
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR _FPARAMS+14
	push	WORD PTR _FPARAMS+12
	mov	si,ax
	mov	di,dx
	call	__aNldiv
	add	si,ax
	adc	di,dx
	push	di
	push	si
	call	_GetQHeight
	add	sp,8
	add	ax,125
	shl	ax,1
	shl	ax,1
	mov	WORD PTR [bp-68],ax	;UTMP
; Line 1267
	mov	bx,WORD PTR _TFAPTR
	shl	bx,1
	cmp	WORD PTR _TFAS[bx],ax
	jae	$I1243
	mov	WORD PTR _TFAS[bx],ax
; Line 1269
$I1243:
; Line 1270
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+10
	push	WORD PTR _FPARAMS+8
	call	__aNldiv
	mov	cx,400
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR _FPARAMS+22
	push	WORD PTR _FPARAMS+20
	mov	si,ax
	mov	di,dx
	call	__aNldiv
	add	si,ax
	adc	di,dx
	push	di
	push	si
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+2
	push	WORD PTR _FPARAMS
	call	__aNldiv
	mov	cx,400
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR _FPARAMS+14
	push	WORD PTR _FPARAMS+12
	mov	si,ax
	mov	di,dx
	call	__aNldiv
	add	si,ax
	adc	di,dx
	push	di
	push	si
	call	_GetQHeight
	add	sp,8
	add	ax,125
	shl	ax,1
	shl	ax,1
	mov	WORD PTR [bp-68],ax	;UTMP
; Line 1271
	mov	bx,WORD PTR _TFAPTR
	shl	bx,1
	cmp	WORD PTR _TFAS[bx],ax
	jae	$I1244
	mov	WORD PTR _TFAS[bx],ax
; Line 1274
$I1244:
	mov	ax,WORD PTR [bp-90]	;SFticks
	add	WORD PTR _TFAPTRCNT,ax
	cmp	WORD PTR _TFAPTRCNT,60
	jle	$I1245
; Line 1275
; Line 1276
	mov	ax,WORD PTR _TFAPTRCNT
	sub	ax,60
	mov	WORD PTR _TFAPTRCNT,ax
; Line 1277
	inc	WORD PTR _TFAPTR
; Line 1279
	and	WORD PTR _TFAPTR,3
	mov	bx,WORD PTR _TFAPTR
	shl	bx,1
	mov	WORD PTR _TFAS[bx],0
; Line 1280
; Line 1281
$I1245:
	mov	WORD PTR [bp-154],0	;i
$FC1247:
; Line 1282
	mov	bx,WORD PTR [bp-154]	;i
	shl	bx,1
	mov	ax,WORD PTR [bp-84]	;UTMP1
	cmp	WORD PTR _TFAS[bx],ax
	jbe	$I1249
	mov	ax,WORD PTR _TFAS[bx]
	mov	WORD PTR [bp-84],ax	;UTMP1
; Line 1284
$I1249:
	inc	WORD PTR [bp-154]	;i
	cmp	WORD PTR [bp-154],4	;i
	jl	$FC1247
	mov	ax,WORD PTR _AutoAlt
	cmp	WORD PTR [bp-84],ax	;UTMP1
	jae	$I1250
	mov	WORD PTR [bp-84],ax	;UTMP1
; Line 1286
$I1250:
; Line 1287
	mov	ax,WORD PTR [bp-84]	;UTMP1
	sub	ax,WORD PTR [bp-4]	;ALT
	mov	WORD PTR [bp-154],ax	;i
	cmp	ax,-50
	jge	$I1251
	mov	WORD PTR [bp-154],-50	;i
; Line 1288
$I1251:
	cmp	WORD PTR [bp-154],400	;i
	jle	$I1252
	mov	WORD PTR [bp-154],400	;i
; Line 1289
$I1252:
; Line 1290
	mov	ax,WORD PTR [bp-154]	;i
	cwd	
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
	mov	cx,WORD PTR _FPARAMS+16
	mov	bx,WORD PTR _FPARAMS+18
	sub	cx,ax
	sbb	bx,dx
	sub	WORD PTR [bp-112],cx	;STICKGS
	sbb	WORD PTR [bp-110],bx
; Line 1292
	push	WORD PTR _OurRoll
	call	_abs
	add	sp,2
	push	ax
	mov	ax,100
	push	ax
	call	_ACosB
	add	sp,4
	mov	cx,ax
	mov	ax,10000
	cwd	
	idiv	cx
	sub	ax,100
	mov	cl,5
	shl	ax,cl
	cwd	
	add	WORD PTR [bp-112],ax	;STICKGS
	adc	WORD PTR [bp-110],dx
	cmp	WORD PTR [bp-110],-1
	jg	$I1253
	jl	$L20058
	cmp	WORD PTR [bp-112],-4800	;STICKGS
	jae	$I1253
$L20058:
	mov	WORD PTR [bp-112],-4800	;STICKGS
	mov	WORD PTR [bp-110],-1
; Line 1294
$I1253:
; Line 1295
; Line 1298
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+6
	push	WORD PTR _FPARAMS+4
	call	__aNldiv
	mov	cx,ax
	mov	ax,WORD PTR _MinAlt
	mov	bx,dx
	cwd	
	cmp	bx,dx
	jg	$I1255
	jl	$L20061
	cmp	cx,ax
	ja	$I1255
$L20061:
	cmp	WORD PTR [bp-184],280	;RELWND
	jle	$I1254
$I1255:
	cmp	WORD PTR _ConfigData+4,2
	jge	$I1254
; Line 1299
	add	WORD PTR [bp-112],3200	;STICKGS
	adc	WORD PTR [bp-110],0
; Line 1302
$I1254:
	mov	ax,WORD PTR [bp-112]	;STICKGS
	mov	dx,WORD PTR [bp-110]
	cmp	WORD PTR [bp-220],dx
	jg	$I1256
	jl	$L20062
	cmp	WORD PTR [bp-222],ax	;MAXSTICKGS
	jae	$I1256
$L20062:
; Line 1303
	mov	ax,WORD PTR [bp-222]	;MAXSTICKGS
	mov	dx,WORD PTR [bp-220]
	mov	WORD PTR [bp-112],ax	;STICKGS
	mov	WORD PTR [bp-110],dx
; Line 1304
$I1256:
	cmp	dx,-1
	jg	$I1257
	jl	$L20063
	cmp	ax,-9600
	jae	$I1257
$L20063:
	mov	WORD PTR [bp-112],-9600	;STICKGS
	mov	WORD PTR [bp-110],-1
; Line 1306
$I1257:
	test	BYTE PTR _Damaged,1
	je	$I1258
	test	BYTE PTR _Damaged,2
	je	$I1258
; Line 1307
	sub	ax,ax
	mov	WORD PTR [bp-110],ax
	mov	WORD PTR [bp-112],ax	;STICKGS
; Line 1318
$I1258:
	cmp	WORD PTR [bp-184],400	;RELWND
	jge	$I1259
	mov	WORD PTR [bp-72],45	;CLCD
	mov	WORD PTR [bp-70],0
; Line 1324
$I1259:
	push	WORD PTR [bp-70]
	push	WORD PTR [bp-72]	;CLCD
	push	WORD PTR [bp-110]
	push	WORD PTR [bp-112]	;STICKGS
	call	_labs
	add	sp,4
	mov	cx,ax
	mov	bx,dx
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	add	ax,cx
	adc	dx,bx
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-10],ax	;DRAGS
	mov	WORD PTR [bp-8],dx
; Line 1325
	mov	ax,WORD PTR [bp-98]
	mov	dx,WORD PTR [bp-96]
	add	ax,WORD PTR [bp-112]	;STICKGS
	adc	dx,WORD PTR [bp-110]
	mov	WORD PTR [bp-158],ax	;LIFTGS
	mov	WORD PTR [bp-156],dx
; Line 1326
	mov	ax,WORD PTR [bp-48]	;CP
	mov	dx,WORD PTR [bp-46]
	mov	WORD PTR [bp-56],ax	;D
	mov	WORD PTR [bp-54],dx
; Line 1327
	test	BYTE PTR _Status,1
	jne	$I1260
; Line 1328
	add	ax,200
	adc	dx,0
	mov	WORD PTR [bp-56],ax	;D
	mov	WORD PTR [bp-54],dx
; Line 1333
$I1260:
	mov	ax,WORD PTR [bp-4]	;ALT
	mov	cx,125
	sub	dx,dx
	div	cx
	mov	WORD PTR [bp-68],ax	;UTMP
; Line 1334
	cmp	WORD PTR [bp-4],25000	;ALT
	jbe	$I1261
; Line 1335
	mov	ax,WORD PTR [bp-4]	;ALT
	sub	ax,25000
	mov	cx,25
	sub	dx,dx
	div	cx
	add	ax,WORD PTR [bp-68]	;UTMP
	mov	WORD PTR [bp-68],ax	;UTMP
; Line 1338
$I1261:
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-64]
	push	WORD PTR [bp-66]	;MASS
	push	WORD PTR [bp-54]
	push	WORD PTR [bp-56]	;D
	push	WORD PTR [bp-36]
	push	WORD PTR [bp-38]	;DNSTY
	mov	cx,10
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR [bp-166]
	push	WORD PTR [bp-168]
	call	__aNldiv
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	push	dx
	push	ax
	call	__aNldiv
	sub	ax,WORD PTR [bp-76]	;LTHRUST
	sbb	dx,WORD PTR [bp-74]
	add	ax,WORD PTR [bp-94]
	adc	dx,WORD PTR [bp-92]
	add	WORD PTR [bp-10],ax	;DRAGS
	adc	WORD PTR [bp-8],dx
; Line 1341
	sub	ax,ax
	mov	WORD PTR [bp-224],ax	;DELROLL
	mov	WORD PTR [bp-104],ax	;DELHEAD
	mov	WORD PTR [bp-198],ax	;DELPITCH
; Line 1343
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+6
	push	WORD PTR _FPARAMS+4
	call	__aNldiv
	mov	cx,ax
	mov	ax,WORD PTR _MinAlt
	mov	bx,dx
	cwd	
	cmp	bx,dx
	jge	$JCC8440
	jmp	$I1262
$JCC8440:
	jg	$L20066
	cmp	cx,ax
	ja	$JCC8449
	jmp	$I1262
$JCC8449:
$L20066:
; Line 1344
; Line 1345
	test	BYTE PTR _Status,8
	je	$I1263
	test	BYTE PTR _Damaged,4
	jne	$I1263
; Line 1346
; Line 1347
	mov	ax,-40
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-186]
	push	WORD PTR [bp-188]
	call	__aNldiv
	add	WORD PTR [bp-10],ax	;DRAGS
	adc	WORD PTR [bp-8],dx
; Line 1348
; Line 1362
$I1263:
	lea	ax,WORD PTR [bp-34]	;TM
	push	ax
	lea	ax,WORD PTR [bp-216]	;PM
	push	ax
	call	_Trans3X3
	add	sp,4
; Line 1365
	mov	ax,WORD PTR [bp-184]	;RELWND
	cwd	
	mov	WORD PTR [bp-56],ax	;D
	mov	WORD PTR [bp-54],dx
; Line 1366
	cmp	ax,200
	jge	$I1264
; Line 1367
; Line 1368
	mov	cx,200
	sub	bx,bx
	push	bx
	push	cx
	mov	ax,WORD PTR _RUDDERVALS
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	shl	ax,1
	shl	ax,1
	sub	ax,cx
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-54]
	push	WORD PTR [bp-56]	;D
	jmp	SHORT $L20103
	nop	
$I1264:
; Line 1371
; Line 1372
	cmp	ax,800
	jle	$I1266
; Line 1373
	mov	WORD PTR [bp-56],800	;D
	mov	WORD PTR [bp-54],0
; Line 1374
$I1266:
	mov	ax,800
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _RUDDERVALS
	mov	cx,ax
	shl	ax,1
	shl	ax,1
	shl	ax,1
	shl	ax,1
	sub	ax,cx
	cwd	
	push	dx
	push	ax
	mov	ax,1000
	cwd	
	sub	ax,WORD PTR [bp-56]	;D
	sbb	dx,WORD PTR [bp-54]
	push	dx
	push	ax
$L20103:
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-56],ax	;D
	mov	WORD PTR [bp-54],dx
; Line 1375
; Line 1377
	mov	ax,200
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-184]	;RELWND
	cwd	
	push	dx
	push	ax
	mov	ax,60
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	mov	ax,WORD PTR _OLDSLEW
	cwd	
	mov	cx,WORD PTR [bp-56]	;D
	mov	bx,WORD PTR [bp-54]
	sub	cx,ax
	sbb	bx,dx
	push	bx
	push	cx
	mov	si,ax
	mov	di,dx
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	add	si,ax
	adc	di,dx
	mov	WORD PTR [bp-56],si	;D
	mov	WORD PTR [bp-54],di
	mov	WORD PTR _SLEW,si
; Line 1378
	mov	WORD PTR _OLDSLEW,si
; Line 1381
	mov	ax,si
	shl	si,1
	add	si,ax
	push	si
	push	WORD PTR [bp-76]	;LTHRUST
	call	_ASinB
	add	sp,4
	cwd	
	add	WORD PTR [bp-102],ax	;G
	adc	WORD PTR [bp-100],dx
; Line 1386
	mov	ax,10
	cwd	
	push	dx
	push	ax
	mov	cx,60
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR [bp-194]
	push	WORD PTR [bp-196]	;FPV
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	mov	cx,7200
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	mov	si,ax
	mov	ax,WORD PTR _SLEW
	mov	di,ax
	shl	ax,1
	add	ax,di
	mov	di,dx
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,2
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	cwd	
	add	WORD PTR [bp-102],ax	;G
	adc	WORD PTR [bp-100],dx
	push	WORD PTR [bp-100]
	push	WORD PTR [bp-102]	;G
	call	__aNlmul
	push	dx
	push	ax
	mov	WORD PTR [bp-252],ax
	mov	WORD PTR [bp-250],dx
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	add	si,ax
	adc	di,dx
	push	di
	push	si
	call	__aNldiv
	mov	WORD PTR [bp-164],ax	;XR
; Line 1388
	mov	ax,10
	cwd	
	push	dx
	push	ax
	mov	cx,60
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR [bp-190]
	push	WORD PTR [bp-192]
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	mov	cx,7200
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	push	WORD PTR [bp-156]
	push	WORD PTR [bp-158]	;LIFTGS
	mov	si,ax
	mov	di,dx
	call	__aNlmul
	push	dx
	push	ax
	mov	WORD PTR [bp-256],ax
	mov	WORD PTR [bp-254],dx
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	add	si,ax
	adc	di,dx
	push	di
	push	si
	call	__aNldiv
	mov	WORD PTR [bp-162],ax
; Line 1390
	mov	ax,10
	cwd	
	push	dx
	push	ax
	mov	cx,60
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR [bp-186]
	push	WORD PTR [bp-188]
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	mov	cx,7200
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	push	WORD PTR [bp-8]
	push	WORD PTR [bp-10]	;DRAGS
	mov	si,ax
	mov	di,dx
	call	__aNlmul
	push	dx
	push	ax
	mov	WORD PTR [bp-260],ax
	mov	WORD PTR [bp-258],dx
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	add	si,ax
	adc	di,dx
	push	di
	push	si
	call	__aNldiv
	mov	WORD PTR [bp-160],ax
; Line 1391
	lea	ax,WORD PTR [bp-34]	;TM
	push	ax
	lea	cx,WORD PTR [bp-164]	;XR
	push	cx
	call	_Rotate
	add	sp,4
; Line 1394
	mov	ax,60
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-254]
	push	WORD PTR [bp-256]
	call	__aNldiv
	mov	WORD PTR [bp-52],ax	;DVY
	mov	WORD PTR [bp-50],dx
; Line 1395
	mov	cx,60
	sub	bx,bx
	push	bx
	push	cx
	push	WORD PTR [bp-258]
	push	WORD PTR [bp-260]
	call	__aNldiv
	mov	WORD PTR [bp-62],ax	;DVZ
	mov	WORD PTR [bp-60],dx
; Line 1397
	mov	cx,10
	sub	bx,bx
	push	bx
	push	cx
	mov	si,60
	sub	di,di
	push	di
	push	si
	push	WORD PTR [bp-250]
	push	WORD PTR [bp-252]
	call	__aNldiv
	mov	WORD PTR [bp-42],ax	;DVX
	mov	WORD PTR [bp-40],dx
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-82],ax	;V
; Line 1398
	mov	ax,10
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-50]
	push	WORD PTR [bp-52]	;DVY
	call	__aNldiv
	mov	WORD PTR [bp-80],ax
; Line 1399
	mov	ax,10
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-60]
	push	WORD PTR [bp-62]	;DVZ
	call	__aNldiv
	mov	WORD PTR [bp-78],ax
; Line 1400
	lea	ax,WORD PTR [bp-34]	;TM
	push	ax
	lea	ax,WORD PTR [bp-82]	;V
	push	ax
	call	_Rotate
	add	sp,4
; Line 1402
	mov	ax,4
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-164]	;XR
	cwd	
	mov	cx,ax
	mov	bx,dx
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	add	ax,cx
	adc	dx,bx
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	__aNldiv
	add	WORD PTR _FPARAMS,ax
	adc	WORD PTR _FPARAMS+2,dx
; Line 1406
	mov	ax,4
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-160]
	cwd	
	mov	cx,ax
	mov	bx,dx
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	add	ax,cx
	adc	dx,bx
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	__aNldiv
	add	WORD PTR _FPARAMS+8,ax
	adc	WORD PTR _FPARAMS+10,dx
; Line 1408
	mov	ax,WORD PTR [bp-82]	;V
	cwd	
	mov	cx,ax
	mov	bx,dx
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	add	ax,cx
	adc	dx,bx
	shl	ax,1
	rcl	dx,1
	add	WORD PTR _FPARAMS+12,ax
	adc	WORD PTR _FPARAMS+14,dx
; Line 1410
	mov	ax,WORD PTR [bp-80]
	cwd	
	mov	cx,ax
	mov	bx,dx
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	add	ax,cx
	adc	dx,bx
	shl	ax,1
	rcl	dx,1
	add	WORD PTR _FPARAMS+16,ax
	adc	WORD PTR _FPARAMS+18,dx
; Line 1411
	mov	ax,WORD PTR [bp-78]
	cwd	
	mov	WORD PTR [bp-56],ax	;D
	mov	WORD PTR [bp-54],dx
; Line 1412
	mov	cx,ax
	mov	bx,dx
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	add	ax,cx
	adc	dx,bx
	shl	ax,1
	rcl	dx,1
	add	WORD PTR _FPARAMS+20,ax
	adc	WORD PTR _FPARAMS+22,dx
; Line 1413
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-162]
	cwd	
	mov	cx,ax
	mov	bx,dx
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	add	ax,cx
	adc	dx,bx
	shl	ax,1
	rcl	dx,1
	add	WORD PTR _FPARAMS+4,ax
	adc	WORD PTR _FPARAMS+6,dx
	push	WORD PTR _FPARAMS+6
	push	WORD PTR _FPARAMS+4
	call	__aNldiv
	or	dx,dx
	jl	$I1268
	jg	$L20067
	cmp	ax,-5536
	jbe	$I1268
$L20067:
	mov	WORD PTR _FPARAMS+4,-29312
	mov	WORD PTR _FPARAMS+6,91
; Line 1418
$I1268:
	mov	ax,WORD PTR [bp-62]	;DVZ
	mov	dx,WORD PTR [bp-60]
	add	ax,WORD PTR [bp-188]
	adc	dx,WORD PTR [bp-186]
	push	dx
	push	ax
	mov	si,ax
	mov	di,dx
	call	_labs
	add	sp,4
	or	dx,dx
	jge	$JCC9493
	jmp	$I1269
$JCC9493:
	jg	$L20069
	cmp	ax,400
	jbe	$I1269
$L20069:
; Line 1420
	mov	ax,-10
	cwd	
	push	dx
	push	ax
	push	di
	push	si
	call	__aNldiv
	push	ax
	mov	cx,-10
	mov	dx,-1
	push	dx
	push	cx
	mov	cx,WORD PTR [bp-42]	;DVX
	mov	dx,WORD PTR [bp-40]
	add	cx,WORD PTR [bp-196]	;FPV
	adc	dx,WORD PTR [bp-194]
	push	dx
	push	cx
	mov	si,ax
	call	__aNldiv
	push	ax
	call	_ARCTAN
	add	sp,4
	cwd	
	mov	WORD PTR [bp-56],ax	;D
	mov	WORD PTR [bp-54],dx
	mov	WORD PTR [bp-104],ax	;DELHEAD
; Line 1422
	mov	ax,4
	cwd	
	push	dx
	push	ax
	push	si
	mov	ax,10
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-52]	;DVY
	mov	dx,WORD PTR [bp-50]
	add	ax,WORD PTR [bp-192]
	adc	dx,WORD PTR [bp-190]
	push	dx
	push	ax
	call	__aNldiv
	push	ax
	call	_ARCTAN
	add	sp,4
	cwd	
	mov	WORD PTR [bp-56],ax	;D
	mov	WORD PTR [bp-54],dx
	mov	cx,ax
	mov	bx,dx
	shl	ax,1
	rcl	dx,1
	add	ax,cx
	adc	dx,bx
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-198],ax	;DELPITCH
; Line 1423
; Line 1427
$I1269:
	mov	ax,WORD PTR [bp-228]	;stx
	neg	ax
	cwd	
	mov	WORD PTR [bp-56],ax	;D
	mov	WORD PTR [bp-54],dx
; Line 1430
	cmp	WORD PTR _FASTROLL,0
	je	$I1270
; Line 1431
	shl	ax,1
	rcl	dx,1
	mov	WORD PTR [bp-56],ax	;D
	mov	WORD PTR [bp-54],dx
; Line 1433
$I1270:
	test	BYTE PTR _Damaged,1
	je	$I1271
	test	BYTE PTR _Damaged,2
	je	$I1271
; Line 1434
	mov	WORD PTR [bp-56],-16	;D
	mov	WORD PTR [bp-54],-1
; Line 1436
$I1271:
	cmp	WORD PTR [bp-184],700	;RELWND
	jle	$I1272
; Line 1437
	mov	ax,60
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-54]
	push	WORD PTR [bp-56]	;D
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	call	__aNlmul
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	jmp	SHORT $L20104
	nop	
$I1272:
; Line 1439
	mov	ax,600
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	mov	ax,WORD PTR [bp-184]	;RELWND
	cwd	
	push	dx
	push	ax
	mov	ax,70
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-56]	;D
	mov	dx,WORD PTR [bp-54]
	mov	dh,dl
	mov	dl,ah
	mov	ah,al
	sub	al,al
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	push	dx
	push	ax
	call	__aNldiv
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNlmul
$L20104:
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-56],ax	;D
	mov	WORD PTR [bp-54],dx
; Line 1443
	mov	ax,WORD PTR _SLEW
	mov	cx,5
	cwd	
	idiv	cx
	cwd	
	sub	WORD PTR [bp-56],ax	;D
	sbb	WORD PTR [bp-54],dx
; Line 1450
	mov	ax,200
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-108]	;WEIGHT
	mov	dx,WORD PTR [bp-106]
	sub	ax,-25536
	sbb	dx,0
	push	dx
	push	ax
	call	__aNldiv
	add	ax,100
	adc	dx,0
	push	dx
	push	ax
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _Speedy
	cwd	
	push	dx
	push	ax
	lea	ax,WORD PTR [bp-56]	;D
	push	ax
	call	__aNNaldiv
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-56],ax	;D
	mov	WORD PTR [bp-54],dx
; Line 1453
	cmp	WORD PTR _AutoAlt,0
	je	$I1274
; Line 1454
	mov	ax,120
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	mov	ax,WORD PTR _OurRoll
	cwd	
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	add	WORD PTR [bp-56],ax	;D
	adc	WORD PTR [bp-54],dx
; Line 1456
$I1274:
	cmp	WORD PTR _ConfigData+4,0
	jne	$I1275
; Line 1457
; Line 1458
	mov	ax,WORD PTR [bp-56]	;D
	mov	dx,WORD PTR [bp-54]
	mov	WORD PTR _ROLLINERTIA,ax
	mov	WORD PTR _ROLLINERTIA+2,dx
; Line 1459
; Line 1460
	jmp	SHORT $I1276
$I1275:
; Line 1461
; Line 1462
	mov	ax,30
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR _Fticks
	cwd	
	push	dx
	push	ax
	mov	ax,WORD PTR [bp-56]	;D
	mov	dx,WORD PTR [bp-54]
	sub	ax,WORD PTR _ROLLINERTIA
	sbb	dx,WORD PTR _ROLLINERTIA+2
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	add	WORD PTR _ROLLINERTIA,ax
	adc	WORD PTR _ROLLINERTIA+2,dx
; Line 1463
$I1276:
; Line 1468
	lea	ax,WORD PTR [bp-34]	;TM
	push	ax
	mov	cx,WORD PTR _ROLLINERTIA
	mov	WORD PTR [bp-224],cx	;DELROLL
	neg	cx
	push	cx
	mov	cx,WORD PTR [bp-198]	;DELPITCH
	neg	cx
	push	cx
	mov	cx,WORD PTR [bp-104]	;DELHEAD
	neg	cx
	push	cx
	call	_MakeMatHPR
	add	sp,8
; Line 1469
	lea	ax,WORD PTR [bp-246]	;RM
	push	ax
	lea	cx,WORD PTR [bp-34]	;TM
	push	cx
	lea	cx,WORD PTR [bp-216]	;PM
	push	cx
	call	_Mult3X3
	add	sp,6
; Line 1470
	mov	ax,OFFSET DGROUP:_OurRoll
	push	ax
	mov	cx,OFFSET DGROUP:_OurPitch
	push	cx
	mov	dx,OFFSET DGROUP:_OurHead
	push	dx
	lea	bx,WORD PTR [bp-246]	;RM
	push	bx
	call	_GetHPR
	add	sp,8
; Line 1472
	mov	ax,OFFSET DGROUP:_FPARAMS+24
	push	ax
	push	WORD PTR _OurRoll
	mov	ax,WORD PTR _OurPitch
	neg	ax
	mov	WORD PTR _OurPitch,ax
	neg	ax
	push	ax
	push	WORD PTR _OurHead
	call	_MakeMatHPR
	add	sp,8
; Line 1473
; Line 1474
	jmp	$I1279
	nop	
$I1262:
; Line 1475
; Line 1476
	mov	WORD PTR _SLEW,0
; Line 1478
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+6
	push	WORD PTR _FPARAMS+4
	call	__aNldiv
	mov	cx,ax
	mov	ax,WORD PTR _MinAlt
	mov	bx,dx
	cwd	
	cmp	bx,dx
	jg	$I1280
	jl	$L20072
	cmp	cx,ax
	jae	$I1280
$L20072:
; Line 1479
	mov	ax,100
	imul	WORD PTR _MinAlt
	cwd	
	mov	WORD PTR _FPARAMS+4,ax
	mov	WORD PTR _FPARAMS+6,dx
; Line 1480
$I1280:
	cmp	WORD PTR _FPARAMS+18,0
	jge	$I1281
	sub	ax,ax
	mov	WORD PTR _FPARAMS+18,ax
	mov	WORD PTR _FPARAMS+16,ax
; Line 1481
$I1281:
; Line 1482
	sub	ax,ax
	mov	WORD PTR _OurPitch,ax
	mov	WORD PTR _OurRoll,ax
	mov	WORD PTR [bp-198],ax	;DELPITCH
	mov	WORD PTR [bp-104],ax	;DELHEAD
; Line 1483
	cmp	WORD PTR [bp-110],ax
	jge	$I1282
	mov	WORD PTR [bp-110],ax
	mov	WORD PTR [bp-112],ax	;STICKGS
; Line 1484
$I1282:
	cmp	WORD PTR [bp-156],ax
	jl	$I1283
	jg	$L20073
	cmp	WORD PTR [bp-158],ax	;LIFTGS
	je	$I1283
$L20073:
; Line 1485
; Line 1486
	mov	ax,60
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	push	WORD PTR [bp-156]
	push	WORD PTR [bp-158]	;LIFTGS
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR _FPARAMS+16,ax
	mov	WORD PTR _FPARAMS+18,dx
; Line 1490
; Line 1491
	jmp	SHORT $I1284
$I1283:
; Line 1492
; Line 1494
	mov	ax,8
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-156]
	push	WORD PTR [bp-158]	;LIFTGS
	call	__aNldiv
	sub	WORD PTR [bp-10],ax	;DRAGS
	sbb	WORD PTR [bp-8],dx
; Line 1495
$I1284:
; Line 1497
	test	BYTE PTR _Status,8
	je	$I1285
	test	BYTE PTR _Damaged,4
	jne	$I1285
; Line 1498
; Line 1502
	mov	ax,10
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-186]
	push	WORD PTR [bp-188]
	call	__aNldiv
	push	dx
	push	ax
	push	WORD PTR [bp-106]
	push	WORD PTR [bp-108]	;WEIGHT
	mov	ax,25536
	mov	dx,-1
	push	dx
	push	ax
	call	__aNldiv
	push	dx
	push	ax
	call	__aNlmul
	add	ax,1000
	adc	dx,0
	add	WORD PTR [bp-10],ax	;DRAGS
	adc	WORD PTR [bp-8],dx
; Line 1504
; Line 1506
$I1285:
	cmp	WORD PTR [bp-184],1	;RELWND
	jle	$I1290
; Line 1507
; Line 1508
	cmp	WORD PTR _RudderStick,0
	jne	$I1288
	cmp	WORD PTR _RUDDERVALS,0
	je	$I1287
$I1288:
; Line 1509
; Line 1510
	mov	ax,60
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	mov	ax,28
	imul	WORD PTR _RUDDERVALS
	jmp	SHORT $L20106
$I1287:
; Line 1513
; Line 1514
	cmp	WORD PTR [bp-184],80	;RELWND
	jge	$I1290
; Line 1515
	mov	ax,60
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	mov	ax,140
	imul	WORD PTR [bp-228]	;stx
$L20106:
	cwd	
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-104],ax	;DELHEAD
; Line 1516
$I1290:
; Line 1517
; Line 1519
	mov	ax,WORD PTR [bp-104]	;DELHEAD
	cwd	
	idiv	WORD PTR _Speedy
	mov	WORD PTR [bp-104],ax	;DELHEAD
; Line 1521
	mov	ax,60
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	push	WORD PTR [bp-8]
	push	WORD PTR [bp-10]	;DRAGS
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-62],ax	;DVZ
	mov	WORD PTR [bp-60],dx
; Line 1527
	add	WORD PTR [bp-188],ax
	adc	WORD PTR [bp-186],dx
	cmp	WORD PTR [bp-186],0
	jl	$I1291
	jg	$L20074
	cmp	WORD PTR [bp-188],0
	je	$I1291
$L20074:
	sub	ax,ax
	mov	WORD PTR [bp-186],ax
	mov	WORD PTR [bp-188],ax
; Line 1528
$I1291:
	cmp	WORD PTR [bp-186],-1
	jl	$I1292
	jg	$L20075
	cmp	WORD PTR [bp-188],-300
	jbe	$I1292
$L20075:
	or	dx,dx
	jl	$I1292
	jg	$L20076
	cmp	WORD PTR [bp-62],0	;DVZ
	je	$I1292
$L20076:
	sub	ax,ax
	mov	WORD PTR [bp-186],ax
	mov	WORD PTR [bp-188],ax
; Line 1530
$I1292:
; Line 1531
	mov	ax,OFFSET DGROUP:_FPARAMS+24
	push	ax
	sub	cx,cx
	push	cx
	push	cx
	mov	dx,WORD PTR [bp-104]	;DELHEAD
	add	WORD PTR _OurHead,dx
	push	WORD PTR _OurHead
	call	_MakeMatHPR
	add	sp,8
; Line 1532
	lea	ax,WORD PTR [bp-34]	;TM
	push	ax
	mov	cx,OFFSET DGROUP:_FPARAMS+24
	push	cx
	call	_Trans3X3
	add	sp,4
; Line 1534
	sub	ax,ax
	mov	WORD PTR [bp-82],ax	;V
	mov	WORD PTR [bp-80],ax
; Line 1535
	mov	ax,10
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-186]
	push	WORD PTR [bp-188]
	call	__aNldiv
	mov	WORD PTR [bp-78],ax
; Line 1536
	lea	ax,WORD PTR [bp-34]	;TM
	push	ax
	lea	ax,WORD PTR [bp-82]	;V
	push	ax
	call	_Rotate
	add	sp,4
; Line 1539
	mov	ax,60
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+14
	push	WORD PTR _FPARAMS+12
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	add	WORD PTR _FPARAMS,ax
	adc	WORD PTR _FPARAMS+2,dx
; Line 1540
	mov	ax,60
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+22
	push	WORD PTR _FPARAMS+20
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	add	WORD PTR _FPARAMS+8,ax
	adc	WORD PTR _FPARAMS+10,dx
; Line 1541
	mov	ax,60
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+18
	push	WORD PTR _FPARAMS+16
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	add	WORD PTR _FPARAMS+4,ax
	adc	WORD PTR _FPARAMS+6,dx
; Line 1542
	mov	ax,WORD PTR [bp-82]	;V
	cwd	
	mov	WORD PTR _FPARAMS+12,ax
	mov	WORD PTR _FPARAMS+14,dx
; Line 1543
	mov	cx,ax
	mov	ax,WORD PTR [bp-78]
	mov	bx,dx
	cwd	
	mov	WORD PTR _FPARAMS+20,ax
	mov	WORD PTR _FPARAMS+22,dx
; Line 1544
	mov	si,cx
	mov	di,bx
	shl	cx,1
	rcl	bx,1
	shl	cx,1
	rcl	bx,1
	add	cx,si
	adc	bx,di
	shl	cx,1
	rcl	bx,1
	mov	WORD PTR _FPARAMS+12,cx
	mov	WORD PTR _FPARAMS+14,bx
; Line 1545
	mov	cx,ax
	mov	bx,dx
	shl	ax,1
	rcl	dx,1
	shl	ax,1
	rcl	dx,1
	add	ax,cx
	adc	dx,bx
	shl	ax,1
	rcl	dx,1
	mov	WORD PTR _FPARAMS+20,ax
	mov	WORD PTR _FPARAMS+22,dx
; Line 1546
$I1279:
; Line 1548
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+6
	push	WORD PTR _FPARAMS+4
	call	__aNldiv
	mov	cx,ax
	mov	ax,WORD PTR _MinAlt
	mov	bx,dx
	cwd	
	cmp	bx,dx
	jg	$I1293
	jl	$L20079
	cmp	cx,ax
	jae	$I1293
$L20079:
; Line 1549
	mov	ax,100
	imul	WORD PTR _MinAlt
	cwd	
	mov	WORD PTR _FPARAMS+4,ax
	mov	WORD PTR _FPARAMS+6,dx
; Line 1556
$I1293:
; Line 1564
	mov	ax,-25536
	sub	dx,dx
	push	dx
	push	ax
	push	WORD PTR [bp-106]
	push	WORD PTR [bp-108]	;WEIGHT
	mov	ax,2
	cwd	
	push	dx
	push	ax
	mov	ax,180
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-166]
	push	WORD PTR [bp-168]
	call	__aNldiv
	add	ax,1
	adc	dx,0
	push	dx
	push	ax
	mov	ax,130
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-110]
	push	WORD PTR [bp-112]	;STICKGS
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	push	dx
	push	ax
	call	__aNldiv
	push	dx
	push	ax
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	mov	WORD PTR [bp-180],ax	;NEWAOA
	mov	WORD PTR [bp-178],dx
	or	dx,dx
	jge	$I1294
	sub	ax,ax
	mov	WORD PTR [bp-178],ax
	mov	WORD PTR [bp-180],ax	;NEWAOA
; Line 1565
$I1294:
	cmp	WORD PTR [bp-178],0
	jl	$I1295
	jg	$L20080
	cmp	ax,2184
	jbe	$I1295
$L20080:
	mov	WORD PTR [bp-180],2184	;NEWAOA
	mov	WORD PTR [bp-178],0
; Line 1566
$I1295:
; Line 1567
	mov	ax,60
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	mov	ax,WORD PTR _OLDAOA
	cwd	
	mov	cx,WORD PTR [bp-180]	;NEWAOA
	mov	bx,WORD PTR [bp-178]
	sub	cx,ax
	sbb	bx,dx
	push	bx
	push	cx
	mov	si,ax
	mov	di,dx
	call	__aNlmul
	push	dx
	push	ax
	call	__aNldiv
	add	si,ax
	adc	di,dx
	mov	WORD PTR [bp-180],si	;NEWAOA
	mov	WORD PTR [bp-178],di
	mov	WORD PTR _OLDAOA,si
; Line 1572
	or	di,di
	jl	$I1296
	jg	$L20081
	cmp	si,1270
	jbe	$I1296
$L20081:
; Line 1573
; Line 1574
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,23
	push	ax
	call	_Sound
	add	sp,6
; Line 1575
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1297
	push	ax
	call	_Message
	add	sp,4
; Line 1576
; Line 1579
$I1296:
	lea	ax,WORD PTR [bp-34]	;TM
	push	ax
	push	WORD PTR _SLEW
	mov	cx,WORD PTR [bp-180]	;NEWAOA
	neg	cx
	push	cx
	sub	cx,cx
	push	cx
	call	_MakeMatRPH
	add	sp,8
; Line 1581
	lea	ax,WORD PTR [bp-246]	;RM
	push	ax
	lea	cx,WORD PTR [bp-34]	;TM
	push	cx
	mov	cx,OFFSET DGROUP:_FPARAMS+24
	push	cx
	call	_Mult3X3
	add	sp,6
; Line 1582
	mov	ax,OFFSET DGROUP:_OurRoll
	push	ax
	mov	cx,OFFSET DGROUP:_OurPitch
	push	cx
	mov	dx,OFFSET DGROUP:_OurHead
	push	dx
	lea	bx,WORD PTR [bp-246]	;RM
	push	bx
	call	_GetHPR
	add	sp,8
; Line 1583
	neg	WORD PTR _OurPitch
; Line 1586
	push	WORD PTR _OurRoll
	call	_abs
	add	sp,2
	cwd	
	sub	ax,dx
	sar	ax,1
	push	WORD PTR _OurPitch
	mov	si,ax
	call	_abs
	add	sp,2
	sub	ax,si
	cmp	ax,4096
	jle	$L20082
	mov	al,1
	jmp	SHORT $L20083
$L20082:
	sub	al,al
$L20083:
	mov	BYTE PTR _DoPitchLines,al
; Line 1587
	push	WORD PTR _OurRoll
	push	WORD PTR _OurPitch
	push	WORD PTR _OurHead
	mov	ax,OFFSET DGROUP:_FM
	push	ax
	call	_MakeRotationMatrix
	add	sp,8
; Line 1589
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-186]
	push	WORD PTR [bp-188]
	call	__aNldiv
	push	ax
	mov	si,ax
	call	_abs
	add	sp,2
	mov	cl,4
	shl	ax,cl
	mov	WORD PTR _AirSpeed,ax
; Line 1591
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+18
	push	WORD PTR _FPARAMS+16
	call	__aNldiv
	mov	WORD PTR _VVI,ax
; Line 1594
	push	si
	call	_abs
	add	sp,2
	mov	WORD PTR _Knots,ax
; Line 1595
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
	mov	WORD PTR _Knots,ax
; Line 1598
	mov	ax,100
	cwd	
	push	dx
	push	ax
	mov	cx,WORD PTR [bp-180]	;NEWAOA
	mov	bx,WORD PTR [bp-178]
	shl	cx,1
	rcl	bx,1
	shl	cx,1
	rcl	bx,1
	shl	cx,1
	rcl	bx,1
	shl	cx,1
	rcl	bx,1
	shl	cx,1
	rcl	bx,1
	shl	cx,1
	rcl	bx,1
	shl	cx,1
	rcl	bx,1
	push	bx
	push	cx
	call	__aNldiv
	mov	WORD PTR _PitchAngle,ax
; Line 1600
	mov	ax,200
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-110]
	push	WORD PTR [bp-112]	;STICKGS
	call	__aNldiv
	mov	WORD PTR _Gees,ax
; Line 1602
	mov	cx,100
	sub	dx,dx
	push	dx
	push	cx
	push	WORD PTR _FPARAMS+2
	push	WORD PTR _FPARAMS
	call	__aNldiv
	mov	WORD PTR _PxLng,ax
	mov	WORD PTR _PxLng+2,dx
; Line 1603
	mov	ax,-100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+10
	push	WORD PTR _FPARAMS+8
	call	__aNldiv
	add	ax,0
	adc	dx,16
	mov	WORD PTR _PyLng,ax
	mov	WORD PTR _PyLng+2,dx
; Line 1605
	mov	ax,100
	cwd	
	push	dx
	push	ax
	push	WORD PTR _FPARAMS+6
	push	WORD PTR _FPARAMS+4
	call	__aNldiv
	mov	WORD PTR _OurAlt,ax
; Line 1606
	shr	ax,1
	shr	ax,1
	mov	WORD PTR _Alt,ax
; Line 1608
	cmp	WORD PTR _Gees,0
	jle	$I1299
; Line 1609
; Line 1610
	cmp	WORD PTR _Gees,48
	jge	$I1300
; Line 1611
	mov	ax,360
$L20107:
	push	ax
	push	WORD PTR _Fticks
	push	WORD PTR _GEFFECT
	call	_MDiv
	add	sp,6
	sub	WORD PTR _GEFFECT,ax
; Line 1612
	jmp	SHORT $I1304
	nop	
$I1300:
; Line 1613
	mov	ax,96
	jmp	SHORT $L20108
	nop	
$I1299:
; Line 1616
; Line 1617
	cmp	WORD PTR _Gees,-32
	jle	$I1303
; Line 1618
	mov	ax,600
	jmp	SHORT $L20107
$I1303:
; Line 1620
	mov	ax,6
$L20108:
	push	ax
	push	WORD PTR _Fticks
	push	WORD PTR _Gees
	call	_MDiv
	add	sp,6
	add	WORD PTR _GEFFECT,ax
$I1304:
; Line 1621
; Line 1623
	cmp	WORD PTR _GEFFECT,7200
	jle	$I1305
	mov	WORD PTR _GEFFECT,7200
; Line 1624
$I1305:
	cmp	WORD PTR _GEFFECT,-7200
	jge	$I1306
	mov	WORD PTR _GEFFECT,-7200
; Line 1627
$I1306:
	cmp	WORD PTR _Gees,96
	jle	$I1307
	test	BYTE PTR _Damaged,4
	jne	$I1307
	cmp	WORD PTR _ConfigData+4,2
	jne	$I1307
; Line 1628
; Line 1629
	cmp	WORD PTR _Gees,128
	jle	$I1308
; Line 1630
; Line 1631
	or	BYTE PTR _Damaged,4
; Line 1632
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1309
	jmp	SHORT $L20105
	nop	
$I1308:
; Line 1635
; Line 1636
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1311
$L20105:
	push	ax
	call	_Message
	add	sp,4
; Line 1637
; Line 1638
; Line 1642
$I1307:
	test	BYTE PTR _Damaged+1,128
	je	$I1312
	cmp	WORD PTR [bp-4],18000	;ALT
	jbe	$I1312
; Line 1643
; Line 1644
	mov	ax,2
	cwd	
	push	dx
	push	ax
	push	WORD PTR [bp-88]
	push	WORD PTR [bp-90]	;SFticks
	call	__aNldiv
	add	WORD PTR _PRESSUREBLACK,ax
	cmp	WORD PTR _PRESSUREBLACK,1000
	jle	$I1315
	mov	WORD PTR _PRESSUREBLACK,1000
; Line 1645
; Line 1646
	jmp	SHORT $I1315
	nop	
$I1312:
; Line 1647
; Line 1648
	mov	ax,WORD PTR [bp-90]	;SFticks
	shl	ax,1
	sub	WORD PTR _PRESSUREBLACK,ax
	jns	$I1315
	mov	WORD PTR _PRESSUREBLACK,0
; Line 1649
$I1315:
; Line 1651
	mov	WORD PTR _GAMNT,0
; Line 1652
	cmp	WORD PTR _GEFFECT,600
	jle	$I1316
	mov	ax,WORD PTR _GEFFECT
	sub	ax,600
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,2
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	WORD PTR _GAMNT,ax
; Line 1653
$I1316:
	cmp	WORD PTR _GEFFECT,-600
	jge	$I1317
	mov	ax,WORD PTR _GEFFECT
	add	ax,600
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,2
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	mov	WORD PTR _GAMNT,ax
; Line 1654
$I1317:
	push	WORD PTR _GAMNT
	call	_abs
	add	sp,2
	cmp	ax,100
	jle	$I1318
	cmp	WORD PTR _GAMNT,0
	jle	$L20084
	mov	ax,100
	jmp	SHORT $L20085
$L20084:
	mov	ax,-100
$L20085:
	mov	WORD PTR _GAMNT,ax
; Line 1655
$I1318:
	cmp	WORD PTR _PRESSUREBLACK,600
	jle	$I1320
; Line 1656
; Line 1657
	mov	ax,WORD PTR _PRESSUREBLACK
	sub	ax,600
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	cx,2
	sar	ax,cl
	xor	ax,dx
	sub	ax,dx
	cmp	ax,WORD PTR _GAMNT
	jle	$I1320
; Line 1658
	mov	WORD PTR _GAMNT,ax
; Line 1659
$I1320:
; Line 1661
	pop	si
	pop	di
	mov	sp,bp
	pop	bp
	ret	
	nop	

_ScottFlight	ENDP
; Line 1665
	PUBLIC	_Splatted
_Splatted	PROC NEAR
	push	bp
	mov	bp,sp
	mov	ax,90
	call	__aNchkstk
;	ouch = -90
;	str = -88
;	VVILIMIT = -4
;	ROLLLIMIT = -8
;	SPDLIMIT = -6
;	spltcode = 6
;	F = 4
; Line 1675
	mov	WORD PTR [bp-90],0	;ouch
; Line 1677
	cmp	WORD PTR _tchdwnrating,0
	je	$JCC11857
	jmp	$I1329
$JCC11857:
; Line 1678
; Line 1679
	mov	ax,WORD PTR _ConfigData+8
	or	ax,ax
	je	$SC1334
	dec	ax
	jne	$JCC11870
	jmp	$SC1335
$JCC11870:
	dec	ax
	jne	$JCC11876
	jmp	$SC1336
$JCC11876:
	jmp	SHORT $SB1331
; Line 1680
; Line 1681
	nop	
$SC1334:
; Line 1682
	mov	WORD PTR [bp-4],-2000	;VVILIMIT
	mov	WORD PTR [bp-2],-1
; Line 1683
	mov	WORD PTR [bp-8],1820	;ROLLLIMIT
; Line 1684
	mov	WORD PTR [bp-6],20	;SPDLIMIT
; Line 1685
$SB1331:
; Line 1697
	mov	WORD PTR _tchdwnrating,10
; Line 1698
	mov	ax,WORD PTR [bp-4]	;VVILIMIT
	mov	dx,WORD PTR [bp-2]
	mov	bx,WORD PTR [bp+4]	;F
	cmp	WORD PTR [bx+18],dx
	jl	$I1337
	jg	$L20086
	cmp	WORD PTR [bx+16],ax
	jbe	$I1337
$L20086:
; Line 1699
; Line 1700
	mov	WORD PTR _tchdwnrating,20
; Line 1701
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1338
	push	ax
	call	_Message
	add	sp,4
; Line 1702
; Line 1703
$I1337:
	push	WORD PTR _OurRoll
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR [bp-8]	;ROLLLIMIT
	jge	$I1339
; Line 1704
; Line 1705
	add	WORD PTR _tchdwnrating,5
; Line 1706
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1340
	push	ax
	call	_Message
	add	sp,4
; Line 1707
; Line 1708
$I1339:
	mov	ax,WORD PTR _Knots
	sub	ax,135
	push	ax
	call	_abs
	add	sp,2
	cmp	ax,WORD PTR [bp-6]	;SPDLIMIT
	jge	$I1341
; Line 1709
; Line 1710
	add	WORD PTR _tchdwnrating,5
; Line 1711
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1342
	push	ax
	call	_Message
	add	sp,4
; Line 1712
; Line 1713
$I1341:
	push	WORD PTR _tchdwnrating
	mov	ax,OFFSET DGROUP:$SG1343
	push	ax
	lea	ax,WORD PTR [bp-88]	;str
	push	ax
	call	_sprintf
	add	sp,6
; Line 1714
	mov	ax,2
	push	ax
	lea	ax,WORD PTR [bp-88]	;str
	push	ax
	call	_Message
	add	sp,4
; Line 1715
	sub	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,37
	push	ax
	call	_Sound
	add	sp,6
; Line 1716
; Line 1718
$I1329:
	cmp	WORD PTR [bp+6],-1	;spltcode
	jne	$I1344
; Line 1719
; Line 1720
	mov	bx,WORD PTR [bp+4]	;F
	mov	WORD PTR [bx+4],12000
	mov	WORD PTR [bx+6],0
; Line 1721
	mov	WORD PTR [bp-90],7	;ouch
; Line 1722
; Line 1726
$I1344:
	mov	bx,WORD PTR [bp+4]	;F
	cmp	WORD PTR [bx+6],0
	jg	$I1345
	jl	$L20087
	cmp	WORD PTR [bx+4],5500
	jae	$I1345
$L20087:
	mov	WORD PTR [bp-90],2	;ouch
; Line 1727
$I1345:
	mov	ax,WORD PTR [bx+4]
	mov	dx,WORD PTR [bx+6]
	sub	ax,WORD PTR [bx+16]
	sbb	dx,WORD PTR [bx+18]
	or	dx,dx
	jg	$I1346
	jl	$L20090
	cmp	ax,6300
	jae	$I1346
$L20090:
	mov	WORD PTR [bp-90],3	;ouch
; Line 1730
$I1346:
	cmp	WORD PTR _OurPitch,-900
	jge	$I1347
; Line 1731
; Line 1732
	mov	WORD PTR _OurPitch,-900
; Line 1733
	mov	WORD PTR [bp-90],5	;ouch
; Line 1734
; Line 1735
$I1347:
	cmp	WORD PTR _OurPitch,3640
	jle	$I1348
; Line 1736
; Line 1737
	mov	WORD PTR _OurPitch,3640
; Line 1738
	mov	WORD PTR [bp-90],6	;ouch
; Line 1739
; Line 1741
$I1348:
	cmp	WORD PTR [bx+6],0
	jg	$I1349
	jl	$L20091
	cmp	WORD PTR [bx+4],6600
	jae	$I1349
$L20091:
	mov	WORD PTR [bx+4],6600
	mov	WORD PTR [bx+6],0
; Line 1742
$I1349:
	mov	bx,WORD PTR [bp+4]	;F
	cmp	WORD PTR [bx+18],0
	jge	$I1350
	sub	ax,ax
	mov	WORD PTR [bx+18],ax
	mov	WORD PTR [bx+16],ax
; Line 1744
$I1350:
	mov	WORD PTR _OurRoll,0
; Line 1746
	cmp	WORD PTR [bp-90],0	;ouch
	je	$I1351
	cmp	WORD PTR _ConfigData+8,2
	jne	$I1351
	test	BYTE PTR _Status+1,16
	jne	$I1351
; Line 1747
; Line 1748
	mov	ax,17
	push	ax
	mov	ax,4
	push	ax
	sub	ax,ax
	mov	dx,16
	sub	ax,WORD PTR _PyLng
	sbb	dx,WORD PTR _PyLng+2
	push	dx
	push	ax
	push	WORD PTR _Alt
	push	WORD PTR _PxLng+2
	push	WORD PTR _PxLng
	call	_StartASmoke
	add	sp,14
; Line 1749
	sub	ax,ax
	push	ax
	mov	cx,2
	push	cx
	mov	cx,10
	push	cx
	call	_Sound
	add	sp,6
; Line 1750
	mov	ax,15
	push	ax
	call	_EndGame
	add	sp,2
; Line 1751
	mov	WORD PTR _LSORating,0
; Line 1752
; Line 1753
$I1351:
	cmp	WORD PTR [bp-90],0	;ouch
	jne	$JCC12330
	jmp	$I1352
$JCC12330:
; Line 1754
; Line 1755
	mov	ax,WORD PTR [bp-90]	;ouch
	jmp	SHORT $S1353
; Line 1686
$SC1335:
; Line 1687
	mov	WORD PTR [bp-4],-1500	;VVILIMIT
	mov	WORD PTR [bp-2],-1
; Line 1688
	mov	WORD PTR [bp-8],910	;ROLLLIMIT
; Line 1689
	mov	WORD PTR [bp-6],10	;SPDLIMIT
; Line 1690
	jmp	$SB1331
; Line 1691
	nop	
$SC1336:
; Line 1692
	mov	WORD PTR [bp-4],-1200	;VVILIMIT
	mov	WORD PTR [bp-2],-1
; Line 1693
	mov	WORD PTR [bp-8],546	;ROLLLIMIT
; Line 1694
	mov	WORD PTR [bp-6],6	;SPDLIMIT
; Line 1695
	jmp	$SB1331
; Line 1756
; Line 1757
	nop	
$SC1357:
; Line 1758
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1358
$L20109:
	push	ax
	call	_Message
	add	sp,4
; Line 1759
	jmp	SHORT $SB1354
; Line 1760
$SC1359:
; Line 1761
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1360
	jmp	SHORT $L20109
; Line 1763
	nop	
$SC1361:
; Line 1764
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1362
	jmp	SHORT $L20109
; Line 1766
	nop	
$SC1363:
; Line 1767
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1364
	jmp	SHORT $L20109
; Line 1769
	nop	
$SC1365:
; Line 1770
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1366
	jmp	SHORT $L20109
; Line 1772
	nop	
$SC1367:
; Line 1773
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1368
	jmp	SHORT $L20109
; Line 1775
	nop	
$SC1369:
; Line 1776
	mov	ax,2
	push	ax
	mov	ax,OFFSET DGROUP:$SG1370
	jmp	SHORT $L20109
	nop	
$S1353:
	dec	ax
	cmp	ax,6
	ja	$SB1354
	shl	ax,1
	xchg	ax,bx
	jmp	WORD PTR cs:$L20092[bx]
$L20092:
		DW	$SC1357
		DW	$SC1359
		DW	$SC1361
		DW	$SC1363
		DW	$SC1365
		DW	$SC1367
		DW	$SC1369
$SB1354:
; Line 1780
	mov	WORD PTR _tchdwnrating,-40
; Line 1781
; Line 1784
$I1352:
	sub	ax,ax
; Line 1786
	mov	sp,bp
	pop	bp
	ret	

_Splatted	ENDP
_TEXT	ENDS
END
