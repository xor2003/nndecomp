#include <dos.h>
#include "tfsounit.h"

TxBuff ScrnBuff(80, 25, VideoPtr());

Tfso::Tfso(int Ba, int Fa, ColorPack &Cp) : Fso(Ba, Fa, Cp)
{
	Overall = new Trso(&ScrnBuff);
	Frame = new Trso(&ScrnBuff);
	Interior = new Trso(&ScrnBuff);
	SaveBuff = NULL;

	if (HasShadow()) {
		HzShadow = new Tfso(0x00, Swappable, Cp);
		VtShadow = new Tfso(0x00, Swappable, Cp);
	} else {
		HzShadow = NULL;
		VtShadow = NULL;
	}
}

Tfso::~Tfso(void)
{
	if (IsSwappable()) {
		delete SaveBuff;
	}

	if (HasShadow()) {
		delete HzShadow;
		delete VtShadow;
	}

	delete Frame;
	delete Interior;
	delete Overall;
}

void Tfso::SetSize(int W, int H)
{
	Interior->SetSize(W, H);
	Frame->SetSize(W + Bwd * 2, H + Bwd * 2);

	if (HasShadow()) {
		Overall->SetSize(Frame->Wd + 2, Frame->Ht + 1);
		HzShadow->SetSize(Frame->Wd + 1, 1);
		VtShadow->SetSize(2, Frame->Ht - 1);
	} else {
		Overall->SetSize(Frame->Wd, Frame->Ht);
	}

	if (IsSwappable()) {
		if (SaveBuff == NULL) {
			SaveBuff = new Trso(NULL);
		}

		SaveBuff->SetSize(Frame->Wd, Frame->Ht);
	}
}

void Tfso::SetLocn(int X, int Y)
{
	Frame->SetLocn(X, Y);
	Interior->SetLocn(X + Bwd, Y + Bwd);
	switch(Fattr & AnyShadow) {
		case SEShadow:
			Overall->SetLocn(Frame->Xul, Frame->Yul);
			HzShadow->SetLocn(Frame->Xul + 1, Frame->Ylr + 1);
			VtShadow->SetLocn(Frame->Xlr + 1, Frame->Yul + 1);
			break;
		case NEShadow:
			Overall->SetLocn(Frame->Xul, Frame->Yul - 1);
			HzShadow->SetLocn(Frame->Xul + 1, Frame->Yul - 1);
			VtShadow->SetLocn(Frame->Xlr + 1, Frame->Yul);
			break;
		case NWShadow:
			Overall->SetLocn(Frame->Xul - 2, Frame->Yul - 1);
			HzShadow->SetLocn(Frame->Xul - 2, Frame->Yul - 2);
			VtShadow->SetLocn(Frame->Xul - 2, Frame->Yul);
			break;
		case SWShadow:
			Overall->SetLocn(Frame->Xul - 2, Frame->Yul);
			HzShadow->SetLocn(Frame->Xul - 2, Frame->Ylr + 1);
			VtShadow->SetLocn(Frame->Xul - 2, Frame->Yul + 1);
			break;
		default:
			// Sem sombreado.
			Overall->SetLocn(Frame->Xul, Frame->Yul);
			break;
	}
}

void Tfso::DrawFrame(char Ba, char Attr)
{
	if (Bwd > 0) {
		if (Ba == 0) {
			Ba = (Bstyle << 4) + Bwd;
		}

		if (Attr == 0) {
			Attr = Colors.Bc;
		}

		Frame->Box(0, 0, Frame->Wd, Frame->Ht, Ba, Attr);
		if (IsCloseable()) {
			Frame->HzWrt(1, 0, "\xB4\x08\xC3", Colors.Bc);
		}
	}
}

int Tfso::OnCloseButton(int X, int Y)
{
	return IsCloseable() && (Bwd > 0) &&
				 (Y == Frame->Yul) && (X == Frame->Xul + 2);
}

void Tfso::Clear(char Ch, char Attr)
{
	if (Attr > 0) {
		Colors.Wc = Attr;
	}

	Interior->Fill(0, 0, Interior->Wd, Interior->Ht, Ch, Colors.Wc);
}

void Tfso::GetImage(Rect *C)
{
	if (IsSwappable()) {
		SaveBuff->Xfr(0, 0, SaveBuff->Wd, SaveBuff->Ht, (Trso *)Frame, 0, 0);
		DrawShadows(C, GetIm, false);
	}
}

void Tfso::PutImage(Rect *C)
{
	if (IsSwappable()) {
		Trso *Tf = (Trso *)Frame;
		Tf->Xfr(0, 0, Tf->Wd, Tf->Ht, SaveBuff, 0, 0);
		DrawShadows(C, PutIm, false);
	}
}

void Tfso::Swap(Rect *C, XfrDirn Xd)
{
	if (IsSwappable()) {
		Trso *Tf = (Trso *)Frame;
		Tf->Swap(0, 0, Tf->Wd, Tf->Ht, SaveBuff, 0, 0);
		DrawShadows(C, Xd, true);
	}
}

void Tfso::DrawShadows(Rect *C, XfrDirn Xd, int DrawIt)
{
	if (HasShadow()) {
		HzShadow->ShadowXfr(C, Xd, DrawIt);
		VtShadow->ShadowXfr(C, Xd, DrawIt);
	}
}

void Tfso::ShadowXfr(Rect *C, XfrDirn Xd, int DrawIt)
{
	int X;
	int Y;
	int W;
	int H;
	Trso *Tp = (Trso *)Overall;

	X = Tp->Xul - C->Xul;
	Y = Tp->Yul - C->Yul;
	W = Tp->Wd;
	H = Tp->Ht;

	if (C->HzClip(X, Y, W) && C->VtClip(X, Y, H)) {
		X -= Tp->Xul - C->Xul;
		Y -= Tp->Yul - C->Yul;

		if (Xd == PutIm) {
			// Do buffer para a tela.
			Tp->Xfr(X, Y, W, H, SaveBuff, 0, 0);
		} else {
			// Da tela para o buffer, ou seja, poss¡vel troca.
			SaveBuff->Xfr(0, 0, W, H, Tp, X, Y);
			if (DrawIt) {
				Tp->FillB(X, Y, W, H, 8, 1);
			}
		}
	}
}

Tskel::Tskel(ColorPack &Cp) : Fso(0x31, Swappable + Stretchable, Cp)
{
	int I;

	Overall = new Trso(&ScrnBuff);
	Frame = new Trso(&ScrnBuff);
	Interior = new Trso(&ScrnBuff);

	for (I = 0; I < 4; I++) {
		Slides[I] = NULL;
	}

	SetSize(80, 25);
}

Tskel::~Tskel(void)
{
	int I;

	for (I = 0; I < 4; I++) {
		delete Slides[I];
	}
}

void Tskel::SetSize(int W, int H)
{
	int I;

	Interior->SetSize(W, H);
	Frame->SetSize(Interior->Wd + 2, Interior->Ht + 2);
	Overall->SetSize(Interior->Wd + 2, Interior->Ht + 2);

	for (I = 0; I < 4; I++) {
		if (Slides[I] == NULL) {
			Slides[I] = new Trso(NULL);
		}

		if (I < 2) {
			// Superior e inferior.
			Slides[I]->SetSize(Frame->Wd, 1);
		} else {
			// Direito e esquerdo.
			Slides[I]->SetSize(1, Frame->Ht);
		}

		Slides[I]->Pic->Fill(0, 0, Slides[I]->Pic->Wd,
												 Slides[I]->Pic->Ht, ' ', Colors.Bc);
	}
}

void Tskel::DrawFrame(char Ba, char Attr)
{
	if (Bwd > 0) {
		if (Ba == 0) {
			Ba = (Bstyle << 4) + Bwd;
		}

		if (Attr == 0) {
			Attr = Colors.Bc;
		}

		Frame->Box(0, 0, Frame->Wd, Frame->Ht, Ba, Attr);
	}
}

void Tskel::GetImage(Rect *)
{
	Trso *Tf = (Trso *)Frame;

	if ((Tf->Ht < 1) || (Tf->Wd < 1)) {
		return;
	}

	// Linha superior.
	Slides[0]->Xfr(0, 0, Tf->Wd, 1, Tf, 0, 0);

	// Linha inferior.
	Slides[1]->Xfr(0, 0, Tf->Wd, 1, Tf, 0, Tf->Ht-1);

	if (Tf->Ht > 2) {
		// Lado esquerdo.
		Slides[2]->Xfr(0, 0, 1, Tf->Ht - 2, Tf, 0, 1);

		// Lado direito.
		Slides[3]->Xfr(0, 0, 1, Tf->Ht - 2, Tf, Tf->Wd - 1, 1);
	}
}

void Tskel::PutImage(Rect *)
{
	Trso *Tf = (Trso *)Frame;

	if ((Tf->Ht < 1) || (Tf->Wd < 1)) {
		return;
	}

	// Linha superior.
	Tf->Xfr(0, 0, Tf->Wd, 1, Slides[0], 0, 0);

	// Linha inferior.
	Tf->Xfr(0, Tf->Ht - 1, Tf->Wd, 1, Slides[1], 0, 0);

	if (Tf->Ht > 2) {
		// Lado esquerdo.
		Tf->Xfr(0, 1, 1, Tf->Ht - 2, Slides[2], 0, 0);

		// Lado direito.
		Tf->Xfr(Tf->Wd - 1, 1, 1, Tf->Ht - 2, Slides[3], 0, 0);
	}
}

void Tskel::Swap(Rect *, XfrDirn)
{
	Trso *Tf = (Trso *)Frame;

	if ((Tf->Ht < 1) || (Tf->Wd < 1)) {
		return;
	}

	// Linha superior.
	Tf->Swap(0, 0, Tf->Wd, 1, Slides[0], 0, 0);

	// Linha inferior.
	Tf->Swap(0, Tf->Ht - 1, Tf->Wd, 1, Slides[1], 0, 0);

	if (Tf->Ht > 2) {
		// Lado esquerdo.
		Tf->Swap(0, 1, 1, Tf->Ht - 2, Slides[2], 0, 0);

		// Lado direito.
		Tf->Swap(Tf->Wd - 1, 1, 1, Tf->Ht - 2, Slides[3], 0, 0);
	}
}
