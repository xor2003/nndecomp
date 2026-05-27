/* World Password */

#include "gourav.h"

void _entry_pass();

int main()
{
	installuserdriver("SVGA256", &DetectSvga);
	int gd = DETECT, gm = 0;
	initgraph(&gd, &gm, "c:\\software\\tc\\bgi");
	settextjustify(HORIZ_DIR, CENTER_TEXT);
	settextjustify(VERT_DIR, CENTER_TEXT);
	_mouse_init();

	loadbitmap(0, 0, "world_1.bmp");

	//	_entry_pass();
	getch();

	return 0;
}

void _entry_pass()
{
	setfillstyle(SOLID_FILL, BLUE);
	bar(0, 0, getmaxx(), getmaxy());

	setcolor(0);
	line(400, 0, 400, getmaxy());

	int ch;
	int corn, core;
	char con[4], coe[4];

	int x, y, maxx, maxy, minx, miny;
	int d = 10;
	int gcolor = BLUE, scolor = GREEN;
	minx = 5;
	miny = 5;
	maxx = 365;
	maxy = 185;

	setfillstyle(SOLID_FILL, 0);
	bar(minx, miny, maxx, maxy);

	x = (maxx + minx) / 2;
	y = (miny + maxy) / 2;

	setcolor(gcolor);
	for (int i = minx; i < maxx; i += d)
		line(i, miny, i, maxy);
	for (i = miny; i < maxy; i += d)
		line(minx, i, maxx, i);

	x = (maxx + minx) / 2;
	y = (miny + maxy) / 2;

	setcolor(scolor);
	line(x, miny, x, maxy);
	line(minx, y, maxx, y);

	loadbitmap(5, 5, "world.bmp");

	do
	{
		ch = getch();

		setcolor(0);
		if (ch != 27 && ch != 13)
		{
			if (ch == 72 || ch == 80)
				line(minx, y, maxx, y);
			if (ch == 75 || ch == 77)
				line(x, miny, x, maxy);
		}
		loadbitmap(5, 5, "world.bmp");
		setcolor(gcolor);
		for (int i = minx; i < maxx; i += d)
			line(i, miny, i, maxy);
		for (i = miny; i < maxy; i += d)
			line(minx, i, maxx, i);

		setcolor(scolor);

		switch (ch)
		{
		case 72:
			if (y == miny)
				y = maxy;
			else
				y -= d / 10;
			line(minx, y, maxx, y);
			break;
		case 80:
			if (y == maxy)
				y = miny;
			else
				y += d / 10;
			line(minx, y, maxx, y);
			break;
		case 75:
			if (x == minx)
				x = maxx;
			else
				x -= d / 10;
			line(x, miny, x, maxy);
			break;
		case 77:
			if (x == maxx)
				x = minx;
			else
				x += d / 10;
			line(x, miny, x, maxy);
			break;
		}

		setcolor(gcolor);
		outtextxy(400, 300, con);
		outtextxy(400, 315, coe);

		corn = (y - miny - 90) % 91;
		core = (x - minx - 180) % 181;

		setcolor(scolor);
		line(x, miny, x, maxy);
		line(minx, y, maxx, y);

		setcolor(0);
		itoa(corn, con, 10);
		itoa(core, coe, 10);
		outtextxy(400, 300, con);
		outtextxy(400, 315, coe);

	} while (ch != 13);

	//grid changes

	setcolor(0);
	line(0, maxy + 5, getmaxx(), maxy + 5);

	//	minx=maxx;
	miny = maxy + 10;

	d = 20;

	maxx = 60 * d / 10;
	maxy += 60 * d / 10;

	setfillstyle(SOLID_FILL, 0);
	bar(minx, miny, maxx, maxy);

	x = (maxx + minx) / 2;
	y = (miny + maxy) / 2;

	setcolor(gcolor);
	for (i = minx; i < maxx; i += d)
		line(i, miny, i, maxy);
	for (i = miny; i < maxy; i += d)
		line(minx, i, maxx, i);

	x = (maxx + minx) / 2;
	y = (miny + maxy) / 2;

	setcolor(scolor);
	line(x, miny, x, maxy);
	line(minx, y, maxx, y);

	do
	{
		ch = getch();

		setcolor(0);
		if (ch != 27 && ch != 13)
		{
			if (ch == 72 || ch == 80)
				line(minx, y, maxx, y);
			if (ch == 75 || ch == 77)
				line(x, miny, x, maxy);
		}
		setcolor(gcolor);
		for (int i = minx; i < maxx; i += d)
			line(i, miny, i, maxy);
		for (i = miny; i < maxy; i += d)
			line(minx, i, maxx, i);

		setcolor(scolor);

		switch (ch)
		{
		case 72:
			if (y == miny)
				y = maxy;
			else
				y -= d / 10;
			line(minx, y, maxx, y);
			break;
		case 80:
			if (y == maxy)
				y = miny;
			else
				y += d / 10;
			line(minx, y, maxx, y);
			break;
		case 75:
			if (x == minx)
				x = maxx;
			else
				x -= d / 10;
			line(x, miny, x, maxy);
			break;
		case 77:
			if (x == maxx)
				x = minx;
			else
				x += d / 10;
			line(x, miny, x, maxy);
			break;
		}

		setcolor(gcolor);
		outtextxy(440, 300, con);
		outtextxy(440, 315, coe);

		corn = (y - miny) / (d / 10);
		core = (x - minx) / (d / 10);

		setcolor(scolor);
		line(x, miny, x, maxy);
		line(minx, y, maxx, y);

		setcolor(0);
		itoa(corn, con, 10);
		itoa(core, coe, 10);
		outtextxy(440, 300, con);
		outtextxy(440, 315, coe);

	} while (ch != 27);
}
