#include <string.h>
#include <stdio.h>

void formaPalabra(char*);
int ocurrencias(char*,int);

// 131112771316111

void main(){
	int x,n;
	char pal[20];
	puts("Ingrese palabra");
	fflush(stdin);
	gets(pal);

	do{
		printf("Ingrese nro de tres cifras: ");
		scanf("%d",&x);
		if(x<100 || x>999)
			printf("Error, vuelva a ingresar");
	}while(x<100 || x>999);

	/*formaPalabra(pal);
	puts(pal);*/
	n = ocurrencias(pal,x);
	printf("\nLa cantidad de ocurrencias es %d",n);
}

void formaPalabra(char *s){
	char *aux=s;
	int n;

	while(*s){
		n = 0;
		while(*s && *s!=' '){
			s++; n++;
		}
		*(++aux) = n + '0';
		*(++aux)=*s;
		if(*s){
			aux++; s++;
			*aux = *s;
		}
	}
}

int ocurrencias(char *s,int x){
	int ocur = 0;

	while(*s && *(s+1) && *(s+2)){
		if(*s == ((x/100) + '0') && *(s+1) == ((x%100)/10 + '0') && *(s+2) == (x % 10 + '0'))
			ocur++;
		s++;
	}
	return ocur;
}
