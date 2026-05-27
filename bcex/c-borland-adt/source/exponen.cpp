#include <stdio.h>
#include <conio.h>
#include <math.h>
#include <c:\student\borland\source\factoria.cpp>
#include <c:\student\borland\source\potencia.cpp>
#define TOL 0.00001

double exponencial(int x) {
	int i = 1;
	double exp = 1, termino;

	do {
		termino = potencia(x,i) / factorial(i++) ;
		exp += termino;

		} while(termino >= TOL);

   return exp;
}