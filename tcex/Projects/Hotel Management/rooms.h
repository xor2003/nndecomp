#ifndef ROOMS_H_
#define ROOMS_H_

#include <fstream.h>
#include <conio.h>
#include <stdio.h>
#include <string.h>
#include <dos.h>

using namespace std;

class ROOMS
{
	int roomNo;
	int roomType;
	long roomCharges;
	int roomStatus;

public:
	void genDatabase();
	long retRoomCharges(int roomNo);
	int findRoomNo(int r_type);
	void status();
	void bookRoom(int roomNo);
	void releaseRoom(int roomNo);
};

void ROOMS::genDatabase()
{
	clrscr();
	int RNO;
	char more, yn;
	ROOMS r;
	fstream fin("rooms", ios::binary | ios::in);
	if (!fin)
	{
		RNO = 99;
	}
	else
	{
		while (fin.read((char *)&r, sizeof(r)))
			RNO = r.roomNo;
	}
	fin.close();

	do
	{
		clrscr();
		box(19, 9, 61, 21, 1);
		gotoxy(24, 11);
		cout << "G E N E R A T E   D A T A B A S E";
		gotoxy(26, 15);
		cout << "(Data Entry for R. No :" << RNO + 1 << ")";

		gotoxy(19, 23);
		cout << "<Enter '1' for Deluxe and '0' for Ordinary>";
		gotoxy(29, 17);
		cout << "Enter Room Type   : ";
		cin >> r.roomType;
		if (r.roomType != 0 && r.roomType != 1)
		{
			while (r.roomType != 0 && r.roomType != 1)
			{
				gotoxy(19, 23);
				clreol();
				gotoxy(19, 23);
				cout << "ERROR!! ENTER AGAIN!!";
				gotoxy(29, 17);
				clreol();
				gotoxy(29, 17);
				cout << "Enter Room Type : ";
				cin >> r.roomType;
			}
		}
		gotoxy(19, 23);
		clreol();
		gotoxy(29, 19);
		cout << "Enter Room Charges: ";
		cin >> r.roomCharges;
		gotoxy(28, 23);
		cout << "Do you want to save it : ";
		cin >> yn;
		if (yn == 'y' || yn == 'Y')
		{
			RNO++;
			r.roomNo = RNO;
			r.roomStatus = 0;
			fstream fout("rooms", ios::binary | ios::app);
			fout.write((char *)&r, sizeof(r));
			fout.close();
		}

		gotoxy(25, 24);
		cout << "Do you want Enter more Records : ";
		cin >> more;
	} while (more == 'y' || more == 'Y');
}

int ROOMS::findRoomNo(int TYPE)
{
	ROOMS r;
	int RNO, flag = 0;
	fstream fin("rooms", ios::binary | ios::in);
	while (fin.read((char *)&r, sizeof(r)))
	{
		if (TYPE == r.roomType)
		{
			if (r.roomStatus == 0)
			{
				RNO = r.roomNo;
				flag = 1;
				break;
			}
			else
				flag = 2;
		}
	}
	fin.close();
	if (flag == 0)
		return 0; //No such room no
	else if (flag == 1)
		return RNO; //room found
	else if (flag == 2)
		return -1; //This room Type is full
	return 0;	   //
}

void ROOMS::bookRoom(int RNO)
{
	ROOMS r;
	fstream fin("rooms", ios::binary | ios::in);
	fstream fout("temp", ios::binary | ios::out);
	while (fin.read((char *)&r, sizeof(r)))
	{
		if (RNO == r.roomNo)
		{
			clrscr();
			box(23, 10, 57, 14, 0);

			gotoxy(26, 12);
			cout << "Room No '" << RNO << "' has been booked";
			getch();
			r.roomStatus = 1;
			fout.write((char *)&r, sizeof(r));
		}
		else
			fout.write((char *)&r, sizeof(r));
	}
	fout.close();
	fin.close();
	remove("rooms");
	rename("temp", "rooms");
}

void ROOMS::releaseRoom(int RNO)
{
	ROOMS r;
	int NO_DAYS;
	fstream fin("rooms", ios::binary | ios::in);
	fstream fout("temp", ios::binary | ios::out);
	while (fin.read((char *)&r, sizeof(r)))
	{
		if (RNO == r.roomNo)
		{
			r.roomStatus = 0;
			fout.write((char *)&r, sizeof(r));
		}
		else
			fout.write((char *)&r, sizeof(r));
	}
	fin.close();
	fout.close();
	remove("rooms");
	rename("temp", "rooms");
}

long ROOMS::retRoomCharges(int RNO)
{
	ROOMS r;
	long AMOUNT;
	fstream fin("rooms", ios::binary | ios::in);
	while (fin.read((char *)&r, sizeof(r)))
	{
		if (RNO == r.roomNo)
		{
			AMOUNT = r.roomCharges;
			break;
		}
	}
	fin.close();
	return AMOUNT;
}

void ROOMS::status()
{
	clrscr();
	ROOMS r;
	box(5, 3, 75, 23, 1);
	int i = 11;
	gotoxy(30, 5);
	cout << "R O O M    S T A T U S";
	;
	fstream fin("rooms", ios::binary | ios::in);
	gotoxy(8, 9);
	cout << "R.No          Room Type            Room Charges           Status";
	while (fin.read((char *)&r, sizeof(r)))
	{
		gotoxy(8, i);
		cout << "    ...   ...          ...    ...   ...       ...   ...      ";
		gotoxy(8, i);
		cout << r.roomNo;

		gotoxy(22, i);
		if (r.roomType == 1)
			cout << "Deluxe";
		else
			cout << "Ordinary";

		gotoxy(48, i);
		cout << r.roomCharges;

		gotoxy(65, i);
		if (r.roomStatus == 1)
			cout << "Occupied";
		else
			cout << "Vacant";

		i++;
	}

	fin.close();
	getch();
}

#endif
