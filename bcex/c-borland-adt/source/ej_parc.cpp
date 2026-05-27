#include <stdio.h>

char* formaPal(char *s);

void main(){
	char recetas[5][15]={"neuq1", "men0","al1","am1","ana1"};

	for(int i = 0; i < 5; i++){
		printf("Plato N: %d \tNombre: %-15s\n",i+1,formaPal(recetas[i]));
	}
}

char* formaPal(char *s){

	char *init=s, *fin, *ret=s;
	int n=0, i=0;

	while(*s!=0 && *s!=1){
		s++;
		n++;
	}
	if(s == 0){
		s=(s-1);
		n--;
	}

	else {
		s=(s-2);
		n=n-2;
	}

	fin = init + 2*n;
	*(fin+1)='\0';

	while(i < (2*n)/2){
		*fin = *init;
		fin--;
		init++;
		i++;
	}
	return ret;
}