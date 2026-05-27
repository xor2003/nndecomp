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
	?debug	S "c:\wl_agent.c"
	?debug	C E9E551FE7C0D633A5C776C5F6167656E742E63
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
_s_player	label	word
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	dw	_T_Player
	db	0
	db	0
	db	0
	db	0
_s_attack	label	word
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	dw	_T_Attack
	db	0
	db	0
	db	0
	db	0
_attackinfo	label	word
	db	6
	db	0
	db	1
	db	6
	db	2
	db	2
	db	6
	db	0
	db	3
	db	6
	db	255
	db	4
	db	30 dup (0)
	db	6
	db	0
	db	1
	db	6
	db	1
	db	2
	db	6
	db	0
	db	3
	db	6
	db	255
	db	4
	db	30 dup (0)
	db	6
	db	0
	db	1
	db	6
	db	1
	db	2
	db	6
	db	3
	db	3
	db	6
	db	255
	db	4
	db	30 dup (0)
	db	6
	db	0
	db	1
	db	6
	db	1
	db	2
	db	6
	db	4
	db	3
	db	6
	db	255
	db	4
	db	30 dup (0)
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void CheckWeaponChange (void)
   ;	
	assume	cs:_TEXT
_CheckWeaponChange	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int	i,buttons;
   ;	
   ;		if (!gamestate.ammo)		// must use knife with no ammo
   ;	
	cmp	word ptr DGROUP:_gamestate+20,0
	jne	short @1@74
   ;	
   ;			return;
   ;	
	jmp	short @1@194
@1@74:
   ;	
   ;	
   ;		for (i=wp_knife ; i<=gamestate.bestweapon ; i++)
   ;	
	xor	si,si
	jmp	short @1@170
@1@98:
   ;	
   ;			if (buttonstate[bt_readyknife+i-wp_knife])
   ;	
	mov	bx,si
	shl	bx,1
	cmp	word ptr DGROUP:_buttonstate[bx+10],0
	je	short @1@146
   ;	
   ;			{
   ;				gamestate.weapon = gamestate.chosenweapon = i;
   ;	
	mov	ax,si
	mov	word ptr DGROUP:_gamestate+28,ax
	mov	word ptr DGROUP:_gamestate+26,ax
   ;	
   ;				DrawWeapon ();
   ;	
	call	near ptr _DrawWeapon
   ;	
   ;				return;
   ;	
	jmp	short @1@194
@1@146:
	inc	si
@1@170:
	cmp	si,word ptr DGROUP:_gamestate+24
	jle	short @1@98
@1@194:
   ;	
   ;			}
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_CheckWeaponChange	endp
   ;	
   ;	void ControlMovement (objtype *ob)
   ;	
	assume	cs:_TEXT
_ControlMovement	proc	near
	push	bp
	mov	bp,sp
	sub	sp,12
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;	#define BASEMOVE 35
   ;		long	oldx,oldy;
   ;		int		magnitude;
   ;		int		angle,maxxmove;
   ;		int		angleunits;
   ;		long	speed;
   ;	
   ;		thrustspeed = 0;
   ;	
	mov	word ptr DGROUP:_thrustspeed,0
	mov	word ptr DGROUP:_thrustspeed+2,0
   ;	
   ;	
   ;		oldx = player->x;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+17]
	mov	dx,word ptr [bx+15]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;		oldy = player->y;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+21]
	mov	dx,word ptr [bx+19]
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;	
   ;	//
   ;	// strafing
   ;	//
   ;		if (buttonstate[bt_strafeleft])
   ;	
	cmp	word ptr DGROUP:_buttonstate+2,0
	jne	@@0
	jmp	@2@242
@@0:
   ;	
   ;		{
   ;			if (controly > 0)
   ;	
	cmp	word ptr DGROUP:_controly,0
	jle	short @2@98
   ;	
   ;			{
   ;				controly = (controly * 7) / 10;
   ;	
	mov	ax,word ptr DGROUP:_controly
	mov	dx,7
	imul	dx
	mov	bx,10
	cwd	
	idiv	bx
	mov	word ptr DGROUP:_controly,ax
   ;	
   ;				magnitude = controly;
   ;	
	mov	ax,word ptr DGROUP:_controly
	mov	word ptr [bp-10],ax
   ;	
   ;			}
   ;	
	jmp	short @2@170
@2@98:
   ;	
   ;			else if (controly < 0)
   ;	
	cmp	word ptr DGROUP:_controly,0
	jge	short @2@146
   ;	
   ;			{
   ;				controly = (controly * 7) / 10;
   ;	
	mov	ax,word ptr DGROUP:_controly
	mov	dx,7
	imul	dx
	mov	bx,10
	cwd	
	idiv	bx
	mov	word ptr DGROUP:_controly,ax
   ;	
   ;				magnitude = -controly;
   ;	
	mov	ax,word ptr DGROUP:_controly
	neg	ax
	mov	word ptr [bp-10],ax
   ;	
   ;			}
   ;	
	jmp	short @2@170
@2@146:
   ;	
   ;			else
   ;			{
   ;				magnitude = BASEMOVE * tics;
   ;	
	mov	ax,word ptr DGROUP:_tics
	mov	dx,35
	imul	dx
	mov	word ptr [bp-10],ax
@2@170:
   ;	
   ;			}
   ;	
   ;			angle = ob->angle + ANGLES/4;
   ;	
	mov	ax,word ptr [si+40]
	add	ax,90
	mov	di,ax
   ;	
   ;			if (angle >= ANGLES)
   ;	
	cmp	di,360
	jl	short @2@218
   ;	
   ;				angle -= ANGLES;
   ;	
	sub	di,360
@2@218:
   ;	
   ;			Thrust (angle, magnitude*MOVESCALE);	// move to left
   ;	
	mov	ax,word ptr [bp-10]
	cwd	
	push	ax
	push	dx
	xor	dx,dx
	mov	ax,150
	pop	cx
	pop	bx
	call	near ptr N_LXMUL@
	push	dx
	push	ax
	push	di
	call	near ptr _Thrust
	add	sp,6
   ;	
   ;		}
   ;	
	jmp	@2@458
@2@242:
   ;	
   ;		else if (buttonstate[bt_straferight])
   ;	
	cmp	word ptr DGROUP:_buttonstate+4,0
	jne	@@1
	jmp	@2@458
@@1:
   ;	
   ;		{
   ;			if (controly > 0)
   ;	
	cmp	word ptr DGROUP:_controly,0
	jle	short @2@314
   ;	
   ;			{
   ;				controly = (controly * 7) / 10;
   ;	
	mov	ax,word ptr DGROUP:_controly
	mov	dx,7
	imul	dx
	mov	bx,10
	cwd	
	idiv	bx
	mov	word ptr DGROUP:_controly,ax
   ;	
   ;				magnitude = controly;
   ;	
	mov	ax,word ptr DGROUP:_controly
	mov	word ptr [bp-10],ax
   ;	
   ;			}
   ;	
	jmp	short @2@386
@2@314:
   ;	
   ;			else if (controly < 0)
   ;	
	cmp	word ptr DGROUP:_controly,0
	jge	short @2@362
   ;	
   ;			{
   ;				controly = (controly * 7) / 10;
   ;	
	mov	ax,word ptr DGROUP:_controly
	mov	dx,7
	imul	dx
	mov	bx,10
	cwd	
	idiv	bx
	mov	word ptr DGROUP:_controly,ax
   ;	
   ;				magnitude = -controly;
   ;	
	mov	ax,word ptr DGROUP:_controly
	neg	ax
	mov	word ptr [bp-10],ax
   ;	
   ;			}
   ;	
	jmp	short @2@386
@2@362:
   ;	
   ;			else
   ;			{
   ;				magnitude = BASEMOVE * tics;
   ;	
	mov	ax,word ptr DGROUP:_tics
	mov	dx,35
	imul	dx
	mov	word ptr [bp-10],ax
@2@386:
   ;	
   ;			}
   ;	
   ;			angle = ob->angle - ANGLES/4;
   ;	
	mov	ax,word ptr [si+40]
	add	ax,65446
	mov	di,ax
   ;	
   ;			if (angle < 0)
   ;	
	or	di,di
	jge	short @2@434
   ;	
   ;				angle += ANGLES;
   ;	
	add	di,360
@2@434:
   ;	
   ;			Thrust (angle, magnitude*MOVESCALE);	// move to right
   ;	
	mov	ax,word ptr [bp-10]
	cwd	
	push	ax
	push	dx
	xor	dx,dx
	mov	ax,150
	pop	cx
	pop	bx
	call	near ptr N_LXMUL@
	push	dx
	push	ax
	push	di
	call	near ptr _Thrust
	add	sp,6
@2@458:
   ;	
   ;		}
   ;	
   ;	//
   ;	// not strafing
   ;	//
   ;		anglefrac += controlx;
   ;	
	mov	ax,word ptr DGROUP:_controlx
	add	word ptr DGROUP:_anglefrac,ax
   ;	
   ;		angleunits = anglefrac/ANGLESCALE;
   ;	
	mov	ax,word ptr DGROUP:_anglefrac
	mov	bx,20
	cwd	
	idiv	bx
	mov	word ptr [bp-12],ax
   ;	
   ;		anglefrac -= angleunits*ANGLESCALE;
   ;	
	mov	ax,word ptr [bp-12]
	mov	dx,20
	imul	dx
	sub	word ptr DGROUP:_anglefrac,ax
   ;	
   ;		ob->angle -= angleunits;
   ;	
	mov	ax,word ptr [bp-12]
	sub	word ptr [si+40],ax
   ;	
   ;	
   ;		if (ob->angle >= ANGLES)
   ;	
	cmp	word ptr [si+40],360
	jl	short @2@506
   ;	
   ;			ob->angle -= ANGLES;
   ;	
	sub	word ptr [si+40],360
@2@506:
   ;	
   ;		if (ob->angle < 0)
   ;	
	cmp	word ptr [si+40],0
	jge	short @2@554
   ;	
   ;			ob->angle += ANGLES;
   ;	
	add	word ptr [si+40],360
@2@554:
   ;	
   ;	
   ;	//
   ;	// forward/backwards move
   ;	//
   ;		if (controly < 0)
   ;	
	cmp	word ptr DGROUP:_controly,0
	jge	short @2@602
   ;	
   ;		{
   ;			Thrust (ob->angle,-controly*MOVESCALE);	// move forwards
   ;	
	mov	ax,word ptr DGROUP:_controly
	neg	ax
	cwd	
	push	ax
	push	dx
	xor	dx,dx
	mov	ax,150
	pop	cx
	pop	bx
	call	near ptr N_LXMUL@
	push	dx
	push	ax
	push	word ptr [si+40]
	call	near ptr _Thrust
	add	sp,6
   ;	
   ;		}
   ;	
	jmp	short @2@698
@2@602:
   ;	
   ;		else if (controly > 0)
   ;	
	cmp	word ptr DGROUP:_controly,0
	jle	short @2@698
   ;	
   ;		{
   ;			angle = ob->angle + ANGLES/2;
   ;	
	mov	ax,word ptr [si+40]
	add	ax,180
	mov	di,ax
   ;	
   ;			if (angle >= ANGLES)
   ;	
	cmp	di,360
	jl	short @2@674
   ;	
   ;				angle -= ANGLES;
   ;	
	sub	di,360
@2@674:
   ;	
   ;			Thrust (angle,controly*BACKMOVESCALE);		// move backwards
   ;	
	mov	ax,word ptr DGROUP:_controly
	cwd	
	push	ax
	push	dx
	xor	dx,dx
	mov	ax,100
	pop	cx
	pop	bx
	call	near ptr N_LXMUL@
	push	dx
	push	ax
	push	di
	call	near ptr _Thrust
	add	sp,6
@2@698:
   ;	
   ;		}
   ;	
   ;		if (gamestate.victoryflag)		// watching the BJ actor
   ;	
	cmp	word ptr DGROUP:_gamestate+64,0
	je	short @2@746
   ;	
   ;			return;
   ;	
	jmp	short @2@770
@2@746:
   ;	
   ;	
   ;	//
   ;	// calculate total move
   ;	//
   ;		playerxmove = player->x - oldx;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+17]
	mov	dx,word ptr [bx+15]
	sub	dx,word ptr [bp-4]
	sbb	ax,word ptr [bp-2]
	mov	word ptr DGROUP:_playerxmove,dx
	mov	word ptr DGROUP:_playerxmove+2,ax
   ;	
   ;		playerymove = player->y - oldy;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+21]
	mov	dx,word ptr [bx+19]
	sub	dx,word ptr [bp-8]
	sbb	ax,word ptr [bp-6]
	mov	word ptr DGROUP:_playerymove,dx
	mov	word ptr DGROUP:_playerymove+2,ax
@2@770:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_ControlMovement	endp
   ;	
   ;	void StatusDrawPic (unsigned x, unsigned y, unsigned picnum)
   ;	
	assume	cs:_TEXT
_StatusDrawPic	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+8]
   ;	
   ;	{
   ;		unsigned	temp;
   ;	
   ;		temp = bufferofs;
   ;	
	mov	si,word ptr DGROUP:_bufferofs
   ;	
   ;		bufferofs = 0;
   ;	
	mov	word ptr DGROUP:_bufferofs,0
   ;	
   ;	
   ;		bufferofs = PAGE1START+(200-STATUSLINES)*SCREENWIDTH;
   ;	
	mov	word ptr DGROUP:_bufferofs,12800
   ;	
   ;		LatchDrawPic (x,y,picnum);
   ;	
	push	di
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _LatchDrawPic
	add	sp,6
   ;	
   ;		bufferofs = PAGE2START+(200-STATUSLINES)*SCREENWIDTH;
   ;	
	mov	word ptr DGROUP:_bufferofs,29440
   ;	
   ;		LatchDrawPic (x,y,picnum);
   ;	
	push	di
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _LatchDrawPic
	add	sp,6
   ;	
   ;		bufferofs = PAGE3START+(200-STATUSLINES)*SCREENWIDTH;
   ;	
	mov	word ptr DGROUP:_bufferofs,46080
   ;	
   ;		LatchDrawPic (x,y,picnum);
   ;	
	push	di
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _LatchDrawPic
	add	sp,6
   ;	
   ;	
   ;		bufferofs = temp;
   ;	
	mov	word ptr DGROUP:_bufferofs,si
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_StatusDrawPic	endp
   ;	
   ;	void DrawFace (void)
   ;	
	assume	cs:_TEXT
_DrawFace	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		if (gamestate.health)
   ;	
	cmp	word ptr DGROUP:_gamestate+18,0
	je	short @4@74
   ;	
   ;		{
   ;			#ifdef SPEAR
   ;			if (godmode)
   ;				StatusDrawPic (17,4,GODMODEFACE1PIC+gamestate.faceframe);
   ;			else
   ;			#endif
   ;			StatusDrawPic (17,4,FACE1APIC+3*((100-gamestate.health)/16)+gamestate.faceframe);
   ;	
	mov	ax,100
	sub	ax,word ptr DGROUP:_gamestate+18
	mov	bx,16
	cwd	
	idiv	bx
	mov	dx,3
	imul	dx
	add	ax,word ptr DGROUP:_gamestate+30
	add	ax,109
	push	ax
	mov	ax,4
	push	ax
	mov	ax,17
	push	ax
	call	near ptr _StatusDrawPic
	add	sp,6
   ;	
   ;		}
   ;	
	jmp	short @4@146
@4@74:
   ;	
   ;		else
   ;		{
   ;	#ifndef SPEAR
   ;		 if (LastAttacker->obclass == needleobj)
   ;	
	mov	bx,word ptr DGROUP:_LastAttacker
	cmp	word ptr [bx+4],12
	jne	short @4@122
   ;	
   ;		   StatusDrawPic (17,4,MUTANTBJPIC);
   ;	
	mov	ax,132
	push	ax
	mov	ax,4
	push	ax
	mov	ax,17
	push	ax
	call	near ptr _StatusDrawPic
	add	sp,6
	jmp	short @4@146
@4@122:
   ;	
   ;		 else
   ;	#endif
   ;		   StatusDrawPic (17,4,FACE8APIC);
   ;	
	mov	ax,130
	push	ax
	mov	ax,4
	push	ax
	mov	ax,17
	push	ax
	call	near ptr _StatusDrawPic
	add	sp,6
@4@146:
   ;	
   ;		}
   ;	}
   ;	
	pop	bp
	ret	
_DrawFace	endp
   ;	
   ;	void	UpdateFace (void)
   ;	
	assume	cs:_TEXT
_UpdateFace	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	
   ;		if (SD_SoundPlaying() == GETGATLINGSND)
   ;	
	call	near ptr _SD_SoundPlaying
	cmp	ax,38
	jne	short @5@74
   ;	
   ;		  return;
   ;	
	jmp	short @5@170
@5@74:
   ;	
   ;	
   ;		facecount += tics;
   ;	
	mov	ax,word ptr DGROUP:_facecount
	add	ax,word ptr DGROUP:_tics
	mov	word ptr DGROUP:_facecount,ax
   ;	
   ;		if (facecount > US_RndT())
   ;	
	call	near ptr _US_RndT
	cmp	ax,word ptr DGROUP:_facecount
	jge	short @5@170
   ;	
   ;		{
   ;			gamestate.faceframe = (US_RndT()>>6);
   ;	
	call	near ptr _US_RndT
	mov	cl,6
	sar	ax,cl
	mov	word ptr DGROUP:_gamestate+30,ax
   ;	
   ;			if (gamestate.faceframe==3)
   ;	
	cmp	word ptr DGROUP:_gamestate+30,3
	jne	short @5@146
   ;	
   ;				gamestate.faceframe = 1;
   ;	
	mov	word ptr DGROUP:_gamestate+30,1
@5@146:
   ;	
   ;	
   ;			facecount = 0;
   ;	
	mov	word ptr DGROUP:_facecount,0
   ;	
   ;			DrawFace ();
   ;	
	call	near ptr _DrawFace
@5@170:
   ;	
   ;		}
   ;	}
   ;	
	pop	bp
	ret	
_UpdateFace	endp
   ;	
   ;	void	LatchNumber (int x, int y, int width, long number)
   ;	
	assume	cs:_TEXT
_LatchNumber	proc	near
	push	bp
	mov	bp,sp
	sub	sp,20
	push	si
	push	di
   ;	
   ;	{
   ;		unsigned	length,c;
   ;		char	str[20];
   ;	
   ;		ltoa (number,str,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-20]
	push	ax
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	call	near ptr _ltoa
	add	sp,8
   ;	
   ;	
   ;		length = strlen (str);
   ;	
	lea	ax,word ptr [bp-20]
	push	ax
	call	near ptr _strlen
	pop	cx
	mov	di,ax
	jmp	short @6@74
@6@50:
   ;	
   ;	
   ;		while (length<width)
   ;		{
   ;			StatusDrawPic (x,y,N_BLANKPIC);
   ;	
	mov	ax,98
	push	ax
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _StatusDrawPic
	add	sp,6
   ;	
   ;			x++;
   ;	
	inc	word ptr [bp+4]
   ;	
   ;			width--;
   ;	
	dec	word ptr [bp+8]
@6@74:
	cmp	di,word ptr [bp+8]
	jb	short @6@50
   ;	
   ;		}
   ;	
   ;		c= length <= width ? 0 : length-width;
   ;	
	cmp	di,word ptr [bp+8]
	ja	short @6@146
	xor	ax,ax
	jmp	short @6@170
@6@146:
	mov	ax,di
	sub	ax,word ptr [bp+8]
@6@170:
	mov	si,ax
	jmp	short @6@218
@6@194:
   ;	
   ;	
   ;		while (c<length)
   ;		{
   ;			StatusDrawPic (x,y,str[c]-'0'+ N_0PIC);
   ;	
	mov	al,byte ptr [bp+si-20]
	cbw	
	add	ax,51
	push	ax
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _StatusDrawPic
	add	sp,6
   ;	
   ;			x++;
   ;	
	inc	word ptr [bp+4]
   ;	
   ;			c++;
   ;	
	inc	si
@6@218:
	cmp	si,di
	jb	short @6@194
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_LatchNumber	endp
   ;	
   ;	void	DrawHealth (void)
   ;	
	assume	cs:_TEXT
_DrawHealth	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		LatchNumber (21,16,3,gamestate.health);
   ;	
	mov	ax,word ptr DGROUP:_gamestate+18
	cwd	
	push	dx
	push	ax
	mov	ax,3
	push	ax
	mov	ax,16
	push	ax
	mov	ax,21
	push	ax
	call	near ptr _LatchNumber
	add	sp,10
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_DrawHealth	endp
   ;	
   ;	void	TakeDamage (int points,objtype *attacker)
   ;	
	assume	cs:_TEXT
_TakeDamage	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		LastAttacker = attacker;
   ;	
	mov	ax,word ptr [bp+6]
	mov	word ptr DGROUP:_LastAttacker,ax
   ;	
   ;	
   ;		if (gamestate.victoryflag)
   ;	
	cmp	word ptr DGROUP:_gamestate+64,0
	je	short @8@74
   ;	
   ;			return;
   ;	
	jmp	short @8@242
@8@74:
   ;	
   ;		if (gamestate.difficulty==gd_baby)
   ;	
	cmp	word ptr DGROUP:_gamestate,0
	jne	short @8@122
   ;	
   ;		  points>>=2;
   ;	
	sar	si,1
	sar	si,1
@8@122:
   ;	
   ;	
   ;		if (!godmode)
   ;	
	cmp	word ptr DGROUP:_godmode,0
	jne	short @8@170
   ;	
   ;			gamestate.health -= points;
   ;	
	sub	word ptr DGROUP:_gamestate+18,si
@8@170:
   ;	
   ;	
   ;		if (gamestate.health<=0)
   ;	
	cmp	word ptr DGROUP:_gamestate+18,0
	jg	short @8@218
   ;	
   ;		{
   ;			gamestate.health = 0;
   ;	
	mov	word ptr DGROUP:_gamestate+18,0
   ;	
   ;			playstate = ex_died;
   ;	
	mov	word ptr DGROUP:_playstate,2
   ;	
   ;			killerobj = attacker;
   ;	
	mov	ax,word ptr [bp+6]
	mov	word ptr DGROUP:_killerobj,ax
@8@218:
   ;	
   ;		}
   ;	
   ;		StartDamageFlash (points);
   ;	
	push	si
	call	near ptr _StartDamageFlash
	pop	cx
   ;	
   ;	
   ;		gotgatgun=0;
   ;	
	mov	word ptr DGROUP:_gotgatgun,0
   ;	
   ;	
   ;		DrawHealth ();
   ;	
	call	near ptr _DrawHealth
   ;	
   ;		DrawFace ();
   ;	
	call	near ptr _DrawFace
@8@242:
   ;	
   ;	
   ;		//
   ;		// MAKE BJ'S EYES BUG IF MAJOR DAMAGE!
   ;		//
   ;		#ifdef SPEAR
   ;		if (points > 30 && gamestate.health!=0 && !godmode)
   ;		{
   ;			StatusDrawPic (17,4,BJOUCHPIC);
   ;			facecount = 0;
   ;		}
   ;		#endif
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_TakeDamage	endp
   ;	
   ;	void	HealSelf (int points)
   ;	
	assume	cs:_TEXT
_HealSelf	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		gamestate.health += points;
   ;	
	mov	ax,word ptr [bp+4]
	add	word ptr DGROUP:_gamestate+18,ax
   ;	
   ;		if (gamestate.health>100)
   ;	
	cmp	word ptr DGROUP:_gamestate+18,100
	jle	short @9@74
   ;	
   ;			gamestate.health = 100;
   ;	
	mov	word ptr DGROUP:_gamestate+18,100
@9@74:
   ;	
   ;	
   ;		DrawHealth ();
   ;	
	call	near ptr _DrawHealth
   ;	
   ;		gotgatgun = 0;	// JR
   ;	
	mov	word ptr DGROUP:_gotgatgun,0
   ;	
   ;		DrawFace ();
   ;	
	call	near ptr _DrawFace
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_HealSelf	endp
   ;	
   ;	void	DrawLevel (void)
   ;	
	assume	cs:_TEXT
_DrawLevel	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	#ifdef SPEAR
   ;		if (gamestate.mapon == 20)
   ;			LatchNumber (2,16,2,18);
   ;		else
   ;	#endif
   ;		LatchNumber (2,16,2,gamestate.mapon+1);
   ;	
	mov	ax,word ptr DGROUP:_gamestate+2
	inc	ax
	cwd	
	push	dx
	push	ax
	mov	ax,2
	push	ax
	mov	ax,16
	push	ax
	mov	ax,2
	push	ax
	call	near ptr _LatchNumber
	add	sp,10
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_DrawLevel	endp
   ;	
   ;	void	DrawLives (void)
   ;	
	assume	cs:_TEXT
_DrawLives	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		LatchNumber (14,16,1,gamestate.lives);
   ;	
	mov	ax,word ptr DGROUP:_gamestate+16
	cwd	
	push	dx
	push	ax
	mov	ax,1
	push	ax
	mov	ax,16
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _LatchNumber
	add	sp,10
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_DrawLives	endp
   ;	
   ;	void	GiveExtraMan (void)
   ;	
	assume	cs:_TEXT
_GiveExtraMan	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		if (gamestate.lives<9)
   ;	
	cmp	word ptr DGROUP:_gamestate+16,9
	jge	short @12@74
   ;	
   ;			gamestate.lives++;
   ;	
	inc	word ptr DGROUP:_gamestate+16
@12@74:
   ;	
   ;		DrawLives ();
   ;	
	call	near ptr _DrawLives
   ;	
   ;		SD_PlaySound (BONUS1UPSND);
   ;	
	mov	ax,44
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_GiveExtraMan	endp
   ;	
   ;	void	DrawScore (void)
   ;	
	assume	cs:_TEXT
_DrawScore	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		LatchNumber (6,16,6,gamestate.score);
   ;	
	push	word ptr DGROUP:_gamestate+10
	push	word ptr DGROUP:_gamestate+8
	mov	ax,6
	push	ax
	mov	ax,16
	push	ax
	mov	ax,6
	push	ax
	call	near ptr _LatchNumber
	add	sp,10
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_DrawScore	endp
   ;	
   ;	void	GivePoints (long points)
   ;	
	assume	cs:_TEXT
_GivePoints	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		gamestate.score += points;
   ;	
	mov	ax,word ptr [bp+6]
	mov	dx,word ptr [bp+4]
	add	word ptr DGROUP:_gamestate+8,dx
	adc	word ptr DGROUP:_gamestate+10,ax
	jmp	short @14@74
@14@50:
   ;	
   ;		while (gamestate.score >= gamestate.nextextra)
   ;		{
   ;			gamestate.nextextra += EXTRAPOINTS;
   ;	
	add	word ptr DGROUP:_gamestate+12,40000
	adc	word ptr DGROUP:_gamestate+14,0
   ;	
   ;			GiveExtraMan ();
   ;	
	call	near ptr _GiveExtraMan
@14@74:
	mov	ax,word ptr DGROUP:_gamestate+10
	mov	dx,word ptr DGROUP:_gamestate+8
	cmp	ax,word ptr DGROUP:_gamestate+14
	jg	short @14@50
	jl	short @14@146
	cmp	dx,word ptr DGROUP:_gamestate+12
	jae	short @14@50
@14@146:
   ;	
   ;		}
   ;		DrawScore ();
   ;	
	call	near ptr _DrawScore
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_GivePoints	endp
   ;	
   ;	void DrawWeapon (void)
   ;	
	assume	cs:_TEXT
_DrawWeapon	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		StatusDrawPic (32,8,KNIFEPIC+gamestate.weapon);
   ;	
	mov	ax,word ptr DGROUP:_gamestate+26
	add	ax,91
	push	ax
	mov	ax,8
	push	ax
	mov	ax,32
	push	ax
	call	near ptr _StatusDrawPic
	add	sp,6
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_DrawWeapon	endp
   ;	
   ;	void DrawKeys (void)
   ;	
	assume	cs:_TEXT
_DrawKeys	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		if (gamestate.keys & 1)
   ;	
	test	word ptr DGROUP:_gamestate+22,1
	je	short @16@74
   ;	
   ;			StatusDrawPic (30,4,GOLDKEYPIC);
   ;	
	mov	ax,96
	push	ax
	mov	ax,4
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _StatusDrawPic
	add	sp,6
	jmp	short @16@98
@16@74:
   ;	
   ;		else
   ;			StatusDrawPic (30,4,NOKEYPIC);
   ;	
	mov	ax,95
	push	ax
	mov	ax,4
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _StatusDrawPic
	add	sp,6
@16@98:
   ;	
   ;	
   ;		if (gamestate.keys & 2)
   ;	
	test	word ptr DGROUP:_gamestate+22,2
	je	short @16@146
   ;	
   ;			StatusDrawPic (30,20,SILVERKEYPIC);
   ;	
	mov	ax,97
	push	ax
	mov	ax,20
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _StatusDrawPic
	add	sp,6
	jmp	short @16@170
@16@146:
   ;	
   ;		else
   ;			StatusDrawPic (30,20,NOKEYPIC);
   ;	
	mov	ax,95
	push	ax
	mov	ax,20
	push	ax
	mov	ax,30
	push	ax
	call	near ptr _StatusDrawPic
	add	sp,6
@16@170:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_DrawKeys	endp
   ;	
   ;	void GiveWeapon (int weapon)
   ;	
	assume	cs:_TEXT
_GiveWeapon	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		GiveAmmo (6);
   ;	
	mov	ax,6
	push	ax
	call	near ptr _GiveAmmo
	pop	cx
   ;	
   ;	
   ;		if (gamestate.bestweapon<weapon)
   ;	
	mov	ax,word ptr DGROUP:_gamestate+24
	cmp	ax,word ptr [bp+4]
	jge	short @17@74
   ;	
   ;			gamestate.bestweapon = gamestate.weapon
   ;	
   ;	
   ;			= gamestate.chosenweapon = weapon;
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:_gamestate+28,ax
	mov	word ptr DGROUP:_gamestate+26,ax
	mov	word ptr DGROUP:_gamestate+24,ax
@17@74:
   ;	
   ;	
   ;		DrawWeapon ();
   ;	
	call	near ptr _DrawWeapon
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_GiveWeapon	endp
   ;	
   ;	void	DrawAmmo (void)
   ;	
	assume	cs:_TEXT
_DrawAmmo	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		LatchNumber (27,16,2,gamestate.ammo);
   ;	
	mov	ax,word ptr DGROUP:_gamestate+20
	cwd	
	push	dx
	push	ax
	mov	ax,2
	push	ax
	mov	ax,16
	push	ax
	mov	ax,27
	push	ax
	call	near ptr _LatchNumber
	add	sp,10
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_DrawAmmo	endp
   ;	
   ;	void	GiveAmmo (int ammo)
   ;	
	assume	cs:_TEXT
_GiveAmmo	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		if (!gamestate.ammo)				// knife was out
   ;	
	cmp	word ptr DGROUP:_gamestate+20,0
	jne	short @19@98
   ;	
   ;		{
   ;			if (!gamestate.attackframe)
   ;	
	cmp	word ptr DGROUP:_gamestate+32,0
	jne	short @19@98
   ;	
   ;			{
   ;				gamestate.weapon = gamestate.chosenweapon;
   ;	
	mov	ax,word ptr DGROUP:_gamestate+28
	mov	word ptr DGROUP:_gamestate+26,ax
   ;	
   ;				DrawWeapon ();
   ;	
	call	near ptr _DrawWeapon
@19@98:
   ;	
   ;			}
   ;		}
   ;		gamestate.ammo += ammo;
   ;	
	mov	ax,word ptr [bp+4]
	add	word ptr DGROUP:_gamestate+20,ax
   ;	
   ;		if (gamestate.ammo > 99)
   ;	
	cmp	word ptr DGROUP:_gamestate+20,99
	jle	short @19@146
   ;	
   ;			gamestate.ammo = 99;
   ;	
	mov	word ptr DGROUP:_gamestate+20,99
@19@146:
   ;	
   ;		DrawAmmo ();
   ;	
	call	near ptr _DrawAmmo
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_GiveAmmo	endp
   ;	
   ;	void GiveKey (int key)
   ;	
	assume	cs:_TEXT
_GiveKey	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		gamestate.keys |= (1<<key);
   ;	
	mov	ax,1
	mov	cl,byte ptr [bp+4]
	shl	ax,cl
	or	word ptr DGROUP:_gamestate+22,ax
   ;	
   ;		DrawKeys ();
   ;	
	call	near ptr _DrawKeys
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_GiveKey	endp
   ;	
   ;	void GetBonus (statobj_t *check)
   ;	
	assume	cs:_TEXT
_GetBonus	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		switch (check->itemnumber)
   ;	
	mov	al,byte ptr [si+7]
	mov	ah,0
	dec	ax
	dec	ax
	mov	bx,ax
	cmp	bx,18
	jbe	@@2
	jmp	@21@746
@@2:
	shl	bx,1
	jmp	word ptr cs:@21@C2808[bx]
@21@98:
   ;	
   ;		{
   ;		case	bo_firstaid:
   ;			if (gamestate.health == 100)
   ;	
	cmp	word ptr DGROUP:_gamestate+18,100
	jne	short @21@146
   ;	
   ;				return;
   ;	
	jmp	@21@770
@21@146:
   ;	
   ;	
   ;			SD_PlaySound (HEALTH2SND);
   ;	
	mov	ax,34
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			HealSelf (25);
   ;	
	mov	ax,25
	push	ax
	call	near ptr _HealSelf
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	@21@746
@21@170:
   ;	
   ;	
   ;		case	bo_key1:
   ;		case	bo_key2:
   ;		case	bo_key3:
   ;		case	bo_key4:
   ;			GiveKey (check->itemnumber - bo_key1);
   ;	
	mov	al,byte ptr [si+7]
	mov	ah,0
	add	ax,65531
	push	ax
	call	near ptr _GiveKey
	pop	cx
   ;	
   ;			SD_PlaySound (GETKEYSND);
   ;	
	mov	ax,12
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	@21@746
@21@194:
   ;	
   ;	
   ;		case	bo_cross:
   ;			SD_PlaySound (BONUS1SND);
   ;	
	mov	ax,35
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			GivePoints (100);
   ;	
	xor	ax,ax
	mov	dx,100
	push	ax
	push	dx
	call	near ptr _GivePoints
	pop	cx
	pop	cx
   ;	
   ;			gamestate.treasurecount++;
   ;	
	inc	word ptr DGROUP:_gamestate+42
   ;	
   ;			break;
   ;	
	jmp	@21@746
@21@218:
   ;	
   ;		case	bo_chalice:
   ;			SD_PlaySound (BONUS2SND);
   ;	
	mov	ax,36
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			GivePoints (500);
   ;	
	xor	ax,ax
	mov	dx,500
	push	ax
	push	dx
	call	near ptr _GivePoints
	pop	cx
	pop	cx
   ;	
   ;			gamestate.treasurecount++;
   ;	
	inc	word ptr DGROUP:_gamestate+42
   ;	
   ;			break;
   ;	
	jmp	@21@746
@21@242:
   ;	
   ;		case	bo_bible:
   ;			SD_PlaySound (BONUS3SND);
   ;	
	mov	ax,37
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			GivePoints (1000);
   ;	
	xor	ax,ax
	mov	dx,1000
	push	ax
	push	dx
	call	near ptr _GivePoints
	pop	cx
	pop	cx
   ;	
   ;			gamestate.treasurecount++;
   ;	
	inc	word ptr DGROUP:_gamestate+42
   ;	
   ;			break;
   ;	
	jmp	@21@746
@21@266:
   ;	
   ;		case	bo_crown:
   ;			SD_PlaySound (BONUS4SND);
   ;	
	mov	ax,45
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			GivePoints (5000);
   ;	
	xor	ax,ax
	mov	dx,5000
	push	ax
	push	dx
	call	near ptr _GivePoints
	pop	cx
	pop	cx
   ;	
   ;			gamestate.treasurecount++;
   ;	
	inc	word ptr DGROUP:_gamestate+42
   ;	
   ;			break;
   ;	
	jmp	@21@746
@21@290:
   ;	
   ;	
   ;		case	bo_clip:
   ;			if (gamestate.ammo == 99)
   ;	
	cmp	word ptr DGROUP:_gamestate+20,99
	jne	short @21@338
   ;	
   ;				return;
   ;	
	jmp	@21@770
@21@338:
   ;	
   ;	
   ;			SD_PlaySound (GETAMMOSND);
   ;	
	mov	ax,31
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			GiveAmmo (8);
   ;	
	mov	ax,8
	push	ax
	call	near ptr _GiveAmmo
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	@21@746
@21@362:
   ;	
   ;		case	bo_clip2:
   ;			if (gamestate.ammo == 99)
   ;	
	cmp	word ptr DGROUP:_gamestate+20,99
	jne	short @21@410
   ;	
   ;				return;
   ;	
	jmp	@21@770
@21@410:
   ;	
   ;	
   ;			SD_PlaySound (GETAMMOSND);
   ;	
	mov	ax,31
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			GiveAmmo (4);
   ;	
	mov	ax,4
	push	ax
	call	near ptr _GiveAmmo
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	@21@746
@21@434:
   ;	
   ;	
   ;	#ifdef SPEAR
   ;		case	bo_25clip:
   ;			if (gamestate.ammo == 99)
   ;			  return;
   ;	
   ;			SD_PlaySound (GETAMMOBOXSND);
   ;			GiveAmmo (25);
   ;			break;
   ;	#endif
   ;	
   ;		case	bo_machinegun:
   ;			SD_PlaySound (GETMACHINESND);
   ;	
	mov	ax,30
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			GiveWeapon (wp_machinegun);
   ;	
	mov	ax,2
	push	ax
	call	near ptr _GiveWeapon
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	@21@746
@21@458:
   ;	
   ;		case	bo_chaingun:
   ;			SD_PlaySound (GETGATLINGSND);
   ;	
	mov	ax,38
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			GiveWeapon (wp_chaingun);
   ;	
	mov	ax,3
	push	ax
	call	near ptr _GiveWeapon
	pop	cx
   ;	
   ;	
   ;			StatusDrawPic (17,4,GOTGATLINGPIC);
   ;	
	mov	ax,131
	push	ax
	mov	ax,4
	push	ax
	mov	ax,17
	push	ax
	call	near ptr _StatusDrawPic
	add	sp,6
   ;	
   ;			facecount = 0;
   ;	
	mov	word ptr DGROUP:_facecount,0
   ;	
   ;			gotgatgun = 1;
   ;	
	mov	word ptr DGROUP:_gotgatgun,1
   ;	
   ;			break;
   ;	
	jmp	@21@746
@21@482:
   ;	
   ;	
   ;		case	bo_fullheal:
   ;			SD_PlaySound (BONUS1UPSND);
   ;	
	mov	ax,44
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			HealSelf (99);
   ;	
	mov	ax,99
	push	ax
	call	near ptr _HealSelf
	pop	cx
   ;	
   ;			GiveAmmo (25);
   ;	
	mov	ax,25
	push	ax
	call	near ptr _GiveAmmo
	pop	cx
   ;	
   ;			GiveExtraMan ();
   ;	
	call	near ptr _GiveExtraMan
   ;	
   ;			gamestate.treasurecount++;
   ;	
	inc	word ptr DGROUP:_gamestate+42
   ;	
   ;			break;
   ;	
	jmp	@21@746
@21@506:
   ;	
   ;	
   ;		case	bo_food:
   ;			if (gamestate.health == 100)
   ;	
	cmp	word ptr DGROUP:_gamestate+18,100
	jne	short @21@554
   ;	
   ;				return;
   ;	
	jmp	@21@770
@21@554:
   ;	
   ;	
   ;			SD_PlaySound (HEALTH1SND);
   ;	
	mov	ax,33
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			HealSelf (10);
   ;	
	mov	ax,10
	push	ax
	call	near ptr _HealSelf
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	short @21@746
@21@578:
   ;	
   ;	
   ;		case	bo_alpo:
   ;			if (gamestate.health == 100)
   ;	
	cmp	word ptr DGROUP:_gamestate+18,100
	jne	short @21@626
   ;	
   ;				return;
   ;	
	jmp	short @21@770
@21@626:
   ;	
   ;	
   ;			SD_PlaySound (HEALTH1SND);
   ;	
	mov	ax,33
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			HealSelf (4);
   ;	
	mov	ax,4
	push	ax
	call	near ptr _HealSelf
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	short @21@746
@21@650:
   ;	
   ;	
   ;		case	bo_gibs:
   ;			if (gamestate.health >10)
   ;	
	cmp	word ptr DGROUP:_gamestate+18,10
	jle	short @21@698
   ;	
   ;				return;
   ;	
	jmp	short @21@770
@21@698:
   ;	
   ;	
   ;			SD_PlaySound (SLURPIESND);
   ;	
	mov	ax,61
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			HealSelf (1);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _HealSelf
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	short @21@746
@21@722:
   ;	
   ;	
   ;		case	bo_spear:
   ;			spearflag = true;
   ;	
	mov	word ptr DGROUP:_spearflag,1
   ;	
   ;			spearx = player->x;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+17]
	mov	dx,word ptr [bx+15]
	mov	word ptr DGROUP:_spearx,dx
	mov	word ptr DGROUP:_spearx+2,ax
   ;	
   ;			speary = player->y;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+21]
	mov	dx,word ptr [bx+19]
	mov	word ptr DGROUP:_speary,dx
	mov	word ptr DGROUP:_speary+2,ax
   ;	
   ;			spearangle = player->angle;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+40]
	mov	word ptr DGROUP:_spearangle,ax
   ;	
   ;			playstate = ex_completed;
   ;	
	mov	word ptr DGROUP:_playstate,1
@21@746:
   ;	
   ;		}
   ;	
   ;		StartBonusFlash ();
   ;	
	call	near ptr _StartBonusFlash
   ;	
   ;		check->shapenum = -1;			// remove from list
   ;	
	mov	word ptr [si+4],65535
@21@770:
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_GetBonus	endp
@21@C2808	label	word
	dw	@21@650
	dw	@21@578
	dw	@21@98
	dw	@21@170
	dw	@21@170
	dw	@21@170
	dw	@21@170
	dw	@21@194
	dw	@21@218
	dw	@21@242
	dw	@21@266
	dw	@21@290
	dw	@21@362
	dw	@21@434
	dw	@21@458
	dw	@21@506
	dw	@21@482
	dw	@21@746
	dw	@21@722
   ;	
   ;	boolean TryMove (objtype *ob)
   ;	
	assume	cs:_TEXT
_TryMove	proc	near
	push	bp
	mov	bp,sp
	sub	sp,20
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{
   ;		int			xl,yl,xh,yh,x,y;
   ;		objtype		*check;
   ;		long		deltax,deltay;
   ;	
   ;		xl = (ob->x-PLAYERSIZE) >>TILESHIFT;
   ;	
	mov	ax,word ptr [di+17]
	mov	dx,word ptr [di+15]
	add	dx,43008
	adc	ax,65535
	cwd	
	mov	word ptr [bp-2],ax
   ;	
   ;		yl = (ob->y-PLAYERSIZE) >>TILESHIFT;
   ;	
	mov	ax,word ptr [di+21]
	mov	dx,word ptr [di+19]
	add	dx,43008
	adc	ax,65535
	cwd	
	mov	word ptr [bp-4],ax
   ;	
   ;	
   ;		xh = (ob->x+PLAYERSIZE) >>TILESHIFT;
   ;	
	mov	ax,word ptr [di+17]
	mov	dx,word ptr [di+15]
	add	dx,22528
	adc	ax,0
	cwd	
	mov	word ptr [bp-6],ax
   ;	
   ;		yh = (ob->y+PLAYERSIZE) >>TILESHIFT;
   ;	
	mov	ax,word ptr [di+21]
	mov	dx,word ptr [di+19]
	add	dx,22528
	adc	ax,0
	cwd	
	mov	word ptr [bp-8],ax
   ;	
   ;	
   ;	//
   ;	// check for solid walls
   ;	//
   ;		for (y=yl;y<=yh;y++)
   ;	
	mov	ax,word ptr [bp-4]
	mov	word ptr [bp-12],ax
	jmp	short @22@218
@22@50:
   ;	
   ;			for (x=xl;x<=xh;x++)
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr [bp-10],ax
	jmp	short @22@170
@22@74:
   ;	
   ;			{
   ;				check = actorat[x][y];
   ;	
	mov	bx,word ptr [bp-10]
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [bp-12]
	shl	ax,1
	add	bx,ax
	mov	si,word ptr DGROUP:_actorat[bx]
   ;	
   ;				if (check && check<objlist)
   ;	
	or	si,si
	je	short @22@146
	cmp	si,offset DGROUP:_objlist
	jae	short @22@146
   ;	
   ;					return false;
   ;	
	xor	ax,ax
	jmp	@22@1010
@22@146:
	inc	word ptr [bp-10]
@22@170:
	mov	ax,word ptr [bp-10]
	cmp	ax,word ptr [bp-6]
	jle	short @22@74
	inc	word ptr [bp-12]
@22@218:
	mov	ax,word ptr [bp-12]
	cmp	ax,word ptr [bp-8]
	jle	short @22@50
   ;	
   ;			}
   ;	
   ;	//
   ;	// check for actors
   ;	//
   ;		if (yl>0)
   ;	
	cmp	word ptr [bp-4],0
	jle	short @22@290
   ;	
   ;			yl--;
   ;	
	dec	word ptr [bp-4]
@22@290:
   ;	
   ;		if (yh<MAPSIZE-1)
   ;	
	cmp	word ptr [bp-8],63
	jge	short @22@338
   ;	
   ;			yh++;
   ;	
	inc	word ptr [bp-8]
@22@338:
   ;	
   ;		if (xl>0)
   ;	
	cmp	word ptr [bp-2],0
	jle	short @22@386
   ;	
   ;			xl--;
   ;	
	dec	word ptr [bp-2]
@22@386:
   ;	
   ;		if (xh<MAPSIZE-1)
   ;	
	cmp	word ptr [bp-6],63
	jge	short @22@434
   ;	
   ;			xh++;
   ;	
	inc	word ptr [bp-6]
@22@434:
   ;	
   ;	
   ;		for (y=yl;y<=yh;y++)
   ;	
	mov	ax,word ptr [bp-4]
	mov	word ptr [bp-12],ax
	jmp	@22@962
@22@458:
   ;	
   ;			for (x=xl;x<=xh;x++)
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr [bp-10],ax
	jmp	@22@914
@22@482:
   ;	
   ;			{
   ;				check = actorat[x][y];
   ;	
	mov	bx,word ptr [bp-10]
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [bp-12]
	shl	ax,1
	add	bx,ax
	mov	si,word ptr DGROUP:_actorat[bx]
   ;	
   ;				if (check > objlist
   ;	
   ;	
   ;				&& (check->flags & FL_SHOOTABLE) )
   ;	
	cmp	si,offset DGROUP:_objlist
	jbe	short @22@890
	test	byte ptr [si+8],1
	je	short @22@890
   ;	
   ;				{
   ;					deltax = ob->x - check->x;
   ;	
	mov	ax,word ptr [di+17]
	mov	dx,word ptr [di+15]
	sub	dx,word ptr [si+15]
	sbb	ax,word ptr [si+17]
	mov	word ptr [bp-16],dx
	mov	word ptr [bp-14],ax
   ;	
   ;					if (deltax < -MINACTORDIST || deltax > MINACTORDIST)
   ;	
	cmp	word ptr [bp-14],65535
	jl	short @22@674
	jne	short @22@602
	cmp	word ptr [bp-16],0
	jb	short @22@674
@22@602:
	cmp	word ptr [bp-14],1
	jl	short @22@698
	jg	short @22@674
	cmp	word ptr [bp-16],0
	jbe	short @22@698
@22@674:
   ;	
   ;						continue;
   ;	
	jmp	short @22@890
@22@698:
   ;	
   ;					deltay = ob->y - check->y;
   ;	
	mov	ax,word ptr [di+21]
	mov	dx,word ptr [di+19]
	sub	dx,word ptr [si+19]
	sbb	ax,word ptr [si+21]
	mov	word ptr [bp-20],dx
	mov	word ptr [bp-18],ax
   ;	
   ;					if (deltay < -MINACTORDIST || deltay > MINACTORDIST)
   ;	
	cmp	word ptr [bp-18],65535
	jl	short @22@842
	jne	short @22@770
	cmp	word ptr [bp-20],0
	jb	short @22@842
@22@770:
	cmp	word ptr [bp-18],1
	jl	short @22@866
	jg	short @22@842
	cmp	word ptr [bp-20],0
	jbe	short @22@866
@22@842:
   ;	
   ;						continue;
   ;	
	jmp	short @22@890
@22@866:
   ;	
   ;	
   ;					return false;
   ;	
	xor	ax,ax
	jmp	short @22@1010
@22@890:
	inc	word ptr [bp-10]
@22@914:
	mov	ax,word ptr [bp-10]
	cmp	ax,word ptr [bp-6]
	jg	@@3
	jmp	@22@482
@@3:
	inc	word ptr [bp-12]
@22@962:
	mov	ax,word ptr [bp-12]
	cmp	ax,word ptr [bp-8]
	jg	@@4
	jmp	@22@458
@@4:
   ;	
   ;				}
   ;			}
   ;	
   ;		return true;
   ;	
	mov	ax,1
	jmp	short @22@1010
@22@1010:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_TryMove	endp
   ;	
   ;	void ClipMove (objtype *ob, long xmove, long ymove)
   ;	
	assume	cs:_TEXT
_ClipMove	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		long	basex,basey;
   ;	
   ;		basex = ob->x;
   ;	
	mov	ax,word ptr [si+17]
	mov	dx,word ptr [si+15]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;		basey = ob->y;
   ;	
	mov	ax,word ptr [si+21]
	mov	dx,word ptr [si+19]
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;	
   ;		ob->x = basex+xmove;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	add	dx,word ptr [bp+6]
	adc	ax,word ptr [bp+8]
	mov	word ptr [si+15],dx
	mov	word ptr [si+17],ax
   ;	
   ;		ob->y = basey+ymove;
   ;	
	mov	ax,word ptr [bp-6]
	mov	dx,word ptr [bp-8]
	add	dx,word ptr [bp+10]
	adc	ax,word ptr [bp+12]
	mov	word ptr [si+19],dx
	mov	word ptr [si+21],ax
   ;	
   ;		if (TryMove (ob))
   ;	
	push	si
	call	near ptr _TryMove
	pop	cx
	or	ax,ax
	je	short @23@74
   ;	
   ;			return;
   ;	
	jmp	@23@578
@23@74:
   ;	
   ;	
   ;		if (noclip && ob->x > 2*TILEGLOBAL && ob->y > 2*TILEGLOBAL &&
   ;	
   ;	
   ;		ob->x < (((long)(mapwidth-1))<<TILESHIFT)
   ;		&& ob->y < (((long)(mapheight-1))<<TILESHIFT) )
   ;	
	cmp	word ptr DGROUP:_noclip,0
	je	short @23@410
	cmp	word ptr [si+17],2
	jl	short @23@410
	jg	short @23@170
	cmp	word ptr [si+15],0
	jbe	short @23@410
@23@170:
	cmp	word ptr [si+21],2
	jl	short @23@410
	jg	short @23@242
	cmp	word ptr [si+19],0
	jbe	short @23@410
@23@242:
	mov	ax,word ptr DGROUP:_mapwidth
	dec	ax
	xor	dx,dx
	cmp	ax,word ptr [si+17]
	jl	short @23@410
	jg	short @23@314
	cmp	dx,word ptr [si+15]
	jbe	short @23@410
@23@314:
	mov	ax,word ptr DGROUP:_mapheight
	dec	ax
	xor	dx,dx
	cmp	ax,word ptr [si+21]
	jl	short @23@410
	jg	short @23@386
	cmp	dx,word ptr [si+19]
	jbe	short @23@410
@23@386:
   ;	
   ;			return;		// walk through walls
   ;	
	jmp	short @23@578
@23@410:
   ;	
   ;	
   ;		if (!SD_SoundPlaying())
   ;	
	call	near ptr _SD_SoundPlaying
	or	ax,ax
	jne	short @23@458
   ;	
   ;			SD_PlaySound (HITWALLSND);
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
@23@458:
   ;	
   ;	
   ;		ob->x = basex+xmove;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	add	dx,word ptr [bp+6]
	adc	ax,word ptr [bp+8]
	mov	word ptr [si+15],dx
	mov	word ptr [si+17],ax
   ;	
   ;		ob->y = basey;
   ;	
	mov	ax,word ptr [bp-6]
	mov	dx,word ptr [bp-8]
	mov	word ptr [si+19],dx
	mov	word ptr [si+21],ax
   ;	
   ;		if (TryMove (ob))
   ;	
	push	si
	call	near ptr _TryMove
	pop	cx
	or	ax,ax
	je	short @23@506
   ;	
   ;			return;
   ;	
	jmp	short @23@578
@23@506:
   ;	
   ;	
   ;		ob->x = basex;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr [si+15],dx
	mov	word ptr [si+17],ax
   ;	
   ;		ob->y = basey+ymove;
   ;	
	mov	ax,word ptr [bp-6]
	mov	dx,word ptr [bp-8]
	add	dx,word ptr [bp+10]
	adc	ax,word ptr [bp+12]
	mov	word ptr [si+19],dx
	mov	word ptr [si+21],ax
   ;	
   ;		if (TryMove (ob))
   ;	
	push	si
	call	near ptr _TryMove
	pop	cx
	or	ax,ax
	je	short @23@554
   ;	
   ;			return;
   ;	
	jmp	short @23@578
@23@554:
   ;	
   ;	
   ;		ob->x = basex;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr [si+15],dx
	mov	word ptr [si+17],ax
   ;	
   ;		ob->y = basey;
   ;	
	mov	ax,word ptr [bp-6]
	mov	dx,word ptr [bp-8]
	mov	word ptr [si+19],dx
	mov	word ptr [si+21],ax
@23@578:
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_ClipMove	endp
   ;	
   ;	void VictoryTile (void)
   ;	
	assume	cs:_TEXT
_VictoryTile	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	#ifndef SPEAR
   ;		SpawnBJVictory ();
   ;	
	call	near ptr _SpawnBJVictory
   ;	
   ;	#endif
   ;	
   ;		gamestate.victoryflag = true;
   ;	
	mov	word ptr DGROUP:_gamestate+64,1
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_VictoryTile	endp
   ;	
   ;	void Thrust (int angle, long speed)
   ;	
	assume	cs:_TEXT
_Thrust	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
   ;	
   ;	{
   ;		long xmove,ymove;
   ;		long	slowmax;
   ;		unsigned	offset;
   ;	
   ;	
   ;		//
   ;		// ZERO FUNNY COUNTER IF MOVED!
   ;		//
   ;		#ifdef SPEAR
   ;		if (speed)
   ;			funnyticount = 0;
   ;		#endif
   ;	
   ;		thrustspeed += speed;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	add	word ptr DGROUP:_thrustspeed,dx
	adc	word ptr DGROUP:_thrustspeed+2,ax
   ;	
   ;	//
   ;	// moving bounds speed
   ;	//
   ;		if (speed >= MINDIST*2)
   ;	
	cmp	word ptr [bp+8],0
	jl	short @25@122
	jne	short @25@98
	cmp	word ptr [bp+6],45056
	jb	short @25@122
@25@98:
   ;	
   ;			speed = MINDIST*2-1;
   ;	
	mov	word ptr [bp+6],45055
	mov	word ptr [bp+8],0
@25@122:
   ;	
   ;	
   ;		xmove = FixedByFrac(speed,costable[angle]);
   ;	
	mov	ax,word ptr [bp+4]
	shl	ax,1
	shl	ax,1
	les	bx,dword ptr DGROUP:_costable
	add	bx,ax
	push	word ptr es:[bx+2]
	push	word ptr es:[bx]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	near ptr _FixedByFrac
	add	sp,8
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;		ymove = -FixedByFrac(speed,sintable[angle]);
   ;	
	mov	bx,word ptr [bp+4]
	shl	bx,1
	shl	bx,1
	mov	ax,seg _sintable
	mov	es,ax
	push	word ptr es:_sintable[bx+2]
	push	word ptr es:_sintable[bx]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	near ptr _FixedByFrac
	add	sp,8
	neg	dx
	neg	ax
	sbb	dx,0
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],dx
   ;	
   ;	
   ;		ClipMove(player,xmove,ymove);
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_player
	call	near ptr _ClipMove
	add	sp,10
   ;	
   ;	
   ;		player->tilex = player->x >> TILESHIFT;		// scale to tile values
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+17]
	cwd	
	mov	bx,word ptr DGROUP:_player
	mov	word ptr [bx+23],ax
   ;	
   ;		player->tiley = player->y >> TILESHIFT;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+21]
	cwd	
	mov	bx,word ptr DGROUP:_player
	mov	word ptr [bx+25],ax
   ;	
   ;	
   ;		offset = farmapylookup[player->tiley]+player->tilex;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	bx,word ptr [bx+25]
	shl	bx,1
	mov	ax,word ptr DGROUP:_farmapylookup[bx]
	mov	bx,word ptr DGROUP:_player
	add	ax,word ptr [bx+23]
	mov	si,ax
   ;	
   ;		player->areanumber = *(mapsegs[0] + offset) -AREATILE;
   ;	
	mov	bx,si
	shl	bx,1
	mov	es,word ptr DGROUP:_mapsegs
	mov	al,byte ptr es:[bx]
	sub	al,107
	mov	bx,word ptr DGROUP:_player
	mov	byte ptr [bx+27],al
   ;	
   ;	
   ;		if (*(mapsegs[1] + offset) == EXITTILE)
   ;	
	mov	bx,si
	shl	bx,1
	mov	es,word ptr DGROUP:_mapsegs+2
	cmp	word ptr es:[bx],99
	jne	short @25@170
   ;	
   ;			VictoryTile ();
   ;	
	call	near ptr _VictoryTile
@25@170:
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_Thrust	endp
   ;	
   ;	void Cmd_Fire (void)
   ;	
	assume	cs:_TEXT
_Cmd_Fire	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		buttonheld[bt_attack] = true;
   ;	
	mov	word ptr DGROUP:_buttonheld,1
   ;	
   ;	
   ;		gamestate.weaponframe = 0;
   ;	
	mov	word ptr DGROUP:_gamestate+36,0
   ;	
   ;	
   ;		player->state = &s_attack;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	word ptr [bx+6],offset DGROUP:_s_attack
   ;	
   ;	
   ;		gamestate.attackframe = 0;
   ;	
	mov	word ptr DGROUP:_gamestate+32,0
   ;	
   ;		gamestate.attackcount =
   ;	
   ;	
   ;			attackinfo[gamestate.weapon][gamestate.attackframe].tics;
   ;	
	mov	ax,word ptr DGROUP:_gamestate+26
	mov	dx,42
	imul	dx
	push	ax
	mov	ax,word ptr DGROUP:_gamestate+32
	mov	dx,3
	imul	dx
	pop	bx
	add	bx,ax
	mov	al,byte ptr DGROUP:_attackinfo[bx]
	cbw	
	mov	word ptr DGROUP:_gamestate+34,ax
   ;	
   ;		gamestate.weaponframe =
   ;	
   ;	
   ;			attackinfo[gamestate.weapon][gamestate.attackframe].frame;
   ;	
	mov	ax,word ptr DGROUP:_gamestate+26
	mov	dx,42
	imul	dx
	push	ax
	mov	ax,word ptr DGROUP:_gamestate+32
	mov	dx,3
	imul	dx
	pop	bx
	add	bx,ax
	mov	al,byte ptr DGROUP:_attackinfo[bx+2]
	cbw	
	mov	word ptr DGROUP:_gamestate+36,ax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_Cmd_Fire	endp
   ;	
   ;	void Cmd_Use (void)
   ;	
	assume	cs:_TEXT
_Cmd_Use	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
	push	di
   ;	
   ;	{
   ;		objtype 	*check;
   ;		int			checkx,checky,doornum,dir;
   ;		boolean		elevatorok;
   ;	
   ;	
   ;	//
   ;	// find which cardinal direction the player is facing
   ;	//
   ;		if (player->angle < ANGLES/8 || player->angle > 7*ANGLES/8)
   ;	
	mov	bx,word ptr DGROUP:_player
	cmp	word ptr [bx+40],45
	jl	short @27@74
	mov	bx,word ptr DGROUP:_player
	cmp	word ptr [bx+40],315
	jle	short @27@98
@27@74:
   ;	
   ;		{
   ;			checkx = player->tilex + 1;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+23]
	inc	ax
	mov	di,ax
   ;	
   ;			checky = player->tiley;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	si,word ptr [bx+25]
   ;	
   ;			dir = di_east;
   ;	
	mov	word ptr [bp-4],1
   ;	
   ;			elevatorok = true;
   ;	
	mov	word ptr [bp-6],1
   ;	
   ;		}
   ;	
	jmp	short @27@218
@27@98:
   ;	
   ;		else if (player->angle < 3*ANGLES/8)
   ;	
	mov	bx,word ptr DGROUP:_player
	cmp	word ptr [bx+40],135
	jge	short @27@146
   ;	
   ;		{
   ;			checkx = player->tilex;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	di,word ptr [bx+23]
   ;	
   ;			checky = player->tiley-1;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+25]
	dec	ax
	mov	si,ax
   ;	
   ;			dir = di_north;
   ;	
	mov	word ptr [bp-4],0
   ;	
   ;			elevatorok = false;
   ;	
	mov	word ptr [bp-6],0
   ;	
   ;		}
   ;	
	jmp	short @27@218
@27@146:
   ;	
   ;		else if (player->angle < 5*ANGLES/8)
   ;	
	mov	bx,word ptr DGROUP:_player
	cmp	word ptr [bx+40],225
	jge	short @27@194
   ;	
   ;		{
   ;			checkx = player->tilex - 1;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+23]
	dec	ax
	mov	di,ax
   ;	
   ;			checky = player->tiley;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	si,word ptr [bx+25]
   ;	
   ;			dir = di_west;
   ;	
	mov	word ptr [bp-4],3
   ;	
   ;			elevatorok = true;
   ;	
	mov	word ptr [bp-6],1
   ;	
   ;		}
   ;	
	jmp	short @27@218
@27@194:
   ;	
   ;		else
   ;		{
   ;			checkx = player->tilex;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	di,word ptr [bx+23]
   ;	
   ;			checky = player->tiley + 1;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+25]
	inc	ax
	mov	si,ax
   ;	
   ;			dir = di_south;
   ;	
	mov	word ptr [bp-4],2
   ;	
   ;			elevatorok = false;
   ;	
	mov	word ptr [bp-6],0
@27@218:
   ;	
   ;		}
   ;	
   ;		doornum = tilemap[checkx][checky];
   ;	
	mov	bx,di
	mov	cl,6
	shl	bx,cl
	mov	al,byte ptr DGROUP:_tilemap[bx+si]
	mov	ah,0
	mov	word ptr [bp-2],ax
   ;	
   ;		if (*(mapsegs[1]+farmapylookup[checky]+checkx) == PUSHABLETILE)
   ;	
	mov	bx,si
	shl	bx,1
	mov	bx,word ptr DGROUP:_farmapylookup[bx]
	shl	bx,1
	mov	es,word ptr DGROUP:_mapsegs+2
	mov	ax,di
	shl	ax,1
	add	bx,ax
	cmp	word ptr es:[bx],98
	jne	short @27@266
   ;	
   ;		{
   ;		//
   ;		// pushable wall
   ;		//
   ;	
   ;			PushWall (checkx,checky,dir);
   ;	
	push	word ptr [bp-4]
	push	si
	push	di
	call	near ptr _PushWall
	add	sp,6
   ;	
   ;			return;
   ;	
	jmp	@27@530
@27@266:
   ;	
   ;		}
   ;		if (!buttonheld[bt_use] && doornum == ELEVATORTILE && elevatorok)
   ;	
	cmp	word ptr DGROUP:_buttonheld+8,0
	jne	short @27@434
	cmp	word ptr [bp-2],21
	jne	short @27@434
	cmp	word ptr [bp-6],0
	je	short @27@434
   ;	
   ;		{
   ;		//
   ;		// use elevator
   ;		//
   ;			buttonheld[bt_use] = true;
   ;	
	mov	word ptr DGROUP:_buttonheld+8,1
   ;	
   ;	
   ;			tilemap[checkx][checky]++;		// flip switch
   ;	
	mov	bx,di
	mov	cl,6
	shl	bx,cl
	inc	byte ptr DGROUP:_tilemap[bx+si]
   ;	
   ;			if (*(mapsegs[0]+farmapylookup[player->tiley]+player->tilex) == ALTELEVATORTILE)
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	bx,word ptr [bx+25]
	shl	bx,1
	mov	bx,word ptr DGROUP:_farmapylookup[bx]
	shl	bx,1
	mov	es,word ptr DGROUP:_mapsegs
	push	bx
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+23]
	shl	ax,1
	pop	bx
	add	bx,ax
	cmp	word ptr es:[bx],107
	jne	short @27@386
   ;	
   ;				playstate = ex_secretlevel;
   ;	
	mov	word ptr DGROUP:_playstate,9
	jmp	short @27@410
@27@386:
   ;	
   ;			else
   ;				playstate = ex_completed;
   ;	
	mov	word ptr DGROUP:_playstate,1
@27@410:
   ;	
   ;			SD_PlaySound (LEVELDONESND);
   ;	
	mov	ax,40
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			SD_WaitSoundDone();
   ;	
	call	near ptr _SD_WaitSoundDone
   ;	
   ;		}
   ;	
	jmp	short @27@530
@27@434:
   ;	
   ;		else if (!buttonheld[bt_use] && doornum & 0x80)
   ;	
	cmp	word ptr DGROUP:_buttonheld+8,0
	jne	short @27@506
	test	word ptr [bp-2],128
	je	short @27@506
   ;	
   ;		{
   ;			buttonheld[bt_use] = true;
   ;	
	mov	word ptr DGROUP:_buttonheld+8,1
   ;	
   ;			OperateDoor (doornum & ~0x80);
   ;	
	mov	ax,word ptr [bp-2]
	and	ax,65407
	push	ax
	call	near ptr _OperateDoor
	pop	cx
   ;	
   ;		}
   ;	
	jmp	short @27@530
@27@506:
   ;	
   ;		else
   ;			SD_PlaySound (DONOTHINGSND);
   ;	
	mov	ax,20
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
@27@530:
   ;	
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_Cmd_Use	endp
   ;	
   ;	void SpawnPlayer (int tilex, int tiley, int dir)
   ;	
	assume	cs:_TEXT
_SpawnPlayer	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		player->obclass = playerobj;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	word ptr [bx+4],1
   ;	
   ;		player->active = true;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	word ptr [bx],1
   ;	
   ;		player->tilex = tilex;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bp+4]
	mov	word ptr [bx+23],ax
   ;	
   ;		player->tiley = tiley;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bp+6]
	mov	word ptr [bx+25],ax
   ;	
   ;		player->areanumber =
   ;	
   ;	
   ;			*(mapsegs[0] + farmapylookup[player->tiley]+player->tilex);
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	bx,word ptr [bx+25]
	shl	bx,1
	mov	bx,word ptr DGROUP:_farmapylookup[bx]
	shl	bx,1
	mov	es,word ptr DGROUP:_mapsegs
	mov	si,word ptr DGROUP:_player
	mov	ax,word ptr [si+23]
	shl	ax,1
	add	bx,ax
	mov	al,byte ptr es:[bx]
	mov	bx,word ptr DGROUP:_player
	mov	byte ptr [bx+27],al
   ;	
   ;		player->x = ((long)tilex<<TILESHIFT)+TILEGLOBAL/2;
   ;	
	mov	ax,word ptr [bp+4]
	cwd	
	xor	dx,dx
	add	dx,32768
	adc	ax,0
	mov	bx,word ptr DGROUP:_player
	mov	word ptr [bx+15],dx
	mov	word ptr [bx+17],ax
   ;	
   ;		player->y = ((long)tiley<<TILESHIFT)+TILEGLOBAL/2;
   ;	
	mov	ax,word ptr [bp+6]
	cwd	
	xor	dx,dx
	add	dx,32768
	adc	ax,0
	mov	bx,word ptr DGROUP:_player
	mov	word ptr [bx+19],dx
	mov	word ptr [bx+21],ax
   ;	
   ;		player->state = &s_player;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	word ptr [bx+6],offset DGROUP:_s_player
   ;	
   ;		player->angle = (1-dir)*90;
   ;	
	mov	ax,1
	sub	ax,word ptr [bp+8]
	mov	dx,90
	imul	dx
	mov	bx,word ptr DGROUP:_player
	mov	word ptr [bx+40],ax
   ;	
   ;		if (player->angle<0)
   ;	
	mov	bx,word ptr DGROUP:_player
	cmp	word ptr [bx+40],0
	jge	short @28@74
   ;	
   ;			player->angle += ANGLES;
   ;	
	mov	bx,word ptr DGROUP:_player
	add	word ptr [bx+40],360
@28@74:
   ;	
   ;		player->flags = FL_NEVERMARK;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	byte ptr [bx+8],4
   ;	
   ;		Thrust (0,0);				// set some variables
   ;	
	xor	ax,ax
	xor	dx,dx
	push	ax
	push	dx
	xor	ax,ax
	push	ax
	call	near ptr _Thrust
	add	sp,6
   ;	
   ;	
   ;		InitAreas ();
   ;	
	call	near ptr _InitAreas
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_SpawnPlayer	endp
   ;	
   ;	void	KnifeAttack (objtype *ob)
   ;	
	assume	cs:_TEXT
_KnifeAttack	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
   ;	
   ;	{
   ;		objtype *check,*closest;
   ;		long	dist;
   ;	
   ;		SD_PlaySound (ATKKNIFESND);
   ;	
	mov	ax,23
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;	// actually fire
   ;		dist = 0x7fffffff;
   ;	
	mov	word ptr [bp-4],65535
	mov	word ptr [bp-2],32767
   ;	
   ;		closest = NULL;
   ;	
	xor	di,di
   ;	
   ;		for (check=ob->next ; check ; check=check->next)
   ;	
	mov	bx,word ptr [bp+4]
	mov	si,word ptr [bx+54]
	jmp	short @29@242
@29@50:
   ;	
   ;			if ( (check->flags & FL_SHOOTABLE)
   ;	
   ;	
   ;			&& (check->flags & FL_VISABLE)
   ;			&& abs (check->viewx-centerx) < shootdelta
   ;			)
   ;	
	test	byte ptr [si+8],1
	je	short @29@218
	test	byte ptr [si+8],8
	je	short @29@218
	mov	ax,word ptr [si+28]
	sub	ax,word ptr DGROUP:_centerx
	cwd	
	xor	ax,dx
	sub	ax,dx
	cmp	ax,word ptr DGROUP:_shootdelta
	jge	short @29@218
   ;	
   ;			{
   ;				if (check->transx < dist)
   ;	
	mov	ax,word ptr [si+34]
	mov	dx,word ptr [si+32]
	cmp	ax,word ptr [bp-2]
	jg	short @29@218
	jl	short @29@194
	cmp	dx,word ptr [bp-4]
	jae	short @29@218
@29@194:
   ;	
   ;				{
   ;					dist = check->transx;
   ;	
	mov	ax,word ptr [si+34]
	mov	dx,word ptr [si+32]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;					closest = check;
   ;	
	mov	di,si
@29@218:
	mov	si,word ptr [si+54]
@29@242:
	or	si,si
	jne	short @29@50
   ;	
   ;				}
   ;			}
   ;	
   ;		if (!closest || dist> 0x18000l)
   ;	
	or	di,di
	je	short @29@362
	cmp	word ptr [bp-2],1
	jl	short @29@386
	jg	short @29@362
	cmp	word ptr [bp-4],32768
	jbe	short @29@386
@29@362:
   ;	
   ;		{
   ;		// missed
   ;	
   ;			return;
   ;	
	jmp	short @29@410
@29@386:
   ;	
   ;		}
   ;	
   ;	// hit something
   ;		DamageActor (closest,US_RndT() >> 4);
   ;	
	call	near ptr _US_RndT
	mov	cl,4
	sar	ax,cl
	push	ax
	push	di
	call	near ptr _DamageActor
	pop	cx
	pop	cx
@29@410:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_KnifeAttack	endp
   ;	
   ;	void	GunAttack (objtype *ob)
   ;	
	assume	cs:_TEXT
_GunAttack	proc	near
	push	bp
	mov	bp,sp
	sub	sp,14
	push	si
	push	di
   ;	
   ;	{
   ;		objtype *check,*closest,*oldclosest;
   ;		int		damage;
   ;		int		dx,dy,dist;
   ;		long	viewdist;
   ;	
   ;		switch (gamestate.weapon)
   ;	
	mov	ax,word ptr DGROUP:_gamestate+26
	cmp	ax,1
	je	short @30@146
	cmp	ax,2
	je	short @30@170
	cmp	ax,3
	je	short @30@194
	jmp	short @30@218
@30@146:
   ;	
   ;		{
   ;		case wp_pistol:
   ;			SD_PlaySound (ATKPISTOLSND);
   ;	
	mov	ax,24
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	short @30@218
@30@170:
   ;	
   ;		case wp_machinegun:
   ;			SD_PlaySound (ATKMACHINEGUNSND);
   ;	
	mov	ax,26
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	short @30@218
@30@194:
   ;	
   ;		case wp_chaingun:
   ;			SD_PlaySound (ATKGATLINGSND);
   ;	
	mov	ax,11
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	short @30@218
@30@218:
   ;	
   ;		}
   ;	
   ;		madenoise = true;
   ;	
	mov	word ptr DGROUP:_madenoise,1
   ;	
   ;	
   ;	//
   ;	// find potential targets
   ;	//
   ;		viewdist = 0x7fffffffl;
   ;	
	mov	word ptr [bp-14],65535
	mov	word ptr [bp-12],32767
   ;	
   ;		closest = NULL;
   ;	
	xor	di,di
@30@242:
   ;	
   ;	
   ;		while (1)
   ;		{
   ;			oldclosest = closest;
   ;	
	mov	word ptr [bp-2],di
   ;	
   ;	
   ;			for (check=ob->next ; check ; check=check->next)
   ;	
	mov	bx,word ptr [bp+4]
	mov	si,word ptr [bx+54]
	jmp	short @30@458
@30@266:
   ;	
   ;				if ( (check->flags & FL_SHOOTABLE)
   ;	
   ;	
   ;				&& (check->flags & FL_VISABLE)
   ;				&& abs (check->viewx-centerx) < shootdelta
   ;				)
   ;	
	test	byte ptr [si+8],1
	je	short @30@434
	test	byte ptr [si+8],8
	je	short @30@434
	mov	ax,word ptr [si+28]
	sub	ax,word ptr DGROUP:_centerx
	cwd	
	xor	ax,dx
	sub	ax,dx
	cmp	ax,word ptr DGROUP:_shootdelta
	jge	short @30@434
   ;	
   ;				{
   ;					if (check->transx < viewdist)
   ;	
	mov	ax,word ptr [si+34]
	mov	dx,word ptr [si+32]
	cmp	ax,word ptr [bp-12]
	jg	short @30@434
	jl	short @30@410
	cmp	dx,word ptr [bp-14]
	jae	short @30@434
@30@410:
   ;	
   ;					{
   ;						viewdist = check->transx;
   ;	
	mov	ax,word ptr [si+34]
	mov	dx,word ptr [si+32]
	mov	word ptr [bp-14],dx
	mov	word ptr [bp-12],ax
   ;	
   ;						closest = check;
   ;	
	mov	di,si
@30@434:
	mov	si,word ptr [si+54]
@30@458:
	or	si,si
	jne	short @30@266
   ;	
   ;					}
   ;				}
   ;	
   ;			if (closest == oldclosest)
   ;	
	cmp	di,word ptr [bp-2]
	jne	short @30@530
   ;	
   ;				return;						// no more targets, all missed
   ;	
	jmp	@30@866
@30@530:
   ;	
   ;	
   ;		//
   ;		// trace a line from player to enemey
   ;		//
   ;			if (CheckLine(closest))
   ;	
	push	di
	call	near ptr _CheckLine
	pop	cx
	or	ax,ax
	je	short @30@578
   ;	
   ;				break;
   ;	
	jmp	short @30@602
@30@578:
	jmp	short @30@242
@30@602:
   ;	
   ;	
   ;		}
   ;	
   ;	//
   ;	// hit something
   ;	//
   ;		dx = abs(closest->tilex - player->tilex);
   ;	
	mov	ax,word ptr [di+23]
	mov	bx,word ptr DGROUP:_player
	sub	ax,word ptr [bx+23]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	word ptr [bp-6],ax
   ;	
   ;		dy = abs(closest->tiley - player->tiley);
   ;	
	mov	ax,word ptr [di+25]
	mov	bx,word ptr DGROUP:_player
	sub	ax,word ptr [bx+25]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	word ptr [bp-8],ax
   ;	
   ;		dist = dx>dy ? dx:dy;
   ;	
	mov	ax,word ptr [bp-6]
	cmp	ax,word ptr [bp-8]
	jle	short @30@650
	mov	ax,word ptr [bp-6]
	jmp	short @30@674
@30@650:
	mov	ax,word ptr [bp-8]
@30@674:
	mov	word ptr [bp-10],ax
   ;	
   ;	
   ;		if (dist<2)
   ;	
	cmp	word ptr [bp-10],2
	jge	short @30@722
   ;	
   ;			damage = US_RndT() / 4;
   ;	
	call	near ptr _US_RndT
	mov	bx,4
	cwd	
	idiv	bx
	mov	word ptr [bp-4],ax
	jmp	short @30@842
@30@722:
   ;	
   ;		else if (dist<4)
   ;	
	cmp	word ptr [bp-10],4
	jge	short @30@770
   ;	
   ;			damage = US_RndT() / 6;
   ;	
	call	near ptr _US_RndT
	mov	bx,6
	cwd	
	idiv	bx
	mov	word ptr [bp-4],ax
	jmp	short @30@842
@30@770:
   ;	
   ;		else
   ;		{
   ;			if ( (US_RndT() / 12) < dist)		// missed
   ;	
	call	near ptr _US_RndT
	mov	bx,12
	cwd	
	idiv	bx
	cmp	ax,word ptr [bp-10]
	jge	short @30@818
   ;	
   ;				return;
   ;	
	jmp	short @30@866
@30@818:
   ;	
   ;			damage = US_RndT() / 6;
   ;	
	call	near ptr _US_RndT
	mov	bx,6
	cwd	
	idiv	bx
	mov	word ptr [bp-4],ax
@30@842:
   ;	
   ;		}
   ;	
   ;		DamageActor (closest,damage);
   ;	
	push	word ptr [bp-4]
	push	di
	call	near ptr _DamageActor
	pop	cx
	pop	cx
@30@866:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_GunAttack	endp
   ;	
   ;	void VictorySpin (void)
   ;	
	assume	cs:_TEXT
_VictorySpin	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;	{
   ;		long	desty;
   ;	
   ;		if (player->angle > 270)
   ;	
	mov	bx,word ptr DGROUP:_player
	cmp	word ptr [bx+40],270
	jle	short @31@122
   ;	
   ;		{
   ;			player->angle -= tics * 3;
   ;	
	mov	ax,word ptr DGROUP:_tics
	mov	dx,3
	imul	dx
	mov	bx,word ptr DGROUP:_player
	mov	dx,word ptr [bx+40]
	sub	dx,ax
	mov	bx,word ptr DGROUP:_player
	mov	word ptr [bx+40],dx
   ;	
   ;			if (player->angle < 270)
   ;	
	mov	bx,word ptr DGROUP:_player
	cmp	word ptr [bx+40],270
	jge	short @31@98
   ;	
   ;				player->angle = 270;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	word ptr [bx+40],270
@31@98:
   ;	
   ;		}
   ;	
	jmp	short @31@194
@31@122:
   ;	
   ;		else if (player->angle < 270)
   ;	
	mov	bx,word ptr DGROUP:_player
	cmp	word ptr [bx+40],270
	jge	short @31@194
   ;	
   ;		{
   ;			player->angle += tics * 3;
   ;	
	mov	ax,word ptr DGROUP:_tics
	mov	dx,3
	imul	dx
	mov	bx,word ptr DGROUP:_player
	mov	dx,word ptr [bx+40]
	add	dx,ax
	mov	bx,word ptr DGROUP:_player
	mov	word ptr [bx+40],dx
   ;	
   ;			if (player->angle > 270)
   ;	
	mov	bx,word ptr DGROUP:_player
	cmp	word ptr [bx+40],270
	jle	short @31@194
   ;	
   ;				player->angle = 270;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	word ptr [bx+40],270
@31@194:
   ;	
   ;		}
   ;	
   ;		desty = (((long)player->tiley-5)<<TILESHIFT)-0x3000;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+25]
	xor	dx,dx
	add	ax,65531
	adc	dx,65535
	xor	dx,dx
	add	dx,53248
	adc	ax,65535
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;		if (player->y > desty)
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+21]
	mov	dx,word ptr [bx+19]
	cmp	ax,word ptr [bp-2]
	jl	short @31@362
	jg	short @31@266
	cmp	dx,word ptr [bp-4]
	jbe	short @31@362
@31@266:
   ;	
   ;		{
   ;			player->y -= tics*4096;
   ;	
	mov	ax,word ptr DGROUP:_tics
	mov	cl,12
	shl	ax,cl
	mov	bx,word ptr DGROUP:_player
	sub	word ptr [bx+19],ax
	sbb	word ptr [bx+21],0
   ;	
   ;			if (player->y < desty)
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+21]
	mov	dx,word ptr [bx+19]
	cmp	ax,word ptr [bp-2]
	jg	short @31@362
	jl	short @31@338
	cmp	dx,word ptr [bp-4]
	jae	short @31@362
@31@338:
   ;	
   ;				player->y = desty;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bp-2]
	mov	dx,word ptr [bp-4]
	mov	word ptr [bx+19],dx
	mov	word ptr [bx+21],ax
@31@362:
   ;	
   ;		}
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_VictorySpin	endp
   ;	
   ;	void	T_Attack (objtype *ob)
   ;	
	assume	cs:_TEXT
_T_Attack	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
   ;	
   ;	{
   ;		struct	atkinf	*cur;
   ;	
   ;		UpdateFace ();
   ;	
	call	near ptr _UpdateFace
   ;	
   ;	
   ;		if (gamestate.victoryflag)		// watching the BJ actor
   ;	
	cmp	word ptr DGROUP:_gamestate+64,0
	je	short @32@74
   ;	
   ;		{
   ;			VictorySpin ();
   ;	
	call	near ptr _VictorySpin
   ;	
   ;			return;
   ;	
	jmp	@32@842
@32@74:
   ;	
   ;		}
   ;	
   ;		if ( buttonstate[bt_use] && !buttonheld[bt_use] )
   ;	
	cmp	word ptr DGROUP:_buttonstate+8,0
	je	short @32@146
	cmp	word ptr DGROUP:_buttonheld+8,0
	jne	short @32@146
   ;	
   ;			buttonstate[bt_use] = false;
   ;	
	mov	word ptr DGROUP:_buttonstate+8,0
@32@146:
   ;	
   ;	
   ;		if ( buttonstate[bt_attack] && !buttonheld[bt_attack])
   ;	
	cmp	word ptr DGROUP:_buttonstate,0
	je	short @32@218
	cmp	word ptr DGROUP:_buttonheld,0
	jne	short @32@218
   ;	
   ;			buttonstate[bt_attack] = false;
   ;	
	mov	word ptr DGROUP:_buttonstate,0
@32@218:
   ;	
   ;	
   ;		ControlMovement (ob);
   ;	
	push	di
	call	near ptr _ControlMovement
	pop	cx
   ;	
   ;		if (gamestate.victoryflag)		// watching the BJ actor
   ;	
	cmp	word ptr DGROUP:_gamestate+64,0
	je	short @32@266
   ;	
   ;			return;
   ;	
	jmp	@32@842
@32@266:
   ;	
   ;	
   ;		plux = player->x >> UNSIGNEDSHIFT;			// scale to fit in unsigned
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	dx,word ptr [bx+17]
	mov	ax,word ptr [bx+15]
	mov	cl,8
	call	near ptr N_LXRSH@
	mov	word ptr DGROUP:_plux,ax
   ;	
   ;		pluy = player->y >> UNSIGNEDSHIFT;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	dx,word ptr [bx+21]
	mov	ax,word ptr [bx+19]
	mov	cl,8
	call	near ptr N_LXRSH@
	mov	word ptr DGROUP:_pluy,ax
   ;	
   ;		player->tilex = player->x >> TILESHIFT;		// scale to tile values
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+17]
	cwd	
	mov	bx,word ptr DGROUP:_player
	mov	word ptr [bx+23],ax
   ;	
   ;		player->tiley = player->y >> TILESHIFT;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+21]
	cwd	
	mov	bx,word ptr DGROUP:_player
	mov	word ptr [bx+25],ax
   ;	
   ;	
   ;	//
   ;	// change frame and fire
   ;	//
   ;		gamestate.attackcount -= tics;
   ;	
	mov	ax,word ptr DGROUP:_gamestate+34
	sub	ax,word ptr DGROUP:_tics
	mov	word ptr DGROUP:_gamestate+34,ax
	jmp	@32@818
@32@290:
   ;	
   ;		while (gamestate.attackcount <= 0)
   ;		{
   ;			cur = &attackinfo[gamestate.weapon][gamestate.attackframe];
   ;	
	mov	ax,word ptr DGROUP:_gamestate+26
	mov	dx,42
	imul	dx
	push	ax
	mov	ax,word ptr DGROUP:_gamestate+32
	mov	dx,3
	imul	dx
	pop	dx
	add	dx,ax
	add	dx,offset DGROUP:_attackinfo
	mov	si,dx
   ;	
   ;			switch (cur->attack)
   ;	
	mov	al,byte ptr [si+1]
	cbw	
	inc	ax
	mov	bx,ax
	cmp	bx,5
	jbe	@@5
	jmp	@32@794
@@5:
	shl	bx,1
	jmp	word ptr cs:@32@C2716[bx]
@32@386:
   ;	
   ;			{
   ;			case -1:
   ;				ob->state = &s_player;
   ;	
	mov	word ptr [di+6],offset DGROUP:_s_player
   ;	
   ;				if (!gamestate.ammo)
   ;	
	cmp	word ptr DGROUP:_gamestate+20,0
	jne	short @32@434
   ;	
   ;				{
   ;					gamestate.weapon = wp_knife;
   ;	
	mov	word ptr DGROUP:_gamestate+26,0
   ;	
   ;					DrawWeapon ();
   ;	
	call	near ptr _DrawWeapon
   ;	
   ;				}
   ;	
	jmp	short @32@482
@32@434:
   ;	
   ;				else
   ;				{
   ;					if (gamestate.weapon != gamestate.chosenweapon)
   ;	
	mov	ax,word ptr DGROUP:_gamestate+26
	cmp	ax,word ptr DGROUP:_gamestate+28
	je	short @32@482
   ;	
   ;					{
   ;						gamestate.weapon = gamestate.chosenweapon;
   ;	
	mov	ax,word ptr DGROUP:_gamestate+28
	mov	word ptr DGROUP:_gamestate+26,ax
   ;	
   ;						DrawWeapon ();
   ;	
	call	near ptr _DrawWeapon
@32@482:
   ;	
   ;					}
   ;				};
   ;				gamestate.attackframe = gamestate.weaponframe = 0;
   ;	
	xor	ax,ax
	mov	word ptr DGROUP:_gamestate+36,ax
	mov	word ptr DGROUP:_gamestate+32,ax
   ;	
   ;				return;
   ;	
	jmp	@32@842
@32@506:
   ;	
   ;	
   ;			case 4:
   ;				if (!gamestate.ammo)
   ;	
	cmp	word ptr DGROUP:_gamestate+20,0
	jne	short @32@554
   ;	
   ;					break;
   ;	
	jmp	short @32@794
@32@554:
   ;	
   ;				if (buttonstate[bt_attack])
   ;	
	cmp	word ptr DGROUP:_buttonstate,0
	je	short @32@602
   ;	
   ;					gamestate.attackframe -= 2;
   ;	
	sub	word ptr DGROUP:_gamestate+32,2
@32@602:
   ;	
   ;			case 1:
   ;				if (!gamestate.ammo)
   ;	
	cmp	word ptr DGROUP:_gamestate+20,0
	jne	short @32@650
   ;	
   ;				{	// can only happen with chain gun
   ;					gamestate.attackframe++;
   ;	
	inc	word ptr DGROUP:_gamestate+32
   ;	
   ;					break;
   ;	
	jmp	short @32@794
@32@650:
   ;	
   ;				}
   ;				GunAttack (ob);
   ;	
	push	di
	call	near ptr _GunAttack
	pop	cx
   ;	
   ;				gamestate.ammo--;
   ;	
	dec	word ptr DGROUP:_gamestate+20
   ;	
   ;				DrawAmmo ();
   ;	
	call	near ptr _DrawAmmo
   ;	
   ;				break;
   ;	
	jmp	short @32@794
@32@674:
   ;	
   ;	
   ;			case 2:
   ;				KnifeAttack (ob);
   ;	
	push	di
	call	near ptr _KnifeAttack
	pop	cx
   ;	
   ;				break;
   ;	
	jmp	short @32@794
@32@698:
   ;	
   ;	
   ;			case 3:
   ;				if (gamestate.ammo && buttonstate[bt_attack])
   ;	
	cmp	word ptr DGROUP:_gamestate+20,0
	je	short @32@770
	cmp	word ptr DGROUP:_buttonstate,0
	je	short @32@770
   ;	
   ;					gamestate.attackframe -= 2;
   ;	
	sub	word ptr DGROUP:_gamestate+32,2
@32@770:
   ;	
   ;				break;
   ;	
	jmp	short @32@794
@32@794:
   ;	
   ;			}
   ;	
   ;			gamestate.attackcount += cur->tics;
   ;	
	mov	al,byte ptr [si]
	cbw	
	add	word ptr DGROUP:_gamestate+34,ax
   ;	
   ;			gamestate.attackframe++;
   ;	
	inc	word ptr DGROUP:_gamestate+32
   ;	
   ;			gamestate.weaponframe =
   ;	
   ;	
   ;				attackinfo[gamestate.weapon][gamestate.attackframe].frame;
   ;	
	mov	ax,word ptr DGROUP:_gamestate+26
	mov	dx,42
	imul	dx
	push	ax
	mov	ax,word ptr DGROUP:_gamestate+32
	mov	dx,3
	imul	dx
	pop	bx
	add	bx,ax
	mov	al,byte ptr DGROUP:_attackinfo[bx+2]
	cbw	
	mov	word ptr DGROUP:_gamestate+36,ax
@32@818:
	cmp	word ptr DGROUP:_gamestate+34,0
	jg	@@6
	jmp	@32@290
@@6:
@32@842:
   ;	
   ;		}
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_T_Attack	endp
@32@C2716	label	word
	dw	@32@386
	dw	@32@794
	dw	@32@602
	dw	@32@674
	dw	@32@698
	dw	@32@506
   ;	
   ;	void	T_Player (objtype *ob)
   ;	
	assume	cs:_TEXT
_T_Player	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		if (gamestate.victoryflag)		// watching the BJ actor
   ;	
	cmp	word ptr DGROUP:_gamestate+64,0
	je	short @33@74
   ;	
   ;		{
   ;			VictorySpin ();
   ;	
	call	near ptr _VictorySpin
   ;	
   ;			return;
   ;	
	jmp	short @33@266
@33@74:
   ;	
   ;		}
   ;	
   ;		UpdateFace ();
   ;	
	call	near ptr _UpdateFace
   ;	
   ;		CheckWeaponChange ();
   ;	
	call	near ptr _CheckWeaponChange
   ;	
   ;	
   ;		if ( buttonstate[bt_use] )
   ;	
	cmp	word ptr DGROUP:_buttonstate+8,0
	je	short @33@122
   ;	
   ;			Cmd_Use ();
   ;	
	call	near ptr _Cmd_Use
@33@122:
   ;	
   ;	
   ;		if ( buttonstate[bt_attack] && !buttonheld[bt_attack])
   ;	
	cmp	word ptr DGROUP:_buttonstate,0
	je	short @33@194
	cmp	word ptr DGROUP:_buttonheld,0
	jne	short @33@194
   ;	
   ;			Cmd_Fire ();
   ;	
	call	near ptr _Cmd_Fire
@33@194:
   ;	
   ;	
   ;		ControlMovement (ob);
   ;	
	push	word ptr [bp+4]
	call	near ptr _ControlMovement
	pop	cx
   ;	
   ;		if (gamestate.victoryflag)		// watching the BJ actor
   ;	
	cmp	word ptr DGROUP:_gamestate+64,0
	je	short @33@242
   ;	
   ;			return;
   ;	
	jmp	short @33@266
@33@242:
   ;	
   ;	
   ;	
   ;		plux = player->x >> UNSIGNEDSHIFT;			// scale to fit in unsigned
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	dx,word ptr [bx+17]
	mov	ax,word ptr [bx+15]
	mov	cl,8
	call	near ptr N_LXRSH@
	mov	word ptr DGROUP:_plux,ax
   ;	
   ;		pluy = player->y >> UNSIGNEDSHIFT;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	dx,word ptr [bx+21]
	mov	ax,word ptr [bx+19]
	mov	cl,8
	call	near ptr N_LXRSH@
	mov	word ptr DGROUP:_pluy,ax
   ;	
   ;		player->tilex = player->x >> TILESHIFT;		// scale to tile values
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+17]
	cwd	
	mov	bx,word ptr DGROUP:_player
	mov	word ptr [bx+23],ax
   ;	
   ;		player->tiley = player->y >> TILESHIFT;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+21]
	cwd	
	mov	bx,word ptr DGROUP:_player
	mov	word ptr [bx+25],ax
@33@266:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_T_Player	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_plux	label	word
	db	2 dup (?)
_pluy	label	word
	db	2 dup (?)
_gotgatgun	label	word
	db	2 dup (?)
_thrustspeed	label	word
	db	4 dup (?)
_running	label	word
	db	2 dup (?)
_playerxmove	label	word
	db	4 dup (?)
_playerymove	label	word
	db	4 dup (?)
_menuitems	label	word
	db	2 dup (?)
_facecount	label	word
	db	2 dup (?)
_LastAttacker	label	word
	db	2 dup (?)
_anglefrac	label	word
	db	2 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	extrn	_StartDamageFlash:near
	extrn	_objlist:word
	public	_TryMove
	extrn	_SD_WaitSoundDone:near
	extrn	_buttonstate:word
	public	_CheckWeaponChange
	public	_DrawAmmo
	public	_DrawLives
	public	_DrawLevel
	extrn	_StartBonusFlash:near
	public	_anglefrac
	extrn	_LatchDrawPic:near
	extrn	_InitAreas:near
	extrn	_SD_SoundPlaying:near
	extrn	_DamageActor:near
	public	_VictoryTile
	public	_LastAttacker
	public	_GivePoints
	extrn	_SpawnBJVictory:near
	public	_VictorySpin
	public	_DrawFace
	public	_GiveExtraMan
	extrn	_gamestate:word
	extrn	_madenoise:word
	extrn	_buttonheld:word
	public	_GiveWeapon
	public	_LatchNumber
	public	_facecount
	public	_menuitems
	extrn	_FixedByFrac:near
	extrn	_mapwidth:word
	public	_TakeDamage
	public	_GetBonus
	extrn	_mapheight:word
	public	_playerymove
	public	_playerxmove
	public	_StatusDrawPic
	public	_Cmd_Fire
	extrn	_sintable:word
	extrn	_bufferofs:word
	extrn	_SD_PlaySound:near
	extrn	_killerobj:word
	extrn	_centerx:word
	extrn	_PushWall:near
	public	_GiveAmmo
	public	_HealSelf
	public	_running
	public	_GunAttack
	public	_Cmd_Use
	extrn	_shootdelta:word
	extrn	_OperateDoor:near
	public	_ControlMovement
	extrn	_mapsegs:word
	public	_thrustspeed
	extrn	_spearangle:word
	extrn	_playstate:word
	extrn	_tilemap:byte
	public	_SpawnPlayer
	public	_GiveKey
	public	_attackinfo
	public	_ClipMove
	extrn	_CheckLine:near
	public	_UpdateFace
	extrn	_spearflag:word
	extrn	_tics:word
	extrn	_speary:word
	extrn	_spearx:word
	public	_Thrust
	public	_gotgatgun
	extrn	_strlen:near
	public	_pluy
	public	_plux
	extrn	_player:word
	extrn	_ltoa:near
	extrn	_controly:word
	extrn	_controlx:word
	extrn	_costable:dword
	extrn	N_LXMUL@:far
	public	_s_player
	extrn	N_LXRSH@:far
	public	_s_attack
	public	_T_Player
	public	_T_Attack
	public	_DrawHealth
	extrn	_farmapylookup:word
	extrn	_godmode:word
	public	_DrawWeapon
	extrn	_noclip:word
	extrn	_US_RndT:near
	extrn	_actorat:word
	public	_KnifeAttack
	public	_DrawScore
	public	_DrawKeys
	end
