#include "msmouse.h"
#include "guimain.h"
#include <dos.h>
#include <stdlib.h>

const int MsCall = 0x33;
const int Iret = 0xCF;

MouseObject Mouse;

MouseObject::MouseObject(void)
{
	Ok = false;
	MouseOff = true;
}

int MouseObject::DriverExists(void)
{
	void far *address;
	// Procura pelo endere‡o NULL ou instru‡Æo IRET.
	address = getvect(MsCall);
	return (address != NULL) && (*(unsigned char far *)address != Iret);
}

void MouseObject::Setup(VideoModeType VideoMode)
{
	REGS regs;

	Ok = DriverExists();
	if (Ok) {
		// Comprova o modo Hercules para a p gina 0. Usa 5 para a p gina 1.
		if (VideoMode == HerculesGr) {
			*(char far *)MK_FP(0x0040, 0x0049) = 6;
		}

		regs.x.ax = 0;
		int86(MsCall, &regs, &regs);
		if (regs.x.ax == 0) {
			Ok = false;
		}
	}

	if (!Ok) {
		TurnOff();
		return;
	}

	TurnOn();

	TextMode = VideoMode == TextScreen;
	LowRes = VideoMode == LowResGr;

	OldX = 0;
	OldY = 0;
	X = 0;
	Y = 0;
	Dx = 0;
	Dy = 0;
	Move(0, 0);
}

int MouseObject::SetupOk(void)
{
	return Ok;
}

void MouseObject::Hide(void)
{
	REGS regs;

	if (!Operating()) {
		return;
	}

	regs.x.ax = 2;
	int86(MsCall, &regs, &regs);
}

void MouseObject::Show(void)
{
	REGS regs;

	if (!Operating()) {
		return;
	}

	regs.x.ax = 1;
	int86(MsCall, &regs, &regs);
}

unsigned MouseObject::Status(int &Mx, int &My)
{
	REGS regs;

	if (!Operating()) {
		Mx = 0;
		My = 0;
		return 0;
	}

	regs.x.ax = 3;
	int86(MsCall, &regs, &regs);
	Mx = regs.x.cx;
	My = regs.x.dx;

	if (TextMode) {
		// Ajuste para as coordenadas de texto.
		Mx >>= 3;
		My >>= 3;
	}

	if (LowRes) {
		// Ajuste para coordenadas 320x200.
		Mx >>= 1;
	}

	return regs.x.bx;
}

unsigned MouseObject::ButtonStatus(void)
{
	int Mx;
	int My;

	if (!Operating()) {
		return 0;
	}

	return Status(Mx, My);
}

int MouseObject::PressCnt(unsigned ButtonMask)
{
	REGS regs;

	if (!Operating()) {
		return 0;
	}

	regs.x.ax = 5;
	// Seletor de botÆo.
	regs.x.bx = ButtonMask >> 1;
	int86(MsCall, &regs, &regs);
	return regs.x.bx;
}

int MouseObject::ReleaseCnt(unsigned ButtonMask)
{
	REGS regs;

	if (!Operating()) {
		return 0;
	}

	regs.x.ax = 6;
	// Seletor de botÆo.
	regs.x.bx = ButtonMask >> 1;
	int86(MsCall, &regs, &regs);
	return regs.x.bx;
}

unsigned MouseObject::Event(int &Mx, int &My)
{
	unsigned E;

	if (!Operating()) {
		Mx = 0;
		My = 0;
		return Idle;
	}

	E = Status(Mx, My);
	if (E == 0) {
		// Nenhum botÆo pressionado, mas verifica tamb‚m se algum foi esquecido.
		if (PressCnt(LeftButton) > 0) {
			E = LMouseDown;
		} else if (PressCnt(RightButton) > 0) {
			E = RMouseDown;
		} else if (ReleaseCnt(LeftButton) > 0) {
			E = LMouseUp;
		} else if (ReleaseCnt(RightButton) > 0) {
			E = RMouseUp;
		}
	} else {
		// Um botÆo do mouse est  pressionado.

		// O botÆo da esquerda est  pressionado?
		if (E & LeftButton) {
			// Ainda nÆo est  pressionado.
			if (PressCnt(LeftButton) > 0) {
				E = LMouseDown;
			} else {
				E = LMouseStillDown;
			}
		} else if (PressCnt(RightButton) > 0) {
			E = RMouseDown;
		} else {
			E = RMouseStillDown;
		}
	}

	return E;
}

unsigned MouseObject::WaitForAnyEvent(int &Mx, int &My)
{
	unsigned E;

	if (!Operating()) {
		Mx = 0;
		My = 0;
		return Idle;
	}

	do {
		E = Event(Mx, My);
	} while(E == Idle);

	return E;
}

void MouseObject::WaitForEvent(unsigned E, int &Mx, int &My)
{
	unsigned Etry;

	if (!Operating()) {
		Mx = 0;
		My = 0;
		return;
	}

	do {
		Etry = Event(Mx, My);
	} while(Etry != E);
}

int MouseObject::Moved(void) {
	if (!Operating()) {
		return false;
	}

	OldX = X;
	OldY = Y;
	Status(X, Y);
	Dx = X - OldX;
	Dy = Y - OldY;

	return (Dx != 0) || (Dy != 0);
}

void MouseObject::Move(int Mx, int My)
{
	REGS regs;

	if (!Operating()) {
		return;
	}

	regs.x.ax = 4;
	regs.x.cx = Mx;
	regs.x.dx = My;
	if (TextMode) {
		// Ajusta as coordenadas para o modo de texto.
		regs.x.cx <<= 3;
		regs.x.dx <<= 3;
	}

	if (LowRes) {
		// Ajusta para coordenadas 320x200.
		regs.x.cx <<= 1;
	}

	int86(MsCall, &regs, &regs);
}

void MouseObject::TurnOn(void)
{
	if (Ok && MouseOff) {
		MouseOff = false;
		Show();
	}
}

void MouseObject::TurnOff(void)
{
	if (Ok && !MouseOff) {
		Hide();
		MouseOff = true;
	}
}

int MouseObject::Operating(void)
{
	return !MouseOff;
}

void MouseObject::SetGCursor(const MouseCursor &NewCursor)
{
	REGS regs;
	SREGS sregs;

	if (!Operating()) {
		return;
	}

	regs.x.ax = 9;
	regs.x.bx = NewCursor.HotSpot.X;
	regs.x.cx = NewCursor.HotSpot.Y;
	regs.x.dx = FP_OFF(NewCursor.ScreenMask);
	sregs.es = FP_SEG(NewCursor.ScreenMask);
	int86x(MsCall, &regs, &regs, &sregs);
}
