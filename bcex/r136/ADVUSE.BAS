'
'
'Routine voor gebruik voorwerpen
'
'
'
'Beginroutines
'
IF ownnum = 0 THEN
   PRINT "Je hebt helemaal niets."
   GOTO exit.use
END IF
PRINT "Wat wil je gebruiken? ";
temp1 = keyinp(CSRLIN, POS(0), 26, ownnum, ownname$(), "1234567890")'   Input
beast(0).room = curroom'   "Monster-onafhankelijke" voorwerpen
IF beast(artuse(ownnr(temp2))).room <> curroom THEN '   Kijk of beest er is
   PRINT "Dat heeft geen zin."
   GOTO exit.use
END IF
'Spring naar juiste routine
ownnr(0) = 0'   Zet uitvluchtgetal op 0
ON ownnr(temp1) GOTO use.meat, use.suit, use.green, use.sword, use.bone, use.disk, use.hasj, use.red, use.cap
ownnr(0) = 9'   Zet uitvluchtgetal op 9
ON ownnr(temp1) - 9 GOTO use.bomb, use.light, use.bandage, use.fire, use.book, use.t.n.t, use.pattern, use.poison
ownnr(0) = 17'   Zet uitvluchtgetal op 17
ON ownnr(temp1) - 17 GOTO use.detonator, use.batteries, use.mask, use.paper, use.sex, use.blue, use.cookie, use.grenade
exit.use:
RETURN
'
'Vlees
'
use.meat:
FOR loopvar1 = 1 TO ownnum
   IF ownnr(loopvar1) = 1 THEN '   Zoek vlees...
      FOR loopvar2 = loopvar1 TO ownnum - 1
         SWAP ownnr(loopvar2), ownnr(loopvar2 + 1)'   ...en schuif voorwerpnr...
         SWAP ownname$(loopvar2), ownname$(loopvar2 + 1)'   ...en -beschrijving naar achteren
      NEXT loopvar2
      EXIT FOR
   END IF
NEXT loopvar1
PRINT "Wat is het andere ingredi‰nt? ";
temp2 = keyinp(CSRLIN, POS(0), 26, ownnum - 1, ownname$(), "1234567890")'   Input
IF ownnr(temp2) <> 7 THEN
   PRINT "Dat lijkt me geen goed idee."
   GOTO exit.use
END IF
beast(9).status = 2'   Zet barbecue-level
GOTO exit.use
'
'Pak
'
use.suit:
PRINT "Je hebt het hittepak al aan."
GOTO exit.use
'
'Groene kristal
'
use.green:
beast(13).status = beast(13).status + 1
artroom(3) = FALSE
GOTO exit.use
'
'Zwaard
'
use.sword:
IF beast(1).room <> curroom AND beast(3).room <> curroom THEN
   PRINT "Dat heeft geen zin."
   GOTO exit.use
END IF
'Zoek uit of het om hond of plant gaat
IF beast(1).room = curroom THEN
   temp2 = 1'   Hond
ELSE
   temp2 = 3'   Plant
END IF
IF beast(temp2).strike = 0 THEN
   PRINT "Het monster is al dood."
   GOTO exit.use
END IF
beast.hit:
IF beast(temp2).strike <= 2 THEN PRINT "Het monster is zwaar gewond en je baadt in zijn bloed."
PRINT "Je haalt uit met je zwaard ";
IF RND > .75 THEN
   PRINT "maar het monster ontwijkt."
ELSE
   PRINT "en je raakt het monster hard."
   beast(temp2).strike = beast(temp2).strike - 1
END IF
IF beast(temp2).strike = 0 THEN
   beast(temp2).status = 4
   GOTO exit.use
END IF
IF RND < .35 THEN
   PRINT "Je kunt nog een slag uitdelen. Wil je dat? ";
   temp2$ = ""
   WHILE UCASE$(temp2$) <> "J" AND UCASE$(temp2$) <> "N"
      temp2$ = INKEY$
   WEND
   PRINT temp2$
   IF UCASE$(temp2$) = "J" THEN GOTO beast.hit
END IF
GOTO exit.use
'
'Bot
'
use.bone:
beast(7).status = 2
GOTO exit.use
'
'Diskette
'
use.disk:
artroom(6) = FALSE
beast(12).status = 3
GOTO exit.use
'
'Hasj
'
use.hasj:
FOR loopvar1 = 1 TO ownnum
   IF ownnr(loopvar1) = 7 THEN '   Zoek hasj...
      FOR loopvar2 = loopvar1 TO ownnum - 1
         SWAP ownnr(loopvar2), ownnr(loopvar2 + 1)'   ...en schuif voorwerpnr...
         SWAP ownname$(loopvar2), ownname$(loopvar2 + 1)'   ...en -beschrijving naar achteren
      NEXT loopvar2
      EXIT FOR
   END IF
NEXT loopvar1
PRINT "Wat is het andere ingredi‰nt? ";
temp2 = keyinp(CSRLIN, POS(0), 26, ownnum - 1, ownname$(), "1234567890")'   Input
IF ownnr(temp2) <> 1 THEN
   PRINT "Dat lijkt me geen goed idee."
   GOTO exit.use
END IF
beast(9).status = 2'   Zet barbecue-level
GOTO exit.use
'
'Rood kristal
'
use.red:
beast(13).status = beast(13).status + 1
artroom(8) = FALSE
GOTO exit.use
'
'Slaapmuts
'
use.cap:
artroom(9) = FALSE
beast(5).status = 6
GOTO exit.use
'
'Bom
'
use.bomb:
artroom(10) = FALSE
beast(14).status = 3
GOTO exit.use
'
'Lamp
'
use.light:
lamptag = NOT lamptag'   Verander status lamp
PRINT "De lamp is nu ";
IF lamptag THEN
   PRINT "aan, en de bundel van het ding verlicht de omtrek."
ELSE
   PRINT "uit";
   IF curroom > 21 AND curroom <> 32 AND curroom <> 62 THEN
      PRINT ", en je ziet niets meer."
   ELSE
      PRINT "."
   END IF
END IF
GOTO exit.use
'
'Verband
'
use.bandage:
IF lifepoints = 20 THEN
   PRINT "Je bent nog helemaal heel!"
   GOTO exit.use
END IF
PRINT "Je pakt het verband en de pleisters en plaatst ze over je wonden. Je bijt even"
PRINT "op je lippen van de pijn als het verband je nog bloedende wonden raakt."
lifepoints = 20
artroom(12) = FALSE
PRINT
PRINT "Je bent weer zo goed als nieuw"
GOTO exit.use
'
'Vlammenwerper
'
use.fire:
artroom(13) = 0
beast(10).status = 2
GOTO exit.use
'
'Kookboek
'
use.book:
PRINT "Dat heeft geen zin"
GOTO exit.use
'
'T.N.T.
'
use.t.n.t:
PRINT "Je pakt een staafje en gooit het op de grond. Er volgt een explosie die samen"
PRINT "gaat met een harde knal. Je wordt even verblind door de flits van de ontplof-"
PRINT "fing. Door de klap val je even flauw."
lifepoints = lifepoints - 1'   Wond
GOTO exit.use
'
'Mosterdgaspatroon
'
use.pattern:
FOR loopvar1 = 1 TO ownnum
   IF ownnr(loopvar1) = 16 THEN '   Zoek mosterdgaspatroon...
      FOR loopvar2 = loopvar1 TO ownnum - 1
         SWAP ownnr(loopvar2), ownnr(loopvar2 + 1)'   ...en schuif voorwerpnr...
         SWAP ownname$(loopvar2), ownname$(loopvar2 + 1)'   ...en -beschrijving naar achteren
      NEXT loopvar2
      EXIT FOR
   END IF
NEXT loopvar1
PRINT "Waar wil je het mosterdgaspatroon mee gebruiken? ";
temp2 = keyinp(CSRLIN, POS(0), 26, ownnum - 1, ownname$(), "1234567890")'   Input
IF ownnr(temp2) <> 18 THEN
   PRINT "Dat lijkt me weinig resultaat hebben."
   GOTO exit.use
END IF
artroom(18) = FALSE
artroom(16) = FALSE
artroom(25) = TRUE
PRINT "Je plaatst de ontsteker op het mosterdgaspatroon. Na enig friemelen is het"
PRINT "resultaat een werkende mosterdgasgranaat."
GOTO exit.use
'
'Giftige vlees
'
use.poison
beast(4).status = 3
GOTO exit.use
'
'Ontsteker
'
use.detonator:
FOR loopvar1 = 1 TO ownnum
   IF ownnr(loopvar1) = 18 THEN '   Zoek ontsteker...
      FOR loopvar2 = loopvar1 TO ownnum - 1
         SWAP ownnr(loopvar2), ownnr(loopvar2 + 1)'   ...en schuif voorwerpnr...
         SWAP ownname$(loopvar2), ownname$(loopvar2 + 1)'   ...en -beschrijving naar achteren
      NEXT loopvar2
      EXIT FOR
   END IF
NEXT loopvar1
PRINT "Waar wil je de ontsteker mee gebruiken? ";
temp2 = keyinp(CSRLIN, POS(0), 26, ownnum - 1, ownname$(), "1234567890")'   Input
IF ownnr(temp2) <> 16 THEN
   PRINT "Dat lijkt me weinig resultaat hebben."
   GOTO exit.use
END IF
artroom(18) = FALSE
artroom(16) = FALSE
artroom(25) = TRUE
PRINT "Je plaatst de ontsteker op het mosterdgaspatroon. Na enig friemelen is het"
PRINT "resultaat een werkende mosterdgasgranaat."
GOTO exit.use
'
'Batterijen
'
FOR loopvar1 = 1 TO ownnum
   IF ownnr(loopvar1) = 19 THEN '   Zoek batterijen...
      FOR loopvar2 = loopvar1 TO ownnum - 1
         SWAP ownnr(loopvar2), ownnr(loopvar2 + 1)'   ...en schuif voorwerpnr...
         SWAP ownname$(loopvar2), ownname$(loopvar2 + 1)'   ...en -beschrijving naar achteren
      NEXT loopvar2
      EXIT FOR
   END IF
NEXT loopvar1
PRINT "Waar wil je de batterijen mee gebruiken? ";
temp2 = keyinp(CSRLIN, POS(0), 26, ownnum - 1, ownname$(), "1234567890")'   Input
IF ownnr(temp2) <> 11 THEN
   PRINT "Dat lijkt me weinig resultaat hebben."
   GOTO exit.use
END IF
artroom(19) = FALSE
lightpoints = TRUE
PRINT "Je stopt de batterijen in de zaklamp, waardoor de lichtbundel voor altijd zal"
PRINT "blijven schijnen."
GOTO exit.use
'
'Gasmasker
'
use.mask:
PRINT "Je hebt het gasmasker al op."
GOTO exit.use
'
'Papier
'
use.paper:
PRINT "Dat heeft geen zin."
GOTO exit.use
'
'Boekje
'
use.sex:
beast(2).status = 5
artroom(22) = FALSE
GOTO exit.use
'
'Blauw kristal
'
use.blue:
beast(13).status = beast(13).status + 1
artroom(23) = FALSE
GOTO exit.use
'
'Koekje
'
use.cookie:
beast(5).status = 4
artroom(24) = FALSE
GOTO exit.use
'
'Mosterdgasgranaat
'
use.grenade:
beast(6).status = 3
artroom(25) = FALSE
GOTO exit.use

