#include "gourav.h"
#include "main21.cpp"

void _navigate_home_draw();
void _navigate_home_work();
void textout(int, int, char[]);
void _navigate_main_work();

void _navigate_home_work()
{
	int x1, y1, x2, y2;
	char str[30];
	showmouseptr();
	ifstream fi;
	while (!kbhit())
	{
		getmousepos(&button, &mx, &my);
		if (button)
		{
			if (mx > getmaxx() - 19 && my > 4 && mx < getmaxx() - 4 && my < 16) //exit
				exit(0);
			else if (mx > getmaxx() - 35 && my > 4 && mx < getmaxx() - 19 && my < 16) //minimise
				exit(0);
			else
			{
				fi.open("d:\\NAVIGATE\\CORDS.DAT");
				while (!fi.eof())
				{
					fi >> str >> x1 >> y1 >> x2 >> y2;
					if (mx > x1 && my > y1 && mx < x2 && my < y2)
					{
						performmap(str);
						break;
					}
				}
				fi.close();
				remove("d:\\NAVIGATE\\CORDS.DAT");
			}
		}
	}
}

void _navigate_home_draw()
{
	setcolor(BLUE); //Working Area
	for (int i = 0; i < getmaxx(); i += 2)
	{
		line(i, 0, i, getmaxy());
		line(0, i, getmaxx(), i);
	}

	setcolor(7); //left right status bar connecting lines
	rectangle(0, 0, getmaxx() - 1, getmaxy());

	setfillstyle(SOLID_FILL, 7); //upper bottom status bar
	bar(0, 0, getmaxx(), 20);
	bar(0, getmaxy() - 20, getmaxx(), getmaxy());

	setfillstyle(SOLID_FILL, 8); //Exit Button Box
	setcolor(7);
	bar(getmaxx() - 35, 4, getmaxx() - 4, 16);
	line(getmaxx() - 19, 4, getmaxx() - 19, 16);

	line(getmaxx() - 15, 7, getmaxx() - 8, 13); //Exit Button
	line(getmaxx() - 15, 13, getmaxx() - 8, 7);

	line(getmaxx() - 30, 10, getmaxx() - 24, 10); //Minimise

	char str[10];
	int n, x1, y1, x2, y2;
	x1 = 40, y1 = 40, x2 = 120, y2 = 60;

	ifstream fi;
	fi.open("d:\\NAVIGATE\\MAPS.DAT");
	setfillstyle(SOLID_FILL, 7);
	setcolor(0);
	ofstream fo;
	fo.open("d:\\NAVIGATE\\CORDS.DAT");
	while (!fi.eof())
	{
		fi >> str >> n;
		bar(x1, y1, x2, y2);

		if (strcmp(str, "") == 0)
			strcpy(str, "+");
		fo << str << "\t" << x1 << "\t" << y1 << "\t" << x2 << "\t" << y2
		   << endl;

		if (strcmp(str, "+") == 0)
			strcpy(str, " +");
		textout(x1, y1, str);

		x1 += 120;
		x2 += 120;
		if (x2 > getmaxx())
		{
			x1 = 40;
			x2 = 120;
			y1 += 40;
			y2 += 40;
		}
	}
	fi.close();
	fo.close();
	_navigate_home_work();
}

void main()
{
	clrscr();
	initgraphic();
	initmouse();

	getch();
}
