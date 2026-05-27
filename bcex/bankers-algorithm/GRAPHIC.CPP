#if !defined(__STDIO_H)
#include <stdio.h>
#endif

#if !defined(__CONIO_H)
#include <conio.h>
#endif

//generate lines with character and effects
void line(int n, int b = 0, char c = '*')
{
	if (!b)
	{
		for (int i = 0; i < n; i++)
			cprintf("%c", c);
	}
	else
	{
		int j = 0;
		for (int i = 0; i < n; i++)
		{
			if (j == 1)
			{
				textcolor(BLACK + BLINK);
				cprintf("%c", c);
				j = 0;
			}
			else
			{
				textcolor(BLACK);
				cprintf("%c", c);
				j = 1;
			}
		}
	}
}

//set title of program
void title(void)
{
	gotoxy(23, 2);
	textcolor(YELLOW);
	cprintf("B a n k e r 's  A l g o r i t h m");
	textcolor(WHITE);
	gotoxy(1, 1);
	line(80, 0, (char)196);
	gotoxy(1, 3);
	line(80, 0, (char)196);
}

//generate box at specified position with double line
void box(int a, int b, int c, int d)
{
	textcolor(WHITE);
	gotoxy(a, b);
	line(d, 0, (char)205);
	gotoxy(a, c);
	line(d, 0, (char)205);
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
}