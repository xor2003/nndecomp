/*
 * 	Bomber Man
 * 	Author : Gourav Siddhad
 */

#include "bm.h"

void homedraw();
void akriti(int, int, int);

void main()
{
	int gd = DETECT, gm = 0;
	initgraph(&gd, &gm, "c:\\tc\\bgi");

	akriti(getmaxx() / 2, getmaxy() / 2, 40);
	//	homedraw();
	getch();
}

void akriti(int x, int y, int size)
{
	rectangle(x - size / 2, y - size / 2, x + size / 2, y + size / 2);
}

void homedraw()
{
	//	rectangle(100,10,getmaxx()-10,getmaxy()-10);
	for (int i = 0; i < 18; i++)
	{
		for (int j = 0; j < 15; j++)
		{
			rectangle(110 + (30 * i - 15), 30 + (30 * j - 15),
					  110 + (30 * i + 15), 30 + (30 * j + 15));
		}
	}
}
