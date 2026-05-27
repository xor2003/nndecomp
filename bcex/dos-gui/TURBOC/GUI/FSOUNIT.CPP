#include "fsounit.h"

Fso::Fso(int Ba, int Fa, ColorPack &Cp)
{
	Bwd = Ba & 0x000F;
	Bstyle = (Ba >> 4) & 0x000F;
	Fattr = Fa;
	Colors = Cp;
	Frame = NULL;
	Interior = NULL;
	Overall = NULL;
}

int Fso::IsSwappable(void)
{
	return (Fattr & Swappable) != 0;
}

int Fso::IsCloseable(void)
{
	return (Fattr & Closeable) != 0;
}

int Fso::IsStretchable(void)
{
	return (Fattr & Stretchable) && IsSwappable();
}

int Fso::HasShadow(void)
{
	return (Fattr & AnyShadow) != 0;
}

int Fso::OnInterior(int X, int Y)
{
	return Interior->Contains(X, Y);
}

int Fso::OnFrame(int X, int Y)
{
	return Frame->Contains(X, Y);
}

int Fso::OnBorder(int X, int Y)
{
	return Frame->Contains(X, Y) && !Interior->Contains(X, Y);
}

int Fso::OnCloseButton(int, int)
{
	return false;
}

int Fso::Touches(Fso *F)
{
	return Overall->Touches(F->Overall);
}

void Fso::Scroll(ScrollDir Sd, int Amt)
{
	Interior->Scroll(Sd, Amt);
}

void Fso::HzWrt(int X, int Y, char *Str, char Attr)
{
	if (Attr == 0) {
		Attr = Colors.Wc;
	}

	Interior->HzWrt(X, Y, Str, Attr);
}

void Fso::HzWrtB(int X, int Y, char *Str)
{
	Interior->HzWrtB(X, Y, Str);
}

void Fso::Fill(int X, int Y, int W, int H, char Ch, char Attr)
{
	if (Attr == 0) {
		Attr = Colors.Wc;
	}

	Interior->Fill(X, Y, W, H, Ch, Attr);
}

void Fso::FillB(int X, int Y, int W, int H, char Ch, char Opt)
{
	Interior->FillB(X, Y, W, H, Ch, Opt);
}

void Fso::Box(int X, int Y, int W, int H, char Ba, char Attr)
{
	if (Attr == 0) {
		Attr = Colors.Bc;
	}

	if (Ba == 0) {
		Ba = (Bstyle << 4) + Bwd;
	}

	Interior->Box(X, Y, W, H, Ba, Attr);
}

void Fso::SetSize(int W, int H)
{
	Interior->SetSize(W, H);
	Frame->SetSize(W, H);
	Overall->SetSize(W, H);
}

void Fso::SetLocn(int X, int Y)
{
	Frame->SetLocn(X, Y);
	Overall->SetLocn(X, Y);
	Interior->SetLocn(X, Y);
}
