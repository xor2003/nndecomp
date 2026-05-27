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
	?debug	S "c:\id_pm.c"
	?debug	C E9E551FE7C0A633A5C69645F706D2E63
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
_XMSProtectPage	label	word
	db	255
	db	255
_PageFileName	label	byte
	db	86
	db	83
	db	87
	db	65
	db	80
	db	46
	db	7 dup (0)
_PageFile	label	word
	db	255
	db	255
ParmStrings	label	word
	dw	DGROUP:s@
	dw	DGROUP:s@+7
	dw	DGROUP:s@+13
	db	0
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PML_MapEMS	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	PML_MapEMS(word logical,word physical)
   ;	{
   ;	
	mov	al,byte ptr [bp+6]
   ;	
   ;		_AL = physical;
   ;	
	mov	bx,word ptr [bp+4]
   ;	
   ;		_BX = logical;
   ;	
	mov	dx,word ptr DGROUP:_EMSHandle
   ;	
   ;		_DX = EMSHandle;
   ;	
	mov	ah,68
   ;	
   ;		_AH = EMS_MAPPAGE;
   ;	
		int		067H
   ;	
   ;	asm	int	EMS_INT
   ;	
   ;	
	or	ah,ah
	je	short @1@122
   ;	
   ;		if (_AH)
   ;	
	mov	ax,offset DGROUP:s@+19
	push	ax
	call	near ptr _Quit
	pop	cx
@1@122:
   ;	
   ;			Quit("PML_MapEMS: Page mapping failed");
   ;	
	pop	bp
	ret	
_PML_MapEMS	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_EMMDriverName	label	byte
	db	69
	db	77
	db	77
	db	88
	db	88
	db	88
	db	88
	db	48
	db	1 dup (0)
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	boolean
   ;	
	assume	cs:_TEXT
_PML_StartupEMS	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
   ;	
   ;	PML_StartupEMS(void)
   ;	{
   ;		int		i;
   ;		long	size;
   ;	
   ;	
	mov	word ptr DGROUP:_EMSPresent,0
   ;	
   ;		EMSPresent = false;			// Assume that we'll fail
   ;	
	mov	word ptr DGROUP:_EMSAvail,0
   ;	
   ;		EMSAvail = 0;
   ;	
   ;	
	mov	dx,offset DGROUP:_EMMDriverName
   ;	
   ;		_DX = (word)EMMDriverName;
   ;	
	mov	ax,15616
   ;	
   ;		_AX = 0x3d00;
   ;	
	int	33
   ;	
   ;		geninterrupt(0x21);			// try to open EMMXXXX0 device
   ;	
	jnc	short @2@74
   ;	
   ;	asm	jnc	gothandle
   ;	
	jmp	@2@794
@2@74:
   ;	
   ;		goto error;
   ;	
   ;	gothandle:
   ;	
	mov	bx,ax
   ;	
   ;		_BX = _AX;
   ;	
	mov	ax,17408
   ;	
   ;		_AX = 0x4400;
   ;	
	int	33
   ;	
   ;		geninterrupt(0x21);			// get device info
   ;	
	jnc	short @2@122
   ;	
   ;	asm	jnc	gotinfo;
   ;	
	jmp	@2@794
@2@122:
   ;	
   ;		goto error;
   ;	
   ;	gotinfo:
   ;	
		and		dx,080H
   ;	
   ;	asm	and	dx,0x80
   ;	
	or	dx,dx
	jne	short @2@194
   ;	
   ;		if (!_DX)
   ;	
	jmp	@2@794
@2@194:
   ;	
   ;			goto error;
   ;	
   ;	
	mov	ax,17415
   ;	
   ;		_AX = 0x4407;
   ;	
	int	33
   ;	
   ;		geninterrupt(0x21);			// get status
   ;	
	jc	short @2@794
   ;	
   ;	asm	jc	error
   ;	
	mov	ah,0
	or	ax,ax
	jne	short @2@266
   ;	
   ;		if (!_AL)
   ;	
	jmp	@2@794
@2@266:
   ;	
   ;			goto error;
   ;	
   ;	
	mov	ah,62
   ;	
   ;		_AH = 0x3e;
   ;	
	int	33
   ;	
   ;		geninterrupt(0x21);			// close handle
   ;	
   ;	
	mov	ah,64
   ;	
   ;		_AH = EMS_STATUS;
   ;	
	int	103
   ;	
   ;		geninterrupt(EMS_INT);
   ;	
	or	ah,ah
	je	short @2@314
   ;	
   ;		if (_AH)
   ;	
	jmp	@2@794
@2@314:
   ;	
   ;			goto error;				// make sure EMS hardware is present
   ;	
   ;	
	mov	ah,70
   ;	
   ;		_AH = EMS_VERSION;
   ;	
	int	103
   ;	
   ;		geninterrupt(EMS_INT);
   ;	
	or	ah,ah
	jne	short @2@362
	cmp	al,50
	jae	short @2@386
@2@362:
   ;	
   ;		if (_AH || (_AL < 0x32))	// only work on EMS 3.2 or greater (silly, but...)
   ;	
	jmp	@2@794
@2@386:
   ;	
   ;			goto error;
   ;	
   ;	
	mov	ah,65
   ;	
   ;		_AH = EMS_GETFRAME;
   ;	
	int	103
   ;	
   ;		geninterrupt(EMS_INT);
   ;	
	or	ah,ah
	je	short @2@434
   ;	
   ;		if (_AH)
   ;	
	jmp	@2@794
@2@434:
   ;	
   ;			goto error;				// find the page frame address
   ;	
	mov	word ptr DGROUP:_EMSPageFrame,bx
   ;	
   ;		EMSPageFrame = _BX;
   ;	
   ;	
	mov	ah,66
   ;	
   ;		_AH = EMS_GETPAGES;
   ;	
	int	103
   ;	
   ;		geninterrupt(EMS_INT);
   ;	
	or	ah,ah
	je	short @2@482
   ;	
   ;		if (_AH)
   ;	
	jmp	@2@794
@2@482:
   ;	
   ;			goto error;
   ;	
	cmp	bx,2
	jae	short @2@530
   ;	
   ;		if (_BX < 2)
   ;	
	jmp	@2@794
@2@530:
   ;	
   ;			goto error;         	// Require at least 2 pages (32k)
   ;	
	mov	word ptr DGROUP:_EMSAvail,bx
   ;	
   ;		EMSAvail = _BX;
   ;	
   ;		// Don't hog all available EMS
   ;	
	mov	ax,word ptr DGROUP:_EMSAvail
	xor	dx,dx
	mov	cl,14
	call	near ptr N_LXLSH@
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;		size = EMSAvail * (long)EMSPageSize;
   ;	
	mov	ax,word ptr DGROUP:_ChunksInFile
	xor	dx,dx
	mov	cl,12
	call	near ptr N_LXLSH@
	mov	bx,word ptr [bp-2]
	mov	cx,word ptr [bp-4]
	add	cx,32768
	adc	bx,0
	cmp	dx,bx
	jg	short @2@626
	jl	short @2@602
	cmp	ax,cx
	jae	short @2@626
@2@602:
   ;	
   ;		if (size - (EMSPageSize * 2) > (ChunksInFile * (long)PMPageSize))
   ;		{
   ;	
	mov	ax,word ptr DGROUP:_ChunksInFile
	xor	dx,dx
	mov	cl,12
	call	near ptr N_LXLSH@
	add	ax,16384
	adc	dx,0
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;			size = (ChunksInFile * (long)PMPageSize) + EMSPageSize;
   ;	
	xor	ax,ax
	mov	dx,16384
	push	ax
	push	dx
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr N_LDIV@
	mov	word ptr DGROUP:_EMSAvail,ax
@2@626:
   ;	
   ;			EMSAvail = size / EMSPageSize;
   ;		}
   ;	
   ;	
	mov	ah,67
   ;	
   ;		_AH = EMS_ALLOCPAGES;
   ;	
	mov	bx,word ptr DGROUP:_EMSAvail
   ;	
   ;		_BX = EMSAvail;
   ;	
	int	103
   ;	
   ;		geninterrupt(EMS_INT);
   ;	
	or	ah,ah
	je	short @2@674
   ;	
   ;		if (_AH)
   ;	
	jmp	short @2@794
@2@674:
   ;	
   ;			goto error;
   ;	
	mov	word ptr DGROUP:_EMSHandle,dx
   ;	
   ;		EMSHandle = _DX;
   ;	
   ;	
	mov	ax,word ptr DGROUP:_EMSAvail
	xor	dx,dx
	mov	cl,14
	call	near ptr N_LXLSH@
	add	word ptr DGROUP:_mminfo+8,ax
	adc	word ptr DGROUP:_mminfo+10,dx
   ;	
   ;		mminfo.EMSmem += EMSAvail * (long)EMSPageSize;
   ;	
   ;		// Initialize EMS mapping cache
   ;	
	xor	si,si
	jmp	short @2@746
@2@698:
   ;	
   ;		for (i = 0;i < EMSFrameCount;i++)
   ;	
	mov	ax,si
	mov	dx,6
	imul	dx
	mov	bx,ax
	mov	word ptr DGROUP:_EMSList[bx],65535
	inc	si
@2@746:
	cmp	si,4
	jl	short @2@698
   ;	
   ;			EMSList[i].baseEMSPage = -1;
   ;	
   ;	
	mov	word ptr DGROUP:_EMSPresent,1
@2@794:
   ;	
   ;		EMSPresent = true;			// We have EMS
   ;	
   ;	error:
   ;	
	mov	ax,word ptr DGROUP:_EMSPresent
	jmp	short @2@818
@2@818:
   ;	
   ;		return(EMSPresent);
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PML_StartupEMS	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PML_ShutdownEMS	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	PML_ShutdownEMS(void)
   ;	{
   ;	
	cmp	word ptr DGROUP:_EMSPresent,0
	je	short @3@170
   ;	
   ;		if (EMSPresent)
   ;		{
   ;	
		mov		ah,045H
   ;	
   ;		asm	mov	ah,EMS_FREEPAGES
   ;	
		mov		dx,[DGROUP:_EMSHandle]
   ;	
   ;		asm	mov	dx,[EMSHandle]
   ;	
		int		067H
   ;	
   ;		asm	int	EMS_INT
   ;	
	or	ah,ah
	je	short @3@170
   ;	
   ;			if (_AH)
   ;	
	mov	ax,offset DGROUP:s@+51
	push	ax
	call	near ptr _Quit
	pop	cx
@3@170:
   ;	
   ;				Quit ("PML_ShutdownEMS: Error freeing EMS");
   ;		}
   ;	
	pop	bp
	ret	
_PML_ShutdownEMS	endp
   ;	
   ;	boolean
   ;	
	assume	cs:_TEXT
_PML_StartupXMS	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	PML_StartupXMS(void)
   ;	{
   ;	
	mov	word ptr DGROUP:_XMSPresent,0
   ;	
   ;		XMSPresent = false;					// Assume failure
   ;	
	mov	word ptr DGROUP:_XMSAvail,0
   ;	
   ;		XMSAvail = 0;
   ;	
   ;	
		mov		ax,04300H
   ;	
   ;	asm	mov	ax,0x4300
   ;	
		int		02fH         				
   ;	
   ;	asm	int	XMS_INT         				// Check for presence of XMS driver
   ;	
	cmp	al,128
	je	short @4@146
   ;	
   ;		if (_AL != 0x80)
   ;	
	jmp	short @4@506
@4@146:
   ;	
   ;			goto error;
   ;	
   ;	
   ;	
		mov		ax,04310H
   ;	
   ;	asm	mov	ax,0x4310
   ;	
		int		02fH							
   ;	
   ;	asm	int	XMS_INT							// Get address of XMS driver
   ;	
		mov		[WORD PTR DGROUP:_XMSDriver],bx
   ;	
   ;	asm	mov	[WORD PTR XMSDriver],bx
   ;	
		mov		[WORD PTR DGROUP:_XMSDriver+2],es		
   ;	
   ;	asm	mov	[WORD PTR XMSDriver+2],es		// function pointer to XMS driver
   ;	
   ;	
	mov	ah,8
 	call	 [DWORD PTR DGROUP:_XMSDriver]
   ;	
   ;		XMS_CALL(XMS_QUERYFREE);			// Find out how much XMS is available
   ;	
	mov	word ptr DGROUP:_XMSAvail,ax
   ;	
   ;		XMSAvail = _AX;
   ;	
	or	ax,ax
	jne	short @4@338
   ;	
   ;		if (!_AX)				// AJR: bugfix 10/8/92
   ;	
	jmp	short @4@506
@4@338:
   ;	
   ;			goto error;
   ;	
   ;	
	and	word ptr DGROUP:_XMSAvail,65532
   ;	
   ;		XMSAvail &= ~(PMPageSizeKB - 1);	// Round off to nearest page size
   ;	
	cmp	word ptr DGROUP:_XMSAvail,8
	jae	short @4@386
   ;	
   ;		if (XMSAvail < (PMPageSizeKB * 2))	// Need at least 2 pages
   ;	
	jmp	short @4@506
@4@386:
   ;	
   ;			goto error;
   ;	
   ;	
	mov	dx,word ptr DGROUP:_XMSAvail
   ;	
   ;		_DX = XMSAvail;
   ;	
	mov	ah,9
 	call	 [DWORD PTR DGROUP:_XMSDriver]
   ;	
   ;		XMS_CALL(XMS_ALLOC);				// And do the allocation
   ;	
	mov	word ptr DGROUP:_XMSHandle,dx
   ;	
   ;		XMSHandle = _DX;
   ;	
   ;	
	or	ax,ax
	jne	short @4@482
   ;	
   ;		if (!_AX)				// AJR: bugfix 10/8/92
   ;		{
   ;	
	mov	word ptr DGROUP:_XMSAvail,0
   ;	
   ;			XMSAvail = 0;
   ;	
	jmp	short @4@506
@4@482:
   ;	
   ;			goto error;
   ;		}
   ;	
   ;	
	mov	ax,word ptr DGROUP:_XMSAvail
	mov	cl,10
	shl	ax,cl
	add	word ptr DGROUP:_mminfo+12,ax
	adc	word ptr DGROUP:_mminfo+14,0
   ;	
   ;		mminfo.XMSmem += XMSAvail * 1024;
   ;	
   ;	
	mov	word ptr DGROUP:_XMSPresent,1
@4@506:
   ;	
   ;		XMSPresent = true;
   ;	error:
   ;	
	mov	ax,word ptr DGROUP:_XMSPresent
	jmp	short @4@530
@4@530:
   ;	
   ;		return(XMSPresent);
   ;	
	pop	bp
	ret	
_PML_StartupXMS	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PML_XMSCopy	proc	near
	push	bp
	mov	bp,sp
	sub	sp,20
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	PML_XMSCopy(boolean toxms,byte far *addr,word xmspage,word length)
   ;	{
   ;		longword	xoffset;
   ;		struct
   ;		{
   ;			longword	length;
   ;			word		source_handle;
   ;			longword	source_offset;
   ;			word		target_handle;
   ;			longword	target_offset;
   ;		} copy;
   ;	
   ;	
	mov	ax,word ptr [bp+6]
	or	ax,word ptr [bp+8]
	jne	short @5@74
   ;	
   ;		if (!addr)
   ;	
	mov	ax,offset DGROUP:s@+86
	push	ax
	call	near ptr _Quit
	pop	cx
@5@74:
   ;	
   ;			Quit("PML_XMSCopy: zero address");
   ;	
   ;	
	mov	ax,word ptr [bp+10]
	xor	dx,dx
	mov	cl,12
	call	near ptr N_LXLSH@
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;		xoffset = (longword)xmspage * PMPageSize;
   ;	
   ;	
	mov	ax,word ptr [bp+12]
	inc	ax
	and	ax,65534
	mov	word ptr [bp-20],ax
	mov	word ptr [bp-18],0
   ;	
   ;		copy.length = (length + 1) & ~1;
   ;	
	or	di,di
	je	short @5@122
	xor	ax,ax
	jmp	short @5@146
@5@122:
	mov	ax,word ptr DGROUP:_XMSHandle
@5@146:
	mov	word ptr [bp-16],ax
   ;	
   ;		copy.source_handle = toxms? 0 : XMSHandle;
   ;	
	or	di,di
	je	short @5@194
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
	jmp	short @5@218
@5@194:
	mov	dx,word ptr [bp-2]
	mov	ax,word ptr [bp-4]
@5@218:
	mov	word ptr [bp-14],ax
	mov	word ptr [bp-12],dx
   ;	
   ;		copy.source_offset = toxms? (long)addr : xoffset;
   ;	
	or	di,di
	je	short @5@266
	mov	ax,word ptr DGROUP:_XMSHandle
	jmp	short @5@290
@5@266:
	xor	ax,ax
@5@290:
	mov	word ptr [bp-10],ax
   ;	
   ;		copy.target_handle = toxms? XMSHandle : 0;
   ;	
	or	di,di
	je	short @5@338
	mov	dx,word ptr [bp-2]
	mov	ax,word ptr [bp-4]
	jmp	short @5@362
@5@338:
	mov	dx,word ptr [bp+8]
	mov	ax,word ptr [bp+6]
@5@362:
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],dx
   ;	
   ;		copy.target_offset = toxms? xoffset : (long)addr;
   ;	
   ;	
		push	 si
   ;	
   ;	asm	push si
   ;	
	lea	ax,word ptr [bp-20]
	mov	si,ax
   ;	
   ;		_SI = (word)&copy;
   ;	
	mov	ah,11
 	call	 [DWORD PTR DGROUP:_XMSDriver]
   ;	
   ;		XMS_CALL(XMS_MOVE);
   ;	
		pop		si
   ;	
   ;	asm	pop	si
   ;	
	or	ax,ax
	jne	short @5@530
   ;	
   ;		if (!_AX)
   ;	
	mov	ax,offset DGROUP:s@+112
	push	ax
	call	near ptr _Quit
	pop	cx
@5@530:
   ;	
   ;			Quit("PML_XMSCopy: Error on copy");
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PML_XMSCopy	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PML_ShutdownXMS	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	PML_ShutdownXMS(void)
   ;	{
   ;	
	cmp	word ptr DGROUP:_XMSPresent,0
	je	short @6@146
   ;	
   ;		if (XMSPresent)
   ;		{
   ;	
	mov	dx,word ptr DGROUP:_XMSHandle
   ;	
   ;			_DX = XMSHandle;
   ;	
	mov	ah,10
 	call	 [DWORD PTR DGROUP:_XMSDriver]
   ;	
   ;			XMS_CALL(XMS_FREE);
   ;	
	or	bl,bl
	je	short @6@146
   ;	
   ;			if (_BL)
   ;	
	mov	ax,offset DGROUP:s@+139
	push	ax
	call	near ptr _Quit
	pop	cx
@6@146:
   ;	
   ;				Quit("PML_ShutdownXMS: Error freeing XMS");
   ;		}
   ;	
	pop	bp
	ret	
_PML_ShutdownXMS	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PM_SetMainMemPurge	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	PM_SetMainMemPurge(int level)
   ;	{
   ;		int	i;
   ;	
   ;	
	xor	si,si
	jmp	short @7@122
@7@50:
   ;	
   ;		for (i = 0;i < PMMaxMainMem;i++)
   ;	
	mov	bx,si
	shl	bx,1
	cmp	word ptr DGROUP:_MainMemPages[bx],0
	je	short @7@98
   ;	
   ;			if (MainMemPages[i])
   ;	
	push	word ptr [bp+4]
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_MainMemPages
	push	ax
	call	near ptr _MM_SetPurge
	pop	cx
	pop	cx
@7@98:
	inc	si
@7@122:
	cmp	si,100
	jl	short @7@50
   ;	
   ;				MM_SetPurge(&MainMemPages[i],level);
   ;	
	pop	si
	pop	bp
	ret	
_PM_SetMainMemPurge	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PM_CheckMainMem	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	push	si
	push	di
   ;	
   ;	PM_CheckMainMem(void)
   ;	{
   ;		boolean			allocfailed;
   ;		int				i,n;
   ;		memptr			*p;
   ;		PMBlockAttr		*used;
   ;		PageListStruct	far *page;
   ;	
   ;	
	cmp	word ptr DGROUP:_MainPresent,0
	jne	short @8@74
   ;	
   ;		if (!MainPresent)
   ;	
	jmp	@8@578
@8@74:
   ;	
   ;			return;
   ;	
   ;	
	xor	di,di
	mov	ax,word ptr DGROUP:_PMPages+2
	mov	dx,word ptr DGROUP:_PMPages
	mov	word ptr [bp-10],dx
	mov	word ptr [bp-8],ax
	jmp	short @8@194
@8@98:
   ;	
   ;		for (i = 0,page = PMPages;i < ChunksInFile;i++,page++)
   ;		{
   ;	
	les	bx,dword ptr [bp-10]
	mov	ax,word ptr es:[bx+12]
	mov	word ptr [bp-4],ax
   ;	
   ;			n = page->mainPage;
   ;	
	cmp	word ptr [bp-4],65535
	je	short @8@170
   ;	
   ;			if (n != -1)						// Is the page using main memory?
   ;			{
   ;	
	mov	bx,word ptr [bp-4]
	shl	bx,1
	cmp	word ptr DGROUP:_MainMemPages[bx],0
	jne	short @8@170
   ;	
   ;				if (!MainMemPages[n])			// Yep, was the block purged?
   ;				{
   ;	
	les	bx,dword ptr [bp-10]
	mov	word ptr es:[bx+12],65535
   ;	
   ;					page->mainPage = -1;		// Yes, mark page as purged & unlocked
   ;	
	les	bx,dword ptr [bp-10]
	mov	word ptr es:[bx+8],0
@8@170:
	inc	di
	add	word ptr [bp-10],18
@8@194:
	cmp	di,word ptr DGROUP:_ChunksInFile
	jb	short @8@98
   ;	
   ;					page->locked = pml_Unlocked;
   ;				}
   ;			}
   ;		}
   ;	
   ;		// Prevent allocation attempts from purging any of our other blocks
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _PM_SetMainMemPurge
	pop	cx
   ;	
   ;		PM_LockMainMem();
   ;	
	mov	word ptr [bp-2],0
   ;	
   ;		allocfailed = false;
   ;	
	xor	di,di
	mov	word ptr [bp-6],offset DGROUP:_MainMemPages
	mov	si,offset DGROUP:_MainMemUsed
	jmp	short @8@506
@8@242:
   ;	
   ;		for (i = 0,p = MainMemPages,used = MainMemUsed;i < PMMaxMainMem;i++,p++,used++)
   ;		{
   ;	
	mov	bx,word ptr [bp-6]
	cmp	word ptr [bx],0
	jne	short @8@482
   ;	
   ;			if (!*p)							// If the page got purged
   ;			{
   ;	
	test	word ptr [si],2
	je	short @8@314
   ;	
   ;				if (*used & pmba_Allocated)		// If it was allocated
   ;				{
   ;	
	and	word ptr [si],65533
   ;	
   ;					*used &= ~pmba_Allocated;	// Mark as unallocated
   ;	
	dec	word ptr DGROUP:_MainPagesAvail
@8@314:
   ;	
   ;					MainPagesAvail--;			// and decrease available count
   ;				}
   ;	
   ;	
	test	word ptr [si],1
	je	short @8@362
   ;	
   ;				if (*used & pmba_Used)			// If it was used
   ;				{
   ;	
	and	word ptr [si],65534
   ;	
   ;					*used &= ~pmba_Used;		// Mark as unused
   ;	
	dec	word ptr DGROUP:_MainPagesUsed
@8@362:
   ;	
   ;					MainPagesUsed--;			// and decrease used count
   ;				}
   ;	
   ;	
	cmp	word ptr [bp-2],0
	jne	short @8@482
   ;	
   ;				if (!allocfailed)
   ;				{
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _MM_BombOnError
	pop	cx
   ;	
   ;					MM_BombOnError(false);
   ;	
	xor	ax,ax
	mov	dx,4096
	push	ax
	push	dx
	push	word ptr [bp-6]
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;					MM_GetPtr(p,PMPageSize);		// Try to reallocate
   ;	
	cmp	word ptr DGROUP:_mmerror,0
	je	short @8@434
   ;	
   ;					if (mmerror)					// If it failed,
   ;	
	mov	word ptr [bp-2],1
	jmp	short @8@458
@8@434:
   ;	
   ;						allocfailed = true;			//  don't try any more allocations
   ;					else							// If it worked,
   ;					{
   ;	
	or	word ptr [si],2
   ;	
   ;						*used |= pmba_Allocated;	// Mark as allocated
   ;	
	inc	word ptr DGROUP:_MainPagesAvail
@8@458:
   ;	
   ;						MainPagesAvail++;			// and increase available count
   ;					}
   ;	
	mov	ax,1
	push	ax
	call	near ptr _MM_BombOnError
	pop	cx
@8@482:
	inc	di
	add	word ptr [bp-6],2
	inc	si
	inc	si
@8@506:
	cmp	di,100
	jl	short @8@242
   ;	
   ;					MM_BombOnError(true);
   ;				}
   ;			}
   ;		}
   ;	
	cmp	word ptr DGROUP:_mmerror,0
	je	short @8@578
   ;	
   ;		if (mmerror)
   ;	
	mov	word ptr DGROUP:_mmerror,0
@8@578:
   ;	
   ;			mmerror = false;
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PM_CheckMainMem	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PML_StartupMainMem	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	PML_StartupMainMem(void)
   ;	{
   ;		int		i,n;
   ;		memptr	*p;
   ;	
   ;	
	mov	word ptr DGROUP:_MainPagesAvail,0
   ;	
   ;		MainPagesAvail = 0;
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _MM_BombOnError
	pop	cx
   ;	
   ;		MM_BombOnError(false);
   ;	
	xor	si,si
	mov	di,offset DGROUP:_MainMemPages
	jmp	short @9@146
@9@50:
   ;	
   ;		for (i = 0,p = MainMemPages;i < PMMaxMainMem;i++,p++)
   ;		{
   ;	
	xor	ax,ax
	mov	dx,4096
	push	ax
	push	dx
	push	di
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;			MM_GetPtr(p,PMPageSize);
   ;	
	cmp	word ptr DGROUP:_mmerror,0
	je	short @9@98
   ;	
   ;			if (mmerror)
   ;	
	jmp	short @9@170
@9@98:
   ;	
   ;				break;
   ;	
   ;	
	inc	word ptr DGROUP:_MainPagesAvail
   ;	
   ;			MainPagesAvail++;
   ;	
	mov	bx,si
	shl	bx,1
	mov	word ptr DGROUP:_MainMemUsed[bx],2
	inc	si
	inc	di
	inc	di
@9@146:
	cmp	si,100
	jl	short @9@50
@9@170:
   ;	
   ;			MainMemUsed[i] = pmba_Allocated;
   ;		}
   ;	
	mov	ax,1
	push	ax
	call	near ptr _MM_BombOnError
	pop	cx
   ;	
   ;		MM_BombOnError(true);
   ;	
	cmp	word ptr DGROUP:_mmerror,0
	je	short @9@218
   ;	
   ;		if (mmerror)
   ;	
	mov	word ptr DGROUP:_mmerror,0
@9@218:
   ;	
   ;			mmerror = false;
   ;	
	cmp	word ptr DGROUP:_MainPagesAvail,10
	jge	short @9@266
   ;	
   ;		if (MainPagesAvail < PMMinMainMem)
   ;	
	mov	ax,offset DGROUP:s@+174
	push	ax
	call	near ptr _Quit
	pop	cx
@9@266:
   ;	
   ;			Quit("PM_SetupMainMem: Not enough main memory");
   ;	
	mov	word ptr DGROUP:_MainPresent,1
   ;	
   ;		MainPresent = true;
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_PML_StartupMainMem	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PML_ShutdownMainMem	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	PML_ShutdownMainMem(void)
   ;	{
   ;		int		i;
   ;		memptr	*p;
   ;	
   ;		// DEBUG - mark pages as unallocated & decrease page count as appropriate
   ;	
	xor	di,di
	mov	si,offset DGROUP:_MainMemPages
	jmp	short @10@122
@10@50:
   ;	
   ;		for (i = 0,p = MainMemPages;i < PMMaxMainMem;i++,p++)
   ;	
	cmp	word ptr [si],0
	je	short @10@98
   ;	
   ;			if (*p)
   ;	
	push	si
	call	near ptr _MM_FreePtr
	pop	cx
@10@98:
	inc	di
	inc	si
	inc	si
@10@122:
	cmp	di,100
	jl	short @10@50
   ;	
   ;				MM_FreePtr(p);
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_PML_ShutdownMainMem	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PML_ReadFromFile	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	PML_ReadFromFile(byte far *buf,long offset,word length)
   ;	{
   ;	
	mov	ax,word ptr [bp+4]
	or	ax,word ptr [bp+6]
	jne	short @11@74
   ;	
   ;		if (!buf)
   ;	
	mov	ax,offset DGROUP:s@+214
	push	ax
	call	near ptr _Quit
	pop	cx
@11@74:
   ;	
   ;			Quit("PML_ReadFromFile: Null pointer");
   ;	
	mov	ax,word ptr [bp+8]
	or	ax,word ptr [bp+10]
	jne	short @11@122
   ;	
   ;		if (!offset)
   ;	
	mov	ax,offset DGROUP:s@+245
	push	ax
	call	near ptr _Quit
	pop	cx
@11@122:
   ;	
   ;			Quit("PML_ReadFromFile: Zero offset");
   ;	
	xor	ax,ax
	push	ax
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr DGROUP:_PageFile
	call	near ptr _lseek
	add	sp,8
	cmp	dx,word ptr [bp+10]
	jne	short @11@170
	cmp	ax,word ptr [bp+8]
	je	short @11@194
@11@170:
   ;	
   ;		if (lseek(PageFile,offset,SEEK_SET) != offset)
   ;	
	mov	ax,offset DGROUP:s@+275
	push	ax
	call	near ptr _Quit
	pop	cx
@11@194:
   ;	
   ;			Quit("PML_ReadFromFile: Seek failed");
   ;	
	xor	ax,ax
	push	ax
	push	word ptr [bp+12]
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	push	word ptr DGROUP:_PageFile
	call	near ptr _CA_FarRead
	add	sp,10
	or	ax,ax
	jne	short @11@242
   ;	
   ;		if (!CA_FarRead(PageFile,buf,length))
   ;	
	mov	ax,offset DGROUP:s@+305
	push	ax
	call	near ptr _Quit
	pop	cx
@11@242:
   ;	
   ;			Quit("PML_ReadFromFile: Read failed");
   ;	
	pop	bp
	ret	
_PML_ReadFromFile	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PML_OpenPageFile	proc	near
	push	bp
	mov	bp,sp
	sub	sp,18
	push	si
	push	di
   ;	
   ;	PML_OpenPageFile(void)
   ;	{
   ;		int				i;
   ;		long			size;
   ;		void			_seg *buf;
   ;		longword		far *offsetptr;
   ;		word			far *lengthptr;
   ;		PageListStruct	far *page;
   ;	
   ;	
	mov	ax,32769
	push	ax
	mov	ax,offset DGROUP:_PageFileName
	push	ax
	call	near ptr _open
	pop	cx
	pop	cx
	mov	word ptr DGROUP:_PageFile,ax
   ;	
   ;		PageFile = open(PageFileName,O_RDONLY + O_BINARY);
   ;	
	cmp	word ptr DGROUP:_PageFile,65535
	jne	short @12@74
   ;	
   ;		if (PageFile == -1)
   ;	
	mov	ax,offset DGROUP:s@+335
	push	ax
	call	near ptr _Quit
	pop	cx
@12@74:
   ;	
   ;			Quit("PML_OpenPageFile: Unable to open page file");
   ;	
   ;		// Read in header variables
   ;	
	mov	ax,2
	push	ax
	mov	ax,offset DGROUP:_ChunksInFile
	push	ax
	push	word ptr DGROUP:_PageFile
	call	near ptr _read
	add	sp,6
   ;	
   ;		read(PageFile,&ChunksInFile,sizeof(ChunksInFile));
   ;	
	mov	ax,2
	push	ax
	mov	ax,offset DGROUP:_PMSpriteStart
	push	ax
	push	word ptr DGROUP:_PageFile
	call	near ptr _read
	add	sp,6
   ;	
   ;		read(PageFile,&PMSpriteStart,sizeof(PMSpriteStart));
   ;	
	mov	ax,2
	push	ax
	mov	ax,offset DGROUP:_PMSoundStart
	push	ax
	push	word ptr DGROUP:_PageFile
	call	near ptr _read
	add	sp,6
   ;	
   ;		read(PageFile,&PMSoundStart,sizeof(PMSoundStart));
   ;	
   ;		// Allocate and clear the page list
   ;	
	mov	ax,word ptr DGROUP:_ChunksInFile
	mov	word ptr DGROUP:_PMNumBlocks,ax
   ;	
   ;		PMNumBlocks = ChunksInFile;
   ;	
	mov	ax,word ptr DGROUP:_PMNumBlocks
	mov	dx,18
	imul	dx
	xor	dx,dx
	push	dx
	push	ax
	mov	ax,offset DGROUP:_PMSegPages
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;		MM_GetPtr(&(memptr)PMSegPages,sizeof(PageListStruct) * PMNumBlocks);
   ;	
	mov	ax,1
	push	ax
	mov	ax,offset DGROUP:_PMSegPages
	push	ax
	call	near ptr _MM_SetLock
	pop	cx
	pop	cx
   ;	
   ;		MM_SetLock(&(memptr)PMSegPages,true);
   ;	
	mov	ax,word ptr DGROUP:_PMSegPages
	mov	word ptr DGROUP:_PMPages,0
	mov	word ptr DGROUP:_PMPages+2,ax
   ;	
   ;		PMPages = (PageListStruct far *)PMSegPages;
   ;	
	mov	ax,word ptr DGROUP:_PMNumBlocks
	mov	dx,18
	imul	dx
	push	ax
	xor	ax,ax
	push	ax
	push	word ptr DGROUP:_PMPages+2
	push	word ptr DGROUP:_PMPages
	call	near ptr __fmemset
	add	sp,8
   ;	
   ;		_fmemset(PMPages,0,sizeof(PageListStruct) * PMNumBlocks);
   ;	
   ;		// Read in the chunk offsets
   ;	
	mov	ax,word ptr DGROUP:_ChunksInFile
	shl	ax,1
	shl	ax,1
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],0
   ;	
   ;		size = sizeof(longword) * ChunksInFile;
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	lea	ax,word ptr [bp-6]
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;		MM_GetPtr(&buf,size);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	xor	ax,ax
	push	ax
	push	word ptr DGROUP:_PageFile
	call	near ptr _CA_FarRead
	add	sp,10
	or	ax,ax
	jne	short @12@122
   ;	
   ;		if (!CA_FarRead(PageFile,(byte far *)buf,size))
   ;	
	mov	ax,offset DGROUP:s@+378
	push	ax
	call	near ptr _Quit
	pop	cx
@12@122:
   ;	
   ;			Quit("PML_OpenPageFile: Offset read failed");
   ;	
	mov	ax,word ptr [bp-6]
	mov	word ptr [bp-10],0
	mov	word ptr [bp-8],ax
   ;	
   ;		offsetptr = (longword far *)buf;
   ;	
	xor	si,si
	mov	ax,word ptr DGROUP:_PMPages+2
	mov	dx,word ptr DGROUP:_PMPages
	mov	word ptr [bp-18],dx
	mov	word ptr [bp-16],ax
	jmp	short @12@194
@12@146:
   ;	
   ;		for (i = 0,page = PMPages;i < ChunksInFile;i++,page++)
   ;	
	les	bx,dword ptr [bp-10]
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	les	bx,dword ptr [bp-18]
	mov	word ptr es:[bx],dx
	mov	word ptr es:[bx+2],ax
	add	word ptr [bp-10],4
	inc	si
	add	word ptr [bp-18],18
@12@194:
	cmp	si,word ptr DGROUP:_ChunksInFile
	jb	short @12@146
   ;	
   ;			page->offset = *offsetptr++;
   ;	
	lea	ax,word ptr [bp-6]
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
   ;	
   ;		MM_FreePtr(&buf);
   ;	
   ;		// Read in the chunk lengths
   ;	
	mov	ax,word ptr DGROUP:_ChunksInFile
	shl	ax,1
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],0
   ;	
   ;		size = sizeof(word) * ChunksInFile;
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	lea	ax,word ptr [bp-6]
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;		MM_GetPtr(&buf,size);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	xor	ax,ax
	push	ax
	push	word ptr DGROUP:_PageFile
	call	near ptr _CA_FarRead
	add	sp,10
	or	ax,ax
	jne	short @12@266
   ;	
   ;		if (!CA_FarRead(PageFile,(byte far *)buf,size))
   ;	
	mov	ax,offset DGROUP:s@+415
	push	ax
	call	near ptr _Quit
	pop	cx
@12@266:
   ;	
   ;			Quit("PML_OpenPageFile: Length read failed");
   ;	
	mov	ax,word ptr [bp-6]
	mov	word ptr [bp-14],0
	mov	word ptr [bp-12],ax
   ;	
   ;		lengthptr = (word far *)buf;
   ;	
	xor	si,si
	mov	ax,word ptr DGROUP:_PMPages+2
	mov	dx,word ptr DGROUP:_PMPages
	mov	word ptr [bp-18],dx
	mov	word ptr [bp-16],ax
	jmp	short @12@338
@12@290:
   ;	
   ;		for (i = 0,page = PMPages;i < ChunksInFile;i++,page++)
   ;	
	les	bx,dword ptr [bp-18]
	push	es
	les	di,dword ptr [bp-14]
	mov	ax,word ptr es:[di]
	pop	es
	mov	word ptr es:[bx+4],ax
	add	word ptr [bp-14],2
	inc	si
	add	word ptr [bp-18],18
@12@338:
	cmp	si,word ptr DGROUP:_ChunksInFile
	jb	short @12@290
   ;	
   ;			page->length = *lengthptr++;
   ;	
	lea	ax,word ptr [bp-6]
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
   ;	
   ;		MM_FreePtr(&buf);
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PML_OpenPageFile	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PML_ClosePageFile	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	PML_ClosePageFile(void)
   ;	{
   ;	
	cmp	word ptr DGROUP:_PageFile,65535
	je	short @13@74
   ;	
   ;		if (PageFile != -1)
   ;	
	push	word ptr DGROUP:_PageFile
	call	near ptr _close
	pop	cx
@13@74:
   ;	
   ;			close(PageFile);
   ;	
	cmp	word ptr DGROUP:_PMSegPages,0
	je	short @13@122
   ;	
   ;		if (PMSegPages)
   ;		{
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_PMSegPages
	push	ax
	call	near ptr _MM_SetLock
	pop	cx
	pop	cx
   ;	
   ;			MM_SetLock(&(memptr)PMSegPages,false);
   ;	
	mov	ax,offset DGROUP:_PMSegPages
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
@13@122:
   ;	
   ;			MM_FreePtr(&(void _seg *)PMSegPages);
   ;		}
   ;	
	pop	bp
	ret	
_PML_ClosePageFile	endp
   ;	
   ;	memptr
   ;	
	assume	cs:_TEXT
_PML_GetEMSAddress	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	push	si
	push	di
   ;	
   ;	PML_GetEMSAddress(int page,PMLockType lock)
   ;	{
   ;		int		i,emspage;
   ;		word	emsoff,emsbase,offset;
   ;	
   ;	
	mov	ax,word ptr [bp+4]
	and	ax,3
	mov	word ptr [bp-2],ax
   ;	
   ;		emsoff = page & (PMEMSSubPage - 1);
   ;	
	mov	ax,word ptr [bp+4]
	sub	ax,word ptr [bp-2]
	mov	word ptr [bp-4],ax
   ;	
   ;		emsbase = page - emsoff;
   ;	
   ;	
	mov	di,65535
   ;	
   ;		emspage = -1;
   ;		// See if this page is already mapped in
   ;	
	xor	si,si
	jmp	short @14@122
@14@50:
   ;	
   ;		for (i = 0;i < EMSFrameCount;i++)
   ;		{
   ;	
	mov	ax,si
	mov	dx,6
	imul	dx
	mov	bx,ax
	mov	ax,word ptr DGROUP:_EMSList[bx]
	cmp	ax,word ptr [bp-4]
	jne	short @14@98
   ;	
   ;			if (EMSList[i].baseEMSPage == emsbase)
   ;			{
   ;	
	mov	di,si
   ;	
   ;				emspage = i;	// Yep - don't do a redundant remapping
   ;	
	jmp	short @14@146
@14@98:
	inc	si
@14@122:
	cmp	si,4
	jl	short @14@50
@14@146:
   ;	
   ;				break;
   ;			}
   ;		}
   ;	
   ;		// If page isn't already mapped in, find LRU EMS frame, and use it
   ;	
	cmp	di,65535
	jne	short @14@362
   ;	
   ;		if (emspage == -1)
   ;		{
   ;	
	mov	word ptr [bp-10],65535
	mov	word ptr [bp-8],32767
   ;	
   ;			longword last = MAXLONG;
   ;	
	xor	si,si
	jmp	short @14@314
@14@194:
   ;	
   ;			for (i = 0;i < EMSFrameCount;i++)
   ;			{
   ;	
	mov	ax,si
	mov	dx,6
	imul	dx
	mov	bx,ax
	mov	ax,word ptr DGROUP:_EMSList[bx+4]
	mov	dx,word ptr DGROUP:_EMSList[bx+2]
	cmp	ax,word ptr [bp-8]
	ja	short @14@290
	jb	short @14@266
	cmp	dx,word ptr [bp-10]
	jae	short @14@290
@14@266:
   ;	
   ;				if (EMSList[i].lastHit < last)
   ;				{
   ;	
	mov	di,si
   ;	
   ;					emspage = i;
   ;	
	mov	ax,si
	mov	dx,6
	imul	dx
	mov	bx,ax
	mov	ax,word ptr DGROUP:_EMSList[bx+4]
	mov	dx,word ptr DGROUP:_EMSList[bx+2]
	mov	word ptr [bp-10],dx
	mov	word ptr [bp-8],ax
@14@290:
	inc	si
@14@314:
	cmp	si,4
	jl	short @14@194
   ;	
   ;					last = EMSList[i].lastHit;
   ;				}
   ;			}
   ;	
   ;	
	mov	ax,di
	mov	dx,6
	imul	dx
	mov	dx,word ptr [bp-4]
	mov	bx,ax
	mov	word ptr DGROUP:_EMSList[bx],dx
   ;	
   ;			EMSList[emspage].baseEMSPage = emsbase;
   ;	
	push	di
	mov	ax,word ptr [bp+4]
	mov	bx,4
	cwd	
	idiv	bx
	push	ax
	call	near ptr _PML_MapEMS
	pop	cx
	pop	cx
@14@362:
   ;	
   ;			PML_MapEMS(page / PMEMSSubPage,emspage);
   ;		}
   ;	
   ;	
	cmp	di,65535
	jne	short @14@410
   ;	
   ;		if (emspage == -1)
   ;	
	mov	ax,offset DGROUP:s@+452
	push	ax
	call	near ptr _Quit
	pop	cx
@14@410:
   ;	
   ;			Quit("PML_GetEMSAddress: EMS find failed");
   ;	
   ;	
	mov	ax,di
	mov	dx,6
	imul	dx
	mov	dx,word ptr DGROUP:_PMFrameCount+2
	mov	bx,word ptr DGROUP:_PMFrameCount
	xchg	bx,ax
	mov	word ptr DGROUP:_EMSList[bx+2],ax
	mov	word ptr DGROUP:_EMSList[bx+4],dx
   ;	
   ;		EMSList[emspage].lastHit = PMFrameCount;
   ;	
	mov	ax,di
	mov	cl,10
	shl	ax,cl
	mov	word ptr [bp-6],ax
   ;	
   ;		offset = emspage * EMSPageSizeSeg;
   ;	
	mov	ax,word ptr [bp-2]
	mov	cl,8
	shl	ax,cl
	add	word ptr [bp-6],ax
   ;	
   ;		offset += emsoff * PMPageSizeSeg;
   ;	
	mov	ax,word ptr DGROUP:_EMSPageFrame
	add	ax,word ptr [bp-6]
	jmp	short @14@434
@14@434:
   ;	
   ;		return((memptr)(EMSPageFrame + offset));
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PML_GetEMSAddress	endp
   ;	
   ;	memptr
   ;	
	assume	cs:_TEXT
_PM_GetPageAddress	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;	PM_GetPageAddress(int pagenum)
   ;	{
   ;		PageListStruct	far *page;
   ;	
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,18
	imul	dx
	mov	dx,word ptr DGROUP:_PMPages+2
	mov	bx,word ptr DGROUP:_PMPages
	add	bx,ax
	mov	word ptr [bp-4],bx
	mov	word ptr [bp-2],dx
   ;	
   ;		page = &PMPages[pagenum];
   ;	
	les	bx,dword ptr [bp-4]
	cmp	word ptr es:[bx+12],65535
	je	short @15@98
   ;	
   ;		if (page->mainPage != -1)
   ;	
	les	bx,dword ptr [bp-4]
	mov	bx,word ptr es:[bx+12]
	shl	bx,1
	mov	ax,word ptr DGROUP:_MainMemPages[bx]
	jmp	short @15@194
	jmp	short @15@194
@15@98:
   ;	
   ;			return(MainMemPages[page->mainPage]);
   ;	
	les	bx,dword ptr [bp-4]
	cmp	word ptr es:[bx+10],65535
	je	short @15@170
   ;	
   ;		else if (page->emsPage != -1)
   ;	
	les	bx,dword ptr [bp-4]
	push	word ptr es:[bx+8]
	les	bx,dword ptr [bp-4]
	push	word ptr es:[bx+10]
	call	near ptr _PML_GetEMSAddress
	pop	cx
	pop	cx
	jmp	short @15@194
	jmp	short @15@194
@15@170:
   ;	
   ;			return(PML_GetEMSAddress(page->emsPage,page->locked));
   ;		else
   ;	
	xor	ax,ax
	jmp	short @15@194
@15@194:
   ;	
   ;			return(nil);
   ;	
	mov	sp,bp
	pop	bp
	ret	
_PM_GetPageAddress	endp
   ;	
   ;	int
   ;	
	assume	cs:_TEXT
_PML_GiveLRUPage	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	di
   ;	
   ;	PML_GiveLRUPage(boolean mainonly)
   ;	{
   ;		int				i,lru;
   ;		long			last;
   ;		PageListStruct	far *page;
   ;	
   ;	
	xor	si,si
	mov	ax,word ptr DGROUP:_PMPages+2
	mov	dx,word ptr DGROUP:_PMPages
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
	mov	di,65535
	mov	word ptr [bp-4],65535
	mov	word ptr [bp-2],32767
	jmp	short @16@290
@16@50:
   ;	
   ;		for (i = 0,page = PMPages,lru = -1,last = MAXLONG;i < ChunksInFile;i++,page++)
   ;		{
   ;	
   ;	
   ;			if
   ;			(
   ;				(page->lastHit < last)
   ;			&&	((page->emsPage != -1) || (page->mainPage != -1))
   ;			&& 	(page->locked == pml_Unlocked)
   ;			&&	(!(mainonly && (page->mainPage == -1)))
   ;	
	les	bx,dword ptr [bp-8]
	mov	ax,word ptr es:[bx+16]
	mov	dx,word ptr es:[bx+14]
	cmp	ax,word ptr [bp-2]
	ja	short @16@266
	jb	short @16@122
	cmp	dx,word ptr [bp-4]
	jae	short @16@266
@16@122:
	les	bx,dword ptr [bp-8]
	cmp	word ptr es:[bx+10],65535
	jne	short @16@170
	les	bx,dword ptr [bp-8]
	cmp	word ptr es:[bx+12],65535
	je	short @16@266
@16@170:
	les	bx,dword ptr [bp-8]
	cmp	word ptr es:[bx+8],0
	jne	short @16@266
	cmp	word ptr [bp+4],0
	je	short @16@242
	les	bx,dword ptr [bp-8]
	cmp	word ptr es:[bx+12],65535
	je	short @16@266
@16@242:
   ;	
   ;			)
   ;			{
   ;	
	les	bx,dword ptr [bp-8]
	mov	ax,word ptr es:[bx+16]
	mov	dx,word ptr es:[bx+14]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;				last = page->lastHit;
   ;	
	mov	di,si
@16@266:
	inc	si
	add	word ptr [bp-8],18
@16@290:
	cmp	si,word ptr DGROUP:_ChunksInFile
	jb	short @16@50
   ;	
   ;				lru = i;
   ;			}
   ;		}
   ;	
   ;	
	cmp	di,65535
	jne	short @16@362
   ;	
   ;		if (lru == -1)
   ;	
	mov	ax,offset DGROUP:s@+487
	push	ax
	call	near ptr _Quit
	pop	cx
@16@362:
   ;	
   ;			Quit("PML_GiveLRUPage: LRU Search failed");
   ;	
	mov	ax,di
	jmp	short @16@386
@16@386:
   ;	
   ;		return(lru);
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PML_GiveLRUPage	endp
   ;	
   ;	int
   ;	
	assume	cs:_TEXT
_PML_GiveLRUXMSPage	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	di
   ;	
   ;	PML_GiveLRUXMSPage(void)
   ;	{
   ;		int				i,lru;
   ;		long			last;
   ;		PageListStruct	far *page;
   ;	
   ;	
	xor	si,si
	mov	ax,word ptr DGROUP:_PMPages+2
	mov	dx,word ptr DGROUP:_PMPages
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
	mov	di,65535
	mov	word ptr [bp-4],65535
	mov	word ptr [bp-2],32767
	jmp	short @17@218
@17@50:
   ;	
   ;		for (i = 0,page = PMPages,lru = -1,last = MAXLONG;i < ChunksInFile;i++,page++)
   ;		{
   ;	
   ;	
   ;			if
   ;			(
   ;				(page->xmsPage != -1)
   ;			&&	(page->lastHit < last)
   ;			&&	(i != XMSProtectPage)
   ;	
	les	bx,dword ptr [bp-8]
	cmp	word ptr es:[bx+6],65535
	je	short @17@194
	les	bx,dword ptr [bp-8]
	mov	ax,word ptr es:[bx+16]
	mov	dx,word ptr es:[bx+14]
	cmp	ax,word ptr [bp-2]
	ja	short @17@194
	jb	short @17@146
	cmp	dx,word ptr [bp-4]
	jae	short @17@194
@17@146:
	cmp	si,word ptr DGROUP:_XMSProtectPage
	je	short @17@194
   ;	
   ;			)
   ;			{
   ;	
	les	bx,dword ptr [bp-8]
	mov	ax,word ptr es:[bx+16]
	mov	dx,word ptr es:[bx+14]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;				last = page->lastHit;
   ;	
	mov	di,si
@17@194:
	inc	si
	add	word ptr [bp-8],18
@17@218:
	cmp	si,word ptr DGROUP:_ChunksInFile
	jb	short @17@50
   ;	
   ;				lru = i;
   ;			}
   ;		}
   ;	
	mov	ax,di
	jmp	short @17@266
@17@266:
   ;	
   ;		return(lru);
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PML_GiveLRUXMSPage	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PML_PutPageInXMS	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
   ;	
   ;	PML_PutPageInXMS(int pagenum)
   ;	{
   ;		int				usexms;
   ;		PageListStruct	far *page;
   ;	
   ;	
	cmp	word ptr DGROUP:_XMSPresent,0
	jne	short @18@74
   ;	
   ;		if (!XMSPresent)
   ;	
	jmp	@18@266
@18@74:
   ;	
   ;			return;
   ;	
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,18
	imul	dx
	mov	dx,word ptr DGROUP:_PMPages+2
	mov	bx,word ptr DGROUP:_PMPages
	add	bx,ax
	mov	word ptr [bp-4],bx
	mov	word ptr [bp-2],dx
   ;	
   ;		page = &PMPages[pagenum];
   ;	
	les	bx,dword ptr [bp-4]
	cmp	word ptr es:[bx+6],65535
	je	short @18@122
   ;	
   ;		if (page->xmsPage != -1)
   ;	
	jmp	short @18@266
@18@122:
   ;	
   ;			return;					// Already in XMS
   ;	
   ;	
	mov	ax,word ptr DGROUP:_XMSPagesUsed
	cmp	ax,word ptr DGROUP:_XMSPagesAvail
	jae	short @18@170
   ;	
   ;		if (XMSPagesUsed < XMSPagesAvail)
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr DGROUP:_XMSPagesUsed
	mov	word ptr es:[bx+6],ax
	inc	word ptr DGROUP:_XMSPagesUsed
	jmp	short @18@242
@18@170:
   ;	
   ;			page->xmsPage = XMSPagesUsed++;
   ;		else
   ;		{
   ;	
	call	near ptr _PML_GiveLRUXMSPage
	mov	si,ax
   ;	
   ;			usexms = PML_GiveLRUXMSPage();
   ;	
	cmp	si,65535
	jne	short @18@218
   ;	
   ;			if (usexms == -1)
   ;	
	mov	ax,offset DGROUP:s@+522
	push	ax
	call	near ptr _Quit
	pop	cx
@18@218:
   ;	
   ;				Quit("PML_PutPageInXMS: No XMS LRU");
   ;	
	mov	ax,si
	mov	dx,18
	imul	dx
	les	bx,dword ptr DGROUP:_PMPages
	add	bx,ax
	mov	ax,word ptr es:[bx+6]
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+6],ax
   ;	
   ;			page->xmsPage = PMPages[usexms].xmsPage;
   ;	
	mov	ax,si
	mov	dx,18
	imul	dx
	les	bx,dword ptr DGROUP:_PMPages
	add	bx,ax
	mov	word ptr es:[bx+6],65535
@18@242:
   ;	
   ;			PMPages[usexms].xmsPage = -1;
   ;		}
   ;	
	les	bx,dword ptr [bp-4]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp-4]
	push	word ptr es:[bx+6]
	push	word ptr [bp+4]
	call	near ptr _PM_GetPageAddress
	pop	cx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _PML_XMSCopy
	add	sp,10
@18@266:
   ;	
   ;		PML_CopyToXMS(PM_GetPageAddress(pagenum),page->xmsPage,page->length);
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PML_PutPageInXMS	endp
   ;	
   ;	memptr
   ;	
	assume	cs:_TEXT
_PML_TransferPageSpace	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	PML_TransferPageSpace(int orig,int new)
   ;	{
   ;		memptr			addr;
   ;		PageListStruct	far *origpage,far *newpage;
   ;	
   ;	
	cmp	di,word ptr [bp+6]
	jne	short @19@74
   ;	
   ;		if (orig == new)
   ;	
	mov	ax,offset DGROUP:s@+551
	push	ax
	call	near ptr _Quit
	pop	cx
@19@74:
   ;	
   ;			Quit("PML_TransferPageSpace: Identity replacement");
   ;	
   ;	
	mov	ax,di
	mov	dx,18
	imul	dx
	mov	dx,word ptr DGROUP:_PMPages+2
	mov	bx,word ptr DGROUP:_PMPages
	add	bx,ax
	mov	word ptr [bp-4],bx
	mov	word ptr [bp-2],dx
   ;	
   ;		origpage = &PMPages[orig];
   ;	
	mov	ax,word ptr [bp+6]
	mov	dx,18
	imul	dx
	mov	dx,word ptr DGROUP:_PMPages+2
	mov	bx,word ptr DGROUP:_PMPages
	add	bx,ax
	mov	word ptr [bp-8],bx
	mov	word ptr [bp-6],dx
   ;	
   ;		newpage = &PMPages[new];
   ;	
   ;	
	les	bx,dword ptr [bp-4]
	cmp	word ptr es:[bx+8],0
	je	short @19@122
   ;	
   ;		if (origpage->locked != pml_Unlocked)
   ;	
	mov	ax,offset DGROUP:s@+595
	push	ax
	call	near ptr _Quit
	pop	cx
@19@122:
   ;	
   ;			Quit("PML_TransferPageSpace: Killing locked page");
   ;	
   ;	
	les	bx,dword ptr [bp-4]
	cmp	word ptr es:[bx+10],65535
	jne	short @19@194
	les	bx,dword ptr [bp-4]
	cmp	word ptr es:[bx+12],65535
	jne	short @19@194
   ;	
   ;		if ((origpage->emsPage == -1) && (origpage->mainPage == -1))
   ;	
	mov	ax,offset DGROUP:s@+638
	push	ax
	call	near ptr _Quit
	pop	cx
@19@194:
   ;	
   ;			Quit("PML_TransferPageSpace: Reusing non-existent page");
   ;	
   ;		// Copy page that's about to be purged into XMS
   ;	
	push	di
	call	near ptr _PML_PutPageInXMS
	pop	cx
   ;	
   ;		PML_PutPageInXMS(orig);
   ;	
   ;		// Get the address, and force EMS into a physical page if necessary
   ;	
	push	di
	call	near ptr _PM_GetPageAddress
	pop	cx
	mov	si,ax
   ;	
   ;		addr = PM_GetPageAddress(orig);
   ;	
   ;		// Steal the address
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+10]
	les	bx,dword ptr [bp-8]
	mov	word ptr es:[bx+10],ax
   ;	
   ;		newpage->emsPage = origpage->emsPage;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx+12]
	les	bx,dword ptr [bp-8]
	mov	word ptr es:[bx+12],ax
   ;	
   ;		newpage->mainPage = origpage->mainPage;
   ;	
   ;		// Mark replaced page as purged
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,65535
	mov	word ptr es:[bx+10],ax
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+12],ax
   ;	
   ;		origpage->mainPage = origpage->emsPage = -1;
   ;	
   ;	
	or	si,si
	jne	short @19@242
   ;	
   ;		if (!addr)
   ;	
	mov	ax,offset DGROUP:s@+687
	push	ax
	call	near ptr _Quit
	pop	cx
@19@242:
   ;	
   ;			Quit("PML_TransferPageSpace: Zero replacement");
   ;	
   ;	
	mov	ax,si
	jmp	short @19@266
@19@266:
   ;	
   ;		return(addr);
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PML_TransferPageSpace	endp
   ;	
   ;	byte far *
   ;	
	assume	cs:_TEXT
_PML_GetAPageBuffer	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	push	si
	push	di
   ;	
   ;	PML_GetAPageBuffer(int pagenum,boolean mainonly)
   ;	{
   ;	
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],ds
   ;	
   ;		byte			far *addr = nil;
   ;		int				i,n;
   ;		PMBlockAttr		*used;
   ;		PageListStruct	far *page;
   ;	
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,18
	imul	dx
	mov	dx,word ptr DGROUP:_PMPages+2
	mov	bx,word ptr DGROUP:_PMPages
	add	bx,ax
	mov	word ptr [bp-10],bx
	mov	word ptr [bp-8],dx
   ;	
   ;		page = &PMPages[pagenum];
   ;	
	mov	ax,word ptr DGROUP:_EMSPagesUsed
	cmp	ax,word ptr DGROUP:_EMSPagesAvail
	jae	short @20@98
	cmp	word ptr [bp+6],0
	jne	short @20@98
   ;	
   ;		if ((EMSPagesUsed < EMSPagesAvail) && !mainonly)
   ;		{
   ;			// There's remaining EMS - use it
   ;	
	les	bx,dword ptr [bp-10]
	mov	ax,word ptr DGROUP:_EMSPagesUsed
	mov	word ptr es:[bx+10],ax
	inc	word ptr DGROUP:_EMSPagesUsed
   ;	
   ;			page->emsPage = EMSPagesUsed++;
   ;	
	les	bx,dword ptr [bp-10]
	push	word ptr es:[bx+8]
	les	bx,dword ptr [bp-10]
	push	word ptr es:[bx+10]
	call	near ptr _PML_GetEMSAddress
	pop	cx
	pop	cx
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],ax
   ;	
   ;			addr = PML_GetEMSAddress(page->emsPage,page->locked);
   ;	
	jmp	@20@410
@20@98:
   ;	
   ;		}
   ;	
	mov	ax,word ptr DGROUP:_MainPagesUsed
	cmp	ax,word ptr DGROUP:_MainPagesAvail
	jae	short @20@386
   ;	
   ;		else if (MainPagesUsed < MainPagesAvail)
   ;		{
   ;			// There's remaining main memory - use it
   ;	
	mov	word ptr [bp-6],0
	mov	di,65535
	mov	si,offset DGROUP:_MainMemUsed
	jmp	short @20@242
@20@146:
   ;	
   ;			for (i = 0,n = -1,used = MainMemUsed;i < PMMaxMainMem;i++,used++)
   ;			{
   ;	
	test	word ptr [si],2
	je	short @20@218
	test	word ptr [si],1
	jne	short @20@218
   ;	
   ;				if ((*used & pmba_Allocated) && !(*used & pmba_Used))
   ;				{
   ;	
	mov	di,word ptr [bp-6]
   ;	
   ;					n = i;
   ;	
	or	word ptr [si],1
   ;	
   ;					*used |= pmba_Used;
   ;	
	jmp	short @20@266
@20@218:
	inc	word ptr [bp-6]
	inc	si
	inc	si
@20@242:
	cmp	word ptr [bp-6],100
	jl	short @20@146
@20@266:
   ;	
   ;					break;
   ;				}
   ;			}
   ;	
	cmp	di,65535
	jne	short @20@314
   ;	
   ;			if (n == -1)
   ;	
	mov	ax,offset DGROUP:s@+727
	push	ax
	call	near ptr _Quit
	pop	cx
@20@314:
   ;	
   ;				Quit("PML_GetPageBuffer: MainPagesAvail lied");
   ;	
	mov	bx,di
	shl	bx,1
	mov	ax,word ptr DGROUP:_MainMemPages[bx]
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],ax
   ;	
   ;			addr = MainMemPages[n];
   ;	
	mov	ax,word ptr [bp-4]
	or	ax,word ptr [bp-2]
	jne	short @20@362
   ;	
   ;			if (!addr)
   ;	
	mov	ax,offset DGROUP:s@+766
	push	ax
	call	near ptr _Quit
	pop	cx
@20@362:
   ;	
   ;				Quit("PML_GetPageBuffer: Purged main block");
   ;	
	les	bx,dword ptr [bp-10]
	mov	word ptr es:[bx+12],di
   ;	
   ;			page->mainPage = n;
   ;	
	inc	word ptr DGROUP:_MainPagesUsed
   ;	
   ;			MainPagesUsed++;
   ;	
	jmp	short @20@410
@20@386:
   ;	
   ;		}
   ;		else
   ;	
	push	word ptr [bp+4]
	push	word ptr [bp+6]
	call	near ptr _PML_GiveLRUPage
	pop	cx
	push	ax
	call	near ptr _PML_TransferPageSpace
	pop	cx
	pop	cx
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],ax
@20@410:
   ;	
   ;			addr = PML_TransferPageSpace(PML_GiveLRUPage(mainonly),pagenum);
   ;	
   ;	
	mov	ax,word ptr [bp-4]
	or	ax,word ptr [bp-2]
	jne	short @20@458
   ;	
   ;		if (!addr)
   ;	
	mov	ax,offset DGROUP:s@+803
	push	ax
	call	near ptr _Quit
	pop	cx
@20@458:
   ;	
   ;			Quit("PML_GetPageBuffer: Search failed");
   ;	
	mov	dx,word ptr [bp-2]
	mov	ax,word ptr [bp-4]
	jmp	short @20@482
@20@482:
   ;	
   ;		return(addr);
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PML_GetAPageBuffer	endp
   ;	
   ;	memptr
   ;	
	assume	cs:_TEXT
_PML_GetPageFromXMS	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	PML_GetPageFromXMS(int pagenum,boolean mainonly)
   ;	{
   ;		byte			far *checkaddr;
   ;	
	xor	si,si
   ;	
   ;		memptr			addr = nil;
   ;		PageListStruct	far *page;
   ;	
   ;	
	mov	ax,di
	mov	dx,18
	imul	dx
	mov	dx,word ptr DGROUP:_PMPages+2
	mov	bx,word ptr DGROUP:_PMPages
	add	bx,ax
	mov	word ptr [bp-8],bx
	mov	word ptr [bp-6],dx
   ;	
   ;		page = &PMPages[pagenum];
   ;	
	cmp	word ptr DGROUP:_XMSPresent,0
	je	short @21@146
	les	bx,dword ptr [bp-8]
	cmp	word ptr es:[bx+6],65535
	je	short @21@146
   ;	
   ;		if (XMSPresent && (page->xmsPage != -1))
   ;		{
   ;	
	mov	word ptr DGROUP:_XMSProtectPage,di
   ;	
   ;			XMSProtectPage = pagenum;
   ;	
	push	word ptr [bp+6]
	push	di
	call	near ptr _PML_GetAPageBuffer
	pop	cx
	pop	cx
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;			checkaddr = PML_GetAPageBuffer(pagenum,mainonly);
   ;	
	cmp	word ptr [bp-4],0
	je	short @21@122
   ;	
   ;			if (FP_OFF(checkaddr))
   ;	
	mov	ax,offset DGROUP:s@+836
	push	ax
	call	near ptr _Quit
	pop	cx
@21@122:
   ;	
   ;				Quit("PML_GetPageFromXMS: Non segment pointer");
   ;	
	mov	si,word ptr [bp-2]
   ;	
   ;			addr = (memptr)FP_SEG(checkaddr);
   ;	
	les	bx,dword ptr [bp-8]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp-8]
	push	word ptr es:[bx+6]
	push	si
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _PML_XMSCopy
	add	sp,10
   ;	
   ;			PML_CopyFromXMS(addr,page->xmsPage,page->length);
   ;	
	mov	word ptr DGROUP:_XMSProtectPage,65535
@21@146:
   ;	
   ;			XMSProtectPage = -1;
   ;		}
   ;	
   ;	
	mov	ax,si
	jmp	short @21@170
@21@170:
   ;	
   ;		return(addr);
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PML_GetPageFromXMS	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PML_LoadPage	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
   ;	
   ;	PML_LoadPage(int pagenum,boolean mainonly)
   ;	{
   ;		byte			far *addr;
   ;		PageListStruct	far *page;
   ;	
   ;	
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _PML_GetAPageBuffer
	pop	cx
	pop	cx
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;		addr = PML_GetAPageBuffer(pagenum,mainonly);
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,18
	imul	dx
	mov	dx,word ptr DGROUP:_PMPages+2
	mov	bx,word ptr DGROUP:_PMPages
	add	bx,ax
	mov	word ptr [bp-8],bx
	mov	word ptr [bp-6],dx
   ;	
   ;		page = &PMPages[pagenum];
   ;	
	les	bx,dword ptr [bp-8]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp-8]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr _PML_ReadFromFile
	add	sp,10
   ;	
   ;		PML_ReadFromFile(addr,page->offset,page->length);
   ;	
	mov	sp,bp
	pop	bp
	ret	
_PML_LoadPage	endp
   ;	
   ;	memptr
   ;	
	assume	cs:_TEXT
_PM_GetPage	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	PM_GetPage(int pagenum)
   ;	{
   ;		memptr	result;
   ;	
   ;	
	cmp	si,word ptr DGROUP:_ChunksInFile
	jb	short @23@74
   ;	
   ;		if (pagenum >= ChunksInFile)
   ;	
	mov	ax,offset DGROUP:s@+876
	push	ax
	call	near ptr _Quit
	pop	cx
@23@74:
   ;	
   ;			Quit("PM_GetPage: Invalid page request");
   ;	
   ;	#if 0	// for debugging
   ;	asm	mov	dx,STATUS_REGISTER_1
   ;	asm	in	al,dx
   ;	asm	mov	dx,ATR_INDEX
   ;	asm	mov	al,ATR_OVERSCAN
   ;	asm	out	dx,al
   ;	asm	mov	al,10	// bright green
   ;	asm	out	dx,al
   ;	#endif
   ;	
   ;	
	push	si
	call	near ptr _PM_GetPageAddress
	pop	cx
	mov	di,ax
	or	ax,ax
	jne	short @23@338
   ;	
   ;		if (!(result = PM_GetPageAddress(pagenum)))
   ;		{
   ;	
	cmp	si,word ptr DGROUP:_PMSoundStart
	jb	short @23@146
	mov	ax,1
	jmp	short @23@170
@23@146:
	xor	ax,ax
@23@170:
	mov	word ptr [bp-2],ax
   ;	
   ;			boolean mainonly = (pagenum >= PMSoundStart);
   ;	
	mov	ax,si
	mov	dx,18
	imul	dx
	les	bx,dword ptr DGROUP:_PMPages
	add	bx,ax
	mov	ax,word ptr es:[bx]
	or	ax,word ptr es:[bx+2]
	jne	short @23@218
   ;	
   ;	if (!PMPages[pagenum].offset)	// JDC: sparse page
   ;	
	mov	ax,offset DGROUP:s@+909
	push	ax
	call	near ptr _Quit
	pop	cx
@23@218:
   ;	
   ;		Quit ("Tried to load a sparse page!");
   ;	
	push	word ptr [bp-2]
	push	si
	call	near ptr _PML_GetPageFromXMS
	pop	cx
	pop	cx
	mov	di,ax
	or	ax,ax
	jne	short @23@338
   ;	
   ;			if (!(result = PML_GetPageFromXMS(pagenum,mainonly)))
   ;			{
   ;	
	mov	ax,si
	mov	dx,18
	imul	dx
	les	bx,dword ptr DGROUP:_PMPages
	add	bx,ax
	mov	ax,word ptr es:[bx+16]
	mov	dx,word ptr es:[bx+14]
	cmp	ax,word ptr DGROUP:_PMFrameCount+2
	jne	short @23@314
	cmp	dx,word ptr DGROUP:_PMFrameCount
	jne	short @23@314
   ;	
   ;				if (PMPages[pagenum].lastHit == PMFrameCount)
   ;	
	inc	word ptr DGROUP:_PMThrashing
@23@314:
   ;	
   ;					PMThrashing++;
   ;	
   ;	
	push	word ptr [bp-2]
	push	si
	call	near ptr _PML_LoadPage
	pop	cx
	pop	cx
   ;	
   ;				PML_LoadPage(pagenum,mainonly);
   ;	
	push	si
	call	near ptr _PM_GetPageAddress
	pop	cx
	mov	di,ax
@23@338:
   ;	
   ;				result = PM_GetPageAddress(pagenum);
   ;			}
   ;		}
   ;	
	mov	ax,si
	mov	dx,18
	imul	dx
	les	bx,dword ptr DGROUP:_PMPages
	add	bx,ax
	mov	ax,word ptr DGROUP:_PMFrameCount+2
	mov	dx,word ptr DGROUP:_PMFrameCount
	mov	word ptr es:[bx+14],dx
	mov	word ptr es:[bx+16],ax
   ;	
   ;		PMPages[pagenum].lastHit = PMFrameCount;
   ;	
   ;	#if 0	// for debugging
   ;	asm	mov	dx,STATUS_REGISTER_1
   ;	asm	in	al,dx
   ;	asm	mov	dx,ATR_INDEX
   ;	asm	mov	al,ATR_OVERSCAN
   ;	asm	out	dx,al
   ;	asm	mov	al,3	// blue
   ;	asm	out	dx,al
   ;	asm	mov	al,0x20	// normal
   ;	asm	out	dx,al
   ;	#endif
   ;	
   ;	
	mov	ax,di
	jmp	short @23@362
@23@362:
   ;	
   ;		return(result);
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PM_GetPage	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PM_SetPageLock	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	PM_SetPageLock(int pagenum,PMLockType lock)
   ;	{
   ;	
	mov	ax,word ptr [bp+4]
	cmp	ax,word ptr DGROUP:_PMSoundStart
	jae	short @24@74
   ;	
   ;		if (pagenum < PMSoundStart)
   ;	
	mov	ax,offset DGROUP:s@+938
	push	ax
	call	near ptr _Quit
	pop	cx
@24@74:
   ;	
   ;			Quit("PM_SetPageLock: Locking/unlocking non-sound page");
   ;	
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,18
	imul	dx
	les	bx,dword ptr DGROUP:_PMPages
	add	bx,ax
	mov	ax,word ptr [bp+6]
	mov	word ptr es:[bx+8],ax
   ;	
   ;		PMPages[pagenum].locked = lock;
   ;	
	pop	bp
	ret	
_PM_SetPageLock	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PM_Preload	proc	near
	push	bp
	mov	bp,sp
	sub	sp,20
	push	si
	push	di
   ;	
   ;	PM_Preload(boolean (*update)(word current,word total))
   ;	{
   ;		int				i,j,
   ;						page,oogypage;
   ;		word			current,total,
   ;						totalnonxms,totalxms,
   ;						mainfree,maintotal,
   ;						emsfree,emstotal,
   ;						xmsfree,xmstotal;
   ;		memptr			addr;
   ;		PageListStruct	far *p;
   ;	
   ;	
	mov	ax,word ptr DGROUP:_MainPagesAvail
	sub	ax,word ptr DGROUP:_MainPagesUsed
	mov	dx,word ptr DGROUP:_EMSPagesAvail
	sub	dx,word ptr DGROUP:_EMSPagesUsed
	add	ax,dx
	mov	word ptr [bp-10],ax
   ;	
   ;		mainfree = (MainPagesAvail - MainPagesUsed) + (EMSPagesAvail - EMSPagesUsed);
   ;	
	mov	ax,word ptr DGROUP:_XMSPagesAvail
	sub	ax,word ptr DGROUP:_XMSPagesUsed
	mov	word ptr [bp-14],ax
   ;	
   ;		xmsfree = (XMSPagesAvail - XMSPagesUsed);
   ;	
   ;	
	xor	ax,ax
	mov	word ptr [bp-12],ax
	mov	di,ax
   ;	
   ;		xmstotal = maintotal = 0;
   ;	
   ;	
	mov	word ptr [bp-2],0
	jmp	short @25@314
@25@50:
   ;	
   ;		for (i = 0;i < ChunksInFile;i++)
   ;		{
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,18
	imul	dx
	les	bx,dword ptr DGROUP:_PMPages
	add	bx,ax
	mov	ax,word ptr es:[bx]
	or	ax,word ptr es:[bx+2]
	jne	short @25@98
   ;	
   ;			if (!PMPages[i].offset)
   ;	
	jmp	short @25@290
@25@98:
   ;	
   ;				continue;			// sparse
   ;	
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,18
	imul	dx
	les	bx,dword ptr DGROUP:_PMPages
	add	bx,ax
	cmp	word ptr es:[bx+10],65535
	jne	short @25@146
	mov	ax,word ptr [bp-2]
	mov	dx,18
	imul	dx
	les	bx,dword ptr DGROUP:_PMPages
	add	bx,ax
	cmp	word ptr es:[bx+12],65535
	je	short @25@170
@25@146:
   ;	
   ;			if ( PMPages[i].emsPage != -1 || PMPages[i].mainPage != -1 )
   ;	
	jmp	short @25@290
@25@170:
   ;	
   ;				continue;			// already in main mem
   ;	
   ;	
	cmp	word ptr [bp-10],0
	je	short @25@218
   ;	
   ;			if ( mainfree )
   ;			{
   ;	
	inc	word ptr [bp-12]
   ;	
   ;				maintotal++;
   ;	
	dec	word ptr [bp-10]
   ;	
   ;				mainfree--;
   ;	
	jmp	short @25@290
@25@218:
   ;	
   ;			}
   ;	
	cmp	word ptr [bp-14],0
	je	short @25@290
	mov	ax,word ptr [bp-2]
	mov	dx,18
	imul	dx
	les	bx,dword ptr DGROUP:_PMPages
	add	bx,ax
	cmp	word ptr es:[bx+6],65535
	jne	short @25@290
   ;	
   ;			else if ( xmsfree && (PMPages[i].xmsPage == -1) )
   ;			{
   ;	
	inc	di
   ;	
   ;				xmstotal++;
   ;	
	dec	word ptr [bp-14]
@25@290:
	inc	word ptr [bp-2]
@25@314:
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr DGROUP:_ChunksInFile
	jae	@@0
	jmp	@25@50
@@0:
   ;	
   ;				xmsfree--;
   ;			}
   ;		}
   ;	
   ;	
   ;	
	mov	ax,word ptr [bp-12]
	add	ax,di
	mov	word ptr [bp-8],ax
   ;	
   ;		total = maintotal + xmstotal;
   ;	
   ;	
	cmp	word ptr [bp-8],0
	jne	short @25@386
   ;	
   ;		if (!total)
   ;	
	jmp	@25@1130
@25@386:
   ;	
   ;			return;
   ;	
   ;	
	xor	si,si
   ;	
   ;		page = 0;
   ;	
	mov	word ptr [bp-6],0
	jmp	short @25@602
@25@410:
	jmp	short @25@458
@25@434:
   ;	
   ;		current = 0;
   ;	
   ;	//
   ;	// cache main/ems blocks
   ;	//
   ;		while (maintotal)
   ;		{
   ;			while ( !PMPages[page].offset || PMPages[page].mainPage != -1
   ;				||	PMPages[page].emsPage != -1 )
   ;	
	inc	si
@25@458:
	mov	ax,si
	mov	dx,18
	imul	dx
	les	bx,dword ptr DGROUP:_PMPages
	add	bx,ax
	mov	ax,word ptr es:[bx]
	or	ax,word ptr es:[bx+2]
	je	short @25@434
	mov	ax,si
	mov	dx,18
	imul	dx
	les	bx,dword ptr DGROUP:_PMPages
	add	bx,ax
	cmp	word ptr es:[bx+12],65535
	jne	short @25@434
	mov	ax,si
	mov	dx,18
	imul	dx
	les	bx,dword ptr DGROUP:_PMPages
	add	bx,ax
	cmp	word ptr es:[bx+10],65535
	jne	short @25@434
   ;	
   ;				page++;
   ;	
   ;	
	cmp	si,word ptr DGROUP:_ChunksInFile
	jb	short @25@578
   ;	
   ;			if (page >= ChunksInFile)
   ;	
	mov	ax,offset DGROUP:s@+987
	push	ax
	call	near ptr _Quit
	pop	cx
@25@578:
   ;	
   ;				Quit ("PM_Preload: Pages>=ChunksInFile");
   ;	
   ;	
	push	si
	call	near ptr _PM_GetPage
	pop	cx
   ;	
   ;			PM_GetPage(page);
   ;	
   ;	
	inc	si
   ;	
   ;			page++;
   ;	
	inc	word ptr [bp-6]
   ;	
   ;			current++;
   ;	
	dec	word ptr [bp-12]
   ;	
   ;			maintotal--;
   ;	
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	call	word ptr [bp+4]
	pop	cx
	pop	cx
@25@602:
	cmp	word ptr [bp-12],0
	jne	short @25@410
   ;	
   ;			update(current,total);
   ;		}
   ;	
   ;	//
   ;	// load stuff to XMS
   ;	//
   ;	
	or	di,di
	jne	@@1
	jmp	@25@1106
@@1:
   ;	
   ;		if (xmstotal)
   ;		{
   ;	
	mov	word ptr [bp-4],0
	jmp	short @25@698
@25@674:
	inc	word ptr [bp-4]
@25@698:
	mov	ax,word ptr [bp-4]
	mov	dx,18
	imul	dx
	les	bx,dword ptr DGROUP:_PMPages
	add	bx,ax
	cmp	word ptr es:[bx+12],65535
	je	short @25@674
   ;	
   ;			for (oogypage = 0 ; PMPages[oogypage].mainPage == -1 ; oogypage++)
   ;			;
   ;	
	push	word ptr [bp-4]
	call	near ptr _PM_GetPage
	pop	cx
	mov	word ptr [bp-16],ax
   ;	
   ;			addr = PM_GetPage(oogypage);
   ;	
	cmp	word ptr [bp-16],0
	jne	short @25@770
   ;	
   ;			if (!addr)
   ;	
	mov	ax,offset DGROUP:s@+1019
	push	ax
	call	near ptr _Quit
	pop	cx
@25@770:
	jmp	@25@1058
@25@794:
	jmp	short @25@842
@25@818:
   ;	
   ;				Quit("PM_Preload: XMS buffer failed");
   ;	
   ;			while (xmstotal)
   ;			{
   ;				while ( !PMPages[page].offset || PMPages[page].xmsPage != -1 )
   ;	
	inc	si
@25@842:
	mov	ax,si
	mov	dx,18
	imul	dx
	les	bx,dword ptr DGROUP:_PMPages
	add	bx,ax
	mov	ax,word ptr es:[bx]
	or	ax,word ptr es:[bx+2]
	je	short @25@818
	mov	ax,si
	mov	dx,18
	imul	dx
	les	bx,dword ptr DGROUP:_PMPages
	add	bx,ax
	cmp	word ptr es:[bx+6],65535
	jne	short @25@818
   ;	
   ;					page++;
   ;	
   ;	
	cmp	si,word ptr DGROUP:_ChunksInFile
	jb	short @25@938
   ;	
   ;				if (page >= ChunksInFile)
   ;	
	mov	ax,offset DGROUP:s@+1049
	push	ax
	call	near ptr _Quit
	pop	cx
@25@938:
   ;	
   ;					Quit ("PM_Preload: Pages>=ChunksInFile");
   ;	
   ;	
	mov	ax,si
	mov	dx,18
	imul	dx
	mov	dx,word ptr DGROUP:_PMPages+2
	mov	bx,word ptr DGROUP:_PMPages
	add	bx,ax
	mov	word ptr [bp-20],bx
	mov	word ptr [bp-18],dx
   ;	
   ;				p = &PMPages[page];
   ;	
   ;	
	les	bx,dword ptr [bp-20]
	mov	ax,word ptr DGROUP:_XMSPagesUsed
	mov	word ptr es:[bx+6],ax
	inc	word ptr DGROUP:_XMSPagesUsed
   ;	
   ;				p->xmsPage = XMSPagesUsed++;
   ;	
	mov	ax,word ptr DGROUP:_XMSPagesUsed
	cmp	ax,word ptr DGROUP:_XMSPagesAvail
	jbe	short @25@986
   ;	
   ;				if (XMSPagesUsed > XMSPagesAvail)
   ;	
	mov	ax,offset DGROUP:s@+1081
	push	ax
	call	near ptr _Quit
	pop	cx
@25@986:
   ;	
   ;					Quit("PM_Preload: Exceeded XMS pages");
   ;	
	les	bx,dword ptr [bp-20]
	cmp	word ptr es:[bx+4],4096
	jbe	short @25@1034
   ;	
   ;				if (p->length > PMPageSize)
   ;	
	mov	ax,offset DGROUP:s@+1112
	push	ax
	call	near ptr _Quit
	pop	cx
@25@1034:
   ;	
   ;					Quit("PM_Preload: Page too long");
   ;	
   ;	
	les	bx,dword ptr [bp-20]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp-20]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	push	word ptr [bp-16]
	xor	ax,ax
	push	ax
	call	near ptr _PML_ReadFromFile
	add	sp,10
   ;	
   ;				PML_ReadFromFile((byte far *)addr,p->offset,p->length);
   ;	
	les	bx,dword ptr [bp-20]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp-20]
	push	word ptr es:[bx+6]
	push	word ptr [bp-16]
	xor	ax,ax
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _PML_XMSCopy
	add	sp,10
   ;	
   ;				PML_CopyToXMS((byte far *)addr,p->xmsPage,p->length);
   ;	
   ;	
	inc	si
   ;	
   ;				page++;
   ;	
	inc	word ptr [bp-6]
   ;	
   ;				current++;
   ;	
	dec	di
   ;	
   ;				xmstotal--;
   ;	
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	call	word ptr [bp+4]
	pop	cx
	pop	cx
@25@1058:
	or	di,di
	je	@@2
	jmp	@25@794
@@2:
   ;	
   ;				update(current,total);
   ;			}
   ;	
   ;	
	mov	ax,word ptr [bp-4]
	mov	dx,18
	imul	dx
	mov	dx,word ptr DGROUP:_PMPages+2
	mov	bx,word ptr DGROUP:_PMPages
	add	bx,ax
	mov	word ptr [bp-20],bx
	mov	word ptr [bp-18],dx
   ;	
   ;			p = &PMPages[oogypage];
   ;	
	les	bx,dword ptr [bp-20]
	push	word ptr es:[bx+4]
	les	bx,dword ptr [bp-20]
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	push	word ptr [bp-16]
	xor	ax,ax
	push	ax
	call	near ptr _PML_ReadFromFile
	add	sp,10
@25@1106:
   ;	
   ;			PML_ReadFromFile((byte far *)addr,p->offset,p->length);
   ;		}
   ;	
   ;	
	push	word ptr [bp-8]
	push	word ptr [bp-8]
	call	word ptr [bp+4]
	pop	cx
	pop	cx
@25@1130:
   ;	
   ;		update(total,total);
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PM_Preload	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PM_NextFrame	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	PM_NextFrame(void)
   ;	{
   ;		int	i;
   ;	
   ;		// Frame count overrun - kill the LRU hit entries & reset frame count
   ;	
	add	word ptr DGROUP:_PMFrameCount,1
	mov	ax,word ptr DGROUP:_PMFrameCount
	adc	word ptr DGROUP:_PMFrameCount+2,0
	mov	dx,word ptr DGROUP:_PMFrameCount+2
	cmp	dx,32767
	jl	short @26@218
	jne	short @26@98
	cmp	ax,65531
	jb	short @26@218
@26@98:
   ;	
   ;		if (++PMFrameCount >= MAXLONG - 4)
   ;		{
   ;	
	xor	si,si
	jmp	short @26@170
@26@122:
   ;	
   ;			for (i = 0;i < PMNumBlocks;i++)
   ;	
	mov	ax,si
	mov	dx,18
	imul	dx
	les	bx,dword ptr DGROUP:_PMPages
	add	bx,ax
	mov	word ptr es:[bx+14],0
	mov	word ptr es:[bx+16],0
	inc	si
@26@170:
	cmp	si,word ptr DGROUP:_PMNumBlocks
	jb	short @26@122
   ;	
   ;				PMPages[i].lastHit = 0;
   ;	
	mov	word ptr DGROUP:_PMFrameCount,0
	mov	word ptr DGROUP:_PMFrameCount+2,0
@26@218:
   ;	
   ;			PMFrameCount = 0;
   ;		}
   ;	
   ;	#if 0
   ;		for (i = 0;i < PMSoundStart;i++)
   ;		{
   ;			if (PMPages[i].locked)
   ;			{
   ;				char buf[40];
   ;				sprintf(buf,"PM_NextFrame: Page %d is locked",i);
   ;				Quit(buf);
   ;			}
   ;		}
   ;	#endif
   ;	
   ;	
	cmp	word ptr DGROUP:_PMPanicMode,0
	je	short @26@290
   ;	
   ;		if (PMPanicMode)
   ;		{
   ;			// DEBUG - set border color
   ;	
	cmp	word ptr DGROUP:_PMThrashing,0
	jne	short @26@290
	dec	word ptr DGROUP:_PMPanicMode
	jne	short @26@290
@26@290:
   ;	
   ;			if ((!PMThrashing) && (!--PMPanicMode))
   ;			{
   ;				// DEBUG - reset border color
   ;			}
   ;		}
   ;	
	cmp	word ptr DGROUP:_PMThrashing,1
	jl	short @26@338
   ;	
   ;		if (PMThrashing >= PMThrashThreshold)
   ;	
	mov	word ptr DGROUP:_PMPanicMode,5
@26@338:
   ;	
   ;			PMPanicMode = PMUnThrashThreshold;
   ;	
	mov	word ptr DGROUP:_PMThrashing,0
   ;	
   ;		PMThrashing = false;
   ;	
	pop	si
	pop	bp
	ret	
_PM_NextFrame	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PM_Reset	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
   ;	
   ;	PM_Reset(void)
   ;	{
   ;		int				i;
   ;		PageListStruct	far *page;
   ;	
   ;	
	mov	ax,word ptr DGROUP:_XMSAvail
	shr	ax,1
	shr	ax,1
	mov	word ptr DGROUP:_XMSPagesAvail,ax
   ;	
   ;		XMSPagesAvail = XMSAvail / PMPageSizeKB;
   ;	
   ;	
	mov	ax,word ptr DGROUP:_EMSAvail
	shl	ax,1
	shl	ax,1
	mov	word ptr DGROUP:_EMSPagesAvail,ax
   ;	
   ;		EMSPagesAvail = EMSAvail * (EMSPageSizeKB / PMPageSizeKB);
   ;	
	mov	word ptr DGROUP:_EMSPhysicalPage,0
   ;	
   ;		EMSPhysicalPage = 0;
   ;	
   ;	
	xor	ax,ax
	mov	word ptr DGROUP:_XMSPagesUsed,ax
	mov	word ptr DGROUP:_EMSPagesUsed,ax
	mov	word ptr DGROUP:_MainPagesUsed,ax
   ;	
   ;		MainPagesUsed = EMSPagesUsed = XMSPagesUsed = 0;
   ;	
   ;	
	mov	word ptr DGROUP:_PMPanicMode,0
   ;	
   ;		PMPanicMode = false;
   ;	
   ;		// Initialize page list
   ;	
	xor	si,si
	mov	ax,word ptr DGROUP:_PMPages+2
	mov	dx,word ptr DGROUP:_PMPages
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
	jmp	short @27@98
@27@50:
   ;	
   ;		for (i = 0,page = PMPages;i < PMNumBlocks;i++,page++)
   ;		{
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+12],65535
   ;	
   ;			page->mainPage = -1;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+10],65535
   ;	
   ;			page->emsPage = -1;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+6],65535
   ;	
   ;			page->xmsPage = -1;
   ;	
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx+8],0
	inc	si
	add	word ptr [bp-4],18
@27@98:
	cmp	si,word ptr DGROUP:_PMNumBlocks
	jb	short @27@50
   ;	
   ;			page->locked = false;
   ;		}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PM_Reset	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PM_Startup	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
   ;	
   ;	PM_Startup(void)
   ;	{
   ;		boolean	nomain,noems,noxms;
   ;		int		i;
   ;	
   ;	
	cmp	word ptr DGROUP:_PMStarted,0
	je	short @28@74
   ;	
   ;		if (PMStarted)
   ;	
	jmp	@28@554
@28@74:
   ;	
   ;			return;
   ;	
   ;	
	xor	ax,ax
	mov	di,ax
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],ax
   ;	
   ;		nomain = noems = noxms = false;
   ;	
	mov	si,1
	jmp	short @28@314
@28@98:
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
	je	short @28@218
	cmp	ax,1
	je	short @28@242
	cmp	ax,2
	je	short @28@266
	jmp	short @28@290
@28@218:
   ;	
   ;			switch (US_CheckParm(_argv[i],ParmStrings))
   ;			{
   ;			case 0:
   ;	
	mov	word ptr [bp-2],1
   ;	
   ;				nomain = true;
   ;	
	jmp	short @28@290
@28@242:
   ;	
   ;				break;
   ;			case 1:
   ;	
	mov	word ptr [bp-4],1
   ;	
   ;				noems = true;
   ;	
	jmp	short @28@290
@28@266:
   ;	
   ;				break;
   ;			case 2:
   ;	
	mov	di,1
   ;	
   ;				noxms = true;
   ;	
	jmp	short @28@290
@28@290:
	inc	si
@28@314:
	cmp	si,word ptr DGROUP:__argc
	jl	short @28@98
   ;	
   ;				break;
   ;			}
   ;		}
   ;	
   ;	
	call	near ptr _PML_OpenPageFile
   ;	
   ;		PML_OpenPageFile();
   ;	
   ;	
	cmp	word ptr [bp-4],0
	jne	short @28@386
   ;	
   ;		if (!noems)
   ;	
	call	near ptr _PML_StartupEMS
@28@386:
   ;	
   ;			PML_StartupEMS();
   ;	
	or	di,di
	jne	short @28@434
   ;	
   ;		if (!noxms)
   ;	
	call	near ptr _PML_StartupXMS
@28@434:
   ;	
   ;			PML_StartupXMS();
   ;	
   ;	
	cmp	word ptr [bp-2],0
	je	short @28@506
	cmp	word ptr DGROUP:_EMSPresent,0
	jne	short @28@506
   ;	
   ;		if (nomain && !EMSPresent)
   ;	
	mov	ax,offset DGROUP:s@+1138
	push	ax
	call	near ptr _Quit
	pop	cx
	jmp	short @28@530
@28@506:
   ;	
   ;			Quit("PM_Startup: No main or EMS");
   ;		else
   ;	
	call	near ptr _PML_StartupMainMem
@28@530:
   ;	
   ;			PML_StartupMainMem();
   ;	
   ;	
	call	near ptr _PM_Reset
   ;	
   ;		PM_Reset();
   ;	
   ;	
	mov	word ptr DGROUP:_PMStarted,1
@28@554:
   ;	
   ;		PMStarted = true;
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PM_Startup	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_PM_Shutdown	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	PM_Shutdown(void)
   ;	{
   ;	
	call	near ptr _PML_ShutdownXMS
   ;	
   ;		PML_ShutdownXMS();
   ;	
	call	near ptr _PML_ShutdownEMS
   ;	
   ;		PML_ShutdownEMS();
   ;	
   ;	
	cmp	word ptr DGROUP:_PMStarted,0
	jne	short @29@74
   ;	
   ;		if (!PMStarted)
   ;	
	jmp	short @29@98
@29@74:
   ;	
   ;			return;
   ;	
   ;	
	call	near ptr _PML_ClosePageFile
   ;	
   ;		PML_ClosePageFile();
   ;	
   ;	
	call	near ptr _PML_ShutdownMainMem
@29@98:
   ;	
   ;		PML_ShutdownMainMem();
   ;	
	pop	bp
	ret	
_PM_Shutdown	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_MainPagesAvail	label	word
	db	2 dup (?)
_PMSpriteStart	label	word
	db	2 dup (?)
_EMSPhysicalPage	label	word
	db	2 dup (?)
_PMPages	label	dword
	db	4 dup (?)
_EMSAvail	label	word
	db	2 dup (?)
_EMSList	label	word
	db	24 dup (?)
_XMSAvail	label	word
	db	2 dup (?)
_ChunksInFile	label	word
	db	2 dup (?)
_PMStarted	label	word
	db	2 dup (?)
_XMSDriver	label	word
	db	4 dup (?)
_EMSHandle	label	word
	db	2 dup (?)
_XMSHandle	label	word
	db	2 dup (?)
_PMSegPages	label	word
	db	2 dup (?)
_PMPanicMode	label	word
	db	2 dup (?)
_EMSPresent	label	word
	db	2 dup (?)
_MainMemUsed	label	word
	db	200 dup (?)
_XMSPresent	label	word
	db	2 dup (?)
_PMNumBlocks	label	word
	db	2 dup (?)
_EMSPagesUsed	label	word
	db	2 dup (?)
_MainMemPages	label	word
	db	200 dup (?)
_MainPresent	label	word
	db	2 dup (?)
_PMThrashing	label	word
	db	2 dup (?)
_XMSPagesUsed	label	word
	db	2 dup (?)
_EMSPageFrame	label	word
	db	2 dup (?)
_MainPagesUsed	label	word
	db	2 dup (?)
_PMFrameCount	label	word
	db	4 dup (?)
_EMSPagesAvail	label	word
	db	2 dup (?)
_XMSPagesAvail	label	word
	db	2 dup (?)
_PMSoundStart	label	word
	db	2 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'nomain'
	db	0
	db	'noems'
	db	0
	db	'noxms'
	db	0
	db	'PML_MapEMS: Page mapping failed'
	db	0
	db	'PML_ShutdownEMS: Error freeing EMS'
	db	0
	db	'PML_XMSCopy: zero address'
	db	0
	db	'PML_XMSCopy: Error on copy'
	db	0
	db	'PML_ShutdownXMS: Error freeing XMS'
	db	0
	db	'PM_SetupMainMem: Not enough main memory'
	db	0
	db	'PML_ReadFromFile: Null pointer'
	db	0
	db	'PML_ReadFromFile: Zero offset'
	db	0
	db	'PML_ReadFromFile: Seek failed'
	db	0
	db	'PML_ReadFromFile: Read failed'
	db	0
	db	'PML_OpenPageFile: Unable to open page file'
	db	0
	db	'PML_OpenPageFile: Offset read failed'
	db	0
	db	'PML_OpenPageFile: Length read failed'
	db	0
	db	'PML_GetEMSAddress: EMS find failed'
	db	0
	db	'PML_GiveLRUPage: LRU Search failed'
	db	0
	db	'PML_PutPageInXMS: No XMS LRU'
	db	0
	db	'PML_TransferPageSpace: Identity replacement'
	db	0
	db	'PML_TransferPageSpace: Killing locked page'
	db	0
	db	'PML_TransferPageSpace: Reusing non-existent page'
	db	0
	db	'PML_TransferPageSpace: Zero replacement'
	db	0
	db	'PML_GetPageBuffer: MainPagesAvail lied'
	db	0
	db	'PML_GetPageBuffer: Purged main block'
	db	0
	db	'PML_GetPageBuffer: Search failed'
	db	0
	db	'PML_GetPageFromXMS: Non segment pointer'
	db	0
	db	'PM_GetPage: Invalid page request'
	db	0
	db	'Tried to load a sparse page!'
	db	0
	db	'PM_SetPageLock: Locking/unlocking non-sound page'
	db	0
	db	'PM_Preload: Pages>=ChunksInFile'
	db	0
	db	'PM_Preload: XMS buffer failed'
	db	0
	db	'PM_Preload: Pages>=ChunksInFile'
	db	0
	db	'PM_Preload: Exceeded XMS pages'
	db	0
	db	'PM_Preload: Page too long'
	db	0
	db	'PM_Startup: No main or EMS'
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	public	_EMMDriverName
	public	_PM_SetPageLock
	public	_PMSoundStart
	public	_XMSPagesAvail
	extrn	_lseek:near
	public	_EMSPagesAvail
	public	_PM_Shutdown
	public	_PMFrameCount
	public	_PML_PutPageInXMS
	public	_PM_NextFrame
	public	_PageFileName
	public	_MainPagesUsed
	public	_EMSPageFrame
	public	_PML_XMSCopy
	public	_PML_LoadPage
	extrn	__fmemset:near
	public	_XMSPagesUsed
	public	_PMThrashing
	public	_MainPresent
	public	_PML_ShutdownXMS
	public	_PML_ShutdownEMS
	public	_PM_Startup
	public	_MainMemPages
	public	_EMSPagesUsed
	extrn	_MM_FreePtr:near
	public	_PMNumBlocks
_ParmStrings	equ	ParmStrings
	public	_XMSPresent
	extrn	_MM_SetPurge:near
	public	_PML_StartupXMS
	public	_PML_StartupEMS
	public	_MainMemUsed
	public	_EMSPresent
	public	_PMPanicMode
	extrn	_MM_GetPtr:near
	public	_PM_GetPage
	public	_PMSegPages
	public	_XMSHandle
	public	_EMSHandle
	extrn	_MM_SetLock:near
	public	_PM_Preload
	extrn	_CA_FarRead:near
	public	_XMSDriver
	public	_PMStarted
	public	_PageFile
	extrn	_mmerror:word
	public	_ChunksInFile
	public	_XMSAvail
	public	_EMSList
	public	_EMSAvail
	public	_PM_Reset
	public	_PML_MapEMS
	public	_PMPages
	extrn	_mminfo:word
	extrn	_US_CheckParm:near
	extrn	__argv:word
	extrn	__argc:word
	public	_PML_TransferPageSpace
	extrn	_Quit:near
	extrn	_read:near
	extrn	_close:near
	public	_PML_ShutdownMainMem
	public	_PML_GetEMSAddress
	public	_PM_GetPageAddress
	public	_PML_GiveLRUXMSPage
	public	_PM_SetMainMemPurge
	public	_PML_GetAPageBuffer
	public	_PML_StartupMainMem
	public	_PML_ClosePageFile
	extrn	N_LDIV@:far
	public	_PML_OpenPageFile
	public	_PML_ReadFromFile
	extrn	_open:near
	extrn	N_LXLSH@:far
	public	_PML_GiveLRUPage
	extrn	_MM_BombOnError:near
	public	_EMSPhysicalPage
	public	_PML_GetPageFromXMS
	public	_PM_CheckMainMem
	public	_PMSpriteStart
	public	_MainPagesAvail
	public	_XMSProtectPage
	end
