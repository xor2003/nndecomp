#include "msounit.h"

#include <stdio.h>
#include <process.h>
#include <stdlib.h>
#include <string.h>
#include "msounit.h"

Meso::Meso(char *N, ActionProc A) : Wso(0x00, 0x00, DefColors)
{
	strncpy(Name, N, 39);
	// Garante que a string termine com nulo.
	Name[39] = 0;
	Action = A;
	SetSize(Panel->TextWidth(N), Panel->TextHeight(1));
}

void Meso::Draw(void)
{
	Wso::Draw();
	Panel->HzWrt(0, 0, Name, Panel->Colors.Wc);
}

void Meso::Prompt(void)
{
	Wso::Prompt();
	Panel->Fill(0, 0, Panel->Interior->Wd, Panel->TextHeight(1), ' ',
							Panel->Colors.Fc);
	Panel->HzWrt(0, 0, Name, Panel->Colors.Fc);
}

void Meso::UnPrompt(void)
{
	Panel->Fill(0, 0, Panel->Interior->Wd, Panel->TextHeight(1), ' ',
							Panel->Colors.Wc);
	Panel->HzWrt(0, 0, Name, Panel->Colors.Wc);
	Wso::UnPrompt();
}

void Meso::OnKeyStroke(MsgPkt &M)
{
	if (M.Code == CrKey) {
		Activate(M);
	} else {
		Base->OnKeyStroke(M);
	}
}

void Meso::OnClose(MsgPkt &M)
{
	Base->SwitchFocus(M);
	M.RtnCode = Close;
}

void Meso::Activate(MsgPkt &M)
{
	if (Active) {
		Wso::Activate(M);
		Action(this, M);
	} else {
		Leave(M);
	}
}

MesoList::MesoList(void)
{
	Last = NULL;
}

MesoList::~ MesoList(void)
{
}

void MesoList::Append(Meso *Me)
{
	if (Last != NULL) {
		Me->Next = Last->Next;
		Last->Next = Me;
		Last = Last->Next;
	} else {
		Last = Me;
		Last->Next = Me;
	}
}

Mso::Mso(MesoList *El, int Nc, int Nr, int Sp, int W, int H,
				 int Bd, int Fa, ColorPack &Cp) : Wso(Bd, Fa, Cp)
{
	Entries = El;
	CurrSeln = Entries->Last->Next;
	EntriesDrawn = 0;
	Spacing = Sp;
	SetupDim(Nc, Nr, W, H);
	Ncols = Nc;
	Nrows = Nr;

	SetSize(W, H);
	SetupEntries();
}

void Mso::SetupDim(int &Nc, int &Nr, int &W, int &H)
{
	int SumLen;
	int NumEntries;
	int MaxEntryLen;
	int TxtLen;
	Meso *P;

	NumEntries = 0;
	MaxEntryLen = 0;
	SumLen = 0;
	P = Entries->Last->Next;
	if (Nr == 1) {
		// Menu horizontal.
		do {
			P->SetLocn(SumLen, 0, Absc);
			SumLen += Panel->TextWidth(P->Name) + Spacing;
			NumEntries++;
			P = P->Next;
		} while(P != Entries->Last->Next);

		SumLen -= Spacing;
		if (SumLen > W) {
			W = SumLen;
		}

		H = Panel->TextHeight(1);
		Nc = NumEntries;
		Nr = 1;
	} else if (Nc == 1) {
		// Menu vertical.
		do {
			P->SetLocn(0, Panel->TextHeight(NumEntries), Absc);
			TxtLen = Panel->TextWidth(P->Name);
			if (TxtLen > MaxEntryLen) {
				MaxEntryLen = TxtLen;
			}

			NumEntries++;
			P = P->Next;
		} while(P != Entries->Last->Next);

		if (MaxEntryLen > W) {
			W = MaxEntryLen;
		}

		H = Panel->TextHeight(NumEntries);
		Nr = NumEntries;
		Nc = 1;
	} else {
		printf("Menu retangulares nÆo sÆo suportados\n");
		exit(-1);
	}
}

int Mso::EntryWidth(Meso *Me)
{
	if (IsHz()) {
		return Panel->TextWidth(Me->Name);
	}

	return Panel->Interior->Wd;
}

void Mso::SetupEntries(void)
{
	Meso *P;

	P = Entries->Last->Next;
	do {
		P->Panel->SetSize(EntryWidth(P), Panel->TextHeight(1));
		P->Panel->Colors = Panel->Colors;
		P = P->Next;
	} while(P != Entries->Last->Next);
}

void Mso::Open(Iso *B, int X, int Y)
{
	Meso *P;

	Wso::Open(B, X, Y);
	P = Entries->Last->Next;
	do {
		P->Open(this, P->Panel->Overall->Xul, P->Panel->Overall->Yul);
		P = P->Next;
	} while(P != Entries->Last->Next);

	EntriesDrawn = true;
}

void Mso::MoveLoop(MsgPkt &M)
{
	Wso::MoveLoop(M);
	M.RtnCode = MouseUp;
}

void Mso::Activate(MsgPkt &M)
{
	CurrSeln = (Meso *)(SubMgr->Top);
	CurrSeln->SwitchFocus(M);
}

void Mso::Leave(MsgPkt &M)
{
	CurrSeln = (Meso *)(SubMgr->Top);
	Wso::Leave(M);
}

void Mso::OnKeyStroke(MsgPkt &M)
{
	switch(M.Code) {
		case UpKey:
			if (IsVt()) {
				Back(M);
			}

			break;
		case DownKey:
			if (IsVt()) {
				Forw(M);
			}

			break;
		case LeftKey:
			if (IsHz()) {
				Back(M);
			}

			break;
		case RightKey:
			if (IsHz()) {
				Forw(M);
			}

			break;
		default:
			Wso::OnKeyStroke(M);
			break;
	}
}

void Mso::Forw(MsgPkt &M)
{
	CurrSeln = (Meso *)(SubMgr->Top);
	CurrSeln->Next->SwitchFocus(M);
}

void Mso::Back(MsgPkt &M)
{
	Meso *P;

	CurrSeln = (Meso *)(SubMgr->Top);
	P = CurrSeln;

	while(P->Next != CurrSeln) {
		P = P->Next;
	}

	CurrSeln = P;
	CurrSeln->SwitchFocus(M);
}

PullDnBar::PullDnBar(MesoList *Items, int W, int Sp, ColorPack &Cp)
	: Mso(Items, 0, 1, Sp, W, Items->Last->Next->Panel->Overall->Ht, 0x00, 0x00, Cp)
{
	SubMso = NULL;
}

void PullDnBar::OnKeyStroke(MsgPkt &M)
{
	Mso::OnKeyStroke(M);

	if ((M.Code == LeftKey) || (M.Code == RightKey)) {
		M.Focus->Activate(M);
	}
}

Pmso::Pmso(MesoList *Items, int W, int H, int Sp,
					 int Ba, int Fa, ColorPack &Cp) : Wso(Ba, Fa, Cp)
{
	Bar = new PullDnBar(Items, W, Sp, Cp);
	SetSize(Bar->Panel->Frame->Wd, H);
	Inner = new Wso(0x00, 0x00, Cp);
	Inner->SetSize(Panel->Interior->Wd,
								 Panel->Interior->Ht - Panel->TextHeight(1));
}

void Pmso::Open(Iso *B, int X, int Y)
{
	Wso::Open(B, X, Y);
	Bar->Open(this, 0, 0);
	Inner->Open(this, 0, Panel->TextHeight(1));
}

Dmso::Dmso(MesoList *Items, int W, int Ba, int Fa, ColorPack &Cp)
	: Mso(Items, 1, 0, 2, W, 0, Ba, Fa, Cp)
{
	Parent = NULL;
}

void Dmso::OnClose(MsgPkt &M)
{
	((PullDnBar *)(Parent->Base))->SubMgr = NULL;
	Mso::OnClose(M);
}

void Dmso::OnKeyStroke(MsgPkt &M)
{
	if (M.Code == LeftKey || M.Code == RightKey) {
		Parent->Base->OnKeyStroke(M);
	} else {
		Mso::OnKeyStroke(M);
	}
}

void PmesoAction(Wso *Src, MsgPkt &M)
{
	((Pmeso *)(Src))->Vm->CurrSeln->SwitchFocus(M);
}


void Pmeso::Pmeso(char *N, Dmso *D) : Meso(N, PmesoAction)
{
	Vm = D;
}

void Pmeso::OnKeyStroke(MsgPkt &M)
{
	if (M.Code == DownKey) {
		Activate(M);
	} else {
		Meso::OnKeyStroke(M);
	}
}

void Pmeso::SwitchFocus(MsgPkt &M)
{
	int Xcoord;

	if (!Active) {
		Meso::SwitchFocus(M);

		if (((PullDnBar *)(Base))->SubMso != NULL) {
			((PullDnBar *)(Base))->SubMso->Leave(M);
			((PullDnBar *)(Base))->SubMso->OnClose(M);
			((PullDnBar *)(Base))->SubMso = NULL;
		}

		if (Vm != NULL) {
			Xcoord = Panel->Overall->Xul - Base->Panel->Overall->Xul;

			if (!Vm->EntriesDrawn) {
				Vm->Open(((Pmso *)(Base->Base))->Inner, Xcoord, 0);
			} else {
				Vm->Reopen(Xcoord, 0);
			}

			((PullDnBar *)(Base))->SubMso = Vm;
			Vm->Parent = this;
		}
	}
}
