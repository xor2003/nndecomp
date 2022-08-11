.AUTODEPEND

#		*Translator Definitions*
CC = bcc +CRC16.CFG
TASM = TASM
TLIB = tlib
TLINK = tlink
LIBPATH = C:\BORLANDC\LIB
INCLUDEPATH = C:\BORLANDC\INCLUDE


#		*Implicit Rules*
.c.obj:
  $(CC) -c {$< }

.cpp.obj:
  $(CC) -c {$< }

#		*List Macros*


EXE_dependencies =  \
 crc16.obj

#		*Explicit Rules*
crc16.exe: crc16.cfg $(EXE_dependencies)
  $(TLINK) /v/x/c/P-/L$(LIBPATH) @&&|
c0s.obj+
crc16.obj
crc16
		# no map file
emu.lib+
maths.lib+
cs.lib
|


#		*Individual File Dependencies*
crc16.obj: crc16.cfg crc16.cpp 

#		*Compiler Configuration File*
crc16.cfg: crc16.mak
  copy &&|
-v
-vi-
-wpro
-weas
-wpre
-I$(INCLUDEPATH)
-L$(LIBPATH)
| crc16.cfg


