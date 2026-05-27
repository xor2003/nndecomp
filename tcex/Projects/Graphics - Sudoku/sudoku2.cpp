#include <iostream.h>
#include <conio.h>
#include <stdlib.h>

//void printsudoku(char[][9]);
void generatesudoku(char[][9]);

//void generatepuzzle(char a[][9],char b[][9]);

void main()
{
	randomize();
	clrscr();
	char main[9][9]; //ori[9][9],user[9][9];
	for (int j = 0; j < 9; j++)
		for (int k = 0; k < 9; k++)
			main[j][k] = 0;

	generatesudoku(main);
	//	generatepuzzle(main,ori);
	//	printsudoku(main);

	getch();
}

void generatesudoku(char check[][9])
{
	randomize();
	char no;
	int flag = 0, l, m, j, k, flagh = 0;

	//no=char(random(9)+1+48);

	for (j = 0; j < 9; j++)
	{
		for (k = 0; k < 9; k++)
		{
		renew:
			no = char(random(9) + 1 + 48);
			//row check
			for (l = 0; l < k; l++)
			{
				if (check[j][l] == no)
				{
					k--;
					flag = 1;
					break;
				}
			}
			if (flag == 1)
			{
				flag = 0;
				continue;
			}
			flag = 0;
			//col check
			for (l = 0; l < j; l++)
			{
				if (check[l][k] == no)
				{
					flag = 1;
					k--;
					break;
				}
			}
			if (flag == 1)
			{
				flag = 0;
				continue;
			}

			//3x3 check
			for (l = 3 * (j / 3); l < 3 * (j / 3) + 3; l++)
			{
				for (m = 3 * (k / 3); m < 3 * (k / 3) + 3; m++)
				{
					if (check[l][m] == no)
					{
						k--;
						goto renew;
					}
				}
			}
			check[j][k] = no;
			cout << no;
		}
		cout << endl;
	}
}

/*void printsudoku(char a[][9])
 {
 for(int j=0;j<9;j++)
 {
 for(int k=0;k<9;k++)
 {
 cout<<a[j][k]<<" ";
 }
 cout<<"\n";
 }
 } */