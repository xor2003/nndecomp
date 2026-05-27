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
	?debug	S "c:\atp3.cpp"
	?debug	C E93B58FE7C0B633A5C617470332E637070
	?debug	C E95337528114443A5C494E434C5544455C6673747265616D2E68
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
	?debug	C E95337528110443A5C494E434C5544455C6D656D2E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
	?debug	C E95337528113443A5C494E434C5544455C737472696E672E68
	?debug	C E95337528114443A5C494E434C5544455C696F6D616E69702E68
	?debug	C E95337528114443A5C494E434C5544455C67656E657269632E68
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
	mov	ax,offset DGROUP:s@+7
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
	mov	ax,offset DGROUP:s@+18
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
	mov	ax,offset DGROUP:s@+30
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @2@98
@2@50:
   ;	
   ;		idc o;
   ;		while(f.read((char *)&o,sizeof(o)))
   ;			if(o.ret_id()==l)
   ;	
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-2]
	jne	short @2@98
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
	jmp	short @2@218
@2@98:
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
	je	short @2@146
	xor	ax,ax
	jmp	short @2@170
@2@146:
	mov	ax,si
@2@170:
	or	ax,ax
	jne	short @2@50
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
	mov	ax,offset DGROUP:s@+37
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
	jmp	short @2@218
@2@218:
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
   ;	void booktic(int id)
   ;	
	assume	cs:_TEXT
@booktic$qi	proc	near
	push	bp
	mov	bp,sp
	sub	sp,354
	push	si
	push	di
   ;	
   ;	{	int st1=1,st2=1,flag=0,i=0;
   ;	
	mov	word ptr [bp-2],1
	mov	word ptr [bp-4],1
	mov	word ptr [bp-6],0
	xor	di,di
@3@50:
   ;	
   ;		for(;;)
   ;		{	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			int j=12;
   ;	
	mov	word ptr [bp-12],12
   ;	
   ;			i=0;
   ;	
	xor	di,di
   ;	
   ;			o4;
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+58
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-120]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	@3@146
@3@98:
	inc	di
	mov	ax,word ptr [bp-172]
	mov	word ptr [bp-16],ax
	lea	ax,word ptr [bp-170]
	push	ax
	lea	ax,word ptr [bp-222]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
	mov	ax,di
	add	ax,8
	push	ax
	mov	ax,word ptr [bp-12]
	inc	ax
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-16]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+68
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-24],offset DGROUP:_cout
	xor	ax,ax
	mov	dx,2
	push	ax
	push	dx
	push	ds
	lea	ax,word ptr [bp-22]
	push	ax
	call	near ptr @setiosflags$ql
	add	sp,8
	lea	ax,word ptr [bp-22]
	mov	word ptr [bp-26],ax
	mov	bx,word ptr [bp-26]
	push	word ptr [bx+4]
	push	word ptr [bx+2]
	mov	bx,word ptr [bp-24]
	push	word ptr [bx]
	mov	bx,word ptr [bp-26]
	call	word ptr [bx]
	add	sp,6
	mov	ax,word ptr [bp-24]
	mov	word ptr [bp-32],ax
	mov	ax,10
	push	ax
	push	ds
	lea	ax,word ptr [bp-30]
	push	ax
	call	near ptr @setw$qi
	add	sp,6
	lea	ax,word ptr [bp-30]
	mov	word ptr [bp-34],ax
	mov	bx,word ptr [bp-34]
	push	word ptr [bx+2]
	mov	bx,word ptr [bp-32]
	push	word ptr [bx]
	mov	bx,word ptr [bp-34]
	call	word ptr [bx]
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-32]
	mov	word ptr [bp-36],ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-222]
	push	ax
	push	word ptr [bp-36]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	push	word ptr [bp-36]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
@3@146:
	mov	ax,52
	push	ax
	lea	ax,word ptr [bp-172]
	push	ax
	lea	ax,word ptr [bp-80]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-14],ax
	mov	bx,word ptr [bp-14]
	test	word ptr [bx+4],134
	je	short @3@194
	xor	ax,ax
	jmp	short @3@218
@3@194:
	mov	ax,word ptr [bp-14]
@3@218:
	or	ax,ax
	je	@@0
	jmp	@3@98
@@0:
	lea	ax,word ptr [bp-120]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;			if(i==0)
   ;	
	or	di,di
	je	@@1
	jmp	@3@290
@@1:
   ;	
   ;			{	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;				o3;
   ;	
	mov	ax,3
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+70
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,4
	push	ax
	mov	ax,43
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	mov	ax,word ptr [bp+4]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+81
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
   ;				cout<<"ERROR!! NO TRAINS FOUND";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+86
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				getch();
   ;	
	call	near ptr _getch
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-120]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	@3@1298
@3@290:
   ;	
   ;				break;
   ;			}
   ;			o3;
   ;	
	mov	ax,3
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+110
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,4
	push	ax
	mov	ax,43
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	mov	ax,word ptr [bp+4]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+121
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
   ;			gotoxy(14,6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"FROM STATION :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+126
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
   ;			cout<<"NAME";
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
   ;			gotoxy(24,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"NO.";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+146
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			for(int k=1;k<=i;k++)
   ;	
	mov	si,1
	jmp	short @3@386
@3@314:
   ;	
   ;				if(st1==k)
   ;	
	cmp	word ptr [bp-2],si
	jne	short @3@362
   ;	
   ;				{	gotoxy(j,8+k);
   ;	
	mov	ax,si
	add	ax,8
	push	ax
	push	word ptr [bp-12]
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @3@410
@3@362:
	inc	si
@3@386:
	cmp	si,di
	jle	short @3@314
@3@410:
   ;	
   ;					break;
   ;				}
   ;			cout<<"->";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+150
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			if(flag==1)
   ;	
	cmp	word ptr [bp-6],1
	je	@@2
	jmp	@3@1034
@@2:
   ;	
   ;			{       j=41;
   ;	
	mov	word ptr [bp-12],41
   ;	
   ;				i=0;
   ;	
	xor	di,di
   ;	
   ;				gotoxy(43,6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,43
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"TO STATION :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+153
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(43,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,43
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"NAME";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+166
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(53,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,53
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"NO.";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+171
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				o4;
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+175
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-252]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	@3@530
@3@482:
	inc	di
	mov	ax,word ptr [bp-304]
	mov	word ptr [bp-20],ax
	lea	ax,word ptr [bp-302]
	push	ax
	lea	ax,word ptr [bp-354]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
	mov	ax,di
	add	ax,8
	push	ax
	mov	ax,word ptr [bp-12]
	inc	ax
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-20]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+185
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-28],offset DGROUP:_cout
	xor	ax,ax
	mov	dx,2
	push	ax
	push	dx
	push	ds
	lea	ax,word ptr [bp-26]
	push	ax
	call	near ptr @setiosflags$ql
	add	sp,8
	lea	ax,word ptr [bp-26]
	mov	word ptr [bp-30],ax
	mov	bx,word ptr [bp-30]
	push	word ptr [bx+4]
	push	word ptr [bx+2]
	mov	bx,word ptr [bp-28]
	push	word ptr [bx]
	mov	bx,word ptr [bp-30]
	call	word ptr [bx]
	add	sp,6
	mov	ax,word ptr [bp-28]
	mov	word ptr [bp-36],ax
	mov	ax,10
	push	ax
	push	ds
	lea	ax,word ptr [bp-34]
	push	ax
	call	near ptr @setw$qi
	add	sp,6
	lea	ax,word ptr [bp-34]
	mov	word ptr [bp-38],ax
	mov	bx,word ptr [bp-38]
	push	word ptr [bx+2]
	mov	bx,word ptr [bp-36]
	push	word ptr [bx]
	mov	bx,word ptr [bp-38]
	call	word ptr [bx]
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-36]
	mov	word ptr [bp-40],ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-354]
	push	ax
	push	word ptr [bp-40]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	push	word ptr [bp-40]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
@3@530:
	mov	ax,52
	push	ax
	lea	ax,word ptr [bp-304]
	push	ax
	lea	ax,word ptr [bp-212]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-16],ax
	mov	bx,word ptr [bp-16]
	test	word ptr [bx+4],134
	je	short @3@578
	xor	ax,ax
	jmp	short @3@602
@3@578:
	mov	ax,word ptr [bp-16]
@3@602:
	or	ax,ax
	je	@@3
	jmp	@3@482
@@3:
	lea	ax,word ptr [bp-252]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;				for(k=1;k<=i;k++)
   ;	
	mov	si,1
	jmp	short @3@722
@3@650:
   ;	
   ;					if(st2==k)
   ;	
	cmp	word ptr [bp-4],si
	jne	short @3@698
   ;	
   ;					{	gotoxy(j,8+k);
   ;	
	mov	ax,si
	add	ax,8
	push	ax
	push	word ptr [bp-12]
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @3@746
@3@698:
	inc	si
@3@722:
	cmp	si,di
	jle	short @3@650
@3@746:
   ;	
   ;						break;
   ;					}
   ;				cout<<"->";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+187
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				int a=getch();
   ;	
	call	near ptr _getch
	mov	word ptr [bp-18],ax
   ;	
   ;				if(a==13)
   ;	
	cmp	word ptr [bp-18],13
	jne	short @3@818
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-252]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-120]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	@3@1298
	jmp	short @3@986
@3@818:
   ;	
   ;					break;
   ;				else if(a==0)
   ;	
	cmp	word ptr [bp-18],0
	jne	short @3@986
   ;	
   ;				{	a=getch();
   ;	
	call	near ptr _getch
	mov	word ptr [bp-18],ax
   ;	
   ;					if(a==80 && st2!=i)
   ;	
	cmp	word ptr [bp-18],80
	jne	short @3@914
	cmp	word ptr [bp-4],di
	je	short @3@914
   ;	
   ;					st2++;
   ;	
	inc	word ptr [bp-4]
	jmp	short @3@986
@3@914:
   ;	
   ;					else if(a==72 && st2!=1)
   ;	
	cmp	word ptr [bp-18],72
	jne	short @3@986
	cmp	word ptr [bp-4],1
	je	short @3@986
   ;	
   ;					st2--;
   ;	
	dec	word ptr [bp-4]
@3@986:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-252]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	short @3@1250
@3@1034:
   ;	
   ;				}
   ;			}
   ;			else
   ;			{	int a=getch();
   ;	
	call	near ptr _getch
	mov	word ptr [bp-16],ax
   ;	
   ;				if(a==13)
   ;	
	cmp	word ptr [bp-16],13
	jne	short @3@1082
   ;	
   ;					flag=1;
   ;	
	mov	word ptr [bp-6],1
	jmp	short @3@1250
@3@1082:
   ;	
   ;				else if(a==0)
   ;	
	cmp	word ptr [bp-16],0
	jne	short @3@1250
   ;	
   ;				{	a=getch();
   ;	
	call	near ptr _getch
	mov	word ptr [bp-16],ax
   ;	
   ;					if(a==80 && st1!=i)
   ;	
	cmp	word ptr [bp-16],80
	jne	short @3@1178
	cmp	word ptr [bp-2],di
	je	short @3@1178
   ;	
   ;						st1++;
   ;	
	inc	word ptr [bp-2]
	jmp	short @3@1250
@3@1178:
   ;	
   ;					else if(a==72 && st1!=1)
   ;	
	cmp	word ptr [bp-16],72
	jne	short @3@1250
	cmp	word ptr [bp-2],1
	je	short @3@1250
   ;	
   ;						st1--;
   ;	
	dec	word ptr [bp-2]
@3@1250:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-120]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	@3@50
@3@1298:
   ;	
   ;				}
   ;			}
   ;	
   ;		}
   ;		clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;		cout<<st1<<" "<<st2<<" "<<i;
   ;	
	mov	ax,di
	cwd	
	push	dx
	push	ax
	mov	ax,word ptr [bp-4]
	cwd	
	push	dx
	push	ax
	mov	ax,word ptr [bp-2]
	cwd	
	push	dx
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	word ptr [bp-8],ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+190
	push	ax
	push	word ptr [bp-8]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	push	word ptr [bp-8]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	word ptr [bp-10],ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+192
	push	ax
	push	word ptr [bp-10]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	push	word ptr [bp-10]
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
@booktic$qi	endp
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
	jne	@@4
	jmp	@4@602
@@4:
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
	mov	ax,3
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+194
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,4
	push	ax
	mov	ax,43
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
	mov	ax,offset DGROUP:s@+205
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
	mov	ax,offset DGROUP:s@+210
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
	mov	ax,offset DGROUP:s@+215
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
	mov	ax,offset DGROUP:s@+230
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
	mov	ax,offset DGROUP:s@+251
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
	mov	ax,offset DGROUP:s@+269
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
	mov	ax,offset DGROUP:s@+275
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
   ;			if(a==1)
   ;	
	cmp	si,1
	jne	short @4@602
   ;	
   ;				booktic(id);
   ;	
	push	word ptr [bp-2]
	call	near ptr @booktic$qi
	pop	cx
@4@602:
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@pas_main$qv	endp
   ;	
   ;	void main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{      pas_main();
   ;	
	call	near ptr @pas_main$qv
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_main	endp
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
	mov	ax,offset DGROUP:s@+278
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
	db	'-ENTER ID :'
	db	0
	db	'id.dat'
	db	0
	db	'ERROR INCORRECT ID!!'
	db	0
	db	'trnbk.dat'
	db	0
	db	'-'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'ERROR!! NO TRAINS FOUND'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'FROM STATION :'
	db	0
	db	'NAME'
	db	0
	db	'NO.'
	db	0
	db	'->'
	db	0
	db	'TO STATION :'
	db	0
	db	'NAME'
	db	0
	db	'NO.'
	db	0
	db	'trnbk.dat'
	db	0
	db	'-'
	db	0
	db	'->'
	db	0
	db	' '
	db	0
	db	' '
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
	public	@pas_login$qv
	extrn	_clrscr:near
	extrn	_gotoxy:near
	extrn	@ostream@outstr$qpxzct1:near
	extrn	_cout:word
	extrn	@istream@$brsh$qri:near
	extrn	_cin:word
	extrn	_getch:near
	public	@booktic$qi
	extrn	_strcpy:near
	extrn	@ostream@$blsh$ql:near
	extrn	@setw$qi:near
	extrn	@setiosflags$ql:near
	public	@pas_main$qv
	public	_main
	extrn	@ofstream@$bctr$qpxzcii:near
	extrn	@ostream@write$qpxzci:near
	extrn	@ofstream@$bdtr$qv:near
	end
