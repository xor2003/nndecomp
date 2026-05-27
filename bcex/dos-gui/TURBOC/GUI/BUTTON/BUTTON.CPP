#include <string.h>
#include <wsotxscr.h>

typedef void (*ActionProc)(Wso *Src, MsgPkt &M);

class Button : public Wso
{
public:
	ActionProc Action;
	char *Name;

	Button(char *N, ColorPack &Cp, ActionProc A);
	virtual ~Button(void);
	virtual void Draw(void);
	virtual void Activate(MsgPkt &M);
};

class Count : public Wso
{
public:
	int C;

	Count(void);
	virtual void OnMouseEnter(MsgPkt &M)
	{
		SwitchFocus(M);
	}
	virtual void OnMouseLeave(MsgPkt &M)
	{
		Leave(M);
	}
	virtual void OnMouseWithin(MsgPkt &M);
};

Button::Button(char *N, ColorPack &Cp, ActionProc A)
	: Wso(0x11, ButtonStyle, Cp)
{
	Name = strdup(N);
	SetSize(strlen(Name) + 2, 1);
	Action = A;
}

Button::~Button(void)
{
	free(Name);
}

void Button::Draw(void)
{
	Wso::Draw();
	Panel->HzWrtB(1, 0, Name);
}

void Button::Activate(MsgPkt &M)
{
	if (Active) {
		Wso::Activate(M);
		Action(this, M);
	} else {
		Leave(M);
	}
}

void NoOp(Wso *, MsgPkt &) {}

void ExitAction(Wso *, MsgPkt &M)
{
	M.RtnCode = ShutDown;
}

void Popup(Wso *Src, MsgPkt &M)
{
	Wso *B;

	Src->Leave(M);
	B = new Wso(0x11, WindowStyle, DefColors);
	B->SetSize(30, 3);
	B->Open(FullScrn, 30, 10);
	B->Panel->HzWrt(1, 0, ((Button *)Src)->Name, 0);
	B->SwitchFocus(M);
	M.RtnCode = M.Code;

	do {
		B->SubMgr->EventStep(M);
		M.Code = M.RtnCode;
	} while(M.Code != ShutDown &&
				 (!B->Active || M.Code != Close || M.Focus != (Iso *)(B)));

	if (M.Code == Close) {
		B->OnClose(M);
		Mouse.WaitForEvent(MouseUp, M.Mx, M.My);
		M.RtnCode = Idle;
	}

	delete B;
}

Count::Count(void) : Wso(0x11, WindowStyle, DefColors)
{
	SetSize(6, 1);
	C = 0;
}

void Count::OnMouseWithin(MsgPkt &M)
{
	char Buff[10];

	if (Panel->OnInterior(M.Mx, M.My)) {
		itoa(++C, Buff, 10);
		Panel->HzWrt(0, 0, Buff, 0);
	}
}

Button *MsgBut;
Button *ExitBut;
Wso *S;
Count *CountBut;

void main(void)
{
	Setup(MouseOptional, MonoColors);

	S = new Wso(0x11, WindowStyle, DefColors);
	S->SetSize(60, 20);
	S->Open(FullScrn, 0, 0);
	S->Panel->Clear(177, 7);

	MsgBut = new Button("BotÆo de mensagem", DefColors, Popup);
	ExitBut = new Button("Sa¡da", DefColors, ExitAction);
	MsgBut->Open(S, 3, 3);
	ExitBut->Open(S, 6, 6);

	CountBut = new Count();
	CountBut->Open(S, 22, 12);
	MainEventLoop();
	CleanUp();
}
