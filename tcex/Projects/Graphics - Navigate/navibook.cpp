void navi_graphic::_book_draw()
{
	_mouse_hidemouseptr();
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
}

void navi_graphic::_book_work()
{
	_mouse_showmouseptr();
	_mouse_showmouseptr();
	while (1)
	{
		_mouse_getmousepos(&button, &mx, &my);
		if (button == 1)
			_page_draw();
	}
}

void navi_graphic::_page_work()
{
	delay(100);
	_mouse_showmouseptr();
	while (1)
	{
		_mouse_getmousepos(&button, &mx, &my);
		if (button == 1)
			exit(0);
	}
}

void navi_graphic::_box(int x1, int y1, int x2, int y2, int color)
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

void navi_graphic::_pencils_draw()
{
	_mouse_hidemouseptr();
	for (int i = 0; i < 7; i++) //pencils
	{
		rectangle(getmaxy() + 30, 20 + 60 * i, getmaxy() + 45, 60 + 60 * i);
		rectangle(getmaxy() + 45, 20 + 60 * i, getmaxy() + 110, 60 + 60 * i);
		line(getmaxy() + 110, 20 + 60 * i, getmaxy() + 140,
			 20 * (4 + 6 * i) / 2);
		line(getmaxy() + 110, 60 + 60 * i, getmaxy() + 140,
			 20 * (4 + 6 * i) / 2);
		arc(getmaxy() + 140, 20 * (4 + 6 * i) / 2, 140, 220, 10);
		rectangle(getmaxy() + 45, 30 + 60 * i, getmaxy() + 110, 50 + 60 * i);

		setfillstyle(SOLID_FILL, WHITE); //eraser
		floodfill(getmaxy() + 30 + 1, 20 + 60 * i + 1, BLUE);

		setfillstyle(SOLID_FILL, RED); //near pointer
		floodfill(getmaxy() + 45 + 1, 20 + 60 * i + 1, BLUE);
		floodfill(getmaxy() + 110 - 1, 60 + 60 * i - 1, BLUE);

		setfillstyle(SOLID_FILL, BROWN); //full pencil
		floodfill(getmaxy() + 110 + 1, 20 + 60 * i + 2, BLUE);

		setfillstyle(SOLID_FILL, 8); //pointer
		floodfill(getmaxy() + 140 - 2, 20 * (4 + 6 * i) / 2, BLUE);
	}
}

void navi_graphic::_page_draw()
{
	_mouse_hidemouseptr();
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
}

/*
 void main()
 {
 clrscr();

 _mouse_init();
 _graphics_init();
 _mouse_showmouseptr();

 _book_draw();
 _pencils_draw();
 _book_work();

 getch();
 }
 */