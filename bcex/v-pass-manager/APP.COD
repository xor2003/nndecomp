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
	?debug	S "c:\app.cpp"
	?debug	C E9D055FE7C0A633A5C6170702E637070
	?debug	C E9D055FE7C0B494E434C5544452E435050
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
	?debug	C E95337528110443A5C494E434C5544455C6D656D2E68
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
	?debug	C E95337528110443A5C494E434C5544455C646F732E68
	?debug	C E95337528113443A5C494E434C5544455C737472696E672E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
	?debug	C E95337528114443A5C494E434C5544455C6673747265616D2E68
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
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
_choice	label	byte
	db	1 dup (?)
_BSS	ends
_DATA	segment word public 'DATA'
_data	label	word
	db	0
	db	0
	db	6 dup (0)
_DATA	ends
_BSS	segment word public 'BSS'
_BSS	ends
_DATA	segment word public 'DATA'
_menu	label	word
	db	0
	db	0
_DATA	ends
_BSS	segment word public 'BSS'
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void line(int n, int b = 0, char c = '*')
   ;	
	assume	cs:_TEXT
@line$qiizc	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		if (!b)
   ;	
	cmp	word ptr [bp+6],0
	jne	short @1@170
   ;	
   ;		{
   ;			for (int i = 0; i < n; i++)
   ;	
	xor	si,si
	jmp	short @1@122
@1@74:
   ;	
   ;				cprintf("%c", c);
   ;	
	mov	al,byte ptr [bp+8]
	cbw	
	push	ax
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
	inc	si
@1@122:
	cmp	si,word ptr [bp+4]
	jl	short @1@74
	jmp	short @1@314
@1@170:
   ;	
   ;		}
   ;		else
   ;		{
   ;			int j = 0;
   ;	
	xor	di,di
   ;	
   ;			for (int i = 0; i < n; i++)
   ;	
	xor	si,si
	jmp	short @1@290
@1@194:
   ;	
   ;			{
   ;				if (j == 1)
   ;	
	cmp	di,1
	jne	short @1@242
   ;	
   ;				{
   ;					textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;					cprintf("%c", c);
   ;	
	mov	al,byte ptr [bp+8]
	cbw	
	push	ax
	mov	ax,offset DGROUP:s@+3
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;					j = 0;
   ;	
	xor	di,di
	jmp	short @1@266
@1@242:
   ;	
   ;				}
   ;				else
   ;				{
   ;					textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;					cprintf("%c", c);
   ;	
	mov	al,byte ptr [bp+8]
	cbw	
	push	ax
	mov	ax,offset DGROUP:s@+6
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;					j = 1;
   ;	
	mov	di,1
@1@266:
	inc	si
@1@290:
	cmp	si,word ptr [bp+4]
	jl	short @1@194
@1@314:
   ;	
   ;				}
   ;			}
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@line$qiizc	endp
   ;	
   ;	void comp(int n, int s = 0, int c = 0)
   ;	
	assume	cs:_TEXT
@comp$qiii	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	si,word ptr [bp+8]
   ;	
   ;	{
   ;		if (s)
   ;	
	cmp	word ptr [bp+6],0
	je	short @2@218
   ;	
   ;		{
   ;			for (int i = 0; i < (n / 2); i++)
   ;	
	xor	di,di
	jmp	short @2@170
@2@74:
   ;	
   ;			{
   ;				cprintf("%d ", c);
   ;	
	push	si
	mov	ax,offset DGROUP:s@+9
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;	
   ;				if (c == 0)
   ;	
	or	si,si
	jne	short @2@122
   ;	
   ;					c = 1;
   ;	
	mov	si,1
	jmp	short @2@146
@2@122:
   ;	
   ;				else
   ;					c = 0;
   ;	
	xor	si,si
@2@146:
	inc	di
@2@170:
	mov	ax,word ptr [bp+4]
	mov	bx,2
	cwd	
	idiv	bx
	cmp	ax,di
	jg	short @2@74
	jmp	short @2@362
@2@218:
   ;	
   ;			}
   ;		}
   ;		else
   ;		{
   ;			for (int i = 0; i < n; i++)
   ;	
	xor	di,di
	jmp	short @2@338
@2@242:
   ;	
   ;			{
   ;				cprintf("%d", c);
   ;	
	push	si
	mov	ax,offset DGROUP:s@+13
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;	
   ;				if (c == 0)
   ;	
	or	si,si
	jne	short @2@290
   ;	
   ;					c = 1;
   ;	
	mov	si,1
	jmp	short @2@314
@2@290:
   ;	
   ;				else
   ;					c = 0;
   ;	
	xor	si,si
@2@314:
	inc	di
@2@338:
	cmp	di,word ptr [bp+4]
	jl	short @2@242
@2@362:
   ;	
   ;			}
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@comp$qiii	endp
   ;	
   ;	void border(void)
   ;	
	assume	cs:_TEXT
@border$qv	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		int c;
   ;		textcolor(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		textbackground(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;		gotoxy(1, 1);
   ;	
	mov	ax,1
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		comp(80, 1);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,80
	push	ax
	call	near ptr @comp$qiii
	add	sp,6
   ;	
   ;		gotoxy(1, 25);
   ;	
	mov	ax,25
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		comp(79, 1);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,79
	push	ax
	call	near ptr @comp$qiii
	add	sp,6
   ;	
   ;		c = 1;
   ;	
	mov	di,1
   ;	
   ;		for (int i = 0; i < 23; i++)
   ;	
	xor	si,si
	jmp	short @3@146
@3@50:
   ;	
   ;		{
   ;			gotoxy(1, i + 2);
   ;	
	mov	ax,si
	inc	ax
	inc	ax
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	
   ;			cprintf("%d", c);
   ;	
	push	di
	mov	ax,offset DGROUP:s@+16
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;	
   ;			if (c == 0)
   ;	
	or	di,di
	jne	short @3@98
   ;	
   ;				c = 1;
   ;	
	mov	di,1
	jmp	short @3@122
@3@98:
   ;	
   ;			else
   ;				c = 0;
   ;	
	xor	di,di
@3@122:
	inc	si
@3@146:
	cmp	si,23
	jl	short @3@50
   ;	
   ;		}
   ;	
   ;		c = 0;
   ;	
	xor	di,di
   ;	
   ;		for (i = 0; i < 23; i++)
   ;	
	xor	si,si
	jmp	short @3@290
@3@194:
   ;	
   ;		{
   ;			gotoxy(80, i + 2);
   ;	
	mov	ax,si
	inc	ax
	inc	ax
	push	ax
	mov	ax,80
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	
   ;			cprintf("%d", c);
   ;	
	push	di
	mov	ax,offset DGROUP:s@+19
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;	
   ;			if (c == 0)
   ;	
	or	di,di
	jne	short @3@242
   ;	
   ;				c = 1;
   ;	
	mov	di,1
	jmp	short @3@266
@3@242:
   ;	
   ;			else
   ;				c = 0;
   ;	
	xor	di,di
@3@266:
	inc	si
@3@290:
	cmp	si,23
	jl	short @3@194
   ;	
   ;		}
   ;		gotoxy(78, 25);
   ;	
	mov	ax,25
	push	ax
	mov	ax,78
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf(" 1");
   ;	
	mov	ax,offset DGROUP:s@+22
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@border$qv	endp
   ;	
   ;	void title(void)
   ;	
	assume	cs:_TEXT
@title$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		gotoxy(26, 2);
   ;	
	mov	ax,2
	push	ax
	mov	ax,26
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		textcolor(RED);
   ;	
	mov	ax,4
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		cprintf("V P a s s  M a n a g e r");
   ;	
	mov	ax,offset DGROUP:s@+25
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		gotoxy(1, 3);
   ;	
	mov	ax,3
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		line(78, 0, (char)196);
   ;	
	mov	al,196
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,78
	push	ax
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;		gotoxy(1, 5);
   ;	
	mov	ax,5
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		line(78, 0, (char)196);
   ;	
	mov	al,196
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,78
	push	ax
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@title$qv	endp
   ;	
   ;	void box(int a, int b, int c, int d)
   ;	
	assume	cs:_TEXT
@box$qiiii	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{
   ;		textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		gotoxy(a, b);
   ;	
	push	word ptr [bp+6]
	push	di
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		line(d, 0, (char)205);
   ;	
	mov	al,205
	push	ax
	xor	ax,ax
	push	ax
	push	word ptr [bp+10]
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;		gotoxy(a, c);
   ;	
	push	word ptr [bp+8]
	push	di
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		line(d, 0, (char)205);
   ;	
	mov	al,205
	push	ax
	xor	ax,ax
	push	ax
	push	word ptr [bp+10]
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;		for (int i = b + 1; i < c; i++)
   ;	
	mov	ax,word ptr [bp+6]
	inc	ax
	mov	si,ax
	jmp	short @5@98
@5@50:
   ;	
   ;		{
   ;			gotoxy(a, i);
   ;	
	push	si
	push	di
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("%c", (char)186);
   ;	
	mov	ax,65466
	push	ax
	mov	ax,offset DGROUP:s@+50
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;			gotoxy(a + d - 1, i);
   ;	
	push	si
	mov	ax,di
	add	ax,word ptr [bp+10]
	dec	ax
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("%c", (char)186);
   ;	
	mov	ax,65466
	push	ax
	mov	ax,offset DGROUP:s@+53
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
	inc	si
@5@98:
	cmp	si,word ptr [bp+8]
	jl	short @5@50
   ;	
   ;		}
   ;		gotoxy(a, b);
   ;	
	push	word ptr [bp+6]
	push	di
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("%c", (char)201);
   ;	
	mov	ax,65481
	push	ax
	mov	ax,offset DGROUP:s@+56
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;		gotoxy(a, c);
   ;	
	push	word ptr [bp+8]
	push	di
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("%c", (char)200);
   ;	
	mov	ax,65480
	push	ax
	mov	ax,offset DGROUP:s@+59
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;		gotoxy(a + d - 1, b);
   ;	
	push	word ptr [bp+6]
	mov	ax,di
	add	ax,word ptr [bp+10]
	dec	ax
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("%c", (char)187);
   ;	
	mov	ax,65467
	push	ax
	mov	ax,offset DGROUP:s@+62
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;		gotoxy(a + d - 1, c);
   ;	
	push	word ptr [bp+8]
	mov	ax,di
	add	ax,word ptr [bp+10]
	dec	ax
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("%c", (char)188);
   ;	
	mov	ax,65468
	push	ax
	mov	ax,offset DGROUP:s@+65
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@box$qiiii	endp
   ;	
   ;	void boxi(int a, int b, int c, int d, int e = 0)
   ;	
	assume	cs:_TEXT
@boxi$qiiiii	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{
   ;		if (e)
   ;	
	cmp	word ptr [bp+12],0
	je	short @6@74
   ;	
   ;			textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
	jmp	short @6@98
@6@74:
   ;	
   ;		else
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
@6@98:
   ;	
   ;		gotoxy(a, b);
   ;	
	push	word ptr [bp+6]
	push	di
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		line(d, 0, (char)196);
   ;	
	mov	al,196
	push	ax
	xor	ax,ax
	push	ax
	push	word ptr [bp+10]
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;		gotoxy(a, c);
   ;	
	push	word ptr [bp+8]
	push	di
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		line(d, 0, (char)196);
   ;	
	mov	al,196
	push	ax
	xor	ax,ax
	push	ax
	push	word ptr [bp+10]
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;		for (int i = b + 1; i < c; i++)
   ;	
	mov	ax,word ptr [bp+6]
	inc	ax
	mov	si,ax
	jmp	short @6@170
@6@122:
   ;	
   ;		{
   ;			gotoxy(a, i);
   ;	
	push	si
	push	di
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("%c", (char)179);
   ;	
	mov	ax,65459
	push	ax
	mov	ax,offset DGROUP:s@+68
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;			gotoxy(a + d - 1, i);
   ;	
	push	si
	mov	ax,di
	add	ax,word ptr [bp+10]
	dec	ax
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("%c", (char)179);
   ;	
	mov	ax,65459
	push	ax
	mov	ax,offset DGROUP:s@+71
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
	inc	si
@6@170:
	cmp	si,word ptr [bp+8]
	jl	short @6@122
   ;	
   ;		}
   ;		gotoxy(a, b);
   ;	
	push	word ptr [bp+6]
	push	di
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("%c", (char)218);
   ;	
	mov	ax,65498
	push	ax
	mov	ax,offset DGROUP:s@+74
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;		gotoxy(a, c);
   ;	
	push	word ptr [bp+8]
	push	di
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("%c", (char)192);
   ;	
	mov	ax,65472
	push	ax
	mov	ax,offset DGROUP:s@+77
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;		gotoxy(a + d - 1, b);
   ;	
	push	word ptr [bp+6]
	mov	ax,di
	add	ax,word ptr [bp+10]
	dec	ax
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("%c", (char)191);
   ;	
	mov	ax,65471
	push	ax
	mov	ax,offset DGROUP:s@+80
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;		gotoxy(a + d - 1, c);
   ;	
	push	word ptr [bp+8]
	mov	ax,di
	add	ax,word ptr [bp+10]
	dec	ax
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("%c", (char)217);
   ;	
	mov	ax,65497
	push	ax
	mov	ax,offset DGROUP:s@+83
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@boxi$qiiiii	endp
	?debug	C E9D055FE7C0B454E43525950542E435050
_TEXT	ends
_DATA	segment word public 'DATA'
	db	0
	db	2 dup (0)
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	int getkey(void)
   ;	
	assume	cs:_TEXT
@getkey$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,88
	push	si
	push	di
   ;	
   ;	{
   ;		fstream fptr;
   ;	
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-88]
	push	ax
	call	near ptr @fstream@$bctr$qv
	pop	cx
	pop	cx
   ;	
   ;		fptr.open("KEYFILE.VPD", ios::in | ios::out | ios::app | ios::ate);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,15
	push	ax
	mov	ax,offset DGROUP:s@+86
	push	ax
	lea	ax,word ptr [bp-88]
	push	ax
	call	near ptr @fstreambase@open$qpxzcii
	add	sp,8
   ;	
   ;		fptr.seekg(0);
   ;	
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	lea	ax,word ptr [bp-48]
	push	ax
	call	near ptr @istream@seekg$ql
	add	sp,6
   ;	
   ;	
   ;		char num[3] = {0};
   ;	
	lea	ax,word ptr [bp-4]
	push	ss
	push	ax
	mov	ax,offset DGROUP:d@+10
	push	ds
	push	ax
	mov	cx,3
	call	near ptr N_SCOPY@
   ;	
   ;		int i = 0;
   ;	
	xor	si,si
   ;	
   ;		fptr.getline(num, 3);
   ;	
	mov	al,10
	push	ax
	mov	ax,3
	push	ax
	lea	ax,word ptr [bp-4]
	push	ax
	lea	ax,word ptr [bp-48]
	push	ax
	call	near ptr @istream@getline$qpzcizc
	add	sp,8
   ;	
   ;		i = atoi(num);
   ;	
	lea	ax,word ptr [bp-4]
	push	ax
	call	near ptr _atol
	pop	cx
	mov	si,ax
   ;	
   ;		fptr.close();
   ;	
	lea	ax,word ptr [bp-88]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;		return i;
   ;	
	mov	di,si
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-88]
	push	ax
	call	near ptr @fstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,di
	jmp	short @7@50
@7@50:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@getkey$qv	endp
   ;	
   ;	void putkey(void)
   ;	
	assume	cs:_TEXT
@putkey$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,94
	push	si
   ;	
   ;	{
   ;		fstream fptr;
   ;	
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-94]
	push	ax
	call	near ptr @fstream@$bctr$qv
	pop	cx
	pop	cx
   ;	
   ;		fptr.open("KEYFILE.VPD", ios::in | ios::out | ios::trunc);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,19
	push	ax
	mov	ax,offset DGROUP:s@+98
	push	ax
	lea	ax,word ptr [bp-94]
	push	ax
	call	near ptr @fstreambase@open$qpxzcii
	add	sp,8
   ;	
   ;		fptr.seekg(0);
   ;	
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	lea	ax,word ptr [bp-54]
	push	ax
	call	near ptr @istream@seekg$ql
	add	sp,6
   ;	
   ;		randomize();
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _time
	pop	cx
	push	ax
	call	near ptr _srand
	pop	cx
   ;	
   ;		int i = random(100);
   ;	
	xor	ax,ax
	mov	dx,32768
	push	ax
	push	dx
	call	near ptr _rand
	cwd	
	push	ax
	push	dx
	xor	dx,dx
	mov	ax,100
	pop	cx
	pop	bx
	call	near ptr N_LXMUL@
	push	dx
	push	ax
	call	near ptr N_LDIV@
	mov	si,ax
   ;	
   ;		char num[3];
   ;		int dec, sign;
   ;		strcpy(num, ecvt(i, 2, &dec, &sign));
   ;	
	lea	ax,word ptr [bp-8]
	push	ax
	lea	ax,word ptr [bp-6]
	push	ax
	mov	ax,2
	push	ax
	mov	word ptr [bp-10],si
	FILD	word ptr [bp-10]
	add	sp,65528
	FSTP	qword ptr [bp-110]
	FWAIT	
	call	near ptr _ecvt
	add	sp,14
	push	ax
	lea	ax,word ptr [bp-4]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;		fptr.write(num, 3);
   ;	
	mov	ax,3
	push	ax
	lea	ax,word ptr [bp-4]
	push	ax
	lea	ax,word ptr [bp-48]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;		fptr.close();
   ;	
	lea	ax,word ptr [bp-94]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-94]
	push	ax
	call	near ptr @fstream@$bdtr$qv
	pop	cx
	pop	cx
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@putkey$qv	endp
   ;	
   ;	void encryption(int method, int key = getkey())
   ;	
	assume	cs:_TEXT
@encryption$qii	proc	near
	push	bp
	mov	bp,sp
	sub	sp,194
	push	si
	push	di
   ;	
   ;	{
   ;		fstream fptr;
   ;	
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-94]
	push	ax
	call	near ptr @fstream@$bctr$qv
	pop	cx
	pop	cx
   ;	
   ;	
   ;		fptr.open("USERNAME.VPD", ios::in | ios::out | ios::ate | ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,15
	push	ax
	mov	ax,offset DGROUP:s@+110
	push	ax
	lea	ax,word ptr [bp-94]
	push	ax
	call	near ptr @fstreambase@open$qpxzcii
	add	sp,8
   ;	
   ;		fptr.seekg(0);
   ;	
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	lea	ax,word ptr [bp-54]
	push	ax
	call	near ptr @istream@seekg$ql
	add	sp,6
   ;	
   ;		fptr.seekp(0);
   ;	
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	lea	ax,word ptr [bp-48]
	push	ax
	call	near ptr @ostream@seekp$ql
	add	sp,6
   ;	
   ;	
   ;		char c;
   ;		char data[100];
   ;		int i = 0, n = 0;
   ;	
	mov	word ptr [bp-4],0
	mov	word ptr [bp-6],0
	jmp	short @9@74
@9@50:
   ;	
   ;		while (fptr.eof() == 0)
   ;		{
   ;			fptr.get(c);
   ;	
	lea	ax,word ptr [bp-1]
	push	ax
	lea	ax,word ptr [bp-54]
	push	ax
	call	near ptr @istream@get$qrzc
	pop	cx
	pop	cx
   ;	
   ;			data[i++] = c;
   ;	
	lea	bx,word ptr [bp-194]
	mov	ax,word ptr [bp-4]
	inc	word ptr [bp-4]
	add	bx,ax
	mov	al,byte ptr [bp-1]
	mov	byte ptr [bx],al
@9@74:
	mov	bx,word ptr [bp-94]
	test	word ptr [bx+4],1
	je	short @9@50
   ;	
   ;		}
   ;		data[i] = '\0';
   ;	
	lea	bx,word ptr [bp-194]
	add	bx,word ptr [bp-4]
	mov	byte ptr [bx],0
   ;	
   ;		fptr.close();
   ;	
	lea	ax,word ptr [bp-94]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;	
   ;		fptr.open("USERNAME.VPD", ios::in | ios::out | ios::trunc);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,19
	push	ax
	mov	ax,offset DGROUP:s@+123
	push	ax
	lea	ax,word ptr [bp-94]
	push	ax
	call	near ptr @fstreambase@open$qpxzcii
	add	sp,8
   ;	
   ;		fptr.seekg(0);
   ;	
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	lea	ax,word ptr [bp-54]
	push	ax
	call	near ptr @istream@seekg$ql
	add	sp,6
   ;	
   ;		fptr.seekp(0);
   ;	
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	lea	ax,word ptr [bp-48]
	push	ax
	call	near ptr @ostream@seekp$ql
	add	sp,6
	jmp	@9@434
@9@122:
   ;	
   ;	
   ;		while (n < i - 1)
   ;		{
   ;			if (method)
   ;	
	cmp	word ptr [bp+4],0
	je	short @9@290
   ;	
   ;				fptr.put(data[n] + key);
   ;	
	mov	bx,word ptr [bp-48]
	mov	di,word ptr [bx]
	lea	bx,word ptr [bp-194]
	add	bx,word ptr [bp-6]
	mov	al,byte ptr [bx]
	cbw	
	add	ax,word ptr [bp+6]
	cbw	
	mov	word ptr [bp-8],ax
	mov	ax,word ptr [di+10]
	cmp	ax,word ptr [di+12]
	jb	short @9@194
	mov	al,byte ptr [bp-8]
	mov	ah,0
	push	ax
	push	di
	mov	bx,word ptr [di+20]
	call	word ptr [bx+12]
	pop	cx
	pop	cx
	jmp	short @9@218
@9@194:
	mov	bx,word ptr [di+10]
	inc	word ptr [di+10]
	mov	al,byte ptr [bp-8]
	mov	byte ptr [bx],al
	mov	ah,0
@9@218:
	cmp	ax,65535
	jne	short @9@266
	mov	ax,4
	push	ax
	push	word ptr [bp-48]
	call	near ptr @ios@setstate$qi
	pop	cx
	pop	cx
	jmp	short @9@266
@9@266:
	jmp	short @9@410
@9@290:
   ;	
   ;			else
   ;				fptr.put(data[n] - key);
   ;	
	mov	bx,word ptr [bp-48]
	mov	si,word ptr [bx]
	lea	bx,word ptr [bp-194]
	add	bx,word ptr [bp-6]
	mov	al,byte ptr [bx]
	cbw	
	sub	ax,word ptr [bp+6]
	cbw	
	mov	word ptr [bp-10],ax
	mov	ax,word ptr [si+10]
	cmp	ax,word ptr [si+12]
	jb	short @9@338
	mov	al,byte ptr [bp-10]
	mov	ah,0
	push	ax
	push	si
	mov	bx,word ptr [si+20]
	call	word ptr [bx+12]
	pop	cx
	pop	cx
	jmp	short @9@362
@9@338:
	mov	bx,word ptr [si+10]
	inc	word ptr [si+10]
	mov	al,byte ptr [bp-10]
	mov	byte ptr [bx],al
	mov	ah,0
@9@362:
	cmp	ax,65535
	jne	short @9@410
	mov	ax,4
	push	ax
	push	word ptr [bp-48]
	call	near ptr @ios@setstate$qi
	pop	cx
	pop	cx
	jmp	short @9@410
@9@410:
   ;	
   ;			n++;
   ;	
	inc	word ptr [bp-6]
@9@434:
	mov	ax,word ptr [bp-4]
	dec	ax
	cmp	ax,word ptr [bp-6]
	jle	@@0
	jmp	@9@122
@@0:
   ;	
   ;		}
   ;		fptr.close();
   ;	
	lea	ax,word ptr [bp-94]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-94]
	push	ax
	call	near ptr @fstream@$bdtr$qv
	pop	cx
	pop	cx
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@encryption$qii	endp
_TEXT	ends
_DATA	segment word public 'DATA'
	db	0
	db	0
	db	38 dup (0)
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	int authUSER(char user[])
   ;	
	assume	cs:_TEXT
@authUSER$qpzc	proc	near
	push	bp
	mov	bp,sp
	sub	sp,148
	push	si
	push	di
   ;	
   ;	{
   ;		encryption(0);
   ;	
	call	near ptr @getkey$qv
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr @encryption$qii
	pop	cx
	pop	cx
   ;	
   ;		fstream fptr;
   ;	
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-88]
	push	ax
	call	near ptr @fstream@$bctr$qv
	pop	cx
	pop	cx
   ;	
   ;		fptr.open("USERNAME.VPD", ios::in | ios::out | ios::ate | ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,15
	push	ax
	mov	ax,offset DGROUP:s@+136
	push	ax
	lea	ax,word ptr [bp-88]
	push	ax
	call	near ptr @fstreambase@open$qpxzcii
	add	sp,8
   ;	
   ;		fptr.seekg(0);
   ;	
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	lea	ax,word ptr [bp-48]
	push	ax
	call	near ptr @istream@seekg$ql
	add	sp,6
   ;	
   ;	
   ;		char string[20];
   ;		int check[20] = {0};
   ;	
	lea	ax,word ptr [bp-148]
	push	ss
	push	ax
	mov	ax,offset DGROUP:d@w+13
	push	ds
	push	ax
	mov	cx,40
	call	near ptr N_SCOPY@
   ;	
   ;		int n = 0;
   ;	
	xor	si,si
	jmp	short @10@122
@10@50:
   ;	
   ;	
   ;		while (fptr.eof() == 0)
   ;		{
   ;			fptr >> string;
   ;	
	lea	ax,word ptr [bp-108]
	push	ax
	lea	ax,word ptr [bp-48]
	push	ax
	call	near ptr @istream@$brsh$qpzc
	pop	cx
	pop	cx
   ;	
   ;	
   ;			if (strncmp(string, user, strlen(user)) == 0)
   ;	
	push	word ptr [bp+4]
	call	near ptr _strlen
	pop	cx
	push	ax
	push	word ptr [bp+4]
	lea	ax,word ptr [bp-108]
	push	ax
	call	near ptr _strncmp
	add	sp,6
	or	ax,ax
	jne	short @10@98
   ;	
   ;			{
   ;				check[n] = 1;
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-148]
	add	bx,ax
	mov	word ptr [bx],1
   ;	
   ;				n++;
   ;	
	inc	si
	jmp	short @10@122
@10@98:
   ;	
   ;			}
   ;			else
   ;			{
   ;				n++;
   ;	
	inc	si
@10@122:
	mov	bx,word ptr [bp-88]
	test	word ptr [bx+4],1
	je	short @10@50
   ;	
   ;			}
   ;		}
   ;		putkey();
   ;	
	call	near ptr @putkey$qv
   ;	
   ;		fptr.close();
   ;	
	lea	ax,word ptr [bp-88]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;		encryption(1);
   ;	
	call	near ptr @getkey$qv
	push	ax
	mov	ax,1
	push	ax
	call	near ptr @encryption$qii
	pop	cx
	pop	cx
   ;	
   ;		for (int i = 0; i < n; i++)
   ;	
	xor	di,di
	jmp	short @10@242
@10@170:
   ;	
   ;		{
   ;			if (check[i] == 1)
   ;	
	mov	ax,di
	shl	ax,1
	lea	bx,word ptr [bp-148]
	add	bx,ax
	cmp	word ptr [bx],1
	jne	short @10@218
   ;	
   ;				return 1;
   ;	
	mov	word ptr [bp-4],1
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-88]
	push	ax
	call	near ptr @fstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-4]
	jmp	short @10@290
@10@218:
	inc	di
@10@242:
	cmp	di,si
	jl	short @10@170
   ;	
   ;		}
   ;		return 0;
   ;	
	mov	word ptr [bp-2],0
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-88]
	push	ax
	call	near ptr @fstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-2]
	jmp	short @10@290
@10@290:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@authUSER$qpzc	endp
   ;	
   ;	int addUser(char user[])
   ;	
	assume	cs:_TEXT
@addUser$qpzc	proc	near
	push	bp
	mov	bp,sp
	sub	sp,86
	push	si
	push	di
   ;	
   ;	{
   ;		int i = authUSER(user);
   ;	
	push	word ptr [bp+4]
	call	near ptr @authUSER$qpzc
	pop	cx
	mov	word ptr [bp-2],ax
   ;	
   ;		if (!i)
   ;	
	cmp	word ptr [bp-2],0
	je	@@1
	jmp	@11@242
@@1:
   ;	
   ;		{
   ;			encryption(0);
   ;	
	call	near ptr @getkey$qv
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr @encryption$qii
	pop	cx
	pop	cx
   ;	
   ;			fstream fptr;
   ;	
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @fstream@$bctr$qv
	pop	cx
	pop	cx
   ;	
   ;			fptr.open("USERNAME.VPD", ios::in | ios::out | ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,11
	push	ax
	mov	ax,offset DGROUP:s@+149
	push	ax
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @fstreambase@open$qpxzcii
	add	sp,8
   ;	
   ;			fptr.put('\n');
   ;	
	mov	bx,word ptr [bp-40]
	mov	si,word ptr [bx]
	mov	ax,word ptr [si+10]
	cmp	ax,word ptr [si+12]
	jb	short @11@122
	mov	ax,10
	push	ax
	push	si
	mov	bx,word ptr [si+20]
	call	word ptr [bx+12]
	pop	cx
	pop	cx
	jmp	short @11@146
@11@122:
	mov	bx,word ptr [si+10]
	inc	word ptr [si+10]
	mov	al,10
	mov	byte ptr [bx],al
	mov	ah,0
@11@146:
	cmp	ax,65535
	jne	short @11@194
	mov	ax,4
	push	ax
	push	word ptr [bp-40]
	call	near ptr @ios@setstate$qi
	pop	cx
	pop	cx
	jmp	short @11@194
@11@194:
   ;	
   ;			fptr.write(user, strlen(user));
   ;	
	push	word ptr [bp+4]
	call	near ptr _strlen
	pop	cx
	push	ax
	push	word ptr [bp+4]
	lea	ax,word ptr [bp-40]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;			fptr.close();
   ;	
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;			putkey();
   ;	
	call	near ptr @putkey$qv
   ;	
   ;			encryption(1);
   ;	
	call	near ptr @getkey$qv
	push	ax
	mov	ax,1
	push	ax
	call	near ptr @encryption$qii
	pop	cx
	pop	cx
   ;	
   ;			return 1;
   ;	
	mov	di,1
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @fstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,di
	jmp	short @11@266
	jmp	short @11@266
@11@242:
   ;	
   ;		}
   ;		else
   ;			return 0;
   ;	
	xor	ax,ax
	jmp	short @11@266
@11@266:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@addUser$qpzc	endp
_TEXT	ends
_DATA	segment word public 'DATA'
	db	0
	db	0
	db	38 dup (0)
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	int AUTHORIZE(char user[], char pass[])
   ;	
	assume	cs:_TEXT
@AUTHORIZE$qpzct1	proc	near
	push	bp
	mov	bp,sp
	sub	sp,256
	push	si
	push	di
   ;	
   ;	{
   ;		fstream Uptr, Pptr;
   ;	
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-92]
	push	ax
	call	near ptr @fstream@$bctr$qv
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-176]
	push	ax
	call	near ptr @fstream@$bctr$qv
	pop	cx
	pop	cx
   ;	
   ;		Uptr.open("USERNAME.VPD", ios::in | ios::out | ios::ate | ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,15
	push	ax
	mov	ax,offset DGROUP:s@+162
	push	ax
	lea	ax,word ptr [bp-92]
	push	ax
	call	near ptr @fstreambase@open$qpxzcii
	add	sp,8
   ;	
   ;		Pptr.open("PASSWORD.VPD", ios::in | ios::out | ios::ate);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,7
	push	ax
	mov	ax,offset DGROUP:s@+175
	push	ax
	lea	ax,word ptr [bp-176]
	push	ax
	call	near ptr @fstreambase@open$qpxzcii
	add	sp,8
   ;	
   ;		Uptr.seekg(0);
   ;	
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	lea	ax,word ptr [bp-52]
	push	ax
	call	near ptr @istream@seekg$ql
	add	sp,6
   ;	
   ;		Pptr.seekg(0);
   ;	
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	lea	ax,word ptr [bp-136]
	push	ax
	call	near ptr @istream@seekg$ql
	add	sp,6
   ;	
   ;	
   ;		char USER[20], PASS[20];
   ;		int check[20] = {0};
   ;	
	lea	ax,word ptr [bp-256]
	push	ss
	push	ax
	mov	ax,offset DGROUP:d@w+53
	push	ds
	push	ax
	mov	cx,40
	call	near ptr N_SCOPY@
   ;	
   ;		int n = 0, i = 0;
   ;	
	xor	si,si
	mov	word ptr [bp-2],0
	jmp	@12@266
@12@50:
   ;	
   ;	
   ;		while (Uptr.eof() == 0)
   ;		{
   ;			Uptr >> USER; //cout<<USER<<"."<<endl;
   ;	
	lea	ax,word ptr [bp-196]
	push	ax
	lea	ax,word ptr [bp-52]
	push	ax
	call	near ptr @istream@$brsh$qpzc
	pop	cx
	pop	cx
   ;	
   ;			Pptr >> PASS; //cout<<PASS<<"."<<endl;
   ;	
	lea	ax,word ptr [bp-216]
	push	ax
	lea	ax,word ptr [bp-136]
	push	ax
	call	near ptr @istream@$brsh$qpzc
	pop	cx
	pop	cx
   ;	
   ;	
   ;			if (strcmp(USER, user) == 0)
   ;	
	push	word ptr [bp+4]
	lea	ax,word ptr [bp-196]
	push	ax
	call	near ptr _strcmp
	pop	cx
	pop	cx
	or	ax,ax
	jne	short @12@242
   ;	
   ;			{
   ;				check[n] = 1;
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-256]
	add	bx,ax
	mov	word ptr [bx],1
   ;	
   ;				n++;
   ;	
	inc	si
   ;	
   ;				if (strlen(PASS) == strlen(pass))
   ;	
	lea	ax,word ptr [bp-216]
	push	ax
	call	near ptr _strlen
	pop	cx
	push	ax
	push	word ptr [bp+6]
	call	near ptr _strlen
	pop	cx
	pop	dx
	cmp	dx,ax
	jne	short @12@170
   ;	
   ;				{
   ;					if (strncmp(PASS, pass, strlen(pass)) == 0)
   ;	
	push	word ptr [bp+6]
	call	near ptr _strlen
	pop	cx
	push	ax
	push	word ptr [bp+6]
	lea	ax,word ptr [bp-216]
	push	ax
	call	near ptr _strncmp
	add	sp,6
	or	ax,ax
	jne	short @12@146
   ;	
   ;						i = 1;
   ;	
	mov	word ptr [bp-2],1
@12@146:
	jmp	short @12@218
@12@170:
   ;	
   ;				}
   ;				else
   ;				{
   ;					if (strcmp(PASS, pass) == 0)
   ;	
	push	word ptr [bp+6]
	lea	ax,word ptr [bp-216]
	push	ax
	call	near ptr _strcmp
	pop	cx
	pop	cx
	or	ax,ax
	jne	short @12@218
   ;	
   ;						i = 1;
   ;	
	mov	word ptr [bp-2],1
@12@218:
	jmp	short @12@266
@12@242:
   ;	
   ;				}
   ;			}
   ;			else
   ;			{
   ;				n++;
   ;	
	inc	si
@12@266:
	mov	bx,word ptr [bp-92]
	test	word ptr [bx+4],1
	jne	@@2
	jmp	@12@50
@@2:
   ;	
   ;			}
   ;		}
   ;	
   ;		Uptr.close();
   ;	
	lea	ax,word ptr [bp-92]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;		Pptr.close();
   ;	
	lea	ax,word ptr [bp-176]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;	
   ;		if (i)
   ;	
	cmp	word ptr [bp-2],0
	je	short @12@362
   ;	
   ;			return 1;
   ;	
	mov	word ptr [bp-4],1
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-176]
	push	ax
	call	near ptr @fstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-92]
	push	ax
	call	near ptr @fstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-4]
	jmp	short @12@506
	jmp	short @12@506
@12@362:
   ;	
   ;		else
   ;		{
   ;			for (int i = 0; i < n; i++)
   ;	
	xor	di,di
	jmp	short @12@458
@12@386:
   ;	
   ;			{
   ;				if (check[i] == 1)
   ;	
	mov	ax,di
	shl	ax,1
	lea	bx,word ptr [bp-256]
	add	bx,ax
	cmp	word ptr [bx],1
	jne	short @12@434
   ;	
   ;					return 2;
   ;	
	mov	word ptr [bp-8],2
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-176]
	push	ax
	call	near ptr @fstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-92]
	push	ax
	call	near ptr @fstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-8]
	jmp	short @12@506
@12@434:
	inc	di
@12@458:
	cmp	di,si
	jl	short @12@386
   ;	
   ;			}
   ;			return 0;
   ;	
	mov	word ptr [bp-6],0
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-176]
	push	ax
	call	near ptr @fstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-92]
	push	ax
	call	near ptr @fstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-6]
	jmp	short @12@506
@12@506:
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@AUTHORIZE$qpzct1	endp
	?debug	C E9D055FE7C0B4C4943454E53452E435050
   ;	
   ;	void lic(void)
   ;	
	assume	cs:_TEXT
@lic$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;		textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;		textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		gotoxy(25, 1);
   ;	
	mov	ax,1
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		line(28, 0, (char)196);
   ;	
	mov	al,196
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,28
	push	ax
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;		gotoxy(25, 4);
   ;	
	mov	ax,4
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		line(28, 0, (char)196);
   ;	
	mov	al,196
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,28
	push	ax
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;		textcolor(RED);
   ;	
	mov	ax,4
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		gotoxy(35, 2);
   ;	
	mov	ax,2
	push	ax
	mov	ax,35
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("END USER");
   ;	
	mov	ax,offset DGROUP:s@+188
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(30, 3);
   ;	
	mov	ax,3
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("LICENSE AGREEMENT");
   ;	
	mov	ax,offset DGROUP:s@+197
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@lic$qv	endp
   ;	
   ;	int license(int n = 0)
   ;	
	assume	cs:_TEXT
@license$qi	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		if (!n || n)
   ;	
	or	si,si
	je	short @14@74
	or	si,si
	jne	@@3
	jmp	@14@626
@@3:
@14@74:
   ;	
   ;		{
   ;			clrscr();
   ;	
	call	near ptr _clrscr
@14@98:
   ;	
   ;	
   ;		page1:
   ;			if (choice == (char)27)
   ;	
	cmp	byte ptr DGROUP:_choice,27
	jne	short @14@146
   ;	
   ;				clrscr();
   ;	
	call	near ptr _clrscr
@14@146:
   ;	
   ;			lic();
   ;	
	call	near ptr @lic$qv
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(5, 6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("This License Agreement (the \"AGREEMENT\") is a legal agreement between");
   ;	
	mov	ax,offset DGROUP:s@+215
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("you individually, or if you are authorized to acquire the Software on");
   ;	
	mov	ax,offset DGROUP:s@+285
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("behalf of your company or another organization , between the entities");
   ;	
	mov	ax,offset DGROUP:s@+355
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("for whose benefit you act.");
   ;	
	mov	ax,offset DGROUP:s@+425
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			gotoxy(5, 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("BY INDICATING YOUR ACCEPTANCE BY CLICKING ON THE APPROPRIATE BUTTON ,");
   ;	
	mov	ax,offset DGROUP:s@+452
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("OR BY INSTALLING, ACTIVATING OR USING THE SOFTWARE , YOU ARE AGREEING");
   ;	
	mov	ax,offset DGROUP:s@+522
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("TO BE BOUND BY THE TERMS OF THIS AGREEMENT.");
   ;	
	mov	ax,offset DGROUP:s@+592
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("IF YOU HAVE ANY QUESTION OR CONCERNS ABOUT THE TERMS OF THE AGREEMENT");
   ;	
	mov	ax,offset DGROUP:s@+636
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("PLEASE CONTACT US AT - ");
   ;	
	mov	ax,offset DGROUP:s@+706
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(5, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("vivekpatel111@yahoo.co.in");
   ;	
	mov	ax,offset DGROUP:s@+730
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(5, 18);
   ;	
	mov	ax,18
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("IF, PRIOR TO ACTIVATING OR USING THE SOFTWARE, YOU DECIDE YOU ARE NOT");
   ;	
	mov	ax,offset DGROUP:s@+756
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 19);
   ;	
	mov	ax,19
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("WILLING TO AGREE TO THE TERMS OF THIS AGREEMENT, YOU HAVE NO RIGHT TO"); //
   ;	
	mov	ax,offset DGROUP:s@+826
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("USE THE SOFTWARE AND SHOULD RETURN IT, DELETE OR DISABLE IT.");
   ;	
	mov	ax,offset DGROUP:s@+896
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			gotoxy(25, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			cprintf("Press any key to continue...");
   ;	
	mov	ax,offset DGROUP:s@+957
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;	
   ;			if (choice == (char)27)
   ;	
	cmp	byte ptr DGROUP:_choice,27
	jne	short @14@194
   ;	
   ;				return 1;
   ;	
	mov	ax,1
	jmp	@14@914
@14@194:
   ;	
   ;	
   ;		page2:
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			lic();
   ;	
	call	near ptr @lic$qv
   ;	
   ;			textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(5, 6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("1. GRANT OF LICENSE");
   ;	
	mov	ax,offset DGROUP:s@+986
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(5, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("Subject to the terms below, This software hereby grants You a personal");
   ;	
	mov	ax,offset DGROUP:s@+1006
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf(",revocable, non-exclusive, non-transferable license to install and use");
   ;	
	mov	ax,offset DGROUP:s@+1077
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("a copy of the Software on only one computer.  You may not rent, lease,");
   ;	
	mov	ax,offset DGROUP:s@+1148
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("lend, sell, redistribute or sublicense the Software.  You may not copy");
   ;	
	mov	ax,offset DGROUP:s@+1219
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("( other than 1 back-up copy for archival purposes only ) , decompile ,");
   ;	
	mov	ax,offset DGROUP:s@+1290
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("reverse engineer , disassemble , attempt to derive the source code of,");
   ;	
	mov	ax,offset DGROUP:s@+1361
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("modify , or create derivative works of the Software , any updates , or");
   ;	
	mov	ax,offset DGROUP:s@+1432
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("any things there of  (  except as and only to the extent any foregoing");
   ;	
	mov	ax,offset DGROUP:s@+1503
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("restriction is prohibited by applicable law or to the extent as may be");
   ;	
	mov	ax,offset DGROUP:s@+1574
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("permitted by the licensing terms and governing use of any open sourced");
   ;	
	mov	ax,offset DGROUP:s@+1645
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 18);
   ;	
	mov	ax,18
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("components, if any, included with the Software). This license does not");
   ;	
	mov	ax,offset DGROUP:s@+1716
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 19);
   ;	
	mov	ax,19
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("imply any rights to future upgrades or updates of the Software.");
   ;	
	mov	ax,offset DGROUP:s@+1787
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			gotoxy(25, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			cprintf("Press any key to continue...");
   ;	
	mov	ax,offset DGROUP:s@+1851
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;			if (choice == (char)27)
   ;	
	cmp	byte ptr DGROUP:_choice,27
	jne	short @14@242
   ;	
   ;				goto page1;
   ;	
	jmp	@14@98
@14@242:
   ;	
   ;	
   ;		page3:
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			lic();
   ;	
	call	near ptr @lic$qv
   ;	
   ;			textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(5, 6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("2. INTELLECTUAL PROPERTY");
   ;	
	mov	ax,offset DGROUP:s@+1880
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(5, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("You  do not acquire  any  intellectual property  or  other proprietary");
   ;	
	mov	ax,offset DGROUP:s@+1905
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("rights, including patents, designs, trademarks, copyright or rights in");
   ;	
	mov	ax,offset DGROUP:s@+1976
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("any  confidential  information   or secrets ,  in  or relating to  the");
   ;	
	mov	ax,offset DGROUP:s@+2047
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("Software.");
   ;	
	mov	ax,offset DGROUP:s@+2118
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(5, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("3. DATA STORAGE");
   ;	
	mov	ax,offset DGROUP:s@+2128
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(5, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("This Software assumes  no  responsibility  or liability whatsoever for");
   ;	
	mov	ax,offset DGROUP:s@+2144
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("the deletion or failure to store your data or information.");
   ;	
	mov	ax,offset DGROUP:s@+2215
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			gotoxy(25, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			cprintf("Press any key to continue...");
   ;	
	mov	ax,offset DGROUP:s@+2274
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;			if (choice == (char)27)
   ;	
	cmp	byte ptr DGROUP:_choice,27
	jne	short @14@290
   ;	
   ;				goto page2;
   ;	
	jmp	@14@194
@14@290:
   ;	
   ;	
   ;		page4:
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			lic();
   ;	
	call	near ptr @lic$qv
   ;	
   ;			textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(5, 6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("4. NO WARRANTY");
   ;	
	mov	ax,offset DGROUP:s@+2303
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(5, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("YOU EXPRESSLY ACKNOWLEDGE AND AGREE  THAT YOUR USE OF THE SOFTWARE AND");
   ;	
	mov	ax,offset DGROUP:s@+2318
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("RELATED SERVICES ARE AT YOUR SOLE RISK AND THAT THE ENTIRE RISKS AS TO");
   ;	
	mov	ax,offset DGROUP:s@+2389
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("SATISFACTORY QUALITY, PERFORMANCE, ACCURACY AND EFFORT IS WITH YOU. TO");
   ;	
	mov	ax,offset DGROUP:s@+2460
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("THE MAXIMUM EXTENT PERMITTED BY  APPLICABLE LAW , THE SOFTWARE AND ANY");
   ;	
	mov	ax,offset DGROUP:s@+2531
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("RELATED SERVICES  ARE  PROVIDED \"AS IS\" AND \"AS AVAILABLE\" ,  WITH ALL");
   ;	
	mov	ax,offset DGROUP:s@+2602
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 18);
   ;	
	mov	ax,18
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("FAULTS AND  WITHOUT WARRANTY OF ANY KIND , AND  I HEREBY DISCLAIMS ALL");
   ;	
	mov	ax,offset DGROUP:s@+2673
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("WARRANTIES  AND  CONDITIONS WITH RESPECT  TO  THE SOFTWARE AND RELATED");
   ;	
	mov	ax,offset DGROUP:s@+2744
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("SERVICES.");
   ;	
	mov	ax,offset DGROUP:s@+2815
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			gotoxy(25, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			cprintf("Press any key to continue...");
   ;	
	mov	ax,offset DGROUP:s@+2825
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;			if (choice == (char)27)
   ;	
	cmp	byte ptr DGROUP:_choice,27
	jne	short @14@338
   ;	
   ;				goto page3;
   ;	
	jmp	@14@242
@14@338:
   ;	
   ;	
   ;		page5:
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			lic();
   ;	
	call	near ptr @lic$qv
   ;	
   ;			textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(5, 6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("5. CONSENT TO USE OF DATA");
   ;	
	mov	ax,offset DGROUP:s@+2854
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(5, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("You agree that  this software may collect and  use technical data  and");
   ;	
	mov	ax,offset DGROUP:s@+2880
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("related information,including but not limited to technical information");
   ;	
	mov	ax,offset DGROUP:s@+2951
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("about Your Computer, system and application software.");
   ;	
	mov	ax,offset DGROUP:s@+3022
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(5, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("6. TERMINATION");
   ;	
	mov	ax,offset DGROUP:s@+3076
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(5, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("This Agreement shall terminate automatically without notice from us if");
   ;	
	mov	ax,offset DGROUP:s@+3091
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("you fail to comply with any of the terms of this Agreement , the Terms");
   ;	
	mov	ax,offset DGROUP:s@+3162
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 18);
   ;	
	mov	ax,18
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("of Service, or Your subscription. Upon termination of the license, you");
   ;	
	mov	ax,offset DGROUP:s@+3233
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 19);
   ;	
	mov	ax,19
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("shall cease all use of the Software and related services , and destroy");
   ;	
	mov	ax,offset DGROUP:s@+3304
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("all copies, full or partial, of the Software.");
   ;	
	mov	ax,offset DGROUP:s@+3375
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			gotoxy(25, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			cprintf("Press any key to continue...");
   ;	
	mov	ax,offset DGROUP:s@+3421
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;			if (choice == (char)27)
   ;	
	cmp	byte ptr DGROUP:_choice,27
	jne	short @14@386
   ;	
   ;				goto page4;
   ;	
	jmp	@14@290
@14@386:
   ;	
   ;	
   ;		page6:
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			lic();
   ;	
	call	near ptr @lic$qv
   ;	
   ;			textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(5, 6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("7. REDISTRIBUTED CODE");
   ;	
	mov	ax,offset DGROUP:s@+3450
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(5, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("The  Software  may  contain  binary  representations  of  third  party");
   ;	
	mov	ax,offset DGROUP:s@+3472
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("components  which  may be  open  source libraries . Unless required by");
   ;	
	mov	ax,offset DGROUP:s@+3543
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("applicable law , redistributed software in this Section is distributed");
   ;	
	mov	ax,offset DGROUP:s@+3614
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("\"AS IS\", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, AND WITHOUT");
   ;	
	mov	ax,offset DGROUP:s@+3685
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("ANY LIABILITY OF ANY KIND WHATSOEVER TO EMTRACE.Text file accompanying");
   ;	
	mov	ax,offset DGROUP:s@+3756
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("the Software will specify  type of redistributed code included  in the");
   ;	
	mov	ax,offset DGROUP:s@+3827
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("Software , together with the applicable  redistributed code license or");
   ;	
	mov	ax,offset DGROUP:s@+3898
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(5, 15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("reference thereto.");
   ;	
	mov	ax,offset DGROUP:s@+3969
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			gotoxy(23, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			if (n)
   ;	
	or	si,si
	je	short @14@434
   ;	
   ;				cprintf("  Press any key to continue...");
   ;	
	mov	ax,offset DGROUP:s@+3988
	push	ax
	call	near ptr _cprintf
	pop	cx
	jmp	short @14@458
@14@434:
   ;	
   ;			else
   ;				cprintf("Press any key to go into HELP...");
   ;	
	mov	ax,offset DGROUP:s@+4019
	push	ax
	call	near ptr _cprintf
	pop	cx
@14@458:
   ;	
   ;			choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;			if (choice == (char)27)
   ;	
	cmp	byte ptr DGROUP:_choice,27
	jne	short @14@506
   ;	
   ;				goto page5;
   ;	
	jmp	@14@338
@14@506:
   ;	
   ;	
   ;			if (n)
   ;	
	or	si,si
	je	short @14@578
   ;	
   ;				goto last;
   ;	
	jmp	short @14@626
	jmp	short @14@602
@14@578:
   ;	
   ;			else
   ;				return 1;
   ;	
	mov	ax,1
	jmp	@14@914
@14@602:
	jmp	@14@914
@14@626:
   ;	
   ;		}
   ;		else
   ;		{
   ;		last:
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			lic();
   ;	
	call	near ptr @lic$qv
   ;	
   ;			textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(10, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,10
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("By clicking \"ACCEPT\" below , you electronically agree to our");
   ;	
	mov	ax,offset DGROUP:s@+4052
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(10, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,10
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("Terms of Services and Privacy Policy ( the \" Terms \" ) ; you");
   ;	
	mov	ax,offset DGROUP:s@+4113
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(10, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,10
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("acknowledge receipts  of our Terms , and you agree to adopt");
   ;	
	mov	ax,offset DGROUP:s@+4174
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(10, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,10
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("whotoever written in the Terms of Service.");
   ;	
	mov	ax,offset DGROUP:s@+4234
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			gotoxy(30, 17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			textcolor(RED);
   ;	
	mov	ax,4
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			cprintf("A");
   ;	
	mov	ax,offset DGROUP:s@+4277
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			cprintf("CCEPT");
   ;	
	mov	ax,offset DGROUP:s@+4279
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			gotoxy(40, 17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,40
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			textcolor(RED);
   ;	
	mov	ax,4
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			cprintf("D");
   ;	
	mov	ax,offset DGROUP:s@+4285
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			cprintf("ECLINE");
   ;	
	mov	ax,offset DGROUP:s@+4287
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(27, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,27
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("... Press Character ...");
   ;	
	mov	ax,offset DGROUP:s@+4294
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;			if (choice == (char)27)
   ;	
	cmp	byte ptr DGROUP:_choice,27
	jne	short @14@698
   ;	
   ;				goto page6;
   ;	
	jmp	@14@386
	jmp	@14@914
@14@698:
   ;	
   ;	
   ;			else if (choice == 'A' || choice == 'a')
   ;	
	cmp	byte ptr DGROUP:_choice,65
	je	short @14@746
	cmp	byte ptr DGROUP:_choice,97
	jne	short @14@794
@14@746:
   ;	
   ;			{
   ;				gotoxy(30, 17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				textcolor(RED + BLINK);
   ;	
	mov	ax,132
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				cprintf("A");
   ;	
	mov	ax,offset DGROUP:s@+4318
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				textcolor(BLUE + BLINK);
   ;	
	mov	ax,129
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				cprintf("CCEPT");
   ;	
	mov	ax,offset DGROUP:s@+4320
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				delay(500);
   ;	
	mov	ax,500
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				return 1;
   ;	
	mov	ax,1
	jmp	@14@914
	jmp	@14@914
@14@794:
   ;	
   ;			}
   ;	
   ;			else if (choice == 'D' || choice == 'd')
   ;	
	cmp	byte ptr DGROUP:_choice,68
	je	short @14@842
	cmp	byte ptr DGROUP:_choice,100
	je	@@4
	jmp	@14@890
@@4:
@14@842:
   ;	
   ;			{
   ;				gotoxy(40, 17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,40
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				textcolor(RED + BLINK);
   ;	
	mov	ax,132
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				cprintf("D");
   ;	
	mov	ax,offset DGROUP:s@+4326
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				textcolor(BLUE + BLINK);
   ;	
	mov	ax,129
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				cprintf("ECLINE");
   ;	
	mov	ax,offset DGROUP:s@+4328
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				delay(500);
   ;	
	mov	ax,500
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;				gotoxy(15, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,15
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				textcolor(RED);
   ;	
	mov	ax,4
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				cprintf("YOU DON'T HAVE ANY PRIVILEGE TO USE THIS SOFTWARE.");
   ;	
	mov	ax,offset DGROUP:s@+4335
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				gotoxy(11, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,11
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("YOU MUST ACCEPT \"TERMS & CONDITIONS\" TO USE THIS SOFTWARE.");
   ;	
	mov	ax,offset DGROUP:s@+4386
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				gotoxy(14, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("KINDLY RESTART THE  APPLICATION TO USE THE SOFTWARE.");
   ;	
	mov	ax,offset DGROUP:s@+4445
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				gotoxy(16, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,16
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("OR DELETE THE SOFTWARE IF YOU DON'T WANT TO USE.");
   ;	
	mov	ax,offset DGROUP:s@+4498
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;				gotoxy(27, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,27
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				cprintf("Press any key to exit...");
   ;	
	mov	ax,offset DGROUP:s@+4547
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;				getch();
   ;	
	call	near ptr _getch
   ;	
   ;				return 2;
   ;	
	mov	ax,2
	jmp	short @14@914
	jmp	short @14@914
@14@890:
   ;	
   ;			}
   ;	
   ;			else
   ;			{
   ;				textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				gotoxy(21, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,21
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("Please Select valid choice character.");
   ;	
	mov	ax,offset DGROUP:s@+4572
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				getch();
   ;	
	call	near ptr _getch
   ;	
   ;				gotoxy(21, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,21
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("                                     ");
   ;	
	mov	ax,offset DGROUP:s@+4610
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				goto last;
   ;	
	jmp	@14@626
@14@914:
   ;	
   ;			}
   ;		}
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
@license$qi	endp
	?debug	C E9D055FE7C0C4D454E5548454C502E435050
   ;	
   ;	void helpclear(void)
   ;	
	assume	cs:_TEXT
@helpclear$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    gotoxy(36, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,36
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("                                      ");
   ;	
	mov	ax,offset DGROUP:s@+4648
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(36, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,36
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("                                      ");
   ;	
	mov	ax,offset DGROUP:s@+4687
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(36, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,36
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("                                      ");
   ;	
	mov	ax,offset DGROUP:s@+4726
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(36, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,36
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("                                      ");
   ;	
	mov	ax,offset DGROUP:s@+4765
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(36, 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,36
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("                                      ");
   ;	
	mov	ax,offset DGROUP:s@+4804
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(36, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,36
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("                                      ");
   ;	
	mov	ax,offset DGROUP:s@+4843
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(36, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,36
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("                                      ");
   ;	
	mov	ax,offset DGROUP:s@+4882
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(36, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,36
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("                                      ");
   ;	
	mov	ax,offset DGROUP:s@+4921
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(36, 15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,36
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("                                      ");
   ;	
	mov	ax,offset DGROUP:s@+4960
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(36, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,36
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("                                      ");
   ;	
	mov	ax,offset DGROUP:s@+4999
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(36, 17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,36
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("                                      ");
   ;	
	mov	ax,offset DGROUP:s@+5038
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(36, 18);
   ;	
	mov	ax,18
	push	ax
	mov	ax,36
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("                                      ");
   ;	
	mov	ax,offset DGROUP:s@+5077
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(36, 19);
   ;	
	mov	ax,19
	push	ax
	mov	ax,36
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("                                      ");
   ;	
	mov	ax,offset DGROUP:s@+5116
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@helpclear$qv	endp
   ;	
   ;	void menuhelp(void)
   ;	
	assume	cs:_TEXT
@menuhelp$qv	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;	    clrscr();
   ;	
	call	near ptr _clrscr
@16@50:
   ;	
   ;	menuhelp:
   ;	    textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;	    textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	    title();
   ;	
	call	near ptr @title$qv
   ;	
   ;	    gotoxy(31, 4);
   ;	
	mov	ax,4
	push	ax
	mov	ax,31
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("Know your MAIN MENU");
   ;	
	mov	ax,offset DGROUP:s@+5155
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	    gotoxy(8, 6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("1. Add Data");
   ;	
	mov	ax,offset DGROUP:s@+5175
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(8, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("2. View Data");
   ;	
	mov	ax,offset DGROUP:s@+5187
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(8, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("3. Delete Data");
   ;	
	mov	ax,offset DGROUP:s@+5200
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(8, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("4. Export to .TXT File");
   ;	
	mov	ax,offset DGROUP:s@+5215
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(8, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("5. Recovery Data");
   ;	
	mov	ax,offset DGROUP:s@+5238
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(8, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("6. Settings");
   ;	
	mov	ax,offset DGROUP:s@+5255
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(8, 18);
   ;	
	mov	ax,18
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("7. Help");
   ;	
	mov	ax,offset DGROUP:s@+5267
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(8, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("8. Log Out");
   ;	
	mov	ax,offset DGROUP:s@+5275
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;	    textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	    gotoxy(24, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("... Press Number to see HELP ...");
   ;	
	mov	ax,offset DGROUP:s@+5286
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    gotoxy(29, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	    cprintf("For Exit , Press 'ESC'");
   ;	
	mov	ax,offset DGROUP:s@+5319
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	    boxi(35, 6, 20, 40);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,40
	push	ax
	mov	ax,20
	push	ax
	mov	ax,6
	push	ax
	mov	ax,35
	push	ax
	call	near ptr @boxi$qiiiii
	add	sp,10
   ;	
   ;	    _setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;	
   ;	    choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;	    switch (choice)
   ;	
	mov	al,byte ptr DGROUP:_choice
	cbw	
	mov	si,ax
	mov	cx,9
	mov	bx,offset @16@C1336
@16@122:
	cmp	word ptr cs:[bx],si
	je	short @16@194
	inc	bx
	inc	bx
	loop	short @16@122
	jmp	@16@434
@16@194:
	jmp	word ptr cs:[bx+18]
@16@218:
   ;	
   ;	    {
   ;	    case '1':
   ;	        textcolor(BLUE + BLINK);
   ;	
	mov	ax,129
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	        gotoxy(8, 6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("1. Add Data");
   ;	
	mov	ax,offset DGROUP:s@+5342
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	        gotoxy(37, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("Add Data");
   ;	
	mov	ax,offset DGROUP:s@+5354
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("This option will add your data to");
   ;	
	mov	ax,offset DGROUP:s@+5363
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("Secure File with encryption into");
   ;	
	mov	ax,offset DGROUP:s@+5397
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("currently opened account.");
   ;	
	mov	ax,offset DGROUP:s@+5430
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("You can add following type of data:");
   ;	
	mov	ax,offset DGROUP:s@+5456
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("1. E-mail Account");
   ;	
	mov	ax,offset DGROUP:s@+5492
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("2. Bank Account");
   ;	
	mov	ax,offset DGROUP:s@+5510
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("3. Secure Note");
   ;	
	mov	ax,offset DGROUP:s@+5526
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;	        getch();
   ;	
	call	near ptr _getch
   ;	
   ;	        helpclear();
   ;	
	call	near ptr @helpclear$qv
   ;	
   ;	        goto menuhelp;
   ;	
	jmp	@16@50
@16@242:
   ;	
   ;	
   ;	    case '2':
   ;	        textcolor(BLUE + BLINK);
   ;	
	mov	ax,129
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	        gotoxy(8, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("2. View Data");
   ;	
	mov	ax,offset DGROUP:s@+5541
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	        gotoxy(37, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("View Data");
   ;	
	mov	ax,offset DGROUP:s@+5554
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("This option will show your data from");
   ;	
	mov	ax,offset DGROUP:s@+5564
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("previously saved Secure File with");
   ;	
	mov	ax,offset DGROUP:s@+5601
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("decryption from currently opened");
   ;	
	mov	ax,offset DGROUP:s@+5635
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("account.");
   ;	
	mov	ax,offset DGROUP:s@+5668
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("You can view following type of data:");
   ;	
	mov	ax,offset DGROUP:s@+5677
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("1. E-mail Account");
   ;	
	mov	ax,offset DGROUP:s@+5714
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("2. Bank Account");
   ;	
	mov	ax,offset DGROUP:s@+5732
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("3. Secure Note");
   ;	
	mov	ax,offset DGROUP:s@+5748
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;	        getch();
   ;	
	call	near ptr _getch
   ;	
   ;	        helpclear();
   ;	
	call	near ptr @helpclear$qv
   ;	
   ;	        goto menuhelp;
   ;	
	jmp	@16@50
@16@266:
   ;	
   ;	
   ;	    case '3':
   ;	        textcolor(BLUE + BLINK);
   ;	
	mov	ax,129
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	        gotoxy(8, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("3. Delete Data");
   ;	
	mov	ax,offset DGROUP:s@+5763
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	        gotoxy(37, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("Delete Data");
   ;	
	mov	ax,offset DGROUP:s@+5778
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("This option will delete your selected");
   ;	
	mov	ax,offset DGROUP:s@+5790
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("data of Secure File for temporary");
   ;	
	mov	ax,offset DGROUP:s@+5828
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("state of period.");
   ;	
	mov	ax,offset DGROUP:s@+5862
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("You can delete following type of data");
   ;	
	mov	ax,offset DGROUP:s@+5879
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("1. E-mail Account");
   ;	
	mov	ax,offset DGROUP:s@+5917
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("2. Bank Account");
   ;	
	mov	ax,offset DGROUP:s@+5935
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("3. Secure Note");
   ;	
	mov	ax,offset DGROUP:s@+5951
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("INFORMATION:");
   ;	
	mov	ax,offset DGROUP:s@+5966
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 18);
   ;	
	mov	ax,18
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("To delete data parmanently,you have");
   ;	
	mov	ax,offset DGROUP:s@+5979
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 19);
   ;	
	mov	ax,19
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("to delete Recovery Files of data.");
   ;	
	mov	ax,offset DGROUP:s@+6015
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;	        getch();
   ;	
	call	near ptr _getch
   ;	
   ;	        helpclear();
   ;	
	call	near ptr @helpclear$qv
   ;	
   ;	        goto menuhelp;
   ;	
	jmp	@16@50
@16@290:
   ;	
   ;	
   ;	    case '4':
   ;	        textcolor(BLUE + BLINK);
   ;	
	mov	ax,129
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	        gotoxy(8, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("4. Export to .TXT File");
   ;	
	mov	ax,offset DGROUP:s@+6049
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	        gotoxy(37, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("Export to .TXT File");
   ;	
	mov	ax,offset DGROUP:s@+6072
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("This option will generate .TXT file");
   ;	
	mov	ax,offset DGROUP:s@+6092
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("( Text Editor File ) with currently");
   ;	
	mov	ax,offset DGROUP:s@+6128
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("opened file with E-mail Account and");
   ;	
	mov	ax,offset DGROUP:s@+6164
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("Secure Note Data.");
   ;	
	mov	ax,offset DGROUP:s@+6200
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("File will be exported in this path:");
   ;	
	mov	ax,offset DGROUP:s@+6218
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("C:\\VPASS\\DATA\\USER\\FILES\\*.txt");
   ;	
	mov	ax,offset DGROUP:s@+6254
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("INFORMATION:");
   ;	
	mov	ax,offset DGROUP:s@+6285
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("For Security Reasons,your bank a\\c");
   ;	
	mov	ax,offset DGROUP:s@+6298
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 18);
   ;	
	mov	ax,18
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("data will not be exported into .txt");
   ;	
	mov	ax,offset DGROUP:s@+6333
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 19);
   ;	
	mov	ax,19
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("files.");
   ;	
	mov	ax,offset DGROUP:s@+6369
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;	        getch();
   ;	
	call	near ptr _getch
   ;	
   ;	        helpclear();
   ;	
	call	near ptr @helpclear$qv
   ;	
   ;	        goto menuhelp;
   ;	
	jmp	@16@50
@16@314:
   ;	
   ;	
   ;	    case '5':
   ;	        textcolor(BLUE + BLINK);
   ;	
	mov	ax,129
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	        gotoxy(8, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("5. Recovery Data");
   ;	
	mov	ax,offset DGROUP:s@+6376
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	        gotoxy(37, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("Recovery Data");
   ;	
	mov	ax,offset DGROUP:s@+6393
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("This option will make you able to");
   ;	
	mov	ax,offset DGROUP:s@+6407
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("restore ( Recover ) your data from");
   ;	
	mov	ax,offset DGROUP:s@+6441
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("last three states of log-in session.");
   ;	
	mov	ax,offset DGROUP:s@+6476
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("You can recover your all type of");
   ;	
	mov	ax,offset DGROUP:s@+6513
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("data with this Recovery Option.");
   ;	
	mov	ax,offset DGROUP:s@+6546
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("WARNING:");
   ;	
	mov	ax,offset DGROUP:s@+6578
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("When you will recover your data,");
   ;	
	mov	ax,offset DGROUP:s@+6587
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("you will lost your every data files");
   ;	
	mov	ax,offset DGROUP:s@+6620
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("which are currently available into");
   ;	
	mov	ax,offset DGROUP:s@+6656
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 18);
   ;	
	mov	ax,18
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("your account. After that all log-in");
   ;	
	mov	ax,offset DGROUP:s@+6691
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 19);
   ;	
	mov	ax,19
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("session will be expired.");
   ;	
	mov	ax,offset DGROUP:s@+6727
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;	        getch();
   ;	
	call	near ptr _getch
   ;	
   ;	        helpclear();
   ;	
	call	near ptr @helpclear$qv
   ;	
   ;	        goto menuhelp;
   ;	
	jmp	@16@50
@16@338:
   ;	
   ;	
   ;	    case '6':
   ;	        textcolor(BLUE + BLINK);
   ;	
	mov	ax,129
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	        gotoxy(8, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("6. Settings");
   ;	
	mov	ax,offset DGROUP:s@+6752
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	        gotoxy(37, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("Settings");
   ;	
	mov	ax,offset DGROUP:s@+6764
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("This option will make you able to");
   ;	
	mov	ax,offset DGROUP:s@+6773
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("change your Personal Settings.");
   ;	
	mov	ax,offset DGROUP:s@+6807
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("You can change following Settings:");
   ;	
	mov	ax,offset DGROUP:s@+6838
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("%c View\\Edit Profile", (char)175);
   ;	
	mov	ax,65455
	push	ax
	mov	ax,offset DGROUP:s@+6873
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;	        gotoxy(37, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("%c Security Option", (char)175);
   ;	
	mov	ax,65455
	push	ax
	mov	ax,offset DGROUP:s@+6894
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;	        gotoxy(37, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("%c Enable\\Disable Protection", (char)175);
   ;	
	mov	ax,65455
	push	ax
	mov	ax,offset DGROUP:s@+6913
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;	        gotoxy(37, 15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("%c Disable Account", (char)175);
   ;	
	mov	ax,65455
	push	ax
	mov	ax,offset DGROUP:s@+6942
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;	
   ;	        getch();
   ;	
	call	near ptr _getch
   ;	
   ;	        helpclear();
   ;	
	call	near ptr @helpclear$qv
   ;	
   ;	        goto menuhelp;
   ;	
	jmp	@16@50
@16@362:
   ;	
   ;	
   ;	    case '7':
   ;	        textcolor(BLUE + BLINK);
   ;	
	mov	ax,129
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	        gotoxy(8, 18);
   ;	
	mov	ax,18
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("7. Help");
   ;	
	mov	ax,offset DGROUP:s@+6961
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	        gotoxy(37, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("Help");
   ;	
	mov	ax,offset DGROUP:s@+6969
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("This option will make you able to");
   ;	
	mov	ax,offset DGROUP:s@+6974
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("see HELP Topics of programs. You");
   ;	
	mov	ax,offset DGROUP:s@+7008
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("can select various HELP Topics and");
   ;	
	mov	ax,offset DGROUP:s@+7041
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("will able to get help.");
   ;	
	mov	ax,offset DGROUP:s@+7076
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("You can get following type of Help:");
   ;	
	mov	ax,offset DGROUP:s@+7099
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("1. Know Your Main Menu");
   ;	
	mov	ax,offset DGROUP:s@+7135
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("2. END USER LICENSE AGREEMENT and");
   ;	
	mov	ax,offset DGROUP:s@+7158
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("   PRIVACY POLICY");
   ;	
	mov	ax,offset DGROUP:s@+7192
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("3. About Us");
   ;	
	mov	ax,offset DGROUP:s@+7210
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;	        getch();
   ;	
	call	near ptr _getch
   ;	
   ;	        helpclear();
   ;	
	call	near ptr @helpclear$qv
   ;	
   ;	        goto menuhelp;
   ;	
	jmp	@16@50
@16@386:
   ;	
   ;	
   ;	    case '8':
   ;	        textcolor(BLUE + BLINK);
   ;	
	mov	ax,129
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	        gotoxy(8, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("8. Log Out");
   ;	
	mov	ax,offset DGROUP:s@+7222
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	        gotoxy(37, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("Log Out");
   ;	
	mov	ax,offset DGROUP:s@+7233
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("This option will make you able to");
   ;	
	mov	ax,offset DGROUP:s@+7241
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("log out from the current log-in");
   ;	
	mov	ax,offset DGROUP:s@+7275
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("session. Your last third log-in");
   ;	
	mov	ax,offset DGROUP:s@+7307
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("session will be expired as soon as");
   ;	
	mov	ax,offset DGROUP:s@+7339
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("you log out from the session.");
   ;	
	mov	ax,offset DGROUP:s@+7374
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("As you log out from the current");
   ;	
	mov	ax,offset DGROUP:s@+7404
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("log-in session, this session will");
   ;	
	mov	ax,offset DGROUP:s@+7436
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        gotoxy(37, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,37
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("be added to Recovery Data File.");
   ;	
	mov	ax,offset DGROUP:s@+7470
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        getch();
   ;	
	call	near ptr _getch
   ;	
   ;	        helpclear();
   ;	
	call	near ptr @helpclear$qv
   ;	
   ;	        goto menuhelp;
   ;	
	jmp	@16@50
@16@410:
	jmp	short @16@458
@16@434:
   ;	
   ;	
   ;	    case (char)27:
   ;	        break;
   ;	
   ;	    default:
   ;	        textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	        gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("Please Select valid choice number.");
   ;	
	mov	ax,offset DGROUP:s@+7502
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        getch();
   ;	
	call	near ptr _getch
   ;	
   ;	        gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	        cprintf("                                  ");
   ;	
	mov	ax,offset DGROUP:s@+7537
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	        goto menuhelp;
   ;	
	jmp	@16@50
@16@458:
   ;	
   ;	    }
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
@menuhelp$qv	endp
@16@C1336	label	word
	db	27
	db	0
	db	49
	db	0
	db	50
	db	0
	db	51
	db	0
	db	52
	db	0
	db	53
	db	0
	db	54
	db	0
	db	55
	db	0
	db	56
	db	0
	dw	@16@410
	dw	@16@218
	dw	@16@242
	dw	@16@266
	dw	@16@290
	dw	@16@314
	dw	@16@338
	dw	@16@362
	dw	@16@386
	?debug	C E9D055FE7C0B41425448454C502E435050
   ;	
   ;	void abouthelp(void)
   ;	
	assume	cs:_TEXT
@abouthelp$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;		textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;		textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		title();
   ;	
	call	near ptr @title$qv
   ;	
   ;		gotoxy(33, 4);
   ;	
	mov	ax,4
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("About Us");
   ;	
	mov	ax,offset DGROUP:s@+7572
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		box(5, 6, 22, 70);
   ;	
	mov	ax,70
	push	ax
	mov	ax,22
	push	ax
	mov	ax,6
	push	ax
	mov	ax,5
	push	ax
	call	near ptr @box$qiiii
	add	sp,8
   ;	
   ;		gotoxy(6, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,6
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		line(68, 0, (char)196);
   ;	
	mov	al,196
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,68
	push	ax
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;		textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		gotoxy(31, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,31
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("VPass Manager v1.0");
   ;	
	mov	ax,offset DGROUP:s@+7581
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(25, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("Keep your Trust, Safe your Data.");
   ;	
	mov	ax,offset DGROUP:s@+7600
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(32, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,32
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("%c%c%cPROGRAMMER%c%c%c", (char)175, (char)175, (char)175,
   ;	
   ;	
   ;				(char)174, (char)174, (char)174);
   ;	
	mov	ax,65454
	push	ax
	mov	ax,65454
	push	ax
	mov	ax,65454
	push	ax
	mov	ax,65455
	push	ax
	mov	ax,65455
	push	ax
	mov	ax,65455
	push	ax
	mov	ax,offset DGROUP:s@+7633
	push	ax
	call	near ptr _cprintf
	add	sp,14
   ;	
   ;		textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		gotoxy(29, 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("Vivek Ishwarbhai Patel");
   ;	
	mov	ax,offset DGROUP:s@+7656
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(36, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,36
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("11BCE073");
   ;	
	mov	ax,offset DGROUP:s@+7679
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(24, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("Computer Engineering Department,");
   ;	
	mov	ax,offset DGROUP:s@+7688
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(28, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("Institute of Technology,");
   ;	
	mov	ax,offset DGROUP:s@+7721
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(31, 15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,31
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("Nirma University.");
   ;	
	mov	ax,offset DGROUP:s@+7746
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(30, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("(M) +91 94289 60350");
   ;	
	mov	ax,offset DGROUP:s@+7764
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		gotoxy(30, 18);
   ;	
	mov	ax,18
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("%c%c%cSpecial Thanks%c%c%c", (char)175, (char)175, (char)175,
   ;	
   ;	
   ;				(char)174, (char)174, (char)174);
   ;	
	mov	ax,65454
	push	ax
	mov	ax,65454
	push	ax
	mov	ax,65454
	push	ax
	mov	ax,65455
	push	ax
	mov	ax,65455
	push	ax
	mov	ax,65455
	push	ax
	mov	ax,offset DGROUP:s@+7784
	push	ax
	call	near ptr _cprintf
	add	sp,14
   ;	
   ;		textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		gotoxy(27, 19);
   ;	
	mov	ax,19
	push	ax
	mov	ax,27
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("Savan Patel     (11BCE084)");
   ;	
	mov	ax,offset DGROUP:s@+7811
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(27, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,27
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("Deval Patel     (11BCE071)");
   ;	
	mov	ax,offset DGROUP:s@+7838
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(27, 21);
   ;	
	mov	ax,21
	push	ax
	mov	ax,27
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("Vivek Chaudhary (11BCE018)");
   ;	
	mov	ax,offset DGROUP:s@+7865
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;		_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;		gotoxy(25, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		cprintf("Press any key to go into HELP...");
   ;	
	mov	ax,offset DGROUP:s@+7892
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		getch();
   ;	
	call	near ptr _getch
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@abouthelp$qv	endp
	?debug	C E9D055FE7C084D454E552E435050
   ;	
   ;	void MENU(void)
   ;	
	assume	cs:_TEXT
@MENU$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
	push	di
   ;	
   ;	{
   ;		clrscr();
   ;	
	call	near ptr _clrscr
@18@50:
   ;	
   ;	menu:
   ;		if (menu)
   ;	
	cmp	word ptr DGROUP:_menu,0
	je	short @18@98
   ;	
   ;			clrscr();
   ;	
	call	near ptr _clrscr
@18@98:
   ;	
   ;		menu = 0;
   ;	
	mov	word ptr DGROUP:_menu,0
   ;	
   ;		textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;		title();
   ;	
	call	near ptr @title$qv
   ;	
   ;		textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		gotoxy(31, 4);
   ;	
	mov	ax,4
	push	ax
	mov	ax,31
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("M A I N  M E N U");
   ;	
	mov	ax,offset DGROUP:s@+7925
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		gotoxy(28, 6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("1. Add Data");
   ;	
	mov	ax,offset DGROUP:s@+7942
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(28, 8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("2. View Data");
   ;	
	mov	ax,offset DGROUP:s@+7954
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(28, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("3. Delete Data");
   ;	
	mov	ax,offset DGROUP:s@+7967
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(28, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("4. Export to .TXT File");
   ;	
	mov	ax,offset DGROUP:s@+7982
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(28, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("5. Recovery Data");
   ;	
	mov	ax,offset DGROUP:s@+8005
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(28, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("6. Settings");
   ;	
	mov	ax,offset DGROUP:s@+8022
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(28, 18);
   ;	
	mov	ax,18
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("7. Help");
   ;	
	mov	ax,offset DGROUP:s@+8034
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(28, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("8. Log Out");
   ;	
	mov	ax,offset DGROUP:s@+8042
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;		textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		gotoxy(29, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("... Press Number ...");
   ;	
	mov	ax,offset DGROUP:s@+8053
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;	
   ;		choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;	
   ;		switch (choice)
   ;	
	mov	al,byte ptr DGROUP:_choice
	cbw	
	mov	word ptr [bp-2],ax
	mov	cx,9
	mov	bx,offset @18@C6074
@18@170:
	mov	ax,word ptr cs:[bx]
	cmp	ax,word ptr [bp-2]
	je	short @18@242
	inc	bx
	inc	bx
	loop	short @18@170
	jmp	@18@2402
@18@242:
	jmp	word ptr cs:[bx+18]
@18@266:
   ;	
   ;		{
   ;		case '1':
   ;		menu1:
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			title();
   ;	
	call	near ptr @title$qv
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;			gotoxy(36, 4);
   ;	
	mov	ax,4
	push	ax
	mov	ax,36
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("ADD DATA");
   ;	
	mov	ax,offset DGROUP:s@+8074
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(30, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("1. E-mail Account");
   ;	
	mov	ax,offset DGROUP:s@+8083
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(30, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("2. Bank Account");
   ;	
	mov	ax,offset DGROUP:s@+8101
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(30, 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("3. Personal Note");
   ;	
	mov	ax,offset DGROUP:s@+8117
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(30, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("4. Go Back");
   ;	
	mov	ax,offset DGROUP:s@+8134
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(29, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("... Press Number ...");
   ;	
	mov	ax,offset DGROUP:s@+8145
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;	
   ;			switch (choice)
   ;	
	mov	al,byte ptr DGROUP:_choice
	cbw	
	mov	word ptr [bp-4],ax
	mov	cx,5
	mov	bx,offset @18@C6350
@18@338:
	mov	ax,word ptr cs:[bx]
	cmp	ax,word ptr [bp-4]
	je	short @18@410
	inc	bx
	inc	bx
	loop	short @18@338
	jmp	short @18@530
@18@410:
	jmp	word ptr cs:[bx+10]
@18@434:
	jmp	short @18@554
@18@458:
	jmp	short @18@554
@18@482:
	jmp	short @18@554
@18@506:
   ;	
   ;			{
   ;			case '1':
   ;				break;
   ;	
   ;			case '2':
   ;				break;
   ;	
   ;			case '3':
   ;				break;
   ;	
   ;			case (char)27:
   ;			case '4':
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto menu;
   ;	
	jmp	@18@50
@18@530:
   ;	
   ;	
   ;			default:
   ;				textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("Please Select valid choice number.");
   ;	
	mov	ax,offset DGROUP:s@+8166
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				getch();
   ;	
	call	near ptr _getch
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("                                  ");
   ;	
	mov	ax,offset DGROUP:s@+8201
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto menu1;
   ;	
	jmp	@18@266
@18@554:
	jmp	@18@2426
@18@578:
   ;	
   ;			}
   ;	
   ;			break;
   ;	
   ;		case '2':
   ;		menu2:
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			title();
   ;	
	call	near ptr @title$qv
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;			gotoxy(36, 4);
   ;	
	mov	ax,4
	push	ax
	mov	ax,36
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("VIEW DATA");
   ;	
	mov	ax,offset DGROUP:s@+8236
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(30, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("1. E-mail Account  (%2d)", data[1]);
   ;	
	push	word ptr DGROUP:_data+2
	mov	ax,offset DGROUP:s@+8246
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;			gotoxy(30, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("2. Bank Account    (%2d)", data[2]);
   ;	
	push	word ptr DGROUP:_data+4
	mov	ax,offset DGROUP:s@+8271
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;			gotoxy(30, 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("3. Personal Note   (%2d)", data[3]);
   ;	
	push	word ptr DGROUP:_data+6
	mov	ax,offset DGROUP:s@+8296
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;			gotoxy(30, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("4. Go Back");
   ;	
	mov	ax,offset DGROUP:s@+8321
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(29, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("... Press Number ...");
   ;	
	mov	ax,offset DGROUP:s@+8332
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;	
   ;			switch (choice)
   ;	
	mov	al,byte ptr DGROUP:_choice
	cbw	
	mov	word ptr [bp-6],ax
	mov	cx,5
	mov	bx,offset @18@C6626
@18@650:
	mov	ax,word ptr cs:[bx]
	cmp	ax,word ptr [bp-6]
	je	short @18@722
	inc	bx
	inc	bx
	loop	short @18@650
	jmp	short @18@842
@18@722:
	jmp	word ptr cs:[bx+10]
@18@746:
	jmp	short @18@866
@18@770:
	jmp	short @18@866
@18@794:
	jmp	short @18@866
@18@818:
   ;	
   ;			{
   ;			case '1':
   ;				break;
   ;	
   ;			case '2':
   ;				break;
   ;	
   ;			case '3':
   ;				break;
   ;	
   ;			case (char)27:
   ;			case '4':
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto menu;
   ;	
	jmp	@18@50
@18@842:
   ;	
   ;	
   ;			default:
   ;				textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("Please Select valid choice number.");
   ;	
	mov	ax,offset DGROUP:s@+8353
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				getch();
   ;	
	call	near ptr _getch
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("                                  ");
   ;	
	mov	ax,offset DGROUP:s@+8388
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto menu2;
   ;	
	jmp	@18@578
@18@866:
	jmp	@18@2426
@18@890:
   ;	
   ;			}
   ;	
   ;			break;
   ;	
   ;		case '3':
   ;		menu3:
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			title();
   ;	
	call	near ptr @title$qv
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;			gotoxy(34, 4);
   ;	
	mov	ax,4
	push	ax
	mov	ax,34
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("DELETE DATA");
   ;	
	mov	ax,offset DGROUP:s@+8423
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(30, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("1. E-mail Account  (%2d)", data[1]);
   ;	
	push	word ptr DGROUP:_data+2
	mov	ax,offset DGROUP:s@+8435
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;			gotoxy(30, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("2. Bank Account    (%2d)", data[2]);
   ;	
	push	word ptr DGROUP:_data+4
	mov	ax,offset DGROUP:s@+8460
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;			gotoxy(30, 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("3. Personal Note   (%2d)", data[3]);
   ;	
	push	word ptr DGROUP:_data+6
	mov	ax,offset DGROUP:s@+8485
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;			gotoxy(30, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("4. Go Back");
   ;	
	mov	ax,offset DGROUP:s@+8510
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(10, 19);
   ;	
	mov	ax,19
	push	ax
	mov	ax,10
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("Information : ");
   ;	
	mov	ax,offset DGROUP:s@+8521
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(24, 19);
   ;	
	mov	ax,19
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("Please note that your data will not parmanetly");
   ;	
	mov	ax,offset DGROUP:s@+8536
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(24, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("deleted untill you delete Recovery Files.");
   ;	
	mov	ax,offset DGROUP:s@+8583
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			gotoxy(29, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("... Press Number ...");
   ;	
	mov	ax,offset DGROUP:s@+8625
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;	
   ;			switch (choice)
   ;	
	mov	al,byte ptr DGROUP:_choice
	cbw	
	mov	di,ax
	mov	cx,5
	mov	bx,offset @18@C6902
@18@962:
	cmp	word ptr cs:[bx],di
	je	short @18@1034
	inc	bx
	inc	bx
	loop	short @18@962
	jmp	short @18@1154
@18@1034:
	jmp	word ptr cs:[bx+10]
@18@1058:
	jmp	short @18@1178
@18@1082:
	jmp	short @18@1178
@18@1106:
	jmp	short @18@1178
@18@1130:
   ;	
   ;			{
   ;			case '1':
   ;				break;
   ;	
   ;			case '2':
   ;				break;
   ;	
   ;			case '3':
   ;				break;
   ;	
   ;			case (char)27:
   ;			case '4':
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto menu;
   ;	
	jmp	@18@50
@18@1154:
   ;	
   ;	
   ;			default:
   ;				textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("Please Select valid choice number.");
   ;	
	mov	ax,offset DGROUP:s@+8646
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				getch();
   ;	
	call	near ptr _getch
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("                                  ");
   ;	
	mov	ax,offset DGROUP:s@+8681
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto menu3;
   ;	
	jmp	@18@890
@18@1178:
	jmp	@18@2426
@18@1202:
   ;	
   ;			}
   ;	
   ;			break;
   ;	
   ;		case '4':
   ;		menu4:
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			title();
   ;	
	call	near ptr @title$qv
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;			gotoxy(33, 4);
   ;	
	mov	ax,4
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("EXPORT DATA");
   ;	
	mov	ax,offset DGROUP:s@+8716
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(10, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,10
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("Information : ");
   ;	
	mov	ax,offset DGROUP:s@+8728
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(24, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("For Security Reasons, your BANK A/C. Data will");
   ;	
	mov	ax,offset DGROUP:s@+8743
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(24, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("not be exported to .txt file.");
   ;	
	mov	ax,offset DGROUP:s@+8790
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			boxi(15, 12, 19, 48);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,48
	push	ax
	mov	ax,19
	push	ax
	mov	ax,12
	push	ax
	mov	ax,15
	push	ax
	call	near ptr @boxi$qiiiii
	add	sp,10
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(22, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,22
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("Do you still want to continue ? ");
   ;	
	mov	ax,offset DGROUP:s@+8820
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(33, 15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("1. Y E S");
   ;	
	mov	ax,offset DGROUP:s@+8853
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(33, 17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("2. N O");
   ;	
	mov	ax,offset DGROUP:s@+8862
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(29, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("... Press Number ...");
   ;	
	mov	ax,offset DGROUP:s@+8869
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;	
   ;			switch (choice)
   ;	
	mov	al,byte ptr DGROUP:_choice
	cbw	
	cmp	ax,27
	jne	@@5
	jmp	@18@1370
@@5:
	cmp	ax,49
	je	short @18@1346
	cmp	ax,50
	jne	@@6
	jmp	@18@1370
@@6:
	jmp	@18@1394
@18@1346:
   ;	
   ;			{
   ;			case '1':
   ;				clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;				title();
   ;	
	call	near ptr @title$qv
   ;	
   ;				textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;				gotoxy(33, 4);
   ;	
	mov	ax,4
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("EXPORT DATA");
   ;	
	mov	ax,offset DGROUP:s@+8890
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				boxi(15, 10, 16, 50);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,50
	push	ax
	mov	ax,16
	push	ax
	mov	ax,10
	push	ax
	mov	ax,15
	push	ax
	call	near ptr @boxi$qiiiii
	add	sp,10
   ;	
   ;				textcolor(RED);
   ;	
	mov	ax,4
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				gotoxy(21, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,21
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("This option is currently disabled for");
   ;	
	mov	ax,offset DGROUP:s@+8902
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				gotoxy(21, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,21
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("    current version of application.   ");
   ;	
	mov	ax,offset DGROUP:s@+8940
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				gotoxy(25, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				cprintf("Press any key to continue...");
   ;	
	mov	ax,offset DGROUP:s@+8979
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				getch();
   ;	
	call	near ptr _getch
   ;	
   ;				goto menu4;
   ;	
	jmp	@18@1202
@18@1370:
   ;	
   ;	
   ;			case (char)27:
   ;			case '2':
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto menu;
   ;	
	jmp	@18@50
@18@1394:
   ;	
   ;	
   ;			default:
   ;				textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("Please Select valid choice number.");
   ;	
	mov	ax,offset DGROUP:s@+9008
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				getch();
   ;	
	call	near ptr _getch
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("                                  ");
   ;	
	mov	ax,offset DGROUP:s@+9043
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto menu4;
   ;	
	jmp	@18@1202
@18@1418:
   ;	
   ;			}
   ;	
   ;		case '5':
   ;		menu5:
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			title();
   ;	
	call	near ptr @title$qv
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;			gotoxy(32, 4);
   ;	
	mov	ax,4
	push	ax
	mov	ax,32
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("RECOVERY DATA");
   ;	
	mov	ax,offset DGROUP:s@+9078
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(10, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,10
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("Information : ");
   ;	
	mov	ax,offset DGROUP:s@+9092
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(24, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("For your kind knowledge, your current data will be");
   ;	
	mov	ax,offset DGROUP:s@+9107
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(24, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("overwritten with your Recovery File Data.");
   ;	
	mov	ax,offset DGROUP:s@+9158
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			boxi(15, 12, 19, 48);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,48
	push	ax
	mov	ax,19
	push	ax
	mov	ax,12
	push	ax
	mov	ax,15
	push	ax
	call	near ptr @boxi$qiiiii
	add	sp,10
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(22, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,22
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("Do you still want to continue ? ");
   ;	
	mov	ax,offset DGROUP:s@+9200
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(33, 15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("1. Y E S");
   ;	
	mov	ax,offset DGROUP:s@+9233
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(33, 17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("2. N O");
   ;	
	mov	ax,offset DGROUP:s@+9242
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(29, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("... Press Number ...");
   ;	
	mov	ax,offset DGROUP:s@+9249
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;	
   ;			switch (choice)
   ;	
	mov	al,byte ptr DGROUP:_choice
	cbw	
	cmp	ax,27
	jne	@@7
	jmp	@18@1586
@@7:
	cmp	ax,49
	je	short @18@1562
	cmp	ax,50
	jne	@@8
	jmp	@18@1586
@@8:
	jmp	@18@1610
@18@1562:
   ;	
   ;			{
   ;			case '1':
   ;				clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;				title();
   ;	
	call	near ptr @title$qv
   ;	
   ;				textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;				gotoxy(32, 4);
   ;	
	mov	ax,4
	push	ax
	mov	ax,32
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("RECOVERY DATA");
   ;	
	mov	ax,offset DGROUP:s@+9270
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				boxi(15, 10, 16, 50);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,50
	push	ax
	mov	ax,16
	push	ax
	mov	ax,10
	push	ax
	mov	ax,15
	push	ax
	call	near ptr @boxi$qiiiii
	add	sp,10
   ;	
   ;				textcolor(RED);
   ;	
	mov	ax,4
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				gotoxy(21, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,21
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("This option is currently disabled for");
   ;	
	mov	ax,offset DGROUP:s@+9284
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				gotoxy(21, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,21
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("    current version of application.   ");
   ;	
	mov	ax,offset DGROUP:s@+9322
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				gotoxy(25, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				cprintf("Press any key to continue...");
   ;	
	mov	ax,offset DGROUP:s@+9361
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				getch();
   ;	
	call	near ptr _getch
   ;	
   ;				goto menu5;
   ;	
	jmp	@18@1418
@18@1586:
   ;	
   ;	
   ;			case (char)27:
   ;			case '2':
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto menu;
   ;	
	jmp	@18@50
@18@1610:
   ;	
   ;	
   ;			default:
   ;				textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("Please Select valid choice number.");
   ;	
	mov	ax,offset DGROUP:s@+9390
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				getch();
   ;	
	call	near ptr _getch
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("                                  ");
   ;	
	mov	ax,offset DGROUP:s@+9425
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto menu5;
   ;	
	jmp	@18@1418
@18@1634:
   ;	
   ;			}
   ;	
   ;		case '6':
   ;		menu6:
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			title();
   ;	
	call	near ptr @title$qv
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;			gotoxy(34, 4);
   ;	
	mov	ax,4
	push	ax
	mov	ax,34
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("SETTINGS");
   ;	
	mov	ax,offset DGROUP:s@+9460
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(28, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("1. View Profile");
   ;	
	mov	ax,offset DGROUP:s@+9469
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(28, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("2. Edit Profile");
   ;	
	mov	ax,offset DGROUP:s@+9485
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(28, 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("3. Change Password");
   ;	
	mov	ax,offset DGROUP:s@+9501
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(28, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("4. Change Security Question");
   ;	
	mov	ax,offset DGROUP:s@+9520
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(28, 15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("5. Enable Protection");
   ;	
	mov	ax,offset DGROUP:s@+9548
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(28, 17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("6. Delete Account");
   ;	
	mov	ax,offset DGROUP:s@+9569
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(28, 19);
   ;	
	mov	ax,19
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("7. Go Back");
   ;	
	mov	ax,offset DGROUP:s@+9587
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(29, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("... Press Number ...");
   ;	
	mov	ax,offset DGROUP:s@+9598
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;	
   ;			switch (choice)
   ;	
	mov	al,byte ptr DGROUP:_choice
	cbw	
	cmp	ax,27
	je	short @18@1802
	cmp	ax,49
	je	short @18@1778
	cmp	ax,55
	je	short @18@1802
	jmp	short @18@1826
@18@1778:
	jmp	short @18@1850
@18@1802:
   ;	
   ;			{
   ;			case '1':
   ;				break;
   ;	
   ;			case (char)27:
   ;			case '7':
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto menu;
   ;	
	jmp	@18@50
@18@1826:
   ;	
   ;	
   ;			default:
   ;				textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("Please Select valid choice number.");
   ;	
	mov	ax,offset DGROUP:s@+9619
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				getch();
   ;	
	call	near ptr _getch
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("                                  ");
   ;	
	mov	ax,offset DGROUP:s@+9654
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto menu6;
   ;	
	jmp	@18@1634
@18@1850:
	jmp	@18@2426
@18@1874:
   ;	
   ;			}
   ;	
   ;			break;
   ;	
   ;		case '7':
   ;		menu7:
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			title();
   ;	
	call	near ptr @title$qv
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;			gotoxy(26, 4);
   ;	
	mov	ax,4
	push	ax
	mov	ax,26
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("? ? ?   H E L P   ? ? ?");
   ;	
	mov	ax,offset DGROUP:s@+9689
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(28, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("1. Know your MAIN MENU");
   ;	
	mov	ax,offset DGROUP:s@+9713
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(28, 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("2. END USER LICENSE AGREEMENT and");
   ;	
	mov	ax,offset DGROUP:s@+9736
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(28, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("   PRIVACY POLICY");
   ;	
	mov	ax,offset DGROUP:s@+9770
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(28, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("3. About Us");
   ;	
	mov	ax,offset DGROUP:s@+9788
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(28, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("4. Go Back");
   ;	
	mov	ax,offset DGROUP:s@+9800
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(29, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("... Press Number ...");
   ;	
	mov	ax,offset DGROUP:s@+9811
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;	
   ;			switch (choice)
   ;	
	mov	al,byte ptr DGROUP:_choice
	cbw	
	mov	si,ax
	mov	cx,5
	mov	bx,offset @18@C7730
@18@1946:
	cmp	word ptr cs:[bx],si
	je	short @18@2018
	inc	bx
	inc	bx
	loop	short @18@1946
	jmp	short @18@2138
@18@2018:
	jmp	word ptr cs:[bx+10]
@18@2042:
   ;	
   ;			{
   ;			case '1':
   ;				menuhelp();
   ;	
	call	near ptr @menuhelp$qv
   ;	
   ;				goto menu7;
   ;	
	jmp	@18@1874
@18@2066:
   ;	
   ;	
   ;			case '2':
   ;				choice = license(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr @license$qi
	pop	cx
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;				goto menu7;
   ;	
	jmp	@18@1874
@18@2090:
   ;	
   ;	
   ;			case '3':
   ;				abouthelp();
   ;	
	call	near ptr @abouthelp$qv
   ;	
   ;				goto menu7;
   ;	
	jmp	@18@1874
@18@2114:
   ;	
   ;	
   ;			case (char)27:
   ;			case '4':
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto menu;
   ;	
	jmp	@18@50
@18@2138:
   ;	
   ;	
   ;			default:
   ;				textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("Please Select valid choice number.");
   ;	
	mov	ax,offset DGROUP:s@+9832
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				getch();
   ;	
	call	near ptr _getch
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("                                  ");
   ;	
	mov	ax,offset DGROUP:s@+9867
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto menu7;
   ;	
	jmp	@18@1874
@18@2162:
   ;	
   ;			}
   ;	
   ;		case (char)27:
   ;		case '8':
   ;		menu8:
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			title();
   ;	
	call	near ptr @title$qv
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;			gotoxy(25, 4);
   ;	
	mov	ax,4
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("THANKS FOR USING APPLICATION");
   ;	
	mov	ax,offset DGROUP:s@+9902
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			boxi(15, 11, 19, 48);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,48
	push	ax
	mov	ax,19
	push	ax
	mov	ax,11
	push	ax
	mov	ax,15
	push	ax
	call	near ptr @boxi$qiiiii
	add	sp,10
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(26, 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,26
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("Do you want to LOG OUT ? ");
   ;	
	mov	ax,offset DGROUP:s@+9931
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(33, 15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("1. Y E S");
   ;	
	mov	ax,offset DGROUP:s@+9957
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(33, 17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("2. N O");
   ;	
	mov	ax,offset DGROUP:s@+9966
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(29, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("... Press Number ...");
   ;	
	mov	ax,offset DGROUP:s@+9973
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;	
   ;			switch (choice)
   ;	
	mov	al,byte ptr DGROUP:_choice
	cbw	
	cmp	ax,27
	je	short @18@2330
	cmp	ax,49
	je	short @18@2306
	cmp	ax,50
	je	short @18@2330
	jmp	short @18@2354
@18@2306:
	jmp	short @18@2378
@18@2330:
   ;	
   ;			{
   ;			case '1':
   ;				break;
   ;	
   ;			case (char)27:
   ;			case '2':
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto menu;
   ;	
	jmp	@18@50
@18@2354:
   ;	
   ;	
   ;			default:
   ;				textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("Please Select valid choice number.");
   ;	
	mov	ax,offset DGROUP:s@+9994
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				getch();
   ;	
	call	near ptr _getch
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("                                  ");
   ;	
	mov	ax,offset DGROUP:s@+10029
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto menu8;
   ;	
	jmp	@18@2162
@18@2378:
	jmp	short @18@2426
@18@2402:
   ;	
   ;			}
   ;	
   ;			break;
   ;	
   ;		default:
   ;			textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("Please Select valid choice number.");
   ;	
	mov	ax,offset DGROUP:s@+10064
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			getch();
   ;	
	call	near ptr _getch
   ;	
   ;			gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("                                  ");
   ;	
	mov	ax,offset DGROUP:s@+10099
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;			goto menu;
   ;	
	jmp	@18@50
@18@2426:
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@MENU$qv	endp
@18@C7730	label	word
	db	27
	db	0
	db	49
	db	0
	db	50
	db	0
	db	51
	db	0
	db	52
	db	0
	dw	@18@2114
	dw	@18@2042
	dw	@18@2066
	dw	@18@2090
	dw	@18@2114
@18@C6902	label	word
	db	27
	db	0
	db	49
	db	0
	db	50
	db	0
	db	51
	db	0
	db	52
	db	0
	dw	@18@1130
	dw	@18@1058
	dw	@18@1082
	dw	@18@1106
	dw	@18@1130
@18@C6626	label	word
	db	27
	db	0
	db	49
	db	0
	db	50
	db	0
	db	51
	db	0
	db	52
	db	0
	dw	@18@818
	dw	@18@746
	dw	@18@770
	dw	@18@794
	dw	@18@818
@18@C6350	label	word
	db	27
	db	0
	db	49
	db	0
	db	50
	db	0
	db	51
	db	0
	db	52
	db	0
	dw	@18@506
	dw	@18@434
	dw	@18@458
	dw	@18@482
	dw	@18@506
@18@C6074	label	word
	db	27
	db	0
	db	49
	db	0
	db	50
	db	0
	db	51
	db	0
	db	52
	db	0
	db	53
	db	0
	db	54
	db	0
	db	55
	db	0
	db	56
	db	0
	dw	@18@2162
	dw	@18@266
	dw	@18@578
	dw	@18@890
	dw	@18@1202
	dw	@18@1418
	dw	@18@1634
	dw	@18@1874
	dw	@18@2162
   ;	
   ;	void main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,44
	push	si
	push	di
   ;	
   ;	{
   ;		int passn = 0;
   ;	
	xor	si,si
   ;	
   ;		clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;		textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;		textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		line(1920, 0, ' ');
   ;	
	mov	al,32
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,1920
	push	ax
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;		textbackground(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;		line(80, 0, ' ');
   ;	
	mov	al,32
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,80
	push	ax
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;		gotoxy(2, 24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,2
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;		line(78, 0, ' ');
   ;	
	mov	al,32
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,78
	push	ax
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;		border();
   ;	
	call	near ptr @border$qv
   ;	
   ;		window(2, 2, 79, 24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,79
	push	ax
	mov	ax,2
	push	ax
	mov	ax,2
	push	ax
	call	near ptr _window
	add	sp,8
@19@50:
   ;	
   ;	wc:
   ;		if (menu)
   ;	
	cmp	word ptr DGROUP:_menu,0
	je	short @19@98
   ;	
   ;			clrscr();
   ;	
	call	near ptr _clrscr
@19@98:
   ;	
   ;		menu = 0;
   ;	
	mov	word ptr DGROUP:_menu,0
   ;	
   ;		textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;		gotoxy(1, 5);
   ;	
	mov	ax,5
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		line(78, 1, (char)247);
   ;	
	mov	al,247
	push	ax
	mov	ax,1
	push	ax
	mov	ax,78
	push	ax
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;		gotoxy(1, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		line(78, 1, (char)247);
   ;	
	mov	al,247
	push	ax
	mov	ax,1
	push	ax
	mov	ax,78
	push	ax
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;		gotoxy(27, 6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,27
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		textcolor(RED);
   ;	
	mov	ax,4
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		cprintf("V P a s s  M a n a g e r");
   ;	
	mov	ax,offset DGROUP:s@+10134
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;		box(15, 10, 18, 48);
   ;	
	mov	ax,48
	push	ax
	mov	ax,18
	push	ax
	mov	ax,10
	push	ax
	mov	ax,15
	push	ax
	call	near ptr @box$qiiii
	add	sp,8
   ;	
   ;		textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		gotoxy(33, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("1. SIGN IN");
   ;	
	mov	ax,offset DGROUP:s@+10159
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(33, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("2. SIGN UP");
   ;	
	mov	ax,offset DGROUP:s@+10170
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		gotoxy(33, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("3. EXIT");
   ;	
	mov	ax,offset DGROUP:s@+10181
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;		textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		gotoxy(29, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cprintf("... Press Number ...");
   ;	
	mov	ax,offset DGROUP:s@+10189
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;	
   ;		choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;	
   ;		switch (choice)
   ;	
	mov	al,byte ptr DGROUP:_choice
	cbw	
	mov	word ptr [bp-2],ax
	mov	cx,4
	mov	bx,offset @19@C8098
@19@170:
	mov	ax,word ptr cs:[bx]
	cmp	ax,word ptr [bp-2]
	je	short @19@242
	inc	bx
	inc	bx
	loop	short @19@170
	jmp	@19@2666
@19@242:
	jmp	word ptr cs:[bx+8]
@19@266:
   ;	
   ;		{
   ;		case '1':
   ;			textcolor(BLUE + BLINK);
   ;	
	mov	ax,129
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(33, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("1. SIGN IN");
   ;	
	mov	ax,offset DGROUP:s@+10210
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			delay(500);
   ;	
	mov	ax,500
	push	ax
	call	near ptr _delay
	pop	cx
@19@290:
   ;	
   ;		log_in:
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;			gotoxy(1, 5);
   ;	
	mov	ax,5
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			line(78, 1, (char)247);
   ;	
	mov	al,247
	push	ax
	mov	ax,1
	push	ax
	mov	ax,78
	push	ax
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;			gotoxy(1, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			line(78, 1, (char)247);
   ;	
	mov	al,247
	push	ax
	mov	ax,1
	push	ax
	mov	ax,78
	push	ax
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;			gotoxy(27, 6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,27
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			textcolor(RED);
   ;	
	mov	ax,4
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			cprintf("V P a s s  M a n a g e r");
   ;	
	mov	ax,offset DGROUP:s@+10221
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			box(15, 10, 18, 48);
   ;	
	mov	ax,48
	push	ax
	mov	ax,18
	push	ax
	mov	ax,10
	push	ax
	mov	ax,15
	push	ax
	call	near ptr @box$qiiii
	add	sp,8
   ;	
   ;	
   ;			textcolor(5);
   ;	
	mov	ax,5
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(18, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,18
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("LOG-IN ID : ");
   ;	
	mov	ax,offset DGROUP:s@+10246
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(18, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,18
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("PASSWORD  : ");
   ;	
	mov	ax,offset DGROUP:s@+10259
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(25, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("S");
   ;	
	mov	ax,offset DGROUP:s@+10272
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(49, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,49
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("C");
   ;	
	mov	ax,offset DGROUP:s@+10274
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(38, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,38
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("R");
   ;	
	mov	ax,offset DGROUP:s@+10276
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(26, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,26
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("IGN IN");
   ;	
	mov	ax,offset DGROUP:s@+10278
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(50, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,50
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("ANCAL");
   ;	
	mov	ax,offset DGROUP:s@+10285
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(39, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,39
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("ESET");
   ;	
	mov	ax,offset DGROUP:s@+10291
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			textbackground(CYAN);
   ;	
	mov	ax,3
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;			gotoxy(30, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("                              ");
   ;	
	mov	ax,offset DGROUP:s@+10296
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(30, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("                              ");
   ;	
	mov	ax,offset DGROUP:s@+10327
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(19, 21);
   ;	
	mov	ax,21
	push	ax
	mov	ax,19
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("Type Username , Press Enter to continue...");
   ;	
	mov	ax,offset DGROUP:s@+10358
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			_setcursortype(_SOLIDCURSOR);
   ;	
	mov	ax,1
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;			textbackground(CYAN);
   ;	
	mov	ax,3
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(30, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			char c, username[20];
   ;			passn = 0;
   ;	
	xor	si,si
   ;	
   ;			fflush(stdin);
   ;	
	mov	ax,offset DGROUP:__streams
	push	ax
	call	near ptr _fflush
	pop	cx
   ;	
   ;			username[0] = '\0';
   ;	
	mov	byte ptr [bp-24],0
	jmp	@19@938
@19@338:
   ;	
   ;			while (c)
   ;			{
   ;				if (passn == 19)
   ;	
	cmp	si,19
	jne	short @19@386
	jmp	@19@962
@19@386:
   ;	
   ;					break;
   ;				fflush(stdin);
   ;	
	mov	ax,offset DGROUP:__streams
	push	ax
	call	near ptr _fflush
	pop	cx
   ;	
   ;				c = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr [bp-3],al
   ;	
   ;				if (passn == 0 && (c == (char)13 || c == '\t'))
   ;	
	or	si,si
	je	@@9
	jmp	@19@482
@@9:
	cmp	byte ptr [bp-3],13
	je	short @19@458
	cmp	byte ptr [bp-3],9
	je	@@10
	jmp	@19@482
@@10:
@19@458:
   ;	
   ;				{
   ;					_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;					textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;					gotoxy(20, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("                                        ");
   ;	
	mov	ax,offset DGROUP:s@+10401
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					gotoxy(19, 21);
   ;	
	mov	ax,21
	push	ax
	mov	ax,19
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("                                               ");
   ;	
	mov	ax,offset DGROUP:s@+10442
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					gotoxy(24, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("                                ");
   ;	
	mov	ax,offset DGROUP:s@+10490
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					delay(500);
   ;	
	mov	ax,500
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;					textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;					gotoxy(24, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("Username field cannot be blank.");
   ;	
	mov	ax,offset DGROUP:s@+10523
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;					gotoxy(25, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("Press any key to continue...");
   ;	
	mov	ax,offset DGROUP:s@+10555
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					getch();
   ;	
	call	near ptr _getch
   ;	
   ;					goto log_in;
   ;	
	jmp	@19@290
@19@482:
   ;	
   ;				}
   ;				if (c == (char)13)
   ;	
	cmp	byte ptr [bp-3],13
	jne	short @19@554
	jmp	short @19@962
	jmp	short @19@938
@19@554:
   ;	
   ;					break;
   ;				else if (c == ' ')
   ;	
	cmp	byte ptr [bp-3],32
	jne	short @19@626
	jmp	short @19@938
	jmp	short @19@938
@19@626:
   ;	
   ;					continue;
   ;				else if (c == '\b')
   ;	
	cmp	byte ptr [bp-3],8
	jne	short @19@770
   ;	
   ;				{
   ;					if (passn != 0)
   ;	
	or	si,si
	je	short @19@698
   ;	
   ;					{
   ;						passn--;
   ;	
	dec	si
   ;	
   ;						cprintf("\b \b");
   ;	
	mov	ax,offset DGROUP:s@+10584
	push	ax
	call	near ptr _cprintf
	pop	cx
	jmp	short @19@722
@19@698:
	jmp	short @19@938
@19@722:
	jmp	short @19@938
	jmp	short @19@938
@19@770:
   ;	
   ;					}
   ;					else
   ;						continue;
   ;					continue;
   ;				}
   ;				else if (c == '\t')
   ;	
	cmp	byte ptr [bp-3],9
	jne	short @19@842
	jmp	short @19@962
	jmp	short @19@938
@19@842:
   ;	
   ;					break;
   ;				else if (c == (char)27)
   ;	
	cmp	byte ptr [bp-3],27
	jne	short @19@914
   ;	
   ;				{
   ;					menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;					textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;					goto wc;
   ;	
	jmp	@19@50
	jmp	short @19@938
@19@914:
   ;	
   ;				}
   ;				else
   ;				{
   ;					username[passn] = c;
   ;	
	mov	al,byte ptr [bp-3]
	mov	byte ptr [bp+si-24],al
   ;	
   ;					cprintf("%c", c);
   ;	
	mov	al,byte ptr [bp-3]
	cbw	
	push	ax
	mov	ax,offset DGROUP:s@+10588
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
   ;	
   ;					passn++;
   ;	
	inc	si
@19@938:
	cmp	byte ptr [bp-3],0
	je	@@11
	jmp	@19@338
@@11:
@19@962:
   ;	
   ;				}
   ;			}
   ;			username[passn] = '\0';
   ;	
	mov	byte ptr [bp+si-24],0
   ;	
   ;			fflush(stdin);
   ;	
	mov	ax,offset DGROUP:__streams
	push	ax
	call	near ptr _fflush
	pop	cx
@19@986:
   ;	
   ;	
   ;		password:
   ;			if (passn == 99)
   ;	
	cmp	si,99
	jne	short @19@1034
   ;	
   ;			{
   ;				gotoxy(20, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("                                        ");
   ;	
	mov	ax,offset DGROUP:s@+10591
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				gotoxy(29, 21);
   ;	
	mov	ax,21
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("                      ");
   ;	
	mov	ax,offset DGROUP:s@+10632
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				gotoxy(24, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("                                ");
   ;	
	mov	ax,offset DGROUP:s@+10655
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				gotoxy(30, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				textbackground(CYAN);
   ;	
	mov	ax,3
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;				cprintf("                              ");
   ;	
	mov	ax,offset DGROUP:s@+10688
	push	ax
	call	near ptr _cprintf
	pop	cx
@19@1034:
   ;	
   ;			}
   ;			_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;			textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(19, 21);
   ;	
	mov	ax,21
	push	ax
	mov	ax,19
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("                                               ");
   ;	
	mov	ax,offset DGROUP:s@+10719
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(20, 21);
   ;	
	mov	ax,21
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("Type Password , Press Enter to continue...");
   ;	
	mov	ax,offset DGROUP:s@+10767
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			_setcursortype(_SOLIDCURSOR);
   ;	
	mov	ax,1
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;			gotoxy(30, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			textbackground(CYAN);
   ;	
	mov	ax,3
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			char password[20];
   ;			password[0] = '\0';
   ;	
	mov	byte ptr [bp-44],0
   ;	
   ;			passn = 0;
   ;	
	xor	si,si
	jmp	@19@1658
@19@1058:
   ;	
   ;			while (c)
   ;			{
   ;				if (passn == 19)
   ;	
	cmp	si,19
	jne	short @19@1106
	jmp	@19@1682
@19@1106:
   ;	
   ;					break;
   ;				fflush(stdin);
   ;	
	mov	ax,offset DGROUP:__streams
	push	ax
	call	near ptr _fflush
	pop	cx
   ;	
   ;				c = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr [bp-3],al
   ;	
   ;				if (passn == 0 && (c == (char)13 || c == '\t'))
   ;	
	or	si,si
	je	@@12
	jmp	@19@1202
@@12:
	cmp	byte ptr [bp-3],13
	je	short @19@1178
	cmp	byte ptr [bp-3],9
	je	@@13
	jmp	@19@1202
@@13:
@19@1178:
   ;	
   ;				{
   ;					_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;					textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;					gotoxy(20, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("                                        ");
   ;	
	mov	ax,offset DGROUP:s@+10810
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					gotoxy(19, 21);
   ;	
	mov	ax,21
	push	ax
	mov	ax,19
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("                                               ");
   ;	
	mov	ax,offset DGROUP:s@+10851
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					gotoxy(24, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("                                ");
   ;	
	mov	ax,offset DGROUP:s@+10899
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					delay(500);
   ;	
	mov	ax,500
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;					textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;					gotoxy(24, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("Password field cannot be blank.");
   ;	
	mov	ax,offset DGROUP:s@+10932
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;					gotoxy(25, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("Press any key to continue...");
   ;	
	mov	ax,offset DGROUP:s@+10964
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					getch();
   ;	
	call	near ptr _getch
   ;	
   ;					goto log_in;
   ;	
	jmp	@19@290
@19@1202:
   ;	
   ;				}
   ;				if (c == (char)13)
   ;	
	cmp	byte ptr [bp-3],13
	jne	short @19@1274
	jmp	short @19@1682
	jmp	short @19@1658
@19@1274:
   ;	
   ;					break;
   ;				else if (c == '\b')
   ;	
	cmp	byte ptr [bp-3],8
	jne	short @19@1418
   ;	
   ;				{
   ;					if (passn != 0)
   ;	
	or	si,si
	je	short @19@1346
   ;	
   ;					{
   ;						passn--;
   ;	
	dec	si
   ;	
   ;						cprintf("\b \b");
   ;	
	mov	ax,offset DGROUP:s@+10993
	push	ax
	call	near ptr _cprintf
	pop	cx
	jmp	short @19@1370
@19@1346:
	jmp	short @19@1658
@19@1370:
	jmp	short @19@1658
	jmp	short @19@1658
@19@1418:
   ;	
   ;					}
   ;					else
   ;						continue;
   ;					continue;
   ;				}
   ;				else if (c == '\t')
   ;	
	cmp	byte ptr [bp-3],9
	jne	short @19@1490
	jmp	short @19@1682
	jmp	short @19@1658
@19@1490:
   ;	
   ;					break;
   ;				else if (c == (char)27)
   ;	
	cmp	byte ptr [bp-3],27
	jne	short @19@1562
	jmp	short @19@1658
	jmp	short @19@1658
@19@1562:
   ;	
   ;					continue;
   ;				else if (c == ' ')
   ;	
	cmp	byte ptr [bp-3],32
	jne	short @19@1634
	jmp	short @19@1658
	jmp	short @19@1658
@19@1634:
   ;	
   ;					continue;
   ;				else
   ;				{
   ;					password[passn] = c;
   ;	
	mov	al,byte ptr [bp-3]
	mov	byte ptr [bp+si-44],al
   ;	
   ;					passn++;
   ;	
	inc	si
   ;	
   ;					cprintf("*");
   ;	
	mov	ax,offset DGROUP:s@+10997
	push	ax
	call	near ptr _cprintf
	pop	cx
@19@1658:
	cmp	byte ptr [bp-3],0
	je	@@14
	jmp	@19@1058
@@14:
@19@1682:
   ;	
   ;				}
   ;			}
   ;			password[passn] = '\0';
   ;	
	mov	byte ptr [bp+si-44],0
   ;	
   ;	
   ;			_setcursortype(_NOCURSOR);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr __setcursortype
	pop	cx
   ;	
   ;			textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(19, 21);
   ;	
	mov	ax,21
	push	ax
	mov	ax,19
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("                                               ");
   ;	
	mov	ax,offset DGROUP:s@+10999
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(22, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,22
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("FOR SIGN - IN , PRESS 'S' or 'ENTER'.");
   ;	
	mov	ax,offset DGROUP:s@+11047
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(29, 21);
   ;	
	mov	ax,21
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("FOR RESET , PRESS 'R'.");
   ;	
	mov	ax,offset DGROUP:s@+11085
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(24, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("FOR CANCAL , PRESS 'C' or 'ESC'.");
   ;	
	mov	ax,offset DGROUP:s@+11108
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;	
   ;			if (choice == 's' || choice == 'S' || choice == (char)13)
   ;	
	cmp	byte ptr DGROUP:_choice,115
	je	short @19@1754
	cmp	byte ptr DGROUP:_choice,83
	je	short @19@1754
	cmp	byte ptr DGROUP:_choice,13
	je	@@15
	jmp	@19@1922
@@15:
@19@1754:
   ;	
   ;			{
   ;				int check = AUTHORIZE(username, password);
   ;	
	lea	ax,word ptr [bp-44]
	push	ax
	lea	ax,word ptr [bp-24]
	push	ax
	call	near ptr @AUTHORIZE$qpzct1
	pop	cx
	pop	cx
	mov	di,ax
   ;	
   ;				if (check == 1)
   ;	
	cmp	di,1
	je	@@16
	jmp	@19@1826
@@16:
   ;	
   ;				{
   ;					gotoxy(20, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("                                        ");
   ;	
	mov	ax,offset DGROUP:s@+11141
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					gotoxy(29, 21);
   ;	
	mov	ax,21
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("                      ");
   ;	
	mov	ax,offset DGROUP:s@+11182
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					gotoxy(24, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("                                ");
   ;	
	mov	ax,offset DGROUP:s@+11205
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					boxi(24, 15, 17, 9);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,9
	push	ax
	mov	ax,17
	push	ax
	mov	ax,15
	push	ax
	mov	ax,24
	push	ax
	call	near ptr @boxi$qiiiii
	add	sp,10
   ;	
   ;					delay(500);
   ;	
	mov	ax,500
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;					gotoxy(19, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,19
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;					cprintf("YOU HAVE SUCCESSFULLY LOGGED INTO ACCOUNT.");
   ;	
	mov	ax,offset DGROUP:s@+11238
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					gotoxy(25, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;					cprintf("Press any key to continue...");
   ;	
	mov	ax,offset DGROUP:s@+11281
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					getch();
   ;	
	call	near ptr _getch
   ;	
   ;					MENU();
   ;	
	call	near ptr @MENU$qv
   ;	
   ;					menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;					goto wc;
   ;	
	jmp	@19@50
	jmp	@19@1922
@19@1826:
   ;	
   ;				}
   ;				else if (check == 2)
   ;	
	cmp	di,2
	je	@@17
	jmp	@19@1898
@@17:
   ;	
   ;				{
   ;					gotoxy(20, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("                                        ");
   ;	
	mov	ax,offset DGROUP:s@+11310
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					gotoxy(29, 21);
   ;	
	mov	ax,21
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("                      ");
   ;	
	mov	ax,offset DGROUP:s@+11351
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					gotoxy(24, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("                                ");
   ;	
	mov	ax,offset DGROUP:s@+11374
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					boxi(24, 15, 17, 9);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,9
	push	ax
	mov	ax,17
	push	ax
	mov	ax,15
	push	ax
	mov	ax,24
	push	ax
	call	near ptr @boxi$qiiiii
	add	sp,10
   ;	
   ;					delay(500);
   ;	
	mov	ax,500
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;					gotoxy(26, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,26
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;					cprintf("Password could not match.");
   ;	
	mov	ax,offset DGROUP:s@+11407
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					gotoxy(25, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;					cprintf("Press any key to continue...");
   ;	
	mov	ax,offset DGROUP:s@+11433
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					getch();
   ;	
	call	near ptr _getch
   ;	
   ;					passn = 99;
   ;	
	mov	si,99
   ;	
   ;					goto password;
   ;	
	jmp	@19@986
	jmp	@19@1922
@19@1898:
   ;	
   ;				}
   ;				else
   ;				{
   ;					gotoxy(20, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("                                        ");
   ;	
	mov	ax,offset DGROUP:s@+11462
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					gotoxy(29, 21);
   ;	
	mov	ax,21
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("                      ");
   ;	
	mov	ax,offset DGROUP:s@+11503
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					gotoxy(24, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cprintf("                                ");
   ;	
	mov	ax,offset DGROUP:s@+11526
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					boxi(24, 15, 17, 9);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,9
	push	ax
	mov	ax,17
	push	ax
	mov	ax,15
	push	ax
	mov	ax,24
	push	ax
	call	near ptr @boxi$qiiiii
	add	sp,10
   ;	
   ;					delay(500);
   ;	
	mov	ax,500
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;					gotoxy(24, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;					cprintf("PLEASE ENTER VALID DATA INPUT.");
   ;	
	mov	ax,offset DGROUP:s@+11559
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					gotoxy(25, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;					cprintf("Press any key to continue...");
   ;	
	mov	ax,offset DGROUP:s@+11590
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;					getch();
   ;	
	call	near ptr _getch
   ;	
   ;					goto log_in;
   ;	
	jmp	@19@290
@19@1922:
   ;	
   ;				}
   ;			}
   ;	
   ;			if (choice == 'c' || choice == 'C' || choice == (char)27)
   ;	
	cmp	byte ptr DGROUP:_choice,99
	je	short @19@1994
	cmp	byte ptr DGROUP:_choice,67
	je	short @19@1994
	cmp	byte ptr DGROUP:_choice,27
	jne	short @19@2018
@19@1994:
   ;	
   ;			{
   ;				boxi(48, 15, 17, 8);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,8
	push	ax
	mov	ax,17
	push	ax
	mov	ax,15
	push	ax
	mov	ax,48
	push	ax
	call	near ptr @boxi$qiiiii
	add	sp,10
   ;	
   ;				delay(500);
   ;	
	mov	ax,500
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto wc;
   ;	
	jmp	@19@50
@19@2018:
   ;	
   ;			}
   ;	
   ;			if (choice == 'r' || choice == 'R')
   ;	
	cmp	byte ptr DGROUP:_choice,114
	je	short @19@2066
	cmp	byte ptr DGROUP:_choice,82
	jne	short @19@2090
@19@2066:
   ;	
   ;			{
   ;				boxi(37, 15, 17, 7);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,7
	push	ax
	mov	ax,17
	push	ax
	mov	ax,15
	push	ax
	mov	ax,37
	push	ax
	call	near ptr @boxi$qiiiii
	add	sp,10
   ;	
   ;				delay(500);
   ;	
	mov	ax,500
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				goto log_in;
   ;	
	jmp	@19@290
@19@2090:
   ;	
   ;			}
   ;	
   ;			if (!(choice == 's' || choice == 'S' || choice == (char)13 || choice == 'r' || choice == 'R' ||
   ;	
   ;	
   ;				  choice == 'c' || choice == 'C' || choice == (char)27))
   ;	
	cmp	byte ptr DGROUP:_choice,115
	je	short @19@2306
	cmp	byte ptr DGROUP:_choice,83
	je	short @19@2306
	cmp	byte ptr DGROUP:_choice,13
	je	short @19@2306
	cmp	byte ptr DGROUP:_choice,114
	je	short @19@2306
	cmp	byte ptr DGROUP:_choice,82
	je	short @19@2306
	cmp	byte ptr DGROUP:_choice,99
	je	short @19@2306
	cmp	byte ptr DGROUP:_choice,67
	je	short @19@2306
	cmp	byte ptr DGROUP:_choice,27
	je	short @19@2306
   ;	
   ;			{
   ;				textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("Please Select valid choice number.");
   ;	
	mov	ax,offset DGROUP:s@+11619
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				getch();
   ;	
	call	near ptr _getch
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("                                  ");
   ;	
	mov	ax,offset DGROUP:s@+11654
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				goto log_in;
   ;	
	jmp	@19@290
@19@2306:
   ;	
   ;			}
   ;	
   ;		case '2':
   ;			textcolor(BLUE + BLINK);
   ;	
	mov	ax,129
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(33, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("2. SIGN UP");
   ;	
	mov	ax,offset DGROUP:s@+11689
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			delay(500);
   ;	
	mov	ax,500
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			choice = license(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr @license$qi
	pop	cx
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;	
   ;			if (choice == 2)
   ;	
	cmp	byte ptr DGROUP:_choice,2
	jne	short @19@2354
   ;	
   ;				exit(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _exit
	pop	cx
@19@2354:
   ;	
   ;	
   ;			if (choice == 1)
   ;	
	cmp	byte ptr DGROUP:_choice,1
	jne	short @19@2402
   ;	
   ;			{
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto wc;
   ;	
	jmp	@19@50
@19@2402:
	jmp	@19@2690
@19@2426:
   ;	
   ;			}
   ;	
   ;			break;
   ;	
   ;		case (char)27:
   ;		case '3':
   ;			textcolor(BLUE + BLINK);
   ;	
	mov	ax,129
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(33, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("3. EXIT");
   ;	
	mov	ax,offset DGROUP:s@+11700
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			delay(500);
   ;	
	mov	ax,500
	push	ax
	call	near ptr _delay
	pop	cx
@19@2450:
   ;	
   ;		fexit:
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			textbackground(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textbackground
	pop	cx
   ;	
   ;			gotoxy(1, 5);
   ;	
	mov	ax,5
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			line(78, 1, (char)247);
   ;	
	mov	al,247
	push	ax
	mov	ax,1
	push	ax
	mov	ax,78
	push	ax
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;			gotoxy(1, 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			line(78, 1, (char)247);
   ;	
	mov	al,247
	push	ax
	mov	ax,1
	push	ax
	mov	ax,78
	push	ax
	call	near ptr @line$qiizc
	add	sp,6
   ;	
   ;			gotoxy(27, 6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,27
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			textcolor(RED);
   ;	
	mov	ax,4
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			cprintf("V P a s s  M a n a g e r");
   ;	
	mov	ax,offset DGROUP:s@+11708
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			box(15, 10, 18, 48);
   ;	
	mov	ax,48
	push	ax
	mov	ax,18
	push	ax
	mov	ax,10
	push	ax
	mov	ax,15
	push	ax
	call	near ptr @box$qiiii
	add	sp,8
   ;	
   ;			gotoxy(23, 10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("%c THANKS FOR USING APPLICATION %c", (char)181, (char)198);
   ;	
	mov	ax,65478
	push	ax
	mov	ax,65461
	push	ax
	mov	ax,offset DGROUP:s@+11733
	push	ax
	call	near ptr _cprintf
	add	sp,6
   ;	
   ;	
   ;			textcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(28, 12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("Do you want to EXIT ?");
   ;	
	mov	ax,offset DGROUP:s@+11768
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(33, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("1. Y E S");
   ;	
	mov	ax,offset DGROUP:s@+11790
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			gotoxy(33, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("2. N O");
   ;	
	mov	ax,offset DGROUP:s@+11799
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			textcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(29, 22);
   ;	
	mov	ax,22
	push	ax
	mov	ax,29
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("... Press Number ...");
   ;	
	mov	ax,offset DGROUP:s@+11806
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;	
   ;			choice = getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_choice,al
   ;	
   ;	
   ;			switch (choice)
   ;	
	mov	al,byte ptr DGROUP:_choice
	cbw	
	cmp	ax,27
	je	short @19@2618
	cmp	ax,49
	je	short @19@2594
	cmp	ax,50
	je	short @19@2618
	jmp	short @19@2642
@19@2594:
   ;	
   ;			{
   ;			case '1':
   ;				textcolor(BLUE + BLINK);
   ;	
	mov	ax,129
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				gotoxy(33, 14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("1. Y E S");
   ;	
	mov	ax,offset DGROUP:s@+11827
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				delay(500);
   ;	
	mov	ax,500
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				exit(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _exit
	pop	cx
@19@2618:
   ;	
   ;	
   ;			case (char)27:
   ;			case '2':
   ;				textcolor(BLUE + BLINK);
   ;	
	mov	ax,129
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				gotoxy(33, 16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("2. N O");
   ;	
	mov	ax,offset DGROUP:s@+11836
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				delay(500);
   ;	
	mov	ax,500
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;				goto wc;
   ;	
	jmp	@19@50
@19@2642:
   ;	
   ;	
   ;			default:
   ;				textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("Please Select valid choice number.");
   ;	
	mov	ax,offset DGROUP:s@+11843
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				getch();
   ;	
	call	near ptr _getch
   ;	
   ;				gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cprintf("                                  ");
   ;	
	mov	ax,offset DGROUP:s@+11878
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;				goto fexit;
   ;	
	jmp	@19@2450
@19@2666:
   ;	
   ;			}
   ;	
   ;		default:
   ;			textcolor(BLACK + BLINK);
   ;	
	mov	ax,128
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;			gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("Please Select valid choice number.");
   ;	
	mov	ax,offset DGROUP:s@+11913
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			getch();
   ;	
	call	near ptr _getch
   ;	
   ;			gotoxy(23, 23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cprintf("                                  ");
   ;	
	mov	ax,offset DGROUP:s@+11948
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;			menu = 1;
   ;	
	mov	word ptr DGROUP:_menu,1
   ;	
   ;			goto wc;
   ;	
	jmp	@19@50
@19@2690:
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_main	endp
@19@C8098	label	word
	db	27
	db	0
	db	49
	db	0
	db	50
	db	0
	db	51
	db	0
	dw	@19@2426
	dw	@19@266
	dw	@19@2306
	dw	@19@2426
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'%c'
	db	0
	db	'%c'
	db	0
	db	'%c'
	db	0
	db	'%d '
	db	0
	db	'%d'
	db	0
	db	'%d'
	db	0
	db	'%d'
	db	0
	db	' 1'
	db	0
	db	'V P a s s  M a n a g e r'
	db	0
	db	'%c'
	db	0
	db	'%c'
	db	0
	db	'%c'
	db	0
	db	'%c'
	db	0
	db	'%c'
	db	0
	db	'%c'
	db	0
	db	'%c'
	db	0
	db	'%c'
	db	0
	db	'%c'
	db	0
	db	'%c'
	db	0
	db	'%c'
	db	0
	db	'%c'
	db	0
	db	'KEYFILE.VPD'
	db	0
	db	'KEYFILE.VPD'
	db	0
	db	'USERNAME.VPD'
	db	0
	db	'USERNAME.VPD'
	db	0
	db	'USERNAME.VPD'
	db	0
	db	'USERNAME.VPD'
	db	0
	db	'USERNAME.VPD'
	db	0
	db	'PASSWORD.VPD'
	db	0
	db	'END USER'
	db	0
	db	'LICENSE AGREEMENT'
	db	0
	db	'This License Agreement (the "AGREEMENT") is a legal agreement'
	db	' between'
	db	0
	db	'you individually, or if you are authorized to acquire the Sof'
	db	'tware on'
	db	0
	db	'behalf of your company or another organization , between the '
	db	'entities'
	db	0
	db	'for whose benefit you act.'
	db	0
	db	'BY INDICATING YOUR ACCEPTANCE BY CLICKING ON THE APPROPRIATE '
	db	'BUTTON ,'
	db	0
	db	'OR BY INSTALLING, ACTIVATING OR USING THE SOFTWARE , YOU ARE '
	db	'AGREEING'
	db	0
	db	'TO BE BOUND BY THE TERMS OF THIS AGREEMENT.'
	db	0
	db	'IF YOU HAVE ANY QUESTION OR CONCERNS ABOUT THE TERMS OF THE A'
	db	'GREEMENT'
	db	0
	db	'PLEASE CONTACT US AT - '
	db	0
	db	'vivekpatel111@yahoo.co.in'
	db	0
	db	'IF, PRIOR TO ACTIVATING OR USING THE SOFTWARE, YOU DECIDE YOU'
	db	' ARE NOT'
	db	0
	db	'WILLING TO AGREE TO THE TERMS OF THIS AGREEMENT, YOU HAVE NO '
	db	'RIGHT TO'
	db	0
	db	'USE THE SOFTWARE AND SHOULD RETURN IT, DELETE OR DISABLE IT.'
	db	0
	db	'Press any key to continue...'
	db	0
	db	'1. GRANT OF LICENSE'
	db	0
	db	'Subject to the terms below, This software hereby grants You a'
	db	' personal'
	db	0
	db	',revocable, non-exclusive, non-transferable license to instal'
	db	'l and use'
	db	0
	db	'a copy of the Software on only one computer.  You may not ren'
	db	't, lease,'
	db	0
	db	'lend, sell, redistribute or sublicense the Software.  You may'
	db	' not copy'
	db	0
	db	'( other than 1 back-up copy for archival purposes only ) , de'
	db	'compile ,'
	db	0
	db	'reverse engineer , disassemble , attempt to derive the source'
	db	' code of,'
	db	0
	db	'modify , or create derivative works of the Software , any upd'
	db	'ates , or'
	db	0
	db	'any things there of  (  except as and only to the extent any '
	db	'foregoing'
	db	0
	db	'restriction is prohibited by applicable law or to the extent '
	db	'as may be'
	db	0
	db	'permitted by the licensing terms and governing use of any ope'
	db	'n sourced'
	db	0
	db	'components, if any, included with the Software). This license'
	db	' does not'
	db	0
	db	'imply any rights to future upgrades or updates of the Softwar'
	db	'e.'
	db	0
	db	'Press any key to continue...'
	db	0
	db	'2. INTELLECTUAL PROPERTY'
	db	0
	db	'You  do not acquire  any  intellectual property  or  other pr'
	db	'oprietary'
	db	0
	db	'rights, including patents, designs, trademarks, copyright or '
	db	'rights in'
	db	0
	db	'any  confidential  information   or secrets ,  in  or relatin'
	db	'g to  the'
	db	0
	db	'Software.'
	db	0
	db	'3. DATA STORAGE'
	db	0
	db	'This Software assumes  no  responsibility  or liability whats'
	db	'oever for'
	db	0
	db	'the deletion or failure to store your data or information.'
	db	0
	db	'Press any key to continue...'
	db	0
	db	'4. NO WARRANTY'
	db	0
	db	'YOU EXPRESSLY ACKNOWLEDGE AND AGREE  THAT YOUR USE OF THE SOF'
	db	'TWARE AND'
	db	0
	db	'RELATED SERVICES ARE AT YOUR SOLE RISK AND THAT THE ENTIRE RI'
	db	'SKS AS TO'
	db	0
	db	'SATISFACTORY QUALITY, PERFORMANCE, ACCURACY AND EFFORT IS WIT'
	db	'H YOU. TO'
	db	0
	db	'THE MAXIMUM EXTENT PERMITTED BY  APPLICABLE LAW , THE SOFTWAR'
	db	'E AND ANY'
	db	0
	db	'RELATED SERVICES  ARE  PROVIDED "AS IS" AND "AS AVAILABLE" , '
	db	' WITH ALL'
	db	0
	db	'FAULTS AND  WITHOUT WARRANTY OF ANY KIND , AND  I HEREBY DISC'
	db	'LAIMS ALL'
	db	0
	db	'WARRANTIES  AND  CONDITIONS WITH RESPECT  TO  THE SOFTWARE AN'
	db	'D RELATED'
	db	0
	db	'SERVICES.'
	db	0
	db	'Press any key to continue...'
	db	0
	db	'5. CONSENT TO USE OF DATA'
	db	0
	db	'You agree that  this software may collect and  use technical '
	db	'data  and'
	db	0
	db	'related information,including but not limited to technical in'
	db	'formation'
	db	0
	db	'about Your Computer, system and application software.'
	db	0
	db	'6. TERMINATION'
	db	0
	db	'This Agreement shall terminate automatically without notice f'
	db	'rom us if'
	db	0
	db	'you fail to comply with any of the terms of this Agreement , '
	db	'the Terms'
	db	0
	db	'of Service, or Your subscription. Upon termination of the lic'
	db	'ense, you'
	db	0
	db	'shall cease all use of the Software and related services , an'
	db	'd destroy'
	db	0
	db	'all copies, full or partial, of the Software.'
	db	0
	db	'Press any key to continue...'
	db	0
	db	'7. REDISTRIBUTED CODE'
	db	0
	db	'The  Software  may  contain  binary  representations  of  thi'
	db	'rd  party'
	db	0
	db	'components  which  may be  open  source libraries . Unless re'
	db	'quired by'
	db	0
	db	'applicable law , redistributed software in this Section is di'
	db	'stributed'
	db	0
	db	'"AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, AN'
	db	'D WITHOUT'
	db	0
	db	'ANY LIABILITY OF ANY KIND WHATSOEVER TO EMTRACE.Text file acc'
	db	'ompanying'
	db	0
	db	'the Software will specify  type of redistributed code include'
	db	'd  in the'
	db	0
	db	'Software , together with the applicable  redistributed code l'
	db	'icense or'
	db	0
	db	'reference thereto.'
	db	0
	db	'  Press any key to continue...'
	db	0
	db	'Press any key to go into HELP...'
	db	0
	db	'By clicking "ACCEPT" below , you electronically agree to our'
	db	0
	db	'Terms of Services and Privacy Policy ( the " Terms " ) ; you'
	db	0
	db	'acknowledge receipts  of our Terms , and you agree to adopt'
	db	0
	db	'whotoever written in the Terms of Service.'
	db	0
	db	'A'
	db	0
	db	'CCEPT'
	db	0
	db	'D'
	db	0
	db	'ECLINE'
	db	0
	db	'... Press Character ...'
	db	0
	db	'A'
	db	0
	db	'CCEPT'
	db	0
	db	'D'
	db	0
	db	'ECLINE'
	db	0
	db	'YOU DON'
	db	39
	db	'T HAVE ANY PRIVILEGE TO USE THIS SOFTWARE.'
	db	0
	db	'YOU MUST ACCEPT "TERMS & CONDITIONS" TO USE THIS SOFTWARE.'
	db	0
	db	'KINDLY RESTART THE  APPLICATION TO USE THE SOFTWARE.'
	db	0
	db	'OR DELETE THE SOFTWARE IF YOU DON'
	db	39
	db	'T WANT TO USE.'
	db	0
	db	'Press any key to exit...'
	db	0
	db	'Please Select valid choice character.'
	db	0
	db	'                                     '
	db	0
	db	'                                      '
	db	0
	db	'                                      '
	db	0
	db	'                                      '
	db	0
	db	'                                      '
	db	0
	db	'                                      '
	db	0
	db	'                                      '
	db	0
	db	'                                      '
	db	0
	db	'                                      '
	db	0
	db	'                                      '
	db	0
	db	'                                      '
	db	0
	db	'                                      '
	db	0
	db	'                                      '
	db	0
	db	'                                      '
	db	0
	db	'Know your MAIN MENU'
	db	0
	db	'1. Add Data'
	db	0
	db	'2. View Data'
	db	0
	db	'3. Delete Data'
	db	0
	db	'4. Export to .TXT File'
	db	0
	db	'5. Recovery Data'
	db	0
	db	'6. Settings'
	db	0
	db	'7. Help'
	db	0
	db	'8. Log Out'
	db	0
	db	'... Press Number to see HELP ...'
	db	0
	db	'For Exit , Press '
	db	39
	db	'ESC'
	db	39
	db	0
	db	'1. Add Data'
	db	0
	db	'Add Data'
	db	0
	db	'This option will add your data to'
	db	0
	db	'Secure File with encryption into'
	db	0
	db	'currently opened account.'
	db	0
	db	'You can add following type of data:'
	db	0
	db	'1. E-mail Account'
	db	0
	db	'2. Bank Account'
	db	0
	db	'3. Secure Note'
	db	0
	db	'2. View Data'
	db	0
	db	'View Data'
	db	0
	db	'This option will show your data from'
	db	0
	db	'previously saved Secure File with'
	db	0
	db	'decryption from currently opened'
	db	0
	db	'account.'
	db	0
	db	'You can view following type of data:'
	db	0
	db	'1. E-mail Account'
	db	0
	db	'2. Bank Account'
	db	0
	db	'3. Secure Note'
	db	0
	db	'3. Delete Data'
	db	0
	db	'Delete Data'
	db	0
	db	'This option will delete your selected'
	db	0
	db	'data of Secure File for temporary'
	db	0
	db	'state of period.'
	db	0
	db	'You can delete following type of data'
	db	0
	db	'1. E-mail Account'
	db	0
	db	'2. Bank Account'
	db	0
	db	'3. Secure Note'
	db	0
	db	'INFORMATION:'
	db	0
	db	'To delete data parmanently,you have'
	db	0
	db	'to delete Recovery Files of data.'
	db	0
	db	'4. Export to .TXT File'
	db	0
	db	'Export to .TXT File'
	db	0
	db	'This option will generate .TXT file'
	db	0
	db	'( Text Editor File ) with currently'
	db	0
	db	'opened file with E-mail Account and'
	db	0
	db	'Secure Note Data.'
	db	0
	db	'File will be exported in this path:'
	db	0
	db	'C:\VPASS\DATA\USER\FILES\*.txt'
	db	0
	db	'INFORMATION:'
	db	0
	db	'For Security Reasons,your bank a\c'
	db	0
	db	'data will not be exported into .txt'
	db	0
	db	'files.'
	db	0
	db	'5. Recovery Data'
	db	0
	db	'Recovery Data'
	db	0
	db	'This option will make you able to'
	db	0
	db	'restore ( Recover ) your data from'
	db	0
	db	'last three states of log-in session.'
	db	0
	db	'You can recover your all type of'
	db	0
	db	'data with this Recovery Option.'
	db	0
	db	'WARNING:'
	db	0
	db	'When you will recover your data,'
	db	0
	db	'you will lost your every data files'
	db	0
	db	'which are currently available into'
	db	0
	db	'your account. After that all log-in'
	db	0
	db	'session will be expired.'
	db	0
	db	'6. Settings'
	db	0
	db	'Settings'
	db	0
	db	'This option will make you able to'
	db	0
	db	'change your Personal Settings.'
	db	0
	db	'You can change following Settings:'
	db	0
	db	'%c View\Edit Profile'
	db	0
	db	'%c Security Option'
	db	0
	db	'%c Enable\Disable Protection'
	db	0
	db	'%c Disable Account'
	db	0
	db	'7. Help'
	db	0
	db	'Help'
	db	0
	db	'This option will make you able to'
	db	0
	db	'see HELP Topics of programs. You'
	db	0
	db	'can select various HELP Topics and'
	db	0
	db	'will able to get help.'
	db	0
	db	'You can get following type of Help:'
	db	0
	db	'1. Know Your Main Menu'
	db	0
	db	'2. END USER LICENSE AGREEMENT and'
	db	0
	db	'   PRIVACY POLICY'
	db	0
	db	'3. About Us'
	db	0
	db	'8. Log Out'
	db	0
	db	'Log Out'
	db	0
	db	'This option will make you able to'
	db	0
	db	'log out from the current log-in'
	db	0
	db	'session. Your last third log-in'
	db	0
	db	'session will be expired as soon as'
	db	0
	db	'you log out from the session.'
	db	0
	db	'As you log out from the current'
	db	0
	db	'log-in session, this session will'
	db	0
	db	'be added to Recovery Data File.'
	db	0
	db	'Please Select valid choice number.'
	db	0
	db	'                                  '
	db	0
	db	'About Us'
	db	0
	db	'VPass Manager v1.0'
	db	0
	db	'Keep your Trust, Safe your Data.'
	db	0
	db	'%c%c%cPROGRAMMER%c%c%c'
	db	0
	db	'Vivek Ishwarbhai Patel'
	db	0
	db	'11BCE073'
	db	0
	db	'Computer Engineering Department,'
	db	0
	db	'Institute of Technology,'
	db	0
	db	'Nirma University.'
	db	0
	db	'(M) +91 94289 60350'
	db	0
	db	'%c%c%cSpecial Thanks%c%c%c'
	db	0
	db	'Savan Patel     (11BCE084)'
	db	0
	db	'Deval Patel     (11BCE071)'
	db	0
	db	'Vivek Chaudhary (11BCE018)'
	db	0
	db	'Press any key to go into HELP...'
	db	0
	db	'M A I N  M E N U'
	db	0
	db	'1. Add Data'
	db	0
	db	'2. View Data'
	db	0
	db	'3. Delete Data'
	db	0
	db	'4. Export to .TXT File'
	db	0
	db	'5. Recovery Data'
	db	0
	db	'6. Settings'
	db	0
	db	'7. Help'
	db	0
	db	'8. Log Out'
	db	0
	db	'... Press Number ...'
	db	0
	db	'ADD DATA'
	db	0
	db	'1. E-mail Account'
	db	0
	db	'2. Bank Account'
	db	0
	db	'3. Personal Note'
	db	0
	db	'4. Go Back'
	db	0
	db	'... Press Number ...'
	db	0
	db	'Please Select valid choice number.'
	db	0
	db	'                                  '
	db	0
	db	'VIEW DATA'
	db	0
	db	'1. E-mail Account  (%2d)'
	db	0
	db	'2. Bank Account    (%2d)'
	db	0
	db	'3. Personal Note   (%2d)'
	db	0
	db	'4. Go Back'
	db	0
	db	'... Press Number ...'
	db	0
	db	'Please Select valid choice number.'
	db	0
	db	'                                  '
	db	0
	db	'DELETE DATA'
	db	0
	db	'1. E-mail Account  (%2d)'
	db	0
	db	'2. Bank Account    (%2d)'
	db	0
	db	'3. Personal Note   (%2d)'
	db	0
	db	'4. Go Back'
	db	0
	db	'Information : '
	db	0
	db	'Please note that your data will not parmanetly'
	db	0
	db	'deleted untill you delete Recovery Files.'
	db	0
	db	'... Press Number ...'
	db	0
	db	'Please Select valid choice number.'
	db	0
	db	'                                  '
	db	0
	db	'EXPORT DATA'
	db	0
	db	'Information : '
	db	0
	db	'For Security Reasons, your BANK A/C. Data will'
	db	0
	db	'not be exported to .txt file.'
	db	0
	db	'Do you still want to continue ? '
	db	0
	db	'1. Y E S'
	db	0
	db	'2. N O'
	db	0
	db	'... Press Number ...'
	db	0
	db	'EXPORT DATA'
	db	0
	db	'This option is currently disabled for'
	db	0
	db	'    current version of application.   '
	db	0
	db	'Press any key to continue...'
	db	0
	db	'Please Select valid choice number.'
	db	0
	db	'                                  '
	db	0
	db	'RECOVERY DATA'
	db	0
	db	'Information : '
	db	0
	db	'For your kind knowledge, your current data will be'
	db	0
	db	'overwritten with your Recovery File Data.'
	db	0
	db	'Do you still want to continue ? '
	db	0
	db	'1. Y E S'
	db	0
	db	'2. N O'
	db	0
	db	'... Press Number ...'
	db	0
	db	'RECOVERY DATA'
	db	0
	db	'This option is currently disabled for'
	db	0
	db	'    current version of application.   '
	db	0
	db	'Press any key to continue...'
	db	0
	db	'Please Select valid choice number.'
	db	0
	db	'                                  '
	db	0
	db	'SETTINGS'
	db	0
	db	'1. View Profile'
	db	0
	db	'2. Edit Profile'
	db	0
	db	'3. Change Password'
	db	0
	db	'4. Change Security Question'
	db	0
	db	'5. Enable Protection'
	db	0
	db	'6. Delete Account'
	db	0
	db	'7. Go Back'
	db	0
	db	'... Press Number ...'
	db	0
	db	'Please Select valid choice number.'
	db	0
	db	'                                  '
	db	0
	db	'? ? ?   H E L P   ? ? ?'
	db	0
	db	'1. Know your MAIN MENU'
	db	0
	db	'2. END USER LICENSE AGREEMENT and'
	db	0
	db	'   PRIVACY POLICY'
	db	0
	db	'3. About Us'
	db	0
	db	'4. Go Back'
	db	0
	db	'... Press Number ...'
	db	0
	db	'Please Select valid choice number.'
	db	0
	db	'                                  '
	db	0
	db	'THANKS FOR USING APPLICATION'
	db	0
	db	'Do you want to LOG OUT ? '
	db	0
	db	'1. Y E S'
	db	0
	db	'2. N O'
	db	0
	db	'... Press Number ...'
	db	0
	db	'Please Select valid choice number.'
	db	0
	db	'                                  '
	db	0
	db	'Please Select valid choice number.'
	db	0
	db	'                                  '
	db	0
	db	'V P a s s  M a n a g e r'
	db	0
	db	'1. SIGN IN'
	db	0
	db	'2. SIGN UP'
	db	0
	db	'3. EXIT'
	db	0
	db	'... Press Number ...'
	db	0
	db	'1. SIGN IN'
	db	0
	db	'V P a s s  M a n a g e r'
	db	0
	db	'LOG-IN ID : '
	db	0
	db	'PASSWORD  : '
	db	0
	db	'S'
	db	0
	db	'C'
	db	0
	db	'R'
	db	0
	db	'IGN IN'
	db	0
	db	'ANCAL'
	db	0
	db	'ESET'
	db	0
	db	'                              '
	db	0
	db	'                              '
	db	0
	db	'Type Username , Press Enter to continue...'
	db	0
	db	'                                        '
	db	0
	db	'                                               '
	db	0
	db	'                                '
	db	0
	db	'Username field cannot be blank.'
	db	0
	db	'Press any key to continue...'
	db	0
	db	8
	db	' '
	db	8
	db	0
	db	'%c'
	db	0
	db	'                                        '
	db	0
	db	'                      '
	db	0
	db	'                                '
	db	0
	db	'                              '
	db	0
	db	'                                               '
	db	0
	db	'Type Password , Press Enter to continue...'
	db	0
	db	'                                        '
	db	0
	db	'                                               '
	db	0
	db	'                                '
	db	0
	db	'Password field cannot be blank.'
	db	0
	db	'Press any key to continue...'
	db	0
	db	8
	db	' '
	db	8
	db	0
	db	'*'
	db	0
	db	'                                               '
	db	0
	db	'FOR SIGN - IN , PRESS '
	db	39
	db	'S'
	db	39
	db	' or '
	db	39
	db	'ENTER'
	db	39
	db	'.'
	db	0
	db	'FOR RESET , PRESS '
	db	39
	db	'R'
	db	39
	db	'.'
	db	0
	db	'FOR CANCAL , PRESS '
	db	39
	db	'C'
	db	39
	db	' or '
	db	39
	db	'ESC'
	db	39
	db	'.'
	db	0
	db	'                                        '
	db	0
	db	'                      '
	db	0
	db	'                                '
	db	0
	db	'YOU HAVE SUCCESSFULLY LOGGED INTO ACCOUNT.'
	db	0
	db	'Press any key to continue...'
	db	0
	db	'                                        '
	db	0
	db	'                      '
	db	0
	db	'                                '
	db	0
	db	'Password could not match.'
	db	0
	db	'Press any key to continue...'
	db	0
	db	'                                        '
	db	0
	db	'                      '
	db	0
	db	'                                '
	db	0
	db	'PLEASE ENTER VALID DATA INPUT.'
	db	0
	db	'Press any key to continue...'
	db	0
	db	'Please Select valid choice number.'
	db	0
	db	'                                  '
	db	0
	db	'2. SIGN UP'
	db	0
	db	'3. EXIT'
	db	0
	db	'V P a s s  M a n a g e r'
	db	0
	db	'%c THANKS FOR USING APPLICATION %c'
	db	0
	db	'Do you want to EXIT ?'
	db	0
	db	'1. Y E S'
	db	0
	db	'2. N O'
	db	0
	db	'... Press Number ...'
	db	0
	db	'1. Y E S'
	db	0
	db	'2. N O'
	db	0
	db	'Please Select valid choice number.'
	db	0
	db	'                                  '
	db	0
	db	'Please Select valid choice number.'
	db	0
	db	'                                  '
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_s@	equ	s@
	$comm	@ios@basefield,near,4,1
	$comm	@ios@adjustfield,near,4,1
	$comm	@ios@floatfield,near,4,1
	$comm	@ios@stdioflush,near,2,1
	$comm	@ios@nextbit,near,4,1
	$comm	@ios@usercount,near,2,1
	$comm	@filebuf@openprot,near,2,1
	public	_choice
	public	_data
	public	_menu
	public	@line$qiizc
	extrn	_cprintf:near
	extrn	_textcolor:near
	public	@comp$qiii
	public	@border$qv
	extrn	_textbackground:near
	extrn	_gotoxy:near
	public	@title$qv
	public	@box$qiiii
	public	@boxi$qiiiii
	public	@getkey$qv
	extrn	@fstream@$bctr$qv:near
	extrn	@fstreambase@open$qpxzcii:near
	extrn	@istream@seekg$ql:near
	extrn	N_SCOPY@:near
	extrn	@istream@getline$qpzcizc:near
	extrn	_atol:near
	extrn	@fstreambase@close$qv:near
	extrn	@fstream@$bdtr$qv:near
	public	@putkey$qv
	extrn	_srand:near
	extrn	_time:near
	extrn	_rand:near
	extrn	N_LXMUL@:near
	extrn	N_LDIV@:near
	extrn	_strcpy:near
	extrn	_ecvt:near
	extrn	@ostream@write$qpxzci:near
	public	@encryption$qii
	extrn	@ostream@seekp$ql:near
	extrn	@istream@get$qrzc:near
	extrn	@ios@setstate$qi:near
	public	@authUSER$qpzc
	extrn	@istream@$brsh$qpzc:near
	extrn	_strncmp:near
	extrn	_strlen:near
	public	@addUser$qpzc
	public	@AUTHORIZE$qpzct1
	extrn	_strcmp:near
	public	@lic$qv
	extrn	__setcursortype:near
	public	@license$qi
	extrn	_clrscr:near
	extrn	_getch:near
	extrn	_delay:near
	public	@helpclear$qv
	public	@menuhelp$qv
	public	@abouthelp$qv
	public	@MENU$qv
	public	_main
	extrn	_window:near
	extrn	_fflush:near
	extrn	__streams:word
	extrn	_exit:near
	end
