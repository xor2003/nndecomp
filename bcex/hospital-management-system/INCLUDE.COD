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
	?debug	S "c:\include.cpp"
	?debug	C E99C53FE7C0E633A5C696E636C7564652E637070
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
	?debug	C E95337528110443A5C494E434C5544455C6D656D2E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528113443A5C494E434C5544455C737472696E672E68
	?debug	C E95337528115443A5C494E434C5544455C67726170686963732E68
	?debug	C E95337528110443A5C494E434C5544455C646F732E68
	?debug	C E95337528114443A5C494E434C5544455C696F6D616E69702E68
	?debug	C E95337528114443A5C494E434C5544455C67656E657269632E68
	?debug	C E99C53FE7C084C494E452E435050
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
   ;	void printline(int n,int t)
   ;	
	assume	cs:_TEXT
@printline$qii	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{
   ;	   if(t)
   ;	
	cmp	word ptr [bp+6],0
	je	short @1@74
   ;	
   ;		cout<<"\t\t   ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
@1@74:
   ;	
   ;	   for(int i=0;i<n;i++)
   ;	
	xor	si,si
	jmp	short @1@146
@1@98:
   ;	
   ;		{
   ;		cout<<"-";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	inc	si
@1@146:
	cmp	si,di
	jl	short @1@98
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@printline$qii	endp
   ;	
   ;	void name(void)
   ;	
	assume	cs:_TEXT
@name$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;		{
   ;		cout<<"GENERAL HOSPITAL MANAGEMENT SYSTEM";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+8
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		}
   ;	
	pop	bp
	ret	
@name$qv	endp
   ;	
   ;	void uname(void)
   ;	
	assume	cs:_TEXT
@uname$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;		{
   ;		printline(80,0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,80
	push	ax
	call	near ptr @printline$qii
	pop	cx
	pop	cx
   ;	
   ;		gotoxy(23,2);
   ;	
	mov	ax,2
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		name();
   ;	
	call	near ptr @name$qv
   ;	
   ;		cout<<endl;
   ;	
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @endl$qr7ostream
	pop	cx
   ;	
   ;		printline(80,0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,80
	push	ax
	call	near ptr @printline$qii
	pop	cx
	pop	cx
   ;	
   ;		cout<<endl;
   ;	
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @endl$qr7ostream
	pop	cx
   ;	
   ;		}
   ;	
	pop	bp
	ret	
@uname$qv	endp
   ;	
   ;	void line(int n,char c)
   ;	
	assume	cs:_TEXT
@line$qizc	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{
   ;	   for(int j=0;j<n;j++)
   ;	
	xor	si,si
	jmp	short @4@98
@4@50:
   ;	
   ;		cout<<c;
   ;	
	mov	al,byte ptr [bp+6]
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$qzc
	pop	cx
	pop	cx
	inc	si
@4@98:
	cmp	si,di
	jl	short @4@50
   ;	
   ;	}	
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@line$qizc	endp
   ;	
   ;	void space(int n)
   ;	
	assume	cs:_TEXT
@space$qi	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{
   ;	   for(int j=0;j<n;j++)
   ;	
	xor	si,si
	jmp	short @5@98
@5@50:
   ;	
   ;		cout<<" ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+43
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	inc	si
@5@98:
	cmp	si,di
	jl	short @5@50
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@space$qi	endp
   ;	
   ;	void clear(int n)
   ;	
	assume	cs:_TEXT
@clear$qi	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{
   ;	for(int i=0;i<n;i++)
   ;	
	xor	si,si
	jmp	short @6@98
@6@50:
   ;	
   ;		{
   ;		gotoxy(1,25-i);
   ;	
	mov	ax,25
	sub	ax,si
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			space(78);
   ;	
	mov	ax,78
	push	ax
	call	near ptr @space$qi
	pop	cx
	inc	si
@6@98:
	cmp	si,di
	jl	short @6@50
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@clear$qi	endp
   ;	
   ;	void close(void)
   ;	
	assume	cs:_TEXT
@close$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		gotoxy(2,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,2
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			space(75);
   ;	
	mov	ax,75
	push	ax
	call	near ptr @space$qi
	pop	cx
   ;	
   ;		gotoxy(2,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,2
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			space(75);
   ;	
	mov	ax,75
	push	ax
	call	near ptr @space$qi
	pop	cx
   ;	
   ;		gotoxy(2,25);
   ;	
	mov	ax,25
	push	ax
	mov	ax,2
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;			space(75);
   ;	
	mov	ax,75
	push	ax
	call	near ptr @space$qi
	pop	cx
   ;	
   ;		gotoxy(25,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"Application will close now...";
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
   ;		delay(750);
   ;	
	mov	ax,750
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@close$qv	endp
	?debug	C E99C53FE7C0657432E435050
_TEXT	ends
_DATA	segment word public 'DATA'
	db	0
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	int pmain(void)
   ;	
	assume	cs:_TEXT
@pmain$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
@8@26:
   ;	
   ;	{
   ;	password:
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	textcolor(YELLOW);
   ;	
	mov	ax,14
	push	ax
	call	near ptr _textcolor
	pop	cx
   ;	
   ;	printline(79,0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,79
	push	ax
	call	near ptr @printline$qii
	pop	cx
	pop	cx
   ;	
   ;	gotoxy(35,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,35
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"WELCOME";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+75
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(38,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,38
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"TO";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+83
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(21,14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,21
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	name();
   ;	
	call	near ptr @name$qv
   ;	
   ;	gotoxy(1,25);
   ;	
	mov	ax,25
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	printline(79,0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,79
	push	ax
	call	near ptr @printline$qii
	pop	cx
	pop	cx
@8@50:
   ;	
   ;	
   ;	static pass=0;
   ;	limit:
   ;	if(pass<3)
   ;	
	cmp	word ptr DGROUP:d@w+0,3
	jl	@@0
	jmp	@8@482
@@0:
   ;	
   ;	{
   ;	if(pass==0)
   ;	
	cmp	word ptr DGROUP:d@w+0,0
	jne	short @8@122
   ;	
   ;		{
   ;		gotoxy(25,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"Loading...  Please Wait...";
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
   ;		delay(3000);
   ;	
	mov	ax,3000
	push	ax
	call	near ptr _delay
	pop	cx
@8@122:
   ;	
   ;		}
   ;	
   ;	char passwd[5];
   ;	gotoxy(2,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,2
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	for(int p=0;p<75;p++)
   ;	
	xor	si,si
	jmp	short @8@194
@8@146:
   ;	
   ;		cout<<" ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+113
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	inc	si
@8@194:
	cmp	si,75
	jl	short @8@146
   ;	
   ;	gotoxy(25,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	printf("Enter Password: ");
   ;	
	mov	ax,offset DGROUP:s@+115
	push	ax
	call	near ptr _printf
	pop	cx
   ;	
   ;	
   ;	for(p=0;p<5;p++)
   ;	
	xor	si,si
	jmp	short @8@290
@8@242:
   ;	
   ;		{
   ;		passwd[p]=getch();
   ;	
	call	near ptr _getch
	mov	byte ptr [bp+si-6],al
   ;	
   ;		cout<<"* ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+132
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	inc	si
@8@290:
	cmp	si,5
	jl	short @8@242
   ;	
   ;		}
   ;	
   ;	if(!strncmp("vivek",passwd,5))
   ;	
	mov	ax,5
	push	ax
	lea	ax,word ptr [bp-6]
	push	ax
	mov	ax,offset DGROUP:s@+135
	push	ax
	call	near ptr _strncmp
	add	sp,6
	or	ax,ax
	jne	short @8@362
   ;	
   ;		{
   ;		gotoxy(22,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,22
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"You Have Successfully Logged In.";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+141
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	jmp	short @8@458
@8@362:
   ;	
   ;		}
   ;	else
   ;		{
   ;		gotoxy(15,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,15
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"You have Entered a Wrong Password. Please Try Again.";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+174
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
   ;		pass++;
   ;	
	inc	word ptr DGROUP:d@w+0
   ;	
   ;		if(pass<3)
   ;	
	cmp	word ptr DGROUP:d@w+0,3
	jge	short @8@434
   ;	
   ;			goto password;
   ;	
	jmp	@8@26
	jmp	short @8@458
@8@434:
   ;	
   ;		else
   ;			goto limit;
   ;	
	jmp	@8@50
@8@458:
	jmp	short @8@722
@8@482:
   ;	
   ;	
   ;		}
   ;	}
   ;	else
   ;	{
   ;	gotoxy(2,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,2
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	for(int p=0;p<75;p++)
   ;	
	xor	si,si
	jmp	short @8@578
@8@530:
   ;	
   ;		cout<<" ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+227
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	inc	si
@8@578:
	cmp	si,75
	jl	short @8@530
   ;	
   ;	gotoxy(2,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,2
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	for(p=0;p<75;p++)
   ;	
	xor	si,si
	jmp	short @8@674
@8@626:
   ;	
   ;		cout<<" ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+229
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	inc	si
@8@674:
	cmp	si,75
	jl	short @8@626
   ;	
   ;	gotoxy(25,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Application will close now...";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+231
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	return 0;
   ;	
	xor	ax,ax
	jmp	short @8@746
@8@722:
   ;	
   ;	}
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	
   ;	return 1;
   ;	
	mov	ax,1
	jmp	short @8@746
@8@746:
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@pmain$qv	endp
	?debug	C E99C53FE7C0B435241444954532E435050
   ;	
   ;	void thanks(void)
   ;	
	assume	cs:_TEXT
@thanks$qv	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;	int end=0;
   ;	
	xor	si,si
@9@50:
   ;	
   ;	do
   ;	{
   ;	if(end>1)
   ;	
	cmp	si,1
	jle	short @9@98
   ;	
   ;		delay(1000);
   ;	
	mov	ax,1000
	push	ax
	call	near ptr _delay
	pop	cx
@9@98:
   ;	
   ;	gotoxy(20,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		space(50);
   ;	
	mov	ax,50
	push	ax
	call	near ptr @space$qi
	pop	cx
   ;	
   ;	delay(1000);
   ;	
	mov	ax,1000
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	gotoxy(23,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"Thanks For Using My Application";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+261
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(28,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"! HAPPY PROGRAMMING !";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+293
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	
   ;	end++;
   ;	
	inc	si
   ;	
   ;	}while(end<5);
   ;	
	cmp	si,5
	jl	short @9@50
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
@thanks$qv	endp
   ;	
   ;	void cradit(void)
   ;	
	assume	cs:_TEXT
@cradit$qv	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;	int endl=0;
   ;	
	xor	di,di
@10@50:
   ;	
   ;	thank:
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	gotoxy(1,1);
   ;	
	mov	ax,1
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	printline(80,0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,80
	push	ax
	call	near ptr @printline$qii
	pop	cx
	pop	cx
   ;	
   ;	gotoxy(1,25);
   ;	
	mov	ax,25
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	printline(79,0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,79
	push	ax
	call	near ptr @printline$qii
	pop	cx
	pop	cx
   ;	
   ;	
   ;	if(endl==0)
   ;	
	or	di,di
	jne	short @10@98
   ;	
   ;	{
   ;	endl++;
   ;	
	inc	di
   ;	
   ;	delay(1000);
   ;	
	mov	ax,1000
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	gotoxy(33,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"Created By";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+315
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(28,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"VIVEK ISHWARBHAI PATEL";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+326
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(32,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,32
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"( 11BCE073 )";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+349
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	
   ;	thanks();
   ;	
	call	near ptr @thanks$qv
@10@98:
   ;	
   ;	}
   ;	
   ;	if(endl==1)
   ;	
	cmp	di,1
	jne	short @10@146
   ;	
   ;		{
   ;		endl++;
   ;	
	inc	di
   ;	
   ;		goto thank;
   ;	
	jmp	@10@50
@10@146:
   ;	
   ;		}
   ;	gotoxy(33,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"Special Thanks";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+362
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(20,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		line(40,'+');
   ;	
	mov	al,43
	push	ax
	mov	ax,40
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	gotoxy(31,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,31
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"My Helpful Friends";
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
   ;	gotoxy(39,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,39
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"&";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+396
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"E BALAGURUSAMY";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+398
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	
   ;	thanks();
   ;	
	call	near ptr @thanks$qv
   ;	
   ;	gotoxy(1,2);
   ;	
	mov	ax,2
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	for(int i=1;i<23;i++)
   ;	
	mov	si,1
	jmp	short @10@218
@10@170:
   ;	
   ;		line(80,'-');
   ;	
	mov	al,45
	push	ax
	mov	ax,80
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
	inc	si
@10@218:
	cmp	si,23
	jl	short @10@170
   ;	
   ;	line(27,'-');
   ;	
	mov	al,45
	push	ax
	mov	ax,27
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	gotoxy(49,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,49
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	line(32,'-');
   ;	
	mov	al,45
	push	ax
	mov	ax,32
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@cradit$qv	endp
	?debug	C E99C53FE7C084C4953542E435050
   ;	
   ;	void list(void)
   ;	
	assume	cs:_TEXT
@list$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	gotoxy(50,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,50
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"Disease List:";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+413
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(50,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,50
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"1.Fever";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+427
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(50,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,50
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"2.Cold Virus";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+435
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(50,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,50
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"3.Yellow Fever";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+448
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(50,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,50
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"4.Cholera";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+463
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(50,14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,50
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		cout<<"5.Diphtheria";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+473
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@list$qv	endp
   ;	
   ;	void clist(void)
   ;	
	assume	cs:_TEXT
@clist$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	gotoxy(50,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,50
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		space(25);
   ;	
	mov	ax,25
	push	ax
	call	near ptr @space$qi
	pop	cx
   ;	
   ;	gotoxy(50,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,50
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		space(25);
   ;	
	mov	ax,25
	push	ax
	call	near ptr @space$qi
	pop	cx
   ;	
   ;	gotoxy(50,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,50
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		space(25);
   ;	
	mov	ax,25
	push	ax
	call	near ptr @space$qi
	pop	cx
   ;	
   ;	gotoxy(50,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,50
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		space(25);
   ;	
	mov	ax,25
	push	ax
	call	near ptr @space$qi
	pop	cx
   ;	
   ;	gotoxy(50,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,50
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		space(25);
   ;	
	mov	ax,25
	push	ax
	call	near ptr @space$qi
	pop	cx
   ;	
   ;	gotoxy(50,14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,50
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		space(25);
   ;	
	mov	ax,25
	push	ax
	call	near ptr @space$qi
	pop	cx
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@clist$qv	endp
_TEXT	ends
_DATA	segment word public 'DATA'
dtotal	label	word
	db	0
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_DATA	segment word public 'DATA'
d	label	word
	db	0
	db	0
	db	10 dup (0)
_DATA	ends
_TEXT	segment byte public 'CODE'
	?debug	C E99C53FE7C0846494C452E435050
_TEXT	ends
_BSS	segment word public 'BSS'
_f	label	word
	db	12 dup (?)
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void add(struct patient *pnt,FILE *fpnt,FILE *fadd)
   ;	
	assume	cs:_TEXT
@add$qp7patientp4FILEt2	proc	near
	push	bp
	mov	bp,sp
	sub	sp,252
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;		cout<<"Patient's ID       \t:"<<endl;		cin>>pnt->id;
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+486
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @endl$qr7ostream
	pop	cx
	mov	ax,si
	add	ax,25
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;		cout<<"\nName of the Patient\t:"<<endl;		gets(pnt->name);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+508
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @endl$qr7ostream
	pop	cx
	push	si
	call	near ptr _gets
	pop	cx
   ;	
   ;		cout<<"\nType of Disease    \t:"<<endl;
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+531
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @endl$qr7ostream
	pop	cx
   ;	
   ;								list();
   ;	
	call	near ptr @list$qv
   ;	
   ;								gotoxy(1,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;								cin>>pnt->dtype;
   ;	
	mov	ax,si
	add	ax,288
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;								clist();
   ;	
	call	near ptr @clist$qv
   ;	
   ;		
   ;		gotoxy(1,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		char addd[250];
   ;		cout<<"\nAddress\t\t\t: "
   ;	
   ;	
   ;		    <<"\n(please write tidle (~) at the end)"<<endl;
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+554
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-2],offset DGROUP:_cout
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+568
	push	ax
	push	word ptr [bp-2]
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	push	word ptr [bp-2]
	call	near ptr @endl$qr7ostream
	pop	cx
   ;	
   ;			for(int i=0;i<250;i++)
   ;	
	xor	di,di
	jmp	short @13@194
@13@50:
   ;	
   ;				{
   ;				addd[i]=getchar();
   ;	
	dec	word ptr DGROUP:__streams
	mov	ax,word ptr DGROUP:__streams
	or	ax,ax
	jl	short @13@98
	mov	bx,word ptr DGROUP:__streams+10
	inc	word ptr DGROUP:__streams+10
	mov	al,byte ptr [bx]
	mov	ah,0
	jmp	short @13@122
@13@98:
	mov	ax,offset DGROUP:__streams
	push	ax
	call	near ptr __fgetc
	pop	cx
@13@122:
	mov	byte ptr [bp+di-252],al
   ;	
   ;				if(addd[i]=='~')
   ;	
	cmp	byte ptr [bp+di-252],126
	jne	short @13@170
	jmp	short @13@218
@13@170:
	inc	di
@13@194:
	cmp	di,250
	jl	short @13@50
@13@218:
   ;	
   ;					break;
   ;				}
   ;			addd[--i]='\0';
   ;	
	lea	bx,word ptr [bp-252]
	dec	di
	mov	ax,di
	add	bx,ax
	mov	byte ptr [bx],0
   ;	
   ;		strcpy(pnt->add,addd);
   ;	
	lea	ax,word ptr [bp-252]
	push	ax
	mov	ax,si
	add	ax,27
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;		fflush(stdin);
   ;	
	mov	ax,offset DGROUP:__streams
	push	ax
	call	near ptr _fflush
	pop	cx
   ;	
   ;		cout<<"\nTelephone Number\t:"<<endl;	    	cin>>pnt->tel;
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+605
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @endl$qr7ostream
	pop	cx
	mov	ax,si
	add	ax,277
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qpzc
	pop	cx
	pop	cx
   ;	
   ;	
   ;		if(pnt->dtype==1)
   ;	
	cmp	word ptr [si+288],1
	jne	short @13@266
   ;	
   ;			{
   ;			strcpy(pnt->dname,"Fever");
   ;	
	mov	ax,offset DGROUP:s@+625
	push	ax
	mov	ax,si
	add	ax,290
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;			f[0]=fopen("FEVER","a+");
   ;	
	mov	ax,offset DGROUP:s@+637
	push	ax
	mov	ax,offset DGROUP:s@+631
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	word ptr DGROUP:_f,ax
   ;	
   ;			fprintf(f[0]," | %4d | %-25s | %-25s | %11s |\n",
   ;	
   ;	
   ;				pnt->id,
   ;				pnt->name,
   ;				pnt->dname,
   ;				pnt->tel);
   ;	
	mov	ax,si
	add	ax,277
	push	ax
	mov	ax,si
	add	ax,290
	push	ax
	push	si
	push	word ptr [si+25]
	mov	ax,offset DGROUP:s@+640
	push	ax
	push	word ptr DGROUP:_f
	call	near ptr _fprintf
	add	sp,12
   ;	
   ;			fclose(f[0]);
   ;	
	push	word ptr DGROUP:_f
	call	near ptr _fclose
	pop	cx
   ;	
   ;			d[0]++;
   ;	
	inc	word ptr DGROUP:d
	jmp	@13@482
@13@266:
   ;	
   ;			}
   ;		else if(pnt->dtype==2)
   ;	
	cmp	word ptr [si+288],2
	jne	short @13@314
   ;	
   ;			{
   ;			strcpy(pnt->dname,"Cold Virus");
   ;	
	mov	ax,offset DGROUP:s@+673
	push	ax
	mov	ax,si
	add	ax,290
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;			f[1]=fopen("COLDVIRUS","a+");
   ;	
	mov	ax,offset DGROUP:s@+694
	push	ax
	mov	ax,offset DGROUP:s@+684
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	word ptr DGROUP:_f+2,ax
   ;	
   ;			fprintf(f[1]," | %4d | %-25s | %-25s | %11s |\n",
   ;	
   ;	
   ;				pnt->id,
   ;				pnt->name,
   ;				pnt->dname,
   ;				pnt->tel);
   ;	
	mov	ax,si
	add	ax,277
	push	ax
	mov	ax,si
	add	ax,290
	push	ax
	push	si
	push	word ptr [si+25]
	mov	ax,offset DGROUP:s@+697
	push	ax
	push	word ptr DGROUP:_f+2
	call	near ptr _fprintf
	add	sp,12
   ;	
   ;			fclose(f[1]);
   ;	
	push	word ptr DGROUP:_f+2
	call	near ptr _fclose
	pop	cx
   ;	
   ;			d[1]++;
   ;	
	inc	word ptr DGROUP:d+2
	jmp	@13@482
@13@314:
   ;	
   ;			}
   ;		else if(pnt->dtype==3)
   ;	
	cmp	word ptr [si+288],3
	jne	short @13@362
   ;	
   ;			{
   ;			strcpy(pnt->dname,"Yellow Fever");
   ;	
	mov	ax,offset DGROUP:s@+730
	push	ax
	mov	ax,si
	add	ax,290
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;			f[2]=fopen("YELLOWFEVER","a+");
   ;	
	mov	ax,offset DGROUP:s@+755
	push	ax
	mov	ax,offset DGROUP:s@+743
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	word ptr DGROUP:_f+4,ax
   ;	
   ;			fprintf(f[2]," | %4d | %-25s | %-25s | %11s |\n",
   ;	
   ;	
   ;				pnt->id,
   ;				pnt->name,
   ;				pnt->dname,
   ;				pnt->tel);
   ;	
	mov	ax,si
	add	ax,277
	push	ax
	mov	ax,si
	add	ax,290
	push	ax
	push	si
	push	word ptr [si+25]
	mov	ax,offset DGROUP:s@+758
	push	ax
	push	word ptr DGROUP:_f+4
	call	near ptr _fprintf
	add	sp,12
   ;	
   ;			fclose(f[2]);
   ;	
	push	word ptr DGROUP:_f+4
	call	near ptr _fclose
	pop	cx
   ;	
   ;			d[2]++;
   ;	
	inc	word ptr DGROUP:d+4
	jmp	@13@482
@13@362:
   ;	
   ;			}
   ;		else if(pnt->dtype==4)
   ;	
	cmp	word ptr [si+288],4
	jne	short @13@410
   ;	
   ;			{
   ;			strcpy(pnt->dname,"Cholera");
   ;	
	mov	ax,offset DGROUP:s@+791
	push	ax
	mov	ax,si
	add	ax,290
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;			f[3]=fopen("CHOLERA","a+");
   ;	
	mov	ax,offset DGROUP:s@+807
	push	ax
	mov	ax,offset DGROUP:s@+799
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	word ptr DGROUP:_f+6,ax
   ;	
   ;			fprintf(f[3]," | %4d | %-25s | %-25s | %11s |\n",
   ;	
   ;	
   ;				pnt->id,
   ;				pnt->name,
   ;				pnt->dname,
   ;				pnt->tel);
   ;	
	mov	ax,si
	add	ax,277
	push	ax
	mov	ax,si
	add	ax,290
	push	ax
	push	si
	push	word ptr [si+25]
	mov	ax,offset DGROUP:s@+810
	push	ax
	push	word ptr DGROUP:_f+6
	call	near ptr _fprintf
	add	sp,12
   ;	
   ;			fclose(f[3]);
   ;	
	push	word ptr DGROUP:_f+6
	call	near ptr _fclose
	pop	cx
   ;	
   ;			d[3]++;
   ;	
	inc	word ptr DGROUP:d+6
	jmp	@13@482
@13@410:
   ;	
   ;			}
   ;		else if(pnt->dtype==5)
   ;	
	cmp	word ptr [si+288],5
	jne	short @13@458
   ;	
   ;			{
   ;			strcpy(pnt->dname,"Diphtheria");
   ;	
	mov	ax,offset DGROUP:s@+843
	push	ax
	mov	ax,si
	add	ax,290
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;			f[4]=fopen("DIPHTHERIA","a+");
   ;	
	mov	ax,offset DGROUP:s@+865
	push	ax
	mov	ax,offset DGROUP:s@+854
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	word ptr DGROUP:_f+8,ax
   ;	
   ;			fprintf(f[4]," | %4d | %-25s | %-25s | %11s |\n",
   ;	
   ;	
   ;				pnt->id,
   ;				pnt->name,
   ;				pnt->dname,
   ;				pnt->tel);
   ;	
	mov	ax,si
	add	ax,277
	push	ax
	mov	ax,si
	add	ax,290
	push	ax
	push	si
	push	word ptr [si+25]
	mov	ax,offset DGROUP:s@+868
	push	ax
	push	word ptr DGROUP:_f+8
	call	near ptr _fprintf
	add	sp,12
   ;	
   ;			fclose(f[4]);
   ;	
	push	word ptr DGROUP:_f+8
	call	near ptr _fclose
	pop	cx
   ;	
   ;			d[4]++;
   ;	
	inc	word ptr DGROUP:d+8
	jmp	short @13@482
@13@458:
   ;	
   ;			}
   ;		else
   ;			{
   ;			strcpy(pnt->dname,"Unknown");
   ;	
	mov	ax,offset DGROUP:s@+901
	push	ax
	mov	ax,si
	add	ax,290
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;			f[5]=fopen("UNKNOWN","a+");
   ;	
	mov	ax,offset DGROUP:s@+917
	push	ax
	mov	ax,offset DGROUP:s@+909
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	word ptr DGROUP:_f+10,ax
   ;	
   ;			fprintf(f[5]," | %4d | %-25s | %-25s | %11s |\n",
   ;	
   ;	
   ;				pnt->id,
   ;				pnt->name,
   ;				pnt->dname,
   ;				pnt->tel);
   ;	
	mov	ax,si
	add	ax,277
	push	ax
	mov	ax,si
	add	ax,290
	push	ax
	push	si
	push	word ptr [si+25]
	mov	ax,offset DGROUP:s@+920
	push	ax
	push	word ptr DGROUP:_f+10
	call	near ptr _fprintf
	add	sp,12
   ;	
   ;			fclose(f[5]);
   ;	
	push	word ptr DGROUP:_f+10
	call	near ptr _fclose
	pop	cx
   ;	
   ;			d[5]++;
   ;	
	inc	word ptr DGROUP:d+10
@13@482:
   ;	
   ;			}
   ;	
   ;	dtotal++;
   ;	
	inc	word ptr DGROUP:dtotal
   ;	
   ;	fprintf(fpnt," | %4d | %-25s | %-25s | %11s |\n",
   ;	
   ;	
   ;			pnt->id,
   ;			pnt->name,
   ;			pnt->dname,
   ;			pnt->tel);
   ;	
	mov	ax,si
	add	ax,277
	push	ax
	mov	ax,si
	add	ax,290
	push	ax
	push	si
	push	word ptr [si+25]
	mov	ax,offset DGROUP:s@+953
	push	ax
	push	word ptr [bp+6]
	call	near ptr _fprintf
	add	sp,12
   ;	
   ;	fprintf(fadd,"----------------------------------------------------------------------------------");
   ;	
	mov	ax,offset DGROUP:s@+986
	push	ax
	push	word ptr [bp+8]
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(fadd,"\nPatient ID		:\n%6d\n",pnt->id);
   ;	
	push	word ptr [si+25]
	mov	ax,offset DGROUP:s@+1069
	push	ax
	push	word ptr [bp+8]
	call	near ptr _fprintf
	add	sp,6
   ;	
   ;	fprintf(fadd,"\nPatient Name		:\n%s\n",pnt->name);
   ;	
	push	si
	mov	ax,offset DGROUP:s@+1089
	push	ax
	push	word ptr [bp+8]
	call	near ptr _fprintf
	add	sp,6
   ;	
   ;	fprintf(fadd,"\nPatient Address		:\n%s\n",pnt->add);
   ;	
	mov	ax,si
	add	ax,27
	push	ax
	mov	ax,offset DGROUP:s@+1110
	push	ax
	push	word ptr [bp+8]
	call	near ptr _fprintf
	add	sp,6
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@add$qp7patientp4FILEt2	endp
   ;	
   ;	void addp(void)
   ;	
	assume	cs:_TEXT
@addp$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,318
	push	si
	push	di
   ;	
   ;	{
   ;	struct patient p;
   ;	FILE *fp,*fa;
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	fp=fopen("PATIENT","a+");
   ;	
	mov	ax,offset DGROUP:s@+1142
	push	ax
	mov	ax,offset DGROUP:s@+1134
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	di,ax
   ;	
   ;	fa=fopen("ADDRESS","a+");
   ;	
	mov	ax,offset DGROUP:s@+1153
	push	ax
	mov	ax,offset DGROUP:s@+1145
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
@14@50:
   ;	
   ;	
   ;	char again;
   ;	
   ;	do
   ;	{
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	add(&p,fp,fa);
   ;	
	push	si
	push	di
	lea	ax,word ptr [bp-318]
	push	ax
	call	near ptr @add$qp7patientp4FILEt2
	add	sp,6
@14@74:
   ;	
   ;	reask:
   ;	gotoxy(20,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;		space(50);
   ;	
	mov	ax,50
	push	ax
	call	near ptr @space$qi
	pop	cx
   ;	
   ;	gotoxy(22,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,22
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Want to add another Patient ? (Y/N) : ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1156
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	cin>>again;
   ;	
	lea	ax,word ptr [bp-1]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qrzc
	pop	cx
	pop	cx
   ;	
   ;	if(!(again=='n'||again=='N'||again=='y'||again=='Y'))
   ;	
	cmp	byte ptr [bp-1],110
	je	short @14@194
	cmp	byte ptr [bp-1],78
	je	short @14@194
	cmp	byte ptr [bp-1],121
	je	short @14@194
	cmp	byte ptr [bp-1],89
	je	short @14@194
   ;	
   ;	{
   ;	gotoxy(22,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,22
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	   cout<<"Please enter valid choice character...";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1195
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	goto reask;
   ;	
	jmp	@14@74
@14@194:
   ;	
   ;	}
   ;	}while(again=='y'||again=='Y');
   ;	
	cmp	byte ptr [bp-1],121
	jne	@@1
	jmp	@14@50
@@1:
	cmp	byte ptr [bp-1],89
	jne	@@2
	jmp	@14@50
@@2:
   ;	
   ;	
   ;	fclose(fp);
   ;	
	push	di
	call	near ptr _fclose
	pop	cx
   ;	
   ;	fclose(fa);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@addp$qv	endp
	?debug	C E99C53FE7C0B4D4D434845434B2E435050
   ;	
   ;	int mmcheck(void)
   ;	
	assume	cs:_TEXT
@mmcheck$qv	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
   ;	
   ;	{
   ;	int choice,correct=0;
   ;	
	xor	di,di
@15@50:
   ;	
   ;	FILE *mchk;
   ;	mlist:
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	gotoxy(16,5);
   ;	
	mov	ax,5
	push	ax
	mov	ax,16
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	line(48,'*');
   ;	
	mov	al,42
	push	ax
	mov	ax,48
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	gotoxy(16,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,16
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	line(48,'*');
   ;	
	mov	al,42
	push	ax
	mov	ax,48
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	gotoxy(31,6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,31
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Check Out Patients";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1234
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	
   ;	gotoxy(8,21);
   ;	
	mov	ax,21
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Information : Please note that all patients will be checked out.";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1253
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	
   ;	gotoxy(18,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,18
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Select Disease to Check Out Patients's Lists";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1318
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	
   ;	gotoxy(33,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"1. Fever";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1363
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"2. Cold Virus";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1372
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"3. Yellow Fever";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1386
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"4. Cholera";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1402
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"5. Diphtheria";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1413
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"6. UNKNOWN";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1427
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"7. Go Back";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1438
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"8. Main Menu";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1449
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,18);
   ;	
	mov	ax,18
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"9. Exit";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1462
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	
   ;	if(!correct)
   ;	
	or	di,di
	jne	short @15@170
   ;	
   ;	   {
   ;	   gotoxy(23,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	   cout<<"What do you want to do ?  ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1470
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	   cin>>choice;
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;	   if( choice<1 || choice>9 )
   ;	
	cmp	word ptr [bp-2],1
	jl	short @15@122
	cmp	word ptr [bp-2],9
	jle	short @15@146
@15@122:
   ;	
   ;		{
   ;		correct++;
   ;	
	inc	di
   ;	
   ;		goto mlist;
   ;	
	jmp	@15@50
@15@146:
	jmp	short @15@290
@15@170:
   ;	
   ;		}
   ;	   }
   ;	else
   ;	   {
   ;	   gotoxy(20,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	   cout<<"Please enter valid choice number...";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1497
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	   gotoxy(23,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	   cout<<"What do you want to do ?  ";
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
   ;	   cin>>choice;
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;	   if( choice<1 || choice>9 )
   ;	
	cmp	word ptr [bp-2],1
	jl	short @15@218
	cmp	word ptr [bp-2],9
	jle	short @15@266
@15@218:
   ;	
   ;		{
   ;		correct=0;
   ;	
	xor	di,di
   ;	
   ;		correct++;
   ;	
	inc	di
   ;	
   ;		goto mlist;
   ;	
	jmp	@15@50
	jmp	short @15@290
@15@266:
   ;	
   ;		}
   ;	   else
   ;		{
   ;		correct=0;
   ;	
	xor	di,di
@15@290:
   ;	
   ;		}
   ;	   }
   ;	
   ;	if(choice==1)
   ;	
	cmp	word ptr [bp-2],1
	je	@@3
	jmp	@15@338
@@3:
   ;	
   ;	{
   ;	mchk=fopen("FEVER","w");
   ;	
	mov	ax,offset DGROUP:s@+1566
	push	ax
	mov	ax,offset DGROUP:s@+1560
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+1568
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
   ;	
	mov	ax,offset DGROUP:s@+1649
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+1730
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fclose(mchk);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	
   ;	clear(3);
   ;	
	mov	ax,3
	push	ax
	call	near ptr @clear$qi
	pop	cx
   ;	
   ;	gotoxy(33,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Please Wait...";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1811
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	delay(1000);
   ;	
	mov	ax,1000
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	gotoxy(26,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,26
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"All Patients are Checked Out.";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+1826
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	goto mlist;
   ;	
	jmp	@15@50
@15@338:
   ;	
   ;	}
   ;	
   ;	if(choice==2)
   ;	
	cmp	word ptr [bp-2],2
	je	@@4
	jmp	@15@386
@@4:
   ;	
   ;	{
   ;	mchk=fopen("COLDVIRUS","w");
   ;	
	mov	ax,offset DGROUP:s@+1866
	push	ax
	mov	ax,offset DGROUP:s@+1856
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+1868
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
   ;	
	mov	ax,offset DGROUP:s@+1949
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+2030
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fclose(mchk);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	
   ;	clear(3);
   ;	
	mov	ax,3
	push	ax
	call	near ptr @clear$qi
	pop	cx
   ;	
   ;	gotoxy(33,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Please Wait...";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2111
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	delay(1000);
   ;	
	mov	ax,1000
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	gotoxy(26,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,26
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"All Patients are Checked Out.";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2126
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	goto mlist;
   ;	
	jmp	@15@50
@15@386:
   ;	
   ;	}
   ;	
   ;	if(choice==3)
   ;	
	cmp	word ptr [bp-2],3
	je	@@5
	jmp	@15@434
@@5:
   ;	
   ;	{
   ;	mchk=fopen("YELLOWFEVER","w");
   ;	
	mov	ax,offset DGROUP:s@+2168
	push	ax
	mov	ax,offset DGROUP:s@+2156
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+2170
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
   ;	
	mov	ax,offset DGROUP:s@+2251
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+2332
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fclose(mchk);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	
   ;	clear(3);
   ;	
	mov	ax,3
	push	ax
	call	near ptr @clear$qi
	pop	cx
   ;	
   ;	gotoxy(33,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Please Wait...";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2413
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	delay(1000);
   ;	
	mov	ax,1000
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	gotoxy(26,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,26
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"All Patients are Checked Out.";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2428
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	goto mlist;
   ;	
	jmp	@15@50
@15@434:
   ;	
   ;	}
   ;	
   ;	if(choice==4)
   ;	
	cmp	word ptr [bp-2],4
	je	@@6
	jmp	@15@482
@@6:
   ;	
   ;	{
   ;	mchk=fopen("CHOLERA","w");
   ;	
	mov	ax,offset DGROUP:s@+2466
	push	ax
	mov	ax,offset DGROUP:s@+2458
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+2468
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
   ;	
	mov	ax,offset DGROUP:s@+2549
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+2630
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fclose(mchk);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	
   ;	clear(3);
   ;	
	mov	ax,3
	push	ax
	call	near ptr @clear$qi
	pop	cx
   ;	
   ;	gotoxy(33,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Please Wait...";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2711
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	delay(1000);
   ;	
	mov	ax,1000
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	gotoxy(26,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,26
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"All Patients are Checked Out.";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+2726
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	goto mlist;
   ;	
	jmp	@15@50
@15@482:
   ;	
   ;	}
   ;	
   ;	if(choice==5)
   ;	
	cmp	word ptr [bp-2],5
	je	@@7
	jmp	@15@530
@@7:
   ;	
   ;	{
   ;	mchk=fopen("DIPHTHERIA","w");
   ;	
	mov	ax,offset DGROUP:s@+2767
	push	ax
	mov	ax,offset DGROUP:s@+2756
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+2769
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
   ;	
	mov	ax,offset DGROUP:s@+2850
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+2931
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fclose(mchk);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	
   ;	clear(3);
   ;	
	mov	ax,3
	push	ax
	call	near ptr @clear$qi
	pop	cx
   ;	
   ;	gotoxy(33,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Please Wait...";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3012
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	delay(1000);
   ;	
	mov	ax,1000
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	gotoxy(26,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,26
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"All Patients are Checked Out.";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3027
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	goto mlist;
   ;	
	jmp	@15@50
@15@530:
   ;	
   ;	}
   ;	
   ;	if(choice==6)
   ;	
	cmp	word ptr [bp-2],6
	je	@@8
	jmp	@15@578
@@8:
   ;	
   ;	{
   ;	mchk=fopen("UNKNOWN","w");
   ;	
	mov	ax,offset DGROUP:s@+3065
	push	ax
	mov	ax,offset DGROUP:s@+3057
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+3067
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
   ;	
	mov	ax,offset DGROUP:s@+3148
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+3229
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fclose(mchk);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	
   ;	clear(3);
   ;	
	mov	ax,3
	push	ax
	call	near ptr @clear$qi
	pop	cx
   ;	
   ;	gotoxy(33,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Please Wait...";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3310
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	delay(1000);
   ;	
	mov	ax,1000
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	gotoxy(26,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,26
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"All Patients are Checked Out.";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3325
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	goto mlist;
   ;	
	jmp	@15@50
@15@578:
   ;	
   ;	}
   ;	return choice;
   ;	
	mov	ax,word ptr [bp-2]
	jmp	short @15@602
@15@602:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@mmcheck$qv	endp
	?debug	C E99C53FE7C0A4D434845434B2E435050
   ;	
   ;	int mcheck(void)
   ;	
	assume	cs:_TEXT
@mcheck$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
   ;	
   ;	{
   ;	FILE *mchk;
   ;	int lchoice,correct=0;
   ;	
	xor	di,di
@16@50:
   ;	
   ;	showlist:
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	gotoxy(16,5);
   ;	
	mov	ax,5
	push	ax
	mov	ax,16
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	line(48,'*');
   ;	
	mov	al,42
	push	ax
	mov	ax,48
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	gotoxy(16,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,16
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	line(48,'*');
   ;	
	mov	al,42
	push	ax
	mov	ax,48
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	gotoxy(31,6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,31
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Check Out Patients";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3355
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	
   ;	gotoxy(8,21);
   ;	
	mov	ax,21
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Information : Please note that all patients will be checked out.";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3374
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	
   ;	gotoxy(18,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,18
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Select Disease to Check Out Patients's Lists";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3439
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	
   ;	gotoxy(23,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"1. All Patients' List";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3484
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(23,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"2. Patients' List by Disease";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3506
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(23,14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"3. Main Menu";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3535
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(23,16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"4. Exit";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3548
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	
   ;	if(!correct)
   ;	
	or	di,di
	jne	short @16@170
   ;	
   ;	   {
   ;	   gotoxy(23,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	   cout<<"What do you want to do ?  ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3556
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	   cin>>lchoice;
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;	   if( lchoice<1 || lchoice>4 )
   ;	
	cmp	word ptr [bp-2],1
	jl	short @16@122
	cmp	word ptr [bp-2],4
	jle	short @16@146
@16@122:
   ;	
   ;		{
   ;		correct++;
   ;	
	inc	di
   ;	
   ;		goto showlist;
   ;	
	jmp	@16@50
@16@146:
	jmp	short @16@290
@16@170:
   ;	
   ;		}
   ;	   }
   ;	else
   ;	   {
   ;	   gotoxy(20,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	   cout<<"Please enter valid choice number...";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3583
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	   gotoxy(23,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	   cout<<"What do you want to do ?  ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+3619
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	   cin>>lchoice;
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;	   if( lchoice<1 || lchoice>4 )
   ;	
	cmp	word ptr [bp-2],1
	jl	short @16@218
	cmp	word ptr [bp-2],4
	jle	short @16@266
@16@218:
   ;	
   ;		{
   ;		correct=0;
   ;	
	xor	di,di
   ;	
   ;		correct++;
   ;	
	inc	di
   ;	
   ;		goto showlist;
   ;	
	jmp	@16@50
	jmp	short @16@290
@16@266:
   ;	
   ;		}
   ;	   else
   ;		{
   ;		correct=0;
   ;	
	xor	di,di
@16@290:
   ;	
   ;		}
   ;	   }
   ;	
   ;	
   ;	if(lchoice==1)
   ;	
	cmp	word ptr [bp-2],1
	je	@@9
	jmp	@16@338
@@9:
   ;	
   ;	{
   ;	mchk=fopen("PATIENT","w");
   ;	
	mov	ax,offset DGROUP:s@+3654
	push	ax
	mov	ax,offset DGROUP:s@+3646
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+3656
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
   ;	
	mov	ax,offset DGROUP:s@+3737
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+3818
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fclose(mchk);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	
   ;	mchk=fopen("FEVER","w");
   ;	
	mov	ax,offset DGROUP:s@+3905
	push	ax
	mov	ax,offset DGROUP:s@+3899
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+3907
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
   ;	
	mov	ax,offset DGROUP:s@+3988
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+4069
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fclose(mchk);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	
   ;	mchk=fopen("COLDVIRUS","w");
   ;	
	mov	ax,offset DGROUP:s@+4160
	push	ax
	mov	ax,offset DGROUP:s@+4150
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+4162
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
   ;	
	mov	ax,offset DGROUP:s@+4243
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+4324
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fclose(mchk);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	
   ;	mchk=fopen("YELLOWFEVER","w");
   ;	
	mov	ax,offset DGROUP:s@+4417
	push	ax
	mov	ax,offset DGROUP:s@+4405
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+4419
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
   ;	
	mov	ax,offset DGROUP:s@+4500
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+4581
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fclose(mchk);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	
   ;	mchk=fopen("CHOLERA","w");
   ;	
	mov	ax,offset DGROUP:s@+4670
	push	ax
	mov	ax,offset DGROUP:s@+4662
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+4672
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
   ;	
	mov	ax,offset DGROUP:s@+4753
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+4834
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fclose(mchk);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	
   ;	mchk=fopen("DIPHTHERIA","w");
   ;	
	mov	ax,offset DGROUP:s@+4926
	push	ax
	mov	ax,offset DGROUP:s@+4915
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+4928
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
   ;	
	mov	ax,offset DGROUP:s@+5009
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+5090
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fclose(mchk);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	
   ;	mchk=fopen("UNKNOWN","w");
   ;	
	mov	ax,offset DGROUP:s@+5179
	push	ax
	mov	ax,offset DGROUP:s@+5171
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+5181
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
   ;	
	mov	ax,offset DGROUP:s@+5262
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
   ;	
	mov	ax,offset DGROUP:s@+5343
	push	ax
	push	si
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	fclose(mchk);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	
   ;	clear(3);
   ;	
	mov	ax,3
	push	ax
	call	near ptr @clear$qi
	pop	cx
   ;	
   ;	gotoxy(33,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Please Wait...";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5424
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	delay(1000);
   ;	
	mov	ax,1000
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	gotoxy(26,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,26
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"All Patients are Checked Out.";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5439
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	goto showlist;
   ;	
	jmp	@16@50
@16@338:
   ;	
   ;	}
   ;	
   ;	if(lchoice==2)
   ;	
	cmp	word ptr [bp-2],2
	jne	short @16@506
   ;	
   ;	{
   ;	int mch=mmcheck();
   ;	
	call	near ptr @mmcheck$qv
	mov	word ptr [bp-4],ax
   ;	
   ;	if(mch==7)
   ;	
	cmp	word ptr [bp-4],7
	jne	short @16@410
   ;	
   ;		goto showlist;
   ;	
	jmp	@16@50
@16@410:
   ;	
   ;	if(mch==8)
   ;	
	cmp	word ptr [bp-4],8
	jne	short @16@458
   ;	
   ;		lchoice=3;
   ;	
	mov	word ptr [bp-2],3
@16@458:
   ;	
   ;	if(mch==9)
   ;	
	cmp	word ptr [bp-4],9
	jne	short @16@506
   ;	
   ;		lchoice=4;
   ;	
	mov	word ptr [bp-2],4
@16@506:
   ;	
   ;	}
   ;	
   ;	return lchoice;
   ;	
	mov	ax,word ptr [bp-2]
	jmp	short @16@530
@16@530:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@mcheck$qv	endp
	?debug	C E99C53FE7C0A4D4D4C4953542E435050
   ;	
   ;	int mmlist(void)
   ;	
	assume	cs:_TEXT
@mmlist$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
   ;	
   ;	{
   ;	int choice,correct=0;
   ;	
	xor	di,di
@17@50:
   ;	
   ;	dlist:
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	gotoxy(20,5);
   ;	
	mov	ax,5
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	line(40,'*');
   ;	
	mov	al,42
	push	ax
	mov	ax,40
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	gotoxy(32,6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,32
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Patient's Details";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5469
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(20,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	line(40,'*');
   ;	
	mov	al,42
	push	ax
	mov	ax,40
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	
   ;	gotoxy(21,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,21
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Select Disease to View Patients's List";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5487
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"1. Fever";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5526
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"2. Cold Virus";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5535
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"3. Yellow Fever";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5549
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"4. Cholera";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5565
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"5. Diphtheria";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5576
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"6. UNKNOWN";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5590
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"7. Go Back";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5601
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"8. Main Menu";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5612
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(33,18);
   ;	
	mov	ax,18
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"9. Exit";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5625
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	
   ;	if(!correct)
   ;	
	or	di,di
	jne	short @17@170
   ;	
   ;	   {
   ;	   gotoxy(23,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	   cout<<"What do you want to do ?  ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5633
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	   cin>>choice;
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;	   if( choice<1 || choice>9 )
   ;	
	cmp	word ptr [bp-2],1
	jl	short @17@122
	cmp	word ptr [bp-2],9
	jle	short @17@146
@17@122:
   ;	
   ;		{
   ;		correct++;
   ;	
	inc	di
   ;	
   ;		goto dlist;
   ;	
	jmp	@17@50
@17@146:
	jmp	short @17@290
@17@170:
   ;	
   ;		}
   ;	   }
   ;	else
   ;	   {
   ;	   gotoxy(20,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	   cout<<"Please enter valid choice number...";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5660
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	   gotoxy(23,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	   cout<<"What do you want to do ?  ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5696
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	   cin>>choice;
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;	   if( choice<1 || choice>9 )
   ;	
	cmp	word ptr [bp-2],1
	jl	short @17@218
	cmp	word ptr [bp-2],9
	jle	short @17@266
@17@218:
   ;	
   ;		{
   ;		correct=0;
   ;	
	xor	di,di
   ;	
   ;		correct++;
   ;	
	inc	di
   ;	
   ;		goto dlist;
   ;	
	jmp	@17@50
	jmp	short @17@290
@17@266:
   ;	
   ;		}
   ;	   else
   ;		{
   ;		correct=0;
   ;	
	xor	di,di
@17@290:
   ;	
   ;		}
   ;	   }
   ;	
   ;	FILE *alist;
   ;	char c;
   ;	
   ;	if(choice==1)
   ;	
	cmp	word ptr [bp-2],1
	jne	short @17@482
   ;	
   ;	{
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	alist=fopen("FEVER","r");
   ;	
	mov	ax,offset DGROUP:s@+5729
	push	ax
	mov	ax,offset DGROUP:s@+5723
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
	jmp	short @17@362
@17@338:
   ;	
   ;	while((c=getc(alist)) != EOF)
   ;		cout<<c;
   ;	
	mov	al,byte ptr [bp-3]
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$qzc
	pop	cx
	pop	cx
@17@362:
	dec	word ptr [si]
	mov	ax,word ptr [si]
	or	ax,ax
	jl	short @17@410
	mov	bx,word ptr [si+10]
	inc	word ptr [si+10]
	mov	al,byte ptr [bx]
	mov	ah,0
	jmp	short @17@434
@17@410:
	push	si
	call	near ptr __fgetc
	pop	cx
@17@434:
	mov	byte ptr [bp-3],al
	cbw	
	cmp	ax,65535
	jne	short @17@338
   ;	
   ;	cout<<" "; line(78,'-');
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5731
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	al,45
	push	ax
	mov	ax,78
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	fclose(alist);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	goto dlist;
   ;	
	jmp	@17@50
@17@482:
   ;	
   ;	}
   ;	
   ;	if(choice==2)
   ;	
	cmp	word ptr [bp-2],2
	jne	short @17@674
   ;	
   ;	{
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	alist=fopen("COLDVIRUS","r");
   ;	
	mov	ax,offset DGROUP:s@+5743
	push	ax
	mov	ax,offset DGROUP:s@+5733
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
	jmp	short @17@554
@17@530:
   ;	
   ;	while((c=getc(alist)) != EOF)
   ;		cout<<c;
   ;	
	mov	al,byte ptr [bp-3]
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$qzc
	pop	cx
	pop	cx
@17@554:
	dec	word ptr [si]
	mov	ax,word ptr [si]
	or	ax,ax
	jl	short @17@602
	mov	bx,word ptr [si+10]
	inc	word ptr [si+10]
	mov	al,byte ptr [bx]
	mov	ah,0
	jmp	short @17@626
@17@602:
	push	si
	call	near ptr __fgetc
	pop	cx
@17@626:
	mov	byte ptr [bp-3],al
	cbw	
	cmp	ax,65535
	jne	short @17@530
   ;	
   ;	cout<<" "; line(78,'-');
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5745
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	al,45
	push	ax
	mov	ax,78
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	fclose(alist);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	goto dlist;
   ;	
	jmp	@17@50
@17@674:
   ;	
   ;	}
   ;	
   ;	if(choice==3)
   ;	
	cmp	word ptr [bp-2],3
	jne	short @17@866
   ;	
   ;	{
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	alist=fopen("YELLOWFEVER","r");
   ;	
	mov	ax,offset DGROUP:s@+5759
	push	ax
	mov	ax,offset DGROUP:s@+5747
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
	jmp	short @17@746
@17@722:
   ;	
   ;	while((c=getc(alist)) != EOF)
   ;		cout<<c;
   ;	
	mov	al,byte ptr [bp-3]
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$qzc
	pop	cx
	pop	cx
@17@746:
	dec	word ptr [si]
	mov	ax,word ptr [si]
	or	ax,ax
	jl	short @17@794
	mov	bx,word ptr [si+10]
	inc	word ptr [si+10]
	mov	al,byte ptr [bx]
	mov	ah,0
	jmp	short @17@818
@17@794:
	push	si
	call	near ptr __fgetc
	pop	cx
@17@818:
	mov	byte ptr [bp-3],al
	cbw	
	cmp	ax,65535
	jne	short @17@722
   ;	
   ;	cout<<" "; line(78,'-');
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5761
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	al,45
	push	ax
	mov	ax,78
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	fclose(alist);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	goto dlist;
   ;	
	jmp	@17@50
@17@866:
   ;	
   ;	}
   ;	
   ;	if(choice==4)
   ;	
	cmp	word ptr [bp-2],4
	jne	short @17@1058
   ;	
   ;	{
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	alist=fopen("CHOLERA","r");
   ;	
	mov	ax,offset DGROUP:s@+5771
	push	ax
	mov	ax,offset DGROUP:s@+5763
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
	jmp	short @17@938
@17@914:
   ;	
   ;	while((c=getc(alist)) != EOF)
   ;		cout<<c;
   ;	
	mov	al,byte ptr [bp-3]
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$qzc
	pop	cx
	pop	cx
@17@938:
	dec	word ptr [si]
	mov	ax,word ptr [si]
	or	ax,ax
	jl	short @17@986
	mov	bx,word ptr [si+10]
	inc	word ptr [si+10]
	mov	al,byte ptr [bx]
	mov	ah,0
	jmp	short @17@1010
@17@986:
	push	si
	call	near ptr __fgetc
	pop	cx
@17@1010:
	mov	byte ptr [bp-3],al
	cbw	
	cmp	ax,65535
	jne	short @17@914
   ;	
   ;	cout<<" "; line(78,'-');
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5773
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	al,45
	push	ax
	mov	ax,78
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	fclose(alist);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	goto dlist;
   ;	
	jmp	@17@50
@17@1058:
   ;	
   ;	}
   ;	
   ;	if(choice==5)
   ;	
	cmp	word ptr [bp-2],5
	jne	short @17@1250
   ;	
   ;	{
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	alist=fopen("DIPHTHERIA","r");
   ;	
	mov	ax,offset DGROUP:s@+5786
	push	ax
	mov	ax,offset DGROUP:s@+5775
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
	jmp	short @17@1130
@17@1106:
   ;	
   ;	while((c=getc(alist)) != EOF)
   ;		cout<<c;
   ;	
	mov	al,byte ptr [bp-3]
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$qzc
	pop	cx
	pop	cx
@17@1130:
	dec	word ptr [si]
	mov	ax,word ptr [si]
	or	ax,ax
	jl	short @17@1178
	mov	bx,word ptr [si+10]
	inc	word ptr [si+10]
	mov	al,byte ptr [bx]
	mov	ah,0
	jmp	short @17@1202
@17@1178:
	push	si
	call	near ptr __fgetc
	pop	cx
@17@1202:
	mov	byte ptr [bp-3],al
	cbw	
	cmp	ax,65535
	jne	short @17@1106
   ;	
   ;	cout<<" "; line(78,'-');
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5788
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	al,45
	push	ax
	mov	ax,78
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	fclose(alist);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	goto dlist;
   ;	
	jmp	@17@50
@17@1250:
   ;	
   ;	}
   ;	
   ;	if(choice==6)
   ;	
	cmp	word ptr [bp-2],6
	jne	short @17@1442
   ;	
   ;	{
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	alist=fopen("UNKNOWN","r");
   ;	
	mov	ax,offset DGROUP:s@+5798
	push	ax
	mov	ax,offset DGROUP:s@+5790
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
	jmp	short @17@1322
@17@1298:
   ;	
   ;	while((c=getc(alist)) != EOF)
   ;		cout<<c;
   ;	
	mov	al,byte ptr [bp-3]
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$qzc
	pop	cx
	pop	cx
@17@1322:
	dec	word ptr [si]
	mov	ax,word ptr [si]
	or	ax,ax
	jl	short @17@1370
	mov	bx,word ptr [si+10]
	inc	word ptr [si+10]
	mov	al,byte ptr [bx]
	mov	ah,0
	jmp	short @17@1394
@17@1370:
	push	si
	call	near ptr __fgetc
	pop	cx
@17@1394:
	mov	byte ptr [bp-3],al
	cbw	
	cmp	ax,65535
	jne	short @17@1298
   ;	
   ;	cout<<" "; line(78,'-');
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5800
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	al,45
	push	ax
	mov	ax,78
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	fclose(alist);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	goto dlist;
   ;	
	jmp	@17@50
@17@1442:
   ;	
   ;	}
   ;	
   ;	return choice;
   ;	
	mov	ax,word ptr [bp-2]
	jmp	short @17@1466
@17@1466:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@mmlist$qv	endp
	?debug	C E99C53FE7C094D4C4953542E435050
   ;	
   ;	int mlist(void)
   ;	
	assume	cs:_TEXT
@mlist$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
	push	di
   ;	
   ;	{
   ;	int lchoice,correct=0;
   ;	
	xor	di,di
@18@50:
   ;	
   ;	showlist:
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	gotoxy(20,5);
   ;	
	mov	ax,5
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	line(40,'*');
   ;	
	mov	al,42
	push	ax
	mov	ax,40
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	gotoxy(32,6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,32
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Patient's Details";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5802
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(20,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	line(40,'*');
   ;	
	mov	al,42
	push	ax
	mov	ax,40
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	
   ;	gotoxy(23,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"1. All Patients' List";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5820
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(23,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"2. Patients' List by Disease";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5842
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(23,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"3. Main Menu";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5871
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(23,15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"4. Exit";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5884
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	
   ;	if(!correct)
   ;	
	or	di,di
	jne	short @18@170
   ;	
   ;	   {
   ;	   gotoxy(23,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	   cout<<"What do you want to do ?  ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5892
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	   cin>>lchoice;
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;	   if( lchoice<1 || lchoice>4 )
   ;	
	cmp	word ptr [bp-2],1
	jl	short @18@122
	cmp	word ptr [bp-2],4
	jle	short @18@146
@18@122:
   ;	
   ;		{
   ;		correct++;
   ;	
	inc	di
   ;	
   ;		goto showlist;
   ;	
	jmp	@18@50
@18@146:
	jmp	short @18@290
@18@170:
   ;	
   ;		}
   ;	   }
   ;	else
   ;	   {
   ;	   gotoxy(20,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	   cout<<"Please enter valid choice number...";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5919
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	   gotoxy(23,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	   cout<<"What do you want to do ?  ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5955
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	   cin>>lchoice;
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;	   if( lchoice<1 || lchoice>4 )
   ;	
	cmp	word ptr [bp-2],1
	jl	short @18@218
	cmp	word ptr [bp-2],4
	jle	short @18@266
@18@218:
   ;	
   ;		{
   ;		correct=0;
   ;	
	xor	di,di
   ;	
   ;		correct++;
   ;	
	inc	di
   ;	
   ;		goto showlist;
   ;	
	jmp	@18@50
	jmp	short @18@290
@18@266:
   ;	
   ;		}
   ;	   else
   ;		{
   ;		correct=0;
   ;	
	xor	di,di
@18@290:
   ;	
   ;		}
   ;	   }
   ;	
   ;	FILE *alst;
   ;	char C;
   ;	
   ;	if(lchoice==1)
   ;	
	cmp	word ptr [bp-2],1
	jne	short @18@482
   ;	
   ;	{
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	alst=fopen("PATIENT","r");
   ;	
	mov	ax,offset DGROUP:s@+5990
	push	ax
	mov	ax,offset DGROUP:s@+5982
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
	jmp	short @18@362
@18@338:
   ;	
   ;	while((C=getc(alst)) != EOF)
   ;		cout<<C;
   ;	
	mov	al,byte ptr [bp-3]
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$qzc
	pop	cx
	pop	cx
@18@362:
	dec	word ptr [si]
	mov	ax,word ptr [si]
	or	ax,ax
	jl	short @18@410
	mov	bx,word ptr [si+10]
	inc	word ptr [si+10]
	mov	al,byte ptr [bx]
	mov	ah,0
	jmp	short @18@434
@18@410:
	push	si
	call	near ptr __fgetc
	pop	cx
@18@434:
	mov	byte ptr [bp-3],al
	cbw	
	cmp	ax,65535
	jne	short @18@338
   ;	
   ;	cout<<" "; line(78,'-');
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+5992
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	al,45
	push	ax
	mov	ax,78
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	fclose(alst);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	goto showlist;
   ;	
	jmp	@18@50
@18@482:
   ;	
   ;	}
   ;	
   ;	if(lchoice==2)
   ;	
	cmp	word ptr [bp-2],2
	jne	short @18@650
   ;	
   ;	{
   ;	int mch=mmlist();
   ;	
	call	near ptr @mmlist$qv
	mov	word ptr [bp-6],ax
   ;	
   ;	if(mch==7)
   ;	
	cmp	word ptr [bp-6],7
	jne	short @18@554
   ;	
   ;		goto showlist;
   ;	
	jmp	@18@50
@18@554:
   ;	
   ;	if(mch==8)
   ;	
	cmp	word ptr [bp-6],8
	jne	short @18@602
   ;	
   ;		lchoice=3;
   ;	
	mov	word ptr [bp-2],3
@18@602:
   ;	
   ;	if(mch==9)
   ;	
	cmp	word ptr [bp-6],9
	jne	short @18@650
   ;	
   ;		lchoice=4;
   ;	
	mov	word ptr [bp-2],4
@18@650:
   ;	
   ;	}
   ;	
   ;	return lchoice;
   ;	
	mov	ax,word ptr [bp-2]
	jmp	short @18@674
@18@674:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@mlist$qv	endp
	?debug	C E99C53FE7C09434F554E542E435050
   ;	
   ;	void count(void)
   ;	
	assume	cs:_TEXT
@count$qv	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
   ;	
   ;	{
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	FILE *alist;
   ;	char c;
   ;	int fc=0;
   ;	
	xor	di,di
   ;	
   ;	
   ;	alist=fopen("FEVER","r");
   ;	
	mov	ax,offset DGROUP:s@+6000
	push	ax
	mov	ax,offset DGROUP:s@+5994
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
	jmp	short @19@98
@19@50:
   ;	
   ;	while((c=getc(alist)) != EOF)
   ;		{
   ;		if(c=='\n')
   ;	
	cmp	byte ptr [bp-1],10
	jne	short @19@98
   ;	
   ;			++fc;
   ;	
	inc	di
@19@98:
	dec	word ptr [si]
	mov	ax,word ptr [si]
	or	ax,ax
	jl	short @19@146
	mov	bx,word ptr [si+10]
	inc	word ptr [si+10]
	mov	al,byte ptr [bx]
	mov	ah,0
	jmp	short @19@170
@19@146:
	push	si
	call	near ptr __fgetc
	pop	cx
@19@170:
	mov	byte ptr [bp-1],al
	cbw	
	cmp	ax,65535
	jne	short @19@50
   ;	
   ;		}
   ;	d[0]=fc-3;
   ;	
	mov	ax,di
	add	ax,65533
	mov	word ptr DGROUP:d,ax
   ;	
   ;	fclose(alist);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	fc=0;
   ;	
	xor	di,di
   ;	
   ;	alist=fopen("COLDVIRUS","r");
   ;	
	mov	ax,offset DGROUP:s@+6012
	push	ax
	mov	ax,offset DGROUP:s@+6002
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
	jmp	short @19@266
@19@218:
   ;	
   ;	while((c=getc(alist)) != EOF)
   ;		{
   ;		if(c=='\n')
   ;	
	cmp	byte ptr [bp-1],10
	jne	short @19@266
   ;	
   ;			++fc;
   ;	
	inc	di
@19@266:
	dec	word ptr [si]
	mov	ax,word ptr [si]
	or	ax,ax
	jl	short @19@314
	mov	bx,word ptr [si+10]
	inc	word ptr [si+10]
	mov	al,byte ptr [bx]
	mov	ah,0
	jmp	short @19@338
@19@314:
	push	si
	call	near ptr __fgetc
	pop	cx
@19@338:
	mov	byte ptr [bp-1],al
	cbw	
	cmp	ax,65535
	jne	short @19@218
   ;	
   ;		}
   ;	d[1]=fc-3;
   ;	
	mov	ax,di
	add	ax,65533
	mov	word ptr DGROUP:d+2,ax
   ;	
   ;	fclose(alist);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	fc=0;
   ;	
	xor	di,di
   ;	
   ;	alist=fopen("YELLOWFEVER","r");
   ;	
	mov	ax,offset DGROUP:s@+6026
	push	ax
	mov	ax,offset DGROUP:s@+6014
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
	jmp	short @19@434
@19@386:
   ;	
   ;	while((c=getc(alist)) != EOF)
   ;		{
   ;		if(c=='\n')
   ;	
	cmp	byte ptr [bp-1],10
	jne	short @19@434
   ;	
   ;			++fc;
   ;	
	inc	di
@19@434:
	dec	word ptr [si]
	mov	ax,word ptr [si]
	or	ax,ax
	jl	short @19@482
	mov	bx,word ptr [si+10]
	inc	word ptr [si+10]
	mov	al,byte ptr [bx]
	mov	ah,0
	jmp	short @19@506
@19@482:
	push	si
	call	near ptr __fgetc
	pop	cx
@19@506:
	mov	byte ptr [bp-1],al
	cbw	
	cmp	ax,65535
	jne	short @19@386
   ;	
   ;		}
   ;	d[2]=fc-3;
   ;	
	mov	ax,di
	add	ax,65533
	mov	word ptr DGROUP:d+4,ax
   ;	
   ;	fclose(alist);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	fc=0;
   ;	
	xor	di,di
   ;	
   ;	alist=fopen("CHOLERA","r");
   ;	
	mov	ax,offset DGROUP:s@+6036
	push	ax
	mov	ax,offset DGROUP:s@+6028
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
	jmp	short @19@602
@19@554:
   ;	
   ;	while((c=getc(alist)) != EOF)
   ;		{
   ;		if(c=='\n')
   ;	
	cmp	byte ptr [bp-1],10
	jne	short @19@602
   ;	
   ;			++fc;
   ;	
	inc	di
@19@602:
	dec	word ptr [si]
	mov	ax,word ptr [si]
	or	ax,ax
	jl	short @19@650
	mov	bx,word ptr [si+10]
	inc	word ptr [si+10]
	mov	al,byte ptr [bx]
	mov	ah,0
	jmp	short @19@674
@19@650:
	push	si
	call	near ptr __fgetc
	pop	cx
@19@674:
	mov	byte ptr [bp-1],al
	cbw	
	cmp	ax,65535
	jne	short @19@554
   ;	
   ;		}
   ;	d[3]=fc-3;
   ;	
	mov	ax,di
	add	ax,65533
	mov	word ptr DGROUP:d+6,ax
   ;	
   ;	fclose(alist);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	fc=0;
   ;	
	xor	di,di
   ;	
   ;	alist=fopen("DIPHTHERIA","r");
   ;	
	mov	ax,offset DGROUP:s@+6049
	push	ax
	mov	ax,offset DGROUP:s@+6038
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
	jmp	short @19@770
@19@722:
   ;	
   ;	while((c=getc(alist)) != EOF)
   ;		{
   ;		if(c=='\n')
   ;	
	cmp	byte ptr [bp-1],10
	jne	short @19@770
   ;	
   ;			++fc;
   ;	
	inc	di
@19@770:
	dec	word ptr [si]
	mov	ax,word ptr [si]
	or	ax,ax
	jl	short @19@818
	mov	bx,word ptr [si+10]
	inc	word ptr [si+10]
	mov	al,byte ptr [bx]
	mov	ah,0
	jmp	short @19@842
@19@818:
	push	si
	call	near ptr __fgetc
	pop	cx
@19@842:
	mov	byte ptr [bp-1],al
	cbw	
	cmp	ax,65535
	jne	short @19@722
   ;	
   ;		}
   ;	d[4]=fc-3;
   ;	
	mov	ax,di
	add	ax,65533
	mov	word ptr DGROUP:d+8,ax
   ;	
   ;	fclose(alist);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	fc=0;
   ;	
	xor	di,di
   ;	
   ;	alist=fopen("UNKNOWN","r");
   ;	
	mov	ax,offset DGROUP:s@+6059
	push	ax
	mov	ax,offset DGROUP:s@+6051
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
	jmp	short @19@938
@19@890:
   ;	
   ;	while((c=getc(alist)) != EOF)
   ;		{
   ;		if(c=='\n')
   ;	
	cmp	byte ptr [bp-1],10
	jne	short @19@938
   ;	
   ;			++fc;
   ;	
	inc	di
@19@938:
	dec	word ptr [si]
	mov	ax,word ptr [si]
	or	ax,ax
	jl	short @19@986
	mov	bx,word ptr [si+10]
	inc	word ptr [si+10]
	mov	al,byte ptr [bx]
	mov	ah,0
	jmp	short @19@1010
@19@986:
	push	si
	call	near ptr __fgetc
	pop	cx
@19@1010:
	mov	byte ptr [bp-1],al
	cbw	
	cmp	ax,65535
	jne	short @19@890
   ;	
   ;		}
   ;	d[5]=fc-3;
   ;	
	mov	ax,di
	add	ax,65533
	mov	word ptr DGROUP:d+10,ax
   ;	
   ;	fclose(alist);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	fc=0;
   ;	
	xor	di,di
   ;	
   ;	alist=fopen("PATIENT","r");
   ;	
	mov	ax,offset DGROUP:s@+6069
	push	ax
	mov	ax,offset DGROUP:s@+6061
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	si,ax
	jmp	short @19@1106
@19@1058:
   ;	
   ;	while((c=getc(alist)) != EOF)
   ;		{
   ;		if(c=='\n')
   ;	
	cmp	byte ptr [bp-1],10
	jne	short @19@1106
   ;	
   ;			++fc;
   ;	
	inc	di
@19@1106:
	dec	word ptr [si]
	mov	ax,word ptr [si]
	or	ax,ax
	jl	short @19@1154
	mov	bx,word ptr [si+10]
	inc	word ptr [si+10]
	mov	al,byte ptr [bx]
	mov	ah,0
	jmp	short @19@1178
@19@1154:
	push	si
	call	near ptr __fgetc
	pop	cx
@19@1178:
	mov	byte ptr [bp-1],al
	cbw	
	cmp	ax,65535
	jne	short @19@1058
   ;	
   ;		}
   ;	dtotal=fc-3;
   ;	
	mov	ax,di
	add	ax,65533
	mov	word ptr DGROUP:dtotal,ax
   ;	
   ;	fclose(alist);
   ;	
	push	si
	call	near ptr _fclose
	pop	cx
   ;	
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@count$qv	endp
	?debug	C E99C53FE7C0A5354415455532E435050
   ;	
   ;	void status(void)
   ;	
	assume	cs:_TEXT
@status$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,52
	push	si
	push	di
   ;	
   ;	{
   ;	count();
   ;	
	call	near ptr @count$qv
   ;	
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	uname();
   ;	
	call	near ptr @uname$qv
   ;	
   ;	gotoxy(25,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	line(30,'*');
   ;	
	mov	al,42
	push	ax
	mov	ax,30
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	gotoxy(32,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,32
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"PATIENTS' STATUS";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6071
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(25,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	line(30,'*');
   ;	
	mov	al,42
	push	ax
	mov	ax,30
	push	ax
	call	near ptr @line$qizc
	pop	cx
	pop	cx
   ;	
   ;	
   ;	gotoxy(28,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"1. Fever          : "<<setw(4)<<d[0];
   ;	
	mov	ax,word ptr DGROUP:d
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6088
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-6],offset DGROUP:_cout
	mov	ax,4
	push	ax
	push	ds
	lea	ax,word ptr [bp-4]
	push	ax
	call	near ptr @setw$qi
	add	sp,6
	lea	ax,word ptr [bp-4]
	mov	word ptr [bp-8],ax
	mov	bx,word ptr [bp-8]
	push	word ptr [bx+2]
	mov	bx,word ptr [bp-6]
	push	word ptr [bx]
	mov	bx,word ptr [bp-8]
	call	word ptr [bx]
	pop	cx
	pop	cx
	push	word ptr [bp-6]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
   ;	
   ;	gotoxy(28,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"2. Cold Virus     : "<<setw(4)<<d[1];
   ;	
	mov	ax,word ptr DGROUP:d+2
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6109
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-14],offset DGROUP:_cout
	mov	ax,4
	push	ax
	push	ds
	lea	ax,word ptr [bp-12]
	push	ax
	call	near ptr @setw$qi
	add	sp,6
	lea	ax,word ptr [bp-12]
	mov	word ptr [bp-16],ax
	mov	bx,word ptr [bp-16]
	push	word ptr [bx+2]
	mov	bx,word ptr [bp-14]
	push	word ptr [bx]
	mov	bx,word ptr [bp-16]
	call	word ptr [bx]
	pop	cx
	pop	cx
	push	word ptr [bp-14]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
   ;	
   ;	gotoxy(28,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"3. Yellow Fever   : "<<setw(4)<<d[2];
   ;	
	mov	ax,word ptr DGROUP:d+4
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6130
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-22],offset DGROUP:_cout
	mov	ax,4
	push	ax
	push	ds
	lea	ax,word ptr [bp-20]
	push	ax
	call	near ptr @setw$qi
	add	sp,6
	lea	ax,word ptr [bp-20]
	mov	word ptr [bp-24],ax
	mov	bx,word ptr [bp-24]
	push	word ptr [bx+2]
	mov	bx,word ptr [bp-22]
	push	word ptr [bx]
	mov	bx,word ptr [bp-24]
	call	word ptr [bx]
	pop	cx
	pop	cx
	push	word ptr [bp-22]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
   ;	
   ;	gotoxy(28,14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"4. Cholera        : "<<setw(4)<<d[3];
   ;	
	mov	ax,word ptr DGROUP:d+6
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6151
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-30],offset DGROUP:_cout
	mov	ax,4
	push	ax
	push	ds
	lea	ax,word ptr [bp-28]
	push	ax
	call	near ptr @setw$qi
	add	sp,6
	lea	ax,word ptr [bp-28]
	mov	word ptr [bp-32],ax
	mov	bx,word ptr [bp-32]
	push	word ptr [bx+2]
	mov	bx,word ptr [bp-30]
	push	word ptr [bx]
	mov	bx,word ptr [bp-32]
	call	word ptr [bx]
	pop	cx
	pop	cx
	push	word ptr [bp-30]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
   ;	
   ;	gotoxy(28,15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"5. Diphtheria     : "<<setw(4)<<d[4];
   ;	
	mov	ax,word ptr DGROUP:d+8
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6172
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-38],offset DGROUP:_cout
	mov	ax,4
	push	ax
	push	ds
	lea	ax,word ptr [bp-36]
	push	ax
	call	near ptr @setw$qi
	add	sp,6
	lea	ax,word ptr [bp-36]
	mov	word ptr [bp-40],ax
	mov	bx,word ptr [bp-40]
	push	word ptr [bx+2]
	mov	bx,word ptr [bp-38]
	push	word ptr [bx]
	mov	bx,word ptr [bp-40]
	call	word ptr [bx]
	pop	cx
	pop	cx
	push	word ptr [bp-38]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
   ;	
   ;	gotoxy(28,16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"6. UNKNOWN        : "<<setw(4)<<d[5];
   ;	
	mov	ax,word ptr DGROUP:d+10
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6193
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-46],offset DGROUP:_cout
	mov	ax,4
	push	ax
	push	ds
	lea	ax,word ptr [bp-44]
	push	ax
	call	near ptr @setw$qi
	add	sp,6
	lea	ax,word ptr [bp-44]
	mov	di,ax
	push	word ptr [di+2]
	mov	bx,word ptr [bp-46]
	push	word ptr [bx]
	call	word ptr [di]
	pop	cx
	pop	cx
	push	word ptr [bp-46]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
   ;	
   ;	gotoxy(28,17);
   ;	
	mov	ax,17
	push	ax
	mov	ax,28
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Total Patients    : "<<setw(4)<<dtotal;
   ;	
	mov	ax,word ptr DGROUP:dtotal
	cwd	
	push	dx
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6214
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	mov	word ptr [bp-52],offset DGROUP:_cout
	mov	ax,4
	push	ax
	push	ds
	lea	ax,word ptr [bp-50]
	push	ax
	call	near ptr @setw$qi
	add	sp,6
	lea	ax,word ptr [bp-50]
	mov	si,ax
	push	word ptr [si+2]
	mov	bx,word ptr [bp-52]
	push	word ptr [bx]
	call	word ptr [si]
	pop	cx
	pop	cx
	push	word ptr [bp-52]
	call	near ptr @ostream@$blsh$ql
	add	sp,6
   ;	
   ;	
   ;	delay(1000);
   ;	
	mov	ax,1000
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	gotoxy(26,23);
   ;	
	mov	ax,23
	push	ax
	mov	ax,26
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"Press Any Key to Continue....";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6235
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	
   ;	getch();
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
@status$qv	endp
	?debug	C E99C53FE7C084D454E552E435050
_TEXT	ends
_DATA	segment word public 'DATA'
	db	0
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	int menu(void)
   ;	
	assume	cs:_TEXT
@menu$qv	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
   ;	
   ;	{
   ;	int correct=0,choice,mlst;
   ;	
	xor	si,si
@21@50:
   ;	
   ;	menu:
   ;	clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	gotoxy(15,3);
   ;	
	mov	ax,3
	push	ax
	mov	ax,15
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	printline(45,0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,45
	push	ax
	call	near ptr @printline$qii
	pop	cx
	pop	cx
   ;	
   ;	gotoxy(20,4);
   ;	
	mov	ax,4
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	name();
   ;	
	call	near ptr @name$qv
   ;	
   ;	gotoxy(15,5);
   ;	
	mov	ax,5
	push	ax
	mov	ax,15
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	printline(45,0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,45
	push	ax
	call	near ptr @printline$qii
	pop	cx
	pop	cx
   ;	
   ;	gotoxy(33,6);
   ;	
	mov	ax,6
	push	ax
	mov	ax,33
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"MAIN MENU";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6265
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(25,8);
   ;	
	mov	ax,8
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"1. Add Patient's Details";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6275
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(25,10);
   ;	
	mov	ax,10
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"2. Show Patient's Details";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6300
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(25,12);
   ;	
	mov	ax,12
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"3. Check Out Patient";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6326
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(25,14);
   ;	
	mov	ax,14
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"4. Show Status";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6347
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	gotoxy(25,16);
   ;	
	mov	ax,16
	push	ax
	mov	ax,25
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	cout<<"5. Exit";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6362
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	
   ;	static int choice5=0;
   ;	if(choice5==1)
   ;	
	cmp	word ptr DGROUP:d@w+16,1
	jne	short @21@98
   ;	
   ;		goto choice5;
   ;	
	jmp	@21@722
@21@98:
   ;	
   ;	
   ;	if(!correct)
   ;	
	or	si,si
	jne	short @21@266
   ;	
   ;	   {
   ;	   gotoxy(23,25);
   ;	
	mov	ax,25
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	   cout<<"What do you want to do ?  ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6370
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	   cin>>choice;
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;	   if(choice==13)
   ;	
	cmp	word ptr [bp-2],13
	jne	short @21@170
   ;	
   ;		return choice;
   ;	
	mov	ax,word ptr [bp-2]
	jmp	@21@842
@21@170:
   ;	
   ;	   if( choice<1 || choice>5 )
   ;	
	cmp	word ptr [bp-2],1
	jl	short @21@218
	cmp	word ptr [bp-2],5
	jle	short @21@242
@21@218:
   ;	
   ;		{
   ;		correct++;
   ;	
	inc	si
   ;	
   ;		goto menu;
   ;	
	jmp	@21@50
@21@242:
	jmp	short @21@386
@21@266:
   ;	
   ;		}
   ;	   }
   ;	else
   ;	   {
   ;	   gotoxy(20,24);
   ;	
	mov	ax,24
	push	ax
	mov	ax,20
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	   cout<<"Please enter valid choice number...";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6397
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	   gotoxy(23,25);
   ;	
	mov	ax,25
	push	ax
	mov	ax,23
	push	ax
	call	near ptr _gotoxy
	pop	cx
	pop	cx
   ;	
   ;	   cout<<"What do you want to do ?  ";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+6433
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;	   cin>>choice;
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	mov	ax,offset DGROUP:_cin
	push	ax
	call	near ptr @istream@$brsh$qri
	pop	cx
	pop	cx
   ;	
   ;	   if( choice<1 || choice>5 )
   ;	
	cmp	word ptr [bp-2],1
	jl	short @21@314
	cmp	word ptr [bp-2],5
	jle	short @21@362
@21@314:
   ;	
   ;		{
   ;		correct=0;
   ;	
	xor	si,si
   ;	
   ;		correct++;
   ;	
	inc	si
   ;	
   ;		goto menu;
   ;	
	jmp	@21@50
	jmp	short @21@386
@21@362:
   ;	
   ;		}
   ;	   else
   ;		{
   ;		correct=0;
   ;	
	xor	si,si
@21@386:
   ;	
   ;		}
   ;	   }
   ;	
   ;	choice1:
   ;	if(choice==1)
   ;	
	cmp	word ptr [bp-2],1
	jne	short @21@434
   ;	
   ;		{
   ;		addp();
   ;	
	call	near ptr @addp$qv
   ;	
   ;		goto menu;
   ;	
	jmp	@21@50
@21@434:
   ;	
   ;		}
   ;	
   ;	choice2:
   ;	if(choice==2)
   ;	
	cmp	word ptr [bp-2],2
	jne	short @21@554
   ;	
   ;		{
   ;		mlst=mlist();
   ;	
	call	near ptr @mlist$qv
	mov	di,ax
   ;	
   ;		if(mlst==3)
   ;	
	cmp	di,3
	jne	short @21@506
   ;	
   ;			goto menu;
   ;	
	jmp	@21@50
@21@506:
   ;	
   ;		if(mlst==4)
   ;	
	cmp	di,4
	jne	short @21@554
   ;	
   ;			close();
   ;	
	call	near ptr @close$qv
@21@554:
   ;	
   ;		}
   ;	
   ;	
   ;	choice3:
   ;	if(choice==3)
   ;	
	cmp	word ptr [bp-2],3
	jne	short @21@674
   ;	
   ;		{
   ;		mlst=mcheck();
   ;	
	call	near ptr @mcheck$qv
	mov	di,ax
   ;	
   ;		if(mlst==3)
   ;	
	cmp	di,3
	jne	short @21@626
   ;	
   ;			goto menu;
   ;	
	jmp	@21@50
@21@626:
   ;	
   ;		if(mlst==4)
   ;	
	cmp	di,4
	jne	short @21@674
   ;	
   ;			close();
   ;	
	call	near ptr @close$qv
@21@674:
   ;	
   ;		}
   ;	
   ;	choice4:
   ;	if(choice==4)
   ;	
	cmp	word ptr [bp-2],4
	jne	short @21@722
   ;	
   ;		{
   ;		status();
   ;	
	call	near ptr @status$qv
   ;	
   ;		goto menu;
   ;	
	jmp	@21@50
@21@722:
   ;	
   ;		}
   ;	
   ;	choice5:
   ;	if(choice==5)
   ;	
	cmp	word ptr [bp-2],5
	jne	short @21@818
   ;	
   ;		{
   ;		if(choice5==0)
   ;	
	cmp	word ptr DGROUP:d@w+16,0
	jne	short @21@794
   ;	
   ;			{
   ;			choice5++;
   ;	
	inc	word ptr DGROUP:d@w+16
   ;	
   ;			goto menu;
   ;	
	jmp	@21@50
@21@794:
   ;	
   ;			}
   ;		close();
   ;	
	call	near ptr @close$qv
@21@818:
   ;	
   ;		}
   ;	
   ;	return choice;
   ;	
	mov	ax,word ptr [bp-2]
	jmp	short @21@842
@21@842:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@menu$qv	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	9
	db	9
	db	'   '
	db	0
	db	'-'
	db	0
	db	'GENERAL HOSPITAL MANAGEMENT SYSTEM'
	db	0
	db	' '
	db	0
	db	'Application will close now...'
	db	0
	db	'WELCOME'
	db	0
	db	'TO'
	db	0
	db	'Loading...  Please Wait...'
	db	0
	db	' '
	db	0
	db	'Enter Password: '
	db	0
	db	'* '
	db	0
	db	'vivek'
	db	0
	db	'You Have Successfully Logged In.'
	db	0
	db	'You have Entered a Wrong Password. Please Try Again.'
	db	0
	db	' '
	db	0
	db	' '
	db	0
	db	'Application will close now...'
	db	0
	db	'Thanks For Using My Application'
	db	0
	db	'! HAPPY PROGRAMMING !'
	db	0
	db	'Created By'
	db	0
	db	'VIVEK ISHWARBHAI PATEL'
	db	0
	db	'( 11BCE073 )'
	db	0
	db	'Special Thanks'
	db	0
	db	'My Helpful Friends'
	db	0
	db	'&'
	db	0
	db	'E BALAGURUSAMY'
	db	0
	db	'Disease List:'
	db	0
	db	'1.Fever'
	db	0
	db	'2.Cold Virus'
	db	0
	db	'3.Yellow Fever'
	db	0
	db	'4.Cholera'
	db	0
	db	'5.Diphtheria'
	db	0
	db	'Patient'
	db	39
	db	's ID       '
	db	9
	db	':'
	db	0
	db	10
	db	'Name of the Patient'
	db	9
	db	':'
	db	0
	db	10
	db	'Type of Disease    '
	db	9
	db	':'
	db	0
	db	10
	db	'Address'
	db	9
	db	9
	db	9
	db	': '
	db	0
	db	10
	db	'(please write tidle (~) at the end)'
	db	0
	db	10
	db	'Telephone Number'
	db	9
	db	':'
	db	0
	db	'Fever'
	db	0
	db	'FEVER'
	db	0
	db	'a+'
	db	0
	db	' | %4d | %-25s | %-25s | %11s |'
	db	10
	db	0
	db	'Cold Virus'
	db	0
	db	'COLDVIRUS'
	db	0
	db	'a+'
	db	0
	db	' | %4d | %-25s | %-25s | %11s |'
	db	10
	db	0
	db	'Yellow Fever'
	db	0
	db	'YELLOWFEVER'
	db	0
	db	'a+'
	db	0
	db	' | %4d | %-25s | %-25s | %11s |'
	db	10
	db	0
	db	'Cholera'
	db	0
	db	'CHOLERA'
	db	0
	db	'a+'
	db	0
	db	' | %4d | %-25s | %-25s | %11s |'
	db	10
	db	0
	db	'Diphtheria'
	db	0
	db	'DIPHTHERIA'
	db	0
	db	'a+'
	db	0
	db	' | %4d | %-25s | %-25s | %11s |'
	db	10
	db	0
	db	'Unknown'
	db	0
	db	'UNKNOWN'
	db	0
	db	'a+'
	db	0
	db	' | %4d | %-25s | %-25s | %11s |'
	db	10
	db	0
	db	' | %4d | %-25s | %-25s | %11s |'
	db	10
	db	0
	db	'-------------------------------------------------------------'
	db	'---------------------'
	db	0
	db	10
	db	'Patient ID'
	db	9
	db	9
	db	':'
	db	10
	db	'%6d'
	db	10
	db	0
	db	10
	db	'Patient Name'
	db	9
	db	9
	db	':'
	db	10
	db	'%s'
	db	10
	db	0
	db	10
	db	'Patient Address'
	db	9
	db	9
	db	':'
	db	10
	db	'%s'
	db	10
	db	0
	db	'PATIENT'
	db	0
	db	'a+'
	db	0
	db	'ADDRESS'
	db	0
	db	'a+'
	db	0
	db	'Want to add another Patient ? (Y/N) : '
	db	0
	db	'Please enter valid choice character...'
	db	0
	db	'Check Out Patients'
	db	0
	db	'Information : Please note that all patients will be checked o'
	db	'ut.'
	db	0
	db	'Select Disease to Check Out Patients'
	db	39
	db	's Lists'
	db	0
	db	'1. Fever'
	db	0
	db	'2. Cold Virus'
	db	0
	db	'3. Yellow Fever'
	db	0
	db	'4. Cholera'
	db	0
	db	'5. Diphtheria'
	db	0
	db	'6. UNKNOWN'
	db	0
	db	'7. Go Back'
	db	0
	db	'8. Main Menu'
	db	0
	db	'9. Exit'
	db	0
	db	'What do you want to do ?  '
	db	0
	db	'Please enter valid choice number...'
	db	0
	db	'What do you want to do ?  '
	db	0
	db	'FEVER'
	db	0
	db	'w'
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	' |--ID--|-----------NAME------------|----------DISEASE-------'
	db	'---|--TELEPHONE--|'
	db	10
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	'Please Wait...'
	db	0
	db	'All Patients are Checked Out.'
	db	0
	db	'COLDVIRUS'
	db	0
	db	'w'
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	' |--ID--|-----------NAME------------|----------DISEASE-------'
	db	'---|--TELEPHONE--|'
	db	10
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	'Please Wait...'
	db	0
	db	'All Patients are Checked Out.'
	db	0
	db	'YELLOWFEVER'
	db	0
	db	'w'
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	' |--ID--|-----------NAME------------|----------DISEASE-------'
	db	'---|--TELEPHONE--|'
	db	10
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	'Please Wait...'
	db	0
	db	'All Patients are Checked Out.'
	db	0
	db	'CHOLERA'
	db	0
	db	'w'
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	' |--ID--|-----------NAME------------|----------DISEASE-------'
	db	'---|--TELEPHONE--|'
	db	10
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	'Please Wait...'
	db	0
	db	'All Patients are Checked Out.'
	db	0
	db	'DIPHTHERIA'
	db	0
	db	'w'
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	' |--ID--|-----------NAME------------|----------DISEASE-------'
	db	'---|--TELEPHONE--|'
	db	10
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	'Please Wait...'
	db	0
	db	'All Patients are Checked Out.'
	db	0
	db	'UNKNOWN'
	db	0
	db	'w'
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	' |--ID--|-----------NAME------------|----------DISEASE-------'
	db	'---|--TELEPHONE--|'
	db	10
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	'Please Wait...'
	db	0
	db	'All Patients are Checked Out.'
	db	0
	db	'Check Out Patients'
	db	0
	db	'Information : Please note that all patients will be checked o'
	db	'ut.'
	db	0
	db	'Select Disease to Check Out Patients'
	db	39
	db	's Lists'
	db	0
	db	'1. All Patients'
	db	39
	db	' List'
	db	0
	db	'2. Patients'
	db	39
	db	' List by Disease'
	db	0
	db	'3. Main Menu'
	db	0
	db	'4. Exit'
	db	0
	db	'What do you want to do ?  '
	db	0
	db	'Please enter valid choice number...'
	db	0
	db	'What do you want to do ?  '
	db	0
	db	'PATIENT'
	db	0
	db	'w'
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	' |--ID--|-----------NAME------------|----------DISEASE-------'
	db	'---|--TELEPHONE--|'
	db	10
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	'FEVER'
	db	0
	db	'w'
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	' |--ID--|-----------NAME------------|----------DISEASE-------'
	db	'---|--TELEPHONE--|'
	db	10
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	'COLDVIRUS'
	db	0
	db	'w'
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	' |--ID--|-----------NAME------------|----------DISEASE-------'
	db	'---|--TELEPHONE--|'
	db	10
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	'YELLOWFEVER'
	db	0
	db	'w'
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	' |--ID--|-----------NAME------------|----------DISEASE-------'
	db	'---|--TELEPHONE--|'
	db	10
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	'CHOLERA'
	db	0
	db	'w'
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	' |--ID--|-----------NAME------------|----------DISEASE-------'
	db	'---|--TELEPHONE--|'
	db	10
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	'DIPHTHERIA'
	db	0
	db	'w'
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	' |--ID--|-----------NAME------------|----------DISEASE-------'
	db	'---|--TELEPHONE--|'
	db	10
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	'UNKNOWN'
	db	0
	db	'w'
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	' |--ID--|-----------NAME------------|----------DISEASE-------'
	db	'---|--TELEPHONE--|'
	db	10
	db	0
	db	' |------|---------------------------|------------------------'
	db	'---|-------------|'
	db	10
	db	0
	db	'Please Wait...'
	db	0
	db	'All Patients are Checked Out.'
	db	0
	db	'Patient'
	db	39
	db	's Details'
	db	0
	db	'Select Disease to View Patients'
	db	39
	db	's List'
	db	0
	db	'1. Fever'
	db	0
	db	'2. Cold Virus'
	db	0
	db	'3. Yellow Fever'
	db	0
	db	'4. Cholera'
	db	0
	db	'5. Diphtheria'
	db	0
	db	'6. UNKNOWN'
	db	0
	db	'7. Go Back'
	db	0
	db	'8. Main Menu'
	db	0
	db	'9. Exit'
	db	0
	db	'What do you want to do ?  '
	db	0
	db	'Please enter valid choice number...'
	db	0
	db	'What do you want to do ?  '
	db	0
	db	'FEVER'
	db	0
	db	'r'
	db	0
	db	' '
	db	0
	db	'COLDVIRUS'
	db	0
	db	'r'
	db	0
	db	' '
	db	0
	db	'YELLOWFEVER'
	db	0
	db	'r'
	db	0
	db	' '
	db	0
	db	'CHOLERA'
	db	0
	db	'r'
	db	0
	db	' '
	db	0
	db	'DIPHTHERIA'
	db	0
	db	'r'
	db	0
	db	' '
	db	0
	db	'UNKNOWN'
	db	0
	db	'r'
	db	0
	db	' '
	db	0
	db	'Patient'
	db	39
	db	's Details'
	db	0
	db	'1. All Patients'
	db	39
	db	' List'
	db	0
	db	'2. Patients'
	db	39
	db	' List by Disease'
	db	0
	db	'3. Main Menu'
	db	0
	db	'4. Exit'
	db	0
	db	'What do you want to do ?  '
	db	0
	db	'Please enter valid choice number...'
	db	0
	db	'What do you want to do ?  '
	db	0
	db	'PATIENT'
	db	0
	db	'r'
	db	0
	db	' '
	db	0
	db	'FEVER'
	db	0
	db	'r'
	db	0
	db	'COLDVIRUS'
	db	0
	db	'r'
	db	0
	db	'YELLOWFEVER'
	db	0
	db	'r'
	db	0
	db	'CHOLERA'
	db	0
	db	'r'
	db	0
	db	'DIPHTHERIA'
	db	0
	db	'r'
	db	0
	db	'UNKNOWN'
	db	0
	db	'r'
	db	0
	db	'PATIENT'
	db	0
	db	'r'
	db	0
	db	'PATIENTS'
	db	39
	db	' STATUS'
	db	0
	db	'1. Fever          : '
	db	0
	db	'2. Cold Virus     : '
	db	0
	db	'3. Yellow Fever   : '
	db	0
	db	'4. Cholera        : '
	db	0
	db	'5. Diphtheria     : '
	db	0
	db	'6. UNKNOWN        : '
	db	0
	db	'Total Patients    : '
	db	0
	db	'Press Any Key to Continue....'
	db	0
	db	'MAIN MENU'
	db	0
	db	'1. Add Patient'
	db	39
	db	's Details'
	db	0
	db	'2. Show Patient'
	db	39
	db	's Details'
	db	0
	db	'3. Check Out Patient'
	db	0
	db	'4. Show Status'
	db	0
	db	'5. Exit'
	db	0
	db	'What do you want to do ?  '
	db	0
	db	'Please enter valid choice number...'
	db	0
	db	'What do you want to do ?  '
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
	public	@printline$qii
	extrn	@ostream@outstr$qpxzct1:near
	extrn	_cout:word
	public	@name$qv
	public	@uname$qv
	extrn	_gotoxy:near
	extrn	@endl$qr7ostream:near
	public	@line$qizc
	extrn	@ostream@$blsh$qzc:near
	public	@space$qi
	public	@clear$qi
	public	@close$qv
	extrn	_delay:near
	public	@pmain$qv
	extrn	_clrscr:near
	extrn	_textcolor:near
	extrn	_printf:near
	extrn	_getch:near
	extrn	_strncmp:near
	public	@thanks$qv
	public	@cradit$qv
	public	@list$qv
	public	@clist$qv
_dtotal	equ	dtotal
_d	equ	d
	public	_f
	public	@add$qp7patientp4FILEt2
	extrn	@istream@$brsh$qri:near
	extrn	_cin:word
	extrn	_gets:near
	extrn	__fgetc:near
	extrn	__streams:word
	extrn	_strcpy:near
	extrn	_fflush:near
	extrn	@istream@$brsh$qpzc:near
	extrn	_fopen:near
	extrn	_fprintf:near
	extrn	_fclose:near
	public	@addp$qv
	extrn	@istream@$brsh$qrzc:near
	public	@mmcheck$qv
	public	@mcheck$qv
	public	@mmlist$qv
	public	@mlist$qv
	public	@count$qv
	public	@status$qv
	extrn	@ostream@$blsh$ql:near
	extrn	@setw$qi:near
	public	@menu$qv
	end
