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
	?debug	S "c:\id_ca.c"
	?debug	C E9E551FE7C0A633A5C69645F63612E63
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
_audioname	label	byte
	db	65
	db	85
	db	68
	db	73
	db	79
	db	46
	db	7 dup (0)
_gheadname	label	byte
	db	86
	db	71
	db	65
	db	72
	db	69
	db	65
	db	68
	db	46
	db	2 dup (0)
_gfilename	label	byte
	db	86
	db	71
	db	65
	db	71
	db	82
	db	65
	db	80
	db	72
	db	46
	db	1 dup (0)
_gdictname	label	byte
	db	86
	db	71
	db	65
	db	68
	db	73
	db	67
	db	84
	db	46
	db	2 dup (0)
_mheadname	label	byte
	db	77
	db	65
	db	80
	db	72
	db	69
	db	65
	db	68
	db	46
	db	2 dup (0)
_mfilename	label	byte
	db	77
	db	65
	db	80
	db	84
	db	69
	db	77
	db	80
	db	46
	db	2 dup (0)
_aheadname	label	byte
	db	65
	db	85
	db	68
	db	73
	db	79
	db	72
	db	69
	db	68
	db	46
	db	1 dup (0)
_afilename	label	byte
	db	65
	db	85
	db	68
	db	73
	db	79
	db	84
	db	46
	db	3 dup (0)
_DATA	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	long GRFILEPOS(int c)
   ;	
	assume	cs:_TEXT
_GRFILEPOS	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
   ;	
   ;	{
   ;		long value;
   ;		int	offset;
   ;	
   ;		offset = c*3;
   ;	
	mov	ax,word ptr [bp+4]
	mov	dx,3
	imul	dx
	mov	si,ax
   ;	
   ;	
   ;		value = *(long far *)(((byte far *)grstarts)+offset);
   ;	
	mov	es,word ptr DGROUP:_grstarts
	mov	ax,word ptr es:[si+2]
	mov	dx,word ptr es:[si]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;		value &= 0x00ffffffl;
   ;	
	and	word ptr [bp-4],65535
	and	word ptr [bp-2],255
   ;	
   ;	
   ;		if (value == 0xffffffl)
   ;	
	cmp	word ptr [bp-2],255
	jne	short @1@98
	cmp	word ptr [bp-4],65535
	jne	short @1@98
   ;	
   ;			value = -1;
   ;	
	mov	word ptr [bp-4],65535
	mov	word ptr [bp-2],65535
@1@98:
   ;	
   ;	
   ;		return value;
   ;	
	mov	dx,word ptr [bp-2]
	mov	ax,word ptr [bp-4]
	jmp	short @1@122
@1@122:
   ;	
   ;	};
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_GRFILEPOS	endp
   ;	
   ;	void CA_OpenDebug (void)
   ;	
	assume	cs:_TEXT
_CA_OpenDebug	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		unlink ("DEBUG.TXT");
   ;	
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _unlink
	pop	cx
   ;	
   ;		debughandle = open("DEBUG.TXT", O_CREAT | O_WRONLY | O_TEXT);
   ;	
	mov	ax,16642
	push	ax
	mov	ax,offset DGROUP:s@+10
	push	ax
	call	near ptr _open
	pop	cx
	pop	cx
	mov	word ptr DGROUP:_debughandle,ax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_CA_OpenDebug	endp
   ;	
   ;	void CA_CloseDebug (void)
   ;	
	assume	cs:_TEXT
_CA_CloseDebug	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		close (debughandle);
   ;	
	push	word ptr DGROUP:_debughandle
	call	near ptr _close
	pop	cx
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_CA_CloseDebug	endp
   ;	
   ;	void CAL_GetGrChunkLength (int chunk)
   ;	
	assume	cs:_TEXT
_CAL_GetGrChunkLength	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		lseek(grhandle,GRFILEPOS(chunk),SEEK_SET);
   ;	
	xor	ax,ax
	push	ax
	push	si
	call	near ptr _GRFILEPOS
	pop	cx
	push	dx
	push	ax
	push	word ptr DGROUP:_grhandle
	call	near ptr _lseek
	add	sp,8
   ;	
   ;		read(grhandle,&chunkexplen,sizeof(chunkexplen));
   ;	
	mov	ax,4
	push	ax
	mov	ax,offset DGROUP:_chunkexplen
	push	ax
	push	word ptr DGROUP:_grhandle
	call	near ptr _read
	add	sp,6
   ;	
   ;		chunkcomplen = GRFILEPOS(chunk+1)-GRFILEPOS(chunk)-4;
   ;	
	mov	ax,si
	inc	ax
	push	ax
	call	near ptr _GRFILEPOS
	pop	cx
	push	ax
	push	dx
	push	si
	call	near ptr _GRFILEPOS
	pop	cx
	pop	bx
	pop	cx
	sub	cx,ax
	sbb	bx,dx
	add	cx,65532
	adc	bx,65535
	mov	word ptr DGROUP:_chunkcomplen,cx
	mov	word ptr DGROUP:_chunkcomplen+2,bx
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_CAL_GetGrChunkLength	endp
   ;	
   ;	boolean CA_FarRead (int handle, byte far *dest, long length)
   ;	
	assume	cs:_TEXT
_CA_FarRead	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		if (length>0xffffl)
   ;	
	cmp	word ptr [bp+12],0
	jl	short @5@122
	jg	short @5@98
	cmp	word ptr [bp+10],65535
	jbe	short @5@122
@5@98:
   ;	
   ;			Quit ("CA_FarRead doesn't support 64K reads yet!");
   ;	
	mov	ax,offset DGROUP:s@+20
	push	ax
	call	near ptr _Quit
	pop	cx
@5@122:
   ;	
   ;	
   ;	asm		push	ds
   ;	
			push		ds
   ;	
   ;	asm		mov	bx,[handle]
   ;	
			mov		bx,[[bp+4]]
   ;	
   ;	asm		mov	cx,[WORD PTR length]
   ;	
			mov		cx,[WORD PTR [bp+10]]
   ;	
   ;	asm		mov	dx,[WORD PTR dest]
   ;	
			mov		dx,[WORD PTR [bp+6]]
   ;	
   ;	asm		mov	ds,[WORD PTR dest+2]
   ;	
			mov		ds,[WORD PTR [bp+6]+2]
   ;	
   ;	asm		mov	ah,0x3f				// READ w/handle
   ;	
			mov		ah,03fH				
   ;	
   ;	asm		int	21h
   ;	
			int		21h
   ;	
   ;	asm		pop	ds
   ;	
			pop		ds
   ;	
   ;	asm		jnc	good
   ;	
	jnc	short @5@362
   ;	
   ;		errno = _AX;
   ;	
	mov	word ptr DGROUP:_errno,ax
   ;	
   ;		return	false;
   ;	
	xor	ax,ax
	jmp	short @5@458
@5@362:
   ;	
   ;	good:
   ;	asm		cmp	ax,[WORD PTR length]
   ;	
			cmp		ax,[WORD PTR [bp+10]]
   ;	
   ;	asm		je	done
   ;	
	je	short @5@434
   ;	
   ;		errno = EINVFMT;			// user manager knows this is bad read
   ;	
	mov	word ptr DGROUP:_errno,11
   ;	
   ;		return	false;
   ;	
	xor	ax,ax
	jmp	short @5@458
@5@434:
   ;	
   ;	done:
   ;		return	true;
   ;	
	mov	ax,1
	jmp	short @5@458
@5@458:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_CA_FarRead	endp
   ;	
   ;	boolean CA_FarWrite (int handle, byte far *source, long length)
   ;	
	assume	cs:_TEXT
_CA_FarWrite	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		if (length>0xffffl)
   ;	
	cmp	word ptr [bp+12],0
	jl	short @6@122
	jg	short @6@98
	cmp	word ptr [bp+10],65535
	jbe	short @6@122
@6@98:
   ;	
   ;			Quit ("CA_FarWrite doesn't support 64K reads yet!");
   ;	
	mov	ax,offset DGROUP:s@+62
	push	ax
	call	near ptr _Quit
	pop	cx
@6@122:
   ;	
   ;	
   ;	asm		push	ds
   ;	
			push		ds
   ;	
   ;	asm		mov	bx,[handle]
   ;	
			mov		bx,[[bp+4]]
   ;	
   ;	asm		mov	cx,[WORD PTR length]
   ;	
			mov		cx,[WORD PTR [bp+10]]
   ;	
   ;	asm		mov	dx,[WORD PTR source]
   ;	
			mov		dx,[WORD PTR [bp+6]]
   ;	
   ;	asm		mov	ds,[WORD PTR source+2]
   ;	
			mov		ds,[WORD PTR [bp+6]+2]
   ;	
   ;	asm		mov	ah,0x40			// WRITE w/handle
   ;	
			mov		ah,040H			
   ;	
   ;	asm		int	21h
   ;	
			int		21h
   ;	
   ;	asm		pop	ds
   ;	
			pop		ds
   ;	
   ;	asm		jnc	good
   ;	
	jnc	short @6@362
   ;	
   ;		errno = _AX;
   ;	
	mov	word ptr DGROUP:_errno,ax
   ;	
   ;		return	false;
   ;	
	xor	ax,ax
	jmp	short @6@458
@6@362:
   ;	
   ;	good:
   ;	asm		cmp	ax,[WORD PTR length]
   ;	
			cmp		ax,[WORD PTR [bp+10]]
   ;	
   ;	asm		je	done
   ;	
	je	short @6@434
   ;	
   ;		errno = ENOMEM;				// user manager knows this is bad write
   ;	
	mov	word ptr DGROUP:_errno,8
   ;	
   ;		return	false;
   ;	
	xor	ax,ax
	jmp	short @6@458
@6@434:
   ;	
   ;	
   ;	done:
   ;		return	true;
   ;	
	mov	ax,1
	jmp	short @6@458
@6@458:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_CA_FarWrite	endp
   ;	
   ;	boolean CA_ReadFile (char *filename, memptr *ptr)
   ;	
	assume	cs:_TEXT
_CA_ReadFile	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
   ;	
   ;	{
   ;		int handle;
   ;		long size;
   ;	
   ;		if ((handle = open(filename,O_RDONLY | O_BINARY, S_IREAD)) == -1)
   ;	
	mov	ax,256
	push	ax
	mov	ax,32769
	push	ax
	push	word ptr [bp+4]
	call	near ptr _open
	add	sp,6
	mov	si,ax
	cmp	ax,65535
	jne	short @7@74
   ;	
   ;			return false;
   ;	
	xor	ax,ax
	jmp	short @7@146
@7@74:
   ;	
   ;	
   ;		size = filelength (handle);
   ;	
	push	si
	call	near ptr _filelength
	pop	cx
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;		if (!CA_FarRead (handle,*ptr,size))
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	mov	bx,word ptr [bp+6]
	push	word ptr [bx]
	xor	ax,ax
	push	ax
	push	si
	call	near ptr _CA_FarRead
	add	sp,10
	or	ax,ax
	jne	short @7@122
   ;	
   ;		{
   ;			close (handle);
   ;	
	push	si
	call	near ptr _close
	pop	cx
   ;	
   ;			return false;
   ;	
	xor	ax,ax
	jmp	short @7@146
@7@122:
   ;	
   ;		}
   ;		close (handle);
   ;	
	push	si
	call	near ptr _close
	pop	cx
   ;	
   ;		return true;
   ;	
	mov	ax,1
	jmp	short @7@146
@7@146:
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CA_ReadFile	endp
   ;	
   ;	boolean CA_WriteFile (char *filename, void far *ptr, long length)
   ;	
	assume	cs:_TEXT
_CA_WriteFile	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int handle;
   ;		long size;
   ;	
   ;		handle = open(filename,O_CREAT | O_BINARY | O_WRONLY,
   ;	
   ;	
   ;					S_IREAD | S_IWRITE | S_IFREG);
   ;	
	mov	ax,33152
	push	ax
	mov	ax,33026
	push	ax
	push	word ptr [bp+4]
	call	near ptr _open
	add	sp,6
	mov	si,ax
   ;	
   ;	
   ;		if (handle == -1)
   ;	
	cmp	si,65535
	jne	short @8@74
   ;	
   ;			return false;
   ;	
	xor	ax,ax
	jmp	short @8@146
@8@74:
   ;	
   ;	
   ;		if (!CA_FarWrite (handle,ptr,length))
   ;	
	push	word ptr [bp+12]
	push	word ptr [bp+10]
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	push	si
	call	near ptr _CA_FarWrite
	add	sp,10
	or	ax,ax
	jne	short @8@122
   ;	
   ;		{
   ;			close (handle);
   ;	
	push	si
	call	near ptr _close
	pop	cx
   ;	
   ;			return false;
   ;	
	xor	ax,ax
	jmp	short @8@146
@8@122:
   ;	
   ;		}
   ;		close (handle);
   ;	
	push	si
	call	near ptr _close
	pop	cx
   ;	
   ;		return true;
   ;	
	mov	ax,1
	jmp	short @8@146
@8@146:
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_CA_WriteFile	endp
   ;	
   ;	boolean CA_LoadFile (char *filename, memptr *ptr)
   ;	
	assume	cs:_TEXT
_CA_LoadFile	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
	mov	di,word ptr [bp+6]
   ;	
   ;	{
   ;		int handle;
   ;		long size;
   ;	
   ;		if ((handle = open(filename,O_RDONLY | O_BINARY, S_IREAD)) == -1)
   ;	
	mov	ax,256
	push	ax
	mov	ax,32769
	push	ax
	push	word ptr [bp+4]
	call	near ptr _open
	add	sp,6
	mov	si,ax
	cmp	ax,65535
	jne	short @9@74
   ;	
   ;			return false;
   ;	
	xor	ax,ax
	jmp	short @9@146
@9@74:
   ;	
   ;	
   ;		size = filelength (handle);
   ;	
	push	si
	call	near ptr _filelength
	pop	cx
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;		MM_GetPtr (ptr,size);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	di
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;		if (!CA_FarRead (handle,*ptr,size))
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr [di]
	xor	ax,ax
	push	ax
	push	si
	call	near ptr _CA_FarRead
	add	sp,10
	or	ax,ax
	jne	short @9@122
   ;	
   ;		{
   ;			close (handle);
   ;	
	push	si
	call	near ptr _close
	pop	cx
   ;	
   ;			return false;
   ;	
	xor	ax,ax
	jmp	short @9@146
@9@122:
   ;	
   ;		}
   ;		close (handle);
   ;	
	push	si
	call	near ptr _close
	pop	cx
   ;	
   ;		return true;
   ;	
	mov	ax,1
	jmp	short @9@146
@9@146:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CA_LoadFile	endp
   ;	
   ;	void CAL_OptimizeNodes (huffnode *table)
   ;	
	assume	cs:_TEXT
_CAL_OptimizeNodes	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	bx,word ptr [bp+4]
   ;	
   ;	{
   ;	  huffnode *node;
   ;	  int i;
   ;	
   ;	  node = table;
   ;	
	mov	si,bx
   ;	
   ;	
   ;	  for (i=0;i<255;i++)
   ;	
	xor	di,di
	jmp	short @10@194
@10@50:
   ;	
   ;	  {
   ;		if (node->bit0 >= 256)
   ;	
	cmp	word ptr [si],256
	jb	short @10@98
   ;	
   ;		  node->bit0 = (unsigned)(table+(node->bit0-256));
   ;	
	mov	ax,word ptr [si]
	sub	ax,256
	shl	ax,1
	shl	ax,1
	mov	dx,bx
	add	dx,ax
	mov	word ptr [si],dx
@10@98:
   ;	
   ;		if (node->bit1 >= 256)
   ;	
	cmp	word ptr [si+2],256
	jb	short @10@146
   ;	
   ;		  node->bit1 = (unsigned)(table+(node->bit1-256));
   ;	
	mov	ax,word ptr [si+2]
	sub	ax,256
	shl	ax,1
	shl	ax,1
	mov	dx,bx
	add	dx,ax
	mov	word ptr [si+2],dx
@10@146:
   ;	
   ;		node++;
   ;	
	add	si,4
	inc	di
@10@194:
	cmp	di,255
	jl	short @10@50
   ;	
   ;	  }
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_CAL_OptimizeNodes	endp
   ;	
   ;	void CAL_HuffExpand (byte huge *source, byte huge *dest,
   ;	
	assume	cs:_TEXT
_CAL_HuffExpand	proc	near
	push	bp
	mov	bp,sp
	sub	sp,14
	push	si
	push	di
   ;	
   ;	  long length,huffnode *hufftable, boolean screenhack)
   ;	{
   ;	//  unsigned bit,byte,node,code;
   ;	  unsigned sourceseg,sourceoff,destseg,destoff,endoff;
   ;	  huffnode *headptr;
   ;	  byte		mapmask;
   ;	//  huffnode *nodeon;
   ;	
   ;	  headptr = hufftable+254;	// head node is allways node 254
   ;	
	mov	ax,word ptr [bp+16]
	add	ax,1016
	mov	word ptr [bp-12],ax
   ;	
   ;	
   ;	  source++;	// normalize
   ;	
	xor	cx,cx
	mov	bx,1
	mov	dx,ss
	lea	ax,word ptr [bp+4]
	call	near ptr N_PADA@
   ;	
   ;	  source--;
   ;	
	xor	cx,cx
	mov	bx,1
	mov	dx,ss
	lea	ax,word ptr [bp+4]
	call	near ptr N_PSBA@
   ;	
   ;	  dest++;
   ;	
	xor	cx,cx
	mov	bx,1
	mov	dx,ss
	lea	ax,word ptr [bp+8]
	call	near ptr N_PADA@
   ;	
   ;	  dest--;
   ;	
	xor	cx,cx
	mov	bx,1
	mov	dx,ss
	lea	ax,word ptr [bp+8]
	call	near ptr N_PSBA@
   ;	
   ;	
   ;	  if (screenhack)
   ;	
	cmp	word ptr [bp+18],0
	je	short @11@170
   ;	
   ;	  {
   ;		mapmask = 1;
   ;	
	mov	byte ptr [bp-13],1
   ;	
   ;	asm	mov	dx,SC_INDEX
   ;	
		mov		dx,03C4H
   ;	
   ;	asm	mov	ax,SC_MAPMASK + 256
   ;	
		mov		ax,2 + 256
   ;	
   ;	asm	out	dx,ax
   ;	
		out		dx,ax
   ;	
   ;		length >>= 2;
   ;	
	mov	cl,2
	mov	dx,word ptr [bp+14]
	mov	ax,word ptr [bp+12]
	call	near ptr N_LXRSH@
	mov	word ptr [bp+12],ax
	mov	word ptr [bp+14],dx
@11@170:
   ;	
   ;	  }
   ;	
   ;	  sourceseg = FP_SEG(source);
   ;	
	mov	ax,word ptr [bp+6]
	mov	word ptr [bp-2],ax
   ;	
   ;	  sourceoff = FP_OFF(source);
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr [bp-4],ax
   ;	
   ;	  destseg = FP_SEG(dest);
   ;	
	mov	ax,word ptr [bp+10]
	mov	word ptr [bp-6],ax
   ;	
   ;	  destoff = FP_OFF(dest);
   ;	
	mov	ax,word ptr [bp+8]
	mov	word ptr [bp-8],ax
   ;	
   ;	  endoff = destoff+length;
   ;	
	mov	ax,word ptr [bp-8]
	add	ax,word ptr [bp+12]
	mov	word ptr [bp-10],ax
   ;	
   ;	
   ;	//
   ;	// ds:si source
   ;	// es:di dest
   ;	// ss:bx node pointer
   ;	//
   ;	
   ;		if (length <0xfff0)
   ;	
	cmp	word ptr [bp+14],0
	jle	@@0
	jmp	@11@1274
@@0:
	jl	short @11@242
	cmp	word ptr [bp+12],65520
	jb	@@1
	jmp	@11@1274
@@1:
@11@242:
   ;	
   ;		{
   ;	
   ;	//--------------------------
   ;	// expand less than 64k of data
   ;	//--------------------------
   ;	
   ;	asm mov	bx,[headptr]
   ;	
 	mov		bx,[[bp-12]]
   ;	
   ;	
   ;	asm	mov	si,[sourceoff]
   ;	
		mov		si,[[bp-4]]
   ;	
   ;	asm	mov	di,[destoff]
   ;	
		mov		di,[[bp-8]]
   ;	
   ;	asm	mov	es,[destseg]
   ;	
		mov		es,[[bp-6]]
   ;	
   ;	asm	mov	ds,[sourceseg]
   ;	
		mov		ds,[[bp-2]]
   ;	
   ;	asm	mov	ax,[endoff]
   ;	
		mov		ax,[[bp-10]]
   ;	
   ;	
   ;	asm	mov	ch,[si]				// load first byte
   ;	
		mov		ch,[si]				
   ;	
   ;	asm	inc	si
   ;	
		inc		si
   ;	
   ;	asm	mov	cl,1
   ;	
		mov		cl,1
@11@458:
   ;	
   ;	
   ;	expandshort:
   ;	asm	test	ch,cl			// bit set?
   ;	
		test		ch,cl			
   ;	
   ;	asm	jnz	bit1short
   ;	
	jne	short @11@602
   ;	
   ;	asm	mov	dx,[ss:bx]			// take bit0 path from node
   ;	
		mov		dx,[ss:bx]			
   ;	
   ;	asm	shl	cl,1				// advance to next bit position
   ;	
		shl		cl,1				
   ;	
   ;	asm	jc	newbyteshort
   ;	
	jc	short @11@674
   ;	
   ;	asm	jnc	sourceupshort
   ;	
	jnc	short @11@746
@11@602:
   ;	
   ;	
   ;	bit1short:
   ;	asm	mov	dx,[ss:bx+2]		// take bit1 path
   ;	
		mov		dx,[ss:bx+2]		
   ;	
   ;	asm	shl	cl,1				// advance to next bit position
   ;	
		shl		cl,1				
   ;	
   ;	asm	jnc	sourceupshort
   ;	
	jnc	short @11@746
@11@674:
   ;	
   ;	
   ;	newbyteshort:
   ;	asm	mov	ch,[si]				// load next byte
   ;	
		mov		ch,[si]				
   ;	
   ;	asm	inc	si
   ;	
		inc		si
   ;	
   ;	asm	mov	cl,1				// back to first bit
   ;	
		mov		cl,1				
@11@746:
   ;	
   ;	
   ;	sourceupshort:
   ;	asm	or	dh,dh				// if dx<256 its a byte, else move node
   ;	
		or		dh,dh				
   ;	
   ;	asm	jz	storebyteshort
   ;	
	je	short @11@842
   ;	
   ;	asm	mov	bx,dx				// next node = (huffnode *)code
   ;	
		mov		bx,dx				
   ;	
   ;	asm	jmp	expandshort
   ;	
	jmp	short @11@458
@11@842:
   ;	
   ;	
   ;	storebyteshort:
   ;	asm	mov	[es:di],dl
   ;	
		mov		[es:di],dl
   ;	
   ;	asm	inc	di					// write a decopmpressed byte out
   ;	
		inc		di					
   ;	
   ;	asm	mov	bx,[headptr]		// back to the head node for next bit
   ;	
		mov		bx,[[bp-12]]		
   ;	
   ;	
   ;	asm	cmp	di,ax				// done?
   ;	
		cmp		di,ax				
   ;	
   ;	asm	jne	expandshort
   ;	
	jne	short @11@458
   ;	
   ;	
   ;	//
   ;	// perform screenhack if needed
   ;	//
   ;	asm	test	[screenhack],1
   ;	
		test		[[bp+18]],1
   ;	
   ;	asm	jz	notscreen
   ;	
	je	short @11@1250
   ;	
   ;	asm	shl	[mapmask],1
   ;	
		shl		[[bp-13]],1
   ;	
   ;	asm	mov	ah,[mapmask]
   ;	
		mov		ah,[[bp-13]]
   ;	
   ;	asm	cmp	ah,16
   ;	
		cmp		ah,16
   ;	
   ;	asm	je	notscreen			// all four planes done
   ;	
	je	short @11@1250
   ;	
   ;	asm	mov	dx,SC_INDEX
   ;	
		mov		dx,03C4H
   ;	
   ;	asm	mov	al,SC_MAPMASK
   ;	
		mov		al,2
   ;	
   ;	asm	out	dx,ax
   ;	
		out		dx,ax
   ;	
   ;	asm	mov	di,[destoff]
   ;	
		mov		di,[[bp-8]]
   ;	
   ;	asm	mov	ax,[endoff]
   ;	
		mov		ax,[[bp-10]]
   ;	
   ;	asm	jmp	expandshort
   ;	
	jmp	@11@458
@11@1250:
   ;	
   ;	
   ;	notscreen:;
   ;		}
   ;	
	jmp	@11@2234
@11@1274:
   ;	
   ;		else
   ;		{
   ;	
   ;	//--------------------------
   ;	// expand more than 64k of data
   ;	//--------------------------
   ;	
   ;	  length--;
   ;	
	sub	word ptr [bp+12],1
	sbb	word ptr [bp+14],0
   ;	
   ;	
   ;	asm mov	bx,[headptr]
   ;	
 	mov		bx,[[bp-12]]
   ;	
   ;	asm	mov	cl,1
   ;	
		mov		cl,1
   ;	
   ;	
   ;	asm	mov	si,[sourceoff]
   ;	
		mov		si,[[bp-4]]
   ;	
   ;	asm	mov	di,[destoff]
   ;	
		mov		di,[[bp-8]]
   ;	
   ;	asm	mov	es,[destseg]
   ;	
		mov		es,[[bp-6]]
   ;	
   ;	asm	mov	ds,[sourceseg]
   ;	
		mov		ds,[[bp-2]]
   ;	
   ;	
   ;	asm	lodsb			// load first byte
   ;	
		lodsb				
@11@1466:
   ;	
   ;	
   ;	expand:
   ;	asm	test	al,cl		// bit set?
   ;	
		test		al,cl		
   ;	
   ;	asm	jnz	bit1
   ;	
	jne	short @11@1562
   ;	
   ;	asm	mov	dx,[ss:bx]	// take bit0 path from node
   ;	
		mov		dx,[ss:bx]	
   ;	
   ;	asm	jmp	gotcode
   ;	
	jmp	short @11@1586
@11@1562:
   ;	
   ;	bit1:
   ;	asm	mov	dx,[ss:bx+2]	// take bit1 path
   ;	
		mov		dx,[ss:bx+2]	
@11@1586:
   ;	
   ;	
   ;	gotcode:
   ;	asm	shl	cl,1		// advance to next bit position
   ;	
		shl		cl,1		
   ;	
   ;	asm	jnc	sourceup
   ;	
	jnc	short @11@1826
   ;	
   ;	asm	lodsb
   ;	
		lodsb	
   ;	
   ;	asm	cmp	si,0x10		// normalize ds:si
   ;	
		cmp		si,010H		
   ;	
   ;	asm  	jb	sinorm
   ;	
	jb	short @11@1802
   ;	
   ;	asm	mov	cx,ds
   ;	
		mov		cx,ds
   ;	
   ;	asm	inc	cx
   ;	
		inc		cx
   ;	
   ;	asm	mov	ds,cx
   ;	
		mov		ds,cx
   ;	
   ;	asm	xor	si,si
   ;	
		xor		si,si
@11@1802:
   ;	
   ;	sinorm:
   ;	asm	mov	cl,1		// back to first bit
   ;	
		mov		cl,1		
@11@1826:
   ;	
   ;	
   ;	sourceup:
   ;	asm	or	dh,dh		// if dx<256 its a byte, else move node
   ;	
		or		dh,dh		
   ;	
   ;	asm	jz	storebyte
   ;	
	je	short @11@1922
   ;	
   ;	asm	mov	bx,dx		// next node = (huffnode *)code
   ;	
		mov		bx,dx		
   ;	
   ;	asm	jmp	expand
   ;	
	jmp	short @11@1466
@11@1922:
   ;	
   ;	
   ;	storebyte:
   ;	asm	mov	[es:di],dl
   ;	
		mov		[es:di],dl
   ;	
   ;	asm	inc	di		// write a decopmpressed byte out
   ;	
		inc		di		
   ;	
   ;	asm	mov	bx,[headptr]	// back to the head node for next bit
   ;	
		mov		bx,[[bp-12]]	
   ;	
   ;	
   ;	asm	cmp	di,0x10		// normalize es:di
   ;	
		cmp		di,010H		
   ;	
   ;	asm  	jb	dinorm
   ;	
	jb	short @11@2138
   ;	
   ;	asm	mov	dx,es
   ;	
		mov		dx,es
   ;	
   ;	asm	inc	dx
   ;	
		inc		dx
   ;	
   ;	asm	mov	es,dx
   ;	
		mov		es,dx
   ;	
   ;	asm	xor	di,di
   ;	
		xor		di,di
@11@2138:
   ;	
   ;	dinorm:
   ;	
   ;	asm	sub	[WORD PTR ss:length],1
   ;	
		sub		[WORD PTR ss:[bp+12]],1
   ;	
   ;	asm	jnc	expand
   ;	
	jnc	short @11@1466
   ;	
   ;	asm  	dec	[WORD PTR ss:length+2]
   ;	
  		dec		[WORD PTR ss:[bp+12]+2]
   ;	
   ;	asm	jns	expand		// when length = ffff ffff, done
   ;	
	jns	short @11@1466
@11@2234:
   ;	
   ;	
   ;		}
   ;	
   ;	asm	mov	ax,ss
   ;	
		mov		ax,ss
   ;	
   ;	asm	mov	ds,ax
   ;	
		mov		ds,ax
   ;	
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CAL_HuffExpand	endp
   ;	
   ;	void CAL_CarmackExpand (unsigned far *source, unsigned far *dest, unsigned length)
   ;	
	assume	cs:_TEXT
_CAL_CarmackExpand	proc	near
	push	bp
	mov	bp,sp
	sub	sp,18
	push	si
	push	di
	mov	si,word ptr [bp+12]
   ;	
   ;	{
   ;		unsigned	ch,chhigh,count,offset;
   ;		unsigned	far *copyptr, far *inptr, far *outptr;
   ;	
   ;		length/=2;
   ;	
	mov	bx,2
	mov	ax,si
	xor	dx,dx
	div	bx
	mov	si,ax
   ;	
   ;	
   ;		inptr = source;
   ;	
	mov	ax,word ptr [bp+6]
	mov	dx,word ptr [bp+4]
	mov	word ptr [bp-14],dx
	mov	word ptr [bp-12],ax
   ;	
   ;		outptr = dest;
   ;	
	mov	ax,word ptr [bp+10]
	mov	dx,word ptr [bp+8]
	mov	word ptr [bp-18],dx
	mov	word ptr [bp-16],ax
	jmp	@12@410
@12@50:
   ;	
   ;	
   ;		while (length)
   ;		{
   ;			ch = *inptr++;
   ;	
	les	bx,dword ptr [bp-14]
	mov	di,word ptr es:[bx]
	add	word ptr [bp-14],2
   ;	
   ;			chhigh = ch>>8;
   ;	
	mov	ax,di
	mov	cl,8
	shr	ax,cl
	mov	word ptr [bp-2],ax
   ;	
   ;			if (chhigh == NEARTAG)
   ;	
	cmp	word ptr [bp-2],167
	jne	short @12@218
   ;	
   ;			{
   ;				count = ch&0xff;
   ;	
	mov	ax,di
	and	ax,255
	mov	word ptr [bp-4],ax
   ;	
   ;				if (!count)
   ;	
	cmp	word ptr [bp-4],0
	jne	short @12@122
   ;	
   ;				{				// have to insert a word containing the tag byte
   ;					ch |= *((unsigned char far *)inptr)++;
   ;	
	les	bx,dword ptr [bp-14]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	or	di,ax
	inc	word ptr [bp-14]
   ;	
   ;					*outptr++ = ch;
   ;	
	les	bx,dword ptr [bp-18]
	mov	word ptr es:[bx],di
	add	word ptr [bp-18],2
   ;	
   ;					length--;
   ;	
	dec	si
   ;	
   ;				}
   ;	
	jmp	short @12@194
@12@122:
   ;	
   ;				else
   ;				{
   ;					offset = *((unsigned char far *)inptr)++;
   ;	
	les	bx,dword ptr [bp-14]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	mov	word ptr [bp-6],ax
	inc	word ptr [bp-14]
   ;	
   ;					copyptr = outptr - offset;
   ;	
	mov	ax,word ptr [bp-6]
	shl	ax,1
	mov	dx,word ptr [bp-16]
	mov	bx,word ptr [bp-18]
	sub	bx,ax
	mov	word ptr [bp-10],bx
	mov	word ptr [bp-8],dx
   ;	
   ;					length -= count;
   ;	
	sub	si,word ptr [bp-4]
	jmp	short @12@170
@12@146:
   ;	
   ;					while (count--)
   ;						*outptr++ = *copyptr++;
   ;	
	les	bx,dword ptr [bp-10]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp-18]
	mov	word ptr es:[bx],ax
	add	word ptr [bp-10],2
	add	word ptr [bp-18],2
@12@170:
	mov	ax,word ptr [bp-4]
	dec	word ptr [bp-4]
	or	ax,ax
	jne	short @12@146
@12@194:
   ;	
   ;				}
   ;			}
   ;	
	jmp	@12@410
@12@218:
   ;	
   ;			else if (chhigh == FARTAG)
   ;	
	cmp	word ptr [bp-2],168
	jne	short @12@386
   ;	
   ;			{
   ;				count = ch&0xff;
   ;	
	mov	ax,di
	and	ax,255
	mov	word ptr [bp-4],ax
   ;	
   ;				if (!count)
   ;	
	cmp	word ptr [bp-4],0
	jne	short @12@290
   ;	
   ;				{				// have to insert a word containing the tag byte
   ;					ch |= *((unsigned char far *)inptr)++;
   ;	
	les	bx,dword ptr [bp-14]
	mov	al,byte ptr es:[bx]
	mov	ah,0
	or	di,ax
	inc	word ptr [bp-14]
   ;	
   ;					*outptr++ = ch;
   ;	
	les	bx,dword ptr [bp-18]
	mov	word ptr es:[bx],di
	add	word ptr [bp-18],2
   ;	
   ;					length --;
   ;	
	dec	si
   ;	
   ;				}
   ;	
	jmp	short @12@362
@12@290:
   ;	
   ;				else
   ;				{
   ;					offset = *inptr++;
   ;	
	les	bx,dword ptr [bp-14]
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-6],ax
	add	word ptr [bp-14],2
   ;	
   ;					copyptr = dest + offset;
   ;	
	mov	ax,word ptr [bp-6]
	shl	ax,1
	mov	dx,word ptr [bp+10]
	mov	bx,word ptr [bp+8]
	add	bx,ax
	mov	word ptr [bp-10],bx
	mov	word ptr [bp-8],dx
   ;	
   ;					length -= count;
   ;	
	sub	si,word ptr [bp-4]
	jmp	short @12@338
@12@314:
   ;	
   ;					while (count--)
   ;						*outptr++ = *copyptr++;
   ;	
	les	bx,dword ptr [bp-10]
	mov	ax,word ptr es:[bx]
	les	bx,dword ptr [bp-18]
	mov	word ptr es:[bx],ax
	add	word ptr [bp-10],2
	add	word ptr [bp-18],2
@12@338:
	mov	ax,word ptr [bp-4]
	dec	word ptr [bp-4]
	or	ax,ax
	jne	short @12@314
@12@362:
   ;	
   ;				}
   ;			}
   ;	
	jmp	short @12@410
@12@386:
   ;	
   ;			else
   ;			{
   ;				*outptr++ = ch;
   ;	
	les	bx,dword ptr [bp-18]
	mov	word ptr es:[bx],di
	add	word ptr [bp-18],2
   ;	
   ;				length --;
   ;	
	dec	si
@12@410:
	or	si,si
	je	@@2
	jmp	@12@50
@@2:
   ;	
   ;			}
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CAL_CarmackExpand	endp
   ;	
   ;	long CA_RLEWCompress (unsigned huge *source, long length, unsigned huge *dest,
   ;	
	assume	cs:_TEXT
_CA_RLEWCompress	proc	near
	push	bp
	mov	bp,sp
	sub	sp,14
	push	si
	push	di
   ;	
   ;	  unsigned rlewtag)
   ;	{
   ;	  long complength;
   ;	  unsigned value,count,i;
   ;	  unsigned huge *start,huge *end;
   ;	
   ;	  start = dest;
   ;	
	mov	ax,word ptr [bp+14]
	mov	dx,word ptr [bp+12]
	mov	word ptr [bp-10],dx
	mov	word ptr [bp-8],ax
   ;	
   ;	
   ;	  end = source + (length+1)/2;
   ;	
	xor	ax,ax
	mov	dx,2
	push	ax
	push	dx
	mov	ax,word ptr [bp+10]
	mov	dx,word ptr [bp+8]
	add	dx,1
	adc	ax,0
	push	ax
	push	dx
	call	near ptr N_LDIV@
	shl	ax,1
	rcl	dx,1
	push	ax
	push	dx
	mov	dx,word ptr [bp+6]
	mov	ax,word ptr [bp+4]
	pop	cx
	pop	bx
	call	near ptr N_PADD@
	mov	word ptr [bp-14],ax
	mov	word ptr [bp-12],dx
@13@50:
   ;	
   ;	
   ;	//
   ;	// compress it
   ;	//
   ;	  do
   ;	  {
   ;		count = 1;
   ;	
	mov	si,1
   ;	
   ;		value = *source++;
   ;	
	les	bx,dword ptr [bp+4]
	mov	di,word ptr es:[bx]
	xor	cx,cx
	mov	bx,2
	mov	dx,ss
	lea	ax,word ptr [bp+4]
	call	near ptr N_PADA@
	jmp	short @13@98
@13@74:
   ;	
   ;		while (*source == value && source<end)
   ;		{
   ;		  count++;
   ;	
	inc	si
   ;	
   ;		  source++;
   ;	
	xor	cx,cx
	mov	bx,2
	mov	dx,ss
	lea	ax,word ptr [bp+4]
	call	near ptr N_PADA@
@13@98:
	les	bx,dword ptr [bp+4]
	cmp	word ptr es:[bx],di
	jne	short @13@146
	mov	cx,word ptr [bp-12]
	mov	bx,word ptr [bp-14]
	mov	dx,word ptr [bp+6]
	mov	ax,word ptr [bp+4]
	call	near ptr N_PCMP@
	jb	short @13@74
@13@146:
   ;	
   ;		}
   ;		if (count>3 || value == rlewtag)
   ;	
	cmp	si,3
	ja	short @13@194
	cmp	di,word ptr [bp+16]
	jne	short @13@218
@13@194:
   ;	
   ;		{
   ;	    //
   ;	    // send a tag / count / value string
   ;	    //
   ;	      *dest++ = rlewtag;
   ;	
	les	bx,dword ptr [bp+12]
	mov	ax,word ptr [bp+16]
	mov	word ptr es:[bx],ax
	xor	cx,cx
	mov	bx,2
	mov	dx,ss
	lea	ax,word ptr [bp+12]
	call	near ptr N_PADA@
   ;	
   ;	      *dest++ = count;
   ;	
	les	bx,dword ptr [bp+12]
	mov	word ptr es:[bx],si
	xor	cx,cx
	mov	bx,2
	mov	dx,ss
	lea	ax,word ptr [bp+12]
	call	near ptr N_PADA@
   ;	
   ;	      *dest++ = value;
   ;	
	les	bx,dword ptr [bp+12]
	mov	word ptr es:[bx],di
	xor	cx,cx
	mov	bx,2
	mov	dx,ss
	lea	ax,word ptr [bp+12]
	call	near ptr N_PADA@
   ;	
   ;	    }
   ;	
	jmp	short @13@314
@13@218:
   ;	
   ;	    else
   ;	    {
   ;	    //
   ;	    // send word without compressing
   ;	    //
   ;	      for (i=1;i<=count;i++)
   ;	
	mov	word ptr [bp-6],1
	jmp	short @13@290
@13@242:
   ;	
   ;		*dest++ = value;
   ;	
	les	bx,dword ptr [bp+12]
	mov	word ptr es:[bx],di
	xor	cx,cx
	mov	bx,2
	mov	dx,ss
	lea	ax,word ptr [bp+12]
	call	near ptr N_PADA@
	inc	word ptr [bp-6]
@13@290:
	cmp	word ptr [bp-6],si
	jbe	short @13@242
@13@314:
   ;	
   ;		}
   ;	
   ;	  } while (source<end);
   ;	
	mov	cx,word ptr [bp-12]
	mov	bx,word ptr [bp-14]
	mov	dx,word ptr [bp+6]
	mov	ax,word ptr [bp+4]
	call	near ptr N_PCMP@
	jae	@@3
	jmp	@13@50
@@3:
   ;	
   ;	
   ;	  complength = 2*(dest-start);
   ;	
	xor	ax,ax
	mov	dx,2
	push	ax
	push	dx
	mov	dx,word ptr [bp+14]
	mov	ax,word ptr [bp+12]
	mov	cx,word ptr [bp-8]
	mov	bx,word ptr [bp-10]
	call	near ptr N_PSBP@
	push	dx
	push	ax
	call	near ptr N_LDIV@
	shl	ax,1
	rcl	dx,1
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;	  return complength;
   ;	
	mov	dx,word ptr [bp-2]
	mov	ax,word ptr [bp-4]
	jmp	short @13@362
@13@362:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CA_RLEWCompress	endp
   ;	
   ;	void CA_RLEWexpand (unsigned huge *source, unsigned huge *dest,long length,
   ;	
	assume	cs:_TEXT
_CA_RLEWexpand	proc	near
	push	bp
	mov	bp,sp
	sub	sp,16
	push	si
	push	di
   ;	
   ;	  unsigned rlewtag)
   ;	{
   ;	//  unsigned value,count,i;
   ;	  unsigned huge *end;
   ;	  unsigned sourceseg,sourceoff,destseg,destoff,endseg,endoff;
   ;	
   ;	
   ;	//
   ;	// expand it
   ;	//
   ;	#if 0
   ;	  do
   ;	  {
   ;		value = *source++;
   ;		if (value != rlewtag)
   ;		//
   ;		// uncompressed
   ;		//
   ;		  *dest++=value;
   ;		else
   ;		{
   ;		//
   ;		// compressed string
   ;		//
   ;		  count = *source++;
   ;		  value = *source++;
   ;		  for (i=1;i<=count;i++)
   ;		*dest++ = value;
   ;		}
   ;	  } while (dest<end);
   ;	#endif
   ;	
   ;	  end = dest + (length)/2;
   ;	
	xor	ax,ax
	mov	dx,2
	push	ax
	push	dx
	push	word ptr [bp+14]
	push	word ptr [bp+12]
	call	near ptr N_LDIV@
	shl	ax,1
	rcl	dx,1
	push	ax
	push	dx
	mov	dx,word ptr [bp+10]
	mov	ax,word ptr [bp+8]
	pop	cx
	pop	bx
	call	near ptr N_PADD@
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;	  sourceseg = FP_SEG(source);
   ;	
	mov	ax,word ptr [bp+6]
	mov	word ptr [bp-6],ax
   ;	
   ;	  sourceoff = FP_OFF(source);
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr [bp-8],ax
   ;	
   ;	  destseg = FP_SEG(dest);
   ;	
	mov	ax,word ptr [bp+10]
	mov	word ptr [bp-10],ax
   ;	
   ;	  destoff = FP_OFF(dest);
   ;	
	mov	ax,word ptr [bp+8]
	mov	word ptr [bp-12],ax
   ;	
   ;	  endseg = FP_SEG(end);
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr [bp-14],ax
   ;	
   ;	  endoff = FP_OFF(end);
   ;	
	mov	ax,word ptr [bp-4]
	mov	word ptr [bp-16],ax
   ;	
   ;	
   ;	
   ;	//
   ;	// ax = source value
   ;	// bx = tag value
   ;	// cx = repeat counts
   ;	// dx = scratch
   ;	//
   ;	// NOTE: A repeat count that produces 0xfff0 bytes can blow this!
   ;	//
   ;	
   ;	asm	mov	bx,rlewtag
   ;	
		mov		bx,[bp+16]
   ;	
   ;	asm	mov	si,sourceoff
   ;	
		mov		si,[bp-8]
   ;	
   ;	asm	mov	di,destoff
   ;	
		mov		di,[bp-12]
   ;	
   ;	asm	mov	es,destseg
   ;	
		mov		es,[bp-10]
   ;	
   ;	asm	mov	ds,sourceseg
   ;	
		mov		ds,[bp-6]
@14@170:
   ;	
   ;	
   ;	expand:
   ;	asm	lodsw
   ;	
		lodsw	
   ;	
   ;	asm	cmp	ax,bx
   ;	
		cmp		ax,bx
   ;	
   ;	asm	je	repeat
   ;	
	je	short @14@290
   ;	
   ;	asm	stosw
   ;	
		stosw	
   ;	
   ;	asm	jmp	next
   ;	
	jmp	short @14@386
@14@290:
   ;	
   ;	
   ;	repeat:
   ;	asm	lodsw
   ;	
		lodsw	
   ;	
   ;	asm	mov	cx,ax		// repeat count
   ;	
		mov		cx,ax		
   ;	
   ;	asm	lodsw			// repeat value
   ;	
		lodsw				
   ;	
   ;	asm	rep stosw
   ;	
		rep stosw	
@14@386:
   ;	
   ;	
   ;	next:
   ;	
   ;	asm	cmp	si,0x10		// normalize ds:si
   ;	
		cmp		si,010H		
   ;	
   ;	asm  	jb	sinorm
   ;	
	jb	short @14@650
   ;	
   ;	asm	mov	ax,si
   ;	
		mov		ax,si
   ;	
   ;	asm	shr	ax,1
   ;	
		shr		ax,1
   ;	
   ;	asm	shr	ax,1
   ;	
		shr		ax,1
   ;	
   ;	asm	shr	ax,1
   ;	
		shr		ax,1
   ;	
   ;	asm	shr	ax,1
   ;	
		shr		ax,1
   ;	
   ;	asm	mov	dx,ds
   ;	
		mov		dx,ds
   ;	
   ;	asm	add	dx,ax
   ;	
		add		dx,ax
   ;	
   ;	asm	mov	ds,dx
   ;	
		mov		ds,dx
   ;	
   ;	asm	and	si,0xf
   ;	
		and		si,0fH
@14@650:
   ;	
   ;	sinorm:
   ;	asm	cmp	di,0x10		// normalize es:di
   ;	
		cmp		di,010H		
   ;	
   ;	asm  	jb	dinorm
   ;	
	jb	short @14@914
   ;	
   ;	asm	mov	ax,di
   ;	
		mov		ax,di
   ;	
   ;	asm	shr	ax,1
   ;	
		shr		ax,1
   ;	
   ;	asm	shr	ax,1
   ;	
		shr		ax,1
   ;	
   ;	asm	shr	ax,1
   ;	
		shr		ax,1
   ;	
   ;	asm	shr	ax,1
   ;	
		shr		ax,1
   ;	
   ;	asm	mov	dx,es
   ;	
		mov		dx,es
   ;	
   ;	asm	add	dx,ax
   ;	
		add		dx,ax
   ;	
   ;	asm	mov	es,dx
   ;	
		mov		es,dx
   ;	
   ;	asm	and	di,0xf
   ;	
		and		di,0fH
@14@914:
   ;	
   ;	dinorm:
   ;	
   ;	asm	cmp     di,ss:endoff
   ;	
		cmp	     di,ss:[bp-16]
   ;	
   ;	asm	jne	expand
   ;	
	jne	short @14@170
   ;	
   ;	asm	mov	ax,es
   ;	
		mov		ax,es
   ;	
   ;	asm	cmp	ax,ss:endseg
   ;	
		cmp		ax,ss:[bp-14]
   ;	
   ;	asm	jb	expand
   ;	
	jb	short @14@170
   ;	
   ;	
   ;	asm	mov	ax,ss
   ;	
		mov		ax,ss
   ;	
   ;	asm	mov	ds,ax
   ;	
		mov		ds,ax
   ;	
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CA_RLEWexpand	endp
   ;	
   ;	void CAL_SetupGrFile (void)
   ;	
	assume	cs:_TEXT
_CAL_SetupGrFile	proc	near
	push	bp
	mov	bp,sp
	sub	sp,16
	push	si
   ;	
   ;	{
   ;		char fname[13];
   ;		int handle;
   ;		memptr compseg;
   ;	
   ;	#ifdef GRHEADERLINKED
   ;	
   ;		grhuffman = (huffnode *)&EGAdict;
   ;		grstarts = (long _seg *)FP_SEG(&EGAhead);
   ;	
   ;		CAL_OptimizeNodes (grhuffman);
   ;	
   ;	#else
   ;	
   ;	//
   ;	// load ???dict.ext (huffman dictionary for graphics files)
   ;	//
   ;	
   ;		strcpy(fname,gdictname);
   ;	
	mov	ax,offset DGROUP:_gdictname
	push	ax
	lea	ax,word ptr [bp-16]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;		strcat(fname,extension);
   ;	
	mov	ax,offset DGROUP:_extension
	push	ax
	lea	ax,word ptr [bp-16]
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;	
   ;		if ((handle = open(fname,
   ;	
   ;	
   ;			 O_RDONLY | O_BINARY, S_IREAD)) == -1)
   ;	
	mov	ax,256
	push	ax
	mov	ax,32769
	push	ax
	lea	ax,word ptr [bp-16]
	push	ax
	call	near ptr _open
	add	sp,6
	mov	si,ax
	cmp	ax,65535
	jne	short @15@74
   ;	
   ;			CA_CannotOpen(fname);
   ;	
	lea	ax,word ptr [bp-16]
	push	ax
	call	near ptr _CA_CannotOpen
	pop	cx
@15@74:
   ;	
   ;	
   ;		read(handle, &grhuffman, sizeof(grhuffman));
   ;	
	mov	ax,1020
	push	ax
	mov	ax,offset DGROUP:_grhuffman
	push	ax
	push	si
	call	near ptr _read
	add	sp,6
   ;	
   ;		close(handle);
   ;	
	push	si
	call	near ptr _close
	pop	cx
   ;	
   ;		CAL_OptimizeNodes (grhuffman);
   ;	
	mov	ax,offset DGROUP:_grhuffman
	push	ax
	call	near ptr _CAL_OptimizeNodes
	pop	cx
   ;	
   ;	//
   ;	// load the data offsets from ???head.ext
   ;	//
   ;		MM_GetPtr (&(memptr)grstarts,(NUMCHUNKS+1)*FILEPOSSIZE);
   ;	
	xor	ax,ax
	mov	dx,450
	push	ax
	push	dx
	mov	ax,offset DGROUP:_grstarts
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;	
   ;		strcpy(fname,gheadname);
   ;	
	mov	ax,offset DGROUP:_gheadname
	push	ax
	lea	ax,word ptr [bp-16]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;		strcat(fname,extension);
   ;	
	mov	ax,offset DGROUP:_extension
	push	ax
	lea	ax,word ptr [bp-16]
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;	
   ;		if ((handle = open(fname,
   ;	
   ;	
   ;			 O_RDONLY | O_BINARY, S_IREAD)) == -1)
   ;	
	mov	ax,256
	push	ax
	mov	ax,32769
	push	ax
	lea	ax,word ptr [bp-16]
	push	ax
	call	near ptr _open
	add	sp,6
	mov	si,ax
	cmp	ax,65535
	jne	short @15@122
   ;	
   ;			CA_CannotOpen(fname);
   ;	
	lea	ax,word ptr [bp-16]
	push	ax
	call	near ptr _CA_CannotOpen
	pop	cx
@15@122:
   ;	
   ;	
   ;		CA_FarRead(handle, (memptr)grstarts, (NUMCHUNKS+1)*FILEPOSSIZE);
   ;	
	xor	ax,ax
	mov	dx,450
	push	ax
	push	dx
	push	word ptr DGROUP:_grstarts
	xor	ax,ax
	push	ax
	push	si
	call	near ptr _CA_FarRead
	add	sp,10
   ;	
   ;	
   ;		close(handle);
   ;	
	push	si
	call	near ptr _close
	pop	cx
   ;	
   ;	
   ;	
   ;	#endif
   ;	
   ;	//
   ;	// Open the graphics file, leaving it open until the game is finished
   ;	//
   ;		strcpy(fname,gfilename);
   ;	
	mov	ax,offset DGROUP:_gfilename
	push	ax
	lea	ax,word ptr [bp-16]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;		strcat(fname,extension);
   ;	
	mov	ax,offset DGROUP:_extension
	push	ax
	lea	ax,word ptr [bp-16]
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;	
   ;		grhandle = open(fname, O_RDONLY | O_BINARY);
   ;	
	mov	ax,32769
	push	ax
	lea	ax,word ptr [bp-16]
	push	ax
	call	near ptr _open
	pop	cx
	pop	cx
	mov	word ptr DGROUP:_grhandle,ax
   ;	
   ;		if (grhandle == -1)
   ;	
	cmp	word ptr DGROUP:_grhandle,65535
	jne	short @15@170
   ;	
   ;			CA_CannotOpen(fname);
   ;	
	lea	ax,word ptr [bp-16]
	push	ax
	call	near ptr _CA_CannotOpen
	pop	cx
@15@170:
   ;	
   ;	
   ;	
   ;	//
   ;	// load the pic and sprite headers into the arrays in the data segment
   ;	//
   ;		MM_GetPtr(&(memptr)pictable,NUMPICS*sizeof(pictabletype));
   ;	
	xor	ax,ax
	mov	dx,528
	push	ax
	push	dx
	mov	ax,offset DGROUP:_pictable
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;		CAL_GetGrChunkLength(STRUCTPIC);		// position file pointer
   ;	
	xor	ax,ax
	push	ax
	call	near ptr _CAL_GetGrChunkLength
	pop	cx
   ;	
   ;		MM_GetPtr(&compseg,chunkcomplen);
   ;	
	push	word ptr DGROUP:_chunkcomplen+2
	push	word ptr DGROUP:_chunkcomplen
	lea	ax,word ptr [bp-2]
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;		CA_FarRead (grhandle,compseg,chunkcomplen);
   ;	
	push	word ptr DGROUP:_chunkcomplen+2
	push	word ptr DGROUP:_chunkcomplen
	push	word ptr [bp-2]
	xor	ax,ax
	push	ax
	push	word ptr DGROUP:_grhandle
	call	near ptr _CA_FarRead
	add	sp,10
   ;	
   ;		CAL_HuffExpand (compseg, (byte huge *)pictable,NUMPICS*sizeof(pictabletype),grhuffman,false);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_grhuffman
	push	ax
	xor	ax,ax
	mov	dx,528
	push	ax
	push	dx
	push	word ptr DGROUP:_pictable
	xor	ax,ax
	push	ax
	push	word ptr [bp-2]
	xor	ax,ax
	push	ax
	call	near ptr _CAL_HuffExpand
	add	sp,16
   ;	
   ;		MM_FreePtr(&compseg);
   ;	
	lea	ax,word ptr [bp-2]
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CAL_SetupGrFile	endp
   ;	
   ;	void CAL_SetupMapFile (void)
   ;	
	assume	cs:_TEXT
_CAL_SetupMapFile	proc	near
	push	bp
	mov	bp,sp
	sub	sp,22
	push	si
	push	di
   ;	
   ;	{
   ;		int	i;
   ;		int handle;
   ;		long length,pos;
   ;		char fname[13];
   ;	
   ;	//
   ;	// load maphead.ext (offsets and tileinfo for map file)
   ;	//
   ;	#ifndef MAPHEADERLINKED
   ;		strcpy(fname,mheadname);
   ;	
	mov	ax,offset DGROUP:_mheadname
	push	ax
	lea	ax,word ptr [bp-22]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;		strcat(fname,extension);
   ;	
	mov	ax,offset DGROUP:_extension
	push	ax
	lea	ax,word ptr [bp-22]
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;	
   ;		if ((handle = open(fname,
   ;	
   ;	
   ;			 O_RDONLY | O_BINARY, S_IREAD)) == -1)
   ;	
	mov	ax,256
	push	ax
	mov	ax,32769
	push	ax
	lea	ax,word ptr [bp-22]
	push	ax
	call	near ptr _open
	add	sp,6
	mov	di,ax
	cmp	ax,65535
	jne	short @16@74
   ;	
   ;			CA_CannotOpen(fname);
   ;	
	lea	ax,word ptr [bp-22]
	push	ax
	call	near ptr _CA_CannotOpen
	pop	cx
@16@74:
   ;	
   ;	
   ;		length = filelength(handle);
   ;	
	push	di
	call	near ptr _filelength
	pop	cx
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;		MM_GetPtr (&(memptr)tinf,length);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	mov	ax,offset DGROUP:_tinf
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;		CA_FarRead(handle, tinf, length);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_tinf
	xor	ax,ax
	push	ax
	push	di
	call	near ptr _CA_FarRead
	add	sp,10
   ;	
   ;		close(handle);
   ;	
	push	di
	call	near ptr _close
	pop	cx
   ;	
   ;	#else
   ;	
   ;		tinf = (byte _seg *)FP_SEG(&maphead);
   ;	
   ;	#endif
   ;	
   ;	//
   ;	// open the data file
   ;	//
   ;	#ifdef CARMACIZED
   ;		strcpy(fname,"GAMEMAPS.");
   ;	
	mov	ax,offset DGROUP:s@+105
	push	ax
	lea	ax,word ptr [bp-22]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;		strcat(fname,extension);
   ;	
	mov	ax,offset DGROUP:_extension
	push	ax
	lea	ax,word ptr [bp-22]
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;	
   ;		if ((maphandle = open(fname,
   ;	
   ;	
   ;			 O_RDONLY | O_BINARY, S_IREAD)) == -1)
   ;	
	mov	ax,256
	push	ax
	mov	ax,32769
	push	ax
	lea	ax,word ptr [bp-22]
	push	ax
	call	near ptr _open
	add	sp,6
	mov	word ptr DGROUP:_maphandle,ax
	cmp	ax,65535
	jne	short @16@122
   ;	
   ;			CA_CannotOpen(fname);
   ;	
	lea	ax,word ptr [bp-22]
	push	ax
	call	near ptr _CA_CannotOpen
	pop	cx
@16@122:
   ;	
   ;	#else
   ;		strcpy(fname,mfilename);
   ;		strcat(fname,extension);
   ;	
   ;		if ((maphandle = open(fname,
   ;			 O_RDONLY | O_BINARY, S_IREAD)) == -1)
   ;			CA_CannotOpen(fname);
   ;	#endif
   ;	
   ;	//
   ;	// load all map header
   ;	//
   ;		for (i=0;i<NUMMAPS;i++)
   ;	
	xor	si,si
	jmp	@16@290
@16@146:
   ;	
   ;		{
   ;			pos = ((mapfiletype	_seg *)tinf)->headeroffsets[i];
   ;	
	mov	es,word ptr DGROUP:_tinf
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	ax,word ptr es:[bx+4]
	mov	dx,word ptr es:[bx+2]
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;			if (pos<0)						// $FFFFFFFF start is a sparse map
   ;	
	cmp	word ptr [bp-6],0
	jg	short @16@242
	jl	short @16@218
	cmp	word ptr [bp-8],0
	jae	short @16@242
@16@218:
   ;	
   ;				continue;
   ;	
	jmp	short @16@266
@16@242:
   ;	
   ;	
   ;			MM_GetPtr(&(memptr)mapheaderseg[i],sizeof(maptype));
   ;	
	xor	ax,ax
	mov	dx,38
	push	ax
	push	dx
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_mapheaderseg
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;			MM_SetLock(&(memptr)mapheaderseg[i],true);
   ;	
	mov	ax,1
	push	ax
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_mapheaderseg
	push	ax
	call	near ptr _MM_SetLock
	pop	cx
	pop	cx
   ;	
   ;			lseek(maphandle,pos,SEEK_SET);
   ;	
	xor	ax,ax
	push	ax
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	push	word ptr DGROUP:_maphandle
	call	near ptr _lseek
	add	sp,8
   ;	
   ;			CA_FarRead (maphandle,(memptr)mapheaderseg[i],sizeof(maptype));
   ;	
	xor	ax,ax
	mov	dx,38
	push	ax
	push	dx
	mov	bx,si
	shl	bx,1
	push	word ptr DGROUP:_mapheaderseg[bx]
	xor	ax,ax
	push	ax
	push	word ptr DGROUP:_maphandle
	call	near ptr _CA_FarRead
	add	sp,10
@16@266:
	inc	si
@16@290:
	cmp	si,60
	jge	@@4
	jmp	@16@146
@@4:
   ;	
   ;		}
   ;	
   ;	//
   ;	// allocate space for 3 64*64 planes
   ;	//
   ;		for (i=0;i<MAPPLANES;i++)
   ;	
	xor	si,si
	jmp	short @16@386
@16@338:
   ;	
   ;		{
   ;			MM_GetPtr (&(memptr)mapsegs[i],64*64*2);
   ;	
	xor	ax,ax
	mov	dx,8192
	push	ax
	push	dx
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_mapsegs
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;			MM_SetLock (&(memptr)mapsegs[i],true);
   ;	
	mov	ax,1
	push	ax
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_mapsegs
	push	ax
	call	near ptr _MM_SetLock
	pop	cx
	pop	cx
	inc	si
@16@386:
	cmp	si,2
	jl	short @16@338
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CAL_SetupMapFile	endp
   ;	
   ;	void CAL_SetupAudioFile (void)
   ;	
	assume	cs:_TEXT
_CAL_SetupAudioFile	proc	near
	push	bp
	mov	bp,sp
	sub	sp,18
	push	si
   ;	
   ;	{
   ;		int handle;
   ;		long length;
   ;		char fname[13];
   ;	
   ;	//
   ;	// load maphead.ext (offsets and tileinfo for map file)
   ;	//
   ;	#ifndef AUDIOHEADERLINKED
   ;		strcpy(fname,aheadname);
   ;	
	mov	ax,offset DGROUP:_aheadname
	push	ax
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;		strcat(fname,extension);
   ;	
	mov	ax,offset DGROUP:_extension
	push	ax
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;	
   ;		if ((handle = open(fname,
   ;	
   ;	
   ;			 O_RDONLY | O_BINARY, S_IREAD)) == -1)
   ;	
	mov	ax,256
	push	ax
	mov	ax,32769
	push	ax
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _open
	add	sp,6
	mov	si,ax
	cmp	ax,65535
	jne	short @17@74
   ;	
   ;			CA_CannotOpen(fname);
   ;	
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _CA_CannotOpen
	pop	cx
@17@74:
   ;	
   ;	
   ;		length = filelength(handle);
   ;	
	push	si
	call	near ptr _filelength
	pop	cx
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;		MM_GetPtr (&(memptr)audiostarts,length);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	mov	ax,offset DGROUP:_audiostarts
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;		CA_FarRead(handle, (byte far *)audiostarts, length);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_audiostarts
	xor	ax,ax
	push	ax
	push	si
	call	near ptr _CA_FarRead
	add	sp,10
   ;	
   ;		close(handle);
   ;	
	push	si
	call	near ptr _close
	pop	cx
   ;	
   ;	#else
   ;		audiohuffman = (huffnode *)&audiodict;
   ;		CAL_OptimizeNodes (audiohuffman);
   ;		audiostarts = (long _seg *)FP_SEG(&audiohead);
   ;	#endif
   ;	
   ;	//
   ;	// open the data file
   ;	//
   ;	#ifndef AUDIOHEADERLINKED
   ;		strcpy(fname,afilename);
   ;	
	mov	ax,offset DGROUP:_afilename
	push	ax
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;		strcat(fname,extension);
   ;	
	mov	ax,offset DGROUP:_extension
	push	ax
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;	
   ;		if ((audiohandle = open(fname,
   ;	
   ;	
   ;			 O_RDONLY | O_BINARY, S_IREAD)) == -1)
   ;	
	mov	ax,256
	push	ax
	mov	ax,32769
	push	ax
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _open
	add	sp,6
	mov	word ptr DGROUP:_audiohandle,ax
	cmp	ax,65535
	jne	short @17@122
   ;	
   ;			CA_CannotOpen(fname);
   ;	
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _CA_CannotOpen
	pop	cx
@17@122:
   ;	
   ;	#else
   ;		if ((audiohandle = open("AUDIO."EXTENSION,
   ;			 O_RDONLY | O_BINARY, S_IREAD)) == -1)
   ;			Quit ("Can't open AUDIO."EXTENSION"!");
   ;	#endif
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CAL_SetupAudioFile	endp
   ;	
   ;	void CA_Startup (void)
   ;	
	assume	cs:_TEXT
_CA_Startup	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	#ifdef PROFILE
   ;		unlink ("PROFILE.TXT");
   ;		profilehandle = open("PROFILE.TXT", O_CREAT | O_WRONLY | O_TEXT);
   ;	#endif
   ;	
   ;		CAL_SetupMapFile ();
   ;	
	call	near ptr _CAL_SetupMapFile
   ;	
   ;		CAL_SetupGrFile ();
   ;	
	call	near ptr _CAL_SetupGrFile
   ;	
   ;		CAL_SetupAudioFile ();
   ;	
	call	near ptr _CAL_SetupAudioFile
   ;	
   ;	
   ;		mapon = -1;
   ;	
	mov	word ptr DGROUP:_mapon,65535
   ;	
   ;		ca_levelbit = 1;
   ;	
	mov	byte ptr DGROUP:_ca_levelbit,1
   ;	
   ;		ca_levelnum = 0;
   ;	
	mov	byte ptr DGROUP:_ca_levelnum,0
   ;	
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_CA_Startup	endp
   ;	
   ;	void CA_Shutdown (void)
   ;	
	assume	cs:_TEXT
_CA_Shutdown	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;	#ifdef PROFILE
   ;		close (profilehandle);
   ;	#endif
   ;	
   ;		close (maphandle);
   ;	
	push	word ptr DGROUP:_maphandle
	call	near ptr _close
	pop	cx
   ;	
   ;		close (grhandle);
   ;	
	push	word ptr DGROUP:_grhandle
	call	near ptr _close
	pop	cx
   ;	
   ;		close (audiohandle);
   ;	
	push	word ptr DGROUP:_audiohandle
	call	near ptr _close
	pop	cx
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_CA_Shutdown	endp
   ;	
   ;	void CA_CacheAudioChunk (int chunk)
   ;	
	assume	cs:_TEXT
_CA_CacheAudioChunk	proc	near
	push	bp
	mov	bp,sp
	sub	sp,8
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		long	pos,compressed;
   ;	#ifdef AUDIOHEADERLINKED
   ;		long	expanded;
   ;		memptr	bigbufferseg;
   ;		byte	far *source;
   ;	#endif
   ;	
   ;		if (audiosegs[chunk])
   ;	
	mov	bx,si
	shl	bx,1
	cmp	word ptr DGROUP:_audiosegs[bx],0
	je	short @20@74
   ;	
   ;		{
   ;			MM_SetPurge (&(memptr)audiosegs[chunk],0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_audiosegs
	push	ax
	call	near ptr _MM_SetPurge
	pop	cx
	pop	cx
   ;	
   ;			return;							// allready in memory
   ;	
	jmp	@20@146
@20@74:
   ;	
   ;		}
   ;	
   ;	//
   ;	// load the chunk into a buffer, either the miscbuffer if it fits, or allocate
   ;	// a larger buffer
   ;	//
   ;		pos = audiostarts[chunk];
   ;	
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	es,word ptr DGROUP:_audiostarts
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;		compressed = audiostarts[chunk+1]-pos;
   ;	
	mov	bx,si
	inc	bx
	shl	bx,1
	shl	bx,1
	mov	es,word ptr DGROUP:_audiostarts
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	sub	dx,word ptr [bp-4]
	sbb	ax,word ptr [bp-2]
	mov	word ptr [bp-8],dx
	mov	word ptr [bp-6],ax
   ;	
   ;	
   ;		lseek(audiohandle,pos,SEEK_SET);
   ;	
	xor	ax,ax
	push	ax
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_audiohandle
	call	near ptr _lseek
	add	sp,8
   ;	
   ;	
   ;	#ifndef AUDIOHEADERLINKED
   ;	
   ;		MM_GetPtr (&(memptr)audiosegs[chunk],compressed);
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_audiosegs
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;		if (mmerror)
   ;	
	cmp	word ptr DGROUP:_mmerror,0
	je	short @20@122
   ;	
   ;			return;
   ;	
	jmp	short @20@146
@20@122:
   ;	
   ;	
   ;		CA_FarRead(audiohandle,audiosegs[chunk],compressed);
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	mov	bx,si
	shl	bx,1
	push	word ptr DGROUP:_audiosegs[bx]
	xor	ax,ax
	push	ax
	push	word ptr DGROUP:_audiohandle
	call	near ptr _CA_FarRead
	add	sp,10
@20@146:
   ;	
   ;	
   ;	#else
   ;	
   ;		if (compressed<=BUFFERSIZE)
   ;		{
   ;			CA_FarRead(audiohandle,bufferseg,compressed);
   ;			source = bufferseg;
   ;		}
   ;		else
   ;		{
   ;			MM_GetPtr(&bigbufferseg,compressed);
   ;			if (mmerror)
   ;				return;
   ;			MM_SetLock (&bigbufferseg,true);
   ;			CA_FarRead(audiohandle,bigbufferseg,compressed);
   ;			source = bigbufferseg;
   ;		}
   ;	
   ;		expanded = *(long far *)source;
   ;		source += 4;			// skip over length
   ;		MM_GetPtr (&(memptr)audiosegs[chunk],expanded);
   ;		if (mmerror)
   ;			goto done;
   ;		CAL_HuffExpand (source,audiosegs[chunk],expanded,audiohuffman,false);
   ;	
   ;	done:
   ;		if (compressed>BUFFERSIZE)
   ;			MM_FreePtr(&bigbufferseg);
   ;	#endif
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CA_CacheAudioChunk	endp
   ;	
   ;	void CA_LoadAllSounds (void)
   ;	
	assume	cs:_TEXT
_CA_LoadAllSounds	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
   ;	
   ;	{
   ;		unsigned	start,i;
   ;	
   ;		switch (oldsoundmode)
   ;	
	mov	ax,word ptr DGROUP:_oldsoundmode
	or	ax,ax
	je	short @21@146
	cmp	ax,1
	je	short @21@170
	cmp	ax,2
	je	short @21@194
	jmp	short @21@218
@21@146:
   ;	
   ;		{
   ;		case sdm_Off:
   ;			goto cachein;
   ;	
	jmp	short @21@338
@21@170:
   ;	
   ;		case sdm_PC:
   ;			start = STARTPCSOUNDS;
   ;	
	xor	si,si
   ;	
   ;			break;
   ;	
	jmp	short @21@218
@21@194:
   ;	
   ;		case sdm_AdLib:
   ;			start = STARTADLIBSOUNDS;
   ;	
	mov	si,87
   ;	
   ;			break;
   ;	
	jmp	short @21@218
@21@218:
   ;	
   ;		}
   ;	
   ;		for (i=0;i<NUMSOUNDS;i++,start++)
   ;	
	xor	di,di
	jmp	short @21@314
@21@242:
   ;	
   ;			if (audiosegs[start])
   ;	
	mov	bx,si
	shl	bx,1
	cmp	word ptr DGROUP:_audiosegs[bx],0
	je	short @21@290
   ;	
   ;				MM_SetPurge (&(memptr)audiosegs[start],3);		// make purgable
   ;	
	mov	ax,3
	push	ax
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_audiosegs
	push	ax
	call	near ptr _MM_SetPurge
	pop	cx
	pop	cx
@21@290:
	inc	di
	inc	si
@21@314:
	cmp	di,87
	jb	short @21@242
@21@338:
   ;	
   ;	
   ;	cachein:
   ;	
   ;		switch (SoundMode)
   ;	
	mov	ax,word ptr DGROUP:_SoundMode
	or	ax,ax
	je	short @21@458
	cmp	ax,1
	je	short @21@482
	cmp	ax,2
	je	short @21@506
	jmp	short @21@530
@21@458:
   ;	
   ;		{
   ;		case sdm_Off:
   ;			return;
   ;	
	jmp	short @21@650
@21@482:
   ;	
   ;		case sdm_PC:
   ;			start = STARTPCSOUNDS;
   ;	
	xor	si,si
   ;	
   ;			break;
   ;	
	jmp	short @21@530
@21@506:
   ;	
   ;		case sdm_AdLib:
   ;			start = STARTADLIBSOUNDS;
   ;	
	mov	si,87
   ;	
   ;			break;
   ;	
	jmp	short @21@530
@21@530:
   ;	
   ;		}
   ;	
   ;		for (i=0;i<NUMSOUNDS;i++,start++)
   ;	
	xor	di,di
	jmp	short @21@602
@21@554:
   ;	
   ;			CA_CacheAudioChunk (start);
   ;	
	push	si
	call	near ptr _CA_CacheAudioChunk
	pop	cx
	inc	di
	inc	si
@21@602:
	cmp	di,87
	jb	short @21@554
   ;	
   ;	
   ;		oldsoundmode = SoundMode;
   ;	
	mov	ax,word ptr DGROUP:_SoundMode
	mov	word ptr DGROUP:_oldsoundmode,ax
@21@650:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
_CA_LoadAllSounds	endp
   ;	
   ;	void CAL_ExpandGrChunk (int chunk, byte far *source)
   ;	
	assume	cs:_TEXT
_CAL_ExpandGrChunk	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		long	expanded;
   ;	
   ;	
   ;		if (chunk >= STARTTILE8 && chunk < STARTEXTERNS)
   ;	
	cmp	si,135
	jl	short @22@362
	cmp	si,136
	jge	short @22@362
   ;	
   ;		{
   ;		//
   ;		// expanded sizes of tile8/16/32 are implicit
   ;		//
   ;	
   ;	#define BLOCK		64
   ;	#define MASKBLOCK	128
   ;	
   ;			if (chunk<STARTTILE8M)			// tile 8s are all in one chunk!
   ;	
	cmp	si,136
	jge	short @22@122
   ;	
   ;				expanded = BLOCK*NUMTILE8;
   ;	
	mov	word ptr [bp-4],4608
	mov	word ptr [bp-2],0
	jmp	short @22@338
@22@122:
   ;	
   ;			else if (chunk<STARTTILE16)
   ;	
	cmp	si,136
	jge	short @22@170
   ;	
   ;				expanded = MASKBLOCK*NUMTILE8M;
   ;	
	mov	word ptr [bp-4],0
	mov	word ptr [bp-2],0
	jmp	short @22@338
@22@170:
   ;	
   ;			else if (chunk<STARTTILE16M)	// all other tiles are one/chunk
   ;	
	cmp	si,136
	jge	short @22@218
   ;	
   ;				expanded = BLOCK*4;
   ;	
	mov	word ptr [bp-4],256
	mov	word ptr [bp-2],0
	jmp	short @22@338
@22@218:
   ;	
   ;			else if (chunk<STARTTILE32)
   ;	
	cmp	si,136
	jge	short @22@266
   ;	
   ;				expanded = MASKBLOCK*4;
   ;	
	mov	word ptr [bp-4],512
	mov	word ptr [bp-2],0
	jmp	short @22@338
@22@266:
   ;	
   ;			else if (chunk<STARTTILE32M)
   ;	
	cmp	si,136
	jge	short @22@314
   ;	
   ;				expanded = BLOCK*16;
   ;	
	mov	word ptr [bp-4],1024
	mov	word ptr [bp-2],0
	jmp	short @22@338
@22@314:
   ;	
   ;			else
   ;				expanded = MASKBLOCK*16;
   ;	
	mov	word ptr [bp-4],2048
	mov	word ptr [bp-2],0
@22@338:
   ;	
   ;		}
   ;	
	jmp	short @22@386
@22@362:
   ;	
   ;		else
   ;		{
   ;		//
   ;		// everything else has an explicit size longword
   ;		//
   ;			expanded = *(long far *)source;
   ;	
	les	bx,dword ptr [bp+6]
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;			source += 4;			// skip over length
   ;	
	add	word ptr [bp+6],4
@22@386:
   ;	
   ;		}
   ;	
   ;	//
   ;	// allocate final space, decompress it, and free bigbuffer
   ;	// Sprites need to have shifts made and various other junk
   ;	//
   ;		MM_GetPtr (&grsegs[chunk],expanded);
   ;	
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_grsegs
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;		if (mmerror)
   ;	
	cmp	word ptr DGROUP:_mmerror,0
	je	short @22@434
   ;	
   ;			return;
   ;	
	jmp	short @22@458
@22@434:
   ;	
   ;		CAL_HuffExpand (source,grsegs[chunk],expanded,grhuffman,false);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,offset DGROUP:_grhuffman
	push	ax
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	mov	bx,si
	shl	bx,1
	push	word ptr DGROUP:_grsegs[bx]
	xor	ax,ax
	push	ax
	push	word ptr [bp+8]
	push	word ptr [bp+6]
	call	near ptr _CAL_HuffExpand
	add	sp,16
@22@458:
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CAL_ExpandGrChunk	endp
   ;	
   ;	void CA_CacheGrChunk (int chunk)
   ;	
	assume	cs:_TEXT
_CA_CacheGrChunk	proc	near
	push	bp
	mov	bp,sp
	sub	sp,14
	push	si
	push	di
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		long	pos,compressed;
   ;		memptr	bigbufferseg;
   ;		byte	far *source;
   ;		int		next;
   ;	
   ;		grneeded[chunk] |= ca_levelbit;		// make sure it doesn't get removed
   ;	
	mov	ax,seg _grneeded
	mov	dl,byte ptr DGROUP:_ca_levelbit
	mov	es,ax
	or	byte ptr es:_grneeded[si],dl
   ;	
   ;		if (grsegs[chunk])
   ;	
	mov	bx,si
	shl	bx,1
	cmp	word ptr DGROUP:_grsegs[bx],0
	je	short @23@74
   ;	
   ;		{
   ;			MM_SetPurge (&grsegs[chunk],0);
   ;	
	xor	ax,ax
	push	ax
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_grsegs
	push	ax
	call	near ptr _MM_SetPurge
	pop	cx
	pop	cx
   ;	
   ;			return;							// allready in memory
   ;	
	jmp	@23@482
@23@74:
   ;	
   ;		}
   ;	
   ;	//
   ;	// load the chunk into a buffer, either the miscbuffer if it fits, or allocate
   ;	// a larger buffer
   ;	//
   ;		pos = GRFILEPOS(chunk);
   ;	
	push	si
	call	near ptr _GRFILEPOS
	pop	cx
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;		if (pos<0)							// $FFFFFFFF start is a sparse tile
   ;	
	cmp	word ptr [bp-2],0
	jg	short @23@170
	jl	short @23@146
	cmp	word ptr [bp-4],0
	jae	short @23@170
@23@146:
   ;	
   ;		  return;
   ;	
	jmp	@23@482
@23@170:
   ;	
   ;	
   ;		next = chunk +1;
   ;	
	mov	ax,si
	inc	ax
	mov	di,ax
	jmp	short @23@218
@23@194:
   ;	
   ;		while (GRFILEPOS(next) == -1)		// skip past any sparse tiles
   ;			next++;
   ;	
	inc	di
@23@218:
	push	di
	call	near ptr _GRFILEPOS
	pop	cx
	cmp	dx,65535
	jne	short @23@266
	cmp	ax,65535
	je	short @23@194
@23@266:
   ;	
   ;	
   ;		compressed = GRFILEPOS(next)-pos;
   ;	
	push	di
	call	near ptr _GRFILEPOS
	pop	cx
	sub	ax,word ptr [bp-4]
	sbb	dx,word ptr [bp-2]
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],dx
   ;	
   ;	
   ;		lseek(grhandle,pos,SEEK_SET);
   ;	
	xor	ax,ax
	push	ax
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_grhandle
	call	near ptr _lseek
	add	sp,8
   ;	
   ;	
   ;		if (compressed<=BUFFERSIZE)
   ;	
	cmp	word ptr [bp-6],0
	jg	short @23@362
	jne	short @23@338
	cmp	word ptr [bp-8],4096
	ja	short @23@362
@23@338:
   ;	
   ;		{
   ;			CA_FarRead(grhandle,bufferseg,compressed);
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	push	word ptr DGROUP:_bufferseg
	xor	ax,ax
	push	ax
	push	word ptr DGROUP:_grhandle
	call	near ptr _CA_FarRead
	add	sp,10
   ;	
   ;			source = bufferseg;
   ;	
	mov	ax,word ptr DGROUP:_bufferseg
	mov	word ptr [bp-14],0
	mov	word ptr [bp-12],ax
   ;	
   ;		}
   ;	
	jmp	short @23@386
@23@362:
   ;	
   ;		else
   ;		{
   ;			MM_GetPtr(&bigbufferseg,compressed);
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	lea	ax,word ptr [bp-10]
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;			MM_SetLock (&bigbufferseg,true);
   ;	
	mov	ax,1
	push	ax
	lea	ax,word ptr [bp-10]
	push	ax
	call	near ptr _MM_SetLock
	pop	cx
	pop	cx
   ;	
   ;			CA_FarRead(grhandle,bigbufferseg,compressed);
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	push	word ptr [bp-10]
	xor	ax,ax
	push	ax
	push	word ptr DGROUP:_grhandle
	call	near ptr _CA_FarRead
	add	sp,10
   ;	
   ;			source = bigbufferseg;
   ;	
	mov	ax,word ptr [bp-10]
	mov	word ptr [bp-14],0
	mov	word ptr [bp-12],ax
@23@386:
   ;	
   ;		}
   ;	
   ;		CAL_ExpandGrChunk (chunk,source);
   ;	
	push	word ptr [bp-12]
	push	word ptr [bp-14]
	push	si
	call	near ptr _CAL_ExpandGrChunk
	add	sp,6
   ;	
   ;	
   ;		if (compressed>BUFFERSIZE)
   ;	
	cmp	word ptr [bp-6],0
	jl	short @23@482
	jg	short @23@458
	cmp	word ptr [bp-8],4096
	jbe	short @23@482
@23@458:
   ;	
   ;			MM_FreePtr(&bigbufferseg);
   ;	
	lea	ax,word ptr [bp-10]
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
@23@482:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CA_CacheGrChunk	endp
   ;	
   ;	void CA_CacheScreen (int chunk)
   ;	
	assume	cs:_TEXT
_CA_CacheScreen	proc	near
	push	bp
	mov	bp,sp
	sub	sp,18
	push	si
   ;	
   ;	{
   ;		long	pos,compressed,expanded;
   ;		memptr	bigbufferseg;
   ;		byte	far *source;
   ;		int		next;
   ;	
   ;	//
   ;	// load the chunk into a buffer
   ;	//
   ;		pos = GRFILEPOS(chunk);
   ;	
	push	word ptr [bp+4]
	call	near ptr _GRFILEPOS
	pop	cx
	mov	word ptr [bp-4],ax
	mov	word ptr [bp-2],dx
   ;	
   ;		next = chunk +1;
   ;	
	mov	ax,word ptr [bp+4]
	inc	ax
	mov	si,ax
	jmp	short @24@74
@24@50:
   ;	
   ;		while (GRFILEPOS(next) == -1)		// skip past any sparse tiles
   ;			next++;
   ;	
	inc	si
@24@74:
	push	si
	call	near ptr _GRFILEPOS
	pop	cx
	cmp	dx,65535
	jne	short @24@122
	cmp	ax,65535
	je	short @24@50
@24@122:
   ;	
   ;		compressed = GRFILEPOS(next)-pos;
   ;	
	push	si
	call	near ptr _GRFILEPOS
	pop	cx
	sub	ax,word ptr [bp-4]
	sbb	dx,word ptr [bp-2]
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],dx
   ;	
   ;	
   ;		lseek(grhandle,pos,SEEK_SET);
   ;	
	xor	ax,ax
	push	ax
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_grhandle
	call	near ptr _lseek
	add	sp,8
   ;	
   ;	
   ;		MM_GetPtr(&bigbufferseg,compressed);
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	lea	ax,word ptr [bp-14]
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;		MM_SetLock (&bigbufferseg,true);
   ;	
	mov	ax,1
	push	ax
	lea	ax,word ptr [bp-14]
	push	ax
	call	near ptr _MM_SetLock
	pop	cx
	pop	cx
   ;	
   ;		CA_FarRead(grhandle,bigbufferseg,compressed);
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	push	word ptr [bp-14]
	xor	ax,ax
	push	ax
	push	word ptr DGROUP:_grhandle
	call	near ptr _CA_FarRead
	add	sp,10
   ;	
   ;		source = bigbufferseg;
   ;	
	mov	ax,word ptr [bp-14]
	mov	word ptr [bp-18],0
	mov	word ptr [bp-16],ax
   ;	
   ;	
   ;		expanded = *(long far *)source;
   ;	
	les	bx,dword ptr [bp-18]
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	mov	word ptr [bp-12],dx
	mov	word ptr [bp-10],ax
   ;	
   ;		source += 4;			// skip over length
   ;	
	add	word ptr [bp-18],4
   ;	
   ;	
   ;	//
   ;	// allocate final space, decompress it, and free bigbuffer
   ;	// Sprites need to have shifts made and various other junk
   ;	//
   ;		CAL_HuffExpand (source,MK_FP(SCREENSEG,bufferofs),expanded,grhuffman,true);
   ;	
	mov	ax,1
	push	ax
	mov	ax,offset DGROUP:_grhuffman
	push	ax
	push	word ptr [bp-10]
	push	word ptr [bp-12]
	mov	ax,40960
	push	ax
	push	word ptr DGROUP:_bufferofs
	push	word ptr [bp-16]
	push	word ptr [bp-18]
	call	near ptr _CAL_HuffExpand
	add	sp,16
   ;	
   ;		VW_MarkUpdateBlock (0,0,319,199);
   ;	
	mov	ax,199
	push	ax
	mov	ax,319
	push	ax
	xor	ax,ax
	push	ax
	xor	ax,ax
	push	ax
	call	near ptr _VW_MarkUpdateBlock
	add	sp,8
   ;	
   ;		MM_FreePtr(&bigbufferseg);
   ;	
	lea	ax,word ptr [bp-14]
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CA_CacheScreen	endp
   ;	
   ;	void CA_CacheMap (int mapnum)
   ;	
	assume	cs:_TEXT
_CA_CacheMap	proc	near
	push	bp
	mov	bp,sp
	sub	sp,22
	push	si
	push	di
   ;	
   ;	{
   ;		long	pos,compressed;
   ;		int		plane;
   ;		memptr	*dest,bigbufferseg;
   ;		unsigned	size;
   ;		unsigned	far	*source;
   ;	#ifdef CARMACIZED
   ;		memptr	buffer2seg;
   ;		long	expanded;
   ;	#endif
   ;	
   ;		mapon = mapnum;
   ;	
	mov	ax,word ptr [bp+4]
	mov	word ptr DGROUP:_mapon,ax
   ;	
   ;	
   ;	//
   ;	// load the planes into the allready allocated buffers
   ;	//
   ;		size = 64*64*2;
   ;	
	mov	word ptr [bp-12],8192
   ;	
   ;	
   ;		for (plane = 0; plane<MAPPLANES; plane++)
   ;	
	xor	si,si
	jmp	@25@290
@25@50:
   ;	
   ;		{
   ;			pos = mapheaderseg[mapnum]->planestart[plane];
   ;	
	mov	bx,word ptr [bp+4]
	shl	bx,1
	mov	es,word ptr DGROUP:_mapheaderseg[bx]
	mov	bx,si
	shl	bx,1
	shl	bx,1
	mov	ax,word ptr es:[bx+2]
	mov	dx,word ptr es:[bx]
	mov	word ptr [bp-4],dx
	mov	word ptr [bp-2],ax
   ;	
   ;			compressed = mapheaderseg[mapnum]->planelength[plane];
   ;	
	mov	bx,word ptr [bp+4]
	shl	bx,1
	mov	es,word ptr DGROUP:_mapheaderseg[bx]
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr es:[bx+12]
	mov	word ptr [bp-8],ax
	mov	word ptr [bp-6],0
   ;	
   ;	
   ;			dest = &(memptr)mapsegs[plane];
   ;	
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_mapsegs
	mov	di,ax
   ;	
   ;	
   ;			lseek(maphandle,pos,SEEK_SET);
   ;	
	xor	ax,ax
	push	ax
	push	word ptr [bp-2]
	push	word ptr [bp-4]
	push	word ptr DGROUP:_maphandle
	call	near ptr _lseek
	add	sp,8
   ;	
   ;			if (compressed<=BUFFERSIZE)
   ;	
	cmp	word ptr [bp-6],0
	jg	short @25@146
	jne	short @25@122
	cmp	word ptr [bp-8],4096
	ja	short @25@146
@25@122:
   ;	
   ;				source = bufferseg;
   ;	
	mov	ax,word ptr DGROUP:_bufferseg
	mov	word ptr [bp-16],0
	mov	word ptr [bp-14],ax
	jmp	short @25@170
@25@146:
   ;	
   ;			else
   ;			{
   ;				MM_GetPtr(&bigbufferseg,compressed);
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	lea	ax,word ptr [bp-10]
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;				MM_SetLock (&bigbufferseg,true);
   ;	
	mov	ax,1
	push	ax
	lea	ax,word ptr [bp-10]
	push	ax
	call	near ptr _MM_SetLock
	pop	cx
	pop	cx
   ;	
   ;				source = bigbufferseg;
   ;	
	mov	ax,word ptr [bp-10]
	mov	word ptr [bp-16],0
	mov	word ptr [bp-14],ax
@25@170:
   ;	
   ;			}
   ;	
   ;			CA_FarRead(maphandle,(byte far *)source,compressed);
   ;	
	push	word ptr [bp-6]
	push	word ptr [bp-8]
	push	word ptr [bp-14]
	push	word ptr [bp-16]
	push	word ptr DGROUP:_maphandle
	call	near ptr _CA_FarRead
	add	sp,10
   ;	
   ;	#ifdef CARMACIZED
   ;			//
   ;			// unhuffman, then unRLEW
   ;			// The huffman'd chunk has a two byte expanded length first
   ;			// The resulting RLEW chunk also does, even though it's not really
   ;			// needed
   ;			//
   ;			expanded = *source;
   ;	
	les	bx,dword ptr [bp-16]
	mov	ax,word ptr es:[bx]
	mov	word ptr [bp-22],ax
	mov	word ptr [bp-20],0
   ;	
   ;			source++;
   ;	
	add	word ptr [bp-16],2
   ;	
   ;			MM_GetPtr (&buffer2seg,expanded);
   ;	
	push	word ptr [bp-20]
	push	word ptr [bp-22]
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;			CAL_CarmackExpand (source, (unsigned far *)buffer2seg,expanded);
   ;	
	push	word ptr [bp-22]
	push	word ptr [bp-18]
	xor	ax,ax
	push	ax
	push	word ptr [bp-14]
	push	word ptr [bp-16]
	call	near ptr _CAL_CarmackExpand
	add	sp,10
   ;	
   ;			CA_RLEWexpand (((unsigned far *)buffer2seg)+1,*dest,size,
   ;	
   ;	
   ;			((mapfiletype _seg *)tinf)->RLEWtag);
   ;	
	mov	es,word ptr DGROUP:_tinf
	push	word ptr es:[0]
	xor	ax,ax
	push	ax
	push	word ptr [bp-12]
	push	word ptr [di]
	xor	ax,ax
	push	ax
	xor	ax,ax
	inc	ax
	inc	ax
	push	word ptr [bp-18]
	push	ax
	call	near ptr _CA_RLEWexpand
	add	sp,14
   ;	
   ;			MM_FreePtr (&buffer2seg);
   ;	
	lea	ax,word ptr [bp-18]
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
   ;	
   ;	
   ;	#else
   ;			//
   ;			// unRLEW, skipping expanded length
   ;			//
   ;			CA_RLEWexpand (source+1, *dest,size,
   ;			((mapfiletype _seg *)tinf)->RLEWtag);
   ;	#endif
   ;	
   ;			if (compressed>BUFFERSIZE)
   ;	
	cmp	word ptr [bp-6],0
	jl	short @25@266
	jg	short @25@242
	cmp	word ptr [bp-8],4096
	jbe	short @25@266
@25@242:
   ;	
   ;				MM_FreePtr(&bigbufferseg);
   ;	
	lea	ax,word ptr [bp-10]
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
@25@266:
	inc	si
@25@290:
	cmp	si,2
	jge	@@5
	jmp	@25@50
@@5:
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CA_CacheMap	endp
   ;	
   ;	void CA_UpLevel (void)
   ;	
	assume	cs:_TEXT
_CA_UpLevel	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int	i;
   ;	
   ;		if (ca_levelnum==7)
   ;	
	cmp	byte ptr DGROUP:_ca_levelnum,7
	jne	short @26@74
   ;	
   ;			Quit ("CA_UpLevel: Up past level 7!");
   ;	
	mov	ax,offset DGROUP:s@+115
	push	ax
	call	near ptr _Quit
	pop	cx
@26@74:
   ;	
   ;	
   ;		for (i=0;i<NUMCHUNKS;i++)
   ;	
	xor	si,si
	jmp	short @26@170
@26@98:
   ;	
   ;			if (grsegs[i])
   ;	
	mov	bx,si
	shl	bx,1
	cmp	word ptr DGROUP:_grsegs[bx],0
	je	short @26@146
   ;	
   ;				MM_SetPurge (&(memptr)grsegs[i],3);
   ;	
	mov	ax,3
	push	ax
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_grsegs
	push	ax
	call	near ptr _MM_SetPurge
	pop	cx
	pop	cx
@26@146:
	inc	si
@26@170:
	cmp	si,149
	jl	short @26@98
   ;	
   ;		ca_levelbit<<=1;
   ;	
	shl	byte ptr DGROUP:_ca_levelbit,1
   ;	
   ;		ca_levelnum++;
   ;	
	inc	byte ptr DGROUP:_ca_levelnum
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_CA_UpLevel	endp
   ;	
   ;	void CA_DownLevel (void)
   ;	
	assume	cs:_TEXT
_CA_DownLevel	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		if (!ca_levelnum)
   ;	
	mov	al,byte ptr DGROUP:_ca_levelnum
	mov	ah,0
	or	ax,ax
	jne	short @27@74
   ;	
   ;			Quit ("CA_DownLevel: Down past level 0!");
   ;	
	mov	ax,offset DGROUP:s@+144
	push	ax
	call	near ptr _Quit
	pop	cx
@27@74:
   ;	
   ;		ca_levelbit>>=1;
   ;	
	shr	byte ptr DGROUP:_ca_levelbit,1
   ;	
   ;		ca_levelnum--;
   ;	
	dec	byte ptr DGROUP:_ca_levelnum
   ;	
   ;		CA_CacheMarks();
   ;	
	call	near ptr _CA_CacheMarks
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_CA_DownLevel	endp
   ;	
   ;	void CA_ClearMarks (void)
   ;	
	assume	cs:_TEXT
_CA_ClearMarks	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int i;
   ;	
   ;		for (i=0;i<NUMCHUNKS;i++)
   ;	
	xor	si,si
	jmp	short @28@98
@28@50:
   ;	
   ;			grneeded[i]&=~ca_levelbit;
   ;	
	mov	ax,seg _grneeded
	mov	es,ax
	mov	al,byte ptr es:_grneeded[si]
	mov	dl,byte ptr DGROUP:_ca_levelbit
	not	dl
	and	al,dl
	mov	dx,seg _grneeded
	mov	es,dx
	mov	byte ptr es:_grneeded[si],al
	inc	si
@28@98:
	cmp	si,149
	jl	short @28@50
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_CA_ClearMarks	endp
   ;	
   ;	void CA_ClearAllMarks (void)
   ;	
	assume	cs:_TEXT
_CA_ClearAllMarks	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		_fmemset (grneeded,0,sizeof(grneeded));
   ;	
	mov	ax,149
	push	ax
	xor	ax,ax
	push	ax
	mov	ax,seg _grneeded
	push	ax
	mov	ax,offset _grneeded
	push	ax
	call	near ptr __fmemset
	add	sp,8
   ;	
   ;		ca_levelbit = 1;
   ;	
	mov	byte ptr DGROUP:_ca_levelbit,1
   ;	
   ;		ca_levelnum = 0;
   ;	
	mov	byte ptr DGROUP:_ca_levelnum,0
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_CA_ClearAllMarks	endp
   ;	
   ;	void CA_SetGrPurge (void)
   ;	
	assume	cs:_TEXT
_CA_SetGrPurge	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int i;
   ;	
   ;	//
   ;	// free graphics
   ;	//
   ;		CA_ClearMarks ();
   ;	
	call	near ptr _CA_ClearMarks
   ;	
   ;	
   ;		for (i=0;i<NUMCHUNKS;i++)
   ;	
	xor	si,si
	jmp	short @30@122
@30@50:
   ;	
   ;			if (grsegs[i])
   ;	
	mov	bx,si
	shl	bx,1
	cmp	word ptr DGROUP:_grsegs[bx],0
	je	short @30@98
   ;	
   ;				MM_SetPurge (&(memptr)grsegs[i],3);
   ;	
	mov	ax,3
	push	ax
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_grsegs
	push	ax
	call	near ptr _MM_SetPurge
	pop	cx
	pop	cx
@30@98:
	inc	si
@30@122:
	cmp	si,149
	jl	short @30@50
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_CA_SetGrPurge	endp
   ;	
   ;	void CA_SetAllPurge (void)
   ;	
	assume	cs:_TEXT
_CA_SetAllPurge	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;		int i;
   ;	
   ;	
   ;	//
   ;	// free sounds
   ;	//
   ;		for (i=0;i<NUMSNDCHUNKS;i++)
   ;	
	xor	si,si
	jmp	short @31@122
@31@50:
   ;	
   ;			if (audiosegs[i])
   ;	
	mov	bx,si
	shl	bx,1
	cmp	word ptr DGROUP:_audiosegs[bx],0
	je	short @31@98
   ;	
   ;				MM_SetPurge (&(memptr)audiosegs[i],3);
   ;	
	mov	ax,3
	push	ax
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_audiosegs
	push	ax
	call	near ptr _MM_SetPurge
	pop	cx
	pop	cx
@31@98:
	inc	si
@31@122:
	cmp	si,288
	jl	short @31@50
   ;	
   ;	
   ;	//
   ;	// free graphics
   ;	//
   ;		CA_SetGrPurge ();
   ;	
	call	near ptr _CA_SetGrPurge
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_CA_SetAllPurge	endp
   ;	
   ;	void CA_CacheMarks (void)
   ;	
	assume	cs:_TEXT
_CA_CacheMarks	proc	near
	push	bp
	mov	bp,sp
	sub	sp,36
	push	si
	push	di
   ;	
   ;	{
   ;		int 	i,next,numcache;
   ;		long	pos,endpos,nextpos,nextendpos,compressed;
   ;		long	bufferstart,bufferend;	// file position of general buffer
   ;		byte	far *source;
   ;		memptr	bigbufferseg;
   ;	
   ;		numcache = 0;
   ;	
	mov	word ptr [bp-2],0
   ;	
   ;	//
   ;	// go through and make everything not needed purgable
   ;	//
   ;		for (i=0;i<NUMCHUNKS;i++)
   ;	
	xor	si,si
	jmp	short @32@242
@32@50:
   ;	
   ;			if (grneeded[i]&ca_levelbit)
   ;	
	mov	ax,seg _grneeded
	mov	dl,byte ptr DGROUP:_ca_levelbit
	mov	es,ax
	test	byte ptr es:_grneeded[si],dl
	je	short @32@170
   ;	
   ;			{
   ;				if (grsegs[i])					// its allready in memory, make
   ;	
	mov	bx,si
	shl	bx,1
	cmp	word ptr DGROUP:_grsegs[bx],0
	je	short @32@122
   ;	
   ;					MM_SetPurge(&grsegs[i],0);	// sure it stays there!
   ;	
	xor	ax,ax
	push	ax
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_grsegs
	push	ax
	call	near ptr _MM_SetPurge
	pop	cx
	pop	cx
	jmp	short @32@146
@32@122:
   ;	
   ;				else
   ;					numcache++;
   ;	
	inc	word ptr [bp-2]
@32@146:
   ;	
   ;			}
   ;	
	jmp	short @32@218
@32@170:
   ;	
   ;			else
   ;			{
   ;				if (grsegs[i])					// not needed, so make it purgeable
   ;	
	mov	bx,si
	shl	bx,1
	cmp	word ptr DGROUP:_grsegs[bx],0
	je	short @32@218
   ;	
   ;					MM_SetPurge(&grsegs[i],3);
   ;	
	mov	ax,3
	push	ax
	mov	ax,si
	shl	ax,1
	add	ax,offset DGROUP:_grsegs
	push	ax
	call	near ptr _MM_SetPurge
	pop	cx
	pop	cx
@32@218:
	inc	si
@32@242:
	cmp	si,149
	jl	short @32@50
   ;	
   ;			}
   ;	
   ;		if (!numcache)			// nothing to cache!
   ;	
	cmp	word ptr [bp-2],0
	jne	short @32@314
   ;	
   ;			return;
   ;	
	jmp	@32@1610
@32@314:
   ;	
   ;	
   ;	
   ;	//
   ;	// go through and load in anything still needed
   ;	//
   ;		bufferstart = bufferend = 0;		// nothing good in buffer now
   ;	
	xor	ax,ax
	xor	dx,dx
	mov	word ptr [bp-30],dx
	mov	word ptr [bp-28],ax
	mov	word ptr [bp-26],dx
	mov	word ptr [bp-24],ax
   ;	
   ;	
   ;		for (i=0;i<NUMCHUNKS;i++)
   ;	
	xor	si,si
	jmp	@32@1586
@32@338:
   ;	
   ;			if ( (grneeded[i]&ca_levelbit) && !grsegs[i])
   ;	
	mov	ax,seg _grneeded
	mov	dl,byte ptr DGROUP:_ca_levelbit
	mov	es,ax
	test	byte ptr es:_grneeded[si],dl
	jne	@@6
	jmp	@32@1562
@@6:
	mov	bx,si
	shl	bx,1
	cmp	word ptr DGROUP:_grsegs[bx],0
	je	@@7
	jmp	@32@1562
@@7:
   ;	
   ;			{
   ;				pos = GRFILEPOS(i);
   ;	
	push	si
	call	near ptr _GRFILEPOS
	pop	cx
	mov	word ptr [bp-6],ax
	mov	word ptr [bp-4],dx
   ;	
   ;				if (pos<0)
   ;	
	cmp	word ptr [bp-4],0
	jg	short @32@482
	jl	short @32@458
	cmp	word ptr [bp-6],0
	jae	short @32@482
@32@458:
   ;	
   ;					continue;
   ;	
	jmp	@32@1562
@32@482:
   ;	
   ;	
   ;				next = i +1;
   ;	
	mov	ax,si
	inc	ax
	mov	di,ax
	jmp	short @32@530
@32@506:
   ;	
   ;				while (GRFILEPOS(next) == -1)		// skip past any sparse tiles
   ;					next++;
   ;	
	inc	di
@32@530:
	push	di
	call	near ptr _GRFILEPOS
	pop	cx
	cmp	dx,65535
	jne	short @32@578
	cmp	ax,65535
	je	short @32@506
@32@578:
   ;	
   ;	
   ;				compressed = GRFILEPOS(next)-pos;
   ;	
	push	di
	call	near ptr _GRFILEPOS
	pop	cx
	sub	ax,word ptr [bp-6]
	sbb	dx,word ptr [bp-4]
	mov	word ptr [bp-22],ax
	mov	word ptr [bp-20],dx
   ;	
   ;				endpos = pos+compressed;
   ;	
	mov	ax,word ptr [bp-4]
	mov	dx,word ptr [bp-6]
	add	dx,word ptr [bp-22]
	adc	ax,word ptr [bp-20]
	mov	word ptr [bp-10],dx
	mov	word ptr [bp-8],ax
   ;	
   ;	
   ;				if (compressed<=BUFFERSIZE)
   ;	
	cmp	word ptr [bp-20],0
	jle	@@8
	jmp	@32@1346
@@8:
	jne	short @32@650
	cmp	word ptr [bp-22],4096
	jbe	@@9
	jmp	@32@1346
@@9:
@32@650:
   ;	
   ;				{
   ;					if (bufferstart<=pos
   ;	
   ;	
   ;					&& bufferend>= endpos)
   ;	
	mov	ax,word ptr [bp-24]
	mov	dx,word ptr [bp-26]
	cmp	ax,word ptr [bp-4]
	jg	short @32@818
	jne	short @32@722
	cmp	dx,word ptr [bp-6]
	ja	short @32@818
@32@722:
	mov	ax,word ptr [bp-28]
	mov	dx,word ptr [bp-30]
	cmp	ax,word ptr [bp-8]
	jl	short @32@818
	jne	short @32@794
	cmp	dx,word ptr [bp-10]
	jb	short @32@818
@32@794:
   ;	
   ;					{
   ;					// data is allready in buffer
   ;						source = (byte _seg *)bufferseg+(pos-bufferstart);
   ;	
	mov	ax,word ptr [bp-6]
	sub	ax,word ptr [bp-26]
	mov	dx,word ptr DGROUP:_bufferseg
	mov	word ptr [bp-34],ax
	mov	word ptr [bp-32],dx
   ;	
   ;					}
   ;	
	jmp	@32@1322
@32@818:
	jmp	@32@1274
@32@842:
	jmp	short @32@890
@32@866:
   ;	
   ;					else
   ;					{
   ;					// load buffer with a new block from disk
   ;					// try to get as many of the needed blocks in as possible
   ;						while ( next < NUMCHUNKS )
   ;						{
   ;							while (next < NUMCHUNKS &&
   ;							!(grneeded[next]&ca_levelbit && !grsegs[next]))
   ;								next++;
   ;	
	inc	di
@32@890:
	cmp	di,149
	jge	short @32@962
	mov	ax,seg _grneeded
	mov	dl,byte ptr DGROUP:_ca_levelbit
	mov	es,ax
	test	byte ptr es:_grneeded[di],dl
	je	short @32@866
	mov	bx,di
	shl	bx,1
	cmp	word ptr DGROUP:_grsegs[bx],0
	jne	short @32@866
@32@962:
   ;	
   ;							if (next == NUMCHUNKS)
   ;	
	cmp	di,149
	jne	short @32@1010
   ;	
   ;								continue;
   ;	
	jmp	short @32@1274
@32@1010:
   ;	
   ;	
   ;							nextpos = GRFILEPOS(next);
   ;	
	push	di
	call	near ptr _GRFILEPOS
	pop	cx
	mov	word ptr [bp-14],ax
	mov	word ptr [bp-12],dx
	jmp	short @32@1034
@32@1034:
   ;	
   ;							while (GRFILEPOS(++next) == -1)	// skip past any sparse tiles
   ;	
	inc	di
	mov	ax,di
	push	ax
	call	near ptr _GRFILEPOS
	pop	cx
	cmp	dx,65535
	jne	short @32@1082
	cmp	ax,65535
	je	short @32@1034
@32@1082:
   ;	
   ;								;
   ;							nextendpos = GRFILEPOS(next);
   ;	
	push	di
	call	near ptr _GRFILEPOS
	pop	cx
	mov	word ptr [bp-18],ax
	mov	word ptr [bp-16],dx
   ;	
   ;							if (nextpos - endpos <= MAXEMPTYREAD
   ;	
   ;	
   ;							&& nextendpos-pos <= BUFFERSIZE)
   ;	
	mov	ax,word ptr [bp-12]
	mov	dx,word ptr [bp-14]
	sub	dx,word ptr [bp-10]
	sbb	ax,word ptr [bp-8]
	or	ax,ax
	jg	short @32@1250
	jne	short @32@1154
	cmp	dx,1024
	ja	short @32@1250
@32@1154:
	mov	ax,word ptr [bp-16]
	mov	dx,word ptr [bp-18]
	sub	dx,word ptr [bp-6]
	sbb	ax,word ptr [bp-4]
	or	ax,ax
	jg	short @32@1250
	jne	short @32@1226
	cmp	dx,4096
	ja	short @32@1250
@32@1226:
   ;	
   ;								endpos = nextendpos;
   ;	
	mov	ax,word ptr [bp-16]
	mov	dx,word ptr [bp-18]
	mov	word ptr [bp-10],dx
	mov	word ptr [bp-8],ax
	jmp	short @32@1274
@32@1250:
   ;	
   ;							else
   ;								next = NUMCHUNKS;			// read pos to posend
   ;	
	mov	di,149
@32@1274:
	cmp	di,149
	jge	@@10
	jmp	@32@842
@@10:
   ;	
   ;						}
   ;	
   ;						lseek(grhandle,pos,SEEK_SET);
   ;	
	xor	ax,ax
	push	ax
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	push	word ptr DGROUP:_grhandle
	call	near ptr _lseek
	add	sp,8
   ;	
   ;						CA_FarRead(grhandle,bufferseg,endpos-pos);
   ;	
	mov	ax,word ptr [bp-8]
	mov	dx,word ptr [bp-10]
	sub	dx,word ptr [bp-6]
	sbb	ax,word ptr [bp-4]
	push	ax
	push	dx
	push	word ptr DGROUP:_bufferseg
	xor	ax,ax
	push	ax
	push	word ptr DGROUP:_grhandle
	call	near ptr _CA_FarRead
	add	sp,10
   ;	
   ;						bufferstart = pos;
   ;	
	mov	ax,word ptr [bp-4]
	mov	dx,word ptr [bp-6]
	mov	word ptr [bp-26],dx
	mov	word ptr [bp-24],ax
   ;	
   ;						bufferend = endpos;
   ;	
	mov	ax,word ptr [bp-8]
	mov	dx,word ptr [bp-10]
	mov	word ptr [bp-30],dx
	mov	word ptr [bp-28],ax
   ;	
   ;						source = bufferseg;
   ;	
	mov	ax,word ptr DGROUP:_bufferseg
	mov	word ptr [bp-34],0
	mov	word ptr [bp-32],ax
@32@1322:
   ;	
   ;					}
   ;				}
   ;	
	jmp	short @32@1418
@32@1346:
   ;	
   ;				else
   ;				{
   ;				// big chunk, allocate temporary buffer
   ;					MM_GetPtr(&bigbufferseg,compressed);
   ;	
	push	word ptr [bp-20]
	push	word ptr [bp-22]
	lea	ax,word ptr [bp-36]
	push	ax
	call	near ptr _MM_GetPtr
	add	sp,6
   ;	
   ;					if (mmerror)
   ;	
	cmp	word ptr DGROUP:_mmerror,0
	je	short @32@1394
   ;	
   ;						return;
   ;	
	jmp	short @32@1610
@32@1394:
   ;	
   ;					MM_SetLock (&bigbufferseg,true);
   ;	
	mov	ax,1
	push	ax
	lea	ax,word ptr [bp-36]
	push	ax
	call	near ptr _MM_SetLock
	pop	cx
	pop	cx
   ;	
   ;					lseek(grhandle,pos,SEEK_SET);
   ;	
	xor	ax,ax
	push	ax
	push	word ptr [bp-4]
	push	word ptr [bp-6]
	push	word ptr DGROUP:_grhandle
	call	near ptr _lseek
	add	sp,8
   ;	
   ;					CA_FarRead(grhandle,bigbufferseg,compressed);
   ;	
	push	word ptr [bp-20]
	push	word ptr [bp-22]
	push	word ptr [bp-36]
	xor	ax,ax
	push	ax
	push	word ptr DGROUP:_grhandle
	call	near ptr _CA_FarRead
	add	sp,10
   ;	
   ;					source = bigbufferseg;
   ;	
	mov	ax,word ptr [bp-36]
	mov	word ptr [bp-34],0
	mov	word ptr [bp-32],ax
@32@1418:
   ;	
   ;				}
   ;	
   ;				CAL_ExpandGrChunk (i,source);
   ;	
	push	word ptr [bp-32]
	push	word ptr [bp-34]
	push	si
	call	near ptr _CAL_ExpandGrChunk
	add	sp,6
   ;	
   ;				if (mmerror)
   ;	
	cmp	word ptr DGROUP:_mmerror,0
	je	short @32@1466
   ;	
   ;					return;
   ;	
	jmp	short @32@1610
@32@1466:
   ;	
   ;	
   ;				if (compressed>BUFFERSIZE)
   ;	
	cmp	word ptr [bp-20],0
	jl	short @32@1562
	jg	short @32@1538
	cmp	word ptr [bp-22],4096
	jbe	short @32@1562
@32@1538:
   ;	
   ;					MM_FreePtr(&bigbufferseg);
   ;	
	lea	ax,word ptr [bp-36]
	push	ax
	call	near ptr _MM_FreePtr
	pop	cx
@32@1562:
	inc	si
@32@1586:
	cmp	si,149
	jge	@@11
	jmp	@32@338
@@11:
@32@1610:
   ;	
   ;	
   ;			}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_CA_CacheMarks	endp
   ;	
   ;	void CA_CannotOpen(char *string)
   ;	
	assume	cs:_TEXT
_CA_CannotOpen	proc	near
	push	bp
	mov	bp,sp
	sub	sp,30
   ;	
   ;	{
   ;	 char str[30];
   ;	
   ;	 strcpy(str,"Can't open ");
   ;	
	mov	ax,offset DGROUP:s@+177
	push	ax
	lea	ax,word ptr [bp-30]
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
   ;	
   ;	 strcat(str,string);
   ;	
	push	word ptr [bp+4]
	lea	ax,word ptr [bp-30]
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;	 strcat(str,"!\n");
   ;	
	mov	ax,offset DGROUP:s@+189
	push	ax
	lea	ax,word ptr [bp-30]
	push	ax
	call	near ptr _strcat
	pop	cx
	pop	cx
   ;	
   ;	 Quit (str);
   ;	
	lea	ax,word ptr [bp-30]
	push	ax
	call	near ptr _Quit
	pop	cx
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_CA_CannotOpen	endp
_TEXT	ends
_BSS	segment word public 'BSS'
_grstarts	label	word
	db	2 dup (?)
_profilehandle	label	word
	db	2 dup (?)
_tinf	label	word
	db	2 dup (?)
_extension	label	byte
	db	5 dup (?)
	db	1 dup (?)
_mapon	label	word
	db	2 dup (?)
_chunkexplen	label	word
	db	4 dup (?)
_mapsegs	label	word
	db	4 dup (?)
_chunkcomplen	label	word
	db	4 dup (?)
_oldsoundmode	label	word
	db	2 dup (?)
_audiosegs	label	word
	db	576 dup (?)
_maphandle	label	word
	db	2 dup (?)
_grsegs	label	word
	db	298 dup (?)
_audiohuffman	label	word
	db	1020 dup (?)
_ca_levelbit	label	byte
	db	1 dup (?)
	db	1 dup (?)
_audiohandle	label	word
	db	2 dup (?)
_debughandle	label	word
	db	2 dup (?)
_grneeded	label	byte
	db	149 dup (?)
	db	1 dup (?)
_mapheaderseg	label	word
	db	120 dup (?)
_grhuffman	label	word
	db	1020 dup (?)
_audiostarts	label	word
	db	2 dup (?)
_grhandle	label	word
	db	2 dup (?)
_ca_levelnum	label	byte
	db	1 dup (?)
	?debug	C E9
_BSS	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'DEBUG.TXT'
	db	0
	db	'DEBUG.TXT'
	db	0
	db	'CA_FarRead doesn'
	db	39
	db	't support 64K reads yet!'
	db	0
	db	'CA_FarWrite doesn'
	db	39
	db	't support 64K reads yet!'
	db	0
	db	'GAMEMAPS.'
	db	0
	db	'CA_UpLevel: Up past level 7!'
	db	0
	db	'CA_DownLevel: Down past level 0!'
	db	0
	db	'Can'
	db	39
	db	't open '
	db	0
	db	'!'
	db	10
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	public	_CA_SetAllPurge
	public	_CA_RLEWexpand
	public	_CA_CacheScreen
	public	_CA_OpenDebug
	public	_CA_CacheMarks
	public	_CA_ClearMarks
	extrn	_lseek:near
	public	_ca_levelnum
	public	_grhandle
	public	_audiostarts
	public	_CA_SetGrPurge
	public	_CA_Shutdown
	public	_grhuffman
	public	_CA_CannotOpen
	public	_CA_WriteFile
	public	_CA_FarWrite
	public	_mapheaderseg
	public	_grneeded
	extrn	__fmemset:near
	extrn	_filelength:near
	public	_debughandle
	public	_audiohandle
	extrn	_MM_FreePtr:near
	public	_CA_DownLevel
	public	_CA_Startup
	public	_ca_levelbit
	public	_audiohuffman
	extrn	_unlink:near
	public	_CA_LoadFile
	public	_CA_ReadFile
	extrn	_MM_SetPurge:near
	extrn	_MM_GetPtr:near
	public	_grsegs
	extrn	_errno:word
	public	_maphandle
	public	_CA_CacheMap
	public	_audioname
	public	_GRFILEPOS
	extrn	_VW_MarkUpdateBlock:near
	public	_CA_UpLevel
	extrn	_MM_SetLock:near
	public	_audiosegs
	extrn	_bufferofs:word
	extrn	_pictable:word
	public	_CA_FarRead
	extrn	_bufferseg:word
	extrn	_mmerror:word
	public	_oldsoundmode
	public	_chunkcomplen
	public	_mapsegs
	public	_chunkexplen
	public	_mapon
	public	_extension
	public	_mheadname
	public	_gdictname
	public	_gheadname
	public	_aheadname
	public	_tinf
	public	_CAL_GetGrChunkLength
	extrn	_Quit:near
	extrn	_read:near
	extrn	_strcpy:near
	extrn	_close:near
	public	_CA_CacheAudioChunk
	public	_CAL_SetupAudioFile
	public	_profilehandle
	extrn	_strcat:near
	public	_CAL_ExpandGrChunk
	public	_CAL_CarmackExpand
	extrn	N_LDIV@:far
	extrn	_SoundMode:word
	public	_CAL_OptimizeNodes
	public	_CAL_SetupMapFile
	public	_CA_ClearAllMarks
	public	_CA_RLEWCompress
	extrn	_open:near
	extrn	N_PSBP@:far
	extrn	N_PCMP@:far
	extrn	N_LXRSH@:far
	public	_CA_CacheGrChunk
	public	_CAL_SetupGrFile
	public	_CA_LoadAllSounds
	public	_CAL_HuffExpand
	extrn	N_PADD@:far
	public	_CA_CloseDebug
	extrn	N_PSBA@:far
	extrn	N_PADA@:far
	public	_mfilename
	public	_gfilename
	public	_afilename
	public	_grstarts
	end
