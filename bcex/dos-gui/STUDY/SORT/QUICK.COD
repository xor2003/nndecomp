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
	?debug	S "c:\quick.cpp"
	?debug	C E97655FE7C0C633A5C717569636B2E637070
	?debug	C E97655FE7C07717569636B2E68
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
   ;	void quick_sort(int x[], int size) {
   ;	
	assume	cs:_TEXT
@quick_sort$qpii	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;		quick_sort(x, 0, size - 1);
   ;	
	mov	ax,word ptr [bp+6]
	dec	ax
	push	ax
	xor	ax,ax
	push	ax
	push	word ptr [bp+4]
	call	near ptr @quick_sort$qpiii
	add	sp,6
   ;	
   ;	}
   ;	
	pop	bp
	ret	
@quick_sort$qpii	endp
   ;	
   ;	void quick_sort(int x[], int ini, int fim) {
   ;	
	assume	cs:_TEXT
@quick_sort$qpiii	proc	near
	push	bp
	mov	bp,sp
	sub	sp,4
	push	si
	push	di
   ;	
   ;	  int i, j, pivo, aux;
   ;	
   ;	  i = ini;
   ;	
	mov	si,word ptr [bp+6]
   ;	
   ;	  j = fim;
   ;	
	mov	di,word ptr [bp+8]
   ;	
   ;	  pivo = x[(i + fim) / 2];
   ;	
	mov	ax,si
	add	ax,word ptr [bp+8]
	mov	bx,2
	cwd	
	idiv	bx
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-2],ax
	jmp	short @2@242
@2@50:
	jmp	short @2@98
@2@74:
   ;	
   ;	
   ;	  while(i <= j) {
   ;	    while(x[i] < pivo) {
   ;	      i++;
   ;	
	inc	si
@2@98:
	mov	ax,si
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,word ptr [bx]
	cmp	ax,word ptr [bp-2]
	jl	short @2@74
	jmp	short @2@170
@2@146:
   ;	
   ;	    }
   ;	    while(x[j] > pivo) {
   ;	      j--;
   ;	
	dec	di
@2@170:
	mov	ax,di
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,word ptr [bx]
	cmp	ax,word ptr [bp-2]
	jg	short @2@146
   ;	
   ;	    }
   ;	
   ;	    if (i <= j) {
   ;	
	cmp	si,di
	jg	short @2@242
   ;	
   ;	      aux = x[i];
   ;	
	mov	ax,si
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	word ptr [bp-4],ax
   ;	
   ;	      x[i] = x[j];
   ;	
	mov	ax,di
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,word ptr [bx]
	mov	dx,si
	shl	dx,1
	mov	bx,word ptr [bp+4]
	add	bx,dx
	mov	word ptr [bx],ax
   ;	
   ;				x[j] = aux;
   ;	
	mov	ax,di
	shl	ax,1
	mov	bx,word ptr [bp+4]
	add	bx,ax
	mov	ax,word ptr [bp-4]
	mov	word ptr [bx],ax
   ;	
   ;	
   ;	      i++;
   ;	
	inc	si
   ;	
   ;	      j--;
   ;	
	dec	di
@2@242:
	cmp	si,di
	jle	short @2@50
   ;	
   ;	    }
   ;	  }
   ;	
   ;	  if (ini < j) {
   ;	
	cmp	word ptr [bp+6],di
	jge	short @2@314
   ;	
   ;	    quick_sort(x, ini, j);
   ;	
	push	di
	push	word ptr [bp+6]
	push	word ptr [bp+4]
	call	near ptr @quick_sort$qpiii
	add	sp,6
@2@314:
   ;	
   ;	  }
   ;	  if (i < fim) {
   ;	
	cmp	si,word ptr [bp+8]
	jge	short @2@362
   ;	
   ;	    quick_sort(x, i, fim);
   ;	
	push	word ptr [bp+8]
	push	si
	push	word ptr [bp+4]
	call	near ptr @quick_sort$qpiii
	add	sp,6
@2@362:
   ;	
   ;		}
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
@quick_sort$qpiii	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_s@	equ	s@
	public	@quick_sort$qpii
	public	@quick_sort$qpiii
	end
