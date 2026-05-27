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
	?debug	S "c:\promain5.cpp"
	?debug	C E93B58FE7C0F633A5C70726F6D61696E352E637070
	?debug	C E95337528114443A5C494E434C5544455C6673747265616D2E68
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
	?debug	C E95337528110443A5C494E434C5544455C6D656D2E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
	?debug	C E95337528113443A5C494E434C5544455C737472696E672E68
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
	?debug	C E95337528114443A5C494E434C5544455C696F6D616E69702E68
	?debug	C E95337528114443A5C494E434C5544455C67656E657269632E68
	?debug	C E95337528112443A5C494E434C5544455C63747970652E68
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
   ;	void station::create_ob()
   ;	
	assume	cs:_TEXT
@station@create_ob$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,164
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{	ifstream f("idst.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-86]
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
	mov	word ptr [di],ax
	jmp	short @1@122
@1@74:
   ;	
   ;			while(f.read((char *)&ob,sizeof(ob)))
   ;			{	if(ob.ret_id()==id)
   ;	
	mov	ax,word ptr [di]
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
	lea	ax,word ptr [bp-46]
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
	cmp	word ptr [di],0
	je	short @1@50
   ;	
   ;		f.close();
   ;	
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;		ofstream f1("idst.dat",ios::binary|ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,136
	push	ax
	mov	ax,offset DGROUP:s@+9
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-164]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;		idc ob1(id);
   ;	
	mov	ax,word ptr [di]
	mov	word ptr [bp-6],ax
   ;	
   ;		f1.write((char *)&ob1,sizeof(ob1));
   ;	
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-6]
	push	ax
	lea	ax,word ptr [bp-124]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;		f1.close();
   ;	
	lea	ax,word ptr [bp-164]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
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
	mov	ax,offset DGROUP:s@+18
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gotoxy(13,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"-ENTER THE STATION NAME :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+29
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gets(stname);
   ;	
	mov	ax,di
	add	ax,24
	push	ax
	call	near ptr _gets
	pop	cx
   ;	
   ;		show();
   ;	
	push	di
	call	near ptr @station@show$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-164]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-86]
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
@station@create_ob$qv	endp
   ;	
   ;	void station::show()
   ;	
	assume	cs:_TEXT
@station@show$qv	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
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
	mov	ax,offset DGROUP:s@+55
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gotoxy(13,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"-STATION NAME :"<<stname;
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+66
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	si,offset DGROUP:_cout
	xor	ax,ax
	push	ax
	mov	ax,di
	add	ax,24
	push	ax
	push	si
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
   ;		cout<<"-STATION ID :"<<id;
   ;	
	mov	ax,word ptr [di]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+82
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
   ;		getch();
   ;	
	call	near ptr _getch
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@station@show$qv	endp
   ;	
   ;	void train::journey(int a,int b[10])
   ;	
	assume	cs:_TEXT
@train@journey$qipi	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
	mov	dx,word ptr [bp+8]
   ;	
   ;	{	c=1;
   ;	
	mov	word ptr [di+22],1
   ;	
   ;		n=a;
   ;	
	mov	ax,word ptr [bp+6]
	mov	word ptr [di+24],ax
   ;	
   ;		for(int i=0;i<n;i++)
   ;	
	xor	si,si
	jmp	short @3@98
@3@50:
   ;	
   ;			stno[i]=b[i];
   ;	
	mov	ax,si
	shl	ax,1
	mov	bx,di
	inc	bx
	inc	bx
	add	bx,ax
	mov	ax,si
	shl	ax,1
	push	bx
	mov	bx,dx
	add	bx,ax
	mov	ax,word ptr [bx]
	pop	bx
	mov	word ptr [bx],ax
	inc	si
@3@98:
	cmp	word ptr [di+24],si
	jg	short @3@50
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@train@journey$qipi	endp
   ;	
   ;	void train::create_ob()
   ;	
	assume	cs:_TEXT
@train@create_ob$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,164
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{	ifstream f("idtr.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+96
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
@4@50:
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
	mov	word ptr [di],ax
	jmp	short @4@122
@4@74:
   ;	
   ;			while(f.read((char *)&ob,sizeof(ob)))
   ;			{	if(ob.ret_id()==id)
   ;	
	mov	ax,word ptr [di]
	cmp	ax,word ptr [bp-2]
	jne	short @4@122
   ;	
   ;				{	flag=1;
   ;	
	mov	word ptr [bp-4],1
	jmp	short @4@218
@4@122:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-2]
	push	ax
	lea	ax,word ptr [bp-46]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	si,word ptr [bx]
	test	word ptr [si+4],134
	je	short @4@170
	xor	ax,ax
	jmp	short @4@194
@4@170:
	mov	ax,si
@4@194:
	or	ax,ax
	jne	short @4@74
@4@218:
   ;	
   ;					break;
   ;				}
   ;			}
   ;		}while(flag==1 || id==0);
   ;	
	cmp	word ptr [bp-4],1
	je	short @4@50
	cmp	word ptr [di],0
	je	short @4@50
   ;	
   ;		f.close();
   ;	
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;		ofstream f1("idtr.dat",ios::binary|ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,136
	push	ax
	mov	ax,offset DGROUP:s@+105
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-164]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;		idc ob1(id);
   ;	
	mov	ax,word ptr [di]
	mov	word ptr [bp-6],ax
   ;	
   ;		f1.write((char *)&ob1,sizeof(ob1));
   ;	
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-6]
	push	ax
	lea	ax,word ptr [bp-124]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;		f1.close();
   ;	
	lea	ax,word ptr [bp-164]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
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
	mov	ax,offset DGROUP:s@+114
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gotoxy(13,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"-ENTER THE TRAIN NAME :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+125
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gets(tname);
   ;	
	mov	ax,di
	add	ax,30
	push	ax
	call	near ptr _gets
	pop	cx
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
   ;		cout<<"-ENTER THE CAPACITY :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+149
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		cin>>cap;
   ;	
	mov	ax,di
	add	ax,26
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;		show();
   ;	
	push	di
	call	near ptr @train@show$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-164]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-86]
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
@train@create_ob$qv	endp
   ;	
   ;	void train::show()
   ;	
	assume	cs:_TEXT
@train@show$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
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
	mov	ax,offset DGROUP:s@+171
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gotoxy(13,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"-TRAIN NAME :"<<tname;
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+182
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-2],offset DGROUP:_cout
	xor	ax,ax
	push	ax
	mov	ax,si
	add	ax,30
	push	ax
	push	word ptr [bp-2]
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
   ;		cout<<"-TRAIN ID :"<<id;
   ;	
	mov	ax,word ptr [si]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+196
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
   ;		cout<<"-CAPACITY :"<<cap;
   ;	
	mov	ax,word ptr [si+26]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+208
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
   ;		gotoxy(13,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"-SEATS AVAILABE :"<<cap-oc;
   ;	
	mov	ax,word ptr [si+26]
	sub	ax,word ptr [si+28]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+220
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
   ;		if(c==1)
   ;	
	cmp	word ptr [si+22],1
	je	@@0
	jmp	@5@170
@@0:
   ;	
   ;		{	gotoxy(13,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-THE NO. OF THROUGH WHICH THE TRAIN PASSES :"<<n;
   ;	
	mov	ax,word ptr [si+24]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+238
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
   ;			gotoxy(13,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-THE STATIONS ARE :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+283
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(25,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-STARTING FROM ";
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
   ;			gotoxy(25,12+n);
   ;	
	mov	ax,word ptr [si+24]
	add	ax,12
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-LAST STATION";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+319
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			for(int i=0;i<n;i++)
   ;	
	xor	di,di
	jmp	short @5@146
@5@98:
   ;	
   ;			{	gotoxy(14,13+i);
   ;	
	mov	ax,di
	add	ax,13
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<i+1<<") "<<stno[i];
   ;	
	mov	ax,di
	shl	ax,1
	mov	bx,si
	inc	bx
	inc	bx
	add	bx,ax
	mov	ax,word ptr [bx]
	cwd	
	push	dx
	push	ax
	mov	ax,di
	inc	ax
	cwd	
	push	dx
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	word ptr [bp-4],ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+333
	push	ax
	push	word ptr [bp-4]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	push	word ptr [bp-4]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	inc	di
@5@146:
	cmp	word ptr [si+24],di
	jg	short @5@98
@5@170:
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
@train@show$qv	endp
   ;	
   ;	void pass::create_ob()
   ;	
	assume	cs:_TEXT
@pass@create_ob$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,164
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
	mov	ax,offset DGROUP:s@+336
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
   ;		cout<<"ENTER THE FOLLOWING DETAILS -";
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
   ;		cout<<"-NAME :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+377
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gets(name);
   ;	
	mov	ax,si
	add	ax,106
	push	ax
	call	near ptr _gets
	pop	cx
   ;	
   ;		gotoxy(13,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"-HOME ADDRESS :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+385
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gets(hoad);
   ;	
	mov	ax,si
	add	ax,156
	push	ax
	call	near ptr _gets
	pop	cx
   ;	
   ;		gotoxy(13,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"-AGE :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+401
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		cin>>age;
   ;	
	mov	ax,si
	add	ax,104
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
@6@50:
   ;	
   ;		int flag;
   ;		do
   ;		{       flag=0;
   ;	
	mov	word ptr [bp-2],0
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
	mov	word ptr [si],ax
   ;	
   ;			ifstream f("id.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+408
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-164]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @6@146
@6@98:
   ;	
   ;			idc ob;
   ;			while(f.read((char *)&ob,sizeof(ob)))
   ;			{	if(ob.ret_id()==id)
   ;	
	mov	ax,word ptr [si]
	cmp	ax,word ptr [bp-6]
	jne	short @6@146
   ;	
   ;				{	flag=1;
   ;	
	mov	word ptr [bp-2],1
	jmp	short @6@242
@6@146:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-6]
	push	ax
	lea	ax,word ptr [bp-124]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	di,word ptr [bx]
	test	word ptr [di+4],134
	je	short @6@194
	xor	ax,ax
	jmp	short @6@218
@6@194:
	mov	ax,di
@6@218:
	or	ax,ax
	jne	short @6@98
@6@242:
   ;	
   ;					break;
   ;				}
   ;			}
   ;			f.close();
   ;	
	lea	ax,word ptr [bp-164]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-164]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
   ;	
   ;		}while(flag==1 || id==0);
   ;	
	cmp	word ptr [bp-2],1
	jne	@@1
	jmp	@6@50
@@1:
	cmp	word ptr [si],0
	jne	@@2
	jmp	@6@50
@@2:
   ;	
   ;		ofstream f("id.dat",ios::binary|ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,136
	push	ax
	mov	ax,offset DGROUP:s@+415
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-84]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;		idc ob(id);
   ;	
	mov	ax,word ptr [si]
	mov	word ptr [bp-4],ax
   ;	
   ;		f.write((char *)&ob,sizeof(ob));
   ;	
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-4]
	push	ax
	lea	ax,word ptr [bp-44]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;		f.close();
   ;	
	lea	ax,word ptr [bp-84]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;		n=0;
   ;	
	mov	word ptr [si+102],0
   ;	
   ;		show();
   ;	
	push	si
	call	near ptr @pass@show$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-84]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
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
@pass@create_ob$qv	endp
   ;	
   ;	void pass::show()
   ;	
	assume	cs:_TEXT
@pass@show$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,22
	push	si
	push	di
	mov	di,word ptr [bp+4]
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
	mov	ax,offset DGROUP:s@+422
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
   ;		cout<<"DETAILS ARE-";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+433
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
   ;		cout<<"-NAME :"<<name;
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+446
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-2],offset DGROUP:_cout
	xor	ax,ax
	push	ax
	mov	ax,di
	add	ax,106
	push	ax
	push	word ptr [bp-2]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gotoxy(13,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"-HOME ADDRESS :"<<hoad;
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+454
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-4],offset DGROUP:_cout
	xor	ax,ax
	push	ax
	mov	ax,di
	add	ax,156
	push	ax
	push	word ptr [bp-4]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gotoxy(13,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"-AGE :"<<age;
   ;	
	mov	ax,word ptr [di+104]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+470
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
   ;		gotoxy(13,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"-ID :"<<id;
   ;	
	mov	ax,word ptr [di]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+477
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
   ;		if(n>0)
   ;	
	cmp	word ptr [di+102],0
	jg	@@3
	jmp	@7@194
@@3:
   ;	
   ;		{       gotoxy(13,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-TICKETS BOOKED:";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+483
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(14,14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"PNR NO.";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+500
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			for(int i=0;i<n;i++)
   ;	
	xor	si,si
	jmp	@7@170
@7@98:
   ;	
   ;			{	gotoxy(11,15+i);
   ;	
	mov	ax,si
	add	ax,15
	push	ax
	mov	ax,11
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<setw(2)<<setiosflags(ios::left)<<i+1<<")"<<pnr[i];
   ;	
	mov	ax,si
	shl	ax,1
	mov	bx,di
	inc	bx
	inc	bx
	add	bx,ax
	mov	ax,word ptr [bx]
	cwd	
	push	dx
	push	ax
	mov	ax,si
	inc	ax
	cwd	
	push	dx
	push	ax
	mov	ax,2
	push	ax
	push	ds
	lea	ax,word ptr [bp-8]
	push	ax
	call	near ptr @setw$qi
	add	sp,6
	lea	ax,word ptr [bp-8]
	mov	word ptr [bp-10],ax
	mov	bx,word ptr [bp-10]
	push	word ptr [bx+2]
	push	word ptr DGROUP:_cout
	mov	bx,word ptr [bp-10]
	call	word ptr [bx]
	pop	cx
	pop	cx
	mov	word ptr [bp-18],offset DGROUP:_cout
	xor	ax,ax
	mov	dx,2
	push	ax
	push	dx
	push	ds
	lea	ax,word ptr [bp-16]
	push	ax
	call	near ptr @setiosflags$ql
	add	sp,8
	lea	ax,word ptr [bp-16]
	mov	word ptr [bp-20],ax
	mov	bx,word ptr [bp-20]
	push	word ptr [bx+4]
	push	word ptr [bx+2]
	mov	bx,word ptr [bp-18]
	push	word ptr [bx]
	mov	bx,word ptr [bp-20]
	call	word ptr [bx]
	add	sp,6
	push	word ptr [bp-18]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	word ptr [bp-22],ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+508
	push	ax
	push	word ptr [bp-22]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	push	word ptr [bp-22]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	inc	si
@7@170:
	cmp	word ptr [di+102],si
	jle	@@4
	jmp	@7@98
@@4:
@7@194:
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
@pass@show$qv	endp
   ;	
   ;	void pass::ret_info(int &a,int b[50])
   ;	
	assume	cs:_TEXT
@pass@ret_info$qripi	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
	mov	cx,word ptr [bp+8]
   ;	
   ;	{	a=n;
   ;	
	mov	ax,word ptr [di+102]
	mov	bx,word ptr [bp+6]
	mov	word ptr [bx],ax
   ;	
   ;		for(int i=0;i<n;i++)
   ;	
	xor	si,si
	jmp	short @8@98
@8@50:
   ;	
   ;			b[i]=pnr[i];
   ;	
	mov	ax,si
	shl	ax,1
	mov	bx,di
	inc	bx
	inc	bx
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,si
	shl	dx,1
	mov	bx,cx
	add	bx,dx
	mov	word ptr [bx],ax
	inc	si
@8@98:
	cmp	word ptr [di+102],si
	jg	short @8@50
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@pass@ret_info$qripi	endp
   ;	
   ;	void tic::create_ob(int a,int b)
   ;	
	assume	cs:_TEXT
@tic@create_ob$qii	proc	near
	push	bp
	mov	bp,sp
	sub	sp,326
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{       trid=a;
   ;	
	mov	ax,word ptr [bp+6]
	mov	word ptr [si+530],ax
   ;	
   ;		n=b;
   ;	
	mov	ax,word ptr [bp+8]
	mov	word ptr [si+534],ax
@9@50:
   ;	
   ;		int flag;
   ;		do
   ;		{       flag=0;
   ;	
	mov	word ptr [bp-2],0
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
   ;			pnr=random(100);
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
	mov	word ptr [si+532],ax
   ;	
   ;			ifstream f("idt.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+510
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-326]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @9@146
@9@98:
   ;	
   ;			idc ob;
   ;			while(f.read((char *)&ob,sizeof(ob)))
   ;			{	if(ob.ret_id()==pnr)
   ;	
	mov	ax,word ptr [si+532]
	cmp	ax,word ptr [bp-8]
	jne	short @9@146
   ;	
   ;				{	flag=1;
   ;	
	mov	word ptr [bp-2],1
	jmp	short @9@242
@9@146:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-8]
	push	ax
	lea	ax,word ptr [bp-286]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	di,word ptr [bx]
	test	word ptr [di+4],134
	je	short @9@194
	xor	ax,ax
	jmp	short @9@218
@9@194:
	mov	ax,di
@9@218:
	or	ax,ax
	jne	short @9@98
@9@242:
   ;	
   ;					break;
   ;				}
   ;			}
   ;			f.close();
   ;	
	lea	ax,word ptr [bp-326]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-326]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
   ;	
   ;		}while(flag==1 || pnr==0);
   ;	
	cmp	word ptr [bp-2],1
	jne	@@5
	jmp	@9@50
@@5:
	cmp	word ptr [si+532],0
	jne	@@6
	jmp	@9@50
@@6:
   ;	
   ;		ofstream f("idt.dat",ios::binary|ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,136
	push	ax
	mov	ax,offset DGROUP:s@+518
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;		idc ob(pnr);
   ;	
	mov	ax,word ptr [si+532]
	mov	word ptr [bp-4],ax
   ;	
   ;		f.write((char *)&ob,sizeof(ob));
   ;	
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-4]
	push	ax
	lea	ax,word ptr [bp-46]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;		f.close();
   ;	
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;		ifstream f1("infot.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+526
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-166]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;		train ob2;
   ;	
	mov	word ptr [bp-224],0
	mov	word ptr [bp-218],0
	jmp	short @9@386
@9@338:
   ;	
   ;		while(f1.read((char *)&ob2,sizeof(ob2)))
   ;		{	int a;
   ;			ob2.ret_info(a,tname);
   ;	
	mov	di,word ptr [bp-246]
	lea	ax,word ptr [bp-216]
	push	ax
	mov	ax,si
	add	ax,542
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;			if(a==trid)
   ;	
	cmp	word ptr [si+530],di
	jne	short @9@386
	jmp	short @9@482
@9@386:
	mov	ax,80
	push	ax
	lea	ax,word ptr [bp-246]
	push	ax
	lea	ax,word ptr [bp-126]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-6],ax
	mov	bx,word ptr [bp-6]
	test	word ptr [bx+4],134
	je	short @9@434
	xor	ax,ax
	jmp	short @9@458
@9@434:
	mov	ax,word ptr [bp-6]
@9@458:
	or	ax,ax
	jne	short @9@338
@9@482:
   ;	
   ;				break;
   ;		}
   ;		f1.close();
   ;	
	lea	ax,word ptr [bp-166]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-166]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
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
@tic@create_ob$qii	endp
   ;	
   ;	void tic::show()
   ;	
	assume	cs:_TEXT
@tic@show$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,20
	push	si
	push	di
	mov	di,word ptr [bp+4]
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
	mov	ax,offset DGROUP:s@+536
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
   ;		cout<<"TICKET DETAILS ARE -";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+547
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gotoxy(14,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"PNR NO. :"<<pnr;
   ;	
	mov	ax,word ptr [di+532]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+568
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
   ;		gotoxy(45,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,45
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"TRAIN NAME :"<<tname;
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+578
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-2],offset DGROUP:_cout
	xor	ax,ax
	push	ax
	mov	ax,di
	add	ax,542
	push	ax
	push	word ptr [bp-2]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
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
   ;		cout<<"BASE PRICE :"<<bprice;
   ;	
	mov	ax,word ptr [di+538]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+591
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
   ;		gotoxy(45,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,45
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"TAX :GST 18%";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+604
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gotoxy(14,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"TOTAL PRICE (inc. of taxes):"<<tprice;
   ;	
	mov	ax,word ptr [di+540]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+617
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
   ;		gotoxy(14,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"PASSENGERS INFO :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+646
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gotoxy(45,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,45
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"PASSENGERS :"<<n;
   ;	
	mov	ax,word ptr [di+534]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+664
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
   ;		gotoxy(14,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"NAME";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+677
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gotoxy(30,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"AGE";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+682
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gotoxy(34,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,34
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"GENDER";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+686
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		for(int i=0;i<n;i++)
   ;	
	xor	si,si
	jmp	@10@122
@10@50:
   ;	
   ;		{	gotoxy(12,14+i);
   ;	
	mov	ax,si
	add	ax,14
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<setw(2)<<setiosflags(ios::right)<<i+1<<")"<<pa[i].name;
   ;	
	mov	ax,si
	inc	ax
	cwd	
	push	dx
	push	ax
	mov	ax,2
	push	ax
	push	ds
	lea	ax,word ptr [bp-6]
	push	ax
	call	near ptr @setw$qi
	add	sp,6
	lea	ax,word ptr [bp-6]
	mov	word ptr [bp-8],ax
	mov	bx,word ptr [bp-8]
	push	word ptr [bx+2]
	push	word ptr DGROUP:_cout
	mov	bx,word ptr [bp-8]
	call	word ptr [bx]
	pop	cx
	pop	cx
	mov	word ptr [bp-16],offset DGROUP:_cout
	xor	ax,ax
	mov	dx,4
	push	ax
	push	dx
	push	ds
	lea	ax,word ptr [bp-14]
	push	ax
	call	near ptr @setiosflags$ql
	add	sp,8
	lea	ax,word ptr [bp-14]
	mov	word ptr [bp-18],ax
	mov	bx,word ptr [bp-18]
	push	word ptr [bx+4]
	push	word ptr [bx+2]
	mov	bx,word ptr [bp-16]
	push	word ptr [bx]
	mov	bx,word ptr [bp-18]
	call	word ptr [bx]
	add	sp,6
	push	word ptr [bp-16]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	word ptr [bp-20],ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+693
	push	ax
	push	word ptr [bp-20]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	xor	ax,ax
	push	ax
	mov	ax,si
	mov	dx,53
	imul	dx
	mov	dx,di
	add	dx,ax
	push	dx
	push	word ptr [bp-20]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(30,14+i);
   ;	
	mov	ax,si
	add	ax,14
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<pa[i].age;
   ;	
	mov	ax,si
	mov	dx,53
	imul	dx
	mov	bx,ax
	mov	ax,word ptr [bx+di+51]
	cwd	
	push	dx
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
   ;	
   ;			gotoxy(34,14+i);
   ;	
	mov	ax,si
	add	ax,14
	push	ax
	mov	ax,34
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<pa[i].g;
   ;	
	mov	ax,si
	mov	dx,53
	imul	dx
	mov	bx,ax
	mov	al,byte ptr [bx+di+50]
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$qzc
	pop	cx
	pop	cx
	inc	si
@10@122:
	cmp	word ptr [di+534],si
	jle	@@7
	jmp	@10@50
@@7:
   ;	
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
@tic@show$qv	endp
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
	mov	ax,offset DGROUP:s@+695
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
	mov	ax,offset DGROUP:s@+706
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
	mov	ax,offset DGROUP:s@+723
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-90]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @11@98
@11@50:
   ;	
   ;		idc ob;
   ;		while(f.read((char *)&ob,sizeof(ob)))
   ;			if(ob.ret_id()==a)
   ;	
	mov	ax,word ptr [bp-6]
	cmp	ax,word ptr [bp-2]
	jne	short @11@98
   ;	
   ;			{	flag=1;
   ;	
	mov	word ptr [bp-4],1
   ;	
   ;				id=a;
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr [si+102],ax
	jmp	short @11@194
@11@98:
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
	je	short @11@146
	xor	ax,ax
	jmp	short @11@170
@11@146:
	mov	ax,di
@11@170:
	or	ax,ax
	jne	short @11@50
@11@194:
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
	jne	short @11@242
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
	mov	ax,offset DGROUP:s@+731
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			getch();
   ;	
	call	near ptr _getch
	jmp	@11@290
@11@242:
   ;	
   ;		}
   ;		else if(flag==1)
   ;	
	cmp	word ptr [bp-4],1
	je	@@8
	jmp	@11@290
@@8:
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
	mov	ax,offset DGROUP:s@+750
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
	mov	ax,offset DGROUP:s@+761
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
	mov	ax,offset DGROUP:s@+791
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
	mov	ax,offset DGROUP:s@+799
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
	mov	ax,offset DGROUP:s@+815
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
	mov	ax,offset DGROUP:s@+822
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
	mov	ax,offset DGROUP:s@+833
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
	mov	ax,offset DGROUP:s@+846
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
	mov	ax,offset DGROUP:s@+854
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
	mov	ax,offset DGROUP:s@+870
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
	mov	ax,offset DGROUP:s@+877
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
@11@290:
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
	sub	sp,676
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
	je	@@9
	jmp	@12@818
@@9:
@12@50:
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
	jne	short @12@122
	jmp	@12@818
	jmp	@12@794
@12@122:
   ;	
   ;					break;
   ;				else if(op==1)
   ;	
	cmp	word ptr [bp-2],1
	jne	short @12@194
   ;	
   ;				{	pass ob;
   ;					ob.create_ob();
   ;	
	lea	ax,word ptr [bp-210]
	push	ax
	call	near ptr @pass@create_ob$qv
	pop	cx
   ;	
   ;					ofstream f("infoc.dat",ios::binary|ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,136
	push	ax
	mov	ax,offset DGROUP:s@+883
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-288]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;					f.write((char *)&ob,sizeof(ob));
   ;	
	mov	ax,206
	push	ax
	lea	ax,word ptr [bp-210]
	push	ax
	lea	ax,word ptr [bp-248]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;					f.close();
   ;	
	lea	ax,word ptr [bp-288]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-288]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	@12@794
@12@194:
   ;	
   ;				}
   ;				else if(op==2)
   ;	
	cmp	word ptr [bp-2],2
	jne	short @12@242
   ;	
   ;					p_main();
   ;	
	call	near ptr @p_main$qv
	jmp	@12@794
@12@242:
   ;	
   ;				else if(op==3)
   ;	
	cmp	word ptr [bp-2],3
	je	@@10
	jmp	@12@578
@@10:
   ;	
   ;				{	tic ob;
   ;	
	mov	word ptr [bp-60],65535
   ;	
   ;					clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;					o2;
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
   ;	
   ;					gotoxy(14,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					int a,flag=0;
   ;	
	xor	di,di
   ;	
   ;					cout<<"ENTER THE PNR NO. :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+904
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					cin>>a;
   ;	
	lea	ax,word ptr [bp-4]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;					ifstream f("infotic.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+924
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-676]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @12@338
@12@290:
   ;	
   ;					while(f.read((char *)&ob,sizeof(ob)))
   ;						if(ob.ret_pnr()==a)
   ;	
	mov	ax,word ptr [bp-64]
	cmp	ax,word ptr [bp-4]
	jne	short @12@338
   ;	
   ;						{	flag=1;
   ;	
	mov	di,1
	jmp	short @12@434
@12@338:
	mov	ax,592
	push	ax
	lea	ax,word ptr [bp-596]
	push	ax
	lea	ax,word ptr [bp-636]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	si,word ptr [bx]
	test	word ptr [si+4],134
	je	short @12@386
	xor	ax,ax
	jmp	short @12@410
@12@386:
	mov	ax,si
@12@410:
	or	ax,ax
	jne	short @12@290
@12@434:
   ;	
   ;							break;
   ;						}
   ;					if(flag==1)
   ;	
	cmp	di,1
	jne	short @12@482
   ;	
   ;						ob.show();
   ;	
	lea	ax,word ptr [bp-596]
	push	ax
	call	near ptr @tic@show$qv
	pop	cx
	jmp	short @12@530
@12@482:
   ;	
   ;					else if(flag==0)
   ;	
	or	di,di
	jne	short @12@530
   ;	
   ;					{	gotoxy(14,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;						cout<<"ERROR!! INVALID PNR";
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
   ;						getch();
   ;	
	call	near ptr _getch
@12@530:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-676]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	@12@794
@12@578:
   ;	
   ;					}
   ;				}
   ;				else if(op==5)
   ;	
	cmp	word ptr [bp-2],5
	jne	short @12@650
   ;	
   ;				{	emp ob;
   ;					ob.create_ob();
   ;	
	lea	ax,word ptr [bp-108]
	push	ax
	call	near ptr @emp@create_ob$qv
	pop	cx
   ;	
   ;					ofstream f("infoe.dat",ios::binary|ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,136
	push	ax
	mov	ax,offset DGROUP:s@+956
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-186]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;					f.write((char *)&ob,sizeof(ob));
   ;	
	mov	ax,104
	push	ax
	lea	ax,word ptr [bp-108]
	push	ax
	lea	ax,word ptr [bp-146]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;					f.close();
   ;	
	lea	ax,word ptr [bp-186]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;					e_login();
   ;	
	call	near ptr @e_login$qv
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-186]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	@12@794
@12@650:
   ;	
   ;				}
   ;				else if(op==6)
   ;	
	cmp	word ptr [bp-2],6
	jne	short @12@698
   ;	
   ;					e_login();
   ;	
	call	near ptr @e_login$qv
	jmp	@12@794
@12@698:
   ;	
   ;				else if(op==7)
   ;	
	cmp	word ptr [bp-2],7
	jne	short @12@746
   ;	
   ;					reserved();
   ;	
	call	near ptr @reserved$qv
	jmp	@12@794
@12@746:
   ;	
   ;				else if(op==8)
   ;	
	cmp	word ptr [bp-2],8
	je	@@11
	jmp	@12@794
@@11:
   ;	
   ;				{	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;					o2;
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
	mov	ax,offset DGROUP:s@+966
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					gotoxy(14,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<"-THIS SOFTWARE LETS YOU CREATE PASSENGER ACCOUNT,";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+977
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					gotoxy(15,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,15
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<"EMPLOYEE ACCOUNT,NEW STATION,NEW TRAIN ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1027
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					gotoxy(15,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,15
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<"AND BOOK TICKETS!!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1067
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					gotoxy(14,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<"-YOU CAN CREATE A NEW TRAIN,STATION FROM";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1086
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					gotoxy(15,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,15
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<"EMPLOYEE LOGIN BY ENTERING A FEW BASIC INFORMATION";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1127
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					gotoxy(14,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<"-YOU CAN CREATE AN EMPLOYEE ID FROM RESERVED MENU";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1178
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					gotoxy(15,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,15
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<"ONCE CREATED YOU HAVE TO SIGNUP USING THIS ID";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1228
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					gotoxy(15,14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,15
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<"BY SELECTING \"CREATE A NEW ACCOUNT \"FROM THE MAIN MENU";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1274
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					gotoxy(14,15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<"-TICKET INFORMATION CAN BE DIRECTLY CHECKED FROM MAIN MENU";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1329
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					getch();
   ;	
	call	near ptr _getch
@12@794:
	jmp	@12@50
@12@818:
   ;	
   ;				}
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
	mov	ax,offset DGROUP:s@+1388
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
	mov	ax,offset DGROUP:s@+1398
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
	mov	ax,offset DGROUP:s@+1424
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
	mov	ax,offset DGROUP:s@+1457
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
	mov	ax,offset DGROUP:s@+1486
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
	mov	ax,offset DGROUP:s@+1507
	push	ax
	lea	ax,word ptr [bp-50]
	push	ax
	call	near ptr _stricmp
	pop	cx
	pop	cx
	or	ax,ax
	jne	short @13@74
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
	mov	ax,offset DGROUP:s@+1513
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
	mov	ax,offset DGROUP:s@+1533
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
	mov	ax,offset DGROUP:s@+1554
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			getch();
   ;	
	call	near ptr _getch
	jmp	short @13@98
@13@74:
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
	mov	ax,offset DGROUP:s@+1582
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
	mov	ax,offset DGROUP:s@+1607
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
@13@98:
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
@14@26:
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
	mov	ax,offset DGROUP:s@+1635
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
	mov	ax,offset DGROUP:s@+1646
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
	mov	ax,offset DGROUP:s@+1692
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
	mov	ax,offset DGROUP:s@+1711
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
	mov	ax,offset DGROUP:s@+1730
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
	mov	ax,offset DGROUP:s@+1737
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
	mov	ax,offset DGROUP:s@+1755
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
	mov	ax,offset DGROUP:s@+1773
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
	mov	ax,offset DGROUP:s@+1791
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
	mov	ax,offset DGROUP:s@+1810
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
	mov	ax,offset DGROUP:s@+1817
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(45,16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,45
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-GENERAL INSTRUCTIONS";	//OP=8
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1832
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			if(op==1)
   ;	
	cmp	word ptr [si],1
	jne	short @14@74
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
	jmp	@14@410
@14@74:
   ;	
   ;			else if(op==2)
   ;	
	cmp	word ptr [si],2
	jne	short @14@122
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
	jmp	short @14@410
@14@122:
   ;	
   ;			else if(op==3)
   ;	
	cmp	word ptr [si],3
	jne	short @14@170
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
	jmp	short @14@410
@14@170:
   ;	
   ;			else if(op==4)
   ;	
	cmp	word ptr [si],4
	jne	short @14@218
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
	jmp	short @14@410
@14@218:
   ;	
   ;			else if(op==5)                  //77->      75<-
   ;	
	cmp	word ptr [si],5
	jne	short @14@266
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
	jmp	short @14@410
@14@266:
   ;	
   ;			else if(op==6)
   ;	
	cmp	word ptr [si],6
	jne	short @14@314
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
	jmp	short @14@410
@14@314:
   ;	
   ;			else if(op==7)
   ;	
	cmp	word ptr [si],7
	jne	short @14@362
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
	jmp	short @14@410
@14@362:
   ;	
   ;			else if(op==8)
   ;	
	cmp	word ptr [si],8
	jne	short @14@410
   ;	
   ;				gotoxy(44,16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,44
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
@14@410:
   ;	
   ;			cout<<"->";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1854
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
	jne	short @14@1010
   ;	
   ;			{	a=getch();
   ;	
	call	near ptr _getch
	mov	di,ax
   ;	
   ;				if(a==80 && op!=4 && op!=8)
   ;	
	cmp	di,80
	jne	short @14@554
	cmp	word ptr [si],4
	je	short @14@554
	cmp	word ptr [si],8
	je	short @14@554
   ;	
   ;					op++;
   ;	
	inc	word ptr [si]
	jmp	short @14@986
@14@554:
   ;	
   ;				else if(a==72 && op!=1 && op!=5)
   ;	
	cmp	di,72
	jne	short @14@650
	cmp	word ptr [si],1
	je	short @14@650
	cmp	word ptr [si],5
	je	short @14@650
   ;	
   ;					op--;
   ;	
	dec	word ptr [si]
	jmp	short @14@986
@14@650:
   ;	
   ;				else if(a==77 && (op==1 || op==2))
   ;	
	cmp	di,77
	jne	short @14@746
	cmp	word ptr [si],1
	je	short @14@722
	cmp	word ptr [si],2
	jne	short @14@746
@14@722:
   ;	
   ;					op+=4;
   ;	
	add	word ptr [si],4
	jmp	short @14@986
@14@746:
   ;	
   ;				else if(a==77 && op==4)
   ;	
	cmp	di,77
	jne	short @14@818
	cmp	word ptr [si],4
	jne	short @14@818
   ;	
   ;					op=7;
   ;	
	mov	word ptr [si],7
	jmp	short @14@986
@14@818:
   ;	
   ;				else if(a==75 && (op==5 || op==6))
   ;	
	cmp	di,75
	jne	short @14@914
	cmp	word ptr [si],5
	je	short @14@890
	cmp	word ptr [si],6
	jne	short @14@914
@14@890:
   ;	
   ;					op-=4;
   ;	
	sub	word ptr [si],4
	jmp	short @14@986
@14@914:
   ;	
   ;				else if(a==75 && op==7)
   ;	
	cmp	di,75
	jne	short @14@986
	cmp	word ptr [si],7
	jne	short @14@986
   ;	
   ;					op=4;
   ;	
	mov	word ptr [si],4
@14@986:
	jmp	short @14@1058
@14@1010:
   ;	
   ;			}
   ;			else if(a==13)
   ;	
	cmp	di,13
	jne	short @14@1058
	jmp	short @14@1082
@14@1058:
	jmp	@14@26
@14@1082:
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
@15@50:
   ;	
   ;		{	char a=getch();
   ;	
	call	near ptr _getch
	mov	byte ptr [bp-1],al
   ;	
   ;			if(a==13)
   ;	
	cmp	byte ptr [bp-1],13
	jne	short @15@122
   ;	
   ;			{	p[i]='\0';
   ;	
	mov	bx,si
	mov	byte ptr [bx+di],0
	jmp	short @15@266
	jmp	short @15@242
@15@122:
   ;	
   ;				break;
   ;			}
   ;			else if(a=='\b' && i>0)
   ;	
	cmp	byte ptr [bp-1],8
	jne	short @15@194
	or	si,si
	jle	short @15@194
   ;	
   ;			{	cout<<"\b \b";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1857
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				i--;
   ;	
	dec	si
	jmp	short @15@242
@15@194:
   ;	
   ;			}
   ;			else if(a!='\b')
   ;	
	cmp	byte ptr [bp-1],8
	je	short @15@242
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
	mov	ax,offset DGROUP:s@+1861
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
@15@242:
	jmp	short @15@50
@15@266:
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
	sub	sp,396
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
	mov	ax,offset DGROUP:s@+1863
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
	mov	ax,offset DGROUP:s@+1874
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		char p[50];
   ;		password(p);
   ;	
	lea	ax,word ptr [bp-60]
	push	ax
	call	near ptr @password$qpzc
	pop	cx
   ;	
   ;		if(strcmpi(p,"irctc")!=0)
   ;	
	mov	ax,offset DGROUP:s@+1903
	push	ax
	lea	ax,word ptr [bp-60]
	push	ax
	call	near ptr _stricmp
	pop	cx
	pop	cx
	or	ax,ax
	je	short @16@74
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
	mov	ax,offset DGROUP:s@+1909
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			getch();
   ;	
	call	near ptr _getch
	jmp	@16@1826
@16@74:
   ;	
   ;		}
   ;		else
   ;			for(int o=1;;)
   ;	
	mov	di,1
@16@98:
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
	mov	ax,offset DGROUP:s@+1929
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
	mov	ax,offset DGROUP:s@+1940
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
   ;				cout<<"-MAKE AN EMP'S ID";     //O=1
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1954
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(15,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,15
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"-VIEW EXISTING STATIONS";    //O=2
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1972
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(15,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,15
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"-VIEW EXISTING TRAIN";      //O=3
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1996
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(15,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,15
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"-VIEW EXISTING PASSENGERS";     //O=4
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2017
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(15,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,15
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"-EXIT";     //O=5
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2043
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				if(o==1)
   ;	
	cmp	di,1
	jne	short @16@146
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
	jmp	short @16@338
@16@146:
   ;	
   ;				else if(o==2)
   ;	
	cmp	di,2
	jne	short @16@194
   ;	
   ;					gotoxy(14,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @16@338
@16@194:
   ;	
   ;				else if(o==3)
   ;	
	cmp	di,3
	jne	short @16@242
   ;	
   ;					gotoxy(14,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @16@338
@16@242:
   ;	
   ;				else if(o==4)
   ;	
	cmp	di,4
	jne	short @16@290
   ;	
   ;					gotoxy(14,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @16@338
@16@290:
   ;	
   ;				else if(o==5)
   ;	
	cmp	di,5
	jne	short @16@338
   ;	
   ;					gotoxy(14,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
@16@338:
   ;	
   ;				cout<<"->";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2049
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				int a=getch();
   ;	
	call	near ptr _getch
	mov	word ptr [bp-2],ax
   ;	
   ;				if(a==13)
   ;	
	cmp	word ptr [bp-2],13
	je	@@12
	jmp	@16@1634
@@12:
   ;	
   ;				{	if(o==1)
   ;	
	cmp	di,1
	je	@@13
	jmp	@16@698
@@13:
@16@410:
   ;	
   ;					{	int a,flag;
   ;						do
   ;						{       flag=0;
   ;	
	mov	word ptr [bp-6],0
   ;	
   ;							randomize();
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _time
	pop	cx
	push	ax
	call	near ptr _srand
	pop	cx
   ;	
   ;							a=random(89);
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
	mov	word ptr [bp-4],ax
   ;	
   ;							ifstream f("ide.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+2052
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-218]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @16@506
@16@458:
   ;	
   ;							idc ob;
   ;							while(f.read((char *)&ob,sizeof(ob)))
   ;								if(ob.ret_id()==a)
   ;	
	mov	ax,word ptr [bp-10]
	cmp	ax,word ptr [bp-4]
	jne	short @16@506
   ;	
   ;								{	flag=1;
   ;	
	mov	word ptr [bp-6],1
	jmp	short @16@602
@16@506:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-10]
	push	ax
	lea	ax,word ptr [bp-178]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	si,word ptr [bx]
	test	word ptr [si+4],134
	je	short @16@554
	xor	ax,ax
	jmp	short @16@578
@16@554:
	mov	ax,si
@16@578:
	or	ax,ax
	jne	short @16@458
@16@602:
   ;	
   ;									break;
   ;								}
   ;							f.close();
   ;	
	lea	ax,word ptr [bp-218]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-218]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
   ;	
   ;						}while(flag==1);
   ;	
	cmp	word ptr [bp-6],1
	jne	@@14
	jmp	@16@410
@@14:
   ;	
   ;						a+=10;
   ;	
	add	word ptr [bp-4],10
   ;	
   ;						idc ob(a);
   ;	
	mov	ax,word ptr [bp-4]
	mov	word ptr [bp-8],ax
   ;	
   ;						ofstream f("ide.dat",ios::binary|ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,136
	push	ax
	mov	ax,offset DGROUP:s@+2060
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-138]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;						f.write((char *)&ob,sizeof(ob));
   ;	
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-8]
	push	ax
	lea	ax,word ptr [bp-98]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;						f.close();
   ;	
	lea	ax,word ptr [bp-138]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;						clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;						o3;
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
	mov	ax,offset DGROUP:s@+2068
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
	mov	ax,offset DGROUP:s@+2079
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;						gotoxy(14,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;						cout<<"ID CREATED!!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2093
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;						gotoxy(14,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;						cout<<"ID No."<<a;
   ;	
	mov	ax,word ptr [bp-4]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2106
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
   ;						getch();
   ;	
	call	near ptr _getch
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-138]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	@16@1610
@16@698:
   ;	
   ;					}
   ;					else if(o==2)
   ;	
	cmp	di,2
	je	@@15
	jmp	@16@986
@@15:
   ;	
   ;					{       clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;						o2;
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
	mov	ax,offset DGROUP:s@+2113
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;						station g;
   ;						ifstream f("infost.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+2124
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-214]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;						int i=0;
   ;	
	mov	word ptr [bp-4],0
	jmp	short @16@794
@16@770:
   ;	
   ;						while(f.read((char *)&g,sizeof(g)))
   ;						{       int a;
   ;							char b[50];
   ;							g.ret_info(a,b);
   ;	
	mov	ax,word ptr [bp-134]
	mov	word ptr [bp-8],ax
	lea	ax,word ptr [bp-110]
	push	ax
	lea	ax,word ptr [bp-264]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;							i++;
   ;	
	inc	word ptr [bp-4]
   ;	
   ;							gotoxy(14,6+i);
   ;	
	mov	ax,word ptr [bp-4]
	add	ax,6
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;							cout<<i<<") NAME :"<<b<<" ID :"<<a;
   ;	
	mov	ax,word ptr [bp-8]
	cwd	
	push	dx
	push	ax
	mov	ax,word ptr [bp-4]
	cwd	
	push	dx
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	si,ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2135
	push	ax
	push	si
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-264]
	push	ax
	push	si
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2144
	push	ax
	push	si
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	push	si
	call	near ptr @ostream@$blsh$ql
	add	sp,6
@16@794:
	mov	ax,74
	push	ax
	lea	ax,word ptr [bp-134]
	push	ax
	lea	ax,word ptr [bp-174]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-6],ax
	mov	bx,word ptr [bp-6]
	test	word ptr [bx+4],134
	je	short @16@842
	xor	ax,ax
	jmp	short @16@866
@16@842:
	mov	ax,word ptr [bp-6]
@16@866:
	or	ax,ax
	je	@@16
	jmp	@16@770
@@16:
   ;	
   ;						}
   ;						if(i==0)
   ;	
	cmp	word ptr [bp-4],0
	jne	short @16@938
   ;	
   ;						{	gotoxy(14,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;							cout<<"NO STATION FOUND!!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2150
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
@16@938:
   ;	
   ;						}
   ;						getch();
   ;	
	call	near ptr _getch
   ;	
   ;						f.close();
   ;	
	lea	ax,word ptr [bp-214]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-214]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	@16@1610
@16@986:
   ;	
   ;					}
   ;	
   ;					else if(o==3)
   ;	
	cmp	di,3
	je	@@17
	jmp	@16@1274
@@17:
   ;	
   ;					{       clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;						o2;
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
	mov	ax,offset DGROUP:s@+2169
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;						train g;
   ;	
	mov	word ptr [bp-118],0
	mov	word ptr [bp-112],0
   ;	
   ;						ifstream f("infot.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+2180
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-220]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;						int i=0;
   ;	
	mov	word ptr [bp-4],0
	jmp	short @16@1082
@16@1058:
   ;	
   ;						while(f.read((char *)&g,sizeof(g)))
   ;						{       int a;
   ;							char b[50];
   ;							g.ret_info(a,b);
   ;	
	mov	ax,word ptr [bp-140]
	mov	word ptr [bp-8],ax
	lea	ax,word ptr [bp-110]
	push	ax
	lea	ax,word ptr [bp-270]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;							i++;
   ;	
	inc	word ptr [bp-4]
   ;	
   ;							gotoxy(14,6+i);
   ;	
	mov	ax,word ptr [bp-4]
	add	ax,6
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;							cout<<i<<") NAME :"<<b<<" ID :"<<a;
   ;	
	mov	ax,word ptr [bp-8]
	cwd	
	push	dx
	push	ax
	mov	ax,word ptr [bp-4]
	cwd	
	push	dx
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	si,ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2190
	push	ax
	push	si
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-270]
	push	ax
	push	si
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2199
	push	ax
	push	si
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	push	si
	call	near ptr @ostream@$blsh$ql
	add	sp,6
@16@1082:
	mov	ax,80
	push	ax
	lea	ax,word ptr [bp-140]
	push	ax
	lea	ax,word ptr [bp-180]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-6],ax
	mov	bx,word ptr [bp-6]
	test	word ptr [bx+4],134
	je	short @16@1130
	xor	ax,ax
	jmp	short @16@1154
@16@1130:
	mov	ax,word ptr [bp-6]
@16@1154:
	or	ax,ax
	je	@@18
	jmp	@16@1058
@@18:
   ;	
   ;						}
   ;						if(i==0)
   ;	
	cmp	word ptr [bp-4],0
	jne	short @16@1226
   ;	
   ;						{	gotoxy(14,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;							cout<<"NO TRAINS FOUND!!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2205
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
@16@1226:
   ;	
   ;						}
   ;						getch();
   ;	
	call	near ptr _getch
   ;	
   ;						f.close();
   ;	
	lea	ax,word ptr [bp-220]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-220]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	@16@1610
@16@1274:
   ;	
   ;					}
   ;					else if(o==4)
   ;	
	cmp	di,4
	je	@@19
	jmp	@16@1562
@@19:
   ;	
   ;					{       clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;						o2;
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
	mov	ax,offset DGROUP:s@+2223
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;						pass g;
   ;						ifstream f("infoc.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+2234
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-346]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;						int i=0;
   ;	
	mov	word ptr [bp-4],0
	jmp	short @16@1370
@16@1346:
   ;	
   ;						while(f.read((char *)&g,sizeof(g)))
   ;						{       int a;
   ;							char b[50];
   ;							g.ret_inf(a,b);
   ;	
	mov	ax,word ptr [bp-266]
	mov	word ptr [bp-8],ax
	lea	ax,word ptr [bp-160]
	push	ax
	lea	ax,word ptr [bp-396]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;							i++;
   ;	
	inc	word ptr [bp-4]
   ;	
   ;							gotoxy(14,6+i);
   ;	
	mov	ax,word ptr [bp-4]
	add	ax,6
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;							cout<<i<<") NAME :"<<b<<" ID :"<<a;
   ;	
	mov	ax,word ptr [bp-8]
	cwd	
	push	dx
	push	ax
	mov	ax,word ptr [bp-4]
	cwd	
	push	dx
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	si,ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2244
	push	ax
	push	si
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-396]
	push	ax
	push	si
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2253
	push	ax
	push	si
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	push	si
	call	near ptr @ostream@$blsh$ql
	add	sp,6
@16@1370:
	mov	ax,206
	push	ax
	lea	ax,word ptr [bp-266]
	push	ax
	lea	ax,word ptr [bp-306]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-6],ax
	mov	bx,word ptr [bp-6]
	test	word ptr [bx+4],134
	je	short @16@1418
	xor	ax,ax
	jmp	short @16@1442
@16@1418:
	mov	ax,word ptr [bp-6]
@16@1442:
	or	ax,ax
	je	@@20
	jmp	@16@1346
@@20:
   ;	
   ;						}
   ;						if(i==0)
   ;	
	cmp	word ptr [bp-4],0
	jne	short @16@1514
   ;	
   ;						{	gotoxy(14,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;							cout<<"NO PASSENGERS FOUND!!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2259
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
@16@1514:
   ;	
   ;						}
   ;						getch();
   ;	
	call	near ptr _getch
   ;	
   ;						f.close();
   ;	
	lea	ax,word ptr [bp-346]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-346]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	short @16@1610
@16@1562:
   ;	
   ;					}
   ;					else if(o==5)
   ;	
	cmp	di,5
	jne	short @16@1610
	jmp	short @16@1826
@16@1610:
	jmp	short @16@1802
@16@1634:
   ;	
   ;						break;
   ;				}
   ;				else if(a==0)
   ;	
	cmp	word ptr [bp-2],0
	jne	short @16@1802
   ;	
   ;				{	a=getch();
   ;	
	call	near ptr _getch
	mov	word ptr [bp-2],ax
   ;	
   ;					if(a==80 && o<5)
   ;	
	cmp	word ptr [bp-2],80
	jne	short @16@1730
	cmp	di,5
	jge	short @16@1730
   ;	
   ;						o++;
   ;	
	inc	di
	jmp	short @16@1802
@16@1730:
   ;	
   ;					else if(a==72 && o>1)
   ;	
	cmp	word ptr [bp-2],72
	jne	short @16@1802
	cmp	di,1
	jle	short @16@1802
   ;	
   ;						o--;
   ;	
	dec	di
@16@1802:
	jmp	@16@98
@16@1826:
   ;	
   ;				}
   ;			}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@reserved$qv	endp
   ;	
   ;	int entr(train &ob,int id)   // id is of passenger not of train as required for o3
   ;	
	assume	cs:_TEXT
@entr$qr5traini	proc	near
	push	bp
	mov	bp,sp
	sub	sp,86
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{	ifstream f("infot.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+2281
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;		int a;
   ;		clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;		o3b;
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
	mov	ax,offset DGROUP:s@+2291
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
	mov	ax,word ptr [bp+6]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2302
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
   ;		cout<<"ENTER THE TRAIN ID:";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2307
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
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
	jmp	short @17@98
@17@50:
   ;	
   ;		while(f.read((char *)&ob,sizeof(ob)))
   ;		if(ob.ret_id()==a)
   ;	
	mov	ax,word ptr [di]
	cmp	ax,word ptr [bp-2]
	jne	short @17@98
   ;	
   ;			return 1;
   ;	
	mov	word ptr [bp-4],1
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-4]
	jmp	short @17@218
@17@98:
	mov	ax,80
	push	ax
	push	di
	lea	ax,word ptr [bp-46]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	si,word ptr [bx]
	test	word ptr [si+4],134
	je	short @17@146
	xor	ax,ax
	jmp	short @17@170
@17@146:
	mov	ax,si
@17@170:
	or	ax,ax
	jne	short @17@50
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
	jmp	short @17@218
@17@218:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@entr$qr5traini	endp
   ;	
   ;	void plan_j(train ob,int id)
   ;	
	assume	cs:_TEXT
@plan_j$q5traini	proc	near
	push	bp
	mov	bp,sp
	sub	sp,276
	push	si
	push	di
   ;	
   ;	{      	o4;
   ;	
	call	near ptr _clrscr
	mov	ax,3
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2327
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
	mov	ax,word ptr [bp+6]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2338
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	ax,5
	push	ax
	mov	ax,27
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	mov	bx,word ptr [bp+4]
	mov	ax,word ptr [bx]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2343
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
   ;		cout<<"ENTER THE NO. OF STATIONS THROUGH WHICH THIS TRAIN PASSES :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2353
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		int a;
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
   ;		if(a>1 && a<=10)
   ;	
	cmp	word ptr [bp-2],1
	jg	@@21
	jmp	@18@698
@@21:
	cmp	word ptr [bp-2],10
	jle	@@22
	jmp	@18@698
@@22:
   ;	
   ;		{       int i=0,b[10];
   ;	
	mov	word ptr [bp-6],0
@18@98:
   ;	
   ;			do
   ;			{	o4;
   ;	
	call	near ptr _clrscr
	mov	ax,3
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2413
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
	mov	ax,word ptr [bp+6]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2424
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	ax,5
	push	ax
	mov	ax,27
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	mov	bx,word ptr [bp+4]
	mov	ax,word ptr [bx]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2429
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
   ;				int ci=0;
   ;	
	xor	si,si
	jmp	short @18@194
@18@146:
   ;	
   ;				for(;ci<i;ci++)
   ;				{	gotoxy(14,7+ci);
   ;	
	mov	ax,si
	add	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<ci+1<<") STATION NO."<<b[ci];
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-36]
	add	bx,ax
	mov	ax,word ptr [bx]
	cwd	
	push	dx
	push	ax
	mov	ax,si
	inc	ax
	cwd	
	push	dx
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	word ptr [bp-10],ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2439
	push	ax
	push	word ptr [bp-10]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	push	word ptr [bp-10]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	inc	si
@18@194:
	cmp	si,word ptr [bp-6]
	jl	short @18@146
   ;	
   ;				}
   ;				gotoxy(14,7+ci);
   ;	
	mov	ax,si
	add	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"ENTER THE STAION NO.THROUGH WHICH THE TRAIN PASSES";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2453
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(14,10+ci);
   ;	
	mov	ax,si
	add	ax,10
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"ENTER THE STATION NO.:";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2504
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				int d,flag=0;
   ;	
	mov	word ptr [bp-14],0
   ;	
   ;				cin>>d;
   ;	
	lea	ax,word ptr [bp-12]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;				ifstream f("idst.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+2527
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-276]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @18@290
@18@242:
   ;	
   ;				idc p;
   ;				while(f.read((char *)&p,sizeof(p)))
   ;					if(p.ret_id()==d)
   ;	
	mov	ax,word ptr [bp-16]
	cmp	ax,word ptr [bp-12]
	jne	short @18@290
   ;	
   ;					{	b[i++]=d;
   ;	
	mov	ax,word ptr [bp-6]
	inc	word ptr [bp-6]
	shl	ax,1
	lea	bx,word ptr [bp-36]
	add	bx,ax
	mov	ax,word ptr [bp-12]
	mov	word ptr [bx],ax
   ;	
   ;						flag=1;
   ;	
	mov	word ptr [bp-14],1
	jmp	short @18@386
@18@290:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-16]
	push	ax
	lea	ax,word ptr [bp-236]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	di,word ptr [bx]
	test	word ptr [di+4],134
	je	short @18@338
	xor	ax,ax
	jmp	short @18@362
@18@338:
	mov	ax,di
@18@362:
	or	ax,ax
	jne	short @18@242
@18@386:
   ;	
   ;						break;
   ;					}
   ;				f.close();
   ;	
	lea	ax,word ptr [bp-276]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;				if(flag==0)
   ;	
	cmp	word ptr [bp-14],0
	jne	short @18@434
   ;	
   ;				{	gotoxy(14,9+ci);
   ;	
	mov	ax,si
	add	ax,9
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<"ERROR INVALID STATION ID!!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2536
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					getch();
   ;	
	call	near ptr _getch
@18@434:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-276]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
   ;	
   ;				}
   ;			}while(i!=a);
   ;	
	mov	ax,word ptr [bp-6]
	cmp	ax,word ptr [bp-2]
	je	@@23
	jmp	@18@98
@@23:
   ;	
   ;			ob.journey(a,b);
   ;	
	lea	ax,word ptr [bp-36]
	push	ax
	push	word ptr [bp-2]
	push	word ptr [bp+4]
	call	near ptr @train@journey$qipi
	add	sp,6
   ;	
   ;			ifstream f1("infot.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+2563
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-116]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;			train temp;
   ;	
	mov	word ptr [bp-174],0
	mov	word ptr [bp-168],0
	jmp	short @18@554
@18@506:
   ;	
   ;			while(f1.read((char *)&temp,sizeof(temp)))
   ;				if(temp.ret_id()==ob.ret_id())
   ;	
	mov	bx,word ptr [bp+4]
	mov	ax,word ptr [bx]
	cmp	ax,word ptr [bp-196]
	jne	short @18@554
   ;	
   ;				{	ofstream f2("infot.dat",ios::binary|ios::ate);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,132
	push	ax
	mov	ax,offset DGROUP:s@+2573
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-274]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;					f2.seekp(f1.tellg()-sizeof(ob),ios::beg);
   ;	
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-76]
	push	ax
	call	near ptr @istream@tellg$qv
	pop	cx
	add	ax,65456
	adc	dx,65535
	push	dx
	push	ax
	lea	ax,word ptr [bp-234]
	push	ax
	call	near ptr @ostream@seekp$ql8seek_dir
	add	sp,8
   ;	
   ;					f2.write((char *)&ob,sizeof(ob));
   ;	
	mov	ax,80
	push	ax
	push	word ptr [bp+4]
	lea	ax,word ptr [bp-234]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;					f2.close();
   ;	
	lea	ax,word ptr [bp-274]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-274]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	short @18@650
@18@554:
	mov	ax,80
	push	ax
	lea	ax,word ptr [bp-196]
	push	ax
	lea	ax,word ptr [bp-76]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-8],ax
	mov	bx,word ptr [bp-8]
	test	word ptr [bx+4],134
	je	short @18@602
	xor	ax,ax
	jmp	short @18@626
@18@602:
	mov	ax,word ptr [bp-8]
@18@626:
	or	ax,ax
	je	@@24
	jmp	@18@506
@@24:
@18@650:
   ;	
   ;					break;
   ;				}
   ;			f1.close();
   ;	
	lea	ax,word ptr [bp-116]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			o4;
   ;	
	call	near ptr _clrscr
	mov	ax,3
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2583
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
	mov	ax,word ptr [bp+6]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2594
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	ax,5
	push	ax
	mov	ax,27
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	mov	bx,word ptr [bp+4]
	mov	ax,word ptr [bx]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2599
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
   ;			cout<<"JOURNEY SUSSESSFULLY PLANED!!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2609
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			getch();
   ;	
	call	near ptr _getch
   ;	
   ;			ob.show();
   ;	
	push	word ptr [bp+4]
	call	near ptr @train@show$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-116]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	short @18@722
@18@698:
   ;	
   ;		}
   ;		else
   ;		{       gotoxy(14,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"ERROR!! CANNOT ADD "<<a<<" TRAINS";
   ;	
	mov	ax,word ptr [bp-2]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2639
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	word ptr [bp-4],ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2659
	push	ax
	push	word ptr [bp-4]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			getch();
   ;	
	call	near ptr _getch
@18@722:
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@plan_j$q5traini	endp
   ;	
   ;	int emp_login()
   ;	
	assume	cs:_TEXT
@emp_login$qv	proc	near
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
	mov	ax,offset DGROUP:s@+2667
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
	mov	ax,offset DGROUP:s@+2678
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
   ;		ifstream f("ide.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+2690
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @19@98
@19@50:
   ;	
   ;		idc o;
   ;		while(f.read((char *)&o,sizeof(o)))
   ;			if(o.ret_id()==l)
   ;	
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-2]
	jne	short @19@98
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
	jmp	short @19@218
@19@98:
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
	je	short @19@146
	xor	ax,ax
	jmp	short @19@170
@19@146:
	mov	ax,si
@19@170:
	or	ax,ax
	jne	short @19@50
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
	mov	ax,offset DGROUP:s@+2698
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
	jmp	short @19@218
@19@218:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@emp_login$qv	endp
   ;	
   ;	void e_login()
   ;	
	assume	cs:_TEXT
@e_login$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,248
	push	si
	push	di
   ;	
   ;	{	int id=emp_login();
   ;	
	call	near ptr @emp_login$qv
	mov	word ptr [bp-2],ax
   ;	
   ;		if(id!=0)
   ;	
	cmp	word ptr [bp-2],0
	jne	@@25
	jmp	@20@1850
@@25:
   ;	
   ;		{       for(int o=1;;)
   ;	
	mov	si,1
@20@74:
   ;	
   ;			{	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;				o3b;
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
	mov	ax,offset DGROUP:s@+2719
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
	mov	ax,offset DGROUP:s@+2730
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
   ;				gotoxy(13,6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"-EMPLYOEE ZONE ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2735
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(13,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"-ENTER A NEW STATION";  //O=1
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2751
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
   ;				cout<<"-INFO OF A STAION";     //O=2
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2772
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
   ;				cout<<"-ENTER A NEW TRAIN";   //O=3
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2790
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
   ;				cout<<"-INFO OF A TRAIN";     //O=4
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2809
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
   ;				cout<<"-PLAN A JOURNEY OF A TRAIN"; //O=5
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2826
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(13,14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"-EXIT";     //O=6
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2853
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				if(o==1)
   ;	
	cmp	si,1
	jne	short @20@122
   ;	
   ;					gotoxy(12,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @20@362
@20@122:
   ;	
   ;				else if(o==2)
   ;	
	cmp	si,2
	jne	short @20@170
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
	jmp	short @20@362
@20@170:
   ;	
   ;				else if(o==3)
   ;	
	cmp	si,3
	jne	short @20@218
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
	jmp	short @20@362
@20@218:
   ;	
   ;				else if(o==4)
   ;	
	cmp	si,4
	jne	short @20@266
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
	jmp	short @20@362
@20@266:
   ;	
   ;				else if(o==5)
   ;	
	cmp	si,5
	jne	short @20@314
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
	jmp	short @20@362
@20@314:
   ;	
   ;				else if(o==6)
   ;	
	cmp	si,6
	jne	short @20@362
   ;	
   ;					gotoxy(12,14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
@20@362:
   ;	
   ;				cout<<"->";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2859
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				int b=getch();
   ;	
	call	near ptr _getch
	mov	word ptr [bp-4],ax
   ;	
   ;				if(b==13)
   ;	
	cmp	word ptr [bp-4],13
	je	@@26
	jmp	@20@1658
@@26:
   ;	
   ;				{       if(o==6)
   ;	
	cmp	si,6
	jne	short @20@482
	jmp	@20@1850
	jmp	@20@1634
@20@482:
   ;	
   ;						break;
   ;					else if(o==1)
   ;	
	cmp	si,1
	jne	short @20@554
   ;	
   ;					{	station ob;
   ;						ob.create_ob();
   ;	
	lea	ax,word ptr [bp-82]
	push	ax
	call	near ptr @station@create_ob$qv
	pop	cx
   ;	
   ;						ofstream f("infost.dat",ios::binary|ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,136
	push	ax
	mov	ax,offset DGROUP:s@+2862
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-160]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;						f.write((char *)&ob,sizeof(ob));
   ;	
	mov	ax,74
	push	ax
	lea	ax,word ptr [bp-82]
	push	ax
	lea	ax,word ptr [bp-120]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;						f.close();
   ;	
	lea	ax,word ptr [bp-160]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-160]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	@20@1634
@20@554:
   ;	
   ;					}
   ;					else if(o==2)
   ;	
	cmp	si,2
	je	@@27
	jmp	@20@842
@@27:
   ;	
   ;					{	station ob;
   ;						ifstream f("infost.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+2873
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-162]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;						int a,flag=0;
   ;	
	mov	word ptr [bp-8],0
   ;	
   ;						clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;						o3b;
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
	mov	ax,offset DGROUP:s@+2884
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
	mov	ax,offset DGROUP:s@+2895
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
   ;						gotoxy(14,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;						cout<<"ENTER THE STATION ID:";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2900
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;						cin>>a;
   ;	
	lea	ax,word ptr [bp-6]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
	jmp	short @20@650
@20@602:
   ;	
   ;						while(f.read((char *)&ob,sizeof(ob)))
   ;							if(ob.ret_id()==a)
   ;	
	mov	ax,word ptr [bp-82]
	cmp	ax,word ptr [bp-6]
	jne	short @20@650
   ;	
   ;							{       flag=1;
   ;	
	mov	word ptr [bp-8],1
   ;	
   ;								ob.show();
   ;	
	lea	ax,word ptr [bp-82]
	push	ax
	call	near ptr @station@show$qv
	pop	cx
	jmp	short @20@746
@20@650:
	mov	ax,74
	push	ax
	lea	ax,word ptr [bp-82]
	push	ax
	lea	ax,word ptr [bp-122]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	di,word ptr [bx]
	test	word ptr [di+4],134
	je	short @20@698
	xor	ax,ax
	jmp	short @20@722
@20@698:
	mov	ax,di
@20@722:
	or	ax,ax
	jne	short @20@602
@20@746:
   ;	
   ;								break;
   ;							}
   ;						if(flag==0)
   ;	
	cmp	word ptr [bp-8],0
	jne	short @20@794
   ;	
   ;						{       gotoxy(14,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;							cout<<"ERROR!! INVALID ID!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2922
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;							getch();
   ;	
	call	near ptr _getch
@20@794:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-162]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	@20@1634
@20@842:
   ;	
   ;						}
   ;					}
   ;					else if(o==3)
   ;	
	cmp	si,3
	jne	short @20@914
   ;	
   ;					{	train ob;
   ;	
	mov	word ptr [bp-66],0
	mov	word ptr [bp-60],0
   ;	
   ;						ob.create_ob();
   ;	
	lea	ax,word ptr [bp-88]
	push	ax
	call	near ptr @train@create_ob$qv
	pop	cx
   ;	
   ;						ofstream f("infot.dat",ios::binary|ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,136
	push	ax
	mov	ax,offset DGROUP:s@+2942
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-166]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;						f.write((char *)&ob,sizeof(ob));
   ;	
	mov	ax,80
	push	ax
	lea	ax,word ptr [bp-88]
	push	ax
	lea	ax,word ptr [bp-126]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;						f.close();
   ;	
	lea	ax,word ptr [bp-166]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-166]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	@20@1634
@20@914:
   ;	
   ;					}
   ;					else if(o==4 || o==5)
   ;	
	cmp	si,4
	je	short @20@962
	cmp	si,5
	je	@@28
	jmp	@20@1634
@@28:
@20@962:
   ;	
   ;					{	train ob;
   ;	
	mov	word ptr [bp-66],0
	mov	word ptr [bp-60],0
   ;	
   ;						int a=entr(ob,id);
   ;	
	push	word ptr [bp-2]
	lea	ax,word ptr [bp-88]
	push	ax
	call	near ptr @entr$qr5traini
	pop	cx
	pop	cx
	mov	word ptr [bp-6],ax
   ;	
   ;						if(a)
   ;	
	cmp	word ptr [bp-6],0
	jne	@@29
	jmp	@20@1610
@@29:
   ;	
   ;						{       if(o==4)
   ;	
	cmp	si,4
	jne	short @20@1034
   ;	
   ;								ob.show();
   ;	
	lea	ax,word ptr [bp-88]
	push	ax
	call	near ptr @train@show$qv
	pop	cx
	jmp	@20@1586
@20@1034:
   ;	
   ;							else if(o==5)
   ;	
	cmp	si,5
	je	@@30
	jmp	@20@1586
@@30:
   ;	
   ;							{       if(ob.ret_c()==0)
   ;	
	cmp	word ptr [bp-66],0
	jne	short @20@1106
   ;	
   ;									plan_j(ob,id);
   ;	
	push	word ptr [bp-2]
	mov	ax,word ptr [bp-88]
	mov	word ptr [bp-168],ax
	lea	ax,word ptr [bp-166]
	push	ss
	push	ax
	lea	ax,word ptr [bp-86]
	push	ss
	push	ax
	mov	cx,20
	call	near ptr N_SCOPY@
	mov	ax,word ptr [bp-66]
	mov	word ptr [bp-146],ax
	mov	ax,word ptr [bp-64]
	mov	word ptr [bp-144],ax
	mov	ax,word ptr [bp-62]
	mov	word ptr [bp-142],ax
	mov	ax,word ptr [bp-60]
	mov	word ptr [bp-140],ax
	lea	ax,word ptr [bp-138]
	push	ss
	push	ax
	lea	ax,word ptr [bp-58]
	push	ss
	push	ax
	mov	cx,50
	call	near ptr N_SCOPY@
	lea	ax,word ptr [bp-168]
	push	ax
	call	near ptr @plan_j$q5traini
	pop	cx
	pop	cx
	jmp	@20@1586
@20@1106:
   ;	
   ;								else if(ob.ret_c()==1)
   ;	
	cmp	word ptr [bp-66],1
	je	@@31
	jmp	@20@1586
@@31:
   ;	
   ;								{       for(int s=1;;)
   ;	
	mov	di,1
@20@1154:
   ;	
   ;									{       o4;
   ;	
	call	near ptr _clrscr
	mov	ax,3
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2952
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
	mov	ax,offset DGROUP:s@+2963
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	ax,5
	push	ax
	mov	ax,27
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-88]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2968
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
   ;										gotoxy(14,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;										cout<<"JOURNEY ALREADY PLANNED!!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2978
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;										gotoxy(14,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;										cout<<"-PLAN THE JOURNEY AGAIN";  //s=1
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3004
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;										gotoxy(14,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;										cout<<"-RETURN TO PREVIOS MENU";   //s=2
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3028
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;										if(s==1)
   ;	
	cmp	di,1
	jne	short @20@1202
   ;	
   ;											gotoxy(13,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @20@1250
@20@1202:
   ;	
   ;										else if(s==2)
   ;	
	cmp	di,2
	jne	short @20@1250
   ;	
   ;											gotoxy(13,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
@20@1250:
   ;	
   ;										cout<<"->";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3052
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;										int g=getch();
   ;	
	call	near ptr _getch
	mov	word ptr [bp-8],ax
   ;	
   ;										if(g==13)
   ;	
	cmp	word ptr [bp-8],13
	jne	short @20@1346
	jmp	short @20@1538
	jmp	short @20@1514
@20@1346:
   ;	
   ;											break;
   ;										else if(g==0)
   ;	
	cmp	word ptr [bp-8],0
	jne	short @20@1514
   ;	
   ;										{	g=getch();
   ;	
	call	near ptr _getch
	mov	word ptr [bp-8],ax
   ;	
   ;											if(g==80 && s==1)
   ;	
	cmp	word ptr [bp-8],80
	jne	short @20@1442
	cmp	di,1
	jne	short @20@1442
   ;	
   ;												s=2;
   ;	
	mov	di,2
	jmp	short @20@1514
@20@1442:
   ;	
   ;											else if(g==72 && s==2)
   ;	
	cmp	word ptr [bp-8],72
	jne	short @20@1514
	cmp	di,2
	jne	short @20@1514
   ;	
   ;												s=1;
   ;	
	mov	di,1
@20@1514:
	jmp	@20@1154
@20@1538:
   ;	
   ;										}
   ;									}
   ;									if(s==1)
   ;	
	cmp	di,1
	jne	short @20@1586
   ;	
   ;										plan_j(ob,id);
   ;	
	push	word ptr [bp-2]
	mov	ax,word ptr [bp-88]
	mov	word ptr [bp-248],ax
	lea	ax,word ptr [bp-246]
	push	ss
	push	ax
	lea	ax,word ptr [bp-86]
	push	ss
	push	ax
	mov	cx,20
	call	near ptr N_SCOPY@
	mov	ax,word ptr [bp-66]
	mov	word ptr [bp-226],ax
	mov	ax,word ptr [bp-64]
	mov	word ptr [bp-224],ax
	mov	ax,word ptr [bp-62]
	mov	word ptr [bp-222],ax
	mov	ax,word ptr [bp-60]
	mov	word ptr [bp-220],ax
	lea	ax,word ptr [bp-218]
	push	ss
	push	ax
	lea	ax,word ptr [bp-58]
	push	ss
	push	ax
	mov	cx,50
	call	near ptr N_SCOPY@
	lea	ax,word ptr [bp-248]
	push	ax
	call	near ptr @plan_j$q5traini
	pop	cx
	pop	cx
@20@1586:
	jmp	short @20@1634
@20@1610:
   ;	
   ;								}
   ;							}
   ;						}
   ;						else
   ;						{	gotoxy(14,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;							cout<<"ERROR!! INVALID ID!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3055
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;							getch();
   ;	
	call	near ptr _getch
@20@1634:
	jmp	short @20@1826
@20@1658:
   ;	
   ;						}
   ;					}
   ;				}
   ;				else if(b==0)
   ;	
	cmp	word ptr [bp-4],0
	jne	short @20@1826
   ;	
   ;				{	b=getch();
   ;	
	call	near ptr _getch
	mov	word ptr [bp-4],ax
   ;	
   ;					if(b==80 && o<6)
   ;	
	cmp	word ptr [bp-4],80
	jne	short @20@1754
	cmp	si,6
	jge	short @20@1754
   ;	
   ;						o++;
   ;	
	inc	si
	jmp	short @20@1826
@20@1754:
   ;	
   ;					else if(b==72 && o>1)
   ;	
	cmp	word ptr [bp-4],72
	jne	short @20@1826
	cmp	si,1
	jle	short @20@1826
   ;	
   ;						o--;
   ;	
	dec	si
@20@1826:
	jmp	@20@74
@20@1850:
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
@e_login$qv	endp
   ;	
   ;	void p_main()
   ;	
	assume	cs:_TEXT
@p_main$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,498
	push	si
	push	di
   ;	
   ;	{       int id,flag=0;
   ;	
	mov	word ptr [bp-4],0
   ;	
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
	mov	ax,offset DGROUP:s@+3075
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
	mov	ax,offset DGROUP:s@+3086
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		cin>>id;
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
	mov	ax,offset DGROUP:s@+3098
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-112]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @21@98
@21@50:
   ;	
   ;		idc o;
   ;		while(f.read((char *)&o,sizeof(o)))
   ;			if(o.ret_id()==id)
   ;	
	mov	ax,word ptr [bp-6]
	cmp	ax,word ptr [bp-2]
	jne	short @21@98
   ;	
   ;			{       flag=1;
   ;	
	mov	word ptr [bp-4],1
	jmp	short @21@194
@21@98:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-6]
	push	ax
	lea	ax,word ptr [bp-72]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-8],ax
	mov	bx,word ptr [bp-8]
	test	word ptr [bx+4],134
	je	short @21@146
	xor	ax,ax
	jmp	short @21@170
@21@146:
	mov	ax,word ptr [bp-8]
@21@170:
	or	ax,ax
	jne	short @21@50
@21@194:
   ;	
   ;				break;
   ;			}
   ;		if(flag==0)
   ;	
	cmp	word ptr [bp-4],0
	jne	short @21@242
   ;	
   ;		{	gotoxy(14,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"ERROR INCORRECT ID!!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3105
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			getch();
   ;	
	call	near ptr _getch
	jmp	@21@1346
@21@242:
   ;	
   ;		}
   ;		else
   ;		{       pass ob1;
   ;			ifstream f1("infoc.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+3126
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-398]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @21@314
@21@266:
   ;	
   ;			while(f1.read((char *)&ob1,sizeof(ob1)))
   ;				if(ob1.ret_id()==id)
   ;	
	mov	ax,word ptr [bp-318]
	cmp	ax,word ptr [bp-2]
	jne	short @21@314
	jmp	short @21@410
@21@314:
	mov	ax,206
	push	ax
	lea	ax,word ptr [bp-318]
	push	ax
	lea	ax,word ptr [bp-358]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-10],ax
	mov	bx,word ptr [bp-10]
	test	word ptr [bx+4],134
	je	short @21@362
	xor	ax,ax
	jmp	short @21@386
@21@362:
	mov	ax,word ptr [bp-10]
@21@386:
	or	ax,ax
	jne	short @21@266
@21@410:
   ;	
   ;					break;
   ;			for(int o=1;;)
   ;	
	mov	word ptr [bp-12],1
@21@434:
   ;	
   ;			{	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;				o3b;
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
	mov	ax,offset DGROUP:s@+3136
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
	mov	ax,offset DGROUP:s@+3147
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
   ;				gotoxy(13,6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"-PASSENGER ZONE ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3152
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(13,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"-BOOK A TICKET";  //O=1
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3169
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
   ;				cout<<"-VIEW PNR OF BOOKED TICKETS";     //O=2
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3184
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
   ;				cout<<"-EXIT";     //O=3
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3212
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				if(o==1)
   ;	
	cmp	word ptr [bp-12],1
	jne	short @21@482
   ;	
   ;					gotoxy(12,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @21@578
@21@482:
   ;	
   ;				else if(o==2)
   ;	
	cmp	word ptr [bp-12],2
	jne	short @21@530
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
	jmp	short @21@578
@21@530:
   ;	
   ;				else if(o==3)
   ;	
	cmp	word ptr [bp-12],3
	jne	short @21@578
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
@21@578:
   ;	
   ;				cout<<"->";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3218
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				int b=getch();
   ;	
	call	near ptr _getch
	mov	word ptr [bp-14],ax
   ;	
   ;				if(b==13)
   ;	
	cmp	word ptr [bp-14],13
	je	@@32
	jmp	@21@1130
@@32:
   ;	
   ;				{       if(o==1)
   ;	
	cmp	word ptr [bp-12],1
	je	@@33
	jmp	@21@746
@@33:
   ;	
   ;					{	int a=booktic(id);
   ;	
	push	word ptr [bp-2]
	call	near ptr @booktic$qi
	pop	cx
	mov	si,ax
   ;	
   ;						if(a)
   ;	
	or	si,si
	je	short @21@722
   ;	
   ;						{	ob1.addpnr(a);
   ;	
	mov	ax,word ptr [bp-216]
	shl	ax,1
	lea	bx,word ptr [bp-316]
	add	bx,ax
	mov	word ptr [bx],si
	inc	word ptr [bp-216]
   ;	
   ;							ofstream f2("infoc.dat",ios::ate);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,4
	push	ax
	mov	ax,offset DGROUP:s@+3221
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-476]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;							f2.seekp(f1.tellg()-sizeof(ob1),ios::beg);
   ;	
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-358]
	push	ax
	call	near ptr @istream@tellg$qv
	pop	cx
	add	ax,65330
	adc	dx,65535
	push	dx
	push	ax
	lea	ax,word ptr [bp-436]
	push	ax
	call	near ptr @ostream@seekp$ql8seek_dir
	add	sp,8
   ;	
   ;							f2.write((char *)&ob1,sizeof(ob1));
   ;	
	mov	ax,206
	push	ax
	lea	ax,word ptr [bp-318]
	push	ax
	lea	ax,word ptr [bp-436]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;							f2.close();
   ;	
	lea	ax,word ptr [bp-476]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-476]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
@21@722:
	jmp	@21@1106
@21@746:
   ;	
   ;						}
   ;					}
   ;					else if(o==2)
   ;	
	cmp	word ptr [bp-12],2
	je	@@34
	jmp	@21@1058
@@34:
   ;	
   ;					{       clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;						o3b;
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
	mov	ax,offset DGROUP:s@+3231
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
	mov	ax,offset DGROUP:s@+3242
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
   ;						int d=0,pnr[50];
   ;	
	mov	word ptr [bp-16],0
   ;	
   ;						ob1.ret_info(d,pnr);
   ;	
	lea	ax,word ptr [bp-498]
	push	ax
	lea	ax,word ptr [bp-16]
	push	ax
	lea	ax,word ptr [bp-318]
	push	ax
	call	near ptr @pass@ret_info$qripi
	add	sp,6
   ;	
   ;						if(d>0)
   ;	
	cmp	word ptr [bp-16],0
	jg	@@35
	jmp	@21@986
@@35:
   ;	
   ;						{	gotoxy(14,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;							cout<<"BOOKED TICKETS ARE :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3247
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;							for(int i=0;i<d;i++)
   ;	
	xor	si,si
	jmp	@21@938
@21@866:
   ;	
   ;							{	gotoxy(12,9+i);
   ;	
	mov	ax,si
	add	ax,9
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;								cout<<setw(2)<<setiosflags(ios::right)<<i+1<<")"<<pnr[i];
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-498]
	add	bx,ax
	mov	ax,word ptr [bx]
	cwd	
	push	dx
	push	ax
	mov	ax,si
	inc	ax
	cwd	
	push	dx
	push	ax
	mov	ax,2
	push	ax
	push	ds
	lea	ax,word ptr [bp-20]
	push	ax
	call	near ptr @setw$qi
	add	sp,6
	lea	ax,word ptr [bp-20]
	mov	word ptr [bp-22],ax
	mov	bx,word ptr [bp-22]
	push	word ptr [bx+2]
	push	word ptr DGROUP:_cout
	mov	bx,word ptr [bp-22]
	call	word ptr [bx]
	pop	cx
	pop	cx
	mov	word ptr [bp-30],offset DGROUP:_cout
	xor	ax,ax
	mov	dx,4
	push	ax
	push	dx
	push	ds
	lea	ax,word ptr [bp-28]
	push	ax
	call	near ptr @setiosflags$ql
	add	sp,8
	lea	ax,word ptr [bp-28]
	mov	di,ax
	push	word ptr [di+4]
	push	word ptr [di+2]
	mov	bx,word ptr [bp-30]
	push	word ptr [bx]
	call	word ptr [di]
	add	sp,6
	push	word ptr [bp-30]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	word ptr [bp-32],ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3268
	push	ax
	push	word ptr [bp-32]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	push	word ptr [bp-32]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	inc	si
@21@938:
	cmp	si,word ptr [bp-16]
	jge	@@36
	jmp	@21@866
@@36:
	jmp	short @21@1010
@21@986:
   ;	
   ;							}
   ;						}
   ;						else
   ;						{	gotoxy(14,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;							cout<<"ERROR!! NO BOOKED TICKETS FOUND!!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3270
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
@21@1010:
   ;	
   ;						}
   ;						getch();
   ;	
	call	near ptr _getch
	jmp	short @21@1106
@21@1058:
   ;	
   ;					}
   ;					else if(o==3)
   ;	
	cmp	word ptr [bp-12],3
	jne	short @21@1106
	jmp	short @21@1322
@21@1106:
	jmp	short @21@1298
@21@1130:
   ;	
   ;						break;
   ;				}
   ;				else if(b==0)
   ;	
	cmp	word ptr [bp-14],0
	jne	short @21@1298
   ;	
   ;				{	b=getch();
   ;	
	call	near ptr _getch
	mov	word ptr [bp-14],ax
   ;	
   ;					if(b==80 && o<3)
   ;	
	cmp	word ptr [bp-14],80
	jne	short @21@1226
	cmp	word ptr [bp-12],3
	jge	short @21@1226
   ;	
   ;						o++;
   ;	
	inc	word ptr [bp-12]
	jmp	short @21@1298
@21@1226:
   ;	
   ;					else if(b==72 && o>1)
   ;	
	cmp	word ptr [bp-14],72
	jne	short @21@1298
	cmp	word ptr [bp-12],1
	jle	short @21@1298
   ;	
   ;						o--;
   ;	
	dec	word ptr [bp-12]
@21@1298:
	jmp	@21@434
@21@1322:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-398]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
@21@1346:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-112]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
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
@p_main$qv	endp
   ;	
   ;	int select_st(int &st)
   ;	
	assume	cs:_TEXT
@select_st$qri	proc	near
	push	bp
	mov	bp,sp
	sub	sp,212
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{	ifstream f("infost.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+3304
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-88]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;		int i=0;
   ;	
	mov	word ptr [bp-2],0
	jmp	short @22@98
@22@50:
   ;	
   ;		station ob;
   ;		while(f.read((char *)&ob,sizeof(ob)))
   ;		{	i++;
   ;	
	inc	word ptr [bp-2]
   ;	
   ;			int a;
   ;			char b[50];
   ;			ob.ret_info(a,b);
   ;	
	mov	ax,word ptr [bp-162]
	mov	word ptr [bp-8],ax
	lea	ax,word ptr [bp-138]
	push	ax
	lea	ax,word ptr [bp-212]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;			gotoxy(13,10+i);
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,10
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-"<<b;
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3315
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	di,offset DGROUP:_cout
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-212]
	push	ax
	push	di
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
@22@98:
	mov	ax,74
	push	ax
	lea	ax,word ptr [bp-162]
	push	ax
	lea	ax,word ptr [bp-48]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-4],ax
	mov	bx,word ptr [bp-4]
	test	word ptr [bx+4],134
	je	short @22@146
	xor	ax,ax
	jmp	short @22@170
@22@146:
	mov	ax,word ptr [bp-4]
@22@170:
	or	ax,ax
	jne	short @22@50
   ;	
   ;		}
   ;		f.close();
   ;	
	lea	ax,word ptr [bp-88]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;		if(i==0)
   ;	
	cmp	word ptr [bp-2],0
	jne	short @22@242
   ;	
   ;			return 0;
   ;	
	mov	word ptr [bp-6],0
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-88]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-6]
	jmp	@22@554
@22@242:
   ;	
   ;		for(;;)
   ;		{	gotoxy(12,10+st);
   ;	
	mov	ax,word ptr [si]
	add	ax,10
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"->";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3317
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
   ;			if(a==13)
   ;	
	cmp	di,13
	jne	short @22@362
   ;	
   ;			{       gotoxy(12,10+st);
   ;	
	mov	ax,word ptr [si]
	add	ax,10
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<" ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3320
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				return 1;
   ;	
	mov	word ptr [bp-8],1
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-88]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-8]
	jmp	short @22@554
	jmp	short @22@530
@22@362:
   ;	
   ;			}
   ;			else if(a==0)
   ;	
	or	di,di
	jne	short @22@530
   ;	
   ;			{	a=getch();
   ;	
	call	near ptr _getch
	mov	di,ax
   ;	
   ;				gotoxy(12,10+st);
   ;	
	mov	ax,word ptr [si]
	add	ax,10
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<" -";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3322
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				if(a==80 && st<i)
   ;	
	cmp	di,80
	jne	short @22@458
	mov	ax,word ptr [si]
	cmp	ax,word ptr [bp-2]
	jge	short @22@458
   ;	
   ;					st++;
   ;	
	inc	word ptr [si]
	jmp	short @22@530
@22@458:
   ;	
   ;				else if(a==72 && st>1)
   ;	
	cmp	di,72
	jne	short @22@530
	cmp	word ptr [si],1
	jle	short @22@530
   ;	
   ;					st--;
   ;	
	dec	word ptr [si]
@22@530:
	jmp	@22@242
@22@554:
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
@select_st$qri	endp
   ;	
   ;	int booktic(int id)
   ;	
	assume	cs:_TEXT
@booktic$qi	proc	near
	push	bp
	mov	bp,sp
	sub	sp,1442
	push	si
	push	di
   ;	
   ;	{	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;		int st1=1;
   ;	
	mov	word ptr [bp-2],1
   ;	
   ;		o3b;
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
	mov	ax,offset DGROUP:s@+3325
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
	mov	ax,offset DGROUP:s@+3336
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
   ;		gotoxy(25,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"TICKET BOOKING";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3341
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gotoxy(14,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"FROM STATION -";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3356
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		if(select_st(st1))
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	call	near ptr @select_st$qri
	pop	cx
	or	ax,ax
	jne	@@37
	jmp	@23@1466
@@37:
   ;	
   ;		{	int id1,id2,st2=1,t=0,ti[50],i=1;
   ;	
	mov	word ptr [bp-8],1
	mov	word ptr [bp-10],0
	mov	di,1
   ;	
   ;			char st1name[50],st2name[50];
   ;			station ob;
   ;			ifstream f("infost.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+3371
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-400]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;			f.seekg((st1-1)*sizeof(ob),ios::beg);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,word ptr [bp-2]
	dec	ax
	mov	dx,74
	imul	dx
	xor	dx,dx
	push	dx
	push	ax
	lea	ax,word ptr [bp-360]
	push	ax
	call	near ptr @istream@seekg$ql8seek_dir
	add	sp,8
   ;	
   ;			f.read((char *)&ob,sizeof(ob));
   ;	
	mov	ax,74
	push	ax
	lea	ax,word ptr [bp-320]
	push	ax
	lea	ax,word ptr [bp-360]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
   ;	
   ;			ob.ret_info(id1,st1name);
   ;	
	mov	ax,word ptr [bp-320]
	mov	word ptr [bp-4],ax
	lea	ax,word ptr [bp-296]
	push	ax
	lea	ax,word ptr [bp-196]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;			gotoxy(40,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,40
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"FROM STATION :"<<st1name;
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3382
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-12],offset DGROUP:_cout
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-196]
	push	ax
	push	word ptr [bp-12]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(14,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"TO STATION :  ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3397
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			select_st(st2);
   ;	
	lea	ax,word ptr [bp-8]
	push	ax
	call	near ptr @select_st$qri
	pop	cx
   ;	
   ;			f.seekg((st2-1)*sizeof(ob),ios::beg);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,word ptr [bp-8]
	dec	ax
	mov	dx,74
	imul	dx
	xor	dx,dx
	push	dx
	push	ax
	lea	ax,word ptr [bp-360]
	push	ax
	call	near ptr @istream@seekg$ql8seek_dir
	add	sp,8
   ;	
   ;			f.read((char *)&ob,sizeof(ob));
   ;	
	mov	ax,74
	push	ax
	lea	ax,word ptr [bp-320]
	push	ax
	lea	ax,word ptr [bp-360]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
   ;	
   ;			ob.ret_info(id2,st2name);
   ;	
	mov	ax,word ptr [bp-320]
	mov	word ptr [bp-6],ax
	lea	ax,word ptr [bp-296]
	push	ax
	lea	ax,word ptr [bp-246]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;			clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			o3b;
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
	mov	ax,offset DGROUP:s@+3412
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
	mov	ax,offset DGROUP:s@+3423
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
   ;			gotoxy(25,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"TICKET BOOKING";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3428
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(14,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"FROM STATION :"<<st1name;
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3443
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-14],offset DGROUP:_cout
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-196]
	push	ax
	push	word ptr [bp-14]
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
   ;			cout<<"TO STATION :"<<st2name;
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3458
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-16],offset DGROUP:_cout
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-246]
	push	ax
	push	word ptr [bp-16]
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
   ;			cout<<"TRAIN NAME";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3471
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(30,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"BASE PRICE";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3482
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(41,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,41
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"SEATS AVAILABLE";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3493
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			f.close();
   ;	
	lea	ax,word ptr [bp-400]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;			ifstream f1("infot.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+3509
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-480]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;			train ob2;
   ;	
	mov	word ptr [bp-538],0
	mov	word ptr [bp-532],0
	jmp	@23@194
@23@74:
   ;	
   ;			while(f1.read((char *)&ob2,sizeof(ob2)))
   ;			{       int l1,l2;
   ;				ob2.ret_st(l1,l2);
   ;	
	mov	ax,word ptr [bp-558]
	mov	word ptr [bp-20],ax
	mov	ax,word ptr [bp-536]
	dec	ax
	shl	ax,1
	lea	bx,word ptr [bp-558]
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-22],ax
   ;	
   ;				if(l1==id1 && l2==id2 && ob2.ret_av()>0)
   ;	
	mov	ax,word ptr [bp-20]
	cmp	ax,word ptr [bp-4]
	je	@@38
	jmp	@23@194
@@38:
	mov	ax,word ptr [bp-22]
	cmp	ax,word ptr [bp-6]
	je	@@39
	jmp	@23@194
@@39:
	mov	ax,word ptr [bp-534]
	sub	ax,word ptr [bp-532]
	jg	@@40
	jmp	@23@194
@@40:
   ;	
   ;				{	t++;
   ;	
	inc	word ptr [bp-10]
   ;	
   ;					char a[50];
   ;					ob2.ret_info(ti[t-1],a);
   ;	
	mov	ax,word ptr [bp-10]
	dec	ax
	shl	ax,1
	lea	bx,word ptr [bp-146]
	add	bx,ax
	mov	ax,word ptr [bp-560]
	mov	word ptr [bx],ax
	lea	ax,word ptr [bp-530]
	push	ax
	lea	ax,word ptr [bp-610]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;					gotoxy(13,12+t);
   ;	
	mov	ax,word ptr [bp-10]
	add	ax,12
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<"-"<<a;
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3519
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	si,offset DGROUP:_cout
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-610]
	push	ax
	push	si
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					gotoxy(41,12+t);
   ;	
	mov	ax,word ptr [bp-10]
	add	ax,12
	push	ax
	mov	ax,41
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<ob2.ret_av();
   ;	
	mov	ax,word ptr [bp-534]
	sub	ax,word ptr [bp-532]
	cwd	
	push	dx
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
   ;	
   ;					gotoxy(30,12+t);
   ;	
	mov	ax,word ptr [bp-10]
	add	ax,12
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<100*ob2.ret_n();
   ;	
	mov	ax,word ptr [bp-536]
	mov	dx,100
	imul	dx
	cwd	
	push	dx
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
@23@194:
	mov	ax,80
	push	ax
	lea	ax,word ptr [bp-560]
	push	ax
	lea	ax,word ptr [bp-440]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-18],ax
	mov	bx,word ptr [bp-18]
	test	word ptr [bx+4],134
	je	short @23@242
	xor	ax,ax
	jmp	short @23@266
@23@242:
	mov	ax,word ptr [bp-18]
@23@266:
	or	ax,ax
	je	@@41
	jmp	@23@74
@@41:
   ;	
   ;				}
   ;			}
   ;			f1.close();
   ;	
	lea	ax,word ptr [bp-480]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;			if(t==0)
   ;	
	cmp	word ptr [bp-10],0
	jne	short @23@338
   ;	
   ;			{       clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;				o3b;
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
	mov	ax,offset DGROUP:s@+3521
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
	mov	ax,offset DGROUP:s@+3532
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
   ;				gotoxy(14,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"SORRY NO TRAINS FOUND MATCHING YOUR REQUIRMENT.";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3537
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				getch();
   ;	
	call	near ptr _getch
	jmp	@23@1418
@23@338:
   ;	
   ;			}
   ;			else
   ;			{	for(;;)
   ;				{	gotoxy(12,12+i);
   ;	
	mov	ax,di
	add	ax,12
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<"->";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3585
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					int a=getch();
   ;	
	call	near ptr _getch
	mov	si,ax
   ;	
   ;					if(a==13)
   ;	
	cmp	si,13
	jne	short @23@434
	jmp	short @23@626
	jmp	short @23@602
@23@434:
   ;	
   ;						break;
   ;					else if(a==0)
   ;	
	or	si,si
	jne	short @23@602
   ;	
   ;					{	a=getch();
   ;	
	call	near ptr _getch
	mov	si,ax
   ;	
   ;						gotoxy(12,12+i);
   ;	
	mov	ax,di
	add	ax,12
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;						cout<<" -";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3588
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;						if(a==80 && i<t)
   ;	
	cmp	si,80
	jne	short @23@530
	cmp	di,word ptr [bp-10]
	jge	short @23@530
   ;	
   ;							i++;
   ;	
	inc	di
	jmp	short @23@602
@23@530:
   ;	
   ;						else if(a==72 && i>1)
   ;	
	cmp	si,72
	jne	short @23@602
	cmp	di,1
	jle	short @23@602
   ;	
   ;							i--;
   ;	
	dec	di
@23@602:
	jmp	short @23@338
@23@626:
   ;	
   ;					}
   ;				}
   ;				ifstream f2("infot.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+3591
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-640]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @23@698
@23@650:
   ;	
   ;				while(f2.read((char *)&ob2,sizeof(ob2)))
   ;					if(ob2.ret_id()==ti[i-1])
   ;	
	mov	ax,di
	dec	ax
	shl	ax,1
	lea	bx,word ptr [bp-146]
	add	bx,ax
	mov	ax,word ptr [bx]
	cmp	ax,word ptr [bp-560]
	jne	short @23@698
	jmp	short @23@794
@23@698:
	mov	ax,80
	push	ax
	lea	ax,word ptr [bp-560]
	push	ax
	lea	ax,word ptr [bp-600]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-20],ax
	mov	bx,word ptr [bp-20]
	test	word ptr [bx+4],134
	je	short @23@746
	xor	ax,ax
	jmp	short @23@770
@23@746:
	mov	ax,word ptr [bp-20]
@23@770:
	or	ax,ax
	jne	short @23@650
@23@794:
   ;	
   ;						break;
   ;				clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;				o3b;
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
	mov	ax,offset DGROUP:s@+3601
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
	mov	ax,offset DGROUP:s@+3612
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
   ;				tic ob3;
   ;	
	mov	word ptr [bp-696],65535
@23@818:
   ;	
   ;				int r;
   ;				do
   ;				{	gotoxy(30,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<"BILL DESK";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3617
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
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
   ;	
   ;					cout<<"ENTER THE NO. OF PASSENGERS :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3627
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					cin>>r;
   ;	
	lea	ax,word ptr [bp-22]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;					if(r<=0 || r>ob2.ret_av() || r>10)
   ;	
	cmp	word ptr [bp-22],0
	jle	short @23@890
	mov	ax,word ptr [bp-534]
	sub	ax,word ptr [bp-532]
	cmp	ax,word ptr [bp-22]
	jl	short @23@890
	cmp	word ptr [bp-22],10
	jle	short @23@914
@23@890:
   ;	
   ;					{	gotoxy(14,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;						cout<<"ERROR !! CANNOT ADD "<<r<<" PASSENGERS";
   ;	
	mov	ax,word ptr [bp-22]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3657
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	word ptr [bp-24],ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3678
	push	ax
	push	word ptr [bp-24]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;						getch();
   ;	
	call	near ptr _getch
   ;	
   ;						gotoxy(14,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;						clreol();
   ;	
	call	near ptr _clreol
   ;	
   ;						gotoxy(14,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;						clreol();
   ;	
	call	near ptr _clreol
@23@914:
   ;	
   ;					}
   ;				}while(r<=0 || r>ob2.ret_av() || r>10);
   ;	
	cmp	word ptr [bp-22],0
	jg	@@42
	jmp	@23@818
@@42:
	mov	ax,word ptr [bp-534]
	sub	ax,word ptr [bp-532]
	cmp	ax,word ptr [bp-22]
	jge	@@43
	jmp	@23@818
@@43:
	cmp	word ptr [bp-22],10
	jle	@@44
	jmp	@23@818
@@44:
   ;	
   ;				ob2.dec(r);
   ;	
	mov	ax,word ptr [bp-22]
	add	word ptr [bp-532],ax
   ;	
   ;				ofstream f3("infot.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+3690
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-1310]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;				f3.seekp(f2.tellg()-sizeof(ob2),ios::beg);
   ;	
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-600]
	push	ax
	call	near ptr @istream@tellg$qv
	pop	cx
	add	ax,65456
	adc	dx,65535
	push	dx
	push	ax
	lea	ax,word ptr [bp-1270]
	push	ax
	call	near ptr @ostream@seekp$ql8seek_dir
	add	sp,8
   ;	
   ;				f3.write((char *)&ob2,sizeof(ob2));
   ;	
	mov	ax,80
	push	ax
	lea	ax,word ptr [bp-560]
	push	ax
	lea	ax,word ptr [bp-1270]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;				f2.close();
   ;	
	lea	ax,word ptr [bp-640]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;				f3.close();
   ;	
	lea	ax,word ptr [bp-1310]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;				ob3.create_ob(ob2.ret_id(),r);
   ;	
	push	word ptr [bp-22]
	push	word ptr [bp-560]
	lea	ax,word ptr [bp-1232]
	push	ax
	call	near ptr @tic@create_ob$qii
	add	sp,6
   ;	
   ;				o3c;
   ;	
	call	near ptr _clrscr
	mov	ax,2
	push	ax
	mov	ax,32
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3700
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,4
	push	ax
	mov	ax,15
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3711
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,4
	push	ax
	mov	ax,38
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-22]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3721
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
   ;				for(int k=0,c=0;k<r;k++,c++)
   ;	
	xor	si,si
	mov	word ptr [bp-26],0
	jmp	@23@1370
@23@1010:
   ;	
   ;				{       if(k==7)
   ;	
	cmp	si,7
	jne	short @23@1058
   ;	
   ;					{       o3c;
   ;	
	call	near ptr _clrscr
	mov	ax,2
	push	ax
	mov	ax,32
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3734
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,4
	push	ax
	mov	ax,15
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3745
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,4
	push	ax
	mov	ax,38
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-22]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3755
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
   ;						k=0;
   ;	
	xor	si,si
   ;	
   ;						r-=7;
   ;	
	sub	word ptr [bp-22],7
@23@1058:
   ;	
   ;					}
   ;					pinfo ob4;
   ;					gotoxy(11,6+3*k);
   ;	
	mov	ax,si
	mov	dx,3
	imul	dx
	add	ax,6
	push	ax
	mov	ax,11
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<setw(2)<<setiosflags(ios::right)<<c+1<<")NAME :";
   ;	
	mov	ax,word ptr [bp-26]
	inc	ax
	cwd	
	push	dx
	push	ax
	mov	ax,2
	push	ax
	push	ds
	lea	ax,word ptr [bp-32]
	push	ax
	call	near ptr @setw$qi
	add	sp,6
	lea	ax,word ptr [bp-32]
	mov	word ptr [bp-34],ax
	mov	bx,word ptr [bp-34]
	push	word ptr [bx+2]
	push	word ptr DGROUP:_cout
	mov	bx,word ptr [bp-34]
	call	word ptr [bx]
	pop	cx
	pop	cx
	mov	word ptr [bp-42],offset DGROUP:_cout
	xor	ax,ax
	mov	dx,4
	push	ax
	push	dx
	push	ds
	lea	ax,word ptr [bp-40]
	push	ax
	call	near ptr @setiosflags$ql
	add	sp,8
	lea	ax,word ptr [bp-40]
	mov	word ptr [bp-44],ax
	mov	bx,word ptr [bp-44]
	push	word ptr [bx+4]
	push	word ptr [bx+2]
	mov	bx,word ptr [bp-42]
	push	word ptr [bx]
	mov	bx,word ptr [bp-44]
	call	word ptr [bx]
	add	sp,6
	push	word ptr [bp-42]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	word ptr [bp-46],ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3768
	push	ax
	push	word ptr [bp-46]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					gets(ob4.name);
   ;	
	lea	ax,word ptr [bp-1442]
	push	ax
	call	near ptr _gets
	pop	cx
   ;	
   ;					gotoxy(40,6+3*k);
   ;	
	mov	ax,si
	mov	dx,3
	imul	dx
	add	ax,6
	push	ax
	mov	ax,40
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;					cout<<"AGE :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3776
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					cin>>ob4.age;
   ;	
	lea	ax,word ptr [bp-1391]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
@23@1082:
   ;	
   ;						do
   ;						{	gotoxy(14,7+3*k);
   ;	
	mov	ax,si
	mov	dx,3
	imul	dx
	add	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;							cout<<"GENDER (M/F): ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3782
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;							cin>>ob4.g;
   ;	
	lea	ax,word ptr [bp-1392]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qrzc
	pop	cx
	pop	cx
   ;	
   ;							if(ob4.g!='m' && ob4.g!='M' && ob4.g!='F' && ob4.g!='f')
   ;	
	cmp	byte ptr [bp-1392],109
	je	short @23@1202
	cmp	byte ptr [bp-1392],77
	je	short @23@1202
	cmp	byte ptr [bp-1392],70
	je	short @23@1202
	cmp	byte ptr [bp-1392],102
	je	short @23@1202
   ;	
   ;							{       gotoxy(14,8+3*k);
   ;	
	mov	ax,si
	mov	dx,3
	imul	dx
	add	ax,8
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;								cout<<"ERROR! INVALID GENDER";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3797
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;								getch();
   ;	
	call	near ptr _getch
   ;	
   ;								gotoxy(14,8+3*k);
   ;	
	mov	ax,si
	mov	dx,3
	imul	dx
	add	ax,8
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;								clreol();
   ;	
	call	near ptr _clreol
   ;	
   ;								gotoxy(14,7+3*k);
   ;	
	mov	ax,si
	mov	dx,3
	imul	dx
	add	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;								clreol();
   ;	
	call	near ptr _clreol
@23@1202:
   ;	
   ;							}
   ;						}while(ob4.g!='m' && ob4.g!='M' && ob4.g!='F' && ob4.g!='f');
   ;	
	cmp	byte ptr [bp-1392],109
	je	short @23@1298
	cmp	byte ptr [bp-1392],77
	je	short @23@1298
	cmp	byte ptr [bp-1392],70
	je	short @23@1298
	cmp	byte ptr [bp-1392],102
	je	@@45
	jmp	@23@1082
@@45:
@23@1298:
   ;	
   ;						ob4.g=toupper(ob4.g);
   ;	
	mov	al,byte ptr [bp-1392]
	cbw	
	push	ax
	call	near ptr _toupper
	pop	cx
	mov	byte ptr [bp-1392],al
   ;	
   ;						ob3.entry(ob4);
   ;	
	mov	ax,word ptr [bp-698]
	dec	ax
	cmp	ax,word ptr [bp-696]
	jle	short @23@1346
	inc	word ptr [bp-696]
	mov	ax,word ptr [bp-696]
	mov	dx,53
	imul	dx
	lea	dx,word ptr [bp-1232]
	add	dx,ax
	push	ds
	push	dx
	lea	ax,word ptr [bp-1442]
	push	ss
	push	ax
	mov	cx,53
	call	near ptr N_SCOPY@
	mov	ax,word ptr [bp-696]
	mov	dx,53
	imul	dx
	lea	dx,word ptr [bp-1232]
	add	dx,ax
	jmp	short @23@1346
@23@1346:
	inc	si
	inc	word ptr [bp-26]
@23@1370:
	cmp	si,word ptr [bp-22]
	jge	@@46
	jmp	@23@1010
@@46:
   ;	
   ;					}
   ;				ob3.price(100*ob2.ret_n());
   ;	
	mov	ax,word ptr [bp-536]
	mov	dx,100
	imul	dx
	mov	word ptr [bp-694],ax
	mov	ax,word ptr [bp-694]
	mov	bx,100
	cwd	
	idiv	bx
	mov	dx,118
	imul	dx
	imul	word ptr [bp-698]
	mov	word ptr [bp-692],ax
   ;	
   ;				ob3.show();
   ;	
	lea	ax,word ptr [bp-1232]
	push	ax
	call	near ptr @tic@show$qv
	pop	cx
   ;	
   ;				ofstream f3b("infotic.dat",ios::binary|ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,136
	push	ax
	mov	ax,offset DGROUP:s@+3819
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-1388]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;				f3b.write((char *)&ob3,sizeof(ob3));
   ;	
	mov	ax,592
	push	ax
	lea	ax,word ptr [bp-1232]
	push	ax
	lea	ax,word ptr [bp-1348]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;				f3b.close();
   ;	
	lea	ax,word ptr [bp-1388]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;				clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;				o3b;
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
	mov	ax,offset DGROUP:s@+3831
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
	mov	ax,offset DGROUP:s@+3842
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
   ;				gotoxy(14,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"TICKET BOOKED SUCCESSFULLY!!";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3847
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				getch();
   ;	
	call	near ptr _getch
   ;	
   ;				return ob3.ret_pnr();
   ;	
	mov	ax,word ptr [bp-700]
	mov	word ptr [bp-28],ax
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-1388]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-1310]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-640]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-480]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-400]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,word ptr [bp-28]
	jmp	@23@1514
@23@1418:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-480]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-400]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	short @23@1490
@23@1466:
   ;	
   ;			}
   ;		}
   ;		else
   ;		{	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;			o3b;
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
	mov	ax,offset DGROUP:s@+3876
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
	mov	ax,offset DGROUP:s@+3887
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
   ;			cout<<"ERROR!! NO STATION FOUND";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3892
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			getch();
   ;	
	call	near ptr _getch
@23@1490:
   ;	
   ;		}
   ;		return 0;
   ;	
	xor	ax,ax
	jmp	short @23@1514
@23@1514:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@booktic$qi	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'idst.dat'
	db	0
	db	'idst.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'-ENTER THE STATION NAME :'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'-STATION NAME :'
	db	0
	db	'-STATION ID :'
	db	0
	db	'idtr.dat'
	db	0
	db	'idtr.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'-ENTER THE TRAIN NAME :'
	db	0
	db	'-ENTER THE CAPACITY :'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'-TRAIN NAME :'
	db	0
	db	'-TRAIN ID :'
	db	0
	db	'-CAPACITY :'
	db	0
	db	'-SEATS AVAILABE :'
	db	0
	db	'-THE NO. OF THROUGH WHICH THE TRAIN PASSES :'
	db	0
	db	'-THE STATIONS ARE :'
	db	0
	db	'-STARTING FROM '
	db	0
	db	'-LAST STATION'
	db	0
	db	') '
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
	db	'id.dat'
	db	0
	db	'id.dat'
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
	db	'-TICKETS BOOKED:'
	db	0
	db	'PNR NO.'
	db	0
	db	')'
	db	0
	db	'idt.dat'
	db	0
	db	'idt.dat'
	db	0
	db	'infot.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'TICKET DETAILS ARE -'
	db	0
	db	'PNR NO. :'
	db	0
	db	'TRAIN NAME :'
	db	0
	db	'BASE PRICE :'
	db	0
	db	'TAX :GST 18%'
	db	0
	db	'TOTAL PRICE (inc. of taxes):'
	db	0
	db	'PASSENGERS INFO :'
	db	0
	db	'PASSENGERS :'
	db	0
	db	'NAME'
	db	0
	db	'AGE'
	db	0
	db	'GENDER'
	db	0
	db	')'
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
	db	'infoc.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ENTER THE PNR NO. :'
	db	0
	db	'infotic.dat'
	db	0
	db	'ERROR!! INVALID PNR'
	db	0
	db	'infoe.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'-THIS SOFTWARE LETS YOU CREATE PASSENGER ACCOUNT,'
	db	0
	db	'EMPLOYEE ACCOUNT,NEW STATION,NEW TRAIN '
	db	0
	db	'AND BOOK TICKETS!!'
	db	0
	db	'-YOU CAN CREATE A NEW TRAIN,STATION FROM'
	db	0
	db	'EMPLOYEE LOGIN BY ENTERING A FEW BASIC INFORMATION'
	db	0
	db	'-YOU CAN CREATE AN EMPLOYEE ID FROM RESERVED MENU'
	db	0
	db	'ONCE CREATED YOU HAVE TO SIGNUP USING THIS ID'
	db	0
	db	'BY SELECTING "CREATE A NEW ACCOUNT "FROM THE MAIN MENU'
	db	0
	db	'-TICKET INFORMATION CAN BE DIRECTLY CHECKED FROM MAIN MENU'
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
	db	'-GENERAL INSTRUCTIONS'
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
	db	'-VIEW EXISTING STATIONS'
	db	0
	db	'-VIEW EXISTING TRAIN'
	db	0
	db	'-VIEW EXISTING PASSENGERS'
	db	0
	db	'-EXIT'
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
	db	'I.R.C.T.C.'
	db	0
	db	'infost.dat'
	db	0
	db	') NAME :'
	db	0
	db	' ID :'
	db	0
	db	'NO STATION FOUND!!'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'infot.dat'
	db	0
	db	') NAME :'
	db	0
	db	' ID :'
	db	0
	db	'NO TRAINS FOUND!!'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'infoc.dat'
	db	0
	db	') NAME :'
	db	0
	db	' ID :'
	db	0
	db	'NO PASSENGERS FOUND!!'
	db	0
	db	'infot.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'ENTER THE TRAIN ID:'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'TRAIN NO.'
	db	0
	db	'ENTER THE NO. OF STATIONS THROUGH WHICH THIS TRAIN PASSES :'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'TRAIN NO.'
	db	0
	db	') STATION NO.'
	db	0
	db	'ENTER THE STAION NO.THROUGH WHICH THE TRAIN PASSES'
	db	0
	db	'ENTER THE STATION NO.:'
	db	0
	db	'idst.dat'
	db	0
	db	'ERROR INVALID STATION ID!!'
	db	0
	db	'infot.dat'
	db	0
	db	'infot.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'TRAIN NO.'
	db	0
	db	'JOURNEY SUSSESSFULLY PLANED!!'
	db	0
	db	'ERROR!! CANNOT ADD '
	db	0
	db	' TRAINS'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'-ENTER ID :'
	db	0
	db	'ide.dat'
	db	0
	db	'ERROR INCORRECT ID!!'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'-EMPLYOEE ZONE '
	db	0
	db	'-ENTER A NEW STATION'
	db	0
	db	'-INFO OF A STAION'
	db	0
	db	'-ENTER A NEW TRAIN'
	db	0
	db	'-INFO OF A TRAIN'
	db	0
	db	'-PLAN A JOURNEY OF A TRAIN'
	db	0
	db	'-EXIT'
	db	0
	db	'->'
	db	0
	db	'infost.dat'
	db	0
	db	'infost.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'ENTER THE STATION ID:'
	db	0
	db	'ERROR!! INVALID ID!'
	db	0
	db	'infot.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'TRAIN NO.'
	db	0
	db	'JOURNEY ALREADY PLANNED!!'
	db	0
	db	'-PLAN THE JOURNEY AGAIN'
	db	0
	db	'-RETURN TO PREVIOS MENU'
	db	0
	db	'->'
	db	0
	db	'ERROR!! INVALID ID!'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'-ENTER ID :'
	db	0
	db	'id.dat'
	db	0
	db	'ERROR INCORRECT ID!!'
	db	0
	db	'infoc.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'-PASSENGER ZONE '
	db	0
	db	'-BOOK A TICKET'
	db	0
	db	'-VIEW PNR OF BOOKED TICKETS'
	db	0
	db	'-EXIT'
	db	0
	db	'->'
	db	0
	db	'infoc.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'BOOKED TICKETS ARE :'
	db	0
	db	')'
	db	0
	db	'ERROR!! NO BOOKED TICKETS FOUND!!'
	db	0
	db	'infost.dat'
	db	0
	db	'-'
	db	0
	db	'->'
	db	0
	db	' '
	db	0
	db	' -'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'TICKET BOOKING'
	db	0
	db	'FROM STATION -'
	db	0
	db	'infost.dat'
	db	0
	db	'FROM STATION :'
	db	0
	db	'TO STATION :  '
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'TICKET BOOKING'
	db	0
	db	'FROM STATION :'
	db	0
	db	'TO STATION :'
	db	0
	db	'TRAIN NAME'
	db	0
	db	'BASE PRICE'
	db	0
	db	'SEATS AVAILABLE'
	db	0
	db	'infot.dat'
	db	0
	db	'-'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'SORRY NO TRAINS FOUND MATCHING YOUR REQUIRMENT.'
	db	0
	db	'->'
	db	0
	db	' -'
	db	0
	db	'infot.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'BILL DESK'
	db	0
	db	'ENTER THE NO. OF PASSENGERS :'
	db	0
	db	'ERROR !! CANNOT ADD '
	db	0
	db	' PASSENGERS'
	db	0
	db	'infot.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'BILL DESK'
	db	0
	db	'PASSENGERS :'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'BILL DESK'
	db	0
	db	'PASSENGERS :'
	db	0
	db	')NAME :'
	db	0
	db	'AGE :'
	db	0
	db	'GENDER (M/F): '
	db	0
	db	'ERROR! INVALID GENDER'
	db	0
	db	'infotic.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'TICKET BOOKED SUCCESSFULLY!!'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'ERROR!! NO STATION FOUND'
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
	public	@station@create_ob$qv
	extrn	@ifstream@$bctr$qpxzcii:near
	extrn	_srand:near
	extrn	_time:near
	extrn	_rand:near
	extrn	N_LXMUL@:near
	extrn	N_LDIV@:near
	extrn	@istream@read$qpzci:near
	extrn	@fstreambase@close$qv:near
	extrn	@ofstream@$bctr$qpxzcii:near
	extrn	@ostream@write$qpxzci:near
	extrn	_clrscr:near
	extrn	_gotoxy:near
	extrn	@ostream@outstr$qpxzct1:near
	extrn	_cout:word
	extrn	_gets:near
	public	@station@show$qv
	extrn	@ifstream@$bdtr$qv:near
	extrn	@ofstream@$bdtr$qv:near
	extrn	@ostream@$blsh$ql:near
	extrn	_getch:near
	public	@train@journey$qipi
	public	@train@create_ob$qv
	extrn	@istream@$brsh$qri:near
	extrn	_cin:word
	public	@train@show$qv
	public	@pass@create_ob$qv
	public	@pass@show$qv
	extrn	@setiosflags$ql:near
	extrn	@setw$qi:near
	public	@pass@ret_info$qripi
	public	@tic@create_ob$qii
	extrn	_strcpy:near
	public	@tic@show$qv
	extrn	@ostream@$blsh$qzc:near
	public	@emp@create_ob$qv
	public	_main
	public	@login$qri
	public	@mainmenu$qri
	public	@p_main$qv
	public	@e_login$qv
	public	@reserved$qv
	public	@password$qpzc
	extrn	_stricmp:near
	public	@entr$qr5traini
	public	@plan_j$q5traini
	extrn	@ostream@seekp$ql8seek_dir:near
	extrn	@istream@tellg$qv:near
	public	@emp_login$qv
	extrn	N_SCOPY@:near
	public	@booktic$qi
	public	@select_st$qri
	extrn	@istream@seekg$ql8seek_dir:near
	extrn	_clreol:near
	extrn	@istream@$brsh$qrzc:near
	extrn	_toupper:near
	end
