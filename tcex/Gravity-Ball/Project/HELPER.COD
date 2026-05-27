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
	?debug	S "c:\helper.cpp"
	?debug	C E95657FE7C0D633A5C68656C7065722E637070
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
	?debug	C E95337528110443A5C494E434C5544455C6D656D2E68
	?debug	C E95337528113443A5C494E434C5544455C737472696E672E68
	?debug	C E95337528115443A5C494E434C5544455C67726170686963732E68
	?debug	C E95337528114443A5C494E434C5544455C70726F636573732E68
	?debug	C E95337528112443A5C494E434C5544455C737464696F2E68
	?debug	C E95337528111443A5C494E434C5544455C74696D652E68
	?debug	C E95337528112443A5C494E434C5544455C63747970652E68
	?debug	C E95337528113443A5C494E434C5544455C7374646C69622E68
	?debug	C E95337528110443A5C494E434C5544455C646F732E68
	?debug	C E95337528112443A5C494E434C5544455C636F6E696F2E68
	?debug	C E95337528114443A5C494E434C5544455C6673747265616D2E68
	?debug	C E95337528115443A5C494E434C5544455C696F73747265616D2E68
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
_DATA	segment word public 'DATA'
_Folder	label	word
	db	1536 dup (?)
_DATA	ends
_BSS	segment word public 'BSS'
_BSS	ends
_DATA	segment word public 'DATA'
_Dat	label	word
	db	4096 dup (?)
_DATA	ends
_BSS	segment word public 'BSS'
_BSS	ends
_DATA	segment word public 'DATA'
_Key	label	word
	db	6 dup (?)
_DATA	ends
_BSS	segment word public 'BSS'
_BSS	ends
_DATA	segment word public 'DATA'
_Graphics	label	word
	db	4 dup (?)
_DATA	ends
_BSS	segment word public 'BSS'
_BSS	ends
_DATA	segment word public 'DATA'
_Files	label	word
	db	4 dup (?)
_DATA	ends
_BSS	segment word public 'BSS'
_BSS	ends
_INIT_	segment word public 'INITDATA'
	db	0
	db	32
	dd	@_STCON_$qv
_INIT_	ends
_BSS	segment word public 'BSS'
_BSS	ends
_TEXT	segment byte public 'CODE'
	assume	cs:_TEXT
@_STCON_$qv	proc	near
	push	bp
	mov	bp,sp
	mov	byte ptr DGROUP:_Folder,0
	mov	byte ptr DGROUP:_Folder+512,0
	mov	byte ptr DGROUP:_Folder+1024,0
	mov	ax,offset DGROUP:s@
	push	ax
	mov	ax,offset DGROUP:_Folder
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
	mov	ax,offset DGROUP:s@+10
	push	ax
	mov	ax,offset DGROUP:_Folder+512
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
	mov	ax,offset DGROUP:s@+19
	push	ax
	mov	ax,offset DGROUP:_Folder+1024
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
	mov	byte ptr DGROUP:_Dat,0
	mov	byte ptr DGROUP:_Dat+512,0
	mov	byte ptr DGROUP:_Dat+1024,0
	mov	byte ptr DGROUP:_Dat+1536,0
	mov	byte ptr DGROUP:_Dat+2048,0
	mov	byte ptr DGROUP:_Dat+2560,0
	mov	byte ptr DGROUP:_Dat+3072,0
	mov	byte ptr DGROUP:_Dat+3584,0
	mov	ax,offset DGROUP:s@+42
	push	ax
	mov	ax,offset DGROUP:_Dat+512
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
	mov	ax,offset DGROUP:s@+58
	push	ax
	mov	ax,offset DGROUP:_Dat
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
	mov	ax,offset DGROUP:s@+70
	push	ax
	mov	ax,offset DGROUP:_Dat+1024
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
	mov	ax,offset DGROUP:s@+89
	push	ax
	mov	ax,offset DGROUP:_Dat+1536
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
	mov	ax,offset DGROUP:s@+113
	push	ax
	mov	ax,offset DGROUP:_Dat+2048
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
	mov	ax,offset DGROUP:s@+132
	push	ax
	mov	ax,offset DGROUP:_Dat+2560
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
	mov	ax,offset DGROUP:s@+156
	push	ax
	mov	ax,offset DGROUP:_Dat+3072
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
	mov	ax,offset DGROUP:s@+169
	push	ax
	mov	ax,offset DGROUP:_Dat+3584
	push	ax
	call	near ptr _strcpy
	pop	cx
	pop	cx
	mov	byte ptr DGROUP:_Key,8
	mov	byte ptr DGROUP:_Key+1,72
	mov	byte ptr DGROUP:_Key+2,27
	mov	byte ptr DGROUP:_Key+4,255
	mov	byte ptr DGROUP:_Key+3,13
	mov	byte ptr DGROUP:_Key+5,9
	mov	word ptr DGROUP:_Graphics,9
	mov	word ptr DGROUP:_Graphics+2,1
	mov	word ptr DGROUP:_Files,1
	mov	word ptr DGROUP:_Files+2,0
	pop	bp
	ret	
@_STCON_$qv	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'USERS.DAT'
	db	0
	db	'LOGS.DAT'
	db	0
	db	'C:\TC\BIN\LEVELS\START'
	db	0
	db	'COLLECTIBLE.DAT'
	db	0
	db	'TERRAIN.DAT'
	db	0
	db	'POSITIVE_POINT.DAT'
	db	0
	db	'MEGA_POSITIVE_POINT.DAT'
	db	0
	db	'NEGATIVE_POINT.DAT'
	db	0
	db	'MEGA_NEGATIVE_POINT.DAT'
	db	0
	db	'TELEPORT.DAT'
	db	0
	db	'VTERRAIN.DAT'
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
_s@	equ	s@
	$comm	@ios@basefield,near,4,1
	$comm	@ios@adjustfield,near,4,1
	$comm	@ios@floatfield,near,4,1
	$comm	@ios@stdioflush,near,2,1
	$comm	@ios@nextbit,near,4,1
	$comm	@ios@usercount,near,2,1
	$comm	@filebuf@openprot,near,2,1
	public	_Folder
	public	_Dat
	public	_Key
	public	_Graphics
	public	_Files
	extrn	_strcpy:near
	end
