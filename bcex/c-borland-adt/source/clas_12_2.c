#include <stdio.h>
#include <stdlib.h>
#define VERDAD 1
#define FALSO 0

typedef struct {	unsigned int cod;
						float importe; } t_info;

typedef struct s_nodo { t_info info;
								struct s_nodo *sig; } t_nodo;

typedef t_nodo *t_pila;

void crearPila(t_pila*);
int ponerEnPila(t_pila*, const t_info*);
int verTope (t_pila*);
int sacarDePila(t_pila*, t_info*);
int pilaVacia(t_pila*);

void main (){
	int cont = 0;
	t_info reg1, reg2, aux;

}

void crearPila(t_pila *p){
	*p == NULL;
}

int ponerEnPila(t_pila *p, const t_info *d){
	int marca;
	t_nodo *nue = (t_nodo*)malloc(sizeof(t_nodo));
	if(nue == NULL)
		marca = FALSO;
	else	{
		nue->info = *d;
		nue->sig = *p;
		*p = nue;
		marca = VERDAD;
	}
	return marca;
}

int verTope (t_pila *p){
	int tope;
	if(*p == NULL)
		tope = FALSO;
	else {
		tope = (*p)->info.cod;
	}
	return tope;
}

int sacarDePila(t_pila *p, t_info *d){
	int marca;
	t_nodo *aux;
	if(*p) {
		aux = *p;
		*d = aux->info;
		*p = aux->sig;
		free(aux);
		marca = VERDAD;
	}
	else marca = FALSO;
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
