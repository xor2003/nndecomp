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
	?debug	S "c:\a001047c.cpp"
	?debug	C E93356FE7C0F633A5C61303031303437632E637070
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
   ;	    const int max = 10;
   ;	
   ;	    unsigned int * a = (unsigned int*)malloc((max+1)*sizeof(unsigned int));
   ;	
	mov	ax,22
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
   ;	    int n = 0;
   ;	
	xor	si,si
	jmp	short @1@74
@1@50:
   ;	
   ;	
   ;	    while (n < max) {
   ;	        *(a + n) = pow(3,n) - pow(2,n);
   ;	
	mov	word ptr [bp-4],si
	FILD	word ptr [bp-4]
	add	sp,65528
	FSTP	qword ptr [bp-26]
	FLD	dword ptr DGROUP:s@
	add	sp,65528
	FSTP	qword ptr [bp-34]
	FWAIT	
	call	near ptr _pow
	add	sp,16
	FSTP	tbyte ptr [bp-14]
	mov	word ptr [bp-4],si
	FILD	word ptr [bp-4]
	add	sp,65528
	FSTP	qword ptr [bp-26]
	FLD	dword ptr DGROUP:s@+4
	add	sp,65528
	FSTP	qword ptr [bp-34]
	FWAIT	
	call	near ptr _pow
	add	sp,16
	FLD	tbyte ptr [bp-14]
	FSUBR	
	call	near ptr N_FTOL@
	mov	dx,si
	shl	dx,1
	mov	bx,word ptr [bp-2]
	add	bx,dx
	mov	word ptr [bx],ax
   ;	
   ;	        ++n; 
   ;	
	inc	si
@1@74:
	cmp	si,10
	jl	short @1@50
   ;	
   ;	    }
   ;	
   ;	    for (i = 0; i < max; ++i) {
   ;	
	xor	di,di
	jmp	short @1@170
@1@122:
   ;	
   ;	        printf("%u    %u\n", i+1, *(a+i)); 
   ;	
	mov	ax,di
	shl	ax,1
	mov	bx,word ptr [bp-2]
	add	bx,ax
	push	word ptr [bx]
	mov	ax,di
	inc	ax
	push	ax
	mov	ax,offset DGROUP:s@+8
	push	ax
	call	near ptr _printf
	add	sp,6
	inc	di
@1@170:
	cmp	di,10
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
	db	0
	db	0
	db	'@@'
	db	0
	db	0
	db	0
	db	'@%u    %u'
	db	10
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_s@	equ	s@
	public	_main
	extrn	_malloc:near
	extrn	_pow:near
	extrn	N_FTOL@:near
	extrn	_printf:near
	extrn	_free:near
	end
