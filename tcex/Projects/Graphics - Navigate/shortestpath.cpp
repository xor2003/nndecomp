#include "gourav.h"

#define TRUE 1
#define FALSE 0
#define MAXNODES 8
#define INFINITY 9999

int distance[MAXNODES + 1];
int perm[MAXNODES + 1];
int nodal[MAXNODES + 1];

int weight[MAXNODES + 1][MAXNODES + 1];

int findpath(int, int, int);
int shortpath(int, int, int[]);

void main()
{
	clrscr();

	weight[1][2] = weight[1][3] = weight[4][5] = weight[4][3] = weight[3][2] =
		weight[3][6] = weight[2][7] = weight[5][8] = weight[6][7] =
			weight[6][8] = 1;
	for (int i = 1; i <= MAXNODES; i++)
	{
		for (int j = 0; j <= MAXNODES; j++)
		{
			if (weight[i][j] == 1)
				weight[j][i] = 1;
			else
			{
				weight[i][j] = INFINITY;
				continue;
			}
		}
	}

	int n;
	int precede[MAXNODES + 1];
	n = shortpath(1, 8, precede);
	cout << "\n\n\t" << n << " \n\n\n\t\t";

	/*	for(i=1;i<=MAXNODES;i++)
	 cout<<precede[i]<<" ";
	 */
	for (i = 0; i <= MAXNODES; i++)
		nodal[i] = 0;

	if (findpath(n, 1, 8) == 1)
	{
		cout << "exists from s to t";
	}

	for (i = 0; i < 9; i++)
		cout << nodal[i];

	getch();
}

int findpath(int k, int a, int b)
{
	int i = 0;
	if (k == 1)
		return 1;

	for (int c = 1; c <= 8; c++)
	{
		if ((weight[a][c] != INFINITY) && findpath(k - 1, c, b))
		{
			nodal[i] = c;
			i++;
		}
	}
	return 0;
}

int shortpath(int s, int t, int precede[])
{
	int current, dc, k = 1;
	int smalldist, newdist;
	for (int i = 0; i <= MAXNODES; i++)
	{
		distance[i] = INFINITY;
		perm[i] = FALSE;
		precede[i] = 0;
	}
	perm[s] = TRUE;
	distance[s] = 0;
	current = s;
	while (current != t)
	{
		smalldist = INFINITY;
		dc = distance[current];
		for (i = 1; i <= MAXNODES; i++)
		{
			if (perm[i] == FALSE)
			{
				newdist = dc + weight[current][i];
				if (newdist < distance[i])
				{
					distance[i] = newdist;
					precede[i] = current;
				}
				if (distance[i] < smalldist)
				{
					smalldist = distance[i];
					k = i;
				}
			}
		}
		current = k;
		perm[k] = TRUE;
	}

	return distance[t];
}
