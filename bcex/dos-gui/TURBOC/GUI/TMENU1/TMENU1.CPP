#include <wsotxscr.h>
#include <msounit.h>

void ExitAction(Wso *, MsgPkt &M)
{
	M.RtnCode = ShutDown;
}

void PopupAction(Wso *Src, MsgPkt &M)
{
	Wso *B;
	char Buff[80];

	((Meso *)Src)->OnClose(M);
	M.Code = M.RtnCode;
	FullScrn->SubMgr->EventStep(M);

	B = new Wso(0x11, WindowStyle, DefColors);
	strcpy(Buff, ((Meso *)Src)->Name);
	strcat(Buff, " A‡Æo ");
	B->SetSize(B->Panel->TextWidth(Buff), B->Panel->TextHeight(2));
	B->Open(FullScrn, 30, 10);
	B->Panel->HzWrt(0, 0, Buff, 0);
	B->SwitchFocus(M);

	M.RtnCode = Idle;
	M.Code = Idle;

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

MesoList *MList;
Meso *Entry1;
Meso *Entry2;
Meso *Entry3;
Meso *Entry4;
Meso *Entry5;
Mso *Menu1;

void main(void)
{
	DefColors = CyanColors;
	Setup(MouseOptional, DefColors);
	MList = new MesoList();

	Entry1 = new Meso("Novo", PopupAction);
	MList->Append(Entry1);
	Entry2 = new Meso("Abrir", PopupAction);
	MList->Append(Entry2);
	Entry3 = new Meso("Salvar", PopupAction);
	MList->Append(Entry3);
	Entry4 = new Meso("Fechar", PopupAction);
	MList->Append(Entry4);
	Entry5 = new Meso("Sair", ExitAction);
	MList->Append(Entry5);

	Menu1 = new Mso(MList, 1, 5, 1, 15, 5, 0x11,
									WithShadow+Swappable, DefColors);
	FullScrn->Panel->Clear(177, 4);
	Menu1->Open(FullScrn, 10, 5);
	MainEventLoop();
	CleanUp();
}
