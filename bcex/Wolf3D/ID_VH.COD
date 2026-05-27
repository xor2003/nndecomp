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
	?debug	S "c:\id_vh.c"
	?debug	C E9E551FE7C0A633A5C69645F76682E63
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
_TEXT	segment byte public 'CODE'
   ;	
   ;	void VW_DrawPropString (char far *string)
   ;	
	assume	cs:_TEXT
_VW_DrawPropString	proc	near
	push	bp
	mov	bp,sp
	sub	sp,24
	push	si
	push	di
   ;	
   ;	{
   ;		fontstruct	far	*font;
   ;		int		width,step,height,i;
   ;		byte	far *source, far *dest, far *origdest;
   ;		byte	ch,mask;
   ;	
   ;		font = (fontstruct far *)grsegs[STARTFONT+fontnumber];
   ;	
	mov	bx,word ptr DGROUP:_fontnumber
	shl	bx,1
	mov	ax,word ptr DGROUP:_grsegs[bx+2]
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],ax
   ;	
   ;		height = bufferheight = font->height;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx]
	mov	word ptr DGROUP:_bufferheight,ax
	mov	word ptr [bp-10],ax
   ;	
   ;		dest = origdest = MK_FP(SCREENSEG,bufferofs+ylookup[py]+(px>>2));
   ;	
	mov	bx,word ptr DGROUP:_py
	shl	bx,1
	mov	ax,word ptr DGROUP:_bufferofs
	add	ax,word ptr DGROUP:_ylookup[bx]
	mov	dx,word ptr DGROUP:_px
	sar	dx,1
	sar	dx,1
	add	ax,dx
	mov	dx,40960
	mov	word ptr [bp-22],ax
	mov	word ptr [bp-20],dx
	mov	word ptr [bp-18],ax
	mov	word ptr [bp-16],dx
   ;	
   ;		mask = 1<<(px&3);
   ;	
	mov	cl,byte ptr DGROUP:_px
	and	cl,3
	mov	al,1
	shl	al,cl
	mov	byte ptr [bp-24],al
	jmp	@1@650
@1@50:
   ;	
   ;	
   ;	
   ;		while ((ch = *string++)!=0)
   ;		{
   ;			width = step = font->width[ch];
   ;	
	mov	al,byte ptr [bp-23]
	mov	ah,0
	les	bx,dword ptr [bp-4]
	add	bx,ax
	mov	al,byte ptr es:[bx+514]
	cbw	
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],ax
   ;	
   ;			source = ((byte far *)font)+font->location[ch];
   ;	
	mov	al,byte ptr [bp-23]
	mov	ah,0
	shl	ax,1
	les	bx,dword ptr [bp-4]
	add	bx,ax
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	add	dx,word ptr es:[bx+2]
	mov	word ptr [bp-14],dx
	mov	word ptr [bp-12],ax
	jmp	@1@626
@1@74:
   ;	
   ;			while (width--)
   ;			{
   ;				VGAMAPMASK(mask);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,[bp-24]
	out	 dx,ax
	sti	
   ;	
   ;	
   ;	asm	mov	ah,[BYTE PTR fontcolor]
   ;	
		mov		ah,[BYTE PTR DGROUP:_fontcolor]
   ;	
   ;	asm	mov	bx,[step]
   ;	
		mov		bx,[[bp-8]]
   ;	
   ;	asm	mov	cx,[height]
   ;	
		mov		cx,[[bp-10]]
   ;	
   ;	asm	mov	dx,[linewidth]
   ;	
		mov		dx,[_linewidth]
   ;	
   ;	asm	lds	si,[source]
   ;	
		lds		si,[[bp-14]]
   ;	
   ;	asm	les	di,[dest]
   ;	
		les		di,[[bp-18]]
@1@362:
   ;	
   ;	
   ;	vertloop:
   ;	asm	mov	al,[si]
   ;	
		mov		al,[si]
   ;	
   ;	asm	or	al,al
   ;	
		or		al,al
   ;	
   ;	asm	je	next
   ;	
	je	short @1@458
   ;	
   ;	asm	mov	[es:di],ah			// draw color
   ;	
		mov		[es:di],ah			
@1@458:
   ;	
   ;	
   ;	next:
   ;	asm	add	si,bx
   ;	
		add		si,bx
   ;	
   ;	asm	add	di,dx
   ;	
		add		di,dx
   ;	
   ;	asm	loop	vertloop
   ;	
	loop	short @1@362
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
   ;				source++;
   ;	
	inc	word ptr [bp-14]
   ;	
   ;				px++;
   ;	
	inc	word ptr DGROUP:_px
   ;	
   ;				mask <<= 1;
   ;	
	shl	byte ptr [bp-24],1
   ;	
   ;				if (mask == 16)
   ;	
	cmp	byte ptr [bp-24],16
	jne	short @1@626
   ;	
   ;				{
   ;					mask = 1;
   ;	
	mov	byte ptr [bp-24],1
   ;	
   ;					dest++;
   ;	
	inc	word ptr [bp-18]
@1@626:
	mov	ax,word ptr [bp-6]
	dec	word ptr [bp-6]
	or	ax,ax
	je	@@0
	jmp	@1@74
@@0:
@1@650:
	les	bx,dword ptr [bp+4]
	inc	word ptr [bp+4]
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-23],al
	or	al,al
	je	@@1
	jmp	@1@50
@@1:
   ;	
   ;				}
   ;			}
   ;		}
   ;	bufferheight = height;
   ;	
	mov	ax,word ptr [bp-10]
	mov	word ptr DGROUP:_bufferheight,ax
   ;	
   ;	bufferwidth = ((dest+1)-origdest)*4;
   ;	
	mov	ax,word ptr [bp-18]
	inc	ax
	xor	dx,dx
	sub	ax,word ptr [bp-22]
	sbb	dx,0
	shl	ax,1
	shl	ax,1
	mov	word ptr DGROUP:_bufferwidth,ax
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_VW_DrawPropString	endp
   ;	
   ;	void VW_DrawColorPropString (char far *string)
   ;	
	assume	cs:_TEXT
_VW_DrawColorPropString	proc	near
	push	bp
	mov	bp,sp
	sub	sp,24
	push	si
	push	di
   ;	
   ;	{
   ;		fontstruct	far	*font;
   ;		int		width,step,height,i;
   ;		byte	far *source, far *dest, far *origdest;
   ;		byte	ch,mask;
   ;	
   ;		font = (fontstruct far *)grsegs[STARTFONT+fontnumber];
   ;	
	mov	bx,word ptr DGROUP:_fontnumber
	shl	bx,1
	mov	ax,word ptr DGROUP:_grsegs[bx+2]
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],ax
   ;	
   ;		height = bufferheight = font->height;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx]
	mov	word ptr DGROUP:_bufferheight,ax
	mov	word ptr [bp-10],ax
   ;	
   ;		dest = origdest = MK_FP(SCREENSEG,bufferofs+ylookup[py]+(px>>2));
   ;	
	mov	bx,word ptr DGROUP:_py
	shl	bx,1
	mov	ax,word ptr DGROUP:_bufferofs
	add	ax,word ptr DGROUP:_ylookup[bx]
	mov	dx,word ptr DGROUP:_px
	sar	dx,1
	sar	dx,1
	add	ax,dx
	mov	dx,40960
	mov	word ptr [bp-22],ax
	mov	word ptr [bp-20],dx
	mov	word ptr [bp-18],ax
	mov	word ptr [bp-16],dx
   ;	
   ;		mask = 1<<(px&3);
   ;	
	mov	cl,byte ptr DGROUP:_px
	and	cl,3
	mov	al,1
	shl	al,cl
	mov	byte ptr [bp-24],al
	jmp	@2@746
@2@50:
   ;	
   ;	
   ;	
   ;		while ((ch = *string++)!=0)
   ;		{
   ;			width = step = font->width[ch];
   ;	
	mov	al,byte ptr [bp-23]
	mov	ah,0
	les	bx,dword ptr [bp-4]
	add	bx,ax
	mov	al,byte ptr es:[bx+514]
	cbw	
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],ax
   ;	
   ;			source = ((byte far *)font)+font->location[ch];
   ;	
	mov	al,byte ptr [bp-23]
	mov	ah,0
	shl	ax,1
	les	bx,dword ptr [bp-4]
	add	bx,ax
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	add	dx,word ptr es:[bx+2]
	mov	word ptr [bp-14],dx
	mov	word ptr [bp-12],ax
	jmp	@2@722
@2@74:
   ;	
   ;			while (width--)
   ;			{
   ;				VGAMAPMASK(mask);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,[bp-24]
	out	 dx,ax
	sti	
   ;	
   ;	
   ;	asm	mov	ah,[BYTE PTR fontcolor]
   ;	
		mov		ah,[BYTE PTR DGROUP:_fontcolor]
   ;	
   ;	asm	mov	bx,[step]
   ;	
		mov		bx,[[bp-8]]
   ;	
   ;	asm	mov	cx,[height]
   ;	
		mov		cx,[[bp-10]]
   ;	
   ;	asm	mov	dx,[linewidth]
   ;	
		mov		dx,[_linewidth]
   ;	
   ;	asm	lds	si,[source]
   ;	
		lds		si,[[bp-14]]
   ;	
   ;	asm	les	di,[dest]
   ;	
		les		di,[[bp-18]]
@2@362:
   ;	
   ;	
   ;	vertloop:
   ;	asm	mov	al,[si]
   ;	
		mov		al,[si]
   ;	
   ;	asm	or	al,al
   ;	
		or		al,al
   ;	
   ;	asm	je	next
   ;	
	je	short @2@458
   ;	
   ;	asm	mov	[es:di],ah			// draw color
   ;	
		mov		[es:di],ah			
@2@458:
   ;	
   ;	
   ;	next:
   ;	asm	add	si,bx
   ;	
		add		si,bx
   ;	
   ;	asm	add	di,dx
   ;	
		add		di,dx
   ;	
   ;	
   ;	asm rcr cx,1				// inc font color
   ;	
 	rcr	 cx,1				
   ;	
   ;	asm jc  cont
   ;	
	jc	short @2@578
   ;	
   ;	asm	inc ah
   ;	
		inc	 ah
@2@578:
   ;	
   ;	
   ;	cont:
   ;	asm rcl cx,1
   ;	
 	rcl	 cx,1
   ;	
   ;	asm	loop	vertloop
   ;	
	loop	short @2@362
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
   ;				source++;
   ;	
	inc	word ptr [bp-14]
   ;	
   ;				px++;
   ;	
	inc	word ptr DGROUP:_px
   ;	
   ;				mask <<= 1;
   ;	
	shl	byte ptr [bp-24],1
   ;	
   ;				if (mask == 16)
   ;	
	cmp	byte ptr [bp-24],16
	jne	short @2@722
   ;	
   ;				{
   ;					mask = 1;
   ;	
	mov	byte ptr [bp-24],1
   ;	
   ;					dest++;
   ;	
	inc	word ptr [bp-18]
@2@722:
	mov	ax,word ptr [bp-6]
	dec	word ptr [bp-6]
	or	ax,ax
	je	@@2
	jmp	@2@74
@@2:
@2@746:
	les	bx,dword ptr [bp+4]
	inc	word ptr [bp+4]
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-23],al
	or	al,al
	je	@@3
	jmp	@2@50
@@3:
   ;	
   ;				}
   ;			}
   ;		}
   ;	bufferheight = height;
   ;	
	mov	ax,word ptr [bp-10]
	mov	word ptr DGROUP:_bufferheight,ax
   ;	
   ;	bufferwidth = ((dest+1)-origdest)*4;
   ;	
	mov	ax,word ptr [bp-18]
	inc	ax
	xor	dx,dx
	sub	ax,word ptr [bp-22]
	sbb	dx,0
	shl	ax,1
	shl	ax,1
	mov	word ptr DGROUP:_bufferwidth,ax
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_VW_DrawColorPropString	endp
   ;	
   ;	void VL_MungePic (byte far *source, unsigned width, unsigned height)
   ;	
	assume	cs:_TEXT
_VL_MungePic	proc	near
	push	bp
	mov	bp,sp
	sub	sp,16
	push	si
	push	di
   ;	
   ;	{
   ;		unsigned	x,y,plane,size,pwidth;
   ;		byte		_seg *temp, far *dest, far *srcline;
   ;	
   ;		size = width*height;
   ;	
	mov	ax,word ptr [bp+8]
	imul	word ptr [bp+10]
	mov	word ptr [bp-4],ax
   ;	
   ;	
   ;		if (width&3)
   ;	
	test	word ptr [bp+8],3
	je	short @3@74
   ;	
   ;			MS_Quit ("VL_MungePic: Not divisable by 4!");
   ;	
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _Quit
	pop	cx
@3@74:
   ;	
   ;	
   ;	//
   ;	// copy the pic to a temp buffer
   ;	//
   ;		MM_GetPtr (&(memptr)temp,size);
   ;	
	xor	ax,ax
	push	ax
	push	word ptr [bp-4]
	lea	ax,word ptr [bp-8]
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;		_fmemcpy (temp,source,size);
   ;	
	push	word ptr [bp-4]
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	push	word ptr [bp-8]
	call	near ptr __fmemcpy
	add	sp,8
   ;	
   ;	
   ;	//
   ;	// munge it back into the original buffer
   ;	//
   ;		dest = source;
   ;	
	mov	ax,word ptr [bp+6]
	mov	dx,word ptr [bp+4]
	mov	word ptr [bp-12],dx
	mov	word ptr [bp-10],ax
   ;	
   ;		pwidth = width/4;
   ;	
	mov	ax,word ptr [bp+8]
	shr	ax,1
	shr	ax,1
	mov	word ptr [bp-6],ax
   ;	
   ;	
   ;		for (plane=0;plane<4;plane++)
   ;	
	xor	si,si
	jmp	short @3@314
@3@98:
   ;	
   ;		{
   ;			srcline = temp;
   ;	
	mov	ax,word ptr [bp-8]
	mov	word ptr [bp-16],0
	mov	word ptr [bp-14],ax
   ;	
   ;			for (y=0;y<height;y++)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @3@266
@3@122:
   ;	
   ;			{
   ;				for (x=0;x<pwidth;x++)
   ;	
	xor	di,di
	jmp	short @3@194
@3@146:
   ;	
   ;					*dest++ = *(srcline+x*4+plane);
   ;	
	mov	ax,di
	shl	ax,1
	shl	ax,1
	les	bx,dword ptr [bp-16]
	add	bx,ax
	mov	al,byte ptr es:[bx+si]
	les	bx,dword ptr [bp-12]
	mov	byte ptr es:[bx],al
	inc	word ptr [bp-12]
	inc	di
@3@194:
	cmp	di,word ptr [bp-6]
	jb	short @3@146
   ;	
   ;				srcline+=width;
   ;	
	mov	ax,word ptr [bp+8]
	add	word ptr [bp-16],ax
	inc	word ptr [bp-2]
@3@266:
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp+10]
	jb	short @3@122
	inc	si
@3@314:
	cmp	si,4
	jb	short @3@98
   ;	
   ;			}
   ;		}
   ;	
   ;		MM_FreePtr (&(memptr)temp);
   ;	
	lea	ax,word ptr [bp-8]
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_VL_MungePic	endp
   ;	
   ;	void VWL_MeasureString (char far *string, word *width, word *height
   ;	
	assume	cs:_TEXT
_VWL_MeasureString	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+8]
   ;	
   ;		, fontstruct _seg *font)
   ;	{
   ;		*height = font->height;
   ;	
	mov	es,word ptr [bp+12]
	mov	ax,word ptr es:[0]
	mov	bx,word ptr [bp+10]
	mov	word ptr [bx],ax
   ;	
   ;		for (*width = 0;*string;string++)
   ;	
	mov	word ptr [si],0
	jmp	short @4@98
@4@50:
   ;	
   ;			*width += font->width[*((byte far *)string)];	// proportional width
   ;	
	mov	es,word ptr [bp+12]
	push	es
	les	bx,dword ptr [bp+4]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	mov	bx,ax
	pop	es
	mov	al,byte ptr es:[bx+514]
	cbw	
	add	word ptr [si],ax
	inc	word ptr [bp+4]
@4@98:
	les	bx,dword ptr [bp+4]
	cmp	byte ptr es:[bx],0
	jne	short @4@50
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_VWL_MeasureString	endp
   ;	
   ;	void	VW_MeasurePropString (char far *string, word *width, word *height)
   ;	
	assume	cs:_TEXT
_VW_MeasurePropString	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		VWL_MeasureString(string,width,height,(fontstruct _seg *)grsegs[STARTFONT+fontnumber]);
   ;	
	mov	bx,word ptr DGROUP:_fontnumber
	shl	bx,1
	push	word ptr DGROUP:_grsegs[bx+2]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _VWL_MeasureString
	add	sp,10
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_VW_MeasurePropString	endp
   ;	
   ;	void	VW_MeasureMPropString  (char far *string, word *width, word *height)
   ;	
	assume	cs:_TEXT
_VW_MeasureMPropString	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		VWL_MeasureString(string,width,height,(fontstruct _seg *)grsegs[STARTFONTM+fontnumber]);
   ;	
	mov	bx,word ptr DGROUP:_fontnumber
	shl	bx,1
	push	word ptr DGROUP:_grsegs[bx+6]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _VWL_MeasureString
	add	sp,10
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_VW_MeasureMPropString	endp
   ;	
   ;	int VW_MarkUpdateBlock (int x1, int y1, int x2, int y2)
   ;	
	assume	cs:_TEXT
_VW_MarkUpdateBlock	proc	near
	push	bp
	mov	bp,sp
	sub	sp,12
	push	si
	push	di
   ;	
   ;	{
   ;		int	x,y,xt1,yt1,xt2,yt2,nextline;
   ;		byte *mark;
   ;	
   ;		xt1 = x1>>PIXTOBLOCK;
   ;	
	mov	ax,word ptr [bp+4]
	mov	cl,4
	sar	ax,cl
	mov	di,ax
   ;	
   ;		yt1 = y1>>PIXTOBLOCK;
   ;	
	mov	ax,word ptr [bp+6]
	mov	cl,4
	sar	ax,cl
	mov	word ptr [bp-6],ax
   ;	
   ;	
   ;		xt2 = x2>>PIXTOBLOCK;
   ;	
	mov	ax,word ptr [bp+8]
	mov	cl,4
	sar	ax,cl
	mov	word ptr [bp-8],ax
   ;	
   ;		yt2 = y2>>PIXTOBLOCK;
   ;	
	mov	ax,word ptr [bp+10]
	mov	cl,4
	sar	ax,cl
	mov	word ptr [bp-10],ax
   ;	
   ;	
   ;		if (xt1<0)
   ;	
	or	di,di
	jge	short @7@74
   ;	
   ;			xt1=0;
   ;	
	xor	di,di
	jmp	short @7@122
@7@74:
   ;	
   ;		else if (xt1>=UPDATEWIDE)
   ;	
	cmp	di,20
	jl	short @7@122
   ;	
   ;			return 0;
   ;	
	xor	ax,ax
	jmp	@7@674
@7@122:
   ;	
   ;	
   ;		if (yt1<0)
   ;	
	cmp	word ptr [bp-6],0
	jge	short @7@170
   ;	
   ;			yt1=0;
   ;	
	mov	word ptr [bp-6],0
	jmp	short @7@218
@7@170:
   ;	
   ;		else if (yt1>UPDATEHIGH)
   ;	
	cmp	word ptr [bp-6],13
	jle	short @7@218
   ;	
   ;			return 0;
   ;	
	xor	ax,ax
	jmp	@7@674
@7@218:
   ;	
   ;	
   ;		if (xt2<0)
   ;	
	cmp	word ptr [bp-8],0
	jge	short @7@290
   ;	
   ;			return 0;
   ;	
	xor	ax,ax
	jmp	short @7@674
	jmp	short @7@338
@7@290:
   ;	
   ;		else if (xt2>=UPDATEWIDE)
   ;	
	cmp	word ptr [bp-8],20
	jl	short @7@338
   ;	
   ;			xt2 = UPDATEWIDE-1;
   ;	
	mov	word ptr [bp-8],19
@7@338:
   ;	
   ;	
   ;		if (yt2<0)
   ;	
	cmp	word ptr [bp-10],0
	jge	short @7@410
   ;	
   ;			return 0;
   ;	
	xor	ax,ax
	jmp	short @7@674
	jmp	short @7@458
@7@410:
   ;	
   ;		else if (yt2>=UPDATEHIGH)
   ;	
	cmp	word ptr [bp-10],13
	jl	short @7@458
   ;	
   ;			yt2 = UPDATEHIGH-1;
   ;	
	mov	word ptr [bp-10],12
@7@458:
   ;	
   ;	
   ;		mark = updateptr + uwidthtable[yt1] + xt1;
   ;	
	mov	bx,word ptr [bp-6]
	shl	bx,1
	mov	ax,word ptr DGROUP:_updateptr
	add	ax,word ptr DGROUP:_uwidthtable[bx]
	add	ax,di
	mov	si,ax
   ;	
   ;		nextline = UPDATEWIDE - (xt2-xt1) - 1;
   ;	
	mov	ax,word ptr [bp-8]
	sub	ax,di
	mov	dx,20
	sub	dx,ax
	dec	dx
	mov	word ptr [bp-12],dx
   ;	
   ;	
   ;		for (y=yt1;y<=yt2;y++)
   ;	
	mov	ax,word ptr [bp-6]
	mov	word ptr [bp-4],ax
	jmp	short @7@626
@7@482:
   ;	
   ;		{
   ;			for (x=xt1;x<=xt2;x++)
   ;	
	mov	word ptr [bp-2],di
	jmp	short @7@554
@7@506:
   ;	
   ;				*mark++ = 1;			// this tile will need to be updated
   ;	
	mov	byte ptr [si],1
	inc	si
	inc	word ptr [bp-2]
@7@554:
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp-8]
	jle	short @7@506
   ;	
   ;	
   ;			mark += nextline;
   ;	
	add	si,word ptr [bp-12]
	inc	word ptr [bp-4]
@7@626:
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-10]
	jle	short @7@482
   ;	
   ;		}
   ;	
   ;		return 1;
   ;	
	mov	ax,1
	jmp	short @7@674
@7@674:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_VW_MarkUpdateBlock	endp
   ;	
   ;	void VWB_DrawTile8 (int x, int y, int tile)
   ;	
	assume	cs:_TEXT
_VWB_DrawTile8	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
	mov	si,word ptr [bp+6]
   ;	
   ;	{
   ;		if (VW_MarkUpdateBlock (x,y,x+7,y+7))
   ;	
	mov	ax,si
	add	ax,7
	push	ax
	mov	ax,di
	add	ax,7
	push	ax
	push	si
	push	di
	call	near ptr _VW_MarkUpdateBlock
	add	sp,8
	or	ax,ax
	je	short @8@74
   ;	
   ;			LatchDrawChar(x,y,tile);
   ;	
	push	si
	push	di
	mov	ax,8
	push	ax
	mov	ax,2
	push	ax
	mov	ax,word ptr [bp+8]
	mov	cl,4
	shl	ax,cl
	mov	dx,word ptr DGROUP:_latchpics
	add	dx,ax
	push	dx
	call	near ptr _VL_LatchToScreen
	add	sp,10
@8@74:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_VWB_DrawTile8	endp
   ;	
   ;	void VWB_DrawTile8M (int x, int y, int tile)
   ;	
	assume	cs:_TEXT
_VWB_DrawTile8M	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
	mov	si,word ptr [bp+6]
   ;	
   ;	{
   ;		if (VW_MarkUpdateBlock (x,y,x+7,y+7))
   ;	
	mov	ax,si
	add	ax,7
	push	ax
	mov	ax,di
	add	ax,7
	push	ax
	push	si
	push	di
	call	near ptr _VW_MarkUpdateBlock
	add	sp,8
	or	ax,ax
	je	short @9@74
   ;	
   ;			VL_MemToScreen (((byte far *)grsegs[STARTTILE8M])+tile*64,8,8,x,y);
   ;	
	push	si
	push	di
	mov	ax,8
	push	ax
	mov	ax,8
	push	ax
	xor	ax,ax
	mov	dx,word ptr [bp+8]
	mov	cl,6
	shl	dx,cl
	add	ax,dx
	push	word ptr DGROUP:_grsegs+272
	push	ax
	call	near ptr _VL_MemToScreen
	add	sp,12
@9@74:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_VWB_DrawTile8M	endp
   ;	
   ;	void VWB_DrawPic (int x, int y, int chunknum)
   ;	
	assume	cs:_TEXT
_VWB_DrawPic	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		int	picnum = chunknum - STARTPICS;
   ;	
	mov	ax,word ptr [bp+8]
	add	ax,65533
	mov	word ptr [bp-2],ax
   ;	
   ;		unsigned width,height;
   ;	
   ;		x &= ~7;
   ;	
	and	si,65528
   ;	
   ;	
   ;		width = pictable[picnum].width;
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	shl	bx,1
	mov	es,word ptr DGROUP:_pictable
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-4],ax
   ;	
   ;		height = pictable[picnum].height;
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	shl	bx,1
	mov	es,word ptr DGROUP:_pictable
	mov	di,word ptr es:[bx+2]
   ;	
   ;	
   ;		if (VW_MarkUpdateBlock (x,y,x+width-1,y+height-1))
   ;	
	mov	ax,word ptr [bp+6]
	add	ax,di
	dec	ax
	push	ax
	mov	ax,si
	add	ax,word ptr [bp-4]
	dec	ax
	push	ax
	push	word ptr [bp+6]
	push	si
	call	near ptr _VW_MarkUpdateBlock
	add	sp,8
	or	ax,ax
	je	short @10@74
   ;	
   ;			VL_MemToScreen (grsegs[chunknum],width,height,x,y);
   ;	
	push	word ptr [bp+6]
	push	si
	push	di
	push	word ptr [bp-4]
	mov	bx,word ptr [bp+8]
	shl	bx,1
	push	word ptr DGROUP:_grsegs[bx]
	xor	ax,ax
	push	ax
	call	near ptr _VL_MemToScreen
	add	sp,12
@10@74:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_VWB_DrawPic	endp
   ;	
   ;	void VWB_DrawPropString	 (char far *string)
   ;	
	assume	cs:_TEXT
_VWB_DrawPropString	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int x;
   ;		x=px;
   ;	
	mov	si,word ptr DGROUP:_px
   ;	
   ;		VW_DrawPropString (string);
   ;	
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _VW_DrawPropString
	pop	cx
	pop	cx
   ;	
   ;		VW_MarkUpdateBlock(x,py,px-1,py+bufferheight-1);
   ;	
	mov	ax,word ptr DGROUP:_py
	add	ax,word ptr DGROUP:_bufferheight
	dec	ax
	push	ax
	mov	ax,word ptr DGROUP:_px
	dec	ax
	push	ax
	push	word ptr DGROUP:_py
	push	si
	call	near ptr _VW_MarkUpdateBlock
	add	sp,8
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_VWB_DrawPropString	endp
   ;	
   ;	void VWB_Bar (int x, int y, int width, int height, int color)
   ;	
	assume	cs:_TEXT
_VWB_Bar	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
	mov	si,word ptr [bp+6]
   ;	
   ;	{
   ;		if (VW_MarkUpdateBlock (x,y,x+width,y+height-1) )
   ;	
	mov	ax,si
	add	ax,word ptr [bp+10]
	dec	ax
	push	ax
	mov	ax,di
	add	ax,word ptr [bp+8]
	push	ax
	push	si
	push	di
	call	near ptr _VW_MarkUpdateBlock
	add	sp,8
	or	ax,ax
	je	short @12@74
   ;	
   ;			VW_Bar (x,y,width,height,color);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	si
	push	di
	call	near ptr _VL_Bar
	add	sp,10
@12@74:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_VWB_Bar	endp
   ;	
   ;	void VWB_Plot (int x, int y, int color)
   ;	
	assume	cs:_TEXT
_VWB_Plot	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
	mov	si,word ptr [bp+6]
   ;	
   ;	{
   ;		if (VW_MarkUpdateBlock (x,y,x,y))
   ;	
	push	si
	push	di
	push	si
	push	di
	call	near ptr _VW_MarkUpdateBlock
	add	sp,8
	or	ax,ax
	je	short @13@74
   ;	
   ;			VW_Plot(x,y,color);
   ;	
	push	word ptr [bp+8]
	push	si
	push	di
	call	near ptr _VL_Plot
	add	sp,6
@13@74:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_VWB_Plot	endp
   ;	
   ;	void VWB_Hlin (int x1, int x2, int y, int color)
   ;	
	assume	cs:_TEXT
_VWB_Hlin	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
	mov	si,word ptr [bp+8]
   ;	
   ;	{
   ;		if (VW_MarkUpdateBlock (x1,y,x2,y))
   ;	
	push	si
	push	word ptr [bp+6]
	push	si
	push	di
	call	near ptr _VW_MarkUpdateBlock
	add	sp,8
	or	ax,ax
	je	short @14@74
   ;	
   ;			VW_Hlin(x1,x2,y,color);
   ;	
	push	word ptr [bp+10]
	mov	ax,word ptr [bp+6]
	sub	ax,di
	inc	ax
	push	ax
	push	si
	push	di
	call	near ptr _VL_Hlin
	add	sp,8
@14@74:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_VWB_Hlin	endp
   ;	
   ;	void VWB_Vlin (int y1, int y2, int x, int color)
   ;	
	assume	cs:_TEXT
_VWB_Vlin	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
	mov	si,word ptr [bp+8]
   ;	
   ;	{
   ;		if (VW_MarkUpdateBlock (x,y1,x,y2))
   ;	
	push	word ptr [bp+6]
	push	si
	push	di
	push	si
	call	near ptr _VW_MarkUpdateBlock
	add	sp,8
	or	ax,ax
	je	short @15@74
   ;	
   ;			VW_Vlin(y1,y2,x,color);
   ;	
	push	word ptr [bp+10]
	mov	ax,word ptr [bp+6]
	sub	ax,di
	inc	ax
	push	ax
	push	di
	push	si
	call	near ptr _VL_Vlin
	add	sp,8
@15@74:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_VWB_Vlin	endp
   ;	
   ;	void VW_UpdateScreen (void)
   ;	
	assume	cs:_TEXT
_VW_UpdateScreen	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		VH_UpdateScreen ();
   ;	
	call	near ptr _VH_UpdateScreen
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_VW_UpdateScreen	endp
   ;	
   ;	void LatchDrawPic (unsigned x, unsigned y, unsigned picnum)
   ;	
	assume	cs:_TEXT
_LatchDrawPic	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
   ;	
   ;	{
   ;		unsigned wide, height, source;
   ;	
   ;		wide = pictable[picnum-STARTPICS].width;
   ;	
	mov	bx,word ptr [bp+8]
	sub	bx,3
	shl	bx,1
	shl	bx,1
	mov	es,word ptr DGROUP:_pictable
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;		height = pictable[picnum-STARTPICS].height;
   ;	
	mov	bx,word ptr [bp+8]
	sub	bx,3
	shl	bx,1
	shl	bx,1
	mov	es,word ptr DGROUP:_pictable
	mov	di,word ptr es:[bx+2]
   ;	
   ;		source = latchpics[2+picnum-LATCHPICS_LUMP_START];
   ;	
	mov	bx,word ptr [bp+8]
	inc	bx
	inc	bx
	sub	bx,91
	shl	bx,1
	mov	si,word ptr DGROUP:_latchpics[bx]
   ;	
   ;	
   ;		VL_LatchToScreen (source,wide/4,height,x*8,y);
   ;	
	push	word ptr [bp+6]
	mov	ax,word ptr [bp+4]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	push	ax
	push	di
	mov	ax,word ptr [bp-2]
	shr	ax,1
	shr	ax,1
	push	ax
	push	si
	call	near ptr _VL_LatchToScreen
	add	sp,10
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_LatchDrawPic	endp
   ;	
   ;	void LoadLatchMem (void)
   ;	
	assume	cs:_TEXT
_LoadLatchMem	proc	near
	push	bp
	mov	bp,sp
	sub	sp,12
	push	si
	push	di
   ;	
   ;	{
   ;		int	i,j,p,m,width,height,start,end;
   ;		byte	far *src;
   ;		unsigned	destoff;
   ;	
   ;	//
   ;	// tile 8s
   ;	//
   ;		latchpics[0] = freelatch;
   ;	
	mov	ax,word ptr DGROUP:_freelatch
	mov	word ptr DGROUP:_latchpics,ax
   ;	
   ;		CA_CacheGrChunk (STARTTILE8);
   ;	
	mov	ax,135
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;		src = (byte _seg *)grsegs[STARTTILE8];
   ;	
	mov	ax,word ptr DGROUP:_grsegs+270
	mov	word ptr [bp-12],0
	mov	word ptr [bp-10],ax
   ;	
   ;		destoff = freelatch;
   ;	
	mov	di,word ptr DGROUP:_freelatch
   ;	
   ;	
   ;		for (i=0;i<NUMTILE8;i++)
   ;	
	xor	si,si
	jmp	short @18@98
@18@50:
   ;	
   ;		{
   ;			VL_MemToLatch (src,8,8,destoff);
   ;	
	push	di
	mov	ax,8
	push	ax
	mov	ax,8
	push	ax
	push	word ptr [bp-10]
	push	word ptr [bp-12]
	call	near ptr _VL_MemToLatch
	add	sp,10
   ;	
   ;			src += 64;
   ;	
	add	word ptr [bp-12],64
   ;	
   ;			destoff +=16;
   ;	
	add	di,16
	inc	si
@18@98:
	cmp	si,72
	jl	short @18@50
   ;	
   ;		}
   ;		UNCACHEGRCHUNK (STARTTILE8);
   ;	
	mov	ax,offset DGROUP:_grsegs+270
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded+135
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded+135,al
   ;	
   ;	
   ;	#if 0	// ran out of latch space!
   ;	//
   ;	// tile 16s
   ;	//
   ;		src = (byte _seg *)grsegs[STARTTILE16];
   ;		latchpics[1] = destoff;
   ;	
   ;		for (i=0;i<NUMTILE16;i++)
   ;		{
   ;			CA_CacheGrChunk (STARTTILE16+i);
   ;			src = (byte _seg *)grsegs[STARTTILE16+i];
   ;			VL_MemToLatch (src,16,16,destoff);
   ;			destoff+=64;
   ;			if (src)
   ;				UNCACHEGRCHUNK (STARTTILE16+i);
   ;		}
   ;	#endif
   ;	
   ;	//
   ;	// pics
   ;	//
   ;		start = LATCHPICS_LUMP_START;
   ;	
	mov	word ptr [bp-6],91
   ;	
   ;		end = LATCHPICS_LUMP_END;
   ;	
	mov	word ptr [bp-8],134
   ;	
   ;	
   ;		for (i=start;i<=end;i++)
   ;	
	mov	si,word ptr [bp-6]
	jmp	@18@194
@18@146:
   ;	
   ;		{
   ;			latchpics[2+i-start] = destoff;
   ;	
	mov	bx,si
	inc	bx
	inc	bx
	sub	bx,word ptr [bp-6]
	shl	bx,1
	mov	word ptr DGROUP:_latchpics[bx],di
   ;	
   ;			CA_CacheGrChunk (i);
   ;	
	push	si
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;			width = pictable[i-STARTPICS].width;
   ;	
	mov	bx,si
	add	bx,65533
	shl	bx,1
	shl	bx,1
	mov	es,word ptr DGROUP:_pictable
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;			height = pictable[i-STARTPICS].height;
   ;	
	mov	bx,si
	add	bx,65533
	shl	bx,1
	shl	bx,1
	mov	es,word ptr DGROUP:_pictable
	mov	ax,word ptr es:[bx+2]
	mov	word ptr [bp-4],ax
   ;	
   ;			VL_MemToLatch (grsegs[i],width,height,destoff);
   ;	
	push	di
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	mov	bx,si
	shl	bx,1
	push	word ptr DGROUP:_grsegs[bx]
	xor	ax,ax
	push	ax
	call	near ptr _VL_MemToLatch
	add	sp,10
   ;	
   ;			destoff += width/4 *height;
   ;	
	mov	ax,word ptr [bp-2]
	mov	bx,4
	cwd	
	idiv	bx
	imul	word ptr [bp-4]
	add	di,ax
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
	inc	si
@18@194:
	cmp	si,word ptr [bp-8]
	jg	@@4
	jmp	@18@146
@@4:
   ;	
   ;		}
   ;	
   ;		EGAMAPMASK(15);
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
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_LoadLatchMem	endp
_TEXT	ends
_DATA	segment word public 'DATA'
	db	1
	db	2
	db	4
	db	8
	db	4 dup (0)
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	boolean FizzleFade (unsigned source, unsigned dest,
   ;	
	assume	cs:_TEXT
_FizzleFade	proc	near
	push	bp
	mov	bp,sp
	sub	sp,26
	push	si
	push	di
	push	ss
	lea	ax,word ptr [bp-16]
	push	ax
	push	ds
	mov	ax,offset DGROUP:d@+0
	push	ax
	mov	cx,8
	call	near ptr N_SCOPY@
   ;	
   ;		unsigned width,unsigned height, unsigned frames, boolean abortable)
   ;	{
   ;		int			pixperframe;
   ;		unsigned	drawofs,pagedelta;
   ;		byte 		mask,maskb[8] = {1,2,4,8};
   ;		unsigned	x,y,p,frame;
   ;		long		rndval;
   ;	
   ;		pagedelta = dest-source;
   ;	
	mov	ax,word ptr [bp+6]
	sub	ax,word ptr [bp+4]
	mov	word ptr [bp-6],ax
   ;	
   ;		rndval = 1;
   ;	
	mov	word ptr [bp-26],1
	mov	word ptr [bp-24],0
   ;	
   ;		y = 0;
   ;	
	mov	word ptr [bp-20],0
   ;	
   ;		pixperframe = 64000/frames;
   ;	
	xor	ax,ax
	push	ax
	push	word ptr [bp+12]
	xor	ax,ax
	mov	dx,64000
	push	ax
	push	dx
	call	near ptr N_LDIV@
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;		IN_StartAck ();
   ;	
	call	near ptr _IN_StartAck
   ;	
   ;	
   ;		TimeCount=frame=0;
   ;	
	xor	ax,ax
	mov	si,ax
	mov	word ptr DGROUP:_TimeCount,ax
	mov	word ptr DGROUP:_TimeCount+2,0
@19@50:
   ;	
   ;		do	// while (1)
   ;		{
   ;			if (abortable && IN_CheckAck () )
   ;	
	cmp	word ptr [bp+14],0
	je	short @19@122
	call	near ptr _IN_CheckAck
	or	ax,ax
	je	short @19@122
   ;	
   ;				return true;
   ;	
	mov	ax,1
	jmp	@19@1298
@19@122:
   ;	
   ;	
   ;			asm	mov	es,[screenseg]
   ;	
		mov		es,[_screenseg]
   ;	
   ;	
   ;			for (p=0;p<pixperframe;p++)
   ;	
	mov	word ptr [bp-22],0
	jmp	@19@1154
@19@170:
   ;	
   ;			{
   ;				//
   ;				// seperate random value into x/y pair
   ;				//
   ;				asm	mov	ax,[WORD PTR rndval]
   ;	
		mov		ax,[WORD PTR [bp-26]]
   ;	
   ;				asm	mov	dx,[WORD PTR rndval+2]
   ;	
		mov		dx,[WORD PTR [bp-26]+2]
   ;	
   ;				asm	mov	bx,ax
   ;	
		mov		bx,ax
   ;	
   ;				asm	dec	bl
   ;	
		dec		bl
   ;	
   ;				asm	mov	[BYTE PTR y],bl			// low 8 bits - 1 = y xoordinate
   ;	
		mov		[BYTE PTR [bp-20]],bl			
   ;	
   ;				asm	mov	bx,ax
   ;	
		mov		bx,ax
   ;	
   ;				asm	mov	cx,dx
   ;	
		mov		cx,dx
   ;	
   ;				asm	mov	[BYTE PTR x],ah			// next 9 bits = x xoordinate
   ;	
		mov		[BYTE PTR [bp-18]],ah			
   ;	
   ;				asm	mov	[BYTE PTR x+1],dl
   ;	
		mov		[BYTE PTR [bp-18]+1],dl
   ;	
   ;				//
   ;				// advance to next random element
   ;				//
   ;				asm	shr	dx,1
   ;	
		shr		dx,1
   ;	
   ;				asm	rcr	ax,1
   ;	
		rcr		ax,1
   ;	
   ;				asm	jnc	noxor
   ;	
	jnc	short @19@506
   ;	
   ;				asm	xor	dx,0x0001
   ;	
		xor		dx,00001H
   ;	
   ;				asm	xor	ax,0x2000
   ;	
		xor		ax,02000H
@19@506:
   ;	
   ;	noxor:
   ;				asm	mov	[WORD PTR rndval],ax
   ;	
		mov		[WORD PTR [bp-26]],ax
   ;	
   ;				asm	mov	[WORD PTR rndval+2],dx
   ;	
		mov		[WORD PTR [bp-26]+2],dx
   ;	
   ;	
   ;				if (x>width || y>height)
   ;	
	mov	ax,word ptr [bp-18]
	cmp	ax,word ptr [bp+8]
	ja	short @19@602
	mov	ax,word ptr [bp-20]
	cmp	ax,word ptr [bp+10]
	jbe	short @19@626
@19@602:
   ;	
   ;					continue;
   ;	
	jmp	@19@1130
@19@626:
   ;	
   ;				drawofs = source+ylookup[y] + (x>>2);
   ;	
	mov	bx,word ptr [bp-20]
	shl	bx,1
	mov	ax,word ptr [bp+4]
	add	ax,word ptr DGROUP:_ylookup[bx]
	mov	dx,word ptr [bp-18]
	shr	dx,1
	shr	dx,1
	add	ax,dx
	mov	word ptr [bp-4],ax
   ;	
   ;	
   ;				//
   ;				// copy one pixel
   ;				//
   ;				mask = x&3;
   ;	
	mov	al,byte ptr [bp-18]
	and	al,3
	mov	byte ptr [bp-7],al
   ;	
   ;				VGAREADMAP(mask);
   ;	
	cli	
	mov	 dx,03CEH
	mov	 al,4
	mov	 ah,[bp-7]
	out	 dx,ax
	sti	
   ;	
   ;				mask = maskb[mask];
   ;	
	mov	al,byte ptr [bp-7]
	mov	ah,0
	lea	dx,word ptr [bp-16]
	add	ax,dx
	mov	bx,ax
	mov	al,byte ptr [bx]
	mov	byte ptr [bp-7],al
   ;	
   ;				VGAMAPMASK(mask);
   ;	
	cli	
	mov	 dx,03C4H
	mov	 al,2
	mov	 ah,[bp-7]
	out	 dx,ax
	sti	
   ;	
   ;	
   ;				asm	mov	di,[drawofs]
   ;	
		mov		di,[[bp-4]]
   ;	
   ;				asm	mov	al,[es:di]
   ;	
		mov		al,[es:di]
   ;	
   ;				asm add	di,[pagedelta]
   ;	
 	add		di,[[bp-6]]
   ;	
   ;				asm	mov	[es:di],al
   ;	
		mov		[es:di],al
   ;	
   ;	
   ;				if (rndval == 1)		// entire sequence has been completed
   ;	
	cmp	word ptr [bp-24],0
	jne	short @19@1130
	cmp	word ptr [bp-26],1
	jne	short @19@1130
   ;	
   ;					return false;
   ;	
	xor	ax,ax
	jmp	short @19@1298
@19@1130:
	inc	word ptr [bp-22]
@19@1154:
	mov	ax,word ptr [bp-22]
	cmp	ax,word ptr [bp-2]
	jae	@@5
	jmp	@19@170
@@5:
   ;	
   ;			}
   ;			frame++;
   ;	
	inc	si
	jmp	short @19@1202
@19@1202:
   ;	
   ;			while (TimeCount<frame)		// don't go too fast
   ;	
	xor	ax,ax
	cmp	ax,word ptr DGROUP:_TimeCount+2
	ja	short @19@1202
	jne	short @19@1274
	cmp	si,word ptr DGROUP:_TimeCount
	ja	short @19@1202
@19@1274:
   ;	
   ;			;
   ;		} while (1);
   ;	
	jmp	@19@50
@19@1298:
   ;	
   ;	
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_FizzleFade	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_px	label	word
	db	2 dup (?)
_fontnumber	label	word
	db	2 dup (?)
_fontcolor	label	byte
	db	1 dup (?)
	db	1 dup (?)
_py	label	word
	db	2 dup (?)
_update	label	byte
	db	260 dup (?)
_pictable	label	word
	db	2 dup (?)
_backcolor	label	byte
	db	1 dup (?)
	db	1 dup (?)
_bufferheight	label	word
	db	2 dup (?)
_bufferwidth	label	word
	db	2 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'VL_MungePic: Not divisable by 4!'
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	extrn	__fmemcpy:near
	public	_VW_MeasurePropString
	public	_bufferwidth
	extrn	_freelatch:word
	public	_bufferheight
	public	_LatchDrawPic
	extrn	_grneeded:byte
	extrn	_VL_LatchToScreen:near
	extrn	_MM_FreePtr:near
	extrn	_ca_levelbit:byte
	extrn	_linewidth:word
	public	_VWB_DrawPropString
	extrn	_VH_UpdateScreen:near
	extrn	_MM_GetPtr:near
	extrn	_grsegs:word
	public	_backcolor
	public	_VWL_MeasureString
	public	_VW_DrawPropString
	extrn	_TimeCount:word
	extrn	_VL_MemToScreen:near
	public	_VW_MarkUpdateBlock
	public	_FizzleFade
	extrn	_bufferofs:word
	public	_pictable
	extrn	_latchpics:word
	extrn	_VL_MemToLatch:near
	public	_VL_MungePic
	extrn	_updateptr:word
	public	_VW_UpdateScreen
	extrn	_ylookup:word
	public	_VWB_DrawTile8
	extrn	_Quit:near
	extrn	_uwidthtable:word
	public	_update
	extrn	_VL_Plot:near
	public	_LoadLatchMem
	public	_py
	public	_VWB_DrawPic
	extrn	_VL_Vlin:near
	extrn	_VL_Hlin:near
	public	_fontcolor
	extrn	N_SCOPY@:far
	public	_fontnumber
	extrn	_VL_Bar:near
	extrn	_screenseg:word
	public	_VWB_Plot
	extrn	N_LDIV@:far
	public	_VWB_Vlin
	public	_VWB_Hlin
	public	_VWB_DrawTile8M
	extrn	_CA_CacheGrChunk:near
	public	_px
	public	_VW_DrawColorPropString
	extrn	_IN_CheckAck:near
	extrn	_IN_StartAck:near
	public	_VWB_Bar
	public	_VW_MeasureMPropString
	end
