#include "fd.h"

/*
 AKRITI	0
 SPACE 	1
 ROCK	2
 LASER	3
 DEST 	5
 */

void newgame();
void gamestart();
void gamepause(level);
void savegame(level);
void opengame();
void instructions();
void highscore();
void gameover();

class hscore
{
public:
	char name[22];
	int score;
	int lno;
	void getinfo(int l, int sc)
	{
		int col = getcolor();

		lno = l;
		score = sc;

		settextstyle(TRIPLEX_FONT, HORIZ_DIR, 4);
		setcolor(YELLOW);
		box(getmaxx() / 2 - 150, getmaxy() / 2 - 150, getmaxx() / 2 + 150,
			getmaxy() / 2 + 150, 0);
		outtextxy(getmaxx() / 2, getmaxy() / 2 - 100, "Congratulations!!!");

		setcolor(RED);
		settextstyle(SMALL_FONT, HORIZ_DIR, 4);
		outtextxy(getmaxx() / 2, getmaxy() / 2 - 50, "U scOrEd d hIghEst");

		setcolor(LIGHTGRAY);
		settextstyle(TRIPLEX_FONT, HORIZ_DIR, 3);
		outtextxy(getmaxx() / 2, getmaxy() / 2, "plEAsE EntEr Ur nAmE");

		char ch, na[20];
		int f = 0;
		na[0] = '\0';
		while (1)
		{
			ch = getch();
			if (ch == 8)
			{
				setcolor(0);
				outtextxy(getmaxx() / 2, getmaxy() / 2 + 50, na);
				if (f > 0)
					f--;
				na[f] = '\0';
				setcolor(BLUE);
				outtextxy(getmaxx() / 2, getmaxy() / 2 + 50, na);
			}
			else if (ch == 13 || f == 20)
				break;
			else
			{
				setcolor(0);
				outtextxy(getmaxx() / 2, getmaxy() / 2 + 50, na);
				na[f] = ch;
				na[++f] = '\0';
				setcolor(BLUE);
				outtextxy(getmaxx() / 2, getmaxy() / 2 + 50, na);
			}
		}
		strcpy(name, na);
		setcolor(col);
	}
};

/*
 up 72
 left 75
 right 77
 down 80
 */

void newgame()
{
	level l;

	ifstream ifile("y:\\level.dat", ios::binary);

	while (ifile.read((char *)&l, sizeof(l)))
	{
		homedraw(l);
		play(l);
	}

	ifile.close();
	gamestart();
}

void instructions()
{
	int col = getcolor();
	box(50, 50, getmaxx() - 50, getmaxy() - 50, 0);

	settextstyle(TRIPLEX_FONT, HORIZ_DIR, 5);
	setcolor(YELLOW);
	outtextxy(getmaxx() / 2, 100, "INSTRUCTIONS");

	akriti(90, 200);
	akriti(90, 250);
	akriti(90, 312);
	akriti(90, 387);

	settextstyle(TRIPLEX_FONT, HORIZ_DIR, 2);
	settextjustify(LEFT_TEXT, CENTER_TEXT);

	setcolor(BLUE);
	outtextxy(120, 200, "Reach!!....... yOUr dEstInAtIOn!");

	setcolor(DARKGRAY);
	outtextxy(120, 250, "Use!	               kEys 2 mOvE!");

	setcolor(MAGENTA);
	outtextxy(120, 300, "Only An ObstAclE cAn hElp yOU chAngE");
	outtextxy(120, 325, "Ur dIrEctIOn");

	setcolor(GREEN);
	outtextxy(120, 375, "bEwArE Of lAsErs");
	setcolor(RED);
	outtextxy(120, 400, "They'll kill you...........");

	setcolor(BROWN);

	line(180, 250, 190, 250);
	line(180, 250, 185, 245);
	line(180, 250, 185, 255);

	line(215, 245, 215, 255);
	line(215, 245, 210, 250);
	line(215, 245, 220, 250);

	line(245, 245, 245, 255);
	line(245, 255, 240, 250);
	line(245, 255, 250, 250);

	line(270, 250, 280, 250);
	line(275, 245, 280, 250);
	line(275, 255, 280, 250);

	setcolor(col);

	getch();
	cleardevice();
	gamestart();
}

void highscore()
{
	int col = getcolor();
	hscore h;

	box(100, 100, getmaxx() - 100, getmaxy() - 100, 0);
	settextstyle(DEFAULT_FONT, HORIZ_DIR, 1);
	int xx = getmaxx() / 2 - 140, yy = 140;
	char str[3];

	setcolor(YELLOW);
	outtextxy(getmaxx() / 2, 120, "NAME                   LEVEL   NO OF MOVES");
	ifstream ifile("y:\\hscore.dat", ios::binary);

	setcolor(RED);
	while (ifile.read((char *)&h, sizeof(h)))
	{
		outtextxy(xx, yy, h.name);
		inttostr(h.lno, str);
		outtextxy(xx + 180, yy, str);
		inttostr(h.score, str);
		outtextxy(xx + 260, yy, str);
		yy += 20;
	}

	ifile.close();

	getch();
	setcolor(col);
	cleardevice();
	gamestart();
}

void opengame()
{
	int leveln, x, y, lno;
	level l;

	ifstream ifile("y:\\slevel.dat");
	ifile.read((char *)&l, sizeof(l));
	l.getdata(&leveln, &x, &y);
	ifile.close();

	ifile.open("y:\\level.dat");

	while (ifile.read((char *)&l, sizeof(l)))
	{
		l.getdata(&lno, &x, &y);
		if (lno >= leveln)
		{
			homedraw(l);
			play(l);
		}
	}

	ifile.close();
	gamestart();
}

void savegame(level l)
{
	ofstream ofile;
	ofile.open("y:\\slevel.dat", ios::binary);
	ofile.write((char *)&l, sizeof(l));
	ofile.close();
}

void gamepause(level l)
{
	box(50, 50, getmaxx() / 2 - 40 - 1, getmaxy() - 50, BLACK);
	box(getmaxx() / 2 - 40 + 1, 50, getmaxx() - 50, getmaxy() - 50, BLACK);

	int cor[][2] = {getmaxx() / 4, 225, getmaxx() / 4, 275};

	settextstyle(SANS_SERIF_FONT, HORIZ_DIR, 4);
	settextjustify(1, 1);

	char mitem[][10] = {
		"Resume",
		"Main Menu",
	};

	settextstyle(SANS_SERIF_FONT, HORIZ_DIR, 4);
	outtextxy(cor[0][0], cor[0][1], mitem[0]);
	outtextxy(cor[1][0], cor[1][1], mitem[1]);

	int cur = 0;

	box(cor[cur][0] - 80, cor[cur][1] - 15, cor[cur][0] + 80, cor[cur][1] + 25,
		GREEN);
	outtextxy(cor[0][0], cor[0][1], mitem[cur]);

	int ch;
	while (1)
	{
		ch = getch();
		setfillstyle(SOLID_FILL, 0);
		bar(cor[cur][0] - 80, cor[cur][1] - 15, cor[cur][0] + 80,
			cor[cur][1] + 25);
		outtextxy(cor[cur][0], cor[cur][1], mitem[cur]);
		switch (ch)
		{
		case 72:
			cur = 0;
			break;
		case 80:
			cur = 1;
			break;
		case 13:
			switch (cur)
			{
			case 0:
				cleardevice();
				homedraw(l);
				play(l);
				break;
			case 1:
				savegame(l);
				gamestart();
			}
			break;
		}
		if (ch != 13)
		{
			box(cor[cur][0] - 80, cor[cur][1] - 15, cor[cur][0] + 80,
				cor[cur][1] + 25, GREEN);
			outtextxy(cor[cur][0], cor[cur][1], mitem[cur]);
		}
	}
}

void play(level l)
{
	int ch;
	int lno, a1, a2;
	int count = 0;
	l.getdata(&lno, &a1, &a2);

	while (1)
	{
		ch = getch();
		switch (ch)
		{
		case 27:
			gamepause(l);
			break;
		case 72:
			while (l.map[a1 - 1][a2] != 2 && l.map[a1][a2] != 5 && a1 >= 1 && l.map[a1][a2] != 3)
			{

				delay(20);
				box(20 + 30 * a2 - d + 1, 40 + 30 * a1 - d + 1,
					20 + 30 * a2 + d - 1, 40 + 30 * a1 + d - 1, 0);
				a1--;
				akriti(20 + 30 * a2, 40 + 30 * a1);
			}
			akriti(20 + 30 * a2, 40 + 30 * a1);
			count++;
			break;
		case 75:
			while (l.map[a1][a2 - 1] != 2 && l.map[a1][a2] != 5 && a2 >= 1 && l.map[a1][a2] != 3)
			{

				delay(20);
				box(20 + 30 * a2 - d + 1, 40 + 30 * a1 - d + 1,
					20 + 30 * a2 + d - 1, 40 + 30 * a1 + d - 1, 0);
				a2--;
				akriti(20 + 30 * a2, 40 + 30 * a1);
			}
			akriti(20 + 30 * a2, 40 + 30 * a1);
			count++;
			break;
		case 77:
			while (l.map[a1][a2 + 1] != 2 && l.map[a1][a2] != 5 && a2 < 20 && l.map[a1][a2] != 3)
			{

				delay(20);
				box(20 + 30 * a2 - d + 1, 40 + 30 * a1 - d + 1,
					20 + 30 * a2 + d - 1, 40 + 30 * a1 + d - 1, 0);
				a2++;
				akriti(20 + 30 * a2, 40 + 30 * a1);
			}
			akriti(20 + 30 * a2, 40 + 30 * a1);
			count++;
			break;
		case 80:
			while (l.map[a1 + 1][a2] != 2 && l.map[a1][a2] != 5 && a1 < 14 && l.map[a1][a2] != 3)
			{
				delay(20);
				box(20 + 30 * a2 - d + 1, 40 + 30 * a1 - d + 1,
					20 + 30 * a2 + d - 1, 40 + 30 * a1 + d - 1, 0);
				a1++;
				akriti(20 + 30 * a2, 40 + 30 * a1);
			}
			akriti(20 + 30 * a2, 40 + 30 * a1);
			count++;
			break;
		}
		if (l.map[a1][a2] == 3)
		{
			int col = getcolor();
			setcolor(RED);
			akriti(20 + 30 * a2, 40 + 30 * a1, 1);
			line(20 + 30 * a2, 40 + 30 * a1 - d + 1, 20 + 30 * a2,
				 40 + 30 * a1 + d - 1);
			delay(900);
			gameover();
			setcolor(col);
			gamestart();
		}
		if (l.map[a1][a2] == 5)
		{
			char str[10];
			inttostr(count, str);

			setcolor(RED);
			settextstyle(TRIPLEX_FONT, HORIZ_DIR, 3);

			box(getmaxx() / 2 - 100, getmaxy() / 2 - 100, getmaxx() / 2 + 100,
				getmaxy() / 2 + 100, 0);

			outtextxy(getmaxx() / 2, getmaxy() / 2 - 30, "MISSION");
			outtextxy(getmaxx() / 2, getmaxy() / 2, "ACCOMPLISHED");

			outtextxy(getmaxx() / 2, getmaxy() / 2 + 30, "nO Of mOvEs   ");
			outtextxy(getmaxx() / 2 + 80, getmaxy() / 2 + 30, str);

			delay(1000);

			hscore h;

			ofstream ofile("y:\\temp.dat", ios::binary);

			int flag = 0;
			ifstream file("y:\\hscore.dat", ios::binary);
			while (file.read((char *)&h, sizeof(h)))
			{
				int x, y, lno;
				l.getdata(&lno, &x, &y);
				if (h.lno == lno)
				{
					if (count < h.score)
						h.getinfo(lno, count);
					flag = 1;
				}
				ofile.write((char *)&h, sizeof(h));
			}
			if (flag == 0)
			{
				h.getinfo(lno, count);
				ofile.write((char *)&h, sizeof(h));
			}

			file.close();
			ofile.close();

			remove("y:\\hscore.dat");
			rename("y:\\temp.dat", "y:\\hscore.dat");

			break;
		}
		if (a1 == 0 || a1 == 14 || a2 == 0 || a2 == 20)
		{
			gameover();
			gamestart();
		}
		if (l.map[a1][a2] == 4)
		{
			akriti(20 + a2 * 30, 40 + a1 * 30);
			delay(500);
			gameover();
			gamestart();
		}
	}
}

void gameover()
{
	box(getmaxx() / 2 - 100, getmaxy() / 2 - 60, getmaxx() / 2 + 100,
		getmaxy() / 2 + 60, BLACK);
	//aclock(getmaxx()/2-40,getmaxy()/2,40);
	outtextxy(getmaxx() / 2 + 40, getmaxy() / 2 - 10, "GaMe");
	outtextxy(getmaxx() / 2 + 40, getmaxy() / 2 + 10, "oVeR");
	delay(1000);
}

void gamestart()
{
	cleardevice();
	box(0, 0, getmaxx(), getmaxy(), YELLOW);
	box(7, 7, getmaxx() - 7, getmaxy() - 7, BLACK);

	setcolor(LIGHTGRAY);
	settextjustify(CENTER_TEXT, CENTER_TEXT);
	settextstyle(GOTHIC_FONT, HORIZ_DIR, 10);

	outtextxy(getmaxx() / 2, 100, "Destination");
	outtextxy(getmaxx() / 2 + 1, 100, "Destination");
	outtextxy(getmaxx() / 2 - 1, 100, "Destination");
	outtextxy(getmaxx() / 2, 100 - 1, "Destination");
	outtextxy(getmaxx() / 2, 100 + 1, "Destination");

	settextstyle(GOTHIC_FONT, HORIZ_DIR, 6);
	outtextxy(getmaxx() / 2, 45, "Final");
	outtextxy(getmaxx() / 2 + 1, 45, "Final");

	setlinestyle(0, 0, 1);

	int cor[][2] = {
		getmaxx() / 2,
		200,
		getmaxx() / 2,
		250,
		getmaxx() / 2,
		300,
		getmaxx() / 2,
		350,
		getmaxx() / 2,
		400,
	};

	char mitem[][13] = {"NEW GAME", "SAVED GAME", "INSTRUCTIONS", "HIGH SCORE",
						"EXIT"};

	setcolor(RED);
	settextstyle(SANS_SERIF_FONT, HORIZ_DIR, 4);
	outtextxy(cor[0][0], cor[0][1], mitem[0]);
	outtextxy(cor[1][0], cor[1][1], mitem[1]);
	outtextxy(cor[2][0], cor[2][1], mitem[2]);
	outtextxy(cor[3][0], cor[3][1], mitem[3]);
	outtextxy(cor[4][0], cor[4][1], mitem[4]);

	int cur = 0;

	box(cor[cur][0] - 110, cor[cur][1] - 15, cor[cur][0] + 110,
		cor[cur][1] + 25, GREEN);
	outtextxy(cor[0][0], cor[0][1], mitem[cur]);

	int ch;
	while (1)
	{
		ch = getch();
		setfillstyle(SOLID_FILL, 0);
		bar(cor[cur][0] - 110, cor[cur][1] - 15, cor[cur][0] + 110,
			cor[cur][1] + 25);
		outtextxy(cor[cur][0], cor[cur][1], mitem[cur]);
		switch (ch)
		{
		case 72:
			if (cur == 0)
				cur = 4;
			else
				cur--;
			break;
		case 80:
			if (cur == 4)
				cur = 0;
			else
				cur++;
			break;
		case 13:
			switch (cur)
			{
			case 0:
				newgame();
				break;
			case 1:
				opengame();
				break;
			case 2:
				instructions();
				break;
			case 3:
				highscore();
				break;
			case 4:
				exit(0);
			}
			break;
		}
		box(cor[cur][0] - 110, cor[cur][1] - 15, cor[cur][0] + 110,
			cor[cur][1] + 25, GREEN);
		outtextxy(cor[cur][0], cor[cur][1], mitem[cur]);
	}
}

void main()
{
	clrscr();

	int gd = DETECT, gm = 0;
	initgraph(&gd, &gm, "c:\\tc\\bgi");

	levels();
	gamestart();

	getch();
}
