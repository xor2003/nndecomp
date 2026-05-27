#include <stdio.h>

void muestra(int);

void main(){
muestra(3);

}

void muestra(int n){
	if(n > 1) {
		muestra(n-1);
		printf("*");
	}
   printf("\n");
}
