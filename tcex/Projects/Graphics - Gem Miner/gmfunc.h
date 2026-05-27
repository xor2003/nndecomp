#ifndef GMFUNC_H_
#define GMFUNC_H_

class mineral;

void laser(int, int, int);
void rock(int, int);
void fossil(int, int);
void topaz(int, int);

void homedraw(int[][21], mineral);
void level1();
void play(int[][21], mineral);
void ladder(int, int);

void savegame(int[][21], mineral);
void opengame();

void fossil(int x1, int y1)
{
}
void topaz(int x1, int y1)
{
}
void rock(int x1, int y1)
{
	box(x1 - d + 1, y1 - d + 1, x1 + d - 1, y1 + d - 1, LIGHTGRAY);
}

void crackrock(int[][21]);

void opengame()
{
	mineral t;
	int map[15][21];
	ifstream ifile;

	ifile.open("y:\\mine.dat", ios::binary);
	ifile.read((char *)&t, sizeof(t));
	ifile.close();

	ifile.open("y:\\map.dat");
	for (int i = 0; i < 15; i++)
	{
		for (int j = 0; j < 21; j++)
		{
			ifile >> map[i][j];
		}
	}
	ifile.close();

	homedraw(map, t);
	play(map, t);
}

void savegame(int map[][21], mineral t)
{
	ofstream ofile;

	ofile.open("y:\\mine.dat", ios::binary);
	ofile.write((char *)&t, sizeof(t));
	ofile.close();

	ofile.open("y:\\map.dat");
	for (int i = 0; i < 15; i++)
	{
		for (int j = 0; j < 21; j++)
		{
			ofile << map[i][j];
			ofile << "\t";
		}
		ofile << endl;
	}
	ofile.close();
}
void crackrock(int map[][21])
{
	if (map[a1 - 1][a2] == 3)
	{
		int col = getcolor();

		int x1 = 20 + a2 * 30, y1 = 40 + (a1 - 1) * 30;

		rock(x1, y1);

		setcolor(0);
		setlinestyle(0, 0, 3);
		line(x1 + d / 4, y1 - d, x1 - d / 4, y1 + d);

		setlinestyle(0, 0, 1);
		setcolor(col);
	}
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

class mineral
{
private:
	int gold, diamond, coal;
	int fossil, topaz;

public:
	mineral()
	{
		gold = 0;
		diamond = 0;
		coal = 0;
		fossil = 0;
		topaz = 0;
	}
	void coaln()
	{
		void far
			*ptr1;
		ptr1 = (void *)imagesize(getmaxx() / 2 - 101, getmaxy() / 2 - 51,
								 getmaxx() / 2 + 101, getmaxy() / 2 + 51);
		getimage(getmaxx() / 2 - 100, getmaxy() / 2 - 50, getmaxx() / 2 + 100,
				 getmaxy() / 2 + 50, ptr1);
		box(getmaxx() / 2 - 100, getmaxy() / 2 - 50, getmaxx() / 2 + 100,
			getmaxy() / 2 + 50, BLACK);
		delay(1000);
		putimage(getmaxx() / 2 - 100, getmaxy() / 2 - 50, ptr1, COPY_PUT);
		coal++;
	}
	void goldn()
	{
		void far
			*ptr1;
		ptr1 = (void *)imagesize(getmaxx() / 2 - 101, getmaxy() / 2 - 51,
								 getmaxx() / 2 + 101, getmaxy() / 2 + 51);
		getimage(getmaxx() / 2 - 100, getmaxy() / 2 - 50, getmaxx() / 2 + 100,
				 getmaxy() / 2 + 50, ptr1);
		box(getmaxx() / 2 - 100, getmaxy() / 2 - 50, getmaxx() / 2 + 100,
			getmaxy() / 2 + 50, BLACK);
		delay(1000);
		putimage(getmaxx() / 2 - 100, getmaxy() / 2 - 50, ptr1, COPY_PUT);
		gold++;
	}
	void topazn()
	{
		void far
			*ptr1;
		ptr1 = (void *)imagesize(getmaxx() / 2 - 101, getmaxy() / 2 - 51,
								 getmaxx() / 2 + 101, getmaxy() / 2 + 51);
		getimage(getmaxx() / 2 - 100, getmaxy() / 2 - 50, getmaxx() / 2 + 100,
				 getmaxy() / 2 + 50, ptr1);
		box(getmaxx() / 2 - 100, getmaxy() / 2 - 50, getmaxx() / 2 + 100,
			getmaxy() / 2 + 50, BLACK);
		delay(1000);
		putimage(getmaxx() / 2 - 100, getmaxy() / 2 - 50, ptr1, COPY_PUT);
		topaz++;
	}
	void diamondn()
	{
		void far
			*ptr1;
		ptr1 = (void *)imagesize(getmaxx() / 2 - 101, getmaxy() / 2 - 51,
								 getmaxx() / 2 + 101, getmaxy() / 2 + 51);
		getimage(getmaxx() / 2 - 100, getmaxy() / 2 - 50, getmaxx() / 2 + 100,
				 getmaxy() / 2 + 50, ptr1);
		box(getmaxx() / 2 - 100, getmaxy() / 2 - 50, getmaxx() / 2 + 100,
			getmaxy() / 2 + 50, BLACK);
		delay(1000);
		putimage(getmaxx() / 2 - 100, getmaxy() / 2 - 50, ptr1, COPY_PUT);
		diamond++;
	}
	void fossiln()
	{
		void far
			*ptr1;
		ptr1 = (void *)imagesize(getmaxx() / 2 - 101, getmaxy() / 2 - 51,
								 getmaxx() / 2 + 101, getmaxy() / 2 + 51);
		getimage(getmaxx() / 2 - 100, getmaxy() / 2 - 50, getmaxx() / 2 + 100,
				 getmaxy() / 2 + 50, ptr1);
		box(getmaxx() / 2 - 100, getmaxy() / 2 - 50, getmaxx() / 2 + 100,
			getmaxy() / 2 + 50, BLACK);
		delay(1000);
		putimage(getmaxx() / 2 - 100, getmaxy() / 2 - 50, ptr1, COPY_PUT);
		fossil++;
	}
};

void level1()
{
	mineral t;
	int map[][21] = {0, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
					 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
					 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
					 3, 2, 2, 2, 3, 2, 2, 2, 3, 2, 2, 2, 2, 2, 4, 2, 2, 2, 2, 2, 2, 2, 2,
					 5, 2, 2, 5, 2, 2, 2, 2, 2, 2, 2, 3, 6, 3, 2, 2, 2, 2, 2, 2, 2, 2, 2,
					 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 4, 2, 2, 2, 2,
					 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 3, 6, 3, 2, 5, 2, 2, 2,
					 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 5, 2, 2,
					 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 11, 2, 2, 2, 2, 2, 2,
					 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
					 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
					 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
					 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2,
					 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2, 11};

	homedraw(map, t);
	play(map, t);
}

void homedraw(int map[][21], mineral t)
{
	setfillstyle(SOLID_FILL, BLACK);
	bar(0, 0, getmaxx(), getmaxy());
	box(0, 20, getmaxx(), getmaxy(), 0);

	for (int i = 0; i < 15; i++)
	{
		for (int j = 0; j < 21; j++)
		{
			switch (map[i][j])
			{
			case 0:
				akriti(x, y);
				break;
			case 1:
				box(x - d + 1, y - d + 1, x + d - 1, y + d - 1, BLACK);
				break;
			case 2:
				box(x - d + 1, y - d + 1, x + d - 1, y + d - 1, BROWN);
				break;
			case 3:
				rock(x, y);
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
				lbutton(x, y);
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
	ladder(getmaxx() / 2 + 10, 10);
}

#endif
