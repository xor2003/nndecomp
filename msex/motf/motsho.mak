PROJ	=MOTSHO
DEBUG	=1
CC	=qcl
CFLAGS_G	= /AM /W1 /Ze /Fc
CFLAGS_D	= /Zi /Gi$(PROJ).mdt /Od 
CFLAGS_R	= /Od /DNDEBUG 
CFLAGS	=$(CFLAGS_G) $(CFLAGS_D)
LFLAGS_G	= /CP:0xfff /NOI /SE:0x80 /ST:0x3a98 
LFLAGS_D	= /CO /INCR 
LFLAGS_R	= 
LFLAGS	=$(LFLAGS_G) $(LFLAGS_D)
RUNFLAGS	=
OBJS_EXT = 	
LIBS_EXT = 	

.asm.obj: ; $(AS) $(AFLAGS) -c $*.asm

all:	$(PROJ).EXE

motsho.obj:	motsho.c $(H)

mouse.obj:	mouse.c $(H)

motfsm.obj:	motfsm.c $(H)

$(PROJ).EXE:	motsho.obj mouse.obj motfsm.obj $(OBJS_EXT)
	echo >NUL @<<$(PROJ).crf
motsho.obj +
mouse.obj +
motfsm.obj +
$(OBJS_EXT)
$(PROJ).EXE

$(LIBS_EXT);
<<
	ilink -a -e "qlink $(LFLAGS) @$(PROJ).crf" $(PROJ)

run: $(PROJ).EXE
	$(PROJ) $(RUNFLAGS)

