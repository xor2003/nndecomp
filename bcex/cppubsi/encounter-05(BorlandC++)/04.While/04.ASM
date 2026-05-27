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
	?debug	S "c:\04.cpp"
	?debug	C E9B456FE7C09633A5C30342E637070
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
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
   ;	main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	push	si
   ;	
   ;	{
   ;	int bil=1;
   ;	
	mov	si,1
   ;	
   ;	clrscr();
   ;	
	call	near ptr _clrscr
	jmp	short @1@74
@1@50:
   ;	
   ;	while (bil<=10)
   ;	{
   ;	printf (" %d ",bil);
   ;	
	push	si
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _printf
	pop	cx
	pop	cx
   ;	
   ;	++bil;
   ;	
	inc	si
@1@74:
	cmp	si,10
	jle	short @1@50
   ;	
   ;	}
   ;	getch();
   ;	
	call	near ptr _getch
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_main	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	' %d '
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_s@	equ	s@
	public	_main
	extrn	_clrscr:near
	extrn	_printf:near
	extrn	_getch:near
	end
