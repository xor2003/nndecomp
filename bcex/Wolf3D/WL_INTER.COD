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
	?debug	S "c:\wl_inter.c"
	?debug	C E9E551FE7C0D633A5C776C5F696E7465722E63
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
_TEXT	segment byte public 'CODE'
   ;	
   ;	void ClearSplitVWB (void)
   ;	
	assume	cs:_TEXT
_ClearSplitVWB	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		memset (update,0,sizeof(update));
   ;	
	mov	ax,260
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_update
	push	ax
	call	near ptr _memset
	add	sp,6
   ;	
   ;		WindowX = 0;
   ;	
	mov	word ptr DGROUP:_WindowX,0
   ;	
   ;		WindowY = 0;
   ;	
	mov	word ptr DGROUP:_WindowY,0
   ;	
   ;		WindowW = 320;
   ;	
	mov	word ptr DGROUP:_WindowW,320
   ;	
   ;		WindowH = 160;
   ;	
	mov	word ptr DGROUP:_WindowH,160
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_ClearSplitVWB	endp
   ;	
   ;	void Victory (void)
   ;	
	assume	cs:_TEXT
_Victory	proc	near
	push	bp
	mov	bp,sp
	sub	sp,20
	push	si
	push	di
   ;	
   ;	{
   ;	#ifndef SPEARDEMO
   ;		long	sec;
   ;		int i,min,kr,sr,tr,x;
   ;		char tempstr[8];
   ;	
   ;	#define RATIOX	6
   ;	#define RATIOY	14
   ;	#define TIMEX	14
   ;	#define TIMEY	8
   ;	
   ;	
   ;	#ifdef SPEAR
   ;		StartCPMusic (XTHEEND_MUS);
   ;	
   ;		CA_CacheGrChunk(BJCOLLAPSE1PIC);
   ;		CA_CacheGrChunk(BJCOLLAPSE2PIC);
   ;		CA_CacheGrChunk(BJCOLLAPSE3PIC);
   ;		CA_CacheGrChunk(BJCOLLAPSE4PIC);
   ;	
   ;		VWB_Bar(0,0,320,200,VIEWCOLOR);
   ;		VWB_DrawPic (124,44,BJCOLLAPSE1PIC);
   ;		VW_UpdateScreen ();
   ;		VW_FadeIn ();
   ;		VW_WaitVBL(2*70);
   ;		VWB_DrawPic (124,44,BJCOLLAPSE2PIC);
   ;		VW_UpdateScreen ();
   ;		VW_WaitVBL(105);
   ;		VWB_DrawPic (124,44,BJCOLLAPSE3PIC);
   ;		VW_UpdateScreen ();
   ;		VW_WaitVBL(105);
   ;		VWB_DrawPic (124,44,BJCOLLAPSE4PIC);
   ;		VW_UpdateScreen ();
   ;		VW_WaitVBL(3*70);
   ;	
   ;		UNCACHEGRCHUNK(BJCOLLAPSE1PIC);
   ;		UNCACHEGRCHUNK(BJCOLLAPSE2PIC);
   ;		UNCACHEGRCHUNK(BJCOLLAPSE3PIC);
   ;		UNCACHEGRCHUNK(BJCOLLAPSE4PIC);
   ;		VL_FadeOut (0,255,0,17,17,5);
   ;	#endif
   ;	
   ;		StartCPMusic (URAHERO_MUS);
   ;	
	mov	ax,24
	push	ax
	call	near ptr _StartCPMusic
	pop	cx
   ;	
   ;		ClearSplitVWB ();
   ;	
	call	near ptr _ClearSplitVWB
   ;	
   ;		CacheLump(LEVELEND_LUMP_START,LEVELEND_LUMP_END);
   ;	
	mov	ax,85
	push	ax
	mov	ax,43
	push	ax
	call	near ptr _CacheLump
	pop	cx
	pop	cx
   ;	
   ;		CA_CacheGrChunk(STARTFONT);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;	
   ;	#ifndef SPEAR
   ;		CA_CacheGrChunk(C_TIMECODEPIC);
   ;	
	mov	ax,37
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;	#endif
   ;	
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
   ;	#ifdef JAPAN
   ;	#ifndef JAPDEMO
   ;		CA_CacheGrChunk(C_ENDRATIOSPIC);
   ;		VWB_DrawPic(0,0,C_ENDRATIOSPIC);
   ;		UNCACHEGRCHUNK(C_ENDRATIOSPIC);
   ;	#endif
   ;	#else
   ;		Write(18,2,STR_YOUWIN);
   ;	
	mov	ax,offset DGROUP:s@
	push	ax
	mov	ax,2
	push	ax
	mov	ax,18
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;	
   ;		Write(TIMEX,TIMEY-2,STR_TOTALTIME);
   ;	
	mov	ax,offset DGROUP:s@+9
	push	ax
	mov	ax,6
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;	
   ;		Write(12,RATIOY-2,"averages");
   ;	
	mov	ax,offset DGROUP:s@+20
	push	ax
	mov	ax,12
	push	ax
	mov	ax,12
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;	
   ;		#ifdef SPANISH
   ;		Write(RATIOX+2,  RATIOY,      STR_RATKILL);
   ;		Write(RATIOX+2,  RATIOY+2,  STR_RATSECRET);
   ;		Write(RATIOX+2,  RATIOY+4,STR_RATTREASURE);
   ;		#else
   ;		Write(RATIOX+8,RATIOY,      STR_RATKILL);
   ;	
	mov	ax,offset DGROUP:s@+29
	push	ax
	mov	ax,14
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;		Write(RATIOX+4,RATIOY+2,  STR_RATSECRET);
   ;	
	mov	ax,offset DGROUP:s@+39
	push	ax
	mov	ax,16
	push	ax
	mov	ax,10
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;		Write(RATIOX,  RATIOY+4,STR_RATTREASURE);
   ;	
	mov	ax,offset DGROUP:s@+51
	push	ax
	mov	ax,18
	push	ax
	mov	ax,6
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;		#endif
   ;	
   ;	#endif
   ;	
   ;	#ifndef JAPDEMO
   ;		VWB_DrawPic (8,4,L_BJWINSPIC);
   ;	
	mov	ax,85
	push	ax
	mov	ax,4
	push	ax
	mov	ax,8
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;	#endif
   ;	
   ;	
   ;	#ifndef SPEAR
   ;		for (kr = sr = tr = sec = i = 0;i < 8;i++)
   ;	
	xor	ax,ax
	mov	si,ax
	cwd	
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
	mov	word ptr [bp-10],ax
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],ax
	jmp	short @2@98
@2@50:
   ;	
   ;	#else
   ;		for (kr = sr = tr = sec = i = 0;i < 20;i++)
   ;	#endif
   ;		{
   ;			sec += LevelRatios[i].time;
   ;	
	mov	ax,si
	mov	dx,10
	imul	dx
	mov	bx,ax
	mov	ax,word ptr DGROUP:_LevelRatios[bx+8]
	mov	dx,word ptr DGROUP:_LevelRatios[bx+6]
	add	word ptr [bp-4],dx
	adc	word ptr [bp-2],ax
   ;	
   ;			kr += LevelRatios[i].kill;
   ;	
	mov	ax,si
	mov	dx,10
	imul	dx
	mov	bx,ax
	mov	ax,word ptr DGROUP:_LevelRatios[bx]
	add	word ptr [bp-6],ax
   ;	
   ;			sr += LevelRatios[i].secret;
   ;	
	mov	ax,si
	mov	dx,10
	imul	dx
	mov	bx,ax
	mov	ax,word ptr DGROUP:_LevelRatios[bx+2]
	add	word ptr [bp-8],ax
   ;	
   ;			tr += LevelRatios[i].treasure;
   ;	
	mov	ax,si
	mov	dx,10
	imul	dx
	mov	bx,ax
	mov	ax,word ptr DGROUP:_LevelRatios[bx+4]
	add	word ptr [bp-10],ax
	inc	si
@2@98:
	cmp	si,8
	jl	short @2@50
   ;	
   ;		}
   ;	
   ;	#ifndef SPEAR
   ;		kr /= 8;
   ;	
	mov	bx,8
	mov	ax,word ptr [bp-6]
	cwd	
	idiv	bx
	mov	word ptr [bp-6],ax
   ;	
   ;		sr /= 8;
   ;	
	mov	bx,8
	mov	ax,word ptr [bp-8]
	cwd	
	idiv	bx
	mov	word ptr [bp-8],ax
   ;	
   ;		tr /= 8;
   ;	
	mov	bx,8
	mov	ax,word ptr [bp-10]
	cwd	
	idiv	bx
	mov	word ptr [bp-10],ax
   ;	
   ;	#else
   ;		kr /= 14;
   ;		sr /= 14;
   ;		tr /= 14;
   ;	#endif
   ;	
   ;		min = sec/60;
   ;	
	xor	ax,ax
	mov	dx,60
	push	ax
	push	dx
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr N_LDIV@
	mov	di,ax
   ;	
   ;		sec %= 60;
   ;	
	xor	ax,ax
	mov	dx,60
	push	ax
	push	dx
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr N_LMOD@
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;	
   ;		if (min > 99)
   ;	
	cmp	di,99
	jle	short @2@170
   ;	
   ;			min = sec = 99;
   ;	
	mov	ax,99
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],0
	mov	di,ax
@2@170:
   ;	
   ;	
   ;		i = TIMEX*8+1;
   ;	
	mov	si,113
   ;	
   ;		VWB_DrawPic(i,TIMEY*8,L_NUM0PIC+(min/10));
   ;	
	mov	ax,di
	mov	bx,10
	cwd	
	idiv	bx
	add	ax,45
	push	ax
	mov	ax,64
	push	ax
	push	si
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		i += 2*8;
   ;	
	add	si,16
   ;	
   ;		VWB_DrawPic(i,TIMEY*8,L_NUM0PIC+(min%10));
   ;	
	mov	ax,di
	mov	bx,10
	cwd	
	idiv	bx
	add	dx,45
	push	dx
	mov	ax,64
	push	ax
	push	si
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		i += 2*8;
   ;	
	add	si,16
   ;	
   ;		Write(i/8,TIMEY,":");
   ;	
	mov	ax,offset DGROUP:s@+65
	push	ax
	mov	ax,8
	push	ax
	mov	ax,si
	mov	bx,8
	cwd	
	idiv	bx
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;		i += 1*8;
   ;	
	add	si,8
   ;	
   ;		VWB_DrawPic(i,TIMEY*8,L_NUM0PIC+(sec/10));
   ;	
	xor	ax,ax
	mov	dx,10
	push	ax
	push	dx
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr N_LDIV@
	add	ax,45
	push	ax
	mov	ax,64
	push	ax
	push	si
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		i += 2*8;
   ;	
	add	si,16
   ;	
   ;		VWB_DrawPic(i,TIMEY*8,L_NUM0PIC+(sec%10));
   ;	
	xor	ax,ax
	mov	dx,10
	push	ax
	push	dx
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr N_LMOD@
	add	ax,45
	push	ax
	mov	ax,64
	push	ax
	push	si
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		VW_UpdateScreen ();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	
   ;		itoa(kr,tempstr,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-20]
	push	ax
	push	word ptr [bp-6]
	call	near ptr _itoa
	add	sp,6
   ;	
   ;		x=RATIOX+24-strlen(tempstr)*2;
   ;	
	lea	ax,word ptr [bp-20]
	push	ax
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	mov	dx,30
	sub	dx,ax
	mov	word ptr [bp-12],dx
   ;	
   ;		Write(x,RATIOY,tempstr);
   ;	
	lea	ax,word ptr [bp-20]
	push	ax
	mov	ax,14
	push	ax
	push	word ptr [bp-12]
	call	near ptr _Write
	add	sp,6
   ;	
   ;	
   ;		itoa(sr,tempstr,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-20]
	push	ax
	push	word ptr [bp-8]
	call	near ptr _itoa
	add	sp,6
   ;	
   ;		x=RATIOX+24-strlen(tempstr)*2;
   ;	
	lea	ax,word ptr [bp-20]
	push	ax
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	mov	dx,30
	sub	dx,ax
	mov	word ptr [bp-12],dx
   ;	
   ;		Write(x,RATIOY+2,tempstr);
   ;	
	lea	ax,word ptr [bp-20]
	push	ax
	mov	ax,16
	push	ax
	push	word ptr [bp-12]
	call	near ptr _Write
	add	sp,6
   ;	
   ;	
   ;		itoa(tr,tempstr,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-20]
	push	ax
	push	word ptr [bp-10]
	call	near ptr _itoa
	add	sp,6
   ;	
   ;		x=RATIOX+24-strlen(tempstr)*2;
   ;	
	lea	ax,word ptr [bp-20]
	push	ax
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	mov	dx,30
	sub	dx,ax
	mov	word ptr [bp-12],dx
   ;	
   ;		Write(x,RATIOY+4,tempstr);
   ;	
	lea	ax,word ptr [bp-20]
	push	ax
	mov	ax,18
	push	ax
	push	word ptr [bp-12]
	call	near ptr _Write
	add	sp,6
   ;	
   ;	
   ;	
   ;	#ifndef SPANISH
   ;	#ifndef UPLOAD
   ;	#ifndef SPEAR
   ;		//
   ;		// TOTAL TIME VERIFICATION CODE
   ;		//
   ;		if (gamestate.difficulty>=gd_medium)
   ;	
	cmp	word ptr DGROUP:_gamestate,2
	jge	@@0
	jmp	@2@218
@@0:
   ;	
   ;		{
   ;			VWB_DrawPic (30*8,TIMEY*8,C_TIMECODEPIC);
   ;	
	mov	ax,37
	push	ax
	mov	ax,64
	push	ax
	mov	ax,240
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;			fontnumber = 0;
   ;	
	mov	word ptr DGROUP:_fontnumber,0
   ;	
   ;			fontcolor = READHCOLOR;
   ;	
	mov	byte ptr DGROUP:_fontcolor,71
   ;	
   ;			PrintX = 30*8-3;
   ;	
	mov	word ptr DGROUP:_PrintX,237
   ;	
   ;			PrintY = TIMEY*8+8;
   ;	
	mov	word ptr DGROUP:_PrintY,72
   ;	
   ;			PrintX+=4;
   ;	
	add	word ptr DGROUP:_PrintX,4
   ;	
   ;			tempstr[0] = (((min/10)^(min%10))^0xa)+'A';
   ;	
	mov	ax,di
	mov	bx,10
	cwd	
	idiv	bx
	push	ax
	mov	ax,di
	mov	bx,10
	cwd	
	idiv	bx
	pop	ax
	xor	al,dl
	xor	al,10
	add	al,65
	mov	byte ptr [bp-20],al
   ;	
   ;			tempstr[1] = (((sec/10)^(sec%10))^0xa)+'A';
   ;	
	xor	ax,ax
	mov	dx,10
	push	ax
	push	dx
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr N_LDIV@
	push	ax
	xor	ax,ax
	mov	dx,10
	push	ax
	push	dx
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	call	near ptr N_LMOD@
	pop	dx
	xor	dl,al
	xor	dl,10
	add	dl,65
	mov	byte ptr [bp-19],dl
   ;	
   ;			tempstr[2] = (tempstr[0]^tempstr[1])+'A';
   ;	
	mov	al,byte ptr [bp-20]
	xor	al,byte ptr [bp-19]
	add	al,65
	mov	byte ptr [bp-18],al
   ;	
   ;			tempstr[3] = 0;
   ;	
	mov	byte ptr [bp-17],0
   ;	
   ;			US_Print(tempstr);
   ;	
	push	ss
	lea	ax,word ptr [bp-20]
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
@2@218:
   ;	
   ;		}
   ;	#endif
   ;	#endif
   ;	#endif
   ;	
   ;	
   ;		fontnumber = 1;
   ;	
	mov	word ptr DGROUP:_fontnumber,1
   ;	
   ;	
   ;		VW_UpdateScreen ();
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
   ;	
   ;		IN_Ack();
   ;	
	call	near ptr _IN_Ack
   ;	
   ;	
   ;		#ifndef SPEAR
   ;		if (Keyboard[sc_P] && MS_CheckParm("goobers"))
   ;	
	cmp	word ptr DGROUP:_Keyboard+50,0
	je	short @2@290
	push	ds
	mov	ax,offset DGROUP:s@+67
	push	ax
	call	near ptr _MS_CheckParm
	pop	cx
	pop	cx
	or	ax,ax
	je	short @2@290
   ;	
   ;			PicturePause();
   ;	
	call	near ptr _PicturePause
@2@290:
   ;	
   ;		#endif
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
   ;		UNCACHEGRCHUNK(C_TIMECODEPIC);
   ;	
	mov	ax,offset DGROUP:_grsegs+74
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded+37
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded+37,al
   ;	
   ;	#endif
   ;		UnCacheLump(LEVELEND_LUMP_START,LEVELEND_LUMP_END);
   ;	
	mov	ax,85
	push	ax
	mov	ax,43
	push	ax
	call	near ptr _UnCacheLump
	pop	cx
	pop	cx
   ;	
   ;	
   ;	#ifndef SPEAR
   ;		EndText();
   ;	
	call	near ptr _EndText
   ;	
   ;	#else
   ;		EndSpear();
   ;	#endif
   ;	
   ;	#endif // SPEARDEMO
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_Victory	endp
   ;	
   ;	void PG13 (void)
   ;	
	assume	cs:_TEXT
_PG13	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		VW_FadeOut();
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
   ;		VWB_Bar(0,0,320,200,0x82);			// background
   ;	
	mov	ax,130
	push	ax
	mov	ax,200
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
   ;		CA_CacheGrChunk (PG13PIC);
   ;	
	mov	ax,88
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;		VWB_DrawPic (216,110,PG13PIC);
   ;	
	mov	ax,88
	push	ax
	mov	ax,110
	push	ax
	mov	ax,216
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		VW_UpdateScreen ();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	
   ;		UNCACHEGRCHUNK (PG13PIC);
   ;	
	mov	ax,offset DGROUP:_grsegs+176
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded+88
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded+88,al
   ;	
   ;	
   ;		VW_FadeIn();
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
   ;		IN_UserInput(TickBase*7);
   ;	
	xor	ax,ax
	mov	dx,490
	push	ax
	push	dx
	call	near ptr _IN_UserInput
	pop	cx
	pop	cx
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
   ;	}
   ;	
	pop	bp
	ret	
_PG13	endp
_TEXT	ends
_DATA	segment word public 'DATA'
	db	45
	db	0
	db	46
	db	0
	db	47
	db	0
	db	48
	db	0
	db	49
	db	0
	db	50
	db	0
	db	51
	db	0
	db	52
	db	0
	db	53
	db	0
	db	54
	db	0
	db	44
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	0
	db	56
	db	0
	db	57
	db	0
	db	58
	db	0
	db	59
	db	0
	db	60
	db	0
	db	61
	db	0
	db	62
	db	0
	db	63
	db	0
	db	64
	db	0
	db	65
	db	0
	db	66
	db	0
	db	67
	db	0
	db	68
	db	0
	db	69
	db	0
	db	70
	db	0
	db	71
	db	0
	db	72
	db	0
	db	73
	db	0
	db	74
	db	0
	db	75
	db	0
	db	76
	db	0
	db	77
	db	0
	db	78
	db	0
	db	79
	db	0
	db	80
	db	0
	db	81
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void Write(int x,int y,char *string)
   ;	
	assume	cs:_TEXT
_Write	proc	near
	push	bp
	mov	bp,sp
	sub	sp,94
	push	si
	push	di
	push	ss
	lea	ax,word ptr [bp-94]
	push	ax
	push	ds
	mov	ax,offset DGROUP:d@w+0
	push	ax
	mov	cx,86
	call	near ptr N_SCOPY@
   ;	
   ;	{
   ;	 int alpha[]={L_NUM0PIC,L_NUM1PIC,L_NUM2PIC,L_NUM3PIC,L_NUM4PIC,L_NUM5PIC,
   ;		L_NUM6PIC,L_NUM7PIC,L_NUM8PIC,L_NUM9PIC,L_COLONPIC,0,0,0,0,0,0,L_APIC,L_BPIC,
   ;		L_CPIC,L_DPIC,L_EPIC,L_FPIC,L_GPIC,L_HPIC,L_IPIC,L_JPIC,L_KPIC,
   ;		L_LPIC,L_MPIC,L_NPIC,L_OPIC,L_PPIC,L_QPIC,L_RPIC,L_SPIC,L_TPIC,
   ;		L_UPIC,L_VPIC,L_WPIC,L_XPIC,L_YPIC,L_ZPIC};
   ;	
   ;	 int i,ox,nx,ny;
   ;	 char ch;
   ;	
   ;	
   ;	 ox=nx=x*8;
   ;	
	mov	ax,word ptr [bp+4]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	si,ax
	mov	word ptr [bp-4],ax
   ;	
   ;	 ny=y*8;
   ;	
	mov	ax,word ptr [bp+6]
	shl	ax,1
	shl	ax,1
	shl	ax,1
	mov	di,ax
   ;	
   ;	 for (i=0;i<strlen(string);i++)
   ;	
	mov	word ptr [bp-2],0
	jmp	@4@506
@4@50:
   ;	
   ;	   if (string[i]=='\n')
   ;	
	mov	bx,word ptr [bp+8]
	add	bx,word ptr [bp-2]
	cmp	byte ptr [bx],10
	jne	short @4@98
   ;	
   ;	   {
   ;		nx=ox;
   ;	
	mov	si,word ptr [bp-4]
   ;	
   ;		ny+=16;
   ;	
	add	di,16
   ;	
   ;	   }
   ;	
	jmp	@4@482
@4@98:
   ;	
   ;	   else
   ;	   {
   ;		ch=string[i];
   ;	
	mov	bx,word ptr [bp+8]
	add	bx,word ptr [bp-2]
	mov	al,byte ptr [bx]
	mov	byte ptr [bp-5],al
   ;	
   ;		if (ch>='a')
   ;	
	cmp	byte ptr [bp-5],97
	jl	short @4@146
   ;	
   ;		  ch-=('a'-'A');
   ;	
	mov	al,byte ptr [bp-5]
	add	al,224
	mov	byte ptr [bp-5],al
@4@146:
   ;	
   ;		ch-='0';
   ;	
	mov	al,byte ptr [bp-5]
	add	al,208
	mov	byte ptr [bp-5],al
   ;	
   ;	
   ;		switch(string[i])
   ;	
	mov	bx,word ptr [bp+8]
	add	bx,word ptr [bp-2]
	mov	al,byte ptr [bx]
	cbw	
	mov	word ptr [bp-8],ax
	mov	cx,5
	mov	bx,offset @4@C1520
@4@218:
	mov	ax,word ptr cs:[bx]
	cmp	ax,word ptr [bp-8]
	je	short @4@290
	inc	bx
	inc	bx
	loop	short @4@218
	jmp	short @4@434
@4@290:
	jmp	word ptr cs:[bx+10]
@4@314:
   ;	
   ;		{
   ;		 case '!':
   ;		   VWB_DrawPic(nx,ny,L_EXPOINTPIC);
   ;	
	mov	ax,82
	push	ax
	push	di
	push	si
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		   nx+=8;
   ;	
	add	si,8
   ;	
   ;		   continue;
   ;	
	jmp	short @4@482
@4@338:
   ;	
   ;	
   ;		 case '\'':
   ;		   VWB_DrawPic(nx,ny,L_APOSTROPHEPIC);
   ;	
	mov	ax,83
	push	ax
	push	di
	push	si
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		   nx+=8;
   ;	
	add	si,8
   ;	
   ;		   continue;
   ;	
	jmp	short @4@482
@4@362:
   ;	
   ;	
   ;		 case ' ': break;
   ;	
	jmp	short @4@458
@4@386:
   ;	
   ;		 case 0x3a:	// ':'
   ;	
   ;		   VWB_DrawPic(nx,ny,L_COLONPIC);
   ;	
	mov	ax,44
	push	ax
	push	di
	push	si
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		   nx+=8;
   ;	
	add	si,8
   ;	
   ;		   continue;
   ;	
	jmp	short @4@482
@4@410:
   ;	
   ;	
   ;		 case '%':
   ;		   VWB_DrawPic(nx,ny,L_PERCENTPIC);
   ;	
	mov	ax,55
	push	ax
	push	di
	push	si
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		   break;
   ;	
	jmp	short @4@458
@4@434:
   ;	
   ;	
   ;		 default:
   ;		   VWB_DrawPic(nx,ny,alpha[ch]);
   ;	
	mov	al,byte ptr [bp-5]
	cbw	
	shl	ax,1
	lea	dx,word ptr [bp-94]
	add	ax,dx
	mov	bx,ax
	push	word ptr [bx]
	push	di
	push	si
	call	near ptr _VWB_DrawPic
	add	sp,6
@4@458:
   ;	
   ;		}
   ;		nx+=16;
   ;	
	add	si,16
@4@482:
	inc	word ptr [bp-2]
@4@506:
	push	word ptr [bp+8]
	call	near ptr _strlen
	pop	cx
	cmp	ax,word ptr [bp-2]
	jbe	@@1
	jmp	@4@50
@@1:
   ;	
   ;	   }
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_Write	endp
@4@C1520	label	word
	db	32
	db	0
	db	33
	db	0
	db	37
	db	0
	db	39
	db	0
	db	58
	db	0
	dw	@4@362
	dw	@4@314
	dw	@4@410
	dw	@4@338
	dw	@4@386
_TEXT	ends
_DATA	segment word public 'DATA'
	db	0
	db	0
	db	10
	db	0
	db	43
	db	0
	db	84
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void BJ_Breathe(void)
   ;	
	assume	cs:_TEXT
_BJ_Breathe	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	ss
	lea	ax,word ptr [bp-4]
	push	ax
	push	ds
	mov	ax,offset DGROUP:d@w+90
	push	ax
	mov	cx,4
	call	near ptr N_SCOPY@
   ;	
   ;	{
   ;		static int which=0,max=10;
   ;		int pics[2]={L_GUYPIC,L_GUY2PIC};
   ;	
   ;	
   ;		if (TimeCount>max)
   ;	
	mov	ax,word ptr DGROUP:d@w+88
	cwd	
	cmp	dx,word ptr DGROUP:_TimeCount+2
	ja	short @5@122
	jb	short @5@98
	cmp	ax,word ptr DGROUP:_TimeCount
	jae	short @5@122
@5@98:
   ;	
   ;		{
   ;			which^=1;
   ;	
	xor	word ptr DGROUP:d@w+86,1
   ;	
   ;			VWB_DrawPic(0,16,pics[which]);
   ;	
	mov	bx,word ptr DGROUP:d@w+86
	shl	bx,1
	lea	ax,word ptr [bp-4]
	add	bx,ax
	push	word ptr [bx]
	mov	ax,16
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;			VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;			TimeCount=0;
   ;	
	mov	word ptr DGROUP:_TimeCount,0
	mov	word ptr DGROUP:_TimeCount+2,0
   ;	
   ;			max=35;
   ;	
	mov	word ptr DGROUP:d@w+88,35
@5@122:
   ;	
   ;		}
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_BJ_Breathe	endp
_TEXT	ends
_DATA	segment word public 'DATA'
	db	0
	db	0
	db	192
	db	63
	db	48
	db	49
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	64
	db	48
	db	50
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	64
	db	48
	db	50
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	96
	db	64
	db	48
	db	51
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	64
	db	64
	db	48
	db	51
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	64
	db	64
	db	48
	db	51
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	32
	db	64
	db	48
	db	50
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	32
	db	64
	db	48
	db	50
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	63
	db	63
	db	58
	db	63
	db	63
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	63
	db	63
	db	58
	db	63
	db	63
	db	1 dup (0)
	db	0
	db	0
	db	192
	db	63
	db	48
	db	49
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	96
	db	64
	db	48
	db	51
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	64
	db	64
	db	48
	db	51
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	64
	db	48
	db	50
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	128
	db	64
	db	48
	db	52
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	192
	db	64
	db	48
	db	54
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	128
	db	63
	db	48
	db	49
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	64
	db	64
	db	48
	db	51
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	63
	db	63
	db	58
	db	63
	db	63
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	63
	db	63
	db	58
	db	63
	db	63
	db	1 dup (0)
	db	0
	db	0
	db	192
	db	63
	db	48
	db	49
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	192
	db	63
	db	48
	db	49
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	32
	db	64
	db	48
	db	50
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	32
	db	64
	db	48
	db	50
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	96
	db	64
	db	48
	db	51
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	32
	db	64
	db	48
	db	50
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	64
	db	48
	db	50
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	192
	db	64
	db	48
	db	54
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	63
	db	63
	db	58
	db	63
	db	63
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	63
	db	63
	db	58
	db	63
	db	63
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	64
	db	48
	db	50
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	64
	db	48
	db	50
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	192
	db	63
	db	48
	db	49
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	128
	db	63
	db	48
	db	49
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	144
	db	64
	db	48
	db	52
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	96
	db	64
	db	48
	db	51
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	64
	db	48
	db	50
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	144
	db	64
	db	48
	db	52
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	63
	db	63
	db	58
	db	63
	db	63
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	63
	db	63
	db	58
	db	63
	db	63
	db	1 dup (0)
	db	0
	db	0
	db	32
	db	64
	db	48
	db	50
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	192
	db	63
	db	48
	db	49
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	32
	db	64
	db	48
	db	50
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	32
	db	64
	db	48
	db	50
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	128
	db	64
	db	48
	db	52
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	64
	db	64
	db	48
	db	51
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	144
	db	64
	db	48
	db	52
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	96
	db	64
	db	48
	db	51
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	63
	db	63
	db	58
	db	63
	db	63
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	63
	db	63
	db	58
	db	63
	db	63
	db	1 dup (0)
	db	0
	db	0
	db	208
	db	64
	db	48
	db	54
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	128
	db	64
	db	48
	db	52
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	144
	db	64
	db	48
	db	52
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	192
	db	64
	db	48
	db	54
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	160
	db	64
	db	48
	db	53
	db	58
	db	48
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	176
	db	64
	db	48
	db	53
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	176
	db	64
	db	48
	db	53
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	8
	db	65
	db	48
	db	56
	db	58
	db	51
	db	48
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	63
	db	63
	db	58
	db	63
	db	63
	db	1 dup (0)
	db	0
	db	0
	db	0
	db	0
	db	63
	db	63
	db	58
	db	63
	db	63
	db	1 dup (0)
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void LevelCompleted (void)
   ;	
	assume	cs:_TEXT
_LevelCompleted	proc	near
	push	bp
	mov	bp,sp
	sub	sp,636
	push	si
	push	di
   ;	
   ;	{
   ;		#define VBLWAIT	30
   ;		#define PAR_AMOUNT	500
   ;		#define PERCENT100AMT	10000
   ;		typedef struct {
   ;				float time;
   ;				char timestr[6];
   ;				} times;
   ;	
   ;		int	x,i,min,sec,ratio,kr,sr,tr;
   ;		unsigned	temp;
   ;		char tempstr[10];
   ;		long bonus,timeleft=0;
   ;	
	mov	word ptr [bp-32],0
	mov	word ptr [bp-30],0
	push	ss
	lea	ax,word ptr [bp-636]
	push	ax
	push	ds
	mov	ax,offset DGROUP:d@w+94
	push	ax
	mov	cx,600
	call	near ptr N_SCOPY@
   ;	
   ;		times parTimes[]=
   ;		{
   ;	#ifndef SPEAR
   ;		 //
   ;		 // Episode One Par Times
   ;		 //
   ;		 {1.5,	"01:30"},
   ;		 {2,	"02:00"},
   ;		 {2,	"02:00"},
   ;		 {3.5,	"03:30"},
   ;		 {3,	"03:00"},
   ;		 {3,	"03:00"},
   ;		 {2.5,	"02:30"},
   ;		 {2.5,	"02:30"},
   ;		 {0,	"??:??"},	// Boss level
   ;		 {0,	"??:??"},	// Secret level
   ;	
   ;		 //
   ;		 // Episode Two Par Times
   ;		 //
   ;		 {1.5,	"01:30"},
   ;		 {3.5,	"03:30"},
   ;		 {3,	"03:00"},
   ;		 {2,	"02:00"},
   ;		 {4,	"04:00"},
   ;		 {6,	"06:00"},
   ;		 {1,	"01:00"},
   ;		 {3,	"03:00"},
   ;		 {0,	"??:??"},
   ;		 {0,	"??:??"},
   ;	
   ;		 //
   ;		 // Episode Three Par Times
   ;		 //
   ;		 {1.5,	"01:30"},
   ;		 {1.5,	"01:30"},
   ;		 {2.5,	"02:30"},
   ;		 {2.5,	"02:30"},
   ;		 {3.5,	"03:30"},
   ;		 {2.5,	"02:30"},
   ;		 {2,	"02:00"},
   ;		 {6,	"06:00"},
   ;		 {0,	"??:??"},
   ;		 {0,	"??:??"},
   ;	
   ;		 //
   ;		 // Episode Four Par Times
   ;		 //
   ;		 {2,	"02:00"},
   ;		 {2,	"02:00"},
   ;		 {1.5,	"01:30"},
   ;		 {1,	"01:00"},
   ;		 {4.5,	"04:30"},
   ;		 {3.5,	"03:30"},
   ;		 {2,	"02:00"},
   ;		 {4.5,	"04:30"},
   ;		 {0,	"??:??"},
   ;		 {0,	"??:??"},
   ;	
   ;		 //
   ;		 // Episode Five Par Times
   ;		 //
   ;		 {2.5,	"02:30"},
   ;		 {1.5,	"01:30"},
   ;		 {2.5,	"02:30"},
   ;		 {2.5,	"02:30"},
   ;		 {4,	"04:00"},
   ;		 {3,	"03:00"},
   ;		 {4.5,	"04:30"},
   ;		 {3.5,	"03:30"},
   ;		 {0,	"??:??"},
   ;		 {0,	"??:??"},
   ;	
   ;		 //
   ;		 // Episode Six Par Times
   ;		 //
   ;		 {6.5,	"06:30"},
   ;		 {4,	"04:00"},
   ;		 {4.5,	"04:30"},
   ;		 {6,	"06:00"},
   ;		 {5,	"05:00"},
   ;		 {5.5,	"05:30"},
   ;		 {5.5,	"05:30"},
   ;		 {8.5,	"08:30"},
   ;		 {0,	"??:??"},
   ;		 {0,	"??:??"}
   ;	#else
   ;		 //
   ;		 // SPEAR OF DESTINY TIMES
   ;		 //
   ;		 {1.5,	"01:30"},
   ;		 {3.5,	"03:30"},
   ;		 {2.75,	"02:45"},
   ;		 {3.5,	"03:30"},
   ;		 {0,	"??:??"},	// Boss 1
   ;		 {4.5,	"04:30"},
   ;		 {3.25,	"03:15"},
   ;		 {2.75,	"02:45"},
   ;		 {4.75,	"04:45"},
   ;		 {0,	"??:??"},	// Boss 2
   ;		 {6.5,	"06:30"},
   ;		 {4.5,	"04:30"},
   ;		 {2.75,	"02:45"},
   ;		 {4.5,	"04:30"},
   ;		 {6,	"06:00"},
   ;		 {0,	"??:??"},	// Boss 3
   ;		 {6,	"06:00"},
   ;		 {0,	"??:??"},	// Boss 4
   ;		 {0,	"??:??"},	// Secret level 1
   ;		 {0,	"??:??"},	// Secret level 2
   ;	#endif
   ;		};
   ;	
   ;	
   ;	
   ;		CacheLump(LEVELEND_LUMP_START,LEVELEND_LUMP_END);
   ;	
	mov	ax,85
	push	ax
	mov	ax,43
	push	ax
	call	near ptr _CacheLump
	pop	cx
	pop	cx
   ;	
   ;		ClearSplitVWB ();			// set up for double buffering in split screen
   ;	
	call	near ptr _ClearSplitVWB
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
   ;		StartCPMusic(ENDLEVEL_MUS);
   ;	
	mov	ax,16
	push	ax
	call	near ptr _StartCPMusic
	pop	cx
   ;	
   ;	
   ;	//
   ;	// do the intermission
   ;	//
   ;		IN_ClearKeysDown();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;		IN_StartAck();
   ;	
	call	near ptr _IN_StartAck
   ;	
   ;	
   ;	#ifdef JAPAN
   ;		CA_CacheGrChunk(C_INTERMISSIONPIC);
   ;		VWB_DrawPic(0,0,C_INTERMISSIONPIC);
   ;		UNCACHEGRCHUNK(C_INTERMISSIONPIC);
   ;	#endif
   ;		VWB_DrawPic(0,16,L_GUYPIC);
   ;	
	mov	ax,43
	push	ax
	mov	ax,16
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;	
   ;	#ifndef SPEAR
   ;		if (mapon<8)
   ;	
	cmp	word ptr DGROUP:_mapon,8
	jl	@@2
	jmp	@6@2210
@@2:
   ;	
   ;	#else
   ;		if (mapon != 4 &&
   ;			mapon != 9 &&
   ;			mapon != 15 &&
   ;			mapon < 17)
   ;	#endif
   ;		{
   ;	#ifndef JAPAN
   ;		 #ifdef SPANISH
   ;		 Write(14,2,"piso\ncompletado");
   ;		 #else
   ;		 Write(14,2,"floor\ncompleted");
   ;	
	mov	ax,offset DGROUP:s@+75
	push	ax
	mov	ax,2
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;		 #endif
   ;	
   ;		 Write(14,7,STR_BONUS"     0");
   ;	
	mov	ax,offset DGROUP:s@+91
	push	ax
	mov	ax,7
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;		 Write(16,10,STR_TIME);
   ;	
	mov	ax,offset DGROUP:s@+103
	push	ax
	mov	ax,10
	push	ax
	mov	ax,16
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;		 Write(16,12,STR_PAR);
   ;	
	mov	ax,offset DGROUP:s@+108
	push	ax
	mov	ax,12
	push	ax
	mov	ax,16
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;	
   ;		 #ifdef SPANISH
   ;		 Write(11,14,    STR_RAT2KILL);
   ;		 Write(11,16,  STR_RAT2SECRET);
   ;		 Write(11,18,STR_RAT2TREASURE);
   ;		 #else
   ;		 Write(9,14,    STR_RAT2KILL);
   ;	
	mov	ax,offset DGROUP:s@+113
	push	ax
	mov	ax,14
	push	ax
	mov	ax,9
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;		 Write(5,16,  STR_RAT2SECRET);
   ;	
	mov	ax,offset DGROUP:s@+129
	push	ax
	mov	ax,16
	push	ax
	mov	ax,5
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;		 Write(1,18,STR_RAT2TREASURE);
   ;	
	mov	ax,offset DGROUP:s@+147
	push	ax
	mov	ax,18
	push	ax
	mov	ax,1
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;		 #endif
   ;	
   ;		 Write(26,2,itoa(gamestate.mapon+1,tempstr,10));
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-24]
	push	ax
	mov	ax,word ptr DGROUP:_gamestate+2
	inc	ax
	push	ax
	call	near ptr _itoa
	add	sp,6
	push	ax
	mov	ax,2
	push	ax
	mov	ax,26
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;	#endif
   ;	
   ;		 #ifdef SPANISH
   ;		 Write(30,12,parTimes[gamestate.episode*10+mapon].timestr);
   ;		 #else
   ;		 Write(26,12,parTimes[gamestate.episode*10+mapon].timestr);
   ;	
	mov	ax,word ptr DGROUP:_gamestate+38
	mov	dx,10
	imul	dx
	add	ax,word ptr DGROUP:_mapon
	mov	dx,10
	imul	dx
	lea	dx,word ptr [bp-632]
	add	ax,dx
	push	ax
	mov	ax,12
	push	ax
	mov	ax,26
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;		 #endif
   ;	
   ;		 //
   ;		 // PRINT TIME
   ;		 //
   ;		 sec=gamestate.TimeCount/70;
   ;	
	xor	ax,ax
	mov	dx,70
	push	ax
	push	dx
	push	word ptr DGROUP:_gamestate+54
	push	word ptr DGROUP:_gamestate+52
	call	near ptr N_LDIV@
	mov	word ptr [bp-4],ax
   ;	
   ;	
   ;		 if (sec > 99*60)		// 99 minutes max
   ;	
	cmp	word ptr [bp-4],5940
	jle	short @6@98
   ;	
   ;		   sec = 99*60;
   ;	
	mov	word ptr [bp-4],5940
@6@98:
   ;	
   ;	
   ;		 if (gamestate.TimeCount<parTimes[gamestate.episode*10+mapon].time*4200)
   ;	
	mov	ax,word ptr DGROUP:_gamestate+38
	mov	dx,10
	imul	dx
	add	ax,word ptr DGROUP:_mapon
	mov	dx,10
	imul	dx
	lea	dx,word ptr [bp-636]
	add	ax,dx
	mov	bx,ax
	FLD	dword ptr [bx]
	FMUL	dword ptr DGROUP:s@+167
	mov	ax,word ptr DGROUP:_gamestate+54
	mov	dx,word ptr DGROUP:_gamestate+52
	mov	word ptr [bp-36],dx
	mov	word ptr [bp-34],ax
	FILD	dword ptr [bp-36]
	FCOMPP
	FSTSW	word ptr [bp-36]
	FWAIT	
	mov	ax,word ptr [bp-36]
	sahf	
	jae	short @6@146
   ;	
   ;			timeleft=(parTimes[gamestate.episode*10+mapon].time*4200)/70-sec;
   ;	
	mov	ax,word ptr DGROUP:_gamestate+38
	mov	dx,10
	imul	dx
	add	ax,word ptr DGROUP:_mapon
	mov	dx,10
	imul	dx
	lea	dx,word ptr [bp-636]
	add	ax,dx
	mov	bx,ax
	FLD	dword ptr [bx]
	FMUL	dword ptr DGROUP:s@+167
	FDIV	dword ptr DGROUP:s@+171
	mov	ax,word ptr [bp-4]
	mov	word ptr [bp-36],ax
	FILD	word ptr [bp-36]
	FSUB	
	call	near ptr N_FTOL@
	mov	word ptr [bp-32],ax
	mov	word ptr [bp-30],dx
@6@146:
   ;	
   ;	
   ;		 min=sec/60;
   ;	
	mov	ax,word ptr [bp-4]
	mov	bx,60
	cwd	
	idiv	bx
	mov	word ptr [bp-2],ax
   ;	
   ;		 sec%=60;
   ;	
	mov	bx,60
	mov	ax,word ptr [bp-4]
	cwd	
	idiv	bx
	mov	word ptr [bp-4],dx
   ;	
   ;	
   ;		 #ifdef SPANISH
   ;		 i=30*8;
   ;		 #else
   ;		 i=26*8;
   ;	
	mov	si,208
   ;	
   ;		 #endif
   ;		 VWB_DrawPic(i,10*8,L_NUM0PIC+(min/10));
   ;	
	mov	ax,word ptr [bp-2]
	mov	bx,10
	cwd	
	idiv	bx
	add	ax,45
	push	ax
	mov	ax,80
	push	ax
	push	si
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		 i+=2*8;
   ;	
	add	si,16
   ;	
   ;		 VWB_DrawPic(i,10*8,L_NUM0PIC+(min%10));
   ;	
	mov	ax,word ptr [bp-2]
	mov	bx,10
	cwd	
	idiv	bx
	add	dx,45
	push	dx
	mov	ax,80
	push	ax
	push	si
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		 i+=2*8;
   ;	
	add	si,16
   ;	
   ;		 Write(i/8,10,":");
   ;	
	mov	ax,offset DGROUP:s@+175
	push	ax
	mov	ax,10
	push	ax
	mov	ax,si
	mov	bx,8
	cwd	
	idiv	bx
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;		 i+=1*8;
   ;	
	add	si,8
   ;	
   ;		 VWB_DrawPic(i,10*8,L_NUM0PIC+(sec/10));
   ;	
	mov	ax,word ptr [bp-4]
	mov	bx,10
	cwd	
	idiv	bx
	add	ax,45
	push	ax
	mov	ax,80
	push	ax
	push	si
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		 i+=2*8;
   ;	
	add	si,16
   ;	
   ;		 VWB_DrawPic(i,10*8,L_NUM0PIC+(sec%10));
   ;	
	mov	ax,word ptr [bp-4]
	mov	bx,10
	cwd	
	idiv	bx
	add	dx,45
	push	dx
	mov	ax,80
	push	ax
	push	si
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;	
   ;		 VW_UpdateScreen ();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		 VW_FadeIn ();
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
   ;	
   ;		 //
   ;		 // FIGURE RATIOS OUT BEFOREHAND
   ;		 //
   ;		 kr = sr = tr = 0;
   ;	
	xor	ax,ax
	mov	word ptr [bp-12],ax
	mov	word ptr [bp-10],ax
	mov	word ptr [bp-8],ax
   ;	
   ;		 if (gamestate.killtotal)
   ;	
	cmp	word ptr DGROUP:_gamestate+50,0
	je	short @6@194
   ;	
   ;			kr=(gamestate.killcount*100)/gamestate.killtotal;
   ;	
	mov	ax,word ptr DGROUP:_gamestate+44
	mov	dx,100
	imul	dx
	cwd	
	idiv	word ptr DGROUP:_gamestate+50
	mov	word ptr [bp-8],ax
@6@194:
   ;	
   ;		 if (gamestate.secrettotal)
   ;	
	cmp	word ptr DGROUP:_gamestate+46,0
	je	short @6@242
   ;	
   ;			sr=(gamestate.secretcount*100)/gamestate.secrettotal;
   ;	
	mov	ax,word ptr DGROUP:_gamestate+40
	mov	dx,100
	imul	dx
	cwd	
	idiv	word ptr DGROUP:_gamestate+46
	mov	word ptr [bp-10],ax
@6@242:
   ;	
   ;		 if (gamestate.treasuretotal)
   ;	
	cmp	word ptr DGROUP:_gamestate+48,0
	je	short @6@290
   ;	
   ;			tr=(gamestate.treasurecount*100)/gamestate.treasuretotal;
   ;	
	mov	ax,word ptr DGROUP:_gamestate+42
	mov	dx,100
	imul	dx
	cwd	
	idiv	word ptr DGROUP:_gamestate+48
	mov	word ptr [bp-12],ax
@6@290:
   ;	
   ;	
   ;	
   ;		 //
   ;		 // PRINT TIME BONUS
   ;		 //
   ;		 bonus=timeleft*PAR_AMOUNT;
   ;	
	mov	cx,word ptr [bp-30]
	mov	bx,word ptr [bp-32]
	xor	dx,dx
	mov	ax,500
	call	near ptr N_LXMUL@
	mov	word ptr [bp-28],ax
	mov	word ptr [bp-26],dx
   ;	
   ;		 if (bonus)
   ;	
	mov	ax,word ptr [bp-28]
	or	ax,word ptr [bp-26]
	jne	@@3
	jmp	@6@674
@@3:
   ;	
   ;		 {
   ;		  for (i=0;i<=timeleft;i++)
   ;	
	xor	si,si
	jmp	short @6@530
@6@338:
   ;	
   ;		  {
   ;		   ltoa((long)i*PAR_AMOUNT,tempstr,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-24]
	push	ax
	mov	ax,si
	cwd	
	push	ax
	push	dx
	xor	dx,dx
	mov	ax,500
	pop	cx
	pop	bx
	call	near ptr N_LXMUL@
	push	dx
	push	ax
	call	near ptr _ltoa
	add	sp,8
   ;	
   ;		   x=36-strlen(tempstr)*2;
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	mov	dx,36
	sub	dx,ax
	mov	di,dx
   ;	
   ;		   Write(x,7,tempstr);
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	mov	ax,7
	push	ax
	push	di
	call	near ptr _Write
	add	sp,6
   ;	
   ;		   if (!(i%(PAR_AMOUNT/10)))
   ;	
	mov	ax,si
	mov	bx,50
	cwd	
	idiv	bx
	or	dx,dx
	jne	short @6@386
   ;	
   ;			 SD_PlaySound(ENDBONUS1SND);
   ;	
	mov	ax,42
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
@6@386:
   ;	
   ;		   VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
	jmp	short @6@434
@6@410:
   ;	
   ;		   while(SD_SoundPlaying())
   ;			 BJ_Breathe();
   ;	
	call	near ptr _BJ_Breathe
@6@434:
	call	near ptr _SD_SoundPlaying
	or	ax,ax
	jne	short @6@410
   ;	
   ;		   if (IN_CheckAck())
   ;	
	call	near ptr _IN_CheckAck
	or	ax,ax
	je	short @6@506
   ;	
   ;			 goto done;
   ;	
	jmp	@6@1970
@6@506:
	inc	si
@6@530:
	mov	ax,si
	cwd	
	cmp	dx,word ptr [bp-30]
	jl	short @6@338
	jg	short @6@602
	cmp	ax,word ptr [bp-32]
	jbe	short @6@338
@6@602:
   ;	
   ;		  }
   ;	
   ;		  VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		  SD_PlaySound(ENDBONUS2SND);
   ;	
	mov	ax,43
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
	jmp	short @6@650
@6@626:
   ;	
   ;		  while(SD_SoundPlaying())
   ;			BJ_Breathe();
   ;	
	call	near ptr _BJ_Breathe
@6@650:
	call	near ptr _SD_SoundPlaying
	or	ax,ax
	jne	short @6@626
@6@674:
   ;	
   ;		 }
   ;	
   ;	
   ;		 #ifdef SPANISH
   ;		 #define RATIOXX		33
   ;		 #else
   ;		 #define RATIOXX		37
   ;		 #endif
   ;		 //
   ;		 // KILL RATIO
   ;		 //
   ;		 ratio=kr;
   ;	
	mov	ax,word ptr [bp-8]
	mov	word ptr [bp-6],ax
   ;	
   ;		 for (i=0;i<=ratio;i++)
   ;	
	xor	si,si
	jmp	short @6@890
@6@698:
   ;	
   ;		 {
   ;		  itoa(i,tempstr,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-24]
	push	ax
	push	si
	call	near ptr _itoa
	add	sp,6
   ;	
   ;		  x=RATIOXX-strlen(tempstr)*2;
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	mov	dx,37
	sub	dx,ax
	mov	di,dx
   ;	
   ;		  Write(x,14,tempstr);
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	mov	ax,14
	push	ax
	push	di
	call	near ptr _Write
	add	sp,6
   ;	
   ;		  if (!(i%10))
   ;	
	mov	ax,si
	mov	bx,10
	cwd	
	idiv	bx
	or	dx,dx
	jne	short @6@746
   ;	
   ;			SD_PlaySound(ENDBONUS1SND);
   ;	
	mov	ax,42
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
@6@746:
   ;	
   ;		  VW_UpdateScreen ();
   ;	
	call	near ptr _VW_UpdateScreen
	jmp	short @6@794
@6@770:
   ;	
   ;		  while(SD_SoundPlaying())
   ;			BJ_Breathe();
   ;	
	call	near ptr _BJ_Breathe
@6@794:
	call	near ptr _SD_SoundPlaying
	or	ax,ax
	jne	short @6@770
   ;	
   ;	
   ;		  if (IN_CheckAck())
   ;	
	call	near ptr _IN_CheckAck
	or	ax,ax
	je	short @6@866
   ;	
   ;			goto done;
   ;	
	jmp	@6@1970
@6@866:
	inc	si
@6@890:
	cmp	si,word ptr [bp-6]
	jle	short @6@698
   ;	
   ;		 }
   ;		 if (ratio==100)
   ;	
	cmp	word ptr [bp-6],100
	jne	short @6@962
   ;	
   ;		 {
   ;		   VW_WaitVBL(VBLWAIT);
   ;	
	mov	ax,30
	push	ax
	call	near ptr _VL_WaitVBL
	pop	cx
   ;	
   ;		   SD_StopSound();
   ;	
	call	near ptr _SD_StopSound
   ;	
   ;		   bonus+=PERCENT100AMT;
   ;	
	add	word ptr [bp-28],10000
	adc	word ptr [bp-26],0
   ;	
   ;		   ltoa(bonus,tempstr,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-24]
	push	ax
	push	word ptr [bp-26]
	push	word ptr [bp-28]
	call	near ptr _ltoa
	add	sp,8
   ;	
   ;		   x=(RATIOXX-1)-strlen(tempstr)*2;
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	mov	dx,36
	sub	dx,ax
	mov	di,dx
   ;	
   ;		   Write(x,7,tempstr);
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	mov	ax,7
	push	ax
	push	di
	call	near ptr _Write
	add	sp,6
   ;	
   ;		   VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		   SD_PlaySound(PERCENT100SND);
   ;	
	mov	ax,48
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;		 }
   ;	
	jmp	short @6@1034
@6@962:
   ;	
   ;		 else
   ;		 if (!ratio)
   ;	
	cmp	word ptr [bp-6],0
	jne	short @6@1010
   ;	
   ;		 {
   ;		   VW_WaitVBL(VBLWAIT);
   ;	
	mov	ax,30
	push	ax
	call	near ptr _VL_WaitVBL
	pop	cx
   ;	
   ;		   SD_StopSound();
   ;	
	call	near ptr _SD_StopSound
   ;	
   ;		   SD_PlaySound(NOBONUSSND);
   ;	
	mov	ax,47
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;		 }
   ;	
	jmp	short @6@1034
@6@1010:
   ;	
   ;		 else
   ;		 SD_PlaySound(ENDBONUS2SND);
   ;	
	mov	ax,43
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
@6@1034:
   ;	
   ;	
   ;		 VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
	jmp	short @6@1082
@6@1058:
   ;	
   ;		 while(SD_SoundPlaying())
   ;		   BJ_Breathe();
   ;	
	call	near ptr _BJ_Breathe
@6@1082:
	call	near ptr _SD_SoundPlaying
	or	ax,ax
	jne	short @6@1058
   ;	
   ;	
   ;	
   ;		 //
   ;		 // SECRET RATIO
   ;		 //
   ;		 ratio=sr;
   ;	
	mov	ax,word ptr [bp-10]
	mov	word ptr [bp-6],ax
   ;	
   ;		 for (i=0;i<=ratio;i++)
   ;	
	xor	si,si
	jmp	short @6@1322
@6@1130:
   ;	
   ;		 {
   ;		  itoa(i,tempstr,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-24]
	push	ax
	push	si
	call	near ptr _itoa
	add	sp,6
   ;	
   ;		  x=RATIOXX-strlen(tempstr)*2;
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	mov	dx,37
	sub	dx,ax
	mov	di,dx
   ;	
   ;		  Write(x,16,tempstr);
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	mov	ax,16
	push	ax
	push	di
	call	near ptr _Write
	add	sp,6
   ;	
   ;		  if (!(i%10))
   ;	
	mov	ax,si
	mov	bx,10
	cwd	
	idiv	bx
	or	dx,dx
	jne	short @6@1178
   ;	
   ;			SD_PlaySound(ENDBONUS1SND);
   ;	
	mov	ax,42
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
@6@1178:
   ;	
   ;		  VW_UpdateScreen ();
   ;	
	call	near ptr _VW_UpdateScreen
	jmp	short @6@1226
@6@1202:
   ;	
   ;		  while(SD_SoundPlaying())
   ;			BJ_Breathe();
   ;	
	call	near ptr _BJ_Breathe
@6@1226:
	call	near ptr _SD_SoundPlaying
	or	ax,ax
	jne	short @6@1202
   ;	
   ;		  BJ_Breathe();
   ;	
	call	near ptr _BJ_Breathe
   ;	
   ;	
   ;		  if (IN_CheckAck())
   ;	
	call	near ptr _IN_CheckAck
	or	ax,ax
	je	short @6@1298
   ;	
   ;			goto done;
   ;	
	jmp	@6@1970
@6@1298:
	inc	si
@6@1322:
	cmp	si,word ptr [bp-6]
	jle	short @6@1130
   ;	
   ;		 }
   ;		 if (ratio==100)
   ;	
	cmp	word ptr [bp-6],100
	jne	short @6@1394
   ;	
   ;		 {
   ;		   VW_WaitVBL(VBLWAIT);
   ;	
	mov	ax,30
	push	ax
	call	near ptr _VL_WaitVBL
	pop	cx
   ;	
   ;		   SD_StopSound();
   ;	
	call	near ptr _SD_StopSound
   ;	
   ;		   bonus+=PERCENT100AMT;
   ;	
	add	word ptr [bp-28],10000
	adc	word ptr [bp-26],0
   ;	
   ;		   ltoa(bonus,tempstr,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-24]
	push	ax
	push	word ptr [bp-26]
	push	word ptr [bp-28]
	call	near ptr _ltoa
	add	sp,8
   ;	
   ;		   x=(RATIOXX-1)-strlen(tempstr)*2;
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	mov	dx,36
	sub	dx,ax
	mov	di,dx
   ;	
   ;		   Write(x,7,tempstr);
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	mov	ax,7
	push	ax
	push	di
	call	near ptr _Write
	add	sp,6
   ;	
   ;		   VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		   SD_PlaySound(PERCENT100SND);
   ;	
	mov	ax,48
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;		 }
   ;	
	jmp	short @6@1466
@6@1394:
   ;	
   ;		 else
   ;		 if (!ratio)
   ;	
	cmp	word ptr [bp-6],0
	jne	short @6@1442
   ;	
   ;		 {
   ;		   VW_WaitVBL(VBLWAIT);
   ;	
	mov	ax,30
	push	ax
	call	near ptr _VL_WaitVBL
	pop	cx
   ;	
   ;		   SD_StopSound();
   ;	
	call	near ptr _SD_StopSound
   ;	
   ;		   SD_PlaySound(NOBONUSSND);
   ;	
	mov	ax,47
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;		 }
   ;	
	jmp	short @6@1466
@6@1442:
   ;	
   ;		 else
   ;		   SD_PlaySound(ENDBONUS2SND);
   ;	
	mov	ax,43
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
@6@1466:
   ;	
   ;		 VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
	jmp	short @6@1514
@6@1490:
   ;	
   ;		 while(SD_SoundPlaying())
   ;		   BJ_Breathe();
   ;	
	call	near ptr _BJ_Breathe
@6@1514:
	call	near ptr _SD_SoundPlaying
	or	ax,ax
	jne	short @6@1490
   ;	
   ;	
   ;	
   ;		 //
   ;		 // TREASURE RATIO
   ;		 //
   ;		 ratio=tr;
   ;	
	mov	ax,word ptr [bp-12]
	mov	word ptr [bp-6],ax
   ;	
   ;		 for (i=0;i<=ratio;i++)
   ;	
	xor	si,si
	jmp	short @6@1754
@6@1562:
   ;	
   ;		 {
   ;		  itoa(i,tempstr,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-24]
	push	ax
	push	si
	call	near ptr _itoa
	add	sp,6
   ;	
   ;		  x=RATIOXX-strlen(tempstr)*2;
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	mov	dx,37
	sub	dx,ax
	mov	di,dx
   ;	
   ;		  Write(x,18,tempstr);
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	mov	ax,18
	push	ax
	push	di
	call	near ptr _Write
	add	sp,6
   ;	
   ;		  if (!(i%10))
   ;	
	mov	ax,si
	mov	bx,10
	cwd	
	idiv	bx
	or	dx,dx
	jne	short @6@1610
   ;	
   ;			SD_PlaySound(ENDBONUS1SND);
   ;	
	mov	ax,42
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
@6@1610:
   ;	
   ;		  VW_UpdateScreen ();
   ;	
	call	near ptr _VW_UpdateScreen
	jmp	short @6@1658
@6@1634:
   ;	
   ;		  while(SD_SoundPlaying())
   ;			BJ_Breathe();
   ;	
	call	near ptr _BJ_Breathe
@6@1658:
	call	near ptr _SD_SoundPlaying
	or	ax,ax
	jne	short @6@1634
   ;	
   ;		  if (IN_CheckAck())
   ;	
	call	near ptr _IN_CheckAck
	or	ax,ax
	je	short @6@1730
   ;	
   ;			goto done;
   ;	
	jmp	@6@1970
@6@1730:
	inc	si
@6@1754:
	cmp	si,word ptr [bp-6]
	jle	short @6@1562
   ;	
   ;		 }
   ;		 if (ratio==100)
   ;	
	cmp	word ptr [bp-6],100
	jne	short @6@1826
   ;	
   ;		 {
   ;		   VW_WaitVBL(VBLWAIT);
   ;	
	mov	ax,30
	push	ax
	call	near ptr _VL_WaitVBL
	pop	cx
   ;	
   ;		   SD_StopSound();
   ;	
	call	near ptr _SD_StopSound
   ;	
   ;		   bonus+=PERCENT100AMT;
   ;	
	add	word ptr [bp-28],10000
	adc	word ptr [bp-26],0
   ;	
   ;		   ltoa(bonus,tempstr,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-24]
	push	ax
	push	word ptr [bp-26]
	push	word ptr [bp-28]
	call	near ptr _ltoa
	add	sp,8
   ;	
   ;		   x=(RATIOXX-1)-strlen(tempstr)*2;
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	mov	dx,36
	sub	dx,ax
	mov	di,dx
   ;	
   ;		   Write(x,7,tempstr);
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	mov	ax,7
	push	ax
	push	di
	call	near ptr _Write
	add	sp,6
   ;	
   ;		   VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		   SD_PlaySound(PERCENT100SND);
   ;	
	mov	ax,48
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;		 }
   ;	
	jmp	short @6@1898
@6@1826:
   ;	
   ;		 else
   ;		 if (!ratio)
   ;	
	cmp	word ptr [bp-6],0
	jne	short @6@1874
   ;	
   ;		 {
   ;		   VW_WaitVBL(VBLWAIT);
   ;	
	mov	ax,30
	push	ax
	call	near ptr _VL_WaitVBL
	pop	cx
   ;	
   ;		   SD_StopSound();
   ;	
	call	near ptr _SD_StopSound
   ;	
   ;		   SD_PlaySound(NOBONUSSND);
   ;	
	mov	ax,47
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
   ;	
   ;		 }
   ;	
	jmp	short @6@1898
@6@1874:
   ;	
   ;		 else
   ;		 SD_PlaySound(ENDBONUS2SND);
   ;	
	mov	ax,43
	push	ax
	call	near ptr _SD_PlaySound
	pop	cx
@6@1898:
   ;	
   ;		 VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
	jmp	short @6@1946
@6@1922:
   ;	
   ;		 while(SD_SoundPlaying())
   ;		   BJ_Breathe();
   ;	
	call	near ptr _BJ_Breathe
@6@1946:
	call	near ptr _SD_SoundPlaying
	or	ax,ax
	jne	short @6@1922
@6@1970:
   ;	
   ;	
   ;	
   ;		 //
   ;		 // JUMP STRAIGHT HERE IF KEY PRESSED
   ;		 //
   ;		 done:
   ;	
   ;		 itoa(kr,tempstr,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-24]
	push	ax
	push	word ptr [bp-8]
	call	near ptr _itoa
	add	sp,6
   ;	
   ;		 x=RATIOXX-strlen(tempstr)*2;
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	mov	dx,37
	sub	dx,ax
	mov	di,dx
   ;	
   ;		 Write(x,14,tempstr);
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	mov	ax,14
	push	ax
	push	di
	call	near ptr _Write
	add	sp,6
   ;	
   ;	
   ;		 itoa(sr,tempstr,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-24]
	push	ax
	push	word ptr [bp-10]
	call	near ptr _itoa
	add	sp,6
   ;	
   ;		 x=RATIOXX-strlen(tempstr)*2;
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	mov	dx,37
	sub	dx,ax
	mov	di,dx
   ;	
   ;		 Write(x,16,tempstr);
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	mov	ax,16
	push	ax
	push	di
	call	near ptr _Write
	add	sp,6
   ;	
   ;	
   ;		 itoa(tr,tempstr,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-24]
	push	ax
	push	word ptr [bp-12]
	call	near ptr _itoa
	add	sp,6
   ;	
   ;		 x=RATIOXX-strlen(tempstr)*2;
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	mov	dx,37
	sub	dx,ax
	mov	di,dx
   ;	
   ;		 Write(x,18,tempstr);
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	mov	ax,18
	push	ax
	push	di
	call	near ptr _Write
	add	sp,6
   ;	
   ;	
   ;		 bonus=(long)timeleft*PAR_AMOUNT+
   ;	
   ;	
   ;			   (PERCENT100AMT*(kr==100))+
   ;			   (PERCENT100AMT*(sr==100))+
   ;			   (PERCENT100AMT*(tr==100));
   ;	
	mov	cx,word ptr [bp-30]
	mov	bx,word ptr [bp-32]
	xor	dx,dx
	mov	ax,500
	call	near ptr N_LXMUL@
	push	ax
	push	dx
	cmp	word ptr [bp-8],100
	jne	short @6@2018
	mov	ax,1
	jmp	short @6@2042
@6@2018:
	xor	ax,ax
@6@2042:
	mov	dx,10000
	imul	dx
	cwd	
	pop	bx
	pop	cx
	add	cx,ax
	adc	bx,dx
	push	cx
	push	bx
	cmp	word ptr [bp-10],100
	jne	short @6@2090
	mov	ax,1
	jmp	short @6@2114
@6@2090:
	xor	ax,ax
@6@2114:
	mov	dx,10000
	imul	dx
	cwd	
	pop	bx
	pop	cx
	add	cx,ax
	adc	bx,dx
	push	cx
	push	bx
	cmp	word ptr [bp-12],100
	jne	short @6@2162
	mov	ax,1
	jmp	short @6@2186
@6@2162:
	xor	ax,ax
@6@2186:
	mov	dx,10000
	imul	dx
	cwd	
	pop	bx
	pop	cx
	add	cx,ax
	adc	bx,dx
	mov	word ptr [bp-28],cx
	mov	word ptr [bp-26],bx
   ;	
   ;	
   ;		 GivePoints(bonus);
   ;	
	push	word ptr [bp-26]
	push	word ptr [bp-28]
	call	near ptr _GivePoints
	pop	cx
	pop	cx
   ;	
   ;		 ltoa(bonus,tempstr,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-24]
	push	ax
	push	word ptr [bp-26]
	push	word ptr [bp-28]
	call	near ptr _ltoa
	add	sp,8
   ;	
   ;		 x=36-strlen(tempstr)*2;
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	call	near ptr _strlen
	pop	cx
	shl	ax,1
	mov	dx,36
	sub	dx,ax
	mov	di,dx
   ;	
   ;		 Write(x,7,tempstr);
   ;	
	lea	ax,word ptr [bp-24]
	push	ax
	mov	ax,7
	push	ax
	push	di
	call	near ptr _Write
	add	sp,6
   ;	
   ;	
   ;		 //
   ;		 // SAVE RATIO INFORMATION FOR ENDGAME
   ;		 //
   ;		 LevelRatios[mapon].kill=kr;
   ;	
	mov	ax,word ptr DGROUP:_mapon
	mov	dx,10
	imul	dx
	mov	dx,word ptr [bp-8]
	mov	bx,ax
	mov	word ptr DGROUP:_LevelRatios[bx],dx
   ;	
   ;		 LevelRatios[mapon].secret=sr;
   ;	
	mov	ax,word ptr DGROUP:_mapon
	mov	dx,10
	imul	dx
	mov	dx,word ptr [bp-10]
	mov	bx,ax
	mov	word ptr DGROUP:_LevelRatios[bx+2],dx
   ;	
   ;		 LevelRatios[mapon].treasure=tr;
   ;	
	mov	ax,word ptr DGROUP:_mapon
	mov	dx,10
	imul	dx
	mov	dx,word ptr [bp-12]
	mov	bx,ax
	mov	word ptr DGROUP:_LevelRatios[bx+4],dx
   ;	
   ;		 LevelRatios[mapon].time=min*60+sec;
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,60
	imul	dx
	add	ax,word ptr [bp-4]
	cwd	
	push	ax
	mov	ax,word ptr DGROUP:_mapon
	mov	bx,10
	push	dx
	imul	bx
	mov	bx,ax
	pop	ax
	pop	dx
	mov	word ptr DGROUP:_LevelRatios[bx+6],dx
	mov	word ptr DGROUP:_LevelRatios[bx+8],ax
   ;	
   ;		}
   ;	
	jmp	short @6@2234
@6@2210:
   ;	
   ;		else
   ;		{
   ;	#ifdef SPEAR
   ;	#ifndef SPEARDEMO
   ;		  switch(mapon)
   ;		  {
   ;		   case 4: Write(14,4," trans\n"
   ;							  " grosse\n"
   ;							  STR_DEFEATED); break;
   ;		   case 9: Write(14,4,"barnacle\n"
   ;							  "wilhelm\n"
   ;							  STR_DEFEATED); break;
   ;		   case 15: Write(14,4,"ubermutant\n"
   ;							   STR_DEFEATED); break;
   ;		   case 17: Write(14,4," death\n"
   ;							   " knight\n"
   ;							   STR_DEFEATED); break;
   ;		   case 18: Write(13,4,"secret tunnel\n"
   ;							   "    area\n"
   ;							   "  completed!"); break;
   ;		   case 19: Write(13,4,"secret castle\n"
   ;							   "    area\n"
   ;							   "  completed!"); break;
   ;		  }
   ;	#endif
   ;	#else
   ;		  Write(14,4,"secret floor\n completed!");
   ;	
	mov	ax,offset DGROUP:s@+177
	push	ax
	mov	ax,4
	push	ax
	mov	ax,14
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;	#endif
   ;	
   ;		  Write(10,16,"15000 bonus!");
   ;	
	mov	ax,offset DGROUP:s@+202
	push	ax
	mov	ax,16
	push	ax
	mov	ax,10
	push	ax
	call	near ptr _Write
	add	sp,6
   ;	
   ;	
   ;		  VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		  VW_FadeIn();
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
   ;		  GivePoints(15000);
   ;	
	xor	ax,ax
	mov	dx,15000
	push	ax
	push	dx
	call	near ptr _GivePoints
	pop	cx
	pop	cx
@6@2234:
   ;	
   ;		}
   ;	
   ;	
   ;		DrawScore();
   ;	
	call	near ptr _DrawScore
   ;	
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	
   ;		TimeCount=0;
   ;	
	mov	word ptr DGROUP:_TimeCount,0
	mov	word ptr DGROUP:_TimeCount+2,0
   ;	
   ;		IN_StartAck();
   ;	
	call	near ptr _IN_StartAck
	jmp	short @6@2282
@6@2258:
   ;	
   ;		while(!IN_CheckAck())
   ;		  BJ_Breathe();
   ;	
	call	near ptr _BJ_Breathe
@6@2282:
	call	near ptr _IN_CheckAck
	or	ax,ax
	je	short @6@2258
   ;	
   ;	
   ;	//
   ;	// done
   ;	//
   ;	#ifdef SPEARDEMO
   ;		if (gamestate.mapon == 1)
   ;		{
   ;			SD_PlaySound (BONUS1UPSND);
   ;	
   ;			CA_CacheGrChunk (STARTFONT+1);
   ;			Message ("This concludes your demo\n"
   ;					 "of Spear of Destiny! Now,\n"
   ;					 "go to your local software\n"
   ;					 "store and buy it!");
   ;			UNCACHEGRCHUNK (STARTFONT+1);
   ;	
   ;			IN_ClearKeysDown();
   ;			IN_Ack();
   ;		}
   ;	#endif
   ;	
   ;	#ifdef JAPDEMO
   ;		if (gamestate.mapon == 3)
   ;		{
   ;			SD_PlaySound (BONUS1UPSND);
   ;	
   ;			CA_CacheGrChunk (STARTFONT+1);
   ;			Message ("This concludes your demo\n"
   ;					 "of Wolfenstein 3-D! Now,\n"
   ;					 "go to your local software\n"
   ;					 "store and buy it!");
   ;			UNCACHEGRCHUNK (STARTFONT+1);
   ;	
   ;			IN_ClearKeysDown();
   ;			IN_Ack();
   ;		}
   ;	#endif
   ;	
   ;		#ifndef SPEAR
   ;		if (Keyboard[sc_P] && MS_CheckParm("goobers"))
   ;	
	cmp	word ptr DGROUP:_Keyboard+50,0
	je	short @6@2378
	push	ds
	mov	ax,offset DGROUP:s@+215
	push	ax
	call	near ptr _MS_CheckParm
	pop	cx
	pop	cx
	or	ax,ax
	je	short @6@2378
   ;	
   ;			PicturePause();
   ;	
	call	near ptr _PicturePause
@6@2378:
   ;	
   ;		#endif
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
   ;		temp = bufferofs;
   ;	
	mov	ax,word ptr DGROUP:_bufferofs
	mov	word ptr [bp-14],ax
   ;	
   ;		for (i=0;i<3;i++)
   ;	
	xor	si,si
	jmp	short @6@2450
@6@2402:
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
@6@2450:
	cmp	si,3
	jl	short @6@2402
   ;	
   ;		}
   ;		bufferofs = temp;
   ;	
	mov	ax,word ptr [bp-14]
	mov	word ptr DGROUP:_bufferofs,ax
   ;	
   ;	
   ;		UnCacheLump(LEVELEND_LUMP_START,LEVELEND_LUMP_END);
   ;	
	mov	ax,85
	push	ax
	mov	ax,43
	push	ax
	call	near ptr _UnCacheLump
	pop	cx
	pop	cx
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_LevelCompleted	endp
   ;	
   ;	boolean PreloadUpdate(unsigned current, unsigned total)
   ;	
	assume	cs:_TEXT
_PreloadUpdate	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		unsigned w = WindowW - 10;
   ;	
	mov	ax,word ptr DGROUP:_WindowW
	sub	ax,10
	mov	si,ax
   ;	
   ;	
   ;	
   ;		VWB_Bar(WindowX + 5,WindowY + WindowH - 3,w,2,BLACK);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,2
	push	ax
	push	si
	mov	ax,word ptr DGROUP:_WindowY
	add	ax,word ptr DGROUP:_WindowH
	sub	ax,3
	push	ax
	mov	ax,word ptr DGROUP:_WindowX
	add	ax,5
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;		w = ((long)w * current) / total;
   ;	
	xor	ax,ax
	push	ax
	push	word ptr [bp+6]
	mov	bx,si
	xor	cx,cx
	mov	ax,word ptr [bp+4]
	xor	dx,dx
	call	near ptr N_LXMUL@
	push	dx
	push	ax
	call	near ptr N_LDIV@
	mov	si,ax
   ;	
   ;		if (w)
   ;	
	or	si,si
	je	short @7@74
   ;	
   ;		{
   ;		 VWB_Bar(WindowX + 5,WindowY + WindowH - 3,w,2,0x37); //SECONDCOLOR);
   ;	
	mov	ax,55
	push	ax
	mov	ax,2
	push	ax
	push	si
	mov	ax,word ptr DGROUP:_WindowY
	add	ax,word ptr DGROUP:_WindowH
	sub	ax,3
	push	ax
	mov	ax,word ptr DGROUP:_WindowX
	add	ax,5
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
   ;	
   ;		 VWB_Bar(WindowX + 5,WindowY + WindowH - 3,w-1,1,0x32);
   ;	
	mov	ax,50
	push	ax
	mov	ax,1
	push	ax
	mov	ax,si
	dec	ax
	push	ax
	mov	ax,word ptr DGROUP:_WindowY
	add	ax,word ptr DGROUP:_WindowH
	sub	ax,3
	push	ax
	mov	ax,word ptr DGROUP:_WindowX
	add	ax,5
	push	ax
	call	near ptr _VWB_Bar
	add	sp,10
@7@74:
   ;	
   ;	
   ;		}
   ;		VW_UpdateScreen();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	//	if (LastScan == sc_Escape)
   ;	//	{
   ;	//		IN_ClearKeysDown();
   ;	//		return(true);
   ;	//	}
   ;	//	else
   ;			return(false);
   ;	
	xor	ax,ax
	jmp	short @7@98
@7@98:
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_PreloadUpdate	endp
   ;	
   ;	void PreloadGraphics(void)
   ;	
	assume	cs:_TEXT
_PreloadGraphics	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		DrawLevel ();
   ;	
	call	near ptr _DrawLevel
   ;	
   ;		ClearSplitVWB ();			// set up for double buffering in split screen
   ;	
	call	near ptr _ClearSplitVWB
   ;	
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
   ;		LatchDrawPic (20-14,80-3*8,GETPSYCHEDPIC);
   ;	
	mov	ax,134
	push	ax
	mov	ax,56
	push	ax
	mov	ax,6
	push	ax
	call	near ptr _LatchDrawPic
	add	sp,6
   ;	
   ;	
   ;		WindowX = 160-14*8;
   ;	
	mov	word ptr DGROUP:_WindowX,48
   ;	
   ;		WindowY = 80-3*8;
   ;	
	mov	word ptr DGROUP:_WindowY,56
   ;	
   ;		WindowW = 28*8;
   ;	
	mov	word ptr DGROUP:_WindowW,224
   ;	
   ;		WindowH = 48;
   ;	
	mov	word ptr DGROUP:_WindowH,48
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
   ;	
   ;		PM_Preload (PreloadUpdate);
   ;	
	mov	ax,offset _PreloadUpdate
	push	ax
	call	near ptr _PM_Preload
	pop	cx
   ;	
   ;		IN_UserInput (70);
   ;	
	xor	ax,ax
	mov	dx,70
	push	ax
	push	dx
	call	near ptr _IN_UserInput
	pop	cx
	pop	cx
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
   ;		DrawPlayBorder ();
   ;	
	call	near ptr _DrawPlayBorder
   ;	
   ;		VW_UpdateScreen ();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_PreloadGraphics	endp
   ;	
   ;	void	DrawHighScores(void)
   ;	
	assume	cs:_TEXT
_DrawHighScores	proc	near
	push	bp
	mov	bp,sp
	sub	sp,28
	push	si
	push	di
   ;	
   ;	{
   ;		char		buffer[16],*str,buffer1[5];
   ;		byte		temp,temp1,temp2,temp3;
   ;		word		i,j,
   ;					w,h,
   ;					x,y;
   ;		HighScore	*s;
   ;	
   ;	
   ;		MM_SortMem ();
   ;	
	call	near ptr _MM_SortMem
   ;	
   ;	
   ;	#ifndef SPEAR
   ;	//	CA_CacheGrChunk (C_CODEPIC);
   ;		CA_CacheGrChunk (HIGHSCORESPIC);
   ;	
	mov	ax,90
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;		CA_CacheGrChunk (STARTFONT);
   ;	
	mov	ax,1
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;		CA_CacheGrChunk (C_LEVELPIC);
   ;	
	mov	ax,38
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;		CA_CacheGrChunk (C_SCOREPIC);
   ;	
	mov	ax,40
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;		CA_CacheGrChunk (C_NAMEPIC);
   ;	
	mov	ax,39
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;	
   ;		ClearMScreen();
   ;	
	call	near ptr _ClearMScreen
   ;	
   ;		DrawStripes(10);
   ;	
	mov	ax,10
	push	ax
	call	near ptr _DrawStripes
	pop	cx
   ;	
   ;	
   ;		VWB_DrawPic(48,0,HIGHSCORESPIC);
   ;	
	mov	ax,90
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,48
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		UNCACHEGRCHUNK (HIGHSCORESPIC);
   ;	
	mov	ax,offset DGROUP:_grsegs+180
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded+90
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded+90,al
   ;	
   ;	
   ;		VWB_DrawPic(4*8,68,C_NAMEPIC);
   ;	
	mov	ax,39
	push	ax
	mov	ax,68
	push	ax
	mov	ax,32
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		VWB_DrawPic(20*8,68,C_LEVELPIC);
   ;	
	mov	ax,38
	push	ax
	mov	ax,68
	push	ax
	mov	ax,160
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;		VWB_DrawPic(28*8,68,C_SCOREPIC);
   ;	
	mov	ax,40
	push	ax
	mov	ax,68
	push	ax
	mov	ax,224
	push	ax
	call	near ptr _VWB_DrawPic
	add	sp,6
   ;	
   ;	#ifndef UPLOAD
   ;	//	VWB_DrawPic(35*8,68,C_CODEPIC);
   ;	#endif
   ;		fontnumber=0;
   ;	
	mov	word ptr DGROUP:_fontnumber,0
   ;	
   ;	
   ;	#else
   ;		CacheLump (BACKDROP_LUMP_START,BACKDROP_LUMP_END);
   ;		ClearMScreen();
   ;		DrawStripes(10);
   ;		UnCacheLump (BACKDROP_LUMP_START,BACKDROP_LUMP_END);
   ;	
   ;		CacheLump (HIGHSCORES_LUMP_START,HIGHSCORES_LUMP_END);
   ;		CA_CacheGrChunk (STARTFONT+1);
   ;		VWB_DrawPic (0,0,HIGHSCORESPIC);
   ;	
   ;		fontnumber = 1;
   ;	#endif
   ;	
   ;	
   ;	#ifndef SPEAR
   ;		SETFONTCOLOR(15,0x29);
   ;	
	mov	byte ptr DGROUP:_fontcolor,15
	mov	byte ptr DGROUP:_backcolor,41
   ;	
   ;	#else
   ;		SETFONTCOLOR(HIGHLIGHT,0x29);
   ;	#endif
   ;	
   ;		for (i = 0,s = Scores;i < MaxScores;i++,s++)
   ;	
	mov	word ptr [bp-8],0
	mov	di,offset DGROUP:_Scores
	jmp	@9@290
@9@50:
   ;	
   ;		{
   ;			PrintY = 76 + (16 * i);
   ;	
	mov	ax,word ptr [bp-8]
	mov	cl,4
	shl	ax,cl
	add	ax,76
	mov	word ptr DGROUP:_PrintY,ax
   ;	
   ;	
   ;			//
   ;			// name
   ;			//
   ;	#ifndef SPEAR
   ;			PrintX = 4*8;
   ;	
	mov	word ptr DGROUP:_PrintX,32
   ;	
   ;	#else
   ;			PrintX = 16;
   ;	#endif
   ;			US_Print(s->name);
   ;	
	push	ds
	push	di
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;	
   ;			//
   ;			// level
   ;			//
   ;			ultoa(s->completed,buffer,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-28]
	push	ax
	xor	ax,ax
	push	ax
	push	word ptr [di+62]
	call	near ptr _ultoa
	add	sp,8
   ;	
   ;	#ifndef SPEAR
   ;			for (str = buffer;*str;str++)
   ;	
	lea	ax,word ptr [bp-28]
	mov	si,ax
	jmp	short @9@122
@9@74:
   ;	
   ;				*str = *str + (129 - '0');	// Used fixed-width numbers (129...)
   ;	
	mov	al,byte ptr [si]
	add	al,81
	mov	byte ptr [si],al
	inc	si
@9@122:
	cmp	byte ptr [si],0
	jne	short @9@74
   ;	
   ;			USL_MeasureString(buffer,&w,&h);
   ;	
	lea	ax,word ptr [bp-12]
	push	ax
	lea	ax,word ptr [bp-10]
	push	ax
	push	ss
	lea	ax,word ptr [bp-28]
	push	ax
	call	word ptr DGROUP:_USL_MeasureString
	add	sp,8
   ;	
   ;			PrintX = (22 * 8)-w;
   ;	
	mov	ax,176
	sub	ax,word ptr [bp-10]
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;	#else
   ;			USL_MeasureString(buffer,&w,&h);
   ;			PrintX = 194 - w;
   ;	#endif
   ;	
   ;	#ifndef UPLOAD
   ;	#ifndef SPEAR
   ;			PrintX -= 6;
   ;	
	sub	word ptr DGROUP:_PrintX,6
   ;	
   ;			itoa(s->episode+1,buffer1,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-6]
	push	ax
	mov	ax,word ptr [di+64]
	inc	ax
	push	ax
	call	near ptr _itoa
	add	sp,6
   ;	
   ;			US_Print("E");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+223
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;			US_Print(buffer1);
   ;	
	push	ss
	lea	ax,word ptr [bp-6]
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;			US_Print("/L");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+225
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;	#endif
   ;	#endif
   ;	
   ;	#ifdef SPEAR
   ;			if (s->completed == 21)
   ;				VWB_DrawPic (PrintX+8,PrintY-1,C_WONSPEARPIC);
   ;			else
   ;	#endif
   ;			US_Print(buffer);
   ;	
	push	ss
	lea	ax,word ptr [bp-28]
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;	
   ;			//
   ;			// score
   ;			//
   ;			ultoa(s->score,buffer,10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-28]
	push	ax
	push	word ptr [di+60]
	push	word ptr [di+58]
	call	near ptr _ultoa
	add	sp,8
   ;	
   ;	#ifndef SPEAR
   ;			for (str = buffer;*str;str++)
   ;	
	lea	ax,word ptr [bp-28]
	mov	si,ax
	jmp	short @9@218
@9@170:
   ;	
   ;				*str = *str + (129 - '0');	// Used fixed-width numbers (129...)
   ;	
	mov	al,byte ptr [si]
	add	al,81
	mov	byte ptr [si],al
	inc	si
@9@218:
	cmp	byte ptr [si],0
	jne	short @9@170
   ;	
   ;			USL_MeasureString(buffer,&w,&h);
   ;	
	lea	ax,word ptr [bp-12]
	push	ax
	lea	ax,word ptr [bp-10]
	push	ax
	push	ss
	lea	ax,word ptr [bp-28]
	push	ax
	call	word ptr DGROUP:_USL_MeasureString
	add	sp,8
   ;	
   ;			PrintX = (34 * 8) - 8 - w;
   ;	
	mov	ax,264
	sub	ax,word ptr [bp-10]
	mov	word ptr DGROUP:_PrintX,ax
   ;	
   ;	#else
   ;			USL_MeasureString(buffer,&w,&h);
   ;			PrintX = 292 - w;
   ;	#endif
   ;			US_Print(buffer);
   ;	
	push	ss
	lea	ax,word ptr [bp-28]
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
	inc	word ptr [bp-8]
	add	di,66
@9@290:
	cmp	word ptr [bp-8],7
	jae	@@4
	jmp	@9@50
@@4:
   ;	
   ;	
   ;			#if 0
   ;	#ifndef UPLOAD
   ;	#ifndef SPEAR
   ;			//
   ;			// verification #
   ;			//
   ;			if (!i)
   ;			{
   ;			 temp=(((s->score >> 28)& 0xf)^
   ;				  ((s->score >> 24)& 0xf))+'A';
   ;			 temp1=(((s->score >> 20)& 0xf)^
   ;				   ((s->score >> 16)& 0xf))+'A';
   ;			 temp2=(((s->score >> 12)& 0xf)^
   ;				   ((s->score >> 8)& 0xf))+'A';
   ;			 temp3=(((s->score >> 4)& 0xf)^
   ;				   ((s->score >> 0)& 0xf))+'A';
   ;	
   ;			 SETFONTCOLOR(0x49,0x29);
   ;			 PrintX = 35*8;
   ;			 buffer[0]=temp;
   ;			 buffer[1]=temp1;
   ;			 buffer[2]=temp2;
   ;			 buffer[3]=temp3;
   ;			 buffer[4]=0;
   ;			 US_Print(buffer);
   ;			 SETFONTCOLOR(15,0x29);
   ;			}
   ;	#endif
   ;	#endif
   ;			#endif
   ;		}
   ;	
   ;		VW_UpdateScreen ();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;	
   ;	#ifdef SPEAR
   ;		UnCacheLump (HIGHSCORES_LUMP_START,HIGHSCORES_LUMP_END);
   ;		fontnumber = 0;
   ;	#endif
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_DrawHighScores	endp
   ;	
   ;	void	CheckHighScore (long score,word other)
   ;	
	assume	cs:_TEXT
_CheckHighScore	proc	near
	push	bp
	mov	bp,sp
	sub	sp,68
	push	si
	push	di
   ;	
   ;	{
   ;		word		i,j;
   ;		int			n;
   ;		HighScore	myscore;
   ;	
   ;		strcpy(myscore.name,"");
   ;	
	mov	ax,offset DGROUP:s@+228
	push	ax
	lea	ax,word ptr [bp-68]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;		myscore.score = score;
   ;	
	mov	ax,word ptr [bp+6]
	mov	dx,word ptr [bp+4]
	mov	word ptr [bp-10],dx
	mov	word ptr [bp-8],ax
   ;	
   ;		myscore.episode = gamestate.episode;
   ;	
	mov	ax,word ptr DGROUP:_gamestate+38
	mov	word ptr [bp-4],ax
   ;	
   ;		myscore.completed = other;
   ;	
	mov	ax,word ptr [bp+8]
	mov	word ptr [bp-6],ax
   ;	
   ;	
   ;		for (i = 0,n = -1;i < MaxScores;i++)
   ;	
	xor	si,si
	mov	di,65535
	jmp	@10@314
@10@50:
   ;	
   ;		{
   ;			if
   ;	
   ;	
   ;			(
   ;				(myscore.score > Scores[i].score)
   ;			||	(
   ;					(myscore.score == Scores[i].score)
   ;				&& 	(myscore.completed > Scores[i].completed)
   ;				)
   ;			)
   ;	
	mov	ax,si
	mov	dx,66
	imul	dx
	mov	bx,ax
	mov	ax,word ptr DGROUP:_Scores[bx+60]
	mov	dx,word ptr DGROUP:_Scores[bx+58]
	cmp	ax,word ptr [bp-8]
	jl	short @10@194
	jne	short @10@122
	cmp	dx,word ptr [bp-10]
	jb	short @10@194
@10@122:
	mov	ax,si
	mov	dx,66
	imul	dx
	mov	bx,ax
	mov	ax,word ptr DGROUP:_Scores[bx+60]
	mov	dx,word ptr DGROUP:_Scores[bx+58]
	cmp	ax,word ptr [bp-8]
	jne	short @10@290
	cmp	dx,word ptr [bp-10]
	jne	short @10@290
	mov	ax,si
	mov	dx,66
	imul	dx
	mov	bx,ax
	mov	ax,word ptr DGROUP:_Scores[bx+62]
	cmp	ax,word ptr [bp-6]
	jae	short @10@290
@10@194:
   ;	
   ;			{
   ;				for (j = MaxScores;--j > i;)
   ;	
	mov	word ptr [bp-2],7
	jmp	short @10@242
@10@218:
   ;	
   ;					Scores[j] = Scores[j - 1];
   ;	
	mov	ax,word ptr [bp-2]
	mov	dx,66
	imul	dx
	add	ax,offset DGROUP:_Scores
	push	ds
	push	ax
	mov	ax,word ptr [bp-2]
	dec	ax
	mov	dx,66
	imul	dx
	add	ax,offset DGROUP:_Scores
	push	ds
	push	ax
	mov	cx,66
	call	near ptr N_SCOPY@
@10@242:
	dec	word ptr [bp-2]
	mov	ax,word ptr [bp-2]
	cmp	ax,si
	ja	short @10@218
   ;	
   ;				Scores[i] = myscore;
   ;	
	mov	ax,si
	mov	dx,66
	imul	dx
	add	ax,offset DGROUP:_Scores
	push	ds
	push	ax
	lea	ax,word ptr [bp-68]
	push	ss
	push	ax
	mov	cx,66
	call	near ptr N_SCOPY@
   ;	
   ;				n = i;
   ;	
	mov	di,si
   ;	
   ;				break;
   ;	
	jmp	short @10@338
@10@290:
	inc	si
@10@314:
	cmp	si,7
	jae	@@5
	jmp	@10@50
@@5:
@10@338:
   ;	
   ;			}
   ;		}
   ;	
   ;	#ifdef SPEAR
   ;		StartCPMusic (XAWARD_MUS);
   ;	#else
   ;		StartCPMusic (ROSTER_MUS);
   ;	
	mov	ax,23
	push	ax
	call	near ptr _StartCPMusic
	pop	cx
   ;	
   ;	#endif
   ;		DrawHighScores ();
   ;	
	call	near ptr _DrawHighScores
   ;	
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
   ;		if (n != -1)
   ;	
	cmp	di,65535
	je	short @10@386
   ;	
   ;		{
   ;		//
   ;		// got a high score
   ;		//
   ;			PrintY = 76 + (16 * n);
   ;	
	mov	ax,di
	mov	cl,4
	shl	ax,cl
	add	ax,76
	mov	word ptr DGROUP:_PrintY,ax
   ;	
   ;	#ifndef SPEAR
   ;			PrintX = 4*8;
   ;	
	mov	word ptr DGROUP:_PrintX,32
   ;	
   ;			backcolor = BORDCOLOR;
   ;	
	mov	byte ptr DGROUP:_backcolor,41
   ;	
   ;			fontcolor = 15;
   ;	
	mov	byte ptr DGROUP:_fontcolor,15
   ;	
   ;			US_LineInput(PrintX,PrintY,Scores[n].name,nil,true,MaxHighName,100);
   ;	
	mov	ax,100
	push	ax
	mov	ax,57
	push	ax
	mov	ax,1
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,di
	mov	dx,66
	imul	dx
	add	ax,offset DGROUP:_Scores
	push	ax
	push	word ptr DGROUP:_PrintY
	push	word ptr DGROUP:_PrintX
	call	near ptr _US_LineInput
	add	sp,14
   ;	
   ;	#else
   ;			PrintX = 16;
   ;			fontnumber = 1;
   ;			VWB_Bar (PrintX-2,PrintY-2,145,15,0x9c);
   ;			VW_UpdateScreen ();
   ;			backcolor = 0x9c;
   ;			fontcolor = 15;
   ;			US_LineInput(PrintX,PrintY,Scores[n].name,nil,true,MaxHighName,130);
   ;	#endif
   ;		}
   ;	
	jmp	short @10@410
@10@386:
   ;	
   ;		else
   ;		{
   ;			IN_ClearKeysDown ();
   ;	
	call	near ptr _IN_ClearKeysDown
   ;	
   ;			IN_UserInput(500);
   ;	
	xor	ax,ax
	mov	dx,500
	push	ax
	push	dx
	call	near ptr _IN_UserInput
	pop	cx
	pop	cx
@10@410:
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
_CheckHighScore	endp
   ;	
   ;	void NonShareware(void)
   ;	
	assume	cs:_TEXT
_NonShareware	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		VW_FadeOut();
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
   ;		ClearMScreen();
   ;	
	call	near ptr _ClearMScreen
   ;	
   ;		DrawStripes(10);
   ;	
	mov	ax,10
	push	ax
	call	near ptr _DrawStripes
	pop	cx
   ;	
   ;	
   ;		CA_CacheGrChunk(STARTFONT+1);
   ;	
	mov	ax,2
	push	ax
	call	near ptr _CA_CacheGrChunk
	pop	cx
   ;	
   ;		fontnumber = 1;
   ;	
	mov	word ptr DGROUP:_fontnumber,1
   ;	
   ;	
   ;		SETFONTCOLOR(READHCOLOR,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,71
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;		PrintX=110;
   ;	
	mov	word ptr DGROUP:_PrintX,110
   ;	
   ;		PrintY=15;
   ;	
	mov	word ptr DGROUP:_PrintY,15
   ;	
   ;	
   ;		#ifdef SPANISH
   ;		US_Print("Atencion");
   ;		#else
   ;		US_Print("Attention");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+229
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		#endif
   ;	
   ;		SETFONTCOLOR(HIGHLIGHT,BKGDCOLOR);
   ;	
	mov	byte ptr DGROUP:_fontcolor,19
	mov	byte ptr DGROUP:_backcolor,45
   ;	
   ;		WindowX=PrintX=40;
   ;	
	mov	ax,40
	mov	word ptr DGROUP:_PrintX,ax
	mov	word ptr DGROUP:_WindowX,ax
   ;	
   ;		PrintY=60;
   ;	
	mov	word ptr DGROUP:_PrintY,60
   ;	
   ;		#ifdef SPANISH
   ;		US_Print("Este juego NO es gratis y\n");
   ;		US_Print("NO es Shareware; favor de\n");
   ;		US_Print("no distribuirlo.\n\n");
   ;		#else
   ;		US_Print("This game is NOT shareware.\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+239
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		US_Print("Please do not distribute it.\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+268
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		US_Print("Thanks.\n\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+298
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;		#endif
   ;		US_Print("        Id Software\n");
   ;	
	push	ds
	mov	ax,offset DGROUP:s@+308
	push	ax
	call	near ptr _US_Print
	pop	cx
	pop	cx
   ;	
   ;	
   ;		VW_UpdateScreen ();
   ;	
	call	near ptr _VW_UpdateScreen
   ;	
   ;		VW_FadeIn();
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
   ;		IN_Ack();
   ;	
	call	near ptr _IN_Ack
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_NonShareware	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_menuitems	label	word
	db	2 dup (?)
_LevelRatios	label	word
	db	80 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'you win!'
	db	0
	db	'total time'
	db	0
	db	'averages'
	db	0
	db	'kill    %'
	db	0
	db	'secret    %'
	db	0
	db	'treasure    %'
	db	0
	db	':'
	db	0
	db	'goobers'
	db	0
	db	'floor'
	db	10
	db	'completed'
	db	0
	db	'bonus     0'
	db	0
	db	'time'
	db	0
	db	' par'
	db	0
	db	'kill ratio    %'
	db	0
	db	'secret ratio    %'
	db	0
	db	'treasure ratio    %'
	db	0
	db	0
	db	'@'
	db	-125
	db	'E'
	db	0
	db	0
	db	-116
	db	'B:'
	db	0
	db	'secret floor'
	db	10
	db	' completed!'
	db	0
	db	'15000 bonus!'
	db	0
	db	'goobers'
	db	0
	db	'E'
	db	0
	db	'/L'
	db	0
	db	0
	db	'Attention'
	db	0
	db	'This game is NOT shareware.'
	db	10
	db	0
	db	'Please do not distribute it.'
	db	10
	db	0
	db	'Thanks.'
	db	10
	db	10
	db	0
	db	'        Id Software'
	db	10
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	extrn	_Scores:word
	public	_LevelCompleted
	extrn	_PicturePause:near
	extrn	_EndText:near
	extrn	_DrawLevel:near
	extrn	_LatchDrawPic:near
	extrn	_grneeded:byte
	public	_LevelRatios
	extrn	_SD_SoundPlaying:near
	extrn	_PrintY:word
	extrn	_PrintX:word
	extrn	_MM_FreePtr:near
	extrn	_ca_levelbit:byte
	extrn	_GivePoints:near
	public	_CheckHighScore
	extrn	_gamestate:word
	public	_Write
	extrn	_grsegs:word
	extrn	_backcolor:byte
	public	_menuitems
	extrn	_USL_MeasureString:word
	extrn	_TimeCount:word
	extrn	_MM_SortMem:near
	extrn	_CacheLump:near
	extrn	_IN_Ack:near
	extrn	_Keyboard:word
	extrn	_PM_Preload:near
	extrn	_bufferofs:word
	extrn	_WindowH:word
	extrn	_WindowW:word
	extrn	_WindowY:word
	extrn	_WindowX:word
	extrn	_SD_StopSound:near
	extrn	_SD_PlaySound:near
	public	_Victory
	extrn	_StartCPMusic:near
	extrn	_VL_FadeOut:near
	extrn	_ClearMScreen:near
	extrn	_VW_UpdateScreen:near
	public	_ClearSplitVWB
	extrn	_gamepal:byte
	extrn	_mapon:word
	extrn	_memset:near
	extrn	_IN_ClearKeysDown:near
	extrn	_US_LineInput:near
	public	_NonShareware
	extrn	_MS_CheckParm:near
	public	_PG13
	extrn	_update:byte
	extrn	_strcpy:near
	extrn	_VWB_DrawPic:near
	public	_PreloadUpdate
	extrn	_ultoa:near
	extrn	_screenloc:word
	public	_PreloadGraphics
	extrn	_fontcolor:byte
	extrn	_strlen:near
	extrn	N_SCOPY@:far
	extrn	_fontnumber:word
	extrn	_IN_UserInput:near
	public	_DrawHighScores
	extrn	_DrawPlayBorder:near
	extrn	_VL_WaitVBL:near
	extrn	_ltoa:near
	extrn	_itoa:near
	extrn	_VL_FadeIn:near
	extrn	_US_Print:near
	extrn	N_LDIV@:far
	extrn	N_LXMUL@:far
	extrn	_UnCacheLump:near
	extrn	_CA_CacheGrChunk:near
	extrn	N_FTOL@:far
	extrn	N_LMOD@:far
	extrn	_DrawStripes:near
	extrn	_IN_CheckAck:near
	extrn	_IN_StartAck:near
	extrn	_VWB_Bar:near
	extrn	_DrawScore:near
	public	_BJ_Breathe
	end
