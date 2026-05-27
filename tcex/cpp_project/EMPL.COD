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
	?debug	S "c:\empl.cpp"
	?debug	C E93B58FE7C0B633A5C656D706C2E637070
	?debug	C E95337528114443A5C494E434C5544455C6673747265616D2E68
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
	?debug	C E95337528110443A5C494E434C5544455C6D656D2E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
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
   ;	void emp::create_ob()
   ;	
	assume	cs:_TEXT
@emp@create_ob$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,90
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;		o2;
   ;	
	mov	ax,5
	push	ax
	mov	ax,32
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
   ;	
   ;		gotoxy(13,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"-ENTER YOUR ID :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+11
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		int a,flag=0;
   ;	
	mov	word ptr [bp-4],0
   ;	
   ;		cin>>a;
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;		ifstream f("ide.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+28
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-90]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @1@98
@1@50:
   ;	
   ;		idc ob;
   ;		while(f.read((char *)&ob,sizeof(ob)))
   ;			if(ob.ret_id()==a)
   ;	
	mov	ax,word ptr [bp-6]
	cmp	ax,word ptr [bp-2]
	jne	short @1@98
   ;	
   ;			{	flag=1;
   ;	
	mov	word ptr [bp-4],1
   ;	
   ;				id=a;
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr [si+102],ax
	jmp	short @1@194
@1@98:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-6]
	push	ax
	lea	ax,word ptr [bp-50]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	di,word ptr [bx]
	test	word ptr [di+4],134
	je	short @1@146
	xor	ax,ax
	jmp	short @1@170
@1@146:
	mov	ax,di
@1@170:
	or	ax,ax
	jne	short @1@50
@1@194:
   ;	
   ;				break;
   ;			}
   ;		f.close();
   ;	
	lea	ax,word ptr [bp-90]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;		if(flag==0)
   ;	
	cmp	word ptr [bp-4],0
	jne	short @1@242
   ;	
   ;		{	gotoxy(14,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"ERROR!! INVALID ID";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+36
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			getch();
   ;	
	call	near ptr _getch
	jmp	@1@290
@1@242:
   ;	
   ;		}
   ;		else if(flag==1)
   ;	
	cmp	word ptr [bp-4],1
	je	@@0
	jmp	@1@290
@@0:
   ;	
   ;		{	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			o2;
   ;	
	mov	ax,5
	push	ax
	mov	ax,32
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+55
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(14,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"ENTER THE FOLLOWING DETAILS -";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+66
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(13,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-NAME :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+96
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gets(na);
   ;	
	push	si
	call	near ptr _gets
	pop	cx
   ;	
   ;			gotoxy(13,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-HOME ADDRESS :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+104
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gets(had);
   ;	
	mov	ax,si
	add	ax,50
	push	ax
	call	near ptr _gets
	pop	cx
   ;	
   ;			gotoxy(13,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-AGE :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+120
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			cin>>age;
   ;	
	mov	ax,si
	add	ax,100
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;			show();
   ;	
	call	near ptr _clrscr
	mov	ax,5
	push	ax
	mov	ax,32
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+127
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+138
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,9
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+151
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-8],offset DGROUP:_cout
	xor	ax,ax
	push	ax
	push	si
	push	word ptr [bp-8]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,10
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+159
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-10],offset DGROUP:_cout
	xor	ax,ax
	push	ax
	mov	ax,si
	add	ax,50
	push	ax
	push	word ptr [bp-10]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,11
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	mov	ax,word ptr [si+100]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+175
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	ax,12
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	mov	ax,word ptr [si+102]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+182
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	call	near ptr _getch
@1@290:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-90]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@emp@create_ob$qv	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'I.R.C.T.C.'
	db	0
	db	'-ENTER YOUR ID :'
	db	0
	db	'ide.dat'
	db	0
	db	'ERROR!! INVALID ID'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ENTER THE FOLLOWING DETAILS -'
	db	0
	db	'-NAME :'
	db	0
	db	'-HOME ADDRESS :'
	db	0
	db	'-AGE :'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'DETAILS ARE-'
	db	0
	db	'-NAME :'
	db	0
	db	'-HOME ADDRESS :'
	db	0
	db	'-AGE :'
	db	0
	db	'-ID :'
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
	public	@emp@create_ob$qv
	extrn	_clrscr:near
	extrn	_gotoxy:near
	extrn	@ostream@outstr$qpxzct1:near
	extrn	_cout:word
	extrn	@istream@$brsh$qri:near
	extrn	_cin:word
	extrn	@ifstream@$bctr$qpxzcii:near
	extrn	@istream@read$qpzci:near
	extrn	@fstreambase@close$qv:near
	extrn	_getch:near
	extrn	_gets:near
	extrn	@ostream@$blsh$ql:near
	extrn	@ifstream@$bdtr$qv:near
	end
