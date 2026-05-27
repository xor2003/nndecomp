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
	?debug	S "c:\bubble.cpp"
	?debug	C E97655FE7C0D633A5C627562626C652E637070
	?debug	C E97655FE7C08627562626C652E68
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
   ;	void bubble_sort(int x[], int size) {
   ;	
	assume	cs:_TEXT
@bubble_sort$qpii	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	di,word ptr [bp+4]
@1@26:
   ;	
   ;		int troca;
   ;	
   ;		do {
   ;			troca = 0;
   ;	
	xor	cx,cx
   ;	
   ;			for (int i = 0; i < size - 1; i++) {
   ;	
	xor	si,si
	jmp	short @1@146
@1@74:
   ;	
   ;				if (x[i] > x[i+1]) {
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr [bx+di]
	mov	bx,si
	inc	bx
	shl	bx,1
	cmp	ax,word ptr [bx+di]
	jle	short @1@122
   ;	
   ;		int t = x[i];
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr [bx+di]
	mov	dx,ax
   ;	
   ;		x[i] = x[i+1];
   ;	
	mov	bx,si
	inc	bx
	shl	bx,1
	mov	ax,word ptr [bx+di]
	mov	bx,si
	shl	bx,1
	mov	word ptr [bx+di],ax
   ;	
   ;		x[i+1] = t;
   ;	
	mov	bx,si
	inc	bx
	shl	bx,1
	mov	ax,dx
	mov	word ptr [bx+di],ax
   ;	
   ;					troca = 1;
   ;	
	mov	cx,1
@1@122:
	inc	si
@1@146:
	mov	ax,word ptr [bp+6]
	dec	ax
	cmp	ax,si
	jg	short @1@74
   ;	
   ;				}
   ;			}
   ;		} while(troca);
   ;	
	or	cx,cx
	jne	short @1@26
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@bubble_sort$qpii	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_s@	equ	s@
	public	@bubble_sort$qpii
	end
