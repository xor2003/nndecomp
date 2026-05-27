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
	?debug	S "c:\2048.cpp"
	?debug	C E92C52FE7C0B633A5C323034382E637070
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
	?debug	C E95337528110443A5C494E434C5544455C6D656D2E68
	?debug	C E95337528115443A5C494E434C5544455C67726170686963732E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528114443A5C494E434C5544455C70726F636573732E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
	?debug	C E95337528111443A5C494E434C5544455C74696D652E68
	?debug	C E95337528110443A5C494E434C5544455C646F732E68
	?debug	C E95337528113443A5C494E434C5544455C737472696E672E68
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
_z	label	word
	db	0
	db	0
_DATA	ends
_BSS	segment word public 'BSS'
_BSS	ends
_DATA	segment word public 'DATA'
_score	label	word
	db	0
	db	0
_DATA	ends
_BSS	segment word public 'BSS'
_tmp	label	word
	db	2 dup (?)
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void showusertip(void)
   ;	
	assume	cs:_TEXT
@showusertip$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
   ;	
   ;	{ char str[10];
   ;	settextstyle(1,0,1);
   ;	
	mov	ax,1
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;	outtextxy(40,getmaxy()-60,"Use W S A D keys to move the tiles, <SPACE> to Quit." );
   ;	
	push	ds
	mov	ax,offset DGROUP:s@
	push	ax
	call	far ptr _getmaxy
	add	ax,65476
	push	ax
	mov	ax,40
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;	outtextxy(0,getmaxy()-40,"When two tiles with the same number touch, they merge into one!");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+53
	push	ax
	call	far ptr _getmaxy
	add	ax,65496
	push	ax
	xor	ax,ax
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;	itoa(score,str,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-10]
	push	ax
	push	word ptr DGROUP:_score
	call	near ptr _itoa
	add	sp,6
   ;	
   ;	tmp=score;
   ;	
	mov	ax,word ptr DGROUP:_score
	mov	word ptr DGROUP:_tmp,ax
   ;	
   ;	settextstyle(1,0,4);
   ;	
	mov	ax,4
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;	outtextxy(getmaxx()-150,30,"SCORE");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+117
	push	ax
	mov	ax,30
	push	ax
	call	far ptr _getmaxx
	add	ax,65386
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;	settextstyle(9,0,4);
   ;	
	mov	ax,4
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,9
	push	ax
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;	outtextxy(getmaxx()-120-15*(strlen(str)-1),80,str);
   ;	
	push	ds
	lea	ax,word ptr [bp-10]
	push	ax
	mov	ax,80
	push	ax
	call	far ptr _getmaxx
	add	ax,65416
	push	ax
	lea	ax,word ptr [bp-10]
	push	ax
	call	near ptr _strlen
	pop	cx
	dec	ax
	mov	dx,15
	imul	dx
	pop	dx
	sub	dx,ax
	push	dx
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
@showusertip$qv	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_mat	label	word
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
_TEXT	ends
_DATA	segment word public 'DATA'
_x1	label	word
	db	30
	db	0
	db	120
	db	0
	db	210
	db	0
	db	44
	db	1
	db	30
	db	0
	db	120
	db	0
	db	210
	db	0
	db	44
	db	1
	db	30
	db	0
	db	120
	db	0
	db	210
	db	0
	db	44
	db	1
	db	30
	db	0
	db	120
	db	0
	db	210
	db	0
	db	44
	db	1
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_DATA	segment word public 'DATA'
_y1	label	word
	db	30
	db	0
	db	30
	db	0
	db	30
	db	0
	db	30
	db	0
	db	120
	db	0
	db	120
	db	0
	db	120
	db	0
	db	120
	db	0
	db	210
	db	0
	db	210
	db	0
	db	210
	db	0
	db	210
	db	0
	db	44
	db	1
	db	44
	db	1
	db	44
	db	1
	db	44
	db	1
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_DATA	segment word public 'DATA'
_x2	label	word
	db	110
	db	0
	db	200
	db	0
	db	34
	db	1
	db	124
	db	1
	db	110
	db	0
	db	200
	db	0
	db	34
	db	1
	db	124
	db	1
	db	110
	db	0
	db	200
	db	0
	db	34
	db	1
	db	124
	db	1
	db	110
	db	0
	db	200
	db	0
	db	34
	db	1
	db	124
	db	1
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_DATA	segment word public 'DATA'
_y2	label	word
	db	110
	db	0
	db	110
	db	0
	db	110
	db	0
	db	110
	db	0
	db	200
	db	0
	db	200
	db	0
	db	200
	db	0
	db	200
	db	0
	db	34
	db	1
	db	34
	db	1
	db	34
	db	1
	db	34
	db	1
	db	124
	db	1
	db	124
	db	1
	db	124
	db	1
	db	124
	db	1
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void rendermat(int mat[][4])                 // seedmatrix rendering function
   ;	
	assume	cs:_TEXT
@rendermat$qpa4$i	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	di
   ;	
   ;	{ char str[4];
   ;	  z=0;
   ;	
	mov	word ptr DGROUP:_z,0
   ;	
   ;	  for(int i=0;i<4;i++)
   ;	
	mov	word ptr [bp-6],0
	jmp	@2@362
@2@50:
   ;	
   ;	  for(int j=0;j<4;j++)
   ;	
	xor	si,si
	jmp	@2@314
@2@74:
   ;	
   ;		{ if(mat[i][j])
   ;	
	mov	ax,word ptr [bp-6]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	cmp	word ptr [bx],0
	jne	@@0
	jmp	@2@266
@@0:
   ;	
   ;		{z++;
   ;	
	inc	word ptr DGROUP:_z
   ;	
   ;		rectangle(x1[i][j],y1[i][j],x2[i][j],y2[i][j]);
   ;	
	mov	ax,word ptr [bp-6]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,offset DGROUP:_y2
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	word ptr [bx]
	mov	ax,word ptr [bp-6]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,offset DGROUP:_x2
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	word ptr [bx]
	mov	ax,word ptr [bp-6]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,offset DGROUP:_y1
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	word ptr [bx]
	mov	ax,word ptr [bp-6]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,offset DGROUP:_x1
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	word ptr [bx]
	call	far ptr _rectangle
	add	sp,8
   ;	
   ;		itoa(mat[i][j],str,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-4]
	push	ax
	mov	ax,word ptr [bp-6]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	word ptr [bx]
	call	near ptr _itoa
	add	sp,6
   ;	
   ;		int clr;
   ;		for(clr=1;pow(2,clr)<=mat[i][j];clr++){}
   ;	
	mov	di,1
	jmp	short @2@170
@2@146:
	inc	di
@2@170:
	mov	word ptr [bp-8],di
	FILD	word ptr [bp-8]
	add	sp,65528
	FSTP	qword ptr [bp-20]
	FLD	dword ptr DGROUP:s@+123
	add	sp,65528
	FSTP	qword ptr [bp-28]
	FWAIT	
	call	near ptr _pow
	add	sp,16
	mov	ax,word ptr [bp-6]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-8],ax
	FILD	word ptr [bp-8]
	FCOMPP
	FSTSW	word ptr [bp-8]
	FWAIT	
	mov	ax,word ptr [bp-8]
	sahf	
	jae	short @2@146
   ;	
   ;		if(clr>=15) {clr=clr%15;clr+=3;}
   ;	
	cmp	di,15
	jl	short @2@242
	mov	ax,di
	mov	bx,15
	cwd	
	idiv	bx
	mov	di,dx
	add	di,3
@2@242:
   ;	
   ;		setfillstyle(1,clr);
   ;	
	push	di
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;		floodfill(x1[i][j]+15,y1[i][j]+15,15);
   ;	
	mov	ax,15
	push	ax
	mov	ax,word ptr [bp-6]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,offset DGROUP:_y1
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	mov	ax,word ptr [bx]
	add	ax,15
	push	ax
	mov	ax,word ptr [bp-6]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,offset DGROUP:_x1
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	mov	ax,word ptr [bx]
	add	ax,15
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		settextstyle(8,0,6-strlen(str));
   ;	
	lea	ax,word ptr [bp-4]
	push	ax
	call	near ptr _strlen
	pop	cx
	mov	dx,6
	sub	dx,ax
	push	dx
	xor	ax,ax
	push	ax
	mov	ax,8
	push	ax
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;		outtextxy(x1[i][j]+10*(4-strlen(str)),y1[i][j]+strlen(str)*8,str);}
   ;	
	push	ds
	lea	ax,word ptr [bp-4]
	push	ax
	lea	ax,word ptr [bp-4]
	push	ax
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	dx,word ptr [bp-6]
	shl	dx,1
	shl	dx,1
	shl	dx,1
	mov	bx,offset DGROUP:_y1
	add	bx,dx
	mov	dx,si
	shl	dx,1
	add	bx,dx
	mov	dx,word ptr [bx]
	add	dx,ax
	push	dx
	lea	ax,word ptr [bp-4]
	push	ax
	call	near ptr _strlen
	pop	cx
	push	ax
	mov	ax,4
	pop	dx
	sub	ax,dx
	mov	dx,10
	imul	dx
	mov	dx,word ptr [bp-6]
	shl	dx,1
	shl	dx,1
	shl	dx,1
	mov	bx,offset DGROUP:_x1
	add	bx,dx
	mov	dx,si
	shl	dx,1
	add	bx,dx
	mov	dx,word ptr [bx]
	add	dx,ax
	push	dx
	call	far ptr _outtextxy
	add	sp,8
@2@266:
   ;	
   ;		rectangle(15,15,395,395);
   ;	
	mov	ax,395
	push	ax
	mov	ax,395
	push	ax
	mov	ax,15
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _rectangle
	add	sp,8
	inc	si
@2@314:
	cmp	si,4
	jge	@@1
	jmp	@2@74
@@1:
	inc	word ptr [bp-6]
@2@362:
	cmp	word ptr [bp-6],4
	jge	@@2
	jmp	@2@50
@@2:
   ;	
   ;		}
   ;		showusertip();
   ;	
	call	near ptr @showusertip$qv
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@rendermat$qpa4$i	endp
   ;	
   ;	void rendermatnotip(int mat[][4])
   ;	
	assume	cs:_TEXT
@rendermatnotip$qpa4$i	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
   ;	
   ;	{
   ;	  char str[4];
   ;	  z=0;
   ;	
	mov	word ptr DGROUP:_z,0
   ;	
   ;	  for(int i=0;i<4;i++)
   ;	
	xor	di,di
	jmp	@3@218
@3@50:
   ;	
   ;	  for(int j=0;j<4;j++)
   ;	
	xor	si,si
	jmp	@3@170
@3@74:
   ;	
   ;		{ if(mat[i][j])
   ;	
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	cmp	word ptr [bx],0
	jne	@@3
	jmp	@3@122
@@3:
   ;	
   ;		{z++;
   ;	
	inc	word ptr DGROUP:_z
   ;	
   ;		rectangle(x1[i][j],y1[i][j],x2[i][j],y2[i][j]);
   ;	
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,offset DGROUP:_y2
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	word ptr [bx]
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,offset DGROUP:_x2
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	word ptr [bx]
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,offset DGROUP:_y1
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	word ptr [bx]
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,offset DGROUP:_x1
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	word ptr [bx]
	call	far ptr _rectangle
	add	sp,8
   ;	
   ;		itoa(mat[i][j],str,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-4]
	push	ax
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	word ptr [bx]
	call	near ptr _itoa
	add	sp,6
   ;	
   ;		settextstyle(8,0,6-strlen(str));
   ;	
	lea	ax,word ptr [bp-4]
	push	ax
	call	near ptr _strlen
	pop	cx
	mov	dx,6
	sub	dx,ax
	push	dx
	xor	ax,ax
	push	ax
	mov	ax,8
	push	ax
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;		outtextxy(x1[i][j]+10*(4-strlen(str)),y1[i][j]+strlen(str)*8,str);}
   ;	
	push	ds
	lea	ax,word ptr [bp-4]
	push	ax
	lea	ax,word ptr [bp-4]
	push	ax
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	dx,di
	shl	dx,1
	shl	dx,1
	shl	dx,1
	mov	bx,offset DGROUP:_y1
	add	bx,dx
	mov	dx,si
	shl	dx,1
	add	bx,dx
	mov	dx,word ptr [bx]
	add	dx,ax
	push	dx
	lea	ax,word ptr [bp-4]
	push	ax
	call	near ptr _strlen
	pop	cx
	push	ax
	mov	ax,4
	pop	dx
	sub	ax,dx
	mov	dx,10
	imul	dx
	mov	dx,di
	shl	dx,1
	shl	dx,1
	shl	dx,1
	mov	bx,offset DGROUP:_x1
	add	bx,dx
	mov	dx,si
	shl	dx,1
	add	bx,dx
	mov	dx,word ptr [bx]
	add	dx,ax
	push	dx
	call	far ptr _outtextxy
	add	sp,8
@3@122:
   ;	
   ;		rectangle(15,15,395,395);
   ;	
	mov	ax,395
	push	ax
	mov	ax,395
	push	ax
	mov	ax,15
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _rectangle
	add	sp,8
	inc	si
@3@170:
	cmp	si,4
	jge	@@4
	jmp	@3@74
@@4:
	inc	di
@3@218:
	cmp	di,4
	jge	@@5
	jmp	@3@50
@@5:
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@rendermatnotip$qpa4$i	endp
   ;	
   ;	void pullrandom(int a[][4])
   ;	
	assume	cs:_TEXT
@pullrandom$qpa4$i	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
   ;	
   ;	{
   ;	int l = rand()%4;int m = rand()%4;
   ;	
	call	near ptr _rand
	mov	bx,4
	cwd	
	idiv	bx
	mov	di,dx
	call	near ptr _rand
	mov	bx,4
	cwd	
	idiv	bx
	mov	si,dx
	jmp	short @4@74
@4@50:
   ;	
   ;	while(a[l][m])
   ;	{l=rand()%4;m=rand()%4;
   ;	
	call	near ptr _rand
	mov	bx,4
	cwd	
	idiv	bx
	mov	di,dx
	call	near ptr _rand
	mov	bx,4
	cwd	
	idiv	bx
	mov	si,dx
@4@74:
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	cmp	word ptr [bx],0
	jne	short @4@50
   ;	
   ;	}
   ;	a[l][m] = (rand() % 2 + 1) * 2;
   ;	
	call	near ptr _rand
	mov	bx,2
	cwd	
	idiv	bx
	inc	dx
	shl	dx,1
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	mov	word ptr [bx],dx
   ;	
   ;	char str[4];
   ;	delay(150);
   ;	
	mov	ax,150
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	  rendermat(mat);
   ;	
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @rendermat$qpa4$i
	pop	cx
   ;	
   ;	  rectangle(x1[l][m],y1[l][m],x2[l][m],y2[l][m]);
   ;	
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,offset DGROUP:_y2
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	word ptr [bx]
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,offset DGROUP:_x2
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	word ptr [bx]
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,offset DGROUP:_y1
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	word ptr [bx]
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,offset DGROUP:_x1
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	word ptr [bx]
	call	far ptr _rectangle
	add	sp,8
   ;	
   ;	  itoa(a[l][m],str,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-4]
	push	ax
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	word ptr [bx]
	call	near ptr _itoa
	add	sp,6
   ;	
   ;	  settextstyle(8,0,6-strlen(str));
   ;	
	lea	ax,word ptr [bp-4]
	push	ax
	call	near ptr _strlen
	pop	cx
	mov	dx,6
	sub	dx,ax
	push	dx
	xor	ax,ax
	push	ax
	mov	ax,8
	push	ax
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;	  outtextxy(x1[l][m]+10*(4-strlen(str)),y1[l][m]+strlen(str)*8,str);
   ;	
	push	ds
	lea	ax,word ptr [bp-4]
	push	ax
	lea	ax,word ptr [bp-4]
	push	ax
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	dx,di
	shl	dx,1
	shl	dx,1
	shl	dx,1
	mov	bx,offset DGROUP:_y1
	add	bx,dx
	mov	dx,si
	shl	dx,1
	add	bx,dx
	mov	dx,word ptr [bx]
	add	dx,ax
	push	dx
	lea	ax,word ptr [bp-4]
	push	ax
	call	near ptr _strlen
	pop	cx
	push	ax
	mov	ax,4
	pop	dx
	sub	ax,dx
	mov	dx,10
	imul	dx
	mov	dx,di
	shl	dx,1
	shl	dx,1
	shl	dx,1
	mov	bx,offset DGROUP:_x1
	add	bx,dx
	mov	dx,si
	shl	dx,1
	add	bx,dx
	mov	dx,word ptr [bx]
	add	dx,ax
	push	dx
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;	  rectangle(15,15,395,395);
   ;	
	mov	ax,395
	push	ax
	mov	ax,395
	push	ax
	mov	ax,15
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _rectangle
	add	sp,8
   ;	
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@pullrandom$qpa4$i	endp
_TEXT	ends
_DATA	segment word public 'DATA'
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
   ;	int upmat(int a[][4])
   ;	
	assume	cs:_TEXT
@upmat$qpa4$i	proc	near
	push	bp
	mov	bp,sp
	sub	sp,12
	push	si
	push	di
   ;	
   ;	{ int check=0;
   ;	
	mov	word ptr [bp-2],0
   ;	
   ;	 for(int j=0;j<4;j++)
   ;	
	mov	word ptr [bp-4],0
	jmp	@5@602
@5@50:
   ;	
   ;	 {
   ;	 int l=0,b[4]={0,0,0,0};
   ;	
	xor	di,di
	lea	ax,word ptr [bp-12]
	push	ss
	push	ax
	mov	ax,offset DGROUP:d@w+164
	push	ds
	push	ax
	mov	cx,8
	call	near ptr N_SCOPY@
   ;	
   ;	  for(int i=0;i<4;i++)
   ;	
	xor	si,si
	jmp	short @5@146
@5@74:
   ;	
   ;	  {
   ;	   if(a[i][j]!=0){b[l]=a[i][j];l++;}
   ;	
	mov	ax,si
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,word ptr [bp-4]
	shl	ax,1
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @5@122
	mov	ax,si
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,word ptr [bp-4]
	shl	ax,1
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,di
	shl	dx,1
	lea	bx,word ptr [bp-12]
	add	bx,dx
	mov	word ptr [bx],ax
	inc	di
@5@122:
	inc	si
@5@146:
	cmp	si,4
	jl	short @5@74
   ;	
   ;	  }
   ;	  for(i=0;i<4;i++)
   ;	
	xor	si,si
	jmp	short @5@266
@5@194:
   ;	
   ;	  if(b[i]!=a[i][j]) {check=1;}
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,si
	shl	dx,1
	shl	dx,1
	shl	dx,1
	mov	bx,word ptr [bp+4]
	add	bx,dx
	mov	dx,word ptr [bp-4]
	shl	dx,1
	add	bx,dx
	cmp	ax,word ptr [bx]
	je	short @5@242
	mov	word ptr [bp-2],1
@5@242:
	inc	si
@5@266:
	cmp	si,4
	jl	short @5@194
   ;	
   ;	
   ;	  for(i=0;i<3;i++)
   ;	
	xor	si,si
	jmp	@5@434
@5@314:
   ;	
   ;	  if(b[i]==b[i+1] && b[i]!=0 && b[i+1]!=0) {b[i]=2*b[i];score=score+b[i];b[i+1]=0;check=1;}
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,si
	inc	dx
	shl	dx,1
	lea	bx,word ptr [bp-12]
	add	bx,dx
	cmp	ax,word ptr [bx]
	jne	short @5@410
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @5@410
	mov	ax,si
	inc	ax
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @5@410
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr [bx]
	shl	ax,1
	mov	dx,si
	shl	dx,1
	lea	bx,word ptr [bp-12]
	add	bx,dx
	mov	word ptr [bx],ax
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr DGROUP:_score
	add	ax,word ptr [bx]
	mov	word ptr DGROUP:_score,ax
	mov	ax,si
	inc	ax
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	word ptr [bx],0
	mov	word ptr [bp-2],1
@5@410:
	inc	si
@5@434:
	cmp	si,3
	jge	@@6
	jmp	@5@314
@@6:
   ;	
   ;		  l=0;
   ;	
	xor	di,di
   ;	
   ;	  a[0][j]=0;a[1][j]=0;a[2][j]=0;a[3][j]=0;
   ;	
	mov	ax,word ptr [bp-4]
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	word ptr [bx],0
	mov	ax,word ptr [bp-4]
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,8
	add	bx,ax
	mov	word ptr [bx],0
	mov	ax,word ptr [bp-4]
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,16
	add	bx,ax
	mov	word ptr [bx],0
	mov	ax,word ptr [bp-4]
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,24
	add	bx,ax
	mov	word ptr [bx],0
   ;	
   ;	  for(i=0;i<4;i++)
   ;	
	xor	si,si
	jmp	short @5@554
@5@482:
   ;	
   ;	  {
   ;	  if(b[i]!=0) {a[l][j]=b[i];l++;}
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @5@530
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,di
	shl	dx,1
	shl	dx,1
	shl	dx,1
	mov	bx,word ptr [bp+4]
	add	bx,dx
	mov	dx,word ptr [bp-4]
	shl	dx,1
	add	bx,dx
	mov	word ptr [bx],ax
	inc	di
@5@530:
	inc	si
@5@554:
	cmp	si,4
	jl	short @5@482
	inc	word ptr [bp-4]
@5@602:
	cmp	word ptr [bp-4],4
	jge	@@7
	jmp	@5@50
@@7:
   ;	
   ;	  }
   ;	 }
   ;	return check;
   ;	
	mov	ax,word ptr [bp-2]
	jmp	short @5@650
@5@650:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@upmat$qpa4$i	endp
_TEXT	ends
_DATA	segment word public 'DATA'
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
   ;	int downmat(int a[][4])
   ;	
	assume	cs:_TEXT
@downmat$qpa4$i	proc	near
	push	bp
	mov	bp,sp
	sub	sp,12
	push	si
	push	di
   ;	
   ;	
   ;	{  int check=0;
   ;	
	mov	word ptr [bp-2],0
   ;	
   ;	for(int j=0;j<4;j++)
   ;	
	mov	word ptr [bp-4],0
	jmp	@6@602
@6@50:
   ;	
   ;	{
   ;		int l=3;int b[4]={0,0,0,0};
   ;	
	mov	di,3
	lea	ax,word ptr [bp-12]
	push	ss
	push	ax
	mov	ax,offset DGROUP:d@w+172
	push	ds
	push	ax
	mov	cx,8
	call	near ptr N_SCOPY@
   ;	
   ;		for(int i=3;i>=0;i--)
   ;	
	mov	si,3
	jmp	short @6@146
@6@74:
   ;	
   ;		{
   ;		if(a[i][j]!=0) {b[l]=a[i][j];l--;}
   ;	
	mov	ax,si
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,word ptr [bp-4]
	shl	ax,1
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @6@122
	mov	ax,si
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,word ptr [bp-4]
	shl	ax,1
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,di
	shl	dx,1
	lea	bx,word ptr [bp-12]
	add	bx,dx
	mov	word ptr [bx],ax
	dec	di
@6@122:
	dec	si
@6@146:
	or	si,si
	jge	short @6@74
   ;	
   ;		}
   ;	
   ;		 for(i=3;i>=0;i--)
   ;	
	mov	si,3
	jmp	short @6@266
@6@194:
   ;	
   ;	  if(b[i]!=a[i][j]) {check=1;}
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,si
	shl	dx,1
	shl	dx,1
	shl	dx,1
	mov	bx,word ptr [bp+4]
	add	bx,dx
	mov	dx,word ptr [bp-4]
	shl	dx,1
	add	bx,dx
	cmp	ax,word ptr [bx]
	je	short @6@242
	mov	word ptr [bp-2],1
@6@242:
	dec	si
@6@266:
	or	si,si
	jge	short @6@194
   ;	
   ;	
   ;		for(i=3;i>=0;i--)
   ;	
	mov	si,3
	jmp	@6@434
@6@314:
   ;	
   ;		 if(b[i]==b[i-1] && b[i]!=0 && b[i-1]!=0) {b[i]=2*b[i];score=score+b[i];b[i-1]=0;check=1;}
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,si
	dec	dx
	shl	dx,1
	lea	bx,word ptr [bp-12]
	add	bx,dx
	cmp	ax,word ptr [bx]
	jne	short @6@410
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @6@410
	mov	ax,si
	dec	ax
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @6@410
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr [bx]
	shl	ax,1
	mov	dx,si
	shl	dx,1
	lea	bx,word ptr [bp-12]
	add	bx,dx
	mov	word ptr [bx],ax
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr DGROUP:_score
	add	ax,word ptr [bx]
	mov	word ptr DGROUP:_score,ax
	mov	ax,si
	dec	ax
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	word ptr [bx],0
	mov	word ptr [bp-2],1
@6@410:
	dec	si
@6@434:
	or	si,si
	jl	@@8
	jmp	@6@314
@@8:
   ;	
   ;	
   ;		l=3;
   ;	
	mov	di,3
   ;	
   ;		a[0][j]=0;a[1][j]=0;a[2][j]=0;a[3][j]=0;
   ;	
	mov	ax,word ptr [bp-4]
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	word ptr [bx],0
	mov	ax,word ptr [bp-4]
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,8
	add	bx,ax
	mov	word ptr [bx],0
	mov	ax,word ptr [bp-4]
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,16
	add	bx,ax
	mov	word ptr [bx],0
	mov	ax,word ptr [bp-4]
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,24
	add	bx,ax
	mov	word ptr [bx],0
   ;	
   ;		for(i=3;i>=0;i--)
   ;	
	mov	si,3
	jmp	short @6@554
@6@482:
   ;	
   ;		{
   ;			if(b[i]!=0){a[l][j]=b[i];l--;}
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @6@530
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,di
	shl	dx,1
	shl	dx,1
	shl	dx,1
	mov	bx,word ptr [bp+4]
	add	bx,dx
	mov	dx,word ptr [bp-4]
	shl	dx,1
	add	bx,dx
	mov	word ptr [bx],ax
	dec	di
@6@530:
	dec	si
@6@554:
	or	si,si
	jge	short @6@482
	inc	word ptr [bp-4]
@6@602:
	cmp	word ptr [bp-4],4
	jge	@@9
	jmp	@6@50
@@9:
   ;	
   ;		}
   ;	
   ;		}
   ;	 return check;
   ;	
	mov	ax,word ptr [bp-2]
	jmp	short @6@650
@6@650:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@downmat$qpa4$i	endp
_TEXT	ends
_DATA	segment word public 'DATA'
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
   ;	int leftmat(int a[][4])
   ;	
	assume	cs:_TEXT
@leftmat$qpa4$i	proc	near
	push	bp
	mov	bp,sp
	sub	sp,12
	push	si
	push	di
   ;	
   ;	{  int check=0;
   ;	
	mov	word ptr [bp-2],0
   ;	
   ;	    for(int j=0;j<4;j++)
   ;	
	mov	word ptr [bp-4],0
	jmp	@7@602
@7@50:
   ;	
   ;	 {
   ;	 int l=0,b[4]={0,0,0,0};
   ;	
	xor	di,di
	lea	ax,word ptr [bp-12]
	push	ss
	push	ax
	mov	ax,offset DGROUP:d@w+180
	push	ds
	push	ax
	mov	cx,8
	call	near ptr N_SCOPY@
   ;	
   ;	  for(int i=0;i<4;i++)
   ;	
	xor	si,si
	jmp	short @7@146
@7@74:
   ;	
   ;	  {
   ;	   if(a[j][i]!=0){b[l]=a[j][i];l++;}
   ;	
	mov	ax,word ptr [bp-4]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @7@122
	mov	ax,word ptr [bp-4]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,di
	shl	dx,1
	lea	bx,word ptr [bp-12]
	add	bx,dx
	mov	word ptr [bx],ax
	inc	di
@7@122:
	inc	si
@7@146:
	cmp	si,4
	jl	short @7@74
   ;	
   ;	  }
   ;	
   ;	   for(i=0;i<4;i++)
   ;	
	xor	si,si
	jmp	short @7@266
@7@194:
   ;	
   ;	  if(b[i]!=a[j][i]) {check=1;}
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,word ptr [bp-4]
	shl	dx,1
	shl	dx,1
	shl	dx,1
	mov	bx,word ptr [bp+4]
	add	bx,dx
	mov	dx,si
	shl	dx,1
	add	bx,dx
	cmp	ax,word ptr [bx]
	je	short @7@242
	mov	word ptr [bp-2],1
@7@242:
	inc	si
@7@266:
	cmp	si,4
	jl	short @7@194
   ;	
   ;	
   ;	  for(i=0;i<3;i++)
   ;	
	xor	si,si
	jmp	@7@434
@7@314:
   ;	
   ;	  if(b[i]==b[i+1] && b[i]!=0 && b[i+1]!=0) {b[i]=2*b[i];score=score+b[i];b[i+1]=0;check=1;}
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,si
	inc	dx
	shl	dx,1
	lea	bx,word ptr [bp-12]
	add	bx,dx
	cmp	ax,word ptr [bx]
	jne	short @7@410
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @7@410
	mov	ax,si
	inc	ax
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @7@410
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr [bx]
	shl	ax,1
	mov	dx,si
	shl	dx,1
	lea	bx,word ptr [bp-12]
	add	bx,dx
	mov	word ptr [bx],ax
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr DGROUP:_score
	add	ax,word ptr [bx]
	mov	word ptr DGROUP:_score,ax
	mov	ax,si
	inc	ax
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	word ptr [bx],0
	mov	word ptr [bp-2],1
@7@410:
	inc	si
@7@434:
	cmp	si,3
	jge	@@10
	jmp	@7@314
@@10:
   ;	
   ;		  l=0;
   ;	
	xor	di,di
   ;	
   ;	  a[j][0]=0;a[j][1]=0;a[j][2]=0;a[j][3]=0;
   ;	
	mov	ax,word ptr [bp-4]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	word ptr [bx],0
	mov	ax,word ptr [bp-4]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	word ptr [bx+2],0
	mov	ax,word ptr [bp-4]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	word ptr [bx+4],0
	mov	ax,word ptr [bp-4]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	word ptr [bx+6],0
   ;	
   ;	  for(i=0;i<4;i++)
   ;	
	xor	si,si
	jmp	short @7@554
@7@482:
   ;	
   ;	  {
   ;	  if(b[i]!=0) {a[j][l]=b[i];l++;}
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @7@530
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,word ptr [bp-4]
	shl	dx,1
	shl	dx,1
	shl	dx,1
	mov	bx,word ptr [bp+4]
	add	bx,dx
	mov	dx,di
	shl	dx,1
	add	bx,dx
	mov	word ptr [bx],ax
	inc	di
@7@530:
	inc	si
@7@554:
	cmp	si,4
	jl	short @7@482
	inc	word ptr [bp-4]
@7@602:
	cmp	word ptr [bp-4],4
	jge	@@11
	jmp	@7@50
@@11:
   ;	
   ;	  }
   ;	 }
   ;	  return check;
   ;	
	mov	ax,word ptr [bp-2]
	jmp	short @7@650
@7@650:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@leftmat$qpa4$i	endp
_TEXT	ends
_DATA	segment word public 'DATA'
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
   ;	int rightmat(int a[][4])
   ;	
	assume	cs:_TEXT
@rightmat$qpa4$i	proc	near
	push	bp
	mov	bp,sp
	sub	sp,12
	push	si
	push	di
   ;	
   ;	{ int check=0;
   ;	
	mov	word ptr [bp-2],0
   ;	
   ;	for(int j=0;j<4;j++)
   ;	
	mov	word ptr [bp-4],0
	jmp	@8@602
@8@50:
   ;	
   ;	{
   ;		int l=3;int b[4]={0,0,0,0};
   ;	
	mov	di,3
	lea	ax,word ptr [bp-12]
	push	ss
	push	ax
	mov	ax,offset DGROUP:d@w+188
	push	ds
	push	ax
	mov	cx,8
	call	near ptr N_SCOPY@
   ;	
   ;		for(int i=3;i>=0;i--)
   ;	
	mov	si,3
	jmp	short @8@146
@8@74:
   ;	
   ;		{
   ;		if(a[j][i]!=0) {b[l]=a[j][i];l--;}
   ;	
	mov	ax,word ptr [bp-4]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @8@122
	mov	ax,word ptr [bp-4]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,di
	shl	dx,1
	lea	bx,word ptr [bp-12]
	add	bx,dx
	mov	word ptr [bx],ax
	dec	di
@8@122:
	dec	si
@8@146:
	or	si,si
	jge	short @8@74
   ;	
   ;		}
   ;	
   ;		for(i=3;i>=0;i--)
   ;	
	mov	si,3
	jmp	short @8@266
@8@194:
   ;	
   ;	    if(b[i]!=a[j][i]) {check=1;}
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,word ptr [bp-4]
	shl	dx,1
	shl	dx,1
	shl	dx,1
	mov	bx,word ptr [bp+4]
	add	bx,dx
	mov	dx,si
	shl	dx,1
	add	bx,dx
	cmp	ax,word ptr [bx]
	je	short @8@242
	mov	word ptr [bp-2],1
@8@242:
	dec	si
@8@266:
	or	si,si
	jge	short @8@194
   ;	
   ;	
   ;		for(i=3;i>=0;i--)
   ;	
	mov	si,3
	jmp	@8@434
@8@314:
   ;	
   ;		if(b[i]==b[i-1] && b[i]!=0 && b[i-1]!=0) {b[i]=2*b[i];score=score+b[i];b[i-1]=0;check=1;}
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,si
	dec	dx
	shl	dx,1
	lea	bx,word ptr [bp-12]
	add	bx,dx
	cmp	ax,word ptr [bx]
	jne	short @8@410
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @8@410
	mov	ax,si
	dec	ax
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @8@410
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr [bx]
	shl	ax,1
	mov	dx,si
	shl	dx,1
	lea	bx,word ptr [bp-12]
	add	bx,dx
	mov	word ptr [bx],ax
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr DGROUP:_score
	add	ax,word ptr [bx]
	mov	word ptr DGROUP:_score,ax
	mov	ax,si
	dec	ax
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	word ptr [bx],0
	mov	word ptr [bp-2],1
@8@410:
	dec	si
@8@434:
	or	si,si
	jl	@@12
	jmp	@8@314
@@12:
   ;	
   ;		l=3;
   ;	
	mov	di,3
   ;	
   ;		a[j][0]=0;a[j][1]=0;a[j][2]=0;a[j][3]=0;
   ;	
	mov	ax,word ptr [bp-4]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	word ptr [bx],0
	mov	ax,word ptr [bp-4]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	word ptr [bx+2],0
	mov	ax,word ptr [bp-4]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	word ptr [bx+4],0
	mov	ax,word ptr [bp-4]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	word ptr [bx+6],0
   ;	
   ;		for(i=3;i>=0;i--)
   ;	
	mov	si,3
	jmp	short @8@554
@8@482:
   ;	
   ;		{
   ;			if(b[i]!=0){a[j][l]=b[i];l--;}
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @8@530
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-12]
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,word ptr [bp-4]
	shl	dx,1
	shl	dx,1
	shl	dx,1
	mov	bx,word ptr [bp+4]
	add	bx,dx
	mov	dx,di
	shl	dx,1
	add	bx,dx
	mov	word ptr [bx],ax
	dec	di
@8@530:
	dec	si
@8@554:
	or	si,si
	jge	short @8@482
	inc	word ptr [bp-4]
@8@602:
	cmp	word ptr [bp-4],4
	jge	@@13
	jmp	@8@50
@@13:
   ;	
   ;		}
   ;		}
   ;	  return check;
   ;	
	mov	ax,word ptr [bp-2]
	jmp	short @8@650
@8@650:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@rightmat$qpa4$i	endp
   ;	
   ;	int checkgameover(int a[][4])
   ;	
	assume	cs:_TEXT
@checkgameover$qpa4$i	proc	near
	push	bp
	mov	bp,sp
	sub	sp,36
	push	si
	push	di
   ;	
   ;	{
   ;	int c=1;
   ;	
	mov	word ptr [bp-2],1
   ;	
   ;	int m[4][4];
   ;	for(int i=0;i<4;i++)
   ;	
	xor	di,di
	jmp	short @9@170
@9@50:
   ;	
   ;	for(int j=0;j<4;j++)
   ;	
	xor	si,si
	jmp	short @9@122
@9@74:
   ;	
   ;	m[i][j]=a[i][j];
   ;	
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,di
	shl	dx,1
	shl	dx,1
	shl	dx,1
	lea	bx,word ptr [bp-36]
	add	bx,dx
	mov	dx,si
	shl	dx,1
	add	bx,dx
	mov	word ptr [bx],ax
	inc	si
@9@122:
	cmp	si,4
	jl	short @9@74
	inc	di
@9@170:
	cmp	di,4
	jl	short @9@50
   ;	
   ;	
   ;	leftmat(m);
   ;	
	lea	ax,word ptr [bp-36]
	push	ax
	call	near ptr @leftmat$qpa4$i
	pop	cx
   ;	
   ;	
   ;	int r=0;
   ;	
	mov	word ptr [bp-4],0
   ;	
   ;	for(i=0;i<4;i++)
   ;	
	xor	di,di
	jmp	short @9@362
@9@218:
   ;	
   ;	for(j=0;j<4;j++)
   ;	
	xor	si,si
	jmp	short @9@314
@9@242:
   ;	
   ;	{ if(m[i][j]) r++;}
   ;	
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	lea	bx,word ptr [bp-36]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @9@290
	inc	word ptr [bp-4]
@9@290:
	inc	si
@9@314:
	cmp	si,4
	jl	short @9@242
	inc	di
@9@362:
	cmp	di,4
	jl	short @9@218
   ;	
   ;	
   ;	if(r<16) c=0;
   ;	
	cmp	word ptr [bp-4],16
	jge	short @9@434
	mov	word ptr [bp-2],0
@9@434:
   ;	
   ;	
   ;	for(i=0;i<4;i++)
   ;	
	xor	di,di
	jmp	short @9@578
@9@458:
   ;	
   ;	for(j=0;j<4;j++)
   ;	
	xor	si,si
	jmp	short @9@530
@9@482:
   ;	
   ;	m[i][j]=a[i][j];
   ;	
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,di
	shl	dx,1
	shl	dx,1
	shl	dx,1
	lea	bx,word ptr [bp-36]
	add	bx,dx
	mov	dx,si
	shl	dx,1
	add	bx,dx
	mov	word ptr [bx],ax
	inc	si
@9@530:
	cmp	si,4
	jl	short @9@482
	inc	di
@9@578:
	cmp	di,4
	jl	short @9@458
   ;	
   ;	
   ;	rightmat(m);
   ;	
	lea	ax,word ptr [bp-36]
	push	ax
	call	near ptr @rightmat$qpa4$i
	pop	cx
   ;	
   ;	
   ;	r=0;
   ;	
	mov	word ptr [bp-4],0
   ;	
   ;	for(i=0;i<4;i++)
   ;	
	xor	di,di
	jmp	short @9@770
@9@626:
   ;	
   ;	for(j=0;j<4;j++)
   ;	
	xor	si,si
	jmp	short @9@722
@9@650:
   ;	
   ;	{ if(m[i][j]) r++;}
   ;	
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	lea	bx,word ptr [bp-36]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @9@698
	inc	word ptr [bp-4]
@9@698:
	inc	si
@9@722:
	cmp	si,4
	jl	short @9@650
	inc	di
@9@770:
	cmp	di,4
	jl	short @9@626
   ;	
   ;	
   ;	if(r<16) c=0;
   ;	
	cmp	word ptr [bp-4],16
	jge	short @9@842
	mov	word ptr [bp-2],0
@9@842:
   ;	
   ;	
   ;	for(i=0;i<4;i++)
   ;	
	xor	di,di
	jmp	short @9@986
@9@866:
   ;	
   ;	for(j=0;j<4;j++)
   ;	
	xor	si,si
	jmp	short @9@938
@9@890:
   ;	
   ;	m[i][j]=a[i][j];
   ;	
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,di
	shl	dx,1
	shl	dx,1
	shl	dx,1
	lea	bx,word ptr [bp-36]
	add	bx,dx
	mov	dx,si
	shl	dx,1
	add	bx,dx
	mov	word ptr [bx],ax
	inc	si
@9@938:
	cmp	si,4
	jl	short @9@890
	inc	di
@9@986:
	cmp	di,4
	jl	short @9@866
   ;	
   ;	
   ;	upmat(m);
   ;	
	lea	ax,word ptr [bp-36]
	push	ax
	call	near ptr @upmat$qpa4$i
	pop	cx
   ;	
   ;	
   ;	r=0;
   ;	
	mov	word ptr [bp-4],0
   ;	
   ;	for(i=0;i<4;i++)
   ;	
	xor	di,di
	jmp	short @9@1178
@9@1034:
   ;	
   ;	for(j=0;j<4;j++)
   ;	
	xor	si,si
	jmp	short @9@1130
@9@1058:
   ;	
   ;	{ if(m[i][j]) r++;}
   ;	
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	lea	bx,word ptr [bp-36]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @9@1106
	inc	word ptr [bp-4]
@9@1106:
	inc	si
@9@1130:
	cmp	si,4
	jl	short @9@1058
	inc	di
@9@1178:
	cmp	di,4
	jl	short @9@1034
   ;	
   ;	
   ;	if(r<16) c=0;
   ;	
	cmp	word ptr [bp-4],16
	jge	short @9@1250
	mov	word ptr [bp-2],0
@9@1250:
   ;	
   ;	
   ;	for(i=0;i<4;i++)
   ;	
	xor	di,di
	jmp	short @9@1394
@9@1274:
   ;	
   ;	for(j=0;j<4;j++)
   ;	
	xor	si,si
	jmp	short @9@1346
@9@1298:
   ;	
   ;	m[i][j]=a[i][j];
   ;	
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,di
	shl	dx,1
	shl	dx,1
	shl	dx,1
	lea	bx,word ptr [bp-36]
	add	bx,dx
	mov	dx,si
	shl	dx,1
	add	bx,dx
	mov	word ptr [bx],ax
	inc	si
@9@1346:
	cmp	si,4
	jl	short @9@1298
	inc	di
@9@1394:
	cmp	di,4
	jl	short @9@1274
   ;	
   ;	
   ;	downmat(m);
   ;	
	lea	ax,word ptr [bp-36]
	push	ax
	call	near ptr @downmat$qpa4$i
	pop	cx
   ;	
   ;	
   ;	r=0;
   ;	
	mov	word ptr [bp-4],0
   ;	
   ;	for(i=0;i<4;i++)
   ;	
	xor	di,di
	jmp	short @9@1586
@9@1442:
   ;	
   ;	for(j=0;j<4;j++)
   ;	
	xor	si,si
	jmp	short @9@1538
@9@1466:
   ;	
   ;	{ if(m[i][j]) r++;}
   ;	
	mov	ax,di
	shl	ax,1
	shl	ax,1
	shl	ax,1
	lea	bx,word ptr [bp-36]
	add	bx,ax
	mov	ax,si
	shl	ax,1
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @9@1514
	inc	word ptr [bp-4]
@9@1514:
	inc	si
@9@1538:
	cmp	si,4
	jl	short @9@1466
	inc	di
@9@1586:
	cmp	di,4
	jl	short @9@1442
   ;	
   ;	
   ;	if(r<16) c=0;
   ;	
	cmp	word ptr [bp-4],16
	jge	short @9@1658
	mov	word ptr [bp-2],0
@9@1658:
   ;	
   ;	
   ;	return c;
   ;	
	mov	ax,word ptr [bp-2]
	jmp	short @9@1682
@9@1682:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@checkgameover$qpa4$i	endp
   ;	
   ;	void main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,20
	push	si
	push	di
   ;	
   ;	{
   ;	time_t t;
   ;	
   ;	int gdriver = DETECT, gmode, errorcode;
   ;	
	mov	word ptr [bp-6],0
   ;	
   ;	initgraph(&gdriver, &gmode, "");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+127
	push	ax
	push	ds
	lea	ax,word ptr [bp-8]
	push	ax
	push	ds
	lea	ax,word ptr [bp-6]
	push	ax
	call	far ptr _initgraph
	add	sp,12
   ;	
   ;	errorcode = graphresult();
   ;	
	call	far ptr _graphresult
	mov	word ptr [bp-10],ax
   ;	
   ;	if (errorcode != grOk)
   ;	
	cmp	word ptr [bp-10],0
	je	short @10@74
   ;	
   ;	{
   ;	   printf("Graphics error: %s\n", grapherrormsg(errorcode));
   ;	
	push	word ptr [bp-10]
	call	far ptr _grapherrormsg
	pop	cx
	push	ax
	mov	ax,offset DGROUP:s@+128
	push	ax
	call	near ptr _printf
	pop	cx
	pop	cx
   ;	
   ;	   printf("Press any key to halt:");
   ;	
	mov	ax,offset DGROUP:s@+148
	push	ax
	call	near ptr _printf
	pop	cx
   ;	
   ;	   getch();
   ;	
	call	near ptr _getch
   ;	
   ;	   exit(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _exit
	pop	cx
@10@74:
   ;	
   ;	}
   ;	cleardevice();
   ;	
	call	far ptr _cleardevice
   ;	
   ;	srand((unsigned) time(&t));
   ;	
	lea	ax,word ptr [bp-4]
	push	ax
	call	near ptr _time
	pop	cx
	push	ax
	call	near ptr _srand
	pop	cx
   ;	
   ;	int l,m,i,j,u;
   ;	l = rand()%4; m = rand()%4;
   ;	
	call	near ptr _rand
	mov	bx,4
	cwd	
	idiv	bx
	mov	word ptr [bp-12],dx
	call	near ptr _rand
	mov	bx,4
	cwd	
	idiv	bx
	mov	word ptr [bp-14],dx
   ;	
   ;	mat[l][m] = (rand() % 2 + 1) * 2;
   ;	
	call	near ptr _rand
	mov	bx,2
	cwd	
	idiv	bx
	inc	dx
	shl	dx,1
	mov	ax,word ptr [bp-12]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,offset DGROUP:_mat
	add	bx,ax
	mov	ax,word ptr [bp-14]
	shl	ax,1
	add	bx,ax
	mov	word ptr [bx],dx
   ;	
   ;	l = rand()%4; m = rand()%4;
   ;	
	call	near ptr _rand
	mov	bx,4
	cwd	
	idiv	bx
	mov	word ptr [bp-12],dx
	call	near ptr _rand
	mov	bx,4
	cwd	
	idiv	bx
	mov	word ptr [bp-14],dx
   ;	
   ;	if(mat[l][m])
   ;	
	mov	ax,word ptr [bp-12]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,offset DGROUP:_mat
	add	bx,ax
	mov	ax,word ptr [bp-14]
	shl	ax,1
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @10@122
   ;	
   ;	{ l = rand() % 4; m = rand() % 4; }
   ;	
	call	near ptr _rand
	mov	bx,4
	cwd	
	idiv	bx
	mov	word ptr [bp-12],dx
	call	near ptr _rand
	mov	bx,4
	cwd	
	idiv	bx
	mov	word ptr [bp-14],dx
@10@122:
   ;	
   ;	mat[l][m] = (rand() % 2 + 1) * 2;
   ;	
	call	near ptr _rand
	mov	bx,2
	cwd	
	idiv	bx
	inc	dx
	shl	dx,1
	mov	ax,word ptr [bp-12]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	bx,offset DGROUP:_mat
	add	bx,ax
	mov	ax,word ptr [bp-14]
	shl	ax,1
	add	bx,ax
	mov	word ptr [bx],dx
   ;	
   ;	
   ;	char str[4];
   ;	rendermat(mat);
   ;	
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @rendermat$qpa4$i
	pop	cx
   ;	
   ;	char ch;
   ;	ch=getch();
   ;	
	call	near ptr _getch
	mov	byte ptr [bp-19],al
	jmp	@10@842
@10@146:
   ;	
   ;	while(ch!=32)
   ;	{
   ;	inp:
   ;	if(ch=='w')
   ;	
	cmp	byte ptr [bp-19],119
	jne	short @10@314
   ;	
   ;	{int v;
   ;	sound(rand()%2000+15);delay(100);nosound();
   ;	
	call	near ptr _rand
	mov	bx,2000
	cwd	
	idiv	bx
	add	dx,15
	push	dx
	call	near ptr _sound
	pop	cx
	mov	ax,100
	push	ax
	call	near ptr _delay
	pop	cx
	call	near ptr _nosound
   ;	
   ;	v=upmat(mat);
   ;	
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @upmat$qpa4$i
	pop	cx
	mov	di,ax
   ;	
   ;	cleardevice();
   ;	
	call	far ptr _cleardevice
   ;	
   ;	rendermat(mat);
   ;	
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @rendermat$qpa4$i
	pop	cx
   ;	
   ;	delay(150);
   ;	
	mov	ax,150
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	
   ;	if(z==16 && checkgameover(mat)==1) goto kaboom;
   ;	
	cmp	word ptr DGROUP:_z,16
	jne	short @10@242
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @checkgameover$qpa4$i
	pop	cx
	cmp	ax,1
	jne	short @10@242
	jmp	@10@890
@10@242:
   ;	
   ;	
   ;	if(z<16 && v==1) {pullrandom(mat); }
   ;	
	cmp	word ptr DGROUP:_z,16
	jge	short @10@314
	cmp	di,1
	jne	short @10@314
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @pullrandom$qpa4$i
	pop	cx
@10@314:
   ;	
   ;	}
   ;	if(ch=='a')
   ;	
	cmp	byte ptr [bp-19],97
	jne	short @10@482
   ;	
   ;	{ int v;
   ;	sound(rand()%2000+15);delay(100);nosound();
   ;	
	call	near ptr _rand
	mov	bx,2000
	cwd	
	idiv	bx
	add	dx,15
	push	dx
	call	near ptr _sound
	pop	cx
	mov	ax,100
	push	ax
	call	near ptr _delay
	pop	cx
	call	near ptr _nosound
   ;	
   ;	v=leftmat(mat);
   ;	
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @leftmat$qpa4$i
	pop	cx
	mov	di,ax
   ;	
   ;	cleardevice();
   ;	
	call	far ptr _cleardevice
   ;	
   ;	rendermat(mat);
   ;	
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @rendermat$qpa4$i
	pop	cx
   ;	
   ;	delay(150);
   ;	
	mov	ax,150
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	
   ;	if(z==16 && checkgameover(mat)==1) goto kaboom;
   ;	
	cmp	word ptr DGROUP:_z,16
	jne	short @10@410
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @checkgameover$qpa4$i
	pop	cx
	cmp	ax,1
	jne	short @10@410
	jmp	@10@890
@10@410:
   ;	
   ;	
   ;	if(z<16 && v==1) {pullrandom(mat);}
   ;	
	cmp	word ptr DGROUP:_z,16
	jge	short @10@482
	cmp	di,1
	jne	short @10@482
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @pullrandom$qpa4$i
	pop	cx
@10@482:
   ;	
   ;	}
   ;	if(ch=='d')
   ;	
	cmp	byte ptr [bp-19],100
	jne	short @10@650
   ;	
   ;	{ int v;
   ;	sound(rand()%2000+15);
   ;	
	call	near ptr _rand
	mov	bx,2000
	cwd	
	idiv	bx
	add	dx,15
	push	dx
	call	near ptr _sound
	pop	cx
   ;	
   ;	delay(100);
   ;	
	mov	ax,100
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	nosound();
   ;	
	call	near ptr _nosound
   ;	
   ;	v=rightmat(mat);
   ;	
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @rightmat$qpa4$i
	pop	cx
	mov	di,ax
   ;	
   ;	cleardevice();
   ;	
	call	far ptr _cleardevice
   ;	
   ;	rendermat(mat);
   ;	
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @rendermat$qpa4$i
	pop	cx
   ;	
   ;	delay(150);
   ;	
	mov	ax,150
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	
   ;	if(z==16 && checkgameover(mat)==1) goto kaboom;
   ;	
	cmp	word ptr DGROUP:_z,16
	jne	short @10@578
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @checkgameover$qpa4$i
	pop	cx
	cmp	ax,1
	jne	short @10@578
	jmp	@10@890
@10@578:
   ;	
   ;	
   ;	if(z<16 && v==1) {pullrandom(mat);}
   ;	
	cmp	word ptr DGROUP:_z,16
	jge	short @10@650
	cmp	di,1
	jne	short @10@650
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @pullrandom$qpa4$i
	pop	cx
@10@650:
   ;	
   ;	}
   ;	if(ch=='s')
   ;	
	cmp	byte ptr [bp-19],115
	jne	short @10@818
   ;	
   ;	{int v;
   ;	sound(rand()%2000+15);
   ;	
	call	near ptr _rand
	mov	bx,2000
	cwd	
	idiv	bx
	add	dx,15
	push	dx
	call	near ptr _sound
	pop	cx
   ;	
   ;	delay(100);
   ;	
	mov	ax,100
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	nosound();
   ;	
	call	near ptr _nosound
   ;	
   ;	v=downmat(mat);
   ;	
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @downmat$qpa4$i
	pop	cx
	mov	di,ax
   ;	
   ;	cleardevice();
   ;	
	call	far ptr _cleardevice
   ;	
   ;	rendermat(mat);
   ;	
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @rendermat$qpa4$i
	pop	cx
   ;	
   ;	delay(150);
   ;	
	mov	ax,150
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	
   ;	if(z==16 && checkgameover(mat)==1) goto kaboom;
   ;	
	cmp	word ptr DGROUP:_z,16
	jne	short @10@746
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @checkgameover$qpa4$i
	pop	cx
	cmp	ax,1
	jne	short @10@746
	jmp	@10@890
@10@746:
   ;	
   ;	
   ;	if(z<16 && v==1) {pullrandom(mat);}
   ;	
	cmp	word ptr DGROUP:_z,16
	jge	short @10@818
	cmp	di,1
	jne	short @10@818
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @pullrandom$qpa4$i
	pop	cx
@10@818:
   ;	
   ;	}
   ;	ch=getch();
   ;	
	call	near ptr _getch
	mov	byte ptr [bp-19],al
@10@842:
	cmp	byte ptr [bp-19],32
	je	@@14
	jmp	@10@146
@@14:
   ;	
   ;	}
   ;	cleardevice();
   ;	
	call	far ptr _cleardevice
   ;	
   ;	rendermatnotip(mat);
   ;	
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @rendermatnotip$qpa4$i
	pop	cx
   ;	
   ;	settextstyle(3,0,3);
   ;	
	mov	ax,3
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,3
	push	ax
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;	setcolor(RED);
   ;	
	mov	ax,4
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;	outtextxy(100,getmaxy()-60,"!!! Press <SPACE> to Exit !!!");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+171
	push	ax
	call	far ptr _getmaxy
	add	ax,65476
	push	ax
	mov	ax,100
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;	delay(500);
   ;	
	mov	ax,500
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	setcolor(YELLOW);
   ;	
	mov	ax,14
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;	outtextxy(100,getmaxy()-60,"!!! Press <SPACE> to Exit !!!");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+201
	push	ax
	call	far ptr _getmaxy
	add	ax,65476
	push	ax
	mov	ax,100
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;	goto puddle;
   ;	
	jmp	@10@986
@10@890:
   ;	
   ;	kaboom:
   ;	cleardevice();
   ;	
	call	far ptr _cleardevice
   ;	
   ;	itoa(tmp,str,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-18]
	push	ax
	push	word ptr DGROUP:_tmp
	call	near ptr _itoa
	add	sp,6
   ;	
   ;	rendermatnotip(mat);
   ;	
	mov	ax,offset DGROUP:_mat
	push	ax
	call	near ptr @rendermatnotip$qpa4$i
	pop	cx
   ;	
   ;	settextstyle(7,0,5);
   ;	
	mov	ax,5
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,7
	push	ax
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;	outtextxy(100,425,"!!! GAME OVER !!!");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+231
	push	ax
	mov	ax,425
	push	ax
	mov	ax,100
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;	for(i=0;i<18;i++)
   ;	
	xor	si,si
	jmp	@10@962
@10@914:
   ;	
   ;	{sound(rand()%2000+15);
   ;	
	call	near ptr _rand
	mov	bx,2000
	cwd	
	idiv	bx
	add	dx,15
	push	dx
	call	near ptr _sound
	pop	cx
   ;	
   ;	settextstyle(1,0,4);
   ;	
	mov	ax,4
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;	outtextxy(getmaxx()-150,30,"SCORE");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+249
	push	ax
	mov	ax,30
	push	ax
	call	far ptr _getmaxx
	add	ax,65386
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;	setcolor(i/3*3);
   ;	
	mov	ax,si
	mov	bx,3
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;	settextstyle(9,0,4);
   ;	
	mov	ax,4
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,9
	push	ax
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;	outtextxy(getmaxx()-120-15*(strlen(str)-1),80,str);
   ;	
	push	ds
	lea	ax,word ptr [bp-18]
	push	ax
	mov	ax,80
	push	ax
	call	far ptr _getmaxx
	add	ax,65416
	push	ax
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _strlen
	pop	cx
	dec	ax
	mov	dx,15
	imul	dx
	pop	dx
	sub	dx,ax
	push	dx
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;	delay(rand()%200+100);
   ;	
	call	near ptr _rand
	mov	bx,200
	cwd	
	idiv	bx
	add	dx,100
	push	dx
	call	near ptr _delay
	pop	cx
   ;	
   ;	nosound();}
   ;	
	call	near ptr _nosound
	inc	si
@10@962:
	cmp	si,18
	jge	@@15
	jmp	@10@914
@@15:
@10@986:
   ;	
   ;	puddle:
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
_main	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'Use W S A D keys to move the tiles, <SPACE> to Quit.'
	db	0
	db	'When two tiles with the same number touch, they merge into on'
	db	'e!'
	db	0
	db	'SCORE'
	db	0
	db	0
	db	0
	db	0
	db	'@'
	db	0
	db	'Graphics error: %s'
	db	10
	db	0
	db	'Press any key to halt:'
	db	0
	db	'!!! Press <SPACE> to Exit !!!'
	db	0
	db	'!!! Press <SPACE> to Exit !!!'
	db	0
	db	'!!! GAME OVER !!!'
	db	0
	db	'SCORE'
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
	public	_z
	public	_score
	public	_tmp
	public	@showusertip$qv
	extrn	_settextstyle:far
	extrn	_outtextxy:far
	extrn	_getmaxy:far
	extrn	_itoa:near
	extrn	_getmaxx:far
	extrn	_strlen:near
	public	_mat
	public	_x1
	public	_y1
	public	_x2
	public	_y2
	public	@rendermat$qpa4$i
	extrn	_rectangle:far
	extrn	_pow:near
	extrn	_setfillstyle:far
	extrn	_floodfill:far
	public	@rendermatnotip$qpa4$i
	public	@pullrandom$qpa4$i
	extrn	_rand:near
	extrn	_delay:near
	public	@upmat$qpa4$i
	extrn	N_SCOPY@:near
	public	@downmat$qpa4$i
	public	@leftmat$qpa4$i
	public	@rightmat$qpa4$i
	public	@checkgameover$qpa4$i
	public	_main
	extrn	_initgraph:far
	extrn	_graphresult:far
	extrn	_printf:near
	extrn	_grapherrormsg:far
	extrn	_getch:near
	extrn	_exit:near
	extrn	_cleardevice:far
	extrn	_srand:near
	extrn	_time:near
	extrn	_sound:near
	extrn	_nosound:near
	extrn	_setcolor:far
	end
