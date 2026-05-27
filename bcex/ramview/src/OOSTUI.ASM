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
	?debug	S "c:\oostui.cpp"
	?debug	C E98551FE7C0D633A5C6F6F737475692E637070
	?debug	C E98551FE7C0966616E637974642E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
	?debug	C E95337528113443A5C494E434C5544455C737472696E672E68
	?debug	C E98551FE7C086F6F737475692E68
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
   ;	void defaulthalt(void)
   ;	
	assume	cs:_TEXT
@defaulthalt$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	}
   ;	
	pop	bp
	ret	
@defaulthalt$qv	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_sviewhalt	label	word
	dw	@defaulthalt$qv
_DATA	ends
_TEXT	segment byte public 'CODE'
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
	?debug	C E95337528112443A5C494E434C5544455C616C6C6F632E68
	?debug	C E95337528110443A5C494E434C5544455C646F732E68
	?debug	C E98551FE7C0A76746F6F6C732E637070
   ;	
   ;	void fillattr(byte left, byte top, byte right, byte bottom, byte attr)
   ;	
	assume	cs:_TEXT
@fillattr$qucucucucuc	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
   ;	
   ;	{
   ;	    for (byte y = top; y <= bottom; y++)
   ;	
	mov	al,byte ptr [bp+6]
	mov	byte ptr [bp-1],al
	jmp	@2@650
@2@50:
   ;	
   ;	        for (byte x = left; x <= right; x++)
   ;	
	mov	al,byte ptr [bp+4]
	mov	byte ptr [bp-2],al
	jmp	@2@602
@2@74:
   ;	
   ;	        {
   ;	            // position cursor
   ;	            asm  mov	dh, y
   ;	
  	mov		dh, [bp-1]
   ;	
   ;	            asm  dec	dh
   ;	
  	dec		dh
   ;	
   ;	            asm  mov	dl, x
   ;	
  	mov		dl, [bp-2]
   ;	
   ;	            asm  dec	dl
   ;	
  	dec		dl
   ;	
   ;	            asm  xor	bh, bh
   ;	
  	xor		bh, bh
   ;	
   ;	            asm  mov	ah, 0x02
   ;	
  	mov		ah, 002H
   ;	
   ;	            asm  push bp
   ;	
  	push	 bp
   ;	
   ;	            asm  int 0x10
   ;	
  	int	 010H
   ;	
   ;	            asm  pop	bp
   ;	
  	pop		bp
   ;	
   ;	
   ;	            // read character and attribute at cursor
   ;	            asm  xor	bh, bh
   ;	
  	xor		bh, bh
   ;	
   ;	            asm  mov	ah, 0x08
   ;	
  	mov		ah, 008H
   ;	
   ;	            asm  push bp
   ;	
  	push	 bp
   ;	
   ;	            asm  int 0x10
   ;	
  	int	 010H
   ;	
   ;	            asm  pop	bp
   ;	
  	pop		bp
   ;	
   ;	
   ;	            // write character and attribute at cursor
   ;	            asm  xor	bh, bh
   ;	
  	xor		bh, bh
   ;	
   ;	            asm  mov	bl, attr
   ;	
  	mov		bl, [bp+12]
   ;	
   ;	            asm  mov	cx, 1
   ;	
  	mov		cx, 1
   ;	
   ;	            asm  mov	ah, 0x09
   ;	
  	mov		ah, 009H
   ;	
   ;	            asm  push bp
   ;	
  	push	 bp
   ;	
   ;	            asm  int 0x10
   ;	
  	int	 010H
   ;	
   ;	            asm  pop	bp
   ;	
  	pop		bp
	inc	byte ptr [bp-2]
@2@602:
	mov	al,byte ptr [bp-2]
	cmp	al,byte ptr [bp+8]
	ja	@@0
	jmp	@2@74
@@0:
	inc	byte ptr [bp-1]
@2@650:
	mov	al,byte ptr [bp-1]
	cmp	al,byte ptr [bp+10]
	ja	@@1
	jmp	@2@50
@@1:
   ;	
   ;	        }
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
@fillattr$qucucucucuc	endp
	?debug	C E95337528113443A5C494E434C5544455C7374646172672E68
	?debug	C E98551FE7C086D6163726F732E68
_TEXT	ends
_DATA	segment word public 'DATA'
_shadowAttr	label	byte
	db	7
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	TSListBox::TSListBox(int aLeft, int aTop, int aRight, int aBottom, long aRange)
   ;	
	assume	cs:_TEXT
@TSListBox@$bctr$qiiiil	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
	or	si,si
	je	short @3@74
	jmp	short @3@98
@3@74:
	mov	ax,28
	push	ax
	call	near ptr @$bnew$qui
	pop	cx
	mov	si,ax
@3@98:
	or	si,si
	jne	short @3@146
	mov	ax,si
	jmp	short @3@194
@3@146:
	mov	word ptr [si+12],offset @@TSView@
	mov	ax,word ptr [bp+6]
	mov	word ptr [si],ax
	mov	ax,word ptr [bp+8]
	mov	word ptr [si+2],ax
	mov	ax,word ptr [bp+10]
	mov	word ptr [si+4],ax
	mov	ax,word ptr [bp+12]
	mov	word ptr [si+6],ax
	mov	ax,word ptr [bp+10]
	sub	ax,word ptr [bp+6]
	inc	ax
	mov	word ptr [si+8],ax
	mov	ax,word ptr [bp+12]
	sub	ax,word ptr [bp+8]
	inc	ax
	mov	word ptr [si+10],ax
	mov	word ptr [si+12],offset @@TSListBox@
	mov	ax,word ptr [bp+16]
	mov	dx,word ptr [bp+14]
	mov	word ptr [si+16],dx
	mov	word ptr [si+18],ax
	mov	word ptr [si+20],1
	mov	word ptr [si+22],0
	mov	word ptr [si+24],0
	mov	word ptr [si+26],1
   ;	
   ;	    : TSView(aLeft, aTop, aRight, aBottom),
   ;	      range(aRange),
   ;	      curItem(1L),
   ;	      delta(1),
   ;	      lastDelta(0)
   ;	{
   ;	}
   ;	
	mov	ax,si
	jmp	short @3@194
@3@194:
	pop	si
	pop	bp
	ret	
@TSListBox@$bctr$qiiiil	endp
   ;	
   ;	void TSListBox::handleKeyEvent(unsigned &key)
   ;	
	assume	cs:_TEXT
@TSListBox@handleKeyEvent$qrui	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
	push	di
	mov	si,word ptr [bp+4]
	mov	di,word ptr [bp+6]
   ;	
   ;	{
   ;	    lastDelta = -1;
   ;	
	mov	word ptr [si+24],65535
   ;	
   ;	    switch (key)
   ;	
	mov	ax,word ptr [di]
	mov	word ptr [bp-2],ax
	mov	cx,6
	mov	bx,offset @4@C4740
@4@98:
	mov	ax,word ptr cs:[bx]
	cmp	ax,word ptr [bp-2]
	je	short @4@170
	inc	bx
	inc	bx
	loop	short @4@98
	jmp	@4@1490
@4@170:
	jmp	word ptr cs:[bx+12]
@4@194:
   ;	
   ;	    {
   ;	    case kbUp: // line up
   ;	        if (curItem > 1)
   ;	
	cmp	word ptr [si+22],0
	jl	short @4@338
	jg	short @4@266
	cmp	word ptr [si+20],1
	jbe	short @4@338
@4@266:
   ;	
   ;	        {
   ;	            lastDelta = delta;
   ;	
	mov	ax,word ptr [si+26]
	mov	word ptr [si+24],ax
   ;	
   ;	            if (delta > 1)
   ;	
	cmp	word ptr [si+26],1
	jle	short @4@314
   ;	
   ;	                delta--;
   ;	
	dec	word ptr [si+26]
@4@314:
   ;	
   ;	            curItem--;
   ;	
	sub	word ptr [si+20],1
	sbb	word ptr [si+22],0
@4@338:
	jmp	@4@1514
@4@362:
   ;	
   ;	        }
   ;	        break;
   ;	    case kbDown: // line down
   ;	        if (curItem < range)
   ;	
	mov	ax,word ptr [si+22]
	mov	dx,word ptr [si+20]
	cmp	ax,word ptr [si+18]
	jg	short @4@506
	jl	short @4@434
	cmp	dx,word ptr [si+16]
	jae	short @4@506
@4@434:
   ;	
   ;	        {
   ;	            lastDelta = delta;
   ;	
	mov	ax,word ptr [si+26]
	mov	word ptr [si+24],ax
   ;	
   ;	            if (delta < height)
   ;	
	mov	ax,word ptr [si+26]
	cmp	ax,word ptr [si+10]
	jge	short @4@482
   ;	
   ;	                delta++;
   ;	
	inc	word ptr [si+26]
@4@482:
   ;	
   ;	            curItem++;
   ;	
	add	word ptr [si+20],1
	adc	word ptr [si+22],0
@4@506:
	jmp	@4@1514
@4@530:
   ;	
   ;	        }
   ;	        break;
   ;	    case kbPgUp: // page up
   ;	        if (curItem > 1)
   ;	
	cmp	word ptr [si+22],0
	jl	short @4@746
	jg	short @4@602
	cmp	word ptr [si+20],1
	jbe	short @4@746
@4@602:
   ;	
   ;	        {
   ;	            long newcur = curItem - (height - 1);
   ;	
	mov	ax,word ptr [si+22]
	mov	dx,word ptr [si+20]
	push	ax
	mov	ax,word ptr [si+10]
	dec	ax
	push	dx
	cwd	
	pop	bx
	sub	bx,ax
	pop	ax
	sbb	ax,dx
	mov	word ptr [bp-6],bx
	mov	word ptr [bp-4],ax
   ;	
   ;	            if (newcur - delta > 0)
   ;	
	mov	ax,word ptr [si+26]
	cwd	
	mov	bx,word ptr [bp-4]
	mov	cx,word ptr [bp-6]
	sub	cx,ax
	sbb	bx,dx
	or	bx,bx
	jl	short @4@698
	jg	short @4@674
	or	cx,cx
	jbe	short @4@698
@4@674:
   ;	
   ;	                curItem = newcur;
   ;	
	mov	ax,word ptr [bp-4]
	mov	dx,word ptr [bp-6]
	mov	word ptr [si+20],dx
	mov	word ptr [si+22],ax
	jmp	short @4@722
@4@698:
   ;	
   ;	            else
   ;	            {
   ;	                curItem = 1;
   ;	
	mov	word ptr [si+20],1
	mov	word ptr [si+22],0
   ;	
   ;	                delta = 1;
   ;	
	mov	word ptr [si+26],1
@4@722:
   ;	
   ;	            }
   ;	            lastDelta = 0;
   ;	
	mov	word ptr [si+24],0
@4@746:
	jmp	@4@1514
@4@770:
   ;	
   ;	        }
   ;	        break;
   ;	    case kbPgDn: // page down
   ;	        if (curItem < range)
   ;	
	mov	ax,word ptr [si+22]
	mov	dx,word ptr [si+20]
	cmp	ax,word ptr [si+18]
	jg	short @4@1106
	jl	short @4@842
	cmp	dx,word ptr [si+16]
	jae	short @4@1106
@4@842:
   ;	
   ;	        {
   ;	            long newcur = curItem + (height - 1);
   ;	
	mov	ax,word ptr [si+22]
	mov	dx,word ptr [si+20]
	push	ax
	mov	ax,word ptr [si+10]
	dec	ax
	push	dx
	cwd	
	pop	bx
	add	bx,ax
	pop	ax
	adc	ax,dx
	mov	word ptr [bp-6],bx
	mov	word ptr [bp-4],ax
   ;	
   ;	            if (newcur + (height - delta) <= range)
   ;	
	mov	ax,word ptr [si+10]
	sub	ax,word ptr [si+26]
	cwd	
	mov	bx,word ptr [bp-4]
	mov	cx,word ptr [bp-6]
	add	cx,ax
	adc	bx,dx
	cmp	bx,word ptr [si+18]
	jg	short @4@938
	jne	short @4@914
	cmp	cx,word ptr [si+16]
	ja	short @4@938
@4@914:
   ;	
   ;	                curItem = newcur;
   ;	
	mov	ax,word ptr [bp-4]
	mov	dx,word ptr [bp-6]
	mov	word ptr [si+20],dx
	mov	word ptr [si+22],ax
	jmp	short @4@1082
@4@938:
   ;	
   ;	            else
   ;	            {
   ;	                curItem = range;
   ;	
	mov	ax,word ptr [si+18]
	mov	dx,word ptr [si+16]
	mov	word ptr [si+20],dx
	mov	word ptr [si+22],ax
   ;	
   ;	                delta = (int)min(height, range);
   ;	
	mov	ax,word ptr [si+10]
	cwd	
	cmp	dx,word ptr [si+18]
	jg	short @4@1034
	jl	short @4@1010
	cmp	ax,word ptr [si+16]
	jae	short @4@1034
@4@1010:
	mov	ax,word ptr [si+10]
	cwd	
	jmp	short @4@1058
@4@1034:
	mov	dx,word ptr [si+18]
	mov	ax,word ptr [si+16]
@4@1058:
	mov	word ptr [si+26],ax
@4@1082:
   ;	
   ;	            }
   ;	            lastDelta = 0;
   ;	
	mov	word ptr [si+24],0
@4@1106:
	jmp	short @4@1514
@4@1130:
   ;	
   ;	        }
   ;	        break;
   ;	    case kbCtrlPgUp: // ctrl-page up
   ;	        if (curItem > 1)
   ;	
	cmp	word ptr [si+22],0
	jl	short @4@1226
	jg	short @4@1202
	cmp	word ptr [si+20],1
	jbe	short @4@1226
@4@1202:
   ;	
   ;	        {
   ;	            curItem = 1;
   ;	
	mov	word ptr [si+20],1
	mov	word ptr [si+22],0
   ;	
   ;	            delta = 1;
   ;	
	mov	word ptr [si+26],1
   ;	
   ;	            lastDelta = 0;
   ;	
	mov	word ptr [si+24],0
@4@1226:
	jmp	short @4@1514
@4@1250:
   ;	
   ;	        }
   ;	        break;
   ;	    case kbCtrlPgDn: // ctrl-page down
   ;	        if (curItem < range)
   ;	
	mov	ax,word ptr [si+22]
	mov	dx,word ptr [si+20]
	cmp	ax,word ptr [si+18]
	jg	short @4@1466
	jl	short @4@1322
	cmp	dx,word ptr [si+16]
	jae	short @4@1466
@4@1322:
   ;	
   ;	        {
   ;	            curItem = range;
   ;	
	mov	ax,word ptr [si+18]
	mov	dx,word ptr [si+16]
	mov	word ptr [si+20],dx
	mov	word ptr [si+22],ax
   ;	
   ;	            delta = (int)min(height, range);
   ;	
	mov	ax,word ptr [si+10]
	cwd	
	cmp	dx,word ptr [si+18]
	jg	short @4@1418
	jl	short @4@1394
	cmp	ax,word ptr [si+16]
	jae	short @4@1418
@4@1394:
	mov	ax,word ptr [si+10]
	cwd	
	jmp	short @4@1442
@4@1418:
	mov	dx,word ptr [si+18]
	mov	ax,word ptr [si+16]
@4@1442:
	mov	word ptr [si+26],ax
   ;	
   ;	            lastDelta = 0;
   ;	
	mov	word ptr [si+24],0
@4@1466:
	jmp	short @4@1514
@4@1490:
   ;	
   ;	        }
   ;	        break;
   ;	    default:
   ;	        return;
   ;	
	jmp	short @4@1586
@4@1514:
   ;	
   ;	    }
   ;	    if (lastDelta != -1)
   ;	
	cmp	word ptr [si+24],65535
	je	short @4@1562
   ;	
   ;	        draw();
   ;	
	push	si
	mov	bx,word ptr [si+12]
	call	word ptr [bx+8]
	pop	cx
@4@1562:
   ;	
   ;	    key = 0;
   ;	
	mov	word ptr [di],0
@4@1586:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@TSListBox@handleKeyEvent$qrui	endp
@4@C4740	label	word
	db	0
	db	72
	db	0
	db	73
	db	0
	db	80
	db	0
	db	81
	db	0
	db	118
	db	0
	db	132
	dw	@4@194
	dw	@4@530
	dw	@4@362
	dw	@4@770
	dw	@4@1250
	dw	@4@1130
   ;	
   ;	void TSListBox::draw(void)
   ;	
	assume	cs:_TEXT
@TSListBox@draw$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;	    if (!lastDelta) // this means we have to redraw the whole list
   ;	
	cmp	word ptr [si+24],0
	je	@@2
	jmp	@5@338
@@2:
   ;	
   ;	    {
   ;	        win(left, top, right, bottom, *palette);
   ;	
	push	word ptr [si+6]
	push	word ptr [si+4]
	push	word ptr [si+2]
	push	word ptr [si]
	call	near ptr _window
	add	sp,8
	mov	al,byte ptr [si+14]
	cbw	
	push	ax
	call	near ptr _textattr
	pop	cx
	call	near ptr _clrscr
   ;	
   ;	        long itemOfs = curItem - delta;
   ;	
	mov	ax,word ptr [si+22]
	mov	dx,word ptr [si+20]
	push	ax
	mov	ax,word ptr [si+26]
	push	dx
	cwd	
	pop	bx
	sub	bx,ax
	pop	ax
	sbb	ax,dx
	mov	word ptr [bp-4],bx
	mov	word ptr [bp-2],ax
   ;	
   ;	        for (int i = 1; i <= height; i++)
   ;	
	mov	di,1
	jmp	short @5@290
@5@98:
   ;	
   ;	        {
   ;	            if (i == delta)
   ;	
	cmp	word ptr [si+26],di
	jne	short @5@146
   ;	
   ;	                textattr(*(palette + 1));
   ;	
	mov	al,byte ptr [si+15]
	cbw	
	push	ax
	call	near ptr _textattr
	pop	cx
	jmp	short @5@170
@5@146:
   ;	
   ;	            else
   ;	                textattr(*palette);
   ;	
	mov	al,byte ptr [si+14]
	cbw	
	push	ax
	call	near ptr _textattr
	pop	cx
@5@170:
   ;	
   ;	            gotoxy(1, i);
   ;	
	push	di
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	            if (i + itemOfs <= range)
   ;	
	mov	ax,di
	cwd	
	add	ax,word ptr [bp-4]
	adc	dx,word ptr [bp-2]
	cmp	dx,word ptr [si+18]
	jg	short @5@266
	jne	short @5@242
	cmp	ax,word ptr [si+16]
	ja	short @5@266
@5@242:
   ;	
   ;	                cputs(getString(i + itemOfs));
   ;	
	mov	ax,di
	cwd	
	add	ax,word ptr [bp-4]
	adc	dx,word ptr [bp-2]
	push	dx
	push	ax
	push	si
	mov	bx,word ptr [si+12]
	call	word ptr [bx+12]
	add	sp,6
	push	ax
	call	near ptr _cputs
	pop	cx
@5@266:
	inc	di
@5@290:
	cmp	word ptr [si+10],di
	jge	short @5@98
   ;	
   ;	        }
   ;	        return;
   ;	
	jmp	@5@482
@5@338:
   ;	
   ;	    }
   ;	
   ;	    if (lastDelta != delta)
   ;	
	mov	ax,word ptr [si+24]
	cmp	ax,word ptr [si+26]
	je	short @5@386
   ;	
   ;	    {
   ;	        window(left, top, right, bottom);
   ;	
	push	word ptr [si+6]
	push	word ptr [si+4]
	push	word ptr [si+2]
	push	word ptr [si]
	call	near ptr _window
	add	sp,8
   ;	
   ;	        fillattr(left, top + lastDelta - 1, right - 1, top + lastDelta - 1, *palette);
   ;	
	mov	al,byte ptr [si+14]
	push	ax
	mov	ax,word ptr [si+2]
	add	ax,word ptr [si+24]
	dec	ax
	push	ax
	mov	ax,word ptr [si+4]
	dec	ax
	push	ax
	mov	ax,word ptr [si+2]
	add	ax,word ptr [si+24]
	dec	ax
	push	ax
	mov	al,byte ptr [si]
	push	ax
	call	near ptr @fillattr$qucucucucuc
	add	sp,10
   ;	
   ;	        fillattr(left, top + delta - 1, right - 1, top + delta - 1, *(palette + 1));
   ;	
	mov	al,byte ptr [si+15]
	push	ax
	mov	ax,word ptr [si+2]
	add	ax,word ptr [si+26]
	dec	ax
	push	ax
	mov	ax,word ptr [si+4]
	dec	ax
	push	ax
	mov	ax,word ptr [si+2]
	add	ax,word ptr [si+26]
	dec	ax
	push	ax
	mov	al,byte ptr [si]
	push	ax
	call	near ptr @fillattr$qucucucucuc
	add	sp,10
	jmp	@5@482
@5@386:
   ;	
   ;	    }
   ;	    else
   ;	    {
   ;	        window(left, top, right, bottom);
   ;	
	push	word ptr [si+6]
	push	word ptr [si+4]
	push	word ptr [si+2]
	push	word ptr [si]
	call	near ptr _window
	add	sp,8
   ;	
   ;	        if (delta == 1)
   ;	
	cmp	word ptr [si+26],1
	jne	short @5@434
   ;	
   ;	        {
   ;	            textattr(*palette);
   ;	
	mov	al,byte ptr [si+14]
	cbw	
	push	ax
	call	near ptr _textattr
	pop	cx
   ;	
   ;	            cputs(getString(curItem + 1));
   ;	
	mov	ax,word ptr [si+22]
	mov	dx,word ptr [si+20]
	add	dx,1
	adc	ax,0
	push	ax
	push	dx
	push	si
	mov	bx,word ptr [si+12]
	call	word ptr [bx+12]
	add	sp,6
	push	ax
	call	near ptr _cputs
	pop	cx
   ;	
   ;	            gotoxy(1, 1);
   ;	
	mov	ax,1
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	            insline();
   ;	
	call	near ptr _insline
   ;	
   ;	            textattr(*(palette + 1));
   ;	
	mov	al,byte ptr [si+15]
	cbw	
	push	ax
	call	near ptr _textattr
	pop	cx
   ;	
   ;	            cputs(getString(curItem));
   ;	
	push	word ptr [si+22]
	push	word ptr [si+20]
	push	si
	mov	bx,word ptr [si+12]
	call	word ptr [bx+12]
	add	sp,6
	push	ax
	call	near ptr _cputs
	pop	cx
	jmp	short @5@482
@5@434:
   ;	
   ;	        }
   ;	        else if (delta == height)
   ;	
	mov	ax,word ptr [si+26]
	cmp	ax,word ptr [si+10]
	jne	short @5@482
   ;	
   ;	        {
   ;	            gotoxy(1, height);
   ;	
	push	word ptr [si+10]
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	            textattr(*palette);
   ;	
	mov	al,byte ptr [si+14]
	cbw	
	push	ax
	call	near ptr _textattr
	pop	cx
   ;	
   ;	            cputs(getString(curItem - 1));
   ;	
	mov	ax,word ptr [si+22]
	mov	dx,word ptr [si+20]
	add	dx,65535
	adc	ax,65535
	push	ax
	push	dx
	push	si
	mov	bx,word ptr [si+12]
	call	word ptr [bx+12]
	add	sp,6
	push	ax
	call	near ptr _cputs
	pop	cx
   ;	
   ;	            cputs("\r\n");
   ;	
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _cputs
	pop	cx
   ;	
   ;	            textattr(*(palette + 1));
   ;	
	mov	al,byte ptr [si+15]
	cbw	
	push	ax
	call	near ptr _textattr
	pop	cx
   ;	
   ;	            cputs(getString(curItem));
   ;	
	push	word ptr [si+22]
	push	word ptr [si+20]
	push	si
	mov	bx,word ptr [si+12]
	call	word ptr [bx+12]
	add	sp,6
	push	ax
	call	near ptr _cputs
	pop	cx
@5@482:
   ;	
   ;	        }
   ;	    }
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@TSListBox@draw$qv	endp
_TEXT	ends
_DATA	segment word public 'DATA'
@TSFrame@simpleFrame	label	word
	dw	DGROUP:s@+3
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_DATA	segment word public 'DATA'
@TSFrame@doubleFrame	label	word
	dw	DGROUP:s@+18
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	TSFrame::TSFrame(int aLeft, int aTop, int aRight, int aBottom, int frType)
   ;	
	assume	cs:_TEXT
@TSFrame@$bctr$qiiiii	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
	or	si,si
	je	short @6@74
	jmp	short @6@98
@6@74:
	mov	ax,17
	push	ax
	call	near ptr @$bnew$qui
	pop	cx
	mov	si,ax
@6@98:
	or	si,si
	jne	short @6@146
	mov	ax,si
	jmp	short @6@338
@6@146:
	mov	word ptr [si+12],offset @@TSView@
	mov	ax,word ptr [bp+6]
	mov	word ptr [si],ax
	mov	ax,word ptr [bp+8]
	mov	word ptr [si+2],ax
	mov	ax,word ptr [bp+10]
	mov	word ptr [si+4],ax
	mov	ax,word ptr [bp+12]
	mov	word ptr [si+6],ax
	mov	ax,word ptr [bp+10]
	sub	ax,word ptr [bp+6]
	inc	ax
	mov	word ptr [si+8],ax
	mov	ax,word ptr [bp+12]
	sub	ax,word ptr [bp+8]
	inc	ax
	mov	word ptr [si+10],ax
	mov	word ptr [si+12],offset @@TSFrame@
   ;	
   ;	    : TSView(aLeft, aTop, aRight, aBottom)
   ;	{
   ;	    if (frType == -1)
   ;	
	cmp	word ptr [bp+14],65535
	jne	short @6@218
   ;	
   ;	        frameChars = 0;
   ;	
	mov	word ptr [si+14],0
	jmp	short @6@314
@6@218:
   ;	
   ;	    else
   ;	        frameChars = frType ? doubleFrame : simpleFrame;
   ;	
	cmp	word ptr [bp+14],0
	je	short @6@266
	mov	ax,word ptr DGROUP:@TSFrame@doubleFrame
	jmp	short @6@290
@6@266:
	mov	ax,word ptr DGROUP:@TSFrame@simpleFrame
@6@290:
	mov	word ptr [si+14],ax
@6@314:
   ;	
   ;	}
   ;	
	mov	ax,si
	jmp	short @6@338
@6@338:
	pop	si
	pop	bp
	ret	
@TSFrame@$bctr$qiiiii	endp
_TEXT	ends
_BSS	segment word public 'BSS'
	db	80 dup (?)
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void TSFrame::draw(void)
   ;	
	assume	cs:_TEXT
@TSFrame@draw$qv	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;	    if (frameChars)
   ;	
	cmp	word ptr [si+14],0
	jne	@@3
	jmp	@7@170
@@3:
   ;	
   ;	    {
   ;	        window(left, top, right + 1, bottom);
   ;	
	push	word ptr [si+6]
	mov	ax,word ptr [si+4]
	inc	ax
	push	ax
	push	word ptr [si+2]
	push	word ptr [si]
	call	near ptr _window
	add	sp,8
   ;	
   ;	        textattr(*palette);
   ;	
	mov	al,byte ptr [si+16]
	cbw	
	push	ax
	call	near ptr _textattr
	pop	cx
   ;	
   ;	
   ;	        static char buffer[80];
   ;	
   ;	        memset(buffer, *(frameChars + 1), width);
   ;	
	push	word ptr [si+8]
	mov	bx,word ptr [si+14]
	mov	al,byte ptr [bx+1]
	cbw	
	push	ax
	mov	ax,offset DGROUP:b@+0
	push	ax
	call	near ptr _memset
	add	sp,6
   ;	
   ;	        *(buffer + width) = 0;
   ;	
	mov	bx,word ptr [si+8]
	mov	byte ptr DGROUP:b@+0[bx],0
   ;	
   ;	        *(buffer + width - 1) = *(frameChars + 2);
   ;	
	mov	bx,word ptr [si+14]
	mov	al,byte ptr [bx+2]
	mov	bx,word ptr [si+8]
	mov	byte ptr DGROUP:b@+0[bx-1],al
   ;	
   ;	        *buffer = *frameChars;
   ;	
	mov	bx,word ptr [si+14]
	mov	al,byte ptr [bx]
	mov	byte ptr DGROUP:b@+0,al
   ;	
   ;	        gotoxy(1, 1);
   ;	
	mov	ax,1
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cputs(buffer);
   ;	
	mov	ax,offset DGROUP:b@+0
	push	ax
	call	near ptr _cputs
	pop	cx
   ;	
   ;	
   ;	        gotoxy(1, height);
   ;	
	push	word ptr [si+10]
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        *(buffer + width - 1) = *(frameChars + 5);
   ;	
	mov	bx,word ptr [si+14]
	mov	al,byte ptr [bx+5]
	mov	bx,word ptr [si+8]
	mov	byte ptr DGROUP:b@+0[bx-1],al
   ;	
   ;	        *buffer = *(frameChars + 4);
   ;	
	mov	bx,word ptr [si+14]
	mov	al,byte ptr [bx+4]
	mov	byte ptr DGROUP:b@+0,al
   ;	
   ;	        cputs(buffer);
   ;	
	mov	ax,offset DGROUP:b@+0
	push	ax
	call	near ptr _cputs
	pop	cx
   ;	
   ;	
   ;	        int vertline = *(frameChars + 3);
   ;	
	mov	bx,word ptr [si+14]
	mov	al,byte ptr [bx+3]
	cbw	
	mov	word ptr [bp-2],ax
   ;	
   ;	        for (register int i = 2; i <= height - 1; i++)
   ;	
	mov	di,2
	jmp	short @7@146
@7@98:
   ;	
   ;	        {
   ;	            gotoxy(1, i);
   ;	
	push	di
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	            putch(vertline);
   ;	
	push	word ptr [bp-2]
	call	near ptr _putch
	pop	cx
   ;	
   ;	            gotoxy(width, i);
   ;	
	push	di
	push	word ptr [si+8]
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	            putch(vertline);
   ;	
	push	word ptr [bp-2]
	call	near ptr _putch
	pop	cx
	inc	di
@7@146:
	mov	ax,word ptr [si+10]
	dec	ax
	cmp	ax,di
	jge	short @7@98
@7@170:
   ;	
   ;	        }
   ;	    }
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@TSFrame@draw$qv	endp
   ;	
   ;	TSDialogBox::TSDialogBox(int aLeft, int aTop, int aRight, int aBottom,
   ;	
	assume	cs:_TEXT
@TSDialogBox@$bctr$qiiiipxzci	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	si,word ptr [bp+4]
	mov	di,word ptr [bp+12]
	or	si,si
	je	short @8@74
	jmp	short @8@98
@8@74:
	mov	ax,40
	push	ax
	call	near ptr @$bnew$qui
	pop	cx
	mov	si,ax
@8@98:
	or	si,si
	jne	short @8@146
	mov	ax,si
	jmp	@8@314
@8@146:
	mov	word ptr [si+12],offset @@TSView@
	mov	ax,word ptr [bp+6]
	mov	word ptr [si],ax
	mov	ax,word ptr [bp+8]
	mov	word ptr [si+2],ax
	mov	ax,word ptr [bp+10]
	mov	word ptr [si+4],ax
	mov	word ptr [si+6],di
	mov	ax,word ptr [bp+10]
	sub	ax,word ptr [bp+6]
	inc	ax
	mov	word ptr [si+8],ax
	mov	ax,di
	sub	ax,word ptr [bp+8]
	inc	ax
	mov	word ptr [si+10],ax
	mov	word ptr [si+12],offset @@TSDialogBox@
	push	word ptr [bp+14]
	call	near ptr _strdup
	pop	cx
	mov	word ptr [si+14],ax
	push	word ptr [bp+16]
	push	di
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	mov	ax,si
	add	ax,16
	push	ax
	call	near ptr @TSFrame@$bctr$qiiiii
	add	sp,12
	mov	word ptr [si+35],0
   ;	
   ;	                         const char *aTitle, int frType)
   ;	    : TSView(aLeft, aTop, aRight, aBottom), title(strdup(aTitle)),
   ;	      frame(aLeft, aTop, aRight, aBottom, frType),
   ;	      drawOK(0)
   ;	
   ;	{
   ;	    if ((buffer = malloc((right - top + 3) * (bottom - top + 2) * 2)) != 0)
   ;	
	mov	ax,word ptr [si+4]
	sub	ax,word ptr [si+2]
	add	ax,3
	mov	dx,word ptr [si+6]
	sub	dx,word ptr [si+2]
	inc	dx
	inc	dx
	imul	dx
	shl	ax,1
	push	ax
	call	near ptr _malloc
	pop	cx
	mov	word ptr [si+33],ax
	or	ax,ax
	je	short @8@218
   ;	
   ;	        drawOK = 1;
   ;	
	mov	word ptr [si+35],1
	jmp	short @8@242
@8@218:
   ;	
   ;	    else
   ;	        sviewhalt();
   ;	
	call	word ptr DGROUP:_sviewhalt
@8@242:
   ;	
   ;	    if (!title)
   ;	
	cmp	word ptr [si+14],0
	jne	short @8@290
   ;	
   ;	        sviewhalt();
   ;	
	call	word ptr DGROUP:_sviewhalt
@8@290:
   ;	
   ;	}
   ;	
	mov	ax,si
	jmp	short @8@314
@8@314:
	pop	di
	pop	si
	pop	bp
	ret	
@TSDialogBox@$bctr$qiiiipxzci	endp
   ;	
   ;	void TSDialogBox::open(int cursortype)
   ;	
	assume	cs:_TEXT
@TSDialogBox@open$qi	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;	    if (drawOK)
   ;	
	cmp	word ptr [si+35],0
	je	short @9@74
   ;	
   ;	    {
   ;	        gettext(left, top, right + 2, bottom + 1, buffer);
   ;	
	push	word ptr [si+33]
	mov	ax,word ptr [si+6]
	inc	ax
	push	ax
	mov	ax,word ptr [si+4]
	inc	ax
	inc	ax
	push	ax
	push	word ptr [si+2]
	push	word ptr [si]
	call	near ptr _gettext
	add	sp,10
   ;	
   ;	        draw();
   ;	
	push	si
	mov	bx,word ptr [si+12]
	call	word ptr [bx+8]
	pop	cx
   ;	
   ;	        _setcursortype(cursortype);
   ;	
	push	word ptr [bp+6]
	call	near ptr __setcursortype
	pop	cx
@9@74:
   ;	
   ;	    }
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
@TSDialogBox@open$qi	endp
   ;	
   ;	void TSDialogBox::close(int cursortype)
   ;	
	assume	cs:_TEXT
@TSDialogBox@close$qi	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;	    if (drawOK)
   ;	
	cmp	word ptr [si+35],0
	je	short @10@74
   ;	
   ;	    {
   ;	        puttext(left, top, right + 2, bottom + 1, buffer);
   ;	
	push	word ptr [si+33]
	mov	ax,word ptr [si+6]
	inc	ax
	push	ax
	mov	ax,word ptr [si+4]
	inc	ax
	inc	ax
	push	ax
	push	word ptr [si+2]
	push	word ptr [si]
	call	near ptr _puttext
	add	sp,10
   ;	
   ;	        _setcursortype(cursortype);
   ;	
	push	word ptr [bp+6]
	call	near ptr __setcursortype
	pop	cx
@10@74:
   ;	
   ;	    }
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
@TSDialogBox@close$qi	endp
   ;	
   ;	void TSDialogBox::draw(void)
   ;	
	assume	cs:_TEXT
@TSDialogBox@draw$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,12
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;	    if (drawOK)
   ;	
	cmp	word ptr [si+35],0
	jne	@@4
	jmp	@11@122
@@4:
   ;	
   ;	    {
   ;	        // draw shadows
   ;	        //    win(left + 2, bottom + 1, right + 2, bottom + 1, shadowAttr);
   ;	        //    win(right + 1, top + 1, right + 2, bottom, shadowAttr);
   ;	        fillattr(left + 2, bottom + 1, right + 2, bottom + 1, shadowAttr);
   ;	
	mov	al,byte ptr DGROUP:_shadowAttr
	push	ax
	mov	ax,word ptr [si+6]
	inc	ax
	push	ax
	mov	ax,word ptr [si+4]
	inc	ax
	inc	ax
	push	ax
	mov	ax,word ptr [si+6]
	inc	ax
	push	ax
	mov	ax,word ptr [si]
	inc	ax
	inc	ax
	push	ax
	call	near ptr @fillattr$qucucucucuc
	add	sp,10
   ;	
   ;	        fillattr(right + 1, top + 1, right + 2, bottom, shadowAttr);
   ;	
	mov	al,byte ptr DGROUP:_shadowAttr
	push	ax
	mov	al,byte ptr [si+6]
	push	ax
	mov	ax,word ptr [si+4]
	inc	ax
	inc	ax
	push	ax
	mov	ax,word ptr [si+2]
	inc	ax
	push	ax
	mov	ax,word ptr [si+4]
	inc	ax
	push	ax
	call	near ptr @fillattr$qucucucucuc
	add	sp,10
   ;	
   ;	        // draw dialog box background
   ;	        win(left, top + 1, right, bottom, *(palette));
   ;	
	push	word ptr [si+6]
	push	word ptr [si+4]
	mov	ax,word ptr [si+2]
	inc	ax
	push	ax
	push	word ptr [si]
	call	near ptr _window
	add	sp,8
	mov	al,byte ptr [si+37]
	cbw	
	push	ax
	call	near ptr _textattr
	pop	cx
	call	near ptr _clrscr
   ;	
   ;	        // draw frame
   ;	        *(frame.palette) = *(palette + 2);
   ;	
	mov	al,byte ptr [si+39]
	mov	byte ptr [si+32],al
   ;	
   ;	        frame.draw();
   ;	
	mov	ax,si
	add	ax,16
	push	ax
	mov	bx,word ptr [si+28]
	call	word ptr [bx+8]
	pop	cx
   ;	
   ;	        // draw caption bar and display title
   ;	        if (*palette != *(palette + 1))
   ;	
	mov	al,byte ptr [si+37]
	cmp	al,byte ptr [si+38]
	je	short @11@98
   ;	
   ;	            win(left, top, right, top, *(palette + 1));
   ;	
	push	word ptr [si+2]
	push	word ptr [si+4]
	push	word ptr [si+2]
	push	word ptr [si]
	call	near ptr _window
	add	sp,8
	mov	al,byte ptr [si+38]
	cbw	
	push	ax
	call	near ptr _textattr
	pop	cx
	call	near ptr _clrscr
@11@98:
   ;	
   ;	        ccputs(title, 1);
   ;	
	mov	di,word ptr [si+14]
	lea	ax,word ptr [bp-12]
	push	ax
	call	near ptr _gettextinfo
	pop	cx
	mov	ax,1
	push	ax
	push	di
	call	near ptr _strlen
	pop	cx
	mov	dl,byte ptr [bp-10]
	mov	dh,0
	mov	bl,byte ptr [bp-12]
	mov	bh,0
	sub	dx,bx
	inc	dx
	sub	dx,ax
	shr	dx,1
	inc	dx
	push	dx
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	push	di
	call	near ptr _cputs
	pop	cx
   ;	
   ;	        //
   ;	        window(left + 1, top + 1, right - 1, bottom);
   ;	
	push	word ptr [si+6]
	mov	ax,word ptr [si+4]
	dec	ax
	push	ax
	mov	ax,word ptr [si+2]
	inc	ax
	push	ax
	mov	ax,word ptr [si]
	inc	ax
	push	ax
	call	near ptr _window
	add	sp,8
   ;	
   ;	        textattr(*(palette));
   ;	
	mov	al,byte ptr [si+37]
	cbw	
	push	ax
	call	near ptr _textattr
	pop	cx
@11@122:
   ;	
   ;	    }
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@TSDialogBox@draw$qv	endp
   ;	
   ;	void TSDialogBox::makeLocal(TSView *v)
   ;	
	assume	cs:_TEXT
@TSDialogBox@makeLocal$qp6TSView	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
	mov	si,word ptr [bp+6]
   ;	
   ;	{
   ;	    v->left += left;
   ;	
	mov	ax,word ptr [di]
	add	word ptr [si],ax
   ;	
   ;	    v->top += top;
   ;	
	mov	ax,word ptr [di+2]
	add	word ptr [si+2],ax
   ;	
   ;	    v->right += left;
   ;	
	mov	ax,word ptr [di]
	add	word ptr [si+4],ax
   ;	
   ;	    v->bottom += top;
   ;	
	mov	ax,word ptr [di+2]
	add	word ptr [si+6],ax
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@TSDialogBox@makeLocal$qp6TSView	endp
   ;	
   ;	TSDialogBox::~TSDialogBox(void)
   ;	
	assume	cs:_TEXT
@TSDialogBox@$bdtr$qv	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;	    free(title);
   ;	
	or	si,si
	je	short @13@122
	mov	word ptr [si+12],offset @@TSDialogBox@
	push	word ptr [si+14]
	call	near ptr _free
	pop	cx
   ;	
   ;	    free(buffer);
   ;	
	push	word ptr [si+33]
	call	near ptr _free
	pop	cx
	mov	ax,2
	push	ax
	mov	ax,si
	add	ax,16
	push	ax
	mov	bx,word ptr [si+28]
	call	word ptr [bx+10]
	pop	cx
	pop	cx
	test	word ptr [bp+6],1
	je	short @13@122
	push	si
	call	near ptr @$bdele$qpv
	pop	cx
	jmp	short @13@122
@13@122:
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
@TSDialogBox@$bdtr$qv	endp
   ;	
   ;	int executeKey(TSView *view, unsigned ok, unsigned cancel)
   ;	
	assume	cs:_TEXT
@executeKey$qp6TSViewuiui	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
	mov	si,word ptr [bp+4]
	mov	di,word ptr [bp+8]
@14@26:
   ;	
   ;	{
   ;	    unsigned key;
   ;	
   ;	    while (1)
   ;	    {
   ;	        key = biosGetKey();
   ;	
	xor	ax,ax
	int	22
	mov	word ptr [bp-2],ax
   ;	
   ;	        if (key == ok)
   ;	
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp+6]
	jne	short @14@74
   ;	
   ;	            return 1;
   ;	
	mov	ax,1
	jmp	short @14@170
@14@74:
   ;	
   ;	        if (key == cancel)
   ;	
	cmp	word ptr [bp-2],di
	jne	short @14@122
   ;	
   ;	            return 0;
   ;	
	xor	ax,ax
	jmp	short @14@170
@14@122:
   ;	
   ;	        view->handleKeyEvent(key);
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	push	si
	mov	bx,word ptr [si+12]
	call	word ptr [bx+2]
	pop	cx
	pop	cx
	jmp	short @14@26
@14@170:
   ;	
   ;	    }
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@executeKey$qp6TSViewuiui	endp
   ;	
   ;	int executeCKey(TSView *view, unsigned ok, unsigned cancel)
   ;	
	assume	cs:_TEXT
@executeCKey$qp6TSViewuiui	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
	mov	si,word ptr [bp+4]
	mov	di,word ptr [bp+8]
@15@26:
   ;	
   ;	{
   ;	    unsigned key;
   ;	
   ;	    while (1)
   ;	    {
   ;	        key = biosGetKey();
   ;	
	xor	ax,ax
	int	22
	mov	word ptr [bp-2],ax
   ;	
   ;	        view->handleKeyEvent(key);
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	push	si
	mov	bx,word ptr [si+12]
	call	word ptr [bx+2]
	pop	cx
	pop	cx
   ;	
   ;	        if (key == ok)
   ;	
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp+6]
	jne	short @15@74
   ;	
   ;	            return 1;
   ;	
	mov	ax,1
	jmp	short @15@146
@15@74:
   ;	
   ;	        if (key == cancel)
   ;	
	cmp	word ptr [bp-2],di
	jne	short @15@122
   ;	
   ;	            return 0;
   ;	
	xor	ax,ax
	jmp	short @15@146
@15@122:
	jmp	short @15@26
@15@146:
   ;	
   ;	    }
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@executeCKey$qp6TSViewuiui	endp
   ;	
   ;	void setPalette(char *palette, ...)
   ;	
	assume	cs:_TEXT
@setPalette$qpzce	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;	    int pal;
   ;	    va_list ap;
   ;	    va_start(ap, palette);
   ;	
	lea	ax,word ptr [bp+6]
	mov	di,ax
	jmp	short @16@74
@16@50:
   ;	
   ;	    while ((pal = va_arg(ap, int)) != 0)
   ;	    {
   ;	        *palette = pal;
   ;	
	mov	al,dl
	mov	byte ptr [si],al
   ;	
   ;	        palette++;
   ;	
	inc	si
@16@74:
	inc	di
	inc	di
	mov	bx,di
	mov	ax,word ptr [bx-2]
	mov	dx,ax
	or	ax,ax
	jne	short @16@50
   ;	
   ;	    }
   ;	    va_end(ap);
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@setPalette$qpzce	endp
   ;	
   ;	void biosSetBlink(unsigned char blink)
   ;	
	assume	cs:_TEXT
@biosSetBlink$quc	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    asm     push    bp
   ;	
     	push	    bp
   ;	
   ;	    asm     mov     ax, 0x1003
   ;	
     	mov	     ax, 01003H
   ;	
   ;	    asm     mov     bl, blink
   ;	
     	mov	     bl, [bp+4]
   ;	
   ;	    asm     int     0x10
   ;	
     	int	     010H
   ;	
   ;	    asm     pop     bp
   ;	
     	pop	     bp
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@biosSetBlink$quc	endp
_TEXT	ends
_DATA	segment word public 'DATA'
@TSDialogBox@	segment	virtual
@@TSDialogBox@	label	byte
	dw	@@TSDialogBox@isA$qv
	dw	@@TSView@handleKeyEvent$qrui
	dw	@@TSView@handleMouseEvent$qr11TMouseEvent
	dw	@@TSView@handleCommand$qr13TCommandEvent
	dw	@TSDialogBox@draw$qv
	dw	@TSDialogBox@$bdtr$qv
@TSDialogBox@	ends
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_DATA	segment word public 'DATA'
@TSFrame@	segment	virtual
@@TSFrame@	label	byte
	dw	@@TSFrame@isA$qv
	dw	@@TSView@handleKeyEvent$qrui
	dw	@@TSView@handleMouseEvent$qr11TMouseEvent
	dw	@@TSView@handleCommand$qr13TCommandEvent
	dw	@TSFrame@draw$qv
	dw	@@TSFrame@$bdtr$qv
@TSFrame@	ends
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_DATA	segment word public 'DATA'
@TSListBox@	segment	virtual
@@TSListBox@	label	byte
	dw	@@TSListBox@isA$qv
	dw	@TSListBox@handleKeyEvent$qrui
	dw	@@TSView@handleMouseEvent$qr11TMouseEvent
	dw	@@TSView@handleCommand$qr13TCommandEvent
	dw	@TSListBox@draw$qv
	dw	@@TSListBox@$bdtr$qv
	dw	@@TSListBox@getString$ql
@TSListBox@	ends
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_DATA	segment word public 'DATA'
@TSView@	segment	virtual
@@TSView@	label	byte
	dw	__npure_error_
	dw	@@TSView@handleKeyEvent$qrui
	dw	@@TSView@handleMouseEvent$qr11TMouseEvent
	dw	@@TSView@handleCommand$qr13TCommandEvent
	dw	__npure_error_
	dw	@@TSView@$bdtr$qv
@TSView@	ends
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_TEXT	segment byte public 'CODE'
@TSDialogBox@isA$qv	segment	virtual
	assume	cs:_TEXT
@@TSDialogBox@isA$qv	proc	near
	push	bp
	mov	bp,sp
	mov	ax,2
	jmp	short @18@50
@18@50:
	pop	bp
	ret	
@@TSDialogBox@isA$qv	endp
@TSDialogBox@isA$qv	ends
_TEXT	ends
_TEXT	segment byte public 'CODE'
@TSView@handleKeyEvent$qrui	segment	virtual
	assume	cs:_TEXT
@@TSView@handleKeyEvent$qrui	proc	near
	push	bp
	mov	bp,sp
	pop	bp
	ret	
@@TSView@handleKeyEvent$qrui	endp
@TSView@handleKeyEvent$qrui	ends
_TEXT	ends
_TEXT	segment byte public 'CODE'
@TSView@handleMouseEvent$qr11TMouseEvent	segment	virtual
	assume	cs:_TEXT
@@TSView@handleMouseEvent$qr11TMouseEvent	proc	near
	push	bp
	mov	bp,sp
	pop	bp
	ret	
@@TSView@handleMouseEvent$qr11TMouseEvent	endp
@TSView@handleMouseEvent$qr11TMouseEvent	ends
_TEXT	ends
_TEXT	segment byte public 'CODE'
@TSView@handleCommand$qr13TCommandEvent	segment	virtual
	assume	cs:_TEXT
@@TSView@handleCommand$qr13TCommandEvent	proc	near
	push	bp
	mov	bp,sp
	pop	bp
	ret	
@@TSView@handleCommand$qr13TCommandEvent	endp
@TSView@handleCommand$qr13TCommandEvent	ends
_TEXT	ends
_TEXT	segment byte public 'CODE'
@TSFrame@isA$qv	segment	virtual
	assume	cs:_TEXT
@@TSFrame@isA$qv	proc	near
	push	bp
	mov	bp,sp
	mov	ax,2
	jmp	short @22@50
@22@50:
	pop	bp
	ret	
@@TSFrame@isA$qv	endp
@TSFrame@isA$qv	ends
_TEXT	ends
_TEXT	segment byte public 'CODE'
@TSFrame@$bdtr$qv	segment	virtual
	assume	cs:_TEXT
@@TSFrame@$bdtr$qv	proc	near
	push	bp
	mov	bp,sp
	cmp	word ptr [bp+4],0
	je	short @23@122
	test	word ptr [bp+6],1
	je	short @23@98
	push	word ptr [bp+4]
	call	near ptr @$bdele$qpv
	pop	cx
	jmp	short @23@98
@23@98:
	jmp	short @23@122
@23@122:
	pop	bp
	ret	
@@TSFrame@$bdtr$qv	endp
@TSFrame@$bdtr$qv	ends
_TEXT	ends
_TEXT	segment byte public 'CODE'
@TSListBox@isA$qv	segment	virtual
	assume	cs:_TEXT
@@TSListBox@isA$qv	proc	near
	push	bp
	mov	bp,sp
	mov	ax,5
	jmp	short @24@50
@24@50:
	pop	bp
	ret	
@@TSListBox@isA$qv	endp
@TSListBox@isA$qv	ends
_TEXT	ends
_TEXT	segment byte public 'CODE'
@TSListBox@$bdtr$qv	segment	virtual
	assume	cs:_TEXT
@@TSListBox@$bdtr$qv	proc	near
	push	bp
	mov	bp,sp
	cmp	word ptr [bp+4],0
	je	short @25@122
	test	word ptr [bp+6],1
	je	short @25@98
	push	word ptr [bp+4]
	call	near ptr @$bdele$qpv
	pop	cx
	jmp	short @25@98
@25@98:
	jmp	short @25@122
@25@122:
	pop	bp
	ret	
@@TSListBox@$bdtr$qv	endp
@TSListBox@$bdtr$qv	ends
_TEXT	ends
_TEXT	segment byte public 'CODE'
@TSListBox@getString$ql	segment	virtual
	assume	cs:_TEXT
@@TSListBox@getString$ql	proc	near
	push	bp
	mov	bp,sp
	xor	ax,ax
	jmp	short @26@50
@26@50:
	pop	bp
	ret	
@@TSListBox@getString$ql	endp
@TSListBox@getString$ql	ends
_TEXT	ends
_TEXT	segment byte public 'CODE'
@TSView@$bdtr$qv	segment	virtual
	assume	cs:_TEXT
@@TSView@$bdtr$qv	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
	or	si,si
	je	short @27@122
	mov	word ptr [si+12],offset @@TSView@
	test	word ptr [bp+6],1
	je	short @27@122
	push	si
	call	near ptr @$bdele$qpv
	pop	cx
	jmp	short @27@122
@27@122:
	pop	si
	pop	bp
	ret	
@@TSView@$bdtr$qv	endp
	?debug	C E9
@TSView@$bdtr$qv	ends
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	13
	db	10
	db	0
	db	-17
	db	-65
	db	-67
	db	-60
	db	-65
	db	-17
	db	-65
	db	-67
	db	-17
	db	-65
	db	-67
	db	-17
	db	-65
	db	-67
	db	0
	db	-17
	db	-65
	db	-67
	db	-51
	db	-69
	db	-17
	db	-65
	db	-67
	db	-56
	db	-68
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
@TSView@$bdtr$qv	segment	virtual
@TSView@$bdtr$qv	ends
_TEXT	ends
_s@	equ	s@
	public	@defaulthalt$qv
	public	_sviewhalt
	public	@fillattr$qucucucucuc
	public	_shadowAttr
	public	@TSListBox@$bctr$qiiiil
	extrn	@$bnew$qui:near
	public	@TSListBox@handleKeyEvent$qrui
	public	@TSListBox@draw$qv
	extrn	_clrscr:near
	extrn	_textattr:near
	extrn	_window:near
	extrn	_gotoxy:near
	extrn	_cputs:near
	extrn	_insline:near
	public	@TSFrame@simpleFrame
	public	@TSFrame@doubleFrame
	public	@TSFrame@$bctr$qiiiii
	public	@TSFrame@draw$qv
	extrn	_memset:near
	extrn	_putch:near
	public	@TSDialogBox@$bctr$qiiiipxzci
	extrn	_strdup:near
	extrn	_malloc:near
	public	@TSDialogBox@open$qi
	extrn	_gettext:near
	extrn	__setcursortype:near
	public	@TSDialogBox@close$qi
	extrn	_puttext:near
	public	@TSDialogBox@draw$qv
	extrn	_strlen:near
	extrn	_gettextinfo:near
	public	@TSDialogBox@makeLocal$qp6TSView
	public	@TSDialogBox@$bdtr$qv
	extrn	_free:near
	extrn	@$bdele$qpv:near
	public	@executeKey$qp6TSViewuiui
	public	@executeCKey$qp6TSViewuiui
	public	@setPalette$qpzce
	public	@biosSetBlink$quc
	extrn	__npure_error_:near
	end
