//include section
#include "INCLUDE.CPP"

//main application
void main()
{
	char choice;
	MENU(1);

	choice = getch();
	while (choice != (char)27)
	{
		switch (choice)
		{
		case ' ':
			defaultMenu();
			break;
		case 'f':
		case 'F':
			fileMenu();
			break;
		case 'e':
		case 'E':
			editMenu();
			break;
		case 's':
		case 'S':
			searchMenu();
			break;
		case 'r':
		case 'R':
			runMenu();
			break;
		case 'c':
		case 'C':
			compileMenu();
			break;
		case 'h':
		case 'H':
			helpMenu();
			break;
		case 'n':
		case 'N':
			newFileWindow();
			break;
		case 'o':
		case 'O':
			openFileWindow();
			break;
		case 'q':
		case 'Q':
			exitWindow();
			break;
		}
		choice = getch();
		if (isActiveMenu() && choice == (char)27)
		{
			disactive();
			MENU();
			choice = '\0';
		}
	}
}