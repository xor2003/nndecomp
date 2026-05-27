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
	?debug	S "c:\wl_draw.c"
	?debug	C E9E551FE7C0C633A5C776C5F647261772E63
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
	?debug	C E95337528110443A5C494E434C5544455C444F532E48
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
_screenloc	label	word
	db	0
	db	0
	db	0
	db	65
	db	0
	db	130
_freelatch	label	word
	db	0
	db	195
_tileglobal	label	word
	db	0
	db	0
	db	1
	db	0
_mindist	label	word
	db	0
	db	88
	db	0
	db	0
_costable	label	dword
	dd	_sintable+360
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	fixed FixedByFrac (fixed a, fixed b)
   ;	
	assume	cs:_TEXT
_FixedByFrac	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;	//
   ;	// setup
   ;	//
   ;	asm	mov	si,[WORD PTR b+2]	// sign of result = sign of fraction
   ;	
		mov		si,[WORD PTR [bp+8]+2]	
   ;	
   ;	
   ;	asm	mov	ax,[WORD PTR a]
   ;	
		mov		ax,[WORD PTR [bp+4]]
   ;	
   ;	asm	mov	cx,[WORD PTR a+2]
   ;	
		mov		cx,[WORD PTR [bp+4]+2]
   ;	
   ;	
   ;	asm	or	cx,cx
   ;	
		or		cx,cx
   ;	
   ;	asm	jns	aok:				// negative?
   ;	
	jns	short @1@242
   ;	
   ;	asm	neg	cx
   ;	
		neg		cx
   ;	
   ;	asm	neg	ax
   ;	
		neg		ax
   ;	
   ;	asm	sbb	cx,0
   ;	
		sbb		cx,0
   ;	
   ;	asm	xor	si,0x8000			// toggle sign of result
   ;	
		xor		si,08000H			
@1@242:
   ;	
   ;	aok:
   ;	
   ;	//
   ;	// multiply  cx:ax by bx
   ;	//
   ;	asm	mov	bx,[WORD PTR b]
   ;	
		mov		bx,[WORD PTR [bp+8]]
   ;	
   ;	asm	mul	bx					// fraction*fraction
   ;	
		mul		bx					
   ;	
   ;	asm	mov	di,dx				// di is low word of result
   ;	
		mov		di,dx				
   ;	
   ;	asm	mov	ax,cx				//
   ;	
		mov		ax,cx				
   ;	
   ;	asm	mul	bx					// units*fraction
   ;	
		mul		bx					
   ;	
   ;	asm add	ax,di
   ;	
 	add		ax,di
   ;	
   ;	asm	adc	dx,0
   ;	
		adc		dx,0
   ;	
   ;	
   ;	//
   ;	// put result dx:ax in 2's complement
   ;	//
   ;	asm	test	si,0x8000		// is the result negative?
   ;	
		test		si,08000H		
   ;	
   ;	asm	jz	ansok:
   ;	
	je	short @1@530
   ;	
   ;	asm	neg	dx
   ;	
		neg		dx
   ;	
   ;	asm	neg	ax
   ;	
		neg		ax
   ;	
   ;	asm	sbb	dx,0
   ;	
		sbb		dx,0
@1@530:
   ;	
   ;	
   ;	ansok:;
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_FixedByFrac	endp
   ;	
   ;	void TransformActor (objtype *ob)
   ;	
	assume	cs:_TEXT
_TransformActor	proc	near
	push	bp
	mov	bp,sp
	sub	sp,28
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		int ratio;
   ;		fixed gx,gy,gxt,gyt,nx,ny;
   ;		long	temp;
   ;	
   ;	//
   ;	// translate point to view centered coordinates
   ;	//
   ;		gx = ob->x-viewx;
   ;	
	mov	ax,word ptr [si+17]
	mov	dx,word ptr [si+15]
	sub	dx,word ptr DGROUP:_viewx
	sbb	ax,word ptr DGROUP:_viewx+2
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;		gy = ob->y-viewy;
   ;	
	mov	ax,word ptr [si+21]
	mov	dx,word ptr [si+19]
	sub	dx,word ptr DGROUP:_viewy
	sbb	ax,word ptr DGROUP:_viewy+2
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;	
   ;	//
   ;	// calculate newx
   ;	//
   ;		gxt = FixedByFrac(gx,viewcos);
   ;	
	push	word ptr DGROUP:_viewcos+2
	push	word ptr DGROUP:_viewcos
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr _FixedByFrac
	add	sp,8
	mov	word ptr [bp-12],ax
	mov	word ptr [bp-10],dx
   ;	
   ;		gyt = FixedByFrac(gy,viewsin);
   ;	
	push	word ptr DGROUP:_viewsin+2
	push	word ptr DGROUP:_viewsin
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	call	near ptr _FixedByFrac
	add	sp,8
	mov	word ptr [bp-16],ax
	mov	word ptr [bp-14],dx
   ;	
   ;		nx = gxt-gyt-ACTORSIZE;		// fudge the shape forward a bit, because
   ;	
	mov	ax,word ptr [bp-10]
	mov	dx,word ptr [bp-12]
	sub	dx,word ptr [bp-16]
	sbb	ax,word ptr [bp-14]
	add	dx,49152
	adc	ax,65535
	mov	word ptr [bp-20],dx
	mov	word ptr [bp-18],ax
   ;	
   ;									// the midpoint could put parts of the shape
   ;									// into an adjacent wall
   ;	
   ;	//
   ;	// calculate newy
   ;	//
   ;		gxt = FixedByFrac(gx,viewsin);
   ;	
	push	word ptr DGROUP:_viewsin+2
	push	word ptr DGROUP:_viewsin
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr _FixedByFrac
	add	sp,8
	mov	word ptr [bp-12],ax
	mov	word ptr [bp-10],dx
   ;	
   ;		gyt = FixedByFrac(gy,viewcos);
   ;	
	push	word ptr DGROUP:_viewcos+2
	push	word ptr DGROUP:_viewcos
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	call	near ptr _FixedByFrac
	add	sp,8
	mov	word ptr [bp-16],ax
	mov	word ptr [bp-14],dx
   ;	
   ;		ny = gyt+gxt;
   ;	
	mov	ax,word ptr [bp-14]
	mov	dx,word ptr [bp-16]
	add	dx,word ptr [bp-12]
	adc	ax,word ptr [bp-10]
	mov	word ptr [bp-24],dx
	mov	word ptr [bp-22],ax
   ;	
   ;	
   ;	//
   ;	// calculate perspective ratio
   ;	//
   ;		ob->transx = nx;
   ;	
	mov	ax,word ptr [bp-18]
	mov	dx,word ptr [bp-20]
	mov	word ptr [si+32],dx
	mov	word ptr [si+34],ax
   ;	
   ;		ob->transy = ny;
   ;	
	mov	ax,word ptr [bp-22]
	mov	dx,word ptr [bp-24]
	mov	word ptr [si+36],dx
	mov	word ptr [si+38],ax
   ;	
   ;	
   ;		if (nx<mindist)			// too close, don't overflow the divide
   ;	
	mov	ax,word ptr [bp-18]
	mov	dx,word ptr [bp-20]
	cmp	ax,word ptr DGROUP:_mindist+2
	jg	short @2@122
	jl	short @2@98
	cmp	dx,word ptr DGROUP:_mindist
	jae	short @2@122
@2@98:
   ;	
   ;		{
   ;		  ob->viewheight = 0;
   ;	
	mov	word ptr [si+30],0
   ;	
   ;		  return;
   ;	
	jmp	short @2@290
@2@122:
   ;	
   ;		}
   ;	
   ;		ob->viewx = centerx + ny*scale/nx;	// DEBUG: use assembly divide
   ;	
	push	word ptr [bp-18]
	push	word ptr [bp-20]
	mov	cx,word ptr [bp-22]
	mov	bx,word ptr [bp-24]
	mov	dx,word ptr DGROUP:_scale+2
	mov	ax,word ptr DGROUP:_scale
	call	near ptr N_LXMUL@
	push	dx
	push	ax
	call	near ptr N_LDIV@
	mov	dx,word ptr DGROUP:_centerx
	add	dx,ax
	mov	word ptr [si+28],dx
   ;	
   ;	
   ;	//
   ;	// calculate height (heightnumerator/(nx>>8))
   ;	//
   ;		asm	mov	ax,[WORD PTR heightnumerator]
   ;	
		mov		ax,[WORD PTR _heightnumerator]
   ;	
   ;		asm	mov	dx,[WORD PTR heightnumerator+2]
   ;	
		mov		dx,[WORD PTR _heightnumerator+2]
   ;	
   ;		asm	idiv	[WORD PTR nx+1]			// nx>>8
   ;	
		idiv		[WORD PTR [bp-20]+1]			
   ;	
   ;		asm	mov	[WORD PTR temp],ax
   ;	
		mov		[WORD PTR [bp-28]],ax
   ;	
   ;		asm	mov	[WORD PTR temp+2],dx
   ;	
		mov		[WORD PTR [bp-28]+2],dx
   ;	
   ;	
   ;		ob->viewheight = temp;
   ;	
	mov	ax,word ptr [bp-28]
	mov	word ptr [si+30],ax
@2@290:
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_TransformActor	endp
   ;	
   ;	boolean TransformTile (int tx, int ty, int *dispx, int *dispheight)
   ;	
	assume	cs:_TEXT
_TransformTile	proc	near
	push	bp
	mov	bp,sp
	sub	sp,28
	push	si
	mov	si,word ptr [bp+10]
   ;	
   ;	{
   ;		int ratio;
   ;		fixed gx,gy,gxt,gyt,nx,ny;
   ;		long	temp;
   ;	
   ;	//
   ;	// translate point to view centered coordinates
   ;	//
   ;		gx = ((long)tx<<TILESHIFT)+0x8000-viewx;
   ;	
	mov	ax,word ptr [bp+4]
	cwd	
	xor	dx,dx
	add	dx,32768
	adc	ax,0
	sub	dx,word ptr DGROUP:_viewx
	sbb	ax,word ptr DGROUP:_viewx+2
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;		gy = ((long)ty<<TILESHIFT)+0x8000-viewy;
   ;	
	mov	ax,word ptr [bp+6]
	cwd	
	xor	dx,dx
	add	dx,32768
	adc	ax,0
	sub	dx,word ptr DGROUP:_viewy
	sbb	ax,word ptr DGROUP:_viewy+2
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;	
   ;	//
   ;	// calculate newx
   ;	//
   ;		gxt = FixedByFrac(gx,viewcos);
   ;	
	push	word ptr DGROUP:_viewcos+2
	push	word ptr DGROUP:_viewcos
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr _FixedByFrac
	add	sp,8
	mov	word ptr [bp-12],ax
	mov	word ptr [bp-10],dx
   ;	
   ;		gyt = FixedByFrac(gy,viewsin);
   ;	
	push	word ptr DGROUP:_viewsin+2
	push	word ptr DGROUP:_viewsin
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	call	near ptr _FixedByFrac
	add	sp,8
	mov	word ptr [bp-16],ax
	mov	word ptr [bp-14],dx
   ;	
   ;		nx = gxt-gyt-0x2000;		// 0x2000 is size of object
   ;	
	mov	ax,word ptr [bp-10]
	mov	dx,word ptr [bp-12]
	sub	dx,word ptr [bp-16]
	sbb	ax,word ptr [bp-14]
	add	dx,57344
	adc	ax,65535
	mov	word ptr [bp-20],dx
	mov	word ptr [bp-18],ax
   ;	
   ;	
   ;	//
   ;	// calculate newy
   ;	//
   ;		gxt = FixedByFrac(gx,viewsin);
   ;	
	push	word ptr DGROUP:_viewsin+2
	push	word ptr DGROUP:_viewsin
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr _FixedByFrac
	add	sp,8
	mov	word ptr [bp-12],ax
	mov	word ptr [bp-10],dx
   ;	
   ;		gyt = FixedByFrac(gy,viewcos);
   ;	
	push	word ptr DGROUP:_viewcos+2
	push	word ptr DGROUP:_viewcos
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	call	near ptr _FixedByFrac
	add	sp,8
	mov	word ptr [bp-16],ax
	mov	word ptr [bp-14],dx
   ;	
   ;		ny = gyt+gxt;
   ;	
	mov	ax,word ptr [bp-14]
	mov	dx,word ptr [bp-16]
	add	dx,word ptr [bp-12]
	adc	ax,word ptr [bp-10]
	mov	word ptr [bp-24],dx
	mov	word ptr [bp-22],ax
   ;	
   ;	
   ;	
   ;	//
   ;	// calculate perspective ratio
   ;	//
   ;		if (nx<mindist)			// too close, don't overflow the divide
   ;	
	mov	ax,word ptr [bp-18]
	mov	dx,word ptr [bp-20]
	cmp	ax,word ptr DGROUP:_mindist+2
	jg	short @3@122
	jl	short @3@98
	cmp	dx,word ptr DGROUP:_mindist
	jae	short @3@122
@3@98:
   ;	
   ;		{
   ;			*dispheight = 0;
   ;	
	mov	word ptr [si],0
   ;	
   ;			return false;
   ;	
	xor	ax,ax
	jmp	@3@554
@3@122:
   ;	
   ;		}
   ;	
   ;		*dispx = centerx + ny*scale/nx;	// DEBUG: use assembly divide
   ;	
	push	word ptr [bp-18]
	push	word ptr [bp-20]
	mov	cx,word ptr [bp-22]
	mov	bx,word ptr [bp-24]
	mov	dx,word ptr DGROUP:_scale+2
	mov	ax,word ptr DGROUP:_scale
	call	near ptr N_LXMUL@
	push	dx
	push	ax
	call	near ptr N_LDIV@
	mov	dx,word ptr DGROUP:_centerx
	add	dx,ax
	mov	bx,word ptr [bp+8]
	mov	word ptr [bx],dx
   ;	
   ;	
   ;	//
   ;	// calculate height (heightnumerator/(nx>>8))
   ;	//
   ;		asm	mov	ax,[WORD PTR heightnumerator]
   ;	
		mov		ax,[WORD PTR _heightnumerator]
   ;	
   ;		asm	mov	dx,[WORD PTR heightnumerator+2]
   ;	
		mov		dx,[WORD PTR _heightnumerator+2]
   ;	
   ;		asm	idiv	[WORD PTR nx+1]			// nx>>8
   ;	
		idiv		[WORD PTR [bp-20]+1]			
   ;	
   ;		asm	mov	[WORD PTR temp],ax
   ;	
		mov		[WORD PTR [bp-28]],ax
   ;	
   ;		asm	mov	[WORD PTR temp+2],dx
   ;	
		mov		[WORD PTR [bp-28]+2],dx
   ;	
   ;	
   ;		*dispheight = temp;
   ;	
	mov	ax,word ptr [bp-28]
	mov	word ptr [si],ax
   ;	
   ;	
   ;	//
   ;	// see if it should be grabbed
   ;	//
   ;		if (nx<TILEGLOBAL && ny>-TILEGLOBAL/2 && ny<TILEGLOBAL/2)
   ;	
	cmp	word ptr [bp-18],1
	jg	short @3@530
	jl	short @3@338
	cmp	word ptr [bp-20],0
	jae	short @3@530
@3@338:
	cmp	word ptr [bp-22],65535
	jl	short @3@530
	jg	short @3@410
	cmp	word ptr [bp-24],32768
	jbe	short @3@530
@3@410:
	cmp	word ptr [bp-22],0
	jg	short @3@530
	jl	short @3@482
	cmp	word ptr [bp-24],32768
	jae	short @3@530
@3@482:
   ;	
   ;			return true;
   ;	
	mov	ax,1
	jmp	short @3@554
	jmp	short @3@554
@3@530:
   ;	
   ;		else
   ;			return false;
   ;	
	xor	ax,ax
	jmp	short @3@554
@3@554:
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_TransformTile	endp
   ;	
   ;	int	CalcHeight (void)
   ;	
	assume	cs:_TEXT
_CalcHeight	proc	near
	push	bp
	mov	bp,sp
	sub	sp,20
   ;	
   ;	{
   ;		int	transheight;
   ;		int ratio;
   ;		fixed gxt,gyt,nx,ny;
   ;		long	gx,gy;
   ;	
   ;		gx = xintercept-viewx;
   ;	
	mov	ax,word ptr DGROUP:_xintercept+2
	mov	dx,word ptr DGROUP:_xintercept
	sub	dx,word ptr DGROUP:_viewx
	sbb	ax,word ptr DGROUP:_viewx+2
	mov	word ptr [bp-16],dx
	mov	word ptr [bp-14],ax
   ;	
   ;		gxt = FixedByFrac(gx,viewcos);
   ;	
	push	word ptr DGROUP:_viewcos+2
	push	word ptr DGROUP:_viewcos
	push	word ptr [bp-14]
	push	word ptr [bp-16]
	call	near ptr _FixedByFrac
	add	sp,8
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;	
   ;		gy = yintercept-viewy;
   ;	
	mov	ax,word ptr DGROUP:_yintercept+2
	mov	dx,word ptr DGROUP:_yintercept
	sub	dx,word ptr DGROUP:_viewy
	sbb	ax,word ptr DGROUP:_viewy+2
	mov	word ptr [bp-20],dx
	mov	word ptr [bp-18],ax
   ;	
   ;		gyt = FixedByFrac(gy,viewsin);
   ;	
	push	word ptr DGROUP:_viewsin+2
	push	word ptr DGROUP:_viewsin
	push	word ptr [bp-18]
	push	word ptr [bp-20]
	call	near ptr _FixedByFrac
	add	sp,8
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],dx
   ;	
   ;	
   ;		nx = gxt-gyt;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	sub	dx,word ptr [bp-8]
	sbb	ax,word ptr [bp-6]
	mov	word ptr [bp-12],dx
	mov	word ptr [bp-10],ax
   ;	
   ;	
   ;	  //
   ;	  // calculate perspective ratio (heightnumerator/(nx>>8))
   ;	  //
   ;		if (nx<mindist)
   ;	
	mov	ax,word ptr [bp-10]
	mov	dx,word ptr [bp-12]
	cmp	ax,word ptr DGROUP:_mindist+2
	jg	short @4@122
	jl	short @4@98
	cmp	dx,word ptr DGROUP:_mindist
	jae	short @4@122
@4@98:
   ;	
   ;			nx=mindist;			// don't let divide overflow
   ;	
	mov	ax,word ptr DGROUP:_mindist+2
	mov	dx,word ptr DGROUP:_mindist
	mov	word ptr [bp-12],dx
	mov	word ptr [bp-10],ax
@4@122:
   ;	
   ;	
   ;		asm	mov	ax,[WORD PTR heightnumerator]
   ;	
		mov		ax,[WORD PTR _heightnumerator]
   ;	
   ;		asm	mov	dx,[WORD PTR heightnumerator+2]
   ;	
		mov		dx,[WORD PTR _heightnumerator+2]
   ;	
   ;		asm	idiv	[WORD PTR nx+1]			// nx>>8
   ;	
		idiv		[WORD PTR [bp-12]+1]			
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_CalcHeight	endp
   ;	
   ;	void	near ScalePost (void)		// VGA version
   ;	
	assume	cs:_TEXT
_ScalePost	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		asm	mov	ax,SCREENSEG
   ;	
		mov		ax,0a000H
   ;	
   ;		asm	mov	es,ax
   ;	
		mov		es,ax
   ;	
   ;	
   ;		asm	mov	bx,[postx]
   ;	
		mov		bx,[DGROUP:_postx]
   ;	
   ;		asm	shl	bx,1
   ;	
		shl		bx,1
   ;	
   ;		asm	mov	bp,WORD PTR [wallheight+bx]		// fractional height (low 3 bits frac)
   ;	
		mov		bp,WORD PTR [DGROUP:_wallheight+bx]		
   ;	
   ;		asm	and	bp,0xfff8				// bp = heightscaler*4
   ;	
		and		bp,0fff8H				
   ;	
   ;		asm	shr	bp,1
   ;	
		shr		bp,1
   ;	
   ;		asm	cmp	bp,[maxscaleshl2]
   ;	
		cmp		bp,[_maxscaleshl2]
   ;	
   ;		asm	jle	heightok
   ;	
	jle	short @5@266
   ;	
   ;		asm	mov	bp,[maxscaleshl2]
   ;	
		mov		bp,[_maxscaleshl2]
@5@266:
   ;	
   ;	heightok:
   ;		asm	add	bp,OFFSET fullscalefarcall
   ;	
		add		bp,OFFSET _fullscalefarcall
   ;	
   ;		//
   ;		// scale a byte wide strip of wall
   ;		//
   ;		asm	mov	bx,[postx]
   ;	
		mov		bx,[DGROUP:_postx]
   ;	
   ;		asm	mov	di,bx
   ;	
		mov		di,bx
   ;	
   ;		asm	shr	di,2						// X in bytes
   ;	
		shr		di,2						
   ;	
   ;		asm	add	di,[bufferofs]
   ;	
		add		di,[_bufferofs]
   ;	
   ;	
   ;		asm	and	bx,3
   ;	
		and		bx,3
   ;	
   ;		asm	shl	bx,3						// bx = pixel*8+pixwidth
   ;	
		shl		bx,3						
   ;	
   ;		asm	add	bx,[postwidth]
   ;	
		add		bx,[DGROUP:_postwidth]
   ;	
   ;	
   ;		asm	mov	al,BYTE PTR [mapmasks1-1+bx]	// -1 because no widths of 0
   ;	
		mov		al,BYTE PTR [_mapmasks1-1+bx]	
   ;	
   ;		asm	mov	dx,SC_INDEX+1
   ;	
		mov		dx,03C4H+1
   ;	
   ;		asm	out	dx,al						// set bit mask register
   ;	
		out		dx,al						
   ;	
   ;		asm	lds	si,DWORD PTR [postsource]
   ;	
		lds		si,DWORD PTR [DGROUP:_postsource]
   ;	
   ;		asm	call DWORD PTR [bp]				// scale the line of pixels
   ;	
		call	 DWORD PTR [bp]				
   ;	
   ;	
   ;		asm	mov	al,BYTE PTR [ss:mapmasks2-1+bx]   // -1 because no widths of 0
   ;	
		mov		al,BYTE PTR [ss:_mapmasks2-1+bx]   
   ;	
   ;		asm	or	al,al
   ;	
		or		al,al
   ;	
   ;		asm	jz	nomore
   ;	
	je	short @5@866
   ;	
   ;	
   ;		//
   ;		// draw a second byte for vertical strips that cross two bytes
   ;		//
   ;		asm	inc	di
   ;	
		inc		di
   ;	
   ;		asm	out	dx,al						// set bit mask register
   ;	
		out		dx,al						
   ;	
   ;		asm	call DWORD PTR [bp]				// scale the line of pixels
   ;	
		call	 DWORD PTR [bp]				
   ;	
   ;	
   ;		asm	mov	al,BYTE PTR [ss:mapmasks3-1+bx]	// -1 because no widths of 0
   ;	
		mov		al,BYTE PTR [ss:_mapmasks3-1+bx]	
   ;	
   ;		asm	or	al,al
   ;	
		or		al,al
   ;	
   ;		asm	jz	nomore
   ;	
	je	short @5@866
   ;	
   ;		//
   ;		// draw a third byte for vertical strips that cross three bytes
   ;		//
   ;		asm	inc	di
   ;	
		inc		di
   ;	
   ;		asm	out	dx,al						// set bit mask register
   ;	
		out		dx,al						
   ;	
   ;		asm	call DWORD PTR [bp]				// scale the line of pixels
   ;	
		call	 DWORD PTR [bp]				
@5@866:
   ;	
   ;	
   ;	
   ;	nomore:
   ;		asm	mov	ax,ss
   ;	
		mov		ax,ss
   ;	
   ;		asm	mov	ds,ax
   ;	
		mov		ds,ax
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_ScalePost	endp
   ;	
   ;	void  FarScalePost (void)				// just so other files can call
   ;	
	assume	cs:_TEXT
_FarScalePost	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		ScalePost ();
   ;	
	call	near ptr _ScalePost
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_FarScalePost	endp
   ;	
   ;	void HitVertWall (void)
   ;	
	assume	cs:_TEXT
_HitVertWall	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		int			wallpic;
   ;		unsigned	texture;
   ;	
   ;		texture = (yintercept>>4)&0xfc0;
   ;	
	mov	dx,word ptr DGROUP:_yintercept+2
	mov	ax,word ptr DGROUP:_yintercept
	mov	cl,4
	call	near ptr N_LXRSH@
	and	ax,4032
	mov	si,ax
   ;	
   ;		if (xtilestep == -1)
   ;	
	cmp	word ptr DGROUP:_xtilestep,65535
	jne	short @7@74
   ;	
   ;		{
   ;			texture = 0xfc0-texture;
   ;	
	mov	ax,4032
	sub	ax,si
	mov	si,ax
   ;	
   ;			xintercept += TILEGLOBAL;
   ;	
	add	word ptr DGROUP:_xintercept,0
	adc	word ptr DGROUP:_xintercept+2,1
@7@74:
   ;	
   ;		}
   ;		wallheight[pixx] = CalcHeight();
   ;	
	call	near ptr _CalcHeight
	mov	bx,word ptr DGROUP:_pixx
	shl	bx,1
	mov	word ptr DGROUP:_wallheight[bx],ax
   ;	
   ;	
   ;		if (lastside==1 && lastintercept == xtile && lasttilehit == tilehit)
   ;	
	cmp	word ptr DGROUP:_lastside,1
	jne	short @7@290
	mov	ax,word ptr DGROUP:_xtile
	cwd	
	cmp	dx,word ptr DGROUP:_lastintercept+2
	jne	short @7@290
	cmp	ax,word ptr DGROUP:_lastintercept
	jne	short @7@290
	mov	ax,word ptr DGROUP:_lasttilehit
	cmp	ax,word ptr DGROUP:_tilehit
	jne	short @7@290
   ;	
   ;		{
   ;			// in the same wall type as last time, so check for optimized draw
   ;			if (texture == (unsigned)postsource)
   ;	
	cmp	si,word ptr DGROUP:_postsource
	jne	short @7@242
   ;	
   ;			{
   ;			// wide scale
   ;				postwidth++;
   ;	
	inc	word ptr DGROUP:_postwidth
   ;	
   ;				wallheight[pixx] = wallheight[pixx-1];
   ;	
	mov	bx,word ptr DGROUP:_pixx
	dec	bx
	shl	bx,1
	mov	ax,word ptr DGROUP:_wallheight[bx]
	mov	bx,word ptr DGROUP:_pixx
	shl	bx,1
	mov	word ptr DGROUP:_wallheight[bx],ax
   ;	
   ;				return;
   ;	
	jmp	@7@506
   ;	
   ;			}
   ;	
	jmp	short @7@266
@7@242:
   ;	
   ;			else
   ;			{
   ;				ScalePost ();
   ;	
	call	near ptr _ScalePost
   ;	
   ;				(unsigned)postsource = texture;
   ;	
	mov	word ptr DGROUP:_postsource,si
   ;	
   ;				postwidth = 1;
   ;	
	mov	word ptr DGROUP:_postwidth,1
   ;	
   ;				postx = pixx;
   ;	
	mov	ax,word ptr DGROUP:_pixx
	mov	word ptr DGROUP:_postx,ax
@7@266:
   ;	
   ;			}
   ;		}
   ;	
	jmp	@7@506
@7@290:
   ;	
   ;		else
   ;		{
   ;		// new wall
   ;			if (lastside != -1)				// if not the first scaled post
   ;	
	cmp	word ptr DGROUP:_lastside,65535
	je	short @7@338
   ;	
   ;				ScalePost ();
   ;	
	call	near ptr _ScalePost
@7@338:
   ;	
   ;	
   ;			lastside = true;
   ;	
	mov	word ptr DGROUP:_lastside,1
   ;	
   ;			lastintercept = xtile;
   ;	
	mov	ax,word ptr DGROUP:_xtile
	cwd	
	mov	word ptr DGROUP:_lastintercept,ax
	mov	word ptr DGROUP:_lastintercept+2,dx
   ;	
   ;	
   ;			lasttilehit = tilehit;
   ;	
	mov	ax,word ptr DGROUP:_tilehit
	mov	word ptr DGROUP:_lasttilehit,ax
   ;	
   ;			postx = pixx;
   ;	
	mov	ax,word ptr DGROUP:_pixx
	mov	word ptr DGROUP:_postx,ax
   ;	
   ;			postwidth = 1;
   ;	
	mov	word ptr DGROUP:_postwidth,1
   ;	
   ;	
   ;			if (tilehit & 0x40)
   ;	
	test	word ptr DGROUP:_tilehit,64
	je	short @7@458
   ;	
   ;			{								// check for adjacent doors
   ;				ytile = yintercept>>TILESHIFT;
   ;	
	mov	ax,word ptr DGROUP:_yintercept+2
	cwd	
	mov	word ptr DGROUP:_ytile,ax
   ;	
   ;				if ( tilemap[xtile-xtilestep][ytile]&0x80 )
   ;	
	mov	bx,word ptr DGROUP:_xtile
	sub	bx,word ptr DGROUP:_xtilestep
	mov	cl,6
	shl	bx,cl
	add	bx,word ptr DGROUP:_ytile
	test	byte ptr DGROUP:_tilemap[bx],128
	je	short @7@410
   ;	
   ;					wallpic = DOORWALL+3;
   ;	
	mov	ax,word ptr DGROUP:_PMSpriteStart
	sub	ax,8
	add	ax,3
	mov	di,ax
	jmp	short @7@434
@7@410:
   ;	
   ;				else
   ;					wallpic = vertwall[tilehit & ~0x40];
   ;	
	mov	bx,word ptr DGROUP:_tilehit
	and	bx,65471
	shl	bx,1
	mov	di,word ptr DGROUP:_vertwall[bx]
@7@434:
   ;	
   ;			}
   ;	
	jmp	short @7@482
@7@458:
   ;	
   ;			else
   ;				wallpic = vertwall[tilehit];
   ;	
	mov	bx,word ptr DGROUP:_tilehit
	shl	bx,1
	mov	di,word ptr DGROUP:_vertwall[bx]
@7@482:
   ;	
   ;	
   ;			*( ((unsigned *)&postsource)+1) = (unsigned)PM_GetPage(wallpic);
   ;	
	push	di
	call	near ptr _PM_GetPage
	pop	cx
	mov	word ptr DGROUP:_postsource+2,ax
   ;	
   ;			(unsigned)postsource = texture;
   ;	
	mov	word ptr DGROUP:_postsource,si
@7@506:
   ;	
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_HitVertWall	endp
   ;	
   ;	void HitHorizWall (void)
   ;	
	assume	cs:_TEXT
_HitHorizWall	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		int			wallpic;
   ;		unsigned	texture;
   ;	
   ;		texture = (xintercept>>4)&0xfc0;
   ;	
	mov	dx,word ptr DGROUP:_xintercept+2
	mov	ax,word ptr DGROUP:_xintercept
	mov	cl,4
	call	near ptr N_LXRSH@
	and	ax,4032
	mov	si,ax
   ;	
   ;		if (ytilestep == -1)
   ;	
	cmp	word ptr DGROUP:_ytilestep,65535
	jne	short @8@74
   ;	
   ;			yintercept += TILEGLOBAL;
   ;	
	add	word ptr DGROUP:_yintercept,0
	adc	word ptr DGROUP:_yintercept+2,1
	jmp	short @8@98
@8@74:
   ;	
   ;		else
   ;			texture = 0xfc0-texture;
   ;	
	mov	ax,4032
	sub	ax,si
	mov	si,ax
@8@98:
   ;	
   ;		wallheight[pixx] = CalcHeight();
   ;	
	call	near ptr _CalcHeight
	mov	bx,word ptr DGROUP:_pixx
	shl	bx,1
	mov	word ptr DGROUP:_wallheight[bx],ax
   ;	
   ;	
   ;		if (lastside==0 && lastintercept == ytile && lasttilehit == tilehit)
   ;	
	cmp	word ptr DGROUP:_lastside,0
	jne	short @8@314
	mov	ax,word ptr DGROUP:_ytile
	cwd	
	cmp	dx,word ptr DGROUP:_lastintercept+2
	jne	short @8@314
	cmp	ax,word ptr DGROUP:_lastintercept
	jne	short @8@314
	mov	ax,word ptr DGROUP:_lasttilehit
	cmp	ax,word ptr DGROUP:_tilehit
	jne	short @8@314
   ;	
   ;		{
   ;			// in the same wall type as last time, so check for optimized draw
   ;			if (texture == (unsigned)postsource)
   ;	
	cmp	si,word ptr DGROUP:_postsource
	jne	short @8@266
   ;	
   ;			{
   ;			// wide scale
   ;				postwidth++;
   ;	
	inc	word ptr DGROUP:_postwidth
   ;	
   ;				wallheight[pixx] = wallheight[pixx-1];
   ;	
	mov	bx,word ptr DGROUP:_pixx
	dec	bx
	shl	bx,1
	mov	ax,word ptr DGROUP:_wallheight[bx]
	mov	bx,word ptr DGROUP:_pixx
	shl	bx,1
	mov	word ptr DGROUP:_wallheight[bx],ax
   ;	
   ;				return;
   ;	
	jmp	@8@530
   ;	
   ;			}
   ;	
	jmp	short @8@290
@8@266:
   ;	
   ;			else
   ;			{
   ;				ScalePost ();
   ;	
	call	near ptr _ScalePost
   ;	
   ;				(unsigned)postsource = texture;
   ;	
	mov	word ptr DGROUP:_postsource,si
   ;	
   ;				postwidth = 1;
   ;	
	mov	word ptr DGROUP:_postwidth,1
   ;	
   ;				postx = pixx;
   ;	
	mov	ax,word ptr DGROUP:_pixx
	mov	word ptr DGROUP:_postx,ax
@8@290:
   ;	
   ;			}
   ;		}
   ;	
	jmp	@8@530
@8@314:
   ;	
   ;		else
   ;		{
   ;		// new wall
   ;			if (lastside != -1)				// if not the first scaled post
   ;	
	cmp	word ptr DGROUP:_lastside,65535
	je	short @8@362
   ;	
   ;				ScalePost ();
   ;	
	call	near ptr _ScalePost
@8@362:
   ;	
   ;	
   ;			lastside = 0;
   ;	
	mov	word ptr DGROUP:_lastside,0
   ;	
   ;			lastintercept = ytile;
   ;	
	mov	ax,word ptr DGROUP:_ytile
	cwd	
	mov	word ptr DGROUP:_lastintercept,ax
	mov	word ptr DGROUP:_lastintercept+2,dx
   ;	
   ;	
   ;			lasttilehit = tilehit;
   ;	
	mov	ax,word ptr DGROUP:_tilehit
	mov	word ptr DGROUP:_lasttilehit,ax
   ;	
   ;			postx = pixx;
   ;	
	mov	ax,word ptr DGROUP:_pixx
	mov	word ptr DGROUP:_postx,ax
   ;	
   ;			postwidth = 1;
   ;	
	mov	word ptr DGROUP:_postwidth,1
   ;	
   ;	
   ;			if (tilehit & 0x40)
   ;	
	test	word ptr DGROUP:_tilehit,64
	je	short @8@482
   ;	
   ;			{								// check for adjacent doors
   ;				xtile = xintercept>>TILESHIFT;
   ;	
	mov	ax,word ptr DGROUP:_xintercept+2
	cwd	
	mov	word ptr DGROUP:_xtile,ax
   ;	
   ;				if ( tilemap[xtile][ytile-ytilestep]&0x80 )
   ;	
	mov	bx,word ptr DGROUP:_xtile
	mov	cl,6
	shl	bx,cl
	mov	ax,word ptr DGROUP:_ytile
	sub	ax,word ptr DGROUP:_ytilestep
	add	bx,ax
	test	byte ptr DGROUP:_tilemap[bx],128
	je	short @8@434
   ;	
   ;					wallpic = DOORWALL+2;
   ;	
	mov	ax,word ptr DGROUP:_PMSpriteStart
	sub	ax,8
	inc	ax
	inc	ax
	mov	di,ax
	jmp	short @8@458
@8@434:
   ;	
   ;				else
   ;					wallpic = horizwall[tilehit & ~0x40];
   ;	
	mov	bx,word ptr DGROUP:_tilehit
	and	bx,65471
	shl	bx,1
	mov	di,word ptr DGROUP:_horizwall[bx]
@8@458:
   ;	
   ;			}
   ;	
	jmp	short @8@506
@8@482:
   ;	
   ;			else
   ;				wallpic = horizwall[tilehit];
   ;	
	mov	bx,word ptr DGROUP:_tilehit
	shl	bx,1
	mov	di,word ptr DGROUP:_horizwall[bx]
@8@506:
   ;	
   ;	
   ;			*( ((unsigned *)&postsource)+1) = (unsigned)PM_GetPage(wallpic);
   ;	
	push	di
	call	near ptr _PM_GetPage
	pop	cx
	mov	word ptr DGROUP:_postsource+2,ax
   ;	
   ;			(unsigned)postsource = texture;
   ;	
	mov	word ptr DGROUP:_postsource,si
@8@530:
   ;	
   ;		}
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_HitHorizWall	endp
   ;	
   ;	void HitHorizDoor (void)
   ;	
	assume	cs:_TEXT
_HitHorizDoor	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
   ;	
   ;	{
   ;		unsigned	texture,doorpage,doornum;
   ;	
   ;		doornum = tilehit&0x7f;
   ;	
	mov	ax,word ptr DGROUP:_tilehit
	and	ax,127
	mov	word ptr [bp-2],ax
   ;	
   ;		texture = ( (xintercept-doorposition[doornum]) >> 4) &0xfc0;
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	mov	dx,word ptr DGROUP:_xintercept+2
	mov	ax,word ptr DGROUP:_xintercept
	sub	ax,word ptr DGROUP:_doorposition[bx]
	sbb	dx,0
	mov	cl,4
	call	near ptr N_LXRSH@
	and	ax,4032
	mov	di,ax
   ;	
   ;	
   ;		wallheight[pixx] = CalcHeight();
   ;	
	call	near ptr _CalcHeight
	mov	bx,word ptr DGROUP:_pixx
	shl	bx,1
	mov	word ptr DGROUP:_wallheight[bx],ax
   ;	
   ;	
   ;		if (lasttilehit == tilehit)
   ;	
	mov	ax,word ptr DGROUP:_lasttilehit
	cmp	ax,word ptr DGROUP:_tilehit
	jne	short @9@170
   ;	
   ;		{
   ;		// in the same door as last time, so check for optimized draw
   ;			if (texture == (unsigned)postsource)
   ;	
	cmp	di,word ptr DGROUP:_postsource
	jne	short @9@122
   ;	
   ;			{
   ;			// wide scale
   ;				postwidth++;
   ;	
	inc	word ptr DGROUP:_postwidth
   ;	
   ;				wallheight[pixx] = wallheight[pixx-1];
   ;	
	mov	bx,word ptr DGROUP:_pixx
	dec	bx
	shl	bx,1
	mov	ax,word ptr DGROUP:_wallheight[bx]
	mov	bx,word ptr DGROUP:_pixx
	shl	bx,1
	mov	word ptr DGROUP:_wallheight[bx],ax
   ;	
   ;				return;
   ;	
	jmp	@9@410
   ;	
   ;			}
   ;	
	jmp	short @9@146
@9@122:
   ;	
   ;			else
   ;			{
   ;				ScalePost ();
   ;	
	call	near ptr _ScalePost
   ;	
   ;				(unsigned)postsource = texture;
   ;	
	mov	word ptr DGROUP:_postsource,di
   ;	
   ;				postwidth = 1;
   ;	
	mov	word ptr DGROUP:_postwidth,1
   ;	
   ;				postx = pixx;
   ;	
	mov	ax,word ptr DGROUP:_pixx
	mov	word ptr DGROUP:_postx,ax
@9@146:
   ;	
   ;			}
   ;		}
   ;	
	jmp	short @9@410
@9@170:
   ;	
   ;		else
   ;		{
   ;			if (lastside != -1)				// if not the first scaled post
   ;	
	cmp	word ptr DGROUP:_lastside,65535
	je	short @9@218
   ;	
   ;				ScalePost ();			// draw last post
   ;	
	call	near ptr _ScalePost
@9@218:
   ;	
   ;		// first pixel in this door
   ;			lastside = 2;
   ;	
	mov	word ptr DGROUP:_lastside,2
   ;	
   ;			lasttilehit = tilehit;
   ;	
	mov	ax,word ptr DGROUP:_tilehit
	mov	word ptr DGROUP:_lasttilehit,ax
   ;	
   ;			postx = pixx;
   ;	
	mov	ax,word ptr DGROUP:_pixx
	mov	word ptr DGROUP:_postx,ax
   ;	
   ;			postwidth = 1;
   ;	
	mov	word ptr DGROUP:_postwidth,1
   ;	
   ;	
   ;			switch (doorobjlist[doornum].lock)
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx+4]
	mov	ah,0
	mov	bx,ax
	cmp	bx,5
	ja	short @9@386
	shl	bx,1
	jmp	word ptr cs:@9@C1520[bx]
@9@314:
   ;	
   ;			{
   ;			case dr_normal:
   ;				doorpage = DOORWALL;
   ;	
	mov	ax,word ptr DGROUP:_PMSpriteStart
	sub	ax,8
	mov	si,ax
   ;	
   ;				break;
   ;	
	jmp	short @9@386
@9@338:
   ;	
   ;			case dr_lock1:
   ;			case dr_lock2:
   ;			case dr_lock3:
   ;			case dr_lock4:
   ;				doorpage = DOORWALL+6;
   ;	
	mov	ax,word ptr DGROUP:_PMSpriteStart
	sub	ax,8
	add	ax,6
	mov	si,ax
   ;	
   ;				break;
   ;	
	jmp	short @9@386
@9@362:
   ;	
   ;			case dr_elevator:
   ;				doorpage = DOORWALL+4;
   ;	
	mov	ax,word ptr DGROUP:_PMSpriteStart
	sub	ax,8
	add	ax,4
	mov	si,ax
   ;	
   ;				break;
   ;	
	jmp	short @9@386
@9@386:
   ;	
   ;			}
   ;	
   ;			*( ((unsigned *)&postsource)+1) = (unsigned)PM_GetPage(doorpage);
   ;	
	push	si
	call	near ptr _PM_GetPage
	pop	cx
	mov	word ptr DGROUP:_postsource+2,ax
   ;	
   ;			(unsigned)postsource = texture;
   ;	
	mov	word ptr DGROUP:_postsource,di
@9@410:
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_HitHorizDoor	endp
@9@C1520	label	word
	dw	@9@314
	dw	@9@338
	dw	@9@338
	dw	@9@338
	dw	@9@338
	dw	@9@362
   ;	
   ;	void HitVertDoor (void)
   ;	
	assume	cs:_TEXT
_HitVertDoor	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
   ;	
   ;	{
   ;		unsigned	texture,doorpage,doornum;
   ;	
   ;		doornum = tilehit&0x7f;
   ;	
	mov	ax,word ptr DGROUP:_tilehit
	and	ax,127
	mov	word ptr [bp-2],ax
   ;	
   ;		texture = ( (yintercept-doorposition[doornum]) >> 4) &0xfc0;
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	mov	dx,word ptr DGROUP:_yintercept+2
	mov	ax,word ptr DGROUP:_yintercept
	sub	ax,word ptr DGROUP:_doorposition[bx]
	sbb	dx,0
	mov	cl,4
	call	near ptr N_LXRSH@
	and	ax,4032
	mov	di,ax
   ;	
   ;	
   ;		wallheight[pixx] = CalcHeight();
   ;	
	call	near ptr _CalcHeight
	mov	bx,word ptr DGROUP:_pixx
	shl	bx,1
	mov	word ptr DGROUP:_wallheight[bx],ax
   ;	
   ;	
   ;		if (lasttilehit == tilehit)
   ;	
	mov	ax,word ptr DGROUP:_lasttilehit
	cmp	ax,word ptr DGROUP:_tilehit
	jne	short @10@170
   ;	
   ;		{
   ;		// in the same door as last time, so check for optimized draw
   ;			if (texture == (unsigned)postsource)
   ;	
	cmp	di,word ptr DGROUP:_postsource
	jne	short @10@122
   ;	
   ;			{
   ;			// wide scale
   ;				postwidth++;
   ;	
	inc	word ptr DGROUP:_postwidth
   ;	
   ;				wallheight[pixx] = wallheight[pixx-1];
   ;	
	mov	bx,word ptr DGROUP:_pixx
	dec	bx
	shl	bx,1
	mov	ax,word ptr DGROUP:_wallheight[bx]
	mov	bx,word ptr DGROUP:_pixx
	shl	bx,1
	mov	word ptr DGROUP:_wallheight[bx],ax
   ;	
   ;				return;
   ;	
	jmp	@10@410
   ;	
   ;			}
   ;	
	jmp	short @10@146
@10@122:
   ;	
   ;			else
   ;			{
   ;				ScalePost ();
   ;	
	call	near ptr _ScalePost
   ;	
   ;				(unsigned)postsource = texture;
   ;	
	mov	word ptr DGROUP:_postsource,di
   ;	
   ;				postwidth = 1;
   ;	
	mov	word ptr DGROUP:_postwidth,1
   ;	
   ;				postx = pixx;
   ;	
	mov	ax,word ptr DGROUP:_pixx
	mov	word ptr DGROUP:_postx,ax
@10@146:
   ;	
   ;			}
   ;		}
   ;	
	jmp	@10@410
@10@170:
   ;	
   ;		else
   ;		{
   ;			if (lastside != -1)				// if not the first scaled post
   ;	
	cmp	word ptr DGROUP:_lastside,65535
	je	short @10@218
   ;	
   ;				ScalePost ();			// draw last post
   ;	
	call	near ptr _ScalePost
@10@218:
   ;	
   ;		// first pixel in this door
   ;			lastside = 2;
   ;	
	mov	word ptr DGROUP:_lastside,2
   ;	
   ;			lasttilehit = tilehit;
   ;	
	mov	ax,word ptr DGROUP:_tilehit
	mov	word ptr DGROUP:_lasttilehit,ax
   ;	
   ;			postx = pixx;
   ;	
	mov	ax,word ptr DGROUP:_pixx
	mov	word ptr DGROUP:_postx,ax
   ;	
   ;			postwidth = 1;
   ;	
	mov	word ptr DGROUP:_postwidth,1
   ;	
   ;	
   ;			switch (doorobjlist[doornum].lock)
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx+4]
	mov	ah,0
	mov	bx,ax
	cmp	bx,5
	ja	short @10@386
	shl	bx,1
	jmp	word ptr cs:@10@C1520[bx]
@10@314:
   ;	
   ;			{
   ;			case dr_normal:
   ;				doorpage = DOORWALL;
   ;	
	mov	ax,word ptr DGROUP:_PMSpriteStart
	sub	ax,8
	mov	si,ax
   ;	
   ;				break;
   ;	
	jmp	short @10@386
@10@338:
   ;	
   ;			case dr_lock1:
   ;			case dr_lock2:
   ;			case dr_lock3:
   ;			case dr_lock4:
   ;				doorpage = DOORWALL+6;
   ;	
	mov	ax,word ptr DGROUP:_PMSpriteStart
	sub	ax,8
	add	ax,6
	mov	si,ax
   ;	
   ;				break;
   ;	
	jmp	short @10@386
@10@362:
   ;	
   ;			case dr_elevator:
   ;				doorpage = DOORWALL+4;
   ;	
	mov	ax,word ptr DGROUP:_PMSpriteStart
	sub	ax,8
	add	ax,4
	mov	si,ax
   ;	
   ;				break;
   ;	
	jmp	short @10@386
@10@386:
   ;	
   ;			}
   ;	
   ;			*( ((unsigned *)&postsource)+1) = (unsigned)PM_GetPage(doorpage+1);
   ;	
	mov	ax,si
	inc	ax
	push	ax
	call	near ptr _PM_GetPage
	pop	cx
	mov	word ptr DGROUP:_postsource+2,ax
   ;	
   ;			(unsigned)postsource = texture;
   ;	
	mov	word ptr DGROUP:_postsource,di
@10@410:
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_HitVertDoor	endp
@10@C1520	label	word
	dw	@10@314
	dw	@10@338
	dw	@10@338
	dw	@10@338
	dw	@10@338
	dw	@10@362
   ;	
   ;	void HitHorizPWall (void)
   ;	
	assume	cs:_TEXT
_HitHorizPWall	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
   ;	
   ;	{
   ;		int			wallpic;
   ;		unsigned	texture,offset;
   ;	
   ;		texture = (xintercept>>4)&0xfc0;
   ;	
	mov	dx,word ptr DGROUP:_xintercept+2
	mov	ax,word ptr DGROUP:_xintercept
	mov	cl,4
	call	near ptr N_LXRSH@
	and	ax,4032
	mov	si,ax
   ;	
   ;		offset = pwallpos<<10;
   ;	
	mov	ax,word ptr DGROUP:_pwallpos
	mov	cl,10
	shl	ax,cl
	mov	di,ax
   ;	
   ;		if (ytilestep == -1)
   ;	
	cmp	word ptr DGROUP:_ytilestep,65535
	jne	short @11@74
   ;	
   ;			yintercept += TILEGLOBAL-offset;
   ;	
	mov	ax,1
	xor	dx,dx
	sub	dx,di
	sbb	ax,0
	add	word ptr DGROUP:_yintercept,dx
	adc	word ptr DGROUP:_yintercept+2,ax
	jmp	short @11@98
@11@74:
   ;	
   ;		else
   ;		{
   ;			texture = 0xfc0-texture;
   ;	
	mov	ax,4032
	sub	ax,si
	mov	si,ax
   ;	
   ;			yintercept += offset;
   ;	
	add	word ptr DGROUP:_yintercept,di
	adc	word ptr DGROUP:_yintercept+2,0
@11@98:
   ;	
   ;		}
   ;	
   ;		wallheight[pixx] = CalcHeight();
   ;	
	call	near ptr _CalcHeight
	mov	bx,word ptr DGROUP:_pixx
	shl	bx,1
	mov	word ptr DGROUP:_wallheight[bx],ax
   ;	
   ;	
   ;		if (lasttilehit == tilehit)
   ;	
	mov	ax,word ptr DGROUP:_lasttilehit
	cmp	ax,word ptr DGROUP:_tilehit
	jne	short @11@242
   ;	
   ;		{
   ;			// in the same wall type as last time, so check for optimized draw
   ;			if (texture == (unsigned)postsource)
   ;	
	cmp	si,word ptr DGROUP:_postsource
	jne	short @11@194
   ;	
   ;			{
   ;			// wide scale
   ;				postwidth++;
   ;	
	inc	word ptr DGROUP:_postwidth
   ;	
   ;				wallheight[pixx] = wallheight[pixx-1];
   ;	
	mov	bx,word ptr DGROUP:_pixx
	dec	bx
	shl	bx,1
	mov	ax,word ptr DGROUP:_wallheight[bx]
	mov	bx,word ptr DGROUP:_pixx
	shl	bx,1
	mov	word ptr DGROUP:_wallheight[bx],ax
   ;	
   ;				return;
   ;	
	jmp	short @11@314
   ;	
   ;			}
   ;	
	jmp	short @11@218
@11@194:
   ;	
   ;			else
   ;			{
   ;				ScalePost ();
   ;	
	call	near ptr _ScalePost
   ;	
   ;				(unsigned)postsource = texture;
   ;	
	mov	word ptr DGROUP:_postsource,si
   ;	
   ;				postwidth = 1;
   ;	
	mov	word ptr DGROUP:_postwidth,1
   ;	
   ;				postx = pixx;
   ;	
	mov	ax,word ptr DGROUP:_pixx
	mov	word ptr DGROUP:_postx,ax
@11@218:
   ;	
   ;			}
   ;		}
   ;	
	jmp	short @11@314
@11@242:
   ;	
   ;		else
   ;		{
   ;		// new wall
   ;			if (lastside != -1)				// if not the first scaled post
   ;	
	cmp	word ptr DGROUP:_lastside,65535
	je	short @11@290
   ;	
   ;				ScalePost ();
   ;	
	call	near ptr _ScalePost
@11@290:
   ;	
   ;	
   ;			lasttilehit = tilehit;
   ;	
	mov	ax,word ptr DGROUP:_tilehit
	mov	word ptr DGROUP:_lasttilehit,ax
   ;	
   ;			postx = pixx;
   ;	
	mov	ax,word ptr DGROUP:_pixx
	mov	word ptr DGROUP:_postx,ax
   ;	
   ;			postwidth = 1;
   ;	
	mov	word ptr DGROUP:_postwidth,1
   ;	
   ;	
   ;			wallpic = horizwall[tilehit&63];
   ;	
	mov	bx,word ptr DGROUP:_tilehit
	and	bx,63
	shl	bx,1
	mov	ax,word ptr DGROUP:_horizwall[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;			*( ((unsigned *)&postsource)+1) = (unsigned)PM_GetPage(wallpic);
   ;	
	push	word ptr [bp-2]
	call	near ptr _PM_GetPage
	pop	cx
	mov	word ptr DGROUP:_postsource+2,ax
   ;	
   ;			(unsigned)postsource = texture;
   ;	
	mov	word ptr DGROUP:_postsource,si
@11@314:
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
_HitHorizPWall	endp
   ;	
   ;	void HitVertPWall (void)
   ;	
	assume	cs:_TEXT
_HitVertPWall	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
   ;	
   ;	{
   ;		int			wallpic;
   ;		unsigned	texture,offset;
   ;	
   ;		texture = (yintercept>>4)&0xfc0;
   ;	
	mov	dx,word ptr DGROUP:_yintercept+2
	mov	ax,word ptr DGROUP:_yintercept
	mov	cl,4
	call	near ptr N_LXRSH@
	and	ax,4032
	mov	si,ax
   ;	
   ;		offset = pwallpos<<10;
   ;	
	mov	ax,word ptr DGROUP:_pwallpos
	mov	cl,10
	shl	ax,cl
	mov	di,ax
   ;	
   ;		if (xtilestep == -1)
   ;	
	cmp	word ptr DGROUP:_xtilestep,65535
	jne	short @12@74
   ;	
   ;		{
   ;			xintercept += TILEGLOBAL-offset;
   ;	
	mov	ax,1
	xor	dx,dx
	sub	dx,di
	sbb	ax,0
	add	word ptr DGROUP:_xintercept,dx
	adc	word ptr DGROUP:_xintercept+2,ax
   ;	
   ;			texture = 0xfc0-texture;
   ;	
	mov	ax,4032
	sub	ax,si
	mov	si,ax
   ;	
   ;		}
   ;	
	jmp	short @12@98
@12@74:
   ;	
   ;		else
   ;			xintercept += offset;
   ;	
	add	word ptr DGROUP:_xintercept,di
	adc	word ptr DGROUP:_xintercept+2,0
@12@98:
   ;	
   ;	
   ;		wallheight[pixx] = CalcHeight();
   ;	
	call	near ptr _CalcHeight
	mov	bx,word ptr DGROUP:_pixx
	shl	bx,1
	mov	word ptr DGROUP:_wallheight[bx],ax
   ;	
   ;	
   ;		if (lasttilehit == tilehit)
   ;	
	mov	ax,word ptr DGROUP:_lasttilehit
	cmp	ax,word ptr DGROUP:_tilehit
	jne	short @12@242
   ;	
   ;		{
   ;			// in the same wall type as last time, so check for optimized draw
   ;			if (texture == (unsigned)postsource)
   ;	
	cmp	si,word ptr DGROUP:_postsource
	jne	short @12@194
   ;	
   ;			{
   ;			// wide scale
   ;				postwidth++;
   ;	
	inc	word ptr DGROUP:_postwidth
   ;	
   ;				wallheight[pixx] = wallheight[pixx-1];
   ;	
	mov	bx,word ptr DGROUP:_pixx
	dec	bx
	shl	bx,1
	mov	ax,word ptr DGROUP:_wallheight[bx]
	mov	bx,word ptr DGROUP:_pixx
	shl	bx,1
	mov	word ptr DGROUP:_wallheight[bx],ax
   ;	
   ;				return;
   ;	
	jmp	short @12@314
   ;	
   ;			}
   ;	
	jmp	short @12@218
@12@194:
   ;	
   ;			else
   ;			{
   ;				ScalePost ();
   ;	
	call	near ptr _ScalePost
   ;	
   ;				(unsigned)postsource = texture;
   ;	
	mov	word ptr DGROUP:_postsource,si
   ;	
   ;				postwidth = 1;
   ;	
	mov	word ptr DGROUP:_postwidth,1
   ;	
   ;				postx = pixx;
   ;	
	mov	ax,word ptr DGROUP:_pixx
	mov	word ptr DGROUP:_postx,ax
@12@218:
   ;	
   ;			}
   ;		}
   ;	
	jmp	short @12@314
@12@242:
   ;	
   ;		else
   ;		{
   ;		// new wall
   ;			if (lastside != -1)				// if not the first scaled post
   ;	
	cmp	word ptr DGROUP:_lastside,65535
	je	short @12@290
   ;	
   ;				ScalePost ();
   ;	
	call	near ptr _ScalePost
@12@290:
   ;	
   ;	
   ;			lasttilehit = tilehit;
   ;	
	mov	ax,word ptr DGROUP:_tilehit
	mov	word ptr DGROUP:_lasttilehit,ax
   ;	
   ;			postx = pixx;
   ;	
	mov	ax,word ptr DGROUP:_pixx
	mov	word ptr DGROUP:_postx,ax
   ;	
   ;			postwidth = 1;
   ;	
	mov	word ptr DGROUP:_postwidth,1
   ;	
   ;	
   ;			wallpic = vertwall[tilehit&63];
   ;	
	mov	bx,word ptr DGROUP:_tilehit
	and	bx,63
	shl	bx,1
	mov	ax,word ptr DGROUP:_vertwall[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;			*( ((unsigned *)&postsource)+1) = (unsigned)PM_GetPage(wallpic);
   ;	
	push	word ptr [bp-2]
	call	near ptr _PM_GetPage
	pop	cx
	mov	word ptr DGROUP:_postsource+2,ax
   ;	
   ;			(unsigned)postsource = texture;
   ;	
	mov	word ptr DGROUP:_postsource,si
@12@314:
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
_HitVertPWall	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_vgaCeiling	label	word
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	191
	db	191
	db	78
	db	78
	db	78
	db	78
	db	78
	db	78
	db	29
	db	29
	db	141
	db	141
	db	78
	db	78
	db	29
	db	29
	db	45
	db	45
	db	29
	db	29
	db	141
	db	141
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	45
	db	45
	db	221
	db	221
	db	29
	db	29
	db	29
	db	29
	db	152
	db	152
	db	29
	db	29
	db	157
	db	157
	db	45
	db	45
	db	221
	db	221
	db	221
	db	221
	db	157
	db	157
	db	45
	db	45
	db	77
	db	77
	db	29
	db	29
	db	221
	db	221
	db	125
	db	125
	db	29
	db	29
	db	45
	db	45
	db	45
	db	45
	db	221
	db	221
	db	215
	db	215
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	45
	db	45
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	29
	db	221
	db	221
	db	221
	db	221
	db	125
	db	125
	db	221
	db	221
	db	221
	db	221
	db	221
	db	221
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void VGAClearScreen (void)
   ;	
	assume	cs:_TEXT
_VGAClearScreen	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	di
   ;	
   ;	{
   ;	 unsigned ceiling=vgaCeiling[gamestate.episode*10+mapon];
   ;	
	mov	ax,word ptr DGROUP:_gamestate+38
	mov	dx,10
	imul	dx
	add	ax,word ptr DGROUP:_mapon
	shl	ax,1
	mov	bx,ax
	mov	ax,word ptr DGROUP:_vgaCeiling[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;	  //
   ;	  // clear the screen
   ;	  //
   ;	asm	mov	dx,SC_INDEX
   ;	
		mov		dx,03C4H
   ;	
   ;	asm	mov	ax,SC_MAPMASK+15*256	// write through all planes
   ;	
		mov		ax,2+15*256	
   ;	
   ;	asm	out	dx,ax
   ;	
		out		dx,ax
   ;	
   ;	
   ;	asm	mov	dx,80
   ;	
		mov		dx,80
   ;	
   ;	asm	mov	ax,[viewwidth]
   ;	
		mov		ax,[_viewwidth]
   ;	
   ;	asm	shr	ax,2
   ;	
		shr		ax,2
   ;	
   ;	asm	sub	dx,ax					// dx = 40-viewwidth/2
   ;	
		sub		dx,ax					
   ;	
   ;	
   ;	asm	mov	bx,[viewwidth]
   ;	
		mov		bx,[_viewwidth]
   ;	
   ;	asm	shr	bx,3					// bl = viewwidth/8
   ;	
		shr		bx,3					
   ;	
   ;	asm	mov	bh,BYTE PTR [viewheight]
   ;	
		mov		bh,BYTE PTR [_viewheight]
   ;	
   ;	asm	shr	bh,1					// half height
   ;	
		shr		bh,1					
   ;	
   ;	
   ;	asm	mov	es,[screenseg]
   ;	
		mov		es,[_screenseg]
   ;	
   ;	asm	mov	di,[bufferofs]
   ;	
		mov		di,[_bufferofs]
   ;	
   ;	asm	mov	ax,[ceiling]
   ;	
		mov		ax,[[bp-2]]
@13@386:
   ;	
   ;	
   ;	toploop:
   ;	asm	mov	cl,bl
   ;	
		mov		cl,bl
   ;	
   ;	asm	rep	stosw
   ;	
		rep	stosw	
   ;	
   ;	asm	add	di,dx
   ;	
		add		di,dx
   ;	
   ;	asm	dec	bh
   ;	
		dec		bh
   ;	
   ;	asm	jnz	toploop
   ;	
	jne	short @13@386
   ;	
   ;	
   ;	asm	mov	bh,BYTE PTR [viewheight]
   ;	
		mov		bh,BYTE PTR [_viewheight]
   ;	
   ;	asm	shr	bh,1					// half height
   ;	
		shr		bh,1					
   ;	
   ;	asm	mov	ax,0x1919
   ;	
		mov		ax,01919H
@13@578:
   ;	
   ;	
   ;	bottomloop:
   ;	asm	mov	cl,bl
   ;	
		mov		cl,bl
   ;	
   ;	asm	rep	stosw
   ;	
		rep	stosw	
   ;	
   ;	asm	add	di,dx
   ;	
		add		di,dx
   ;	
   ;	asm	dec	bh
   ;	
		dec		bh
   ;	
   ;	asm	jnz	bottomloop
   ;	
	jne	short @13@578
   ;	
   ;	}
   ;	
	pop	di
	mov	sp,bp
	pop	bp
	ret	
_VGAClearScreen	endp
   ;	
   ;	int	CalcRotate (objtype *ob)
   ;	
	assume	cs:_TEXT
_CalcRotate	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{
   ;		int	angle,viewangle;
   ;	
   ;		// this isn't exactly correct, as it should vary by a trig value,
   ;		// but it is close enough with only eight rotations
   ;	
   ;		viewangle = player->angle + (centerx - ob->viewx)/8;
   ;	
	mov	ax,word ptr DGROUP:_centerx
	sub	ax,word ptr [di+28]
	mov	bx,8
	cwd	
	idiv	bx
	mov	bx,word ptr DGROUP:_player
	mov	dx,word ptr [bx+40]
	add	dx,ax
	mov	cx,dx
   ;	
   ;	
   ;		if (ob->obclass == rocketobj || ob->obclass == hrocketobj)
   ;	
	cmp	word ptr [di+4],20
	je	short @14@74
	cmp	word ptr [di+4],27
	jne	short @14@98
@14@74:
   ;	
   ;			angle =  (viewangle-180)- ob->angle;
   ;	
	mov	ax,cx
	add	ax,65356
	sub	ax,word ptr [di+40]
	mov	si,ax
	jmp	short @14@122
@14@98:
   ;	
   ;		else
   ;			angle =  (viewangle-180)- dirangle[ob->dir];
   ;	
	mov	bx,word ptr [di+13]
	shl	bx,1
	mov	ax,cx
	add	ax,65356
	sub	ax,word ptr DGROUP:_dirangle[bx]
	mov	si,ax
@14@122:
   ;	
   ;	
   ;		angle+=ANGLES/16;
   ;	
	add	si,22
	jmp	short @14@170
@14@146:
   ;	
   ;		while (angle>=ANGLES)
   ;			angle-=ANGLES;
   ;	
	sub	si,360
@14@170:
	cmp	si,360
	jge	short @14@146
	jmp	short @14@242
@14@218:
   ;	
   ;		while (angle<0)
   ;			angle+=ANGLES;
   ;	
	add	si,360
@14@242:
	or	si,si
	jl	short @14@218
   ;	
   ;	
   ;		if (ob->state->rotate == 2)             // 2 rotation pain frame
   ;	
	mov	bx,word ptr [di+6]
	cmp	word ptr [bx],2
	jne	short @14@314
   ;	
   ;			return 4*(angle/(ANGLES/2));        // seperated by 3 (art layout...)
   ;	
	mov	ax,si
	mov	bx,180
	cwd	
	idiv	bx
	shl	ax,1
	shl	ax,1
	jmp	short @14@338
@14@314:
   ;	
   ;	
   ;		return angle/(ANGLES/8);
   ;	
	mov	ax,si
	mov	bx,45
	cwd	
	idiv	bx
	jmp	short @14@338
@14@338:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_CalcRotate	endp
   ;	
   ;	void DrawScaleds (void)
   ;	
	assume	cs:_TEXT
_DrawScaleds	proc	near
	push	bp
	mov	bp,sp
	sub	sp,14
	push	si
	push	di
   ;	
   ;	{
   ;		int 		i,j,least,numvisable,height;
   ;		memptr		shape;
   ;		byte		*tilespot,*visspot;
   ;		int			shapenum;
   ;		unsigned	spotloc;
   ;	
   ;		statobj_t	*statptr;
   ;		objtype		*obj;
   ;	
   ;		visptr = &vislist[0];
   ;	
	mov	word ptr DGROUP:_visptr,offset DGROUP:_vislist
   ;	
   ;	
   ;	//
   ;	// place static objects
   ;	//
   ;		for (statptr = &statobjlist[0] ; statptr !=laststatobj ; statptr++)
   ;	
	mov	word ptr [bp-14],offset DGROUP:_statobjlist
	jmp	@15@338
@15@50:
   ;	
   ;		{
   ;			if ((visptr->shapenum = statptr->shapenum) == -1)
   ;	
	mov	bx,word ptr [bp-14]
	mov	ax,word ptr [bx+4]
	mov	bx,word ptr DGROUP:_visptr
	mov	word ptr [bx+4],ax
	cmp	ax,65535
	jne	short @15@98
   ;	
   ;				continue;						// object has been deleted
   ;	
	jmp	short @15@314
@15@98:
   ;	
   ;	
   ;			if (!*statptr->visspot)
   ;	
	mov	bx,word ptr [bp-14]
	mov	bx,word ptr [bx+2]
	mov	al,byte ptr [bx]
	mov	ah,0
	or	ax,ax
	jne	short @15@146
   ;	
   ;				continue;						// not visable
   ;	
	jmp	short @15@314
@15@146:
   ;	
   ;	
   ;			if (TransformTile (statptr->tilex,statptr->tiley
   ;	
   ;	
   ;				,&visptr->viewx,&visptr->viewheight) && statptr->flags & FL_BONUS)
   ;	
	mov	ax,word ptr DGROUP:_visptr
	inc	ax
	inc	ax
	push	ax
	push	word ptr DGROUP:_visptr
	mov	bx,word ptr [bp-14]
	mov	al,byte ptr [bx+1]
	mov	ah,0
	push	ax
	mov	bx,word ptr [bp-14]
	mov	al,byte ptr [bx]
	mov	ah,0
	push	ax
	call	near ptr _TransformTile
	add	sp,8
	or	ax,ax
	je	short @15@218
	mov	bx,word ptr [bp-14]
	test	byte ptr [bx+6],2
	je	short @15@218
   ;	
   ;			{
   ;				GetBonus (statptr);
   ;	
	push	word ptr [bp-14]
	call	near ptr _GetBonus
	pop	cx
   ;	
   ;				continue;
   ;	
	jmp	short @15@314
@15@218:
   ;	
   ;			}
   ;	
   ;			if (!visptr->viewheight)
   ;	
	mov	bx,word ptr DGROUP:_visptr
	cmp	word ptr [bx+2],0
	jne	short @15@266
   ;	
   ;				continue;						// to close to the object
   ;	
	jmp	short @15@314
@15@266:
   ;	
   ;	
   ;			if (visptr < &vislist[MAXVISABLE-1])	// don't let it overflow
   ;	
	cmp	word ptr DGROUP:_visptr,offset DGROUP:_vislist+294
	jae	short @15@314
   ;	
   ;				visptr++;
   ;	
	add	word ptr DGROUP:_visptr,6
@15@314:
	add	word ptr [bp-14],8
@15@338:
	mov	ax,word ptr [bp-14]
	cmp	ax,word ptr DGROUP:_laststatobj
	je	@@0
	jmp	@15@50
@@0:
   ;	
   ;		}
   ;	
   ;	//
   ;	// place active objects
   ;	//
   ;		for (obj = player->next;obj;obj=obj->next)
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	si,word ptr [bx+54]
	jmp	@15@1106
@15@386:
   ;	
   ;		{
   ;			if (!(visptr->shapenum = obj->state->shapenum))
   ;	
	mov	bx,word ptr [si+6]
	mov	ax,word ptr [bx+2]
	mov	bx,word ptr DGROUP:_visptr
	mov	word ptr [bx+4],ax
	or	ax,ax
	jne	short @15@434
   ;	
   ;				continue;						// no shape
   ;	
	jmp	@15@1082
@15@434:
   ;	
   ;	
   ;			spotloc = (obj->tilex<<6)+obj->tiley;	// optimize: keep in struct?
   ;	
	mov	ax,word ptr [si+23]
	mov	cl,6
	shl	ax,cl
	add	ax,word ptr [si+25]
	mov	word ptr [bp-12],ax
   ;	
   ;			visspot = &spotvis[0][0]+spotloc;
   ;	
	mov	ax,word ptr [bp-12]
	add	ax,offset DGROUP:_spotvis
	mov	di,ax
   ;	
   ;			tilespot = &tilemap[0][0]+spotloc;
   ;	
	mov	ax,word ptr [bp-12]
	add	ax,offset DGROUP:_tilemap
	mov	word ptr [bp-10],ax
   ;	
   ;	
   ;			//
   ;			// could be in any of the nine surrounding tiles
   ;			//
   ;			if (*visspot
   ;	
   ;	
   ;			|| ( *(visspot-1) && !*(tilespot-1) )
   ;			|| ( *(visspot+1) && !*(tilespot+1) )
   ;			|| ( *(visspot-65) && !*(tilespot-65) )
   ;			|| ( *(visspot-64) && !*(tilespot-64) )
   ;			|| ( *(visspot-63) && !*(tilespot-63) )
   ;			|| ( *(visspot+65) && !*(tilespot+65) )
   ;			|| ( *(visspot+64) && !*(tilespot+64) )
   ;			|| ( *(visspot+63) && !*(tilespot+63) ) )
   ;	
	cmp	byte ptr [di],0
	je	@@1
	jmp	@15@842
@@1:
	cmp	byte ptr [di-1],0
	je	short @15@506
	mov	bx,word ptr [bp-10]
	mov	al,byte ptr [bx-1]
	mov	ah,0
	or	ax,ax
	jne	@@2
	jmp	@15@842
@@2:
@15@506:
	cmp	byte ptr [di+1],0
	je	short @15@554
	mov	bx,word ptr [bp-10]
	mov	al,byte ptr [bx+1]
	mov	ah,0
	or	ax,ax
	je	short @15@842
@15@554:
	cmp	byte ptr [di-65],0
	je	short @15@602
	mov	bx,word ptr [bp-10]
	mov	al,byte ptr [bx-65]
	mov	ah,0
	or	ax,ax
	je	short @15@842
@15@602:
	cmp	byte ptr [di-64],0
	je	short @15@650
	mov	bx,word ptr [bp-10]
	mov	al,byte ptr [bx-64]
	mov	ah,0
	or	ax,ax
	je	short @15@842
@15@650:
	cmp	byte ptr [di-63],0
	je	short @15@698
	mov	bx,word ptr [bp-10]
	mov	al,byte ptr [bx-63]
	mov	ah,0
	or	ax,ax
	je	short @15@842
@15@698:
	cmp	byte ptr [di+65],0
	je	short @15@746
	mov	bx,word ptr [bp-10]
	mov	al,byte ptr [bx+65]
	mov	ah,0
	or	ax,ax
	je	short @15@842
@15@746:
	cmp	byte ptr [di+64],0
	je	short @15@794
	mov	bx,word ptr [bp-10]
	mov	al,byte ptr [bx+64]
	mov	ah,0
	or	ax,ax
	je	short @15@842
@15@794:
	cmp	byte ptr [di+63],0
	je	short @15@1058
	mov	bx,word ptr [bp-10]
	mov	al,byte ptr [bx+63]
	mov	ah,0
	or	ax,ax
	jne	short @15@1058
@15@842:
   ;	
   ;			{
   ;				obj->active = true;
   ;	
	mov	word ptr [si],1
   ;	
   ;				TransformActor (obj);
   ;	
	push	si
	call	near ptr _TransformActor
	pop	cx
   ;	
   ;				if (!obj->viewheight)
   ;	
	cmp	word ptr [si+30],0
	jne	short @15@890
   ;	
   ;					continue;						// too close or far away
   ;	
	jmp	short @15@1082
@15@890:
   ;	
   ;	
   ;				visptr->viewx = obj->viewx;
   ;	
	mov	ax,word ptr [si+28]
	mov	bx,word ptr DGROUP:_visptr
	mov	word ptr [bx],ax
   ;	
   ;				visptr->viewheight = obj->viewheight;
   ;	
	mov	ax,word ptr [si+30]
	mov	bx,word ptr DGROUP:_visptr
	mov	word ptr [bx+2],ax
   ;	
   ;				if (visptr->shapenum == -1)
   ;	
	mov	bx,word ptr DGROUP:_visptr
	cmp	word ptr [bx+4],65535
	jne	short @15@938
   ;	
   ;					visptr->shapenum = obj->temp1;	// special shape
   ;	
	mov	ax,word ptr [si+48]
	mov	bx,word ptr DGROUP:_visptr
	mov	word ptr [bx+4],ax
@15@938:
   ;	
   ;	
   ;				if (obj->state->rotate)
   ;	
	mov	bx,word ptr [si+6]
	cmp	word ptr [bx],0
	je	short @15@986
   ;	
   ;					visptr->shapenum += CalcRotate (obj);
   ;	
	push	si
	call	near ptr _CalcRotate
	pop	cx
	mov	bx,word ptr DGROUP:_visptr
	add	word ptr [bx+4],ax
@15@986:
   ;	
   ;	
   ;				if (visptr < &vislist[MAXVISABLE-1])	// don't let it overflow
   ;	
	cmp	word ptr DGROUP:_visptr,offset DGROUP:_vislist+294
	jae	short @15@1034
   ;	
   ;					visptr++;
   ;	
	add	word ptr DGROUP:_visptr,6
@15@1034:
   ;	
   ;				obj->flags |= FL_VISABLE;
   ;	
	mov	al,byte ptr [si+8]
	or	al,8
	mov	byte ptr [si+8],al
   ;	
   ;			}
   ;	
	jmp	short @15@1082
@15@1058:
   ;	
   ;			else
   ;				obj->flags &= ~FL_VISABLE;
   ;	
	mov	al,byte ptr [si+8]
	and	al,247
	mov	byte ptr [si+8],al
@15@1082:
	mov	si,word ptr [si+54]
@15@1106:
	or	si,si
	je	@@3
	jmp	@15@386
@@3:
   ;	
   ;		}
   ;	
   ;	//
   ;	// draw from back to front
   ;	//
   ;		numvisable = visptr-&vislist[0];
   ;	
	mov	ax,word ptr DGROUP:_visptr
	sub	ax,offset DGROUP:_vislist
	mov	bx,6
	cwd	
	idiv	bx
	mov	word ptr [bp-6],ax
   ;	
   ;	
   ;		if (!numvisable)
   ;	
	cmp	word ptr [bp-6],0
	jne	short @15@1178
   ;	
   ;			return;									// no visable objects
   ;	
	jmp	short @15@1394
@15@1178:
   ;	
   ;	
   ;		for (i = 0; i<numvisable; i++)
   ;	
	mov	word ptr [bp-2],0
	jmp	short @15@1370
@15@1202:
   ;	
   ;		{
   ;			least = 32000;
   ;	
	mov	word ptr [bp-4],32000
   ;	
   ;			for (visstep=&vislist[0] ; visstep<visptr ; visstep++)
   ;	
	mov	word ptr DGROUP:_visstep,offset DGROUP:_vislist
	jmp	short @15@1298
@15@1226:
   ;	
   ;			{
   ;				height = visstep->viewheight;
   ;	
	mov	bx,word ptr DGROUP:_visstep
	mov	ax,word ptr [bx+2]
	mov	word ptr [bp-8],ax
   ;	
   ;				if (height < least)
   ;	
	mov	ax,word ptr [bp-8]
	cmp	ax,word ptr [bp-4]
	jge	short @15@1274
   ;	
   ;				{
   ;					least = height;
   ;	
	mov	ax,word ptr [bp-8]
	mov	word ptr [bp-4],ax
   ;	
   ;					farthest = visstep;
   ;	
	mov	ax,word ptr DGROUP:_visstep
	mov	word ptr DGROUP:_farthest,ax
@15@1274:
	add	word ptr DGROUP:_visstep,6
@15@1298:
	mov	ax,word ptr DGROUP:_visstep
	cmp	ax,word ptr DGROUP:_visptr
	jb	short @15@1226
   ;	
   ;				}
   ;			}
   ;			//
   ;			// draw farthest
   ;			//
   ;			ScaleShape(farthest->viewx,farthest->shapenum,farthest->viewheight);
   ;	
	mov	bx,word ptr DGROUP:_farthest
	push	word ptr [bx+2]
	mov	bx,word ptr DGROUP:_farthest
	push	word ptr [bx+4]
	mov	bx,word ptr DGROUP:_farthest
	push	word ptr [bx]
	call	near ptr _ScaleShape
	add	sp,6
   ;	
   ;	
   ;			farthest->viewheight = 32000;
   ;	
	mov	bx,word ptr DGROUP:_farthest
	mov	word ptr [bx+2],32000
	inc	word ptr [bp-2]
@15@1370:
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr [bp-6]
	jl	short @15@1202
@15@1394:
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
_DrawScaleds	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_weaponscale	label	word
	db	160
	db	1
	db	165
	db	1
	db	170
	db	1
	db	175
	db	1
	db	2 dup (0)
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void DrawPlayerWeapon (void)
   ;	
	assume	cs:_TEXT
_DrawPlayerWeapon	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int	shapenum;
   ;	
   ;	#ifndef SPEAR
   ;		if (gamestate.victoryflag)
   ;	
	cmp	word ptr DGROUP:_gamestate+64,0
	je	short @16@146
   ;	
   ;		{
   ;			if (player->state == &s_deathcam && (TimeCount&32) )
   ;	
	mov	bx,word ptr DGROUP:_player
	cmp	word ptr [bx+6],offset DGROUP:_s_deathcam
	jne	short @16@122
	mov	ax,word ptr DGROUP:_TimeCount+2
	mov	dx,word ptr DGROUP:_TimeCount
	and	dx,32
	and	ax,0
	or	dx,ax
	je	short @16@122
   ;	
   ;				SimpleScaleShape(viewwidth/2,SPR_DEATHCAM,viewheight+1);
   ;	
	mov	ax,word ptr DGROUP:_viewheight
	inc	ax
	push	ax
	mov	ax,1
	push	ax
	mov	ax,word ptr DGROUP:_viewwidth
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	near ptr _SimpleScaleShape
	add	sp,6
@16@122:
   ;	
   ;			return;
   ;	
	jmp	short @16@266
@16@146:
   ;	
   ;		}
   ;	#endif
   ;	
   ;		if (gamestate.weapon != -1)
   ;	
	cmp	word ptr DGROUP:_gamestate+26,65535
	je	short @16@194
   ;	
   ;		{
   ;			shapenum = weaponscale[gamestate.weapon]+gamestate.weaponframe;
   ;	
	mov	bx,word ptr DGROUP:_gamestate+26
	shl	bx,1
	mov	ax,word ptr DGROUP:_weaponscale[bx]
	add	ax,word ptr DGROUP:_gamestate+36
	mov	si,ax
   ;	
   ;			SimpleScaleShape(viewwidth/2,shapenum,viewheight+1);
   ;	
	mov	ax,word ptr DGROUP:_viewheight
	inc	ax
	push	ax
	push	si
	mov	ax,word ptr DGROUP:_viewwidth
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	near ptr _SimpleScaleShape
	add	sp,6
@16@194:
   ;	
   ;		}
   ;	
   ;		if (demorecord || demoplayback)
   ;	
	cmp	word ptr DGROUP:_demorecord,0
	jne	short @16@242
	cmp	word ptr DGROUP:_demoplayback,0
	je	short @16@266
@16@242:
   ;	
   ;			SimpleScaleShape(viewwidth/2,SPR_DEMO,viewheight+1);
   ;	
	mov	ax,word ptr DGROUP:_viewheight
	inc	ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,word ptr DGROUP:_viewwidth
	mov	bx,2
	cwd	
	idiv	bx
	push	ax
	call	near ptr _SimpleScaleShape
	add	sp,6
@16@266:
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_DrawPlayerWeapon	endp
   ;	
   ;	void CalcTics (void)
   ;	
	assume	cs:_TEXT
_CalcTics	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;	{
   ;		long	newtime,oldtimecount;
   ;	
   ;	//
   ;	// calculate tics since last refresh for adaptive timing
   ;	//
   ;		if (lasttimecount > TimeCount)
   ;	
	mov	ax,word ptr DGROUP:_lasttimecount+2
	mov	dx,word ptr DGROUP:_lasttimecount
	cmp	ax,word ptr DGROUP:_TimeCount+2
	jb	short @17@122
	ja	short @17@98
	cmp	dx,word ptr DGROUP:_TimeCount
	jbe	short @17@122
@17@98:
   ;	
   ;			TimeCount = lasttimecount;		// if the game was paused a LONG time
   ;	
	mov	ax,word ptr DGROUP:_lasttimecount+2
	mov	dx,word ptr DGROUP:_lasttimecount
	mov	word ptr DGROUP:_TimeCount,dx
	mov	word ptr DGROUP:_TimeCount+2,ax
@17@122:
   ;	
   ;	
   ;		do
   ;		{
   ;			newtime = TimeCount;
   ;	
	mov	ax,word ptr DGROUP:_TimeCount+2
	mov	dx,word ptr DGROUP:_TimeCount
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;			tics = newtime-lasttimecount;
   ;	
	mov	ax,word ptr [bp-4]
	sub	ax,word ptr DGROUP:_lasttimecount
	mov	word ptr DGROUP:_tics,ax
   ;	
   ;		} while (!tics);			// make sure at least one tic passes
   ;	
	cmp	word ptr DGROUP:_tics,0
	je	short @17@122
   ;	
   ;	
   ;		lasttimecount = newtime;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr DGROUP:_lasttimecount,dx
	mov	word ptr DGROUP:_lasttimecount+2,ax
   ;	
   ;	
   ;	#ifdef FILEPROFILE
   ;			strcpy (scratch,"\tTics:");
   ;			itoa (tics,str,10);
   ;			strcat (scratch,str);
   ;			strcat (scratch,"\n");
   ;			write (profilehandle,scratch,strlen(scratch));
   ;	#endif
   ;	
   ;		if (tics>MAXTICS)
   ;	
	cmp	word ptr DGROUP:_tics,10
	jbe	short @17@218
   ;	
   ;		{
   ;			TimeCount -= (tics-MAXTICS);
   ;	
	mov	ax,word ptr DGROUP:_tics
	sub	ax,10
	sub	word ptr DGROUP:_TimeCount,ax
	sbb	word ptr DGROUP:_TimeCount+2,0
   ;	
   ;			tics = MAXTICS;
   ;	
	mov	word ptr DGROUP:_tics,10
@17@218:
   ;	
   ;		}
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_CalcTics	endp
   ;	
   ;	void	FixOfs (void)
   ;	
	assume	cs:_TEXT
_FixOfs	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		VW_ScreenToScreen (displayofs,bufferofs,viewwidth/8,viewheight);
   ;	
	push	word ptr DGROUP:_viewheight
	mov	ax,word ptr DGROUP:_viewwidth
	mov	bx,8
	cwd	
	idiv	bx
	push	ax
	push	word ptr DGROUP:_bufferofs
	push	word ptr DGROUP:_displayofs
	call	near ptr _VL_ScreenToScreen
	add	sp,8
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_FixOfs	endp
   ;	
   ;	void WallRefresh (void)
   ;	
	assume	cs:_TEXT
_WallRefresh	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	//
   ;	// set up variables for this view
   ;	//
   ;		viewangle = player->angle;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+40]
	mov	word ptr DGROUP:_viewangle,ax
   ;	
   ;		midangle = viewangle*(FINEANGLES/ANGLES);
   ;	
	mov	ax,word ptr DGROUP:_viewangle
	mov	dx,10
	imul	dx
	mov	word ptr DGROUP:_midangle,ax
   ;	
   ;		viewsin = sintable[viewangle];
   ;	
	mov	bx,word ptr DGROUP:_viewangle
	shl	bx,1
	shl	bx,1
	mov	ax,seg _sintable
	mov	es,ax
	mov	ax,word ptr es:_sintable[bx+2]
	mov	dx,word ptr es:_sintable[bx]
	mov	word ptr DGROUP:_viewsin,dx
	mov	word ptr DGROUP:_viewsin+2,ax
   ;	
   ;		viewcos = costable[viewangle];
   ;	
	mov	ax,word ptr DGROUP:_viewangle
	shl	ax,1
	shl	ax,1
	les	bx,dword ptr DGROUP:_costable
	add	bx,ax
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	mov	word ptr DGROUP:_viewcos,dx
	mov	word ptr DGROUP:_viewcos+2,ax
   ;	
   ;		viewx = player->x - FixedByFrac(focallength,viewcos);
   ;	
	push	word ptr DGROUP:_viewcos+2
	push	word ptr DGROUP:_viewcos
	push	word ptr DGROUP:_focallength+2
	push	word ptr DGROUP:_focallength
	call	near ptr _FixedByFrac
	add	sp,8
	mov	bx,word ptr DGROUP:_player
	mov	cx,word ptr [bx+17]
	mov	bx,word ptr [bx+15]
	sub	bx,ax
	sbb	cx,dx
	mov	word ptr DGROUP:_viewx,bx
	mov	word ptr DGROUP:_viewx+2,cx
   ;	
   ;		viewy = player->y + FixedByFrac(focallength,viewsin);
   ;	
	push	word ptr DGROUP:_viewsin+2
	push	word ptr DGROUP:_viewsin
	push	word ptr DGROUP:_focallength+2
	push	word ptr DGROUP:_focallength
	call	near ptr _FixedByFrac
	add	sp,8
	mov	bx,word ptr DGROUP:_player
	mov	cx,word ptr [bx+21]
	mov	bx,word ptr [bx+19]
	add	bx,ax
	adc	cx,dx
	mov	word ptr DGROUP:_viewy,bx
	mov	word ptr DGROUP:_viewy+2,cx
   ;	
   ;	
   ;		focaltx = viewx>>TILESHIFT;
   ;	
	mov	ax,word ptr DGROUP:_viewx+2
	cwd	
	mov	word ptr DGROUP:_focaltx,ax
   ;	
   ;		focalty = viewy>>TILESHIFT;
   ;	
	mov	ax,word ptr DGROUP:_viewy+2
	cwd	
	mov	word ptr DGROUP:_focalty,ax
   ;	
   ;	
   ;		viewtx = player->x >> TILESHIFT;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+17]
	cwd	
	mov	word ptr DGROUP:_viewtx,ax
   ;	
   ;		viewty = player->y >> TILESHIFT;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+21]
	cwd	
	mov	word ptr DGROUP:_viewty,ax
   ;	
   ;	
   ;		xpartialdown = viewx&(TILEGLOBAL-1);
   ;	
	mov	ax,word ptr DGROUP:_viewx
	and	ax,65535
	mov	word ptr DGROUP:_xpartialdown,ax
   ;	
   ;		xpartialup = TILEGLOBAL-xpartialdown;
   ;	
	xor	ax,ax
	sub	ax,word ptr DGROUP:_xpartialdown
	mov	word ptr DGROUP:_xpartialup,ax
   ;	
   ;		ypartialdown = viewy&(TILEGLOBAL-1);
   ;	
	mov	ax,word ptr DGROUP:_viewy
	and	ax,65535
	mov	word ptr DGROUP:_ypartialdown,ax
   ;	
   ;		ypartialup = TILEGLOBAL-ypartialdown;
   ;	
	xor	ax,ax
	sub	ax,word ptr DGROUP:_ypartialdown
	mov	word ptr DGROUP:_ypartialup,ax
   ;	
   ;	
   ;		lastside = -1;			// the first pixel is on a new wall
   ;	
	mov	word ptr DGROUP:_lastside,65535
   ;	
   ;		AsmRefresh ();
   ;	
	call	near ptr _AsmRefresh
   ;	
   ;		ScalePost ();			// no more optimization on last post
   ;	
	call	near ptr _ScalePost
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_WallRefresh	endp
   ;	
   ;	void	ThreeDRefresh (void)
   ;	
	assume	cs:_TEXT
_ThreeDRefresh	proc	near
	push	bp
	mov	bp,sp
	push	di
   ;	
   ;	{
   ;		int tracedir;
   ;	
   ;	// this wouldn't need to be done except for my debugger/video wierdness
   ;		outportb (SC_INDEX,SC_MAPMASK);
   ;	
	mov	dx,964
	mov	al,2
	out	dx,al
   ;	
   ;	
   ;	//
   ;	// clear out the traced array
   ;	//
   ;	asm	mov	ax,ds
   ;	
		mov		ax,ds
   ;	
   ;	asm	mov	es,ax
   ;	
		mov		es,ax
   ;	
   ;	asm	mov	di,OFFSET spotvis
   ;	
		mov		di,OFFSET _spotvis
   ;	
   ;	asm	xor	ax,ax
   ;	
		xor		ax,ax
   ;	
   ;	asm	mov	cx,2048							// 64*64 / 2
   ;	
		mov		cx,2048							
   ;	
   ;	asm	rep stosw
   ;	
		rep stosw	
   ;	
   ;	
   ;		bufferofs += screenofs;
   ;	
	mov	ax,word ptr DGROUP:_screenofs
	add	word ptr DGROUP:_bufferofs,ax
   ;	
   ;	
   ;	//
   ;	// follow the walls from there to the right, drawwing as we go
   ;	//
   ;		VGAClearScreen ();
   ;	
	call	near ptr _VGAClearScreen
   ;	
   ;	
   ;		WallRefresh ();
   ;	
	call	near ptr _WallRefresh
   ;	
   ;	
   ;	//
   ;	// draw all the scaled images
   ;	//
   ;		DrawScaleds();			// draw scaled stuff
   ;	
	call	near ptr _DrawScaleds
   ;	
   ;		DrawPlayerWeapon ();	// draw player's hands
   ;	
	call	near ptr _DrawPlayerWeapon
   ;	
   ;	
   ;	//
   ;	// show screen and time last cycle
   ;	//
   ;		if (fizzlein)
   ;	
	cmp	word ptr DGROUP:_fizzlein,0
	je	short @20@242
   ;	
   ;		{
   ;			FizzleFade(bufferofs,displayofs+screenofs,viewwidth,viewheight,20,false);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,20
	push	ax
	push	word ptr DGROUP:_viewheight
	push	word ptr DGROUP:_viewwidth
	mov	ax,word ptr DGROUP:_displayofs
	add	ax,word ptr DGROUP:_screenofs
	push	ax
	push	word ptr DGROUP:_bufferofs
	call	near ptr _FizzleFade
	add	sp,12
   ;	
   ;			fizzlein = false;
   ;	
	mov	word ptr DGROUP:_fizzlein,0
   ;	
   ;	
   ;			lasttimecount = TimeCount = 0;		// don't make a big tic count
   ;	
	xor	ax,ax
	xor	dx,dx
	mov	word ptr DGROUP:_TimeCount,dx
	mov	word ptr DGROUP:_TimeCount+2,ax
	mov	word ptr DGROUP:_lasttimecount,dx
	mov	word ptr DGROUP:_lasttimecount+2,ax
@20@242:
   ;	
   ;	
   ;		}
   ;	
   ;		bufferofs -= screenofs;
   ;	
	mov	ax,word ptr DGROUP:_screenofs
	sub	word ptr DGROUP:_bufferofs,ax
   ;	
   ;		displayofs = bufferofs;
   ;	
	mov	ax,word ptr DGROUP:_bufferofs
	mov	word ptr DGROUP:_displayofs,ax
   ;	
   ;	
   ;		asm	cli
   ;	
		cli	
   ;	
   ;		asm	mov	cx,[displayofs]
   ;	
		mov		cx,[_displayofs]
   ;	
   ;		asm	mov	dx,3d4h		// CRTC address register
   ;	
		mov		dx,3d4h		
   ;	
   ;		asm	mov	al,0ch		// start address high register
   ;	
		mov		al,0ch		
   ;	
   ;		asm	out	dx,al
   ;	
		out		dx,al
   ;	
   ;		asm	inc	dx
   ;	
		inc		dx
   ;	
   ;		asm	mov	al,ch
   ;	
		mov		al,ch
   ;	
   ;		asm	out	dx,al   	// set the high byte
   ;	
		out		dx,al   	
   ;	
   ;		asm	sti
   ;	
		sti	
   ;	
   ;	
   ;		bufferofs += SCREENSIZE;
   ;	
	add	word ptr DGROUP:_bufferofs,16640
   ;	
   ;		if (bufferofs > PAGE3START)
   ;	
	cmp	word ptr DGROUP:_bufferofs,33280
	jbe	short @20@530
   ;	
   ;			bufferofs = PAGE1START;
   ;	
	mov	word ptr DGROUP:_bufferofs,0
@20@530:
   ;	
   ;	
   ;		frameon++;
   ;	
	add	word ptr DGROUP:_frameon,1
	adc	word ptr DGROUP:_frameon+2,0
   ;	
   ;		PM_NextFrame();
   ;	
	call	near ptr _PM_NextFrame
   ;	
   ;	}
   ;	
	pop	di
	pop	bp
	ret	
_ThreeDRefresh	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_lasttimecount	label	word
	db	4 dup (?)
_lastintercept	label	word
	db	4 dup (?)
_postx	label	word
	db	2 dup (?)
_focaltx	label	word
	db	2 dup (?)
_focalty	label	word
	db	2 dup (?)
_postsource	label	word
	db	4 dup (?)
_horizwall	label	word
	db	128 dup (?)
_xtile	label	word
	db	2 dup (?)
_ytile	label	word
	db	2 dup (?)
_postwidth	label	word
	db	2 dup (?)
_xpartial	label	word
	db	2 dup (?)
_ypartial	label	word
	db	2 dup (?)
_xtilestep	label	word
	db	2 dup (?)
_ytilestep	label	word
	db	2 dup (?)
_pixx	label	word
	db	2 dup (?)
_visstep	label	word
	db	2 dup (?)
_viewx	label	word
	db	4 dup (?)
_viewy	label	word
	db	4 dup (?)
_tilehit	label	word
	db	2 dup (?)
_viewsin	label	word
	db	4 dup (?)
_lastside	label	word
	db	2 dup (?)
_viewtx	label	word
	db	2 dup (?)
_viewty	label	word
	db	2 dup (?)
_visptr	label	word
	db	2 dup (?)
_xpartialup	label	word
	db	2 dup (?)
_ypartialup	label	word
	db	2 dup (?)
_viewcos	label	word
	db	4 dup (?)
_midangle	label	word
	db	2 dup (?)
_vislist	label	word
	db	300 dup (?)
_sintable	label	word
	db	1800 dup (?)
_vertwall	label	word
	db	128 dup (?)
_xinttile	label	word
	db	2 dup (?)
_yinttile	label	word
	db	2 dup (?)
_farthest	label	word
	db	2 dup (?)
_angle	label	word
	db	2 dup (?)
_menuitems	label	word
	db	2 dup (?)
_viewangle	label	word
	db	2 dup (?)
_xpartialdown	label	word
	db	2 dup (?)
_ypartialdown	label	word
	db	2 dup (?)
_wallheight	label	word
	db	640 dup (?)
_pixelangle	label	word
	db	640 dup (?)
_lasttilehit	label	word
	db	2 dup (?)
_xintercept	label	word
	db	4 dup (?)
_yintercept	label	word
	db	4 dup (?)
_finetangent	label	word
	db	3600 dup (?)
_frameon	label	word
	db	4 dup (?)
_xstep	label	word
	db	4 dup (?)
_ystep	label	word
	db	4 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	public	_HitHorizPWall
	public	_ystep
	public	_xstep
	public	_FarScalePost
	extrn	_maxscaleshl2:word
	public	_HitHorizDoor
	public	_freelatch
	extrn	_VL_ScreenToScreen:near
	extrn	_PM_NextFrame:near
	public	_WallRefresh
	public	_HitVertPWall
	public	_HitHorizWall
	public	_frameon
	public	_weaponscale
	public	_finetangent
	public	_HitVertDoor
	extrn	_demoplayback:word
	public	_yintercept
	public	_xintercept
	public	_lasttilehit
	extrn	_demorecord:word
	public	_HitVertWall
	public	_CalcRotate
	extrn	_viewwidth:word
	public	_pixelangle
	extrn	_gamestate:word
	extrn	_mapmasks3:byte
	extrn	_mapmasks2:byte
	extrn	_mapmasks1:byte
	extrn	_laststatobj:word
	public	_wallheight
	extrn	_viewheight:word
	public	_ypartialdown
	public	_xpartialdown
	public	_ThreeDRefresh
	public	_viewangle
	public	_menuitems
	extrn	_displayofs:word
	public	_FixedByFrac
	extrn	_PM_GetPage:near
	extrn	_TimeCount:word
	public	_CalcHeight
	public	_angle
	public	_farthest
	public	_tileglobal
	extrn	_GetBonus:near
	extrn	_FizzleFade:near
	public	_yinttile
	public	_xinttile
	public	_vertwall
	public	_sintable
	extrn	_bufferofs:word
	public	_vislist
	public	_midangle
	extrn	_statobjlist:word
	public	_mindist
	extrn	_dirangle:word
	extrn	_centerx:word
	public	_viewcos
	extrn	_fizzlein:word
	public	_ypartialup
	public	_xpartialup
	public	_visptr
	public	_viewty
	public	_viewtx
	public	_lastside
	public	_viewsin
	public	_tilehit
	public	_viewy
	public	_viewx
	public	_visstep
	public	_CalcTics
	extrn	_tilemap:byte
	public	_pixx
	extrn	_mapon:word
	public	_VGAClearScreen
	public	_FixOfs
	public	_ytilestep
	public	_xtilestep
	extrn	_doorposition:word
	extrn	_focallength:word
	public	_DrawPlayerWeapon
	extrn	_doorobjlist:word
	extrn	_tics:word
	public	_ypartial
	public	_xpartial
	extrn	_spotvis:byte
	public	_vgaCeiling
	extrn	_AsmRefresh:near
	extrn	_ScaleShape:near
	public	_postwidth
	public	_TransformActor
	public	_ScalePost
	public	_screenloc
	public	_ytile
	public	_xtile
	extrn	_player:word
	public	_horizwall
	public	_postsource
	extrn	_s_deathcam:word
	public	_TransformTile
	extrn	_pwallpos:word
	extrn	_screenofs:word
	extrn	_screenseg:word
	extrn	_SimpleScaleShape:near
	public	_focalty
	public	_focaltx
	extrn	_fullscalefarcall:word
	public	_costable
	extrn	N_LDIV@:far
	extrn	N_LXMUL@:far
	extrn	_heightnumerator:word
	extrn	N_LXRSH@:far
	public	_postx
	public	_lastintercept
	public	_DrawScaleds
	extrn	_PMSpriteStart:word
	public	_lasttimecount
	extrn	_scale:word
	end
