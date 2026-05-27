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
	?debug	S "c:\03.cpp"
	?debug	C E9B456FE7C09633A5C30332E637070
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
	?debug	C E95337528110443A5C494E434C5544455C6D656D2E68
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
   ;	main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
@1@26:
   ;	
   ;	{
   ;	int a, b;
   ;	char lagi;
   ;	atas:
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	cout<<"Masukan Bilangan = ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	cin>>a;
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;	b = a % 2;
   ;	
	mov	ax,word ptr [bp-2]
	mov	bx,2
	cwd	
	idiv	bx
	mov	si,dx
   ;	
   ;	printf("Nilai %d %% 2 adalah = %d",a, b);
   ;	
	push	si
	push	word ptr [bp-2]
	mov	ax,offset DGROUP:s@+20
	push	ax
	call	near ptr _printf
	add	sp,6
   ;	
   ;	printf("\n\nIngin Hitung Lagi [Y/T] : ");
   ;	
	mov	ax,offset DGROUP:s@+46
	push	ax
	call	near ptr _printf
	pop	cx
   ;	
   ;	lagi = getche();
   ;	
	call	near ptr _getche
	mov	byte ptr [bp-3],al
   ;	
   ;	if (lagi == 'Y' || lagi== 'y')
   ;	
	cmp	byte ptr [bp-3],89
	je	short @1@74
	cmp	byte ptr [bp-3],121
	jne	short @1@98
@1@74:
   ;	
   ;	goto atas ;
   ;	
	jmp	short @1@26
@1@98:
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_main	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'Masukan Bilangan = '
	db	0
	db	'Nilai %d %% 2 adalah = %d'
	db	0
	db	10
	db	10
	db	'Ingin Hitung Lagi [Y/T] : '
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
	extrn	@ostream@outstr$qpxzct1:near
	extrn	_cout:word
	extrn	@istream@$brsh$qri:near
	extrn	_cin:word
	extrn	_printf:near
	extrn	_getche:near
	extrn	_getch:near
	end
