#ifndef H_TRSOUNIT
#define H_TRSOUNIT

// Objeto de tela retangular de texto.

#include "msmouse.h"
#include "txunit.h"
#include "rsounit.h"

class Trso : public Rso {
public:
	TxBuff *Pic;

	Trso(TxBuff *T);
	virtual ~Trso(void);
	virtual void SetSize(int W, int H);
	virtual void SetLocn(int Xl, int Yl);
	virtual void HzWrt(int X, int Y, char *Str, char Attr);
	virtual void HzWrtB(int X, int Y, char *Str);
	virtual void Fill(int X, int Y, int W, int H, char Ch, char Attr);
	virtual void FillB(int X, int Y, int W, int H, char Ch, char Opt);
	virtual void Box(int X, int Y, int W, int H, char Ba, char Attr);
	virtual void Scroll(ScrollDir Sd, int Amt);
	virtual void Swap(int X, int Y, int W, int H, Trso *Other, int Xs, int Ys);
	virtual void Xfr(int X, int Y, int W, int H, Trso *Src, int Xs, int Ys);
};

#endif
