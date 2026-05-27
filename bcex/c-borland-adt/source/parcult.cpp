#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>

typedef struct s_nodo { char info[20]; struct s_nodo *izq; struct s_nodo *der;} t_nodo;
typedef t_nodo* t_arbol;

void crear(t_arbol*);
int insertar(t_arbol*,char*);
t_nodo* eliminarHojas(t_arbol*);
//void mostrarRamas(t_arbol*);
//void mostrarHojas(t_arbol*);
//int altura(t_arbol*);
//void mostrarEnAlt(t_arbol*,int);
//void mostrarDdAlt(t_arbol*,int);
//int borrarHojas(t_arbol*);
void enOrden(t_arbol p);

//*********************************************************
void main(){
	char s[20];
	int marca = 1;
	t_arbol arbol;
	printf("------- EJERCICIO PRACTICA PARA EL 3º REC, HAY QUE PROMOCIONAR!!! ----------\n\n");
	printf("Cargando arbol...\n");
	crear(&arbol);
	while(marca){
		printf("Nombre : ");
		fflush(stdin);
		gets(s);
		if(!strcmp("FIN",s)) marca = 0;
		else insertar(&arbol,s);
	}
	clrscr();
	enOrden(arbol);
	eliminarHojas(&arbol);
   printf("\nEliminando hojas...\n");
	enOrden(arbol);

}
//*********************************************************

void crear(t_arbol *p){
	*p = NULL;
}

int insertar(t_arbol *p, char *s){
	t_nodo *nue = (t_nodo*)malloc(sizeof(t_nodo));

	if(!nue) { printf("\nNO HAY MEMORIA\n"); return 0; }
	strcpy(nue->info,s);
	nue->izq = NULL;
	nue->der = NULL;

	if(*p){
		int cmp = strcmp((*p)->info, s);
		if(!cmp) {printf("\nCLAVE DUPLICADA\n"); return 0; }
		if(cmp > 0)
			insertar(&(*p)->izq, s);
		else
			insertar(&(*p)->der, s);

	}

	else *p = nue;
	return 1;
}

t_nodo* eliminarHojas(t_arbol *p){
	if(*p){
		if((*p)->izq == NULL && (*p)->der == NULL){
			free(*p);
			return NULL;
		}
		(*p)->izq = eliminarHojas(&(*p)->izq);
		(*p)->der = eliminarHojas(&(*p)->der);
	}
	return *p;
}


void enOrden(t_arbol p){
	if(p){
		enOrden(p->izq);
		printf("%s\n",p->info);
		enOrden(p->der);
	}
}