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
	?debug	S "c:\a000045c.cpp"
	?debug	C E93356FE7C0F633A5C61303030303435632E637070
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
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
	sub	sp,8
	push	si
	push	di
   ;	
   ;	    const int max = 25;
   ;	
   ;	    unsigned int * a = (unsigned int*)malloc((max+1)*sizeof(unsigned int));
   ;	
	mov	ax,52
	push	ax
	call	near ptr _malloc
	pop	cx
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;	    int i = 0;
   ;	
	xor	si,si
   ;	
   ;	
   ;	    unsigned int fn = 0;             // f(n)
   ;	
	mov	word ptr [bp-4],0
   ;	
   ;	    unsigned int fn1 = 1;            // f(n-1)
   ;	
	mov	word ptr [bp-6],1
   ;	
   ;	    unsigned int fn2 = 0;            // f(n-2)
   ;	
	mov	word ptr [bp-8],0
   ;	
   ;	    unsigned int n = 2;
   ;	
	mov	di,2
   ;	
   ;	    *(a + 0) = fn2;
   ;	
	mov	bx,word ptr [bp-2]
	mov	ax,word ptr [bp-8]
	mov	word ptr [bx],ax
   ;	
   ;	    *(a + 1) = fn1;
   ;	
	mov	bx,word ptr [bp-2]
	mov	ax,word ptr [bp-6]
	mov	word ptr [bx+2],ax
	jmp	short @1@74
@1@50:
   ;	
   ;	
   ;	    while (n < max) {
   ;	        fn = fn1 + fn2; 
   ;	
	mov	ax,word ptr [bp-6]
	add	ax,word ptr [bp-8]
	mov	word ptr [bp-4],ax
   ;	
   ;	        *(a + n) = fn;
   ;	
	mov	ax,di
	shl	ax,1
	mov	bx,word ptr [bp-2]
	add	bx,ax
	mov	ax,word ptr [bp-4]
	mov	word ptr [bx],ax
   ;	
   ;	        fn2 = fn1;
   ;	
	mov	ax,word ptr [bp-6]
	mov	word ptr [bp-8],ax
   ;	
   ;	        fn1 = fn; 
   ;	
	mov	ax,word ptr [bp-4]
	mov	word ptr [bp-6],ax
   ;	
   ;	        ++n; 
   ;	
	inc	di
@1@74:
	cmp	di,25
	jb	short @1@50
   ;	
   ;	    }
   ;	
   ;	    for (i = 0; i < max; ++i) {
   ;	
	xor	si,si
	jmp	short @1@170
@1@122:
   ;	
   ;	        printf("%u    %u\n", i+1, *(a+i)); 
   ;	
	mov	ax,si
	shl	ax,1
	mov	bx,word ptr [bp-2]
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
@1@170:
	cmp	si,25
	jl	short @1@122
   ;	
   ;	    }
   ;	
   ;	    free(a);    
   ;	
	push	word ptr [bp-2]
	call	near ptr _free
	pop	cx
   ;	
   ;	    return 0;
   ;	
	xor	ax,ax
	jmp	short @1@218
@1@218:
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
	db	'%u    %u'
	db	10
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_s@	equ	s@
	public	_main
	extrn	_malloc:near
	extrn	_printf:near
	extrn	_free:near
	end
