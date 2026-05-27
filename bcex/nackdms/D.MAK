T=ackmouse.obj
C=ackmouse.c
D=bcc -c -ml -3 -O2 -G ackmouse.c
T=demord.obj
C=demord.c
C=ack3d.h
C=acksnd.h
D=bcc -c -ml -3 -O2 -G demord.c
T=demo.exe
C=demo.c
C=demord.obj
C=ackmouse.obj
C=ack3d.h
C=acksnd.h
C=demo.h
C=ack3dl.lib
D=bcc -ml -3 -O2 -G demo.c demord.obj ackmouse.obj ack3dl.lib

