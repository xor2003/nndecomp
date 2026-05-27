#include "wsotxscr.h"

Wso *FullScrn;
MsgPkt StartMsg;

void Setup(MouseOpt Mo, ColorPack &Cp)
{
	FullScrn = new Wso(0x00, 0x00, Cp);
	StartMsg = NullMsg;

	if (Mo != NoMouse) {
		Mouse.Setup(TextScreen);

		if ((!Mouse.SetupOk()) && (Mo == MouseRequired)) {
			FullScrn->Panel->Clear(' ', 0);
			FullScrn->Panel->HzWrtB(0, 0, "NÆo pode iniciar o mouse.");
			exit(-1);
		}
	}
}

void MainEventLoop(void)
{
	if (FullScrn->SubMgr->Top != NULL) {
		FullScrn->SubMgr->Top->SwitchFocus(StartMsg);
	}

	FullScrn->SubMgr->EventLoop(StartMsg);
}

void CleanUp(void)
{
	delete FullScrn;
	Mouse.TurnOff();
}
