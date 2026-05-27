/* calcular la media geometrica de una lista de n numeros */

#include <stdio.h>
#include <math.h>
#define CIERTO 1
#define FALSO 0

void main() {

	int i = 0, error;
	double media;
	float x, prod = 1;

	printf("Ingrese los numeros para calcular la media geometrica [0 -> Fin]:\n");

	do {
		scanf("%f",&x);
		if (x < 0) {
			printf("Error. Valor incorrecto\a");
			error = CIERTO;
			}
		else error = FALSO;
		} while (error);

	while (x != 0) {
		prod *= x;
		i++;
		do {
			scanf("%f",&x);
			if (x < 0) {
				printf("Error. Valor incorrecto\a");
				error = CIERTO;
			}
			else error = FALSO;
		} while (error);
	}

	if (i != 0){
	media = pow (prod,1/(float)i);
	printf("La media geometrica es: %5.2f",media);
	}
   else printf ("\n\n\No se ingreso ningun valor.");
}
