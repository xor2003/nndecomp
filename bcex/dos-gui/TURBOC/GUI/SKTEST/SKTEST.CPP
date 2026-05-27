#include <dos.h>
#include "txunit.h"
#include "keyboard.h"

void main(void)
{
	int K;
	int X;
	int Y;

	TxBuff Scrn(VideoPtr());
	Scrn.SetSize(80, 25);

	Scrn.Fill(0, 0, 80, 25, 176, 0x0F);

	TxBuff Win(Scrn.TxRam);
	Win.SetSize(80, 25);
	Win.SetLocn(30, 7);

	TxBuff SaveBuff(0);
	SaveBuff.SetSize(23, 7);
	SaveBuff.Xfr(0, 0, 23, 7, &Win, 0, 0);

	Win.Fill(0, 0, 21, 6, ' ', 0x70);
	// Sombreado vertical.
	Win.FillB(21, 1, 2, 6, 0x08, 1);
	// Sombreado horizontal.
	Win.FillB(1, 6, 22, 1, 0x08, 1);

	Win.HzWrtB(1, 1, "Eu sou uma janela. Use");
	Win.HzWrtB(1, 2, "as teclas shift set para");
	Win.HzWrtB(1, 3, "mover-me. Use a tecla");
	Win.HzWrtB(1, 4, "ENTER para encerrar...");

	X = 30;
	Y = 7;

	do {
		// Aguarda uma tecla.
		K = KeyEvent();
		if (IsShiftArrow(K)) {
			// Oculta.
			Scrn.Swap(X, Y, 23, 7, &SaveBuff, 0, 0);
			switch(K) {
				case LeftKey:
					if (X > 0) {
						X--;
					}
					break;
				case RightKey:
					if (X < (80-23)) {
						X++;
					}
					break;
				case UpKey:
					if (Y > 0) {
						Y--;
					}
					break;
				case DownKey:
					if (Y < (25-7)) {
						Y++;
					}
					break;
				default:
					break;
			}

			// Mostra.
			Scrn.Swap(X, Y, 23, 7, &SaveBuff, 0, 0);
			Win.SetLocn(X, Y);
		}
	} while(K != CrKey);

	// Move a janela de volta ao centro.
	Scrn.Swap(X, Y, 23, 7, &SaveBuff, 0, 0);
	Scrn.Swap(30, 7, 23, 7, &SaveBuff, 0, 0);
	Win.SetLocn(30, 7);

	Win.Fill(0, 0, 21, 6, ' ', 0x70);
	Win.HzWrtB(2, 1, "Agora, abaixo est  um ");
	Win.HzWrtB(2, 2, "scanner. Pressione ");
	Win.HzWrtB(2, 3, "Enter para par -lo");

	X = 0;
	do {
		// Apaga o scanner.
		Win.Fill(X, 4, 1, 1, ' ', 0x70);
		if (X < 19) {
			X++;
		} else {
			X = 1;
		}

		// Tra‡a o scanner.
		Win.Fill(X, 4, 1, 1, 176, 0x70);
		delay(10);

		// Procura, mas nÆo espera por um toque.
		K = KeyEvent();
	} while(K == 0);

	char *MenuChoices[4] = {
		"Faz algo",
		"Fique frio",
		"S¢ diga nÆo",
		"V  para Miami"
	};

	Win.Fill(0, 0, 21, 6, ' ', 0x70);
	Win.HzWrtB(1, 1, MenuChoices[0]);
	Win.HzWrtB(1, 2, MenuChoices[1]);
	Win.HzWrtB(1, 3, MenuChoices[2]);
	Win.HzWrtB(1, 4, MenuChoices[3]);

	Win.HzWrt(0, 8, "Use as teclas de seta para  ", 0x7F);
	Win.HzWrt(0, 9, "mover o real‡ado. Use ENTER  ", 0x7F);
	Win.HzWrt(0, 10, "para selecionar, ESC para  ", 0x7F);
	Win.HzWrt(0, 11, "cancelar...                 ", 0x7F);

	X = 1;
	Y = 1;

	// Cria o primeiro real‡ado.
	Win.HzFillB(X, Y, 0x07, 1, 19);

	do {
		K = bioskey(0);

		// Apaga o real‡ado anterior.
		Win.HzFillB(X, Y, 0x70, 1, 19);
		switch(K) {
			case UpKey:
				if (Y > 1) {
					Y--;
				} else {
					Y = 4;
				}

				break;
			case DownKey:
				if (Y < 4) {
					Y++;
				} else {
					Y = 1;
				}

				break;
			default:
				break;
		}

		// Cria um novo real‡ado.
		Win.HzFillB(X, Y, 0x07, 1, 19);
	} while((K != CrKey) && (K != EscKey));

	Win.Fill(0, 8, 22, 4, 176, 0x0F);

	// Processa a escolha.
	if (K == CrKey) {
		char Saywhat[80];
		strcpy(Saywhat, "Lamento, nÆo podemos permitir ");
		strcat(Saywhat, MenuChoices[Y - 1]);
		Win.HzWrt(0, 8, Saywhat, 0x7F);
	} else {
		Win.HzWrt(0, 8, "Vocˆ nÆo pode completar sua ideia?", 0x7F);
	}

	// Rola uma linha para cima. Coloque-a em outra entrada de menu.
	Win.HzWrt(0, 9, "Mas pressione RETURN e veja o menu rolar!", 0x7F);
	bioskey(0);

	Win.Scroll(1, 1, 19, 4, UpScroll, 3);
	Win.HzWrtB(1, 4, "*** Fim ***");
}
