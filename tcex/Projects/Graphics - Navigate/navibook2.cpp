#include "gourav.h"

#define max 12

class navi_main;

class navi_main
{
public:
	void _book_draw();
	void _book_work();
	void _pencils_draw();
	void _pencils_work(int, int);
	void _page_draw();
	void _page_work();
	void _box(int, int, int, int, int);
};

void usemap();
/*
 void menu();
 void path();
 void init();
 void insmap();
 void delmap();
 void usemap();
 void drawtest();
 void performmap(char[]);
 void inttostr(int,char[]);
 void findpath(int,int,int[][max+1],int[],char[][20]);
 */

void main()
{
	clrscr();
	usemap();
	/*
	 _mouse_init();
	 _graphics_init();
	 _mouse_show();

	 settextjustify(HORIZ_DIR,CENTER_TEXT);
	 settextjustify(VERT_DIR,CENTER_TEXT);

	 navi_main m;
	 m._book_draw();
	 m._pencils_draw();
	 */
	getch();
}

void usemap()
{
	clrscr();
	int flag = 0;
	char str1[20], str2[20], str3[20];
	ifstream fi;
	fi.open("d:\\NAVIGATE\\MAPS.DAT");
	while (!fi.eof())
	{
		fi >> str1;
		fi >> str2;
		cout << endl
			 << str1;
	}
	fi.close();
	cout << "\n\nEnter Map\t\t";
	cin >> str1;
	strupr(str1);
	fi.open("d:\\NAVIGATE\\MAPS.DAT");
	while (!fi.eof())
	{
		fi >> str2;
		if (strcmp(str2, str1) == 0)
		{
			flag = 1;
			break;
		}
		else
			flag = 0;
	}
	fi.close();
	if (flag == 1)
	{
		cout << "\nMap found\n";
		delay(1500);
	}
	else
	{
		cout << "\nMap Not Found...\n";
		delay(1500);
	}
}

void navi_main::_pencils_work(int x1, int y1)
{
	while (1)
	{
		_mouse_getmousepos(&button, &mx, &my);
		if (button)
		{
			if (mx > x1 && my > y1 && mx < (x1 + 85) && my < (y1 + 40))
				exit(0); //open map
			if (mx > x1 && my > (y1 + 60) && mx < (x1 + 85) && my < (y1 + 100))
				exit(0); //delete map
			if (mx > x1 && my > (y1 + 120) && mx < (x1 + 85) && my < (y1 + 160))
				exit(0); //create map
			if (mx > x1 && my > (y1 + 180) && mx < (x1 + 85) && my < (y1 + 220))
				exit(0); //about
			if (mx > x1 && my > (y1 + 240) && mx < (x1 + 85) && my < (y1 + 280))
				exit(0); //exit
		}
	}
}

void navi_main::_book_work()
{
	while (1)
	{
		_mouse_getmousepos(&button, &mx, &my);
		if (button)
			_page_draw();
	}
}

void navi_main::_page_work()
{
	while (1)
	{
		_mouse_getmousepos(&button, &mx, &my);
		if (button == 1)
			exit(0);
	}
}

void navi_main::_book_draw()
{
	_mouse_hide();
	setfillstyle(SOLID_FILL, YELLOW);
	bar(30, 10, getmaxy() + 20, getmaxy() - 25); //main page
	setlinestyle(0, 0, 1);
	for (int i = 1; i <= 5; i++) //extra pages
	{
		setcolor(i);
		line(30 + i, getmaxy() - 25 + i, getmaxy() + 20 + i,
			 getmaxy() - 25 + i); //below pages
		line(getmaxy() + 20 + i, 10 + i, getmaxy() + 20 + i,
			 getmaxy() - 25 + i); //side pages
	}

	for (i = 0; i < 12; i++) //spiral binding
	{
		setcolor(0);
		circle(45, 30 + 35 * i, 3);
		setfillstyle(SOLID_FILL, 0);
		floodfill(45, 30 + 35 * i, 0);
		setcolor(RED);
		arc(25, 45 + 35 * i, 30, 280, 25);
	}

	{ //folded page
		setcolor(1);
		rectangle(getmaxy() - 5, getmaxy() - 50, getmaxy() + 20,
				  getmaxy() - 25);
		line(getmaxy() + 20, getmaxy() - 50, getmaxy() - 5, getmaxy() - 25);
		setfillstyle(SOLID_FILL, 1);
		floodfill(getmaxy() + 15, getmaxy() - 30, 1);
	}
	_mouse_show();
}

void navi_main::_box(int x1, int y1, int x2, int y2, int color)
{
	setfillstyle(SOLID_FILL, color);
	bar(x1, y1, x2, y2);
	setlinestyle(0, 0, 3);
	setcolor(7);
	line(x1, y1, x2, y1);
	line(x1, y1, x1, y2);
	setcolor(8);
	line(x2, y1, x2, y2);
	line(x1, y2, x2, y2);
}

void navi_main::_pencils_draw()
{
	char str[][11] = {"OPEN MAP", "DELETE MAP", "CREATE MAP", "ABOUT", "EXIT"};
	_mouse_hide();
	for (int i = 0; i < 5; i++) //pencils
	{
		setcolor(BLUE);
		rectangle(getmaxy() + 30, 20 + 60 * i, getmaxy() + 45, 60 + 60 * i);
		rectangle(getmaxy() + 45, 20 + 60 * i, getmaxy() + 130, 60 + 60 * i);
		line(getmaxy() + 130, 20 + 60 * i, getmaxy() + 160,
			 20 * (4 + 6 * i) / 2);
		line(getmaxy() + 130, 60 + 60 * i, getmaxy() + 160,
			 20 * (4 + 6 * i) / 2);
		arc(getmaxy() + 160, 20 * (4 + 6 * i) / 2, 140, 220, 10);
		rectangle(getmaxy() + 45, 30 + 60 * i, getmaxy() + 130, 50 + 60 * i);

		setfillstyle(SOLID_FILL, WHITE); //eraser
		floodfill(getmaxy() + 30 + 1, 20 + 60 * i + 1, BLUE);

		setfillstyle(SOLID_FILL, RED); //near pointer
		floodfill(getmaxy() + 45 + 1, 20 + 60 * i + 1, BLUE);
		floodfill(getmaxy() + 130 - 1, 60 + 60 * i - 1, BLUE);

		setfillstyle(SOLID_FILL, BROWN); //full pencil
		floodfill(getmaxy() + 130 + 1, 20 + 60 * i + 2, BLUE);

		setfillstyle(SOLID_FILL, 8); //pointer
		floodfill(getmaxy() + 160 - 2, 20 * (4 + 6 * i) / 2, BLUE);

		setcolor(7);
		outtextxy(getmaxy() + 87, 41 + 60 * i, str[i]);
	}
	_mouse_show();
	_pencils_work(getmaxy() + 45, 20);
}

void navi_main::_page_draw()
{
	_mouse_hide();
	{ //page
		setfillstyle(SOLID_FILL, WHITE);
		bar(getmaxy() + 40, 20, getmaxx() - 15, getmaxy() - 60);

		setcolor(WHITE);
		line(getmaxy() + 40, getmaxy() - 60, getmaxy() + 40, getmaxy() - 50);
		arc(getmaxy() + 40 + 10, getmaxy() - 60 + 10, 180, 90, 10);
		arc(getmaxx() - 15, getmaxy() - 60 + 10, 270, 90, 10);
		line(getmaxy() + 40 + 10, getmaxy() - 60 + 20, getmaxx() - 15,
			 getmaxy() - 60 + 20);

		setfillstyle(SOLID_FILL, WHITE);
		floodfill(getmaxy() + 40 + 10, getmaxy() - 60 + 10, WHITE);

		setfillstyle(SOLID_FILL, 7);
		floodfill(getmaxx() - 15, getmaxy() - 60 + 10, WHITE);
	}
	{ //cross option x
		setlinestyle(0, 0, 3);
		line(getmaxx() - 30, 25, getmaxx() - 20, 35);
		line(getmaxx() - 30, 35, getmaxx() - 20, 25);
		rectangle(getmaxx() - 30, 25, getmaxx() - 20, 35);
	}
	_mouse_show();
}
