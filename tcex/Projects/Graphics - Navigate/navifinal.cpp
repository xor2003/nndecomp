#include "gourav.h"
#include "navifunc.h"

void drawtest();
void path();
void findpath(int, int, int[][max + 1], int[], char[][20]);
void inttostr(int, char[]);
void init();
void insmap();
void delmap();
void usemap();
void menu();
void performmap(char[]);

void performmap(char str[])
{
	initgraphic();

	ifstream f1, f2;

	char dir[50] = "", dir1[50] = "", dir2[50] = "";
	char strn[10];
	int x, y;
	strcpy(dir, "d:\\NAVIGATE\\");
	strcat(dir, str);
	strcpy(dir1, dir);
	strcpy(dir2, dir);
	strcat(dir1, "\\WEIGHT.TXT");
	strcat(dir2, "\\GRAPH.TXT");

	f1.open(dir2);
	while (!f1.eof())
	{
		f1 >> strn >> x >> y;
		circle(x, y, 10);
	}
	f1.close();

	int x1 = 0, y1 = 0, x2 = 0, y2 = 0, a = 0;
	char str11[20], str12[20];
	char str2[20];

	f1.open(dir1);
	while (!f1.eof())
	{
		f1 >> str11 >> str12 >> strn;
		f2.open(dir2);
		while (!f2.eof())
		{
			f2 >> str2 >> x >> y;
			if (strcmp(str11, str2) == 0)
				x1 = x, y1 = y;
			if (strcmp(str12, str2) == 0)
				x2 = x, y2 = y;
		}
		f2.close();
		line(x1, y1, x2, y2);
	}
	f1.close();

	getch();
	closegraph();
}

void usemap()
{
	clrscr();
	int flag = 0;
	char str1[20], str2[20], str3[20];
	ifstream fi;
	fi.open("d:\\NAVIGATE\\MAPS.DAT");
	while (!fi.eof())
	{
		fi >> str1;
		fi >> str2;
		cout << endl
			 << str1;
	}
	fi.close();
	cout << "\n\nEnter Map\t\t";
	cin >> str1;
	strupr(str1);
	fi.open("d:\\NAVIGATE\\MAPS.DAT");
	while (!fi.eof())
	{
		fi >> str2;
		if (strcmp(str2, str1) == 0)
		{
			flag = 1;
			break;
		}
		else
			flag = 0;
	}
	fi.close();
	if (flag == 1)
	{
		cout << "\nMap found\n";
		delay(1500);
		performmap(str1);
		menu();
	}
	else
	{
		cout << "\nMap Not Found...\n";
		delay(1500);
		menu();
	}
}

void menu()
{
	clrscr();

	cout << "\n\t\t\t\tMap Menu";
	cout << "\n01. Initialize";
	cout << "\n02. Insert Map";
	cout << "\n03. Delete Map";
	cout << "\n04. Use Map";
	cout << "\n00. Exit";
	cout << "\nEnter Choice\t\t";

	switch (getch())
	{
	case '1':
		init();
		break;
	case '2':
		insmap();
		break;
	case '3':
		delmap();
		break;
	case '4':
		usemap();
		break;
	case '0':
		exit(0);
	default:
		menu();
	}
	menu();
}

void insmap()
{
	clrscr();
	int ch = 1;
	char str[20], mapname[20];
	char dir[50], dir1[50], dir2[50], dir3[50];

	strcpy(dir, "d:\\NAVIGATE\\");
	cout << "Enter Map :\t";
	cin >> mapname;

	strupr(mapname);
	strcat(dir, mapname);
	strcpy(dir1, dir);
	strcpy(dir2, dir);
	strcpy(dir3, dir);
	strcat(dir1, "\\NODE.TXT");
	strcat(dir2, "\\WEIGHT.TXT");
	strcat(dir3, "\\GRAPH.TXT");
	mkdir(dir);

	ch = 0;
	ofstream fo;
	fo.open(dir1);
	cout << "\nEnter Nodes :\tEnter 0 to terminate:\n";
	while (strcmp(str, "0") != 0)
	{
		cin >> str;
		if (strcmp(str, "0") != 0)
		{
			ch++;
			fo << str << "\t";
		}
	}
	fo.close();

	char c;
	cout << "Do You Want To Draw Map Now...";
	cin >> c;

	fo.open(dir3);
	fo.close();

	ifstream fi;
	int x = 0, y = 0;

	if (c == 'y')
	{
		cout << "Enter X and Y cordinates of the nodes...\n";
		fi.open(dir1);
		fo.open(dir3);
		while (!fi.eof())
		{
			fi >> str;
			if (strcmp(str, "") != 0 || strcmp(str, "\t") == 0)
			{
				cout << str << "\t";
				cin >> x >> y;
				fo << str << "\t" << x << "\t" << y << "\n";
			}
		}
		fi.close();
		fo.close();
	}

	fstream f;

	f.open("d:\\NAVIGATE\\MAPS.DAT", ios::app);
	f << endl
	  << mapname << "\t" << ch;
	f.close();

	char str1[20], str2[20];

	fo.open(dir2);
	cout << "\nEnter Weights :\t node \" \" node \" \" weight\n";
	cout << "Enter 0 0 0 to terminate\n";
	while (strcmp(str1, "0") != 0)
	{
		cin >> str1 >> str2 >> ch;
		if (strcmp(str1, "0") != 0)
			fo << str1 << "\t" << str2 << "\t" << ch << "\n";
	}
	fo.close();
}

void delmap()
{
	clrscr();
	char dir1[50], dir2[50];
	char str[10], ch[50], str1[20], str2[20];
	strcpy(dir1, "d:\\NAVIGATE\\maps.dat");
	strcpy(dir2, "d:\\NAVIGATE\\temp.dat");

	ifstream fi;
	fi.open("d:\\NAVIGATE\\MAPS.DAT");
	while (!fi.eof())
	{
		fi >> str1;
		fi >> str2;
		cout << endl
			 << str1;
	}
	fi.close();

	cout << "\nEnter Map:-\t\t";
	cin >> str;
	strupr(str);

	ifstream f1;
	ofstream f2;

	f1.open(dir1);
	f2.open(dir2);

	int flag = 0;

	while (!f1.eof())
	{
		f1 >> ch;
		if (strcmp(ch, str) == 0)
		{
			f1 >> ch;
			flag = 1;
		}
		else
		{
			f2 << ch;
			f1 >> ch;
			f2 << "\t" << ch << endl;
		}
	}

	if (flag == 1)
		cout << "Map Deleted...";
	else
		cout << "Map Not Deleted...";

	delay(1000);

	f1.close();
	f2.close();

	f1.open(dir2);
	f2.open(dir1);

	while (!f1.eof())
	{
		f1 >> ch;
		f2 << ch << "\t";
		f1 >> ch;
		f2 << ch;
		f2 << endl;
	}

	f1.close();
	f2.close();

	char dir[50];
	strcpy(dir, "d:\\NAVIGATE\\temp.dat");
	remove(dir);
}

void main()
{
	clrscr();
	menu();
}
