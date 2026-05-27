/*
 * 	password.h / Clock
 *	Author : Gourav Siddhad
 */

void front() // Main Function To Be Called
{
	int ch = 0;
	display();
	showmouseptr();
	while (1)
	{
		getmousepos(&button, &x, &y);
		if (button == 1)
		{
			if (x > 380 && y > 150 && x < 524 && y < 180)
				ch = 12;
			if (x > 380 && y > 270 && x < 524 && y < 300)
				ch = 13;
			if (x > 25 && x < 75 && y > (getmaxy() - 50) && y < (getmaxy() - 10))
				ch = 7;
			if (x > (getmaxx() - 75) && x < (getmaxx() - 25) && y > (getmaxy() - 50) && y < (getmaxy() - 10))
				ch = 15;
			if (x > (getmaxx() / 2 - 25) && x < (getmaxx() / 2 + 25) && y > (getmaxy() - 50) && y < (getmaxy() - 10))
				ch = 14;
		}
		switch (ch)
		{
		case 12:
			passworda();
			break;
		case 13:
			passwordg();
			break;
		case 7:
			exit(0);
		case 15:
			front();
			break;
		case 14:
			//	contactme();
			break;
		}
	}
}

void dispbutton(int n)
{
	int x1, x2, y1, y2;
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
	}
	if (n == 15)
	{
		x1 = getmaxx() - 75;
		x2 = getmaxx() - 25;
		y1 = getmaxy() - 50;
		y2 = getmaxy() - 10;
	}
	if (n == 14)
	{
		x1 = getmaxx() / 2 - 25;
		x2 = getmaxx() / 2 + 25;
		y1 = getmaxy() - 50;
		y2 = getmaxy() - 10;
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

void display()
{
	setbkcolor(LIGHTBLUE);
	setfillstyle(SOLID_FILL, BLUE);
	bar(0, 0, getmaxx(), 60);

	setcolor(BLUE);
	bar(0, getmaxy() - 60, getmaxx(), getmaxy());
	line(getmaxx() / 2, 130, getmaxx() / 2, getmaxy() - 130);

	dispbutton(12);
	dispbutton(13);
	dispbutton(14);
	dispbutton(15);
	dispbutton(7);

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
}

void main()
{
	clrscr();
	int gd = DETECT, gm = 0;
	initgraph(&gd, &gm, "c:\\tc\\bgi");
	cleardevice();
	initmouse();
	front();
	getch();
}

void passworda()
{
	settextstyle(TRIPLEX_FONT, HORIZ_DIR, 1);
	setcolor(7);
	outtextxy(385, 155, "ADMINISTRATOR");
	gotoxy(385, 155);
	int i = 0;
	char ch, pass[8];
	while (1)
	{
		getmousepos(&button, &x, &y);
		if (button == 1)
		{
			if (x > (getmaxx() - 75) && x < (getmaxx() - 25) && y > (getmaxy() - 50) && y < (getmaxy() - 10))
				front();
		}
		ch = getch();
		if (ch == 13)
			passworda();
		else
		{
			cout << "!";
			pass[i] = ch;
			i++;
			if (i == 8)
			{
				pass[i] = '\0';
				break;
			}
		}
	}
	if (strcmp(pass, "dgourav16") == 0)
		exit(0);
	else
		front();
}

void passwordg()
{
	int i = 0;
	settextstyle(TRIPLEX_FONT, HORIZ_DIR, 1);
	setcolor(7);
	outtextxy(424, 275, "GUEST");
	gotoxy(424, 275);
	char ch, pass[8];
	while (1)
	{
		ch = getch();
		if (ch == 13)
			passwordg();
		else
		{
			cout << "!";
			pass[i] = ch;
			i++;
			if (i == 8)
			{
				pass[i] = '\0';
				break;
			}
		}
	}
	if (strcmp(pass, "justopenc") == 0)
		exit(0);
	else
		front();
}
