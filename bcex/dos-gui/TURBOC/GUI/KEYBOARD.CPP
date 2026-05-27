// Driver de teclado.

#include "keyboard.h"

// Procura uma tecla pressionada. Se encontrada, a tecla ‚ removida
// do buffer de teclado e devolvida.
unsigned KeyEvent(void)
{
	unsigned E;
	E = bioskey(1);
	if (E != 0) {
		E = bioskey(0);
	}

	return E;
}

int IsShiftArrow(unsigned K)
{
	int M = bioskey(2) >> 8;

	return (K == ShiftLeft) || (K == ShiftRight) ||
				 (K == ShiftUpKey) || (K == ShiftDnKey) ||
				 ((M == 1 || M == 2) && ((K == LeftKey) ||
				 (K == UpKey) || (K == RightKey) || (K == DownKey)));
}
