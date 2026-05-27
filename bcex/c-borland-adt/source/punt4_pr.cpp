#include <stdio.h>
#include <string.h>
#include <ctype.h>

void main() {
	char cadena[80];
	char *apunta;
	apunta = cadena;

	puts("Ingrese una linea de texto en mayuscula: \n");
	gets(cadena);
	puts("\n\nCAMBIO A MINUSCULAS:\n");

	for(;*apunta!='\0';apunta++) {
       printf("%c",tolower(*apunta));

	}

}