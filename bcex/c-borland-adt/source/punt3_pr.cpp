/*Estudio de la relacion entre los arrays y los punteros*/

#include <stdio.h>
#include <conio.h>
#include <string.h>

void main () {

	char haiku[]={"Un ruiseñor ha llegado a la puerta de nuestro paraiso, durante el silencio lo he oido..."};
   char *origa = haiku;

	printf("Frase original: \n\n");
	puts(haiku);

  /*	while (*origa!='\0') {

		 printf("%c", *origa);
       origa++;
	}     */
	puts("\n");

	//Sumo a la direccion inicial, la longitud del array y le resto 1 (por '\0')
	origa= (haiku + strlen(haiku))-1;

   //Mientras que la direccion de origa sea mayor o igual que la de haiku...
	while (origa>=haiku) {
		printf("%c",*origa);
		origa--;

	}
	origa++;
	puts("\n\n");

	while (*origa!='\0') {
		printf("\t\t%c\t\t%p\n",*origa,origa);
      origa++;
	}

}
