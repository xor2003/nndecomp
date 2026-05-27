;	Static Name Aliases
;
	TITLE   C:\INIT.C
	.8087
INCLUDELIB	SLIBCE
_TEXT	SEGMENT  WORD PUBLIC 'CODE'
_TEXT	ENDS
_DATA	SEGMENT  WORD PUBLIC 'DATA'
_DATA	ENDS
CONST	SEGMENT  WORD PUBLIC 'CONST'
CONST	ENDS
_BSS	SEGMENT  WORD PUBLIC 'BSS'
_BSS	ENDS
DGROUP	GROUP	CONST, _BSS, _DATA
	ASSUME DS: DGROUP, SS: DGROUP
EXTRN	_convallocate:NEAR
EXTRN	_xmsallocate:NEAR
EXTRN	_kgif:NEAR
EXTRN	__dos_setvect:NEAR
EXTRN	_time:NEAR
EXTRN	__enable:NEAR
EXTRN	_setupmouse:NEAR
EXTRN	_printf:NEAR
EXTRN	_close:NEAR
EXTRN	_exit:NEAR
EXTRN	_keyhandler:FAR
EXTRN	__aNchkstk:NEAR
EXTRN	_open:NEAR
EXTRN	_read:NEAR
EXTRN	_divzerohandler:FAR
EXTRN	_loadtables:NEAR
EXTRN	__disable:NEAR
EXTRN	_srand:NEAR
EXTRN	_loadwalls:NEAR
EXTRN	_reset_dsp:NEAR
EXTRN	_loadmusic:NEAR
EXTRN	_musicon:NEAR
EXTRN	_outp:NEAR
EXTRN	_musicoff:NEAR
EXTRN	_fade:NEAR
EXTRN	__dos_getvect:NEAR
EXTRN	_emmallocate:NEAR
EXTRN	_palette:BYTE
EXTRN	_speed:WORD
EXTRN	_hiscorenamstat:BYTE
EXTRN	_note:WORD
EXTRN	_lastunlock:WORD
EXTRN	_paldef:BYTE
EXTRN	_lastshoot:WORD
EXTRN	_saidwelcome:WORD
EXTRN	_memtype:BYTE
EXTRN	_convavailpages:WORD
EXTRN	_convwalls:WORD
EXTRN	_cheatenable:WORD
EXTRN	_oldlogpage:WORD
EXTRN	_oldphyspage:WORD
EXTRN	_snd:WORD
EXTRN	_oldsourhand:WORD
EXTRN	_lastsoundnum:WORD
EXTRN	_emmhandle:WORD
EXTRN	_speechstatus:WORD
EXTRN	_sndaddr:DWORD
EXTRN	_emmpageframe:WORD
EXTRN	_emswalls:WORD
EXTRN	_xmshandle:WORD
EXTRN	_xmspageframe:WORD
EXTRN	_times90:BYTE
EXTRN	_vms:WORD
EXTRN	_less64inc:BYTE
EXTRN	_xmswalls:WORD
EXTRN	_lzwbuf:WORD
EXTRN	_moustat:WORD
EXTRN	_pic:WORD
EXTRN	_walseg:BYTE
EXTRN	_oldsouroff:DWORD
EXTRN	_bstatus:WORD
EXTRN	_joyx1:WORD
EXTRN	_boleng:BYTE
EXTRN	_joyy1:WORD
EXTRN	_joyx2:WORD
_BSS      SEGMENT
COMM NEAR	_oldkeyhandler:	BYTE:	 4
_BSS      ENDS
EXTRN	_joyy2:WORD
EXTRN	_walrec:BYTE
EXTRN	_joyx3:WORD
EXTRN	_numcells:WORD
_BSS      SEGMENT
COMM NEAR	_oldhand:	BYTE:	 4
_BSS      ENDS
EXTRN	_joyy3:WORD
_BSS      SEGMENT
COMM NEAR	_olddivzerohandler:	BYTE:	 4
_BSS      ENDS
EXTRN	_joystat:WORD
EXTRN	_keystatus:BYTE
EXTRN	_clockspeed:WORD
EXTRN	_slot