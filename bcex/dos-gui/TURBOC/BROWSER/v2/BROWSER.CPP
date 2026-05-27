#include "browser.h"

Browser::Browser(ScreenClass *Scr, Buffer *Buf1, Buffer *Buf2)
{
	ScrPtr = Scr;
	MainBuff = Buf1;
	AltBuff = Buf2;
}

Browser::~Browser(void)
{
}

void Browser::DisplayFStat(void)
{
	char AtStr[8];

	int Col;
	for (Col = 0; Col < 80; Col++) {
		ScrPtr->Put(Col, 0, ' ', 112);
	}

	textbackground(7);
	textcolor(0);

	gotoxy(3, 1);
	printf("Arquivo: %s", MainBuff->FileName);
	gotoxy(26, 1);
	printf("Data: %02u/%02u/%04u", MainBuff->Time.ft_day,
		MainBuff->Time.ft_month, MainBuff->Time.ft_year + 1980);
	gotoxy(48, 1);
	printf("Tamanho: %1d", MainBuff->Size);

	// Mostra atributos.
	if (MainBuff->ffblk.ff_attrib == FA_RDONLY) {
		strcpy(AtStr, "R");
	} else {
		strcpy(AtStr, "R-W");
	}
	if (MainBuff->ffblk.ff_attrib == FA_HIDDEN) {
		strcat(AtStr, "-H");
	}
	if (MainBuff->ffblk.ff_attrib == FA_SYSTEM) {
		strcat(AtStr, "-S");
	}

	gotoxy(63, 1);
	printf("Attr: %s", AtStr);

	ScrPtr->MarkLine(0, 112);
}

void Browser::DisplayCommands(void)
{
	int Col;

	for (Col = 0; Col < 80; Col++) {
		ScrPtr->Put(Col, 24, ' ', 112);
	}

	gotoxy(1, 25);
	printf("<Home=Top> <End=Bot> <PgUp=Prv> <PgDn=Next> "
				 "<Alt-S=Search> <Esc=Quit> <F1=Flip>");
	ScrPtr->MarkLine(24, 112);
}

void Browser::SetLPtr(void)
{
	Lc = MainBuff->GetNumLines();

	// Define o ¡ndice da linha inferior.
	if (Lc > ScrPtr->ScrSize) {
		Bot = Lc - ScrPtr->ScrSize;
	} else {
		Bot = 0;
	}

	// Define o ¡ndice da linha superior.
	End = Lc - 1;
	Lc = 0;
}

void Browser::ShowScreen(void)
{
	int Row;
	int Col;
	int P;
	int TLc;
	int Length;
  char Str[81];

	// Come‡a com o ¡ndice da linha atual.
	TLc = Lc;
	for (Row = 0; Row < ScrPtr->ScrSize && Row <= End; Row++) {
		P = MainBuff->LinePtr[TLc];
		strcpy(Str, MainBuff->GetLine(Str, P));
		Length = strlen(Str);
		for (Col = 0; Col < 80 && Col < Length; Col++) {
			ScrPtr->Put(Col, Row + 1, Str[Col], 7);
		}
		for (; Col < 80; Col++) {
			ScrPtr->Put(Col, Row + 1, ' ', 7);
		}

    TLc++;
	}

	for (; Row < ScrPtr->ScrSize; Row++) {
		for (Col = 0; Col < 80; Col++) {
			ScrPtr->Put(Col, Row + 1, ' ', 7);
		}
	}
}

void Browser::PageUp(void)
{
	if (Lc - ScrPtr->ScrSize > 0) {
		Lc -= ScrPtr->ScrSize;
	} else {
		Lc = 0;
	}

	ShowScreen();
}

void Browser::PageDn(void)
{
	if (Lc + ScrPtr->ScrSize < Bot && Bot >= ScrPtr->ScrSize) {
		Lc += ScrPtr->ScrSize;
	} else {
		Lc = Bot;
	}

	ShowScreen();
}

void Browser::LineUp(void)
{
	if (Lc > 0) {
		Lc--;
		ShowScreen();
	}
}

void Browser::LineDn(void)
{
	if (Lc < Bot && Bot >= ScrPtr->ScrSize) {
		Lc++;
		ShowScreen();
	}
}

void Browser::TopPage(void)
{
	Lc = 0;
	ShowScreen();
}

void Browser::BotPage(void)
{
	if (Bot >= ScrPtr->ScrSize) {
		Lc = Bot;
		ShowScreen();
	}
}

void Browser::FileSearch(void)
{
	int Col;
	int I;
	int P;
	char SearchStr[81];
	char *S;
	char Line[81];
	char *Ptr;

	for (Col = 0; Col <= 78; Col++) {
		ScrPtr->Put(Col, 24, ' ', 112);
	}

	gotoxy(2, 25);
	printf("Pesquisa: ");
	// Pega a sequˆncia de pesquisa.
	if ((S = GetStr(SearchStr)) == NULL) {
		DisplayCommands();
		return;
	}

	I = Lc;
	do {
		P = MainBuff->LinePtr[I];
		Col = 0;
		strcpy(Line, MainBuff->GetLine(Line, P));
		// Procura por uma coincidˆncia.
		Ptr = strstr(Line, S);
		I++;
	} while(Ptr == NULL && I <= End);

	// Coincidˆncia encontrada.
	if (Ptr != NULL) {
		if (I > Lc + ScrPtr->ScrSize) {
			Lc = I - ScrPtr->ScrSize;
			ShowScreen();
		}

		// Real‡a a linha com a coincidˆncia.
		ScrPtr->MarkLine(I - Lc, 112);

		if (getch() == 0) {
			(void)getch();
		}

		// Volta a linha ao normal.
		ScrPtr->MarkLine(I - Lc, 7);
	}

	DisplayCommands();
}

void Browser::ProcessInput(char Ch)
{
	Buffer *TempBuff;

	switch(Ch) {
		case PgUp:
			PageUp();
			break;
		case PgDn:
			PageDn();
			break;
		case UpKey:
			LineUp();
			break;
		case DnKey:
			LineDn();
			break;
		case Home:
			TopPage();
			break;
		case EndKey:
			BotPage();
			break;
		case F1Key:
			// Muda entre os dois tipos de buffer.
			TempBuff = MainBuff;
			MainBuff = AltBuff;
			AltBuff = TempBuff;

			// Reconfigura os ¡ndices das linhas superior e inferior.
			SetLPtr();

			// Exibe a tela novamente.
			ShowScreen();
			break;
		case Alt_S:
			FileSearch();
			break;
	}
}
