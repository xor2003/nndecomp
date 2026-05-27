#include <stdio.h>
#include <conio.h>
#include <dos.h>
#include <graphics.h>
#include <stdlib.h>
#include <bios.h>
#define port 0x0378

char ch;
void display(int, int, int, int);
void dispbutton(int);
void click(int, int, int, int);
void status(int, int, int, int);
void reset(int *, int *, int *, int *);

int x, y, button;
union REGS i, o;

initmouse()
{
	i.x.ax = 0;
	int86(0x33, &i, &o);
	return (o.x.ax);
}

void showmouseptr()
{
	i.x.ax = 1;
	int86(0x33, &i, &o);
}

void getmousepos(int *button, int *x, int *y)
{
	i.x.ax = 3;
	int86(0x33, &i, &o);
	*button = o.x.bx;
	*x = o.x.cx;
	*y = o.x.dx;
}

void hidemouseptr()
{
	i.x.ax = 2;
	int86(0x33, &i, &o);
}

void main()
{
	clrscr();
	int s1 = 0, s2 = 0, s3 = 0, s4 = 0;
	int gdriver = DETECT, gmode, ercode;
	initgraph(&gdriver, &gmode, "");
	ercode = graphresult();
	if (ercode != 0)
	{
		printf("error code:%s", grapherrormsg(ercode));
		getch();
	}
	display(s1, s2, s3, s4);
	initmouse();
	showmouseptr();
	while (ch != 27)
	{
		getmousepos(&button, &x, &y);
		if (button == 1)
		{
			if (x > 80 && x < 180 && y > 100 && y < 140)
				ch = '1';
			if (x > 200 && x < 300 && y > 100 && y < 140)
				ch = '2';
			if (x > 320 && x < 420 && y > 100 && y < 140)
				ch = '3';
			if (x > 440 && x < 540 && y > 100 && y < 140)
				ch = '4';
			if (x > 440 && x < 540 && y > 300 && y < 340)
				ch = 32;
			if (x > 80 && x < 180 && y > 300 && y < 340)
				ch = 27;
		}

		if (kbhit())
			ch = getch();
		switch (ch)
		{
		case '1':
		{
			s1 = !s1;
			click(s1, s2, s3, s4);
			outportb(port, 1);
			delay(500);
			outport(port, 0);
			ch = '0';
			break;
		}
		case '2':
		{
			s2 = !s2;
			click(s1, s2, s3, s4);
			outportb(port, 2);
			delay(500);
			outport(port, 0);
			ch = '0';
			break;
		}
		case '3':
		{
			s3 = !s3;
			click(s1, s2, s3, s4);
			outportb(port, 4);
			delay(500);
			outport(port, 0);
			ch = '0';
			break;
		}
		case '4':
		{
			s4 = !s4;
			click(s1, s2, s3, s4);
			outportb(port, 8);
			delay(500);
			outport(port, 0);
			ch = '0';
			break;
		}
		case 32:
		{
			click(s1, s2, s3, s4);
			reset(&s1, &s2, &s3, &s4);
			ch = '0';
			break;
		}
		case 27:
		{
			click(s1, s2, s3, s4);
			reset(&s1, &s2, &s3, &s4);
			closegraph();
			exit(0);
		}
		}
	}
}

void display(int s1, int s2, int s3, int s4)
{
	setbkcolor(9);
	setcolor(1);
	rectangle(5, 5, 635, 475);
	rectangle(10, 10, 630, 470);
	dispbutton(1);
	dispbutton(2);
	dispbutton(3);
	dispbutton(4);
	dispbutton(5);
	dispbutton(6);
	status(s1, s2, s3, s4);
	setcolor(1);
	outtextxy(100, 115, "SWITCH 1");
	outtextxy(220, 115, "SWITCH 2");
	outtextxy(340, 115, "SWITCH 3");
	outtextxy(460, 115, "SWITCH 4");
	outtextxy(115, 315, "EXIT");
	outtextxy(470, 315, "RESET");
}

void dispbutton(int n)
{
	int x1, y1, x2, y2;
	if (n == 1)
	{
		x1 = 80;
		y1 = 100;
		x2 = 180;
		y2 = 140;
	}
	if (n == 2)
	{
		x1 = 200;
		y1 = 100;
		x2 = 300;
		y2 = 140;
	}
	if (n == 3)
	{
		x1 = 320;
		y1 = 100;
		x2 = 420;
		y2 = 140;
	}
	if (n == 4)
	{
		x1 = 440;
		y1 = 100;
		x2 = 540;
		y2 = 140;
	}
	if (n == 5)
	{
		x1 = 80;
		y1 = 300;
		x2 = 180;
		y2 = 340;
	}
	if (n == 6)
	{
		x1 = 440;
		y1 = 300;
		x2 = 540;
		y2 = 340;
	}
	setfillstyle(SOLID_FILL, 7);
	bar(x1, y1, x2, y2);
	setcolor(15);
	line(x1, y1, x2, y1);
	line(x1, y1, x1, y2);
	setcolor(8);
	line(x2, y1, x2, y2);
	line(x1, y2, x2, y2);
}

void click(int s1, int s2, int s3, int s4)
{
	int x1, y1, x2, y2;
	if (ch == '1')
	{
		x1 = 80;
		y1 = 100;
		x2 = 180;
		y2 = 140;
	}
	if (ch == '2')
	{
		x1 = 200;
		y1 = 100;
		x2 = 300;
		y2 = 140;
	}
	if (ch == '3')
	{
		x1 = 320;
		y1 = 100;
		x2 = 420;
		y2 = 140;
	}
	if (ch == '4')
	{
		x1 = 440;
		y1 = 100;
		x2 = 540;
		y2 = 140;
	}
	if (ch == 27)
	{
		x1 = 80;
		y1 = 300;
		x2 = 180;
		y2 = 340;
	}
	if (ch == 32)
	{
		x1 = 440;
		y1 = 300;
		x2 = 540;
		y2 = 340;
	}
	hidemouseptr();
	setcolor(15);
	line(x2, y1, x2, y2);
	line(x1, y2, x2, y2);
	setcolor(8);
	line(x1, y1, x2, y1);
	line(x1, y1, x1, y2);
	sound(50);
	delay(75);
	nosound();
	setcolor(15);
	line(x1, y1, x2, y1);
	line(x1, y1, x1, y2);
	setcolor(8);
	line(x2, y1, x2, y2);
	line(x1, y2, x2, y2);
	showmouseptr();
	status(s1, s2, s3, s4);
}

void status(int s1, int s2, int s3, int s4)
{
	setcolor(4);
	setfillstyle(SOLID_FILL, 4);
	circle(130, 200, 10);
	circle(250, 200, 10);
	circle(370, 200, 10);
	circle(490, 200, 10);
	if (s1 == 1)
		floodfill(130, 200, 4);
	else
	{
		setcolor(0);
		setfillstyle(SOLID_FILL, 0);
		circle(130, 200, 10);
		floodfill(130, 200, 0);
		setcolor(4);
		circle(130, 200, 10);
		setfillstyle(SOLID_FILL, 4);
	}
	if (s2 == 1)
		floodfill(250, 200, 4);
	else
	{
		setcolor(0);
		setfillstyle(SOLID_FILL, 0);
		circle(250, 200, 10);
		floodfill(250, 200, 0);
		setcolor(4);
		circle(250, 200, 10);
		setfillstyle(SOLID_FILL, 4);
	}
	if (s3 == 1)
		floodfill(370, 200, 4);
	else
	{
		setcolor(0);
		setfillstyle(SOLID_FILL, 0);
		circle(370, 200, 10);
		floodfill(370, 200, 0);
		setcolor(4);
		circle(370, 200, 10);
		setfillstyle(SOLID_FILL, 4);
	}
	if (s4 == 1)
		floodfill(490, 200, 4);
	else
	{
		setcolor(0);
		setfillstyle(SOLID_FILL, 0);
		circle(490, 200, 10);
		floodfill(490, 200, 0);
		setcolor(4);
		circle(490, 200, 10);
	}
}

void reset(int *s1, int *s2, int *s3, int *s4)
{
	if (*s1 == 1)
	{
		outportb(port, 1);
		delay(500);
		outport(port, 0);
	}
	if (*s2 == 1)
	{
		outportb(port, 2);
		delay(500);
		outport(port, 0);
	}
	if (*s3 == 1)
	{
		outportb(port, 4);
		delay(500);
		outport(port, 0);
	}
	if (*s4 == 1)
	{
		outportb(port, 8);
		delay(500);
		outport(port, 0);
	}
	*s1 = 0;
	*s2 = 0;
	*s3 = 0;
	*s4 = 0;
	status(*s1, *s2, *s3, *s4);
}
