#ifndef H_FSOUNIT
#define H_FSOUNIT

// Classe abstrata de Object Screen Framed (FSO).

#include <stdlib.h>
#include "rsounit.h"

enum CoordType
{
	Relc,
	Absc
};

enum XfrDirn
{
	GetIm,
	PutIm
};

class Fso
{
public:
	Rso *Overall;
	Rso *Frame;
	Rso *Interior;
	int Bwd;
	int Bstyle;
	int Fattr;
	ColorPack Colors;

	Fso(int Ba, int Fa, ColorPack &Cp);
	virtual ~Fso(void) {};
	virtual int IsSwappable(void);
	virtual int IsCloseable(void);
	virtual int IsStretchable(void);
	virtual int HasShadow(void);
	virtual void SetSize(int W, int H);
	virtual void SetLocn(int X, int Y);
	virtual int OnFrame(int X, int Y);
	virtual int OnInterior(int X, int Y);
	virtual int OnBorder(int X, int Y);
	virtual int OnCloseButton(int X, int Y);
	virtual int Touches(Fso *F);
	virtual void Clear(char, char) {};
	virtual void DrawFrame(char, char) {};
	virtual void GetImage(Rect *) {};
	virtual void PutImage(Rect *) {};
	virtual void ShadowXfr(Rect *, XfrDirn, int) {};
	virtual void DrawShadows(Rect *, XfrDirn, int) {};
	virtual void Swap(Rect *, XfrDirn) {};
	virtual void Scroll(ScrollDir Sd, int Amt);
	virtual void HzWrt(int X, int Y, char *Str, char Attr);
	virtual void HzWrtB(int X, int Y, char *Str);
	virtual void Fill(int X, int Y, int W, int H, char Ch, char Attr);
	virtual void FillB(int X, int Y, int W, int H, char Ch, char Opt);
	virtual void Box(int X, int Y, int W, int H, char Ba, char Attr);
	virtual int TextWidth(char *)
	{
		return 0;
	}
	virtual int TextHeight(int)
	{
		return 0;
	}
};

#endif
