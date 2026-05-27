#include "include.h"

char *cmds[15] = {"oost", "west", "noord", "zuid", "klim", "daal", "gebruik",
							"combineer", "pak", "leg", "bekijk", "afwachten", "einde",
							"status", "help"};

bool DoAction(Progdata &progdata)
{
	char inpstr[65];
	Parsedata parsedata;
	int cury;

	if (progdata.status.lifepoints <= 0)
	{
		cprintf("Badend in je eigen bloed bezwijk je aan je verwondingen. Terwijl je liggend op\r\n"
				  "de grond met moeite naar adem snakt, hoor je in de verte een luid gelach.\r\n"
				  "Dan zakken je ogen dicht en stopt je hart met kloppen.\r\n"
				  "Op hetzelfde moment ontploft de bom en sterft de aarde met jou.\r\n\r\n");
		ForceExit();
	}

	if (progdata.status.lamppoints > 0 && progdata.status.lamp)
	{
		switch(--progdata.status.lamppoints)
		{
		case 10:
			cprintf("De zaklamp gaat zwakker branden.\r\n\r\n");
			break;
		case 0:
			cprintf("De batterijen van de zaklamp zijn uitgeput. Langzaam dooft hij.\r\n\r\n");
			progdata.status.lamp = false;
			break;
		}
	}

	do
	{
		cury = wherey();
		memset(inpstr, ' ', 64);
		inpstr[64] = 0;

		do
		{
			gotoxy(1, cury);
			cprintf("> ");
			strinp(" abcdefghijklmnopqrstuvwxyz", inpstr, wherex(), wherey(), -1, 0, 0);
			gotoxy(1, cury);
			ParseInput(progdata, inpstr, parsedata);
		}
		while (parsedata.parseerror);

		cprintf("\r\n\r\n");

		switch(parsedata.selected)
		{
		case EAST:
		case WEST:
		case NORTH:
		case SOUTH:
		case UP:
		case DOWN:
			if (progdata.rooms[progdata.status.curroom].connect[parsedata.selected] >= 0)
			{
				if (progdata.living[GNOE].room == progdata.status.curroom && progdata.living[GNOE].status != 3)
					switch(random(5))
					{
					case 0:
						progdata.living[GNOE].room = 44;
						break;
					case 1:
						progdata.living[GNOE].room = 47;
						break;
					case 2:
						progdata.living[GNOE].room = 48;
						break;
					case 3:
						progdata.living[GNOE].room = 49;
						break;
					case 4:
						progdata.living[GNOE].room = 54;
						break;
					}
				progdata.status.curroom = progdata.rooms[progdata.status.curroom].connect[parsedata.selected];
				if (progdata.status.paperpos != 6)
				{
					if (progdata.status.curroom == progdata.paperroute[progdata.status.paperpos])
						progdata.status.paperpos++;
					else
						progdata.status.paperpos = 0;
					if (progdata.status.paperpos == 6)
						progdata.living[PAPIER].status = 1;
				}
				return true;
			}
			else
				cprintf("Daar kunt u niet heen.\r\n");
			break;
		case GEBRUIK:
			return DoGebruik(progdata, parsedata);
		case COMBINEER:
			DoCombineer(progdata, parsedata);
			break;
		case PAK:
			DoPak(progdata, parsedata);
			break;
		case LEG:
			DoLeg(progdata, parsedata);
			break;
		case BEKIJK:
			DoBekijk(progdata, parsedata);
			break;
		case AFWACHTEN:
			DoAfwachten();
			break;
		case EINDE:
			cprintf("Weet je zeker dat je de aarde laat vergaan? ");
			if (tolower(agetchar("jJnN")) == 'j')
				return false;
			cprintf("\r\nMooi zo!\r\n");
			break;
		case STATUS:
			DoStatus(progdata);
			break;
		case HELP:
			DoHelp();
			break;
		}

		cprintf("\r\n");
	}
	while (parsedata.selected == STATUS || parsedata.selected == HELP || parsedata.selected == EINDE);

	return true;
}

bool DoGebruik(Progdata &progdata, Parsedata &parsedata)
{
	int i;

	switch (progdata.owneditems[parsedata.object1])
	{
	case ZWAARD:
		i = HELLEHOND;
		if (progdata.living[i].room != progdata.status.curroom || !progdata.living[i].strike)
		{
			i = PLANT;
			if (progdata.living[i].room != progdata.status.curroom || !progdata.living[i].strike)
			{
				cprintf("Dat heeft geen zin.\r\n\r\n");
				return true;
			}
		}
		while (true)
		{
			cprintf("Je haalt uit met je zwaard");
			if (random(100) > 70)
				cprintf(", maar het monster ontwijkt.\r\n");
			else
			{
				cprintf(" en je raakt het monster hard.\r\n");
				progdata.living[i].strike--;
			}
			if (progdata.living[i].strike == 1)
				cprintf("\r\nHet monster is zwaar gewond en je baadt in zijn bloed.\r\n");
			if (!progdata.living[i].strike || random(100) > 30)
				break;
			cprintf("\r\nJe kunt nog een slag uitdelen. Wil je dat? ");
			if (tolower(agetchar("jJnN")) != 'j')
			{
				cprintf("\r\n");
				break;
			}
			cprintf("\r\n");
		}
		cprintf("\r\n");
		if (!progdata.living[i].strike)
		{
			progdata.living[i].status = 3;
			BeastStatus(progdata);
		}
		getch();
		break;
	case ZAKLAMP:
		if (progdata.status.lamp)
		{
			progdata.status.lamp = !progdata.status.lamp;
			cprintf("Je zet de zaklamp uit.%s", ((progdata.status.curroom != 61 && progdata.status.curroom != 31 && progdata.status.curroom >= 20) ? " Je ziet niets meer.\r\n" : "\r\n"));
			break;
		}
		if (progdata.status.lamppoints)
		{
			progdata.status.lamp = !progdata.status.lamp;
			cprintf("Je zet de zaklamp aan. De straal verlicht de omtrek.\r\n");
		}
		else
			cprintf("Zonder nieuwe batterijen doet'ie het niet...\r\n");
		break;
	case VERBAND:
		if (progdata.status.lifepoints == 20)
		{
			cprintf("Je bent nog helemaal heel!\r\n");
			break;
		}
		cprintf("Je pakt het verband en de pleisters en plaatst ze over je wonden. Je bijt even\r\n"
				 "op je lippen van de pijn als het verband je nog bloedende wonden raakt.\r\n\r\n"
				 "Je bent weer zo goed als nieuw.\r\n");
		progdata.status.lifepoints = 20;
		progdata.items[VERBAND].room = -1;
		progdata.owneditems[parsedata.object1] = -1;
		getch();
		break;
	case TNT:
		cprintf("Je pakt een staafje en gooit het op de grond. Er volgt een explosie die samen-\r\n"
				 "gaat met een harde knal. Je wordt even verblind door de flits van de ontplof-\r\n"
				 "fing. Door de klap val je even flauw.\r\n");
		progdata.status.lifepoints--;
		getch();
		break;
	case HITTEPAK:
		cprintf("Je hebt het pak al aan.\r\n");
		break;
	case GASMASKER:
		cprintf("Je hebt het gasmasker al op.\r\n");
		break;
	default:
		if (progdata.items[progdata.owneditems[parsedata.object1]].useableon < 0
			 || progdata.living[progdata.items[progdata.owneditems[parsedata.object1]].useableon].room != progdata.status.curroom)
		{
			cprintf("Dat heeft geen zin.\r\n\r\n");
			return true;
		}
		switch (progdata.owneditems[parsedata.object1])
		{
		case BOT:
			progdata.living[DEUR].status = 1;
			break;
		case DISKETTE:
			UseItemToStatus(progdata, DISKETTE, parsedata.object1, COMPUTER, 2);
			break;
		case HASJ:
			UseItemToStatus(progdata, HASJ, parsedata.object1, BARBECUE, progdata.living[BARBECUE].status ? 4 : 1);
			break;
		case HONDVLEES:
			UseItemToStatus(progdata, HONDVLEES, parsedata.object1, BARBECUE, progdata.living[BARBECUE].status ? 4 : 2);
			break;
		case ROODKRISTAL:
		case GROENKRISTAL:
		case BLAUWKRISTAL:
			UseItemToStatus(progdata, progdata.owneditems[parsedata.object1], parsedata.object1, DRAKEKOP, progdata.living[DRAKEKOP].status + 1);
			break;
		case KOEKJE:
			UseItemToStatus(progdata, KOEKJE, parsedata.object1, DRAAK, 3);
			break;
		case SLAAPMUTS:
			if (progdata.living[DRAAK].status != 4)
			{
				cprintf("Dat heeft geen zin.\r\n\r\n");
				return true;
			}
			UseItemToStatus(progdata, SLAAPMUTS, parsedata.object1, DRAAK, 5);
			break;
		case BOM:
			UseItemToStatus(progdata, BOM, parsedata.object1, LAVA, 2);
			break;
		case VLAMMENWERPER:
			UseItemToStatus(progdata, VLAMMENWERPER, parsedata.object1, BOOM, 1);
			break;
		case GIFTIGVLEES:
			UseItemToStatus(progdata, GIFTIGVLEES, parsedata.object1, GNOE, 2);
			break;
		case BOEKJE:
			UseItemToStatus(progdata, BOEKJE, parsedata.object1, RODETROL, 4);
			break;
		case GASGRANAAT:
			UseItemToStatus(progdata, GASGRANAAT, parsedata.object1, GEZWEL, 2);
			break;
		}
		BeastStatus(progdata);
		getch();
		break;
	}
	return true;
}

void UseItemToStatus(Progdata &progdata, int item, int ownedindex, int beast, int status)
{
	progdata.items[item].room = -1;
	progdata.owneditems[ownedindex] = -1;
	progdata.living[beast].status = status;
}

void DoCombineer(Progdata &progdata, Parsedata &parsedata)
{
	if (progdata.items[progdata.owneditems[parsedata.object1]].useableon > -2
		 || -(progdata.items[progdata.owneditems[parsedata.object1]].useableon + 2) != progdata.owneditems[parsedata.object2])
	{
		cprintf("Dat levert niets bruikbaars op.\r\n");
		return;
	}

	switch(progdata.owneditems[parsedata.object1])
	{
	case ZAKLAMP:
	case BATTERIJEN:
		cprintf("Je schroeft de zaklamp open en schudt totdat de oude batterijen er uit komen\r\n"
				 "vallen. Daarna steek je de \"trommelbatterijen\" erin en schroeft de lamp weer\r\n"
				 "dicht. Nadat je een paar keer op de zaklantaarn hebt geslagen zie je dat hij\r\n"
				 "het doet.\r\n");
		progdata.status.lamppoints = -1;
		progdata.items[BATTERIJEN].room = -1;
		if (progdata.owneditems[parsedata.object1] == BATTERIJEN)
			progdata.owneditems[parsedata.object1] = -1;
		else
			progdata.owneditems[parsedata.object2] = -1;
		break;
	case GASPATROON:
	case ONTSTEKING:
		cprintf("Je plaatst de ontsteker op het mosterdgaspatroon. Na enig friemelen is het\r\n"
				 "resultaat een werkende mosterdgasgranaat.\r\n");
		progdata.items[GASPATROON].room = -1;
		progdata.items[ONTSTEKING].room = -1;
		progdata.items[GASGRANAAT].room = -2;
		progdata.owneditems[parsedata.object1] = GASGRANAAT;
		progdata.owneditems[parsedata.object2] = -1;
		break;
	}
}

void DoLeg(Progdata &progdata, Parsedata &parsedata)
{
	if (progdata.owneditems[parsedata.object1] == ZAKLAMP)
	{
		cprintf("Je bent inmiddels zo aan je zaklamp gehecht geraakt dat je hem niet meer kunt\r\n"
				 "missen.\r\n");
		return;
	}
	if (progdata.owneditems[parsedata.object1] == BATTERIJEN)
	{
		cprintf("Je bent inmiddels zo aan je batterijen gehecht geraakt dat je ze niet meer kunt\r\n"
				 "missen.\r\n");
		return;
	}
	cprintf("Je legt %s neer.\r\n", progdata.items[progdata.owneditems[parsedata.object1]].name);
	progdata.items[progdata.owneditems[parsedata.object1]].room = progdata.status.curroom;
	progdata.owneditems[parsedata.object1] = -1;
}

void DoPak(Progdata &progdata, Parsedata &parsedata)
{
	int i;

	for (i = 0; i < 10; i++)
		if (progdata.owneditems[i] == -1)
			break;

	if (i == 10)
	{
		cprintf("Je zakken zitten tsjokvol, en je krijgt %s er niet in.\r\n", progdata.items[parsedata.object1].name);
		return;
	}

	cprintf("Je pakt %s op en steekt deze in een van je zakken.\r\n", progdata.items[parsedata.object1].name);

	progdata.items[parsedata.object1].room = -2;
	progdata.owneditems[i] = parsedata.object1;
}

void DoBekijk(Progdata &progdata, Parsedata &parsedata)
{
	if (progdata.status.curroom != 61 && progdata.status.curroom != 31 && progdata.status.curroom >= 20 && !progdata.status.lamp)
	{
		cprintf("Het is veel te donker om wat dan ook te bekijken.\r\n");
		return;
	}

	cprintf("%s\r\n", progdata.items[progdata.owneditems[parsedata.object1]].descript);
}

void DoAfwachten(void)
{
	switch(random(5))
	{
	case 0:
		cprintf("Je pulkt wat in je neus.\r\n");
		break;
	case 1:
		cprintf("Je krabt wat achter je oren.\r\n");
		break;
	case 2:
		cprintf("Je gaapt even uitgebreid.\r\n");
		break;
	case 3:
		cprintf("Je trekt je broek even op.\r\n");
		break;
	case 4:
		cprintf("Je pulkt wat smeer uit je oren.\r\n");
		break;
	}
}

void DoStatus(Progdata &progdata)
{
	int i;
	int count = 0;

	cprintf("--- STATUSRAPPORT ---\r\n\r\n");
	cprintf("Je hebt nog %d levenspunten.\r\n", progdata.status.lifepoints);
	if (progdata.items[ZAKLAMP].room == -2)
		cprintf("Je zaklamp staat %s.\r\n", progdata.status.lamp ? "aan" : "uit");

	for (i = 0; i < 10; i++)
		if (progdata.owneditems[i] != -1)
			count++;

	if (!count)
		cprintf("Je hebt niets.\r\n");
	else
	{
		cprintf("Je hebt in je bezit:\r\n");
		for (i = 0; i < 10; i++)
			if (progdata.owneditems[i] != -1)
				cprintf("    %s\r\n", progdata.items[progdata.owneditems[i]].name);
	}
}

void DoHelp(void)
{
	cprintf("--- HELP ---\r\n\r\n");
	cprintf("Commando's:\r\n");
	cprintf("   oost\r\n");
	cprintf("   west\r\n");
	cprintf("   noord\r\n");
	cprintf("   zuid\r\n");
	cprintf("   klim\r\n");
	cprintf("   daal\r\n");
	cprintf("   gebruik <voorwerp>\r\n");
	cprintf("   comineer <voorwerp> en/met <voorwerp>\r\n");
	cprintf("   pak <voorwerp>\r\n");
	cprintf("   leg <voorwerp>\r\n");
	cprintf("   bekijk <voorwerp>\r\n");
	cprintf("   afwachten\r\n");
	cprintf("   einde\r\n");
	cprintf("   status\r\n");
	cprintf("   help\r\n");
}

void ParseInput(Progdata &progdata, char *inpstr, Parsedata &parsedata)
{
	char *eoword;
	char *curp;
	char spaces[80];
	char workstr[65];
	char itemname[25];
	int i;

	parsedata.parseerror = false;
	memset(spaces, ' ', 79);
	spaces[79] = 0;

	strcpy(workstr, inpstr);

	for (i = strlen(workstr) - 1; i >= 0 && workstr[i] == ' '; i--);
	workstr[i + 1] = 0;
	for (curp = workstr; curp < (workstr + strlen(workstr)) && *curp == ' '; curp++);

	eoword = strchr(curp, ' ');
	if (eoword == NULL)
		eoword = curp + strlen(curp);

	if (eoword == curp || eoword > curp + 9)
	{
		parsedata.parseerror = true;

		if (eoword == curp)
			cprintf("%s\r< geen commando gegeven", spaces);
		else
			cprintf("%s\r< ongeldig commando gegeven", spaces);
		getch();
		return;
	}

	parsedata.selected = -1;

	for (i = 0; parsedata.selected == -1 && i < 15; i++)
	{
		if (!strncmp(cmds[i], curp, int(eoword - curp)))
			parsedata.selected = i;
	}

	switch (parsedata.selected)
	{
	case -1:
		cprintf("%s\r< ongeldig commando gegeven", spaces);
		parsedata.parseerror = true;
		getch();
		return;
	case GEBRUIK:
		if (*eoword != ' ')
		{
			cprintf("%s\r< syntax: gebruik <voorwerp>", spaces);
			parsedata.parseerror = true;
			getch();
			return;
		}
		parsedata.object1 = FindOwnedItemNum(progdata, eoword + 1);
		switch (parsedata.object1)
		{
		case -1:
			cprintf("%s\r< je hebt geen \"%s\"", spaces, eoword + 1);
			parsedata.parseerror = true;
			getch();
			return;
		case -2:
			cprintf("%s\r< de afkorting \"%s\" is dubbelzinnig", spaces, eoword + 1);
			parsedata.parseerror = true;
			getch();
			return;
		}
		break;
	case LEG:
		if (*eoword != ' ')
		{
			cprintf("%s\r< syntax: leg <voorwerp>", spaces);
			parsedata.parseerror = true;
			getch();
			return;
		}
		parsedata.object1 = FindOwnedItemNum(progdata, eoword + 1);
		switch (parsedata.object1)
		{
		case -1:
			cprintf("%s\r< je hebt geen \"%s\"", spaces, eoword + 1);
			parsedata.parseerror = true;
			getch();
			return;
		case -2:
			cprintf("%s\r< de afkorting \"%s\" is dubbelzinnig", spaces, eoword + 1);
			parsedata.parseerror = true;
			getch();
			return;
		}
		break;
	case BEKIJK:
		if (*eoword != ' ')
		{
			cprintf("%s\r< syntax: bekijk <voorwerp>", spaces);
			parsedata.parseerror = true;
			getch();
			return;
		}
		parsedata.object1 = FindOwnedItemNum(progdata, eoword + 1);
		switch (parsedata.object1)
		{
		case -1:
			cprintf("%s\r< je hebt geen \"%s\"", spaces, eoword + 1);
			parsedata.parseerror = true;
			getch();
			return;
		case -2:
			cprintf("%s\r< de afkorting \"%s\" is dubbelzinnig", spaces, eoword + 1);
			parsedata.parseerror = true;
			getch();
			return;
		}
		break;
	case COMBINEER:
		if (*eoword != ' ' || (!strstr(curp, " en ") && !strstr(curp, " met ")))
		{
			cprintf("%s\r< syntax: combineer <voorwerp> en/met <voorwerp>", spaces);
			parsedata.parseerror = true;
			getch();
			return;
		}

		curp = eoword + 1;
		if (!(eoword = strstr(curp, " en ")))
			eoword = strstr(curp, " met ");

		strncpy(itemname, curp, ((eoword - curp) < 25 ? int(eoword - curp) : 24));
		itemname[((eoword - curp) < 25 ? int(eoword - curp) : 24)] = 0;

		parsedata.object1 = FindOwnedItemNum(progdata, itemname);
		switch (parsedata.object1)
		{
		case -1:
			cprintf("%s\r< je hebt geen \"%s\"", spaces, itemname);
			parsedata.parseerror = true;
			getch();
			return;
		case -2:
			cprintf("%s\r< de afkorting \"%s\" is dubbelzinnig", spaces, itemname);
			parsedata.parseerror = true;
			getch();
			return;
		}

		curp = eoword;
		if (strstr(curp, " en ") == curp)
			curp += 4;
		else
			curp += 5;

		strncpy(itemname, curp, (strlen(curp) < 25 ? strlen(curp) : 24));
		itemname[(strlen(curp) < 25 ? strlen(curp) : 24)] = 0;

		parsedata.object2 = FindOwnedItemNum(progdata, itemname);
		switch (parsedata.object2)
		{
		case -1:
			cprintf("%s\r< je hebt geen \"%s\"", spaces, itemname);
			parsedata.parseerror = true;
			getch();
			return;
		case -2:
			cprintf("%s\r< de afkorting \"%s\" is dubbelzinnig", spaces, itemname);
			parsedata.parseerror = true;
			getch();
			return;
		}

		if (parsedata.object1 == parsedata.object2)
		{
			cprintf("%s\r< je kunt een voorwerp niet met zichzelf combineren", spaces, eoword + 1);
			parsedata.parseerror = true;
			getch();
			return;
		}
		break;
	case PAK:
		if (*eoword != ' ')
		{
			cprintf("%s\r< syntax: pak <voorwerp>", spaces);
			parsedata.parseerror = true;
			getch();
			return;
		}
		parsedata.object1 = FindLayingItemNum(progdata, eoword + 1);
		switch (parsedata.object1)
		{
		case -1:
			cprintf("%s\r< je ziet hier geen \"%s\" die je kunt meenemen", spaces, eoword + 1);
			parsedata.parseerror = true;
			getch();
			return;
		case -2:
			cprintf("%s\r< de afkorting \"%s\" is dubbelzinnig", spaces, eoword + 1);
			parsedata.parseerror = true;
			getch();
			return;
		}
		break;
	}
}

int FindOwnedItemNum(Progdata &progdata, char *itemname)
{
	int item = -1;
	int i;

	for (i = 0; i < 10 && item != -2; i++)
		if (progdata.owneditems[i] != -1)
			if (strstr(progdata.items[progdata.owneditems[i]].name, itemname))
				item = ((item == -1) ? i : -2);

	return item;
}

int FindLayingItemNum(Progdata &progdata, char *itemname)
{
	int item = -1;
	int i;

	if (progdata.status.curroom != 61 && progdata.status.curroom != 31 && progdata.status.curroom >= 20 && !progdata.status.lamp)
		return -1;

	for (i = 0; i < 25 && item != -2; i++)
		if (progdata.status.curroom == progdata.items[i].room && strstr(progdata.items[i].name, itemname))
			item = ((item == -1) ? i : -2);

	return item;
}


