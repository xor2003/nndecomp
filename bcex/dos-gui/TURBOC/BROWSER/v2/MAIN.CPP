#include "main.h"
#include "browser.h"
#include "screen.h"
#include "buffer.h"
#include "hexbuf.h"

// Determina o tipo de monitor instalado e devolve o seu endere‡o de mem¢ria.
long SelectMonitor(void)
{
	REGS Regs;

	Regs.h.ah = 15;
	int86(0x10, &Regs, &Regs);
	if (Regs.h.al == 7) {
		// Monocrom tico.
		return 0xB000;
	}

	// Gr fico.
	return 0xB800;
}

char *GetStr(char *Str)
{
	char Ch;
	int Count = 0;

	while((Ch = getch()) != 13 && Ch != EscKey) {
		printf("%c", Ch);
		Str[Count++] = Ch;
	}

	if (Ch == EscKey) {
		// Encerra a sequˆncia.
		return NULL;
	}

	Str[Count] = '\0';
	return Str;
}

char *ChToHex(char *Str, char Ch)
{
	const char HexDigits[17] = "0123456789ABCDEF";

	// Cria uma sequˆncia de dois caracteres.
	strncpy(Str, &HexDigits[Ch >> 4], 1);
	strncpy(&Str[1], &HexDigits[Ch & 0x0F], 1);
	return Str;
}

int main(int argc, char *argv[])
{
	char Ch;
	ScreenClass *screen;
	Browser *browser;
	Buffer *buffer;
	HexBuffer *hexBuffer;

	clrscr();
	if (argc != 2) {
		printf("N£mero incorreto de argumentos.\n");
		printf("Para percorrer um arquivo, use o comando:\n");
		printf("\tbrowse <nome_arquivo>\n");
		exit(-1);
	}

	if (!(screen = new ScreenClass(SelectMonitor(), 0x00))) {
		printf("Mem¢ria insuficiente\n");
		exit(-2);
	}

	if (!(buffer = new Buffer())) {
		printf("Mem¢ria insuficiente\n");
		delete screen;
		exit(-3);
	}

	if (!(buffer->OpenAndRead(argv[1]))) {
		delete buffer;
		delete screen;
		exit(-4);
	}

	buffer->SetLines();
	// Cria outro buffer hexadecimal com base no existente.
	if (!(hexBuffer = new HexBuffer())) {
		printf("Mem¢ria insuficiente\n");
		delete buffer;
		delete screen;
		exit(-5);
	}

	hexBuffer->Dup(buffer);

	if (!(browser = new Browser(screen, buffer, hexBuffer))) {
		printf("Mem¢ria insuficiente\n");
		delete hexBuffer;
		delete buffer;
		delete screen;
		exit(-6);
	}

	// Apresenta a configura‡Æo inicial do programa.
	browser->DisplayFStat();
	browser->DisplayCommands();
	browser->SetLPtr();
	browser->ShowScreen();

	// Processa teclas at‚ que a tecla Esc seja pressionada.
	do {
		Ch = getch();
		switch(Ch) {
		case 0:
			// Pressionada a tecla extendida.
			Ch = getch();
			browser->ProcessInput(Ch);
			break;
		case EscKey:
			break;
		default:
			// Tecla ilegal, soa campainha.
			putch(7);
			break;
		}
	} while(Ch != EscKey);

	// Remove os objetos da mem¢ria.
	delete browser;
	delete buffer;
	delete hexBuffer;
	delete screen;

	// Restaura a tela de volta ao normal.
	textbackground(0);
	textcolor(7);
	clrscr();

	return 0;
}
