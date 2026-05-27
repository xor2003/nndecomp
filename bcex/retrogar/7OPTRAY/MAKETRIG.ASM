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
	?debug	S "c:\maketrig.cpp"
	?debug	C E97050FE7C0F633A5C6D616B65747269672E637070
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
	?debug	C E95337528111443A5C494E434C5544455C6D6174682E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
	?debug	C E95337528113443A5C494E434C5544455C737472696E672E68
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
   ;	void main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,36
	push	si
	push	di
   ;	
   ;	{
   ;		printf("\nGenerating trig.h and trig.cpp fixed point math tables.\n\n");
   ;	
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _printf
	pop	cx
   ;	
   ;	
   ;		double radians = 0.0;
   ;	
	FLDZ	
	FSTP	qword ptr [bp-8]
   ;	
   ;		FILE* fname;
   ;		char hex[20];
   ;	
   ;		// create file trig.h for constants and macros:
   ;		fname = fopen("trig.h", "wt");
   ;	
	mov	ax,offset DGROUP:s@+66
	push	ax
	mov	ax,offset DGROUP:s@+59
	push	ax
	FWAIT	
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	di,ax
   ;	
   ;	
   ;		// macro definitions for trig functions:
   ;		fprintf(fname, "#define COS(X) cos_table[X & (NUMBER_OF_DEGREES - 1)]\n");
   ;	
	mov	ax,offset DGROUP:s@+69
	push	ax
	push	di
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;		fprintf(fname, "#define SIN(X) sin_table[X & (NUMBER_OF_DEGREES - 1)]\n");
   ;	
	mov	ax,offset DGROUP:s@+124
	push	ax
	push	di
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	
   ;		// constant definitions:
   ;		fprintf(fname, "\n\nconst NUMBER_OF_DEGREES = %i;\n", NUMBER_OF_DEGREES);
   ;	
	mov	ax,4096
	push	ax
	mov	ax,offset DGROUP:s@+179
	push	ax
	push	di
	call	near ptr _fprintf
	add	sp,6
   ;	
   ;		fprintf(fname, "const SHIFT = %d;\n", SHIFT);
   ;	
	mov	ax,16
	push	ax
	mov	ax,offset DGROUP:s@+212
	push	ax
	push	di
	call	near ptr _fprintf
	add	sp,6
   ;	
   ;		fprintf(fname, "const SHIFT_MULT = 1 << SHIFT;\n\n");
   ;	
	mov	ax,offset DGROUP:s@+231
	push	ax
	push	di
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	
   ;		// external table declarations:
   ;		fprintf(fname, "extern long cos_table[%d];\n", NUMBER_OF_DEGREES);
   ;	
	mov	ax,4096
	push	ax
	mov	ax,offset DGROUP:s@+264
	push	ax
	push	di
	call	near ptr _fprintf
	add	sp,6
   ;	
   ;		fprintf(fname, "extern long sin_table[%d];\n", NUMBER_OF_DEGREES);
   ;	
	mov	ax,4096
	push	ax
	mov	ax,offset DGROUP:s@+292
	push	ax
	push	di
	call	near ptr _fprintf
	add	sp,6
   ;	
   ;	
   ;		fclose(fname);
   ;	
	push	di
	call	near ptr _fclose
	pop	cx
   ;	
   ;	
   ;		// create file trig.cpp for data tables:
   ;		fname = fopen("trig.cpp", "wt");
   ;	
	mov	ax,offset DGROUP:s@+329
	push	ax
	mov	ax,offset DGROUP:s@+320
	push	ax
	call	near ptr _fopen
	pop	cx
	pop	cx
	mov	di,ax
   ;	
   ;		fprintf(fname, "\n//TRIG.CPP\n");
   ;	
	mov	ax,offset DGROUP:s@+332
	push	ax
	push	di
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;		fprintf(fname, "//\tComputer generated fixed point math tables\n\n");
   ;	
	mov	ax,offset DGROUP:s@+345
	push	ax
	push	di
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	
   ;		// create cosine table:
   ;		fprintf(fname, "long cos_table[%d] = {\n\t", NUMBER_OF_DEGREES);
   ;	
	mov	ax,4096
	push	ax
	mov	ax,offset DGROUP:s@+393
	push	ax
	push	di
	call	near ptr _fprintf
	add	sp,6
   ;	
   ;		int count = 0;
   ;	
	mov	word ptr [bp-10],0
   ;	
   ;	
   ;		printf("Cosine table");
   ;	
	mov	ax,offset DGROUP:s@+418
	push	ax
	call	near ptr _printf
	pop	cx
   ;	
   ;		// loop through 4096 degrees:
   ;		for(int i = 0; i < NUMBER_OF_DEGREES; i++)
   ;	
	xor	si,si
	jmp	@1@194
@1@50:
   ;	
   ;		{
   ;			if(i % 100 == 0 ) printf(".");
   ;	
	mov	ax,si
	mov	bx,100
	cwd	
	idiv	bx
	or	dx,dx
	jne	short @1@98
	mov	ax,offset DGROUP:s@+431
	push	ax
	call	near ptr _printf
	pop	cx
@1@98:
   ;	
   ;			// translate degrees into radians:
   ;			radians = (double)i / NUMBER_OF_DEGREES * 3.14159 * 2;
   ;	
	mov	word ptr [bp-12],si
	FILD	word ptr [bp-12]
	FDIV	dword ptr DGROUP:s@+433
	FMUL	qword ptr DGROUP:s@+437
	FMUL	dword ptr DGROUP:s@+445
	FSTP	qword ptr [bp-8]
	FWAIT	
   ;	
   ;	
   ;			// get cosine:
   ;			long temp_long = (long)(cos(radians) * SHIFT_MULT);
   ;	
	FLD	qword ptr [bp-8]
	add	sp,65528
	FSTP	qword ptr [bp-48]
	FWAIT	
	call	near ptr _cos
	add	sp,8
	FMUL	dword ptr DGROUP:s@+449
	call	near ptr N_FTOL@
	mov	word ptr [bp-16],ax
	mov	word ptr [bp-14],dx
   ;	
   ;	
   ;			// convert cosine to hexadecimal ASCII:
   ;			itoa(temp_long, hex, 16);
   ;	
	mov	ax,16
	push	ax
	lea	ax,word ptr [bp-36]
	push	ax
	push	word ptr [bp-16]
	call	near ptr _itoa
	add	sp,6
   ;	
   ;	
   ;			// print it to file:
   ;			fprintf(fname, "0x%s, ", hex);
   ;	
	lea	ax,word ptr [bp-36]
	push	ax
	mov	ax,offset DGROUP:s@+453
	push	ax
	push	di
	call	near ptr _fprintf
	add	sp,6
   ;	
   ;	
   ;			// output carriage return if eighth entry printed:
   ;			count++;
   ;	
	inc	word ptr [bp-10]
   ;	
   ;			if( count >= 8)
   ;	
	cmp	word ptr [bp-10],8
	jl	short @1@170
   ;	
   ;			{
   ;				fprintf(fname, "\n\t");
   ;	
	mov	ax,offset DGROUP:s@+460
	push	ax
	push	di
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;				count = 0;
   ;	
	mov	word ptr [bp-10],0
@1@170:
	inc	si
@1@194:
	cmp	si,4096
	jge	@@0
	jmp	@1@50
@@0:
   ;	
   ;			}
   ;		}
   ;		fprintf(fname, "};\n\n");
   ;	
	mov	ax,offset DGROUP:s@+463
	push	ax
	push	di
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	
   ;		printf("\n\nSine table");
   ;	
	mov	ax,offset DGROUP:s@+468
	push	ax
	call	near ptr _printf
	pop	cx
   ;	
   ;		// create sine table:
   ;		radians = 0.0;
   ;	
	FLDZ	
	FSTP	qword ptr [bp-8]
   ;	
   ;		fprintf(fname, "long sin_table[%d] = {\n\t", NUMBER_OF_DEGREES);
   ;	
	mov	ax,4096
	push	ax
	mov	ax,offset DGROUP:s@+481
	push	ax
	push	di
	FWAIT	
	call	near ptr _fprintf
	add	sp,6
   ;	
   ;		count = 0;
   ;	
	mov	word ptr [bp-10],0
   ;	
   ;	
   ;		// loop through 4096 degrees:
   ;		for(i = 0; i < NUMBER_OF_DEGREES; i++)
   ;	
	xor	si,si
	jmp	@1@386
@1@242:
   ;	
   ;		{
   ;			if(i % 100 == 0 ) printf(".");
   ;	
	mov	ax,si
	mov	bx,100
	cwd	
	idiv	bx
	or	dx,dx
	jne	short @1@290
	mov	ax,offset DGROUP:s@+506
	push	ax
	call	near ptr _printf
	pop	cx
@1@290:
   ;	
   ;			// translate degrees into radians:
   ;			radians = (double)i / NUMBER_OF_DEGREES * 3.14159 * 2;
   ;	
	mov	word ptr [bp-12],si
	FILD	word ptr [bp-12]
	FDIV	dword ptr DGROUP:s@+433
	FMUL	qword ptr DGROUP:s@+437
	FMUL	dword ptr DGROUP:s@+445
	FSTP	qword ptr [bp-8]
	FWAIT	
   ;	
   ;	
   ;			// get sine:
   ;			long temp_long = (long)(sin(radians) * SHIFT_MULT);
   ;	
	FLD	qword ptr [bp-8]
	add	sp,65528
	FSTP	qword ptr [bp-48]
	FWAIT	
	call	near ptr _sin
	add	sp,8
	FMUL	dword ptr DGROUP:s@+449
	call	near ptr N_FTOL@
	mov	word ptr [bp-16],ax
	mov	word ptr [bp-14],dx
   ;	
   ;	
   ;			// convert cosine to hexadecimal ASCII:
   ;			itoa(temp_long, hex, 16);
   ;	
	mov	ax,16
	push	ax
	lea	ax,word ptr [bp-36]
	push	ax
	push	word ptr [bp-16]
	call	near ptr _itoa
	add	sp,6
   ;	
   ;	
   ;			// print it to file:
   ;			fprintf(fname, "0x%s, ", hex);
   ;	
	lea	ax,word ptr [bp-36]
	push	ax
	mov	ax,offset DGROUP:s@+508
	push	ax
	push	di
	call	near ptr _fprintf
	add	sp,6
   ;	
   ;	
   ;			// output carriage return if eighth entry printed:
   ;			count++;
   ;	
	inc	word ptr [bp-10]
   ;	
   ;			if( count >= 8)
   ;	
	cmp	word ptr [bp-10],8
	jl	short @1@362
   ;	
   ;			{
   ;				fprintf(fname, "\n\t");
   ;	
	mov	ax,offset DGROUP:s@+515
	push	ax
	push	di
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;				count = 0;
   ;	
	mov	word ptr [bp-10],0
@1@362:
	inc	si
@1@386:
	cmp	si,4096
	jge	@@1
	jmp	@1@242
@@1:
   ;	
   ;			}
   ;		}
   ;		fprintf(fname, "};\n\n");
   ;	
	mov	ax,offset DGROUP:s@+518
	push	ax
	push	di
	call	near ptr _fprintf
	pop	cx
	pop	cx
   ;	
   ;	
   ;		fclose(fname);
   ;	
	push	di
	call	near ptr _fclose
	pop	cx
   ;	
   ;	
   ;		printf("\n\nAll done!\n\n");
   ;	
	mov	ax,offset DGROUP:s@+523
	push	ax
	call	near ptr _printf
	pop	cx
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
	db	10
	db	'Generating trig.h and trig.cpp fixed point math tables.'
	db	10
	db	10
	db	0
	db	'trig.h'
	db	0
	db	'wt'
	db	0
	db	'#define COS(X) cos_table[X & (NUMBER_OF_DEGREES - 1)]'
	db	10
	db	0
	db	'#define SIN(X) sin_table[X & (NUMBER_OF_DEGREES - 1)]'
	db	10
	db	0
	db	10
	db	10
	db	'const NUMBER_OF_DEGREES = %i;'
	db	10
	db	0
	db	'const SHIFT = %d;'
	db	10
	db	0
	db	'const SHIFT_MULT = 1 << SHIFT;'
	db	10
	db	10
	db	0
	db	'extern long cos_table[%d];'
	db	10
	db	0
	db	'extern long sin_table[%d];'
	db	10
	db	0
	db	'trig.cpp'
	db	0
	db	'wt'
	db	0
	db	10
	db	'//TRIG.CPP'
	db	10
	db	0
	db	'//'
	db	9
	db	'Computer generated fixed point math tables'
	db	10
	db	10
	db	0
	db	'long cos_table[%d] = {'
	db	10
	db	9
	db	0
	db	'Cosine table'
	db	0
	db	'.'
	db	0
	db	0
	db	0
	db	-128
	db	'En'
	db	-122
	db	27
	db	-16
	db	-7
	db	'!'
	db	9
	db	'@'
	db	0
	db	0
	db	0
	db	'@'
	db	0
	db	0
	db	-128
	db	'G0x%s, '
	db	0
	db	10
	db	9
	db	0
	db	'};'
	db	10
	db	10
	db	0
	db	10
	db	10
	db	'Sine table'
	db	0
	db	'long sin_table[%d] = {'
	db	10
	db	9
	db	0
	db	'.'
	db	0
	db	'0x%s, '
	db	0
	db	10
	db	9
	db	0
	db	'};'
	db	10
	db	10
	db	0
	db	10
	db	10
	db	'All done!'
	db	10
	db	10
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_s@	equ	s@
	public	_main
	extrn	_printf:near
	extrn	_fopen:near
	extrn	_fprintf:near
	extrn	_fclose:near
	extrn	_cos:near
	extrn	N_FTOL@:near
	extrn	_itoa:near
	extrn	_sin:near
	end
