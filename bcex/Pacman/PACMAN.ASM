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
	?debug	S "c:\pacman.c"
	?debug	C E9DD54FE7C0B633A5C7061636D616E2E63
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
	?debug	C E95337528110443A5C494E434C5544455C646F732E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
	?debug	C E95337528115443A5C494E434C5544455C67726170686963732E68
	?debug	C E95337528111443A5C494E434C5544455C6D6174682E68
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
_DATA	segment word public 'DATA'
_gd	label	word
	db	0
	db	0
_rep	label	word
	db	0
	db	0
_dark	label	word
	db	0
	db	0
_t	label	word
	db	44
	db	1
_x	label	word
	db	9
	db	0
_y	label	word
	db	14
	db	0
_x1	label	word
	db	7
	db	0
_y1	label	word
	db	8
	db	0
_x2	label	word
	db	11
	db	0
_y2	label	word
	db	8
	db	0
_x3	label	word
	db	7
	db	0
_y3	label	word
	db	10
	db	0
_dir	label	word
	db	0
	db	0
_st	label	word
	db	120
	db	0
_end	label	word
	db	60
	db	0
_octave	label	dword
	db	92
	db	207
	db	2
	db	67
	db	123
	db	212
	db	18
	db	67
	db	92
	db	207
	db	36
	db	67
	db	41
	db	156
	db	46
	db	67
	db	0
	db	0
	db	68
	db	67
	db	0
	db	0
	db	92
	db	67
	db	164
	db	240
	db	118
	db	67
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	2
	db	0
	db	0
	db	0
	db	2
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	2
	db	0
	db	0
	db	0
	db	0
	db	0
	db	2
	db	0
	db	0
	db	0
	db	0
	db	0
	db	2
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	2
	db	0
	db	0
	db	0
	db	2
	db	0
	db	0
	db	0
	db	2
	db	0
	db	0
	db	0
	db	2
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	2
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	2
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	2
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	2
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void initialize()
   ;	
	assume	cs:_TEXT
_initialize	proc	near
	push	bp
	mov	bp,sp
	sub	sp,762
	push	si
	push	di
	push	ss
	lea	ax,word ptr [bp-762]
	push	ax
	push	ds
	mov	ax,offset DGROUP:d@w+58
	push	ax
	mov	cx,760
	call	near ptr N_SCOPY@
   ;	
   ;	{
   ;		int i, j;
   ;		int m[20][19]={
   ;	{2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2,2},
   ;	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},
   ;	{0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
   ;	{0,1,0,0,1,0,1,0,0,0,0,0,1,0,1,0,0,1,0},
   ;	{0,1,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,1,0},
   ;	{0,0,0,0,1,0,0,0,2,0,2,0,0,0,1,0,0,0,0},
   ;	{0,1,1,1,1,0,2,2,2,2,2,2,2,0,1,1,1,1,0},
   ;	{0,1,0,0,1,0,2,0,0,2,0,0,2,0,1,0,0,1,0},
   ;	{0,1,1,1,1,0,2,2,2,2,2,2,2,0,1,1,1,1,0},
   ;	{0,1,0,0,1,0,2,0,2,0,2,0,2,0,1,0,0,1,0},
   ;	{0,1,1,1,1,0,2,2,2,2,2,2,2,0,1,1,1,1,0},
   ;	{0,0,0,0,1,0,2,0,0,0,0,0,2,0,1,0,0,0,0},
   ;	{0,1,1,1,1,1,1,1,1,0,1,1,1,1,1,1,1,1,0},
   ;	{0,1,0,0,1,0,0,0,1,0,1,0,0,0,1,0,0,1,0},
   ;	{0,1,1,0,1,1,1,1,1,2,1,1,1,1,1,0,1,1,0},
   ;	{0,0,1,0,1,0,1,0,0,0,0,0,1,0,1,0,1,0,0},
   ;	{0,1,1,1,1,0,1,1,1,0,1,1,1,0,1,1,1,1,0},
   ;	{0,1,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,1,0},
   ;	{0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0},
   ;	{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}};
   ;		for (i=0; i<20; i++)
   ;	
	xor	di,di
	jmp	short @1@170
@1@50:
   ;	
   ;			for (j=0; j<19; j++)
   ;	
	xor	si,si
	jmp	short @1@122
@1@74:
   ;	
   ;				map[i][j]= m[i][j];
   ;	
	mov	ax,di
	mov	dx,38
	imul	dx
	mov	dx,si
	shl	dx,1
	add	ax,dx
	lea	dx,word ptr [bp-762]
	add	ax,dx
	mov	bx,ax
	mov	ax,word ptr [bx]
	push	ax
	mov	ax,di
	mov	dx,38
	imul	dx
	mov	dx,si
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	pop	ax
	mov	word ptr DGROUP:_map[bx],ax
	inc	si
@1@122:
	cmp	si,19
	jl	short @1@74
	inc	di
@1@170:
	cmp	di,20
	jl	short @1@50
   ;	
   ;		
   ;		score= 0, death=0, dark=0;
   ;	
	mov	word ptr DGROUP:_score,0
	mov	word ptr DGROUP:_death,0
	mov	word ptr DGROUP:_dark,0
   ;	
   ;		initgraph(&gd, &gm, "C:\\TURBOC3\\BGI");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@
	push	ax
	push	ds
	mov	ax,offset DGROUP:_gm
	push	ax
	push	ds
	mov	ax,offset DGROUP:_gd
	push	ax
	call	far ptr _initgraph
	add	sp,12
   ;	
   ;		maxx=getmaxx();
   ;	
	call	far ptr _getmaxx
	mov	word ptr DGROUP:_maxx,ax
   ;	
   ;		maxy=getmaxy();
   ;	
	call	far ptr _getmaxy
	mov	word ptr DGROUP:_maxy,ax
   ;	
   ;		setviewport(0,0,maxx,maxy,1);
   ;	
	mov	ax,1
	push	ax
	push	word ptr DGROUP:_maxy
	push	word ptr DGROUP:_maxx
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	call	far ptr _setviewport
	add	sp,10
   ;	
   ;		gridx=ceil(maxx/19);
   ;	
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,19
	cwd	
	idiv	bx
	mov	word ptr [bp-2],ax
	FILD	word ptr [bp-2]
	add	sp,65528
	FSTP	qword ptr [bp-774]
	FWAIT	
	call	near ptr _ceil
	add	sp,8
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_gridx,ax
   ;	
   ;		gridy=ceil(maxy/20);
   ;	
	mov	ax,word ptr DGROUP:_maxy
	mov	bx,20
	cwd	
	idiv	bx
	mov	word ptr [bp-2],ax
	FILD	word ptr [bp-2]
	add	sp,65528
	FSTP	qword ptr [bp-774]
	FWAIT	
	call	near ptr _ceil
	add	sp,8
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_gridy,ax
   ;	
   ;		offset=(maxx%19)/2;
   ;	
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,19
	cwd	
	idiv	bx
	mov	bx,2
	mov	ax,dx
	cwd	
	idiv	bx
	mov	word ptr [bp-2],ax
	FILD	word ptr [bp-2]
	FSTP	dword ptr DGROUP:_offset
	FWAIT	
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_initialize	endp
   ;	
   ;	void initpos()
   ;	
	assume	cs:_TEXT
_initpos	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		x=9, y=14, x1=7, y1=8, x2=11, y2=8, x3= 7, y3=10, dir=0, st=120, end=60;
   ;	
	mov	word ptr DGROUP:_x,9
	mov	word ptr DGROUP:_y,14
	mov	word ptr DGROUP:_x1,7
	mov	word ptr DGROUP:_y1,8
	mov	word ptr DGROUP:_x2,11
	mov	word ptr DGROUP:_y2,8
	mov	word ptr DGROUP:_x3,7
	mov	word ptr DGROUP:_y3,10
	mov	word ptr DGROUP:_dir,0
	mov	word ptr DGROUP:_st,120
	mov	word ptr DGROUP:_end,60
   ;	
   ;		tx2=14, ty2=14, r3=0;
   ;	
	mov	word ptr DGROUP:_tx2,14
	mov	word ptr DGROUP:_ty2,14
	mov	word ptr DGROUP:_r3,0
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_initpos	endp
   ;	
   ;	void start()
   ;	
	assume	cs:_TEXT
_start	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		int i, n;
   ;		setcolor(YELLOW);
   ;	
	mov	ax,14
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		setfillstyle(SOLID_FILL, YELLOW);
   ;	
	mov	ax,14
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;		sector(maxx/2, maxy/2-50, 330, 30, 20, 20);
   ;	
	mov	ax,20
	push	ax
	mov	ax,20
	push	ax
	mov	ax,30
	push	ax
	mov	ax,330
	push	ax
	mov	ax,word ptr DGROUP:_maxy
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65486
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	far ptr _sector
	add	sp,12
   ;	
   ;		outtextxy(maxx/2-25, maxy/2, "PacMan");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+15
	push	ax
	mov	ax,word ptr DGROUP:_maxy
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65511
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		outtextxy(maxx/2-84, maxy-50, "Press any key to start");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+22
	push	ax
	mov	ax,word ptr DGROUP:_maxy
	add	ax,65486
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65452
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		for(i=0;i<30;i++)
   ;	
	xor	si,si
	jmp	short @3@98
@3@50:
   ;	
   ;		{
   ;			n=random(6);
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
	mov	ax,6
	pop	cx
	pop	bx
	call	near ptr N_LXMUL@
	push	dx
	push	ax
	call	near ptr N_LDIV@
	mov	di,ax
   ;	
   ;			sound(octave[n]*4);
   ;	
	mov	bx,di
	shl	bx,1
	shl	bx,1
	FLD	dword ptr DGROUP:_octave[bx]
	FMUL	dword ptr DGROUP:s@+45
	call	near ptr N_FTOL@
	push	ax
	call	near ptr _sound
	pop	cx
   ;	
   ;			delay(50);
   ;	
	mov	ax,50
	push	ax
	call	near ptr _delay
	pop	cx
	inc	si
@3@98:
	cmp	si,30
	jl	short @3@50
   ;	
   ;		}
   ;		nosound();
   ;	
	call	near ptr _nosound
   ;	
   ;		getch();
   ;	
	call	near ptr _getch
   ;	
   ;		sound(octave[6]*2);
   ;	
	FLD	dword ptr DGROUP:_octave+24
	FMUL	dword ptr DGROUP:s@+49
	call	near ptr N_FTOL@
	push	ax
	call	near ptr _sound
	pop	cx
   ;	
   ;		delay(15);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;		nosound();
   ;	
	call	near ptr _nosound
   ;	
   ;		cleardevice();
   ;	
	call	far ptr _cleardevice
   ;	
   ;		outtextxy(maxx/2-42, 120, "INSTRUCTIONS");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+53
	push	ax
	mov	ax,120
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65494
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		outtextxy(maxx/2-130, 180, "Your aim is to eat all the pellets");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+66
	push	ax
	mov	ax,180
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65406
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		outtextxy(maxx/2-120, 220, "But be careful! You must avoid");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+101
	push	ax
	mov	ax,220
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65416
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		outtextxy(maxx/2-123, 240, "the ghosts trying to catch you!");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+132
	push	ax
	mov	ax,240
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65413
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		outtextxy(maxx/2-116, 300, "Use WASD to change directions");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+164
	push	ax
	mov	ax,300
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65420
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		outtextxy(maxx/2-105, 185, "Modified by CM first batch boys");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+194
	push	ax
	mov	ax,185
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65431
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		outtextxy(maxx/2-96, maxy-50, "Press any key to continue");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+226
	push	ax
	mov	ax,word ptr DGROUP:_maxy
	add	ax,65486
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65440
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		getch();
   ;	
	call	near ptr _getch
   ;	
   ;		sound(octave[6]*2);
   ;	
	FLD	dword ptr DGROUP:_octave+24
	FMUL	dword ptr DGROUP:s@+49
	call	near ptr N_FTOL@
	push	ax
	call	near ptr _sound
	pop	cx
   ;	
   ;		delay(15);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;		nosound();		
   ;	
	call	near ptr _nosound
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_start	endp
   ;	
   ;	void dif()
   ;	
	assume	cs:_TEXT
_dif	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
   ;	
   ;	{
   ;		char c='M';
   ;	
	mov	byte ptr [bp-1],77
	jmp	@4@626
@4@50:
   ;	
   ;		while(c!=' ')
   ;		{
   ;		setcolor(YELLOW);
   ;	
	mov	ax,14
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		cleardevice();
   ;	
	call	far ptr _cleardevice
   ;	
   ;		outtextxy(maxx/2-42, 100, "LEVEL THE WAY YOU WANT");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+252
	push	ax
	mov	ax,100
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65494
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		outtextxy(maxx/2-200, 130, "Choose the speed at which the game progresses");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+275
	push	ax
	mov	ax,130
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65336
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		outtextxy(maxx/2-42, 170, "[S] Slow");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+321
	push	ax
	mov	ax,170
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65494
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		outtextxy(maxx/2-42, 190, "[M] Medium");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+330
	push	ax
	mov	ax,190
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65494
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		outtextxy(maxx/2-42, 210, "[F] Fast");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+341
	push	ax
	mov	ax,210
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65494
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		outtextxy(maxx/2-42, 240, "[X] Xtreme");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+350
	push	ax
	mov	ax,240
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65494
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		if(c=='s'||c=='S')
   ;	
	cmp	byte ptr [bp-1],115
	je	short @4@98
	cmp	byte ptr [bp-1],83
	jne	short @4@122
@4@98:
   ;	
   ;		{
   ;			outtextxy(maxx/2-58, 280, "Current: Slow");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+361
	push	ax
	mov	ax,280
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65478
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		}
   ;	
	jmp	@4@338
@4@122:
   ;	
   ;		else if(c=='m'||c=='M')
   ;	
	cmp	byte ptr [bp-1],109
	je	short @4@170
	cmp	byte ptr [bp-1],77
	jne	short @4@194
@4@170:
   ;	
   ;		{
   ;			outtextxy(maxx/2-64, 280, "Current: Medium");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+375
	push	ax
	mov	ax,280
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65472
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		}
   ;	
	jmp	short @4@338
@4@194:
   ;	
   ;		else if(c=='f'||c=='F')
   ;	
	cmp	byte ptr [bp-1],102
	je	short @4@242
	cmp	byte ptr [bp-1],70
	jne	short @4@266
@4@242:
   ;	
   ;		{
   ;			outtextxy(maxx/2-58, 280, "Current: Fast");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+391
	push	ax
	mov	ax,280
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65478
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		}
   ;	
	jmp	short @4@338
@4@266:
   ;	
   ;		else if(c=='x'||c=='X')
   ;	
	cmp	byte ptr [bp-1],120
	je	short @4@314
	cmp	byte ptr [bp-1],88
	jne	short @4@338
@4@314:
   ;	
   ;		{
   ;			outtextxy(maxx/2-64, 280, "The Xtreme Limited Edition");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+405
	push	ax
	mov	ax,280
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65472
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@4@338:
   ;	
   ;		}
   ;		outtextxy(maxx/2-96, maxy-50, "Press Spacebar to continue");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+432
	push	ax
	mov	ax,word ptr DGROUP:_maxy
	add	ax,65486
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65440
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		c=getch();
   ;	
	call	near ptr _getch
	mov	byte ptr [bp-1],al
   ;	
   ;		sound(octave[6]*2);
   ;	
	FLD	dword ptr DGROUP:_octave+24
	FMUL	dword ptr DGROUP:s@+49
	call	near ptr N_FTOL@
	push	ax
	call	near ptr _sound
	pop	cx
   ;	
   ;		delay(15);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;		nosound();
   ;	
	call	near ptr _nosound
   ;	
   ;		if(c=='s'||c=='S')
   ;	
	cmp	byte ptr [bp-1],115
	je	short @4@386
	cmp	byte ptr [bp-1],83
	jne	short @4@410
@4@386:
   ;	
   ;			t=400;
   ;	
	mov	word ptr DGROUP:_t,400
	jmp	short @4@626
@4@410:
   ;	
   ;		else if(c=='m'||c=='M')
   ;	
	cmp	byte ptr [bp-1],109
	je	short @4@458
	cmp	byte ptr [bp-1],77
	jne	short @4@482
@4@458:
   ;	
   ;			t=300;
   ;	
	mov	word ptr DGROUP:_t,300
	jmp	short @4@626
@4@482:
   ;	
   ;		else if(c=='f'||c=='F')
   ;	
	cmp	byte ptr [bp-1],102
	je	short @4@530
	cmp	byte ptr [bp-1],70
	jne	short @4@554
@4@530:
   ;	
   ;			t=200;
   ;	
	mov	word ptr DGROUP:_t,200
	jmp	short @4@626
@4@554:
   ;	
   ;		else if(c=='x'||c=='X')
   ;	
	cmp	byte ptr [bp-1],120
	je	short @4@602
	cmp	byte ptr [bp-1],88
	jne	short @4@626
@4@602:
   ;	
   ;			dark=1;
   ;	
	mov	word ptr DGROUP:_dark,1
@4@626:
	cmp	byte ptr [bp-1],32
	je	@@0
	jmp	@4@50
@@0:
   ;	
   ;		}
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_dif	endp
   ;	
   ;	void slice(int p, int q, int sangle, int eangle, int rad)
   ;	
	assume	cs:_TEXT
_slice	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+6]
	mov	si,word ptr [bp+12]
   ;	
   ;		{
   ;		int i,j;
   ;		if(sangle>eangle){
   ;	
	mov	ax,word ptr [bp+8]
	cmp	ax,word ptr [bp+10]
	jle	short @5@74
   ;	
   ;		circle(p,q,rad);
   ;	
	push	si
	push	di
	push	word ptr [bp+4]
	call	far ptr _circle
	add	sp,6
   ;	
   ;		floodfill(p,q,YELLOW);
   ;	
	mov	ax,14
	push	ax
	push	di
	push	word ptr [bp+4]
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		setcolor(getbkcolor());
   ;	
	call	far ptr _getbkcolor
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		setfillstyle(SOLID_FILL,getbkcolor());
   ;	
	call	far ptr _getbkcolor
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;		pieslice(p,q,eangle,sangle,rad);
   ;	
	push	si
	push	word ptr [bp+8]
	push	word ptr [bp+10]
	push	di
	push	word ptr [bp+4]
	call	far ptr _pieslice
	add	sp,10
   ;	
   ;		setcolor(YELLOW);
   ;	
	mov	ax,14
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		}
   ;	
	jmp	short @5@98
@5@74:
   ;	
   ;		else{
   ;		setfillstyle(SOLID_FILL, YELLOW);
   ;	
	mov	ax,14
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;		sector(p,q,sangle,eangle,rad,rad);
   ;	
	push	si
	push	si
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	di
	push	word ptr [bp+4]
	call	far ptr _sector
	add	sp,12
@5@98:
   ;	
   ;		}
   ;		}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_slice	endp
   ;	
   ;	void show()
   ;	
	assume	cs:_TEXT
_show	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
   ;	
   ;	{
   ;		int i,j;
   ;		clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;		cleardevice();
   ;	
	call	far ptr _cleardevice
   ;	
   ;		for (i=0; i<20; i++)
   ;	
	xor	di,di
	jmp	@6@338
@6@50:
   ;	
   ;		{	for (j=0; j<19; j++)
   ;	
	xor	si,si
	jmp	@6@290
@6@74:
   ;	
   ;			{
   ;			switch(map[i][j])
   ;	
	mov	ax,di
	mov	dx,38
	imul	dx
	mov	dx,si
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	mov	ax,word ptr DGROUP:_map[bx]
	or	ax,ax
	je	short @6@194
	cmp	ax,1
	je	short @6@218
	cmp	ax,2
	jne	@@1
	jmp	@6@242
@@1:
	jmp	@6@266
@6@194:
   ;	
   ;			{
   ;			case 0:
   ;			setfillstyle(SOLID_FILL, BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			bar(j*gridx+1+offset, i*gridy+1, (j+1)*gridx+offset, (i+1)*gridy);
   ;	
	mov	ax,di
	inc	ax
	imul	word ptr DGROUP:_gridy
	push	ax
	mov	ax,si
	inc	ax
	imul	word ptr DGROUP:_gridx
	mov	word ptr [bp-2],ax
	FILD	word ptr [bp-2]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	mov	ax,di
	imul	word ptr DGROUP:_gridy
	inc	ax
	push	ax
	mov	ax,si
	imul	word ptr DGROUP:_gridx
	inc	ax
	mov	word ptr [bp-2],ax
	FILD	word ptr [bp-2]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _bar
	add	sp,8
   ;	
   ;			break;
   ;	
	jmp	@6@266
@6@218:
   ;	
   ;			case 1:
   ;			setcolor(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			circle(j*gridx+gridx/2+offset, i*gridy+gridy/2, 2);
   ;	
	mov	ax,2
	push	ax
	mov	ax,di
	imul	word ptr DGROUP:_gridy
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	push	dx
	mov	ax,si
	imul	word ptr DGROUP:_gridx
	push	ax
	mov	ax,word ptr DGROUP:_gridx
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	mov	word ptr [bp-2],dx
	FILD	word ptr [bp-2]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;			break;
   ;	
	jmp	short @6@266
@6@242:
   ;	
   ;			case 2:
   ;			setfillstyle(SOLID_FILL, BLACK);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			bar(j*gridx+1+offset, i*gridy+1, (j+1)*gridx+offset, (i+1)*gridy);
   ;	
	mov	ax,di
	inc	ax
	imul	word ptr DGROUP:_gridy
	push	ax
	mov	ax,si
	inc	ax
	imul	word ptr DGROUP:_gridx
	mov	word ptr [bp-2],ax
	FILD	word ptr [bp-2]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	mov	ax,di
	imul	word ptr DGROUP:_gridy
	inc	ax
	push	ax
	mov	ax,si
	imul	word ptr DGROUP:_gridx
	inc	ax
	mov	word ptr [bp-2],ax
	FILD	word ptr [bp-2]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _bar
	add	sp,8
   ;	
   ;			break;
   ;	
	jmp	short @6@266
@6@266:
	inc	si
@6@290:
	cmp	si,19
	jge	@@2
	jmp	@6@74
@@2:
	inc	di
@6@338:
	cmp	di,20
	jge	@@3
	jmp	@6@50
@@3:
   ;	
   ;			}
   ;		}
   ;		}
   ;		setfillstyle(SOLID_FILL, YELLOW);
   ;	
	mov	ax,14
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;		setcolor(YELLOW);
   ;	
	mov	ax,14
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		slice(gridx*x+gridx/2+offset, gridy*y+gridy/2, st, end, gridy/2-2);
   ;	
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65534
	push	ax
	push	word ptr DGROUP:_end
	push	word ptr DGROUP:_st
	mov	ax,word ptr DGROUP:_gridy
	imul	word ptr DGROUP:_y
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	push	dx
	mov	ax,word ptr DGROUP:_gridx
	imul	word ptr DGROUP:_x
	push	ax
	mov	ax,word ptr DGROUP:_gridx
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	mov	word ptr [bp-2],dx
	FILD	word ptr [bp-2]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	near ptr _slice
	add	sp,10
   ;	
   ;		setcolor(RED);
   ;	
	mov	ax,4
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		setfillstyle(SOLID_FILL, RED);
   ;	
	mov	ax,4
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;		circle(gridx*x1+gridx/2+offset, gridy*y1+gridy/2, gridy/2-2);
   ;	
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65534
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	imul	word ptr DGROUP:_y1
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	push	dx
	mov	ax,word ptr DGROUP:_gridx
	imul	word ptr DGROUP:_x1
	push	ax
	mov	ax,word ptr DGROUP:_gridx
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	mov	word ptr [bp-2],dx
	FILD	word ptr [bp-2]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;		floodfill(gridx*x1+gridx/2+offset, gridy*y1+gridy/2, RED);
   ;	
	mov	ax,4
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	imul	word ptr DGROUP:_y1
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	push	dx
	mov	ax,word ptr DGROUP:_gridx
	imul	word ptr DGROUP:_x1
	push	ax
	mov	ax,word ptr DGROUP:_gridx
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	mov	word ptr [bp-2],dx
	FILD	word ptr [bp-2]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		setcolor(CYAN);
   ;	
	mov	ax,3
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		setfillstyle(SOLID_FILL, CYAN);
   ;	
	mov	ax,3
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;		circle(gridx*x2+gridx/2+offset, gridy*y2+gridy/2, gridy/2-2);
   ;	
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65534
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	imul	word ptr DGROUP:_y2
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	push	dx
	mov	ax,word ptr DGROUP:_gridx
	imul	word ptr DGROUP:_x2
	push	ax
	mov	ax,word ptr DGROUP:_gridx
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	mov	word ptr [bp-2],dx
	FILD	word ptr [bp-2]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;		floodfill(gridx*x2+gridx/2+offset, gridy*y2+gridy/2, CYAN);
   ;	
	mov	ax,3
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	imul	word ptr DGROUP:_y2
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	push	dx
	mov	ax,word ptr DGROUP:_gridx
	imul	word ptr DGROUP:_x2
	push	ax
	mov	ax,word ptr DGROUP:_gridx
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	mov	word ptr [bp-2],dx
	FILD	word ptr [bp-2]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		setcolor(GREEN);
   ;	
	mov	ax,2
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		setfillstyle(SOLID_FILL, GREEN);
   ;	
	mov	ax,2
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;		circle(gridx*x3+gridx/2+offset, gridy*y3+gridy/2, gridy/2-2);
   ;	
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65534
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	imul	word ptr DGROUP:_y3
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	push	dx
	mov	ax,word ptr DGROUP:_gridx
	imul	word ptr DGROUP:_x3
	push	ax
	mov	ax,word ptr DGROUP:_gridx
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	mov	word ptr [bp-2],dx
	FILD	word ptr [bp-2]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;		floodfill(gridx*x3+gridx/2+offset, gridy*y3+gridy/2, GREEN);
   ;	
	mov	ax,2
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	imul	word ptr DGROUP:_y3
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	push	dx
	mov	ax,word ptr DGROUP:_gridx
	imul	word ptr DGROUP:_x3
	push	ax
	mov	ax,word ptr DGROUP:_gridx
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	mov	word ptr [bp-2],dx
	FILD	word ptr [bp-2]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		printf("\t\t\t\tPress Esc to Pause\t\tLives left: %2d", (3-death));
   ;	
	mov	ax,3
	sub	ax,word ptr DGROUP:_death
	push	ax
	mov	ax,offset DGROUP:s@+459
	push	ax
	call	near ptr _printf
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
_show	endp
   ;	
   ;	void update(int l, int m)
   ;	
	assume	cs:_TEXT
_update	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
   ;	
   ;	{
   ;		int i,j,r=1;
   ;	
	mov	word ptr [bp-2],1
   ;	
   ;		sprintf(sc,"%d", score);
   ;	
	push	word ptr DGROUP:_score
	mov	ax,offset DGROUP:s@+499
	push	ax
	mov	ax,offset DGROUP:_sc
	push	ax
	call	near ptr _sprintf
	add	sp,6
   ;	
   ;		setcolor(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		setviewport(offset,0,offset+120,gridy,1);
   ;	
	mov	ax,1
	push	ax
	push	word ptr DGROUP:_gridy
	FLD	dword ptr DGROUP:_offset
	FADD	dword ptr DGROUP:s@+502
	call	near ptr N_FTOL@
	push	ax
	xor	ax,ax
	push	ax
	FLD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _setviewport
	add	sp,10
   ;	
   ;		clearviewport();
   ;	
	call	far ptr _clearviewport
   ;	
   ;		outtextxy(offset,5,"Score: ");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+506
	push	ax
	mov	ax,5
	push	ax
	FLD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		outtextxy(offset+60,5,sc);
   ;	
	push	ds
	mov	ax,offset DGROUP:_sc
	push	ax
	mov	ax,5
	push	ax
	FLD	dword ptr DGROUP:_offset
	FADD	dword ptr DGROUP:s@+514
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		setviewport(0,0,maxx,maxy,1);
   ;	
	mov	ax,1
	push	ax
	push	word ptr DGROUP:_maxy
	push	word ptr DGROUP:_maxx
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	call	far ptr _setviewport
	add	sp,10
   ;	
   ;		if (dark==1)
   ;	
	cmp	word ptr DGROUP:_dark,1
	jne	short @7@74
   ;	
   ;		{
   ;			cleardevice();
   ;	
	call	far ptr _cleardevice
   ;	
   ;		    r=2;
   ;	
	mov	word ptr [bp-2],2
@7@74:
   ;	
   ;		}
   ;		for (i=(m-r); i<=(m+r); i++)
   ;	
	mov	ax,word ptr [bp+6]
	sub	ax,word ptr [bp-2]
	mov	di,ax
	jmp	@7@362
@7@98:
   ;	
   ;		{	for (j=(l-r); j<=(l+r); j++)
   ;	
	mov	ax,word ptr [bp+4]
	sub	ax,word ptr [bp-2]
	mov	si,ax
	jmp	@7@314
@7@122:
   ;	
   ;			{
   ;			switch(map[i][j])
   ;	
	mov	ax,di
	mov	dx,38
	imul	dx
	mov	dx,si
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	mov	ax,word ptr DGROUP:_map[bx]
	cmp	ax,1
	je	short @7@242
	cmp	ax,2
	jne	@@4
	jmp	@7@266
@@4:
	jmp	short @7@218
@7@218:
   ;	
   ;			{
   ;			default:
   ;			setfillstyle(SOLID_FILL, BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			bar(j*gridx+1+offset, i*gridy+1, (j+1)*gridx+offset, (i+1)*gridy);
   ;	
	mov	ax,di
	inc	ax
	imul	word ptr DGROUP:_gridy
	push	ax
	mov	ax,si
	inc	ax
	imul	word ptr DGROUP:_gridx
	mov	word ptr [bp-4],ax
	FILD	word ptr [bp-4]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	mov	ax,di
	imul	word ptr DGROUP:_gridy
	inc	ax
	push	ax
	mov	ax,si
	imul	word ptr DGROUP:_gridx
	inc	ax
	mov	word ptr [bp-4],ax
	FILD	word ptr [bp-4]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _bar
	add	sp,8
   ;	
   ;			break;
   ;	
	jmp	@7@290
@7@242:
   ;	
   ;			case 1:
   ;			setfillstyle(SOLID_FILL, BLACK);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			bar(j*gridx+1+offset, i*gridy+1, (j+1)*gridx+offset, (i+1)*gridy);
   ;	
	mov	ax,di
	inc	ax
	imul	word ptr DGROUP:_gridy
	push	ax
	mov	ax,si
	inc	ax
	imul	word ptr DGROUP:_gridx
	mov	word ptr [bp-4],ax
	FILD	word ptr [bp-4]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	mov	ax,di
	imul	word ptr DGROUP:_gridy
	inc	ax
	push	ax
	mov	ax,si
	imul	word ptr DGROUP:_gridx
	inc	ax
	mov	word ptr [bp-4],ax
	FILD	word ptr [bp-4]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _bar
	add	sp,8
   ;	
   ;			setcolor(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			circle(j*gridx+gridx/2+offset, i*gridy+gridy/2, 2);
   ;	
	mov	ax,2
	push	ax
	mov	ax,di
	imul	word ptr DGROUP:_gridy
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	push	dx
	mov	ax,si
	imul	word ptr DGROUP:_gridx
	push	ax
	mov	ax,word ptr DGROUP:_gridx
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	mov	word ptr [bp-4],dx
	FILD	word ptr [bp-4]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;			break;
   ;	
	jmp	short @7@290
@7@266:
   ;	
   ;			case 2:
   ;			setfillstyle(SOLID_FILL, BLACK);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			bar(j*gridx+1+offset, i*gridy+1, (j+1)*gridx+offset, (i+1)*gridy);
   ;	
	mov	ax,di
	inc	ax
	imul	word ptr DGROUP:_gridy
	push	ax
	mov	ax,si
	inc	ax
	imul	word ptr DGROUP:_gridx
	mov	word ptr [bp-4],ax
	FILD	word ptr [bp-4]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	mov	ax,di
	imul	word ptr DGROUP:_gridy
	inc	ax
	push	ax
	mov	ax,si
	imul	word ptr DGROUP:_gridx
	inc	ax
	mov	word ptr [bp-4],ax
	FILD	word ptr [bp-4]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _bar
	add	sp,8
   ;	
   ;			break;
   ;	
	jmp	short @7@290
@7@290:
	inc	si
@7@314:
	mov	ax,word ptr [bp+4]
	add	ax,word ptr [bp-2]
	cmp	ax,si
	jl	@@5
	jmp	@7@122
@@5:
	inc	di
@7@362:
	mov	ax,word ptr [bp+6]
	add	ax,word ptr [bp-2]
	cmp	ax,di
	jl	@@6
	jmp	@7@98
@@6:
   ;	
   ;			}
   ;		}
   ;		}
   ;			setfillstyle(SOLID_FILL, YELLOW);
   ;	
	mov	ax,14
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			setcolor(YELLOW);
   ;	
	mov	ax,14
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			slice(gridx*x+gridx/2+offset, gridy*y+gridy/2, st, end, gridy/2-2);
   ;	
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65534
	push	ax
	push	word ptr DGROUP:_end
	push	word ptr DGROUP:_st
	mov	ax,word ptr DGROUP:_gridy
	imul	word ptr DGROUP:_y
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	push	dx
	mov	ax,word ptr DGROUP:_gridx
	imul	word ptr DGROUP:_x
	push	ax
	mov	ax,word ptr DGROUP:_gridx
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	mov	word ptr [bp-4],dx
	FILD	word ptr [bp-4]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	near ptr _slice
	add	sp,10
   ;	
   ;			
   ;			setcolor(RED);
   ;	
	mov	ax,4
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			setfillstyle(SOLID_FILL, RED);
   ;	
	mov	ax,4
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			circle(gridx*x1+gridx/2+offset, gridy*y1+gridy/2, gridy/2-2);
   ;	
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65534
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	imul	word ptr DGROUP:_y1
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	push	dx
	mov	ax,word ptr DGROUP:_gridx
	imul	word ptr DGROUP:_x1
	push	ax
	mov	ax,word ptr DGROUP:_gridx
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	mov	word ptr [bp-4],dx
	FILD	word ptr [bp-4]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;			floodfill(gridx*x1+gridx/2+offset, gridy*y1+gridy/2, RED);
   ;	
	mov	ax,4
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	imul	word ptr DGROUP:_y1
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	push	dx
	mov	ax,word ptr DGROUP:_gridx
	imul	word ptr DGROUP:_x1
	push	ax
	mov	ax,word ptr DGROUP:_gridx
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	mov	word ptr [bp-4],dx
	FILD	word ptr [bp-4]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;			setcolor(CYAN);
   ;	
	mov	ax,3
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			setfillstyle(SOLID_FILL, CYAN);
   ;	
	mov	ax,3
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			circle(gridx*x2+gridx/2+offset, gridy*y2+gridy/2, gridy/2-2);
   ;	
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65534
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	imul	word ptr DGROUP:_y2
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	push	dx
	mov	ax,word ptr DGROUP:_gridx
	imul	word ptr DGROUP:_x2
	push	ax
	mov	ax,word ptr DGROUP:_gridx
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	mov	word ptr [bp-4],dx
	FILD	word ptr [bp-4]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;			floodfill(gridx*x2+gridx/2+offset, gridy*y2+gridy/2, CYAN);
   ;	
	mov	ax,3
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	imul	word ptr DGROUP:_y2
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	push	dx
	mov	ax,word ptr DGROUP:_gridx
	imul	word ptr DGROUP:_x2
	push	ax
	mov	ax,word ptr DGROUP:_gridx
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	mov	word ptr [bp-4],dx
	FILD	word ptr [bp-4]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;			setcolor(GREEN);
   ;	
	mov	ax,2
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			setfillstyle(SOLID_FILL, GREEN);
   ;	
	mov	ax,2
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			circle(gridx*x3+gridx/2+offset, gridy*y3+gridy/2, gridy/2-2);
   ;	
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65534
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	imul	word ptr DGROUP:_y3
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	push	dx
	mov	ax,word ptr DGROUP:_gridx
	imul	word ptr DGROUP:_x3
	push	ax
	mov	ax,word ptr DGROUP:_gridx
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	mov	word ptr [bp-4],dx
	FILD	word ptr [bp-4]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;			floodfill(gridx*x3+gridx/2+offset, gridy*y3+gridy/2, GREEN);
   ;	
	mov	ax,2
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	imul	word ptr DGROUP:_y3
	push	ax
	mov	ax,word ptr DGROUP:_gridy
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	push	dx
	mov	ax,word ptr DGROUP:_gridx
	imul	word ptr DGROUP:_x3
	push	ax
	mov	ax,word ptr DGROUP:_gridx
	mov	bx,2
	cwd	
	idiv	bx
	pop	dx
	add	dx,ax
	mov	word ptr [bp-4],dx
	FILD	word ptr [bp-4]
	FADD	dword ptr DGROUP:_offset
	call	near ptr N_FTOL@
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;			
   ;			setcolor(YELLOW);
   ;	
	mov	ax,14
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_update	endp
   ;	
   ;	void ghost1()
   ;	
	assume	cs:_TEXT
_ghost1	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		int k, r=0;
   ;	
	xor	si,si
@8@50:
   ;	
   ;		while(1)
   ;		{
   ;		if(r==2||(abs(y1-y)>=abs(x1-x)&&r==0))
   ;	
	cmp	si,2
	je	short @8@122
	mov	ax,word ptr DGROUP:_y1
	sub	ax,word ptr DGROUP:_y
	cwd	
	xor	ax,dx
	sub	ax,dx
	push	ax
	mov	ax,word ptr DGROUP:_x1
	sub	ax,word ptr DGROUP:_x
	cwd	
	xor	ax,dx
	sub	ax,dx
	pop	dx
	cmp	dx,ax
	jl	short @8@362
	or	si,si
	jne	short @8@362
@8@122:
   ;	
   ;		{
   ;			if (r==2||y1>y)
   ;	
	cmp	si,2
	je	short @8@170
	mov	ax,word ptr DGROUP:_y1
	cmp	ax,word ptr DGROUP:_y
	jle	short @8@242
@8@170:
   ;	
   ;			{
   ;				if (map[y1-1][x1]!=0)
   ;	
	mov	ax,word ptr DGROUP:_y1
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x1
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx-38],0
	je	short @8@218
   ;	
   ;				{
   ;					y1=y1-1;
   ;	
	mov	ax,word ptr DGROUP:_y1
	dec	ax
	mov	word ptr DGROUP:_y1,ax
   ;	
   ;					break;
   ;	
	jmp	@8@650
@8@218:
   ;	
   ;				}
   ;			}
   ;	
	jmp	short @8@338
@8@242:
   ;	
   ;			else if (r==2||y1<=y)
   ;	
	cmp	si,2
	je	short @8@290
	mov	ax,word ptr DGROUP:_y1
	cmp	ax,word ptr DGROUP:_y
	jg	short @8@338
@8@290:
   ;	
   ;			{
   ;				if (map[y1+1][x1]!=0)
   ;	
	mov	ax,word ptr DGROUP:_y1
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x1
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx+38],0
	je	short @8@338
   ;	
   ;				{
   ;					y1=y1+1;
   ;	
	mov	ax,word ptr DGROUP:_y1
	inc	ax
	mov	word ptr DGROUP:_y1,ax
   ;	
   ;					break;
   ;	
	jmp	short @8@650
@8@338:
   ;	
   ;				}
   ;			}
   ;		}
   ;	
	jmp	short @8@578
@8@362:
   ;	
   ;		else 
   ;		{
   ;			if (r==2||x1>x)
   ;	
	cmp	si,2
	je	short @8@410
	mov	ax,word ptr DGROUP:_x1
	cmp	ax,word ptr DGROUP:_x
	jle	short @8@482
@8@410:
   ;	
   ;			{
   ;				if (map[y1][x1-1]!=0)
   ;	
	mov	ax,word ptr DGROUP:_y1
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x1
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx-2],0
	je	short @8@458
   ;	
   ;				{
   ;					x1=x1-1;
   ;	
	mov	ax,word ptr DGROUP:_x1
	dec	ax
	mov	word ptr DGROUP:_x1,ax
   ;	
   ;					break;
   ;	
	jmp	short @8@650
@8@458:
   ;	
   ;				}
   ;			}
   ;	
	jmp	short @8@578
@8@482:
   ;	
   ;			else if (r==2||x1<=x)
   ;	
	cmp	si,2
	je	short @8@530
	mov	ax,word ptr DGROUP:_x1
	cmp	ax,word ptr DGROUP:_x
	jg	short @8@578
@8@530:
   ;	
   ;			{
   ;				if (map[y1][x1+1]!=0)
   ;	
	mov	ax,word ptr DGROUP:_y1
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x1
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx+2],0
	je	short @8@578
   ;	
   ;				{
   ;					x1=x1+1;
   ;	
	mov	ax,word ptr DGROUP:_x1
	inc	ax
	mov	word ptr DGROUP:_x1,ax
   ;	
   ;					break;
   ;	
	jmp	short @8@650
@8@578:
   ;	
   ;				}
   ;			}
   ;		}
   ;		r++;
   ;	
	inc	si
   ;	
   ;		if(r>3)
   ;	
	cmp	si,3
	jle	short @8@626
   ;	
   ;			break;
   ;	
	jmp	short @8@650
@8@626:
	jmp	@8@50
@8@650:
   ;	
   ;		}
   ;			if(dark==0)
   ;	
	cmp	word ptr DGROUP:_dark,0
	jne	short @8@698
   ;	
   ;			update(x1,y1);
   ;	
	push	word ptr DGROUP:_y1
	push	word ptr DGROUP:_x1
	call	near ptr _update
	pop	cx
	pop	cx
@8@698:
   ;	
   ;			if (x1==x&&y1==y)
   ;	
	mov	ax,word ptr DGROUP:_x1
	cmp	ax,word ptr DGROUP:_x
	jne	short @8@914
	mov	ax,word ptr DGROUP:_y1
	cmp	ax,word ptr DGROUP:_y
	jne	short @8@914
   ;	
   ;			{
   ;				death++;
   ;	
	inc	word ptr DGROUP:_death
   ;	
   ;				for(k=6;k>=0;k--)
   ;	
	mov	di,6
	jmp	short @8@818
@8@770:
   ;	
   ;				{
   ;					sound(octave[k]);
   ;	
	mov	bx,di
	shl	bx,1
	shl	bx,1
	FLD	dword ptr DGROUP:_octave[bx]
	call	near ptr N_FTOL@
	push	ax
	call	near ptr _sound
	pop	cx
   ;	
   ;					delay(50);
   ;	
	mov	ax,50
	push	ax
	call	near ptr _delay
	pop	cx
	dec	di
@8@818:
	or	di,di
	jge	short @8@770
   ;	
   ;				}
   ;				nosound();
   ;	
	call	near ptr _nosound
   ;	
   ;				delay(750);
   ;	
	mov	ax,750
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				if(death==3)
   ;	
	cmp	word ptr DGROUP:_death,3
	jne	short @8@890
   ;	
   ;					kill();
   ;	
	call	near ptr _kill
	jmp	short @8@914
@8@890:
   ;	
   ;				else
   ;				{
   ;					initpos();
   ;	
	call	near ptr _initpos
   ;	
   ;					show();
   ;	
	call	near ptr _show
@8@914:
   ;	
   ;				}
   ;			}
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_ghost1	endp
   ;	
   ;	void ghost2()
   ;	
	assume	cs:_TEXT
_ghost2	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		int k, r=0;
   ;	
	xor	si,si
@9@50:
   ;	
   ;		while(1)
   ;		{
   ;		if(r==2||(abs(y2-ty2)>=abs(x2-tx2)&&r==0))
   ;	
	cmp	si,2
	je	short @9@122
	mov	ax,word ptr DGROUP:_y2
	sub	ax,word ptr DGROUP:_ty2
	cwd	
	xor	ax,dx
	sub	ax,dx
	push	ax
	mov	ax,word ptr DGROUP:_x2
	sub	ax,word ptr DGROUP:_tx2
	cwd	
	xor	ax,dx
	sub	ax,dx
	pop	dx
	cmp	dx,ax
	jl	short @9@362
	or	si,si
	jne	short @9@362
@9@122:
   ;	
   ;		{
   ;			if (r==2||y2>ty2)
   ;	
	cmp	si,2
	je	short @9@170
	mov	ax,word ptr DGROUP:_y2
	cmp	ax,word ptr DGROUP:_ty2
	jle	short @9@242
@9@170:
   ;	
   ;			{
   ;				if (map[y2-1][x2]!=0)
   ;	
	mov	ax,word ptr DGROUP:_y2
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x2
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx-38],0
	je	short @9@218
   ;	
   ;				{
   ;					y2=y2-1;
   ;	
	mov	ax,word ptr DGROUP:_y2
	dec	ax
	mov	word ptr DGROUP:_y2,ax
   ;	
   ;					break;
   ;	
	jmp	@9@650
@9@218:
   ;	
   ;				}
   ;			}
   ;	
	jmp	short @9@338
@9@242:
   ;	
   ;			else if (r==2||y2<=ty2)
   ;	
	cmp	si,2
	je	short @9@290
	mov	ax,word ptr DGROUP:_y2
	cmp	ax,word ptr DGROUP:_ty2
	jg	short @9@338
@9@290:
   ;	
   ;			{
   ;				if (map[y2+1][x2]!=0)
   ;	
	mov	ax,word ptr DGROUP:_y2
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x2
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx+38],0
	je	short @9@338
   ;	
   ;				{
   ;					y2=y2+1;
   ;	
	mov	ax,word ptr DGROUP:_y2
	inc	ax
	mov	word ptr DGROUP:_y2,ax
   ;	
   ;					break;
   ;	
	jmp	short @9@650
@9@338:
   ;	
   ;				}
   ;			}
   ;		}
   ;	
	jmp	short @9@578
@9@362:
   ;	
   ;		else 
   ;		{
   ;			if (r==2||x2>tx2)
   ;	
	cmp	si,2
	je	short @9@410
	mov	ax,word ptr DGROUP:_x2
	cmp	ax,word ptr DGROUP:_tx2
	jle	short @9@482
@9@410:
   ;	
   ;			{
   ;				if (map[y2][x2-1]!=0)
   ;	
	mov	ax,word ptr DGROUP:_y2
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x2
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx-2],0
	je	short @9@458
   ;	
   ;				{
   ;					x2=x2-1;
   ;	
	mov	ax,word ptr DGROUP:_x2
	dec	ax
	mov	word ptr DGROUP:_x2,ax
   ;	
   ;					break;
   ;	
	jmp	short @9@650
@9@458:
   ;	
   ;				}
   ;			}
   ;	
	jmp	short @9@578
@9@482:
   ;	
   ;			else if (r==2||x2<=tx2)
   ;	
	cmp	si,2
	je	short @9@530
	mov	ax,word ptr DGROUP:_x2
	cmp	ax,word ptr DGROUP:_tx2
	jg	short @9@578
@9@530:
   ;	
   ;			{
   ;				if (map[y2][x2+1]!=0)
   ;	
	mov	ax,word ptr DGROUP:_y2
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x2
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx+2],0
	je	short @9@578
   ;	
   ;				{
   ;					x2=x2+1;
   ;	
	mov	ax,word ptr DGROUP:_x2
	inc	ax
	mov	word ptr DGROUP:_x2,ax
   ;	
   ;					break;
   ;	
	jmp	short @9@650
@9@578:
   ;	
   ;				}
   ;			}
   ;		}
   ;		r++;
   ;	
	inc	si
   ;	
   ;		if(r>3)
   ;	
	cmp	si,3
	jle	short @9@626
   ;	
   ;			break;
   ;	
	jmp	short @9@650
@9@626:
	jmp	@9@50
@9@650:
   ;	
   ;		}
   ;			if(dark==0)
   ;	
	cmp	word ptr DGROUP:_dark,0
	jne	short @9@698
   ;	
   ;			update(x2,y2);
   ;	
	push	word ptr DGROUP:_y2
	push	word ptr DGROUP:_x2
	call	near ptr _update
	pop	cx
	pop	cx
@9@698:
   ;	
   ;			if (x2==x&&y2==y)
   ;	
	mov	ax,word ptr DGROUP:_x2
	cmp	ax,word ptr DGROUP:_x
	jne	short @9@914
	mov	ax,word ptr DGROUP:_y2
	cmp	ax,word ptr DGROUP:_y
	jne	short @9@914
   ;	
   ;			{
   ;				death++;
   ;	
	inc	word ptr DGROUP:_death
   ;	
   ;				for(k=6;k>=0;k--)
   ;	
	mov	di,6
	jmp	short @9@818
@9@770:
   ;	
   ;				{
   ;					sound(octave[k]);
   ;	
	mov	bx,di
	shl	bx,1
	shl	bx,1
	FLD	dword ptr DGROUP:_octave[bx]
	call	near ptr N_FTOL@
	push	ax
	call	near ptr _sound
	pop	cx
   ;	
   ;					delay(50);
   ;	
	mov	ax,50
	push	ax
	call	near ptr _delay
	pop	cx
	dec	di
@9@818:
	or	di,di
	jge	short @9@770
   ;	
   ;				}
   ;				nosound();
   ;	
	call	near ptr _nosound
   ;	
   ;				delay(750);
   ;	
	mov	ax,750
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				if(death==3)
   ;	
	cmp	word ptr DGROUP:_death,3
	jne	short @9@890
   ;	
   ;					kill();
   ;	
	call	near ptr _kill
	jmp	short @9@914
@9@890:
   ;	
   ;				else
   ;				{
   ;					initpos();
   ;	
	call	near ptr _initpos
   ;	
   ;					show();
   ;	
	call	near ptr _show
@9@914:
   ;	
   ;				}
   ;			}
   ;			if (x2==tx2&&y2==ty2)
   ;	
	mov	ax,word ptr DGROUP:_x2
	cmp	ax,word ptr DGROUP:_tx2
	jne	short @9@1250
	mov	ax,word ptr DGROUP:_y2
	cmp	ax,word ptr DGROUP:_ty2
	jne	short @9@1250
   ;	
   ;			{
   ;				if(tx2==14&&ty2==14)
   ;	
	cmp	word ptr DGROUP:_tx2,14
	jne	short @9@1034
	cmp	word ptr DGROUP:_ty2,14
	jne	short @9@1034
   ;	
   ;					tx2=4;
   ;	
	mov	word ptr DGROUP:_tx2,4
	jmp	short @9@1250
@9@1034:
   ;	
   ;				else if(tx2==4&&ty2==14)
   ;	
	cmp	word ptr DGROUP:_tx2,4
	jne	short @9@1106
	cmp	word ptr DGROUP:_ty2,14
	jne	short @9@1106
   ;	
   ;					ty2=2;
   ;	
	mov	word ptr DGROUP:_ty2,2
	jmp	short @9@1250
@9@1106:
   ;	
   ;				else if(tx2==4&&ty2==2)
   ;	
	cmp	word ptr DGROUP:_tx2,4
	jne	short @9@1178
	cmp	word ptr DGROUP:_ty2,2
	jne	short @9@1178
   ;	
   ;					tx2=14;
   ;	
	mov	word ptr DGROUP:_tx2,14
	jmp	short @9@1250
@9@1178:
   ;	
   ;				else if(tx2==14&&ty2==2)
   ;	
	cmp	word ptr DGROUP:_tx2,14
	jne	short @9@1250
	cmp	word ptr DGROUP:_ty2,2
	jne	short @9@1250
   ;	
   ;					ty2=14;
   ;	
	mov	word ptr DGROUP:_ty2,14
@9@1250:
   ;	
   ;			}	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_ghost2	endp
   ;	
   ;	void ghost3()
   ;	
	assume	cs:_TEXT
_ghost3	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
   ;	
   ;	{
   ;		int k, r=0, f=0;
   ;	
	xor	si,si
	xor	di,di
   ;	
   ;		if((abs(x3-x)<=8&&abs(y3-y)<=8)&&r3<=8&&f==0)
   ;	
	mov	ax,word ptr DGROUP:_x3
	sub	ax,word ptr DGROUP:_x
	cwd	
	xor	ax,dx
	sub	ax,dx
	cmp	ax,8
	jg	short @10@194
	mov	ax,word ptr DGROUP:_y3
	sub	ax,word ptr DGROUP:_y
	cwd	
	xor	ax,dx
	sub	ax,dx
	cmp	ax,8
	jg	short @10@194
	cmp	word ptr DGROUP:_r3,8
	jg	short @10@194
	or	di,di
	jne	short @10@194
   ;	
   ;		{
   ;			tx3=x;
   ;	
	mov	ax,word ptr DGROUP:_x
	mov	word ptr DGROUP:_tx3,ax
   ;	
   ;			ty3=y;
   ;	
	mov	ax,word ptr DGROUP:_y
	mov	word ptr DGROUP:_ty3,ax
   ;	
   ;			r3++;
   ;	
	inc	word ptr DGROUP:_r3
   ;	
   ;			if(r3==8)
   ;	
	cmp	word ptr DGROUP:_r3,8
	jne	short @10@170
   ;	
   ;			f=1;
   ;	
	mov	di,1
@10@170:
   ;	
   ;		}
   ;	
	jmp	short @10@242
@10@194:
   ;	
   ;		else
   ;		{
   ;			tx3=19-x;
   ;	
	mov	ax,19
	sub	ax,word ptr DGROUP:_x
	mov	word ptr DGROUP:_tx3,ax
   ;	
   ;			ty3=20-y;
   ;	
	mov	ax,20
	sub	ax,word ptr DGROUP:_y
	mov	word ptr DGROUP:_ty3,ax
   ;	
   ;			if(f==1)
   ;	
	cmp	di,1
	jne	short @10@242
   ;	
   ;				r3++;
   ;	
	inc	word ptr DGROUP:_r3
@10@242:
   ;	
   ;		}
   ;		if(r3==16)
   ;	
	cmp	word ptr DGROUP:_r3,16
	jne	short @10@290
   ;	
   ;		{
   ;			r3=0;
   ;	
	mov	word ptr DGROUP:_r3,0
   ;	
   ;			f=0;
   ;	
	xor	di,di
@10@290:
   ;	
   ;		}
   ;		while(1)
   ;		{
   ;		if(r==2||(abs(y3-ty3)>=abs(x3-tx3)&&r==0))
   ;	
	cmp	si,2
	je	short @10@362
	mov	ax,word ptr DGROUP:_y3
	sub	ax,word ptr DGROUP:_ty3
	cwd	
	xor	ax,dx
	sub	ax,dx
	push	ax
	mov	ax,word ptr DGROUP:_x3
	sub	ax,word ptr DGROUP:_tx3
	cwd	
	xor	ax,dx
	sub	ax,dx
	pop	dx
	cmp	dx,ax
	jl	short @10@602
	or	si,si
	jne	short @10@602
@10@362:
   ;	
   ;		{
   ;			if (r==2||y3>ty3)
   ;	
	cmp	si,2
	je	short @10@410
	mov	ax,word ptr DGROUP:_y3
	cmp	ax,word ptr DGROUP:_ty3
	jle	short @10@482
@10@410:
   ;	
   ;			{
   ;				if (map[y3-1][x3]!=0)
   ;	
	mov	ax,word ptr DGROUP:_y3
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x3
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx-38],0
	je	short @10@458
   ;	
   ;				{
   ;					y3=y3-1;
   ;	
	mov	ax,word ptr DGROUP:_y3
	dec	ax
	mov	word ptr DGROUP:_y3,ax
   ;	
   ;					break;
   ;	
	jmp	@10@890
@10@458:
   ;	
   ;				}
   ;			}
   ;	
	jmp	short @10@578
@10@482:
   ;	
   ;			else if (r==2||y3<=ty3)
   ;	
	cmp	si,2
	je	short @10@530
	mov	ax,word ptr DGROUP:_y3
	cmp	ax,word ptr DGROUP:_ty3
	jg	short @10@578
@10@530:
   ;	
   ;			{
   ;				if (map[y3+1][x3]!=0)
   ;	
	mov	ax,word ptr DGROUP:_y3
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x3
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx+38],0
	je	short @10@578
   ;	
   ;				{
   ;					y3=y3+1;
   ;	
	mov	ax,word ptr DGROUP:_y3
	inc	ax
	mov	word ptr DGROUP:_y3,ax
   ;	
   ;					break;
   ;	
	jmp	short @10@890
@10@578:
   ;	
   ;				}
   ;			}
   ;		}
   ;	
	jmp	short @10@818
@10@602:
   ;	
   ;		else 
   ;		{
   ;			if (r==2||x3>tx3)
   ;	
	cmp	si,2
	je	short @10@650
	mov	ax,word ptr DGROUP:_x3
	cmp	ax,word ptr DGROUP:_tx3
	jle	short @10@722
@10@650:
   ;	
   ;			{
   ;				if (map[y3][x3-1]!=0)
   ;	
	mov	ax,word ptr DGROUP:_y3
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x3
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx-2],0
	je	short @10@698
   ;	
   ;				{
   ;					x3=x3-1;
   ;	
	mov	ax,word ptr DGROUP:_x3
	dec	ax
	mov	word ptr DGROUP:_x3,ax
   ;	
   ;					break;
   ;	
	jmp	short @10@890
@10@698:
   ;	
   ;				}
   ;			}
   ;	
	jmp	short @10@818
@10@722:
   ;	
   ;			else if (r==2||x3<=tx3)
   ;	
	cmp	si,2
	je	short @10@770
	mov	ax,word ptr DGROUP:_x3
	cmp	ax,word ptr DGROUP:_tx3
	jg	short @10@818
@10@770:
   ;	
   ;			{
   ;				if (map[y3][x3+1]!=0)
   ;	
	mov	ax,word ptr DGROUP:_y3
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x3
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx+2],0
	je	short @10@818
   ;	
   ;				{
   ;					x3=x3+1;
   ;	
	mov	ax,word ptr DGROUP:_x3
	inc	ax
	mov	word ptr DGROUP:_x3,ax
   ;	
   ;					break;
   ;	
	jmp	short @10@890
@10@818:
   ;	
   ;				}
   ;			}
   ;		}
   ;		r++;
   ;	
	inc	si
   ;	
   ;		if(r>3)
   ;	
	cmp	si,3
	jle	short @10@866
   ;	
   ;			break;
   ;	
	jmp	short @10@890
@10@866:
	jmp	@10@290
@10@890:
   ;	
   ;		}
   ;			if(dark==0)
   ;	
	cmp	word ptr DGROUP:_dark,0
	jne	short @10@938
   ;	
   ;			update(x3,y3);
   ;	
	push	word ptr DGROUP:_y3
	push	word ptr DGROUP:_x3
	call	near ptr _update
	pop	cx
	pop	cx
@10@938:
   ;	
   ;			if (x3==x&&y3==y)
   ;	
	mov	ax,word ptr DGROUP:_x3
	cmp	ax,word ptr DGROUP:_x
	jne	short @10@1154
	mov	ax,word ptr DGROUP:_y3
	cmp	ax,word ptr DGROUP:_y
	jne	short @10@1154
   ;	
   ;			{
   ;				death++;
   ;	
	inc	word ptr DGROUP:_death
   ;	
   ;				for(k=6;k>=0;k--)
   ;	
	mov	word ptr [bp-2],6
	jmp	short @10@1058
@10@1010:
   ;	
   ;				{
   ;					sound(octave[k]);
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	shl	bx,1
	FLD	dword ptr DGROUP:_octave[bx]
	call	near ptr N_FTOL@
	push	ax
	call	near ptr _sound
	pop	cx
   ;	
   ;					delay(50);
   ;	
	mov	ax,50
	push	ax
	call	near ptr _delay
	pop	cx
	dec	word ptr [bp-2]
@10@1058:
	cmp	word ptr [bp-2],0
	jge	short @10@1010
   ;	
   ;				}
   ;				nosound();
   ;	
	call	near ptr _nosound
   ;	
   ;				delay(750);
   ;	
	mov	ax,750
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				if(death==3)
   ;	
	cmp	word ptr DGROUP:_death,3
	jne	short @10@1130
   ;	
   ;					kill();
   ;	
	call	near ptr _kill
	jmp	short @10@1154
@10@1130:
   ;	
   ;				else
   ;				{
   ;					initpos();
   ;	
	call	near ptr _initpos
   ;	
   ;					show();
   ;	
	call	near ptr _show
@10@1154:
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
_ghost3	endp
   ;	
   ;	void main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
   ;	
   ;	{
   ;		char c;
   ;		int k;
   ;		initialize();
   ;	
	call	near ptr _initialize
   ;	
   ;		initpos();
   ;	
	call	near ptr _initpos
   ;	
   ;		if (rep==0)
   ;	
	cmp	word ptr DGROUP:_rep,0
	jne	short @11@74
   ;	
   ;			start();
   ;	
	call	near ptr _start
@11@74:
   ;	
   ;		dif();
   ;	
	call	near ptr _dif
   ;	
   ;		show();
   ;	
	call	near ptr _show
   ;	
   ;		delay(500);
   ;	
	mov	ax,500
	push	ax
	call	near ptr _delay
	pop	cx
@11@98:
   ;	
   ;		while(1)
   ;		{
   ;		delay(t);
   ;	
	push	word ptr DGROUP:_t
	call	near ptr _delay
	pop	cx
	jmp	@11@506
@11@122:
   ;	
   ;		while (kbhit())
   ;		{	
   ;			c= getch();
   ;	
	call	near ptr _getch
	mov	byte ptr [bp-1],al
   ;	
   ;			if (c=='w'||c=='W')
   ;	
	cmp	byte ptr [bp-1],119
	je	short @11@170
	cmp	byte ptr [bp-1],87
	jne	short @11@194
@11@170:
   ;	
   ;			{
   ;				dir=0;			
   ;	
	mov	word ptr DGROUP:_dir,0
   ;	
   ;			}
   ;	
	jmp	short @11@506
@11@194:
   ;	
   ;			else if (c=='s'||c=='S')
   ;	
	cmp	byte ptr [bp-1],115
	je	short @11@242
	cmp	byte ptr [bp-1],83
	jne	short @11@266
@11@242:
   ;	
   ;			{
   ;				dir=1;
   ;	
	mov	word ptr DGROUP:_dir,1
   ;	
   ;			}
   ;	
	jmp	short @11@506
@11@266:
   ;	
   ;			else if (c=='a'||c=='A')
   ;	
	cmp	byte ptr [bp-1],97
	je	short @11@314
	cmp	byte ptr [bp-1],65
	jne	short @11@338
@11@314:
   ;	
   ;			{
   ;				dir=2;
   ;	
	mov	word ptr DGROUP:_dir,2
   ;	
   ;			}
   ;	
	jmp	short @11@506
@11@338:
   ;	
   ;			else if (c=='d'||c=='D')
   ;	
	cmp	byte ptr [bp-1],100
	je	short @11@386
	cmp	byte ptr [bp-1],68
	jne	short @11@410
@11@386:
   ;	
   ;			{
   ;				dir=3;
   ;	
	mov	word ptr DGROUP:_dir,3
   ;	
   ;			}
   ;	
	jmp	short @11@506
@11@410:
   ;	
   ;			else if (c==27)
   ;	
	cmp	byte ptr [bp-1],27
	jne	short @11@458
   ;	
   ;			{
   ;				sound(octave[6]*2);
   ;	
	FLD	dword ptr DGROUP:_octave+24
	FMUL	dword ptr DGROUP:s@+49
	call	near ptr N_FTOL@
	push	ax
	call	near ptr _sound
	pop	cx
   ;	
   ;				delay(15);
   ;	
	mov	ax,15
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				nosound();
   ;	
	call	near ptr _nosound
   ;	
   ;				kill();	
   ;	
	call	near ptr _kill
   ;	
   ;			}
   ;	
	jmp	short @11@506
@11@458:
   ;	
   ;			else if (c=='~')
   ;	
	cmp	byte ptr [bp-1],126
	jne	short @11@506
   ;	
   ;				score=149;
   ;	
	mov	word ptr DGROUP:_score,149
@11@506:
	call	near ptr _kbhit
	or	ax,ax
	je	@@7
	jmp	@11@122
@@7:
   ;	
   ;		}
   ;		if (dir==0)
   ;	
	cmp	word ptr DGROUP:_dir,0
	je	@@8
	jmp	@11@674
@@8:
   ;	
   ;			{
   ;				if (map[y-1][x]==1)
   ;	
	mov	ax,word ptr DGROUP:_y
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx-38],1
	jne	short @11@602
   ;	
   ;				{
   ;					y--;
   ;	
	dec	word ptr DGROUP:_y
   ;	
   ;					map[y][x]=2;
   ;	
	mov	ax,word ptr DGROUP:_y
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	mov	word ptr DGROUP:_map[bx],2
   ;	
   ;					sound(octave[6]*2);
   ;	
	FLD	dword ptr DGROUP:_octave+24
	FMUL	dword ptr DGROUP:s@+49
	call	near ptr N_FTOL@
	push	ax
	call	near ptr _sound
	pop	cx
   ;	
   ;					delay(50);
   ;	
	mov	ax,50
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;					nosound();
   ;	
	call	near ptr _nosound
   ;	
   ;					score++;
   ;	
	inc	word ptr DGROUP:_score
   ;	
   ;				}
   ;	
	jmp	short @11@650
@11@602:
   ;	
   ;				else if (map[y-1][x]==2)
   ;	
	mov	ax,word ptr DGROUP:_y
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx-38],2
	jne	short @11@650
   ;	
   ;				{
   ;					y--;
   ;	
	dec	word ptr DGROUP:_y
@11@650:
   ;	
   ;				}
   ;				st=120, end=60;
   ;	
	mov	word ptr DGROUP:_st,120
	mov	word ptr DGROUP:_end,60
   ;	
   ;			}
   ;	
	jmp	@11@1106
@11@674:
   ;	
   ;			else if (dir==1)
   ;	
	cmp	word ptr DGROUP:_dir,1
	je	@@9
	jmp	@11@818
@@9:
   ;	
   ;			{
   ;				if (map[y+1][x]==1)
   ;	
	mov	ax,word ptr DGROUP:_y
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx+38],1
	jne	short @11@746
   ;	
   ;				{
   ;					y++;
   ;	
	inc	word ptr DGROUP:_y
   ;	
   ;					map[y][x]=2;
   ;	
	mov	ax,word ptr DGROUP:_y
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	mov	word ptr DGROUP:_map[bx],2
   ;	
   ;					sound(octave[6]*2);
   ;	
	FLD	dword ptr DGROUP:_octave+24
	FMUL	dword ptr DGROUP:s@+49
	call	near ptr N_FTOL@
	push	ax
	call	near ptr _sound
	pop	cx
   ;	
   ;					delay(50);
   ;	
	mov	ax,50
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;					nosound();
   ;	
	call	near ptr _nosound
   ;	
   ;					score++;
   ;	
	inc	word ptr DGROUP:_score
   ;	
   ;				}
   ;	
	jmp	short @11@794
@11@746:
   ;	
   ;				else if (map[y+1][x]==2)
   ;	
	mov	ax,word ptr DGROUP:_y
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx+38],2
	jne	short @11@794
   ;	
   ;				{
   ;					y++;
   ;	
	inc	word ptr DGROUP:_y
@11@794:
   ;	
   ;				}
   ;				st=300, end=240;
   ;	
	mov	word ptr DGROUP:_st,300
	mov	word ptr DGROUP:_end,240
   ;	
   ;			}
   ;	
	jmp	@11@1106
@11@818:
   ;	
   ;			else if (dir==2)
   ;	
	cmp	word ptr DGROUP:_dir,2
	je	@@10
	jmp	@11@962
@@10:
   ;	
   ;			{
   ;				if (map[y][x-1]==1)
   ;	
	mov	ax,word ptr DGROUP:_y
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx-2],1
	jne	short @11@890
   ;	
   ;				{
   ;					x--;
   ;	
	dec	word ptr DGROUP:_x
   ;	
   ;					map[y][x]=2;
   ;	
	mov	ax,word ptr DGROUP:_y
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	mov	word ptr DGROUP:_map[bx],2
   ;	
   ;					sound(octave[6]*2);
   ;	
	FLD	dword ptr DGROUP:_octave+24
	FMUL	dword ptr DGROUP:s@+49
	call	near ptr N_FTOL@
	push	ax
	call	near ptr _sound
	pop	cx
   ;	
   ;					delay(50);
   ;	
	mov	ax,50
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;					nosound();
   ;	
	call	near ptr _nosound
   ;	
   ;					score++;
   ;	
	inc	word ptr DGROUP:_score
   ;	
   ;				}
   ;	
	jmp	short @11@938
@11@890:
   ;	
   ;				else if (map[y][x-1]==2)
   ;	
	mov	ax,word ptr DGROUP:_y
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx-2],2
	jne	short @11@938
   ;	
   ;				{
   ;					x--;
   ;	
	dec	word ptr DGROUP:_x
@11@938:
   ;	
   ;				}
   ;				st=210, end=150;
   ;	
	mov	word ptr DGROUP:_st,210
	mov	word ptr DGROUP:_end,150
   ;	
   ;			}
   ;	
	jmp	@11@1106
@11@962:
   ;	
   ;			else if (dir==3)
   ;	
	cmp	word ptr DGROUP:_dir,3
	je	@@11
	jmp	@11@1106
@@11:
   ;	
   ;			{
   ;				if (map[y][x+1]==1)
   ;	
	mov	ax,word ptr DGROUP:_y
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx+2],1
	jne	short @11@1034
   ;	
   ;				{
   ;					x++;
   ;	
	inc	word ptr DGROUP:_x
   ;	
   ;					map[y][x]=2;
   ;	
	mov	ax,word ptr DGROUP:_y
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	mov	word ptr DGROUP:_map[bx],2
   ;	
   ;					sound(octave[6]*2);
   ;	
	FLD	dword ptr DGROUP:_octave+24
	FMUL	dword ptr DGROUP:s@+49
	call	near ptr N_FTOL@
	push	ax
	call	near ptr _sound
	pop	cx
   ;	
   ;					delay(50);
   ;	
	mov	ax,50
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;					nosound();
   ;	
	call	near ptr _nosound
   ;	
   ;					score++;
   ;	
	inc	word ptr DGROUP:_score
   ;	
   ;				}
   ;	
	jmp	short @11@1082
@11@1034:
   ;	
   ;				else if (map[y][x+1]==2)
   ;	
	mov	ax,word ptr DGROUP:_y
	mov	dx,38
	imul	dx
	mov	dx,word ptr DGROUP:_x
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	cmp	word ptr DGROUP:_map[bx+2],2
	jne	short @11@1082
   ;	
   ;				{
   ;					x++;
   ;	
	inc	word ptr DGROUP:_x
@11@1082:
   ;	
   ;				}
   ;				st=30, end=330;
   ;	
	mov	word ptr DGROUP:_st,30
	mov	word ptr DGROUP:_end,330
@11@1106:
   ;	
   ;			}
   ;			if((x==x1&&y==y1)||(x==x2&&y==y2)||(x==x3&&y==y3))
   ;	
	mov	ax,word ptr DGROUP:_x
	cmp	ax,word ptr DGROUP:_x1
	jne	short @11@1154
	mov	ax,word ptr DGROUP:_y
	cmp	ax,word ptr DGROUP:_y1
	je	short @11@1250
@11@1154:
	mov	ax,word ptr DGROUP:_x
	cmp	ax,word ptr DGROUP:_x2
	jne	short @11@1202
	mov	ax,word ptr DGROUP:_y
	cmp	ax,word ptr DGROUP:_y2
	je	short @11@1250
@11@1202:
	mov	ax,word ptr DGROUP:_x
	cmp	ax,word ptr DGROUP:_x3
	jne	short @11@1418
	mov	ax,word ptr DGROUP:_y
	cmp	ax,word ptr DGROUP:_y3
	jne	short @11@1418
@11@1250:
   ;	
   ;			{
   ;				death++;
   ;	
	inc	word ptr DGROUP:_death
   ;	
   ;				for(k=6;k>=0;k--)
   ;	
	mov	si,6
	jmp	short @11@1322
@11@1274:
   ;	
   ;				{
   ;					sound(octave[k]);
   ;	
	mov	bx,si
	shl	bx,1
	shl	bx,1
	FLD	dword ptr DGROUP:_octave[bx]
	call	near ptr N_FTOL@
	push	ax
	call	near ptr _sound
	pop	cx
   ;	
   ;					delay(50);
   ;	
	mov	ax,50
	push	ax
	call	near ptr _delay
	pop	cx
	dec	si
@11@1322:
	or	si,si
	jge	short @11@1274
   ;	
   ;				}
   ;				nosound();
   ;	
	call	near ptr _nosound
   ;	
   ;				delay(750);
   ;	
	mov	ax,750
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				if(death==3)
   ;	
	cmp	word ptr DGROUP:_death,3
	jne	short @11@1394
   ;	
   ;					kill();
   ;	
	call	near ptr _kill
	jmp	short @11@1418
@11@1394:
   ;	
   ;				else
   ;				{
   ;					initpos();
   ;	
	call	near ptr _initpos
   ;	
   ;					show();
   ;	
	call	near ptr _show
@11@1418:
   ;	
   ;				}
   ;			}	
   ;			ghost1();
   ;	
	call	near ptr _ghost1
   ;	
   ;			ghost2();
   ;	
	call	near ptr _ghost2
   ;	
   ;			ghost3();
   ;	
	call	near ptr _ghost3
   ;	
   ;			update(x,y);
   ;	
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	near ptr _update
	pop	cx
	pop	cx
   ;	
   ;			if (score==150)
   ;	
	cmp	word ptr DGROUP:_score,150
	jne	short @11@1466
   ;	
   ;			{
   ;				delay(500);
   ;	
	mov	ax,500
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				kill();
   ;	
	call	near ptr _kill
@11@1466:
	jmp	@11@98
   ;	
   ;			}
   ;		}
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_main	endp
   ;	
   ;	void kill()
   ;	
	assume	cs:_TEXT
_kill	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;		cleardevice();
   ;	
	call	far ptr _cleardevice
   ;	
   ;		if (score==150)
   ;	
	cmp	word ptr DGROUP:_score,150
	jne	short @12@74
   ;	
   ;		{
   ;			outtextxy(maxx/2-40, maxy/2-50, "YOU WIN!");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+518
	push	ax
	mov	ax,word ptr DGROUP:_maxy
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65486
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65496
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;			outtextxy(maxx/2-180, maxy-50, "(Press Spacebar to play again, Esc to exit)");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+527
	push	ax
	mov	ax,word ptr DGROUP:_maxy
	add	ax,65486
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65356
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		}
   ;	
	jmp	@12@146
@12@74:
   ;	
   ;		else if (death==3)
   ;	
	cmp	word ptr DGROUP:_death,3
	je	@@12
	jmp	@12@122
@@12:
   ;	
   ;		{
   ;			outtextxy(maxx/2-46, maxy/2-50, "GAME OVER!");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+571
	push	ax
	mov	ax,word ptr DGROUP:_maxy
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65486
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65490
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;			outtextxy(maxx/2-190, maxy-50, "(Press Spacebar to start new game, Esc to exit)");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+582
	push	ax
	mov	ax,word ptr DGROUP:_maxy
	add	ax,65486
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65346
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;			sprintf(sc, "%d", score);
   ;	
	push	word ptr DGROUP:_score
	mov	ax,offset DGROUP:s@+630
	push	ax
	mov	ax,offset DGROUP:_sc
	push	ax
	call	near ptr _sprintf
	add	sp,6
   ;	
   ;			outtextxy(maxx/2-40, maxy/2-20,"Score: ");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+633
	push	ax
	mov	ax,word ptr DGROUP:_maxy
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65516
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65496
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;			outtextxy(maxx/2+15, maxy/2-20,sc);
   ;	
	push	ds
	mov	ax,offset DGROUP:_sc
	push	ax
	mov	ax,word ptr DGROUP:_maxy
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65516
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,15
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		}
   ;	
	jmp	@12@146
@12@122:
   ;	
   ;		else
   ;		{
   ;			outtextxy(maxx/2-46, maxy/2-50, "GAME PAUSED");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+641
	push	ax
	mov	ax,word ptr DGROUP:_maxy
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65486
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65490
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;			outtextxy(maxx/2-240, maxy-50, "(Press P to resume, Spacebar to start new game, Esc to exit)");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+653
	push	ax
	mov	ax,word ptr DGROUP:_maxy
	add	ax,65486
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65296
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;			sprintf(sc, "%d", score);
   ;	
	push	word ptr DGROUP:_score
	mov	ax,offset DGROUP:s@+714
	push	ax
	mov	ax,offset DGROUP:_sc
	push	ax
	call	near ptr _sprintf
	add	sp,6
   ;	
   ;			outtextxy(maxx/2-40, maxy/2-20,"Score: ");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+717
	push	ax
	mov	ax,word ptr DGROUP:_maxy
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65516
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65496
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;			outtextxy(maxx/2+15, maxy/2-20,sc);
   ;	
	push	ds
	mov	ax,offset DGROUP:_sc
	push	ax
	mov	ax,word ptr DGROUP:_maxy
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65516
	push	ax
	mov	ax,word ptr DGROUP:_maxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,15
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@12@146:
   ;	
   ;		}
   ;		delay(750);
   ;	
	mov	ax,750
	push	ax
	call	near ptr _delay
	pop	cx
@12@170:
   ;	
   ;		while(1)
   ;		{	ch=getch();
   ;	
	call	near ptr _getch
	mov	byte ptr DGROUP:_ch,al
   ;	
   ;			if (ch==' ')
   ;	
	cmp	byte ptr DGROUP:_ch,32
	jne	short @12@218
   ;	
   ;			{
   ;				rep=1;
   ;	
	mov	word ptr DGROUP:_rep,1
   ;	
   ;				main();
   ;	
	call	near ptr _main
   ;	
   ;			}
   ;	
	jmp	short @12@338
@12@218:
   ;	
   ;			else if (ch==27)
   ;	
	cmp	byte ptr DGROUP:_ch,27
	jne	short @12@266
   ;	
   ;			{
   ;				clrscr();
   ;	
	call	near ptr _clrscr
   ;	
   ;				exit(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _exit
	pop	cx
   ;	
   ;			}
   ;	
	jmp	short @12@338
@12@266:
   ;	
   ;			else if (ch=='p'||ch=='P')
   ;	
	cmp	byte ptr DGROUP:_ch,112
	je	short @12@314
	cmp	byte ptr DGROUP:_ch,80
	jne	short @12@338
@12@314:
   ;	
   ;			{
   ;				show();
   ;	
	call	near ptr _show
   ;	
   ;				break;
   ;	
	jmp	short @12@362
@12@338:
	jmp	short @12@170
@12@362:
   ;	
   ;			}
   ;		}
   ;	}
   ;	
	pop	bp
	ret	
_kill	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_score	label	word
	db	2 dup (?)
_tx2	label	word
	db	2 dup (?)
_tx3	label	word
	db	2 dup (?)
_gm	label	word
	db	2 dup (?)
_map	label	word
	db	760 dup (?)
_ty2	label	word
	db	2 dup (?)
_ty3	label	word
	db	2 dup (?)
_maxx	label	word
	db	2 dup (?)
_maxy	label	word
	db	2 dup (?)
_death	label	word
	db	2 dup (?)
_gridx	label	word
	db	2 dup (?)
_gridy	label	word
	db	2 dup (?)
_offset	label	dword
	db	4 dup (?)
_r3	label	word
	db	2 dup (?)
_sc	label	byte
	db	10 dup (?)
_ch	label	byte
	db	1 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'C:\TURBOC3\BGI'
	db	0
	db	'PacMan'
	db	0
	db	'Press any key to start'
	db	0
	db	0
	db	0
	db	-128
	db	'@'
	db	0
	db	0
	db	0
	db	'@INSTRUCTIONS'
	db	0
	db	'Your aim is to eat all the pellets'
	db	0
	db	'But be careful! You must avoid'
	db	0
	db	'the ghosts trying to catch you!'
	db	0
	db	'Use WASD to change directions'
	db	0
	db	'Modified by CM first batch boys'
	db	0
	db	'Press any key to continue'
	db	0
	db	'LEVEL THE WAY YOU WANT'
	db	0
	db	'Choose the speed at which the game progresses'
	db	0
	db	'[S] Slow'
	db	0
	db	'[M] Medium'
	db	0
	db	'[F] Fast'
	db	0
	db	'[X] Xtreme'
	db	0
	db	'Current: Slow'
	db	0
	db	'Current: Medium'
	db	0
	db	'Current: Fast'
	db	0
	db	'The Xtreme Limited Edition'
	db	0
	db	'Press Spacebar to continue'
	db	0
	db	9
	db	9
	db	9
	db	9
	db	'Press Esc to Pause'
	db	9
	db	9
	db	'Lives left: %2d'
	db	0
	db	'%d'
	db	0
	db	0
	db	0
	db	-16
	db	'BScore: '
	db	0
	db	0
	db	0
	db	'pBYOU WIN!'
	db	0
	db	'(Press Spacebar to play again, Esc to exit)'
	db	0
	db	'GAME OVER!'
	db	0
	db	'(Press Spacebar to start new game, Esc to exit)'
	db	0
	db	'%d'
	db	0
	db	'Score: '
	db	0
	db	'GAME PAUSED'
	db	0
	db	'(Press P to resume, Spacebar to start new game, Esc to exit)'
	db	0
	db	'%d'
	db	0
	db	'Score: '
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	extrn	__turboFloat:word
	public	_ch
	extrn	_setfillstyle:far
	extrn	_setviewport:far
	public	_y3
	public	_x3
	public	_initpos
	extrn	_printf:near
	public	_sc
	public	_r3
	extrn	_outtextxy:far
	extrn	_getbkcolor:far
	extrn	_clearviewport:far
	public	_offset
	extrn	_kbhit:near
	extrn	_setcolor:far
	extrn	_getmaxy:far
	extrn	_getmaxx:far
	public	_gridy
	public	_gridx
	public	_y2
	public	_x2
	public	_end
	extrn	_pieslice:far
	extrn	_sector:far
	public	_death
	extrn	_circle:far
	extrn	_cleardevice:far
	public	_maxy
	public	_maxx
	extrn	_floodfill:far
	public	_ty3
	public	_ty2
	public	_dark
	extrn	_rand:near
	extrn	_sprintf:near
	public	_kill
	public	_y1
	extrn	_getch:near
	public	_x1
	public	_main
	extrn	_delay:near
	extrn	_ceil:near
	public	_update
	public	_ghost3
	public	_ghost2
	public	_ghost1
	public	_dif
	public	_dir
	public	_rep
	public	_start
	public	_map
	extrn	_bar:far
	public	_gm
	extrn	N_SCOPY@:far
	extrn	_clrscr:near
	public	_tx3
	public	_tx2
	public	_show
	public	_slice
	extrn	N_LDIV@:far
	public	_initialize
	extrn	N_LXMUL@:far
	extrn	_exit:near
	public	_octave
	extrn	_nosound:near
	public	_st
	public	_y
	public	_x
	public	_t
	extrn	N_FTOL@:far
	public	_score
	extrn	_initgraph:far
	extrn	_sound:near
	public	_gd
	end
