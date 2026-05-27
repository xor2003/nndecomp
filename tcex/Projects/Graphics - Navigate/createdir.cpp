#include <iostream.h>
#include <conio.h>
#include <string.h>
#include <dir.h>

void main()
{
	clrscr();
	int ch;
	char str[20];
	char dir[50];
	strcpy(dir, "d:\\Tc\\BIN\\NAVIGATE\\");
	cin >> str;
	strcpy(dir, str);
	ch = mkdir(str);
	getch();
}
