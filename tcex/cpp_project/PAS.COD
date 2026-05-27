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
	?debug	S "c:\pas.cpp"
	?debug	C E93B58FE7C0A633A5C7061732E637070
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
	?debug	C E95337528110443A5C494E434C5544455C6D656D2E68
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
   ;	void main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,52
	push	si
	push	di
   ;	
   ;	{	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;		clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;		o1;
   ;	
	mov	ax,5
	push	ax
	mov	ax,31
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,6
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+10
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,7
	push	ax
	mov	ax,22
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+36
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gotoxy(17,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,17
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"ENTER PASSWORD TO CONTINUE -";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+69
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gotoxy(17,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,17
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"ENTER THE PASSWORD :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+98
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		char p[50];
   ;		for(int i=0;;)
   ;	
	xor	si,si
@1@50:
   ;	
   ;		{	char a=getch();
   ;	
	call	near ptr _getch
	mov	byte ptr [bp-1],al
   ;	
   ;			if(a==13)
   ;	
	cmp	byte ptr [bp-1],13
	jne	short @1@122
   ;	
   ;			{	p[i]='\0';
   ;	
	mov	byte ptr [bp+si-52],0
	jmp	short @1@266
	jmp	short @1@242
@1@122:
   ;	
   ;				break;
   ;			}
   ;			else if(a=='\b' && i>0)
   ;	
	cmp	byte ptr [bp-1],8
	jne	short @1@194
	or	si,si
	jle	short @1@194
   ;	
   ;			{	cout<<"\b \b";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+119
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				i--;
   ;	
	dec	si
	jmp	short @1@242
@1@194:
   ;	
   ;			}
   ;			else if(a!='\b')
   ;	
	cmp	byte ptr [bp-1],8
	je	short @1@242
   ;	
   ;			{	p[i++]=a;
   ;	
	lea	bx,word ptr [bp-52]
	mov	ax,si
	inc	si
	add	bx,ax
	mov	al,byte ptr [bp-1]
	mov	byte ptr [bx],al
   ;	
   ;				cout<<a;
   ;	
	mov	al,byte ptr [bp-1]
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$qzc
	pop	cx
	pop	cx
@1@242:
	jmp	short @1@50
@1@266:
   ;	
   ;			}
   ;		}
   ;		cout<<endl<<p;
   ;	
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @endl$qr7ostream
	pop	cx
	mov	di,ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-52]
	push	ax
	push	di
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		getch();
   ;	
	call	near ptr _getch
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_main	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'I.R.C.T.C'
	db	0
	db	'(INDIAN RAILWAY CATERING '
	db	0
	db	'AND TOURISM CORPORATION LIMITED)'
	db	0
	db	'ENTER PASSWORD TO CONTINUE -'
	db	0
	db	'ENTER THE PASSWORD :'
	db	0
	db	8
	db	' '
	db	8
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
	public	_main
	extrn	_clrscr:near
	extrn	_gotoxy:near
	extrn	@ostream@outstr$qpxzct1:near
	extrn	_cout:word
	extrn	_getch:near
	extrn	@ostream@$blsh$qzc:near
	extrn	@endl$qr7ostream:near
	end
