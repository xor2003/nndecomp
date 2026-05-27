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
	?debug	S "c:\lines.c"
	?debug	C E97655FE7C0A633A5C6C696E65732E63
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
	?debug	C E95337528110443A5C494E434C5544455C646F732E68
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
_VGA	label	word
	db	0
	db	0
_my_clock	label	word
	db	108
	db	4
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void set_mode(byte mode)
   ;	
	assume	cs:_TEXT
_set_mode	proc	near
	push	bp
	mov	bp,sp
	sub	sp,16
   ;	
   ;	{
   ;	  union REGS regs;
   ;	
   ;	  regs.h.ah = SET_MODE;
   ;	
	mov	byte ptr [bp-15],0
   ;	
   ;	  regs.h.al = mode;
   ;	
	mov	al,byte ptr [bp+4]
	mov	byte ptr [bp-16],al
   ;	
   ;	  int86(VIDEO_INT, &regs, &regs);
   ;	
	lea	ax,word ptr [bp-16]
	push	ax
	lea	ax,word ptr [bp-16]
	push	ax
	mov	ax,16
	push	ax
	call	near ptr _int86
	add	sp,6
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_set_mode	endp
   ;	
   ;	void plot_pixel(int x,int y,byte color)
   ;	
	assume	cs:_TEXT
_plot_pixel	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	  /*  y*320 = y*256 + y*64 = y*2^8 + y*2^6   */
   ;	  VGA[(y<<8)+(y<<6)+x]=color;
   ;	
	mov	bx,word ptr [bp+6]
	mov	cl,8
	shl	bx,cl
	mov	ax,word ptr [bp+6]
	mov	cl,6
	shl	ax,cl
	add	bx,ax
	add	bx,word ptr [bp+4]
	add	bx,word ptr DGROUP:_VGA
	mov	al,byte ptr [bp+8]
	mov	byte ptr [bx],al
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_plot_pixel	endp
   ;	
   ;	void line_slow(int x1, int y1, int x2, int y2, byte color)
   ;	
	assume	cs:_TEXT
_line_slow	proc	near
	push	bp
	mov	bp,sp
	sub	sp,20
	push	si
	push	di
   ;	
   ;	{
   ;	  int dx,dy,sdx,sdy,px,py,dxabs,dyabs,i;
   ;	  float slope;
   ;	
   ;	  dx=x2-x1;      /* the horizontal distance of the line */
   ;	
	mov	ax,word ptr [bp+8]
	sub	ax,word ptr [bp+4]
	mov	word ptr [bp-2],ax
   ;	
   ;	  dy=y2-y1;      /* the vertical distance of the line */
   ;	
	mov	ax,word ptr [bp+10]
	sub	ax,word ptr [bp+6]
	mov	di,ax
   ;	
   ;	  dxabs=abs(dx);
   ;	
	mov	ax,word ptr [bp-2]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	word ptr [bp-12],ax
   ;	
   ;	  dyabs=abs(dy);
   ;	
	mov	ax,di
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	word ptr [bp-14],ax
   ;	
   ;	  sdx=sgn(dx);
   ;	
	cmp	word ptr [bp-2],0
	jge	short @3@74
	mov	ax,65535
	jmp	short @3@146
@3@74:
	cmp	word ptr [bp-2],0
	jle	short @3@122
	mov	ax,1
	jmp	short @3@146
@3@122:
	xor	ax,ax
@3@146:
	mov	word ptr [bp-4],ax
   ;	
   ;	  sdy=sgn(dy);
   ;	
	or	di,di
	jge	short @3@194
	mov	ax,65535
	jmp	short @3@266
@3@194:
	or	di,di
	jle	short @3@242
	mov	ax,1
	jmp	short @3@266
@3@242:
	xor	ax,ax
@3@266:
	mov	word ptr [bp-6],ax
   ;	
   ;	  if (dxabs>=dyabs) /* the line is more horizontal than vertical */
   ;	
	mov	ax,word ptr [bp-12]
	cmp	ax,word ptr [bp-14]
	jl	short @3@410
   ;	
   ;	  {
   ;	    slope=(float)dy / (float)dx;
   ;	
	mov	word ptr [bp-20],di
	FILD	word ptr [bp-20]
	mov	ax,word ptr [bp-2]
	mov	word ptr [bp-20],ax
	FILD	word ptr [bp-20]
	FDIV	
	FSTP	dword ptr [bp-18]
   ;	
   ;	    for(i=0;i!=dx;i+=sdx)
   ;	
	xor	si,si
	FWAIT	
	jmp	short @3@362
@3@314:
   ;	
   ;	    {
   ;	      px=i+x1;
   ;	
	mov	ax,si
	add	ax,word ptr [bp+4]
	mov	word ptr [bp-8],ax
   ;	
   ;	      py=slope*i+y1;
   ;	
	mov	word ptr [bp-20],si
	FILD	word ptr [bp-20]
	FMUL	dword ptr [bp-18]
	mov	ax,word ptr [bp+6]
	mov	word ptr [bp-20],ax
	FILD	word ptr [bp-20]
	FADD	
	call	near ptr N_FTOL@
	mov	word ptr [bp-10],ax
   ;	
   ;	      plot_pixel(px,py,color);
   ;	
	mov	al,byte ptr [bp+12]
	push	ax
	push	word ptr [bp-10]
	push	word ptr [bp-8]
	call	near ptr _plot_pixel
	add	sp,6
	add	si,word ptr [bp-4]
@3@362:
	cmp	si,word ptr [bp-2]
	jne	short @3@314
   ;	
   ;	    }
   ;	  }
   ;	
	jmp	short @3@506
@3@410:
   ;	
   ;	  else /* the line is more vertical than horizontal */
   ;	  {
   ;	    slope=(float)dx / (float)dy;
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr [bp-20],ax
	FILD	word ptr [bp-20]
	mov	word ptr [bp-20],di
	FILD	word ptr [bp-20]
	FDIV	
	FSTP	dword ptr [bp-18]
   ;	
   ;	    for(i=0;i!=dy;i+=sdy)
   ;	
	xor	si,si
	FWAIT	
	jmp	short @3@482
@3@434:
   ;	
   ;	    {
   ;	      px=slope*i+x1;
   ;	
	mov	word ptr [bp-20],si
	FILD	word ptr [bp-20]
	FMUL	dword ptr [bp-18]
	mov	ax,word ptr [bp+4]
	mov	word ptr [bp-20],ax
	FILD	word ptr [bp-20]
	FADD	
	call	near ptr N_FTOL@
	mov	word ptr [bp-8],ax
   ;	
   ;	      py=i+y1;
   ;	
	mov	ax,si
	add	ax,word ptr [bp+6]
	mov	word ptr [bp-10],ax
   ;	
   ;	      plot_pixel(px,py,color);
   ;	
	mov	al,byte ptr [bp+12]
	push	ax
	push	word ptr [bp-10]
	push	word ptr [bp-8]
	call	near ptr _plot_pixel
	add	sp,6
	add	si,word ptr [bp-6]
@3@482:
	cmp	si,di
	jne	short @3@434
@3@506:
   ;	
   ;	    }
   ;	  }
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_line_slow	endp
   ;	
   ;	void line_fast(int x1, int y1, int x2, int y2, byte color)
   ;	
	assume	cs:_TEXT
_line_fast	proc	near
	push	bp
	mov	bp,sp
	sub	sp,18
	push	si
	push	di
   ;	
   ;	{
   ;	  int i,dx,dy,sdx,sdy,dxabs,dyabs,x,y,px,py;
   ;	
   ;	  dx=x2-x1;      /* the horizontal distance of the line */
   ;	
	mov	ax,word ptr [bp+8]
	sub	ax,word ptr [bp+4]
	mov	word ptr [bp-4],ax
   ;	
   ;	  dy=y2-y1;      /* the vertical distance of the line */
   ;	
	mov	ax,word ptr [bp+10]
	sub	ax,word ptr [bp+6]
	mov	word ptr [bp-6],ax
   ;	
   ;	  dxabs=abs(dx);
   ;	
	mov	ax,word ptr [bp-4]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	word ptr [bp-12],ax
   ;	
   ;	  dyabs=abs(dy);
   ;	
	mov	ax,word ptr [bp-6]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	word ptr [bp-14],ax
   ;	
   ;	  sdx=sgn(dx);
   ;	
	cmp	word ptr [bp-4],0
	jge	short @4@74
	mov	ax,65535
	jmp	short @4@146
@4@74:
	cmp	word ptr [bp-4],0
	jle	short @4@122
	mov	ax,1
	jmp	short @4@146
@4@122:
	xor	ax,ax
@4@146:
	mov	word ptr [bp-8],ax
   ;	
   ;	  sdy=sgn(dy);
   ;	
	cmp	word ptr [bp-6],0
	jge	short @4@194
	mov	ax,65535
	jmp	short @4@266
@4@194:
	cmp	word ptr [bp-6],0
	jle	short @4@242
	mov	ax,1
	jmp	short @4@266
@4@242:
	xor	ax,ax
@4@266:
	mov	word ptr [bp-10],ax
   ;	
   ;	  x=dyabs>>1;
   ;	
	mov	ax,word ptr [bp-14]
	sar	ax,1
	mov	word ptr [bp-16],ax
   ;	
   ;	  y=dxabs>>1;
   ;	
	mov	ax,word ptr [bp-12]
	sar	ax,1
	mov	word ptr [bp-18],ax
   ;	
   ;	  px=x1;
   ;	
	mov	di,word ptr [bp+4]
   ;	
   ;	  py=y1;
   ;	
	mov	si,word ptr [bp+6]
   ;	
   ;	
   ;	  VGA[(py<<8)+(py<<6)+px]=color;
   ;	
	mov	bx,si
	mov	cl,8
	shl	bx,cl
	mov	ax,si
	mov	cl,6
	shl	ax,cl
	add	bx,ax
	add	bx,di
	add	bx,word ptr DGROUP:_VGA
	mov	al,byte ptr [bp+12]
	mov	byte ptr [bx],al
   ;	
   ;	
   ;	  if (dxabs>=dyabs) /* the line is more horizontal than vertical */
   ;	
	mov	ax,word ptr [bp-12]
	cmp	ax,word ptr [bp-14]
	jl	short @4@458
   ;	
   ;	  {
   ;	    for(i=0;i<dxabs;i++)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @4@410
@4@314:
   ;	
   ;	    {
   ;	      y+=dyabs;
   ;	
	mov	ax,word ptr [bp-14]
	add	word ptr [bp-18],ax
   ;	
   ;	      if (y>=dxabs)
   ;	
	mov	ax,word ptr [bp-18]
	cmp	ax,word ptr [bp-12]
	jl	short @4@362
   ;	
   ;	      {
   ;	        y-=dxabs;
   ;	
	mov	ax,word ptr [bp-12]
	sub	word ptr [bp-18],ax
   ;	
   ;	        py+=sdy;
   ;	
	add	si,word ptr [bp-10]
@4@362:
   ;	
   ;	      }
   ;	      px+=sdx;
   ;	
	add	di,word ptr [bp-8]
   ;	
   ;	      plot_pixel(px,py,color);
   ;	
	mov	al,byte ptr [bp+12]
	push	ax
	push	si
	push	di
	call	near ptr _plot_pixel
	add	sp,6
	inc	word ptr [bp-2]
@4@410:
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp-12]
	jl	short @4@314
   ;	
   ;	    }
   ;	  }
   ;	
	jmp	short @4@602
@4@458:
   ;	
   ;	  else /* the line is more vertical than horizontal */
   ;	  {
   ;	    for(i=0;i<dyabs;i++)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @4@578
@4@482:
   ;	
   ;	    {
   ;	      x+=dxabs;
   ;	
	mov	ax,word ptr [bp-12]
	add	word ptr [bp-16],ax
   ;	
   ;	      if (x>=dyabs)
   ;	
	mov	ax,word ptr [bp-16]
	cmp	ax,word ptr [bp-14]
	jl	short @4@530
   ;	
   ;	      {
   ;	        x-=dyabs;
   ;	
	mov	ax,word ptr [bp-14]
	sub	word ptr [bp-16],ax
   ;	
   ;	        px+=sdx;
   ;	
	add	di,word ptr [bp-8]
@4@530:
   ;	
   ;	      }
   ;	      py+=sdy;
   ;	
	add	si,word ptr [bp-10]
   ;	
   ;	      plot_pixel(px,py,color);
   ;	
	mov	al,byte ptr [bp+12]
	push	ax
	push	si
	push	di
	call	near ptr _plot_pixel
	add	sp,6
	inc	word ptr [bp-2]
@4@578:
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp-14]
	jl	short @4@482
@4@602:
   ;	
   ;	    }
   ;	  }
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_line_fast	endp
   ;	
   ;	void main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,22
	push	si
	push	di
   ;	
   ;	{
   ;	  int x1,y1,x2,y2,color;
   ;	  float t1,t2;
   ;	  word i,start;
   ;	
   ;	  srand(*my_clock);                   /* seed the number generator. */
   ;	
	mov	bx,word ptr DGROUP:_my_clock
	push	word ptr [bx]
	call	near ptr _srand
	pop	cx
   ;	
   ;	  set_mode(VGA_256_COLOR_MODE);       /* set the video mode. */
   ;	
	mov	al,19
	push	ax
	call	near ptr _set_mode
	pop	cx
   ;	
   ;	
   ;	  start=*my_clock;                    /* record the starting time. */
   ;	
	mov	bx,word ptr DGROUP:_my_clock
	mov	di,word ptr [bx]
   ;	
   ;	  for(i=0;i<5000;i++)                 /* randomly draw 5000 lines. */
   ;	
	xor	si,si
	jmp	short @5@98
@5@50:
   ;	
   ;	  {
   ;	    x1=rand()%SCREEN_WIDTH;
   ;	
	call	near ptr _rand
	mov	bx,320
	cwd	
	idiv	bx
	mov	word ptr [bp-2],dx
   ;	
   ;	    y1=rand()%SCREEN_HEIGHT;
   ;	
	call	near ptr _rand
	mov	bx,200
	cwd	
	idiv	bx
	mov	word ptr [bp-4],dx
   ;	
   ;	    x2=rand()%SCREEN_WIDTH;
   ;	
	call	near ptr _rand
	mov	bx,320
	cwd	
	idiv	bx
	mov	word ptr [bp-6],dx
   ;	
   ;	    y2=rand()%SCREEN_HEIGHT;
   ;	
	call	near ptr _rand
	mov	bx,200
	cwd	
	idiv	bx
	mov	word ptr [bp-8],dx
   ;	
   ;	    color=rand()%NUM_COLORS;
   ;	
	call	near ptr _rand
	mov	bx,256
	cwd	
	idiv	bx
	mov	word ptr [bp-10],dx
   ;	
   ;	    line_slow(x1,y1,x2,y2,color);
   ;	
	mov	al,byte ptr [bp-10]
	push	ax
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	call	near ptr _line_slow
	add	sp,10
	inc	si
@5@98:
	cmp	si,5000
	jb	short @5@50
   ;	
   ;	  }
   ;	
   ;	  t1=(*my_clock-start)/18.2;          /* calculate how long it took. */
   ;	
	mov	bx,word ptr DGROUP:_my_clock
	mov	ax,word ptr [bx]
	sub	ax,di
	mov	word ptr [bp-22],ax
	mov	word ptr [bp-20],0
	FILD	dword ptr [bp-22]
	FDIV	qword ptr DGROUP:s@
	FSTP	dword ptr [bp-14]
   ;	
   ;	
   ;	  set_mode(VGA_256_COLOR_MODE);       /* set the video mode again in order
   ;	
	mov	al,19
	push	ax
	FWAIT	
	call	near ptr _set_mode
	pop	cx
   ;	
   ;	                                         to clear the screen. */
   ;	
   ;	  start=*my_clock;                    /* record the starting time. */
   ;	
	mov	bx,word ptr DGROUP:_my_clock
	mov	di,word ptr [bx]
   ;	
   ;	  for(i=0;i<5000;i++)                 /* randomly draw 5000 lines. */
   ;	
	xor	si,si
	jmp	short @5@194
@5@146:
   ;	
   ;	  {
   ;	    x1=rand()%SCREEN_WIDTH;
   ;	
	call	near ptr _rand
	mov	bx,320
	cwd	
	idiv	bx
	mov	word ptr [bp-2],dx
   ;	
   ;	    y1=rand()%SCREEN_HEIGHT;
   ;	
	call	near ptr _rand
	mov	bx,200
	cwd	
	idiv	bx
	mov	word ptr [bp-4],dx
   ;	
   ;	    x2=rand()%SCREEN_WIDTH;
   ;	
	call	near ptr _rand
	mov	bx,320
	cwd	
	idiv	bx
	mov	word ptr [bp-6],dx
   ;	
   ;	    y2=rand()%SCREEN_HEIGHT;
   ;	
	call	near ptr _rand
	mov	bx,200
	cwd	
	idiv	bx
	mov	word ptr [bp-8],dx
   ;	
   ;	    color=rand()%NUM_COLORS;
   ;	
	call	near ptr _rand
	mov	bx,256
	cwd	
	idiv	bx
	mov	word ptr [bp-10],dx
   ;	
   ;	    line_fast(x1,y1,x2,y2,color);
   ;	
	mov	al,byte ptr [bp-10]
	push	ax
	push	word ptr [bp-8]
	push	word ptr [bp-6]
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	call	near ptr _line_fast
	add	sp,10
	inc	si
@5@194:
	cmp	si,5000
	jb	short @5@146
   ;	
   ;	  }
   ;	
   ;	  t2=(*my_clock-start)/18.2;          /* calculate how long it took. */
   ;	
	mov	bx,word ptr DGROUP:_my_clock
	mov	ax,word ptr [bx]
	sub	ax,di
	mov	word ptr [bp-22],ax
	mov	word ptr [bp-20],0
	FILD	dword ptr [bp-22]
	FDIV	qword ptr DGROUP:s@
	FSTP	dword ptr [bp-18]
   ;	
   ;	  set_mode(TEXT_MODE);                /* set the video mode back to
   ;	
	mov	al,3
	push	ax
	FWAIT	
	call	near ptr _set_mode
	pop	cx
   ;	
   ;	                                         text mode. */
   ;	
   ;	  /* output the results... */
   ;	  printf("Slow line drawing took %f seconds.\n",t1);
   ;	
	FLD	dword ptr [bp-14]
	add	sp,65528
	FSTP	qword ptr [bp-34]
	mov	ax,offset DGROUP:s@+8
	push	ax
	FWAIT	
	call	near ptr _printf
	add	sp,10
   ;	
   ;	  printf("Fast line drawing took %f seconds.\n",t2);
   ;	
	FLD	dword ptr [bp-18]
	add	sp,65528
	FSTP	qword ptr [bp-34]
	mov	ax,offset DGROUP:s@+44
	push	ax
	FWAIT	
	call	near ptr _printf
	add	sp,10
   ;	
   ;	  if (t2 != 0) printf("Fast line drawing was %f times faster.\n",t1/t2);
   ;	
	FLD	dword ptr [bp-18]
	FLDZ	
	FCOMPP
	FSTSW	word ptr [bp-22]
	FWAIT	
	mov	ax,word ptr [bp-22]
	sahf	
	je	short @5@266
	FLD	dword ptr [bp-14]
	FDIV	dword ptr [bp-18]
	add	sp,65528
	FSTP	qword ptr [bp-34]
	mov	ax,offset DGROUP:s@+80
	push	ax
	FWAIT	
	call	near ptr _printf
	add	sp,10
@5@266:
   ;	
   ;	
   ;	  return;
   ;	
	jmp	short @5@290
@5@290:
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
	db	'3333332@Slow line drawing took %f seconds.'
	db	10
	db	0
	db	'Fast line drawing took %f seconds.'
	db	10
	db	0
	db	'Fast line drawing was %f times faster.'
	db	10
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	extrn	_printf:near
	public	_line_fast
	public	_line_slow
	extrn	_srand:near
	public	_set_mode
	public	_my_clock
	public	_VGA
	public	_plot_pixel
	extrn	_rand:near
	public	_main
	extrn	_int86:near
	extrn	N_FTOL@:far
	end
