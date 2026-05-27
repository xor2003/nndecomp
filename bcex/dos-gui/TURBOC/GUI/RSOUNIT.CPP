#include "rsounit.h"

Rect::Rect(int X, int Y, int W, int H)
{
	Xul = X;
	Yul = Y;
	Xlr = X + W - 1;
	Ylr = Y + H - 1;
	Wd = W;
	Ht = H;
}

void Rect::SetSize(int W, int H)
{
	Wd = W;
	Ht = H;
	Xlr = Xul + W - 1;
	Ylr = Yul + H - 1;
}

void Rect::SetLocn(int Xl, int Yl)
{
	Xul = Xl;
	Yul = Yl;
	Xlr = Xl + Wd - 1;
	Ylr = Yl + Ht - 1;
}

void Rect::ClipSize(int &W, int &H)
{
	if (W > Wd) {
		W = Wd;
	}

	if (W < 1) {
		W = 1;
	}

	if (H > Ht) {
		H = Ht;
	}

	if (H < 1) {
		H = 1;
	}
}

void Rect::ClipDim(int &X, int &Y, int &W, int &H)
{
	int Xl;
	int Yl;
	ClipSize(W, H);

	if (X < Xul) {
		X = Xul;
	}

	if (Y < Yul) {
		Y = Yul;
	}

	Xl = X + W - 1;
	if (Xl > Xlr) {
		X -= Xl - Xlr;
	}

	Yl = Y + H - 1;
	if (Yl > Ylr) {
		Y -= Yl - Ylr;
	}
}

int Rect::HzClip(int &X, int &Y, int &N)
{
	int Rval = false;

	if ((Y >= 0) && (Y < Ht)) {
		if (X < 0) {
			N += X;
			X = 0;
		}

		if ((N > 0) && (X < Wd)) {
			if ((X + N) > Wd) {
				N = Wd - X;
			}

			Rval = true;
		}
	}

	return Rval;
}

int Rect::VtClip(int &X, int &Y, int &N)
{
	int Rval = false;
	if ((X >= 0) && (X < Wd)) {
		if (Y < 0) {
			N += Y;
			Y = 0;
		}

		if ((N > 0) && (Y < Ht)) {
			if ((Y + N) > Ht) {
				N = Ht - Y;
			}

			Rval = true;
		}
	}

	return Rval;
}

int Rect::Contains(int X, int Y)
{
	return (X >= Xul) && (X <= Xlr) &&
				 (Y >= Yul) && (Y <= Ylr);
}

int Rect::Touches(Rect *R)
{
	if (R == this) {
		return false;
	}

	return (Xul <= R->Xlr) && (Xlr >= R->Xul) &&
				 (Yul <= R->Ylr) && (Ylr >= R->Yul);
}

