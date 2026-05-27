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
	?debug	S "c:\mainmenu.cpp"
	?debug	C E93B58FE7C0F633A5C6D61696E6D656E752E637070
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
	dec	sp
	dec	sp
	push	si
	push	di
   ;	
   ;	{       int op=1;
   ;	
	mov	si,1
@1@50:
   ;	
   ;		for(;;)
   ;		{	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			o1;
   ;	
	mov	ax,1
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
	mov	ax,2
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
	mov	ax,3
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
   ;			gotoxy(15,6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,15
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-------------------MENU----------------------";
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
   ;			gotoxy(14,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-PASSENGER ZONE -";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+115
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(14,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-CREATE AN ACCOUNT";   //op=1
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+133
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(14,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-LOGIN";//op=2
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+152
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(14,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-CHECK PNR STATUS"; //op=3
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+159
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(45,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,45
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-EMPLOYEE ZONE -";  //
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+177
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(45,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,45
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-CREATE AN ACCOUNT";   //op=4
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+194
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(45,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,45
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-LOGIN";   //op=5
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+213
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(14,15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-EXIT THE PROGRAM"; //op=6
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+220
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			if(op==1)
   ;	
	cmp	si,1
	jne	short @1@98
   ;	
   ;				gotoxy(13,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @1@338
@1@98:
   ;	
   ;			else if(op==2)
   ;	
	cmp	si,2
	jne	short @1@146
   ;	
   ;				gotoxy(13,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @1@338
@1@146:
   ;	
   ;			else if(op==3)
   ;	
	cmp	si,3
	jne	short @1@194
   ;	
   ;				gotoxy(13,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @1@338
@1@194:
   ;	
   ;			else if(op==4)
   ;	
	cmp	si,4
	jne	short @1@242
   ;	
   ;				gotoxy(44,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,44
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @1@338
@1@242:
   ;	
   ;			else if(op==5)
   ;	
	cmp	si,5
	jne	short @1@290
   ;	
   ;				gotoxy(44,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,44
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @1@338
@1@290:
   ;	
   ;			else if(op==6)
   ;	
	cmp	si,6
	jne	short @1@338
   ;	
   ;				gotoxy(13,15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
@1@338:
   ;	
   ;			cout<<"->";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+238
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			int a=getch();
   ;	
	call	near ptr _getch
	mov	word ptr [bp-2],ax
   ;	
   ;			if(a==0)
   ;	
	cmp	word ptr [bp-2],0
	je	@@0
	jmp	@1@1034
@@0:
   ;	
   ;			{       int b=getch();
   ;	
	call	near ptr _getch
	mov	di,ax
   ;	
   ;				if(b==80 && op!=3 && op!=6)
   ;	
	cmp	di,80
	jne	short @1@482
	cmp	si,3
	je	short @1@482
	cmp	si,6
	je	short @1@482
   ;	
   ;					op++;
   ;	
	inc	si
	jmp	short @1@1010
@1@482:
   ;	
   ;				else if(b==80 && op==3)
   ;	
	cmp	di,80
	jne	short @1@554
	cmp	si,3
	jne	short @1@554
   ;	
   ;					op=6;
   ;	
	mov	si,6
	jmp	short @1@1010
@1@554:
   ;	
   ;				else if(b==77 && (op==1 || op==2))
   ;	
	cmp	di,77
	jne	short @1@650
	cmp	si,1
	je	short @1@626
	cmp	si,2
	jne	short @1@650
@1@626:
   ;	
   ;					op+=3;
   ;	
	add	si,3
	jmp	short @1@1010
@1@650:
   ;	
   ;				else if(b==77 && op==3)
   ;	
	cmp	di,77
	jne	short @1@722
	cmp	si,3
	jne	short @1@722
   ;	
   ;					op=5;
   ;	
	mov	si,5
	jmp	short @1@1010
@1@722:
   ;	
   ;				else if(b==72 && (op==2 || op==3 || op==5))
   ;	
	cmp	di,72
	jne	short @1@842
	cmp	si,2
	je	short @1@818
	cmp	si,3
	je	short @1@818
	cmp	si,5
	jne	short @1@842
@1@818:
   ;	
   ;					op--;
   ;	
	dec	si
	jmp	short @1@1010
@1@842:
   ;	
   ;				else if(b==72 && op==6)
   ;	
	cmp	di,72
	jne	short @1@914
	cmp	si,6
	jne	short @1@914
   ;	
   ;					op=3;
   ;	
	mov	si,3
	jmp	short @1@1010
@1@914:
   ;	
   ;				else if(b==75 && (op==4 || op==5))
   ;	
	cmp	di,75
	jne	short @1@1010
	cmp	si,4
	je	short @1@986
	cmp	si,5
	jne	short @1@1010
@1@986:
   ;	
   ;					op-=3;
   ;	
	sub	si,3
@1@1010:
	jmp	short @1@1082
@1@1034:
   ;	
   ;			}
   ;			else if(a==13)
   ;	
	cmp	word ptr [bp-2],13
	jne	short @1@1082
	jmp	short @1@1106
@1@1082:
	jmp	@1@50
@1@1106:
   ;	
   ;				break;
   ;		}
   ;		clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;		cout<<op;
   ;	
	mov	ax,si
	cwd	
	push	dx
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
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
	db	'-------------------MENU----------------------'
	db	0
	db	'-PASSENGER ZONE -'
	db	0
	db	'-CREATE AN ACCOUNT'
	db	0
	db	'-LOGIN'
	db	0
	db	'-CHECK PNR STATUS'
	db	0
	db	'-EMPLOYEE ZONE -'
	db	0
	db	'-CREATE AN ACCOUNT'
	db	0
	db	'-LOGIN'
	db	0
	db	'-EXIT THE PROGRAM'
	db	0
	db	'->'
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
	extrn	@ostream@$blsh$ql:near
	end
