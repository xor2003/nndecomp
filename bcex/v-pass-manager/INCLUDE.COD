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
	?debug	S "c:\include.cpp"
	?debug	C E9D055FE7C0E633A5C696E636C7564652E637070
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
	end
