//draw line with specified character
void line(int n, char c)
{
	for (int i = 0; i < n; i++)
		cprintf("%c", c);
}

//draw outline of menu with partition
void boxi(int a, int b, int c, int d, int p1 = 0, int p2 = 0)
{
	textcolor(BLACK);
	gotoxy(a, b);
	line(d, (char)196);
	gotoxy(a, c);
	line(d, (char)196);
	for (int i = b + 1; i < c; i++)
	{
		gotoxy(a, i);
		cprintf("%c", (char)179);
		gotoxy(a + d - 1, i);
		cprintf("%c", (char)179);
	}
	gotoxy(a, b);
	cprintf("%c", (char)218);
	gotoxy(a, c);
	cprintf("%c", (char)192);
	gotoxy(a + d - 1, b);
	cprintf("%c", (char)191);
	gotoxy(a + d - 1, c);
	cprintf("%c", (char)217);

	if (p1)
	{
		gotoxy(a, b + p1);
		cprintf("%c", (char)195);
		line(d - 2, (char)196);
		cprintf("%c", (char)180);
	}
	if (p2)
	{
		gotoxy(a, b + p2);
		cprintf("%c", (char)195);
		line(d - 2, (char)196);
		cprintf("%c", (char)180);
	}
}

//draw window's border
void windowBorder(int a, int b, int c, int d)
{
	textcolor(WHITE);
	textbackground(BLUE);
	gotoxy(a, b);
	line(d, (char)205);
	gotoxy(a, c);
	line(d, (char)205);
	for (int i = b + 1; i < c; i++)
	{
		gotoxy(a, i);
		cprintf("%c", (char)186);
		gotoxy(a + d - 1, i);
		cprintf("%c", (char)186);
	}
	gotoxy(a, b);
	cprintf("%c", (char)201);
	gotoxy(a, c);
	cprintf("%c", (char)200);
	gotoxy(a + d - 1, b);
	cprintf("%c", (char)187);
	gotoxy(a + d - 1, c);
	cprintf("%c", (char)188);

	gotoxy(a + 2, b);
	cprintf("[ ]");
	gotoxy(a + 73, b);
	cprintf("1 [ ]");
	gotoxy(a + 74, b);
	cprintf("%c", (char)205);
	textcolor(GREEN);
	gotoxy(a + 3, b);
	cprintf("%c", (char)254);
	gotoxy(a + 76, b);
	cprintf("%c", (char)241);
}