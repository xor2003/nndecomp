#ifndef SCREEN_H
#define SCREEN_H

#include "main.h"

// Estrutura utilizada para acesso direto … tela.
struct Texel {
	char Ch;
	// Atributo do caractere.
	unsigned char Attr;
};

// A tela
typedef Texel ScreenArea[25][80];

class ScreenClass {
public:
	ScreenArea far *ScreenPtr;
	int ScrSize;

	ScreenClass(unsigned Segment, unsigned Offset);
	virtual ~ScreenClass(void);
	char Get(int X, int Y);

	// Coloca um caractere na tel‡a em uma determinada localiza‡Æo.
	void Put(int X, int Y, char Ch, unsigned char Attr);

	// Real‡a uma linha na tela.
	void MarkLine(int Row, unsigned char Attr);
};

#endif
