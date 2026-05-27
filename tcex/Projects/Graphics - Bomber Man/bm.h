/*
 * 	bm.h / Bomber Man
 * 	Author : Gourav Siddhad
 */

#ifndef BM_H_
#define BM_H_

#define port 0x33

#include "iostream"
#include "graphics.h"
#include "fstream"
#include "cstring"
#include "cstdlib"
#include "cstdio"
#include "conio.h"
#include "cctype"
#include "cmath"
#include "dos.h"
#include "dir.h"

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

#endif BM_H_
