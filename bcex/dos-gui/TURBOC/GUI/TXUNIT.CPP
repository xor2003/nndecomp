// Fornece suporte de tela de baixo n¡vel com o uso do TxBuff
#include "txunit.h"
#include <dos.h>

#ifndef true
#define true 1
#define false 0
#endif

TxBuff::TxBuff(TexelPtr T)
{
	Wd = 0;
	Ht = 0;
	SetRamPtr(T);
}

TxBuff::TxBuff(int W, int H, TexelPtr T)
{
	SetRamPtr(T);
	SetSize(W, H);
}

void TxBuff::SetRamPtr(TexelPtr T)
{
	if (T) {
		Aliased = true;
		TxRam = T;
	} else {
		Aliased = false;
		TxRam = 0;
	}

	OrgPtr = TxRam;
}

TxBuff::~TxBuff(void)
{
	if (!Aliased) {
		delete [] TxRam;
	}
}

TexelPtr TxBuff::TxRamAddr(int X, int Y)
{
	return TxRam + Y * Wd + X;
}

TexelPtr TxBuff::RelAddr(int X, int Y)
{
	return OrgPtr + Y * Wd + X;
}

void TxBuff::SetSize(int W, int H)
{
	if (!Aliased) {
		// Quer o buffer na pilha.
		if (!TxRam) {
			// Aloca pela primeira vez.
			TxRam = new Texel[W * H];
		} else if (W * H > Wd * Ht) {
			// Necess rio realocar (maior que o existente)?
			delete [] TxRam;
			TxRam = new Texel[W * H];
		}

		OrgPtr = TxRam;
	}

	Wd = W;
	Ht = H;
}

void TxBuff::SetLocn(int X, int Y)
{
	OrgPtr = TxRamAddr(X, Y);
}

void TxBuff::Swap(int X, int Y, int W, int H, TxBuff *Other, int Xs, int Ys)
{
	int I;
	int J;
	Texel T;
	TexelPtr Dp;
	TexelPtr Sp;

	Dp = RelAddr(X, Y);
	Sp = Other->RelAddr(Xs, Ys);

	if (FP_OFF(Sp) < FP_OFF(Dp)) {
		// Pode precisar mudar de dire‡Æo.
		for (I = 0; I < H; I++) {
			Dp = RelAddr(X, Y + I);
			Sp = Other->RelAddr(Xs, Ys + I);
			for (J = 0; J < W; J++) {
				T = *Dp;
				*Dp++ = *Sp;
				*Sp++ = T;
			}
		}
	} else {
		for (I = H - 1; I >= 0; I--) {
			Dp = RelAddr(X, Y + I) + W;
			Sp = Other->RelAddr(Xs, Ys + I) + W;
			for (J = 0; J < W; J++) {
				T = *(--Dp);
				*Dp = *(--Sp);
				*Sp = T;
			}
		}
	}
}

void TxBuff::Xfr(int X, int Y, int W, int H, TxBuff *Other, int Xs, int Ys)
{
	int I;
	int J;
	TexelPtr Dp;
	TexelPtr Sp;

	Dp = RelAddr(X, Y);
	Sp = Other->RelAddr(Xs, Ys);
	if (FP_OFF(Dp) < FP_OFF(Sp)) {
		// Pode precisar mudar de dire‡Æo.
		for (I = 0; I < H; I++) {
			Dp = RelAddr(X, Y + I);
			Sp = Other->RelAddr(Xs, Ys + I);
			for (J = 0; J < W; J++) {
				*Dp++ = *Sp++;
			}
		}
	} else {
		for (I = H - 1; I >= 0; I--) {
			Dp = RelAddr(X, Y + I) + W;
			Sp = Other->RelAddr(Xs, Ys + I) + W;
			for (J = 0; J < W; J++) {
				*(--Dp) = *(--Sp);
			}
		}
	}
}

void TxBuff::Scroll(int X, int Y, int W, int H, ScrollDir Sd, int Amt)
{
	switch(Sd) {
		case UpScroll:
			Xfr(X, Y, W, H, this, X, Y + Amt);
			break;
		case DnScroll:
			Xfr(X, Y + Amt, W, H, this, X, Y);
			break;
		case LeftScroll:
			Xfr(X, Y, W, H, this, X + Amt, Y);
			break;
		case RightScroll:
			Xfr(X + Amt, Y, W, H, this, X, Y);
			break;
		default:
			break;
	}
}

void TxBuff::Fill(int X, int Y, int W, int H, char Ch, char Attr)
{
	for (int I = 0; I < H; I++) {
		TexelPtr Tp = RelAddr(X, Y + I);
		for (int J = 0; J < W; J++) {
			Tp->Ch = Ch;
			Tp->Attr = Attr;
			Tp++;
		}
	}
}

void TxBuff::FillB(int X, int Y, int W, int H, char Ch, char Opt)
{
	for (int I = 0; I < H; I++) {
		char far *P = (char far *)RelAddr(X, Y + I);
		if (Opt) {
			// Salta sobre  o byte de caracteres.
			P++;
		}

		for (int J = 0; J < W; J++) {
			 *P = Ch;
			 P += 2;
		}
	}
}

void TxBuff::HzWrt(int X, int Y, char *Str, char Attr, unsigned Cnt)
{
	TexelPtr Tp = RelAddr(X, Y);
	for (int I = 0; I < Cnt; I++, Tp++) {
		Tp->Ch = *Str++;
		Tp->Attr = Attr;
	}
}

void TxBuff::HzWrtB(int X, int Y, char *Str, unsigned Cnt)
{
	char far *P = (char far *)RelAddr(X, Y);
	for (int J = 0; J < Cnt; J++) {
		*P = *Str++;
		P += 2;
	}
}

TexelPtr VideoPtr(unsigned &Vmode, unsigned &Vpage)
{
	union REGS Regs;
	unsigned Segment;
	unsigned Offset;

	Regs.h.ah = 15;
	int86(0x10, &Regs, &Regs);
	Vmode = Regs.h.al;
	Vpage = Regs.h.bh;

	if (Vmode == 7) {
		Segment = 0xB000;
	} else {
		Segment = 0xB800;
	}

	Offset = Vpage * (unsigned)0x1000;
  return TexelPtr((long(Segment) << 16) | long(Offset));
}

TexelPtr VideoPtr(void)
{
	unsigned Vm;
	unsigned Vp;

	return VideoPtr(Vm, Vp);
}
