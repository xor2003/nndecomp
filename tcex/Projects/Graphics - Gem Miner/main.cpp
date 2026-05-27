#include "gm.h"

//	void far *ptr1;
//	ptr1 = (void *)imagesize(getmaxx()/2-80,getmaxy()/2-20,getmaxx()/2+80,getmaxy()/2+20);
//	getimage(getmaxx()/2-80,getmaxy()/2-20,getmaxx()/2+80,getmaxy()/2+20,ptr1);
//	putimage(getmaxx()/2-80,getmaxy()/2-20,ptr1,COPY_PUT);

#define AKRITI 0
#define SPACE 1
#define SOIL 2
#define ROCK 3
#define LASER 4
#define LADDER 5
#define LBUTTON 6

#define COAL 11
#define GOLD 12
#define TOPAZ 13
#define DIAMOND 14
#define FOSSIL 15

void gameover();

void aclock(int x1, int y1, int l1 = 40)
{
	circle(x1, y1, l1 / 2);
	circle(x1, y1, l1 / 2 - (l1 / 20));
	line(x1, y1, x1, y1 - l1 / 2 + l1 / 10);
	line(x1, y1, x1 + l1 / 2 - l1 / 5, y1);

	ellipse(x1, y1 - l1 / 2, -8, 188, l1 / 4, l1 / 5);
	arc(x1, y1 - l1 / 2 - l1 / 5, -2, 182, l1 / 8);

	setlinestyle(0, 0, 3);
	line(x1 - l1 / 3, y1 + l1 / 3 + l1 / 20, x1 - l1 / 3 - l1 / 15,
		 y1 + l1 / 2);
	line(x1 + l1 / 3, y1 + l1 / 3 + l1 / 20, x1 + l1 / 3 + l1 / 15,
		 y1 + l1 / 2);

	setlinestyle(0, 0, 1);
	arc(x1, y1 + l1 / 10, 10, 40, l1 / 2 + l1 / 5);
	arc(x1, y1 + l1 / 10, 10, 40, l1 - l1 / 5);

	arc(x1, y1 - l1 / 10, 190, 220, l1 / 2 + l1 / 5);
	arc(x1, y1 - l1 / 10, 190, 220, l1 - l1 / 5);
	circle(x1, y1, 2);
}

void check(int[][21], mineral);
void checkmine(int[][21], mineral);
void gamestart();
void gamepause(int[][21], mineral);
void instruction();
void highscore();
void about();

void about()
{
}

void instruction()
{
	cleardevice();
	box(20, 20, 198, getmaxy() - 20, BLACK);

	box(202, 20, getmaxx() - 20, getmaxy() - 20, BLACK);

	getch();
}

void highscore()
{
}

/*
 up 72
 left 75
 right 77
 down 80
 */

void gamepause(int map[][21], mineral t)
{
	/*	void far *ptr1;
	 ptr1 = (void *)imagesize(50-1,50-1,getmaxx()/2-40+1,getmaxy()-40+1);
	 getimage(50,50,getmaxx()/2-40,getmaxy()-40,ptr1);
	 */
	int cor[][2] = {getmaxx() / 4, 150, getmaxx() / 4, 200, getmaxx() / 4, 250,
					getmaxx() / 4, 300, getmaxx() / 4, 350};

	box(50, 50, getmaxx() / 2 - 40 - 1, getmaxy() - 50, BLACK);
	box(getmaxx() / 2 - 40 + 1, 50, getmaxx() - 50, getmaxy() - 50, BLACK);

	settextstyle(SANS_SERIF_FONT, HORIZ_DIR, 4);
	settextjustify(1, 1);
	outtextxy(cor[0][0], cor[0][1], "Resume");
	outtextxy(cor[1][0], cor[1][1], "Map");
	outtextxy(cor[2][0], cor[2][1], "Purchase");
	outtextxy(cor[3][0], cor[3][1], "About");
	outtextxy(cor[4][0], cor[4][1], "Exit");

	switch (getch())
	{
	case '1':
		cleardevice();
		homedraw(map, t);
		break;
	case '2':
		//	showmap(map);
		break;
	case '3':
		//	purchase();
		break;
	case '4':
		about();
		exit(0);
	case '5':
		savegame(map, t);
		delay(100);
		gamestart();
	default:
		gamepause(map, t);
	}
	akriti(20 + a2 * 30, 40 + a1 * 30);
	//	putimage(50,50,ptr1,COPY_PUT);
}

void main()
{
	clrscr();

	int gd = DETECT, gm = 0;
	initgraph(&gd, &gm, "c:\\tc\\bgi");

	gamestart();

	getch();
}

void play(int map[][21], mineral t)
{
	a1 = 0;
	a2 = 0;

	clock_t start, end;
	start = clock();
	int ch;
	int time = 0;
	while (1)
	{
		end = clock();
		char str[5];
		time = (end - start) / 10;
		if (time < 20)
		{

			switch (getch())
			{
			case 27:
				int temp;
				temp = end;
				gamepause(map, t);
				end = clock();
				start += end - temp;
				break;
			case 72:
				if (a1 != 0)
				{
					if (map[a1][a2] == 5)
					{
						check(map, t);
						a1--;
						akriti(20 + a2 * 30, 40 + a1 * 30);
						checkmine(map, t);
						crackrock(map);
					}
				}
				break;
			case 75:
				if (a2 != 0 && map[a1][a2 - 1] != 3)
				{
					check(map, t);
					a2--;
					akriti(20 + a2 * 30, 40 + a1 * 30);
					checkmine(map, t);
					crackrock(map);
				}
				break;
			case 77:
				if (a2 != 20 && map[a1][a2 + 1] != 3)
				{
					check(map, t);
					a2++;
					akriti(20 + a2 * 30, 40 + a1 * 30);
					checkmine(map, t);
					crackrock(map);
				}
				break;
			case 80:
				if (a1 != 14 && map[a1 + 1][a2] != 3)
				{
					check(map, t);
					a1++;
					akriti(20 + a2 * 30, 40 + a1 * 30);
					checkmine(map, t);
					crackrock(map);
				}
				break;
			case 'L':
			case 'l':
				map[a1][a2] = 5;
				break;
			}
			if (map[a1][a2] == 4)
			{
				akriti(20 + a2 * 30, 40 + a1 * 30, 1);
				delay(1500);
				gameover();
			}
			for (int i = a1; i < 15; i++)
			{
				if (map[a1 + 1][a2] == 1)
				{
					int xa = 20 + a2 * 30, ya = 40 + i * 30;
					map[i][a2] = 1;
					box(xa - d + 1, ya - d + 1, xa + d - 1, ya + d - 1, BLACK);
					ya += 30;
					a1++;
					map[i][a2] = 1;
					akriti(xa, ya);
				}
				if (map[a1 + 1][a2] == 4)
				{
					int xa = 20 + a2 * 30, ya = 40 + i * 30;
					box(xa - d + 1, ya - d + 1, xa + d - 1, ya + d - 1, BLACK);
					int col = getcolor();
					setcolor(RED);
					akriti(20 + a2 * 30, 40 + a1 * 30 + 30, 1);
					line(xa, ya - 13 + 30, xa, ya + 14 + 30);
					delay(1000);
					gameover();
					setcolor(col);
				}
			}
		}
		else
		{
			gameover();
			gamestart();
		}
		settextstyle(TRIPLEX_FONT, HORIZ_DIR, 2);
		setcolor(0);
		outtextxy(getmaxx() - 25, 10, str);
		inttostr(time, str);
		setcolor(RED);
		outtextxy(getmaxx() - 25, 10, str);
	}
}

void gameover()
{
	box(getmaxx() / 2 - 100, getmaxy() / 2 - 60, getmaxx() / 2 + 100,
		getmaxy() / 2 + 60, BLACK);
	aclock(getmaxx() / 2 - 40, getmaxy() / 2, 40);
	outtextxy(getmaxx() / 2 + 40, getmaxy() / 2 - 10, "GaMe");
	outtextxy(getmaxx() / 2 + 40, getmaxy() / 2 + 10, "oVeR");
	delay(1000);
}

void checkmine(int map[][21], mineral t)
{
	switch (map[a1][a2])
	{
	case 11:
		t.coaln();
		//			box(x-d+1,y-d+1,x+d-1,y+d-1,BLACK);
		map[a1][a2] = 1;
		break;
	case 12:
		t.goldn();
		box(x - d + 1, y - d + 1, x + d - 1, y + d - 1, BLACK);
		map[a1][a2] = 1;
		break;
	case 13:
		t.topazn();
		box(x - d + 1, y - d + 1, x + d - 1, y + d - 1, BLACK);
		map[a1][a2] = 1;
		break;
	case 14:
		t.diamondn();
		box(x - d + 1, y - d + 1, x + d - 1, y + d - 1, BLACK);
		map[a1][a2] = 1;
		break;
	case 15:
		t.fossiln();
		box(x - d + 1, y - d + 1, x + d - 1, y + d - 1, BLACK);
		map[a1][a2] = 1;
		break;
	}
}

void check(int map[][21], mineral t)
{
	int x, y;
	x = 20 + a2 * 30;
	y = 40 + a1 * 30;

	switch (map[a1][a2])
	{
	case 0:
		map[a1][a2] = 1;
	case 1:
		box(x - d + 1, y - d + 1, x + d - 1, y + d - 1, BLACK);
		break;
	case 2:
		map[a1][a2] = 1;
		box(x - d + 1, y - d + 1, x + d - 1, y + d - 1, BLACK);
		break;
	case 4:
		box(x - d + 1, y - d + 1, x + d - 1, y + d - 1, BLACK);
		laser(x, y);
		break;
	case 5:
		box(x - d + 1, y - d + 1, x + d - 1, y + d - 1, BLACK);
		ladder(x, y);
		break;
	case 6:
		map[a1 - 1][a2] = 1;
		box(x - d + 1, y - d + 1, x + d - 1, y + d - 1, BLACK);
		box(x - d + 1, y - 3 * d + 1, x + d - 1, y - d - 1, BLACK);
		break;
	}

	int x1, y1;

	for (int i = 1; i < 14; i++)
	{
		for (int j = 0; j < 21; j++)
		{
			x1 = 20 + j * 30;
			y1 = 40 + i * 30;
			if (map[i][j] == 5 && map[i + 1][j] == 1)
			{
				map[i][j] = 1;
				map[i + 1][j] = 5;
				box(x1 - d + 1, y1 - d + 1, x1 + d - 1, y1 + d - 1, BLACK);
				ladder(x1, y1 + 30);
			}
			if (map[i][j] == 3 && (map[i + 1][j] == 1 || map[i + 1][j] == 5))
			{
				map[i][j] = 1;
				map[i + 1][j] = 3;
				box(x1 - d + 1, y1 - d + 1, x1 + d - 1, y1 + d - 1, BLACK);
				rock(x1, y1 + 30);
			}
			/*			if(map[(xa-20)/30+1][(ya-40)/30]==1)
			 {
			 map[(xa-20)/30][(ya-40)/30]=1;
			 box(xa-d+1,ya-d+1,xa+d-1,ya+d-1,BLACK);
			 ya+=30;
			 akriti(xa,ya);
			 }
			 if(map[a1+1][a2]==1)
			 {
			 int xa=20+a2*30,	ya=40+a1*30;
			 map[a1][a2]=1;
			 box(xa-d+1,ya-d+1,xa+d-1,ya+d-1,BLACK);
			 ya+=30;
			 a1++;
			 map[a1][a2]=1;
			 akriti(xa,ya);
			 } */
		}
	}

	for (i = 13; i >= 0; --i)
	{
		for (int j = 0; j < 21; j++)
		{
			x1 = 20 + j * 30;
			y1 = 40 + i * 30;
			if (map[i][j] == 5 && map[i + 1][j] == 1)
			{
				map[i][j] = 1;
				map[i + 1][j] = 5;
				box(x1 - d + 1, y1 - d + 1, x1 + d - 1, y1 + d - 1, BLACK);
				ladder(x1, y1 + 30);
			}
			if (map[i][j] == 3 && (map[i + 1][j] == 1 || map[i + 1][j] == 5))
			{
				map[i][j] = 1;
				map[i + 1][j] = 3;
				box(x1 - d + 1, y1 - d + 1, x1 + d - 1, y1 + d - 1, BLACK);
				rock(x1, y1 + 30);
			}
		}
	}
}

void gamestart()
{
	box(0, 0, getmaxx(), getmaxy(), YELLOW);
	box(7, 7, getmaxx() - 7, getmaxy() - 7, BLACK);

	setcolor(RED);
	settextjustify(1, 1);
	settextstyle(GOTHIC_FONT, HORIZ_DIR, 10);
	outtextxy(getmaxx() / 2, 50, "Gem Miner");
	outtextxy(getmaxx() / 2 + 1, 50, "Gem Miner");
	outtextxy(getmaxx() / 2 - 1, 50, "Gem Miner");
	outtextxy(getmaxx() / 2, 50 - 1, "Gem Miner");
	outtextxy(getmaxx() / 2, 50 + 1, "Gem Miner");

	setcolor(LIGHTGRAY);
	setlinestyle(0, 0, 3);
	line(70, 150, getmaxx() - 70, 150);
	line(100, 160, getmaxx() - 100, 160);
	//	line();	line();
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

	settextstyle(SANS_SERIF_FONT, HORIZ_DIR, 4);
	outtextxy(cor[0][0], cor[0][1], "NEW GAME");
	outtextxy(cor[1][0], cor[1][1], "SAVED GAME");
	outtextxy(cor[2][0], cor[2][1], "INSTRUCTIONS");
	outtextxy(cor[3][0], cor[3][1], "HIGH SCORE");
	outtextxy(cor[4][0], cor[4][1], "EXIT");

	//	diamond(100,getmaxy()-100);

	/*
	 while(1)
	 {
	 box(cor[0][0]-110,cor[0][1]-15,cor[0][0]+110,cor[0][1]+25,GREEN);
	 outtextxy(cor[0][0],cor[0][1],"NEW GAME");
	 }
	 */

	switch (getch())
	{
	case '1':
		level1();
		break;
	case '2':
		opengame();
		break;
	case '3':
		instruction();
		break;
	case '4':
		highscore();
		break;
	case '5':
		exit(0);
	}
}
