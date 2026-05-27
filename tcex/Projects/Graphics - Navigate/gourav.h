#include <iostream.h>
#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <ctype.h>
#include <fstream.h>
#include <graphics.h>
#include <dos.h>
#include <dir.h>
#include <math.h>
#include <stdlib.h>

#define port 0x33

int button, mx, my;
union REGS mi, mo;

_mouse_init()
{
	mi.x.ax = 0;
	int86(0x33, &mi, &mo);
	return (mo.x.ax);
}

_mouse_show()
{
	mi.x.ax = 1;
	int86(0x33, &mi, &mo);
	return 0;
}

_mouse_hide()
{
	mi.x.ax = 2;
	int86(0x33, &mi, &mo);
	return 0;
}

_mouse_getmousepos(int *button, int *mx, int *my)
{
	mi.x.ax = 3;
	int86(0x33, &mi, &mo);
	*button = mo.x.bx;
	*mx = mo.x.cx;
	*my = mo.x.dx;
	return 0;
}

void _graphics_init()
{
	int gd = DETECT, gm = 0;
	initgraph(&gd, &gm, "C:\\tc\\bgi");
	settextjustify(HORIZ_DIR, CENTER_TEXT);
	settextjustify(VERT_DIR, CENTER_TEXT);
}

void box(int x1, int y1, int x2, int y2, int color)
{
	setfillstyle(SOLID_FILL, color);
	bar(x1, y1, x2, y2);
	setlinestyle(0, 0, 3);
	setcolor(7);
	line(x1, y1, x2, y1);
	line(x1, y1, x1, y2);
	setcolor(8);
	line(x2, y1, x2, y2);
	line(x1, y2, x2, y2);
}

void ahbutton(int x1, int y1, int x2, int y2, int color)
{
	setfillstyle(SOLID_FILL, color);
	bar(x1, y1, x2, y2);
	setcolor(color);
	setlinestyle(0, 0, 1);
	line(x1, y2, (x1 + x2) / 2, y2 + 8);
	line(x2, y2, (x1 + x2) / 2, y2 + 8);
	floodfill((x1 + x2) / 2, y2 + 1, color);
}

void inttostr(int num, char str[])
{
	strcpy(str, "");
	int copy = 0;
	char ch[] = "00";
	copy = num;

	while (copy > 0)
	{
		switch (copy % 10)
		{
		case 0:
			strcpy(ch, "0");
			break;
		case 1:
			strcpy(ch, "1");
			break;
		case 2:
			strcpy(ch, "2");
			break;
		case 3:
			strcpy(ch, "3");
			break;
		case 4:
			strcpy(ch, "4");
			break;
		case 5:
			strcpy(ch, "5");
			break;
		case 6:
			strcpy(ch, "6");
			break;
		case 7:
			strcpy(ch, "7");
			break;
		case 8:
			strcpy(ch, "8");
			break;
		case 9:
			strcpy(ch, "9");
			break;
		}
		copy /= 10;
		strcat(str, ch);
	}
	strrev(str);
}
