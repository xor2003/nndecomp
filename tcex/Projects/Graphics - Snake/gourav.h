#ifndef GOURAV_H_
#define GOURAV_H_

#include <iostream.h>
#include <graphics.h>
#include <fstream.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <ctype.h>
#include <math.h>
#include <dos.h>
#include <dir.h>

#define port 0x33

int mbutton, mx, my;
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

_mouse_getmousepos(int *mbutton, int *mx, int *my)
{
	mi.x.ax = 3;
	int86(0x33, &mi, &mo);
	*mbutton = mo.x.bx;
	*mx = mo.x.cx;
	*my = mo.x.dx;
	return 0;
}

void _graphics_init()
{
	int gd = DETECT, gm = 0;
	initgraph(&gd, &gm, "d:\\tc\\bgi");
	settextjustify(HORIZ_DIR, CENTER_TEXT);
	settextjustify(VERT_DIR, CENTER_TEXT);
}

#endif
