/* COLA DINAMICA */

#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#define VERDAD 1
#define FALSO 0

typedef struct s_info {
						char ayn[25];
						unsigned long int dni;
					} t_info;

typedef struct s_nodo {
								t_info info;
								struct s_nodo *sig;
								} t_nodo;

typedef struct s_cola {
						t_nodo *pri;
						t_nodo *ult;
						} t_cola;

void crearCola(t_cola*);
void vaciarPila(t_cola*);
int ingresar(t_info*);
int colaVacia(t_cola*);
int ponerEnCola(t_cola*,t_info*);
int sacarDeCola(t_cola*, t_info*);

void main(){

	t_info reg;
	t_cola cola;

	crearCola(&cola);
	ingresar(&reg);
	//Mientras hay memoria y no se ingrese la condicion de fin (DNI=0)
	while(ingresar(&reg))
		ponerEnCola(&cola,&reg);
	clrscr();
	printf("\n\aLa cola esta lista.");
	printf("\nVaciando la cola...\n");
	while(!colaVacia(&cola) && sacarDeCola(&cola,&reg))
		printf("AyN: %-20s DNI: %ld\n",reg.ayn,reg.dni);

}

void crearCola(t_cola *p){
	p->pri = NULL;
	p->ult = NULL;
}

void vaciarCola(t_cola *p){
	p->pri = NULL;
	p->ult = NULL;
}

int colaVacia(t_cola *p){
	int marca = FALSO;
	if(!p->pri)
		marca = VERDAD;
	return marca;
}

int ponerEnCola(t_cola *p, t_info *d) {
	int marca;
	t_nodo *nue = (t_nodo*)malloc(sizeof(t_nodo));
	if(!nue)
		marca = FALSO;
	else {
		nue->info = *d;
		nue->sig = NULL;
		if(p->pri == NULL)
			p->pri = nue;
		else
			p->ult->sig = nue;
		p->ult = nue;
		marca = VERDAD;
	}

	return marca;
}

int sacarDeCola(t_cola *p, t_info *d) {
	int marca;
	// Pongo la direccion de p en aux
	if(p->pri == NULL) {
		marca = FALSO;
	}
	else {
		t_nodo *aux = p->pri;
		// Guardo el contenido del ultimo elemento de la cola en *d
		*d = p->pri->info;
		p->pri = p->pri->sig;
		free(aux);
		marca = VERDAD;
	}
	return marca;
}
//Funcion para ingresar datos
int ingresar(t_info *d){
	int marca = VERDAD;
	printf("DNI: ");
	scanf("%ld",&d->dni);
	if(d->dni == 0)
		marca = FALSO;
	else {
		fflush(stdin);
		printf("AyN: ");
		scanf("%[^\n]",d->ayn);
	}
   return marca;
}