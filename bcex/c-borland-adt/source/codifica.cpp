/* leer una cadena de caracteres, reemplazar a continuacion
	cada caracter por un caracter codificado correspondiente */

#include <stdio.h>

void main () {
	char linea[80];
	int cont;

	/*leer la linea completa*/

	printf("Introducir debajo una linea de texto:\n");
	scanf("%[^\n]",linea);

	/*codificar cada caracter y escribirlo*/

	for (cont = 0; linea[cont] != '\0'; cont++) {
		if(((linea[cont] >= '0') && (linea[cont] < '9')) ||
			((linea[cont] >= 'A') && (linea[cont] < 'Z')) ||
			((linea[cont] >= 'a') && (linea[cont] < 'z')))
				putchar(linea[cont] + 1);
		else 	if (linea[cont] == '9') putchar('0');
				else if (linea[cont] == 'Z') putchar ('A');
					else if (linea[cont] == 'z') putchar('a');
						  else putchar('.');
	}
}