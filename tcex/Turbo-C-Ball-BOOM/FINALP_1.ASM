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
	?debug	S "c:\finalp_1.cpp"
	?debug	C E98B58FE7C0F633A5C66696E616C705F312E637070
	?debug	C E95337528115443A5C494E434C5544455C67726170686963732E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
	?debug	C E95337528110443A5C494E434C5544455C646F732E68
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
	?debug	C E95337528110443A5C494E434C5544455C6D656D2E68
	?debug	C E95337528111443A5C494E434C5544455C6D6174682E68
	?debug	C E95337528111443A5C494E434C5544455C74696D652E68
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
_i	label	word
	db	16 dup (?)
_o	label	word
	db	16 dup (?)
_BSS	ends
_DATA	segment word public 'DATA'
_x1	label	word
	db	64
	db	1
_DATA	ends
_BSS	segment word public 'BSS'
_BSS	ends
_DATA	segment word public 'DATA'
_y1	label	word
	db	25
	db	0
_DATA	ends
_BSS	segment word public 'BSS'
_x	label	word
	db	2 dup (?)
_y	label	word
	db	2 dup (?)
_arrow1	label	word
	db	2 dup (?)
_arrow2	label	word
	db	2 dup (?)
_arrow3	label	word
	db	2 dup (?)
_arrow4	label	word
	db	2 dup (?)
_button	label	word
	db	2 dup (?)
_BSS	ends
_DATA	segment word public 'DATA'
_flag	label	word
	db	0
	db	0
_DATA	ends
_BSS	segment word public 'BSS'
_BSS	ends
_DATA	segment word public 'DATA'
_r	label	word
	db	40
	db	0
_DATA	ends
_BSS	segment word public 'BSS'
_timer	label	word
	db	4 dup (?)
_now	label	word
	db	4 dup (?)
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	int main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
   ;	
   ;	{
   ;	int gdriver = DETECT, gmode, errorcode;
   ;	
	mov	word ptr [bp-2],0
   ;	
   ;	initgraph(&gdriver, &gmode, "c:\\tc\\bgi"); //initialize graphics mode
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
   ;	errorcode = graphresult();  //read result of initialization
   ;	
	call	far ptr _graphresult
	mov	si,ax
   ;	
   ;	if (errorcode != grOk)  // an error occured
   ;	
	or	si,si
	je	short @1@74
   ;	
   ;	{
   ;	    printf("Graphics error: %s\n", grapherrormsg(errorcode));
   ;	
	push	si
	call	far ptr _grapherrormsg
	pop	cx
	push	ax
	mov	ax,offset DGROUP:s@+10
	push	ax
	call	near ptr _printf
	pop	cx
	pop	cx
   ;	
   ;	    printf("Press any key to halt:");
   ;	
	mov	ax,offset DGROUP:s@+30
	push	ax
	call	near ptr _printf
	pop	cx
   ;	
   ;	    getch();
   ;	
	call	near ptr _getch
   ;	
   ;	    exit(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _exit
	pop	cx
@1@74:
   ;	
   ;	}
   ;	
   ;	//graphic 1 final project ... first page
   ;	    Start();
   ;	
	call	near ptr @Start$qv
   ;	
   ;	    setbkcolor(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	far ptr _setbkcolor
	pop	cx
   ;	
   ;	
   ;	//level 1 starting here
   ;	    time(&timer);
   ;	
	mov	ax,offset DGROUP:_timer
	push	ax
	call	near ptr _time
	pop	cx
   ;	
   ;		Level1Drawing();
   ;	
	call	near ptr @Level1Drawing$qv
   ;	
   ;	    Level1Playing();
   ;	
	call	near ptr @Level1Playing$qv
   ;	
   ;			
   ;	//level 2 starting here
   ;	    time(&timer);
   ;	
	mov	ax,offset DGROUP:_timer
	push	ax
	call	near ptr _time
	pop	cx
   ;	
   ;		r/=2;
   ;	
	mov	bx,2
	mov	ax,word ptr DGROUP:_r
	cwd	
	idiv	bx
	mov	word ptr DGROUP:_r,ax
   ;	
   ;	    Level2Drawing();
   ;	
	call	near ptr @Level2Drawing$qv
   ;	
   ;	    Level2Playing();
   ;	
	call	near ptr @Level2Playing$qv
   ;	
   ;	
   ;	//the end
   ;	    GameOver();
   ;	
	call	near ptr @GameOver$qv
   ;	
   ;	
   ;		
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	closegraph(); //The function closes the graphical mode.
   ;	
	call	far ptr _closegraph
   ;	
   ;	return 0;
   ;	
	xor	ax,ax
	jmp	short @1@98
@1@98:
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_main	endp
   ;	
   ;	void getmousepos(int *button, int *x, int *y)
   ;	
	assume	cs:_TEXT
@getmousepos$qpit1t1	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{ 
   ;	   i.x.ax =3;
   ;	
	mov	word ptr DGROUP:_i,3
   ;	
   ;	   int86(0X33,&i,&o);  
   ;	
	mov	ax,offset DGROUP:_o
	push	ax
	mov	ax,offset DGROUP:_i
	push	ax
	mov	ax,51
	push	ax
	call	near ptr _int86
	add	sp,6
   ;	
   ;	   *button = o.x.bx;
   ;	
	mov	bx,word ptr [bp+4]
	mov	ax,word ptr DGROUP:_o+2
	mov	word ptr [bx],ax
   ;	
   ;	   *x = o.x.cx;
   ;	
	mov	bx,word ptr [bp+6]
	mov	ax,word ptr DGROUP:_o+4
	mov	word ptr [bx],ax
   ;	
   ;	   *y = o.x.dx;
   ;	
	mov	bx,word ptr [bp+8]
	mov	ax,word ptr DGROUP:_o+6
	mov	word ptr [bx],ax
   ;	
   ;	 }
   ;	
	pop	bp
	ret	
@getmousepos$qpit1t1	endp
   ;	
   ;	void Start()
   ;	
	assume	cs:_TEXT
@Start$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	    //First Page Codes Starting Here :)
   ;	    
   ;	    setbkcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	far ptr _setbkcolor
	pop	cx
   ;	
   ;	    setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;	    
   ;	    //Names 
   ;	    settextstyle(4 , HORIZ_DIR , 3);
   ;	
	mov	ax,3
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,4
	push	ax
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;	    outtextxy(50 , 50 , "Amir Ghanem 313258030");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+53
	push	ax
	mov	ax,50
	push	ax
	mov	ax,50
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;	    outtextxy(50 , 100 , "Alam Aslan 208913236");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+75
	push	ax
	mov	ax,100
	push	ax
	mov	ax,50
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		
   ;		//About The Game
   ;		settextstyle(6 , HORIZ_DIR , 3);
   ;	
	mov	ax,3
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,6
	push	ax
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;		outtextxy(50 , 180 , "ABOUT THE GAME...");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+96
	push	ax
	mov	ax,180
	push	ax
	mov	ax,50
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		settextstyle(7 , HORIZ_DIR , 2);
   ;	
	mov	ax,2
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,7
	push	ax
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;		outtextxy(50 , 220 , "shot all the balls to win :)");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+114
	push	ax
	mov	ax,220
	push	ax
	mov	ax,50
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		outtextxy(50 , 260 , "you have 7 balls to shoot in every round");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+143
	push	ax
	mov	ax,260
	push	ax
	mov	ax,50
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		outtextxy(50 , 300 , "round 2 become harder ... ");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+184
	push	ax
	mov	ax,300
	push	ax
	mov	ax,50
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		outtextxy(50 , 340 , "balls become smaller and the aroow become faster");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+211
	push	ax
	mov	ax,340
	push	ax
	mov	ax,50
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		outtextxy(50 , 380 , "use SPACE for shooting");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+260
	push	ax
	mov	ax,380
	push	ax
	mov	ax,50
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;	
   ;	    //Start Button
   ;		settextstyle(4 , HORIZ_DIR , 3);
   ;	
	mov	ax,3
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,4
	push	ax
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;	    outtextxy(getmaxx()-100 , getmaxy()-100 , "START");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+283
	push	ax
	call	far ptr _getmaxy
	add	ax,65436
	push	ax
	call	far ptr _getmaxx
	add	ax,65436
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;	    rectangle(getmaxx()-105 , getmaxy()-101 , getmaxx()-15 , getmaxy()-70);
   ;	
	call	far ptr _getmaxy
	add	ax,65466
	push	ax
	call	far ptr _getmaxx
	add	ax,65521
	push	ax
	call	far ptr _getmaxy
	add	ax,65435
	push	ax
	call	far ptr _getmaxx
	add	ax,65431
	push	ax
	call	far ptr _rectangle
	add	sp,8
   ;	
   ;	    
   ;	    //Show The Mouse On Screen
   ;	    i.x.ax=1;
   ;	
	mov	word ptr DGROUP:_i,1
   ;	
   ;	    int86(0x33,&i,&o); 
   ;	
	mov	ax,offset DGROUP:_o
	push	ax
	mov	ax,offset DGROUP:_i
	push	ax
	mov	ax,51
	push	ax
	call	near ptr _int86
	add	sp,6
   ;	
   ;	    
   ;	    //Press On The Start Button To Start The Game :)
   ;	    i.x.ax=3; 
   ;	
	mov	word ptr DGROUP:_i,3
   ;	
   ;	    int86(0x33,&i,&o);
   ;	
	mov	ax,offset DGROUP:_o
	push	ax
	mov	ax,offset DGROUP:_i
	push	ax
	mov	ax,51
	push	ax
	call	near ptr _int86
	add	sp,6
	jmp	short @3@194
@3@50:
   ;	
   ;	    
   ;	    while(flag!=1)
   ;	    {
   ;	    	getmousepos(&button, &x, &y);
   ;	
	mov	ax,offset DGROUP:_y
	push	ax
	mov	ax,offset DGROUP:_x
	push	ax
	mov	ax,offset DGROUP:_button
	push	ax
	call	near ptr @getmousepos$qpit1t1
	add	sp,6
   ;	
   ;	    	if( (x>getmaxx()-105)  &&  (x<getmaxx()-15)  &&  (y>getmaxy()-101)  &&  (y<getmaxy()-70) && (button==1) )
   ;	
	call	far ptr _getmaxx
	add	ax,65431
	cmp	ax,word ptr DGROUP:_x
	jge	short @3@194
	call	far ptr _getmaxx
	add	ax,65521
	cmp	ax,word ptr DGROUP:_x
	jle	short @3@194
	call	far ptr _getmaxy
	add	ax,65435
	cmp	ax,word ptr DGROUP:_y
	jge	short @3@194
	call	far ptr _getmaxy
	add	ax,65466
	cmp	ax,word ptr DGROUP:_y
	jle	short @3@194
	cmp	word ptr DGROUP:_button,1
	jne	short @3@194
   ;	
   ;	    	{
   ;	    		flag=1;
   ;	
	mov	word ptr DGROUP:_flag,1
   ;	
   ;	    		setbkcolor(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	far ptr _setbkcolor
	pop	cx
   ;	
   ;	    		cleardevice();	
   ;	
	call	far ptr _cleardevice
@3@194:
	cmp	word ptr DGROUP:_flag,1
	jne	short @3@50
   ;	
   ;	    	}
   ;	    }
   ;	}
   ;	
	pop	bp
	ret	
@Start$qv	endp
   ;	
   ;	void fillarea(int num1 , int num2 , int color, int oldcolor)
   ;	
	assume	cs:_TEXT
@fillarea$qiiii	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
	mov	si,word ptr [bp+6]
   ;	
   ;	{
   ;	   if (getpixel(num1,num2)==oldcolor)
   ;	
	push	si
	push	di
	call	far ptr _getpixel
	pop	cx
	pop	cx
	cmp	ax,word ptr [bp+10]
	jne	short @4@74
   ;	
   ;	   {
   ;	     putpixel(num1,num2,color);
   ;	
	push	word ptr [bp+8]
	push	si
	push	di
	call	far ptr _putpixel
	add	sp,6
   ;	
   ;	     fillarea(num1 ,num2+1,color,oldcolor);
   ;	
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	mov	ax,si
	inc	ax
	push	ax
	push	di
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;	     fillarea(num1, num2-1,color,oldcolor);
   ;	
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	mov	ax,si
	dec	ax
	push	ax
	push	di
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;	     fillarea(num1+1, num2 ,color,oldcolor);
   ;	
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	si
	mov	ax,di
	inc	ax
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;	     fillarea(num1-1,num2, color,oldcolor);
   ;	
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	si
	mov	ax,di
	dec	ax
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
@4@74:
   ;	
   ;	   }
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@fillarea$qiiii	endp
   ;	
   ;	int IsInside(int Circle_x,int Circle_y,int radius,int x,int y){
   ;	
	assume	cs:_TEXT
@IsInside$qiiiii	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;		  if ((x - Circle_x) * (x - Circle_x) + (y - Circle_y) * (y - Circle_y) <= radius * radius)
   ;	
	mov	ax,word ptr [bp+10]
	sub	ax,word ptr [bp+4]
	mov	dx,word ptr [bp+10]
	sub	dx,word ptr [bp+4]
	imul	dx
	push	ax
	mov	ax,word ptr [bp+12]
	sub	ax,word ptr [bp+6]
	mov	dx,word ptr [bp+12]
	sub	dx,word ptr [bp+6]
	imul	dx
	pop	dx
	add	dx,ax
	mov	ax,word ptr [bp+8]
	push	dx
	imul	word ptr [bp+8]
	pop	dx
	cmp	dx,ax
	jg	short @5@74
   ;	
   ;			  return 1;
   ;	
	mov	ax,1
	jmp	short @5@98
@5@74:
   ;	
   ;		  return 0;
   ;	
	xor	ax,ax
	jmp	short @5@98
@5@98:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@IsInside$qiiiii	endp
   ;	
   ;	void Level1Drawing()
   ;	
	assume	cs:_TEXT
@Level1Drawing$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;	    settextstyle(1 , HORIZ_DIR , 3);
   ;	
	mov	ax,3
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;	    outtextxy(getmaxx()-100 , 20 , "LEVEL.1");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+289
	push	ax
	mov	ax,20
	push	ax
	call	far ptr _getmaxx
	add	ax,65436
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;	    rectangle(getmaxx()-110 , 20 , getmaxx()-10 , 50);
   ;	
	mov	ax,50
	push	ax
	call	far ptr _getmaxx
	add	ax,65526
	push	ax
	mov	ax,20
	push	ax
	call	far ptr _getmaxx
	add	ax,65426
	push	ax
	call	far ptr _rectangle
	add	sp,8
   ;	
   ;	
   ;		setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		rectangle(getmaxx()/2-40,0,getmaxx()/2+40,25);
   ;	
	mov	ax,25
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,40
	push	ax
	xor	ax,ax
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65496
	push	ax
	call	far ptr _rectangle
	add	sp,8
   ;	
   ;		setfillstyle(1 , DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;		floodfill(getmaxx()/2 , 10 , DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	mov	ax,10
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		
   ;		//game percent panel
   ;		setcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		rectangle(10 , 20 , 135 , 50);
   ;	
	mov	ax,50
	push	ax
	mov	ax,135
	push	ax
	mov	ax,20
	push	ax
	mov	ax,10
	push	ax
	call	far ptr _rectangle
	add	sp,8
   ;	
   ;		
   ;		//time panel
   ;		setcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		rectangle(10 , 55 , 135 , 85);
   ;	
	mov	ax,85
	push	ax
	mov	ax,135
	push	ax
	mov	ax,55
	push	ax
	mov	ax,10
	push	ax
	call	far ptr _rectangle
	add	sp,8
   ;	
   ;		
   ;		//LEFT BALL
   ;		setcolor(1);
   ;	
	mov	ax,1
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		circle(r,getmaxy()-250,r);
   ;	
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	push	word ptr DGROUP:_r
	call	far ptr _circle
	add	sp,6
   ;	
   ;	    setfillstyle(1 , 1);
   ;	
	mov	ax,1
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;	    floodfill(r , getmaxy()-250 , 1);	
   ;	
	mov	ax,1
	push	ax
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	push	word ptr DGROUP:_r
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		
   ;		//LEFT CENTER BALL
   ;		setcolor(3);
   ;	
	mov	ax,3
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		circle(getmaxx()/4 , getmaxy()-200,r);
   ;	
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;	    setfillstyle(1 , 3);
   ;	
	mov	ax,3
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;	    floodfill(getmaxx()/4 , getmaxy()-200 , 3);	
   ;	
	mov	ax,3
	push	ax
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		
   ;		//CENTER BALL 
   ;		setcolor(5);
   ;	
	mov	ax,5
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		circle(getmaxx()/2 , getmaxy()-150,r);
   ;	
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65386
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;	    setfillstyle(1 , 5);
   ;	
	mov	ax,5
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;	    floodfill(getmaxx()/2 , getmaxy()-150 , 5);	
   ;	
	mov	ax,5
	push	ax
	call	far ptr _getmaxy
	add	ax,65386
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		
   ;		//CENTER RIGHT BALL
   ;		setcolor(7);
   ;	
	mov	ax,7
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		circle((getmaxx()/4)*3,getmaxy()-200,r);
   ;	
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;	    setfillstyle(1 , 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;	    floodfill((getmaxx()/4)*3 , getmaxy()-200 , 7);	
   ;	
	mov	ax,7
	push	ax
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		
   ;		//RIGHT BALL
   ;		setcolor(9);
   ;	
	mov	ax,9
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		circle(getmaxx()-r,getmaxy()-250,r);
   ;	
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;	    setfillstyle(1 , 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;	    floodfill(getmaxx()-r , getmaxy()-250 , 9);	
   ;	
	mov	ax,9
	push	ax
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		
   ;		//BOTTOM LEFT BALL
   ;		setcolor(11);
   ;	
	mov	ax,11
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		circle(2*r,getmaxy()-2*r,r);
   ;	
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;	    setfillstyle(1 , 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;	    floodfill(2*r , getmaxy()-2*r , 11);	
   ;	
	mov	ax,11
	push	ax
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		
   ;		//BOTOOM RIGHT BALL
   ;		setcolor(13);
   ;	
	mov	ax,13
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		circle(getmaxx()-2*r,getmaxy()-2*r,r);
   ;	
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;	    setfillstyle(1 , 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;	    floodfill(getmaxx()-2*r , getmaxy()-2*r , 13);
   ;	
	mov	ax,13
	push	ax
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@Level1Drawing$qv	endp
   ;	
   ;	void Level1Playing()
   ;	
	assume	cs:_TEXT
@Level1Playing$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,70
	push	si
	push	di
   ;	
   ;	{	
   ;	    int k,a,b;
   ;		char ch;
   ;		int flag1=0,flag3=0,flag5=0,flag7=0,flag9=0,flag11=0,flag13=0;
   ;	
	mov	word ptr [bp-6],0
	mov	word ptr [bp-8],0
	mov	word ptr [bp-10],0
	mov	word ptr [bp-12],0
	mov	word ptr [bp-14],0
	mov	word ptr [bp-16],0
	mov	word ptr [bp-18],0
   ;	
   ;		int cnt=0;
   ;	
	mov	word ptr [bp-20],0
   ;	
   ;		double i;
   ;		
   ;		char msg[20];
   ;		double oldpercent=0.0 , percent=0.0;
   ;	
	FLDZ	
	FSTP	qword ptr [bp-36]
	FLDZ	
	FSTP	qword ptr [bp-44]
   ;	
   ;		
   ;		settextstyle(4 , HORIZ_DIR , 1);
   ;	
	mov	ax,1
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,4
	push	ax
	FWAIT	
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;		setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		sprintf(msg,"%lf%",percent);
   ;	
	FLD	qword ptr [bp-44]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	mov	ax,offset DGROUP:s@+297
	push	ax
	FWAIT	
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,12
   ;	
   ;	    outtextxy(21,21,msg);
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,21
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;	
   ;		time(&now);
   ;	
	mov	ax,offset DGROUP:_now
	push	ax
	call	near ptr _time
	pop	cx
   ;	
   ;	    int oldseconds=difftime(now,timer) , seconds=0;
   ;	
	push	word ptr DGROUP:_timer+2
	push	word ptr DGROUP:_timer
	push	word ptr DGROUP:_now+2
	push	word ptr DGROUP:_now
	call	near ptr _difftime
	add	sp,8
	call	near ptr N_FTOL@
	mov	word ptr [bp-46],ax
	mov	word ptr [bp-48],0
	jmp	@7@3650
@7@50:
   ;	
   ;	
   ;		while(cnt!=7)
   ;	    {	
   ;		    for(i=3.05;i>0;i-=0.01)
   ;	
	FLD	qword ptr DGROUP:s@+302
	FSTP	qword ptr [bp-28]
	FWAIT	
	jmp	@7@1826
@7@74:
   ;	
   ;			{
   ;				//how balls percent reveived
   ;				percent = (double)(cnt / 7.0 *100.0);
   ;	
	mov	ax,word ptr [bp-20]
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FDIV	dword ptr DGROUP:s@+318
	FMUL	dword ptr DGROUP:s@+322
	FSTP	qword ptr [bp-44]
   ;	
   ;				if(oldpercent != percent)
   ;	
	FLD	qword ptr [bp-36]
	FCOMP	qword ptr [bp-44]
	FSTSW	word ptr [bp-50]
	FWAIT	
	mov	ax,word ptr [bp-50]
	sahf	
	je	short @7@122
   ;	
   ;				{
   ;					oldpercent = percent;
   ;	
	FLD	qword ptr [bp-44]
	FSTP	qword ptr [bp-36]
   ;	
   ;					setfillstyle(1 , WHITE);
   ;	
	mov	ax,15
	push	ax
	mov	ax,1
	push	ax
	FWAIT	
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;					floodfill(30 , 40 , BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,40
	push	ax
	mov	ax,30
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;					setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;					sprintf(msg , "%lf%" , percent);
   ;	
	FLD	qword ptr [bp-44]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	mov	ax,offset DGROUP:s@+326
	push	ax
	FWAIT	
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,12
   ;	
   ;					outtextxy(21 , 21 , msg);
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,21
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@7@122:
   ;	
   ;				}
   ;				
   ;				//level time
   ;				time(&now);
   ;	
	mov	ax,offset DGROUP:_now
	push	ax
	call	near ptr _time
	pop	cx
   ;	
   ;				seconds = difftime(now,timer);
   ;	
	push	word ptr DGROUP:_timer+2
	push	word ptr DGROUP:_timer
	push	word ptr DGROUP:_now+2
	push	word ptr DGROUP:_now
	call	near ptr _difftime
	add	sp,8
	call	near ptr N_FTOL@
	mov	word ptr [bp-48],ax
   ;	
   ;				if(oldseconds != seconds)
   ;	
	mov	ax,word ptr [bp-46]
	cmp	ax,word ptr [bp-48]
	je	short @7@170
   ;	
   ;				{
   ;	                oldseconds = seconds;				
   ;	
	mov	ax,word ptr [bp-48]
	mov	word ptr [bp-46],ax
   ;	
   ;			    	setfillstyle(1 , WHITE);
   ;	
	mov	ax,15
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			    	floodfill(120 , 70 , BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,70
	push	ax
	mov	ax,120
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		        	setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		        	sprintf(msg , "%d sec" , seconds);
   ;	
	push	word ptr [bp-48]
	mov	ax,offset DGROUP:s@+331
	push	ax
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,6
   ;	
   ;		        	outtextxy(21 , 56 , msg);
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,56
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@7@170:
   ;	
   ;				}
   ;					
   ;			    x=x1+55*cos(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+338
	mov	ax,word ptr DGROUP:_x1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_x,ax
   ;	
   ;		        y=y1+55*sin(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+338
	mov	ax,word ptr DGROUP:_y1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_y,ax
   ;	
   ;			    arrow1=x-10*cos(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	ax,word ptr DGROUP:_x
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow1,ax
   ;	
   ;			    arrow2=y-10*sin(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	ax,word ptr DGROUP:_y
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow2,ax
   ;	
   ;			    arrow3=x-10*cos(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	ax,word ptr DGROUP:_x
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow3,ax
   ;	
   ;			    arrow4=y-10*sin(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	ax,word ptr DGROUP:_y
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow4,ax
   ;	
   ;		        setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		        line(x1,y1+2,x,y);
   ;	
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	mov	ax,word ptr DGROUP:_y1
	inc	ax
	inc	ax
	push	ax
	push	word ptr DGROUP:_x1
	call	far ptr _line
	add	sp,8
   ;	
   ;			    line(x,y,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;			    line(x,y,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;		        delay(10);
   ;	
	mov	ax,10
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;			    if(kbhit())
   ;	
	call	near ptr _kbhit
	or	ax,ax
	je	short @7@218
   ;	
   ;				{
   ;				    ch=getch();		  
   ;	
	call	near ptr _getch
	mov	byte ptr [bp-3],al
@7@218:
   ;	
   ;			    }
   ;			    if(ch==32)
   ;	
	cmp	byte ptr [bp-3],32
	je	@@0
	jmp	@7@1754
@@0:
   ;	
   ;				{
   ;	                setcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			        line(x,y,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;			        line(x,y,arrow3,arrow4);			  
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;			        for (k=1; a!= 0 && a!= getmaxx() && b!= getmaxy() ; k++)
   ;	
	mov	word ptr [bp-2],1
	jmp	@7@1514
@7@266:
   ;	
   ;			    	{
   ;						//level time
   ;			        	time(&now);
   ;	
	mov	ax,offset DGROUP:_now
	push	ax
	call	near ptr _time
	pop	cx
   ;	
   ;			        	seconds = difftime(now,timer);
   ;	
	push	word ptr DGROUP:_timer+2
	push	word ptr DGROUP:_timer
	push	word ptr DGROUP:_now+2
	push	word ptr DGROUP:_now
	call	near ptr _difftime
	add	sp,8
	call	near ptr N_FTOL@
	mov	word ptr [bp-48],ax
   ;	
   ;			        	if(oldseconds != seconds)
   ;	
	mov	ax,word ptr [bp-46]
	cmp	ax,word ptr [bp-48]
	je	short @7@314
   ;	
   ;			        	{
   ;	                        oldseconds = seconds;				
   ;	
	mov	ax,word ptr [bp-48]
	mov	word ptr [bp-46],ax
   ;	
   ;			            	setfillstyle(1 , WHITE);
   ;	
	mov	ax,15
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			            	floodfill(120 , 70 , BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,70
	push	ax
	mov	ax,120
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		                	setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		                	sprintf(msg , "%d sec" , seconds);
   ;	
	push	word ptr [bp-48]
	mov	ax,offset DGROUP:s@+354
	push	ax
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,6
   ;	
   ;		                	outtextxy(21 , 56 , msg);
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,56
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@7@314:
   ;	
   ;			        	}
   ;				
   ;			    	    a=x1+(55+k)*cos(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_x1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	si,ax
   ;	
   ;			    	    b=y1+(55+k)*sin(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_y1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	di,ax
   ;	
   ;			    	    arrow1=a-10*cos(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],si
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow1,ax
   ;	
   ;			            arrow2=b-10*sin(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],di
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow2,ax
   ;	
   ;			            arrow3=a-10*cos(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],si
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow3,ax
   ;	
   ;			            arrow4=b-10*sin(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],di
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow4,ax
   ;	
   ;				        putpixel(a,b,DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	push	di
	push	si
	call	far ptr _putpixel
	add	sp,6
   ;	
   ;				        setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;				        line(a-1,b,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	di
	mov	ax,si
	dec	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			            line(a+1,b,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	di
	mov	ax,si
	inc	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;				        delay(2);
   ;	
	mov	ax,2
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				        setcolor(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;				        line(a-1,b,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	di
	mov	ax,si
	dec	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			            line(a+1,b,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	di
	mov	ax,si
	inc	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;				  
   ;				        delay(5);
   ;	
	mov	ax,5
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				        if((a>=0 && a<=2*r && b>=getmaxy()-250-r && b<=getmaxy()-250+r)&&IsInside(r,getmaxy()-250,r,a,b)==1&&flag1==0)	
   ;	
	or	si,si
	jl	short @7@482
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	cmp	ax,si
	jl	short @7@482
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65286
	cmp	ax,di
	jg	short @7@482
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65286
	cmp	ax,di
	jl	short @7@482
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	push	word ptr DGROUP:_r
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @7@482
	cmp	word ptr [bp-6],0
	jne	short @7@482
   ;	
   ;						{
   ;				      	    fillarea(r,getmaxy()-250,WHITE,1);
   ;	
	mov	ax,1
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	push	word ptr DGROUP:_r
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;				      	    flag1=1;
   ;	
	mov	word ptr [bp-6],1
   ;	
   ;				      	    cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@7@1586
@7@482:
   ;	
   ;	                        break;				  
   ;				        }
   ;				        if((a>=getmaxx()/4-r && a<=getmaxx()/4+r && b>=getmaxy()-200-r && b<=getmaxy()-200+r)&&(IsInside(getmaxx()/4,getmaxy(
   ;	
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@1
	jmp	@7@650
@@1:
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jl	short @7@650
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65336
	cmp	ax,di
	jg	short @7@650
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65336
	cmp	ax,di
	jl	short @7@650
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @7@650
	cmp	word ptr [bp-8],0
	jne	short @7@650
   ;	
   ;						{
   ;				      	    fillarea(getmaxx()/4,getmaxy()-200,WHITE,3);                                             
   ;	
	mov	ax,3
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;				      	    flag3=1;
   ;	
	mov	word ptr [bp-8],1
   ;	
   ;				      	    cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@7@1586
@7@650:
   ;	
   ;				      	    break;
   ;				        }
   ;						
   ;	                    if((a>=getmaxx()/2-r && a<=getmaxx()/2+r && b>=getmaxy()-150-r && b<=getmaxy()-150+r)&&(IsInside(getmaxx()/2
   ;	
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@2
	jmp	@7@818
@@2:
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jl	short @7@818
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65386
	cmp	ax,di
	jg	short @7@818
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65386
	cmp	ax,di
	jl	short @7@818
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65386
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	or	ax,ax
	je	short @7@818
	cmp	word ptr [bp-10],0
	jne	short @7@818
   ;	
   ;						{
   ;					        fillarea(getmaxx()/2,getmaxy()-150,WHITE,5);
   ;	
	mov	ax,5
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65386
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;					        flag5=1;
   ;	
	mov	word ptr [bp-10],1
   ;	
   ;					        cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@7@1586
@7@818:
   ;	
   ;					        break;
   ;				        }
   ;	                    if((a>=getmaxx()/4*3-r && a<=getmaxx()/4*3+r && b>=getmaxy()-200-r && b<=getmaxy()-200+r)&&(IsInside(getmaxx
   ;	
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@3
	jmp	@7@986
@@3:
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jge	@@4
	jmp	@7@986
@@4:
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65336
	cmp	ax,di
	jg	short @7@986
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65336
	cmp	ax,di
	jl	short @7@986
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @7@986
	cmp	word ptr [bp-12],0
	jne	short @7@986
   ;	
   ;						{
   ;				      	    fillarea(getmaxx()/4*3,getmaxy()-200,WHITE,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;				      	    flag7=1;
   ;	
	mov	word ptr [bp-12],1
   ;	
   ;				      	    cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@7@1586
@7@986:
   ;	
   ;				      	    break;
   ;				        }
   ;	                    if((a>=getmaxx()-r-r && a<=getmaxx()-r+r && b>=getmaxy()-250-r && b<=getmaxy()-250+r)&&(IsInside(getmaxx()-r
   ;	
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@5
	jmp	@7@1154
@@5:
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jl	short @7@1154
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65286
	cmp	ax,di
	jg	short @7@1154
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65286
	cmp	ax,di
	jl	short @7@1154
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @7@1154
	cmp	word ptr [bp-14],0
	jne	short @7@1154
   ;	
   ;						{
   ;					        fillarea(getmaxx()-r,getmaxy()-250,WHITE,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;					        flag9=1;
   ;	
	mov	word ptr [bp-14],1
   ;	
   ;					        cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@7@1586
@7@1154:
   ;	
   ;					        break;
   ;				        }
   ;	                    if((a>=(2*r)-r && a<=(2*r)+r && b>=getmaxy()-(2*r)-r && b<=getmaxy()-(2*r)+r)&&(IsInside(2*r,getmaxy()-(2*r)
   ;	
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@6
	jmp	@7@1322
@@6:
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jge	@@7
	jmp	@7@1322
@@7:
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,di
	jg	short @7@1322
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	add	ax,word ptr DGROUP:_r
	cmp	ax,di
	jl	short @7@1322
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @7@1322
	cmp	word ptr [bp-16],0
	jne	short @7@1322
   ;	
   ;						{
   ;					        fillarea(2*r,getmaxy()-(2*r),WHITE,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;					        flag11=1;
   ;	
	mov	word ptr [bp-16],1
   ;	
   ;					        cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@7@1586
@7@1322:
   ;	
   ;					        break;
   ;				        }
   ;	                    if((a>=getmaxx()-(2*r)-r && a<=getmaxx()-(2*r)+r && b>=getmaxy()-(2*r)-r && b<=getmaxy()-(2*r)+r)&&(IsInside
   ;	
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@8
	jmp	@7@1490
@@8:
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jge	@@9
	jmp	@7@1490
@@9:
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,di
	jle	@@10
	jmp	@7@1490
@@10:
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	add	ax,word ptr DGROUP:_r
	cmp	ax,di
	jl	short @7@1490
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @7@1490
	cmp	word ptr [bp-18],0
	jne	short @7@1490
   ;	
   ;						{
   ;					        fillarea(getmaxx()-(2*r),getmaxy()-(2*r),WHITE,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;					        flag13=1;
   ;	
	mov	word ptr [bp-18],1
   ;	
   ;					        cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	short @7@1586
@7@1490:
	inc	word ptr [bp-2]
@7@1514:
	or	si,si
	je	short @7@1586
	call	far ptr _getmaxx
	cmp	ax,si
	je	short @7@1586
	call	far ptr _getmaxy
	cmp	ax,di
	je	@@11
	jmp	@7@266
@@11:
@7@1586:
   ;	
   ;					        break;
   ;				        }			   
   ;			        }
   ;		  	      	a=x1+(55+k)*cos(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_x1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	si,ax
   ;	
   ;			    	b=y1+(55+k)*sin(i);				
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_y1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	di,ax
	jmp	@7@1706
@7@1610:
   ;	
   ;			    	for (; k>=1; k--)
   ;					{	   
   ;						//level time
   ;			        	time(&now);
   ;	
	mov	ax,offset DGROUP:_now
	push	ax
	call	near ptr _time
	pop	cx
   ;	
   ;			        	seconds = difftime(now,timer);
   ;	
	push	word ptr DGROUP:_timer+2
	push	word ptr DGROUP:_timer
	push	word ptr DGROUP:_now+2
	push	word ptr DGROUP:_now
	call	near ptr _difftime
	add	sp,8
	call	near ptr N_FTOL@
	mov	word ptr [bp-48],ax
   ;	
   ;			        	if(oldseconds != seconds)
   ;	
	mov	ax,word ptr [bp-46]
	cmp	ax,word ptr [bp-48]
	je	short @7@1658
   ;	
   ;			        	{
   ;	                        oldseconds = seconds;				
   ;	
	mov	ax,word ptr [bp-48]
	mov	word ptr [bp-46],ax
   ;	
   ;			            	setfillstyle(1 , WHITE);
   ;	
	mov	ax,15
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			            	floodfill(120 , 70 , BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,70
	push	ax
	mov	ax,120
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		                	setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		                	sprintf(msg , "%d sec" , seconds);
   ;	
	push	word ptr [bp-48]
	mov	ax,offset DGROUP:s@+361
	push	ax
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,6
   ;	
   ;		                	outtextxy(21 , 56 , msg);
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,56
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@7@1658:
   ;	
   ;			        	}
   ;						
   ;			        	a=x1+(55+k)*cos(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_x1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	si,ax
   ;	
   ;			        	b=y1+(55+k)*sin(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_y1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	di,ax
   ;	
   ;			        	arrow1=a-10*cos(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],si
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow1,ax
   ;	
   ;			            arrow2=b-10*sin(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],di
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow2,ax
   ;	
   ;			            arrow3=a-10*cos(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],si
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow3,ax
   ;	
   ;			            arrow4=b-10*sin(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],di
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow4,ax
   ;	
   ;			        	putpixel(a,b,WHITE);
   ;	
	mov	ax,15
	push	ax
	push	di
	push	si
	call	far ptr _putpixel
	add	sp,6
   ;	
   ;			        	setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			        	line(a-1,b,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	di
	mov	ax,si
	dec	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			            line(a+1,b,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	di
	mov	ax,si
	inc	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			        	delay(5);
   ;	
	mov	ax,5
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	                    setcolor(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			        	line(a-1,b,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	di
	mov	ax,si
	dec	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			            line(a+1,b,arrow3,arrow4);	 
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	di
	mov	ax,si
	inc	ax
	push	ax
	call	far ptr _line
	add	sp,8
	dec	word ptr [bp-2]
@7@1706:
	cmp	word ptr [bp-2],1
	jl	@@12
	jmp	@7@1610
@@12:
   ;	
   ;			    	}
   ;					ch='a';	  	 							
   ;	
	mov	byte ptr [bp-3],97
@7@1754:
   ;	
   ;			    }
   ;				setcolor(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;				//line(x1,y1+2,x,y);
   ;				line(x1,y1+2,x,y);
   ;	
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	mov	ax,word ptr DGROUP:_y1
	inc	ax
	inc	ax
	push	ax
	push	word ptr DGROUP:_x1
	call	far ptr _line
	add	sp,8
   ;	
   ;				line(x,y,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;				line(x,y,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;		        
   ;				if(cnt==7)
   ;	
	cmp	word ptr [bp-20],7
	jne	short @7@1802
	jmp	short @7@1850
@7@1802:
	FLD	qword ptr DGROUP:s@+310
	FSUBR	qword ptr [bp-28]
	FSTP	qword ptr [bp-28]
@7@1826:
	FLD	qword ptr [bp-28]
	FLDZ	
	FCOMPP
	FSTSW	word ptr [bp-50]
	FWAIT	
	mov	ax,word ptr [bp-50]
	sahf	
	jae	@@13
	jmp	@7@74
@@13:
@7@1850:
   ;	
   ;				    break;
   ;			}	
   ;			
   ;	
   ;			
   ;		    for(i=0;i<3.05;i=i+0.01)
   ;	
	FLDZ	
	FSTP	qword ptr [bp-28]
	FWAIT	
	jmp	@7@3626
@7@1874:
   ;	
   ;			{  	
   ;				//how balls percent reveived
   ;				percent = (double)(cnt / 7.0 *100.0);
   ;	
	mov	ax,word ptr [bp-20]
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FDIV	dword ptr DGROUP:s@+318
	FMUL	dword ptr DGROUP:s@+322
	FSTP	qword ptr [bp-44]
   ;	
   ;				if(oldpercent != percent)
   ;	
	FLD	qword ptr [bp-36]
	FCOMP	qword ptr [bp-44]
	FSTSW	word ptr [bp-50]
	FWAIT	
	mov	ax,word ptr [bp-50]
	sahf	
	je	short @7@1922
   ;	
   ;				{
   ;					oldpercent = percent;
   ;	
	FLD	qword ptr [bp-44]
	FSTP	qword ptr [bp-36]
   ;	
   ;					setfillstyle(1 , WHITE);
   ;	
	mov	ax,15
	push	ax
	mov	ax,1
	push	ax
	FWAIT	
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;					floodfill(30 , 30 , BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,30
	push	ax
	mov	ax,30
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;					setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;					sprintf(msg , "%lf%" , percent);
   ;	
	FLD	qword ptr [bp-44]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	mov	ax,offset DGROUP:s@+368
	push	ax
	FWAIT	
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,12
   ;	
   ;					outtextxy(21 , 21 , msg);	
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,21
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@7@1922:
   ;	
   ;				}
   ;				
   ;				//level time
   ;				time(&now);
   ;	
	mov	ax,offset DGROUP:_now
	push	ax
	call	near ptr _time
	pop	cx
   ;	
   ;				seconds = difftime(now,timer);
   ;	
	push	word ptr DGROUP:_timer+2
	push	word ptr DGROUP:_timer
	push	word ptr DGROUP:_now+2
	push	word ptr DGROUP:_now
	call	near ptr _difftime
	add	sp,8
	call	near ptr N_FTOL@
	mov	word ptr [bp-48],ax
   ;	
   ;				if(oldseconds != seconds)
   ;	
	mov	ax,word ptr [bp-46]
	cmp	ax,word ptr [bp-48]
	je	short @7@1970
   ;	
   ;				{
   ;	                oldseconds = seconds;				
   ;	
	mov	ax,word ptr [bp-48]
	mov	word ptr [bp-46],ax
   ;	
   ;			    	setfillstyle(1 , WHITE);
   ;	
	mov	ax,15
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			    	floodfill(120 , 70 , BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,70
	push	ax
	mov	ax,120
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		        	setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		        	sprintf(msg , "%d sec" , seconds);
   ;	
	push	word ptr [bp-48]
	mov	ax,offset DGROUP:s@+373
	push	ax
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,6
   ;	
   ;		        	outtextxy(21 , 56 , msg);
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,56
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@7@1970:
   ;	
   ;				}
   ;				
   ;				//aroow code
   ;				x=x1+55*cos(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+338
	mov	ax,word ptr DGROUP:_x1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_x,ax
   ;	
   ;		        y=y1+55*sin(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+338
	mov	ax,word ptr DGROUP:_y1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_y,ax
   ;	
   ;			    arrow1=x-10*cos(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	ax,word ptr DGROUP:_x
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow1,ax
   ;	
   ;			    arrow2=y-10*sin(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	ax,word ptr DGROUP:_y
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow2,ax
   ;	
   ;			    arrow3=x-10*cos(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	ax,word ptr DGROUP:_x
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow3,ax
   ;	
   ;			    arrow4=y-10*sin(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	ax,word ptr DGROUP:_y
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow4,ax
   ;	
   ;		        setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		        line(x1,y1+2,x,y);
   ;	
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	mov	ax,word ptr DGROUP:_y1
	inc	ax
	inc	ax
	push	ax
	push	word ptr DGROUP:_x1
	call	far ptr _line
	add	sp,8
   ;	
   ;				//top of the arrow \/
   ;			    line(x,y,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;			    line(x,y,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;		        delay(10);
   ;	
	mov	ax,10
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;			    if(kbhit())
   ;	
	call	near ptr _kbhit
	or	ax,ax
	je	short @7@2018
   ;	
   ;				{
   ;			  	    ch=getch();		  
   ;	
	call	near ptr _getch
	mov	byte ptr [bp-3],al
@7@2018:
   ;	
   ;			    }
   ;			    if(ch==32)
   ;	
	cmp	byte ptr [bp-3],32
	je	@@14
	jmp	@7@3554
@@14:
   ;	
   ;				{
   ;	                setcolor(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			        line(x,y,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;			        line(x,y,arrow3,arrow4);			  
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;			        for (k=1; a!= 0 && a!= getmaxx() && b!= getmaxy() ; k++)
   ;	
	mov	word ptr [bp-2],1
	jmp	@7@3314
@7@2066:
   ;	
   ;					{
   ;			        	//level time
   ;			        	time(&now);
   ;	
	mov	ax,offset DGROUP:_now
	push	ax
	call	near ptr _time
	pop	cx
   ;	
   ;			        	seconds = difftime(now,timer);
   ;	
	push	word ptr DGROUP:_timer+2
	push	word ptr DGROUP:_timer
	push	word ptr DGROUP:_now+2
	push	word ptr DGROUP:_now
	call	near ptr _difftime
	add	sp,8
	call	near ptr N_FTOL@
	mov	word ptr [bp-48],ax
   ;	
   ;			        	if(oldseconds != seconds)
   ;	
	mov	ax,word ptr [bp-46]
	cmp	ax,word ptr [bp-48]
	je	short @7@2114
   ;	
   ;			        	{
   ;	                        oldseconds = seconds;				
   ;	
	mov	ax,word ptr [bp-48]
	mov	word ptr [bp-46],ax
   ;	
   ;			            	setfillstyle(1 , WHITE);
   ;	
	mov	ax,15
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			            	floodfill(120 , 70 , BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,70
	push	ax
	mov	ax,120
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		                	setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		                	sprintf(msg , "%d sec" , seconds);
   ;	
	push	word ptr [bp-48]
	mov	ax,offset DGROUP:s@+380
	push	ax
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,6
   ;	
   ;		                	outtextxy(21 , 56 , msg);
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,56
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@7@2114:
   ;	
   ;			        	}
   ;				        // arrow code
   ;				        a=x1+(55+k)*cos(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_x1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	si,ax
   ;	
   ;				        b=y1+(55+k)*sin(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_y1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	di,ax
   ;	
   ;				        arrow1=a-10*cos(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],si
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow1,ax
   ;	
   ;			            arrow2=b-10*sin(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],di
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow2,ax
   ;	
   ;			            arrow3=a-10*cos(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],si
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow3,ax
   ;	
   ;			            arrow4=b-10*sin(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],di
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow4,ax
   ;	
   ;						//arrow get longer
   ;				        putpixel(a,b,DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	push	di
	push	si
	call	far ptr _putpixel
	add	sp,6
   ;	
   ;				        setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;						//drawing new top arrow
   ;				        line(a-1,b,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	di
	mov	ax,si
	dec	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			            line(a+1,b,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	di
	mov	ax,si
	inc	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;				        delay(2);
   ;	
	mov	ax,2
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;						//romove old top arrow
   ;				        setcolor(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;				        line(a-1,b,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	di
	mov	ax,si
	dec	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			            line(a+1,b,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	di
	mov	ax,si
	inc	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;				  
   ;				        // check if arrow touch any of the balls
   ;				  	    delay(5);
   ;	
	mov	ax,5
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				        if((a>=0 && a<=2*r && b>=getmaxy()-250-r && b<=getmaxy()-250+r)&&IsInside(r,getmaxy()-250,r,a,b)==1&&flag1==0)	
   ;	
	or	si,si
	jl	short @7@2282
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	cmp	ax,si
	jl	short @7@2282
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65286
	cmp	ax,di
	jg	short @7@2282
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65286
	cmp	ax,di
	jl	short @7@2282
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	push	word ptr DGROUP:_r
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @7@2282
	cmp	word ptr [bp-6],0
	jne	short @7@2282
   ;	
   ;						{
   ;				      	    fillarea(r,getmaxy()-250,WHITE,1);
   ;	
	mov	ax,1
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	push	word ptr DGROUP:_r
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;				      	    flag1=1;
   ;	
	mov	word ptr [bp-6],1
   ;	
   ;				      	    cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@7@3386
@7@2282:
   ;	
   ;	                        break;				  
   ;				        }
   ;				        if((a>=getmaxx()/4-r && a<=getmaxx()/4+r && b>=getmaxy()-200-r && b<=getmaxy()-200+r)&&(IsInside(getmaxx()/4,getmaxy(
   ;	
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@15
	jmp	@7@2450
@@15:
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jl	short @7@2450
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65336
	cmp	ax,di
	jg	short @7@2450
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65336
	cmp	ax,di
	jl	short @7@2450
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @7@2450
	cmp	word ptr [bp-8],0
	jne	short @7@2450
   ;	
   ;						{
   ;				      	    fillarea(getmaxx()/4,getmaxy()-200,WHITE,3);                                             
   ;	
	mov	ax,3
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;				      	    flag3=1;
   ;	
	mov	word ptr [bp-8],1
   ;	
   ;				      	    cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@7@3386
@7@2450:
   ;	
   ;				      	    break;
   ;				        }
   ;						
   ;	                    if((a>=getmaxx()/2-r && a<=getmaxx()/2+r && b>=getmaxy()-150-r && b<=getmaxy()-150+r)&&(IsInside(getmaxx()/2
   ;	
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@16
	jmp	@7@2618
@@16:
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jl	short @7@2618
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65386
	cmp	ax,di
	jg	short @7@2618
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65386
	cmp	ax,di
	jl	short @7@2618
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65386
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	or	ax,ax
	je	short @7@2618
	cmp	word ptr [bp-10],0
	jne	short @7@2618
   ;	
   ;						{
   ;					        fillarea(getmaxx()/2,getmaxy()-150,WHITE,5);
   ;	
	mov	ax,5
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65386
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;					        flag5=1;
   ;	
	mov	word ptr [bp-10],1
   ;	
   ;					        cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@7@3386
@7@2618:
   ;	
   ;					        break;
   ;				        }
   ;	                    if((a>=getmaxx()/4*3-r && a<=getmaxx()/4*3+r && b>=getmaxy()-200-r && b<=getmaxy()-200+r)&&(IsInside(getmaxx
   ;	
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@17
	jmp	@7@2786
@@17:
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jge	@@18
	jmp	@7@2786
@@18:
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65336
	cmp	ax,di
	jg	short @7@2786
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65336
	cmp	ax,di
	jl	short @7@2786
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @7@2786
	cmp	word ptr [bp-12],0
	jne	short @7@2786
   ;	
   ;						{
   ;				      	    fillarea(getmaxx()/4*3,getmaxy()-200,WHITE,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;				      	    flag7=1;
   ;	
	mov	word ptr [bp-12],1
   ;	
   ;				      	    cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@7@3386
@7@2786:
   ;	
   ;				      	    break;
   ;				        }
   ;	                    if((a>=getmaxx()-r-r && a<=getmaxx()-r+r && b>=getmaxy()-250-r && b<=getmaxy()-250+r)&&(IsInside(getmaxx()-r
   ;	
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@19
	jmp	@7@2954
@@19:
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jl	short @7@2954
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65286
	cmp	ax,di
	jg	short @7@2954
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65286
	cmp	ax,di
	jl	short @7@2954
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @7@2954
	cmp	word ptr [bp-14],0
	jne	short @7@2954
   ;	
   ;						{
   ;					        fillarea(getmaxx()-r,getmaxy()-250,WHITE,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;					        flag9=1;
   ;	
	mov	word ptr [bp-14],1
   ;	
   ;					        cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@7@3386
@7@2954:
   ;	
   ;					        break;
   ;				        }
   ;	                    if((a>=(2*r)-r && a<=(2*r)+r && b>=getmaxy()-(2*r)-r && b<=getmaxy()-(2*r)+r)&&(IsInside(2*r,getmaxy()-(2*r)
   ;	
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@20
	jmp	@7@3122
@@20:
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jge	@@21
	jmp	@7@3122
@@21:
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,di
	jg	short @7@3122
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	add	ax,word ptr DGROUP:_r
	cmp	ax,di
	jl	short @7@3122
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @7@3122
	cmp	word ptr [bp-16],0
	jne	short @7@3122
   ;	
   ;						{
   ;					        fillarea(2*r,getmaxy()-(2*r),WHITE,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;					        flag11=1;
   ;	
	mov	word ptr [bp-16],1
   ;	
   ;					        cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@7@3386
@7@3122:
   ;	
   ;					        break;
   ;				        }
   ;	                    if((a>=getmaxx()-(2*r)-r && a<=getmaxx()-(2*r)+r && b>=getmaxy()-(2*r)-r && b<=getmaxy()-(2*r)+r)&&(IsInside
   ;	
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@22
	jmp	@7@3290
@@22:
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jge	@@23
	jmp	@7@3290
@@23:
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,di
	jle	@@24
	jmp	@7@3290
@@24:
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	add	ax,word ptr DGROUP:_r
	cmp	ax,di
	jl	short @7@3290
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @7@3290
	cmp	word ptr [bp-18],0
	jne	short @7@3290
   ;	
   ;						{
   ;					        fillarea(getmaxx()-(2*r),getmaxy()-(2*r),WHITE,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;					        flag13=1;
   ;	
	mov	word ptr [bp-18],1
   ;	
   ;					        cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	short @7@3386
@7@3290:
	inc	word ptr [bp-2]
@7@3314:
	or	si,si
	je	short @7@3386
	call	far ptr _getmaxx
	cmp	ax,si
	je	short @7@3386
	call	far ptr _getmaxy
	cmp	ax,di
	je	@@25
	jmp	@7@2066
@@25:
@7@3386:
   ;	
   ;					        break;
   ;				        }	
   ;			        }
   ;		  	     	a=x1+(55+k)*cos(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_x1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	si,ax
   ;	
   ;			    	b=y1+(55+k)*sin(i);				
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_y1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	di,ax
	jmp	@7@3506
@7@3410:
   ;	
   ;			    	for (; k>=1; k--)
   ;					{	   
   ;						//level time
   ;			        	time(&now);
   ;	
	mov	ax,offset DGROUP:_now
	push	ax
	call	near ptr _time
	pop	cx
   ;	
   ;			        	seconds = difftime(now,timer);
   ;	
	push	word ptr DGROUP:_timer+2
	push	word ptr DGROUP:_timer
	push	word ptr DGROUP:_now+2
	push	word ptr DGROUP:_now
	call	near ptr _difftime
	add	sp,8
	call	near ptr N_FTOL@
	mov	word ptr [bp-48],ax
   ;	
   ;			        	if(oldseconds != seconds)
   ;	
	mov	ax,word ptr [bp-46]
	cmp	ax,word ptr [bp-48]
	je	short @7@3458
   ;	
   ;			        	{
   ;	                        oldseconds = seconds;				
   ;	
	mov	ax,word ptr [bp-48]
	mov	word ptr [bp-46],ax
   ;	
   ;			            	setfillstyle(1 , WHITE);
   ;	
	mov	ax,15
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			            	floodfill(120 , 70 , BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,70
	push	ax
	mov	ax,120
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		                	setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		                	sprintf(msg , "%d sec" , seconds);
   ;	
	push	word ptr [bp-48]
	mov	ax,offset DGROUP:s@+387
	push	ax
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,6
   ;	
   ;		                	outtextxy(21 , 56 , msg);
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,56
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@7@3458:
   ;	
   ;			        	}
   ;						
   ;			        	a=x1+(55+k)*cos(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_x1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	si,ax
   ;	
   ;			        	b=y1+(55+k)*sin(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_y1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	di,ax
   ;	
   ;			        	arrow1=a-10*cos(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],si
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow1,ax
   ;	
   ;			            arrow2=b-10*sin(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],di
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow2,ax
   ;	
   ;			            arrow3=a-10*cos(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],si
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow3,ax
   ;	
   ;			            arrow4=b-10*sin(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],di
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow4,ax
   ;	
   ;			        	putpixel(a,b,WHITE);
   ;	
	mov	ax,15
	push	ax
	push	di
	push	si
	call	far ptr _putpixel
	add	sp,6
   ;	
   ;			        	setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			        	line(a-1,b,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	di
	mov	ax,si
	dec	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			            line(a+1,b,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	di
	mov	ax,si
	inc	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			        	delay(5);
   ;	
	mov	ax,5
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	                    setcolor(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			        	line(a-1,b,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	di
	mov	ax,si
	dec	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			            line(a+1,b,arrow3,arrow4);	 
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	di
	mov	ax,si
	inc	ax
	push	ax
	call	far ptr _line
	add	sp,8
	dec	word ptr [bp-2]
@7@3506:
	cmp	word ptr [bp-2],1
	jl	@@26
	jmp	@7@3410
@@26:
   ;	
   ;			    	}
   ;					ch='a';	  	 							
   ;	
	mov	byte ptr [bp-3],97
@7@3554:
   ;	
   ;				}
   ;				setcolor(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;				line(x1,y1+2,x,y);
   ;	
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	mov	ax,word ptr DGROUP:_y1
	inc	ax
	inc	ax
	push	ax
	push	word ptr DGROUP:_x1
	call	far ptr _line
	add	sp,8
   ;	
   ;				line(x,y,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;				line(x,y,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;		        
   ;				if(cnt==7)
   ;	
	cmp	word ptr [bp-20],7
	jne	short @7@3602
	jmp	short @7@3650
@7@3602:
	FLD	qword ptr [bp-28]
	FADD	qword ptr DGROUP:s@+310
	FSTP	qword ptr [bp-28]
	FWAIT	
@7@3626:
	FLD	qword ptr [bp-28]
	FCOMP	qword ptr DGROUP:s@+302
	FSTSW	word ptr [bp-50]
	FWAIT	
	mov	ax,word ptr [bp-50]
	sahf	
	jae	@@27
	jmp	@7@1874
@@27:
@7@3650:
	cmp	word ptr [bp-20],7
	je	@@28
	jmp	@7@50
@@28:
   ;	
   ;				    break;
   ;	        }	
   ;		}
   ;	    cleardevice();
   ;	
	call	far ptr _cleardevice
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@Level1Playing$qv	endp
   ;	
   ;	void Level2Drawing()
   ;	
	assume	cs:_TEXT
@Level2Drawing$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;	    settextstyle(1 , HORIZ_DIR , 3);
   ;	
	mov	ax,3
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;	    outtextxy(getmaxx()-100 , 20 , "LEVEL.2");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+394
	push	ax
	mov	ax,20
	push	ax
	call	far ptr _getmaxx
	add	ax,65436
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;	    rectangle(getmaxx()-110 , 20 , getmaxx()-10 , 50);
   ;	
	mov	ax,50
	push	ax
	call	far ptr _getmaxx
	add	ax,65526
	push	ax
	mov	ax,20
	push	ax
	call	far ptr _getmaxx
	add	ax,65426
	push	ax
	call	far ptr _rectangle
	add	sp,8
   ;	
   ;	
   ;		setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		rectangle(getmaxx()/2-40,0,getmaxx()/2+40,25);
   ;	
	mov	ax,25
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,40
	push	ax
	xor	ax,ax
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65496
	push	ax
	call	far ptr _rectangle
	add	sp,8
   ;	
   ;		setfillstyle(1 , DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;		floodfill(getmaxx()/2 , 10 , DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	mov	ax,10
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		
   ;		//game percent panel
   ;		setcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		rectangle(10 , 20 , 135 , 50);
   ;	
	mov	ax,50
	push	ax
	mov	ax,135
	push	ax
	mov	ax,20
	push	ax
	mov	ax,10
	push	ax
	call	far ptr _rectangle
	add	sp,8
   ;	
   ;		
   ;		//time panel
   ;		setcolor(BLUE);
   ;	
	mov	ax,1
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		rectangle(10 , 55 , 135 , 85);
   ;	
	mov	ax,85
	push	ax
	mov	ax,135
	push	ax
	mov	ax,55
	push	ax
	mov	ax,10
	push	ax
	call	far ptr _rectangle
	add	sp,8
   ;	
   ;		
   ;		//LEFT BALL
   ;		setcolor(1);
   ;	
	mov	ax,1
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		circle(r,getmaxy()-250,r);
   ;	
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	push	word ptr DGROUP:_r
	call	far ptr _circle
	add	sp,6
   ;	
   ;	    setfillstyle(1 , 1);
   ;	
	mov	ax,1
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;	    floodfill(r , getmaxy()-250 , 1);	
   ;	
	mov	ax,1
	push	ax
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	push	word ptr DGROUP:_r
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		
   ;		//LEFT CENTER BALL
   ;		setcolor(3);
   ;	
	mov	ax,3
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		circle(getmaxx()/4 , getmaxy()-200,r);
   ;	
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;	    setfillstyle(1 , 3);
   ;	
	mov	ax,3
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;	    floodfill(getmaxx()/4 , getmaxy()-200 , 3);	
   ;	
	mov	ax,3
	push	ax
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		
   ;		//CENTER BALL 
   ;		setcolor(5);
   ;	
	mov	ax,5
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		circle(getmaxx()/2 , getmaxy()-150,r);
   ;	
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65386
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;	    setfillstyle(1 , 5);
   ;	
	mov	ax,5
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;	    floodfill(getmaxx()/2 , getmaxy()-150 , 5);	
   ;	
	mov	ax,5
	push	ax
	call	far ptr _getmaxy
	add	ax,65386
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		
   ;		//CENTER RIGHT BALL
   ;		setcolor(7);
   ;	
	mov	ax,7
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		circle((getmaxx()/4)*3,getmaxy()-200,r);
   ;	
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;	    setfillstyle(1 , 7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;	    floodfill((getmaxx()/4)*3 , getmaxy()-200 , 7);	
   ;	
	mov	ax,7
	push	ax
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		
   ;		//RIGHT BALL
   ;		setcolor(9);
   ;	
	mov	ax,9
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		circle(getmaxx()-r,getmaxy()-250,r);
   ;	
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;	    setfillstyle(1 , 9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;	    floodfill(getmaxx()-r , getmaxy()-250 , 9);	
   ;	
	mov	ax,9
	push	ax
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		
   ;		//BOTTOM LEFT BALL
   ;		setcolor(11);
   ;	
	mov	ax,11
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		circle(2*r,getmaxy()-2*r,r);
   ;	
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;	    setfillstyle(1 , 11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;	    floodfill(2*r , getmaxy()-2*r , 11);	
   ;	
	mov	ax,11
	push	ax
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		
   ;		//BOTOOM RIGHT BALL
   ;		setcolor(13);
   ;	
	mov	ax,13
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		circle(getmaxx()-2*r,getmaxy()-2*r,r);
   ;	
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	far ptr _circle
	add	sp,6
   ;	
   ;	    setfillstyle(1 , 13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;	    floodfill(getmaxx()-2*r , getmaxy()-2*r , 13);
   ;	
	mov	ax,13
	push	ax
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@Level2Drawing$qv	endp
   ;	
   ;	void Level2Playing()
   ;	
	assume	cs:_TEXT
@Level2Playing$qv	proc	near
	push	bp
	mov	bp,sp
	sub	sp,70
	push	si
	push	di
   ;	
   ;	{
   ;		int k,a,b;
   ;		char ch;
   ;		int flag1=0,flag3=0,flag5=0,flag7=0,flag9=0,flag11=0,flag13=0;
   ;	
	mov	word ptr [bp-6],0
	mov	word ptr [bp-8],0
	mov	word ptr [bp-10],0
	mov	word ptr [bp-12],0
	mov	word ptr [bp-14],0
	mov	word ptr [bp-16],0
	mov	word ptr [bp-18],0
   ;	
   ;		int cnt=0;
   ;	
	mov	word ptr [bp-20],0
   ;	
   ;		double i;
   ;	
   ;		char msg[20];
   ;		double oldpercent=0.0 , percent=0.0;
   ;	
	FLDZ	
	FSTP	qword ptr [bp-36]
	FLDZ	
	FSTP	qword ptr [bp-44]
   ;	
   ;		
   ;		settextstyle(4 , HORIZ_DIR , 1);
   ;	
	mov	ax,1
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,4
	push	ax
	FWAIT	
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;		setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		sprintf(msg,"%lf%",percent);
   ;	
	FLD	qword ptr [bp-44]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	mov	ax,offset DGROUP:s@+402
	push	ax
	FWAIT	
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,12
   ;	
   ;	    outtextxy(21,21,msg);
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,21
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;		
   ;		time(&now);
   ;	
	mov	ax,offset DGROUP:_now
	push	ax
	call	near ptr _time
	pop	cx
   ;	
   ;	    int seconds=0 , oldseconds=difftime(now,timer);	
   ;	
	mov	word ptr [bp-46],0
	push	word ptr DGROUP:_timer+2
	push	word ptr DGROUP:_timer
	push	word ptr DGROUP:_now+2
	push	word ptr DGROUP:_now
	call	near ptr _difftime
	add	sp,8
	call	near ptr N_FTOL@
	mov	word ptr [bp-48],ax
	jmp	@9@3650
@9@50:
   ;	
   ;		
   ;		while(cnt!=7)
   ;		{
   ;		    for(i=3.05;i>0;i=i-0.01)
   ;	
	FLD	qword ptr DGROUP:s@+302
	FSTP	qword ptr [bp-28]
	FWAIT	
	jmp	@9@1826
@9@74:
   ;	
   ;			{	
   ;				//how balls percent reveived
   ;				percent = (double)(cnt / 7.0 *100.0);
   ;	
	mov	ax,word ptr [bp-20]
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FDIV	dword ptr DGROUP:s@+318
	FMUL	dword ptr DGROUP:s@+322
	FSTP	qword ptr [bp-44]
   ;	
   ;				if(oldpercent != percent)
   ;	
	FLD	qword ptr [bp-36]
	FCOMP	qword ptr [bp-44]
	FSTSW	word ptr [bp-50]
	FWAIT	
	mov	ax,word ptr [bp-50]
	sahf	
	je	short @9@122
   ;	
   ;				{
   ;					oldpercent = percent;
   ;	
	FLD	qword ptr [bp-44]
	FSTP	qword ptr [bp-36]
   ;	
   ;					setfillstyle(1 , WHITE);
   ;	
	mov	ax,15
	push	ax
	mov	ax,1
	push	ax
	FWAIT	
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;					floodfill(30 , 30 , BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,30
	push	ax
	mov	ax,30
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;					setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;					sprintf(msg , "%lf%" , percent);
   ;	
	FLD	qword ptr [bp-44]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	mov	ax,offset DGROUP:s@+415
	push	ax
	FWAIT	
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,12
   ;	
   ;					outtextxy(21 , 21 , msg);
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,21
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@9@122:
   ;	
   ;				}
   ;				
   ;				//level time
   ;				time(&now);
   ;	
	mov	ax,offset DGROUP:_now
	push	ax
	call	near ptr _time
	pop	cx
   ;	
   ;				seconds = difftime(now,timer);
   ;	
	push	word ptr DGROUP:_timer+2
	push	word ptr DGROUP:_timer
	push	word ptr DGROUP:_now+2
	push	word ptr DGROUP:_now
	call	near ptr _difftime
	add	sp,8
	call	near ptr N_FTOL@
	mov	word ptr [bp-46],ax
   ;	
   ;				if(oldseconds != seconds)
   ;	
	mov	ax,word ptr [bp-48]
	cmp	ax,word ptr [bp-46]
	je	short @9@170
   ;	
   ;				{
   ;	                oldseconds = seconds;				
   ;	
	mov	ax,word ptr [bp-46]
	mov	word ptr [bp-48],ax
   ;	
   ;			    	setfillstyle(1 , WHITE);
   ;	
	mov	ax,15
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			    	floodfill(120 , 70 , BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,70
	push	ax
	mov	ax,120
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		        	setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		        	sprintf(msg , "%d sec" , seconds);
   ;	
	push	word ptr [bp-46]
	mov	ax,offset DGROUP:s@+420
	push	ax
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,6
   ;	
   ;		        	outtextxy(21 , 56 , msg);
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,56
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@9@170:
   ;	
   ;				}
   ;				
   ;				//arrow 
   ;			    x=x1+55*cos(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+338
	mov	ax,word ptr DGROUP:_x1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_x,ax
   ;	
   ;		        y=y1+55*sin(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+338
	mov	ax,word ptr DGROUP:_y1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_y,ax
   ;	
   ;			    arrow1=x-10*cos(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	ax,word ptr DGROUP:_x
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow1,ax
   ;	
   ;			    arrow2=y-10*sin(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	ax,word ptr DGROUP:_y
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow2,ax
   ;	
   ;			    arrow3=x-10*cos(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	ax,word ptr DGROUP:_x
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow3,ax
   ;	
   ;			    arrow4=y-10*sin(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	ax,word ptr DGROUP:_y
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow4,ax
   ;	
   ;		        setcolor(GREEN);
   ;	
	mov	ax,2
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		        //arrow lines
   ;				line(x1,y1+2,x,y);
   ;	
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	mov	ax,word ptr DGROUP:_y1
	inc	ax
	inc	ax
	push	ax
	push	word ptr DGROUP:_x1
	call	far ptr _line
	add	sp,8
   ;	
   ;			    //the top of the arrow
   ;				line(x,y,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;			    line(x,y,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;		        delay(5);
   ;	
	mov	ax,5
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;			    if(kbhit())
   ;	
	call	near ptr _kbhit
	or	ax,ax
	je	short @9@218
   ;	
   ;				{
   ;				    ch=getch();		  
   ;	
	call	near ptr _getch
	mov	byte ptr [bp-3],al
@9@218:
   ;	
   ;			    }
   ;			  
   ;			    if(ch==32)
   ;	
	cmp	byte ptr [bp-3],32
	je	@@29
	jmp	@9@1754
@@29:
   ;	
   ;				{
   ;	                setcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			        line(x,y,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;			        line(x,y,arrow3,arrow4);			  
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;			        for (k=1; a!= 0 && a!= getmaxx() && b!= getmaxy(); k++)
   ;	
	mov	word ptr [bp-2],1
	jmp	@9@1514
@9@266:
   ;	
   ;					{		
   ;				
   ;			        	//level time
   ;			        	time(&now);
   ;	
	mov	ax,offset DGROUP:_now
	push	ax
	call	near ptr _time
	pop	cx
   ;	
   ;			        	seconds = difftime(now,timer);
   ;	
	push	word ptr DGROUP:_timer+2
	push	word ptr DGROUP:_timer
	push	word ptr DGROUP:_now+2
	push	word ptr DGROUP:_now
	call	near ptr _difftime
	add	sp,8
	call	near ptr N_FTOL@
	mov	word ptr [bp-46],ax
   ;	
   ;			        	if(oldseconds != seconds)
   ;	
	mov	ax,word ptr [bp-48]
	cmp	ax,word ptr [bp-46]
	je	short @9@314
   ;	
   ;			        	{
   ;	                        oldseconds = seconds;				
   ;	
	mov	ax,word ptr [bp-46]
	mov	word ptr [bp-48],ax
   ;	
   ;			            	setfillstyle(1 , WHITE);
   ;	
	mov	ax,15
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			            	floodfill(120 , 70 , BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,70
	push	ax
	mov	ax,120
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		                	setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		                	sprintf(msg , "%d sec" , seconds);
   ;	
	push	word ptr [bp-46]
	mov	ax,offset DGROUP:s@+427
	push	ax
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,6
   ;	
   ;		                	outtextxy(21 , 56 , msg);
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,56
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@9@314:
   ;	
   ;			        	}		
   ;						
   ;				        a=x1+(55+k)*cos(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_x1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	si,ax
   ;	
   ;				        b=y1+(55+k)*sin(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_y1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	di,ax
   ;	
   ;				        arrow1=a-10*cos(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],si
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow1,ax
   ;	
   ;			            arrow2=b-10*sin(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],di
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow2,ax
   ;	
   ;			            arrow3=a-10*cos(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],si
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow3,ax
   ;	
   ;			            arrow4=b-10*sin(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],di
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow4,ax
   ;	
   ;				        putpixel(a,b,GREEN);
   ;	
	mov	ax,2
	push	ax
	push	di
	push	si
	call	far ptr _putpixel
	add	sp,6
   ;	
   ;				        setcolor(GREEN);
   ;	
	mov	ax,2
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;				        line(a-1,b,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	di
	mov	ax,si
	dec	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			            line(a+1,b,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	di
	mov	ax,si
	inc	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;				        delay(2);
   ;	
	mov	ax,2
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				        setcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;				        line(a-1,b,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	di
	mov	ax,si
	dec	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			            line(a+1,b,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	di
	mov	ax,si
	inc	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;				  
   ;				        delay(5);
   ;	
	mov	ax,5
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				        if((a>=r-r && a<=r+r && b>=getmaxy()-250-r && b<=getmaxy()-250+r)&&IsInside(r,getmaxy()-250,r,a,b)==1&&flag1==0)	
   ;	
	mov	ax,word ptr DGROUP:_r
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jg	short @9@482
	mov	ax,word ptr DGROUP:_r
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jl	short @9@482
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65286
	cmp	ax,di
	jg	short @9@482
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65286
	cmp	ax,di
	jl	short @9@482
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	push	word ptr DGROUP:_r
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @9@482
	cmp	word ptr [bp-6],0
	jne	short @9@482
   ;	
   ;						{
   ;				      	    fillarea(r,getmaxy()-250,WHITE,1);
   ;	
	mov	ax,1
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	push	word ptr DGROUP:_r
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;				      	    flag1=1;
   ;	
	mov	word ptr [bp-6],1
   ;	
   ;				      	    cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@9@1586
@9@482:
   ;	
   ;	                        break;				  
   ;				        }
   ;				        if((a>=getmaxx()/4-r && a<=getmaxx()/4+r && b>=getmaxy()-200-r && b<=getmaxy()-200+r)&&(IsInside(getmaxx()/4,getmaxy(
   ;	
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@30
	jmp	@9@650
@@30:
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jl	short @9@650
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65336
	cmp	ax,di
	jg	short @9@650
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65336
	cmp	ax,di
	jl	short @9@650
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @9@650
	cmp	word ptr [bp-8],0
	jne	short @9@650
   ;	
   ;						{
   ;				      	    fillarea(getmaxx()/4,getmaxy()-200,WHITE,3);                                             
   ;	
	mov	ax,3
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;				      	    flag3=1;
   ;	
	mov	word ptr [bp-8],1
   ;	
   ;				      	    cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@9@1586
@9@650:
   ;	
   ;				      	    break;
   ;				        }
   ;						
   ;	                    if((a>=getmaxx()/2-r && a<=getmaxx()/2+r && b>=getmaxy()-150-r && b<=getmaxy()-150+r)&&(IsInside(getmaxx()/2
   ;	
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@31
	jmp	@9@818
@@31:
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jl	short @9@818
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65386
	cmp	ax,di
	jg	short @9@818
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65386
	cmp	ax,di
	jl	short @9@818
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65386
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	or	ax,ax
	je	short @9@818
	cmp	word ptr [bp-10],0
	jne	short @9@818
   ;	
   ;						{
   ;					        fillarea(getmaxx()/2,getmaxy()-150,WHITE,5);
   ;	
	mov	ax,5
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65386
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;					        flag5=1;
   ;	
	mov	word ptr [bp-10],1
   ;	
   ;					        cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@9@1586
@9@818:
   ;	
   ;					        break;
   ;				        }
   ;	                    if((a>=getmaxx()/4*3-r && a<=getmaxx()/4*3+r && b>=getmaxy()-200-r && b<=getmaxy()-200+r)&&(IsInside(getmaxx
   ;	
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@32
	jmp	@9@986
@@32:
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jge	@@33
	jmp	@9@986
@@33:
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65336
	cmp	ax,di
	jg	short @9@986
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65336
	cmp	ax,di
	jl	short @9@986
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @9@986
	cmp	word ptr [bp-12],0
	jne	short @9@986
   ;	
   ;						{
   ;				      	    fillarea(getmaxx()/4*3,getmaxy()-200,WHITE,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;				      	    flag7=1;
   ;	
	mov	word ptr [bp-12],1
   ;	
   ;				      	    cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@9@1586
@9@986:
   ;	
   ;				      	    break;
   ;				        }
   ;	                    if((a>=getmaxx()-r-r && a<=getmaxx()-r+r && b>=getmaxy()-250-r && b<=getmaxy()-250+r)&&(IsInside(getmaxx()-r
   ;	
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@34
	jmp	@9@1154
@@34:
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jl	short @9@1154
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65286
	cmp	ax,di
	jg	short @9@1154
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65286
	cmp	ax,di
	jl	short @9@1154
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @9@1154
	cmp	word ptr [bp-14],0
	jne	short @9@1154
   ;	
   ;						{
   ;					        fillarea(getmaxx()-r,getmaxy()-250,WHITE,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;					        flag9=1;
   ;	
	mov	word ptr [bp-14],1
   ;	
   ;					        cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@9@1586
@9@1154:
   ;	
   ;					        break;
   ;				        }
   ;	                    if((a>=(2*r)-r && a<=(2*r)+r && b>=getmaxy()-(2*r)-r && b<=getmaxy()-(2*r)+r)&&(IsInside(2*r,getmaxy()-(2*r)
   ;	
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@35
	jmp	@9@1322
@@35:
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jge	@@36
	jmp	@9@1322
@@36:
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,di
	jg	short @9@1322
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	add	ax,word ptr DGROUP:_r
	cmp	ax,di
	jl	short @9@1322
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @9@1322
	cmp	word ptr [bp-16],0
	jne	short @9@1322
   ;	
   ;						{
   ;					        fillarea(2*r,getmaxy()-(2*r),WHITE,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;					        flag11=1;
   ;	
	mov	word ptr [bp-16],1
   ;	
   ;					        cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@9@1586
@9@1322:
   ;	
   ;					        break;
   ;				        }
   ;	                    if((a>=getmaxx()-(2*r)-r && a<=getmaxx()-(2*r)+r && b>=getmaxy()-(2*r)-r && b<=getmaxy()-(2*r)+r)&&(IsInside
   ;	
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@37
	jmp	@9@1490
@@37:
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jge	@@38
	jmp	@9@1490
@@38:
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,di
	jle	@@39
	jmp	@9@1490
@@39:
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	add	ax,word ptr DGROUP:_r
	cmp	ax,di
	jl	short @9@1490
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @9@1490
	cmp	word ptr [bp-18],0
	jne	short @9@1490
   ;	
   ;						{
   ;					        fillarea(getmaxx()-(2*r),getmaxy()-(2*r),WHITE,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;					        flag13=1;
   ;	
	mov	word ptr [bp-18],1
   ;	
   ;					        cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	short @9@1586
@9@1490:
	inc	word ptr [bp-2]
@9@1514:
	or	si,si
	je	short @9@1586
	call	far ptr _getmaxx
	cmp	ax,si
	je	short @9@1586
	call	far ptr _getmaxy
	cmp	ax,di
	je	@@40
	jmp	@9@266
@@40:
@9@1586:
	jmp	@9@1706
@9@1610:
   ;	
   ;					        break;
   ;				        }			  
   ;			        }
   ;					
   ;			    	for (; k>=1; k--)
   ;					{	 
   ;						//level time
   ;			        	time(&now);
   ;	
	mov	ax,offset DGROUP:_now
	push	ax
	call	near ptr _time
	pop	cx
   ;	
   ;			        	seconds = difftime(now,timer);
   ;	
	push	word ptr DGROUP:_timer+2
	push	word ptr DGROUP:_timer
	push	word ptr DGROUP:_now+2
	push	word ptr DGROUP:_now
	call	near ptr _difftime
	add	sp,8
	call	near ptr N_FTOL@
	mov	word ptr [bp-46],ax
   ;	
   ;			        	if(oldseconds != seconds)
   ;	
	mov	ax,word ptr [bp-48]
	cmp	ax,word ptr [bp-46]
	je	short @9@1658
   ;	
   ;			        	{
   ;	                        oldseconds = seconds;				
   ;	
	mov	ax,word ptr [bp-46]
	mov	word ptr [bp-48],ax
   ;	
   ;			            	setfillstyle(1 , WHITE);
   ;	
	mov	ax,15
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			            	floodfill(120 , 70 , BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,70
	push	ax
	mov	ax,120
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		                	setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		                	sprintf(msg , "%d sec" , seconds);
   ;	
	push	word ptr [bp-46]
	mov	ax,offset DGROUP:s@+434
	push	ax
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,6
   ;	
   ;		                	outtextxy(21 , 56 , msg);
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,56
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@9@1658:
   ;	
   ;			        	}
   ;				
   ;			           	a=x1+(55+k)*cos(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_x1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	si,ax
   ;	
   ;			        	b=y1+(55+k)*sin(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_y1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	di,ax
   ;	
   ;			        	arrow1=a-10*cos(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],si
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow1,ax
   ;	
   ;			            arrow2=b-10*sin(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],di
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow2,ax
   ;	
   ;			            arrow3=a-10*cos(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],si
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow3,ax
   ;	
   ;			            arrow4=b-10*sin(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],di
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow4,ax
   ;	
   ;			        	putpixel(a,b,BLACK);
   ;	
	xor	ax,ax
	push	ax
	push	di
	push	si
	call	far ptr _putpixel
	add	sp,6
   ;	
   ;			        	setcolor(GREEN);
   ;	
	mov	ax,2
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			        	line(a-1,b,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	di
	mov	ax,si
	dec	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			            line(a+1,b,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	di
	mov	ax,si
	inc	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			        	delay(5);
   ;	
	mov	ax,5
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	                    setcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			        	line(a-1,b,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	di
	mov	ax,si
	dec	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			            line(a+1,b,arrow3,arrow4);			
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	di
	mov	ax,si
	inc	ax
	push	ax
	call	far ptr _line
	add	sp,8
	dec	word ptr [bp-2]
@9@1706:
	cmp	word ptr [bp-2],1
	jl	@@41
	jmp	@9@1610
@@41:
   ;	
   ;			    	}
   ;					ch='a';			
   ;	
	mov	byte ptr [bp-3],97
@9@1754:
   ;	
   ;			    }
   ;			   	setcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			   	//line(x1,y1+2,x,y);
   ;			   	line(x1,y1+2,x,y);
   ;	
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	mov	ax,word ptr DGROUP:_y1
	inc	ax
	inc	ax
	push	ax
	push	word ptr DGROUP:_x1
	call	far ptr _line
	add	sp,8
   ;	
   ;			   	line(x,y,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;			   	line(x,y,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;				if(cnt==7)
   ;	
	cmp	word ptr [bp-20],7
	jne	short @9@1802
	jmp	short @9@1850
@9@1802:
	FLD	qword ptr [bp-28]
	FADD	qword ptr DGROUP:s@+407
	FSTP	qword ptr [bp-28]
	FWAIT	
@9@1826:
	FLD	qword ptr [bp-28]
	FLDZ	
	FCOMPP
	FSTSW	word ptr [bp-50]
	FWAIT	
	mov	ax,word ptr [bp-50]
	sahf	
	jae	@@42
	jmp	@9@74
@@42:
@9@1850:
   ;	
   ;				    break;
   ;		    }		
   ;			
   ;		    for(i=0;i<3.05;i=i+0.01)
   ;	
	FLDZ	
	FSTP	qword ptr [bp-28]
	FWAIT	
	jmp	@9@3626
@9@1874:
   ;	
   ;			{
   ;				//how balls percent reveived
   ;			   	percent = (double)(cnt / 7.0 *100.0);
   ;	
	mov	ax,word ptr [bp-20]
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FDIV	dword ptr DGROUP:s@+318
	FMUL	dword ptr DGROUP:s@+322
	FSTP	qword ptr [bp-44]
   ;	
   ;			   	if(oldpercent != percent)
   ;	
	FLD	qword ptr [bp-36]
	FCOMP	qword ptr [bp-44]
	FSTSW	word ptr [bp-50]
	FWAIT	
	mov	ax,word ptr [bp-50]
	sahf	
	je	short @9@1922
   ;	
   ;			   	{
   ;			   		oldpercent = percent;
   ;	
	FLD	qword ptr [bp-44]
	FSTP	qword ptr [bp-36]
   ;	
   ;			   		setfillstyle(1 , WHITE);
   ;	
	mov	ax,15
	push	ax
	mov	ax,1
	push	ax
	FWAIT	
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			   		floodfill(30 , 30 , BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,30
	push	ax
	mov	ax,30
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;			   		setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			   		sprintf(msg , "%lf%" , percent);
   ;	
	FLD	qword ptr [bp-44]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	mov	ax,offset DGROUP:s@+441
	push	ax
	FWAIT	
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,12
   ;	
   ;			   		outtextxy(21 , 21 , msg);
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,21
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@9@1922:
   ;	
   ;			   	}
   ;					
   ;				//level time
   ;				time(&now);
   ;	
	mov	ax,offset DGROUP:_now
	push	ax
	call	near ptr _time
	pop	cx
   ;	
   ;				seconds = difftime(now,timer);
   ;	
	push	word ptr DGROUP:_timer+2
	push	word ptr DGROUP:_timer
	push	word ptr DGROUP:_now+2
	push	word ptr DGROUP:_now
	call	near ptr _difftime
	add	sp,8
	call	near ptr N_FTOL@
	mov	word ptr [bp-46],ax
   ;	
   ;				if(oldseconds != seconds)
   ;	
	mov	ax,word ptr [bp-48]
	cmp	ax,word ptr [bp-46]
	je	short @9@1970
   ;	
   ;				{
   ;	                oldseconds = seconds;				
   ;	
	mov	ax,word ptr [bp-46]
	mov	word ptr [bp-48],ax
   ;	
   ;			    	setfillstyle(1 , WHITE);
   ;	
	mov	ax,15
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			    	floodfill(120 , 70 , BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,70
	push	ax
	mov	ax,120
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		        	setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		        	sprintf(msg , "%d sec" , seconds);
   ;	
	push	word ptr [bp-46]
	mov	ax,offset DGROUP:s@+446
	push	ax
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,6
   ;	
   ;		        	outtextxy(21 , 56 , msg);
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,56
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@9@1970:
   ;	
   ;				}
   ;				
   ;				x=x1+55*cos(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+338
	mov	ax,word ptr DGROUP:_x1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_x,ax
   ;	
   ;		        y=y1+55*sin(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+338
	mov	ax,word ptr DGROUP:_y1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_y,ax
   ;	
   ;			    arrow1=x-10*cos(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	ax,word ptr DGROUP:_x
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow1,ax
   ;	
   ;			    arrow2=y-10*sin(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	ax,word ptr DGROUP:_y
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow2,ax
   ;	
   ;			    arrow3=x-10*cos(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	ax,word ptr DGROUP:_x
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow3,ax
   ;	
   ;			    arrow4=y-10*sin(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	ax,word ptr DGROUP:_y
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow4,ax
   ;	
   ;		        setcolor(GREEN);
   ;	
	mov	ax,2
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		        line(x1,y1+2,x,y);
   ;	
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	mov	ax,word ptr DGROUP:_y1
	inc	ax
	inc	ax
	push	ax
	push	word ptr DGROUP:_x1
	call	far ptr _line
	add	sp,8
   ;	
   ;			    line(x,y,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;			    line(x,y,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;		        delay(5);
   ;	
	mov	ax,5
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				if(kbhit())
   ;	
	call	near ptr _kbhit
	or	ax,ax
	je	short @9@2018
   ;	
   ;				{
   ;				    ch=getch();		  
   ;	
	call	near ptr _getch
	mov	byte ptr [bp-3],al
@9@2018:
   ;	
   ;			    }
   ;			    if(ch==32)
   ;	
	cmp	byte ptr [bp-3],32
	je	@@43
	jmp	@9@3554
@@43:
   ;	
   ;				{
   ;	                setcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			        line(x,y,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;			        line(x,y,arrow3,arrow4);			  
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;			        for (k=1; a!= 0 && a!= getmaxx() && b!= getmaxy(); k++)
   ;	
	mov	word ptr [bp-2],1
	jmp	@9@3314
@9@2066:
   ;	
   ;					{	
   ;				
   ;						//level time
   ;			        	time(&now);
   ;	
	mov	ax,offset DGROUP:_now
	push	ax
	call	near ptr _time
	pop	cx
   ;	
   ;			        	seconds = difftime(now,timer);
   ;	
	push	word ptr DGROUP:_timer+2
	push	word ptr DGROUP:_timer
	push	word ptr DGROUP:_now+2
	push	word ptr DGROUP:_now
	call	near ptr _difftime
	add	sp,8
	call	near ptr N_FTOL@
	mov	word ptr [bp-46],ax
   ;	
   ;			        	if(oldseconds != seconds)
   ;	
	mov	ax,word ptr [bp-48]
	cmp	ax,word ptr [bp-46]
	je	short @9@2114
   ;	
   ;			        	{
   ;	                        oldseconds = seconds;				
   ;	
	mov	ax,word ptr [bp-46]
	mov	word ptr [bp-48],ax
   ;	
   ;			            	setfillstyle(1 , WHITE);
   ;	
	mov	ax,15
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			            	floodfill(120 , 70 , BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,70
	push	ax
	mov	ax,120
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		                	setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		                	sprintf(msg , "%d sec" , seconds);
   ;	
	push	word ptr [bp-46]
	mov	ax,offset DGROUP:s@+453
	push	ax
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,6
   ;	
   ;		                	outtextxy(21 , 56 , msg);
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,56
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@9@2114:
   ;	
   ;			        	}
   ;				
   ;				        a=x1+(55+k)*cos(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_x1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	si,ax
   ;	
   ;				        b=y1+(55+k)*sin(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_y1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	di,ax
   ;	
   ;				        arrow1=a-10*cos(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],si
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow1,ax
   ;	
   ;			            arrow2=b-10*sin(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],di
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow2,ax
   ;	
   ;			            arrow3=a-10*cos(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],si
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow3,ax
   ;	
   ;			            arrow4=b-10*sin(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],di
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow4,ax
   ;	
   ;				        putpixel(a,b,GREEN);
   ;	
	mov	ax,2
	push	ax
	push	di
	push	si
	call	far ptr _putpixel
	add	sp,6
   ;	
   ;				        setcolor(GREEN);
   ;	
	mov	ax,2
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;				        line(a-1,b,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	di
	mov	ax,si
	dec	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			            line(a+1,b,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	di
	mov	ax,si
	inc	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;				        delay(2);
   ;	
	mov	ax,2
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				        setcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;				        line(a-1,b,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	di
	mov	ax,si
	dec	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			            line(a+1,b,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	di
	mov	ax,si
	inc	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;				  
   ;				        delay(5);
   ;	
	mov	ax,5
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;				        if((a>=r-r && a<=r+r && b>=getmaxy()-250-r && b<=getmaxy()-250+r)&&IsInside(r,getmaxy()-250,r,a,b)==1&&flag1==0)	
   ;	
	mov	ax,word ptr DGROUP:_r
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jg	short @9@2282
	mov	ax,word ptr DGROUP:_r
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jl	short @9@2282
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65286
	cmp	ax,di
	jg	short @9@2282
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65286
	cmp	ax,di
	jl	short @9@2282
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	push	word ptr DGROUP:_r
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @9@2282
	cmp	word ptr [bp-6],0
	jne	short @9@2282
   ;	
   ;						{
   ;				      	    fillarea(r,getmaxy()-250,WHITE,1);
   ;	
	mov	ax,1
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	push	word ptr DGROUP:_r
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;				      	    flag1=1;
   ;	
	mov	word ptr [bp-6],1
   ;	
   ;				      	    cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@9@3386
@9@2282:
   ;	
   ;	                        break;				  
   ;				        }
   ;				        if((a>=getmaxx()/4-r && a<=getmaxx()/4+r && b>=getmaxy()-200-r && b<=getmaxy()-200+r)&&(IsInside(getmaxx()/4,getmaxy(
   ;	
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@44
	jmp	@9@2450
@@44:
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jl	short @9@2450
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65336
	cmp	ax,di
	jg	short @9@2450
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65336
	cmp	ax,di
	jl	short @9@2450
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @9@2450
	cmp	word ptr [bp-8],0
	jne	short @9@2450
   ;	
   ;						{
   ;				      	    fillarea(getmaxx()/4,getmaxy()-200,WHITE,3);                                             
   ;	
	mov	ax,3
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;				      	    flag3=1;
   ;	
	mov	word ptr [bp-8],1
   ;	
   ;				      	    cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@9@3386
@9@2450:
   ;	
   ;				      	    break;
   ;				        }
   ;						
   ;	                    if((a>=getmaxx()/2-r && a<=getmaxx()/2+r && b>=getmaxy()-150-r && b<=getmaxy()-150+r)&&(IsInside(getmaxx()/2
   ;	
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@45
	jmp	@9@2618
@@45:
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jl	short @9@2618
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65386
	cmp	ax,di
	jg	short @9@2618
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65386
	cmp	ax,di
	jl	short @9@2618
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65386
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	or	ax,ax
	je	short @9@2618
	cmp	word ptr [bp-10],0
	jne	short @9@2618
   ;	
   ;						{
   ;					        fillarea(getmaxx()/2,getmaxy()-150,WHITE,5);
   ;	
	mov	ax,5
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65386
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;					        flag5=1;
   ;	
	mov	word ptr [bp-10],1
   ;	
   ;					        cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@9@3386
@9@2618:
   ;	
   ;					        break;
   ;				        }
   ;	                    if((a>=getmaxx()/4*3-r && a<=getmaxx()/4*3+r && b>=getmaxy()-200-r && b<=getmaxy()-200+r)&&(IsInside(getmaxx
   ;	
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@46
	jmp	@9@2786
@@46:
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jge	@@47
	jmp	@9@2786
@@47:
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65336
	cmp	ax,di
	jg	short @9@2786
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65336
	cmp	ax,di
	jl	short @9@2786
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @9@2786
	cmp	word ptr [bp-12],0
	jne	short @9@2786
   ;	
   ;						{
   ;				      	    fillarea(getmaxx()/4*3,getmaxy()-200,WHITE,7);
   ;	
	mov	ax,7
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65336
	push	ax
	call	far ptr _getmaxx
	mov	bx,4
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;				      	    flag7=1;
   ;	
	mov	word ptr [bp-12],1
   ;	
   ;				      	    cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@9@3386
@9@2786:
   ;	
   ;				      	    break;
   ;				        }
   ;	                    if((a>=getmaxx()-r-r && a<=getmaxx()-r+r && b>=getmaxy()-250-r && b<=getmaxy()-250+r)&&(IsInside(getmaxx()-r
   ;	
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@48
	jmp	@9@2954
@@48:
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jl	short @9@2954
	call	far ptr _getmaxy
	sub	ax,word ptr DGROUP:_r
	add	ax,65286
	cmp	ax,di
	jg	short @9@2954
	call	far ptr _getmaxy
	add	ax,word ptr DGROUP:_r
	add	ax,65286
	cmp	ax,di
	jl	short @9@2954
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @9@2954
	cmp	word ptr [bp-14],0
	jne	short @9@2954
   ;	
   ;						{
   ;					        fillarea(getmaxx()-r,getmaxy()-250,WHITE,9);
   ;	
	mov	ax,9
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	add	ax,65286
	push	ax
	call	far ptr _getmaxx
	sub	ax,word ptr DGROUP:_r
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;					        flag9=1;
   ;	
	mov	word ptr [bp-14],1
   ;	
   ;					        cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@9@3386
@9@2954:
   ;	
   ;					        break;
   ;				        }
   ;	                    if((a>=(2*r)-r && a<=(2*r)+r && b>=getmaxy()-(2*r)-r && b<=getmaxy()-(2*r)+r)&&(IsInside(2*r,getmaxy()-(2*r)
   ;	
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@49
	jmp	@9@3122
@@49:
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jge	@@50
	jmp	@9@3122
@@50:
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,di
	jg	short @9@3122
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	add	ax,word ptr DGROUP:_r
	cmp	ax,di
	jl	short @9@3122
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @9@3122
	cmp	word ptr [bp-16],0
	jne	short @9@3122
   ;	
   ;						{
   ;					        fillarea(2*r,getmaxy()-(2*r),WHITE,11);
   ;	
	mov	ax,11
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	mov	ax,word ptr DGROUP:_r
	shl	ax,1
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;					        flag11=1;
   ;	
	mov	word ptr [bp-16],1
   ;	
   ;					        cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	@9@3386
@9@3122:
   ;	
   ;					        break;
   ;				        }
   ;	                    if((a>=getmaxx()-(2*r)-r && a<=getmaxx()-(2*r)+r && b>=getmaxy()-(2*r)-r && b<=getmaxy()-(2*r)+r)&&(IsInside
   ;	
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,si
	jle	@@51
	jmp	@9@3290
@@51:
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	add	ax,word ptr DGROUP:_r
	cmp	ax,si
	jge	@@52
	jmp	@9@3290
@@52:
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	sub	ax,word ptr DGROUP:_r
	cmp	ax,di
	jle	@@53
	jmp	@9@3290
@@53:
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	add	ax,word ptr DGROUP:_r
	cmp	ax,di
	jl	short @9@3290
	push	di
	push	si
	push	word ptr DGROUP:_r
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	near ptr @IsInside$qiiiii
	add	sp,10
	cmp	ax,1
	jne	short @9@3290
	cmp	word ptr [bp-18],0
	jne	short @9@3290
   ;	
   ;						{
   ;					        fillarea(getmaxx()-(2*r),getmaxy()-(2*r),WHITE,13);
   ;	
	mov	ax,13
	push	ax
	mov	ax,15
	push	ax
	call	far ptr _getmaxy
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	far ptr _getmaxx
	mov	dx,word ptr DGROUP:_r
	shl	dx,1
	sub	ax,dx
	push	ax
	call	near ptr @fillarea$qiiii
	add	sp,8
   ;	
   ;					        flag13=1;
   ;	
	mov	word ptr [bp-18],1
   ;	
   ;					        cnt++;
   ;	
	inc	word ptr [bp-20]
	jmp	short @9@3386
@9@3290:
	inc	word ptr [bp-2]
@9@3314:
	or	si,si
	je	short @9@3386
	call	far ptr _getmaxx
	cmp	ax,si
	je	short @9@3386
	call	far ptr _getmaxy
	cmp	ax,di
	je	@@54
	jmp	@9@2066
@@54:
@9@3386:
   ;	
   ;					        break;	
   ;				        }						   
   ;			        }
   ;		  	  	    a=x1+(55+k)*cos(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_x1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	si,ax
   ;	
   ;				    b=y1+(55+k)*sin(i);				
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_y1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	di,ax
	jmp	@9@3506
@9@3410:
   ;	
   ;				    for (; k>=1; k--)
   ;					{	 	
   ;	
   ;			        	//level time
   ;			        	time(&now);
   ;	
	mov	ax,offset DGROUP:_now
	push	ax
	call	near ptr _time
	pop	cx
   ;	
   ;			        	seconds = difftime(now,timer);
   ;	
	push	word ptr DGROUP:_timer+2
	push	word ptr DGROUP:_timer
	push	word ptr DGROUP:_now+2
	push	word ptr DGROUP:_now
	call	near ptr _difftime
	add	sp,8
	call	near ptr N_FTOL@
	mov	word ptr [bp-46],ax
   ;	
   ;			        	if(oldseconds != seconds)
   ;	
	mov	ax,word ptr [bp-48]
	cmp	ax,word ptr [bp-46]
	je	short @9@3458
   ;	
   ;			        	{
   ;	                        oldseconds = seconds;				
   ;	
	mov	ax,word ptr [bp-46]
	mov	word ptr [bp-48],ax
   ;	
   ;			            	setfillstyle(1 , WHITE);
   ;	
	mov	ax,15
	push	ax
	mov	ax,1
	push	ax
	call	far ptr _setfillstyle
	pop	cx
	pop	cx
   ;	
   ;			            	floodfill(120 , 70 , BLUE);
   ;	
	mov	ax,1
	push	ax
	mov	ax,70
	push	ax
	mov	ax,120
	push	ax
	call	far ptr _floodfill
	add	sp,6
   ;	
   ;		                	setcolor(DARKGRAY);
   ;	
	mov	ax,8
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		                	sprintf(msg , "%d sec" , seconds);
   ;	
	push	word ptr [bp-46]
	mov	ax,offset DGROUP:s@+460
	push	ax
	lea	ax,word ptr [bp-70]
	push	ax
	call	near ptr _sprintf
	add	sp,6
   ;	
   ;		                	outtextxy(21 , 56 , msg);
   ;	
	push	ds
	lea	ax,word ptr [bp-70]
	push	ax
	mov	ax,56
	push	ax
	mov	ax,21
	push	ax
	call	far ptr _outtextxy
	add	sp,8
@9@3458:
   ;	
   ;			        	}
   ;				
   ;			        	a=x1+(55+k)*cos(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_x1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	si,ax
   ;	
   ;			        	b=y1+(55+k)*sin(i);
   ;	
	FLD	qword ptr [bp-28]
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	mov	ax,word ptr [bp-2]
	add	ax,55
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FMUL	
	mov	ax,word ptr DGROUP:_y1
	mov	word ptr [bp-50],ax
	FILD	word ptr [bp-50]
	FADD	
	call	near ptr N_FTOL@
	mov	di,ax
   ;	
   ;			        	arrow1=a-10*cos(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],si
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow1,ax
   ;	
   ;			            arrow2=b-10*sin(i-0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+342
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],di
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow2,ax
   ;	
   ;			            arrow3=a-10*cos(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],si
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow3,ax
   ;	
   ;			            arrow4=b-10*sin(i+0.5);
   ;	
	FLD	qword ptr [bp-28]
	FADD	dword ptr DGROUP:s@+350
	add	sp,65528
	FSTP	qword ptr [bp-82]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+346
	mov	word ptr [bp-50],di
	FILD	word ptr [bp-50]
	FSUBR	
	call	near ptr N_FTOL@
	mov	word ptr DGROUP:_arrow4,ax
   ;	
   ;			        	putpixel(a,b,BLACK);
   ;	
	xor	ax,ax
	push	ax
	push	di
	push	si
	call	far ptr _putpixel
	add	sp,6
   ;	
   ;			        	setcolor(GREEN);
   ;	
	mov	ax,2
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			        	line(a-1,b,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	di
	mov	ax,si
	dec	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			            line(a+1,b,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	di
	mov	ax,si
	inc	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			        	delay(5);
   ;	
	mov	ax,5
	push	ax
	call	near ptr _delay
	pop	cx
   ;	
   ;	                    setcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;			        	line(a-1,b,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	di
	mov	ax,si
	dec	ax
	push	ax
	call	far ptr _line
	add	sp,8
   ;	
   ;			            line(a+1,b,arrow3,arrow4);	 	 
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	di
	mov	ax,si
	inc	ax
	push	ax
	call	far ptr _line
	add	sp,8
	dec	word ptr [bp-2]
@9@3506:
	cmp	word ptr [bp-2],1
	jl	@@55
	jmp	@9@3410
@@55:
   ;	
   ;			    	}
   ;					ch='a';	  	 							
   ;	
	mov	byte ptr [bp-3],97
@9@3554:
   ;	
   ;				}
   ;				setcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;				line(x1,y1+2,x,y);
   ;	
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	mov	ax,word ptr DGROUP:_y1
	inc	ax
	inc	ax
	push	ax
	push	word ptr DGROUP:_x1
	call	far ptr _line
	add	sp,8
   ;	
   ;				line(x,y,arrow1,arrow2);
   ;	
	push	word ptr DGROUP:_arrow2
	push	word ptr DGROUP:_arrow1
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;				line(x,y,arrow3,arrow4);
   ;	
	push	word ptr DGROUP:_arrow4
	push	word ptr DGROUP:_arrow3
	push	word ptr DGROUP:_y
	push	word ptr DGROUP:_x
	call	far ptr _line
	add	sp,8
   ;	
   ;				if(cnt==7)
   ;	
	cmp	word ptr [bp-20],7
	jne	short @9@3602
	jmp	short @9@3650
@9@3602:
	FLD	qword ptr [bp-28]
	FADD	qword ptr DGROUP:s@+310
	FSTP	qword ptr [bp-28]
	FWAIT	
@9@3626:
	FLD	qword ptr [bp-28]
	FCOMP	qword ptr DGROUP:s@+302
	FSTSW	word ptr [bp-50]
	FWAIT	
	mov	ax,word ptr [bp-50]
	sahf	
	jae	@@56
	jmp	@9@1874
@@56:
@9@3650:
	cmp	word ptr [bp-20],7
	je	@@57
	jmp	@9@50
@@57:
   ;	
   ;				    break;
   ;		    }				
   ;		}
   ;	    cleardevice();
   ;	
	call	far ptr _cleardevice
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@Level2Playing$qv	endp
   ;	
   ;	void GameOver()
   ;	
	assume	cs:_TEXT
@GameOver$qv	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{	
   ;	    setcolor(WHITE);
   ;	
	mov	ax,15
	push	ax
	call	far ptr _setcolor
	pop	cx
   ;	
   ;		setbkcolor(BLACK);
   ;	
	xor	ax,ax
	push	ax
	call	far ptr _setbkcolor
	pop	cx
   ;	
   ;		settextstyle(10 , HORIZ_DIR , 3);
   ;	
	mov	ax,3
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,10
	push	ax
	call	far ptr _settextstyle
	add	sp,6
   ;	
   ;		outtextxy(getmaxx()/2-100 , getmaxy()/2 , "GAME OVER :)");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+467
	push	ax
	call	far ptr _getmaxy
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	far ptr _getmaxx
	mov	bx,2
	cwd	
	idiv	bx
	add	ax,65436
	push	ax
	call	far ptr _outtextxy
	add	sp,8
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@GameOver$qv	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'c:\tc\bgi'
	db	0
	db	'Graphics error: %s'
	db	10
	db	0
	db	'Press any key to halt:'
	db	0
	db	'Amir Ghanem 313258030'
	db	0
	db	'Alam Aslan 208913236'
	db	0
	db	'ABOUT THE GAME...'
	db	0
	db	'shot all the balls to win :)'
	db	0
	db	'you have 7 balls to shoot in every round'
	db	0
	db	'round 2 become harder ... '
	db	0
	db	'balls become smaller and the aroow become faster'
	db	0
	db	'use SPACE for shooting'
	db	0
	db	'START'
	db	0
	db	'LEVEL.1'
	db	0
	db	'%lf%'
	db	0
	db	'ffffff'
	db	8
	db	'@{'
	db	20
	db	-82
	db	'G'
	db	-31
	db	'z'
	db	-124
	db	'?'
	db	0
	db	0
	db	-32
	db	'@'
	db	0
	db	0
	db	-56
	db	'B%lf%'
	db	0
	db	'%d sec'
	db	0
	db	0
	db	0
	db	'\B'
	db	0
	db	0
	db	0
	db	-65
	db	0
	db	0
	db	' A'
	db	0
	db	0
	db	0
	db	'?%d sec'
	db	0
	db	'%d sec'
	db	0
	db	'%lf%'
	db	0
	db	'%d sec'
	db	0
	db	'%d sec'
	db	0
	db	'%d sec'
	db	0
	db	'LEVEL.2'
	db	0
	db	'%lf%'
	db	0
	db	'{'
	db	20
	db	-82
	db	'G'
	db	-31
	db	'z'
	db	-124
	db	-65
	db	'%lf%'
	db	0
	db	'%d sec'
	db	0
	db	'%d sec'
	db	0
	db	'%d sec'
	db	0
	db	'%lf%'
	db	0
	db	'%d sec'
	db	0
	db	'%d sec'
	db	0
	db	'%d sec'
	db	0
	db	'GAME OVER :)'
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
	public	_i
	public	_o
	public	_x1
	public	_y1
	public	_x
	public	_y
	public	_arrow1
	public	_arrow2
	public	_arrow3
	public	_arrow4
	public	_button
	public	_flag
	public	_r
	public	_timer
	public	_now
	public	_main
	extrn	_initgraph:far
	extrn	_graphresult:far
	extrn	_printf:near
	extrn	_grapherrormsg:far
	extrn	_getch:near
	extrn	_exit:near
	public	@Start$qv
	extrn	_setbkcolor:far
	extrn	_time:near
	public	@Level1Drawing$qv
	public	@Level1Playing$qv
	public	@Level2Drawing$qv
	public	@Level2Playing$qv
	public	@GameOver$qv
	extrn	_closegraph:far
	public	@getmousepos$qpit1t1
	extrn	_int86:near
	extrn	_setcolor:far
	extrn	_settextstyle:far
	extrn	_outtextxy:far
	extrn	_getmaxx:far
	extrn	_getmaxy:far
	extrn	_rectangle:far
	extrn	_cleardevice:far
	public	@fillarea$qiiii
	extrn	_getpixel:far
	extrn	_putpixel:far
	public	@IsInside$qiiiii
	extrn	_setfillstyle:far
	extrn	_floodfill:far
	extrn	_circle:far
	extrn	_sprintf:near
	extrn	_difftime:near
	extrn	N_FTOL@:near
	extrn	_cos:near
	extrn	_sin:near
	extrn	_line:far
	extrn	_delay:near
	extrn	_kbhit:near
	end
