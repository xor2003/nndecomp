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
	?debug	S "c:\cmain.cpp"
	?debug	C E93B58FE7C0C633A5C636D61696E2E637070
	?debug	C E95337528114443A5C494E434C5544455C6673747265616D2E68
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
	?debug	C E95337528110443A5C494E434C5544455C6D656D2E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
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
   ;	void tic::create_pnr()
   ;	
	assume	cs:_TEXT
@tic@create_pnr$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,84
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{	ifstream f("pnr.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-84]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
@1@50:
   ;	
   ;		pnrc ob;
   ;		int flag;
   ;		do
   ;		{       flag=0;
   ;	
	mov	word ptr [bp-4],0
   ;	
   ;			randomize();
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _time
	pop	cx
	push	ax
	call	near ptr _srand
	pop	cx
   ;	
   ;			pnr=random(10000);
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
	mov	ax,10000
	pop	cx
	pop	bx
	call	near ptr N_LXMUL@
	push	dx
	push	ax
	call	near ptr N_LDIV@
	mov	word ptr [di+58],ax
	jmp	short @1@122
@1@74:
   ;	
   ;			while(f.read((char *)&ob,sizeof(ob)))
   ;			{	if(ob.ret_pnr()==pnr)
   ;	
	mov	ax,word ptr [di+58]
	cmp	ax,word ptr [bp-2]
	jne	short @1@122
   ;	
   ;				{	flag=1;
   ;	
	mov	word ptr [bp-4],1
	jmp	short @1@218
@1@122:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-2]
	push	ax
	lea	ax,word ptr [bp-44]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	si,word ptr [bx]
	test	word ptr [si+4],134
	je	short @1@170
	xor	ax,ax
	jmp	short @1@194
@1@170:
	mov	ax,si
@1@194:
	or	ax,ax
	jne	short @1@74
@1@218:
   ;	
   ;					break;
   ;				}
   ;			}
   ;		}while(flag==1 || pnr<=999);
   ;	
	cmp	word ptr [bp-4],1
	je	short @1@50
	cmp	word ptr [di+58],999
	jle	short @1@50
   ;	
   ;		f.close();
   ;	
	lea	ax,word ptr [bp-84]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;		enter_pnr();
   ;	
	push	di
	call	near ptr @@tic@enter_pnr$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-84]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
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
@tic@create_pnr$qv	endp
   ;	
   ;	void pas::create_id()
   ;	
	assume	cs:_TEXT
@pas@create_id$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,84
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{	ifstream f("id.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+8
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-84]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
@2@50:
   ;	
   ;		idc ob;
   ;		int flag;
   ;		do
   ;		{       flag=0;
   ;	
	mov	word ptr [bp-4],0
   ;	
   ;			randomize();
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _time
	pop	cx
	push	ax
	call	near ptr _srand
	pop	cx
   ;	
   ;			id=random(100);
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
	mov	word ptr [di+102],ax
	jmp	short @2@122
@2@74:
   ;	
   ;			while(f.read((char *)&ob,sizeof(ob)))
   ;			{	if(ob.ret_id()==id)
   ;	
	mov	ax,word ptr [di+102]
	cmp	ax,word ptr [bp-2]
	jne	short @2@122
   ;	
   ;				{	flag=1;
   ;	
	mov	word ptr [bp-4],1
	jmp	short @2@218
@2@122:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-2]
	push	ax
	lea	ax,word ptr [bp-44]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	si,word ptr [bx]
	test	word ptr [si+4],134
	je	short @2@170
	xor	ax,ax
	jmp	short @2@194
@2@170:
	mov	ax,si
@2@194:
	or	ax,ax
	jne	short @2@74
@2@218:
   ;	
   ;					break;
   ;				}
   ;			}
   ;		}while(flag==1 || id==0);
   ;	
	cmp	word ptr [bp-4],1
	je	short @2@50
	cmp	word ptr [di+102],0
	je	short @2@50
   ;	
   ;		f.close();
   ;	
	lea	ax,word ptr [bp-84]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;		enter_id();
   ;	
	push	di
	call	near ptr @@pas@enter_id$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-84]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
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
@pas@create_id$qv	endp
   ;	
   ;	int pas_login()
   ;	
	assume	cs:_TEXT
@pas_login$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,86
	push	si
	push	di
   ;	
   ;	{       int l;
   ;		clrscr();
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
	mov	ax,offset DGROUP:s@+15
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gotoxy(13,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"-ENTER ID :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+26
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		cin>>l;
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;		ifstream f("id.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+38
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @3@98
@3@50:
   ;	
   ;		idc o;
   ;		while(f.read((char *)&o,sizeof(o)))
   ;			if(o.ret_id()==l)
   ;	
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-2]
	jne	short @3@98
   ;	
   ;				return l;
   ;	
	mov	di,word ptr [bp-2]
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,di
	jmp	short @3@218
@3@98:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-4]
	push	ax
	lea	ax,word ptr [bp-46]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	si,word ptr [bx]
	test	word ptr [si+4],134
	je	short @3@146
	xor	ax,ax
	jmp	short @3@170
@3@146:
	mov	ax,si
@3@170:
	or	ax,ax
	jne	short @3@50
   ;	
   ;		gotoxy(14,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"ERROR INCORRECT ID!!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+45
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		getch();
   ;	
	call	near ptr _getch
   ;	
   ;		return 0;
   ;	
	mov	word ptr [bp-6],0
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-6]
	jmp	short @3@218
@3@218:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@pas_login$qv	endp
   ;	
   ;	void pas_main()
   ;	
	assume	cs:_TEXT
@pas_main$qv	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
   ;	
   ;	{	int id=pas_login();
   ;	
	call	near ptr @pas_login$qv
	mov	word ptr [bp-2],ax
   ;	
   ;		if(id!=0)
   ;	
	cmp	word ptr [bp-2],0
	jne	@@0
	jmp	@4@554
@@0:
   ;	
   ;		{	for(int a=1;;)
   ;	
	mov	si,1
@4@74:
   ;	
   ;			{	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;				o3;
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
	mov	ax,offset DGROUP:s@+66
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,7
	push	ax
	mov	ax,47
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-2]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+77
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
   ;	
   ;				gotoxy(32,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,32
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"MENU";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+82
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(13,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"-BOOK A TICKET";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+87
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
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
   ;	
   ;				cout<<"-VIEW BOOKED TICKETS";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+102
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
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
   ;	
   ;				cout<<"-CHECK PNR STATUS";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+123
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
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
   ;	
   ;				cout<<"-EXIT";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+141
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				if(a==1)
   ;	
	cmp	si,1
	jne	short @4@122
   ;	
   ;					gotoxy(12,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @4@266
@4@122:
   ;	
   ;				else if(a==2)
   ;	
	cmp	si,2
	jne	short @4@170
   ;	
   ;					gotoxy(12,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @4@266
@4@170:
   ;	
   ;				else if(a==3)
   ;	
	cmp	si,3
	jne	short @4@218
   ;	
   ;					gotoxy(12,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @4@266
@4@218:
   ;	
   ;				else if(a==4)
   ;	
	cmp	si,4
	jne	short @4@266
   ;	
   ;					gotoxy(12,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
@4@266:
   ;	
   ;				cout<<"->";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+147
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				int b=getch();
   ;	
	call	near ptr _getch
	mov	di,ax
   ;	
   ;				if(b==13)
   ;	
	cmp	di,13
	jne	short @4@362
	jmp	short @4@554
	jmp	short @4@530
@4@362:
   ;	
   ;					break;
   ;				else if(b==0)
   ;	
	or	di,di
	jne	short @4@530
   ;	
   ;				{	b=getch();
   ;	
	call	near ptr _getch
	mov	di,ax
   ;	
   ;					if(b==80 && a!=4)
   ;	
	cmp	di,80
	jne	short @4@458
	cmp	si,4
	je	short @4@458
   ;	
   ;						a++;
   ;	
	inc	si
	jmp	short @4@530
@4@458:
   ;	
   ;					else if(b==72 && a!=1)
   ;	
	cmp	di,72
	jne	short @4@530
	cmp	si,1
	je	short @4@530
   ;	
   ;						a--;
   ;	
	dec	si
@4@530:
	jmp	@4@74
@4@554:
   ;	
   ;				}
   ;			}
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@pas_main$qv	endp
_TEXT	ends
_TEXT	segment byte public 'CODE'
@tic@enter_pnr$qv	segment	virtual
	assume	cs:_TEXT
@@tic@enter_pnr$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,80
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,136
	push	ax
	mov	ax,offset DGROUP:s@+150
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-80]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
	mov	bx,word ptr [bp+4]
	mov	ax,word ptr [bx+58]
	mov	word ptr [bp-2],ax
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-2]
	push	ax
	lea	ax,word ptr [bp-40]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
	lea	ax,word ptr [bp-80]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-80]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	sp,bp
	pop	bp
	ret	
@@tic@enter_pnr$qv	endp
@tic@enter_pnr$qv	ends
_TEXT	ends
_TEXT	segment byte public 'CODE'
@pas@enter_id$qv	segment	virtual
	assume	cs:_TEXT
@@pas@enter_id$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,80
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,136
	push	ax
	mov	ax,offset DGROUP:s@+158
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-80]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
	mov	bx,word ptr [bp+4]
	mov	ax,word ptr [bx+102]
	mov	word ptr [bp-2],ax
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-2]
	push	ax
	lea	ax,word ptr [bp-40]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
	lea	ax,word ptr [bp-80]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-80]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	sp,bp
	pop	bp
	ret	
@@pas@enter_id$qv	endp
	?debug	C E9
@pas@enter_id$qv	ends
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'pnr.dat'
	db	0
	db	'id.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'-ENTER ID :'
	db	0
	db	'id.dat'
	db	0
	db	'ERROR INCORRECT ID!!'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'MENU'
	db	0
	db	'-BOOK A TICKET'
	db	0
	db	'-VIEW BOOKED TICKETS'
	db	0
	db	'-CHECK PNR STATUS'
	db	0
	db	'-EXIT'
	db	0
	db	'->'
	db	0
	db	'pnr.dat'
	db	0
	db	'id.dat'
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
@pas@enter_id$qv	segment	virtual
@pas@enter_id$qv	ends
_TEXT	ends
_s@	equ	s@
	$comm	@ios@basefield,near,4,1
	$comm	@ios@adjustfield,near,4,1
	$comm	@ios@floatfield,near,4,1
	$comm	@ios@stdioflush,near,2,1
	$comm	@ios@nextbit,near,4,1
	$comm	@ios@usercount,near,2,1
	$comm	@filebuf@openprot,near,2,1
	public	@tic@create_pnr$qv
	extrn	@ifstream@$bctr$qpxzcii:near
	extrn	_srand:near
	extrn	_time:near
	extrn	_rand:near
	extrn	N_LXMUL@:near
	extrn	N_LDIV@:near
	extrn	@istream@read$qpzci:near
	extrn	@fstreambase@close$qv:near
	extrn	@ifstream@$bdtr$qv:near
	public	@pas@create_id$qv
	public	@pas_login$qv
	extrn	_clrscr:near
	extrn	_gotoxy:near
	extrn	@ostream@outstr$qpxzct1:near
	extrn	_cout:word
	extrn	@istream@$brsh$qri:near
	extrn	_cin:word
	extrn	_getch:near
	public	@pas_main$qv
	extrn	@ostream@$blsh$ql:near
	extrn	@ofstream@$bctr$qpxzcii:near
	extrn	@ostream@write$qpxzci:near
	extrn	@ofstream@$bdtr$qv:near
	end
