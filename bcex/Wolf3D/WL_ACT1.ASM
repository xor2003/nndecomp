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
	?debug	S "c:\wl_act1.c"
	?debug	C E9E551FE7C0C633A5C776C5F616374312E63
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
_statinfo	label	word
	db	2
	db	0
	db	2 dup (0)
	db	3
	db	0
	db	1
	db	0
	db	4
	db	0
	db	1
	db	0
	db	5
	db	0
	db	1
	db	0
	db	6
	db	0
	db	2 dup (0)
	db	7
	db	0
	db	1
	db	0
	db	8
	db	0
	db	3
	db	0
	db	9
	db	0
	db	1
	db	0
	db	10
	db	0
	db	1
	db	0
	db	11
	db	0
	db	2 dup (0)
	db	12
	db	0
	db	1
	db	0
	db	13
	db	0
	db	1
	db	0
	db	14
	db	0
	db	1
	db	0
	db	15
	db	0
	db	1
	db	0
	db	16
	db	0
	db	2 dup (0)
	db	17
	db	0
	db	2 dup (0)
	db	18
	db	0
	db	1
	db	0
	db	19
	db	0
	db	1
	db	0
	db	20
	db	0
	db	1
	db	0
	db	21
	db	0
	db	2 dup (0)
	db	22
	db	0
	db	5
	db	0
	db	23
	db	0
	db	6
	db	0
	db	24
	db	0
	db	1
	db	0
	db	25
	db	0
	db	2 dup (0)
	db	26
	db	0
	db	17
	db	0
	db	27
	db	0
	db	4
	db	0
	db	28
	db	0
	db	13
	db	0
	db	29
	db	0
	db	15
	db	0
	db	30
	db	0
	db	16
	db	0
	db	31
	db	0
	db	9
	db	0
	db	32
	db	0
	db	10
	db	0
	db	33
	db	0
	db	11
	db	0
	db	34
	db	0
	db	12
	db	0
	db	35
	db	0
	db	18
	db	0
	db	36
	db	0
	db	2
	db	0
	db	37
	db	0
	db	1
	db	0
	db	38
	db	0
	db	1
	db	0
	db	39
	db	0
	db	1
	db	0
	db	40
	db	0
	db	2
	db	0
	db	41
	db	0
	db	1
	db	0
	db	42
	db	0
	db	1
	db	0
	db	43
	db	0
	db	2 dup (0)
	db	44
	db	0
	db	2 dup (0)
	db	45
	db	0
	db	2 dup (0)
	db	46
	db	0
	db	2 dup (0)
	db	47
	db	0
	db	1
	db	0
	db	48
	db	0
	db	1
	db	0
	db	49
	db	0
	db	2 dup (0)
	db	28
	db	0
	db	14
	db	0
	db	255
	db	255
	db	2 dup (0)
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void InitStaticList (void)
   ;	
	assume	cs:_TEXT
_InitStaticList	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		laststatobj = &statobjlist[0];
   ;	
	mov	word ptr DGROUP:_laststatobj,offset DGROUP:_statobjlist
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_InitStaticList	endp
   ;	
   ;	void SpawnStatic (int tilex, int tiley, int type)
   ;	
	assume	cs:_TEXT
_SpawnStatic	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+8]
   ;	
   ;	{
   ;		laststatobj->shapenum = statinfo[type].picnum;
   ;	
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	ax,word ptr DGROUP:_statinfo[bx]
	mov	bx,word ptr DGROUP:_laststatobj
	mov	word ptr [bx+4],ax
   ;	
   ;		laststatobj->tilex = tilex;
   ;	
	mov	bx,word ptr DGROUP:_laststatobj
	mov	al,byte ptr [bp+4]
	mov	byte ptr [bx],al
   ;	
   ;		laststatobj->tiley = tiley;
   ;	
	mov	bx,word ptr DGROUP:_laststatobj
	mov	al,byte ptr [bp+6]
	mov	byte ptr [bx+1],al
   ;	
   ;		laststatobj->visspot = &spotvis[tilex][tiley];
   ;	
	mov	ax,word ptr [bp+4]
	mov	cl,6
	shl	ax,cl
	add	ax,word ptr [bp+6]
	add	ax,offset DGROUP:_spotvis
	mov	bx,word ptr DGROUP:_laststatobj
	mov	word ptr [bx+2],ax
   ;	
   ;	
   ;		switch (statinfo[type].type)
   ;	
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	bx,word ptr DGROUP:_statinfo[bx+2]
	cmp	bx,20
	ja	short @2@242
	shl	bx,1
	jmp	word ptr cs:@2@C1796[bx]
@2@122:
   ;	
   ;		{
   ;		case block:
   ;			(unsigned)actorat[tilex][tiley] = 1;		// consider it a blocking tile
   ;	
	mov	bx,word ptr [bp+4]
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [bp+6]
	shl	ax,1
	add	bx,ax
	mov	word ptr DGROUP:_actorat[bx],1
@2@146:
   ;	
   ;		case dressing:
   ;			laststatobj->flags = 0;
   ;	
	mov	bx,word ptr DGROUP:_laststatobj
	mov	byte ptr [bx+6],0
   ;	
   ;			break;
   ;	
	jmp	short @2@242
@2@170:
   ;	
   ;	
   ;		case	bo_cross:
   ;		case	bo_chalice:
   ;		case	bo_bible:
   ;		case	bo_crown:
   ;		case	bo_fullheal:
   ;			if (!loadedgame)
   ;	
	cmp	word ptr DGROUP:_loadedgame,0
	jne	short @2@218
   ;	
   ;			  gamestate.treasuretotal++;
   ;	
	inc	word ptr DGROUP:_gamestate+48
@2@218:
   ;	
   ;	
   ;		case	bo_firstaid:
   ;		case	bo_key1:
   ;		case	bo_key2:
   ;		case	bo_key3:
   ;		case	bo_key4:
   ;		case	bo_clip:
   ;		case	bo_25clip:
   ;		case	bo_machinegun:
   ;		case	bo_chaingun:
   ;		case	bo_food:
   ;		case	bo_alpo:
   ;		case	bo_gibs:
   ;		case	bo_spear:
   ;			laststatobj->flags = FL_BONUS;
   ;	
	mov	bx,word ptr DGROUP:_laststatobj
	mov	byte ptr [bx+6],2
   ;	
   ;			laststatobj->itemnumber = statinfo[type].type;
   ;	
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	al,byte ptr DGROUP:_statinfo[bx+2]
	mov	bx,word ptr DGROUP:_laststatobj
	mov	byte ptr [bx+7],al
   ;	
   ;			break;
   ;	
	jmp	short @2@242
@2@242:
   ;	
   ;		}
   ;	
   ;		laststatobj++;
   ;	
	add	word ptr DGROUP:_laststatobj,8
   ;	
   ;	
   ;		if (laststatobj == &statobjlist[MAXSTATS])
   ;	
	cmp	word ptr DGROUP:_laststatobj,offset DGROUP:_statobjlist+3200
	jne	short @2@290
   ;	
   ;			Quit ("Too many static objects!\n");
   ;	
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _Quit
	pop	cx
@2@290:
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_SpawnStatic	endp
@2@C1796	label	word
	dw	@2@146
	dw	@2@122
	dw	@2@218
	dw	@2@218
	dw	@2@218
	dw	@2@218
	dw	@2@218
	dw	@2@218
	dw	@2@218
	dw	@2@170
	dw	@2@170
	dw	@2@170
	dw	@2@170
	dw	@2@218
	dw	@2@242
	dw	@2@218
	dw	@2@218
	dw	@2@218
	dw	@2@170
	dw	@2@218
	dw	@2@218
   ;	
   ;	void PlaceItemType (int itemtype, int tilex, int tiley)
   ;	
	assume	cs:_TEXT
_PlaceItemType	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		int			type;
   ;		statobj_t	*spot;
   ;	
   ;	//
   ;	// find the item number
   ;	//
   ;		for (type=0 ;  ; type++)
   ;	
	xor	di,di
@3@50:
   ;	
   ;		{
   ;			if (statinfo[type].picnum == -1)		// end of list
   ;	
	mov	bx,di
	shl	bx,1
	shl	bx,1
	cmp	word ptr DGROUP:_statinfo[bx],65535
	jne	short @3@98
   ;	
   ;				Quit ("PlaceItemType: couldn't find type!");
   ;	
	mov	ax,offset DGROUP:s@+26
	push	ax
	call	near ptr _Quit
	pop	cx
@3@98:
   ;	
   ;			if (statinfo[type].type == itemtype)
   ;	
	mov	bx,di
	shl	bx,1
	shl	bx,1
	mov	ax,word ptr DGROUP:_statinfo[bx+2]
	cmp	ax,word ptr [bp+4]
	jne	short @3@146
   ;	
   ;				break;
   ;	
	jmp	short @3@170
@3@146:
	inc	di
	jmp	short @3@50
@3@170:
   ;	
   ;		}
   ;	
   ;	//
   ;	// find a spot in statobjlist to put it in
   ;	//
   ;		for (spot=&statobjlist[0] ; ; spot++)
   ;	
	mov	si,offset DGROUP:_statobjlist
@3@194:
   ;	
   ;		{
   ;			if (spot==laststatobj)
   ;	
	cmp	si,word ptr DGROUP:_laststatobj
	jne	short @3@290
   ;	
   ;			{
   ;				if (spot == &statobjlist[MAXSTATS])
   ;	
	cmp	si,offset DGROUP:_statobjlist+3200
	jne	short @3@266
   ;	
   ;					return;							// no free spots
   ;	
	jmp	short @3@386
@3@266:
   ;	
   ;				laststatobj++;						// space at end
   ;	
	add	word ptr DGROUP:_laststatobj,8
   ;	
   ;				break;
   ;	
	jmp	short @3@362
@3@290:
   ;	
   ;			}
   ;	
   ;			if (spot->shapenum == -1)				// -1 is a free spot
   ;	
	cmp	word ptr [si+4],65535
	jne	short @3@338
   ;	
   ;				break;
   ;	
	jmp	short @3@362
@3@338:
	add	si,8
	jmp	short @3@194
@3@362:
   ;	
   ;		}
   ;	//
   ;	// place it
   ;	//
   ;		spot->shapenum = statinfo[type].picnum;
   ;	
	mov	bx,di
	shl	bx,1
	shl	bx,1
	mov	ax,word ptr DGROUP:_statinfo[bx]
	mov	word ptr [si+4],ax
   ;	
   ;		spot->tilex = tilex;
   ;	
	mov	al,byte ptr [bp+6]
	mov	byte ptr [si],al
   ;	
   ;		spot->tiley = tiley;
   ;	
	mov	al,byte ptr [bp+8]
	mov	byte ptr [si+1],al
   ;	
   ;		spot->visspot = &spotvis[tilex][tiley];
   ;	
	mov	ax,word ptr [bp+6]
	mov	cl,6
	shl	ax,cl
	add	ax,word ptr [bp+8]
	add	ax,offset DGROUP:_spotvis
	mov	word ptr [si+2],ax
   ;	
   ;		spot->flags = FL_BONUS;
   ;	
	mov	byte ptr [si+6],2
   ;	
   ;		spot->itemnumber = statinfo[type].type;
   ;	
	mov	bx,di
	shl	bx,1
	shl	bx,1
	mov	al,byte ptr DGROUP:_statinfo[bx+2]
	mov	byte ptr [si+7],al
@3@386:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_PlaceItemType	endp
   ;	
   ;	void RecursiveConnect (int areanumber)
   ;	
	assume	cs:_TEXT
_RecursiveConnect	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int	i;
   ;	
   ;		for (i=0;i<NUMAREAS;i++)
   ;	
	xor	si,si
	jmp	short @4@146
@4@50:
   ;	
   ;		{
   ;			if (areaconnect[areanumber][i] && !areabyplayer[i])
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,37
	imul	dx
	mov	dx,seg _areaconnect
	mov	bx,ax
	mov	es,dx
	cmp	byte ptr es:_areaconnect[bx+si],0
	je	short @4@122
	mov	bx,si
	shl	bx,1
	cmp	word ptr DGROUP:_areabyplayer[bx],0
	jne	short @4@122
   ;	
   ;			{
   ;				areabyplayer[i] = true;
   ;	
	mov	bx,si
	shl	bx,1
	mov	word ptr DGROUP:_areabyplayer[bx],1
   ;	
   ;				RecursiveConnect (i);
   ;	
	push	si
	call	near ptr _RecursiveConnect
	pop	cx
@4@122:
	inc	si
@4@146:
	cmp	si,37
	jl	short @4@50
   ;	
   ;			}
   ;		}
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_RecursiveConnect	endp
   ;	
   ;	void ConnectAreas (void)
   ;	
	assume	cs:_TEXT
_ConnectAreas	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		memset (areabyplayer,0,sizeof(areabyplayer));
   ;	
	mov	ax,74
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_areabyplayer
	push	ax
	call	near ptr _memset
	add	sp,6
   ;	
   ;		areabyplayer[player->areanumber] = true;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	al,byte ptr [bx+27]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	mov	word ptr DGROUP:_areabyplayer[bx],1
   ;	
   ;		RecursiveConnect (player->areanumber);
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	al,byte ptr [bx+27]
	mov	ah,0
	push	ax
	call	near ptr _RecursiveConnect
	pop	cx
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_ConnectAreas	endp
   ;	
   ;	void InitAreas (void)
   ;	
	assume	cs:_TEXT
_InitAreas	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		memset (areabyplayer,0,sizeof(areabyplayer));
   ;	
	mov	ax,74
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_areabyplayer
	push	ax
	call	near ptr _memset
	add	sp,6
   ;	
   ;		areabyplayer[player->areanumber] = true;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	al,byte ptr [bx+27]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	mov	word ptr DGROUP:_areabyplayer[bx],1
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_InitAreas	endp
   ;	
   ;	void InitDoorList (void)
   ;	
	assume	cs:_TEXT
_InitDoorList	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		memset (areabyplayer,0,sizeof(areabyplayer));
   ;	
	mov	ax,74
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_areabyplayer
	push	ax
	call	near ptr _memset
	add	sp,6
   ;	
   ;		_fmemset (areaconnect,0,sizeof(areaconnect));
   ;	
	mov	ax,1369
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,seg _areaconnect
	push	ax
	mov	ax,offset _areaconnect
	push	ax
	call	near ptr __fmemset
	add	sp,8
   ;	
   ;	
   ;		lastdoorobj = &doorobjlist[0];
   ;	
	mov	word ptr DGROUP:_lastdoorobj,offset DGROUP:_doorobjlist
   ;	
   ;		doornum = 0;
   ;	
	mov	word ptr DGROUP:_doornum,0
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_InitDoorList	endp
   ;	
   ;	void SpawnDoor (int tilex, int tiley, boolean vertical, int lock)
   ;	
	assume	cs:_TEXT
_SpawnDoor	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
   ;	
   ;	{
   ;		int	areanumber;
   ;		unsigned	far *map;
   ;	
   ;		if (doornum==64)
   ;	
	cmp	word ptr DGROUP:_doornum,64
	jne	short @8@74
   ;	
   ;			Quit ("64+ doors on level!");
   ;	
	mov	ax,offset DGROUP:s@+61
	push	ax
	call	near ptr _Quit
	pop	cx
@8@74:
   ;	
   ;	
   ;		doorposition[doornum] = 0;		// doors start out fully closed
   ;	
	mov	bx,word ptr DGROUP:_doornum
	shl	bx,1
	mov	word ptr DGROUP:_doorposition[bx],0
   ;	
   ;		lastdoorobj->tilex = tilex;
   ;	
	mov	bx,word ptr DGROUP:_lastdoorobj
	mov	al,byte ptr [bp+4]
	mov	byte ptr [bx],al
   ;	
   ;		lastdoorobj->tiley = tiley;
   ;	
	mov	bx,word ptr DGROUP:_lastdoorobj
	mov	al,byte ptr [bp+6]
	mov	byte ptr [bx+1],al
   ;	
   ;		lastdoorobj->vertical = vertical;
   ;	
	mov	bx,word ptr DGROUP:_lastdoorobj
	mov	ax,word ptr [bp+8]
	mov	word ptr [bx+2],ax
   ;	
   ;		lastdoorobj->lock = lock;
   ;	
	mov	bx,word ptr DGROUP:_lastdoorobj
	mov	al,byte ptr [bp+10]
	mov	byte ptr [bx+4],al
   ;	
   ;		lastdoorobj->action = dr_closed;
   ;	
	mov	bx,word ptr DGROUP:_lastdoorobj
	mov	word ptr [bx+5],1
   ;	
   ;	
   ;		(unsigned)actorat[tilex][tiley] = doornum | 0x80;	// consider it a solid wall
   ;	
	mov	bx,word ptr [bp+4]
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [bp+6]
	shl	ax,1
	add	bx,ax
	mov	ax,word ptr DGROUP:_doornum
	or	ax,128
	mov	word ptr DGROUP:_actorat[bx],ax
   ;	
   ;	
   ;	//
   ;	// make the door tile a special tile, and mark the adjacent tiles
   ;	// for door sides
   ;	//
   ;		tilemap[tilex][tiley] = doornum | 0x80;
   ;	
	mov	bx,word ptr [bp+4]
	mov	cl,6
	shl	bx,cl
	add	bx,word ptr [bp+6]
	mov	al,byte ptr DGROUP:_doornum
	or	al,128
	mov	byte ptr DGROUP:_tilemap[bx],al
   ;	
   ;		map = mapsegs[0] + farmapylookup[tiley]+tilex;
   ;	
	mov	bx,word ptr [bp+6]
	shl	bx,1
	mov	ax,word ptr DGROUP:_farmapylookup[bx]
	shl	ax,1
	mov	dx,word ptr DGROUP:_mapsegs
	mov	bx,word ptr [bp+4]
	shl	bx,1
	add	ax,bx
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;		if (vertical)
   ;	
	cmp	word ptr [bp+8],0
	je	short @8@122
   ;	
   ;		{
   ;			*map = *(map-1);                        // set area number
   ;	
	les	bx,dword ptr [bp-4]
	mov	ax,word ptr es:[bx-2]
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx],ax
   ;	
   ;			tilemap[tilex][tiley-1] |= 0x40;
   ;	
	mov	bx,word ptr [bp+4]
	mov	cl,6
	shl	bx,cl
	add	bx,word ptr [bp+6]
	mov	al,byte ptr DGROUP:_tilemap[bx-1]
	or	al,64
	mov	bx,word ptr [bp+4]
	mov	cl,6
	shl	bx,cl
	add	bx,word ptr [bp+6]
	mov	byte ptr DGROUP:_tilemap[bx-1],al
   ;	
   ;			tilemap[tilex][tiley+1] |= 0x40;
   ;	
	mov	bx,word ptr [bp+4]
	mov	cl,6
	shl	bx,cl
	add	bx,word ptr [bp+6]
	mov	al,byte ptr DGROUP:_tilemap[bx+1]
	or	al,64
	mov	bx,word ptr [bp+4]
	mov	cl,6
	shl	bx,cl
	add	bx,word ptr [bp+6]
	mov	byte ptr DGROUP:_tilemap[bx+1],al
   ;	
   ;		}
   ;	
	jmp	short @8@146
@8@122:
   ;	
   ;		else
   ;		{
   ;			*map = *(map-mapwidth);					// set area number
   ;	
	mov	ax,word ptr DGROUP:_mapwidth
	shl	ax,1
	les	bx,dword ptr [bp-4]
	sub	bx,ax
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp-4]
	mov	word ptr es:[bx],ax
   ;	
   ;			tilemap[tilex-1][tiley] |= 0x40;
   ;	
	mov	bx,word ptr [bp+4]
	mov	cl,6
	shl	bx,cl
	add	bx,word ptr [bp+6]
	mov	al,byte ptr DGROUP:_tilemap[bx-64]
	or	al,64
	mov	bx,word ptr [bp+4]
	mov	cl,6
	shl	bx,cl
	add	bx,word ptr [bp+6]
	mov	byte ptr DGROUP:_tilemap[bx-64],al
   ;	
   ;			tilemap[tilex+1][tiley] |= 0x40;
   ;	
	mov	bx,word ptr [bp+4]
	mov	cl,6
	shl	bx,cl
	add	bx,word ptr [bp+6]
	mov	al,byte ptr DGROUP:_tilemap[bx+64]
	or	al,64
	mov	bx,word ptr [bp+4]
	mov	cl,6
	shl	bx,cl
	add	bx,word ptr [bp+6]
	mov	byte ptr DGROUP:_tilemap[bx+64],al
@8@146:
   ;	
   ;		}
   ;	
   ;		doornum++;
   ;	
	inc	word ptr DGROUP:_doornum
   ;	
   ;		lastdoorobj++;
   ;	
	add	word ptr DGROUP:_lastdoorobj,9
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_SpawnDoor	endp
   ;	
   ;	void OpenDoor (int door)
   ;	
	assume	cs:_TEXT
_OpenDoor	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		if (doorobjlist[door].action == dr_open)
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	cmp	word ptr DGROUP:_doorobjlist[bx+5],0
	jne	short @9@74
   ;	
   ;			doorobjlist[door].ticcount = 0;			// reset open time
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	word ptr DGROUP:_doorobjlist[bx+7],0
	jmp	short @9@98
@9@74:
   ;	
   ;		else
   ;			doorobjlist[door].action = dr_opening;	// start it opening
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	word ptr DGROUP:_doorobjlist[bx+5],2
@9@98:
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_OpenDoor	endp
   ;	
   ;	void CloseDoor (int door)
   ;	
	assume	cs:_TEXT
_CloseDoor	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
   ;	
   ;	{
   ;		int	tilex,tiley,area;
   ;		objtype *check;
   ;	
   ;	//
   ;	// don't close on anything solid
   ;	//
   ;		tilex = doorobjlist[door].tilex;
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx]
	mov	ah,0
	mov	word ptr [bp-2],ax
   ;	
   ;		tiley = doorobjlist[door].tiley;
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx+1]
	mov	ah,0
	mov	di,ax
   ;	
   ;	
   ;		if (actorat[tilex][tiley])
   ;	
	mov	bx,word ptr [bp-2]
	mov	cl,7
	shl	bx,cl
	mov	ax,di
	shl	ax,1
	add	bx,ax
	cmp	word ptr DGROUP:_actorat[bx],0
	je	short @10@74
   ;	
   ;			return;
   ;	
	jmp	@10@1010
@10@74:
   ;	
   ;	
   ;		if (player->tilex == tilex && player->tiley == tiley)
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+23]
	cmp	ax,word ptr [bp-2]
	jne	short @10@146
	mov	bx,word ptr DGROUP:_player
	cmp	word ptr [bx+25],di
	jne	short @10@146
   ;	
   ;			return;
   ;	
	jmp	@10@1010
@10@146:
   ;	
   ;	
   ;		if (doorobjlist[door].vertical)
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,9
	imul	dx
	mov	bx,ax
	cmp	word ptr DGROUP:_doorobjlist[bx+2],0
	jne	@@0
	jmp	@10@554
@@0:
   ;	
   ;		{
   ;			if ( player->tiley == tiley )
   ;	
	mov	bx,word ptr DGROUP:_player
	cmp	word ptr [bx+25],di
	jne	short @10@338
   ;	
   ;			{
   ;				if ( ((player->x+MINDIST) >>TILESHIFT) == tilex )
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+17]
	mov	dx,word ptr [bx+15]
	add	dx,22528
	adc	ax,0
	cwd	
	push	ax
	mov	ax,word ptr [bp-2]
	push	dx
	cwd	
	pop	bx
	cmp	bx,dx
	pop	dx
	jne	short @10@266
	cmp	dx,ax
	jne	short @10@266
   ;	
   ;					return;
   ;	
	jmp	@10@1010
@10@266:
   ;	
   ;				if ( ((player->x-MINDIST) >>TILESHIFT) == tilex )
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+17]
	mov	dx,word ptr [bx+15]
	add	dx,43008
	adc	ax,65535
	cwd	
	push	ax
	mov	ax,word ptr [bp-2]
	push	dx
	cwd	
	pop	bx
	cmp	bx,dx
	pop	dx
	jne	short @10@338
	cmp	dx,ax
	jne	short @10@338
   ;	
   ;					return;
   ;	
	jmp	@10@1010
@10@338:
   ;	
   ;			}
   ;			check = actorat[tilex-1][tiley];
   ;	
	mov	bx,word ptr [bp-2]
	mov	cl,7
	shl	bx,cl
	mov	ax,di
	shl	ax,1
	add	bx,ax
	mov	si,word ptr DGROUP:_actorat[bx-128]
   ;	
   ;			if (check && ((check->x+MINDIST) >> TILESHIFT) == tilex )
   ;	
	or	si,si
	je	short @10@434
	mov	ax,word ptr [si+17]
	mov	dx,word ptr [si+15]
	add	dx,22528
	adc	ax,0
	cwd	
	push	ax
	mov	ax,word ptr [bp-2]
	push	dx
	cwd	
	pop	bx
	cmp	bx,dx
	pop	dx
	jne	short @10@434
	cmp	dx,ax
	jne	short @10@434
   ;	
   ;				return;
   ;	
	jmp	@10@1010
@10@434:
   ;	
   ;			check = actorat[tilex+1][tiley];
   ;	
	mov	bx,word ptr [bp-2]
	mov	cl,7
	shl	bx,cl
	mov	ax,di
	shl	ax,1
	add	bx,ax
	mov	si,word ptr DGROUP:_actorat[bx+128]
   ;	
   ;			if (check && ((check->x-MINDIST) >> TILESHIFT) == tilex )
   ;	
	or	si,si
	je	short @10@530
	mov	ax,word ptr [si+17]
	mov	dx,word ptr [si+15]
	add	dx,43008
	adc	ax,65535
	cwd	
	push	ax
	mov	ax,word ptr [bp-2]
	push	dx
	cwd	
	pop	bx
	cmp	bx,dx
	pop	dx
	jne	short @10@530
	cmp	dx,ax
	jne	short @10@530
   ;	
   ;				return;
   ;	
	jmp	@10@1010
@10@530:
   ;	
   ;		}
   ;	
	jmp	@10@938
@10@554:
   ;	
   ;		else if (!doorobjlist[door].vertical)
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,9
	imul	dx
	mov	bx,ax
	cmp	word ptr DGROUP:_doorobjlist[bx+2],0
	je	@@1
	jmp	@10@938
@@1:
   ;	
   ;		{
   ;			if (player->tilex == tilex)
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+23]
	cmp	ax,word ptr [bp-2]
	jne	short @10@746
   ;	
   ;			{
   ;				if ( ((player->y+MINDIST) >>TILESHIFT) == tiley )
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+21]
	mov	dx,word ptr [bx+19]
	add	dx,22528
	adc	ax,0
	cwd	
	push	ax
	mov	ax,di
	push	dx
	cwd	
	pop	bx
	cmp	bx,dx
	pop	dx
	jne	short @10@674
	cmp	dx,ax
	jne	short @10@674
   ;	
   ;					return;
   ;	
	jmp	@10@1010
@10@674:
   ;	
   ;				if ( ((player->y-MINDIST) >>TILESHIFT) == tiley )
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+21]
	mov	dx,word ptr [bx+19]
	add	dx,43008
	adc	ax,65535
	cwd	
	push	ax
	mov	ax,di
	push	dx
	cwd	
	pop	bx
	cmp	bx,dx
	pop	dx
	jne	short @10@746
	cmp	dx,ax
	jne	short @10@746
   ;	
   ;					return;
   ;	
	jmp	@10@1010
@10@746:
   ;	
   ;			}
   ;			check = actorat[tilex][tiley-1];
   ;	
	mov	bx,word ptr [bp-2]
	mov	cl,7
	shl	bx,cl
	mov	ax,di
	shl	ax,1
	add	bx,ax
	mov	si,word ptr DGROUP:_actorat[bx-2]
   ;	
   ;			if (check && ((check->y+MINDIST) >> TILESHIFT) == tiley )
   ;	
	or	si,si
	je	short @10@842
	mov	ax,word ptr [si+21]
	mov	dx,word ptr [si+19]
	add	dx,22528
	adc	ax,0
	cwd	
	push	ax
	mov	ax,di
	push	dx
	cwd	
	pop	bx
	cmp	bx,dx
	pop	dx
	jne	short @10@842
	cmp	dx,ax
	jne	short @10@842
   ;	
   ;				return;
   ;	
	jmp	@10@1010
@10@842:
   ;	
   ;			check = actorat[tilex][tiley+1];
   ;	
	mov	bx,word ptr [bp-2]
	mov	cl,7
	shl	bx,cl
	mov	ax,di
	shl	ax,1
	add	bx,ax
	mov	si,word ptr DGROUP:_actorat[bx+2]
   ;	
   ;			if (check && ((check->y-MINDIST) >> TILESHIFT) == tiley )
   ;	
	or	si,si
	je	short @10@938
	mov	ax,word ptr [si+21]
	mov	dx,word ptr [si+19]
	add	dx,43008
	adc	ax,65535
	cwd	
	push	ax
	mov	ax,di
	push	dx
	cwd	
	pop	bx
	cmp	bx,dx
	pop	dx
	jne	short @10@938
	cmp	dx,ax
	jne	short @10@938
   ;	
   ;				return;
   ;	
	jmp	@10@1010
@10@938:
   ;	
   ;		}
   ;	
   ;	
   ;	//
   ;	// play door sound if in a connected area
   ;	//
   ;		area = *(mapsegs[0] + farmapylookup[doorobjlist[door].tiley]
   ;	
   ;	
   ;				+doorobjlist[door].tilex)-AREATILE;
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx+1]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	mov	bx,word ptr DGROUP:_farmapylookup[bx]
	shl	bx,1
	mov	es,word ptr DGROUP:_mapsegs
	mov	ax,word ptr [bp+4]
	mov	dx,9
	imul	dx
	push	bx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx]
	mov	ah,0
	shl	ax,1
	pop	bx
	add	bx,ax
	mov	ax,word ptr es:[bx]
	sub	ax,107
	mov	word ptr [bp-4],ax
   ;	
   ;		if (areabyplayer[area])
   ;	
	mov	bx,word ptr [bp-4]
	shl	bx,1
	cmp	word ptr DGROUP:_areabyplayer[bx],0
	je	short @10@986
   ;	
   ;		{
   ;			PlaySoundLocTile(CLOSEDOORSND,doorobjlist[door].tilex,doorobjlist[door].tiley);	// JAB
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx+1]
	mov	ah,0
	xor	dx,dx
	add	dx,32768
	adc	ax,0
	push	ax
	push	dx
	mov	ax,word ptr [bp+4]
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx]
	mov	ah,0
	xor	dx,dx
	add	dx,32768
	adc	ax,0
	push	ax
	push	dx
	mov	ax,19
	push	ax
	call	near ptr _PlaySoundLocGlobal
	add	sp,10
@10@986:
   ;	
   ;		}
   ;	
   ;		doorobjlist[door].action = dr_closing;
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	word ptr DGROUP:_doorobjlist[bx+5],3
   ;	
   ;	//
   ;	// make the door space solid
   ;	//
   ;		(unsigned)actorat[tilex][tiley]
   ;	
   ;	
   ;			= door | 0x80;
   ;	
	mov	bx,word ptr [bp-2]
	mov	cl,7
	shl	bx,cl
	mov	ax,di
	shl	ax,1
	add	bx,ax
	mov	ax,word ptr [bp+4]
	or	ax,128
	mov	word ptr DGROUP:_actorat[bx],ax
@10@1010:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CloseDoor	endp
   ;	
   ;	void OperateDoor (int door)
   ;	
	assume	cs:_TEXT
_OperateDoor	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		int	lock;
   ;	
   ;		lock = doorobjlist[door].lock;
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx+4]
	mov	ah,0
	mov	word ptr [bp-2],ax
   ;	
   ;		if (lock >= dr_lock1 && lock <= dr_lock4)
   ;	
	cmp	word ptr [bp-2],1
	jl	short @11@122
	cmp	word ptr [bp-2],4
	jg	short @11@122
   ;	
   ;		{
   ;			if ( ! (gamestate.keys & (1 << (lock-dr_lock1) ) ) )
   ;	
	mov	cl,byte ptr [bp-2]
	add	cl,255
	mov	ax,1
	shl	ax,cl
	test	ax,word ptr DGROUP:_gamestate+22
	jne	short @11@122
   ;	
   ;			{
   ;				SD_PlaySound (NOWAYSND);		// locked
   ;	
	mov	ax,6
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;				return;
   ;	
	jmp	short @11@242
@11@122:
   ;	
   ;			}
   ;		}
   ;	
   ;		switch (doorobjlist[door].action)
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	bx,word ptr DGROUP:_doorobjlist[bx+5]
	cmp	bx,3
	ja	short @11@242
	shl	bx,1
	jmp	word ptr cs:@11@C968[bx]
@11@194:
   ;	
   ;		{
   ;		case dr_closed:
   ;		case dr_closing:
   ;			OpenDoor (door);
   ;	
	push	si
	call	near ptr _OpenDoor
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	short @11@242
@11@218:
   ;	
   ;		case dr_open:
   ;		case dr_opening:
   ;			CloseDoor (door);
   ;	
	push	si
	call	near ptr _CloseDoor
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	short @11@242
@11@242:
   ;	
   ;		}
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_OperateDoor	endp
@11@C968	label	word
	dw	@11@218
	dw	@11@194
	dw	@11@218
	dw	@11@194
   ;	
   ;	void DoorOpen (int door)
   ;	
	assume	cs:_TEXT
_DoorOpen	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		if ( (doorobjlist[door].ticcount += tics) >= OPENTICS)
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	ax,word ptr DGROUP:_doorobjlist[bx+7]
	add	ax,word ptr DGROUP:_tics
	push	ax
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	pop	ax
	mov	word ptr DGROUP:_doorobjlist[bx+7],ax
	cmp	ax,300
	jl	short @12@74
   ;	
   ;			CloseDoor (door);
   ;	
	push	si
	call	near ptr _CloseDoor
	pop	cx
@12@74:
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_DoorOpen	endp
   ;	
   ;	void DoorOpening (int door)
   ;	
	assume	cs:_TEXT
_DoorOpening	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		int		area1,area2;
   ;		unsigned	far	*map;
   ;		long	position;
   ;	
   ;		position = doorposition[door];
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr DGROUP:_doorposition[bx]
	mov	word ptr [bp-10],ax
	mov	word ptr [bp-8],0
   ;	
   ;		if (!position)
   ;	
	mov	ax,word ptr [bp-10]
	or	ax,word ptr [bp-8]
	je	@@2
	jmp	@13@170
@@2:
   ;	
   ;		{
   ;		//
   ;		// door is just starting to open, so connect the areas
   ;		//
   ;			map = mapsegs[0] + farmapylookup[doorobjlist[door].tiley]
   ;	
   ;	
   ;				+doorobjlist[door].tilex;
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx+1]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	mov	ax,word ptr DGROUP:_farmapylookup[bx]
	shl	ax,1
	mov	dx,word ptr DGROUP:_mapsegs
	push	ax
	mov	ax,si
	mov	bx,9
	push	dx
	imul	bx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx]
	mov	ah,0
	shl	ax,1
	pop	dx
	pop	bx
	add	bx,ax
	mov	word ptr [bp-6],bx
	mov	word ptr [bp-4],dx
   ;	
   ;	
   ;			if (doorobjlist[door].vertical)
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	cmp	word ptr DGROUP:_doorobjlist[bx+2],0
	je	short @13@98
   ;	
   ;			{
   ;				area1 =	*(map+1);
   ;	
	les	bx,dword ptr [bp-6]
	mov	di,word ptr es:[bx+2]
   ;	
   ;				area2 =	*(map-1);
   ;	
	les	bx,dword ptr [bp-6]
	mov	ax,word ptr es:[bx-2]
	mov	word ptr [bp-2],ax
   ;	
   ;			}
   ;	
	jmp	short @13@122
@13@98:
   ;	
   ;			else
   ;			{
   ;				area1 =	*(map-mapwidth);
   ;	
	mov	ax,word ptr DGROUP:_mapwidth
	shl	ax,1
	les	bx,dword ptr [bp-6]
	sub	bx,ax
	mov	di,word ptr es:[bx]
   ;	
   ;				area2 =	*(map+mapwidth);
   ;	
	mov	ax,word ptr DGROUP:_mapwidth
	shl	ax,1
	les	bx,dword ptr [bp-6]
	add	bx,ax
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-2],ax
@13@122:
   ;	
   ;			}
   ;			area1 -= AREATILE;
   ;	
	sub	di,107
   ;	
   ;			area2 -= AREATILE;
   ;	
	sub	word ptr [bp-2],107
   ;	
   ;			areaconnect[area1][area2]++;
   ;	
	mov	ax,di
	mov	dx,37
	imul	dx
	add	ax,word ptr [bp-2]
	mov	dx,seg _areaconnect
	mov	bx,ax
	mov	es,dx
	inc	byte ptr es:_areaconnect[bx]
   ;	
   ;			areaconnect[area2][area1]++;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,37
	imul	dx
	mov	dx,seg _areaconnect
	mov	bx,ax
	mov	es,dx
	inc	byte ptr es:_areaconnect[bx+di]
   ;	
   ;			ConnectAreas ();
   ;	
	call	near ptr _ConnectAreas
   ;	
   ;			if (areabyplayer[area1])
   ;	
	mov	bx,di
	shl	bx,1
	cmp	word ptr DGROUP:_areabyplayer[bx],0
	je	short @13@170
   ;	
   ;			{
   ;				PlaySoundLocTile(OPENDOORSND,doorobjlist[door].tilex,doorobjlist[door].tiley);	// JAB
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx+1]
	mov	ah,0
	xor	dx,dx
	add	dx,32768
	adc	ax,0
	push	ax
	push	dx
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx]
	mov	ah,0
	xor	dx,dx
	add	dx,32768
	adc	ax,0
	push	ax
	push	dx
	mov	ax,18
	push	ax
	call	near ptr _PlaySoundLocGlobal
	add	sp,10
@13@170:
   ;	
   ;			}
   ;		}
   ;	
   ;	//
   ;	// slide the door by an adaptive amount
   ;	//
   ;		position += tics<<10;
   ;	
	mov	ax,word ptr DGROUP:_tics
	mov	cl,10
	shl	ax,cl
	add	word ptr [bp-10],ax
	adc	word ptr [bp-8],0
   ;	
   ;		if (position >= 0xffff)
   ;	
	cmp	word ptr [bp-8],0
	jl	short @13@266
	jne	short @13@242
	cmp	word ptr [bp-10],65535
	jb	short @13@266
@13@242:
   ;	
   ;		{
   ;		//
   ;		// door is all the way open
   ;		//
   ;			position = 0xffff;
   ;	
	mov	word ptr [bp-10],65535
	mov	word ptr [bp-8],0
   ;	
   ;			doorobjlist[door].ticcount = 0;
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	word ptr DGROUP:_doorobjlist[bx+7],0
   ;	
   ;			doorobjlist[door].action = dr_open;
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	word ptr DGROUP:_doorobjlist[bx+5],0
   ;	
   ;			actorat[doorobjlist[door].tilex][doorobjlist[door].tiley] = 0;
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx]
	mov	ah,0
	mov	cl,7
	shl	ax,cl
	push	ax
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx+1]
	mov	ah,0
	shl	ax,1
	pop	bx
	add	bx,ax
	mov	word ptr DGROUP:_actorat[bx],0
@13@266:
   ;	
   ;		}
   ;	
   ;		doorposition[door] = position;
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr [bp-10]
	mov	word ptr DGROUP:_doorposition[bx],ax
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_DoorOpening	endp
   ;	
   ;	void DoorClosing (int door)
   ;	
	assume	cs:_TEXT
_DoorClosing	proc	near
	push	bp
	mov	bp,sp
	sub	sp,14
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		int		area1,area2,move;
   ;		unsigned	far	*map;
   ;		long	position;
   ;		int		tilex,tiley;
   ;	
   ;		tilex = doorobjlist[door].tilex;
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx]
	mov	ah,0
	mov	word ptr [bp-12],ax
   ;	
   ;		tiley = doorobjlist[door].tiley;
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx+1]
	mov	ah,0
	mov	word ptr [bp-14],ax
   ;	
   ;	
   ;		if ( ((unsigned)actorat[tilex][tiley] != (door | 0x80))
   ;	
   ;	
   ;		|| (player->tilex == tilex && player->tiley == tiley) )
   ;	
	mov	bx,word ptr [bp-12]
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [bp-14]
	shl	ax,1
	add	bx,ax
	mov	ax,si
	or	ax,128
	cmp	word ptr DGROUP:_actorat[bx],ax
	jne	short @14@98
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+23]
	cmp	ax,word ptr [bp-12]
	jne	short @14@122
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+25]
	cmp	ax,word ptr [bp-14]
	jne	short @14@122
@14@98:
   ;	
   ;		{			// something got inside the door
   ;			OpenDoor (door);
   ;	
	push	si
	call	near ptr _OpenDoor
	pop	cx
   ;	
   ;			return;
   ;	
	jmp	@14@314
@14@122:
   ;	
   ;		};
   ;	
   ;		position = doorposition[door];
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr DGROUP:_doorposition[bx]
	mov	word ptr [bp-10],ax
	mov	word ptr [bp-8],0
   ;	
   ;	
   ;	//
   ;	// slide the door by an adaptive amount
   ;	//
   ;		position -= tics<<10;
   ;	
	mov	ax,word ptr DGROUP:_tics
	mov	cl,10
	shl	ax,cl
	sub	word ptr [bp-10],ax
	sbb	word ptr [bp-8],0
   ;	
   ;		if (position <= 0)
   ;	
	cmp	word ptr [bp-8],0
	jle	@@3
	jmp	@14@290
@@3:
	jne	short @14@194
	cmp	word ptr [bp-10],0
	jbe	@@4
	jmp	@14@290
@@4:
@14@194:
   ;	
   ;		{
   ;		//
   ;		// door is closed all the way, so disconnect the areas
   ;		//
   ;			position = 0;
   ;	
	mov	word ptr [bp-10],0
	mov	word ptr [bp-8],0
   ;	
   ;	
   ;			doorobjlist[door].action = dr_closed;
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	word ptr DGROUP:_doorobjlist[bx+5],1
   ;	
   ;	
   ;			map = mapsegs[0] + farmapylookup[doorobjlist[door].tiley]
   ;	
   ;	
   ;				+doorobjlist[door].tilex;
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx+1]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	mov	ax,word ptr DGROUP:_farmapylookup[bx]
	shl	ax,1
	mov	dx,word ptr DGROUP:_mapsegs
	push	ax
	mov	ax,si
	mov	bx,9
	push	dx
	imul	bx
	mov	bx,ax
	mov	al,byte ptr DGROUP:_doorobjlist[bx]
	mov	ah,0
	shl	ax,1
	pop	dx
	pop	bx
	add	bx,ax
	mov	word ptr [bp-6],bx
	mov	word ptr [bp-4],dx
   ;	
   ;	
   ;			if (doorobjlist[door].vertical)
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	cmp	word ptr DGROUP:_doorobjlist[bx+2],0
	je	short @14@242
   ;	
   ;			{
   ;				area1 =	*(map+1);
   ;	
	les	bx,dword ptr [bp-6]
	mov	ax,word ptr es:[bx+2]
	mov	word ptr [bp-2],ax
   ;	
   ;				area2 =	*(map-1);
   ;	
	les	bx,dword ptr [bp-6]
	mov	di,word ptr es:[bx-2]
   ;	
   ;			}
   ;	
	jmp	short @14@266
@14@242:
   ;	
   ;			else
   ;			{
   ;				area1 =	*(map-mapwidth);
   ;	
	mov	ax,word ptr DGROUP:_mapwidth
	shl	ax,1
	les	bx,dword ptr [bp-6]
	sub	bx,ax
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-2],ax
   ;	
   ;				area2 =	*(map+mapwidth);
   ;	
	mov	ax,word ptr DGROUP:_mapwidth
	shl	ax,1
	les	bx,dword ptr [bp-6]
	add	bx,ax
	mov	di,word ptr es:[bx]
@14@266:
   ;	
   ;			}
   ;			area1 -= AREATILE;
   ;	
	sub	word ptr [bp-2],107
   ;	
   ;			area2 -= AREATILE;
   ;	
	sub	di,107
   ;	
   ;			areaconnect[area1][area2]--;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,37
	imul	dx
	mov	dx,seg _areaconnect
	mov	bx,ax
	mov	es,dx
	dec	byte ptr es:_areaconnect[bx+di]
   ;	
   ;			areaconnect[area2][area1]--;
   ;	
	mov	ax,di
	mov	dx,37
	imul	dx
	add	ax,word ptr [bp-2]
	mov	dx,seg _areaconnect
	mov	bx,ax
	mov	es,dx
	dec	byte ptr es:_areaconnect[bx]
   ;	
   ;	
   ;			ConnectAreas ();
   ;	
	call	near ptr _ConnectAreas
@14@290:
   ;	
   ;		}
   ;	
   ;		doorposition[door] = position;
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr [bp-10]
	mov	word ptr DGROUP:_doorposition[bx],ax
@14@314:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_DoorClosing	endp
   ;	
   ;	void MoveDoors (void)
   ;	
	assume	cs:_TEXT
_MoveDoors	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int		door;
   ;	
   ;		if (gamestate.victoryflag)		// don't move door during victory sequence
   ;	
	cmp	word ptr DGROUP:_gamestate+64,0
	je	short @15@74
   ;	
   ;			return;
   ;	
	jmp	short @15@338
@15@74:
   ;	
   ;	
   ;		for (door = 0 ; door < doornum ; door++)
   ;	
	xor	si,si
	jmp	short @15@314
@15@98:
   ;	
   ;			switch (doorobjlist[door].action)
   ;	
	mov	ax,si
	mov	dx,9
	imul	dx
	mov	bx,ax
	mov	ax,word ptr DGROUP:_doorobjlist[bx+5]
	or	ax,ax
	je	short @15@218
	cmp	ax,2
	je	short @15@242
	cmp	ax,3
	je	short @15@266
	jmp	short @15@290
@15@218:
   ;	
   ;			{
   ;			case dr_open:
   ;				DoorOpen (door);
   ;	
	push	si
	call	near ptr _DoorOpen
	pop	cx
   ;	
   ;				break;
   ;	
	jmp	short @15@290
@15@242:
   ;	
   ;	
   ;			case dr_opening:
   ;				DoorOpening(door);
   ;	
	push	si
	call	near ptr _DoorOpening
	pop	cx
   ;	
   ;				break;
   ;	
	jmp	short @15@290
@15@266:
   ;	
   ;	
   ;			case dr_closing:
   ;				DoorClosing(door);
   ;	
	push	si
	call	near ptr _DoorClosing
	pop	cx
   ;	
   ;				break;
   ;	
	jmp	short @15@290
@15@290:
	inc	si
@15@314:
	cmp	si,word ptr DGROUP:_doornum
	jl	short @15@98
@15@338:
   ;	
   ;			}
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_MoveDoors	endp
   ;	
   ;	void PushWall (int checkx, int checky, int dir)
   ;	
	assume	cs:_TEXT
_PushWall	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
	mov	si,word ptr [bp+6]
   ;	
   ;	{
   ;		int		oldtile;
   ;	
   ;		if (pwallstate)
   ;	
	cmp	word ptr DGROUP:_pwallstate,0
	je	short @16@74
   ;	
   ;		  return;
   ;	
	jmp	@16@506
@16@74:
   ;	
   ;	
   ;	
   ;		oldtile = tilemap[checkx][checky];
   ;	
	mov	bx,di
	mov	cl,6
	shl	bx,cl
	mov	al,byte ptr DGROUP:_tilemap[bx+si]
	mov	ah,0
	mov	word ptr [bp-2],ax
   ;	
   ;		if (!oldtile)
   ;	
	cmp	word ptr [bp-2],0
	jne	short @16@122
   ;	
   ;			return;
   ;	
	jmp	@16@506
@16@122:
   ;	
   ;	
   ;		switch (dir)
   ;	
	mov	bx,word ptr [bp+8]
	cmp	bx,3
	jbe	@@5
	jmp	@16@482
@@5:
	shl	bx,1
	jmp	word ptr cs:@16@C1658[bx]
@16@194:
   ;	
   ;		{
   ;		case di_north:
   ;			if (actorat[checkx][checky-1])
   ;	
	mov	bx,di
	mov	cl,7
	shl	bx,cl
	mov	ax,si
	shl	ax,1
	add	bx,ax
	cmp	word ptr DGROUP:_actorat[bx-2],0
	je	short @16@242
   ;	
   ;			{
   ;				SD_PlaySound (NOWAYSND);
   ;	
	mov	ax,6
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;				return;
   ;	
	jmp	@16@506
@16@242:
   ;	
   ;			}
   ;			(unsigned)actorat[checkx][checky-1] =
   ;	
   ;	
   ;			tilemap[checkx][checky-1] = oldtile;
   ;	
	mov	bx,di
	mov	cl,7
	shl	bx,cl
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	bx
	mov	bx,di
	mov	cl,6
	shl	bx,cl
	mov	al,byte ptr [bp-2]
	mov	byte ptr DGROUP:_tilemap[bx+si-1],al
	mov	ah,0
	pop	bx
	mov	word ptr DGROUP:_actorat[bx-2],ax
   ;	
   ;			break;
   ;	
	jmp	@16@482
@16@266:
   ;	
   ;	
   ;		case di_east:
   ;			if (actorat[checkx+1][checky])
   ;	
	mov	bx,di
	mov	cl,7
	shl	bx,cl
	mov	ax,si
	shl	ax,1
	add	bx,ax
	cmp	word ptr DGROUP:_actorat[bx+128],0
	je	short @16@314
   ;	
   ;			{
   ;				SD_PlaySound (NOWAYSND);
   ;	
	mov	ax,6
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;				return;
   ;	
	jmp	@16@506
@16@314:
   ;	
   ;			}
   ;			(unsigned)actorat[checkx+1][checky] =
   ;	
   ;	
   ;			tilemap[checkx+1][checky] = oldtile;
   ;	
	mov	bx,di
	mov	cl,7
	shl	bx,cl
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	bx
	mov	bx,di
	mov	cl,6
	shl	bx,cl
	mov	al,byte ptr [bp-2]
	mov	byte ptr DGROUP:_tilemap[bx+si+64],al
	mov	ah,0
	pop	bx
	mov	word ptr DGROUP:_actorat[bx+128],ax
   ;	
   ;			break;
   ;	
	jmp	@16@482
@16@338:
   ;	
   ;	
   ;		case di_south:
   ;			if (actorat[checkx][checky+1])
   ;	
	mov	bx,di
	mov	cl,7
	shl	bx,cl
	mov	ax,si
	shl	ax,1
	add	bx,ax
	cmp	word ptr DGROUP:_actorat[bx+2],0
	je	short @16@386
   ;	
   ;			{
   ;				SD_PlaySound (NOWAYSND);
   ;	
	mov	ax,6
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;				return;
   ;	
	jmp	@16@506
@16@386:
   ;	
   ;			}
   ;			(unsigned)actorat[checkx][checky+1] =
   ;	
   ;	
   ;			tilemap[checkx][checky+1] = oldtile;
   ;	
	mov	bx,di
	mov	cl,7
	shl	bx,cl
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	bx
	mov	bx,di
	mov	cl,6
	shl	bx,cl
	mov	al,byte ptr [bp-2]
	mov	byte ptr DGROUP:_tilemap[bx+si+1],al
	mov	ah,0
	pop	bx
	mov	word ptr DGROUP:_actorat[bx+2],ax
   ;	
   ;			break;
   ;	
	jmp	short @16@482
@16@410:
   ;	
   ;	
   ;		case di_west:
   ;			if (actorat[checkx-1][checky])
   ;	
	mov	bx,di
	mov	cl,7
	shl	bx,cl
	mov	ax,si
	shl	ax,1
	add	bx,ax
	cmp	word ptr DGROUP:_actorat[bx-128],0
	je	short @16@458
   ;	
   ;			{
   ;				SD_PlaySound (NOWAYSND);
   ;	
	mov	ax,6
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;				return;
   ;	
	jmp	@16@506
@16@458:
   ;	
   ;			}
   ;			(unsigned)actorat[checkx-1][checky] =
   ;	
   ;	
   ;			tilemap[checkx-1][checky] = oldtile;
   ;	
	mov	bx,di
	mov	cl,7
	shl	bx,cl
	mov	ax,si
	shl	ax,1
	add	bx,ax
	push	bx
	mov	bx,di
	mov	cl,6
	shl	bx,cl
	mov	al,byte ptr [bp-2]
	mov	byte ptr DGROUP:_tilemap[bx+si-64],al
	mov	ah,0
	pop	bx
	mov	word ptr DGROUP:_actorat[bx-128],ax
   ;	
   ;			break;
   ;	
	jmp	short @16@482
@16@482:
   ;	
   ;		}
   ;	
   ;		gamestate.secretcount++;
   ;	
	inc	word ptr DGROUP:_gamestate+40
   ;	
   ;		pwallx = checkx;
   ;	
	mov	word ptr DGROUP:_pwallx,di
   ;	
   ;		pwally = checky;
   ;	
	mov	word ptr DGROUP:_pwally,si
   ;	
   ;		pwalldir = dir;
   ;	
	mov	ax,word ptr [bp+8]
	mov	word ptr DGROUP:_pwalldir,ax
   ;	
   ;		pwallstate = 1;
   ;	
	mov	word ptr DGROUP:_pwallstate,1
   ;	
   ;		pwallpos = 0;
   ;	
	mov	word ptr DGROUP:_pwallpos,0
   ;	
   ;		tilemap[pwallx][pwally] |= 0xc0;
   ;	
	mov	bx,word ptr DGROUP:_pwallx
	mov	cl,6
	shl	bx,cl
	add	bx,word ptr DGROUP:_pwally
	mov	al,byte ptr DGROUP:_tilemap[bx]
	or	al,192
	mov	bx,word ptr DGROUP:_pwallx
	mov	cl,6
	shl	bx,cl
	add	bx,word ptr DGROUP:_pwally
	mov	byte ptr DGROUP:_tilemap[bx],al
   ;	
   ;		*(mapsegs[1]+farmapylookup[pwally]+pwallx) = 0;	// remove P tile info
   ;	
	mov	bx,word ptr DGROUP:_pwally
	shl	bx,1
	mov	bx,word ptr DGROUP:_farmapylookup[bx]
	shl	bx,1
	mov	es,word ptr DGROUP:_mapsegs+2
	mov	ax,word ptr DGROUP:_pwallx
	shl	ax,1
	add	bx,ax
	mov	word ptr es:[bx],0
   ;	
   ;	
   ;		SD_PlaySound (PUSHWALLSND);
   ;	
	mov	ax,46
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
@16@506:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_PushWall	endp
@16@C1658	label	word
	dw	@16@194
	dw	@16@266
	dw	@16@338
	dw	@16@410
   ;	
   ;	void MovePWalls (void)
   ;	
	assume	cs:_TEXT
_MovePWalls	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		int		oldblock,oldtile;
   ;	
   ;		if (!pwallstate)
   ;	
	cmp	word ptr DGROUP:_pwallstate,0
	jne	short @17@74
   ;	
   ;			return;
   ;	
	jmp	@17@578
@17@74:
   ;	
   ;	
   ;		oldblock = pwallstate/128;
   ;	
	mov	ax,word ptr DGROUP:_pwallstate
	mov	cl,7
	shr	ax,cl
	mov	si,ax
   ;	
   ;	
   ;		pwallstate += tics;
   ;	
	mov	ax,word ptr DGROUP:_tics
	add	word ptr DGROUP:_pwallstate,ax
   ;	
   ;	
   ;		if (pwallstate/128 != oldblock)
   ;	
	mov	ax,word ptr DGROUP:_pwallstate
	mov	cl,7
	shr	ax,cl
	cmp	ax,si
	jne	@@6
	jmp	@17@554
@@6:
   ;	
   ;		{
   ;		// block crossed into a new block
   ;			oldtile = tilemap[pwallx][pwally] & 63;
   ;	
	mov	bx,word ptr DGROUP:_pwallx
	mov	cl,6
	shl	bx,cl
	add	bx,word ptr DGROUP:_pwally
	mov	al,byte ptr DGROUP:_tilemap[bx]
	mov	ah,0
	and	ax,63
	mov	dx,ax
   ;	
   ;	
   ;			//
   ;			// the tile can now be walked into
   ;			//
   ;			tilemap[pwallx][pwally] = 0;
   ;	
	mov	bx,word ptr DGROUP:_pwallx
	mov	cl,6
	shl	bx,cl
	add	bx,word ptr DGROUP:_pwally
	mov	byte ptr DGROUP:_tilemap[bx],0
   ;	
   ;			(unsigned)actorat[pwallx][pwally] = 0;
   ;	
	mov	bx,word ptr DGROUP:_pwallx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr DGROUP:_pwally
	shl	ax,1
	add	bx,ax
	mov	word ptr DGROUP:_actorat[bx],0
   ;	
   ;			*(mapsegs[0]+farmapylookup[pwally]+pwallx) = player->areanumber+AREATILE;
   ;	
	mov	bx,word ptr DGROUP:_pwally
	shl	bx,1
	mov	bx,word ptr DGROUP:_farmapylookup[bx]
	shl	bx,1
	mov	es,word ptr DGROUP:_mapsegs
	mov	ax,word ptr DGROUP:_pwallx
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_player
	mov	al,byte ptr [di+27]
	mov	ah,0
	add	ax,107
	mov	word ptr es:[bx],ax
   ;	
   ;	
   ;			//
   ;			// see if it should be pushed farther
   ;			//
   ;			if (pwallstate>256)
   ;	
	cmp	word ptr DGROUP:_pwallstate,256
	jbe	short @17@170
   ;	
   ;			{
   ;			//
   ;			// the block has been pushed two tiles
   ;			//
   ;				pwallstate = 0;
   ;	
	mov	word ptr DGROUP:_pwallstate,0
   ;	
   ;				return;
   ;	
	jmp	@17@578
   ;	
   ;			}
   ;	
	jmp	@17@554
@17@170:
   ;	
   ;			else
   ;			{
   ;				switch (pwalldir)
   ;	
	mov	bx,word ptr DGROUP:_pwalldir
	cmp	bx,3
	jbe	@@7
	jmp	@17@530
@@7:
	shl	bx,1
	jmp	word ptr cs:@17@C1888[bx]
@17@242:
   ;	
   ;				{
   ;				case di_north:
   ;					pwally--;
   ;	
	dec	word ptr DGROUP:_pwally
   ;	
   ;					if (actorat[pwallx][pwally-1])
   ;	
	mov	bx,word ptr DGROUP:_pwallx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr DGROUP:_pwally
	dec	ax
	shl	ax,1
	add	bx,ax
	cmp	word ptr DGROUP:_actorat[bx],0
	je	short @17@290
   ;	
   ;					{
   ;						pwallstate = 0;
   ;	
	mov	word ptr DGROUP:_pwallstate,0
   ;	
   ;						return;
   ;	
	jmp	@17@578
@17@290:
   ;	
   ;					}
   ;					(unsigned)actorat[pwallx][pwally-1] =
   ;	
   ;	
   ;					tilemap[pwallx][pwally-1] = oldtile;
   ;	
	mov	bx,word ptr DGROUP:_pwallx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr DGROUP:_pwally
	dec	ax
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_pwallx
	mov	cl,6
	shl	di,cl
	mov	ax,word ptr DGROUP:_pwally
	dec	ax
	add	di,ax
	mov	al,dl
	mov	byte ptr DGROUP:_tilemap[di],al
	mov	ah,0
	mov	word ptr DGROUP:_actorat[bx],ax
   ;	
   ;					break;
   ;	
	jmp	@17@530
@17@314:
   ;	
   ;	
   ;				case di_east:
   ;					pwallx++;
   ;	
	inc	word ptr DGROUP:_pwallx
   ;	
   ;					if (actorat[pwallx+1][pwally])
   ;	
	mov	bx,word ptr DGROUP:_pwallx
	inc	bx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr DGROUP:_pwally
	shl	ax,1
	add	bx,ax
	cmp	word ptr DGROUP:_actorat[bx],0
	je	short @17@362
   ;	
   ;					{
   ;						pwallstate = 0;
   ;	
	mov	word ptr DGROUP:_pwallstate,0
   ;	
   ;						return;
   ;	
	jmp	@17@578
@17@362:
   ;	
   ;					}
   ;					(unsigned)actorat[pwallx+1][pwally] =
   ;	
   ;	
   ;					tilemap[pwallx+1][pwally] = oldtile;
   ;	
	mov	bx,word ptr DGROUP:_pwallx
	inc	bx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr DGROUP:_pwally
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_pwallx
	inc	di
	mov	cl,6
	shl	di,cl
	add	di,word ptr DGROUP:_pwally
	mov	al,dl
	mov	byte ptr DGROUP:_tilemap[di],al
	mov	ah,0
	mov	word ptr DGROUP:_actorat[bx],ax
   ;	
   ;					break;
   ;	
	jmp	@17@530
@17@386:
   ;	
   ;	
   ;				case di_south:
   ;					pwally++;
   ;	
	inc	word ptr DGROUP:_pwally
   ;	
   ;					if (actorat[pwallx][pwally+1])
   ;	
	mov	bx,word ptr DGROUP:_pwallx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr DGROUP:_pwally
	inc	ax
	shl	ax,1
	add	bx,ax
	cmp	word ptr DGROUP:_actorat[bx],0
	je	short @17@434
   ;	
   ;					{
   ;						pwallstate = 0;
   ;	
	mov	word ptr DGROUP:_pwallstate,0
   ;	
   ;						return;
   ;	
	jmp	@17@578
@17@434:
   ;	
   ;					}
   ;					(unsigned)actorat[pwallx][pwally+1] =
   ;	
   ;	
   ;					tilemap[pwallx][pwally+1] = oldtile;
   ;	
	mov	bx,word ptr DGROUP:_pwallx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr DGROUP:_pwally
	inc	ax
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_pwallx
	mov	cl,6
	shl	di,cl
	mov	ax,word ptr DGROUP:_pwally
	inc	ax
	add	di,ax
	mov	al,dl
	mov	byte ptr DGROUP:_tilemap[di],al
	mov	ah,0
	mov	word ptr DGROUP:_actorat[bx],ax
   ;	
   ;					break;
   ;	
	jmp	short @17@530
@17@458:
   ;	
   ;	
   ;				case di_west:
   ;					pwallx--;
   ;	
	dec	word ptr DGROUP:_pwallx
   ;	
   ;					if (actorat[pwallx-1][pwally])
   ;	
	mov	bx,word ptr DGROUP:_pwallx
	dec	bx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr DGROUP:_pwally
	shl	ax,1
	add	bx,ax
	cmp	word ptr DGROUP:_actorat[bx],0
	je	short @17@506
   ;	
   ;					{
   ;						pwallstate = 0;
   ;	
	mov	word ptr DGROUP:_pwallstate,0
   ;	
   ;						return;
   ;	
	jmp	short @17@578
@17@506:
   ;	
   ;					}
   ;					(unsigned)actorat[pwallx-1][pwally] =
   ;	
   ;	
   ;					tilemap[pwallx-1][pwally] = oldtile;
   ;	
	mov	bx,word ptr DGROUP:_pwallx
	dec	bx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr DGROUP:_pwally
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_pwallx
	dec	di
	mov	cl,6
	shl	di,cl
	add	di,word ptr DGROUP:_pwally
	mov	al,dl
	mov	byte ptr DGROUP:_tilemap[di],al
	mov	ah,0
	mov	word ptr DGROUP:_actorat[bx],ax
   ;	
   ;					break;
   ;	
	jmp	short @17@530
@17@530:
   ;	
   ;				}
   ;	
   ;				tilemap[pwallx][pwally] = oldtile | 0xc0;
   ;	
	mov	bx,word ptr DGROUP:_pwallx
	mov	cl,6
	shl	bx,cl
	add	bx,word ptr DGROUP:_pwally
	mov	al,dl
	or	al,192
	mov	byte ptr DGROUP:_tilemap[bx],al
@17@554:
   ;	
   ;			}
   ;		}
   ;	
   ;	
   ;		pwallpos = (pwallstate/2)&63;
   ;	
	mov	ax,word ptr DGROUP:_pwallstate
	shr	ax,1
	and	ax,63
	mov	word ptr DGROUP:_pwallpos,ax
@17@578:
   ;	
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_MovePWalls	endp
@17@C1888	label	word
	dw	@17@242
	dw	@17@314
	dw	@17@386
	dw	@17@458
_TEXT	ends
_BSS	segment word public 'BSS'
_areaconnect	label	byte
	db	1369 dup (?)
	db	1 dup (?)
_pwallx	label	word
	db	2 dup (?)
_pwally	label	word
	db	2 dup (?)
_areabyplayer	label	word
	db	74 dup (?)
_pwalldir	label	word
	db	2 dup (?)
_doornum	label	word
	db	2 dup (?)
_pwallpos	label	word
	db	2 dup (?)
_pwallstate	label	word
	db	2 dup (?)
_doorobjlist	label	word
	db	576 dup (?)
_doorposition	label	word
	db	128 dup (?)
_statobjlist	label	word
	db	3200 dup (?)
_menuitems	label	word
	db	2 dup (?)
_laststatobj	label	word
	db	2 dup (?)
_lastdoorobj	label	word
	db	2 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'Too many static objects!'
	db	10
	db	0
	db	'PlaceItemType: couldn'
	db	39
	db	't find type!'
	db	0
	db	'64+ doors on level!'
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	extrn	_PlaySoundLocGlobal:near
	public	_InitAreas
	extrn	__fmemset:near
	extrn	_gamestate:word
	public	_lastdoorobj
	public	_laststatobj
	public	_menuitems
	public	_PlaceItemType
	extrn	_mapwidth:word
	public	_statobjlist
	extrn	_SD_PlaySound:near
	public	_PushWall
	public	_OperateDoor
	extrn	_mapsegs:word
	public	_SpawnStatic
	extrn	_tilemap:byte
	extrn	_memset:near
	public	_SpawnDoor
	public	_CloseDoor
	public	_doorposition
	public	_OpenDoor
	public	_doorobjlist
	public	_statinfo
	extrn	_Quit:near
	public	_pwallstate
	extrn	_tics:word
	extrn	_spotvis:byte
	public	_DoorClosing
	public	_DoorOpening
	public	_InitStaticList
	extrn	_loadedgame:word
	public	_ConnectAreas
	public	_MovePWalls
	public	_MoveDoors
	extrn	_player:word
	public	_pwallpos
	public	_InitDoorList
	public	_doornum
	public	_pwalldir
	public	_areabyplayer
	public	_DoorOpen
	public	_RecursiveConnect
	public	_pwally
	public	_pwallx
	extrn	_farmapylookup:word
	public	_areaconnect
	extrn	_actorat:word
	end
