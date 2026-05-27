#include "gourav.h"
#include "password.h"

int main()
{
	int gd = DETECT, gm = 0;
	initgraph(&gd, &gm, "c:\\software\\tc\\bgi");
	_latlon();
	getch();
	return 0;
}

void _draw_grid(int x = 0, int y = 0, int ch = 0)
{
	int xx = x, yy = y;
	int d = 10;
	setcolor(GREEN);
	for (int i = 0; i < 36; i++)
	{
		for (int j = 0; j < 16; j++)
		{
			rectangle(x, y, x + d, y + d);
			y += d;
		}
		y = yy;
		x += d;
	}

	y = getmaxy() / 2 + 30;
	yy = y;

	xx -= 15;
	x = xx;
	d = 20;

	if (ch <= 2)
	{
		for (i = 0; i < 9; i++)
		{
			for (int j = 0; j < 9; j++)
			{
				rectangle(x, y, x + d, y + d);
				y += d;
			}
			y = yy;
			x += d;
		}
	}

	xx = x;
	xx += 30;
	x = xx;
	if (ch == 2)
	{
		for (i = 0; i < 9; i++)
		{
			for (int j = 0; j < 9; j++)
			{
				rectangle(x, y, x + d, y + d);
				y += d;
			}
			y = yy;
			x += d;
		}
	}
}

void _latlon()
{
	setfillstyle(SOLID_FILL, 1);
	bar(0, 0, getmaxx(), getmaxy());

	setfillstyle(SOLID_FILL, 0);
	bar(10, 10, 420, getmaxy() / 2 - 10);

	setfillstyle(SOLID_FILL, 0);
	bar(10, getmaxy() / 2 + 10, 210, getmaxy() - 10);

	setfillstyle(SOLID_FILL, 0);
	bar(220, getmaxy() / 2 + 10, 420, getmaxy() - 10);

	setfillstyle(SOLID_FILL, 0);
	bar(440, 10, getmaxx() - 10, getmaxy() - 10);

	setcolor(0);
	line(430, 0, 430, getmaxy());
	line(0, getmaxy() / 2, 430, getmaxy() / 2);
	line(215, getmaxy() / 2, 215, getmaxy());

	int x = 35, y = 40;
	_draw_grid(x, y, 2);

	char ch;
	//	while(1)
	{
		//		ch=getch();
		setcolor(BLUE);
		line(x, y, x, y);
		line(x, y, x, y);
	}
}
