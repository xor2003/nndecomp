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

void escreen()
{
	clrscr();
	cleardevice();
	rectangle(5, 5, 635, 475);
	rectangle(10, 10, 630, 470);
}

class clock
{
	int i, option, k;
	char ch, pass[20];

public:
	void password1(void);
	void password2(void);
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
	void gclock(void);
	void gtimer(void);
	void forgot(void);
} ob;

void clock::password1(void)
{
	int i = 0;
	escreen();
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
		escreen();
		setcolor(BLUE);
		outtextxy(getmaxx() / 2 - 60, getmaxy() / 2, "PASSWORD ACCEPTED");
		delay(1000);
		gclock();
	}
	else if (strcmp(pass, "jetaime") == 0)
	{
		escreen();
		setcolor(GREEN);
		outtextxy(getmaxx() / 2 - 60, getmaxy() / 2, "PASSWORD ACCEPTED");
		delay(1000);
		mainopt();
	}
	else
	{
		escreen();
		setcolor(RED);
		outtextxy(getmaxx() / 2 - 100, getmaxy() / 2,
				  "INVALID PASSWORD,TRY AGAIN LATER");
		delay(1000);
		password1();
	}
}

void cload()
{
	int i;
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

void clock::password2(void)
{
	int i = 0;
	escreen();
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

	if (strcmp(pass, "jetaime") == 0)
	{
		optmasterreset();
	}
	else
	{
		mainopt();
	}
}

void clock::optex(void)
{
	escreen();
	int x = getmaxx() / 2, y = getmaxy() / 2;
	outtextxy(x - 30, y - 40, "01.CLOCK");
	outtextxy(x - 60, y - 20, "02.LAST TIME EXECUTION");
	outtextxy(x - 40, y, "03.STOPWATCH");
	outtextxy(x - 30, y + 20, "04.TIMER");
	outtextxy(x - 20, y + 40, "05.EXIT");
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
	mainopt();
}

void clock::mainopt(void)
{
	escreen();
	int x = getmaxx() / 2, y = getmaxy() / 2;
	outtextxy(x - 50, y - 30, "01.EXECTUTION");
	outtextxy(x - 35, y - 10, "02.SYSTEM");
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
		password2();
		break;

	case 4:
		exit(1);

	default:
		mainopt();
	}
}

void clock::optsys(void)
{
	escreen();
	int x = getmaxx() / 2, y = getmaxy() / 2;
	outtextxy(x - 20, y - 20, "01.ALARM");
	outtextxy(x - 50, y, "02.CHANGE OPTIONS");
	outtextxy(x - 20, y + 20, "03.EXIT");
	cin >> option;
	switch (option)
	{
	case 1:
		optsysalarm();

	case 2:
		optsyschange();

	case 3:
		exit(1);

	default:
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
	escreen();
	int hr, min;
	struct time t;
	fstream io;
	io.open("clock.txt", ios::in);
	io >> hr;
	io >> min;
	io.close();
	io.open("clock.txt", ios::out);
	gettime(&t);
	io << t.ti_hour << "\n";
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

void clock::optsysalarm(void)
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
		optsysalarma();
		break;

	case 2:
		optsysalarmd();
		break;

	case 3:
		exit(1);

	default:
		optsys();
	}
}

void clock::optsyschange()
{
	escreen();
	int x = getmaxx() / 2, y = getmaxy() / 2;
	outtextxy(x - 30, y - 20, "01.CHANGE TIME");
	outtextxy(x - 30, y, "02.CHANGE DATE");
	outtextxy(x - 10, y + 20, "03.EXIT");
	cin >> option;
	switch (option)
	{
	case 1:
		optsyschanget();
		break;

	case 2:
		optsyschanged();
		break;

	case 3:
		exit(1);

	default:
		optsys();
	}
}

void clock::optsysalarma(void)
{
	int alhr, almin;
	escreen();
	ofstream out;
	out.open("alarm.txt", ios::out);
	cout << "\nEnter Hour\t";
	cin >> alhr;
	out << alhr << "\n";
	cout << "\nEnter Minutes\t";
	cin >> almin;
	out << almin << "\n";
	out.close();
	escreen();
	outtextxy(getmaxx() / 2 - 50, getmaxy() / 2, "Your Alarm Time Is Set");
	delay(1000);
	optsys();
}

void clock::optsysalarmd(void)
{
	escreen();
	ofstream out;
	out.open("alarm.txt", ios::out);
	out << 0 << "\n";
	out << 0;
	out.close();
	outtextxy(getmaxx() / 2 - 60, getmaxy() / 2, "ALARM DEACTIVATED");
	delay(1000);
	optsys();
}

void clock::optsyschanget(void)
{
	escreen();
	struct time t;
	gettime(&t);
	cleardevice();
	cout << "\nEnter Hour\t";
	cin >> t.ti_hour;
	cout << "\nEnter Minute\t";
	cin >> t.ti_min;
	settime(&t);
	escreen();
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
	cleardevice();
	cout << "\nEnter Year\t";
	cin >> reset.da_year;
	cout << "\nEnter Month\t";
	cin >> reset.da_mon;
	cout << "\nEnter Day\t";
	cin >> reset.da_day;
	setdate(&save_date);
	escreen();
	outtextxy(getmaxx() / 2 - 50, getmaxy() / 2, "DATE IS RESET NOW");
	delay(1000);
	optsyschange();
}

void clock::gtimer(void)
{
	escreen();
	int tperiod;
	cout << "\nEnter Time Period\t";
	cin >> tperiod;
	tperiod = (50 / 31) * tperiod;
	escreen();
	while (i < 620)
	{
		setcolor(BLUE);
		line(10 + i, getmaxy() - 15, 10 + i, getmaxy() - 10);
		delay(tperiod);
	}
	delay(1000);
	while (!kbhit())
	{
		cout << "\a";
	}
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
	struct time t;
	struct date d;
	escreen();
	int h, m, s, tperiod, minang, secang, hrang;
	int r = 300, i;
	// char n[12][3]={"3","2","1","12","11","10","9","8","7","6","5","4"};
	struct REGPACK reg;
	setcolor(BROWN);

	int x = getmaxx() / 2, y = getmaxy() / 2;
	circle(x, y, 183);
	circle(x, y, 184);
	circle(35, 35, 15);
	circle(35, 35, 16);
	circle(35, y - 35, 15);
	circle(35, y - 35, 16);
	circle(x - 35, y - 35, 15);
	circle(x - 35, y - 35, 16);

	setcolor(6);
	settextstyle(5, 0, 1);

	int ang = M_PI / 6 * i;
	x = x - 168 * cos(ang) - 8;
	y = y - 168 * sin(ang) - 16;
	setcolor(YELLOW);

	//for(i=0;i<12;i++)
	//outtextxy(x,y,n[i]);

	gettime(&t);
	getdate(&d);
	gotoxy(getmaxx() - 30, 20);
	printf("%02d:%02d:%02d", d.da_year, d.da_mon, d.da_day);
	gotoxy(getmaxx() - 30, 35);
	printf("%02d:%02d:%02d", t.ti_hour, t.ti_min, t.ti_sec);

	int alhr = 0, almin = 0;
	ifstream in;
	in.open("alarm.txt", ios::in);
	in.seekg(0, ios::beg);
	in >> alhr;
	in >> almin;
	in.close();

	while (1)
	{
		if (kbhit())
			mainopt();
		else
		{
			if (t.ti_min > m)
				gclock();
			gettime(&t);

			if (alhr == t.ti_hour)
			{
				if (almin == t.ti_min)
				{
					while (!kbhit())
						cout << "\a";
				}
			}

			outtextxy(getmaxx() / 2 - 10, getmaxy() / 2 - 40, "GOURAV");
			outtextxy(getmaxx() / 2 - 10, getmaxy() / 2 - 20, "SIDDHAD");
			x = getmaxx() / 2;
			y = getmaxy() / 2;
			setcolor(5);
			setfillstyle(1, 3);
			circle(x, y, 4);
			floodfill(x, y, 5);
			gettime(&t);
			/*    if(t.ti_min!=m)
			 {
			 setcolor(0);
			 line(x,y,x+(r-150)*cos(minang*(M_PI/180)),y-(r-150)*sin(minang*(M_PI/180)));
			 circle(x+(r-200)*cos(minang*(M_PI/180)),y-(r-200)*sin(minang*(M_PI/180)),10);
			 line(x,y,x+(r-165)*cos(M_PI/6*h-((m/2)*(M_PI/180))),y-(r-165)*sin(M_PI/6*h-((m/2)*(M_PI/180))));
			 circle(x+(r-200)*cos(M_PI/6*h-(m/2)*(M_PI/180)),y-(r-200)*sin(M_PI/6*h-(m/2)*(M_PI/180)),10);
			 }
			 */
			if (t.ti_hour > 12)
				t.ti_hour -= 12;

			if (t.ti_hour < 4)
				h = abs(t.ti_hour - 3);
			else
				h = 15 - t.ti_hour;

			m = t.ti_min;

			if (t.ti_min <= 15)
				minang = (15 - t.ti_min) * 6;
			else
				minang = 450 - t.ti_min * 6;

			if (t.ti_sec <= 15)
				secang = (15 - t.ti_sec) * 6;
			else
				secang = 450 - t.ti_sec * 6;

			int xhr = x + (r - 165) * cos(M_PI / 6 * h - ((m / 2) * (M_PI / 180)));
			int yhr = y - (r - 165) * sin(M_PI / 6 * h - ((m / 2) * (M_PI / 180)));
			int xmin = x + (r - 150) * cos(minang * (M_PI / 180));
			int ymin = y - (r - 150) * sin(minang * (M_PI / 180));
			int xsec = x + (r - 145) * cos(secang * (M_PI / 180));
			int ysec = y - (r - 145) * sin(secang * (M_PI / 180));

			x = getmaxx() - 35;
			y = getmaxy() - 35;
			setcolor(15);
			line(x, y, xsec, ysec);
			line(35, 35, xsec, ysec);
			delay(100);
			setcolor(0);
			line(x, y, xsec, ysec);
			line(35, 35, xsec, ysec);

			x = 35;
			y = getmaxy() - 35;
			line(x, y, xmin, ymin);
			line(x, x, xmin, ymin);

			for (i = 0; i <= 3; i++)
				line(35, 35, xhr, yhr);

			circle(xmin, ymin, 2.5);
			for (i = 0; i <= 2; i++)
				circle(xhr, yhr, i);

			m = t.ti_min;
		}
	}
}

void clock::forgot(void)
{
	int k = 0, i = 0;
	long p1, p2, p3;
	char pi[5], ch;
	cout << "Have You Forgot Your Password::\t";
	cin >> ch;
	if (!ch == 'y')
	{
		exit(1);
	}
	else
	{
		escreen();
		outtextxy(getmaxx() / 2 - 60, getmaxy() / 2 - 10,
				  "Enter Code (5 Digit)");
		while (1)
		{
			ch = getch();
			if (ch == 13)
			{
				pi[i] = '\0';
				break;
			}
			else
			{
				pi[i] = ch;
				++i;
			}
		}
		if (strcmp(pi, "M_PT") == 0)
			k = 1;
		else
			cout << "Sorry....You Were Wrong......";

		delay(1000);
		exit(1);
	}

	if (k == 1)
	{
		escreen();
		setcolor(RED);
		outtextxy(getmaxx() / 2 - 60, getmaxy() / 2 - 10, "Enter Programmer1");
		outtextxy(getmaxx() / 2 - 40, getmaxy() / 2 + 10, "Hint : 12 digits");
		cin >> p1;
		if (p1 == 42114181114391)
		{
			setcolor(BLUE);
			outtextxy(getmaxx() / 2 - 60, getmaxy() / 2 - 10,
					  "Enter Programmer2");
			outtextxy(getmaxx() / 2 - 40, getmaxy() / 2 + 10,
					  "Hint : 16 digits");
			cin >> p2;
			if (p2 == 7192917311522211)
			{
				setcolor(GREEN);
				outtextxy(getmaxx() / 2 - 60, getmaxy() / 2 - 10,
						  "Enter Programmer3");
				outtextxy(getmaxx() / 2 - 40, getmaxy() / 2 + 10,
						  "Hint : 14 digits");
				cin >> p3;
				if (p3 == 23331381912311)
				{
					mainopt();
				}
				else
					exit(1);
			}
		}

		void main()
		{
			int option, gd = 0, gm = 0, hr, min, sec, hsec;
			char ch;
			initgraph(&gd, &gm, "c:\\tc\\bgi");
			_setcursortype(_NOCURSOR);
			clock ob;
			do
			{
				ob.password1();
				delay(1000);
				outtextxy(getmaxx() / 2, getmaxy() / 2, "Do You Want To Continue..");
				fflush(stdin);
				ch = getch();
			} while (ch == 'M');
		}
