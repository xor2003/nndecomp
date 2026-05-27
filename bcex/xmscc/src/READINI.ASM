	ifndef	??version
?debug	macro
	endm
	endif
	?debug	S "c:\common\readini.cpp"
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
	?debug	C E9F050FE7C15633A5C636F6D6D6F6E5C72656164696E692E637070
	?debug	C E9533752810F443A5C494E434C5544455C696F2E68
_BSS	ends
	?debug	C E9
_DATA	segment word public 'DATA'
s@	label	byte
_DATA	ends
_TEXT	segment	byte public 'CODE'
_TEXT	ends
	end
