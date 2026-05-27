#include "gourav.h"
#include "minion.h"

void main()
{
	int gd = DETECT, gm = 0;
	initgraph(&gd, &gm, "c:\\software\\tc\\bgi");

	int x, y, ch;
	x = getmaxx() / 2;
	y = getmaxy() / 2;
	/*
	 long size=imagesize(x-31,y-71,x+31,y+31);
	 void far *ptr=farmalloc(size);
	 */
	_minion_draw(x, y, 400);
	//	rectangle(x-30,y-70,x+30,y+70);
	//	size=imagesize(x-31,y-71,x+31,y+71);
	//	getimage(x-30,y-70,x+30,y+70,ptr);

	while (1)
	{
		ch = getch();
		switch (ch)
		{
		case 72:
			y--;
			break;
		case 80:
			y++;
			break;
		case 75:
			x--;
			break;
		case 77:
			x++;
			break;
		case 27:
			exit(0);
		}
	}
}
