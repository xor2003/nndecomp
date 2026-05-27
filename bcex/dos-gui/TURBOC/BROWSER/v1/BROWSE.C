/* Permite examinar o conte£do de um arquivo ASCII. */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <alloc.h>
#include <dos.h>
#include <dir.h>
#include <conio.h>
#include <sys\stat.h>
#include <io.h>

/* Tamanho m ximo do arquivo */
#define MaxBufSize 65520L

/* N£mero de linhas de texto por tela */
#define ScrSize 23

/* Quantidade de espa‡os para cada TAB */
#define TabSize 5

#define EscKey 27
#define PgUp 73
#define PgDn 81
#define Home 71
#define EndKey 79
#define UpKey 72
#define DnKey 80

/* Tecla de pesquisa */
#define AltS 31
#define Screen (*ScreenPtr)
#define TabKey 9

/* Retorno de carro */
#define CR 10

/* Registro usado para direcionar */
struct Texel {
	/* acesso … tela */
	char Ch;
	/* Atributo de caractere */
	unsigned char Attr;
};

typedef struct Texel ScreenArea[25][80];

FILE *InFile;
ScreenArea far *ScreenPtr;
long Time, Size;
char *BufPtr, Ch;

/* Öndices das linhas iniciais em BufPtr */
int LinePtr[2000];
int Attr;
int NoBytes;
int I;
int Lc;
int Bot;
int End;

char *GetStr(char *Str);
ScreenArea far *SelectMonitor(void);
void DisplayFStat(char *fname, FILE *InFile, struct ffblk *ffblk);
void DisplayCommands(void);
void ShowScreen(void);
void FileSearch(void);
void ProcessInput(char Ch);

int main(int argc, char *argv[])
{
	struct ffblk ffblk;
	int DosError;

	clrscr();
	if (argc != 2)
	{
		printf("N£mero incorreto de argumentos\n");
		printf("Para examinar um arquivo, use o comando:\n");
		printf("\tbrowse <nome_arquivo>\n");
		exit(-1);
	}

	ScreenPtr = SelectMonitor();
	DosError = findfirst(argv[1], &ffblk, 0);
	if (DosError != 0)
	{
		printf("NÆo consegui achar o arquivo: %s\n", argv[1]);
		exit(-2);
	}

	/* Abrir o arquivo */
	if ((InFile = fopen(argv[1], "r")) == NULL)
	{
		printf("NÆo consegui abrir o arquivo: %s\n", argv[1]);
		exit(-3);
	}

	/* Aloca a mem¢ria para o buffer de arquivo */
	if (ffblk.ff_fsize >= MaxBufSize)
	{
		printf("Arquivo muito grande: %s\n", argv[1]);
		exit(-4);
	}

	if ((BufPtr = malloc(ffblk.ff_fsize)) == NULL)
	{
		printf("Mem¢ria insuficiente\n");
		exit(-5);
	}

	DisplayFStat(argv[1], InFile, &ffblk);
	DisplayCommands();
	NoBytes = read(fileno(InFile), BufPtr, ffblk.ff_fsize);
	Lc = 0;
	/* Inicia a matriz de ¡ndices de linha */
	LinePtr[Lc++] = 0;

	for (I = 0; I < NoBytes; I++)
	{
		if (BufPtr[I] == CR)
		{
			LinePtr[Lc++] = I + 1;
		}
	}

	fclose(InFile);
	/* Define o ¡ndice que possa exibir */
	if (Lc > ScrSize)
	{
		/* A £ltima tela cheia com registros do arquivo */
		Bot = Lc - ScrSize;
	}
	else
	{
		Bot = 0;
	}

	/* Salva o ¡ndice de linha do final do arquivo */
	End = Lc - 1;

	/* Define o ¡ndice da linha superior */
	Lc = 0;

	ShowScreen();

	do
	{
		Ch = getch();
		switch (Ch)
		{
			/* Pressionada uma tecla extendida */
			case 0:
				Ch = getch();
				/* Executa a opera‡Æo */
				ProcessInput(Ch);
				break;
			case EscKey:
				/* NÆo possui execu‡Æo no momento (apenas para sair do la‡o) */
				break;
			default:
				/* Tecla ilegal, soa o alarme */
				putch(7);
		}
	} while (Ch != EscKey);

	free(BufPtr);
	/* Restaura a tela */
	textbackground(0);
	textcolor(7);
	clrscr();
	return 0;
}

/**
 * Lˆ uma sequencia na posi‡Æo atual doi cursor.
 * Pressione ESC para cancelar a opera‡Æo.
 */
char *GetStr(char *Str)
{
	char Ch;
	int Count = 0;

	while((Ch = getch()) != 13 && Ch != EscKey)
	{
		printf("%c", Ch);
		Str[Count++] = Ch;
	}

	if (Ch == EscKey)
	{
		return NULL;
	}

	/* Encerra a sequencia */
	Str[Count] = '\0';
	return Str;
}

/**
 * Determina o tipo de placa gr fica que est  instalada no seu computador
 * e devolve o endere‡o de mem¢ria do v¡deo.
 */
ScreenArea far *SelectMonitor(void)
{
	union REGS Regs;
	unsigned Segment;
	unsigned Offset;

	Regs.h.ah = 15;
	int86(0x10, &Regs, &Regs);
	if (Regs.h.al == 7)
	{
		/* Monocrom tico */
		Segment = 0xB000;
	}
	else
	{
		/* Gr fico */
		Segment = 0xB800;
	}

	/* Calcula a p gina de v¡deo. */
	Offset = Regs.h.bh * (unsigned)0x1000;
	return (ScreenArea *)(((long)Segment << 16) | (long)Offset);
}

/**
 * Exibe a primeira linha de status de informa‡äes do arquivo,
 * inclu¡ndo nome e tamanho do arquivo, data e hora de grava‡Æo da
 * £ltima altera‡Æo.
 */
void DisplayFStat(char *fname, FILE *InFile, struct ffblk *ffblk)
{
	int Col;
	struct ftime ft;
	char AtStr[8];

	/* Coloca a barra de status em v¡deo reverso */
	for (Col = 0; Col < 80; Col++)
	{
		Screen[0][Col].Attr = 112;
	}

	/* Texto configurado para preto-e-branco. */
	textbackground(7);
	textcolor(0);

	/* Exibe o nome do arquivo */
	gotoxy(3, 1);
	printf("Arquivo: %s", fname);
	gotoxy(26, 1);
	getftime(fileno(InFile), &ft);
	printf("Data: %02u/%02u/%04u", ft.ft_day, ft.ft_month, ft.ft_year + 1980);
	/* Display size */
	gotoxy(48, 1);
	printf("Tamanho: %1d", ffblk->ff_fsize);

	/* Determina atributos */
	if (ffblk->ff_attrib == FA_RDONLY)
	{
		strcpy(AtStr, "R");
	}
	else
	{
		strcpy(AtStr, "R-W");
	}

	if (ffblk->ff_attrib == FA_HIDDEN)
	{
		strcat(AtStr, "-H");
	}

	if (ffblk->ff_attrib == FA_SYSTEM)
	{
		strcat(AtStr, "-S");
	}

	/* Exibe atributos */
	gotoxy(65, 1);
	printf("Attr: %s", AtStr);
}

/**
 * Exibe a barra de comandos na £ltima linha da tela.
 */
void DisplayCommands(void)
{
	int Col;

	for (Col = 0; Col < 80; Col++)
	{
		Screen[24][Col].Attr = 112;
	}

	gotoxy(2, 25);
	printf("<Home=Top>  <End=Bot>  <PgUp=Prev>  <PgDn=Next>  "
				 "<Alt-S=Search>  <Esc=Quit>");
}

/**
 * Exibe uma imagem de tela contendo 23 linhas do arquivo.
 */
void ShowScreen(void)
{
	int Row;
	int Col;
	int TLc;
	int I;
	int Tp;

	/* Come‡a com o ¡ndice da linha atual */
	TLc = Lc;
	for (Row = 0; Row < ScrSize && Row <= End; Row++)
	{
		Tp = LinePtr[TLc];
		for (Col = 0; Col < 80 && Tp < NoBytes && BufPtr[Tp] != CR; Tp++)
		{
			/* Procura pela tecla TAB */
			if (BufPtr[Tp] == TabKey) {
				/* Substitui TAB por espa‡os */
				for (I = 0; I < TabSize && Col < 80; I++)
				{
					Screen[Row + 1][Col++].Ch = ' ';
				}
			}
			else
			{
				Screen[Row + 1][Col++].Ch = BufPtr[Tp];
			}
		}

		for (; Col < 80; Col++)
		{
			Screen[Row + 1][Col].Ch = ' ';
		}

		TLc++;
	}

	/* Preenche a tela se o arquivo tiver menos de uma tela completa de linhas */
	for (; Row < ScrSize; Row++)
	{
		for (Col = 0; Col < 80; Col++)
		{
			Screen[Row + 1][Col].Ch = ' ';
		}
	}
}

/**
 * Pesquisa uma sequencia no arquivo, come‡ando com a linha atual que est 
 * sendo exibida. Se encontrar uma coincidˆncia, a linha que a cont‚m ser 
 * real‡ada.
 */
void FileSearch(void)
{
	int Col;
	int I;
	int P;
	char *Ptr;
	char SearchStr[81];
	char *S;
	char Line[81];

	for (Col = 1; Col <= 78; Col++)
	{
		Screen[24][Col].Ch = ' ';
	}

	gotoxy(2, 25);
	printf("Pesquisa: ");

	/* Pega a sequˆncia de pesquisa */
	if ((S = GetStr(SearchStr)) == NULL)
	{
		/* Nenhuma sequˆncia informada */
		DisplayCommands();
		return;
	}

	I = Lc;
	do
	{
		P = LinePtr[I];
		for (Col = 0; Col < 80 && BufPtr[P + Col] != CR; Col++)
		{
			Line[Col] = BufPtr[P + Col];
		}

		/* Encerra a sequˆncia de linha */
		Line[Col] = '\0';
		/* Procura uma coincidˆncia */
		Ptr = strstr(Line, S);
		I++;
	} while(Ptr == NULL && I <= End);

	if (Ptr != NULL)
	{
		if (I > Lc + ScrSize)
		{
			Lc = I - ScrSize;
			ShowScreen();
		}

		/* Realoca a linha onde est  a coincidˆncia */
		for (Col = 0; Col < 80; Col++)
		{
			Screen[I - Lc][Col].Attr = 112;
		}

		/* Aguarda que uma tecla seja pressionada */
		if (getch() == 0)
		{
			(void)getch();
		}

		/* Configura a linha de texto de volta ao normal */
		for (Col = 0; Col < 80; Col++)
		{
			Screen[I - Lc][Col].Attr = 7;
		}

		DisplayCommands();
	}
}

/**
 * Processa as teclas de entrada.
 */
void ProcessInput(char Ch)
{
	switch(Ch)
	{
		case PgUp:
			if (Lc - ScrSize > 0)
			{
				Lc -= ScrSize;
			}
			else
			{
				Lc = 0;
			}

			ShowScreen();
			break;
		case PgDn:
			if (Lc + ScrSize < Bot && Bot >= ScrSize)
			{
				Lc += ScrSize;
			}
			else
			{
				Lc = Bot;
			}

			ShowScreen();
			break;
		case UpKey:
			if (Lc > 0)
			{
				Lc--;
				ShowScreen();
			}

			break;
		case DnKey:
			if (Lc < Bot && Bot >= ScrSize)
			{
				Lc++;
				ShowScreen();
			}

			break;
		case Home:
			Lc = 0;
			ShowScreen();
			break;
		case EndKey:
			if (Bot >= ScrSize)
			{
				Lc = Bot;
				ShowScreen();
			}

			break;
		case AltS:
			FileSearch();
			break;
	}
}
