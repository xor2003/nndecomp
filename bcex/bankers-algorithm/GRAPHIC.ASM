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
	?debug	S "c:\graphic.cpp"
	?debug	C E9EC54FE7C0E633A5C677261706869632E637070
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
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
   ;	void title(void)
   ;	
	assume	cs:_TEXT
@title$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		gotoxy(23, 2);
   ;	
	mov	ax,2
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		textcolor(YELLOW);
   ;	
	mov	ax,14
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;		cprintf("B a n k e r 's  A l g o r i t h m");
   ;	
	mov	ax,offset DGROUP:s@+9
	push	ax
	call	near ptr _cprintf
	pop	cx
   ;	
   ;		textcolor(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _textcolor
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
   ;		line(80, 0, (char)196);
   ;	
	mov	al,196
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,80
	push	ax
	call	near ptr @line$qiizc
	add	sp,6
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
   ;		line(80, 0, (char)196);
   ;	
	mov	al,196
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,80
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
   ;		textcolor(WHITE);
   ;	
	mov	ax,15
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
	jmp	short @3@98
@3@50:
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
	mov	ax,offset DGROUP:s@+43
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
	mov	ax,offset DGROUP:s@+46
	push	ax
	call	near ptr _cprintf
	pop	cx
	pop	cx
	inc	si
@3@98:
	cmp	si,word ptr [bp+8]
	jl	short @3@50
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
	mov	ax,offset DGROUP:s@+49
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
	mov	ax,offset DGROUP:s@+52
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
	mov	ax,offset DGROUP:s@+55
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
	mov	ax,offset DGROUP:s@+58
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
	db	'B a n k e r '
	db	39
	db	's  A l g o r i t h m'
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
	public	@line$qiizc
	extrn	_cprintf:near
	extrn	_textcolor:near
	public	@title$qv
	extrn	_gotoxy:near
	public	@box$qiiii
	end
