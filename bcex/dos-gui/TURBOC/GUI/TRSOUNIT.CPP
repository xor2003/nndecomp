#include <stdlib.h>
#include <string.h>
#include "trsounit.h"

Trso::Trso(TxBuff *T) : Rso(0, 0, 0, 0)
{
	if (T == 0) {
		Pic = new TxBuff(0);
	} else {
		Pic = new TxBuff(T->TxRam);
		Rso::SetSize(T->Wd, T->Ht);
		Pic->SetSize(T->Wd, T->Ht);
	}
}

Trso::~Trso(void)
{
	delete Pic;
}

void Trso::SetSize(int W, int H)
{
	Rso::SetSize(W, H);
	if (!Pic->Aliased) {
		Pic->SetSize(W, H);
	}
}

void Trso::SetLocn(int Xl, int Yl)
{
	Rso::SetLocn(Xl, Yl);
	Pic->SetLocn(Xl, Yl);
}

void Trso::HzWrt(int X, int Y, char *Str, char Attr)
{
	int Cnt;
	int Offset;

	Cnt = strlen(Str);
	if (X < 0) {
		Offset = -X;
	} else {
		Offset = 0;
	}

	if (HzClip(X, Y, Cnt)) {
		Mouse.Hide();
		Pic->HzWrt(X, Y, Str + Offset, Attr, Cnt);
		Mouse.Show();
	}
}

void Trso::HzWrtB(int X, int Y, char *Str)
{
	int Cnt;
	int Offset;

	Cnt = strlen(Str);
	if (X < 0) {
		Offset = -X;
	} else {
		Offset = 0;
	}

	if (HzClip(X, Y, Cnt)) {
		Mouse.Hide();
		Pic->HzWrtB(X, Y, Str + Offset, Cnt);
		Mouse.Show();
	}
}

void Trso::Fill(int X, int Y, int W, int H, char Ch, char Attr)
{
	if (((H == 1) && HzClip(X, Y, W)) ||
			((W == 1) && VtClip(X, Y, H)) ||
			(VtClip(X, Y, H) && HzClip(X, Y, W))) {
		Mouse.Hide();
		Pic->Fill(X, Y, W, H, Ch, Attr);
		Mouse.Show();
	}
}

void Trso::FillB(int X, int Y, int W, int H, char Ch, char Opt)
{
	if (((H == 1) && HzClip(X, Y, W)) ||
			((W == 1) && VtClip(X, Y, H)) ||
			(VtClip(X, Y, H) && HzClip(X, Y, W))) {
		Mouse.Hide();
		Pic->FillB(X, Y, W, H, Ch, Opt);
		Mouse.Show();
	}
}

void Trso::Box(int X, int Y, int W, int H, char Ba, char Attr)
{
	unsigned char Bw, Bs, I;

	// Largura da margem.
	Bw = (unsigned char)Ba & 0x000F;

	// Estilo de margem.
	Bs = ((unsigned char)Ba >> 4) & 0x000F;

	if (Bs < 4) {
		Mouse.Hide();
		for (I = 0; I < Bw; I++, X++, Y++, W-= 2, H -=2) {
			Fill(X, Y, W, 1, LineChars[Bs][HzBar], Attr);
			Fill(X, Y, 1, H, LineChars[Bs][VtBar], Attr);
			Fill(X, Y, 1, 1, LineChars[Bs][Ulc], Attr);
			Fill(X + W - 1, Y, 1, H, LineChars[Bs][VtBar], Attr);
			Fill(X + W - 1, Y, 1, 1, LineChars[Bs][Urc], Attr);
			Fill(X, Y + H - 1, W, 1, LineChars[Bs][HzBar], Attr);
			Fill(X, Y + H - 1, 1, 1, LineChars[Bs][Llc], Attr);
			Fill(X + W - 1, Y + H - 1, 1, 1, LineChars[Bs][Lrc], Attr);
		}

		Mouse.Show();
	}
}

void Trso::Scroll(ScrollDir Sd, int Amt)
{
	Mouse.Hide();
	Pic->Scroll(0, 0, Wd, Ht, Sd, Amt);
	Mouse.Show();
}

void Trso::Swap(int X, int Y, int W, int H, Trso *Other, int Xs, int Ys)
{
	if (HzClip(X, Y, W) && Other->HzClip(Xs, Ys, W)) {
		if (VtClip(X, Y, H) && Other->VtClip(Xs, Ys, H)) {
			Mouse.Hide();
			Pic->Swap(X, Y, W, H, Other->Pic, Xs, Ys);
			Mouse.Show();
		}
	}
}

void Trso::Xfr(int X, int Y, int W, int H, Trso *Src, int Xs, int Ys)
{
	if (HzClip(X, Y, W) && Src->HzClip(Xs, Ys, W)) {
		if (VtClip(X, Y, H) && Src->VtClip(Xs, Ys, H)) {
			Mouse.Hide();
			Pic->Xfr(X, Y, W, H, Src->Pic, Xs, Ys);
			Mouse.Show();
		}
	}
}
