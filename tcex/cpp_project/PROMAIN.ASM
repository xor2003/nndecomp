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
	?debug	S "c:\promain.cpp"
	?debug	C E93B58FE7C0E633A5C70726F6D61696E2E637070
	?debug	C E95337528114443A5C494E434C5544455C6673747265616D2E68
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
	?debug	C E95337528110443A5C494E434C5544455C6D656D2E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
	?debug	C E95337528113443A5C494E434C5544455C737472696E672E68
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
	jmp	short @1@122
@1@74:
   ;	
   ;			while(f.read((char *)&ob,sizeof(ob)))
   ;			{	if(ob.ret_id()==id)
   ;	
	mov	ax,word ptr [di+102]
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
   ;		}while(flag==1 || id==0);
   ;	
	cmp	word ptr [bp-4],1
	je	short @1@50
	cmp	word ptr [di+102],0
	je	short @1@50
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
	mov	ax,offset DGROUP:s@+7
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
	mov	ax,offset DGROUP:s@+18
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
	mov	ax,offset DGROUP:s@+35
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-90]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @2@98
@2@50:
   ;	
   ;		idc ob;
   ;		while(f.read((char *)&ob,sizeof(ob)))
   ;			if(ob.ret_id()==a)
   ;	
	mov	ax,word ptr [bp-6]
	cmp	ax,word ptr [bp-2]
	jne	short @2@98
   ;	
   ;			{	flag=1;
   ;	
	mov	word ptr [bp-4],1
   ;	
   ;				id=a;
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr [si+102],ax
	jmp	short @2@194
@2@98:
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
	je	short @2@146
	xor	ax,ax
	jmp	short @2@170
@2@146:
	mov	ax,di
@2@170:
	or	ax,ax
	jne	short @2@50
@2@194:
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
	jne	short @2@242
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
	mov	ax,offset DGROUP:s@+43
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			getch();
   ;	
	call	near ptr _getch
	jmp	@2@290
@2@242:
   ;	
   ;		}
   ;		else if(flag==1)
   ;	
	cmp	word ptr [bp-4],1
	je	@@0
	jmp	@2@290
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
	mov	ax,offset DGROUP:s@+62
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
	mov	ax,offset DGROUP:s@+73
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
	mov	ax,offset DGROUP:s@+103
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
	mov	ax,offset DGROUP:s@+111
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
	mov	ax,offset DGROUP:s@+127
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
	mov	ax,offset DGROUP:s@+134
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
	mov	ax,offset DGROUP:s@+145
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
	mov	ax,offset DGROUP:s@+158
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
	mov	ax,offset DGROUP:s@+166
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
	mov	ax,offset DGROUP:s@+189
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
@2@290:
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
   ;	
   ;	void main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,184
	push	si
	push	di
   ;	
   ;	{       int op=0;
   ;	
	mov	word ptr [bp-2],0
   ;	
   ;		login(op);
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	call	near ptr @login$qri
	pop	cx
   ;	
   ;		if(op==1)
   ;	
	cmp	word ptr [bp-2],1
	je	@@1
	jmp	@3@338
@@1:
@3@50:
   ;	
   ;		{	for(;;)
   ;			{	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;				mainmenu(op);
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	call	near ptr @mainmenu$qri
	pop	cx
   ;	
   ;				if(op==4)
   ;	
	cmp	word ptr [bp-2],4
	jne	short @3@122
	jmp	@3@338
	jmp	@3@314
@3@122:
   ;	
   ;					break;
   ;				else if(op==1)
   ;	
	cmp	word ptr [bp-2],1
	je	@@2
	jmp	@3@194
@@2:
   ;	
   ;				{	pas ob;
   ;					ob.create_ob();
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
	mov	ax,offset DGROUP:s@+195
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
	mov	ax,offset DGROUP:s@+206
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
	mov	ax,offset DGROUP:s@+236
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	lea	ax,word ptr [bp-106]
	push	ax
	call	near ptr _gets
	pop	cx
	mov	ax,10
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+244
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	lea	ax,word ptr [bp-56]
	push	ax
	call	near ptr _gets
	pop	cx
	mov	ax,11
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+260
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	lea	ax,word ptr [bp-6]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
	lea	ax,word ptr [bp-106]
	push	ax
	call	near ptr @pas@create_id$qv
	pop	cx
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
	mov	ax,offset DGROUP:s@+267
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
	mov	ax,offset DGROUP:s@+278
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
	mov	ax,offset DGROUP:s@+291
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	di,offset DGROUP:_cout
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-106]
	push	ax
	push	di
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
	mov	ax,offset DGROUP:s@+299
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	si,offset DGROUP:_cout
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-56]
	push	ax
	push	si
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,11
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-6]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+315
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
	mov	ax,word ptr [bp-4]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+322
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	ax,14
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+328
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	call	near ptr _getch
   ;	
   ;					ofstream f("infoc.dat",ios::binary|ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,136
	push	ax
	mov	ax,offset DGROUP:s@+354
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-184]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;					f.write((char *)&ob,sizeof(ob));
   ;	
	mov	ax,104
	push	ax
	lea	ax,word ptr [bp-106]
	push	ax
	lea	ax,word ptr [bp-144]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;					f.close();
   ;	
	lea	ax,word ptr [bp-184]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-184]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	short @3@314
@3@194:
   ;	
   ;				}
   ;				else if(op==5)
   ;	
	cmp	word ptr [bp-2],5
	jne	short @3@266
   ;	
   ;				{	emp ob;
   ;					ob.create_ob();
   ;	
	lea	ax,word ptr [bp-106]
	push	ax
	call	near ptr @emp@create_ob$qv
	pop	cx
   ;	
   ;					ofstream f("infoe.dat",ios::binary|ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,136
	push	ax
	mov	ax,offset DGROUP:s@+364
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-184]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;					f.write((char *)&ob,sizeof(ob));
   ;	
	mov	ax,104
	push	ax
	lea	ax,word ptr [bp-106]
	push	ax
	lea	ax,word ptr [bp-144]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;					f.close();
   ;	
	lea	ax,word ptr [bp-184]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-184]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	short @3@314
@3@266:
   ;	
   ;				}
   ;				else if(op==7)
   ;	
	cmp	word ptr [bp-2],7
	jne	short @3@314
   ;	
   ;					reserved();
   ;	
	call	near ptr @reserved$qv
@3@314:
	jmp	@3@50
@3@338:
   ;	
   ;			}
   ;		}
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
   ;	
   ;	void login(int &op)
   ;	
	assume	cs:_TEXT
@login$qri	proc	near
	push	bp
	mov	bp,sp
	sub	sp,50
   ;	
   ;	{       clrscr();
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
	mov	ax,offset DGROUP:s@+374
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
	mov	ax,offset DGROUP:s@+384
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
	mov	ax,offset DGROUP:s@+410
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
	mov	ax,offset DGROUP:s@+443
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
	mov	ax,offset DGROUP:s@+472
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		char p[50];
   ;		password(p);
   ;	
	lea	ax,word ptr [bp-50]
	push	ax
	call	near ptr @password$qpzc
	pop	cx
   ;	
   ;		if(strcmpi(p,"paras")==0)
   ;	
	mov	ax,offset DGROUP:s@+493
	push	ax
	lea	ax,word ptr [bp-50]
	push	ax
	call	near ptr _stricmp
	pop	cx
	pop	cx
	or	ax,ax
	jne	short @4@74
   ;	
   ;		{       op=1;
   ;	
	mov	bx,word ptr [bp+4]
	mov	word ptr [bx],1
   ;	
   ;			gotoxy(17,14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,17
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"PASSWORD CORRECT !!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+499
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(17,15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,17
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"LOGIN SUCCESSFULL !!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+519
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(17,16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,17
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"(press any key to continue)";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+540
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			getch();
   ;	
	call	near ptr _getch
	jmp	short @4@98
@4@74:
   ;	
   ;		}
   ;		else
   ;		{	gotoxy(17,14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,17
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"BETTER LUCK NEXT TIME !!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+568
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(17,15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,17
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"(press any key to continue)";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+593
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
@4@98:
   ;	
   ;		}
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
@login$qri	endp
   ;	
   ;	void mainmenu(int &op)
   ;	
	assume	cs:_TEXT
@mainmenu$qri	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	si,word ptr [bp+4]
@5@26:
   ;	
   ;	{	for(;;)
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
	mov	ax,offset DGROUP:s@+621
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
	mov	ax,offset DGROUP:s@+632
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
   ;			cout<<"- PASSENGER ZONE -";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+678
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
	mov	ax,offset DGROUP:s@+697
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
	mov	ax,offset DGROUP:s@+716
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
	mov	ax,offset DGROUP:s@+723
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
   ;			cout<<"-EXIT THE PROGRAM"; //op=4
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+741
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
   ;			cout<<"- EMPLOYEE ZONE -";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+759
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
   ;			cout<<"-CREATE AN ACCOUNT";   //op=5
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+777
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
   ;			cout<<"-LOGIN";   //op=6
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+796
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(45,15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,45
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-RESERVED ZONE";     //op=7
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+803
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			if(op==1)
   ;	
	cmp	word ptr [si],1
	jne	short @5@74
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
	jmp	short @5@362
@5@74:
   ;	
   ;			else if(op==2)
   ;	
	cmp	word ptr [si],2
	jne	short @5@122
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
	jmp	short @5@362
@5@122:
   ;	
   ;			else if(op==3)
   ;	
	cmp	word ptr [si],3
	jne	short @5@170
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
	jmp	short @5@362
@5@170:
   ;	
   ;			else if(op==4)
   ;	
	cmp	word ptr [si],4
	jne	short @5@218
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
	jmp	short @5@362
@5@218:
   ;	
   ;			else if(op==5)                  //77->      75<-
   ;	
	cmp	word ptr [si],5
	jne	short @5@266
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
	jmp	short @5@362
@5@266:
   ;	
   ;			else if(op==6)
   ;	
	cmp	word ptr [si],6
	jne	short @5@314
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
	jmp	short @5@362
@5@314:
   ;	
   ;			else if(op==7)
   ;	
	cmp	word ptr [si],7
	jne	short @5@362
   ;	
   ;				gotoxy(44,15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,44
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
@5@362:
   ;	
   ;			cout<<"->";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+818
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			int a=getch();
   ;	
	call	near ptr _getch
	mov	di,ax
   ;	
   ;			if(a==0)
   ;	
	or	di,di
	jne	short @5@962
   ;	
   ;			{	a=getch();
   ;	
	call	near ptr _getch
	mov	di,ax
   ;	
   ;				if(a==80 && op!=4 && op!=7)
   ;	
	cmp	di,80
	jne	short @5@506
	cmp	word ptr [si],4
	je	short @5@506
	cmp	word ptr [si],7
	je	short @5@506
   ;	
   ;					op++;
   ;	
	inc	word ptr [si]
	jmp	short @5@938
@5@506:
   ;	
   ;				else if(a==72 && op!=1 && op!=5)
   ;	
	cmp	di,72
	jne	short @5@602
	cmp	word ptr [si],1
	je	short @5@602
	cmp	word ptr [si],5
	je	short @5@602
   ;	
   ;					op--;
   ;	
	dec	word ptr [si]
	jmp	short @5@938
@5@602:
   ;	
   ;				else if(a==77 && (op==1 || op==2))
   ;	
	cmp	di,77
	jne	short @5@698
	cmp	word ptr [si],1
	je	short @5@674
	cmp	word ptr [si],2
	jne	short @5@698
@5@674:
   ;	
   ;					op+=4;
   ;	
	add	word ptr [si],4
	jmp	short @5@938
@5@698:
   ;	
   ;				else if(a==77 && op==4)
   ;	
	cmp	di,77
	jne	short @5@770
	cmp	word ptr [si],4
	jne	short @5@770
   ;	
   ;					op=7;
   ;	
	mov	word ptr [si],7
	jmp	short @5@938
@5@770:
   ;	
   ;				else if(a==75 && (op==5 || op==6))
   ;	
	cmp	di,75
	jne	short @5@866
	cmp	word ptr [si],5
	je	short @5@842
	cmp	word ptr [si],6
	jne	short @5@866
@5@842:
   ;	
   ;					op-=4;
   ;	
	sub	word ptr [si],4
	jmp	short @5@938
@5@866:
   ;	
   ;				else if(a==75 && op==7)
   ;	
	cmp	di,75
	jne	short @5@938
	cmp	word ptr [si],7
	jne	short @5@938
   ;	
   ;					op=4;
   ;	
	mov	word ptr [si],4
@5@938:
	jmp	short @5@1010
@5@962:
   ;	
   ;			}
   ;			else if(a==13)
   ;	
	cmp	di,13
	jne	short @5@1010
	jmp	short @5@1034
@5@1010:
	jmp	@5@26
@5@1034:
   ;	
   ;				break;
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@mainmenu$qri	endp
   ;	
   ;	void password(char p[50])
   ;	
	assume	cs:_TEXT
@password$qpzc	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{	for(int i=0;;)
   ;	
	xor	si,si
@6@50:
   ;	
   ;		{	char a=getch();
   ;	
	call	near ptr _getch
	mov	byte ptr [bp-1],al
   ;	
   ;			if(a==13)
   ;	
	cmp	byte ptr [bp-1],13
	jne	short @6@122
   ;	
   ;			{	p[i]='\0';
   ;	
	mov	bx,si
	mov	byte ptr [bx+di],0
	jmp	short @6@266
	jmp	short @6@242
@6@122:
   ;	
   ;				break;
   ;			}
   ;			else if(a=='\b' && i>0)
   ;	
	cmp	byte ptr [bp-1],8
	jne	short @6@194
	or	si,si
	jle	short @6@194
   ;	
   ;			{	cout<<"\b \b";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+821
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				i--;
   ;	
	dec	si
	jmp	short @6@242
@6@194:
   ;	
   ;			}
   ;			else if(a!='\b')
   ;	
	cmp	byte ptr [bp-1],8
	je	short @6@242
   ;	
   ;			{	p[i++]=a;
   ;	
	mov	bx,si
	inc	si
	mov	al,byte ptr [bp-1]
	mov	byte ptr [bx+di],al
   ;	
   ;				cout<<"*";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+825
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
@6@242:
	jmp	short @6@50
@6@266:
   ;	
   ;			}
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@password$qpzc	endp
   ;	
   ;	void reserved()
   ;	
	assume	cs:_TEXT
@reserved$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,216
	push	si
	push	di
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
	mov	ax,offset DGROUP:s@+827
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gotoxy(14,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"ENTER PASSWORD TO CONTINUE :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+838
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		char p[50];
   ;		password(p);
   ;	
	lea	ax,word ptr [bp-58]
	push	ax
	call	near ptr @password$qpzc
	pop	cx
   ;	
   ;		if(strcmpi(p,"irctc")!=0)
   ;	
	mov	ax,offset DGROUP:s@+867
	push	ax
	lea	ax,word ptr [bp-58]
	push	ax
	call	near ptr _stricmp
	pop	cx
	pop	cx
	or	ax,ax
	je	short @7@74
   ;	
   ;		{	gotoxy(14,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"INVALID PASSWORD !!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+873
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			getch();
   ;	
	call	near ptr _getch
	jmp	@7@530
@7@74:
   ;	
   ;		}
   ;		else
   ;		{       for(int o=1;;)
   ;	
	mov	word ptr [bp-2],1
@7@98:
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
	mov	ax,offset DGROUP:s@+893
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,7
	push	ax
	mov	ax,31
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+904
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(15,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,15
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				int o=1;
   ;	
	mov	di,1
   ;	
   ;				cout<<"-MAKE AN EMP'S ID";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+918
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				if(o==1)
   ;	
	cmp	di,1
	jne	short @7@170
   ;	
   ;					gotoxy(14,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
@7@170:
   ;	
   ;				cout<<"->";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+936
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				int a=getch();
   ;	
	call	near ptr _getch
	mov	si,ax
   ;	
   ;				if(a==13)
   ;	
	cmp	si,13
	jne	short @7@218
	jmp	short @7@242
@7@218:
	jmp	@7@98
@7@242:
   ;	
   ;					break;
   ;			}
   ;			if(o==1)
   ;	
	cmp	word ptr [bp-2],1
	je	@@3
	jmp	@7@530
@@3:
@7@266:
   ;	
   ;			{       int a,flag;
   ;				do
   ;				{       flag=0;
   ;	
	mov	word ptr [bp-4],0
   ;	
   ;					randomize();
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _time
	pop	cx
	push	ax
	call	near ptr _srand
	pop	cx
   ;	
   ;					a=random(89);
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
	mov	ax,89
	pop	cx
	pop	bx
	call	near ptr N_LXMUL@
	push	dx
	push	ax
	call	near ptr N_LDIV@
	mov	di,ax
   ;	
   ;					ifstream f("ide.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+939
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-216]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @7@362
@7@314:
   ;	
   ;					idc ob;
   ;					while(f.read((char *)&ob,sizeof(ob)))
   ;						if(ob.ret_id()==a)
   ;	
	cmp	word ptr [bp-8],di
	jne	short @7@362
   ;	
   ;						{	flag=1;
   ;	
	mov	word ptr [bp-4],1
	jmp	short @7@458
@7@362:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-8]
	push	ax
	lea	ax,word ptr [bp-176]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	si,word ptr [bx]
	test	word ptr [si+4],134
	je	short @7@410
	xor	ax,ax
	jmp	short @7@434
@7@410:
	mov	ax,si
@7@434:
	or	ax,ax
	jne	short @7@314
@7@458:
   ;	
   ;							break;
   ;						}
   ;					f.close();
   ;	
	lea	ax,word ptr [bp-216]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-216]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
   ;	
   ;				}while(flag==1);
   ;	
	cmp	word ptr [bp-4],1
	jne	@@4
	jmp	@7@266
@@4:
   ;	
   ;				a+=10;
   ;	
	add	di,10
   ;	
   ;				idc ob(a);
   ;	
	mov	word ptr [bp-6],di
   ;	
   ;				ofstream f("ide.dat",ios::binary|ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,136
	push	ax
	mov	ax,offset DGROUP:s@+947
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-136]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;				f.write((char *)&ob,sizeof(ob));
   ;	
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-6]
	push	ax
	lea	ax,word ptr [bp-96]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;				f.close();
   ;	
	lea	ax,word ptr [bp-136]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;				clrscr();
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
	mov	ax,offset DGROUP:s@+955
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,7
	push	ax
	mov	ax,31
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+966
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(14,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"ID CREATED!!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+980
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(14,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"ID No."<<a;
   ;	
	mov	ax,di
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+993
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
   ;				getch();
   ;	
	call	near ptr _getch
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-136]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
@7@530:
   ;	
   ;			}
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@reserved$qv	endp
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
	mov	ax,offset DGROUP:s@+1000
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
	db	'id.dat'
	db	0
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
	db	'PLEASE REMEBER YOUR ID !!'
	db	0
	db	'infoc.dat'
	db	0
	db	'infoe.dat'
	db	0
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
	db	'paras'
	db	0
	db	'PASSWORD CORRECT !!'
	db	0
	db	'LOGIN SUCCESSFULL !!'
	db	0
	db	'(press any key to continue)'
	db	0
	db	'BETTER LUCK NEXT TIME !!'
	db	0
	db	'(press any key to continue)'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'-------------------MENU----------------------'
	db	0
	db	'- PASSENGER ZONE -'
	db	0
	db	'-CREATE AN ACCOUNT'
	db	0
	db	'-LOGIN'
	db	0
	db	'-CHECK PNR STATUS'
	db	0
	db	'-EXIT THE PROGRAM'
	db	0
	db	'- EMPLOYEE ZONE -'
	db	0
	db	'-CREATE AN ACCOUNT'
	db	0
	db	'-LOGIN'
	db	0
	db	'-RESERVED ZONE'
	db	0
	db	'->'
	db	0
	db	8
	db	' '
	db	8
	db	0
	db	'*'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ENTER PASSWORD TO CONTINUE :'
	db	0
	db	'irctc'
	db	0
	db	'INVALID PASSWORD !!'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'RESERVED ZONE'
	db	0
	db	'-MAKE AN EMP'
	db	39
	db	'S ID'
	db	0
	db	'->'
	db	0
	db	'ide.dat'
	db	0
	db	'ide.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'RESERVED ZONE'
	db	0
	db	'ID CREATED!!'
	db	0
	db	'ID No.'
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
	public	@pas@create_id$qv
	extrn	@ifstream@$bctr$qpxzcii:near
	extrn	_srand:near
	extrn	_time:near
	extrn	_rand:near
	extrn	N_LXMUL@:near
	extrn	N_LDIV@:near
	extrn	@istream@read$qpzci:near
	extrn	@fstreambase@close$qv:near
	extrn	@ifstream@$bdtr$qv:near
	public	@emp@create_ob$qv
	extrn	_clrscr:near
	extrn	_gotoxy:near
	extrn	@ostream@outstr$qpxzct1:near
	extrn	_cout:word
	extrn	@istream@$brsh$qri:near
	extrn	_cin:word
	extrn	_getch:near
	extrn	_gets:near
	extrn	@ostream@$blsh$ql:near
	public	_main
	public	@login$qri
	public	@mainmenu$qri
	extrn	@ofstream@$bctr$qpxzcii:near
	extrn	@ostream@write$qpxzci:near
	extrn	@ofstream@$bdtr$qv:near
	public	@reserved$qv
	public	@password$qpzc
	extrn	_stricmp:near
	end
