REM $INCLUDE: 'C:\QB\Q4T.BI'
DIM spin$(8, 2)
'Bovenspin
spin$(1, 1) = "  ‹‹‹        ‹ € ‹        ‹‹‹  "
spin$(2, 1) = " ‹ﬂ  ﬂﬂ‹‹  ‹ﬂ ﬂ€ﬂ ﬂ‹  ‹‹ﬂﬂ  ﬂ‹ "
spin$(3, 1) = "‹€ ‹‹‹‹  €€€ ﬂ ‹ ﬂ €€€  ‹‹‹‹ €‹"
spin$(4, 1) = "   €   ﬂﬂ€€€€‹€€€‹€€€€ﬂﬂ   €   "
spin$(5, 1) = " ‹€    ‹‹‹ﬂ€€€€€€€€€ﬂ‹‹‹    €‹ "
spin$(6, 1) = "   ‹ﬂﬂﬂ                 ﬂﬂﬂ‹   "
spin$(7, 1) = "  €                         €  "
spin$(8, 1) = " ﬂﬂ                         ﬂﬂ "
'Onderspin
spin$(1, 2) = "               €               "
spin$(2, 2) = "  €ﬂﬂ‹‹     ‹ﬂ‹€‹ﬂ‹     ‹‹ﬂﬂ€  "
spin$(3, 2) = " €     ﬂﬂ‹‹€ ‹ ﬂ ‹ €‹‹ﬂﬂ     € "
spin$(4, 2) = "ﬂﬂ €ﬂﬂﬂ‹‹€€€‹ ‹€‹ ‹€€€‹‹ﬂﬂﬂ€ ﬂﬂ"
spin$(5, 2) = "  ‹ﬂ     ﬂ€€€€€€€€€€€ﬂ     ﬂ‹  "
spin$(6, 2) = " ﬂﬂ ‹‹‹ﬂﬂﬂ ﬂﬂﬂﬂﬂﬂﬂﬂﬂ ﬂﬂﬂ‹‹‹ ﬂﬂ "
spin$(7, 2) = "  ‹ﬂ                       ﬂ‹  "
spin$(8, 2) = " ‹€                         €‹ "
'Het begin...
COLOR 0, 7: CLS
'Spin in scherm brengen
xpin% = Ctr(spin$(1, 1))
FOR loop1 = 8 TO 1 STEP -1
   FOR loop2 = 1 TO 2
      CALL Delay(.05, 0)
      FOR loop3 = loop1 TO 8
         y% = loop3 - loop1 + 1
         CALL PrtScrn(spin$(loop3, loop2), y%, xpin%, 112)
      NEXT loop3
   NEXT loop2
NEXT loop1
'Spin laten zakken
FOR loop1 = 1 TO 12
   CALL PrtScrn("               €               ", CINT(loop1), xpin%, 112)
   FOR loop2 = 1 TO 2
      CALL Delay(.05, 0)
      FOR loop3 = 1 TO 8
         y% = loop1 + loop3
         CALL PrtScrn(spin$(loop3, loop2), y%, xpin%, 112)
      NEXT loop3
   NEXT loop2
NEXT loop1
DIM rip$(7, 2)  'Letters
'R
rip$(1, 1) = "€ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹"
rip$(2, 1) = "€          €"
rip$(3, 1) = "€          €"
rip$(4, 1) = "€‹‹‹‹‹‹‹‹‹‹ﬂ"
rip$(5, 1) = "€     ﬂ‹    "
rip$(6, 1) = "€       ﬂ‹  "
rip$(7, 1) = "€         ﬂ‹"
'P
rip$(1, 2) = "€ﬂﬂﬂﬂﬂﬂﬂﬂﬂﬂ‹"
rip$(2, 2) = "€          €"
rip$(3, 2) = "€          €"
rip$(4, 2) = "€‹‹‹‹‹‹‹‹‹‹ﬂ"
rip$(5, 2) = "€           "
rip$(6, 2) = "€           "
rip$(7, 2) = "€           "
'Letters in beeld
letterlen = LEN(rip$(1, 1))
FOR loop1 = 1 TO letterlen
   FOR loop2 = 1 TO 7
      CALL PrtScrn(RIGHT$(rip$(loop2, 1), loop1), CINT(2 + loop2), CINT(1), 112)
      CALL PrtScrn(LEFT$(rip$(loop2, 2), loop1), CINT(2 + loop2), CINT(81 - loop1), 112)
   NEXT loop2
NEXT loop1
'Letters naar midden
FOR loop1 = 1 TO 20
   FOR loop2 = 1 TO 7
      CALL PrtScrn(" " + rip$(loop2, 1), CINT(2 + loop2), CINT(loop1), 112)
      CALL PrtScrn(rip$(loop2, 2) + " ", CINT(2 + loop2), CINT(81 - (letterlen + loop1)), 112)
   NEXT loop2
NEXT loop1
FOR loop2 = 1 TO 7
   CALL PrtScrn(rip$(loop2, 2) + " ", CINT(2 + loop2), CINT(81 - (letterlen + loop1)), 112)
   CALL PrtScrn(rip$(loop2, 2) + " ", CINT(2 + loop2), CINT(81 - (letterlen + loop1 + 1)), 112)
NEXT loop2
CALL Delay(.5, 0)
xi% = Ctr("  ")
CALL PrtScrn("ﬂ", 2, xi%, 112)
CALL PrtScrn("‹", 10, xi%, 112)
a$ = "(C) Copyright R.I.P."
b$ = "(C) COPYRIGHT R.I.P."
c$ = "(c) copyright r.i.p."
d$ = "(C) Copyright R.I.P.(C) COPYRIGHT R.I.P.(c) copyright r.i.p."
IF b$ <> UCASE$(a$) OR c$ <> LCASE$(a$) OR d$ <> a$ + b$ + c$ THEN
   LOCATE 23, 29
   COLOR 16, 7
   PRINT "COPYRIGHT IS GEWIJZIGD"
   CALL Delay(20, 0)
   COLOR 7, 0
   CLS
   END
END IF
CALL PrtScrn(a$, 23, 30, 112)
CALL Delay(2.5, 0)
CALL PrtScrn("                               ", 1, xpin%, 112)
CALL PrtScrn("                               ", 2, xpin%, 112)
FOR loop1 = 10 TO 20
   CALL PrtScrn("                               ", CINT(loop1), xpin%, 112)
NEXT loop1
changex% = Ctr("   ")
CALL PrtScrn("‹€   ‹ﬂﬂﬂﬂﬂ‹   ‹ﬂﬂﬂﬂﬂ‹", 3, changex%, 112)
CALL PrtScrn(" €         €   €      ", 4, changex%, 112)
CALL PrtScrn(" €         €   €      ", 5, changex%, 112)
CALL PrtScrn(" €    ﬂﬂﬂﬂﬂ‹   €ﬂﬂﬂﬂﬂ‹", 6, changex%, 112)
CALL PrtScrn(" €         €   €     €", 7, changex%, 112)
CALL PrtScrn(" €         €   €     €", 8, changex%, 112)
CALL PrtScrn(" €   ﬂ‹‹‹‹‹ﬂ   ﬂ‹‹‹‹‹ﬂ", 9, changex%, 112)
CALL Delay(2.5, 0)
temp$ = "Programmering:"
tempx% = Ctr(temp$)
CALL PrtScrn(temp$, 13, tempx%, 112)
temp$ = "Rutger van Bergen"
tempx% = Ctr(temp$)
CALL PrtScrn(temp$, 14, tempx%, 112)
temp$ = "Ontwerp:"
tempx% = Ctr(temp$)
CALL PrtScrn(temp$, 16, tempx%, 112)
temp$ = "Peter Wouda"
tempx% = Ctr(temp$)
CALL PrtScrn(temp$, 17, tempx%, 112)
CALL Delay(2.5, 0)
COLOR 7, 0
CLS
CLEAR

