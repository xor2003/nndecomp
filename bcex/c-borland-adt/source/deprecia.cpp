/* calcular la depreciacion anual utilizando uno de tres metodos diferentes*/

#include <stdio.h>

void main() {
	int n, anual, eleccion = 0;
	float val, aux, deprec;

	while (eleccion != 4) {
		/*leer datos de entrada*/

		printf("\nMetodo: (1-LR 2-BDD 3-SDA 4-Fin) ");
		scanf("%d", &eleccion);
		if (eleccion >= 1 && eleccion <= 3) {
			printf("Valor original: ");
			scanf("%f",&val);
			printf("Numero de años: ");
			scanf("%d",&n);
			if(n <=0) n=1;
		}

		switch (eleccion) {

			case 1: /*metodo de linea recta*/

				printf("\nMetodo de la linea recta\n\n");
				deprec=val/n;
				for(anual = 1; anual <= n; ++anual) {
					val -= deprec;
					printf("Fin de año %2d", anual);
					printf("\tDepreciacion: %7.2f", deprec);
					printf("\tValor actual: %8.2f\n", val);
				}
				break;

			case 2: /*metodo de balance doblemente declinante */

				printf("\nMetodo de balance doblemente declinante\n\n");
				for(anual = 1; anual <= n; ++anual) {
					deprec = 2*val/n;
					val -= deprec;
					printf("Fin de año %2d", anual);
					printf("\tDepreciacion: %7.2f", deprec);
					printf("\tValor actual: %8.2f\n", val);
				}
				break;

			case 3: /*metodo de la suma de los digitos de los años*/

				printf("\nMetodo de la suma de los digitos de los años\n\n");
				aux=val;
				for(anual = 1;  anual <= n; ++anual) {
					deprec = (n-anual+1)*aux / (n*(n + 1) / 2);
					val -= deprec;
					printf("Fin de año %2d", anual);
					printf("\tDepreciacion: %7.2f", deprec);
					printf("\tValor actual: %8.2f\n", val);
             }
				break;

			case 4: /*fin de los calculos*/

				printf("\n\aHasta luego y que tenga un buen dia\n");
				break;

			default:  /*generar mensaje de error*/

				printf("Entrada de datos incorrecta");
				printf("- repite por favor\n");
			} /*fin del switch*/
		} /*fin del while*/
   }