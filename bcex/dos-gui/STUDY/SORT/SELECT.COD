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
	?debug	S "c:\select.cpp"
	?debug	C E97655FE7C0D633A5C73656C6563742E637070
	?debug	C E97655FE7C0853454C4543542E48
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
   ;	void selection_sort(int x[], int size) {
   ;	
	assume	cs:_TEXT
@selection_sort$qpii	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
	mov	cx,word ptr [bp+4]
   ;	
   ;		int i, j;
   ;	
   ;		for (i = 0; i < size - 1; i++) {
   ;	
	mov	word ptr [bp-2],0
	jmp	short @1@242
@1@50:
   ;	
   ;			int min = i;
   ;	
	mov	di,word ptr [bp-2]
   ;	
   ;	
   ;			for (j = i + 1; j < size; j++) {
   ;	
	mov	ax,word ptr [bp-2]
	inc	ax
	mov	si,ax
	jmp	short @1@146
@1@74:
   ;	
   ;				if (x[j] < x[min]) {
   ;	
	mov	ax,si
	shl	ax,1
	mov	bx,cx
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,di
	shl	dx,1
	mov	bx,cx
	add	bx,dx
	cmp	ax,word ptr [bx]
	jge	short @1@122
   ;	
   ;					min = j;
   ;	
	mov	di,si
@1@122:
	inc	si
@1@146:
	cmp	si,word ptr [bp+6]
	jl	short @1@74
   ;	
   ;				}
   ;			}
   ;	
   ;			if (min != i) {
   ;	
	cmp	di,word ptr [bp-2]
	je	short @1@218
   ;	
   ;				int temp = x[i];
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,1
	mov	bx,cx
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-4],ax
   ;	
   ;				x[i] = x[min];
   ;	
	mov	ax,di
	shl	ax,1
	mov	bx,cx
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,word ptr [bp-2]
	shl	dx,1
	mov	bx,cx
	add	bx,dx
	mov	word ptr [bx],ax
   ;	
   ;				x[min] = temp;
   ;	
	mov	ax,di
	shl	ax,1
	mov	bx,cx
	add	bx,ax
	mov	ax,word ptr [bp-4]
	mov	word ptr [bx],ax
@1@218:
	inc	word ptr [bp-2]
@1@242:
	mov	ax,word ptr [bp+6]
	dec	ax
	cmp	ax,word ptr [bp-2]
	jg	short @1@50
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
@selection_sort$qpii	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_s@	equ	s@
	public	@selection_sort$qpii
	end
