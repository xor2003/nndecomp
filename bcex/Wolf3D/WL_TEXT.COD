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
	?debug	S "c:\wl_text.c"
	?debug	C E9E551FE7C0C633A5C776C5F746578742E63
	?debug	C E9E551FE7C08574C5F4445462E48
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
_TEXT	segment byte public 'CODE'
   ;	
   ;	void RipToEOL (void)
   ;	
	assume	cs:_TEXT
_RipToEOL	proc	near
	push	bp
	mov	bp,sp
	jmp	short @1@50
@1@50:
   ;	
   ;	{
   ;		while (*text++ != '\n')		// scan to end of line
   ;	
	les	bx,dword ptr DGROUP:_text
	inc	word ptr DGROUP:_text
	cmp	byte ptr es:[bx],10
	jne	short @1@50
   ;	
   ;		;
   ;	}
   ;	
	pop	bp
	ret	
_RipToEOL	endp
   ;	
   ;	int	ParseNumber (void)
   ;	
	assume	cs:_TEXT
_ParseNumber	proc	near
	push	bp
	mov	bp,sp
	sub	sp,82
	push	si
   ;	
   ;	{
   ;		char	ch;
   ;		char	num[80],*numptr;
   ;	
   ;	//
   ;	// scan until a number is found
   ;	//
   ;		ch = *text;
   ;	
	les	bx,dword ptr DGROUP:_text
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-1],al
	jmp	short @2@74
@2@50:
   ;	
   ;		while (ch < '0' || ch >'9')
   ;			ch = *++text;
   ;	
	inc	word ptr DGROUP:_text
	les	bx,dword ptr DGROUP:_text
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-1],al
@2@74:
	cmp	byte ptr [bp-1],48
	jl	short @2@50
	cmp	byte ptr [bp-1],57
	jg	short @2@50
   ;	
   ;	
   ;	//
   ;	// copy the number out
   ;	//
   ;		numptr = num;
   ;	
	lea	ax,word ptr [bp-82]
	mov	si,ax
@2@146:
   ;	
   ;		do
   ;		{
   ;			*numptr++ = ch;
   ;	
	mov	al,byte ptr [bp-1]
	mov	byte ptr [si],al
	inc	si
   ;	
   ;			ch = *++text;
   ;	
	inc	word ptr DGROUP:_text
	les	bx,dword ptr DGROUP:_text
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-1],al
   ;	
   ;		} while (ch >= '0' && ch <= '9');
   ;	
	cmp	byte ptr [bp-1],48
	jl	short @2@218
	cmp	byte ptr [bp-1],57
	jle	short @2@146
@2@218:
   ;	
   ;		*numptr = 0;
   ;	
	mov	byte ptr [si],0
   ;	
   ;	
   ;		return atoi (num);
   ;	
	lea	ax,word ptr [bp-82]
	push	ax
	call	near ptr _atol
	pop	cx
	jmp	short @2@242
@2@242:
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_ParseNumber	endp
   ;	
   ;	void	ParsePicCommand (void)
   ;	
	assume	cs:_TEXT
_ParsePicCommand	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		picy=ParseNumber();
   ;	
	call	near ptr _ParseNumber
	mov	word ptr DGROUP:_picy,ax
   ;	
   ;		picx=ParseNumber();
   ;	
	call	near ptr _ParseNumber
	mov	word ptr DGROUP:_picx,ax
   ;	
   ;		picnum=ParseNumber();
   ;	
	call	near ptr _ParseNumber
	mov	word ptr DGROUP:_picnum,ax
   ;	
   ;		RipToEOL ();
   ;	
	call	near ptr _RipToEOL
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_ParsePicCommand	endp
   ;	
   ;	void	ParseTimedCommand (void)
   ;	
	assume	cs:_TEXT
_ParseTimedCommand	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		picy=ParseNumber();
   ;	
	call	near ptr _ParseNumber
	mov	word ptr DGROUP:_picy,ax
   ;	
   ;		picx=ParseNumber();
   ;	
	call	near ptr _ParseNumber
	mov	word ptr DGROUP:_picx,ax
   ;	
   ;		picnum=ParseNumber();
   ;	
	call	near ptr _ParseNumber
	mov	word ptr DGROUP:_picnum,ax
   ;	
   ;		picdelay=ParseNumber();
   ;	
	call	near ptr _ParseNumber
	mov	word ptr DGROUP:_picdelay,ax
   ;	
   ;		RipToEOL ();
   ;	
	call	near ptr _RipToEOL
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_ParseTimedCommand	endp
   ;	
   ;	void	TimedPicCommand (void)
   ;	
	assume	cs:_TEXT
_TimedPicCommand	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		ParseTimedCommand ();
   ;	
	call	near ptr _ParseTimedCommand
   ;	
   ;	
   ;	//
   ;	// update the screen, and wait for time delay
   ;	//
   ;		VW_UpdateScreen ();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	
   ;	//
   ;	// wait for time
   ;	//
   ;		TimeCount = 0;
   ;	
	mov	word ptr DGROUP:_TimeCount,0
	mov	word ptr DGROUP:_TimeCount+2,0
	jmp	short @5@50
@5@50:
   ;	
   ;		while (TimeCount < picdelay)
   ;	
	mov	ax,word ptr DGROUP:_picdelay
	cwd	
	cmp	dx,word ptr DGROUP:_TimeCount+2
	ja	short @5@50
	jne	short @5@122
	cmp	ax,word ptr DGROUP:_TimeCount
	ja	short @5@50
@5@122:
   ;	
   ;		;
   ;	
   ;	//
   ;	// draw pic
   ;	//
   ;		VWB_DrawPic (picx&~7,picy,picnum);
   ;	
	push	word ptr DGROUP:_picnum
	push	word ptr DGROUP:_picy
	mov	ax,word ptr DGROUP:_picx
	and	ax,65528
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_TimedPicCommand	endp
   ;	
   ;	void HandleCommand (void)
   ;	
	assume	cs:_TEXT
_HandleCommand	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	push	si
	push	di
   ;	
   ;	{
   ;		int	i,margin,top,bottom;
   ;		int	picwidth,picheight,picmid;
   ;	
   ;		switch (toupper(*++text))
   ;	
	inc	word ptr DGROUP:_text
	les	bx,dword ptr DGROUP:_text
	mov	al,byte ptr es:[bx]
	cbw	
	push	ax
	call	near ptr _toupper
	pop	cx
	sub	ax,59
	mov	bx,ax
	cmp	bx,25
	jbe	@@0
	jmp	@6@986
@@0:
	shl	bx,1
	jmp	word ptr cs:@6@C3452[bx]
@6@98:
   ;	
   ;		{
   ;		case 'B':
   ;			picy=ParseNumber();
   ;	
	call	near ptr _ParseNumber
	mov	word ptr DGROUP:_picy,ax
   ;	
   ;			picx=ParseNumber();
   ;	
	call	near ptr _ParseNumber
	mov	word ptr DGROUP:_picx,ax
   ;	
   ;			picwidth=ParseNumber();
   ;	
	call	near ptr _ParseNumber
	mov	si,ax
   ;	
   ;			picheight=ParseNumber();
   ;	
	call	near ptr _ParseNumber
	mov	di,ax
   ;	
   ;			VWB_Bar(picx,picy,picwidth,picheight,BACKCOLOR);
   ;	
	mov	ax,17
	push	ax
	push	di
	push	si
	push	word ptr DGROUP:_picy
	push	word ptr DGROUP:_picx
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;			RipToEOL();
   ;	
	call	near ptr _RipToEOL
   ;	
   ;			break;
   ;	
	jmp	@6@986
@6@122:
   ;	
   ;		case ';':		// comment
   ;			RipToEOL();
   ;	
	call	near ptr _RipToEOL
   ;	
   ;			break;
   ;	
	jmp	@6@986
@6@146:
   ;	
   ;		case 'P':		// ^P is start of next page, ^E is end of file
   ;		case 'E':
   ;			layoutdone = true;
   ;	
	mov	word ptr DGROUP:_layoutdone,1
   ;	
   ;			text--;    	// back up to the '^'
   ;	
	dec	word ptr DGROUP:_text
   ;	
   ;			break;
   ;	
	jmp	@6@986
@6@170:
   ;	
   ;	
   ;		case 'C':		// ^c<hex digit> changes text color
   ;			i = toupper(*++text);
   ;	
	inc	word ptr DGROUP:_text
	les	bx,dword ptr DGROUP:_text
	mov	al,byte ptr es:[bx]
	cbw	
	push	ax
	call	near ptr _toupper
	pop	cx
	mov	word ptr [bp-2],ax
   ;	
   ;			if (i>='0' && i<='9')
   ;	
	cmp	word ptr [bp-2],48
	jl	short @6@242
	cmp	word ptr [bp-2],57
	jg	short @6@242
   ;	
   ;				fontcolor = i-'0';
   ;	
	mov	al,byte ptr [bp-2]
	add	al,208
	mov	byte ptr DGROUP:_fontcolor,al
	jmp	short @6@314
@6@242:
   ;	
   ;			else if (i>='A' && i<='F')
   ;	
	cmp	word ptr [bp-2],65
	jl	short @6@314
	cmp	word ptr [bp-2],70
	jg	short @6@314
   ;	
   ;				fontcolor = i-'A'+10;
   ;	
	mov	al,byte ptr [bp-2]
	add	al,201
	mov	byte ptr DGROUP:_fontcolor,al
@6@314:
   ;	
   ;	
   ;			fontcolor *= 16;
   ;	
	mov	al,byte ptr DGROUP:_fontcolor
	mov	cl,4
	shl	al,cl
	mov	byte ptr DGROUP:_fontcolor,al
   ;	
   ;			i = toupper(*++text);
   ;	
	inc	word ptr DGROUP:_text
	les	bx,dword ptr DGROUP:_text
	mov	al,byte ptr es:[bx]
	cbw	
	push	ax
	call	near ptr _toupper
	pop	cx
	mov	word ptr [bp-2],ax
   ;	
   ;			if (i>='0' && i<='9')
   ;	
	cmp	word ptr [bp-2],48
	jl	short @6@386
	cmp	word ptr [bp-2],57
	jg	short @6@386
   ;	
   ;				fontcolor += i-'0';
   ;	
	mov	al,byte ptr [bp-2]
	add	al,byte ptr DGROUP:_fontcolor
	add	al,208
	mov	byte ptr DGROUP:_fontcolor,al
	jmp	short @6@458
@6@386:
   ;	
   ;			else if (i>='A' && i<='F')
   ;	
	cmp	word ptr [bp-2],65
	jl	short @6@458
	cmp	word ptr [bp-2],70
	jg	short @6@458
   ;	
   ;				fontcolor += i-'A'+10;
   ;	
	mov	al,byte ptr [bp-2]
	add	al,byte ptr DGROUP:_fontcolor
	add	al,201
	mov	byte ptr DGROUP:_fontcolor,al
@6@458:
   ;	
   ;			text++;
   ;	
	inc	word ptr DGROUP:_text
   ;	
   ;			break;
   ;	
	jmp	@6@986
@6@482:
   ;	
   ;	
   ;		case '>':
   ;			px = 160;
   ;	
	mov	word ptr DGROUP:_px,160
   ;	
   ;			text++;
   ;	
	inc	word ptr DGROUP:_text
   ;	
   ;			break;
   ;	
	jmp	@6@986
@6@506:
   ;	
   ;	
   ;		case 'L':
   ;			py=ParseNumber();
   ;	
	call	near ptr _ParseNumber
	mov	word ptr DGROUP:_py,ax
   ;	
   ;			rowon = (py-TOPMARGIN)/FONTHEIGHT;
   ;	
	mov	ax,word ptr DGROUP:_py
	add	ax,65520
	mov	bx,10
	cwd	
	idiv	bx
	mov	word ptr DGROUP:_rowon,ax
   ;	
   ;			py = TOPMARGIN+rowon*FONTHEIGHT;
   ;	
	mov	ax,word ptr DGROUP:_rowon
	mov	dx,10
	imul	dx
	add	ax,16
	mov	word ptr DGROUP:_py,ax
   ;	
   ;			px=ParseNumber();
   ;	
	call	near ptr _ParseNumber
	mov	word ptr DGROUP:_px,ax
	jmp	short @6@530
@6@530:
   ;	
   ;			while (*text++ != '\n')		// scan to end of line
   ;	
	les	bx,dword ptr DGROUP:_text
	inc	word ptr DGROUP:_text
	cmp	byte ptr es:[bx],10
	jne	short @6@530
   ;	
   ;			;
   ;			break;
   ;	
	jmp	@6@986
@6@578:
   ;	
   ;	
   ;		case 'T':		// ^Tyyy,xxx,ppp,ttt waits ttt tics, then draws pic
   ;			TimedPicCommand ();
   ;	
	call	near ptr _TimedPicCommand
   ;	
   ;			break;
   ;	
	jmp	@6@986
@6@602:
   ;	
   ;	
   ;		case 'G':		// ^Gyyy,xxx,ppp draws graphic
   ;			ParsePicCommand ();
   ;	
	call	near ptr _ParsePicCommand
   ;	
   ;			VWB_DrawPic (picx&~7,picy,picnum);
   ;	
	push	word ptr DGROUP:_picnum
	push	word ptr DGROUP:_picy
	mov	ax,word ptr DGROUP:_picx
	and	ax,65528
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;			picwidth = pictable[picnum-STARTPICS].width;
   ;	
	mov	bx,word ptr DGROUP:_picnum
	add	bx,65533
	shl	bx,1
	shl	bx,1
	mov	es,word ptr DGROUP:_pictable
	mov	si,word ptr es:[bx]
   ;	
   ;			picheight = pictable[picnum-STARTPICS].height;
   ;	
	mov	bx,word ptr DGROUP:_picnum
	add	bx,65533
	shl	bx,1
	shl	bx,1
	mov	es,word ptr DGROUP:_pictable
	mov	di,word ptr es:[bx+2]
   ;	
   ;			//
   ;			// adjust margins
   ;			//
   ;			picmid = picx + picwidth/2;
   ;	
	mov	ax,si
	mov	bx,2
	cwd	
	idiv	bx
	mov	dx,word ptr DGROUP:_picx
	add	dx,ax
	mov	word ptr [bp-10],dx
   ;	
   ;			if (picmid > SCREENMID)
   ;	
	cmp	word ptr [bp-10],160
	jle	short @6@650
   ;	
   ;				margin = picx-PICMARGIN;			// new right margin
   ;	
	mov	ax,word ptr DGROUP:_picx
	add	ax,65528
	mov	word ptr [bp-4],ax
	jmp	short @6@674
@6@650:
   ;	
   ;			else
   ;				margin = picx+picwidth+PICMARGIN;	// new left margin
   ;	
	mov	ax,word ptr DGROUP:_picx
	add	ax,si
	add	ax,8
	mov	word ptr [bp-4],ax
@6@674:
   ;	
   ;	
   ;			top = (picy-TOPMARGIN)/FONTHEIGHT;
   ;	
	mov	ax,word ptr DGROUP:_picy
	add	ax,65520
	mov	bx,10
	cwd	
	idiv	bx
	mov	word ptr [bp-6],ax
   ;	
   ;			if (top<0)
   ;	
	cmp	word ptr [bp-6],0
	jge	short @6@722
   ;	
   ;				top = 0;
   ;	
	mov	word ptr [bp-6],0
@6@722:
   ;	
   ;			bottom = (picy+picheight-TOPMARGIN)/FONTHEIGHT;
   ;	
	mov	ax,word ptr DGROUP:_picy
	add	ax,di
	add	ax,65520
	mov	bx,10
	cwd	
	idiv	bx
	mov	word ptr [bp-8],ax
   ;	
   ;			if (bottom>=TEXTROWS)
   ;	
	cmp	word ptr [bp-8],15
	jl	short @6@770
   ;	
   ;				bottom = TEXTROWS-1;
   ;	
	mov	word ptr [bp-8],14
@6@770:
   ;	
   ;	
   ;			for (i=top;i<=bottom;i++)
   ;	
	mov	ax,word ptr [bp-6]
	mov	word ptr [bp-2],ax
	jmp	short @6@890
@6@794:
   ;	
   ;				if (picmid > SCREENMID)
   ;	
	cmp	word ptr [bp-10],160
	jle	short @6@842
   ;	
   ;					rightmargin[i] = margin;
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	mov	ax,word ptr [bp-4]
	mov	word ptr DGROUP:_rightmargin[bx],ax
	jmp	short @6@866
@6@842:
   ;	
   ;				else
   ;					leftmargin[i] = margin;
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	mov	ax,word ptr [bp-4]
	mov	word ptr DGROUP:_leftmargin[bx],ax
@6@866:
	inc	word ptr [bp-2]
@6@890:
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp-8]
	jle	short @6@794
   ;	
   ;	
   ;			//
   ;			// adjust this line if needed
   ;			//
   ;			if (px < leftmargin[rowon])
   ;	
	mov	bx,word ptr DGROUP:_rowon
	shl	bx,1
	mov	ax,word ptr DGROUP:_leftmargin[bx]
	cmp	ax,word ptr DGROUP:_px
	jbe	short @6@962
   ;	
   ;				px = leftmargin[rowon];
   ;	
	mov	bx,word ptr DGROUP:_rowon
	shl	bx,1
	mov	ax,word ptr DGROUP:_leftmargin[bx]
	mov	word ptr DGROUP:_px,ax
@6@962:
   ;	
   ;			break;
   ;	
	jmp	short @6@986
@6@986:
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_HandleCommand	endp
@6@C3452	label	word
	dw	@6@122
	dw	@6@986
	dw	@6@986
	dw	@6@482
	dw	@6@986
	dw	@6@986
	dw	@6@986
	dw	@6@98
	dw	@6@170
	dw	@6@986
	dw	@6@146
	dw	@6@986
	dw	@6@602
	dw	@6@986
	dw	@6@986
	dw	@6@986
	dw	@6@986
	dw	@6@506
	dw	@6@986
	dw	@6@986
	dw	@6@986
	dw	@6@146
	dw	@6@986
	dw	@6@986
	dw	@6@986
	dw	@6@578
   ;	
   ;	void NewLine (void)
   ;	
	assume	cs:_TEXT
_NewLine	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
   ;	
   ;	{
   ;		char	ch;
   ;	
   ;		if (++rowon == TEXTROWS)
   ;	
	inc	word ptr DGROUP:_rowon
	mov	ax,word ptr DGROUP:_rowon
	cmp	ax,15
	jne	short @7@218
   ;	
   ;		{
   ;		//
   ;		// overflowed the page, so skip until next page break
   ;		//
   ;			layoutdone = true;
   ;	
	mov	word ptr DGROUP:_layoutdone,1
@7@74:
   ;	
   ;			do
   ;			{
   ;				if (*text == '^')
   ;	
	les	bx,dword ptr DGROUP:_text
	cmp	byte ptr es:[bx],94
	jne	short @7@170
   ;	
   ;				{
   ;					ch = toupper(*(text+1));
   ;	
	les	bx,dword ptr DGROUP:_text
	mov	al,byte ptr es:[bx+1]
	cbw	
	push	ax
	call	near ptr _toupper
	pop	cx
	mov	byte ptr [bp-1],al
   ;	
   ;					if (ch == 'E' || ch == 'P')
   ;	
	cmp	byte ptr [bp-1],69
	je	short @7@146
	cmp	byte ptr [bp-1],80
	jne	short @7@170
@7@146:
   ;	
   ;					{
   ;						layoutdone = true;
   ;	
	mov	word ptr DGROUP:_layoutdone,1
   ;	
   ;						return;
   ;	
	jmp	short @7@242
@7@170:
   ;	
   ;					}
   ;				}
   ;				text++;
   ;	
	inc	word ptr DGROUP:_text
   ;	
   ;	
   ;			} while (1);
   ;	
	jmp	short @7@74
@7@218:
   ;	
   ;	
   ;		}
   ;		px = leftmargin[rowon];
   ;	
	mov	bx,word ptr DGROUP:_rowon
	shl	bx,1
	mov	ax,word ptr DGROUP:_leftmargin[bx]
	mov	word ptr DGROUP:_px,ax
   ;	
   ;		py+= FONTHEIGHT;
   ;	
	add	word ptr DGROUP:_py,10
@7@242:
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_NewLine	endp
   ;	
   ;	void HandleCtrls (void)
   ;	
	assume	cs:_TEXT
_HandleCtrls	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
   ;	
   ;	{
   ;		char	ch;
   ;	
   ;		ch = *text++;			// get the character and advance
   ;	
	les	bx,dword ptr DGROUP:_text
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-1],al
	inc	word ptr DGROUP:_text
   ;	
   ;	
   ;		if (ch == '\n')
   ;	
	cmp	byte ptr [bp-1],10
	jne	short @8@74
   ;	
   ;		{
   ;			NewLine ();
   ;	
	call	near ptr _NewLine
   ;	
   ;			return;
   ;	
	jmp	short @8@74
@8@74:
   ;	
   ;		}
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_HandleCtrls	endp
   ;	
   ;	void HandleWord (void)
   ;	
	assume	cs:_TEXT
_HandleWord	proc	near
	push	bp
	mov	bp,sp
	sub	sp,84
	push	si
	push	di
   ;	
   ;	{
   ;		char		word[WORDLIMIT];
   ;		int			i,wordindex;
   ;		unsigned	wwidth,wheight,newpos;
   ;	
   ;	
   ;		//
   ;		// copy the next word into [word]
   ;		//
   ;		word[0] = *text++;
   ;	
	les	bx,dword ptr DGROUP:_text
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-84],al
	inc	word ptr DGROUP:_text
   ;	
   ;		wordindex = 1;
   ;	
	mov	si,1
	jmp	short @9@98
@9@50:
   ;	
   ;		while (*text>32)
   ;		{
   ;			word[wordindex] = *text++;
   ;	
	les	bx,dword ptr DGROUP:_text
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp+si-84],al
	inc	word ptr DGROUP:_text
   ;	
   ;			if (++wordindex == WORDLIMIT)
   ;	
	inc	si
	mov	ax,si
	cmp	ax,80
	jne	short @9@98
   ;	
   ;				Quit ("PageLayout: Word limit exceeded");
   ;	
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _Quit
	pop	cx
@9@98:
	les	bx,dword ptr DGROUP:_text
	cmp	byte ptr es:[bx],32
	jg	short @9@50
   ;	
   ;		}
   ;		word[wordindex] = 0;		// stick a null at end for C
   ;	
	mov	byte ptr [bp+si-84],0
   ;	
   ;	
   ;		//
   ;		// see if it fits on this line
   ;		//
   ;		VW_MeasurePropString (word,&wwidth,&wheight);
   ;	
	lea	ax,word ptr [bp-4]
	push	ax
	lea	ax,word ptr [bp-2]
	push	ax
	push	ss
	lea	ax,word ptr [bp-84]
	push	ax
	call	near ptr _VW_MeasurePropString
	add	sp,8
	jmp	short @9@194
@9@146:
   ;	
   ;	
   ;		while (px+wwidth > rightmargin[rowon])
   ;		{
   ;			NewLine ();
   ;	
	call	near ptr _NewLine
   ;	
   ;			if (layoutdone)
   ;	
	cmp	word ptr DGROUP:_layoutdone,0
	je	short @9@194
   ;	
   ;				return;		// overflowed page
   ;	
	jmp	short @9@290
@9@194:
	mov	bx,word ptr DGROUP:_rowon
	shl	bx,1
	mov	ax,word ptr DGROUP:_px
	add	ax,word ptr [bp-2]
	cmp	word ptr DGROUP:_rightmargin[bx],ax
	jb	short @9@146
   ;	
   ;		}
   ;	
   ;		//
   ;		// print it
   ;		//
   ;		newpos = px+wwidth;
   ;	
	mov	ax,word ptr DGROUP:_px
	add	ax,word ptr [bp-2]
	mov	di,ax
   ;	
   ;		VWB_DrawPropString (word);
   ;	
	push	ss
	lea	ax,word ptr [bp-84]
	push	ax
	call	near ptr _VWB_DrawPropString
	pop	cx
	pop	cx
   ;	
   ;		px = newpos;
   ;	
	mov	word ptr DGROUP:_px,di
	jmp	short @9@266
@9@242:
   ;	
   ;	
   ;		//
   ;		// suck up any extra spaces
   ;		//
   ;		while (*text == ' ')
   ;		{
   ;			px += SPACEWIDTH;
   ;	
	add	word ptr DGROUP:_px,7
   ;	
   ;			text++;
   ;	
	inc	word ptr DGROUP:_text
@9@266:
	les	bx,dword ptr DGROUP:_text
	cmp	byte ptr es:[bx],32
	je	short @9@242
@9@290:
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_HandleWord	endp
   ;	
   ;	void PageLayout (boolean shownumber)
   ;	
	assume	cs:_TEXT
_PageLayout	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
   ;	
   ;	{
   ;		int		i,oldfontcolor;
   ;		char	ch;
   ;	
   ;		oldfontcolor = fontcolor;
   ;	
	mov	al,byte ptr DGROUP:_fontcolor
	mov	ah,0
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;		fontcolor = 0;
   ;	
	mov	byte ptr DGROUP:_fontcolor,0
   ;	
   ;	
   ;	//
   ;	// clear the screen
   ;	//
   ;		VWB_Bar (0,0,320,200,BACKCOLOR);
   ;	
	mov	ax,17
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
   ;		VWB_DrawPic (0,0,H_TOPWINDOWPIC);
   ;	
	mov	ax,6
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		VWB_DrawPic (0,8,H_LEFTWINDOWPIC);
   ;	
	mov	ax,7
	push	ax
	mov	ax,8
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		VWB_DrawPic (312,8,H_RIGHTWINDOWPIC);
   ;	
	mov	ax,8
	push	ax
	mov	ax,8
	push	ax
	mov	ax,312
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		VWB_DrawPic (8,176,H_BOTTOMINFOPIC);
   ;	
	mov	ax,9
	push	ax
	mov	ax,176
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;	
   ;	
   ;		for (i=0;i<TEXTROWS;i++)
   ;	
	xor	si,si
	jmp	short @10@98
@10@50:
   ;	
   ;		{
   ;			leftmargin[i] = LEFTMARGIN;
   ;	
	mov	bx,si
	shl	bx,1
	mov	word ptr DGROUP:_leftmargin[bx],16
   ;	
   ;			rightmargin[i] = SCREENPIXWIDTH-RIGHTMARGIN;
   ;	
	mov	bx,si
	shl	bx,1
	mov	word ptr DGROUP:_rightmargin[bx],304
	inc	si
@10@98:
	cmp	si,15
	jl	short @10@50
   ;	
   ;		}
   ;	
   ;		px = LEFTMARGIN;
   ;	
	mov	word ptr DGROUP:_px,16
   ;	
   ;		py = TOPMARGIN;
   ;	
	mov	word ptr DGROUP:_py,16
   ;	
   ;		rowon = 0;
   ;	
	mov	word ptr DGROUP:_rowon,0
   ;	
   ;		layoutdone = false;
   ;	
	mov	word ptr DGROUP:_layoutdone,0
	jmp	short @10@170
@10@146:
   ;	
   ;	
   ;	//
   ;	// make sure we are starting layout text (^P first command)
   ;	//
   ;		while (*text <= 32)
   ;			text++;
   ;	
	inc	word ptr DGROUP:_text
@10@170:
	les	bx,dword ptr DGROUP:_text
	cmp	byte ptr es:[bx],32
	jle	short @10@146
   ;	
   ;	
   ;		if (*text != '^' || toupper(*++text) != 'P')
   ;	
	les	bx,dword ptr DGROUP:_text
	cmp	byte ptr es:[bx],94
	jne	short @10@242
	inc	word ptr DGROUP:_text
	les	bx,dword ptr DGROUP:_text
	mov	al,byte ptr es:[bx]
	cbw	
	push	ax
	call	near ptr _toupper
	pop	cx
	cmp	ax,80
	je	short @10@266
@10@242:
   ;	
   ;			Quit ("PageLayout: Text not headed with ^P");
   ;	
	mov	ax,offset DGROUP:s@+32
	push	ax
	call	near ptr _Quit
	pop	cx
@10@266:
	jmp	short @10@290
@10@290:
   ;	
   ;	
   ;		while (*text++ != '\n')
   ;	
	les	bx,dword ptr DGROUP:_text
	inc	word ptr DGROUP:_text
	cmp	byte ptr es:[bx],10
	jne	short @10@290
@10@314:
   ;	
   ;		;
   ;	
   ;	
   ;	//
   ;	// process text stream
   ;	//
   ;		do
   ;		{
   ;			ch = *text;
   ;	
	les	bx,dword ptr DGROUP:_text
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-3],al
   ;	
   ;	
   ;			if (ch == '^')
   ;	
	cmp	byte ptr [bp-3],94
	jne	short @10@362
   ;	
   ;				HandleCommand ();
   ;	
	call	near ptr _HandleCommand
	jmp	short @10@482
@10@362:
   ;	
   ;			else
   ;			if (ch == 9)
   ;	
	cmp	byte ptr [bp-3],9
	jne	short @10@410
   ;	
   ;			{
   ;			 px = (px+8)&0xf8;
   ;	
	mov	ax,word ptr DGROUP:_px
	add	ax,8
	and	ax,248
	mov	word ptr DGROUP:_px,ax
   ;	
   ;			 text++;
   ;	
	inc	word ptr DGROUP:_text
   ;	
   ;			}
   ;	
	jmp	short @10@482
@10@410:
   ;	
   ;			else if (ch <= 32)
   ;	
	cmp	byte ptr [bp-3],32
	jg	short @10@458
   ;	
   ;				HandleCtrls ();
   ;	
	call	near ptr _HandleCtrls
	jmp	short @10@482
@10@458:
   ;	
   ;			else
   ;				HandleWord ();
   ;	
	call	near ptr _HandleWord
@10@482:
   ;	
   ;	
   ;		} while (!layoutdone);
   ;	
	cmp	word ptr DGROUP:_layoutdone,0
	je	short @10@314
   ;	
   ;	
   ;		pagenum++;
   ;	
	inc	word ptr DGROUP:_pagenum
   ;	
   ;	
   ;		if (shownumber)
   ;	
	cmp	word ptr [bp+4],0
	jne	@@1
	jmp	@10@554
@@1:
   ;	
   ;		{
   ;			#ifdef SPANISH
   ;			strcpy (str,"Hoja ");
   ;			itoa (pagenum,str2,10);
   ;			strcat (str,str2);
   ;			strcat (str," de ");
   ;			py = 183;
   ;			px = 208;
   ;			#else
   ;			strcpy (str,"pg ");
   ;	
	mov	ax,offset DGROUP:s@+68
	push	ax
	mov	ax,offset DGROUP:_str
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;			itoa (pagenum,str2,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,offset DGROUP:_str2
	push	ax
	push	word ptr DGROUP:_pagenum
	call	near ptr _itoa
	add	sp,6
   ;	
   ;			strcat (str,str2);
   ;	
	mov	ax,offset DGROUP:_str2
	push	ax
	mov	ax,offset DGROUP:_str
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;			strcat (str," of ");
   ;	
	mov	ax,offset DGROUP:s@+72
	push	ax
	mov	ax,offset DGROUP:_str
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;			py = 183;
   ;	
	mov	word ptr DGROUP:_py,183
   ;	
   ;			px = 213;
   ;	
	mov	word ptr DGROUP:_px,213
   ;	
   ;			#endif
   ;			itoa (numpages,str2,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,offset DGROUP:_str2
	push	ax
	push	word ptr DGROUP:_numpages
	call	near ptr _itoa
	add	sp,6
   ;	
   ;			strcat (str,str2);
   ;	
	mov	ax,offset DGROUP:_str2
	push	ax
	mov	ax,offset DGROUP:_str
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;			fontcolor = 0x4f; 			   //12^BACKCOLOR;
   ;	
	mov	byte ptr DGROUP:_fontcolor,79
   ;	
   ;	
   ;			VWB_DrawPropString (str);
   ;	
	push	ds
	mov	ax,offset DGROUP:_str
	push	ax
	call	near ptr _VWB_DrawPropString
	pop	cx
	pop	cx
@10@554:
   ;	
   ;		}
   ;	
   ;		fontcolor = oldfontcolor;
   ;	
	mov	al,byte ptr [bp-2]
	mov	byte ptr DGROUP:_fontcolor,al
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PageLayout	endp
   ;	
   ;	void BackPage (void)
   ;	
	assume	cs:_TEXT
_BackPage	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		pagenum--;
   ;	
	dec	word ptr DGROUP:_pagenum
@11@50:
   ;	
   ;		do
   ;		{
   ;			text--;
   ;	
	dec	word ptr DGROUP:_text
   ;	
   ;			if (*text == '^' && toupper(*(text+1)) == 'P')
   ;	
	les	bx,dword ptr DGROUP:_text
	cmp	byte ptr es:[bx],94
	jne	short @11@122
	les	bx,dword ptr DGROUP:_text
	mov	al,byte ptr es:[bx+1]
	cbw	
	push	ax
	call	near ptr _toupper
	pop	cx
	cmp	ax,80
	jne	short @11@122
   ;	
   ;				return;
   ;	
	jmp	short @11@146
@11@122:
   ;	
   ;		} while (1);
   ;	
	jmp	short @11@50
@11@146:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_BackPage	endp
   ;	
   ;	void CacheLayoutGraphics (void)
   ;	
	assume	cs:_TEXT
_CacheLayoutGraphics	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
   ;	
   ;	{
   ;		char	far *bombpoint, far *textstart;
   ;		char	ch;
   ;	
   ;		textstart = text;
   ;	
	mov	ax,word ptr DGROUP:_text+2
	mov	dx,word ptr DGROUP:_text
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;		bombpoint = text+30000;
   ;	
	mov	ax,word ptr DGROUP:_text+2
	mov	dx,word ptr DGROUP:_text
	add	dx,30000
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;		numpages = pagenum = 0;
   ;	
	xor	ax,ax
	mov	word ptr DGROUP:_pagenum,ax
	mov	word ptr DGROUP:_numpages,ax
@12@50:
   ;	
   ;	
   ;		do
   ;		{
   ;			if (*text == '^')
   ;	
	les	bx,dword ptr DGROUP:_text
	cmp	byte ptr es:[bx],94
	je	@@2
	jmp	@12@290
@@2:
   ;	
   ;			{
   ;				ch = toupper(*++text);
   ;	
	inc	word ptr DGROUP:_text
	les	bx,dword ptr DGROUP:_text
	mov	al,byte ptr es:[bx]
	cbw	
	push	ax
	call	near ptr _toupper
	pop	cx
	mov	byte ptr [bp-9],al
   ;	
   ;				if (ch == 'P')		// start of a page
   ;	
	cmp	byte ptr [bp-9],80
	jne	short @12@122
   ;	
   ;					numpages++;
   ;	
	inc	word ptr DGROUP:_numpages
@12@122:
   ;	
   ;				if (ch == 'E')		// end of file, so load graphics and return
   ;	
	cmp	byte ptr [bp-9],69
	jne	short @12@170
   ;	
   ;				{
   ;					CA_MarkGrChunk(H_TOPWINDOWPIC);
   ;	
	mov	ax,seg _grneeded
	mov	dl,byte ptr DGROUP:_ca_levelbit
	mov	es,ax
	or	byte ptr es:_grneeded+6,dl
   ;	
   ;					CA_MarkGrChunk(H_LEFTWINDOWPIC);
   ;	
	mov	ax,seg _grneeded
	mov	dl,byte ptr DGROUP:_ca_levelbit
	mov	es,ax
	or	byte ptr es:_grneeded+7,dl
   ;	
   ;					CA_MarkGrChunk(H_RIGHTWINDOWPIC);
   ;	
	mov	ax,seg _grneeded
	mov	dl,byte ptr DGROUP:_ca_levelbit
	mov	es,ax
	or	byte ptr es:_grneeded+8,dl
   ;	
   ;					CA_MarkGrChunk(H_BOTTOMINFOPIC);
   ;	
	mov	ax,seg _grneeded
	mov	dl,byte ptr DGROUP:_ca_levelbit
	mov	es,ax
	or	byte ptr es:_grneeded+9,dl
   ;	
   ;					CA_CacheMarks ();
   ;	
	call	near ptr _CA_CacheMarks
   ;	
   ;					text = textstart;
   ;	
	mov	ax,word ptr [bp-6]
	mov	dx,word ptr [bp-8]
	mov	word ptr DGROUP:_text,dx
	mov	word ptr DGROUP:_text+2,ax
   ;	
   ;					return;
   ;	
	jmp	short @12@362
@12@170:
   ;	
   ;				}
   ;				if (ch == 'G')		// draw graphic command, so mark graphics
   ;	
	cmp	byte ptr [bp-9],71
	jne	short @12@218
   ;	
   ;				{
   ;					ParsePicCommand ();
   ;	
	call	near ptr _ParsePicCommand
   ;	
   ;					CA_MarkGrChunk (picnum);
   ;	
	mov	ax,seg _grneeded
	mov	bx,word ptr DGROUP:_picnum
	mov	dl,byte ptr DGROUP:_ca_levelbit
	mov	es,ax
	or	byte ptr es:_grneeded[bx],dl
@12@218:
   ;	
   ;				}
   ;				if (ch == 'T')		// timed draw graphic command, so mark graphics
   ;	
	cmp	byte ptr [bp-9],84
	jne	short @12@266
   ;	
   ;				{
   ;					ParseTimedCommand ();
   ;	
	call	near ptr _ParseTimedCommand
   ;	
   ;					CA_MarkGrChunk (picnum);
   ;	
	mov	ax,seg _grneeded
	mov	bx,word ptr DGROUP:_picnum
	mov	dl,byte ptr DGROUP:_ca_levelbit
	mov	es,ax
	or	byte ptr es:_grneeded[bx],dl
@12@266:
   ;	
   ;				}
   ;			}
   ;	
	jmp	short @12@314
@12@290:
   ;	
   ;			else
   ;				text++;
   ;	
	inc	word ptr DGROUP:_text
@12@314:
   ;	
   ;	
   ;		} while (text<bombpoint);
   ;	
	mov	ax,word ptr DGROUP:_text
	cmp	ax,word ptr [bp-4]
	jae	@@3
	jmp	@12@50
@@3:
   ;	
   ;	
   ;		Quit ("CacheLayoutGraphics: No ^E to terminate file!");
   ;	
	mov	ax,offset DGROUP:s@+77
	push	ax
	call	near ptr _Quit
	pop	cx
@12@362:
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_CacheLayoutGraphics	endp
   ;	
   ;	void ShowArticle (char far *article)
   ;	
	assume	cs:_TEXT
_ShowArticle	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
   ;	
   ;	#endif
   ;	{
   ;		#ifdef JAPAN
   ;		int		snames[10] = {	H_HELP1PIC,
   ;								H_HELP2PIC,
   ;								H_HELP3PIC,
   ;								H_HELP4PIC,
   ;								H_HELP5PIC,
   ;								H_HELP6PIC,
   ;								H_HELP7PIC,
   ;								H_HELP8PIC,
   ;								H_HELP9PIC,
   ;								H_HELP10PIC};
   ;		int		enames[14] = {
   ;								0,0,
   ;								#ifndef JAPDEMO
   ;								C_ENDGAME1APIC,
   ;								C_ENDGAME1BPIC,
   ;								C_ENDGAME2APIC,
   ;								C_ENDGAME2BPIC,
   ;								C_ENDGAME3APIC,
   ;								C_ENDGAME3BPIC,
   ;								C_ENDGAME4APIC,
   ;								C_ENDGAME4BPIC,
   ;								C_ENDGAME5APIC,
   ;								C_ENDGAME5BPIC,
   ;								C_ENDGAME6APIC,
   ;								C_ENDGAME6BPIC
   ;								#endif
   ;								};
   ;		#endif
   ;		unsigned	oldfontnumber;
   ;		unsigned	temp;
   ;		boolean 	newpage,firstpage;
   ;	
   ;		#ifdef JAPAN
   ;		pagenum = 1;
   ;		if (!which)
   ;			numpages = 10;
   ;		else
   ;			numpages = 2;
   ;	
   ;		#else
   ;	
   ;		text = article;
   ;	
	mov	ax,word ptr [bp+6]
	mov	dx,word ptr [bp+4]
	mov	word ptr DGROUP:_text,dx
	mov	word ptr DGROUP:_text+2,ax
   ;	
   ;		oldfontnumber = fontnumber;
   ;	
	mov	ax,word ptr DGROUP:_fontnumber
	mov	word ptr [bp-2],ax
   ;	
   ;		fontnumber = 0;
   ;	
	mov	word ptr DGROUP:_fontnumber,0
   ;	
   ;		CA_MarkGrChunk(STARTFONT);
   ;	
	mov	ax,seg _grneeded
	mov	dl,byte ptr DGROUP:_ca_levelbit
	mov	es,ax
	or	byte ptr es:_grneeded+1,dl
   ;	
   ;		VWB_Bar (0,0,320,200,BACKCOLOR);
   ;	
	mov	ax,17
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
   ;		CacheLayoutGraphics ();
   ;	
	call	near ptr _CacheLayoutGraphics
   ;	
   ;		#endif
   ;	
   ;		newpage = true;
   ;	
	mov	si,1
   ;	
   ;		firstpage = true;
   ;	
	mov	di,1
@13@50:
   ;	
   ;	
   ;		do
   ;		{
   ;			if (newpage)
   ;	
	or	si,si
	je	short @13@122
   ;	
   ;			{
   ;				newpage = false;
   ;	
	xor	si,si
   ;	
   ;				#ifdef JAPAN
   ;				if (!which)
   ;					CA_CacheScreen(snames[pagenum - 1]);
   ;				else
   ;					CA_CacheScreen(enames[which*2 + pagenum - 1]);
   ;				#else
   ;				PageLayout (true);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _PageLayout
	pop	cx
   ;	
   ;				#endif
   ;				VW_UpdateScreen ();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;				if (firstpage)
   ;	
	or	di,di
	je	short @13@122
   ;	
   ;				{
   ;					VL_FadeIn(0,255,&gamepal,10);
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
   ;					// VW_FadeIn ()
   ;					firstpage = false;
   ;	
	xor	di,di
@13@122:
   ;	
   ;				}
   ;			}
   ;	
   ;			LastScan = 0;
   ;	
	mov	byte ptr DGROUP:_LastScan,0
	jmp	short @13@146
@13@146:
   ;	
   ;			while (!LastScan)
   ;	
	mov	al,byte ptr DGROUP:_LastScan
	mov	ah,0
	or	ax,ax
	je	short @13@146
   ;	
   ;			;
   ;	
   ;			switch (LastScan)
   ;	
	mov	al,byte ptr DGROUP:_LastScan
	mov	ah,0
	mov	word ptr [bp-4],ax
	mov	cx,7
	mov	bx,offset @13@C1934
@13@218:
	mov	ax,word ptr cs:[bx]
	cmp	ax,word ptr [bp-4]
	je	short @13@290
	inc	bx
	inc	bx
	loop	short @13@218
	jmp	short @13@458
@13@290:
	jmp	word ptr cs:[bx+14]
@13@314:
   ;	
   ;			{
   ;			case sc_UpArrow:
   ;			case sc_PgUp:
   ;			case sc_LeftArrow:
   ;				if (pagenum>1)
   ;	
	cmp	word ptr DGROUP:_pagenum,1
	jle	short @13@362
   ;	
   ;				{
   ;					#ifndef JAPAN
   ;					BackPage ();
   ;	
	call	near ptr _BackPage
   ;	
   ;					BackPage ();
   ;	
	call	near ptr _BackPage
   ;	
   ;					#else
   ;					pagenum--;
   ;					#endif
   ;					newpage = true;
   ;	
	mov	si,1
@13@362:
   ;	
   ;				}
   ;				break;
   ;	
	jmp	short @13@458
@13@386:
   ;	
   ;	
   ;			case sc_Enter:
   ;			case sc_DownArrow:
   ;			case sc_PgDn:
   ;			case sc_RightArrow:		// the text allready points at next page
   ;				if (pagenum<numpages)
   ;	
	mov	ax,word ptr DGROUP:_pagenum
	cmp	ax,word ptr DGROUP:_numpages
	jge	short @13@434
   ;	
   ;				{
   ;					newpage = true;
   ;	
	mov	si,1
@13@434:
   ;	
   ;					#ifdef JAPAN
   ;					pagenum++;
   ;					#endif
   ;				}
   ;				break;
   ;	
	jmp	short @13@458
@13@458:
   ;	
   ;			}
   ;	
   ;			#ifndef SPEAR
   ;			if (Keyboard[sc_Tab] && Keyboard[sc_P] && MS_CheckParm("goobers"))
   ;	
	cmp	word ptr DGROUP:_Keyboard+30,0
	je	short @13@554
	cmp	word ptr DGROUP:_Keyboard+50,0
	je	short @13@554
	push	ds
	mov	ax,offset DGROUP:s@+123
	push	ax
	call	near ptr _MS_CheckParm
	pop	cx
	pop	cx
	or	ax,ax
	je	short @13@554
   ;	
   ;				PicturePause();
   ;	
	call	near ptr _PicturePause
@13@554:
   ;	
   ;			#endif
   ;	
   ;		} while (LastScan != sc_Escape);
   ;	
	cmp	byte ptr DGROUP:_LastScan,1
	je	@@4
	jmp	@13@50
@@4:
   ;	
   ;	
   ;		IN_ClearKeysDown ();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;		fontnumber = oldfontnumber;
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr DGROUP:_fontnumber,ax
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_ShowArticle	endp
@13@C1934	label	word
	db	28
	db	0
	db	72
	db	0
	db	73
	db	0
	db	75
	db	0
	db	77
	db	0
	db	80
	db	0
	db	81
	db	0
	dw	@13@386
	dw	@13@314
	dw	@13@314
	dw	@13@314
	dw	@13@386
	dw	@13@386
	dw	@13@386
_TEXT	ends
_DATA	segment word public 'DATA'
_endextern	label	word
	db	143
	db	0
_helpextern	label	word
	db	138
	db	0
_helpfilename	label	byte
	db	72
	db	69
	db	76
	db	80
	db	65
	db	82
	db	84
	db	46
	db	5 dup (0)
_endfilename	label	byte
	db	69
	db	78
	db	68
	db	65
	db	82
	db	84
	db	49
	db	46
	db	5 dup (0)
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void HelpScreens (void)
   ;	
	assume	cs:_TEXT
_HelpScreens	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
   ;	
   ;	{
   ;		int			artnum;
   ;		char far 	*text;
   ;		memptr		layout;
   ;	
   ;	
   ;		CA_UpLevel ();
   ;	
	call	near ptr _CA_UpLevel
   ;	
   ;		MM_SortMem ();
   ;	
	call	near ptr _MM_SortMem
   ;	
   ;	#ifdef JAPAN
   ;		ShowArticle (0);
   ;		VW_FadeOut();
   ;		FreeMusic ();
   ;		CA_DownLevel ();
   ;		MM_SortMem ();
   ;	#else
   ;	
   ;	
   ;	
   ;	
   ;	#ifdef ARTSEXTERN
   ;		artnum = helpextern;
   ;	
	mov	si,word ptr DGROUP:_helpextern
   ;	
   ;		CA_CacheGrChunk (artnum);
   ;	
	push	si
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;		text = (char _seg *)grsegs[artnum];
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr DGROUP:_grsegs[bx]
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],ax
   ;	
   ;		MM_SetLock (&grsegs[artnum], true);
   ;	
	mov	ax,1
	push	ax
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_grsegs
	push	ax
	call	near ptr _MM_SetLock
	pop	cx
	pop	cx
   ;	
   ;	#else
   ;		CA_LoadFile (helpfilename,&layout);
   ;		text = (char _seg *)layout;
   ;		MM_SetLock (&layout, true);
   ;	#endif
   ;	
   ;		ShowArticle (text);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr _ShowArticle
	pop	cx
	pop	cx
   ;	
   ;	
   ;	#ifdef ARTSEXTERN
   ;		MM_FreePtr (&grsegs[artnum]);
   ;	
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_grsegs
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
   ;	
   ;	#else
   ;		MM_FreePtr (&layout);
   ;	#endif
   ;	
   ;	
   ;	
   ;		VW_FadeOut();
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
   ;		FreeMusic ();
   ;	
	call	near ptr _FreeMusic
   ;	
   ;		CA_DownLevel ();
   ;	
	call	near ptr _CA_DownLevel
   ;	
   ;		MM_SortMem ();
   ;	
	call	near ptr _MM_SortMem
   ;	
   ;	#endif
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_HelpScreens	endp
   ;	
   ;	void EndText (void)
   ;	
	assume	cs:_TEXT
_EndText	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
   ;	
   ;	{
   ;		int			artnum;
   ;		char far 	*text;
   ;		memptr		layout;
   ;	
   ;	
   ;		ClearMemory ();
   ;	
	call	near ptr _ClearMemory
   ;	
   ;	
   ;		CA_UpLevel ();
   ;	
	call	near ptr _CA_UpLevel
   ;	
   ;		MM_SortMem ();
   ;	
	call	near ptr _MM_SortMem
   ;	
   ;	#ifdef JAPAN
   ;		ShowArticle(gamestate.episode + 1);
   ;	
   ;		VW_FadeOut();
   ;	
   ;		SETFONTCOLOR(0,15);
   ;		IN_ClearKeysDown();
   ;		if (MousePresent)
   ;			Mouse(MDelta);	// Clear accumulated mouse movement
   ;	
   ;		FreeMusic ();
   ;		CA_DownLevel ();
   ;		MM_SortMem ();
   ;	#else
   ;	
   ;	
   ;	
   ;	#ifdef ARTSEXTERN
   ;		artnum = endextern+gamestate.episode;
   ;	
	mov	ax,word ptr DGROUP:_endextern
	add	ax,word ptr DGROUP:_gamestate+38
	mov	si,ax
   ;	
   ;		CA_CacheGrChunk (artnum);
   ;	
	push	si
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;		text = (char _seg *)grsegs[artnum];
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr DGROUP:_grsegs[bx]
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],ax
   ;	
   ;		MM_SetLock (&grsegs[artnum], true);
   ;	
	mov	ax,1
	push	ax
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_grsegs
	push	ax
	call	near ptr _MM_SetLock
	pop	cx
	pop	cx
   ;	
   ;	#else
   ;		endfilename[6] = '1'+gamestate.episode;
   ;		CA_LoadFile (endfilename,&layout);
   ;		text = (char _seg *)layout;
   ;		MM_SetLock (&layout, true);
   ;	#endif
   ;	
   ;		ShowArticle (text);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr _ShowArticle
	pop	cx
	pop	cx
   ;	
   ;	
   ;	#ifdef ARTSEXTERN
   ;		MM_FreePtr (&grsegs[artnum]);
   ;	
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_grsegs
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
   ;	
   ;	#else
   ;		MM_FreePtr (&layout);
   ;	#endif
   ;	
   ;	
   ;		VW_FadeOut();
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
   ;		SETFONTCOLOR(0,15);
   ;	
	mov	byte ptr DGROUP:_fontcolor,0
	mov	byte ptr DGROUP:_backcolor,15
   ;	
   ;		IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;		if (MousePresent)
   ;	
	cmp	word ptr DGROUP:_MousePresent,0
	je	short @15@74
   ;	
   ;			Mouse(MDelta);	// Clear accumulated mouse movement
   ;	
	mov	ax,11
	int	51
@15@74:
   ;	
   ;	
   ;		FreeMusic ();
   ;	
	call	near ptr _FreeMusic
   ;	
   ;		CA_DownLevel ();
   ;	
	call	near ptr _CA_DownLevel
   ;	
   ;		MM_SortMem ();
   ;	
	call	near ptr _MM_SortMem
   ;	
   ;	#endif
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_EndText	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_rowon	label	word
	db	2 dup (?)
_picx	label	word
	db	2 dup (?)
_picy	label	word
	db	2 dup (?)
_text	label	dword
	db	4 dup (?)
_picdelay	label	word
	db	2 dup (?)
_numpages	label	word
	db	2 dup (?)
_picnum	label	word
	db	2 dup (?)
_pagenum	label	word
	db	2 dup (?)
_menuitems	label	word
	db	2 dup (?)
_leftmargin	label	word
	db	30 dup (?)
_layoutdone	label	word
	db	2 dup (?)
_rightmargin	label	word
	db	30 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'PageLayout: Word limit exceeded'
	db	0
	db	'PageLayout: Text not headed with ^P'
	db	0
	db	'pg '
	db	0
	db	' of '
	db	0
	db	'CacheLayoutGraphics: No ^E to terminate file!'
	db	0
	db	'goobers'
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	public	_HandleCommand
	extrn	_PicturePause:near
	extrn	_CA_CacheMarks:near
	public	_helpfilename
	extrn	_FreeMusic:near
	extrn	_VW_MeasurePropString:near
	public	_EndText
	extrn	_grneeded:byte
	public	_rightmargin
	public	_helpextern
	public	_PageLayout
	public	_HelpScreens
	extrn	_MM_FreePtr:near
	extrn	_CA_DownLevel:near
	extrn	_ca_levelbit:byte
	public	_HandleCtrls
	public	_layoutdone
	public	_HandleWord
	extrn	_gamestate:word
	extrn	_VWB_DrawPropString:near
	public	_ParseNumber
	public	_leftmargin
	extrn	_grsegs:word
	extrn	_backcolor:byte
	public	_menuitems
	extrn	_TimeCount:word
	extrn	_MM_SortMem:near
	extrn	_CA_UpLevel:near
	extrn	_MM_SetLock:near
	extrn	_Keyboard:word
	public	_pagenum
	extrn	_pictable:word
	public	_picnum
	public	_numpages
	extrn	_ClearMemory:near
	public	_NewLine
	extrn	_VL_FadeOut:near
	public	_BackPage
	public	_picdelay
	public	_ShowArticle
	extrn	_LastScan:byte
	extrn	_VW_UpdateScreen:near
	public	_text
	extrn	_gamepal:byte
	extrn	_IN_ClearKeysDown:near
	extrn	_MS_CheckParm:near
	public	_RipToEOL
	extrn	_MousePresent:word
	extrn	_Quit:near
	public	_picy
	public	_picx
	extrn	_strcpy:near
	extrn	_py:word
	extrn	_VWB_DrawPic:near
	extrn	_fontcolor:byte
	public	_CacheLayoutGraphics
	extrn	_fontnumber:word
	extrn	_str2:byte
	public	_ParseTimedCommand
	extrn	_strcat:near
	extrn	_itoa:near
	extrn	_VL_FadeIn:near
	extrn	_atol:near
	extrn	_str:byte
	public	_endfilename
	public	_TimedPicCommand
	public	_ParsePicCommand
	extrn	_CA_CacheGrChunk:near
	extrn	_px:word
	extrn	_toupper:near
	public	_endextern
	public	_rowon
	extrn	_VWB_Bar:near
	end
