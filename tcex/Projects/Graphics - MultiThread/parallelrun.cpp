#include "gourav.h"

void run(int &x, int &y)
{
	setcolor(0);
	circle(x, y, 20);
	setcolor(GREEN);
	circle(x, ++y, 20);
}

void main()
{
	int gd = DETECT, gm = 0;
	initgraph(&gd, &gm, "c:\\software\\tc\\bgi");
	_mouse_init();
	_mouse_show();
	rectangle(0, 0, getmaxx(), getmaxy());
	int run1 = getmaxx() / 2, run2 = 10;
	int ch;
	while (1)
	{
		run(run1, run2);
		delay(20);
		while (kbhit())
		{
			ch = getch();
			if (ch == 13)
				outtextxy(20, 20, "done");
			if (ch == 75)
				run1--;
			if (ch == 77)
				run1++;
			if (ch == 27)
				exit(0);
		}
	}
}
