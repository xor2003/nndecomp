	ifndef	??version
?debug	macro
	endm
	endif
	?debug	S "c:\src\optimize.cpp"
_TEXT	segment	byte public 'CODE'
DGROUP	group	_DATA,_BSS
	assume	cs:_TEXT,ds:DGROUP,ss:DGROUP
_TEXT	ends
_DATA	segment word public 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public 'BSS'
b@	label	byte
b@w	label	word
	?debug	C E91C53FE7C13633A5C7372635C6F7074696D697A652E637070
	?debug	C E95337528113443A5C494E434C5544455C737472696E672E68
_BSS	ends
	?debug	C E9
_DATA	segment word public 'DATA'
s@	label	byte
_DATA	ends
_TEXT	segment	byte public 'CODE'
_TEXT	ends
	end
