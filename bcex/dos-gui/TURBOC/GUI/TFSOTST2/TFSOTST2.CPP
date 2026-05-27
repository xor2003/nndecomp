#include <conio.h>
#include <tfsounit.h>
#include <keyboard.h>

void main(void)
{
	clrscr();

	Tfso T1(0x31, Swappable + Closeable, RedColors);
	T1.SetSize(40, 15);
	T1.SetLocn(5, 5);
	T1.GetImage(T1.Overall);
	T1.DrawFrame(0, 0);
	T1.Clear(177, 0);
	bioskey(0);

	Tfso T2(0x21, Swappable + Closeable, CyanColors);
	T2.SetSize(30, 10);
	T2.SetLocn(47, 10);
	T2.GetImage(T2.Overall);
	T2.DrawFrame(0, 0);
	T1.HzWrt(0, 1, "Janela 1", 0);
	bioskey(0);
	T2.HzWrt(0, 1, "Janela 2", 0);
	bioskey(0);
	T1.Swap(T1.Overall, PutIm);
	bioskey(0);
	T2.Swap(T2.Overall, PutIm);
	T1.SetLocn(30, 6);
	T1.Swap(T1.Overall, GetIm);
	bioskey(0);
	T2.Swap(T2.Overall, GetIm);
	bioskey(0);
}
