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
	?debug	S "c:\elogin3.cpp"
	?debug	C E93B58FE7C0E633A5C656C6F67696E332E637070
	?debug	C E95337528114443A5C494E434C5544455C6673747265616D2E68
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
	?debug	C E95337528110443A5C494E434C5544455C6D656D2E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
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
	mov	ax,offset DGROUP:s@+7
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-86]
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
	mov	word ptr [di],ax
	jmp	short @2@122
@2@74:
   ;	
   ;			while(f.read((char *)&ob,sizeof(ob)))
   ;			{	if(ob.ret_id()==id)
   ;	
	mov	ax,word ptr [di]
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
	lea	ax,word ptr [bp-46]
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
	cmp	word ptr [di],0
	je	short @2@50
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
	mov	ax,offset DGROUP:s@+16
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
	mov	ax,offset DGROUP:s@+25
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
	mov	ax,offset DGROUP:s@+36
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gets(stname);
   ;	
	mov	ax,di
	add	ax,26
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
	sub	sp,4
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
	mov	ax,offset DGROUP:s@+62
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
	mov	ax,offset DGROUP:s@+73
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-2],offset DGROUP:_cout
	xor	ax,ax
	push	ax
	mov	ax,di
	add	ax,26
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
   ;		cout<<"-STATION ID :"<<id;
   ;	
	mov	ax,word ptr [di]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+89
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
	cmp	word ptr [di+24],1
	je	@@0
	jmp	@3@170
@@0:
   ;	
   ;		{	gotoxy(13,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-THE NO. OF TRAINS THAT PASSES THROUGH THIS STATION EVERY DAY :"<<n;
   ;	
	mov	ax,word ptr [di+2]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+103
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
   ;			cout<<"-THE TRAINs ARE :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+167
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			for(int i=0;i<n;i++)
   ;	
	xor	si,si
	jmp	short @3@146
@3@98:
   ;	
   ;			{	gotoxy(14,11+i);
   ;	
	mov	ax,si
	add	ax,11
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<i+1<<") "<<tr[i];
   ;	
	mov	ax,si
	shl	ax,1
	mov	bx,di
	add	bx,4
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
	mov	word ptr [bp-4],ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+185
	push	ax
	push	word ptr [bp-4]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	push	word ptr [bp-4]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	inc	si
@3@146:
	cmp	word ptr [di+2],si
	jg	short @3@98
@3@170:
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
	mov	word ptr [di+24],1
   ;	
   ;		n=a;
   ;	
	mov	ax,word ptr [bp+6]
	mov	word ptr [di+22],ax
   ;	
   ;		for(int i=0;i<n;i++)
   ;	
	xor	si,si
	jmp	short @4@98
@4@50:
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
@4@98:
	cmp	word ptr [di+22],si
	jg	short @4@50
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
	mov	ax,offset DGROUP:s@+188
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
@5@50:
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
	jmp	short @5@122
@5@74:
   ;	
   ;			while(f.read((char *)&ob,sizeof(ob)))
   ;			{	if(ob.ret_id()==id)
   ;	
	mov	ax,word ptr [di]
	cmp	ax,word ptr [bp-2]
	jne	short @5@122
   ;	
   ;				{	flag=1;
   ;	
	mov	word ptr [bp-4],1
	jmp	short @5@218
@5@122:
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
	je	short @5@170
	xor	ax,ax
	jmp	short @5@194
@5@170:
	mov	ax,si
@5@194:
	or	ax,ax
	jne	short @5@74
@5@218:
   ;	
   ;					break;
   ;				}
   ;			}
   ;		}while(flag==1 || id==0);
   ;	
	cmp	word ptr [bp-4],1
	je	short @5@50
	cmp	word ptr [di],0
	je	short @5@50
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
	mov	ax,offset DGROUP:s@+197
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
	mov	ax,offset DGROUP:s@+206
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
	mov	ax,offset DGROUP:s@+217
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		gets(tname);
   ;	
	mov	ax,di
	add	ax,26
	push	ax
	call	near ptr _gets
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
	mov	ax,offset DGROUP:s@+241
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
	mov	ax,offset DGROUP:s@+252
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-2],offset DGROUP:_cout
	xor	ax,ax
	push	ax
	mov	ax,di
	add	ax,26
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
	mov	ax,word ptr [di]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+266
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
	cmp	word ptr [di+24],1
	je	@@1
	jmp	@6@170
@@1:
   ;	
   ;		{	gotoxy(13,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			cout<<"-THE NO. OF THROUGH WHICH THE TRAIN PASSES :"<<n;
   ;	
	mov	ax,word ptr [di+22]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+278
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
   ;			cout<<"-THE STATIONS ARE :";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+323
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(25,11);
   ;	
	mov	ax,11
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
	mov	ax,offset DGROUP:s@+343
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			gotoxy(25,10+n);
   ;	
	mov	ax,word ptr [di+22]
	add	ax,10
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
	mov	ax,offset DGROUP:s@+359
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			for(int i=0;i<n;i++)
   ;	
	xor	si,si
	jmp	short @6@146
@6@98:
   ;	
   ;			{	gotoxy(14,11+i);
   ;	
	mov	ax,si
	add	ax,11
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<i+1<<") "<<stno[i];
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
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	mov	word ptr [bp-4],ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+373
	push	ax
	push	word ptr [bp-4]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	push	word ptr [bp-4]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	inc	si
@6@146:
	cmp	word ptr [di+22],si
	jg	short @6@98
@6@170:
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
	mov	ax,offset DGROUP:s@+376
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
	mov	ax,offset DGROUP:s@+387
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
	mov	ax,offset DGROUP:s@+399
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @7@98
@7@50:
   ;	
   ;		idc o;
   ;		while(f.read((char *)&o,sizeof(o)))
   ;			if(o.ret_id()==l)
   ;	
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-2]
	jne	short @7@98
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
	jmp	short @7@218
@7@98:
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
	je	short @7@146
	xor	ax,ax
	jmp	short @7@170
@7@146:
	mov	ax,si
@7@170:
	or	ax,ax
	jne	short @7@50
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
	mov	ax,offset DGROUP:s@+407
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
	jmp	short @7@218
@7@218:
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
   ;	void e_login()
   ;	
	assume	cs:_TEXT
@e_login$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,236
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
	jne	@@2
	jmp	@8@1850
@@2:
   ;	
   ;		{       for(int o=1;;)
   ;	
	mov	si,1
@8@74:
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
	mov	ax,offset DGROUP:s@+428
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
	mov	ax,offset DGROUP:s@+439
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
	mov	ax,offset DGROUP:s@+444
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
	mov	ax,offset DGROUP:s@+460
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
	mov	ax,offset DGROUP:s@+481
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
	mov	ax,offset DGROUP:s@+499
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
	mov	ax,offset DGROUP:s@+518
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
	mov	ax,offset DGROUP:s@+535
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
	mov	ax,offset DGROUP:s@+562
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				if(o==1)
   ;	
	cmp	si,1
	jne	short @8@122
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
	jmp	short @8@362
@8@122:
   ;	
   ;				else if(o==2)
   ;	
	cmp	si,2
	jne	short @8@170
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
	jmp	short @8@362
@8@170:
   ;	
   ;				else if(o==3)
   ;	
	cmp	si,3
	jne	short @8@218
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
	jmp	short @8@362
@8@218:
   ;	
   ;				else if(o==4)
   ;	
	cmp	si,4
	jne	short @8@266
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
	jmp	short @8@362
@8@266:
   ;	
   ;				else if(o==5)
   ;	
	cmp	si,5
	jne	short @8@314
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
	jmp	short @8@362
@8@314:
   ;	
   ;				else if(o==6)
   ;	
	cmp	si,6
	jne	short @8@362
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
@8@362:
   ;	
   ;				cout<<"->";
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
   ;				int b=getch();
   ;	
	call	near ptr _getch
	mov	word ptr [bp-4],ax
   ;	
   ;				if(b==13)
   ;	
	cmp	word ptr [bp-4],13
	je	@@3
	jmp	@8@1658
@@3:
   ;	
   ;				{       if(o==6)
   ;	
	cmp	si,6
	jne	short @8@482
	jmp	@8@1850
	jmp	@8@1634
@8@482:
   ;	
   ;						break;
   ;					else if(o==1)
   ;	
	cmp	si,1
	jne	short @8@554
   ;	
   ;					{	station ob;
   ;	
	mov	word ptr [bp-60],0
   ;	
   ;						ob.create_ob();
   ;	
	lea	ax,word ptr [bp-84]
	push	ax
	call	near ptr @station@create_ob$qv
	pop	cx
   ;	
   ;						ofstream f("infost.dat",ios::binary|ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,136
	push	ax
	mov	ax,offset DGROUP:s@+571
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-162]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;						f.write((char *)&ob,sizeof(ob));
   ;	
	mov	ax,76
	push	ax
	lea	ax,word ptr [bp-84]
	push	ax
	lea	ax,word ptr [bp-122]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;						f.close();
   ;	
	lea	ax,word ptr [bp-162]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-162]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	@8@1634
@8@554:
   ;	
   ;					}
   ;					else if(o==2)
   ;	
	cmp	si,2
	je	@@4
	jmp	@8@842
@@4:
   ;	
   ;					{	station ob;
   ;	
	mov	word ptr [bp-60],0
   ;	
   ;						ifstream f("infost.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+582
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-164]
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
   ;						o3;
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
	mov	ax,offset DGROUP:s@+593
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
	mov	ax,offset DGROUP:s@+604
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
	mov	ax,offset DGROUP:s@+609
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
	jmp	short @8@650
@8@602:
   ;	
   ;						while(f.read((char *)&ob,sizeof(ob)))
   ;							if(ob.ret_id()==a)
   ;	
	mov	ax,word ptr [bp-84]
	cmp	ax,word ptr [bp-6]
	jne	short @8@650
   ;	
   ;							{       flag=1;
   ;	
	mov	word ptr [bp-8],1
   ;	
   ;								ob.show();
   ;	
	lea	ax,word ptr [bp-84]
	push	ax
	call	near ptr @station@show$qv
	pop	cx
	jmp	short @8@746
@8@650:
	mov	ax,76
	push	ax
	lea	ax,word ptr [bp-84]
	push	ax
	lea	ax,word ptr [bp-124]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	di,word ptr [bx]
	test	word ptr [di+4],134
	je	short @8@698
	xor	ax,ax
	jmp	short @8@722
@8@698:
	mov	ax,di
@8@722:
	or	ax,ax
	jne	short @8@602
@8@746:
   ;	
   ;								break;
   ;							}
   ;						if(flag==0)
   ;	
	cmp	word ptr [bp-8],0
	jne	short @8@794
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
	mov	ax,offset DGROUP:s@+631
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;							getch();
   ;	
	call	near ptr _getch
@8@794:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-164]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	@8@1634
@8@842:
   ;	
   ;						}
   ;					}
   ;					else if(o==3)
   ;	
	cmp	si,3
	jne	short @8@914
   ;	
   ;					{	train ob;
   ;	
	mov	word ptr [bp-60],0
   ;	
   ;						ob.create_ob();
   ;	
	lea	ax,word ptr [bp-84]
	push	ax
	call	near ptr @train@create_ob$qv
	pop	cx
   ;	
   ;						ofstream f("infot.dat",ios::binary|ios::app);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,136
	push	ax
	mov	ax,offset DGROUP:s@+651
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-162]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;						f.write((char *)&ob,sizeof(ob));
   ;	
	mov	ax,76
	push	ax
	lea	ax,word ptr [bp-84]
	push	ax
	lea	ax,word ptr [bp-122]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;						f.close();
   ;	
	lea	ax,word ptr [bp-162]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-162]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	@8@1634
@8@914:
   ;	
   ;					}
   ;					else if(o==4 || o==5)
   ;	
	cmp	si,4
	je	short @8@962
	cmp	si,5
	je	@@5
	jmp	@8@1634
@@5:
@8@962:
   ;	
   ;					{	train ob;
   ;	
	mov	word ptr [bp-60],0
   ;	
   ;						int a=entr(ob,id);
   ;	
	push	word ptr [bp-2]
	lea	ax,word ptr [bp-84]
	push	ax
	call	near ptr @entr$qr5traini
	pop	cx
	pop	cx
	mov	word ptr [bp-6],ax
   ;	
   ;						if(a)
   ;	
	cmp	word ptr [bp-6],0
	jne	@@6
	jmp	@8@1610
@@6:
   ;	
   ;						{       if(o==4)
   ;	
	cmp	si,4
	jne	short @8@1034
   ;	
   ;								ob.show();
   ;	
	lea	ax,word ptr [bp-84]
	push	ax
	call	near ptr @train@show$qv
	pop	cx
	jmp	@8@1586
@8@1034:
   ;	
   ;							else if(o==5)
   ;	
	cmp	si,5
	je	@@7
	jmp	@8@1586
@@7:
   ;	
   ;							{       if(ob.ret_c()==0)
   ;	
	cmp	word ptr [bp-60],0
	jne	short @8@1106
   ;	
   ;									plan_j(ob,id);
   ;	
	push	word ptr [bp-2]
	mov	ax,word ptr [bp-84]
	mov	word ptr [bp-160],ax
	lea	ax,word ptr [bp-158]
	push	ss
	push	ax
	lea	ax,word ptr [bp-82]
	push	ss
	push	ax
	mov	cx,20
	call	near ptr N_SCOPY@
	mov	ax,word ptr [bp-62]
	mov	word ptr [bp-138],ax
	mov	ax,word ptr [bp-60]
	mov	word ptr [bp-136],ax
	lea	ax,word ptr [bp-134]
	push	ss
	push	ax
	lea	ax,word ptr [bp-58]
	push	ss
	push	ax
	mov	cx,50
	call	near ptr N_SCOPY@
	lea	ax,word ptr [bp-160]
	push	ax
	call	near ptr @plan_j$q5traini
	pop	cx
	pop	cx
	jmp	@8@1586
@8@1106:
   ;	
   ;								else if(ob.ret_c()==1)
   ;	
	cmp	word ptr [bp-60],1
	je	@@8
	jmp	@8@1586
@@8:
   ;	
   ;								{       for(int s=1;;)
   ;	
	mov	di,1
@8@1154:
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
	mov	ax,offset DGROUP:s@+661
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
	mov	ax,offset DGROUP:s@+672
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
	mov	ax,word ptr [bp-84]
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+677
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
	mov	ax,offset DGROUP:s@+687
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
	mov	ax,offset DGROUP:s@+713
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
	mov	ax,offset DGROUP:s@+737
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;										if(s==1)
   ;	
	cmp	di,1
	jne	short @8@1202
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
	jmp	short @8@1250
@8@1202:
   ;	
   ;										else if(s==2)
   ;	
	cmp	di,2
	jne	short @8@1250
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
@8@1250:
   ;	
   ;										cout<<"->";
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
   ;										int g=getch();
   ;	
	call	near ptr _getch
	mov	word ptr [bp-8],ax
   ;	
   ;										if(g==13)
   ;	
	cmp	word ptr [bp-8],13
	jne	short @8@1346
	jmp	short @8@1538
	jmp	short @8@1514
@8@1346:
   ;	
   ;											break;
   ;										else if(g==0)
   ;	
	cmp	word ptr [bp-8],0
	jne	short @8@1514
   ;	
   ;										{	g=getch();
   ;	
	call	near ptr _getch
	mov	word ptr [bp-8],ax
   ;	
   ;											if(g==80 && s==1)
   ;	
	cmp	word ptr [bp-8],80
	jne	short @8@1442
	cmp	di,1
	jne	short @8@1442
   ;	
   ;												s=2;
   ;	
	mov	di,2
	jmp	short @8@1514
@8@1442:
   ;	
   ;											else if(g==72 && s==2)
   ;	
	cmp	word ptr [bp-8],72
	jne	short @8@1514
	cmp	di,2
	jne	short @8@1514
   ;	
   ;												s=1;
   ;	
	mov	di,1
@8@1514:
	jmp	@8@1154
@8@1538:
   ;	
   ;										}
   ;									}
   ;									if(s==1)
   ;	
	cmp	di,1
	jne	short @8@1586
   ;	
   ;										plan_j(ob,id);
   ;	
	push	word ptr [bp-2]
	mov	ax,word ptr [bp-84]
	mov	word ptr [bp-236],ax
	lea	ax,word ptr [bp-234]
	push	ss
	push	ax
	lea	ax,word ptr [bp-82]
	push	ss
	push	ax
	mov	cx,20
	call	near ptr N_SCOPY@
	mov	ax,word ptr [bp-62]
	mov	word ptr [bp-214],ax
	mov	ax,word ptr [bp-60]
	mov	word ptr [bp-212],ax
	lea	ax,word ptr [bp-210]
	push	ss
	push	ax
	lea	ax,word ptr [bp-58]
	push	ss
	push	ax
	mov	cx,50
	call	near ptr N_SCOPY@
	lea	ax,word ptr [bp-236]
	push	ax
	call	near ptr @plan_j$q5traini
	pop	cx
	pop	cx
@8@1586:
	jmp	short @8@1634
@8@1610:
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
	mov	ax,offset DGROUP:s@+764
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;							getch();
   ;	
	call	near ptr _getch
@8@1634:
	jmp	short @8@1826
@8@1658:
   ;	
   ;						}
   ;					}
   ;				}
   ;				else if(b==0)
   ;	
	cmp	word ptr [bp-4],0
	jne	short @8@1826
   ;	
   ;				{	b=getch();
   ;	
	call	near ptr _getch
	mov	word ptr [bp-4],ax
   ;	
   ;					if(b==80 && o<6)
   ;	
	cmp	word ptr [bp-4],80
	jne	short @8@1754
	cmp	si,6
	jge	short @8@1754
   ;	
   ;						o++;
   ;	
	inc	si
	jmp	short @8@1826
@8@1754:
   ;	
   ;					else if(b==72 && o>1)
   ;	
	cmp	word ptr [bp-4],72
	jne	short @8@1826
	cmp	si,1
	jle	short @8@1826
   ;	
   ;						o--;
   ;	
	dec	si
@8@1826:
	jmp	@8@74
@8@1850:
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
   ;	void main()                  //idst.dat,idtr.dat,infost.dat,infot.dat
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{ /*  	remove("idst.dat");
   ;		remove("idtr.dat");
   ;		remove("infost.dat");
   ;		remove("infot.dat");   */
   ;		e_login();
   ;	
	call	near ptr @e_login$qv
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_main	endp
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
	mov	ax,offset DGROUP:s@+784
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
   ;		o3;
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
	mov	ax,offset DGROUP:s@+794
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
	mov	ax,offset DGROUP:s@+805
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
	mov	ax,offset DGROUP:s@+810
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
	jmp	short @10@98
@10@50:
   ;	
   ;		while(f.read((char *)&ob,sizeof(ob)))
   ;		if(ob.ret_id()==a)
   ;	
	mov	ax,word ptr [di]
	cmp	ax,word ptr [bp-2]
	jne	short @10@98
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
	jmp	short @10@218
@10@98:
	mov	ax,76
	push	ax
	push	di
	lea	ax,word ptr [bp-46]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	si,word ptr [bx]
	test	word ptr [si+4],134
	je	short @10@146
	xor	ax,ax
	jmp	short @10@170
@10@146:
	mov	ax,si
@10@170:
	or	ax,ax
	jne	short @10@50
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
	jmp	short @10@218
@10@218:
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
	sub	sp,272
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
	mov	ax,offset DGROUP:s@+830
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
	mov	ax,offset DGROUP:s@+841
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
	mov	ax,offset DGROUP:s@+846
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
	mov	ax,offset DGROUP:s@+856
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
	jg	@@9
	jmp	@11@698
@@9:
	cmp	word ptr [bp-2],10
	jle	@@10
	jmp	@11@698
@@10:
   ;	
   ;		{       int i=0,b[10];
   ;	
	mov	word ptr [bp-6],0
@11@98:
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
	mov	ax,offset DGROUP:s@+916
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
	mov	ax,offset DGROUP:s@+927
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
	mov	ax,offset DGROUP:s@+932
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
	jmp	short @11@194
@11@146:
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
	mov	ax,offset DGROUP:s@+942
	push	ax
	push	word ptr [bp-10]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	push	word ptr [bp-10]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	inc	si
@11@194:
	cmp	si,word ptr [bp-6]
	jl	short @11@146
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
	mov	ax,offset DGROUP:s@+956
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
	mov	ax,offset DGROUP:s@+1007
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
	mov	ax,offset DGROUP:s@+1030
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-272]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @11@290
@11@242:
   ;	
   ;				idc o1;
   ;				while(f.read((char *)&o1,sizeof(o1)))
   ;					if(o1.ret_id()==d)
   ;	
	mov	ax,word ptr [bp-16]
	cmp	ax,word ptr [bp-12]
	jne	short @11@290
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
	jmp	short @11@386
@11@290:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-16]
	push	ax
	lea	ax,word ptr [bp-232]
	push	ax
	call	near ptr @istream@read$qpzci
	add	sp,6
	mov	bx,ax
	mov	di,word ptr [bx]
	test	word ptr [di+4],134
	je	short @11@338
	xor	ax,ax
	jmp	short @11@362
@11@338:
	mov	ax,di
@11@362:
	or	ax,ax
	jne	short @11@242
@11@386:
   ;	
   ;						break;
   ;					}
   ;				f.close();
   ;	
	lea	ax,word ptr [bp-272]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
   ;	
   ;				if(flag==0)
   ;	
	cmp	word ptr [bp-14],0
	jne	short @11@434
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
	mov	ax,offset DGROUP:s@+1039
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;					getch();
   ;	
	call	near ptr _getch
@11@434:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-272]
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
	je	@@11
	jmp	@11@98
@@11:
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
	mov	ax,offset DGROUP:s@+1066
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
	mov	word ptr [bp-168],0
	jmp	short @11@554
@11@506:
   ;	
   ;			while(f1.read((char *)&temp,sizeof(temp)))
   ;				if(temp.ret_id()==ob.ret_id())
   ;	
	mov	bx,word ptr [bp+4]
	mov	ax,word ptr [bx]
	cmp	ax,word ptr [bp-192]
	jne	short @11@554
   ;	
   ;				{	ofstream f2("infot.dat",ios::binary|ios::ate);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,132
	push	ax
	mov	ax,offset DGROUP:s@+1076
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-270]
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
	add	ax,65460
	adc	dx,65535
	push	dx
	push	ax
	lea	ax,word ptr [bp-230]
	push	ax
	call	near ptr @ostream@seekp$ql8seek_dir
	add	sp,8
   ;	
   ;					f2.write((char *)&ob,sizeof(ob));
   ;	
	mov	ax,76
	push	ax
	push	word ptr [bp+4]
	lea	ax,word ptr [bp-230]
	push	ax
	call	near ptr @ostream@write$qpxzci
	add	sp,6
   ;	
   ;					f2.close();
   ;	
	lea	ax,word ptr [bp-270]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-270]
	push	ax
	call	near ptr @ofstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	short @11@650
@11@554:
	mov	ax,76
	push	ax
	lea	ax,word ptr [bp-192]
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
	je	short @11@602
	xor	ax,ax
	jmp	short @11@626
@11@602:
	mov	ax,word ptr [bp-8]
@11@626:
	or	ax,ax
	je	@@12
	jmp	@11@506
@@12:
@11@650:
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
	mov	ax,offset DGROUP:s@+1086
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
	mov	ax,offset DGROUP:s@+1097
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
	mov	ax,offset DGROUP:s@+1102
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
	mov	ax,offset DGROUP:s@+1112
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
	jmp	short @11@722
@11@698:
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
	mov	ax,offset DGROUP:s@+1142
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
	mov	ax,offset DGROUP:s@+1162
	push	ax
	push	word ptr [bp-4]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;			getch();
   ;	
	call	near ptr _getch
@11@722:
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
	mov	ax,offset DGROUP:s@+1170
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
	db	'-THE NO. OF TRAINS THAT PASSES THROUGH THIS STATION EVERY DAY'
	db	' :'
	db	0
	db	'-THE TRAINs ARE :'
	db	0
	db	') '
	db	0
	db	'idtr.dat'
	db	0
	db	'idtr.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'-ENTER THE TRAIN NAME :'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'-TRAIN NAME :'
	db	0
	db	'-TRAIN ID :'
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
	public	@station@create_ob$qv
	extrn	@ofstream@$bctr$qpxzcii:near
	extrn	@ostream@write$qpxzci:near
	extrn	_clrscr:near
	extrn	_gotoxy:near
	extrn	@ostream@outstr$qpxzct1:near
	extrn	_cout:word
	extrn	_gets:near
	public	@station@show$qv
	extrn	@ofstream@$bdtr$qv:near
	extrn	@ostream@$blsh$ql:near
	extrn	_getch:near
	public	@train@journey$qipi
	public	@train@create_ob$qv
	public	@train@show$qv
	public	@pas_login$qv
	extrn	@istream@$brsh$qri:near
	extrn	_cin:word
	public	@e_login$qv
	public	@entr$qr5traini
	public	@plan_j$q5traini
	extrn	N_SCOPY@:near
	public	_main
	extrn	@ostream@seekp$ql8seek_dir:near
	extrn	@istream@tellg$qv:near
	end
