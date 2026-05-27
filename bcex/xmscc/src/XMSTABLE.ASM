	ifndef	??version
?debug	macro
	endm
	endif
	?debug	S "c:\xms\xmstable.cpp"
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
	?debug	C E9F050FE7C13633A5C786D735C786D737461626C652E637070
	?debug	C E95337528110443A5C494E434C5544455C646F732E68
_BSS	ends
	?debug	C E9
_DATA	segment word public 'DATA'
s@	label	byte
_DATA	ends
_TEXT	segment	byte public 'CODE'
_TEXT	ends
	end
