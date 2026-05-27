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
	?debug	S "c:\id_mm.c"
	?debug	C E9E551FE7C0A633A5C69645F6D6D2E63
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
   ;	boolean MML_CheckForXMS (void)
   ;	
	assume	cs:_TEXT
_MML_CheckForXMS	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		numUMBs = 0;
   ;	
	mov	word ptr DGROUP:_numUMBs,0
   ;	
   ;	
   ;	asm {
   ;		mov	ax,0x4300
   ;	
	mov		ax,04300H
   ;	
   ;		int	0x2f				// query status of installed diver
   ;	
	int		02fH				
   ;	
   ;		cmp	al,0x80
   ;	
	cmp		al,080H
   ;	
   ;		je	good
   ;	
	je	short @1@170
   ;	
   ;		}
   ;	
   ;		return false;
   ;	
	xor	ax,ax
	jmp	short @1@194
@1@170:
   ;	
   ;	good:
   ;		return true;
   ;	
	mov	ax,1
	jmp	short @1@194
@1@194:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_MML_CheckForXMS	endp
   ;	
   ;	void MML_SetupXMS (void)
   ;	
	assume	cs:_TEXT
_MML_SetupXMS	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;	{
   ;		unsigned	base,size;
   ;	
   ;	asm	{
   ;		mov	ax,0x4310
   ;	
	mov		ax,04310H
   ;	
   ;		int	0x2f
   ;	
	int		02fH
   ;	
   ;		mov	[WORD PTR XMSaddr],bx
   ;	
	mov		[WORD PTR DGROUP:_XMSaddr],bx
   ;	
   ;		mov	[WORD PTR XMSaddr+2],es		// function pointer to XMS driver
   ;	
	mov		[WORD PTR DGROUP:_XMSaddr+2],es		
@2@122:
   ;	
   ;		}
   ;	
   ;	getmemory:
   ;	asm	{
   ;		mov	ah,XMS_ALLOCUMB
   ;	
	mov		ah,010H
   ;	
   ;		mov	dx,0xffff					// try for largest block possible
   ;	
	mov		dx,0ffffH					
   ;	
   ;		call	[DWORD PTR XMSaddr]
   ;	
	call		[DWORD PTR DGROUP:_XMSaddr]
   ;	
   ;		or	ax,ax
   ;	
	or		ax,ax
   ;	
   ;		jnz	gotone
   ;	
	jne	short @2@386
   ;	
   ;	
   ;		cmp	bl,0xb0						// error: smaller UMB is available
   ;	
	cmp		bl,0b0H						
   ;	
   ;		jne	done;
   ;	
	jne	short @2@482
   ;	
   ;	
   ;		mov	ah,XMS_ALLOCUMB
   ;	
	mov		ah,010H
   ;	
   ;		call	[DWORD PTR XMSaddr]		// DX holds largest available UMB
   ;	
	call		[DWORD PTR DGROUP:_XMSaddr]		
   ;	
   ;		or	ax,ax
   ;	
	or		ax,ax
   ;	
   ;		jz	done						// another error...
   ;	
	je	short @2@482
@2@386:
   ;	
   ;		}
   ;	
   ;	gotone:
   ;	asm	{
   ;		mov	[base],bx
   ;	
	mov		[[bp-2]],bx
   ;	
   ;		mov	[size],dx
   ;	
	mov		[[bp-4]],dx
   ;	
   ;		}
   ;		MML_UseSpace (base,size);
   ;	
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	call	near ptr _MML_UseSpace
	pop	cx
	pop	cx
   ;	
   ;		mminfo.XMSmem += size*16;
   ;	
	mov	ax,word ptr [bp-4]
	mov	cl,4
	shl	ax,cl
	add	word ptr DGROUP:_mminfo+12,ax
	adc	word ptr DGROUP:_mminfo+14,0
   ;	
   ;		UMBbase[numUMBs] = base;
   ;	
	mov	bx,word ptr DGROUP:_numUMBs
	shl	bx,1
	mov	ax,word ptr [bp-2]
	mov	word ptr DGROUP:_UMBbase[bx],ax
   ;	
   ;		numUMBs++;
   ;	
	inc	word ptr DGROUP:_numUMBs
   ;	
   ;		if (numUMBs < MAXUMBS)
   ;	
	cmp	word ptr DGROUP:_numUMBs,10
	jae	short @2@482
   ;	
   ;			goto getmemory;
   ;	
	jmp	short @2@122
@2@482:
   ;	
   ;	
   ;	done:;
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_MML_SetupXMS	endp
   ;	
   ;	void MML_ShutdownXMS (void)
   ;	
	assume	cs:_TEXT
_MML_ShutdownXMS	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
   ;	
   ;	{
   ;		int	i;
   ;		unsigned	base;
   ;	
   ;		for (i=0;i<numUMBs;i++)
   ;	
	xor	si,si
	jmp	short @3@170
@3@50:
   ;	
   ;		{
   ;			base = UMBbase[i];
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr DGROUP:_UMBbase[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;	asm	mov	ah,XMS_FREEUMB
   ;	
		mov		ah,011H
   ;	
   ;	asm	mov	dx,[base]
   ;	
		mov		dx,[[bp-2]]
   ;	
   ;	asm	call	[DWORD PTR XMSaddr]
   ;	
		call		[DWORD PTR DGROUP:_XMSaddr]
	inc	si
@3@170:
	cmp	si,word ptr DGROUP:_numUMBs
	jb	short @3@50
   ;	
   ;		}
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_MML_ShutdownXMS	endp
   ;	
   ;	void MML_UseSpace (unsigned segstart, unsigned seglength)
   ;	
	assume	cs:_TEXT
_MML_UseSpace	proc	near
	push	bp
	mov	bp,sp
	sub	sp,12
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		mmblocktype far *scan,far *last;
   ;		unsigned	oldend;
   ;		long		extra;
   ;	
   ;		scan = last = mmhead;
   ;	
	mov	ax,word ptr DGROUP:_mmhead+2
	mov	dx,word ptr DGROUP:_mmhead
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;		mmrover = mmhead;		// reset rover to start of memory
   ;	
	mov	ax,word ptr DGROUP:_mmhead+2
	mov	dx,word ptr DGROUP:_mmhead
	mov	word ptr DGROUP:_mmrover,dx
	mov	word ptr DGROUP:_mmrover+2,ax
	jmp	short @4@74
@4@50:
   ;	
   ;	
   ;	//
   ;	// search for the block that contains the range of segments
   ;	//
   ;		while (scan->start+scan->length < segstart)
   ;		{
   ;			last = scan;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;			scan = scan->next;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
@4@74:
	les	bx,dword ptr [bp-4]
	push	es
	mov	es,word ptr [bp-2]
	push	bx
	mov	bx,word ptr [bp-4]
	mov	ax,word ptr es:[bx]
	pop	bx
	pop	es
	add	ax,word ptr es:[bx+2]
	cmp	ax,si
	jb	short @4@50
   ;	
   ;		}
   ;	
   ;	//
   ;	// take the given range out of the block
   ;	//
   ;		oldend = scan->start + scan->length;
   ;	
	les	bx,dword ptr [bp-4]
	push	es
	mov	es,word ptr [bp-2]
	push	bx
	mov	bx,word ptr [bp-4]
	mov	ax,word ptr es:[bx]
	pop	bx
	pop	es
	add	ax,word ptr es:[bx+2]
	mov	di,ax
   ;	
   ;		extra = oldend - (segstart+seglength);
   ;	
	mov	ax,si
	add	ax,word ptr [bp+6]
	mov	dx,di
	sub	dx,ax
	mov	word ptr [bp-12],dx
	mov	word ptr [bp-10],0
   ;	
   ;		if (extra < 0)
   ;	
	cmp	word ptr [bp-10],0
	jg	short @4@194
	jl	short @4@170
	cmp	word ptr [bp-12],0
	jae	short @4@194
@4@170:
   ;	
   ;			Quit ("MML_UseSpace: Segment spans two blocks!");
   ;	
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _Quit
	pop	cx
@4@194:
   ;	
   ;	
   ;		if (segstart == scan->start)
   ;	
	les	bx,dword ptr [bp-4]
	cmp	word ptr es:[bx],si
	jne	short @4@242
   ;	
   ;		{
   ;			last->next = scan->next;			// unlink block
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	les	bx,dword ptr [bp-8]
	mov	word ptr es:[bx+8],dx
	mov	word ptr es:[bx+10],ax
   ;	
   ;			FREEBLOCK(scan);
   ;	
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx+6]
	mov	word ptr [bx],0
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr DGROUP:_mmfree+2
	mov	dx,word ptr DGROUP:_mmfree
	mov	word ptr es:[bx+8],dx
	mov	word ptr es:[bx+10],ax
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr DGROUP:_mmfree,dx
	mov	word ptr DGROUP:_mmfree+2,ax
   ;	
   ;			scan = last;
   ;	
	mov	ax,word ptr [bp-6]
	mov	dx,word ptr [bp-8]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;		}
   ;	
	jmp	short @4@266
@4@242:
   ;	
   ;		else
   ;			scan->length = segstart-scan->start;	// shorten block
   ;	
	les	bx,dword ptr [bp-4]
	push	es
	mov	es,word ptr [bp-2]
	push	bx
	mov	bx,word ptr [bp-4]
	mov	ax,si
	sub	ax,word ptr es:[bx]
	pop	bx
	pop	es
	mov	word ptr es:[bx+2],ax
@4@266:
   ;	
   ;	
   ;		if (extra > 0)
   ;	
	cmp	word ptr [bp-10],0
	jge	@@0
	jmp	@4@410
@@0:
	jg	short @4@338
	cmp	word ptr [bp-12],0
	ja	@@1
	jmp	@4@410
@@1:
@4@338:
   ;	
   ;		{
   ;			GETNEWBLOCK;
   ;	
	mov	ax,word ptr DGROUP:_mmfree
	or	ax,word ptr DGROUP:_mmfree+2
	jne	short @4@386
	call	near ptr _MML_ClearBlock
@4@386:
	mov	ax,word ptr DGROUP:_mmfree+2
	mov	dx,word ptr DGROUP:_mmfree
	mov	word ptr DGROUP:_mmnew,dx
	mov	word ptr DGROUP:_mmnew+2,ax
	les	bx,dword ptr DGROUP:_mmfree
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr DGROUP:_mmfree,dx
	mov	word ptr DGROUP:_mmfree+2,ax
   ;	
   ;			mmnew->useptr = NULL;
   ;	
	les	bx,dword ptr DGROUP:_mmnew
	mov	word ptr es:[bx+6],0
   ;	
   ;	
   ;			mmnew->next = scan->next;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	les	bx,dword ptr DGROUP:_mmnew
	mov	word ptr es:[bx+8],dx
	mov	word ptr es:[bx+10],ax
   ;	
   ;			scan->next = mmnew;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr DGROUP:_mmnew+2
	mov	dx,word ptr DGROUP:_mmnew
	mov	word ptr es:[bx+8],dx
	mov	word ptr es:[bx+10],ax
   ;	
   ;			mmnew->start = segstart+seglength;
   ;	
	mov	ax,si
	add	ax,word ptr [bp+6]
	les	bx,dword ptr DGROUP:_mmnew
	mov	word ptr es:[bx],ax
   ;	
   ;			mmnew->length = extra;
   ;	
	les	bx,dword ptr DGROUP:_mmnew
	mov	ax,word ptr [bp-12]
	mov	word ptr es:[bx+2],ax
   ;	
   ;			mmnew->attributes = LOCKBIT;
   ;	
	les	bx,dword ptr DGROUP:_mmnew
	mov	word ptr es:[bx+4],128
@4@410:
   ;	
   ;		}
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_MML_UseSpace	endp
   ;	
   ;	void MML_ClearBlock (void)
   ;	
	assume	cs:_TEXT
_MML_ClearBlock	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;	{
   ;		mmblocktype far *scan,far *last;
   ;	
   ;		scan = mmhead->next;
   ;	
	les	bx,dword ptr DGROUP:_mmhead
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
	jmp	short @5@146
@5@50:
   ;	
   ;	
   ;		while (scan)
   ;		{
   ;			if (!(scan->attributes&LOCKBIT) && (scan->attributes&PURGEBITS) )
   ;	
	les	bx,dword ptr [bp-4]
	test	word ptr es:[bx+4],128
	jne	short @5@122
	les	bx,dword ptr [bp-4]
	test	word ptr es:[bx+4],3
	je	short @5@122
   ;	
   ;			{
   ;				MM_FreePtr(scan->useptr);
   ;	
	les	bx,dword ptr [bp-4]
	push	word ptr es:[bx+6]
	call	near ptr _MM_FreePtr
	pop	cx
   ;	
   ;				return;
   ;	
	jmp	short @5@194
@5@122:
   ;	
   ;			}
   ;			scan = scan->next;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
@5@146:
	mov	ax,word ptr [bp-4]
	or	ax,word ptr [bp-2]
	jne	short @5@50
   ;	
   ;		}
   ;	
   ;		Quit ("MM_ClearBlock: No purgable blocks!");
   ;	
	mov	ax,offset DGROUP:s@+40
	push	ax
	call	near ptr _Quit
	pop	cx
@5@194:
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_MML_ClearBlock	endp
_TEXT	ends
_DATA	segment word public 'DATA'
ParmStrings	label	word
	dw	DGROUP:s@+75
	dw	DGROUP:s@+81
	dw	DGROUP:s@+87
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void MM_Startup (void)
   ;	
	assume	cs:_TEXT
_MM_Startup	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	push	si
	push	di
   ;	
   ;	{
   ;		int i;
   ;		unsigned 	long length;
   ;		void far 	*start;
   ;		unsigned 	segstart,seglength,endfree;
   ;	
   ;		if (mmstarted)
   ;	
	cmp	word ptr DGROUP:_mmstarted,0
	je	short @6@74
   ;	
   ;			MM_Shutdown ();
   ;	
	call	near ptr _MM_Shutdown
@6@74:
   ;	
   ;	
   ;	
   ;		mmstarted = true;
   ;	
	mov	word ptr DGROUP:_mmstarted,1
   ;	
   ;		bombonerror = true;
   ;	
	mov	word ptr DGROUP:_bombonerror,1
   ;	
   ;	//
   ;	// set up the linked list (everything in the free list;
   ;	//
   ;		mmhead = NULL;
   ;	
	mov	word ptr DGROUP:_mmhead,0
	mov	word ptr DGROUP:_mmhead+2,0
   ;	
   ;		mmfree = &mmblocks[0];
   ;	
	mov	word ptr DGROUP:_mmfree,offset _mmblocks
	mov	word ptr DGROUP:_mmfree+2,seg _mmblocks
   ;	
   ;		for (i=0;i<MAXBLOCKS-1;i++)
   ;	
	xor	si,si
	jmp	short @6@146
@6@98:
   ;	
   ;			mmblocks[i].next = &mmblocks[i+1];
   ;	
	mov	ax,si
	mov	dx,12
	imul	dx
	add	ax,offset _mmblocks+12
	push	ax
	mov	ax,si
	mov	dx,12
	imul	dx
	mov	dx,seg _mmblocks
	mov	bx,ax
	mov	es,dx
	pop	ax
	mov	word ptr es:_mmblocks[bx+8],ax
	mov	word ptr es:_mmblocks[bx+10],seg _mmblocks
	inc	si
@6@146:
	cmp	si,699
	jl	short @6@98
   ;	
   ;		mmblocks[i].next = NULL;
   ;	
	mov	ax,si
	mov	dx,12
	imul	dx
	mov	dx,seg _mmblocks
	mov	bx,ax
	mov	es,dx
	mov	word ptr es:_mmblocks[bx+8],0
	mov	word ptr es:_mmblocks[bx+10],0
   ;	
   ;	
   ;	//
   ;	// locked block of all memory until we punch out free space
   ;	//
   ;		GETNEWBLOCK;
   ;	
	mov	ax,word ptr DGROUP:_mmfree
	or	ax,word ptr DGROUP:_mmfree+2
	jne	short @6@218
	call	near ptr _MML_ClearBlock
@6@218:
	mov	ax,word ptr DGROUP:_mmfree+2
	mov	dx,word ptr DGROUP:_mmfree
	mov	word ptr DGROUP:_mmnew,dx
	mov	word ptr DGROUP:_mmnew+2,ax
	les	bx,dword ptr DGROUP:_mmfree
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr DGROUP:_mmfree,dx
	mov	word ptr DGROUP:_mmfree+2,ax
   ;	
   ;		mmhead = mmnew;				// this will allways be the first node
   ;	
	mov	ax,word ptr DGROUP:_mmnew+2
	mov	dx,word ptr DGROUP:_mmnew
	mov	word ptr DGROUP:_mmhead,dx
	mov	word ptr DGROUP:_mmhead+2,ax
   ;	
   ;		mmnew->start = 0;
   ;	
	les	bx,dword ptr DGROUP:_mmnew
	mov	word ptr es:[bx],0
   ;	
   ;		mmnew->length = 0xffff;
   ;	
	les	bx,dword ptr DGROUP:_mmnew
	mov	word ptr es:[bx+2],65535
   ;	
   ;		mmnew->attributes = LOCKBIT;
   ;	
	les	bx,dword ptr DGROUP:_mmnew
	mov	word ptr es:[bx+4],128
   ;	
   ;		mmnew->next = NULL;
   ;	
	les	bx,dword ptr DGROUP:_mmnew
	mov	word ptr es:[bx+8],0
	mov	word ptr es:[bx+10],0
   ;	
   ;		mmrover = mmhead;
   ;	
	mov	ax,word ptr DGROUP:_mmhead+2
	mov	dx,word ptr DGROUP:_mmhead
	mov	word ptr DGROUP:_mmrover,dx
	mov	word ptr DGROUP:_mmrover+2,ax
   ;	
   ;	
   ;	
   ;	//
   ;	// get all available near conventional memory segments
   ;	//
   ;		length=coreleft();
   ;	
	call	near ptr _coreleft
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],0
   ;	
   ;		start = (void far *)(nearheap = malloc(length));
   ;	
	push	word ptr [bp-4]
	call	near ptr _malloc
	pop	cx
	mov	word ptr DGROUP:_nearheap,ax
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],ds
   ;	
   ;	
   ;		length -= 16-(FP_OFF(start)&15);
   ;	
	mov	ax,word ptr [bp-8]
	and	ax,15
	mov	dx,16
	sub	dx,ax
	sub	word ptr [bp-4],dx
	sbb	word ptr [bp-2],0
   ;	
   ;		length -= SAVENEARHEAP;
   ;	
	sub	word ptr [bp-4],1024
	sbb	word ptr [bp-2],0
   ;	
   ;		seglength = length / 16;			// now in paragraphs
   ;	
	mov	dx,word ptr [bp-2]
	mov	ax,word ptr [bp-4]
	mov	cl,4
	call	near ptr N_LXURSH@
	mov	di,ax
   ;	
   ;		segstart = FP_SEG(start)+(FP_OFF(start)+15)/16;
   ;	
	mov	ax,word ptr [bp-8]
	add	ax,15
	mov	cl,4
	shr	ax,cl
	mov	dx,word ptr [bp-6]
	add	dx,ax
	mov	word ptr [bp-10],dx
   ;	
   ;		MML_UseSpace (segstart,seglength);
   ;	
	push	di
	push	word ptr [bp-10]
	call	near ptr _MML_UseSpace
	pop	cx
	pop	cx
   ;	
   ;		mminfo.nearheap = length;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr DGROUP:_mminfo,dx
	mov	word ptr DGROUP:_mminfo+2,ax
   ;	
   ;	
   ;	//
   ;	// get all available far conventional memory segments
   ;	//
   ;		length=farcoreleft();
   ;	
	call	near ptr _farcoreleft
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;		start = farheap = farmalloc(length);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr _farmalloc
	pop	cx
	pop	cx
	mov	word ptr DGROUP:_farheap,ax
	mov	word ptr DGROUP:_farheap+2,dx
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],dx
   ;	
   ;		length -= 16-(FP_OFF(start)&15);
   ;	
	mov	ax,word ptr [bp-8]
	and	ax,15
	mov	dx,16
	sub	dx,ax
	sub	word ptr [bp-4],dx
	sbb	word ptr [bp-2],0
   ;	
   ;		length -= SAVEFARHEAP;
   ;	
	sub	word ptr [bp-4],0
	sbb	word ptr [bp-2],0
   ;	
   ;		seglength = length / 16;			// now in paragraphs
   ;	
	mov	dx,word ptr [bp-2]
	mov	ax,word ptr [bp-4]
	mov	cl,4
	call	near ptr N_LXURSH@
	mov	di,ax
   ;	
   ;		segstart = FP_SEG(start)+(FP_OFF(start)+15)/16;
   ;	
	mov	ax,word ptr [bp-8]
	add	ax,15
	mov	cl,4
	shr	ax,cl
	mov	dx,word ptr [bp-6]
	add	dx,ax
	mov	word ptr [bp-10],dx
   ;	
   ;		MML_UseSpace (segstart,seglength);
   ;	
	push	di
	push	word ptr [bp-10]
	call	near ptr _MML_UseSpace
	pop	cx
	pop	cx
   ;	
   ;		mminfo.farheap = length;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr DGROUP:_mminfo+4,dx
	mov	word ptr DGROUP:_mminfo+6,ax
   ;	
   ;		mminfo.mainmem = mminfo.nearheap + mminfo.farheap;
   ;	
	mov	ax,word ptr DGROUP:_mminfo+2
	mov	dx,word ptr DGROUP:_mminfo
	add	dx,word ptr DGROUP:_mminfo+4
	adc	ax,word ptr DGROUP:_mminfo+6
	mov	word ptr DGROUP:_mminfo+16,dx
	mov	word ptr DGROUP:_mminfo+18,ax
   ;	
   ;	
   ;	//
   ;	// allocate the misc buffer
   ;	//
   ;		mmrover = mmhead;		// start looking for space after low block
   ;	
	mov	ax,word ptr DGROUP:_mmhead+2
	mov	dx,word ptr DGROUP:_mmhead
	mov	word ptr DGROUP:_mmrover,dx
	mov	word ptr DGROUP:_mmrover+2,ax
   ;	
   ;	
   ;		MM_GetPtr (&bufferseg,BUFFERSIZE);
   ;	
	xor	ax,ax
	mov	dx,4096
	push	ax
	push	dx
	mov	ax,offset DGROUP:_bufferseg
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_MM_Startup	endp
   ;	
   ;	void MM_Shutdown (void)
   ;	
	assume	cs:_TEXT
_MM_Shutdown	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	  if (!mmstarted)
   ;	
	cmp	word ptr DGROUP:_mmstarted,0
	jne	short @7@74
   ;	
   ;		return;
   ;	
	jmp	short @7@98
@7@74:
   ;	
   ;	
   ;	  farfree (farheap);
   ;	
	push	word ptr DGROUP:_farheap+2
	push	word ptr DGROUP:_farheap
	call	near ptr _farfree
	pop	cx
	pop	cx
   ;	
   ;	  free (nearheap);
   ;	
	push	word ptr DGROUP:_nearheap
	call	near ptr _free
	pop	cx
@7@98:
   ;	
   ;	//  MML_ShutdownXMS ();
   ;	}
   ;	
	pop	bp
	ret	
_MM_Shutdown	endp
   ;	
   ;	void MM_GetPtr (memptr *baseptr,unsigned long size)
   ;	
	assume	cs:_TEXT
_MM_GetPtr	proc	near
	push	bp
	mov	bp,sp
	sub	sp,28
	push	si
	push	di
   ;	
   ;	{
   ;		mmblocktype far *scan,far *lastscan,far *endscan
   ;					,far *purge,far *next;
   ;		int			search;
   ;		unsigned	needed,startseg;
   ;	
   ;		needed = (size+15)/16;		// convert size from bytes to paragraphs
   ;	
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	add	ax,15
	adc	dx,0
	mov	cl,4
	call	near ptr N_LXURSH@
	mov	word ptr [bp-22],ax
   ;	
   ;	
   ;		GETNEWBLOCK;				// fill in start and next after a spot is found
   ;	
	mov	ax,word ptr DGROUP:_mmfree
	or	ax,word ptr DGROUP:_mmfree+2
	jne	short @8@74
	call	near ptr _MML_ClearBlock
@8@74:
	mov	ax,word ptr DGROUP:_mmfree+2
	mov	dx,word ptr DGROUP:_mmfree
	mov	word ptr DGROUP:_mmnew,dx
	mov	word ptr DGROUP:_mmnew+2,ax
	les	bx,dword ptr DGROUP:_mmfree
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr DGROUP:_mmfree,dx
	mov	word ptr DGROUP:_mmfree+2,ax
   ;	
   ;		mmnew->length = needed;
   ;	
	les	bx,dword ptr DGROUP:_mmnew
	mov	ax,word ptr [bp-22]
	mov	word ptr es:[bx+2],ax
   ;	
   ;		mmnew->useptr = baseptr;
   ;	
	les	bx,dword ptr DGROUP:_mmnew
	mov	ax,word ptr [bp+4]
	mov	word ptr es:[bx+6],ax
   ;	
   ;		mmnew->attributes = BASEATTRIBUTES;
   ;	
	les	bx,dword ptr DGROUP:_mmnew
	mov	word ptr es:[bx+4],0
@8@98:
   ;	
   ;	
   ;	tryagain:
   ;		for (search = 0; search<3; search++)
   ;	
	xor	si,si
	jmp	@8@746
@8@122:
   ;	
   ;		{
   ;		//
   ;		// first search:	try to allocate right after the rover, then on up
   ;		// second search: 	search from the head pointer up to the rover
   ;		// third search:	compress memory, then scan from start
   ;			if (search == 1 && mmrover == mmhead)
   ;	
	cmp	si,1
	jne	short @8@218
	mov	ax,word ptr DGROUP:_mmrover+2
	mov	dx,word ptr DGROUP:_mmrover
	cmp	ax,word ptr DGROUP:_mmhead+2
	jne	short @8@218
	cmp	dx,word ptr DGROUP:_mmhead
	jne	short @8@218
   ;	
   ;				search++;
   ;	
	inc	si
@8@218:
   ;	
   ;	
   ;			switch (search)
   ;	
	mov	ax,si
	or	ax,ax
	je	short @8@338
	cmp	ax,1
	je	short @8@362
	cmp	ax,2
	je	short @8@386
	jmp	@8@410
@8@338:
   ;	
   ;			{
   ;			case 0:
   ;				lastscan = mmrover;
   ;	
	mov	ax,word ptr DGROUP:_mmrover+2
	mov	dx,word ptr DGROUP:_mmrover
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;				scan = mmrover->next;
   ;	
	les	bx,dword ptr DGROUP:_mmrover
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;				endscan = NULL;
   ;	
	mov	word ptr [bp-12],0
	mov	word ptr [bp-10],0
   ;	
   ;				break;
   ;	
	jmp	short @8@410
@8@362:
   ;	
   ;			case 1:
   ;				lastscan = mmhead;
   ;	
	mov	ax,word ptr DGROUP:_mmhead+2
	mov	dx,word ptr DGROUP:_mmhead
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;				scan = mmhead->next;
   ;	
	les	bx,dword ptr DGROUP:_mmhead
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;				endscan = mmrover;
   ;	
	mov	ax,word ptr DGROUP:_mmrover+2
	mov	dx,word ptr DGROUP:_mmrover
	mov	word ptr [bp-12],dx
	mov	word ptr [bp-10],ax
   ;	
   ;				break;
   ;	
	jmp	short @8@410
@8@386:
   ;	
   ;			case 2:
   ;				MM_SortMem ();
   ;	
	call	near ptr _MM_SortMem
   ;	
   ;				lastscan = mmhead;
   ;	
	mov	ax,word ptr DGROUP:_mmhead+2
	mov	dx,word ptr DGROUP:_mmhead
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;				scan = mmhead->next;
   ;	
	les	bx,dword ptr DGROUP:_mmhead
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;				endscan = NULL;
   ;	
	mov	word ptr [bp-12],0
	mov	word ptr [bp-10],0
   ;	
   ;				break;
   ;	
	jmp	short @8@410
@8@410:
   ;	
   ;			}
   ;	
   ;			startseg = lastscan->start + lastscan->length;
   ;	
	les	bx,dword ptr [bp-8]
	push	es
	mov	es,word ptr [bp-6]
	push	bx
	mov	bx,word ptr [bp-8]
	mov	ax,word ptr es:[bx]
	pop	bx
	pop	es
	add	ax,word ptr es:[bx+2]
	mov	di,ax
	jmp	@8@674
@8@434:
   ;	
   ;	
   ;			while (scan != endscan)
   ;			{
   ;				if (scan->start - startseg >= needed)
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx]
	sub	ax,di
	cmp	ax,word ptr [bp-22]
	jae	@@2
	jmp	@8@578
@@2:
   ;	
   ;				{
   ;				//
   ;				// got enough space between the end of lastscan and
   ;				// the start of scan, so throw out anything in the middle
   ;				// and allocate the new block
   ;				//
   ;					purge = lastscan->next;
   ;	
	les	bx,dword ptr [bp-8]
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr [bp-16],dx
	mov	word ptr [bp-14],ax
   ;	
   ;					lastscan->next = mmnew;
   ;	
	les	bx,dword ptr [bp-8]
	mov	ax,word ptr DGROUP:_mmnew+2
	mov	dx,word ptr DGROUP:_mmnew
	mov	word ptr es:[bx+8],dx
	mov	word ptr es:[bx+10],ax
   ;	
   ;					mmnew->start = *(unsigned *)baseptr = startseg;
   ;	
	mov	bx,word ptr [bp+4]
	mov	ax,di
	mov	word ptr [bx],ax
	les	bx,dword ptr DGROUP:_mmnew
	mov	word ptr es:[bx],ax
   ;	
   ;					mmnew->next = scan;
   ;	
	les	bx,dword ptr DGROUP:_mmnew
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr es:[bx+8],dx
	mov	word ptr es:[bx+10],ax
	jmp	short @8@506
@8@482:
   ;	
   ;					while ( purge != scan)
   ;					{	// free the purgable block
   ;						next = purge->next;
   ;	
	les	bx,dword ptr [bp-16]
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr [bp-20],dx
	mov	word ptr [bp-18],ax
   ;	
   ;						FREEBLOCK(purge);
   ;	
	les	bx,dword ptr [bp-16]
	mov	bx,word ptr es:[bx+6]
	mov	word ptr [bx],0
	les	bx,dword ptr [bp-16]
	mov	ax,word ptr DGROUP:_mmfree+2
	mov	dx,word ptr DGROUP:_mmfree
	mov	word ptr es:[bx+8],dx
	mov	word ptr es:[bx+10],ax
	mov	ax,word ptr [bp-14]
	mov	dx,word ptr [bp-16]
	mov	word ptr DGROUP:_mmfree,dx
	mov	word ptr DGROUP:_mmfree+2,ax
   ;	
   ;						purge = next;		// purge another if not at scan
   ;	
	mov	ax,word ptr [bp-18]
	mov	dx,word ptr [bp-20]
	mov	word ptr [bp-16],dx
	mov	word ptr [bp-14],ax
@8@506:
	mov	ax,word ptr [bp-14]
	mov	dx,word ptr [bp-16]
	cmp	ax,word ptr [bp-2]
	jne	short @8@482
	cmp	dx,word ptr [bp-4]
	jne	short @8@482
   ;	
   ;					}
   ;					mmrover = mmnew;
   ;	
	mov	ax,word ptr DGROUP:_mmnew+2
	mov	dx,word ptr DGROUP:_mmnew
	mov	word ptr DGROUP:_mmrover,dx
	mov	word ptr DGROUP:_mmrover+2,ax
   ;	
   ;					return;	// good allocation!
   ;	
	jmp	@8@938
@8@578:
   ;	
   ;				}
   ;	
   ;				//
   ;				// if this block is purge level zero or locked, skip past it
   ;				//
   ;				if ( (scan->attributes & LOCKBIT)
   ;	
   ;	
   ;					|| !(scan->attributes & PURGEBITS) )
   ;	
	les	bx,dword ptr [bp-4]
	test	word ptr es:[bx+4],128
	jne	short @8@626
	les	bx,dword ptr [bp-4]
	test	word ptr es:[bx+4],3
	jne	short @8@650
@8@626:
   ;	
   ;				{
   ;					lastscan = scan;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;					startseg = lastscan->start + lastscan->length;
   ;	
	les	bx,dword ptr [bp-8]
	push	es
	mov	es,word ptr [bp-6]
	push	bx
	mov	bx,word ptr [bp-8]
	mov	ax,word ptr es:[bx]
	pop	bx
	pop	es
	add	ax,word ptr es:[bx+2]
	mov	di,ax
@8@650:
   ;	
   ;				}
   ;	
   ;	
   ;				scan=scan->next;		// look at next line
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
@8@674:
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	cmp	ax,word ptr [bp-10]
	je	@@3
	jmp	@8@434
@@3:
	cmp	dx,word ptr [bp-12]
	je	@@4
	jmp	@8@434
@@4:
	inc	si
@8@746:
	cmp	si,3
	jge	@@5
	jmp	@8@122
@@5:
   ;	
   ;			}
   ;		}
   ;	
   ;		if (bombonerror)
   ;	
	cmp	word ptr DGROUP:_bombonerror,0
	je	short @8@914
   ;	
   ;		{
   ;	
   ;	extern char configname[];
   ;	extern	boolean	insetupscaling;
   ;	extern	int	viewsize;
   ;	boolean SetViewSize (unsigned width, unsigned height);
   ;	#define HEIGHTRATIO		0.50
   ;	//
   ;	// wolf hack -- size the view down
   ;	//
   ;			if (!insetupscaling && viewsize>10)
   ;	
	cmp	word ptr DGROUP:_insetupscaling,0
	jne	short @8@866
	cmp	word ptr DGROUP:_viewsize,10
	jle	short @8@866
   ;	
   ;			{
   ;	mmblocktype	far *savedmmnew;
   ;				savedmmnew = mmnew;
   ;	
	mov	ax,word ptr DGROUP:_mmnew+2
	mov	dx,word ptr DGROUP:_mmnew
	mov	word ptr [bp-28],dx
	mov	word ptr [bp-26],ax
   ;	
   ;				viewsize -= 2;
   ;	
	sub	word ptr DGROUP:_viewsize,2
   ;	
   ;				SetViewSize (viewsize*16,viewsize*16*HEIGHTRATIO);
   ;	
	mov	ax,word ptr DGROUP:_viewsize
	mov	cl,4
	shl	ax,cl
	mov	word ptr [bp-24],ax
	FILD	word ptr [bp-24]
	FMUL	dword ptr DGROUP:s@+88
	call	near ptr N_FTOL@
	push	ax
	mov	ax,word ptr DGROUP:_viewsize
	mov	cl,4
	shl	ax,cl
	push	ax
	call	near ptr _SetViewSize
	pop	cx
	pop	cx
   ;	
   ;				mmnew = savedmmnew;
   ;	
	mov	ax,word ptr [bp-26]
	mov	dx,word ptr [bp-28]
	mov	word ptr DGROUP:_mmnew,dx
	mov	word ptr DGROUP:_mmnew+2,ax
   ;	
   ;				goto tryagain;
   ;	
	jmp	@8@98
@8@866:
   ;	
   ;			}
   ;	
   ;	//		unlink(configname);
   ;			Quit ("MM_GetPtr: Out of memory!");
   ;	
	mov	ax,offset DGROUP:s@+92
	push	ax
	call	near ptr _Quit
	pop	cx
   ;	
   ;		}
   ;	
	jmp	short @8@938
@8@914:
   ;	
   ;		else
   ;			mmerror = true;
   ;	
	mov	word ptr DGROUP:_mmerror,1
@8@938:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_MM_GetPtr	endp
   ;	
   ;	void MM_FreePtr (memptr *baseptr)
   ;	
	assume	cs:_TEXT
_MM_FreePtr	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
   ;	
   ;	{
   ;		mmblocktype far *scan,far *last;
   ;	
   ;		last = mmhead;
   ;	
	mov	ax,word ptr DGROUP:_mmhead+2
	mov	dx,word ptr DGROUP:_mmhead
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;		scan = last->next;
   ;	
	les	bx,dword ptr [bp-8]
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;		if (baseptr == mmrover->useptr)	// removed the last allocated block
   ;	
	les	bx,dword ptr DGROUP:_mmrover
	mov	ax,word ptr es:[bx+6]
	cmp	ax,word ptr [bp+4]
	jne	short @9@74
   ;	
   ;			mmrover = mmhead;
   ;	
	mov	ax,word ptr DGROUP:_mmhead+2
	mov	dx,word ptr DGROUP:_mmhead
	mov	word ptr DGROUP:_mmrover,dx
	mov	word ptr DGROUP:_mmrover+2,ax
@9@74:
	jmp	short @9@122
@9@98:
   ;	
   ;	
   ;		while (scan->useptr != baseptr && scan)
   ;		{
   ;			last = scan;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;			scan = scan->next;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
@9@122:
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+6]
	cmp	ax,word ptr [bp+4]
	je	short @9@170
	mov	ax,word ptr [bp-4]
	or	ax,word ptr [bp-2]
	jne	short @9@98
@9@170:
   ;	
   ;		}
   ;	
   ;		if (!scan)
   ;	
	mov	ax,word ptr [bp-4]
	or	ax,word ptr [bp-2]
	jne	short @9@218
   ;	
   ;			Quit ("MM_FreePtr: Block not found!");
   ;	
	mov	ax,offset DGROUP:s@+118
	push	ax
	call	near ptr _Quit
	pop	cx
@9@218:
   ;	
   ;	
   ;		last->next = scan->next;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	les	bx,dword ptr [bp-8]
	mov	word ptr es:[bx+8],dx
	mov	word ptr es:[bx+10],ax
   ;	
   ;	
   ;		FREEBLOCK(scan);
   ;	
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx+6]
	mov	word ptr [bx],0
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr DGROUP:_mmfree+2
	mov	dx,word ptr DGROUP:_mmfree
	mov	word ptr es:[bx+8],dx
	mov	word ptr es:[bx+10],ax
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr DGROUP:_mmfree,dx
	mov	word ptr DGROUP:_mmfree+2,ax
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_MM_FreePtr	endp
   ;	
   ;	void MM_SetPurge (memptr *baseptr, int purge)
   ;	
	assume	cs:_TEXT
_MM_SetPurge	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;	{
   ;		mmblocktype far *start;
   ;	
   ;		start = mmrover;
   ;	
	mov	ax,word ptr DGROUP:_mmrover+2
	mov	dx,word ptr DGROUP:_mmrover
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
@10@50:
   ;	
   ;	
   ;		do
   ;		{
   ;			if (mmrover->useptr == baseptr)
   ;	
	les	bx,dword ptr DGROUP:_mmrover
	mov	ax,word ptr es:[bx+6]
	cmp	ax,word ptr [bp+4]
	jne	short @10@98
   ;	
   ;				break;
   ;	
	jmp	short @10@242
@10@98:
   ;	
   ;	
   ;			mmrover = mmrover->next;
   ;	
	les	bx,dword ptr DGROUP:_mmrover
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr DGROUP:_mmrover,dx
	mov	word ptr DGROUP:_mmrover+2,ax
   ;	
   ;	
   ;			if (!mmrover)
   ;	
	mov	ax,word ptr DGROUP:_mmrover
	or	ax,word ptr DGROUP:_mmrover+2
	jne	short @10@146
   ;	
   ;				mmrover = mmhead;
   ;	
	mov	ax,word ptr DGROUP:_mmhead+2
	mov	dx,word ptr DGROUP:_mmhead
	mov	word ptr DGROUP:_mmrover,dx
	mov	word ptr DGROUP:_mmrover+2,ax
	jmp	short @10@218
@10@146:
   ;	
   ;			else if (mmrover == start)
   ;	
	mov	ax,word ptr DGROUP:_mmrover+2
	mov	dx,word ptr DGROUP:_mmrover
	cmp	ax,word ptr [bp-2]
	jne	short @10@218
	cmp	dx,word ptr [bp-4]
	jne	short @10@218
   ;	
   ;				Quit ("MM_SetPurge: Block not found!");
   ;	
	mov	ax,offset DGROUP:s@+147
	push	ax
	call	near ptr _Quit
	pop	cx
@10@218:
   ;	
   ;	
   ;		} while (1);
   ;	
	jmp	short @10@50
@10@242:
   ;	
   ;	
   ;		mmrover->attributes &= ~PURGEBITS;
   ;	
	les	bx,dword ptr DGROUP:_mmrover
	and	word ptr es:[bx+4],65532
   ;	
   ;		mmrover->attributes |= purge;
   ;	
	les	bx,dword ptr DGROUP:_mmrover
	mov	ax,word ptr [bp+6]
	or	word ptr es:[bx+4],ax
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_MM_SetPurge	endp
   ;	
   ;	void MM_SetLock (memptr *baseptr, boolean locked)
   ;	
	assume	cs:_TEXT
_MM_SetLock	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;	{
   ;		mmblocktype far *start;
   ;	
   ;		start = mmrover;
   ;	
	mov	ax,word ptr DGROUP:_mmrover+2
	mov	dx,word ptr DGROUP:_mmrover
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
@11@50:
   ;	
   ;	
   ;		do
   ;		{
   ;			if (mmrover->useptr == baseptr)
   ;	
	les	bx,dword ptr DGROUP:_mmrover
	mov	ax,word ptr es:[bx+6]
	cmp	ax,word ptr [bp+4]
	jne	short @11@98
   ;	
   ;				break;
   ;	
	jmp	short @11@242
@11@98:
   ;	
   ;	
   ;			mmrover = mmrover->next;
   ;	
	les	bx,dword ptr DGROUP:_mmrover
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr DGROUP:_mmrover,dx
	mov	word ptr DGROUP:_mmrover+2,ax
   ;	
   ;	
   ;			if (!mmrover)
   ;	
	mov	ax,word ptr DGROUP:_mmrover
	or	ax,word ptr DGROUP:_mmrover+2
	jne	short @11@146
   ;	
   ;				mmrover = mmhead;
   ;	
	mov	ax,word ptr DGROUP:_mmhead+2
	mov	dx,word ptr DGROUP:_mmhead
	mov	word ptr DGROUP:_mmrover,dx
	mov	word ptr DGROUP:_mmrover+2,ax
	jmp	short @11@218
@11@146:
   ;	
   ;			else if (mmrover == start)
   ;	
	mov	ax,word ptr DGROUP:_mmrover+2
	mov	dx,word ptr DGROUP:_mmrover
	cmp	ax,word ptr [bp-2]
	jne	short @11@218
	cmp	dx,word ptr [bp-4]
	jne	short @11@218
   ;	
   ;				Quit ("MM_SetLock: Block not found!");
   ;	
	mov	ax,offset DGROUP:s@+177
	push	ax
	call	near ptr _Quit
	pop	cx
@11@218:
   ;	
   ;	
   ;		} while (1);
   ;	
	jmp	short @11@50
@11@242:
   ;	
   ;	
   ;		mmrover->attributes &= ~LOCKBIT;
   ;	
	les	bx,dword ptr DGROUP:_mmrover
	and	word ptr es:[bx+4],65407
   ;	
   ;		mmrover->attributes |= locked*LOCKBIT;
   ;	
	mov	ax,word ptr [bp+6]
	mov	cl,7
	shl	ax,cl
	les	bx,dword ptr DGROUP:_mmrover
	or	word ptr es:[bx+4],ax
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_MM_SetLock	endp
   ;	
   ;	void MM_SortMem (void)
   ;	
	assume	cs:_TEXT
_MM_SortMem	proc	near
	push	bp
	mov	bp,sp
	sub	sp,18
	push	si
	push	di
   ;	
   ;	{
   ;		mmblocktype far *scan,far *last,far *next;
   ;		unsigned	start,length,source,dest;
   ;		int			playing;
   ;	
   ;		//
   ;		// lock down a currently playing sound
   ;		//
   ;		playing = SD_SoundPlaying ();
   ;	
	call	near ptr _SD_SoundPlaying
	mov	si,ax
   ;	
   ;		if (playing)
   ;	
	or	si,si
	je	short @12@218
   ;	
   ;		{
   ;			switch (SoundMode)
   ;	
	mov	ax,word ptr DGROUP:_SoundMode
	cmp	ax,1
	je	short @12@146
	cmp	ax,2
	je	short @12@170
	jmp	short @12@194
@12@146:
   ;	
   ;			{
   ;			case sdm_PC:
   ;				playing += STARTPCSOUNDS;
   ;	
	add	si,0
   ;	
   ;				break;
   ;	
	jmp	short @12@194
@12@170:
   ;	
   ;			case sdm_AdLib:
   ;				playing += STARTADLIBSOUNDS;
   ;	
	add	si,87
   ;	
   ;				break;
   ;	
	jmp	short @12@194
@12@194:
   ;	
   ;			}
   ;			MM_SetLock(&(memptr)audiosegs[playing],true);
   ;	
	mov	ax,1
	push	ax
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_audiosegs
	push	ax
	call	near ptr _MM_SetLock
	pop	cx
	pop	cx
@12@218:
   ;	
   ;		}
   ;	
   ;	
   ;		SD_StopSound();
   ;	
	call	near ptr _SD_StopSound
   ;	
   ;	
   ;		if (beforesort)
   ;	
	cmp	word ptr DGROUP:_beforesort,0
	je	short @12@266
   ;	
   ;			beforesort();
   ;	
	call	word ptr DGROUP:_beforesort
@12@266:
   ;	
   ;	
   ;		scan = mmhead;
   ;	
	mov	ax,word ptr DGROUP:_mmhead+2
	mov	dx,word ptr DGROUP:_mmhead
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;		last = NULL;		// shut up compiler warning
   ;	
	mov	word ptr [bp-8],0
	mov	word ptr [bp-6],0
	jmp	@12@578
@12@290:
   ;	
   ;	
   ;		while (scan)
   ;		{
   ;			if (scan->attributes & LOCKBIT)
   ;	
	les	bx,dword ptr [bp-4]
	test	word ptr es:[bx+4],128
	je	short @12@338
   ;	
   ;			{
   ;			//
   ;			// block is locked, so try to pile later blocks right after it
   ;			//
   ;				start = scan->start + scan->length;
   ;	
	les	bx,dword ptr [bp-4]
	push	es
	mov	es,word ptr [bp-2]
	push	bx
	mov	bx,word ptr [bp-4]
	mov	ax,word ptr es:[bx]
	pop	bx
	pop	es
	add	ax,word ptr es:[bx+2]
	mov	di,ax
   ;	
   ;			}
   ;	
	jmp	@12@554
@12@338:
   ;	
   ;			else
   ;			{
   ;				if (scan->attributes & PURGEBITS)
   ;	
	les	bx,dword ptr [bp-4]
	test	word ptr es:[bx+4],3
	je	short @12@410
   ;	
   ;				{
   ;				//
   ;				// throw out the purgable block
   ;				//
   ;					next = scan->next;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr [bp-12],dx
	mov	word ptr [bp-10],ax
   ;	
   ;					FREEBLOCK(scan);
   ;	
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx+6]
	mov	word ptr [bx],0
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr DGROUP:_mmfree+2
	mov	dx,word ptr DGROUP:_mmfree
	mov	word ptr es:[bx+8],dx
	mov	word ptr es:[bx+10],ax
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr DGROUP:_mmfree,dx
	mov	word ptr DGROUP:_mmfree+2,ax
   ;	
   ;					last->next = next;
   ;	
	les	bx,dword ptr [bp-8]
	mov	ax,word ptr [bp-10]
	mov	dx,word ptr [bp-12]
	mov	word ptr es:[bx+8],dx
	mov	word ptr es:[bx+10],ax
   ;	
   ;					scan = next;
   ;	
	mov	ax,word ptr [bp-10]
	mov	dx,word ptr [bp-12]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;					continue;
   ;	
	jmp	@12@578
   ;	
   ;				}
   ;	
	jmp	@12@554
@12@410:
   ;	
   ;				else
   ;				{
   ;				//
   ;				// push the non purgable block on top of the last moved block
   ;				//
   ;					if (scan->start != start)
   ;	
	les	bx,dword ptr [bp-4]
	cmp	word ptr es:[bx],di
	je	short @12@530
   ;	
   ;					{
   ;						length = scan->length;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+2]
	mov	word ptr [bp-14],ax
   ;	
   ;						source = scan->start;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-16],ax
   ;	
   ;						dest = start;
   ;	
	mov	word ptr [bp-18],di
	jmp	short @12@482
@12@458:
   ;	
   ;						while (length > 0xf00)
   ;						{
   ;							movedata(source,0,dest,0,0xf00*16);
   ;	
	mov	ax,61440
	push	ax
	xor	ax,ax
	push	ax
	push	word ptr [bp-18]
	xor	ax,ax
	push	ax
	push	word ptr [bp-16]
	call	near ptr _movedata
	add	sp,10
   ;	
   ;							length -= 0xf00;
   ;	
	sub	word ptr [bp-14],3840
   ;	
   ;							source += 0xf00;
   ;	
	add	word ptr [bp-16],3840
   ;	
   ;							dest += 0xf00;
   ;	
	add	word ptr [bp-18],3840
@12@482:
	cmp	word ptr [bp-14],3840
	ja	short @12@458
   ;	
   ;						}
   ;						movedata(source,0,dest,0,length*16);
   ;	
	mov	ax,word ptr [bp-14]
	mov	cl,4
	shl	ax,cl
	push	ax
	xor	ax,ax
	push	ax
	push	word ptr [bp-18]
	xor	ax,ax
	push	ax
	push	word ptr [bp-16]
	call	near ptr _movedata
	add	sp,10
   ;	
   ;	
   ;						scan->start = start;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx],di
   ;	
   ;						*(unsigned *)scan->useptr = start;
   ;	
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx+6]
	mov	word ptr [bx],di
@12@530:
   ;	
   ;					}
   ;					start = scan->start + scan->length;
   ;	
	les	bx,dword ptr [bp-4]
	push	es
	mov	es,word ptr [bp-2]
	push	bx
	mov	bx,word ptr [bp-4]
	mov	ax,word ptr es:[bx]
	pop	bx
	pop	es
	add	ax,word ptr es:[bx+2]
	mov	di,ax
@12@554:
   ;	
   ;				}
   ;			}
   ;	
   ;			last = scan;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;			scan = scan->next;		// go to next block
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
@12@578:
	mov	ax,word ptr [bp-4]
	or	ax,word ptr [bp-2]
	je	@@6
	jmp	@12@290
@@6:
   ;	
   ;		}
   ;	
   ;		mmrover = mmhead;
   ;	
	mov	ax,word ptr DGROUP:_mmhead+2
	mov	dx,word ptr DGROUP:_mmhead
	mov	word ptr DGROUP:_mmrover,dx
	mov	word ptr DGROUP:_mmrover+2,ax
   ;	
   ;	
   ;		if (aftersort)
   ;	
	cmp	word ptr DGROUP:_aftersort,0
	je	short @12@650
   ;	
   ;			aftersort();
   ;	
	call	word ptr DGROUP:_aftersort
@12@650:
   ;	
   ;	
   ;		if (playing)
   ;	
	or	si,si
	je	short @12@698
   ;	
   ;			MM_SetLock(&(memptr)audiosegs[playing],false);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_audiosegs
	push	ax
	call	near ptr _MM_SetLock
	pop	cx
	pop	cx
@12@698:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_MM_SortMem	endp
   ;	
   ;	void MM_ShowMemory (void)
   ;	
	assume	cs:_TEXT
_MM_ShowMemory	proc	near
	push	bp
	mov	bp,sp
	sub	sp,12
	push	si
	push	di
   ;	
   ;	{
   ;		mmblocktype far *scan;
   ;		unsigned color,temp,x,y;
   ;		long	end,owner;
   ;		char    scratch[80],str[10];
   ;	
   ;		temp = bufferofs;
   ;	
	mov	ax,word ptr DGROUP:_bufferofs
	mov	word ptr [bp-8],ax
   ;	
   ;		bufferofs = displayofs;
   ;	
	mov	ax,word ptr DGROUP:_displayofs
	mov	word ptr DGROUP:_bufferofs,ax
   ;	
   ;		scan = mmhead;
   ;	
	mov	ax,word ptr DGROUP:_mmhead+2
	mov	dx,word ptr DGROUP:_mmhead
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;		end = -1;
   ;	
	mov	word ptr [bp-12],65535
	mov	word ptr [bp-10],65535
	jmp	@13@410
@13@50:
   ;	
   ;	
   ;		while (scan)
   ;		{
   ;			if (scan->attributes & PURGEBITS)
   ;	
	les	bx,dword ptr [bp-4]
	test	word ptr es:[bx+4],3
	je	short @13@98
   ;	
   ;				color = 5;		// dark purple = purgable
   ;	
	mov	word ptr [bp-6],5
	jmp	short @13@122
@13@98:
   ;	
   ;			else
   ;				color = 9;		// medium blue = non purgable
   ;	
	mov	word ptr [bp-6],9
@13@122:
   ;	
   ;			if (scan->attributes & LOCKBIT)
   ;	
	les	bx,dword ptr [bp-4]
	test	word ptr es:[bx+4],128
	je	short @13@170
   ;	
   ;				color = 12;		// red = locked
   ;	
	mov	word ptr [bp-6],12
@13@170:
   ;	
   ;			if (scan->start<=end)
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx]
	xor	dx,dx
	cmp	dx,word ptr [bp-10]
	jg	short @13@266
	jne	short @13@242
	cmp	ax,word ptr [bp-12]
	ja	short @13@266
@13@242:
   ;	
   ;				Quit ("MM_ShowMemory: Memory block order currupted!");
   ;	
	mov	ax,offset DGROUP:s@+206
	push	ax
	call	near ptr _Quit
	pop	cx
@13@266:
   ;	
   ;			end = scan->length-1;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+2]
	dec	ax
	mov	word ptr [bp-12],ax
	mov	word ptr [bp-10],0
   ;	
   ;			y = scan->start/320;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx]
	mov	bx,320
	xor	dx,dx
	div	bx
	mov	di,ax
   ;	
   ;			x = scan->start%320;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx]
	mov	bx,320
	xor	dx,dx
	div	bx
	mov	si,dx
   ;	
   ;			VW_Hlin(x,x+end,y,color);
   ;	
	push	word ptr [bp-6]
	mov	ax,si
	add	ax,word ptr [bp-12]
	sub	ax,si
	inc	ax
	push	ax
	push	di
	push	si
	call	near ptr _VL_Hlin
	add	sp,8
   ;	
   ;			VW_Plot(x,y,15);
   ;	
	mov	ax,15
	push	ax
	push	di
	push	si
	call	near ptr _VL_Plot
	add	sp,6
   ;	
   ;			if (scan->next && scan->next->start > end+1)
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+8]
	or	ax,word ptr es:[bx+10]
	je	short @13@386
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+8]
	xor	ax,ax
	mov	dx,word ptr [bp-10]
	mov	cx,word ptr [bp-12]
	add	cx,1
	adc	dx,0
	cmp	ax,dx
	jl	short @13@386
	jg	short @13@362
	cmp	word ptr es:[bx],cx
	jbe	short @13@386
@13@362:
   ;	
   ;				VW_Hlin(x+end+1,x+(scan->next->start-scan->start),y,0);	// black = free
   ;	
	xor	ax,ax
	push	ax
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+8]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp-4]
	sub	ax,word ptr es:[bx]
	mov	dx,si
	add	dx,ax
	mov	ax,si
	add	ax,word ptr [bp-12]
	inc	ax
	sub	dx,ax
	inc	dx
	push	dx
	push	di
	mov	ax,si
	add	ax,word ptr [bp-12]
	inc	ax
	push	ax
	call	near ptr _VL_Hlin
	add	sp,8
@13@386:
   ;	
   ;	
   ;			scan = scan->next;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
@13@410:
	mov	ax,word ptr [bp-4]
	or	ax,word ptr [bp-2]
	je	@@7
	jmp	@13@50
@@7:
   ;	
   ;		}
   ;	
   ;		VW_FadeIn ();
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
   ;		IN_Ack();
   ;	
	call	near ptr _IN_Ack
   ;	
   ;	
   ;		bufferofs = temp;
   ;	
	mov	ax,word ptr [bp-8]
	mov	word ptr DGROUP:_bufferofs,ax
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_MM_ShowMemory	endp
   ;	
   ;	void MM_DumpData (void)
   ;	
	assume	cs:_TEXT
_MM_DumpData	proc	near
	push	bp
	mov	bp,sp
	sub	sp,18
	push	si
	push	di
   ;	
   ;	{
   ;		mmblocktype far *scan,far *best;
   ;		long	lowest,oldlowest;
   ;		unsigned	owner;
   ;		char	lock,purge;
   ;		FILE	*dumpfile;
   ;	
   ;	
   ;		free (nearheap);
   ;	
	push	word ptr DGROUP:_nearheap
	call	near ptr _free
	pop	cx
   ;	
   ;		dumpfile = fopen ("MMDUMP.TXT","w");
   ;	
	mov	ax,offset DGROUP:s@+262
	push	ax
	mov	ax,offset DGROUP:s@+251
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	di,ax
   ;	
   ;		if (!dumpfile)
   ;	
	or	di,di
	jne	short @14@74
   ;	
   ;			Quit ("MM_DumpData: Couldn't open MMDUMP.TXT!");
   ;	
	mov	ax,offset DGROUP:s@+264
	push	ax
	call	near ptr _Quit
	pop	cx
@14@74:
   ;	
   ;	
   ;		lowest = -1;
   ;	
	mov	word ptr [bp-12],65535
	mov	word ptr [bp-10],65535
@14@98:
   ;	
   ;		do
   ;		{
   ;			oldlowest = lowest;
   ;	
	mov	ax,word ptr [bp-10]
	mov	dx,word ptr [bp-12]
	mov	word ptr [bp-16],dx
	mov	word ptr [bp-14],ax
   ;	
   ;			lowest = 0xffff;
   ;	
	mov	word ptr [bp-12],65535
	mov	word ptr [bp-10],0
   ;	
   ;	
   ;			scan = mmhead;
   ;	
	mov	ax,word ptr DGROUP:_mmhead+2
	mov	dx,word ptr DGROUP:_mmhead
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
	jmp	short @14@338
@14@122:
   ;	
   ;			while (scan)
   ;			{
   ;				owner = (unsigned)scan->useptr;
   ;	
	les	bx,dword ptr [bp-4]
	mov	si,word ptr es:[bx+6]
   ;	
   ;	
   ;				if (owner && owner<lowest && owner > oldlowest)
   ;	
	or	si,si
	je	short @14@314
	xor	ax,ax
	cmp	ax,word ptr [bp-10]
	jg	short @14@314
	jl	short @14@218
	cmp	si,word ptr [bp-12]
	jae	short @14@314
@14@218:
	xor	ax,ax
	cmp	ax,word ptr [bp-14]
	jl	short @14@314
	jg	short @14@290
	cmp	si,word ptr [bp-16]
	jbe	short @14@314
@14@290:
   ;	
   ;				{
   ;					best = scan;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;					lowest = owner;
   ;	
	mov	word ptr [bp-12],si
	mov	word ptr [bp-10],0
@14@314:
   ;	
   ;				}
   ;	
   ;				scan = scan->next;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
@14@338:
	mov	ax,word ptr [bp-4]
	or	ax,word ptr [bp-2]
	jne	short @14@122
   ;	
   ;			}
   ;	
   ;			if (lowest != 0xffff)
   ;	
	cmp	word ptr [bp-10],0
	jne	short @14@410
	cmp	word ptr [bp-12],65535
	je	short @14@578
@14@410:
   ;	
   ;			{
   ;				if (best->attributes & PURGEBITS)
   ;	
	les	bx,dword ptr [bp-8]
	test	word ptr es:[bx+4],3
	je	short @14@458
   ;	
   ;					purge = 'P';
   ;	
	mov	byte ptr [bp-18],80
	jmp	short @14@482
@14@458:
   ;	
   ;				else
   ;					purge = '-';
   ;	
	mov	byte ptr [bp-18],45
@14@482:
   ;	
   ;				if (best->attributes & LOCKBIT)
   ;	
	les	bx,dword ptr [bp-8]
	test	word ptr es:[bx+4],128
	je	short @14@530
   ;	
   ;					lock = 'L';
   ;	
	mov	byte ptr [bp-17],76
	jmp	short @14@554
@14@530:
   ;	
   ;				else
   ;					lock = '-';
   ;	
	mov	byte ptr [bp-17],45
@14@554:
   ;	
   ;				fprintf (dumpfile,"0x%p (%c%c) = %u\n"
   ;	
   ;	
   ;				,(unsigned)lowest,lock,purge,best->length);
   ;	
	les	bx,dword ptr [bp-8]
	push	word ptr es:[bx+2]
	mov	al,byte ptr [bp-18]
	cbw	
	push	ax
	mov	al,byte ptr [bp-17]
	cbw	
	push	ax
	push	word ptr [bp-12]
	mov	ax,offset DGROUP:s@+303
	push	ax
	push	di
	call	near ptr _fprintf
	add	sp,12
@14@578:
   ;	
   ;			}
   ;	
   ;		} while (lowest != 0xffff);
   ;	
	cmp	word ptr [bp-10],0
	je	@@8
	jmp	@14@98
@@8:
	cmp	word ptr [bp-12],65535
	je	@@9
	jmp	@14@98
@@9:
   ;	
   ;	
   ;		fclose (dumpfile);
   ;	
	push	di
	call	near ptr _fclose
	pop	cx
   ;	
   ;		Quit ("MMDUMP.TXT created.");
   ;	
	mov	ax,offset DGROUP:s@+321
	push	ax
	call	near ptr _Quit
	pop	cx
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_MM_DumpData	endp
   ;	
   ;	long MM_UnusedMemory (void)
   ;	
	assume	cs:_TEXT
_MM_UnusedMemory	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
   ;	
   ;	{
   ;		unsigned free;
   ;		mmblocktype far *scan;
   ;	
   ;		free = 0;
   ;	
	xor	si,si
   ;	
   ;		scan = mmhead;
   ;	
	mov	ax,word ptr DGROUP:_mmhead+2
	mov	dx,word ptr DGROUP:_mmhead
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
	jmp	short @15@74
@15@50:
   ;	
   ;	
   ;		while (scan->next)
   ;		{
   ;			free += scan->next->start - (scan->start + scan->length);
   ;	
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+8]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp-4]
	push	ax
	push	es
	les	di,dword ptr [bp-4]
	mov	ax,word ptr es:[di]
	pop	es
	add	ax,word ptr es:[bx+2]
	pop	dx
	sub	dx,ax
	add	si,dx
   ;	
   ;			scan = scan->next;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
@15@74:
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+8]
	or	ax,word ptr es:[bx+10]
	jne	short @15@50
   ;	
   ;		}
   ;	
   ;		return free*16l;
   ;	
	mov	ax,si
	xor	dx,dx
	mov	cl,4
	call	near ptr N_LXLSH@
	jmp	short @15@122
@15@122:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_MM_UnusedMemory	endp
   ;	
   ;	long MM_TotalFree (void)
   ;	
	assume	cs:_TEXT
_MM_TotalFree	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
   ;	
   ;	{
   ;		unsigned free;
   ;		mmblocktype far *scan;
   ;	
   ;		free = 0;
   ;	
	xor	si,si
   ;	
   ;		scan = mmhead;
   ;	
	mov	ax,word ptr DGROUP:_mmhead+2
	mov	dx,word ptr DGROUP:_mmhead
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
	jmp	short @16@146
@16@50:
   ;	
   ;	
   ;		while (scan->next)
   ;		{
   ;			if ((scan->attributes&PURGEBITS) && !(scan->attributes&LOCKBIT))
   ;	
	les	bx,dword ptr [bp-4]
	test	word ptr es:[bx+4],3
	je	short @16@122
	les	bx,dword ptr [bp-4]
	test	word ptr es:[bx+4],128
	jne	short @16@122
   ;	
   ;				free += scan->length;
   ;	
	les	bx,dword ptr [bp-4]
	add	si,word ptr es:[bx+2]
@16@122:
   ;	
   ;			free += scan->next->start - (scan->start + scan->length);
   ;	
	les	bx,dword ptr [bp-4]
	les	bx,dword ptr es:[bx+8]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp-4]
	push	ax
	push	es
	les	di,dword ptr [bp-4]
	mov	ax,word ptr es:[di]
	pop	es
	add	ax,word ptr es:[bx+2]
	pop	dx
	sub	dx,ax
	add	si,dx
   ;	
   ;			scan = scan->next;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+10]
	mov	dx,word ptr es:[bx+8]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
@16@146:
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+8]
	or	ax,word ptr es:[bx+10]
	jne	short @16@50
   ;	
   ;		}
   ;	
   ;		return free*16l;
   ;	
	mov	ax,si
	xor	dx,dx
	mov	cl,4
	call	near ptr N_LXLSH@
	jmp	short @16@194
@16@194:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_MM_TotalFree	endp
   ;	
   ;	void MM_BombOnError (boolean bomb)
   ;	
	assume	cs:_TEXT
_MM_BombOnError	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		bombonerror = bomb;
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:_bombonerror,ax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_MM_BombOnError	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_aftersort	label	word
	db	2 dup (?)
_numUMBs	label	word
	db	2 dup (?)
_bombonerror	label	word
	db	2 dup (?)
_mmnew	label	dword
	db	4 dup (?)
_mmhead	label	dword
	db	4 dup (?)
_mmfree	label	dword
	db	4 dup (?)
_mminfo	label	word
	db	20 dup (?)
_farheap	label	dword
	db	4 dup (?)
_XMSaddr	label	word
	db	2 dup (?)
_mmrover	label	dword
	db	4 dup (?)
_nearheap	label	word
	db	2 dup (?)
_mmerror	label	word
	db	2 dup (?)
_UMBbase	label	word
	db	20 dup (?)
_BSS	ends
ID_MM5_FAR	segment para public 'FAR_DATA'
_mmblocks	label	word
	db	8400 dup (?)
ID_MM5_FAR	ends
_BSS	segment word public 'BSS'
_bufferseg	label	word
	db	2 dup (?)
_mmstarted	label	word
	db	2 dup (?)
_beforesort	label	word
	db	2 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'MML_UseSpace: Segment spans two blocks!'
	db	0
	db	'MM_ClearBlock: No purgable blocks!'
	db	0
	db	'noems'
	db	0
	db	'noxms'
	db	0
	db	0
	db	0
	db	0
	db	0
	db	'?MM_GetPtr: Out of memory!'
	db	0
	db	'MM_FreePtr: Block not found!'
	db	0
	db	'MM_SetPurge: Block not found!'
	db	0
	db	'MM_SetLock: Block not found!'
	db	0
	db	'MM_ShowMemory: Memory block order currupted!'
	db	0
	db	'MMDUMP.TXT'
	db	0
	db	'w'
	db	0
	db	'MM_DumpData: Couldn'
	db	39
	db	't open MMDUMP.TXT!'
	db	0
	db	'0x%p (%c%c) = %u'
	db	10
	db	0
	db	'MMDUMP.TXT created.'
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	public	_MML_ClearBlock
	extrn	_SetViewSize:near
	extrn	_fopen:near
	public	_MM_Shutdown
	public	_MM_DumpData
	extrn	_SD_SoundPlaying:near
	public	_MML_ShutdownXMS
	public	_MML_CheckForXMS
	public	_MM_TotalFree
	public	_MM_Startup
	public	_beforesort
	public	_MM_FreePtr
	public	_MML_UseSpace
	extrn	_farcoreleft:near
_ParmStrings	equ	ParmStrings
	extrn	_viewsize:word
	public	_MM_SetPurge
	public	_MM_GetPtr
	extrn	_farmalloc:near
	extrn	_displayofs:word
	public	_MM_SortMem
	public	_MM_SetLock
	extrn	_IN_Ack:near
	extrn	_audiosegs:word
	public	_mmstarted
	extrn	_bufferofs:word
	public	_bufferseg
	public	_mmblocks
	extrn	_SD_StopSound:near
	public	_MML_SetupXMS
	public	_UMBbase
	public	_mmerror
	extrn	_free:near
	public	_nearheap
	extrn	_malloc:near
	public	_mmrover
	extrn	_farfree:near
	public	_XMSaddr
	extrn	_gamepal:byte
	public	_farheap
	public	_mminfo
	public	_mmfree
	public	_mmhead
	public	_mmnew
	extrn	_fprintf:near
	public	_bombonerror
	extrn	_Quit:near
	extrn	_VL_Plot:near
	extrn	_VL_Hlin:near
	extrn	_insetupscaling:word
	public	_numUMBs
	extrn	_movedata:near
	extrn	_VL_FadeIn:near
	extrn	N_LXURSH@:far
	extrn	_SoundMode:word
	public	_MM_UnusedMemory
	extrn	_coreleft:near
	extrn	N_LXLSH@:far
	extrn	_fclose:near
	extrn	N_FTOL@:far
	public	_MM_BombOnError
	public	_aftersort
	public	_MM_ShowMemory
	end
