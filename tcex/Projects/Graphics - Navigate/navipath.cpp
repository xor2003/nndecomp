#include <iostream.h>
#include <conio.h>
#include <string.h>

#define max 12
#define inf 9999
#define true 1
#define false 0

void findpath(int, int, int[][max + 1], int[], char[][20]);
void inttostr(int, char[]);

void main()
{
	clrscr();

	int s, t;
	int distance[max + 1], weight[max + 1][max + 1];
	char path[max + 1][20];

	for (int i = 0; i <= max; i++)
	{
		distance[i] = inf;
		strcpy(path[i], "");
	}

	for (i = 0; i <= max; i++)
		for (int j = 0; j <= max; j++)
			weight[i][j] = inf;

	weight[1][2] = 1;
	weight[1][4] = 1;
	weight[1][5] = 1;
	weight[2][7] = 3;
	weight[2][3] = 1;
	weight[3][4] = 2;
	weight[4][6] = 2;
	weight[5][11] = 4;
	weight[6][7] = 3;
	weight[6][8] = 3;
	weight[6][10] = 1;
	weight[7][9] = 5;
	weight[8][9] = 1;
	weight[9][12] = 2;
	weight[10][11] = 2;
	weight[10][12] = 1;
	weight[11][12] = 3;

	for (i = 0; i <= max; i++)
	{
		for (int j = 0; j <= max; j++)
		{
			if (weight[i][j] != inf)
				weight[j][i] = weight[i][j];
		}
	}

	cout << "\n\tEnter starting point:-\t";
	cin >> s;
	cout << "\n\tEnter Destination:-\t";
	cin >> t;

	if (t < s)
	{
		int temp = t;
		t = s;
		s = temp;
	}

	findpath(s, t, weight, distance, path);
	cout << "\n\tDistance:-\t\t" << distance[t];
	cout << "\n\tPath:-\t\t\t" << path[t];

	getch();
}

void findpath(int s, int t, int weight[][max + 1], int distance[],
			  char path[][20])
{
	distance[s] = 0;
	int current = s, newdist = 0, dead[max + 1];
	int dc = 0;
	char pc[20] = "", str[3] = "", newpath[20] = "";

	for (int i = 0; i <= max; i++)
		dead[i] = false;

	while (current != t)
	{
		dc = distance[current];
		strcpy(pc, path[current]);
		for (int i = 1; i <= max; i++)
		{
			newdist = dc + weight[current][i];

			inttostr(i, str);
			strcat(pc, str);
			strcpy(newpath, pc);

			if (newdist < distance[i])
			{
				distance[i] = newdist;
				strcpy(path[i], newpath);
			}
			strcpy(pc, path[current]);
		}
		dead[current] = true;
		for (i = 1; i <= max; i++)
		{
			if (dead[i] == false)
			{
				current = i;
				break;
			}
			else
				current = -1;
		}
	}
}

void inttostr(int num, char str[])
{
	strcpy(str, "");
	int copy = 0;
	char ch[] = "00";
	copy = num;

	while (copy > 0)
	{
		switch (copy % 10)
		{
		case 0:
			strcpy(ch, "0");
			break;
		case 1:
			strcpy(ch, "1");
			break;
		case 2:
			strcpy(ch, "2");
			break;
		case 3:
			strcpy(ch, "3");
			break;
		case 4:
			strcpy(ch, "4");
			break;
		case 5:
			strcpy(ch, "5");
			break;
		case 6:
			strcpy(ch, "6");
			break;
		case 7:
			strcpy(ch, "7");
			break;
		case 8:
			strcpy(ch, "8");
			break;
		case 9:
			strcpy(ch, "9");
			break;
		}
		copy /= 10;
		strcat(str, ch);
	}
	strrev(str);
	strcat(str, "_");
}
