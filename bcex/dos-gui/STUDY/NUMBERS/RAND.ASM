	.386p

_TEXT	segment byte public use16 'CODE'
_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:_TEXT,ds:DGROUP
_DATA	segment word public use16 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public use16 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
_DATA	segment word public use16 'DATA'
_rand_state	label	word
	db	4 dup (?)
_DATA	ends
_TEXT	segment byte public use16 'CODE'
   ;	
   ;	unsigned long lcg_parkmiller(unsigned long *state)
   ;	
	assume	cs:_TEXT
@lcg_parkmiller$qpul	proc	near
	push	bp
	mov	bp,sp
	sub	sp,16
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		const unsigned long a = 48271;
   ;	
   ;	
   ;	
   ;		unsigned long low = (*state & 0x7fff) * a;
   ;	
	mov	eax,dword ptr [si]
	mov	dword ptr [bp-16],eax
	and	eax,large 32767
	imul	eax,large 00000BC8Fh
	mov	dword ptr [bp-4],eax
   ;	
   ;		unsigned long high = (*state >> 15) * a;
   ;	
	mov	eax,dword ptr [bp-16]
	shr	eax,15
	imul	eax,large 00000BC8Fh
	mov	dword ptr [bp-8],eax
   ;	
   ;		unsigned long x = low + ((high & 0xffff) << 15) + (high >> 16);
   ;	
	and	eax,large 00000FFFFh
	shl	eax,15
	mov	edx,dword ptr [bp-4]
	add	edx,eax
	mov	eax,dword ptr [bp-8]
	shr	eax,16
	add	edx,eax
	mov	dword ptr [bp-12],edx
   ;	
   ;	
   ;		x = (x & 0x7fffffff) + (x >> 31);
   ;	
	mov	eax,dword ptr [bp-12]
	shr	eax,31
	and	edx,large 07FFFFFFFh
	add	edx,eax
	mov	dword ptr [bp-12],edx
   ;	
   ;		return *state = x;
   ;	
	mov	eax,dword ptr [bp-12]
	mov	dword ptr [si],eax
	shld	edx,eax,16
   ;	
   ;	}
   ;	
	pop	si
	leave	
	ret	
@lcg_parkmiller$qpul	endp
   ;	
   ;	void lseed(unsigned long seed)
   ;	
	assume	cs:_TEXT
@lseed$qul	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		rand_state = seed;
   ;	
	mov	eax,dword ptr [bp+4]
	mov	dword ptr DGROUP:_rand_state,eax
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@lseed$qul	endp
   ;	
   ;	unsigned long lrand()
   ;	
	assume	cs:_TEXT
@lrand$qv	proc	near
   ;	
   ;	{
   ;		return lcg_parkmiller(&rand_state);
   ;	
	push	offset DGROUP:_rand_state
	call	near ptr @lcg_parkmiller$qpul
	add	sp,2
   ;	
   ;	}
   ;	
	ret	
@lrand$qv	endp
_TEXT	ends
_INIT_	segment word public use16 'INITDATA'
	db	0
	db	32
	dd	@_STCON_$qv
_INIT_	ends
_TEXT	segment byte public use16 'CODE'
	assume	cs:_TEXT
@_STCON_$qv	proc	near
	push	0
	call	near ptr _time
	shl	eax,16
	shrd	eax,edx,16
	add	sp,2
	mov	dword ptr DGROUP:_rand_state,eax
	ret	
@_STCON_$qv	endp
	?debug	C E9
	?debug	C FA11010000
_TEXT	ends
_DATA	segment word public use16 'DATA'
s@	label	byte
_DATA	ends
_TEXT	segment byte public use16 'CODE'
_TEXT	ends
	public	@lcg_parkmiller$qpul
	public	_rand_state
_atoi	equ	atoi
_abs	equ	abs
	extrn	_time:near
	public	@lseed$qul
	public	@lrand$qv
_s@	equ	s@
	end
