//---------------------------------------------------------------------------
//---------------------- VPASS MANAGER --- MAIN MODULE ----------------------
//---------------------------------------------------------------------------

//include files
#include "INCLUDE.CPP"
#include "ENCRYPT.CPP"
#include "LICENSE.CPP"
#include "MENUHELP.CPP"
#include "ABTHELP.CPP"
#include "MENU.CPP"

//main() function
void main()
{
	int passn = 0;
	clrscr();
	textbackground(WHITE);
	textcolor(BLACK);
	line(1920, 0, ' ');
	textbackground(BLUE);
	line(80, 0, ' ');
	gotoxy(2, 24);
	textbackground(WHITE);
	line(78, 0, ' ');
	border();
	window(2, 2, 79, 24);
wc:
	if (menu)
		clrscr();
	menu = 0;
	textbackground(WHITE);
	gotoxy(1, 5);
	line(78, 1, (char)247);
	gotoxy(1, 7);
	line(78, 1, (char)247);
	gotoxy(27, 6);
	textcolor(RED);
	cprintf("V P a s s  M a n a g e r");

	box(15, 10, 18, 48);
	textcolor(BLUE);
	gotoxy(33, 12);
	cprintf("1. SIGN IN");
	gotoxy(33, 14);
	cprintf("2. SIGN UP");
	gotoxy(33, 16);
	cprintf("3. EXIT");

	textcolor(BLACK);
	gotoxy(29, 22);
	cprintf("... Press Number ...");
	_setcursortype(_NOCURSOR);

	choice = getch();

	switch (choice)
	{
	case '1':
		textcolor(BLUE + BLINK);
		gotoxy(33, 12);
		cprintf("1. SIGN IN");
		delay(500);
	log_in:
		clrscr();
		textbackground(WHITE);
		gotoxy(1, 5);
		line(78, 1, (char)247);
		gotoxy(1, 7);
		line(78, 1, (char)247);
		gotoxy(27, 6);
		textcolor(RED);
		cprintf("V P a s s  M a n a g e r");

		box(15, 10, 18, 48);

		textcolor(5);
		gotoxy(18, 12);
		cprintf("LOG-IN ID : ");
		gotoxy(18, 14);
		cprintf("PASSWORD  : ");
		gotoxy(25, 16);
		cprintf("S");
		gotoxy(49, 16);
		cprintf("C");
		gotoxy(38, 16);
		cprintf("R");
		textcolor(BLUE);
		gotoxy(26, 16);
		cprintf("IGN IN");
		gotoxy(50, 16);
		cprintf("ANCAL");
		gotoxy(39, 16);
		cprintf("ESET");
		textbackground(CYAN);
		gotoxy(30, 12);
		cprintf("                              ");
		gotoxy(30, 14);
		cprintf("                              ");

		textbackground(WHITE);
		textcolor(BLACK);
		gotoxy(19, 21);
		cprintf("Type Username , Press Enter to continue...");

		_setcursortype(_SOLIDCURSOR);
		textbackground(CYAN);
		textcolor(BLACK);
		gotoxy(30, 12);
		char c, username[20];
		passn = 0;
		fflush(stdin);
		username[0] = '\0';
		while (c)
		{
			if (passn == 19)
				break;
			fflush(stdin);
			c = getch();
			if (passn == 0 && (c == (char)13 || c == '\t'))
			{
				_setcursortype(_NOCURSOR);
				textbackground(WHITE);
				gotoxy(20, 20);
				cprintf("                                        ");
				gotoxy(19, 21);
				cprintf("                                               ");
				gotoxy(24, 22);
				cprintf("                                ");
				delay(500);
				textcolor(BLACK + BLINK);
				gotoxy(24, 20);
				cprintf("Username field cannot be blank.");
				textcolor(BLACK);
				gotoxy(25, 22);
				cprintf("Press any key to continue...");
				getch();
				goto log_in;
			}
			if (c == (char)13)
				break;
			else if (c == ' ')
				continue;
			else if (c == '\b')
			{
				if (passn != 0)
				{
					passn--;
					cprintf("\b \b");
				}
				else
					continue;
				continue;
			}
			else if (c == '\t')
				break;
			else if (c == (char)27)
			{
				menu = 1;
				textbackground(WHITE);
				goto wc;
			}
			else
			{
				username[passn] = c;
				cprintf("%c", c);
				passn++;
			}
		}
		username[passn] = '\0';
		fflush(stdin);

	password:
		if (passn == 99)
		{
			gotoxy(20, 20);
			cprintf("                                        ");
			gotoxy(29, 21);
			cprintf("                      ");
			gotoxy(24, 22);
			cprintf("                                ");
			gotoxy(30, 14);
			textbackground(CYAN);
			cprintf("                              ");
		}
		_setcursortype(_NOCURSOR);
		textbackground(WHITE);
		textcolor(BLACK);
		gotoxy(19, 21);
		cprintf("                                               ");
		gotoxy(20, 21);
		cprintf("Type Password , Press Enter to continue...");
		_setcursortype(_SOLIDCURSOR);
		gotoxy(30, 14);
		textbackground(CYAN);
		textcolor(BLACK);
		char password[20];
		password[0] = '\0';
		passn = 0;
		while (c)
		{
			if (passn == 19)
				break;
			fflush(stdin);
			c = getch();
			if (passn == 0 && (c == (char)13 || c == '\t'))
			{
				_setcursortype(_NOCURSOR);
				textbackground(WHITE);
				gotoxy(20, 20);
				cprintf("                                        ");
				gotoxy(19, 21);
				cprintf("                                               ");
				gotoxy(24, 22);
				cprintf("                                ");
				delay(500);
				textcolor(BLACK + BLINK);
				gotoxy(24, 20);
				cprintf("Password field cannot be blank.");
				textcolor(BLACK);
				gotoxy(25, 22);
				cprintf("Press any key to continue...");
				getch();
				goto log_in;
			}
			if (c == (char)13)
				break;
			else if (c == '\b')
			{
				if (passn != 0)
				{
					passn--;
					cprintf("\b \b");
				}
				else
					continue;
				continue;
			}
			else if (c == '\t')
				break;
			else if (c == (char)27)
				continue;
			else if (c == ' ')
				continue;
			else
			{
				password[passn] = c;
				passn++;
				cprintf("*");
			}
		}
		password[passn] = '\0';

		_setcursortype(_NOCURSOR);
		textbackground(WHITE);
		textcolor(BLACK);
		gotoxy(19, 21);
		cprintf("                                               ");
		gotoxy(22, 20);
		cprintf("FOR SIGN - IN , PRESS 'S' or 'ENTER'.");
		gotoxy(29, 21);
		cprintf("FOR RESET , PRESS 'R'.");
		gotoxy(24, 22);
		cprintf("FOR CANCAL , PRESS 'C' or 'ESC'.");
		choice = getch();

		if (choice == 's' || choice == 'S' || choice == (char)13)
		{
			int check = AUTHORIZE(username, password);
			if (check == 1)
			{
				gotoxy(20, 20);
				cprintf("                                        ");
				gotoxy(29, 21);
				cprintf("                      ");
				gotoxy(24, 22);
				cprintf("                                ");
				boxi(24, 15, 17, 9);
				delay(500);
				gotoxy(19, 20);
				textcolor(BLACK + BLINK);
				cprintf("YOU HAVE SUCCESSFULLY LOGGED INTO ACCOUNT.");
				gotoxy(25, 22);
				textcolor(BLACK);
				cprintf("Press any key to continue...");
				getch();
				MENU();
				menu = 1;
				goto wc;
			}
			else if (check == 2)
			{
				gotoxy(20, 20);
				cprintf("                                        ");
				gotoxy(29, 21);
				cprintf("                      ");
				gotoxy(24, 22);
				cprintf("                                ");
				boxi(24, 15, 17, 9);
				delay(500);
				gotoxy(26, 20);
				textcolor(BLACK + BLINK);
				cprintf("Password could not match.");
				gotoxy(25, 22);
				textcolor(BLACK);
				cprintf("Press any key to continue...");
				getch();
				passn = 99;
				goto password;
			}
			else
			{
				gotoxy(20, 20);
				cprintf("                                        ");
				gotoxy(29, 21);
				cprintf("                      ");
				gotoxy(24, 22);
				cprintf("                                ");
				boxi(24, 15, 17, 9);
				delay(500);
				gotoxy(24, 20);
				textcolor(BLACK + BLINK);
				cprintf("PLEASE ENTER VALID DATA INPUT.");
				gotoxy(25, 22);
				textcolor(BLACK);
				cprintf("Press any key to continue...");
				getch();
				goto log_in;
			}
		}

		if (choice == 'c' || choice == 'C' || choice == (char)27)
		{
			boxi(48, 15, 17, 8);
			delay(500);
			menu = 1;
			goto wc;
		}

		if (choice == 'r' || choice == 'R')
		{
			boxi(37, 15, 17, 7);
			delay(500);
			goto log_in;
		}

		if (!(choice == 's' || choice == 'S' || choice == (char)13 || choice == 'r' || choice == 'R' ||
			  choice == 'c' || choice == 'C' || choice == (char)27))
		{
			textcolor(BLACK + BLINK);
			gotoxy(23, 23);
			cprintf("Please Select valid choice number.");
			getch();
			gotoxy(23, 23);
			cprintf("                                  ");
			goto log_in;
		}

	case '2':
		textcolor(BLUE + BLINK);
		gotoxy(33, 14);
		cprintf("2. SIGN UP");
		delay(500);
		clrscr();
		choice = license(1);

		if (choice == 2)
			exit(1);

		if (choice == 1)
		{
			menu = 1;
			goto wc;
		}

		break;

	case (char)27:
	case '3':
		textcolor(BLUE + BLINK);
		gotoxy(33, 16);
		cprintf("3. EXIT");
		delay(500);
	fexit:
		clrscr();
		textbackground(WHITE);
		gotoxy(1, 5);
		line(78, 1, (char)247);
		gotoxy(1, 7);
		line(78, 1, (char)247);
		gotoxy(27, 6);
		textcolor(RED);
		cprintf("V P a s s  M a n a g e r");

		box(15, 10, 18, 48);
		gotoxy(23, 10);
		cprintf("%c THANKS FOR USING APPLICATION %c", (char)181, (char)198);

		textcolor(BLUE);
		gotoxy(28, 12);
		cprintf("Do you want to EXIT ?");
		gotoxy(33, 14);
		cprintf("1. Y E S");
		gotoxy(33, 16);
		cprintf("2. N O");

		textcolor(BLACK);
		gotoxy(29, 22);
		cprintf("... Press Number ...");

		choice = getch();

		switch (choice)
		{
		case '1':
			textcolor(BLUE + BLINK);
			gotoxy(33, 14);
			cprintf("1. Y E S");
			delay(500);
			exit(0);

		case (char)27:
		case '2':
			textcolor(BLUE + BLINK);
			gotoxy(33, 16);
			cprintf("2. N O");
			delay(500);
			menu = 1;
			goto wc;

		default:
			textcolor(BLACK + BLINK);
			gotoxy(23, 23);
			cprintf("Please Select valid choice number.");
			getch();
			gotoxy(23, 23);
			cprintf("                                  ");
			goto fexit;
		}

	default:
		textcolor(BLACK + BLINK);
		gotoxy(23, 23);
		cprintf("Please Select valid choice number.");
		getch();
		gotoxy(23, 23);
		cprintf("                                  ");
		menu = 1;
		goto wc;
	}
}