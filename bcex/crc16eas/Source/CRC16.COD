	ifndef	??version
?debug	macro
	endm
publicdll macro	name
	public	name
	endm
$comm	macro	name,dist,size,count
	comm	dist name:BYTE:count*size
	endm
	else
$comm	macro	name,dist,size,count
	comm	dist name[size]:BYTE:count
	endm
	endif
	?debug	V 300h
	?debug	S "crc16.cpp"
	?debug	C E9795AFE540963726331362E637070
	?debug	C E94019CA181B433A5C424F524C414E44435C494E434C5544455C73+
	?debug	C 7464696F2E68
	?debug	C E94019CA181B433A5C424F524C414E44435C494E434C5544455C5F+
	?debug	C 646566732E68
	?debug	C E94019CA181C433A5C424F524C414E44435C494E434C5544455C5F+
	?debug	C 6E66696C652E68
	?debug	C E94019CA181B433A5C424F524C414E44435C494E434C5544455C5F+
	?debug	C 6E756C6C2E68
	?debug	C E94019CA181C433A5C424F524C414E44435C494E434C5544455C73+
	?debug	C 74646C69622E68
	?debug	C E94019CA181C433A5C424F524C414E44435C494E434C5544455C73+
	?debug	C 7472696E672E68
	?debug	C E9695B8C3A19433A5C424F524C414E44435C494E434C5544455C64+
	?debug	C 6F732E68
	?debug	C E94019CA181A433A5C424F524C414E44435C494E434C5544455C74+
	?debug	C 696D652E68
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
_DATA	segment word public 'DATA'
_crc16tab	label	word
	db	0
	db	0
	db	193
	db	192
	db	129
	db	193
	db	64
	db	1
	db	1
	db	195
	db	192
	db	3
	db	128
	db	2
	db	65
	db	194
	db	1
	db	198
	db	192
	db	6
	db	128
	db	7
	db	65
	db	199
	db	0
	db	5
	db	193
	db	197
	db	129
	db	196
	db	64
	db	4
	db	1
	db	204
	db	192
	db	12
	db	128
	db	13
	db	65
	db	205
	db	0
	db	15
	db	193
	db	207
	db	129
	db	206
	db	64
	db	14
	db	0
	db	10
	db	193
	db	202
	db	129
	db	203
	db	64
	db	11
	db	1
	db	201
	db	192
	db	9
	db	128
	db	8
	db	65
	db	200
	db	1
	db	216
	db	192
	db	24
	db	128
	db	25
	db	65
	db	217
	db	0
	db	27
	db	193
	db	219
	db	129
	db	218
	db	64
	db	26
	db	0
	db	30
	db	193
	db	222
	db	129
	db	223
	db	64
	db	31
	db	1
	db	221
	db	192
	db	29
	db	128
	db	28
	db	65
	db	220
	db	0
	db	20
	db	193
	db	212
	db	129
	db	213
	db	64
	db	21
	db	1
	db	215
	db	192
	db	23
	db	128
	db	22
	db	65
	db	214
	db	1
	db	210
	db	192
	db	18
	db	128
	db	19
	db	65
	db	211
	db	0
	db	17
	db	193
	db	209
	db	129
	db	208
	db	64
	db	16
	db	1
	db	240
	db	192
	db	48
	db	128
	db	49
	db	65
	db	241
	db	0
	db	51
	db	193
	db	243
	db	129
	db	242
	db	64
	db	50
	db	0
	db	54
	db	193
	db	246
	db	129
	db	247
	db	64
	db	55
	db	1
	db	245
	db	192
	db	53
	db	128
	db	52
	db	65
	db	244
	db	0
	db	60
	db	193
	db	252
	db	129
	db	253
	db	64
	db	61
	db	1
	db	255
	db	192
	db	63
	db	128
	db	62
	db	65
	db	254
	db	1
	db	250
	db	192
	db	58
	db	128
	db	59
	db	65
	db	251
	db	0
	db	57
	db	193
	db	249
	db	129
	db	248
	db	64
	db	56
	db	0
	db	40
	db	193
	db	232
	db	129
	db	233
	db	64
	db	41
	db	1
	db	235
	db	192
	db	43
	db	128
	db	42
	db	65
	db	234
	db	1
	db	238
	db	192
	db	46
	db	128
	db	47
	db	65
	db	239
	db	0
	db	45
	db	193
	db	237
	db	129
	db	236
	db	64
	db	44
	db	1
	db	228
	db	192
	db	36
	db	128
	db	37
	db	65
	db	229
	db	0
	db	39
	db	193
	db	231
	db	129
	db	230
	db	64
	db	38
	db	0
	db	34
	db	193
	db	226
	db	129
	db	227
	db	64
	db	35
	db	1
	db	225
	db	192
	db	33
	db	128
	db	32
	db	65
	db	224
	db	1
	db	160
	db	192
	db	96
	db	128
	db	97
	db	65
	db	161
	db	0
	db	99
	db	193
	db	163
	db	129
	db	162
	db	64
	db	98
	db	0
	db	102
	db	193
	db	166
	db	129
	db	167
	db	64
	db	103
	db	1
	db	165
	db	192
	db	101
	db	128
	db	100
	db	65
	db	164
	db	0
	db	108
	db	193
	db	172
	db	129
	db	173
	db	64
	db	109
	db	1
	db	175
	db	192
	db	111
	db	128
	db	110
	db	65
	db	174
	db	1
	db	170
	db	192
	db	106
	db	128
	db	107
	db	65
	db	171
	db	0
	db	105
	db	193
	db	169
	db	129
	db	168
	db	64
	db	104
	db	0
	db	120
	db	193
	db	184
	db	129
	db	185
	db	64
	db	121
	db	1
	db	187
	db	192
	db	123
	db	128
	db	122
	db	65
	db	186
	db	1
	db	190
	db	192
	db	126
	db	128
	db	127
	db	65
	db	191
	db	0
	db	125
	db	193
	db	189
	db	129
	db	188
	db	64
	db	124
	db	1
	db	180
	db	192
	db	116
	db	128
	db	117
	db	65
	db	181
	db	0
	db	119
	db	193
	db	183
	db	129
	db	182
	db	64
	db	118
	db	0
	db	114
	db	193
	db	178
	db	129
	db	179
	db	64
	db	115
	db	1
	db	177
	db	192
	db	113
	db	128
	db	112
	db	65
	db	176
	db	0
	db	80
	db	193
	db	144
	db	129
	db	145
	db	64
	db	81
	db	1
	db	147
	db	192
	db	83
	db	128
	db	82
	db	65
	db	146
	db	1
	db	150
	db	192
	db	86
	db	128
	db	87
	db	65
	db	151
	db	0
	db	85
	db	193
	db	149
	db	129
	db	148
	db	64
	db	84
	db	1
	db	156
	db	192
	db	92
	db	128
	db	93
	db	65
	db	157
	db	0
	db	95
	db	193
	db	159
	db	129
	db	158
	db	64
	db	94
	db	0
	db	90
	db	193
	db	154
	db	129
	db	155
	db	64
	db	91
	db	1
	db	153
	db	192
	db	89
	db	128
	db	88
	db	65
	db	152
	db	1
	db	136
	db	192
	db	72
	db	128
	db	73
	db	65
	db	137
	db	0
	db	75
	db	193
	db	139
	db	129
	db	138
	db	64
	db	74
	db	0
	db	78
	db	193
	db	142
	db	129
	db	143
	db	64
	db	79
	db	1
	db	141
	db	192
	db	77
	db	128
	db	76
	db	65
	db	140
	db	0
	db	68
	db	193
	db	132
	db	129
	db	133
	db	64
	db	69
	db	1
	db	135
	db	192
	db	71
	db	128
	db	70
	db	65
	db	134
	db	1
	db	130
	db	192
	db	66
	db	128
	db	67
	db	65
	db	131
	db	0
	db	65
	db	193
	db	129
	db	129
	db	128
	db	64
	db	64
_DATA	ends
_TEXT	segment byte public 'CODE'
	?debug	C E8010963726331362E637070795AFE54
   ;	
   ;	int main(void)
   ;	
	?debug	L 62
	assume	cs:_TEXT
_main	proc	near
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,94
	push	si
	push	di
	?debug	B
   ;	
   ;	{
   ;	    /* variables */
   ;	    char filename[80];
   ;	    unsigned int crc16;
   ;	    int ch;
   ;	    unsigned long num;
   ;	    FILE *fp;
   ;	    time_t t, t1;
   ;	
   ;	    puts("CRC16 Easy!  Version 0.1 (pre-official release)   May 26 1997");
   ;	
	?debug	L 72
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _puts
	pop	cx
   ;	
   ;	    puts("Copyright (c) 1997 Devliber. Licensed under the MIT License.\n");
   ;	
	?debug	L 73
	mov	ax,offset DGROUP:s@+62
	push	ax
	call	near ptr _puts
	pop	cx
   ;	
   ;	
   ;	    if (_argc < 2)
   ;	
	?debug	L 75
	cmp	word ptr DGROUP:__argc,2
	jge	short @1@142
   ;	
   ;	    {
   ;	        puts("Usage is: CRC16 <filename>");
   ;	
	?debug	L 77
	mov	ax,offset DGROUP:s@+124
	push	ax
	call	near ptr _puts
	pop	cx
@1@86:
   ;	
   ;	        return 0;
   ;	
	?debug	L 78
	xor	ax,ax
@1@114:
	jmp	@1@422
@1@142:
   ;	
   ;	    }
   ;	
   ;	    if (_argc > 2)
   ;	
	?debug	L 81
	cmp	word ptr DGROUP:__argc,2
	jle	short @1@198
   ;	
   ;	    {
   ;	        printf("Too many parameters - %s\n", _argv[2]);
   ;	
	?debug	L 83
	mov	bx,word ptr DGROUP:__argv
	push	word ptr [bx+4]
	mov	ax,offset DGROUP:s@+151
	push	ax
	call	near ptr _printf
	pop	cx
	pop	cx
	jmp	short @1@86
@1@198:
   ;	
   ;	        return 0;
   ;	    }
   ;	
   ;	    if (strpbrk(_argv[1], "*?"))
   ;	
	?debug	L 87
	mov	ax,offset DGROUP:s@+177
	push	ax
	mov	bx,word ptr DGROUP:__argv
	push	word ptr [bx+2]
	call	near ptr _strpbrk
	pop	cx
	pop	cx
	or	ax,ax
	je	short @1@254
   ;	
   ;	    {
   ;	        puts("Wildcards not allowed");
   ;	
	?debug	L 89
	mov	ax,offset DGROUP:s@+180
	push	ax
	call	near ptr _puts
	pop	cx
   ;	
   ;	        return 2;
   ;	
	?debug	L 90
	mov	ax,2
	jmp	short @1@114
@1@254:
   ;	
   ;	    }
   ;	
   ;	    strcpy(filename, _argv[1]);
   ;	
	?debug	L 93
	mov	bx,word ptr DGROUP:__argv
	push	word ptr [bx+2]
	lea	ax,word ptr [bp-94]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;	    if ((fp = fopen(filename, "rb")) == NULL)
   ;	
	?debug	L 94
	mov	ax,offset DGROUP:s@+202
	push	ax
	lea	ax,word ptr [bp-94]
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	di,ax
	or	ax,ax
	jne	short @1@310
   ;	
   ;	    {
   ;	        puts("Can't open file");
   ;	
	?debug	L 96
	mov	ax,offset DGROUP:s@+205
	push	ax
	call	near ptr _puts
	pop	cx
   ;	
   ;	        return 1;
   ;	
	?debug	L 97
	mov	ax,1
	jmp	short @1@114
@1@310:
   ;	
   ;	    }
   ;	
   ;	    num = 0L;
   ;	
	?debug	L 100
	mov	word ptr [bp-4],0
	mov	word ptr [bp-6],0
   ;	
   ;	    crc16 = 0;
   ;	
	?debug	L 101
	xor	si,si
   ;	
   ;	    time(&t);
   ;	
	?debug	L 102
	lea	ax,word ptr [bp-10]
	push	ax
	call	near ptr _time
	pop	cx
	jmp	short @1@366
@1@338:
   ;	
   ;	    while ((ch = fgetc(fp)) != EOF)
   ;	    {
   ;	        num++;
   ;	
	?debug	L 105
	add	word ptr [bp-6],1
	adc	word ptr [bp-4],0
   ;	
   ;	        crc16 = updcrcr(crc16, ch);
   ;	
	?debug	L 106
	push	word ptr [bp-2]
	push	si
	call	near ptr @updcrcr$quii
	pop	cx
	pop	cx
	mov	si,ax
@1@366:
	?debug	L 103
	push	di
	call	near ptr _fgetc
	pop	cx
	mov	word ptr [bp-2],ax
	cmp	ax,-1
	jne	short @1@338
   ;	
   ;	    }
   ;	    fclose(fp);
   ;	
	?debug	L 108
	push	di
	call	near ptr _fclose
	pop	cx
   ;	
   ;	    time(&t1);
   ;	
	?debug	L 109
	lea	ax,word ptr [bp-14]
	push	ax
	call	near ptr _time
	pop	cx
   ;	
   ;	    printf("%lu byte(s) read, CRC16 is %04X\nDone in %u second(s)\n", num,
   ;	
	?debug	L 110
   ;	
   ;	           crc16, t1 - t);
   ;	
	?debug	L 111
	mov	ax,word ptr [bp-12]
	mov	dx,word ptr [bp-14]
	sub	dx,word ptr [bp-10]
	sbb	ax,word ptr [bp-8]
	push	ax
	push	dx
	push	si
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	mov	ax,offset DGROUP:s@+221
	push	ax
	call	near ptr _printf
	add	sp,12
	jmp	@1@86
@1@422:
   ;	
   ;	    return 0;
   ;	}
   ;	
	?debug	L 113
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E3190446494C4510001E01
	?debug	C E31A000200150804
	?debug	C E318000200151904
	?debug	C E31B0050001A02
	?debug	C E60274310602F2FF0001740602F6FF0002667018+
	?debug	C 040700036E756D0C02FAFF000263680402FEFF00+
	?debug	C 0563726331360A0406000866696C656E616D651B+
	?debug	C 02A2FF00
	?debug	E
	?debug	E
_main	endp
   ;	
   ;	unsigned int updcrcr(unsigned int crc, int c)
   ;	
	?debug	L 116
	assume	cs:_TEXT
@updcrcr$quii	proc	near
	?debug	B
	push	bp
	mov	bp,sp
	sub	sp,2
	?debug	C E60163040A060000036372630A0A040000
	mov	dx,word ptr [bp+4]
	?debug	B
   ;	
   ;	{
   ;	    int tmp;
   ;	    tmp = crc ^ c;
   ;	
	?debug	L 119
	mov	ax,dx
	xor	ax,word ptr [bp+6]
	mov	word ptr [bp-2],ax
   ;	
   ;	    crc = (crc >> 8) ^ crc16tab[tmp & 0xff];
   ;	
	?debug	L 120
	mov	ax,dx
	mov	cl,8
	shr	ax,cl
	mov	bx,word ptr [bp-2]
	and	bx,255
	shl	bx,1
	xor	ax,word ptr DGROUP:_crc16tab[bx]
	mov	dx,ax
   ;	
   ;	    return crc;
   ;	
	?debug	L 121
	mov	ax,dx
	jmp	short @2@58
@2@58:
   ;	
   ;	}
   ;	
	?debug	L 122
	mov	sp,bp
	pop	bp
	ret	
	?debug	C E603746D700402FEFF00036372630A0C02000163+
	?debug	C 040A060000
	?debug	E
	?debug	E
@updcrcr$quii	endp
	?debug	C E9
	?debug	C FA00000000
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'CRC16 Easy!  Version 0.1 (pre-official release)   May 26 1997'
	db	0
	db	'Copyright (c) 1997 Devliber. Licensed under the MIT License.'
	db	10
	db	0
	db	'Usage is: CRC16 <filename>'
	db	0
	db	'Too many parameters - %s'
	db	10
	db	0
	db	'*?'
	db	0
	db	'Wildcards not allowed'
	db	0
	db	'rb'
	db	0
	db	'Can'
	db	39
	db	't open file'
	db	0
	db	'%lu byte(s) read, CRC16 is %04X'
	db	10
	db	'Done in %u second(s)'
	db	10
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	public	_main
	public	_crc16tab
	public	@updcrcr$quii
_pokeb	equ	pokeb
_poke	equ	poke
_peekb	equ	peekb
_peek	equ	peek
	extrn	__argv:word
	extrn	__argc:word
	extrn	_strpbrk:near
	extrn	_strcpy:near
	extrn	_time:near
_atoi	equ	atoi
_abs	equ	abs
	extrn	_puts:near
	extrn	_printf:near
	extrn	_fopen:near
	extrn	_fgetc:near
	extrn	_fclose:near
_s@	equ	s@
	?debug	C EA0509
	?debug	C E31C00000023040000
	?debug	C EC055F6D61696E1C1800
	?debug	C E31D0000021A0A
	?debug	C EC095F63726331367461621D0000
	?debug	C E31E000000230A0000
	?debug	C EC0D407570646372637224717569691E1800
	?debug	C E31F02746D12001E0B
	?debug	C E32000000023010000
	?debug	C E32100000023010000
	?debug	C E32200000023020000
	?debug	C E32300000023040000
	?debug	C E3240666696E645F742B001E15
	?debug	C E3250015001A02
	?debug	C E326000D001A02
	?debug	C E327056666626C6B2B001E1C
	?debug	C E3280015001A02
	?debug	C E329000D001A02
	?debug	C E32A075245475041434B14001E23
	?debug	C E32B05535245475308001E2E
	?debug	C E32C045245475310001F33
	?debug	C E32D08574F52445245475310001E36
	?debug	C E32E08425954455245475308001E3F
	?debug	C E32F09646F73646174655F7405001E48
	?debug	C E330046461746504001E4D
	?debug	C E33109646F7374696D655F7404001E51
	?debug	C E3320474696D6504001E56
	?debug	C E3330664657668647212001E5B
	?debug	C E3340008001A02
	?debug	C E33507666174696E666F06001E61
	?debug	C E3360A6469736B667265655F7408001E66
	?debug	C E33705646672656508001E6B
	?debug	C E33808444F534552524F5205001E70
	?debug	C E33907434F554E54525922001E75
	?debug	C E33A0005001A02
	?debug	C E33B0002001A02
	?debug	C E33C0002001A02
	?debug	C E33D0002001A02
	?debug	C E33E0002001A02
	?debug	C E33F0002001A02
	?debug	C E340000A001A02
	?debug	C E34104786663622C001E8082
	?debug	C E3420005001A02
	?debug	C E3430366636225001E8087
	?debug	C E3440008001A02
	?debug	C E3450003001A02
	?debug	C E346000A001A02
	?debug	C E348000200150204
	?debug	C E347000200154804
	?debug	C EB065F5F617267764700
	?debug	C EB065F5F617267630400
	?debug	C E34900000023480000
	?debug	C EB085F7374727062726B4900
	?debug	C E34A00000023480000
	?debug	C EB075F7374726370794A00
	?debug	C E34B00000023010000
	?debug	C E34C00000023060000
	?debug	C EB055F74696D654C00
	?debug	C E34D00000023040000
	?debug	C E34E00000023040000
	?debug	C E34F00000023040000
	?debug	C E35000000023040000
	?debug	C EB055F707574735000
	?debug	C E35100000023040001
	?debug	C EB075F7072696E74665100
	?debug	C E35200000023180000
	?debug	C EB065F666F70656E5200
	?debug	C E35300000023040000
	?debug	C EB065F66676574635300
	?debug	C E35400000023040000
	?debug	C EB075F66636C6F73655400
	?debug	C E607636C6F636B5F740606000674696D655F7406+
	?debug	C 06000777636861725F740206000446494C451906+
	?debug	C 000666706F735F740606000673697A655F740A06+
	?debug	C 0002746D1F07000666696E645F74240700056666+
	?debug	C 626C6B270700075245475041434B2A0700055352+
	?debug	C 4547532B070004524547532C0700084259544552+
	?debug	C 4547532E070008574F5244524547532D07000964+
	?debug	C 6F73646174655F742F0700046461746530070009+
	?debug	C 646F7374696D655F743107000474696D65320700+
	?debug	C 0664657668647233070007666174696E666F3507+
	?debug	C 000A6469736B667265655F743607000564667265+
	?debug	C 6537070008444F534552524F5238070007434F55+
	?debug	C 4E54525939070004786663624107000366636243+
	?debug	C 0700
	?debug	F pokeb 32 24 0
	?debug	F poke 33 24 0
	?debug	F peekb 34 24 0
	?debug	F peek 35 24 0
	?debug	F @randomize$qv 75 24 0
	?debug	F @random$qi 77 24 0
	?debug	F atoi 78 24 0
	?debug	F abs 79 24 0
	?debug	C E200056C6576656C040005666C6167730A000266+
	?debug	C 64020004686F6C640800056273697A6504000662+
	?debug	C 75666665721A0004637572701A0006697374656D+
	?debug	C 700A0005746F6B656E04C010000000
	?debug	C E20006746D5F736563040006746D5F6D696E0400+
	?debug	C 07746D5F686F7572040007746D5F6D6461790400+
	?debug	C 06746D5F6D6F6E040007746D5F79656172040007+
	?debug	C 746D5F77646179040007746D5F79646179040008+
	?debug	C 746D5F697364737404C012000000
	?debug	C E200087265736572766564250006617474726962+
	?debug	C 02000777725F74696D650A000777725F64617465+
	?debug	C 0A000473697A650600046E616D6526C02B000000
	?debug	C E2000B66665F726573657276656428000966665F+
	?debug	C 61747472696202000866665F6674696D650A0008+
	?debug	C 66665F66646174650A000866665F6673697A6506+
	?debug	C 000766665F6E616D6529C02B000000
	?debug	C E20004725F61780A0004725F62780A0004725F63+
	?debug	C 780A0004725F64780A0004725F62700A0004725F+
	?debug	C 73690A0004725F64690A0004725F64730A000472+
	?debug	C 5F65730A0007725F666C6167730AC014000000
	?debug	C E2000265730A000263730A000273730A00026473+
	?debug	C 0AC008000000
	?debug	C E20001782D0001682EC010000000
	?debug	C E2000261780A000262780A000263780A00026478+
	?debug	C 0A000273690A000264690A000563666C61670A00+
	?debug	C 05666C6167730AC010000000
	?debug	C E20002616C0800026168080002626C0800026268+
	?debug	C 080002636C0800026368080002646C0800026468+
	?debug	C 08C008000000
	?debug	C E200036461790800056D6F6E7468080004796561+
	?debug	C 720A00096461796F667765656B08C005000000
	?debug	C E2000764615F7965617204000664615F64617902+
	?debug	C 000664615F6D6F6E02C004000000
	?debug	C E20004686F75720800066D696E75746508000673+
	?debug	C 65636F6E64080007687365636F6E6408C0040000+
	?debug	C 00
	?debug	C E2000674695F6D696E08000774695F686F757208+
	?debug	C 000774695F68756E6408000674695F73656308C0+
	?debug	C 04000000
	?debug	C E2000764685F6E65787406000764685F61747472+
	?debug	C 04000864685F73747261740A000864685F696E74+
	?debug	C 65720A000764685F6E616D6534C012000000
	?debug	C E2000866695F73636C757302000866695F666174+
	?debug	C 696402000866695F6E636C75730A000866695F62+
	?debug	C 7973656304C006000000
	?debug	C E2000E746F74616C5F636C7573746572730A000E+
	?debug	C 617661696C5F636C7573746572730A0013736563+
	?debug	C 746F72735F7065725F636C75737465720A001062+
	?debug	C 797465735F7065725F736563746F720AC0080000+
	?debug	C 00
	?debug	C E2000864665F617661696C0A000864665F746F74+
	?debug	C 616C0A000764665F627365630A000864665F7363+
	?debug	C 6C75730AC008000000
	?debug	C E2000B64655F6578746572726F7204000864655F+
	?debug	C 636C61737302000964655F616374696F6E020008+
	?debug	C 64655F6C6F63757302C005000000
	?debug	C E20007636F5F64617465040007636F5F63757272+
	?debug	C 3A0008636F5F74687365703B0008636F5F646573+
	?debug	C 65703C0008636F5F64747365703D0008636F5F74+
	?debug	C 6D7365703E000C636F5F637572727374796C6502+
	?debug	C 0009636F5F646967697473020007636F5F74696D+
	?debug	C 65020007636F5F63617365060008636F5F646173+
	?debug	C 65703F0007636F5F66696C6C40C022000000
	?debug	C E20009786663625F666C6167020009786663625F+
	?debug	C 72657376420009786663625F6174747202000878+
	?debug	C 6663625F66636243C02C000000
	?debug	C E200096663625F64726976650200086663625F6E+
	?debug	C 616D654400076663625F65787445000A6663625F+
	?debug	C 637572626C6B04000B6663625F72656373697A65+
	?debug	C 04000B6663625F66696C73697A65060008666362+
	?debug	C 5F646174650400086663625F7265737646000A66+
	?debug	C 63625F63757272656302000A6663625F72616E64+
	?debug	C 6F6D06C025000000
	end
