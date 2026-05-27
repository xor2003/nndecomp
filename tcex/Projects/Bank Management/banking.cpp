#include "accountsmaster.h"

using namespace std;

void mainmenu();
void getlatestacno();
void modify();

int gacno = 1110;

struct dob
{
	int date;
	int month;
	int year;
};

void getlatestacno()
{
	ifstream ifile("Y:\\main.txt", ios::binary);
	accountsmaster m;
	while (ifile.read((char *)&m, sizeof(m)))
	{
		gacno = m.getacno();
	}
	gacno++;
	ifile.close();
}

void insert()
{
	clrscr();
	int c;
	cout << "\n                          Create new account:\n\n";
	cout << "\n			       		     1.Create\n";
	cout << "\n					     2.Exit\n";
	cout << "\n			   Enter the choice:";
	cin >> c;
	accountsmaster s;
	if (c == 1)
	{
		ofstream ofile("Y:\\main.txt", ios::binary | ios::app);
		s.getdata();
		ofile.write((char *)&s, sizeof(s));
		ofile.close();
	}
	else if (c == 2)
	{
	}
	else
	{
		cout << "\nEnter valid option.";
	}
}

void display()
{
	clrscr();
	cout << "\n                                Display details ";
	accountsmaster s;
	ifstream ifile("Y:\\main.txt", ios::binary);
	while (ifile.read((char *)&s, sizeof(s)))
	{
		s.showdata();
		cout << "\n";
		cout << "\nPress enter to continue..";
		getch();
	}
	clrscr();
	cout << "\n                        No more exiting accounts!";
	getch();
	ifile.close();
}

void isearch()
{
	clrscr();
	int choice;
	char ch;
	ifstream ifile("Y:\\main.txt", ios::binary);
	accountsmaster s;
	cout << "\n                          Search by: ";
	cout << "\n"
			"\n";
	cout << "\n                                   1.Account Number";
	cout << "\n";
	cout << "\n                                   2.Name";
	cout << "\n";
	cout << "\n                                   3.Exit";
	cout << "\n";
	cout << "\n                          Enter choice: ";
	cin >> choice;
	int found = 0;
	if (choice == 1)
	{
		int acc;
		cout << "\nEnter account number:";
		cin >> acc;
		while (ifile.read((char *)&s, sizeof(s)))
		{
			if (s.getacno() == acc)
			{
				found = 1;
				cout << "\nAccount found.\n";
				cout << "\nDo you want to see the details(y/n): ";
				cin >> ch;
				if (ch == 'y')
				{
					s.showdata();
					getch();
				}
				else if (ch == 'n')
				{
					getch();
				}
				break;
			}
		}
		if (found == 0)
		{
			cout << "\nNot found";
		}
	}
	else if (choice == 2)
	{
		char aname[30];
		cout << "\nEnter name of account:";
		gets(aname);
		while (ifile.read((char *)&s, sizeof(s)))
		{
			if (strcmp(aname, s.catc()) == 0)
			{
				found = 1;
				cout << "\nAccount found.";
				cout << "\nDo yo u want to see the details(y/n):";
				cin >> ch;
				if (ch == 'y')
				{
					s.showdata();
					getch();
				}
				else if (ch == 'n')
				{
					getch();
				}
				break;
			}
		}
		if (found == 0)
		{
			cout << "\nNot found.";
		}
	}
	else if (choice == 3)
	{
	}
	ifile.close();
}

void del()
{
	clrscr();
	int choice;
	char ch;
	ifstream ifile("Y:\\main.txt", ios::in | ios::binary);
	ofstream ofile("Y:\\temp.txt", ios::out | ios::binary);
	accountsmaster s;
	cout << "\n                              Delete by: \n\n";
	cout << "\n                                       1.Account Number\n";
	cout << "\n                                       2.Name\n";
	cout << "\n                                       3.Exit\n";
	cout << "\n                              Enter choice: ";
	cin >> choice;

	if (choice == 1)
	{
		int acno;
		cout << "\nEnter account number to be deleted: ";
		cin >> acno;
		while (ifile.read((char *)&s, sizeof(s)))
		{
			if (acno == s.getacno())
			{
				s.showdata();
				cout
					<< "\n\nAre you sure you want to delete the account?(y/n):";
				cin >> ch;
				if (ch == 'y')
				{
					cout << "\n\nDelete in progress...";
					getch();
				}
				else
				{
					ofile.write((char *)&s, sizeof(s));
				}
			}
			else
			{
				ofile.write((char *)&s, sizeof(s));
			}
		}
	}
	if (choice == 2)
	{
		char aname[30];
		cout << "\nEnter name of account holder to be deleted: ";
		gets(aname);
		while (ifile.read((char *)&s, sizeof(s)))
		{
			if (strcmp(aname, s.catc()) == 0)
			{
				s.showdata();
				cout
					<< "\n\nAre you sure you want to delete the account?(y/n):";
				cin >> ch;
				if (ch == 'y')
				{
					cout << "\n\nDelete in progress...";
					getch();
				}
				else
				{
					ofile.write((char *)&s, sizeof(s));
				}
			}
			else
			{
				ofile.write((char *)&s, sizeof(s));
			}
		}
	}
	if (choice == 3)
		return;
	ifile.close();
	ofile.close();
	remove("Y:\\main.txt");
	rename("Y:\\temp.txt", "Y:\\main.txt");
}

void modify()
{
	clrscr();
	int choice;
	char ch;
	int c;
	ifstream ifile("Y:\\main.txt", ios::in | ios::binary);
	ofstream ofile("Y:\\temp.txt", ios::out | ios::binary);
	accountsmaster s;
	cout << "\n                           Modify:\n\n";
	cout << "\n                                 1.Name.\n";
	cout << "\n                                 2.Address.\n";
	cout << "\n                                 3.Mobile number.\n";
	cout << "\n                                 4.Date of birth.\n";
	cout << "\n                                 5.All details\n";
	cout << "\n                                 6.Exit.\n";
	cout << "\n                           Enter choice: ";
	cin >> choice;
	switch (choice)
	{
	case 1:
		cout << "\nHow you want to search";
		cout << "\n1.Name.";
		cout << "\n2.Account no.";
		cout << "\nenter the choice:";
		cin >> c;
		if (c == 1)
		{
			char aname[30];
			cout << "\nEnter name of account holder to be searched: ";
			gets(aname);
			while (ifile.read((char *)&s, sizeof(s)))
			{
				if (strcmp(aname, s.catc()) == 0)
				{
					s.editfield(1);
					ofile.write((char *)&s, sizeof(s));
				}
				else
				{
					ofile.write((char *)&s, sizeof(s));
					cout << "\nEnter valid name.";
				}
			}
		}
		else if (c == 2)
		{
			int acno;
			cout << "\nEnter account number of account holder to be searched: ";
			cin >> acno;
			while (ifile.read((char *)&s, sizeof(s)))
			{
				if (acno == s.getacno())
				{
					s.editfield(1);
					ofile.write((char *)&s, sizeof(s));
				}
				else
				{
					ofile.write((char *)&s, sizeof(s));
					cout << "\nEnter valid account number.";
				}
			}
		}
		break;
	case 2:
		cout << "\nHow you want to search";
		cout << "\n1.Name.";
		cout << "\n2.Account no.";
		cout << "\nenter the choice:";
		cin >> c;
		if (c == 1)
		{
			char aname[30];
			cout << "\nEnter name of account holder to be searched: ";
			gets(aname);
			while (ifile.read((char *)&s, sizeof(s)))
			{
				if (strcmp(aname, s.catc()) == 0)
				{
					s.editfield(2);
					ofile.write((char *)&s, sizeof(s));
				}
				else
				{
					ofile.write((char *)&s, sizeof(s));
				}
			}
		}
		else if (c == 2)
		{
			int acno;
			cout << "\nEnter account number of account holder to be searched: ";
			cin >> acno;
			while (ifile.read((char *)&s, sizeof(s)))
			{
				if (acno == s.getacno())
				{
					s.editfield(2);
					ofile.write((char *)&s, sizeof(s));
				}
				else
				{
					ofile.write((char *)&s, sizeof(s));
				}
			}
		}
		break;
	case 3:
		cout << "\nHow you want to search";
		cout << "\n1.Name.";
		cout << "\n2.Account no.";
		cout << "\nenter the choice:";
		cin >> c;
		if (c == 1)
		{
			char aname[30];
			cout << "\nEnter name of account holder to be searched: ";
			gets(aname);
			while (ifile.read((char *)&s, sizeof(s)))
			{
				if (strcmp(aname, s.catc()) == 0)
				{
					s.editfield(3);
					ofile.write((char *)&s, sizeof(s));
				}
				else
				{
					ofile.write((char *)&s, sizeof(s));
				}
			}
		}
		else if (c == 2)
		{
			int acno;
			cout << "\nEnter account number of account holder to be searched: ";
			cin >> acno;
			while (ifile.read((char *)&s, sizeof(s)))
			{
				if (acno == s.getacno())
				{
					s.editfield(3);
					ofile.write((char *)&s, sizeof(s));
				}
				else
				{
					ofile.write((char *)&s, sizeof(s));
				}
			}
		}
		break;
	case 4:
		cout << "\nHow you want to search";
		cout << "\n1.Name.";
		cout << "\n2.Account no.";
		cout << "\nenter the choice:";
		cin >> c;
		if (c == 1)
		{
			char aname[30];
			cout << "\nEnter name of account holder to be searched: ";
			gets(aname);
			while (ifile.read((char *)&s, sizeof(s)))
			{
				if (strcmp(aname, s.catc()) == 0)
				{
					s.editfield(4);
					ofile.write((char *)&s, sizeof(s));
				}
				else
				{
					ofile.write((char *)&s, sizeof(s));
				}
			}
		}
		else if (c == 2)
		{
			int acno;
			cout << "\nEnter account number of account holder to be searched: ";
			cin >> acno;
			while (ifile.read((char *)&s, sizeof(s)))
			{
				if (acno == s.getacno())
				{
					s.editfield(4);
					ofile.write((char *)&s, sizeof(s));
				}
				else
				{
					ofile.write((char *)&s, sizeof(s));
				}
			}
		}
		break;
	case 5:
		cout << "\nHow you want to search";
		cout << "\n1.Name.";
		cout << "\n2.Account no.";
		cout << "\nenter the choice:";
		cin >> c;
		if (c == 1)
		{
			char aname[30];
			cout << "\nEnter name of account holder to be searched: ";
			gets(aname);
			while (ifile.read((char *)&s, sizeof(s)))
			{
				if (strcmp(aname, s.catc()) == 0)
				{
					s.getdata();
					ofile.write((char *)&s, sizeof(s));
				}
				else
				{
					ofile.write((char *)&s, sizeof(s));
				}
			}
		}
		else if (c == 2)
		{
			int acno;
			cout << "\nEnter account number of account holder to be searched: ";
			cin >> acno;
			while (ifile.read((char *)&s, sizeof(s)))
			{
				if (acno == s.getacno())
				{
					s.getdata();
					ofile.write((char *)&s, sizeof(s));
				}
				else
				{
					ofile.write((char *)&s, sizeof(s));
				}
			}
		}
		break;
	case 6:
		break;
	}

	ifile.close();
	ofile.close();
	remove("Y:\\main.txt");
	rename("Y:\\temp.txt", "Y:\\main.txt");
}

void report()
{
	clrscr();
	deposit m;
	accountsmaster s;
	int c;
	ifstream ifile("Y:\\main.txt", ios::in | ios::binary);
	ifstream file("deposit.txt", ios::in | ios::binary);
	ifstream file1("withdraw.txt", ios::in | ios::binary);

	cout << "\n		  Report:\n";
	cout << "\n                       1.Deposit Report\n";
	cout << "\n                       2.Withdraw Report\n";
	cout << "\n                       3.Detailed Report\n";
	cout << "\n	       	        4.Exit\n";
	cout << "\n                 Enter the choice:";
	cin >> c;

	if (c == 1)
	{
		clrscr();
		int i = 6;
		cout << "\n               Deposit Report\n\n";
		cout << "\n";
		while (file.read((char *)&m, sizeof(m)))
		{
			gotoxy(1, 5);
			cout << "Account no.";
			gotoxy(15, 5);
			cout << "Date of Transaction";
			gotoxy(40, 5);
			cout << "Balance";
			m.report(i);
			i++;
			getch();
		}
	}
	else if (c == 2)
	{
		clrscr();
		int i = 6;
		cout << "\n               Withdraw Report\n\n";
		cout << "\n";
		while (file1.read((char *)&m, sizeof(m)))
		{
			gotoxy(1, 5);
			cout << "Account no.";
			gotoxy(15, 5);
			cout << "Date of Transaction";
			gotoxy(40, 5);
			cout << "Balance";
			m.report(i);
			i++;
			getch();
		}
	}
	else if (c == 3)
	{
		clrscr();
		int i = 6;
		cout << "\n               Detailed Report\n\n";
		cout << "\n";
		while (ifile.read((char *)&s, sizeof(s)))
		{
			gotoxy(1, 5);
			cout << "Account no.";
			gotoxy(15, 5);
			cout << "Name";
			gotoxy(30, 5);
			cout << "Address";
			gotoxy(53, 5);
			cout << "Balance";
			s.report(i);
			i++;
			getch();
		}
	}
	else if (c == 4)
	{
	}
	else
	{
		cout << "\nEnter valid choice.";
	}
}

void adeposit()
{
	clrscr();
	int acc, found = 0, p;
	char ch, t;
	long double tempamt;
	dob d;

	ifstream ifile("Y:\\main.txt", ios::binary);
	ofstream ofile("Y:\\temp.txt", ios::binary);
	fstream file("deposit.txt", ios::binary | ios::app);

	accountsmaster s;
	deposit m;

	cout << "\nEnter account number: ";
	cin >> acc;

	while (ifile.read((char *)&s, sizeof(s)))
	{
		if (s.getacno() == acc)
		{
			found = 1;
			cout << "\nEnter the date of transaction: ";
			cin >> d.date >> d.month >> d.year;
			cout << "\nEnter amount to be deposited: ";
			cin >> tempamt;
			p = s.updatebalance(tempamt, 'd');
			ofile.write((char *)&s, sizeof(s));
			if (p == 1)
			{
				m.getdata(acc, d, tempamt);
				file.write((char *)&m, sizeof(m));
			}
		}
		else
		{
			found = 0;
			ofile.write((char *)&s, sizeof(s));
		}
	}

	if (found == 0)
	{
		cout << "\nAccount not found!";
		getch();
	}

	ifile.close();
	ofile.close();
	remove("Y:\\main.txt");
	rename("Y:\\temp.txt", "Y:\\main.txt");
}

void withdraw()
{
	clrscr();
	int acc, found = 0, p;
	char ch, t;
	long double tempamt;
	dob d;

	ifstream ifile("Y:\\main.txt", ios::binary);
	ofstream ofile("Y:\\temp.txt", ios::binary);
	ofstream file("withdraw.txt", ios::binary | ios::app);

	accountsmaster s;
	deposit m;

	cout << "\nEnter account number: ";
	cin >> acc;

	while (ifile.read((char *)&s, sizeof(s)))
	{
		if (s.getacno() == acc)
		{
			found = 1;
			cout << "\nEnter the date of transaction: ";
			cin >> d.date >> d.month >> d.year;
			cout << "\nEnter amount to be withdrawn: ";
			cin >> tempamt;
			p = s.updatebalance(tempamt, 'w');
			ofile.write((char *)&s, sizeof(s));
			if (p == 1)
			{
				m.getdata(acc, d, tempamt);
				file.write((char *)&m, sizeof(m));
			}
		}
		else
		{
			found = 0;
			ofile.write((char *)&s, sizeof(s));
		}
	}

	if (found == 0)
	{
		cout << "\nAccount not found!";
		getch();
	}

	ifile.close();
	ofile.close();
	remove("Y:\\main.txt");
	rename("Y:\\temp.txt", "Y:\\main.txt");
}

void accountsinfo()
{
	clrscr();
	int choice;
	do
	{
		clrscr();
		cout << "\n                     Accounts Information" << endl;
		cout << "\n			     1.Create new account" << endl;
		cout << "\n			     2.Search account information" << endl;
		cout << "\n			     3.Modify account information" << endl;
		cout << "\n			     4.Display account information" << endl;
		cout << "\n			     5.Delete account information" << endl;
		cout << "\n			     6.Exit to home screen" << endl;
		cout << "\n		     Enter your choice: ";
		cin >> choice;
		switch (choice)
		{
		case 1:
			insert();
			break;
		case 2:
			isearch();
			break;
		case 3:
			modify();
			break;
		case 4:
			display();
			break;
		case 5:
			del();
			break;
		case 6:
			break;
		default:
			cout << "\n			Enter a valid numeral!";
			getch();
		}
	} while (choice != 6);
}

void suseracc(int accno)
{
	clrscr();
	accountsmaster s;
	ifstream ifile("Y:\\main.txt", ios::binary);
	while (ifile.read((char *)&s, sizeof(s)))
	{
		if (s.getacno() == accno)
		{
			s.showdata();
			getch();
		}
	}
}

void userdep(int accno)
{
	clrscr();
	dob d;
	long double tempamt, p;
	ifstream ifile("Y:\\main.txt", ios::binary);
	ofstream ofile("Y:\\temp.txt", ios::binary);
	fstream file("deposit.txt", ios::binary | ios::app);

	accountsmaster s;
	deposit m;

	while (ifile.read((char *)&s, sizeof(s)))
	{
		if (s.getacno() == accno)
		{
			cout << "\nEnter the date of transaction: ";
			cin >> d.date >> d.month >> d.year;
			cout << "\nEnter amount to be deposited: ";
			cin >> tempamt;
			p = s.updatebalance(tempamt, 'd');
			ofile.write((char *)&s, sizeof(s));
			if (p == 1)
			{
				m.getdata(accno, d, tempamt);
				file.write((char *)&m, sizeof(m));
			}
		}
		else
		{
			ofile.write((char *)&s, sizeof(s));
		}
	}

	ifile.close();
	ofile.close();
	remove("Y:\\main.txt");
	rename("Y:\\temp.txt", "Y:\\main.txt");
}

void uwithdraw(int accno)
{
	clrscr();
	dob d;
	long double tempamt, p;
	ifstream ifile("Y:\\main.txt", ios::binary);
	ofstream ofile("Y:\\temp.txt", ios::binary);
	fstream file("withdraw.txt", ios::binary | ios::app);

	accountsmaster s;
	deposit m;

	while (ifile.read((char *)&s, sizeof(s)))
	{
		if (s.getacno() == accno)
		{
			cout << "\nEnter the date of transaction: ";
			cin >> d.date >> d.month >> d.year;
			cout << "\nEnter amount to be withdrawn: ";
			cin >> tempamt;
			p = s.updatebalance(tempamt, 'w');
			ofile.write((char *)&s, sizeof(s));
			if (p == 1)
			{
				m.getdata(accno, d, tempamt);
				file.write((char *)&m, sizeof(m));
			}
		}
		else
		{
			ofile.write((char *)&s, sizeof(s));
		}
	}

	ifile.close();
	ofile.close();
	remove("Y:\\main.txt");
	rename("Y:\\temp.txt", "Y:\\main.txt");
}

void login(int accno)
{
	clrscr();
	int choice;
	do
	{
		clrscr();
		cout << "\n			Overview";
		cout << "\n				1.Access details";
		cout << "\n\n				2.Deposit money";
		cout << "\n\n				3.Withdraw money";
		cout << "\n\n				4.Exit";
		cout << "\n\n			Enter your choice: ";
		cin >> choice;
		switch (choice)
		{
		case 1:
			suseracc(accno);
			break;
		case 2:
			userdep(accno);
			break;
		case 3:
			uwithdraw(accno);
			break;
		case 4:
			break;
		default:
			cout << "\n\n		Enter valid numeral!";
			getch();
		}
	} while (choice != 4);
}

void user()
{
	clrscr();
	accountsmaster s;
	int accno;
	int choice;
	int found = 0;
	ifstream ifile("Y:\\main.txt", ios::binary);
	while (1)
	{
		clrscr();
		cout << "\n			Welcome to the Bank";
		cout << "\n\n				Enter your account no.: ";
		cin >> accno;
		while (ifile.read((char *)&s, sizeof(s)))
		{
			if (accno == s.getacno())
			{
				found = 1;
				cout << "\n\n				Enter your password: ";
				char pass[20], str[20];
				int x = 0, ch;
				while (1)
				{
					ch = getch();
					if (ch == 13)
					{
						pass[x] = '\0';
						break;
					}
					else
					{
						pass[x] = ch;
						x++;
						cout << "*";
					}
				}
				if (strcmp(pass, "hell") == 0)
				{
					cout << "YeS";
				}
				else
				{
					cout << "no";
				}
				login(accno);
				break;
			}
			else if (found == 0)
			{
				cout << "\nAccount does not exist!";
				getch();
				break;
			}
		}
		break;
	}
}

void employee()
{
	clrscr();
	int choice;
	do
	{
		clrscr();
		cout << "\n			Employee";
		cout << "\n\n\n                            1.Accounts Information"
			 << endl;
		cout << "\n\n			    2.Deposit" << endl;
		cout << "\n\n			    3.Withdraw" << endl;
		cout << "\n\n			    4.Report" << endl;
		cout << "\n\n			    5.Exit Program" << endl;
		cout << "\n\n                     Enter your choice:";
		cin >> choice;
		switch (choice)
		{
		case 1:
			accountsinfo();
			break;
		case 2:
			adeposit();
			break;
		case 3:
			withdraw();
			break;
		case 4:
			report();
			break;
		case 5:
			break;
		default:
			cout << "\n			Enter a valid numeral!";
			getch();
		}
	} while (choice != 5);
}

void menu()
{
	clrscr();
	int choice;
	do
	{
		clrscr();
		cout << "\n		      Banking Systems" << endl
			 << endl;
		cout << "\n\n			1.Employee";
		cout << "\n\n			2.Account holder";
		cout << "\n\n			3.Exit";
		cout << "\n\n		      Enter your choice: ";
		cin >> choice;
		switch (choice)
		{
		case 1:
			employee();
			break;
		case 2:
			user();
			break;
		case 3:
			break;
		default:
			cout << "\n			Enter valid numeral!";
			getch();
		}
	} while (choice != 3);
}

void main()
{
	clrscr();
	menu();
}
