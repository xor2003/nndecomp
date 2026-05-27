#include <iostream.h>
#include <conio.h>
#include <fstream.h>
#include <stdlib.h>
#include <dos.h>
#include <string.h>
#include <stdio.h>
#include <process.h>
#include <graphics.h>
#include <math.h>

class clock
{
	int i, option, k;
	char ch, pass[20];

public:
	void password1(void);
	void password2(void);
	void password3(void);
	void mainopt(void);
	void optex(void);
	void optsys(void);
	void optmasterreset(void);
	void optexlasttimeex(void);
	void optexstopwatch(void);
	void optsysalarm(void);
	void optsyschange(void);
	void optsysalarma(void);
	void optsysalarmd(void);
	void optsyschanget(void);
	void optsyschanged(void);
	void cload(void);
	void gclock(void);
	void gtimer(void);
};

void clock::password1(void)
{
	clrscr();
	cleardevice();
	rectangle(5, 5, 635, 475);
	rectangle(10, 10, 630, 470);
	setcolor(GREEN);
	outtextxy(20, 20, "ENTER PASSWORD...");
	while (1)
	{
		ch = getch();
		if (ch == 13)
		{
			pass[i] = '\0';
			break;
		}
		else
		{
			pass[i] = ch;
			i++;
		}
	}

	if (strcmp(pass, "justopen") == 0)
	{
		clrscr();
		cleardevice();
		rectangle(5, 5, 635, 475);
		rectangle(10, 10, 630, 470);

		setcolor(BLUE);
		outtextxy(getmaxx() / 2 - 60, getmaxy() / 2, "PASSWORD ACCEPTED");
		delay(1000);
		gclock();
	}
	else if (strcmp(pass, "jetaime") == 0)
	{
		clrscr();
		cleardevice();
		rectangle(5, 5, 635, 475);
		rectangle(10, 10, 630, 470);
		setcolor(GREEN);
		outtextxy(getmaxx() / 2 - 60, getmaxy() / 2, "PASSWORD ACCEPTED");
		delay(1000);
		mainopt();
	}
	else
	{
		clrscr();
		cleardevice();
		rectangle(5, 5, 635, 475);
		rectangle(10, 10, 630, 470);

		setcolor(RED);
		outtextxy(getmaxx() / 2 - 100, getmaxy() / 2,
				  "INVALID PASSWORD, TRY AGAIN LATER");
		delay(1000);
		password2();
	}
}

void clock::password2(void)
{
	setcolor(BROWN);
	outtextxy(20, 20, "ENTER PASSWORD...");
	while (1)
	{
		ch = getch();
		if (ch == 13)
		{
			pass[i] = '\0';
			break;
		}
		else
		{
			pass[i] = ch;
			i++;
		}
	}

	if (strcmp(pass, "justopen") == 0)
	{
		clrscr();
		cleardevice();
		rectangle(5, 5, 635, 475);
		rectangle(10, 10, 630, 470);

		setcolor(BLUE);
		outtextxy(getmaxx() / 2 - 60, getmaxy() / 2, "PASSWORD ACCEPTED");
		delay(1000);
		gclock();
	}
	else
	{
		exit(1);
	}
}

void clock::password3(void)
{
	clrscr();
	cleardevice();
	rectangle(5, 5, 635, 475);
	rectangle(10, 10, 630, 470);

	outtextxy(20, 20, "ENTER PASSWORD...");
	while (1)
	{
		ch = getch();
		if (ch == 13)
		{
			pass[i] = '\0';
			break;
		}
		else
		{
			pass[i] = ch;
			i++;
		}
	}

	if (strcmp(pass, "jetaime") == 0)
	{
		optmasterreset();
	}
	else
	{
		mainopt();
	}
}

void clock::mainopt(void)
{
	clrscr();
	cleardevice();
	rectangle(5, 5, 635, 475);
	rectangle(10, 10, 630, 470);

	int x = getmaxx() / 2, y = getmaxy() / 2;
	outtextxy(x - 50, y - 30, "01.EXECTUTION");
	outtextxy(x - 40, y - 10, "02.SYSTEM");
	outtextxy(x - 50, y + 10, "03.MASTER RESET");
	outtextxy(x - 30, y + 30, "04.EXIT");
	cin >> option;
	switch (option)
	{
	case 1:
		optex();
		break;

	case 2:
		optsys();
		break;

	case 3:
		password3();
		break;

	case 4:
		exit(1);

	default:
		mainopt();
	}
}

void clock::optex(void)
{
	escreen();
	int x = getmaxx() / 2, y = getmaxy() / 2;
	outtextxy(x - 30, y - 30, "01.CLOCK");
	outtextxy(x - 60, y - 10, "02.LAST TIME EXECUTION");
	outtextxy(x - 40, y + 10, "03.STOPWATCH");
	outtextxy(x - 30, y + 30, "04.TIMER");
	outtextxy(x - 20, y + 50, "05.EXIT");
	cin >> option;
	switch (option)
	{
	case 1:
		gclock();
		break;

	case 2:
		optexlasttimeex();
		break;

	case 3:
		optexstopwatch();
		break;

	case 4:
		exit(1);

	default:
		mainopt();
	}
}

void clock::optsys(void)
{
	clrscr();
	cleardevice();
	rectangle(5, 5, 635, 475);
	rectangle(10, 10, 630, 470);
	int x = getmaxx() / 2, y = getmaxy() / 2;
	outtextxy(x - 20, y - 20, "01.ALARM");
	outtextxy(x - 50, y, "02.CHANGE OPTIONS");
	outtextxy(x - 20, y + 20, "03.EXIT");
	cin >> option;
	switch (option)
	{
	case 1:
		escreen();
		optsysalarm();
		break;

	case 2:
		escreen();
		optsyschange();
		break;

	case 3:
		exit(1);
		break;

	default:
		escreen();
		mainopt();
	}
}

void clock::optmasterreset(void)
{
	escreen();
	ofstream out;
	out.open("alarm.txt", ios::out | ios::trunc);
	out.close();
	out.open("clock.txt", ios::out | ios::trunc);
	out.close();

	outtextxy(getmaxx() / 2 - 80, getmaxy() / 2, "ALL SETTINGS HAVE RESET");
	delay(1500);
	mainopt();
}

void clock::optexlasttimeex(void)
{
	int hr, min;
	struct time t;
	fstream io;
	io.open("clock.txt", ios::in);
	io >> hr;
	io >> min;
	io.close();
	io.open("clock.txt", ios::out);
	gettime(&t);
	io << t.ti_hour;
	io << t.ti_min;
	t.ti_hour = hr;
	t.ti_min = min;
	settime(&t);
	io.close();
	if (k == 0)
	{
		k = 1;
		gclock();
	}
}

void optsysalarm()
{
	escreen();
	int x = getmaxx() / 2, y = getmaxy() / 2;
	int option;
	outtextxy(x - 40, y - 20, "01.ACTIVATE");
	outtextxy(x - 50, y, "02.DEACTIVATE");
	outtextxy(x - 30, y + 20, "03.EXIT");
	cin >> option;
	switch (option)
	{
	case 1:
		escreen();
		optsysalarma();
		break;

	case 2:
		escreen();
		optsysalarmd();
		break;

	case 3:
		exit(1);
		break;

	default:
		escreen();
		optsys();
	}
}

void clock::optsyschange()
{
	escreen();
	int x = getmaxx() / 2, y = getmaxy() / 2;
	outtextxy(x, y, "01.CHANGE TIME");
	outtextxy(x, y, "02.CHANGE DATE");
	outtextxy(x, y, "03.EXIT");
	cin >> option;
	switch (option)
	{
	case 1:
		escreen();
		optsyschanget();
		break;

	case 2:
		escreen();
		optsyschanged();
		break;

	case 3:
		exit(1);
		break;

	default:
		escreen();
		optsys();
	}
}

void clock::optsysalarmd(void)
{
	escreen();
	ofstream out;
	out.open("alarm.txt", ios::out);
	out << 0 << "\n";
	out << 0;
	out.close();
	outtextxy(getmaxx() / 2 - 60, getmaxy() / 2, "ALARM DACTIVATED");
	delay(1000);
	optsys();
}

void clock::optsyschanget(void)
{
	escreen();
	struct time t;
	gettime(&t);
	cout << "\nEnter Hour\t";
	cin >> t.ti_hour;
	cout << "\nEnter Minute\t";
	cin >> t.ti_min;
	cout << "\nEnter Second\t";
	cin >> t.ti_sec;
	settime(&t);

	outtextxy(getmaxx() / 2 - 50, getmaxy() / 2, "TIME IS RESET NOW");
	delay(1000);
	optsyschange();
}

void clock::optsyschanged(void)
{
	escreen();
	struct date reset;
	struct date save_date;
	getdate(&save_date);

	cout << "\nEnter Year\t";
	cin >> reset.da_year;
	cout << "\nEnter Month\t";
	cin >> reset.da_mon;
	cout << "\nEnter Day\t";
	cin >> reset.da_day;

	setdate(&save_date);
	outtextxy(getmaxx() / 2 - 50, getmaxy() / 2, "DATE IS RESET NOW");
	delay(1000);
	optsyschange();
}

void clock::cload(void)
{
	escreen();
	setcolor(GREEN);
	outtextxy(getmaxx() / 2 - 40, getmaxy() / 2, "LOADING...");
	while (i < 620)
	{
		setcolor(YELLOW);
		line(10 + i, getmaxy() - 15, 10 + i, getmaxy() - 12);
		++i;
		delay(4);
	}
	escreen();
	setcolor(GREEN);
	outtextxy(getmaxx() / 2 - 35, getmaxy() / 2, "LOADED");
	while (i < 620)
	{
		setcolor(YELLOW);
		line(10 + i, getmaxy() - 15, 10 + i, getmaxy() - 12);
		++i;
	}
	delay(1000);
}

void clock::gtimer(void)
{
	escreen();
	int tperiod;
	cout << "\nEnter Time Period\t";
	cin >> tperiod;
	tperiod = (50 / 31) * tperiod;
	while (i < 620)
	{
		setcolor(BLUE);
		line(10 + i, getmaxy() - 15, 10 + i, getmaxy() - 10);
		delay(tperiod);
	}
	delay(1000);
	cout << "\a\a";
	delay(100);
	optex();
}

void clock::optexstopwatch(void)
{
	int hr, sec, min, hsec;
	escreen();
	outtextxy(20, 20, "Press Any Key To Continue...");
	getch();
	i = 0;
	while (!kbhit())
	{
		delay(100);
		escreen();
		gotoxy(getmaxx() / 2 - 30, getmaxy() / 2);
		printf("%2d : %02d : %02d : %02d.", hr, min, sec, hsec);
		if (i >= 60)
		{
			i -= 60;
			sec -= 1;
			if (sec >= 60)
			{
				sec -= 60;
				min += 1;
				if (min >= 60)
				{
					hr += 1;
				}
			}
		}
		++i;
	}
}

void clock::gclock(void)
{
	{
		int h, m, s, tperiod, minang, secang, hrang;
		int x = getmaxx() / 2, y = getmaxy() / 2, r = 300, i;
		char n[12][3] = {"3", "2", "1", "12", "11", "10", "9", "8", "7", "6",
						 "5", "4"};
		struct REFGPACK reg;
		struct time t;
		setcolor(15);
		circle(x, y, 183);
		circle(x, y, 184);
		setcolor(6);
		settextstyle(5, 0, 1);
		for (i = 0; i < 12; ++i)
		{
			if (i != 3)
				outtextxy(x + (r - 132) * cos(M_PI / 6 * i) - 8,
						  y - (r - 132) * sin(M_PI / 6 * i) - 16, n[i]);
			else
				outtextxy(x + (r - 132) * cos(M_PI / 6 * i) - 10,
						  y - (r - 132) * sin(M_PI / 6 * i) - 16, n[i]);
		}

		gettime(&t);
		printf("\n\t");
		printf("%02d:%02d:%02d", t.ti_hour, t.ti_min, t.ti_sec);

		while (!kbhit())
		{
			setcolor(5);
			setfillstyle(1, 3);
			circle(x, y, 4);
			floodfill(x, y, 5);
			gettime(&t);
			if (t.ti_min != m)
			{
				setcolor(10);
				line(x, y, x + (r - 150) * cos(minang * (M_PI / 180)),
					 y - (r - 150) * sin(minang * (M_PI / 180)));
				circle(x + (r - 200) * cos(minang * (M_PI / 180)),
					   y - (r - 200) * sin(minang * (M_PI / 180)), 10);

				line(x, y,
					 x + (r - 165) * cos(
										 M_PI / 6 * h - ((m / 2) * (M_PI / 180))),
					 y - (r - 165) * sin(
										 M_PI / 6 * h - ((m / 2) * (M_PI / 180))));
				circle(
					x + (r - 200) * cos(
										M_PI / 6 * h - (m / 2) * (M_PI / 180)),
					y - (r - 200) * sin(
										M_PI / 6 * h - (m / 2) * (M_PI / 180)),
					10);
			}
		}
	}
}

void main()
{
	int option;
	int gd = 0, gm = 0, hr, min, sec, hsec;
	_setcursortype(_NOCURSOR);
	initgraph(&gd, &gm, "c:\\tc\\bgi");
	clock ob;
	ob.password1();
	getch();
}
