#include "gourav.h"

void selfd();
void masterreset();
void gclock(void);
void contactme();
void dispbutton1(int);
void display();
void passworda();
void passwordg();
void dispbutton(int);
void lclock();
void dispbut(int);
void dispbar(int);
void frontm1();
void frontm2();
void actalarm();
void dactalarm();
void anim();

float xi = 100, yi = 100, xm = 539, ym = 379, d = 30;
float d1 = (xm - xi - 3 * d) / 4;
float d2 = (ym - yi - 2 * d) / 3;

void anim()
{
	int left = 0, top = 0, right = getmaxx(), bot = getmaxy();
	setlinestyle(0, 0, 2);
	while (bot != getmaxy() / 2)
	{
		hidemouseptr();
		setcolor(0);
		rectangle(left - 1, top - 1, right + 1, bot + 1);
		setcolor(1);
		rectangle(left, top, right, bot);

		left = left + 1;
		top = top + 1;
		right = right - 1;
		bot = bot - 1;
		delay(4);
		showmouseptr();
	}
}

void front()
{
	anim();
	hidemouseptr();
	cleardevice();
	display();
	showmouseptr();
	while (1)
	{
		getmousepos(&button, &x, &y);
		if (button == 1)
		{
			if (x > 380 && y > 150 && x < 524 && y < 180)
				passworda();
			if (x > 380 && y > 270 && x < 524 && y < 300)
				passwordg();
			if (x > 25 && x < 75 && y > (getmaxy() - 50) && y < (getmaxy() - 10))
				exit(0);
			if (x > (getmaxx() - 75) && x < (getmaxx() - 25) && y > (getmaxy() - 50) && y < (getmaxy() - 10))
				front();
			if (x > (getmaxx() / 2 - 25) && x < (getmaxx() / 2 + 25) && y > (getmaxy() - 50) && y < (getmaxy() - 10))
				contactme();
		}
	}
}

void dispbutton1(int n)
{
	setlinestyle(0, 0, 3);
	int x1, x2, y1, y2;
	int color = 7;
	if (n == 12)
	{
		x1 = 380;
		y1 = 150;
		x2 = 524;
		y2 = 180;
	}
	if (n == 13)
	{
		x1 = 380;
		y1 = 270;
		x2 = 524;
		y2 = 300;
	}
	if (n == 7)
	{
		x1 = 25;
		x2 = 75;
		y1 = getmaxy() - 50;
		y2 = getmaxy() - 10;
		color = 4;
	}
	if (n == 15)
	{
		x1 = getmaxx() - 75;
		x2 = getmaxx() - 25;
		y1 = getmaxy() - 50;
		y2 = getmaxy() - 10;
		color = 4;
	}
	if (n == 14)
	{
		x1 = getmaxx() / 2 - 25;
		x2 = getmaxx() / 2 + 25;
		y1 = getmaxy() - 50;
		y2 = getmaxy() - 10;
		color = 4;
	}
	setfillstyle(SOLID_FILL, color);
	bar(x1, y1, x2, y2);
	setcolor(15);
	line(x1, y1, x2, y1);
	line(x1, y1, x1, y2);
	setcolor(8);
	line(x2, y1, x2, y2);
	line(x1, y2, x2, y2);
}

void display()
{
	cleardevice();
	setbkcolor(LIGHTBLUE);
	setfillstyle(SOLID_FILL, BLUE);
	bar(0, 0, getmaxx(), 60);

	setcolor(BLUE);

	bar(0, getmaxy() - 60, getmaxx(), getmaxy());
	setlinestyle(0, 0, 0);
	line(getmaxx() / 2, 130, getmaxx() / 2, getmaxy() - 130);
	setlinestyle(0, 0, 3);

	dispbutton1(12);
	dispbutton1(13);
	dispbutton1(14);
	dispbutton1(15);
	dispbutton1(7);

	settextstyle(TRIPLEX_FONT, HORIZ_DIR, 4.5);
	setcolor(BLUE);
	outtextxy(getmaxx() / 6, getmaxy() / 2 - 35, "WELCOME");

	settextstyle(GOTHIC_FONT, HORIZ_DIR, 3.5);
	setcolor(GREEN);
	outtextxy(getmaxx() / 3, 10, "GOURAV SIDDHAD");

	settextstyle(TRIPLEX_FONT, HORIZ_DIR, 1);
	setcolor(RED);
	outtextxy(385, 155, "ADMINISTRATOR");
	outtextxy(424, 275, "GUEST");

	setcolor(BLUE);
	arc(50, getmaxy() - 28, 160, 380, 10);
	line(50, getmaxy() - 40, 50, getmaxy() - 25);

	setcolor(BLUE);
	setlinestyle(0, 0, 3);
	line(getmaxx() - 60, getmaxy() - 40, getmaxx() - 40, getmaxy() - 20);
	line(getmaxx() - 60, getmaxy() - 20, getmaxx() - 40, getmaxy() - 40);

	settextstyle(TRIPLEX_FONT, HORIZ_DIR, 4.5);
	outtextxy(getmaxx() / 2 - 5, getmaxy() - 50, "?");
}

void passworda()
{
	int k = 0, j = 0;
	char ch = 13, pass[8];

	hidemouseptr();
	int i = 0, left = getmaxx() / 2 - 5, top = getmaxy() / 2, right = getmaxx() / 2 + 5, bot = getmaxy() / 2;
	for (i = 0; i <= 140; i++)
	{
		setcolor(0);
		rectangle(left + 1, top + 1, right - 1, bot - 1);
		setcolor(1);
		rectangle(left, top, right, bot);
		left = left - 1;
		top = top - 1;
		right = right + 1;
		bot = bot + 1;
		delay(1.5);
	}

	setlinestyle(0, 0, 3);
	setfillstyle(SOLID_FILL, 9);
	bar(left, top, right, bot);
	setfillstyle(SOLID_FILL, 1);
	bar(left, bot - 60, right, bot);
	setcolor(1);
	line(left, top, right, top);
	line(left, top, left, bot);
	line(right, top, right, bot);
	line(right, bot, left, bot);

	int x1 = left, x2 = right, y1 = top, y2 = bot;
	setfillstyle(SOLID_FILL, RED);
	x1 = getmaxx() / 2 - 20;
	x2 = getmaxx() / 2 + 20;
	y1 = bot - 50;
	y2 = bot - 12;
	bar(x1, y1, x2, y2);
	setcolor(15);
	line(x1, y1, x2, y1);
	line(x1, y1, x1, y2);
	setcolor(8);
	line(x2, y1, x2, y2);
	line(x1, y2, x2, y2);

	x1 = left + 10;
	x2 = left + 50;
	bar(x1, y1, x2, y2);
	setcolor(15);
	line(x1, y1, x2, y1);
	line(x1, y1, x1, y2);
	setcolor(8);
	line(x2, y1, x2, y2);
	line(x1, y2, x2, y2);

	x1 = right - 50;
	x2 = right - 10;
	bar(x1, y1, x2, y2);
	setcolor(15);
	line(x1, y1, x2, y1);
	line(x1, y1, x1, y2);
	setcolor(8);
	line(x2, y1, x2, y2);
	line(x1, y2, x2, y2);

	x1 = left + 31;
	x2 = left + 50;
	setcolor(BLUE);
	arc(x1, y1 + 20, 160, 380, 10);
	line(x1, y1 + 10, x1, y1 + 22);

	x1 = right - 50;
	x2 = right - 10;
	setcolor(BLUE);
	setlinestyle(0, 0, 3);
	line(x1 + 11, y1 + 10, x2 - 11, y2 - 10);
	line(x2 - 11, y1 + 10, x1 + 11, y2 - 10);

	settextstyle(TRIPLEX_FONT, HORIZ_DIR, 4.5);
	outtextxy(getmaxx() / 2 - 5, y1, "?");

	setcolor(9);
	line(left, top, right, top);
	setlinestyle(0, 0, 1);
	line(left, bot, right, bot);

	setfillstyle(SOLID_FILL, 1);
	bar(left, top, right, top + 25);
	settextstyle(TRIPLEX_FONT, HORIZ_DIR, 2);
	setcolor(WHITE);
	outtextxy(left + 2, top, "GOURAV SIDDHAD");

	setcolor(GREEN);
	rectangle(left + 2, top + 25, right - 2, bot - 60);
	rectangle(left - 1, top - 1, right + 1, bot + 1);

	setcolor(1);
	settextstyle(SMALL_FONT, HORIZ_DIR, 7);
	outtextxy(left + 10, top + 55, "USER");
	outtextxy(left + 10.5, top + 55, "USER");
	outtextxy(left + 10, top + 100, "PASS");
	outtextxy(left + 10.5, top + 100, "PASS");

	setfillstyle(SOLID_FILL, WHITE);
	bar(left + 80, top + 55, right - 40, top + 80);
	bar(left + 80, top + 100, right - 40, top + 125);

	setcolor(8);
	settextstyle(SMALL_FONT, HORIZ_DIR, 5);
	outtextxy(left + 84, top + 60, "ADMINISTRATOR");

	showmouseptr();
	k = 0;
	j = 0;
	settextstyle(SMALL_FONT, HORIZ_DIR, 7);
	i = 0;

	while (1)
	{
		while (k != 1)
		{
			getmousepos(&button, &x, &y);
			if (button == 1)
			{
				if (x > getmaxx() / 2 - 20 && x < getmaxx() / 2 + 20 && y > bot - 50 && y < bot - 12)
					contactme();
				if (x > left + 10 && x < left + 50 && y > bot - 50 && y < bot - 12)
					exit(0);
				if (x > right - 50 && x < right - 10 && y > bot - 50 && y < bot - 12)
					front();
				if (x > left + 80 && y > top + 100 && x < right - 40 && y < top + 125)
					k = 1;
			}
		}

		if ((ch = getch()) == 13)
			passworda();
		else
		{
			pass[i] = ch;
			++i;
			setcolor(BLACK);
			gotoxy(left + 82 + j, top + 101);
			outtextxy(left + 82 + j, top + 101, "*");
			j += 10;
			if (i == 9)
			{
				pass[i] = '\0';
				j = 0;
				i = 0;
				setfillstyle(SOLID_FILL, WHITE);
				bar(left + 80, top + 100, right - 40, top + 125);
				break;
			}
		}
	}
	if (strcmp(pass, "dgourav16") == 0)
	{
		delay(100);
		frontm1();
	}
	else
	{
		setfillstyle(SOLID_FILL, WHITE);
		bar(left + 80, top + 100, right - 40, top + 125);
		front();
	}
}

void passwordg()
{
	hidemouseptr();
	int i, left = getmaxx() / 2 - 5, top = getmaxy() / 2, right = getmaxx() / 2 + 5, bot = getmaxy() / 2;

	for (i = 0; i <= 140; i++)
	{
		setcolor(0);
		rectangle(left + 1, top + 1, right - 1, bot - 1);
		setcolor(1);
		rectangle(left, top, right, bot);
		left = left - 1;
		top = top - 1;
		right = right + 1;
		bot = bot + 1;
		delay(1.5);
	}
	setlinestyle(0, 0, 3);
	setfillstyle(SOLID_FILL, 9);
	bar(left, top, right, bot);
	setfillstyle(SOLID_FILL, 1);
	bar(left, bot - 60, right, bot);
	setcolor(1);
	line(left, top, right, top);
	line(left, top, left, bot);
	line(right, top, right, bot);
	line(right, bot, left, bot);

	int x1 = left, x2 = right, y1 = top, y2 = bot;
	setfillstyle(SOLID_FILL, RED);
	x1 = getmaxx() / 2 - 20;
	x2 = getmaxx() / 2 + 20;
	y1 = bot - 50;
	y2 = bot - 12;
	bar(x1, y1, x2, y2);
	setcolor(15);
	line(x1, y1, x2, y1);
	line(x1, y1, x1, y2);
	setcolor(8);
	line(x2, y1, x2, y2);
	line(x1, y2, x2, y2);

	x1 = left + 10;
	x2 = left + 50;
	bar(x1, y1, x2, y2);
	setcolor(15);
	line(x1, y1, x2, y1);
	line(x1, y1, x1, y2);
	setcolor(8);
	line(x2, y1, x2, y2);
	line(x1, y2, x2, y2);

	x1 = right - 50;
	x2 = right - 10;
	bar(x1, y1, x2, y2);
	setcolor(15);
	line(x1, y1, x2, y1);
	line(x1, y1, x1, y2);
	setcolor(8);
	line(x2, y1, x2, y2);
	line(x1, y2, x2, y2);

	x1 = left + 31;
	x2 = left + 50;
	setcolor(BLUE);
	arc(x1, y1 + 20, 160, 380, 10);
	line(x1, y1 + 10, x1, y1 + 22);

	x1 = right - 50;
	x2 = right - 10;
	setcolor(BLUE);
	setlinestyle(0, 0, 3);
	line(x1 + 11, y1 + 10, x2 - 11, y2 - 10);
	line(x2 - 11, y1 + 10, x1 + 11, y2 - 10);

	settextstyle(TRIPLEX_FONT, HORIZ_DIR, 4.5);
	outtextxy(getmaxx() / 2 - 5, y1, "?");

	setcolor(9);
	line(left, top, right, top);
	setlinestyle(0, 0, 1);
	line(left, bot, right, bot);

	setfillstyle(SOLID_FILL, 1);
	bar(left, top, right, top + 25);
	settextstyle(TRIPLEX_FONT, HORIZ_DIR, 2);
	setcolor(WHITE);
	outtextxy(left + 2, top, "GOURAV SIDDHAD");

	setcolor(GREEN);
	rectangle(left + 2, top + 25, right - 2, bot - 60);
	rectangle(left - 1, top - 1, right + 1, bot + 1);

	setfillstyle(SOLID_FILL, WHITE);
	bar(left + 80, top + 55, right - 40, top + 80);
	bar(left + 80, top + 100, right - 40, top + 125);

	settextstyle(SMALL_FONT, HORIZ_DIR, 5);
	setcolor(8);
	outtextxy(left + 84, top + 60, "GUEST");
	settextstyle(SMALL_FONT, HORIZ_DIR, 7);
	setcolor(1);
	outtextxy(left + 10, top + 55, "USER");
	outtextxy(left + 10.5, top + 55, "USER");
	outtextxy(left + 10, top + 100, "PASS");
	outtextxy(left + 10.5, top + 100, "PASS");

	showmouseptr();
	int j = 0;
	i = 0;
	char ch, pass[8];
	ch = 13;
	strcpy(pass, "");
	int k = 0;
	while (1)
	{
		while (k != 1)
		{
			getmousepos(&button, &x, &y);
			if (button == 1)
			{
				if (x > getmaxx() / 2 - 20 && x < getmaxx() / 2 + 20 && y > bot - 50 && y < bot - 12)
					contactme();
				if (x > left + 10 && x < left + 50 && y > bot - 50 && y < bot - 12)
					exit(0);
				if (x > right - 50 && x < right - 10 && y > bot - 50 && y < bot - 12)
					front();
				if (x > left + 80 && y > top + 100 && x < right - 40 && y < top + 125)
				{
					strcpy(pass, " ");
					k = 1;
				}
			}
		}

		if ((ch = getch()) == 13)
			passwordg();
		else
		{
			pass[i] = ch;
			++i;
			setcolor(BLACK);
			gotoxy(left + 82 + j, top + 101);
			outtextxy(left + 82 + j, top + 101, "*");
			j += 10;
			if (i == 9)
			{
				pass[i] = '\0';
				j = 0;
				i = 0;
				setfillstyle(SOLID_FILL, WHITE);
				bar(left + 80, top + 100, right - 40, top + 125);
				break;
			}
		}
	}
	if (strcmp(pass, "justopenc") == 0)
	{
		gclock();
	}
	else
	{
		strcpy(pass, "");
		setfillstyle(SOLID_FILL, WHITE);
		bar(left + 80, top + 100, right - 40, top + 125);
		front();
	}
}

void contactme()
{
	anim();
	hidemouseptr();
	cleardevice();
	setbkcolor(LIGHTBLUE);
	setfillstyle(SOLID_FILL, BLUE);
	bar(0, 0, getmaxx(), 60);

	setcolor(BLUE);

	bar(0, getmaxy() - 60, getmaxx(), getmaxy());
	setlinestyle(0, 0, 0);
	setlinestyle(0, 0, 3);

	int x = getmaxx() / 2, y = getmaxy() / 2;
	setcolor(WHITE);
	settextstyle(TRIPLEX_FONT, HORIZ_DIR, 4);
	outtextxy(x - 170, 18, "gourav1607@gmail.com");
	outtextxy(getmaxx() / 2 - 100, getmaxy() - 50, "7879812606");
	setcolor(GREEN);
	setlinestyle(0, 0, 3);
	arc(x, y, 75, 270, 100);
	arc(x, y + 65, 270, 90, 35);
	arc(x, y - 5, 70, 270, 35);
	line(x + 12, y - 40, 280, 380);
	setcolor(CYAN);
	outtextxy(x + 40, y + 60, "IDDHAD");

	dispbutton(7);
	dispbutton(15);

	setcolor(BLUE);
	arc(50, getmaxy() - 28, 160, 380, 10);
	line(50, getmaxy() - 40, 50, getmaxy() - 25);

	setcolor(BLUE);
	setlinestyle(0, 0, 3);
	line(getmaxx() - 60, getmaxy() - 40, getmaxx() - 40, getmaxy() - 20);
	line(getmaxx() - 60, getmaxy() - 20, getmaxx() - 40, getmaxy() - 40);

	showmouseptr();

	while (1)
	{
		getmousepos(&button, &x, &y);
		if (button == 1)
		{
			if (x > 25 && x < 75 && y > (getmaxy() - 50) && y < (getmaxy() - 10))
				exit(0);
			if (x > (getmaxx() - 75) && x < (getmaxx() - 25) && y > (getmaxy() - 50) && y < (getmaxy() - 10))
				front();
		}
	}
}

void frontm1()
{
	anim();
	hidemouseptr();
	cleardevice();
	setbkcolor(BLACK);

	dispbutton(1);
	dispbutton(2);
	dispbutton(3);
	dispbutton(4);

	dispbar(1);
	dispbar(2);
	dispbar(3);
	dispbar(4);

	setfillstyle(SOLID_FILL, RED);

	// exit
	int x1 = 28;
	int y1 = 8;
	setcolor(RED);
	arc(x1, y1 + 20, 160, 380, 10);
	line(x1, y1 + 10, x1, y1 + 22);

	// G
	x = 30, y = getmaxy() - 28;
	setcolor(RED);
	setlinestyle(0, 0, 3);
	arc(x, y, 75, 270, 15);
	arc(x, y + 10, 270, 90, 5);
	arc(x, y - 1, 70, 270, 5);
	line(x + 3, y - 5, 15, getmaxy() - 13);
	// <-
	settextstyle(TRIPLEX_FONT, HORIZ_DIR, 4);
	outtextxy(getmaxx() - 27, getmaxy() - 47.5, "-");
	outtextxy(getmaxx() - 28, getmaxy() - 47.5, "-");
	line(getmaxx() - 38, getmaxy() - 27, getmaxx() - 27, getmaxy() - 41);
	line(getmaxx() - 38, getmaxy() - 27, getmaxx() - 27, getmaxy() - 15);

	showmouseptr();

	while (1)
	{
		getmousepos(&button, &x, &y);
		if (button == 1)
		{
			if (x > 5 && x < 50 && y > getmaxy() - 50 && y < getmaxy() - 5)
				frontm2();
			if (x > getmaxx() - 50 && x < getmaxx() - 5 && y > getmaxy() - 50 && y < getmaxy() - 5)
				front();
			if (x > 5 && x < 50 && y > 5 && y < 50)
				exit(0);
			if (x > getmaxx() - 50 && x < getmaxx() - 5 && y > 5 && y < 50)
				exit(0);
		}
	}
}

void frontm2()
{
	hidemouseptr();
	cleardevice();
	setbkcolor(BLACK);
	dispbutton(1);
	dispbutton(2);
	dispbutton(3);
	dispbutton(4);

	dispbar(1);
	dispbar(2);
	dispbar(3);
	dispbar(4);

	dispbut(1);
	dispbut(2);
	dispbut(3);
	dispbut(4);
	dispbut(5);
	dispbut(6);
	dispbut(7);
	dispbut(8);
	dispbut(9);
	dispbut(10);
	dispbut(11);
	dispbut(12);

	setfillstyle(SOLID_FILL, RED);

	// exit
	int x1 = 28;
	int y1 = 8;
	setcolor(RED);
	arc(x1, y1 + 20, 160, 380, 10);
	line(x1, y1 + 10, x1, y1 + 22);

	// G
	x = 30, y = getmaxy() - 28;
	setcolor(RED);
	setlinestyle(0, 0, 3);
	arc(x, y, 75, 270, 15);
	arc(x, y + 10, 270, 90, 5);
	arc(x, y - 1, 70, 270, 5);
	line(x + 3, y - 5, 15, getmaxy() - 13);

	// <-
	settextstyle(TRIPLEX_FONT, HORIZ_DIR, 4);
	outtextxy(getmaxx() - 27, getmaxy() - 47.5, "-");
	outtextxy(getmaxx() - 28, getmaxy() - 47.5, "-");
	line(getmaxx() - 38, getmaxy() - 27, getmaxx() - 27, getmaxy() - 41);
	line(getmaxx() - 38, getmaxy() - 27, getmaxx() - 27, getmaxy() - 15);

	//clock
	setcolor(15);
	circle((xi + xi + d1) / 2, (yi + yi + d2) / 2, 20);
	setcolor(10);
	line((xi + xi + d1) / 2, (yi + yi + d2) / 2, (xi + xi + d1) / 2 + 10,
		 (yi + yi + d2) / 2 - 10);
	line((xi + xi + d1) / 2, (yi + yi + d2) / 2, (xi + xi + d1) / 2 + 12,
		 (yi + yi + d2) / 2);

	//last clock
	setcolor(15);
	circle((xi + d1 + d + xi + 2 * d1 + d) / 2, (yi + yi + d2) / 2, 20);
	setcolor(10);
	line((xi + d1 + d + xi + 2 * d1 + d) / 2, (yi + yi + d2) / 2,
		 (xi + d1 + d + xi + 2 * d1 + d) / 2 + 10, (yi + yi + d2) / 2 - 10);
	line((xi + d1 + d + xi + 2 * d1 + d) / 2, (yi + yi + d2) / 2,
		 (xi + d1 + d + xi + 2 * d1 + d) / 2 + 12, (yi + yi + d2) / 2);
	setcolor(12);
	line((xi + d1 + d + xi + 2 * d1 + d) / 2, (yi + yi + d2) / 2 + 22,
		 (xi + d1 + d + xi + 2 * d1 + d) / 2 - 18, (yi + yi + d2) / 2 + 22);
	settextstyle(SMALL_FONT, HORIZ_DIR, 5);
	outtextxy((xi + d1 + d + xi + 2 * d1 + d) / 2 - 22, (yi + yi + d2) / 2 + 14,
			  "<");
	outtextxy((xi + d1 + d + xi + 2 * d1 + d) / 2 - 21, (yi + yi + d2) / 2 + 14,
			  "<");

	//act alarm
	setlinestyle(0, 0, 1);
	setcolor(7);
	circle((xi + 2 * d1 + 2 * d + xi + 3 * d1 + 2 * d) / 2 - 10,
		   (yi + yi + d2) / 2, 1.5);
	for (int k = 0; k <= 5; k++)
		arc((xi + 2 * d1 + 2 * d + xi + 3 * d1 + 2 * d) / 2 - 10,
			(yi + yi + d2) / 2, -60, 60, 5 * k);

	//dact alarm
	setcolor(7);
	circle((xi + 3 * d1 + 3 * d + xm) / 2 - 10, (yi + yi + d2) / 2, 1.5);
	for (k = 0; k <= 5; k++)
		arc((xi + 3 * d1 + 3 * d + xm) / 2 - 10, (yi + yi + d2) / 2, -60, 60,
			5 * k);
	setlinestyle(0, 0, 3);
	setcolor(RED);
	line(xi + 3 * d1 + 3 * d + 60, yi + 15, xm - 60, yi + d2 - 15);

	//calender
	setcolor(7);
	rectangle(xi + 20, yi + d2 + d + 10, xi + d1 - 20, yi + 2 * d2 + d - 10);
	line(xi + 20, yi + d2 + d + 25, xi + d1 - 20, yi + d2 + d + 25);
	for (k = 0; k < 4; k++)
		line(xi + 20, yi + d2 + d + 25 + 10 * k, xi + d1 - 20,
			 yi + d2 + d + 25 + 10 * k);
	for (k = 0; k < 4; k++)
		line(xi + 30 + 9 * k, yi + d2 + d + 25, xi + 30 + 9 * k,
			 yi + 2 * d2 + d - 10);
	settextstyle(SMALL_FONT, HORIZ_DIR, 4);
	outtextxy(xi + 21, yi + d2 + d + 10, "Calender");

	//calender + clock
	setlinestyle(0, 0, 1);
	setcolor(7);

	circle(xi + d1 + d + 18, yi + d2 + d + 18, 12);
	line(xi + d1 + d + 18, yi + d2 + d + 18, xi + d1 + d + 26,
		 yi + d2 + d + 18);
	line(xi + d1 + d + 18, yi + d2 + d + 18, xi + d1 + d + 24,
		 yi + d2 + d + 12);

	rectangle(xi + d1 + d + 35, yi + d2 + d + 15, xi + 2 * d1 + d - 10,
			  yi + 2 * d2 + d - 10);
	line(xi + d1 + d + 35, yi + d2 + d + 28, xi + 2 * d1 + d - 10,
		 yi + d2 + d + 28);
	for (k = 0; k < 4; k++)
		line(xi + d1 + d + 35, yi + d2 + d + 28 + 9 * k, xi + 2 * d1 + d - 10,
			 yi + d2 + d + 28 + 9 * k);
	for (k = 0; k < 4; k++)
		line(xi + d1 + d + 43 + 9 * k, yi + d2 + d + 28,
			 xi + d1 + d + 43 + 9 * k, yi + 2 * d2 + d - 10);
	settextstyle(SMALL_FONT, HORIZ_DIR, 4);
	outtextxy(xi + d1 + d + 35, yi + d2 + d + 15, "Calender");

	//master reset
	setcolor(14);
	setlinestyle(0, 0, 1);
	rectangle(xi + 2 * d1 + 2 * d + 20, yi + 2 * d2 + 2 * d + 15,
			  (xi + 2 * d1 + 2 * d + xi + 3 * d1 + 2 * d) / 2 - 2,
			  (ym + yi + 2 * d2 + 2 * d) / 2 - 2);
	rectangle((xi + 2 * d1 + 2 * d + xi + 3 * d1 + 2 * d) / 2 + 2,
			  (ym + yi + 2 * d2 + 2 * d) / 2 + 2, xi + 3 * d1 + 2 * d - 20,
			  ym - 15);

	rectangle((xi + 2 * d1 + 2 * d + xi + 3 * d1 + 2 * d) / 2 + 2,
			  (ym + yi + 2 * d2 + 2 * d) / 2 - 2,
			  ((xi + 2 * d1 + 2 * d + xi + 3 * d1 + 2 * d) / 2 + 2 + xi + 3 * d1 + 2 * d - 20) / 2,
			  ((ym + yi + 2 * d2 + 2 * d) / 2 - 2 + yi + 2 * d2 + 2 * d + 15) / 2);
	rectangle(
		(xi + 2 * d1 + 2 * d + 20 + (xi + 2 * d1 + 2 * d + xi + 3 * d1 + 2 * d) / 2 - 2) / 2,
		(ym + yi + 2 * d2 + 2 * d) / 2 + 2,
		(xi + 2 * d1 + 2 * d + xi + 3 * d1 + 2 * d) / 2 - 2,
		(ym - 15 + (ym + yi + 2 * d2 + 2 * d) / 2 + 2) / 2);
	settextstyle(SMALL_FONT, HORIZ_DIR, 5);
	outtextxy(
		(xi + 2 * d1 + 2 * d + 20 + (xi + 2 * d1 + 2 * d + xi + 3 * d1 + 2 * d) / 2 - 2) / 2 - 2,
		((ym + yi + 2 * d2 + 2 * d) / 2 - 2 + yi + 2 * d2 + 2 * d + 15) / 2 - 7, "M");
	outtextxy(
		((xi + 2 * d1 + 2 * d + xi + 3 * d1 + 2 * d) / 2 + 2 + xi + 3 * d1 + 2 * d - 20) / 2 - 1,
		((ym + yi + 2 * d2 + 2 * d) / 2 + 2 + ym - 15) / 2 - 7, "R");

	//selfdestruct
	setcolor(RED);
	setlinestyle(0, 0, 3);
	for (k = 15; k > 0; k--)
		circle((xi + 3 * d1 + 3 * d + xm) / 2, yi + 2 * d2 + 2 * d + 15 + 2 * k,
			   2);
	circle((xi + 3 * d1 + 3 * d + xm) / 2, ym - 20, 2);

	showmouseptr();
	int chh = 0;

	while (1)
	{
		chh = 0;
		getmousepos(&button, &x, &y);

		if (x > xi && x < xi + d1 && y > yi && y < yi + d2)
			chh = 1;
		if (x > xi + d1 + d && x < xi + 2 * d1 + d && y > yi && y < yi + d2)
			chh = 2;
		if (x > xi + 2 * d1 + 2 * d && x < xi + 3 * d1 + 2 * d && y > yi && y < yi + d2)
			chh = 3;
		if (x > xi + 3 * d1 + 3 * d && x < xm && y > yi && y < yi + d2)
			chh = 4;

		if (x > xi && x < xi + d1 && y > yi + d2 + d && y < yi + 2 * d2 + d)
			chh = 5;
		if (x > xi + d1 + d && x < x + 2 * d1 + d && y > yi + d2 + d && y < yi + 2 * d2 + d)
			chh = 6;
		if (x > xi + 2 * d1 + 2 * d && x < x + 3 * d1 + 2 * d && y > yi + d2 + d && y < yi + 2 * d2 + d)
			chh = 7;
		if (x > xi + 3 * d1 + 3 * d && x < xm && y > yi + d2 + d && y < yi + 2 * d2 + d)
			chh = 8;

		if (x > xi && x < xi + d1 && y > yi + 2 * d2 + 2 * d && y < ym)
			chh = 9;
		if (x > xi + d1 + d && x < x + 2 * d1 + d && y > yi + 2 * d2 + 2 * d && y < ym)
			chh = 10;
		if (x > xi + 2 * d1 + 2 * d && x < xi + 3 * d1 + 2 * d && y > yi + 2 * d2 + 2 * d && y < ym)
			chh = 11;
		if (x > xi + 3 * d1 + 3 * d && x < xm && y > yi + 2 * d2 + 2 * d && y < ym)
			chh = 12;

		if (x > 5 && x < 50 && y > getmaxy() - 50 && y < getmaxy() - 5)
			chh = 13;
		if (x > getmaxx() - 50 && x < getmaxx() - 5 && y > getmaxy() - 50 && y < getmaxy() - 5)
			chh = 14;
		if (x > 5 && x < 50 && y > 5 && y < 50)
			chh = 15;
		if (x > getmaxx() - 50 && x < getmaxx() - 5 && y > 5 && y < 50)
			chh = 16;

		setcolor(CYAN);
		char str[30], str1[30];
		/*
		 settextstyle(GOTHIC_FONT,HORIZ_DIR,4);
		 outtextxy(15,90,"G");outtextxy(15,140,"O");
		 outtextxy(15,190,"U");outtextxy(15,240,"R");
		 outtextxy(15,290,"A");outtextxy(15,340,"V");

		 outtextxy(getmaxx()-35,85,"S");outtextxy(getmaxx()-35,130,"I");
		 outtextxy(getmaxx()-35,175,"D");outtextxy(getmaxx()-35,220,"D");
		 outtextxy(getmaxx()-35,265,"H");outtextxy(getmaxx()-35,310,"A");
		 outtextxy(getmaxx()-35,355,"D");
		 */

		settextstyle(SMALL_FONT, HORIZ_DIR, 5);
		switch (chh)
		{
		case 0:
			setcolor(RED);
			strcpy(str1, str);
			strcpy(str, "");
			outtextxy(getmaxx() / 2 - 40, 18, str1);
			break;

		case 1:
			strcpy(str1, str);
			strcpy(str, "CLOCK");
			if (strcmp(str1, str) != 0)
			{
				setcolor(RED);
				outtextxy(getmaxx() / 2 - 40, 18, str1);
				//        rectangle();
			}
			break;

		case 2:
			strcpy(str1, str);
			strcpy(str, "LAST EXECUTED");
			if (strcmp(str1, str) != 0)
			{
				setcolor(RED);
				outtextxy(getmaxx() / 2 - 40, 18, str1);
			}
			break;

		case 3:
			strcpy(str1, str);
			strcpy(str, "ACTIVATE ALARM");
			if (strcmp(str1, str) != 0)
			{
				setcolor(RED);
				outtextxy(getmaxx() / 2 - 40, 18, str1);
			}
			break;

		case 4:
			strcpy(str1, str);
			strcpy(str, "DEACTIVATE ALARM");
			if (strcmp(str1, str) != 0)
			{
				setcolor(RED);
				outtextxy(getmaxx() / 2 - 40, 18, str1);
			}
			break;

		case 5:
			strcpy(str1, str);
			strcpy(str, "CALENDER");
			if (strcmp(str1, str) != 0)
			{
				setcolor(RED);
				outtextxy(getmaxx() / 2 - 40, 18, str1);
			}
			break;

		case 6:
			strcpy(str1, str);
			strcpy(str, "CALENDER AND CLOCK");
			if (strcmp(str1, str) != 0)
			{
				setcolor(RED);
				outtextxy(getmaxx() / 2 - 40, 18, str1);
			}
			break;

		case 7:
			strcpy(str1, str);
			strcpy(str, "");
			if (strcmp(str1, str) != 0)
			{
				setcolor(RED);
				outtextxy(getmaxx() / 2 - 40, 18, str1);
			}
			break;

		case 8:
			strcpy(str1, str);
			strcpy(str, "");
			if (strcmp(str1, str) != 0)
			{
				setcolor(RED);
				outtextxy(getmaxx() / 2 - 40, 18, str1);
			}
			break;

		case 9:
			strcpy(str1, str);
			strcpy(str, "");
			if (strcmp(str1, str) != 0)
			{
				setcolor(RED);
				outtextxy(getmaxx() / 2 - 40, 18, str1);
			}
			break;

		case 10:
			strcpy(str1, str);
			strcpy(str, "");
			if (strcmp(str1, str) != 0)
			{
				setcolor(RED);
				outtextxy(getmaxx() / 2 - 40, 18, str1);
			}
			break;

		case 11:
			strcpy(str1, str);
			strcpy(str, "MASTER RESET");
			if (strcmp(str1, str) != 0)
			{
				setcolor(RED);
				outtextxy(getmaxx() / 2 - 40, 18, str1);
			}
			break;

		case 12:
			strcpy(str1, str);
			strcpy(str, "SELF DESTRUCT");
			if (strcmp(str1, str) != 0)
			{
				setcolor(RED);
				outtextxy(getmaxx() / 2 - 40, 18, str1);
			}
			break;

		case 13:
			strcpy(str1, str);
			strcpy(str, "START");
			if (strcmp(str1, str) != 0)
			{
				setcolor(RED);
				outtextxy(getmaxx() / 2 - 40, 18, str1);
			}
			break;

		case 14:
			strcpy(str1, str);
			strcpy(str, "BACK");
			if (strcmp(str1, str) != 0)
			{
				setcolor(RED);
				outtextxy(getmaxx() / 2 - 40, 18, str1);
			}
			break;

		case 15:
			strcpy(str1, str);
			strcpy(str, "EXIT");
			if (strcmp(str1, str) != 0)
			{
				setcolor(RED);
				outtextxy(getmaxx() / 2 - 40, 18, str1);
			}
			break;

		case 16:
			strcpy(str1, str);
			strcpy(str, "");
			if (strcmp(str1, str) != 0)
			{
				setcolor(RED);
				outtextxy(getmaxx() / 2 - 40, 18, str1);
			}
			break;

		default:
			setcolor(RED);
			gotoxy(getmaxx() / 2 - 40, 18);
			outtext(str1);
		}
		setcolor(GREEN);
		outtextxy(getmaxx() / 2 - 40, 18, str);
		//rectangle();

		if (button == 1)
		{
			if (x > xi && x < xi + d1 && y > yi && y < yi + d2)
			{
				anim();
				gclock();
			}
			if (x > xi + d1 + d && x < xi + 2 * d1 + d && y > yi && y < yi + d2)
			{
				anim();
				lclock();
			}
			if (x > xi + 2 * d1 + 2 * d && x < xi + 3 * d1 + 2 * d && y > yi && y < yi + d2)
				actalarm();
			if (x > xi + 3 * d1 + 3 * d && x < xm && y > yi && y < yi + d2)
				dactalarm();

			if (x > xi && x < xi + d1 && y > yi + d2 + d && y < yi + 2 * d2 + d)
				exit(0);
			if (x > xi + d1 + d && x < x + 2 * d1 + d && y > yi + d2 + d && y < yi + 2 * d2 + d)
				exit(0);
			if (x > xi + 2 * d1 + 2 * d && x < x + 3 * d1 + 2 * d && y > yi + d2 + d && y < yi + 2 * d2 + d)
				exit(0);
			if (x > xi + 3 * d1 + 3 * d && x < xm && y > yi + d2 + d && y < yi + 2 * d2 + d)
				exit(0);

			if (x > xi && x < xi + d1 && y > yi + 2 * d2 + 2 * d && y < ym)
				exit(0);
			if (x > xi + d1 + d && x < x + 2 * d1 + d && y > yi + 2 * d2 + 2 * d && y < ym)
				exit(0);
			if (x > xi + 2 * d1 + 2 * d && x < xi + 3 * d1 + 2 * d && y > yi + 2 * d2 + 2 * d && y < ym)
				masterreset();
			if (x > xi + 3 * d1 + 3 * d && x < xm && y > yi + 2 * d2 + 2 * d && y < ym)
				selfd();

			if (x > 5 && x < 50 && y > getmaxy() - 50 && y < getmaxy() - 5)
				frontm1();
			if (x > getmaxx() - 50 && x < getmaxx() - 5 && y > getmaxy() - 50 && y < getmaxy() - 5)
				frontm1();
			if (x > 5 && x < 50 && y > 5 && y < 50)
				exit(0);
			if (x > getmaxx() - 50 && x < getmaxx() - 5 && y > 5 && y < 50)
				exit(0);
		}
	}
}

void dispbutton(int n)
{
	int color = 2, x1, x2, y1, y2;
	if (n == 1)
	{
		x1 = 5;
		x2 = 50;
		y1 = getmaxy() - 50;
		y2 = getmaxy() - 5;
	}
	if (n == 2)
	{
		x1 = getmaxx() - 50;
		x2 = getmaxx() - 5;
		y1 = getmaxy() - 50;
		y2 = getmaxy() - 5;
	}
	if (n == 3)
	{
		x1 = 5;
		x2 = 50;
		y1 = 5;
		y2 = 50;
	}
	if (n == 4)
	{
		x1 = getmaxx() - 50;
		x2 = getmaxx() - 5;
		y1 = 5;
		y2 = 50;
		color = 0;
	}
	setlinestyle(0, 0, 3);
	setfillstyle(SOLID_FILL, color);
	bar(x1, y1, x2, y2);
	setcolor(15);
	line(x1, y1, x2, y1);
	line(x1, y1, x1, y2);
	setcolor(8);
	line(x2, y1, x2, y2);
	line(x1, y2, x2, y2);
}

void dispbar(int n)
{
	int color = 4, x1, x2, y1, y2;
	if (n == 1)
	{
		x1 = 70;
		x2 = getmaxx() - 70;
		y1 = getmaxy() - 40;
		y2 = getmaxy() - 10;
	}
	if (n == 2)
	{
		x1 = 70;
		x2 = getmaxx() - 70;
		y1 = 10;
		y2 = 40;
	}
	if (n == 3)
	{
		x1 = 10;
		x2 = 40;
		y1 = 70;
		y2 = getmaxy() - 70;
	}
	if (n == 4)
	{
		x1 = getmaxx() - 40;
		x2 = getmaxx() - 10;
		y1 = 70;
		y2 = getmaxy() - 70;
	}
	setlinestyle(0, 0, 3);
	setfillstyle(SOLID_FILL, color);
	bar(x1, y1, x2, y2);
	setcolor(15);
	line(x1, y1, x2, y1);
	line(x1, y1, x1, y2);
	setcolor(8);
	line(x2, y1, x2, y2);
	line(x1, y2, x2, y2);
}

void dispbut(int n)
{
	float x = xi, y = yi;
	int color = 1, x1, x2, y1, y2;
	if (n == 1)
	{
		x1 = x;
		x2 = x + d1;
		y1 = y;
		y2 = y + d2;
	}
	if (n == 2)
	{
		x1 = x + d1 + d;
		x2 = x + 2 * d1 + d;
		y1 = y;
		y2 = y + d2;
	}
	if (n == 3)
	{
		x1 = x + 2 * d1 + 2 * d;
		x2 = x + 3 * d1 + 2 * d;
		y1 = y;
		y2 = y + d2;
	}
	if (n == 4)
	{
		x1 = x + 3 * d1 + 3 * d;
		x2 = xm;
		y1 = y;
		y2 = y + d2;
	}
	if (n == 5)
	{
		x1 = x;
		x2 = x + d1;
		y1 = y + d2 + d;
		y2 = y + 2 * d2 + d;
	}
	if (n == 6)
	{
		x1 = x + d1 + d;
		x2 = x + 2 * d1 + d;
		y1 = y + d2 + d;
		y2 = y + 2 * d2 + d;
	}
	if (n == 7)
	{
		x1 = x + 2 * d1 + 2 * d;
		x2 = x + 3 * d1 + 2 * d;
		y1 = y + d2 + d;
		y2 = y + 2 * d2 + d;
		color = 0;
	}
	if (n == 8)
	{
		x1 = x + 3 * d1 + 3 * d;
		x2 = xm;
		y1 = y + d2 + d;
		y2 = y + 2 * d2 + d;
		color = 0;
	}
	if (n == 9)
	{
		x1 = x;
		x2 = x + d1;
		y1 = y + 2 * d2 + 2 * d;
		y2 = ym;
		color = 0;
	}
	if (n == 10)
	{
		x1 = x + d1 + d;
		x2 = x + 2 * d1 + d;
		y1 = y + 2 * d2 + 2 * d;
		y2 = ym;
		color = 0;
	}
	if (n == 11)
	{
		x1 = x + 2 * d1 + 2 * d;
		x2 = x + 3 * d1 + 2 * d;
		y1 = y + 2 * d2 + 2 * d;
		y2 = ym;
	}
	if (n == 12)
	{
		x1 = x + 3 * d1 + 3 * d;
		x2 = xm;
		y1 = y + 2 * d2 + 2 * d;
		y2 = ym;
	}
	setlinestyle(0, 0, 3);
	setfillstyle(SOLID_FILL, color);
	bar(x1, y1, x2, y2);
	setcolor(15);
	line(x1, y1, x2, y1);
	line(x1, y1, x1, y2);
	setcolor(8);
	line(x2, y1, x2, y2);
	line(x1, y2, x2, y2);
}

void masterreset()
{
	int left = getmaxx() / 2 - 50, top = getmaxy() / 2, right = getmaxx() / 2 + 50, bot = getmaxy() / 2;

	for (int k = 0; k <= 80; k++)
	{
		hidemouseptr();
		setcolor(0);
		rectangle(left + 1, top + 1, right - 1, bot - 1);
		setcolor(1);
		rectangle(left, top, right, bot);

		left = left - 1;
		top = top - 1;
		right = right + 1;
		bot = bot + 1;
		showmouseptr();
		delay(2);
	}

	hidemouseptr();
	int x1 = left, x2 = right, y1 = top, y2 = bot;

	float dd1 = (x2 - x1) / 2;
	float dd2 = (y2 - y1) / 3;
	setlinestyle(0, 0, 3);

	setfillstyle(SOLID_FILL, BLUE);
	bar(x1, y1, x2, y2);
	setcolor(15);
	line(x1, y1, x2, y1);
	line(x1, y1, x1, y2);
	setcolor(8);
	line(x2, y1, x2, y2);
	line(x1, y2, x2, y2);

	setfillstyle(SOLID_FILL, LIGHTBLUE);
	bar(x1 + 10, y1 + 10, x2 - 10, y1 + 10 + dd2);
	setcolor(15);
	line(x1 + 10, y1 + 10, x2 - 10, y1 + 10);
	line(x1 + 10, y1 + 10, x1 + 10, y1 + dd2 + 10);
	setcolor(8);
	line(x2 - 10, y1 + 10, x2 - 10, y1 + dd2 + 10);
	line(x1 + 10, y1 + dd2 + 10, x2 - 10, y1 + dd2 + 10);

	setfillstyle(SOLID_FILL, GREEN);
	bar(x1 + 10, y1 + 2 * dd2, x1 + dd1 - 5, y2 - 10);
	setcolor(15);
	line(x1 + 10, y1 + 2 * dd2, x1 + dd1 - 5, y1 + 2 * dd2);
	line(x1 + 10, y1 + 2 * dd2, x1 + 10, y2 - 10);
	setcolor(8);
	line(x1 + dd1 - 5, y1 + 2 * dd2, x1 + dd1 - 5, y2 - 10);
	line(x1 + 10, y2 - 10, x1 + dd1 - 5, y2 - 10);

	setfillstyle(SOLID_FILL, RED);
	bar(x1 + dd1 + 5, y1 + 2 * dd2, x2 - 10, y2 - 10);
	setcolor(15);
	line(x1 + dd1 + 5, y1 + 2 * dd2, x2 - 10, y1 + 2 * dd2);
	line(x1 + dd1 + 5, y1 + 2 * dd2, x1 + dd1 + 5, y2 - 10);
	setcolor(8);
	line(x2 - 10, y1 + 2 * dd2, x2 - 10, y2 - 10);
	line(x1 + dd1 + 5, y2 - 10, x2 - 10, y2 - 10);

	settextstyle(SANS_SERIF_FONT, HORIZ_DIR, 1);
	setcolor(YELLOW);
	outtextxy(x1 + 25, (2 * y1 + 20 + dd2) / 2 - 12, "!!! MASTER RESET !!!");

	showmouseptr();
	while (1)
	{
		getmousepos(&button, &x, &y);
		if (button == 1)
		{
			if (x > x1 + 10 && y > y1 + 2 * dd2 && x < x1 + dd1 - 5 && y < y2 - 10)
			{
				ofstream out;
				out.open("alarm.txt", ios::out | ios::trunc);
				out << "0000";
				out.close();
				out.open("clock.txt", ios::out | ios::trunc);
				out << "0000";
				out.close();
				outtextxy(getmaxx() / 2 - 80, getmaxy() / 2 - 6,
						  "MASTER RESET DONE");
				delay(1000);
				frontm2();
			}
			if (x > x1 + dd1 + 5 && y > y1 + 2 * dd2 && x < x2 - 10 && y < y2 - 10)
				frontm1;
		}
	}
}

void main()
{
	clrscr();
	int gd = DETECT, gm = 0;
	initgraph(&gd, &gm, "c:\\tc\\bgi");
	initmouse();
	showmouseptr();
	front();
	getch();
}

void actalarm()
{
	int alhr, almin;
	char al[4];
	outtextxy(getmaxx() / 2 - 10, 30, "_ _._ _ HRS");
	ofstream fout;
	fout.open("alarm.txt", ios::out);
	//fout.seekg(0,ios::beg);
	for (int i = 0; i < 4; i++)
	{
		al[i] = getch();
		fout << al[i];
	}
	fout.close();
	outtextxy(getmaxx() / 2 - 50, getmaxy() / 2, "Your Alarm Time Is Set");
	delay(1000);
	//system();
}

void dactalarm()
{
	int left = getmaxx() / 2 - 50, top = getmaxy() / 2, right = getmaxx() / 2 + 50, bot = getmaxy() / 2;

	for (int k = 0; k <= 80; k++)
	{
		hidemouseptr();
		setcolor(0);
		rectangle(left + 1, top + 1, right - 1, bot - 1);
		setcolor(1);
		rectangle(left, top, right, bot);

		left = left - 1;
		top = top - 1;
		right = right + 1;
		bot = bot + 1;
		showmouseptr();
		delay(2);
	}

	hidemouseptr();
	int x1 = left, x2 = right, y1 = top, y2 = bot;

	float dd1 = (x2 - x1) / 2;
	float dd2 = (y2 - y1) / 3;
	setlinestyle(0, 0, 3);

	setfillstyle(SOLID_FILL, BLUE);
	bar(x1, y1, x2, y2);
	setcolor(15);
	line(x1, y1, x2, y1);
	line(x1, y1, x1, y2);
	setcolor(8);
	line(x2, y1, x2, y2);
	line(x1, y2, x2, y2);

	setfillstyle(SOLID_FILL, LIGHTBLUE);
	bar(x1 + 10, y1 + 10, x2 - 10, y1 + 10 + dd2);
	setcolor(15);
	line(x1 + 10, y1 + 10, x2 - 10, y1 + 10);
	line(x1 + 10, y1 + 10, x1 + 10, y1 + dd2 + 10);
	setcolor(8);
	line(x2 - 10, y1 + 10, x2 - 10, y1 + dd2 + 10);
	line(x1 + 10, y1 + dd2 + 10, x2 - 10, y1 + dd2 + 10);

	setfillstyle(SOLID_FILL, GREEN);
	bar(x1 + 10, y1 + 2 * dd2, x1 + dd1 - 5, y2 - 10);
	setcolor(15);
	line(x1 + 10, y1 + 2 * dd2, x1 + dd1 - 5, y1 + 2 * dd2);
	line(x1 + 10, y1 + 2 * dd2, x1 + 10, y2 - 10);
	setcolor(8);
	line(x1 + dd1 - 5, y1 + 2 * dd2, x1 + dd1 - 5, y2 - 10);
	line(x1 + 10, y2 - 10, x1 + dd1 - 5, y2 - 10);

	setfillstyle(SOLID_FILL, RED);
	bar(x1 + dd1 + 5, y1 + 2 * dd2, x2 - 10, y2 - 10);
	setcolor(15);
	line(x1 + dd1 + 5, y1 + 2 * dd2, x2 - 10, y1 + 2 * dd2);
	line(x1 + dd1 + 5, y1 + 2 * dd2, x1 + dd1 + 5, y2 - 10);
	setcolor(8);
	line(x2 - 10, y1 + 2 * dd2, x2 - 10, y2 - 10);
	line(x1 + dd1 + 5, y2 - 10, x2 - 10, y2 - 10);

	settextstyle(SANS_SERIF_FONT, HORIZ_DIR, 1);
	setcolor(YELLOW);
	outtextxy(x1 + 25, (2 * y1 + 20 + dd2) / 2 - 12,
			  "!!! DEACTIVATE ALARM !!!");

	showmouseptr();

	while (1)
	{
		getmousepos(&button, &x, &y);
		if (button == 1)
		{
			if (x > x1 + dd1 + 5 && y > y1 + 2 * dd2 && x < x2 - 10 && y < y2 - 10)
				frontm2();
			if (x > x1 + 10 && y > y1 + 2 * dd2 && x < x1 + dd1 - 5 && y < y2 - 10)
			{
				ofstream fout;
				fout.open("alarm.txt", ios::out);
				fout << "0000";
				fout.close();
				outtextxy(getmaxx() / 2 - 85, getmaxy() / 2 - 6,
						  "ALARM DEACTIVATED");
				delay(1000);
				frontm2();
			}
		}
	}
}

void gclock()
{
	hidemouseptr();
	cleardevice();
	setbkcolor(9);

	dispbutton(1);
	dispbutton(2);
	dispbutton(3);
	dispbutton(4);

	dispbar(1);
	dispbar(2);
	dispbar(3);
	dispbar(4);

	int time, al;
	ifstream fin;
	fin.open("alarm.txt", ios::beg);
	fin >> al;
	fin.close();

	float ho, mo, so;
	int secang, minang, almin, alhr, h, m, s, x = getmaxx() / 2, y = getmaxy() / 2;

	almin = al % 100;
	alhr = al / 100;
	struct time t;
	struct date d;
	struct REGPACK reg;
	setcolor(GREEN);

	setcolor(RED);
	circle(x, y, 150);
	circle(x, y, 151);
	char ch;

	setfillstyle(SOLID_FILL, RED);

	// exit
	int x1 = 28;
	int y1 = 8;
	setcolor(RED);
	arc(x1, y1 + 20, 160, 380, 10);
	line(x1, y1 + 10, x1, y1 + 22);

	// G
	x1 = 30, y1 = getmaxy() - 28;
	setcolor(RED);
	setlinestyle(0, 0, 3);
	arc(x1, y1, 75, 270, 15);
	arc(x1, y1 + 10, 270, 90, 5);
	arc(x1, y1 - 1, 70, 270, 5);
	line(x1 + 3, y1 - 5, 15, getmaxy() - 13);

	// <-
	settextstyle(TRIPLEX_FONT, HORIZ_DIR, 4);
	outtextxy(getmaxx() - 27, getmaxy() - 47.5, "-");
	outtextxy(getmaxx() - 28, getmaxy() - 47.5, "-");
	line(getmaxx() - 38, getmaxy() - 27, getmaxx() - 27, getmaxy() - 41);
	line(getmaxx() - 38, getmaxy() - 27, getmaxx() - 27, getmaxy() - 15);

	while (!kbhit() || button != 1)
	{
		showmouseptr();

		gettime(&t);
		if (t.ti_min != m)
		{
			setcolor(0);
			line(x, y, x + 130 * cos(minang * (M_PI / 180)),
				 y - 130 * sin(minang * (M_PI / 180)));
			line(x, y, x + 100 * cos(M_PI / 6 * h - ((m / 2) * (M_PI / 180))),
				 y - 100 * sin(M_PI / 6 * h - ((m / 2) * (M_PI / 180))));
		}

		if (t.ti_hour > 12)
			h -= 12;

		if (t.ti_hour < 4)
			h = abs(t.ti_hour - 3);
		else
			h = 15 - t.ti_hour;

		m = t.ti_min;

		if (t.ti_min <= 15)
			minang = (15 - t.ti_min) * 6;
		else
			minang = (75 - t.ti_min) * 6;

		if (t.ti_sec <= 15)
			secang = (15 - t.ti_sec) * 6;
		else
			secang = (75 - t.ti_sec) * 6;

		/*
		 line(x,y,x+90*cos(M_PI/6*h-((m/2)*(M_PI/180))),y-90*sin(M_PI/6*h-((m/2)*(M_PI/180))));
		 line(x,y,x+130*cos(minang*(M_PI/180)),y-130*sin(minang*(M_PI/180)));
		 */

		ho = M_PI / 6 * h - ((m / 2) * (M_PI / 180));
		mo = minang * (M_PI / 180);
		so = secang * (M_PI / 180);

		setcolor(GREEN);
		setlinestyle(0, 0, 3);
		line(x, y, x + 100 * cos(ho), y - 100 * sin(ho));
		setlinestyle(0, 0, 1);
		line(x, y, x + 135 * cos(mo), y - 135 * sin(mo));

		setcolor(15);
		circle(x + 140 * cos(so), y - 140 * sin(so), 2);
		setcolor(0);
		delay(100);

		if (alhr == t.ti_hour)
		{
			if (almin == t.ti_min)
			{
				int left = getmaxx() / 2 - 50, top = getmaxy() / 2, right = getmaxx() / 2 + 50, bot = getmaxy() / 2;
				for (int k = 0; k <= 80; k++)
				{
					setcolor(0);
					rectangle(left + 1, top + 1, right - 1, bot - 1);
					setcolor(1);
					rectangle(left, top, right, bot);
					left = left - 1;
					top = top - 1;
					right = right + 1;
					bot = bot + 1;
					delay(2);
				}

				int x1 = left, x2 = right, y1 = top, y2 = bot;
				float dd1 = (x2 - x1) / 3;
				float dd2 = (y2 - y1) / 4;
				setlinestyle(0, 0, 3);

				setfillstyle(SOLID_FILL, BLUE);
				bar(x1, y1, x2, y2);
				setcolor(15);
				line(x1, y1, x2, y1);
				line(x1, y1, x1, y2);
				setcolor(8);
				line(x2, y1, x2, y2);
				line(x1, y2, x2, y2);

				setfillstyle(SOLID_FILL, RED);
				bar(x1 + 10, y1 + 10, x2 - 10, y1 + dd2 - 5);
				setcolor(15);
				line(x1 + 10, y1 + 10, x2 - 10, y1 + 10);
				line(x1 + 10, y1 + 10, x1 + 10, y1 + dd2 - 5);
				setcolor(8);
				line(x2 - 10, y1 + 10, x2 - 10, y1 + dd2 - 5);
				line(x1 + 10, y1 + dd2 - 5, x2 - 10, y1 + dd2 - 5);

				setfillstyle(SOLID_FILL, LIGHTBLUE);
				bar(x1 + 10, y1 + dd2 + 5, x1 + dd1 - 5, y1 + 3 * dd2 - 5);
				setcolor(15);
				line(x1 + 10, y1 + dd2 + 5, x1 + dd1 - 5, y1 + dd2 + 5);
				line(x1 + 10, y1 + dd2 + 5, x1 + 10, y1 + 3 * dd2 - 5);
				setcolor(8);
				line(x1 + dd1 - 5, y1 + dd2 + 5, x1 + dd1 - 5,
					 y1 + 3 * dd2 - 5);
				line(x1 + 10, y1 + 3 * dd2 - 5, x1 + dd1 - 5, y1 + 3 * dd2 - 5);

				bar(x1 + dd1 + 5, y1 + dd2 + 5, x1 + 2 * dd1 - 5,
					y1 + 3 * dd2 - 5);
				setcolor(15);
				line(x1 + dd1 + 5, y1 + dd2 + 5, x1 + 2 * dd1 - 5,
					 y1 + dd2 + 5);
				line(x1 + dd1 + 5, y1 + dd2 + 5, x1 + dd1 + 5,
					 y1 + 3 * dd2 - 5);
				setcolor(8);
				line(x1 + 2 * dd1 - 5, y1 + dd2 + 5, x1 + 2 * dd1 - 5,
					 y1 + 3 * dd2 - 5);
				line(x1 + dd1 + 5, y1 + 3 * dd2 - 5, x1 + 2 * dd1 - 5,
					 y1 + 3 * dd2 - 5);

				bar(x1 + 2 * dd1 + 5, y1 + dd2 + 5, x2 - 10, y1 + 3 * dd2 - 5);
				setcolor(15);
				line(x1 + 2 * dd1 + 5, y1 + dd2 + 5, x2 - 10, y1 + dd2 + 5);
				line(x1 + 2 * dd1 + 5, y1 + dd2 + 5, x1 + 2 * dd1 + 5,
					 y1 + 3 * dd2 - 5);
				setcolor(8);
				line(x2 - 10, y1 + dd2 + 5, x2 - 10, y1 + 3 * dd2 - 5);
				line(x1 + 2 * dd1 + 5, y1 + 3 * dd2 - 5, x2 - 10,
					 y1 + 3 * dd2 - 5);

				setfillstyle(SOLID_FILL, GREEN);
				bar(x1 + 10, y1 + 3 * dd2 + 5, x2 - 10, y2 - 10);
				setcolor(15);
				line(x1 + 10, y1 + 3 * dd2 + 5, x2 - 10, y1 + 3 * dd2 + 5);
				line(x1 + 10, y1 + 3 * dd2 + 5, x1 + 10, y2 - 10);
				setcolor(8);
				line(x2 - 10, y1 + 3 * dd2 + 5, x2 - 10, y2 - 10);
				line(x1 + 10, y2 - 10, x2 - 10, y2 - 10);

				//snooze alarm
				setlinestyle(0, 0, 3);
				setcolor(15);
				circle((x1 + 10 + x1 + dd1 - 5) / 2, (2 * y1 + 4 * dd2) / 2,
					   20);
				setcolor(10);
				line((x1 + 10 + x1 + dd1 - 5) / 2, (2 * y1 + 4 * dd2) / 2,
					 (x1 + 10 + x1 + dd1 - 5) / 2,
					 (2 * y1 + 4 * dd2) / 2 - 15);
				line((x1 + 10 + x1 + dd1 - 5) / 2, (2 * y1 + 4 * dd2) / 2,
					 (x1 + 10 + x1 + dd1 - 5) / 2 + 15,
					 (2 * y1 + 4 * dd2) / 2);

				setlinestyle(0, 0, 1);
				arc((x1 + 10 + x1 + dd1 - 5) / 2, (2 * y1 + 4 * dd2) / 2, 120,
					150, 23.5);
				arc((x1 + 10 + x1 + dd1 - 5) / 2, (2 * y1 + 4 * dd2) / 2, 120,
					150, 26);

				arc((x1 + 10 + x1 + dd1 - 5) / 2, (2 * y1 + 4 * dd2) / 2, 30,
					60, 23.5);
				arc((x1 + 10 + x1 + dd1 - 5) / 2, (2 * y1 + 4 * dd2) / 2, 30,
					60, 26);

				//change alarm time
				setlinestyle(0, 0, 1);
				setcolor(15);
				circle((2 * x1 + 3 * dd1) / 2, (2 * y1 + 4 * dd2) / 2, 1);

				for (k = 0; k <= 5; k++)
					arc((2 * x1 + 3 * dd1) / 2 - 10, (2 * y1 + 4 * dd2) / 2,
						-60, 60, 5 * k);

				//deactivate alarm
				setlinestyle(0, 0, 1);
				setcolor(15);
				circle((x1 + 2 * dd1 + x2 - 5) / 2, (2 * y1 + 4 * dd2) / 2, 1);

				for (k = 0; k <= 5; k++)
					arc((x1 + 2 * dd1 + x2 - 5) / 2 - 10,
						(2 * y1 + 4 * dd2) / 2, -60, 60, 5 * k);

				setlinestyle(0, 0, 3);
				setcolor(RED);
				line(x2 - 30, y1 + dd2 + 15, x1 + 2 * dd1 + 25,
					 y1 + 3 * dd2 - 15);

				settextstyle(TRIPLEX_FONT, HORIZ_DIR, 1);
				outtextxy((x1 + x2) / 2 - 10, (y1 + 3 * dd2 - 5 + y2) / 2 - 10,
						  "OK");

				while (1)
				{
					getmousepos(&button, &x, &y);
					if (button == 1)
					{
						if (x > x1 + 10 && y > y1 + 3 * dd2 + 5 && x < x2 - 10 && y < y2 - 10)
							gclock();
						if (x > x1 + 10 && y > y1 + dd2 + 5 && x < x1 + dd1 - 5 && y < y1 + 3 * dd2 - 5)
						{
							//increase alarm by 1 minute
							fstream f;
							f.open("alarm.txt", ios::out);
							f >> al;
							f << ++al;
							f.close();
							delay(200);
							gclock();
						}
						if (x > x1 + dd1 + 5 && y > y1 + dd2 + 5 && x > x1 + 2 * dd1 - 5 && y < y1 + 3 * dd2 - 5)
							actalarm();
						if (x > x1 + 2 * dd1 + 5 && y > y1 + dd2 + 5 && x < x2 - 10 && y < y1 + 3 * dd2 - 5)
						{
							ofstream fout;
							fout.open("alarm.txt", ios::out);
							fout << "0000";
							fout.close();
							delay(200);
							gclock();
						}
					}
				}
			}
		}

		circle(x + 140 * cos(so), y - 140 * sin(so), 2);

		setlinestyle(0, 0, 3);
		line(x, y, x + 100 * cos(ho), y - 100 * sin(ho));
		setlinestyle(0, 0, 1);
		line(x, y, x + 135 * cos(mo), y - 135 * sin(mo));

		time = (t.ti_hour * 100) + t.ti_sec;
		ofstream fout;
		fout.open("clock.txt", ios::out);
		fout << time;
		fout.close();
	}
	frontm1();
}

void selfd()
{
	int left = getmaxx() / 2 - 40, top = getmaxy() / 2, right = getmaxx() / 2 + 40, bot = getmaxy() / 2;
	for (int k = 0; k <= 80; k++)
	{
		setcolor(0);
		rectangle(left + 1, top + 1, right - 1, bot - 1);
		setcolor(1);
		rectangle(left, top, right, bot);

		left = left - 1;
		top = top - 1;
		right = right + 1;
		bot = bot + 1;
	}
	int x1 = left, x2 = right, y1 = top, y2 = bot;

	float dd1 = (x2 - x1) / 2;
	float dd2 = (y2 - y1) / 3;
	setfillstyle(SOLID_FILL, BLUE);
	bar(x1, y1, x2, y2);

	setfillstyle(SOLID_FILL, 9);
	bar(x1 + 10, y1 + 10, x2 - 10, y1 + 2 * dd2 - 10);

	setfillstyle(SOLID_FILL, GREEN);
	bar(x1 + 10, y1 + 2 * dd2, x1 + dd1 - 5, y2 - 10);
	setfillstyle(SOLID_FILL, RED);
	bar(x1 + dd1 + 5, y1 + 2 * dd2, x2 - 10, y2 - 10);
	/*	{
	 remove("clock.txt");
	 remove("alarm.txt");
	 remove(_argv[0]);
	 }
	 exit(0);
	 */
}

void lclock()
{
	hidemouseptr();
	cleardevice();
	setbkcolor(9);
	ifstream fin;
	float ho, mo, so;
	int secang, minang, almin, alhr, x = getmaxx() / 2, y = getmaxy() / 2, h, m,
									 time;
	fin.open("clock.txt", ios::in);
	fin >> time;
	fin.close();

	m = time % 100;
	h = time / 100;

	struct time t;
	struct REGPACK reg;

	setcolor(RED);
	circle(x, y, 150);
	circle(x, y, 151);

	if (m == 0 || m == 60)
		h += 1;

	if (h > 12)
		h -= 12;

	if (h < 4)
		h = abs(h - 3);
	else
		h = 15 - h;

	if (m <= 15)
		minang = (15 - m) * 6;
	else
		minang = (75 - m) * 6;

	ho = M_PI / 6 * h - ((m / 2) * (M_PI / 180));
	mo = minang * (M_PI / 180);

	setcolor(GREEN);
	setlinestyle(0, 0, 3);
	line(x, y, x + 100 * cos(ho), y - 100 * sin(ho));
	setlinestyle(0, 0, 1);
	line(x, y, x + 135 * cos(mo), y - 135 * sin(mo));

	while (!kbhit() || button != 1)
	{
		gettime(&t);

		if (t.ti_sec == 0)
		{
			m += 1;
			lclock();
		}

		if (t.ti_sec <= 15)
			secang = (15 - t.ti_sec) * 6;
		else
			secang = (75 - t.ti_sec) * 6;

		/*
		 line(x,y,x+90*cos(M_PI/6*h-((m/2)*(M_PI/180))),y-90*sin(M_PI/6*h-((m/2)*(M_PI/180))));
		 line(x,y,x+130*cos(minang*(M_PI/180)),y-130*sin(minang*(M_PI/180)));
		 */

		so = secang * (M_PI / 180);

		setcolor(YELLOW);
		circle(x + 140 * cos(so), y - 140 * sin(so), 2);
		delay(100);
		setcolor(0);
		circle(x + 140 * cos(so), y - 140 * sin(so), 2);
	}
	frontm1();
}
