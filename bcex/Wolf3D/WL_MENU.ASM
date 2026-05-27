	ifndef	??version
?debug	macro
	endm
$comm	macro	name,dist,size,count
	comm	dist name:BYTE:count*size
	endm
	else
$comm	macro	name,dist,size,count
	comm	dist name[size]:BYTE:count
	endm
	endif
	?debug	S "c:\wl_menu.c"
	?debug	C E9E551FE7C0C633A5C776C5F6D656E752E63
	?debug	C E9E551FE7C08776C5F6465662E68
	?debug	C E9E551FE7C0A49445F48454144532E48
	?debug	C E95337528112443A5C494E434C5544455C414C4C4F432E48
	?debug	C E95337528112443A5C494E434C5544455C43545950452E48
	?debug	C E95337528110443A5C494E434C5544455C444F532E48
	?debug	C E95337528112443A5C494E434C5544455C4552524E4F2E48
	?debug	C E95337528112443A5C494E434C5544455C46434E544C2E48
	?debug	C E9533752810F443A5C494E434C5544455C494F2E48
	?debug	C E95337528113443A5C494E434C5544455C7374646172672E68
	?debug	C E95337528110443A5C494E434C5544455C4D454D2E48
	?debug	C E95337528114443A5C494E434C5544455C50524F434553532E48
	?debug	C E95337528112443A5C494E434C5544455C535444494F2E48
	?debug	C E95337528113443A5C494E434C5544455C5354444C49422E48
	?debug	C E95337528113443A5C494E434C5544455C535452494E472E48
	?debug	C E95337528115443A5C494E434C5544455C5359535C535441542E48
	?debug	C E95337528113443A5C494E434C5544455C56414C5545532E48
	?debug	C E95337528110443A5C494E434C5544455C4449522E48
	?debug	C E9E551FE7C0956455253494F4E2E48
	?debug	C E9E551FE7C0A474658565F574C362E48
	?debug	C E9E551FE7C0A415544494F574C362E48
	?debug	C E9E551FE7C094D415053574C362E48
	?debug	C E9E551FE7C0749445F4D4D2E48
	?debug	C E9E551FE7C0749445F504D2E48
	?debug	C E9E551FE7C0749445F43412E48
	?debug	C E9E551FE7C0749445F564C2E48
	?debug	C E9E551FE7C0749445F56482E48
	?debug	C E9E551FE7C0749445F494E2E48
	?debug	C E9E551FE7C0749445F53442E48
	?debug	C E9E551FE7C0749445F55532E48
	?debug	C E95337528111443A5C494E434C5544455C4D4154482E48
	?debug	C E95337528113443A5C494E434C5544455C56414C5545532E48
	?debug	C E9E551FE7C09574C5F4D454E552E48
	?debug	C E9E551FE7C09464F524549474E2E48
_TEXT	segment byte public 'CODE'
_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:_TEXT,ds:DGROUP
_DATA	segment word public 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
WL_MENU5_FAR	segment para public 'FAR_DATA'
_endStrings	label	byte
	db	68
	db	111
	db	115
	db	116
	db	32
	db	116
	db	104
	db	111
	db	117
	db	32
	db	119
	db	105
	db	115
	db	104
	db	32
	db	116
	db	111
	db	10
	db	108
	db	101
	db	97
	db	118
	db	101
	db	32
	db	119
	db	105
	db	116
	db	104
	db	32
	db	115
	db	117
	db	99
	db	104
	db	32
	db	104
	db	97
	db	115
	db	116
	db	121
	db	10
	db	97
	db	98
	db	97
	db	110
	db	100
	db	111
	db	110
	db	63
	db	32 dup (0)
	db	67
	db	104
	db	105
	db	99
	db	107
	db	101
	db	110
	db	105
	db	110
	db	103
	db	32
	db	111
	db	117
	db	116
	db	46
	db	46
	db	46
	db	10
	db	97
	db	108
	db	114
	db	101
	db	97
	db	100
	db	121
	db	63
	db	54 dup (0)
	db	80
	db	114
	db	101
	db	115
	db	115
	db	32
	db	78
	db	32
	db	102
	db	111
	db	114
	db	32
	db	109
	db	111
	db	114
	db	101
	db	32
	db	99
	db	97
	db	114
	db	110
	db	97
	db	103
	db	101
	db	46
	db	10
	db	80
	db	114
	db	101
	db	115
	db	115
	db	32
	db	89
	db	32
	db	116
	db	111
	db	32
	db	98
	db	101
	db	32
	db	97
	db	32
	db	119
	db	101
	db	101
	db	110
	db	105
	db	101
	db	46
	db	31 dup (0)
	db	83
	db	111
	db	44
	db	32
	db	121
	db	111
	db	117
	db	32
	db	116
	db	104
	db	105
	db	110
	db	107
	db	32
	db	121
	db	111
	db	117
	db	32
	db	99
	db	97
	db	110
	db	10
	db	113
	db	117
	db	105
	db	116
	db	32
	db	116
	db	104
	db	105
	db	115
	db	32
	db	101
	db	97
	db	115
	db	105
	db	108
	db	121
	db	44
	db	32
	db	104
	db	117
	db	104
	db	63
	db	36 dup (0)
	db	80
	db	114
	db	101
	db	115
	db	115
	db	32
	db	78
	db	32
	db	116
	db	111
	db	32
	db	115
	db	97
	db	118
	db	101
	db	32
	db	116
	db	104
	db	101
	db	32
	db	119
	db	111
	db	114
	db	108
	db	100
	db	46
	db	10
	db	80
	db	114
	db	101
	db	115
	db	115
	db	32
	db	89
	db	32
	db	116
	db	111
	db	32
	db	97
	db	98
	db	97
	db	110
	db	100
	db	111
	db	110
	db	32
	db	105
	db	116
	db	32
	db	105
	db	110
	db	10
	db	105
	db	116
	db	115
	db	32
	db	104
	db	111
	db	117
	db	114
	db	32
	db	111
	db	102
	db	32
	db	110
	db	101
	db	101
	db	100
	db	46
	db	11 dup (0)
	db	80
	db	114
	db	101
	db	115
	db	115
	db	32
	db	78
	db	32
	db	105
	db	102
	db	32
	db	121
	db	111
	db	117
	db	32
	db	97
	db	114
	db	101
	db	32
	db	98
	db	114
	db	97
	db	118
	db	101
	db	46
	db	10
	db	80
	db	114
	db	101
	db	115
	db	115
	db	32
	db	89
	db	32
	db	116
	db	111
	db	32
	db	99
	db	111
	db	119
	db	101
	db	114
	db	32
	db	105
	db	110
	db	32
	db	115
	db	104
	db	97
	db	109
	db	101
	db	46
	db	28 dup (0)
	db	72
	db	101
	db	114
	db	111
	db	101
	db	115
	db	44
	db	32
	db	112
	db	114
	db	101
	db	115
	db	115
	db	32
	db	78
	db	46
	db	10
	db	87
	db	105
	db	109
	db	112
	db	115
	db	44
	db	32
	db	112
	db	114
	db	101
	db	115
	db	115
	db	32
	db	89
	db	46
	db	48 dup (0)
	db	89
	db	111
	db	117
	db	32
	db	97
	db	114
	db	101
	db	32
	db	97
	db	116
	db	32
	db	97
	db	110
	db	32
	db	105
	db	110
	db	116
	db	101
	db	114
	db	115
	db	101
	db	99
	db	116
	db	105
	db	111
	db	110
	db	46
	db	10
	db	65
	db	32
	db	115
	db	105
	db	103
	db	110
	db	32
	db	115
	db	97
	db	121
	db	115
	db	44
	db	32
	db	39
	db	80
	db	114
	db	101
	db	115
	db	115
	db	32
	db	89
	db	32
	db	116
	db	111
	db	32
	db	113
	db	117
	db	105
	db	116
	db	46
	db	39
	db	10
	db	62
	db	19 dup (0)
	db	70
	db	111
	db	114
	db	32
	db	103
	db	117
	db	110
	db	115
	db	32
	db	97
	db	110
	db	100
	db	32
	db	103
	db	108
	db	111
	db	114
	db	121
	db	44
	db	32
	db	112
	db	114
	db	101
	db	115
	db	115
	db	32
	db	78
	db	46
	db	10
	db	70
	db	111
	db	114
	db	32
	db	119
	db	111
	db	114
	db	107
	db	32
	db	97
	db	110
	db	100
	db	32
	db	119
	db	111
	db	114
	db	114
	db	121
	db	44
	db	32
	db	112
	db	114
	db	101
	db	115
	db	115
	db	32
	db	89
	db	46
	db	23 dup (0)
WL_MENU5_FAR	ends
_DATA	segment word public 'DATA'
_MainItems	label	word
	db	76
	db	0
	db	55
	db	0
	db	10
	db	0
	db	0
	db	0
	db	24
	db	0
_SndItems	label	word
	db	48
	db	0
	db	20
	db	0
	db	12
	db	0
	db	0
	db	0
	db	52
	db	0
_LSItems	label	word
	db	85
	db	0
	db	55
	db	0
	db	10
	db	0
	db	0
	db	0
	db	24
	db	0
_CtlItems	label	word
	db	24
	db	0
	db	70
	db	0
	db	6
	db	0
	db	255
	db	255
	db	56
	db	0
_CusItems	label	word
	db	8
	db	0
	db	74
	db	0
	db	9
	db	0
	db	255
	db	255
	db	0
	db	0
_NewEitems	label	word
	db	10
	db	0
	db	23
	db	0
	db	11
	db	0
	db	0
	db	0
	db	88
	db	0
_NewItems	label	word
	db	50
	db	0
	db	100
	db	0
	db	4
	db	0
	db	2
	db	0
	db	24
	db	0
_DATA	ends
WL_MENU6_FAR	segment para public 'FAR_DATA'
_MainMenu	label	word
	db	1
	db	0
	db	78
	db	101
	db	119
	db	32
	db	71
	db	97
	db	109
	db	101
	db	28 dup (0)
	dw	_CP_NewGame
	db	1
	db	0
	db	83
	db	111
	db	117
	db	110
	db	100
	db	31 dup (0)
	dw	_CP_Sound
	db	1
	db	0
	db	67
	db	111
	db	110
	db	116
	db	114
	db	111
	db	108
	db	29 dup (0)
	dw	_CP_Control
	db	1
	db	0
	db	76
	db	111
	db	97
	db	100
	db	32
	db	71
	db	97
	db	109
	db	101
	db	27 dup (0)
	dw	_CP_LoadGame
	db	0
	db	0
	db	83
	db	97
	db	118
	db	101
	db	32
	db	71
	db	97
	db	109
	db	101
	db	27 dup (0)
	dw	_CP_SaveGame
	db	1
	db	0
	db	67
	db	104
	db	97
	db	110
	db	103
	db	101
	db	32
	db	86
	db	105
	db	101
	db	119
	db	25 dup (0)
	dw	_CP_ChangeView
	db	1
	db	0
	db	86
	db	105
	db	101
	db	119
	db	32
	db	83
	db	99
	db	111
	db	114
	db	101
	db	115
	db	25 dup (0)
	dw	_CP_ViewScores
	db	1
	db	0
	db	66
	db	97
	db	99
	db	107
	db	32
	db	116
	db	111
	db	32
	db	68
	db	101
	db	109
	db	111
	db	24 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	81
	db	117
	db	105
	db	116
	db	32 dup (0)
	db	0
	db	0
WL_MENU6_FAR	ends
WL_MENU7_FAR	segment para public 'FAR_DATA'
_SndMenu	label	word
	db	1
	db	0
	db	78
	db	111
	db	110
	db	101
	db	32 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	80
	db	67
	db	32
	db	83
	db	112
	db	101
	db	97
	db	107
	db	101
	db	114
	db	26 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	65
	db	100
	db	76
	db	105
	db	98
	db	47
	db	83
	db	111
	db	117
	db	110
	db	100
	db	32
	db	66
	db	108
	db	97
	db	115
	db	116
	db	101
	db	114
	db	17 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	78
	db	111
	db	110
	db	101
	db	32 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	68
	db	105
	db	115
	db	110
	db	101
	db	121
	db	32
	db	83
	db	111
	db	117
	db	110
	db	100
	db	32
	db	83
	db	111
	db	117
	db	114
	db	99
	db	101
	db	17 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	83
	db	111
	db	117
	db	110
	db	100
	db	32
	db	66
	db	108
	db	97
	db	115
	db	116
	db	101
	db	114
	db	23 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	78
	db	111
	db	110
	db	101
	db	32 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	65
	db	100
	db	76
	db	105
	db	98
	db	47
	db	83
	db	111
	db	117
	db	110
	db	100
	db	32
	db	66
	db	108
	db	97
	db	115
	db	116
	db	101
	db	114
	db	17 dup (0)
	db	0
	db	0
WL_MENU7_FAR	ends
WL_MENU8_FAR	segment para public 'FAR_DATA'
_CtlMenu	label	word
	db	0
	db	0
	db	77
	db	111
	db	117
	db	115
	db	101
	db	32
	db	69
	db	110
	db	97
	db	98
	db	108
	db	101
	db	100
	db	23 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	74
	db	111
	db	121
	db	115
	db	116
	db	105
	db	99
	db	107
	db	32
	db	69
	db	110
	db	97
	db	98
	db	108
	db	101
	db	100
	db	20 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	85
	db	115
	db	101
	db	32
	db	106
	db	111
	db	121
	db	115
	db	116
	db	105
	db	99
	db	107
	db	32
	db	112
	db	111
	db	114
	db	116
	db	32
	db	50
	db	17 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	71
	db	114
	db	97
	db	118
	db	105
	db	115
	db	32
	db	71
	db	97
	db	109
	db	101
	db	80
	db	97
	db	100
	db	32
	db	69
	db	110
	db	97
	db	98
	db	108
	db	101
	db	100
	db	14 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	77
	db	111
	db	117
	db	115
	db	101
	db	32
	db	83
	db	101
	db	110
	db	115
	db	105
	db	116
	db	105
	db	118
	db	105
	db	116
	db	121
	db	19 dup (0)
	dw	_MouseSensitivity
	db	1
	db	0
	db	67
	db	117
	db	115
	db	116
	db	111
	db	109
	db	105
	db	122
	db	101
	db	32
	db	99
	db	111
	db	110
	db	116
	db	114
	db	111
	db	108
	db	115
	db	18 dup (0)
	dw	_CustomControls
WL_MENU8_FAR	ends
WL_MENU9_FAR	segment para public 'FAR_DATA'
_NewEmenu	label	word
	db	1
	db	0
	db	69
	db	112
	db	105
	db	115
	db	111
	db	100
	db	101
	db	32
	db	49
	db	10
	db	69
	db	115
	db	99
	db	97
	db	112
	db	101
	db	32
	db	102
	db	114
	db	111
	db	109
	db	32
	db	87
	db	111
	db	108
	db	102
	db	101
	db	110
	db	115
	db	116
	db	101
	db	105
	db	110
	db	3 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	3
	db	0
	db	69
	db	112
	db	105
	db	115
	db	111
	db	100
	db	101
	db	32
	db	50
	db	10
	db	79
	db	112
	db	101
	db	114
	db	97
	db	116
	db	105
	db	111
	db	110
	db	58
	db	32
	db	69
	db	105
	db	115
	db	101
	db	110
	db	102
	db	97
	db	117
	db	115
	db	116
	db	5 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	3
	db	0
	db	69
	db	112
	db	105
	db	115
	db	111
	db	100
	db	101
	db	32
	db	51
	db	10
	db	68
	db	105
	db	101
	db	44
	db	32
	db	70
	db	117
	db	104
	db	114
	db	101
	db	114
	db	44
	db	32
	db	68
	db	105
	db	101
	db	33
	db	9 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	3
	db	0
	db	69
	db	112
	db	105
	db	115
	db	111
	db	100
	db	101
	db	32
	db	52
	db	10
	db	65
	db	32
	db	68
	db	97
	db	114
	db	107
	db	32
	db	83
	db	101
	db	99
	db	114
	db	101
	db	116
	db	13 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	3
	db	0
	db	69
	db	112
	db	105
	db	115
	db	111
	db	100
	db	101
	db	32
	db	53
	db	10
	db	84
	db	114
	db	97
	db	105
	db	108
	db	32
	db	111
	db	102
	db	32
	db	116
	db	104
	db	101
	db	32
	db	77
	db	97
	db	100
	db	109
	db	97
	db	110
	db	7 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	3
	db	0
	db	69
	db	112
	db	105
	db	115
	db	111
	db	100
	db	101
	db	32
	db	54
	db	10
	db	67
	db	111
	db	110
	db	102
	db	114
	db	111
	db	110
	db	116
	db	97
	db	116
	db	105
	db	111
	db	110
	db	13 dup (0)
	db	0
	db	0
WL_MENU9_FAR	ends
WL_MENU10_FAR	segment para public 'FAR_DATA'
_NewMenu	label	word
	db	1
	db	0
	db	67
	db	97
	db	110
	db	32
	db	73
	db	32
	db	112
	db	108
	db	97
	db	121
	db	44
	db	32
	db	68
	db	97
	db	100
	db	100
	db	121
	db	63
	db	18 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	68
	db	111
	db	110
	db	39
	db	116
	db	32
	db	104
	db	117
	db	114
	db	116
	db	32
	db	109
	db	101
	db	46
	db	22 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	66
	db	114
	db	105
	db	110
	db	103
	db	32
	db	39
	db	101
	db	109
	db	32
	db	111
	db	110
	db	33
	db	23 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	73
	db	32
	db	97
	db	109
	db	32
	db	68
	db	101
	db	97
	db	116
	db	104
	db	32
	db	105
	db	110
	db	99
	db	97
	db	114
	db	110
	db	97
	db	116
	db	101
	db	33
	db	15 dup (0)
	db	0
	db	0
WL_MENU10_FAR	ends
WL_MENU11_FAR	segment para public 'FAR_DATA'
_LSMenu	label	word
	db	1
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	36 dup (0)
	db	0
	db	0
WL_MENU11_FAR	ends
WL_MENU12_FAR	segment para public 'FAR_DATA'
_CusMenu	label	word
	db	1
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	36 dup (0)
	db	0
	db	0
	db	1
	db	0
	db	36 dup (0)
	db	0
	db	0
WL_MENU12_FAR	ends
_DATA	segment word public 'DATA'
_color_hlite	label	word
	db	43
	db	0
	db	19
	db	0
	db	71
	db	0
	db	103
	db	0
_color_norml	label	word
	db	43
	db	0
	db	23
	db	0
	db	74
	db	0
	db	107
	db	0
_EpisodeSelect	label	word
	db	1
	db	0
	db	10 dup (0)
_SoundStatus	label	word
	db	1
	db	0
_SaveName	label	byte
	db	83
	db	65
	db	86
	db	69
	db	71
	db	65
	db	77
	db	63
	db	46
	db	4 dup (0)
ScanNames	label	word
	dw	DGROUP:s@
	dw	DGROUP:s@+2
	dw	DGROUP:s@+4
	dw	DGROUP:s@+6
	dw	DGROUP:s@+8
	dw	DGROUP:s@+10
	dw	DGROUP:s@+12
	dw	DGROUP:s@+14
	dw	DGROUP:s@+16
	dw	DGROUP:s@+18
	dw	DGROUP:s@+20
	dw	DGROUP:s@+22
	dw	DGROUP:s@+24
	dw	DGROUP:s@+26
	dw	DGROUP:s@+28
	dw	DGROUP:s@+30
	dw	DGROUP:s@+32
	dw	DGROUP:s@+34
	dw	DGROUP:s@+36
	dw	DGROUP:s@+38
	dw	DGROUP:s@+40
	dw	DGROUP:s@+42
	dw	DGROUP:s@+44
	dw	DGROUP:s@+46
	dw	DGROUP:s@+48
	dw	DGROUP:s@+50
	dw	DGROUP:s@+52
	dw	DGROUP:s@+54
	dw	DGROUP:s@+56
	dw	DGROUP:s@+58
	dw	DGROUP:s@+60
	dw	DGROUP:s@+62
	dw	DGROUP:s@+64
	dw	DGROUP:s@+66
	dw	DGROUP:s@+68
	dw	DGROUP:s@+70
	dw	DGROUP:s@+72
	dw	DGROUP:s@+74
	dw	DGROUP:s@+76
	dw	DGROUP:s@+78
	dw	DGROUP:s@+80
	dw	DGROUP:s@+82
	dw	DGROUP:s@+84
	dw	DGROUP:s@+86
	dw	DGROUP:s@+88
	dw	DGROUP:s@+90
	dw	DGROUP:s@+92
	dw	DGROUP:s@+94
	dw	DGROUP:s@+96
	dw	DGROUP:s@+98
	dw	DGROUP:s@+100
	dw	DGROUP:s@+102
	dw	DGROUP:s@+104
	dw	DGROUP:s@+106
	dw	DGROUP:s@+108
	dw	DGROUP:s@+110
	dw	DGROUP:s@+112
	dw	DGROUP:s@+114
	dw	DGROUP:s@+116
	dw	DGROUP:s@+118
	dw	DGROUP:s@+120
	dw	DGROUP:s@+122
	dw	DGROUP:s@+124
	dw	DGROUP:s@+126
	dw	DGROUP:s@+128
	dw	DGROUP:s@+130
	dw	DGROUP:s@+132
	dw	DGROUP:s@+134
	dw	DGROUP:s@+136
	dw	DGROUP:s@+138
	dw	DGROUP:s@+140
	dw	DGROUP:s@+142
	dw	DGROUP:s@+144
	dw	DGROUP:s@+146
	dw	DGROUP:s@+148
	dw	DGROUP:s@+150
	dw	DGROUP:s@+152
	dw	DGROUP:s@+154
	dw	DGROUP:s@+156
	dw	DGROUP:s@+158
	dw	DGROUP:s@+160
	dw	DGROUP:s@+162
	dw	DGROUP:s@+164
	dw	DGROUP:s@+166
	dw	DGROUP:s@+168
	dw	DGROUP:s@+170
	dw	DGROUP:s@+172
	dw	DGROUP:s@+174
	dw	DGROUP:s@+176
	dw	DGROUP:s@+178
	dw	DGROUP:s@+180
	dw	DGROUP:s@+182
	dw	DGROUP:s@+184
	dw	DGROUP:s@+186
	dw	DGROUP:s@+188
	dw	DGROUP:s@+190
	dw	DGROUP:s@+192
	dw	DGROUP:s@+194
	dw	DGROUP:s@+196
	dw	DGROUP:s@+198
	dw	DGROUP:s@+200
	dw	DGROUP:s@+202
	dw	DGROUP:s@+204
	dw	DGROUP:s@+206
	dw	DGROUP:s@+208
	dw	DGROUP:s@+210
	dw	DGROUP:s@+212
	dw	DGROUP:s@+214
	dw	DGROUP:s@+216
	dw	DGROUP:s@+218
	dw	DGROUP:s@+220
	dw	DGROUP:s@+222
	dw	DGROUP:s@+224
	dw	DGROUP:s@+226
	dw	DGROUP:s@+228
	dw	DGROUP:s@+230
	dw	DGROUP:s@+232
	dw	DGROUP:s@+234
	dw	DGROUP:s@+236
	dw	DGROUP:s@+238
	dw	DGROUP:s@+240
	dw	DGROUP:s@+242
	dw	DGROUP:s@+244
	dw	DGROUP:s@+246
	dw	DGROUP:s@+248
	dw	DGROUP:s@+250
	dw	DGROUP:s@+252
	dw	DGROUP:s@+254
_DATA	ends
WL_MENU13_FAR	segment para public 'FAR_DATA'
ExtScanCodes	label	byte
	db	1
	db	14
	db	15
	db	29
	db	42
	db	57
	db	58
	db	59
	db	60
	db	61
	db	62
	db	63
	db	64
	db	65
	db	66
	db	67
	db	68
	db	87
	db	89
	db	70
	db	28
	db	54
	db	55
	db	56
	db	71
	db	73
	db	79
	db	81
	db	82
	db	83
	db	69
	db	72
	db	80
	db	75
	db	77
	db	0
WL_MENU13_FAR	ends
_DATA	segment word public 'DATA'
ExtScanNames	label	word
	dw	DGROUP:s@+256
	dw	DGROUP:s@+260
	dw	DGROUP:s@+265
	dw	DGROUP:s@+269
	dw	DGROUP:s@+274
	dw	DGROUP:s@+280
	dw	DGROUP:s@+286
	dw	DGROUP:s@+293
	dw	DGROUP:s@+296
	dw	DGROUP:s@+299
	dw	DGROUP:s@+302
	dw	DGROUP:s@+305
	dw	DGROUP:s@+308
	dw	DGROUP:s@+311
	dw	DGROUP:s@+314
	dw	DGROUP:s@+317
	dw	DGROUP:s@+320
	dw	DGROUP:s@+324
	dw	DGROUP:s@+328
	dw	DGROUP:s@+332
	dw	DGROUP:s@+339
	dw	DGROUP:s@+345
	dw	DGROUP:s@+351
	dw	DGROUP:s@+357
	dw	DGROUP:s@+361
	dw	DGROUP:s@+366
	dw	DGROUP:s@+371
	dw	DGROUP:s@+375
	dw	DGROUP:s@+380
	dw	DGROUP:s@+384
	dw	DGROUP:s@+388
	dw	DGROUP:s@+394
	dw	DGROUP:s@+397
	dw	DGROUP:s@+402
	dw	DGROUP:s@+407
	dw	DGROUP:s@+413
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void US_ControlPanel(byte scancode)
   ;	
	assume	cs:_TEXT
_US_ControlPanel	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int which,i,start;
   ;	
   ;	
   ;		if (ingame)
   ;	
	cmp	word ptr DGROUP:_ingame,0
	je	short @1@98
   ;	
   ;			if (CP_CheckQuick(scancode))
   ;	
	mov	al,byte ptr [bp+4]
	mov	ah,0
	push	ax
	call	near ptr _CP_CheckQuick
	pop	cx
	or	ax,ax
	je	short @1@98
   ;	
   ;				return;
   ;	
	jmp	@1@818
@1@98:
   ;	
   ;	
   ;		StartCPMusic(MENUSONG);
   ;	
	mov	ax,14
	push	ax
	call	near ptr _StartCPMusic
	pop	cx
   ;	
   ;		SetupControlPanel();
   ;	
	call	near ptr _SetupControlPanel
   ;	
   ;	
   ;		//
   ;		// F-KEYS FROM WITHIN GAME
   ;		//
   ;		switch(scancode)
   ;	
	mov	al,byte ptr [bp+4]
	mov	ah,0
	sub	ax,59
	mov	bx,ax
	cmp	bx,5
	ja	short @1@362
	shl	bx,1
	jmp	word ptr cs:@1@C2808[bx]
@1@194:
   ;	
   ;		{
   ;			case sc_F1:
   ;				#ifdef SPEAR
   ;				BossKey();
   ;				#else
   ;				#ifdef GOODTIMES
   ;				BossKey();
   ;	
	call	near ptr _BossKey
   ;	
   ;				#else
   ;				HelpScreens();
   ;				#endif
   ;				#endif
   ;				goto finishup;
   ;	
	jmp	short @1@338
@1@218:
   ;	
   ;	
   ;			case sc_F2:
   ;				CP_SaveGame(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _CP_SaveGame
	pop	cx
   ;	
   ;				goto finishup;
   ;	
	jmp	short @1@338
@1@242:
   ;	
   ;	
   ;			case sc_F3:
   ;				CP_LoadGame(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _CP_LoadGame
	pop	cx
   ;	
   ;				goto finishup;
   ;	
	jmp	short @1@338
@1@266:
   ;	
   ;	
   ;			case sc_F4:
   ;				CP_Sound();
   ;	
	call	near ptr _CP_Sound
   ;	
   ;				goto finishup;
   ;	
	jmp	short @1@338
@1@290:
   ;	
   ;	
   ;			case sc_F5:
   ;				CP_ChangeView();
   ;	
	call	near ptr _CP_ChangeView
   ;	
   ;				goto finishup;
   ;	
	jmp	short @1@338
@1@314:
   ;	
   ;	
   ;			case sc_F6:
   ;				CP_Control();
   ;	
	call	near ptr _CP_Control
   ;	
   ;				goto finishup;
   ;	
	jmp	short @1@338
@1@338:
   ;	
   ;	
   ;			finishup:
   ;				CleanupControlPanel();
   ;	
	call	near ptr _CleanupControlPanel
   ;	
   ;				#ifdef SPEAR
   ;				UnCacheLump (OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;				#endif
   ;				return;
   ;	
	jmp	@1@818
@1@362:
   ;	
   ;		}
   ;	
   ;	#ifdef SPEAR
   ;		CacheLump (OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;	#endif
   ;	
   ;		DrawMainMenu();
   ;	
	call	near ptr _DrawMainMenu
   ;	
   ;		MenuFadeIn();
   ;	
	mov	ax,10
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
   ;	
   ;		StartGame=0;
   ;	
	mov	word ptr DGROUP:_StartGame,0
@1@386:
   ;	
   ;	
   ;		//
   ;		// MAIN MENU LOOP
   ;		//
   ;		do
   ;		{
   ;			which=HandleMenu(&MainItems,&MainMenu[0],NULL);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,seg _MainMenu
	push	ax
	mov	ax,offset _MainMenu
	push	ax
	mov	ax,offset DGROUP:_MainItems
	push	ax
	call	near ptr _HandleMenu
	add	sp,8
	mov	si,ax
   ;	
   ;	
   ;			#ifdef SPEAR
   ;			#ifndef SPEARDEMO
   ;			//
   ;			// EASTER EGG FOR SPEAR OF DESTINY!
   ;			//
   ;			if (Keyboard[sc_I] && Keyboard[sc_D])
   ;			{
   ;				VW_FadeOut();
   ;				StartCPMusic (XJAZNAZI_MUS);
   ;				UnCacheLump(OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;				UnCacheLump(BACKDROP_LUMP_START,BACKDROP_LUMP_END);
   ;				MM_SortMem ();
   ;				ClearMemory ();
   ;	
   ;	
   ;				CA_CacheGrChunk (IDGUYS1PIC);
   ;				VWB_DrawPic(0,0,IDGUYS1PIC);
   ;				UNCACHEGRCHUNK(IDGUYS1PIC);
   ;	
   ;				CA_CacheGrChunk (IDGUYS2PIC);
   ;				VWB_DrawPic(0,80,IDGUYS2PIC);
   ;				UNCACHEGRCHUNK(IDGUYS2PIC);
   ;	
   ;				VW_UpdateScreen();
   ;	
   ;				CA_CacheGrChunk (IDGUYSPALETTE);
   ;				VL_FadeIn(0,255,grsegs[IDGUYSPALETTE],30);
   ;				UNCACHEGRCHUNK(IDGUYSPALETTE);
   ;	
   ;				while (Keyboard[sc_I] || Keyboard[sc_D]);
   ;				IN_ClearKeysDown();
   ;				IN_Ack();
   ;	
   ;				VW_FadeOut();
   ;	
   ;				CacheLump(BACKDROP_LUMP_START,BACKDROP_LUMP_END);
   ;				CacheLump(OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;				DrawMainMenu();
   ;				StartCPMusic (MENUSONG);
   ;				MenuFadeIn();
   ;			}
   ;			#endif
   ;			#endif
   ;	
   ;			switch(which)
   ;	
	mov	bx,si
	inc	bx
	cmp	bx,9
	ja	short @1@674
	shl	bx,1
	jmp	word ptr cs:@1@C2946[bx]
@1@482:
   ;	
   ;			{
   ;				case viewscores:
   ;					if (MainMenu[viewscores].routine == NULL)
   ;	
	mov	ax,seg _MainMenu
	mov	es,ax
	cmp	word ptr es:_MainMenu+278,0
	jne	short @1@554
   ;	
   ;						if (CP_EndGame())
   ;	
	call	near ptr _CP_EndGame
	or	ax,ax
	je	short @1@554
   ;	
   ;							StartGame=1;
   ;	
	mov	word ptr DGROUP:_StartGame,1
@1@554:
   ;	
   ;	
   ;					DrawMainMenu();
   ;	
	call	near ptr _DrawMainMenu
   ;	
   ;					MenuFadeIn();
   ;	
	mov	ax,10
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
   ;	
   ;					break;
   ;	
	jmp	short @1@722
@1@578:
   ;	
   ;	
   ;				case backtodemo:
   ;					#ifdef SPEAR
   ;					if (!ingame)
   ;					{
   ;						//
   ;						// DEALLOCATE ALL SOUNDS!
   ;						//
   ;						switch (SoundMode)
   ;						{
   ;							case sdm_PC:
   ;								start = STARTPCSOUNDS;
   ;								break;
   ;							case sdm_AdLib:
   ;								start = STARTADLIBSOUNDS;
   ;								break;
   ;						}
   ;	
   ;						if (SoundMode != sdm_Off)
   ;							for (i=0;i<NUMSOUNDS;i++,start++)
   ;								if (audiosegs[start])
   ;									MM_SetPurge (&(memptr)audiosegs[start],3);		// make purgable
   ;					}
   ;					#endif
   ;	
   ;					MM_SortMem();
   ;	
	call	near ptr _MM_SortMem
   ;	
   ;					StartGame=1;
   ;	
	mov	word ptr DGROUP:_StartGame,1
   ;	
   ;					if (!ingame)
   ;	
	cmp	word ptr DGROUP:_ingame,0
	jne	short @1@626
   ;	
   ;						StartCPMusic(INTROSONG);
   ;	
	mov	ax,7
	push	ax
	call	near ptr _StartCPMusic
	pop	cx
@1@626:
   ;	
   ;					VL_FadeOut(0,255,0,0,0,10);
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;					break;
   ;	
	jmp	short @1@722
@1@650:
   ;	
   ;	
   ;				case -1:
   ;				case quit:
   ;					CP_Quit();
   ;	
	call	near ptr _CP_Quit
   ;	
   ;					break;
   ;	
	jmp	short @1@722
@1@674:
   ;	
   ;	
   ;				default:
   ;					if (!StartGame)
   ;	
	cmp	word ptr DGROUP:_StartGame,0
	jne	short @1@722
   ;	
   ;					{
   ;						DrawMainMenu();
   ;	
	call	near ptr _DrawMainMenu
   ;	
   ;						MenuFadeIn();
   ;	
	mov	ax,10
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
@1@722:
   ;	
   ;					}
   ;			}
   ;	
   ;		//
   ;		// "EXIT OPTIONS" OR "NEW GAME" EXITS
   ;		//
   ;		} while(!StartGame);
   ;	
	cmp	word ptr DGROUP:_StartGame,0
	jne	@@0
	jmp	@1@386
@@0:
   ;	
   ;	
   ;		//
   ;		// DEALLOCATE EVERYTHING
   ;		//
   ;		CleanupControlPanel();
   ;	
	call	near ptr _CleanupControlPanel
   ;	
   ;	
   ;		//
   ;		// CHANGE MAINMENU ITEM
   ;		//
   ;		if (startgame || loadedgame)
   ;	
	cmp	word ptr DGROUP:_startgame,0
	jne	short @1@794
	cmp	word ptr DGROUP:_loadedgame,0
	je	short @1@818
@1@794:
   ;	
   ;		{
   ;			#pragma warn -sus
   ;			MainMenu[viewscores].routine = NULL;
   ;	
	mov	ax,seg _MainMenu
	mov	es,ax
	mov	word ptr es:_MainMenu+278,0
   ;	
   ;			#ifndef JAPAN
   ;			_fstrcpy(MainMenu[viewscores].string,STR_EG);
   ;	
	mov	ax,offset DGROUP:s@+414
	push	ax
	mov	ax,seg _MainMenu
	push	ax
	mov	ax,offset _MainMenu+242
	push	ax
	call	near ptr __fstrcpy
	add	sp,6
@1@818:
   ;	
   ;			#endif
   ;			#pragma warn +sus
   ;		}
   ;	
   ;		// RETURN/START GAME EXECUTION
   ;	
   ;	#ifdef SPEAR
   ;		UnCacheLump (OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;		MM_SortMem ();
   ;	#endif
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_US_ControlPanel	endp
@1@C2946	label	word
	dw	@1@650
	dw	@1@674
	dw	@1@674
	dw	@1@674
	dw	@1@674
	dw	@1@674
	dw	@1@674
	dw	@1@482
	dw	@1@578
	dw	@1@650
@1@C2808	label	word
	dw	@1@194
	dw	@1@218
	dw	@1@242
	dw	@1@266
	dw	@1@290
	dw	@1@314
   ;	
   ;	void DrawMainMenu(void)
   ;	
	assume	cs:_TEXT
_DrawMainMenu	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	#ifdef JAPAN
   ;		CA_CacheScreen(S_OPTIONSPIC);
   ;	#else
   ;		ClearMScreen();
   ;	
	call	near ptr _ClearMScreen
   ;	
   ;	
   ;		VWB_DrawPic(112,184,C_MOUSELBACKPIC);
   ;	
	mov	ax,18
	push	ax
	mov	ax,184
	push	ax
	mov	ax,112
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		DrawStripes(10);
   ;	
	mov	ax,10
	push	ax
	call	near ptr _DrawStripes
	pop	cx
   ;	
   ;		VWB_DrawPic(84,0,C_OPTIONSPIC);
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,84
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;	
   ;		#ifdef SPANISH
   ;		DrawWindow(MENU_X-8,MENU_Y-3,MENU_W+8,MENU_H,BKGDCOLOR);
   ;		#else
   ;		DrawWindow(MENU_X-8,MENU_Y-3,MENU_W,MENU_H,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,136
	push	ax
	mov	ax,178
	push	ax
	mov	ax,52
	push	ax
	mov	ax,68
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;		#endif
   ;	#endif
   ;	
   ;		//
   ;		// CHANGE "GAME" AND "DEMO"
   ;		//
   ;		if (ingame)
   ;	
	cmp	word ptr DGROUP:_ingame,0
	je	short @2@74
   ;	
   ;		{
   ;			#ifndef JAPAN
   ;	
   ;			#ifdef SPANISH
   ;			_fstrcpy(&MainMenu[backtodemo].string,STR_GAME);
   ;			#else
   ;			_fstrcpy(&MainMenu[backtodemo].string[8],STR_GAME);
   ;	
	mov	ax,offset DGROUP:s@+423
	push	ax
	mov	ax,seg _MainMenu
	push	ax
	mov	ax,offset _MainMenu+290
	push	ax
	call	near ptr __fstrcpy
	add	sp,6
   ;	
   ;			#endif
   ;	
   ;			#else
   ;			CA_CacheGrChunk(C_MRETGAMEPIC);
   ;			VWB_DrawPic(12*8,20*8,C_MRETGAMEPIC);
   ;			UNCACHEGRCHUNK(C_MRETGAMEPIC);
   ;			CA_CacheGrChunk(C_MENDGAMEPIC);
   ;			VWB_DrawPic(12*8,18*8,C_MENDGAMEPIC);
   ;			UNCACHEGRCHUNK(C_MENDGAMEPIC);
   ;			#endif
   ;			MainMenu[backtodemo].active=2;
   ;	
	mov	ax,seg _MainMenu
	mov	es,ax
	mov	word ptr es:_MainMenu+280,2
   ;	
   ;		}
   ;	
	jmp	short @2@98
@2@74:
   ;	
   ;		else
   ;		{
   ;			#ifndef JAPAN
   ;			#ifdef SPANISH
   ;			_fstrcpy(&MainMenu[backtodemo].string,STR_BD);
   ;			#else
   ;			_fstrcpy(&MainMenu[backtodemo].string[8],STR_DEMO);
   ;	
	mov	ax,offset DGROUP:s@+428
	push	ax
	mov	ax,seg _MainMenu
	push	ax
	mov	ax,offset _MainMenu+290
	push	ax
	call	near ptr __fstrcpy
	add	sp,6
   ;	
   ;			#endif
   ;			#else
   ;			CA_CacheGrChunk(C_MRETDEMOPIC);
   ;			VWB_DrawPic(12*8,20*8,C_MRETDEMOPIC);
   ;			UNCACHEGRCHUNK(C_MRETDEMOPIC);
   ;			CA_CacheGrChunk(C_MSCORESPIC);
   ;			VWB_DrawPic(12*8,18*8,C_MSCORESPIC);
   ;			UNCACHEGRCHUNK(C_MSCORESPIC);
   ;			#endif
   ;			MainMenu[backtodemo].active=1;
   ;	
	mov	ax,seg _MainMenu
	mov	es,ax
	mov	word ptr es:_MainMenu+280,1
@2@98:
   ;	
   ;		}
   ;	
   ;		DrawMenu(&MainItems,&MainMenu[0]);
   ;	
	mov	ax,seg _MainMenu
	push	ax
	mov	ax,offset _MainMenu
	push	ax
	mov	ax,offset DGROUP:_MainItems
	push	ax
	call	near ptr _DrawMenu
	add	sp,6
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_DrawMainMenu	endp
   ;	
   ;	void BossKey(void)
   ;	
	assume	cs:_TEXT
_BossKey	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		SD_MusicOff();
   ;	
	call	near ptr _SD_MusicOff
   ;	
   ;		_AX = 3;
   ;	
	mov	ax,3
   ;	
   ;		geninterrupt(0x10);
   ;	
	int	16
   ;	
   ;		printf("C>");
   ;	
	mov	ax,offset DGROUP:s@+433
	push	ax
	call	near ptr _printf
	pop	cx
	jmp	short @3@74
@3@50:
   ;	
   ;		while (!Keyboard[sc_Escape])
   ;		IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
@3@74:
	cmp	word ptr DGROUP:_Keyboard+2,0
	je	short @3@50
   ;	
   ;	
   ;		SD_MusicOn();
   ;	
	call	near ptr _SD_MusicOn
   ;	
   ;		VL_SetVGAPlaneMode ();
   ;	
	call	near ptr _VL_SetVGAPlaneMode
   ;	
   ;		VL_TestPaletteSet ();
   ;	
	call	near ptr _VL_TestPaletteSet
   ;	
   ;		VL_SetPalette (&gamepal);
   ;	
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	call	near ptr _VL_SetPalette
	pop	cx
	pop	cx
   ;	
   ;		LoadLatchMem();
   ;	
	call	near ptr _LoadLatchMem
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_BossKey	endp
_TEXT	ends
_DATA	segment word public 'DATA'
	db	76
	db	111
	db	97
	db	100
	db	32
	db	71
	db	97
	db	109
	db	101
	db	32
	db	99
	db	97
	db	108
	db	108
	db	101
	db	100
	db	10
	db	34
	db	82 dup (0)
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	int CP_CheckQuick(unsigned scancode)
   ;	
	assume	cs:_TEXT
_CP_CheckQuick	proc	near
	push	bp
	mov	bp,sp
	sub	sp,102
   ;	
   ;	{
   ;		switch(scancode)
   ;	
	mov	bx,word ptr [bp+4]
	sub	bx,65
	cmp	bx,3
	jbe	@@1
	jmp	@4@986
@@1:
	shl	bx,1
	jmp	word ptr cs:@4@C3314[bx]
@4@98:
   ;	
   ;		{
   ;			//
   ;			// END GAME
   ;			//
   ;			case sc_F7:
   ;				CA_CacheGrChunk(STARTFONT+1);
   ;	
	mov	ax,2
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;	
   ;				WindowH=160;
   ;	
	mov	word ptr DGROUP:_WindowH,160
   ;	
   ;				#ifdef JAPAN
   ;				if (GetYorN(7,8,C_JAPQUITPIC))
   ;				#else
   ;				if (Confirm(ENDGAMESTR))
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+436
	push	ax
	call	near ptr _Confirm
	pop	cx
	pop	cx
	or	ax,ax
	je	short @4@146
   ;	
   ;				#endif
   ;				{
   ;					playstate = ex_died;
   ;	
	mov	word ptr DGROUP:_playstate,2
   ;	
   ;					pickquick = gamestate.lives = 0;
   ;	
	xor	ax,ax
	mov	word ptr DGROUP:_gamestate+16,ax
	mov	word ptr DGROUP:_pickquick,ax
@4@146:
   ;	
   ;				}
   ;	
   ;				DrawAllPlayBorder();
   ;	
	call	near ptr _DrawAllPlayBorder
   ;	
   ;				WindowH=200;
   ;	
	mov	word ptr DGROUP:_WindowH,200
   ;	
   ;				fontnumber=0;
   ;	
	mov	word ptr DGROUP:_fontnumber,0
   ;	
   ;				MainMenu[savegame].active = 0;
   ;	
	mov	ax,seg _MainMenu
	mov	es,ax
	mov	word ptr es:_MainMenu+160,0
   ;	
   ;				return 1;
   ;	
	mov	ax,1
	jmp	@4@1010
@4@170:
   ;	
   ;	
   ;			//
   ;			// QUICKSAVE
   ;			//
   ;			case sc_F8:
   ;				if (SaveGamesAvail[LSItems.curpos] && pickquick)
   ;	
	mov	bx,word ptr DGROUP:_LSItems+6
	shl	bx,1
	cmp	word ptr DGROUP:_SaveGamesAvail[bx],0
	je	short @4@242
	cmp	word ptr DGROUP:_pickquick,0
	je	short @4@242
   ;	
   ;				{
   ;					CA_CacheGrChunk(STARTFONT+1);
   ;	
	mov	ax,2
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;					fontnumber = 1;
   ;	
	mov	word ptr DGROUP:_fontnumber,1
   ;	
   ;					Message(STR_SAVING"...");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+501
	push	ax
	call	near ptr _Message
	pop	cx
	pop	cx
   ;	
   ;					CP_SaveGame(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _CP_SaveGame
	pop	cx
   ;	
   ;					fontnumber=0;
   ;	
	mov	word ptr DGROUP:_fontnumber,0
   ;	
   ;				}
   ;	
	jmp	@4@434
@4@242:
   ;	
   ;				else
   ;				{
   ;					#ifndef SPEAR
   ;					CA_CacheGrChunk(STARTFONT+1);
   ;	
	mov	ax,2
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;					CA_CacheGrChunk(C_CURSOR1PIC);
   ;	
	mov	ax,11
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;					CA_CacheGrChunk(C_CURSOR2PIC);
   ;	
	mov	ax,12
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;					CA_CacheGrChunk(C_DISKLOADING1PIC);
   ;	
	mov	ax,24
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;					CA_CacheGrChunk(C_DISKLOADING2PIC);
   ;	
	mov	ax,25
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;					CA_CacheGrChunk(C_SAVEGAMEPIC);
   ;	
	mov	ax,29
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;					CA_CacheGrChunk(C_MOUSELBACKPIC);
   ;	
	mov	ax,18
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;					#else
   ;					CacheLump (BACKDROP_LUMP_START,BACKDROP_LUMP_END);
   ;					CA_CacheGrChunk(C_CURSOR1PIC);
   ;					#endif
   ;	
   ;					VW_FadeOut ();
   ;	
	mov	ax,30
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	
   ;					StartCPMusic(MENUSONG);
   ;	
	mov	ax,14
	push	ax
	call	near ptr _StartCPMusic
	pop	cx
   ;	
   ;					pickquick=CP_SaveGame(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _CP_SaveGame
	pop	cx
	mov	word ptr DGROUP:_pickquick,ax
   ;	
   ;	
   ;					SETFONTCOLOR(0,15);
   ;	
	mov	byte ptr DGROUP:_fontcolor,0
	mov	byte ptr DGROUP:_backcolor,15
   ;	
   ;					IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;					DrawPlayScreen ();
   ;	
	call	near ptr _DrawPlayScreen
   ;	
   ;	
   ;					if (!startgame && !loadedgame)
   ;	
	cmp	word ptr DGROUP:_startgame,0
	jne	short @4@314
	cmp	word ptr DGROUP:_loadedgame,0
	jne	short @4@314
   ;	
   ;					{
   ;						VW_FadeIn ();
   ;	
	mov	ax,30
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
   ;	
   ;						StartMusic ();
   ;	
	call	near ptr _StartMusic
@4@314:
   ;	
   ;					}
   ;	
   ;					if (loadedgame)
   ;	
	cmp	word ptr DGROUP:_loadedgame,0
	je	short @4@362
   ;	
   ;						playstate = ex_abort;
   ;	
	mov	word ptr DGROUP:_playstate,7
@4@362:
   ;	
   ;					lasttimecount = TimeCount;
   ;	
	mov	ax,word ptr DGROUP:_TimeCount+2
	mov	dx,word ptr DGROUP:_TimeCount
	mov	word ptr DGROUP:_lasttimecount,dx
	mov	word ptr DGROUP:_lasttimecount+2,ax
   ;	
   ;	
   ;					if (MousePresent)
   ;	
	cmp	word ptr DGROUP:_MousePresent,0
	je	short @4@410
   ;	
   ;						Mouse(MDelta);	// Clear accumulated mouse movement
   ;	
	mov	ax,11
	int	51
@4@410:
   ;	
   ;	
   ;					PM_CheckMainMem ();
   ;	
	call	near ptr _PM_CheckMainMem
   ;	
   ;	
   ;					#ifndef SPEAR
   ;					UNCACHEGRCHUNK(C_CURSOR1PIC);
   ;	
	mov	ax,offset DGROUP:_grsegs+22
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded+11
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded+11,al
   ;	
   ;					UNCACHEGRCHUNK(C_CURSOR2PIC);
   ;	
	mov	ax,offset DGROUP:_grsegs+24
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded+12
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded+12,al
   ;	
   ;					UNCACHEGRCHUNK(C_DISKLOADING1PIC);
   ;	
	mov	ax,offset DGROUP:_grsegs+48
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded+24
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded+24,al
   ;	
   ;					UNCACHEGRCHUNK(C_DISKLOADING2PIC);
   ;	
	mov	ax,offset DGROUP:_grsegs+50
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded+25
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded+25,al
   ;	
   ;					UNCACHEGRCHUNK(C_SAVEGAMEPIC);
   ;	
	mov	ax,offset DGROUP:_grsegs+58
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded+29
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded+29,al
   ;	
   ;					UNCACHEGRCHUNK(C_MOUSELBACKPIC);
   ;	
	mov	ax,offset DGROUP:_grsegs+36
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded+18
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded+18,al
@4@434:
   ;	
   ;					#else
   ;					UnCacheLump (BACKDROP_LUMP_START,BACKDROP_LUMP_END);
   ;					#endif
   ;				}
   ;				return 1;
   ;	
	mov	ax,1
	jmp	@4@1010
@4@458:
   ;	
   ;	
   ;			//
   ;			// QUICKLOAD
   ;			//
   ;			case sc_F9:
   ;				if (SaveGamesAvail[LSItems.curpos] && pickquick)
   ;	
	mov	bx,word ptr DGROUP:_LSItems+6
	shl	bx,1
	cmp	word ptr DGROUP:_SaveGamesAvail[bx],0
	je	short @4@602
	cmp	word ptr DGROUP:_pickquick,0
	je	short @4@602
	push	ss
	lea	ax,word ptr [bp-102]
	push	ax
	push	ds
	mov	ax,offset DGROUP:d@+441
	push	ax
	mov	cx,100
	call	near ptr N_SCOPY@
   ;	
   ;				{
   ;					char string[100]=STR_LGC;
   ;	
   ;	
   ;					CA_CacheGrChunk(STARTFONT+1);
   ;	
	mov	ax,2
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;					fontnumber = 1;
   ;	
	mov	word ptr DGROUP:_fontnumber,1
   ;	
   ;	
   ;					strcat(string,SaveGameNames[LSItems.curpos]);
   ;	
	mov	ax,word ptr DGROUP:_LSItems+6
	mov	cl,5
	shl	ax,cl
	add	ax,offset DGROUP:_SaveGameNames
	push	ax
	lea	ax,word ptr [bp-102]
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;					strcat(string,"\"?");
   ;	
	mov	ax,offset DGROUP:s@+511
	push	ax
	lea	ax,word ptr [bp-102]
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;	
   ;					if (Confirm(string))
   ;	
	push	ss
	lea	ax,word ptr [bp-102]
	push	ax
	call	near ptr _Confirm
	pop	cx
	pop	cx
	or	ax,ax
	je	short @4@554
   ;	
   ;						CP_LoadGame(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _CP_LoadGame
	pop	cx
@4@554:
   ;	
   ;	
   ;					DrawAllPlayBorder();
   ;	
	call	near ptr _DrawAllPlayBorder
   ;	
   ;					fontnumber=0;
   ;	
	mov	word ptr DGROUP:_fontnumber,0
   ;	
   ;				}
   ;	
	jmp	@4@794
@4@602:
   ;	
   ;				else
   ;				{
   ;					#ifndef SPEAR
   ;					CA_CacheGrChunk(STARTFONT+1);
   ;	
	mov	ax,2
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;					CA_CacheGrChunk(C_CURSOR1PIC);
   ;	
	mov	ax,11
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;					CA_CacheGrChunk(C_CURSOR2PIC);
   ;	
	mov	ax,12
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;					CA_CacheGrChunk(C_DISKLOADING1PIC);
   ;	
	mov	ax,24
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;					CA_CacheGrChunk(C_DISKLOADING2PIC);
   ;	
	mov	ax,25
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;					CA_CacheGrChunk(C_LOADGAMEPIC);
   ;	
	mov	ax,28
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;					CA_CacheGrChunk(C_MOUSELBACKPIC);
   ;	
	mov	ax,18
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;					#else
   ;					CA_CacheGrChunk(C_CURSOR1PIC);
   ;					CacheLump (BACKDROP_LUMP_START,BACKDROP_LUMP_END);
   ;					#endif
   ;	
   ;					VW_FadeOut ();
   ;	
	mov	ax,30
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	
   ;					StartCPMusic(MENUSONG);
   ;	
	mov	ax,14
	push	ax
	call	near ptr _StartCPMusic
	pop	cx
   ;	
   ;					pickquick=CP_LoadGame(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _CP_LoadGame
	pop	cx
	mov	word ptr DGROUP:_pickquick,ax
   ;	
   ;	
   ;					SETFONTCOLOR(0,15);
   ;	
	mov	byte ptr DGROUP:_fontcolor,0
	mov	byte ptr DGROUP:_backcolor,15
   ;	
   ;					IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;					DrawPlayScreen ();
   ;	
	call	near ptr _DrawPlayScreen
   ;	
   ;	
   ;					if (!startgame && !loadedgame)
   ;	
	cmp	word ptr DGROUP:_startgame,0
	jne	short @4@674
	cmp	word ptr DGROUP:_loadedgame,0
	jne	short @4@674
   ;	
   ;					{
   ;						VW_FadeIn ();
   ;	
	mov	ax,30
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
   ;	
   ;						StartMusic ();
   ;	
	call	near ptr _StartMusic
@4@674:
   ;	
   ;					}
   ;	
   ;					if (loadedgame)
   ;	
	cmp	word ptr DGROUP:_loadedgame,0
	je	short @4@722
   ;	
   ;						playstate = ex_abort;
   ;	
	mov	word ptr DGROUP:_playstate,7
@4@722:
   ;	
   ;	
   ;					lasttimecount = TimeCount;
   ;	
	mov	ax,word ptr DGROUP:_TimeCount+2
	mov	dx,word ptr DGROUP:_TimeCount
	mov	word ptr DGROUP:_lasttimecount,dx
	mov	word ptr DGROUP:_lasttimecount+2,ax
   ;	
   ;	
   ;					if (MousePresent)
   ;	
	cmp	word ptr DGROUP:_MousePresent,0
	je	short @4@770
   ;	
   ;						Mouse(MDelta);	// Clear accumulated mouse movement
   ;	
	mov	ax,11
	int	51
@4@770:
   ;	
   ;					PM_CheckMainMem ();
   ;	
	call	near ptr _PM_CheckMainMem
   ;	
   ;	
   ;					#ifndef SPEAR
   ;					UNCACHEGRCHUNK(C_CURSOR1PIC);
   ;	
	mov	ax,offset DGROUP:_grsegs+22
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded+11
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded+11,al
   ;	
   ;					UNCACHEGRCHUNK(C_CURSOR2PIC);
   ;	
	mov	ax,offset DGROUP:_grsegs+24
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded+12
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded+12,al
   ;	
   ;					UNCACHEGRCHUNK(C_DISKLOADING1PIC);
   ;	
	mov	ax,offset DGROUP:_grsegs+48
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded+24
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded+24,al
   ;	
   ;					UNCACHEGRCHUNK(C_DISKLOADING2PIC);
   ;	
	mov	ax,offset DGROUP:_grsegs+50
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded+25
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded+25,al
   ;	
   ;					UNCACHEGRCHUNK(C_LOADGAMEPIC);
   ;	
	mov	ax,offset DGROUP:_grsegs+56
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded+28
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded+28,al
   ;	
   ;					UNCACHEGRCHUNK(C_MOUSELBACKPIC);
   ;	
	mov	ax,offset DGROUP:_grsegs+36
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded+18
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded+18,al
@4@794:
   ;	
   ;					#else
   ;					UnCacheLump (BACKDROP_LUMP_START,BACKDROP_LUMP_END);
   ;					#endif
   ;				}
   ;				return 1;
   ;	
	mov	ax,1
	jmp	@4@1010
@4@818:
   ;	
   ;	
   ;			//
   ;			// QUIT
   ;			//
   ;			case sc_F10:
   ;				CA_CacheGrChunk(STARTFONT+1);
   ;	
	mov	ax,2
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;	
   ;				WindowX=WindowY=0;
   ;	
	xor	ax,ax
	mov	word ptr DGROUP:_WindowY,ax
	mov	word ptr DGROUP:_WindowX,ax
   ;	
   ;				WindowW=320;
   ;	
	mov	word ptr DGROUP:_WindowW,320
   ;	
   ;				WindowH=160;
   ;	
	mov	word ptr DGROUP:_WindowH,160
   ;	
   ;				#ifdef JAPAN
   ;				if (GetYorN(7,8,C_QUITMSGPIC))
   ;				#else
   ;					#ifdef SPANISH
   ;				if (Confirm(ENDGAMESTR))
   ;					#else
   ;				if (Confirm(endStrings[US_RndT()&0x7+(US_RndT()&1)]))
   ;	
	call	near ptr _US_RndT
	push	ax
	call	near ptr _US_RndT
	and	ax,1
	add	ax,7
	mov	dx,ax
	pop	ax
	and	ax,dx
	mov	dx,80
	imul	dx
	mov	dx,seg _endStrings
	add	ax,offset _endStrings
	push	dx
	push	ax
	call	near ptr _Confirm
	pop	cx
	pop	cx
	or	ax,ax
	je	short @4@962
   ;	
   ;					#endif
   ;				#endif
   ;				{
   ;					int i;
   ;	
   ;	
   ;					VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;					SD_MusicOff();
   ;	
	call	near ptr _SD_MusicOff
   ;	
   ;					SD_StopSound();
   ;	
	call	near ptr _SD_StopSound
   ;	
   ;					MenuFadeOut();
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,43
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	
   ;					//
   ;					// SHUT-UP THE ADLIB
   ;					//
   ;					for (i=1;i<=0xf5;i++)
   ;	
	mov	word ptr [bp-2],1
	jmp	short @4@914
@4@866:
   ;	
   ;						alOut(i,0);
   ;	
	mov	al,0
	push	ax
	mov	al,byte ptr [bp-2]
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
	inc	word ptr [bp-2]
@4@914:
	cmp	word ptr [bp-2],245
	jle	short @4@866
   ;	
   ;					Quit(NULL);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _Quit
	pop	cx
@4@962:
   ;	
   ;				}
   ;	
   ;				DrawAllPlayBorder();
   ;	
	call	near ptr _DrawAllPlayBorder
   ;	
   ;				WindowH=200;
   ;	
	mov	word ptr DGROUP:_WindowH,200
   ;	
   ;				fontnumber=0;
   ;	
	mov	word ptr DGROUP:_fontnumber,0
   ;	
   ;				return 1;
   ;	
	mov	ax,1
	jmp	short @4@1010
@4@986:
   ;	
   ;			}
   ;	
   ;		return 0;
   ;	
	xor	ax,ax
	jmp	short @4@1010
@4@1010:
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_CP_CheckQuick	endp
@4@C3314	label	word
	dw	@4@98
	dw	@4@170
	dw	@4@458
	dw	@4@818
   ;	
   ;	int CP_EndGame(void)
   ;	
	assume	cs:_TEXT
_CP_EndGame	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	#ifdef JAPAN
   ;		if (!GetYorN(7,8,C_JAPQUITPIC))
   ;	#else
   ;		if (!Confirm(ENDGAMESTR))
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+514
	push	ax
	call	near ptr _Confirm
	pop	cx
	pop	cx
	or	ax,ax
	jne	short @5@74
   ;	
   ;	#endif
   ;			return 0;
   ;	
	xor	ax,ax
	jmp	short @5@98
@5@74:
   ;	
   ;	
   ;		pickquick = gamestate.lives = 0;
   ;	
	xor	ax,ax
	mov	word ptr DGROUP:_gamestate+16,ax
	mov	word ptr DGROUP:_pickquick,ax
   ;	
   ;		playstate = ex_died;
   ;	
	mov	word ptr DGROUP:_playstate,2
   ;	
   ;	
   ;		#pragma warn -sus
   ;		MainMenu[savegame].active = 0;
   ;	
	mov	ax,seg _MainMenu
	mov	es,ax
	mov	word ptr es:_MainMenu+160,0
   ;	
   ;		MainMenu[viewscores].routine=CP_ViewScores;
   ;	
	mov	ax,seg _MainMenu
	mov	es,ax
	mov	word ptr es:_MainMenu+278,offset _CP_ViewScores
   ;	
   ;		#ifndef JAPAN
   ;		_fstrcpy(MainMenu[viewscores].string,STR_VS);
   ;	
	mov	ax,offset DGROUP:s@+579
	push	ax
	mov	ax,seg _MainMenu
	push	ax
	mov	ax,offset _MainMenu+242
	push	ax
	call	near ptr __fstrcpy
	add	sp,6
   ;	
   ;		#endif
   ;		#pragma warn +sus
   ;	
   ;		return 1;
   ;	
	mov	ax,1
	jmp	short @5@98
@5@98:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_CP_EndGame	endp
   ;	
   ;	void CP_ViewScores(void)
   ;	
	assume	cs:_TEXT
_CP_ViewScores	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		fontnumber=0;
   ;	
	mov	word ptr DGROUP:_fontnumber,0
   ;	
   ;	
   ;	#ifdef SPEAR
   ;		UnCacheLump (OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;		StartCPMusic (XAWARD_MUS);
   ;	#else
   ;		StartCPMusic (ROSTER_MUS);
   ;	
	mov	ax,23
	push	ax
	call	near ptr _StartCPMusic
	pop	cx
   ;	
   ;	#endif
   ;	
   ;		DrawHighScores ();
   ;	
	call	near ptr _DrawHighScores
   ;	
   ;		VW_UpdateScreen ();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		MenuFadeIn();
   ;	
	mov	ax,10
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
   ;	
   ;		fontnumber=1;
   ;	
	mov	word ptr DGROUP:_fontnumber,1
   ;	
   ;	
   ;		IN_Ack();
   ;	
	call	near ptr _IN_Ack
   ;	
   ;	
   ;		StartCPMusic(MENUSONG);
   ;	
	mov	ax,14
	push	ax
	call	near ptr _StartCPMusic
	pop	cx
   ;	
   ;		MenuFadeOut();
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,43
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	
   ;	#ifdef SPEAR
   ;		CacheLump (BACKDROP_LUMP_START,BACKDROP_LUMP_END);
   ;		CacheLump (OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;	#endif
   ;	}
   ;	
	pop	bp
	ret	
_CP_ViewScores	endp
   ;	
   ;	void CP_NewGame(void)
   ;	
	assume	cs:_TEXT
_CP_NewGame	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
@7@26:
   ;	
   ;	{
   ;		int which,episode;
   ;	
   ;	#ifdef SPEAR
   ;		UnCacheLump (OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;	#endif
   ;	
   ;	
   ;	#ifndef SPEAR
   ;	firstpart:
   ;	
   ;		DrawNewEpisode();
   ;	
	call	near ptr _DrawNewEpisode
@7@50:
   ;	
   ;		do
   ;		{
   ;			which=HandleMenu(&NewEitems,&NewEmenu[0],NULL);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,seg _NewEmenu
	push	ax
	mov	ax,offset _NewEmenu
	push	ax
	mov	ax,offset DGROUP:_NewEitems
	push	ax
	call	near ptr _HandleMenu
	add	sp,8
	mov	si,ax
   ;	
   ;			switch(which)
   ;	
	mov	ax,si
	cmp	ax,65535
	je	short @7@146
	jmp	short @7@170
@7@146:
   ;	
   ;			{
   ;				case -1:
   ;					MenuFadeOut();
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,43
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;					return;
   ;	
	jmp	@7@434
@7@170:
   ;	
   ;	
   ;				default:
   ;					if (!EpisodeSelect[which/2])
   ;	
	mov	ax,si
	mov	bx,2
	cwd	
	idiv	bx
	shl	ax,1
	mov	bx,ax
	cmp	word ptr DGROUP:_EpisodeSelect[bx],0
	jne	short @7@218
   ;	
   ;					{
   ;						SD_PlaySound (NOWAYSND);
   ;	
	mov	ax,6
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;						Message("Please select \"Read This!\"\n"
   ;	
   ;	
   ;								"from the Options menu to\n"
   ;								"find out how to order this\n"
   ;								"episode from Apogee.");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+591
	push	ax
	call	near ptr _Message
	pop	cx
	pop	cx
   ;	
   ;						IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;						IN_Ack();
   ;	
	call	near ptr _IN_Ack
   ;	
   ;						DrawNewEpisode();
   ;	
	call	near ptr _DrawNewEpisode
   ;	
   ;						which = 0;
   ;	
	xor	si,si
   ;	
   ;					}
   ;	
	jmp	short @7@242
@7@218:
   ;	
   ;					else
   ;					{
   ;						episode = which/2;
   ;	
	mov	ax,si
	mov	bx,2
	cwd	
	idiv	bx
	mov	di,ax
   ;	
   ;						which = 1;
   ;	
	mov	si,1
@7@242:
   ;	
   ;					}
   ;					break;
   ;	
	jmp	short @7@266
@7@266:
   ;	
   ;			}
   ;	
   ;		} while (!which);
   ;	
	or	si,si
	jne	@@2
	jmp	@7@50
@@2:
   ;	
   ;	
   ;		ShootSnd();
   ;	
	call	near ptr _ShootSnd
   ;	
   ;	
   ;		//
   ;		// ALREADY IN A GAME?
   ;		//
   ;		if (ingame)
   ;	
	cmp	word ptr DGROUP:_ingame,0
	je	short @7@362
   ;	
   ;			#ifdef JAPAN
   ;			if (!GetYorN(7,8,C_JAPNEWGAMEPIC))
   ;			#else
   ;			if (!Confirm(CURGAME))
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+691
	push	ax
	call	near ptr _Confirm
	pop	cx
	pop	cx
	or	ax,ax
	jne	short @7@362
   ;	
   ;			#endif
   ;			{
   ;				MenuFadeOut();
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,43
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;				return;
   ;	
	jmp	@7@434
@7@362:
   ;	
   ;			}
   ;	
   ;		MenuFadeOut();
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,43
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	
   ;	#else
   ;		episode = 0;
   ;	
   ;		//
   ;		// ALREADY IN A GAME?
   ;		//
   ;		CacheLump (NEWGAME_LUMP_START,NEWGAME_LUMP_END);
   ;		DrawNewGame();
   ;		if (ingame)
   ;			if (!Confirm(CURGAME))
   ;			{
   ;				MenuFadeOut();
   ;				UnCacheLump (NEWGAME_LUMP_START,NEWGAME_LUMP_END);
   ;				CacheLump (OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;				return;
   ;			}
   ;	
   ;	#endif
   ;	
   ;		DrawNewGame();
   ;	
	call	near ptr _DrawNewGame
   ;	
   ;		which=HandleMenu(&NewItems,&NewMenu[0],DrawNewGameDiff);
   ;	
	mov	ax,offset _DrawNewGameDiff
	push	ax
	mov	ax,seg _NewMenu
	push	ax
	mov	ax,offset _NewMenu
	push	ax
	mov	ax,offset DGROUP:_NewItems
	push	ax
	call	near ptr _HandleMenu
	add	sp,8
	mov	si,ax
   ;	
   ;		if (which<0)
   ;	
	or	si,si
	jge	short @7@410
   ;	
   ;		{
   ;			MenuFadeOut();
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,43
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;			#ifndef SPEAR
   ;			goto firstpart;
   ;	
	jmp	@7@26
@7@410:
   ;	
   ;			#else
   ;			UnCacheLump (NEWGAME_LUMP_START,NEWGAME_LUMP_END);
   ;			CacheLump (OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;			return;
   ;			#endif
   ;		}
   ;	
   ;		ShootSnd();
   ;	
	call	near ptr _ShootSnd
   ;	
   ;		NewGame(which,episode);
   ;	
	push	di
	push	si
	call	near ptr _NewGame
	pop	cx
	pop	cx
   ;	
   ;		StartGame=1;
   ;	
	mov	word ptr DGROUP:_StartGame,1
   ;	
   ;		MenuFadeOut();
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,43
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	
   ;		//
   ;		// CHANGE "READ THIS!" TO NORMAL COLOR
   ;		//
   ;		#ifndef SPEAR
   ;		#ifndef GOODTIMES
   ;		MainMenu[readthis].active=1;
   ;		#endif
   ;		#endif
   ;	
   ;		pickquick = 0;
   ;	
	mov	word ptr DGROUP:_pickquick,0
@7@434:
   ;	
   ;	
   ;	#ifdef SPEAR
   ;		UnCacheLump (NEWGAME_LUMP_START,NEWGAME_LUMP_END);
   ;		CacheLump (OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;	#endif
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_CP_NewGame	endp
   ;	
   ;	void DrawNewEpisode(void)
   ;	
	assume	cs:_TEXT
_DrawNewEpisode	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int i;
   ;	
   ;	#ifdef JAPAN
   ;		CA_CacheScreen(S_EPISODEPIC);
   ;	#else
   ;		ClearMScreen();
   ;	
	call	near ptr _ClearMScreen
   ;	
   ;		VWB_DrawPic(112,184,C_MOUSELBACKPIC);
   ;	
	mov	ax,18
	push	ax
	mov	ax,184
	push	ax
	mov	ax,112
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;	
   ;		DrawWindow(NE_X-4,NE_Y-4,NE_W+8,NE_H+8,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,162
	push	ax
	mov	ax,308
	push	ax
	mov	ax,19
	push	ax
	mov	ax,6
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;		SETFONTCOLOR(READHCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,71
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;		PrintY=2;
   ;	
	mov	word ptr DGROUP:_PrintY,2
   ;	
   ;		WindowX=0;
   ;	
	mov	word ptr DGROUP:_WindowX,0
   ;	
   ;		#ifdef SPANISH
   ;		US_CPrint("Cual episodio jugar?");
   ;		#else
   ;		US_CPrint("Which episode to play?");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+756
	push	ax
	call	near ptr _US_CPrint
	pop	cx
	pop	cx
   ;	
   ;		#endif
   ;	#endif
   ;	
   ;		SETFONTCOLOR(TEXTCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,23
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;		DrawMenu(&NewEitems,&NewEmenu[0]);
   ;	
	mov	ax,seg _NewEmenu
	push	ax
	mov	ax,offset _NewEmenu
	push	ax
	mov	ax,offset DGROUP:_NewEitems
	push	ax
	call	near ptr _DrawMenu
	add	sp,6
   ;	
   ;	
   ;		for (i=0;i<6;i++)
   ;	
	xor	si,si
	jmp	short @8@98
@8@50:
   ;	
   ;			VWB_DrawPic(NE_X+32,NE_Y+i*26,C_EPISODE1PIC+i);
   ;	
	mov	ax,si
	add	ax,30
	push	ax
	mov	ax,si
	mov	dx,26
	imul	dx
	add	ax,23
	push	ax
	mov	ax,42
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
	inc	si
@8@98:
	cmp	si,6
	jl	short @8@50
   ;	
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		MenuFadeIn();
   ;	
	mov	ax,10
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
   ;	
   ;		WaitKeyUp();
   ;	
	call	near ptr _WaitKeyUp
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_DrawNewEpisode	endp
   ;	
   ;	void DrawNewGame(void)
   ;	
	assume	cs:_TEXT
_DrawNewGame	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	#ifdef JAPAN
   ;		CA_CacheScreen(S_SKILLPIC);
   ;	#else
   ;		ClearMScreen();
   ;	
	call	near ptr _ClearMScreen
   ;	
   ;		VWB_DrawPic(112,184,C_MOUSELBACKPIC);
   ;	
	mov	ax,18
	push	ax
	mov	ax,184
	push	ax
	mov	ax,112
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;	
   ;		SETFONTCOLOR(READHCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,71
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;		PrintX=NM_X+20;
   ;	
	mov	word ptr DGROUP:_PrintX,70
   ;	
   ;		PrintY=NM_Y-32;
   ;	
	mov	word ptr DGROUP:_PrintY,68
   ;	
   ;	
   ;	#ifndef SPEAR
   ;		#ifdef SPANISH
   ;		US_Print("Eres macho?");
   ;		#else
   ;		US_Print("How tough are you?");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+779
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		#endif
   ;	#else
   ;		VWB_DrawPic (PrintX,PrintY,C_HOWTOUGHPIC);
   ;	#endif
   ;	
   ;		DrawWindow(NM_X-5,NM_Y-10,NM_W,NM_H,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,67
	push	ax
	mov	ax,225
	push	ax
	mov	ax,90
	push	ax
	mov	ax,45
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;	#endif
   ;	
   ;		DrawMenu(&NewItems,&NewMenu[0]);
   ;	
	mov	ax,seg _NewMenu
	push	ax
	mov	ax,offset _NewMenu
	push	ax
	mov	ax,offset DGROUP:_NewItems
	push	ax
	call	near ptr _DrawMenu
	add	sp,6
   ;	
   ;		DrawNewGameDiff(NewItems.curpos);
   ;	
	push	word ptr DGROUP:_NewItems+6
	call	near ptr _DrawNewGameDiff
	pop	cx
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		MenuFadeIn();
   ;	
	mov	ax,10
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
   ;	
   ;		WaitKeyUp();
   ;	
	call	near ptr _WaitKeyUp
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_DrawNewGame	endp
   ;	
   ;	void DrawNewGameDiff(int w)
   ;	
	assume	cs:_TEXT
_DrawNewGameDiff	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		VWB_DrawPic(NM_X+185,NM_Y+7,w+C_BABYMODEPIC);
   ;	
	mov	ax,word ptr [bp+4]
	add	ax,19
	push	ax
	mov	ax,107
	push	ax
	mov	ax,235
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_DrawNewGameDiff	endp
   ;	
   ;	void CP_Sound(void)
   ;	
	assume	cs:_TEXT
_CP_Sound	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int which,i;
   ;	
   ;	
   ;	#ifdef SPEAR
   ;		UnCacheLump (OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;		CacheLump (SOUND_LUMP_START,SOUND_LUMP_END);
   ;	#endif
   ;	
   ;		DrawSoundMenu();
   ;	
	call	near ptr _DrawSoundMenu
   ;	
   ;		MenuFadeIn();
   ;	
	mov	ax,10
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
   ;	
   ;		WaitKeyUp();
   ;	
	call	near ptr _WaitKeyUp
@11@50:
   ;	
   ;	
   ;		do
   ;		{
   ;			which=HandleMenu(&SndItems,&SndMenu[0],NULL);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,seg _SndMenu
	push	ax
	mov	ax,offset _SndMenu
	push	ax
	mov	ax,offset DGROUP:_SndItems
	push	ax
	call	near ptr _HandleMenu
	add	sp,8
	mov	si,ax
   ;	
   ;			//
   ;			// HANDLE MENU CHOICES
   ;			//
   ;			switch(which)
   ;	
	mov	bx,si
	cmp	bx,11
	jbe	@@3
	jmp	@11@722
@@3:
	shl	bx,1
	jmp	word ptr cs:@11@C2578[bx]
@11@146:
   ;	
   ;			{
   ;				//
   ;				// SOUND EFFECTS
   ;				//
   ;				case 0:
   ;					if (SoundMode!=sdm_Off)
   ;	
	cmp	word ptr DGROUP:_SoundMode,0
	je	short @11@194
   ;	
   ;					{
   ;						SD_WaitSoundDone();
   ;	
	call	near ptr _SD_WaitSoundDone
   ;	
   ;						SD_SetSoundMode(sdm_Off);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _SD_SetSoundMode
	pop	cx
   ;	
   ;						DrawSoundMenu();
   ;	
	call	near ptr _DrawSoundMenu
@11@194:
   ;	
   ;					}
   ;					break;
   ;	
	jmp	@11@722
@11@218:
   ;	
   ;				case 1:
   ;					if (SoundMode!=sdm_PC)
   ;	
	cmp	word ptr DGROUP:_SoundMode,1
	je	short @11@266
   ;	
   ;					{
   ;						SD_WaitSoundDone();
   ;	
	call	near ptr _SD_WaitSoundDone
   ;	
   ;						SD_SetSoundMode(sdm_PC);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _SD_SetSoundMode
	pop	cx
   ;	
   ;						CA_LoadAllSounds();
   ;	
	call	near ptr _CA_LoadAllSounds
   ;	
   ;						DrawSoundMenu();
   ;	
	call	near ptr _DrawSoundMenu
   ;	
   ;						ShootSnd();
   ;	
	call	near ptr _ShootSnd
@11@266:
   ;	
   ;					}
   ;					break;
   ;	
	jmp	@11@722
@11@290:
   ;	
   ;				case 2:
   ;					if (SoundMode!=sdm_AdLib)
   ;	
	cmp	word ptr DGROUP:_SoundMode,2
	je	short @11@338
   ;	
   ;					{
   ;						SD_WaitSoundDone();
   ;	
	call	near ptr _SD_WaitSoundDone
   ;	
   ;						SD_SetSoundMode(sdm_AdLib);
   ;	
	mov	ax,2
	push	ax
	call	near ptr _SD_SetSoundMode
	pop	cx
   ;	
   ;						CA_LoadAllSounds();
   ;	
	call	near ptr _CA_LoadAllSounds
   ;	
   ;						DrawSoundMenu();
   ;	
	call	near ptr _DrawSoundMenu
   ;	
   ;						ShootSnd();
   ;	
	call	near ptr _ShootSnd
@11@338:
   ;	
   ;					}
   ;					break;
   ;	
	jmp	short @11@722
@11@362:
   ;	
   ;	
   ;				//
   ;				// DIGITIZED SOUND
   ;				//
   ;				case 5:
   ;					if (DigiMode!=sds_Off)
   ;	
	cmp	word ptr DGROUP:_DigiMode,0
	je	short @11@410
   ;	
   ;					{
   ;						SD_SetDigiDevice(sds_Off);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _SD_SetDigiDevice
	pop	cx
   ;	
   ;						DrawSoundMenu();
   ;	
	call	near ptr _DrawSoundMenu
@11@410:
   ;	
   ;					}
   ;					break;
   ;	
	jmp	short @11@722
@11@434:
   ;	
   ;				case 6:
   ;					if (DigiMode!=sds_SoundSource)
   ;	
	cmp	word ptr DGROUP:_DigiMode,2
	je	short @11@482
   ;	
   ;					{
   ;						SD_SetDigiDevice(sds_SoundSource);
   ;	
	mov	ax,2
	push	ax
	call	near ptr _SD_SetDigiDevice
	pop	cx
   ;	
   ;						DrawSoundMenu();
   ;	
	call	near ptr _DrawSoundMenu
   ;	
   ;						ShootSnd();
   ;	
	call	near ptr _ShootSnd
@11@482:
   ;	
   ;					}
   ;					break;
   ;	
	jmp	short @11@722
@11@506:
   ;	
   ;				case 7:
   ;					if (DigiMode!=sds_SoundBlaster)
   ;	
	cmp	word ptr DGROUP:_DigiMode,3
	je	short @11@554
   ;	
   ;					{
   ;						SD_SetDigiDevice(sds_SoundBlaster);
   ;	
	mov	ax,3
	push	ax
	call	near ptr _SD_SetDigiDevice
	pop	cx
   ;	
   ;						DrawSoundMenu();
   ;	
	call	near ptr _DrawSoundMenu
   ;	
   ;						ShootSnd();
   ;	
	call	near ptr _ShootSnd
@11@554:
   ;	
   ;					}
   ;					break;
   ;	
	jmp	short @11@722
@11@578:
   ;	
   ;	
   ;				//
   ;				// MUSIC
   ;				//
   ;				case 10:
   ;					if (MusicMode!=smm_Off)
   ;	
	cmp	word ptr DGROUP:_MusicMode,0
	je	short @11@626
   ;	
   ;					{
   ;						SD_SetMusicMode(smm_Off);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _SD_SetMusicMode
	pop	cx
   ;	
   ;						DrawSoundMenu();
   ;	
	call	near ptr _DrawSoundMenu
   ;	
   ;						ShootSnd();
   ;	
	call	near ptr _ShootSnd
@11@626:
   ;	
   ;					}
   ;					break;
   ;	
	jmp	short @11@722
@11@650:
   ;	
   ;				case 11:
   ;					if (MusicMode!=smm_AdLib)
   ;	
	cmp	word ptr DGROUP:_MusicMode,1
	je	short @11@698
   ;	
   ;					{
   ;						SD_SetMusicMode(smm_AdLib);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _SD_SetMusicMode
	pop	cx
   ;	
   ;						DrawSoundMenu();
   ;	
	call	near ptr _DrawSoundMenu
   ;	
   ;						ShootSnd();
   ;	
	call	near ptr _ShootSnd
   ;	
   ;						StartCPMusic(MENUSONG);
   ;	
	mov	ax,14
	push	ax
	call	near ptr _StartCPMusic
	pop	cx
@11@698:
   ;	
   ;					}
   ;					break;
   ;	
	jmp	short @11@722
@11@722:
   ;	
   ;			}
   ;		} while(which>=0);
   ;	
	or	si,si
	jl	@@4
	jmp	@11@50
@@4:
   ;	
   ;	
   ;		MenuFadeOut();
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,43
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	
   ;	#ifdef SPEAR
   ;		UnCacheLump (SOUND_LUMP_START,SOUND_LUMP_END);
   ;		CacheLump (OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;	#endif
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_CP_Sound	endp
@11@C2578	label	word
	dw	@11@146
	dw	@11@218
	dw	@11@290
	dw	@11@722
	dw	@11@722
	dw	@11@362
	dw	@11@434
	dw	@11@506
	dw	@11@722
	dw	@11@722
	dw	@11@578
	dw	@11@650
   ;	
   ;	void DrawSoundMenu(void)
   ;	
	assume	cs:_TEXT
_DrawSoundMenu	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		int i,on;
   ;	
   ;	
   ;	#ifdef JAPAN
   ;		CA_CacheScreen(S_SOUNDPIC);
   ;	#else
   ;		//
   ;		// DRAW SOUND MENU
   ;		//
   ;		ClearMScreen();
   ;	
	call	near ptr _ClearMScreen
   ;	
   ;		VWB_DrawPic(112,184,C_MOUSELBACKPIC);
   ;	
	mov	ax,18
	push	ax
	mov	ax,184
	push	ax
	mov	ax,112
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;	
   ;		DrawWindow(SM_X-8,SM_Y1-3,SM_W,SM_H1,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,45
	push	ax
	mov	ax,250
	push	ax
	mov	ax,17
	push	ax
	mov	ax,40
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;		DrawWindow(SM_X-8,SM_Y2-3,SM_W,SM_H2,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,45
	push	ax
	mov	ax,250
	push	ax
	mov	ax,82
	push	ax
	mov	ax,40
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;		DrawWindow(SM_X-8,SM_Y3-3,SM_W,SM_H3,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,32
	push	ax
	mov	ax,250
	push	ax
	mov	ax,147
	push	ax
	mov	ax,40
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;	#endif
   ;	
   ;		//
   ;		// IF NO ADLIB, NON-CHOOSENESS!
   ;		//
   ;		if (!AdLibPresent && !SoundBlasterPresent)
   ;	
	cmp	word ptr DGROUP:_AdLibPresent,0
	jne	short @12@98
	cmp	word ptr DGROUP:_SoundBlasterPresent,0
	jne	short @12@98
   ;	
   ;		{
   ;			SndMenu[2].active=SndMenu[10].active=SndMenu[11].active=0;
   ;	
	mov	ax,seg _SndMenu
	xor	dx,dx
	mov	es,ax
	mov	word ptr es:_SndMenu+440,dx
	mov	ax,dx
	mov	dx,seg _SndMenu
	mov	es,dx
	mov	word ptr es:_SndMenu+400,ax
	mov	dx,seg _SndMenu
	mov	es,dx
	mov	word ptr es:_SndMenu+80,ax
@12@98:
   ;	
   ;		}
   ;	
   ;		if (!SoundSourcePresent)
   ;	
	cmp	word ptr DGROUP:_SoundSourcePresent,0
	jne	short @12@146
   ;	
   ;			SndMenu[6].active=0;
   ;	
	mov	ax,seg _SndMenu
	mov	es,ax
	mov	word ptr es:_SndMenu+240,0
@12@146:
   ;	
   ;	
   ;		if (!SoundBlasterPresent)
   ;	
	cmp	word ptr DGROUP:_SoundBlasterPresent,0
	jne	short @12@194
   ;	
   ;			SndMenu[7].active=0;
   ;	
	mov	ax,seg _SndMenu
	mov	es,ax
	mov	word ptr es:_SndMenu+280,0
@12@194:
   ;	
   ;	
   ;		if (!SoundSourcePresent && !SoundBlasterPresent)
   ;	
	cmp	word ptr DGROUP:_SoundSourcePresent,0
	jne	short @12@266
	cmp	word ptr DGROUP:_SoundBlasterPresent,0
	jne	short @12@266
   ;	
   ;			SndMenu[5].active=0;
   ;	
	mov	ax,seg _SndMenu
	mov	es,ax
	mov	word ptr es:_SndMenu+200,0
@12@266:
   ;	
   ;	
   ;		DrawMenu(&SndItems,&SndMenu[0]);
   ;	
	mov	ax,seg _SndMenu
	push	ax
	mov	ax,offset _SndMenu
	push	ax
	mov	ax,offset DGROUP:_SndItems
	push	ax
	call	near ptr _DrawMenu
	add	sp,6
   ;	
   ;	#ifndef JAPAN
   ;		VWB_DrawPic(100,SM_Y1-20,C_FXTITLEPIC);
   ;	
	mov	ax,15
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,100
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		VWB_DrawPic(100,SM_Y2-20,C_DIGITITLEPIC);
   ;	
	mov	ax,16
	push	ax
	mov	ax,65
	push	ax
	mov	ax,100
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		VWB_DrawPic(100,SM_Y3-20,C_MUSICTITLEPIC);
   ;	
	mov	ax,17
	push	ax
	mov	ax,130
	push	ax
	mov	ax,100
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;	#endif
   ;	
   ;		for (i=0;i<SndItems.amount;i++)
   ;	
	xor	di,di
	jmp	@12@1082
@12@290:
   ;	
   ;	#ifdef JAPAN
   ;			if (i!=3 && i!=4 && i!=8 && i!=9)
   ;	#else
   ;			if (SndMenu[i].string[0])
   ;	
	mov	ax,di
	mov	dx,40
	imul	dx
	mov	dx,seg _SndMenu
	mov	bx,ax
	mov	es,dx
	cmp	byte ptr es:_SndMenu[bx+2],0
	jne	@@5
	jmp	@12@1058
@@5:
   ;	
   ;	#endif
   ;			{
   ;				//
   ;				// DRAW SELECTED/NOT SELECTED GRAPHIC BUTTONS
   ;				//
   ;				on=0;
   ;	
	xor	si,si
   ;	
   ;				switch(i)
   ;	
	mov	bx,di
	cmp	bx,11
	ja	short @12@986
	shl	bx,1
	jmp	word ptr cs:@12@C3636[bx]
@12@410:
   ;	
   ;				{
   ;					//
   ;					// SOUND EFFECTS
   ;					//
   ;					case 0: if (SoundMode==sdm_Off) on=1; break;
   ;	
	cmp	word ptr DGROUP:_SoundMode,0
	jne	short @12@458
	mov	si,1
@12@458:
	jmp	short @12@986
@12@482:
   ;	
   ;					case 1: if (SoundMode==sdm_PC) on=1; break;
   ;	
	cmp	word ptr DGROUP:_SoundMode,1
	jne	short @12@530
	mov	si,1
@12@530:
	jmp	short @12@986
@12@554:
   ;	
   ;					case 2: if (SoundMode==sdm_AdLib) on=1; break;
   ;	
	cmp	word ptr DGROUP:_SoundMode,2
	jne	short @12@602
	mov	si,1
@12@602:
	jmp	short @12@986
@12@626:
   ;	
   ;	
   ;					//
   ;					// DIGITIZED SOUND
   ;					//
   ;					case 5: if (DigiMode==sds_Off) on=1; break;
   ;	
	cmp	word ptr DGROUP:_DigiMode,0
	jne	short @12@674
	mov	si,1
@12@674:
	jmp	short @12@986
@12@698:
   ;	
   ;					case 6: if (DigiMode==sds_SoundSource) on=1; break;
   ;	
	cmp	word ptr DGROUP:_DigiMode,2
	jne	short @12@746
	mov	si,1
@12@746:
	jmp	short @12@986
@12@770:
   ;	
   ;					case 7: if (DigiMode==sds_SoundBlaster) on=1; break;
   ;	
	cmp	word ptr DGROUP:_DigiMode,3
	jne	short @12@818
	mov	si,1
@12@818:
	jmp	short @12@986
@12@842:
   ;	
   ;	
   ;					//
   ;					// MUSIC
   ;					//
   ;					case 10: if (MusicMode==smm_Off) on=1; break;
   ;	
	cmp	word ptr DGROUP:_MusicMode,0
	jne	short @12@890
	mov	si,1
@12@890:
	jmp	short @12@986
@12@914:
   ;	
   ;					case 11: if (MusicMode==smm_AdLib) on=1; break;
   ;	
	cmp	word ptr DGROUP:_MusicMode,1
	jne	short @12@962
	mov	si,1
@12@962:
	jmp	short @12@986
@12@986:
   ;	
   ;				}
   ;	
   ;				if (on)
   ;	
	or	si,si
	je	short @12@1034
   ;	
   ;					VWB_DrawPic(SM_X+24,SM_Y1+i*13+2,C_SELECTEDPIC);
   ;	
	mov	ax,14
	push	ax
	mov	ax,di
	mov	dx,13
	imul	dx
	add	ax,22
	push	ax
	mov	ax,72
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
	jmp	short @12@1058
@12@1034:
   ;	
   ;				else
   ;					VWB_DrawPic(SM_X+24,SM_Y1+i*13+2,C_NOTSELECTEDPIC);
   ;	
	mov	ax,13
	push	ax
	mov	ax,di
	mov	dx,13
	imul	dx
	add	ax,22
	push	ax
	mov	ax,72
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
@12@1058:
	inc	di
@12@1082:
	cmp	di,word ptr DGROUP:_SndItems+4
	jge	@@6
	jmp	@12@290
@@6:
   ;	
   ;			}
   ;	
   ;		DrawMenuGun(&SndItems);
   ;	
	mov	ax,offset DGROUP:_SndItems
	push	ax
	call	near ptr _DrawMenuGun
	pop	cx
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_DrawSoundMenu	endp
@12@C3636	label	word
	dw	@12@410
	dw	@12@482
	dw	@12@554
	dw	@12@986
	dw	@12@986
	dw	@12@626
	dw	@12@698
	dw	@12@770
	dw	@12@986
	dw	@12@986
	dw	@12@842
	dw	@12@914
   ;	
   ;	void DrawLSAction(int which)
   ;	
	assume	cs:_TEXT
_DrawLSAction	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		#define LSA_X	96
   ;		#define LSA_Y	80
   ;		#define LSA_W	130
   ;		#define LSA_H	42
   ;	
   ;		DrawWindow(LSA_X,LSA_Y,LSA_W,LSA_H,TEXTCOLOR);
   ;	
	mov	ax,23
	push	ax
	mov	ax,42
	push	ax
	mov	ax,130
	push	ax
	mov	ax,80
	push	ax
	mov	ax,96
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;		DrawOutline(LSA_X,LSA_Y,LSA_W,LSA_H,0,HIGHLIGHT);
   ;	
	mov	ax,19
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,42
	push	ax
	mov	ax,130
	push	ax
	mov	ax,80
	push	ax
	mov	ax,96
	push	ax
	call	near ptr _DrawOutline
	add	sp,12
   ;	
   ;		VWB_DrawPic(LSA_X+8,LSA_Y+5,C_DISKLOADING1PIC);
   ;	
	mov	ax,24
	push	ax
	mov	ax,85
	push	ax
	mov	ax,104
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;	
   ;		fontnumber=1;
   ;	
	mov	word ptr DGROUP:_fontnumber,1
   ;	
   ;		SETFONTCOLOR(0,TEXTCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,0
	mov	byte ptr DGROUP:_backcolor,23
   ;	
   ;		PrintX=LSA_X+46;
   ;	
	mov	word ptr DGROUP:_PrintX,142
   ;	
   ;		PrintY=LSA_Y+13;
   ;	
	mov	word ptr DGROUP:_PrintY,93
   ;	
   ;	
   ;		if (!which)
   ;	
	cmp	word ptr [bp+4],0
	jne	short @13@74
   ;	
   ;			US_Print(STR_LOADING"...");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+798
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
	jmp	short @13@98
@13@74:
   ;	
   ;		else
   ;			US_Print(STR_SAVING"...");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+809
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
@13@98:
   ;	
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_DrawLSAction	endp
   ;	
   ;	int CP_LoadGame(int quick)
   ;	
	assume	cs:_TEXT
_CP_LoadGame	proc	near
	push	bp
	mov	bp,sp
	sub	sp,16
	push	si
	push	di
   ;	
   ;	{
   ;		int handle,which,exit=0;
   ;	
	xor	di,di
   ;	
   ;		char name[13];
   ;	
   ;	
   ;		strcpy(name,SaveName);
   ;	
	mov	ax,offset DGROUP:_SaveName
	push	ax
	lea	ax,word ptr [bp-16]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;	
   ;		//
   ;		// QUICKLOAD?
   ;		//
   ;		if (quick)
   ;	
	cmp	word ptr [bp+4],0
	je	short @14@98
   ;	
   ;		{
   ;			which=LSItems.curpos;
   ;	
	mov	ax,word ptr DGROUP:_LSItems+6
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;			if (SaveGamesAvail[which])
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	cmp	word ptr DGROUP:_SaveGamesAvail[bx],0
	je	short @14@98
   ;	
   ;			{
   ;				name[7]=which+'0';
   ;	
	mov	al,byte ptr [bp-2]
	add	al,48
	mov	byte ptr [bp-9],al
   ;	
   ;				handle=open(name,O_BINARY);
   ;	
	mov	ax,32768
	push	ax
	lea	ax,word ptr [bp-16]
	push	ax
	call	near ptr _open
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;				lseek(handle,32,SEEK_SET);
   ;	
	xor	ax,ax
	push	ax
	xor	ax,ax
	mov	dx,32
	push	ax
	push	dx
	push	si
	call	near ptr _lseek
	add	sp,8
   ;	
   ;				loadedgame=true;
   ;	
	mov	word ptr DGROUP:_loadedgame,1
   ;	
   ;				LoadTheGame(handle,0,0);
   ;	
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	push	si
	call	near ptr _LoadTheGame
	add	sp,6
   ;	
   ;				loadedgame=false;
   ;	
	mov	word ptr DGROUP:_loadedgame,0
   ;	
   ;				close(handle);
   ;	
	push	si
	call	near ptr _close
	pop	cx
   ;	
   ;	
   ;				DrawFace ();
   ;	
	call	near ptr _DrawFace
   ;	
   ;				DrawHealth ();
   ;	
	call	near ptr _DrawHealth
   ;	
   ;				DrawLives ();
   ;	
	call	near ptr _DrawLives
   ;	
   ;				DrawLevel ();
   ;	
	call	near ptr _DrawLevel
   ;	
   ;				DrawAmmo ();
   ;	
	call	near ptr _DrawAmmo
   ;	
   ;				DrawKeys ();
   ;	
	call	near ptr _DrawKeys
   ;	
   ;				DrawWeapon ();
   ;	
	call	near ptr _DrawWeapon
   ;	
   ;				DrawScore ();
   ;	
	call	near ptr _DrawScore
   ;	
   ;				return 1;
   ;	
	mov	ax,1
	jmp	@14@242
@14@98:
   ;	
   ;			}
   ;		}
   ;	
   ;	
   ;	#ifdef SPEAR
   ;		UnCacheLump (OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;		CacheLump (LOADSAVE_LUMP_START,LOADSAVE_LUMP_END);
   ;	#endif
   ;	
   ;		DrawLoadSaveScreen(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _DrawLoadSaveScreen
	pop	cx
@14@122:
   ;	
   ;	
   ;		do
   ;		{
   ;			which=HandleMenu(&LSItems,&LSMenu[0],TrackWhichGame);
   ;	
	mov	ax,offset _TrackWhichGame
	push	ax
	mov	ax,seg _LSMenu
	push	ax
	mov	ax,offset _LSMenu
	push	ax
	mov	ax,offset DGROUP:_LSItems
	push	ax
	call	near ptr _HandleMenu
	add	sp,8
	mov	word ptr [bp-2],ax
   ;	
   ;			if (which>=0 && SaveGamesAvail[which])
   ;	
	cmp	word ptr [bp-2],0
	jl	short @14@194
	mov	bx,word ptr [bp-2]
	shl	bx,1
	cmp	word ptr DGROUP:_SaveGamesAvail[bx],0
	je	short @14@194
   ;	
   ;			{
   ;				ShootSnd();
   ;	
	call	near ptr _ShootSnd
   ;	
   ;				name[7]=which+'0';
   ;	
	mov	al,byte ptr [bp-2]
	add	al,48
	mov	byte ptr [bp-9],al
   ;	
   ;	
   ;				handle=open(name,O_BINARY);
   ;	
	mov	ax,32768
	push	ax
	lea	ax,word ptr [bp-16]
	push	ax
	call	near ptr _open
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;				lseek(handle,32,SEEK_SET);
   ;	
	xor	ax,ax
	push	ax
	xor	ax,ax
	mov	dx,32
	push	ax
	push	dx
	push	si
	call	near ptr _lseek
	add	sp,8
   ;	
   ;	
   ;				DrawLSAction(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _DrawLSAction
	pop	cx
   ;	
   ;				loadedgame=true;
   ;	
	mov	word ptr DGROUP:_loadedgame,1
   ;	
   ;	
   ;				LoadTheGame(handle,LSA_X+8,LSA_Y+5);
   ;	
	mov	ax,85
	push	ax
	mov	ax,104
	push	ax
	push	si
	call	near ptr _LoadTheGame
	add	sp,6
   ;	
   ;				close(handle);
   ;	
	push	si
	call	near ptr _close
	pop	cx
   ;	
   ;	
   ;				StartGame=1;
   ;	
	mov	word ptr DGROUP:_StartGame,1
   ;	
   ;				ShootSnd();
   ;	
	call	near ptr _ShootSnd
   ;	
   ;				//
   ;				// CHANGE "READ THIS!" TO NORMAL COLOR
   ;				//
   ;	
   ;				#ifndef SPEAR
   ;				#ifndef GOODTIMES
   ;				MainMenu[readthis].active=1;
   ;				#endif
   ;				#endif
   ;	
   ;				exit=1;
   ;	
	mov	di,1
   ;	
   ;				break;
   ;	
	jmp	short @14@218
@14@194:
   ;	
   ;			}
   ;	
   ;		} while(which>=0);
   ;	
	cmp	word ptr [bp-2],0
	jl	@@7
	jmp	@14@122
@@7:
@14@218:
   ;	
   ;	
   ;		MenuFadeOut();
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,43
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	
   ;	#ifdef SPEAR
   ;		UnCacheLump (LOADSAVE_LUMP_START,LOADSAVE_LUMP_END);
   ;		CacheLump (OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;	#endif
   ;	
   ;		return exit;
   ;	
	mov	ax,di
	jmp	short @14@242
@14@242:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CP_LoadGame	endp
_TEXT	ends
_DATA	segment word public 'DATA'
	db	0
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void TrackWhichGame(int w)
   ;	
	assume	cs:_TEXT
_TrackWhichGame	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		static int lastgameon=0;
   ;	
   ;		PrintLSEntry(lastgameon,TEXTCOLOR);
   ;	
	mov	ax,23
	push	ax
	push	word ptr DGROUP:d@w+541
	call	near ptr _PrintLSEntry
	pop	cx
	pop	cx
   ;	
   ;		PrintLSEntry(w,HIGHLIGHT);
   ;	
	mov	ax,19
	push	ax
	push	word ptr [bp+4]
	call	near ptr _PrintLSEntry
	pop	cx
	pop	cx
   ;	
   ;	
   ;		lastgameon=w;
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:d@w+541,ax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_TrackWhichGame	endp
   ;	
   ;	void DrawLoadSaveScreen(int loadsave)
   ;	
	assume	cs:_TEXT
_DrawLoadSaveScreen	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		#define DISKX	100
   ;		#define DISKY	0
   ;	
   ;		int i;
   ;	
   ;	
   ;		ClearMScreen();
   ;	
	call	near ptr _ClearMScreen
   ;	
   ;		fontnumber=1;
   ;	
	mov	word ptr DGROUP:_fontnumber,1
   ;	
   ;		VWB_DrawPic(112,184,C_MOUSELBACKPIC);
   ;	
	mov	ax,18
	push	ax
	mov	ax,184
	push	ax
	mov	ax,112
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		DrawWindow(LSM_X-10,LSM_Y-5,LSM_W,LSM_H,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,140
	push	ax
	mov	ax,175
	push	ax
	mov	ax,50
	push	ax
	mov	ax,75
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;		DrawStripes(10);
   ;	
	mov	ax,10
	push	ax
	call	near ptr _DrawStripes
	pop	cx
   ;	
   ;	
   ;		if (!loadsave)
   ;	
	cmp	word ptr [bp+4],0
	jne	short @16@74
   ;	
   ;			VWB_DrawPic(60,0,C_LOADGAMEPIC);
   ;	
	mov	ax,28
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,60
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
	jmp	short @16@98
@16@74:
   ;	
   ;		else
   ;			VWB_DrawPic(60,0,C_SAVEGAMEPIC);
   ;	
	mov	ax,29
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,60
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
@16@98:
   ;	
   ;	
   ;		for (i=0;i<10;i++)
   ;	
	xor	si,si
	jmp	short @16@170
@16@122:
   ;	
   ;			PrintLSEntry(i,TEXTCOLOR);
   ;	
	mov	ax,23
	push	ax
	push	si
	call	near ptr _PrintLSEntry
	pop	cx
	pop	cx
	inc	si
@16@170:
	cmp	si,10
	jl	short @16@122
   ;	
   ;	
   ;		DrawMenu(&LSItems,&LSMenu[0]);
   ;	
	mov	ax,seg _LSMenu
	push	ax
	mov	ax,offset _LSMenu
	push	ax
	mov	ax,offset DGROUP:_LSItems
	push	ax
	call	near ptr _DrawMenu
	add	sp,6
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		MenuFadeIn();
   ;	
	mov	ax,10
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
   ;	
   ;		WaitKeyUp();
   ;	
	call	near ptr _WaitKeyUp
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_DrawLoadSaveScreen	endp
   ;	
   ;	void PrintLSEntry(int w,int color)
   ;	
	assume	cs:_TEXT
_PrintLSEntry	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		SETFONTCOLOR(color,BKGDCOLOR);
   ;	
	mov	al,byte ptr [bp+6]
	mov	byte ptr DGROUP:_fontcolor,al
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;		DrawOutline(LSM_X+LSItems.indent,LSM_Y+w*13,LSM_W-LSItems.indent-15,11,color,color);
   ;	
	push	word ptr [bp+6]
	push	word ptr [bp+6]
	mov	ax,11
	push	ax
	mov	ax,175
	sub	ax,word ptr DGROUP:_LSItems+8
	add	ax,65521
	push	ax
	mov	ax,si
	mov	dx,13
	imul	dx
	add	ax,55
	push	ax
	mov	ax,word ptr DGROUP:_LSItems+8
	add	ax,85
	push	ax
	call	near ptr _DrawOutline
	add	sp,12
   ;	
   ;		PrintX=LSM_X+LSItems.indent+2;
   ;	
	mov	ax,word ptr DGROUP:_LSItems+8
	add	ax,87
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;		PrintY=LSM_Y+w*13+1;
   ;	
	mov	ax,si
	mov	dx,13
	imul	dx
	add	ax,56
	mov	word ptr DGROUP:_PrintY,ax
   ;	
   ;		fontnumber=0;
   ;	
	mov	word ptr DGROUP:_fontnumber,0
   ;	
   ;	
   ;		if (SaveGamesAvail[w])
   ;	
	mov	bx,si
	shl	bx,1
	cmp	word ptr DGROUP:_SaveGamesAvail[bx],0
	je	short @17@74
   ;	
   ;			US_Print(SaveGameNames[w]);
   ;	
	push	ds
	mov	ax,si
	mov	cl,5
	shl	ax,cl
	add	ax,offset DGROUP:_SaveGameNames
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
	jmp	short @17@98
@17@74:
   ;	
   ;		else
   ;			US_Print("      - "STR_EMPTY" -");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+819
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
@17@98:
   ;	
   ;	
   ;		fontnumber=1;
   ;	
	mov	word ptr DGROUP:_fontnumber,1
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_PrintLSEntry	endp
   ;	
   ;	int CP_SaveGame(int quick)
   ;	
	assume	cs:_TEXT
_CP_SaveGame	proc	near
	push	bp
	mov	bp,sp
	sub	sp,50
	push	si
	push	di
   ;	
   ;	{
   ;		int handle,which,exit=0;
   ;	
	xor	di,di
   ;	
   ;		unsigned nwritten;
   ;		char name[13],input[32];
   ;	
   ;	
   ;		strcpy(name,SaveName);
   ;	
	mov	ax,offset DGROUP:_SaveName
	push	ax
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;	
   ;		//
   ;		// QUICKSAVE?
   ;		//
   ;		if (quick)
   ;	
	cmp	word ptr [bp+4],0
	jne	@@8
	jmp	@18@98
@@8:
   ;	
   ;		{
   ;			which=LSItems.curpos;
   ;	
	mov	ax,word ptr DGROUP:_LSItems+6
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;			if (SaveGamesAvail[which])
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	cmp	word ptr DGROUP:_SaveGamesAvail[bx],0
	je	short @18@98
   ;	
   ;			{
   ;				name[7]=which+'0';
   ;	
	mov	al,byte ptr [bp-2]
	add	al,48
	mov	byte ptr [bp-11],al
   ;	
   ;				unlink(name);
   ;	
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _unlink
	pop	cx
   ;	
   ;				handle=creat(name,S_IREAD|S_IWRITE);
   ;	
	mov	ax,384
	push	ax
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _creat
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;	
   ;				strcpy(input,&SaveGameNames[which][0]);
   ;	
	mov	ax,word ptr [bp-2]
	mov	cl,5
	shl	ax,cl
	add	ax,offset DGROUP:_SaveGameNames
	push	ax
	lea	ax,word ptr [bp-50]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;	
   ;				_dos_write(handle,(void far *)input,32,&nwritten);
   ;	
	lea	ax,word ptr [bp-4]
	push	ax
	mov	ax,32
	push	ax
	push	ss
	lea	ax,word ptr [bp-50]
	push	ax
	push	si
	call	near ptr __dos_write
	add	sp,10
   ;	
   ;				lseek(handle,32,SEEK_SET);
   ;	
	xor	ax,ax
	push	ax
	xor	ax,ax
	mov	dx,32
	push	ax
	push	dx
	push	si
	call	near ptr _lseek
	add	sp,8
   ;	
   ;				SaveTheGame(handle,0,0);
   ;	
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	push	si
	call	near ptr _SaveTheGame
	add	sp,6
   ;	
   ;				close(handle);
   ;	
	push	si
	call	near ptr _close
	pop	cx
   ;	
   ;	
   ;				return 1;
   ;	
	mov	ax,1
	jmp	@18@458
@18@98:
   ;	
   ;			}
   ;		}
   ;	
   ;	
   ;	#ifdef SPEAR
   ;		UnCacheLump (OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;		CacheLump (LOADSAVE_LUMP_START,LOADSAVE_LUMP_END);
   ;	#endif
   ;	
   ;		DrawLoadSaveScreen(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _DrawLoadSaveScreen
	pop	cx
@18@122:
   ;	
   ;	
   ;		do
   ;		{
   ;			which=HandleMenu(&LSItems,&LSMenu[0],TrackWhichGame);
   ;	
	mov	ax,offset _TrackWhichGame
	push	ax
	mov	ax,seg _LSMenu
	push	ax
	mov	ax,offset _LSMenu
	push	ax
	mov	ax,offset DGROUP:_LSItems
	push	ax
	call	near ptr _HandleMenu
	add	sp,8
	mov	word ptr [bp-2],ax
   ;	
   ;			if (which>=0)
   ;	
	cmp	word ptr [bp-2],0
	jge	@@9
	jmp	@18@410
@@9:
   ;	
   ;			{
   ;				//
   ;				// OVERWRITE EXISTING SAVEGAME?
   ;				//
   ;				if (SaveGamesAvail[which])
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	cmp	word ptr DGROUP:_SaveGamesAvail[bx],0
	je	short @18@266
   ;	
   ;					#ifdef JAPAN
   ;					if (!GetYorN(7,8,C_JAPSAVEOVERPIC))
   ;					#else
   ;					if (!Confirm(GAMESVD))
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+835
	push	ax
	call	near ptr _Confirm
	pop	cx
	pop	cx
	or	ax,ax
	jne	short @18@242
   ;	
   ;					#endif
   ;					{
   ;						DrawLoadSaveScreen(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _DrawLoadSaveScreen
	pop	cx
   ;	
   ;						continue;
   ;	
	jmp	@18@410
   ;	
   ;					}
   ;	
	jmp	short @18@266
@18@242:
   ;	
   ;					else
   ;					{
   ;						DrawLoadSaveScreen(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _DrawLoadSaveScreen
	pop	cx
   ;	
   ;						PrintLSEntry(which,HIGHLIGHT);
   ;	
	mov	ax,19
	push	ax
	push	word ptr [bp-2]
	call	near ptr _PrintLSEntry
	pop	cx
	pop	cx
   ;	
   ;						VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
@18@266:
   ;	
   ;					}
   ;	
   ;				ShootSnd();
   ;	
	call	near ptr _ShootSnd
   ;	
   ;	
   ;				strcpy(input,&SaveGameNames[which][0]);
   ;	
	mov	ax,word ptr [bp-2]
	mov	cl,5
	shl	ax,cl
	add	ax,offset DGROUP:_SaveGameNames
	push	ax
	lea	ax,word ptr [bp-50]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;				name[7]=which+'0';
   ;	
	mov	al,byte ptr [bp-2]
	add	al,48
	mov	byte ptr [bp-11],al
   ;	
   ;	
   ;				fontnumber=0;
   ;	
	mov	word ptr DGROUP:_fontnumber,0
   ;	
   ;				if (!SaveGamesAvail[which])
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	cmp	word ptr DGROUP:_SaveGamesAvail[bx],0
	jne	short @18@314
   ;	
   ;					VWB_Bar(LSM_X+LSItems.indent+1,LSM_Y+which*13+1,LSM_W-LSItems.indent-16,10,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,10
	push	ax
	mov	ax,175
	sub	ax,word ptr DGROUP:_LSItems+8
	add	ax,65520
	push	ax
	mov	ax,word ptr [bp-2]
	mov	dx,13
	imul	dx
	add	ax,56
	push	ax
	mov	ax,word ptr DGROUP:_LSItems+8
	add	ax,86
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
@18@314:
   ;	
   ;				VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	
   ;				if (US_LineInput(LSM_X+LSItems.indent+2,LSM_Y+which*13+1,input,input,true,31,LSM_W-LSItems.indent-30))
   ;	
	mov	ax,175
	sub	ax,word ptr DGROUP:_LSItems+8
	add	ax,65506
	push	ax
	mov	ax,31
	push	ax
	mov	ax,1
	push	ax
	lea	ax,word ptr [bp-50]
	push	ax
	lea	ax,word ptr [bp-50]
	push	ax
	mov	ax,word ptr [bp-2]
	mov	dx,13
	imul	dx
	add	ax,56
	push	ax
	mov	ax,word ptr DGROUP:_LSItems+8
	add	ax,87
	push	ax
	call	near ptr _US_LineInput
	add	sp,14
	or	ax,ax
	jne	@@10
	jmp	@18@362
@@10:
   ;	
   ;				{
   ;					SaveGamesAvail[which]=1;
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	mov	word ptr DGROUP:_SaveGamesAvail[bx],1
   ;	
   ;					strcpy(&SaveGameNames[which][0],input);
   ;	
	lea	ax,word ptr [bp-50]
	push	ax
	mov	ax,word ptr [bp-2]
	mov	cl,5
	shl	ax,cl
	add	ax,offset DGROUP:_SaveGameNames
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;	
   ;					unlink(name);
   ;	
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _unlink
	pop	cx
   ;	
   ;					handle=creat(name,S_IREAD|S_IWRITE);
   ;	
	mov	ax,384
	push	ax
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _creat
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;					_dos_write(handle,(void far *)input,32,&nwritten);
   ;	
	lea	ax,word ptr [bp-4]
	push	ax
	mov	ax,32
	push	ax
	push	ss
	lea	ax,word ptr [bp-50]
	push	ax
	push	si
	call	near ptr __dos_write
	add	sp,10
   ;	
   ;					lseek(handle,32,SEEK_SET);
   ;	
	xor	ax,ax
	push	ax
	xor	ax,ax
	mov	dx,32
	push	ax
	push	dx
	push	si
	call	near ptr _lseek
	add	sp,8
   ;	
   ;	
   ;					DrawLSAction(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _DrawLSAction
	pop	cx
   ;	
   ;					SaveTheGame(handle,LSA_X+8,LSA_Y+5);
   ;	
	mov	ax,85
	push	ax
	mov	ax,104
	push	ax
	push	si
	call	near ptr _SaveTheGame
	add	sp,6
   ;	
   ;	
   ;					close(handle);
   ;	
	push	si
	call	near ptr _close
	pop	cx
   ;	
   ;	
   ;					ShootSnd();
   ;	
	call	near ptr _ShootSnd
   ;	
   ;					exit=1;
   ;	
	mov	di,1
   ;	
   ;				}
   ;	
	jmp	short @18@386
@18@362:
   ;	
   ;				else
   ;				{
   ;					VWB_Bar(LSM_X+LSItems.indent+1,LSM_Y+which*13+1,LSM_W-LSItems.indent-16,10,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,10
	push	ax
	mov	ax,175
	sub	ax,word ptr DGROUP:_LSItems+8
	add	ax,65520
	push	ax
	mov	ax,word ptr [bp-2]
	mov	dx,13
	imul	dx
	add	ax,56
	push	ax
	mov	ax,word ptr DGROUP:_LSItems+8
	add	ax,86
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;					PrintLSEntry(which,HIGHLIGHT);
   ;	
	mov	ax,19
	push	ax
	push	word ptr [bp-2]
	call	near ptr _PrintLSEntry
	pop	cx
	pop	cx
   ;	
   ;					VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;					SD_PlaySound(ESCPRESSEDSND);
   ;	
	mov	ax,39
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;					continue;
   ;	
	jmp	short @18@410
@18@386:
   ;	
   ;				}
   ;	
   ;				fontnumber=1;
   ;	
	mov	word ptr DGROUP:_fontnumber,1
   ;	
   ;				break;
   ;	
	jmp	short @18@434
@18@410:
   ;	
   ;			}
   ;	
   ;		} while(which>=0);
   ;	
	cmp	word ptr [bp-2],0
	jl	@@11
	jmp	@18@122
@@11:
@18@434:
   ;	
   ;	
   ;		MenuFadeOut();
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,43
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	
   ;	#ifdef SPEAR
   ;		UnCacheLump (LOADSAVE_LUMP_START,LOADSAVE_LUMP_END);
   ;		CacheLump (OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;	#endif
   ;	
   ;		return exit;
   ;	
	mov	ax,di
	jmp	short @18@458
@18@458:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CP_SaveGame	endp
   ;	
   ;	int CalibrateJoystick(void)
   ;	
	assume	cs:_TEXT
_CalibrateJoystick	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
   ;	
   ;	{
   ;		#define CALX	85
   ;		#define CALY	40
   ;		#define CALW	158
   ;		#define CALH	140
   ;	
   ;		unsigned xmin,ymin,xmax,ymax,jb;
   ;	
   ;	
   ;	
   ;		#ifdef JAPAN
   ;		VWB_DrawPic(CALX,CALY,C_JOY0PIC);
   ;		#else
   ;		DrawWindow(CALX-5,CALY-5,CALW,CALH,TEXTCOLOR);
   ;	
	mov	ax,23
	push	ax
	mov	ax,140
	push	ax
	mov	ax,158
	push	ax
	mov	ax,35
	push	ax
	mov	ax,80
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;		DrawOutline(CALX-5,CALY-5,CALW,CALH,0,HIGHLIGHT);
   ;	
	mov	ax,19
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,140
	push	ax
	mov	ax,158
	push	ax
	mov	ax,35
	push	ax
	mov	ax,80
	push	ax
	call	near ptr _DrawOutline
	add	sp,12
   ;	
   ;		SETFONTCOLOR(0,TEXTCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,0
	mov	byte ptr DGROUP:_backcolor,23
   ;	
   ;	
   ;		WindowX = PrintX = CALX;
   ;	
	mov	ax,85
	mov	word ptr DGROUP:_PrintX,ax
	mov	word ptr DGROUP:_WindowX,ax
   ;	
   ;		WindowW = CALW;
   ;	
	mov	word ptr DGROUP:_WindowW,158
   ;	
   ;		WindowH = CALH;
   ;	
	mov	word ptr DGROUP:_WindowH,140
   ;	
   ;		WindowY = PrintY = CALY;
   ;	
	mov	ax,40
	mov	word ptr DGROUP:_PrintY,ax
	mov	word ptr DGROUP:_WindowY,ax
   ;	
   ;		US_Print("    "STR_CALIB"\n    "STR_JOYST"\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+899
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		VWB_DrawPic(CALX+40,CALY+30,C_JOY1PIC);
   ;	
	mov	ax,41
	push	ax
	mov	ax,70
	push	ax
	mov	ax,125
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		PrintY = CALY+80;
   ;	
	mov	word ptr DGROUP:_PrintY,120
   ;	
   ;		US_Print(STR_MOVEJOY);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+927
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		SETFONTCOLOR(BKGDCOLOR,TEXTCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,45
	mov	byte ptr DGROUP:_backcolor,23
   ;	
   ;		US_Print("   "STR_ESCEXIT);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+975
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		#endif
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
@19@50:
   ;	
   ;	
   ;		do
   ;		{
   ;			jb=IN_JoyButtons();
   ;	
	call	near ptr _IN_JoyButtons
	mov	ah,0
	mov	si,ax
   ;	
   ;			if (Keyboard[sc_Escape])
   ;	
	cmp	word ptr DGROUP:_Keyboard+2,0
	je	short @19@98
   ;	
   ;				return 0;
   ;	
	xor	ax,ax
	jmp	@19@578
@19@98:
   ;	
   ;			#ifndef SPEAR
   ;			if (Keyboard[sc_Tab] && Keyboard[sc_P] && MS_CheckParm("goobers"))
   ;	
	cmp	word ptr DGROUP:_Keyboard+30,0
	je	short @19@194
	cmp	word ptr DGROUP:_Keyboard+50,0
	je	short @19@194
	push	ds
	mov	ax,offset DGROUP:s@+990
	push	ax
	call	near ptr _MS_CheckParm
	pop	cx
	pop	cx
	or	ax,ax
	je	short @19@194
   ;	
   ;				PicturePause();
   ;	
	call	near ptr _PicturePause
@19@194:
   ;	
   ;			#endif
   ;	
   ;		} while(!(jb&1));
   ;	
	test	si,1
	je	short @19@50
   ;	
   ;	
   ;		SD_PlaySound(SHOOTSND);
   ;	
	mov	ax,32
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;		IN_GetJoyAbs(joystickport,&xmin,&ymin);
   ;	
	lea	ax,word ptr [bp-4]
	push	ax
	lea	ax,word ptr [bp-2]
	push	ax
	push	word ptr DGROUP:_joystickport
	call	near ptr _IN_GetJoyAbs
	add	sp,6
   ;	
   ;	
   ;	
   ;		#ifdef JAPAN
   ;		VWB_DrawPic(CALX,CALY,C_JOY1PIC);
   ;		#else
   ;		DrawWindow(CALX-5,CALY-5,CALW,CALH,TEXTCOLOR);
   ;	
	mov	ax,23
	push	ax
	mov	ax,140
	push	ax
	mov	ax,158
	push	ax
	mov	ax,35
	push	ax
	mov	ax,80
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;		DrawOutline(CALX-5,CALY-5,CALW,CALH,0,HIGHLIGHT);
   ;	
	mov	ax,19
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,140
	push	ax
	mov	ax,158
	push	ax
	mov	ax,35
	push	ax
	mov	ax,80
	push	ax
	call	near ptr _DrawOutline
	add	sp,12
   ;	
   ;		SETFONTCOLOR(0,TEXTCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,0
	mov	byte ptr DGROUP:_backcolor,23
   ;	
   ;	
   ;		PrintX = CALX;
   ;	
	mov	word ptr DGROUP:_PrintX,85
   ;	
   ;		PrintY = CALY;
   ;	
	mov	word ptr DGROUP:_PrintY,40
   ;	
   ;		US_Print("    "STR_CALIB"\n    "STR_JOYST"\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+998
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		VWB_DrawPic(CALX+40,CALY+30,C_JOY2PIC);
   ;	
	mov	ax,42
	push	ax
	mov	ax,70
	push	ax
	mov	ax,125
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		PrintY = CALY+80;
   ;	
	mov	word ptr DGROUP:_PrintY,120
   ;	
   ;		US_Print(STR_MOVEJOY2);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1026
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		SETFONTCOLOR(BKGDCOLOR,TEXTCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,45
	mov	byte ptr DGROUP:_backcolor,23
   ;	
   ;		US_Print("   "STR_ESCEXIT);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1075
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		#endif
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
@19@242:
   ;	
   ;	
   ;		do
   ;		{
   ;			jb=IN_JoyButtons();
   ;	
	call	near ptr _IN_JoyButtons
	mov	ah,0
	mov	si,ax
   ;	
   ;			if (Keyboard[sc_Escape])
   ;	
	cmp	word ptr DGROUP:_Keyboard+2,0
	je	short @19@290
   ;	
   ;				return 0;
   ;	
	xor	ax,ax
	jmp	short @19@578
@19@290:
   ;	
   ;			#ifndef SPEAR
   ;			if (Keyboard[sc_Tab] && Keyboard[sc_P] && MS_CheckParm("goobers"))
   ;	
	cmp	word ptr DGROUP:_Keyboard+30,0
	je	short @19@386
	cmp	word ptr DGROUP:_Keyboard+50,0
	je	short @19@386
	push	ds
	mov	ax,offset DGROUP:s@+1090
	push	ax
	call	near ptr _MS_CheckParm
	pop	cx
	pop	cx
	or	ax,ax
	je	short @19@386
   ;	
   ;				PicturePause();
   ;	
	call	near ptr _PicturePause
@19@386:
   ;	
   ;			#endif
   ;		} while(!(jb&2));
   ;	
	test	si,2
	je	short @19@242
   ;	
   ;	
   ;		IN_GetJoyAbs(joystickport,&xmax,&ymax);
   ;	
	lea	ax,word ptr [bp-8]
	push	ax
	lea	ax,word ptr [bp-6]
	push	ax
	push	word ptr DGROUP:_joystickport
	call	near ptr _IN_GetJoyAbs
	add	sp,6
   ;	
   ;		SD_PlaySound(SHOOTSND);
   ;	
	mov	ax,32
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
	jmp	short @19@434
@19@434:
   ;	
   ;	
   ;		while (IN_JoyButtons());
   ;	
	call	near ptr _IN_JoyButtons
	or	al,al
	jne	short @19@434
   ;	
   ;	
   ;		//
   ;		// ASSIGN ACTUAL VALUES HERE
   ;		//
   ;		if ((xmin != xmax) && (ymin != ymax))
   ;	
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp-6]
	je	short @19@530
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-8]
	je	short @19@530
   ;	
   ;			IN_SetupJoy(joystickport,xmin,xmax,ymin,ymax);
   ;	
	push	word ptr [bp-8]
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	push	word ptr [bp-2]
	push	word ptr DGROUP:_joystickport
	call	near ptr _IN_SetupJoy
	add	sp,10
	jmp	short @19@554
@19@530:
   ;	
   ;		else
   ;			return 0;
   ;	
	xor	ax,ax
	jmp	short @19@578
@19@554:
   ;	
   ;	
   ;		return 1;
   ;	
	mov	ax,1
	jmp	short @19@578
@19@578:
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CalibrateJoystick	endp
   ;	
   ;	void CP_Control(void)
   ;	
	assume	cs:_TEXT
_CP_Control	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		#define CTL_SPC	70
   ;		enum {MOUSEENABLE,JOYENABLE,USEPORT2,PADENABLE,MOUSESENS,CUSTOMIZE};
   ;		int i,which;
   ;	
   ;	
   ;	#ifdef SPEAR
   ;		UnCacheLump (OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;		CacheLump (CONTROL_LUMP_START,CONTROL_LUMP_END);
   ;	#endif
   ;	
   ;		DrawCtlScreen();
   ;	
	call	near ptr _DrawCtlScreen
   ;	
   ;		MenuFadeIn();
   ;	
	mov	ax,10
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
   ;	
   ;		WaitKeyUp();
   ;	
	call	near ptr _WaitKeyUp
@20@50:
   ;	
   ;	
   ;		do
   ;		{
   ;			which=HandleMenu(&CtlItems,&CtlMenu[0],NULL);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,seg _CtlMenu
	push	ax
	mov	ax,offset _CtlMenu
	push	ax
	mov	ax,offset DGROUP:_CtlItems
	push	ax
	call	near ptr _HandleMenu
	add	sp,8
	mov	si,ax
   ;	
   ;			switch(which)
   ;	
	mov	bx,si
	cmp	bx,5
	jbe	@@12
	jmp	@20@338
@@12:
	shl	bx,1
	jmp	word ptr cs:@20@C1474[bx]
@20@146:
   ;	
   ;			{
   ;				case MOUSEENABLE:
   ;					mouseenabled^=1;
   ;	
	xor	word ptr DGROUP:_mouseenabled,1
   ;	
   ;					_CX=_DX=CENTER;
   ;	
	mov	ax,120
	mov	dx,ax
	mov	cx,ax
   ;	
   ;					Mouse(4);
   ;	
	mov	ax,4
	int	51
   ;	
   ;					DrawCtlScreen();
   ;	
	call	near ptr _DrawCtlScreen
   ;	
   ;					CusItems.curpos=-1;
   ;	
	mov	word ptr DGROUP:_CusItems+6,65535
   ;	
   ;					ShootSnd();
   ;	
	call	near ptr _ShootSnd
   ;	
   ;					break;
   ;	
	jmp	short @20@338
@20@170:
   ;	
   ;	
   ;				case JOYENABLE:
   ;					joystickenabled^=1;
   ;	
	xor	word ptr DGROUP:_joystickenabled,1
   ;	
   ;					if (joystickenabled)
   ;	
	cmp	word ptr DGROUP:_joystickenabled,0
	je	short @20@242
   ;	
   ;						if (!CalibrateJoystick())
   ;	
	call	near ptr _CalibrateJoystick
	or	ax,ax
	jne	short @20@242
   ;	
   ;							joystickenabled = 0;
   ;	
	mov	word ptr DGROUP:_joystickenabled,0
@20@242:
   ;	
   ;					DrawCtlScreen();
   ;	
	call	near ptr _DrawCtlScreen
   ;	
   ;					CusItems.curpos=-1;
   ;	
	mov	word ptr DGROUP:_CusItems+6,65535
   ;	
   ;					ShootSnd();
   ;	
	call	near ptr _ShootSnd
   ;	
   ;					break;
   ;	
	jmp	short @20@338
@20@266:
   ;	
   ;	
   ;				case USEPORT2:
   ;					joystickport^=1;
   ;	
	xor	word ptr DGROUP:_joystickport,1
   ;	
   ;					DrawCtlScreen();
   ;	
	call	near ptr _DrawCtlScreen
   ;	
   ;					ShootSnd();
   ;	
	call	near ptr _ShootSnd
   ;	
   ;					break;
   ;	
	jmp	short @20@338
@20@290:
   ;	
   ;	
   ;				case PADENABLE:
   ;					joypadenabled^=1;
   ;	
	xor	word ptr DGROUP:_joypadenabled,1
   ;	
   ;					DrawCtlScreen();
   ;	
	call	near ptr _DrawCtlScreen
   ;	
   ;					ShootSnd();
   ;	
	call	near ptr _ShootSnd
   ;	
   ;					break;
   ;	
	jmp	short @20@338
@20@314:
   ;	
   ;	
   ;				case MOUSESENS:
   ;				case CUSTOMIZE:
   ;					DrawCtlScreen();
   ;	
	call	near ptr _DrawCtlScreen
   ;	
   ;					MenuFadeIn();
   ;	
	mov	ax,10
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
   ;	
   ;					WaitKeyUp();
   ;	
	call	near ptr _WaitKeyUp
   ;	
   ;					break;
   ;	
	jmp	short @20@338
@20@338:
   ;	
   ;			}
   ;		} while(which>=0);
   ;	
	or	si,si
	jl	@@13
	jmp	@20@50
@@13:
   ;	
   ;	
   ;		MenuFadeOut();
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,43
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	
   ;	#ifdef SPEAR
   ;		UnCacheLump (CONTROL_LUMP_START,CONTROL_LUMP_END);
   ;		CacheLump (OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;	#endif
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_CP_Control	endp
@20@C1474	label	word
	dw	@20@146
	dw	@20@170
	dw	@20@266
	dw	@20@290
	dw	@20@314
	dw	@20@314
   ;	
   ;	void DrawMouseSens(void)
   ;	
	assume	cs:_TEXT
_DrawMouseSens	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	#ifdef JAPAN
   ;		CA_CacheScreen(S_MOUSESENSPIC);
   ;	#else
   ;		ClearMScreen();
   ;	
	call	near ptr _ClearMScreen
   ;	
   ;		VWB_DrawPic(112,184,C_MOUSELBACKPIC);
   ;	
	mov	ax,18
	push	ax
	mov	ax,184
	push	ax
	mov	ax,112
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		#ifdef SPANISH
   ;		DrawWindow(10,80,300,43,BKGDCOLOR);
   ;		#else
   ;		DrawWindow(10,80,300,30,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,30
	push	ax
	mov	ax,300
	push	ax
	mov	ax,80
	push	ax
	mov	ax,10
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;		#endif
   ;	
   ;		WindowX=0;
   ;	
	mov	word ptr DGROUP:_WindowX,0
   ;	
   ;		WindowW=320;
   ;	
	mov	word ptr DGROUP:_WindowW,320
   ;	
   ;		PrintY=82;
   ;	
	mov	word ptr DGROUP:_PrintY,82
   ;	
   ;		SETFONTCOLOR(READCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,74
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;		US_CPrint(STR_MOUSEADJ);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1098
	push	ax
	call	near ptr _US_CPrint
	pop	cx
	pop	cx
   ;	
   ;	
   ;		SETFONTCOLOR(TEXTCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,23
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;		#ifdef SPANISH
   ;		PrintX=14;
   ;		PrintY=95+13;
   ;		US_Print(STR_SLOW);
   ;		PrintX=252;
   ;		US_Print(STR_FAST);
   ;		#else
   ;		PrintX=14;
   ;	
	mov	word ptr DGROUP:_PrintX,14
   ;	
   ;		PrintY=95;
   ;	
	mov	word ptr DGROUP:_PrintY,95
   ;	
   ;		US_Print(STR_SLOW);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1123
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		PrintX=269;
   ;	
	mov	word ptr DGROUP:_PrintX,269
   ;	
   ;		US_Print(STR_FAST);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1128
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		#endif
   ;	#endif
   ;	
   ;		VWB_Bar(60,97,200,10,TEXTCOLOR);
   ;	
	mov	ax,23
	push	ax
	mov	ax,10
	push	ax
	mov	ax,200
	push	ax
	mov	ax,97
	push	ax
	mov	ax,60
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;		DrawOutline(60,97,200,10,0,HIGHLIGHT);
   ;	
	mov	ax,19
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,10
	push	ax
	mov	ax,200
	push	ax
	mov	ax,97
	push	ax
	mov	ax,60
	push	ax
	call	near ptr _DrawOutline
	add	sp,12
   ;	
   ;		DrawOutline(60+20*mouseadjustment,97,20,10,0,READCOLOR);
   ;	
	mov	ax,74
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,10
	push	ax
	mov	ax,20
	push	ax
	mov	ax,97
	push	ax
	mov	ax,word ptr DGROUP:_mouseadjustment
	mov	dx,20
	imul	dx
	add	ax,60
	push	ax
	call	near ptr _DrawOutline
	add	sp,12
   ;	
   ;		VWB_Bar(61+20*mouseadjustment,98,19,9,READHCOLOR);
   ;	
	mov	ax,71
	push	ax
	mov	ax,9
	push	ax
	mov	ax,19
	push	ax
	mov	ax,98
	push	ax
	mov	ax,word ptr DGROUP:_mouseadjustment
	mov	dx,20
	imul	dx
	add	ax,61
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		MenuFadeIn();
   ;	
	mov	ax,10
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_DrawMouseSens	endp
   ;	
   ;	void MouseSensitivity(void)
   ;	
	assume	cs:_TEXT
_MouseSensitivity	proc	near
	push	bp
	mov	bp,sp
	sub	sp,18
	push	si
	push	di
   ;	
   ;	{
   ;		ControlInfo ci;
   ;		int exit=0,oldMA;
   ;	
	xor	si,si
   ;	
   ;	
   ;	
   ;		oldMA=mouseadjustment;
   ;	
	mov	di,word ptr DGROUP:_mouseadjustment
   ;	
   ;		DrawMouseSens();
   ;	
	call	near ptr _DrawMouseSens
@22@50:
   ;	
   ;		do
   ;		{
   ;			ReadAnyControl(&ci);
   ;	
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _ReadAnyControl
	pop	cx
   ;	
   ;			switch(ci.dir)
   ;	
	mov	bx,word ptr [bp-2]
	cmp	bx,6
	jbe	@@14
	jmp	@22@386
@@14:
	shl	bx,1
	jmp	word ptr cs:@22@C2762[bx]
@22@146:
   ;	
   ;			{
   ;				case dir_North:
   ;				case dir_West:
   ;					if (mouseadjustment)
   ;	
	cmp	word ptr DGROUP:_mouseadjustment,0
	jne	@@15
	jmp	@22@242
@@15:
   ;	
   ;					{
   ;						mouseadjustment--;
   ;	
	dec	word ptr DGROUP:_mouseadjustment
   ;	
   ;						VWB_Bar(60,97,200,10,TEXTCOLOR);
   ;	
	mov	ax,23
	push	ax
	mov	ax,10
	push	ax
	mov	ax,200
	push	ax
	mov	ax,97
	push	ax
	mov	ax,60
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;						DrawOutline(60,97,200,10,0,HIGHLIGHT);
   ;	
	mov	ax,19
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,10
	push	ax
	mov	ax,200
	push	ax
	mov	ax,97
	push	ax
	mov	ax,60
	push	ax
	call	near ptr _DrawOutline
	add	sp,12
   ;	
   ;						DrawOutline(60+20*mouseadjustment,97,20,10,0,READCOLOR);
   ;	
	mov	ax,74
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,10
	push	ax
	mov	ax,20
	push	ax
	mov	ax,97
	push	ax
	mov	ax,word ptr DGROUP:_mouseadjustment
	mov	dx,20
	imul	dx
	add	ax,60
	push	ax
	call	near ptr _DrawOutline
	add	sp,12
   ;	
   ;						VWB_Bar(61+20*mouseadjustment,98,19,9,READHCOLOR);
   ;	
	mov	ax,71
	push	ax
	mov	ax,9
	push	ax
	mov	ax,19
	push	ax
	mov	ax,98
	push	ax
	mov	ax,word ptr DGROUP:_mouseadjustment
	mov	dx,20
	imul	dx
	add	ax,61
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;						VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;						SD_PlaySound(MOVEGUN1SND);
   ;	
	mov	ax,5
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
	jmp	short @22@194
@22@194:
   ;	
   ;						while(Keyboard[sc_LeftArrow]);
   ;	
	cmp	word ptr DGROUP:_Keyboard+150,0
	jne	short @22@194
   ;	
   ;						WaitKeyUp();
   ;	
	call	near ptr _WaitKeyUp
@22@242:
   ;	
   ;					}
   ;					break;
   ;	
	jmp	@22@386
@22@266:
   ;	
   ;	
   ;				case dir_South:
   ;				case dir_East:
   ;					if (mouseadjustment<9)
   ;	
	cmp	word ptr DGROUP:_mouseadjustment,9
	jl	@@16
	jmp	@22@362
@@16:
   ;	
   ;					{
   ;						mouseadjustment++;
   ;	
	inc	word ptr DGROUP:_mouseadjustment
   ;	
   ;						VWB_Bar(60,97,200,10,TEXTCOLOR);
   ;	
	mov	ax,23
	push	ax
	mov	ax,10
	push	ax
	mov	ax,200
	push	ax
	mov	ax,97
	push	ax
	mov	ax,60
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;						DrawOutline(60,97,200,10,0,HIGHLIGHT);
   ;	
	mov	ax,19
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,10
	push	ax
	mov	ax,200
	push	ax
	mov	ax,97
	push	ax
	mov	ax,60
	push	ax
	call	near ptr _DrawOutline
	add	sp,12
   ;	
   ;						DrawOutline(60+20*mouseadjustment,97,20,10,0,READCOLOR);
   ;	
	mov	ax,74
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,10
	push	ax
	mov	ax,20
	push	ax
	mov	ax,97
	push	ax
	mov	ax,word ptr DGROUP:_mouseadjustment
	mov	dx,20
	imul	dx
	add	ax,60
	push	ax
	call	near ptr _DrawOutline
	add	sp,12
   ;	
   ;						VWB_Bar(61+20*mouseadjustment,98,19,9,READHCOLOR);
   ;	
	mov	ax,71
	push	ax
	mov	ax,9
	push	ax
	mov	ax,19
	push	ax
	mov	ax,98
	push	ax
	mov	ax,word ptr DGROUP:_mouseadjustment
	mov	dx,20
	imul	dx
	add	ax,61
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;						VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;						SD_PlaySound(MOVEGUN1SND);
   ;	
	mov	ax,5
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
	jmp	short @22@314
@22@314:
   ;	
   ;						while(Keyboard[sc_RightArrow]);
   ;	
	cmp	word ptr DGROUP:_Keyboard+154,0
	jne	short @22@314
   ;	
   ;						WaitKeyUp();
   ;	
	call	near ptr _WaitKeyUp
@22@362:
   ;	
   ;					}
   ;					break;
   ;	
	jmp	short @22@386
@22@386:
   ;	
   ;			}
   ;	
   ;			#ifndef SPEAR
   ;			if (Keyboard[sc_Tab] && Keyboard[sc_P] && MS_CheckParm("goobers"))
   ;	
	cmp	word ptr DGROUP:_Keyboard+30,0
	je	short @22@482
	cmp	word ptr DGROUP:_Keyboard+50,0
	je	short @22@482
	push	ds
	mov	ax,offset DGROUP:s@+1133
	push	ax
	call	near ptr _MS_CheckParm
	pop	cx
	pop	cx
	or	ax,ax
	je	short @22@482
   ;	
   ;			#else
   ;			if (Keyboard[sc_Tab] && Keyboard[sc_P] && MS_CheckParm("debugmode"))
   ;			#endif
   ;				PicturePause();
   ;	
	call	near ptr _PicturePause
@22@482:
   ;	
   ;	
   ;			if (ci.button0 || Keyboard[sc_Space] || Keyboard[sc_Enter])
   ;	
	cmp	word ptr [bp-18],0
	jne	short @22@554
	cmp	word ptr DGROUP:_Keyboard+114,0
	jne	short @22@554
	cmp	word ptr DGROUP:_Keyboard+56,0
	je	short @22@578
@22@554:
   ;	
   ;				exit=1;
   ;	
	mov	si,1
	jmp	short @22@650
@22@578:
   ;	
   ;			else
   ;			if (ci.button1 || Keyboard[sc_Escape])
   ;	
	cmp	word ptr [bp-16],0
	jne	short @22@626
	cmp	word ptr DGROUP:_Keyboard+2,0
	je	short @22@650
@22@626:
   ;	
   ;				exit=2;
   ;	
	mov	si,2
@22@650:
   ;	
   ;	
   ;		} while(!exit);
   ;	
	or	si,si
	jne	@@17
	jmp	@22@50
@@17:
   ;	
   ;	
   ;		if (exit==2)
   ;	
	cmp	si,2
	jne	short @22@722
   ;	
   ;		{
   ;			mouseadjustment=oldMA;
   ;	
	mov	word ptr DGROUP:_mouseadjustment,di
   ;	
   ;			SD_PlaySound(ESCPRESSEDSND);
   ;	
	mov	ax,39
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;		}
   ;	
	jmp	short @22@746
@22@722:
   ;	
   ;		else
   ;			SD_PlaySound(SHOOTSND);
   ;	
	mov	ax,32
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
@22@746:
   ;	
   ;	
   ;		WaitKeyUp();
   ;	
	call	near ptr _WaitKeyUp
   ;	
   ;		MenuFadeOut();
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,43
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_MouseSensitivity	endp
@22@C2762	label	word
	dw	@22@146
	dw	@22@386
	dw	@22@266
	dw	@22@386
	dw	@22@266
	dw	@22@386
	dw	@22@146
   ;	
   ;	void DrawCtlScreen(void)
   ;	
	assume	cs:_TEXT
_DrawCtlScreen	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
   ;	
   ;	{
   ;	 int i,x,y;
   ;	
   ;	
   ;	#ifdef JAPAN
   ;		CA_CacheScreen(S_CONTROLPIC);
   ;	#else
   ;	 ClearMScreen();
   ;	
	call	near ptr _ClearMScreen
   ;	
   ;	 DrawStripes(10);
   ;	
	mov	ax,10
	push	ax
	call	near ptr _DrawStripes
	pop	cx
   ;	
   ;	 VWB_DrawPic(80,0,C_CONTROLPIC);
   ;	
	mov	ax,26
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,80
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;	 VWB_DrawPic(112,184,C_MOUSELBACKPIC);
   ;	
	mov	ax,18
	push	ax
	mov	ax,184
	push	ax
	mov	ax,112
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;	 DrawWindow(CTL_X-8,CTL_Y-5,CTL_W,CTL_H,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,84
	push	ax
	mov	ax,284
	push	ax
	mov	ax,65
	push	ax
	mov	ax,16
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;	#endif
   ;	 WindowX=0;
   ;	
	mov	word ptr DGROUP:_WindowX,0
   ;	
   ;	 WindowW=320;
   ;	
	mov	word ptr DGROUP:_WindowW,320
   ;	
   ;	 SETFONTCOLOR(TEXTCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,23
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;	
   ;	 if (JoysPresent[0])
   ;	
	cmp	word ptr DGROUP:_JoysPresent,0
	je	short @23@74
   ;	
   ;	   CtlMenu[1].active=
   ;	
   ;	
   ;	   CtlMenu[2].active=
   ;	   CtlMenu[3].active=1;
   ;	
	mov	ax,seg _CtlMenu
	mov	dx,1
	mov	es,ax
	mov	word ptr es:_CtlMenu+120,dx
	mov	ax,dx
	mov	dx,seg _CtlMenu
	mov	es,dx
	mov	word ptr es:_CtlMenu+80,ax
	mov	dx,seg _CtlMenu
	mov	es,dx
	mov	word ptr es:_CtlMenu+40,ax
@23@74:
   ;	
   ;	
   ;	 CtlMenu[2].active=CtlMenu[3].active=joystickenabled;
   ;	
	mov	ax,seg _CtlMenu
	mov	dx,word ptr DGROUP:_joystickenabled
	mov	es,ax
	mov	word ptr es:_CtlMenu+120,dx
	mov	ax,dx
	mov	dx,seg _CtlMenu
	mov	es,dx
	mov	word ptr es:_CtlMenu+80,ax
   ;	
   ;	
   ;	 if (MousePresent)
   ;	
	cmp	word ptr DGROUP:_MousePresent,0
	je	short @23@122
   ;	
   ;	 {
   ;	  CtlMenu[4].active=
   ;	
   ;	
   ;	  CtlMenu[0].active=1;
   ;	
	mov	ax,seg _CtlMenu
	mov	dx,1
	mov	es,ax
	mov	word ptr es:_CtlMenu,dx
	mov	ax,dx
	mov	dx,seg _CtlMenu
	mov	es,dx
	mov	word ptr es:_CtlMenu+160,ax
@23@122:
   ;	
   ;	 }
   ;	
   ;	 CtlMenu[4].active=mouseenabled;
   ;	
	mov	ax,seg _CtlMenu
	mov	dx,word ptr DGROUP:_mouseenabled
	mov	es,ax
	mov	word ptr es:_CtlMenu+160,dx
   ;	
   ;	
   ;	
   ;	 DrawMenu(&CtlItems,&CtlMenu[0]);
   ;	
	mov	ax,seg _CtlMenu
	push	ax
	mov	ax,offset _CtlMenu
	push	ax
	mov	ax,offset DGROUP:_CtlItems
	push	ax
	call	near ptr _DrawMenu
	add	sp,6
   ;	
   ;	
   ;	
   ;	 x=CTL_X+CtlItems.indent-24;
   ;	
	mov	ax,word ptr DGROUP:_CtlItems+8
	add	ax,0
	mov	di,ax
   ;	
   ;	 y=CTL_Y+3;
   ;	
	mov	si,73
   ;	
   ;	 if (mouseenabled)
   ;	
	cmp	word ptr DGROUP:_mouseenabled,0
	je	short @23@170
   ;	
   ;	   VWB_DrawPic(x,y,C_SELECTEDPIC);
   ;	
	mov	ax,14
	push	ax
	push	si
	push	di
	call	near ptr _VWB_DrawPic
	add	sp,6
	jmp	short @23@194
@23@170:
   ;	
   ;	 else
   ;	   VWB_DrawPic(x,y,C_NOTSELECTEDPIC);
   ;	
	mov	ax,13
	push	ax
	push	si
	push	di
	call	near ptr _VWB_DrawPic
	add	sp,6
@23@194:
   ;	
   ;	
   ;	 y=CTL_Y+16;
   ;	
	mov	si,86
   ;	
   ;	 if (joystickenabled)
   ;	
	cmp	word ptr DGROUP:_joystickenabled,0
	je	short @23@242
   ;	
   ;	   VWB_DrawPic(x,y,C_SELECTEDPIC);
   ;	
	mov	ax,14
	push	ax
	push	si
	push	di
	call	near ptr _VWB_DrawPic
	add	sp,6
	jmp	short @23@266
@23@242:
   ;	
   ;	 else
   ;	   VWB_DrawPic(x,y,C_NOTSELECTEDPIC);
   ;	
	mov	ax,13
	push	ax
	push	si
	push	di
	call	near ptr _VWB_DrawPic
	add	sp,6
@23@266:
   ;	
   ;	
   ;	 y=CTL_Y+29;
   ;	
	mov	si,99
   ;	
   ;	 if (joystickport)
   ;	
	cmp	word ptr DGROUP:_joystickport,0
	je	short @23@314
   ;	
   ;	   VWB_DrawPic(x,y,C_SELECTEDPIC);
   ;	
	mov	ax,14
	push	ax
	push	si
	push	di
	call	near ptr _VWB_DrawPic
	add	sp,6
	jmp	short @23@338
@23@314:
   ;	
   ;	 else
   ;	   VWB_DrawPic(x,y,C_NOTSELECTEDPIC);
   ;	
	mov	ax,13
	push	ax
	push	si
	push	di
	call	near ptr _VWB_DrawPic
	add	sp,6
@23@338:
   ;	
   ;	
   ;	 y=CTL_Y+42;
   ;	
	mov	si,112
   ;	
   ;	 if (joypadenabled)
   ;	
	cmp	word ptr DGROUP:_joypadenabled,0
	je	short @23@386
   ;	
   ;	   VWB_DrawPic(x,y,C_SELECTEDPIC);
   ;	
	mov	ax,14
	push	ax
	push	si
	push	di
	call	near ptr _VWB_DrawPic
	add	sp,6
	jmp	short @23@410
@23@386:
   ;	
   ;	 else
   ;	   VWB_DrawPic(x,y,C_NOTSELECTEDPIC);
   ;	
	mov	ax,13
	push	ax
	push	si
	push	di
	call	near ptr _VWB_DrawPic
	add	sp,6
@23@410:
   ;	
   ;	
   ;	 //
   ;	 // PICK FIRST AVAILABLE SPOT
   ;	 //
   ;	 if (CtlItems.curpos<0 || !CtlMenu[CtlItems.curpos].active)
   ;	
	cmp	word ptr DGROUP:_CtlItems+6,0
	jl	short @23@458
	mov	ax,word ptr DGROUP:_CtlItems+6
	mov	dx,40
	imul	dx
	mov	dx,seg _CtlMenu
	mov	bx,ax
	mov	es,dx
	cmp	word ptr es:_CtlMenu[bx],0
	jne	short @23@578
@23@458:
   ;	
   ;	   for (i=0;i<6;i++)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @23@554
@23@482:
   ;	
   ;		 if (CtlMenu[i].active)
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,40
	imul	dx
	mov	dx,seg _CtlMenu
	mov	bx,ax
	mov	es,dx
	cmp	word ptr es:_CtlMenu[bx],0
	je	short @23@530
   ;	
   ;		 {
   ;		  CtlItems.curpos=i;
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr DGROUP:_CtlItems+6,ax
   ;	
   ;		  break;
   ;	
	jmp	short @23@578
@23@530:
	inc	word ptr [bp-2]
@23@554:
	cmp	word ptr [bp-2],6
	jl	short @23@482
@23@578:
   ;	
   ;		 }
   ;	
   ;	 DrawMenuGun(&CtlItems);
   ;	
	mov	ax,offset DGROUP:_CtlItems
	push	ax
	call	near ptr _DrawMenuGun
	pop	cx
   ;	
   ;	 VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_DrawCtlScreen	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_mbarray	label	byte
	db	98
	db	48
	db	1 dup (0)
	db	98
	db	49
	db	1 dup (0)
	db	98
	db	50
	db	1 dup (0)
	db	98
	db	51
	db	1 dup (0)
_order	label	byte
	db	3
	db	4
	db	0
	db	1
	db	2
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void CustomControls(void)
   ;	
	assume	cs:_TEXT
_CustomControls	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;	 int which;
   ;	
   ;	
   ;	 DrawCustomScreen();
   ;	
	call	near ptr _DrawCustomScreen
@24@50:
   ;	
   ;	 do
   ;	 {
   ;	  which=HandleMenu(&CusItems,&CusMenu[0],FixupCustom);
   ;	
	mov	ax,offset _FixupCustom
	push	ax
	mov	ax,seg _CusMenu
	push	ax
	mov	ax,offset _CusMenu
	push	ax
	mov	ax,offset DGROUP:_CusItems
	push	ax
	call	near ptr _HandleMenu
	add	sp,8
	mov	si,ax
   ;	
   ;	  switch(which)
   ;	
	mov	bx,si
	cmp	bx,8
	ja	short @24@242
	shl	bx,1
	jmp	word ptr cs:@24@C1106[bx]
@24@146:
   ;	
   ;	  {
   ;	   case 0:
   ;		 DefineMouseBtns();
   ;	
	call	near ptr _DefineMouseBtns
   ;	
   ;		 DrawCustMouse(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _DrawCustMouse
	pop	cx
   ;	
   ;		 break;
   ;	
	jmp	short @24@242
@24@170:
   ;	
   ;	   case 3:
   ;		 DefineJoyBtns();
   ;	
	call	near ptr _DefineJoyBtns
   ;	
   ;		 DrawCustJoy(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _DrawCustJoy
	pop	cx
   ;	
   ;		 break;
   ;	
	jmp	short @24@242
@24@194:
   ;	
   ;	   case 6:
   ;		 DefineKeyBtns();
   ;	
	call	near ptr _DefineKeyBtns
   ;	
   ;		 DrawCustKeybd(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _DrawCustKeybd
	pop	cx
   ;	
   ;		 break;
   ;	
	jmp	short @24@242
@24@218:
   ;	
   ;	   case 8:
   ;		 DefineKeyMove();
   ;	
	call	near ptr _DefineKeyMove
   ;	
   ;		 DrawCustKeys(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _DrawCustKeys
	pop	cx
@24@242:
   ;	
   ;	  }
   ;	 } while(which>=0);
   ;	
	or	si,si
	jge	short @24@50
   ;	
   ;	
   ;	
   ;	
   ;	 MenuFadeOut();
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,43
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_CustomControls	endp
@24@C1106	label	word
	dw	@24@146
	dw	@24@242
	dw	@24@242
	dw	@24@170
	dw	@24@242
	dw	@24@242
	dw	@24@194
	dw	@24@242
	dw	@24@218
_TEXT	ends
_DATA	segment word public 'DATA'
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void DefineMouseBtns(void)
   ;	
	assume	cs:_TEXT
_DefineMouseBtns	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	lea	ax,word ptr [bp-10]
	push	ss
	push	ax
	mov	ax,offset DGROUP:d@w+560
	push	ds
	push	ax
	mov	cx,10
	call	near ptr N_SCOPY@
   ;	
   ;	{
   ;	 CustomCtrls mouseallowed={0,1,1,1,1};
   ;	 EnterCtrlData(2,&mouseallowed,DrawCustMouse,PrintCustMouse,MOUSE);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset _PrintCustMouse
	push	ax
	mov	ax,offset _DrawCustMouse
	push	ax
	lea	ax,word ptr [bp-10]
	push	ax
	mov	ax,2
	push	ax
	call	near ptr _EnterCtrlData
	add	sp,10
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_DefineMouseBtns	endp
_TEXT	ends
_DATA	segment word public 'DATA'
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void DefineJoyBtns(void)
   ;	
	assume	cs:_TEXT
_DefineJoyBtns	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	lea	ax,word ptr [bp-10]
	push	ss
	push	ax
	mov	ax,offset DGROUP:d@w+570
	push	ds
	push	ax
	mov	cx,10
	call	near ptr N_SCOPY@
   ;	
   ;	{
   ;	 CustomCtrls joyallowed={1,1,1,1,1};
   ;	 EnterCtrlData(5,&joyallowed,DrawCustJoy,PrintCustJoy,JOYSTICK);
   ;	
	mov	ax,1
	push	ax
	mov	ax,offset _PrintCustJoy
	push	ax
	mov	ax,offset _DrawCustJoy
	push	ax
	lea	ax,word ptr [bp-10]
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _EnterCtrlData
	add	sp,10
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_DefineJoyBtns	endp
_TEXT	ends
_DATA	segment word public 'DATA'
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void DefineKeyBtns(void)
   ;	
	assume	cs:_TEXT
_DefineKeyBtns	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	lea	ax,word ptr [bp-10]
	push	ss
	push	ax
	mov	ax,offset DGROUP:d@w+580
	push	ds
	push	ax
	mov	cx,10
	call	near ptr N_SCOPY@
   ;	
   ;	{
   ;	 CustomCtrls keyallowed={1,1,1,1,1};
   ;	 EnterCtrlData(8,&keyallowed,DrawCustKeybd,PrintCustKeybd,KEYBOARDBTNS);
   ;	
	mov	ax,2
	push	ax
	mov	ax,offset _PrintCustKeybd
	push	ax
	mov	ax,offset _DrawCustKeybd
	push	ax
	lea	ax,word ptr [bp-10]
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _EnterCtrlData
	add	sp,10
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_DefineKeyBtns	endp
_TEXT	ends
_DATA	segment word public 'DATA'
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void DefineKeyMove(void)
   ;	
	assume	cs:_TEXT
_DefineKeyMove	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	lea	ax,word ptr [bp-10]
	push	ss
	push	ax
	mov	ax,offset DGROUP:d@w+590
	push	ds
	push	ax
	mov	cx,10
	call	near ptr N_SCOPY@
   ;	
   ;	{
   ;	 CustomCtrls keyallowed={1,1,1,1,0};
   ;	 EnterCtrlData(10,&keyallowed,DrawCustKeys,PrintCustKeys,KEYBOARDMOVE);
   ;	
	mov	ax,3
	push	ax
	mov	ax,offset _PrintCustKeys
	push	ax
	mov	ax,offset _DrawCustKeys
	push	ax
	lea	ax,word ptr [bp-10]
	push	ax
	mov	ax,10
	push	ax
	call	near ptr _EnterCtrlData
	add	sp,10
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_DefineKeyMove	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_moveorder	label	word
	db	3
	db	0
	db	1
	db	0
	db	0
	db	0
	db	2
	db	0
	db	4
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void EnterCtrlData(int index,CustomCtrls *cust,void (*DrawRtn)(int),void (*PrintRtn)(int),int type)
   ;	
	assume	cs:_TEXT
_EnterCtrlData	proc	near
	push	bp
	mov	bp,sp
	sub	sp,34
	push	si
	push	di
   ;	
   ;	{
   ;	 int j,exit,tick,redraw,which,x,picked;
   ;	 ControlInfo ci;
   ;	
   ;	
   ;	 ShootSnd();
   ;	
	call	near ptr _ShootSnd
   ;	
   ;	 PrintY=CST_Y+13*index;
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,13
	imul	dx
	add	ax,48
	mov	word ptr DGROUP:_PrintY,ax
   ;	
   ;	 IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;	 exit=0;
   ;	
	mov	word ptr [bp-4],0
   ;	
   ;	 redraw=1;
   ;	
	mov	word ptr [bp-8],1
   ;	
   ;	 //
   ;	 // FIND FIRST SPOT IN ALLOWED ARRAY
   ;	 //
   ;	 for (j=0;j<MAXBUTTONS;j++)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @29@122
@29@50:
   ;	
   ;	   if (cust->allowed[j])
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,1
	mov	bx,word ptr [bp+6]
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @29@98
   ;	
   ;	   {
   ;		which=j;
   ;	
	mov	si,word ptr [bp-2]
   ;	
   ;		break;
   ;	
	jmp	short @29@146
@29@98:
	inc	word ptr [bp-2]
@29@122:
	cmp	word ptr [bp-2],5
	jl	short @29@50
@29@146:
   ;	
   ;	   }
   ;	
   ;	 do
   ;	 {
   ;	  if (redraw)
   ;	
	cmp	word ptr [bp-8],0
	jne	@@18
	jmp	@29@194
@@18:
   ;	
   ;	  {
   ;	   x=CST_START+CST_SPC*which;
   ;	
	mov	ax,si
	mov	dx,50
	imul	dx
	add	ax,60
	mov	word ptr [bp-10],ax
   ;	
   ;	   DrawWindow(5,PrintY-1,310,13,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,13
	push	ax
	mov	ax,310
	push	ax
	mov	ax,word ptr DGROUP:_PrintY
	dec	ax
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;	
   ;	   DrawRtn(1);
   ;	
	mov	ax,1
	push	ax
	call	word ptr [bp+8]
	pop	cx
   ;	
   ;	   DrawWindow(x-2,PrintY,CST_SPC,11,TEXTCOLOR);
   ;	
	mov	ax,23
	push	ax
	mov	ax,11
	push	ax
	mov	ax,50
	push	ax
	push	word ptr DGROUP:_PrintY
	mov	ax,word ptr [bp-10]
	add	ax,65534
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;	   DrawOutline(x-2,PrintY,CST_SPC,11,0,HIGHLIGHT);
   ;	
	mov	ax,19
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,11
	push	ax
	mov	ax,50
	push	ax
	push	word ptr DGROUP:_PrintY
	mov	ax,word ptr [bp-10]
	add	ax,65534
	push	ax
	call	near ptr _DrawOutline
	add	sp,12
   ;	
   ;	   SETFONTCOLOR(0,TEXTCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,0
	mov	byte ptr DGROUP:_backcolor,23
   ;	
   ;	   PrintRtn(which);
   ;	
	push	si
	call	word ptr [bp+10]
	pop	cx
   ;	
   ;	   PrintX=x;
   ;	
	mov	ax,word ptr [bp-10]
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;	   SETFONTCOLOR(TEXTCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,23
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;	   VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	   WaitKeyUp();
   ;	
	call	near ptr _WaitKeyUp
   ;	
   ;	   redraw=0;
   ;	
	mov	word ptr [bp-8],0
@29@194:
   ;	
   ;	  }
   ;	
   ;	  ReadAnyControl(&ci);
   ;	
	lea	ax,word ptr [bp-34]
	push	ax
	call	near ptr _ReadAnyControl
	pop	cx
   ;	
   ;	
   ;	  if (type==MOUSE || type==JOYSTICK)
   ;	
	cmp	word ptr [bp+12],0
	je	short @29@242
	cmp	word ptr [bp+12],1
	jne	short @29@338
@29@242:
   ;	
   ;		if (IN_KeyDown(sc_Enter)||IN_KeyDown(sc_Control)||IN_KeyDown(sc_Alt))
   ;	
	cmp	word ptr DGROUP:_Keyboard+56,0
	jne	short @29@314
	cmp	word ptr DGROUP:_Keyboard+58,0
	jne	short @29@314
	cmp	word ptr DGROUP:_Keyboard+112,0
	je	short @29@338
@29@314:
   ;	
   ;		{
   ;		 IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;		 ci.button0=ci.button1=false;
   ;	
	xor	ax,ax
	mov	word ptr [bp-32],ax
	mov	word ptr [bp-34],ax
@29@338:
   ;	
   ;		}
   ;	
   ;	  //
   ;	  // CHANGE BUTTON VALUE?
   ;	  //
   ;	  if ((ci.button0|ci.button1|ci.button2|ci.button3)||
   ;	
   ;	
   ;		  ((type==KEYBOARDBTNS||type==KEYBOARDMOVE) && LastScan==sc_Enter))
   ;	
	mov	ax,word ptr [bp-34]
	or	ax,word ptr [bp-32]
	or	ax,word ptr [bp-30]
	or	ax,word ptr [bp-28]
	jne	short @29@434
	cmp	word ptr [bp+12],2
	je	short @29@410
	cmp	word ptr [bp+12],3
	je	@@19
	jmp	@29@1874
@@19:
@29@410:
	cmp	byte ptr DGROUP:_LastScan,28
	je	@@20
	jmp	@29@1874
@@20:
@29@434:
   ;	
   ;	  {
   ;	   tick=TimeCount=picked=0;
   ;	
	xor	ax,ax
	mov	word ptr [bp-12],ax
	cwd	
	mov	word ptr DGROUP:_TimeCount,ax
	mov	word ptr DGROUP:_TimeCount+2,dx
	mov	word ptr [bp-6],ax
   ;	
   ;	   SETFONTCOLOR(0,TEXTCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,0
	mov	byte ptr DGROUP:_backcolor,23
@29@458:
   ;	
   ;	
   ;	   do
   ;	   {
   ;		int button,result=0;
   ;	
	xor	di,di
   ;	
   ;	
   ;	
   ;		if (type==KEYBOARDBTNS||type==KEYBOARDMOVE)
   ;	
	cmp	word ptr [bp+12],2
	je	short @29@506
	cmp	word ptr [bp+12],3
	jne	short @29@530
@29@506:
   ;	
   ;		  IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
@29@530:
   ;	
   ;	
   ;		//
   ;		// FLASH CURSOR
   ;		//
   ;		if (TimeCount>10)
   ;	
	cmp	word ptr DGROUP:_TimeCount+2,0
	jb	short @29@770
	ja	short @29@602
	cmp	word ptr DGROUP:_TimeCount,10
	jbe	short @29@770
@29@602:
   ;	
   ;		{
   ;		 switch(tick)
   ;	
	mov	ax,word ptr [bp-6]
	or	ax,ax
	je	short @29@698
	cmp	ax,1
	je	short @29@722
	jmp	short @29@746
@29@698:
   ;	
   ;		 {
   ;		  case 0:
   ;		VWB_Bar(x,PrintY+1,CST_SPC-2,10,TEXTCOLOR);
   ;	
	mov	ax,23
	push	ax
	mov	ax,10
	push	ax
	mov	ax,48
	push	ax
	mov	ax,word ptr DGROUP:_PrintY
	inc	ax
	push	ax
	push	word ptr [bp-10]
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;		break;
   ;	
	jmp	short @29@746
@29@722:
   ;	
   ;		  case 1:
   ;		PrintX=x;
   ;	
	mov	ax,word ptr [bp-10]
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;		US_Print("?");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1141
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		SD_PlaySound(HITWALLSND);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
@29@746:
   ;	
   ;		 }
   ;		 tick^=1;
   ;	
	xor	word ptr [bp-6],1
   ;	
   ;		 TimeCount=0;
   ;	
	mov	word ptr DGROUP:_TimeCount,0
	mov	word ptr DGROUP:_TimeCount+2,0
   ;	
   ;		 VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
@29@770:
   ;	
   ;		}
   ;	
   ;		//
   ;		// WHICH TYPE OF INPUT DO WE PROCESS?
   ;		//
   ;		switch(type)
   ;	
	mov	bx,word ptr [bp+12]
	cmp	bx,3
	jbe	@@21
	jmp	@29@1778
@@21:
	shl	bx,1
	jmp	word ptr cs:@29@C8926[bx]
@29@842:
   ;	
   ;		{
   ;		 case MOUSE:
   ;		   Mouse(3);
   ;	
	mov	ax,3
	int	51
   ;	
   ;		   button=_BX;
   ;	
	mov	word ptr [bp-14],bx
   ;	
   ;		   switch(button)
   ;	
	mov	ax,word ptr [bp-14]
	cmp	ax,1
	je	short @29@986
	cmp	ax,2
	je	short @29@1010
	cmp	ax,4
	je	short @29@1034
	jmp	short @29@1058
@29@986:
   ;	
   ;		   {
   ;		case 1: result=1; break;
   ;	
	mov	di,1
	jmp	short @29@1058
@29@1010:
   ;	
   ;		case 2: result=2; break;
   ;	
	mov	di,2
	jmp	short @29@1058
@29@1034:
   ;	
   ;		case 4: result=3; break;
   ;	
	mov	di,3
	jmp	short @29@1058
@29@1058:
   ;	
   ;		   }
   ;	
   ;		   if (result)
   ;	
	or	di,di
	je	short @29@1226
   ;	
   ;		   {
   ;		int z;
   ;	
   ;	
   ;		for (z=0;z<MAXBUTTONS;z++)
   ;	
	mov	word ptr [bp-16],0
	jmp	short @29@1178
@29@1106:
   ;	
   ;		  if (order[which]==buttonmouse[z])
   ;	
	mov	bx,word ptr [bp-16]
	shl	bx,1
	mov	al,byte ptr DGROUP:_order[si]
	cbw	
	cmp	word ptr DGROUP:_buttonmouse[bx],ax
	jne	short @29@1154
   ;	
   ;		  {
   ;		   buttonmouse[z]=bt_nobutton;
   ;	
	mov	bx,word ptr [bp-16]
	shl	bx,1
	mov	word ptr DGROUP:_buttonmouse[bx],65535
   ;	
   ;		   break;
   ;	
	jmp	short @29@1202
@29@1154:
	inc	word ptr [bp-16]
@29@1178:
	cmp	word ptr [bp-16],5
	jl	short @29@1106
@29@1202:
   ;	
   ;		  }
   ;	
   ;		buttonmouse[result-1]=order[which];
   ;	
	mov	bx,di
	shl	bx,1
	mov	al,byte ptr DGROUP:_order[si]
	cbw	
	mov	word ptr DGROUP:_buttonmouse[bx-2],ax
   ;	
   ;		picked=1;
   ;	
	mov	word ptr [bp-12],1
   ;	
   ;		SD_PlaySound(SHOOTDOORSND);
   ;	
	mov	ax,28
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
@29@1226:
   ;	
   ;		   }
   ;		   break;
   ;	
	jmp	@29@1778
@29@1250:
   ;	
   ;	
   ;		 case JOYSTICK:
   ;		   if (ci.button0) result=1;
   ;	
	cmp	word ptr [bp-34],0
	je	short @29@1298
	mov	di,1
	jmp	short @29@1442
@29@1298:
   ;	
   ;		   else
   ;		   if (ci.button1) result=2;
   ;	
	cmp	word ptr [bp-32],0
	je	short @29@1346
	mov	di,2
	jmp	short @29@1442
@29@1346:
   ;	
   ;		   else
   ;		   if (ci.button2) result=3;
   ;	
	cmp	word ptr [bp-30],0
	je	short @29@1394
	mov	di,3
	jmp	short @29@1442
@29@1394:
   ;	
   ;		   else
   ;		   if (ci.button3) result=4;
   ;	
	cmp	word ptr [bp-28],0
	je	short @29@1442
	mov	di,4
@29@1442:
   ;	
   ;	
   ;		   if (result)
   ;	
	or	di,di
	je	short @29@1610
   ;	
   ;		   {
   ;		int z;
   ;	
   ;	
   ;		for (z=0;z<MAXBUTTONS;z++)
   ;	
	mov	word ptr [bp-16],0
	jmp	short @29@1562
@29@1490:
   ;	
   ;		  if (order[which]==buttonjoy[z])
   ;	
	mov	bx,word ptr [bp-16]
	shl	bx,1
	mov	al,byte ptr DGROUP:_order[si]
	cbw	
	cmp	word ptr DGROUP:_buttonjoy[bx],ax
	jne	short @29@1538
   ;	
   ;		  {
   ;		   buttonjoy[z]=bt_nobutton;
   ;	
	mov	bx,word ptr [bp-16]
	shl	bx,1
	mov	word ptr DGROUP:_buttonjoy[bx],65535
   ;	
   ;		   break;
   ;	
	jmp	short @29@1586
@29@1538:
	inc	word ptr [bp-16]
@29@1562:
	cmp	word ptr [bp-16],5
	jl	short @29@1490
@29@1586:
   ;	
   ;		  }
   ;	
   ;		buttonjoy[result-1]=order[which];
   ;	
	mov	bx,di
	shl	bx,1
	mov	al,byte ptr DGROUP:_order[si]
	cbw	
	mov	word ptr DGROUP:_buttonjoy[bx-2],ax
   ;	
   ;		picked=1;
   ;	
	mov	word ptr [bp-12],1
   ;	
   ;		SD_PlaySound(SHOOTDOORSND);
   ;	
	mov	ax,28
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
@29@1610:
   ;	
   ;		   }
   ;		   break;
   ;	
	jmp	short @29@1778
@29@1634:
   ;	
   ;	
   ;		 case KEYBOARDBTNS:
   ;		   if (LastScan)
   ;	
	cmp	byte ptr DGROUP:_LastScan,0
	je	short @29@1682
   ;	
   ;		   {
   ;		buttonscan[order[which]]=LastScan;
   ;	
	mov	al,byte ptr DGROUP:_order[si]
	cbw	
	shl	ax,1
	mov	dl,byte ptr DGROUP:_LastScan
	mov	dh,0
	mov	bx,ax
	mov	word ptr DGROUP:_buttonscan[bx],dx
   ;	
   ;		picked=1;
   ;	
	mov	word ptr [bp-12],1
   ;	
   ;		ShootSnd();
   ;	
	call	near ptr _ShootSnd
   ;	
   ;		IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
@29@1682:
   ;	
   ;		   }
   ;		   break;
   ;	
	jmp	short @29@1778
@29@1706:
   ;	
   ;	
   ;		 case KEYBOARDMOVE:
   ;		   if (LastScan)
   ;	
	cmp	byte ptr DGROUP:_LastScan,0
	je	short @29@1754
   ;	
   ;		   {
   ;		dirscan[moveorder[which]]=LastScan;
   ;	
	mov	bx,si
	shl	bx,1
	mov	bx,word ptr DGROUP:_moveorder[bx]
	shl	bx,1
	mov	al,byte ptr DGROUP:_LastScan
	mov	ah,0
	mov	word ptr DGROUP:_dirscan[bx],ax
   ;	
   ;		picked=1;
   ;	
	mov	word ptr [bp-12],1
   ;	
   ;		ShootSnd();
   ;	
	call	near ptr _ShootSnd
   ;	
   ;		IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
@29@1754:
   ;	
   ;		   }
   ;		   break;
   ;	
	jmp	short @29@1778
@29@1778:
   ;	
   ;		}
   ;	
   ;		//
   ;		// EXIT INPUT?
   ;		//
   ;		if (IN_KeyDown(sc_Escape))
   ;	
	cmp	word ptr DGROUP:_Keyboard+2,0
	je	short @29@1826
   ;	
   ;		{
   ;		 picked=1;
   ;	
	mov	word ptr [bp-12],1
   ;	
   ;		 continue;
   ;	
	jmp	short @29@1826
@29@1826:
   ;	
   ;		}
   ;	
   ;	   } while(!picked);
   ;	
	cmp	word ptr [bp-12],0
	jne	@@22
	jmp	@29@458
@@22:
   ;	
   ;	
   ;	   SETFONTCOLOR(TEXTCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,23
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;	   redraw=1;
   ;	
	mov	word ptr [bp-8],1
   ;	
   ;	   WaitKeyUp();
   ;	
	call	near ptr _WaitKeyUp
   ;	
   ;	   continue;
   ;	
	jmp	@29@2474
@29@1874:
   ;	
   ;	  }
   ;	
   ;	  if (ci.button1 || IN_KeyDown(sc_Escape))
   ;	
	cmp	word ptr [bp-32],0
	jne	short @29@1922
	cmp	word ptr DGROUP:_Keyboard+2,0
	je	short @29@1946
@29@1922:
   ;	
   ;		exit=1;
   ;	
	mov	word ptr [bp-4],1
@29@1946:
   ;	
   ;	
   ;	  //
   ;	  // MOVE TO ANOTHER SPOT?
   ;	  //
   ;	  switch(ci.dir)
   ;	
	mov	bx,word ptr [bp-18]
	cmp	bx,6
	jbe	@@23
	jmp	@29@2474
@@23:
	shl	bx,1
	jmp	word ptr cs:@29@C9248[bx]
@29@2018:
   ;	
   ;	  {
   ;	   case dir_West:
   ;		 do
   ;		 {
   ;		  which--;
   ;	
	dec	si
   ;	
   ;		  if (which<0)
   ;	
	or	si,si
	jge	short @29@2066
   ;	
   ;		which=MAXBUTTONS-1;
   ;	
	mov	si,4
@29@2066:
   ;	
   ;		 } while(!cust->allowed[which]);
   ;	
	mov	ax,si
	shl	ax,1
	mov	bx,word ptr [bp+6]
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @29@2018
   ;	
   ;		 redraw=1;
   ;	
	mov	word ptr [bp-8],1
   ;	
   ;		 SD_PlaySound(MOVEGUN1SND);
   ;	
	mov	ax,5
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
	jmp	short @29@2114
@29@2114:
   ;	
   ;		 while(ReadAnyControl(&ci),ci.dir!=dir_None);
   ;	
	lea	ax,word ptr [bp-34]
	push	ax
	call	near ptr _ReadAnyControl
	pop	cx
	cmp	word ptr [bp-18],8
	je	short @29@2162
	mov	ax,1
	jmp	short @29@2186
@29@2162:
	xor	ax,ax
@29@2186:
	or	ax,ax
	jne	short @29@2114
   ;	
   ;		 IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;		 break;
   ;	
	jmp	short @29@2474
@29@2234:
   ;	
   ;	
   ;	   case dir_East:
   ;		 do
   ;		 {
   ;		  which++;
   ;	
	inc	si
   ;	
   ;		  if (which>MAXBUTTONS-1)
   ;	
	cmp	si,4
	jle	short @29@2282
   ;	
   ;		which=0;
   ;	
	xor	si,si
@29@2282:
   ;	
   ;		 } while(!cust->allowed[which]);
   ;	
	mov	ax,si
	shl	ax,1
	mov	bx,word ptr [bp+6]
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @29@2234
   ;	
   ;		 redraw=1;
   ;	
	mov	word ptr [bp-8],1
   ;	
   ;		 SD_PlaySound(MOVEGUN1SND);
   ;	
	mov	ax,5
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
	jmp	short @29@2330
@29@2330:
   ;	
   ;		 while(ReadAnyControl(&ci),ci.dir!=dir_None);
   ;	
	lea	ax,word ptr [bp-34]
	push	ax
	call	near ptr _ReadAnyControl
	pop	cx
	cmp	word ptr [bp-18],8
	je	short @29@2378
	mov	ax,1
	jmp	short @29@2402
@29@2378:
	xor	ax,ax
@29@2402:
	or	ax,ax
	jne	short @29@2330
   ;	
   ;		 IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;		 break;
   ;	
	jmp	short @29@2474
@29@2450:
   ;	
   ;	   case dir_North:
   ;	   case dir_South:
   ;		 exit=1;
   ;	
	mov	word ptr [bp-4],1
@29@2474:
   ;	
   ;	  }
   ;	 } while(!exit);
   ;	
	cmp	word ptr [bp-4],0
	jne	@@24
	jmp	@29@146
@@24:
   ;	
   ;	
   ;	 SD_PlaySound(ESCPRESSEDSND);
   ;	
	mov	ax,39
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;	 WaitKeyUp();
   ;	
	call	near ptr _WaitKeyUp
   ;	
   ;	 DrawWindow(5,PrintY-1,310,13,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,13
	push	ax
	mov	ax,310
	push	ax
	mov	ax,word ptr DGROUP:_PrintY
	dec	ax
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_EnterCtrlData	endp
@29@C9248	label	word
	dw	@29@2450
	dw	@29@2474
	dw	@29@2234
	dw	@29@2474
	dw	@29@2450
	dw	@29@2474
	dw	@29@2018
@29@C8926	label	word
	dw	@29@842
	dw	@29@1250
	dw	@29@1634
	dw	@29@1706
_TEXT	ends
_DATA	segment word public 'DATA'
	db	255
	db	255
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void FixupCustom(int w)
   ;	
	assume	cs:_TEXT
_FixupCustom	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{
   ;		static int lastwhich=-1;
   ;		int y=CST_Y+26+w*13;
   ;	
	mov	ax,di
	mov	dx,13
	imul	dx
	add	ax,74
	mov	si,ax
   ;	
   ;	
   ;	
   ;		VWB_Hlin(7,32,y-1,DEACTIVE);
   ;	
	mov	ax,43
	push	ax
	mov	ax,si
	dec	ax
	push	ax
	mov	ax,32
	push	ax
	mov	ax,7
	push	ax
	call	near ptr _VWB_Hlin
	add	sp,8
   ;	
   ;		VWB_Hlin(7,32,y+12,BORD2COLOR);
   ;	
	mov	ax,35
	push	ax
	mov	ax,si
	add	ax,12
	push	ax
	mov	ax,32
	push	ax
	mov	ax,7
	push	ax
	call	near ptr _VWB_Hlin
	add	sp,8
   ;	
   ;	#ifndef SPEAR
   ;		VWB_Hlin(7,32,y-2,BORDCOLOR);
   ;	
	mov	ax,41
	push	ax
	mov	ax,si
	add	ax,65534
	push	ax
	mov	ax,32
	push	ax
	mov	ax,7
	push	ax
	call	near ptr _VWB_Hlin
	add	sp,8
   ;	
   ;		VWB_Hlin(7,32,y+13,BORDCOLOR);
   ;	
	mov	ax,41
	push	ax
	mov	ax,si
	add	ax,13
	push	ax
	mov	ax,32
	push	ax
	mov	ax,7
	push	ax
	call	near ptr _VWB_Hlin
	add	sp,8
   ;	
   ;	#else
   ;		VWB_Hlin(7,32,y-2,BORD2COLOR);
   ;		VWB_Hlin(7,32,y+13,BORD2COLOR);
   ;	#endif
   ;	
   ;		switch(w)
   ;	
	mov	bx,di
	cmp	bx,8
	ja	short @30@218
	shl	bx,1
	jmp	word ptr cs:@30@C1566[bx]
@30@122:
   ;	
   ;		{
   ;			case 0: DrawCustMouse(1); break;
   ;	
	mov	ax,1
	push	ax
	call	near ptr _DrawCustMouse
	pop	cx
	jmp	short @30@218
@30@146:
   ;	
   ;			case 3: DrawCustJoy(1); break;
   ;	
	mov	ax,1
	push	ax
	call	near ptr _DrawCustJoy
	pop	cx
	jmp	short @30@218
@30@170:
   ;	
   ;			case 6: DrawCustKeybd(1); break;
   ;	
	mov	ax,1
	push	ax
	call	near ptr _DrawCustKeybd
	pop	cx
	jmp	short @30@218
@30@194:
   ;	
   ;			case 8: DrawCustKeys(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _DrawCustKeys
	pop	cx
@30@218:
   ;	
   ;		}
   ;	
   ;	
   ;		if (lastwhich>=0)
   ;	
	cmp	word ptr DGROUP:d@w+610,0
	jge	@@25
	jmp	@30@434
@@25:
   ;	
   ;		{
   ;			y=CST_Y+26+lastwhich*13;
   ;	
	mov	ax,word ptr DGROUP:d@w+610
	mov	dx,13
	imul	dx
	add	ax,74
	mov	si,ax
   ;	
   ;			VWB_Hlin(7,32,y-1,DEACTIVE);
   ;	
	mov	ax,43
	push	ax
	mov	ax,si
	dec	ax
	push	ax
	mov	ax,32
	push	ax
	mov	ax,7
	push	ax
	call	near ptr _VWB_Hlin
	add	sp,8
   ;	
   ;			VWB_Hlin(7,32,y+12,BORD2COLOR);
   ;	
	mov	ax,35
	push	ax
	mov	ax,si
	add	ax,12
	push	ax
	mov	ax,32
	push	ax
	mov	ax,7
	push	ax
	call	near ptr _VWB_Hlin
	add	sp,8
   ;	
   ;	#ifndef SPEAR
   ;			VWB_Hlin(7,32,y-2,BORDCOLOR);
   ;	
	mov	ax,41
	push	ax
	mov	ax,si
	add	ax,65534
	push	ax
	mov	ax,32
	push	ax
	mov	ax,7
	push	ax
	call	near ptr _VWB_Hlin
	add	sp,8
   ;	
   ;			VWB_Hlin(7,32,y+13,BORDCOLOR);
   ;	
	mov	ax,41
	push	ax
	mov	ax,si
	add	ax,13
	push	ax
	mov	ax,32
	push	ax
	mov	ax,7
	push	ax
	call	near ptr _VWB_Hlin
	add	sp,8
   ;	
   ;	#else
   ;			VWB_Hlin(7,32,y-2,BORD2COLOR);
   ;			VWB_Hlin(7,32,y+13,BORD2COLOR);
   ;	#endif
   ;	
   ;			if (lastwhich!=w)
   ;	
	cmp	word ptr DGROUP:d@w+610,di
	je	short @30@434
   ;	
   ;				switch(lastwhich)
   ;	
	mov	bx,word ptr DGROUP:d@w+610
	cmp	bx,8
	ja	short @30@434
	shl	bx,1
	jmp	word ptr cs:@30@C1704[bx]
@30@338:
   ;	
   ;				{
   ;					case 0: DrawCustMouse(0); break;
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _DrawCustMouse
	pop	cx
	jmp	short @30@434
@30@362:
   ;	
   ;					case 3: DrawCustJoy(0); break;
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _DrawCustJoy
	pop	cx
	jmp	short @30@434
@30@386:
   ;	
   ;					case 6: DrawCustKeybd(0); break;
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _DrawCustKeybd
	pop	cx
	jmp	short @30@434
@30@410:
   ;	
   ;					case 8: DrawCustKeys(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _DrawCustKeys
	pop	cx
@30@434:
   ;	
   ;				}
   ;		}
   ;	
   ;		lastwhich=w;
   ;	
	mov	word ptr DGROUP:d@w+610,di
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_FixupCustom	endp
@30@C1704	label	word
	dw	@30@338
	dw	@30@434
	dw	@30@434
	dw	@30@362
	dw	@30@434
	dw	@30@434
	dw	@30@386
	dw	@30@434
	dw	@30@410
@30@C1566	label	word
	dw	@30@122
	dw	@30@218
	dw	@30@218
	dw	@30@146
	dw	@30@218
	dw	@30@218
	dw	@30@170
	dw	@30@218
	dw	@30@194
   ;	
   ;	void DrawCustomScreen(void)
   ;	
	assume	cs:_TEXT
_DrawCustomScreen	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int i;
   ;	
   ;	
   ;	#ifdef JAPAN
   ;		CA_CacheScreen(S_CUSTOMPIC);
   ;		fontnumber=1;
   ;	
   ;		PrintX=CST_START;
   ;		PrintY = CST_Y+26;
   ;		DrawCustMouse(0);
   ;	
   ;		PrintX=CST_START;
   ;		US_Print("\n\n\n");
   ;		DrawCustJoy(0);
   ;	
   ;		PrintX=CST_START;
   ;		US_Print("\n\n\n");
   ;		DrawCustKeybd(0);
   ;	
   ;		PrintX=CST_START;
   ;		US_Print("\n\n\n");
   ;		DrawCustKeys(0);
   ;	#else
   ;		ClearMScreen();
   ;	
	call	near ptr _ClearMScreen
   ;	
   ;		WindowX=0;
   ;	
	mov	word ptr DGROUP:_WindowX,0
   ;	
   ;		WindowW=320;
   ;	
	mov	word ptr DGROUP:_WindowW,320
   ;	
   ;		VWB_DrawPic(112,184,C_MOUSELBACKPIC);
   ;	
	mov	ax,18
	push	ax
	mov	ax,184
	push	ax
	mov	ax,112
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		DrawStripes(10);
   ;	
	mov	ax,10
	push	ax
	call	near ptr _DrawStripes
	pop	cx
   ;	
   ;		VWB_DrawPic(80,0,C_CUSTOMIZEPIC);
   ;	
	mov	ax,27
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,80
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;	
   ;		//
   ;		// MOUSE
   ;		//
   ;		SETFONTCOLOR(READCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,74
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;		WindowX=0;
   ;	
	mov	word ptr DGROUP:_WindowX,0
   ;	
   ;		WindowW=320;
   ;	
	mov	word ptr DGROUP:_WindowW,320
   ;	
   ;	
   ;	#ifndef SPEAR
   ;		PrintY=CST_Y;
   ;	
	mov	word ptr DGROUP:_PrintY,48
   ;	
   ;		US_CPrint("Mouse\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1143
	push	ax
	call	near ptr _US_CPrint
	pop	cx
	pop	cx
   ;	
   ;	#else
   ;		PrintY = CST_Y+13;
   ;		VWB_DrawPic (128,48,C_MOUSEPIC);
   ;	#endif
   ;	
   ;		SETFONTCOLOR(TEXTCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,23
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;		#ifdef SPANISH
   ;		PrintX=CST_START-16;
   ;		US_Print(STR_CRUN);
   ;		PrintX=CST_START-16+CST_SPC*1;
   ;		US_Print(STR_COPEN);
   ;		PrintX=CST_START-16+CST_SPC*2;
   ;		US_Print(STR_CFIRE);
   ;		PrintX=CST_START-16+CST_SPC*3;
   ;		US_Print(STR_CSTRAFE"\n");
   ;		#else
   ;		PrintX=CST_START;
   ;	
	mov	word ptr DGROUP:_PrintX,60
   ;	
   ;		US_Print(STR_CRUN);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1150
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		PrintX=CST_START+CST_SPC*1;
   ;	
	mov	word ptr DGROUP:_PrintX,110
   ;	
   ;		US_Print(STR_COPEN);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1154
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		PrintX=CST_START+CST_SPC*2;
   ;	
	mov	word ptr DGROUP:_PrintX,160
   ;	
   ;		US_Print(STR_CFIRE);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1159
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		PrintX=CST_START+CST_SPC*3;
   ;	
	mov	word ptr DGROUP:_PrintX,210
   ;	
   ;		US_Print(STR_CSTRL);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1164
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		PrintX=CST_START+CST_SPC*4;
   ;	
	mov	word ptr DGROUP:_PrintX,260
   ;	
   ;		US_Print(STR_CSTRR"\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1166
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		#endif
   ;	
   ;		DrawWindow(5,PrintY-1,310,13,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,13
	push	ax
	mov	ax,310
	push	ax
	mov	ax,word ptr DGROUP:_PrintY
	dec	ax
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;		DrawCustMouse(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _DrawCustMouse
	pop	cx
   ;	
   ;		US_Print("\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1169
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;	
   ;	
   ;		//
   ;		// JOYSTICK/PAD
   ;		//
   ;	#ifndef SPEAR
   ;		SETFONTCOLOR(READCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,74
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;		US_CPrint("Joystick/Gravis GamePad\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1171
	push	ax
	call	near ptr _US_CPrint
	pop	cx
	pop	cx
   ;	
   ;	#else
   ;		PrintY += 13;
   ;		VWB_DrawPic (40,88,C_JOYSTICKPIC);
   ;	#endif
   ;	
   ;	#ifdef SPEAR
   ;		VWB_DrawPic (112,120,C_KEYBOARDPIC);
   ;	#endif
   ;	
   ;		SETFONTCOLOR(TEXTCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,23
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;		#ifdef SPANISH
   ;		PrintX=CST_START-16;
   ;		US_Print(STR_CRUN);
   ;		PrintX=CST_START-16+CST_SPC*1;
   ;		US_Print(STR_COPEN);
   ;		PrintX=CST_START-16+CST_SPC*2;
   ;		US_Print(STR_CFIRE);
   ;		PrintX=CST_START-16+CST_SPC*3;
   ;		US_Print(STR_CSTRAFE"\n");
   ;		#else
   ;		PrintX=CST_START;
   ;	
	mov	word ptr DGROUP:_PrintX,60
   ;	
   ;		US_Print(STR_CRUN);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1196
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		PrintX=CST_START+CST_SPC*1;
   ;	
	mov	word ptr DGROUP:_PrintX,110
   ;	
   ;		US_Print(STR_COPEN);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1200
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		PrintX=CST_START+CST_SPC*2;
   ;	
	mov	word ptr DGROUP:_PrintX,160
   ;	
   ;		US_Print(STR_CFIRE);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1205
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		PrintX=CST_START+CST_SPC*3;
   ;	
	mov	word ptr DGROUP:_PrintX,210
   ;	
   ;		US_Print(STR_CSTRL);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1210
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		PrintX=CST_START+CST_SPC*4;
   ;	
	mov	word ptr DGROUP:_PrintX,260
   ;	
   ;		US_Print(STR_CSTRR"\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1212
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		#endif
   ;		DrawWindow(5,PrintY-1,310,13,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,13
	push	ax
	mov	ax,310
	push	ax
	mov	ax,word ptr DGROUP:_PrintY
	dec	ax
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;		DrawCustJoy(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _DrawCustJoy
	pop	cx
   ;	
   ;		US_Print("\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1215
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;	
   ;	
   ;		//
   ;		// KEYBOARD
   ;		//
   ;	#ifndef SPEAR
   ;		SETFONTCOLOR(READCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,74
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;		US_CPrint("Keyboard\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1217
	push	ax
	call	near ptr _US_CPrint
	pop	cx
	pop	cx
   ;	
   ;	#else
   ;		PrintY += 13;
   ;	#endif
   ;		SETFONTCOLOR(TEXTCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,23
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;		#ifdef SPANISH
   ;		PrintX=CST_START-16;
   ;		US_Print(STR_CRUN);
   ;		PrintX=CST_START-16+CST_SPC*1;
   ;		US_Print(STR_COPEN);
   ;		PrintX=CST_START-16+CST_SPC*2;
   ;		US_Print(STR_CFIRE);
   ;		PrintX=CST_START-16+CST_SPC*3;
   ;		US_Print(STR_CSTRL"\n");
   ;		PrintX=CST_START-16+CST_SPC*4;
   ;		US_Print(STR_CSTRR"\n");
   ;		#else
   ;		PrintX=CST_START;
   ;	
	mov	word ptr DGROUP:_PrintX,60
   ;	
   ;		US_Print(STR_CRUN);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1227
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		PrintX=CST_START+CST_SPC*1;
   ;	
	mov	word ptr DGROUP:_PrintX,110
   ;	
   ;		US_Print(STR_COPEN);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1231
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		PrintX=CST_START+CST_SPC*2;
   ;	
	mov	word ptr DGROUP:_PrintX,160
   ;	
   ;		US_Print(STR_CFIRE);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1236
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		PrintX=CST_START+CST_SPC*3;
   ;	
	mov	word ptr DGROUP:_PrintX,210
   ;	
   ;		US_Print(STR_CSTRL);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1241
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		PrintX=CST_START+CST_SPC*4;
   ;	
	mov	word ptr DGROUP:_PrintX,260
   ;	
   ;		US_Print(STR_CSTRR"\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1243
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		#endif
   ;		DrawWindow(5,PrintY-1,310,13,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,13
	push	ax
	mov	ax,310
	push	ax
	mov	ax,word ptr DGROUP:_PrintY
	dec	ax
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;		DrawCustKeybd(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _DrawCustKeybd
	pop	cx
   ;	
   ;		US_Print("\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1246
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;	
   ;	
   ;		//
   ;		// KEYBOARD MOVE KEYS
   ;		//
   ;		SETFONTCOLOR(TEXTCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,23
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;		#ifdef SPANISH
   ;		PrintX=4;
   ;		US_Print(STR_LEFT);
   ;		US_Print("/");
   ;		US_Print(STR_RIGHT);
   ;		US_Print("/");
   ;		US_Print(STR_FRWD);
   ;		US_Print("/");
   ;		US_Print(STR_BKWD"\n");
   ;		#else
   ;		PrintX=CST_START;
   ;	
	mov	word ptr DGROUP:_PrintX,60
   ;	
   ;		US_Print(STR_LEFT);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1248
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		PrintX=CST_START+CST_SPC*1;
   ;	
	mov	word ptr DGROUP:_PrintX,110
   ;	
   ;		US_Print(STR_RIGHT);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1253
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		PrintX=CST_START+CST_SPC*2;
   ;	
	mov	word ptr DGROUP:_PrintX,160
   ;	
   ;		US_Print(STR_FRWD);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1259
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		PrintX=CST_START+CST_SPC*3;
   ;	
	mov	word ptr DGROUP:_PrintX,210
   ;	
   ;		US_Print(STR_BKWD"\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1264
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		#endif
   ;		DrawWindow(5,PrintY-1,310,13,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,13
	push	ax
	mov	ax,310
	push	ax
	mov	ax,word ptr DGROUP:_PrintY
	dec	ax
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;		DrawCustKeys(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _DrawCustKeys
	pop	cx
   ;	
   ;	#endif
   ;		//
   ;		// PICK STARTING POINT IN MENU
   ;		//
   ;		if (CusItems.curpos<0)
   ;	
	cmp	word ptr DGROUP:_CusItems+6,0
	jge	short @31@170
   ;	
   ;			for (i=0;i<CusItems.amount;i++)
   ;	
	xor	si,si
	jmp	short @31@146
@31@74:
   ;	
   ;				if (CusMenu[i].active)
   ;	
	mov	ax,si
	mov	dx,40
	imul	dx
	mov	dx,seg _CusMenu
	mov	bx,ax
	mov	es,dx
	cmp	word ptr es:_CusMenu[bx],0
	je	short @31@122
   ;	
   ;				{
   ;					CusItems.curpos=i;
   ;	
	mov	word ptr DGROUP:_CusItems+6,si
   ;	
   ;					break;
   ;	
	jmp	short @31@170
@31@122:
	inc	si
@31@146:
	cmp	si,word ptr DGROUP:_CusItems+4
	jl	short @31@74
@31@170:
   ;	
   ;				}
   ;	
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		MenuFadeIn();
   ;	
	mov	ax,10
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_DrawCustomScreen	endp
   ;	
   ;	void PrintCustMouse(int i)
   ;	
	assume	cs:_TEXT
_PrintCustMouse	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{
   ;		int j;
   ;	
   ;		for (j=0;j<MAXBUTTONS;j++)
   ;	
	xor	si,si
	jmp	short @32@122
@32@50:
   ;	
   ;			if (order[i]==buttonmouse[j])
   ;	
	mov	bx,si
	shl	bx,1
	mov	al,byte ptr DGROUP:_order[di]
	cbw	
	cmp	word ptr DGROUP:_buttonmouse[bx],ax
	jne	short @32@98
   ;	
   ;			{
   ;				PrintX=CST_START+CST_SPC*i;
   ;	
	mov	ax,di
	mov	dx,50
	imul	dx
	add	ax,60
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;				US_Print(mbarray[j]);
   ;	
	push	ds
	mov	ax,si
	mov	dx,3
	imul	dx
	add	ax,offset DGROUP:_mbarray
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;				break;
   ;	
	jmp	short @32@146
@32@98:
	inc	si
@32@122:
	cmp	si,5
	jl	short @32@50
@32@146:
   ;	
   ;			}
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_PrintCustMouse	endp
   ;	
   ;	void DrawCustMouse(int hilight)
   ;	
	assume	cs:_TEXT
_DrawCustMouse	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
   ;	
   ;	{
   ;		int i,color;
   ;	
   ;	
   ;		color=TEXTCOLOR;
   ;	
	mov	word ptr [bp-2],23
   ;	
   ;		if (hilight)
   ;	
	cmp	word ptr [bp+4],0
	je	short @33@74
   ;	
   ;			color=HIGHLIGHT;
   ;	
	mov	word ptr [bp-2],19
@33@74:
   ;	
   ;		SETFONTCOLOR(color,BKGDCOLOR);
   ;	
	mov	al,byte ptr [bp-2]
	mov	byte ptr DGROUP:_fontcolor,al
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;	
   ;		if (!mouseenabled)
   ;	
	cmp	word ptr DGROUP:_mouseenabled,0
	jne	short @33@122
   ;	
   ;		{
   ;			SETFONTCOLOR(DEACTIVE,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,43
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;			CusMenu[0].active=0;
   ;	
	mov	ax,seg _CusMenu
	mov	es,ax
	mov	word ptr es:_CusMenu,0
   ;	
   ;		}
   ;	
	jmp	short @33@146
@33@122:
   ;	
   ;		else
   ;			CusMenu[0].active=1;
   ;	
	mov	ax,seg _CusMenu
	mov	es,ax
	mov	word ptr es:_CusMenu,1
@33@146:
   ;	
   ;	
   ;		PrintY=CST_Y+13*2;
   ;	
	mov	word ptr DGROUP:_PrintY,74
   ;	
   ;		for (i=0;i<MAXBUTTONS;i++)
   ;	
	xor	si,si
	jmp	short @33@218
@33@170:
   ;	
   ;			PrintCustMouse(i);
   ;	
	push	si
	call	near ptr _PrintCustMouse
	pop	cx
	inc	si
@33@218:
	cmp	si,5
	jl	short @33@170
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_DrawCustMouse	endp
   ;	
   ;	void PrintCustJoy(int i)
   ;	
	assume	cs:_TEXT
_PrintCustJoy	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{
   ;		int j;
   ;	
   ;		for (j=0;j<MAXBUTTONS;j++)
   ;	
	xor	si,si
	jmp	short @34@122
@34@50:
   ;	
   ;			if (order[i]==buttonjoy[j])
   ;	
	mov	bx,si
	shl	bx,1
	mov	al,byte ptr DGROUP:_order[di]
	cbw	
	cmp	word ptr DGROUP:_buttonjoy[bx],ax
	jne	short @34@98
   ;	
   ;			{
   ;				PrintX=CST_START+CST_SPC*i;
   ;	
	mov	ax,di
	mov	dx,50
	imul	dx
	add	ax,60
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;				US_Print(mbarray[j]);
   ;	
	push	ds
	mov	ax,si
	mov	dx,3
	imul	dx
	add	ax,offset DGROUP:_mbarray
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;				break;
   ;	
	jmp	short @34@146
@34@98:
	inc	si
@34@122:
	cmp	si,5
	jl	short @34@50
@34@146:
   ;	
   ;			}
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_PrintCustJoy	endp
   ;	
   ;	void DrawCustJoy(int hilight)
   ;	
	assume	cs:_TEXT
_DrawCustJoy	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
   ;	
   ;	{
   ;		int i,color;
   ;	
   ;	
   ;		color=TEXTCOLOR;
   ;	
	mov	word ptr [bp-2],23
   ;	
   ;		if (hilight)
   ;	
	cmp	word ptr [bp+4],0
	je	short @35@74
   ;	
   ;			color=HIGHLIGHT;
   ;	
	mov	word ptr [bp-2],19
@35@74:
   ;	
   ;		SETFONTCOLOR(color,BKGDCOLOR);
   ;	
	mov	al,byte ptr [bp-2]
	mov	byte ptr DGROUP:_fontcolor,al
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;	
   ;		if (!joystickenabled)
   ;	
	cmp	word ptr DGROUP:_joystickenabled,0
	jne	short @35@122
   ;	
   ;		{
   ;			SETFONTCOLOR(DEACTIVE,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,43
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;			CusMenu[3].active=0;
   ;	
	mov	ax,seg _CusMenu
	mov	es,ax
	mov	word ptr es:_CusMenu+120,0
   ;	
   ;		}
   ;	
	jmp	short @35@146
@35@122:
   ;	
   ;		else
   ;			CusMenu[3].active=1;
   ;	
	mov	ax,seg _CusMenu
	mov	es,ax
	mov	word ptr es:_CusMenu+120,1
@35@146:
   ;	
   ;	
   ;		PrintY=CST_Y+13*5;
   ;	
	mov	word ptr DGROUP:_PrintY,113
   ;	
   ;		for (i=0;i<MAXBUTTONS;i++)
   ;	
	xor	si,si
	jmp	short @35@218
@35@170:
   ;	
   ;			PrintCustJoy(i);
   ;	
	push	si
	call	near ptr _PrintCustJoy
	pop	cx
	inc	si
@35@218:
	cmp	si,5
	jl	short @35@170
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_DrawCustJoy	endp
   ;	
   ;	void PrintCustKeybd(int i)
   ;	
	assume	cs:_TEXT
_PrintCustKeybd	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		PrintX=CST_START+CST_SPC*i;
   ;	
	mov	ax,si
	mov	dx,50
	imul	dx
	add	ax,60
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;		US_Print(IN_GetScanName(buttonscan[order[i]]));
   ;	
	push	ds
	mov	al,byte ptr DGROUP:_order[si]
	cbw	
	shl	ax,1
	mov	bx,ax
	mov	al,byte ptr DGROUP:_buttonscan[bx]
	push	ax
	call	near ptr _IN_GetScanName
	pop	cx
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_PrintCustKeybd	endp
   ;	
   ;	void DrawCustKeybd(int hilight)
   ;	
	assume	cs:_TEXT
_DrawCustKeybd	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
   ;	
   ;	{
   ;		int i,color;
   ;	
   ;	
   ;		color=TEXTCOLOR;
   ;	
	mov	word ptr [bp-2],23
   ;	
   ;		if (hilight)
   ;	
	cmp	word ptr [bp+4],0
	je	short @37@74
   ;	
   ;			color=HIGHLIGHT;
   ;	
	mov	word ptr [bp-2],19
@37@74:
   ;	
   ;		SETFONTCOLOR(color,BKGDCOLOR);
   ;	
	mov	al,byte ptr [bp-2]
	mov	byte ptr DGROUP:_fontcolor,al
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;	
   ;		PrintY=CST_Y+13*8;
   ;	
	mov	word ptr DGROUP:_PrintY,152
   ;	
   ;		for (i=0;i<MAXBUTTONS;i++)
   ;	
	xor	si,si
	jmp	short @37@146
@37@98:
   ;	
   ;			PrintCustKeybd(i);
   ;	
	push	si
	call	near ptr _PrintCustKeybd
	pop	cx
	inc	si
@37@146:
	cmp	si,5
	jl	short @37@98
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_DrawCustKeybd	endp
   ;	
   ;	void PrintCustKeys(int i)
   ;	
	assume	cs:_TEXT
_PrintCustKeys	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		PrintX=CST_START+CST_SPC*i;
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,50
	imul	dx
	add	ax,60
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;		US_Print(IN_GetScanName(dirscan[moveorder[i]]));
   ;	
	push	ds
	mov	bx,word ptr [bp+4]
	shl	bx,1
	mov	bx,word ptr DGROUP:_moveorder[bx]
	shl	bx,1
	mov	al,byte ptr DGROUP:_dirscan[bx]
	push	ax
	call	near ptr _IN_GetScanName
	pop	cx
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_PrintCustKeys	endp
   ;	
   ;	void DrawCustKeys(int hilight)
   ;	
	assume	cs:_TEXT
_DrawCustKeys	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
   ;	
   ;	{
   ;		int i,color;
   ;	
   ;	
   ;		color=TEXTCOLOR;
   ;	
	mov	word ptr [bp-2],23
   ;	
   ;		if (hilight)
   ;	
	cmp	word ptr [bp+4],0
	je	short @39@74
   ;	
   ;			color=HIGHLIGHT;
   ;	
	mov	word ptr [bp-2],19
@39@74:
   ;	
   ;		SETFONTCOLOR(color,BKGDCOLOR);
   ;	
	mov	al,byte ptr [bp-2]
	mov	byte ptr DGROUP:_fontcolor,al
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;	
   ;		PrintY=CST_Y+13*10;
   ;	
	mov	word ptr DGROUP:_PrintY,178
   ;	
   ;		for (i=0;i<MAXBUTTONS;i++)
   ;	
	xor	si,si
	jmp	short @39@146
@39@98:
   ;	
   ;			PrintCustKeys(i);
   ;	
	push	si
	call	near ptr _PrintCustKeys
	pop	cx
	inc	si
@39@146:
	cmp	si,5
	jl	short @39@98
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_DrawCustKeys	endp
   ;	
   ;	void CP_ChangeView(void)
   ;	
	assume	cs:_TEXT
_CP_ChangeView	proc	near
	push	bp
	mov	bp,sp
	sub	sp,20
	push	si
	push	di
   ;	
   ;	{
   ;		int exit=0,oldview,newview;
   ;	
	mov	word ptr [bp-2],0
   ;	
   ;		ControlInfo ci;
   ;	
   ;	
   ;		WindowX=WindowY=0;
   ;	
	xor	ax,ax
	mov	word ptr DGROUP:_WindowY,ax
	mov	word ptr DGROUP:_WindowX,ax
   ;	
   ;		WindowW=320;
   ;	
	mov	word ptr DGROUP:_WindowW,320
   ;	
   ;		WindowH=200;
   ;	
	mov	word ptr DGROUP:_WindowH,200
   ;	
   ;		newview=oldview=viewwidth/16;
   ;	
	mov	ax,word ptr DGROUP:_viewwidth
	mov	bx,16
	cwd	
	idiv	bx
	mov	di,ax
	mov	si,ax
   ;	
   ;		DrawChangeView(oldview);
   ;	
	push	di
	call	near ptr _DrawChangeView
	pop	cx
@40@50:
   ;	
   ;	
   ;		do
   ;		{
   ;			CheckPause();
   ;	
	call	near ptr _CheckPause
   ;	
   ;			ReadAnyControl(&ci);
   ;	
	lea	ax,word ptr [bp-20]
	push	ax
	call	near ptr _ReadAnyControl
	pop	cx
   ;	
   ;			switch(ci.dir)
   ;	
	mov	bx,word ptr [bp-4]
	cmp	bx,6
	ja	short @40@290
	shl	bx,1
	jmp	word ptr cs:@40@C2164[bx]
@40@146:
   ;	
   ;			{
   ;			case dir_South:
   ;			case dir_West:
   ;				newview--;
   ;	
	dec	si
   ;	
   ;				if (newview<4)
   ;	
	cmp	si,4
	jge	short @40@194
   ;	
   ;					newview=4;
   ;	
	mov	si,4
@40@194:
   ;	
   ;				ShowViewSize(newview);
   ;	
	push	si
	call	near ptr _ShowViewSize
	pop	cx
   ;	
   ;				VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;				SD_PlaySound(HITWALLSND);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;				TicDelay(10);
   ;	
	mov	ax,10
	push	ax
	call	near ptr _TicDelay
	pop	cx
   ;	
   ;				break;
   ;	
	jmp	short @40@290
@40@218:
   ;	
   ;	
   ;			case dir_North:
   ;			case dir_East:
   ;				newview++;
   ;	
	inc	si
   ;	
   ;				if (newview>19)
   ;	
	cmp	si,19
	jle	short @40@266
   ;	
   ;					newview=19;
   ;	
	mov	si,19
@40@266:
   ;	
   ;				ShowViewSize(newview);
   ;	
	push	si
	call	near ptr _ShowViewSize
	pop	cx
   ;	
   ;				VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;				SD_PlaySound(HITWALLSND);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;				TicDelay(10);
   ;	
	mov	ax,10
	push	ax
	call	near ptr _TicDelay
	pop	cx
   ;	
   ;				break;
   ;	
	jmp	short @40@290
@40@290:
   ;	
   ;			}
   ;	
   ;			#ifndef SPEAR
   ;			if (Keyboard[sc_Tab] && Keyboard[sc_P] && MS_CheckParm("goobers"))
   ;	
	cmp	word ptr DGROUP:_Keyboard+30,0
	je	short @40@386
	cmp	word ptr DGROUP:_Keyboard+50,0
	je	short @40@386
	push	ds
	mov	ax,offset DGROUP:s@+1271
	push	ax
	call	near ptr _MS_CheckParm
	pop	cx
	pop	cx
	or	ax,ax
	je	short @40@386
   ;	
   ;			#else
   ;			if (Keyboard[sc_Tab] && Keyboard[sc_P] && MS_CheckParm("debugmode"))
   ;			#endif
   ;				PicturePause();
   ;	
	call	near ptr _PicturePause
@40@386:
   ;	
   ;	
   ;			if (ci.button0 || Keyboard[sc_Enter])
   ;	
	cmp	word ptr [bp-20],0
	jne	short @40@434
	cmp	word ptr DGROUP:_Keyboard+56,0
	je	short @40@458
@40@434:
   ;	
   ;				exit=1;
   ;	
	mov	word ptr [bp-2],1
	jmp	short @40@530
@40@458:
   ;	
   ;			else
   ;			if (ci.button1 || Keyboard[sc_Escape])
   ;	
	cmp	word ptr [bp-18],0
	jne	short @40@506
	cmp	word ptr DGROUP:_Keyboard+2,0
	je	short @40@530
@40@506:
   ;	
   ;			{
   ;				viewwidth=oldview*16;
   ;	
	mov	ax,di
	mov	cl,4
	shl	ax,cl
	mov	word ptr DGROUP:_viewwidth,ax
   ;	
   ;				SD_PlaySound(ESCPRESSEDSND);
   ;	
	mov	ax,39
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;				MenuFadeOut();
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,43
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;				return;
   ;	
	jmp	short @40@626
@40@530:
   ;	
   ;			}
   ;	
   ;		} while(!exit);
   ;	
	cmp	word ptr [bp-2],0
	jne	@@26
	jmp	@40@50
@@26:
   ;	
   ;	
   ;	
   ;		if (oldview!=newview)
   ;	
	cmp	di,si
	je	short @40@602
   ;	
   ;		{
   ;			SD_PlaySound (SHOOTSND);
   ;	
	mov	ax,32
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			Message(STR_THINK"...");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1279
	push	ax
	call	near ptr _Message
	pop	cx
	pop	cx
   ;	
   ;			NewViewSize(newview);
   ;	
	push	si
	call	near ptr _NewViewSize
	pop	cx
@40@602:
   ;	
   ;		}
   ;	
   ;		ShootSnd();
   ;	
	call	near ptr _ShootSnd
   ;	
   ;		MenuFadeOut();
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,43
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
@40@626:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CP_ChangeView	endp
@40@C2164	label	word
	dw	@40@218
	dw	@40@290
	dw	@40@218
	dw	@40@290
	dw	@40@146
	dw	@40@290
	dw	@40@146
   ;	
   ;	void DrawChangeView(int view)
   ;	
	assume	cs:_TEXT
_DrawChangeView	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	#ifdef JAPAN
   ;		CA_CacheScreen(S_CHANGEPIC);
   ;	
   ;		ShowViewSize(view);
   ;	#else
   ;		VWB_Bar(0,160,320,40,VIEWCOLOR);
   ;	
	mov	ax,127
	push	ax
	mov	ax,40
	push	ax
	mov	ax,320
	push	ax
	mov	ax,160
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;		ShowViewSize(view);
   ;	
	push	word ptr [bp+4]
	call	near ptr _ShowViewSize
	pop	cx
   ;	
   ;	
   ;		PrintY=161;
   ;	
	mov	word ptr DGROUP:_PrintY,161
   ;	
   ;		WindowX=0;
   ;	
	mov	word ptr DGROUP:_WindowX,0
   ;	
   ;		WindowY=320;
   ;	
	mov	word ptr DGROUP:_WindowY,320
   ;	
   ;		SETFONTCOLOR(HIGHLIGHT,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,19
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;	
   ;		US_CPrint(STR_SIZE1"\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1291
	push	ax
	call	near ptr _US_CPrint
	pop	cx
	pop	cx
   ;	
   ;		US_CPrint(STR_SIZE2"\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1311
	push	ax
	call	near ptr _US_CPrint
	pop	cx
	pop	cx
   ;	
   ;		US_CPrint(STR_SIZE3);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1328
	push	ax
	call	near ptr _US_CPrint
	pop	cx
	pop	cx
   ;	
   ;	#endif
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	
   ;		MenuFadeIn();
   ;	
	mov	ax,10
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_DrawChangeView	endp
   ;	
   ;	void CP_Quit(void)
   ;	
	assume	cs:_TEXT
_CP_Quit	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
   ;	
   ;	{
   ;		int i;
   ;	
   ;	
   ;		#ifdef JAPAN
   ;		if (GetYorN(7,11,C_QUITMSGPIC))
   ;		#else
   ;	
   ;		#ifdef SPANISH
   ;		if (Confirm(ENDGAMESTR))
   ;		#else
   ;		if (Confirm(endStrings[US_RndT()&0x7+(US_RndT()&1)]))
   ;	
	call	near ptr _US_RndT
	push	ax
	call	near ptr _US_RndT
	and	ax,1
	add	ax,7
	mov	dx,ax
	pop	ax
	and	ax,dx
	mov	dx,80
	imul	dx
	mov	dx,seg _endStrings
	add	ax,offset _endStrings
	push	dx
	push	ax
	call	near ptr _Confirm
	pop	cx
	pop	cx
	or	ax,ax
	je	short @42@170
   ;	
   ;		#endif
   ;	
   ;		#endif
   ;		{
   ;			VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;			SD_MusicOff();
   ;	
	call	near ptr _SD_MusicOff
   ;	
   ;			SD_StopSound();
   ;	
	call	near ptr _SD_StopSound
   ;	
   ;			MenuFadeOut();
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,43
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;			//
   ;			// SHUT-UP THE ADLIB
   ;			//
   ;			for (i=1;i<=0xf5;i++)
   ;	
	mov	word ptr [bp-2],1
	jmp	short @42@122
@42@74:
   ;	
   ;				alOut(i,0);
   ;	
	mov	al,0
	push	ax
	mov	al,byte ptr [bp-2]
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
	inc	word ptr [bp-2]
@42@122:
	cmp	word ptr [bp-2],245
	jle	short @42@74
   ;	
   ;			Quit(NULL);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _Quit
	pop	cx
@42@170:
   ;	
   ;		}
   ;	
   ;		DrawMainMenu();
   ;	
	call	near ptr _DrawMainMenu
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_CP_Quit	endp
_TEXT	ends
_DATA	segment word public 'DATA'
	db	100
	db	0
	db	200
	db	0
	db	44
	db	1
	db	144
	db	1
	db	244
	db	1
	db	88
	db	2
	db	188
	db	2
	db	32
	db	3
	db	132
	db	3
	db	232
	db	3
	db	100
	db	0
	db	200
	db	0
	db	44
	db	1
	db	144
	db	1
	db	244
	db	1
	db	88
	db	2
	db	188
	db	2
	db	32
	db	3
	db	132
	db	3
	db	232
	db	3
	db	32
	db	0
	db	64
	db	0
	db	96
	db	0
	db	128
	db	0
	db	160
	db	0
	db	192
	db	0
	db	224
	db	0
	db	0
	db	1
	db	32
	db	1
	db	64
	db	1
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void IntroScreen(void)
   ;	
	assume	cs:_TEXT
_IntroScreen	proc	near
	push	bp
	mov	bp,sp
	sub	sp,72
	push	si
	push	ss
	lea	ax,word ptr [bp-32]
	push	ax
	push	ds
	mov	ax,offset DGROUP:d@w+612
	push	ax
	mov	cx,20
	call	near ptr N_SCOPY@
	push	ss
	lea	ax,word ptr [bp-52]
	push	ax
	push	ds
	mov	ax,offset DGROUP:d@w+632
	push	ax
	mov	cx,20
	call	near ptr N_SCOPY@
	push	ss
	lea	ax,word ptr [bp-72]
	push	ax
	push	ds
	mov	ax,offset DGROUP:d@w+652
	push	ax
	mov	cx,20
	call	near ptr N_SCOPY@
   ;	
   ;	{
   ;	#ifdef SPEAR
   ;	
   ;	#define MAINCOLOR	0x4f
   ;	#define EMSCOLOR	0x4f
   ;	#define XMSCOLOR	0x4f
   ;	
   ;	#else
   ;	
   ;	#define MAINCOLOR	0x6c
   ;	#define EMSCOLOR	0x6c
   ;	#define XMSCOLOR	0x6c
   ;	
   ;	#endif
   ;	#define FILLCOLOR	14
   ;	
   ;		long memory,emshere,xmshere;
   ;		int i,num,ems[10]={100,200,300,400,500,600,700,800,900,1000},
   ;			xms[10]={100,200,300,400,500,600,700,800,900,1000},
   ;			main[10]={32,64,96,128,160,192,224,256,288,320};
   ;	
   ;	
   ;		//
   ;		// DRAW MAIN MEMORY
   ;		//
   ;		memory=(1023l+mminfo.nearheap+mminfo.farheap)/1024l;
   ;	
	xor	ax,ax
	mov	dx,1024
	push	ax
	push	dx
	mov	ax,word ptr DGROUP:_mminfo+2
	mov	dx,word ptr DGROUP:_mminfo
	add	dx,word ptr DGROUP:_mminfo+4
	adc	ax,word ptr DGROUP:_mminfo+6
	add	dx,1023
	adc	ax,0
	push	ax
	push	dx
	call	near ptr N_LDIV@
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;		for (i=0;i<10;i++)
   ;	
	xor	si,si
	jmp	short @43@170
@43@50:
   ;	
   ;			if (memory>=main[i])
   ;	
	mov	bx,si
	shl	bx,1
	lea	ax,word ptr [bp-72]
	add	bx,ax
	mov	ax,word ptr [bx]
	cwd	
	cmp	dx,word ptr [bp-2]
	jg	short @43@146
	jne	short @43@122
	cmp	ax,word ptr [bp-4]
	ja	short @43@146
@43@122:
   ;	
   ;				VWB_Bar(49,163-8*i,6,5,MAINCOLOR-i);
   ;	
	mov	ax,108
	sub	ax,si
	push	ax
	mov	ax,5
	push	ax
	mov	ax,6
	push	ax
	mov	ax,si
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	dx,163
	sub	dx,ax
	push	dx
	mov	ax,49
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
@43@146:
	inc	si
@43@170:
	cmp	si,10
	jl	short @43@50
   ;	
   ;	
   ;	
   ;		//
   ;		// DRAW EMS MEMORY
   ;		//
   ;		if (EMSPresent)
   ;	
	cmp	word ptr DGROUP:_EMSPresent,0
	je	short @43@386
   ;	
   ;		{
   ;			emshere=4l*EMSPagesAvail;
   ;	
	mov	ax,word ptr DGROUP:_EMSPagesAvail
	xor	dx,dx
	mov	cl,2
	call	near ptr N_LXLSH@
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],dx
   ;	
   ;			for (i=0;i<10;i++)
   ;	
	xor	si,si
	jmp	short @43@362
@43@242:
   ;	
   ;				if (emshere>=ems[i])
   ;	
	mov	bx,si
	shl	bx,1
	lea	ax,word ptr [bp-32]
	add	bx,ax
	mov	ax,word ptr [bx]
	cwd	
	cmp	dx,word ptr [bp-6]
	jg	short @43@338
	jne	short @43@314
	cmp	ax,word ptr [bp-8]
	ja	short @43@338
@43@314:
   ;	
   ;					VWB_Bar(89,163-8*i,6,5,EMSCOLOR-i);
   ;	
	mov	ax,108
	sub	ax,si
	push	ax
	mov	ax,5
	push	ax
	mov	ax,6
	push	ax
	mov	ax,si
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	dx,163
	sub	dx,ax
	push	dx
	mov	ax,89
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
@43@338:
	inc	si
@43@362:
	cmp	si,10
	jl	short @43@242
@43@386:
   ;	
   ;		}
   ;	
   ;		//
   ;		// DRAW XMS MEMORY
   ;		//
   ;		if (XMSPresent)
   ;	
	cmp	word ptr DGROUP:_XMSPresent,0
	je	short @43@578
   ;	
   ;		{
   ;			xmshere=4l*XMSPagesAvail;
   ;	
	mov	ax,word ptr DGROUP:_XMSPagesAvail
	xor	dx,dx
	mov	cl,2
	call	near ptr N_LXLSH@
	mov	word ptr [bp-12],ax
	mov	word ptr [bp-10],dx
   ;	
   ;			for (i=0;i<10;i++)
   ;	
	xor	si,si
	jmp	short @43@554
@43@434:
   ;	
   ;				if (xmshere>=xms[i])
   ;	
	mov	bx,si
	shl	bx,1
	lea	ax,word ptr [bp-52]
	add	bx,ax
	mov	ax,word ptr [bx]
	cwd	
	cmp	dx,word ptr [bp-10]
	jg	short @43@530
	jne	short @43@506
	cmp	ax,word ptr [bp-12]
	ja	short @43@530
@43@506:
   ;	
   ;					VWB_Bar(129,163-8*i,6,5,XMSCOLOR-i);
   ;	
	mov	ax,108
	sub	ax,si
	push	ax
	mov	ax,5
	push	ax
	mov	ax,6
	push	ax
	mov	ax,si
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	dx,163
	sub	dx,ax
	push	dx
	mov	ax,129
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
@43@530:
	inc	si
@43@554:
	cmp	si,10
	jl	short @43@434
@43@578:
   ;	
   ;		}
   ;	
   ;		//
   ;		// FILL BOXES
   ;		//
   ;		if (MousePresent)
   ;	
	cmp	word ptr DGROUP:_MousePresent,0
	je	short @43@626
   ;	
   ;			VWB_Bar(164,82,12,2,FILLCOLOR);
   ;	
	mov	ax,14
	push	ax
	mov	ax,2
	push	ax
	mov	ax,12
	push	ax
	mov	ax,82
	push	ax
	mov	ax,164
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
@43@626:
   ;	
   ;	
   ;		if (JoysPresent[0] || JoysPresent[1])
   ;	
	cmp	word ptr DGROUP:_JoysPresent,0
	jne	short @43@674
	cmp	word ptr DGROUP:_JoysPresent+2,0
	je	short @43@698
@43@674:
   ;	
   ;			VWB_Bar(164,105,12,2,FILLCOLOR);
   ;	
	mov	ax,14
	push	ax
	mov	ax,2
	push	ax
	mov	ax,12
	push	ax
	mov	ax,105
	push	ax
	mov	ax,164
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
@43@698:
   ;	
   ;	
   ;		if (AdLibPresent && !SoundBlasterPresent)
   ;	
	cmp	word ptr DGROUP:_AdLibPresent,0
	je	short @43@770
	cmp	word ptr DGROUP:_SoundBlasterPresent,0
	jne	short @43@770
   ;	
   ;			VWB_Bar(164,128,12,2,FILLCOLOR);
   ;	
	mov	ax,14
	push	ax
	mov	ax,2
	push	ax
	mov	ax,12
	push	ax
	mov	ax,128
	push	ax
	mov	ax,164
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
@43@770:
   ;	
   ;	
   ;		if (SoundBlasterPresent)
   ;	
	cmp	word ptr DGROUP:_SoundBlasterPresent,0
	je	short @43@818
   ;	
   ;			VWB_Bar(164,151,12,2,FILLCOLOR);
   ;	
	mov	ax,14
	push	ax
	mov	ax,2
	push	ax
	mov	ax,12
	push	ax
	mov	ax,151
	push	ax
	mov	ax,164
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
@43@818:
   ;	
   ;	
   ;		if (SoundSourcePresent)
   ;	
	cmp	word ptr DGROUP:_SoundSourcePresent,0
	je	short @43@866
   ;	
   ;			VWB_Bar(164,174,12,2,FILLCOLOR);
   ;	
	mov	ax,14
	push	ax
	mov	ax,2
	push	ax
	mov	ax,12
	push	ax
	mov	ax,174
	push	ax
	mov	ax,164
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
@43@866:
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_IntroScreen	endp
   ;	
   ;	void ClearMScreen(void)
   ;	
	assume	cs:_TEXT
_ClearMScreen	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	#ifndef SPEAR
   ;		VWB_Bar(0,0,320,200,BORDCOLOR);
   ;	
	mov	ax,41
	push	ax
	mov	ax,200
	push	ax
	mov	ax,320
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;	#else
   ;		VWB_DrawPic(0,0,C_BACKDROPPIC);
   ;	#endif
   ;	}
   ;	
	pop	bp
	ret	
_ClearMScreen	endp
   ;	
   ;	void CacheLump(int lumpstart,int lumpend)
   ;	
	assume	cs:_TEXT
_CacheLump	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;	 int i;
   ;	
   ;	 for (i=lumpstart;i<=lumpend;i++)
   ;	
	mov	si,word ptr [bp+4]
	jmp	short @45@98
@45@50:
   ;	
   ;	   CA_CacheGrChunk(i);
   ;	
	push	si
	call	near ptr _CA_CacheGrChunk
	pop	cx
	inc	si
@45@98:
	cmp	si,word ptr [bp+6]
	jle	short @45@50
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_CacheLump	endp
   ;	
   ;	void UnCacheLump(int lumpstart,int lumpend)
   ;	
	assume	cs:_TEXT
_UnCacheLump	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;	 int i;
   ;	
   ;	 for (i=lumpstart;i<=lumpend;i++)
   ;	
	mov	si,word ptr [bp+4]
	jmp	short @46@122
@46@50:
   ;	
   ;		if (grsegs[i])
   ;	
	mov	bx,si
	shl	bx,1
	cmp	word ptr DGROUP:_grsegs[bx],0
	je	short @46@98
   ;	
   ;			UNCACHEGRCHUNK(i);
   ;	
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_grsegs
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded[si]
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded[si],al
@46@98:
	inc	si
@46@122:
	cmp	si,word ptr [bp+6]
	jle	short @46@50
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_UnCacheLump	endp
   ;	
   ;	void DrawWindow(int x,int y,int w,int h,int wcolor)
   ;	
	assume	cs:_TEXT
_DrawWindow	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		VWB_Bar(x,y,w,h,wcolor);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;		DrawOutline(x,y,w,h,BORD2COLOR,DEACTIVE);
   ;	
	mov	ax,43
	push	ax
	mov	ax,35
	push	ax
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _DrawOutline
	add	sp,12
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_DrawWindow	endp
   ;	
   ;	void DrawOutline(int x,int y,int w,int h,int color1,int color2)
   ;	
	assume	cs:_TEXT
_DrawOutline	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
	mov	si,word ptr [bp+6]
   ;	
   ;	{
   ;		VWB_Hlin(x,x+w,y,color2);
   ;	
	push	word ptr [bp+14]
	push	si
	mov	ax,di
	add	ax,word ptr [bp+8]
	push	ax
	push	di
	call	near ptr _VWB_Hlin
	add	sp,8
   ;	
   ;		VWB_Vlin(y,y+h,x,color2);
   ;	
	push	word ptr [bp+14]
	push	di
	mov	ax,si
	add	ax,word ptr [bp+10]
	push	ax
	push	si
	call	near ptr _VWB_Vlin
	add	sp,8
   ;	
   ;		VWB_Hlin(x,x+w,y+h,color1);
   ;	
	push	word ptr [bp+12]
	mov	ax,si
	add	ax,word ptr [bp+10]
	push	ax
	mov	ax,di
	add	ax,word ptr [bp+8]
	push	ax
	push	di
	call	near ptr _VWB_Hlin
	add	sp,8
   ;	
   ;		VWB_Vlin(y,y+h,x+w,color1);
   ;	
	push	word ptr [bp+12]
	mov	ax,di
	add	ax,word ptr [bp+8]
	push	ax
	mov	ax,si
	add	ax,word ptr [bp+10]
	push	ax
	push	si
	call	near ptr _VWB_Vlin
	add	sp,8
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_DrawOutline	endp
   ;	
   ;	void SetupControlPanel(void)
   ;	
	assume	cs:_TEXT
_SetupControlPanel	proc	near
	push	bp
	mov	bp,sp
	sub	sp,90
	push	si
	push	di
   ;	
   ;	{
   ;		struct ffblk f;
   ;		char name[13];
   ;		int which,i;
   ;	
   ;	
   ;		//
   ;		// CACHE GRAPHICS & SOUNDS
   ;		//
   ;		CA_CacheGrChunk(STARTFONT+1);
   ;	
	mov	ax,2
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;	#ifndef SPEAR
   ;		CacheLump(CONTROLS_LUMP_START,CONTROLS_LUMP_END);
   ;	
	mov	ax,42
	push	ax
	mov	ax,10
	push	ax
	call	near ptr _CacheLump
	pop	cx
	pop	cx
   ;	
   ;	#else
   ;		CacheLump(BACKDROP_LUMP_START,BACKDROP_LUMP_END);
   ;	#endif
   ;	
   ;		SETFONTCOLOR(TEXTCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,23
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;		fontnumber=1;
   ;	
	mov	word ptr DGROUP:_fontnumber,1
   ;	
   ;		WindowH=200;
   ;	
	mov	word ptr DGROUP:_WindowH,200
   ;	
   ;	
   ;		if (!ingame)
   ;	
	cmp	word ptr DGROUP:_ingame,0
	jne	short @49@74
   ;	
   ;			CA_LoadAllSounds();
   ;	
	call	near ptr _CA_LoadAllSounds
	jmp	short @49@98
@49@74:
   ;	
   ;		else
   ;			MainMenu[savegame].active=1;
   ;	
	mov	ax,seg _MainMenu
	mov	es,ax
	mov	word ptr es:_MainMenu+160,1
@49@98:
   ;	
   ;	
   ;		//
   ;		// SEE WHICH SAVE GAME FILES ARE AVAILABLE & READ STRING IN
   ;		//
   ;		strcpy(name,SaveName);
   ;	
	mov	ax,offset DGROUP:_SaveName
	push	ax
	lea	ax,word ptr [bp-58]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;		if (!findfirst(name,&f,0))
   ;	
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-44]
	push	ax
	lea	ax,word ptr [bp-58]
	push	ax
	call	near ptr _findfirst
	add	sp,6
	or	ax,ax
	jne	short @49@194
@49@122:
   ;	
   ;			do
   ;			{
   ;				which=f.ff_name[7]-'0';
   ;	
	mov	al,byte ptr [bp-7]
	cbw	
	add	ax,65488
	mov	si,ax
   ;	
   ;				if (which<10)
   ;	
	cmp	si,10
	jge	short @49@170
   ;	
   ;				{
   ;					int handle;
   ;					char temp[32];
   ;	
   ;					SaveGamesAvail[which]=1;
   ;	
	mov	bx,si
	shl	bx,1
	mov	word ptr DGROUP:_SaveGamesAvail[bx],1
   ;	
   ;					handle=open(f.ff_name,O_BINARY);
   ;	
	mov	ax,32768
	push	ax
	lea	ax,word ptr [bp-14]
	push	ax
	call	near ptr _open
	pop	cx
	pop	cx
	mov	di,ax
   ;	
   ;					read(handle,temp,32);
   ;	
	mov	ax,32
	push	ax
	lea	ax,word ptr [bp-90]
	push	ax
	push	di
	call	near ptr _read
	add	sp,6
   ;	
   ;					close(handle);
   ;	
	push	di
	call	near ptr _close
	pop	cx
   ;	
   ;					strcpy(&SaveGameNames[which][0],temp);
   ;	
	lea	ax,word ptr [bp-90]
	push	ax
	mov	ax,si
	mov	cl,5
	shl	ax,cl
	add	ax,offset DGROUP:_SaveGameNames
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
@49@170:
   ;	
   ;				}
   ;			} while(!findnext(&f));
   ;	
	lea	ax,word ptr [bp-44]
	push	ax
	call	near ptr _findnext
	pop	cx
	or	ax,ax
	je	short @49@122
@49@194:
   ;	
   ;	
   ;		//
   ;		// CENTER MOUSE
   ;		//
   ;		_CX=_DX=CENTER;
   ;	
	mov	ax,120
	mov	dx,ax
	mov	cx,ax
   ;	
   ;		Mouse(4);
   ;	
	mov	ax,4
	int	51
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_SetupControlPanel	endp
   ;	
   ;	void CleanupControlPanel(void)
   ;	
	assume	cs:_TEXT
_CleanupControlPanel	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	#ifndef SPEAR
   ;		UnCacheLump(CONTROLS_LUMP_START,CONTROLS_LUMP_END);
   ;	
	mov	ax,42
	push	ax
	mov	ax,10
	push	ax
	call	near ptr _UnCacheLump
	pop	cx
	pop	cx
   ;	
   ;	#else
   ;		UnCacheLump (BACKDROP_LUMP_START,BACKDROP_LUMP_END);
   ;	#endif
   ;	
   ;		fontnumber = 0;
   ;	
	mov	word ptr DGROUP:_fontnumber,0
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_CleanupControlPanel	endp
_TEXT	ends
_DATA	segment word public 'DATA'
	db	1
	db	0
	db	255
	db	255
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	int HandleMenu(CP_iteminfo *item_i,CP_itemtype far *items,void (*routine)(int w))
   ;	
	assume	cs:_TEXT
_HandleMenu	proc	near
	push	bp
	mov	bp,sp
	sub	sp,36
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{
   ;		char key;
   ;		static int redrawitem=1,lastitem=-1;
   ;		int i,x,y,basey,exit,which,shape,timer;
   ;		ControlInfo ci;
   ;	
   ;	
   ;		which=item_i->curpos;
   ;	
	mov	si,word ptr [di+6]
   ;	
   ;		x=item_i->x&-8;
   ;	
	mov	ax,word ptr [di]
	and	ax,65528
	mov	word ptr [bp-6],ax
   ;	
   ;		basey=item_i->y-2;
   ;	
	mov	ax,word ptr [di+2]
	add	ax,65534
	mov	word ptr [bp-10],ax
   ;	
   ;		y=basey+which*13;
   ;	
	mov	ax,si
	mov	dx,13
	imul	dx
	mov	dx,word ptr [bp-10]
	add	dx,ax
	mov	word ptr [bp-8],dx
   ;	
   ;	
   ;		VWB_DrawPic(x,y,C_CURSOR1PIC);
   ;	
	mov	ax,11
	push	ax
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		SetTextColor(items+which,1);
   ;	
	mov	ax,1
	push	ax
	mov	ax,si
	mov	dx,40
	imul	dx
	mov	dx,word ptr [bp+6]
	add	dx,ax
	push	word ptr [bp+8]
	push	dx
	call	near ptr _SetTextColor
	add	sp,6
   ;	
   ;		if (redrawitem)
   ;	
	cmp	word ptr DGROUP:d@w+672,0
	je	short @51@74
   ;	
   ;		{
   ;			PrintX=item_i->x+item_i->indent;
   ;	
	mov	ax,word ptr [di]
	add	ax,word ptr [di+8]
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;			PrintY=item_i->y+which*13;
   ;	
	mov	ax,si
	mov	dx,13
	imul	dx
	mov	dx,word ptr [di+2]
	add	dx,ax
	mov	word ptr DGROUP:_PrintY,dx
   ;	
   ;			US_Print((items+which)->string);
   ;	
	mov	ax,si
	mov	dx,40
	imul	dx
	mov	dx,word ptr [bp+6]
	add	dx,ax
	inc	dx
	inc	dx
	push	word ptr [bp+8]
	push	dx
	call	near ptr _US_Print
	pop	cx
	pop	cx
@51@74:
   ;	
   ;		}
   ;		//
   ;		// CALL CUSTOM ROUTINE IF IT IS NEEDED
   ;		//
   ;		if (routine)
   ;	
	cmp	word ptr [bp+10],0
	je	short @51@122
   ;	
   ;			routine(which);
   ;	
	push	si
	call	word ptr [bp+10]
	pop	cx
@51@122:
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	
   ;		shape=C_CURSOR1PIC;
   ;	
	mov	word ptr [bp-14],11
   ;	
   ;		timer=8;
   ;	
	mov	word ptr [bp-16],8
   ;	
   ;		exit=0;
   ;	
	mov	word ptr [bp-12],0
   ;	
   ;		TimeCount=0;
   ;	
	mov	word ptr DGROUP:_TimeCount,0
	mov	word ptr DGROUP:_TimeCount+2,0
   ;	
   ;		IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
@51@146:
   ;	
   ;	
   ;	
   ;		do
   ;		{
   ;			//
   ;			// CHANGE GUN SHAPE
   ;			//
   ;			if (TimeCount>timer)
   ;	
	mov	ax,word ptr [bp-16]
	cwd	
	cmp	dx,word ptr DGROUP:_TimeCount+2
	ja	short @51@362
	jb	short @51@218
	cmp	ax,word ptr DGROUP:_TimeCount
	jae	short @51@362
@51@218:
   ;	
   ;			{
   ;				TimeCount=0;
   ;	
	mov	word ptr DGROUP:_TimeCount,0
	mov	word ptr DGROUP:_TimeCount+2,0
   ;	
   ;				if (shape==C_CURSOR1PIC)
   ;	
	cmp	word ptr [bp-14],11
	jne	short @51@266
   ;	
   ;				{
   ;					shape=C_CURSOR2PIC;
   ;	
	mov	word ptr [bp-14],12
   ;	
   ;					timer=8;
   ;	
	mov	word ptr [bp-16],8
   ;	
   ;				}
   ;	
	jmp	short @51@290
@51@266:
   ;	
   ;				else
   ;				{
   ;					shape=C_CURSOR1PIC;
   ;	
	mov	word ptr [bp-14],11
   ;	
   ;					timer=70;
   ;	
	mov	word ptr [bp-16],70
@51@290:
   ;	
   ;				}
   ;				VWB_DrawPic(x,y,shape);
   ;	
	push	word ptr [bp-14]
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;				if (routine)
   ;	
	cmp	word ptr [bp+10],0
	je	short @51@338
   ;	
   ;					routine(which);
   ;	
	push	si
	call	word ptr [bp+10]
	pop	cx
@51@338:
   ;	
   ;				VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
@51@362:
   ;	
   ;			}
   ;	
   ;			CheckPause();
   ;	
	call	near ptr _CheckPause
   ;	
   ;	
   ;			//
   ;			// SEE IF ANY KEYS ARE PRESSED FOR INITIAL CHAR FINDING
   ;			//
   ;			key=LastASCII;
   ;	
	mov	al,byte ptr DGROUP:_LastASCII
	mov	byte ptr [bp-1],al
   ;	
   ;			if (key)
   ;	
	cmp	byte ptr [bp-1],0
	jne	@@27
	jmp	@51@842
@@27:
   ;	
   ;			{
   ;				int ok=0;
   ;	
	mov	word ptr [bp-18],0
   ;	
   ;	
   ;				//
   ;				// CHECK FOR SCREEN CAPTURE
   ;				//
   ;				#ifndef SPEAR
   ;				if (Keyboard[sc_Tab] && Keyboard[sc_P] && MS_CheckParm("goobers"))
   ;	
	cmp	word ptr DGROUP:_Keyboard+30,0
	je	short @51@482
	cmp	word ptr DGROUP:_Keyboard+50,0
	je	short @51@482
	push	ds
	mov	ax,offset DGROUP:s@+1342
	push	ax
	call	near ptr _MS_CheckParm
	pop	cx
	pop	cx
	or	ax,ax
	je	short @51@482
   ;	
   ;				#else
   ;				if (Keyboard[sc_Tab] && Keyboard[sc_P] && MS_CheckParm("debugmode"))
   ;				#endif
   ;					PicturePause();
   ;	
	call	near ptr _PicturePause
@51@482:
   ;	
   ;	
   ;	
   ;				if (key>='a')
   ;	
	cmp	byte ptr [bp-1],97
	jl	short @51@530
   ;	
   ;					key-='a'-'A';
   ;	
	mov	al,byte ptr [bp-1]
	add	al,224
	mov	byte ptr [bp-1],al
@51@530:
   ;	
   ;	
   ;				for (i=which+1;i<item_i->amount;i++)
   ;	
	mov	ax,si
	inc	ax
	mov	word ptr [bp-4],ax
	jmp	short @51@650
@51@554:
   ;	
   ;					if ((items+i)->active && (items+i)->string[0]==key)
   ;	
	mov	ax,word ptr [bp-4]
	mov	dx,40
	imul	dx
	les	bx,dword ptr [bp+6]
	add	bx,ax
	cmp	word ptr es:[bx],0
	je	short @51@626
	mov	ax,word ptr [bp-4]
	mov	dx,40
	imul	dx
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	al,byte ptr es:[bx+2]
	cmp	al,byte ptr [bp-1]
	jne	short @51@626
   ;	
   ;					{
   ;						EraseGun(item_i,items,x,y,which);
   ;	
	push	si
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	di
	call	near ptr _EraseGun
	add	sp,12
   ;	
   ;						which=i;
   ;	
	mov	si,word ptr [bp-4]
   ;	
   ;						DrawGun(item_i,items,x,&y,which,basey,routine);
   ;	
	push	word ptr [bp+10]
	push	word ptr [bp-10]
	push	si
	lea	ax,word ptr [bp-8]
	push	ax
	push	word ptr [bp-6]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	di
	call	near ptr _DrawGun
	add	sp,16
   ;	
   ;						ok=1;
   ;	
	mov	word ptr [bp-18],1
   ;	
   ;						IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;						break;
   ;	
	jmp	short @51@674
@51@626:
	inc	word ptr [bp-4]
@51@650:
	mov	ax,word ptr [di+4]
	cmp	ax,word ptr [bp-4]
	jg	short @51@554
@51@674:
   ;	
   ;					}
   ;	
   ;				//
   ;				// DIDN'T FIND A MATCH FIRST TIME THRU. CHECK AGAIN.
   ;				//
   ;				if (!ok)
   ;	
	cmp	word ptr [bp-18],0
	jne	short @51@842
   ;	
   ;				{
   ;					for (i=0;i<which;i++)
   ;	
	mov	word ptr [bp-4],0
	jmp	short @51@818
@51@722:
   ;	
   ;						if ((items+i)->active && (items+i)->string[0]==key)
   ;	
	mov	ax,word ptr [bp-4]
	mov	dx,40
	imul	dx
	les	bx,dword ptr [bp+6]
	add	bx,ax
	cmp	word ptr es:[bx],0
	je	short @51@794
	mov	ax,word ptr [bp-4]
	mov	dx,40
	imul	dx
	les	bx,dword ptr [bp+6]
	add	bx,ax
	mov	al,byte ptr es:[bx+2]
	cmp	al,byte ptr [bp-1]
	jne	short @51@794
   ;	
   ;						{
   ;							EraseGun(item_i,items,x,y,which);
   ;	
	push	si
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	di
	call	near ptr _EraseGun
	add	sp,12
   ;	
   ;							which=i;
   ;	
	mov	si,word ptr [bp-4]
   ;	
   ;							DrawGun(item_i,items,x,&y,which,basey,routine);
   ;	
	push	word ptr [bp+10]
	push	word ptr [bp-10]
	push	si
	lea	ax,word ptr [bp-8]
	push	ax
	push	word ptr [bp-6]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	di
	call	near ptr _DrawGun
	add	sp,16
   ;	
   ;							IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;							break;
   ;	
	jmp	short @51@842
@51@794:
	inc	word ptr [bp-4]
@51@818:
	cmp	word ptr [bp-4],si
	jl	short @51@722
@51@842:
   ;	
   ;						}
   ;				}
   ;			}
   ;	
   ;			//
   ;			// GET INPUT
   ;			//
   ;			ReadAnyControl(&ci);
   ;	
	lea	ax,word ptr [bp-36]
	push	ax
	call	near ptr _ReadAnyControl
	pop	cx
   ;	
   ;			switch(ci.dir)
   ;	
	mov	ax,word ptr [bp-20]
	or	ax,ax
	je	short @51@962
	cmp	ax,4
	jne	@@28
	jmp	@51@1154
@@28:
	jmp	@51@1346
@51@962:
   ;	
   ;			{
   ;				////////////////////////////////////////////////
   ;				//
   ;				// MOVE UP
   ;				//
   ;				case dir_North:
   ;	
   ;				EraseGun(item_i,items,x,y,which);
   ;	
	push	si
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	di
	call	near ptr _EraseGun
	add	sp,12
   ;	
   ;	
   ;				//
   ;				// ANIMATE HALF-STEP
   ;				//
   ;				if (which && (items+which-1)->active)
   ;	
	or	si,si
	je	short @51@1034
	mov	ax,si
	mov	dx,40
	imul	dx
	les	bx,dword ptr [bp+6]
	add	bx,ax
	cmp	word ptr es:[bx-40],0
	je	short @51@1034
   ;	
   ;				{
   ;					y-=6;
   ;	
	sub	word ptr [bp-8],6
   ;	
   ;					DrawHalfStep(x,y);
   ;	
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	call	near ptr _DrawHalfStep
	pop	cx
	pop	cx
@51@1034:
   ;	
   ;				}
   ;	
   ;				//
   ;				// MOVE TO NEXT AVAILABLE SPOT
   ;				//
   ;				do
   ;				{
   ;					if (!which)
   ;	
	or	si,si
	jne	short @51@1082
   ;	
   ;						which=item_i->amount-1;
   ;	
	mov	ax,word ptr [di+4]
	dec	ax
	mov	si,ax
	jmp	short @51@1106
@51@1082:
   ;	
   ;					else
   ;						which--;
   ;	
	dec	si
@51@1106:
   ;	
   ;				} while(!(items+which)->active);
   ;	
	mov	ax,si
	mov	dx,40
	imul	dx
	les	bx,dword ptr [bp+6]
	add	bx,ax
	cmp	word ptr es:[bx],0
	je	short @51@1034
   ;	
   ;	
   ;				DrawGun(item_i,items,x,&y,which,basey,routine);
   ;	
	push	word ptr [bp+10]
	push	word ptr [bp-10]
	push	si
	lea	ax,word ptr [bp-8]
	push	ax
	push	word ptr [bp-6]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	di
	call	near ptr _DrawGun
	add	sp,16
   ;	
   ;				//
   ;				// WAIT FOR BUTTON-UP OR DELAY NEXT MOVE
   ;				//
   ;				TicDelay(20);
   ;	
	mov	ax,20
	push	ax
	call	near ptr _TicDelay
	pop	cx
   ;	
   ;				break;
   ;	
	jmp	@51@1346
@51@1154:
   ;	
   ;	
   ;				////////////////////////////////////////////////
   ;				//
   ;				// MOVE DOWN
   ;				//
   ;				case dir_South:
   ;	
   ;				EraseGun(item_i,items,x,y,which);
   ;	
	push	si
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	di
	call	near ptr _EraseGun
	add	sp,12
   ;	
   ;				//
   ;				// ANIMATE HALF-STEP
   ;				//
   ;				if (which!=item_i->amount-1 && (items+which+1)->active)
   ;	
	mov	ax,word ptr [di+4]
	dec	ax
	cmp	ax,si
	je	short @51@1226
	mov	ax,si
	mov	dx,40
	imul	dx
	les	bx,dword ptr [bp+6]
	add	bx,ax
	cmp	word ptr es:[bx+40],0
	je	short @51@1226
   ;	
   ;				{
   ;					y+=6;
   ;	
	add	word ptr [bp-8],6
   ;	
   ;					DrawHalfStep(x,y);
   ;	
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	call	near ptr _DrawHalfStep
	pop	cx
	pop	cx
@51@1226:
   ;	
   ;				}
   ;	
   ;				do
   ;				{
   ;					if (which==item_i->amount-1)
   ;	
	mov	ax,word ptr [di+4]
	dec	ax
	cmp	ax,si
	jne	short @51@1274
   ;	
   ;						which=0;
   ;	
	xor	si,si
	jmp	short @51@1298
@51@1274:
   ;	
   ;					else
   ;						which++;
   ;	
	inc	si
@51@1298:
   ;	
   ;				} while(!(items+which)->active);
   ;	
	mov	ax,si
	mov	dx,40
	imul	dx
	les	bx,dword ptr [bp+6]
	add	bx,ax
	cmp	word ptr es:[bx],0
	je	short @51@1226
   ;	
   ;	
   ;				DrawGun(item_i,items,x,&y,which,basey,routine);
   ;	
	push	word ptr [bp+10]
	push	word ptr [bp-10]
	push	si
	lea	ax,word ptr [bp-8]
	push	ax
	push	word ptr [bp-6]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	di
	call	near ptr _DrawGun
	add	sp,16
   ;	
   ;	
   ;				//
   ;				// WAIT FOR BUTTON-UP OR DELAY NEXT MOVE
   ;				//
   ;				TicDelay(20);
   ;	
	mov	ax,20
	push	ax
	call	near ptr _TicDelay
	pop	cx
   ;	
   ;				break;
   ;	
	jmp	short @51@1346
@51@1346:
   ;	
   ;			}
   ;	
   ;			if (ci.button0 ||
   ;	
   ;	
   ;				Keyboard[sc_Space] ||
   ;				Keyboard[sc_Enter])
   ;	
	cmp	word ptr [bp-36],0
	jne	short @51@1418
	cmp	word ptr DGROUP:_Keyboard+114,0
	jne	short @51@1418
	cmp	word ptr DGROUP:_Keyboard+56,0
	je	short @51@1442
@51@1418:
   ;	
   ;					exit=1;
   ;	
	mov	word ptr [bp-12],1
@51@1442:
   ;	
   ;	
   ;			if (ci.button1 ||
   ;	
   ;	
   ;				Keyboard[sc_Escape])
   ;	
	cmp	word ptr [bp-34],0
	jne	short @51@1490
	cmp	word ptr DGROUP:_Keyboard+2,0
	je	short @51@1514
@51@1490:
   ;	
   ;					exit=2;
   ;	
	mov	word ptr [bp-12],2
@51@1514:
   ;	
   ;	
   ;		} while(!exit);
   ;	
	cmp	word ptr [bp-12],0
	jne	@@29
	jmp	@51@146
@@29:
   ;	
   ;	
   ;	
   ;		IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;	
   ;		//
   ;		// ERASE EVERYTHING
   ;		//
   ;		if (lastitem!=which)
   ;	
	cmp	word ptr DGROUP:d@w+674,si
	je	short @51@1586
   ;	
   ;		{
   ;			VWB_Bar(x-1,y,25,16,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,16
	push	ax
	mov	ax,25
	push	ax
	push	word ptr [bp-8]
	mov	ax,word ptr [bp-6]
	dec	ax
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;			PrintX=item_i->x+item_i->indent;
   ;	
	mov	ax,word ptr [di]
	add	ax,word ptr [di+8]
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;			PrintY=item_i->y+which*13;
   ;	
	mov	ax,si
	mov	dx,13
	imul	dx
	mov	dx,word ptr [di+2]
	add	dx,ax
	mov	word ptr DGROUP:_PrintY,dx
   ;	
   ;			US_Print((items+which)->string);
   ;	
	mov	ax,si
	mov	dx,40
	imul	dx
	mov	dx,word ptr [bp+6]
	add	dx,ax
	inc	dx
	inc	dx
	push	word ptr [bp+8]
	push	dx
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;			redrawitem=1;
   ;	
	mov	word ptr DGROUP:d@w+672,1
   ;	
   ;		}
   ;	
	jmp	short @51@1610
@51@1586:
   ;	
   ;		else
   ;			redrawitem=0;
   ;	
	mov	word ptr DGROUP:d@w+672,0
@51@1610:
   ;	
   ;	
   ;		if (routine)
   ;	
	cmp	word ptr [bp+10],0
	je	short @51@1658
   ;	
   ;			routine(which);
   ;	
	push	si
	call	word ptr [bp+10]
	pop	cx
@51@1658:
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	
   ;		item_i->curpos=which;
   ;	
	mov	word ptr [di+6],si
   ;	
   ;	
   ;		lastitem=which;
   ;	
	mov	word ptr DGROUP:d@w+674,si
   ;	
   ;		switch(exit)
   ;	
	mov	ax,word ptr [bp-12]
	cmp	ax,1
	je	short @51@1778
	cmp	ax,2
	je	short @51@1850
	jmp	short @51@1874
@51@1778:
   ;	
   ;		{
   ;			case 1:
   ;				//
   ;				// CALL THE ROUTINE
   ;				//
   ;				if ((items+which)->routine!=NULL)
   ;	
	mov	ax,si
	mov	dx,40
	imul	dx
	les	bx,dword ptr [bp+6]
	add	bx,ax
	cmp	word ptr es:[bx+38],0
	je	short @51@1826
   ;	
   ;				{
   ;					ShootSnd();
   ;	
	call	near ptr _ShootSnd
   ;	
   ;					MenuFadeOut();
   ;	
	mov	ax,10
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,43
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;					(items+which)->routine(0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,si
	mov	dx,40
	imul	dx
	les	bx,dword ptr [bp+6]
	add	bx,ax
	call	word ptr es:[bx+38]
	pop	cx
@51@1826:
   ;	
   ;				}
   ;				return which;
   ;	
	mov	ax,si
	jmp	short @51@1898
@51@1850:
   ;	
   ;	
   ;			case 2:
   ;				SD_PlaySound(ESCPRESSEDSND);
   ;	
	mov	ax,39
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;				return -1;
   ;	
	mov	ax,65535
	jmp	short @51@1898
@51@1874:
   ;	
   ;		}
   ;	
   ;		return 0; // JUST TO SHUT UP THE ERROR MESSAGES!
   ;	
	xor	ax,ax
	jmp	short @51@1898
@51@1898:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_HandleMenu	endp
   ;	
   ;	void EraseGun(CP_iteminfo *item_i,CP_itemtype far *items,int x,int y,int which)
   ;	
	assume	cs:_TEXT
_EraseGun	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	si,word ptr [bp+4]
	mov	di,word ptr [bp+14]
   ;	
   ;	{
   ;		VWB_Bar(x-1,y,25,16,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,16
	push	ax
	mov	ax,25
	push	ax
	push	word ptr [bp+12]
	mov	ax,word ptr [bp+10]
	dec	ax
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;		SetTextColor(items+which,0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,di
	mov	dx,40
	imul	dx
	mov	dx,word ptr [bp+6]
	add	dx,ax
	push	word ptr [bp+8]
	push	dx
	call	near ptr _SetTextColor
	add	sp,6
   ;	
   ;	
   ;		PrintX=item_i->x+item_i->indent;
   ;	
	mov	ax,word ptr [si]
	add	ax,word ptr [si+8]
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;		PrintY=item_i->y+which*13;
   ;	
	mov	ax,di
	mov	dx,13
	imul	dx
	mov	dx,word ptr [si+2]
	add	dx,ax
	mov	word ptr DGROUP:_PrintY,dx
   ;	
   ;		US_Print((items+which)->string);
   ;	
	mov	ax,di
	mov	dx,40
	imul	dx
	mov	dx,word ptr [bp+6]
	add	dx,ax
	inc	dx
	inc	dx
	push	word ptr [bp+8]
	push	dx
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_EraseGun	endp
   ;	
   ;	void DrawHalfStep(int x,int y)
   ;	
	assume	cs:_TEXT
_DrawHalfStep	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		VWB_DrawPic(x,y,C_CURSOR1PIC);
   ;	
	mov	ax,11
	push	ax
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		SD_PlaySound(MOVEGUN1SND);
   ;	
	mov	ax,5
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;		TimeCount=0;
   ;	
	mov	word ptr DGROUP:_TimeCount,0
	mov	word ptr DGROUP:_TimeCount+2,0
	jmp	short @53@50
@53@50:
   ;	
   ;		while(TimeCount<8);
   ;	
	cmp	word ptr DGROUP:_TimeCount+2,0
	jb	short @53@50
	jne	short @53@122
	cmp	word ptr DGROUP:_TimeCount,8
	jb	short @53@50
@53@122:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_DrawHalfStep	endp
   ;	
   ;	void DrawGun(CP_iteminfo *item_i,CP_itemtype far *items,int x,int *y,int which,int basey,void (*routine)(int w))
   ;	
	assume	cs:_TEXT
_DrawGun	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
	mov	si,word ptr [bp+12]
   ;	
   ;	{
   ;		VWB_Bar(x-1,*y,25,16,BKGDCOLOR);
   ;	
	mov	ax,45
	push	ax
	mov	ax,16
	push	ax
	mov	ax,25
	push	ax
	push	word ptr [si]
	mov	ax,word ptr [bp+10]
	dec	ax
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;		*y=basey+which*13;
   ;	
	mov	ax,word ptr [bp+14]
	mov	dx,13
	imul	dx
	mov	dx,word ptr [bp+16]
	add	dx,ax
	mov	word ptr [si],dx
   ;	
   ;		VWB_DrawPic(x,*y,C_CURSOR1PIC);
   ;	
	mov	ax,11
	push	ax
	push	word ptr [si]
	push	word ptr [bp+10]
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		SetTextColor(items+which,1);
   ;	
	mov	ax,1
	push	ax
	mov	ax,word ptr [bp+14]
	mov	dx,40
	imul	dx
	mov	dx,word ptr [bp+6]
	add	dx,ax
	push	word ptr [bp+8]
	push	dx
	call	near ptr _SetTextColor
	add	sp,6
   ;	
   ;	
   ;		PrintX=item_i->x+item_i->indent;
   ;	
	mov	ax,word ptr [di]
	add	ax,word ptr [di+8]
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;		PrintY=item_i->y+which*13;
   ;	
	mov	ax,word ptr [bp+14]
	mov	dx,13
	imul	dx
	mov	dx,word ptr [di+2]
	add	dx,ax
	mov	word ptr DGROUP:_PrintY,dx
   ;	
   ;		US_Print((items+which)->string);
   ;	
	mov	ax,word ptr [bp+14]
	mov	dx,40
	imul	dx
	mov	dx,word ptr [bp+6]
	add	dx,ax
	inc	dx
	inc	dx
	push	word ptr [bp+8]
	push	dx
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;	
   ;		//
   ;		// CALL CUSTOM ROUTINE IF IT IS NEEDED
   ;		//
   ;		if (routine)
   ;	
	cmp	word ptr [bp+18],0
	je	short @54@74
   ;	
   ;			routine(which);
   ;	
	push	word ptr [bp+14]
	call	word ptr [bp+18]
	pop	cx
@54@74:
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		SD_PlaySound(MOVEGUN2SND);
   ;	
	mov	ax,4
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_DrawGun	endp
   ;	
   ;	void TicDelay(int count)
   ;	
	assume	cs:_TEXT
_TicDelay	proc	near
	push	bp
	mov	bp,sp
	sub	sp,18
   ;	
   ;	{
   ;		ControlInfo ci;
   ;	
   ;	
   ;		TimeCount=0;
   ;	
	mov	word ptr DGROUP:_TimeCount,0
	mov	word ptr DGROUP:_TimeCount+2,0
@55@50:
   ;	
   ;		do
   ;		{
   ;			ReadAnyControl(&ci);
   ;	
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _ReadAnyControl
	pop	cx
   ;	
   ;		} while(TimeCount<count && ci.dir!=dir_None);
   ;	
	mov	ax,word ptr [bp+4]
	cwd	
	cmp	dx,word ptr DGROUP:_TimeCount+2
	jb	short @55@170
	ja	short @55@146
	cmp	ax,word ptr DGROUP:_TimeCount
	jbe	short @55@170
@55@146:
	cmp	word ptr [bp-2],8
	jne	short @55@50
@55@170:
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_TicDelay	endp
   ;	
   ;	void DrawMenu(CP_iteminfo *item_i,CP_itemtype far *items)
   ;	
	assume	cs:_TEXT
_DrawMenu	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		int i,which=item_i->curpos;
   ;	
	mov	ax,word ptr [si+6]
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;	
   ;		WindowX=PrintX=item_i->x+item_i->indent;
   ;	
	mov	ax,word ptr [si]
	add	ax,word ptr [si+8]
	mov	word ptr DGROUP:_PrintX,ax
	mov	word ptr DGROUP:_WindowX,ax
   ;	
   ;		WindowY=PrintY=item_i->y;
   ;	
	mov	ax,word ptr [si+2]
	mov	word ptr DGROUP:_PrintY,ax
	mov	word ptr DGROUP:_WindowY,ax
   ;	
   ;		WindowW=320;
   ;	
	mov	word ptr DGROUP:_WindowW,320
   ;	
   ;		WindowH=200;
   ;	
	mov	word ptr DGROUP:_WindowH,200
   ;	
   ;	
   ;		for (i=0;i<item_i->amount;i++)
   ;	
	xor	di,di
	jmp	@56@242
@56@50:
   ;	
   ;		{
   ;			SetTextColor(items+i,which==i);
   ;	
	cmp	word ptr [bp-2],di
	jne	short @56@98
	mov	ax,1
	jmp	short @56@122
@56@98:
	xor	ax,ax
@56@122:
	push	ax
	mov	ax,di
	mov	dx,40
	imul	dx
	mov	dx,word ptr [bp+6]
	add	dx,ax
	push	word ptr [bp+8]
	push	dx
	call	near ptr _SetTextColor
	add	sp,6
   ;	
   ;	
   ;			PrintY=item_i->y+i*13;
   ;	
	mov	ax,di
	mov	dx,13
	imul	dx
	mov	dx,word ptr [si+2]
	add	dx,ax
	mov	word ptr DGROUP:_PrintY,dx
   ;	
   ;			if ((items+i)->active)
   ;	
	mov	ax,di
	mov	dx,40
	imul	dx
	les	bx,dword ptr [bp+6]
	add	bx,ax
	cmp	word ptr es:[bx],0
	je	short @56@170
   ;	
   ;				US_Print((items+i)->string);
   ;	
	mov	ax,di
	mov	dx,40
	imul	dx
	mov	dx,word ptr [bp+6]
	add	dx,ax
	inc	dx
	inc	dx
	push	word ptr [bp+8]
	push	dx
	call	near ptr _US_Print
	pop	cx
	pop	cx
	jmp	short @56@194
@56@170:
   ;	
   ;			else
   ;			{
   ;				SETFONTCOLOR(DEACTIVE,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,43
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;				US_Print((items+i)->string);
   ;	
	mov	ax,di
	mov	dx,40
	imul	dx
	mov	dx,word ptr [bp+6]
	add	dx,ax
	inc	dx
	inc	dx
	push	word ptr [bp+8]
	push	dx
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;				SETFONTCOLOR(TEXTCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,23
	mov	byte ptr DGROUP:_backcolor,45
@56@194:
   ;	
   ;			}
   ;	
   ;			US_Print("\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1350
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
	inc	di
@56@242:
	cmp	word ptr [si+4],di
	jle	@@30
	jmp	@56@50
@@30:
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_DrawMenu	endp
   ;	
   ;	void SetTextColor(CP_itemtype far *items,int hlight)
   ;	
	assume	cs:_TEXT
_SetTextColor	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		if (hlight)
   ;	
	cmp	word ptr [bp+8],0
	je	short @57@74
   ;	
   ;			{SETFONTCOLOR(color_hlite[items->active],BKGDCOLOR);}
   ;	
	les	bx,dword ptr [bp+4]
	mov	bx,word ptr es:[bx]
	shl	bx,1
	mov	al,byte ptr DGROUP:_color_hlite[bx]
	mov	byte ptr DGROUP:_fontcolor,al
	mov	byte ptr DGROUP:_backcolor,45
	jmp	short @57@98
@57@74:
   ;	
   ;		else
   ;			{SETFONTCOLOR(color_norml[items->active],BKGDCOLOR);}
   ;	
	les	bx,dword ptr [bp+4]
	mov	bx,word ptr es:[bx]
	shl	bx,1
	mov	al,byte ptr DGROUP:_color_norml[bx]
	mov	byte ptr DGROUP:_fontcolor,al
	mov	byte ptr DGROUP:_backcolor,45
@57@98:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_SetTextColor	endp
   ;	
   ;	void WaitKeyUp(void)
   ;	
	assume	cs:_TEXT
_WaitKeyUp	proc	near
	push	bp
	mov	bp,sp
	sub	sp,18
	jmp	short @58@50
@58@50:
   ;	
   ;	{
   ;		ControlInfo ci;
   ;		while(ReadAnyControl(&ci),	ci.button0|
   ;	
   ;	
   ;									ci.button1|
   ;									ci.button2|
   ;									ci.button3|
   ;									Keyboard[sc_Space]|
   ;									Keyboard[sc_Enter]|
   ;									Keyboard[sc_Escape]);
   ;	
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _ReadAnyControl
	pop	cx
	mov	ax,word ptr [bp-18]
	or	ax,word ptr [bp-16]
	or	ax,word ptr [bp-14]
	or	ax,word ptr [bp-12]
	or	ax,word ptr DGROUP:_Keyboard+114
	or	ax,word ptr DGROUP:_Keyboard+56
	or	ax,word ptr DGROUP:_Keyboard+2
	or	ax,ax
	jne	short @58@50
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_WaitKeyUp	endp
   ;	
   ;	void ReadAnyControl(ControlInfo *ci)
   ;	
	assume	cs:_TEXT
_ReadAnyControl	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		int mouseactive=0;
   ;	
	xor	di,di
   ;	
   ;	
   ;	
   ;		IN_ReadControl(0,ci);
   ;	
	push	si
	xor	ax,ax
	push	ax
	call	near ptr _IN_ReadControl
	pop	cx
	pop	cx
   ;	
   ;	
   ;		if (mouseenabled)
   ;	
	cmp	word ptr DGROUP:_mouseenabled,0
	jne	@@31
	jmp	@59@290
@@31:
   ;	
   ;		{
   ;			int mousey,mousex;
   ;	
   ;	
   ;			// READ MOUSE MOTION COUNTERS
   ;			// RETURN DIRECTION
   ;			// HOME MOUSE
   ;			// CHECK MOUSE BUTTONS
   ;	
   ;			Mouse(3);
   ;	
	mov	ax,3
	int	51
   ;	
   ;			mousex=_CX;
   ;	
	mov	word ptr [bp-4],cx
   ;	
   ;			mousey=_DX;
   ;	
	mov	word ptr [bp-2],dx
   ;	
   ;	
   ;			if (mousey<CENTER-SENSITIVE)
   ;	
	cmp	word ptr [bp-2],60
	jge	short @59@98
   ;	
   ;			{
   ;				ci->dir=dir_North;
   ;	
	mov	word ptr [si+16],0
   ;	
   ;				_CX=_DX=CENTER;
   ;	
	mov	ax,120
	mov	dx,ax
	mov	cx,ax
   ;	
   ;				Mouse(4);
   ;	
	mov	ax,4
	int	51
   ;	
   ;				mouseactive=1;
   ;	
	mov	di,1
   ;	
   ;			}
   ;	
	jmp	short @59@146
@59@98:
   ;	
   ;			else
   ;			if (mousey>CENTER+SENSITIVE)
   ;	
	cmp	word ptr [bp-2],180
	jle	short @59@146
   ;	
   ;			{
   ;				ci->dir=dir_South;
   ;	
	mov	word ptr [si+16],4
   ;	
   ;				_CX=_DX=CENTER;
   ;	
	mov	ax,120
	mov	dx,ax
	mov	cx,ax
   ;	
   ;				Mouse(4);
   ;	
	mov	ax,4
	int	51
   ;	
   ;				mouseactive=1;
   ;	
	mov	di,1
@59@146:
   ;	
   ;			}
   ;	
   ;			if (mousex<CENTER-SENSITIVE)
   ;	
	cmp	word ptr [bp-4],60
	jge	short @59@194
   ;	
   ;			{
   ;				ci->dir=dir_West;
   ;	
	mov	word ptr [si+16],6
   ;	
   ;				_CX=_DX=CENTER;
   ;	
	mov	ax,120
	mov	dx,ax
	mov	cx,ax
   ;	
   ;				Mouse(4);
   ;	
	mov	ax,4
	int	51
   ;	
   ;				mouseactive=1;
   ;	
	mov	di,1
   ;	
   ;			}
   ;	
	jmp	short @59@242
@59@194:
   ;	
   ;			else
   ;			if (mousex>CENTER+SENSITIVE)
   ;	
	cmp	word ptr [bp-4],180
	jle	short @59@242
   ;	
   ;			{
   ;				ci->dir=dir_East;
   ;	
	mov	word ptr [si+16],2
   ;	
   ;				_CX=_DX=CENTER;
   ;	
	mov	ax,120
	mov	dx,ax
	mov	cx,ax
   ;	
   ;				Mouse(4);
   ;	
	mov	ax,4
	int	51
   ;	
   ;				mouseactive=1;
   ;	
	mov	di,1
@59@242:
   ;	
   ;			}
   ;	
   ;			if (IN_MouseButtons())
   ;	
	call	near ptr _IN_MouseButtons
	or	al,al
	je	short @59@290
   ;	
   ;			{
   ;				ci->button0=IN_MouseButtons()&1;
   ;	
	call	near ptr _IN_MouseButtons
	mov	ah,0
	and	ax,1
	mov	word ptr [si],ax
   ;	
   ;				ci->button1=IN_MouseButtons()&2;
   ;	
	call	near ptr _IN_MouseButtons
	mov	ah,0
	and	ax,2
	mov	word ptr [si+2],ax
   ;	
   ;				ci->button2=IN_MouseButtons()&4;
   ;	
	call	near ptr _IN_MouseButtons
	mov	ah,0
	and	ax,4
	mov	word ptr [si+4],ax
   ;	
   ;				ci->button3=false;
   ;	
	mov	word ptr [si+6],0
   ;	
   ;				mouseactive=1;
   ;	
	mov	di,1
@59@290:
   ;	
   ;			}
   ;		}
   ;	
   ;		if (joystickenabled && !mouseactive)
   ;	
	cmp	word ptr DGROUP:_joystickenabled,0
	jne	@@32
	jmp	@59@626
@@32:
	or	di,di
	je	@@33
	jmp	@59@626
@@33:
   ;	
   ;		{
   ;			int jx,jy,jb;
   ;	
   ;	
   ;			INL_GetJoyDelta(joystickport,&jx,&jy);
   ;	
	lea	ax,word ptr [bp-4]
	push	ax
	lea	ax,word ptr [bp-2]
	push	ax
	push	word ptr DGROUP:_joystickport
	call	near ptr _INL_GetJoyDelta
	add	sp,6
   ;	
   ;			if (jy<-SENSITIVE)
   ;	
	cmp	word ptr [bp-4],65476
	jge	short @59@386
   ;	
   ;				ci->dir=dir_North;
   ;	
	mov	word ptr [si+16],0
	jmp	short @59@434
@59@386:
   ;	
   ;			else
   ;			if (jy>SENSITIVE)
   ;	
	cmp	word ptr [bp-4],60
	jle	short @59@434
   ;	
   ;				ci->dir=dir_South;
   ;	
	mov	word ptr [si+16],4
@59@434:
   ;	
   ;	
   ;			if (jx<-SENSITIVE)
   ;	
	cmp	word ptr [bp-2],65476
	jge	short @59@482
   ;	
   ;				ci->dir=dir_West;
   ;	
	mov	word ptr [si+16],6
	jmp	short @59@530
@59@482:
   ;	
   ;			else
   ;			if (jx>SENSITIVE)
   ;	
	cmp	word ptr [bp-2],60
	jle	short @59@530
   ;	
   ;				ci->dir=dir_East;
   ;	
	mov	word ptr [si+16],2
@59@530:
   ;	
   ;	
   ;			jb=IN_JoyButtons();
   ;	
	call	near ptr _IN_JoyButtons
	mov	ah,0
	mov	word ptr [bp-6],ax
   ;	
   ;			if (jb)
   ;	
	cmp	word ptr [bp-6],0
	je	short @59@626
   ;	
   ;			{
   ;				ci->button0=jb&1;
   ;	
	mov	ax,word ptr [bp-6]
	and	ax,1
	mov	word ptr [si],ax
   ;	
   ;				ci->button1=jb&2;
   ;	
	mov	ax,word ptr [bp-6]
	and	ax,2
	mov	word ptr [si+2],ax
   ;	
   ;				if (joypadenabled)
   ;	
	cmp	word ptr DGROUP:_joypadenabled,0
	je	short @59@602
   ;	
   ;				{
   ;					ci->button2=jb&4;
   ;	
	mov	ax,word ptr [bp-6]
	and	ax,4
	mov	word ptr [si+4],ax
   ;	
   ;					ci->button3=jb&8;
   ;	
	mov	ax,word ptr [bp-6]
	and	ax,8
	mov	word ptr [si+6],ax
   ;	
   ;				}
   ;	
	jmp	short @59@626
@59@602:
   ;	
   ;				else
   ;					ci->button2=ci->button3=false;
   ;	
	xor	ax,ax
	mov	word ptr [si+6],ax
	mov	word ptr [si+4],ax
@59@626:
   ;	
   ;			}
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_ReadAnyControl	endp
_TEXT	ends
_DATA	segment word public 'DATA'
	db	39
	db	0
	db	32
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	
   ;	
	assume	cs:_TEXT
_Confirm	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	di
   ;	
   ;	{
   ;	#ifdef JAPAN
   ;	
	xor	di,di
	xor	si,si
	push	ss
	lea	ax,word ptr [bp-8]
	push	ax
	push	ds
	mov	ax,offset DGROUP:d@w+676
	push	ax
	mov	cx,4
	call	near ptr N_SCOPY@
   ;	
   ;		{1,"",CP_NewGame},
   ;		{1,"",CP_Sound},
   ;		{1,"",CP_Control},
   ;	
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _Message
	pop	cx
	pop	cx
   ;	
   ;		{1,"",CP_LoadGame},
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;		{0,"",CP_SaveGame},
   ;		{1,"",CP_ChangeView},
   ;		{2,"",CP_ReadThis},
   ;		{1,"",CP_ViewScores},
   ;		{1,"",0},
   ;	
	mov	ax,word ptr DGROUP:_PrintX
	mov	word ptr [bp-2],ax
   ;	
   ;		{1,"",0}
   ;	
	mov	ax,word ptr DGROUP:_PrintY
	mov	word ptr [bp-4],ax
   ;	
   ;	#else
   ;	
	mov	word ptr DGROUP:_TimeCount,0
	mov	word ptr DGROUP:_TimeCount+2,0
@60@50:
   ;	
   ;	
   ;		{1,STR_NG,CP_NewGame},
   ;		{1,STR_SD,CP_Sound},
   ;		{1,STR_CL,CP_Control},
   ;	
	cmp	word ptr DGROUP:_TimeCount+2,0
	jb	short @60@290
	jne	short @60@122
	cmp	word ptr DGROUP:_TimeCount,10
	jb	short @60@290
@60@122:
   ;	
   ;		{1,STR_LG,CP_LoadGame},
   ;		{0,STR_SG,CP_SaveGame},
   ;	
	mov	ax,si
	or	ax,ax
	je	short @60@218
	cmp	ax,1
	je	short @60@242
	jmp	short @60@266
@60@218:
   ;	
   ;		{1,STR_CV,CP_ChangeView},
   ;	
   ;	#ifndef GOODTIMES
   ;	
	mov	ax,23
	push	ax
	mov	ax,13
	push	ax
	mov	ax,8
	push	ax
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;	#ifndef SPEAR
   ;	
	jmp	short @60@266
@60@242:
   ;	
   ;	
   ;		#ifdef SPANISH
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;		{2,"Ve esto!",CP_ReadThis},
   ;	
	mov	ax,word ptr [bp-4]
	mov	word ptr DGROUP:_PrintY,ax
   ;	
   ;		#else
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+1352
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
@60@266:
   ;	
   ;		{2,"Read This!",CP_ReadThis},
   ;		#endif
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	
   ;	
	xor	si,1
   ;	
   ;	#endif
   ;	
	mov	word ptr DGROUP:_TimeCount,0
	mov	word ptr DGROUP:_TimeCount+2,0
@60@290:
   ;	
   ;	#endif
   ;	
   ;		{1,STR_VS,CP_ViewScores},
   ;		{1,STR_BD,0},
   ;	
	cmp	word ptr DGROUP:_Keyboard+30,0
	je	short @60@386
	cmp	word ptr DGROUP:_Keyboard+50,0
	je	short @60@386
	push	ds
	mov	ax,offset DGROUP:s@+1354
	push	ax
	call	near ptr _MS_CheckParm
	pop	cx
	pop	cx
	or	ax,ax
	je	short @60@386
   ;	
   ;		{1,STR_QT,0}
   ;	
	call	near ptr _PicturePause
@60@386:
   ;	
   ;	#endif
   ;	},
   ;	
   ;	far SndMenu[]=
   ;	{
   ;	#ifdef JAPAN
   ;	
	cmp	word ptr DGROUP:_Keyboard+42,0
	jne	short @60@458
	cmp	word ptr DGROUP:_Keyboard+98,0
	jne	short @60@458
	cmp	word ptr DGROUP:_Keyboard+2,0
	jne	@@34
	jmp	@60@50
@@34:
@60@458:
   ;	
   ;		{1,"",0},
   ;		{1,"",0},
   ;		{1,"",0},
   ;		{0,"",0},
   ;		{0,"",0},
   ;		{1,"",0},
   ;		{1,"",0},
   ;		{1,"",0},
   ;		{0,"",0},
   ;		{0,"",0},
   ;		{1,"",0},
   ;		{1,"",0},
   ;	#else
   ;		{1,STR_NONE,0},
   ;	
	cmp	word ptr DGROUP:_Keyboard+42,0
	je	short @60@506
   ;	
   ;		{1,STR_PC,0},
   ;		{1,STR_ALSB,0},
   ;	
	mov	di,1
   ;	
   ;		{0,"",0},
   ;	
	call	near ptr _ShootSnd
@60@506:
	jmp	short @60@530
@60@530:
   ;	
   ;		{0,"",0},
   ;		{1,STR_NONE,0},
   ;		{1,STR_DISNEY,0},
   ;	
	cmp	word ptr DGROUP:_Keyboard+42,0
	jne	short @60@530
	cmp	word ptr DGROUP:_Keyboard+98,0
	jne	short @60@530
	cmp	word ptr DGROUP:_Keyboard+2,0
	jne	short @60@530
   ;	
   ;		{1,STR_SB,0},
   ;		{0,"",0},
   ;		{0,"",0},
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;		{1,STR_NONE,0},
   ;	
	mov	bx,di
	shl	bx,1
	lea	ax,word ptr [bp-8]
	add	bx,ax
	push	word ptr [bx]
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;		{1,STR_ALSB,0}
   ;	
	mov	ax,di
	jmp	short @60@626
@60@626:
   ;	
   ;	#endif
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_Confirm	endp
   ;	
   ;	Episode 6\n"
   ;	
	assume	cs:_TEXT
_Message	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
	push	di
   ;	
   ;			  "Confrontation",0}
   ;		#endif
   ;	
	mov	word ptr [bp-2],0
	xor	di,di
	xor	si,si
   ;	
   ;	#endif
   ;	},
   ;	#endif
   ;	
   ;	
	mov	ax,2
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;	
   ;	
	mov	word ptr DGROUP:_fontnumber,1
   ;	
   ;	far NewMenu[]=
   ;	
	mov	bx,word ptr DGROUP:_fontnumber
	shl	bx,1
	mov	ax,word ptr DGROUP:_grsegs[bx+2]
	mov	word ptr [bp-6],ax
   ;	
   ;	{
   ;	
	mov	es,word ptr [bp-6]
	mov	ax,word ptr es:[0]
	mov	word ptr [bp-2],ax
   ;	
   ;	#ifdef JAPAN
   ;	
	mov	word ptr [bp-4],0
	jmp	short @61@194
@61@50:
   ;	
   ;		{1,"",0},
   ;	
	les	bx,dword ptr [bp+4]
	add	bx,word ptr [bp-4]
	cmp	byte ptr es:[bx],10
	jne	short @61@146
   ;	
   ;		{1,"",0},
   ;		{1,"",0},
   ;	
	cmp	di,si
	jle	short @61@122
   ;	
   ;		{1,"",0}
   ;	
	mov	si,di
@61@122:
   ;	
   ;	#else
   ;	
	xor	di,di
   ;	
   ;		{1,STR_DADDY,0},
   ;	
	mov	es,word ptr [bp-6]
	mov	ax,word ptr es:[0]
	add	word ptr [bp-2],ax
   ;	
   ;		{1,STR_HURTME,0},
   ;	
	jmp	short @61@170
@61@146:
   ;	
   ;		{1,STR_BRINGEM,0},
   ;		{1,STR_DEATH,0}
   ;	
	mov	es,word ptr [bp-6]
	push	es
	les	bx,dword ptr [bp+4]
	add	bx,word ptr [bp-4]
	mov	al,byte ptr es:[bx]
	cbw	
	mov	bx,ax
	pop	es
	mov	al,byte ptr es:[bx+514]
	cbw	
	add	di,ax
@61@170:
	inc	word ptr [bp-4]
@61@194:
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr __fstrlen
	pop	cx
	pop	cx
	cmp	ax,word ptr [bp-4]
	jg	short @61@50
   ;	
   ;	#endif
   ;	},
   ;	
	mov	ax,di
	add	ax,10
	cmp	ax,si
	jle	short @61@266
   ;	
   ;	
   ;	
	mov	ax,di
	add	ax,10
	mov	si,ax
@61@266:
   ;	
   ;	far LSMenu[]=
   ;	{
   ;	
	mov	ax,word ptr DGROUP:_WindowH
	shr	ax,1
	push	ax
	mov	ax,word ptr [bp-2]
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	sub	dx,ax
	mov	word ptr DGROUP:_PrintY,dx
   ;	
   ;		{1,"",0},
   ;	
	mov	ax,si
	mov	bx,2
	cwd	
	idiv	bx
	mov	dx,160
	sub	dx,ax
	mov	word ptr DGROUP:_WindowX,dx
	mov	ax,dx
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;		{1,"",0},
   ;		{1,"",0},
   ;	
	mov	ax,23
	push	ax
	mov	ax,word ptr [bp-2]
	add	ax,10
	push	ax
	mov	ax,si
	add	ax,10
	push	ax
	mov	ax,word ptr DGROUP:_PrintY
	sub	ax,5
	push	ax
	mov	ax,word ptr DGROUP:_WindowX
	sub	ax,5
	push	ax
	call	near ptr _DrawWindow
	add	sp,10
   ;	
   ;		{1,"",0},
   ;	
	mov	ax,19
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,word ptr [bp-2]
	add	ax,10
	push	ax
	mov	ax,si
	add	ax,10
	push	ax
	mov	ax,word ptr DGROUP:_PrintY
	sub	ax,5
	push	ax
	mov	ax,word ptr DGROUP:_WindowX
	sub	ax,5
	push	ax
	call	near ptr _DrawOutline
	add	sp,12
   ;	
   ;		{1,"",0},
   ;	
	mov	byte ptr DGROUP:_fontcolor,0
	mov	byte ptr DGROUP:_backcolor,23
   ;	
   ;		{1,"",0},
   ;	
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		{1,"",0},
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		{1,"",0},
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_Message	endp
   ;	
   ;	////////////////////////////////////////////////////////////
   ;	
	assume	cs:_TEXT
_StartCPMusic	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	//
   ;	// INPUT MANAGER SCANCODE TABLES
   ;	//
   ;	////////////////////////////////////////////////////////////////////
   ;	
	mov	bx,word ptr DGROUP:lastmusic
	shl	bx,1
	cmp	word ptr DGROUP:_audiosegs[bx+522],0
	je	short @62@74
   ;	
   ;	static byte
   ;	
	mov	ax,word ptr DGROUP:lastmusic
	shl	ax,1
	add	ax,offset DGROUP:_audiosegs+522
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
@62@74:
   ;	
   ;						*ScanNames[] =		// Scan code names with single chars
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:lastmusic,ax
   ;	
   ;						{
   ;		"?","?","1","2","3","4","5","6","7","8","9","0","-","+","?","?",
   ;	
	call	near ptr _SD_MusicOff
   ;	
   ;		"Q","W","E","R","T","Y","U","I","O","P","[","]","|","?","A","S",
   ;	
	mov	si,word ptr [bp+4]
   ;	
   ;		"D","F","G","H","J","K","L",";","\"","?","?","?","Z","X","C","V",
   ;		"B","N","M",",",".","/","?","?","?","?","?","?","?","?","?","?",
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _MM_BombOnError
	pop	cx
   ;	
   ;		"?","?","?","?","?","?","?","?","\xf","?","-","\x15","5","\x11","+","?",
   ;	
	mov	ax,si
	add	ax,261
	push	ax
	call	near ptr _CA_CacheAudioChunk
	pop	cx
   ;	
   ;		"\x13","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?",
   ;	
	mov	ax,1
	push	ax
	call	near ptr _MM_BombOnError
	pop	cx
   ;	
   ;		"?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?",
   ;	
	cmp	word ptr DGROUP:_mmerror,0
	je	short @62@122
   ;	
   ;		"?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?"
   ;	
	mov	word ptr DGROUP:_mmerror,0
	jmp	short @62@146
@62@122:
   ;	
   ;						},	// DEBUG - consolidate these
   ;						far ExtScanCodes[] =	// Scan codes with >1 char names
   ;						{
   ;	
	mov	ax,1
	push	ax
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_audiosegs+522
	push	ax
	call	near ptr _MM_SetLock
	pop	cx
	pop	cx
   ;	
   ;		1,0xe,0xf,0x1d,0x2a,0x39,0x3a,0x3b,0x3c,0x3d,0x3e,
   ;	
	mov	bx,si
	shl	bx,1
	push	word ptr DGROUP:_audiosegs[bx+522]
	xor	ax,ax
	push	ax
	call	near ptr _SD_StartMusic
	pop	cx
	pop	cx
@62@146:
   ;	
   ;		0x3f,0x40,0x41,0x42,0x43,0x44,0x57,0x59,0x46,0x1c,0x36,
   ;		0x37,0x38,0x47,0x49,0x4f,0x51,0x52,0x53,0x45,0x48,
   ;	
	pop	si
	pop	bp
	ret	
_StartCPMusic	endp
   ;	
   ;	?","?","?","?","?","?",
   ;	
	assume	cs:_TEXT
_FreeMusic	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;		"?","?","?","?","?","?","?","?","\xf","?","-","\x15","5","\x11","+","?",
   ;		"\x13","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?",
   ;	
	mov	bx,word ptr DGROUP:lastmusic
	shl	bx,1
	cmp	word ptr DGROUP:_audiosegs[bx+522],0
	je	short @63@74
   ;	
   ;		"?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?",
   ;	
	mov	ax,word ptr DGROUP:lastmusic
	shl	ax,1
	add	ax,offset DGROUP:_audiosegs+522
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
@63@74:
   ;	
   ;		"?","?","?","?","?","?","?","?","?","?","?","?","?","?","?","?"
   ;	
	pop	bp
	ret	
_FreeMusic	endp
   ;	
   ;	es
   ;	
	assume	cs:_TEXT
_IN_GetScanName	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
   ;	
   ;						{
   ;		1,0xe,0xf,0x1d,0x2a,0x39,0x3a,0x3b,0x3c,0x3d,0x3e,
   ;		0x3f,0x40,0x41,0x42,0x43,0x44,0x57,0x59,0x46,0x1c,0x36,
   ;		0x37,0x38,0x47,0x49,0x4f,0x51,0x52,0x53,0x45,0x48,
   ;		0x50,0x4b,0x4d,0x00
   ;	
	mov	word ptr [bp-4],offset ExtScanCodes
	mov	word ptr [bp-2],WL_MENU13_FAR
	mov	si,offset DGROUP:ExtScanNames
	jmp	short @64@122
@64@50:
   ;	
   ;						},
   ;	
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr es:[bx]
	cmp	al,byte ptr [bp+4]
	jne	short @64@98
   ;	
   ;						*ExtScanNames[] =	// Names corresponding to ExtScanCodes
   ;	
	mov	ax,word ptr [si]
	jmp	short @64@170
@64@98:
	inc	si
	inc	si
	inc	word ptr [bp-4]
@64@122:
	les	bx,dword ptr [bp-4]
	cmp	byte ptr es:[bx],0
	jne	short @64@50
   ;	
   ;						{
   ;		"Esc","BkSp","Tab","Ctrl","LShft","Space","CapsLk","F1","F2","F3","F4",
   ;	
	mov	al,byte ptr [bp+4]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	mov	ax,word ptr DGROUP:ScanNames[bx]
	jmp	short @64@170
@64@170:
   ;	
   ;		"F5","F6","F7","F8","F9","F10","F11","F12","ScrlLk","Enter","RShft",
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_IN_GetScanName	endp
   ;	
   ;	","Enter","RShft",
   ;	
	assume	cs:_TEXT
_CheckPause	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;		"PrtSc","Alt","Home","PgUp","End","PgDn","Ins","Del","NumLk","Up",
   ;		"Down","Left","Right",""
   ;	
	cmp	word ptr DGROUP:_Paused,0
	je	short @65@218
   ;	
   ;						};
   ;	
   ;	
	mov	ax,word ptr DGROUP:_SoundStatus
	or	ax,ax
	je	short @65@146
	cmp	ax,1
	je	short @65@170
	jmp	short @65@194
@65@146:
   ;	
   ;	
   ;	////////////////////////////////////////////////////////////////////
   ;	
	call	near ptr _SD_MusicOn
	jmp	short @65@194
@65@170:
   ;	
   ;	//
   ;	
	call	near ptr _SD_MusicOff
	jmp	short @65@194
@65@194:
   ;	
   ;	// Wolfenstein Control Panel!  Ta Da!
   ;	//
   ;	////////////////////////////////////////////////////////////////////
   ;	
	xor	word ptr DGROUP:_SoundStatus,1
   ;	
   ;	void US_ControlPanel(byte scancode)
   ;	
	mov	ax,3
	push	ax
	call	near ptr _VL_WaitVBL
	pop	cx
   ;	
   ;	{
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;		int which,i,start;
   ;	
	mov	word ptr DGROUP:_Paused,0
@65@218:
   ;	
   ;	
   ;	
   ;	
	pop	bp
	ret	
_CheckPause	endp
   ;	
   ;	artCPMusic(MENUSONG);
   ;	
	assume	cs:_TEXT
_DrawMenuGun	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;		SetupControlPanel();
   ;	
   ;		//
   ;		// F-KEYS FROM WITHIN GAME
   ;		//
   ;	
	mov	ax,word ptr [si]
	mov	word ptr [bp-2],ax
   ;	
   ;		switch(scancode)
   ;	
	mov	ax,word ptr [si+6]
	mov	dx,13
	imul	dx
	mov	dx,word ptr [si+2]
	add	dx,ax
	add	dx,65534
	mov	di,dx
   ;	
   ;		{
   ;	
	mov	ax,11
	push	ax
	push	di
	push	word ptr [bp-2]
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;			case sc_F1:
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_DrawMenuGun	endp
   ;	
   ;			CP_LoadGame(0);
   ;	
	assume	cs:_TEXT
_DrawStripes	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;				goto finishup;
   ;	
   ;			case sc_F4:
   ;	
	xor	ax,ax
	push	ax
	mov	ax,24
	push	ax
	mov	ax,320
	push	ax
	push	word ptr [bp+4]
	xor	ax,ax
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;				CP_Sound();
   ;	
	mov	ax,44
	push	ax
	mov	ax,word ptr [bp+4]
	add	ax,22
	push	ax
	mov	ax,319
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VWB_Hlin
	add	sp,8
   ;	
   ;				goto finishup;
   ;	
   ;			case sc_F5:
   ;				CP_ChangeView();
   ;				goto finishup;
   ;	
	pop	bp
	ret	
_DrawStripes	endp
   ;	
   ;	Control();
   ;	
	assume	cs:_TEXT
_ShootSnd	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;				goto finishup;
   ;	
   ;	
	mov	ax,32
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			finishup:
   ;	
	pop	bp
	ret	
_ShootSnd	endp
   ;	
   ;	dif
   ;	
	assume	cs:_TEXT
_CheckForEpisodes	proc	near
	push	bp
	mov	bp,sp
	sub	sp,44
   ;	
   ;	
   ;		DrawMainMenu();
   ;		MenuFadeIn();
   ;		StartGame=0;
   ;	
   ;		//
   ;		// MAIN MENU LOOP
   ;		//
   ;		do
   ;		{
   ;			which=HandleMenu(&MainItems,&MainMenu[0],NULL);
   ;	
   ;			#ifdef SPEAR
   ;			#ifndef SPEARDEMO
   ;			//
   ;			// EASTER EGG FOR SPEAR OF DESTINY!
   ;			//
   ;			if (Keyboard[sc_I] && Keyboard[sc_D])
   ;			{
   ;				VW_FadeOut();
   ;				StartCPMusic (XJAZNAZI_MUS);
   ;				UnCacheLump(OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;				UnCacheLump(BACKDROP_LUMP_START,BACKDROP_LUMP_END);
   ;				MM_SortMem ();
   ;				ClearMemory ();
   ;	
   ;	
   ;				CA_CacheGrChunk (IDGUYS1PIC);
   ;				VWB_DrawPic(0,0,IDGUYS1PIC);
   ;				UNCACHEGRCHUNK(IDGUYS1PIC);
   ;	
   ;				CA_CacheGrChunk (IDGUYS2PIC);
   ;				VWB_DrawPic(0,80,IDGUYS2PIC);
   ;				UNCACHEGRCHUNK(IDGUYS2PIC);
   ;	
   ;				VW_UpdateScreen();
   ;	
   ;	
	mov	ax,32
	push	ax
	lea	ax,word ptr [bp-44]
	push	ax
	mov	ax,offset DGROUP:s@+1362
	push	ax
	call	near ptr _findfirst
	add	sp,6
	or	ax,ax
	jne	short @69@74
   ;	
   ;				CA_CacheGrChunk (IDGUYSPALETTE);
   ;				VL_FadeIn(0,255,grsegs[IDGUYSPALETTE],30);
   ;	
	mov	ax,offset DGROUP:s@+1368
	push	ax
	mov	ax,offset DGROUP:_extension
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;				UNCACHEGRCHUNK(IDGUYSPALETTE);
   ;	
   ;	
   ;	
   ;				while (Keyboard[sc_I] || Keyboard[sc_D]);
   ;				IN_ClearKeysDown();
   ;				IN_Ack();
   ;	
   ;				VW_FadeOut();
   ;	
   ;				CacheLump(BACKDROP_LUMP_START,BACKDROP_LUMP_END);
   ;				CacheLump(OPTIONS_LUMP_START,OPTIONS_LUMP_END);
   ;	
	mov	ax,1
	mov	word ptr DGROUP:_EpisodeSelect+10,ax
	mov	word ptr DGROUP:_EpisodeSelect+8,ax
	mov	word ptr DGROUP:_EpisodeSelect+6,ax
	mov	word ptr DGROUP:_EpisodeSelect+4,ax
	mov	word ptr DGROUP:_EpisodeSelect+2,ax
	mov	dx,seg _NewEmenu
	mov	es,dx
	mov	word ptr es:_NewEmenu+400,ax
	mov	dx,seg _NewEmenu
	mov	es,dx
	mov	word ptr es:_NewEmenu+320,ax
	mov	dx,seg _NewEmenu
	mov	es,dx
	mov	word ptr es:_NewEmenu+240,ax
	mov	dx,seg _NewEmenu
	mov	es,dx
	mov	word ptr es:_NewEmenu+160,ax
	mov	dx,seg _NewEmenu
	mov	es,dx
	mov	word ptr es:_NewEmenu+80,ax
   ;	
   ;				DrawMainMenu();
   ;	
	jmp	short @69@194
@69@74:
   ;	
   ;				StartCPMusic (MENUSONG);
   ;				MenuFadeIn();
   ;	
	mov	ax,32
	push	ax
	lea	ax,word ptr [bp-44]
	push	ax
	mov	ax,offset DGROUP:s@+1372
	push	ax
	call	near ptr _findfirst
	add	sp,6
	or	ax,ax
	jne	short @69@122
   ;	
   ;			}
   ;			#endif
   ;	
	mov	ax,offset DGROUP:s@+1378
	push	ax
	mov	ax,offset DGROUP:_extension
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;			#endif
   ;	
   ;	
   ;	
   ;			switch(which)
   ;			{
   ;	
	mov	ax,1
	mov	word ptr DGROUP:_EpisodeSelect+4,ax
	mov	word ptr DGROUP:_EpisodeSelect+2,ax
	mov	dx,seg _NewEmenu
	mov	es,dx
	mov	word ptr es:_NewEmenu+160,ax
	mov	dx,seg _NewEmenu
	mov	es,dx
	mov	word ptr es:_NewEmenu+80,ax
   ;	
   ;				case viewscores:
   ;	
	jmp	short @69@194
@69@122:
   ;	
   ;					if (MainMenu[viewscores].routine == NULL)
   ;						if (CP_EndGame())
   ;							StartGame=1;
   ;	
   ;					DrawMainMenu();
   ;					MenuFadeIn();
   ;					break;
   ;	
   ;				case backtodemo:
   ;					#ifdef SPEAR
   ;					if (!ingame)
   ;					{
   ;						//
   ;						// DEALLOCATE ALL SOUNDS!
   ;						//
   ;						switch (SoundMode)
   ;						{
   ;							case sdm_PC:
   ;								start = STARTPCSOUNDS;
   ;								break;
   ;							case sdm_AdLib:
   ;								start = STARTADLIBSOUNDS;
   ;								break;
   ;						}
   ;	
   ;	
	mov	ax,32
	push	ax
	lea	ax,word ptr [bp-44]
	push	ax
	mov	ax,offset DGROUP:s@+1382
	push	ax
	call	near ptr _findfirst
	add	sp,6
	or	ax,ax
	jne	short @69@170
   ;	
   ;						if (SoundMode != sdm_Off)
   ;							for (i=0;i<NUMSOUNDS;i++,start++)
   ;	
	mov	ax,offset DGROUP:s@+1388
	push	ax
	mov	ax,offset DGROUP:_extension
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;								if (audiosegs[start])
   ;	
	jmp	short @69@194
@69@170:
   ;	
   ;									MM_SetPurge (&(memptr)audiosegs[start],3);		// make purgable
   ;					}
   ;	
	mov	ax,offset DGROUP:s@+1392
	push	ax
	call	near ptr _Quit
	pop	cx
@69@194:
   ;	
   ;					#endif
   ;	
   ;					MM_SortMem();
   ;	
	mov	ax,offset DGROUP:_extension
	push	ax
	mov	ax,offset DGROUP:_configname
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;					StartGame=1;
   ;	
	mov	ax,offset DGROUP:_extension
	push	ax
	mov	ax,offset DGROUP:_SaveName
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;					if (!ingame)
   ;	
	mov	ax,offset DGROUP:_extension
	push	ax
	mov	ax,offset DGROUP:_PageFileName
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;						StartCPMusic(INTROSONG);
   ;	
	mov	ax,offset DGROUP:_extension
	push	ax
	mov	ax,offset DGROUP:_audioname
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;					VL_FadeOut(0,255,0,0,0,10);
   ;	
	mov	ax,offset DGROUP:_extension
	push	ax
	mov	ax,offset DGROUP:_demoname
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;					break;
   ;	
   ;				case -1:
   ;				case quit:
   ;					CP_Quit();
   ;	
	mov	ax,offset DGROUP:_extension
	push	ax
	mov	ax,offset DGROUP:_endfilename
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;					break;
   ;	
   ;				default:
   ;	
	mov	sp,bp
	pop	bp
	ret	
_CheckForEpisodes	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_SaveGamesAvail	label	word
	db	20 dup (?)
_StartGame	label	word
	db	2 dup (?)
_pickquick	label	word
	db	2 dup (?)
lastmusic	label	word
	db	2 dup (?)
_menuitems	label	word
	db	2 dup (?)
_SaveGameNames	label	byte
	db	320 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'?'
	db	0
	db	'?'
	db	0
	db	'1'
	db	0
	db	'2'
	db	0
	db	'3'
	db	0
	db	'4'
	db	0
	db	'5'
	db	0
	db	'6'
	db	0
	db	'7'
	db	0
	db	'8'
	db	0
	db	'9'
	db	0
	db	'0'
	db	0
	db	'-'
	db	0
	db	'+'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'Q'
	db	0
	db	'W'
	db	0
	db	'E'
	db	0
	db	'R'
	db	0
	db	'T'
	db	0
	db	'Y'
	db	0
	db	'U'
	db	0
	db	'I'
	db	0
	db	'O'
	db	0
	db	'P'
	db	0
	db	'['
	db	0
	db	']'
	db	0
	db	'|'
	db	0
	db	'?'
	db	0
	db	'A'
	db	0
	db	'S'
	db	0
	db	'D'
	db	0
	db	'F'
	db	0
	db	'G'
	db	0
	db	'H'
	db	0
	db	'J'
	db	0
	db	'K'
	db	0
	db	'L'
	db	0
	db	';'
	db	0
	db	'"'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'Z'
	db	0
	db	'X'
	db	0
	db	'C'
	db	0
	db	'V'
	db	0
	db	'B'
	db	0
	db	'N'
	db	0
	db	'M'
	db	0
	db	','
	db	0
	db	'.'
	db	0
	db	'/'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	15
	db	0
	db	'?'
	db	0
	db	'-'
	db	0
	db	21
	db	0
	db	'5'
	db	0
	db	17
	db	0
	db	'+'
	db	0
	db	'?'
	db	0
	db	19
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'?'
	db	0
	db	'Esc'
	db	0
	db	'BkSp'
	db	0
	db	'Tab'
	db	0
	db	'Ctrl'
	db	0
	db	'LShft'
	db	0
	db	'Space'
	db	0
	db	'CapsLk'
	db	0
	db	'F1'
	db	0
	db	'F2'
	db	0
	db	'F3'
	db	0
	db	'F4'
	db	0
	db	'F5'
	db	0
	db	'F6'
	db	0
	db	'F7'
	db	0
	db	'F8'
	db	0
	db	'F9'
	db	0
	db	'F10'
	db	0
	db	'F11'
	db	0
	db	'F12'
	db	0
	db	'ScrlLk'
	db	0
	db	'Enter'
	db	0
	db	'RShft'
	db	0
	db	'PrtSc'
	db	0
	db	'Alt'
	db	0
	db	'Home'
	db	0
	db	'PgUp'
	db	0
	db	'End'
	db	0
	db	'PgDn'
	db	0
	db	'Ins'
	db	0
	db	'Del'
	db	0
	db	'NumLk'
	db	0
	db	'Up'
	db	0
	db	'Down'
	db	0
	db	'Left'
	db	0
	db	'Right'
	db	0
	db	0
	db	'End Game'
	db	0
	db	'Game'
	db	0
	db	'Demo'
	db	0
	db	'C>'
	db	0
	db	'Are you sure you want'
	db	10
	db	'to end the game you'
	db	10
	db	'are playing? (Y or N):'
	db	0
	db	'Saving...'
	db	0
	db	'"?'
	db	0
	db	'Are you sure you want'
	db	10
	db	'to end the game you'
	db	10
	db	'are playing? (Y or N):'
	db	0
	db	'View Scores'
	db	0
	db	'Please select "Read This!"'
	db	10
	db	'from the Options menu to'
	db	10
	db	'find out how to order this'
	db	10
	db	'episode from Apogee.'
	db	0
	db	'You are currently in'
	db	10
	db	'a game. Continuing will'
	db	10
	db	'erase old game. Ok?'
	db	0
	db	'Which episode to play?'
	db	0
	db	'How tough are you?'
	db	0
	db	'Loading...'
	db	0
	db	'Saving...'
	db	0
	db	'      - empty -'
	db	0
	db	'There'
	db	39
	db	's already a game'
	db	10
	db	'saved at this position.'
	db	10
	db	'      Overwrite?'
	db	0
	db	'    Calibrate'
	db	10
	db	'    Joystick'
	db	10
	db	0
	db	'Move joystick to'
	db	10
	db	'upper left and'
	db	10
	db	'press button 0'
	db	10
	db	0
	db	'   ESC to exit'
	db	0
	db	'goobers'
	db	0
	db	'    Calibrate'
	db	10
	db	'    Joystick'
	db	10
	db	0
	db	'Move joystick to'
	db	10
	db	'lower right and'
	db	10
	db	'press button 1'
	db	10
	db	0
	db	'   ESC to exit'
	db	0
	db	'goobers'
	db	0
	db	'Adjust Mouse Sensitivity'
	db	0
	db	'Slow'
	db	0
	db	'Fast'
	db	0
	db	'goobers'
	db	0
	db	'?'
	db	0
	db	'Mouse'
	db	10
	db	0
	db	'Run'
	db	0
	db	'Open'
	db	0
	db	'Fire'
	db	0
	db	'L'
	db	0
	db	'R'
	db	10
	db	0
	db	10
	db	0
	db	'Joystick/Gravis GamePad'
	db	10
	db	0
	db	'Run'
	db	0
	db	'Open'
	db	0
	db	'Fire'
	db	0
	db	'L'
	db	0
	db	'R'
	db	10
	db	0
	db	10
	db	0
	db	'Keyboard'
	db	10
	db	0
	db	'Run'
	db	0
	db	'Open'
	db	0
	db	'Fire'
	db	0
	db	'L'
	db	0
	db	'R'
	db	10
	db	0
	db	10
	db	0
	db	'Left'
	db	0
	db	'Right'
	db	0
	db	'Frwd'
	db	0
	db	'Bkwrd'
	db	10
	db	0
	db	'goobers'
	db	0
	db	'Thinking...'
	db	0
	db	'Use arrows to size'
	db	10
	db	0
	db	'ENTER to accept'
	db	10
	db	0
	db	'ESC to cancel'
	db	0
	db	'goobers'
	db	0
	db	10
	db	0
	db	'_'
	db	0
	db	'goobers'
	db	0
	db	'*.WL6'
	db	0
	db	'WL6'
	db	0
	db	'*.WL3'
	db	0
	db	'WL3'
	db	0
	db	'*.WL1'
	db	0
	db	'WL1'
	db	0
	db	'NO WOLFENSTEIN 3-D DATA FILES to be found!'
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	extrn	_VL_SetVGAPlaneMode:near
	public	_DefineKeyBtns
	public	_DefineJoyBtns
	public	_EraseGun
	extrn	_PicturePause:near
	extrn	_XMSPagesAvail:word
	extrn	__fstrcpy:near
	extrn	_NewViewSize:near
	extrn	_lseek:near
	public	_FreeMusic
	extrn	_EMSPagesAvail:word
	public	_SetTextColor
	extrn	_SD_WaitSoundDone:near
	extrn	_VL_TestPaletteSet:near
	public	_SndItems
	public	_SaveGameNames
	extrn	_buttonmouse:word
	extrn	_PageFileName:byte
	public	_DrawMenu
	extrn	_DrawAmmo:near
	extrn	_DrawLives:near
	extrn	_DrawLevel:near
	public	_DrawGun
	extrn	_printf:near
	extrn	_grneeded:byte
	extrn	__fstrlen:near
	public	_SndMenu
	extrn	_SoundBlasterPresent:word
	public	_FixupCustom
	extrn	_SaveTheGame:near
	extrn	_PrintY:word
	extrn	_PrintX:word
	extrn	_MM_FreePtr:near
	public	_CheckForEpisodes
	extrn	_SD_SetDigiDevice:near
	extrn	_ca_levelbit:byte
	extrn	_unlink:near
	extrn	_DrawFace:near
	extrn	_viewwidth:word
	extrn	_ingame:word
	extrn	_XMSPresent:word
	extrn	_gamestate:word
	extrn	_SoundSourcePresent:word
	extrn	_findfirst:near
	public	_HandleMenu
	extrn	_VL_SetPalette:near
	public	_mbarray
	extrn	_EMSPresent:word
	extrn	_SD_SetMusicMode:near
	extrn	_SD_SetSoundMode:near
	extrn	_findnext:near
	extrn	_ShowViewSize:near
	extrn	_grsegs:word
	extrn	_buttonjoy:word
	extrn	_backcolor:byte
	public	_menuitems
	extrn	_audioname:byte
	extrn	_TimeCount:word
	public	_NewEitems
	public	_MainItems
	extrn	_MM_SortMem:near
_lastmusic	equ	lastmusic
	public	_MouseSensitivity
	public	_CacheLump
	extrn	_buttonscan:word
	extrn	_MM_SetLock:near
	extrn	_IN_Ack:near
	extrn	_SD_StartMusic:near
	extrn	_Keyboard:word
	extrn	_audiosegs:word
	public	_order
	extrn	_WindowH:word
	extrn	_WindowW:word
	extrn	_WindowY:word
	extrn	_WindowX:word
	extrn	_demoname:byte
	public	_pickquick
	extrn	_SD_StopSound:near
	extrn	_SD_PlaySound:near
	public	_NewEmenu
	public	_MainMenu
	public	_SaveName
	public	_NewItems
	extrn	_AdLibPresent:word
	extrn	_MusicMode:word
	public	_CusItems
	public	_CP_ViewScores
	public	_CP_ChangeView
	extrn	_creat:near
	extrn	_mmerror:word
	public	_EpisodeSelect
	extrn	_mouseadjustment:word
	public	_CP_CheckQuick
	public	_StartCPMusic
	extrn	__dos_write:near
	public	_NewMenu
	extrn	_VL_FadeOut:near
	extrn	_NewGame:near
	public	_CusMenu
_ExtScanNames	equ	ExtScanNames
_ExtScanCodes	equ	ExtScanCodes
	public	_CP_SaveGame
	public	_CP_LoadGame
	public	_ClearMScreen
	extrn	_DigiMode:word
	public	_TicDelay
	public	_CheckPause
	extrn	_LastScan:byte
	extrn	_joystickenabled:word
	extrn	_playstate:word
	public	_Message
	extrn	_SD_MusicOff:near
	public	_WaitKeyUp
	extrn	_VW_UpdateScreen:near
	public	_US_ControlPanel
	public	_CP_Control
	extrn	_gamepal:byte
	extrn	_dirscan:word
	public	_CP_EndGame
	public	_CP_NewGame
	extrn	_extension:byte
	extrn	_mminfo:word
	extrn	_StartMusic:near
	extrn	_startgame:word
	extrn	_IN_ClearKeysDown:near
	extrn	_US_LineInput:near
	public	_StartGame
	extrn	_joystickport:word
	extrn	_Paused:word
	public	_DrawLoadSaveScreen
	extrn	_MS_CheckParm:near
	extrn	_LastASCII:byte
	extrn	_joypadenabled:word
	public	_color_hlite
	public	_ShootSnd
	extrn	_MousePresent:word
	public	_SoundStatus
	public	_CP_Sound
	extrn	_DrawAllPlayBorder:near
	public	_CtlItems
	extrn	_INL_GetJoyDelta:near
	extrn	_Quit:near
	extrn	_mouseenabled:word
	public	_color_norml
	extrn	_JoysPresent:word
	extrn	_read:near
	extrn	_IN_MouseButtons:near
	extrn	_LoadTheGame:near
	extrn	_LoadLatchMem:near
	public	_CtlMenu
	extrn	_strcpy:near
	public	_DrawCustomScreen
	public	_PrintCustMouse
	extrn	_VWB_DrawPic:near
	public	_PrintCustKeys
	extrn	_loadedgame:word
	extrn	_configname:byte
	public	_CP_Quit
	extrn	_SD_MusicOn:near
	extrn	_alOut:near
	extrn	_IN_ReadControl:near
	public	_TrackWhichGame
	extrn	_close:near
	public	_DrawNewGameDiff
	extrn	_CA_CacheAudioChunk:near
	public	_IN_GetScanName
	public	_EnterCtrlData
	extrn	_fontcolor:byte
	public	_DrawCustMouse
	extrn	N_SCOPY@:far
	extrn	_fontnumber:word
	public	_DrawCustKeys
	extrn	_US_CPrint:near
	extrn	_strcat:near
	extrn	_IN_JoyButtons:near
	public	_DrawMouseSens
	public	_DrawSoundMenu
	extrn	_DrawHighScores:near
	extrn	_DrawPlayScreen:near
	public	_DrawChangeView
	extrn	_VL_WaitVBL:near
	public	_DrawNewEpisode
	public	_PrintLSEntry
	public	_PrintCustKeybd
	extrn	_VL_FadeIn:near
	public	_moveorder
	public	_PrintCustJoy
	extrn	_US_Print:near
	extrn	N_LDIV@:far
	public	_DrawLSAction
_ScanNames	equ	ScanNames
	public	_SetupControlPanel
	public	_DrawMainMenu
	extrn	_SoundMode:word
	public	_DrawCtlScreen
	public	_DrawMenuGun
	extrn	_VWB_Vlin:near
	extrn	_VWB_Hlin:near
	public	_CalibrateJoystick
	extrn	_open:near
	public	_DrawCustKeybd
	public	_Confirm
	extrn	N_LXLSH@:far
	extrn	_endfilename:byte
	extrn	_IN_SetupJoy:near
	public	_UnCacheLump
	public	_DrawCustJoy
	public	_LSItems
	public	_DefineMouseBtns
	public	_DrawOutline
	extrn	_CA_CacheGrChunk:near
	public	_DrawNewGame
	public	_DrawHalfStep
	extrn	_DrawHealth:near
	extrn	_CA_LoadAllSounds:near
	extrn	_IN_GetJoyAbs:near
	public	_ReadAnyControl
	extrn	_MM_BombOnError:near
	public	_LSMenu
	extrn	_DrawWeapon:near
	public	_DrawWindow
	extrn	_PM_CheckMainMem:near
	extrn	_US_RndT:near
	public	_DefineKeyMove
	public	_IntroScreen
	public	_DrawStripes
	public	_CleanupControlPanel
	public	_BossKey
	public	_CustomControls
	extrn	_VWB_Bar:near
	public	_endStrings
	extrn	_lasttimecount:word
	public	_SaveGamesAvail
	extrn	_DrawScore:near
	extrn	_DrawKeys:near
	end
