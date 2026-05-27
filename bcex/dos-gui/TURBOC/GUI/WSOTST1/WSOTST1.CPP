#include <wsotxscr.h>

Wso *Window;

void main(void)
{
	Setup(MouseOptional, MonoColors);
	Window = new Wso(0x11, WindowStyle + Stretchable, CyanColors);
	FullScrn->Panel->Clear(176, 0);
	Window->SetSize(30, 10);
	Window->Open(FullScrn, 5, 5);
	MainEventLoop();

	CleanUp();
}
