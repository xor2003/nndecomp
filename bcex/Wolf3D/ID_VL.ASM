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
	?debug	S "c:\id_vl.c"
	?debug	C E9E551FE7C0A633A5C69645F766C2E63
	?debug	C E95337528110443A5C494E434C5544455C646F732E68
	?debug	C E95337528112443A5C494E434C5544455C616C6C6F632E68
	?debug	C E95337528110443A5C494E434C5544455C6D656D2E68
	?debug	C E95337528113443A5C494E434C5544455C737472696E672E68
	?debug	C E9E551FE7C0949445F484541442E48
	?debug	C E9E551FE7C0956455253494F4E2E48
	?debug	C E9E551FE7C0749445F564C2E48
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
_screenseg	label	word
	db	0
	db	160
ParmStrings	label	word
	dw	DGROUP:s@
	dw	DGROUP:s@+11
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void	VL_Startup (void)
   ;	
	assume	cs:_TEXT
_VL_Startup	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		int i,videocard;
   ;	
   ;		asm	cld;
   ;	
		cld	
   ;	
   ;	
   ;		videocard = VL_VideoID ();
   ;	
	call	near ptr _VL_VideoID
	mov	di,ax
   ;	
   ;		for (i = 1;i < _argc;i++)
   ;	
	mov	si,1
	jmp	short @1@146
@1@74:
   ;	
   ;			if (US_CheckParm(_argv[i],ParmStrings) == 0)
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
	jne	short @1@122
   ;	
   ;			{
   ;				videocard = 5;
   ;	
	mov	di,5
   ;	
   ;				break;
   ;	
	jmp	short @1@170
@1@122:
	inc	si
@1@146:
	cmp	si,word ptr DGROUP:__argc
	jl	short @1@74
@1@170:
   ;	
   ;			}
   ;	
   ;		if (videocard != 5)
   ;	
	cmp	di,5
	je	short @1@218
   ;	
   ;	Quit ("Improper video card!  If you really have a VGA card that I am not \n"
   ;	
   ;	
   ;		  "detecting, use the -HIDDENCARD command line parameter!");
   ;	
	mov	ax,offset DGROUP:s@+12
	push	ax
	call	near ptr _Quit
	pop	cx
@1@218:
   ;	
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_VL_Startup	endp
   ;	
   ;	void	VL_Shutdown (void)
   ;	
	assume	cs:_TEXT
_VL_Shutdown	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		VL_SetTextMode ();
   ;	
	call	near ptr _VL_SetTextMode
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_VL_Shutdown	endp
   ;	
   ;	void	VL_SetVGAPlaneMode (void)
   ;	
	assume	cs:_TEXT
_VL_SetVGAPlaneMode	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	asm	mov	ax,0x13
   ;	
		mov		ax,013H
   ;	
   ;	asm	int	0x10
   ;	
		int		010H
   ;	
   ;		VL_DePlaneVGA ();
   ;	
	call	near ptr _VL_DePlaneVGA
   ;	
   ;		VGAMAPMASK(15);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,15
	out	 dx,ax
	sti	
   ;	
   ;		VL_SetLineWidth (40);
   ;	
	mov	ax,40
	push	ax
	call	near ptr _VL_SetLineWidth
	pop	cx
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_VL_SetVGAPlaneMode	endp
   ;	
   ;	void	VL_SetTextMode (void)
   ;	
	assume	cs:_TEXT
_VL_SetTextMode	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	asm	mov	ax,3
   ;	
		mov		ax,3
   ;	
   ;	asm	int	0x10
   ;	
		int		010H
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_VL_SetTextMode	endp
   ;	
   ;	void VL_ClearVideo (byte color)
   ;	
	assume	cs:_TEXT
_VL_ClearVideo	proc	near
	push	bp
	mov	bp,sp
	push	di
   ;	
   ;	{
   ;	asm	mov	dx,GC_INDEX
   ;	
		mov		dx,03CEH
   ;	
   ;	asm	mov	al,GC_MODE
   ;	
		mov		al,5
   ;	
   ;	asm	out	dx,al
   ;	
		out		dx,al
   ;	
   ;	asm	inc	dx
   ;	
		inc		dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	and	al,0xfc				// write mode 0 to store directly to video
   ;	
		and		al,0fcH				
   ;	
   ;	asm	out	dx,al
   ;	
		out		dx,al
   ;	
   ;	
   ;	asm	mov	dx,SC_INDEX
   ;	
		mov		dx,03C4H
   ;	
   ;	asm	mov	ax,SC_MAPMASK+15*256
   ;	
		mov		ax,2+15*256
   ;	
   ;	asm	out	dx,ax				// write through all four planes
   ;	
		out		dx,ax				
   ;	
   ;	
   ;	asm	mov	ax,SCREENSEG
   ;	
		mov		ax,0a000H
   ;	
   ;	asm	mov	es,ax
   ;	
		mov		es,ax
   ;	
   ;	asm	mov	al,[color]
   ;	
		mov		al,[[bp+4]]
   ;	
   ;	asm	mov	ah,al
   ;	
		mov		ah,al
   ;	
   ;	asm	mov	cx,0x8000			// 0x8000 words, clearing 8 video bytes/word
   ;	
		mov		cx,08000H			
   ;	
   ;	asm	xor	di,di
   ;	
		xor		di,di
   ;	
   ;	asm	rep	stosw
   ;	
		rep	stosw	
   ;	
   ;	}
   ;	
	pop	di
	pop	bp
	ret	
_VL_ClearVideo	endp
   ;	
   ;	void VL_DePlaneVGA (void)
   ;	
	assume	cs:_TEXT
_VL_DePlaneVGA	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	
   ;	//
   ;	// change CPU addressing to non linear mode
   ;	//
   ;	
   ;	//
   ;	// turn off chain 4 and odd/even
   ;	//
   ;		outportb (SC_INDEX,SC_MEMMODE);
   ;	
	mov	dx,964
	mov	al,4
	out	dx,al
   ;	
   ;		outportb (SC_INDEX+1,(inportb(SC_INDEX+1)&~8)|4);
   ;	
	mov	dx,965
	in	al,dx
	and	al,247
	or	al,4
	mov	dx,965
	out	dx,al
   ;	
   ;	
   ;		outportb (SC_INDEX,SC_MAPMASK);		// leave this set throughought
   ;	
	mov	dx,964
	mov	al,2
	out	dx,al
   ;	
   ;	
   ;	//
   ;	// turn off odd/even and set write mode 0
   ;	//
   ;		outportb (GC_INDEX,GC_MODE);
   ;	
	mov	dx,974
	mov	al,5
	out	dx,al
   ;	
   ;		outportb (GC_INDEX+1,inportb(GC_INDEX+1)&~0x13);
   ;	
	mov	dx,975
	in	al,dx
	and	al,236
	mov	dx,975
	out	dx,al
   ;	
   ;	
   ;	//
   ;	// turn off chain
   ;	//
   ;		outportb (GC_INDEX,GC_MISCELLANEOUS);
   ;	
	mov	dx,974
	mov	al,6
	out	dx,al
   ;	
   ;		outportb (GC_INDEX+1,inportb(GC_INDEX+1)&~2);
   ;	
	mov	dx,975
	in	al,dx
	and	al,253
	mov	dx,975
	out	dx,al
   ;	
   ;	
   ;	//
   ;	// clear the entire buffer space, because int 10h only did 16 k / plane
   ;	//
   ;		VL_ClearVideo (0);
   ;	
	mov	al,0
	push	ax
	call	near ptr _VL_ClearVideo
	pop	cx
   ;	
   ;	
   ;	//
   ;	// change CRTC scanning from doubleword to byte mode, allowing >64k scans
   ;	//
   ;		outportb (CRTC_INDEX,CRTC_UNDERLINE);
   ;	
	mov	dx,980
	mov	al,20
	out	dx,al
   ;	
   ;		outportb (CRTC_INDEX+1,inportb(CRTC_INDEX+1)&~0x40);
   ;	
	mov	dx,981
	in	al,dx
	and	al,191
	mov	dx,981
	out	dx,al
   ;	
   ;	
   ;		outportb (CRTC_INDEX,CRTC_MODE);
   ;	
	mov	dx,980
	mov	al,23
	out	dx,al
   ;	
   ;		outportb (CRTC_INDEX+1,inportb(CRTC_INDEX+1)|0x40);
   ;	
	mov	dx,981
	in	al,dx
	or	al,64
	mov	dx,981
	out	dx,al
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_VL_DePlaneVGA	endp
   ;	
   ;	void VL_SetLineWidth (unsigned width)
   ;	
	assume	cs:_TEXT
_VL_SetLineWidth	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		int i,offset;
   ;	
   ;	//
   ;	// set wide virtual screen
   ;	//
   ;		outport (CRTC_INDEX,CRTC_OFFSET+width*256);
   ;	
	mov	ax,word ptr [bp+4]
	mov	cl,8
	shl	ax,cl
	add	ax,19
	push	ax
	mov	ax,980
	push	ax
	call	near ptr _outport
	pop	cx
	pop	cx
   ;	
   ;	
   ;	//
   ;	// set up lookup tables
   ;	//
   ;		linewidth = width*2;
   ;	
	mov	ax,word ptr [bp+4]
	shl	ax,1
	mov	word ptr DGROUP:_linewidth,ax
   ;	
   ;	
   ;		offset = 0;
   ;	
	xor	di,di
   ;	
   ;	
   ;		for (i=0;i<MAXSCANLINES;i++)
   ;	
	xor	si,si
	jmp	short @7@98
@7@50:
   ;	
   ;		{
   ;			ylookup[i]=offset;
   ;	
	mov	bx,si
	shl	bx,1
	mov	word ptr DGROUP:_ylookup[bx],di
   ;	
   ;			offset += linewidth;
   ;	
	mov	ax,di
	add	ax,word ptr DGROUP:_linewidth
	mov	di,ax
	inc	si
@7@98:
	cmp	si,200
	jl	short @7@50
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_VL_SetLineWidth	endp
   ;	
   ;	void VL_SetSplitScreen (int linenum)
   ;	
	assume	cs:_TEXT
_VL_SetSplitScreen	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		VL_WaitVBL (1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _VL_WaitVBL
	pop	cx
   ;	
   ;		linenum=linenum*2-1;
   ;	
	mov	ax,si
	shl	ax,1
	dec	ax
	mov	si,ax
   ;	
   ;		outportb (CRTC_INDEX,CRTC_LINECOMPARE);
   ;	
	mov	dx,980
	mov	al,24
	out	dx,al
   ;	
   ;		outportb (CRTC_INDEX+1,linenum % 256);
   ;	
	mov	ax,si
	mov	bx,256
	cwd	
	idiv	bx
	push	dx
	mov	dx,981
	pop	ax
	out	dx,al
   ;	
   ;		outportb (CRTC_INDEX,CRTC_OVERFLOW);
   ;	
	mov	dx,980
	mov	al,7
	out	dx,al
   ;	
   ;		outportb (CRTC_INDEX+1, 1+16*(linenum/256));
   ;	
	mov	ax,si
	mov	bx,256
	cwd	
	idiv	bx
	mov	cl,4
	shl	al,cl
	inc	al
	mov	dx,981
	out	dx,al
   ;	
   ;		outportb (CRTC_INDEX,CRTC_MAXSCANLINE);
   ;	
	mov	dx,980
	mov	al,9
	out	dx,al
   ;	
   ;		outportb (CRTC_INDEX+1,inportb(CRTC_INDEX+1) & (255-64));
   ;	
	mov	dx,981
	in	al,dx
	and	al,191
	mov	dx,981
	out	dx,al
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_VL_SetSplitScreen	endp
   ;	
   ;	void VL_FillPalette (int red, int green, int blue)
   ;	
	assume	cs:_TEXT
_VL_FillPalette	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int	i;
   ;	
   ;		outportb (PEL_WRITE_ADR,0);
   ;	
	mov	dx,968
	mov	al,0
	out	dx,al
   ;	
   ;		for (i=0;i<256;i++)
   ;	
	xor	si,si
	jmp	short @9@98
@9@50:
   ;	
   ;		{
   ;			outportb (PEL_DATA,red);
   ;	
	mov	dx,969
	mov	al,byte ptr [bp+4]
	out	dx,al
   ;	
   ;			outportb (PEL_DATA,green);
   ;	
	mov	dx,969
	mov	al,byte ptr [bp+6]
	out	dx,al
   ;	
   ;			outportb (PEL_DATA,blue);
   ;	
	mov	dx,969
	mov	al,byte ptr [bp+8]
	out	dx,al
	inc	si
@9@98:
	cmp	si,256
	jl	short @9@50
   ;	
   ;		}
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_VL_FillPalette	endp
   ;	
   ;	void VL_SetColor	(int color, int red, int green, int blue)
   ;	
	assume	cs:_TEXT
_VL_SetColor	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		outportb (PEL_WRITE_ADR,color);
   ;	
	mov	dx,968
	mov	al,byte ptr [bp+4]
	out	dx,al
   ;	
   ;		outportb (PEL_DATA,red);
   ;	
	mov	dx,969
	mov	al,byte ptr [bp+6]
	out	dx,al
   ;	
   ;		outportb (PEL_DATA,green);
   ;	
	mov	dx,969
	mov	al,byte ptr [bp+8]
	out	dx,al
   ;	
   ;		outportb (PEL_DATA,blue);
   ;	
	mov	dx,969
	mov	al,byte ptr [bp+10]
	out	dx,al
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_VL_SetColor	endp
   ;	
   ;	void VL_GetColor	(int color, int *red, int *green, int *blue)
   ;	
	assume	cs:_TEXT
_VL_GetColor	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		outportb (PEL_READ_ADR,color);
   ;	
	mov	dx,967
	mov	al,byte ptr [bp+4]
	out	dx,al
   ;	
   ;		*red = inportb (PEL_DATA);
   ;	
	mov	dx,969
	in	al,dx
	mov	ah,0
	mov	bx,word ptr [bp+6]
	mov	word ptr [bx],ax
   ;	
   ;		*green = inportb (PEL_DATA);
   ;	
	mov	dx,969
	in	al,dx
	mov	ah,0
	mov	bx,word ptr [bp+8]
	mov	word ptr [bx],ax
   ;	
   ;		*blue = inportb (PEL_DATA);
   ;	
	mov	dx,969
	in	al,dx
	mov	ah,0
	mov	bx,word ptr [bp+10]
	mov	word ptr [bx],ax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_VL_GetColor	endp
   ;	
   ;	void VL_SetPalette (byte far *palette)
   ;	
	assume	cs:_TEXT
_VL_SetPalette	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int	i;
   ;	
   ;	//	outportb (PEL_WRITE_ADR,0);
   ;	//	for (i=0;i<768;i++)
   ;	//		outportb(PEL_DATA,*palette++);
   ;	
   ;		asm	mov	dx,PEL_WRITE_ADR
   ;	
		mov		dx,03c8H
   ;	
   ;		asm	mov	al,0
   ;	
		mov		al,0
   ;	
   ;		asm	out	dx,al
   ;	
		out		dx,al
   ;	
   ;		asm	mov	dx,PEL_DATA
   ;	
		mov		dx,03c9H
   ;	
   ;		asm	lds	si,[palette]
   ;	
		lds		si,[[bp+4]]
   ;	
   ;	
   ;		asm	test	[ss:fastpalette],1
   ;	
		test		[ss:DGROUP:_fastpalette],1
   ;	
   ;		asm	jz	slowset
   ;	
	je	short @12@266
   ;	
   ;	//
   ;	// set palette fast for cards that can take it
   ;	//
   ;		asm	mov	cx,768
   ;	
		mov		cx,768
   ;	
   ;		asm	rep outsb
   ;	
		rep outsb	
   ;	
   ;		asm	jmp	done
   ;	
	jmp	short @12@458
@12@266:
   ;	
   ;	
   ;	//
   ;	// set palette slowly for some video cards
   ;	//
   ;	slowset:
   ;		asm	mov	cx,256
   ;	
		mov		cx,256
@12@290:
   ;	
   ;	setloop:
   ;		asm	lodsb
   ;	
		lodsb	
   ;	
   ;		asm	out	dx,al
   ;	
		out		dx,al
   ;	
   ;		asm	lodsb
   ;	
		lodsb	
   ;	
   ;		asm	out	dx,al
   ;	
		out		dx,al
   ;	
   ;		asm	lodsb
   ;	
		lodsb	
   ;	
   ;		asm	out	dx,al
   ;	
		out		dx,al
   ;	
   ;		asm	loop	setloop
   ;	
	loop	short @12@290
@12@458:
   ;	
   ;	
   ;	done:
   ;		asm	mov	ax,ss
   ;	
		mov		ax,ss
   ;	
   ;		asm	mov	ds,ax
   ;	
		mov		ds,ax
   ;	
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_VL_SetPalette	endp
   ;	
   ;	void VL_GetPalette (byte far *palette)
   ;	
	assume	cs:_TEXT
_VL_GetPalette	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int	i;
   ;	
   ;		outportb (PEL_READ_ADR,0);
   ;	
	mov	dx,967
	mov	al,0
	out	dx,al
   ;	
   ;		for (i=0;i<768;i++)
   ;	
	xor	si,si
	jmp	short @13@98
@13@50:
   ;	
   ;			*palette++ = inportb(PEL_DATA);
   ;	
	mov	dx,969
	in	al,dx
	les	bx,dword ptr [bp+4]
	mov	byte ptr es:[bx],al
	inc	word ptr [bp+4]
	inc	si
@13@98:
	cmp	si,768
	jl	short @13@50
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_VL_GetPalette	endp
   ;	
   ;	void VL_FadeOut (int start, int end, int red, int green, int blue, int steps)
   ;	
	assume	cs:_TEXT
_VL_FadeOut	proc	near
	push	bp
	mov	bp,sp
	sub	sp,12
	push	si
	push	di
   ;	
   ;	{
   ;		int		i,j,orig,delta;
   ;		byte	far *origptr, far *newptr;
   ;	
   ;		VL_WaitVBL(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _VL_WaitVBL
	pop	cx
   ;	
   ;		VL_GetPalette (&palette1[0][0]);
   ;	
	mov	ax,seg _palette1
	push	ax
	mov	ax,offset _palette1
	push	ax
	call	near ptr _VL_GetPalette
	pop	cx
	pop	cx
   ;	
   ;		_fmemcpy (palette2,palette1,768);
   ;	
	mov	ax,768
	push	ax
	mov	ax,seg _palette1
	push	ax
	mov	ax,offset _palette1
	push	ax
	mov	ax,seg _palette2
	push	ax
	mov	ax,offset _palette2
	push	ax
	call	near ptr __fmemcpy
	add	sp,10
   ;	
   ;	
   ;	//
   ;	// fade through intermediate frames
   ;	//
   ;		for (i=0;i<steps;i++)
   ;	
	xor	si,si
	jmp	@14@194
@14@50:
   ;	
   ;		{
   ;			origptr = &palette1[start][0];
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,3
	imul	dx
	add	ax,offset _palette1
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],seg _palette1
   ;	
   ;			newptr = &palette2[start][0];
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,3
	imul	dx
	add	ax,offset _palette2
	mov	word ptr [bp-12],ax
	mov	word ptr [bp-10],seg _palette2
   ;	
   ;			for (j=start;j<=end;j++)
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr [bp-2],ax
	jmp	@14@122
@14@74:
   ;	
   ;			{
   ;				orig = *origptr++;
   ;	
	les	bx,dword ptr [bp-8]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	mov	word ptr [bp-4],ax
	inc	word ptr [bp-8]
   ;	
   ;				delta = red-orig;
   ;	
	mov	ax,word ptr [bp+8]
	sub	ax,word ptr [bp-4]
	mov	di,ax
   ;	
   ;				*newptr++ = orig + delta * i / steps;
   ;	
	mov	ax,di
	imul	si
	cwd	
	idiv	word ptr [bp+14]
	mov	dl,byte ptr [bp-4]
	add	dl,al
	les	bx,dword ptr [bp-12]
	mov	byte ptr es:[bx],dl
	inc	word ptr [bp-12]
   ;	
   ;				orig = *origptr++;
   ;	
	les	bx,dword ptr [bp-8]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	mov	word ptr [bp-4],ax
	inc	word ptr [bp-8]
   ;	
   ;				delta = green-orig;
   ;	
	mov	ax,word ptr [bp+10]
	sub	ax,word ptr [bp-4]
	mov	di,ax
   ;	
   ;				*newptr++ = orig + delta * i / steps;
   ;	
	mov	ax,di
	imul	si
	cwd	
	idiv	word ptr [bp+14]
	mov	dl,byte ptr [bp-4]
	add	dl,al
	les	bx,dword ptr [bp-12]
	mov	byte ptr es:[bx],dl
	inc	word ptr [bp-12]
   ;	
   ;				orig = *origptr++;
   ;	
	les	bx,dword ptr [bp-8]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	mov	word ptr [bp-4],ax
	inc	word ptr [bp-8]
   ;	
   ;				delta = blue-orig;
   ;	
	mov	ax,word ptr [bp+12]
	sub	ax,word ptr [bp-4]
	mov	di,ax
   ;	
   ;				*newptr++ = orig + delta * i / steps;
   ;	
	mov	ax,di
	imul	si
	cwd	
	idiv	word ptr [bp+14]
	mov	dl,byte ptr [bp-4]
	add	dl,al
	les	bx,dword ptr [bp-12]
	mov	byte ptr es:[bx],dl
	inc	word ptr [bp-12]
	inc	word ptr [bp-2]
@14@122:
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp+6]
	jg	@@0
	jmp	@14@74
@@0:
   ;	
   ;			}
   ;	
   ;			VL_WaitVBL(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _VL_WaitVBL
	pop	cx
   ;	
   ;			VL_SetPalette (&palette2[0][0]);
   ;	
	mov	ax,seg _palette2
	push	ax
	mov	ax,offset _palette2
	push	ax
	call	near ptr _VL_SetPalette
	pop	cx
	pop	cx
	inc	si
@14@194:
	cmp	si,word ptr [bp+14]
	jge	@@1
	jmp	@14@50
@@1:
   ;	
   ;		}
   ;	
   ;	//
   ;	// final color
   ;	//
   ;		VL_FillPalette (red,green,blue);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	call	near ptr _VL_FillPalette
	add	sp,6
   ;	
   ;	
   ;		screenfaded = true;
   ;	
	mov	word ptr DGROUP:_screenfaded,1
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_VL_FadeOut	endp
   ;	
   ;	void VL_FadeIn (int start, int end, byte far *palette, int steps)
   ;	
	assume	cs:_TEXT
_VL_FadeIn	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
   ;	
   ;	{
   ;		int		i,j,delta;
   ;	
   ;		VL_WaitVBL(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _VL_WaitVBL
	pop	cx
   ;	
   ;		VL_GetPalette (&palette1[0][0]);
   ;	
	mov	ax,seg _palette1
	push	ax
	mov	ax,offset _palette1
	push	ax
	call	near ptr _VL_GetPalette
	pop	cx
	pop	cx
   ;	
   ;		_fmemcpy (&palette2[0][0],&palette1[0][0],sizeof(palette1));
   ;	
	mov	ax,768
	push	ax
	mov	ax,seg _palette1
	push	ax
	mov	ax,offset _palette1
	push	ax
	mov	ax,seg _palette2
	push	ax
	mov	ax,offset _palette2
	push	ax
	call	near ptr __fmemcpy
	add	sp,10
   ;	
   ;	
   ;		start *= 3;
   ;	
	mov	dx,3
	mov	ax,word ptr [bp+4]
	imul	dx
	mov	word ptr [bp+4],ax
   ;	
   ;		end = end*3+2;
   ;	
	mov	ax,word ptr [bp+6]
	mov	dx,3
	imul	dx
	inc	ax
	inc	ax
	mov	word ptr [bp+6],ax
   ;	
   ;	
   ;	//
   ;	// fade through intermediate frames
   ;	//
   ;		for (i=0;i<steps;i++)
   ;	
	xor	di,di
	jmp	short @15@194
@15@50:
   ;	
   ;		{
   ;			for (j=start;j<=end;j++)
   ;	
	mov	si,word ptr [bp+4]
	jmp	short @15@122
@15@74:
   ;	
   ;			{
   ;				delta = palette[j]-palette1[0][j];
   ;	
	les	bx,dword ptr [bp+8]
	mov	al,byte ptr es:[bx+si]
	mov	ah,0
	mov	dx,seg _palette1
	mov	es,dx
	mov	dl,byte ptr es:_palette1[si]
	mov	dh,0
	sub	ax,dx
	mov	word ptr [bp-2],ax
   ;	
   ;				palette2[0][j] = palette1[0][j] + delta * i / steps;
   ;	
	mov	ax,seg _palette1
	mov	es,ax
	mov	al,byte ptr es:_palette1[si]
	push	ax
	mov	ax,word ptr [bp-2]
	imul	di
	cwd	
	idiv	word ptr [bp+12]
	pop	dx
	add	dl,al
	mov	ax,seg _palette2
	mov	es,ax
	mov	byte ptr es:_palette2[si],dl
	inc	si
@15@122:
	cmp	si,word ptr [bp+6]
	jle	short @15@74
   ;	
   ;			}
   ;	
   ;			VL_WaitVBL(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _VL_WaitVBL
	pop	cx
   ;	
   ;			VL_SetPalette (&palette2[0][0]);
   ;	
	mov	ax,seg _palette2
	push	ax
	mov	ax,offset _palette2
	push	ax
	call	near ptr _VL_SetPalette
	pop	cx
	pop	cx
	inc	di
@15@194:
	cmp	di,word ptr [bp+12]
	jl	short @15@50
   ;	
   ;		}
   ;	
   ;	//
   ;	// final color
   ;	//
   ;		VL_SetPalette (palette);
   ;	
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	call	near ptr _VL_SetPalette
	pop	cx
	pop	cx
   ;	
   ;		screenfaded = false;
   ;	
	mov	word ptr DGROUP:_screenfaded,0
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_VL_FadeIn	endp
   ;	
   ;	void VL_TestPaletteSet (void)
   ;	
	assume	cs:_TEXT
_VL_TestPaletteSet	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
   ;	
   ;	{
   ;		int	i;
   ;	
   ;		for (i=0;i<768;i++)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @16@98
@16@50:
   ;	
   ;			palette1[0][i] = i;
   ;	
	mov	ax,seg _palette1
	mov	bx,word ptr [bp-2]
	mov	dl,byte ptr [bp-2]
	mov	es,ax
	mov	byte ptr es:_palette1[bx],dl
	inc	word ptr [bp-2]
@16@98:
	cmp	word ptr [bp-2],768
	jl	short @16@50
   ;	
   ;	
   ;		fastpalette = true;
   ;	
	mov	word ptr DGROUP:_fastpalette,1
   ;	
   ;		VL_SetPalette (&palette1[0][0]);
   ;	
	mov	ax,seg _palette1
	push	ax
	mov	ax,offset _palette1
	push	ax
	call	near ptr _VL_SetPalette
	pop	cx
	pop	cx
   ;	
   ;		VL_GetPalette (&palette2[0][0]);
   ;	
	mov	ax,seg _palette2
	push	ax
	mov	ax,offset _palette2
	push	ax
	call	near ptr _VL_GetPalette
	pop	cx
	pop	cx
   ;	
   ;		if (_fmemcmp (&palette1[0][0],&palette2[0][0],768))
   ;	
	mov	ax,768
	push	ax
	mov	ax,seg _palette2
	push	ax
	mov	ax,offset _palette2
	push	ax
	mov	ax,seg _palette1
	push	ax
	mov	ax,offset _palette1
	push	ax
	call	near ptr __fmemcmp
	add	sp,10
	or	ax,ax
	je	short @16@170
   ;	
   ;			fastpalette = false;
   ;	
	mov	word ptr DGROUP:_fastpalette,0
@16@170:
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_VL_TestPaletteSet	endp
   ;	
   ;	void VL_ColorBorder (int color)
   ;	
	assume	cs:_TEXT
_VL_ColorBorder	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		_AH=0x10;
   ;	
	mov	ah,16
   ;	
   ;		_AL=1;
   ;	
	mov	al,1
   ;	
   ;		_BH=color;
   ;	
	mov	bh,byte ptr [bp+4]
   ;	
   ;		geninterrupt (0x10);
   ;	
	int	16
   ;	
   ;		bordercolor = color;
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:_bordercolor,ax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_VL_ColorBorder	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_pixmasks	label	byte
	db	1
	db	2
	db	4
	db	8
_leftmasks	label	byte
	db	15
	db	14
	db	12
	db	8
_rightmasks	label	byte
	db	1
	db	3
	db	7
	db	15
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void VL_Plot (int x, int y, int color)
   ;	
	assume	cs:_TEXT
_VL_Plot	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
   ;	
   ;	{
   ;		byte mask;
   ;	
   ;		mask = pixmasks[x&3];
   ;	
	mov	bx,word ptr [bp+4]
	and	bx,3
	mov	al,byte ptr DGROUP:_pixmasks[bx]
	mov	byte ptr [bp-1],al
   ;	
   ;		VGAMAPMASK(mask);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,[bp-1]
	out	 dx,ax
	sti	
   ;	
   ;		*(byte far *)MK_FP(SCREENSEG,bufferofs+(ylookup[y]+(x>>2))) = color;
   ;	
	mov	bx,word ptr [bp+6]
	shl	bx,1
	mov	bx,word ptr DGROUP:_ylookup[bx]
	mov	ax,word ptr [bp+4]
	sar	ax,1
	sar	ax,1
	add	bx,ax
	add	bx,word ptr DGROUP:_bufferofs
	mov	ax,40960
	mov	dl,byte ptr [bp+8]
	mov	es,ax
	mov	byte ptr es:[bx],dl
   ;	
   ;		VGAMAPMASK(15);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,15
	out	 dx,ax
	sti	
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_VL_Plot	endp
   ;	
   ;	void VL_Hlin (unsigned x, unsigned y, unsigned width, unsigned color)
   ;	
	assume	cs:_TEXT
_VL_Hlin	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
	push	di
   ;	
   ;	{
   ;		unsigned		xbyte;
   ;		byte			far *dest;
   ;		byte			leftmask,rightmask;
   ;		int				midbytes;
   ;	
   ;		xbyte = x>>2;
   ;	
	mov	ax,word ptr [bp+4]
	shr	ax,1
	shr	ax,1
	mov	di,ax
   ;	
   ;		leftmask = leftmasks[x&3];
   ;	
	mov	bx,word ptr [bp+4]
	and	bx,3
	mov	al,byte ptr DGROUP:_leftmasks[bx]
	mov	byte ptr [bp-5],al
   ;	
   ;		rightmask = rightmasks[(x+width-1)&3];
   ;	
	mov	bx,word ptr [bp+4]
	add	bx,word ptr [bp+8]
	dec	bx
	and	bx,3
	mov	al,byte ptr DGROUP:_rightmasks[bx]
	mov	byte ptr [bp-6],al
   ;	
   ;		midbytes = ((x+width+3)>>2) - xbyte - 2;
   ;	
	mov	ax,word ptr [bp+4]
	add	ax,word ptr [bp+8]
	add	ax,3
	shr	ax,1
	shr	ax,1
	sub	ax,di
	dec	ax
	dec	ax
	mov	si,ax
   ;	
   ;	
   ;		dest = MK_FP(SCREENSEG,bufferofs+ylookup[y]+xbyte);
   ;	
	mov	bx,word ptr [bp+6]
	shl	bx,1
	mov	ax,word ptr DGROUP:_bufferofs
	add	ax,word ptr DGROUP:_ylookup[bx]
	add	ax,di
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],40960
   ;	
   ;	
   ;		if (midbytes<0)
   ;	
	or	si,si
	jge	short @19@386
   ;	
   ;		{
   ;		// all in one byte
   ;			VGAMAPMASK(leftmask&rightmask);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,[bp-5]&[bp-6]
	out	 dx,ax
	sti	
   ;	
   ;			*dest = color;
   ;	
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr [bp+10]
	mov	byte ptr es:[bx],al
   ;	
   ;			VGAMAPMASK(15);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,15
	out	 dx,ax
	sti	
   ;	
   ;			return;
   ;	
	jmp	@19@1034
@19@386:
   ;	
   ;		}
   ;	
   ;		VGAMAPMASK(leftmask);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,[bp-5]
	out	 dx,ax
	sti	
   ;	
   ;		*dest++ = color;
   ;	
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr [bp+10]
	mov	byte ptr es:[bx],al
	inc	word ptr [bp-4]
   ;	
   ;	
   ;		VGAMAPMASK(15);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,15
	out	 dx,ax
	sti	
   ;	
   ;		_fmemset (dest,color,midbytes);
   ;	
	push	si
	push	word ptr [bp+10]
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr __fmemset
	add	sp,8
   ;	
   ;		dest+=midbytes;
   ;	
	add	word ptr [bp-4],si
   ;	
   ;	
   ;		VGAMAPMASK(rightmask);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,[bp-6]
	out	 dx,ax
	sti	
   ;	
   ;		*dest = color;
   ;	
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr [bp+10]
	mov	byte ptr es:[bx],al
   ;	
   ;	
   ;		VGAMAPMASK(15);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,15
	out	 dx,ax
	sti	
@19@1034:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_VL_Hlin	endp
   ;	
   ;	void VL_Vlin (int x, int y, int height, int color)
   ;	
	assume	cs:_TEXT
_VL_Vlin	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
   ;	
   ;	{
   ;		byte	far *dest,mask;
   ;	
   ;		mask = pixmasks[x&3];
   ;	
	mov	bx,word ptr [bp+4]
	and	bx,3
	mov	al,byte ptr DGROUP:_pixmasks[bx]
	mov	byte ptr [bp-5],al
   ;	
   ;		VGAMAPMASK(mask);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,[bp-5]
	out	 dx,ax
	sti	
   ;	
   ;	
   ;		dest = MK_FP(SCREENSEG,bufferofs+ylookup[y]+(x>>2));
   ;	
	mov	bx,word ptr [bp+6]
	shl	bx,1
	mov	ax,word ptr DGROUP:_bufferofs
	add	ax,word ptr DGROUP:_ylookup[bx]
	mov	dx,word ptr [bp+4]
	sar	dx,1
	sar	dx,1
	add	ax,dx
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],40960
	jmp	short @20@242
@20@218:
   ;	
   ;	
   ;		while (height--)
   ;		{
   ;			*dest = color;
   ;	
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr [bp+10]
	mov	byte ptr es:[bx],al
   ;	
   ;			dest += linewidth;
   ;	
	mov	ax,word ptr DGROUP:_linewidth
	add	word ptr [bp-4],ax
@20@242:
	mov	ax,word ptr [bp+8]
	dec	word ptr [bp+8]
	or	ax,ax
	jne	short @20@218
   ;	
   ;		}
   ;	
   ;		VGAMAPMASK(15);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,15
	out	 dx,ax
	sti	
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_VL_Vlin	endp
   ;	
   ;	void VL_Bar (int x, int y, int width, int height, int color)
   ;	
	assume	cs:_TEXT
_VL_Bar	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{
   ;		byte	far *dest;
   ;		byte	leftmask,rightmask;
   ;		int		midbytes,linedelta;
   ;	
   ;		leftmask = leftmasks[x&3];
   ;	
	mov	bx,di
	and	bx,3
	mov	al,byte ptr DGROUP:_leftmasks[bx]
	mov	byte ptr [bp-5],al
   ;	
   ;		rightmask = rightmasks[(x+width-1)&3];
   ;	
	mov	bx,di
	add	bx,word ptr [bp+8]
	dec	bx
	and	bx,3
	mov	al,byte ptr DGROUP:_rightmasks[bx]
	mov	byte ptr [bp-6],al
   ;	
   ;		midbytes = ((x+width+3)>>2) - (x>>2) - 2;
   ;	
	mov	ax,di
	add	ax,word ptr [bp+8]
	add	ax,3
	sar	ax,1
	sar	ax,1
	mov	dx,di
	sar	dx,1
	sar	dx,1
	sub	ax,dx
	add	ax,65534
	mov	si,ax
   ;	
   ;		linedelta = linewidth-(midbytes+1);
   ;	
	mov	ax,si
	inc	ax
	mov	dx,word ptr DGROUP:_linewidth
	sub	dx,ax
	mov	word ptr [bp-8],dx
   ;	
   ;	
   ;		dest = MK_FP(SCREENSEG,bufferofs+ylookup[y]+(x>>2));
   ;	
	mov	bx,word ptr [bp+6]
	shl	bx,1
	mov	ax,word ptr DGROUP:_bufferofs
	add	ax,word ptr DGROUP:_ylookup[bx]
	mov	dx,di
	sar	dx,1
	sar	dx,1
	add	ax,dx
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],40960
   ;	
   ;	
   ;		if (midbytes<0)
   ;	
	or	si,si
	jge	short @21@434
   ;	
   ;		{
   ;		// all in one byte
   ;			VGAMAPMASK(leftmask&rightmask);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,[bp-5]&[bp-6]
	out	 dx,ax
	sti	
	jmp	short @21@242
@21@218:
   ;	
   ;			while (height--)
   ;			{
   ;				*dest = color;
   ;	
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr [bp+12]
	mov	byte ptr es:[bx],al
   ;	
   ;				dest += linewidth;
   ;	
	mov	ax,word ptr DGROUP:_linewidth
	add	word ptr [bp-4],ax
@21@242:
	mov	ax,word ptr [bp+10]
	dec	word ptr [bp+10]
	or	ax,ax
	jne	short @21@218
   ;	
   ;			}
   ;			VGAMAPMASK(15);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,15
	out	 dx,ax
	sti	
   ;	
   ;			return;
   ;	
	jmp	@21@1130
@21@434:
	jmp	@21@962
@21@458:
   ;	
   ;		}
   ;	
   ;		while (height--)
   ;		{
   ;			VGAMAPMASK(leftmask);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,[bp-5]
	out	 dx,ax
	sti	
   ;	
   ;			*dest++ = color;
   ;	
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr [bp+12]
	mov	byte ptr es:[bx],al
	inc	word ptr [bp-4]
   ;	
   ;	
   ;			VGAMAPMASK(15);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,15
	out	 dx,ax
	sti	
   ;	
   ;			_fmemset (dest,color,midbytes);
   ;	
	push	si
	push	word ptr [bp+12]
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr __fmemset
	add	sp,8
   ;	
   ;			dest+=midbytes;
   ;	
	add	word ptr [bp-4],si
   ;	
   ;	
   ;			VGAMAPMASK(rightmask);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,[bp-6]
	out	 dx,ax
	sti	
   ;	
   ;			*dest = color;
   ;	
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr [bp+12]
	mov	byte ptr es:[bx],al
   ;	
   ;	
   ;			dest+=linedelta;
   ;	
	mov	ax,word ptr [bp-8]
	add	word ptr [bp-4],ax
@21@962:
	mov	ax,word ptr [bp+10]
	dec	word ptr [bp+10]
	or	ax,ax
	je	@@2
	jmp	@21@458
@@2:
   ;	
   ;		}
   ;	
   ;		VGAMAPMASK(15);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,15
	out	 dx,ax
	sti	
@21@1130:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_VL_Bar	endp
   ;	
   ;	void VL_MemToLatch (byte far *source, int width, int height, unsigned dest)
   ;	
	assume	cs:_TEXT
_VL_MemToLatch	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
   ;	
   ;	{
   ;		unsigned	count;
   ;		byte	plane,mask;
   ;	
   ;		count = ((width+3)/4)*height;
   ;	
	mov	ax,word ptr [bp+8]
	add	ax,3
	mov	bx,4
	cwd	
	idiv	bx
	imul	word ptr [bp+10]
	mov	word ptr [bp-2],ax
   ;	
   ;		mask = 1;
   ;	
	mov	byte ptr [bp-4],1
   ;	
   ;		for (plane = 0; plane<4 ; plane++)
   ;	
	mov	byte ptr [bp-3],0
	jmp	short @22@458
@22@50:
   ;	
   ;		{
   ;			VGAMAPMASK(mask);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,[bp-4]
	out	 dx,ax
	sti	
   ;	
   ;			mask <<= 1;
   ;	
	shl	byte ptr [bp-4],1
   ;	
   ;	
   ;	asm	mov	cx,count
   ;	
		mov		cx,[bp-2]
   ;	
   ;	asm mov ax,SCREENSEG
   ;	
 	mov	 ax,0a000H
   ;	
   ;	asm mov es,ax
   ;	
 	mov	 es,ax
   ;	
   ;	asm	mov	di,[dest]
   ;	
		mov		di,[[bp+12]]
   ;	
   ;	asm	lds	si,[source]
   ;	
		lds		si,[[bp+4]]
   ;	
   ;	asm	rep movsb
   ;	
		rep movsb	
   ;	
   ;	asm mov	ax,ss
   ;	
 	mov		ax,ss
   ;	
   ;	asm	mov	ds,ax
   ;	
		mov		ds,ax
   ;	
   ;	
   ;			source+= count;
   ;	
	mov	ax,word ptr [bp-2]
	add	word ptr [bp+4],ax
	inc	byte ptr [bp-3]
@22@458:
	cmp	byte ptr [bp-3],4
	jb	short @22@50
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_VL_MemToLatch	endp
   ;	
   ;	void VL_MemToScreen (byte far *source, int width, int height, int x, int y)
   ;	
	assume	cs:_TEXT
_VL_MemToScreen	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	push	si
	push	di
	mov	di,word ptr [bp+14]
   ;	
   ;	{
   ;		byte    far *screen,far *dest,mask;
   ;		int		plane;
   ;	
   ;		width>>=2;
   ;	
	sar	word ptr [bp+8],1
	sar	word ptr [bp+8],1
   ;	
   ;		dest = MK_FP(SCREENSEG,bufferofs+ylookup[y]+(x>>2) );
   ;	
	mov	bx,di
	shl	bx,1
	mov	ax,word ptr DGROUP:_bufferofs
	add	ax,word ptr DGROUP:_ylookup[bx]
	mov	dx,word ptr [bp+12]
	sar	dx,1
	sar	dx,1
	add	ax,dx
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],40960
   ;	
   ;		mask = 1 << (x&3);
   ;	
	mov	cl,byte ptr [bp+12]
	and	cl,3
	mov	al,1
	shl	al,cl
	mov	byte ptr [bp-9],al
   ;	
   ;	
   ;		for (plane = 0; plane<4; plane++)
   ;	
	xor	si,si
	jmp	short @23@362
@23@50:
   ;	
   ;		{
   ;			VGAMAPMASK(mask);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,[bp-9]
	out	 dx,ax
	sti	
   ;	
   ;			mask <<= 1;
   ;	
	shl	byte ptr [bp-9],1
   ;	
   ;			if (mask == 16)
   ;	
	cmp	byte ptr [bp-9],16
	jne	short @23@242
   ;	
   ;				mask = 1;
   ;	
	mov	byte ptr [bp-9],1
@23@242:
   ;	
   ;	
   ;			screen = dest;
   ;	
	mov	ax,word ptr [bp-6]
	mov	dx,word ptr [bp-8]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;			for (y=0;y<height;y++,screen+=linewidth,source+=width)
   ;	
	xor	di,di
	jmp	short @23@314
@23@266:
   ;	
   ;				_fmemcpy (screen,source,width);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr __fmemcpy
	add	sp,10
	inc	di
	mov	ax,word ptr DGROUP:_linewidth
	add	word ptr [bp-4],ax
	mov	ax,word ptr [bp+8]
	add	word ptr [bp+4],ax
@23@314:
	cmp	di,word ptr [bp+10]
	jl	short @23@266
	inc	si
@23@362:
	cmp	si,4
	jl	short @23@50
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_VL_MemToScreen	endp
   ;	
   ;	void VL_MaskedToScreen (byte far *source, int width, int height, int x, int y)
   ;	
	assume	cs:_TEXT
_VL_MaskedToScreen	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	push	si
	push	di
	mov	di,word ptr [bp+14]
   ;	
   ;	{
   ;		byte    far *screen,far *dest,mask;
   ;		byte	far *maskptr;
   ;		int		plane;
   ;	
   ;		width>>=2;
   ;	
	sar	word ptr [bp+8],1
	sar	word ptr [bp+8],1
   ;	
   ;		dest = MK_FP(SCREENSEG,bufferofs+ylookup[y]+(x>>2) );
   ;	
	mov	bx,di
	shl	bx,1
	mov	ax,word ptr DGROUP:_bufferofs
	add	ax,word ptr DGROUP:_ylookup[bx]
	mov	dx,word ptr [bp+12]
	sar	dx,1
	sar	dx,1
	add	ax,dx
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],40960
   ;	
   ;	//	mask = 1 << (x&3);
   ;	
   ;	//	maskptr = source;
   ;	
   ;		for (plane = 0; plane<4; plane++)
   ;	
	xor	si,si
	jmp	short @24@362
@24@50:
   ;	
   ;		{
   ;			VGAMAPMASK(mask);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,[bp-9]
	out	 dx,ax
	sti	
   ;	
   ;			mask <<= 1;
   ;	
	shl	byte ptr [bp-9],1
   ;	
   ;			if (mask == 16)
   ;	
	cmp	byte ptr [bp-9],16
	jne	short @24@242
   ;	
   ;				mask = 1;
   ;	
	mov	byte ptr [bp-9],1
@24@242:
   ;	
   ;	
   ;			screen = dest;
   ;	
	mov	ax,word ptr [bp-6]
	mov	dx,word ptr [bp-8]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;			for (y=0;y<height;y++,screen+=linewidth,source+=width)
   ;	
	xor	di,di
	jmp	short @24@314
@24@266:
   ;	
   ;				_fmemcpy (screen,source,width);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr __fmemcpy
	add	sp,10
	inc	di
	mov	ax,word ptr DGROUP:_linewidth
	add	word ptr [bp-4],ax
	mov	ax,word ptr [bp+8]
	add	word ptr [bp+4],ax
@24@314:
	cmp	di,word ptr [bp+10]
	jl	short @24@266
	inc	si
@24@362:
	cmp	si,4
	jl	short @24@50
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_VL_MaskedToScreen	endp
   ;	
   ;	void VL_LatchToScreen (unsigned source, int width, int height, int x, int y)
   ;	
	assume	cs:_TEXT
_VL_LatchToScreen	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		VGAWRITEMODE(1);
   ;	
	cli	
	mov	 dx,03CEH
	mov	 al,5
	out	 dx,al
	inc	 dx
	in	 al,dx
	and	 al,252
	or	 al,1
	out	 dx,al
	sti	
   ;	
   ;		VGAMAPMASK(15);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,15
	out	 dx,ax
	sti	
   ;	
   ;	
   ;	asm	mov	di,[y]				// dest = bufferofs+ylookup[y]+(x>>2)
   ;	
		mov		di,[[bp+12]]				
   ;	
   ;	asm	shl	di,1
   ;	
		shl		di,1
   ;	
   ;	asm	mov	di,[WORD PTR ylookup+di]
   ;	
		mov		di,[WORD PTR DGROUP:_ylookup+di]
   ;	
   ;	asm	add	di,[bufferofs]
   ;	
		add		di,[DGROUP:_bufferofs]
   ;	
   ;	asm	mov	ax,[x]
   ;	
		mov		ax,[[bp+10]]
   ;	
   ;	asm	shr	ax,2
   ;	
		shr		ax,2
   ;	
   ;	asm	add	di,ax
   ;	
		add		di,ax
   ;	
   ;	
   ;	asm	mov	si,[source]
   ;	
		mov		si,[[bp+4]]
   ;	
   ;	asm	mov	ax,[width]
   ;	
		mov		ax,[[bp+6]]
   ;	
   ;	asm	mov	bx,[linewidth]
   ;	
		mov		bx,[DGROUP:_linewidth]
   ;	
   ;	asm	sub	bx,ax
   ;	
		sub		bx,ax
   ;	
   ;	asm	mov	dx,[height]
   ;	
		mov		dx,[[bp+8]]
   ;	
   ;	asm	mov	cx,SCREENSEG
   ;	
		mov		cx,0a000H
   ;	
   ;	asm	mov	ds,cx
   ;	
		mov		ds,cx
   ;	
   ;	asm	mov	es,cx
   ;	
		mov		es,cx
@25@770:
   ;	
   ;	
   ;	drawline:
   ;	asm	mov	cx,ax
   ;	
		mov		cx,ax
   ;	
   ;	asm	rep movsb
   ;	
		rep movsb	
   ;	
   ;	asm	add	di,bx
   ;	
		add		di,bx
   ;	
   ;	asm	dec	dx
   ;	
		dec		dx
   ;	
   ;	asm	jnz	drawline
   ;	
	jne	short @25@770
   ;	
   ;	
   ;	asm	mov	ax,ss
   ;	
		mov		ax,ss
   ;	
   ;	asm	mov	ds,ax
   ;	
		mov		ds,ax
   ;	
   ;	
   ;		VGAWRITEMODE(0);
   ;	
	cli	
	mov	 dx,03CEH
	mov	 al,5
	out	 dx,al
	inc	 dx
	in	 al,dx
	and	 al,252
	or	 al,0
	out	 dx,al
	sti	
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_VL_LatchToScreen	endp
   ;	
   ;	void VL_DrawTile8String (char *str, char far *tile8ptr, int printx, int printy)
   ;	
	assume	cs:_TEXT
_VL_DrawTile8String	proc	near
	push	bp
	mov	bp,sp
	sub	sp,12
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{
   ;		int		i;
   ;		unsigned	far *dest,far *screen,far *src;
   ;	
   ;		dest = MK_FP(SCREENSEG,bufferofs+ylookup[printy]+(printx>>2));
   ;	
	mov	bx,word ptr [bp+12]
	shl	bx,1
	mov	ax,word ptr DGROUP:_bufferofs
	add	ax,word ptr DGROUP:_ylookup[bx]
	mov	dx,word ptr [bp+10]
	sar	dx,1
	sar	dx,1
	add	ax,dx
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],40960
	jmp	@26@1058
@26@50:
   ;	
   ;	
   ;		while (*str)
   ;		{
   ;			src = (unsigned far *)(tile8ptr + (*str<<6));
   ;	
	mov	al,byte ptr [di]
	cbw	
	mov	cl,6
	shl	ax,cl
	mov	dx,word ptr [bp+8]
	mov	bx,word ptr [bp+6]
	add	bx,ax
	mov	word ptr [bp-12],bx
	mov	word ptr [bp-10],dx
   ;	
   ;			// each character is 64 bytes
   ;	
   ;			VGAMAPMASK(1);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,1
	out	 dx,ax
	sti	
   ;	
   ;			screen = dest;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;			for (i=0;i<8;i++,screen+=linewidth)
   ;	
	xor	si,si
	jmp	short @26@290
@26@242:
   ;	
   ;				*screen = *src++;
   ;	
	les	bx,dword ptr [bp-12]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp-8]
	mov	word ptr es:[bx],ax
	add	word ptr [bp-12],2
	inc	si
	mov	ax,word ptr DGROUP:_linewidth
	shl	ax,1
	add	word ptr [bp-8],ax
@26@290:
	cmp	si,8
	jl	short @26@242
   ;	
   ;			VGAMAPMASK(2);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,2
	out	 dx,ax
	sti	
   ;	
   ;			screen = dest;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;			for (i=0;i<8;i++,screen+=linewidth)
   ;	
	xor	si,si
	jmp	short @26@530
@26@482:
   ;	
   ;				*screen = *src++;
   ;	
	les	bx,dword ptr [bp-12]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp-8]
	mov	word ptr es:[bx],ax
	add	word ptr [bp-12],2
	inc	si
	mov	ax,word ptr DGROUP:_linewidth
	shl	ax,1
	add	word ptr [bp-8],ax
@26@530:
	cmp	si,8
	jl	short @26@482
   ;	
   ;			VGAMAPMASK(4);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,4
	out	 dx,ax
	sti	
   ;	
   ;			screen = dest;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;			for (i=0;i<8;i++,screen+=linewidth)
   ;	
	xor	si,si
	jmp	short @26@770
@26@722:
   ;	
   ;				*screen = *src++;
   ;	
	les	bx,dword ptr [bp-12]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp-8]
	mov	word ptr es:[bx],ax
	add	word ptr [bp-12],2
	inc	si
	mov	ax,word ptr DGROUP:_linewidth
	shl	ax,1
	add	word ptr [bp-8],ax
@26@770:
	cmp	si,8
	jl	short @26@722
   ;	
   ;			VGAMAPMASK(8);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,8
	out	 dx,ax
	sti	
   ;	
   ;			screen = dest;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;			for (i=0;i<8;i++,screen+=linewidth)
   ;	
	xor	si,si
	jmp	short @26@1010
@26@962:
   ;	
   ;				*screen = *src++;
   ;	
	les	bx,dword ptr [bp-12]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp-8]
	mov	word ptr es:[bx],ax
	add	word ptr [bp-12],2
	inc	si
	mov	ax,word ptr DGROUP:_linewidth
	shl	ax,1
	add	word ptr [bp-8],ax
@26@1010:
	cmp	si,8
	jl	short @26@962
   ;	
   ;	
   ;			str++;
   ;	
	inc	di
   ;	
   ;			printx += 8;
   ;	
	add	word ptr [bp+10],8
   ;	
   ;			dest+=2;
   ;	
	add	word ptr [bp-4],4
@26@1058:
	cmp	byte ptr [di],0
	je	@@3
	jmp	@26@50
@@3:
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_VL_DrawTile8String	endp
   ;	
   ;	void VL_DrawLatch8String (char *str, unsigned tile8ptr, int printx, int printy)
   ;	
	assume	cs:_TEXT
_VL_DrawLatch8String	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
   ;	
   ;	{
   ;		int		i;
   ;		unsigned	src,dest;
   ;	
   ;		dest = bufferofs+ylookup[printy]+(printx>>2);
   ;	
	mov	bx,word ptr [bp+10]
	shl	bx,1
	mov	ax,word ptr DGROUP:_bufferofs
	add	ax,word ptr DGROUP:_ylookup[bx]
	mov	dx,word ptr [bp+8]
	sar	dx,1
	sar	dx,1
	add	ax,dx
	mov	word ptr [bp-4],ax
   ;	
   ;	
   ;		VGAWRITEMODE(1);
   ;	
	cli	
	mov	 dx,03CEH
	mov	 al,5
	out	 dx,al
	inc	 dx
	in	 al,dx
	and	 al,252
	or	 al,1
	out	 dx,al
	sti	
   ;	
   ;		VGAMAPMASK(15);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,15
	out	 dx,ax
	sti	
	jmp	@27@1250
@27@458:
   ;	
   ;	
   ;		while (*str)
   ;		{
   ;			src = tile8ptr + (*str<<4);		// each character is 16 latch bytes
   ;	
	mov	bx,word ptr [bp+4]
	mov	al,byte ptr [bx]
	cbw	
	mov	cl,4
	shl	ax,cl
	mov	dx,word ptr [bp+6]
	add	dx,ax
	mov	word ptr [bp-2],dx
   ;	
   ;	
   ;	asm	mov	si,[src]
   ;	
		mov		si,[[bp-2]]
   ;	
   ;	asm	mov	di,[dest]
   ;	
		mov		di,[[bp-4]]
   ;	
   ;	asm	mov	dx,[linewidth]
   ;	
		mov		dx,[DGROUP:_linewidth]
   ;	
   ;	
   ;	asm	mov	ax,SCREENSEG
   ;	
		mov		ax,0a000H
   ;	
   ;	asm	mov	ds,ax
   ;	
		mov		ds,ax
   ;	
   ;	
   ;	asm	lodsw
   ;	
		lodsw	
   ;	
   ;	asm	mov	[di],ax
   ;	
		mov		[di],ax
   ;	
   ;	asm	add	di,dx
   ;	
		add		di,dx
   ;	
   ;	asm	lodsw
   ;	
		lodsw	
   ;	
   ;	asm	mov	[di],ax
   ;	
		mov		[di],ax
   ;	
   ;	asm	add	di,dx
   ;	
		add		di,dx
   ;	
   ;	asm	lodsw
   ;	
		lodsw	
   ;	
   ;	asm	mov	[di],ax
   ;	
		mov		[di],ax
   ;	
   ;	asm	add	di,dx
   ;	
		add		di,dx
   ;	
   ;	asm	lodsw
   ;	
		lodsw	
   ;	
   ;	asm	mov	[di],ax
   ;	
		mov		[di],ax
   ;	
   ;	asm	add	di,dx
   ;	
		add		di,dx
   ;	
   ;	asm	lodsw
   ;	
		lodsw	
   ;	
   ;	asm	mov	[di],ax
   ;	
		mov		[di],ax
   ;	
   ;	asm	add	di,dx
   ;	
		add		di,dx
   ;	
   ;	asm	lodsw
   ;	
		lodsw	
   ;	
   ;	asm	mov	[di],ax
   ;	
		mov		[di],ax
   ;	
   ;	asm	add	di,dx
   ;	
		add		di,dx
   ;	
   ;	asm	lodsw
   ;	
		lodsw	
   ;	
   ;	asm	mov	[di],ax
   ;	
		mov		[di],ax
   ;	
   ;	asm	add	di,dx
   ;	
		add		di,dx
   ;	
   ;	asm	lodsw
   ;	
		lodsw	
   ;	
   ;	asm	mov	[di],ax
   ;	
		mov		[di],ax
   ;	
   ;	asm	add	di,dx
   ;	
		add		di,dx
   ;	
   ;	
   ;	asm	mov	ax,ss
   ;	
		mov		ax,ss
   ;	
   ;	asm	mov	ds,ax
   ;	
		mov		ds,ax
   ;	
   ;	
   ;			str++;
   ;	
	inc	word ptr [bp+4]
   ;	
   ;			printx += 8;
   ;	
	add	word ptr [bp+8],8
   ;	
   ;			dest+=2;
   ;	
	add	word ptr [bp-4],2
@27@1250:
	mov	bx,word ptr [bp+4]
	cmp	byte ptr [bx],0
	je	@@4
	jmp	@27@458
@@4:
   ;	
   ;		}
   ;	
   ;		VGAWRITEMODE(0);
   ;	
	cli	
	mov	 dx,03CEH
	mov	 al,5
	out	 dx,al
	inc	 dx
	in	 al,dx
	and	 al,252
	or	 al,0
	out	 dx,al
	sti	
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_VL_DrawLatch8String	endp
   ;	
   ;	void VL_SizeTile8String (char *str, int *width, int *height)
   ;	
	assume	cs:_TEXT
_VL_SizeTile8String	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		*height = 8;
   ;	
	mov	bx,word ptr [bp+8]
	mov	word ptr [bx],8
   ;	
   ;		*width = 8*strlen(str);
   ;	
	push	word ptr [bp+4]
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+6]
	mov	word ptr [bx],ax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_VL_SizeTile8String	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_screenfaded	label	word
	db	2 dup (?)
_bordercolor	label	word
	db	2 dup (?)
_ylookup	label	word
	db	400 dup (?)
_pelpan	label	word
	db	2 dup (?)
_BSS	ends
ID_VL5_FAR	segment para public 'FAR_DATA'
_palette1	label	byte
	db	768 dup (?)
ID_VL5_FAR	ends
ID_VL6_FAR	segment para public 'FAR_DATA'
_palette2	label	byte
	db	768 dup (?)
ID_VL6_FAR	ends
_BSS	segment word public 'BSS'
_bufferofs	label	word
	db	2 dup (?)
_displayofs	label	word
	db	2 dup (?)
_linewidth	label	word
	db	2 dup (?)
_fastpalette	label	word
	db	2 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'HIDDENCARD'
	db	0
	db	0
	db	'Improper video card!  If you really have a VGA card that I am'
	db	' not '
	db	10
	db	'detecting, use the -HIDDENCARD command line parameter!'
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	public	_VL_SetVGAPlaneMode
	extrn	__fmemcpy:near
	extrn	__fmemcmp:near
	public	_fastpalette
	public	_VL_TestPaletteSet
	public	_VL_MaskedToScreen
	public	_VL_SetSplitScreen
	public	_VL_SetLineWidth
	extrn	__fmemset:near
	public	_VL_LatchToScreen
	public	_VL_FillPalette
	public	_linewidth
	public	_rightmasks
_ParmStrings	equ	ParmStrings
	public	_VL_GetPalette
	public	_VL_SetPalette
	public	_displayofs
	public	_leftmasks
	public	_VL_MemToScreen
	public	_VL_ColorBorder
	public	_VL_SetTextMode
	public	_bufferofs
	public	_VL_Shutdown
	public	_pixmasks
	extrn	_outport:near
	public	_VL_ClearVideo
	public	_VL_MemToLatch
	public	_palette2
	public	_palette1
	public	_VL_GetColor
	public	_VL_SetColor
	public	_VL_FadeOut
	public	_VL_Startup
	public	_pelpan
	extrn	_US_CheckParm:near
	public	_ylookup
	extrn	__argv:word
	extrn	__argc:word
	public	_VL_DePlaneVGA
	public	_bordercolor
	extrn	_Quit:near
	public	_VL_Plot
	public	_VL_Vlin
	public	_VL_Hlin
	public	_screenfaded
	extrn	_VL_VideoID:near
	extrn	_strlen:near
	extrn	_VL_WaitVBL:near
	public	_VL_Bar
	public	_VL_FadeIn
	public	_screenseg
	public	_VL_DrawLatch8String
	public	_VL_SizeTile8String
	public	_VL_DrawTile8String
	end
