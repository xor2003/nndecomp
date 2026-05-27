#ifndef H_WSOTXSCR
#define H_WSOTXSCR

// Configura‡Æo de janela de texto.

#include "twsounit.h"

enum MouseOpt {
	NoMouse,
	MouseRequired,
	MouseOptional
};

extern Wso *FullScrn;
extern MsgPkt StartMsg;

extern void Setup(MouseOpt Mo, ColorPack &Cp);
extern void MainEventLoop(void);
extern void CleanUp(void);

#endif
