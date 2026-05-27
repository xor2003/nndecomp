#include <stdlib.h>
#include <bios.h>
#include <conio.h>
#include <msmouse.h>

unsigned E;
int Mx;
int My;
char Ch;

void main(void)
{
	Mouse.Setup(TextScreen);
	if (!Mouse.SetupOk()) {
		cprintf("Mouse nÆo detectado.\n");
		exit(-1);
	}

	clrscr();
	gotoxy(35, 12);
	cprintf("Pressione aqui para\n");
	gotoxy(35, 13);
	cprintf("encerrar o programa\n");
	gotoxy(1, 21);
	cprintf("Evento atual de botÆo: sem evento\n");
	gotoxy(1, 23);
	cprintf("Localiza‡Æo atual do mouse (X, Y): \n");
	gotoxy(1, 1);
	cprintf("Pressione aqui para desativar o mouse\r\n");

	do {
		E = Mouse.Event(Mx, My);
		switch(E) {
			case LMouseDown:
				gotoxy(23, 21);
				cprintf("LPressed  ");
				break;
			case RMouseDown:
				gotoxy(23, 21);
				cprintf("RPressed  ");
				break;
			case LMouseStillDown:
				gotoxy(23, 21);
				cprintf("LStill Down");
				break;
			case RMouseStillDown:
				gotoxy(23, 21);
				cprintf("RStill Down");
				break;
			case LMouseUp:
				gotoxy(23, 21);
				cprintf("LMouseUp   ");
				break;
			case RMouseUp:
				gotoxy(23, 21);
				cprintf("RMouseUp   ");
				break;
		}

		gotoxy(23, 23);
		cprintf("(%d, %d)    \n", Mx, My);
		if ((E == LMouseDown) && (Mx >= 0) && (Mx <= 26) && (My == 0)) {
			Mouse.TurnOff();
			gotoxy(1, 1);
			cprintf("Pressione qualquer tecla para reativar o mouse\n");
			bioskey(0);
			gotoxy(1, 1);
			cprintf("Pressione aqui para desativar o mouse         \n");
			Mouse.TurnOn();
		}
	} while((E != MouseDown) || (Mx <= 33) || (Mx >= 47) || (My <= 10) ||
				 (My >= 13));

	Mouse.TurnOff();
}

