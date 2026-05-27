#ifndef H_TFSOUNIT
#define H_TFSOUNIT

// Objetos de tela de quadro de texto (Tfso).

#include <string.h>
#include "trsounit.h"
#include "fsounit.h"

class Tfso : public Fso
{
public:
	Trso *SaveBuff;
	Tfso *HzShadow;
	Tfso *VtShadow;

	Tfso(int Ba, int Fa, ColorPack &Cp);
	virtual ~Tfso(void);
	virtual void SetSize(int W, int H);
	virtual void SetLocn(int X, int Y);
	virtual int OnCloseButton(int X, int Y);
	virtual void DrawFrame(char Ba, char Attr);
	virtual void Clear(char Ch, char Attr);
	virtual void GetImage(Rect *C);
	virtual void PutImage(Rect *C);
	virtual void ShadowXfr(Rect *C, XfrDirn Xd, int DrawIt);
	virtual void DrawShadows(Rect *C, XfrDirn Xd, int DrawIt);
	virtual void Swap(Rect *C, XfrDirn Xd);
	virtual int TextWidth(char *Str)
	{
		return strlen(Str);
	}
	virtual int TextHeight(int N)
	{
		return N;
	}
};

// Objecto de tela de quatro de tipo esqueleto de texto.
class Tskel : public Fso
{
public:
	// Superior, inferior, esquerdo e direito.
	Trso *Slides[4];

	Tskel(ColorPack &Cp);
	virtual ~Tskel(void);
	virtual void SetSize(int W, int H);
	virtual void DrawFrame(char Ba, char Attr);
	virtual void GetImage(Rect *C);
	virtual void PutImage(Rect *C);
	virtual void Swap(Rect *C, XfrDirn Xd);
};

// Buffer do texto apresentado na tela.
extern TxBuff SrcnBuff;

#endif
