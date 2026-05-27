#include <string.h>
#include <stdlib.h>
#include <dos.h>
#include <trsounit.h>
#include <keyboard.h>

void main()
{
	TxBuff ScrnBuff(VideoPtr());
	ScrnBuff.SetSize(80, 25);
	Trso Screen(&ScrnBuff);
	Screen.SetSize(80, 25);

	Screen.Fill(0, 0, Screen.Wd, Screen.Ht, 176, 0x07);
	Screen.Box(30, 8, 15, 5, 0x11, 0x70);

	Trso Window(&ScrnBuff);
	Window.SetLocn(31, 9);
	Window.SetSize(13, 3);

	Window.Fill(0, 0, Window.Wd, Window.Ht, ' ', 0x07);
	Window.HzWrt(-10, 1, "Ei, vocˆ: aperte qualquer tecla agora", 0x07);
	bioskey(0);

	Screen.Fill(0, 0, Screen.Wd, Screen.Ht, 176, 0x07);
	Screen.Box(20, 4, 42, 17, 0x11, 0x70);
	Window.SetLocn(21, 5);
	Window.SetSize(40, 15);
	Window.Box(35, 5, 15, 4, 0x11, 0x07);
	Window.Box(27, -2, 15, 4, 0x11, 0x07);
	Window.Box(-5, -3, 15, 4, 0x11, 0x07);
	Window.Box(-5, 5, 15, 4, 0x11, 0x07);
	Window.Box(-2, 13, 15, 4, 0x11, 0x07);
	Window.Box(35, 13, 15, 4, 0x11, 0x07);
}
