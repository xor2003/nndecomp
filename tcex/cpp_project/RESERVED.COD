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
	?debug	S "c:\reserved.cpp"
	?debug	C E93B58FE7C0F633A5C72657365727665642E637070
	?debug	C E95337528114443A5C494E434C5544455C6673747265616D2E68
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
	?debug	C E95337528110443A5C494E434C5544455C6D656D2E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528113443A5C494E434C5544455C737472696E672E68
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
@2@50:
   ;	
   ;		{	char a=getch();
   ;	
	call	near ptr _getch
	mov	byte ptr [bp-1],al
   ;	
   ;			if(a==13)
   ;	
	cmp	byte ptr [bp-1],13
	jne	short @2@122
   ;	
   ;			{	p[i]='\0';
   ;	
	mov	bx,si
	mov	byte ptr [bx+di],0
	jmp	short @2@266
	jmp	short @2@242
@2@122:
   ;	
   ;				break;
   ;			}
   ;			else if(a=='\b' && i>0)
   ;	
	cmp	byte ptr [bp-1],8
	jne	short @2@194
	or	si,si
	jle	short @2@194
   ;	
   ;			{	cout<<"\b \b";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+188
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				i--;
   ;	
	dec	si
	jmp	short @2@242
@2@194:
   ;	
   ;			}
   ;			else if(a!='\b')
   ;	
	cmp	byte ptr [bp-1],8
	je	short @2@242
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
	mov	ax,offset DGROUP:s@+192
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
@2@242:
	jmp	short @2@50
@2@266:
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
	mov	ax,offset DGROUP:s@+194
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
	mov	ax,offset DGROUP:s@+205
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
	mov	ax,offset DGROUP:s@+234
	push	ax
	lea	ax,word ptr [bp-58]
	push	ax
	call	near ptr _stricmp
	pop	cx
	pop	cx
	or	ax,ax
	je	short @3@74
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
	mov	ax,offset DGROUP:s@+240
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			getch();
   ;	
	call	near ptr _getch
	jmp	@3@530
@3@74:
   ;	
   ;		}
   ;		else
   ;		{       for(int o=1;;)
   ;	
	mov	word ptr [bp-2],1
@3@98:
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
	mov	ax,offset DGROUP:s@+260
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
	mov	ax,offset DGROUP:s@+271
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
	mov	ax,offset DGROUP:s@+285
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				if(o==1)
   ;	
	cmp	di,1
	jne	short @3@170
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
@3@170:
   ;	
   ;				cout<<"->";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+303
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
	jne	short @3@218
	jmp	short @3@242
@3@218:
	jmp	@3@98
@3@242:
   ;	
   ;					break;
   ;			}
   ;			if(o==1)
   ;	
	cmp	word ptr [bp-2],1
	je	@@1
	jmp	@3@530
@@1:
@3@266:
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
	mov	ax,offset DGROUP:s@+306
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-216]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @3@362
@3@314:
   ;	
   ;					idc ob;
   ;					while(f.read((char *)&ob,sizeof(ob)))
   ;						if(ob.ret_id()==a)
   ;	
	cmp	word ptr [bp-8],di
	jne	short @3@362
   ;	
   ;						{	flag=1;
   ;	
	mov	word ptr [bp-4],1
	jmp	short @3@458
@3@362:
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
	je	short @3@410
	xor	ax,ax
	jmp	short @3@434
@3@410:
	mov	ax,si
@3@434:
	or	ax,ax
	jne	short @3@314
@3@458:
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
	jne	@@2
	jmp	@3@266
@@2:
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
	mov	ax,offset DGROUP:s@+314
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
	mov	ax,offset DGROUP:s@+322
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
	mov	ax,offset DGROUP:s@+333
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
	mov	ax,offset DGROUP:s@+347
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
	mov	ax,offset DGROUP:s@+360
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
@3@530:
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
	public	@password$qpzc
	public	@reserved$qv
	extrn	_stricmp:near
	extrn	_srand:near
	extrn	_time:near
	extrn	_rand:near
	extrn	N_LXMUL@:near
	extrn	N_LDIV@:near
	extrn	@ofstream@$bctr$qpxzcii:near
	extrn	@ostream@write$qpxzci:near
	extrn	@ofstream@$bdtr$qv:near
	end
