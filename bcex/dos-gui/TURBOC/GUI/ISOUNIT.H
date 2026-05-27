#ifndef H_ISOUNIT
#define H_ISOUNIT

// Objeto de tela iterativa (Iso).

#include <stdlib.h>
#include "fsounit.h"
#include "keyboard.h"

// O mesmo que a tecla ESC.
const int Close = 0x011B;
// O mesmo que a tecla Alt-X
const int ShutDown = 0x2D00;
// O mesmo que a tecla TAB.
const int Cycle = 0x0F09;
const int StrMsg = 0xFFFF;

class Iso;
class IsoMgr;

struct MsgPkt
{
	Iso *Focus;
	unsigned Code;
	unsigned RtnCode;
	int Mx;
	int My;
	char Str[80];
};

extern MsgPkt NullMsg;

class Iso
{
public:
	Fso *Panel;
	char Active;
	char Visible;
	char IsClosed;
	char TouchFlag;
	char ClipToFrame;
	Iso *Base;
	Iso *Under;
	Iso *Over;
	IsoMgr *SubMgr;

	Iso(Fso *P);
	virtual ~Iso(void);
	virtual Rso* ClippingRect(void);
	virtual void SetLocn(int X, int Y, CoordType Ctype);
	virtual void SetSize(int W, int H);
	virtual void Move(int X, int Y);
	virtual void DeltaMove(int Dx, int Dy);
	virtual void MoveLoop(MsgPkt &M);
	virtual void Stretch(int W, int H);
	virtual void DeltaStretch(int Dw, int Dh);
	virtual void StretchLoop(MsgPkt &M);
	virtual int Obscured(void);
	virtual void Draw(void) {};
	virtual void DrawPanel(void);
	virtual void Redraw(void)
	{
		DrawPanel();
	}
	virtual void Open(Iso *B, int X, int Y);
	virtual void Reopen(int X, int Y);
	virtual void Swap(void);
	virtual void Hide(void);
	virtual void Show(void);
	virtual void SetVisibleFlag(int F);
	virtual void Select(void);
	virtual void Remove(void);
	virtual void Prompt(void);
	virtual void UnPrompt(void);
	virtual void Enter(MsgPkt &M);
	virtual void Leave(MsgPkt &M);
	virtual void SwitchFocus(MsgPkt &M);
	virtual void Activate(MsgPkt &) {}
	virtual void OnMouseEnter(MsgPkt &M);
	virtual void OnMouseLeave(MsgPkt &M);
	virtual void OnMouseWithin(MsgPkt &) {};
	virtual void OnClose(MsgPkt &M);
	virtual void OnMouseUp(MsgPkt &M)
	{
		Activate(M);
	}
	virtual void OnMouseDown(MsgPkt &M);
	virtual void BorderHandler(MsgPkt &M);
	virtual void OnMouseStillDown(MsgPkt &) {};
	virtual void OnKeyStroke(MsgPkt &M);
	virtual void OnShiftArrow(MsgPkt &M);
	virtual void Dispatch(MsgPkt &M);
};

class IsoMgr
{
public:
	Iso *Top;
	Iso *Bottom;
	Iso *Base;
	Iso *Hot;
	Iso *Marker;

	IsoMgr(Iso *B);
	virtual ~IsoMgr(void);
	virtual void Push(Iso *Ip);
	virtual void MoveToFront(Iso *Me, int Keep);
	virtual void ResetTouchFlags(Iso *Me);
	virtual void SetTouchFlags(Iso *Me);
	virtual void OnIso(int Mx, int My, Iso **I);
	virtual Iso *CycleForw(Iso *Curr);
	virtual void ProcessCycle(MsgPkt &M);
	virtual void EventLoop(MsgPkt &M);
	virtual void EventStep(MsgPkt &M);
};

#endif
