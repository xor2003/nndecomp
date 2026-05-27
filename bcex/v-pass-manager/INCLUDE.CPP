//---------------------------------------------------------------------------
//---------------------------INCLUDE FILE SECTION----------------------------
//---------------------------------------------------------------------------

//include header files that to be needed for functions
#include <iostream.h>
#include <stdio.h>
#include <conio.h>
#include <dos.h>
#include <string.h>
#include <stdlib.h>
#include <fstream.h>

//global variables
char choice;
int data[4] = {0}, menu = 0;

//common functions for formatting purpous
//---------------------------------------------------------------------------
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

//generate lines with 0s and 1s
void comp(int n, int s = 0, int c = 0)
{
	if (s)
	{
		for (int i = 0; i < (n / 2); i++)
		{
			cprintf("%d ", c);

			if (c == 0)
				c = 1;
			else
				c = 0;
		}
	}
	else
	{
		for (int i = 0; i < n; i++)
		{
			cprintf("%d", c);

			if (c == 0)
				c = 1;
			else
				c = 0;
		}
	}
}

//generate border with 0s and 1s
void border(void)
{
	int c;
	textcolor(WHITE);
	textbackground(1);
	gotoxy(1, 1);
	comp(80, 1);
	gotoxy(1, 25);
	comp(79, 1);
	c = 1;
	for (int i = 0; i < 23; i++)
	{
		gotoxy(1, i + 2);

		cprintf("%d", c);

		if (c == 0)
			c = 1;
		else
			c = 0;
	}

	c = 0;
	for (i = 0; i < 23; i++)
	{
		gotoxy(80, i + 2);

		cprintf("%d", c);

		if (c == 0)
			c = 1;
		else
			c = 0;
	}
	gotoxy(78, 25);
	cprintf(" 1");
}

//set title of program
void title(void)
{
	gotoxy(26, 2);
	textcolor(RED);
	cprintf("V P a s s  M a n a g e r");
	textcolor(BLACK);
	gotoxy(1, 3);
	line(78, 0, (char)196);
	gotoxy(1, 5);
	line(78, 0, (char)196);
}

//generate box at specified position with double line
void box(int a, int b, int c, int d)
{
	textcolor(BLACK);
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

//generate box at specified position with single line
void boxi(int a, int b, int c, int d, int e = 0)
{
	if (e)
		textcolor(BLACK + BLINK);
	else
		textcolor(BLACK);
	gotoxy(a, b);
	line(d, 0, (char)196);
	gotoxy(a, c);
	line(d, 0, (char)196);
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
}

//---------------------------------------------------------------------------