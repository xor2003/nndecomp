#include <iostream.h>
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include "graphic.cpp"
#include "define.cpp"

int main()
{
	BANKER banker;

	if (!banker.isSAFESTATE())
	{
		banker.dealloc();
		exit(1);
	}

	char choice;
	do
	{
		clrscr();
		title();
		box(1, 1, 24, 80);
		gotoxy(20, 6);
		cout << "\t1. Modify DataSheet";
		gotoxy(20, 8);
		cout << "\t2. Current SnapShot";
		gotoxy(20, 10);
		cout << "\t3. SafeState Check";
		gotoxy(20, 12);
		cout << "\t4. SafeSequence of Process";
		gotoxy(20, 14);
		cout << "\t5. Request Resources";
		gotoxy(20, 16);
		cout << "\t6. Check Completed Process";
		gotoxy(20, 18);
		cout << "\t0. Quit";

		gotoxy(32, 25);
		cout << "...Press number...";

		_setcursortype(_NOCURSOR);
		fflush(stdin);
		choice = getch();

		switch (choice)
		{
		case '1':
			_setcursortype(_NORMALCURSOR);
			clrscr();
			banker.initDATA(1);
			cout << endl;
			banker.validateDATA();
			banker.checkPRO();
			cout << endl;
			banker.calcDATA();
			cout << endl
				 << "press any key to continue...";
			getch();
			break;

		case '2':
			_setcursortype(_NOCURSOR);
			clrscr();
			banker.snapshot(1);
			gotoxy(26, 24);
			cout << "press any key to continue...";
			getch();
			break;

		case '3':
			_setcursortype(_NOCURSOR);
			clrscr();
			banker.snapshot(1);
			cout << endl
				 << endl;
			if (banker.isSAFESTATE())
				cout << endl
					 << "SnapShot is in SafeState.";
			else
				cout << endl
					 << "SnapShot is in UnSafeState.";
			gotoxy(26, 24);
			cout << "press any key to continue...";
			getch();
			break;

		case '4':
			_setcursortype(_NOCURSOR);
			clrscr();
			banker.snapshot(1);
			cout << endl;
			banker.findSAFESEQ();
			gotoxy(26, 24);
			cout << "press any key to continue...";
			getch();
			break;

		case '5':
			_setcursortype(_SOLIDCURSOR);
			clrscr();
			banker.snapshot();
			cout << endl;
			banker.requestRES();
			cout << endl
				 << "press any key to continue...";
			getch();
			break;

		case '6':
			_setcursortype(_SOLIDCURSOR);
			clrscr();
			cout << endl;
			banker.checkPRO();
			gotoxy(26, 24);
			cout << "press any key to continue...";
			getch();
			break;

		case '0':
			_setcursortype(_NOCURSOR);
			gotoxy(31, 21);
			cout << "T H A N K   Y O U";
			gotoxy(28, 25);
			cout << "press any key to exit...";
			getch();
			goto EXIT;

		default:
			_setcursortype(_NOCURSOR);
			gotoxy(28, 22);
			cout << "Please enter valid choice.";
			gotoxy(26, 25);
			cout << "press any key to continue...";
			getch();
			break;
		}
	} while (1);
EXIT:
	return 0;
}
