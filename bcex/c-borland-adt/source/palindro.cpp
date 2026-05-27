/* buscar un palindromo */

#include <stdio.h>
#include <ctype.h>

#define EOL '\n'
#define CIERTO 1
#define FALSO 0

void main() {
	char letras[80];
	int aux, cont, contr, indicador, bucle = CIERTO;

	/* bucle principal */

	while (bucle) {
		indicador = CIERTO;

		/*leer el texto*/

		printf("Introduce una palabra o frase debajo: \n");
		for(cont = 0; (letras[cont] = getchar()) != EOL; ++cont)
			;
		if ((toupper(letras[0]) == 'F') &&
			 (toupper(letras[1]) == 'I') &&
			 (toupper(letras[2]) == 'N')) break;
		aux = cont -1;

		/*realizar la busqueda*/

		for ((cont = 0, contr = aux); cont <= aux/2;
			  (++cont, --contr)) {

				if (toupper(letras[cont]) != toupper(letras[contr])) {
					indicador = FALSO;
					break;
				}
		}
		/* escribir mensaje */

		for (cont = 0; cont <= aux; ++cont)
			putchar(letras[cont]);
		if  (indicador) printf(" ES un palindromo\n\n");
		else printf(" NO ES un palindromo\n\n");
		}
  }