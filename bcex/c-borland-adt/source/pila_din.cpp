/* IMPLEMENTACION DE UNA PILA DINAMICA */

#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#define VERDAD 1
#define FALSO 0

typedef struct {	char ayn[30]; unsigned long int dni;} t_info;

typedef struct s_nodo { t_info info;
								struct s_nodo *sig;} t_nodo;

typedef t_nodo* t_pila;


void crearPila(t_pila*); // t_pila* = t_nodo**
int ponerEnPila(t_pila*, const t_info*);
int verTope(t_pila*,t_info*);
void vaciarPila(t_pila*);
int sacarDePila(t_pila*, t_info*);
int pilaLlena();
int pilaVacia(t_pila*);
int ingresar(t_info*);


void main() {
	t_info reg;
	t_pila pila;
	crearPila(&pila);
	printf("Cargando datos en pila...\n\n");
	while(!pilaLlena() && ingresar(&reg))
		ponerEnPila(&pila, &reg);
	clrscr();
	printf("Los datos ya han sido cargados.\n");
	printf("Los datos se estan descargando de la pila...\n\n");
	while(!pilaVacia(&pila) && sacarDePila(&pila, &reg))
		printf("%-30s %ld\n",reg.ayn,reg.dni);
	printf("La pila ha sido vaciada satisfactoriamente.");
}


void crearPila(t_pila *p){
	*p = NULL;
}

int ponerEnPila(t_pila *p, const t_info *d){
	int marca;
	t_nodo *nue = (t_nodo*)malloc(sizeof(t_nodo));
	if(nue == NULL)
		//No se pudo asignar memoria
		marca = FALSO;
	else {
		//guardo el registro en el nodo nuevo
		nue->info = *d;
		//el siguiente nodo tiene la direccion anterior de p
		nue->sig = *p;
		//el nodo actual ahora tiene la direccion del nodo nuevo
		*p = nue;
		marca = VERDAD;
	}
	return marca;
}

int verTope(t_pila *p, t_info *d){
	int marca;
	if(*p == NULL)
		marca = FALSO;
	else {
		//Copio el contenido de (*p)->info en *d
		*d = (*p)->info;
		marca = VERDAD;
	}
	return marca;
}

void vaciarPila(t_pila *p){
	t_nodo *aux;
	//mientras *p no sea nula
	while(*p) {
		//guardo la direccion de *p en aux
		aux = *p;
		//llevo *p a la siguiente direccion
		*p = aux->sig;
		//limpio la direccion en aux
		free(aux);
	}
}

int sacarDePila(t_pila *p, t_info *d){
	int marca;
	t_nodo *aux;
	if(*p){
		//si p no es nula vacio esa direccion
		aux = *p;
		*d = aux->info;
		*p = aux->sig;
		free(aux);
		marca = VERDAD;
	}
	else
		marca = FALSO;
	return marca;
}

int pilaLlena(){
	int marca;
	t_nodo *nue = (t_nodo*) malloc(sizeof(t_nodo));
	if(nue == NULL)
		marca = VERDAD;
	else {
		free(nue);
		marca = FALSO;
	}
	return marca;
}

int pilaVacia(t_pila *p){
	int marca;
	if(*p == NULL)
		marca = VERDAD;
	else
		marca = FALSO;
	return marca;
}

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




