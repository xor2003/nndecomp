'
'
'Niet-meeneembare voorwerpen
'
'
'
'Spring naar de juiste routine
'
ON beastfound GOSUB hellehond, rode.trol, plant, gnoe, draak, gezwel, deur, stemmen, barbecue, boom, diamant, computer, drakekop, lava, vacuum, papier
RETURN
'
'Hellehond
'
hellehond:
'Spring naar goede fase
ON beast(1).status GOSUB hellehond1, hellehond2, hellehond3, hellehond4, hellehond5
RETURN
'
hellehond1:
PRINT "Er staat hier een reusachtige hellehond die je de weg verspert. Zijn scherpe"
PRINT "tanden steken duidelijk af, en het rode kwijl druipt langzaam uit zijn bek."
PRINT "Hij kijkt je dreigend aan met zijn bloeddoorlopen ogen, en uit zijn keel"
PRINT "klinkt een diep gegrom."
beast(1).status = 2
RETURN
'
hellehond2:
PRINT "De hellehond zet zich af tegen de grond, en hij spring boven op je lijf. Zijn"
PRINT "nagels boren zich in je vlees, en op een gegeven moment bijt hij je hard in je"
PRINT "schouder. Je botten kraken en een scheut van pijn trekt door je zenuwen. De"
PRINT "hond laat je los, en hij kijkt je grommend aan."
lifepoints = lifepoints - 1'   Wond
beast(1).status = 3
RETURN
'
hellehond3:
PRINT "De honger van de hellehond is nog niet gestild. Een diep gegrom komt uit zijn"
PRINT "keel, en hij staat klaar om opnieuw aan te vallen."
beast(1).status = INT(RND * 2) + 2
RETURN
'
hellehond4:
PRINT "Door de wonden aangericht met je zwaard sterft de hevig bloedende hellehond. Je"
PRINT "deelt nog een slag uit, en een stuk vlees van de hond laat los."
artroom(1) = curroom'   Stuk van de hellehond
beast(1).status = 5
RETURN
'
hellehond5:
PRINT "De dode hellehond ligt in een bad van dampend bloed."
RETURN
'
'Rode trol
'
rode.trol:
'Zoek goede fase
ON beast(2).status GOSUB rode.trol1, rode.trol2, rode.trol3, rode.trol4, rode.trol5, rode.trol6
RETURN
'
rode.trol1:
PRINT "Je hebt de rust van de rode trol verstoord. Hij kijkt zwaar geârgerd."
beast(2).status = 2
RETURN
'
rode.trol2:
PRINT "Nu is de trol pas echt goed wakker. Hij pakt zijn zweep en komt dreigend op je"
PRINT "af."
beast(2).status = 3
RETURN
'
rode.trol3:
PRINT "De trol deelt je een harde klap uit met z'n zweep. Je voelt de brandende pijn"
PRINT "tot je botten doordringen."
lifepoints = lifepoints - 1'   Wond
beast(2).status = 4
RETURN
'
rode.trol4:
PRINT "Het schuim loopt uit de trol z'n bek. Hij heft opnieuw zijn zweep."
beast(2).status = INT(2 * RND) + 4
RETURN
'
rode.trol5:
PRINT "Opgewonden grijpt de trol het boekje. Hij bladert het door, en wordt roder en"
PRINT "roder. Op een gegeven moment klinkt een geborrel op uit het wezen, en met een"
PRINT "klap springt hij uit elkaar. Van de rotswanden druipen de resten van de trol"
PRINT "langzaam naar beneden."
PRINT "Opeens zie je iets glinsteren."
artroom(8) = curroom'   Plaats rode kristal
beast(2).status = 6
RETURN
'
rode.trol6:
PRINT "Overal in de grot liggen stukken van de verscheurde trol verspreid. Het slijm"
PRINT "zuigt aan je schoenen, en een vieze stank dringt in je neus."
RETURN
'
'Vleesetende plant
'
plant:
'Zoek goede fase
ON beast(3).status GOSUB plant1, plant2, plant3, plant4
RETURN
'
plant1:
PRINT "In deze grot leeft een vleesetende plant. Zijn dikke groene stengel loopt uit"
PRINT "in een afschrikwekkende kop, met afzichtelijke tanden. Hij heeft je gezien en"
PRINT "beweegt zijn opengesperde bek in je richting. Voordat je een stap hebt kunnen"
PRINT "zetten zit je verstrengd in het monster, en zet de plant zijn tanden in je"
PRINT "nek."
lifepoints = lifepoints - 1'   Wond
beast(3).status = INT(2 * RND) + 2
RETURN
'
plant2:
PRINT "De plant likt met zijn kleine schurfterige tongetje je bloed van zijn bek."
PRINT "Met zijn groene oogjes kijkt hij je weer aan, en hij maakt aanstalten zijn"
PRINT "tanden opnieuw in je nek te zetten."
beast(3).status = 3
RETURN
'
plant3:
PRINT "Opnieuw omsluit de bek van de plant je hals. Een warme stroom bloed loopt via"
PRINT "je rug naar beneden, en de pijn is nu ondraaglijk. Na een tijdje laat de plant"
PRINT "je weer los."
lifepoints = lifepoints - 1'   Wond
beast(3).status = INT(2 * RND) + 2
RETURN
'
plant4:
PRINT "De resten van wat eerst een vleesetende plant was liggen nu op de grond van"
PRINT "de grot. Zijn bek ligt opengesperd, en zijn ogen rollen bijna uit zijn oogkas-"
PRINT "sen. Uit zijn stengel druipt langzaam het bloed van zijn slachtoffers."
PRINT "Op de plek waar vroeger zijn beschimmelde wortels waren zit nu een opening."
roomconnect(26, 3) = 21   'Maak verbinding met slijmgrot
RETURN
'
'Gnoe
'
gnoe:
'Zoek goede fase
ON beast(4).status GOSUB gnoe1, gnoe2, gnoe3, gnoe4
RETURN
'
gnoe1:
PRINT "Er staat hier een grote behaarde gnoe die je met twee geniepige oogjes aan-"
PRINT "kijkt. Tussen de haren van zijn vacht bevinden zich allerlei kleine kruipende"
PRINT "beestjes, die je nog nooit eerder gezien hebt. Het beest verspreidt een"
PRINT "afschuwelijke lucht. Kweilend en zwaar snuivend komt hij langzaam naar je toe."
beast(4).status = 2
RETURN
'
gnoe2:
PRINT "De gnoe neemt nu een sprong, en stoot met zijn grote kop hard in je maag. Je"
PRINT "hebt het gevoel alsof je longen uit je lijf worden geperst. Versuft sta je"
PRINT "weer op."
lifepoints = lifepoints - 1'   Wond
RETURN
'
gnoe3:
PRINT "De gnoe ziet het vlees, snuffelt er aan, en slokt het in ÇÇn hap naar binnen."
PRINT "Je ziet hem langzaam opzwellen en zijn hersens komen door zijn oogkassen naar"
PRINT "buiten. Hij zakt in elkaar en blijft roerloos liggen."
beast(4).status = 4
RETURN
'
gnoe4:
PRINT "Het bultachtige lichaam van de gnoe ligt op de grond en de hersens liggen er"
PRINT "als een papje naast."
RETURN
'
'Draak
'
draak:
'Zoek goede fase
ON beast(5).status GOSUB draak1, draak2, draak3, draak4, draak5, draak6, draak7
RETURN
'
draak1:
PRINT "In deze grot bevindt zich een grote draak. Hij heeft meerdere koppen, die je"
PRINT "allemaal bespieden met gele oogjes. Zijn hele huid is bedekt met schimmel, en"
PRINT "uit zijn bekken hangen lange, bruine tongen, waar een bijtend zuur af drup-"
PRINT "pelt. Opeens komt uit een van de bekken een rommelend geluid. Met moeite"
PRINT "versta je " + CHR$(34) + "Ben jij een koekie?" + CHR$(34) + "."
beast(5).status = 2
RETURN
'
draak2:
PRINT "De koppen van de draak bewegen nu agressiever heen en weer en beginnen hevig"
PRINT "te snuiven."
PRINT "De lucht uit de drakekoppen ruikt afgrijselijk, en je slaat achterover van"
PRINT "walging. Een van de bekken spert zich wijd open, en harder dan eerst klinkt"
PRINT CHR$(34) + "BEN JIJ EEN KOEKIE?!?" + CHR$(34) + "."
beast(5).status = 3
RETURN
'
draak3:
PRINT "De draak heft langzaam een van zijn gore poten op, en geeft opeens een ontzet-"
PRINT "tende harde klap. Er kraakt iets in je hoofd, en een duizeling maakt zich van"
PRINT "je meester. Hij maakt aanstalten je nog een klap te verkopen."
lifepoints = lifepoints - 1'   Wond
RETURN
'
draak4:
PRINT "De draak grijpt de koekjes, en steekt ze gelijk in een van zijn grote bekken."
PRINT "Langzaam begint hij te wankelen, en met een doffe dreun klapt hij op de grond."
PRINT "Uit de bek waar juist de koekjes in verdwenen druipt wat kwijl. De draak"
PRINT "slaapt."
beast(5).status = 5
RETURN
'
draak5:
PRINT "De draak slaapt onrustig. Soms beweegt een van zijn koppen iets, en uit zijn"
PRINT "lijf klinkt een diep gegrom."
RETURN
'
draak6:
PRINT "Voorzichtig zet je de draak de slaapmuts op. De vrolijke kleuren van de muts"
PRINT "steken af tegen de beschimmelde huid, en de muts zakt iets scheef. Op een ge-"
PRINT "geven moment valt er iets, en het klettert tegen de harde rotsvloer."
artroom(16) = curroom'   Plaats mosterdgaspatroon
beast(5).status = 7
RETURN
'
draak7:
PRINT "De draak slaapt rustig."
RETURN
'
'Gezwel
'
gezwel:
'Zoek goede fase
ON beast(6).status GOSUB gezwel1, gezwel2, gezwel3, gezwel4, gezwel5
RETURN
'
gezwel1:
PRINT "Er staat hier een wezen dat nog het meest lijkt op een gezwel. Het kijkt je"
PRINT "aan met 2 gluiperige ogen, op zijn huid zitten schurftvlekken, en op zijn"
PRINT "mondhoeken groeien algen. Met zijn lange, glibberige tentakels houdt het zich"
PRINT "vast aan alle wanden van de grot en verspert zo je weg."
beast(6).status = 2
RETURN
'
gezwel2:
PRINT "Het gezwel zit nog steeds aan de grotwanden vastgezogen, en het trilt licht."
RETURN
'
gezwel3:
IF artroom(20) <> -1 THEN '   Gasmasker op?..
   GOSUB gezwel4'   zo niet spring naar ander label
   RETURN
END IF
PRINT "Als je op de hendel drukt, zie je een bruingrijs gas uit het patroon spuiten."
PRINT "Het gezwel begint langzaam steeds heftiger te trillen, en langzaam komen"
PRINT "overal scheuren in zijn schurfterige huid. Zijn tentakels komen langzaam met"
PRINT "een luid slurpend geluid los van de rotswanden, en hij zakt helemaal in el-"
PRINT "kaar."
roomconnect(76, 3) = 71'   Maak gang vrij
beast(6).status = 5
RETURN
'
gezwel4:
PRINT "Je kunt nog zien dat het gezwel langzaam steeds heftiger begint te trillen,"
PRINT "voordat je zelf een kloppende hoofdpijn krijgt en onderuit gaat. Je hebt niets"
PRINT "om je tegen het gas te beschermen, en je valt flauw. Na een tijdje kom je weer"
PRINT "bij."
lifepoints = lifepoints - 4'   Levenswond
roomconnect(76, 3) = 71'   Maak gang vrij
beast(6).status = 5
RETURN
'
gezwel5:
PRINT "Op het gescheurde lichaam van het gezwel zitten allemaal schimmels. Uit zijn"
PRINT "maag kruipen pissebedden en oorkruipers. Er verspreidt zich een sterke rot-"
PRINT "lucht, en er ontstaat langzaam een klein slijmplasje."
RETURN
'
'Roestende deur
'
deur:
'Zoek goede fase
ON beast(7).status GOSUB deur1, deur2, deur3
RETURN
'
deur1:
PRINT "In het noorden zit een grote, vastgeroeste deur. Hij is met blote handen niet"
PRINT "meer open te krijgen."
RETURN
'
deur2:
PRINT "Je zet 1 eind van het bot onder de deur, en op het andere begin je te duwen."
PRINT "Na lang wrikken begint de deur hevig te kraken en te piepen, en vormt zich een"
PRINT "kier. Je geeft nog een duw, en langzaam draait de deur open."
roomconnect(46, 3) = 41'   Maak deur open
beast(7).status = 3
RETURN
'
deur3:
PRINT "De deur is nu open, en geeft toegang tot een grot."
RETURN
'
'Stemmen
'
stemmen:
'Zoek goede fase
ON beast(8).status GOSUB stemmen1, stemmen2
RETURN
'
stemmen1:
PRINT "Uit het niets hoor je opeens een paar stemmen. Met moeite kun je ze verstaan:"
PRINT CHR$(34) + "Wat schreeuwt is in z'n hart nog een kind" + CHR$(34) + "."
PRINT "Dan is het weer stil."
beast(8).status = 2
RETURN
'
stemmen2:
PRINT "Vanuit de verte hoor je zachte, lachende stemmetjes."
RETURN
'
'Barbecue
'
barbecue:
'Zoek goede fase
ON beast(9).status GOSUB barbecue1, barbecue2
RETURN
'
barbecue1:
PRINT "Op deze open plek staat een barbecue gezellig te branden."
RETURN
'
barbecue2:
PRINT "Een grote rookontwikkeling treedt op wanneer je de hasj en de hellehond op de"
PRINT "barbecue gooit. Knetterend smelten deze 2 ingrediânten om tot een koekje."
artroom(1) = 0'   Verwijder vlees van de hond
artroom(7) = 0'   Verwijder hasj
artroom(24) = curroom'   Plaats koekje
beast(9).status = 1
RETURN
'
'Boom
'
boom:
'Zoek goede fase
ON beast(10).status GOSUB boom1, boom2, boom3
RETURN
'
boom1:
PRINT "In een kleine open plek staat een grote, kurkdroge, dode boom. Op de stam zit"
PRINT "een bordje met daarop de tekst " + CHR$(34) + "Roken en open vuur verboden" + CHR$(34) + "."
RETURN
'
boom2:
PRINT "Uit de pijp van de vlammenwerper spuit een enorme vlam. De boom begint langzaam"
PRINT "te branden, en weldra staat hij in lichterlaaie. De vlammen slaan om zich heen,"
PRINT "en het hele bos begint mee te branden. Je bent omringd door een enorme vuurzee,"
PRINT "en de hitte is enorm."
IF artroom(2) <> -1 THEN
   PRINT "Je hebt niets om je te beschermen tegen de hitte, en je loopt flinke brandwon-"
   PRINT "den op."
   lifepoints = lifepoints - 4'   Levenswond
END IF
FOR loopvar1 = 0 TO 15 STEP 5
   FOR loopvar2 = 1 TO 2
      temp = (loopvar1 * 5) + loopvar2
      IF temp = 7 THEN EXIT FOR
      roomdescrib$(temp) = "Om je heen zie je de smeulende resten van wat vroeger een bos was."
   NEXT loopvar2
NEXT loopvar1
roomdescrib$(3) = "Om je heen zie je de smeulende resten van wat vroeger een bos was."
roomdescrib$(8) = "Om je heen zie je de smeulende resten van wat vroeger een bos was."
roomdescrib$(5) = "Om je heen zie je de smeulende resten van wat vroeger een bos was."
beast(11).status = 2'   Diamant
beast(10).status = 3
RETURN
'
boom3:
PRINT "Uit de grond steken nog een paar wortels, en er naast ligt een verkoold stuk"
PRINT "bord met daarop " + CHR$(34) + "R   n e  op n v u  ver  d n" + CHR$(34) + "."
RETURN
'
'Diamant
'
diamant:
'Zoek goede fase
ON beast(11).status GOSUB diamant1, diamant2
RETURN
'
diamant1:
PRINT "Je struikelt over iets. Door de begroeiing zie je niet wat het is."
RETURN
'
diamant2:
RETURN
'
'Computer
'
computer:
'Zoek goede fase
ON beast(12).status GOSUB computer1, computer2, computer3, computer4
RETURN
'
computer1:
PRINT "Er staat een computer van het merk Beull die bestaat bestaat uit een kast met"
PRINT "een 3´-inch drive en een monitor. Op de monitor staat: " + CHR$(34) + "Datadisk invoeren"
PRINT "a.u.b." + CHR$(34) + "."
beast(12).status = 2
RETURN
'
computer2:
PRINT "De computer wacht nog steeds."
RETURN
'
computer3:
PRINT "De drive begint te lezen en na korte tijd verschijnt er informatie op het"
PRINT "scherm. Er staat: " + CHR$(34) + "In het onderste grottenstelsel moet men een letter-"
PRINT "route volgen die resulteert in de naam van het te vinden voorwerp." + CHR$(34) + "."
PRINT "Na even wordt het scherm zwart."
beast(12).status = 4
RETURN
'
computer4:
PRINT "Er valt niets te zien op de monitor en de computer is stil."
RETURN
'
'Drakekop
'
drakekop:
ON beast(13).status GOSUB drakekop1, drakekop2, drakekop3, drakekop4, drakekop5
RETURN
'
drakekop1:
PRINT "Er zit in het noorden een zware, dichte deur met daarnaast een drakekop met een"
PRINT "geopende muil. Op de deur zit een zwaar slot."
RETURN
'
drakekop2:
PRINT "Je stopt het kristal in de muil van de drakekop, die daarop dicht- en weer"
PRINT "opengaat. Het kristal is nu verdwenen, en de ogen van de kop beginnen licht te"
PRINT "gloeien."
RETURN
'
drakekop3:
PRINT "Je stopt nog een kristal in de muil. Weer sluit en opent deze, en weer is het"
PRINT "kristal verdwenen. Het schijnsel uit de ogen wordt nu sterker."
RETURN
'
drakekop4:
PRINT "Je legt het laatste kristal in de kop. De muil sluit zich weer, en nu blijft"
PRINT "hij dicht. De ogen beginnen nu steeds feller te gloeien. Op een gegeven moment"
PRINT "concentreert de gloed zich tot een erg felle lichtstraal, die langs je schiet"
PRINT "en wordt weerkaatst in een spiegel vlak achter je. De spiegel reflecteert het"
PRINT "licht met akelige precisie op het zware slot dat door de enorme hitte verdampt."
PRINT "Daarna zwaait de deur langzaam met veel gepiep open."
beast(13).status = 5
RETURN
'
drakekop5:
PRINT "De zware deur is nu open en geeft toegang tot een ruimte."
RETURN
'
'Lavaput
'
lava:
'Zoek goede fase
ON beast(14).status GOSUB lava1, lava2, lava3
RETURN
'
lava1:
IF artroom(2) <> -1 THEN
   GOSUB lava2
   RETURN
END IF
PRINT "Voor je zie je een krater waarin lava opborrelt. Van het lava komt een dikke"
PRINT "damp, en een rode gloed verlicht de omtrek. De hitte is enorm, maar het hitte-"
PRINT "pak beschermt je tegen verbranding."
RETURN
'
lava2:
PRINT "Voor je zie je een krater waarin lava opborrelt. De hitte is zo intens, dat je"
PRINT "een aantal brandwonden oploopt en naar achteren wordt geblazen."
curroom = 55'   Grot terug
lifepoints = lifepoints - 4'   Levenswond
RETURN
'
lava3:
PRINT "Je gooit de noekietronenbom met een pisboogje in de lava. Met luid gesis zakt"
PRINT "de bom langzaam weg naar beneden. De lava begint op een gegeven moment vreemd"
PRINT "te borrelen en verschiet ineens van rood naar groen. Dan zie je een oogver-"
PRINT "blindende flits vanuit het lava. Daarna wordt het weer rustiger."
PRINT
PRINT "Het lijkt erop dat je de wereld hebt behoed voor de totaalvernietiging door"
PRINT "dit positronenwapen, waarvan de beginselen mede van jouw handen komen. Je mis-"
PRINT "sie is voltooid, en vermoeid en vol van gemengde gevoelens verlaat je het"
PRINT "grottenstelsel."
RETURN
'
'VacuÅmgrot
'
vacuum:
PRINT "Doordat er in deze grot geen lucht is, klappen allebei je longen dicht. Een"
PRINT "verschrikkelijke pijn kraakt als een bliksem door je lijf. Je valt naar achte-"
PRINT "ren de grot uit, en daar val je even flauw."
lifepoints = lifepoints - 4'   Levenswond
curroom = 77'   Grot terug
RETURN
'
'Papierluik
'
papier:
'Zoek goede fase
ON beast(16).status GOSUB papier1, papier2, papier3
RETURN
'
papier1:
PRINT "Er zit een dicht, houten luik in het plafond. Je kunt er niet bij."
RETURN
'
papier2:
PRINT "Het luik gaat open en er dwarrelt een vel papier naar beneden."
artroom(21) = 67'   Leg papier neer
beast(16).status = 3
RETURN
'
papier3:
PRINT "Het luik aan het plafond hangt nu open. Er zit een leeg gat."
RETURN

