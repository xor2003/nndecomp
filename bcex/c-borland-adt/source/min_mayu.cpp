/* Convertir varias lineas de texto de minusculas a mayusculas.
	Continuar hasta que el primer caracter de una linea sea un '*'*/

#include <stdio.h>
#include <ctype.h>

#define EOL '\n'

void main () {
	char letras[80];
	int aux,cont;

	while ((letras[0] = getchar())!= '*') {
		/*leer una linea de texto*/
		for (cont = 1; (letras[cont] = getchar())!= EOL; ++cont)
			;
		aux = cont;

		/*escribir la linea de texto*/
		for ( cont = 0; cont<aux; ++cont)
			putchar(toupper(letras[cont]));
		printf("\n\n");
		}
		/*fin del bucle externo*/
	printf("Hasta luego");
}