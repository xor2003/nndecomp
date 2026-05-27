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
	?debug	S "c:\a005132c.cpp"
	?debug	C E93356FE7C0F633A5C61303035313332632E637070
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
_a	label	word
	db	2 dup (?)
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	int main() {
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
	push	si
	push	di
   ;	
   ;	    unsigned int max = 2000;
   ;	
	mov	word ptr [bp-2],2000
   ;	
   ;	    unsigned int n = 0;
   ;	
	xor	si,si
   ;	
   ;	    unsigned int a1, an;
   ;	    unsigned int seqlen = 0;
   ;	
	mov	word ptr [bp-6],0
   ;	
   ;	
   ;	    a = (unsigned int*)malloc((max+1)*sizeof(unsigned int*));
   ;	
	mov	ax,word ptr [bp-2]
	inc	ax
	shl	ax,1
	push	ax
	call	near ptr _malloc
	pop	cx
	mov	word ptr DGROUP:_a,ax
   ;	
   ;	
   ;	    *(a + 0) = 0;
   ;	
	mov	bx,word ptr DGROUP:_a
	mov	word ptr [bx],0
   ;	
   ;	    seqlen = 1;
   ;	
	mov	word ptr [bp-6],1
   ;	
   ;	
   ;	    for (n = 1; n < max; ++n) { 
   ;	
	mov	si,1
	jmp	short @1@170
@1@50:
   ;	
   ;	        a1 =*(a + n - 1);
   ;	
	mov	ax,si
	shl	ax,1
	mov	bx,word ptr DGROUP:_a
	add	bx,ax
	mov	ax,word ptr [bx-2]
	mov	word ptr [bp-4],ax
   ;	
   ;	        an = a1  - n;
   ;	
	mov	ax,word ptr [bp-4]
	sub	ax,si
	mov	di,ax
   ;	
   ;	        if ((a1 < n) || (isinsequence(an, seqlen) == 1)) { 
   ;	
	cmp	word ptr [bp-4],si
	jb	short @1@98
	push	word ptr [bp-6]
	push	di
	call	near ptr @isinsequence$quiui
	pop	cx
	pop	cx
	cmp	ax,1
	jne	short @1@122
@1@98:
   ;	
   ;	            an = a1 + n;
   ;	
	mov	ax,word ptr [bp-4]
	add	ax,si
	mov	di,ax
@1@122:
   ;	
   ;	        }
   ;	        *(a + n) = an;
   ;	
	mov	ax,si
	shl	ax,1
	mov	bx,word ptr DGROUP:_a
	add	bx,ax
	mov	word ptr [bx],di
   ;	
   ;	        ++seqlen;
   ;	
	inc	word ptr [bp-6]
   ;	
   ;	
   ;	        printf("%u  %u\n", n, an);
   ;	
	push	di
	push	si
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _printf
	add	sp,6
	inc	si
@1@170:
	cmp	si,word ptr [bp-2]
	jb	short @1@50
   ;	
   ;	    }
   ;	
   ;	    free (a);
   ;	
	push	word ptr DGROUP:_a
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
   ;	
   ;	unsigned int isinsequence(unsigned int bn, unsigned int sl) {
   ;	
	assume	cs:_TEXT
@isinsequence$quiui	proc	near
	push	bp
	mov	bp,sp
	push	si
	push	di
	mov	cx,word ptr [bp+4]
	mov	dx,word ptr [bp+6]
   ;	
   ;	    unsigned int found = 0;
   ;	
	xor	di,di
   ;	
   ;	    unsigned int i = 0;
   ;	
	xor	si,si
   ;	
   ;	    for (i = 0; i < sl; ++i) {
   ;	
	xor	si,si
	jmp	short @2@122
@2@50:
   ;	
   ;	        if (bn == *(a + i)) {
   ;	
	mov	ax,si
	shl	ax,1
	mov	bx,word ptr DGROUP:_a
	add	bx,ax
	mov	ax,word ptr [bx]
	cmp	ax,cx
	jne	short @2@98
   ;	
   ;	            found = 1;
   ;	
	mov	di,1
	jmp	short @2@146
@2@98:
	inc	si
@2@122:
	cmp	si,dx
	jb	short @2@50
@2@146:
   ;	
   ;	            break;
   ;	        }
   ;	    }
   ;	    return found;
   ;	
	mov	ax,di
	jmp	short @2@170
@2@170:
   ;	
   ;	}
   ;	
	pop	di
	pop	si
	pop	bp
	ret	
@isinsequence$quiui	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'%u  %u'
	db	10
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_s@	equ	s@
	public	_a
	public	_main
	extrn	_malloc:near
	public	@isinsequence$quiui
	extrn	_printf:near
	extrn	_free:near
	end
