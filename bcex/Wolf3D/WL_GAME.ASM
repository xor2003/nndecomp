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
	?debug	S "c:\wl_game.c"
	?debug	C E9E551FE7C0C633A5C776C5F67616D652E63
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
_ElevatorBackTo	label	word
	db	1
	db	0
	db	1
	db	0
	db	7
	db	0
	db	3
	db	0
	db	5
	db	0
	db	3
	db	0
_righttable	label	byte
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	7
	db	7
	db	7
	db	7
	db	7
	db	7
	db	6
	db	0
	db	0
	db	0
	db	0
	db	0
	db	1
	db	3
	db	5
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	7
	db	7
	db	7
	db	7
	db	7
	db	6
	db	4
	db	0
	db	0
	db	0
	db	0
	db	0
	db	2
	db	4
	db	6
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	7
	db	7
	db	7
	db	7
	db	6
	db	6
	db	4
	db	1
	db	0
	db	0
	db	0
	db	1
	db	2
	db	4
	db	6
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	7
	db	7
	db	7
	db	7
	db	6
	db	5
	db	4
	db	2
	db	1
	db	0
	db	1
	db	2
	db	3
	db	5
	db	7
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	7
	db	7
	db	7
	db	6
	db	5
	db	4
	db	3
	db	2
	db	2
	db	3
	db	3
	db	5
	db	6
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	7
	db	7
	db	7
	db	6
	db	6
	db	5
	db	4
	db	4
	db	4
	db	4
	db	5
	db	6
	db	7
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	7
	db	7
	db	7
	db	6
	db	6
	db	5
	db	5
	db	5
	db	6
	db	6
	db	7
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	7
	db	7
	db	7
	db	6
	db	6
	db	7
	db	7
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
_lefttable	label	byte
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	5
	db	3
	db	1
	db	0
	db	0
	db	0
	db	0
	db	0
	db	6
	db	7
	db	7
	db	7
	db	7
	db	7
	db	7
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	6
	db	4
	db	2
	db	0
	db	0
	db	0
	db	0
	db	0
	db	4
	db	6
	db	7
	db	7
	db	7
	db	7
	db	7
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	6
	db	4
	db	2
	db	1
	db	0
	db	0
	db	0
	db	1
	db	4
	db	6
	db	6
	db	7
	db	7
	db	7
	db	7
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	7
	db	5
	db	3
	db	2
	db	1
	db	0
	db	1
	db	2
	db	4
	db	5
	db	6
	db	7
	db	7
	db	7
	db	7
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	6
	db	5
	db	3
	db	3
	db	2
	db	2
	db	3
	db	4
	db	5
	db	6
	db	7
	db	7
	db	7
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	7
	db	6
	db	5
	db	4
	db	4
	db	4
	db	4
	db	5
	db	6
	db	6
	db	7
	db	7
	db	7
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	7
	db	6
	db	6
	db	5
	db	5
	db	5
	db	6
	db	6
	db	7
	db	7
	db	7
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	7
	db	7
	db	6
	db	6
	db	7
	db	7
	db	7
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
	db	8
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void
   ;	
	assume	cs:_TEXT
_SetSoundLoc	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	di
   ;	
   ;	SetSoundLoc(fixed gx,fixed gy)
   ;	{
   ;		fixed	xt,yt;
   ;		int		x,y;
   ;	
   ;	//
   ;	// translate point to view centered coordinates
   ;	//
   ;	
	mov	ax,word ptr DGROUP:_viewx+2
	mov	dx,word ptr DGROUP:_viewx
	sub	word ptr [bp+4],dx
	sbb	word ptr [bp+6],ax
   ;	
   ;		gx -= viewx;
   ;	
	mov	ax,word ptr DGROUP:_viewy+2
	mov	dx,word ptr DGROUP:_viewy
	sub	word ptr [bp+8],dx
	sbb	word ptr [bp+10],ax
   ;	
   ;		gy -= viewy;
   ;	
   ;	//
   ;	// calculate newx
   ;	//
   ;	
	push	word ptr DGROUP:_viewcos+2
	push	word ptr DGROUP:_viewcos
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _FixedByFrac
	add	sp,8
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;		xt = FixedByFrac(gx,viewcos);
   ;	
	push	word ptr DGROUP:_viewsin+2
	push	word ptr DGROUP:_viewsin
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	call	near ptr _FixedByFrac
	add	sp,8
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],dx
   ;	
   ;		yt = FixedByFrac(gy,viewsin);
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	sub	dx,word ptr [bp-8]
	sbb	ax,word ptr [bp-6]
	cwd	
	mov	si,ax
   ;	
   ;		x = (xt - yt) >> TILESHIFT;
   ;	
   ;	//
   ;	// calculate newy
   ;	//
   ;	
	push	word ptr DGROUP:_viewsin+2
	push	word ptr DGROUP:_viewsin
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _FixedByFrac
	add	sp,8
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;		xt = FixedByFrac(gx,viewsin);
   ;	
	push	word ptr DGROUP:_viewcos+2
	push	word ptr DGROUP:_viewcos
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	call	near ptr _FixedByFrac
	add	sp,8
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],dx
   ;	
   ;		yt = FixedByFrac(gy,viewcos);
   ;	
	mov	ax,word ptr [bp-6]
	mov	dx,word ptr [bp-8]
	add	dx,word ptr [bp-4]
	adc	ax,word ptr [bp-2]
	cwd	
	mov	di,ax
   ;	
   ;		y = (yt + xt) >> TILESHIFT;
   ;	
   ;	
	cmp	di,15
	jl	short @1@74
   ;	
   ;		if (y >= ATABLEMAX)
   ;	
	mov	di,14
	jmp	short @1@122
@1@74:
   ;	
   ;			y = ATABLEMAX - 1;
   ;	
	cmp	di,65521
	jg	short @1@122
   ;	
   ;		else if (y <= -ATABLEMAX)
   ;	
	mov	di,65521
@1@122:
   ;	
   ;			y = -ATABLEMAX;
   ;	
	or	si,si
	jge	short @1@170
   ;	
   ;		if (x < 0)
   ;	
	mov	ax,si
	neg	ax
	mov	si,ax
@1@170:
   ;	
   ;			x = -x;
   ;	
	cmp	si,15
	jl	short @1@218
   ;	
   ;		if (x >= ATABLEMAX)
   ;	
	mov	si,14
@1@218:
   ;	
   ;			x = ATABLEMAX - 1;
   ;	
	mov	ax,si
	mov	dx,30
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_lefttable[bx+di+15]
	mov	ah,0
	mov	word ptr DGROUP:_leftchannel,ax
   ;	
   ;		leftchannel  =  lefttable[x][y + ATABLEMAX];
   ;	
	mov	ax,si
	mov	dx,30
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_righttable[bx+di+15]
	mov	ah,0
	mov	word ptr DGROUP:_rightchannel,ax
   ;	
   ;		rightchannel = righttable[x][y + ATABLEMAX];
   ;	
   ;	#if 0
   ;		CenterWindow(8,1);
   ;		US_PrintSigned(leftchannel);
   ;		US_Print(",");
   ;		US_PrintSigned(rightchannel);
   ;		VW_UpdateScreen();
   ;	#endif
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_SetSoundLoc	endp
   ;	
   ;	void PlaySoundLocGlobal(word s,fixed gx,fixed gy)
   ;	
	assume	cs:_TEXT
_PlaySoundLocGlobal	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		SetSoundLoc(gx,gy);
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	near ptr _SetSoundLoc
	add	sp,8
   ;	
   ;		SD_PositionSound(leftchannel,rightchannel);
   ;	
	push	word ptr DGROUP:_rightchannel
	push	word ptr DGROUP:_leftchannel
	call	near ptr _SD_PositionSound
	pop	cx
	pop	cx
   ;	
   ;		if (SD_PlaySound(s))
   ;	
	push	word ptr [bp+4]
	call	near ptr _SD_PlaySound
	pop	cx
	or	ax,ax
	je	short @2@74
   ;	
   ;		{
   ;			globalsoundx = gx;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	mov	word ptr DGROUP:_globalsoundx,dx
	mov	word ptr DGROUP:_globalsoundx+2,ax
   ;	
   ;			globalsoundy = gy;
   ;	
	mov	ax,word ptr [bp+12]
	mov	dx,word ptr [bp+10]
	mov	word ptr DGROUP:_globalsoundy,dx
	mov	word ptr DGROUP:_globalsoundy+2,ax
@2@74:
   ;	
   ;		}
   ;	}
   ;	
	pop	bp
	ret	
_PlaySoundLocGlobal	endp
   ;	
   ;	void UpdateSoundLoc(void)
   ;	
	assume	cs:_TEXT
_UpdateSoundLoc	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		if (SoundPositioned)
   ;	
	cmp	word ptr DGROUP:_SoundPositioned,0
	je	short @3@74
   ;	
   ;		{
   ;			SetSoundLoc(globalsoundx,globalsoundy);
   ;	
	push	word ptr DGROUP:_globalsoundy+2
	push	word ptr DGROUP:_globalsoundy
	push	word ptr DGROUP:_globalsoundx+2
	push	word ptr DGROUP:_globalsoundx
	call	near ptr _SetSoundLoc
	add	sp,8
   ;	
   ;			SD_SetPosition(leftchannel,rightchannel);
   ;	
	push	word ptr DGROUP:_rightchannel
	push	word ptr DGROUP:_leftchannel
	call	near ptr _SD_SetPosition
	pop	cx
	pop	cx
@3@74:
   ;	
   ;		}
   ;	}
   ;	
	pop	bp
	ret	
_UpdateSoundLoc	endp
   ;	
   ;	void ClearMemory (void)
   ;	
	assume	cs:_TEXT
_ClearMemory	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		PM_UnlockMainMem();
   ;	
	mov	ax,3
	push	ax
	call	near ptr _PM_SetMainMemPurge
	pop	cx
   ;	
   ;		SD_StopDigitized();
   ;	
	call	near ptr _SD_StopDigitized
   ;	
   ;		MM_SortMem ();
   ;	
	call	near ptr _MM_SortMem
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_ClearMemory	endp
   ;	
   ;	void ScanInfoPlane (void)
   ;	
	assume	cs:_TEXT
_ScanInfoPlane	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
	push	di
   ;	
   ;	{
   ;		unsigned	x,y,i,j;
   ;		int			tile;
   ;		unsigned	far	*start;
   ;	
   ;		start = mapsegs[1];
   ;	
	mov	ax,word ptr DGROUP:_mapsegs+2
	mov	word ptr [bp-6],0
	mov	word ptr [bp-4],ax
   ;	
   ;		for (y=0;y<mapheight;y++)
   ;	
	xor	di,di
	jmp	@5@2354
@5@50:
   ;	
   ;			for (x=0;x<mapwidth;x++)
   ;	
	mov	word ptr [bp-2],0
	jmp	@5@2306
@5@74:
   ;	
   ;			{
   ;				tile = *start++;
   ;	
	les	bx,dword ptr [bp-6]
	mov	si,word ptr es:[bx]
	add	word ptr [bp-6],2
   ;	
   ;				if (!tile)
   ;	
	or	si,si
	jne	short @5@122
   ;	
   ;					continue;
   ;	
	jmp	@5@2282
@5@122:
   ;	
   ;	
   ;				switch (tile)
   ;	
	mov	bx,si
	sub	bx,19
	cmp	bx,240
	jbe	@@0
	jmp	@5@2282
@@0:
	shl	bx,1
	jmp	word ptr cs:@5@C14860[bx]
@5@194:
   ;	
   ;				{
   ;				case 19:
   ;				case 20:
   ;				case 21:
   ;				case 22:
   ;					SpawnPlayer(x,y,NORTH+tile-19);
   ;	
	mov	ax,si
	add	ax,65517
	push	ax
	push	di
	push	word ptr [bp-2]
	call	near ptr _SpawnPlayer
	add	sp,6
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@218:
   ;	
   ;	
   ;				case 23:
   ;				case 24:
   ;				case 25:
   ;				case 26:
   ;				case 27:
   ;				case 28:
   ;				case 29:
   ;				case 30:
   ;	
   ;				case 31:
   ;				case 32:
   ;				case 33:
   ;				case 34:
   ;				case 35:
   ;				case 36:
   ;				case 37:
   ;				case 38:
   ;	
   ;				case 39:
   ;				case 40:
   ;				case 41:
   ;				case 42:
   ;				case 43:
   ;				case 44:
   ;				case 45:
   ;				case 46:
   ;	
   ;				case 47:
   ;				case 48:
   ;				case 49:
   ;				case 50:
   ;				case 51:
   ;				case 52:
   ;				case 53:
   ;				case 54:
   ;	
   ;				case 55:
   ;				case 56:
   ;				case 57:
   ;				case 58:
   ;				case 59:
   ;				case 60:
   ;				case 61:
   ;				case 62:
   ;	
   ;				case 63:
   ;				case 64:
   ;				case 65:
   ;				case 66:
   ;				case 67:
   ;				case 68:
   ;				case 69:
   ;				case 70:
   ;				case 71:
   ;				case 72:
   ;				case 73:						// TRUCK AND SPEAR!
   ;				case 74:
   ;	
   ;					SpawnStatic(x,y,tile-23);
   ;	
	mov	ax,si
	add	ax,65513
	push	ax
	push	di
	push	word ptr [bp-2]
	call	near ptr _SpawnStatic
	add	sp,6
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@242:
   ;	
   ;	
   ;	//
   ;	// P wall
   ;	//
   ;				case 98:
   ;					if (!loadedgame)
   ;	
	cmp	word ptr DGROUP:_loadedgame,0
	jne	short @5@290
   ;	
   ;					  gamestate.secrettotal++;
   ;	
	inc	word ptr DGROUP:_gamestate+46
@5@290:
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@314:
   ;	
   ;	
   ;	//
   ;	// guard
   ;	//
   ;				case 180:
   ;				case 181:
   ;				case 182:
   ;				case 183:
   ;					if (gamestate.difficulty<gd_hard)
   ;	
	cmp	word ptr DGROUP:_gamestate,3
	jge	short @5@362
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@362:
   ;	
   ;					tile -= 36;
   ;	
	sub	si,36
@5@386:
   ;	
   ;				case 144:
   ;				case 145:
   ;				case 146:
   ;				case 147:
   ;					if (gamestate.difficulty<gd_medium)
   ;	
	cmp	word ptr DGROUP:_gamestate,2
	jge	short @5@434
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@434:
   ;	
   ;					tile -= 36;
   ;	
	sub	si,36
@5@458:
   ;	
   ;				case 108:
   ;				case 109:
   ;				case 110:
   ;				case 111:
   ;					SpawnStand(en_guard,x,y,tile-108);
   ;	
	mov	ax,si
	add	ax,65428
	push	ax
	push	di
	push	word ptr [bp-2]
	xor	ax,ax
	push	ax
	call	near ptr _SpawnStand
	add	sp,8
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@482:
   ;	
   ;	
   ;	
   ;				case 184:
   ;				case 185:
   ;				case 186:
   ;				case 187:
   ;					if (gamestate.difficulty<gd_hard)
   ;	
	cmp	word ptr DGROUP:_gamestate,3
	jge	short @5@530
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@530:
   ;	
   ;					tile -= 36;
   ;	
	sub	si,36
@5@554:
   ;	
   ;				case 148:
   ;				case 149:
   ;				case 150:
   ;				case 151:
   ;					if (gamestate.difficulty<gd_medium)
   ;	
	cmp	word ptr DGROUP:_gamestate,2
	jge	short @5@602
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@602:
   ;	
   ;					tile -= 36;
   ;	
	sub	si,36
@5@626:
   ;	
   ;				case 112:
   ;				case 113:
   ;				case 114:
   ;				case 115:
   ;					SpawnPatrol(en_guard,x,y,tile-112);
   ;	
	mov	ax,si
	add	ax,65424
	push	ax
	push	di
	push	word ptr [bp-2]
	xor	ax,ax
	push	ax
	call	near ptr _SpawnPatrol
	add	sp,8
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@650:
   ;	
   ;	
   ;				case 124:
   ;					SpawnDeadGuard (x,y);
   ;	
	push	di
	push	word ptr [bp-2]
	call	near ptr _SpawnDeadGuard
	pop	cx
	pop	cx
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@674:
   ;	
   ;	//
   ;	// officer
   ;	//
   ;				case 188:
   ;				case 189:
   ;				case 190:
   ;				case 191:
   ;					if (gamestate.difficulty<gd_hard)
   ;	
	cmp	word ptr DGROUP:_gamestate,3
	jge	short @5@722
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@722:
   ;	
   ;					tile -= 36;
   ;	
	sub	si,36
@5@746:
   ;	
   ;				case 152:
   ;				case 153:
   ;				case 154:
   ;				case 155:
   ;					if (gamestate.difficulty<gd_medium)
   ;	
	cmp	word ptr DGROUP:_gamestate,2
	jge	short @5@794
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@794:
   ;	
   ;					tile -= 36;
   ;	
	sub	si,36
@5@818:
   ;	
   ;				case 116:
   ;				case 117:
   ;				case 118:
   ;				case 119:
   ;					SpawnStand(en_officer,x,y,tile-116);
   ;	
	mov	ax,si
	add	ax,65420
	push	ax
	push	di
	push	word ptr [bp-2]
	mov	ax,1
	push	ax
	call	near ptr _SpawnStand
	add	sp,8
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@842:
   ;	
   ;	
   ;	
   ;				case 192:
   ;				case 193:
   ;				case 194:
   ;				case 195:
   ;					if (gamestate.difficulty<gd_hard)
   ;	
	cmp	word ptr DGROUP:_gamestate,3
	jge	short @5@890
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@890:
   ;	
   ;					tile -= 36;
   ;	
	sub	si,36
@5@914:
   ;	
   ;				case 156:
   ;				case 157:
   ;				case 158:
   ;				case 159:
   ;					if (gamestate.difficulty<gd_medium)
   ;	
	cmp	word ptr DGROUP:_gamestate,2
	jge	short @5@962
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@962:
   ;	
   ;					tile -= 36;
   ;	
	sub	si,36
@5@986:
   ;	
   ;				case 120:
   ;				case 121:
   ;				case 122:
   ;				case 123:
   ;					SpawnPatrol(en_officer,x,y,tile-120);
   ;	
	mov	ax,si
	add	ax,65416
	push	ax
	push	di
	push	word ptr [bp-2]
	mov	ax,1
	push	ax
	call	near ptr _SpawnPatrol
	add	sp,8
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@1010:
   ;	
   ;	
   ;	
   ;	//
   ;	// ss
   ;	//
   ;				case 198:
   ;				case 199:
   ;				case 200:
   ;				case 201:
   ;					if (gamestate.difficulty<gd_hard)
   ;	
	cmp	word ptr DGROUP:_gamestate,3
	jge	short @5@1058
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@1058:
   ;	
   ;					tile -= 36;
   ;	
	sub	si,36
@5@1082:
   ;	
   ;				case 162:
   ;				case 163:
   ;				case 164:
   ;				case 165:
   ;					if (gamestate.difficulty<gd_medium)
   ;	
	cmp	word ptr DGROUP:_gamestate,2
	jge	short @5@1130
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@1130:
   ;	
   ;					tile -= 36;
   ;	
	sub	si,36
@5@1154:
   ;	
   ;				case 126:
   ;				case 127:
   ;				case 128:
   ;				case 129:
   ;					SpawnStand(en_ss,x,y,tile-126);
   ;	
	mov	ax,si
	add	ax,65410
	push	ax
	push	di
	push	word ptr [bp-2]
	mov	ax,2
	push	ax
	call	near ptr _SpawnStand
	add	sp,8
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@1178:
   ;	
   ;	
   ;	
   ;				case 202:
   ;				case 203:
   ;				case 204:
   ;				case 205:
   ;					if (gamestate.difficulty<gd_hard)
   ;	
	cmp	word ptr DGROUP:_gamestate,3
	jge	short @5@1226
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@1226:
   ;	
   ;					tile -= 36;
   ;	
	sub	si,36
@5@1250:
   ;	
   ;				case 166:
   ;				case 167:
   ;				case 168:
   ;				case 169:
   ;					if (gamestate.difficulty<gd_medium)
   ;	
	cmp	word ptr DGROUP:_gamestate,2
	jge	short @5@1298
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@1298:
   ;	
   ;					tile -= 36;
   ;	
	sub	si,36
@5@1322:
   ;	
   ;				case 130:
   ;				case 131:
   ;				case 132:
   ;				case 133:
   ;					SpawnPatrol(en_ss,x,y,tile-130);
   ;	
	mov	ax,si
	add	ax,65406
	push	ax
	push	di
	push	word ptr [bp-2]
	mov	ax,2
	push	ax
	call	near ptr _SpawnPatrol
	add	sp,8
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@1346:
   ;	
   ;	
   ;	//
   ;	// dogs
   ;	//
   ;				case 206:
   ;				case 207:
   ;				case 208:
   ;				case 209:
   ;					if (gamestate.difficulty<gd_hard)
   ;	
	cmp	word ptr DGROUP:_gamestate,3
	jge	short @5@1394
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@1394:
   ;	
   ;					tile -= 36;
   ;	
	sub	si,36
@5@1418:
   ;	
   ;				case 170:
   ;				case 171:
   ;				case 172:
   ;				case 173:
   ;					if (gamestate.difficulty<gd_medium)
   ;	
	cmp	word ptr DGROUP:_gamestate,2
	jge	short @5@1466
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@1466:
   ;	
   ;					tile -= 36;
   ;	
	sub	si,36
@5@1490:
   ;	
   ;				case 134:
   ;				case 135:
   ;				case 136:
   ;				case 137:
   ;					SpawnStand(en_dog,x,y,tile-134);
   ;	
	mov	ax,si
	add	ax,65402
	push	ax
	push	di
	push	word ptr [bp-2]
	mov	ax,3
	push	ax
	call	near ptr _SpawnStand
	add	sp,8
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@1514:
   ;	
   ;	
   ;	
   ;				case 210:
   ;				case 211:
   ;				case 212:
   ;				case 213:
   ;					if (gamestate.difficulty<gd_hard)
   ;	
	cmp	word ptr DGROUP:_gamestate,3
	jge	short @5@1562
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@1562:
   ;	
   ;					tile -= 36;
   ;	
	sub	si,36
@5@1586:
   ;	
   ;				case 174:
   ;				case 175:
   ;				case 176:
   ;				case 177:
   ;					if (gamestate.difficulty<gd_medium)
   ;	
	cmp	word ptr DGROUP:_gamestate,2
	jge	short @5@1634
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@1634:
   ;	
   ;					tile -= 36;
   ;	
	sub	si,36
@5@1658:
   ;	
   ;				case 138:
   ;				case 139:
   ;				case 140:
   ;				case 141:
   ;					SpawnPatrol(en_dog,x,y,tile-138);
   ;	
	mov	ax,si
	add	ax,65398
	push	ax
	push	di
	push	word ptr [bp-2]
	mov	ax,3
	push	ax
	call	near ptr _SpawnPatrol
	add	sp,8
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@1682:
   ;	
   ;	
   ;	//
   ;	// boss
   ;	//
   ;	#ifndef SPEAR
   ;				case 214:
   ;					SpawnBoss (x,y);
   ;	
	push	di
	push	word ptr [bp-2]
	call	near ptr _SpawnBoss
	pop	cx
	pop	cx
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@1706:
   ;	
   ;				case 197:
   ;					SpawnGretel (x,y);
   ;	
	push	di
	push	word ptr [bp-2]
	call	near ptr _SpawnGretel
	pop	cx
	pop	cx
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@1730:
   ;	
   ;				case 215:
   ;					SpawnGift (x,y);
   ;	
	push	di
	push	word ptr [bp-2]
	call	near ptr _SpawnGift
	pop	cx
	pop	cx
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@1754:
   ;	
   ;				case 179:
   ;					SpawnFat (x,y);
   ;	
	push	di
	push	word ptr [bp-2]
	call	near ptr _SpawnFat
	pop	cx
	pop	cx
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@1778:
   ;	
   ;				case 196:
   ;					SpawnSchabbs (x,y);
   ;	
	push	di
	push	word ptr [bp-2]
	call	near ptr _SpawnSchabbs
	pop	cx
	pop	cx
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@1802:
   ;	
   ;				case 160:
   ;					SpawnFakeHitler (x,y);
   ;	
	push	di
	push	word ptr [bp-2]
	call	near ptr _SpawnFakeHitler
	pop	cx
	pop	cx
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@1826:
   ;	
   ;				case 178:
   ;					SpawnHitler (x,y);
   ;	
	push	di
	push	word ptr [bp-2]
	call	near ptr _SpawnHitler
	pop	cx
	pop	cx
   ;	
   ;					break;
   ;	
	jmp	@5@2282
@5@1850:
   ;	
   ;	#else
   ;				case 106:
   ;					SpawnSpectre (x,y);
   ;					break;
   ;				case 107:
   ;					SpawnAngel (x,y);
   ;					break;
   ;				case 125:
   ;					SpawnTrans (x,y);
   ;					break;
   ;				case 142:
   ;					SpawnUber (x,y);
   ;					break;
   ;				case 143:
   ;					SpawnWill (x,y);
   ;					break;
   ;				case 161:
   ;					SpawnDeath (x,y);
   ;					break;
   ;	
   ;	#endif
   ;	
   ;	//
   ;	// mutants
   ;	//
   ;				case 252:
   ;				case 253:
   ;				case 254:
   ;				case 255:
   ;					if (gamestate.difficulty<gd_hard)
   ;	
	cmp	word ptr DGROUP:_gamestate,3
	jge	short @5@1898
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@1898:
   ;	
   ;					tile -= 18;
   ;	
	sub	si,18
@5@1922:
   ;	
   ;				case 234:
   ;				case 235:
   ;				case 236:
   ;				case 237:
   ;					if (gamestate.difficulty<gd_medium)
   ;	
	cmp	word ptr DGROUP:_gamestate,2
	jge	short @5@1970
   ;	
   ;						break;
   ;	
	jmp	@5@2282
@5@1970:
   ;	
   ;					tile -= 18;
   ;	
	sub	si,18
@5@1994:
   ;	
   ;				case 216:
   ;				case 217:
   ;				case 218:
   ;				case 219:
   ;					SpawnStand(en_mutant,x,y,tile-216);
   ;	
	mov	ax,si
	add	ax,65320
	push	ax
	push	di
	push	word ptr [bp-2]
	mov	ax,8
	push	ax
	call	near ptr _SpawnStand
	add	sp,8
   ;	
   ;					break;
   ;	
	jmp	short @5@2282
@5@2018:
   ;	
   ;	
   ;				case 256:
   ;				case 257:
   ;				case 258:
   ;				case 259:
   ;					if (gamestate.difficulty<gd_hard)
   ;	
	cmp	word ptr DGROUP:_gamestate,3
	jge	short @5@2066
   ;	
   ;						break;
   ;	
	jmp	short @5@2282
@5@2066:
   ;	
   ;					tile -= 18;
   ;	
	sub	si,18
@5@2090:
   ;	
   ;				case 238:
   ;				case 239:
   ;				case 240:
   ;				case 241:
   ;					if (gamestate.difficulty<gd_medium)
   ;	
	cmp	word ptr DGROUP:_gamestate,2
	jge	short @5@2138
   ;	
   ;						break;
   ;	
	jmp	short @5@2282
@5@2138:
   ;	
   ;					tile -= 18;
   ;	
	sub	si,18
@5@2162:
   ;	
   ;				case 220:
   ;				case 221:
   ;				case 222:
   ;				case 223:
   ;					SpawnPatrol(en_mutant,x,y,tile-220);
   ;	
	mov	ax,si
	add	ax,65316
	push	ax
	push	di
	push	word ptr [bp-2]
	mov	ax,8
	push	ax
	call	near ptr _SpawnPatrol
	add	sp,8
   ;	
   ;					break;
   ;	
	jmp	short @5@2282
@5@2186:
   ;	
   ;	
   ;	//
   ;	// ghosts
   ;	//
   ;	#ifndef SPEAR
   ;				case 224:
   ;					SpawnGhosts (en_blinky,x,y);
   ;	
	push	di
	push	word ptr [bp-2]
	mov	ax,9
	push	ax
	call	near ptr _SpawnGhosts
	add	sp,6
   ;	
   ;					break;
   ;	
	jmp	short @5@2282
@5@2210:
   ;	
   ;				case 225:
   ;					SpawnGhosts (en_clyde,x,y);
   ;	
	push	di
	push	word ptr [bp-2]
	mov	ax,10
	push	ax
	call	near ptr _SpawnGhosts
	add	sp,6
   ;	
   ;					break;
   ;	
	jmp	short @5@2282
@5@2234:
   ;	
   ;				case 226:
   ;					SpawnGhosts (en_pinky,x,y);
   ;	
	push	di
	push	word ptr [bp-2]
	mov	ax,11
	push	ax
	call	near ptr _SpawnGhosts
	add	sp,6
   ;	
   ;					break;
   ;	
	jmp	short @5@2282
@5@2258:
   ;	
   ;				case 227:
   ;					SpawnGhosts (en_inky,x,y);
   ;	
	push	di
	push	word ptr [bp-2]
	mov	ax,12
	push	ax
	call	near ptr _SpawnGhosts
	add	sp,6
   ;	
   ;					break;
   ;	
	jmp	short @5@2282
@5@2282:
	inc	word ptr [bp-2]
@5@2306:
	mov	ax,word ptr [bp-2]
	cmp	ax,word ptr DGROUP:_mapwidth
	jae	@@1
	jmp	@5@74
@@1:
	inc	di
@5@2354:
	cmp	di,word ptr DGROUP:_mapheight
	jae	@@2
	jmp	@5@50
@@2:
   ;	
   ;	#endif
   ;				}
   ;	
   ;			}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_ScanInfoPlane	endp
@5@C14860	label	word
	dw	@5@194
	dw	@5@194
	dw	@5@194
	dw	@5@194
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@218
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@242
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@458
	dw	@5@458
	dw	@5@458
	dw	@5@458
	dw	@5@626
	dw	@5@626
	dw	@5@626
	dw	@5@626
	dw	@5@818
	dw	@5@818
	dw	@5@818
	dw	@5@818
	dw	@5@986
	dw	@5@986
	dw	@5@986
	dw	@5@986
	dw	@5@650
	dw	@5@2282
	dw	@5@1154
	dw	@5@1154
	dw	@5@1154
	dw	@5@1154
	dw	@5@1322
	dw	@5@1322
	dw	@5@1322
	dw	@5@1322
	dw	@5@1490
	dw	@5@1490
	dw	@5@1490
	dw	@5@1490
	dw	@5@1658
	dw	@5@1658
	dw	@5@1658
	dw	@5@1658
	dw	@5@2282
	dw	@5@2282
	dw	@5@386
	dw	@5@386
	dw	@5@386
	dw	@5@386
	dw	@5@554
	dw	@5@554
	dw	@5@554
	dw	@5@554
	dw	@5@746
	dw	@5@746
	dw	@5@746
	dw	@5@746
	dw	@5@914
	dw	@5@914
	dw	@5@914
	dw	@5@914
	dw	@5@1802
	dw	@5@2282
	dw	@5@1082
	dw	@5@1082
	dw	@5@1082
	dw	@5@1082
	dw	@5@1250
	dw	@5@1250
	dw	@5@1250
	dw	@5@1250
	dw	@5@1418
	dw	@5@1418
	dw	@5@1418
	dw	@5@1418
	dw	@5@1586
	dw	@5@1586
	dw	@5@1586
	dw	@5@1586
	dw	@5@1826
	dw	@5@1754
	dw	@5@314
	dw	@5@314
	dw	@5@314
	dw	@5@314
	dw	@5@482
	dw	@5@482
	dw	@5@482
	dw	@5@482
	dw	@5@674
	dw	@5@674
	dw	@5@674
	dw	@5@674
	dw	@5@842
	dw	@5@842
	dw	@5@842
	dw	@5@842
	dw	@5@1778
	dw	@5@1706
	dw	@5@1010
	dw	@5@1010
	dw	@5@1010
	dw	@5@1010
	dw	@5@1178
	dw	@5@1178
	dw	@5@1178
	dw	@5@1178
	dw	@5@1346
	dw	@5@1346
	dw	@5@1346
	dw	@5@1346
	dw	@5@1514
	dw	@5@1514
	dw	@5@1514
	dw	@5@1514
	dw	@5@1682
	dw	@5@1730
	dw	@5@1994
	dw	@5@1994
	dw	@5@1994
	dw	@5@1994
	dw	@5@2162
	dw	@5@2162
	dw	@5@2162
	dw	@5@2162
	dw	@5@2186
	dw	@5@2210
	dw	@5@2234
	dw	@5@2258
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@1922
	dw	@5@1922
	dw	@5@1922
	dw	@5@1922
	dw	@5@2090
	dw	@5@2090
	dw	@5@2090
	dw	@5@2090
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@2282
	dw	@5@1850
	dw	@5@1850
	dw	@5@1850
	dw	@5@1850
	dw	@5@2018
	dw	@5@2018
	dw	@5@2018
	dw	@5@2018
   ;	
   ;	void SetupGameLevel (void)
   ;	
	assume	cs:_TEXT
_SetupGameLevel	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
	push	di
   ;	
   ;	{
   ;		int	x,y,i;
   ;		unsigned	far *map,tile,spot;
   ;	
   ;	
   ;		if (!loadedgame)
   ;	
	cmp	word ptr DGROUP:_loadedgame,0
	jne	short @6@74
   ;	
   ;		{
   ;		 gamestate.TimeCount=
   ;	
   ;	
   ;		 gamestate.secrettotal=
   ;		 gamestate.killtotal=
   ;		 gamestate.treasuretotal=
   ;		 gamestate.secretcount=
   ;		 gamestate.killcount=
   ;		 gamestate.treasurecount=0;
   ;	
	xor	ax,ax
	mov	word ptr DGROUP:_gamestate+42,ax
	mov	word ptr DGROUP:_gamestate+44,ax
	mov	word ptr DGROUP:_gamestate+40,ax
	mov	word ptr DGROUP:_gamestate+48,ax
	mov	word ptr DGROUP:_gamestate+50,ax
	mov	word ptr DGROUP:_gamestate+46,ax
	cwd	
	mov	word ptr DGROUP:_gamestate+52,ax
	mov	word ptr DGROUP:_gamestate+54,dx
@6@74:
   ;	
   ;		}
   ;	
   ;		if (demoplayback || demorecord)
   ;	
	cmp	word ptr DGROUP:_demoplayback,0
	jne	short @6@122
	cmp	word ptr DGROUP:_demorecord,0
	je	short @6@146
@6@122:
   ;	
   ;			US_InitRndT (false);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _US_InitRndT
	pop	cx
	jmp	short @6@170
@6@146:
   ;	
   ;		else
   ;			US_InitRndT (true);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _US_InitRndT
	pop	cx
@6@170:
   ;	
   ;	
   ;	//
   ;	// load the level
   ;	//
   ;		CA_CacheMap (gamestate.mapon+10*gamestate.episode);
   ;	
	mov	ax,word ptr DGROUP:_gamestate+38
	mov	dx,10
	imul	dx
	mov	dx,word ptr DGROUP:_gamestate+2
	add	dx,ax
	push	dx
	call	near ptr _CA_CacheMap
	pop	cx
   ;	
   ;		mapon-=gamestate.episode*10;
   ;	
	mov	ax,word ptr DGROUP:_gamestate+38
	mov	dx,10
	imul	dx
	sub	word ptr DGROUP:_mapon,ax
   ;	
   ;	
   ;		mapwidth = mapheaderseg[mapon]->width;
   ;	
	mov	bx,word ptr DGROUP:_mapon
	shl	bx,1
	mov	es,word ptr DGROUP:_mapheaderseg[bx]
	mov	ax,word ptr es:[18]
	mov	word ptr DGROUP:_mapwidth,ax
   ;	
   ;		mapheight = mapheaderseg[mapon]->height;
   ;	
	mov	bx,word ptr DGROUP:_mapon
	shl	bx,1
	mov	es,word ptr DGROUP:_mapheaderseg[bx]
	mov	ax,word ptr es:[20]
	mov	word ptr DGROUP:_mapheight,ax
   ;	
   ;	
   ;		if (mapwidth != 64 || mapheight != 64)
   ;	
	cmp	word ptr DGROUP:_mapwidth,64
	jne	short @6@218
	cmp	word ptr DGROUP:_mapheight,64
	je	short @6@242
@6@218:
   ;	
   ;			Quit ("Map not 64*64!");
   ;	
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _Quit
	pop	cx
@6@242:
   ;	
   ;	
   ;	
   ;	//
   ;	// copy the wall data to a data segment array
   ;	//
   ;		memset (tilemap,0,sizeof(tilemap));
   ;	
	mov	ax,4096
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_tilemap
	push	ax
	call	near ptr _memset
	add	sp,6
   ;	
   ;		memset (actorat,0,sizeof(actorat));
   ;	
	mov	ax,8192
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_actorat
	push	ax
	call	near ptr _memset
	add	sp,6
   ;	
   ;		map = mapsegs[0];
   ;	
	mov	ax,word ptr DGROUP:_mapsegs
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],ax
   ;	
   ;		for (y=0;y<mapheight;y++)
   ;	
	xor	si,si
	jmp	short @6@434
@6@266:
   ;	
   ;			for (x=0;x<mapwidth;x++)
   ;	
	xor	di,di
	jmp	short @6@386
@6@290:
   ;	
   ;			{
   ;				tile = *map++;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-6],ax
	add	word ptr [bp-4],2
   ;	
   ;				if (tile<AREATILE)
   ;	
	cmp	word ptr [bp-6],107
	jae	short @6@338
   ;	
   ;				{
   ;				// solid wall
   ;					tilemap[x][y] = tile;
   ;	
	mov	bx,di
	mov	cl,6
	shl	bx,cl
	mov	al,byte ptr [bp-6]
	mov	byte ptr DGROUP:_tilemap[bx+si],al
   ;	
   ;					(unsigned)actorat[x][y] = tile;
   ;	
	mov	bx,di
	mov	cl,7
	shl	bx,cl
	mov	ax,si
	shl	ax,1
	add	bx,ax
	mov	ax,word ptr [bp-6]
	mov	word ptr DGROUP:_actorat[bx],ax
   ;	
   ;				}
   ;	
	jmp	short @6@362
@6@338:
   ;	
   ;				else
   ;				{
   ;				// area floor
   ;					tilemap[x][y] = 0;
   ;	
	mov	bx,di
	mov	cl,6
	shl	bx,cl
	mov	byte ptr DGROUP:_tilemap[bx+si],0
   ;	
   ;					(unsigned)actorat[x][y] = 0;
   ;	
	mov	bx,di
	mov	cl,7
	shl	bx,cl
	mov	ax,si
	shl	ax,1
	add	bx,ax
	mov	word ptr DGROUP:_actorat[bx],0
@6@362:
	inc	di
@6@386:
	cmp	di,word ptr DGROUP:_mapwidth
	jb	short @6@290
	inc	si
@6@434:
	cmp	si,word ptr DGROUP:_mapheight
	jb	short @6@266
   ;	
   ;				}
   ;			}
   ;	
   ;	//
   ;	// spawn doors
   ;	//
   ;		InitActorList ();			// start spawning things with a clean slate
   ;	
	call	near ptr _InitActorList
   ;	
   ;		InitDoorList ();
   ;	
	call	near ptr _InitDoorList
   ;	
   ;		InitStaticList ();
   ;	
	call	near ptr _InitStaticList
   ;	
   ;	
   ;		map = mapsegs[0];
   ;	
	mov	ax,word ptr DGROUP:_mapsegs
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],ax
   ;	
   ;		for (y=0;y<mapheight;y++)
   ;	
	xor	si,si
	jmp	short @6@746
@6@482:
   ;	
   ;			for (x=0;x<mapwidth;x++)
   ;	
	xor	di,di
	jmp	short @6@698
@6@506:
   ;	
   ;			{
   ;				tile = *map++;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-6],ax
	add	word ptr [bp-4],2
   ;	
   ;				if (tile >= 90 && tile <= 101)
   ;	
	cmp	word ptr [bp-6],90
	jb	short @6@674
	cmp	word ptr [bp-6],101
	ja	short @6@674
   ;	
   ;				{
   ;				// door
   ;					switch (tile)
   ;	
	mov	bx,word ptr [bp-6]
	sub	bx,90
	cmp	bx,11
	ja	short @6@674
	shl	bx,1
	jmp	word ptr cs:@6@C4924[bx]
@6@626:
   ;	
   ;					{
   ;					case 90:
   ;					case 92:
   ;					case 94:
   ;					case 96:
   ;					case 98:
   ;					case 100:
   ;						SpawnDoor (x,y,1,(tile-90)/2);
   ;	
	mov	ax,word ptr [bp-6]
	sub	ax,90
	shr	ax,1
	push	ax
	mov	ax,1
	push	ax
	push	si
	push	di
	call	near ptr _SpawnDoor
	add	sp,8
   ;	
   ;						break;
   ;	
	jmp	short @6@674
@6@650:
   ;	
   ;					case 91:
   ;					case 93:
   ;					case 95:
   ;					case 97:
   ;					case 99:
   ;					case 101:
   ;						SpawnDoor (x,y,0,(tile-91)/2);
   ;	
	mov	ax,word ptr [bp-6]
	sub	ax,91
	shr	ax,1
	push	ax
	xor	ax,ax
	push	ax
	push	si
	push	di
	call	near ptr _SpawnDoor
	add	sp,8
   ;	
   ;						break;
   ;	
	jmp	short @6@674
@6@674:
	inc	di
@6@698:
	cmp	di,word ptr DGROUP:_mapwidth
	jb	short @6@506
	inc	si
@6@746:
	cmp	si,word ptr DGROUP:_mapheight
	jb	short @6@482
   ;	
   ;					}
   ;				}
   ;			}
   ;	
   ;	//
   ;	// spawn actors
   ;	//
   ;		ScanInfoPlane ();
   ;	
	call	near ptr _ScanInfoPlane
   ;	
   ;	
   ;	//
   ;	// take out the ambush markers
   ;	//
   ;		map = mapsegs[0];
   ;	
	mov	ax,word ptr DGROUP:_mapsegs
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],ax
   ;	
   ;		for (y=0;y<mapheight;y++)
   ;	
	xor	si,si
	jmp	@6@1178
@6@794:
   ;	
   ;			for (x=0;x<mapwidth;x++)
   ;	
	xor	di,di
	jmp	@6@1130
@6@818:
   ;	
   ;			{
   ;				tile = *map++;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-6],ax
	add	word ptr [bp-4],2
   ;	
   ;				if (tile == AMBUSHTILE)
   ;	
	cmp	word ptr [bp-6],106
	je	@@3
	jmp	@6@1106
@@3:
   ;	
   ;				{
   ;					tilemap[x][y] = 0;
   ;	
	mov	bx,di
	mov	cl,6
	shl	bx,cl
	mov	byte ptr DGROUP:_tilemap[bx+si],0
   ;	
   ;					if ( (unsigned)actorat[x][y] == AMBUSHTILE)
   ;	
	mov	bx,di
	mov	cl,7
	shl	bx,cl
	mov	ax,si
	shl	ax,1
	add	bx,ax
	cmp	word ptr DGROUP:_actorat[bx],106
	jne	short @6@890
   ;	
   ;						actorat[x][y] = NULL;
   ;	
	mov	bx,di
	mov	cl,7
	shl	bx,cl
	mov	ax,si
	shl	ax,1
	add	bx,ax
	mov	word ptr DGROUP:_actorat[bx],0
@6@890:
   ;	
   ;	
   ;					if (*map >= AREATILE)
   ;	
	les	bx,dword ptr [bp-4]
	cmp	word ptr es:[bx],107
	jb	short @6@938
   ;	
   ;						tile = *map;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-6],ax
@6@938:
   ;	
   ;					if (*(map-1-mapwidth) >= AREATILE)
   ;	
	les	bx,dword ptr [bp-4]
	add	bx,65534
	mov	ax,word ptr DGROUP:_mapwidth
	shl	ax,1
	sub	bx,ax
	cmp	word ptr es:[bx],107
	jb	short @6@986
   ;	
   ;						tile = *(map-1-mapwidth);
   ;	
	les	bx,dword ptr [bp-4]
	add	bx,65534
	mov	ax,word ptr DGROUP:_mapwidth
	shl	ax,1
	sub	bx,ax
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-6],ax
@6@986:
   ;	
   ;					if (*(map-1+mapwidth) >= AREATILE)
   ;	
	mov	ax,word ptr DGROUP:_mapwidth
	shl	ax,1
	les	bx,dword ptr [bp-4]
	add	bx,ax
	cmp	word ptr es:[bx-2],107
	jb	short @6@1034
   ;	
   ;						tile = *(map-1+mapwidth);
   ;	
	mov	ax,word ptr DGROUP:_mapwidth
	shl	ax,1
	les	bx,dword ptr [bp-4]
	add	bx,ax
	mov	ax,word ptr es:[bx-2]
	mov	word ptr [bp-6],ax
@6@1034:
   ;	
   ;					if ( *(map-2) >= AREATILE)
   ;	
	les	bx,dword ptr [bp-4]
	cmp	word ptr es:[bx-4],107
	jb	short @6@1082
   ;	
   ;						tile = *(map-2);
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx-4]
	mov	word ptr [bp-6],ax
@6@1082:
   ;	
   ;	
   ;					*(map-1) = tile;
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr [bp-6]
	mov	word ptr es:[bx-2],ax
@6@1106:
	inc	di
@6@1130:
	cmp	di,word ptr DGROUP:_mapwidth
	jae	@@4
	jmp	@6@818
@@4:
	inc	si
@6@1178:
	cmp	si,word ptr DGROUP:_mapheight
	jae	@@5
	jmp	@6@794
@@5:
   ;	
   ;				}
   ;			}
   ;	
   ;	
   ;	
   ;	//
   ;	// have the caching manager load and purge stuff to make sure all marks
   ;	// are in memory
   ;	//
   ;		CA_LoadAllSounds ();
   ;	
	call	near ptr _CA_LoadAllSounds
   ;	
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_SetupGameLevel	endp
@6@C4924	label	word
	dw	@6@626
	dw	@6@650
	dw	@6@626
	dw	@6@650
	dw	@6@626
	dw	@6@650
	dw	@6@626
	dw	@6@650
	dw	@6@626
	dw	@6@650
	dw	@6@626
	dw	@6@650
   ;	
   ;	void DrawPlayBorderSides (void)
   ;	
	assume	cs:_TEXT
_DrawPlayBorderSides	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		int	xl,yl;
   ;	
   ;		xl = 160-viewwidth/2;
   ;	
	mov	ax,word ptr DGROUP:_viewwidth
	mov	bx,2
	cwd	
	idiv	bx
	mov	dx,160
	sub	dx,ax
	mov	si,dx
   ;	
   ;		yl = (200-STATUSLINES-viewheight)/2;
   ;	
	mov	ax,160
	sub	ax,word ptr DGROUP:_viewheight
	mov	bx,2
	cwd	
	idiv	bx
	mov	di,ax
   ;	
   ;	
   ;		VWB_Bar (0,0,xl-1,200-STATUSLINES,127);
   ;	
	mov	ax,127
	push	ax
	mov	ax,160
	push	ax
	mov	ax,si
	dec	ax
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;		VWB_Bar (xl+viewwidth+1,0,xl-2,200-STATUSLINES,127);
   ;	
	mov	ax,127
	push	ax
	mov	ax,160
	push	ax
	mov	ax,si
	add	ax,65534
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,si
	add	ax,word ptr DGROUP:_viewwidth
	inc	ax
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;	
   ;		VWB_Vlin (yl-1,yl+viewheight,xl-1,0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,si
	dec	ax
	push	ax
	mov	ax,di
	add	ax,word ptr DGROUP:_viewheight
	push	ax
	mov	ax,di
	dec	ax
	push	ax
	call	near ptr _VWB_Vlin
	add	sp,8
   ;	
   ;		VWB_Vlin (yl-1,yl+viewheight,xl+viewwidth,125);
   ;	
	mov	ax,125
	push	ax
	mov	ax,si
	add	ax,word ptr DGROUP:_viewwidth
	push	ax
	mov	ax,di
	add	ax,word ptr DGROUP:_viewheight
	push	ax
	mov	ax,di
	dec	ax
	push	ax
	call	near ptr _VWB_Vlin
	add	sp,8
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_DrawPlayBorderSides	endp
   ;	
   ;	void DrawAllPlayBorderSides (void)
   ;	
	assume	cs:_TEXT
_DrawAllPlayBorderSides	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		unsigned	i,temp;
   ;	
   ;		temp = bufferofs;
   ;	
	mov	di,word ptr DGROUP:_bufferofs
   ;	
   ;		for (i=0;i<3;i++)
   ;	
	xor	si,si
	jmp	short @8@98
@8@50:
   ;	
   ;		{
   ;			bufferofs = screenloc[i];
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr DGROUP:_screenloc[bx]
	mov	word ptr DGROUP:_bufferofs,ax
   ;	
   ;			DrawPlayBorderSides ();
   ;	
	call	near ptr _DrawPlayBorderSides
	inc	si
@8@98:
	cmp	si,3
	jb	short @8@50
   ;	
   ;		}
   ;		bufferofs = temp;
   ;	
	mov	word ptr DGROUP:_bufferofs,di
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_DrawAllPlayBorderSides	endp
   ;	
   ;	void DrawAllPlayBorder (void)
   ;	
	assume	cs:_TEXT
_DrawAllPlayBorder	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		unsigned	i,temp;
   ;	
   ;		temp = bufferofs;
   ;	
	mov	di,word ptr DGROUP:_bufferofs
   ;	
   ;		for (i=0;i<3;i++)
   ;	
	xor	si,si
	jmp	short @9@98
@9@50:
   ;	
   ;		{
   ;			bufferofs = screenloc[i];
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr DGROUP:_screenloc[bx]
	mov	word ptr DGROUP:_bufferofs,ax
   ;	
   ;			DrawPlayBorder ();
   ;	
	call	near ptr _DrawPlayBorder
	inc	si
@9@98:
	cmp	si,3
	jb	short @9@50
   ;	
   ;		}
   ;		bufferofs = temp;
   ;	
	mov	word ptr DGROUP:_bufferofs,di
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_DrawAllPlayBorder	endp
   ;	
   ;	void DrawPlayBorder (void)
   ;	
	assume	cs:_TEXT
_DrawPlayBorder	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		int	xl,yl;
   ;	
   ;		VWB_Bar (0,0,320,200-STATUSLINES,127);
   ;	
	mov	ax,127
	push	ax
	mov	ax,160
	push	ax
	mov	ax,320
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;	
   ;		xl = 160-viewwidth/2;
   ;	
	mov	ax,word ptr DGROUP:_viewwidth
	mov	bx,2
	cwd	
	idiv	bx
	mov	dx,160
	sub	dx,ax
	mov	di,dx
   ;	
   ;		yl = (200-STATUSLINES-viewheight)/2;
   ;	
	mov	ax,160
	sub	ax,word ptr DGROUP:_viewheight
	mov	bx,2
	cwd	
	idiv	bx
	mov	si,ax
   ;	
   ;		VWB_Bar (xl,yl,viewwidth,viewheight,0);
   ;	
	xor	ax,ax
	push	ax
	push	word ptr DGROUP:_viewheight
	push	word ptr DGROUP:_viewwidth
	push	si
	push	di
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;	
   ;		VWB_Hlin (xl-1,xl+viewwidth,yl-1,0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,si
	dec	ax
	push	ax
	mov	ax,di
	add	ax,word ptr DGROUP:_viewwidth
	push	ax
	mov	ax,di
	dec	ax
	push	ax
	call	near ptr _VWB_Hlin
	add	sp,8
   ;	
   ;		VWB_Hlin (xl-1,xl+viewwidth,yl+viewheight,125);
   ;	
	mov	ax,125
	push	ax
	mov	ax,si
	add	ax,word ptr DGROUP:_viewheight
	push	ax
	mov	ax,di
	add	ax,word ptr DGROUP:_viewwidth
	push	ax
	mov	ax,di
	dec	ax
	push	ax
	call	near ptr _VWB_Hlin
	add	sp,8
   ;	
   ;		VWB_Vlin (yl-1,yl+viewheight,xl-1,0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,di
	dec	ax
	push	ax
	mov	ax,si
	add	ax,word ptr DGROUP:_viewheight
	push	ax
	mov	ax,si
	dec	ax
	push	ax
	call	near ptr _VWB_Vlin
	add	sp,8
   ;	
   ;		VWB_Vlin (yl-1,yl+viewheight,xl+viewwidth,125);
   ;	
	mov	ax,125
	push	ax
	mov	ax,di
	add	ax,word ptr DGROUP:_viewwidth
	push	ax
	mov	ax,si
	add	ax,word ptr DGROUP:_viewheight
	push	ax
	mov	ax,si
	dec	ax
	push	ax
	call	near ptr _VWB_Vlin
	add	sp,8
   ;	
   ;		VWB_Plot (xl-1,yl+viewheight,124);
   ;	
	mov	ax,124
	push	ax
	mov	ax,si
	add	ax,word ptr DGROUP:_viewheight
	push	ax
	mov	ax,di
	dec	ax
	push	ax
	call	near ptr _VWB_Plot
	add	sp,6
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_DrawPlayBorder	endp
   ;	
   ;	void DrawPlayScreen (void)
   ;	
	assume	cs:_TEXT
_DrawPlayScreen	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		int	i,j,p,m;
   ;		unsigned	temp;
   ;	
   ;		VW_FadeOut ();
   ;	
	mov	ax,30
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	
   ;		temp = bufferofs;
   ;	
	mov	di,word ptr DGROUP:_bufferofs
   ;	
   ;	
   ;		CA_CacheGrChunk (STATUSBARPIC);
   ;	
	mov	ax,86
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;	
   ;		for (i=0;i<3;i++)
   ;	
	xor	si,si
	jmp	short @11@98
@11@50:
   ;	
   ;		{
   ;			bufferofs = screenloc[i];
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr DGROUP:_screenloc[bx]
	mov	word ptr DGROUP:_bufferofs,ax
   ;	
   ;			DrawPlayBorder ();
   ;	
	call	near ptr _DrawPlayBorder
   ;	
   ;			VWB_DrawPic (0,200-STATUSLINES,STATUSBARPIC);
   ;	
	mov	ax,86
	push	ax
	mov	ax,160
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
	inc	si
@11@98:
	cmp	si,3
	jl	short @11@50
   ;	
   ;		}
   ;	
   ;		bufferofs = temp;
   ;	
	mov	word ptr DGROUP:_bufferofs,di
   ;	
   ;	
   ;		UNCACHEGRCHUNK (STATUSBARPIC);
   ;	
	mov	ax,offset DGROUP:_grsegs+172
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded+86
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded+86,al
   ;	
   ;	
   ;		DrawFace ();
   ;	
	call	near ptr _DrawFace
   ;	
   ;		DrawHealth ();
   ;	
	call	near ptr _DrawHealth
   ;	
   ;		DrawLives ();
   ;	
	call	near ptr _DrawLives
   ;	
   ;		DrawLevel ();
   ;	
	call	near ptr _DrawLevel
   ;	
   ;		DrawAmmo ();
   ;	
	call	near ptr _DrawAmmo
   ;	
   ;		DrawKeys ();
   ;	
	call	near ptr _DrawKeys
   ;	
   ;		DrawWeapon ();
   ;	
	call	near ptr _DrawWeapon
   ;	
   ;		DrawScore ();
   ;	
	call	near ptr _DrawScore
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_DrawPlayScreen	endp
   ;	
   ;	void StartDemoRecord (int levelnumber)
   ;	
	assume	cs:_TEXT
_StartDemoRecord	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		MM_GetPtr (&demobuffer,MAXDEMOSIZE);
   ;	
	xor	ax,ax
	mov	dx,8192
	push	ax
	push	dx
	mov	ax,offset DGROUP:_demobuffer
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;		MM_SetLock (&demobuffer,true);
   ;	
	mov	ax,1
	push	ax
	mov	ax,offset DGROUP:_demobuffer
	push	ax
	call	near ptr _MM_SetLock
	pop	cx
	pop	cx
   ;	
   ;		demoptr = (char far *)demobuffer;
   ;	
	mov	ax,word ptr DGROUP:_demobuffer
	mov	word ptr DGROUP:_demoptr,0
	mov	word ptr DGROUP:_demoptr+2,ax
   ;	
   ;		lastdemoptr = demoptr+MAXDEMOSIZE;
   ;	
	mov	ax,word ptr DGROUP:_demoptr+2
	mov	dx,word ptr DGROUP:_demoptr
	add	dx,8192
	mov	word ptr DGROUP:_lastdemoptr,dx
	mov	word ptr DGROUP:_lastdemoptr+2,ax
   ;	
   ;	
   ;		*demoptr = levelnumber;
   ;	
	les	bx,dword ptr DGROUP:_demoptr
	mov	al,byte ptr [bp+4]
	mov	byte ptr es:[bx],al
   ;	
   ;		demoptr += 4;				// leave space for length
   ;	
	add	word ptr DGROUP:_demoptr,4
   ;	
   ;		demorecord = true;
   ;	
	mov	word ptr DGROUP:_demorecord,1
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_StartDemoRecord	endp
_TEXT	ends
_DATA	segment word public 'DATA'
_demoname	label	byte
	db	68
	db	69
	db	77
	db	79
	db	63
	db	46
	db	7 dup (0)
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void FinishDemoRecord (void)
   ;	
	assume	cs:_TEXT
_FinishDemoRecord	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
   ;	
   ;	{
   ;		long	length,level;
   ;	
   ;		demorecord = false;
   ;	
	mov	word ptr DGROUP:_demorecord,0
   ;	
   ;	
   ;		length = demoptr - (char far *)demobuffer;
   ;	
	mov	ax,word ptr DGROUP:_demoptr
	xor	dx,dx
	sub	ax,0
	sbb	dx,0
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;	
   ;		demoptr = ((char far *)demobuffer)+1;
   ;	
	mov	ax,word ptr DGROUP:_demobuffer
	xor	dx,dx
	inc	dx
	mov	word ptr DGROUP:_demoptr,dx
	mov	word ptr DGROUP:_demoptr+2,ax
   ;	
   ;		*(unsigned far *)demoptr = length;
   ;	
	les	bx,dword ptr DGROUP:_demoptr
	mov	ax,word ptr [bp-4]
	mov	word ptr es:[bx],ax
   ;	
   ;	
   ;		CenterWindow(24,3);
   ;	
	mov	ax,3
	push	ax
	mov	ax,24
	push	ax
	call	near ptr _CenterWindow
	pop	cx
	pop	cx
   ;	
   ;		PrintY+=6;
   ;	
	add	word ptr DGROUP:_PrintY,6
   ;	
   ;		US_Print(" Demo number (0-9):");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+15
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	
   ;		if (US_LineInput (px,py,str,NULL,true,2,0))
   ;	
	xor	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,1
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_str
	push	ax
	push	word ptr DGROUP:_py
	push	word ptr DGROUP:_px
	call	near ptr _US_LineInput
	add	sp,14
	or	ax,ax
	je	short @13@218
   ;	
   ;		{
   ;			level = atoi (str);
   ;	
	mov	ax,offset DGROUP:_str
	push	ax
	call	near ptr _atol
	pop	cx
	cwd	
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],dx
   ;	
   ;			if (level>=0 && level<=9)
   ;	
	cmp	word ptr [bp-6],0
	jl	short @13@218
	jne	short @13@122
	cmp	word ptr [bp-8],0
	jb	short @13@218
@13@122:
	cmp	word ptr [bp-6],0
	jg	short @13@218
	jne	short @13@194
	cmp	word ptr [bp-8],9
	ja	short @13@218
@13@194:
   ;	
   ;			{
   ;				demoname[4] = '0'+level;
   ;	
	mov	al,byte ptr [bp-8]
	add	al,48
	mov	byte ptr DGROUP:_demoname+4,al
   ;	
   ;				CA_WriteFile (demoname,(void far *)demobuffer,length);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_demobuffer
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_demoname
	push	ax
	call	near ptr _CA_WriteFile
	add	sp,10
@13@218:
   ;	
   ;			}
   ;		}
   ;	
   ;	
   ;		MM_FreePtr (&demobuffer);
   ;	
	mov	ax,offset DGROUP:_demobuffer
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_FinishDemoRecord	endp
   ;	
   ;	void RecordDemo (void)
   ;	
	assume	cs:_TEXT
_RecordDemo	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		int level,esc;
   ;	
   ;		CenterWindow(26,3);
   ;	
	mov	ax,3
	push	ax
	mov	ax,26
	push	ax
	call	near ptr _CenterWindow
	pop	cx
	pop	cx
   ;	
   ;		PrintY+=6;
   ;	
	add	word ptr DGROUP:_PrintY,6
   ;	
   ;		CA_CacheGrChunk(STARTFONT);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;		fontnumber=0;
   ;	
	mov	word ptr DGROUP:_fontnumber,0
   ;	
   ;		US_Print("  Demo which level(1-10):");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+35
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		VW_FadeIn ();
   ;	
	mov	ax,30
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
   ;	
   ;		esc = !US_LineInput (px,py,str,NULL,true,2,0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,2
	push	ax
	mov	ax,1
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_str
	push	ax
	push	word ptr DGROUP:_py
	push	word ptr DGROUP:_px
	call	near ptr _US_LineInput
	add	sp,14
	neg	ax
	sbb	ax,ax
	inc	ax
	mov	di,ax
   ;	
   ;		if (esc)
   ;	
	or	di,di
	je	short @14@74
   ;	
   ;			return;
   ;	
	jmp	@14@98
@14@74:
   ;	
   ;	
   ;		level = atoi (str);
   ;	
	mov	ax,offset DGROUP:_str
	push	ax
	call	near ptr _atol
	pop	cx
	mov	si,ax
   ;	
   ;		level--;
   ;	
	dec	si
   ;	
   ;	
   ;		SETFONTCOLOR(0,15);
   ;	
	mov	byte ptr DGROUP:_fontcolor,0
	mov	byte ptr DGROUP:_backcolor,15
   ;	
   ;		VW_FadeOut ();
   ;	
	mov	ax,30
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	
   ;	#ifndef SPEAR
   ;		NewGame (gd_hard,level/10);
   ;	
	mov	ax,si
	mov	bx,10
	cwd	
	idiv	bx
	push	ax
	mov	ax,3
	push	ax
	call	near ptr _NewGame
	pop	cx
	pop	cx
   ;	
   ;		gamestate.mapon = level%10;
   ;	
	mov	ax,si
	mov	bx,10
	cwd	
	idiv	bx
	mov	word ptr DGROUP:_gamestate+2,dx
   ;	
   ;	#else
   ;		NewGame (gd_hard,0);
   ;		gamestate.mapon = level;
   ;	#endif
   ;	
   ;		StartDemoRecord (level);
   ;	
	push	si
	call	near ptr _StartDemoRecord
	pop	cx
   ;	
   ;	
   ;		DrawPlayScreen ();
   ;	
	call	near ptr _DrawPlayScreen
   ;	
   ;		VW_FadeIn ();
   ;	
	mov	ax,30
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
   ;	
   ;	
   ;		startgame = false;
   ;	
	mov	word ptr DGROUP:_startgame,0
   ;	
   ;		demorecord = true;
   ;	
	mov	word ptr DGROUP:_demorecord,1
   ;	
   ;	
   ;		SetupGameLevel ();
   ;	
	call	near ptr _SetupGameLevel
   ;	
   ;		StartMusic ();
   ;	
	call	near ptr _StartMusic
   ;	
   ;		PM_CheckMainMem ();
   ;	
	call	near ptr _PM_CheckMainMem
   ;	
   ;		fizzlein = true;
   ;	
	mov	word ptr DGROUP:_fizzlein,1
   ;	
   ;	
   ;		PlayLoop ();
   ;	
	call	near ptr _PlayLoop
   ;	
   ;	
   ;		demoplayback = false;
   ;	
	mov	word ptr DGROUP:_demoplayback,0
   ;	
   ;	
   ;		StopMusic ();
   ;	
	call	near ptr _StopMusic
   ;	
   ;		VW_FadeOut ();
   ;	
	mov	ax,30
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;		ClearMemory ();
   ;	
	call	near ptr _ClearMemory
   ;	
   ;	
   ;		FinishDemoRecord ();
   ;	
	call	near ptr _FinishDemoRecord
@14@98:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_RecordDemo	endp
_TEXT	ends
_DATA	segment word public 'DATA'
	db	139
	db	0
	db	140
	db	0
	db	141
	db	0
	db	142
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void PlayDemo (int demonumber)
   ;	
	assume	cs:_TEXT
_PlayDemo	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	di
	mov	si,word ptr [bp+4]
	push	ss
	lea	ax,word ptr [bp-8]
	push	ax
	push	ds
	mov	ax,offset DGROUP:d@w+925
	push	ax
	mov	cx,8
	call	near ptr N_SCOPY@
   ;	
   ;	{
   ;		int length;
   ;	
   ;	#ifdef DEMOSEXTERN
   ;	// debug: load chunk
   ;	#ifndef SPEARDEMO
   ;		int dems[4]={T_DEMO0,T_DEMO1,T_DEMO2,T_DEMO3};
   ;	#else
   ;		int dems[1]={T_DEMO0};
   ;	#endif
   ;	
   ;		CA_CacheGrChunk(dems[demonumber]);
   ;	
	mov	bx,si
	shl	bx,1
	lea	ax,word ptr [bp-8]
	add	bx,ax
	push	word ptr [bx]
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;		demoptr = grsegs[dems[demonumber]];
   ;	
	mov	bx,si
	shl	bx,1
	lea	ax,word ptr [bp-8]
	add	bx,ax
	mov	bx,word ptr [bx]
	shl	bx,1
	mov	ax,word ptr DGROUP:_grsegs[bx]
	mov	word ptr DGROUP:_demoptr,0
	mov	word ptr DGROUP:_demoptr+2,ax
   ;	
   ;		MM_SetLock (&grsegs[dems[demonumber]],true);
   ;	
	mov	ax,1
	push	ax
	mov	bx,si
	shl	bx,1
	lea	ax,word ptr [bp-8]
	add	bx,ax
	mov	ax,word ptr [bx]
	shl	ax,1
	add	ax,offset DGROUP:_grsegs
	push	ax
	call	near ptr _MM_SetLock
	pop	cx
	pop	cx
   ;	
   ;	#else
   ;		demoname[4] = '0'+demonumber;
   ;		CA_LoadFile (demoname,&demobuffer);
   ;		MM_SetLock (&demobuffer,true);
   ;		demoptr = (char far *)demobuffer;
   ;	#endif
   ;	
   ;		NewGame (1,0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _NewGame
	pop	cx
	pop	cx
   ;	
   ;		gamestate.mapon = *demoptr++;
   ;	
	les	bx,dword ptr DGROUP:_demoptr
	mov	al,byte ptr es:[bx]
	cbw	
	mov	word ptr DGROUP:_gamestate+2,ax
	inc	word ptr DGROUP:_demoptr
   ;	
   ;		gamestate.difficulty = gd_hard;
   ;	
	mov	word ptr DGROUP:_gamestate,3
   ;	
   ;		length = *((unsigned far *)demoptr)++;
   ;	
	les	bx,dword ptr DGROUP:_demoptr
	mov	di,word ptr es:[bx]
	add	word ptr DGROUP:_demoptr,2
   ;	
   ;		demoptr++;
   ;	
	inc	word ptr DGROUP:_demoptr
   ;	
   ;		lastdemoptr = demoptr-4+length;
   ;	
	mov	ax,word ptr DGROUP:_demoptr+2
	mov	dx,word ptr DGROUP:_demoptr
	add	dx,di
	add	dx,65532
	mov	word ptr DGROUP:_lastdemoptr,dx
	mov	word ptr DGROUP:_lastdemoptr+2,ax
   ;	
   ;	
   ;		VW_FadeOut ();
   ;	
	mov	ax,30
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	
   ;		SETFONTCOLOR(0,15);
   ;	
	mov	byte ptr DGROUP:_fontcolor,0
	mov	byte ptr DGROUP:_backcolor,15
   ;	
   ;		DrawPlayScreen ();
   ;	
	call	near ptr _DrawPlayScreen
   ;	
   ;		VW_FadeIn ();
   ;	
	mov	ax,30
	push	ax
	mov	ax,seg _gamepal
	push	ax
	mov	ax,offset _gamepal
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeIn
	add	sp,10
   ;	
   ;	
   ;		startgame = false;
   ;	
	mov	word ptr DGROUP:_startgame,0
   ;	
   ;		demoplayback = true;
   ;	
	mov	word ptr DGROUP:_demoplayback,1
   ;	
   ;	
   ;		SetupGameLevel ();
   ;	
	call	near ptr _SetupGameLevel
   ;	
   ;		StartMusic ();
   ;	
	call	near ptr _StartMusic
   ;	
   ;		PM_CheckMainMem ();
   ;	
	call	near ptr _PM_CheckMainMem
   ;	
   ;		fizzlein = true;
   ;	
	mov	word ptr DGROUP:_fizzlein,1
   ;	
   ;	
   ;		PlayLoop ();
   ;	
	call	near ptr _PlayLoop
   ;	
   ;	
   ;	#ifdef DEMOSEXTERN
   ;		UNCACHEGRCHUNK(dems[demonumber]);
   ;	
	mov	bx,si
	shl	bx,1
	lea	ax,word ptr [bp-8]
	add	bx,ax
	mov	ax,word ptr [bx]
	shl	ax,1
	add	ax,offset DGROUP:_grsegs
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	bx,si
	shl	bx,1
	lea	ax,word ptr [bp-8]
	add	bx,ax
	mov	bx,word ptr [bx]
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded[bx]
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	bx,si
	shl	bx,1
	lea	dx,word ptr [bp-8]
	add	bx,dx
	mov	bx,word ptr [bx]
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded[bx],al
   ;	
   ;	#else
   ;		MM_FreePtr (&demobuffer);
   ;	#endif
   ;	
   ;		demoplayback = false;
   ;	
	mov	word ptr DGROUP:_demoplayback,0
   ;	
   ;	
   ;		StopMusic ();
   ;	
	call	near ptr _StopMusic
   ;	
   ;		VW_FadeOut ();
   ;	
	mov	ax,30
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;		ClearMemory ();
   ;	
	call	near ptr _ClearMemory
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PlayDemo	endp
   ;	
   ;	void Died (void)
   ;	
	assume	cs:_TEXT
_Died	proc	near
	push	bp
	mov	bp,sp
	sub	sp,22
	push	si
	push	di
   ;	
   ;	{
   ;		float	fangle;
   ;		long	dx,dy;
   ;		int		iangle,curangle,clockwise,counter,change;
   ;	
   ;		gamestate.weapon = -1;			// take away weapon
   ;	
	mov	word ptr DGROUP:_gamestate+26,65535
   ;	
   ;		SD_PlaySound (PLAYERDEATHSND);
   ;	
	mov	ax,9
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;	//
   ;	// swing around to face attacker
   ;	//
   ;		dx = killerobj->x - player->x;
   ;	
	mov	bx,word ptr DGROUP:_killerobj
	mov	ax,word ptr [bx+17]
	mov	dx,word ptr [bx+15]
	mov	bx,word ptr DGROUP:_player
	sub	dx,word ptr [bx+15]
	sbb	ax,word ptr [bx+17]
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;		dy = player->y - killerobj->y;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+21]
	mov	dx,word ptr [bx+19]
	mov	bx,word ptr DGROUP:_killerobj
	sub	dx,word ptr [bx+19]
	sbb	ax,word ptr [bx+21]
	mov	word ptr [bp-12],dx
	mov	word ptr [bp-10],ax
   ;	
   ;	
   ;		fangle = atan2(dy,dx);			// returns -pi to pi
   ;	
	mov	ax,word ptr [bp-6]
	mov	dx,word ptr [bp-8]
	mov	word ptr [bp-22],dx
	mov	word ptr [bp-20],ax
	FILD	dword ptr [bp-22]
	add	sp,65528
	FSTP	qword ptr [bp-34]
	FWAIT	
	mov	ax,word ptr [bp-10]
	mov	dx,word ptr [bp-12]
	mov	word ptr [bp-22],dx
	mov	word ptr [bp-20],ax
	FILD	dword ptr [bp-22]
	add	sp,65528
	FSTP	qword ptr [bp-42]
	FWAIT	
	call	near ptr _atan2
	add	sp,16
	FSTP	dword ptr [bp-4]
   ;	
   ;		if (fangle<0)
   ;	
	FLD	dword ptr [bp-4]
	FLDZ	
	FCOMPP
	FSTSW	word ptr [bp-22]
	FWAIT	
	mov	ax,word ptr [bp-22]
	sahf	
	jbe	short @16@74
   ;	
   ;			fangle = M_PI*2+fangle;
   ;	
	FLD	dword ptr [bp-4]
	FADD	qword ptr DGROUP:s@+61
	FSTP	dword ptr [bp-4]
	FWAIT	
@16@74:
   ;	
   ;	
   ;		iangle = fangle/(M_PI*2)*ANGLES;
   ;	
	FLD	dword ptr [bp-4]
	FDIV	qword ptr DGROUP:s@+61
	FMUL	dword ptr DGROUP:s@+69
	call	near ptr N_FTOL@
	mov	di,ax
   ;	
   ;	
   ;		if (player->angle > iangle)
   ;	
	mov	bx,word ptr DGROUP:_player
	cmp	word ptr [bx+40],di
	jle	short @16@122
   ;	
   ;		{
   ;			counter = player->angle - iangle;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+40]
	sub	ax,di
	mov	word ptr [bp-16],ax
   ;	
   ;			clockwise = ANGLES-player->angle + iangle;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,360
	sub	ax,word ptr [bx+40]
	add	ax,di
	mov	word ptr [bp-14],ax
   ;	
   ;		}
   ;	
	jmp	short @16@146
@16@122:
   ;	
   ;		else
   ;		{
   ;			clockwise = iangle - player->angle;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,di
	sub	ax,word ptr [bx+40]
	mov	word ptr [bp-14],ax
   ;	
   ;			counter = player->angle + ANGLES-iangle;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+40]
	add	ax,360
	sub	ax,di
	mov	word ptr [bp-16],ax
@16@146:
   ;	
   ;		}
   ;	
   ;		curangle = player->angle;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	si,word ptr [bx+40]
   ;	
   ;	
   ;		if (clockwise<counter)
   ;	
	mov	ax,word ptr [bp-14]
	cmp	ax,word ptr [bp-16]
	jge	short @16@386
   ;	
   ;		{
   ;		//
   ;		// rotate clockwise
   ;		//
   ;			if (curangle>iangle)
   ;	
	cmp	si,di
	jle	short @16@218
   ;	
   ;				curangle -= ANGLES;
   ;	
	sub	si,360
@16@218:
   ;	
   ;			do
   ;			{
   ;				change = tics*DEATHROTATE;
   ;	
	mov	ax,word ptr DGROUP:_tics
	shl	ax,1
	mov	word ptr [bp-18],ax
   ;	
   ;				if (curangle + change > iangle)
   ;	
	mov	ax,si
	add	ax,word ptr [bp-18]
	cmp	ax,di
	jle	short @16@266
   ;	
   ;					change = iangle-curangle;
   ;	
	mov	ax,di
	sub	ax,si
	mov	word ptr [bp-18],ax
@16@266:
   ;	
   ;	
   ;				curangle += change;
   ;	
	add	si,word ptr [bp-18]
   ;	
   ;				player->angle += change;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bp-18]
	add	word ptr [bx+40],ax
   ;	
   ;				if (player->angle >= ANGLES)
   ;	
	mov	bx,word ptr DGROUP:_player
	cmp	word ptr [bx+40],360
	jl	short @16@314
   ;	
   ;					player->angle -= ANGLES;
   ;	
	mov	bx,word ptr DGROUP:_player
	sub	word ptr [bx+40],360
@16@314:
   ;	
   ;	
   ;				ThreeDRefresh ();
   ;	
	call	near ptr _ThreeDRefresh
   ;	
   ;				CalcTics ();
   ;	
	call	near ptr _CalcTics
   ;	
   ;			} while (curangle != iangle);
   ;	
	cmp	si,di
	jne	short @16@218
   ;	
   ;		}
   ;	
	jmp	short @16@578
@16@386:
   ;	
   ;		else
   ;		{
   ;		//
   ;		// rotate counterclockwise
   ;		//
   ;			if (curangle<iangle)
   ;	
	cmp	si,di
	jge	short @16@434
   ;	
   ;				curangle += ANGLES;
   ;	
	add	si,360
@16@434:
   ;	
   ;			do
   ;			{
   ;				change = -tics*DEATHROTATE;
   ;	
	mov	ax,word ptr DGROUP:_tics
	neg	ax
	shl	ax,1
	mov	word ptr [bp-18],ax
   ;	
   ;				if (curangle + change < iangle)
   ;	
	mov	ax,si
	add	ax,word ptr [bp-18]
	cmp	ax,di
	jge	short @16@482
   ;	
   ;					change = iangle-curangle;
   ;	
	mov	ax,di
	sub	ax,si
	mov	word ptr [bp-18],ax
@16@482:
   ;	
   ;	
   ;				curangle += change;
   ;	
	add	si,word ptr [bp-18]
   ;	
   ;				player->angle += change;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bp-18]
	add	word ptr [bx+40],ax
   ;	
   ;				if (player->angle < 0)
   ;	
	mov	bx,word ptr DGROUP:_player
	cmp	word ptr [bx+40],0
	jge	short @16@530
   ;	
   ;					player->angle += ANGLES;
   ;	
	mov	bx,word ptr DGROUP:_player
	add	word ptr [bx+40],360
@16@530:
   ;	
   ;	
   ;				ThreeDRefresh ();
   ;	
	call	near ptr _ThreeDRefresh
   ;	
   ;				CalcTics ();
   ;	
	call	near ptr _CalcTics
   ;	
   ;			} while (curangle != iangle);
   ;	
	cmp	si,di
	jne	short @16@434
@16@578:
   ;	
   ;		}
   ;	
   ;	//
   ;	// fade to red
   ;	//
   ;		FinishPaletteShifts ();
   ;	
	call	near ptr _FinishPaletteShifts
   ;	
   ;	
   ;		bufferofs += screenofs;
   ;	
	mov	ax,word ptr DGROUP:_screenofs
	add	word ptr DGROUP:_bufferofs,ax
   ;	
   ;		VW_Bar (0,0,viewwidth,viewheight,4);
   ;	
	mov	ax,4
	push	ax
	push	word ptr DGROUP:_viewheight
	push	word ptr DGROUP:_viewwidth
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_Bar
	add	sp,10
   ;	
   ;		IN_ClearKeysDown ();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;		FizzleFade(bufferofs,displayofs+screenofs,viewwidth,viewheight,70,false);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,70
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
   ;		bufferofs -= screenofs;
   ;	
	mov	ax,word ptr DGROUP:_screenofs
	sub	word ptr DGROUP:_bufferofs,ax
   ;	
   ;		IN_UserInput(100);
   ;	
	xor	ax,ax
	mov	dx,100
	push	ax
	push	dx
	call	near ptr _IN_UserInput
	pop	cx
	pop	cx
   ;	
   ;		SD_WaitSoundDone ();
   ;	
	call	near ptr _SD_WaitSoundDone
   ;	
   ;	
   ;		if (tedlevel == false)	// SO'S YA DON'T GET KILLED WHILE LAUNCHING!
   ;	
	cmp	word ptr DGROUP:_tedlevel,0
	jne	short @16@626
   ;	
   ;		  gamestate.lives--;
   ;	
	dec	word ptr DGROUP:_gamestate+16
@16@626:
   ;	
   ;	
   ;		if (gamestate.lives > -1)
   ;	
	cmp	word ptr DGROUP:_gamestate+16,65535
	jle	short @16@674
   ;	
   ;		{
   ;			gamestate.health = 100;
   ;	
	mov	word ptr DGROUP:_gamestate+18,100
   ;	
   ;			gamestate.weapon = gamestate.bestweapon
   ;	
   ;	
   ;				= gamestate.chosenweapon = wp_pistol;
   ;	
	mov	ax,1
	mov	word ptr DGROUP:_gamestate+28,ax
	mov	word ptr DGROUP:_gamestate+24,ax
	mov	word ptr DGROUP:_gamestate+26,ax
   ;	
   ;			gamestate.ammo = STARTAMMO;
   ;	
	mov	word ptr DGROUP:_gamestate+20,8
   ;	
   ;			gamestate.keys = 0;
   ;	
	mov	word ptr DGROUP:_gamestate+22,0
   ;	
   ;			gamestate.attackframe = gamestate.attackcount =
   ;	
   ;	
   ;			gamestate.weaponframe = 0;
   ;	
	xor	ax,ax
	mov	word ptr DGROUP:_gamestate+36,ax
	mov	word ptr DGROUP:_gamestate+34,ax
	mov	word ptr DGROUP:_gamestate+32,ax
   ;	
   ;	
   ;			DrawKeys ();
   ;	
	call	near ptr _DrawKeys
   ;	
   ;			DrawWeapon ();
   ;	
	call	near ptr _DrawWeapon
   ;	
   ;			DrawAmmo ();
   ;	
	call	near ptr _DrawAmmo
   ;	
   ;			DrawHealth ();
   ;	
	call	near ptr _DrawHealth
   ;	
   ;			DrawFace ();
   ;	
	call	near ptr _DrawFace
   ;	
   ;			DrawLives ();
   ;	
	call	near ptr _DrawLives
@16@674:
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
_Died	endp
   ;	
   ;	void GameLoop (void)
   ;	
	assume	cs:_TEXT
_GameLoop	proc	near
	push	bp
	mov	bp,sp
	push	si
@17@26:
   ;	
   ;	{
   ;		int i,xl,yl,xh,yh;
   ;		char num[20];
   ;		boolean	died;
   ;	#ifdef MYPROFILE
   ;		clock_t start,end;
   ;	#endif
   ;	
   ;	restartgame:
   ;		ClearMemory ();
   ;	
	call	near ptr _ClearMemory
   ;	
   ;		SETFONTCOLOR(0,15);
   ;	
	mov	byte ptr DGROUP:_fontcolor,0
	mov	byte ptr DGROUP:_backcolor,15
   ;	
   ;		DrawPlayScreen ();
   ;	
	call	near ptr _DrawPlayScreen
   ;	
   ;		died = false;
   ;	
	xor	si,si
@17@50:
   ;	
   ;	restart:
   ;		do
   ;		{
   ;			if (!loadedgame)
   ;	
	cmp	word ptr DGROUP:_loadedgame,0
	jne	short @17@98
   ;	
   ;			  gamestate.score = gamestate.oldscore;
   ;	
	mov	ax,word ptr DGROUP:_gamestate+6
	mov	dx,word ptr DGROUP:_gamestate+4
	mov	word ptr DGROUP:_gamestate+8,dx
	mov	word ptr DGROUP:_gamestate+10,ax
@17@98:
   ;	
   ;			DrawScore();
   ;	
	call	near ptr _DrawScore
   ;	
   ;	
   ;			startgame = false;
   ;	
	mov	word ptr DGROUP:_startgame,0
   ;	
   ;			if (loadedgame)
   ;	
	cmp	word ptr DGROUP:_loadedgame,0
	je	short @17@146
   ;	
   ;				loadedgame = false;
   ;	
	mov	word ptr DGROUP:_loadedgame,0
	jmp	short @17@170
@17@146:
   ;	
   ;			else
   ;				SetupGameLevel ();
   ;	
	call	near ptr _SetupGameLevel
@17@170:
   ;	
   ;	
   ;	#ifdef SPEAR
   ;			if (gamestate.mapon == 20)	// give them the key allways
   ;			{
   ;				gamestate.keys |= 1;
   ;				DrawKeys ();
   ;			}
   ;	#endif
   ;	
   ;			ingame = true;
   ;	
	mov	word ptr DGROUP:_ingame,1
   ;	
   ;			StartMusic ();
   ;	
	call	near ptr _StartMusic
   ;	
   ;			PM_CheckMainMem ();
   ;	
	call	near ptr _PM_CheckMainMem
   ;	
   ;			if (!died)
   ;	
	or	si,si
	jne	short @17@218
   ;	
   ;				PreloadGraphics ();
   ;	
	call	near ptr _PreloadGraphics
	jmp	short @17@242
@17@218:
   ;	
   ;			else
   ;				died = false;
   ;	
	xor	si,si
@17@242:
   ;	
   ;	
   ;			fizzlein = true;
   ;	
	mov	word ptr DGROUP:_fizzlein,1
   ;	
   ;			DrawLevel ();
   ;	
	call	near ptr _DrawLevel
   ;	
   ;	
   ;	startplayloop:
   ;			PlayLoop ();
   ;	
	call	near ptr _PlayLoop
   ;	
   ;	
   ;	#ifdef SPEAR
   ;			if (spearflag)
   ;			{
   ;				SD_StopSound();
   ;				SD_PlaySound(GETSPEARSND);
   ;				if (DigiMode != sds_Off)
   ;				{
   ;					long lasttimecount = TimeCount;
   ;	
   ;					while(TimeCount < lasttimecount+150)
   ;					//while(DigiPlaying!=false)
   ;						SD_Poll();
   ;				}
   ;				else
   ;					SD_WaitSoundDone();
   ;	
   ;				ClearMemory ();
   ;				gamestate.oldscore = gamestate.score;
   ;				gamestate.mapon = 20;
   ;				SetupGameLevel ();
   ;				StartMusic ();
   ;				PM_CheckMainMem ();
   ;				player->x = spearx;
   ;				player->y = speary;
   ;				player->angle = spearangle;
   ;				spearflag = false;
   ;				Thrust (0,0);
   ;				goto startplayloop;
   ;			}
   ;	#endif
   ;	
   ;			StopMusic ();
   ;	
	call	near ptr _StopMusic
   ;	
   ;			ingame = false;
   ;	
	mov	word ptr DGROUP:_ingame,0
   ;	
   ;	
   ;			if (demorecord && playstate != ex_warped)
   ;	
	cmp	word ptr DGROUP:_demorecord,0
	je	short @17@338
	cmp	word ptr DGROUP:_playstate,3
	je	short @17@338
   ;	
   ;				FinishDemoRecord ();
   ;	
	call	near ptr _FinishDemoRecord
@17@338:
   ;	
   ;	
   ;			if (startgame || loadedgame)
   ;	
	cmp	word ptr DGROUP:_startgame,0
	jne	short @17@386
	cmp	word ptr DGROUP:_loadedgame,0
	je	short @17@410
@17@386:
   ;	
   ;				goto restartgame;
   ;	
	jmp	@17@26
@17@410:
   ;	
   ;	
   ;			switch (playstate)
   ;	
	mov	bx,word ptr DGROUP:_playstate
	dec	bx
	cmp	bx,8
	jbe	@@6
	jmp	@17@722
@@6:
	shl	bx,1
	jmp	word ptr cs:@17@C2762[bx]
@17@482:
   ;	
   ;			{
   ;			case ex_completed:
   ;			case ex_secretlevel:
   ;				gamestate.keys = 0;
   ;	
	mov	word ptr DGROUP:_gamestate+22,0
   ;	
   ;				DrawKeys ();
   ;	
	call	near ptr _DrawKeys
   ;	
   ;				VW_FadeOut ();
   ;	
	mov	ax,30
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	
   ;				ClearMemory ();
   ;	
	call	near ptr _ClearMemory
   ;	
   ;	
   ;				LevelCompleted ();		// do the intermission
   ;	
	call	near ptr _LevelCompleted
   ;	
   ;	#ifdef SPEARDEMO
   ;				if (gamestate.mapon == 1)
   ;				{
   ;					died = true;			// don't "get psyched!"
   ;	
   ;					VW_FadeOut ();
   ;	
   ;					ClearMemory ();
   ;	
   ;					CheckHighScore (gamestate.score,gamestate.mapon+1);
   ;	
   ;					#pragma warn -sus
   ;					#ifndef JAPAN
   ;					_fstrcpy(MainMenu[viewscores].string,STR_VS);
   ;					#endif
   ;					MainMenu[viewscores].routine = CP_ViewScores;
   ;					#pragma warn +sus
   ;	
   ;					return;
   ;				}
   ;	#endif
   ;	
   ;	#ifdef JAPDEMO
   ;				if (gamestate.mapon == 3)
   ;				{
   ;					died = true;			// don't "get psyched!"
   ;	
   ;					VW_FadeOut ();
   ;	
   ;					ClearMemory ();
   ;	
   ;					CheckHighScore (gamestate.score,gamestate.mapon+1);
   ;	
   ;					#pragma warn -sus
   ;					#ifndef JAPAN
   ;					_fstrcpy(MainMenu[viewscores].string,STR_VS);
   ;					#endif
   ;					MainMenu[viewscores].routine = CP_ViewScores;
   ;					#pragma warn +sus
   ;	
   ;					return;
   ;				}
   ;	#endif
   ;	
   ;				gamestate.oldscore = gamestate.score;
   ;	
	mov	ax,word ptr DGROUP:_gamestate+10
	mov	dx,word ptr DGROUP:_gamestate+8
	mov	word ptr DGROUP:_gamestate+4,dx
	mov	word ptr DGROUP:_gamestate+6,ax
   ;	
   ;	
   ;	#ifndef SPEAR
   ;				//
   ;				// COMING BACK FROM SECRET LEVEL
   ;				//
   ;				if (gamestate.mapon == 9)
   ;	
	cmp	word ptr DGROUP:_gamestate+2,9
	jne	short @17@530
   ;	
   ;					gamestate.mapon = ElevatorBackTo[gamestate.episode];	// back from secret
   ;	
	mov	bx,word ptr DGROUP:_gamestate+38
	shl	bx,1
	mov	ax,word ptr DGROUP:_ElevatorBackTo[bx]
	mov	word ptr DGROUP:_gamestate+2,ax
	jmp	short @17@602
@17@530:
   ;	
   ;				else
   ;				//
   ;				// GOING TO SECRET LEVEL
   ;				//
   ;				if (playstate == ex_secretlevel)
   ;	
	cmp	word ptr DGROUP:_playstate,9
	jne	short @17@578
   ;	
   ;					gamestate.mapon = 9;
   ;	
	mov	word ptr DGROUP:_gamestate+2,9
	jmp	short @17@602
@17@578:
   ;	
   ;	#else
   ;	
   ;	#define FROMSECRET1		3
   ;	#define FROMSECRET2		11
   ;	
   ;				//
   ;				// GOING TO SECRET LEVEL
   ;				//
   ;				if (playstate == ex_secretlevel)
   ;					switch(gamestate.mapon)
   ;					{
   ;					 case FROMSECRET1: gamestate.mapon = 18; break;
   ;					 case FROMSECRET2: gamestate.mapon = 19; break;
   ;					}
   ;				else
   ;				//
   ;				// COMING BACK FROM SECRET LEVEL
   ;				//
   ;				if (gamestate.mapon == 18 || gamestate.mapon == 19)
   ;					switch(gamestate.mapon)
   ;					{
   ;					 case 18: gamestate.mapon = FROMSECRET1+1; break;
   ;					 case 19: gamestate.mapon = FROMSECRET2+1; break;
   ;					}
   ;	#endif
   ;				else
   ;				//
   ;				// GOING TO NEXT LEVEL
   ;				//
   ;					gamestate.mapon++;
   ;	
	inc	word ptr DGROUP:_gamestate+2
@17@602:
   ;	
   ;	
   ;	
   ;				break;
   ;	
	jmp	@17@746
@17@626:
   ;	
   ;	
   ;			case ex_died:
   ;				Died ();
   ;	
	call	near ptr _Died
   ;	
   ;				died = true;			// don't "get psyched!"
   ;	
	mov	si,1
   ;	
   ;	
   ;				if (gamestate.lives > -1)
   ;	
	cmp	word ptr DGROUP:_gamestate+16,65535
	jle	short @17@674
   ;	
   ;					break;				// more lives left
   ;	
	jmp	@17@746
@17@674:
   ;	
   ;	
   ;				VW_FadeOut ();
   ;	
	mov	ax,30
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	
   ;				ClearMemory ();
   ;	
	call	near ptr _ClearMemory
   ;	
   ;	
   ;				CheckHighScore (gamestate.score,gamestate.mapon+1);
   ;	
	mov	ax,word ptr DGROUP:_gamestate+2
	inc	ax
	push	ax
	push	word ptr DGROUP:_gamestate+10
	push	word ptr DGROUP:_gamestate+8
	call	near ptr _CheckHighScore
	add	sp,6
   ;	
   ;	
   ;				#pragma warn -sus
   ;				#ifndef JAPAN
   ;				_fstrcpy(MainMenu[viewscores].string,STR_VS);
   ;	
	mov	ax,offset DGROUP:s@+73
	push	ax
	mov	ax,seg _MainMenu
	push	ax
	mov	ax,offset _MainMenu+242
	push	ax
	call	near ptr __fstrcpy
	add	sp,6
   ;	
   ;				#endif
   ;				MainMenu[viewscores].routine = CP_ViewScores;
   ;	
	mov	ax,seg _MainMenu
	mov	es,ax
	mov	word ptr es:_MainMenu+278,offset _CP_ViewScores
   ;	
   ;				#pragma warn +sus
   ;	
   ;				return;
   ;	
	jmp	short @17@770
@17@698:
   ;	
   ;	
   ;			case ex_victorious:
   ;	
   ;	#ifndef SPEAR
   ;				VW_FadeOut ();
   ;	
	mov	ax,30
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,255
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VL_FadeOut
	add	sp,12
   ;	
   ;	#else
   ;				VL_FadeOut (0,255,0,17,17,300);
   ;	#endif
   ;				ClearMemory ();
   ;	
	call	near ptr _ClearMemory
   ;	
   ;	
   ;				Victory ();
   ;	
	call	near ptr _Victory
   ;	
   ;	
   ;				ClearMemory ();
   ;	
	call	near ptr _ClearMemory
   ;	
   ;	
   ;				CheckHighScore (gamestate.score,gamestate.mapon+1);
   ;	
	mov	ax,word ptr DGROUP:_gamestate+2
	inc	ax
	push	ax
	push	word ptr DGROUP:_gamestate+10
	push	word ptr DGROUP:_gamestate+8
	call	near ptr _CheckHighScore
	add	sp,6
   ;	
   ;	
   ;				#pragma warn -sus
   ;				#ifndef JAPAN
   ;				_fstrcpy(MainMenu[viewscores].string,STR_VS);
   ;	
	mov	ax,offset DGROUP:s@+85
	push	ax
	mov	ax,seg _MainMenu
	push	ax
	mov	ax,offset _MainMenu+242
	push	ax
	call	near ptr __fstrcpy
	add	sp,6
   ;	
   ;				#endif
   ;				MainMenu[viewscores].routine = CP_ViewScores;
   ;	
	mov	ax,seg _MainMenu
	mov	es,ax
	mov	word ptr es:_MainMenu+278,offset _CP_ViewScores
   ;	
   ;				#pragma warn +sus
   ;	
   ;				return;
   ;	
	jmp	short @17@770
@17@722:
   ;	
   ;	
   ;			default:
   ;				ClearMemory ();
   ;	
	call	near ptr _ClearMemory
   ;	
   ;				break;
   ;	
	jmp	short @17@746
@17@746:
   ;	
   ;			}
   ;	
   ;		} while (1);
   ;	
	jmp	@17@50
@17@770:
   ;	
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_GameLoop	endp
@17@C2762	label	word
	dw	@17@482
	dw	@17@626
	dw	@17@722
	dw	@17@722
	dw	@17@722
	dw	@17@698
	dw	@17@722
	dw	@17@722
	dw	@17@482
_TEXT	ends
_BSS	segment word public 'BSS'
_spearx	label	word
	db	4 dup (?)
_speary	label	word
	db	4 dup (?)
_spearflag	label	word
	db	2 dup (?)
_spearangle	label	word
	db	2 dup (?)
_globalsoundx	label	word
	db	4 dup (?)
_globalsoundy	label	word
	db	4 dup (?)
_fizzlein	label	word
	db	2 dup (?)
_latchpics	label	word
	db	200 dup (?)
_menuitems	label	word
	db	2 dup (?)
_gamestate	label	word
	db	66 dup (?)
_ingame	label	word
	db	2 dup (?)
_leftchannel	label	word
	db	2 dup (?)
_rightchannel	label	word
	db	2 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'Map not 64*64!'
	db	0
	db	' Demo number (0-9):'
	db	0
	db	'  Demo which level(1-10):'
	db	0
	db	24
	db	'-DT'
	db	-5
	db	'!'
	db	25
	db	'@'
	db	0
	db	0
	db	-76
	db	'CView Scores'
	db	0
	db	'View Scores'
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	public	_SetupGameLevel
	extrn	_LevelCompleted:near
	extrn	__fstrcpy:near
	public	_PlaySoundLocGlobal
	extrn	_lastdemoptr:dword
	extrn	_SD_WaitSoundDone:near
	extrn	_SD_PositionSound:near
	extrn	_CenterWindow:near
	extrn	_DrawAmmo:near
	extrn	_DrawLives:near
	extrn	_DrawLevel:near
	public	_StartDemoRecord
	extrn	_CA_WriteFile:near
	public	_rightchannel
	extrn	_mapheaderseg:word
	extrn	_grneeded:byte
	public	_SetSoundLoc
	extrn	_demoplayback:word
	extrn	_SD_StopDigitized:near
	extrn	_demorecord:word
	extrn	_PrintY:word
	extrn	_MM_FreePtr:near
	extrn	_ca_levelbit:byte
	extrn	_SpawnDeadGuard:near
	extrn	_DrawFace:near
	extrn	_viewwidth:word
	public	_leftchannel
	extrn	_CheckHighScore:near
	public	_righttable
	public	_ingame
	public	_UpdateSoundLoc
	extrn	_SD_SetPosition:near
	public	_gamestate
	extrn	_SpawnFakeHitler:near
	public	_RecordDemo
	extrn	_viewheight:word
	extrn	_MM_GetPtr:near
	extrn	_ThreeDRefresh:near
	extrn	_grsegs:word
	extrn	_backcolor:byte
	public	_menuitems
	extrn	_displayofs:word
	extrn	_FixedByFrac:near
	extrn	_mapwidth:word
	public	_lefttable
	extrn	_demobuffer:word
	extrn	_CA_CacheMap:near
	extrn	_MM_SortMem:near
	extrn	_mapheight:word
	public	_DrawAllPlayBorderSides
	extrn	_FizzleFade:near
	extrn	_MM_SetLock:near
	extrn	_bufferofs:word
	public	_demoname
	extrn	_demoptr:dword
	public	_latchpics
	extrn	_SD_PlaySound:near
	public	_GameLoop
	extrn	_MainMenu:word
	extrn	_killerobj:word
	extrn	_SpawnGhosts:near
	extrn	_viewcos:word
	public	_fizzlein
	extrn	_CP_ViewScores:near
	extrn	_Victory:near
	extrn	_tedlevel:word
	public	_ClearMemory
	extrn	_SpawnPatrol:near
	public	_globalsoundy
	public	_globalsoundx
	extrn	_viewsin:word
	extrn	_VL_FadeOut:near
	extrn	_NewGame:near
	extrn	_viewy:word
	extrn	_viewx:word
	public	_ElevatorBackTo
	extrn	_mapsegs:word
	extrn	_SpawnSchabbs:near
	extrn	_SpawnStatic:near
	extrn	_CalcTics:near
	public	_spearangle
	extrn	_playstate:word
	extrn	_SpawnStand:near
	extrn	_VW_UpdateScreen:near
	extrn	_tilemap:byte
	extrn	_SpawnHitler:near
	extrn	_SpawnGretel:near
	extrn	_SpawnPlayer:near
	extrn	_SoundPositioned:word
	extrn	_gamepal:byte
	public	_DrawPlayBorderSides
	extrn	_SpawnBoss:near
	extrn	_mapon:word
	extrn	_StartMusic:near
	extrn	_startgame:word
	extrn	_memset:near
	extrn	_SpawnDoor:near
	public	_ScanInfoPlane
	extrn	_IN_ClearKeysDown:near
	extrn	_US_LineInput:near
	extrn	_StopMusic:near
	extrn	_PlayLoop:near
	extrn	_SpawnGift:near
	public	_spearflag
	public	_PlayDemo
	public	_DrawAllPlayBorder
	extrn	_FinishPaletteShifts:near
	extrn	_Quit:near
	extrn	_tics:word
	public	_speary
	public	_spearx
	extrn	_py:word
	public	_Died
	extrn	_InitStaticList:near
	extrn	_VWB_DrawPic:near
	extrn	_SpawnFat:near
	extrn	_loadedgame:word
	extrn	_US_InitRndT:near
	extrn	_screenloc:word
	extrn	_PreloadGraphics:near
	extrn	_InitActorList:near
	extrn	_fontcolor:byte
	extrn	_player:word
	extrn	N_SCOPY@:far
	extrn	_atan2:near
	extrn	_fontnumber:word
	extrn	_PM_SetMainMemPurge:near
	extrn	_IN_UserInput:near
	public	_DrawPlayScreen
	public	_DrawPlayBorder
	extrn	_screenofs:word
	extrn	_InitDoorList:near
	extrn	_VL_Bar:near
	extrn	_VL_FadeIn:near
	extrn	_atol:near
	public	_FinishDemoRecord
	extrn	_str:byte
	extrn	_VWB_Plot:near
	extrn	_US_Print:near
	extrn	_VWB_Vlin:near
	extrn	_VWB_Hlin:near
	extrn	_CA_CacheGrChunk:near
	extrn	_px:word
	extrn	N_FTOL@:far
	extrn	_DrawHealth:near
	extrn	_CA_LoadAllSounds:near
	extrn	_DrawWeapon:near
	extrn	_PM_CheckMainMem:near
	extrn	_actorat:word
	extrn	_VWB_Bar:near
	extrn	_DrawScore:near
	extrn	_DrawKeys:near
	end
