#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void main(){
	char lista[5][15];
	int i=0;
	while(i<5){
	fflush(stdin);
	gets(lista[i]);
	i++;
	}

	for(i=0; i<5; i++){
		printf("\n%s",lista[i]);
	}
}
