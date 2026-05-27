#include <stdio.h>
#include <stdlib.h>

typedef struct s_nodo	{ char info; s_nodo *sig; } t_nodo;
typedef t_nodo* t_lista;

void crear(t_lista*);
int vacia(t_lista*);
int insertar(t_lista*, char);
int insertarAsc(t_lista*, char);
int insertarDesc(t_lista*,char);
void listar(t_lista*);
int eliminar(t_lista*,char);
void ordenarAsc(t_lista*);
void vaciar(t_lista*);
int buscar(t_lista*,char);

void main(){
	t_lista lista /*aux*/;
	crear(&lista);
	insertar(&lista,'k');
	insertar(&lista,'ñ');
	insertar(&lista,'o');
	insertar(&lista,'a');
	insertar(&lista,'y');
	insertar(&lista,'b');
	insertar(&lista,'?');
	insertar(&lista,'e');
	insertar(&lista,'l');
   //ordenarAsc(&lista);
	listar(&lista);
	printf("\n\nEliminando registros");
	eliminar(&lista,'ñ');
	eliminar(&lista,'y');
	eliminar(&lista,'w');
	eliminar(&lista,'b');
	eliminar(&lista,'l');
	eliminar(&lista,'?');
	if(buscar(&lista,'k'))
		printf("\nSe encontro el valor 'k'.");
	//printf("\nVaciando lista...");
	//vaciar(&lista);
	if(buscar(&lista,'e'))
		printf("\Se encontro 'e'");
	else printf("\nno se encontro 'e'");
	printf("\nLista: ");
	listar(&lista);

}

void crear(t_lista *p){
	*p = NULL;
}

int vacia(t_lista *p){
	return *p==NULL;
}

int insertarAsc(t_lista *p, char d){
	int marca = 1;
	t_nodo *nue= (t_nodo*)malloc(sizeof(t_nodo)), *ant;
	if(!nue)
		marca = 0;
	else {
		nue->info = d;
		if(*p==NULL || (*p)->info > d){
			nue->sig = *p;
			*p = nue;
		}
		else {
			ant = *p;
			while(ant->sig && ant->sig->info <= d)
				ant = ant->sig;

			nue->sig = ant->sig;
			ant->sig = nue;
		}
	}
	return marca;
}

int insertarDesc(t_lista *p, char d){
	int marca = 1;
	t_nodo *nue= (t_nodo*)malloc(sizeof(t_nodo)), *ant;
	if(!nue)
		marca = 0;
	else {

		nue->info = d;

		if(*p==NULL || (*p)->info < d){
			nue->sig = *p;
			*p = nue;
		}
		else {
			ant = *p;
			while(ant->sig && ant->sig->info >= d)
				ant = ant->sig;

			nue->sig = ant->sig;
			ant->sig = nue;
		}
	}
	return marca;
}


void listar(t_lista *p){
	t_lista aux = *p;
	if(*p){
		while(aux!=NULL){
				printf("\nDato: %c N: %d",aux->info,(int)(aux->info));
				aux = aux->sig;
			}
	}
	else printf("\nLISTA VACIA!\a");
}

int eliminar(t_lista *p, char d){
	int m = 1;
	t_nodo *aux, *ant, *act;
	if(*p){
		if((*p)->info == d){
			aux = *p;
			*p = (*p)->sig;
			free(aux);
		}
		else {
			act = *p;
			while(act->sig && act->info!=d){
				ant = act;
				act = act->sig;
			}
			if(act->sig || act->info == d){
				aux = act;
				ant->sig = aux->sig;
				//aux->sig = act->sig;
				free(aux);
			}
			else {
				printf("\n\aNO SE ENCUENTRA \"%c\"",d);
				m = 0;
			}
		}
	}
	else { m=0; printf("\nLISTA VACIA!"); }
	return m;
}

int insertar(t_lista *p, char d){
	int m=1;
	t_nodo *nue = (t_nodo*)malloc(sizeof(t_nodo));
	if(!nue)
		m = 0;
	else{
		nue->info =d;
		nue->sig = *p;
		*p = nue;
	}

	return m;
}

void ordenarAsc(t_lista *p){
	t_nodo *aux,*act;
	int marca = 1;

	if(*p){
		while(marca){
			marca = 0;
			act = *p;
			while(act->sig){
				if(act->info > act->sig->info){
					marca = 1;
					aux = act;
					act = aux->sig;
					aux->sig = act->sig;
					act->sig = aux;
				}
			}
			//act = act->sig;
		}
	}
}

void vaciar(t_lista *p){
	t_nodo *aux;
	while(*p){
		aux = *p;
		*p = aux->sig;
		free(aux);
	}
}

int buscar(t_lista *p, char d){
	int m = 0;
	t_nodo *aux;
	if(*p){
		aux = *p;
		while(aux->sig && aux->info != d)
			aux = aux->sig;
		if(aux->info == d)
			m = 1;
	}
	return m;
}


