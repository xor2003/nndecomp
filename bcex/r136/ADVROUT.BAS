'
'
'Algemene programma-routines
'
'
'
'Invoerroutine: KEYINP
'
'Heen
'
'LINEPOS:   Y-coordinaat van het beginpunt van de invoer.
'CURSORPOS: X-coordinaat van het beginpunt van de invoer.
'OPTWIDTH:  Maximaal aantal af te beelden tekens van elk element van
'           OPTARRAY$() in optie-overzicht.
'ELEMENTS:  Aantal elementen waaruit gekozen kan worden (kleiner of gelijk
'           aan het aantal elementen van OPTARRAY$()).
'OPTARRAY$():  Naam van de array met als elementen de tekst die bij elke
'              mogelijke keuze hoort.
'OPTSELECT$:   String met tekens waarmee de elementen uit OPTARRAY$() gekozen
'              kunnen worden (1 teken per element).
'
'Terug
'
'-:   Nummer van het gekozen element.
'LINEPOS:   Ongewijzigd.
'CURSORPOS: Ongewijzigd.
'OPTWIDTH:  Ongewijzigd.
'ELEMENTS:  Ongewijzigd.
'OPTARRAY$():  Ongewijzigd.
'OPTSELECT$:   Ongewijzigd.
'
DECLARE FUNCTION KEYINP (linepos, cursorpos, optwidth, elements, optarray$(), optselect$)
'
'Keuzewindow: OPTIONWINDOW
'
'Heen
'
'Y:   Y-coordinaat van de linkerbovenhoek van het window.
'X:   X-coordinaat van de linkerbovenhoek van het window.
'OPTWIDTH:  Maximaal aantal af te beelden tekens van elk element van
'           OPTARRAY$().
'ELEMENTS:  Aantal elementen die moeten worden afgedrukt (kleiner of gelijk
'           aan het aantal elementen van OPTARRAY$()).
'OPTARRAY$():  Naam van de array met als elementen de tekst die bij elke
'              optie hoort.
'OPTSELECT$:   String met tekens die voor de elementen van optarray$() gezet   
'              moeten worden (1 teken per element).
'
'Terug
'
'Y:   Ongewijzigd.
'X:   Ongewijzigd.
'OPTWIDTH:  Ongewijzigd.
'ELEMENTS:  Ongewijzigd.
'OPTARRAY$():  Ongewijzigd.
'OPTSELECT$:   Ongewijzigd.
'
DECLARE SUB optionwindow (y, x, optwidth, elements, optarray$(), optselect$)
'
'Window tekenen: SETWIN
'
'Heen
'
'Y:   Y-coordinaat van de linkerbovenhoek van het window.
'X:   X-coordinaat van de linkerbovenhoek van het window.
'Y2:  Y-coordinaat van de rechterbenedenhoek van het window.
'X2:  X-coordinaat van de rechterbenedenhoek van het window.
'
'Terug
'
'Y:   Ongewijzigd.
'X:   Ongewijzigd.
'Y2:  Ongewijzigd.
'X2:  Ongewijzigd.
'
DECLARE SUB setwin (y, x, y2, x2)
'
'Onderdelen van het scherm in een array opslaan of herstellen: SAVESCR
'
'Heen
'
'TAG: 1: Schermgedeelte opslaan in SCRARRAY$().
'     2: Schermgedeelte herstellen uit SCRARRAY$().
'SCRARRAY$():  Array waarin het schermgedeelte wordt opgeslagen of uit wordt
'              hersteld. Het aantal elementen is groter of gelijk aan het
'              aantal regels dat moet worden opgeslagen of hersteld.
'Y:   Y-coordinaat van de linkerbovenhoek van het schermgedeelte.
'X:   X-coordinaat van de linkerbovenhoek van het schermgedeelte.
'Y2:  Y-coordinaat van de rechterbenedenhoek van het schermgedeelte.
'X2:  X-coordinaat van de rechterbenedenhoek van het schermgedeelte.
'
'Terug
'
'TAG: Ongewijzigd.
'SCRARRAY$():  Het schermgedeelte dat is opgeslagen of hersteld.
'Y:   Ongewijzigd.
'X:   Ongewijzigd.
'Y2:  Ongewijzigd.
'X2:  Ongewijzigd.
'
DECLARE SUB savescr (tag, scrarray$(), y, x, y2, x2)

FUNCTION KEYINP (linepos, cursorpos, optwidth, elements, optarray$(), optselect$)
'
'Initialisatie
'
LOCATE , , 1'   Cursor aan
optselect$ = UCASE$(optselect$)
LOCATE linepos, cursorpos
'
'Toets ophalen
'
readin:
char$ = INKEY$
IF char$ = "" THEN GOTO readin
IF LEN(char$) = 2 THEN GOTO specchars'   Grijze toetsen
char$ = UCASE$(char$)
IF char$ = CHR$(13) THEN GOTO LEAVESUB'   Enter
elementtemp = INSTR(optselect$, char$)'   Zoek nummer van gekozen optie op
'
'Verwerking gegevens
'
realprocessing:
IF elementtemp > 0 AND elementtemp <= elements THEN elementnum = elementtemp
'Druk gekozen optie af
IF elementnum > 0 THEN
   PRINT optarray$(elementnum); SPACE$(79 - LEN(optarray$(elementnum)));
   LOCATE linepos, cursorpos
END IF
GOTO readin
'
'Grijze toetsen
'
specchars:
char$ = RIGHT$(char$, 1)
'Volgende optie, pijl rechts of pijl omlaag
IF char$ = "M" OR char$ = "P" THEN
   elementtemp = elementnum + 1'   Ga naar volgende optie
   IF elementtemp > elements THEN elementtemp = 1'   Controleer waarde
   elementnum = elementtemp
   GOTO realprocessing
END IF
'Vorige optie, pijl links of pijl omhoog
IF char$ = "K" OR char$ = "H" THEN
   elementtemp = elementnum - 1'   Ga naar vorige optie
   IF elementtemp = 0 THEN elementtemp = elements'   Controleer waarde
   elementnum = elementtemp
   GOTO realprocessing
END IF
'Overzicht opties, F1
IF char$ = ";" THEN CALL optionwindow(40, 2, optwidth, elements, optarray$(), optselect$)
GOTO readin
'
'Einde invoer
'
LEAVESUB:
IF elementnum = 0 THEN GOTO readin'   Controleer of er een optie is gekozen
KEYINP = elementnum
LOCATE , , 0'   Cursor uit
END FUNCTION

SUB optionwindow (y, x, setwidth, elements, optarray$(), optselect$)
'
'Initialisatie
'
LOCATE , , 0
DIM savearray$(elements + 2)
yu = y'   Bovenste regel
yd = y + elements + 1'   Onderste regel
xl = x'   Meest linkse kolom
xr = x + setwidth + 1'   Meest rechtse kolom
'
'Plaats eigenlijke optieoverzicht
'
CALL savescr(1, savearray$(), yu, xl, yd, xr)'   Bewaar schergedeelte
CALL setwin(yu, xl, yd, xr)'   Plaats window
'Plaats opties
FOR loopvar1 = 1 TO elements
   LOCATE yu + loopvar1, xl + 1
   PRINT MID$(optselect$, loopvar1, 1); ": "; LEFT$(optarray$(loopvar1), setwidth - 3);
NEXT loopvar1
WHILE INKEY$ = "": WEND
CALL savescr(2, savearray$(), yu, xl, yd, xr)'   Herstel schergedeelte
ERASE savearray$
END SUB

SUB savescr (tag, scrarray$(), y, x, y2, x2)
IF tag = 2 THEN GOTO arrayout'   Controleer of er geschreven moet worden
'Initialiseer array-elementen
FOR loopvar1 = 1 TO y2 - y + 1
   scrarray$(loopvar1) = STRING$(2 * (x2 - x + 1), 0)
NEXT loopvar1
arrayout:
DEF SEG = &HB000
FOR loopvar1 = y TO y2
   FOR loopvar2 = x TO x2
      bytenum = (loopvar1 - 1) * 160 + (loopvar2 - 1) * 2
      IF tag = 1 THEN
         'Bewaren
         MID$(scrarray$(loopvar1 - y + 1), 2 * (loopvar2 - x) + 1) = STR$(PEEK(bytenum))
         MID$(scrarray$(loopvar1 - y + 1), 2 * (loopvar2 - x) + 2) = STR$(PEEK(bytenum + 1))
      ELSE
         'Schrijven
         POKE bytenum, VAL(MID$(scrarray$(loopvar1 - y + 1), 2 * (loopvar2 - x) + 1))
         POKE bytenum + 1, VAL(MID$(scrarray$(loopvar1 - y + 1), 2 * (loopvar2 - x) + 2))
      END IF
   NEXT loopvar2
NEXT loopvar1
END SUB

SUB setwin (y, x, y2, x2)
DEF SEG = &HB000'   Schermgeheugen
POKE 160 * (y - 1) + 2 * (x - 1), 218'   Hoekpunt linksboven
POKE 160 * (y - 1) + 2 * (x2 - 1), 191'   Hoekpunt rechtsboven
POKE 160 * (y2 - 1) + 2 * (x - 1), 192'   Hoekpunt linksonder
POKE 160 * (y2 - 1) + 2 * (x2 - 1), 217'   Hoekpunt rechtsonder
FOR loopvar1 = x + 1 TO x2 - 1
   POKE 160 * (y - 1) + 2 * (loopvar1 - 1), 196'   Bovenste horizontale lijn
   POKE 160 * (y2 - 1) + 2 * (loopvar1 - 1), 196'   Onderste horizontale lijn
NEXT loopvar1
FOR loopvar1 = y + 1 TO y2 - 1
   POKE 160 * (loopvar1 - 1) + 2 * (x - 1), 179'   Linkerlijn
   FOR loopvar2 = x + 1 TO x2 - 1
      POKE 160 * (loopvar1 - 1) + 2 * (loopvar2 - 1), 32'   Spaties
   NEXT loopvar2
   POKE 160 * (loopvar1 - 1) + 2 * (x2 - 1), 179'   Rechterlijn
NEXT loopvar1
END SUB

