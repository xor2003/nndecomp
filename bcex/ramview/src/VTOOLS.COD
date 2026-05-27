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
	?debug	S "c:\vtools.cpp"
	?debug	C E98551FE7C0D633A5C76746F6F6C732E637070
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
   ;	void fillattr(byte left, byte top, byte right, byte bottom, byte attr)
   ;	
	assume	cs:_TEXT
@fillattr$qucucucucuc	proc	near
	push	bp
	mov	bp,sp
	dec	sp
	dec	sp
   ;	
   ;	{
   ;	    for (byte y = top; y <= bottom; y++)
   ;	
	mov	al,byte ptr [bp+6]
	mov	byte ptr [bp-1],al
	jmp	@1@650
@1@50:
   ;	
   ;	        for (byte x = left; x <= right; x++)
   ;	
	mov	al,byte ptr [bp+4]
	mov	byte ptr [bp-2],al
	jmp	@1@602
@1@74:
   ;	
   ;	        {
   ;	            // position cursor
   ;	            asm  mov	dh, y
   ;	
  	mov		dh, [bp-1]
   ;	
   ;	            asm  dec	dh
   ;	
  	dec		dh
   ;	
   ;	            asm  mov	dl, x
   ;	
  	mov		dl, [bp-2]
   ;	
   ;	            asm  dec	dl
   ;	
  	dec		dl
   ;	
   ;	            asm  xor	bh, bh
   ;	
  	xor		bh, bh
   ;	
   ;	            asm  mov	ah, 0x02
   ;	
  	mov		ah, 002H
   ;	
   ;	            asm  push bp
   ;	
  	push	 bp
   ;	
   ;	            asm  int 0x10
   ;	
  	int	 010H
   ;	
   ;	            asm  pop	bp
   ;	
  	pop		bp
   ;	
   ;	
   ;	            // read character and attribute at cursor
   ;	            asm  xor	bh, bh
   ;	
  	xor		bh, bh
   ;	
   ;	            asm  mov	ah, 0x08
   ;	
  	mov		ah, 008H
   ;	
   ;	            asm  push bp
   ;	
  	push	 bp
   ;	
   ;	            asm  int 0x10
   ;	
  	int	 010H
   ;	
   ;	            asm  pop	bp
   ;	
  	pop		bp
   ;	
   ;	
   ;	            // write character and attribute at cursor
   ;	            asm  xor	bh, bh
   ;	
  	xor		bh, bh
   ;	
   ;	            asm  mov	bl, attr
   ;	
  	mov		bl, [bp+12]
   ;	
   ;	            asm  mov	cx, 1
   ;	
  	mov		cx, 1
   ;	
   ;	            asm  mov	ah, 0x09
   ;	
  	mov		ah, 009H
   ;	
   ;	            asm  push bp
   ;	
  	push	 bp
   ;	
   ;	            asm  int 0x10
   ;	
  	int	 010H
   ;	
   ;	            asm  pop	bp
   ;	
  	pop		bp
	inc	byte ptr [bp-2]
@1@602:
	mov	al,byte ptr [bp-2]
	cmp	al,byte ptr [bp+8]
	ja	@@0
	jmp	@1@74
@@0:
	inc	byte ptr [bp-1]
@1@650:
	mov	al,byte ptr [bp-1]
	cmp	al,byte ptr [bp+10]
	ja	@@1
	jmp	@1@50
@@1:
   ;	
   ;	        }
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
@fillattr$qucucucucuc	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_s@	equ	s@
	public	@fillattr$qucucucucuc
	end
