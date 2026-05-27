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
	?debug	S "c:\id_us_1.c"
	?debug	C E9E551FE7C0C633A5C69645F75735F312E63
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
ParmStrings	label	word
	dw	DGROUP:s@
	dw	DGROUP:s@+9
ParmStrings2	label	word
	dw	DGROUP:s@+16
	dw	DGROUP:s@+21
_USL_MeasureString	label	word
	dw	_VW_MeasurePropString
_USL_DrawString	label	word
	dw	_VWB_DrawPropString
_Scores	label	word
	db	105
	db	100
	db	32
	db	115
	db	111
	db	102
	db	116
	db	119
	db	97
	db	114
	db	101
	db	45
	db	39
	db	57
	db	50
	db	43 dup (0)
	db	16
	db	39
	db	0
	db	0
	db	1
	db	0
	db	2 dup (0)
	db	65
	db	100
	db	114
	db	105
	db	97
	db	110
	db	32
	db	67
	db	97
	db	114
	db	109
	db	97
	db	99
	db	107
	db	44 dup (0)
	db	16
	db	39
	db	0
	db	0
	db	1
	db	0
	db	2 dup (0)
	db	74
	db	111
	db	104
	db	110
	db	32
	db	67
	db	97
	db	114
	db	109
	db	97
	db	99
	db	107
	db	46 dup (0)
	db	16
	db	39
	db	0
	db	0
	db	1
	db	0
	db	2 dup (0)
	db	75
	db	101
	db	118
	db	105
	db	110
	db	32
	db	67
	db	108
	db	111
	db	117
	db	100
	db	47 dup (0)
	db	16
	db	39
	db	0
	db	0
	db	1
	db	0
	db	2 dup (0)
	db	84
	db	111
	db	109
	db	32
	db	72
	db	97
	db	108
	db	108
	db	50 dup (0)
	db	16
	db	39
	db	0
	db	0
	db	1
	db	0
	db	2 dup (0)
	db	74
	db	111
	db	104
	db	110
	db	32
	db	82
	db	111
	db	109
	db	101
	db	114
	db	111
	db	47 dup (0)
	db	16
	db	39
	db	0
	db	0
	db	1
	db	0
	db	2 dup (0)
	db	74
	db	97
	db	121
	db	32
	db	87
	db	105
	db	108
	db	98
	db	117
	db	114
	db	48 dup (0)
	db	16
	db	39
	db	0
	db	0
	db	1
	db	0
	db	2 dup (0)
_DATA	ends
_BSS	segment word public 'BSS'
	db	32 dup (?)
	db	12 dup (?)
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	int
   ;	
	assume	cs:_TEXT
_USL_HardError	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	di
   ;	
   ;	USL_HardError(word errval,int ax,int bp,int si)
   ;	{
   ;	#define IGNORE  0
   ;	#define RETRY   1
   ;	#define	ABORT   2
   ;	extern	void	ShutdownId(void);
   ;	
   ;	static	char		buf[32];
   ;	static	WindowRec	wr;
   ;			int			di;
   ;			char		c,*s,*t;
   ;	
   ;	
   ;	
	mov	word ptr [bp-2],di
   ;	
   ;		di = _DI;
   ;	
   ;	
	cmp	word ptr [bp+6],0
	jge	short @1@74
   ;	
   ;		if (ax < 0)
   ;	
	mov	si,offset DGROUP:s@+28
	jmp	short @1@290
@1@74:
   ;	
   ;			s = "Device Error";
   ;		else
   ;		{
   ;	
	test	word ptr [bp-2],255
	jne	short @1@122
   ;	
   ;			if ((di & 0x00ff) == 0)
   ;	
	mov	si,offset DGROUP:s@+41
	jmp	short @1@146
@1@122:
   ;	
   ;				s = "Drive ~ is Write Protected";
   ;			else
   ;	
	mov	si,offset DGROUP:s@+68
@1@146:
   ;	
   ;				s = "Error on Drive ~";
   ;	
	mov	word ptr [bp-6],offset DGROUP:b@+0
	jmp	short @1@242
@1@170:
   ;	
   ;			for (t = buf;*s;s++,t++)	// Can't use sprintf()
   ;	
	mov	al,byte ptr [si]
	mov	bx,word ptr [bp-6]
	mov	byte ptr [bx],al
	cmp	al,126
	jne	short @1@218
   ;	
   ;				if ((*t = *s) == '~')
   ;	
	mov	al,byte ptr [bp+6]
	and	al,255
	add	al,65
	mov	bx,word ptr [bp-6]
	mov	byte ptr [bx],al
@1@218:
	inc	si
	inc	word ptr [bp-6]
@1@242:
	cmp	byte ptr [si],0
	jne	short @1@170
   ;	
   ;					*t = (ax & 0x00ff) + 'A';
   ;	
	mov	bx,word ptr [bp-6]
	mov	byte ptr [bx],0
   ;	
   ;			*t = '\0';
   ;	
	mov	si,offset DGROUP:b@+0
@1@290:
   ;	
   ;			s = buf;
   ;		}
   ;	
   ;	
	mov	ax,64
	mov	es,ax
	mov	al,byte ptr es:[73]
	mov	byte ptr [bp-3],al
   ;	
   ;		c = peekb(0x40,0x49);	// Get the current screen mode
   ;	
	cmp	byte ptr [bp-3],4
	jl	short @1@338
	cmp	byte ptr [bp-3],7
	jne	short @1@362
@1@338:
   ;	
   ;		if ((c < 4) || (c == 7))
   ;	
	jmp	short @1@674
@1@362:
   ;	
   ;			goto oh_kill_me;
   ;	
   ;		// DEBUG - handle screen cleanup
   ;	
   ;	
	mov	ax,offset DGROUP:b@w+32
	push	ax
	call	near ptr _US_SaveWindow
	pop	cx
   ;	
   ;		US_SaveWindow(&wr);
   ;	
	mov	ax,3
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _US_CenterWindow
	pop	cx
	pop	cx
   ;	
   ;		US_CenterWindow(30,3);
   ;	
	push	ds
	push	si
	call	near ptr _US_CPrint
	pop	cx
	pop	cx
   ;	
   ;		US_CPrint(s);
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+85
	push	ax
	call	near ptr _US_CPrint
	pop	cx
	pop	cx
   ;	
   ;		US_CPrint("(R)etry or (A)bort?");
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;		IN_ClearKeysDown();
   ;	
   ;	
		sti		
@1@410:
   ;	
   ;	asm	sti	// Let the keyboard interrupts come through
   ;	
   ;		while (true)
   ;		{
   ;	
	call	near ptr _IN_WaitForASCII
	cbw	
	mov	word ptr [bp-8],ax
	mov	cx,7
	mov	bx,offset @1@C2440
@1@458:
	mov	ax,word ptr cs:[bx]
	cmp	ax,word ptr [bp-8]
	je	short @1@530
	inc	bx
	inc	bx
	loop	short @1@458
	jmp	short @1@650
@1@530:
	jmp	word ptr cs:[bx+14]
@1@554:
   ;	
   ;			switch (IN_WaitForASCII())
   ;			{
   ;			case key_Escape:
   ;			case 'a':
   ;			case 'A':
   ;	
	jmp	short @1@674
   ;	
   ;				goto oh_kill_me;
   ;	
	jmp	short @1@650
@1@602:
   ;	
   ;				break;
   ;			case key_Return:
   ;			case key_Space:
   ;			case 'r':
   ;			case 'R':
   ;	
	call	near ptr _US_ClearWindow
   ;	
   ;				US_ClearWindow();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;				VW_UpdateScreen();
   ;	
	mov	ax,offset DGROUP:b@w+32
	push	ax
	call	near ptr _US_RestoreWindow
	pop	cx
   ;	
   ;				US_RestoreWindow(&wr);
   ;	
	mov	ax,1
	jmp	short @1@746
   ;	
   ;				return(RETRY);
   ;	
	jmp	short @1@650
@1@650:
	jmp	short @1@410
@1@674:
   ;	
   ;				break;
   ;			}
   ;		}
   ;	
   ;	oh_kill_me:
   ;	
	mov	word ptr DGROUP:_abortprogram,si
   ;	
   ;		abortprogram = s;
   ;	
	call	near ptr _ShutdownId
   ;	
   ;		ShutdownId();
   ;	
	push	si
	mov	ax,offset DGROUP:s@+105
	push	ax
	mov	ax,offset DGROUP:__streams+32
	push	ax
	call	near ptr _fprintf
	add	sp,6
   ;	
   ;		fprintf(stderr,"Terminal Error: %s\n",s);
   ;	
	cmp	word ptr DGROUP:_tedlevel,0
	je	short @1@722
   ;	
   ;		if (tedlevel)
   ;	
	mov	ax,offset DGROUP:s@+125
	push	ax
	mov	ax,offset DGROUP:__streams+32
	push	ax
	call	near ptr _fprintf
	pop	cx
	pop	cx
@1@722:
   ;	
   ;			fprintf(stderr,"You launched from TED. I suggest that you reboot...\n");
   ;	
   ;	
	mov	ax,2
	jmp	short @1@746
@1@746:
   ;	
   ;		return(ABORT);
   ;	#undef	IGNORE
   ;	#undef	RETRY
   ;	#undef	ABORT
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_USL_HardError	endp
@1@C2440	label	word
	db	13
	db	0
	db	27
	db	0
	db	32
	db	0
	db	65
	db	0
	db	82
	db	0
	db	97
	db	0
	db	114
	db	0
	dw	@1@602
	dw	@1@554
	dw	@1@602
	dw	@1@554
	dw	@1@602
	dw	@1@554
	dw	@1@602
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_US_Startup	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	US_Startup(void)
   ;	{
   ;		int	i,n;
   ;	
   ;	
	cmp	word ptr DGROUP:US_Started,0
	je	short @2@74
   ;	
   ;		if (US_Started)
   ;	
	jmp	@2@602
@2@74:
   ;	
   ;			return;
   ;	
   ;	
	mov	ax,offset _USL_HardError
	push	ax
	call	near ptr _harderr
	pop	cx
   ;	
   ;		harderr(USL_HardError);	// Install the fatal error handler
   ;	
   ;	
	mov	ax,1
	push	ax
	call	near ptr _US_InitRndT
	pop	cx
   ;	
   ;		US_InitRndT(true);		// Initialize the random number generator
   ;	
   ;	
	mov	si,1
	jmp	short @2@266
@2@98:
   ;	
   ;		for (i = 1;i < _argc;i++)
   ;		{
   ;	
	mov	ax,offset DGROUP:ParmStrings2
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
	je	short @2@194
	cmp	ax,1
	je	short @2@218
	jmp	short @2@242
@2@194:
   ;	
   ;			switch (US_CheckParm(_argv[i],ParmStrings2))
   ;			{
   ;			case 0:
   ;	
	mov	word ptr DGROUP:_compatability,1
   ;	
   ;				compatability = true;
   ;	
	jmp	short @2@242
@2@218:
   ;	
   ;				break;
   ;			case 1:
   ;	
	mov	word ptr DGROUP:_compatability,0
   ;	
   ;				compatability = false;
   ;	
	jmp	short @2@242
@2@242:
	inc	si
@2@266:
	cmp	si,word ptr DGROUP:__argc
	jl	short @2@98
   ;	
   ;				break;
   ;			}
   ;		}
   ;	
   ;		// Check for TED launching here
   ;	
	mov	si,1
	jmp	short @2@554
@2@314:
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
	mov	di,ax
   ;	
   ;			n = US_CheckParm(_argv[i],ParmStrings);
   ;	
	mov	ax,di
	or	ax,ax
	je	short @2@434
	cmp	ax,1
	je	short @2@506
	jmp	short @2@530
@2@434:
   ;	
   ;			switch(n)
   ;			{
   ;			 case 0:
   ;	
	mov	ax,si
	inc	ax
	shl	ax,1
	mov	bx,word ptr DGROUP:__argv
	add	bx,ax
	push	word ptr [bx]
	call	near ptr _atol
	pop	cx
	mov	word ptr DGROUP:_tedlevelnum,ax
   ;	
   ;			   tedlevelnum = atoi(_argv[i + 1]);
   ;	
	cmp	word ptr DGROUP:_tedlevelnum,0
	jl	short @2@482
   ;	
   ;			   if (tedlevelnum >= 0)
   ;	
	mov	word ptr DGROUP:_tedlevel,1
@2@482:
   ;	
   ;			     tedlevel = true;
   ;	
	jmp	short @2@530
@2@506:
   ;	
   ;			   break;
   ;	
   ;			 case 1:
   ;	
	mov	word ptr DGROUP:_NoWait,1
   ;	
   ;			   NoWait = true;
   ;	
	jmp	short @2@530
@2@530:
	inc	si
@2@554:
	cmp	si,word ptr DGROUP:__argc
	jl	short @2@314
   ;	
   ;			   break;
   ;			}
   ;		}
   ;	
   ;	
	mov	word ptr DGROUP:US_Started,1
@2@602:
   ;	
   ;		US_Started = true;
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_US_Startup	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_US_Shutdown	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	US_Shutdown(void)
   ;	{
   ;	
	cmp	word ptr DGROUP:US_Started,0
	jne	short @3@74
   ;	
   ;		if (!US_Started)
   ;	
	jmp	short @3@98
@3@74:
   ;	
   ;			return;
   ;	
   ;	
	mov	word ptr DGROUP:US_Started,0
@3@98:
   ;	
   ;		US_Started = false;
   ;	
	pop	bp
	ret	
_US_Shutdown	endp
   ;	
   ;	int
   ;	
	assume	cs:_TEXT
_US_CheckParm	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
	push	di
	mov	si,word ptr [bp+6]
	jmp	short @4@74
@4@50:
   ;	
   ;	US_CheckParm(char *parm,char **strings)
   ;	{
   ;		char	cp,cs,
   ;				*p,*s;
   ;		int		i;
   ;	
   ;		while (!isalpha(*parm))	// Skip non-alphas
   ;	
	inc	word ptr [bp+4]
@4@74:
	mov	bx,word ptr [bp+4]
	mov	al,byte ptr [bx]
	cbw	
	mov	bx,ax
	mov	al,byte ptr DGROUP:__ctype[bx+1]
	cbw	
	test	ax,12
	je	short @4@50
   ;	
   ;			parm++;
   ;	
   ;	
	mov	word ptr [bp-6],0
	jmp	short @4@338
@4@122:
   ;	
   ;		for (i = 0;*strings && **strings;i++)
   ;		{
   ;	
	mov	di,word ptr [si]
	inc	si
	inc	si
	mov	ax,word ptr [bp+4]
	mov	word ptr [bp-4],ax
	mov	al,0
	mov	byte ptr [bp-1],al
	mov	byte ptr [bp-2],al
	jmp	short @4@290
@4@146:
   ;	
   ;			for (s = *strings++,p = parm,cs = cp = 0;cs == cp;)
   ;			{
   ;	
	mov	al,byte ptr [di]
	mov	byte ptr [bp-2],al
	inc	di
   ;	
   ;				cs = *s++;
   ;	
	mov	al,byte ptr [bp-2]
	cbw	
	or	ax,ax
	jne	short @4@194
   ;	
   ;				if (!cs)
   ;	
	mov	ax,word ptr [bp-6]
	jmp	short @4@410
@4@194:
   ;	
   ;					return(i);
   ;	
	mov	bx,word ptr [bp-4]
	mov	al,byte ptr [bx]
	mov	byte ptr [bp-1],al
	inc	word ptr [bp-4]
   ;	
   ;				cp = *p++;
   ;	
   ;	
	mov	al,byte ptr [bp-2]
	cbw	
	mov	bx,ax
	test	byte ptr DGROUP:__ctype[bx+1],4
	je	short @4@242
   ;	
   ;				if (isupper(cs))
   ;	
	mov	al,byte ptr [bp-2]
	cbw	
	push	ax
	call	near ptr _tolower
	pop	cx
	mov	byte ptr [bp-2],al
@4@242:
   ;	
   ;					cs = tolower(cs);
   ;	
	mov	al,byte ptr [bp-1]
	cbw	
	mov	bx,ax
	test	byte ptr DGROUP:__ctype[bx+1],4
	je	short @4@290
   ;	
   ;				if (isupper(cp))
   ;	
	mov	al,byte ptr [bp-1]
	cbw	
	push	ax
	call	near ptr _tolower
	pop	cx
	mov	byte ptr [bp-1],al
@4@290:
	mov	al,byte ptr [bp-2]
	cmp	al,byte ptr [bp-1]
	je	short @4@146
	inc	word ptr [bp-6]
@4@338:
	cmp	word ptr [si],0
	je	short @4@386
	mov	bx,word ptr [si]
	cmp	byte ptr [bx],0
	jne	short @4@122
@4@386:
   ;	
   ;					cp = tolower(cp);
   ;			}
   ;		}
   ;	
	mov	ax,65535
	jmp	short @4@410
@4@410:
   ;	
   ;		return(-1);
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_US_CheckParm	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_US_SetPrintRoutines	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	US_SetPrintRoutines(void (*measure)(char far *,word *,word *),void (*print)(char far *))
   ;	{
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:_USL_MeasureString,ax
   ;	
   ;		USL_MeasureString = measure;
   ;	
	mov	ax,word ptr [bp+6]
	mov	word ptr DGROUP:_USL_DrawString,ax
   ;	
   ;		USL_DrawString = print;
   ;	
	pop	bp
	ret	
_US_SetPrintRoutines	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_US_Print	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	jmp	@6@218
@6@50:
   ;	
   ;	US_Print(char far *s)
   ;	{
   ;		char	c,far *se;
   ;		word	w,h;
   ;	
   ;		while (*s)
   ;		{
   ;	
	mov	ax,word ptr [bp+6]
	mov	dx,word ptr [bp+4]
	mov	word ptr [bp-6],dx
	mov	word ptr [bp-4],ax
	jmp	short @6@98
@6@74:
   ;	
   ;			se = s;
   ;			while ((c = *se) && (c != '\n'))
   ;	
	inc	word ptr [bp-6]
@6@98:
	les	bx,dword ptr [bp-6]
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-1],al
	or	al,al
	je	short @6@146
	cmp	byte ptr [bp-1],10
	jne	short @6@74
@6@146:
   ;	
   ;				se++;
   ;	
	les	bx,dword ptr [bp-6]
	mov	byte ptr es:[bx],0
   ;	
   ;			*se = '\0';
   ;	
   ;	
	lea	ax,word ptr [bp-10]
	push	ax
	lea	ax,word ptr [bp-8]
	push	ax
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	word ptr DGROUP:_USL_MeasureString
	add	sp,8
   ;	
   ;			USL_MeasureString(s,&w,&h);
   ;	
	mov	ax,word ptr DGROUP:_PrintX
	mov	word ptr DGROUP:_px,ax
   ;	
   ;			px = PrintX;
   ;	
	mov	ax,word ptr DGROUP:_PrintY
	mov	word ptr DGROUP:_py,ax
   ;	
   ;			py = PrintY;
   ;	
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	word ptr DGROUP:_USL_DrawString
	pop	cx
	pop	cx
   ;	
   ;			USL_DrawString(s);
   ;	
   ;	
	mov	ax,word ptr [bp-4]
	mov	dx,word ptr [bp-6]
	mov	word ptr [bp+4],dx
	mov	word ptr [bp+6],ax
   ;	
   ;			s = se;
   ;	
	cmp	byte ptr [bp-1],0
	je	short @6@194
   ;	
   ;			if (c)
   ;			{
   ;	
	les	bx,dword ptr [bp-6]
	mov	al,byte ptr [bp-1]
	mov	byte ptr es:[bx],al
   ;	
   ;				*se = c;
   ;	
	inc	word ptr [bp+4]
   ;	
   ;				s++;
   ;	
   ;	
	mov	ax,word ptr DGROUP:_WindowX
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;				PrintX = WindowX;
   ;	
	mov	ax,word ptr [bp-10]
	add	word ptr DGROUP:_PrintY,ax
   ;	
   ;				PrintY += h;
   ;	
	jmp	short @6@218
@6@194:
   ;	
   ;			}
   ;			else
   ;	
	mov	ax,word ptr [bp-8]
	add	word ptr DGROUP:_PrintX,ax
@6@218:
	les	bx,dword ptr [bp+4]
	cmp	byte ptr es:[bx],0
	je	@@0
	jmp	@6@50
@@0:
   ;	
   ;				PrintX += w;
   ;		}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_US_Print	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_US_PrintUnsigned	proc	near
	push	bp
	mov	bp,sp
	sub	sp,32
   ;	
   ;	US_PrintUnsigned(longword n)
   ;	{
   ;		char	buffer[32];
   ;	
   ;	
	push	ds
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-32]
	push	ax
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _ultoa
	add	sp,8
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		US_Print(ultoa(n,buffer,10));
   ;	
	mov	sp,bp
	pop	bp
	ret	
_US_PrintUnsigned	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_US_PrintSigned	proc	near
	push	bp
	mov	bp,sp
	sub	sp,32
   ;	
   ;	US_PrintSigned(long n)
   ;	{
   ;		char	buffer[32];
   ;	
   ;	
	push	ds
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-32]
	push	ax
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _ltoa
	add	sp,8
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		US_Print(ltoa(n,buffer,10));
   ;	
	mov	sp,bp
	pop	bp
	ret	
_US_PrintSigned	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_USL_PrintInCenter	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
   ;	
   ;	USL_PrintInCenter(char far *s,Rect r)
   ;	{
   ;		word	w,h,
   ;				rw,rh;
   ;	
   ;	
	lea	ax,word ptr [bp-4]
	push	ax
	lea	ax,word ptr [bp-2]
	push	ax
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	word ptr DGROUP:_USL_MeasureString
	add	sp,8
   ;	
   ;		USL_MeasureString(s,&w,&h);
   ;	
	mov	ax,word ptr [bp+12]
	sub	ax,word ptr [bp+8]
	mov	di,ax
   ;	
   ;		rw = r.lr.x - r.ul.x;
   ;	
	mov	ax,word ptr [bp+14]
	sub	ax,word ptr [bp+10]
	mov	si,ax
   ;	
   ;		rh = r.lr.y - r.ul.y;
   ;	
   ;	
	mov	ax,di
	sub	ax,word ptr [bp-2]
	shr	ax,1
	mov	dx,word ptr [bp+8]
	add	dx,ax
	mov	word ptr DGROUP:_px,dx
   ;	
   ;		px = r.ul.x + ((rw - w) / 2);
   ;	
	mov	ax,si
	sub	ax,word ptr [bp-4]
	shr	ax,1
	mov	dx,word ptr [bp+10]
	add	dx,ax
	mov	word ptr DGROUP:_py,dx
   ;	
   ;		py = r.ul.y + ((rh - h) / 2);
   ;	
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	word ptr DGROUP:_USL_DrawString
	pop	cx
	pop	cx
   ;	
   ;		USL_DrawString(s);
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_USL_PrintInCenter	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_US_PrintCentered	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
   ;	
   ;	US_PrintCentered(char far *s)
   ;	{
   ;		Rect	r;
   ;	
   ;	
	mov	ax,word ptr DGROUP:_WindowX
	mov	word ptr [bp-8],ax
   ;	
   ;		r.ul.x = WindowX;
   ;	
	mov	ax,word ptr DGROUP:_WindowY
	mov	word ptr [bp-6],ax
   ;	
   ;		r.ul.y = WindowY;
   ;	
	mov	ax,word ptr [bp-8]
	add	ax,word ptr DGROUP:_WindowW
	mov	word ptr [bp-4],ax
   ;	
   ;		r.lr.x = r.ul.x + WindowW;
   ;	
	mov	ax,word ptr [bp-6]
	add	ax,word ptr DGROUP:_WindowH
	mov	word ptr [bp-2],ax
   ;	
   ;		r.lr.y = r.ul.y + WindowH;
   ;	
   ;	
	lea	ax,word ptr [bp-8]
	mov	dx,ss
	mov	cx,8
	call	near ptr N_SPUSH@
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _USL_PrintInCenter
	add	sp,12
   ;	
   ;		USL_PrintInCenter(s,r);
   ;	
	mov	sp,bp
	pop	bp
	ret	
_US_PrintCentered	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_US_CPrintLine	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;	US_CPrintLine(char far *s)
   ;	{
   ;		word	w,h;
   ;	
   ;	
	lea	ax,word ptr [bp-4]
	push	ax
	lea	ax,word ptr [bp-2]
	push	ax
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	word ptr DGROUP:_USL_MeasureString
	add	sp,8
   ;	
   ;		USL_MeasureString(s,&w,&h);
   ;	
   ;	
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr DGROUP:_WindowW
	jbe	short @11@74
   ;	
   ;		if (w > WindowW)
   ;	
	mov	ax,offset DGROUP:s@+178
	push	ax
	call	near ptr _Quit
	pop	cx
@11@74:
   ;	
   ;			Quit("US_CPrintLine() - String exceeds width");
   ;	
	mov	ax,word ptr DGROUP:_WindowW
	sub	ax,word ptr [bp-2]
	shr	ax,1
	mov	dx,word ptr DGROUP:_WindowX
	add	dx,ax
	mov	word ptr DGROUP:_px,dx
   ;	
   ;		px = WindowX + ((WindowW - w) / 2);
   ;	
	mov	ax,word ptr DGROUP:_PrintY
	mov	word ptr DGROUP:_py,ax
   ;	
   ;		py = PrintY;
   ;	
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	word ptr DGROUP:_USL_DrawString
	pop	cx
	pop	cx
   ;	
   ;		USL_DrawString(s);
   ;	
	mov	ax,word ptr [bp-4]
	add	word ptr DGROUP:_PrintY,ax
   ;	
   ;		PrintY += h;
   ;	
	mov	sp,bp
	pop	bp
	ret	
_US_CPrintLine	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_US_CPrint	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	jmp	short @12@194
@12@50:
   ;	
   ;	US_CPrint(char far *s)
   ;	{
   ;		char	c,far *se;
   ;	
   ;		while (*s)
   ;		{
   ;	
	mov	ax,word ptr [bp+6]
	mov	dx,word ptr [bp+4]
	mov	word ptr [bp-6],dx
	mov	word ptr [bp-4],ax
	jmp	short @12@98
@12@74:
   ;	
   ;			se = s;
   ;			while ((c = *se) && (c != '\n'))
   ;	
	inc	word ptr [bp-6]
@12@98:
	les	bx,dword ptr [bp-6]
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-1],al
	or	al,al
	je	short @12@146
	cmp	byte ptr [bp-1],10
	jne	short @12@74
@12@146:
   ;	
   ;				se++;
   ;	
	les	bx,dword ptr [bp-6]
	mov	byte ptr es:[bx],0
   ;	
   ;			*se = '\0';
   ;	
   ;	
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _US_CPrintLine
	pop	cx
	pop	cx
   ;	
   ;			US_CPrintLine(s);
   ;	
   ;	
	mov	ax,word ptr [bp-4]
	mov	dx,word ptr [bp-6]
	mov	word ptr [bp+4],dx
	mov	word ptr [bp+6],ax
   ;	
   ;			s = se;
   ;	
	cmp	byte ptr [bp-1],0
	je	short @12@194
   ;	
   ;			if (c)
   ;			{
   ;	
	les	bx,dword ptr [bp-6]
	mov	al,byte ptr [bp-1]
	mov	byte ptr es:[bx],al
   ;	
   ;				*se = c;
   ;	
	inc	word ptr [bp+4]
@12@194:
	les	bx,dword ptr [bp+4]
	cmp	byte ptr es:[bx],0
	jne	short @12@50
   ;	
   ;				s++;
   ;			}
   ;		}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_US_CPrint	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_US_ClearWindow	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	US_ClearWindow(void)
   ;	{
   ;	
	mov	ax,15
	push	ax
	push	word ptr DGROUP:_WindowH
	push	word ptr DGROUP:_WindowW
	push	word ptr DGROUP:_WindowY
	push	word ptr DGROUP:_WindowX
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;		VWB_Bar(WindowX,WindowY,WindowW,WindowH,WHITE);
   ;	
	mov	ax,word ptr DGROUP:_WindowX
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;		PrintX = WindowX;
   ;	
	mov	ax,word ptr DGROUP:_WindowY
	mov	word ptr DGROUP:_PrintY,ax
   ;	
   ;		PrintY = WindowY;
   ;	
	pop	bp
	ret	
_US_ClearWindow	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_US_DrawWindow	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
	push	di
   ;	
   ;	US_DrawWindow(word x,word y,word w,word h)
   ;	{
   ;		word	i,
   ;				sx,sy,sw,sh;
   ;	
   ;	
	mov	ax,word ptr [bp+4]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	word ptr DGROUP:_WindowX,ax
   ;	
   ;		WindowX = x * 8;
   ;	
	mov	ax,word ptr [bp+6]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	word ptr DGROUP:_WindowY,ax
   ;	
   ;		WindowY = y * 8;
   ;	
	mov	ax,word ptr [bp+8]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	word ptr DGROUP:_WindowW,ax
   ;	
   ;		WindowW = w * 8;
   ;	
	mov	ax,word ptr [bp+10]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	word ptr DGROUP:_WindowH,ax
   ;	
   ;		WindowH = h * 8;
   ;	
   ;	
	mov	ax,word ptr DGROUP:_WindowX
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;		PrintX = WindowX;
   ;	
	mov	ax,word ptr DGROUP:_WindowY
	mov	word ptr DGROUP:_PrintY,ax
   ;	
   ;		PrintY = WindowY;
   ;	
   ;	
	mov	ax,word ptr [bp+4]
	dec	ax
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	word ptr [bp-2],ax
   ;	
   ;		sx = (x - 1) * 8;
   ;	
	mov	ax,word ptr [bp+6]
	dec	ax
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	di,ax
   ;	
   ;		sy = (y - 1) * 8;
   ;	
	mov	ax,word ptr [bp+8]
	inc	ax
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	word ptr [bp-4],ax
   ;	
   ;		sw = (w + 1) * 8;
   ;	
	mov	ax,word ptr [bp+10]
	inc	ax
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	word ptr [bp-6],ax
   ;	
   ;		sh = (h + 1) * 8;
   ;	
   ;	
	call	near ptr _US_ClearWindow
   ;	
   ;		US_ClearWindow();
   ;	
   ;	
	xor	ax,ax
	push	ax
	push	di
	push	word ptr [bp-2]
	call	near ptr _VWB_DrawTile8
	add	sp,6
	mov	ax,5
	push	ax
	mov	ax,di
	add	ax,word ptr [bp-6]
	push	ax
	push	word ptr [bp-2]
	call	near ptr _VWB_DrawTile8
	add	sp,6
   ;	
   ;		VWB_DrawTile8(sx,sy,0),VWB_DrawTile8(sx,sy + sh,5);
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,8
	mov	si,ax
	jmp	short @14@98
@14@50:
   ;	
   ;		for (i = sx + 8;i <= sx + sw - 8;i += 8)
   ;	
	mov	ax,1
	push	ax
	push	di
	push	si
	call	near ptr _VWB_DrawTile8
	add	sp,6
	mov	ax,6
	push	ax
	mov	ax,di
	add	ax,word ptr [bp-6]
	push	ax
	push	si
	call	near ptr _VWB_DrawTile8
	add	sp,6
	add	si,8
@14@98:
	mov	ax,word ptr [bp-2]
	add	ax,word ptr [bp-4]
	sub	ax,8
	cmp	ax,si
	jae	short @14@50
   ;	
   ;			VWB_DrawTile8(i,sy,1),VWB_DrawTile8(i,sy + sh,6);
   ;	
	mov	ax,2
	push	ax
	push	di
	push	si
	call	near ptr _VWB_DrawTile8
	add	sp,6
	mov	ax,7
	push	ax
	mov	ax,di
	add	ax,word ptr [bp-6]
	push	ax
	push	si
	call	near ptr _VWB_DrawTile8
	add	sp,6
   ;	
   ;		VWB_DrawTile8(i,sy,2),VWB_DrawTile8(i,sy + sh,7);
   ;	
   ;	
	mov	ax,di
	add	ax,8
	mov	si,ax
	jmp	short @14@194
@14@146:
   ;	
   ;		for (i = sy + 8;i <= sy + sh - 8;i += 8)
   ;	
	mov	ax,3
	push	ax
	push	si
	push	word ptr [bp-2]
	call	near ptr _VWB_DrawTile8
	add	sp,6
	mov	ax,4
	push	ax
	push	si
	mov	ax,word ptr [bp-2]
	add	ax,word ptr [bp-4]
	push	ax
	call	near ptr _VWB_DrawTile8
	add	sp,6
	add	si,8
@14@194:
	mov	ax,di
	add	ax,word ptr [bp-6]
	sub	ax,8
	cmp	ax,si
	jae	short @14@146
   ;	
   ;			VWB_DrawTile8(sx,i,3),VWB_DrawTile8(sx + sw,i,4);
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_US_DrawWindow	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_US_CenterWindow	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	US_CenterWindow(word w,word h)
   ;	{
   ;	
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	mov	ax,25
	sub	ax,word ptr [bp+6]
	shr	ax,1
	push	ax
	mov	ax,40
	sub	ax,word ptr [bp+4]
	shr	ax,1
	push	ax
	call	near ptr _US_DrawWindow
	add	sp,8
   ;	
   ;		US_DrawWindow(((MaxX / 8) - w) / 2,((MaxY / 8) - h) / 2,w,h);
   ;	
	pop	bp
	ret	
_US_CenterWindow	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_US_SaveWindow	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	US_SaveWindow(WindowRec *win)
   ;	{
   ;	
	mov	ax,word ptr DGROUP:_WindowX
	mov	word ptr [si],ax
   ;	
   ;		win->x = WindowX;
   ;	
	mov	ax,word ptr DGROUP:_WindowY
	mov	word ptr [si+2],ax
   ;	
   ;		win->y = WindowY;
   ;	
	mov	ax,word ptr DGROUP:_WindowW
	mov	word ptr [si+4],ax
   ;	
   ;		win->w = WindowW;
   ;	
	mov	ax,word ptr DGROUP:_WindowH
	mov	word ptr [si+6],ax
   ;	
   ;		win->h = WindowH;
   ;	
   ;	
	mov	ax,word ptr DGROUP:_PrintX
	mov	word ptr [si+8],ax
   ;	
   ;		win->px = PrintX;
   ;	
	mov	ax,word ptr DGROUP:_PrintY
	mov	word ptr [si+10],ax
   ;	
   ;		win->py = PrintY;
   ;	
	pop	si
	pop	bp
	ret	
_US_SaveWindow	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_US_RestoreWindow	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	US_RestoreWindow(WindowRec *win)
   ;	{
   ;	
	mov	ax,word ptr [si]
	mov	word ptr DGROUP:_WindowX,ax
   ;	
   ;		WindowX = win->x;
   ;	
	mov	ax,word ptr [si+2]
	mov	word ptr DGROUP:_WindowY,ax
   ;	
   ;		WindowY = win->y;
   ;	
	mov	ax,word ptr [si+4]
	mov	word ptr DGROUP:_WindowW,ax
   ;	
   ;		WindowW = win->w;
   ;	
	mov	ax,word ptr [si+6]
	mov	word ptr DGROUP:_WindowH,ax
   ;	
   ;		WindowH = win->h;
   ;	
   ;	
	mov	ax,word ptr [si+8]
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;		PrintX = win->px;
   ;	
	mov	ax,word ptr [si+10]
	mov	word ptr DGROUP:_PrintY,ax
   ;	
   ;		PrintY = win->py;
   ;	
	pop	si
	pop	bp
	ret	
_US_RestoreWindow	endp
_TEXT	ends
_BSS	segment word public 'BSS'
	db	2 dup (?)
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
USL_XORICursor	proc	near
	push	bp
	mov	bp,sp
	sub	sp,134
   ;	
   ;	USL_XORICursor(int x,int y,char *s,word cursor)
   ;	{
   ;		static	boolean	status;		// VGA doesn't XOR...
   ;		char	buf[MaxString];
   ;		int		temp;
   ;		word	w,h;
   ;	
   ;	
	push	word ptr [bp+8]
	lea	ax,word ptr [bp-134]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;		strcpy(buf,s);
   ;	
	lea	ax,word ptr [bp-134]
	mov	bx,word ptr [bp+10]
	add	bx,ax
	mov	byte ptr [bx],0
   ;	
   ;		buf[cursor] = '\0';
   ;	
	lea	ax,word ptr [bp-6]
	push	ax
	lea	ax,word ptr [bp-4]
	push	ax
	push	ss
	lea	ax,word ptr [bp-134]
	push	ax
	call	word ptr DGROUP:_USL_MeasureString
	add	sp,8
   ;	
   ;		USL_MeasureString(buf,&w,&h);
   ;	
   ;	
	mov	ax,word ptr [bp+4]
	add	ax,word ptr [bp-4]
	dec	ax
	mov	word ptr DGROUP:_px,ax
   ;	
   ;		px = x + w - 1;
   ;	
	mov	ax,word ptr [bp+6]
	mov	word ptr DGROUP:_py,ax
   ;	
   ;		py = y;
   ;	
	xor	word ptr DGROUP:b@w+44,1
	je	short @18@74
   ;	
   ;		if (status^=1)
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+217
	push	ax
	call	word ptr DGROUP:_USL_DrawString
	pop	cx
	pop	cx
	jmp	short @18@98
@18@74:
   ;	
   ;			USL_DrawString("\x80");
   ;		else
   ;		{
   ;	
	mov	al,byte ptr DGROUP:_fontcolor
	mov	ah,0
	mov	word ptr [bp-2],ax
   ;	
   ;			temp = fontcolor;
   ;	
	mov	al,byte ptr DGROUP:_backcolor
	mov	byte ptr DGROUP:_fontcolor,al
   ;	
   ;			fontcolor = backcolor;
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+219
	push	ax
	call	word ptr DGROUP:_USL_DrawString
	pop	cx
	pop	cx
   ;	
   ;			USL_DrawString("\x80");
   ;	
	mov	al,byte ptr [bp-2]
	mov	byte ptr DGROUP:_fontcolor,al
@18@98:
   ;	
   ;			fontcolor = temp;
   ;		}
   ;	
   ;	
	mov	sp,bp
	pop	bp
	ret	
USL_XORICursor	endp
   ;	
   ;	boolean
   ;	
	assume	cs:_TEXT
_US_LineInput	proc	near
	push	bp
	mov	bp,sp
	sub	sp,282
	push	si
	push	di
   ;	
   ;	US_LineInput(int x,int y,char *buf,char *def,boolean escok,
   ;					int maxchars,int maxwidth)
   ;	{
   ;		boolean		redraw,
   ;					cursorvis,cursormoved,
   ;					done,result;
   ;		ScanCode	sc;
   ;		char		c,
   ;					s[MaxString],olds[MaxString];
   ;		word		i,
   ;					cursor,
   ;					w,h,
   ;					len,temp;
   ;		longword	lasttime;
   ;	
   ;	
	cmp	word ptr [bp+10],0
	je	short @19@74
   ;	
   ;		if (def)
   ;	
	push	word ptr [bp+10]
	lea	ax,word ptr [bp-154]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
	jmp	short @19@98
@19@74:
   ;	
   ;			strcpy(s,def);
   ;		else
   ;	
	mov	byte ptr [bp-154],0
@19@98:
   ;	
   ;			*s = '\0';
   ;	
	mov	byte ptr [bp-282],0
   ;	
   ;		*olds = '\0';
   ;	
	lea	ax,word ptr [bp-154]
	push	ax
	call	near ptr _strlen
	pop	cx
	mov	si,ax
   ;	
   ;		cursor = strlen(s);
   ;	
	mov	ax,1
	mov	word ptr [bp-2],ax
	mov	di,ax
   ;	
   ;		cursormoved = redraw = true;
   ;	
   ;	
	xor	ax,ax
	mov	word ptr [bp-6],ax
	mov	word ptr [bp-4],ax
   ;	
   ;		cursorvis = done = false;
   ;	
	mov	ax,word ptr DGROUP:_TimeCount+2
	mov	dx,word ptr DGROUP:_TimeCount
	mov	word ptr [bp-24],dx
	mov	word ptr [bp-22],ax
   ;	
   ;		lasttime = TimeCount;
   ;	
	mov	byte ptr DGROUP:_LastASCII,0
   ;	
   ;		LastASCII = key_None;
   ;	
	mov	byte ptr DGROUP:_LastScan,0
	jmp	@19@1442
@19@122:
   ;	
   ;		LastScan = sc_None;
   ;	
   ;		while (!done)
   ;		{
   ;	
	cmp	word ptr [bp-4],0
	je	short @19@170
   ;	
   ;			if (cursorvis)
   ;	
	push	si
	lea	ax,word ptr [bp-154]
	push	ax
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr USL_XORICursor
	add	sp,8
@19@170:
   ;	
   ;				USL_XORICursor(x,y,s,cursor);
   ;	
   ;	
		pushf	
   ;	
   ;		asm	pushf
   ;	
		cli	
   ;	
   ;		asm	cli
   ;	
   ;	
	mov	al,byte ptr DGROUP:_LastScan
	mov	byte ptr [bp-9],al
   ;	
   ;			sc = LastScan;
   ;	
	mov	byte ptr DGROUP:_LastScan,0
   ;	
   ;			LastScan = sc_None;
   ;	
	mov	al,byte ptr DGROUP:_LastASCII
	mov	byte ptr [bp-10],al
   ;	
   ;			c = LastASCII;
   ;	
	mov	byte ptr DGROUP:_LastASCII,0
   ;	
   ;			LastASCII = key_None;
   ;	
   ;	
		popf	
   ;	
   ;		asm	popf
   ;	
   ;	
	mov	al,byte ptr [bp-9]
	mov	ah,0
	mov	word ptr [bp-26],ax
	mov	cx,14
	mov	bx,offset @19@C4832
@19@314:
	mov	ax,word ptr cs:[bx]
	cmp	ax,word ptr [bp-26]
	je	short @19@386
	inc	bx
	inc	bx
	loop	short @19@314
	jmp	@19@866
@19@386:
	jmp	word ptr cs:[bx+28]
@19@410:
   ;	
   ;			switch (sc)
   ;			{
   ;			case sc_LeftArrow:
   ;	
	or	si,si
	je	short @19@458
   ;	
   ;				if (cursor)
   ;	
	dec	si
@19@458:
   ;	
   ;					cursor--;
   ;	
	mov	byte ptr [bp-10],0
   ;	
   ;				c = key_None;
   ;	
	mov	di,1
   ;	
   ;				cursormoved = true;
   ;	
	jmp	@19@866
@19@482:
   ;	
   ;				break;
   ;			case sc_RightArrow:
   ;	
	cmp	byte ptr [bp+si-154],0
	je	short @19@530
   ;	
   ;				if (s[cursor])
   ;	
	inc	si
@19@530:
   ;	
   ;					cursor++;
   ;	
	mov	byte ptr [bp-10],0
   ;	
   ;				c = key_None;
   ;	
	mov	di,1
   ;	
   ;				cursormoved = true;
   ;	
	jmp	@19@866
@19@554:
   ;	
   ;				break;
   ;			case sc_Home:
   ;	
	xor	si,si
   ;	
   ;				cursor = 0;
   ;	
	mov	byte ptr [bp-10],0
   ;	
   ;				c = key_None;
   ;	
	mov	di,1
   ;	
   ;				cursormoved = true;
   ;	
	jmp	@19@866
@19@578:
   ;	
   ;				break;
   ;			case sc_End:
   ;	
	lea	ax,word ptr [bp-154]
	push	ax
	call	near ptr _strlen
	pop	cx
	mov	si,ax
   ;	
   ;				cursor = strlen(s);
   ;	
	mov	byte ptr [bp-10],0
   ;	
   ;				c = key_None;
   ;	
	mov	di,1
   ;	
   ;				cursormoved = true;
   ;	
	jmp	@19@866
@19@602:
   ;	
   ;				break;
   ;	
   ;			case sc_Return:
   ;	
	lea	ax,word ptr [bp-154]
	push	ax
	push	word ptr [bp+8]
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;				strcpy(buf,s);
   ;	
	mov	word ptr [bp-6],1
   ;	
   ;				done = true;
   ;	
	mov	word ptr [bp-8],1
   ;	
   ;				result = true;
   ;	
	mov	byte ptr [bp-10],0
   ;	
   ;				c = key_None;
   ;	
	jmp	short @19@866
@19@626:
   ;	
   ;				break;
   ;			case sc_Escape:
   ;	
	cmp	word ptr [bp+12],0
	je	short @19@674
   ;	
   ;				if (escok)
   ;				{
   ;	
	mov	word ptr [bp-6],1
   ;	
   ;					done = true;
   ;	
	mov	word ptr [bp-8],0
@19@674:
   ;	
   ;					result = false;
   ;				}
   ;	
	mov	byte ptr [bp-10],0
   ;	
   ;				c = key_None;
   ;	
	jmp	short @19@866
@19@698:
   ;	
   ;				break;
   ;	
   ;			case sc_BackSpace:
   ;	
	or	si,si
	je	short @19@746
   ;	
   ;				if (cursor)
   ;				{
   ;	
	lea	ax,word ptr [bp-154]
	mov	dx,si
	add	dx,ax
	push	dx
	lea	ax,word ptr [bp-155]
	mov	dx,si
	add	dx,ax
	push	dx
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;					strcpy(s + cursor - 1,s + cursor);
   ;	
	dec	si
   ;	
   ;					cursor--;
   ;	
	mov	word ptr [bp-2],1
@19@746:
   ;	
   ;					redraw = true;
   ;				}
   ;	
	mov	byte ptr [bp-10],0
   ;	
   ;				c = key_None;
   ;	
	mov	di,1
   ;	
   ;				cursormoved = true;
   ;	
	jmp	short @19@866
@19@770:
   ;	
   ;				break;
   ;			case sc_Delete:
   ;	
	cmp	byte ptr [bp+si-154],0
	je	short @19@818
   ;	
   ;				if (s[cursor])
   ;				{
   ;	
	lea	ax,word ptr [bp-153]
	mov	dx,si
	add	dx,ax
	push	dx
	lea	ax,word ptr [bp-154]
	mov	dx,si
	add	dx,ax
	push	dx
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;					strcpy(s + cursor,s + cursor + 1);
   ;	
	mov	word ptr [bp-2],1
@19@818:
   ;	
   ;					redraw = true;
   ;				}
   ;	
	mov	byte ptr [bp-10],0
   ;	
   ;				c = key_None;
   ;	
	mov	di,1
   ;	
   ;				cursormoved = true;
   ;	
	jmp	short @19@866
@19@842:
   ;	
   ;				break;
   ;	
   ;			case 0x4c:	// Keypad 5
   ;			case sc_UpArrow:
   ;			case sc_DownArrow:
   ;			case sc_PgUp:
   ;			case sc_PgDn:
   ;			case sc_Insert:
   ;	
	mov	byte ptr [bp-10],0
   ;	
   ;				c = key_None;
   ;	
	jmp	short @19@866
@19@866:
   ;	
   ;				break;
   ;			}
   ;	
   ;	
	cmp	byte ptr [bp-10],0
	jne	@@1
	jmp	@19@1178
@@1:
   ;	
   ;			if (c)
   ;			{
   ;	
	lea	ax,word ptr [bp-154]
	push	ax
	call	near ptr _strlen
	pop	cx
	mov	word ptr [bp-18],ax
   ;	
   ;				len = strlen(s);
   ;	
	lea	ax,word ptr [bp-16]
	push	ax
	lea	ax,word ptr [bp-14]
	push	ax
	push	ss
	lea	ax,word ptr [bp-154]
	push	ax
	call	word ptr DGROUP:_USL_MeasureString
	add	sp,8
   ;	
   ;				USL_MeasureString(s,&w,&h);
   ;	
   ;	
   ;	
   ;				if
   ;				(
   ;					isprint(c)
   ;				&&	(len < MaxString - 1)
   ;				&&	((!maxchars) || (len < maxchars))
   ;				&&	((!maxwidth) || (w < maxwidth))
   ;	
	cmp	byte ptr [bp-10],32
	jl	short @19@1178
	cmp	byte ptr [bp-10],126
	jg	short @19@1178
	cmp	word ptr [bp-18],127
	jae	short @19@1178
	cmp	word ptr [bp+14],0
	je	short @19@1010
	mov	ax,word ptr [bp-18]
	cmp	ax,word ptr [bp+14]
	jae	short @19@1178
@19@1010:
	cmp	word ptr [bp+16],0
	je	short @19@1058
	mov	ax,word ptr [bp-14]
	cmp	ax,word ptr [bp+16]
	jae	short @19@1178
@19@1058:
   ;	
   ;				)
   ;				{
   ;	
	mov	ax,word ptr [bp-18]
	inc	ax
	mov	word ptr [bp-12],ax
	jmp	short @19@1130
@19@1082:
   ;	
   ;					for (i = len + 1;i > cursor;i--)
   ;	
	mov	bx,word ptr [bp-12]
	dec	bx
	lea	ax,word ptr [bp-154]
	add	bx,ax
	mov	al,byte ptr [bx]
	lea	dx,word ptr [bp-154]
	mov	bx,word ptr [bp-12]
	add	bx,dx
	mov	byte ptr [bx],al
	dec	word ptr [bp-12]
@19@1130:
	cmp	word ptr [bp-12],si
	ja	short @19@1082
   ;	
   ;						s[i] = s[i - 1];
   ;	
	mov	al,byte ptr [bp-10]
	mov	byte ptr [bp+si-154],al
	inc	si
   ;	
   ;					s[cursor++] = c;
   ;	
	mov	word ptr [bp-2],1
@19@1178:
   ;	
   ;					redraw = true;
   ;				}
   ;			}
   ;	
   ;	
	cmp	word ptr [bp-2],0
	je	short @19@1226
   ;	
   ;			if (redraw)
   ;			{
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:_px,ax
   ;	
   ;				px = x;
   ;	
	mov	ax,word ptr [bp+6]
	mov	word ptr DGROUP:_py,ax
   ;	
   ;				py = y;
   ;	
	mov	al,byte ptr DGROUP:_fontcolor
	mov	ah,0
	mov	word ptr [bp-20],ax
   ;	
   ;				temp = fontcolor;
   ;	
	mov	al,byte ptr DGROUP:_backcolor
	mov	byte ptr DGROUP:_fontcolor,al
   ;	
   ;				fontcolor = backcolor;
   ;	
	push	ss
	lea	ax,word ptr [bp-282]
	push	ax
	call	word ptr DGROUP:_USL_DrawString
	pop	cx
	pop	cx
   ;	
   ;				USL_DrawString(olds);
   ;	
	mov	al,byte ptr [bp-20]
	mov	byte ptr DGROUP:_fontcolor,al
   ;	
   ;				fontcolor = temp;
   ;	
	lea	ax,word ptr [bp-154]
	push	ax
	lea	ax,word ptr [bp-282]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;				strcpy(olds,s);
   ;	
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:_px,ax
   ;	
   ;				px = x;
   ;	
	mov	ax,word ptr [bp+6]
	mov	word ptr DGROUP:_py,ax
   ;	
   ;				py = y;
   ;	
	push	ss
	lea	ax,word ptr [bp-154]
	push	ax
	call	word ptr DGROUP:_USL_DrawString
	pop	cx
	pop	cx
   ;	
   ;				USL_DrawString(s);
   ;	
   ;	
	mov	word ptr [bp-2],0
@19@1226:
   ;	
   ;				redraw = false;
   ;			}
   ;	
   ;	
	or	di,di
	je	short @19@1274
   ;	
   ;			if (cursormoved)
   ;			{
   ;	
	mov	word ptr [bp-4],0
   ;	
   ;				cursorvis = false;
   ;	
	mov	ax,word ptr DGROUP:_TimeCount+2
	mov	dx,word ptr DGROUP:_TimeCount
	sub	dx,70
	sbb	ax,0
	mov	word ptr [bp-24],dx
	mov	word ptr [bp-22],ax
   ;	
   ;				lasttime = TimeCount - TickBase;
   ;	
   ;	
	xor	di,di
@19@1274:
   ;	
   ;				cursormoved = false;
   ;			}
   ;	
	mov	ax,word ptr DGROUP:_TimeCount+2
	mov	dx,word ptr DGROUP:_TimeCount
	sub	dx,word ptr [bp-24]
	sbb	ax,word ptr [bp-22]
	or	ax,ax
	jb	short @19@1370
	ja	short @19@1346
	cmp	dx,35
	jbe	short @19@1370
@19@1346:
   ;	
   ;			if (TimeCount - lasttime > TickBase / 2)
   ;			{
   ;	
	mov	ax,word ptr DGROUP:_TimeCount+2
	mov	dx,word ptr DGROUP:_TimeCount
	mov	word ptr [bp-24],dx
	mov	word ptr [bp-22],ax
   ;	
   ;				lasttime = TimeCount;
   ;	
   ;	
	xor	word ptr [bp-4],1
@19@1370:
   ;	
   ;				cursorvis ^= true;
   ;			}
   ;	
	cmp	word ptr [bp-4],0
	je	short @19@1418
   ;	
   ;			if (cursorvis)
   ;	
	push	si
	lea	ax,word ptr [bp-154]
	push	ax
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr USL_XORICursor
	add	sp,8
@19@1418:
   ;	
   ;				USL_XORICursor(x,y,s,cursor);
   ;	
   ;	
	call	near ptr _VW_UpdateScreen
@19@1442:
	cmp	word ptr [bp-6],0
	jne	@@2
	jmp	@19@122
@@2:
   ;	
   ;			VW_UpdateScreen();
   ;		}
   ;	
   ;	
	cmp	word ptr [bp-4],0
	je	short @19@1514
   ;	
   ;		if (cursorvis)
   ;	
	push	si
	lea	ax,word ptr [bp-154]
	push	ax
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr USL_XORICursor
	add	sp,8
@19@1514:
   ;	
   ;			USL_XORICursor(x,y,s,cursor);
   ;	
	cmp	word ptr [bp-8],0
	jne	short @19@1562
   ;	
   ;		if (!result)
   ;		{
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:_px,ax
   ;	
   ;			px = x;
   ;	
	mov	ax,word ptr [bp+6]
	mov	word ptr DGROUP:_py,ax
   ;	
   ;			py = y;
   ;	
	push	ss
	lea	ax,word ptr [bp-282]
	push	ax
	call	word ptr DGROUP:_USL_DrawString
	pop	cx
	pop	cx
@19@1562:
   ;	
   ;			USL_DrawString(olds);
   ;		}
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		VW_UpdateScreen();
   ;	
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;		IN_ClearKeysDown();
   ;	
	mov	ax,word ptr [bp-8]
	jmp	short @19@1586
@19@1586:
   ;	
   ;		return(result);
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_US_LineInput	endp
@19@C4832	label	word
	db	1
	db	0
	db	14
	db	0
	db	28
	db	0
	db	71
	db	0
	db	72
	db	0
	db	73
	db	0
	db	75
	db	0
	db	76
	db	0
	db	77
	db	0
	db	79
	db	0
	db	80
	db	0
	db	81
	db	0
	db	82
	db	0
	db	83
	db	0
	dw	@19@626
	dw	@19@698
	dw	@19@602
	dw	@19@554
	dw	@19@842
	dw	@19@842
	dw	@19@410
	dw	@19@842
	dw	@19@482
	dw	@19@578
	dw	@19@842
	dw	@19@842
	dw	@19@842
	dw	@19@770
_TEXT	ends
_BSS	segment word public 'BSS'
_NoWait	label	word
	db	2 dup (?)
_abortprogram	label	word
	db	2 dup (?)
US_Started	label	word
	db	2 dup (?)
_Games	label	word
	db	246 dup (?)
_Button0	label	word
	db	2 dup (?)
_Button1	label	word
	db	2 dup (?)
_CursorBad	label	word
	db	2 dup (?)
_CursorX	label	word
	db	2 dup (?)
_CursorY	label	word
	db	2 dup (?)
_WindowX	label	word
	db	2 dup (?)
_WindowY	label	word
	db	2 dup (?)
_WindowW	label	word
	db	2 dup (?)
_WindowH	label	word
	db	2 dup (?)
_PrintX	label	word
	db	2 dup (?)
_PrintY	label	word
	db	2 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'TEDLEVEL'
	db	0
	db	'NOWAIT'
	db	0
	db	'COMP'
	db	0
	db	'NOCOMP'
	db	0
	db	'Device Error'
	db	0
	db	'Drive ~ is Write Protected'
	db	0
	db	'Error on Drive ~'
	db	0
	db	'(R)etry or (A)bort?'
	db	0
	db	'Terminal Error: %s'
	db	10
	db	0
	db	'You launched from TED. I suggest that you reboot...'
	db	10
	db	0
	db	'US_CPrintLine() - String exceeds width'
	db	0
	db	-128
	db	0
	db	-128
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	public	_Scores
_ParmStrings2	equ	ParmStrings2
	extrn	_tedlevelnum:word
	extrn	_VW_MeasurePropString:near
	public	_PrintY
	public	_PrintX
_ParmStrings	equ	ParmStrings
	extrn	_VWB_DrawPropString:near
	public	_US_SetPrintRoutines
	extrn	_backcolor:byte
	public	_USL_MeasureString
	extrn	_TimeCount:word
	public	_WindowH
	public	_WindowW
	public	_WindowY
	public	_WindowX
	public	_US_RestoreWindow
	public	_USL_PrintInCenter
	extrn	_harderr:near
	extrn	_tedlevel:word
	public	_CursorY
	public	_CursorX
	public	_US_CenterWindow
	public	_CursorBad
	public	_US_PrintUnsigned
	public	_US_PrintCentered
	public	_Button1
	public	_Button0
	extrn	_LastScan:byte
_USL_XORICursor	equ	USL_XORICursor
	public	_US_ClearWindow
	public	_USL_DrawString
	extrn	_compatability:word
	extrn	_VW_UpdateScreen:near
	public	_USL_HardError
	public	_US_SaveWindow
	public	_US_DrawWindow
	public	_US_CPrintLine
	extrn	_IN_ClearKeysDown:near
	public	_US_LineInput
	public	_US_PrintSigned
	public	_US_CheckParm
	extrn	__argv:word
	extrn	__argc:word
	extrn	_LastASCII:byte
	public	_US_Shutdown
	extrn	_fprintf:near
	extrn	_VWB_DrawTile8:near
	public	_Games
	extrn	_Quit:near
	public	_US_Startup
	extrn	_strcpy:near
	extrn	_py:word
	extrn	_US_InitRndT:near
	extrn	_ultoa:near
	extrn	_fontcolor:byte
	extrn	_ShutdownId:near
	extrn	_strlen:near
	public	_US_CPrint
_US_Started	equ	US_Started
	extrn	_ltoa:near
	extrn	_atol:near
	extrn	__streams:word
	public	_US_Print
	extrn	N_SPUSH@:far
	extrn	_px:word
	public	_abortprogram
	extrn	__ctype:byte
	extrn	_tolower:near
	extrn	_IN_WaitForASCII:near
	extrn	_VWB_Bar:near
	public	_NoWait
	end
