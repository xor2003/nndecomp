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
	?debug	S "c:\elogin2.cpp"
	?debug	C E93B58FE7C0E633A5C656C6F67696E322E637070
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
   ;		idc ob1;
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
	mov	ax,offset DGROUP:s@+197
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-164]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;		idc ob1;
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
	jmp	@5@170
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
   ;			for(int i=0;i<n;i++)
   ;	
	xor	si,si
	jmp	short @5@146
@5@98:
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
	mov	ax,offset DGROUP:s@+343
	push	ax
	push	word ptr [bp-4]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	push	word ptr [bp-4]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
	inc	si
@5@146:
	cmp	word ptr [di+22],si
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
	mov	ax,offset DGROUP:s@+346
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
	mov	ax,offset DGROUP:s@+357
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
	mov	ax,offset DGROUP:s@+369
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-86]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
	jmp	short @6@98
@6@50:
   ;	
   ;		idc o;
   ;		while(f.read((char *)&o,sizeof(o)))
   ;			if(o.ret_id()==l)
   ;	
	mov	ax,word ptr [bp-4]
	cmp	ax,word ptr [bp-2]
	jne	short @6@98
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
	jmp	short @6@218
@6@98:
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
	je	short @6@146
	xor	ax,ax
	jmp	short @6@170
@6@146:
	mov	ax,si
@6@170:
	or	ax,ax
	jne	short @6@50
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
	mov	ax,offset DGROUP:s@+377
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
	jmp	short @6@218
@6@218:
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
	sub	sp,164
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
	jmp	@7@2018
@@2:
   ;	
   ;		{       for(int o=1;;)
   ;	
	mov	si,1
@7@74:
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
	mov	ax,offset DGROUP:s@+398
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
	mov	ax,offset DGROUP:s@+409
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
   ;				gotoxy(14,6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"STAION ZONE";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+414
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
	mov	ax,offset DGROUP:s@+426
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
	mov	ax,offset DGROUP:s@+447
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
   ;				cout<<"-UPDATE THE INFO OF A STATION"; //O=3
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+465
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(45,6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,45
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"TRAIN ZONE";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+495
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(44,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,44
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"-ENTER A NEW TRAIN";   //O=4
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+506
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(44,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,44
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"-INFO OF A TRAIN";     //O=5
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+525
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
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
   ;	
   ;				cout<<"-UPDATE THE INFO OF A TRAIN"; //O=6
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+542
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
   ;				cout<<"-PLAN A JOURNEY OF A TRAIN"; //O=7
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+570
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				gotoxy(13,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,13
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;				cout<<"-EXIT";     //O=8
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+597
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;				if(o==1)
   ;	
	cmp	si,1
	jne	short @7@122
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
	jmp	@7@458
@7@122:
   ;	
   ;				else if(o==2)
   ;	
	cmp	si,2
	jne	short @7@170
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
	jmp	short @7@458
@7@170:
   ;	
   ;				else if(o==3)
   ;	
	cmp	si,3
	jne	short @7@218
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
	jmp	short @7@458
@7@218:
   ;	
   ;				else if(o==4)
   ;	
	cmp	si,4
	jne	short @7@266
   ;	
   ;					gotoxy(43,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,43
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @7@458
@7@266:
   ;	
   ;				else if(o==5)
   ;	
	cmp	si,5
	jne	short @7@314
   ;	
   ;					gotoxy(43,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,43
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @7@458
@7@314:
   ;	
   ;				else if(o==6)
   ;	
	cmp	si,6
	jne	short @7@362
   ;	
   ;					gotoxy(43,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,43
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
	jmp	short @7@458
@7@362:
   ;	
   ;				else if(o==7)
   ;	
	cmp	si,7
	jne	short @7@410
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
	jmp	short @7@458
@7@410:
   ;	
   ;				else if(o==8)
   ;	
	cmp	si,8
	jne	short @7@458
   ;	
   ;					gotoxy(12,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
@7@458:
   ;	
   ;				cout<<"->";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+603
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
	jmp	@7@1298
@@3:
   ;	
   ;				{       if(o==8)
   ;	
	cmp	si,8
	jne	short @7@578
	jmp	@7@2018
	jmp	@7@1274
@7@578:
   ;	
   ;						break;
   ;					else if(o==1)
   ;	
	cmp	si,1
	jne	short @7@650
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
	mov	ax,offset DGROUP:s@+606
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
	jmp	@7@1274
@7@650:
   ;	
   ;					}
   ;					else if(o==2)
   ;	
	cmp	si,2
	je	@@4
	jmp	@7@938
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
	mov	ax,offset DGROUP:s@+617
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
	mov	ax,offset DGROUP:s@+628
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
	mov	ax,offset DGROUP:s@+639
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
	mov	ax,offset DGROUP:s@+644
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
	jmp	short @7@746
@7@698:
   ;	
   ;						while(f.read((char *)&ob,sizeof(ob)))
   ;							if(ob.ret_id()==a)
   ;	
	mov	ax,word ptr [bp-84]
	cmp	ax,word ptr [bp-6]
	jne	short @7@746
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
	jmp	short @7@842
@7@746:
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
	je	short @7@794
	xor	ax,ax
	jmp	short @7@818
@7@794:
	mov	ax,di
@7@818:
	or	ax,ax
	jne	short @7@698
@7@842:
   ;	
   ;								break;
   ;							}
   ;						if(flag==0)
   ;	
	cmp	word ptr [bp-8],0
	jne	short @7@890
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
	mov	ax,offset DGROUP:s@+666
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;							getch();
   ;	
	call	near ptr _getch
@7@890:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-164]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
	jmp	@7@1274
@7@938:
   ;	
   ;						}
   ;					}
   ;					else if(o==4)
   ;	
	cmp	si,4
	jne	short @7@1010
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
	mov	ax,offset DGROUP:s@+686
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
	jmp	@7@1274
@7@1010:
   ;	
   ;					}
   ;					else if(o==5)
   ;	
	cmp	si,5
	je	@@5
	jmp	@7@1274
@@5:
   ;	
   ;					{	train ob;
   ;	
	mov	word ptr [bp-60],0
   ;	
   ;						ifstream f("infot.dat",ios::binary);
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,128
	push	ax
	mov	ax,offset DGROUP:s@+696
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
	mov	ax,offset DGROUP:s@+706
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
	mov	ax,offset DGROUP:s@+717
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
   ;						cout<<"ENTER THE TRAIN ID:";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+722
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
	jmp	short @7@1106
@7@1058:
   ;	
   ;						while(f.read((char *)&ob,sizeof(ob)))
   ;							if(ob.ret_id()==a)
   ;	
	mov	ax,word ptr [bp-84]
	cmp	ax,word ptr [bp-6]
	jne	short @7@1106
   ;	
   ;							{       flag=1;
   ;	
	mov	word ptr [bp-8],1
   ;	
   ;								ob.show();
   ;	
	lea	ax,word ptr [bp-84]
	push	ax
	call	near ptr @train@show$qv
	pop	cx
	jmp	short @7@1202
@7@1106:
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
	je	short @7@1154
	xor	ax,ax
	jmp	short @7@1178
@7@1154:
	mov	ax,di
@7@1178:
	or	ax,ax
	jne	short @7@1058
@7@1202:
   ;	
   ;								break;
   ;							}
   ;						if(flag==0)
   ;	
	cmp	word ptr [bp-8],0
	jne	short @7@1250
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
	mov	ax,offset DGROUP:s@+742
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;							getch();
   ;	
	call	near ptr _getch
@7@1250:
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-164]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
@7@1274:
	jmp	@7@1994
@7@1298:
   ;	
   ;						}
   ;					}
   ;	
   ;				}
   ;				else if(b==0)
   ;	
	cmp	word ptr [bp-4],0
	je	@@6
	jmp	@7@1994
@@6:
   ;	
   ;				{	b=getch();           //77->    75<-
   ;	
	call	near ptr _getch
	mov	word ptr [bp-4],ax
   ;	
   ;					if(b==80 && o<8 && o!=3)
   ;	
	cmp	word ptr [bp-4],80
	jne	short @7@1418
	cmp	si,8
	jge	short @7@1418
	cmp	si,3
	je	short @7@1418
   ;	
   ;						o++;
   ;	
	inc	si
	jmp	short @7@1994
@7@1418:
   ;	
   ;					else if(b==80 && o==3)
   ;	
	cmp	word ptr [bp-4],80
	jne	short @7@1490
	cmp	si,3
	jne	short @7@1490
   ;	
   ;						o=7;
   ;	
	mov	si,7
	jmp	short @7@1994
@7@1490:
   ;	
   ;					else if(b==72 && o>1 && o!=7 && o!=4)
   ;	
	cmp	word ptr [bp-4],72
	jne	short @7@1610
	cmp	si,1
	jle	short @7@1610
	cmp	si,7
	je	short @7@1610
	cmp	si,4
	je	short @7@1610
   ;	
   ;						o--;
   ;	
	dec	si
	jmp	short @7@1994
@7@1610:
   ;	
   ;					else if(b==72 && o==7)
   ;	
	cmp	word ptr [bp-4],72
	jne	short @7@1682
	cmp	si,7
	jne	short @7@1682
   ;	
   ;						o=3;
   ;	
	mov	si,3
	jmp	short @7@1994
@7@1682:
   ;	
   ;					else if(b==77 && (o==1 || o==2 || o==3))
   ;	
	cmp	word ptr [bp-4],77
	jne	short @7@1802
	cmp	si,1
	je	short @7@1778
	cmp	si,2
	je	short @7@1778
	cmp	si,3
	jne	short @7@1802
@7@1778:
   ;	
   ;						o+=3;
   ;	
	add	si,3
	jmp	short @7@1994
@7@1802:
   ;	
   ;					else if(b==77 && o==7)
   ;	
	cmp	word ptr [bp-4],77
	jne	short @7@1874
	cmp	si,7
	jne	short @7@1874
   ;	
   ;						o=6;
   ;	
	mov	si,6
	jmp	short @7@1994
@7@1874:
   ;	
   ;					else if(b==75 && (o==6 || o==5 || o==4))
   ;	
	cmp	word ptr [bp-4],75
	jne	short @7@1994
	cmp	si,6
	je	short @7@1970
	cmp	si,5
	je	short @7@1970
	cmp	si,4
	jne	short @7@1994
@7@1970:
   ;	
   ;						o-=3;
   ;	
	sub	si,3
@7@1994:
	jmp	@7@74
@7@2018:
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
   ;	{
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
	mov	ax,offset DGROUP:s@+762
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
	db	'STAION ZONE'
	db	0
	db	'-ENTER A NEW STATION'
	db	0
	db	'-INFO OF A STAION'
	db	0
	db	'-UPDATE THE INFO OF A STATION'
	db	0
	db	'TRAIN ZONE'
	db	0
	db	'-ENTER A NEW TRAIN'
	db	0
	db	'-INFO OF A TRAIN'
	db	0
	db	'-UPDATE THE INFO OF A TRAIN'
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
	db	'infot.dat'
	db	0
	db	'I.R.C.T.C.'
	db	0
	db	'ID :'
	db	0
	db	'ENTER THE TRAIN ID:'
	db	0
	db	'ERROR!! INVALID ID!'
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
	public	@train@create_ob$qv
	public	@train@show$qv
	public	@pas_login$qv
	extrn	@istream@$brsh$qri:near
	extrn	_cin:word
	public	@e_login$qv
	public	_main
	end
