#include <iostream.h>
#include <conio.h>
#include <windows.h>
#include <stdio.h>
#include <fstream.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>
#include <time.h>
#include <iomanip.h>

// Global Variable Declarations
char ch = 219, str[100];
char gridStatus[] = { '1', '2', '3', '4', '5', '6', '7', '8', '9' };
char word[100], guessword[100], letter[25], clue[200];
int trial = 0, k = 0;
static int flag1 = 0, flag2 = 0;
SYSTEMTIME timeObj1, timeObj2;



/************************************* User Authentication Functions *************************************/

class userdetails
{
	char password[25];

	public:

		char username[25];
		int score;

		void getdata()
		{
			char string[100];
			cout << "\nEnter an 8 character Username: ";
			gets(string);
			while (checktaken(string) == 1)
			{
				cout << "This Username is invalid! Enter Again: ";
				gets(string);
			}

			strcpy(username, string);
			strcpy(str, string);
			cout << "Create a Strong Password: ";
			gets(password);
			ofstream ofile("data.txt", ios::app);
			ofile << username << password << '\n';
			ofile.close();
			ofstream jfile("takennames.txt", ios::app);
			jfile << username << '\n';
			jfile.close();
		}

		int checktaken(char name[])
		{
			char str[100];
			ifstream ifile("takennames.txt");
			while (ifile)
			{
				ifile.getline(str, 100);
				if (strcmpi(str, name) == 0)
				{
					return 1;
					break;
				}
			}

			if (strlen(name) != 8)
				return 1;
			else
				return 0;
		}

		int checkdata()
		{
			int flag = 0;
			char str1[100];
			char str2[100];
			char str3[100];
			char str4[100];
			cout << "\nEnter Your Username: ";
			gets(str2);
			strcpy(str, str2);
			cout << "Enter Your Password: ";
			gets(str4);
			strcpy(str1, str2);
			strcat(str1, str4);
			ifstream ifile("data.txt");
			while (ifile.getline(str3, 100))
			{
				if (strcmp(str3, str1) == 0)
				{
					flag++;
					strcpy(username, str2);
					strcpy(password, str4);
					break;
				}
			}

			if (flag == 0)
			{
				Beep(660, 200);
				cout << endl;
				textbackground(RED);
				textcolor(YELLOW);
				cprintf("Invalid data entered");
				return 1;
			}
			else
				return 0;

		}

		void storename()
		{
			ofstream ofile("NAMES.txt", ios::app);
			ofile << username << endl;
			ofile.close();
		}

};


/************************************* Tic Tac Toe Functions *************************************/

void board(char game[][3], userdetails u)
{
	system("cls");
	cout << u.username << " vs. C++" << endl;
	cout << "\t\t\t       " << game[0][0] << "  |  " << game[0][1] << "  |  " << game[0][2] << endl;
	cout << "\t\t\t       " << "___|_____|___" << endl;
	cout << "\t\t\t       " << game[1][0] << "  |  " << game[1][1] << "  |  " << game[1][2] << endl;
	cout << "\t\t\t       " << "___|_____|___" << endl;
	cout << "\t\t\t       " << game[2][0] << "  |  " << game[2][1] << "  |  " << game[2][2] << endl;
}

int picknumber(char a[], char mark)
{
	int n;
	randomize();
	while (1)
	{
		n = random(9);
		if (a[n] != 'T')
			break;
	}

	return n + 1;
}

void storescore(userdetails user, char mark, char player)
{
	if (mark == player)
	{
		ofstream hfile("Score.txt", ios::app);
		hfile << user.score << "\n";
		hfile.close();
	}
}

void storeusername(userdetails user, char mark, char player)
{
	if (mark == player)
	{
		ofstream bfile("username.txt", ios::app);
		bfile << user.username << '\n';
		bfile.close();
	}
}

int checkdisplayed(char str[])
{
	ifstream ifile("displayed.txt");
	char string[100];
	while (ifile)
	{
		ifile >> string;
		if (strcmp(string, str) == 0)
		{
			return 1;
			break;
		}
	}

	ifile.close();
	return 0;
}

void scoreboard()
{
	int temp, positions[100], temp1;
	char d[100][25];
	char strl[100];
	int m = 0, r = 0;
	int scores[100];
	ifstream ifile("Score.txt");
	ifstream kfile("username.txt");
	int x;
	while (ifile)
	{
		ifile >> x;
		if (ifile.eof())
			break;
		scores[r++] = x;
	}

	char name[100];
	while (kfile)
	{
		kfile >> name;
		strcpy(d[m++], name);
	}

	for (int i = 0; i < r; i++)
		positions[i] = i;

	for (int i = 0; i < r; i++)
	{
		for (int j = i + 1; j < r; j++)
		{
			if (scores[i] > scores[j])
			{
				temp = scores[i];
				scores[i] = scores[j];
				scores[j] = temp;
				temp1 = positions[i];
				positions[i] = positions[j];
				positions[j] = temp1;
			}
		}
	}

	cout << endl;
	cout << endl;
	cout << endl;
	cout << endl;
	textbackground(WHITE);
	textcolor(MAGENTA);
	system("cls");
	cprintf("                                THE SCOREBOARD                                  ");
	cout << endl;
	cout << "\t\tUser                          Seconds Taken to Win" << endl;

	ofstream ofile("displayed.txt");
	for (int i = 0; i < r; i++)
	{
		if (checkdisplayed(d[positions[i]]) == 0)
		{
			cout << "\t\t" << d[positions[i]] << "                              " << scores[i] << endl;
			ofile << d[positions[i]] << endl;
		}
	}

	ofile.close();
	remove("displayed.txt");

}

int tcheckwin(char game[][3])
{
	if (game[0][0] == game[0][1] && game[0][1] == game[0][2])
		return 1;
	else if (game[1][0] == game[1][1] && game[1][1] == game[1][2])
		return 1;
	else if (game[2][0] == game[2][1] && game[2][1] == game[2][2])
		return 1;
	else if (game[0][0] == game[1][1] && game[1][1] == game[2][2])
		return 1;
	else if (game[0][2] == game[1][1] && game[1][1] == game[2][0])
		return 1;
	else if (game[0][0] == game[1][0] && game[1][0] == game[2][0])
		return 1;
	else if (game[0][1] == game[1][1] && game[1][1] == game[2][1])
		return 1;
	else if (game[0][2] == game[1][2] && game[1][2] == game[2][2])
		return 1;
	else if (game[0][0] != '1' && game[0][1] != '2' && game[0][2] != '3' && game[1][0] != '4' &&
		game[1][1] != '5' && game[1][2] != '6' && game[2][0] != '7' && game[2][1] != '8' &&
		game[2][2] != '9')
		return 0;
	else return 5;
}

void tictactoe(userdetails u)
{
	// Start-Up Graphics
	system("cls");
	system("Color 5F");
	Sleep(1000);

	cout << "\n\n\n\t\t\t ";
	cout << ch << ch << ch << ch << ch << ch << ch << ch << ch << "   " << ch << ch << ch <<
		ch << ch << ch << "     " << ch << ch << ch << ch << endl;
	Beep(660, 500);
	cout << "\t\t\t    ";
	cout << ch << ch << ch << "        " << ch << ch << "     " << ch << ch << endl;
	cout << "\t\t\t    ";
	cout << ch << ch << ch << "        " << ch << ch << "     " << ch << ch << endl;
	cout << "\t\t\t    ";
	cout << ch << ch << ch << "      " << ch << ch << ch << ch << ch << ch << "     " << ch <<
		ch << ch << ch << endl;

	cout << "\n\n\t\t\t ";
	Beep(770, 500);
	cout << ch << ch << ch << ch << ch << ch << ch << ch << ch << "    " << ch << ch << ch << ch << "     " << ch <<
		ch << ch << ch << ch << endl;
	cout << "\t\t\t    ";
	cout << ch << ch << ch << "      " << ch << ch << "  " << ch << ch << "   " << ch << ch << endl;
	cout << "\t\t\t    ";
	cout << ch << ch << ch << "      " << ch << ch << "" << ch << ch << ch << ch << "   " << ch << ch << endl;
	cout << "\t\t\t    ";
	cout << ch << ch << ch << "      " << ch << ch << "  " << ch << ch << "     " << ch << ch << ch << ch << endl;

	cout << "\n\n\t\t\t  ";
	Beep(880, 500);
	cout << ch << ch << ch << ch << ch << ch << ch << ch << ch << "    " << ch << ch << ch << ch << "    " << ch <<
		ch << ch << ch << ch << endl;
	cout << "\t\t\t     ";
	cout << ch << ch << ch << "      " << ch << ch << "  " << ch << ch << "   " << ch << endl;
	cout << "\t\t\t     ";
	cout << ch << ch << ch << "      " << ch << ch << "  " << ch << ch << "   " << ch << ch << ch << ch << ch << endl;
	cout << "\t\t\t     ";
	cout << ch << ch << ch << "      " << ch << ch << "  " << ch << ch << "   " << ch << endl;
	cout << "\t\t\t     ";
	cout << ch << ch << ch << "       " << ch << ch << ch << ch << "    " << ch << ch << ch << ch << ch << endl;
	Beep(990, 500);
	Sleep(3000);
	system("cls");


	int indicator;
	while (1)
	{
		cout << "\n\nEnter 1 to Play" << endl;
		cout << "Enter 2 to view the score board" << endl;
		cout << "Enter 3 to redirect to the main menu" << endl;
		cout << "Enter 4 to quit" << endl;
		cin >> indicator;
		if (indicator == 1)
		{
			int i, j, m = 1;
			char mark;
			int plturn = 2;
			int status = 5;
			char player, programmer;
			int choice;
			char game[3][3] = { '1', '2', '3', '4', '5', '6', '7', '8', '9' };
			gridStatus[0] = '1';
			gridStatus[1] = '2';
			gridStatus[2] = '3';
			gridStatus[3] = '4';
			gridStatus[4] = '5';
			gridStatus[5] = '6';
			gridStatus[6] = '7';
			gridStatus[7] = '8';
			gridStatus[8] = '9';

			while (1)
			{
				cout << "\nChoose 'X' or 'O':";
				cin >> player;
				if (player == 'X' || player == 'x')
				{
					programmer = 'O';
					break;
				}
				else if (player == 'O' || player == 'o')
				{
					programmer = 'X';
					break;
				}
				else
				{
					Beep(660, 200);
					cout << endl;
					textcolor(RED);
					textbackground(BLACK);
					cprintf("Invalid Character Entered!");
				}
			}

			system("cls");
			GetLocalTime(&timeObj1);
			while (status = 5)
			{
				board(game, u);
				if (plturn % 2 == 0)
					mark = player;
				else
					mark = programmer;

				if (mark == player)
				{
					cout << "\nEnter a number from the above grid: ";
					cin >> choice;
					if (choice != 1 && choice != 2 && choice != 3 && choice != 4 && choice != 5 &&
						choice != 6 && choice != 7 && choice != 8 && choice != 9)
					{
						Beep(660, 300);
						cout << endl;
						textcolor(RED);
						textbackground(BLACK);
						cprintf("Invalid Character Entered!");
						break;
					}
				}
				else if (mark == programmer)
					choice = picknumber(gridStatus, mark);

				if (choice == 1 && game[0][0] == '1' && gridStatus[0] != 'T')
				{
					game[0][0] = mark;
					// Indicate this spot in the grid has been filled
					gridStatus[0] = 'T';
				}
				else if (choice == 2 && game[0][1] == '2' && gridStatus[1] != 'T')
				{
					game[0][1] = mark;
					gridStatus[1] = 'T';
				}
				else if (choice == 3 && game[0][2] == '3' && gridStatus[2] != 'T')
				{
					game[0][2] = mark;
					gridStatus[2] = 'T';
				}
				else if (choice == 4 && game[1][0] == '4' && gridStatus[3] != 'T')
				{
					game[1][0] = mark;
					gridStatus[3] = 'T';
				}
				else if (choice == 5 && game[1][1] == '5' && gridStatus[4] != 'T')
				{
					game[1][1] = mark;
					gridStatus[4] = 'T';
				}
				else if (choice == 6 && game[1][2] == '6' && gridStatus[5] != 'T')
				{
					game[1][2] = mark;
					gridStatus[5] = 'T';
				}
				else if (choice == 7 && game[2][0] == '7' && gridStatus[6] != 'T')
				{
					game[2][0] = mark;
					gridStatus[6] = 'T';
				}
				else if (choice == 8 && game[2][1] == '8' && gridStatus[7] != 'T')
				{
					game[2][1] = mark;
					gridStatus[7] = 'T';
				}
				else if (choice == 9 && game[2][2] == '9' && gridStatus[8] != 'T')
				{
					game[2][2] = mark;
					gridStatus[8] = 'T';
				}
				else
				{
					Beep(660, 300);
					cout << endl;
					textcolor(RED);
					textbackground(BLACK);
					cprintf("Invalid Character Entered!");
					break;
				}

				plturn++;
				status = tcheckwin(game);
				if (status == 0 || status == 1)
					break;
			}

			GetLocalTime(&timeObj2);
			if (status == 1 && mark == player)
			{
				board(game, u);
				Beep(660, 300);
				cout << u.username << " WINS!";
			}

			if (status == 1 && mark == programmer)
			{
				board(game, u);
				Beep(660, 300);
				cout << "C++ WINS!";
			}
			else if (status == 0)
			{
				board(game, u);
				Beep(660, 300);
				cout << "It's a Draw!";
			}

			u.score = timeObj2.wSecond - timeObj1.wSecond;
			u.score += ((timeObj2.wMinute - timeObj1.wMinute) *60);
			u.score += ((timeObj2.wHour - timeObj1.wHour) *3600);
			storescore(u, mark, player);
			storeusername(u, mark, player);
		}
		else if (indicator == 2)
			scoreboard();
		else if (indicator == 3)
			return;
		else if (indicator == 4)
			exit(0);
	}
}


/************************************* Hangman functions *************************************/

void head()
{
	char ch = 219, ch2 = 223;
	cout << "\n\n\t\t\t\t" << ch << ch2 << ch2 << ch2 << ch2 << ch2 << ch2 << ch2 << ch;
	cout << "\n\t\t\t\t" << ch << "      " << ch << ch << ch;
	cout << "\n\t\t\t\t" << ch << "    " << ch << ch << "   " << ch << ch;
	cout << "\n\t\t\t\t" << ch << "   " << ch << "  O O  " << ch;
	cout << "\n\t\t\t\t" << ch << "   " << ch << "   _   " << ch;
	cout << "\n\t\t\t\t" << ch << "    " << ch << ch << "   " << ch << ch;
	cout << "\n\t\t\t\t" << ch << "      " << ch << ch << ch;
	cout << "\n\t\t\t\t" << ch;
	cout << "\n\t\t\t\t" << ch;
	cout << "\n\t\t\t\t" << ch;
	cout << "\n\t\t\t\t" << ch;
	cout << "\n\t\t\t\t" << ch;
	cout << "\n\t\t\t\t" << ch;
	cout << "\n\t\t\t\t" << ch;
	cout << "\n\t\t\t\t" << ch;
	cout << "\n\t\t\t\t" << ch;
}

void hand()
{
	char ch = 219, ch2 = 223;
	cout << "\n\n\t\t\t\t" << ch << ch2 << ch2 << ch2 << ch2 << ch2 << ch2 << ch2 << ch;
	cout << "\n\t\t\t\t" << ch << "      " << ch << ch << ch;
	cout << "\n\t\t\t\t" << ch << "    " << ch << ch << "   " << ch << ch;
	cout << "\n\t\t\t\t" << ch << "   " << ch << "  O O  " << ch;
	cout << "\n\t\t\t\t" << ch << "   " << ch << "   _   " << ch;
	cout << "\n\t\t\t\t" << ch << "    " << ch << ch << "   " << ch << ch;
	cout << "\n\t\t\t\t" << ch << "      " << ch << ch << ch;
	cout << "\n\t\t\t\t" << ch << "       " << ch;
	cout << "\n\t\t\t\t" << ch << "      " << ch << ch << ch;
	cout << "\n\t\t\t\t" << ch << "     " << ch << " " << ch << " " << ch;
	cout << "\n\t\t\t\t" << ch << "    " << ch << "  " << ch << "  " << ch;
	cout << "\n\t\t\t\t" << ch << "       " << ch;
	cout << "\n\t\t\t\t" << ch << "       " << ch;
	cout << "\n\t\t\t\t" << ch;
	cout << "\n\t\t\t\t" << ch;
	cout << "\n\t\t\t\t" << ch;
}

void leg()
{
	char ch = 219, ch2 = 223;
	cout << "\n\n\t\t\t\t" << ch << ch2 << ch2 << ch2 << ch2 << ch2 << ch2 << ch2 << ch;
	cout << "\n\t\t\t\t" << ch << "      " << ch << ch << ch;
	cout << "\n\t\t\t\t" << ch << "    " << ch << ch << "   " << ch << ch;
	cout << "\n\t\t\t\t" << ch << "   " << ch << "  O O  " << ch;
	cout << "\n\t\t\t\t" << ch << "   " << ch << "   _   " << ch;
	cout << "\n\t\t\t\t" << ch << "    " << ch << ch << "   " << ch << ch;
	cout << "\n\t\t\t\t" << ch << "      " << ch << ch << ch;
	cout << "\n\t\t\t\t" << ch << "       " << ch;
	cout << "\n\t\t\t\t" << ch << "      " << ch << ch << ch;
	cout << "\n\t\t\t\t" << ch << "     " << ch << " " << ch << " " << ch;
	cout << "\n\t\t\t\t" << ch << "    " << ch << "  " << ch << "  " << ch;
	cout << "\n\t\t\t\t" << ch << "       " << ch;
	cout << "\n\t\t\t\t" << ch << "       " << ch;
	cout << "\n\t\t\t\t" << ch << "      " << ch << " " << ch;
	cout << "\n\t\t\t\t" << ch << "     " << ch << "   " << ch;
	cout << "\n\t\t\t\t" << ch << "    " << ch << "     " << ch;
}

int game(int trial)
{
	Sleep(20);
	system("cls");
	system("Color 4F");
	cout << "\n  GUESS THE WORD!";
	if (trial == 0)
		cout << "\n\n  You have 3 chances ";
	else if (trial == 1)
		cout << "\n\n  You have only 2 chances left ";
	else if (trial == 2)
		cout << "\n\n  You have only 1 chance left ";
	cout << "\n\n  " << guessword;
	char choice[5];
	if (flag1 == 0)
	{
		cout << "\n\n  Do you want to use a hint? ";
		cin >> choice;
		while (strcmpi(choice, "yes") != 0 && strcmpi(choice, "no") != 0)
		{
			cout << "\n\n  Enter YES or NO: ";
			cin >> choice;
		}

		if (strcmpi(choice, "yes") == 0)
		{
			cout << "\n  " << clue;
			flag1 = 1;
		}
	}

	char ch;
	cout << "\n\n  Enter a letter: ";
	cin >> ch;
	if (islower(ch))
		ch = toupper(ch);
	int flag = 0;
	for (int i = 0; i < k; i++)
		if (letter[i] == ch)
		{
			cout << "\n\n  You have already entered that letter";
			flag = 1;
			Sleep(1500);
			break;
		}

	letter[k++] = ch;
	for (int i = 0; word[i] != '\0'; i++)
		if (word[i] == ch)
		{
			guessword[i] = word[i];
			flag = 1;
		}

	if (flag == 1)
	{
		cout << "\n\n  " << guessword;
		Sleep(1000);
	}
	else
		trial++;
	return trial;
}

int tries()
{
	static int flag2 = 0;
	while (trial <= 3)
	{
		if (strcmpi(guessword, word) == 0)
		{
			Beep(523, 500);
			cout << "\n\n  YOU WON!!";
			Beep(1046, 500);
			Beep(2093, 500);
			Sleep(4000);
			return 1;
			break;
		}

		if (trial != 3)
			trial = game(trial);
		if (trial == 1 && flag2 == 0)
		{
			head();
			flag2 = 1;
			Sleep(2000);
		}
		else if (trial == 2 && flag2 == 1)
		{
			hand();
			flag2 = 2;
			Sleep(2000);
		}
		else if (trial == 3 && flag2 == 2)
		{
			leg();
			Beep(698, 500);
			cout << "\n\n  YOU LOST";
			Beep(1397, 500);
			Beep(2794, 500);
			cout << "\n  The word was " << word;
			Sleep(4000);
			return -1;
			break;
		}
	}
}

void getword(ifstream file, ifstream hint)
{
	int n, c = 0, i;
	randomize();
	n = random(10);
	while (file.getline(word, 100))
	{
		c++;
		if (c == n)
		{
			break;
		}
	}

	file.close();

	for (i = 0; word[i] != '\0'; i++)
	{
		guessword[i] = '*';
	}

	guessword[i] = '\0';
	c = 0;

	while (hint.getline(clue, 200))
	{
		c++;

		if (c == n) 
		{
			break;
		}
	}

	hint.close();
}

void hangman(userdetails u)
{
	// Start-Up Graphics
	Sleep(10);
	system("cls");
	system("Color 3F");
	char ch = 219, ch2 = 223;
	Beep(196, 500);
	cout << "\n    " << ch << ch << "    " << ch << ch << "  " << ch << ch << ch << ch << ch << ch << ch << "  " <<
		ch << ch << ch << "   " << ch << ch << "  " << ch << ch << ch << ch << ch << ch << ch << ch << "  " << ch <<
		ch << ch << "   " << ch << ch << ch << "  " << ch << ch << ch << ch << ch << ch << ch << "  " << ch <<
		ch << ch << "   " << ch << ch << "  " << ch << ch;
	Sleep(50);
	Beep(392, 500);
	cout << "\n    " << ch << ch << "    " << ch << ch << "  " << ch << ch << "   " << ch << ch << "  " << ch << ch <<
		ch << ch << "  " << ch << ch << "  " << ch << ch << "    " << ch << ch << "  " << ch << ch << ch << ch << " " <<
		ch << ch << ch << ch << "  " << ch << ch << "   " << ch << ch << "  " << ch << ch << ch << ch << "  " << ch <<
		ch << "  " << ch << ch;
	Sleep(50);
	Beep(784, 150);
	cout << "\n    " << ch << ch << ch << ch << ch << ch << ch << ch << "  " << ch << ch << ch << ch << ch << ch << ch << "  " <<
		ch << ch << " " << ch << ch << " " << ch << ch << "  " << ch << ch << "        " << ch << ch << "  " << ch << "  " <<
		ch << ch << "  " << ch << ch << ch << ch << ch << ch << ch << "  " << ch << ch << " " << ch << ch << " " << ch <<
		ch << "  " << ch << ch;
	Sleep(50);
	Beep(1568, 150);
	cout << "\n    " << ch << ch << "    " << ch << ch << "  " << ch << ch << "   " << ch << ch << "  " << ch << ch << "  " <<
		ch << ch << ch << ch << "  " << ch << ch << "   " << ch2 << ch2 << ch << "  " << ch << ch << "     " << ch << ch <<
		"  " << ch << ch << "   " << ch << ch << "  " << ch << ch << "  " << ch << ch << ch << ch;
	Sleep(50);
	Beep(3136, 150);
	cout << "\n    " << ch << ch << "    " << ch << ch << "  " << ch << ch << "   " << ch << ch << "  " << ch << ch << "   " <<
		ch << ch << ch << "  " << ch << ch << ch << ch << ch << ch << ch << ch << "  " << ch << ch << "     " << ch << ch <<
		"  " << ch << ch << "   " << ch << ch << "  " << ch << ch << "   " << ch << ch << ch << "  " << ch << ch;
	Sleep(1000);

	HANDLE colour = GetStdHandle(STD_OUTPUT_HANDLE);
	SetConsoleTextAttribute(colour, 318);
	char option[25];
	cout << "\n\n\n\n\t\t\t\t     PLAY GAME     ";
	cout << "\n\t\t\t\t     HIGH SCORE   ";
	cout << "\n\t\t\t\t     MAIN MENU   ";
	cout << "\n\t\t\t\t       EXIT   ";
	cout << "\n\n\n\t\t\tEnter from the above choices: ";
	gets(option);
	while (strcmpi(option, "play game") != 0 && strcmpi(option, "high score") != 0 &&
		strcmpi(option, "main menu") != 0 && strcmpi(option, "exit") != 0)
	{
		SetConsoleTextAttribute(colour, 316);
		cout << "\n\t\t\t\t   Invalid Input!   ";
		SetConsoleTextAttribute(colour, 318);
		cout << "\n\n\t\t\t   Enter again: ";
		gets(option);
	}

	SetConsoleTextAttribute(colour, 315);
	if (strcmpi(option, "play game") == 0)
	{
		cout << "\n\n\n\t\t\t\t       EASY     ";
		cout << "\n\t\t\t\t      MEDIUM   ";
		cout << "\n\t\t\t\t       HARD     ";
		char difflevel[10];
		cout << "\n\n\n\t\t\t   Select the difficulty level: ";
		gets(difflevel);
		while (strcmpi(difflevel, "easy") != 0 && strcmpi(difflevel, "medium") != 0 &&
			strcmpi(difflevel, "hard") != 0)
		{
			cout << "\n\n\n\t\tSelect the difficulty level from above choices: ";
			gets(difflevel);
		}

		time_t begin, end;
		ofstream highscore1("highsc.txt", ios::app);
		ofstream username1("name.txt", ios::app);
		int result;
		if (strcmpi(difflevel, "easy") == 0)
		{
			ofstream easy1("easy.txt"), hint1("hint.txt");
			easy1 << "WOLF\nDOLL\nTOY\nHELLO\nELLEN\nGIRL\nSHOE\nHEART\nLOVE\nSHIRT";
			easy1.close();
			hint1 << "A wild carnivorous mammal that hunts in packs\nA model of a human figure\nAn object for a child to " <<
				"play with\nUsed as a greeting\nA popular TV show host\nA female child\nA covering for the foot\nAn " <<
				"organ of the body\nFeeling of deep affection\nAn item of clothing";
			hint1.close();
			ifstream easy2("easy.txt"), hint2("hint.txt");
			getword("easy.txt", "hint.txt");
			time(&begin);
			result = tries();
			time(&end);
		}
		else if (strcmpi(difflevel, "medium") == 0)
		{
			ofstream medium1("medium.txt"), hint1("hint.txt");
			medium1 << "ACROBAT\nBREATHE\nRESEARCH\nCOMPUTER\nCUPBOARD\nWINDOW\nBUILDING\nMOTHERBOARD\nUNIFORM\nSKATING";
			medium1.close();
			hint1 << "A person who performs gymnastic feats\nA physiological process\nSystemic investigation in order to " <<
				"establish facts\nAn electronic device\nA piece of furniture\nAn opening fitted with glass\nA structure" <<
				" with roof and walls\nA circuit board containing the principal components of a device\nDistinctive clothing" <<
				" worn by people belonging to the same organization\nAction of gliding across ice";
			hint1.close();
			ifstream medium2("medium.txt"), hint2("hint.txt");
			getword("medium.txt", "hint.txt");
			time(&begin);
			result = tries();
			time(&end);
		}
		else
		{
			ofstream hard1("hard.txt"), hint1("hint.txt");
			hard1 << "HYDERABAD\nINTERNATIONAL\nINTELLIGENT\nUNDERSTANDING\nHANDKERCHIEF\nRECOMMEND\nDICTIONARY\nCONSCIENCE" <<
				"\nPRONUNCIATION\nCAMBRIDGE";
			hard1.close();
			hint1 << "A city famous for biryani\nExisting or carried out between nations\nSynonym for perspicacious\nSynonym for" <<
				" comprehension\nA square of cotton material\nPut forward with approval\nA book that lists the words of a " <<
				"language\nA person's moral sense of right and wrong\nWay in which word is spoken\nDeemed university";
			hint1.close();
			ifstream hard2("hard.txt"), hint2("hint.txt");
			getword("hard.txt", "hint.txt");
			time(&begin);
			result = tries();
			time(&end);
		}

		if (result == 1)
		{
			double difference = difftime(end, begin);
			highscore1 << difference << '\n';
			username1 << u.username << '\n';
		}

		highscore1.close();
		username1.close();
	}
	else if (strcmpi(option, "high score") == 0)
	{
		ifstream highscore2("highsc.txt");
		int n = 0, h[100];
		while (true)
		{
			int x;
			highscore2 >> x;
			if (highscore2.eof())
				break;
			h[n++] = x;
		}

		highscore2.close();
		ifstream username2("name.txt");
		char m[100][25];
		n = 0;
		char name[25];
		while (true)
		{
			username2 >> name;
			if (username2.eof())
				break;
			strcpy(m[n++], name);
		}

		username2.close();
		int min = h[0], temp;
		for (int i = 0; i < (n - 1); i++)
		{
			for (int j = (i + 1); j < n; j++)
				if (h[j] < h[i])
				{
					temp = h[i];
					h[i] = h[j];
					h[j] = temp;
					strcpy(name, m[i]);
					strcpy(m[i], m[j]);
					strcpy(m[j], name);
				}
		}

		for (int i = 0; i < n; i++)
		{
			for (int j = i + 1; j < n; j++)
				if (strcmpi(m[i], m[j]) == 0)
				{
					for (int k = j; k < n - 1; k++)
					{
						h[k] = h[k + 1];
						strcpy(m[k], m[k + 1]);
					}

					n--;
					j--;
				}
		}

		cout << "\n\t\t\t\t     HIGH SCORE   ";
		cout << "\n\t\t\t\tTime taken in seconds";
		cout << endl;
		for (int i = 0; i < n; i++)
			cout << "\n\t\t\t\t" << (i + 1) << ". " << m[i] << "     " << h[i];
		Sleep(7000);
	}
	else if (strcmpi(option, "main menu") == 0)
		return;
	else if (strcmpi(option, "exit") == 0)
		exit(0);
	trial = k = flag1 = flag2 = 0;
	hangman(u);
}




/************************************* Main *************************************/

void main()
{
	// Start-Up Graphics
	HANDLE color = GetStdHandle(STD_OUTPUT_HANDLE);
	system("Color 1B");
	Sleep(1000);
	SetConsoleTextAttribute(color, 13);
	cout << "\n\t\t    ";
	Beep(660, 150);
	cout << ch << ch << ch << ch << ch << "   " << ch << ch << "   " << ch << ch << "   " 
		<< ch << ch << ch << ch << ch << "    " << ch << ch << ch << ch << ch 
		<< "   " << ch << ch << ch << ch << ch << endl;
	Beep(660, 100);
	cout << "\t\t    ";
	Beep(660, 340);
	cout << ch << ch << "      " << ch << ch << "   " << ch << ch << "   " << ch << ch
		 << "   " << ch << "   " << ch << ch << "      " << ch << ch << "   " << ch << endl;
	Beep(510, 100);
	cout << "\t\t    ";
	Beep(660, 300);
	cout << ch << ch << "       " << ch << ch << ch << ch << ch << "    " << ch << ch << "   " 
		 << ch << "   " << ch << ch << ch << ch << ch << "   " << ch << ch << "   " << ch << endl;
	Beep(770, 350);
	cout << "\t\t    ";
	Beep(700, 475);
	cout << ch << ch << "        " << ch << ch << ch << "     " << ch << ch << ch << ch << ch 
		 << "    " << ch << ch << "      " << ch << ch << ch << ch << ch << endl;
	cout << "\t\t    ";
	Beep(510, 450);
	cout << ch << ch << ch << ch << ch << "      " << ch << "      " << ch << ch << "   " 
		<< ch << "   " << ch << ch << "      " << ch << ch << "  " << ch << endl;
	Beep(380, 300);
	cout << "\t\t    ";
	Beep(320, 300);
	cout << ch << ch << ch << ch << ch << "      " << ch << "      " << ch << ch << ch 
		<< ch << ch << "    " << ch << ch << ch << ch << ch << "   " << ch << ch 
		<< "  " << ch << ch;
	Beep(440, 300);
	cout << "\n\n\t\t ";
	SetConsoleTextAttribute(color, 14);
	Beep(480, 310);
	cout << " " << ch << ch << ch << ch << ch << ch << "   " << ch << ch << ch << ch << ch 
		<< "   " << ch << ch << ch << ch << ch << "   " << ch << ch << ch << ch << ch <<
		ch << "   " << ch << ch << ch << ch << ch << "    " << ch << ch << ch << ch <<
		ch << ch << endl;
	Beep(450, 150);
	cout << "\t\t ";
	Beep(430, 300);
	cout << ch << ch << "    " << ch << ch << "  " << ch << ch << "   " << ch << "  " << ch << ch <<
		"     " << ch <<
		ch << "    " << ch << ch << "  " << ch << ch << "   " << ch << ch << "  " << ch << ch << endl;
	Beep(380, 230);
	cout << "\t\t ";
	Beep(660, 180);
	cout << ch << ch << "    " << ch << ch << "  " << ch << ch << "   " << ch << "  " << ch << ch <<
		"     " << ch <<
		ch << "    " << ch << ch << "  " << ch << ch << "   " << ch << ch << "  " << ch << ch <<
		ch << ch << ch << ch << endl;
	Beep(760, 100);
	cout << "\t\t ";
	Beep(860, 300);
	cout << ch << ch << ch << ch << ch << ch << ch << ch << "  " << ch << ch << ch << ch << ch <<
		"   " << ch << ch << "     " <<
		ch << ch << ch << ch << ch << ch << ch << ch << "  " << ch << ch << "   " << ch <<
		ch << "  " << ch << ch << endl;
	Beep(700, 130);
	cout << "\t\t ";
	Beep(760, 300);
	cout << ch << ch << "    " << ch << ch << "  " << ch << ch << "  " << ch << "   " << ch <<
		ch << ch << ch << ch << "  " <<
		ch << ch << "    " << ch << ch << "  " << ch << ch << "   " << ch << ch << "  " <<
		ch << ch << endl;
	Beep(660, 380);
	cout << "\t\t ";
	cout << ch << ch << "    " << ch << ch << "  " << ch << ch << "  " << ch << ch << "  " << ch <<
		ch << ch << ch << ch << "  " <<
		ch << ch << "    " << ch << ch << "  " << ch << ch << ch << ch << ch << ch << "   " <<
		ch << ch << ch << ch << ch << ch << endl;
	Beep(520, 630);

	Sleep(3000);
	SetConsoleTextAttribute(color, 15);

	cout << "\n\n\t\t\t ";
	cout << "LOADING...";
	for (int i = 0; i < 10; i++)
	{
		cout << ch << " ";
		Sleep(600);
	}

	system("Color 0A");
	cout << "\n\n\t\t\t\t   ";
	cout << "COMPLETE!";

	Sleep(3000);
	system("cls");
	cout << "\nEnter N If You Are a New Player";
	cout << "\nEnter O If You Are an Old Player" << endl;
	char ch1;

	cin >> ch1;

	userdetails u;
	int k = 10;

	if (ch1 == 'N' || ch1 == 'n')
	{
		cout << endl;
		u.getdata();
		k++;
	}
	else if (ch1 == 'O' || ch1 == 'o')
	{
		int m, j, n;
		m = u.checkdata();
		if (m == 0)
			k++;
		else
		{
			cout << endl;
			cout << endl;
			n = u.checkdata();
			if (n == 0)
				k++;
			else
			{
				Beep(660, 200);
				textcolor(RED);
				textbackground(BLACK);
				cout << endl;
				cout << endl;
				cprintf("You have exhausted 2 attempts!");
				Sleep(2000);
				exit(0);
			}
		}
	}
	else
	{
		Beep(660, 200);
		textcolor(RED);
		textbackground(BLACK);
		cprintf("\nInvalid Character Entered!");
		Sleep(2000);
		exit(0);
	}

	char p;

	if (k > 10) 
	{
		while (true)
		{
				cout << "\n\t\tEnter T to play Tic Tac Toe";
				cout << "\n\t\tEnter H to play Hangman";
				cout << "\n\t\tEnter E to exit" << endl;
				cin >> p;
				if (p == 'T' || p == 't')
					tictactoe(u);
				else if (p == 'H' || p == 'h')
					hangman(u);
				else if (p == 'e' || p == 'E')
					exit(0);
				else
				{
					Beep(660, 200);
					textcolor(RED);
					textbackground(BLACK);
					cout << endl;
					cprintf("Invalid Character Entered!");
					Sleep(2000);
					exit(0);
				}
		}
	}

	getch();

}