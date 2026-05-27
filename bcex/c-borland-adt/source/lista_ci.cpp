/* PILA CIRCULAR */

#include <stdio.h>
#include <stdlib.h>
#define VERDAD 1
#define FALSO 0

typedef struct s_nodo {
								int valor;
								s_nodo* sig;
								} t_nodo;

typedef t_nodo* t_lista;

void iniciar(t_lista*);
int insertar(t_lista*, int);
int quitar(t_lista*, int);
void mostrar(t_lista*);

void main (){

	t_lista lista;

}

/* Al iniciar la lista, se le asigna al puntero "lista" el valor NULL */
void iniciar(t_lista *p){
	*p = NULL;
}


int insertar(t_lista *p, int x){
	int marca = VERDAD;
	//Creo un nodo nuevo
	t_nodo *nue = (t_nodo*)malloc(sizeof(t_nodo)), *aux = *p;
	if( nue == NULL)
		marca = FALSO;
	if(aux) {
			nue->valor = x;
			nue->sig = aux->sig;
			aux->sig = nue;
			*p = nue;
	}
	else {
		nue->sig = nue;
      *p = nue;

	}

	return marca;
}

//Quitar un elemento de una lista desordenada
int quitar(t_lista *p, int x){
	int marca = VERDAD;
	t_nodo *nodo,*aux;
	nodo = *p;
	while(nodo && nodo->valor != x){
		nodo = nodo->sig;
	}

	if(nodo && nodo->valor == x){
	/* Borrar el nodo */
		if(!anterior) // Es el primer elemento
			*p = nodo->sig
	}

}

void mostrar(t_lista*);

