#include <stdio.h>
#include <ctype.h>

void main () {
	FILE *pf1;
	char letra;

	printf("Escribe texto [Para finalizar ingresa '*']: ");

	pf1= fopen("muestra1.txt","w");

	do {
		putc (letra = getchar(),pf1);

	}while(letra!='*');

	fclose(pf1);
}