/*determinar las raices de una ecuacion algebraica (x(5)+3x(2)-10=0)
  utilizando un procedimiento iterativo con x = ( 10 - 3x(2) )(1/5)  */

#include <stdio.h>
#include <math.h>

#define CIERTO 1
#define FALSO 0

void main() {
	int indicador = CIERTO, cont = 0;
	float valor, raiz, test, error;

	/*leer parametros de entrada*/

	printf("Valor inicial: ");
	scanf("%f",&valor);
	while(indicador) {
		/*comienza bucle principal*/

		++cont;
		if(cont == 50) indicador = FALSO;
		test = 10. -3. * valor * valor;
		if(test > 0) {
			raiz = pow(test, 0.2);
			printf("Iteracion numero: %2d",cont);
			printf("\tx= %7.5f\n", raiz);
			error=fabs(raiz - valor);
			if(error > 0.00001) valor=raiz; /*repetir el calculo*/
			else {		/*visualizar la respuesta final*/
					indicador=FALSO;
					printf("\n\nRaiz= %7.5f",raiz);
					printf("\t\tNº Iteraciones = %2d",cont);
					}
		}
		else {    /*mensaje de error*/
			indicador = FALSO;
			printf("\nNumeros fuera de rango -");
			printf("Intenta con otro valor inicial");
		}
	}
	if((cont == 50) && (error > 0.00001)) /*otro mensaje de error*/
		printf("\n\nConvergencia no obtenida tras 50 iteraciones");
}