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
	?debug	S "c:\id_in.c"
	?debug	C E9E551FE7C0A633A5C69645F696E2E63
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
_KbdDefs	label	word
	db	29
	db	56
	db	71
	db	72
	db	73
	db	75
	db	77
	db	79
	db	80
	db	81
_DemoMode	label	word
	db	0
	db	0
_DATA	ends
ID_IN5_FAR	segment para public 'FAR_DATA'
ASCIINames	label	byte
	db	0
	db	27
	db	49
	db	50
	db	51
	db	52
	db	53
	db	54
	db	55
	db	56
	db	57
	db	48
	db	45
	db	61
	db	8
	db	9
	db	113
	db	119
	db	101
	db	114
	db	116
	db	121
	db	117
	db	105
	db	111
	db	112
	db	91
	db	93
	db	13
	db	0
	db	97
	db	115
	db	100
	db	102
	db	103
	db	104
	db	106
	db	107
	db	108
	db	59
	db	39
	db	96
	db	0
	db	92
	db	122
	db	120
	db	99
	db	118
	db	98
	db	110
	db	109
	db	44
	db	46
	db	47
	db	0
	db	42
	db	0
	db	32
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	55
	db	56
	db	57
	db	45
	db	52
	db	53
	db	54
	db	43
	db	49
	db	50
	db	51
	db	48
	db	127
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
ID_IN5_FAR	ends
ID_IN6_FAR	segment para public 'FAR_DATA'
ShiftNames	label	byte
	db	0
	db	27
	db	33
	db	64
	db	35
	db	36
	db	37
	db	94
	db	38
	db	42
	db	40
	db	41
	db	95
	db	43
	db	8
	db	9
	db	81
	db	87
	db	69
	db	82
	db	84
	db	89
	db	85
	db	73
	db	79
	db	80
	db	123
	db	125
	db	13
	db	0
	db	65
	db	83
	db	68
	db	70
	db	71
	db	72
	db	74
	db	75
	db	76
	db	58
	db	34
	db	126
	db	0
	db	124
	db	90
	db	88
	db	67
	db	86
	db	66
	db	78
	db	77
	db	60
	db	62
	db	63
	db	0
	db	42
	db	0
	db	32
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	55
	db	56
	db	57
	db	45
	db	52
	db	53
	db	54
	db	43
	db	49
	db	50
	db	51
	db	48
	db	127
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
ID_IN6_FAR	ends
ID_IN7_FAR	segment para public 'FAR_DATA'
SpecialNames	label	byte
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	13
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	47
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
ID_IN7_FAR	ends
_DATA	segment word public 'DATA'
DirTable	label	word
	db	7
	db	0
	db	0
	db	0
	db	1
	db	0
	db	6
	db	0
	db	8
	db	0
	db	2
	db	0
	db	5
	db	0
	db	4
	db	0
	db	3
	db	0
ParmStrings	label	word
	dw	DGROUP:s@
	dw	DGROUP:s@+7
	db	0
	db	0
_DATA	ends
_BSS	segment word public 'BSS'
	db	2 dup (?)
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	static void interrupt
   ;	
	assume	cs:_TEXT
INL_KeyService	proc	far
	push	ax
	push	bx
	push	cx
	push	dx
	push	es
	push	ds
	push	si
	push	di
	push	bp
	mov	bp,DGROUP
	mov	ds,bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;	INL_KeyService(void)
   ;	{
   ;	static	boolean	special;
   ;			byte	k,c,
   ;					temp;
   ;			int		i;
   ;	
   ;	
	mov	dx,96
	in	al,dx
	mov	byte ptr [bp-1],al
   ;	
   ;		k = inportb(0x60);	// Get the scan code
   ;	
   ;		// Tell the XT keyboard controller to clear the key
   ;	
	mov	dx,97
	in	al,dx
	mov	byte ptr [bp-3],al
	or	al,128
	mov	dx,97
	out	dx,al
   ;	
   ;		outportb(0x61,(temp = inportb(0x61)) | 0x80);
   ;	
	mov	dx,97
	mov	al,byte ptr [bp-3]
	out	dx,al
   ;	
   ;		outportb(0x61,temp);
   ;	
   ;	
	cmp	byte ptr [bp-1],224
	jne	short @1@74
   ;	
   ;		if (k == 0xe0)		// Special key prefix
   ;	
	mov	word ptr DGROUP:b@w+0,1
	jmp	@1@602
@1@74:
   ;	
   ;			special = true;
   ;	
	cmp	byte ptr [bp-1],225
	jne	short @1@122
   ;	
   ;		else if (k == 0xe1)	// Handle Pause key
   ;	
	mov	word ptr DGROUP:_Paused,1
	jmp	@1@602
@1@122:
   ;	
   ;			Paused = true;
   ;		else
   ;		{
   ;	
	test	byte ptr [bp-1],128
	je	short @1@170
   ;	
   ;			if (k & 0x80)	// Break code
   ;			{
   ;	
	mov	al,byte ptr [bp-1]
	and	al,127
	mov	byte ptr [bp-1],al
   ;	
   ;				k &= 0x7f;
   ;	
   ;	// DEBUG - handle special keys: ctl-alt-delete, print scrn
   ;	
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	mov	word ptr DGROUP:_Keyboard[bx],0
   ;	
   ;				Keyboard[k] = false;
   ;	
	jmp	@1@578
@1@170:
   ;	
   ;			}
   ;			else			// Make code
   ;			{
   ;	
	mov	al,byte ptr DGROUP:CurCode
	mov	byte ptr DGROUP:LastCode,al
   ;	
   ;				LastCode = CurCode;
   ;	
	mov	al,byte ptr [bp-1]
	mov	byte ptr DGROUP:_LastScan,al
	mov	byte ptr DGROUP:CurCode,al
   ;	
   ;				CurCode = LastScan = k;
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	mov	word ptr DGROUP:_Keyboard[bx],1
   ;	
   ;				Keyboard[k] = true;
   ;	
   ;	
	cmp	word ptr DGROUP:b@w+0,0
	je	short @1@218
   ;	
   ;				if (special)
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	mov	dx,ID_IN7_FAR
	mov	bx,ax
	mov	es,dx
	mov	al,byte ptr es:SpecialNames[bx]
	mov	byte ptr [bp-2],al
	jmp	@1@530
@1@218:
   ;	
   ;					c = SpecialNames[k];
   ;				else
   ;				{
   ;	
	cmp	byte ptr [bp-1],58
	jne	short @1@266
   ;	
   ;					if (k == sc_CapsLock)
   ;					{
   ;	
	xor	word ptr DGROUP:CapsLock,1
@1@266:
   ;	
   ;						CapsLock ^= true;
   ;						// DEBUG - make caps lock light work
   ;					}
   ;	
   ;	
	cmp	word ptr DGROUP:_Keyboard+84,0
	jne	short @1@314
	cmp	word ptr DGROUP:_Keyboard+108,0
	je	short @1@434
@1@314:
   ;	
   ;					if (Keyboard[sc_LShift] || Keyboard[sc_RShift])	// If shifted
   ;					{
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	mov	dx,ID_IN6_FAR
	mov	bx,ax
	mov	es,dx
	mov	al,byte ptr es:ShiftNames[bx]
	mov	byte ptr [bp-2],al
   ;	
   ;						c = ShiftNames[k];
   ;	
	cmp	byte ptr [bp-2],65
	jb	short @1@410
	cmp	byte ptr [bp-2],90
	ja	short @1@410
	cmp	word ptr DGROUP:CapsLock,0
	je	short @1@410
   ;	
   ;						if ((c >= 'A') && (c <= 'Z') && CapsLock)
   ;	
	mov	al,byte ptr [bp-2]
	add	al,32
	mov	byte ptr [bp-2],al
@1@410:
   ;	
   ;							c += 'a' - 'A';
   ;	
	jmp	short @1@530
@1@434:
   ;	
   ;					}
   ;					else
   ;					{
   ;	
	mov	al,byte ptr [bp-1]
	mov	ah,0
	mov	dx,ID_IN5_FAR
	mov	bx,ax
	mov	es,dx
	mov	al,byte ptr es:ASCIINames[bx]
	mov	byte ptr [bp-2],al
   ;	
   ;						c = ASCIINames[k];
   ;	
	cmp	byte ptr [bp-2],97
	jb	short @1@530
	cmp	byte ptr [bp-2],122
	ja	short @1@530
	cmp	word ptr DGROUP:CapsLock,0
	je	short @1@530
   ;	
   ;						if ((c >= 'a') && (c <= 'z') && CapsLock)
   ;	
	mov	al,byte ptr [bp-2]
	add	al,224
	mov	byte ptr [bp-2],al
@1@530:
   ;	
   ;							c -= 'a' - 'A';
   ;					}
   ;				}
   ;	
	cmp	byte ptr [bp-2],0
	je	short @1@578
   ;	
   ;				if (c)
   ;	
	mov	al,byte ptr [bp-2]
	mov	byte ptr DGROUP:_LastASCII,al
@1@578:
   ;	
   ;					LastASCII = c;
   ;			}
   ;	
   ;	
	mov	word ptr DGROUP:b@w+0,0
@1@602:
   ;	
   ;			special = false;
   ;		}
   ;	
   ;	
	cmp	word ptr DGROUP:INL_KeyHook,0
	je	short @1@674
	cmp	word ptr DGROUP:b@w+0,0
	jne	short @1@674
   ;	
   ;		if (INL_KeyHook && !special)
   ;	
	call	word ptr DGROUP:INL_KeyHook
@1@674:
   ;	
   ;			INL_KeyHook();
   ;	
	mov	dx,32
	mov	al,32
	out	dx,al
   ;	
   ;		outportb(0x20,0x20);
   ;	
	mov	sp,bp
	pop	bp
	pop	di
	pop	si
	pop	ds
	pop	es
	pop	dx
	pop	cx
	pop	bx
	pop	ax
	iret	
INL_KeyService	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
INL_GetMouseDelta	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	INL_GetMouseDelta(int *x,int *y)
   ;	{
   ;	
	mov	ax,11
	int	51
   ;	
   ;		Mouse(MDelta);
   ;	
	mov	bx,word ptr [bp+4]
	mov	word ptr [bx],cx
   ;	
   ;		*x = _CX;
   ;	
	mov	bx,word ptr [bp+6]
	mov	word ptr [bx],dx
   ;	
   ;		*y = _DX;
   ;	
	pop	bp
	ret	
INL_GetMouseDelta	endp
   ;	
   ;	static word
   ;	
	assume	cs:_TEXT
INL_GetMouseButtons	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	INL_GetMouseButtons(void)
   ;	{
   ;		word	buttons;
   ;	
   ;	
	mov	ax,3
	int	51
   ;	
   ;		Mouse(MButtons);
   ;	
	mov	si,bx
   ;	
   ;		buttons = _BX;
   ;	
	mov	ax,si
	jmp	short @3@50
@3@50:
   ;	
   ;		return(buttons);
   ;	
	pop	si
	pop	bp
	ret	
INL_GetMouseButtons	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_IN_GetJoyAbs	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	di
   ;	
   ;	IN_GetJoyAbs(word joy,word *xp,word *yp)
   ;	{
   ;		byte	xb,yb,
   ;				xs,ys;
   ;		word	x,y;
   ;	
   ;	
	xor	ax,ax
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],ax
   ;	
   ;		x = y = 0;
   ;	
	cmp	word ptr [bp+4],0
	je	short @4@74
	mov	al,2
	jmp	short @4@98
@4@74:
	mov	al,0
@4@98:
	mov	byte ptr [bp-3],al
   ;	
   ;		xs = joy? 2 : 0;		// Find shift value for x axis
   ;	
	mov	al,1
	mov	cl,byte ptr [bp-3]
	shl	al,cl
	mov	byte ptr [bp-1],al
   ;	
   ;		xb = 1 << xs;			// Use shift value to get x bit mask
   ;	
	cmp	word ptr [bp+4],0
	je	short @4@146
	mov	al,3
	jmp	short @4@170
@4@146:
	mov	al,1
@4@170:
	mov	byte ptr [bp-4],al
   ;	
   ;		ys = joy? 3 : 1;		// Do the same for y axis
   ;	
	mov	al,1
	mov	cl,byte ptr [bp-4]
	shl	al,cl
	mov	byte ptr [bp-2],al
   ;	
   ;		yb = 1 << ys;
   ;	
   ;	// Read the absolute joystick values
   ;	
			pushf					
   ;	
   ;	asm		pushf				// Save some registers
   ;	
			push		si
   ;	
   ;	asm		push	si
   ;	
			push		di
   ;	
   ;	asm		push	di
   ;	
			cli						
   ;	
   ;	asm		cli					// Make sure an interrupt doesn't screw the timings
   ;	
   ;	
   ;	
			mov			dx,0201H
   ;	
   ;	asm		mov		dx,0x201
   ;	
			in			al,dx
   ;	
   ;	asm		in		al,dx
   ;	
			out			dx,al		
   ;	
   ;	asm		out		dx,al		// Clear the resistors
   ;	
   ;	
			mov			ah,[[bp-1]]		
   ;	
   ;	asm		mov		ah,[xb]		// Get masks into registers
   ;	
			mov			ch,[[bp-2]]
   ;	
   ;	asm		mov		ch,[yb]
   ;	
   ;	
			xor			si,si		
   ;	
   ;	asm		xor		si,si		// Clear count registers
   ;	
			xor			di,di
   ;	
   ;	asm		xor		di,di
   ;	
			xor			bh,bh		
   ;	
   ;	asm		xor		bh,bh		// Clear high byte of bx for later
   ;	
   ;	
			push		bp			
   ;	
   ;	asm		push	bp			// Don't mess up stack frame
   ;	
			mov			bp,5000
@4@530:
   ;	
   ;	asm		mov		bp,MaxJoyValue
   ;	
   ;	loop:
   ;	
			in			al,dx		
   ;	
   ;	asm		in		al,dx		// Get bits indicating whether all are finished
   ;	
   ;	
			dec			bp			
   ;	
   ;	asm		dec		bp			// Check bounding register
   ;	
	je	short @4@818
   ;	
   ;	asm		jz		done		// We have a silly value - abort
   ;	
   ;	
			mov			bl,al		
   ;	
   ;	asm		mov		bl,al		// Duplicate the bits
   ;	
			and			bl,ah		
   ;	
   ;	asm		and		bl,ah		// Mask off useless bits (in [xb])
   ;	
			add			si,bx		
   ;	
   ;	asm		add		si,bx		// Possibly increment count register
   ;	
			mov			cl,bl		
   ;	
   ;	asm		mov		cl,bl		// Save for testing later
   ;	
   ;	
			mov			bl,al
   ;	
   ;	asm		mov		bl,al
   ;	
			and			bl,ch		
   ;	
   ;	asm		and		bl,ch		// [yb]
   ;	
			add			di,bx
   ;	
   ;	asm		add		di,bx
   ;	
   ;	
			add			cl,bl
   ;	
   ;	asm		add		cl,bl
   ;	
	jne	short @4@530
@4@818:
   ;	
   ;	asm		jnz		loop 		// If both bits were 0, drop out
   ;	
   ;	done:
   ;	
     	pop			bp
   ;	
   ;	asm     pop		bp
   ;	
   ;	
			mov			cl,[[bp-3]]		
   ;	
   ;	asm		mov		cl,[xs]		// Get the number of bits to shift
   ;	
			shr			si,cl		
   ;	
   ;	asm		shr		si,cl		//  and shift the count that many times
   ;	
   ;	
			mov			cl,[[bp-4]]
   ;	
   ;	asm		mov		cl,[ys]
   ;	
			shr			di,cl
   ;	
   ;	asm		shr		di,cl
   ;	
   ;	
			mov			[[bp-6]],si		
   ;	
   ;	asm		mov		[x],si		// Store the values into the variables
   ;	
			mov			[[bp-8]],di
   ;	
   ;	asm		mov		[y],di
   ;	
   ;	
			pop			di
   ;	
   ;	asm		pop		di
   ;	
			pop			si
   ;	
   ;	asm		pop		si
   ;	
			popf					
   ;	
   ;	asm		popf				// Restore the registers
   ;	
   ;	
	mov	bx,word ptr [bp+6]
	mov	ax,word ptr [bp-6]
	mov	word ptr [bx],ax
   ;	
   ;		*xp = x;
   ;	
	mov	bx,word ptr [bp+8]
	mov	ax,word ptr [bp-8]
	mov	word ptr [bx],ax
   ;	
   ;		*yp = y;
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_IN_GetJoyAbs	endp
_TEXT	ends
_BSS	segment word public 'BSS'
	db	4 dup (?)
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void INL_GetJoyDelta(word joy,int *dx,int *dy)
   ;	
	assume	cs:_TEXT
_INL_GetJoyDelta	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
	mov	di,word ptr [bp+8]
   ;	
   ;	{
   ;		word		x,y;
   ;		longword	time;
   ;		JoystickDef	*def;
   ;	static	longword	lasttime;
   ;	
   ;		IN_GetJoyAbs(joy,&x,&y);
   ;	
	lea	ax,word ptr [bp-4]
	push	ax
	lea	ax,word ptr [bp-2]
	push	ax
	push	word ptr [bp+4]
	call	near ptr _IN_GetJoyAbs
	add	sp,6
   ;	
   ;		def = JoyDefs + joy;
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,24
	imul	dx
	add	ax,offset DGROUP:_JoyDefs
	mov	si,ax
   ;	
   ;	
   ;		if (x < def->threshMinX)
   ;	
	mov	ax,word ptr [si+4]
	cmp	ax,word ptr [bp-2]
	jbe	short @5@194
   ;	
   ;		{
   ;			if (x < def->joyMinX)
   ;	
	mov	ax,word ptr [si]
	cmp	ax,word ptr [bp-2]
	jbe	short @5@98
   ;	
   ;				x = def->joyMinX;
   ;	
	mov	ax,word ptr [si]
	mov	word ptr [bp-2],ax
@5@98:
   ;	
   ;	
   ;			x = -(x - def->threshMinX);
   ;	
	mov	ax,word ptr [bp-2]
	sub	ax,word ptr [si+4]
	neg	ax
	mov	word ptr [bp-2],ax
   ;	
   ;			x *= def->joyMultXL;
   ;	
	mov	ax,word ptr [bp-2]
	imul	word ptr [si+16]
	mov	word ptr [bp-2],ax
   ;	
   ;			x >>= JoyScaleShift;
   ;	
	mov	cl,8
	shr	word ptr [bp-2],cl
   ;	
   ;			*dx = (x > 127)? -127 : -x;
   ;	
	cmp	word ptr [bp-2],127
	jbe	short @5@146
	mov	ax,65409
	jmp	short @5@170
@5@146:
	mov	ax,word ptr [bp-2]
	neg	ax
@5@170:
	mov	bx,word ptr [bp+6]
	mov	word ptr [bx],ax
   ;	
   ;		}
   ;	
	jmp	short @5@386
@5@194:
   ;	
   ;		else if (x > def->threshMaxX)
   ;	
	mov	ax,word ptr [si+8]
	cmp	ax,word ptr [bp-2]
	jae	short @5@362
   ;	
   ;		{
   ;			if (x > def->joyMaxX)
   ;	
	mov	ax,word ptr [si+12]
	cmp	ax,word ptr [bp-2]
	jae	short @5@266
   ;	
   ;				x = def->joyMaxX;
   ;	
	mov	ax,word ptr [si+12]
	mov	word ptr [bp-2],ax
@5@266:
   ;	
   ;	
   ;			x = x - def->threshMaxX;
   ;	
	mov	ax,word ptr [bp-2]
	sub	ax,word ptr [si+8]
	mov	word ptr [bp-2],ax
   ;	
   ;			x *= def->joyMultXH;
   ;	
	mov	ax,word ptr [bp-2]
	imul	word ptr [si+20]
	mov	word ptr [bp-2],ax
   ;	
   ;			x >>= JoyScaleShift;
   ;	
	mov	cl,8
	shr	word ptr [bp-2],cl
   ;	
   ;			*dx = (x > 127)? 127 : x;
   ;	
	cmp	word ptr [bp-2],127
	jbe	short @5@314
	mov	ax,127
	jmp	short @5@338
@5@314:
	mov	ax,word ptr [bp-2]
@5@338:
	mov	bx,word ptr [bp+6]
	mov	word ptr [bx],ax
   ;	
   ;		}
   ;	
	jmp	short @5@386
@5@362:
   ;	
   ;		else
   ;			*dx = 0;
   ;	
	mov	bx,word ptr [bp+6]
	mov	word ptr [bx],0
@5@386:
   ;	
   ;	
   ;		if (y < def->threshMinY)
   ;	
	mov	ax,word ptr [si+6]
	cmp	ax,word ptr [bp-4]
	jbe	short @5@554
   ;	
   ;		{
   ;			if (y < def->joyMinY)
   ;	
	mov	ax,word ptr [si+2]
	cmp	ax,word ptr [bp-4]
	jbe	short @5@458
   ;	
   ;				y = def->joyMinY;
   ;	
	mov	ax,word ptr [si+2]
	mov	word ptr [bp-4],ax
@5@458:
   ;	
   ;	
   ;			y = -(y - def->threshMinY);
   ;	
	mov	ax,word ptr [bp-4]
	sub	ax,word ptr [si+6]
	neg	ax
	mov	word ptr [bp-4],ax
   ;	
   ;			y *= def->joyMultYL;
   ;	
	mov	ax,word ptr [bp-4]
	imul	word ptr [si+18]
	mov	word ptr [bp-4],ax
   ;	
   ;			y >>= JoyScaleShift;
   ;	
	mov	cl,8
	shr	word ptr [bp-4],cl
   ;	
   ;			*dy = (y > 127)? -127 : -y;
   ;	
	cmp	word ptr [bp-4],127
	jbe	short @5@506
	mov	ax,65409
	jmp	short @5@530
@5@506:
	mov	ax,word ptr [bp-4]
	neg	ax
@5@530:
	mov	word ptr [di],ax
   ;	
   ;		}
   ;	
	jmp	short @5@746
@5@554:
   ;	
   ;		else if (y > def->threshMaxY)
   ;	
	mov	ax,word ptr [si+10]
	cmp	ax,word ptr [bp-4]
	jae	short @5@722
   ;	
   ;		{
   ;			if (y > def->joyMaxY)
   ;	
	mov	ax,word ptr [si+14]
	cmp	ax,word ptr [bp-4]
	jae	short @5@626
   ;	
   ;				y = def->joyMaxY;
   ;	
	mov	ax,word ptr [si+14]
	mov	word ptr [bp-4],ax
@5@626:
   ;	
   ;	
   ;			y = y - def->threshMaxY;
   ;	
	mov	ax,word ptr [bp-4]
	sub	ax,word ptr [si+10]
	mov	word ptr [bp-4],ax
   ;	
   ;			y *= def->joyMultYH;
   ;	
	mov	ax,word ptr [bp-4]
	imul	word ptr [si+22]
	mov	word ptr [bp-4],ax
   ;	
   ;			y >>= JoyScaleShift;
   ;	
	mov	cl,8
	shr	word ptr [bp-4],cl
   ;	
   ;			*dy = (y > 127)? 127 : y;
   ;	
	cmp	word ptr [bp-4],127
	jbe	short @5@674
	mov	ax,127
	jmp	short @5@698
@5@674:
	mov	ax,word ptr [bp-4]
@5@698:
	mov	word ptr [di],ax
   ;	
   ;		}
   ;	
	jmp	short @5@746
@5@722:
   ;	
   ;		else
   ;			*dy = 0;
   ;	
	mov	word ptr [di],0
@5@746:
   ;	
   ;	
   ;		lasttime = TimeCount;
   ;	
	mov	ax,word ptr DGROUP:_TimeCount+2
	mov	dx,word ptr DGROUP:_TimeCount
	mov	word ptr DGROUP:b@w+2,dx
	mov	word ptr DGROUP:b@w+2+2,ax
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_INL_GetJoyDelta	endp
   ;	
   ;	static word
   ;	
	assume	cs:_TEXT
INL_GetJoyButtons	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	INL_GetJoyButtons(word joy)
   ;	{
   ;	register	word	result;
   ;	
   ;	
	mov	dx,513
	in	al,dx
	mov	ah,0
	mov	si,ax
   ;	
   ;		result = inportb(0x201);	// Get all the joystick buttons
   ;	
	cmp	word ptr [bp+4],0
	je	short @6@74
	mov	al,6
	jmp	short @6@98
@6@74:
	mov	al,4
@6@98:
	mov	cl,al
	shr	si,cl
   ;	
   ;		result >>= joy? 6 : 4;	// Shift into bits 0-1
   ;	
	and	si,3
   ;	
   ;		result &= 3;				// Mask off the useless bits
   ;	
	xor	si,3
   ;	
   ;		result ^= 3;
   ;	
	mov	ax,si
	jmp	short @6@122
@6@122:
   ;	
   ;		return(result);
   ;	
	pop	si
	pop	bp
	ret	
INL_GetJoyButtons	endp
   ;	
   ;	word
   ;	
	assume	cs:_TEXT
_IN_GetJoyButtonsDB	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
@7@26:
   ;	
   ;	IN_GetJoyButtonsDB(word joy)
   ;	{
   ;		longword	lasttime;
   ;		word		result1,result2;
   ;	
   ;		do
   ;		{
   ;	
	push	word ptr [bp+4]
	call	near ptr INL_GetJoyButtons
	pop	cx
	mov	si,ax
   ;	
   ;			result1 = INL_GetJoyButtons(joy);
   ;	
	mov	ax,word ptr DGROUP:_TimeCount+2
	mov	dx,word ptr DGROUP:_TimeCount
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
	jmp	short @7@50
@7@50:
   ;	
   ;			lasttime = TimeCount;
   ;	
	mov	ax,word ptr DGROUP:_TimeCount+2
	mov	dx,word ptr DGROUP:_TimeCount
	cmp	ax,word ptr [bp-2]
	jne	short @7@98
	cmp	dx,word ptr [bp-4]
	je	short @7@50
@7@98:
   ;	
   ;			while (TimeCount == lasttime)
   ;				;
   ;	
	push	word ptr [bp+4]
	call	near ptr INL_GetJoyButtons
	pop	cx
	mov	di,ax
   ;	
   ;			result2 = INL_GetJoyButtons(joy);
   ;	
	cmp	si,di
	jne	short @7@26
   ;	
   ;		} while (result1 != result2);
   ;	
	mov	ax,si
	jmp	short @7@170
@7@170:
   ;	
   ;		return(result1);
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_IN_GetJoyButtonsDB	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
INL_StartKbd	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	INL_StartKbd(void)
   ;	{
   ;	
	mov	word ptr DGROUP:INL_KeyHook,0
   ;	
   ;		INL_KeyHook = NULL;			// no key hook routine
   ;	
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;		IN_ClearKeysDown();
   ;	
   ;	
	mov	ax,9
	push	ax
	call	near ptr _getvect
	pop	cx
	mov	word ptr DGROUP:OldKeyVect,ax
	mov	word ptr DGROUP:OldKeyVect+2,dx
   ;	
   ;		OldKeyVect = getvect(KeyInt);
   ;	
	push	cs
	mov	ax,offset INL_KeyService
	push	ax
	mov	ax,9
	push	ax
	call	near ptr _setvect
	add	sp,6
   ;	
   ;		setvect(KeyInt,INL_KeyService);
   ;	
	pop	bp
	ret	
INL_StartKbd	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
INL_ShutKbd	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	INL_ShutKbd(void)
   ;	{
   ;	
	mov	ax,64
	mov	es,ax
	mov	ax,word ptr es:[23]
	and	ax,64240
	mov	dx,64
	mov	es,dx
	mov	word ptr es:[23],ax
   ;	
   ;		poke(0x40,0x17,peek(0x40,0x17) & 0xfaf0);	// Clear ctrl/alt/shift flags
   ;	
   ;	
	push	word ptr DGROUP:OldKeyVect+2
	push	word ptr DGROUP:OldKeyVect
	mov	ax,9
	push	ax
	call	near ptr _setvect
	add	sp,6
   ;	
   ;		setvect(KeyInt,OldKeyVect);
   ;	
	pop	bp
	ret	
INL_ShutKbd	endp
   ;	
   ;	static boolean
   ;	
	assume	cs:_TEXT
INL_StartMouse	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;	INL_StartMouse(void)
   ;	{
   ;	#if 0
   ;		if (getvect(MouseInt))
   ;		{
   ;			Mouse(MReset);
   ;			if (_AX == 0xffff)
   ;				return(true);
   ;		}
   ;		return(false);
   ;	#endif
   ;	 union REGS regs;
   ;	 unsigned char far *vector;
   ;	
   ;	
   ;	
	xor	ax,ax
	mov	es,ax
	mov	ax,word ptr es:[206]
	xor	dx,dx
	mov	es,dx
	mov	dx,word ptr es:[204]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
	or	dx,ax
	jne	short @10@74
   ;	
   ;	 if ((vector=MK_FP(peek(0,0x33*4+2),peek(0,0x33*4)))==NULL)
   ;	
	xor	ax,ax
	jmp	short @10@146
@10@74:
   ;	
   ;	   return false;
   ;	
   ;	
	les	bx,dword ptr [bp-4]
	cmp	byte ptr es:[bx],207
	jne	short @10@122
   ;	
   ;	 if (*vector == 207)
   ;	
	xor	ax,ax
	jmp	short @10@146
@10@122:
   ;	
   ;	   return false;
   ;	
   ;	
	xor	ax,ax
	int	51
   ;	
   ;	 Mouse(MReset);
   ;	
	mov	ax,1
	jmp	short @10@146
@10@146:
   ;	
   ;	 return true;
   ;	
	mov	sp,bp
	pop	bp
	ret	
INL_StartMouse	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
INL_ShutMouse	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	INL_ShutMouse(void)
   ;	{
   ;	
	pop	bp
	ret	
INL_ShutMouse	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
INL_SetJoyScale	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	INL_SetJoyScale(word joy)
   ;	{
   ;		JoystickDef	*def;
   ;	
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,24
	imul	dx
	add	ax,offset DGROUP:_JoyDefs
	mov	si,ax
   ;	
   ;		def = &JoyDefs[joy];
   ;	
	mov	ax,word ptr [si+4]
	sub	ax,word ptr [si]
	xor	dx,dx
	push	dx
	push	ax
	xor	ax,ax
	mov	dx,32768
	push	ax
	push	dx
	call	near ptr N_LDIV@
	mov	word ptr [si+16],ax
   ;	
   ;		def->joyMultXL = JoyScaleMax / (def->threshMinX - def->joyMinX);
   ;	
	mov	ax,word ptr [si+12]
	sub	ax,word ptr [si+8]
	xor	dx,dx
	push	dx
	push	ax
	xor	ax,ax
	mov	dx,32768
	push	ax
	push	dx
	call	near ptr N_LDIV@
	mov	word ptr [si+20],ax
   ;	
   ;		def->joyMultXH = JoyScaleMax / (def->joyMaxX - def->threshMaxX);
   ;	
	mov	ax,word ptr [si+6]
	sub	ax,word ptr [si+2]
	xor	dx,dx
	push	dx
	push	ax
	xor	ax,ax
	mov	dx,32768
	push	ax
	push	dx
	call	near ptr N_LDIV@
	mov	word ptr [si+18],ax
   ;	
   ;		def->joyMultYL = JoyScaleMax / (def->threshMinY - def->joyMinY);
   ;	
	mov	ax,word ptr [si+14]
	sub	ax,word ptr [si+10]
	xor	dx,dx
	push	dx
	push	ax
	xor	ax,ax
	mov	dx,32768
	push	ax
	push	dx
	call	near ptr N_LDIV@
	mov	word ptr [si+22],ax
   ;	
   ;		def->joyMultYH = JoyScaleMax / (def->joyMaxY - def->threshMaxY);
   ;	
	pop	si
	pop	bp
	ret	
INL_SetJoyScale	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_IN_SetupJoy	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
   ;	
   ;	IN_SetupJoy(word joy,word minx,word maxx,word miny,word maxy)
   ;	{
   ;		word		d,r;
   ;		JoystickDef	*def;
   ;	
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,24
	imul	dx
	add	ax,offset DGROUP:_JoyDefs
	mov	si,ax
   ;	
   ;		def = &JoyDefs[joy];
   ;	
   ;	
	mov	ax,word ptr [bp+6]
	mov	word ptr [si],ax
   ;	
   ;		def->joyMinX = minx;
   ;	
	mov	ax,word ptr [bp+8]
	mov	word ptr [si+12],ax
   ;	
   ;		def->joyMaxX = maxx;
   ;	
	mov	ax,word ptr [bp+8]
	sub	ax,word ptr [bp+6]
	mov	di,ax
   ;	
   ;		r = maxx - minx;
   ;	
	mov	ax,di
	mov	bx,3
	xor	dx,dx
	div	bx
	mov	word ptr [bp-2],ax
   ;	
   ;		d = r / 3;
   ;	
	mov	ax,di
	shr	ax,1
	sub	ax,word ptr [bp-2]
	add	ax,word ptr [bp+6]
	mov	word ptr [si+4],ax
   ;	
   ;		def->threshMinX = ((r / 2) - d) + minx;
   ;	
	mov	ax,di
	shr	ax,1
	add	ax,word ptr [bp-2]
	add	ax,word ptr [bp+6]
	mov	word ptr [si+8],ax
   ;	
   ;		def->threshMaxX = ((r / 2) + d) + minx;
   ;	
   ;	
	mov	ax,word ptr [bp+10]
	mov	word ptr [si+2],ax
   ;	
   ;		def->joyMinY = miny;
   ;	
	mov	ax,word ptr [bp+12]
	mov	word ptr [si+14],ax
   ;	
   ;		def->joyMaxY = maxy;
   ;	
	mov	ax,word ptr [bp+12]
	sub	ax,word ptr [bp+10]
	mov	di,ax
   ;	
   ;		r = maxy - miny;
   ;	
	mov	ax,di
	mov	bx,3
	xor	dx,dx
	div	bx
	mov	word ptr [bp-2],ax
   ;	
   ;		d = r / 3;
   ;	
	mov	ax,di
	shr	ax,1
	sub	ax,word ptr [bp-2]
	add	ax,word ptr [bp+10]
	mov	word ptr [si+6],ax
   ;	
   ;		def->threshMinY = ((r / 2) - d) + miny;
   ;	
	mov	ax,di
	shr	ax,1
	add	ax,word ptr [bp-2]
	add	ax,word ptr [bp+10]
	mov	word ptr [si+10],ax
   ;	
   ;		def->threshMaxY = ((r / 2) + d) + miny;
   ;	
   ;	
	push	word ptr [bp+4]
	call	near ptr INL_SetJoyScale
	pop	cx
   ;	
   ;		INL_SetJoyScale(joy);
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_IN_SetupJoy	endp
   ;	
   ;	static boolean
   ;	
	assume	cs:_TEXT
INL_StartJoy	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;	INL_StartJoy(word joy)
   ;	{
   ;		word		x,y;
   ;	
   ;	
	lea	ax,word ptr [bp-4]
	push	ax
	lea	ax,word ptr [bp-2]
	push	ax
	push	word ptr [bp+4]
	call	near ptr _IN_GetJoyAbs
	add	sp,6
   ;	
   ;		IN_GetJoyAbs(joy,&x,&y);
   ;	
   ;	
   ;	
   ;		if
   ;		(
   ;			((x == 0) || (x > MaxJoyValue - 10))
   ;		||	((y == 0) || (y > MaxJoyValue - 10))
   ;	
	cmp	word ptr [bp-2],0
	je	short @14@122
	cmp	word ptr [bp-2],4990
	ja	short @14@122
	cmp	word ptr [bp-4],0
	je	short @14@122
	cmp	word ptr [bp-4],4990
	jbe	short @14@170
@14@122:
   ;	
   ;		)
   ;	
	xor	ax,ax
	jmp	short @14@194
	jmp	short @14@194
@14@170:
   ;	
   ;			return(false);
   ;		else
   ;		{
   ;	
	mov	ax,word ptr [bp-4]
	shl	ax,1
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,word ptr [bp-2]
	shl	ax,1
	push	ax
	xor	ax,ax
	push	ax
	push	word ptr [bp+4]
	call	near ptr _IN_SetupJoy
	add	sp,10
   ;	
   ;			IN_SetupJoy(joy,0,x * 2,0,y * 2);
   ;	
	mov	ax,1
	jmp	short @14@194
@14@194:
   ;	
   ;			return(true);
   ;		}
   ;	
	mov	sp,bp
	pop	bp
	ret	
INL_StartJoy	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
INL_ShutJoy	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	INL_ShutJoy(word joy)
   ;	{
   ;	
	mov	bx,word ptr [bp+4]
	shl	bx,1
	mov	word ptr DGROUP:_JoysPresent[bx],0
   ;	
   ;		JoysPresent[joy] = false;
   ;	
	pop	bp
	ret	
INL_ShutJoy	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_IN_Startup	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
   ;	
   ;	IN_Startup(void)
   ;	{
   ;		boolean	checkjoys,checkmouse;
   ;		word	i;
   ;	
   ;	
	cmp	word ptr DGROUP:IN_Started,0
	je	short @16@74
   ;	
   ;		if (IN_Started)
   ;	
	jmp	short @16@554
@16@74:
   ;	
   ;			return;
   ;	
   ;	
	mov	word ptr [bp-2],1
   ;	
   ;		checkjoys = true;
   ;	
	mov	di,1
   ;	
   ;		checkmouse = true;
   ;	
	mov	si,1
	jmp	short @16@266
@16@98:
   ;	
   ;		for (i = 1;i < _argc;i++)
   ;		{
   ;	
	mov	ax,offset DGROUP:ParmStrings
	push	ax
	mov	ax,si
	shl	ax,1
	mov	bx,word ptr DGROUP:__argv
	add	bx,ax
	push	word ptr [bx]
	call	near ptr _US_CheckParm
	pop	cx
	pop	cx
	or	ax,ax
	je	short @16@194
	cmp	ax,1
	je	short @16@218
	jmp	short @16@242
@16@194:
   ;	
   ;			switch (US_CheckParm(_argv[i],ParmStrings))
   ;			{
   ;			case 0:
   ;	
	mov	word ptr [bp-2],0
   ;	
   ;				checkjoys = false;
   ;	
	jmp	short @16@242
@16@218:
   ;	
   ;				break;
   ;			case 1:
   ;	
	xor	di,di
   ;	
   ;				checkmouse = false;
   ;	
	jmp	short @16@242
@16@242:
	inc	si
@16@266:
	cmp	si,word ptr DGROUP:__argc
	jb	short @16@98
   ;	
   ;				break;
   ;			}
   ;		}
   ;	
   ;	
	call	near ptr INL_StartKbd
   ;	
   ;		INL_StartKbd();
   ;	
	or	di,di
	je	short @16@338
	call	near ptr INL_StartMouse
	jmp	short @16@362
@16@338:
	xor	ax,ax
@16@362:
	mov	word ptr DGROUP:_MousePresent,ax
   ;	
   ;		MousePresent = checkmouse? INL_StartMouse() : false;
   ;	
   ;	
	xor	si,si
	jmp	short @16@506
@16@386:
   ;	
   ;		for (i = 0;i < MaxJoys;i++)
   ;	
	cmp	word ptr [bp-2],0
	je	short @16@434
	push	si
	call	near ptr INL_StartJoy
	pop	cx
	jmp	short @16@458
@16@434:
	xor	ax,ax
@16@458:
	mov	bx,si
	shl	bx,1
	mov	word ptr DGROUP:_JoysPresent[bx],ax
	inc	si
@16@506:
	cmp	si,2
	jb	short @16@386
   ;	
   ;			JoysPresent[i] = checkjoys? INL_StartJoy(i) : false;
   ;	
   ;	
	mov	word ptr DGROUP:IN_Started,1
@16@554:
   ;	
   ;		IN_Started = true;
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_IN_Startup	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_IN_Default	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+6]
   ;	
   ;	IN_Default(boolean gotit,ControlType in)
   ;	{
   ;	
   ;	
   ;		if
   ;		(
   ;			(!gotit)
   ;		|| 	((in == ctrl_Joystick1) && !JoysPresent[0])
   ;		|| 	((in == ctrl_Joystick2) && !JoysPresent[1])
   ;		|| 	((in == ctrl_Mouse) && !MousePresent)
   ;	
	cmp	word ptr [bp+4],0
	je	short @17@194
	cmp	si,2
	jne	short @17@98
	cmp	word ptr DGROUP:_JoysPresent,0
	je	short @17@194
@17@98:
	cmp	si,3
	jne	short @17@146
	cmp	word ptr DGROUP:_JoysPresent+2,0
	je	short @17@194
@17@146:
	cmp	si,4
	jne	short @17@218
	cmp	word ptr DGROUP:_MousePresent,0
	jne	short @17@218
@17@194:
   ;	
   ;		)
   ;	
	xor	si,si
@17@218:
   ;	
   ;			in = ctrl_Keyboard1;
   ;	
	push	si
	xor	ax,ax
	push	ax
	call	near ptr _IN_SetControlType
	pop	cx
	pop	cx
   ;	
   ;		IN_SetControlType(0,in);
   ;	
	pop	si
	pop	bp
	ret	
_IN_Default	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_IN_Shutdown	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	IN_Shutdown(void)
   ;	{
   ;		word	i;
   ;	
   ;	
	cmp	word ptr DGROUP:IN_Started,0
	jne	short @18@74
   ;	
   ;		if (!IN_Started)
   ;	
	jmp	short @18@194
@18@74:
   ;	
   ;			return;
   ;	
   ;	
	call	near ptr INL_ShutMouse
   ;	
   ;		INL_ShutMouse();
   ;	
	xor	si,si
	jmp	short @18@146
@18@98:
   ;	
   ;		for (i = 0;i < MaxJoys;i++)
   ;	
	push	si
	call	near ptr INL_ShutJoy
	pop	cx
	inc	si
@18@146:
	cmp	si,2
	jb	short @18@98
   ;	
   ;			INL_ShutJoy(i);
   ;	
	call	near ptr INL_ShutKbd
   ;	
   ;		INL_ShutKbd();
   ;	
   ;	
	mov	word ptr DGROUP:IN_Started,0
@18@194:
   ;	
   ;		IN_Started = false;
   ;	
	pop	si
	pop	bp
	ret	
_IN_Shutdown	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_IN_SetKeyHook	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	IN_SetKeyHook(void (*hook)())
   ;	{
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:INL_KeyHook,ax
   ;	
   ;		INL_KeyHook = hook;
   ;	
	pop	bp
	ret	
_IN_SetKeyHook	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_IN_ClearKeysDown	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	IN_ClearKeysDown(void)
   ;	{
   ;		int	i;
   ;	
   ;	
	mov	byte ptr DGROUP:_LastScan,0
   ;	
   ;		LastScan = sc_None;
   ;	
	mov	byte ptr DGROUP:_LastASCII,0
   ;	
   ;		LastASCII = key_None;
   ;	
	mov	ax,256
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_Keyboard
	push	ax
	call	near ptr _memset
	add	sp,6
   ;	
   ;		memset (Keyboard,0,sizeof(Keyboard));
   ;	
	pop	bp
	ret	
_IN_ClearKeysDown	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_IN_ReadControl	proc	near
	push	bp
	mov	bp,sp
	sub	sp,16
	push	si
	push	di
	mov	di,word ptr [bp+6]
   ;	
   ;	IN_ReadControl(int player,ControlInfo *info)
   ;	{
   ;				boolean		realdelta;
   ;				byte		dbyte;
   ;				word		buttons;
   ;				int			dx,dy;
   ;				Motion		mx,my;
   ;				ControlType	type;
   ;	register	KeyboardDef	*def;
   ;	
   ;	
	xor	ax,ax
	mov	word ptr [bp-10],ax
	mov	word ptr [bp-8],ax
   ;	
   ;		dx = dy = 0;
   ;	
	xor	ax,ax
	mov	word ptr [bp-14],ax
	mov	word ptr [bp-12],ax
   ;	
   ;		mx = my = motion_None;
   ;	
	mov	word ptr [bp-6],0
   ;	
   ;		buttons = 0;
   ;	
   ;	
	cmp	word ptr DGROUP:_DemoMode,2
	je	@@0
	jmp	@21@146
@@0:
   ;	
   ;		if (DemoMode == demo_Playback)
   ;		{
   ;	
	mov	bx,word ptr DGROUP:_DemoOffset
	mov	es,word ptr DGROUP:_DemoBuffer
	mov	al,byte ptr es:[bx+1]
	mov	byte ptr [bp-3],al
   ;	
   ;			dbyte = DemoBuffer[DemoOffset + 1];
   ;	
	mov	al,byte ptr [bp-3]
	mov	ah,0
	and	ax,3
	dec	ax
	mov	word ptr [bp-14],ax
   ;	
   ;			my = (dbyte & 3) - 1;
   ;	
	mov	al,byte ptr [bp-3]
	mov	ah,0
	sar	ax,1
	sar	ax,1
	and	ax,3
	dec	ax
	mov	word ptr [bp-12],ax
   ;	
   ;			mx = ((dbyte >> 2) & 3) - 1;
   ;	
	mov	al,byte ptr [bp-3]
	mov	ah,0
	mov	cl,4
	sar	ax,cl
	and	ax,3
	mov	word ptr [bp-6],ax
   ;	
   ;			buttons = (dbyte >> 4) & 3;
   ;	
   ;	
	mov	es,word ptr DGROUP:_DemoBuffer
	mov	bx,word ptr DGROUP:_DemoOffset
	mov	al,byte ptr es:[bx]
	add	al,255
	mov	es,word ptr DGROUP:_DemoBuffer
	mov	bx,word ptr DGROUP:_DemoOffset
	mov	byte ptr es:[bx],al
	mov	ah,0
	or	ax,ax
	jne	short @21@122
   ;	
   ;			if (!(--DemoBuffer[DemoOffset]))
   ;			{
   ;	
	add	word ptr DGROUP:_DemoOffset,2
   ;	
   ;				DemoOffset += 2;
   ;	
	mov	ax,word ptr DGROUP:_DemoOffset
	cmp	ax,word ptr DGROUP:_DemoSize
	jb	short @21@122
   ;	
   ;				if (DemoOffset >= DemoSize)
   ;	
	mov	word ptr DGROUP:_DemoMode,3
@21@122:
   ;	
   ;					DemoMode = demo_PlayDone;
   ;			}
   ;	
   ;	
	mov	word ptr [bp-2],0
   ;	
   ;			realdelta = false;
   ;	
	jmp	@21@818
@21@146:
   ;	
   ;		}
   ;	
	cmp	word ptr DGROUP:_DemoMode,3
	jne	short @21@194
   ;	
   ;		else if (DemoMode == demo_PlayDone)
   ;	
	mov	ax,offset DGROUP:s@+15
	push	ax
	call	near ptr _Quit
	pop	cx
	jmp	@21@818
@21@194:
   ;	
   ;			Quit("Demo playback exceeded");
   ;		else
   ;		{
   ;	
	mov	bx,word ptr [bp+4]
	shl	bx,1
	mov	ax,word ptr DGROUP:_Controls[bx]
	mov	word ptr [bp-16],ax
	mov	bx,ax
	cmp	bx,4
	jbe	@@1
	jmp	@21@818
@@1:
	shl	bx,1
	jmp	word ptr cs:@21@C4832[bx]
@21@266:
   ;	
   ;			switch (type = Controls[player])
   ;			{
   ;			case ctrl_Keyboard:
   ;	
	mov	si,offset DGROUP:_KbdDefs
   ;	
   ;				def = &KbdDefs;
   ;	
   ;	
	mov	al,byte ptr [si+2]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	cmp	word ptr DGROUP:_Keyboard[bx],0
	je	short @21@314
   ;	
   ;				if (Keyboard[def->upleft])
   ;	
	mov	word ptr [bp-12],65535
	mov	word ptr [bp-14],65535
	jmp	short @21@458
@21@314:
   ;	
   ;					mx = motion_Left,my = motion_Up;
   ;	
	mov	al,byte ptr [si+4]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	cmp	word ptr DGROUP:_Keyboard[bx],0
	je	short @21@362
   ;	
   ;				else if (Keyboard[def->upright])
   ;	
	mov	word ptr [bp-12],1
	mov	word ptr [bp-14],65535
	jmp	short @21@458
@21@362:
   ;	
   ;					mx = motion_Right,my = motion_Up;
   ;	
	mov	al,byte ptr [si+7]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	cmp	word ptr DGROUP:_Keyboard[bx],0
	je	short @21@410
   ;	
   ;				else if (Keyboard[def->downleft])
   ;	
	mov	word ptr [bp-12],65535
	mov	word ptr [bp-14],1
	jmp	short @21@458
@21@410:
   ;	
   ;					mx = motion_Left,my = motion_Down;
   ;	
	mov	al,byte ptr [si+9]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	cmp	word ptr DGROUP:_Keyboard[bx],0
	je	short @21@458
   ;	
   ;				else if (Keyboard[def->downright])
   ;	
	mov	word ptr [bp-12],1
	mov	word ptr [bp-14],1
@21@458:
   ;	
   ;					mx = motion_Right,my = motion_Down;
   ;	
   ;	
	mov	al,byte ptr [si+3]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	cmp	word ptr DGROUP:_Keyboard[bx],0
	je	short @21@506
   ;	
   ;				if (Keyboard[def->up])
   ;	
	mov	word ptr [bp-14],65535
	jmp	short @21@554
@21@506:
   ;	
   ;					my = motion_Up;
   ;	
	mov	al,byte ptr [si+8]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	cmp	word ptr DGROUP:_Keyboard[bx],0
	je	short @21@554
   ;	
   ;				else if (Keyboard[def->down])
   ;	
	mov	word ptr [bp-14],1
@21@554:
   ;	
   ;					my = motion_Down;
   ;	
   ;	
	mov	al,byte ptr [si+5]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	cmp	word ptr DGROUP:_Keyboard[bx],0
	je	short @21@602
   ;	
   ;				if (Keyboard[def->left])
   ;	
	mov	word ptr [bp-12],65535
	jmp	short @21@650
@21@602:
   ;	
   ;					mx = motion_Left;
   ;	
	mov	al,byte ptr [si+6]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	cmp	word ptr DGROUP:_Keyboard[bx],0
	je	short @21@650
   ;	
   ;				else if (Keyboard[def->right])
   ;	
	mov	word ptr [bp-12],1
@21@650:
   ;	
   ;					mx = motion_Right;
   ;	
   ;	
	mov	al,byte ptr [si]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	cmp	word ptr DGROUP:_Keyboard[bx],0
	je	short @21@698
   ;	
   ;				if (Keyboard[def->button0])
   ;	
	inc	word ptr [bp-6]
@21@698:
   ;	
   ;					buttons += 1 << 0;
   ;	
	mov	al,byte ptr [si+1]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	cmp	word ptr DGROUP:_Keyboard[bx],0
	je	short @21@746
   ;	
   ;				if (Keyboard[def->button1])
   ;	
	add	word ptr [bp-6],2
@21@746:
   ;	
   ;					buttons += 1 << 1;
   ;	
	mov	word ptr [bp-2],0
   ;	
   ;				realdelta = false;
   ;	
	jmp	short @21@818
@21@770:
   ;	
   ;				break;
   ;			case ctrl_Joystick1:
   ;			case ctrl_Joystick2:
   ;	
	lea	ax,word ptr [bp-10]
	push	ax
	lea	ax,word ptr [bp-8]
	push	ax
	mov	ax,word ptr [bp-16]
	add	ax,65534
	push	ax
	call	near ptr _INL_GetJoyDelta
	add	sp,6
   ;	
   ;				INL_GetJoyDelta(type - ctrl_Joystick,&dx,&dy);
   ;	
	mov	ax,word ptr [bp-16]
	add	ax,65534
	push	ax
	call	near ptr INL_GetJoyButtons
	pop	cx
	mov	word ptr [bp-6],ax
   ;	
   ;				buttons = INL_GetJoyButtons(type - ctrl_Joystick);
   ;	
	mov	word ptr [bp-2],1
   ;	
   ;				realdelta = true;
   ;	
	jmp	short @21@818
@21@794:
   ;	
   ;				break;
   ;			case ctrl_Mouse:
   ;	
	lea	ax,word ptr [bp-10]
	push	ax
	lea	ax,word ptr [bp-8]
	push	ax
	call	near ptr INL_GetMouseDelta
	pop	cx
	pop	cx
   ;	
   ;				INL_GetMouseDelta(&dx,&dy);
   ;	
	call	near ptr INL_GetMouseButtons
	mov	word ptr [bp-6],ax
   ;	
   ;				buttons = INL_GetMouseButtons();
   ;	
	mov	word ptr [bp-2],1
   ;	
   ;				realdelta = true;
   ;	
	jmp	short @21@818
@21@818:
   ;	
   ;				break;
   ;			}
   ;		}
   ;	
   ;	
	cmp	word ptr [bp-2],0
	je	short @21@1106
   ;	
   ;		if (realdelta)
   ;		{
   ;	
	cmp	word ptr [bp-8],0
	jge	short @21@890
	mov	ax,65535
	jmp	short @21@962
@21@890:
	cmp	word ptr [bp-8],0
	jle	short @21@938
	mov	ax,1
	jmp	short @21@962
@21@938:
	xor	ax,ax
@21@962:
	mov	word ptr [bp-12],ax
   ;	
   ;			mx = (dx < 0)? motion_Left : ((dx > 0)? motion_Right : motion_None);
   ;	
	cmp	word ptr [bp-10],0
	jge	short @21@1010
	mov	ax,65535
	jmp	short @21@1082
@21@1010:
	cmp	word ptr [bp-10],0
	jle	short @21@1058
	mov	ax,1
	jmp	short @21@1082
@21@1058:
	xor	ax,ax
@21@1082:
	mov	word ptr [bp-14],ax
   ;	
   ;			my = (dy < 0)? motion_Up : ((dy > 0)? motion_Down : motion_None);
   ;	
	jmp	short @21@1130
@21@1106:
   ;	
   ;		}
   ;		else
   ;		{
   ;	
	mov	ax,word ptr [bp-12]
	mov	dx,127
	imul	dx
	mov	word ptr [bp-8],ax
   ;	
   ;			dx = mx * 127;
   ;	
	mov	ax,word ptr [bp-14]
	mov	dx,127
	imul	dx
	mov	word ptr [bp-10],ax
@21@1130:
   ;	
   ;			dy = my * 127;
   ;		}
   ;	
   ;	
	mov	ax,word ptr [bp-8]
	mov	word ptr [di+8],ax
   ;	
   ;		info->x = dx;
   ;	
	mov	ax,word ptr [bp-12]
	mov	word ptr [di+12],ax
   ;	
   ;		info->xaxis = mx;
   ;	
	mov	ax,word ptr [bp-10]
	mov	word ptr [di+10],ax
   ;	
   ;		info->y = dy;
   ;	
	mov	ax,word ptr [bp-14]
	mov	word ptr [di+14],ax
   ;	
   ;		info->yaxis = my;
   ;	
	mov	ax,word ptr [bp-6]
	and	ax,1
	mov	word ptr [di],ax
   ;	
   ;		info->button0 = buttons & (1 << 0);
   ;	
	mov	ax,word ptr [bp-6]
	and	ax,2
	mov	word ptr [di+2],ax
   ;	
   ;		info->button1 = buttons & (1 << 1);
   ;	
	mov	ax,word ptr [bp-6]
	and	ax,4
	mov	word ptr [di+4],ax
   ;	
   ;		info->button2 = buttons & (1 << 2);
   ;	
	mov	ax,word ptr [bp-6]
	and	ax,8
	mov	word ptr [di+6],ax
   ;	
   ;		info->button3 = buttons & (1 << 3);
   ;	
	mov	ax,word ptr [bp-14]
	inc	ax
	mov	dx,3
	imul	dx
	mov	bx,word ptr [bp-12]
	add	bx,ax
	shl	bx,1
	mov	ax,word ptr DGROUP:DirTable[bx+2]
	mov	word ptr [di+16],ax
   ;	
   ;		info->dir = DirTable[((my + 1) * 3) + (mx + 1)];
   ;	
   ;	
	cmp	word ptr DGROUP:_DemoMode,1
	je	@@2
	jmp	@21@1370
@@2:
   ;	
   ;		if (DemoMode == demo_Record)
   ;		{
   ;			// Pack the control info into a byte
   ;	
	mov	al,byte ptr [bp-6]
	mov	cl,4
	shl	al,cl
	mov	dl,byte ptr [bp-12]
	inc	dl
	shl	dl,1
	shl	dl,1
	or	al,dl
	mov	dl,byte ptr [bp-14]
	inc	dl
	or	al,dl
	mov	byte ptr [bp-3],al
   ;	
   ;			dbyte = (buttons << 4) | ((mx + 1) << 2) | (my + 1);
   ;	
   ;	
   ;	
   ;			if
   ;			(
   ;				(DemoBuffer[DemoOffset + 1] == dbyte)
   ;			&&	(DemoBuffer[DemoOffset] < 255)
   ;	
	mov	bx,word ptr DGROUP:_DemoOffset
	mov	es,word ptr DGROUP:_DemoBuffer
	mov	al,byte ptr es:[bx+1]
	cmp	al,byte ptr [bp-3]
	jne	short @21@1226
	mov	es,word ptr DGROUP:_DemoBuffer
	mov	bx,word ptr DGROUP:_DemoOffset
	cmp	byte ptr es:[bx],255
	jae	short @21@1226
   ;	
   ;			)
   ;	
	mov	es,word ptr DGROUP:_DemoBuffer
	mov	bx,word ptr DGROUP:_DemoOffset
	inc	byte ptr es:[bx]
	jmp	short @21@1370
@21@1226:
   ;	
   ;				(DemoBuffer[DemoOffset])++;
   ;			else
   ;			{
   ;	
	cmp	word ptr DGROUP:_DemoOffset,0
	jne	short @21@1274
	mov	es,word ptr DGROUP:_DemoBuffer
	mov	bx,word ptr DGROUP:_DemoOffset
	cmp	byte ptr es:[bx],0
	je	short @21@1298
@21@1274:
   ;	
   ;				if (DemoOffset || DemoBuffer[DemoOffset])
   ;	
	add	word ptr DGROUP:_DemoOffset,2
@21@1298:
   ;	
   ;					DemoOffset += 2;
   ;	
   ;	
	mov	ax,word ptr DGROUP:_DemoOffset
	cmp	ax,word ptr DGROUP:_DemoSize
	jb	short @21@1346
   ;	
   ;				if (DemoOffset >= DemoSize)
   ;	
	mov	ax,offset DGROUP:s@+38
	push	ax
	call	near ptr _Quit
	pop	cx
@21@1346:
   ;	
   ;					Quit("Demo buffer overflow");
   ;	
   ;	
	mov	es,word ptr DGROUP:_DemoBuffer
	mov	bx,word ptr DGROUP:_DemoOffset
	mov	byte ptr es:[bx],1
   ;	
   ;				DemoBuffer[DemoOffset] = 1;
   ;	
	mov	bx,word ptr DGROUP:_DemoOffset
	mov	es,word ptr DGROUP:_DemoBuffer
	mov	al,byte ptr [bp-3]
	mov	byte ptr es:[bx+1],al
@21@1370:
   ;	
   ;				DemoBuffer[DemoOffset + 1] = dbyte;
   ;			}
   ;		}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_IN_ReadControl	endp
@21@C4832	label	word
	dw	@21@266
	dw	@21@818
	dw	@21@770
	dw	@21@770
	dw	@21@794
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_IN_SetControlType	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	IN_SetControlType(int player,ControlType type)
   ;	{
   ;		// DEBUG - check that requested type is present?
   ;	
	mov	bx,word ptr [bp+4]
	shl	bx,1
	mov	ax,word ptr [bp+6]
	mov	word ptr DGROUP:_Controls[bx],ax
   ;	
   ;		Controls[player] = type;
   ;	
	pop	bp
	ret	
_IN_SetControlType	endp
   ;	
   ;	ScanCode
   ;	
	assume	cs:_TEXT
_IN_WaitForKey	proc	near
	push	bp
	mov	bp,sp
	jmp	short @23@50
@23@50:
   ;	
   ;	IN_WaitForKey(void)
   ;	{
   ;		ScanCode	result;
   ;	
   ;	
	mov	al,byte ptr DGROUP:_LastScan
	mov	dl,al
	mov	ah,0
	or	ax,ax
	je	short @23@50
   ;	
   ;		while (!(result = LastScan))
   ;			;
   ;	
	mov	byte ptr DGROUP:_LastScan,0
   ;	
   ;		LastScan = 0;
   ;	
	mov	al,dl
	jmp	short @23@98
@23@98:
   ;	
   ;		return(result);
   ;	
	pop	bp
	ret	
_IN_WaitForKey	endp
   ;	
   ;	char
   ;	
	assume	cs:_TEXT
_IN_WaitForASCII	proc	near
	push	bp
	mov	bp,sp
	jmp	short @24@50
@24@50:
   ;	
   ;	IN_WaitForASCII(void)
   ;	{
   ;		char		result;
   ;	
   ;	
	mov	al,byte ptr DGROUP:_LastASCII
	mov	dl,al
	cbw	
	or	ax,ax
	je	short @24@50
   ;	
   ;		while (!(result = LastASCII))
   ;			;
   ;	
	mov	byte ptr DGROUP:_LastASCII,0
   ;	
   ;		LastASCII = '\0';
   ;	
	mov	al,dl
	jmp	short @24@98
@24@98:
   ;	
   ;		return(result);
   ;	
	pop	bp
	ret	
_IN_WaitForASCII	endp
   ;	
   ;	void IN_StartAck(void)
   ;	
	assume	cs:_TEXT
_IN_StartAck	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		unsigned	i,buttons;
   ;	
   ;	//
   ;	// get initial state of everything
   ;	//
   ;		IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;		memset (btnstate,0,sizeof(btnstate));
   ;	
	mov	ax,16
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_btnstate
	push	ax
	call	near ptr _memset
	add	sp,6
   ;	
   ;	
   ;		buttons = IN_JoyButtons () << 4;
   ;	
	call	near ptr _IN_JoyButtons
	mov	ah,0
	mov	cl,4
	shl	ax,cl
	mov	si,ax
   ;	
   ;		if (MousePresent)
   ;	
	cmp	word ptr DGROUP:_MousePresent,0
	je	short @25@74
   ;	
   ;			buttons |= IN_MouseButtons ();
   ;	
	call	near ptr _IN_MouseButtons
	mov	ah,0
	or	si,ax
@25@74:
   ;	
   ;	
   ;		for (i=0;i<8;i++,buttons>>=1)
   ;	
	xor	di,di
	jmp	short @25@170
@25@98:
   ;	
   ;			if (buttons&1)
   ;	
	test	si,1
	je	short @25@146
   ;	
   ;				btnstate[i] = true;
   ;	
	mov	bx,di
	shl	bx,1
	mov	word ptr DGROUP:_btnstate[bx],1
@25@146:
	inc	di
	shr	si,1
@25@170:
	cmp	di,8
	jb	short @25@98
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_IN_StartAck	endp
   ;	
   ;	boolean IN_CheckAck (void)
   ;	
	assume	cs:_TEXT
_IN_CheckAck	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		unsigned	i,buttons;
   ;	
   ;	//
   ;	// see if something has been pressed
   ;	//
   ;		if (LastScan)
   ;	
	cmp	byte ptr DGROUP:_LastScan,0
	je	short @26@74
   ;	
   ;			return true;
   ;	
	mov	ax,1
	jmp	short @26@338
@26@74:
   ;	
   ;	
   ;		buttons = IN_JoyButtons () << 4;
   ;	
	call	near ptr _IN_JoyButtons
	mov	ah,0
	mov	cl,4
	shl	ax,cl
	mov	di,ax
   ;	
   ;		if (MousePresent)
   ;	
	cmp	word ptr DGROUP:_MousePresent,0
	je	short @26@122
   ;	
   ;			buttons |= IN_MouseButtons ();
   ;	
	call	near ptr _IN_MouseButtons
	mov	ah,0
	or	di,ax
@26@122:
   ;	
   ;	
   ;		for (i=0;i<8;i++,buttons>>=1)
   ;	
	xor	si,si
	jmp	short @26@290
@26@146:
   ;	
   ;			if ( buttons&1 )
   ;	
	test	di,1
	je	short @26@242
   ;	
   ;			{
   ;				if (!btnstate[i])
   ;	
	mov	bx,si
	shl	bx,1
	cmp	word ptr DGROUP:_btnstate[bx],0
	jne	short @26@218
   ;	
   ;					return true;
   ;	
	mov	ax,1
	jmp	short @26@338
@26@218:
   ;	
   ;			}
   ;	
	jmp	short @26@266
@26@242:
   ;	
   ;			else
   ;				btnstate[i]=false;
   ;	
	mov	bx,si
	shl	bx,1
	mov	word ptr DGROUP:_btnstate[bx],0
@26@266:
	inc	si
	shr	di,1
@26@290:
	cmp	si,8
	jb	short @26@146
   ;	
   ;	
   ;		return false;
   ;	
	xor	ax,ax
	jmp	short @26@338
@26@338:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_IN_CheckAck	endp
   ;	
   ;	void IN_Ack (void)
   ;	
	assume	cs:_TEXT
_IN_Ack	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		IN_StartAck ();
   ;	
	call	near ptr _IN_StartAck
	jmp	short @27@50
@27@50:
   ;	
   ;	
   ;		while (!IN_CheckAck ())
   ;	
	call	near ptr _IN_CheckAck
	or	ax,ax
	je	short @27@50
   ;	
   ;		;
   ;	}
   ;	
	pop	bp
	ret	
_IN_Ack	endp
   ;	
   ;	boolean IN_UserInput(longword delay)
   ;	
	assume	cs:_TEXT
_IN_UserInput	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;	{
   ;		longword	lasttime;
   ;	
   ;		lasttime = TimeCount;
   ;	
	mov	ax,word ptr DGROUP:_TimeCount+2
	mov	dx,word ptr DGROUP:_TimeCount
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;		IN_StartAck ();
   ;	
	call	near ptr _IN_StartAck
@28@50:
   ;	
   ;		do
   ;		{
   ;			if (IN_CheckAck())
   ;	
	call	near ptr _IN_CheckAck
	or	ax,ax
	je	short @28@98
   ;	
   ;				return true;
   ;	
	mov	ax,1
	jmp	short @28@194
@28@98:
   ;	
   ;		} while (TimeCount - lasttime < delay);
   ;	
	mov	ax,word ptr DGROUP:_TimeCount+2
	mov	dx,word ptr DGROUP:_TimeCount
	sub	dx,word ptr [bp-4]
	sbb	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp+6]
	jb	short @28@50
	jne	short @28@170
	cmp	dx,word ptr [bp+4]
	jb	short @28@50
@28@170:
   ;	
   ;		return(false);
   ;	
	xor	ax,ax
	jmp	short @28@194
@28@194:
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_IN_UserInput	endp
   ;	
   ;	byte	IN_MouseButtons (void)
   ;	
	assume	cs:_TEXT
_IN_MouseButtons	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		if (MousePresent)
   ;	
	cmp	word ptr DGROUP:_MousePresent,0
	je	short @29@98
   ;	
   ;		{
   ;			Mouse(MButtons);
   ;	
	mov	ax,3
	int	51
   ;	
   ;			return _BX;
   ;	
	mov	al,bl
	jmp	short @29@122
   ;	
   ;		}
   ;	
	jmp	short @29@122
@29@98:
   ;	
   ;		else
   ;			return 0;
   ;	
	mov	al,0
	jmp	short @29@122
@29@122:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_IN_MouseButtons	endp
   ;	
   ;	byte	IN_JoyButtons (void)
   ;	
	assume	cs:_TEXT
_IN_JoyButtons	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		unsigned joybits;
   ;	
   ;		joybits = inportb(0x201);	// Get all the joystick buttons
   ;	
	mov	dx,513
	in	al,dx
	mov	ah,0
	mov	bx,ax
   ;	
   ;		joybits >>= 4;				// only the high bits are useful
   ;	
	mov	cl,4
	shr	bx,cl
   ;	
   ;		joybits ^= 15;				// return with 1=pressed
   ;	
	xor	bx,15
   ;	
   ;	
   ;		return joybits;
   ;	
	mov	al,bl
	jmp	short @30@50
@30@50:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_IN_JoyButtons	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_JoyDefs	label	word
	db	48 dup (?)
INL_KeyHook	label	word
	db	2 dup (?)
_Controls	label	word
	db	8 dup (?)
_JoysPresent	label	word
	db	4 dup (?)
_MousePresent	label	word
	db	2 dup (?)
_LastASCII	label	byte
	db	1 dup (?)
	db	1 dup (?)
OldKeyVect	label	dword
	db	4 dup (?)
_Paused	label	word
	db	2 dup (?)
_JoyPadPresent	label	word
	db	2 dup (?)
_btnstate	label	word
	db	16 dup (?)
CurCode	label	byte
	db	1 dup (?)
	db	1 dup (?)
_MouseDownCount	label	word
	db	4 dup (?)
_LastScan	label	byte
	db	1 dup (?)
	db	1 dup (?)
CapsLock	label	word
	db	2 dup (?)
LastCode	label	byte
	db	1 dup (?)
	db	1 dup (?)
_Keyboard	label	word
	db	256 dup (?)
_DemoBuffer	label	word
	db	2 dup (?)
_DemoOffset	label	word
	db	2 dup (?)
_DemoSize	label	word
	db	2 dup (?)
IN_Started	label	word
	db	2 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'nojoys'
	db	0
	db	'nomouse'
	db	0
	db	'Demo playback exceeded'
	db	0
	db	'Demo buffer overflow'
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_IN_Started	equ	IN_Started
_ParmStrings	equ	ParmStrings
	public	_KbdDefs
	public	_DemoSize
	extrn	_TimeCount:word
	public	_DemoOffset
	public	_DemoBuffer
	public	_IN_Ack
	public	_Keyboard
_DirTable	equ	DirTable
_SpecialNames	equ	SpecialNames
_INL_GetMouseButtons	equ	INL_GetMouseButtons
_LastCode	equ	LastCode
	public	_DemoMode
_CapsLock	equ	CapsLock
	public	_LastScan
	extrn	_setvect:near
	extrn	_getvect:near
	public	_MouseDownCount
_INL_GetMouseDelta	equ	INL_GetMouseDelta
_CurCode	equ	CurCode
	extrn	_memset:near
	public	_IN_SetControlType
	public	_btnstate
	public	_IN_ClearKeysDown
_ShiftNames	equ	ShiftNames
	public	_JoyPadPresent
_INL_GetJoyButtons	equ	INL_GetJoyButtons
	public	_Paused
_OldKeyVect	equ	OldKeyVect
	extrn	_US_CheckParm:near
	extrn	__argv:word
	extrn	__argc:word
	public	_LastASCII
	public	_MousePresent
	public	_INL_GetJoyDelta
	extrn	_Quit:near
	public	_JoysPresent
	public	_IN_MouseButtons
_INL_SetJoyScale	equ	INL_SetJoyScale
_INL_StartMouse	equ	INL_StartMouse
	public	_IN_ReadControl
_INL_ShutMouse	equ	INL_ShutMouse
	public	_IN_SetKeyHook
	public	_IN_JoyButtons
	public	_IN_UserInput
_ASCIINames	equ	ASCIINames
	public	_IN_GetJoyButtonsDB
_INL_KeyService	equ	INL_KeyService
_INL_StartJoy	equ	INL_StartJoy
	public	_IN_Shutdown
	extrn	N_LDIV@:far
	public	_IN_WaitForKey
	public	_Controls
_INL_ShutJoy	equ	INL_ShutJoy
_INL_KeyHook	equ	INL_KeyHook
	public	_IN_SetupJoy
	public	_IN_Startup
_INL_StartKbd	equ	INL_StartKbd
	public	_IN_GetJoyAbs
	public	_IN_WaitForASCII
	public	_JoyDefs
	public	_IN_Default
	public	_IN_CheckAck
	public	_IN_StartAck
_INL_ShutKbd	equ	INL_ShutKbd
	end
