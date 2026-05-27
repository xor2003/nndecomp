/* Leer una linea de texto y escribirla en orden inverso usando recursividad.
 *	Ejemplo 7.15 del libro de Byron Gotfried */

 #include <stdio.h>
 #define EOLN '\n'

 void inverso (); /* prototipo de funcion */

 void main() {
	printf("Introduce una linea de texto debajo\n");
	inverso();
 }

 void inverso () {
	char c;
	if((c = getchar()) != EOLN) inverso();
	putchar(c);
	return;
 }