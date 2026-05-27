/* Parallel moving circle | password input */

#include "gourav.h"
#include "circle_.h"

void screen1();

void screen1()
{
	int ch;
	int maxx = getmaxx(), maxy = getmaxy();
	int ang[] = {10, 110, 0, 100, 55, 40, 10};

	//clock
	{
		circle(maxx / 2, maxy / 2, 50);
	}
	ch = getch();
	if (ch == 27)
		exit(0);
	for (int i = 50; i >= 3;)
	{
		delay(20);
		setcolor(0);
		circle(maxx / 2, maxy / 2, i);
		setcolor(WHITE);
		circle(maxx / 2, maxy / 2, --i);
	}
	for (i = maxx / 2; i >= 110;)
	{
		setcolor(WHITE);
		circle(i, maxy / 2, 3);
		delay(10);
		setcolor(0);
		circle(i--, maxy / 2, 3);
	}
	for (i = maxy / 2; i >= 110;)
	{
		delay(10);
		setcolor(0);
		circle(110, i, 3);
		setcolor(WHITE);
		circle(110, --i, 3);
	}
	for (i = 3; i >= 100;)
	{
		delay(10);
		setcolor(0);
		circle(110, 110, i);
		setcolor(WHITE);
		circle(110, 110, ++i);
	}

	int ang1 = 0, ang2 = 40;

	setcolor(BLUE);
	line(0, maxy - 70, maxx, maxy - 70);
	while (1)
	{
		//draw everything
		_running_circle(110, 110, ang, 150);
		rectangle(0, 0, maxx, maxy);

		for (int i = 50, j = 0; j < 10; i += 60, j++)
		{
			round_move(i, maxy - 35, ang1, ang2, 50);
			ang1--;
			ang2++;
		}
		ang1++;
		ang2--;

		while (kbhit())
		{
			ch = getch();
			switch (ch)
			{
			case 27:
				exit(0);
			}
		}
	}
}

int main()
{
	randomize();
	int gd = DETECT, gm = 0;
	initgraph(&gd, &gm, "c:\\software\\tc\\bgi");
	int x = getmaxx(), y = getmaxy();

	screen1();

	getch();
	return 0;
}
