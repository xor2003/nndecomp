#ifndef ACCOUNTSMASTER_H_
#define ACCOUNTSMASTER_H_

#include <fstream.h>
#include <conio.h>
#include <stdio.h>
#include <string.h>
#include <ctype.h>

using namespace std;

class deposit
{
private:
	int accno;
	long double amount;
	dob d;

public:
	void getdata(int a, dob date, long double amt)
	{
		accno = a;
		d = date;
		amount = amt;
	}
	void report(int i)
	{
		cout << "\n";
		gotoxy(1, i);
		cout << accno;
		gotoxy(15, i);
		cout << d.date << "-" << d.month << "-" << d.year;
		gotoxy(40, i);
		cout << amount;
	}
};

class withdraw
{
private:
	int accno;
	long double amount;
	dob d;

public:
	void getdata(int a, dob date, long double amt)
	{
		accno = a;
		d = date;
		amount = amt;
	}
	void report(int i)
	{
		cout << "\n";
		gotoxy(1, i);
		cout << accno;
		gotoxy(15, i);
		int tym();
		gotoxy(40, i);
		cout << amount;
	}
};

class accountsmaster
{
private:
	int accno;
	char name[30];
	char add[50];
	dob d;
	char no[15];
	long double balance;

public:
	accountsmaster()
	{
		balance = 0.0;
	}

	void getdata()
	{
		getlatestacno();
		accno = gacno;
		while (1)
		{
			int a;
			cout << "\nEnter name: ";
			gets(name);
			a = check(1);
			if (a == 1)
			{
				break;
			}
			break;
		}
		cout << "\nEnter address: ";
		gets(add);
		cout << "\nEnter date of birth(dd/mm/yyyy): ";
		cin >> d.date >> d.month >> d.year;
		cout << "\nEnter phone/mobile number: ";
		cin >> no;
	}
	void showdata()
	{
		clrscr();
		cout << "\n                     Accounts Information\n";
		cout << "\nAccount number: ";
		cout << accno << endl;
		cout << "\nName: ";
		cout << name << endl;
		cout << "\nAddress: ";
		cout << add << endl;
		cout << "\nDate of birth(dd/mm/yyyy): ";
		cout << d.date << " " << d.month << " " << d.year << endl;
		cout << "\nPhone/mobile number: ";
		cout << no << endl;
		cout << "\nbalance:";
		cout << balance;
	}
	char *catc()
	{
		return name;
	}
	char *catadd()
	{
		return add;
	}
	dob catdob()
	{
		return d;
	}
	int getacno()
	{
		return accno;
	}
	long double getbal()
	{
		return balance;
	}
	void editfield(int var1)
	{
		if (var1 == 1)
		{
			cout << "\nEnter modified name: ";
			cin >> name;
		}
		else if (var1 == 2)
		{
			cout << "\nEnter modified address: ";
			cin >> add;
		}
		else if (var1 == 3)
		{
			cout << "\nEnter modified mobile number: ";
			cin >> no;
		}
		else if (var1 == 4)
		{
			cout << "\nEnter modified date of birth: ";
			cin >> d.date >> d.month >> d.year;
		}
	}
	int updatebalance(long double amt, char c)
	{
		int found = 0;
		if (c == 'd')
		{
			balance = balance + amt;
			found = 1;
		}
		else if (c == 'w')
		{
			if (amt > balance)
			{
				cout << "\nNot enough balance";
			}
			else
			{
				balance = balance - amt;
				found = 1;
			}
		}
		cout << "\nCurrent balance: " << balance;
		getch();
		return (found);
	}
	void report(int i)
	{
		cout << "\n";
		gotoxy(1, i);
		cout << accno;
		gotoxy(15, i);
		cout << name;
		gotoxy(30, i);
		cout << add;
		gotoxy(53, i);
		cout << balance;
	}
	int check(int temp)
	{
		int found = 1;
		if (temp == 1)
		{
			for (int i = 0; name[i] != '\0'; i++)
			{
				if (isalpha(name[i]) == 0)
				{
					found = 0;
					cout << "\nError!";
					getch();
					cout << "\nEnter name: ";
					cin >> name;
					break;
				}
			}
			return (found);
		}
	}
};

#endif
