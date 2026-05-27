// 	Hotel Reservation

#include "rooms.h"
#include "customer.h"

using namespace std;

int DD, MM, YY;

void box(int x1, int y1, int x2, int y2, int line)
{
	char hor = 186;
	for (int i = x1; i <= x2; i++)
	{
		gotoxy(i, y1);
		cout << hor;
		if (line == 1)
		{
			gotoxy(i, y1 + 4);
			cout << hor;
		}
		gotoxy(i, y2);
		cout << hor;
	}
	for (i = y1; i <= y2; i++)
	{
		gotoxy(x1, i);
		cout << hor;
		gotoxy(x2, i);
		cout << hor;
	}
}

void main()
{
	clrscr();
	struct date d;
	getdate(&d);
	DD = 1 * d.da_day;
	MM = 1 * d.da_mon;
	YY = 1 * d.da_year;
	gotoxy(29, 12);
	cout << "Today's Date :" << DD << "/" << MM << "/" << YY;
	box(27, 10, 53, 14, 1);
	getch();
	int choice;
	do
	{
		clrscr();
		clrscr();
		box(20, 6, 60, 23, 1);
		gotoxy(24, 4);
		cout << "H O T E L   R E S E R V A T I O N";
		gotoxy(28, 8);
		cout << "O P E N I N G   M E N U";
		gotoxy(32, 12);
		cout << "1. Introduction";
		gotoxy(32, 13);
		cout << "2. Inquiry";
		gotoxy(32, 14);
		cout << "3. Check in";
		gotoxy(32, 15);
		cout << "4. Check out";
		gotoxy(32, 16);
		cout << "5. Room status";
		gotoxy(32, 17);
		cout << "6. Reports";
		gotoxy(32, 18);
		cout << "7. Generate Database";
		gotoxy(32, 19);
		cout << "0. Exit";
		gotoxy(32, 21);
		cout << "Enter choice : ";
		cin >> choice;

		CUSTOMER c;
		ROOMS r;

		switch (choice)
		{
		case 1:
			c.intro();
			break;
		case 2:
		{
			int choice;
			do
			{
				clrscr();
				box(25, 5, 55, 20, 1);
				gotoxy(34, 7);
				cout << "I N Q U I R Y";
				;
				gotoxy(31, 11);
				cout << "1. To search by NAME";
				gotoxy(31, 13);
				cout << "2. To search by ROOM NO.";
				gotoxy(31, 15);
				cout << "0. Exit";
				gotoxy(31, 18);
				cout << "Enter choice : ";
				cin >> choice;
				switch (choice)
				{
				case 1:
					c.inquiryRoomNo();
					break;
				case 2:
					c.inquiryCust();
					break;
				}
			} while (choice != 0);
			break;
		}
		case 3:
			c.check_in();
			break;
		case 4:
			c.check_out();
			break;
		case 5:
			r.status();
			break;
		case 6:
			c.reports();
			break;
		case 7:
			r.genDatabase();
			break;
		}
	} while (choice != 0);
}
