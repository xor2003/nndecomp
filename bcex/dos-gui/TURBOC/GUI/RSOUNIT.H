#ifndef H_RSOUNIT
#define H_RSOUNIT

#include "guimain.h"
#include "scrnsty.h"

class Rect
{
public:
	int Xul;
	int Yul;
	int Xlr;
	int Ylr;
	int Wd;
	int Ht;

	Rect(int X, int Y, int W, int H);
	virtual ~Rect(void) {}
	virtual void SetSize(int W, int H);
	virtual void SetLocn(int Xl, int Yl);
	virtual void ClipSize(int &W, int &H);
	virtual void ClipDim(int &X, int &Y, int &W, int &H);
	virtual int HzClip(int &X, int &Y, int &N);
	virtual int VtClip(int &X, int &Y, int &N);
	virtual int Contains(int X, int Y);
	virtual int Touches(Rect *R);
};

class Rso : public Rect
{
public:
	Rso(int X, int Y, int W, int H) : Rect(X, Y, W, H) {};
	virtual void HzWrt(int, int, char *, char) = 0;
	virtual void HzWrtB(int, int, char *) = 0;
	virtual void Fill(int, int, int, int, char, char) = 0;
	virtual void FillB(int, int, int, int, char, char) = 0;
	virtual void Box(int, int, int, int, char, char) = 0;
	virtual void Scroll(ScrollDir, int) {};
};

#endif
