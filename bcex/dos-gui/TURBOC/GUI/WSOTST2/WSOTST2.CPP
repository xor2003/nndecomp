#include <wsotxscr.h>
#include <conio.h>

Wso *Window1;
Wso *Window2;
Wso *Window3;

void main(void)
{
	Setup(MouseOptional, CyanColors);
	FullScrn->Panel->Clear('\xB0', 0);

	Window1 = new Wso(0x11, WindowStyle + Stretchable, RedColors);
	Window1->SetSize(50, 15);
	Window1->Open(FullScrn, 2, 2);
	Window1->Panel->HzWrtB(0, 0, "Janela 1");

	Window2 = new Wso(0x11, WindowStyle + Stretchable, BlueColors);
	Window2->SetSize(20, 8);
	Window2->Open(Window1, 2, 3);
	Window2->Panel->HzWrtB(0, 0, "Janela 2");

	Window3 = new Wso(0x11, WindowStyle + Stretchable, InvColors);
	Window3->SetSize(20, 10);
	Window3->Open(FullScrn, 50, 5);
	Window3->Panel->HzWrtB(0, 0, "Janela 3");

	MainEventLoop();

	CleanUp();
	clrscr();
}
