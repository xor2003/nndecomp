/* leer una linea en minusculas y almacenar en mayusculas en un archivo de datos */

#include <stdio.h>
#include <ctype.h>

void main() {
	FILE *fpt;
	char c;

	/* leer cada caracter y escribir su mayuscula correspondiente en el archivo */
	fpt = fopen("muestra2.txt","w");

	do putc(toupper(c = getchar()),fpt);
		while (c != '\n');

   /*cerrar el archivo de datos */
	fclose(fpt);	 

}
