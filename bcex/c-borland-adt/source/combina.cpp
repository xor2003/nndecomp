#include <stdio.h>
#include <conio.h>
#include <c:\student\borland\source\factoria.cpp>

double combinatorio (int m, int n) {
	double comb = 0;

	if(m>=n && n>=0) {
		comb = factorial(m) / (factorial(n) * factorial(m-n));
	}

	else {
		printf("\aError. Valores incorrectos\Se devolvera un 0..");
		getch();
	}
	return comb;

}