#include "include.h"

void SaveStatus(Progdata &progdata)
{
	FILE *fp;
	char fpath[255];
	int i;

	memset(fpath, 0, 255);

	strcat(strncpy(fpath, _argv[0], int(strrchr(_argv[0], '\\') - _argv[0]) + 1), "data.rip");

	cprintf("\r\n\r\nWil je je huidige status opslaan? ");
	if (tolower(agetchar("jJnN")) != 'j')
	{
		cprintf("\r\n");
		return;
	}

	while (!(fp = fopen(fpath, "wb")))
	{
		cprintf("\r\n\r\nKon het save-bestand niet openen voor schrijven. Nogmaals proberen? ");
		if (tolower(agetchar("jJnN")) != 'j')
		{
			cprintf("\r\n\r\nStatus niet opgeslagen!\r\n");
			remove(fpath);
			return;
		}
	}

	cprintf("\r\n");

	for (i = 0; i < 25; i++)
		if (fwrite(&progdata.items[i].room, sizeof(char), 1, fp) < 1)
		{
			cprintf("Fout bij wegschrijven status.\r\n\r\nStatus niet opgeslagen!\r\n");
			fclose(fp);
			remove(fpath);
			return;
		}
	for (i = 0; i < 80; i++)
		if (fwrite(progdata.rooms[i].connect, sizeof(char) * 6, 1, fp) < 1)
		{
			cprintf("Fout bij wegschrijven status.\r\n\r\nStatus niet opgeslagen!\r\n");
			fclose(fp);
			remove(fpath);
			return;
		}
	for (i = 0; i < 21; i++)
		if (fwrite(&progdata.living[i], sizeof(Living), 1, fp) < 1)
		{
			cprintf("Fout bij wegschrijven status.\r\n\r\nStatus niet opgeslagen!\r\n");
			fclose(fp);
			remove(fpath);
			return;
		}
	if (fwrite(progdata.owneditems, sizeof(char), 10, fp) < 10)
	{
		cprintf("Fout bij wegschrijven status.\r\n\r\nStatus niet opgeslagen!\r\n");
		fclose(fp);
		remove(fpath);
		return;
	}
	if (fwrite(&progdata.status, sizeof(Status), 1, fp) < 1)
	{
		cprintf("Fout bij wegschrijven status.\r\n\r\nStatus niet opgeslagen!\r\n");
		fclose(fp);
		remove(fpath);
		return;
	}
	fclose(fp);
}

bool LoadStatus(Progdata &progdata)
{
	FILE *fp;
	char fpath[255];
	int i;

	memset(fpath, 0, 255);

	strcat(strncpy(fpath, _argv[0], int(strrchr(_argv[0], '\\') - _argv[0]) + 1), "data.rip");

	if (!(fp = fopen(fpath, "rb")))
	{
		printf("                      Druk op een toets om te beginnen");
		getch();
		return false;
	}

	cprintf("            Toets 1 voor een nieuw spel, 2 voor een gesaved spel: ");
	if (tolower(agetchar("12")) != '2')
	{
		fclose(fp);
		remove(fpath);
		return false;
	}
	cprintf("\r\n");

	for (i = 0; i < 25; i++)
		if (fread(&progdata.items[i].room, sizeof(char), 1, fp) < 1)
		{
			cprintf("Fout bij lezen status.\r\n\r\nJe start een nieuw spel.\r\n\r\n");
			fclose(fp);
			remove(fpath);
			getch();
			Initialize(progdata);
			return false;
		}
	for (i = 0; i < 80; i++)
		if (fread(progdata.rooms[i].connect, sizeof(char) * 6, 1, fp) < 1)
		{
			cprintf("Fout bij lezen status.\r\n\r\nJe start een nieuw spel.\r\n\r\n");
			fclose(fp);
			remove(fpath);
			getch();
			Initialize(progdata);
			return false;
		}
	for (i = 0; i < 21; i++)
		if (fread(&progdata.living[i], sizeof(Living), 1, fp) < 1)
		{
			cprintf("Fout bij lezen status.\r\n\r\nJe start een nieuw spel.\r\n\r\n");
			fclose(fp);
			remove(fpath);
			getch();
			Initialize(progdata);
			return false;
		}
	if (fread(progdata.owneditems, sizeof(char), 10, fp) < 10)
	{
		cprintf("Fout bij lezen status.\r\n\r\nJe start een nieuw spel.\r\n\r\n");
		fclose(fp);
		remove(fpath);
		getch();
		Initialize(progdata);
		return false;
	}
	if (fread(&progdata.status, sizeof(Status), 1, fp) < 1)
	{
		cprintf("Fout bij lezen status.\r\n\r\nJe start een nieuw spel.\r\n\r\n");
		fclose(fp);
		remove(fpath);
		getch();
		Initialize(progdata);
		return false;
	}
	cprintf("\r\n");
	fclose(fp);
	return true;
}

