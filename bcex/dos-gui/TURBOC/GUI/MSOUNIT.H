#ifndef H_MSOUNIT
#define H_MSOUNIT

#ifdef GRAAPHICS
#include "gwsounit.h"
#else
#include "twsounit.h"
#endif

typedef void (*ActionProc)(Wso *Src, MsgPkt &M);

class Meso : public Wso
{
public:
	char Name[40];
	ActionProc Action;
	Meso *Next;

	Meso(char *N, ActionProc A);
	virtual void Draw(void);
	virtual void Prompt(void);
	virtual void UnPrompt(void);
	virtual void OnKeyStroke(MsgPkt &M);
	virtual void OnClose(MsgPkt &M);
	virtual void Activate(MsgPkt &M);
};

class MesoList
{
public:
	Meso *Last;

	MesoList(void);
	virtual ~MesoList(void);
	virtual void Append(Meso *Me);
};

class Mso : public Wso {
public:
	MesoList *Entries;
	Meso *CurrSeln;
	int EntriesDrawn;
	int Nrows;
	int Ncols;
	int Spacing;

	Mso(MesoList *El, int Nc, int Nr, int Sp, int W, int H, int Bd, int Fa,
			ColorPack &Cp);
	virtual void SetupDim(int &Nc, int &Nr, int &W, int &H);
	virtual int EntryWidth(Meso *Me);
	virtual void SetupEntries(void);
	virtual int IsHz(void)
	{
		return Nrows == 1;
	}
	virtual int IsVt(void)
	{
		return Ncols == 1;
	}
	virtual void Open(Iso *B, int X, int Y);
	virtual void MoveLoop(MsgPkt &M);
	virtual void Activate(MsgPkt &M);
	virtual void Leave(MsgPkt &M);
	virtual void OnKeyStroke(MsgPkt &M);
	virtual void Forw(MsgPkt &M);
	virtual void Back(MsgPkt &M);
};

class PullDnBar : public Mso
{
public:
	Mso *SubMso;

	PullDnBar(MesoList *Items, int W, int Sp, ColorPack &Cp);
	virtual void OnKeyStroke(MsgPkt &M);
};

class Pmso : public Wso
{
public:
	PullDnBar *Bar;
	Wso *Inner;

	Pmso(MesoList *Items, int W, int H, int Sp,
			 int Ba, int Fa, ColorPack &Cp);
	virtual void Open(Iso *B, int X, int Y);
};

class Dmso;

class Pmeso : public Meso
{
public:
	Dmso *Vm;

	Pmeso(char *N, Dmso *D);
	virtual void SwitchFocus(MsgPkt &M);
	virtual void OnKeyStroke(MsgPkt &M);
};

class Dmso : public Mso
{
public:
	Pmeso *Parent;

	Dmso(MesoList *Items, int W, int Ba, int Fa, ColorPack &Cp);
	virtual void OnClose(MsgPkt &M);
	virtual void OnKeyStroke(MsgPkt &M);
};

#endif
