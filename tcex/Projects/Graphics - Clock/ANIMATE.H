/*
 * 	animate.h / Clock
 *	Author : Gourav Siddhad
 */

void ainfo(int x1, int y1, int l1 = 40)
{
	line(x1, y1 - l1 / 4 + l1 / 20, x1, y1 + l1 / 3);
	circle(x1, y1 - l1 / 3, l1 / 20);
}

void amin(int x1, int y1, int l1 = 40)
{
	rectangle(x1 - l1 / 10, y1 - l1 / 5, x1 + l1 / 10, y1);
	line(x1 - l1 / 6, y1, x1 + l1 / 6, y1);
	line(x1 - l1 / 6, y1, x1, y1 + l1 / 5);
	line(x1 + l1 / 6, y1, x1, y1 + l1 / 5);
}

void aclose(int x1, int y1, int l1 = 40)
{
	setlinestyle(0, 0, 3);
	line(x1 - l1 / 3, y1 - l1 / 3, x1 + l1 / 3, y1 + l1 / 3);
	line(x1 + l1 / 3, y1 - l1 / 3, x1 - l1 / 3, y1 + l1 / 3);
	setcolor(0);
	circle(x1, y1, l1 / 40);
	setlinestyle(0, 0, 1);
	setcolor(15);
	circle(x1, y1, l1 / 20);
}

void aback(int x1, int y1, int l1 = 40)
{
	ellipse(x1 - l1 / 15, y1 - l1 / 3 + l1 / 10, 0, 360, l1 / 15, l1 / 10);
	ellipse(x1 - l1 / 5 + l1 / 40, y1 - l1 / 3 + l1 / 10, 0, 360, l1 / 15,
			l1 / 10);
	ellipse(x1 + l1 / 5 - l1 / 40, y1 - l1 / 3 + l1 / 10, 0, 360, l1 / 15,
			l1 / 10);
	ellipse(x1 + l1 / 15, y1 - l1 / 3 + l1 / 9, 0, 360, l1 / 15, l1 / 10);

	ellipse(x1, y1 - l1 / 9 - l1 / 20, 177, 362, l1 / 4 - l1 / 40,
			l1 / 3 + l1 / 15);

	line(x1 - l1 / 10, y1 + l1 / 3 - l1 / 10 - l1 / 40, x1 - l1 / 10,
		 y1 + l1 / 3 + l1 / 20);
	line(x1 + l1 / 10, y1 + l1 / 3 - l1 / 10 - l1 / 40, x1 + l1 / 10,
		 y1 + l1 / 3 + l1 / 20);

	ellipse(x1 - l1 / 4 + l1 / 40, y1, 90, 285, l1 / 6, l1 / 14);

	arc(x1 - l1 / 7, y1 + l1 / 5, 0, 90, l1 / 5);
}

void asuser(int x1, int y1, int l1 = 40)
{
	arc(x1, y1, 0, 150, l1 / 2);
	arc(x1, y1, 180, 330, l1 / 2);
	line(x1 + l1 / 2, y1, x1 + l1 / 2 - l1 / 10, y1 - l1 / 10);
	line(x1 + l1 / 2, y1, x1 + l1 / 2 + l1 / 10, y1 - l1 / 10);

	line(x1 - l1 / 2, y1, x1 - l1 / 2 - l1 / 10, y1 + l1 / 10);
	line(x1 - l1 / 2, y1, x1 - l1 / 2 + l1 / 10, y1 + l1 / 10);
}

void ashutd(int x1, int y1, int l1 = 40)
{
	circle(x1, y1, l1 / 2);
	line(x1, y1 - l1 / 4, x1, y1 + l1 / 4);
}

void aexit(int x1, int y1, int l1 = 40)
{
	setlinestyle(0, 0, 3);
	rectangle(x1 - l1 / 4, y1 - l1 / 2, x1 + l1 / 4, y1 + l1 / 2);

	setlinestyle(0, 0, 1);

	line(x1 - l1 / 4, y1 - l1 / 2, x1 + l1 / 8, y1 - l1 / 4);
	line(x1 - l1 / 4, y1 + l1 / 2, x1 + l1 / 8, y1 + l1 / 2 + l1 / 4);
	line(x1 + l1 / 8, y1 - l1 / 4, x1 + l1 / 8, y1 + l1 / 2 + l1 / 4);
	ellipse(x1 + l1 / 20, y1 + l1 / 5, 0, 360, l1 / 30, l1 / 25);
}

void aclock(int x1, int y1, int l1 = 40)
{
	circle(x1, y1, l1 / 2);
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

void alclock(int x1, int y1, int l1 = 40)
{
	circle(x1, y1, l1 / 2);
	line(x1, y1, x1, y1 - l1 / 2 + l1 / 10);
	line(x1, y1, x1 + l1 / 2 - l1 / 5, y1);
	line(x1 + l1 / 2, y1 - l1 / 2 - l1 / 3, x1 + l1 / 2, y1 + l1 / 2 + l1 / 3);
	rectangle(x1 + l1 / 2, y1 - l1 / 4, x1 + l1 / 2 + l1 / 3, y1 + l1 / 4);
	line(x1 + l1 / 2, y1 - l1 / 2 - l1 / 3, x1 - l1 / 2 - l1 / 3 - l1 / 7, y1);
	line(x1 + l1 / 2, y1 + l1 / 2 + l1 / 3, x1 - l1 / 2 - l1 / 3 - l1 / 7, y1);
}

void aactal(int x1, int y1, int l1 = 40)
{
	circle(x1, y1, l1 / 2);

	ellipse(x1, y1 - l1 / 2 - l1 / 8, -8, 188, l1 / 3 + l1 / 20, l1 / 5);
	circle(x1 - l1 / 2 + l1 / 10, y1 - l1 / 2 + l1 / 40, l1 / 8);
	circle(x1 + l1 / 2 - l1 / 10, y1 - l1 / 2 + l1 / 40, l1 / 8);

	setlinestyle(0, 0, 3);
	line(x1 - l1 / 3, y1 + l1 / 3 + l1 / 20, x1 - l1 / 3 - l1 / 15,
		 y1 + l1 / 2);
	line(x1 + l1 / 3, y1 + l1 / 3 + l1 / 20, x1 + l1 / 3 + l1 / 15,
		 y1 + l1 / 2);

	setlinestyle(0, 0, 1);
	arc(x1, y1 + l1 / 10, -20, 10, l1 / 2 + l1 / 5);
	arc(x1, y1 + l1 / 10, -20, 10, l1 - l1 / 5);

	arc(x1, y1 - l1 / 10, 160, 190, l1 / 2 + l1 / 5);
	arc(x1, y1 - l1 / 10, 160, 190, l1 - l1 / 5);

	rectangle(x1 - l1 / 10, y1 - l1 / 4, x1 + l1 / 10, y1);
	line(x1 + l1 / 10, y1, x1 + l1 / 6, y1 + l1 / 10);
	line(x1 - l1 / 10, y1, x1 - l1 / 6, y1 + l1 / 10);
	line(x1 - l1 / 6, y1 + l1 / 10, x1 + l1 / 6, y1 + l1 / 10);
	arc(x1, y1 + l1 / 10, 180, 0, l1 / 15);
}

void adactal(int x1, int y1, int l1 = 40)
{
	circle(x1, y1, l1 / 2);

	ellipse(x1, y1 - l1 / 2 - l1 / 8, -8, 188, l1 / 3 + l1 / 20, l1 / 5);
	circle(x1 - l1 / 2 + l1 / 10, y1 - l1 / 2 + l1 / 40, l1 / 8);
	circle(x1 + l1 / 2 - l1 / 10, y1 - l1 / 2 + l1 / 40, l1 / 8);

	setlinestyle(0, 0, 3);
	line(x1 - l1 / 3, y1 + l1 / 3 + l1 / 20, x1 - l1 / 3 - l1 / 15,
		 y1 + l1 / 2);
	line(x1 + l1 / 3, y1 + l1 / 3 + l1 / 20, x1 + l1 / 3 + l1 / 15,
		 y1 + l1 / 2);

	setlinestyle(0, 0, 1);
	arc(x1, y1 + l1 / 10, -20, 10, l1 / 2 + l1 / 5);
	arc(x1, y1 + l1 / 10, -20, 10, l1 - l1 / 5);

	arc(x1, y1 - l1 / 10, 160, 190, l1 / 2 + l1 / 5);
	arc(x1, y1 - l1 / 10, 160, 190, l1 - l1 / 5);

	rectangle(x1 - l1 / 10, y1 - l1 / 4, x1 + l1 / 10, y1);
	line(x1 + l1 / 10, y1, x1 + l1 / 6, y1 + l1 / 10);
	line(x1 - l1 / 10, y1, x1 - l1 / 6, y1 + l1 / 10);
	line(x1 - l1 / 6, y1 + l1 / 10, x1 + l1 / 6, y1 + l1 / 10);
	arc(x1, y1 + l1 / 10, 180, 0, l1 / 15);

	line(x1 + 2 * l1 / 3 - l1 / 40, y1 - l1 / 2 - l1 / 40,
		 x1 - 2 * l1 / 3 - l1 / 40, y1 + l1 / 2 - l1 / 40);
	line(x1 + 2 * l1 / 3 + l1 / 40, y1 - l1 / 2 + l1 / 40,
		 x1 - 2 * l1 / 3 + l1 / 40, y1 + l1 / 2 + l1 / 40);

	line(x1 - 2 * l1 / 3 - l1 / 40, y1 + l1 / 2 - l1 / 40,
		 x1 - 2 * l1 / 3 + l1 / 40, y1 + l1 / 2 + l1 / 40);
	line(x1 + 2 * l1 / 3 - l1 / 40, y1 - l1 / 2 - l1 / 40,
		 x1 + 2 * l1 / 3 + l1 / 40, y1 - l1 / 2 + l1 / 40);
}

void acal(int x1, int y1, int l1 = 40)
{
	line(x1 - l1 / 2 + l1 / 20, y1 - l1 / 2, x1 + l1 / 2 - l1 / 20,
		 y1 - l1 / 2);
	line(x1 - l1 / 2 + l1 / 20, y1 + l1 / 2, x1 + l1 / 2 - l1 / 20,
		 y1 + l1 / 2);
	line(x1 - l1 / 2 + l1 / 20, y1 - l1 / 2 + l1 / 3, x1 + l1 / 2 - l1 / 20,
		 y1 - l1 / 2 + l1 / 3);

	line(x1 - l1 / 2, y1 - l1 / 2 + l1 / 40, x1 - l1 / 2,
		 y1 - l1 / 2 + l1 / 3 - l1 / 40);
	line(x1 + l1 / 2, y1 - l1 / 2 + l1 / 40, x1 + l1 / 2,
		 y1 - l1 / 2 + l1 / 3 - l1 / 40);
	line(x1 - l1 / 2, y1 - l1 / 2 + l1 / 3 + l1 / 40, x1 - l1 / 2,
		 y1 + l1 / 2 - l1 / 40);
	line(x1 + l1 / 2, y1 - l1 / 2 + l1 / 3 + l1 / 40, x1 + l1 / 2,
		 y1 + l1 / 2 - l1 / 40);

	for (int k = 1; k < 6; k++)
		line(x1 - l1 / 2 + 7 * l1 / 40 * k - l1 / 40,
			 y1 - l1 / 2 + l1 / 3 + l1 / 15,
			 x1 - l1 / 2 + 7 * l1 / 40 * k - l1 / 40, y1 + l1 / 2 - l1 / 15);
	for (k = 1; k < 4; k++)
		line(x1 - l1 / 2 + l1 / 20, y1 - l1 / 4 + 8 * k, x1 + l1 / 2 - l1 / 20,
			 y1 - l1 / 4 + 8 * k);
	for (k = 1; k < 5; k++)
		arc(x1 - l1 / 2 + 9 * k - l1 / 20, y1 - l1 / 2, -5, 185, 4 * l1 / 40);
}

void acalclock(int x1, int y1, int l1 = 40)
{
	line(x1 - l1 / 2 + l1 / 20, y1 - l1 / 2, x1 + l1 / 2 - l1 / 20,
		 y1 - l1 / 2);
	line(x1 - l1 / 2 + l1 / 20, y1 + l1 / 2, x1 + l1 / 2 - l1 / 20,
		 y1 + l1 / 2);
	line(x1 - l1 / 2 + l1 / 20, y1 - l1 / 2 + l1 / 3, x1 + l1 / 2 - l1 / 20,
		 y1 - l1 / 2 + l1 / 3);

	line(x1 - l1 / 2, y1 - l1 / 2 + l1 / 40, x1 - l1 / 2,
		 y1 - l1 / 2 + l1 / 3 - l1 / 40);
	line(x1 + l1 / 2, y1 - l1 / 2 + l1 / 40, x1 + l1 / 2,
		 y1 - l1 / 2 + l1 / 3 - l1 / 40);
	line(x1 - l1 / 2, y1 - l1 / 2 + l1 / 3 + l1 / 40, x1 - l1 / 2,
		 y1 + l1 / 2 - l1 / 40);
	line(x1 + l1 / 2, y1 - l1 / 2 + l1 / 3 + l1 / 40, x1 + l1 / 2,
		 y1 + l1 / 2 - l1 / 40);

	for (int k = 1; k < 6; k++)
		line(x1 - l1 / 2 + 7 * l1 / 40 * k - l1 / 40,
			 y1 - l1 / 2 + l1 / 3 + l1 / 15,
			 x1 - l1 / 2 + 7 * l1 / 40 * k - l1 / 40, y1 + l1 / 2 - l1 / 15);
	for (k = 1; k < 4; k++)
		line(x1 - l1 / 2 + l1 / 20, y1 - l1 / 4 + 8 * l1 / 40 * k,
			 x1 + l1 / 2 - l1 / 20, y1 - l1 / 4 + 8 * l1 / 40 * k);
	for (k = 1; k < 5; k++)
		arc(x1 - l1 / 2 + 9 * l1 / 40 * k - l1 / 20 - l1 / 40, y1 - l1 / 2, -5,
			185, l1 / 10);
	setcolor(0);
	setlinestyle(0, 0, 3);
	for (k = 0; k < 5; k++)
		arc(x1 + l1 / 2, y1 - l1 / 2 + l1 / 3, 90, 270, 2 * l1 / 40 * k);
	setcolor(YELLOW);
	setlinestyle(0, 0, 1);
	circle(x1 + l1 / 2, y1 - l1 / 2 + l1 / 3, l1 / 4);

	line(x1 + l1 / 2, y1 - l1 / 2 + l1 / 3, x1 + l1 / 2, y1 - l1 / 2 + l1 / 5);
	line(x1 + l1 / 2, y1 - l1 / 2 + l1 / 3, x1 + l1 / 2 + l1 / 8,
		 y1 - l1 / 2 + l1 / 3);
}

void amreset(int x1, int y1, int l1 = 40)
{
	arc(x1 - l1 / 2 - l1 / 30 - l1 / 10, y1, 270, 90, l1 / 4);
	arc(x1 - l1 / 2 + l1 / 20 - l1 / 10, y1, 270, 90, l1 / 4);

	arc(x1 + l1 / 2 + l1 / 30 + l1 / 10, y1, 90, 270, l1 / 4);
	arc(x1 + l1 / 2 - l1 / 20 + l1 / 10, y1, 90, 270, l1 / 4);

	rectangle(x1 - l1 / 3, y1 - l1 / 20, x1 + l1 / 3, y1 + l1 / 20);

	settextstyle(SMALL_FONT, HORIZ_DIR, 5);
	outtextxy(x1 - l1 / 4, y1 - l1 / 2, "M.R.");
}

void aselfd(int x1, int y1, int l1 = 40)
{
	ellipse(x1, y1 - l1 / 2, 0, 360, l1 / 4, l1 / 9);
	ellipse(x1, y1 + l1 / 2, 0, 360, l1 / 4, l1 / 9);
	line(x1 - l1 / 4, y1 - l1 / 2, x1 - l1 / 4, y1 + l1 / 2);
	line(x1 + l1 / 4, y1 - l1 / 2, x1 + l1 / 4, y1 + l1 / 2);

	ellipse(x1 + l1 / 3 - l1 / 20, y1 - l1 / 2, 0, 180, l1 / 4, l1 / 6);
	settextstyle(SMALL_FONT, HORIZ_DIR, 7);
	outtextxy(x1 - l1 / 2 - l1 / 5, y1 - l1 / 4 - l1 / 20, "T N T");

	line(x1 + l1 / 2, y1 - l1 / 2, x1 + l1 / 2, y1 - l1 / 3);
	line(x1 + l1 / 2, y1 - l1 / 2, x1 + l1 / 2 - l1 / 10, y1 - l1 / 3);
	line(x1 + l1 / 2, y1 - l1 / 2, x1 + l1 / 2 + l1 / 10, y1 - l1 / 3);

	circle(x1 + l1 / 40, y1 - l1 / 2, l1 / 40);
}

void amenubar()
{
	circle(getmaxx() / 2, getmaxy() - 40, 35);
	ellipse(getmaxx() / 2, getmaxy() - 20, 30, 150, 80, 65);

	line(getmaxx() / 7, getmaxy() - 30, getmaxx() / 2 - 69, getmaxy() - 52);
	line(getmaxx() / 2 + 69, getmaxy() - 52, getmaxx() - getmaxx() / 7,
		 getmaxy() - 30);

	rectangle(0, getmaxy() - 30, getmaxx() / 7, getmaxy());
	rectangle(getmaxx() - getmaxx() / 7, getmaxy() - 30, getmaxx() - 1,
			  getmaxy());

	line(0, getmaxy(), getmaxx(), getmaxy());

	circle(getmaxx() / 2 - getmaxx() / 5, getmaxy() - 22, 15);
	circle(getmaxx() / 2 - getmaxx() / 7, getmaxy() - 22, 15);

	circle(getmaxx() / 2 + getmaxx() / 7, getmaxy() - 22, 15);
	circle(getmaxx() / 2 + getmaxx() / 5, getmaxy() - 22, 15);
}

void atimer(int x1, int y1, int l1 = 40)
{
	ellipse(x1 - l1 / 4 - l1 / 10, y1, 45, 315, l1 / 2, l1 / 2);
	ellipse(x1 - l1 / 4 - l1 / 10, y1, 45, 315, l1 / 2 - l1 / 20,
			l1 / 2 - l1 / 20);

	circle(x1 + l1 / 4 + l1 / 10, y1, l1 / 2);
	circle(x1 + l1 / 4 + l1 / 10, y1, l1 / 2 - l1 / 20);

	line(x1 + l1 / 4 + l1 / 10, y1, x1 + l1 / 4 + l1 / 10, y1 - l1 / 3);
	line(x1 + l1 / 4 + l1 / 10, y1, x1 + l1 / 4 + l1 / 10 + l1 / 4, y1);

	rectangle(x1 - l1 / 2, y1 - l1 / 15, x1 - l1 / 5 - l1 / 10, y1 + l1 / 15);
	line(x1 - l1 / 5, y1, x1 - l1 / 3, y1 - l1 / 10);
	line(x1 - l1 / 5, y1, x1 - l1 / 3, y1 + l1 / 10);
	line(x1 - l1 / 3, y1 - l1 / 10, x1 - l1 / 3, y1 + l1 / 10);
}

void astopwatch(int x1, int y1, int l1 = 40)
{
	circle(x1, y1, l1 / 2);
	circle(x1, y1, l1 / 2 - l1 / 20 - l1 / 40);
	rectangle(x1 + l1 / 2, y1 - l1 / 20, x1 + l1 / 2 + l1 / 20, y1 + l1 / 20);
	rectangle(x1 + l1 / 2 + l1 / 20, y1 - l1 / 10, x1 + l1 / 2 + l1 / 10,
			  y1 + l1 / 10);
	line(x1, y1, x1, y1 - l1 / 3);
	line(x1, y1, x1 + l1 / 4, y1);
}

void ausera(int x1, int y1, int l1 = 40)
{
	ellipse(x1, y1, 0, 360, l1 / 2, l1 / 2 + l1 / 10);
	arc(x1 - l1 / 2 + l1 / 5, y1 - l1 / 2 - l1 / 10, 0, 100, l1 / 3);
	circle(x1 - l1 / 2 + l1 / 10, y1 - l1 + l1 / 18 + l1 / 20, l1 / 20);

	arc(x1, y1, 240, 310, l1 / 3 + l1 / 12);
	arc(x1, y1, 250, 290, l1 / 6);

	ellipse(x1 - l1 / 3 + l1 / 10 + l1 / 40, y1 - l1 / 3 + l1 / 6, 0, 360,
			l1 / 8, l1 / 4);
	ellipse(x1 + l1 / 3 - l1 / 10 - l1 / 40, y1 - l1 / 3 + l1 / 6, 0, 360,
			l1 / 8, l1 / 4);

	circle(x1 - l1 / 4 + l1 / 20, y1 - l1 / 20, l1 / 10);
	circle(x1 + l1 / 4 - l1 / 20, y1 - l1 / 20, l1 / 10);

	arc(x1, y1 - l1 / 10, 54, 122, l1 / 10);
}

void auserg(int x1, int y1, int l1 = 40)
{
	ellipse(x1, y1, 0, 360, l1 / 2, l1 / 2 + l1 / 10);
	arc(x1 + l1 / 2 - l1 / 5, y1 - l1 / 2 - l1 / 10, 80, 180, l1 / 3);
	circle(x1 + l1 / 2 - l1 / 10, y1 - l1 + l1 / 18 + l1 / 20, l1 / 20);
	arc(x1, y1, 240, 310, l1 / 3 + l1 / 12);

	ellipse(x1 - l1 / 3 + l1 / 10 + l1 / 40, y1 - l1 / 3 + l1 / 6, 0, 360,
			l1 / 8, l1 / 4);
	ellipse(x1 + l1 / 3 - l1 / 10 - l1 / 40, y1 - l1 / 3 + l1 / 6, 0, 360,
			l1 / 8, l1 / 4);

	arc(x1, y1, 250, 290, l1 / 6);

	circle(x1 - l1 / 4 + l1 / 20, y1 - l1 / 20, l1 / 10);
	circle(x1 + l1 / 4 - l1 / 20, y1 - l1 / 20, l1 / 10);

	arc(x1, y1 - l1 / 10, 54, 122, l1 / 10);
}

void apointed1(int x1, int y1, int l1 = 40)
{
	ellipse(x1 + l1 / 6, y1 - l1 / 6, 0, 360, l1 / 2, l1 / 3);
	circle(x1 - l1 / 3 - l1 / 20, y1 + l1 / 6 + l1 / 20, l1 / 10);
	circle(x1 - l1 / 3 - l1 / 5, y1 + l1 / 6 + l1 / 5, l1 / 20);
}

void ahome(int x1, int y1, int l1 = 40)
{
	rectangle(x1 - l1 / 4, y1 - l1 / 4, x1 + l1 / 4, y1 + l1 / 4);
	line(x1 - l1 / 4, y1 - l1 / 4, x1 - l1 / 4 - l1 / 11, y1 - l1 / 4);
	line(x1 + l1 / 4, y1 - l1 / 4, x1 + l1 / 4 + l1 / 11, y1 - l1 / 4);

	line(x1, y1 - l1 / 2, x1 - l1 / 4 - l1 / 11, y1 - l1 / 4);
	line(x1, y1 - l1 / 2, x1 + l1 / 4 + l1 / 11, y1 - l1 / 4);

	rectangle(x1 - l1 / 10, y1, x1 + l1 / 10, y1 + l1 / 4);

	setcolor(0);
	line(x1 - l1 / 4, y1 - l1 / 4, x1 + l1 / 4, y1 - l1 / 4);
}

void ag(int ax, int ay, int r = 40)
{
	setlinestyle(0, 0, 3);
	ellipse(ax - r + (r / 8), ay - r, 250, 10, r / 2 * 3, r / 3 * 2);
	ellipse(ax - r + (r / 8), ay - r, 260, 10, r / 4 * 3, r / 4);
	ellipse(ax - r + (r / 8), ay - r, 260, 10, r / 4 * 3 - (r / 9),
			r / 4 - (r / 8));
	ellipse(ax - r + (r / 8) + (r / 5) + (r / 8), ay - r, 0, 210,
			r / 3 + (r / 9), r / 2);
	circle(ax - (r / 3) + (r / 6), ay - r, r / 12);
	line(ax - (r * 5 / 3) + (r / 10) + (r / 6),
		 ay - (r / 6) - (r / 8) - (r / 10), ax - r + (r / 8),
		 ay - r + (r / 8));
	line(ax - (r / 3) + (r / 6), ay - r, ax + (r / 3) + (r / 6) + (r / 8),
		 ay - r - (r / 8));
	ellipse(ax, ay, 160, 310, r - (r / 4), r);
	ellipse(ax + (r / 8), ay - (r / 8), 165, 310, r - (r / 4), r);
	line(ax + (r / 3), ay - (r / 8), ax + (r / 3), ay + r);
	line(ax + (r / 3) + (r / 8), ay - (r / 8), ax + (r / 3) + (r / 8), ay + r);
}

void aa(int ax, int ay, int r = 40)
{
	setlinestyle(0, 0, 3);
	line(ax - (r / 8), ay - (r / 2) + (r / 11), ax - (r / 4 * 3),
		 ay + (r / 4 * 3));
	line(ax - (r / 8) - (r / 8), ay - (r / 2) + (r / 11),
		 ax - (r / 4 * 3) - (r / 8), ay + (r / 4 * 3));
	line(ax, ay - (r / 2), ax + (r / 4 * 3) - (r / 8), ay + (r / 4 * 3));
	line(ax + (r / 4 * 3) - (r / 8), ay + (r / 4 * 3), ax + r - (r / 8),
		 ay + (r / 4 * 3));
	line(ax - (r / 4 * 3), ay + (r / 4 * 3), ax - r, ay + (r / 4 * 3));
	line(ax - (r / 2), ay + (r / 4), ax + (r / 3) + (r / 12), ay + (r / 4));
	ellipse(ax - r + (r / 8), ay - r, 250, 10, r / 2 * 3, r / 3 * 2);
	ellipse(ax - r + (r / 8), ay - r, 260, 10, r / 4 * 3, r / 4);
	ellipse(ax - r + (r / 8), ay - r, 260, 10, r / 4 * 3 - (r / 9),
			r / 4 - (r / 8));
	ellipse(ax - r + (r / 8) + (r / 5) + (r / 8), ay - r, 0, 210,
			r / 3 + (r / 9), r / 2);
	circle(ax - (r / 3) + (r / 6), ay - r, r / 12);
	line(ax - (r * 5 / 3) + (r / 10) + (r / 6),
		 ay - (r / 6) - (r / 8) - (r / 10), ax - r + (r / 8),
		 ay - r + (r / 8));
	line(ax - (r / 3) + (r / 6), ay - r, ax + (r / 3) + (r / 6) + (r / 8),
		 ay - r - (r / 8));
}
