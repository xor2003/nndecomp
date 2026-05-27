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
	?debug	S "c:\id_sd.c"
	?debug	C E9E551FE7C0A633A5C69645F73642E63
	?debug	C E95337528110443A5C494E434C5544455C646F732E68
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
_ssPort	label	word
	db	2
	db	0
ParmStrings	label	word
	dw	DGROUP:s@
	dw	DGROUP:s@+5
	dw	DGROUP:s@+10
	dw	DGROUP:s@+16
	dw	DGROUP:s@+21
	dw	DGROUP:s@+25
	dw	DGROUP:s@+29
	dw	DGROUP:s@+33
	db	0
	db	0
sbOldIntMask	label	byte
	db	255
sbDMA	label	byte
	db	1
sbDMAa1	label	byte
	db	131
sbDMAa2	label	byte
	db	2
sbDMAa3	label	byte
	db	3
sba1Vals	label	byte
	db	135
	db	131
	db	0
	db	130
sba2Vals	label	byte
	db	0
	db	2
	db	0
	db	6
sba3Vals	label	byte
	db	1
	db	3
	db	0
	db	7
sbLocation	label	word
	db	255
	db	255
sbInterrupt	label	word
	db	7
	db	0
sbIntVec	label	word
	db	15
	db	0
sbIntVectors	label	word
	db	255
	db	255
	db	255
	db	255
	db	10
	db	0
	db	11
	db	0
	db	255
	db	255
	db	13
	db	0
	db	255
	db	255
	db	15
	db	0
	db	255
	db	255
	db	255
	db	255
	db	255
	db	255
carriers	label	byte
	db	3
	db	4
	db	5
	db	11
	db	12
	db	13
	db	19
	db	20
	db	21
modifiers	label	byte
	db	0
	db	1
	db	2
	db	8
	db	9
	db	10
	db	16
	db	17
	db	18
pcarriers	label	byte
	db	19
	db	255
	db	255
	db	255
	db	255
pmodifiers	label	byte
	db	16
	db	17
	db	18
	db	20
	db	21
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_SetTimer0	proc	near
	push	bp
	mov	bp,sp
	mov	bx,word ptr [bp+4]
   ;	
   ;	SDL_SetTimer0(word speed)
   ;	{
   ;	#ifndef TPROF	// If using Borland's profiling, don't screw with the timer
   ;	
		pushf	
   ;	
   ;	asm	pushf
   ;	
		cli	
   ;	
   ;	asm	cli
   ;	
   ;	
	mov	dx,67
	mov	al,54
	out	dx,al
   ;	
   ;		outportb(0x43,0x36);				// Change timer 0
   ;	
	mov	dx,64
	mov	al,bl
	out	dx,al
   ;	
   ;		outportb(0x40,speed);
   ;	
	mov	ax,bx
	mov	cl,8
	shr	ax,cl
	mov	dx,64
	out	dx,al
   ;	
   ;		outportb(0x40,speed >> 8);
   ;		// Kludge to handle special case for digitized PC sounds
   ;	
	cmp	word ptr DGROUP:_TimerDivisor+2,0
	jne	short @1@146
	cmp	word ptr DGROUP:_TimerDivisor,170
	jne	short @1@146
   ;	
   ;		if (TimerDivisor == (1192030 / (TickBase * 100)))
   ;	
	mov	word ptr DGROUP:_TimerDivisor,1702
	mov	word ptr DGROUP:_TimerDivisor+2,0
	jmp	short @1@170
@1@146:
   ;	
   ;			TimerDivisor = (1192030 / (TickBase * 10));
   ;		else
   ;	
	mov	ax,bx
	mov	word ptr DGROUP:_TimerDivisor,ax
	mov	word ptr DGROUP:_TimerDivisor+2,0
@1@170:
   ;	
   ;			TimerDivisor = speed;
   ;	
   ;	
		popf	
   ;	
   ;	asm	popf
   ;	#else
   ;		TimerDivisor = 0x10000;
   ;	#endif
   ;	
	pop	bp
	ret	
SDL_SetTimer0	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_SetIntsPerSec	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SDL_SetIntsPerSec(word ints)
   ;	{
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:_TimerRate,ax
   ;	
   ;		TimerRate = ints;
   ;	
	xor	ax,ax
	push	ax
	push	word ptr [bp+4]
	mov	ax,18
	mov	dx,12382
	push	ax
	push	dx
	call	near ptr N_LDIV@
	push	ax
	call	near ptr SDL_SetTimer0
	pop	cx
   ;	
   ;		SDL_SetTimer0(1192030 / ints);
   ;	
	pop	bp
	ret	
SDL_SetIntsPerSec	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_SetTimerSpeed	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
   ;	
   ;	SDL_SetTimerSpeed(void)
   ;	{
   ;		word	rate;
   ;		void interrupt	(*isr)(void);
   ;	
   ;	
	cmp	word ptr DGROUP:_DigiMode,1
	jne	short @3@98
	cmp	word ptr DGROUP:_DigiPlaying,0
	je	short @3@98
   ;	
   ;		if ((DigiMode == sds_PC) && DigiPlaying)
   ;		{
   ;	
	mov	si,7000
   ;	
   ;			rate = TickBase * 100;
   ;	
	mov	word ptr [bp-4],offset _SDL_t0ExtremeAsmService
	mov	word ptr [bp-2],seg _SDL_t0ExtremeAsmService
   ;	
   ;			isr = SDL_t0ExtremeAsmService;
   ;	
	jmp	short @3@218
@3@98:
   ;	
   ;		}
   ;	
   ;	
   ;		else if
   ;		(
   ;			(MusicMode == smm_AdLib)
   ;		||	((DigiMode == sds_SoundSource) && DigiPlaying)
   ;	
	cmp	word ptr DGROUP:_MusicMode,1
	je	short @3@170
	cmp	word ptr DGROUP:_DigiMode,2
	jne	short @3@194
	cmp	word ptr DGROUP:_DigiPlaying,0
	je	short @3@194
@3@170:
   ;	
   ;		)
   ;		{
   ;	
	mov	si,700
   ;	
   ;			rate = TickBase * 10;
   ;	
	mov	word ptr [bp-4],offset _SDL_t0FastAsmService
	mov	word ptr [bp-2],cs
   ;	
   ;			isr = SDL_t0FastAsmService;
   ;	
	jmp	short @3@218
@3@194:
   ;	
   ;		}
   ;		else
   ;		{
   ;	
	mov	si,140
   ;	
   ;			rate = TickBase * 2;
   ;	
	mov	word ptr [bp-4],offset _SDL_t0SlowAsmService
	mov	word ptr [bp-2],cs
@3@218:
   ;	
   ;			isr = SDL_t0SlowAsmService;
   ;		}
   ;	
   ;	
	cmp	si,word ptr DGROUP:_TimerRate
	je	short @3@266
   ;	
   ;		if (rate != TimerRate)
   ;		{
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	mov	ax,8
	push	ax
	call	near ptr _setvect
	add	sp,6
   ;	
   ;			setvect(8,isr);
   ;	
	push	si
	call	near ptr SDL_SetIntsPerSec
	pop	cx
   ;	
   ;			SDL_SetIntsPerSec(rate);
   ;	
	mov	word ptr DGROUP:_TimerRate,si
@3@266:
   ;	
   ;			TimerRate = rate;
   ;		}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
SDL_SetTimerSpeed	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_SBStopSample	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	#endif
   ;	SDL_SBStopSample(void)
   ;	{
   ;		byte	is;
   ;	
		pushf	
   ;	
   ;	
   ;	
		cli	
   ;	
   ;	asm	pushf
   ;	asm	cli
   ;	
	cmp	word ptr DGROUP:sbSamplePlaying,0
	je	short @4@242
   ;	
   ;	
   ;		if (sbSamplePlaying)
   ;	
	mov	word ptr DGROUP:sbSamplePlaying,0
	jmp	short @4@122
@4@122:
   ;	
   ;		{
   ;			sbSamplePlaying = false;
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,524
	in	al,dx
	mov	ah,0
	test	ax,128
	jne	short @4@122
   ;	
   ;	
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,524
	mov	al,208
	out	dx,al
   ;	
   ;			sbWriteDelay();
   ;			sbOut(sbWriteCmd,0xd0);	// Turn off DSP DMA
   ;	
	mov	dx,33
	in	al,dx
	mov	bl,al
   ;	
   ;	
   ;	
	mov	ax,1
	mov	cl,byte ptr DGROUP:sbInterrupt
	shl	ax,cl
	mov	dl,byte ptr DGROUP:sbOldIntMask
	mov	dh,0
	test	ax,dx
	je	short @4@194
   ;	
   ;			is = inportb(0x21);	// Restore interrupt mask bit
   ;	
	mov	al,1
	mov	cl,byte ptr DGROUP:sbInterrupt
	shl	al,cl
	mov	dl,bl
	or	dl,al
	mov	bl,dl
	jmp	short @4@218
@4@194:
   ;	
   ;			if (sbOldIntMask & (1 << sbInterrupt))
   ;				is |= (1 << sbInterrupt);
   ;	
	mov	al,1
	mov	cl,byte ptr DGROUP:sbInterrupt
	shl	al,cl
	not	al
	mov	dl,bl
	and	dl,al
	mov	bl,dl
@4@218:
   ;	
   ;			else
   ;	
	mov	dx,33
	mov	al,bl
	out	dx,al
@4@242:
   ;	
   ;				is &= ~(1 << sbInterrupt);
   ;			outportb(0x21,is);
   ;		}
   ;	
		popf	
   ;	
   ;	
   ;	
	pop	bp
	ret	
SDL_SBStopSample	endp
   ;	
   ;	static longword
   ;	
	assume	cs:_TEXT
SDL_SBPlaySeg	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
   ;	
   ;	SDL_SBPlaySeg(volatile byte huge *data,longword length)
   ;	{
   ;		unsigned		datapage;
   ;		longword		dataofs,uselen;
   ;	
   ;	
	mov	ax,word ptr [bp+10]
	mov	dx,word ptr [bp+8]
	mov	word ptr [bp-10],dx
	mov	word ptr [bp-8],ax
   ;	
   ;		uselen = length;
   ;	
	mov	ax,word ptr [bp+6]
	mov	cl,12
	shr	ax,cl
	mov	word ptr [bp-2],ax
   ;	
   ;		datapage = FP_SEG(data) >> 12;
   ;	
	mov	ax,word ptr [bp+6]
	and	ax,4095
	mov	cl,4
	shl	ax,cl
	add	ax,word ptr [bp+4]
	mov	word ptr [bp-6],ax
	mov	word ptr [bp-4],0
   ;	
   ;		dataofs = ((FP_SEG(data) & 0xfff) << 4) + FP_OFF(data);
   ;	
	cmp	word ptr [bp-4],1
	jb	short @5@122
	jne	short @5@98
	cmp	word ptr [bp-6],0
	jb	short @5@122
@5@98:
   ;	
   ;		if (dataofs >= 0x10000)
   ;		{
   ;	
	inc	word ptr [bp-2]
   ;	
   ;			datapage++;
   ;	
	sub	word ptr [bp-6],0
	sbb	word ptr [bp-4],1
@5@122:
   ;	
   ;			dataofs -= 0x10000;
   ;		}
   ;	
   ;	
	mov	ax,word ptr [bp-4]
	mov	dx,word ptr [bp-6]
	add	dx,word ptr [bp-10]
	adc	ax,word ptr [bp-8]
	cmp	ax,1
	jb	short @5@218
	ja	short @5@194
	or	dx,dx
	jbe	short @5@218
@5@194:
   ;	
   ;		if (dataofs + uselen > 0x10000)
   ;	
	mov	ax,1
	xor	dx,dx
	sub	dx,word ptr [bp-6]
	sbb	ax,word ptr [bp-4]
	mov	word ptr [bp-10],dx
	mov	word ptr [bp-8],ax
@5@218:
   ;	
   ;			uselen = 0x10000 - dataofs;
   ;	
   ;	
	sub	word ptr [bp-10],1
	sbb	word ptr [bp-8],0
   ;	
   ;		uselen--;
   ;	
   ;		// Program the DMA controller
   ;	
		pushf	
   ;	
   ;	asm	pushf
   ;	
		cli	
   ;	
   ;	asm	cli
   ;	
	mov	al,byte ptr DGROUP:sbDMA
	or	al,4
	mov	dx,10
	out	dx,al
   ;	
   ;		outportb(0x0a,sbDMA | 4);					// Mask off DMA on channel sbDMA
   ;	
	mov	dx,12
	mov	al,0
	out	dx,al
   ;	
   ;		outportb(0x0c,0);							// Clear byte ptr flip-flop to lower byte
   ;	
	mov	dx,11
	mov	al,73
	out	dx,al
   ;	
   ;		outportb(0x0b,0x49);						// Set transfer mode for D/A conv
   ;	
	mov	al,byte ptr DGROUP:sbDMAa2
	mov	ah,0
	push	ax
	mov	al,byte ptr [bp-6]
	pop	dx
	out	dx,al
   ;	
   ;		outportb(sbDMAa2,(byte)dataofs);			// Give LSB of address
   ;	
	mov	dx,word ptr [bp-4]
	mov	ax,word ptr [bp-6]
	mov	cl,8
	call	near ptr N_LXURSH@
	mov	dl,byte ptr DGROUP:sbDMAa2
	mov	dh,0
	out	dx,al
   ;	
   ;		outportb(sbDMAa2,(byte)(dataofs >> 8));		// Give MSB of address
   ;	
	mov	al,byte ptr DGROUP:sbDMAa1
	mov	ah,0
	push	ax
	mov	al,byte ptr [bp-2]
	pop	dx
	out	dx,al
   ;	
   ;		outportb(sbDMAa1,(byte)datapage);			// Give page of address
   ;	
	mov	al,byte ptr DGROUP:sbDMAa3
	mov	ah,0
	push	ax
	mov	al,byte ptr [bp-10]
	pop	dx
	out	dx,al
   ;	
   ;		outportb(sbDMAa3,(byte)uselen);				// Give LSB of length
   ;	
	mov	dx,word ptr [bp-8]
	mov	ax,word ptr [bp-10]
	mov	cl,8
	call	near ptr N_LXURSH@
	mov	dl,byte ptr DGROUP:sbDMAa3
	mov	dh,0
	out	dx,al
   ;	
   ;		outportb(sbDMAa3,(byte)(uselen >> 8));		// Give MSB of length
   ;	
	mov	dx,10
	mov	al,byte ptr DGROUP:sbDMA
	out	dx,al
	jmp	short @5@314
@5@314:
   ;	
   ;		outportb(0x0a,sbDMA);						// Re-enable DMA on channel sbDMA
   ;	
   ;		// Start playing the thing
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,524
	in	al,dx
	mov	ah,0
	test	ax,128
	jne	short @5@314
   ;	
   ;		sbWriteDelay();
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,524
	mov	al,20
	out	dx,al
	jmp	short @5@362
@5@362:
   ;	
   ;		sbOut(sbWriteCmd,0x14);
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,524
	in	al,dx
	mov	ah,0
	test	ax,128
	jne	short @5@362
   ;	
   ;		sbWriteDelay();
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,524
	mov	al,byte ptr [bp-10]
	out	dx,al
	jmp	short @5@410
@5@410:
   ;	
   ;		sbOut(sbWriteData,(byte)uselen);
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,524
	in	al,dx
	mov	ah,0
	test	ax,128
	jne	short @5@410
   ;	
   ;		sbWriteDelay();
   ;	
	mov	dx,word ptr [bp-8]
	mov	ax,word ptr [bp-10]
	mov	cl,8
	call	near ptr N_LXURSH@
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,524
	out	dx,al
   ;	
   ;		sbOut(sbWriteData,(byte)(uselen >> 8));
   ;	
		popf	
   ;	
   ;	asm	popf
   ;	
   ;	
	mov	dx,word ptr [bp-8]
	mov	ax,word ptr [bp-10]
	add	ax,1
	adc	dx,0
	jmp	short @5@506
@5@506:
   ;	
   ;		return(uselen + 1);
   ;	
	mov	sp,bp
	pop	bp
	ret	
SDL_SBPlaySeg	endp
   ;	
   ;	static void interrupt
   ;	
	assume	cs:_TEXT
SDL_SBService	proc	far
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
   ;	SDL_SBService(void)
   ;	{
   ;		longword	used;
   ;	
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,526
	in	al,dx
   ;	
   ;		sbIn(sbDataAvail);	// Ack interrupt to SB
   ;	
   ;	
	xor	cx,cx
	xor	bx,bx
	mov	dx,word ptr DGROUP:sbNextSegPtr+2
	mov	ax,word ptr DGROUP:sbNextSegPtr
	call	near ptr N_PCMP@
	je	short @6@194
   ;	
   ;		if (sbNextSegPtr)
   ;		{
   ;	
	push	word ptr DGROUP:sbNextSegLen+2
	push	word ptr DGROUP:sbNextSegLen
	push	word ptr DGROUP:sbNextSegPtr+2
	push	word ptr DGROUP:sbNextSegPtr
	call	near ptr SDL_SBPlaySeg
	add	sp,8
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;			used = SDL_SBPlaySeg(sbNextSegPtr,sbNextSegLen);
   ;	
	mov	ax,word ptr DGROUP:sbNextSegLen+2
	mov	dx,word ptr DGROUP:sbNextSegLen
	cmp	ax,word ptr [bp-2]
	ja	short @6@146
	jne	short @6@122
	cmp	dx,word ptr [bp-4]
	ja	short @6@146
@6@122:
   ;	
   ;			if (sbNextSegLen <= used)
   ;	
	mov	word ptr DGROUP:sbNextSegPtr,0
	mov	word ptr DGROUP:sbNextSegPtr+2,0
	jmp	short @6@170
@6@146:
   ;	
   ;				sbNextSegPtr = nil;
   ;			else
   ;			{
   ;	
	mov	cx,word ptr [bp-2]
	mov	bx,word ptr [bp-4]
	mov	dx,ds
	mov	ax,offset DGROUP:sbNextSegPtr
	call	near ptr N_PADA@
   ;	
   ;				sbNextSegPtr += used;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	sub	word ptr DGROUP:sbNextSegLen,dx
	sbb	word ptr DGROUP:sbNextSegLen+2,ax
@6@170:
   ;	
   ;				sbNextSegLen -= used;
   ;			}
   ;	
	jmp	short @6@218
@6@194:
   ;	
   ;		}
   ;		else
   ;		{
   ;	
	call	near ptr SDL_SBStopSample
   ;	
   ;			SDL_SBStopSample();
   ;	
	call	near ptr _SDL_DigitizedDone
@6@218:
   ;	
   ;			SDL_DigitizedDone();
   ;		}
   ;	
   ;	
	mov	dx,32
	mov	al,32
	out	dx,al
   ;	
   ;		outportb(0x20,0x20);	// Ack interrupt
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
SDL_SBService	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_SBPlaySample	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;	#endif
   ;	SDL_SBPlaySample(byte huge *data,longword len)
   ;	{
   ;		longword	used;
   ;	
	call	near ptr SDL_SBStopSample
   ;	
   ;	
   ;		SDL_SBStopSample();
   ;	
		pushf	
   ;	
   ;	
   ;	
		cli	
   ;	
   ;	asm	pushf
   ;	asm	cli
   ;	
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr SDL_SBPlaySeg
	add	sp,8
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;	
   ;	
	mov	ax,word ptr [bp+10]
	mov	dx,word ptr [bp+8]
	cmp	ax,word ptr [bp-2]
	ja	short @7@194
	jne	short @7@170
	cmp	dx,word ptr [bp-4]
	ja	short @7@194
@7@170:
   ;	
   ;		used = SDL_SBPlaySeg(data,len);
   ;	
	mov	word ptr DGROUP:sbNextSegPtr,0
	mov	word ptr DGROUP:sbNextSegPtr+2,0
	jmp	short @7@218
@7@194:
   ;	
   ;		if (len <= used)
   ;			sbNextSegPtr = nil;
   ;		else
   ;	
	mov	dx,word ptr [bp+6]
	mov	ax,word ptr [bp+4]
	mov	cx,word ptr [bp-2]
	mov	bx,word ptr [bp-4]
	call	near ptr N_PADD@
	mov	word ptr DGROUP:sbNextSegPtr,ax
	mov	word ptr DGROUP:sbNextSegPtr+2,dx
   ;	
   ;		{
   ;	
	mov	ax,word ptr [bp+10]
	mov	dx,word ptr [bp+8]
	sub	dx,word ptr [bp-4]
	sbb	ax,word ptr [bp-2]
	mov	word ptr DGROUP:sbNextSegLen,dx
	mov	word ptr DGROUP:sbNextSegLen+2,ax
@7@218:
   ;	
   ;			sbNextSegPtr = data + used;
   ;			sbNextSegLen = len - used;
   ;		}
   ;	
   ;	
	mov	dx,33
	in	al,dx
	mov	byte ptr DGROUP:sbOldIntMask,al
   ;	
   ;		// Save old interrupt status and unmask ours
   ;	
	mov	al,1
	mov	cl,byte ptr DGROUP:sbInterrupt
	shl	al,cl
	not	al
	push	ax
	mov	al,byte ptr DGROUP:sbOldIntMask
	pop	dx
	and	al,dl
	mov	dx,33
	out	dx,al
	jmp	short @7@242
@7@242:
   ;	
   ;		sbOldIntMask = inportb(0x21);
   ;		outportb(0x21,sbOldIntMask & ~(1 << sbInterrupt));
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,524
	in	al,dx
	mov	ah,0
	test	ax,128
	jne	short @7@242
   ;	
   ;	
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,524
	mov	al,212
	out	dx,al
   ;	
   ;		sbWriteDelay();
   ;		sbOut(sbWriteCmd,0xd4);						// Make sure DSP DMA is enabled
   ;	
	mov	word ptr DGROUP:sbSamplePlaying,1
   ;	
   ;	
   ;		sbSamplePlaying = true;
   ;	
		popf	
   ;	
   ;	
   ;	
	mov	sp,bp
	pop	bp
	ret	
SDL_SBPlaySample	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_PositionSBP	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SDL_PositionSBP(int leftpos,int rightpos)
   ;	{
   ;		byte	v;
   ;	
   ;	
	cmp	word ptr DGROUP:_SBProPresent,0
	jne	short @8@74
   ;	
   ;		if (!SBProPresent)
   ;	
	jmp	short @8@194
@8@74:
   ;	
   ;			return;
   ;	
   ;	
	mov	ax,15
	sub	ax,word ptr [bp+4]
	mov	word ptr [bp+4],ax
   ;	
   ;		leftpos = 15 - leftpos;
   ;	
	mov	ax,15
	sub	ax,word ptr [bp+6]
	mov	word ptr [bp+6],ax
   ;	
   ;		rightpos = 15 - rightpos;
   ;	
	mov	al,byte ptr [bp+4]
	and	al,15
	mov	cl,4
	shl	al,cl
	mov	dl,byte ptr [bp+6]
	and	dl,15
	or	al,dl
	mov	bl,al
   ;	
   ;		v = ((leftpos & 0x0f) << 4) | (rightpos & 0x0f);
   ;	
   ;	
		pushf	
   ;	
   ;	asm	pushf
   ;	
		cli	
   ;	
   ;	asm	cli
   ;	
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,516
	mov	al,4
	out	dx,al
   ;	
   ;		sbOut(sbpMixerAddr,sbpmVoiceVol);
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,517
	mov	al,bl
	out	dx,al
   ;	
   ;		sbOut(sbpMixerData,v);
   ;	
   ;	
		popf	
@8@194:
   ;	
   ;	asm	popf
   ;	
	pop	bp
	ret	
SDL_PositionSBP	endp
   ;	
   ;	static boolean
   ;	
	assume	cs:_TEXT
SDL_CheckSB	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	SDL_CheckSB(int port)
   ;	{
   ;		int	i;
   ;	
   ;	
	mov	ax,word ptr [bp+4]
	mov	cl,4
	shl	ax,cl
	mov	word ptr DGROUP:sbLocation,ax
   ;	
   ;		sbLocation = port << 4;		// Initialize stuff for later use
   ;	
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,518
	mov	al,1
	out	dx,al
   ;	
   ;		sbOut(sbReset,true);		// Reset the SoundBlaster DSP
   ;	
		mov		dx,0388H				
   ;	
   ;	asm	mov	dx,0x388				// Wait >4usec
   ;	
		in		al, dx
   ;	
   ;	asm	in	al, dx
   ;	
		in		al, dx
   ;	
   ;	asm	in	al, dx
   ;	
		in		al, dx
   ;	
   ;	asm	in	al, dx
   ;	
		in		al, dx
   ;	
   ;	asm	in	al, dx
   ;	
		in		al, dx
   ;	
   ;	asm	in	al, dx
   ;	
		in		al, dx
   ;	
   ;	asm	in	al, dx
   ;	
		in		al, dx
   ;	
   ;	asm	in	al, dx
   ;	
		in		al, dx
   ;	
   ;	asm	in	al, dx
   ;	
		in		al, dx
   ;	
   ;	asm	in	al, dx
   ;	
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,518
	mov	al,0
	out	dx,al
   ;	
   ;		sbOut(sbReset,false);		// Turn off sb DSP reset
   ;	
		mov		dx,0388H				
   ;	
   ;	asm	mov	dx,0x388				// Wait >100usec
   ;	
		mov		cx,100
@9@362:
   ;	
   ;	asm	mov	cx,100
   ;	usecloop:
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
	loop	short @9@362
   ;	
   ;	asm	loop usecloop
   ;	
   ;	
	xor	si,si
	jmp	short @9@578
@9@434:
   ;	
   ;		for (i = 0;i < 100;i++)
   ;		{
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,526
	in	al,dx
	test	al,128
	je	short @9@554
   ;	
   ;			if (sbIn(sbDataAvail) & 0x80)		// If data is available...
   ;			{
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,522
	in	al,dx
	cmp	al,170
	jne	short @9@530
   ;	
   ;				if (sbIn(sbReadData) == 0xaa)	// If it matches correct value
   ;	
	mov	ax,1
	jmp	short @9@626
	jmp	short @9@554
@9@530:
   ;	
   ;					return(true);
   ;				else
   ;				{
   ;	
	mov	word ptr DGROUP:sbLocation,65535
   ;	
   ;					sbLocation = -1;			// Otherwise not a SoundBlaster
   ;	
	xor	ax,ax
	jmp	short @9@626
@9@554:
	inc	si
@9@578:
	cmp	si,100
	jl	short @9@434
   ;	
   ;					return(false);
   ;				}
   ;			}
   ;		}
   ;	
	mov	word ptr DGROUP:sbLocation,65535
   ;	
   ;		sbLocation = -1;						// Retry count exceeded - fail
   ;	
	xor	ax,ax
	jmp	short @9@626
@9@626:
   ;	
   ;		return(false);
   ;	
	pop	si
	pop	bp
	ret	
SDL_CheckSB	endp
   ;	
   ;	static boolean
   ;	
	assume	cs:_TEXT
SDL_DetectSoundBlaster	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	SDL_DetectSoundBlaster(int port)
   ;	{
   ;		int	i;
   ;	
   ;	
	or	di,di
	jne	short @10@74
   ;	
   ;		if (port == 0)					// If user specifies default, use 2
   ;	
	mov	di,2
@10@74:
   ;	
   ;			port = 2;
   ;	
	cmp	di,65535
	jne	short @10@434
   ;	
   ;		if (port == -1)
   ;		{
   ;	
	mov	ax,2
	push	ax
	call	near ptr SDL_CheckSB
	pop	cx
	or	ax,ax
	je	short @10@146
   ;	
   ;			if (SDL_CheckSB(2))			// Check default before scanning
   ;	
	mov	ax,1
	jmp	short @10@458
@10@146:
   ;	
   ;				return(true);
   ;	
   ;	
	mov	ax,4
	push	ax
	call	near ptr SDL_CheckSB
	pop	cx
	or	ax,ax
	je	short @10@194
   ;	
   ;			if (SDL_CheckSB(4))			// Check other SB Pro location before scan
   ;	
	mov	ax,1
	jmp	short @10@458
@10@194:
   ;	
   ;				return(true);
   ;	
   ;	
	mov	si,1
	jmp	short @10@362
@10@218:
   ;	
   ;			for (i = 1;i <= 6;i++)		// Scan through possible SB locations
   ;			{
   ;	
	cmp	si,2
	je	short @10@266
	cmp	si,4
	jne	short @10@290
@10@266:
   ;	
   ;				if ((i == 2) || (i == 4))
   ;	
	jmp	short @10@338
@10@290:
   ;	
   ;					continue;
   ;	
   ;	
	push	si
	call	near ptr SDL_CheckSB
	pop	cx
	or	ax,ax
	je	short @10@338
   ;	
   ;				if (SDL_CheckSB(i))		// If found at this address,
   ;	
	mov	ax,1
	jmp	short @10@458
@10@338:
	inc	si
@10@362:
	cmp	si,6
	jle	short @10@218
   ;	
   ;					return(true);		//	return success
   ;			}
   ;	
	xor	ax,ax
	jmp	short @10@458
   ;	
   ;			return(false);				// All addresses failed, return failure
   ;	
	jmp	short @10@458
@10@434:
   ;	
   ;		}
   ;		else
   ;	
	push	di
	call	near ptr SDL_CheckSB
	pop	cx
	jmp	short @10@458
@10@458:
   ;	
   ;			return(SDL_CheckSB(port));	// User specified address or default
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
SDL_DetectSoundBlaster	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SDL_SBSetDMA	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SDL_SBSetDMA(byte channel)
   ;	{
   ;	
	cmp	byte ptr [bp+4],3
	jbe	short @11@74
   ;	
   ;		if (channel > 3)
   ;	
	mov	ax,offset DGROUP:s@+37
	push	ax
	call	near ptr _Quit
	pop	cx
@11@74:
   ;	
   ;			Quit("SDL_SBSetDMA() - invalid SoundBlaster DMA channel");
   ;	
   ;	
	mov	al,byte ptr [bp+4]
	mov	byte ptr DGROUP:sbDMA,al
   ;	
   ;		sbDMA = channel;
   ;	
	mov	al,byte ptr [bp+4]
	mov	ah,0
	mov	bx,ax
	mov	al,byte ptr DGROUP:sba1Vals[bx]
	mov	byte ptr DGROUP:sbDMAa1,al
   ;	
   ;		sbDMAa1 = sba1Vals[channel];
   ;	
	mov	al,byte ptr [bp+4]
	mov	ah,0
	mov	bx,ax
	mov	al,byte ptr DGROUP:sba2Vals[bx]
	mov	byte ptr DGROUP:sbDMAa2,al
   ;	
   ;		sbDMAa2 = sba2Vals[channel];
   ;	
	mov	al,byte ptr [bp+4]
	mov	ah,0
	mov	bx,ax
	mov	al,byte ptr DGROUP:sba3Vals[bx]
	mov	byte ptr DGROUP:sbDMAa3,al
   ;	
   ;		sbDMAa3 = sba3Vals[channel];
   ;	
	pop	bp
	ret	
_SDL_SBSetDMA	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_StartSB	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
   ;	
   ;	SDL_StartSB(void)
   ;	{
   ;		byte	timevalue,test;
   ;	
   ;	
	mov	bx,word ptr DGROUP:sbInterrupt
	shl	bx,1
	mov	ax,word ptr DGROUP:sbIntVectors[bx]
	mov	word ptr DGROUP:sbIntVec,ax
   ;	
   ;		sbIntVec = sbIntVectors[sbInterrupt];
   ;	
	cmp	word ptr DGROUP:sbIntVec,0
	jge	short @12@74
   ;	
   ;		if (sbIntVec < 0)
   ;	
	mov	ax,offset DGROUP:s@+87
	push	ax
	call	near ptr _Quit
	pop	cx
@12@74:
   ;	
   ;			Quit("SDL_StartSB: Illegal or unsupported interrupt number for SoundBlaster");
   ;	
   ;	
	push	word ptr DGROUP:sbIntVec
	call	near ptr _getvect
	pop	cx
	mov	word ptr DGROUP:sbOldIntHand,ax
	mov	word ptr DGROUP:sbOldIntHand+2,dx
   ;	
   ;		sbOldIntHand = getvect(sbIntVec);	// Get old interrupt handler
   ;	
	push	cs
	mov	ax,offset SDL_SBService
	push	ax
	push	word ptr DGROUP:sbIntVec
	call	near ptr _setvect
	add	sp,6
	jmp	short @12@98
@12@98:
   ;	
   ;		setvect(sbIntVec,SDL_SBService);	// Set mine
   ;	
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,524
	in	al,dx
	mov	ah,0
	test	ax,128
	jne	short @12@98
   ;	
   ;		sbWriteDelay();
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,524
	mov	al,209
	out	dx,al
   ;	
   ;		sbOut(sbWriteCmd,0xd1);				// Turn on DSP speaker
   ;	
   ;		// Set the SoundBlaster DAC time constant for 7KHz
   ;	
	mov	byte ptr [bp-1],114
	jmp	short @12@146
@12@146:
   ;	
   ;		timevalue = 256 - (1000000 / 7000);
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,524
	in	al,dx
	mov	ah,0
	test	ax,128
	jne	short @12@146
   ;	
   ;		sbWriteDelay();
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,524
	mov	al,64
	out	dx,al
	jmp	short @12@194
@12@194:
   ;	
   ;		sbOut(sbWriteCmd,0x40);
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,524
	in	al,dx
	mov	ah,0
	test	ax,128
	jne	short @12@194
   ;	
   ;		sbWriteDelay();
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,524
	mov	al,byte ptr [bp-1]
	out	dx,al
   ;	
   ;		sbOut(sbWriteData,timevalue);
   ;	
   ;	
	mov	word ptr DGROUP:_SBProPresent,0
   ;	
   ;		SBProPresent = false;
   ;	
	cmp	word ptr DGROUP:sbNoProCheck,0
	je	short @12@266
   ;	
   ;		if (sbNoProCheck)
   ;	
	jmp	@12@338
@12@266:
   ;	
   ;			return;
   ;	
   ;		// Check to see if this is a SB Pro
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,516
	mov	al,38
	out	dx,al
   ;	
   ;		sbOut(sbpMixerAddr,sbpmFMVol);
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,517
	in	al,dx
	mov	byte ptr DGROUP:sbpOldFMMix,al
   ;	
   ;		sbpOldFMMix = sbIn(sbpMixerData);
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,517
	mov	al,187
	out	dx,al
   ;	
   ;		sbOut(sbpMixerData,0xbb);
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,517
	in	al,dx
	mov	byte ptr [bp-2],al
   ;	
   ;		test = sbIn(sbpMixerData);
   ;	
	cmp	byte ptr [bp-2],187
	jne	short @12@338
   ;	
   ;		if (test == 0xbb)
   ;		{
   ;			// Boost FM output levels to be equivilent with digitized output
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,517
	mov	al,255
	out	dx,al
   ;	
   ;			sbOut(sbpMixerData,0xff);
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,517
	in	al,dx
	mov	byte ptr [bp-2],al
   ;	
   ;			test = sbIn(sbpMixerData);
   ;	
	cmp	byte ptr [bp-2],255
	jne	short @12@338
   ;	
   ;			if (test == 0xff)
   ;			{
   ;	
	mov	word ptr DGROUP:_SBProPresent,1
   ;	
   ;				SBProPresent = true;
   ;	
   ;				// Save old Voice output levels (SB Pro)
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,516
	mov	al,4
	out	dx,al
   ;	
   ;				sbOut(sbpMixerAddr,sbpmVoiceVol);
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,517
	in	al,dx
	mov	byte ptr DGROUP:sbpOldVOCMix,al
   ;	
   ;				sbpOldVOCMix = sbIn(sbpMixerData);
   ;	
   ;				// Turn SB Pro stereo DAC off
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,516
	mov	al,14
	out	dx,al
   ;	
   ;				sbOut(sbpMixerAddr,sbpmControl);
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,517
	mov	al,0
	out	dx,al
@12@338:
   ;	
   ;				sbOut(sbpMixerData,0);				// 0=off,2=on
   ;			}
   ;		}
   ;	
	mov	sp,bp
	pop	bp
	ret	
SDL_StartSB	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_ShutSB	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SDL_ShutSB(void)
   ;	{
   ;	
	call	near ptr SDL_SBStopSample
   ;	
   ;		SDL_SBStopSample();
   ;	
   ;	
	cmp	word ptr DGROUP:_SBProPresent,0
	je	short @13@74
   ;	
   ;		if (SBProPresent)
   ;		{
   ;			// Restore FM output levels (SB Pro)
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,516
	mov	al,38
	out	dx,al
   ;	
   ;			sbOut(sbpMixerAddr,sbpmFMVol);
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,517
	mov	al,byte ptr DGROUP:sbpOldFMMix
	out	dx,al
   ;	
   ;			sbOut(sbpMixerData,sbpOldFMMix);
   ;	
   ;			// Restore Voice output levels (SB Pro)
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,516
	mov	al,4
	out	dx,al
   ;	
   ;			sbOut(sbpMixerAddr,sbpmVoiceVol);
   ;	
	mov	dx,word ptr DGROUP:sbLocation
	add	dx,517
	mov	al,byte ptr DGROUP:sbpOldVOCMix
	out	dx,al
@13@74:
   ;	
   ;			sbOut(sbpMixerData,sbpOldVOCMix);
   ;		}
   ;	
   ;	
	push	word ptr DGROUP:sbOldIntHand+2
	push	word ptr DGROUP:sbOldIntHand
	push	word ptr DGROUP:sbIntVec
	call	near ptr _setvect
	add	sp,6
   ;	
   ;		setvect(sbIntVec,sbOldIntHand);		// Set vector back
   ;	
	pop	bp
	ret	
SDL_ShutSB	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_SSStopSample	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	#endif
   ;	SDL_SSStopSample(void)
   ;	
		pushf	
   ;	
   ;	{
   ;	
		cli	
   ;	
   ;	asm	pushf
   ;	asm	cli
   ;	
	mov	word ptr DGROUP:_ssSample,0
	mov	word ptr DGROUP:_ssSample+2,0
   ;	
   ;	
   ;		(long)ssSample = 0;
   ;	
		popf	
   ;	
   ;	
   ;	
	pop	bp
	ret	
SDL_SSStopSample	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_SSService	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	jmp	@15@530
@15@50:
   ;	
   ;	SDL_SSService(void)
   ;	{
   ;		boolean	gotit;
   ;		byte	v;
   ;	
   ;		while (ssSample)
   ;		{
   ;	
		mov			dx,[DGROUP:_ssStatus]	
   ;	
   ;		asm	mov		dx,[ssStatus]	// Check to see if FIFO is currently empty
   ;	
		in			al,dx
   ;	
   ;		asm	in		al,dx
   ;	
		test		al,040H
   ;	
   ;		asm	test	al,0x40
   ;	
	jne	short @15@554
   ;	
   ;		asm	jnz		done			// Nope - don't push any more data out
   ;	
   ;	
	les	bx,dword ptr DGROUP:_ssSample
	mov	al,byte ptr es:[bx]
	mov	byte ptr [bp-1],al
	inc	word ptr DGROUP:_ssSample
   ;	
   ;			v = *ssSample++;
   ;	
	sub	word ptr DGROUP:_ssLengthLeft,1
	mov	ax,word ptr DGROUP:_ssLengthLeft
	sbb	word ptr DGROUP:_ssLengthLeft+2,0
	mov	dx,word ptr DGROUP:_ssLengthLeft+2
	or	ax,dx
	jne	short @15@194
   ;	
   ;			if (!(--ssLengthLeft))
   ;			{
   ;	
	mov	word ptr DGROUP:_ssSample,0
	mov	word ptr DGROUP:_ssSample+2,0
   ;	
   ;				(long)ssSample = 0;
   ;	
	call	near ptr _SDL_DigitizedDone
@15@194:
   ;	
   ;				SDL_DigitizedDone();
   ;			}
   ;	
   ;	
		mov			dx,[DGROUP:_ssData]		
   ;	
   ;		asm	mov		dx,[ssData]		// Pump the value out
   ;	
		mov			al,[[bp-1]]
   ;	
   ;		asm	mov		al,[v]
   ;	
		out			dx,al
   ;	
   ;		asm	out		dx,al
   ;	
   ;	
		mov			dx,[DGROUP:_ssControl]	
   ;	
   ;		asm	mov		dx,[ssControl]	// Pulse printer select
   ;	
		mov			al,[DGROUP:_ssOff]
   ;	
   ;		asm	mov		al,[ssOff]
   ;	
		out			dx,al
   ;	
   ;		asm	out		dx,al
   ;	
		push		ax
   ;	
   ;		asm	push	ax
   ;	
		pop			ax
   ;	
   ;		asm	pop		ax
   ;	
		mov			al,[DGROUP:_ssOn]
   ;	
   ;		asm	mov		al,[ssOn]
   ;	
		out			dx,al
   ;	
   ;		asm	out		dx,al
   ;	
   ;	
		push		ax				
   ;	
   ;		asm	push	ax				// Delay a short while
   ;	
		pop			ax
   ;	
   ;		asm	pop		ax
   ;	
		push		ax
   ;	
   ;		asm	push	ax
   ;	
		pop			ax
@15@530:
	mov	ax,word ptr DGROUP:_ssSample
	or	ax,word ptr DGROUP:_ssSample+2
	je	@@0
	jmp	@15@50
@@0:
@15@554:
   ;	
   ;		asm	pop		ax
   ;		}
   ;	done:;
   ;	
	mov	sp,bp
	pop	bp
	ret	
SDL_SSService	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_SSPlaySample	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	#endif
   ;	SDL_SSPlaySample(byte huge *data,longword len)
   ;	
		pushf	
   ;	
   ;	{
   ;	
		cli	
   ;	
   ;	asm	pushf
   ;	asm	cli
   ;	
	mov	ax,word ptr [bp+10]
	mov	dx,word ptr [bp+8]
	mov	word ptr DGROUP:_ssLengthLeft,dx
	mov	word ptr DGROUP:_ssLengthLeft+2,ax
   ;	
   ;	
   ;	
	mov	ax,word ptr [bp+6]
	mov	dx,word ptr [bp+4]
	mov	word ptr DGROUP:_ssSample,dx
	mov	word ptr DGROUP:_ssSample+2,ax
   ;	
   ;		ssLengthLeft = len;
   ;		ssSample = (volatile byte far *)data;
   ;	
		popf	
   ;	
   ;	
   ;	
	pop	bp
	ret	
SDL_SSPlaySample	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_StartSS	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SDL_StartSS(void)
   ;	{
   ;	
	cmp	word ptr DGROUP:_ssPort,3
	jne	short @17@74
   ;	
   ;		if (ssPort == 3)
   ;	
	mov	word ptr DGROUP:_ssControl,634
	jmp	short @17@146
@17@74:
   ;	
   ;			ssControl = 0x27a;	// If using LPT3
   ;	
	cmp	word ptr DGROUP:_ssPort,2
	jne	short @17@122
   ;	
   ;		else if (ssPort == 2)
   ;	
	mov	word ptr DGROUP:_ssControl,890
	jmp	short @17@146
@17@122:
   ;	
   ;			ssControl = 0x37a;	// If using LPT2
   ;		else
   ;	
	mov	word ptr DGROUP:_ssControl,958
@17@146:
   ;	
   ;			ssControl = 0x3be;	// If using LPT1
   ;	
	mov	ax,word ptr DGROUP:_ssControl
	dec	ax
	mov	word ptr DGROUP:_ssStatus,ax
   ;	
   ;		ssStatus = ssControl - 1;
   ;	
	mov	ax,word ptr DGROUP:_ssStatus
	dec	ax
	mov	word ptr DGROUP:_ssData,ax
   ;	
   ;		ssData = ssStatus - 1;
   ;	
   ;	
	mov	byte ptr DGROUP:_ssOn,4
   ;	
   ;		ssOn = 0x04;
   ;	
	cmp	word ptr DGROUP:_ssIsTandy,0
	je	short @17@194
   ;	
   ;		if (ssIsTandy)
   ;	
	mov	byte ptr DGROUP:_ssOff,14
	jmp	short @17@218
@17@194:
   ;	
   ;			ssOff = 0x0e;				// Tandy wierdness
   ;		else
   ;	
	mov	byte ptr DGROUP:_ssOff,12
@17@218:
   ;	
   ;			ssOff = 0x0c;				// For normal machines
   ;	
   ;	
	mov	dx,word ptr DGROUP:_ssControl
	mov	al,byte ptr DGROUP:_ssOn
	out	dx,al
   ;	
   ;		outportb(ssControl,ssOn);		// Enable SS
   ;	
	pop	bp
	ret	
SDL_StartSS	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_ShutSS	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SDL_ShutSS(void)
   ;	{
   ;	
	mov	dx,word ptr DGROUP:_ssControl
	mov	al,byte ptr DGROUP:_ssOff
	out	dx,al
   ;	
   ;		outportb(ssControl,ssOff);
   ;	
	pop	bp
	ret	
SDL_ShutSS	endp
   ;	
   ;	static boolean
   ;	
	assume	cs:_TEXT
SDL_CheckSS	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
   ;	
   ;	SDL_CheckSS(void)
   ;	{
   ;	
	xor	si,si
   ;	
   ;		boolean		present = false;
   ;		longword	lasttime;
   ;	
   ;		// Turn the Sound Source on and wait awhile (4 ticks)
   ;	
	call	near ptr SDL_StartSS
   ;	
   ;		SDL_StartSS();
   ;	
   ;	
	mov	ax,word ptr DGROUP:_TimeCount+2
	mov	dx,word ptr DGROUP:_TimeCount
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
	jmp	short @19@50
@19@50:
   ;	
   ;		lasttime = TimeCount;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	add	dx,4
	adc	ax,0
	cmp	ax,word ptr DGROUP:_TimeCount+2
	ja	short @19@50
	jne	short @19@122
	cmp	dx,word ptr DGROUP:_TimeCount
	ja	short @19@50
@19@122:
   ;	
   ;		while (TimeCount < lasttime + 4)
   ;			;
   ;	
   ;	
		mov			dx,[DGROUP:_ssStatus]	
   ;	
   ;	asm	mov		dx,[ssStatus]	// Check to see if FIFO is currently empty
   ;	
		in			al,dx
   ;	
   ;	asm	in		al,dx
   ;	
		test		al,040H
   ;	
   ;	asm	test	al,0x40
   ;	
	jne	short @19@722
   ;	
   ;	asm	jnz		checkdone		// Nope - Sound Source not here
   ;	
   ;	
		mov			cx,32			
@19@242:
   ;	
   ;	asm	mov		cx,32			// Force FIFO overflow (FIFO is 16 bytes)
   ;	outloop:
   ;	
		mov			dx,[DGROUP:_ssData]		
   ;	
   ;	asm	mov		dx,[ssData]		// Pump a neutral value out
   ;	
		mov			al,080H
   ;	
   ;	asm	mov		al,0x80
   ;	
		out			dx,al
   ;	
   ;	asm	out		dx,al
   ;	
   ;	
		mov			dx,[DGROUP:_ssControl]	
   ;	
   ;	asm	mov		dx,[ssControl]	// Pulse printer select
   ;	
		mov			al,[DGROUP:_ssOff]
   ;	
   ;	asm	mov		al,[ssOff]
   ;	
		out			dx,al
   ;	
   ;	asm	out		dx,al
   ;	
		push		ax
   ;	
   ;	asm	push	ax
   ;	
		pop			ax
   ;	
   ;	asm	pop		ax
   ;	
		mov			al,[DGROUP:_ssOn]
   ;	
   ;	asm	mov		al,[ssOn]
   ;	
		out			dx,al
   ;	
   ;	asm	out		dx,al
   ;	
   ;	
		push		ax				
   ;	
   ;	asm	push	ax				// Delay a short while before we do this again
   ;	
		pop			ax
   ;	
   ;	asm	pop		ax
   ;	
		push		ax
   ;	
   ;	asm	push	ax
   ;	
		pop			ax
   ;	
   ;	asm	pop		ax
   ;	
   ;	
	loop	short @19@242
   ;	
   ;	asm	loop	outloop
   ;	
   ;	
		mov			dx,[DGROUP:_ssStatus]	
   ;	
   ;	asm	mov		dx,[ssStatus]	// Is FIFO overflowed now?
   ;	
		in			al,dx
   ;	
   ;	asm	in		al,dx
   ;	
		test		al,040H
   ;	
   ;	asm	test	al,0x40
   ;	
	je	short @19@722
   ;	
   ;	asm	jz		checkdone		// Nope, still not - Sound Source not here
   ;	
   ;	
	mov	si,1
@19@722:
   ;	
   ;		present = true;			// Yes - it's here!
   ;	
   ;	checkdone:
   ;	
	call	near ptr SDL_ShutSS
   ;	
   ;		SDL_ShutSS();
   ;	
	mov	ax,si
	jmp	short @19@746
@19@746:
   ;	
   ;		return(present);
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
SDL_CheckSS	endp
   ;	
   ;	static boolean
   ;	
	assume	cs:_TEXT
SDL_DetectSoundSource	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SDL_DetectSoundSource(void)
   ;	{
   ;	
	mov	word ptr DGROUP:_ssPort,1
	jmp	short @20@122
@20@50:
   ;	
   ;		for (ssPort = 1;ssPort <= 3;ssPort++)
   ;	
	call	near ptr SDL_CheckSS
	or	ax,ax
	je	short @20@98
   ;	
   ;			if (SDL_CheckSS())
   ;	
	mov	ax,1
	jmp	short @20@170
@20@98:
	inc	word ptr DGROUP:_ssPort
@20@122:
	cmp	word ptr DGROUP:_ssPort,3
	jbe	short @20@50
   ;	
   ;				return(true);
   ;	
	xor	ax,ax
	jmp	short @20@170
@20@170:
   ;	
   ;		return(false);
   ;	
	pop	bp
	ret	
SDL_DetectSoundSource	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_PCPlaySample	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	#endif
   ;	SDL_PCPlaySample(byte huge *data,longword len)
   ;	
		pushf	
   ;	
   ;	{
   ;	
		cli	
   ;	
   ;	asm	pushf
   ;	asm	cli
   ;	
	mov	ax,1
	push	ax
	call	near ptr _SDL_IndicatePC
	pop	cx
   ;	
   ;	
   ;		SDL_IndicatePC(true);
   ;	
	mov	ax,word ptr [bp+10]
	mov	dx,word ptr [bp+8]
	mov	word ptr DGROUP:_pcLengthLeft,dx
	mov	word ptr DGROUP:_pcLengthLeft+2,ax
   ;	
   ;	
   ;	
	mov	ax,word ptr [bp+6]
	mov	dx,word ptr [bp+4]
	mov	word ptr DGROUP:_pcSound,dx
	mov	word ptr DGROUP:_pcSound+2,ax
   ;	
   ;		pcLengthLeft = len;
   ;		pcSound = (volatile byte far *)data;
   ;	
		popf	
   ;	
   ;	
   ;	
	pop	bp
	ret	
SDL_PCPlaySample	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_PCStopSample	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	#endif
   ;	SDL_PCStopSample(void)
   ;	
		pushf	
   ;	
   ;	{
   ;	
		cli	
   ;	
   ;	asm	pushf
   ;	asm	cli
   ;	
	mov	word ptr DGROUP:_pcSound,0
	mov	word ptr DGROUP:_pcSound+2,0
   ;	
   ;	
   ;		(long)pcSound = 0;
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _SDL_IndicatePC
	pop	cx
   ;	
   ;	
   ;		SDL_IndicatePC(false);
   ;	
		in		al,061H		  	
   ;	
   ;	
   ;	
		and		al,0fdH			
   ;	
   ;	asm	in	al,0x61		  	// Turn the speaker off
   ;	
		out		061H,al
   ;	
   ;	asm	and	al,0xfd			// ~2
   ;	asm	out	0x61,al
   ;	
		popf	
   ;	
   ;	
   ;	
	pop	bp
	ret	
SDL_PCStopSample	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_PCPlaySound	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	#endif
   ;	SDL_PCPlaySound(PCSound far *sound)
   ;	
		pushf	
   ;	
   ;	{
   ;	
		cli	
   ;	
   ;	asm	pushf
   ;	asm	cli
   ;	
	mov	byte ptr DGROUP:_pcLastSample,255
   ;	
   ;	
   ;	
	les	bx,dword ptr [bp+4]
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	mov	word ptr DGROUP:_pcLengthLeft,dx
	mov	word ptr DGROUP:_pcLengthLeft+2,ax
   ;	
   ;		pcLastSample = -1;
   ;	
	mov	ax,word ptr [bp+6]
	mov	dx,word ptr [bp+4]
	add	dx,6
	mov	word ptr DGROUP:_pcSound,dx
	mov	word ptr DGROUP:_pcSound+2,ax
   ;	
   ;		pcLengthLeft = sound->common.length;
   ;		pcSound = sound->data;
   ;	
		popf	
   ;	
   ;	
   ;	
	pop	bp
	ret	
SDL_PCPlaySound	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_PCStopSound	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	#endif
   ;	SDL_PCStopSound(void)
   ;	
		pushf	
   ;	
   ;	{
   ;	
		cli	
   ;	
   ;	asm	pushf
   ;	asm	cli
   ;	
	mov	word ptr DGROUP:_pcSound,0
	mov	word ptr DGROUP:_pcSound+2,0
   ;	
   ;	
   ;		(long)pcSound = 0;
   ;	
		in		al,061H		  	
   ;	
   ;	
   ;	
		and		al,0fdH			
   ;	
   ;	asm	in	al,0x61		  	// Turn the speaker off
   ;	
		out		061H,al
   ;	
   ;	asm	and	al,0xfd			// ~2
   ;	asm	out	0x61,al
   ;	
		popf	
   ;	
   ;	
   ;	
	pop	bp
	ret	
SDL_PCStopSound	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_ShutPC	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SDL_ShutPC(void)
   ;	{
   ;	
		pushf	
   ;	
   ;	asm	pushf
   ;	
		cli	
   ;	
   ;	asm	cli
   ;	
   ;	
	mov	word ptr DGROUP:_pcSound,0
	mov	word ptr DGROUP:_pcSound+2,0
   ;	
   ;		pcSound = 0;
   ;	
   ;	
		in		al,061H		  	
   ;	
   ;	asm	in	al,0x61		  	// Turn the speaker & gate off
   ;	
		and		al,0fcH			
   ;	
   ;	asm	and	al,0xfc			// ~3
   ;	
		out		061H,al
   ;	
   ;	asm	out	0x61,al
   ;	
   ;	
		popf	
   ;	
   ;	asm	popf
   ;	
	pop	bp
	ret	
SDL_ShutPC	endp
   ;	
   ;	memptr
   ;	
	assume	cs:_TEXT
_SDL_LoadDigiSegment	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	SDL_LoadDigiSegment(word page)
   ;	{
   ;		memptr	addr;
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
	mov	ax,word ptr DGROUP:_PMSoundStart
	add	ax,word ptr [bp+4]
	push	ax
	call	near ptr _PM_GetPage
	pop	cx
	mov	si,ax
   ;	
   ;		addr = PM_GetSoundPage(page);
   ;	
	mov	ax,1
	push	ax
	mov	ax,word ptr DGROUP:_PMSoundStart
	add	ax,word ptr [bp+4]
	push	ax
	call	near ptr _PM_SetPageLock
	pop	cx
	pop	cx
   ;	
   ;		PM_SetPageLock(PMSoundStart + page,pml_Locked);
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
	mov	ax,si
	jmp	short @26@50
@26@50:
   ;	
   ;		return(addr);
   ;	
	pop	si
	pop	bp
	ret	
_SDL_LoadDigiSegment	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SDL_PlayDigiSegment	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
	mov	si,word ptr [bp+6]
   ;	
   ;	SDL_PlayDigiSegment(memptr addr,word len)
   ;	{
   ;	
	mov	ax,word ptr DGROUP:_DigiMode
	cmp	ax,1
	je	short @27@146
	cmp	ax,2
	je	short @27@170
	cmp	ax,3
	je	short @27@194
	jmp	short @27@218
@27@146:
   ;	
   ;		switch (DigiMode)
   ;		{
   ;		case sds_PC:
   ;	
	xor	ax,ax
	push	ax
	push	si
	push	di
	xor	ax,ax
	push	ax
	call	near ptr SDL_PCPlaySample
	add	sp,8
   ;	
   ;	    	SDL_PCPlaySample(addr,len);
   ;	
	jmp	short @27@218
@27@170:
   ;	
   ;			break;
   ;		case sds_SoundSource:
   ;	
	xor	ax,ax
	push	ax
	push	si
	push	di
	xor	ax,ax
	push	ax
	call	near ptr SDL_SSPlaySample
	add	sp,8
   ;	
   ;			SDL_SSPlaySample(addr,len);
   ;	
	jmp	short @27@218
@27@194:
   ;	
   ;			break;
   ;		case sds_SoundBlaster:
   ;	
	xor	ax,ax
	push	ax
	push	si
	push	di
	xor	ax,ax
	push	ax
	call	near ptr SDL_SBPlaySample
	add	sp,8
   ;	
   ;			SDL_SBPlaySample(addr,len);
   ;	
	jmp	short @27@218
@27@218:
   ;	
   ;			break;
   ;		}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_SDL_PlayDigiSegment	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SD_StopDigitized	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	SD_StopDigitized(void)
   ;	{
   ;		int	i;
   ;	
   ;	
		pushf	
   ;	
   ;	asm	pushf
   ;	
		cli	
   ;	
   ;	asm	cli
   ;	
   ;	
	mov	word ptr DGROUP:_DigiLeft,0
   ;	
   ;		DigiLeft = 0;
   ;	
	mov	word ptr DGROUP:DigiNextAddr,0
   ;	
   ;		DigiNextAddr = nil;
   ;	
	mov	word ptr DGROUP:DigiNextLen,0
   ;	
   ;		DigiNextLen = 0;
   ;	
	mov	word ptr DGROUP:DigiMissed,0
   ;	
   ;		DigiMissed = false;
   ;	
	mov	word ptr DGROUP:_DigiPlaying,0
   ;	
   ;		DigiPlaying = false;
   ;	
	xor	ax,ax
	mov	word ptr DGROUP:_DigiPriority,ax
	mov	word ptr DGROUP:_DigiNumber,ax
   ;	
   ;		DigiNumber = DigiPriority = 0;
   ;	
	mov	word ptr DGROUP:_SoundPositioned,0
   ;	
   ;		SoundPositioned = false;
   ;	
	cmp	word ptr DGROUP:_DigiMode,1
	jne	short @28@146
	cmp	word ptr DGROUP:_SoundMode,1
	jne	short @28@146
   ;	
   ;		if ((DigiMode == sds_PC) && (SoundMode == sdm_PC))
   ;	
	xor	ax,ax
	mov	word ptr DGROUP:_SoundPriority,ax
	mov	word ptr DGROUP:_SoundNumber,ax
@28@146:
   ;	
   ;			SDL_SoundFinished();
   ;	
   ;	
	mov	ax,word ptr DGROUP:_DigiMode
	cmp	ax,1
	je	short @28@266
	cmp	ax,2
	je	short @28@290
	cmp	ax,3
	je	short @28@314
	jmp	short @28@338
@28@266:
   ;	
   ;		switch (DigiMode)
   ;		{
   ;		case sds_PC:
   ;	
	call	near ptr SDL_PCStopSample
   ;	
   ;			SDL_PCStopSample();
   ;	
	jmp	short @28@338
@28@290:
   ;	
   ;			break;
   ;		case sds_SoundSource:
   ;	
	call	near ptr SDL_SSStopSample
   ;	
   ;			SDL_SSStopSample();
   ;	
	jmp	short @28@338
@28@314:
   ;	
   ;			break;
   ;		case sds_SoundBlaster:
   ;	
	call	near ptr SDL_SBStopSample
   ;	
   ;			SDL_SBStopSample();
   ;	
	jmp	short @28@338
@28@338:
   ;	
   ;			break;
   ;		}
   ;	
   ;	
		popf	
   ;	
   ;	asm	popf
   ;	
   ;	
	mov	si,word ptr DGROUP:_DigiLastStart
	jmp	short @28@434
@28@386:
   ;	
   ;		for (i = DigiLastStart;i < DigiLastEnd;i++)
   ;	
	xor	ax,ax
	push	ax
	mov	ax,si
	add	ax,word ptr DGROUP:_PMSoundStart
	push	ax
	call	near ptr _PM_SetPageLock
	pop	cx
	pop	cx
	inc	si
@28@434:
	cmp	si,word ptr DGROUP:_DigiLastEnd
	jb	short @28@386
   ;	
   ;			PM_SetPageLock(i + PMSoundStart,pml_Unlocked);
   ;	
	mov	word ptr DGROUP:_DigiLastStart,1
   ;	
   ;		DigiLastStart = 1;
   ;	
	mov	word ptr DGROUP:_DigiLastEnd,0
   ;	
   ;		DigiLastEnd = 0;
   ;	
	pop	si
	pop	bp
	ret	
_SD_StopDigitized	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SD_Poll	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SD_Poll(void)
   ;	{
   ;	
	cmp	word ptr DGROUP:_DigiLeft,0
	je	short @29@218
	cmp	word ptr DGROUP:DigiNextAddr,0
	jne	short @29@218
   ;	
   ;		if (DigiLeft && !DigiNextAddr)
   ;		{
   ;	
	cmp	word ptr DGROUP:_DigiLeft,4096
	jb	short @29@122
	mov	ax,4096
	jmp	short @29@146
@29@122:
	mov	ax,word ptr DGROUP:_DigiLeft
	and	ax,4095
@29@146:
	mov	word ptr DGROUP:DigiNextLen,ax
   ;	
   ;			DigiNextLen = (DigiLeft >= PMPageSize)? PMPageSize : (DigiLeft % PMPageSize);
   ;	
	mov	ax,word ptr DGROUP:DigiNextLen
	sub	word ptr DGROUP:_DigiLeft,ax
   ;	
   ;			DigiLeft -= DigiNextLen;
   ;	
	cmp	word ptr DGROUP:_DigiLeft,0
	jne	short @29@194
   ;	
   ;			if (!DigiLeft)
   ;	
	mov	word ptr DGROUP:DigiLastSegment,1
@29@194:
   ;	
   ;				DigiLastSegment = true;
   ;	
	mov	ax,word ptr DGROUP:_DigiPage
	inc	word ptr DGROUP:_DigiPage
	push	ax
	call	near ptr _SDL_LoadDigiSegment
	pop	cx
	mov	word ptr DGROUP:DigiNextAddr,ax
@29@218:
   ;	
   ;			DigiNextAddr = SDL_LoadDigiSegment(DigiPage++);
   ;		}
   ;	
	cmp	word ptr DGROUP:DigiMissed,0
	je	short @29@314
	cmp	word ptr DGROUP:DigiNextAddr,0
	je	short @29@314
   ;	
   ;		if (DigiMissed && DigiNextAddr)
   ;		{
   ;	
	push	word ptr DGROUP:DigiNextLen
	push	word ptr DGROUP:DigiNextAddr
	call	near ptr _SDL_PlayDigiSegment
	pop	cx
	pop	cx
   ;	
   ;			SDL_PlayDigiSegment(DigiNextAddr,DigiNextLen);
   ;	
	mov	word ptr DGROUP:DigiNextAddr,0
   ;	
   ;			DigiNextAddr = nil;
   ;	
	mov	word ptr DGROUP:DigiMissed,0
   ;	
   ;			DigiMissed = false;
   ;	
	cmp	word ptr DGROUP:DigiLastSegment,0
	je	short @29@314
   ;	
   ;			if (DigiLastSegment)
   ;			{
   ;	
	mov	word ptr DGROUP:_DigiPlaying,0
   ;	
   ;				DigiPlaying = false;
   ;	
	mov	word ptr DGROUP:DigiLastSegment,0
@29@314:
   ;	
   ;				DigiLastSegment = false;
   ;			}
   ;		}
   ;	
	call	near ptr SDL_SetTimerSpeed
   ;	
   ;		SDL_SetTimerSpeed();
   ;	
	pop	bp
	ret	
_SD_Poll	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SD_SetPosition	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
	mov	si,word ptr [bp+6]
   ;	
   ;	SD_SetPosition(int leftpos,int rightpos)
   ;	{
   ;	
   ;	
   ;		if
   ;		(
   ;			(leftpos < 0)
   ;		||	(leftpos > 15)
   ;		||	(rightpos < 0)
   ;		||	(rightpos > 15)
   ;		||	((leftpos == 15) && (rightpos == 15))
   ;	
	or	di,di
	jl	short @30@170
	cmp	di,15
	jg	short @30@170
	or	si,si
	jl	short @30@170
	cmp	si,15
	jg	short @30@170
	cmp	di,15
	jne	short @30@194
	cmp	si,15
	jne	short @30@194
@30@170:
   ;	
   ;		)
   ;	
	mov	ax,offset DGROUP:s@+157
	push	ax
	call	near ptr _Quit
	pop	cx
@30@194:
   ;	
   ;			Quit("SD_SetPosition: Illegal position");
   ;	
   ;	
	mov	ax,word ptr DGROUP:_DigiMode
	cmp	ax,3
	je	short @30@266
	jmp	short @30@290
@30@266:
   ;	
   ;		switch (DigiMode)
   ;		{
   ;		case sds_SoundBlaster:
   ;	
	push	si
	push	di
	call	near ptr SDL_PositionSBP
	pop	cx
	pop	cx
   ;	
   ;			SDL_PositionSBP(leftpos,rightpos);
   ;	
	jmp	short @30@290
@30@290:
   ;	
   ;			break;
   ;		}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_SD_SetPosition	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SD_PlayDigitized	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	SD_PlayDigitized(word which,int leftpos,int rightpos)
   ;	{
   ;		word	len;
   ;		memptr	addr;
   ;	
   ;	
	cmp	word ptr DGROUP:_DigiMode,0
	jne	short @31@74
   ;	
   ;		if (!DigiMode)
   ;	
	jmp	@31@266
@31@74:
   ;	
   ;			return;
   ;	
   ;	
	call	near ptr _SD_StopDigitized
   ;	
   ;		SD_StopDigitized();
   ;	
	mov	ax,word ptr [bp+4]
	cmp	ax,word ptr DGROUP:_NumDigi
	jb	short @31@122
   ;	
   ;		if (which >= NumDigi)
   ;	
	mov	ax,offset DGROUP:s@+190
	push	ax
	call	near ptr _Quit
	pop	cx
@31@122:
   ;	
   ;			Quit("SD_PlayDigitized: bad sound number");
   ;	
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	near ptr _SD_SetPosition
	pop	cx
	pop	cx
   ;	
   ;		SD_SetPosition(leftpos,rightpos);
   ;	
   ;	
	mov	bx,word ptr [bp+4]
	shl	bx,1
	shl	bx,1
	mov	es,word ptr DGROUP:_DigiList
	mov	ax,word ptr es:[bx]
	mov	word ptr DGROUP:_DigiPage,ax
   ;	
   ;		DigiPage = DigiList[(which * 2) + 0];
   ;	
	mov	bx,word ptr [bp+4]
	shl	bx,1
	inc	bx
	shl	bx,1
	mov	es,word ptr DGROUP:_DigiList
	mov	ax,word ptr es:[bx]
	mov	word ptr DGROUP:_DigiLeft,ax
   ;	
   ;		DigiLeft = DigiList[(which * 2) + 1];
   ;	
   ;	
	mov	ax,word ptr DGROUP:_DigiPage
	mov	word ptr DGROUP:_DigiLastStart,ax
   ;	
   ;		DigiLastStart = DigiPage;
   ;	
	mov	ax,word ptr DGROUP:_DigiLeft
	add	ax,4095
	mov	cl,12
	shr	ax,cl
	mov	dx,word ptr DGROUP:_DigiPage
	add	dx,ax
	mov	word ptr DGROUP:_DigiLastEnd,dx
   ;	
   ;		DigiLastEnd = DigiPage + ((DigiLeft + (PMPageSize - 1)) / PMPageSize);
   ;	
   ;	
	cmp	word ptr DGROUP:_DigiLeft,4096
	jb	short @31@170
	mov	ax,4096
	jmp	short @31@194
@31@170:
	mov	ax,word ptr DGROUP:_DigiLeft
	and	ax,4095
@31@194:
	mov	si,ax
   ;	
   ;		len = (DigiLeft >= PMPageSize)? PMPageSize : (DigiLeft % PMPageSize);
   ;	
	mov	ax,word ptr DGROUP:_DigiPage
	inc	word ptr DGROUP:_DigiPage
	push	ax
	call	near ptr _SDL_LoadDigiSegment
	pop	cx
	mov	di,ax
   ;	
   ;		addr = SDL_LoadDigiSegment(DigiPage++);
   ;	
   ;	
	mov	word ptr DGROUP:_DigiPlaying,1
   ;	
   ;		DigiPlaying = true;
   ;	
	mov	word ptr DGROUP:DigiLastSegment,0
   ;	
   ;		DigiLastSegment = false;
   ;	
   ;	
	push	si
	push	di
	call	near ptr _SDL_PlayDigiSegment
	pop	cx
	pop	cx
   ;	
   ;		SDL_PlayDigiSegment(addr,len);
   ;	
	sub	word ptr DGROUP:_DigiLeft,si
   ;	
   ;		DigiLeft -= len;
   ;	
	cmp	word ptr DGROUP:_DigiLeft,0
	jne	short @31@242
   ;	
   ;		if (!DigiLeft)
   ;	
	mov	word ptr DGROUP:DigiLastSegment,1
@31@242:
   ;	
   ;			DigiLastSegment = true;
   ;	
   ;	
	call	near ptr _SD_Poll
@31@266:
   ;	
   ;		SD_Poll();
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_SD_PlayDigitized	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SDL_DigitizedDone	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SDL_DigitizedDone(void)
   ;	{
   ;	
	cmp	word ptr DGROUP:DigiNextAddr,0
	je	short @32@74
   ;	
   ;		if (DigiNextAddr)
   ;		{
   ;	
	push	word ptr DGROUP:DigiNextLen
	push	word ptr DGROUP:DigiNextAddr
	call	near ptr _SDL_PlayDigiSegment
	pop	cx
	pop	cx
   ;	
   ;			SDL_PlayDigiSegment(DigiNextAddr,DigiNextLen);
   ;	
	mov	word ptr DGROUP:DigiNextAddr,0
   ;	
   ;			DigiNextAddr = nil;
   ;	
	mov	word ptr DGROUP:DigiMissed,0
   ;	
   ;			DigiMissed = false;
   ;	
	jmp	short @32@242
@32@74:
   ;	
   ;		}
   ;		else
   ;		{
   ;	
	cmp	word ptr DGROUP:DigiLastSegment,0
	je	short @32@218
   ;	
   ;			if (DigiLastSegment)
   ;			{
   ;	
	mov	word ptr DGROUP:_DigiPlaying,0
   ;	
   ;				DigiPlaying = false;
   ;	
	mov	word ptr DGROUP:DigiLastSegment,0
   ;	
   ;				DigiLastSegment = false;
   ;	
	cmp	word ptr DGROUP:_DigiMode,1
	jne	short @32@170
	cmp	word ptr DGROUP:_SoundMode,1
	jne	short @32@170
   ;	
   ;				if ((DigiMode == sds_PC) && (SoundMode == sdm_PC))
   ;				{
   ;	
	xor	ax,ax
	mov	word ptr DGROUP:_SoundPriority,ax
	mov	word ptr DGROUP:_SoundNumber,ax
   ;	
   ;					SDL_SoundFinished();
   ;	
	jmp	short @32@194
@32@170:
   ;	
   ;				}
   ;				else
   ;	
	xor	ax,ax
	mov	word ptr DGROUP:_DigiPriority,ax
	mov	word ptr DGROUP:_DigiNumber,ax
@32@194:
   ;	
   ;					DigiNumber = DigiPriority = 0;
   ;	
	mov	word ptr DGROUP:_SoundPositioned,0
   ;	
   ;				SoundPositioned = false;
   ;	
	jmp	short @32@242
@32@218:
   ;	
   ;			}
   ;			else
   ;	
	mov	word ptr DGROUP:DigiMissed,1
@32@242:
   ;	
   ;				DigiMissed = true;
   ;		}
   ;	
	pop	bp
	ret	
_SDL_DigitizedDone	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SD_SetDigiDevice	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	SD_SetDigiDevice(SDSMode mode)
   ;	{
   ;		boolean	devicenotpresent;
   ;	
   ;	
	cmp	di,word ptr DGROUP:_DigiMode
	jne	short @33@74
   ;	
   ;		if (mode == DigiMode)
   ;	
	jmp	short @33@530
@33@74:
   ;	
   ;			return;
   ;	
   ;	
	call	near ptr _SD_StopDigitized
   ;	
   ;		SD_StopDigitized();
   ;	
   ;	
	xor	si,si
   ;	
   ;		devicenotpresent = false;
   ;	
	mov	ax,di
	cmp	ax,2
	je	short @33@314
	cmp	ax,3
	je	short @33@194
	jmp	short @33@386
@33@194:
   ;	
   ;		switch (mode)
   ;		{
   ;		case sds_SoundBlaster:
   ;	
	cmp	word ptr DGROUP:_SoundBlasterPresent,0
	jne	short @33@290
   ;	
   ;			if (!SoundBlasterPresent)
   ;			{
   ;	
	cmp	word ptr DGROUP:_SoundSourcePresent,0
	je	short @33@266
   ;	
   ;				if (SoundSourcePresent)
   ;	
	mov	di,2
	jmp	short @33@290
@33@266:
   ;	
   ;					mode = sds_SoundSource;
   ;				else
   ;	
	mov	si,1
@33@290:
   ;	
   ;					devicenotpresent = true;
   ;			}
   ;	
	jmp	short @33@386
@33@314:
   ;	
   ;			break;
   ;		case sds_SoundSource:
   ;	
	cmp	word ptr DGROUP:_SoundSourcePresent,0
	jne	short @33@362
   ;	
   ;			if (!SoundSourcePresent)
   ;	
	mov	si,1
@33@362:
   ;	
   ;				devicenotpresent = true;
   ;	
	jmp	short @33@386
@33@386:
   ;	
   ;			break;
   ;		}
   ;	
   ;	
	or	si,si
	jne	short @33@530
   ;	
   ;		if (!devicenotpresent)
   ;		{
   ;	
	cmp	word ptr DGROUP:_DigiMode,2
	jne	short @33@458
   ;	
   ;			if (DigiMode == sds_SoundSource)
   ;	
	call	near ptr SDL_ShutSS
@33@458:
   ;	
   ;				SDL_ShutSS();
   ;	
   ;	
	mov	word ptr DGROUP:_DigiMode,di
   ;	
   ;			DigiMode = mode;
   ;	
   ;	
	cmp	di,2
	jne	short @33@506
   ;	
   ;			if (mode == sds_SoundSource)
   ;	
	call	near ptr SDL_StartSS
@33@506:
   ;	
   ;				SDL_StartSS();
   ;	
   ;	
	call	near ptr SDL_SetTimerSpeed
@33@530:
   ;	
   ;			SDL_SetTimerSpeed();
   ;		}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_SD_SetDigiDevice	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SDL_SetupDigi	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
	push	di
   ;	
   ;	SDL_SetupDigi(void)
   ;	{
   ;		memptr	list;
   ;		word	far *p,
   ;				pg;
   ;		int		i;
   ;	
   ;	
	mov	ax,3
	push	ax
	call	near ptr _PM_SetMainMemPurge
	pop	cx
   ;	
   ;		PM_UnlockMainMem();
   ;	
	xor	ax,ax
	mov	dx,4096
	push	ax
	push	dx
	lea	ax,word ptr [bp-2]
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;		MM_GetPtr(&list,PMPageSize);
   ;	
	call	near ptr _PM_CheckMainMem
   ;	
   ;		PM_CheckMainMem();
   ;	
	mov	ax,word ptr DGROUP:_ChunksInFile
	dec	ax
	push	ax
	call	near ptr _PM_GetPage
	pop	cx
	mov	word ptr [bp-6],0
	mov	word ptr [bp-4],ax
   ;	
   ;		p = (word far *)MK_FP(PM_GetPage(ChunksInFile - 1),0);
   ;	
	mov	ax,4096
	push	ax
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	push	word ptr [bp-2]
	xor	ax,ax
	push	ax
	call	near ptr __fmemcpy
	add	sp,10
   ;	
   ;		_fmemcpy((void far *)list,(void far *)p,PMPageSize);
   ;	
	mov	di,word ptr DGROUP:_PMSoundStart
   ;	
   ;		pg = PMSoundStart;
   ;	
	xor	si,si
	jmp	short @34@146
@34@50:
   ;	
   ;		for (i = 0;i < PMPageSize / (sizeof(word) * 2);i++,p += 2)
   ;		{
   ;	
	mov	ax,word ptr DGROUP:_ChunksInFile
	dec	ax
	cmp	ax,di
	ja	short @34@98
   ;	
   ;			if (pg >= ChunksInFile - 1)
   ;	
	jmp	short @34@170
@34@98:
   ;	
   ;				break;
   ;	
	les	bx,dword ptr [bp-6]
	mov	ax,word ptr es:[bx+2]
	add	ax,4095
	mov	cl,12
	shr	ax,cl
	add	di,ax
	inc	si
	add	word ptr [bp-6],4
@34@146:
	cmp	si,1024
	jl	short @34@50
@34@170:
   ;	
   ;			pg += (p[1] + (PMPageSize - 1)) / PMPageSize;
   ;		}
   ;	
	mov	ax,3
	push	ax
	call	near ptr _PM_SetMainMemPurge
	pop	cx
   ;	
   ;		PM_UnlockMainMem();
   ;	
	mov	ax,si
	shl	ax,1
	shl	ax,1
	xor	dx,dx
	push	dx
	push	ax
	mov	ax,offset DGROUP:_DigiList
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;		MM_GetPtr((memptr *)&DigiList,i * sizeof(word) * 2);
   ;	
	mov	ax,si
	shl	ax,1
	shl	ax,1
	push	ax
	push	word ptr [bp-2]
	xor	ax,ax
	push	ax
	push	word ptr DGROUP:_DigiList
	xor	ax,ax
	push	ax
	call	near ptr __fmemcpy
	add	sp,10
   ;	
   ;		_fmemcpy((void far *)DigiList,(void far *)list,i * sizeof(word) * 2);
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
   ;	
   ;		MM_FreePtr(&list);
   ;	
	mov	word ptr DGROUP:_NumDigi,si
   ;	
   ;		NumDigi = i;
   ;	
   ;	
	xor	si,si
	jmp	short @34@242
@34@194:
   ;	
   ;		for (i = 0;i < LASTSOUND;i++)
   ;	
	mov	bx,si
	shl	bx,1
	mov	word ptr DGROUP:_DigiMap[bx],65535
	inc	si
@34@242:
	cmp	si,87
	jl	short @34@194
   ;	
   ;			DigiMap[i] = -1;
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_SDL_SetupDigi	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_alOut	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	alOut(byte n,byte b)
   ;	{
   ;	
		pushf	
   ;	
   ;	asm	pushf
   ;	
		cli	
   ;	
   ;	asm	cli
   ;	
   ;	
		mov		dx,0388H
   ;	
   ;	asm	mov	dx,0x388
   ;	
		mov		al,[[bp+4]]
   ;	
   ;	asm	mov	al,[n]
   ;	
		out		dx,al
   ;	
   ;	asm	out	dx,al
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		inc		dx
   ;	
   ;	asm	inc	dx
   ;	
		mov		al,[[bp+6]]
   ;	
   ;	asm	mov	al,[b]
   ;	
		out		dx,al
   ;	
   ;	asm	out	dx,al
   ;	
   ;	
		popf	
   ;	
   ;	asm	popf
   ;	
   ;	
		dec		dx
   ;	
   ;	asm	dec	dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
	pop	bp
	ret	
_alOut	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_ALStopSound	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	#endif
   ;	SDL_ALStopSound(void)
   ;	
		pushf	
   ;	
   ;	{
   ;	
		cli	
   ;	
   ;	asm	pushf
   ;	asm	cli
   ;	
	mov	word ptr DGROUP:_alSound,0
	mov	word ptr DGROUP:_alSound+2,0
   ;	
   ;	
   ;	
	mov	al,0
	push	ax
	mov	al,176
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		(long)alSound = 0;
   ;		alOut(alFreqH + 0,0);
   ;	
		popf	
   ;	
   ;	
   ;	
	pop	bp
	ret	
SDL_ALStopSound	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_AlSetFXInst	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
   ;	
   ;	SDL_AlSetFXInst(Instrument far *inst)
   ;	{
   ;		byte		c,m;
   ;	
   ;	
	mov	al,byte ptr DGROUP:modifiers
	mov	byte ptr [bp-2],al
   ;	
   ;		m = modifiers[0];
   ;	
	mov	al,byte ptr DGROUP:carriers
	mov	byte ptr [bp-1],al
   ;	
   ;		c = carriers[0];
   ;	
	les	bx,dword ptr [bp+4]
	mov	al,byte ptr es:[bx]
	push	ax
	mov	al,byte ptr [bp-2]
	add	al,32
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(m + alChar,inst->mChar);
   ;	
	les	bx,dword ptr [bp+4]
	mov	al,byte ptr es:[bx+2]
	push	ax
	mov	al,byte ptr [bp-2]
	add	al,64
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(m + alScale,inst->mScale);
   ;	
	les	bx,dword ptr [bp+4]
	mov	al,byte ptr es:[bx+4]
	push	ax
	mov	al,byte ptr [bp-2]
	add	al,96
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(m + alAttack,inst->mAttack);
   ;	
	les	bx,dword ptr [bp+4]
	mov	al,byte ptr es:[bx+6]
	push	ax
	mov	al,byte ptr [bp-2]
	add	al,128
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(m + alSus,inst->mSus);
   ;	
	les	bx,dword ptr [bp+4]
	mov	al,byte ptr es:[bx+8]
	push	ax
	mov	al,byte ptr [bp-2]
	add	al,224
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(m + alWave,inst->mWave);
   ;	
	les	bx,dword ptr [bp+4]
	mov	al,byte ptr es:[bx+1]
	push	ax
	mov	al,byte ptr [bp-1]
	add	al,32
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(c + alChar,inst->cChar);
   ;	
	les	bx,dword ptr [bp+4]
	mov	al,byte ptr es:[bx+3]
	push	ax
	mov	al,byte ptr [bp-1]
	add	al,64
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(c + alScale,inst->cScale);
   ;	
	les	bx,dword ptr [bp+4]
	mov	al,byte ptr es:[bx+5]
	push	ax
	mov	al,byte ptr [bp-1]
	add	al,96
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(c + alAttack,inst->cAttack);
   ;	
	les	bx,dword ptr [bp+4]
	mov	al,byte ptr es:[bx+7]
	push	ax
	mov	al,byte ptr [bp-1]
	add	al,128
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(c + alSus,inst->cSus);
   ;	
	les	bx,dword ptr [bp+4]
	mov	al,byte ptr es:[bx+9]
	push	ax
	mov	al,byte ptr [bp-1]
	add	al,224
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(c + alWave,inst->cWave);
   ;	
   ;		// Note: Switch commenting on these lines for old MUSE compatibility
   ;	//	alOut(alFeedCon,inst->nConn);
   ;	
	mov	al,0
	push	ax
	mov	al,192
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(alFeedCon,0);
   ;	
	mov	sp,bp
	pop	bp
	ret	
SDL_AlSetFXInst	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_ALPlaySound	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
   ;	
   ;	#endif
   ;	SDL_ALPlaySound(AdLibSound far *sound)
   ;	{
   ;		Instrument	far *inst;
   ;		byte		huge *data;
   ;	
	call	near ptr SDL_ALStopSound
   ;	
   ;	
   ;		SDL_ALStopSound();
   ;	
		pushf	
   ;	
   ;	
   ;	
		cli	
   ;	
   ;	asm	pushf
   ;	asm	cli
   ;	
	les	bx,dword ptr [bp+4]
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	mov	word ptr DGROUP:_alLengthLeft,dx
	mov	word ptr DGROUP:_alLengthLeft+2,ax
   ;	
   ;	
   ;	
	mov	ax,word ptr [bp+6]
	mov	dx,word ptr [bp+4]
	add	dx,23
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;		alLengthLeft = sound->common.length;
   ;	
	xor	cx,cx
	mov	bx,1
	mov	dx,ss
	lea	ax,word ptr [bp-8]
	call	near ptr N_PADA@
   ;	
   ;		data = sound->data;
   ;	
	xor	cx,cx
	mov	bx,1
	mov	dx,ss
	lea	ax,word ptr [bp-8]
	call	near ptr N_PSBA@
   ;	
   ;		data++;
   ;	
	mov	ax,word ptr [bp-6]
	mov	dx,word ptr [bp-8]
	mov	word ptr DGROUP:_alSound,dx
	mov	word ptr DGROUP:_alSound+2,ax
   ;	
   ;		data--;
   ;	
	les	bx,dword ptr [bp+4]
	mov	al,byte ptr es:[bx+22]
	mov	ah,0
	and	ax,7
	shl	ax,1
	shl	ax,1
	or	ax,32
	mov	word ptr DGROUP:_alBlock,ax
   ;	
   ;		alSound = (byte far *)data;
   ;	
	mov	ax,word ptr [bp+6]
	mov	dx,word ptr [bp+4]
	add	dx,6
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;		alBlock = ((sound->block & 7) << 2) | 0x20;
   ;		inst = &sound->inst;
   ;	
	les	bx,dword ptr [bp-4]
	mov	al,byte ptr es:[bx+6]
	les	bx,dword ptr [bp-4]
	or	al,byte ptr es:[bx+7]
	mov	ah,0
	or	ax,ax
	jne	short @38@170
   ;	
   ;	
   ;		if (!(inst->mSus | inst->cSus))
   ;	
		popf	
   ;	
   ;		{
   ;	
	mov	ax,offset DGROUP:s@+225
	push	ax
	call	near ptr _Quit
	pop	cx
@38@170:
   ;	
   ;		asm	popf
   ;			Quit("SDL_ALPlaySound() - Bad instrument");
   ;		}
   ;	
	push	ds
	mov	ax,offset DGROUP:_alZeroInst
	push	ax
	call	near ptr SDL_AlSetFXInst
	pop	cx
	pop	cx
   ;	
   ;	
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr SDL_AlSetFXInst
	pop	cx
	pop	cx
   ;	
   ;		SDL_AlSetFXInst(&alZeroInst);	// DEBUG
   ;		SDL_AlSetFXInst(inst);
   ;	
		popf	
   ;	
   ;	
   ;	
	mov	sp,bp
	pop	bp
	ret	
SDL_ALPlaySound	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_ShutAL	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SDL_ShutAL(void)
   ;	{
   ;	
		pushf	
   ;	
   ;	asm	pushf
   ;	
		cli	
   ;	
   ;	asm	cli
   ;	
   ;	
	mov	al,0
	push	ax
	mov	al,189
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(alEffects,0);
   ;	
	mov	al,0
	push	ax
	mov	al,176
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(alFreqH + 0,0);
   ;	
	push	ds
	mov	ax,offset DGROUP:_alZeroInst
	push	ax
	call	near ptr SDL_AlSetFXInst
	pop	cx
	pop	cx
   ;	
   ;		SDL_AlSetFXInst(&alZeroInst);
   ;	
	mov	word ptr DGROUP:_alSound,0
	mov	word ptr DGROUP:_alSound+2,0
   ;	
   ;		alSound = 0;
   ;	
   ;	
		popf	
   ;	
   ;	asm	popf
   ;	
	pop	bp
	ret	
SDL_ShutAL	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_CleanAL	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
   ;	
   ;	SDL_CleanAL(void)
   ;	{
   ;		int	i;
   ;	
   ;	
		pushf	
   ;	
   ;	asm	pushf
   ;	
		cli	
   ;	
   ;	asm	cli
   ;	
   ;	
	mov	al,0
	push	ax
	mov	al,189
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(alEffects,0);
   ;	
	mov	word ptr [bp-2],1
	jmp	short @40@146
@40@98:
   ;	
   ;		for (i = 1;i < 0xf5;i++)
   ;	
	mov	al,0
	push	ax
	mov	al,byte ptr [bp-2]
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
	inc	word ptr [bp-2]
@40@146:
	cmp	word ptr [bp-2],245
	jl	short @40@98
   ;	
   ;			alOut(i,0);
   ;	
   ;	
		popf	
   ;	
   ;	asm	popf
   ;	
	mov	sp,bp
	pop	bp
	ret	
SDL_CleanAL	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_StartAL	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SDL_StartAL(void)
   ;	{
   ;	
	mov	word ptr DGROUP:alFXReg,0
   ;	
   ;		alFXReg = 0;
   ;	
	mov	al,byte ptr DGROUP:alFXReg
	push	ax
	mov	al,189
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(alEffects,alFXReg);
   ;	
	push	ds
	mov	ax,offset DGROUP:_alZeroInst
	push	ax
	call	near ptr SDL_AlSetFXInst
	pop	cx
	pop	cx
   ;	
   ;		SDL_AlSetFXInst(&alZeroInst);
   ;	
	pop	bp
	ret	
SDL_StartAL	endp
   ;	
   ;	static boolean
   ;	
	assume	cs:_TEXT
SDL_DetectAdLib	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;	SDL_DetectAdLib(void)
   ;	{
   ;		byte	status1,status2;
   ;		int		i;
   ;	
   ;	
	mov	al,96
	push	ax
	mov	al,4
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(4,0x60);	// Reset T1 & T2
   ;	
	mov	al,128
	push	ax
	mov	al,4
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(4,0x80);	// Reset IRQ
   ;	
	mov	dx,904
	in	al,dx
	mov	byte ptr [bp-1],al
   ;	
   ;		status1 = readstat();
   ;	
	mov	al,255
	push	ax
	mov	al,2
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(2,0xff);	// Set timer 1
   ;	
	mov	al,33
	push	ax
	mov	al,4
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(4,0x21);	// Start timer 1
   ;	#if 0
   ;		SDL_Delay(TimerDelay100);
   ;	#else
   ;	
		mov		dx,0388H
   ;	
   ;	asm	mov	dx,0x388
   ;	
		mov		cx,100
@42@98:
   ;	
   ;	asm	mov	cx,100
   ;	usecloop:
   ;	
		in		al,dx
   ;	
   ;	asm	in	al,dx
   ;	
	loop	short @42@98
   ;	
   ;	asm	loop usecloop
   ;	#endif
   ;	
   ;	
	mov	dx,904
	in	al,dx
	mov	byte ptr [bp-2],al
   ;	
   ;		status2 = readstat();
   ;	
	mov	al,96
	push	ax
	mov	al,4
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(4,0x60);
   ;	
	mov	al,128
	push	ax
	mov	al,4
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;		alOut(4,0x80);
   ;	
   ;	
	test	byte ptr [bp-1],224
	jne	short @42@338
	mov	al,byte ptr [bp-2]
	mov	ah,0
	and	ax,224
	cmp	ax,192
	jne	short @42@338
   ;	
   ;		if (((status1 & 0xe0) == 0x00) && ((status2 & 0xe0) == 0xc0))
   ;		{
   ;	
	mov	word ptr [bp-4],1
	jmp	short @42@266
@42@218:
   ;	
   ;			for (i = 1;i <= 0xf5;i++)	// Zero all the registers
   ;	
	mov	al,0
	push	ax
	mov	al,byte ptr [bp-4]
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
	inc	word ptr [bp-4]
@42@266:
	cmp	word ptr [bp-4],245
	jle	short @42@218
   ;	
   ;				alOut(i,0);
   ;	
   ;	
	mov	al,32
	push	ax
	mov	al,1
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;			alOut(1,0x20);	// Set WSE=1
   ;	
	mov	al,0
	push	ax
	mov	al,8
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;			alOut(8,0);		// Set CSM=0 & SEL=0
   ;	
   ;	
	mov	ax,1
	jmp	short @42@362
   ;	
   ;			return(true);
   ;	
	jmp	short @42@362
@42@338:
   ;	
   ;		}
   ;		else
   ;	
	xor	ax,ax
	jmp	short @42@362
@42@362:
   ;	
   ;			return(false);
   ;	
	mov	sp,bp
	pop	bp
	ret	
SDL_DetectAdLib	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_ShutDevice	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SDL_ShutDevice(void)
   ;	{
   ;	
	mov	ax,word ptr DGROUP:_SoundMode
	cmp	ax,1
	je	short @43@122
	cmp	ax,2
	je	short @43@146
	jmp	short @43@170
@43@122:
   ;	
   ;		switch (SoundMode)
   ;		{
   ;		case sdm_PC:
   ;	
	call	near ptr SDL_ShutPC
   ;	
   ;			SDL_ShutPC();
   ;	
	jmp	short @43@170
@43@146:
   ;	
   ;			break;
   ;		case sdm_AdLib:
   ;	
	call	near ptr SDL_ShutAL
   ;	
   ;			SDL_ShutAL();
   ;	
	jmp	short @43@170
@43@170:
   ;	
   ;			break;
   ;		}
   ;	
	mov	word ptr DGROUP:_SoundMode,0
   ;	
   ;		SoundMode = sdm_Off;
   ;	
	pop	bp
	ret	
SDL_ShutDevice	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_CleanDevice	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SDL_CleanDevice(void)
   ;	{
   ;	
	cmp	word ptr DGROUP:_SoundMode,2
	je	short @44@74
	cmp	word ptr DGROUP:_MusicMode,1
	jne	short @44@98
@44@74:
   ;	
   ;		if ((SoundMode == sdm_AdLib) || (MusicMode == smm_AdLib))
   ;	
	call	near ptr SDL_CleanAL
@44@98:
   ;	
   ;			SDL_CleanAL();
   ;	
	pop	bp
	ret	
SDL_CleanDevice	endp
   ;	
   ;	static void
   ;	
	assume	cs:_TEXT
SDL_StartDevice	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SDL_StartDevice(void)
   ;	{
   ;	
	mov	ax,word ptr DGROUP:_SoundMode
	cmp	ax,2
	je	short @45@98
	jmp	short @45@122
@45@98:
   ;	
   ;		switch (SoundMode)
   ;		{
   ;		case sdm_AdLib:
   ;	
	call	near ptr SDL_StartAL
   ;	
   ;			SDL_StartAL();
   ;	
	jmp	short @45@122
@45@122:
   ;	
   ;			break;
   ;		}
   ;	
	xor	ax,ax
	mov	word ptr DGROUP:_SoundPriority,ax
	mov	word ptr DGROUP:_SoundNumber,ax
   ;	
   ;		SoundNumber = SoundPriority = 0;
   ;	
	pop	bp
	ret	
SDL_StartDevice	endp
   ;	
   ;	boolean
   ;	
	assume	cs:_TEXT
_SD_SetSoundMode	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	SD_SetSoundMode(SDMode mode)
   ;	{
   ;	
	xor	si,si
   ;	
   ;		boolean	result = false;
   ;		word	tableoffset;
   ;	
   ;	
	call	near ptr _SD_StopSound
   ;	
   ;		SD_StopSound();
   ;	
   ;	#ifndef	_MUSE_
   ;	
	cmp	di,2
	jne	short @46@98
	cmp	word ptr DGROUP:_AdLibPresent,0
	jne	short @46@98
   ;	
   ;		if ((mode == sdm_AdLib) && !AdLibPresent)
   ;	
	mov	di,1
@46@98:
   ;	
   ;			mode = sdm_PC;
   ;	
   ;	
	mov	ax,di
	or	ax,ax
	je	short @46@218
	cmp	ax,1
	je	short @46@242
	cmp	ax,2
	je	short @46@266
	jmp	short @46@338
@46@218:
   ;	
   ;		switch (mode)
   ;		{
   ;		case sdm_Off:
   ;	
	mov	word ptr DGROUP:_NeedsDigitized,0
   ;	
   ;			NeedsDigitized = false;
   ;	
	mov	si,1
   ;	
   ;			result = true;
   ;	
	jmp	short @46@338
@46@242:
   ;	
   ;			break;
   ;		case sdm_PC:
   ;	
	mov	word ptr [bp-2],0
   ;	
   ;			tableoffset = STARTPCSOUNDS;
   ;	
	mov	word ptr DGROUP:_NeedsDigitized,0
   ;	
   ;			NeedsDigitized = false;
   ;	
	mov	si,1
   ;	
   ;			result = true;
   ;	
	jmp	short @46@338
@46@266:
   ;	
   ;			break;
   ;		case sdm_AdLib:
   ;	
	cmp	word ptr DGROUP:_AdLibPresent,0
	je	short @46@314
   ;	
   ;			if (AdLibPresent)
   ;			{
   ;	
	mov	word ptr [bp-2],87
   ;	
   ;				tableoffset = STARTADLIBSOUNDS;
   ;	
	mov	word ptr DGROUP:_NeedsDigitized,0
   ;	
   ;				NeedsDigitized = false;
   ;	
	mov	si,1
@46@314:
   ;	
   ;				result = true;
   ;			}
   ;	
	jmp	short @46@338
@46@338:
   ;	
   ;			break;
   ;		}
   ;	#else
   ;		result = true;
   ;	#endif
   ;	
   ;	
	or	si,si
	je	short @46@410
	cmp	di,word ptr DGROUP:_SoundMode
	je	short @46@410
   ;	
   ;		if (result && (mode != SoundMode))
   ;		{
   ;	
	call	near ptr SDL_ShutDevice
   ;	
   ;			SDL_ShutDevice();
   ;	
	mov	word ptr DGROUP:_SoundMode,di
   ;	
   ;			SoundMode = mode;
   ;	#ifndef	_MUSE_
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,1
	add	ax,offset DGROUP:_audiosegs
	mov	word ptr DGROUP:_SoundTable,ax
   ;	
   ;			SoundTable = (word *)(&audiosegs[tableoffset]);
   ;	#endif
   ;	
	call	near ptr SDL_StartDevice
@46@410:
   ;	
   ;			SDL_StartDevice();
   ;		}
   ;	
   ;	
	call	near ptr SDL_SetTimerSpeed
   ;	
   ;		SDL_SetTimerSpeed();
   ;	
   ;	
	mov	ax,si
	jmp	short @46@434
@46@434:
   ;	
   ;		return(result);
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_SD_SetSoundMode	endp
   ;	
   ;	boolean
   ;	
	assume	cs:_TEXT
_SD_SetMusicMode	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	SD_SetMusicMode(SMMode mode)
   ;	{
   ;	
	xor	si,si
   ;	
   ;		boolean	result = false;
   ;	
   ;	
	call	near ptr _SD_FadeOutMusic
	jmp	short @47@50
@47@50:
   ;	
   ;		SD_FadeOutMusic();
   ;	
	call	near ptr _SD_MusicPlaying
	or	ax,ax
	jne	short @47@50
   ;	
   ;		while (SD_MusicPlaying())
   ;			;
   ;	
   ;	
	mov	ax,word ptr [bp+4]
	or	ax,ax
	je	short @47@170
	cmp	ax,1
	je	short @47@194
	jmp	short @47@266
@47@170:
   ;	
   ;		switch (mode)
   ;		{
   ;		case smm_Off:
   ;	
	mov	word ptr DGROUP:_NeedsMusic,0
   ;	
   ;			NeedsMusic = false;
   ;	
	mov	si,1
   ;	
   ;			result = true;
   ;	
	jmp	short @47@266
@47@194:
   ;	
   ;			break;
   ;		case smm_AdLib:
   ;	
	cmp	word ptr DGROUP:_AdLibPresent,0
	je	short @47@242
   ;	
   ;			if (AdLibPresent)
   ;			{
   ;	
	mov	word ptr DGROUP:_NeedsMusic,1
   ;	
   ;				NeedsMusic = true;
   ;	
	mov	si,1
@47@242:
   ;	
   ;				result = true;
   ;			}
   ;	
	jmp	short @47@266
@47@266:
   ;	
   ;			break;
   ;		}
   ;	
   ;	
	or	si,si
	je	short @47@314
   ;	
   ;		if (result)
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:_MusicMode,ax
@47@314:
   ;	
   ;			MusicMode = mode;
   ;	
   ;	
	call	near ptr SDL_SetTimerSpeed
   ;	
   ;		SDL_SetTimerSpeed();
   ;	
   ;	
	mov	ax,si
	jmp	short @47@338
@47@338:
   ;	
   ;		return(result);
   ;	
	pop	si
	pop	bp
	ret	
_SD_SetMusicMode	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SD_Startup	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
	push	di
   ;	
   ;	SD_Startup(void)
   ;	{
   ;		int	i;
   ;	
   ;	
	cmp	word ptr DGROUP:SD_Started,0
	je	short @48@74
   ;	
   ;		if (SD_Started)
   ;	
	jmp	@48@1850
@48@74:
   ;	
   ;			return;
   ;	
   ;	
	call	near ptr _SDL_SetDS
   ;	
   ;		SDL_SetDS();
   ;	
   ;	
	mov	word ptr DGROUP:_ssIsTandy,0
   ;	
   ;		ssIsTandy = false;
   ;	
	mov	word ptr DGROUP:_ssNoCheck,0
   ;	
   ;		ssNoCheck = false;
   ;	
	mov	word ptr DGROUP:_alNoCheck,0
   ;	
   ;		alNoCheck = false;
   ;	
	mov	word ptr DGROUP:sbNoCheck,0
   ;	
   ;		sbNoCheck = false;
   ;	
	mov	word ptr DGROUP:sbNoProCheck,0
   ;	
   ;		sbNoProCheck = false;
   ;	#ifndef	_MUSE_
   ;	
	mov	si,1
	jmp	@48@386
@48@98:
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
	mov	bx,ax
	cmp	bx,7
	ja	short @48@362
	shl	bx,1
	jmp	word ptr cs:@48@C6212[bx]
@48@170:
   ;	
   ;			switch (US_CheckParm(_argv[i],ParmStrings))
   ;			{
   ;			case 0:						// No AdLib detection
   ;	
	mov	word ptr DGROUP:_alNoCheck,1
   ;	
   ;				alNoCheck = true;
   ;	
	jmp	short @48@362
@48@194:
   ;	
   ;				break;
   ;			case 1:						// No SoundBlaster detection
   ;	
	mov	word ptr DGROUP:sbNoCheck,1
   ;	
   ;				sbNoCheck = true;
   ;	
	jmp	short @48@362
@48@218:
   ;	
   ;				break;
   ;			case 2:						// No SoundBlaster Pro detection
   ;	
	mov	word ptr DGROUP:sbNoProCheck,1
   ;	
   ;				sbNoProCheck = true;
   ;	
	jmp	short @48@362
@48@242:
   ;	
   ;				break;
   ;			case 3:
   ;	
	mov	word ptr DGROUP:_ssNoCheck,1
   ;	
   ;				ssNoCheck = true;		// No Sound Source detection
   ;	
	jmp	short @48@362
@48@266:
   ;	
   ;				break;
   ;			case 4:						// Tandy Sound Source handling
   ;	
	mov	word ptr DGROUP:_ssIsTandy,1
   ;	
   ;				ssIsTandy = true;
   ;	
	jmp	short @48@362
@48@290:
   ;	
   ;				break;
   ;			case 5:						// Sound Source present at LPT1
   ;	
	mov	word ptr DGROUP:_ssPort,1
   ;	
   ;				ssPort = 1;
   ;	
	mov	ax,1
	mov	word ptr DGROUP:_SoundSourcePresent,ax
	mov	word ptr DGROUP:_ssNoCheck,ax
   ;	
   ;				ssNoCheck = SoundSourcePresent = true;
   ;	
	jmp	short @48@362
@48@314:
   ;	
   ;				break;
   ;			case 6:                     // Sound Source present at LPT2
   ;	
	mov	word ptr DGROUP:_ssPort,2
   ;	
   ;				ssPort = 2;
   ;	
	mov	ax,1
	mov	word ptr DGROUP:_SoundSourcePresent,ax
	mov	word ptr DGROUP:_ssNoCheck,ax
   ;	
   ;				ssNoCheck = SoundSourcePresent = true;
   ;	
	jmp	short @48@362
@48@338:
   ;	
   ;				break;
   ;			case 7:                     // Sound Source present at LPT3
   ;	
	mov	word ptr DGROUP:_ssPort,3
   ;	
   ;				ssPort = 3;
   ;	
	mov	ax,1
	mov	word ptr DGROUP:_SoundSourcePresent,ax
	mov	word ptr DGROUP:_ssNoCheck,ax
   ;	
   ;				ssNoCheck = SoundSourcePresent = true;
   ;	
	jmp	short @48@362
@48@362:
	inc	si
@48@386:
	cmp	si,word ptr DGROUP:__argc
	jge	@@1
	jmp	@48@98
@@1:
   ;	
   ;				break;
   ;			}
   ;		}
   ;	#endif
   ;	
   ;	
	mov	word ptr DGROUP:SoundUserHook,0
   ;	
   ;		SoundUserHook = 0;
   ;	
   ;	
	mov	ax,8
	push	ax
	call	near ptr _getvect
	pop	cx
	mov	word ptr DGROUP:_t0OldService,ax
	mov	word ptr DGROUP:_t0OldService+2,dx
   ;	
   ;		t0OldService = getvect(8);	// Get old timer 0 ISR
   ;	
   ;	
	xor	ax,ax
	xor	dx,dx
	mov	word ptr DGROUP:_alTimeCount,dx
	mov	word ptr DGROUP:_alTimeCount+2,ax
	mov	word ptr DGROUP:_TimeCount,dx
	mov	word ptr DGROUP:_TimeCount+2,ax
	mov	word ptr DGROUP:_LocalTime,dx
	mov	word ptr DGROUP:_LocalTime+2,ax
   ;	
   ;		LocalTime = TimeCount = alTimeCount = 0;
   ;	
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _SD_SetSoundMode
	pop	cx
   ;	
   ;		SD_SetSoundMode(sdm_Off);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _SD_SetMusicMode
	pop	cx
   ;	
   ;		SD_SetMusicMode(smm_Off);
   ;	
   ;	
	cmp	word ptr DGROUP:_ssNoCheck,0
	jne	short @48@458
   ;	
   ;		if (!ssNoCheck)
   ;	
	call	near ptr SDL_DetectSoundSource
	mov	word ptr DGROUP:_SoundSourcePresent,ax
@48@458:
   ;	
   ;			SoundSourcePresent = SDL_DetectSoundSource();
   ;	
   ;	
	cmp	word ptr DGROUP:_alNoCheck,0
	je	@@2
	jmp	@48@1682
@@2:
   ;	
   ;		if (!alNoCheck)
   ;		{
   ;	
	call	near ptr SDL_DetectAdLib
	mov	word ptr DGROUP:_AdLibPresent,ax
   ;	
   ;			AdLibPresent = SDL_DetectAdLib();
   ;	
	cmp	word ptr DGROUP:_AdLibPresent,0
	jne	@@3
	jmp	@48@1682
@@3:
	cmp	word ptr DGROUP:sbNoCheck,0
	je	@@4
	jmp	@48@1682
@@4:
   ;	
   ;			if (AdLibPresent && !sbNoCheck)
   ;			{
   ;	
	mov	di,65535
   ;	
   ;				int port = -1;
   ;	
	mov	ax,offset DGROUP:s@+260
	push	ax
	call	near ptr _getenv
	pop	cx
	mov	word ptr [bp-2],ax
   ;	
   ;				char *env = getenv("BLASTER");
   ;	
	cmp	word ptr [bp-2],0
	jne	@@5
	jmp	@48@1658
@@5:
	jmp	@48@1634
@48@578:
	jmp	short @48@626
@48@602:
   ;	
   ;				if (env)
   ;				{
   ;					long temp;
   ;					while (*env)
   ;					{
   ;						while (isspace(*env))
   ;	
	inc	word ptr [bp-2]
@48@626:
	mov	bx,word ptr [bp-2]
	mov	al,byte ptr [bx]
	cbw	
	mov	bx,ax
	mov	al,byte ptr DGROUP:__ctype[bx+1]
	cbw	
	test	ax,1
	jne	short @48@602
   ;	
   ;							env++;
   ;	
   ;	
	mov	bx,word ptr [bp-2]
	mov	al,byte ptr [bx]
	cbw	
	push	ax
	call	near ptr _toupper
	pop	cx
	cmp	ax,65
	je	short @48@770
	cmp	ax,68
	jne	@@6
	jmp	@48@1250
@@6:
	cmp	ax,73
	je	short @48@1010
	jmp	@48@1442
@48@770:
   ;	
   ;						switch (toupper(*env))
   ;						{
   ;						case 'A':
   ;	
	mov	ax,16
	push	ax
	lea	ax,word ptr [bp-2]
	push	ax
	mov	ax,word ptr [bp-2]
	inc	ax
	push	ax
	call	near ptr _strtol
	add	sp,6
	mov	word ptr [bp-6],ax
	mov	word ptr [bp-4],dx
   ;	
   ;							temp = strtol(env + 1,&env,16);
   ;	
   ;	
   ;							if
   ;							(
   ;								(temp >= 0x210)
   ;							&&	(temp <= 0x260)
   ;							&&	(!(temp & 0x00f))
   ;	
	cmp	word ptr [bp-4],0
	jl	short @48@962
	jne	short @48@842
	cmp	word ptr [bp-6],528
	jb	short @48@962
@48@842:
	cmp	word ptr [bp-4],0
	jg	short @48@962
	jne	short @48@914
	cmp	word ptr [bp-6],608
	ja	short @48@962
@48@914:
	mov	ax,word ptr [bp-4]
	mov	dx,word ptr [bp-6]
	and	dx,15
	and	ax,0
	or	dx,ax
	jne	short @48@962
   ;	
   ;							)
   ;	
	mov	dx,word ptr [bp-4]
	mov	ax,word ptr [bp-6]
	add	ax,65024
	adc	dx,65535
	mov	cl,4
	call	near ptr N_LXRSH@
	mov	di,ax
	jmp	short @48@986
@48@962:
   ;	
   ;								port = (temp - 0x200) >> 4;
   ;							else
   ;	
	mov	ax,offset DGROUP:s@+268
	push	ax
	call	near ptr _Quit
	pop	cx
@48@986:
   ;	
   ;								Quit("SD_Startup: Unsupported address value in BLASTER");
   ;	
	jmp	@48@1634
@48@1010:
   ;	
   ;							break;
   ;						case 'I':
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-2]
	push	ax
	mov	ax,word ptr [bp-2]
	inc	ax
	push	ax
	call	near ptr _strtol
	add	sp,6
	mov	word ptr [bp-6],ax
	mov	word ptr [bp-4],dx
   ;	
   ;							temp = strtol(env + 1,&env,10);
   ;	
   ;	
   ;							if
   ;							(
   ;								(temp >= 0)
   ;							&&	(temp <= 10)
   ;							&&	(sbIntVectors[temp] != -1)
   ;	
	cmp	word ptr [bp-4],0
	jl	short @48@1202
	jne	short @48@1082
	cmp	word ptr [bp-6],0
	jb	short @48@1202
@48@1082:
	cmp	word ptr [bp-4],0
	jg	short @48@1202
	jne	short @48@1154
	cmp	word ptr [bp-6],10
	ja	short @48@1202
@48@1154:
	mov	bx,word ptr [bp-6]
	shl	bx,1
	cmp	word ptr DGROUP:sbIntVectors[bx],65535
	je	short @48@1202
   ;	
   ;							)
   ;							{
   ;	
	mov	ax,word ptr [bp-6]
	mov	word ptr DGROUP:sbInterrupt,ax
   ;	
   ;								sbInterrupt = temp;
   ;	
	mov	bx,word ptr DGROUP:sbInterrupt
	shl	bx,1
	mov	ax,word ptr DGROUP:sbIntVectors[bx]
	mov	word ptr DGROUP:sbIntVec,ax
   ;	
   ;								sbIntVec = sbIntVectors[sbInterrupt];
   ;	
	jmp	short @48@1226
@48@1202:
   ;	
   ;							}
   ;							else
   ;	
	mov	ax,offset DGROUP:s@+317
	push	ax
	call	near ptr _Quit
	pop	cx
@48@1226:
   ;	
   ;								Quit("SD_Startup: Unsupported interrupt value in BLASTER");
   ;	
	jmp	@48@1634
@48@1250:
   ;	
   ;							break;
   ;						case 'D':
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-2]
	push	ax
	mov	ax,word ptr [bp-2]
	inc	ax
	push	ax
	call	near ptr _strtol
	add	sp,6
	mov	word ptr [bp-6],ax
	mov	word ptr [bp-4],dx
   ;	
   ;							temp = strtol(env + 1,&env,10);
   ;	
	mov	ax,word ptr [bp-6]
	or	ax,word ptr [bp-4]
	je	short @48@1370
	cmp	word ptr [bp-4],0
	jne	short @48@1322
	cmp	word ptr [bp-6],1
	je	short @48@1370
@48@1322:
	cmp	word ptr [bp-4],0
	jne	short @48@1394
	cmp	word ptr [bp-6],3
	jne	short @48@1394
@48@1370:
   ;	
   ;							if ((temp == 0) || (temp == 1) || (temp == 3))
   ;	
	mov	al,byte ptr [bp-6]
	push	ax
	call	near ptr _SDL_SBSetDMA
	pop	cx
	jmp	short @48@1418
@48@1394:
   ;	
   ;								SDL_SBSetDMA(temp);
   ;							else
   ;	
	mov	ax,offset DGROUP:s@+368
	push	ax
	call	near ptr _Quit
	pop	cx
@48@1418:
   ;	
   ;								Quit("SD_Startup: Unsupported DMA value in BLASTER");
   ;	
	jmp	short @48@1634
@48@1442:
	jmp	short @48@1490
@48@1466:
   ;	
   ;							break;
   ;						default:
   ;							while (isspace(*env))
   ;	
	inc	word ptr [bp-2]
@48@1490:
	mov	bx,word ptr [bp-2]
	mov	al,byte ptr [bx]
	cbw	
	mov	bx,ax
	mov	al,byte ptr DGROUP:__ctype[bx+1]
	cbw	
	test	ax,1
	jne	short @48@1466
	jmp	short @48@1562
@48@1538:
   ;	
   ;								env++;
   ;							while (*env && !isspace(*env))
   ;	
	inc	word ptr [bp-2]
@48@1562:
	mov	bx,word ptr [bp-2]
	cmp	byte ptr [bx],0
	je	short @48@1610
	mov	bx,word ptr [bp-2]
	mov	al,byte ptr [bx]
	cbw	
	mov	bx,ax
	mov	al,byte ptr DGROUP:__ctype[bx+1]
	cbw	
	test	ax,1
	je	short @48@1538
@48@1610:
   ;	
   ;								env++;
   ;	
	jmp	short @48@1634
@48@1634:
	mov	bx,word ptr [bp-2]
	cmp	byte ptr [bx],0
	je	@@7
	jmp	@48@578
@@7:
@48@1658:
   ;	
   ;							break;
   ;						}
   ;					}
   ;				}
   ;	
	push	di
	call	near ptr SDL_DetectSoundBlaster
	pop	cx
	mov	word ptr DGROUP:_SoundBlasterPresent,ax
@48@1682:
   ;	
   ;				SoundBlasterPresent = SDL_DetectSoundBlaster(port);
   ;			}
   ;		}
   ;	
   ;	
	xor	si,si
	jmp	short @48@1754
@48@1706:
   ;	
   ;		for (i = 0;i < 255;i++)
   ;	
	mov	ax,si
	mov	dx,60
	imul	dx
	mov	bx,si
	shl	bx,1
	mov	word ptr DGROUP:_pcSoundLookup[bx],ax
	inc	si
@48@1754:
	cmp	si,255
	jl	short @48@1706
   ;	
   ;			pcSoundLookup[i] = i * 60;
   ;	
   ;	
	cmp	word ptr DGROUP:_SoundBlasterPresent,0
	je	short @48@1826
   ;	
   ;		if (SoundBlasterPresent)
   ;	
	call	near ptr SDL_StartSB
@48@1826:
   ;	
   ;			SDL_StartSB();
   ;	
   ;	
	call	near ptr _SDL_SetupDigi
   ;	
   ;		SDL_SetupDigi();
   ;	
   ;	
	mov	word ptr DGROUP:SD_Started,1
@48@1850:
   ;	
   ;		SD_Started = true;
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_SD_Startup	endp
@48@C6212	label	word
	dw	@48@170
	dw	@48@194
	dw	@48@218
	dw	@48@242
	dw	@48@266
	dw	@48@290
	dw	@48@314
	dw	@48@338
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SD_Default	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	SD_Default(boolean gotit,SDMode sd,SMMode sm)
   ;	{
   ;		boolean	gotsd,gotsm;
   ;	
   ;	
	mov	ax,word ptr [bp+4]
	mov	si,ax
	mov	di,ax
   ;	
   ;		gotsd = gotsm = gotit;
   ;	
   ;	
	or	di,di
	je	short @49@146
   ;	
   ;		if (gotsd)	// Make sure requested sound hardware is available
   ;		{
   ;	
	mov	ax,word ptr [bp+6]
	cmp	ax,2
	je	short @49@122
	jmp	short @49@146
@49@122:
   ;	
   ;			switch (sd)
   ;			{
   ;			case sdm_AdLib:
   ;	
	mov	di,word ptr DGROUP:_AdLibPresent
   ;	
   ;				gotsd = AdLibPresent;
   ;	
	jmp	short @49@146
@49@146:
   ;	
   ;				break;
   ;			}
   ;		}
   ;	
	or	di,di
	jne	short @49@242
   ;	
   ;		if (!gotsd)
   ;		{
   ;	
	cmp	word ptr DGROUP:_AdLibPresent,0
	je	short @49@218
   ;	
   ;			if (AdLibPresent)
   ;	
	mov	word ptr [bp+6],2
	jmp	short @49@242
@49@218:
   ;	
   ;				sd = sdm_AdLib;
   ;			else
   ;	
	mov	word ptr [bp+6],1
@49@242:
   ;	
   ;				sd = sdm_PC;
   ;		}
   ;	
	mov	ax,word ptr [bp+6]
	cmp	ax,word ptr DGROUP:_SoundMode
	je	short @49@290
   ;	
   ;		if (sd != SoundMode)
   ;	
	push	word ptr [bp+6]
	call	near ptr _SD_SetSoundMode
	pop	cx
@49@290:
   ;	
   ;			SD_SetSoundMode(sd);
   ;	
   ;	
   ;	
	or	si,si
	je	short @49@410
   ;	
   ;		if (gotsm)	// Make sure requested music hardware is available
   ;		{
   ;	
	mov	ax,word ptr [bp+8]
	cmp	ax,2
	je	short @49@386
	jmp	short @49@410
@49@386:
   ;	
   ;			switch (sm)
   ;			{
   ;			case sdm_AdLib:
   ;	
	mov	si,word ptr DGROUP:_AdLibPresent
   ;	
   ;				gotsm = AdLibPresent;
   ;	
	jmp	short @49@410
@49@410:
   ;	
   ;				break;
   ;			}
   ;		}
   ;	
	or	si,si
	jne	short @49@482
   ;	
   ;		if (!gotsm)
   ;		{
   ;	
	cmp	word ptr DGROUP:_AdLibPresent,0
	je	short @49@482
   ;	
   ;			if (AdLibPresent)
   ;	
	mov	word ptr [bp+8],1
@49@482:
   ;	
   ;				sm = smm_AdLib;
   ;		}
   ;	
	mov	ax,word ptr [bp+8]
	cmp	ax,word ptr DGROUP:_MusicMode
	je	short @49@530
   ;	
   ;		if (sm != MusicMode)
   ;	
	push	word ptr [bp+8]
	call	near ptr _SD_SetMusicMode
	pop	cx
@49@530:
   ;	
   ;			SD_SetMusicMode(sm);
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_SD_Default	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SD_Shutdown	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SD_Shutdown(void)
   ;	{
   ;	
	cmp	word ptr DGROUP:SD_Started,0
	jne	short @50@74
   ;	
   ;		if (!SD_Started)
   ;	
	jmp	short @50@290
@50@74:
   ;	
   ;			return;
   ;	
   ;	
	call	near ptr _SD_MusicOff
   ;	
   ;		SD_MusicOff();
   ;	
	call	near ptr _SD_StopSound
   ;	
   ;		SD_StopSound();
   ;	
	call	near ptr SDL_ShutDevice
   ;	
   ;		SDL_ShutDevice();
   ;	
	call	near ptr SDL_CleanDevice
   ;	
   ;		SDL_CleanDevice();
   ;	
   ;	
	cmp	word ptr DGROUP:_SoundBlasterPresent,0
	je	short @50@122
   ;	
   ;		if (SoundBlasterPresent)
   ;	
	call	near ptr SDL_ShutSB
@50@122:
   ;	
   ;			SDL_ShutSB();
   ;	
   ;	
	cmp	word ptr DGROUP:_SoundSourcePresent,0
	je	short @50@170
   ;	
   ;		if (SoundSourcePresent)
   ;	
	call	near ptr SDL_ShutSS
@50@170:
   ;	
   ;			SDL_ShutSS();
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
	xor	ax,ax
	push	ax
	call	near ptr SDL_SetTimer0
	pop	cx
   ;	
   ;		SDL_SetTimer0(0);
   ;	
   ;	
	push	word ptr DGROUP:_t0OldService+2
	push	word ptr DGROUP:_t0OldService
	mov	ax,8
	push	ax
	call	near ptr _setvect
	add	sp,6
   ;	
   ;		setvect(8,t0OldService);
   ;	
   ;	
		popf	
   ;	
   ;		asm	popf
   ;	
   ;	
	mov	word ptr DGROUP:SD_Started,0
@50@290:
   ;	
   ;		SD_Started = false;
   ;	
	pop	bp
	ret	
_SD_Shutdown	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SD_SetUserHook	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SD_SetUserHook(void (* hook)(void))
   ;	{
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:SoundUserHook,ax
   ;	
   ;		SoundUserHook = hook;
   ;	
	pop	bp
	ret	
_SD_SetUserHook	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SD_PositionSound	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SD_PositionSound(int leftvol,int rightvol)
   ;	{
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:_LeftPosition,ax
   ;	
   ;		LeftPosition = leftvol;
   ;	
	mov	ax,word ptr [bp+6]
	mov	word ptr DGROUP:_RightPosition,ax
   ;	
   ;		RightPosition = rightvol;
   ;	
	mov	word ptr DGROUP:_nextsoundpos,1
   ;	
   ;		nextsoundpos = true;
   ;	
	pop	bp
	ret	
_SD_PositionSound	endp
   ;	
   ;	boolean
   ;	
	assume	cs:_TEXT
_SD_PlaySound	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	SD_PlaySound(soundnames sound)
   ;	{
   ;		boolean		ispos;
   ;		SoundCommon	far *s;
   ;		int	lp,rp;
   ;	
   ;	
	mov	ax,word ptr DGROUP:_LeftPosition
	mov	word ptr [bp-8],ax
   ;	
   ;		lp = LeftPosition;
   ;	
	mov	di,word ptr DGROUP:_RightPosition
   ;	
   ;		rp = RightPosition;
   ;	
	mov	word ptr DGROUP:_LeftPosition,0
   ;	
   ;		LeftPosition = 0;
   ;	
	mov	word ptr DGROUP:_RightPosition,0
   ;	
   ;		RightPosition = 0;
   ;	
   ;	
	mov	ax,word ptr DGROUP:_nextsoundpos
	mov	word ptr [bp-2],ax
   ;	
   ;		ispos = nextsoundpos;
   ;	
	mov	word ptr DGROUP:_nextsoundpos,0
   ;	
   ;		nextsoundpos = false;
   ;	
   ;	
	cmp	si,65535
	jne	short @53@74
   ;	
   ;		if (sound == -1)
   ;	
	xor	ax,ax
	jmp	@53@890
@53@74:
   ;	
   ;			return(false);
   ;	
   ;	
	mov	ax,si
	shl	ax,1
	mov	bx,word ptr DGROUP:_SoundTable
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-6],0
	mov	word ptr [bp-4],ax
   ;	
   ;		s = MK_FP(SoundTable[sound],0);
   ;	
	cmp	word ptr DGROUP:_SoundMode,0
	je	short @53@146
	mov	ax,word ptr [bp-6]
	or	ax,word ptr [bp-4]
	jne	short @53@146
   ;	
   ;		if ((SoundMode != sdm_Off) && !s)
   ;	
	mov	ax,offset DGROUP:s@+413
	push	ax
	call	near ptr _Quit
	pop	cx
@53@146:
   ;	
   ;			Quit("SD_PlaySound() - Uncached sound");
   ;	
   ;	
	cmp	word ptr DGROUP:_DigiMode,0
	jne	@@8
	jmp	@53@578
@@8:
	mov	bx,si
	shl	bx,1
	cmp	word ptr DGROUP:_DigiMap[bx],65535
	jne	@@9
	jmp	@53@578
@@9:
   ;	
   ;		if ((DigiMode != sds_Off) && (DigiMap[sound] != -1))
   ;		{
   ;	
	cmp	word ptr DGROUP:_DigiMode,1
	jne	short @53@314
	cmp	word ptr DGROUP:_SoundMode,1
	jne	short @53@314
   ;	
   ;			if ((DigiMode == sds_PC) && (SoundMode == sdm_PC))
   ;			{
   ;	
	les	bx,dword ptr [bp-6]
	mov	ax,word ptr es:[bx+4]
	cmp	ax,word ptr DGROUP:_SoundPriority
	jae	short @53@290
   ;	
   ;				if (s->priority < SoundPriority)
   ;	
	xor	ax,ax
	jmp	@53@890
@53@290:
   ;	
   ;					return(false);
   ;	
   ;	
	call	near ptr SDL_PCStopSound
   ;	
   ;				SDL_PCStopSound();
   ;	
   ;	
	push	di
	push	word ptr [bp-8]
	mov	bx,si
	shl	bx,1
	push	word ptr DGROUP:_DigiMap[bx]
	call	near ptr _SD_PlayDigitized
	add	sp,6
   ;	
   ;				SD_PlayDigitized(DigiMap[sound],lp,rp);
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr DGROUP:_SoundPositioned,ax
   ;	
   ;				SoundPositioned = ispos;
   ;	
	mov	word ptr DGROUP:_SoundNumber,si
   ;	
   ;				SoundNumber = sound;
   ;	
	les	bx,dword ptr [bp-6]
	mov	ax,word ptr es:[bx+4]
	mov	word ptr DGROUP:_SoundPriority,ax
   ;	
   ;				SoundPriority = s->priority;
   ;	
	jmp	short @53@554
@53@314:
   ;	
   ;			}
   ;			else
   ;			{
   ;	
		pushf	
   ;	
   ;			asm	pushf
   ;	
		cli	
   ;	
   ;			asm	cli
   ;	
	cmp	word ptr DGROUP:_DigiPriority,0
	je	short @53@458
	cmp	word ptr DGROUP:_DigiNumber,0
	jne	short @53@458
   ;	
   ;				if (DigiPriority && !DigiNumber)
   ;				{
   ;	
		popf	
   ;	
   ;				asm	popf
   ;	
	mov	ax,offset DGROUP:s@+445
	push	ax
	call	near ptr _Quit
	pop	cx
@53@458:
   ;	
   ;					Quit("SD_PlaySound: Priority without a sound");
   ;				}
   ;	
		popf	
   ;	
   ;			asm	popf
   ;	
   ;	
	les	bx,dword ptr [bp-6]
	mov	ax,word ptr es:[bx+4]
	cmp	ax,word ptr DGROUP:_DigiPriority
	jae	short @53@530
   ;	
   ;				if (s->priority < DigiPriority)
   ;	
	xor	ax,ax
	jmp	@53@890
@53@530:
   ;	
   ;					return(false);
   ;	
   ;	
	push	di
	push	word ptr [bp-8]
	mov	bx,si
	shl	bx,1
	push	word ptr DGROUP:_DigiMap[bx]
	call	near ptr _SD_PlayDigitized
	add	sp,6
   ;	
   ;				SD_PlayDigitized(DigiMap[sound],lp,rp);
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr DGROUP:_SoundPositioned,ax
   ;	
   ;				SoundPositioned = ispos;
   ;	
	mov	word ptr DGROUP:_DigiNumber,si
   ;	
   ;				DigiNumber = sound;
   ;	
	les	bx,dword ptr [bp-6]
	mov	ax,word ptr es:[bx+4]
	mov	word ptr DGROUP:_DigiPriority,ax
@53@554:
   ;	
   ;				DigiPriority = s->priority;
   ;			}
   ;	
   ;	
	mov	ax,1
	jmp	short @53@890
@53@578:
   ;	
   ;			return(true);
   ;		}
   ;	
   ;	
	cmp	word ptr DGROUP:_SoundMode,0
	jne	short @53@626
   ;	
   ;		if (SoundMode == sdm_Off)
   ;	
	xor	ax,ax
	jmp	short @53@890
@53@626:
   ;	
   ;			return(false);
   ;	
	les	bx,dword ptr [bp-6]
	mov	ax,word ptr es:[bx]
	or	ax,word ptr es:[bx+2]
	jne	short @53@674
   ;	
   ;		if (!s->length)
   ;	
	mov	ax,offset DGROUP:s@+484
	push	ax
	call	near ptr _Quit
	pop	cx
@53@674:
   ;	
   ;			Quit("SD_PlaySound() - Zero length sound");
   ;	
	les	bx,dword ptr [bp-6]
	mov	ax,word ptr es:[bx+4]
	cmp	ax,word ptr DGROUP:_SoundPriority
	jae	short @53@722
   ;	
   ;		if (s->priority < SoundPriority)
   ;	
	xor	ax,ax
	jmp	short @53@890
@53@722:
   ;	
   ;			return(false);
   ;	
   ;	
	mov	ax,word ptr DGROUP:_SoundMode
	cmp	ax,1
	je	short @53@818
	cmp	ax,2
	je	short @53@842
	jmp	short @53@866
@53@818:
   ;	
   ;		switch (SoundMode)
   ;		{
   ;		case sdm_PC:
   ;	
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	call	near ptr SDL_PCPlaySound
	pop	cx
	pop	cx
   ;	
   ;			SDL_PCPlaySound((void far *)s);
   ;	
	jmp	short @53@866
@53@842:
   ;	
   ;			break;
   ;		case sdm_AdLib:
   ;	
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	call	near ptr SDL_ALPlaySound
	pop	cx
	pop	cx
   ;	
   ;			SDL_ALPlaySound((void far *)s);
   ;	
	jmp	short @53@866
@53@866:
   ;	
   ;			break;
   ;		}
   ;	
   ;	
	mov	word ptr DGROUP:_SoundNumber,si
   ;	
   ;		SoundNumber = sound;
   ;	
	les	bx,dword ptr [bp-6]
	mov	ax,word ptr es:[bx+4]
	mov	word ptr DGROUP:_SoundPriority,ax
   ;	
   ;		SoundPriority = s->priority;
   ;	
   ;	
	xor	ax,ax
	jmp	short @53@890
@53@890:
   ;	
   ;		return(false);
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_SD_PlaySound	endp
   ;	
   ;	word
   ;	
	assume	cs:_TEXT
_SD_SoundPlaying	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	SD_SoundPlaying(void)
   ;	{
   ;	
	xor	si,si
   ;	
   ;		boolean	result = false;
   ;	
   ;	
	mov	ax,word ptr DGROUP:_SoundMode
	cmp	ax,1
	je	short @54@146
	cmp	ax,2
	je	short @54@242
	jmp	short @54@338
@54@146:
   ;	
   ;		switch (SoundMode)
   ;		{
   ;		case sdm_PC:
   ;	
	mov	ax,word ptr DGROUP:_pcSound
	or	ax,word ptr DGROUP:_pcSound+2
	je	short @54@194
	mov	ax,1
	jmp	short @54@218
@54@194:
	xor	ax,ax
@54@218:
	mov	si,ax
   ;	
   ;			result = pcSound? true : false;
   ;	
	jmp	short @54@338
@54@242:
   ;	
   ;			break;
   ;		case sdm_AdLib:
   ;	
	mov	ax,word ptr DGROUP:_alSound
	or	ax,word ptr DGROUP:_alSound+2
	je	short @54@290
	mov	ax,1
	jmp	short @54@314
@54@290:
	xor	ax,ax
@54@314:
	mov	si,ax
   ;	
   ;			result = alSound? true : false;
   ;	
	jmp	short @54@338
@54@338:
   ;	
   ;			break;
   ;		}
   ;	
   ;	
	or	si,si
	je	short @54@410
   ;	
   ;		if (result)
   ;	
	mov	ax,word ptr DGROUP:_SoundNumber
	jmp	short @54@434
	jmp	short @54@434
@54@410:
   ;	
   ;			return(SoundNumber);
   ;		else
   ;	
	xor	ax,ax
	jmp	short @54@434
@54@434:
   ;	
   ;			return(false);
   ;	
	pop	si
	pop	bp
	ret	
_SD_SoundPlaying	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SD_StopSound	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SD_StopSound(void)
   ;	{
   ;	
	cmp	word ptr DGROUP:_DigiPlaying,0
	je	short @55@74
   ;	
   ;		if (DigiPlaying)
   ;	
	call	near ptr _SD_StopDigitized
@55@74:
   ;	
   ;			SD_StopDigitized();
   ;	
   ;	
	mov	ax,word ptr DGROUP:_SoundMode
	cmp	ax,1
	je	short @55@170
	cmp	ax,2
	je	short @55@194
	jmp	short @55@218
@55@170:
   ;	
   ;		switch (SoundMode)
   ;		{
   ;		case sdm_PC:
   ;	
	call	near ptr SDL_PCStopSound
   ;	
   ;			SDL_PCStopSound();
   ;	
	jmp	short @55@218
@55@194:
   ;	
   ;			break;
   ;		case sdm_AdLib:
   ;	
	call	near ptr SDL_ALStopSound
   ;	
   ;			SDL_ALStopSound();
   ;	
	jmp	short @55@218
@55@218:
   ;	
   ;			break;
   ;		}
   ;	
   ;	
	mov	word ptr DGROUP:_SoundPositioned,0
   ;	
   ;		SoundPositioned = false;
   ;	
   ;	
	xor	ax,ax
	mov	word ptr DGROUP:_SoundPriority,ax
	mov	word ptr DGROUP:_SoundNumber,ax
   ;	
   ;		SDL_SoundFinished();
   ;	
	pop	bp
	ret	
_SD_StopSound	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SD_WaitSoundDone	proc	near
	push	bp
	mov	bp,sp
	jmp	short @56@50
@56@50:
   ;	
   ;	SD_WaitSoundDone(void)
   ;	{
   ;	
	call	near ptr _SD_SoundPlaying
	or	ax,ax
	jne	short @56@50
   ;	
   ;		while (SD_SoundPlaying())
   ;			;
   ;	
	pop	bp
	ret	
_SD_WaitSoundDone	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SD_MusicOn	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SD_MusicOn(void)
   ;	{
   ;	
	mov	word ptr DGROUP:_sqActive,1
   ;	
   ;		sqActive = true;
   ;	
	pop	bp
	ret	
_SD_MusicOn	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SD_MusicOff	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
   ;	
   ;	SD_MusicOff(void)
   ;	{
   ;		word	i;
   ;	
   ;	
   ;	
	mov	ax,word ptr DGROUP:_MusicMode
	cmp	ax,1
	je	short @58@98
	jmp	short @58@218
@58@98:
   ;	
   ;		switch (MusicMode)
   ;		{
   ;		case smm_AdLib:
   ;	
	mov	word ptr DGROUP:alFXReg,0
   ;	
   ;			alFXReg = 0;
   ;	
	mov	al,0
	push	ax
	mov	al,189
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
   ;	
   ;			alOut(alEffects,0);
   ;	
	mov	word ptr [bp-2],0
	jmp	short @58@170
@58@122:
   ;	
   ;			for (i = 0;i < sqMaxTracks;i++)
   ;	
	mov	al,0
	push	ax
	mov	al,byte ptr [bp-2]
	add	al,177
	push	ax
	call	near ptr _alOut
	pop	cx
	pop	cx
	inc	word ptr [bp-2]
@58@170:
	cmp	word ptr [bp-2],10
	jb	short @58@122
   ;	
   ;				alOut(alFreqH + i + 1,0);
   ;	
	jmp	short @58@218
@58@218:
   ;	
   ;			break;
   ;		}
   ;	
	mov	word ptr DGROUP:_sqActive,0
   ;	
   ;		sqActive = false;
   ;	
	mov	sp,bp
	pop	bp
	ret	
_SD_MusicOff	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SD_StartMusic	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SD_StartMusic(MusicGroup far *music)
   ;	{
   ;	
	call	near ptr _SD_MusicOff
   ;	
   ;		SD_MusicOff();
   ;	
		pushf	
   ;	
   ;	asm	pushf
   ;	
		cli	
   ;	
   ;	asm	cli
   ;	
   ;	
	cmp	word ptr DGROUP:_MusicMode,1
	jne	short @59@146
   ;	
   ;		if (MusicMode == smm_AdLib)
   ;		{
   ;	
	mov	ax,word ptr [bp+6]
	mov	dx,word ptr [bp+4]
	inc	dx
	inc	dx
	mov	word ptr DGROUP:_sqHack,dx
	mov	word ptr DGROUP:_sqHack+2,ax
	mov	word ptr DGROUP:_sqHackPtr,dx
	mov	word ptr DGROUP:_sqHackPtr+2,ax
   ;	
   ;			sqHackPtr = sqHack = music->values;
   ;	
	les	bx,dword ptr [bp+4]
	mov	ax,word ptr es:[bx]
	mov	word ptr DGROUP:_sqHackLen,ax
	mov	word ptr DGROUP:_sqHackSeqLen,ax
   ;	
   ;			sqHackSeqLen = sqHackLen = music->length;
   ;	
	mov	word ptr DGROUP:_sqHackTime,0
	mov	word ptr DGROUP:_sqHackTime+2,0
   ;	
   ;			sqHackTime = 0;
   ;	
	mov	word ptr DGROUP:_alTimeCount,0
	mov	word ptr DGROUP:_alTimeCount+2,0
   ;	
   ;			alTimeCount = 0;
   ;	
	call	near ptr _SD_MusicOn
@59@146:
   ;	
   ;			SD_MusicOn();
   ;		}
   ;	
   ;	
		popf	
   ;	
   ;	asm	popf
   ;	
	pop	bp
	ret	
_SD_StartMusic	endp
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SD_FadeOutMusic	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	SD_FadeOutMusic(void)
   ;	{
   ;	
	mov	ax,word ptr DGROUP:_MusicMode
	cmp	ax,1
	je	short @60@98
	jmp	short @60@122
@60@98:
   ;	
   ;		switch (MusicMode)
   ;		{
   ;		case smm_AdLib:
   ;			// DEBUG - quick hack to turn the music off
   ;	
	call	near ptr _SD_MusicOff
   ;	
   ;			SD_MusicOff();
   ;	
	jmp	short @60@122
@60@122:
   ;	
   ;			break;
   ;		}
   ;	
	pop	bp
	ret	
_SD_FadeOutMusic	endp
   ;	
   ;	boolean
   ;	
	assume	cs:_TEXT
_SD_MusicPlaying	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	SD_MusicPlaying(void)
   ;	{
   ;		boolean	result;
   ;	
   ;	
	mov	ax,word ptr DGROUP:_MusicMode
	cmp	ax,1
	je	short @61@98
	jmp	short @61@122
@61@98:
   ;	
   ;		switch (MusicMode)
   ;		{
   ;		case smm_AdLib:
   ;	
	xor	si,si
   ;	
   ;			result = false;
   ;			// DEBUG - not written
   ;	
	jmp	short @61@146
@61@122:
   ;	
   ;			break;
   ;		default:
   ;	
	xor	si,si
@61@146:
   ;	
   ;			result = false;
   ;		}
   ;	
   ;	
	mov	ax,si
	jmp	short @61@170
@61@170:
   ;	
   ;		return(result);
   ;	
	pop	si
	pop	bp
	ret	
_SD_MusicPlaying	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_RightPosition	label	word
	db	2 dup (?)
_DigiLastStart	label	word
	db	2 dup (?)
DigiLastSegment	label	word
	db	2 dup (?)
sbpOldFMMix	label	byte
	db	1 dup (?)
	db	1 dup (?)
sbNoProCheck	label	word
	db	2 dup (?)
_ssData	label	word
	db	2 dup (?)
sbNextSegLen	label	word
	db	4 dup (?)
_pcSound	label	dword
	db	4 dup (?)
_SoundMode	label	word
	db	2 dup (?)
sbpOldVOCMix	label	byte
	db	1 dup (?)
	db	1 dup (?)
_SBProPresent	label	word
	db	2 dup (?)
_ssNoCheck	label	word
	db	2 dup (?)
_ssIsTandy	label	word
	db	2 dup (?)
_ssSample	label	dword
	db	4 dup (?)
sbOldIntHand	label	dword
	db	4 dup (?)
_LocalTime	label	word
	db	4 dup (?)
sbNextSegPtr	label	dword
	db	4 dup (?)
_ssStatus	label	word
	db	2 dup (?)
_ssActive	label	word
	db	2 dup (?)
_ssControl	label	word
	db	2 dup (?)
_SoundTable	label	word
	db	2 dup (?)
_alBlock	label	word
	db	2 dup (?)
_SoundNumber	label	word
	db	2 dup (?)
alFXReg	label	word
	db	2 dup (?)
_alSound	label	dword
	db	4 dup (?)
_pcLengthLeft	label	word
	db	4 dup (?)
sbSamplePlaying	label	word
	db	2 dup (?)
_ssLengthLeft	label	word
	db	4 dup (?)
_alNoCheck	label	word
	db	2 dup (?)
_pcLastSample	label	byte
	db	1 dup (?)
	db	1 dup (?)
SD_Started	label	word
	db	2 dup (?)
SoundUserHook	label	word
	db	2 dup (?)
_sqHack	label	dword
	db	4 dup (?)
_DigiMap	label	word
	db	174 dup (?)
sqMode	label	word
	db	2 dup (?)
_SoundPriority	label	word
	db	2 dup (?)
_SoundPositioned	label	word
	db	2 dup (?)
_NumDigi	label	word
	db	2 dup (?)
_pcSoundLookup	label	word
	db	510 dup (?)
_DigiMode	label	word
	db	2 dup (?)
_DigiLeft	label	word
	db	2 dup (?)
_alZeroInst	label	word
	db	16 dup (?)
_DigiPage	label	word
	db	2 dup (?)
_t0OldService	label	dword
	db	4 dup (?)
_alLengthLeft	label	word
	db	4 dup (?)
_alTimeCount	label	word
	db	4 dup (?)
_MusicMode	label	word
	db	2 dup (?)
_AdLibPresent	label	word
	db	2 dup (?)
mytracks	label	word
	db	320 dup (?)
_sqHackLen	label	word
	db	2 dup (?)
_DigiList	label	word
	db	2 dup (?)
_ssOn	label	byte
	db	1 dup (?)
	db	1 dup (?)
_DigiNumber	label	word
	db	2 dup (?)
DigiMissed	label	word
	db	2 dup (?)
_HackCount	label	word
	db	2 dup (?)
_TimeCount	label	word
	db	4 dup (?)
_NeedsMusic	label	word
	db	2 dup (?)
sqFadeStep	label	word
	db	2 dup (?)
_sqActive	label	word
	db	2 dup (?)
DigiNextLen	label	word
	db	2 dup (?)
_TimerRate	label	word
	db	2 dup (?)
_SoundSourcePresent	label	word
	db	2 dup (?)
_TimerCount	label	word
	db	4 dup (?)
tracks	label	word
	db	20 dup (?)
_sqHackPtr	label	dword
	db	4 dup (?)
_sqHackTime	label	word
	db	4 dup (?)
DigiNextAddr	label	word
	db	2 dup (?)
_DigiPlaying	label	word
	db	2 dup (?)
_DigiLastEnd	label	word
	db	2 dup (?)
_SoundBlasterPresent	label	word
	db	2 dup (?)
_sqHackSeqLen	label	word
	db	2 dup (?)
_LeftPosition	label	word
	db	2 dup (?)
sbNoCheck	label	word
	db	2 dup (?)
_TimerDivisor	label	word
	db	4 dup (?)
sbSamples	label	dword
	db	4 dup (?)
_ssOff	label	byte
	db	1 dup (?)
	db	1 dup (?)
_DigiPriority	label	word
	db	2 dup (?)
_nextsoundpos	label	word
	db	2 dup (?)
_NeedsDigitized	label	word
	db	2 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'noal'
	db	0
	db	'nosb'
	db	0
	db	'nopro'
	db	0
	db	'noss'
	db	0
	db	'sst'
	db	0
	db	'ss1'
	db	0
	db	'ss2'
	db	0
	db	'ss3'
	db	0
	db	'SDL_SBSetDMA() - invalid SoundBlaster DMA channel'
	db	0
	db	'SDL_StartSB: Illegal or unsupported interrupt number for Soun'
	db	'dBlaster'
	db	0
	db	'SD_SetPosition: Illegal position'
	db	0
	db	'SD_PlayDigitized: bad sound number'
	db	0
	db	'SDL_ALPlaySound() - Bad instrument'
	db	0
	db	'BLASTER'
	db	0
	db	'SD_Startup: Unsupported address value in BLASTER'
	db	0
	db	'SD_Startup: Unsupported interrupt value in BLASTER'
	db	0
	db	'SD_Startup: Unsupported DMA value in BLASTER'
	db	0
	db	'SD_PlaySound() - Uncached sound'
	db	0
	db	'SD_PlaySound: Priority without a sound'
	db	0
	db	'SD_PlaySound() - Zero length sound'
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	public	_NeedsDigitized
	extrn	_PM_SetPageLock:near
	public	_nextsoundpos
	public	_DigiPriority
	public	_ssOff
	extrn	_PMSoundStart:word
	extrn	__fmemcpy:near
_sbSamples	equ	sbSamples
_sba3Vals	equ	sba3Vals
_sba2Vals	equ	sba2Vals
_sba1Vals	equ	sba1Vals
	public	_TimerDivisor
_sbNoCheck	equ	sbNoCheck
	public	_LeftPosition
	public	_SD_WaitSoundDone
	public	_SD_PositionSound
_SDL_SetTimerSpeed	equ	SDL_SetTimerSpeed
_SDL_SetIntsPerSec	equ	SDL_SetIntsPerSec
_SDL_PCStopSample	equ	SDL_PCStopSample
_SDL_PCPlaySample	equ	SDL_PCPlaySample
_SDL_SSPlaySample	equ	SDL_SSPlaySample
_SDL_SSStopSample	equ	SDL_SSStopSample
_SDL_SBPlaySample	equ	SDL_SBPlaySample
_SDL_SBStopSample	equ	SDL_SBStopSample
_SDL_AlSetFXInst	equ	SDL_AlSetFXInst
	public	_sqHackSeqLen
_sbIntVec	equ	sbIntVec
_SDL_ALPlaySound	equ	SDL_ALPlaySound
_SDL_ALStopSound	equ	SDL_ALStopSound
_SDL_PCStopSound	equ	SDL_PCStopSound
_SDL_PCPlaySound	equ	SDL_PCPlaySound
	public	_SD_SoundPlaying
	public	_SD_MusicPlaying
	public	_SoundBlasterPresent
_pmodifiers	equ	pmodifiers
	public	_SD_StopDigitized
	public	_SD_PlayDigitized
	public	_DigiLastEnd
	public	_DigiPlaying
	extrn	_MM_FreePtr:near
	public	_SD_SetDigiDevice
_DigiNextAddr	equ	DigiNextAddr
_SDL_DetectAdLib	equ	SDL_DetectAdLib
	public	_sqHackTime
	public	_SD_FadeOutMusic
	public	_sqHackPtr
_tracks	equ	tracks
	public	_SD_SetUserHook
	public	_SD_SetPosition
_ParmStrings	equ	ParmStrings
	public	_TimerCount
	public	_SoundSourcePresent
_sbDMAa3	equ	sbDMAa3
_sbDMAa2	equ	sbDMAa2
_sbDMAa1	equ	sbDMAa1
	public	_TimerRate
	public	_SD_SetMusicMode
	public	_SD_SetSoundMode
	extrn	_MM_GetPtr:near
_DigiNextLen	equ	DigiNextLen
_SDL_StartDevice	equ	SDL_StartDevice
_SDL_CleanDevice	equ	SDL_CleanDevice
_SDL_SetTimer0	equ	SDL_SetTimer0
	public	_sqActive
_sqFadeStep	equ	sqFadeStep
	public	_NeedsMusic
	extrn	_PM_GetPage:near
	public	_TimeCount
	public	_HackCount
_carriers	equ	carriers
_DigiMissed	equ	DigiMissed
	public	_DigiNumber
_SDL_ShutDevice	equ	SDL_ShutDevice
	public	_ssOn
	public	_DigiList
	public	_sqHackLen
	public	_SD_StartMusic
	extrn	_audiosegs:word
	public	_SDL_SetupDigi
	public	_SD_Shutdown
_mytracks	equ	mytracks
	public	_SD_StopSound
	public	_SD_PlaySound
_SDL_SBPlaySeg	equ	SDL_SBPlaySeg
	public	_AdLibPresent
	public	_MusicMode
_SDL_SSService	equ	SDL_SSService
_SDL_SBService	equ	SDL_SBService
	extrn	_ChunksInFile:word
	public	_alTimeCount
	public	_alLengthLeft
	public	_t0OldService
	public	_DigiPage
	public	_SD_Startup
	public	_alZeroInst
	public	_DigiLeft
	public	_DigiMode
	public	_pcSoundLookup
	extrn	_getenv:near
	extrn	_SDL_IndicatePC:near
	extrn	_setvect:near
	public	_NumDigi
	public	_SD_MusicOff
	extrn	_getvect:near
	public	_SoundPositioned
	public	_SoundPriority
	public	_SD_Default
_SDL_PositionSBP	equ	SDL_PositionSBP
_sbDMA	equ	sbDMA
_sqMode	equ	sqMode
	public	_DigiMap
	public	_sqHack
_SoundUserHook	equ	SoundUserHook
_SD_Started	equ	SD_Started
	extrn	_US_CheckParm:near
	extrn	__argv:word
	extrn	__argc:word
	public	_pcLastSample
	public	_SDL_SBSetDMA
	public	_alNoCheck
_SDL_CheckSS	equ	SDL_CheckSS
_SDL_StartSS	equ	SDL_StartSS
_SDL_StartSB	equ	SDL_StartSB
_SDL_CheckSB	equ	SDL_CheckSB
	public	_ssLengthLeft
_sbSamplePlaying	equ	sbSamplePlaying
	public	_pcLengthLeft
	extrn	_Quit:near
	public	_alSound
	public	_SD_Poll
_SDL_ShutSS	equ	SDL_ShutSS
_SDL_ShutSB	equ	SDL_ShutSB
	extrn	_strtol:near
_SDL_ShutPC	equ	SDL_ShutPC
	public	_SD_MusicOn
_alFXReg	equ	alFXReg
	public	_alOut
_pcarriers	equ	pcarriers
_modifiers	equ	modifiers
	public	_SoundNumber
	public	_alBlock
	public	_SoundTable
	public	_ssControl
	extrn	_SDL_t0ExtremeAsmService:far
	public	_ssActive
_SDL_StartAL	equ	SDL_StartAL
_SDL_CleanAL	equ	SDL_CleanAL
	public	_ssStatus
_sbNextSegPtr	equ	sbNextSegPtr
_sbOldIntMask	equ	sbOldIntMask
	extrn	_PM_SetMainMemPurge:near
_sbIntVectors	equ	sbIntVectors
_SDL_DetectSoundBlaster	equ	SDL_DetectSoundBlaster
	public	_LocalTime
_sbOldIntHand	equ	sbOldIntHand
_SDL_ShutAL	equ	SDL_ShutAL
	public	_ssSample
	public	_ssIsTandy
	extrn	N_LXURSH@:far
	public	_ssNoCheck
	public	_SBProPresent
	extrn	N_LDIV@:far
_sbpOldVOCMix	equ	sbpOldVOCMix
_sbInterrupt	equ	sbInterrupt
	extrn	_SDL_SetDS:near
	public	_SoundMode
_SDL_DetectSoundSource	equ	SDL_DetectSoundSource
	public	_pcSound
_sbNextSegLen	equ	sbNextSegLen
	public	_ssData
	extrn	N_LXRSH@:far
	extrn	N_PCMP@:far
_sbNoProCheck	equ	sbNoProCheck
	public	_SDL_PlayDigiSegment
	public	_SDL_LoadDigiSegment
	public	_ssPort
_sbpOldFMMix	equ	sbpOldFMMix
_DigiLastSegment	equ	DigiLastSegment
_sbLocation	equ	sbLocation
	extrn	_SDL_t0SlowAsmService:near
	extrn	_SDL_t0FastAsmService:near
	extrn	__ctype:byte
	extrn	_toupper:near
	extrn	_PM_CheckMainMem:near
	extrn	N_PADD@:far
	extrn	N_PSBA@:far
	extrn	N_PADA@:far
	public	_DigiLastStart
	public	_RightPosition
	public	_SDL_DigitizedDone
	end
