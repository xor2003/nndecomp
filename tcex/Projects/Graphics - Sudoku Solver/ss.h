/*
 * 	ss.h / Sudoku_Solver
 *
 *  Created on: 09-Dec-2014
 *      Author: Gourav Siddhad
 */

#ifndef SS_H_
#define SS_H_

#include "iostream"
#include "iomanip"
using namespace std;

class sudoku
{
	int matrix[9][9];

public:
	sudoku();
	sudoku(int[][9]);
	void input();
	void solve();
	void print();
};

sudoku::sudoku()
{
	for (int i = 0; i < 9; i++)
		for (int j = 0; j < 9; j++)
			matrix[i][j] = 0;
}

sudoku::sudoku(int a[][9])
{
	for (int i = 0; i < 9; i++)
		for (int j = 0; j < 9; j++)
			matrix[i][j] = a[i][j];
}

void sudoku::input()
{
	cout << "\n If Value Exist Then Enter Else Enter 0 \n";
	for (int i = 0; i < 9; i++)
		for (int j = 0; j < 9; j++)
		{
			cout << " Enter Value At " << i + 1 << "," << j + 1 << " : ";
			cin >> matrix[i][j];
		}
}

void sudoku::solve()
{
}

void sudoku::print()
{
	for (int i = 0; i < 9; i++)
	{
		for (int j = 0; j < 9; j++)
		{
			if (i % 3 == 0 && j == 0)
				cout << " +-------+-------+-------+\n";
			if (j % 3 == 0)
				cout << " |";
			if (matrix[i][j] == 0)
				cout << setw(2) << "";
			else
				cout << setw(2) << matrix[i][j];
		}
		cout << " | " << endl;
	}
	cout << " +-------+-------+-------+";
}

#endif /* SS_H_ */
