#include "gourav.h"

int checknode, checkweight;

void insertmap();
void drawnode(int, int, int);
void insertmap_box8();
void newmap();

void newmap()
{
	char str[20], mapname[20];
	char dir[50], dir1[50], dir2[50], dir3[50];

	strcpy(dir, "d:\\NAVIGATE\\");
	outtextxy(10, 10, "Enter Map : ");
	cin >> mapname;

	strupr(mapname);
	strcat(dir, mapname);
	strcpy(dir1, dir);
	strcpy(dir2, dir);
	strcpy(dir3, dir);
	strcat(dir1, "\\NODE.TXT");
	strcat(dir2, "\\WEIGHT.TXT");
	strcat(dir3, "\\GRAPH.TXT");
	mkdir(dir);

	insertmap();
}

void insertmap()
{
	_mouse_hide();

	setcolor(RED);
	setfillstyle(SOLID_FILL, RED);
	circle(20, 20, 10);
	floodfill(20, 20, RED);

	setcolor(BLUE);
	setfillstyle(SOLID_FILL, BLUE);
	circle(20, getmaxy() - 20, 10);
	floodfill(20, getmaxy() - 20, BLUE);

	/*
	 setcolor(RED);
	 circle(getmaxx()/2,getmaxy()/2,10);
	 void far *ptr;
	 ptr = (void *)imagesize(getmaxx()/2-10,getmaxy()/2-10,getmaxx()/2+10,getmaxy()/2+10);
	 getimage(getmaxx()/2-10,getmaxy()/2-10,getmaxx()/2+10,getmaxy()/2+10,ptr);
	 putimage(20,30,ptr,COPY_PUT);
	 */

	_mouse_show();
	while (1)
	{
		_mouse_getmousepos(&button, &mx, &my);
		{
			if (mx > 10 && my > (getmaxy() - 30) && mx < 30 && my < (getmaxy() - 10))
				insertmap_box8();
		}
		if (button == 1)
		{
			if (mx > 10 && my > 10 && mx < 30 && my < 30)
				exit(0); //check the red button

			if (checknode == 1)
			{
				_mouse_hide();
				setcolor(RED);
				drawnode(mx, my, 40);
				_mouse_show();
			}
			if (checknode == 2)
			{
			}
		}
		if (button == 2)
			exit(0);
	}
}

void insertmap_box8()
{
	_mouse_hide();

	void far
		*ptr;
	ptr = (void *)imagesize(0, getmaxy() - 100, getmaxx(), getmaxy());
	getimage(0, getmaxy() - 100, getmaxx(), getmaxy(), ptr);

	int cx = getmaxx() / 2, cy = getmaxy() - 50;
	int cord[][2] = {cx - 240, cy, cx - 160, cy, cx - 80, cy, cx, cy, cx + 80,
					 cy, cx + 160, cy, cx + 240, cy, -1, -1};

	for (int i = 0; cord[i][0] != -1; i++)
	{
		setfillstyle(SOLID_FILL, random(15) + 1);
		int x1 = cord[i][0], y1 = cord[i][1];
		bar(x1 - 36, y1 - 36, x1 + 36, y1 + 36);
		line(x1 - 36, y1 - 12, x1 + 36, y1 - 12);
		line(x1 - 36, y1 + 12, x1 + 36, y1 + 12);
	}

	_mouse_show();
	while (1)
	{
		_mouse_getmousepos(&button, &mx, &my);

		{ //if no button is pressed
			if (!(mx > 0 && my > getmaxy() - 100 && mx < getmaxx() && my < getmaxy()))
			{ //when mouse is out of boxes
				_mouse_hide();
				putimage(0, getmaxy() - 100, ptr, COPY_PUT);
				_mouse_show();
				insertmap();
			}

			for (i = 0; cord[i][0] != -1; i++)
			{
				int x = cord[i][0], y = cord[i][1];
				if (mx > x - 36 && my > y - 36 && mx < x + 36 && my < y + 36)
					;
				//	exit(0);	//show map
			}
		}

		if (button == 1)
		{
			for (i = 0; cord[i][0] != -1; i++)
			{
				int x = cord[i][0], y = cord[i][1];
				if (mx > x - 36 && my > y - 36 && mx < x + 36 && my < y + 36)
				{
					_mouse_hide();
					putimage(0, getmaxy() - 100, ptr, COPY_PUT);
					_mouse_show();
				}
				if (mx > x - 36 && my > y - 36 && mx < x + 36 && my < y - 12)
					checknode = 1;
				if (mx > x - 36 && my > y - 12 && mx < x + 36 && my < y + 12)
					checknode = 2;
				if (mx > x - 36 && my > y + 12 && mx < x + 36 && my < y + 36)
					checknode = 3;
			}
		}
		if (button == 2)
			exit(0);
	}
}

void drawnode(int x, int y, int r)
{
	line(x - r / 12, y, x + r / 12, y);

	line(x - r / 12, y, x - r / 12, y + r / 6);
	line(x + r / 12, y, x + r / 12, y + r / 6);

	line(x - r / 12, y + r / 6, x - r / 6, y + r / 6);
	line(x + r / 12, y + r / 6, x + r / 6, y + r / 6);

	line(x - r / 6, y - r / 6, x - r / 6, y + r / 6);
	line(x + r / 6, y - r / 6, x + r / 6, y + r / 6);

	line(x, y - r / 4, x - r / 4, y - r / 9);
	line(x, y - r / 4, x + r / 4, y - r / 9);
}

void main()
{
	clrscr();
	_graphics_init();
	_mouse_init();
	_mouse_show();

	newmap();

	getch();
}
