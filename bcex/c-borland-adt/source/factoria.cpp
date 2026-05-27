/* funcion para calcular el factorial */

#include <stdio.h>

double factorial (int x) {
	int i;
	double prod=1.00;

	if (x > 0){

		for(i = 1; i <= x; i++) {

			prod *= i;
		}
	 }
	 else 	printf ("Error!\a");

   return (prod);
}