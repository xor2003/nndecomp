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

int x, y, button;
char ch;
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

void hidemouseptr()
{
	i.x.ax = 2;
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

void escreen()
{
	clrscr();
	cleardevice();
	rectangle(4, 4, 636, 476);
	rectangle(7, 7, 633, 473);
}

class clock
{
	int i, k;
	char ch, pass[20];

public:
	void password1(void);
	void password2(void);
	void optmain(void);
	void option(void);
	void system(void);
	void masterreset(void);
	void actalarm(void);
	void dactalarm(void);
	void gclock(void);
	void lclock(void);
	void gtimer(void);
	void forgot(void);
	void front(void);
	void selfdestruct(void);
	void contactme(void);
} g;

void clock::password1(void)
{
	int i = 0;
	escreen();
	hidemouseptr();
	setcolor(BLUE);
	outtextxy(getmaxx() / 2 - 50, getmaxy() / 2, "ENTER PASSWORD...");
	showmouseptr();
	while (1)
	{
		ch = getch();
		if (ch == 13)
			front();
		else
		{
			pass[i] = ch;
			i++;
			if (i == 9)
			{
				pass[i] = '\0';
				break;
			}
		}
	}
	if (strcmp(pass, "justopenc") == 0)
	{
		escreen();
		setcolor(GREEN);
		outtextxy(getmaxx() / 2 - 60, getmaxy() / 2, "PASSWORD ACCEPTED");
		delay(800);
		gclock();
	}
	else if (strcmp(pass, "dgourav16") == 0)
	{
		escreen();
		setcolor(GREEN);
		outtextxy(getmaxx() / 2 - 60, getmaxy() / 2, "PASSWORD ACCEPTED");
		delay(800);
		optmain();
	}
	else
	{
		escreen();
		setcolor(RED);
		outtextxy(getmaxx() / 2 - 100, getmaxy() / 2,
				  "INVALID PASSWORD,TRY AGAIN LATER");
		delay(800);
		front();
	}
}

void clock::password2(void)
{
	int i = 0;
	escreen();
	setcolor(BLUE);
	hidemouseptr();
	outtextxy(getmaxx() / 2 - 50, getmaxy() / 2, "ENTER PASSWORD...");
	showmouseptr();
	while (1)
	{
		ch = getch();
		if (ch == 13)
			password2();
		else
		{
			pass[i] = ch;
			i++;
			if (i == 11)
			{
				pass[i] = '\0';
				break;
			}
		}
	}
	if (strcmp(pass, "dgourav1607") == 0)
	{
		escreen();
		masterreset();
	}
	else
	{
		outtextxy(getmaxx() / 2 - 60, getmaxy() / 2,
				  "Sorry...Invalid Password");
		optmain();
	}
}

void clock::option(void)
{
	escreen();
	hidemouseptr();
	int x = getmaxx() / 2, y = getmaxy() / 2;
	outtextxy(x - 5, y - 11, "CLOCK");
	outtextxy(x - 30, y, "LAST EXECUTED");
	outtextxy(x - 30, y + 11, "CONTACT INFO");
	showmouseptr();
	switch (getch())
	{
	case 'c':
	case 'C':
		gclock();
		break;

	case 'l':
	case 'L':
		lclock();
		break;

	case 'i':
	case 'I':
		contactme();
		break;

	case 'e':
	case 'E':
		exit(1);

	case 'b':
	case 'B':
		optmain();
		break;

	default:
		option();
	}
}

void clock::optmain(void)
{
	escreen();
	int x = getmaxx() / 2, y = getmaxy() / 2;
	outtextxy(x - 10, y - 6, "OPTION");
	outtextxy(x - 10, y + 6, "SYSTEM");
	switch (getch())
	{
	case 'o':
	case 'O':
		option();
		break;

	case 's':
	case 'S':
		system();
		break;

	case 'e':
	case 'E':
		exit(1);

	default:
		optmain();
	}
}

void clock::system(void)
{
	escreen();
	int x = getmaxx() / 2, y = getmaxy() / 2;
	outtextxy(x - 20, y - 17, "MASTER RESET");
	outtextxy(x - 20, y - 6, "ACTIVATE ALARM");
	outtextxy(x - 25, y + 6, "DEACTIVATE ALARM");
	outtextxy(x - 20, y + 17, "SELF DESTRUCT");

	switch (getch())
	{
	case 'm':
	case 'M':
		password2();
		break;

	case 'a':
	case 'A':
		actalarm();
		break;

	case 'd':
	case 'D':
		dactalarm();
		break;

	case 's':
	case 'S':
		selfdestruct();
		break;

	case 'e':
	case 'E':
		exit(1);

	case 'b':
	case 'B':
		optmain();
		break;

	default:
		system();
	}
}

void clock::masterreset(void)
{
	escreen();
	ofstream out;
	out.open("alarm.txt", ios::out | ios::trunc);
	out << "0000";
	out.close();
	out.open("clock.txt", ios::out | ios::trunc);
	out << "0000";
	out.close();
	outtextxy(getmaxx() / 2 - 80, getmaxy() / 2, "ALL SETTINGS HAVE RESET");
	delay(1000);
	optmain();
}

void clock::actalarm(void)
{
	int alhr, almin;
	escreen();
	char al[4];
	outtextxy(getmaxx() / 2 - 10, 30, "_ _._ _ HRS");
	ofstream fout;
	fout.open("alarm.txt", ios::out);
	//fout.seekg(0,ios::beg);
	for (i = 0; i < 4; i++)
	{
		al[i] = getch();
		fout << al[i];
	}
	fout.close();
	escreen();
	outtextxy(getmaxx() / 2 - 50, getmaxy() / 2, "Your Alarm Time Is Set");
	delay(1000);
	system();
}

void clock::dactalarm(void)
{
	escreen();
	ofstream fout;
	fout.open("alarm.txt", ios::out);
	fout << "0000";
	fout.close();
	outtextxy(getmaxx() / 2 - 60, getmaxy() / 2, "ALARM DEACTIVATED");
	delay(1000);
	system();
}

void clock::gclock(void)
{
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
	escreen();
	struct REGPACK reg;
	setcolor(GREEN);

	setcolor(RED);
	circle(x, y, 150);
	circle(x, y, 151);
	char ch;
	while (!kbhit())
	{
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
		delay(100);
		setcolor(0);

		if (alhr == t.ti_hour)
		{
			if (almin == t.ti_min)
			{
				while (!kbhit())
					cout << "\a";
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
}

void clock::front(void)
{
	escreen();
	int x = getmaxx() / 2, y = getmaxy() / 2;
	outtextxy(x - 20, y - 6, "Sign In");
	outtextxy(x - 50, y + 6, "Forgot Password");
	switch (getch())
	{
	case 's':
	case 'S':
		password1();
		break;

	case 'f':
	case 'F':
		forgot();
		break;

	case 'e':
	case 'E':
		exit(1);

	default:
		front();
	}
	exit(1);
}

void clock::forgot(void)
{
	escreen();
	int k = 0, i = 0;
	char p1[14], p2[17], p3[14];
	char code[3], ch;
	outtextxy(getmaxx() / 2 - 60, getmaxy() / 2 - 10, "Enter Code (3 Digit)");
	while (1)
	{
		ch = getch();
		if (ch == 13)
		{
			code[i] = '\0';
			forgot();
		}
		else
		{
			code[i] = ch;
			i++;
			if (i == 3)
			{
				code[i] = '\0';
				break;
			}
		}
	}

	if (strcmp(code, "MPT") == 0 || strcmp(code, "mpt") == 0)
	{
		k = 1;
	}
	else
	{
		cout << "Sorry....You Were Wrong";
		delay(1000);
		exit(1);
	}

	if (k == 1)
	{
		i = 0;
		k = 0;
		escreen();
		setcolor(RED);
		outtextxy(getmaxx() / 2 - 60, getmaxy() / 2 - 10, "Enter Programmer1");
		outtextxy(getmaxx() / 2 - 40, getmaxy() / 2 + 10, "Hint : M");

		while (1)
		{
			ch = getch();
			if (ch == 13)
				forgot();
			else
			{
				p1[i] = ch;
				i++;
				if (i == 14)
				{
					p1[i] = '\0';
					break;
				}
			}
		}

		if (strcmp(p1, "42114181114391") == 0)
		{
			i = 0;
			escreen();
			setcolor(BLUE);
			outtextxy(getmaxx() / 2 - 60, getmaxy() / 2 - 10,
					  "Enter Programmer2");
			outtextxy(getmaxx() / 2 - 40, getmaxy() / 2 + 10, "Hint : P");

			while (1)
			{
				ch = getch();
				if (ch == 13)
					forgot();
				else
				{
					p2[i] = ch;
					++i;
					if (i == 17)
					{
						p2[i] = '\0';
						break;
					}
				}
			}

			if (strcmp(p2, "71929173115222511") == 0)
			{
				escreen();
				i = 0;
				setcolor(GREEN);
				outtextxy(getmaxx() / 2 - 60, getmaxy() / 2 - 10,
						  "Enter Programmer3");
				outtextxy(getmaxx() / 2 - 40, getmaxy() / 2 + 10, "Hint : T");

				while (1)
				{
					ch = getch();
					if (ch == 13)
						forgot();
					else
					{
						p3[i] = ch;
						++i;
						if (i == 14)
						{
							p3[i] = '\0';
							break;
						}
					}
				}

				if (strcmp(p3, "23331381912311") == 0)
				{
					k = 1;
				}
				else
					k = 0;
			}
		}
		else
			exit(1);
	}
	if (k == 1)
	{
		escreen();
		outtextxy(30, 30, "Do You Really Want To Print The Passwords.");
		char ch = getch();
		if (ch == 'y')
		{
			fstream fout;
			/* fout.open("pass.txt",ios::out);
			 fout<<"Password To Directly Open The Clock Is \"justopenc\"\n";
			 fout<<"And The Password To Enter Setup Is \"dgourav16\"";
			 fout<<"GOURAV SIDDHAD : gourav1607@gmail.com";
			 fout.close();
			 fout.open("pass.txt",ios::in);
			 ofstream dout;
			 */
			fout.open("PRN", ios::out);
			/*	int ch;
			 while((ch=fout.get())!=0)
			 dout.put(ch);
			 dout.close();
			 fout.open("pass.txt",ios::out|ios::trunc);
			 fout<<"GOURAV SIDDHAD : gourav1607@gmail.com";
			 fout.close();
			 */
			fout << "Password to directly open clock- \"justopenc\"\n";
			fout << "Password to directly open clock- \"dgourav16\"\n";
			fout << "Password to reset master settings- \"dgourav1607\"\n";
			fout << "From_GOURAV SIDDHAD_ tgourav1607@hotmail.com";
			fout.close();
		}
		else
			optmain();
	}
}

void clock::contactme(void)
{
	escreen();
	int x = getmaxx() / 2, y = getmaxy() / 2;
	outtextxy(x - 100, 24, "Created By : GOURAV SIDDHAD");
	outtextxy(x - 110, 36, "E-mail : gourav1607@gmail.com");
	setcolor(GREEN);
	setlinestyle(0, 0, 3);
	arc(x, y, 75, 270, 100);
	arc(x, y + 65, 270, 90, 35);
	arc(x, y - 5, 70, 270, 35);
	line(x + 12, y - 40, 280, 380);
	setcolor(CYAN);
	outtextxy(x + 40, y + 60, "IDDHAD");
	delay(1000);
	getch();
	setlinestyle(0, 0, 1);
	setcolor(GREEN);
	optmain();
}

void clock::selfdestruct(void)
{
	escreen();
	outtextxy(getmaxx() / 2 - 150, getmaxy() / 2,
			  "Do You Really Want To Continue...");
	if (getch() == 'y')
	{
		remove(_argv[0]);
		remove("clock.txt");
		remove("alarm.txt");
	}
	else
		optmain();

	/*
	 int x=getmaxx()/2,y=getmaxy()/2;
	 setcolor(GREEN);
	 setlinestyle(0,0,3);
	 arc(x,y,75,270,100);
	 arc(x,y+65,270,90,35);
	 arc(x,y-5,70,270,35);
	 line(x+12,y-40,280,380);
	 setcolor(CYAN);
	 outtextxy(x+40,y+60,"IDDHAD");
	 */
}

void clock::lclock(void)
{
	escreen();
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

	while (!kbhit())
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
	exit(0);
}

void main()
{
	int gd = DETECT, gm = 0;
	initgraph(&gd, &gm, "c:\\tc\\bgi");
	_setcursortype(_NOCURSOR);
	initmouse();
	showmouseptr();
	clock g;
	g.front();
	exit(0);
}
