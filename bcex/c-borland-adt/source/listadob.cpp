/* FUNCIONES PARA LISTAS DOBLEMENTE ENLAZADAS */
/* El puntero "lista" apunta al primer elemento de la lista */

#include <stdlib.h>
#include <stdio.h>
#define true 1
#define false 0

//typedef struct {/* Valores del registro */ } t_info;

typedef struct s_nodo { int info; s_nodo *sig; s_nodo *ant;} t_nodo;

typedef t_nodo* t_lista;

/* INICIAR LISTA */
void iniciarLDE(t_lista *p){
	*p = NULL;
}

/* INSERTAR EN ORDEN ASCENDENTE  */
int insertarAscLDE(t_lista *p, int v) {
	t_lista nue, act;

	/* Crear un nodo nuevo */
	nue = (t_nodo*)malloc(sizeof(t_nodo));
	if(!nue)
		return false;

	nue->info = v;

	/* Colocamos actual en la primera posición de la lista */
	act = *p;
	if(act)
		while(act->ant)
			act = act->ant;

	/* Si la lista está vacía o el primer miembro es mayor que el nuevo */
	if(!act || act->info > v) {
		/* Añadimos la lista a continuación del nuevo nodo */
		nue->sig = act;
		nue->ant = NULL;
		if(act)
			act->ant = nue;
		if(!(*p)) *p = nue;
	}
	else {
		/* Avanzamos hasta el último elemento o hasta que el siguiente tenga
			un valor mayor que v */
		while(act->sig && act->sig->info <= v)
			act = act->sig;
		/* Insertamos el nuevo nodo después del nodo anterior */
		nue->sig = act->sig;
		act->sig = nue;
		nue->ant = act;
		if(nue->sig) nue->sig->ant = nue;
	}
	return true;
}

/* INSERTAR EN ORDEN DESCENDENTE */
int insertarDescLDE(t_lista *p, int v) {
	t_lista nue, act;

	/* Crear un nodo nuevo */
	nue = (t_nodo*)malloc(sizeof(t_nodo));
	if(!nue)
		return false;

	nue->info = v;

	/* Colocamos actual en la primera posición de la lista */
	act = *p;
	if(act)
		while(act->ant)
			act = act->ant;

	/* Si la lista está vacía o el primer miembro es menor que el nuevo */
	if(!act || act->info < v) {
		/* Añadimos la lista a continuación del nuevo nodo */
		nue->sig = act;
		nue->ant = NULL;
		if(act)
			act->ant = nue;
		if(!(*p)) *p = nue;
	}
	else {
		/* Avanzamos hasta el último elemento o hasta que el siguiente tenga
			un valor menor que v */
		while(act->sig && act->sig->info >= v)
			act = act->sig;
		/* Insertamos el nuevo nodo después del nodo anterior */
		nue->sig = act->sig;
		act->sig = nue;
		nue->ant = act;
		if(nue->sig) nue->sig->ant = nue;
	}
	return true;
}

/* INSERTAR AL PRINCIPIO */
int insertarPriLDE(t_lista *p, int v){
	t_nodo *nue = (t_nodo*)malloc(sizeof(t_nodo)), *act;
	if(!nue)
		return false;
	nue->info = v;
	if(*p){
		act = *p;
		while(act->ant)
			act = act->ant;
		nue->ant = act->ant;
		nue->sig = act;
	}
	else {
		nue->sig = NULL;
		nue->ant = NULL;
	}
	*p = nue;
	return true;
	/* Nota: El puntero p termina apuntando al nuevo nodo */
}

/* INSERTAR AL FINAL */
int insertarFinLDE(t_lista *p, int v){
 t_nodo  *act = *p, *nue = (t_nodo*)malloc(sizeof(t_nodo));
 if(!nue)
	return false;

 nue->info = v;

 if(*p){
	act = *p;
	while(act->sig)
		act = act->sig;
	nue->sig = act->sig;
	act->sig = nue;
	nue->ant = act;
 }

 else {
	nue->sig = NULL;
	nue->ant = NULL;
	*p = nue;
 }

 return true;
}

/* ELIMINAR POR VALOR EN LISTA NO ORDENADA */
int eliminarLDE(t_lista *p, int v){
	int marca = true;
	t_nodo *aux, *act = *p, *ant = NULL;
	if(act){
		if(act->ant != NULL)
			while(act->ant)
				act = act->ant;
		while(act->sig && act->info != v){
			ant = act;
			act = act->sig;
		}
		if(act->info == v){
			aux = act;
			if(aux->ant)
				ant->sig = aux->sig;
			if(aux->sig)
				aux->sig->ant = ant;
			free(aux);
		}
		else
			marca = false;
	}
 return marca;
}

/* ELIMINAR POR VALOR EN LISTA ORDENADA ASCENDENTE */
int eliminarAscLDE(t_lista *p, int v){
 int marca = true;
 t_nodo *aux, *act = *p, *ant;
 if(act){
	// Si el valor actual es menor, me muevo hacia adelante
	if(act->info < v)
		while(act->sig && act->info < v)
			act = act->sig;
	else {// O si el valor actual es mayor me muevo hacia atras
			if(act->info > v)
				while(act->ant && act->info > v)
					act = act->ant; }
	if(act->info == v){
		aux = act;
		if(act->ant) { // Verifico que no sea el primero
			ant = act->ant;
			ant->sig = act->sig;
			if(act->sig) // Verifico si es el ultimo
				act->sig->ant = aux->ant;
		}
		else // Si es el primero
			act->sig->ant = NULL;
		free(aux);
	}
	else marca = false;
 }
 else marca = false;
 return marca;
}

/* BUSCAR EN LISTA NO ORDENADA */
int buscarLDE(t_lista *p, int v){
	int marca = true;
	t_nodo *act= *p;
	if(act){
		while(act->ant)
			act = act->ant;
		while(act->sig && act->info != v)
			act = act->sig;
		if(act->info != v)
			marca = false;
	}
	else marca = false;
	return marca;
}

/* LISTAR DESDE EL PRINCIPIO */
void listarPriLDE(t_lista *p){
	t_nodo *act;
	act = *p;
	if(act){
		while(act->ant)
			act = act->ant;
		while(act){
			printf("Valor: %d\n",act->info);
			act = act->sig;
		}
	}
	else
		printf("\n\aLISTA VACIA\n");
}

/* LISTAR DESDE EL FINAL */
void listarFinLDE(t_lista *p){
	t_nodo *act;
	act = *p;
	if(act){
		while(act->sig)
			act = act->sig;
		while(act){
			printf("Valor: %d\n",act->info);
			act = act->ant;
		}
	}
	else
		printf("\n\aLISTA VACIA\n");
}

/* VACIAR LA LISTA */
void vaciarLDE(t_lista *p){
	t_nodo *aux;
   /* 'P' es el puntero al inicio de la lista */
	while(*p){
		aux = *p;
		*p = aux->sig;
		free(aux);
	}
}
