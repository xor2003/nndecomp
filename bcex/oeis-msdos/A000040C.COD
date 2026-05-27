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
	?debug	S "c:\a000040c.cpp"
	?debug	C E93356FE7C0F633A5C61303030303430632E637070
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
	?debug	C E95337528111443A5C494E434C5544455C6D6174682E68
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
   ;	int main() {
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,14
	push	si
	push	di
   ;	
   ;	
   ;	    int max = 1000;
   ;	
	mov	word ptr [bp-2],1000
   ;	
   ;	    int sqm = (int)sqrt(max) + 1;
   ;	
	mov	ax,word ptr [bp-2]
	mov	word ptr [bp-6],ax
	FILD	word ptr [bp-6]
	add	sp,65528
	FSTP	qword ptr [bp-26]
	FWAIT	
	call	near ptr _sqrt
	add	sp,8
	call	near ptr N_FTOL@
	inc	ax
	mov	word ptr [bp-4],ax
   ;	
   ;	
   ;	    int* primes = (int *)malloc(max * sizeof(int));
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,1
	push	ax
	call	near ptr _malloc
	pop	cx
	mov	word ptr [bp-8],ax
   ;	
   ;	    int* sieve = (int *)malloc(max * sizeof(int));
   ;	
	mov	ax,word ptr [bp-2]
	shl	ax,1
	push	ax
	call	near ptr _malloc
	pop	cx
	mov	word ptr [bp-10],ax
   ;	
   ;	
   ;	    int i = 0;
   ;	
	xor	si,si
   ;	
   ;	    int sp = 2;     // a pointer to the next prime in the array
   ;	
	mov	word ptr [bp-12],2
   ;	
   ;	    int pcount = 0;
   ;	
	mov	word ptr [bp-14],0
   ;	
   ;	
   ;	    for (i = 0; i < max; ++i) {
   ;	
	xor	si,si
	jmp	short @1@98
@1@50:
   ;	
   ;	        *(sieve + i) = 1;
   ;	
	mov	ax,si
	shl	ax,1
	mov	bx,word ptr [bp-10]
	add	bx,ax
	mov	word ptr [bx],1
	inc	si
@1@98:
	cmp	si,word ptr [bp-2]
	jl	short @1@50
   ;	
   ;	    }
   ;	
   ;	    *(sieve + 0) = 0;
   ;	
	mov	bx,word ptr [bp-10]
	mov	word ptr [bx],0
   ;	
   ;	    *(sieve + 1) = 0;
   ;	
	mov	bx,word ptr [bp-10]
	mov	word ptr [bx+2],0
   ;	
   ;	
   ;	    for (sp = 2; sp <= sqm; ++sp) {
   ;	
	mov	word ptr [bp-12],2
	jmp	short @1@290
@1@146:
   ;	
   ;	        if (*(sieve + sp) != 0) {
   ;	
	mov	ax,word ptr [bp-12]
	shl	ax,1
	mov	bx,word ptr [bp-10]
	add	bx,ax
	cmp	word ptr [bx],0
	je	short @1@266
   ;	
   ;	            int sc = sp + sp;
   ;	
	mov	ax,word ptr [bp-12]
	add	ax,word ptr [bp-12]
	mov	di,ax
   ;	
   ;	            for (sc = sp+sp; sc < max; sc = sc + sp) {
   ;	
	mov	ax,word ptr [bp-12]
	add	ax,word ptr [bp-12]
	mov	di,ax
	jmp	short @1@242
@1@194:
   ;	
   ;	                *(sieve + sc) = 0;
   ;	
	mov	ax,di
	shl	ax,1
	mov	bx,word ptr [bp-10]
	add	bx,ax
	mov	word ptr [bx],0
	mov	ax,di
	add	ax,word ptr [bp-12]
	mov	di,ax
@1@242:
	cmp	di,word ptr [bp-2]
	jl	short @1@194
@1@266:
	inc	word ptr [bp-12]
@1@290:
	mov	ax,word ptr [bp-12]
	cmp	ax,word ptr [bp-4]
	jle	short @1@146
   ;	
   ;	            }
   ;	        }
   ;	    }            
   ;	
   ;	    for (i = 0; i < max; ++i) {
   ;	
	xor	si,si
	jmp	short @1@410
@1@338:
   ;	
   ;	        if (*(sieve + i) == 1) {
   ;	
	mov	ax,si
	shl	ax,1
	mov	bx,word ptr [bp-10]
	add	bx,ax
	cmp	word ptr [bx],1
	jne	short @1@386
   ;	
   ;	            *(primes + pcount) = i;
   ;	
	mov	ax,word ptr [bp-14]
	shl	ax,1
	mov	bx,word ptr [bp-8]
	add	bx,ax
	mov	word ptr [bx],si
   ;	
   ;	            ++pcount;
   ;	
	inc	word ptr [bp-14]
@1@386:
	inc	si
@1@410:
	cmp	si,word ptr [bp-2]
	jl	short @1@338
   ;	
   ;	        }
   ;	    }
   ;	    
   ;	
   ;	    for (i = 0; i < pcount; ++i) {
   ;	
	xor	si,si
	jmp	short @1@506
@1@458:
   ;	
   ;	        printf("%d    %d\n", i + 1, *(primes + i));
   ;	
	mov	ax,si
	shl	ax,1
	mov	bx,word ptr [bp-8]
	add	bx,ax
	push	word ptr [bx]
	mov	ax,si
	inc	ax
	push	ax
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _printf
	add	sp,6
	inc	si
@1@506:
	cmp	si,word ptr [bp-14]
	jl	short @1@458
   ;	
   ;	    }
   ;	
   ;	    free(sieve);
   ;	
	push	word ptr [bp-10]
	call	near ptr _free
	pop	cx
   ;	
   ;	    free(primes);
   ;	
	push	word ptr [bp-8]
	call	near ptr _free
	pop	cx
   ;	
   ;	    return 0;
   ;	
	xor	ax,ax
	jmp	short @1@554
@1@554:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_main	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'%d    %d'
	db	10
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_s@	equ	s@
	public	_main
	extrn	_sqrt:near
	extrn	N_FTOL@:near
	extrn	_malloc:near
	extrn	_printf:near
	extrn	_free:near
	end
