'
'
'Programma initialisatie
'
'
'
'Initialiseer variabelen
'
DEFINT A-Z
RESTORE PROGDATA
DIM cmd$(12), prewrd$(6)
DIM artname$(25), artdescrib$(25), artroom(25), artuse(25)
DIM roomname$(80), roomdescrib$(80), roomconnect(80, 6)
TYPE beasttype
   room     AS INTEGER
   strike   AS INTEGER
   status   AS INTEGER
END TYPE
DIM beast(16) AS beasttype
DIM paperroute(6)
'
'Algemeen
'
'Commando's
FOR loopvar1 = 1 TO 12
   READ temp$
   cmd$(loopvar1) = temp$
NEXT loopvar1
'Voorvoegsels
FOR loopvar1 = 1 TO 6
   READ temp$
   prewrd$(loopvar1) = decode$(temp$)
NEXT loopvar1
'
'Voorwerpen
'
'Namen
FOR loopvar1 = 1 TO 25
   READ temp$
   artname$(loopvar1) = decode$(temp$)
NEXT loopvar1
'Beschrijvingen
FOR loopvar1 = 1 TO 25
   READ temp$
   artdescrib$(loopvar1) = decode$(temp$)
   CALL setlf(artdescrib$(loopvar1))   'Zet * om in LF (ASCII 13)
NEXT loopvar1
'Beginruimten
FOR loopvar1 = 1 TO 25
   READ temp
   artroom(loopvar1) = temp
NEXT loopvar1
'Gebruiksmogelijkheden
FOR loopvar1 = 1 TO 25
   READ temp
   artuse(loopvar1) = temp
NEXT loopvar1
'
'Ruimten
'
'Namen
FOR loopvar1 = 1 TO 80
   READ temp$
   roomname$(loopvar1) = decode$(temp$)
NEXT loopvar1
'Beschrijvingen
FOR loopvar1 = 1 TO 80
   READ temp$
   roomdescrib$(loopvar1) = decode$(temp$)
   CALL setlf(roomdescrib$(loopvar1))   'Zet * om in LF (ASCII 13)
NEXT loopvar1
'
'Niet-meeneembare voorwerpen
'
'Beginruimten
FOR loopvar1 = 1 TO 16
   READ temp
   beast(loopvar1).room = temp
NEXT loopvar1
'Aantal slagen
FOR loopvar1 = 1 TO 16
   READ temp
   beast(loopvar1).strike = temp
NEXT loopvar1
'Huidige status
FOR loopvar1 = 1 TO 16
   beast(loopvar1).status = 1
NEXT loopvar1
'
'Verbindingen
'
'Verbindingen tussen ruimten
FOR loopvar1 = 1 TO 80
   roomconnect(loopvar1, 1) = loopvar1 + 1   'Verbindingen naar oosten
   roomconnect(loopvar1, 2) = loopvar1 - 1   'Verbindingen naar westen
   roomconnect(loopvar1, 3) = loopvar1 - 5   'Verbindingen naar noorden
   roomconnect(loopvar1, 4) = loopvar1 + 5   'Verbindingen naar zuiden
NEXT loopvar1
'Scheiding tussen lagen (4 * 5)
FOR loopvar1 = 0 TO 80 STEP 20
   FOR loopvar2 = 1 TO 16 STEP 5
      roomconnect(loopvar1 + loopvar2 + 4, 1) = 0   'Blokkeer oosten
      roomconnect(loopvar1 + loopvar2, 2) = 0   'Blokkeer westen
   NEXT loopvar2
   FOR loopvar2 = 1 TO 5
      roomconnect(loopvar1 + loopvar2, 3) = 0   'Blokkeer noorden
      roomconnect(loopvar1 + loopvar2 + 15, 4) = 0   'Blokkeer zuiden
   NEXT loopvar2
NEXT loopvar1
'Verbindingen tussen lagen
FOR loopvar1 = 1 TO 15
   READ temp(1)
   READ temp(2)
   READ temp(3)
   roomconnect(temp(1), temp(2)) = temp(3)
NEXT loopvar1
'Geblokkeerde en eenrichtingswegen
FOR loopvar1 = 1 TO 68
   READ temp(1)
   READ temp(2)
   roomconnect(temp(1), temp(2)) = 0
NEXT loopvar1
'Papier-route
FOR loopvar1 = 1 TO 6
   READ temp
   paperroute(loopvar1) = temp
NEXT loopvar1
'
'Overige variabelen
'
CONST false = 0, true = -1
curroom = 1   'Huidige ruimte speler
oldroom = 1   'Vorige ruimte
lamptag = false   'Status lamp (FALSE = UIT, TRUE = AAN)
paperadv = 0   'Vordering juiste papierroute
ownnum = 0   'Aantal voorwerpen in bezit
DIM ownname$(10)'   Omschrijvingen voorwerpen in bezit
DIM ownnr(10)'   Nummers voorwerpen in bezit
'Aantal lussen per seconde
temp1$ = TIME$
DO: LOOP WHILE temp1$ = TIME$
temp1$ = TIME$
DO
   clock = clock + 1
LOOP WHILE temp1$ = TIME$

