        .MODEL MEDIUM

	public	ClipWd, ClipLn, XBgn, YBgn, SetOvrlyRp, FixEGA
.DATA	
ClipWd word 0
ClipLn word 0
XBgn word 0
YBgn word 0

        .CODE

SetOvrlyRp      PROC far
        retf
SetOvrlyRp      ENDP

FixEGA      PROC far
        retf
FixEGA      ENDP
        END



