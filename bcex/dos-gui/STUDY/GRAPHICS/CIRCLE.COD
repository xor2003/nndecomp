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
	?debug	S "c:\circle.c"
	?debug	C E97655FE7C0B633A5C636972636C652E63
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
	?debug	C E95337528110443A5C494E434C5544455C646F732E68
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
   ;	void circle_slow(int x,int y, int radius, byte color)
   ;	
	assume	cs:_TEXT
_circle_slow	proc	near
	push	bp
	mov	bp,sp
	sub	sp,16
	push	si
	push	di
   ;	
   ;	{
   ;	  float n=0,invradius=1/(float)radius;
   ;	
	FLDZ	
	FSTP	dword ptr [bp-4]
	FWAIT	
	mov	ax,word ptr [bp+8]
	mov	word ptr [bp-10],ax
	FILD	word ptr [bp-10]
	FLD1	
	FDIVR	
	FSTP	dword ptr [bp-8]
   ;	
   ;	  int dx=0,dy=radius-1;
   ;	
	xor	si,si
	FWAIT	
	mov	ax,word ptr [bp+8]
	dec	ax
	mov	word ptr [bp-12],ax
   ;	
   ;	  word dxoffset,dyoffset,offset=(y<<8)+(y<<6)+x;
   ;	
	mov	ax,word ptr [bp+6]
	mov	cl,8
	shl	ax,cl
	mov	dx,word ptr [bp+6]
	mov	cl,6
	shl	dx,cl
	add	ax,dx
	add	ax,word ptr [bp+4]
	mov	di,ax
	jmp	@2@74
@2@50:
   ;	
   ;	
   ;	  while (dx<=dy)
   ;	  {
   ;	    dxoffset = (dx<<8) + (dx<<6);
   ;	
	mov	ax,si
	mov	cl,8
	shl	ax,cl
	mov	dx,si
	mov	cl,6
	shl	dx,cl
	add	ax,dx
	mov	word ptr [bp-14],ax
   ;	
   ;	    dyoffset = (dy<<8) + (dy<<6);
   ;	
	mov	ax,word ptr [bp-12]
	mov	cl,8
	shl	ax,cl
	mov	dx,word ptr [bp-12]
	mov	cl,6
	shl	dx,cl
	add	ax,dx
	mov	word ptr [bp-16],ax
   ;	
   ;	    VGA[offset+dy-dxoffset] = color;  /* octant 0 */
   ;	
	mov	ax,di
	add	ax,word ptr [bp-12]
	sub	ax,word ptr [bp-14]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	    VGA[offset+dx-dyoffset] = color;  /* octant 1 */
   ;	
	mov	ax,di
	add	ax,si
	sub	ax,word ptr [bp-16]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	    VGA[offset-dx-dyoffset] = color;  /* octant 2 */
   ;	
	mov	ax,di
	sub	ax,si
	sub	ax,word ptr [bp-16]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	    VGA[offset-dy-dxoffset] = color;  /* octant 3 */
   ;	
	mov	ax,di
	sub	ax,word ptr [bp-12]
	sub	ax,word ptr [bp-14]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	    VGA[offset-dy+dxoffset] = color;  /* octant 4 */
   ;	
	mov	ax,di
	sub	ax,word ptr [bp-12]
	add	ax,word ptr [bp-14]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	    VGA[offset-dx+dyoffset] = color;  /* octant 5 */
   ;	
	mov	ax,di
	sub	ax,si
	add	ax,word ptr [bp-16]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	    VGA[offset+dx+dyoffset] = color;  /* octant 6 */
   ;	
	mov	ax,di
	add	ax,si
	add	ax,word ptr [bp-16]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	    VGA[offset+dy+dxoffset] = color;  /* octant 7 */
   ;	
	mov	ax,di
	add	ax,word ptr [bp-12]
	add	ax,word ptr [bp-14]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	    dx++;
   ;	
	inc	si
   ;	
   ;	    n+=invradius;
   ;	
	FLD	dword ptr [bp-8]
	FADD	dword ptr [bp-4]
	FSTP	dword ptr [bp-4]
   ;	
   ;	    dy=radius * sin(acos(n));
   ;	
	FLD	dword ptr [bp-4]
	add	sp,65528
	FSTP	qword ptr [bp-28]
	FWAIT	
	call	near ptr _acos
	add	sp,8
	add	sp,65528
	FSTP	qword ptr [bp-28]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	mov	ax,word ptr [bp+8]
	mov	word ptr [bp-10],ax
	FILD	word ptr [bp-10]
	FMUL	
	call	near ptr N_FTOL@
	mov	word ptr [bp-12],ax
@2@74:
	cmp	si,word ptr [bp-12]
	jg	@@0
	jmp	@2@50
@@0:
   ;	
   ;	  }
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_circle_slow	endp
   ;	
   ;	void circle_fast(int x,int y, int radius, byte color)
   ;	
	assume	cs:_TEXT
_circle_fast	proc	near
	push	bp
	mov	bp,sp
	sub	sp,16
	push	si
	push	di
   ;	
   ;	{
   ;	  fixed16_16 n=0,invradius=(1/(float)radius)*0x10000L;
   ;	
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],0
	mov	ax,word ptr [bp+8]
	mov	word ptr [bp-10],ax
	FILD	word ptr [bp-10]
	FLD1	
	FDIVR	
	FMUL	dword ptr DGROUP:s@
	call	near ptr N_FTOL@
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],dx
   ;	
   ;	  int dx=0,dy=radius-1;
   ;	
	xor	si,si
	mov	ax,word ptr [bp+8]
	dec	ax
	mov	word ptr [bp-12],ax
   ;	
   ;	  word dxoffset,dyoffset,offset = (y<<8)+(y<<6)+x;
   ;	
	mov	ax,word ptr [bp+6]
	mov	cl,8
	shl	ax,cl
	mov	dx,word ptr [bp+6]
	mov	cl,6
	shl	dx,cl
	add	ax,dx
	add	ax,word ptr [bp+4]
	mov	di,ax
	jmp	@3@74
@3@50:
   ;	
   ;	
   ;	  while (dx<=dy)
   ;	  {
   ;	    dxoffset = (dx<<8) + (dx<<6);
   ;	
	mov	ax,si
	mov	cl,8
	shl	ax,cl
	mov	dx,si
	mov	cl,6
	shl	dx,cl
	add	ax,dx
	mov	word ptr [bp-14],ax
   ;	
   ;	    dyoffset = (dy<<8) + (dy<<6);
   ;	
	mov	ax,word ptr [bp-12]
	mov	cl,8
	shl	ax,cl
	mov	dx,word ptr [bp-12]
	mov	cl,6
	shl	dx,cl
	add	ax,dx
	mov	word ptr [bp-16],ax
   ;	
   ;	    VGA[offset+dy-dxoffset] = color;  /* octant 0 */
   ;	
	mov	ax,di
	add	ax,word ptr [bp-12]
	sub	ax,word ptr [bp-14]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	    VGA[offset+dx-dyoffset] = color;  /* octant 1 */
   ;	
	mov	ax,di
	add	ax,si
	sub	ax,word ptr [bp-16]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	    VGA[offset-dx-dyoffset] = color;  /* octant 2 */
   ;	
	mov	ax,di
	sub	ax,si
	sub	ax,word ptr [bp-16]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	    VGA[offset-dy-dxoffset] = color;  /* octant 3 */
   ;	
	mov	ax,di
	sub	ax,word ptr [bp-12]
	sub	ax,word ptr [bp-14]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	    VGA[offset-dy+dxoffset] = color;  /* octant 4 */
   ;	
	mov	ax,di
	sub	ax,word ptr [bp-12]
	add	ax,word ptr [bp-14]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	    VGA[offset-dx+dyoffset] = color;  /* octant 5 */
   ;	
	mov	ax,di
	sub	ax,si
	add	ax,word ptr [bp-16]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	    VGA[offset+dx+dyoffset] = color;  /* octant 6 */
   ;	
	mov	ax,di
	add	ax,si
	add	ax,word ptr [bp-16]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	    VGA[offset+dy+dxoffset] = color;  /* octant 7 */
   ;	
	mov	ax,di
	add	ax,word ptr [bp-12]
	add	ax,word ptr [bp-14]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	    dx++;
   ;	
	inc	si
   ;	
   ;	    n+=invradius;
   ;	
	mov	ax,word ptr [bp-6]
	mov	dx,word ptr [bp-8]
	add	word ptr [bp-4],dx
	adc	word ptr [bp-2],ax
   ;	
   ;	    dy = (int)((radius * SIN_ACOS[(int)(n>>6)]) >> 16);
   ;	
	mov	dx,word ptr [bp-2]
	mov	ax,word ptr [bp-4]
	mov	cl,6
	call	near ptr N_LXRSH@
	shl	ax,1
	shl	ax,1
	mov	bx,ax
	mov	cx,word ptr DGROUP:_SIN_ACOS[bx+2]
	mov	bx,word ptr DGROUP:_SIN_ACOS[bx]
	mov	ax,word ptr [bp+8]
	cwd	
	call	near ptr N_LXMUL@
	mov	ax,dx
	cwd	
	mov	word ptr [bp-12],ax
@3@74:
	cmp	si,word ptr [bp-12]
	jg	@@1
	jmp	@3@50
@@1:
   ;	
   ;	  }
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_circle_fast	endp
   ;	
   ;	void circle_fill(int x,int y, int radius, byte color)
   ;	
	assume	cs:_TEXT
_circle_fill	proc	near
	push	bp
	mov	bp,sp
	sub	sp,18
	push	si
	push	di
   ;	
   ;	{
   ;	  fixed16_16 n=0,invradius=(1/(float)radius)*0x10000L;
   ;	
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],0
	mov	ax,word ptr [bp+8]
	mov	word ptr [bp-10],ax
	FILD	word ptr [bp-10]
	FLD1	
	FDIVR	
	FMUL	dword ptr DGROUP:s@
	call	near ptr N_FTOL@
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],dx
   ;	
   ;	  int dx=0,dy=radius-1,i;
   ;	
	xor	si,si
	mov	ax,word ptr [bp+8]
	dec	ax
	mov	word ptr [bp-12],ax
   ;	
   ;	  word dxoffset,dyoffset,offset = (y<<8)+(y<<6)+x;
   ;	
	mov	ax,word ptr [bp+6]
	mov	cl,8
	shl	ax,cl
	mov	dx,word ptr [bp+6]
	mov	cl,6
	shl	dx,cl
	add	ax,dx
	add	ax,word ptr [bp+4]
	mov	di,ax
	jmp	@4@170
@4@50:
   ;	
   ;	
   ;	  while (dx<=dy)
   ;	  {
   ;	    dxoffset = (dx<<8) + (dx<<6);
   ;	
	mov	ax,si
	mov	cl,8
	shl	ax,cl
	mov	dx,si
	mov	cl,6
	shl	dx,cl
	add	ax,dx
	mov	word ptr [bp-16],ax
   ;	
   ;	    dyoffset = (dy<<8) + (dy<<6);
   ;	
	mov	ax,word ptr [bp-12]
	mov	cl,8
	shl	ax,cl
	mov	dx,word ptr [bp-12]
	mov	cl,6
	shl	dx,cl
	add	ax,dx
	mov	word ptr [bp-18],ax
   ;	
   ;	    for(i=dy;i>=dx;i--,dyoffset-=SCREEN_WIDTH)
   ;	
	mov	ax,word ptr [bp-12]
	mov	word ptr [bp-14],ax
	jmp	@4@122
@4@74:
   ;	
   ;	    {
   ;	      VGA[offset+i -dxoffset] = color;  /* octant 0 */
   ;	
	mov	ax,di
	add	ax,word ptr [bp-14]
	sub	ax,word ptr [bp-16]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	      VGA[offset+dx-dyoffset] = color;  /* octant 1 */
   ;	
	mov	ax,di
	add	ax,si
	sub	ax,word ptr [bp-18]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	      VGA[offset-dx-dyoffset] = color;  /* octant 2 */
   ;	
	mov	ax,di
	sub	ax,si
	sub	ax,word ptr [bp-18]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	      VGA[offset-i -dxoffset] = color;  /* octant 3 */
   ;	
	mov	ax,di
	sub	ax,word ptr [bp-14]
	sub	ax,word ptr [bp-16]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	      VGA[offset-i +dxoffset] = color;  /* octant 4 */
   ;	
	mov	ax,di
	sub	ax,word ptr [bp-14]
	add	ax,word ptr [bp-16]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	      VGA[offset-dx+dyoffset] = color;  /* octant 5 */
   ;	
	mov	ax,di
	sub	ax,si
	add	ax,word ptr [bp-18]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	      VGA[offset+dx+dyoffset] = color;  /* octant 6 */
   ;	
	mov	ax,di
	add	ax,si
	add	ax,word ptr [bp-18]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
   ;	
   ;	      VGA[offset+i +dxoffset] = color;  /* octant 7 */
   ;	
	mov	ax,di
	add	ax,word ptr [bp-14]
	add	ax,word ptr [bp-16]
	mov	bx,word ptr DGROUP:_VGA
	add	bx,ax
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx],al
	dec	word ptr [bp-14]
	mov	ax,word ptr [bp-18]
	add	ax,65216
	mov	word ptr [bp-18],ax
@4@122:
	cmp	word ptr [bp-14],si
	jl	@@2
	jmp	@4@74
@@2:
   ;	
   ;	    }
   ;	    dx++;
   ;	
	inc	si
   ;	
   ;	    n+=invradius;
   ;	
	mov	ax,word ptr [bp-6]
	mov	dx,word ptr [bp-8]
	add	word ptr [bp-4],dx
	adc	word ptr [bp-2],ax
   ;	
   ;	    dy = (int)((radius * SIN_ACOS[(int)(n>>6)]) >> 16);
   ;	
	mov	dx,word ptr [bp-2]
	mov	ax,word ptr [bp-4]
	mov	cl,6
	call	near ptr N_LXRSH@
	shl	ax,1
	shl	ax,1
	mov	bx,ax
	mov	cx,word ptr DGROUP:_SIN_ACOS[bx+2]
	mov	bx,word ptr DGROUP:_SIN_ACOS[bx]
	mov	ax,word ptr [bp+8]
	cwd	
	call	near ptr N_LXMUL@
	mov	ax,dx
	cwd	
	mov	word ptr [bp-12],ax
@4@170:
	cmp	si,word ptr [bp-12]
	jg	@@3
	jmp	@4@50
@@3:
   ;	
   ;	  }
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_circle_fill	endp
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
   ;	  int x,y,radius,color;
   ;	  float t1,t2;
   ;	  word i,start;
   ;	
   ;	  for(i=0;i<1024;i++)                 /* create the sin(arccos(x)) table. */
   ;	
	xor	si,si
	jmp	short @5@98
@5@50:
   ;	
   ;	  {
   ;	    SIN_ACOS[i]=sin(acos((float)i/1024))*0x10000L;
   ;	
	mov	word ptr [bp-20],si
	mov	word ptr [bp-18],0
	FILD	dword ptr [bp-20]
	FDIV	dword ptr DGROUP:s@+4
	add	sp,65528
	FSTP	qword ptr [bp-32]
	FWAIT	
	call	near ptr _acos
	add	sp,8
	add	sp,65528
	FSTP	qword ptr [bp-32]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@
	call	near ptr N_FTOL@
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	word ptr DGROUP:_SIN_ACOS[bx],ax
	mov	word ptr DGROUP:_SIN_ACOS[bx+2],dx
	inc	si
@5@98:
	cmp	si,1024
	jb	short @5@50
   ;	
   ;	  }
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
	mov	ax,word ptr [bx]
	mov	word ptr [bp-16],ax
   ;	
   ;	  for(i=0;i<5000;i++)                 /* randomly draw 5000 circles. */
   ;	
	xor	si,si
	jmp	short @5@194
@5@146:
   ;	
   ;	  {
   ;	    radius=rand()%90+1;
   ;	
	call	near ptr _rand
	mov	bx,90
	cwd	
	idiv	bx
	inc	dx
	mov	di,dx
   ;	
   ;	    x=rand()%(SCREEN_WIDTH-radius*2)+radius;
   ;	
	call	near ptr _rand
	mov	dx,di
	shl	dx,1
	mov	bx,320
	sub	bx,dx
	cwd	
	idiv	bx
	add	dx,di
	mov	word ptr [bp-2],dx
   ;	
   ;	    y=rand()%(SCREEN_HEIGHT-radius*2)+radius;
   ;	
	call	near ptr _rand
	mov	dx,di
	shl	dx,1
	mov	bx,200
	sub	bx,dx
	cwd	
	idiv	bx
	add	dx,di
	mov	word ptr [bp-4],dx
   ;	
   ;	    color=rand()%NUM_COLORS;
   ;	
	call	near ptr _rand
	mov	bx,256
	cwd	
	idiv	bx
	mov	word ptr [bp-6],dx
   ;	
   ;	    circle_slow(x,y,radius,color);
   ;	
	mov	al,byte ptr [bp-6]
	push	ax
	push	di
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	call	near ptr _circle_slow
	add	sp,8
	inc	si
@5@194:
	cmp	si,5000
	jb	short @5@146
   ;	
   ;	  }
   ;	
   ;	  t1=(*my_clock-start)/18.2;          /* calculate how long it took. */
   ;	
	mov	bx,word ptr DGROUP:_my_clock
	mov	ax,word ptr [bx]
	sub	ax,word ptr [bp-16]
	mov	word ptr [bp-20],ax
	mov	word ptr [bp-18],0
	FILD	dword ptr [bp-20]
	FDIV	qword ptr DGROUP:s@+8
	FSTP	dword ptr [bp-10]
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
	mov	ax,word ptr [bx]
	mov	word ptr [bp-16],ax
   ;	
   ;	  for(i=0;i<5000;i++)                 /* randomly draw 5000 circles. */
   ;	
	xor	si,si
	jmp	short @5@290
@5@242:
   ;	
   ;	  {
   ;	    radius=rand()%90+1;
   ;	
	call	near ptr _rand
	mov	bx,90
	cwd	
	idiv	bx
	inc	dx
	mov	di,dx
   ;	
   ;	    x=rand()%(SCREEN_WIDTH-radius*2)+radius;
   ;	
	call	near ptr _rand
	mov	dx,di
	shl	dx,1
	mov	bx,320
	sub	bx,dx
	cwd	
	idiv	bx
	add	dx,di
	mov	word ptr [bp-2],dx
   ;	
   ;	    y=rand()%(SCREEN_HEIGHT-radius*2)+radius;
   ;	
	call	near ptr _rand
	mov	dx,di
	shl	dx,1
	mov	bx,200
	sub	bx,dx
	cwd	
	idiv	bx
	add	dx,di
	mov	word ptr [bp-4],dx
   ;	
   ;	    color=rand()%NUM_COLORS;
   ;	
	call	near ptr _rand
	mov	bx,256
	cwd	
	idiv	bx
	mov	word ptr [bp-6],dx
   ;	
   ;	    circle_fast(x,y,radius,color);
   ;	
	mov	al,byte ptr [bp-6]
	push	ax
	push	di
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	call	near ptr _circle_fast
	add	sp,8
	inc	si
@5@290:
	cmp	si,5000
	jb	short @5@242
   ;	
   ;	  }
   ;	
   ;	  t2=(*my_clock-start)/18.2;          /* calculate how long it took. */
   ;	
	mov	bx,word ptr DGROUP:_my_clock
	mov	ax,word ptr [bx]
	sub	ax,word ptr [bp-16]
	mov	word ptr [bp-20],ax
	mov	word ptr [bp-18],0
	FILD	dword ptr [bp-20]
	FDIV	qword ptr DGROUP:s@+8
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
   ;	  for(i=0;i<1000;i++)                 /* draw 1000 filled circles. */
   ;	
	xor	si,si
	jmp	short @5@386
@5@338:
   ;	
   ;	  {
   ;	    radius=rand()%90+1;
   ;	
	call	near ptr _rand
	mov	bx,90
	cwd	
	idiv	bx
	inc	dx
	mov	di,dx
   ;	
   ;	    x=rand()%(SCREEN_WIDTH-radius*2)+radius;
   ;	
	call	near ptr _rand
	mov	dx,di
	shl	dx,1
	mov	bx,320
	sub	bx,dx
	cwd	
	idiv	bx
	add	dx,di
	mov	word ptr [bp-2],dx
   ;	
   ;	    y=rand()%(SCREEN_HEIGHT-radius*2)+radius;
   ;	
	call	near ptr _rand
	mov	dx,di
	shl	dx,1
	mov	bx,200
	sub	bx,dx
	cwd	
	idiv	bx
	add	dx,di
	mov	word ptr [bp-4],dx
   ;	
   ;	    color=rand()%NUM_COLORS;
   ;	
	call	near ptr _rand
	mov	bx,256
	cwd	
	idiv	bx
	mov	word ptr [bp-6],dx
   ;	
   ;	    circle_fill(x,y,radius,color);
   ;	
	mov	al,byte ptr [bp-6]
	push	ax
	push	di
	push	word ptr [bp-4]
	push	word ptr [bp-2]
	call	near ptr _circle_fill
	add	sp,8
	inc	si
@5@386:
	cmp	si,1000
	jb	short @5@338
   ;	
   ;	  }
   ;	  set_mode(TEXT_MODE);                /* set the video mode back to
   ;	
	mov	al,3
	push	ax
	call	near ptr _set_mode
	pop	cx
   ;	
   ;	                                         text mode. */
   ;	
   ;	  /* output the results... */
   ;	  printf("Slow circle drawing took %f seconds.\n",t1);
   ;	
	FLD	dword ptr [bp-10]
	add	sp,65528
	FSTP	qword ptr [bp-32]
	mov	ax,offset DGROUP:s@+16
	push	ax
	FWAIT	
	call	near ptr _printf
	add	sp,10
   ;	
   ;	  printf("Fast circle drawing took %f seconds.\n",t2);
   ;	
	FLD	dword ptr [bp-14]
	add	sp,65528
	FSTP	qword ptr [bp-32]
	mov	ax,offset DGROUP:s@+54
	push	ax
	FWAIT	
	call	near ptr _printf
	add	sp,10
   ;	
   ;	  if (t2 != 0) printf("Fast circle drawing was %f times faster.\n",t1/t2);
   ;	
	FLD	dword ptr [bp-14]
	FLDZ	
	FCOMPP
	FSTSW	word ptr [bp-20]
	FWAIT	
	mov	ax,word ptr [bp-20]
	sahf	
	je	short @5@458
	FLD	dword ptr [bp-10]
	FDIV	dword ptr [bp-14]
	add	sp,65528
	FSTP	qword ptr [bp-32]
	mov	ax,offset DGROUP:s@+92
	push	ax
	FWAIT	
	call	near ptr _printf
	add	sp,10
@5@458:
   ;	
   ;	
   ;	  return;
   ;	
	jmp	short @5@482
@5@482:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_main	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_SIN_ACOS	label	word
	db	4096 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	0
	db	0
	db	-128
	db	'G'
	db	0
	db	0
	db	-128
	db	'D3333332@Slow circle drawing took %f seconds.'
	db	10
	db	0
	db	'Fast circle drawing took %f seconds.'
	db	10
	db	0
	db	'Fast circle drawing was %f times faster.'
	db	10
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	extrn	_acos:near
	public	_circle_fast
	public	_circle_slow
	extrn	_printf:near
	public	_circle_fill
	extrn	_srand:near
	public	_set_mode
	public	_my_clock
	public	_VGA
	extrn	_rand:near
	public	_SIN_ACOS
	public	_main
	extrn	_sin:near
	extrn	_int86:near
	extrn	N_LXMUL@:far
	extrn	N_LXRSH@:far
	extrn	N_FTOL@:far
	end
