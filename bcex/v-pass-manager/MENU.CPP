//---------------------------------------------------------------------------
//----------------------MAIN MENU USER INTERFACE FILE------------------------
//---------------------------------------------------------------------------

//function for main user interface of programme
void MENU(void)
{
	clrscr();
menu:
	if (menu)
		clrscr();
	menu = 0;
	textbackground(WHITE);
	title();
	textcolor(BLACK);
	gotoxy(31, 4);
	cprintf("M A I N  M E N U");
	textcolor(BLUE);
	gotoxy(28, 6);
	cprintf("1. Add Data");
	gotoxy(28, 8);
	cprintf("2. View Data");
	gotoxy(28, 10);
	cprintf("3. Delete Data");
	gotoxy(28, 12);
	cprintf("4. Export to .TXT File");
	gotoxy(28, 14);
	cprintf("5. Recovery Data");
	gotoxy(28, 16);
	cprintf("6. Settings");
	gotoxy(28, 18);
	cprintf("7. Help");
	gotoxy(28, 20);
	cprintf("8. Log Out");

	textcolor(BLACK);
	gotoxy(29, 22);
	cprintf("... Press Number ...");
	_setcursortype(_NOCURSOR);

	choice = getch();

	switch (choice)
	{
	case '1':
	menu1:
		clrscr();
		title();
		textcolor(BLACK);
		_setcursortype(_NOCURSOR);
		gotoxy(36, 4);
		cprintf("ADD DATA");
		textcolor(BLUE);
		gotoxy(30, 7);
		cprintf("1. E-mail Account");
		gotoxy(30, 9);
		cprintf("2. Bank Account");
		gotoxy(30, 11);
		cprintf("3. Personal Note");
		gotoxy(30, 13);
		cprintf("4. Go Back");

		textcolor(BLACK);
		gotoxy(29, 22);
		cprintf("... Press Number ...");

		choice = getch();

		switch (choice)
		{
		case '1':
			break;

		case '2':
			break;

		case '3':
			break;

		case (char)27:
		case '4':
			menu = 1;
			goto menu;

		default:
			textcolor(BLACK + BLINK);
			gotoxy(23, 23);
			cprintf("Please Select valid choice number.");
			getch();
			gotoxy(23, 23);
			cprintf("                                  ");
			menu = 1;
			goto menu1;
		}

		break;

	case '2':
	menu2:
		clrscr();
		title();
		textcolor(BLACK);
		_setcursortype(_NOCURSOR);
		gotoxy(36, 4);
		cprintf("VIEW DATA");
		textcolor(BLUE);
		gotoxy(30, 7);
		cprintf("1. E-mail Account  (%2d)", data[1]);
		gotoxy(30, 9);
		cprintf("2. Bank Account    (%2d)", data[2]);
		gotoxy(30, 11);
		cprintf("3. Personal Note   (%2d)", data[3]);
		gotoxy(30, 13);
		cprintf("4. Go Back");

		textcolor(BLACK);
		gotoxy(29, 22);
		cprintf("... Press Number ...");

		choice = getch();

		switch (choice)
		{
		case '1':
			break;

		case '2':
			break;

		case '3':
			break;

		case (char)27:
		case '4':
			menu = 1;
			goto menu;

		default:
			textcolor(BLACK + BLINK);
			gotoxy(23, 23);
			cprintf("Please Select valid choice number.");
			getch();
			gotoxy(23, 23);
			cprintf("                                  ");
			menu = 1;
			goto menu2;
		}

		break;

	case '3':
	menu3:
		clrscr();
		title();
		textcolor(BLACK);
		_setcursortype(_NOCURSOR);
		gotoxy(34, 4);
		cprintf("DELETE DATA");
		textcolor(BLUE);
		gotoxy(30, 7);
		cprintf("1. E-mail Account  (%2d)", data[1]);
		gotoxy(30, 9);
		cprintf("2. Bank Account    (%2d)", data[2]);
		gotoxy(30, 11);
		cprintf("3. Personal Note   (%2d)", data[3]);
		gotoxy(30, 13);
		cprintf("4. Go Back");

		textcolor(BLACK);
		gotoxy(10, 19);
		cprintf("Information : ");
		gotoxy(24, 19);
		cprintf("Please note that your data will not parmanetly");
		gotoxy(24, 20);
		cprintf("deleted untill you delete Recovery Files.");

		gotoxy(29, 22);
		cprintf("... Press Number ...");

		choice = getch();

		switch (choice)
		{
		case '1':
			break;

		case '2':
			break;

		case '3':
			break;

		case (char)27:
		case '4':
			menu = 1;
			goto menu;

		default:
			textcolor(BLACK + BLINK);
			gotoxy(23, 23);
			cprintf("Please Select valid choice number.");
			getch();
			gotoxy(23, 23);
			cprintf("                                  ");
			menu = 1;
			goto menu3;
		}

		break;

	case '4':
	menu4:
		clrscr();
		title();
		textcolor(BLACK);
		_setcursortype(_NOCURSOR);
		gotoxy(33, 4);
		cprintf("EXPORT DATA");
		textcolor(BLACK);
		gotoxy(10, 9);
		cprintf("Information : ");
		gotoxy(24, 9);
		cprintf("For Security Reasons, your BANK A/C. Data will");
		gotoxy(24, 10);
		cprintf("not be exported to .txt file.");

		boxi(15, 12, 19, 48);
		textcolor(BLUE);
		gotoxy(22, 13);
		cprintf("Do you still want to continue ? ");
		gotoxy(33, 15);
		cprintf("1. Y E S");
		gotoxy(33, 17);
		cprintf("2. N O");

		textcolor(BLACK);
		gotoxy(29, 22);
		cprintf("... Press Number ...");

		choice = getch();

		switch (choice)
		{
		case '1':
			clrscr();
			title();
			textcolor(BLACK);
			_setcursortype(_NOCURSOR);
			gotoxy(33, 4);
			cprintf("EXPORT DATA");
			boxi(15, 10, 16, 50);
			textcolor(RED);
			gotoxy(21, 12);
			cprintf("This option is currently disabled for");
			gotoxy(21, 14);
			cprintf("    current version of application.   ");
			gotoxy(25, 22);
			textcolor(BLACK + BLINK);
			cprintf("Press any key to continue...");
			getch();
			goto menu4;

		case (char)27:
		case '2':
			menu = 1;
			goto menu;

		default:
			textcolor(BLACK + BLINK);
			gotoxy(23, 23);
			cprintf("Please Select valid choice number.");
			getch();
			gotoxy(23, 23);
			cprintf("                                  ");
			menu = 1;
			goto menu4;
		}

	case '5':
	menu5:
		clrscr();
		title();
		textcolor(BLACK);
		_setcursortype(_NOCURSOR);
		gotoxy(32, 4);
		cprintf("RECOVERY DATA");
		textcolor(BLACK);
		gotoxy(10, 9);
		cprintf("Information : ");
		gotoxy(24, 9);
		cprintf("For your kind knowledge, your current data will be");
		gotoxy(24, 10);
		cprintf("overwritten with your Recovery File Data.");

		boxi(15, 12, 19, 48);
		textcolor(BLUE);
		gotoxy(22, 13);
		cprintf("Do you still want to continue ? ");
		gotoxy(33, 15);
		cprintf("1. Y E S");
		gotoxy(33, 17);
		cprintf("2. N O");

		textcolor(BLACK);
		gotoxy(29, 22);
		cprintf("... Press Number ...");

		choice = getch();

		switch (choice)
		{
		case '1':
			clrscr();
			title();
			textcolor(BLACK);
			_setcursortype(_NOCURSOR);
			gotoxy(32, 4);
			cprintf("RECOVERY DATA");
			boxi(15, 10, 16, 50);
			textcolor(RED);
			gotoxy(21, 12);
			cprintf("This option is currently disabled for");
			gotoxy(21, 14);
			cprintf("    current version of application.   ");
			gotoxy(25, 22);
			textcolor(BLACK + BLINK);
			cprintf("Press any key to continue...");
			getch();
			goto menu5;

		case (char)27:
		case '2':
			menu = 1;
			goto menu;

		default:
			textcolor(BLACK + BLINK);
			gotoxy(23, 23);
			cprintf("Please Select valid choice number.");
			getch();
			gotoxy(23, 23);
			cprintf("                                  ");
			menu = 1;
			goto menu5;
		}

	case '6':
	menu6:
		clrscr();
		title();
		textcolor(BLACK);
		_setcursortype(_NOCURSOR);
		gotoxy(34, 4);
		cprintf("SETTINGS");

		textcolor(BLUE);
		gotoxy(28, 7);
		cprintf("1. View Profile");
		gotoxy(28, 9);
		cprintf("2. Edit Profile");
		gotoxy(28, 11);
		cprintf("3. Change Password");
		gotoxy(28, 13);
		cprintf("4. Change Security Question");
		gotoxy(28, 15);
		cprintf("5. Enable Protection");
		gotoxy(28, 17);
		cprintf("6. Delete Account");
		gotoxy(28, 19);
		cprintf("7. Go Back");

		textcolor(BLACK);
		gotoxy(29, 22);
		cprintf("... Press Number ...");

		choice = getch();

		switch (choice)
		{
		case '1':
			break;

		case (char)27:
		case '7':
			menu = 1;
			goto menu;

		default:
			textcolor(BLACK + BLINK);
			gotoxy(23, 23);
			cprintf("Please Select valid choice number.");
			getch();
			gotoxy(23, 23);
			cprintf("                                  ");
			menu = 1;
			goto menu6;
		}

		break;

	case '7':
	menu7:
		clrscr();
		title();
		textcolor(BLACK);
		_setcursortype(_NOCURSOR);
		gotoxy(26, 4);
		cprintf("? ? ?   H E L P   ? ? ?");

		textcolor(BLUE);
		gotoxy(28, 7);
		cprintf("1. Know your MAIN MENU");
		gotoxy(28, 9);
		cprintf("2. END USER LICENSE AGREEMENT and");
		gotoxy(28, 10);
		cprintf("   PRIVACY POLICY");
		gotoxy(28, 12);
		cprintf("3. About Us");
		gotoxy(28, 14);
		cprintf("4. Go Back");

		textcolor(BLACK);
		gotoxy(29, 22);
		cprintf("... Press Number ...");

		choice = getch();

		switch (choice)
		{
		case '1':
			menuhelp();
			goto menu7;

		case '2':
			choice = license(0);
			goto menu7;

		case '3':
			abouthelp();
			goto menu7;

		case (char)27:
		case '4':
			menu = 1;
			goto menu;

		default:
			textcolor(BLACK + BLINK);
			gotoxy(23, 23);
			cprintf("Please Select valid choice number.");
			getch();
			gotoxy(23, 23);
			cprintf("                                  ");
			menu = 1;
			goto menu7;
		}

	case (char)27:
	case '8':
	menu8:
		clrscr();
		title();
		textcolor(BLACK);
		_setcursortype(_NOCURSOR);
		gotoxy(25, 4);
		cprintf("THANKS FOR USING APPLICATION");

		boxi(15, 11, 19, 48);
		textcolor(BLUE);
		gotoxy(26, 13);
		cprintf("Do you want to LOG OUT ? ");
		gotoxy(33, 15);
		cprintf("1. Y E S");
		gotoxy(33, 17);
		cprintf("2. N O");

		textcolor(BLACK);
		gotoxy(29, 22);
		cprintf("... Press Number ...");

		choice = getch();

		switch (choice)
		{
		case '1':
			break;

		case (char)27:
		case '2':
			menu = 1;
			goto menu;

		default:
			textcolor(BLACK + BLINK);
			gotoxy(23, 23);
			cprintf("Please Select valid choice number.");
			getch();
			gotoxy(23, 23);
			cprintf("                                  ");
			menu = 1;
			goto menu8;
		}

		break;

	default:
		textcolor(BLACK + BLINK);
		gotoxy(23, 23);
		cprintf("Please Select valid choice number.");
		getch();
		gotoxy(23, 23);
		cprintf("                                  ");
		menu = 1;
		goto menu;
	}
}