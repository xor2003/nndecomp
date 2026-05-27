#include "gourav.h"

int gx = 30, gy = 30;
int l1 = 5, k = 0;
int xs = 20, ys = 20;
int xe = xs + gx * l1, ye = ys + gy * l1;
int points = 1, t = 0;
int size = gx * gy / 2;
int xx = xs + 30, yy = ys + 30;
int px, py;
int sx[50], sy[50];

void createpoint()
{
	px = xs + random(gx) * l1;
	py = ys + random(gy) * l1;

	/*	for(int k=0;k<=t;k++)
	 {
	 if(sx[k]==px && sy[k]==py)
	 createpoint();
	 }
	 */
	setfillstyle(SOLID_FILL, RED);
	bar(px - l1 / 2, py - l1 / 2, px + l1 / 2, py + l1 / 2);
}

void eraseblock(int x1, int y1)
{
	setfillstyle(SOLID_FILL, 15);
	bar(x1 - l1 / 2, y1 - l1 / 2, x1 + l1 / 2, y1 + l1 / 2);
}

void createblock(int x1, int y1)
{
	setfillstyle(SOLID_FILL, BLUE);
	bar(x1 - l1 / 2, y1 - l1 / 2, x1 + l1 / 2, y1 + l1 / 2);
}

void gameover()
{
	outtextxy(0, 0, "GAME OVER");
	getch();
	exit(0);
}

void updatesnake()
{
	for (k = 0; k <= t; k++)
		eraseblock(sx[k], sy[k]);

	if (xx == px && yy == py)
	{
		points++;
		t++;
		createpoint();
	}

	for (k = t; k >= 0; k--)
	{
		sx[k] = sx[k - 1];
		sy[k] = sy[k - 1];
	}

	sx[0] = xx;
	sy[0] = yy;
	for (k = 0; k <= t; k++)
		createblock(sx[k], sy[k]);
}

void snake()
{
	int ch;
	for (int k = xs; k <= xe; k += l1)
		for (int j = ys; j <= ye; j += l1)
		{
			setfillstyle(SOLID_FILL, 15);
			bar(k - l1 / 2, j - l1 / 2, k + l1 / 2, j + l1 / 2);
		}
	sx[0] = xx;
	sy[0] = yy;

	createblock(sx[0], sy[0]);
	createpoint();

	while (1)
	{
		ch = getch();
		switch (ch)
		{
		case 72:
			yy -= l1;
			break;
		case 80:
			yy += l1;
			break;
		case 75:
			xx -= l1;
			break;
		case 77:
			xx += l1;
			break;
		case 27:
		case 13:
			exit(0);
		}

		if (xx >= xe || xx < xs || yy > ye || yy < ys)
			gameover();

		/*		for(k=1;k<=t;k++)
		 {
		 if(sx[0]==sx[k] && sy[0]==sy[k])
		 gameover();
		 }
		 */
		updatesnake();
	}
}

void main()
{
	initgraphic();
	randomize();
	snake();
	getch();
}
