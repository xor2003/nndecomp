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
	?debug	S "c:\wolfhack.c"
	?debug	C E9E551FE7C0D633A5C776F6C666861636B2E63
	?debug	C E9E551FE7C08574C5F4445462E48
	?debug	C E9E551FE7C0A49445F48454144532E48
	?debug	C E95337528112443A5C494E434C5544455C414C4C4F432E48
	?debug	C E95337528112443A5C494E434C5544455C43545950452E48
	?debug	C E95337528110443A5C494E434C5544455C444F532E48
	?debug	C E95337528112443A5C494E434C5544455C4552524E4F2E48
	?debug	C E95337528112443A5C494E434C5544455C46434E544C2E48
	?debug	C E9533752810F443A5C494E434C5544455C494F2E48
	?debug	C E95337528113443A5C494E434C5544455C7374646172672E68
	?debug	C E95337528110443A5C494E434C5544455C4D454D2E48
	?debug	C E95337528114443A5C494E434C5544455C50524F434553532E48
	?debug	C E95337528112443A5C494E434C5544455C535444494F2E48
	?debug	C E95337528113443A5C494E434C5544455C5354444C49422E48
	?debug	C E95337528113443A5C494E434C5544455C535452494E472E48
	?debug	C E95337528115443A5C494E434C5544455C5359535C535441542E48
	?debug	C E95337528113443A5C494E434C5544455C56414C5545532E48
	?debug	C E95337528110443A5C494E434C5544455C4449522E48
	?debug	C E9E551FE7C0956455253494F4E2E48
	?debug	C E9E551FE7C0A474658565F574C362E48
	?debug	C E9E551FE7C0A415544494F574C362E48
	?debug	C E9E551FE7C094D415053574C362E48
	?debug	C E9E551FE7C0749445F4D4D2E48
	?debug	C E9E551FE7C0749445F504D2E48
	?debug	C E9E551FE7C0749445F43412E48
	?debug	C E9E551FE7C0749445F564C2E48
	?debug	C E9E551FE7C0749445F56482E48
	?debug	C E9E551FE7C0749445F494E2E48
	?debug	C E9E551FE7C0749445F53442E48
	?debug	C E9E551FE7C0749445F55532E48
	?debug	C E95337528111443A5C494E434C5544455C4D4154482E48
	?debug	C E95337528113443A5C494E434C5544455C56414C5545532E48
	?debug	C E9E551FE7C09574C5F4D454E552E48
	?debug	C E9E551FE7C09464F524549474E2E48
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
_halfheight	label	word
	db	0
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	fixed FixedMul (fixed a, fixed b)
   ;	
	assume	cs:_TEXT
_FixedMul	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		return (a>>8)*(b>>8);
   ;	
	mov	dx,word ptr [bp+6]
	mov	ax,word ptr [bp+4]
	mov	cl,8
	call	near ptr N_LXRSH@
	push	ax
	push	dx
	mov	dx,word ptr [bp+10]
	mov	ax,word ptr [bp+8]
	mov	cl,8
	call	near ptr N_LXRSH@
	pop	cx
	pop	bx
	call	near ptr N_LXMUL@
	jmp	short @1@50
@1@50:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_FixedMul	endp
   ;	
   ;	void DrawSpans (int x1, int x2, int height)
   ;	
	assume	cs:_TEXT
_DrawSpans	proc	near
	push	bp
	mov	bp,sp
	sub	sp,22
	push	si
	push	di
	mov	di,word ptr [bp+8]
   ;	
   ;	{
   ;		fixed		length;
   ;		int			ofs;
   ;		int			prestep;
   ;		fixed		startxfrac, startyfrac;
   ;	
   ;		int			x, startx, count, plane, startplane;
   ;		byte		far	*toprow, far *dest;
   ;	
   ;		toprow = planeylookup[height]+bufferofs;
   ;	
	mov	bx,di
	shl	bx,1
	shl	bx,1
	mov	ax,word ptr DGROUP:_planeylookup[bx+2]
	mov	dx,word ptr DGROUP:_planeylookup[bx]
	add	dx,word ptr DGROUP:_bufferofs
	mov	word ptr [bp-22],dx
	mov	word ptr [bp-20],ax
   ;	
   ;		mr_rowofs = mirrorofs[height];
   ;	
	mov	bx,di
	shl	bx,1
	mov	ax,word ptr DGROUP:_mirrorofs[bx]
	mov	word ptr DGROUP:_mr_rowofs,ax
   ;	
   ;	
   ;		mr_xstep = (psin<<1)/height;
   ;	
	mov	ax,di
	cwd	
	push	dx
	push	ax
	mov	ax,word ptr DGROUP:_psin+2
	mov	dx,word ptr DGROUP:_psin
	shl	dx,1
	rcl	ax,1
	push	ax
	push	dx
	call	near ptr N_LDIV@
	mov	word ptr DGROUP:_mr_xstep,ax
   ;	
   ;		mr_ystep = (pcos<<1)/height;
   ;	
	mov	ax,di
	cwd	
	push	dx
	push	ax
	mov	ax,word ptr DGROUP:_pcos+2
	mov	dx,word ptr DGROUP:_pcos
	shl	dx,1
	rcl	ax,1
	push	ax
	push	dx
	call	near ptr N_LDIV@
	mov	word ptr DGROUP:_mr_ystep,ax
   ;	
   ;	
   ;		length = basedist[height];
   ;	
	mov	bx,di
	shl	bx,1
	shl	bx,1
	mov	ax,word ptr DGROUP:_basedist[bx+2]
	mov	dx,word ptr DGROUP:_basedist[bx]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;		startxfrac = (viewx + FixedMul(length,pcos));
   ;	
	push	word ptr DGROUP:_pcos+2
	push	word ptr DGROUP:_pcos
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr _FixedMul
	add	sp,8
	mov	bx,word ptr DGROUP:_viewx+2
	mov	cx,word ptr DGROUP:_viewx
	add	cx,ax
	adc	bx,dx
	mov	word ptr [bp-8],cx
	mov	word ptr [bp-6],bx
   ;	
   ;		startyfrac = (viewy - FixedMul(length,psin));
   ;	
	push	word ptr DGROUP:_psin+2
	push	word ptr DGROUP:_psin
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr _FixedMul
	add	sp,8
	mov	bx,word ptr DGROUP:_viewy+2
	mov	cx,word ptr DGROUP:_viewy
	sub	cx,ax
	sbb	bx,dx
	mov	word ptr [bp-12],cx
	mov	word ptr [bp-10],bx
   ;	
   ;	
   ;	// draw two spans simultaniously
   ;	
   ;		plane = startplane = x1&3;
   ;	
	mov	ax,word ptr [bp+4]
	and	ax,3
	mov	word ptr [bp-18],ax
	mov	word ptr [bp-16],ax
   ;	
   ;		prestep = viewwidth/2 - x1;
   ;	
	mov	ax,word ptr DGROUP:_viewwidth
	mov	bx,2
	cwd	
	idiv	bx
	sub	ax,word ptr [bp+4]
	mov	si,ax
@2@50:
   ;	
   ;		do
   ;		{
   ;			outportb (SC_INDEX+1,1<<plane);
   ;	
	mov	cl,byte ptr [bp-16]
	mov	al,1
	shl	al,cl
	mov	dx,965
	out	dx,al
   ;	
   ;			mr_xfrac = startxfrac - (mr_xstep>>2)*prestep;
   ;	
	mov	ax,word ptr DGROUP:_mr_xstep
	sar	ax,1
	sar	ax,1
	imul	si
	mov	dx,word ptr [bp-8]
	sub	dx,ax
	mov	word ptr DGROUP:_mr_xfrac,dx
   ;	
   ;			mr_yfrac = startyfrac - (mr_ystep>>2)*prestep;
   ;	
	mov	ax,word ptr DGROUP:_mr_ystep
	sar	ax,1
	sar	ax,1
	imul	si
	mov	dx,word ptr [bp-12]
	sub	dx,ax
	mov	word ptr DGROUP:_mr_yfrac,dx
   ;	
   ;	
   ;			startx = x1>>2;
   ;	
	mov	ax,word ptr [bp+4]
	sar	ax,1
	sar	ax,1
	mov	word ptr [bp-14],ax
   ;	
   ;			mr_dest = (unsigned)toprow + startx;
   ;	
	mov	ax,word ptr [bp-22]
	add	ax,word ptr [bp-14]
	mov	word ptr DGROUP:_mr_dest,ax
   ;	
   ;			mr_count = ((x2-plane)>>2) - startx + 1;
   ;	
	mov	ax,word ptr [bp+6]
	sub	ax,word ptr [bp-16]
	sar	ax,1
	sar	ax,1
	sub	ax,word ptr [bp-14]
	inc	ax
	mov	word ptr DGROUP:_mr_count,ax
   ;	
   ;			x1++;
   ;	
	inc	word ptr [bp+4]
   ;	
   ;			prestep--;
   ;	
	dec	si
   ;	
   ;			if (mr_count)
   ;	
	cmp	word ptr DGROUP:_mr_count,0
	je	short @2@98
   ;	
   ;				MapRow ();
   ;	
	call	near ptr _MapRow
@2@98:
   ;	
   ;			plane = (plane+1)&3;
   ;	
	mov	ax,word ptr [bp-16]
	inc	ax
	and	ax,3
	mov	word ptr [bp-16],ax
   ;	
   ;		} while (plane != startplane);
   ;	
	mov	ax,word ptr [bp-16]
	cmp	ax,word ptr [bp-18]
	je	@@0
	jmp	@2@50
@@0:
   ;	
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_DrawSpans	endp
   ;	
   ;	void SetPlaneViewSize (void)
   ;	
	assume	cs:_TEXT
_SetPlaneViewSize	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	di
   ;	
   ;	{
   ;		int		x,y;
   ;		byte 	far *dest, far *src;
   ;	
   ;		halfheight = viewheight>>1;
   ;	
	mov	ax,word ptr DGROUP:_viewheight
	sar	ax,1
	mov	word ptr DGROUP:_halfheight,ax
   ;	
   ;	
   ;	
   ;		for (y=0 ; y<halfheight ; y++)
   ;	
	xor	si,si
	jmp	@3@122
@3@50:
   ;	
   ;		{
   ;			planeylookup[y] = (byte far *)0xa0000000l + (halfheight-1-y)*SCREENBWIDE;;
   ;	
	mov	ax,word ptr DGROUP:_halfheight
	dec	ax
	sub	ax,si
	mov	dx,80
	imul	dx
	add	ax,0
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	word ptr DGROUP:_planeylookup[bx],ax
	mov	word ptr DGROUP:_planeylookup[bx+2],40960
   ;	
   ;			mirrorofs[y] = (y*2+1)*SCREENBWIDE;
   ;	
	mov	ax,si
	shl	ax,1
	inc	ax
	mov	dx,80
	imul	dx
	mov	bx,si
	shl	bx,1
	mov	word ptr DGROUP:_mirrorofs[bx],ax
   ;	
   ;	
   ;			stepscale[y] = y*GLOBAL1/32;
   ;	
	xor	ax,ax
	mov	dx,32
	push	ax
	push	dx
	mov	ax,si
	cwd	
	xor	dx,dx
	push	ax
	push	dx
	call	near ptr N_LDIV@
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	word ptr DGROUP:_stepscale[bx],ax
	mov	word ptr DGROUP:_stepscale[bx+2],dx
   ;	
   ;			if (y>0)
   ;	
	or	si,si
	jle	short @3@98
   ;	
   ;				basedist[y] = GLOBAL1/2*scale/y;
   ;	
	mov	ax,si
	cwd	
	push	dx
	push	ax
	mov	dx,word ptr DGROUP:_scale+2
	mov	ax,word ptr DGROUP:_scale
	mov	cl,15
	call	near ptr N_LXLSH@
	push	dx
	push	ax
	call	near ptr N_LDIV@
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	word ptr DGROUP:_basedist[bx],ax
	mov	word ptr DGROUP:_basedist[bx+2],dx
@3@98:
	inc	si
@3@122:
	cmp	si,word ptr DGROUP:_halfheight
	jge	@@1
	jmp	@3@50
@@1:
   ;	
   ;		}
   ;	
   ;		src = PM_GetPage(0);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _PM_GetPage
	pop	cx
	mov	word ptr [bp-8],0
	mov	word ptr [bp-6],ax
   ;	
   ;		dest = planepics;
   ;	
	mov	word ptr [bp-4],offset _planepics
	mov	word ptr [bp-2],seg _planepics
   ;	
   ;		for (x=0 ; x<4096 ; x++)
   ;	
	xor	di,di
	jmp	short @3@218
@3@170:
   ;	
   ;		{
   ;			*dest = *src++;
   ;	
	les	bx,dword ptr [bp-8]
	mov	al,byte ptr es:[bx]
	les	bx,dword ptr [bp-4]
	mov	byte ptr es:[bx],al
	inc	word ptr [bp-8]
   ;	
   ;			dest += 2;
   ;	
	add	word ptr [bp-4],2
	inc	di
@3@218:
	cmp	di,4096
	jl	short @3@170
   ;	
   ;		}
   ;		src = PM_GetPage(1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _PM_GetPage
	pop	cx
	mov	word ptr [bp-8],0
	mov	word ptr [bp-6],ax
   ;	
   ;		dest = planepics+1;
   ;	
	mov	word ptr [bp-4],offset _planepics+1
	mov	word ptr [bp-2],seg _planepics
   ;	
   ;		for (x=0 ; x<4096 ; x++)
   ;	
	xor	di,di
	jmp	short @3@314
@3@266:
   ;	
   ;		{
   ;			*dest = *src++;
   ;	
	les	bx,dword ptr [bp-8]
	mov	al,byte ptr es:[bx]
	les	bx,dword ptr [bp-4]
	mov	byte ptr es:[bx],al
	inc	word ptr [bp-8]
   ;	
   ;			dest += 2;
   ;	
	add	word ptr [bp-4],2
	inc	di
@3@314:
	cmp	di,4096
	jl	short @3@266
   ;	
   ;		}
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_SetPlaneViewSize	endp
   ;	
   ;	void DrawPlanes (void)
   ;	
	assume	cs:_TEXT
_DrawPlanes	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
   ;	
   ;	{
   ;		int		height, lastheight;
   ;		int		x;
   ;	
   ;		if (viewheight>>1 != halfheight)
   ;	
	mov	ax,word ptr DGROUP:_viewheight
	sar	ax,1
	cmp	ax,word ptr DGROUP:_halfheight
	je	short @4@74
   ;	
   ;			SetPlaneViewSize ();		// screen size has changed
   ;	
	call	near ptr _SetPlaneViewSize
@4@74:
   ;	
   ;	
   ;	
   ;		psin = viewsin;
   ;	
	mov	ax,word ptr DGROUP:_viewsin+2
	mov	dx,word ptr DGROUP:_viewsin
	mov	word ptr DGROUP:_psin,dx
	mov	word ptr DGROUP:_psin+2,ax
   ;	
   ;		if (psin < 0)
   ;	
	cmp	word ptr DGROUP:_psin+2,0
	jg	short @4@170
	jl	short @4@146
	cmp	word ptr DGROUP:_psin,0
	jae	short @4@170
@4@146:
   ;	
   ;			psin = -(psin&0xffff);
   ;	
	mov	ax,word ptr DGROUP:_psin+2
	mov	dx,word ptr DGROUP:_psin
	and	dx,65535
	and	ax,0
	neg	ax
	neg	dx
	sbb	ax,0
	mov	word ptr DGROUP:_psin,dx
	mov	word ptr DGROUP:_psin+2,ax
@4@170:
   ;	
   ;		pcos = viewcos;
   ;	
	mov	ax,word ptr DGROUP:_viewcos+2
	mov	dx,word ptr DGROUP:_viewcos
	mov	word ptr DGROUP:_pcos,dx
	mov	word ptr DGROUP:_pcos+2,ax
   ;	
   ;		if (pcos < 0)
   ;	
	cmp	word ptr DGROUP:_pcos+2,0
	jg	short @4@266
	jl	short @4@242
	cmp	word ptr DGROUP:_pcos,0
	jae	short @4@266
@4@242:
   ;	
   ;			pcos = -(pcos&0xffff);
   ;	
	mov	ax,word ptr DGROUP:_pcos+2
	mov	dx,word ptr DGROUP:_pcos
	and	dx,65535
	and	ax,0
	neg	ax
	neg	dx
	sbb	ax,0
	mov	word ptr DGROUP:_pcos,dx
	mov	word ptr DGROUP:_pcos+2,ax
@4@266:
   ;	
   ;	
   ;	//
   ;	// loop over all columns
   ;	//
   ;		lastheight = halfheight;
   ;	
	mov	si,word ptr DGROUP:_halfheight
   ;	
   ;	
   ;		for (x=0 ; x<viewwidth ; x++)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @4@578
@4@290:
   ;	
   ;		{
   ;			height = wallheight[x]>>3;
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	mov	ax,word ptr DGROUP:_wallheight[bx]
	shr	ax,1
	shr	ax,1
	shr	ax,1
	mov	di,ax
   ;	
   ;			if (height < lastheight)
   ;	
	cmp	di,si
	jge	short @4@386
@4@314:
   ;	
   ;			{	// more starts
   ;				do
   ;				{
   ;					spanstart[--lastheight] = x;
   ;	
	dec	si
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr [bp-2]
	mov	word ptr DGROUP:_spanstart[bx],ax
   ;	
   ;				} while (lastheight > height);
   ;	
	cmp	si,di
	jg	short @4@314
   ;	
   ;			}
   ;	
	jmp	short @4@554
@4@386:
   ;	
   ;			else if (height > lastheight)
   ;	
	cmp	di,si
	jle	short @4@554
   ;	
   ;			{	// draw spans
   ;				if (height > halfheight)
   ;	
	cmp	di,word ptr DGROUP:_halfheight
	jle	short @4@458
   ;	
   ;					height = halfheight;
   ;	
	mov	di,word ptr DGROUP:_halfheight
@4@458:
	jmp	short @4@530
@4@482:
   ;	
   ;				for ( ; lastheight < height ; lastheight++)
   ;					DrawSpans (spanstart[lastheight], x-1, lastheight);
   ;	
	push	si
	mov	ax,word ptr [bp-2]
	dec	ax
	push	ax
	mov	bx,si
	shl	bx,1
	push	word ptr DGROUP:_spanstart[bx]
	call	near ptr _DrawSpans
	add	sp,6
	inc	si
@4@530:
	cmp	si,di
	jl	short @4@482
@4@554:
	inc	word ptr [bp-2]
@4@578:
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr DGROUP:_viewwidth
	jl	short @4@290
   ;	
   ;			}
   ;		}
   ;	
   ;		height = halfheight;
   ;	
	mov	di,word ptr DGROUP:_halfheight
	jmp	short @4@674
@4@626:
   ;	
   ;		for ( ; lastheight < height ; lastheight++)
   ;			DrawSpans (spanstart[lastheight], x-1, lastheight);
   ;	
	push	si
	mov	ax,word ptr [bp-2]
	dec	ax
	push	ax
	mov	bx,si
	shl	bx,1
	push	word ptr DGROUP:_spanstart[bx]
	call	near ptr _DrawSpans
	add	sp,6
	inc	si
@4@674:
	cmp	si,di
	jl	short @4@626
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_DrawPlanes	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_stepscale	label	word
	db	400 dup (?)
_spanstart	label	word
	db	200 dup (?)
_mirrorofs	label	word
	db	200 dup (?)
_basedist	label	word
	db	400 dup (?)
_menuitems	label	word
	db	2 dup (?)
_planeylookup	label	dword
	db	400 dup (?)
_mr_xfrac	label	word
	db	2 dup (?)
_mr_yfrac	label	word
	db	2 dup (?)
_mr_xstep	label	word
	db	2 dup (?)
_mr_ystep	label	word
	db	2 dup (?)
_psin	label	word
	db	4 dup (?)
_mr_dest	label	word
	db	2 dup (?)
_mr_rowofs	label	word
	db	2 dup (?)
_mr_count	label	word
	db	2 dup (?)
_pcos	label	word
	db	4 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	public	_DrawSpans
	public	_DrawPlanes
	public	_pcos
	public	_mr_count
	public	_mr_rowofs
	public	_mr_dest
	public	_psin
	public	_mr_ystep
	public	_mr_xstep
	public	_mr_yfrac
	public	_mr_xfrac
	extrn	_viewwidth:word
	extrn	_wallheight:word
	extrn	_viewheight:word
	public	_halfheight
	public	_planeylookup
	public	_menuitems
	extrn	_PM_GetPage:near
	public	_basedist
	public	_FixedMul
	public	_mirrorofs
	extrn	_bufferofs:word
	extrn	_viewcos:word
	extrn	_viewsin:word
	extrn	_viewy:word
	extrn	_viewx:word
	extrn	_MapRow:near
	public	_spanstart
	public	_stepscale
	extrn	_planepics:byte
	public	_SetPlaneViewSize
	extrn	N_LDIV@:far
	extrn	N_LXMUL@:far
	extrn	N_LXLSH@:far
	extrn	N_LXRSH@:far
	extrn	_scale:word
	end
