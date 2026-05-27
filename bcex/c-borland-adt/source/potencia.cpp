#include <stdio.h>

//Despues tengo que pensar como mejorarlo para que los exponentes sean reales

double potencia (double x, int y) {
	int i;
	double pot = 1;

	for( i = 0; i < y ; i++) {

		pot *= x;

	}

   return pot;

}