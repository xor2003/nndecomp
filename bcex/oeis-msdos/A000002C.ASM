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
	?debug	S "c:\a000002c.cpp"
	?debug	C E93356FE7C0F633A5C61303030303032632E637070
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
	mov	di,ax
   ;	
   ;	
   ;	    int c = 1;                  // points to the length of the run
   ;	
	mov	word ptr [bp-2],1
   ;	
   ;	                                // about to be added            
   ;	                            
   ;	    int cc = 0;                 // points to the end of the current run             
   ;	
	xor	si,si
   ;	
   ;	
   ;	    int i = 0;
   ;	
	mov	word ptr [bp-4],0
   ;	
   ;	
   ;	    // seed the sequence
   ;	    
   ;	    *(a+0) = 1;
   ;	
	mov	word ptr [di],1
	jmp	short @1@170
@1@50:
   ;	
   ;	
   ;	    while (cc < max) {
   ;	        int d = *(a + cc);
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,word ptr [bx+di]
	mov	cx,ax
   ;	
   ;	        int e = 2;
   ;	
	mov	dx,2
   ;	
   ;	        if (d == 2) {           // if the current run is 2's, switch to 1's
   ;	
	cmp	cx,2
	jne	short @1@98
   ;	
   ;	            e = 1;
   ;	
	mov	dx,1
@1@98:
   ;	
   ;	        }
   ;	        cc = cc + 1;
   ;	
	mov	ax,si
	inc	ax
	mov	si,ax
   ;	
   ;	        *(a + cc) = e;
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,dx
	mov	word ptr [bx+di],ax
   ;	
   ;	        
   ;	        if (*(a + c) == 2) {
   ;	
	mov	bx,word ptr [bp-2]
	shl	bx,1
	cmp	word ptr [bx+di],2
	jne	short @1@146
   ;	
   ;	            cc = cc + 1;
   ;	
	mov	ax,si
	inc	ax
	mov	si,ax
   ;	
   ;	            *(a + cc) = e;
   ;	
	mov	bx,si
	shl	bx,1
	mov	ax,dx
	mov	word ptr [bx+di],ax
@1@146:
   ;	
   ;	        }
   ;	        c = c + 1;
   ;	
	mov	ax,word ptr [bp-2]
	inc	ax
	mov	word ptr [bp-2],ax
@1@170:
	cmp	si,50
	jl	short @1@50
   ;	
   ;	    }
   ;	
   ;	    for (i = 0; i < max; ++i) {
   ;	
	mov	word ptr [bp-4],0
	jmp	short @1@266
@1@218:
   ;	
   ;	        printf("%d    %d\n", i+1, *(a+i)); 
   ;	
	mov	bx,word ptr [bp-4]
	shl	bx,1
	push	word ptr [bx+di]
	mov	ax,word ptr [bp-4]
	inc	ax
	push	ax
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _printf
	add	sp,6
	inc	word ptr [bp-4]
@1@266:
	cmp	word ptr [bp-4],50
	jl	short @1@218
   ;	
   ;	    }
   ;	
   ;	    free(a);    
   ;	
	push	di
	call	near ptr _free
	pop	cx
   ;	
   ;	    return 0;
   ;	
	xor	ax,ax
	jmp	short @1@314
@1@314:
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