#ifndef ORBOX_H_
#define ORBOX_H_

#include <iostream.h>
#include <graphics.h>
#include <fstream.h>
#include <process.h>
#include <string.h>
#include <conio.h>
#include <stdio.h>
#include <time.h>
#include <dos.h>

class level;

int a1, a2;
int x = 20, y = 40, d = 15;
int total;

void dest(int, int);
void akriti(int, int);
void box(int, int, int, int, int);

void laser(int, int);
void lbutton(int, int);
void rock(int, int);

//void ladder(int,int);

void homedraw(level);
void levels();
void play(level);

class level
{
private:
	int lno;
	int ax, ay;

public:
	int map[15][21];
	void storedata(int l, int x, int y, int map1[][21])
	{
		lno = l;
		ax = x;
		ay = y;
		for (int i = 0; i < 15; i++)
		{
			for (int j = 0; j < 21; j++)
			{
				map[i][j] = map1[i][j];
			}
		}
	}
	void getdata(int *l, int *x, int *y)
	{
		*l = lno;
		*x = ax;
		*y = ay;
	}
};

void levels()
{
	ofstream ofile("y:\\level.dat", ios::binary);

	level l;
	total = 1;
	int level1[][21] = {
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		1,
		1,
		1,
		5,
		1,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		1,
		0,
		1,
		1,
		1,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		1,
		1,
		1,
		2,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		1,
		1,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
	};

	a1 = 7;
	a2 = 10;

	l.storedata(1, a1, a2, level1);

	ofile.write((char *)&l, sizeof(l));

	total++;
	int level2[][21] = {
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		2,
		2,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		2,
		2,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		1,
		1,
		1,
		1,
		1,
		5,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		2,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		2,
		1,
		1,
		1,
		2,
		1,
		1,
		1,
		1,
		2,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		2,
		1,
		1,
		1,
		0,
		1,
		1,
		1,
		1,
		2,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		2,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		2,
		2,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		2,
		2,
		2,
		2,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
	};

	a1 = 7;
	a2 = 10;

	l.storedata(2, a1, a2, level2);

	ofile.write((char *)&l, sizeof(l));
	ofile.close();
}

void homedraw(level l)
{
	setfillstyle(SOLID_FILL, BLACK);
	bar(0, 0, getmaxx(), getmaxy());
	box(0, 20, getmaxx(), getmaxy(), 0);

	int lno, ax, ay;
	l.getdata(&lno, &ax, &ay);
	for (int i = 0; i < 15; i++)
	{
		for (int j = 0; j < 21; j++)
		{
			switch (l.map[i][j])
			{
			case 0:
				akriti(x, y);
				break;
			case 1:
				box(x - d + 1, y - d + 1, x + d - 1, y + d - 1, BLACK);
				break;
			case 2:
				rock(x, y);
				break;
			case 3:
				box(x - d + 1, y - d + 1, x + d - 1, y + d - 1, BLACK);
				laser(x, y);
				break;
			case 4:
				lbutton(x, y);
				break;
			case 5:
				dest(x, y);
				break;
			default:
				box(x - d + 1, y - d + 1, x + d - 1, y + d - 1, BROWN);
				break;
			}

			x += 30;
		}
		x = 20;
		y += 30;
	}
	x = 20;
	y = 40;

	box(5, 5, getmaxx() / 2, 15, GREEN);
}

void akriti(int x1, int y1)
{
	box(x1 - d + 1, y1 - d + 1, x1 + d - 1, y1 + d - 1, BLACK);
	int col = getcolor();

	setcolor(YELLOW);
	circle(x1, y1, d / 2);

	setfillstyle(SOLID_FILL, YELLOW);
	floodfill(x1, y1 + d / 5, YELLOW);

	setcolor(0);

	circle(x1 - d / 4, y1 - d / 6, d / 8);
	circle(x1 + d / 4, y1 - d / 6, d / 8);

	circle(x1, y1, d / 15);

	setfillstyle(SOLID_FILL, BLACK);
	floodfill(x1, y1, BLACK);
	floodfill(x1 - d / 4, y1 - d / 6, BLACK);
	floodfill(x1 + d / 4, y1 - d / 6, BLACK);

	//	if(o==0)
	ellipse(x1, y1 + d / 5, 180, 0, d / 4, d / 8);
	//	else
	//		ellipse(x1,y1+d/5,0,180,d/4,d/8);

	setcolor(col);
}

void box(int x1, int y1, int x2, int y2, int col)
{
	int color = getcolor();

	setfillstyle(SOLID_FILL, col);
	bar(x1, y1, x2, y2);

	setcolor(7);
	line(x1, y1, x1, y2);
	line(x1, y1, x2, y1);
	setcolor(8);
	line(x2, y2, x1, y2);
	line(x2, y2, x2, y1);

	setcolor(color);
}

void inttostr(int num, char str[])
{
	char ch;
	int i = 0;
	int d = 0, rev = 0;
	while (num > 0)
	{
		d = num % 10;
		rev = rev * 10 + d;
		num /= 10;
		switch (d)
		{
		case 1:
			ch = '1';
			break;
		case 2:
			ch = '2';
			break;
		case 3:
			ch = '3';
			break;
		case 4:
			ch = '4';
			break;
		case 5:
			ch = '5';
			break;
		case 6:
			ch = '6';
			break;
		case 7:
			ch = '7';
			break;
		case 8:
			ch = '8';
			break;
		case 9:
			ch = '9';
			break;
		case 0:
			ch = '0';
			break;
		}
		str[i] = ch;
		str[i + 1] = '\0';
		i++;
	}
	strrev(str);
}

void rock(int x1, int y1)
{
	box(x1 - d + 1, y1 - d + 1, x1 + d - 1, y1 + d - 1, LIGHTGRAY);
}

void laser(int x1, int y1)
{
	int color = getcolor();
	box(x1 - d + 1, y1 - d + 1, x1 + d - 1, y1 + d - 1, BLACK);

	setcolor(DARKGRAY);
	circle(x1, y1 + d - 2, 2);
	setfillstyle(SOLID_FILL, DARKGRAY);
	floodfill(x1, y1 + d - 2, DARKGRAY);

	setcolor(RED);
	circle(x1, y1 + d - 2, 1);
	setfillstyle(SOLID_FILL, RED);
	floodfill(x1, y1 + d - 2, RED);

	setcolor(color);
}

void lbutton(int x1, int y1)
{
	int color = getcolor();

	box(x1 - d + 1, y1 - d + 1, x1 + d - 1, y1 + d - 1, BLACK);
	setcolor(RED);
	circle(x1, y1, 4);
	setfillstyle(SOLID_FILL, RED);
	floodfill(x1, y1, RED);

	setcolor(color);
}

void ladder(int x1, int y1)
{
	int col = getcolor();

	setcolor(BROWN);
	line(x1 - d / 4, y1 - d / 2, x1 - d / 4, y1 + d / 2);
	line(x1 + d / 4, y1 - d / 2, x1 + d / 4, y1 + d / 2);

	line(x1 - d / 4, y1, x1 + d / 4, y1);
	line(x1 - d / 4, y1 - d / 4, x1 + d / 4, y1 - d / 4);
	line(x1 - d / 4, y1 + d / 4, x1 + d / 4, y1 + d / 4);

	setcolor(col);
}

#endif
