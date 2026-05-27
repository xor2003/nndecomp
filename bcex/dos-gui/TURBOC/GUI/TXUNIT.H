#ifndef H_TXUNIT
#define H_TXUNIT

// Fornece suporte para tela de baixo n¡vel com o uso do TxBuff.

#include "scrnsty.h"
#include "string.h"

struct Texel
{
	unsigned char Ch;
	unsigned char Attr;
};

typedef Texel far *TexelPtr;

class TxBuff
{
public:
	// Largura em texels.
	int Wd;
	// Altura em texels.
	int Ht;
	// Ponteiro para o buffer de texel.
	TexelPtr TxRam;
	// Ponteiro para a origem.
	TexelPtr OrgPtr;
	// Verdadeiro se o buffer possuir sin“nimo.
	char Aliased;

	TxBuff(TexelPtr T);
	TxBuff(int W, int H, TexelPtr T);
	~TxBuff(void);
	void SetRamPtr(TexelPtr T);
	TexelPtr TxRamAddr(int X, int Y);
	TexelPtr RelAddr(int X, int Y);
	void SetSize(int W, int H);
	void SetLocn(int X, int Y);
	void Swap(int X, int Y, int W, int H, TxBuff *Other, int Xs, int Ys);
	void Xfr(int X, int Y, int W, int H, TxBuff *Other, int Xs, int Ys);
	void Scroll(int X, int Y, int W, int H, ScrollDir Sd, int Amt);
	void Fill(int X, int Y, int W, int H, char Ch, char Attr);
	void FillB(int X, int Y, int W, int H, char Ch, char Opt);
	void HzWrt(int X, int Y, char *Str, char Attr, unsigned Cnt);
	void HzWrt(int X, int Y, char *Str, char Attr)
	{
		HzWrt(X, Y, Str, Attr, strlen(Str));
	}
	void HzWrtB(int X, int Y, char *Str, unsigned Cnt);
	void HzWrtB(int X, int Y, char *Str)
	{
		HzWrtB(X, Y, Str, strlen(Str));
	}
	void HzFill(int X, int Y, char Ch, char Attr, unsigned Cnt)
	{
		Fill(X, Y, Cnt, 1, Ch, Attr);
	}
	void HzFillB(int X, int Y, char Ch, char Opt, unsigned Cnt)
	{
		FillB(X, Y, Cnt, 1, Ch, Opt);
	}
};

TexelPtr VideoPtr(unsigned &Vmode, unsigned &Vpage);
TexelPtr VideoPtr(void);

#endif
