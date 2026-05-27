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
	?debug	S "c:\wl_scale.c"
	?debug	C E9E551FE7C0D633A5C776C5F7363616C652E63
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
   ;	void far BadScale (void)
   ;	
	assume	cs:_TEXT
_BadScale	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		Quit ("BadScale called!");
   ;	
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _Quit
	pop	cx
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_BadScale	endp
   ;	
   ;	void SetupScaling (int maxscaleheight)
   ;	
	assume	cs:_TEXT
_SetupScaling	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{
   ;		int		i,x,y;
   ;		byte	far *dest;
   ;	
   ;		insetupscaling = true;
   ;	
	mov	word ptr DGROUP:_insetupscaling,1
   ;	
   ;	
   ;		maxscaleheight/=2;			// one scaler every two pixels
   ;	
	mov	bx,2
	mov	ax,di
	cwd	
	idiv	bx
	mov	di,ax
   ;	
   ;	
   ;		maxscale = maxscaleheight-1;
   ;	
	mov	ax,di
	dec	ax
	mov	word ptr DGROUP:_maxscale,ax
   ;	
   ;		maxscaleshl2 = maxscale<<2;
   ;	
	mov	ax,word ptr DGROUP:_maxscale
	shl	ax,1
	shl	ax,1
	mov	word ptr DGROUP:_maxscaleshl2,ax
   ;	
   ;	
   ;	//
   ;	// free up old scalers
   ;	//
   ;		for (i=1;i<MAXSCALEHEIGHT;i++)
   ;	
	mov	si,1
	jmp	short @2@170
@2@50:
   ;	
   ;		{
   ;			if (scaledirectory[i])
   ;	
	mov	bx,si
	shl	bx,1
	cmp	word ptr DGROUP:_scaledirectory[bx],0
	je	short @2@98
   ;	
   ;				MM_FreePtr (&(memptr)scaledirectory[i]);
   ;	
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_scaledirectory
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
@2@98:
   ;	
   ;			if (i>=stepbytwo)
   ;	
	cmp	si,word ptr DGROUP:_stepbytwo
	jl	short @2@146
   ;	
   ;				i += 2;
   ;	
	inc	si
	inc	si
@2@146:
	inc	si
@2@170:
	cmp	si,256
	jl	short @2@50
   ;	
   ;		}
   ;		memset (scaledirectory,0,sizeof(scaledirectory));
   ;	
	mov	ax,514
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_scaledirectory
	push	ax
	call	near ptr _memset
	add	sp,6
   ;	
   ;	
   ;		MM_SortMem ();
   ;	
	call	near ptr _MM_SortMem
   ;	
   ;	
   ;	//
   ;	// build the compiled scalers
   ;	//
   ;		stepbytwo = viewheight/2;	// save space by double stepping
   ;	
	mov	ax,word ptr DGROUP:_viewheight
	mov	bx,2
	cwd	
	idiv	bx
	mov	word ptr DGROUP:_stepbytwo,ax
   ;	
   ;		MM_GetPtr (&(memptr)work,20000);
   ;	
	xor	ax,ax
	mov	dx,20000
	push	ax
	push	dx
	mov	ax,offset DGROUP:_work
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;	
   ;		for (i=1;i<=maxscaleheight;i++)
   ;	
	mov	si,1
	jmp	short @2@290
@2@218:
   ;	
   ;		{
   ;			BuildCompScale (i*2,&(memptr)scaledirectory[i]);
   ;	
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_scaledirectory
	push	ax
	mov	ax,si
	shl	ax,1
	push	ax
	call	near ptr _BuildCompScale
	pop	cx
	pop	cx
   ;	
   ;			if (i>=stepbytwo)
   ;	
	cmp	si,word ptr DGROUP:_stepbytwo
	jl	short @2@266
   ;	
   ;				i+= 2;
   ;	
	inc	si
	inc	si
@2@266:
	inc	si
@2@290:
	cmp	si,di
	jle	short @2@218
   ;	
   ;		}
   ;		MM_FreePtr (&(memptr)work);
   ;	
	mov	ax,offset DGROUP:_work
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
   ;	
   ;	
   ;	//
   ;	// compact memory and lock down scalers
   ;	//
   ;		MM_SortMem ();
   ;	
	call	near ptr _MM_SortMem
   ;	
   ;		for (i=1;i<=maxscaleheight;i++)
   ;	
	mov	si,1
	jmp	@2@410
@2@338:
   ;	
   ;		{
   ;			MM_SetLock (&(memptr)scaledirectory[i],true);
   ;	
	mov	ax,1
	push	ax
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_scaledirectory
	push	ax
	call	near ptr _MM_SetLock
	pop	cx
	pop	cx
   ;	
   ;			fullscalefarcall[i] = (unsigned)scaledirectory[i];
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr DGROUP:_scaledirectory[bx]
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	word ptr DGROUP:_fullscalefarcall[bx],ax
	mov	word ptr DGROUP:_fullscalefarcall[bx+2],0
   ;	
   ;			fullscalefarcall[i] <<=16;
   ;	
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	ax,word ptr DGROUP:_fullscalefarcall[bx]
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	word ptr DGROUP:_fullscalefarcall[bx],0
	mov	word ptr DGROUP:_fullscalefarcall[bx+2],ax
   ;	
   ;			fullscalefarcall[i] += scaledirectory[i]->codeofs[0];
   ;	
	mov	bx,si
	shl	bx,1
	mov	es,word ptr DGROUP:_scaledirectory[bx]
	mov	ax,word ptr es:[0]
	mov	bx,si
	shl	bx,1
	shl	bx,1
	add	word ptr DGROUP:_fullscalefarcall[bx],ax
	adc	word ptr DGROUP:_fullscalefarcall[bx+2],0
   ;	
   ;			if (i>=stepbytwo)
   ;	
	cmp	si,word ptr DGROUP:_stepbytwo
	jl	short @2@386
   ;	
   ;			{
   ;				scaledirectory[i+1] = scaledirectory[i];
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr DGROUP:_scaledirectory[bx]
	mov	bx,si
	shl	bx,1
	mov	word ptr DGROUP:_scaledirectory[bx+2],ax
   ;	
   ;				fullscalefarcall[i+1] = fullscalefarcall[i];
   ;	
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	ax,word ptr DGROUP:_fullscalefarcall[bx+2]
	mov	dx,word ptr DGROUP:_fullscalefarcall[bx]
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	word ptr DGROUP:_fullscalefarcall[bx+4],dx
	mov	word ptr DGROUP:_fullscalefarcall[bx+6],ax
   ;	
   ;				scaledirectory[i+2] = scaledirectory[i];
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr DGROUP:_scaledirectory[bx]
	mov	bx,si
	shl	bx,1
	mov	word ptr DGROUP:_scaledirectory[bx+4],ax
   ;	
   ;				fullscalefarcall[i+2] = fullscalefarcall[i];
   ;	
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	ax,word ptr DGROUP:_fullscalefarcall[bx+2]
	mov	dx,word ptr DGROUP:_fullscalefarcall[bx]
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	word ptr DGROUP:_fullscalefarcall[bx+8],dx
	mov	word ptr DGROUP:_fullscalefarcall[bx+10],ax
   ;	
   ;				i+=2;
   ;	
	inc	si
	inc	si
@2@386:
	inc	si
@2@410:
	cmp	si,di
	jg	@@0
	jmp	@2@338
@@0:
   ;	
   ;			}
   ;		}
   ;		scaledirectory[0] = scaledirectory[1];
   ;	
	mov	ax,word ptr DGROUP:_scaledirectory+2
	mov	word ptr DGROUP:_scaledirectory,ax
   ;	
   ;		fullscalefarcall[0] = fullscalefarcall[1];
   ;	
	mov	ax,word ptr DGROUP:_fullscalefarcall+6
	mov	dx,word ptr DGROUP:_fullscalefarcall+4
	mov	word ptr DGROUP:_fullscalefarcall,dx
	mov	word ptr DGROUP:_fullscalefarcall+2,ax
   ;	
   ;	
   ;	//
   ;	// check for oversize wall drawing
   ;	//
   ;		for (i=maxscaleheight;i<MAXSCALEHEIGHT;i++)
   ;	
	mov	si,di
	jmp	short @2@506
@2@458:
   ;	
   ;			fullscalefarcall[i] = (long)BadScale;
   ;	
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	word ptr DGROUP:_fullscalefarcall[bx],offset _BadScale
	mov	word ptr DGROUP:_fullscalefarcall[bx+2],cs
	inc	si
@2@506:
	cmp	si,256
	jl	short @2@458
   ;	
   ;	
   ;		insetupscaling = false;
   ;	
	mov	word ptr DGROUP:_insetupscaling,0
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_SetupScaling	endp
   ;	
   ;	unsigned BuildCompScale (int height, memptr *finalspot)
   ;	
	assume	cs:_TEXT
_BuildCompScale	proc	near
	push	bp
	mov	bp,sp
	sub	sp,18
	push	si
	push	di
   ;	
   ;	{
   ;		byte		far *code;
   ;	
   ;		int			i;
   ;		long		fix,step;
   ;		unsigned	src,totalscaled,totalsize;
   ;		int			startpix,endpix,toppix;
   ;	
   ;	
   ;		step = ((long)height<<16) / 64;
   ;	
	xor	ax,ax
	mov	dx,64
	push	ax
	push	dx
	mov	ax,word ptr [bp+4]
	cwd	
	xor	dx,dx
	push	ax
	push	dx
	call	near ptr N_LDIV@
	mov	word ptr [bp-12],ax
	mov	word ptr [bp-10],dx
   ;	
   ;		code = &work->code[0];
   ;	
	mov	ax,word ptr DGROUP:_work
	mov	word ptr [bp-4],260
	mov	word ptr [bp-2],ax
   ;	
   ;		toppix = (viewheight-height)/2;
   ;	
	mov	ax,word ptr DGROUP:_viewheight
	sub	ax,word ptr [bp+4]
	mov	bx,2
	cwd	
	idiv	bx
	mov	word ptr [bp-18],ax
   ;	
   ;		fix = 0;
   ;	
	mov	word ptr [bp-8],0
	mov	word ptr [bp-6],0
   ;	
   ;	
   ;		for (src=0;src<=64;src++)
   ;	
	mov	word ptr [bp-14],0
	jmp	@3@458
@3@50:
   ;	
   ;		{
   ;			startpix = fix>>16;
   ;	
	mov	ax,word ptr [bp-6]
	cwd	
	mov	si,ax
   ;	
   ;			fix += step;
   ;	
	mov	ax,word ptr [bp-10]
	mov	dx,word ptr [bp-12]
	add	word ptr [bp-8],dx
	adc	word ptr [bp-6],ax
   ;	
   ;			endpix = fix>>16;
   ;	
	mov	ax,word ptr [bp-6]
	cwd	
	mov	di,ax
   ;	
   ;	
   ;			if (endpix>startpix)
   ;	
	cmp	di,si
	jle	short @3@98
   ;	
   ;				work->width[src] = endpix-startpix;
   ;	
	mov	es,word ptr DGROUP:_work
	mov	bx,word ptr [bp-14]
	shl	bx,1
	mov	ax,di
	sub	ax,si
	mov	word ptr es:[bx+130],ax
	jmp	short @3@122
@3@98:
   ;	
   ;			else
   ;				work->width[src] = 0;
   ;	
	mov	es,word ptr DGROUP:_work
	mov	bx,word ptr [bp-14]
	shl	bx,1
	mov	word ptr es:[bx+130],0
@3@122:
   ;	
   ;	
   ;	//
   ;	// mark the start of the code
   ;	//
   ;			work->codeofs[src] = FP_OFF(code);
   ;	
	mov	bx,word ptr [bp-14]
	shl	bx,1
	mov	es,word ptr DGROUP:_work
	mov	ax,word ptr [bp-4]
	mov	word ptr es:[bx],ax
   ;	
   ;	
   ;	//
   ;	// compile some code if the source pixel generates any screen pixels
   ;	//
   ;			startpix+=toppix;
   ;	
	add	si,word ptr [bp-18]
   ;	
   ;			endpix+=toppix;
   ;	
	add	di,word ptr [bp-18]
   ;	
   ;	
   ;			if (startpix == endpix || endpix < 0 || startpix >= viewheight || src == 64)
   ;	
	cmp	si,di
	je	short @3@218
	or	di,di
	jl	short @3@218
	cmp	si,word ptr DGROUP:_viewheight
	jge	short @3@218
	cmp	word ptr [bp-14],64
	jne	short @3@242
@3@218:
   ;	
   ;				continue;
   ;	
	jmp	short @3@434
@3@242:
   ;	
   ;	
   ;		//
   ;		// mov al,[si+src]
   ;		//
   ;			*code++ = 0x8a;
   ;	
	les	bx,dword ptr [bp-4]
	mov	byte ptr es:[bx],138
	inc	word ptr [bp-4]
   ;	
   ;			*code++ = 0x44;
   ;	
	les	bx,dword ptr [bp-4]
	mov	byte ptr es:[bx],68
	inc	word ptr [bp-4]
   ;	
   ;			*code++ = src;
   ;	
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr [bp-14]
	mov	byte ptr es:[bx],al
	inc	word ptr [bp-4]
	jmp	short @3@410
@3@266:
   ;	
   ;	
   ;			for (;startpix<endpix;startpix++)
   ;			{
   ;				if (startpix >= viewheight)
   ;	
	cmp	si,word ptr DGROUP:_viewheight
	jl	short @3@314
   ;	
   ;					break;						// off the bottom of the view area
   ;	
	jmp	short @3@434
@3@314:
   ;	
   ;				if (startpix < 0)
   ;	
	or	si,si
	jge	short @3@362
   ;	
   ;					continue;					// not into the view area
   ;	
	jmp	short @3@386
@3@362:
   ;	
   ;	
   ;			//
   ;			// mov [es:di+heightofs],al
   ;			//
   ;				*code++ = 0x26;
   ;	
	les	bx,dword ptr [bp-4]
	mov	byte ptr es:[bx],38
	inc	word ptr [bp-4]
   ;	
   ;				*code++ = 0x88;
   ;	
	les	bx,dword ptr [bp-4]
	mov	byte ptr es:[bx],136
	inc	word ptr [bp-4]
   ;	
   ;				*code++ = 0x85;
   ;	
	les	bx,dword ptr [bp-4]
	mov	byte ptr es:[bx],133
	inc	word ptr [bp-4]
   ;	
   ;				*((unsigned far *)code)++ = startpix*SCREENBWIDE;
   ;	
	mov	ax,si
	mov	dx,80
	imul	dx
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx],ax
	add	word ptr [bp-4],2
@3@386:
	inc	si
@3@410:
	cmp	si,di
	jl	short @3@266
@3@434:
	inc	word ptr [bp-14]
@3@458:
	cmp	word ptr [bp-14],64
	ja	@@1
	jmp	@3@50
@@1:
   ;	
   ;			}
   ;	
   ;		}
   ;	
   ;	//
   ;	// retf
   ;	//
   ;		*code++ = 0xcb;
   ;	
	les	bx,dword ptr [bp-4]
	mov	byte ptr es:[bx],203
	inc	word ptr [bp-4]
   ;	
   ;	
   ;		totalsize = FP_OFF(code);
   ;	
	mov	ax,word ptr [bp-4]
	mov	word ptr [bp-16],ax
   ;	
   ;		MM_GetPtr (finalspot,totalsize);
   ;	
	xor	ax,ax
	push	ax
	push	word ptr [bp-16]
	push	word ptr [bp+6]
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;		_fmemcpy ((byte _seg *)(*finalspot),(byte _seg *)work,totalsize);
   ;	
	push	word ptr [bp-16]
	push	word ptr DGROUP:_work
	mov	bx,word ptr [bp+6]
	push	word ptr [bx]
	call	near ptr __fmemcpy
	add	sp,6
   ;	
   ;	
   ;		return totalsize;
   ;	
	mov	ax,word ptr [bp-16]
	jmp	short @3@506
@3@506:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_BuildCompScale	endp
   ;	
   ;	void near ScaleLine (void)
   ;	
	assume	cs:_TEXT
_ScaleLine	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;	asm	mov	cx,WORD PTR [linescale+2]
   ;	
		mov		cx,WORD PTR [_linescale+2]
   ;	
   ;	asm	mov	es,cx						// segment of scaler
   ;	
		mov		es,cx						
   ;	
   ;	
   ;	asm	mov bp,WORD PTR [linecmds]
   ;	
		mov	 bp,WORD PTR [_linecmds]
   ;	
   ;	asm	mov	dx,SC_INDEX+1				// to set SC_MAPMASK
   ;	
		mov		dx,03C4H+1				
   ;	
   ;	
   ;	asm	mov	bx,[slinex]
   ;	
		mov		bx,[_slinex]
   ;	
   ;	asm	mov	di,bx
   ;	
		mov		di,bx
   ;	
   ;	asm	shr	di,2						// X in bytes
   ;	
		shr		di,2						
   ;	
   ;	asm	add	di,[bufferofs]
   ;	
		add		di,[_bufferofs]
   ;	
   ;	asm	and	bx,3
   ;	
		and		bx,3
   ;	
   ;	asm	shl	bx,3
   ;	
		shl		bx,3
   ;	
   ;	asm	add	bx,[slinewidth]				// bx = (pixel*8+pixwidth)
   ;	
		add		bx,[_slinewidth]				
   ;	
   ;	asm	mov	al,BYTE [mapmasks3-1+bx]	// -1 because pixwidth of 1 is first
   ;	
		mov		al,BYTE [_mapmasks3-1+bx]	
   ;	
   ;	asm	mov	ds,WORD PTR [linecmds+2]
   ;	
		mov		ds,WORD PTR [_linecmds+2]
   ;	
   ;	asm	or	al,al
   ;	
		or		al,al
   ;	
   ;	asm	jz	notthreebyte				// scale across three bytes
   ;	
	je	short @4@410
   ;	
   ;	asm	jmp	threebyte
   ;	
	jmp	@4@1658
@4@410:
   ;	
   ;	notthreebyte:
   ;	asm	mov	al,BYTE PTR ss:[mapmasks2-1+bx]	// -1 because pixwidth of 1 is first
   ;	
		mov		al,BYTE PTR ss:[_mapmasks2-1+bx]	
   ;	
   ;	asm	or	al,al
   ;	
		or		al,al
   ;	
   ;	asm	jnz	twobyte						// scale across two bytes
   ;	
	jne	short @4@1010
   ;	
   ;	
   ;	//
   ;	// one byte scaling
   ;	//
   ;	asm	mov	al,BYTE PTR ss:[mapmasks1-1+bx]	// -1 because pixwidth of 1 is first
   ;	
		mov		al,BYTE PTR ss:[_mapmasks1-1+bx]	
   ;	
   ;	asm	out	dx,al						// set map mask register
   ;	
		out		dx,al						
@4@530:
   ;	
   ;	
   ;	scalesingle:
   ;	
   ;	asm	mov	bx,[ds:bp]					// table location of rtl to patch
   ;	
		mov		bx,[ds:bp]					
   ;	
   ;	asm	or	bx,bx
   ;	
		or		bx,bx
   ;	
   ;	asm	jz	linedone					// 0 signals end of segment list
   ;	
	je	short @4@938
   ;	
   ;	asm	mov	bx,[es:bx]
   ;	
		mov		bx,[es:bx]
   ;	
   ;	asm	mov	dl,[es:bx]					// save old value
   ;	
		mov		dl,[es:bx]					
   ;	
   ;	asm	mov	BYTE PTR es:[bx],OP_RETF	// patch a RETF in
   ;	
		mov		BYTE PTR es:[bx],0cbH	
   ;	
   ;	asm	mov	si,[ds:bp+4]				// table location of entry spot
   ;	
		mov		si,[ds:bp+4]				
   ;	
   ;	asm	mov	ax,[es:si]
   ;	
		mov		ax,[es:si]
   ;	
   ;	asm	mov	WORD PTR ss:[linescale],ax	// call here to start scaling
   ;	
		mov		WORD PTR ss:[_linescale],ax	
   ;	
   ;	asm	mov	si,[ds:bp+2]				// corrected top of shape for this segment
   ;	
		mov		si,[ds:bp+2]				
   ;	
   ;	asm	add	bp,6						// next segment list
   ;	
		add		bp,6						
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
   ;	asm	call ss:[linescale]				// scale the segment of pixels
   ;	
		call	 ss:[_linescale]				
   ;	
   ;	
   ;	asm	mov	es,cx						// segment of scaler
   ;	
		mov		es,cx						
   ;	
   ;	asm	mov	BYTE PTR es:[bx],dl			// unpatch the RETF
   ;	
		mov		BYTE PTR es:[bx],dl			
   ;	
   ;	asm	jmp	scalesingle					// do the next segment
   ;	
	jmp	short @4@530
@4@938:
   ;	
   ;	
   ;	
   ;	//
   ;	// done
   ;	//
   ;	linedone:
   ;	asm	mov	ax,ss
   ;	
		mov		ax,ss
   ;	
   ;	asm	mov	ds,ax
   ;	
		mov		ds,ax
   ;	
   ;	return;
   ;	
	jmp	@4@2474
@4@1010:
   ;	
   ;	
   ;	//
   ;	// two byte scaling
   ;	//
   ;	twobyte:
   ;	asm	mov	ss:[mask2],al
   ;	
		mov		ss:[DGROUP:_mask2],al
   ;	
   ;	asm	mov	al,BYTE PTR ss:[mapmasks1-1+bx]	// -1 because pixwidth of 1 is first
   ;	
		mov		al,BYTE PTR ss:[_mapmasks1-1+bx]	
   ;	
   ;	asm	mov	ss:[mask1],al
   ;	
		mov		ss:[DGROUP:_mask1],al
@4@1082:
   ;	
   ;	
   ;	scaledouble:
   ;	
   ;	asm	mov	bx,[ds:bp]					// table location of rtl to patch
   ;	
		mov		bx,[ds:bp]					
   ;	
   ;	asm	or	bx,bx
   ;	
		or		bx,bx
   ;	
   ;	asm	jz	linedone					// 0 signals end of segment list
   ;	
	je	short @4@938
   ;	
   ;	asm	mov	bx,[es:bx]
   ;	
		mov		bx,[es:bx]
   ;	
   ;	asm	mov	cl,[es:bx]					// save old value
   ;	
		mov		cl,[es:bx]					
   ;	
   ;	asm	mov	BYTE PTR es:[bx],OP_RETF	// patch a RETF in
   ;	
		mov		BYTE PTR es:[bx],0cbH	
   ;	
   ;	asm	mov	si,[ds:bp+4]				// table location of entry spot
   ;	
		mov		si,[ds:bp+4]				
   ;	
   ;	asm	mov	ax,[es:si]
   ;	
		mov		ax,[es:si]
   ;	
   ;	asm	mov	WORD PTR ss:[linescale],ax	// call here to start scaling
   ;	
		mov		WORD PTR ss:[_linescale],ax	
   ;	
   ;	asm	mov	si,[ds:bp+2]				// corrected top of shape for this segment
   ;	
		mov		si,[ds:bp+2]				
   ;	
   ;	asm	add	bp,6						// next segment list
   ;	
		add		bp,6						
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
   ;	asm	mov	al,ss:[mask1]
   ;	
		mov		al,ss:[DGROUP:_mask1]
   ;	
   ;	asm	out	dx,al						// set map mask register
   ;	
		out		dx,al						
   ;	
   ;	asm	call ss:[linescale]				// scale the segment of pixels
   ;	
		call	 ss:[_linescale]				
   ;	
   ;	asm	inc	di
   ;	
		inc		di
   ;	
   ;	asm	mov	al,ss:[mask2]
   ;	
		mov		al,ss:[DGROUP:_mask2]
   ;	
   ;	asm	out	dx,al						// set map mask register
   ;	
		out		dx,al						
   ;	
   ;	asm	call ss:[linescale]				// scale the segment of pixels
   ;	
		call	 ss:[_linescale]				
   ;	
   ;	asm	dec	di
   ;	
		dec		di
   ;	
   ;	
   ;	asm	mov	es,WORD PTR ss:[linescale+2] // segment of scaler
   ;	
		mov		es,WORD PTR ss:[_linescale+2] 
   ;	
   ;	asm	mov	BYTE PTR es:[bx],cl			// unpatch the RETF
   ;	
		mov		BYTE PTR es:[bx],cl			
   ;	
   ;	asm	jmp	scaledouble					// do the next segment
   ;	
	jmp	@4@1082
@4@1658:
   ;	
   ;	
   ;	
   ;	//
   ;	// three byte scaling
   ;	//
   ;	threebyte:
   ;	asm	mov	ss:[mask3],al
   ;	
		mov		ss:[DGROUP:_mask3],al
   ;	
   ;	asm	mov	al,BYTE PTR ss:[mapmasks2-1+bx]	// -1 because pixwidth of 1 is first
   ;	
		mov		al,BYTE PTR ss:[_mapmasks2-1+bx]	
   ;	
   ;	asm	mov	ss:[mask2],al
   ;	
		mov		ss:[DGROUP:_mask2],al
   ;	
   ;	asm	mov	al,BYTE PTR ss:[mapmasks1-1+bx]	// -1 because pixwidth of 1 is first
   ;	
		mov		al,BYTE PTR ss:[_mapmasks1-1+bx]	
   ;	
   ;	asm	mov	ss:[mask1],al
   ;	
		mov		ss:[DGROUP:_mask1],al
@4@1778:
   ;	
   ;	
   ;	scaletriple:
   ;	
   ;	asm	mov	bx,[ds:bp]					// table location of rtl to patch
   ;	
		mov		bx,[ds:bp]					
   ;	
   ;	asm	or	bx,bx
   ;	
		or		bx,bx
   ;	
   ;	asm	jz	linedone					// 0 signals end of segment list
   ;	
	je	short @4@938
   ;	
   ;	asm	mov	bx,[es:bx]
   ;	
		mov		bx,[es:bx]
   ;	
   ;	asm	mov	cl,[es:bx]					// save old value
   ;	
		mov		cl,[es:bx]					
   ;	
   ;	asm	mov	BYTE PTR es:[bx],OP_RETF	// patch a RETF in
   ;	
		mov		BYTE PTR es:[bx],0cbH	
   ;	
   ;	asm	mov	si,[ds:bp+4]				// table location of entry spot
   ;	
		mov		si,[ds:bp+4]				
   ;	
   ;	asm	mov	ax,[es:si]
   ;	
		mov		ax,[es:si]
   ;	
   ;	asm	mov	WORD PTR ss:[linescale],ax	// call here to start scaling
   ;	
		mov		WORD PTR ss:[_linescale],ax	
   ;	
   ;	asm	mov	si,[ds:bp+2]				// corrected top of shape for this segment
   ;	
		mov		si,[ds:bp+2]				
   ;	
   ;	asm	add	bp,6						// next segment list
   ;	
		add		bp,6						
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
   ;	asm	mov	al,ss:[mask1]
   ;	
		mov		al,ss:[DGROUP:_mask1]
   ;	
   ;	asm	out	dx,al						// set map mask register
   ;	
		out		dx,al						
   ;	
   ;	asm	call ss:[linescale]				// scale the segment of pixels
   ;	
		call	 ss:[_linescale]				
   ;	
   ;	asm	inc	di
   ;	
		inc		di
   ;	
   ;	asm	mov	al,ss:[mask2]
   ;	
		mov		al,ss:[DGROUP:_mask2]
   ;	
   ;	asm	out	dx,al						// set map mask register
   ;	
		out		dx,al						
   ;	
   ;	asm	call ss:[linescale]				// scale the segment of pixels
   ;	
		call	 ss:[_linescale]				
   ;	
   ;	asm	inc	di
   ;	
		inc		di
   ;	
   ;	asm	mov	al,ss:[mask3]
   ;	
		mov		al,ss:[DGROUP:_mask3]
   ;	
   ;	asm	out	dx,al						// set map mask register
   ;	
		out		dx,al						
   ;	
   ;	asm	call ss:[linescale]				// scale the segment of pixels
   ;	
		call	 ss:[_linescale]				
   ;	
   ;	asm	dec	di
   ;	
		dec		di
   ;	
   ;	asm	dec	di
   ;	
		dec		di
   ;	
   ;	
   ;	asm	mov	es,WORD PTR ss:[linescale+2] // segment of scaler
   ;	
		mov		es,WORD PTR ss:[_linescale+2] 
   ;	
   ;	asm	mov	BYTE PTR es:[bx],cl			// unpatch the RETF
   ;	
		mov		BYTE PTR es:[bx],cl			
   ;	
   ;	asm	jmp	scaletriple					// do the next segment
   ;	
	jmp	@4@1778
@4@2474:
   ;	
   ;	
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_ScaleLine	endp
   ;	
   ;	void ScaleShape (int xcenter, int shapenum, unsigned height)
   ;	
	assume	cs:_TEXT
_ScaleShape	proc	near
	push	bp
	mov	bp,sp
	sub	sp,16
	push	si
	push	di
	mov	di,word ptr [bp+8]
   ;	
   ;	{
   ;		t_compshape	_seg *shape;
   ;		t_compscale _seg *comptable;
   ;		unsigned	scale,srcx,stopx,tempx;
   ;		int			t;
   ;		unsigned	far *cmdptr;
   ;		boolean		leftvis,rightvis;
   ;	
   ;	
   ;		shape = PM_GetSpritePage (shapenum);
   ;	
	mov	ax,word ptr DGROUP:_PMSpriteStart
	add	ax,word ptr [bp+6]
	push	ax
	call	near ptr _PM_GetPage
	pop	cx
	mov	si,ax
   ;	
   ;	
   ;		scale = height>>3;						// low three bits are fractional
   ;	
	mov	ax,di
	shr	ax,1
	shr	ax,1
	shr	ax,1
	mov	word ptr [bp-4],ax
   ;	
   ;		if (!scale || scale>maxscale)
   ;	
	cmp	word ptr [bp-4],0
	je	short @5@74
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr DGROUP:_maxscale
	jbe	short @5@98
@5@74:
   ;	
   ;			return;								// too close or far away
   ;	
	jmp	@5@1946
@5@98:
   ;	
   ;		comptable = scaledirectory[scale];
   ;	
	mov	bx,word ptr [bp-4]
	shl	bx,1
	mov	ax,word ptr DGROUP:_scaledirectory[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;		*(((unsigned *)&linescale)+1)=(unsigned)comptable;	// seg of far call
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr DGROUP:_linescale+2,ax
   ;	
   ;		*(((unsigned *)&linecmds)+1)=(unsigned)shape;		// seg of shape
   ;	
	mov	word ptr DGROUP:_linecmds+2,si
   ;	
   ;	
   ;	//
   ;	// scale to the left (from pixel 31 to shape->leftpix)
   ;	//
   ;		srcx = 32;
   ;	
	mov	word ptr [bp-6],32
   ;	
   ;		slinex = xcenter;
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:_slinex,ax
   ;	
   ;		stopx = shape->leftpix;
   ;	
	mov	es,si
	mov	ax,word ptr es:[0]
	mov	word ptr [bp-8],ax
   ;	
   ;		cmdptr = &shape->dataofs[31-stopx];
   ;	
	mov	ax,4
	mov	dx,31
	sub	dx,word ptr [bp-8]
	shl	dx,1
	add	ax,dx
	mov	word ptr [bp-12],ax
	mov	word ptr [bp-10],si
	jmp	@5@962
@5@122:
   ;	
   ;	
   ;		while ( --srcx >=stopx && slinex>0)
   ;		{
   ;			(unsigned)linecmds = *cmdptr--;
   ;	
	les	bx,dword ptr [bp-12]
	mov	ax,word ptr es:[bx]
	mov	word ptr DGROUP:_linecmds,ax
	sub	word ptr [bp-12],2
   ;	
   ;			if ( !(slinewidth = comptable->width[srcx]) )
   ;	
	mov	es,word ptr [bp-2]
	mov	bx,word ptr [bp-6]
	shl	bx,1
	mov	ax,word ptr es:[bx+130]
	mov	word ptr DGROUP:_slinewidth,ax
	or	ax,ax
	jne	short @5@170
   ;	
   ;				continue;
   ;	
	jmp	@5@962
@5@170:
   ;	
   ;	
   ;			if (slinewidth == 1)
   ;	
	cmp	word ptr DGROUP:_slinewidth,1
	jne	short @5@314
   ;	
   ;			{
   ;				slinex--;
   ;	
	dec	word ptr DGROUP:_slinex
   ;	
   ;				if (slinex<viewwidth)
   ;	
	mov	ax,word ptr DGROUP:_slinex
	cmp	ax,word ptr DGROUP:_viewwidth
	jge	short @5@290
   ;	
   ;				{
   ;					if (wallheight[slinex] >= height)
   ;	
	mov	bx,word ptr DGROUP:_slinex
	shl	bx,1
	cmp	word ptr DGROUP:_wallheight[bx],di
	jb	short @5@266
   ;	
   ;						continue;		// obscured by closer wall
   ;	
	jmp	@5@962
@5@266:
   ;	
   ;					ScaleLine ();
   ;	
	call	near ptr _ScaleLine
@5@290:
   ;	
   ;				}
   ;				continue;
   ;	
	jmp	@5@962
@5@314:
   ;	
   ;			}
   ;	
   ;			//
   ;			// handle multi pixel lines
   ;			//
   ;			if (slinex>viewwidth)
   ;	
	mov	ax,word ptr DGROUP:_slinex
	cmp	ax,word ptr DGROUP:_viewwidth
	jle	short @5@410
   ;	
   ;			{
   ;				slinex -= slinewidth;
   ;	
	mov	ax,word ptr DGROUP:_slinewidth
	sub	word ptr DGROUP:_slinex,ax
   ;	
   ;				slinewidth = viewwidth-slinex;
   ;	
	mov	ax,word ptr DGROUP:_viewwidth
	sub	ax,word ptr DGROUP:_slinex
	mov	word ptr DGROUP:_slinewidth,ax
   ;	
   ;				if (slinewidth<1)
   ;	
	cmp	word ptr DGROUP:_slinewidth,1
	jge	short @5@386
   ;	
   ;					continue;		// still off the right side
   ;	
	jmp	@5@962
@5@386:
   ;	
   ;			}
   ;	
	jmp	short @5@482
@5@410:
   ;	
   ;			else
   ;			{
   ;				if (slinewidth>slinex)
   ;	
	mov	ax,word ptr DGROUP:_slinewidth
	cmp	ax,word ptr DGROUP:_slinex
	jle	short @5@458
   ;	
   ;					slinewidth = slinex;
   ;	
	mov	ax,word ptr DGROUP:_slinex
	mov	word ptr DGROUP:_slinewidth,ax
@5@458:
   ;	
   ;				slinex -= slinewidth;
   ;	
	mov	ax,word ptr DGROUP:_slinewidth
	sub	word ptr DGROUP:_slinex,ax
@5@482:
   ;	
   ;			}
   ;	
   ;	
   ;			leftvis = (wallheight[slinex] < height);
   ;	
	mov	bx,word ptr DGROUP:_slinex
	shl	bx,1
	cmp	word ptr DGROUP:_wallheight[bx],di
	jae	short @5@530
	mov	ax,1
	jmp	short @5@554
@5@530:
	xor	ax,ax
@5@554:
	mov	word ptr [bp-14],ax
   ;	
   ;			rightvis = (wallheight[slinex+slinewidth-1] < height);
   ;	
	mov	bx,word ptr DGROUP:_slinex
	add	bx,word ptr DGROUP:_slinewidth
	shl	bx,1
	cmp	word ptr DGROUP:_wallheight[bx-2],di
	jae	short @5@602
	mov	ax,1
	jmp	short @5@626
@5@602:
	xor	ax,ax
@5@626:
	mov	word ptr [bp-16],ax
   ;	
   ;	
   ;			if (leftvis)
   ;	
	cmp	word ptr [bp-14],0
	je	short @5@818
   ;	
   ;			{
   ;				if (rightvis)
   ;	
	cmp	word ptr [bp-16],0
	je	short @5@698
   ;	
   ;					ScaleLine ();
   ;	
	call	near ptr _ScaleLine
	jmp	short @5@794
@5@698:
	jmp	short @5@746
@5@722:
   ;	
   ;				else
   ;				{
   ;					while (wallheight[slinex+slinewidth-1] >= height)
   ;						slinewidth--;
   ;	
	dec	word ptr DGROUP:_slinewidth
@5@746:
	mov	bx,word ptr DGROUP:_slinex
	add	bx,word ptr DGROUP:_slinewidth
	shl	bx,1
	cmp	word ptr DGROUP:_wallheight[bx-2],di
	jae	short @5@722
   ;	
   ;					ScaleLine ();
   ;	
	call	near ptr _ScaleLine
@5@794:
   ;	
   ;				}
   ;			}
   ;	
	jmp	short @5@962
@5@818:
   ;	
   ;			else
   ;			{
   ;				if (!rightvis)
   ;	
	cmp	word ptr [bp-16],0
	jne	short @5@866
   ;	
   ;					continue;		// totally obscured
   ;	
	jmp	short @5@962
@5@866:
	jmp	short @5@914
@5@890:
   ;	
   ;	
   ;				while (wallheight[slinex] >= height)
   ;				{
   ;					slinex++;
   ;	
	inc	word ptr DGROUP:_slinex
   ;	
   ;					slinewidth--;
   ;	
	dec	word ptr DGROUP:_slinewidth
@5@914:
	mov	bx,word ptr DGROUP:_slinex
	shl	bx,1
	cmp	word ptr DGROUP:_wallheight[bx],di
	jae	short @5@890
   ;	
   ;				}
   ;				ScaleLine ();
   ;	
	call	near ptr _ScaleLine
   ;	
   ;				break;			// the rest of the shape is gone
   ;	
	jmp	short @5@1010
@5@962:
	dec	word ptr [bp-6]
	mov	ax,word ptr [bp-6]
	cmp	ax,word ptr [bp-8]
	jb	short @5@1010
	cmp	word ptr DGROUP:_slinex,0
	jle	@@2
	jmp	@5@122
@@2:
@5@1010:
   ;	
   ;			}
   ;		}
   ;	
   ;	
   ;	//
   ;	// scale to the right
   ;	//
   ;		slinex = xcenter;
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:_slinex,ax
   ;	
   ;		stopx = shape->rightpix;
   ;	
	mov	es,si
	mov	ax,word ptr es:[2]
	mov	word ptr [bp-8],ax
   ;	
   ;		if (shape->leftpix<31)
   ;	
	mov	es,si
	cmp	word ptr es:[0],31
	jae	short @5@1058
   ;	
   ;		{
   ;			srcx = 31;
   ;	
	mov	word ptr [bp-6],31
   ;	
   ;			cmdptr = &shape->dataofs[32-shape->leftpix];
   ;	
	mov	ax,4
	mov	es,si
	mov	dx,32
	sub	dx,word ptr es:[0]
	shl	dx,1
	add	ax,dx
	mov	word ptr [bp-12],ax
	mov	word ptr [bp-10],si
   ;	
   ;		}
   ;	
	jmp	short @5@1082
@5@1058:
   ;	
   ;		else
   ;		{
   ;			srcx = shape->leftpix-1;
   ;	
	mov	es,si
	mov	ax,word ptr es:[0]
	dec	ax
	mov	word ptr [bp-6],ax
   ;	
   ;			cmdptr = &shape->dataofs[0];
   ;	
	mov	word ptr [bp-12],4
	mov	word ptr [bp-10],si
@5@1082:
   ;	
   ;		}
   ;		slinewidth = 0;
   ;	
	mov	word ptr DGROUP:_slinewidth,0
	jmp	@5@1898
@5@1106:
   ;	
   ;	
   ;		while ( ++srcx <= stopx && (slinex+=slinewidth)<viewwidth)
   ;		{
   ;			(unsigned)linecmds = *cmdptr++;
   ;	
	les	bx,dword ptr [bp-12]
	mov	ax,word ptr es:[bx]
	mov	word ptr DGROUP:_linecmds,ax
	add	word ptr [bp-12],2
   ;	
   ;			if ( !(slinewidth = comptable->width[srcx]) )
   ;	
	mov	es,word ptr [bp-2]
	mov	bx,word ptr [bp-6]
	shl	bx,1
	mov	ax,word ptr es:[bx+130]
	mov	word ptr DGROUP:_slinewidth,ax
	or	ax,ax
	jne	short @5@1154
   ;	
   ;				continue;
   ;	
	jmp	@5@1898
@5@1154:
   ;	
   ;	
   ;			if (slinewidth == 1)
   ;	
	cmp	word ptr DGROUP:_slinewidth,1
	jne	short @5@1274
   ;	
   ;			{
   ;				if (slinex>=0 && wallheight[slinex] < height)
   ;	
	cmp	word ptr DGROUP:_slinex,0
	jl	short @5@1250
	mov	bx,word ptr DGROUP:_slinex
	shl	bx,1
	cmp	word ptr DGROUP:_wallheight[bx],di
	jae	short @5@1250
   ;	
   ;				{
   ;					ScaleLine ();
   ;	
	call	near ptr _ScaleLine
@5@1250:
   ;	
   ;				}
   ;				continue;
   ;	
	jmp	@5@1898
@5@1274:
   ;	
   ;			}
   ;	
   ;			//
   ;			// handle multi pixel lines
   ;			//
   ;			if (slinex<0)
   ;	
	cmp	word ptr DGROUP:_slinex,0
	jge	short @5@1370
   ;	
   ;			{
   ;				if (slinewidth <= -slinex)
   ;	
	mov	ax,word ptr DGROUP:_slinex
	neg	ax
	cmp	ax,word ptr DGROUP:_slinewidth
	jl	short @5@1346
   ;	
   ;					continue;		// still off the left edge
   ;	
	jmp	@5@1898
@5@1346:
   ;	
   ;	
   ;				slinewidth += slinex;
   ;	
	mov	ax,word ptr DGROUP:_slinex
	add	word ptr DGROUP:_slinewidth,ax
   ;	
   ;				slinex = 0;
   ;	
	mov	word ptr DGROUP:_slinex,0
   ;	
   ;			}
   ;	
	jmp	short @5@1418
@5@1370:
   ;	
   ;			else
   ;			{
   ;				if (slinex + slinewidth > viewwidth)
   ;	
	mov	ax,word ptr DGROUP:_slinex
	add	ax,word ptr DGROUP:_slinewidth
	cmp	ax,word ptr DGROUP:_viewwidth
	jle	short @5@1418
   ;	
   ;					slinewidth = viewwidth-slinex;
   ;	
	mov	ax,word ptr DGROUP:_viewwidth
	sub	ax,word ptr DGROUP:_slinex
	mov	word ptr DGROUP:_slinewidth,ax
@5@1418:
   ;	
   ;			}
   ;	
   ;	
   ;			leftvis = (wallheight[slinex] < height);
   ;	
	mov	bx,word ptr DGROUP:_slinex
	shl	bx,1
	cmp	word ptr DGROUP:_wallheight[bx],di
	jae	short @5@1466
	mov	ax,1
	jmp	short @5@1490
@5@1466:
	xor	ax,ax
@5@1490:
	mov	word ptr [bp-14],ax
   ;	
   ;			rightvis = (wallheight[slinex+slinewidth-1] < height);
   ;	
	mov	bx,word ptr DGROUP:_slinex
	add	bx,word ptr DGROUP:_slinewidth
	shl	bx,1
	cmp	word ptr DGROUP:_wallheight[bx-2],di
	jae	short @5@1538
	mov	ax,1
	jmp	short @5@1562
@5@1538:
	xor	ax,ax
@5@1562:
	mov	word ptr [bp-16],ax
   ;	
   ;	
   ;			if (leftvis)
   ;	
	cmp	word ptr [bp-14],0
	je	short @5@1754
   ;	
   ;			{
   ;				if (rightvis)
   ;	
	cmp	word ptr [bp-16],0
	je	short @5@1634
   ;	
   ;				{
   ;					ScaleLine ();
   ;	
	call	near ptr _ScaleLine
   ;	
   ;				}
   ;	
	jmp	short @5@1730
@5@1634:
	jmp	short @5@1682
@5@1658:
   ;	
   ;				else
   ;				{
   ;					while (wallheight[slinex+slinewidth-1] >= height)
   ;						slinewidth--;
   ;	
	dec	word ptr DGROUP:_slinewidth
@5@1682:
	mov	bx,word ptr DGROUP:_slinex
	add	bx,word ptr DGROUP:_slinewidth
	shl	bx,1
	cmp	word ptr DGROUP:_wallheight[bx-2],di
	jae	short @5@1658
   ;	
   ;					ScaleLine ();
   ;	
	call	near ptr _ScaleLine
   ;	
   ;					break;			// the rest of the shape is gone
   ;	
	jmp	short @5@1946
@5@1730:
   ;	
   ;				}
   ;			}
   ;	
	jmp	short @5@1898
@5@1754:
   ;	
   ;			else
   ;			{
   ;				if (rightvis)
   ;	
	cmp	word ptr [bp-16],0
	je	short @5@1874
	jmp	short @5@1826
@5@1802:
   ;	
   ;				{
   ;					while (wallheight[slinex] >= height)
   ;					{
   ;						slinex++;
   ;	
	inc	word ptr DGROUP:_slinex
   ;	
   ;						slinewidth--;
   ;	
	dec	word ptr DGROUP:_slinewidth
@5@1826:
	mov	bx,word ptr DGROUP:_slinex
	shl	bx,1
	cmp	word ptr DGROUP:_wallheight[bx],di
	jae	short @5@1802
   ;	
   ;					}
   ;					ScaleLine ();
   ;	
	call	near ptr _ScaleLine
   ;	
   ;				}
   ;	
	jmp	short @5@1898
@5@1874:
   ;	
   ;				else
   ;					continue;		// totally obscured
   ;	
	jmp	short @5@1898
@5@1898:
	inc	word ptr [bp-6]
	mov	ax,word ptr [bp-6]
	cmp	ax,word ptr [bp-8]
	ja	short @5@1946
	mov	ax,word ptr DGROUP:_slinewidth
	add	word ptr DGROUP:_slinex,ax
	mov	ax,word ptr DGROUP:_slinex
	cmp	ax,word ptr DGROUP:_viewwidth
	jge	@@3
	jmp	@5@1106
@@3:
@5@1946:
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
_ScaleShape	endp
   ;	
   ;	void SimpleScaleShape (int xcenter, int shapenum, unsigned height)
   ;	
	assume	cs:_TEXT
_SimpleScaleShape	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	push	si
	push	di
   ;	
   ;	{
   ;		t_compshape	_seg *shape;
   ;		t_compscale _seg *comptable;
   ;		unsigned	scale,srcx,stopx,tempx;
   ;		int			t;
   ;		unsigned	far *cmdptr;
   ;		boolean		leftvis,rightvis;
   ;	
   ;	
   ;		shape = PM_GetSpritePage (shapenum);
   ;	
	mov	ax,word ptr DGROUP:_PMSpriteStart
	add	ax,word ptr [bp+6]
	push	ax
	call	near ptr _PM_GetPage
	pop	cx
	mov	si,ax
   ;	
   ;	
   ;		scale = height>>1;
   ;	
	mov	ax,word ptr [bp+8]
	shr	ax,1
	mov	word ptr [bp-4],ax
   ;	
   ;		comptable = scaledirectory[scale];
   ;	
	mov	bx,word ptr [bp-4]
	shl	bx,1
	mov	ax,word ptr DGROUP:_scaledirectory[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;		*(((unsigned *)&linescale)+1)=(unsigned)comptable;	// seg of far call
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr DGROUP:_linescale+2,ax
   ;	
   ;		*(((unsigned *)&linecmds)+1)=(unsigned)shape;		// seg of shape
   ;	
	mov	word ptr DGROUP:_linecmds+2,si
   ;	
   ;	
   ;	//
   ;	// scale to the left (from pixel 31 to shape->leftpix)
   ;	//
   ;		srcx = 32;
   ;	
	mov	di,32
   ;	
   ;		slinex = xcenter;
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:_slinex,ax
   ;	
   ;		stopx = shape->leftpix;
   ;	
	mov	es,si
	mov	ax,word ptr es:[0]
	mov	word ptr [bp-6],ax
   ;	
   ;		cmdptr = &shape->dataofs[31-stopx];
   ;	
	mov	ax,4
	mov	dx,31
	sub	dx,word ptr [bp-6]
	shl	dx,1
	add	ax,dx
	mov	word ptr [bp-10],ax
	mov	word ptr [bp-8],si
	jmp	short @6@122
@6@50:
   ;	
   ;	
   ;		while ( --srcx >=stopx )
   ;		{
   ;			(unsigned)linecmds = *cmdptr--;
   ;	
	les	bx,dword ptr [bp-10]
	mov	ax,word ptr es:[bx]
	mov	word ptr DGROUP:_linecmds,ax
	sub	word ptr [bp-10],2
   ;	
   ;			if ( !(slinewidth = comptable->width[srcx]) )
   ;	
	mov	es,word ptr [bp-2]
	mov	bx,di
	shl	bx,1
	mov	ax,word ptr es:[bx+130]
	mov	word ptr DGROUP:_slinewidth,ax
	or	ax,ax
	jne	short @6@98
   ;	
   ;				continue;
   ;	
	jmp	short @6@122
@6@98:
   ;	
   ;	
   ;			slinex -= slinewidth;
   ;	
	mov	ax,word ptr DGROUP:_slinewidth
	sub	word ptr DGROUP:_slinex,ax
   ;	
   ;			ScaleLine ();
   ;	
	call	near ptr _ScaleLine
@6@122:
	dec	di
	mov	ax,di
	cmp	ax,word ptr [bp-6]
	jae	short @6@50
   ;	
   ;		}
   ;	
   ;	
   ;	//
   ;	// scale to the right
   ;	//
   ;		slinex = xcenter;
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:_slinex,ax
   ;	
   ;		stopx = shape->rightpix;
   ;	
	mov	es,si
	mov	ax,word ptr es:[2]
	mov	word ptr [bp-6],ax
   ;	
   ;		if (shape->leftpix<31)
   ;	
	mov	es,si
	cmp	word ptr es:[0],31
	jae	short @6@194
   ;	
   ;		{
   ;			srcx = 31;
   ;	
	mov	di,31
   ;	
   ;			cmdptr = &shape->dataofs[32-shape->leftpix];
   ;	
	mov	ax,4
	mov	es,si
	mov	dx,32
	sub	dx,word ptr es:[0]
	shl	dx,1
	add	ax,dx
	mov	word ptr [bp-10],ax
	mov	word ptr [bp-8],si
   ;	
   ;		}
   ;	
	jmp	short @6@218
@6@194:
   ;	
   ;		else
   ;		{
   ;			srcx = shape->leftpix-1;
   ;	
	mov	es,si
	mov	ax,word ptr es:[0]
	dec	ax
	mov	di,ax
   ;	
   ;			cmdptr = &shape->dataofs[0];
   ;	
	mov	word ptr [bp-10],4
	mov	word ptr [bp-8],si
@6@218:
   ;	
   ;		}
   ;		slinewidth = 0;
   ;	
	mov	word ptr DGROUP:_slinewidth,0
	jmp	short @6@314
@6@242:
   ;	
   ;	
   ;		while ( ++srcx <= stopx )
   ;		{
   ;			(unsigned)linecmds = *cmdptr++;
   ;	
	les	bx,dword ptr [bp-10]
	mov	ax,word ptr es:[bx]
	mov	word ptr DGROUP:_linecmds,ax
	add	word ptr [bp-10],2
   ;	
   ;			if ( !(slinewidth = comptable->width[srcx]) )
   ;	
	mov	es,word ptr [bp-2]
	mov	bx,di
	shl	bx,1
	mov	ax,word ptr es:[bx+130]
	mov	word ptr DGROUP:_slinewidth,ax
	or	ax,ax
	jne	short @6@290
   ;	
   ;				continue;
   ;	
	jmp	short @6@314
@6@290:
   ;	
   ;	
   ;			ScaleLine ();
   ;	
	call	near ptr _ScaleLine
   ;	
   ;			slinex+=slinewidth;
   ;	
	mov	ax,word ptr DGROUP:_slinewidth
	add	word ptr DGROUP:_slinex,ax
@6@314:
	inc	di
	mov	ax,di
	cmp	ax,word ptr [bp-6]
	jbe	short @6@242
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_SimpleScaleShape	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_mapmasks1	label	byte
	db	1
	db	3
	db	7
	db	15
	db	15
	db	15
	db	15
	db	15
	db	2
	db	6
	db	14
	db	14
	db	14
	db	14
	db	14
	db	14
	db	4
	db	12
	db	12
	db	12
	db	12
	db	12
	db	12
	db	12
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
_mapmasks2	label	byte
	db	0
	db	0
	db	0
	db	0
	db	1
	db	3
	db	7
	db	15
	db	0
	db	0
	db	0
	db	1
	db	3
	db	7
	db	15
	db	15
	db	0
	db	0
	db	1
	db	3
	db	7
	db	15
	db	15
	db	15
	db	0
	db	1
	db	3
	db	7
	db	15
	db	15
	db	15
	db	15
_mapmasks3	label	byte
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
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	3
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	3
	db	7
_wordmasks	label	word
	db	128
	db	0
	db	192
	db	0
	db	224
	db	0
	db	240
	db	0
	db	248
	db	0
	db	252
	db	0
	db	254
	db	0
	db	255
	db	0
	db	64
	db	0
	db	96
	db	0
	db	112
	db	0
	db	120
	db	0
	db	124
	db	0
	db	126
	db	0
	db	127
	db	0
	db	127
	db	128
	db	32
	db	0
	db	48
	db	0
	db	56
	db	0
	db	60
	db	0
	db	62
	db	0
	db	63
	db	0
	db	63
	db	128
	db	63
	db	192
	db	16
	db	0
	db	24
	db	0
	db	28
	db	0
	db	30
	db	0
	db	31
	db	0
	db	31
	db	128
	db	31
	db	192
	db	31
	db	224
	db	8
	db	0
	db	12
	db	0
	db	14
	db	0
	db	15
	db	0
	db	15
	db	128
	db	15
	db	192
	db	15
	db	224
	db	15
	db	240
	db	4
	db	0
	db	6
	db	0
	db	7
	db	0
	db	7
	db	128
	db	7
	db	192
	db	7
	db	224
	db	7
	db	240
	db	7
	db	248
	db	2
	db	0
	db	3
	db	0
	db	3
	db	128
	db	3
	db	192
	db	3
	db	224
	db	3
	db	240
	db	3
	db	248
	db	3
	db	252
	db	1
	db	0
	db	1
	db	128
	db	1
	db	192
	db	1
	db	224
	db	1
	db	240
	db	1
	db	248
	db	1
	db	252
	db	1
	db	254
_DATA	ends
_BSS	segment word public 'BSS'
_work	label	word
	db	2 dup (?)
_fullscalefarcall	label	word
	db	1028 dup (?)
longtemp	label	word
	db	4 dup (?)
_slinex	label	word
	db	2 dup (?)
_insetupscaling	label	word
	db	2 dup (?)
_mask1	label	byte
	db	1 dup (?)
_mask2	label	byte
	db	1 dup (?)
_mask3	label	byte
	db	1 dup (?)
	db	1 dup (?)
_stepbytwo	label	word
	db	2 dup (?)
_scaledirectory	label	word
	db	514 dup (?)
_linecmds	label	dword
	db	4 dup (?)
_slinewidth	label	word
	db	2 dup (?)
_maxscale	label	word
	db	2 dup (?)
_maskword	label	word
	db	2 dup (?)
_linescale	label	word
	db	4 dup (?)
_menuitems	label	word
	db	2 dup (?)
_maxscaleshl2	label	word
	db	2 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'BadScale called!'
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	extrn	__fmemcpy:near
	public	_maxscaleshl2
	public	_SetupScaling
	extrn	_MM_FreePtr:near
	extrn	_viewwidth:word
	public	_mapmasks3
	public	_mapmasks2
	public	_mapmasks1
	extrn	_wallheight:word
	extrn	_viewheight:word
	extrn	_MM_GetPtr:near
	public	_menuitems
	public	_linescale
	extrn	_PM_GetPage:near
	public	_maskword
	extrn	_MM_SortMem:near
	extrn	_MM_SetLock:near
	extrn	_bufferofs:word
	public	_maxscale
	public	_BadScale
	public	_slinewidth
	public	_linecmds
	public	_scaledirectory
	public	_stepbytwo
	extrn	_memset:near
	public	_mask3
	public	_mask2
	public	_mask1
	extrn	_Quit:near
	public	_insetupscaling
	public	_ScaleShape
	public	_slinex
	public	_wordmasks
	public	_ScaleLine
_longtemp	equ	longtemp
	public	_SimpleScaleShape
	public	_fullscalefarcall
	extrn	N_LDIV@:far
	public	_BuildCompScale
	extrn	_PMSpriteStart:word
	public	_work
	end
