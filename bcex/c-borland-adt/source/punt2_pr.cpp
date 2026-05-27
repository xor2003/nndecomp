#include <stdio.h>

void main() {
	int *punt1,x;
	char *punt2,letra;
	letra='a';
	x=100;

	punt1=&x;
	punt2=&letra;

	printf("Puntero a x es %p\n",punt1);
	printf("Puntero a siguiente es %p\n",++punt1);
	printf("Puntero a letra es %p\n",punt2);
	printf("Puntero a siguiente es %p \n",++punt2);

   printf("\n\n\n");

	if(punt1 < punt2) {
		printf("Puntero a x apunta a una direccion de memoria mas baja que Puntero a letra");
	}
	else printf("Puntero a x apunta a una direccion de memoria mas alta que Puntero a letra");
}