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
	?debug	S "c:\ed.cpp"
	?debug	C E90858FE7C09633A5C65642E637070
	?debug	C E90858FE7C08676F757261762E68
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
	?debug	C E95337528110443A5C494E434C5544455C6D656D2E68
	?debug	C E95337528115443A5C494E434C5544455C67726170686963732E68
	?debug	C E95337528114443A5C494E434C5544455C6673747265616D2E68
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
	?debug	C E95337528113443A5C494E434C5544455C737472696E672E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
	?debug	C E95337528112443A5C494E434C5544455C63747970652E68
	?debug	C E95337528111443A5C494E434C5544455C6D6174682E68
	?debug	C E95337528110443A5C494E434C5544455C646F732E68
	?debug	C E95337528110443A5C494E434C5544455C6469722E68
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
_mbutton	label	word
	db	2 dup (?)
_mx	label	word
	db	2 dup (?)
_my	label	word
	db	2 dup (?)
_mi	label	word
	db	16 dup (?)
_mo	label	word
	db	16 dup (?)
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	_mouse_init()
   ;	
	assume	cs:_TEXT
@_mouse_init$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		mi.x.ax = 0;
   ;	
	mov	word ptr DGROUP:_mi,0
   ;	
   ;		int86(0x33, &mi, &mo);
   ;	
	mov	ax,offset DGROUP:_mo
	push	ax
	mov	ax,offset DGROUP:_mi
	push	ax
	mov	ax,51
	push	ax
	call	near ptr _int86
	add	sp,6
   ;	
   ;		return (mo.x.ax);
   ;	
	mov	ax,word ptr DGROUP:_mo
	jmp	short @1@50
@1@50:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@_mouse_init$qv	endp
   ;	
   ;	_mouse_show()
   ;	
	assume	cs:_TEXT
@_mouse_show$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		mi.x.ax = 1;
   ;	
	mov	word ptr DGROUP:_mi,1
   ;	
   ;		int86(0x33, &mi, &mo);
   ;	
	mov	ax,offset DGROUP:_mo
	push	ax
	mov	ax,offset DGROUP:_mi
	push	ax
	mov	ax,51
	push	ax
	call	near ptr _int86
	add	sp,6
   ;	
   ;		return 0;
   ;	
	xor	ax,ax
	jmp	short @2@50
@2@50:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@_mouse_show$qv	endp
   ;	
   ;	_mouse_hide()
   ;	
	assume	cs:_TEXT
@_mouse_hide$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		mi.x.ax = 2;
   ;	
	mov	word ptr DGROUP:_mi,2
   ;	
   ;		int86(0x33, &mi, &mo);
   ;	
	mov	ax,offset DGROUP:_mo
	push	ax
	mov	ax,offset DGROUP:_mi
	push	ax
	mov	ax,51
	push	ax
	call	near ptr _int86
	add	sp,6
   ;	
   ;		return 0;
   ;	
	xor	ax,ax
	jmp	short @3@50
@3@50:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@_mouse_hide$qv	endp
   ;	
   ;	_mouse_getmousepos(int *mbutton, int *mx, int *my)
   ;	
	assume	cs:_TEXT
@_mouse_getmousepos$qpit1t1	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		mi.x.ax = 3;
   ;	
	mov	word ptr DGROUP:_mi,3
   ;	
   ;		int86(0x33, &mi, &mo);
   ;	
	mov	ax,offset DGROUP:_mo
	push	ax
	mov	ax,offset DGROUP:_mi
	push	ax
	mov	ax,51
	push	ax
	call	near ptr _int86
	add	sp,6
   ;	
   ;		*mbutton = mo.x.bx;
   ;	
	mov	bx,word ptr [bp+4]
	mov	ax,word ptr DGROUP:_mo+2
	mov	word ptr [bx],ax
   ;	
   ;		*mx = mo.x.cx;
   ;	
	mov	bx,word ptr [bp+6]
	mov	ax,word ptr DGROUP:_mo+4
	mov	word ptr [bx],ax
   ;	
   ;		*my = mo.x.dx;
   ;	
	mov	bx,word ptr [bp+8]
	mov	ax,word ptr DGROUP:_mo+6
	mov	word ptr [bx],ax
   ;	
   ;		return 0;
   ;	
	xor	ax,ax
	jmp	short @4@50
@4@50:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@_mouse_getmousepos$qpit1t1	endp
   ;	
   ;	void _graphics_init()
   ;	
	assume	cs:_TEXT
@_graphics_init$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;	{
   ;		int gd = DETECT, gm = 0;
   ;	
	mov	word ptr [bp-2],0
	mov	word ptr [bp-4],0
   ;	
   ;		initgraph(&gd, &gm, "d:\\tc\\bgi");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@
	push	ax
	push	ds
	lea	ax,word ptr [bp-4]
	push	ax
	push	ds
	lea	ax,word ptr [bp-2]
	push	ax
	call	far ptr _initgraph
	add	sp,12
   ;	
   ;		settextjustify(HORIZ_DIR, CENTER_TEXT);
   ;	
	mov	ax,1
	push	ax
	xor	ax,ax
	push	ax
	call	far ptr _settextjustify
	pop	cx
	pop	cx
   ;	
   ;		settextjustify(VERT_DIR, CENTER_TEXT);
   ;	
	mov	ax,1
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _settextjustify
	pop	cx
	pop	cx
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
@_graphics_init$qv	endp
   ;	
   ;	void front()
   ;	
	assume	cs:_TEXT
@front$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		/*	setcolor(4);
   ;		 rectangle(2,2,getmaxx()-2,getmaxy()-2);
   ;	
   ;		 setfillstyle(SOLID_FILL,DARKGRAY);
   ;		 bar(2,getmaxy()-20,getmaxx()-2,getmaxy()-2);
   ;	
   ;		 setfillstyle(SOLID_FILL,BLUE);
   ;		 bar(getmaxx()-10,20,getmaxx()-2,getmaxy()-2);
   ;		 */
   ;		setfillstyle(SOLID_FILL, WHITE);
   ;	
	mov	ax,15
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;		bar(3, 20, getmaxx() - 3, getmaxy() - 20);
   ;	
	call	far ptr _getmaxy
	add	ax,65516
	push	ax
	call	far ptr _getmaxx
	add	ax,65533
	push	ax
	mov	ax,20
	push	ax
	mov	ax,3
	push	ax
	call	far ptr _bar
	add	sp,8
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@front$qv	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_dir	label	byte
	db	50 dup (?)
_BSS	ends
_DATA	segment word public 'DATA'
_x	label	word
	db	4
	db	0
_DATA	ends
_BSS	segment word public 'BSS'
_BSS	ends
_DATA	segment word public 'DATA'
_y	label	word
	db	25
	db	0
_DATA	ends
_BSS	segment word public 'BSS'
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void writefile()
   ;	
	assume	cs:_TEXT
@writefile$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,166
   ;	
   ;	{
   ;		char name[20];
   ;		//	cout<<"Enter File Name\t";
   ;		//	cin>>name;
   ;		//	strcpy(dir,"c:\\");	strcat(dir,name);
   ;		//	strcat(dir,".txt");
   ;	
   ;		ofstream ofile("c:\\abcd.txt");
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,2
	push	ax
	mov	ax,offset DGROUP:s@+10
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-80]
	push	ax
	call	near ptr @ofstream@$bctr$qpxzcii
	add	sp,10
   ;	
   ;	
   ;		char ch;
   ;		//	char line[82];
   ;		mline line;
   ;		line.pos = 0;
   ;	
	mov	word ptr [bp-82],0
   ;	
   ;	
   ;		setcolor(RED);
   ;	
	mov	ax,4
	push	ax
	call	far ptr _setcolor
	pop	cx
@7@50:
   ;	
   ;	
   ;		while (1)
   ;		{
   ;			ch = getch(); /*
   ;	
	call	near ptr _getch
	mov	byte ptr [bp-1],al
   ;	
   ;			 if(ch==8)
   ;			 {
   ;			 int color=getcolor();
   ;			 setcolor(WHITE);
   ;			 outtextxy(x,y,line.text);
   ;	
   ;			 line.text[--line.pos]='\0';
   ;	
   ;			 setcolor(color);
   ;			 outtextxy(x,y,line.text);
   ;			 }
   ;			 else */
   ;			if (ch == 27)
   ;	
	cmp	byte ptr [bp-1],27
	jne	short @7@122
   ;	
   ;			{
   ;				line.text[line.pos] = '\0';
   ;	
	lea	bx,word ptr [bp-166]
	add	bx,word ptr [bp-82]
	mov	byte ptr [bx],0
   ;	
   ;				ofile << line.text;
   ;	
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-166]
	push	ax
	lea	ax,word ptr [bp-40]
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	jmp	@7@242
	jmp	@7@218
@7@122:
   ;	
   ;				break;
   ;			}
   ;			else if (ch == 13 || line.pos == 79)
   ;	
	cmp	byte ptr [bp-1],13
	je	short @7@170
	cmp	word ptr [bp-82],79
	jne	short @7@194
@7@170:
   ;	
   ;			{
   ;				line.text[line.pos] = ch;
   ;	
	lea	bx,word ptr [bp-166]
	add	bx,word ptr [bp-82]
	mov	al,byte ptr [bp-1]
	mov	byte ptr [bx],al
   ;	
   ;				line.text[++line.pos] = '\0';
   ;	
	lea	bx,word ptr [bp-166]
	inc	word ptr [bp-82]
	mov	ax,word ptr [bp-82]
	add	bx,ax
	mov	byte ptr [bx],0
   ;	
   ;				line.pos = 0;
   ;	
	mov	word ptr [bp-82],0
   ;	
   ;				line.num++;
   ;	
	inc	word ptr [bp-84]
   ;	
   ;				y += 10;
   ;	
	add	word ptr DGROUP:_y,10
   ;	
   ;				ofile << line.text << endl;
   ;	
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-166]
	push	ax
	lea	ax,word ptr [bp-40]
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
	lea	ax,word ptr [bp-40]
	push	ax
	call	near ptr @endl$qr7ostream
	pop	cx
	jmp	short @7@218
@7@194:
   ;	
   ;			}
   ;			else
   ;			{
   ;				//	setcolor(WHITE);
   ;				//	outtextxy(x,y,line.text);
   ;	
   ;				setcolor(RED);
   ;	
	mov	ax,4
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;				line.text[line.pos] = ch;
   ;	
	lea	bx,word ptr [bp-166]
	add	bx,word ptr [bp-82]
	mov	al,byte ptr [bp-1]
	mov	byte ptr [bx],al
   ;	
   ;				line.text[++line.pos] = '\0';
   ;	
	lea	bx,word ptr [bp-166]
	inc	word ptr [bp-82]
	mov	ax,word ptr [bp-82]
	add	bx,ax
	mov	byte ptr [bx],0
   ;	
   ;				outtextxy(x, y, line.text);
   ;	
	push	ds
	lea	ax,word ptr [bp-166]
	push	ax
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _outtextxy
	add	sp,8
@7@218:
	jmp	@7@50
@7@242:
   ;	
   ;			}
   ;		}
   ;	
   ;		ofile.close();
   ;	
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
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
@writefile$qv	endp
   ;	
   ;	void readfile()
   ;	
	assume	cs:_TEXT
@readfile$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,82
   ;	
   ;	{
   ;		ifstream ifile("c:\\abcd.txt");
   ;	
	push	word ptr DGROUP:@filebuf@openprot
	mov	ax,1
	push	ax
	mov	ax,offset DGROUP:s@+22
	push	ax
	xor	ax,ax
	push	ax
	lea	ax,word ptr [bp-82]
	push	ax
	call	near ptr @ifstream@$bctr$qpxzcii
	add	sp,10
@8@50:
   ;	
   ;		char ch;
   ;	
   ;		while (1)
   ;		{
   ;			ifile.get(ch);
   ;	
	lea	ax,word ptr [bp-1]
	push	ax
	lea	ax,word ptr [bp-42]
	push	ax
	call	near ptr @istream@get$qrzc
	pop	cx
	pop	cx
   ;	
   ;			if (ifile.eof())
   ;	
	mov	bx,word ptr [bp-82]
	test	word ptr [bx+4],1
	je	short @8@98
	jmp	short @8@146
@8@98:
   ;	
   ;				break;
   ;			cout << ch;
   ;	
	mov	al,byte ptr [bp-1]
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@$blsh$qzc
	pop	cx
	pop	cx
	jmp	short @8@50
@8@146:
   ;	
   ;		}
   ;	
   ;		ifile.close();
   ;	
	lea	ax,word ptr [bp-82]
	push	ax
	call	near ptr @fstreambase@close$qv
	pop	cx
	mov	ax,2
	push	ax
	lea	ax,word ptr [bp-82]
	push	ax
	call	near ptr @ifstream@$bdtr$qv
	pop	cx
	pop	cx
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
@readfile$qv	endp
   ;	
   ;	void main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;	
   ;		_graphics_init();
   ;	
	call	near ptr @_graphics_init$qv
   ;	
   ;	
   ;		front();
   ;	
	call	near ptr @front$qv
   ;	
   ;	
   ;		writefile();
   ;	
	call	near ptr @writefile$qv
   ;	
   ;		getch();
   ;	
	call	near ptr _getch
   ;	
   ;		cout << "\n\n";
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:s@+34
	push	ax
	mov	ax,offset DGROUP:_cout
	push	ax
	call	near ptr @ostream@outstr$qpxzct1
	add	sp,6
   ;	
   ;		readfile();
   ;	
	call	near ptr @readfile$qv
   ;	
   ;	
   ;		getch();
   ;	
	call	near ptr _getch
   ;	
   ;		closegraph();
   ;	
	call	far ptr _closegraph
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_main	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'd:\tc\bgi'
	db	0
	db	'c:\abcd.txt'
	db	0
	db	'c:\abcd.txt'
	db	0
	db	10
	db	10
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
	public	_mbutton
	public	_mx
	public	_my
	public	_mi
	public	_mo
	public	@_mouse_init$qv
	extrn	_int86:near
	public	@_mouse_show$qv
	public	@_mouse_hide$qv
	public	@_mouse_getmousepos$qpit1t1
	public	@_graphics_init$qv
	extrn	_initgraph:far
	extrn	_settextjustify:far
	public	@front$qv
	extrn	_setfillstyle:far
	extrn	_bar:far
	extrn	_getmaxx:far
	extrn	_getmaxy:far
	public	_dir
	public	_x
	public	_y
	public	@writefile$qv
	extrn	@ofstream@$bctr$qpxzcii:near
	extrn	_setcolor:far
	extrn	_getch:near
	extrn	@ostream@outstr$qpxzct1:near
	extrn	@endl$qr7ostream:near
	extrn	_outtextxy:far
	extrn	@fstreambase@close$qv:near
	extrn	@ofstream@$bdtr$qv:near
	public	@readfile$qv
	extrn	@ifstream@$bctr$qpxzcii:near
	extrn	@istream@get$qrzc:near
	extrn	@ostream@$blsh$qzc:near
	extrn	_cout:word
	extrn	@ifstream@$bdtr$qv:near
	public	_main
	extrn	_clrscr:near
	extrn	_closegraph:far
	end
