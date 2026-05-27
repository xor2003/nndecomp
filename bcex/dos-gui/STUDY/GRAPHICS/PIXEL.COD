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
	?debug	S "c:\pixel.c"
	?debug	C E97655FE7C0A633A5C706978656C2E63
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
	?debug	C E95337528110443A5C494E434C5544455C646F732E68
PIXEL_TEXT	segment byte public 'CODE'
PIXEL_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:PIXEL_TEXT,ds:DGROUP
_DATA	segment word public 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
_DATA	segment word public 'DATA'
_VGA	label	dword
	db	0
	db	0
	db	0
	db	160
_my_clock	label	dword
	db	108
	db	4
	db	0
	db	0
_DATA	ends
PIXEL_TEXT	segment byte public 'CODE'
   ;	
   ;	void set_mode(byte mode)
   ;	
	assume	cs:PIXEL_TEXT
_set_mode	proc	far
	push	bp
	mov	bp,sp
	sub	sp,16
   ;	
   ;	{
   ;		union REGS regs;
   ;	
   ;		regs.h.ah = SET_MODE;
   ;	
	mov	byte ptr [bp-15],0
   ;	
   ;		regs.h.al = mode;
   ;	
	mov	al,byte ptr [bp+6]
	mov	byte ptr [bp-16],al
   ;	
   ;	  int86(VIDEO_INT, &regs, &regs);
   ;	
	push	ss
	lea	ax,word ptr [bp-16]
	push	ax
	push	ss
	lea	ax,word ptr [bp-16]
	push	ax
	mov	ax,16
	push	ax
	call	far ptr _int86
	add	sp,10
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_set_mode	endp
   ;	
   ;	void plot_pixel_slow(int x,int y,byte color)
   ;	
	assume	cs:PIXEL_TEXT
_plot_pixel_slow	proc	far
	push	bp
	mov	bp,sp
	sub	sp,16
   ;	
   ;	{
   ;	  union REGS regs;
   ;	
   ;	  regs.h.ah = WRITE_DOT;
   ;	
	mov	byte ptr [bp-15],12
   ;	
   ;		regs.h.al = color;
   ;	
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bp-16],al
   ;	
   ;	  regs.x.cx = x;
   ;	
	mov	ax,word ptr [bp+6]
	mov	word ptr [bp-12],ax
   ;	
   ;	  regs.x.dx = y;
   ;	
	mov	ax,word ptr [bp+8]
	mov	word ptr [bp-10],ax
   ;	
   ;	  int86(VIDEO_INT, &regs, &regs);
   ;	
	push	ss
	lea	ax,word ptr [bp-16]
	push	ax
	push	ss
	lea	ax,word ptr [bp-16]
	push	ax
	mov	ax,16
	push	ax
	call	far ptr _int86
	add	sp,10
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_plot_pixel_slow	endp
   ;	
   ;	void plot_pixel_fast(int x,int y,byte color)
   ;	
	assume	cs:PIXEL_TEXT
_plot_pixel_fast	proc	far
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		// No optimization.
   ;		// VGA[y*SCREEN_WIDTH+x]=color;
   ;		VGA[(y<<8)+(y<<6)+x]=color;
   ;	
	mov	bx,word ptr [bp+8]
	mov	cl,8
	shl	bx,cl
	mov	ax,word ptr [bp+8]
	mov	cl,6
	shl	ax,cl
	add	bx,ax
	add	bx,word ptr [bp+6]
	mov	es,word ptr DGROUP:_VGA+2
	add	bx,word ptr DGROUP:_VGA
	mov	al,byte ptr [bp+10]
	mov	byte ptr es:[bx],al
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_plot_pixel_fast	endp
   ;	
   ;	void main()
   ;	
	assume	cs:PIXEL_TEXT
_main	proc	far
	push	bp
	mov	bp,sp
	sub	sp,18
	push	si
	push	di
   ;	
   ;	{
   ;	  int x,y,color;
   ;	  float t1,t2;
   ;	  word i,start;
   ;	
   ;	  srand(*my_clock);                   /* seed the number generator. */
   ;	
	les	bx,dword ptr DGROUP:_my_clock
	push	word ptr es:[bx]
	call	far ptr _srand
	pop	cx
   ;	
   ;	  set_mode(VGA_256_COLOR_MODE);       /* set the video mode. */
   ;	
	mov	al,19
	push	ax
	push	cs
	call	near ptr _set_mode
	pop	cx
   ;	
   ;	
   ;	  start=*my_clock;                    /* record the starting time. */
   ;	
	les	bx,dword ptr DGROUP:_my_clock
	mov	di,word ptr es:[bx]
   ;	
   ;	  for(i=0;i<50000L;i++)               /* randomly plot 50000 pixels. */
   ;	
	xor	si,si
	jmp	short @4@98
@4@50:
   ;	
   ;	  {
   ;	    x=rand()%SCREEN_WIDTH;
   ;	
	call	far ptr _rand
	mov	bx,320
	cwd	
	idiv	bx
	mov	word ptr [bp-2],dx
   ;	
   ;	    y=rand()%SCREEN_HEIGHT;
   ;	
	call	far ptr _rand
	mov	bx,200
	cwd	
	idiv	bx
	mov	word ptr [bp-4],dx
   ;	
   ;	    color=rand()%NUM_COLORS;
   ;	
	call	far ptr _rand
	mov	bx,256
	cwd	
	idiv	bx
	mov	word ptr [bp-6],dx
   ;	
   ;	    plot_pixel_slow(x,y,color);
   ;	
	mov	al,byte ptr [bp-6]
	push	ax
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	push	cs
	call	near ptr _plot_pixel_slow
	add	sp,6
	inc	si
@4@98:
	cmp	si,50000
	jb	short @4@50
   ;	
   ;	  }
   ;	
   ;	  t1=(*my_clock-start)/18.2;          /* calculate how long it took. */
   ;	
	les	bx,dword ptr DGROUP:_my_clock
	mov	ax,word ptr es:[bx]
	sub	ax,di
	mov	word ptr [bp-18],ax
	mov	word ptr [bp-16],0
	FILD	dword ptr [bp-18]
	FDIV	qword ptr DGROUP:s@
	FSTP	dword ptr [bp-10]
   ;	
   ;	
   ;	  set_mode(VGA_256_COLOR_MODE);       /* set the video mode again in order
   ;	
	mov	al,19
	push	ax
	FWAIT	
	push	cs
	call	near ptr _set_mode
	pop	cx
   ;	
   ;	                                         to clear the screen. */
   ;	
   ;	  start=*my_clock;                    /* record the starting time. */
   ;	
	les	bx,dword ptr DGROUP:_my_clock
	mov	di,word ptr es:[bx]
   ;	
   ;	  for(i=0;i<50000L;i++)               /* randomly plot 50000 pixels. */
   ;	
	xor	si,si
	jmp	short @4@194
@4@146:
   ;	
   ;	  {
   ;	    x=rand()%SCREEN_WIDTH;
   ;	
	call	far ptr _rand
	mov	bx,320
	cwd	
	idiv	bx
	mov	word ptr [bp-2],dx
   ;	
   ;	    y=rand()%SCREEN_HEIGHT;
   ;	
	call	far ptr _rand
	mov	bx,200
	cwd	
	idiv	bx
	mov	word ptr [bp-4],dx
   ;	
   ;	    color=rand()%NUM_COLORS;
   ;	
	call	far ptr _rand
	mov	bx,256
	cwd	
	idiv	bx
	mov	word ptr [bp-6],dx
   ;	
   ;	    plot_pixel_fast(x,y,color);
   ;	
	mov	al,byte ptr [bp-6]
	push	ax
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	push	cs
	call	near ptr _plot_pixel_fast
	add	sp,6
	inc	si
@4@194:
	cmp	si,50000
	jb	short @4@146
   ;	
   ;	  }
   ;	
   ;	  t2=(*my_clock-start)/18.2;          /* calculate how long it took. */
   ;	
	les	bx,dword ptr DGROUP:_my_clock
	mov	ax,word ptr es:[bx]
	sub	ax,di
	mov	word ptr [bp-18],ax
	mov	word ptr [bp-16],0
	FILD	dword ptr [bp-18]
	FDIV	qword ptr DGROUP:s@
	FSTP	dword ptr [bp-14]
   ;	
   ;	  set_mode(TEXT_MODE);                /* set the video mode back to
   ;	
	mov	al,3
	push	ax
	FWAIT	
	push	cs
	call	near ptr _set_mode
	pop	cx
   ;	
   ;	                                         text mode. */
   ;	
   ;	  /* output the results... */
   ;	  printf("Slow pixel plotting took %f seconds.\n",t1);
   ;	
	FLD	dword ptr [bp-10]
	add	sp,65528
	FSTP	qword ptr [bp-30]
	push	ds
	mov	ax,offset DGROUP:s@+8
	push	ax
	FWAIT	
	call	far ptr _printf
	add	sp,12
   ;	
   ;	  printf("Fast pixel plotting took %f seconds.\n",t2);
   ;	
	FLD	dword ptr [bp-14]
	add	sp,65528
	FSTP	qword ptr [bp-30]
	push	ds
	mov	ax,offset DGROUP:s@+46
	push	ax
	FWAIT	
	call	far ptr _printf
	add	sp,12
   ;	
   ;	  if (t2 != 0) printf("Fast pixel plotting was %f times faster.\n",t1/t2);
   ;	
	FLD	dword ptr [bp-14]
	FLDZ	
	FCOMPP
	FSTSW	word ptr [bp-18]
	FWAIT	
	mov	ax,word ptr [bp-18]
	sahf	
	je	short @4@266
	FLD	dword ptr [bp-10]
	FDIV	dword ptr [bp-14]
	add	sp,65528
	FSTP	qword ptr [bp-30]
	push	ds
	mov	ax,offset DGROUP:s@+84
	push	ax
	FWAIT	
	call	far ptr _printf
	add	sp,12
@4@266:
   ;	
   ;	
   ;	  return;
   ;	
	jmp	short @4@290
@4@290:
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
PIXEL_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'3333332@Slow pixel plotting took %f seconds.'
	db	10
	db	0
	db	'Fast pixel plotting took %f seconds.'
	db	10
	db	0
	db	'Fast pixel plotting was %f times faster.'
	db	10
	db	0
_DATA	ends
PIXEL_TEXT	segment byte public 'CODE'
PIXEL_TEXT	ends
	public	_plot_pixel_fast
	public	_plot_pixel_slow
	extrn	_printf:far
	extrn	_srand:far
	public	_set_mode
	public	_my_clock
	public	_VGA
	extrn	_rand:far
	public	_main
	extrn	_int86:far
	end
