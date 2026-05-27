/* verificar propiedades del FABS */

#include <stdio.h>
#include <conio.h>
#include <math.h>
#include <string.h>

void main () {
	double x, y, z, prueba;

	puts("Ingrese tres numeros cualquiera");
	scanf("%lf %lf %lf", &x,&y,&z);

	prueba = fabs(x + y + z);

	puts("El valor absoluto de la suma de estos es: ");
	printf("%lf", prueba);

   if(prueba > 50.3412) puts("\nEs mayor que 50.3412");
}