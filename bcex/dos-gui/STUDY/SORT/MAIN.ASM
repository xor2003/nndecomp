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
	?debug	S "c:\main.cpp"
	?debug	C E97655FE7C0B633A5C6D61696E2E637070
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
	?debug	C E97655FE7C08627562626C652E68
	?debug	C E97655FE7C07717569636B2E68
	?debug	C E97655FE7C0873656C6563742E68
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
	sub	sp,20
	push	si
   ;	
   ;		int valores[10];
   ;		int i;
   ;	
   ;		for (i = 0; i < sizeof(valores) / sizeof(int); i++) {
   ;	
	xor	si,si
	jmp	short @1@98
@1@50:
   ;	
   ;			valores[i] = rand() % 100;
   ;	
	call	near ptr _rand
	mov	bx,100
	cwd	
	idiv	bx
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-20]
	add	bx,ax
	mov	word ptr [bx],dx
	inc	si
@1@98:
	cmp	si,10
	jb	short @1@50
   ;	
   ;		}
   ;	
   ;		printf("Before\n");
   ;	
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _printf
	pop	cx
   ;	
   ;		for (i = 0; i < 10; i++) {
   ;	
	xor	si,si
	jmp	short @1@194
@1@146:
   ;	
   ;			printf("Value %i\n", valores[i]);
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-20]
	add	bx,ax
	push	word ptr [bx]
	mov	ax,offset DGROUP:s@+8
	push	ax
	call	near ptr _printf
	pop	cx
	pop	cx
	inc	si
@1@194:
	cmp	si,10
	jl	short @1@146
   ;	
   ;		}
   ;	
   ;		//quick_sort(valores, 10);
   ;		//bubble_sort(valores, 10);
   ;		selection_sort(valores, 10);
   ;	
	mov	ax,10
	push	ax
	lea	ax,word ptr [bp-20]
	push	ax
	call	near ptr @selection_sort$qpii
	pop	cx
	pop	cx
   ;	
   ;	
   ;		printf("\nAfter\n");
   ;	
	mov	ax,offset DGROUP:s@+18
	push	ax
	call	near ptr _printf
	pop	cx
   ;	
   ;		for (i = 0; i < 10; i++) {
   ;	
	xor	si,si
	jmp	short @1@290
@1@242:
   ;	
   ;			printf("Value %i\n", valores[i]);
   ;	
	mov	ax,si
	shl	ax,1
	lea	bx,word ptr [bp-20]
	add	bx,ax
	push	word ptr [bx]
	mov	ax,offset DGROUP:s@+26
	push	ax
	call	near ptr _printf
	pop	cx
	pop	cx
	inc	si
@1@290:
	cmp	si,10
	jl	short @1@242
   ;	
   ;		}
   ;	
   ;		return 0;
   ;	
	xor	ax,ax
	jmp	short @1@338
@1@338:
   ;	
   ;	}
   ;	
	pop	si
	mov	sp,bp
	pop	bp
	ret	
_main	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'Before'
	db	10
	db	0
	db	'Value %i'
	db	10
	db	0
	db	10
	db	'After'
	db	10
	db	0
	db	'Value %i'
	db	10
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_s@	equ	s@
	public	_main
	extrn	_rand:near
	extrn	_printf:near
	extrn	@selection_sort$qpii:near
	end
