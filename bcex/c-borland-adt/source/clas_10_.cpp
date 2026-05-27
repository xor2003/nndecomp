/*----- NO ESTA TERMINADO!!! -----*/

/* EJERCICIO DE LA CLASE 10/02/2010
 * ESTE EJERCICIO REQUIERE EL USO DE UNA LISTA SIMPLE */

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#define VERDAD 1
#define FALSO 0

// Declaracion de las estructuras a utilizar
typedef struct { char abrev[10]; char sign[200]; } t_info; //pasar mañana a punteros

typedef struct s_nodo { t_info info; s_nodo *sig; } t_nodo;

typedef s_nodo* t_lista;

//Prototipo de funciones a utilizar
void iniciaLista(t_lista*);
int insertarEnOrden(t_lista*,t_info*);
int eliminarDeLista(t_lista*,t_info*);
int listaVacia(t_lista*);
void borrarLista(t_lista*);
void mostrarLista(t_lista*);
t_lista buscarDato(t_lista*,char*);
int insertar(t_lista*,t_info*);
void ordenarLista(t_lista*);

int str_cmpi(char*,char*);
 /*
// MAIN PRINCIPAL
void main() {
// DECLARAR E INICIAR VARIABLES
	int cont = 0; //contador de texto de parrafo (cont < 800)
	FILE *text, *remp, *nuevo;
	remp = fopen("codigos.dat","r");
	text = fopen("nuevo.txt","w");
// CARGAR EL ARRAY CON LAS ABREVIACIONES
// printf("Abreviaturas cargadas en memoria.");
// ABRIR EL ARCHIVO DE TEXTO A TRADUCIR
// CREAR EL ARCHIVO DE TEXTO FINAL
// DETECTAR LOS '.' QUE INDICAN FIN DE PARRAFO
// GUARDAR EN UN NUEVO ARCHIVO DE TEXTO DESCODIFICADO
// CERRAR TODOS LOS ARCHIVOS

}     */

/******************/

/* MAIN DE PRUEBA */
/* Este main es para ir probando las funciones */
void main(){
	t_info reg;
	t_lista lista, aux;
	printf("Iniciando lista..\n");
	iniciaLista(&lista);
	printf("Lista = %p\n", lista);
	printf("ABREV: ");gets(reg.abrev);
	while(str_cmpi(reg.abrev,"FIN") != 0){
		printf("SIGN: "); gets(reg.sign);
		insertar(&lista,&reg);
		printf("Lista = %p\n",lista);
		printf("ABREV: ");gets(reg.abrev);
	}
	printf("\nlista = %p",lista);
	printf("\n\aLista cargada.\n");
   ordenarLista(&lista);
	mostrarLista(&lista);
   aux = buscarDato(&lista,"tls");
	if(aux)
		printf("\n\Dato: %-10s %-30s",aux->info.abrev,aux->info.sign);
	else printf("\nNo se pudo encontrar \"tls\" .");
}


/******************/

/* DECLARACION DE FUNCIONES A USAR */

void iniciaLista(t_lista *p){
	// Asignarle a *p un contenido NULO
	*p = NULL;
}

//Insertar en orden de menor a mayor
int insertarEnOrden(t_lista *p, t_info *d){
	int marca = VERDAD;
	t_nodo *nue, *ant;
	//Crear un nodo nuevo
	nue = (t_nodo*)malloc(sizeof(t_nodo));
	if(nue == NULL)
		marca = FALSO;
	else {
		 nue->info = *d;
		 if(*p == NULL || str_cmpi(nue->info.abrev,(*p)->info.abrev) > 0){
			nue->sig = *p;
			*p = nue;
		 }
		 else {
			ant = *p;
			while(ant->sig && str_cmpi(nue->info.abrev,ant->sig->info.abrev) <= 0){
				ant = ant->sig;
			}
			nue->sig = ant->sig;
			ant->sig = nue;
		 }
	}
	return marca;
}

//Borrar un 'x' elemento de una lista ORDENADA
int eliminarDeLista(t_lista *p, t_info *d){
	int marca = VERDAD;
	t_nodo *anterior, *nodo;
	nodo = *p;
	anterior = NULL;
	while(nodo && str_cmpi(d->abrev,nodo->info.abrev) < 0){
		anterior = nodo;
		nodo = nodo->sig;
	}
	if(!nodo || str_cmpi(d->abrev,nodo->info.abrev) != 0)
		marca = FALSO;
	else { /* BORRAR EL NODO */
		if(!anterior) /*...es primer elemento */
			*p = nodo->sig;
		else
			anterior->sig = nodo->sig;
			free(nodo);
	}
	return marca;
}

int listaVacia(t_lista *p){
	return (p == NULL);
}

void borrarLista(t_lista *p){
	t_nodo *nodo;
	while(*p){
		nodo = *p;
		*p = nodo->sig;
		free(nodo);
	}
}

void mostrarLista(t_lista *p){
	/* Dado que 'p' apunta al ultimo nodo ingresado,
	 * el recorrido sera en orden inverso */
	t_nodo *nodo = *p;

	if(p == NULL) printf("\n\aLISTA VACIA\n");
	else{
		while(nodo){
			printf("%-10s -> %-25s %p\n",nodo->info.abrev, nodo->info.sign,nodo);
			nodo = nodo->sig;
		}
	}
}

/* Funcion que busca un dato en concreto.
*  NOTA: En este caso busca segun la abreviatura y podria hacer unas pequeñas
*  modificaciones para lograr que devuelva el significado de la abrev.*/
t_lista buscarDato(t_lista *p, char *d){
	t_lista ret = NULL;
	if(*p){
		while(*p && str_cmpi(d,(*p)->info.abrev) != 0)
			p = &(*p)->sig;
		if(*p && !str_cmpi(d,(*p)->info.abrev))
		ret = *p;
	}
	return ret;
}

// Insertar sin orden
int insertar(t_lista *p, t_info *d){
	int marca = VERDAD;
	t_nodo *nuevo;
	nuevo = (t_nodo*)malloc(sizeof(t_nodo));
	if(nuevo == NULL)
		marca = FALSO;

	else{
		nuevo->info = *d;
		nuevo->sig = *p;
		*p = nuevo;
		}
	return marca;
}


//NO FUNCA
void ordenarLista( t_lista *p){
	int marca = 1;
	t_lista *act, aux;
	if(*p){
		while(marca){
			marca = 0;
			act = p;
			while((*act)->sig->sig){
				if(str_cmpi((*act)->sig->info.abrev,(*act)->sig->sig->info.abrev) > 0){
					marca = 1;
					aux = (*act)->sig->sig;
					aux->sig = (*act)->sig;
					(*act)->sig = aux->sig;
					(*act)->sig = aux;
				}
				*act =(*act)->sig;
			}

		}
	}
}

int str_cmpi(char *cad1, char *cad2){
	while(*cad1 && tolower(*cad1) == tolower(*cad2)){
		cad1++; cad2++;
	}
	return ( tolower(*cad1) - tolower(*cad2));
}
