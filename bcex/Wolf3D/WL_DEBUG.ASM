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
	?debug	S "c:\wl_debug.c"
	?debug	C E9E551FE7C0D633A5C776C5F64656275672E63
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
	?debug	C E95337528111443A5C494E434C5544455C42494F532E48
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
   ;	void DebugMemory (void)
   ;	
	assume	cs:_TEXT
_DebugMemory	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		int	i;
   ;		char    scratch[80],str[10];
   ;		long	mem;
   ;		spritetype _seg	*block;
   ;	
   ;		CenterWindow (16,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,16
	push	ax
	call	near ptr _CenterWindow
	pop	cx
	pop	cx
   ;	
   ;	
   ;		US_CPrint ("Memory Usage");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _US_CPrint
	pop	cx
	pop	cx
   ;	
   ;		US_CPrint ("------------");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+13
	push	ax
	call	near ptr _US_CPrint
	pop	cx
	pop	cx
   ;	
   ;		US_Print ("Total     :");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+26
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		US_PrintUnsigned (mminfo.mainmem/1024);
   ;	
	xor	ax,ax
	mov	dx,1024
	push	ax
	push	dx
	push	word ptr DGROUP:_mminfo+18
	push	word ptr DGROUP:_mminfo+16
	call	near ptr N_LDIV@
	push	dx
	push	ax
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;		US_Print ("k\nFree      :");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+38
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		US_PrintUnsigned (MM_UnusedMemory()/1024);
   ;	
	xor	ax,ax
	mov	dx,1024
	push	ax
	push	dx
	call	near ptr _MM_UnusedMemory
	push	dx
	push	ax
	call	near ptr N_LDIV@
	push	dx
	push	ax
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;		US_Print ("k\nWith purge:");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+52
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		US_PrintUnsigned (MM_TotalFree()/1024);
   ;	
	xor	ax,ax
	mov	dx,1024
	push	ax
	push	dx
	call	near ptr _MM_TotalFree
	push	dx
	push	ax
	call	near ptr N_LDIV@
	push	dx
	push	ax
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;		US_Print ("k\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+66
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		IN_Ack ();
   ;	
	call	near ptr _IN_Ack
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_DebugMemory	endp
   ;	
   ;	void CountObjects (void)
   ;	
	assume	cs:_TEXT
_CountObjects	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	push	si
	push	di
   ;	
   ;	{
   ;		int	i,total,count,active,inactive,doors;
   ;		objtype	*obj;
   ;	
   ;		CenterWindow (16,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,16
	push	ax
	call	near ptr _CenterWindow
	pop	cx
	pop	cx
   ;	
   ;		active = inactive = count = doors = 0;
   ;	
	xor	ax,ax
	mov	word ptr [bp-10],ax
	mov	word ptr [bp-6],ax
	mov	word ptr [bp-8],ax
	mov	di,ax
   ;	
   ;	
   ;		US_Print ("Total statics :");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+69
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		total = laststatobj-&statobjlist[0];
   ;	
	mov	ax,word ptr DGROUP:_laststatobj
	sub	ax,offset DGROUP:_statobjlist
	mov	bx,8
	cwd	
	idiv	bx
	mov	word ptr [bp-4],ax
   ;	
   ;		US_PrintUnsigned (total);
   ;	
	mov	ax,word ptr [bp-4]
	cwd	
	push	dx
	push	ax
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;	
   ;		US_Print ("\nIn use statics:");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+85
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		for (i=0;i<total;i++)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @2@146
@2@50:
   ;	
   ;			if (statobjlist[i].shapenum != -1)
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	shl	bx,1
	shl	bx,1
	cmp	word ptr DGROUP:_statobjlist[bx+4],65535
	je	short @2@98
   ;	
   ;				count++;
   ;	
	inc	word ptr [bp-6]
	jmp	short @2@122
@2@98:
   ;	
   ;			else
   ;				doors++;	//debug
   ;	
	inc	word ptr [bp-10]
@2@122:
	inc	word ptr [bp-2]
@2@146:
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp-4]
	jl	short @2@50
   ;	
   ;		US_PrintUnsigned (count);
   ;	
	mov	ax,word ptr [bp-6]
	cwd	
	push	dx
	push	ax
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;	
   ;		US_Print ("\nDoors         :");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+102
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		US_PrintUnsigned (doornum);
   ;	
	mov	ax,word ptr DGROUP:_doornum
	cwd	
	push	dx
	push	ax
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;	
   ;		for (obj=player->next;obj;obj=obj->next)
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	si,word ptr [bx+54]
	jmp	short @2@290
@2@194:
   ;	
   ;		{
   ;			if (obj->active)
   ;	
	cmp	word ptr [si],0
	je	short @2@242
   ;	
   ;				active++;
   ;	
	inc	di
	jmp	short @2@266
@2@242:
   ;	
   ;			else
   ;				inactive++;
   ;	
	inc	word ptr [bp-8]
@2@266:
	mov	si,word ptr [si+54]
@2@290:
	or	si,si
	jne	short @2@194
   ;	
   ;		}
   ;	
   ;		US_Print ("\nTotal actors  :");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+119
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		US_PrintUnsigned (active+inactive);
   ;	
	mov	ax,di
	add	ax,word ptr [bp-8]
	cwd	
	push	dx
	push	ax
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;	
   ;		US_Print ("\nActive actors :");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+136
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		US_PrintUnsigned (active);
   ;	
	mov	ax,di
	cwd	
	push	dx
	push	ax
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		IN_Ack ();
   ;	
	call	near ptr _IN_Ack
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CountObjects	endp
   ;	
   ;	void PicturePause (void)
   ;	
	assume	cs:_TEXT
_PicturePause	proc	near
	push	bp
	mov	bp,sp
	sub	sp,12
	push	si
   ;	
   ;	{
   ;		int			i;
   ;		byte		p;
   ;		unsigned	x;
   ;		byte		far	*dest,far *src;
   ;		memptr		buffer;
   ;	
   ;		VW_ColorBorder (15);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _VL_ColorBorder
	pop	cx
   ;	
   ;		FinishPaletteShifts ();
   ;	
	call	near ptr _FinishPaletteShifts
   ;	
   ;	
   ;		LastScan = 0;
   ;	
	mov	byte ptr DGROUP:_LastScan,0
	jmp	short @3@50
@3@50:
   ;	
   ;		while (!LastScan)
   ;	
	mov	al,byte ptr DGROUP:_LastScan
	mov	ah,0
	or	ax,ax
	je	short @3@50
   ;	
   ;		;
   ;		if (LastScan != sc_Enter)
   ;	
	cmp	byte ptr DGROUP:_LastScan,28
	je	short @3@122
   ;	
   ;		{
   ;			VW_ColorBorder (0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _VL_ColorBorder
	pop	cx
   ;	
   ;			return;
   ;	
	jmp	@3@530
@3@122:
   ;	
   ;		}
   ;	
   ;		VW_ColorBorder (1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _VL_ColorBorder
	pop	cx
   ;	
   ;		VW_SetScreen (0,0);
   ;	
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_SetScreen
	pop	cx
	pop	cx
   ;	
   ;	//
   ;	// vga stuff...
   ;	//
   ;	
   ;		ClearMemory ();
   ;	
	call	near ptr _ClearMemory
   ;	
   ;		CA_SetAllPurge();
   ;	
	call	near ptr _CA_SetAllPurge
   ;	
   ;		MM_GetPtr (&buffer,64000);
   ;	
	xor	ax,ax
	mov	dx,64000
	push	ax
	push	dx
	lea	ax,word ptr [bp-12]
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;		for (p=0;p<4;p++)
   ;	
	mov	byte ptr [bp-1],0
	jmp	short @3@434
@3@146:
   ;	
   ;		{
   ;		   src = MK_FP(0xa000,displayofs);
   ;	
	mov	ax,word ptr DGROUP:_displayofs
	mov	word ptr [bp-10],ax
	mov	word ptr [bp-8],40960
   ;	
   ;		   dest = (byte far *)buffer+p;
   ;	
	mov	ax,word ptr [bp-12]
	xor	dx,dx
	mov	bl,byte ptr [bp-1]
	mov	bh,0
	add	dx,bx
	mov	word ptr [bp-6],dx
	mov	word ptr [bp-4],ax
   ;	
   ;		   VGAREADMAP(p);
   ;	
	cli	
	mov	 dx,03CEH
	mov	 al,4
	mov	 ah,[bp-1]
	out	 dx,ax
	sti	
   ;	
   ;		   for (x=0;x<16000;x++,dest+=4)
   ;	
	xor	si,si
	jmp	short @3@386
@3@338:
   ;	
   ;			   *dest = *src++;
   ;	
	les	bx,dword ptr [bp-10]
	mov	al,byte ptr es:[bx]
	les	bx,dword ptr [bp-6]
	mov	byte ptr es:[bx],al
	inc	word ptr [bp-10]
	inc	si
	add	word ptr [bp-6],4
@3@386:
	cmp	si,16000
	jb	short @3@338
	inc	byte ptr [bp-1]
@3@434:
	cmp	byte ptr [bp-1],4
	jb	short @3@146
   ;	
   ;		}
   ;	
   ;	
   ;	#if 0
   ;		for (p=0;p<4;p++)
   ;		{
   ;			src = MK_FP(0xa000,0);
   ;			dest = (byte far *)buffer+51200+p;
   ;			VGAREADMAP(p);
   ;			for (x=0;x<3200;x++,dest+=4)
   ;				*dest = *src++;
   ;		}
   ;	#endif
   ;	
   ;		asm	mov	ax,0x13
   ;	
		mov		ax,013H
   ;	
   ;		asm	int	0x10
   ;	
		int		010H
   ;	
   ;	
   ;		dest = MK_FP(0xa000,0);
   ;	
	mov	word ptr [bp-6],0
	mov	word ptr [bp-4],40960
   ;	
   ;		_fmemcpy (dest,buffer,64000);
   ;	
	xor	ax,ax
	mov	dx,64000
	push	ax
	push	dx
	push	word ptr [bp-12]
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	call	near ptr __fmemcpy
	add	sp,10
   ;	
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
   ;	
   ;	
   ;		IN_Shutdown ();
   ;	
	call	near ptr _IN_Shutdown
   ;	
   ;	
   ;		VW_WaitVBL(70);
   ;	
	mov	ax,70
	push	ax
	call	near ptr _VL_WaitVBL
	pop	cx
   ;	
   ;		bioskey(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _bioskey
	pop	cx
   ;	
   ;		VW_WaitVBL(70);
   ;	
	mov	ax,70
	push	ax
	call	near ptr _VL_WaitVBL
	pop	cx
   ;	
   ;		Quit (NULL);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _Quit
	pop	cx
@3@530:
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PicturePause	endp
_TEXT	ends
_BSS	segment word public 'BSS'
	db	10 dup (?)
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void ShapeTest (void)
   ;	
	assume	cs:_TEXT
_ShapeTest	proc	near
	push	bp
	mov	bp,sp
	sub	sp,28
	push	si
	push	di
   ;	
   ;	{
   ;	extern	word	NumDigi;
   ;	extern	word	_seg *DigiList;
   ;	static	char	buf[10];
   ;	
   ;		boolean			done;
   ;		ScanCode		scan;
   ;		int				i,j,k,x;
   ;		longword		l;
   ;		memptr			addr;
   ;		PageListStruct	far *page;
   ;	
   ;		CenterWindow(20,16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _CenterWindow
	pop	cx
	pop	cx
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		for (i = 0,done = false;!done;)
   ;	
	xor	di,di
	mov	word ptr [bp-2],0
	jmp	@4@1802
@4@50:
   ;	
   ;		{
   ;			US_ClearWindow();
   ;	
	call	near ptr _US_ClearWindow
   ;	
   ;	//		sound = -1;
   ;	
   ;			page = &PMPages[i];
   ;	
	mov	ax,di
	mov	dx,18
	imul	dx
	mov	dx,word ptr DGROUP:_PMPages+2
	mov	bx,word ptr DGROUP:_PMPages
	add	bx,ax
	mov	word ptr [bp-18],bx
	mov	word ptr [bp-16],dx
   ;	
   ;			US_Print(" Page #");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+153
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;			US_PrintUnsigned(i);
   ;	
	mov	ax,di
	cwd	
	push	dx
	push	ax
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;			if (i < PMSpriteStart)
   ;	
	cmp	di,word ptr DGROUP:_PMSpriteStart
	jae	short @4@98
   ;	
   ;				US_Print(" (Wall)");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+161
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
	jmp	short @4@218
@4@98:
   ;	
   ;			else if (i < PMSoundStart)
   ;	
	cmp	di,word ptr DGROUP:_PMSoundStart
	jae	short @4@146
   ;	
   ;				US_Print(" (Sprite)");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+169
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
	jmp	short @4@218
@4@146:
   ;	
   ;			else if (i == ChunksInFile - 1)
   ;	
	mov	ax,word ptr DGROUP:_ChunksInFile
	dec	ax
	cmp	ax,di
	jne	short @4@194
   ;	
   ;				US_Print(" (Sound Info)");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+179
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
	jmp	short @4@218
@4@194:
   ;	
   ;			else
   ;				US_Print(" (Sound)");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+193
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
@4@218:
   ;	
   ;	
   ;			US_Print("\n XMS: ");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+202
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;			if (page->xmsPage != -1)
   ;	
	les	bx,dword ptr [bp-18]
	cmp	word ptr es:[bx+6],65535
	je	short @4@266
   ;	
   ;				US_PrintUnsigned(page->xmsPage);
   ;	
	les	bx,dword ptr [bp-18]
	mov	ax,word ptr es:[bx+6]
	cwd	
	push	dx
	push	ax
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
	jmp	short @4@290
@4@266:
   ;	
   ;			else
   ;				US_Print("No");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+210
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
@4@290:
   ;	
   ;	
   ;			US_Print("\n Main: ");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+213
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;			if (page->mainPage != -1)
   ;	
	les	bx,dword ptr [bp-18]
	cmp	word ptr es:[bx+12],65535
	je	short @4@338
   ;	
   ;				US_PrintUnsigned(page->mainPage);
   ;	
	les	bx,dword ptr [bp-18]
	mov	ax,word ptr es:[bx+12]
	cwd	
	push	dx
	push	ax
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
	jmp	short @4@410
@4@338:
   ;	
   ;			else if (page->emsPage != -1)
   ;	
	les	bx,dword ptr [bp-18]
	cmp	word ptr es:[bx+10],65535
	je	short @4@386
   ;	
   ;			{
   ;				US_Print("EMS ");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+222
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;				US_PrintUnsigned(page->emsPage);
   ;	
	les	bx,dword ptr [bp-18]
	mov	ax,word ptr es:[bx+10]
	cwd	
	push	dx
	push	ax
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;			}
   ;	
	jmp	short @4@410
@4@386:
   ;	
   ;			else
   ;				US_Print("No");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+227
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
@4@410:
   ;	
   ;	
   ;			US_Print("\n Last hit: ");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+230
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;			US_PrintUnsigned(page->lastHit);
   ;	
	les	bx,dword ptr [bp-18]
	push	word ptr es:[bx+16]
	push	word ptr es:[bx+14]
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;	
   ;			US_Print("\n Address: ");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+243
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;			addr = PM_GetPageAddress(i);
   ;	
	push	di
	call	near ptr _PM_GetPageAddress
	pop	cx
	mov	word ptr [bp-14],ax
   ;	
   ;			sprintf(buf,"0x%04x",(word)addr);
   ;	
	push	word ptr [bp-14]
	mov	ax,offset DGROUP:s@+255
	push	ax
	mov	ax,offset DGROUP:b@+0
	push	ax
	call	near ptr _sprintf
	add	sp,6
   ;	
   ;			US_Print(buf);
   ;	
	push	ds
	mov	ax,offset DGROUP:b@+0
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;	
   ;			if (addr)
   ;	
	cmp	word ptr [bp-14],0
	jne	@@0
	jmp	@4@1106
@@0:
   ;	
   ;			{
   ;				if (i < PMSpriteStart)
   ;	
	cmp	di,word ptr DGROUP:_PMSpriteStart
	jae	short @4@578
   ;	
   ;				{
   ;				//
   ;				// draw the wall
   ;				//
   ;					bufferofs += 32*SCREENWIDTH;
   ;	
	add	word ptr DGROUP:_bufferofs,2560
   ;	
   ;					postx = 128;
   ;	
	mov	word ptr DGROUP:_postx,128
   ;	
   ;					postwidth = 1;
   ;	
	mov	word ptr DGROUP:_postwidth,1
   ;	
   ;					postsource = ((long)((unsigned)addr))<<16;
   ;	
	mov	ax,word ptr [bp-14]
	mov	word ptr DGROUP:_postsource,0
	mov	word ptr DGROUP:_postsource+2,ax
   ;	
   ;					for (x=0;x<64;x++,postx++,postsource+=64)
   ;	
	mov	word ptr [bp-8],0
	jmp	short @4@530
@4@482:
   ;	
   ;					{
   ;						wallheight[postx] = 256;
   ;	
	mov	bx,word ptr DGROUP:_postx
	shl	bx,1
	mov	word ptr DGROUP:_wallheight[bx],256
   ;	
   ;						FarScalePost ();
   ;	
	call	near ptr _FarScalePost
	inc	word ptr [bp-8]
	inc	word ptr DGROUP:_postx
	add	word ptr DGROUP:_postsource,64
	adc	word ptr DGROUP:_postsource+2,0
@4@530:
	cmp	word ptr [bp-8],64
	jl	short @4@482
   ;	
   ;					}
   ;					bufferofs -= 32*SCREENWIDTH;
   ;	
	sub	word ptr DGROUP:_bufferofs,2560
   ;	
   ;				}
   ;	
	jmp	@4@1106
@4@578:
   ;	
   ;				else if (i < PMSoundStart)
   ;	
	cmp	di,word ptr DGROUP:_PMSoundStart
	jae	short @4@626
   ;	
   ;				{
   ;				//
   ;				// draw the sprite
   ;				//
   ;					bufferofs += 32*SCREENWIDTH;
   ;	
	add	word ptr DGROUP:_bufferofs,2560
   ;	
   ;					SimpleScaleShape (160, i-PMSpriteStart, 64);
   ;	
	mov	ax,64
	push	ax
	mov	ax,di
	sub	ax,word ptr DGROUP:_PMSpriteStart
	push	ax
	mov	ax,160
	push	ax
	call	near ptr _SimpleScaleShape
	add	sp,6
   ;	
   ;					bufferofs -= 32*SCREENWIDTH;
   ;	
	sub	word ptr DGROUP:_bufferofs,2560
   ;	
   ;				}
   ;	
	jmp	@4@1106
@4@626:
   ;	
   ;				else if (i == ChunksInFile - 1)
   ;	
	mov	ax,word ptr DGROUP:_ChunksInFile
	dec	ax
	cmp	ax,di
	je	@@1
	jmp	@4@770
@@1:
   ;	
   ;				{
   ;					US_Print("\n\n Number of sounds: ");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+262
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;					US_PrintUnsigned(NumDigi);
   ;	
	xor	ax,ax
	push	ax
	push	word ptr DGROUP:_NumDigi
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;					for (l = j = k = 0;j < NumDigi;j++)
   ;	
	xor	ax,ax
	mov	word ptr [bp-6],ax
	mov	si,ax
	cwd	
	mov	word ptr [bp-12],ax
	mov	word ptr [bp-10],dx
	jmp	short @4@722
@4@674:
   ;	
   ;					{
   ;						l += DigiList[(j * 2) + 1];
   ;	
	mov	bx,si
	shl	bx,1
	inc	bx
	shl	bx,1
	mov	es,word ptr DGROUP:_DigiList
	mov	ax,word ptr es:[bx]
	add	word ptr [bp-12],ax
	adc	word ptr [bp-10],0
   ;	
   ;						k += (DigiList[(j * 2) + 1] + (PMPageSize - 1)) / PMPageSize;
   ;	
	mov	bx,si
	shl	bx,1
	inc	bx
	shl	bx,1
	mov	es,word ptr DGROUP:_DigiList
	mov	ax,word ptr es:[bx]
	add	ax,4095
	mov	cl,12
	shr	ax,cl
	mov	dx,word ptr [bp-6]
	add	dx,ax
	mov	word ptr [bp-6],dx
	inc	si
@4@722:
	cmp	si,word ptr DGROUP:_NumDigi
	jb	short @4@674
   ;	
   ;					}
   ;					US_Print("\n Total bytes: ");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+284
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;					US_PrintUnsigned(l);
   ;	
	push	word ptr [bp-10]
	push	word ptr [bp-12]
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;					US_Print("\n Total pages: ");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+300
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;					US_PrintUnsigned(k);
   ;	
	mov	ax,word ptr [bp-6]
	cwd	
	push	dx
	push	ax
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;				}
   ;	
	jmp	@4@1106
@4@770:
   ;	
   ;				else
   ;				{
   ;					byte far *dp = (byte far *)MK_FP(addr,0);
   ;	
	mov	ax,word ptr [bp-14]
	mov	word ptr [bp-24],0
	mov	word ptr [bp-22],ax
   ;	
   ;					for (j = 0;j < NumDigi;j++)
   ;	
	xor	si,si
	jmp	short @4@890
@4@794:
   ;	
   ;					{
   ;						k = (DigiList[(j * 2) + 1] + (PMPageSize - 1)) / PMPageSize;
   ;	
	mov	bx,si
	shl	bx,1
	inc	bx
	shl	bx,1
	mov	es,word ptr DGROUP:_DigiList
	mov	ax,word ptr es:[bx]
	add	ax,4095
	mov	cl,12
	shr	ax,cl
	mov	word ptr [bp-6],ax
   ;	
   ;						if
   ;	
   ;	
   ;						(
   ;							(i >= PMSoundStart + DigiList[j * 2])
   ;						&&	(i < PMSoundStart + DigiList[j * 2] + k)
   ;						)
   ;	
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	es,word ptr DGROUP:_DigiList
	mov	ax,word ptr DGROUP:_PMSoundStart
	add	ax,word ptr es:[bx]
	cmp	ax,di
	ja	short @4@866
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	es,word ptr DGROUP:_DigiList
	mov	ax,word ptr DGROUP:_PMSoundStart
	add	ax,word ptr es:[bx]
	add	ax,word ptr [bp-6]
	cmp	ax,di
	jbe	short @4@866
   ;	
   ;							break;
   ;	
	jmp	short @4@914
@4@866:
	inc	si
@4@890:
	cmp	si,word ptr DGROUP:_NumDigi
	jb	short @4@794
@4@914:
   ;	
   ;					}
   ;					if (j < NumDigi)
   ;	
	cmp	si,word ptr DGROUP:_NumDigi
	jae	short @4@962
   ;	
   ;					{
   ;	//					sound = j;
   ;						US_Print("\n Sound #");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+316
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;						US_PrintUnsigned(j);
   ;	
	mov	ax,si
	cwd	
	push	dx
	push	ax
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;						US_Print("\n Segment #");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+326
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;						US_PrintUnsigned(i - PMSoundStart - DigiList[j * 2]);
   ;	
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	es,word ptr DGROUP:_DigiList
	mov	ax,di
	sub	ax,word ptr DGROUP:_PMSoundStart
	sub	ax,word ptr es:[bx]
	xor	dx,dx
	push	dx
	push	ax
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
@4@962:
   ;	
   ;					}
   ;					for (j = 0;j < page->length;j += 32)
   ;	
	xor	si,si
	jmp	@4@1082
@4@986:
   ;	
   ;					{
   ;						byte v = dp[j];
   ;	
	les	bx,dword ptr [bp-24]
	mov	al,byte ptr es:[bx+si]
	mov	byte ptr [bp-25],al
   ;	
   ;						int v2 = (unsigned)v;
   ;	
	mov	al,byte ptr [bp-25]
	mov	ah,0
	mov	word ptr [bp-28],ax
   ;	
   ;						v2 -= 128;
   ;	
	sub	word ptr [bp-28],128
   ;	
   ;						v2 /= 4;
   ;	
	mov	bx,4
	mov	ax,word ptr [bp-28]
	cwd	
	idiv	bx
	mov	word ptr [bp-28],ax
   ;	
   ;						if (v2 < 0)
   ;	
	cmp	word ptr [bp-28],0
	jge	short @4@1034
   ;	
   ;							VWB_Vlin(WindowY + WindowH - 32 + v2,
   ;	
   ;	
   ;									WindowY + WindowH - 32,
   ;									WindowX + 8 + (j / 32),BLACK);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,si
	mov	bx,32
	cwd	
	idiv	bx
	mov	dx,word ptr DGROUP:_WindowX
	add	dx,ax
	add	dx,8
	push	dx
	mov	ax,word ptr DGROUP:_WindowY
	add	ax,word ptr DGROUP:_WindowH
	sub	ax,32
	push	ax
	mov	ax,word ptr DGROUP:_WindowY
	add	ax,word ptr DGROUP:_WindowH
	sub	ax,32
	add	ax,word ptr [bp-28]
	push	ax
	call	near ptr _VWB_Vlin
	add	sp,8
	jmp	short @4@1058
@4@1034:
   ;	
   ;						else
   ;							VWB_Vlin(WindowY + WindowH - 32,
   ;	
   ;	
   ;									WindowY + WindowH - 32 + v2,
   ;									WindowX + 8 + (j / 32),BLACK);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,si
	mov	bx,32
	cwd	
	idiv	bx
	mov	dx,word ptr DGROUP:_WindowX
	add	dx,ax
	add	dx,8
	push	dx
	mov	ax,word ptr DGROUP:_WindowY
	add	ax,word ptr DGROUP:_WindowH
	sub	ax,32
	add	ax,word ptr [bp-28]
	push	ax
	mov	ax,word ptr DGROUP:_WindowY
	add	ax,word ptr DGROUP:_WindowH
	sub	ax,32
	push	ax
	call	near ptr _VWB_Vlin
	add	sp,8
@4@1058:
	add	si,32
@4@1082:
	les	bx,dword ptr [bp-18]
	cmp	word ptr es:[bx+4],si
	jbe	@@2
	jmp	@4@986
@@2:
@4@1106:
   ;	
   ;					}
   ;				}
   ;			}
   ;	
   ;			VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
	jmp	short @4@1154
@4@1130:
   ;	
   ;	
   ;			while (!(scan = LastScan))
   ;				SD_Poll();
   ;	
	call	near ptr _SD_Poll
@4@1154:
	mov	al,byte ptr DGROUP:_LastScan
	mov	byte ptr [bp-3],al
	mov	ah,0
	or	ax,ax
	je	short @4@1130
   ;	
   ;	
   ;			IN_ClearKey(scan);
   ;	
	mov	al,byte ptr [bp-3]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	mov	word ptr DGROUP:_Keyboard[bx],0
	mov	al,byte ptr [bp-3]
	cmp	al,byte ptr DGROUP:_LastScan
	jne	short @4@1226
	mov	byte ptr DGROUP:_LastScan,0
@4@1226:
   ;	
   ;			switch (scan)
   ;	
	mov	al,byte ptr [bp-3]
	mov	ah,0
	mov	word ptr [bp-20],ax
	mov	cx,10
	mov	bx,offset @4@C6580
@4@1274:
	mov	ax,word ptr cs:[bx]
	cmp	ax,word ptr [bp-20]
	je	short @4@1346
	inc	bx
	inc	bx
	loop	short @4@1274
	jmp	short @4@1802
@4@1346:
	jmp	word ptr cs:[bx+20]
@4@1370:
   ;	
   ;			{
   ;			case sc_LeftArrow:
   ;				if (i)
   ;	
	or	di,di
	je	short @4@1418
   ;	
   ;					i--;
   ;	
	dec	di
@4@1418:
   ;	
   ;				break;
   ;	
	jmp	short @4@1802
@4@1442:
   ;	
   ;			case sc_RightArrow:
   ;				if (++i >= ChunksInFile)
   ;	
	inc	di
	mov	ax,di
	cmp	ax,word ptr DGROUP:_ChunksInFile
	jb	short @4@1490
   ;	
   ;					i--;
   ;	
	dec	di
@4@1490:
   ;	
   ;				break;
   ;	
	jmp	short @4@1802
@4@1514:
   ;	
   ;			case sc_W:	// Walls
   ;				i = 0;
   ;	
	xor	di,di
   ;	
   ;				break;
   ;	
	jmp	short @4@1802
@4@1538:
   ;	
   ;			case sc_S:	// Sprites
   ;				i = PMSpriteStart;
   ;	
	mov	di,word ptr DGROUP:_PMSpriteStart
   ;	
   ;				break;
   ;	
	jmp	short @4@1802
@4@1562:
   ;	
   ;			case sc_D:	// Digitized
   ;				i = PMSoundStart;
   ;	
	mov	di,word ptr DGROUP:_PMSoundStart
   ;	
   ;				break;
   ;	
	jmp	short @4@1802
@4@1586:
   ;	
   ;			case sc_I:	// Digitized info
   ;				i = ChunksInFile - 1;
   ;	
	mov	ax,word ptr DGROUP:_ChunksInFile
	dec	ax
	mov	di,ax
   ;	
   ;				break;
   ;	
	jmp	short @4@1802
@4@1610:
   ;	
   ;			case sc_L:	// Load all pages
   ;				for (j = 0;j < ChunksInFile;j++)
   ;	
	xor	si,si
	jmp	short @4@1682
@4@1634:
   ;	
   ;					PM_GetPage(j);
   ;	
	push	si
	call	near ptr _PM_GetPage
	pop	cx
	inc	si
@4@1682:
	cmp	si,word ptr DGROUP:_ChunksInFile
	jb	short @4@1634
   ;	
   ;				break;
   ;	
	jmp	short @4@1802
@4@1730:
   ;	
   ;			case sc_P:
   ;	//			if (sound != -1)
   ;	//				SD_PlayDigitized(sound);
   ;				break;
   ;	
	jmp	short @4@1802
@4@1754:
   ;	
   ;			case sc_Escape:
   ;				done = true;
   ;	
	mov	word ptr [bp-2],1
   ;	
   ;				break;
   ;	
	jmp	short @4@1802
@4@1778:
   ;	
   ;			case sc_Enter:
   ;				PM_GetPage(i);
   ;	
	push	di
	call	near ptr _PM_GetPage
	pop	cx
   ;	
   ;				break;
   ;	
	jmp	short @4@1802
@4@1802:
	cmp	word ptr [bp-2],0
	jne	@@3
	jmp	@4@50
@@3:
   ;	
   ;			}
   ;		}
   ;		SD_StopDigitized();
   ;	
	call	near ptr _SD_StopDigitized
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_ShapeTest	endp
@4@C6580	label	word
	db	1
	db	0
	db	17
	db	0
	db	23
	db	0
	db	25
	db	0
	db	28
	db	0
	db	31
	db	0
	db	32
	db	0
	db	38
	db	0
	db	75
	db	0
	db	77
	db	0
	dw	@4@1754
	dw	@4@1514
	dw	@4@1586
	dw	@4@1730
	dw	@4@1778
	dw	@4@1538
	dw	@4@1562
	dw	@4@1610
	dw	@4@1370
	dw	@4@1442
   ;	
   ;	int DebugKeys (void)
   ;	
	assume	cs:_TEXT
_DebugKeys	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		boolean esc;
   ;		int level,i;
   ;	
   ;		if (Keyboard[sc_B])		// B = border color
   ;	
	cmp	word ptr DGROUP:_Keyboard+96,0
	je	short @5@170
   ;	
   ;		{
   ;			CenterWindow(24,3);
   ;	
	mov	ax,3
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _CenterWindow
	pop	cx
	pop	cx
   ;	
   ;			PrintY+=6;
   ;	
	add	word ptr DGROUP:_PrintY,6
   ;	
   ;			US_Print(" Border color (0-15):");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+338
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;			VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;			esc = !US_LineInput (px,py,str,NULL,true,2,0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,1
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_str
	push	ax
	push	word ptr DGROUP:_py
	push	word ptr DGROUP:_px
	call	near ptr _US_LineInput
	add	sp,14
	neg	ax
	sbb	ax,ax
	inc	ax
	mov	di,ax
   ;	
   ;			if (!esc)
   ;	
	or	di,di
	jne	short @5@146
   ;	
   ;			{
   ;				level = atoi (str);
   ;	
	mov	ax,offset DGROUP:_str
	push	ax
	call	near ptr _atol
	pop	cx
	mov	si,ax
   ;	
   ;				if (level>=0 && level<=15)
   ;	
	or	si,si
	jl	short @5@146
	cmp	si,15
	jg	short @5@146
   ;	
   ;					VW_ColorBorder (level);
   ;	
	push	si
	call	near ptr _VL_ColorBorder
	pop	cx
@5@146:
   ;	
   ;			}
   ;			return 1;
   ;	
	mov	ax,1
	jmp	@5@1514
@5@170:
   ;	
   ;		}
   ;	
   ;		if (Keyboard[sc_C])		// C = count objects
   ;	
	cmp	word ptr DGROUP:_Keyboard+92,0
	je	short @5@218
   ;	
   ;		{
   ;			CountObjects();
   ;	
	call	near ptr _CountObjects
   ;	
   ;			return 1;
   ;	
	mov	ax,1
	jmp	@5@1514
@5@218:
   ;	
   ;		}
   ;	
   ;		if (Keyboard[sc_E])		// E = quit level
   ;	
	cmp	word ptr DGROUP:_Keyboard+36,0
	je	short @5@314
   ;	
   ;		{
   ;			if (tedlevel)
   ;	
	cmp	word ptr DGROUP:_tedlevel,0
	je	short @5@290
   ;	
   ;				Quit (NULL);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _Quit
	pop	cx
@5@290:
   ;	
   ;			playstate = ex_completed;
   ;	
	mov	word ptr DGROUP:_playstate,1
@5@314:
   ;	
   ;	//		gamestate.mapon++;
   ;		}
   ;	
   ;		if (Keyboard[sc_F])		// F = facing spot
   ;	
	cmp	word ptr DGROUP:_Keyboard+66,0
	je	short @5@362
   ;	
   ;		{
   ;			CenterWindow (14,4);
   ;	
	mov	ax,4
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _CenterWindow
	pop	cx
	pop	cx
   ;	
   ;			US_Print ("X:");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+360
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;			US_PrintUnsigned (player->x);
   ;	
	mov	bx,word ptr DGROUP:_player
	push	word ptr [bx+17]
	push	word ptr [bx+15]
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;			US_Print ("\nY:");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+363
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;			US_PrintUnsigned (player->y);
   ;	
	mov	bx,word ptr DGROUP:_player
	push	word ptr [bx+21]
	push	word ptr [bx+19]
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;			US_Print ("\nA:");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+367
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;			US_PrintUnsigned (player->angle);
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+40]
	cwd	
	push	dx
	push	ax
	call	near ptr _US_PrintUnsigned
	pop	cx
	pop	cx
   ;	
   ;			VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;			IN_Ack();
   ;	
	call	near ptr _IN_Ack
   ;	
   ;			return 1;
   ;	
	mov	ax,1
	jmp	@5@1514
@5@362:
   ;	
   ;		}
   ;	
   ;		if (Keyboard[sc_G])		// G = god mode
   ;	
	cmp	word ptr DGROUP:_Keyboard+68,0
	je	short @5@482
   ;	
   ;		{
   ;			CenterWindow (12,2);
   ;	
	mov	ax,2
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _CenterWindow
	pop	cx
	pop	cx
   ;	
   ;			if (godmode)
   ;	
	cmp	word ptr DGROUP:_godmode,0
	je	short @5@434
   ;	
   ;			  US_PrintCentered ("God mode OFF");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+371
	push	ax
	call	near ptr _US_PrintCentered
	pop	cx
	pop	cx
	jmp	short @5@458
@5@434:
   ;	
   ;			else
   ;			  US_PrintCentered ("God mode ON");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+384
	push	ax
	call	near ptr _US_PrintCentered
	pop	cx
	pop	cx
@5@458:
   ;	
   ;			VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;			IN_Ack();
   ;	
	call	near ptr _IN_Ack
   ;	
   ;			godmode ^= 1;
   ;	
	xor	word ptr DGROUP:_godmode,1
   ;	
   ;			return 1;
   ;	
	mov	ax,1
	jmp	@5@1514
@5@482:
   ;	
   ;		}
   ;		if (Keyboard[sc_H])		// H = hurt self
   ;	
	cmp	word ptr DGROUP:_Keyboard+70,0
	je	short @5@530
   ;	
   ;		{
   ;			IN_ClearKeysDown ();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;			TakeDamage (16,NULL);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,16
	push	ax
	call	near ptr _TakeDamage
	pop	cx
	pop	cx
   ;	
   ;		}
   ;	
	jmp	@5@1490
@5@530:
   ;	
   ;		else if (Keyboard[sc_I])			// I = item cheat
   ;	
	cmp	word ptr DGROUP:_Keyboard+46,0
	je	short @5@698
   ;	
   ;		{
   ;			CenterWindow (12,3);
   ;	
	mov	ax,3
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _CenterWindow
	pop	cx
	pop	cx
   ;	
   ;			US_PrintCentered ("Free items!");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+396
	push	ax
	call	near ptr _US_PrintCentered
	pop	cx
	pop	cx
   ;	
   ;			VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;			GivePoints (100000);
   ;	
	mov	ax,1
	mov	dx,34464
	push	ax
	push	dx
	call	near ptr _GivePoints
	pop	cx
	pop	cx
   ;	
   ;			HealSelf (99);
   ;	
	mov	ax,99
	push	ax
	call	near ptr _HealSelf
	pop	cx
   ;	
   ;			if (gamestate.bestweapon<wp_chaingun)
   ;	
	cmp	word ptr DGROUP:_gamestate+24,3
	jge	short @5@602
   ;	
   ;				GiveWeapon (gamestate.bestweapon+1);
   ;	
	mov	ax,word ptr DGROUP:_gamestate+24
	inc	ax
	push	ax
	call	near ptr _GiveWeapon
	pop	cx
@5@602:
   ;	
   ;			gamestate.ammo += 50;
   ;	
	add	word ptr DGROUP:_gamestate+20,50
   ;	
   ;			if (gamestate.ammo > 99)
   ;	
	cmp	word ptr DGROUP:_gamestate+20,99
	jle	short @5@650
   ;	
   ;				gamestate.ammo = 99;
   ;	
	mov	word ptr DGROUP:_gamestate+20,99
@5@650:
   ;	
   ;			DrawAmmo ();
   ;	
	call	near ptr _DrawAmmo
   ;	
   ;			IN_Ack ();
   ;	
	call	near ptr _IN_Ack
   ;	
   ;			return 1;
   ;	
	mov	ax,1
	jmp	@5@1514
   ;	
   ;		}
   ;	
	jmp	@5@1490
@5@698:
   ;	
   ;		else if (Keyboard[sc_M])			// M = memory info
   ;	
	cmp	word ptr DGROUP:_Keyboard+100,0
	je	short @5@770
   ;	
   ;		{
   ;			DebugMemory();
   ;	
	call	near ptr _DebugMemory
   ;	
   ;			return 1;
   ;	
	mov	ax,1
	jmp	@5@1514
   ;	
   ;		}
   ;	
	jmp	@5@1490
@5@770:
   ;	
   ;	#ifdef SPEAR
   ;		else if (Keyboard[sc_N])			// N = no clip
   ;		{
   ;			noclip^=1;
   ;			CenterWindow (18,3);
   ;			if (noclip)
   ;				US_PrintCentered ("No clipping ON");
   ;			else
   ;				US_PrintCentered ("No clipping OFF");
   ;			VW_UpdateScreen();
   ;			IN_Ack ();
   ;			return 1;
   ;		}
   ;	#endif
   ;	#if 0
   ;		else if (Keyboard[sc_O])			// O = overhead
   ;		{
   ;			ViewMap();
   ;			return 1;
   ;		}
   ;	#endif
   ;		else if (Keyboard[sc_P])			// P = pause with no screen disruptioon
   ;	
	cmp	word ptr DGROUP:_Keyboard+50,0
	je	short @5@842
   ;	
   ;		{
   ;			PicturePause ();
   ;	
	call	near ptr _PicturePause
   ;	
   ;			return 1;
   ;	
	mov	ax,1
	jmp	@5@1514
   ;	
   ;		}
   ;	
	jmp	@5@1490
@5@842:
   ;	
   ;		else if (Keyboard[sc_Q])			// Q = fast quit
   ;	
	cmp	word ptr DGROUP:_Keyboard+32,0
	je	short @5@890
   ;	
   ;			Quit (NULL);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _Quit
	pop	cx
	jmp	@5@1490
@5@890:
   ;	
   ;		else if (Keyboard[sc_S])			// S = slow motion
   ;	
	cmp	word ptr DGROUP:_Keyboard+62,0
	je	short @5@1034
   ;	
   ;		{
   ;			singlestep^=1;
   ;	
	xor	word ptr DGROUP:_singlestep,1
   ;	
   ;			CenterWindow (18,3);
   ;	
	mov	ax,3
	push	ax
	mov	ax,18
	push	ax
	call	near ptr _CenterWindow
	pop	cx
	pop	cx
   ;	
   ;			if (singlestep)
   ;	
	cmp	word ptr DGROUP:_singlestep,0
	je	short @5@962
   ;	
   ;				US_PrintCentered ("Slow motion ON");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+408
	push	ax
	call	near ptr _US_PrintCentered
	pop	cx
	pop	cx
	jmp	short @5@986
@5@962:
   ;	
   ;			else
   ;				US_PrintCentered ("Slow motion OFF");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+423
	push	ax
	call	near ptr _US_PrintCentered
	pop	cx
	pop	cx
@5@986:
   ;	
   ;			VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;			IN_Ack ();
   ;	
	call	near ptr _IN_Ack
   ;	
   ;			return 1;
   ;	
	mov	ax,1
	jmp	@5@1514
   ;	
   ;		}
   ;	
	jmp	@5@1490
@5@1034:
   ;	
   ;		else if (Keyboard[sc_T])			// T = shape test
   ;	
	cmp	word ptr DGROUP:_Keyboard+40,0
	je	short @5@1106
   ;	
   ;		{
   ;			ShapeTest ();
   ;	
	call	near ptr _ShapeTest
   ;	
   ;			return 1;
   ;	
	mov	ax,1
	jmp	@5@1514
   ;	
   ;		}
   ;	
	jmp	@5@1490
@5@1106:
   ;	
   ;		else if (Keyboard[sc_V])			// V = extra VBLs
   ;	
	cmp	word ptr DGROUP:_Keyboard+94,0
	je	short @5@1274
   ;	
   ;		{
   ;			CenterWindow(30,3);
   ;	
	mov	ax,3
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _CenterWindow
	pop	cx
	pop	cx
   ;	
   ;			PrintY+=6;
   ;	
	add	word ptr DGROUP:_PrintY,6
   ;	
   ;			US_Print("  Add how many extra VBLs(0-8):");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+439
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;			VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;			esc = !US_LineInput (px,py,str,NULL,true,2,0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,1
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_str
	push	ax
	push	word ptr DGROUP:_py
	push	word ptr DGROUP:_px
	call	near ptr _US_LineInput
	add	sp,14
	neg	ax
	sbb	ax,ax
	inc	ax
	mov	di,ax
   ;	
   ;			if (!esc)
   ;	
	or	di,di
	jne	short @5@1226
   ;	
   ;			{
   ;				level = atoi (str);
   ;	
	mov	ax,offset DGROUP:_str
	push	ax
	call	near ptr _atol
	pop	cx
	mov	si,ax
   ;	
   ;				if (level>=0 && level<=8)
   ;	
	or	si,si
	jl	short @5@1226
	cmp	si,8
	jg	short @5@1226
   ;	
   ;					extravbls = level;
   ;	
	mov	word ptr DGROUP:_extravbls,si
@5@1226:
   ;	
   ;			}
   ;			return 1;
   ;	
	mov	ax,1
	jmp	@5@1514
   ;	
   ;		}
   ;	
	jmp	@5@1490
@5@1274:
   ;	
   ;		else if (Keyboard[sc_W])			// W = warp to level
   ;	
	cmp	word ptr DGROUP:_Keyboard+34,0
	je	short @5@1442
   ;	
   ;		{
   ;			CenterWindow(26,3);
   ;	
	mov	ax,3
	push	ax
	mov	ax,26
	push	ax
	call	near ptr _CenterWindow
	pop	cx
	pop	cx
   ;	
   ;			PrintY+=6;
   ;	
	add	word ptr DGROUP:_PrintY,6
   ;	
   ;	#ifndef SPEAR
   ;			US_Print("  Warp to which level(1-10):");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+471
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;	#else
   ;			US_Print("  Warp to which level(1-21):");
   ;	#endif
   ;			VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;			esc = !US_LineInput (px,py,str,NULL,true,2,0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,1
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_str
	push	ax
	push	word ptr DGROUP:_py
	push	word ptr DGROUP:_px
	call	near ptr _US_LineInput
	add	sp,14
	neg	ax
	sbb	ax,ax
	inc	ax
	mov	di,ax
   ;	
   ;			if (!esc)
   ;	
	or	di,di
	jne	short @5@1394
   ;	
   ;			{
   ;				level = atoi (str);
   ;	
	mov	ax,offset DGROUP:_str
	push	ax
	call	near ptr _atol
	pop	cx
	mov	si,ax
   ;	
   ;	#ifndef SPEAR
   ;				if (level>0 && level<11)
   ;	
	or	si,si
	jle	short @5@1394
	cmp	si,11
	jge	short @5@1394
   ;	
   ;	#else
   ;				if (level>0 && level<22)
   ;	#endif
   ;				{
   ;					gamestate.mapon = level-1;
   ;	
	mov	ax,si
	dec	ax
	mov	word ptr DGROUP:_gamestate+2,ax
   ;	
   ;					playstate = ex_warped;
   ;	
	mov	word ptr DGROUP:_playstate,3
@5@1394:
   ;	
   ;				}
   ;			}
   ;			return 1;
   ;	
	mov	ax,1
	jmp	short @5@1514
   ;	
   ;		}
   ;	
	jmp	short @5@1490
@5@1442:
   ;	
   ;		else if (Keyboard[sc_X])			// X = item cheat
   ;	
	cmp	word ptr DGROUP:_Keyboard+90,0
	je	short @5@1490
   ;	
   ;		{
   ;			CenterWindow (12,3);
   ;	
	mov	ax,3
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _CenterWindow
	pop	cx
	pop	cx
   ;	
   ;			US_PrintCentered ("Extra stuff!");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+500
	push	ax
	call	near ptr _US_PrintCentered
	pop	cx
	pop	cx
   ;	
   ;			VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;			// DEBUG: put stuff here
   ;			IN_Ack ();
   ;	
	call	near ptr _IN_Ack
   ;	
   ;			return 1;
   ;	
	mov	ax,1
	jmp	short @5@1514
@5@1490:
   ;	
   ;		}
   ;	
   ;		return 0;
   ;	
	xor	ax,ax
	jmp	short @5@1514
@5@1514:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_DebugKeys	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_maporgx	label	word
	db	2 dup (?)
_maporgy	label	word
	db	2 dup (?)
_viewtype	label	word
	db	2 dup (?)
_menuitems	label	word
	db	2 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'Memory Usage'
	db	0
	db	'------------'
	db	0
	db	'Total     :'
	db	0
	db	'k'
	db	10
	db	'Free      :'
	db	0
	db	'k'
	db	10
	db	'With purge:'
	db	0
	db	'k'
	db	10
	db	0
	db	'Total statics :'
	db	0
	db	10
	db	'In use statics:'
	db	0
	db	10
	db	'Doors         :'
	db	0
	db	10
	db	'Total actors  :'
	db	0
	db	10
	db	'Active actors :'
	db	0
	db	' Page #'
	db	0
	db	' (Wall)'
	db	0
	db	' (Sprite)'
	db	0
	db	' (Sound Info)'
	db	0
	db	' (Sound)'
	db	0
	db	10
	db	' XMS: '
	db	0
	db	'No'
	db	0
	db	10
	db	' Main: '
	db	0
	db	'EMS '
	db	0
	db	'No'
	db	0
	db	10
	db	' Last hit: '
	db	0
	db	10
	db	' Address: '
	db	0
	db	'0x%04x'
	db	0
	db	10
	db	10
	db	' Number of sounds: '
	db	0
	db	10
	db	' Total bytes: '
	db	0
	db	10
	db	' Total pages: '
	db	0
	db	10
	db	' Sound #'
	db	0
	db	10
	db	' Segment #'
	db	0
	db	' Border color (0-15):'
	db	0
	db	'X:'
	db	0
	db	10
	db	'Y:'
	db	0
	db	10
	db	'A:'
	db	0
	db	'God mode OFF'
	db	0
	db	'God mode ON'
	db	0
	db	'Free items!'
	db	0
	db	'Slow motion ON'
	db	0
	db	'Slow motion OFF'
	db	0
	db	'  Add how many extra VBLs(0-8):'
	db	0
	db	'  Warp to which level(1-10):'
	db	0
	db	'Extra stuff!'
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	extrn	_CA_SetAllPurge:near
	public	_PicturePause
	extrn	_PMSoundStart:word
	extrn	__fmemcpy:near
	extrn	_FarScalePost:near
	extrn	_CenterWindow:near
	extrn	_DrawAmmo:near
	public	_DebugMemory
	extrn	_SD_StopDigitized:near
	extrn	_MM_TotalFree:near
	extrn	_PrintY:word
	extrn	_GivePoints:near
	public	_DebugKeys
	extrn	_gamestate:word
	extrn	_GiveWeapon:near
	extrn	_laststatobj:word
	extrn	_wallheight:word
	extrn	_VL_SetPalette:near
	extrn	_MM_GetPtr:near
	extrn	_singlestep:word
	public	_menuitems
	extrn	_displayofs:word
	extrn	_TakeDamage:near
	extrn	_PM_GetPage:near
	extrn	_VL_ColorBorder:near
	public	_viewtype
	extrn	_IN_Ack:near
	extrn	_DigiList:word
	extrn	_Keyboard:word
	extrn	_bufferofs:word
	extrn	_WindowH:word
	extrn	_WindowY:word
	extrn	_WindowX:word
	extrn	_statobjlist:word
	extrn	_HealSelf:near
	extrn	_ChunksInFile:word
	extrn	_tedlevel:word
	extrn	_ClearMemory:near
	extrn	_VL_SetScreen:near
	extrn	_US_PrintUnsigned:near
	extrn	_US_PrintCentered:near
	public	_maporgy
	public	_maporgx
	extrn	_LastScan:byte
	extrn	_playstate:word
	extrn	_US_ClearWindow:near
	extrn	_bioskey:near
	extrn	_NumDigi:word
	extrn	_VW_UpdateScreen:near
	extrn	_PMPages:dword
	extrn	_gamepal:byte
	public	_ShapeTest
	extrn	_mminfo:word
	extrn	_extravbls:word
	extrn	_IN_ClearKeysDown:near
	extrn	_US_LineInput:near
	public	_CountObjects
	extrn	_sprintf:near
	extrn	_FinishPaletteShifts:near
	extrn	_Quit:near
	extrn	_SD_Poll:near
	extrn	_py:word
	extrn	_postwidth:word
	extrn	_PM_GetPageAddress:near
	extrn	_player:word
	extrn	_postsource:word
	extrn	_US_CPrint:near
	extrn	_VL_WaitVBL:near
	extrn	_atol:near
	extrn	_SimpleScaleShape:near
	extrn	_str:byte
	extrn	_doornum:word
	extrn	_US_Print:near
	extrn	_IN_Shutdown:near
	extrn	N_LDIV@:far
	extrn	_VWB_Vlin:near
	extrn	_MM_UnusedMemory:near
	extrn	_px:word
	extrn	_postx:word
	extrn	_godmode:word
	extrn	_PMSpriteStart:word
	end
