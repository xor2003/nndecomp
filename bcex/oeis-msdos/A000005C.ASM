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
	?debug	S "c:\a000005c.cpp"
	?debug	C E93356FE7C0F633A5C61303030303035632E637070
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
	sub	sp,4
	push	si
	push	di
   ;	
   ;	    const int max = 50;
   ;	    int * a = (int*)malloc((max+1)*sizeof(int));
   ;	
	mov	ax,102
	push	ax
	call	near ptr _malloc
	pop	cx
	mov	word ptr [bp-2],ax
   ;	
   ;	
   ;	    int i = 0;
   ;	
	xor	di,di
   ;	
   ;	
   ;	    for (i = 0; i < max; ++i) {
   ;	
	xor	di,di
	jmp	short @1@218
@1@50:
   ;	
   ;	        int count = 0;
   ;	
	xor	cx,cx
   ;	
   ;	        int j = 0;
   ;	
	xor	si,si
   ;	
   ;	        int n = i + 1;
   ;	
	mov	ax,di
	inc	ax
	mov	word ptr [bp-4],ax
   ;	
   ;	
   ;	        for (j = 1; j <= n; ++j) {
   ;	
	mov	si,1
	jmp	short @1@146
@1@74:
   ;	
   ;	            if ((n % j) == 0) {
   ;	
	mov	ax,word ptr [bp-4]
	cwd	
	idiv	si
	or	dx,dx
	jne	short @1@122
   ;	
   ;	                ++count;
   ;	
	inc	cx
@1@122:
	inc	si
@1@146:
	cmp	si,word ptr [bp-4]
	jle	short @1@74
   ;	
   ;	            }
   ;	        }            
   ;	
   ;	        *(a + i) = count;  
   ;	
	mov	ax,di
	shl	ax,1
	mov	bx,word ptr [bp-2]
	add	bx,ax
	mov	ax,cx
	mov	word ptr [bx],ax
	inc	di
@1@218:
	cmp	di,50
	jl	short @1@50
   ;	
   ;	    }
   ;	
   ;	    for (i = 0; i < max; ++i) {
   ;	
	xor	di,di
	jmp	short @1@314
@1@266:
   ;	
   ;	        printf("%d    %d\n", i+1, *(a+i)); 
   ;	
	mov	ax,di
	shl	ax,1
	mov	bx,word ptr [bp-2]
	add	bx,ax
	push	word ptr [bx]
	mov	ax,di
	inc	ax
	push	ax
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _printf
	add	sp,6
	inc	di
@1@314:
	cmp	di,50
	jl	short @1@266
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
	jmp	short @1@362
@1@362:
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
	extrn	_malloc:near
	extrn	_printf:near
	extrn	_free:near
	end
