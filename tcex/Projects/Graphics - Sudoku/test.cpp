#include "gourav.h"
#include <stdlib.h>

void ags(int, int, int);
void ballon();

void main()
{
	int gd = DETECT, gm;
	initgraph(&gd, &gm, "c:\\tc\\bgi");

	ballon();

	getch();
	closegraph();
}

void ballon()
{
	randomise();

	int x = random(getmaxx());
	int y = random(getmaxy());
	int col = random(15);

	circle();
}

void ags(int x, int y, int l)
{
	settextjustify(1, 1);
	settextstyle(SANS_SERIF_FONT, HORIZ_DIR, 20);

	outtextxy(x + l / 20, y - l / 8, "G");

	setcolor(RED);
	line(x, y - 2 * l / 7, x + l / 6, y - l / 16);
	line(x, y - 2 * l / 7, x - l / 6, y - l / 16);
}
