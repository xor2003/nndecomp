#include <conio.h>
#include <tfsounit.h>
#include <keyboard.h>

void main(void)
{
	clrscr();

	Tfso T(0x31, Swappable + WithShadow + Closeable, RedColors);
	T.SetSize(40, 15);
	T.SetLocn(10, 5);

	// Salva a imagem por tr s da janela.
	T.GetImage(T.Overall);
	T.DrawFrame(0, 0);
	T.DrawShadows(T.Overall, GetIm, 1);
	T.Clear(177, 0);
	T.HzWrt(0, 0, "Janela 1", 0);
	T.HzWrt(0, 1, "Linha 1", 0);
	bioskey(0);

	T.Scroll(UpScroll, 1);
	T.Fill(0, 14, 40, 1, 177, 0);
	bioskey(0);

	// Oculta a janela.
	T.Swap(T.Overall, PutIm);
	bioskey(0);

	T.SetLocn(30, 6);
	// Mostra a janela novamente.
	T.Swap(T.Overall, GetIm);
}
