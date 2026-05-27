/* determinar los n primeros numeros de la serie de fibonacci */

#include <stdio.h>

void main() {

 long int a = 1L, b = 0L;
 int n, i = 0;

 printf("Cantidad de numeros de Fibonacci a determinar: ");
 scanf("%ld",&n);

 printf("\n\nSerie de Fibonacci: ");

 /*calcula la serie*/
 while (i < n) {
	a = a+b;
	b = b+a;
	printf("\n%ld",a);
	i++;
	if(i < n) {
		printf("\n%ld",b);
		i++;
     }
 }
}
