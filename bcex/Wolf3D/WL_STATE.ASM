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
	?debug	S "c:\wl_state.c"
	?debug	C E9E551FE7C0D633A5C776C5F73746174652E63
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
_opposite	label	word
	db	4
	db	0
	db	5
	db	0
	db	6
	db	0
	db	7
	db	0
	db	0
	db	0
	db	1
	db	0
	db	2
	db	0
	db	3
	db	0
	db	8
	db	0
_diagonal	label	word
	db	8
	db	0
	db	8
	db	0
	db	1
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	7
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	1
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	3
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	3
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	5
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	7
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	5
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
	db	8
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void SpawnNewObj (unsigned tilex, unsigned tiley, statetype *state)
   ;	
	assume	cs:_TEXT
_SpawnNewObj	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+6]
	mov	si,word ptr [bp+8]
   ;	
   ;	{
   ;		GetNewActor ();
   ;	
	call	near ptr _GetNewActor
   ;	
   ;		new->state = state;
   ;	
	mov	bx,word ptr DGROUP:_new
	mov	word ptr [bx+6],si
   ;	
   ;		if (state->tictime)
   ;	
	cmp	word ptr [si+4],0
	je	short @1@74
   ;	
   ;			new->ticcount = US_RndT () % state->tictime;
   ;	
	call	near ptr _US_RndT
	cwd	
	idiv	word ptr [si+4]
	mov	bx,word ptr DGROUP:_new
	mov	word ptr [bx+2],dx
	jmp	short @1@98
@1@74:
   ;	
   ;		else
   ;			new->ticcount = 0;
   ;	
	mov	bx,word ptr DGROUP:_new
	mov	word ptr [bx+2],0
@1@98:
   ;	
   ;	
   ;		new->tilex = tilex;
   ;	
	mov	bx,word ptr DGROUP:_new
	mov	ax,word ptr [bp+4]
	mov	word ptr [bx+23],ax
   ;	
   ;		new->tiley = tiley;
   ;	
	mov	bx,word ptr DGROUP:_new
	mov	word ptr [bx+25],di
   ;	
   ;		new->x = ((long)tilex<<TILESHIFT)+TILEGLOBAL/2;
   ;	
	mov	ax,word ptr [bp+4]
	xor	dx,dx
	add	dx,32768
	adc	ax,0
	mov	bx,word ptr DGROUP:_new
	mov	word ptr [bx+15],dx
	mov	word ptr [bx+17],ax
   ;	
   ;		new->y = ((long)tiley<<TILESHIFT)+TILEGLOBAL/2;
   ;	
	mov	ax,di
	xor	dx,dx
	add	dx,32768
	adc	ax,0
	mov	bx,word ptr DGROUP:_new
	mov	word ptr [bx+19],dx
	mov	word ptr [bx+21],ax
   ;	
   ;		new->dir = nodir;
   ;	
	mov	bx,word ptr DGROUP:_new
	mov	word ptr [bx+13],8
   ;	
   ;	
   ;		actorat[tilex][tiley] = new;
   ;	
	mov	bx,word ptr [bp+4]
	mov	cl,7
	shl	bx,cl
	mov	ax,di
	shl	ax,1
	add	bx,ax
	mov	ax,word ptr DGROUP:_new
	mov	word ptr DGROUP:_actorat[bx],ax
   ;	
   ;		new->areanumber =
   ;	
   ;	
   ;			*(mapsegs[0] + farmapylookup[new->tiley]+new->tilex) - AREATILE;
   ;	
	mov	bx,word ptr DGROUP:_new
	mov	bx,word ptr [bx+25]
	shl	bx,1
	mov	bx,word ptr DGROUP:_farmapylookup[bx]
	shl	bx,1
	mov	es,word ptr DGROUP:_mapsegs
	push	bx
	mov	bx,word ptr DGROUP:_new
	mov	ax,word ptr [bx+23]
	shl	ax,1
	pop	bx
	add	bx,ax
	mov	al,byte ptr es:[bx]
	sub	al,107
	mov	bx,word ptr DGROUP:_new
	mov	byte ptr [bx+27],al
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_SpawnNewObj	endp
   ;	
   ;	void NewState (objtype *ob, statetype *state)
   ;	
	assume	cs:_TEXT
_NewState	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	si,word ptr [bp+4]
	mov	di,word ptr [bp+6]
   ;	
   ;	{
   ;		ob->state = state;
   ;	
	mov	word ptr [si+6],di
   ;	
   ;		ob->ticcount = state->tictime;
   ;	
	mov	ax,word ptr [di+4]
	mov	word ptr [si+2],ax
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_NewState	endp
   ;	
   ;	boolean TryWalk (objtype *ob)
   ;	
	assume	cs:_TEXT
_TryWalk	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		int			doornum;
   ;		unsigned	temp;
   ;	
   ;		doornum = -1;
   ;	
	mov	word ptr [bp-2],65535
   ;	
   ;	
   ;		if (ob->obclass == inertobj)
   ;	
	cmp	word ptr [si+4],2
	jne	short @3@338
   ;	
   ;		{
   ;			switch (ob->dir)
   ;	
	mov	bx,word ptr [si+13]
	cmp	bx,7
	ja	short @3@314
	shl	bx,1
	jmp	word ptr cs:@3@C11732[bx]
@3@122:
   ;	
   ;			{
   ;			case north:
   ;				ob->tiley--;
   ;	
	dec	word ptr [si+25]
   ;	
   ;				break;
   ;	
	jmp	short @3@314
@3@146:
   ;	
   ;	
   ;			case northeast:
   ;				ob->tilex++;
   ;	
	inc	word ptr [si+23]
   ;	
   ;				ob->tiley--;
   ;	
	dec	word ptr [si+25]
   ;	
   ;				break;
   ;	
	jmp	short @3@314
@3@170:
   ;	
   ;	
   ;			case east:
   ;				ob->tilex++;
   ;	
	inc	word ptr [si+23]
   ;	
   ;				break;
   ;	
	jmp	short @3@314
@3@194:
   ;	
   ;	
   ;			case southeast:
   ;				ob->tilex++;
   ;	
	inc	word ptr [si+23]
   ;	
   ;				ob->tiley++;
   ;	
	inc	word ptr [si+25]
   ;	
   ;				break;
   ;	
	jmp	short @3@314
@3@218:
   ;	
   ;	
   ;			case south:
   ;				ob->tiley++;
   ;	
	inc	word ptr [si+25]
   ;	
   ;				break;
   ;	
	jmp	short @3@314
@3@242:
   ;	
   ;	
   ;			case southwest:
   ;				ob->tilex--;
   ;	
	dec	word ptr [si+23]
   ;	
   ;				ob->tiley++;
   ;	
	inc	word ptr [si+25]
   ;	
   ;				break;
   ;	
	jmp	short @3@314
@3@266:
   ;	
   ;	
   ;			case west:
   ;				ob->tilex--;
   ;	
	dec	word ptr [si+23]
   ;	
   ;				break;
   ;	
	jmp	short @3@314
@3@290:
   ;	
   ;	
   ;			case northwest:
   ;				ob->tilex--;
   ;	
	dec	word ptr [si+23]
   ;	
   ;				ob->tiley--;
   ;	
	dec	word ptr [si+25]
   ;	
   ;				break;
   ;	
	jmp	short @3@314
@3@314:
   ;	
   ;			}
   ;		}
   ;	
	jmp	@3@3530
@3@338:
   ;	
   ;		else
   ;			switch (ob->dir)
   ;	
	mov	bx,word ptr [si+13]
	cmp	bx,8
	jbe	@@0
	jmp	@3@3506
@@0:
	shl	bx,1
	jmp	word ptr cs:@3@C11870[bx]
@3@410:
   ;	
   ;			{
   ;			case north:
   ;				if (ob->obclass == dogobj || ob->obclass == fakeobj)
   ;	
	cmp	word ptr [si+4],6
	je	short @3@458
	cmp	word ptr [si+4],9
	jne	short @3@602
@3@458:
   ;	
   ;				{
   ;					CHECKDIAG(ob->tilex,ob->tiley-1);
   ;	
	mov	bx,word ptr [si+23]
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	dec	ax
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@578
	cmp	di,256
	jae	short @3@530
	xor	ax,ax
	jmp	@3@3602
@3@530:
	test	byte ptr [di+8],1
	je	short @3@578
	xor	ax,ax
	jmp	@3@3602
@3@578:
   ;	
   ;				}
   ;	
	jmp	short @3@770
@3@602:
   ;	
   ;				else
   ;				{
   ;					CHECKSIDE(ob->tilex,ob->tiley-1);
   ;	
	mov	bx,word ptr [si+23]
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	dec	ax
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@770
	cmp	di,128
	jae	short @3@674
	xor	ax,ax
	jmp	@3@3602
@3@674:
	cmp	di,256
	jae	short @3@722
	mov	ax,di
	and	ax,63
	mov	word ptr [bp-2],ax
	jmp	short @3@770
@3@722:
	test	byte ptr [di+8],1
	je	short @3@770
	xor	ax,ax
	jmp	@3@3602
@3@770:
   ;	
   ;				}
   ;				ob->tiley--;
   ;	
	dec	word ptr [si+25]
   ;	
   ;				break;
   ;	
	jmp	@3@3530
@3@794:
   ;	
   ;	
   ;			case northeast:
   ;				CHECKDIAG(ob->tilex+1,ob->tiley-1);
   ;	
	mov	bx,word ptr [si+23]
	inc	bx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	dec	ax
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@914
	cmp	di,256
	jae	short @3@866
	xor	ax,ax
	jmp	@3@3602
@3@866:
	test	byte ptr [di+8],1
	je	short @3@914
	xor	ax,ax
	jmp	@3@3602
@3@914:
   ;	
   ;				CHECKDIAG(ob->tilex+1,ob->tiley);
   ;	
	mov	bx,word ptr [si+23]
	inc	bx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@1034
	cmp	di,256
	jae	short @3@986
	xor	ax,ax
	jmp	@3@3602
@3@986:
	test	byte ptr [di+8],1
	je	short @3@1034
	xor	ax,ax
	jmp	@3@3602
@3@1034:
   ;	
   ;				CHECKDIAG(ob->tilex,ob->tiley-1);
   ;	
	mov	bx,word ptr [si+23]
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	dec	ax
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@1154
	cmp	di,256
	jae	short @3@1106
	xor	ax,ax
	jmp	@3@3602
@3@1106:
	test	byte ptr [di+8],1
	je	short @3@1154
	xor	ax,ax
	jmp	@3@3602
@3@1154:
   ;	
   ;				ob->tilex++;
   ;	
	inc	word ptr [si+23]
   ;	
   ;				ob->tiley--;
   ;	
	dec	word ptr [si+25]
   ;	
   ;				break;
   ;	
	jmp	@3@3530
@3@1178:
   ;	
   ;	
   ;			case east:
   ;				if (ob->obclass == dogobj || ob->obclass == fakeobj)
   ;	
	cmp	word ptr [si+4],6
	je	short @3@1226
	cmp	word ptr [si+4],9
	jne	short @3@1370
@3@1226:
   ;	
   ;				{
   ;					CHECKDIAG(ob->tilex+1,ob->tiley);
   ;	
	mov	bx,word ptr [si+23]
	inc	bx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@1346
	cmp	di,256
	jae	short @3@1298
	xor	ax,ax
	jmp	@3@3602
@3@1298:
	test	byte ptr [di+8],1
	je	short @3@1346
	xor	ax,ax
	jmp	@3@3602
@3@1346:
   ;	
   ;				}
   ;	
	jmp	short @3@1538
@3@1370:
   ;	
   ;				else
   ;				{
   ;					CHECKSIDE(ob->tilex+1,ob->tiley);
   ;	
	mov	bx,word ptr [si+23]
	inc	bx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@1538
	cmp	di,128
	jae	short @3@1442
	xor	ax,ax
	jmp	@3@3602
@3@1442:
	cmp	di,256
	jae	short @3@1490
	mov	ax,di
	and	ax,63
	mov	word ptr [bp-2],ax
	jmp	short @3@1538
@3@1490:
	test	byte ptr [di+8],1
	je	short @3@1538
	xor	ax,ax
	jmp	@3@3602
@3@1538:
   ;	
   ;				}
   ;				ob->tilex++;
   ;	
	inc	word ptr [si+23]
   ;	
   ;				break;
   ;	
	jmp	@3@3530
@3@1562:
   ;	
   ;	
   ;			case southeast:
   ;				CHECKDIAG(ob->tilex+1,ob->tiley+1);
   ;	
	mov	bx,word ptr [si+23]
	inc	bx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	inc	ax
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@1682
	cmp	di,256
	jae	short @3@1634
	xor	ax,ax
	jmp	@3@3602
@3@1634:
	test	byte ptr [di+8],1
	je	short @3@1682
	xor	ax,ax
	jmp	@3@3602
@3@1682:
   ;	
   ;				CHECKDIAG(ob->tilex+1,ob->tiley);
   ;	
	mov	bx,word ptr [si+23]
	inc	bx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@1802
	cmp	di,256
	jae	short @3@1754
	xor	ax,ax
	jmp	@3@3602
@3@1754:
	test	byte ptr [di+8],1
	je	short @3@1802
	xor	ax,ax
	jmp	@3@3602
@3@1802:
   ;	
   ;				CHECKDIAG(ob->tilex,ob->tiley+1);
   ;	
	mov	bx,word ptr [si+23]
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	inc	ax
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@1922
	cmp	di,256
	jae	short @3@1874
	xor	ax,ax
	jmp	@3@3602
@3@1874:
	test	byte ptr [di+8],1
	je	short @3@1922
	xor	ax,ax
	jmp	@3@3602
@3@1922:
   ;	
   ;				ob->tilex++;
   ;	
	inc	word ptr [si+23]
   ;	
   ;				ob->tiley++;
   ;	
	inc	word ptr [si+25]
   ;	
   ;				break;
   ;	
	jmp	@3@3530
@3@1946:
   ;	
   ;	
   ;			case south:
   ;				if (ob->obclass == dogobj || ob->obclass == fakeobj)
   ;	
	cmp	word ptr [si+4],6
	je	short @3@1994
	cmp	word ptr [si+4],9
	jne	short @3@2138
@3@1994:
   ;	
   ;				{
   ;					CHECKDIAG(ob->tilex,ob->tiley+1);
   ;	
	mov	bx,word ptr [si+23]
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	inc	ax
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@2114
	cmp	di,256
	jae	short @3@2066
	xor	ax,ax
	jmp	@3@3602
@3@2066:
	test	byte ptr [di+8],1
	je	short @3@2114
	xor	ax,ax
	jmp	@3@3602
@3@2114:
   ;	
   ;				}
   ;	
	jmp	short @3@2306
@3@2138:
   ;	
   ;				else
   ;				{
   ;					CHECKSIDE(ob->tilex,ob->tiley+1);
   ;	
	mov	bx,word ptr [si+23]
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	inc	ax
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@2306
	cmp	di,128
	jae	short @3@2210
	xor	ax,ax
	jmp	@3@3602
@3@2210:
	cmp	di,256
	jae	short @3@2258
	mov	ax,di
	and	ax,63
	mov	word ptr [bp-2],ax
	jmp	short @3@2306
@3@2258:
	test	byte ptr [di+8],1
	je	short @3@2306
	xor	ax,ax
	jmp	@3@3602
@3@2306:
   ;	
   ;				}
   ;				ob->tiley++;
   ;	
	inc	word ptr [si+25]
   ;	
   ;				break;
   ;	
	jmp	@3@3530
@3@2330:
   ;	
   ;	
   ;			case southwest:
   ;				CHECKDIAG(ob->tilex-1,ob->tiley+1);
   ;	
	mov	bx,word ptr [si+23]
	dec	bx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	inc	ax
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@2450
	cmp	di,256
	jae	short @3@2402
	xor	ax,ax
	jmp	@3@3602
@3@2402:
	test	byte ptr [di+8],1
	je	short @3@2450
	xor	ax,ax
	jmp	@3@3602
@3@2450:
   ;	
   ;				CHECKDIAG(ob->tilex-1,ob->tiley);
   ;	
	mov	bx,word ptr [si+23]
	dec	bx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@2570
	cmp	di,256
	jae	short @3@2522
	xor	ax,ax
	jmp	@3@3602
@3@2522:
	test	byte ptr [di+8],1
	je	short @3@2570
	xor	ax,ax
	jmp	@3@3602
@3@2570:
   ;	
   ;				CHECKDIAG(ob->tilex,ob->tiley+1);
   ;	
	mov	bx,word ptr [si+23]
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	inc	ax
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@2690
	cmp	di,256
	jae	short @3@2642
	xor	ax,ax
	jmp	@3@3602
@3@2642:
	test	byte ptr [di+8],1
	je	short @3@2690
	xor	ax,ax
	jmp	@3@3602
@3@2690:
   ;	
   ;				ob->tilex--;
   ;	
	dec	word ptr [si+23]
   ;	
   ;				ob->tiley++;
   ;	
	inc	word ptr [si+25]
   ;	
   ;				break;
   ;	
	jmp	@3@3530
@3@2714:
   ;	
   ;	
   ;			case west:
   ;				if (ob->obclass == dogobj || ob->obclass == fakeobj)
   ;	
	cmp	word ptr [si+4],6
	je	short @3@2762
	cmp	word ptr [si+4],9
	jne	short @3@2906
@3@2762:
   ;	
   ;				{
   ;					CHECKDIAG(ob->tilex-1,ob->tiley);
   ;	
	mov	bx,word ptr [si+23]
	dec	bx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@2882
	cmp	di,256
	jae	short @3@2834
	xor	ax,ax
	jmp	@3@3602
@3@2834:
	test	byte ptr [di+8],1
	je	short @3@2882
	xor	ax,ax
	jmp	@3@3602
@3@2882:
   ;	
   ;				}
   ;	
	jmp	short @3@3074
@3@2906:
   ;	
   ;				else
   ;				{
   ;					CHECKSIDE(ob->tilex-1,ob->tiley);
   ;	
	mov	bx,word ptr [si+23]
	dec	bx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@3074
	cmp	di,128
	jae	short @3@2978
	xor	ax,ax
	jmp	@3@3602
@3@2978:
	cmp	di,256
	jae	short @3@3026
	mov	ax,di
	and	ax,63
	mov	word ptr [bp-2],ax
	jmp	short @3@3074
@3@3026:
	test	byte ptr [di+8],1
	je	short @3@3074
	xor	ax,ax
	jmp	@3@3602
@3@3074:
   ;	
   ;				}
   ;				ob->tilex--;
   ;	
	dec	word ptr [si+23]
   ;	
   ;				break;
   ;	
	jmp	@3@3530
@3@3098:
   ;	
   ;	
   ;			case northwest:
   ;				CHECKDIAG(ob->tilex-1,ob->tiley-1);
   ;	
	mov	bx,word ptr [si+23]
	dec	bx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	dec	ax
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@3218
	cmp	di,256
	jae	short @3@3170
	xor	ax,ax
	jmp	@3@3602
@3@3170:
	test	byte ptr [di+8],1
	je	short @3@3218
	xor	ax,ax
	jmp	@3@3602
@3@3218:
   ;	
   ;				CHECKDIAG(ob->tilex-1,ob->tiley);
   ;	
	mov	bx,word ptr [si+23]
	dec	bx
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@3338
	cmp	di,256
	jae	short @3@3290
	xor	ax,ax
	jmp	@3@3602
@3@3290:
	test	byte ptr [di+8],1
	je	short @3@3338
	xor	ax,ax
	jmp	@3@3602
@3@3338:
   ;	
   ;				CHECKDIAG(ob->tilex,ob->tiley-1);
   ;	
	mov	bx,word ptr [si+23]
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	dec	ax
	shl	ax,1
	add	bx,ax
	mov	di,word ptr DGROUP:_actorat[bx]
	or	di,di
	je	short @3@3458
	cmp	di,256
	jae	short @3@3410
	xor	ax,ax
	jmp	short @3@3602
@3@3410:
	test	byte ptr [di+8],1
	je	short @3@3458
	xor	ax,ax
	jmp	short @3@3602
@3@3458:
   ;	
   ;				ob->tilex--;
   ;	
	dec	word ptr [si+23]
   ;	
   ;				ob->tiley--;
   ;	
	dec	word ptr [si+25]
   ;	
   ;				break;
   ;	
	jmp	short @3@3530
@3@3482:
   ;	
   ;	
   ;			case nodir:
   ;				return false;
   ;	
	xor	ax,ax
	jmp	short @3@3602
@3@3506:
   ;	
   ;	
   ;			default:
   ;				Quit ("Walk: Bad dir");
   ;	
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _Quit
	pop	cx
@3@3530:
   ;	
   ;			}
   ;	
   ;		if (doornum != -1)
   ;	
	cmp	word ptr [bp-2],65535
	je	short @3@3578
   ;	
   ;		{
   ;			OpenDoor (doornum);
   ;	
	push	word ptr [bp-2]
	call	near ptr _OpenDoor
	pop	cx
   ;	
   ;			ob->distance = -doornum-1;
   ;	
	mov	ax,word ptr [bp-2]
	neg	ax
	dec	ax
	cwd	
	mov	word ptr [si+9],ax
	mov	word ptr [si+11],dx
   ;	
   ;			return true;
   ;	
	mov	ax,1
	jmp	short @3@3602
@3@3578:
   ;	
   ;		}
   ;	
   ;	
   ;		ob->areanumber =
   ;	
   ;	
   ;			*(mapsegs[0] + farmapylookup[ob->tiley]+ob->tilex) - AREATILE;
   ;	
	mov	bx,word ptr [si+25]
	shl	bx,1
	mov	bx,word ptr DGROUP:_farmapylookup[bx]
	shl	bx,1
	mov	es,word ptr DGROUP:_mapsegs
	mov	ax,word ptr [si+23]
	shl	ax,1
	add	bx,ax
	mov	al,byte ptr es:[bx]
	sub	al,107
	mov	byte ptr [si+27],al
   ;	
   ;	
   ;		ob->distance = TILEGLOBAL;
   ;	
	mov	word ptr [si+9],0
	mov	word ptr [si+11],1
   ;	
   ;		return true;
   ;	
	mov	ax,1
	jmp	short @3@3602
@3@3602:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_TryWalk	endp
@3@C11870	label	word
	dw	@3@1178
	dw	@3@794
	dw	@3@410
	dw	@3@3098
	dw	@3@2714
	dw	@3@2330
	dw	@3@1946
	dw	@3@1562
	dw	@3@3482
@3@C11732	label	word
	dw	@3@170
	dw	@3@146
	dw	@3@122
	dw	@3@290
	dw	@3@266
	dw	@3@242
	dw	@3@218
	dw	@3@194
   ;	
   ;	void SelectDodgeDir (objtype *ob)
   ;	
	assume	cs:_TEXT
_SelectDodgeDir	proc	near
	push	bp
	mov	bp,sp
	sub	sp,22
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		int 		deltax,deltay,i;
   ;		unsigned	absdx,absdy;
   ;		dirtype 	dirtry[5];
   ;		dirtype 	turnaround,tdir;
   ;	
   ;		if (ob->flags & FL_FIRSTATTACK)
   ;	
	test	byte ptr [si+8],32
	je	short @4@74
   ;	
   ;		{
   ;		//
   ;		// turning around is only ok the very first time after noticing the
   ;		// player
   ;		//
   ;			turnaround = nodir;
   ;	
	mov	word ptr [bp-22],8
   ;	
   ;			ob->flags &= ~FL_FIRSTATTACK;
   ;	
	mov	al,byte ptr [si+8]
	and	al,223
	mov	byte ptr [si+8],al
   ;	
   ;		}
   ;	
	jmp	short @4@98
@4@74:
   ;	
   ;		else
   ;			turnaround=opposite[ob->dir];
   ;	
	mov	bx,word ptr [si+13]
	shl	bx,1
	mov	ax,word ptr DGROUP:_opposite[bx]
	mov	word ptr [bp-22],ax
@4@98:
   ;	
   ;	
   ;		deltax = player->tilex - ob->tilex;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+23]
	sub	ax,word ptr [si+23]
	mov	word ptr [bp-2],ax
   ;	
   ;		deltay = player->tiley - ob->tiley;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+25]
	sub	ax,word ptr [si+25]
	mov	word ptr [bp-4],ax
   ;	
   ;	
   ;	//
   ;	// arange 5 direction choices in order of preference
   ;	// the four cardinal directions plus the diagonal straight towards
   ;	// the player
   ;	//
   ;	
   ;		if (deltax>0)
   ;	
	cmp	word ptr [bp-2],0
	jle	short @4@146
   ;	
   ;		{
   ;			dirtry[1]= east;
   ;	
	mov	word ptr [bp-18],0
   ;	
   ;			dirtry[3]= west;
   ;	
	mov	word ptr [bp-14],4
   ;	
   ;		}
   ;	
	jmp	short @4@170
@4@146:
   ;	
   ;		else
   ;		{
   ;			dirtry[1]= west;
   ;	
	mov	word ptr [bp-18],4
   ;	
   ;			dirtry[3]= east;
   ;	
	mov	word ptr [bp-14],0
@4@170:
   ;	
   ;		}
   ;	
   ;		if (deltay>0)
   ;	
	cmp	word ptr [bp-4],0
	jle	short @4@218
   ;	
   ;		{
   ;			dirtry[2]= south;
   ;	
	mov	word ptr [bp-16],6
   ;	
   ;			dirtry[4]= north;
   ;	
	mov	word ptr [bp-12],2
   ;	
   ;		}
   ;	
	jmp	short @4@242
@4@218:
   ;	
   ;		else
   ;		{
   ;			dirtry[2]= north;
   ;	
	mov	word ptr [bp-16],2
   ;	
   ;			dirtry[4]= south;
   ;	
	mov	word ptr [bp-12],6
@4@242:
   ;	
   ;		}
   ;	
   ;	//
   ;	// randomize a bit for dodging
   ;	//
   ;		absdx = abs(deltax);
   ;	
	mov	ax,word ptr [bp-2]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	word ptr [bp-8],ax
   ;	
   ;		absdy = abs(deltay);
   ;	
	mov	ax,word ptr [bp-4]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	word ptr [bp-10],ax
   ;	
   ;	
   ;		if (absdx > absdy)
   ;	
	mov	ax,word ptr [bp-8]
	cmp	ax,word ptr [bp-10]
	jbe	short @4@290
   ;	
   ;		{
   ;			tdir = dirtry[1];
   ;	
	mov	di,word ptr [bp-18]
   ;	
   ;			dirtry[1] = dirtry[2];
   ;	
	mov	ax,word ptr [bp-16]
	mov	word ptr [bp-18],ax
   ;	
   ;			dirtry[2] = tdir;
   ;	
	mov	word ptr [bp-16],di
   ;	
   ;			tdir = dirtry[3];
   ;	
	mov	di,word ptr [bp-14]
   ;	
   ;			dirtry[3] = dirtry[4];
   ;	
	mov	ax,word ptr [bp-12]
	mov	word ptr [bp-14],ax
   ;	
   ;			dirtry[4] = tdir;
   ;	
	mov	word ptr [bp-12],di
@4@290:
   ;	
   ;		}
   ;	
   ;		if (US_RndT() < 128)
   ;	
	call	near ptr _US_RndT
	cmp	ax,128
	jge	short @4@338
   ;	
   ;		{
   ;			tdir = dirtry[1];
   ;	
	mov	di,word ptr [bp-18]
   ;	
   ;			dirtry[1] = dirtry[2];
   ;	
	mov	ax,word ptr [bp-16]
	mov	word ptr [bp-18],ax
   ;	
   ;			dirtry[2] = tdir;
   ;	
	mov	word ptr [bp-16],di
   ;	
   ;			tdir = dirtry[3];
   ;	
	mov	di,word ptr [bp-14]
   ;	
   ;			dirtry[3] = dirtry[4];
   ;	
	mov	ax,word ptr [bp-12]
	mov	word ptr [bp-14],ax
   ;	
   ;			dirtry[4] = tdir;
   ;	
	mov	word ptr [bp-12],di
@4@338:
   ;	
   ;		}
   ;	
   ;		dirtry[0] = diagonal [ dirtry[1] ] [ dirtry[2] ];
   ;	
	mov	ax,word ptr [bp-18]
	mov	dx,18
	imul	dx
	mov	dx,word ptr [bp-16]
	shl	dx,1
	add	ax,dx
	mov	bx,ax
	mov	ax,word ptr DGROUP:_diagonal[bx]
	mov	word ptr [bp-20],ax
   ;	
   ;	
   ;	//
   ;	// try the directions util one works
   ;	//
   ;		for (i=0;i<5;i++)
   ;	
	mov	word ptr [bp-6],0
	jmp	short @4@506
@4@362:
   ;	
   ;		{
   ;			if ( dirtry[i] == nodir || dirtry[i] == turnaround)
   ;	
	mov	bx,word ptr [bp-6]
	shl	bx,1
	lea	ax,word ptr [bp-20]
	add	bx,ax
	cmp	word ptr [bx],8
	je	short @4@410
	mov	bx,word ptr [bp-6]
	shl	bx,1
	lea	ax,word ptr [bp-20]
	add	bx,ax
	mov	ax,word ptr [bx]
	cmp	ax,word ptr [bp-22]
	jne	short @4@434
@4@410:
   ;	
   ;				continue;
   ;	
	jmp	short @4@482
@4@434:
   ;	
   ;	
   ;			ob->dir = dirtry[i];
   ;	
	mov	bx,word ptr [bp-6]
	shl	bx,1
	lea	ax,word ptr [bp-20]
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [si+13],ax
   ;	
   ;			if (TryWalk(ob))
   ;	
	push	si
	call	near ptr _TryWalk
	pop	cx
	or	ax,ax
	je	short @4@482
   ;	
   ;				return;
   ;	
	jmp	short @4@626
@4@482:
	inc	word ptr [bp-6]
@4@506:
	cmp	word ptr [bp-6],5
	jl	short @4@362
   ;	
   ;		}
   ;	
   ;	//
   ;	// turn around only as a last resort
   ;	//
   ;		if (turnaround != nodir)
   ;	
	cmp	word ptr [bp-22],8
	je	short @4@602
   ;	
   ;		{
   ;			ob->dir = turnaround;
   ;	
	mov	ax,word ptr [bp-22]
	mov	word ptr [si+13],ax
   ;	
   ;	
   ;			if (TryWalk(ob))
   ;	
	push	si
	call	near ptr _TryWalk
	pop	cx
	or	ax,ax
	je	short @4@602
   ;	
   ;				return;
   ;	
	jmp	short @4@626
@4@602:
   ;	
   ;		}
   ;	
   ;		ob->dir = nodir;
   ;	
	mov	word ptr [si+13],8
@4@626:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_SelectDodgeDir	endp
   ;	
   ;	void SelectChaseDir (objtype *ob)
   ;	
	assume	cs:_TEXT
_SelectChaseDir	proc	near
	push	bp
	mov	bp,sp
	sub	sp,14
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		int deltax,deltay,i;
   ;		dirtype d[3];
   ;		dirtype tdir, olddir, turnaround;
   ;	
   ;	
   ;		olddir=ob->dir;
   ;	
	mov	ax,word ptr [si+13]
	mov	word ptr [bp-12],ax
   ;	
   ;		turnaround=opposite[olddir];
   ;	
	mov	bx,word ptr [bp-12]
	shl	bx,1
	mov	ax,word ptr DGROUP:_opposite[bx]
	mov	word ptr [bp-14],ax
   ;	
   ;	
   ;		deltax=player->tilex - ob->tilex;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+23]
	sub	ax,word ptr [si+23]
	mov	word ptr [bp-2],ax
   ;	
   ;		deltay=player->tiley - ob->tiley;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+25]
	sub	ax,word ptr [si+25]
	mov	word ptr [bp-4],ax
   ;	
   ;	
   ;		d[1]=nodir;
   ;	
	mov	word ptr [bp-8],8
   ;	
   ;		d[2]=nodir;
   ;	
	mov	word ptr [bp-6],8
   ;	
   ;	
   ;		if (deltax>0)
   ;	
	cmp	word ptr [bp-2],0
	jle	short @5@74
   ;	
   ;			d[1]= east;
   ;	
	mov	word ptr [bp-8],0
	jmp	short @5@122
@5@74:
   ;	
   ;		else if (deltax<0)
   ;	
	cmp	word ptr [bp-2],0
	jge	short @5@122
   ;	
   ;			d[1]= west;
   ;	
	mov	word ptr [bp-8],4
@5@122:
   ;	
   ;		if (deltay>0)
   ;	
	cmp	word ptr [bp-4],0
	jle	short @5@170
   ;	
   ;			d[2]=south;
   ;	
	mov	word ptr [bp-6],6
	jmp	short @5@218
@5@170:
   ;	
   ;		else if (deltay<0)
   ;	
	cmp	word ptr [bp-4],0
	jge	short @5@218
   ;	
   ;			d[2]=north;
   ;	
	mov	word ptr [bp-6],2
@5@218:
   ;	
   ;	
   ;		if (abs(deltay)>abs(deltax))
   ;	
	mov	ax,word ptr [bp-4]
	cwd	
	xor	ax,dx
	sub	ax,dx
	push	ax
	mov	ax,word ptr [bp-2]
	cwd	
	xor	ax,dx
	sub	ax,dx
	pop	dx
	cmp	dx,ax
	jle	short @5@266
   ;	
   ;		{
   ;			tdir=d[1];
   ;	
	mov	di,word ptr [bp-8]
   ;	
   ;			d[1]=d[2];
   ;	
	mov	ax,word ptr [bp-6]
	mov	word ptr [bp-8],ax
   ;	
   ;			d[2]=tdir;
   ;	
	mov	word ptr [bp-6],di
@5@266:
   ;	
   ;		}
   ;	
   ;		if (d[1]==turnaround)
   ;	
	mov	ax,word ptr [bp-8]
	cmp	ax,word ptr [bp-14]
	jne	short @5@314
   ;	
   ;			d[1]=nodir;
   ;	
	mov	word ptr [bp-8],8
@5@314:
   ;	
   ;		if (d[2]==turnaround)
   ;	
	mov	ax,word ptr [bp-6]
	cmp	ax,word ptr [bp-14]
	jne	short @5@362
   ;	
   ;			d[2]=nodir;
   ;	
	mov	word ptr [bp-6],8
@5@362:
   ;	
   ;	
   ;	
   ;		if (d[1]!=nodir)
   ;	
	cmp	word ptr [bp-8],8
	je	short @5@434
   ;	
   ;		{
   ;			ob->dir=d[1];
   ;	
	mov	ax,word ptr [bp-8]
	mov	word ptr [si+13],ax
   ;	
   ;			if (TryWalk(ob))
   ;	
	push	si
	call	near ptr _TryWalk
	pop	cx
	or	ax,ax
	je	short @5@434
   ;	
   ;				return;     /*either moved forward or attacked*/
   ;	
	jmp	@5@1034
@5@434:
   ;	
   ;		}
   ;	
   ;		if (d[2]!=nodir)
   ;	
	cmp	word ptr [bp-6],8
	je	short @5@506
   ;	
   ;		{
   ;			ob->dir=d[2];
   ;	
	mov	ax,word ptr [bp-6]
	mov	word ptr [si+13],ax
   ;	
   ;			if (TryWalk(ob))
   ;	
	push	si
	call	near ptr _TryWalk
	pop	cx
	or	ax,ax
	je	short @5@506
   ;	
   ;				return;
   ;	
	jmp	@5@1034
@5@506:
   ;	
   ;		}
   ;	
   ;	/* there is no direct path to the player, so pick another direction */
   ;	
   ;		if (olddir!=nodir)
   ;	
	cmp	word ptr [bp-12],8
	je	short @5@578
   ;	
   ;		{
   ;			ob->dir=olddir;
   ;	
	mov	ax,word ptr [bp-12]
	mov	word ptr [si+13],ax
   ;	
   ;			if (TryWalk(ob))
   ;	
	push	si
	call	near ptr _TryWalk
	pop	cx
	or	ax,ax
	je	short @5@578
   ;	
   ;				return;
   ;	
	jmp	short @5@1034
@5@578:
   ;	
   ;		}
   ;	
   ;		if (US_RndT()>128) 	/*randomly determine direction of search*/
   ;	
	call	near ptr _US_RndT
	cmp	ax,128
	jle	short @5@770
   ;	
   ;		{
   ;			for (tdir=north;tdir<=west;tdir++)
   ;	
	mov	di,2
	jmp	short @5@722
@5@626:
   ;	
   ;			{
   ;				if (tdir!=turnaround)
   ;	
	cmp	di,word ptr [bp-14]
	je	short @5@698
   ;	
   ;				{
   ;					ob->dir=tdir;
   ;	
	mov	word ptr [si+13],di
   ;	
   ;					if ( TryWalk(ob) )
   ;	
	push	si
	call	near ptr _TryWalk
	pop	cx
	or	ax,ax
	je	short @5@698
   ;	
   ;						return;
   ;	
	jmp	short @5@1034
@5@698:
	inc	di
@5@722:
	cmp	di,4
	jle	short @5@626
   ;	
   ;				}
   ;			}
   ;		}
   ;	
	jmp	short @5@914
@5@770:
   ;	
   ;		else
   ;		{
   ;			for (tdir=west;tdir>=north;tdir--)
   ;	
	mov	di,4
	jmp	short @5@890
@5@794:
   ;	
   ;			{
   ;				if (tdir!=turnaround)
   ;	
	cmp	di,word ptr [bp-14]
	je	short @5@866
   ;	
   ;				{
   ;				  ob->dir=tdir;
   ;	
	mov	word ptr [si+13],di
   ;	
   ;				  if ( TryWalk(ob) )
   ;	
	push	si
	call	near ptr _TryWalk
	pop	cx
	or	ax,ax
	je	short @5@866
   ;	
   ;					return;
   ;	
	jmp	short @5@1034
@5@866:
	dec	di
@5@890:
	cmp	di,2
	jge	short @5@794
@5@914:
   ;	
   ;				}
   ;			}
   ;		}
   ;	
   ;		if (turnaround !=  nodir)
   ;	
	cmp	word ptr [bp-14],8
	je	short @5@1010
   ;	
   ;		{
   ;			ob->dir=turnaround;
   ;	
	mov	ax,word ptr [bp-14]
	mov	word ptr [si+13],ax
   ;	
   ;			if (ob->dir != nodir)
   ;	
	cmp	word ptr [si+13],8
	je	short @5@1010
   ;	
   ;			{
   ;				if ( TryWalk(ob) )
   ;	
	push	si
	call	near ptr _TryWalk
	pop	cx
	or	ax,ax
	je	short @5@1010
   ;	
   ;					return;
   ;	
	jmp	short @5@1034
@5@1010:
   ;	
   ;			}
   ;		}
   ;	
   ;		ob->dir = nodir;		// can't move
   ;	
	mov	word ptr [si+13],8
@5@1034:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_SelectChaseDir	endp
   ;	
   ;	void SelectRunDir (objtype *ob)
   ;	
	assume	cs:_TEXT
_SelectRunDir	proc	near
	push	bp
	mov	bp,sp
	sub	sp,10
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		int deltax,deltay,i;
   ;		dirtype d[3];
   ;		dirtype tdir, olddir, turnaround;
   ;	
   ;	
   ;		deltax=player->tilex - ob->tilex;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+23]
	sub	ax,word ptr [si+23]
	mov	word ptr [bp-2],ax
   ;	
   ;		deltay=player->tiley - ob->tiley;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+25]
	sub	ax,word ptr [si+25]
	mov	word ptr [bp-4],ax
   ;	
   ;	
   ;		if (deltax<0)
   ;	
	cmp	word ptr [bp-2],0
	jge	short @6@74
   ;	
   ;			d[1]= east;
   ;	
	mov	word ptr [bp-8],0
	jmp	short @6@98
@6@74:
   ;	
   ;		else
   ;			d[1]= west;
   ;	
	mov	word ptr [bp-8],4
@6@98:
   ;	
   ;		if (deltay<0)
   ;	
	cmp	word ptr [bp-4],0
	jge	short @6@146
   ;	
   ;			d[2]=south;
   ;	
	mov	word ptr [bp-6],6
	jmp	short @6@170
@6@146:
   ;	
   ;		else
   ;			d[2]=north;
   ;	
	mov	word ptr [bp-6],2
@6@170:
   ;	
   ;	
   ;		if (abs(deltay)>abs(deltax))
   ;	
	mov	ax,word ptr [bp-4]
	cwd	
	xor	ax,dx
	sub	ax,dx
	push	ax
	mov	ax,word ptr [bp-2]
	cwd	
	xor	ax,dx
	sub	ax,dx
	pop	dx
	cmp	dx,ax
	jle	short @6@218
   ;	
   ;		{
   ;			tdir=d[1];
   ;	
	mov	di,word ptr [bp-8]
   ;	
   ;			d[1]=d[2];
   ;	
	mov	ax,word ptr [bp-6]
	mov	word ptr [bp-8],ax
   ;	
   ;			d[2]=tdir;
   ;	
	mov	word ptr [bp-6],di
@6@218:
   ;	
   ;		}
   ;	
   ;		ob->dir=d[1];
   ;	
	mov	ax,word ptr [bp-8]
	mov	word ptr [si+13],ax
   ;	
   ;		if (TryWalk(ob))
   ;	
	push	si
	call	near ptr _TryWalk
	pop	cx
	or	ax,ax
	je	short @6@266
   ;	
   ;			return;     /*either moved forward or attacked*/
   ;	
	jmp	short @6@626
@6@266:
   ;	
   ;	
   ;		ob->dir=d[2];
   ;	
	mov	ax,word ptr [bp-6]
	mov	word ptr [si+13],ax
   ;	
   ;		if (TryWalk(ob))
   ;	
	push	si
	call	near ptr _TryWalk
	pop	cx
	or	ax,ax
	je	short @6@314
   ;	
   ;			return;
   ;	
	jmp	short @6@626
@6@314:
   ;	
   ;	
   ;	/* there is no direct path to the player, so pick another direction */
   ;	
   ;		if (US_RndT()>128) 	/*randomly determine direction of search*/
   ;	
	call	near ptr _US_RndT
	cmp	ax,128
	jle	short @6@482
   ;	
   ;		{
   ;			for (tdir=north;tdir<=west;tdir++)
   ;	
	mov	di,2
	jmp	short @6@434
@6@362:
   ;	
   ;			{
   ;				ob->dir=tdir;
   ;	
	mov	word ptr [si+13],di
   ;	
   ;				if ( TryWalk(ob) )
   ;	
	push	si
	call	near ptr _TryWalk
	pop	cx
	or	ax,ax
	je	short @6@410
   ;	
   ;					return;
   ;	
	jmp	short @6@626
@6@410:
	inc	di
@6@434:
	cmp	di,4
	jle	short @6@362
   ;	
   ;			}
   ;		}
   ;	
	jmp	short @6@602
@6@482:
   ;	
   ;		else
   ;		{
   ;			for (tdir=west;tdir>=north;tdir--)
   ;	
	mov	di,4
	jmp	short @6@578
@6@506:
   ;	
   ;			{
   ;				ob->dir=tdir;
   ;	
	mov	word ptr [si+13],di
   ;	
   ;				if ( TryWalk(ob) )
   ;	
	push	si
	call	near ptr _TryWalk
	pop	cx
	or	ax,ax
	je	short @6@554
   ;	
   ;				  return;
   ;	
	jmp	short @6@626
@6@554:
	dec	di
@6@578:
	cmp	di,2
	jge	short @6@506
@6@602:
   ;	
   ;			}
   ;		}
   ;	
   ;		ob->dir = nodir;		// can't move
   ;	
	mov	word ptr [si+13],8
@6@626:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_SelectRunDir	endp
   ;	
   ;	void MoveObj (objtype *ob, long move)
   ;	
	assume	cs:_TEXT
_MoveObj	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		long	deltax,deltay;
   ;	
   ;		switch (ob->dir)
   ;	
	mov	bx,word ptr [si+13]
	cmp	bx,8
	jbe	@@1
	jmp	@7@314
@@1:
	shl	bx,1
	jmp	word ptr cs:@7@C3728[bx]
@7@98:
   ;	
   ;		{
   ;		case north:
   ;			ob->y -= move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	sub	word ptr [si+19],dx
	sbb	word ptr [si+21],ax
   ;	
   ;			break;
   ;	
	jmp	@7@338
@7@122:
   ;	
   ;		case northeast:
   ;			ob->x += move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	add	word ptr [si+15],dx
	adc	word ptr [si+17],ax
   ;	
   ;			ob->y -= move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	sub	word ptr [si+19],dx
	sbb	word ptr [si+21],ax
   ;	
   ;			break;
   ;	
	jmp	@7@338
@7@146:
   ;	
   ;		case east:
   ;			ob->x += move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	add	word ptr [si+15],dx
	adc	word ptr [si+17],ax
   ;	
   ;			break;
   ;	
	jmp	short @7@338
@7@170:
   ;	
   ;		case southeast:
   ;			ob->x += move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	add	word ptr [si+15],dx
	adc	word ptr [si+17],ax
   ;	
   ;			ob->y += move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	add	word ptr [si+19],dx
	adc	word ptr [si+21],ax
   ;	
   ;			break;
   ;	
	jmp	short @7@338
@7@194:
   ;	
   ;		case south:
   ;			ob->y += move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	add	word ptr [si+19],dx
	adc	word ptr [si+21],ax
   ;	
   ;			break;
   ;	
	jmp	short @7@338
@7@218:
   ;	
   ;		case southwest:
   ;			ob->x -= move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	sub	word ptr [si+15],dx
	sbb	word ptr [si+17],ax
   ;	
   ;			ob->y += move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	add	word ptr [si+19],dx
	adc	word ptr [si+21],ax
   ;	
   ;			break;
   ;	
	jmp	short @7@338
@7@242:
   ;	
   ;		case west:
   ;			ob->x -= move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	sub	word ptr [si+15],dx
	sbb	word ptr [si+17],ax
   ;	
   ;			break;
   ;	
	jmp	short @7@338
@7@266:
   ;	
   ;		case northwest:
   ;			ob->x -= move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	sub	word ptr [si+15],dx
	sbb	word ptr [si+17],ax
   ;	
   ;			ob->y -= move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	sub	word ptr [si+19],dx
	sbb	word ptr [si+21],ax
   ;	
   ;			break;
   ;	
	jmp	short @7@338
@7@290:
   ;	
   ;	
   ;		case nodir:
   ;			return;
   ;	
	jmp	@7@1106
@7@314:
   ;	
   ;	
   ;		default:
   ;			Quit ("MoveObj: bad dir!");
   ;	
	mov	ax,offset DGROUP:s@+14
	push	ax
	call	near ptr _Quit
	pop	cx
@7@338:
   ;	
   ;		}
   ;	
   ;	//
   ;	// check to make sure it's not on top of player
   ;	//
   ;		if (areabyplayer[ob->areanumber])
   ;	
	mov	al,byte ptr [si+27]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	cmp	word ptr DGROUP:_areabyplayer[bx],0
	jne	@@2
	jmp	@7@1082
@@2:
   ;	
   ;		{
   ;			deltax = ob->x - player->x;
   ;	
	mov	ax,word ptr [si+17]
	mov	dx,word ptr [si+15]
	mov	bx,word ptr DGROUP:_player
	sub	dx,word ptr [bx+15]
	sbb	ax,word ptr [bx+17]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;			if (deltax < -MINACTORDIST || deltax > MINACTORDIST)
   ;	
	cmp	word ptr [bp-2],65535
	jl	short @7@506
	jne	short @7@434
	cmp	word ptr [bp-4],0
	jb	short @7@506
@7@434:
	cmp	word ptr [bp-2],1
	jl	short @7@530
	jg	short @7@506
	cmp	word ptr [bp-4],0
	jbe	short @7@530
@7@506:
   ;	
   ;				goto moveok;
   ;	
	jmp	@7@1082
@7@530:
   ;	
   ;			deltay = ob->y - player->y;
   ;	
	mov	ax,word ptr [si+21]
	mov	dx,word ptr [si+19]
	mov	bx,word ptr DGROUP:_player
	sub	dx,word ptr [bx+19]
	sbb	ax,word ptr [bx+21]
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;			if (deltay < -MINACTORDIST || deltay > MINACTORDIST)
   ;	
	cmp	word ptr [bp-6],65535
	jl	short @7@674
	jne	short @7@602
	cmp	word ptr [bp-8],0
	jb	short @7@674
@7@602:
	cmp	word ptr [bp-6],1
	jl	short @7@698
	jg	short @7@674
	cmp	word ptr [bp-8],0
	jbe	short @7@698
@7@674:
   ;	
   ;				goto moveok;
   ;	
	jmp	@7@1082
@7@698:
   ;	
   ;	
   ;			if (ob->obclass == ghostobj || ob->obclass == spectreobj)
   ;	
	cmp	word ptr [si+4],15
	je	short @7@746
	cmp	word ptr [si+4],21
	jne	short @7@770
@7@746:
   ;	
   ;				TakeDamage (tics*2,ob);
   ;	
	push	si
	mov	ax,word ptr DGROUP:_tics
	shl	ax,1
	push	ax
	call	near ptr _TakeDamage
	pop	cx
	pop	cx
@7@770:
   ;	
   ;	
   ;		//
   ;		// back up
   ;		//
   ;			switch (ob->dir)
   ;	
	mov	bx,word ptr [si+13]
	cmp	bx,8
	jbe	@@3
	jmp	@7@1058
@@3:
	shl	bx,1
	jmp	word ptr cs:@7@C3866[bx]
@7@842:
   ;	
   ;			{
   ;			case north:
   ;				ob->y += move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	add	word ptr [si+19],dx
	adc	word ptr [si+21],ax
   ;	
   ;				break;
   ;	
	jmp	@7@1058
@7@866:
   ;	
   ;			case northeast:
   ;				ob->x -= move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	sub	word ptr [si+15],dx
	sbb	word ptr [si+17],ax
   ;	
   ;				ob->y += move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	add	word ptr [si+19],dx
	adc	word ptr [si+21],ax
   ;	
   ;				break;
   ;	
	jmp	short @7@1058
@7@890:
   ;	
   ;			case east:
   ;				ob->x -= move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	sub	word ptr [si+15],dx
	sbb	word ptr [si+17],ax
   ;	
   ;				break;
   ;	
	jmp	short @7@1058
@7@914:
   ;	
   ;			case southeast:
   ;				ob->x -= move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	sub	word ptr [si+15],dx
	sbb	word ptr [si+17],ax
   ;	
   ;				ob->y -= move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	sub	word ptr [si+19],dx
	sbb	word ptr [si+21],ax
   ;	
   ;				break;
   ;	
	jmp	short @7@1058
@7@938:
   ;	
   ;			case south:
   ;				ob->y -= move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	sub	word ptr [si+19],dx
	sbb	word ptr [si+21],ax
   ;	
   ;				break;
   ;	
	jmp	short @7@1058
@7@962:
   ;	
   ;			case southwest:
   ;				ob->x += move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	add	word ptr [si+15],dx
	adc	word ptr [si+17],ax
   ;	
   ;				ob->y -= move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	sub	word ptr [si+19],dx
	sbb	word ptr [si+21],ax
   ;	
   ;				break;
   ;	
	jmp	short @7@1058
@7@986:
   ;	
   ;			case west:
   ;				ob->x += move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	add	word ptr [si+15],dx
	adc	word ptr [si+17],ax
   ;	
   ;				break;
   ;	
	jmp	short @7@1058
@7@1010:
   ;	
   ;			case northwest:
   ;				ob->x += move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	add	word ptr [si+15],dx
	adc	word ptr [si+17],ax
   ;	
   ;				ob->y += move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	add	word ptr [si+19],dx
	adc	word ptr [si+21],ax
   ;	
   ;				break;
   ;	
	jmp	short @7@1058
@7@1034:
   ;	
   ;	
   ;			case nodir:
   ;				return;
   ;	
	jmp	short @7@1106
@7@1058:
   ;	
   ;			}
   ;			return;
   ;	
	jmp	short @7@1106
@7@1082:
   ;	
   ;		}
   ;	moveok:
   ;		ob->distance -=move;
   ;	
	mov	ax,word ptr [bp+8]
	mov	dx,word ptr [bp+6]
	sub	word ptr [si+9],dx
	sbb	word ptr [si+11],ax
@7@1106:
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_MoveObj	endp
@7@C3866	label	word
	dw	@7@890
	dw	@7@866
	dw	@7@842
	dw	@7@1010
	dw	@7@986
	dw	@7@962
	dw	@7@938
	dw	@7@914
	dw	@7@1034
@7@C3728	label	word
	dw	@7@146
	dw	@7@122
	dw	@7@98
	dw	@7@266
	dw	@7@242
	dw	@7@218
	dw	@7@194
	dw	@7@170
	dw	@7@290
   ;	
   ;	void DropItem (stat_t itemtype, int tilex, int tiley)
   ;	
	assume	cs:_TEXT
_DropItem	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	push	di
   ;	
   ;	{
   ;		int	x,y,xl,xh,yl,yh;
   ;	
   ;	//
   ;	// find a free spot to put it in
   ;	//
   ;		if (!actorat[tilex][tiley])
   ;	
	mov	bx,word ptr [bp+6]
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [bp+8]
	shl	ax,1
	add	bx,ax
	cmp	word ptr DGROUP:_actorat[bx],0
	jne	short @8@74
   ;	
   ;		{
   ;			PlaceItemType (itemtype, tilex,tiley);
   ;	
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr _PlaceItemType
	add	sp,6
   ;	
   ;			return;
   ;	
	jmp	short @8@266
@8@74:
   ;	
   ;		}
   ;	
   ;		xl = tilex-1;
   ;	
	mov	ax,word ptr [bp+6]
	dec	ax
	mov	word ptr [bp-2],ax
   ;	
   ;		xh = tilex+1;
   ;	
	mov	ax,word ptr [bp+6]
	inc	ax
	mov	word ptr [bp-4],ax
   ;	
   ;		yl = tiley-1;
   ;	
	mov	ax,word ptr [bp+8]
	dec	ax
	mov	word ptr [bp-6],ax
   ;	
   ;		yh = tiley+1;
   ;	
	mov	ax,word ptr [bp+8]
	inc	ax
	mov	word ptr [bp-8],ax
   ;	
   ;	
   ;		for (x=xl ; x<= xh ; x++)
   ;	
	mov	di,word ptr [bp-2]
	jmp	short @8@242
@8@98:
   ;	
   ;			for (y=yl ; y<= yh ; y++)
   ;	
	mov	si,word ptr [bp-6]
	jmp	short @8@194
@8@122:
   ;	
   ;				if (!actorat[x][y])
   ;	
	mov	bx,di
	mov	cl,7
	shl	bx,cl
	mov	ax,si
	shl	ax,1
	add	bx,ax
	cmp	word ptr DGROUP:_actorat[bx],0
	jne	short @8@170
   ;	
   ;				{
   ;					PlaceItemType (itemtype, x,y);
   ;	
	push	si
	push	di
	push	word ptr [bp+4]
	call	near ptr _PlaceItemType
	add	sp,6
   ;	
   ;					return;
   ;	
	jmp	short @8@266
@8@170:
	inc	si
@8@194:
	cmp	si,word ptr [bp-8]
	jle	short @8@122
	inc	di
@8@242:
	cmp	di,word ptr [bp-4]
	jle	short @8@98
@8@266:
   ;	
   ;				}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_DropItem	endp
   ;	
   ;	void KillActor (objtype *ob)
   ;	
	assume	cs:_TEXT
_KillActor	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		int	tilex,tiley;
   ;	
   ;		tilex = ob->tilex = ob->x >> TILESHIFT;		// drop item on center
   ;	
	mov	ax,word ptr [si+17]
	cwd	
	mov	word ptr [si+23],ax
	mov	word ptr [bp-2],ax
   ;	
   ;		tiley = ob->tiley = ob->y >> TILESHIFT;
   ;	
	mov	ax,word ptr [si+21]
	cwd	
	mov	word ptr [si+25],ax
	mov	di,ax
   ;	
   ;	
   ;		switch (ob->obclass)
   ;	
	mov	bx,word ptr [si+4]
	sub	bx,3
	cmp	bx,16
	jbe	@@4
	jmp	@9@506
@@4:
	shl	bx,1
	jmp	word ptr cs:@9@C1934[bx]
@9@122:
   ;	
   ;		{
   ;		case guardobj:
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
   ;			NewState (ob,&s_grddie1);
   ;	
	mov	ax,offset DGROUP:_s_grddie1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			PlaceItemType (bo_clip2,tilex,tiley);
   ;	
	push	di
	push	word ptr [bp-2]
	mov	ax,14
	push	ax
	call	near ptr _PlaceItemType
	add	sp,6
   ;	
   ;			break;
   ;	
	jmp	@9@506
@9@146:
   ;	
   ;	
   ;		case officerobj:
   ;			GivePoints (400);
   ;	
	xor	ax,ax
	mov	dx,400
	push	ax
	push	dx
	call	near ptr _GivePoints
	pop	cx
	pop	cx
   ;	
   ;			NewState (ob,&s_ofcdie1);
   ;	
	mov	ax,offset DGROUP:_s_ofcdie1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			PlaceItemType (bo_clip2,tilex,tiley);
   ;	
	push	di
	push	word ptr [bp-2]
	mov	ax,14
	push	ax
	call	near ptr _PlaceItemType
	add	sp,6
   ;	
   ;			break;
   ;	
	jmp	@9@506
@9@170:
   ;	
   ;	
   ;		case mutantobj:
   ;			GivePoints (700);
   ;	
	xor	ax,ax
	mov	dx,700
	push	ax
	push	dx
	call	near ptr _GivePoints
	pop	cx
	pop	cx
   ;	
   ;			NewState (ob,&s_mutdie1);
   ;	
	mov	ax,offset DGROUP:_s_mutdie1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			PlaceItemType (bo_clip2,tilex,tiley);
   ;	
	push	di
	push	word ptr [bp-2]
	mov	ax,14
	push	ax
	call	near ptr _PlaceItemType
	add	sp,6
   ;	
   ;			break;
   ;	
	jmp	@9@506
@9@194:
   ;	
   ;	
   ;		case ssobj:
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
   ;			NewState (ob,&s_ssdie1);
   ;	
	mov	ax,offset DGROUP:_s_ssdie1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			if (gamestate.bestweapon < wp_machinegun)
   ;	
	cmp	word ptr DGROUP:_gamestate+24,2
	jge	short @9@242
   ;	
   ;				PlaceItemType (bo_machinegun,tilex,tiley);
   ;	
	push	di
	push	word ptr [bp-2]
	mov	ax,15
	push	ax
	call	near ptr _PlaceItemType
	add	sp,6
	jmp	short @9@266
@9@242:
   ;	
   ;			else
   ;				PlaceItemType (bo_clip2,tilex,tiley);
   ;	
	push	di
	push	word ptr [bp-2]
	mov	ax,14
	push	ax
	call	near ptr _PlaceItemType
	add	sp,6
@9@266:
   ;	
   ;			break;
   ;	
	jmp	@9@506
@9@290:
   ;	
   ;	
   ;		case dogobj:
   ;			GivePoints (200);
   ;	
	xor	ax,ax
	mov	dx,200
	push	ax
	push	dx
	call	near ptr _GivePoints
	pop	cx
	pop	cx
   ;	
   ;			NewState (ob,&s_dogdie1);
   ;	
	mov	ax,offset DGROUP:_s_dogdie1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	@9@506
@9@314:
   ;	
   ;	
   ;	#ifndef SPEAR
   ;		case bossobj:
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
   ;			NewState (ob,&s_bossdie1);
   ;	
	mov	ax,offset DGROUP:_s_bossdie1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			PlaceItemType (bo_key1,tilex,tiley);
   ;	
	push	di
	push	word ptr [bp-2]
	mov	ax,5
	push	ax
	call	near ptr _PlaceItemType
	add	sp,6
   ;	
   ;			break;
   ;	
	jmp	@9@506
@9@338:
   ;	
   ;	
   ;		case gretelobj:
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
   ;			NewState (ob,&s_greteldie1);
   ;	
	mov	ax,offset DGROUP:_s_greteldie1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			PlaceItemType (bo_key1,tilex,tiley);
   ;	
	push	di
	push	word ptr [bp-2]
	mov	ax,5
	push	ax
	call	near ptr _PlaceItemType
	add	sp,6
   ;	
   ;			break;
   ;	
	jmp	@9@506
@9@362:
   ;	
   ;	
   ;		case giftobj:
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
   ;			gamestate.killx = player->x;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+17]
	mov	dx,word ptr [bx+15]
	mov	word ptr DGROUP:_gamestate+56,dx
	mov	word ptr DGROUP:_gamestate+58,ax
   ;	
   ;			gamestate.killy = player->y;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+21]
	mov	dx,word ptr [bx+19]
	mov	word ptr DGROUP:_gamestate+60,dx
	mov	word ptr DGROUP:_gamestate+62,ax
   ;	
   ;			NewState (ob,&s_giftdie1);
   ;	
	mov	ax,offset DGROUP:_s_giftdie1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	@9@506
@9@386:
   ;	
   ;	
   ;		case fatobj:
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
   ;			gamestate.killx = player->x;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+17]
	mov	dx,word ptr [bx+15]
	mov	word ptr DGROUP:_gamestate+56,dx
	mov	word ptr DGROUP:_gamestate+58,ax
   ;	
   ;			gamestate.killy = player->y;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+21]
	mov	dx,word ptr [bx+19]
	mov	word ptr DGROUP:_gamestate+60,dx
	mov	word ptr DGROUP:_gamestate+62,ax
   ;	
   ;			NewState (ob,&s_fatdie1);
   ;	
	mov	ax,offset DGROUP:_s_fatdie1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	@9@506
@9@410:
   ;	
   ;	
   ;		case schabbobj:
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
   ;			gamestate.killx = player->x;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+17]
	mov	dx,word ptr [bx+15]
	mov	word ptr DGROUP:_gamestate+56,dx
	mov	word ptr DGROUP:_gamestate+58,ax
   ;	
   ;			gamestate.killy = player->y;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+21]
	mov	dx,word ptr [bx+19]
	mov	word ptr DGROUP:_gamestate+60,dx
	mov	word ptr DGROUP:_gamestate+62,ax
   ;	
   ;			NewState (ob,&s_schabbdie1);
   ;	
	mov	ax,offset DGROUP:_s_schabbdie1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			A_DeathScream(ob);
   ;	
	push	si
	call	near ptr _A_DeathScream
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	short @9@506
@9@434:
   ;	
   ;		case fakeobj:
   ;			GivePoints (2000);
   ;	
	xor	ax,ax
	mov	dx,2000
	push	ax
	push	dx
	call	near ptr _GivePoints
	pop	cx
	pop	cx
   ;	
   ;			NewState (ob,&s_fakedie1);
   ;	
	mov	ax,offset DGROUP:_s_fakedie1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	short @9@506
@9@458:
   ;	
   ;	
   ;		case mechahitlerobj:
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
   ;			NewState (ob,&s_mechadie1);
   ;	
	mov	ax,offset DGROUP:_s_mechadie1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	short @9@506
@9@482:
   ;	
   ;		case realhitlerobj:
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
   ;			gamestate.killx = player->x;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+17]
	mov	dx,word ptr [bx+15]
	mov	word ptr DGROUP:_gamestate+56,dx
	mov	word ptr DGROUP:_gamestate+58,ax
   ;	
   ;			gamestate.killy = player->y;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+21]
	mov	dx,word ptr [bx+19]
	mov	word ptr DGROUP:_gamestate+60,dx
	mov	word ptr DGROUP:_gamestate+62,ax
   ;	
   ;			NewState (ob,&s_hitlerdie1);
   ;	
	mov	ax,offset DGROUP:_s_hitlerdie1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			A_DeathScream(ob);
   ;	
	push	si
	call	near ptr _A_DeathScream
	pop	cx
   ;	
   ;			break;
   ;	
	jmp	short @9@506
@9@506:
   ;	
   ;	#else
   ;		case spectreobj:
   ;			GivePoints (200);
   ;			NewState (ob,&s_spectredie1);
   ;			break;
   ;	
   ;		case angelobj:
   ;			GivePoints (5000);
   ;			NewState (ob,&s_angeldie1);
   ;			break;
   ;	
   ;		case transobj:
   ;			GivePoints (5000);
   ;			NewState (ob,&s_transdie0);
   ;			PlaceItemType (bo_key1,tilex,tiley);
   ;			break;
   ;	
   ;		case uberobj:
   ;			GivePoints (5000);
   ;			NewState (ob,&s_uberdie0);
   ;			PlaceItemType (bo_key1,tilex,tiley);
   ;			break;
   ;	
   ;		case willobj:
   ;			GivePoints (5000);
   ;			NewState (ob,&s_willdie1);
   ;			PlaceItemType (bo_key1,tilex,tiley);
   ;			break;
   ;	
   ;		case deathobj:
   ;			GivePoints (5000);
   ;			NewState (ob,&s_deathdie1);
   ;			PlaceItemType (bo_key1,tilex,tiley);
   ;			break;
   ;	#endif
   ;		}
   ;	
   ;		gamestate.killcount++;
   ;	
	inc	word ptr DGROUP:_gamestate+44
   ;	
   ;		ob->flags &= ~FL_SHOOTABLE;
   ;	
	mov	al,byte ptr [si+8]
	and	al,254
	mov	byte ptr [si+8],al
   ;	
   ;		actorat[ob->tilex][ob->tiley] = NULL;
   ;	
	mov	bx,word ptr [si+23]
	mov	cl,7
	shl	bx,cl
	mov	ax,word ptr [si+25]
	shl	ax,1
	add	bx,ax
	mov	word ptr DGROUP:_actorat[bx],0
   ;	
   ;		ob->flags |= FL_NONMARK;
   ;	
	mov	al,byte ptr [si+8]
	or	al,128
	mov	byte ptr [si+8],al
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_KillActor	endp
@9@C1934	label	word
	dw	@9@122
	dw	@9@146
	dw	@9@194
	dw	@9@290
	dw	@9@314
	dw	@9@410
	dw	@9@434
	dw	@9@458
	dw	@9@170
	dw	@9@506
	dw	@9@506
	dw	@9@506
	dw	@9@506
	dw	@9@482
	dw	@9@338
	dw	@9@362
	dw	@9@386
   ;	
   ;	void DamageActor (objtype *ob, unsigned damage)
   ;	
	assume	cs:_TEXT
_DamageActor	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		madenoise = true;
   ;	
	mov	word ptr DGROUP:_madenoise,1
   ;	
   ;	
   ;	//
   ;	// do double damage if shooting a non attack mode actor
   ;	//
   ;		if ( !(ob->flags & FL_ATTACKMODE) )
   ;	
	mov	al,byte ptr [si+8]
	mov	ah,0
	test	ax,16
	jne	short @10@74
   ;	
   ;			damage <<= 1;
   ;	
	shl	word ptr [bp+6],1
@10@74:
   ;	
   ;	
   ;		ob->hitpoints -= damage;
   ;	
	mov	ax,word ptr [si+42]
	sub	ax,word ptr [bp+6]
	mov	word ptr [si+42],ax
   ;	
   ;	
   ;		if (ob->hitpoints<=0)
   ;	
	cmp	word ptr [si+42],0
	jg	short @10@122
   ;	
   ;			KillActor (ob);
   ;	
	push	si
	call	near ptr _KillActor
	pop	cx
	jmp	@10@626
@10@122:
   ;	
   ;		else
   ;		{
   ;			if (! (ob->flags & FL_ATTACKMODE) )
   ;	
	mov	al,byte ptr [si+8]
	mov	ah,0
	test	ax,16
	jne	short @10@170
   ;	
   ;				FirstSighting (ob);		// put into combat mode
   ;	
	push	si
	call	near ptr _FirstSighting
	pop	cx
@10@170:
   ;	
   ;	
   ;			switch (ob->obclass)		// dogs only have one hit point
   ;	
	mov	bx,word ptr [si+4]
	sub	bx,3
	cmp	bx,8
	jbe	@@5
	jmp	@10@626
@@5:
	shl	bx,1
	jmp	word ptr cs:@10@C2164[bx]
@10@242:
   ;	
   ;			{
   ;			case guardobj:
   ;				if (ob->hitpoints&1)
   ;	
	test	word ptr [si+42],1
	je	short @10@290
   ;	
   ;					NewState (ob,&s_grdpain);
   ;	
	mov	ax,offset DGROUP:_s_grdpain
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
	jmp	short @10@314
@10@290:
   ;	
   ;				else
   ;					NewState (ob,&s_grdpain1);
   ;	
	mov	ax,offset DGROUP:_s_grdpain1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
@10@314:
   ;	
   ;				break;
   ;	
	jmp	short @10@626
@10@338:
   ;	
   ;	
   ;			case officerobj:
   ;				if (ob->hitpoints&1)
   ;	
	test	word ptr [si+42],1
	je	short @10@386
   ;	
   ;					NewState (ob,&s_ofcpain);
   ;	
	mov	ax,offset DGROUP:_s_ofcpain
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
	jmp	short @10@410
@10@386:
   ;	
   ;				else
   ;					NewState (ob,&s_ofcpain1);
   ;	
	mov	ax,offset DGROUP:_s_ofcpain1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
@10@410:
   ;	
   ;				break;
   ;	
	jmp	short @10@626
@10@434:
   ;	
   ;	
   ;			case mutantobj:
   ;				if (ob->hitpoints&1)
   ;	
	test	word ptr [si+42],1
	je	short @10@482
   ;	
   ;					NewState (ob,&s_mutpain);
   ;	
	mov	ax,offset DGROUP:_s_mutpain
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
	jmp	short @10@506
@10@482:
   ;	
   ;				else
   ;					NewState (ob,&s_mutpain1);
   ;	
	mov	ax,offset DGROUP:_s_mutpain1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
@10@506:
   ;	
   ;				break;
   ;	
	jmp	short @10@626
@10@530:
   ;	
   ;	
   ;			case ssobj:
   ;				if (ob->hitpoints&1)
   ;	
	test	word ptr [si+42],1
	je	short @10@578
   ;	
   ;					NewState (ob,&s_sspain);
   ;	
	mov	ax,offset DGROUP:_s_sspain
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
	jmp	short @10@602
@10@578:
   ;	
   ;				else
   ;					NewState (ob,&s_sspain1);
   ;	
	mov	ax,offset DGROUP:_s_sspain1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
@10@602:
   ;	
   ;	
   ;				break;
   ;	
	jmp	short @10@626
@10@626:
   ;	
   ;	
   ;			}
   ;		}
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_DamageActor	endp
@10@C2164	label	word
	dw	@10@242
	dw	@10@338
	dw	@10@530
	dw	@10@626
	dw	@10@626
	dw	@10@626
	dw	@10@626
	dw	@10@626
	dw	@10@434
   ;	
   ;	boolean CheckLine (objtype *ob)
   ;	
	assume	cs:_TEXT
_CheckLine	proc	near
	push	bp
	mov	bp,sp
	sub	sp,42
	push	si
	push	di
   ;	
   ;	{
   ;		int	x1,y1,xt1,yt1,x2,y2,xt2,yt2;
   ;		int	x,y;
   ;		int	xdist,ydist,xstep,ystep;
   ;		int	temp;
   ;		int	partial,delta;
   ;		long	ltemp;
   ;		int	xfrac,yfrac,deltafrac;
   ;		unsigned	value,intercept;
   ;	
   ;		x1 = ob->x >> UNSIGNEDSHIFT;		// 1/256 tile precision
   ;	
	mov	bx,word ptr [bp+4]
	mov	dx,word ptr [bx+17]
	mov	ax,word ptr [bx+15]
	mov	cl,8
	call	near ptr N_LXRSH@
	mov	word ptr [bp-2],ax
   ;	
   ;		y1 = ob->y >> UNSIGNEDSHIFT;
   ;	
	mov	bx,word ptr [bp+4]
	mov	dx,word ptr [bx+21]
	mov	ax,word ptr [bx+19]
	mov	cl,8
	call	near ptr N_LXRSH@
	mov	word ptr [bp-4],ax
   ;	
   ;		xt1 = x1 >> 8;
   ;	
	mov	ax,word ptr [bp-2]
	mov	cl,8
	sar	ax,cl
	mov	word ptr [bp-6],ax
   ;	
   ;		yt1 = y1 >> 8;
   ;	
	mov	ax,word ptr [bp-4]
	mov	cl,8
	sar	ax,cl
	mov	word ptr [bp-8],ax
   ;	
   ;	
   ;		x2 = plux;
   ;	
	mov	ax,word ptr DGROUP:_plux
	mov	word ptr [bp-10],ax
   ;	
   ;		y2 = pluy;
   ;	
	mov	ax,word ptr DGROUP:_pluy
	mov	word ptr [bp-12],ax
   ;	
   ;		xt2 = player->tilex;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+23]
	mov	word ptr [bp-14],ax
   ;	
   ;		yt2 = player->tiley;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+25]
	mov	word ptr [bp-16],ax
   ;	
   ;	
   ;	
   ;		xdist = abs(xt2-xt1);
   ;	
	mov	ax,word ptr [bp-14]
	sub	ax,word ptr [bp-6]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	word ptr [bp-22],ax
   ;	
   ;	
   ;		if (xdist > 0)
   ;	
	cmp	word ptr [bp-22],0
	jg	@@6
	jmp	@11@554
@@6:
   ;	
   ;		{
   ;			if (xt2 > xt1)
   ;	
	mov	ax,word ptr [bp-14]
	cmp	ax,word ptr [bp-6]
	jle	short @11@98
   ;	
   ;			{
   ;				partial = 256-(x1&0xff);
   ;	
	mov	ax,word ptr [bp-2]
	and	ax,255
	mov	dx,256
	sub	dx,ax
	mov	word ptr [bp-28],dx
   ;	
   ;				xstep = 1;
   ;	
	mov	word ptr [bp-26],1
   ;	
   ;			}
   ;	
	jmp	short @11@122
@11@98:
   ;	
   ;			else
   ;			{
   ;				partial = x1&0xff;
   ;	
	mov	ax,word ptr [bp-2]
	and	ax,255
	mov	word ptr [bp-28],ax
   ;	
   ;				xstep = -1;
   ;	
	mov	word ptr [bp-26],65535
@11@122:
   ;	
   ;			}
   ;	
   ;			deltafrac = abs(x2-x1);
   ;	
	mov	ax,word ptr [bp-10]
	sub	ax,word ptr [bp-2]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	word ptr [bp-40],ax
   ;	
   ;			delta = y2-y1;
   ;	
	mov	ax,word ptr [bp-12]
	sub	ax,word ptr [bp-4]
	mov	word ptr [bp-30],ax
   ;	
   ;			ltemp = ((long)delta<<8)/deltafrac;
   ;	
	mov	ax,word ptr [bp-40]
	cwd	
	push	dx
	push	ax
	mov	ax,word ptr [bp-30]
	cwd	
	mov	cl,8
	call	near ptr N_LXLSH@
	push	dx
	push	ax
	call	near ptr N_LDIV@
	mov	word ptr [bp-34],ax
	mov	word ptr [bp-32],dx
   ;	
   ;			if (ltemp > 0x7fffl)
   ;	
	cmp	word ptr [bp-32],0
	jl	short @11@218
	jg	short @11@194
	cmp	word ptr [bp-34],32767
	jbe	short @11@218
@11@194:
   ;	
   ;				ystep = 0x7fff;
   ;	
	mov	di,32767
	jmp	short @11@338
@11@218:
   ;	
   ;			else if (ltemp < -0x7fffl)
   ;	
	cmp	word ptr [bp-32],65535
	jg	short @11@314
	jl	short @11@290
	cmp	word ptr [bp-34],32769
	jae	short @11@314
@11@290:
   ;	
   ;				ystep = -0x7fff;
   ;	
	mov	di,32769
	jmp	short @11@338
@11@314:
   ;	
   ;			else
   ;				ystep = ltemp;
   ;	
	mov	di,word ptr [bp-34]
@11@338:
   ;	
   ;			yfrac = y1 + (((long)ystep*partial) >>8);
   ;	
	mov	ax,di
	cwd	
	push	ax
	mov	ax,word ptr [bp-28]
	push	dx
	cwd	
	pop	cx
	pop	bx
	call	near ptr N_LXMUL@
	mov	cl,8
	call	near ptr N_LXRSH@
	mov	dx,word ptr [bp-4]
	add	dx,ax
	mov	word ptr [bp-38],dx
   ;	
   ;	
   ;			x = xt1+xstep;
   ;	
	mov	ax,word ptr [bp-6]
	add	ax,word ptr [bp-26]
	mov	word ptr [bp-18],ax
   ;	
   ;			xt2 += xstep;
   ;	
	mov	ax,word ptr [bp-26]
	add	word ptr [bp-14],ax
@11@362:
   ;	
   ;			do
   ;			{
   ;				y = yfrac>>8;
   ;	
	mov	ax,word ptr [bp-38]
	mov	cl,8
	sar	ax,cl
	mov	word ptr [bp-20],ax
   ;	
   ;				yfrac += ystep;
   ;	
	add	word ptr [bp-38],di
   ;	
   ;	
   ;				value = (unsigned)tilemap[x][y];
   ;	
	mov	bx,word ptr [bp-18]
	mov	cl,6
	shl	bx,cl
	add	bx,word ptr [bp-20]
	mov	al,byte ptr DGROUP:_tilemap[bx]
	mov	ah,0
	mov	si,ax
   ;	
   ;				x += xstep;
   ;	
	mov	ax,word ptr [bp-26]
	add	word ptr [bp-18],ax
   ;	
   ;	
   ;				if (!value)
   ;	
	or	si,si
	jne	short @11@410
   ;	
   ;					continue;
   ;	
	jmp	short @11@530
@11@410:
   ;	
   ;	
   ;				if (value<128 || value>256)
   ;	
	cmp	si,128
	jb	short @11@458
	cmp	si,256
	jbe	short @11@482
@11@458:
   ;	
   ;					return false;
   ;	
	xor	ax,ax
	jmp	@11@1106
@11@482:
   ;	
   ;	
   ;				//
   ;				// see if the door is open enough
   ;				//
   ;				value &= ~0x80;
   ;	
	and	si,65407
   ;	
   ;				intercept = yfrac-ystep/2;
   ;	
	mov	ax,di
	mov	bx,2
	cwd	
	idiv	bx
	mov	dx,word ptr [bp-38]
	sub	dx,ax
	mov	word ptr [bp-42],dx
   ;	
   ;	
   ;				if (intercept>doorposition[value])
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr DGROUP:_doorposition[bx]
	cmp	ax,word ptr [bp-42]
	jae	short @11@530
   ;	
   ;					return false;
   ;	
	xor	ax,ax
	jmp	@11@1106
@11@530:
   ;	
   ;	
   ;			} while (x != xt2);
   ;	
	mov	ax,word ptr [bp-18]
	cmp	ax,word ptr [bp-14]
	jne	short @11@362
@11@554:
   ;	
   ;		}
   ;	
   ;		ydist = abs(yt2-yt1);
   ;	
	mov	ax,word ptr [bp-16]
	sub	ax,word ptr [bp-8]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	word ptr [bp-24],ax
   ;	
   ;	
   ;		if (ydist > 0)
   ;	
	cmp	word ptr [bp-24],0
	jg	@@7
	jmp	@11@1082
@@7:
   ;	
   ;		{
   ;			if (yt2 > yt1)
   ;	
	mov	ax,word ptr [bp-16]
	cmp	ax,word ptr [bp-8]
	jle	short @11@626
   ;	
   ;			{
   ;				partial = 256-(y1&0xff);
   ;	
	mov	ax,word ptr [bp-4]
	and	ax,255
	mov	dx,256
	sub	dx,ax
	mov	word ptr [bp-28],dx
   ;	
   ;				ystep = 1;
   ;	
	mov	di,1
   ;	
   ;			}
   ;	
	jmp	short @11@650
@11@626:
   ;	
   ;			else
   ;			{
   ;				partial = y1&0xff;
   ;	
	mov	ax,word ptr [bp-4]
	and	ax,255
	mov	word ptr [bp-28],ax
   ;	
   ;				ystep = -1;
   ;	
	mov	di,65535
@11@650:
   ;	
   ;			}
   ;	
   ;			deltafrac = abs(y2-y1);
   ;	
	mov	ax,word ptr [bp-12]
	sub	ax,word ptr [bp-4]
	cwd	
	xor	ax,dx
	sub	ax,dx
	mov	word ptr [bp-40],ax
   ;	
   ;			delta = x2-x1;
   ;	
	mov	ax,word ptr [bp-10]
	sub	ax,word ptr [bp-2]
	mov	word ptr [bp-30],ax
   ;	
   ;			ltemp = ((long)delta<<8)/deltafrac;
   ;	
	mov	ax,word ptr [bp-40]
	cwd	
	push	dx
	push	ax
	mov	ax,word ptr [bp-30]
	cwd	
	mov	cl,8
	call	near ptr N_LXLSH@
	push	dx
	push	ax
	call	near ptr N_LDIV@
	mov	word ptr [bp-34],ax
	mov	word ptr [bp-32],dx
   ;	
   ;			if (ltemp > 0x7fffl)
   ;	
	cmp	word ptr [bp-32],0
	jl	short @11@746
	jg	short @11@722
	cmp	word ptr [bp-34],32767
	jbe	short @11@746
@11@722:
   ;	
   ;				xstep = 0x7fff;
   ;	
	mov	word ptr [bp-26],32767
	jmp	short @11@866
@11@746:
   ;	
   ;			else if (ltemp < -0x7fffl)
   ;	
	cmp	word ptr [bp-32],65535
	jg	short @11@842
	jl	short @11@818
	cmp	word ptr [bp-34],32769
	jae	short @11@842
@11@818:
   ;	
   ;				xstep = -0x7fff;
   ;	
	mov	word ptr [bp-26],32769
	jmp	short @11@866
@11@842:
   ;	
   ;			else
   ;				xstep = ltemp;
   ;	
	mov	ax,word ptr [bp-34]
	mov	word ptr [bp-26],ax
@11@866:
   ;	
   ;			xfrac = x1 + (((long)xstep*partial) >>8);
   ;	
	mov	ax,word ptr [bp-26]
	cwd	
	push	ax
	mov	ax,word ptr [bp-28]
	push	dx
	cwd	
	pop	cx
	pop	bx
	call	near ptr N_LXMUL@
	mov	cl,8
	call	near ptr N_LXRSH@
	mov	dx,word ptr [bp-2]
	add	dx,ax
	mov	word ptr [bp-36],dx
   ;	
   ;	
   ;			y = yt1 + ystep;
   ;	
	mov	ax,word ptr [bp-8]
	add	ax,di
	mov	word ptr [bp-20],ax
   ;	
   ;			yt2 += ystep;
   ;	
	add	word ptr [bp-16],di
@11@890:
   ;	
   ;			do
   ;			{
   ;				x = xfrac>>8;
   ;	
	mov	ax,word ptr [bp-36]
	mov	cl,8
	sar	ax,cl
	mov	word ptr [bp-18],ax
   ;	
   ;				xfrac += xstep;
   ;	
	mov	ax,word ptr [bp-26]
	add	word ptr [bp-36],ax
   ;	
   ;	
   ;				value = (unsigned)tilemap[x][y];
   ;	
	mov	bx,word ptr [bp-18]
	mov	cl,6
	shl	bx,cl
	add	bx,word ptr [bp-20]
	mov	al,byte ptr DGROUP:_tilemap[bx]
	mov	ah,0
	mov	si,ax
   ;	
   ;				y += ystep;
   ;	
	add	word ptr [bp-20],di
   ;	
   ;	
   ;				if (!value)
   ;	
	or	si,si
	jne	short @11@938
   ;	
   ;					continue;
   ;	
	jmp	short @11@1058
@11@938:
   ;	
   ;	
   ;				if (value<128 || value>256)
   ;	
	cmp	si,128
	jb	short @11@986
	cmp	si,256
	jbe	short @11@1010
@11@986:
   ;	
   ;					return false;
   ;	
	xor	ax,ax
	jmp	short @11@1106
@11@1010:
   ;	
   ;	
   ;				//
   ;				// see if the door is open enough
   ;				//
   ;				value &= ~0x80;
   ;	
	and	si,65407
   ;	
   ;				intercept = xfrac-xstep/2;
   ;	
	mov	ax,word ptr [bp-26]
	mov	bx,2
	cwd	
	idiv	bx
	mov	dx,word ptr [bp-36]
	sub	dx,ax
	mov	word ptr [bp-42],dx
   ;	
   ;	
   ;				if (intercept>doorposition[value])
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr DGROUP:_doorposition[bx]
	cmp	ax,word ptr [bp-42]
	jae	short @11@1058
   ;	
   ;					return false;
   ;	
	xor	ax,ax
	jmp	short @11@1106
@11@1058:
   ;	
   ;			} while (y != yt2);
   ;	
	mov	ax,word ptr [bp-20]
	cmp	ax,word ptr [bp-16]
	jne	short @11@890
@11@1082:
   ;	
   ;		}
   ;	
   ;		return true;
   ;	
	mov	ax,1
	jmp	short @11@1106
@11@1106:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CheckLine	endp
   ;	
   ;	boolean CheckSight (objtype *ob)
   ;	
	assume	cs:_TEXT
_CheckSight	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		long		deltax,deltay;
   ;	
   ;	//
   ;	// don't bother tracing a line if the area isn't connected to the player's
   ;	//
   ;		if (!areabyplayer[ob->areanumber])
   ;	
	mov	al,byte ptr [si+27]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	cmp	word ptr DGROUP:_areabyplayer[bx],0
	jne	short @12@74
   ;	
   ;			return false;
   ;	
	xor	ax,ax
	jmp	@12@962
@12@74:
   ;	
   ;	
   ;	//
   ;	// if the player is real close, sight is automatic
   ;	//
   ;		deltax = player->x - ob->x;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+17]
	mov	dx,word ptr [bx+15]
	sub	dx,word ptr [si+15]
	sbb	ax,word ptr [si+17]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;		deltay = player->y - ob->y;
   ;	
	mov	bx,word ptr DGROUP:_player
	mov	ax,word ptr [bx+21]
	mov	dx,word ptr [bx+19]
	sub	dx,word ptr [si+19]
	sbb	ax,word ptr [si+21]
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;	
   ;		if (deltax > -MINSIGHT && deltax < MINSIGHT
   ;	
   ;	
   ;		&& deltay > -MINSIGHT && deltay < MINSIGHT)
   ;	
	cmp	word ptr [bp-2],65534
	jl	short @12@386
	jg	short @12@146
	cmp	word ptr [bp-4],32768
	jbe	short @12@386
@12@146:
	cmp	word ptr [bp-2],1
	jg	short @12@386
	jl	short @12@218
	cmp	word ptr [bp-4],32768
	jae	short @12@386
@12@218:
	cmp	word ptr [bp-6],65534
	jl	short @12@386
	jg	short @12@290
	cmp	word ptr [bp-8],32768
	jbe	short @12@386
@12@290:
	cmp	word ptr [bp-6],1
	jg	short @12@386
	jl	short @12@362
	cmp	word ptr [bp-8],32768
	jae	short @12@386
@12@362:
   ;	
   ;			return true;
   ;	
	mov	ax,1
	jmp	short @12@962
@12@386:
   ;	
   ;	
   ;	//
   ;	// see if they are looking in the right direction
   ;	//
   ;		switch (ob->dir)
   ;	
	mov	bx,word ptr [si+13]
	cmp	bx,6
	ja	short @12@938
	shl	bx,1
	jmp	word ptr cs:@12@C2900[bx]
@12@458:
   ;	
   ;		{
   ;		case north:
   ;			if (deltay > 0)
   ;	
	cmp	word ptr [bp-6],0
	jl	short @12@554
	jg	short @12@530
	cmp	word ptr [bp-8],0
	jbe	short @12@554
@12@530:
   ;	
   ;				return false;
   ;	
	xor	ax,ax
	jmp	short @12@962
@12@554:
   ;	
   ;			break;
   ;	
	jmp	short @12@938
@12@578:
   ;	
   ;	
   ;		case east:
   ;			if (deltax < 0)
   ;	
	cmp	word ptr [bp-2],0
	jg	short @12@674
	jl	short @12@650
	cmp	word ptr [bp-4],0
	jae	short @12@674
@12@650:
   ;	
   ;				return false;
   ;	
	xor	ax,ax
	jmp	short @12@962
@12@674:
   ;	
   ;			break;
   ;	
	jmp	short @12@938
@12@698:
   ;	
   ;	
   ;		case south:
   ;			if (deltay < 0)
   ;	
	cmp	word ptr [bp-6],0
	jg	short @12@794
	jl	short @12@770
	cmp	word ptr [bp-8],0
	jae	short @12@794
@12@770:
   ;	
   ;				return false;
   ;	
	xor	ax,ax
	jmp	short @12@962
@12@794:
   ;	
   ;			break;
   ;	
	jmp	short @12@938
@12@818:
   ;	
   ;	
   ;		case west:
   ;			if (deltax > 0)
   ;	
	cmp	word ptr [bp-2],0
	jl	short @12@914
	jg	short @12@890
	cmp	word ptr [bp-4],0
	jbe	short @12@914
@12@890:
   ;	
   ;				return false;
   ;	
	xor	ax,ax
	jmp	short @12@962
@12@914:
   ;	
   ;			break;
   ;	
	jmp	short @12@938
@12@938:
   ;	
   ;		}
   ;	
   ;	//
   ;	// trace a line to check for blocking tiles (corners)
   ;	//
   ;		return CheckLine (ob);
   ;	
	push	si
	call	near ptr _CheckLine
	pop	cx
	jmp	short @12@962
@12@962:
   ;	
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CheckSight	endp
@12@C2900	label	word
	dw	@12@578
	dw	@12@938
	dw	@12@458
	dw	@12@938
	dw	@12@818
	dw	@12@938
	dw	@12@698
   ;	
   ;	void FirstSighting (objtype *ob)
   ;	
	assume	cs:_TEXT
_FirstSighting	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;	//
   ;	// react to the player
   ;	//
   ;		switch (ob->obclass)
   ;	
	mov	bx,word ptr [si+4]
	sub	bx,3
	cmp	bx,16
	jbe	@@8
	jmp	@13@434
@@8:
	shl	bx,1
	jmp	word ptr cs:@13@C2026[bx]
@13@98:
   ;	
   ;		{
   ;		case guardobj:
   ;			PlaySoundLocActor(HALTSND,ob);
   ;	
	push	word ptr [si+21]
	push	word ptr [si+19]
	push	word ptr [si+17]
	push	word ptr [si+15]
	mov	ax,21
	push	ax
	call	near ptr _PlaySoundLocGlobal
	add	sp,10
   ;	
   ;			NewState (ob,&s_grdchase1);
   ;	
	mov	ax,offset DGROUP:_s_grdchase1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			ob->speed *= 3;			// go faster when chasing player
   ;	
	mov	cx,word ptr [si+46]
	mov	bx,word ptr [si+44]
	xor	dx,dx
	mov	ax,3
	call	near ptr N_LXMUL@
	mov	word ptr [si+44],ax
	mov	word ptr [si+46],dx
   ;	
   ;			break;
   ;	
	jmp	@13@434
@13@122:
   ;	
   ;	
   ;		case officerobj:
   ;			PlaySoundLocActor(SPIONSND,ob);
   ;	
	push	word ptr [si+21]
	push	word ptr [si+19]
	push	word ptr [si+17]
	push	word ptr [si+15]
	mov	ax,66
	push	ax
	call	near ptr _PlaySoundLocGlobal
	add	sp,10
   ;	
   ;			NewState (ob,&s_ofcchase1);
   ;	
	mov	ax,offset DGROUP:_s_ofcchase1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			ob->speed *= 5;			// go faster when chasing player
   ;	
	mov	cx,word ptr [si+46]
	mov	bx,word ptr [si+44]
	xor	dx,dx
	mov	ax,5
	call	near ptr N_LXMUL@
	mov	word ptr [si+44],ax
	mov	word ptr [si+46],dx
   ;	
   ;			break;
   ;	
	jmp	@13@434
@13@146:
   ;	
   ;	
   ;		case mutantobj:
   ;			NewState (ob,&s_mutchase1);
   ;	
	mov	ax,offset DGROUP:_s_mutchase1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			ob->speed *= 3;			// go faster when chasing player
   ;	
	mov	cx,word ptr [si+46]
	mov	bx,word ptr [si+44]
	xor	dx,dx
	mov	ax,3
	call	near ptr N_LXMUL@
	mov	word ptr [si+44],ax
	mov	word ptr [si+46],dx
   ;	
   ;			break;
   ;	
	jmp	@13@434
@13@170:
   ;	
   ;	
   ;		case ssobj:
   ;			PlaySoundLocActor(SCHUTZADSND,ob);
   ;	
	push	word ptr [si+21]
	push	word ptr [si+19]
	push	word ptr [si+17]
	push	word ptr [si+15]
	mov	ax,51
	push	ax
	call	near ptr _PlaySoundLocGlobal
	add	sp,10
   ;	
   ;			NewState (ob,&s_sschase1);
   ;	
	mov	ax,offset DGROUP:_s_sschase1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			ob->speed *= 4;			// go faster when chasing player
   ;	
	mov	cx,word ptr [si+46]
	mov	bx,word ptr [si+44]
	xor	dx,dx
	mov	ax,4
	call	near ptr N_LXMUL@
	mov	word ptr [si+44],ax
	mov	word ptr [si+46],dx
   ;	
   ;			break;
   ;	
	jmp	@13@434
@13@194:
   ;	
   ;	
   ;		case dogobj:
   ;			PlaySoundLocActor(DOGBARKSND,ob);
   ;	
	push	word ptr [si+21]
	push	word ptr [si+19]
	push	word ptr [si+17]
	push	word ptr [si+15]
	mov	ax,41
	push	ax
	call	near ptr _PlaySoundLocGlobal
	add	sp,10
   ;	
   ;			NewState (ob,&s_dogchase1);
   ;	
	mov	ax,offset DGROUP:_s_dogchase1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			ob->speed *= 2;			// go faster when chasing player
   ;	
	mov	cx,word ptr [si+46]
	mov	bx,word ptr [si+44]
	xor	dx,dx
	mov	ax,2
	call	near ptr N_LXMUL@
	mov	word ptr [si+44],ax
	mov	word ptr [si+46],dx
   ;	
   ;			break;
   ;	
	jmp	@13@434
@13@218:
   ;	
   ;	
   ;	#ifndef SPEAR
   ;		case bossobj:
   ;			SD_PlaySound(GUTENTAGSND);
   ;	
	mov	ax,55
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			NewState (ob,&s_bosschase1);
   ;	
	mov	ax,offset DGROUP:_s_bosschase1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			ob->speed = SPDPATROL*3;	// go faster when chasing player
   ;	
	mov	word ptr [si+44],1536
	mov	word ptr [si+46],0
   ;	
   ;			break;
   ;	
	jmp	@13@434
@13@242:
   ;	
   ;	
   ;		case gretelobj:
   ;			SD_PlaySound(KEINSND);
   ;	
	mov	ax,82
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			NewState (ob,&s_gretelchase1);
   ;	
	mov	ax,offset DGROUP:_s_gretelchase1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			ob->speed *= 3;			// go faster when chasing player
   ;	
	mov	cx,word ptr [si+46]
	mov	bx,word ptr [si+44]
	xor	dx,dx
	mov	ax,3
	call	near ptr N_LXMUL@
	mov	word ptr [si+44],ax
	mov	word ptr [si+46],dx
   ;	
   ;			break;
   ;	
	jmp	@13@434
@13@266:
   ;	
   ;	
   ;		case giftobj:
   ;			SD_PlaySound(EINESND);
   ;	
	mov	ax,80
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			NewState (ob,&s_giftchase1);
   ;	
	mov	ax,offset DGROUP:_s_giftchase1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			ob->speed *= 3;			// go faster when chasing player
   ;	
	mov	cx,word ptr [si+46]
	mov	bx,word ptr [si+44]
	xor	dx,dx
	mov	ax,3
	call	near ptr N_LXMUL@
	mov	word ptr [si+44],ax
	mov	word ptr [si+46],dx
   ;	
   ;			break;
   ;	
	jmp	@13@434
@13@290:
   ;	
   ;	
   ;		case fatobj:
   ;			SD_PlaySound(ERLAUBENSND);
   ;	
	mov	ax,81
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			NewState (ob,&s_fatchase1);
   ;	
	mov	ax,offset DGROUP:_s_fatchase1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			ob->speed *= 3;			// go faster when chasing player
   ;	
	mov	cx,word ptr [si+46]
	mov	bx,word ptr [si+44]
	xor	dx,dx
	mov	ax,3
	call	near ptr N_LXMUL@
	mov	word ptr [si+44],ax
	mov	word ptr [si+46],dx
   ;	
   ;			break;
   ;	
	jmp	@13@434
@13@314:
   ;	
   ;	
   ;		case schabbobj:
   ;			SD_PlaySound(SCHABBSHASND);
   ;	
	mov	ax,64
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			NewState (ob,&s_schabbchase1);
   ;	
	mov	ax,offset DGROUP:_s_schabbchase1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			ob->speed *= 3;			// go faster when chasing player
   ;	
	mov	cx,word ptr [si+46]
	mov	bx,word ptr [si+44]
	xor	dx,dx
	mov	ax,3
	call	near ptr N_LXMUL@
	mov	word ptr [si+44],ax
	mov	word ptr [si+46],dx
   ;	
   ;			break;
   ;	
	jmp	@13@434
@13@338:
   ;	
   ;	
   ;		case fakeobj:
   ;			SD_PlaySound(TOT_HUNDSND);
   ;	
	mov	ax,62
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			NewState (ob,&s_fakechase1);
   ;	
	mov	ax,offset DGROUP:_s_fakechase1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			ob->speed *= 3;			// go faster when chasing player
   ;	
	mov	cx,word ptr [si+46]
	mov	bx,word ptr [si+44]
	xor	dx,dx
	mov	ax,3
	call	near ptr N_LXMUL@
	mov	word ptr [si+44],ax
	mov	word ptr [si+46],dx
   ;	
   ;			break;
   ;	
	jmp	short @13@434
@13@362:
   ;	
   ;	
   ;		case mechahitlerobj:
   ;			SD_PlaySound(DIESND);
   ;	
	mov	ax,53
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			NewState (ob,&s_mechachase1);
   ;	
	mov	ax,offset DGROUP:_s_mechachase1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			ob->speed *= 3;			// go faster when chasing player
   ;	
	mov	cx,word ptr [si+46]
	mov	bx,word ptr [si+44]
	xor	dx,dx
	mov	ax,3
	call	near ptr N_LXMUL@
	mov	word ptr [si+44],ax
	mov	word ptr [si+46],dx
   ;	
   ;			break;
   ;	
	jmp	short @13@434
@13@386:
   ;	
   ;	
   ;		case realhitlerobj:
   ;			SD_PlaySound(DIESND);
   ;	
	mov	ax,53
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;			NewState (ob,&s_hitlerchase1);
   ;	
	mov	ax,offset DGROUP:_s_hitlerchase1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			ob->speed *= 5;			// go faster when chasing player
   ;	
	mov	cx,word ptr [si+46]
	mov	bx,word ptr [si+44]
	xor	dx,dx
	mov	ax,5
	call	near ptr N_LXMUL@
	mov	word ptr [si+44],ax
	mov	word ptr [si+46],dx
   ;	
   ;			break;
   ;	
	jmp	short @13@434
@13@410:
   ;	
   ;	
   ;		case ghostobj:
   ;			NewState (ob,&s_blinkychase1);
   ;	
	mov	ax,offset DGROUP:_s_blinkychase1
	push	ax
	push	si
	call	near ptr _NewState
	pop	cx
	pop	cx
   ;	
   ;			ob->speed *= 2;			// go faster when chasing player
   ;	
	mov	cx,word ptr [si+46]
	mov	bx,word ptr [si+44]
	xor	dx,dx
	mov	ax,2
	call	near ptr N_LXMUL@
	mov	word ptr [si+44],ax
	mov	word ptr [si+46],dx
   ;	
   ;			break;
   ;	
	jmp	short @13@434
@13@434:
   ;	
   ;	#else
   ;	
   ;		case spectreobj:
   ;			SD_PlaySound(GHOSTSIGHTSND);
   ;			NewState (ob,&s_spectrechase1);
   ;			ob->speed = 800;			// go faster when chasing player
   ;			break;
   ;	
   ;		case angelobj:
   ;			SD_PlaySound(ANGELSIGHTSND);
   ;			NewState (ob,&s_angelchase1);
   ;			ob->speed = 1536;			// go faster when chasing player
   ;			break;
   ;	
   ;		case transobj:
   ;			SD_PlaySound(TRANSSIGHTSND);
   ;			NewState (ob,&s_transchase1);
   ;			ob->speed = 1536;			// go faster when chasing player
   ;			break;
   ;	
   ;		case uberobj:
   ;			NewState (ob,&s_uberchase1);
   ;			ob->speed = 3000;			// go faster when chasing player
   ;			break;
   ;	
   ;		case willobj:
   ;			SD_PlaySound(WILHELMSIGHTSND);
   ;			NewState (ob,&s_willchase1);
   ;			ob->speed = 2048;			// go faster when chasing player
   ;			break;
   ;	
   ;		case deathobj:
   ;			SD_PlaySound(KNIGHTSIGHTSND);
   ;			NewState (ob,&s_deathchase1);
   ;			ob->speed = 2048;			// go faster when chasing player
   ;			break;
   ;	
   ;	#endif
   ;		}
   ;	
   ;		if (ob->distance < 0)
   ;	
	cmp	word ptr [si+11],0
	jg	short @13@530
	jl	short @13@506
	cmp	word ptr [si+9],0
	jae	short @13@530
@13@506:
   ;	
   ;			ob->distance = 0;	// ignore the door opening command
   ;	
	mov	word ptr [si+9],0
	mov	word ptr [si+11],0
@13@530:
   ;	
   ;	
   ;		ob->flags |= FL_ATTACKMODE|FL_FIRSTATTACK;
   ;	
	mov	al,byte ptr [si+8]
	or	al,48
	mov	byte ptr [si+8],al
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_FirstSighting	endp
@13@C2026	label	word
	dw	@13@98
	dw	@13@122
	dw	@13@170
	dw	@13@194
	dw	@13@218
	dw	@13@314
	dw	@13@338
	dw	@13@362
	dw	@13@146
	dw	@13@434
	dw	@13@434
	dw	@13@434
	dw	@13@410
	dw	@13@386
	dw	@13@242
	dw	@13@266
	dw	@13@290
   ;	
   ;	boolean SightPlayer (objtype *ob)
   ;	
	assume	cs:_TEXT
_SightPlayer	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		if (ob->flags & FL_ATTACKMODE)
   ;	
	test	byte ptr [si+8],16
	je	short @14@74
   ;	
   ;			Quit ("An actor in ATTACKMODE called SightPlayer!");
   ;	
	mov	ax,offset DGROUP:s@+32
	push	ax
	call	near ptr _Quit
	pop	cx
@14@74:
   ;	
   ;	
   ;		if (ob->temp2)
   ;	
	cmp	word ptr [si+50],0
	je	short @14@170
   ;	
   ;		{
   ;		//
   ;		// count down reaction time
   ;		//
   ;			ob->temp2 -= tics;
   ;	
	mov	ax,word ptr [si+50]
	sub	ax,word ptr DGROUP:_tics
	mov	word ptr [si+50],ax
   ;	
   ;			if (ob->temp2 > 0)
   ;	
	cmp	word ptr [si+50],0
	jle	short @14@146
   ;	
   ;				return false;
   ;	
	xor	ax,ax
	jmp	@14@650
@14@146:
   ;	
   ;			ob->temp2 = 0;					// time to react
   ;	
	mov	word ptr [si+50],0
   ;	
   ;		}
   ;	
	jmp	@14@626
@14@170:
   ;	
   ;		else
   ;		{
   ;			if (!areabyplayer[ob->areanumber])
   ;	
	mov	al,byte ptr [si+27]
	mov	ah,0
	shl	ax,1
	mov	bx,ax
	cmp	word ptr DGROUP:_areabyplayer[bx],0
	jne	short @14@218
   ;	
   ;				return false;
   ;	
	xor	ax,ax
	jmp	@14@650
@14@218:
   ;	
   ;	
   ;			if (ob->flags & FL_AMBUSH)
   ;	
	test	byte ptr [si+8],64
	je	short @14@314
   ;	
   ;			{
   ;				if (!CheckSight (ob))
   ;	
	push	si
	call	near ptr _CheckSight
	pop	cx
	or	ax,ax
	jne	short @14@290
   ;	
   ;					return false;
   ;	
	xor	ax,ax
	jmp	@14@650
@14@290:
   ;	
   ;				ob->flags &= ~FL_AMBUSH;
   ;	
	mov	al,byte ptr [si+8]
	and	al,191
	mov	byte ptr [si+8],al
   ;	
   ;			}
   ;	
	jmp	short @14@386
@14@314:
   ;	
   ;			else
   ;			{
   ;				if (!madenoise && !CheckSight (ob))
   ;	
	cmp	word ptr DGROUP:_madenoise,0
	jne	short @14@386
	push	si
	call	near ptr _CheckSight
	pop	cx
	or	ax,ax
	jne	short @14@386
   ;	
   ;					return false;
   ;	
	xor	ax,ax
	jmp	short @14@650
@14@386:
   ;	
   ;			}
   ;	
   ;	
   ;			switch (ob->obclass)
   ;	
	mov	bx,word ptr [si+4]
	sub	bx,3
	cmp	bx,23
	ja	short @14@602
	shl	bx,1
	jmp	word ptr cs:@14@C2762[bx]
@14@458:
   ;	
   ;			{
   ;			case guardobj:
   ;				ob->temp2 = 1+US_RndT()/4;
   ;	
	call	near ptr _US_RndT
	mov	bx,4
	cwd	
	idiv	bx
	inc	ax
	mov	word ptr [si+50],ax
   ;	
   ;				break;
   ;	
	jmp	short @14@602
@14@482:
   ;	
   ;			case officerobj:
   ;				ob->temp2 = 2;
   ;	
	mov	word ptr [si+50],2
   ;	
   ;				break;
   ;	
	jmp	short @14@602
@14@506:
   ;	
   ;			case mutantobj:
   ;				ob->temp2 = 1+US_RndT()/6;
   ;	
	call	near ptr _US_RndT
	mov	bx,6
	cwd	
	idiv	bx
	inc	ax
	mov	word ptr [si+50],ax
   ;	
   ;				break;
   ;	
	jmp	short @14@602
@14@530:
   ;	
   ;			case ssobj:
   ;				ob->temp2 = 1+US_RndT()/6;
   ;	
	call	near ptr _US_RndT
	mov	bx,6
	cwd	
	idiv	bx
	inc	ax
	mov	word ptr [si+50],ax
   ;	
   ;				break;
   ;	
	jmp	short @14@602
@14@554:
   ;	
   ;			case dogobj:
   ;				ob->temp2 = 1+US_RndT()/8;
   ;	
	call	near ptr _US_RndT
	mov	bx,8
	cwd	
	idiv	bx
	inc	ax
	mov	word ptr [si+50],ax
   ;	
   ;				break;
   ;	
	jmp	short @14@602
@14@578:
   ;	
   ;	
   ;			case bossobj:
   ;			case schabbobj:
   ;			case fakeobj:
   ;			case mechahitlerobj:
   ;			case realhitlerobj:
   ;			case gretelobj:
   ;			case giftobj:
   ;			case fatobj:
   ;			case spectreobj:
   ;			case angelobj:
   ;			case transobj:
   ;			case uberobj:
   ;			case willobj:
   ;			case deathobj:
   ;				ob->temp2 = 1;
   ;	
	mov	word ptr [si+50],1
   ;	
   ;				break;
   ;	
	jmp	short @14@602
@14@602:
   ;	
   ;			}
   ;			return false;
   ;	
	xor	ax,ax
	jmp	short @14@650
@14@626:
   ;	
   ;		}
   ;	
   ;		FirstSighting (ob);
   ;	
	push	si
	call	near ptr _FirstSighting
	pop	cx
   ;	
   ;	
   ;		return true;
   ;	
	mov	ax,1
	jmp	short @14@650
@14@650:
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_SightPlayer	endp
@14@C2762	label	word
	dw	@14@458
	dw	@14@482
	dw	@14@530
	dw	@14@554
	dw	@14@578
	dw	@14@578
	dw	@14@578
	dw	@14@578
	dw	@14@506
	dw	@14@602
	dw	@14@602
	dw	@14@602
	dw	@14@602
	dw	@14@578
	dw	@14@578
	dw	@14@578
	dw	@14@578
	dw	@14@602
	dw	@14@578
	dw	@14@578
	dw	@14@578
	dw	@14@578
	dw	@14@578
	dw	@14@578
_TEXT	ends
_BSS	segment word public 'BSS'
_menuitems	label	word
	db	2 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'Walk: Bad dir'
	db	0
	db	'MoveObj: bad dir!'
	db	0
	db	'An actor in ATTACKMODE called SightPlayer!'
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	public	_FirstSighting
	extrn	_PlaySoundLocGlobal:near
	public	_SelectRunDir
	extrn	_GetNewActor:near
	public	_DamageActor
	public	_TryWalk
	public	_DropItem
	extrn	_GivePoints:near
	extrn	_gamestate:word
	extrn	_madenoise:word
	public	_SightPlayer
	public	_menuitems
	extrn	_PlaceItemType:near
	extrn	_TakeDamage:near
	public	_KillActor
	public	_NewState
	extrn	_SD_PlaySound:near
	public	_diagonal
	extrn	_mapsegs:word
	extrn	_tilemap:byte
	public	_SpawnNewObj
	extrn	_s_hitlerchase1:word
	extrn	_s_blinkychase1:word
	extrn	_s_gretelchase1:word
	extrn	_s_schabbchase1:word
	public	_opposite
	public	_CheckSight
	public	_CheckLine
	extrn	_doorposition:word
	extrn	_s_mechachase1:word
	extrn	_OpenDoor:near
	extrn	_s_giftchase1:word
	extrn	_s_fakechase1:word
	extrn	_s_bosschase1:word
	extrn	_s_greteldie1:word
	extrn	_s_hitlerdie1:word
	extrn	_s_schabbdie1:word
	extrn	_Quit:near
	extrn	_tics:word
	extrn	_A_DeathScream:near
	extrn	_s_mutpain1:word
	extrn	_s_ofcpain1:word
	extrn	_s_grdpain1:word
	extrn	_s_fatchase1:word
	extrn	_s_mutchase1:word
	extrn	_s_ofcchase1:word
	extrn	_s_dogchase1:word
	extrn	_s_grdchase1:word
	extrn	_s_mechadie1:word
	extrn	_new:word
	extrn	_s_sspain1:word
	extrn	_s_sschase1:word
	extrn	_s_giftdie1:word
	extrn	_s_fakedie1:word
	extrn	_s_bossdie1:word
	extrn	_pluy:word
	extrn	_plux:word
	extrn	_player:word
	extrn	_s_mutpain:word
	extrn	_s_ofcpain:word
	extrn	_s_grdpain:word
	extrn	_s_fatdie1:word
	extrn	_s_mutdie1:word
	extrn	_s_ofcdie1:word
	extrn	_s_dogdie1:word
	extrn	_s_grddie1:word
	extrn	N_LDIV@:far
	extrn	_s_sspain:word
	extrn	N_LXMUL@:far
	extrn	_s_ssdie1:word
	extrn	N_LXLSH@:far
	extrn	N_LXRSH@:far
	extrn	_areabyplayer:word
	extrn	_farmapylookup:word
	extrn	_US_RndT:near
	extrn	_actorat:word
	public	_MoveObj
	public	_SelectDodgeDir
	public	_SelectChaseDir
	end
