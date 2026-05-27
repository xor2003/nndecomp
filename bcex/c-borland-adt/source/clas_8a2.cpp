/* EJERCICIO DADO EN CLASE, UTILIZANDO UNA PILA DINAMICA */

#include <stdio.h>
#include <stdlib.h>
#define VERDAD 1
#define FALSO 0

typedef struct { char ayn[35]; long int dni; } t_info;

typedef struct s_nodo {
								t_info info;
								s_nodo *sig; } t_nodo;

typedef t_nodo* t_pila;

void crearPila(t_pila*);
void vaciarPila(t_pila*);
int ponerEnPila(t_pila*,const t_info*);
int verTope(t_pila*, t_info*);
int sacarDePila(t_pila*,t_info*);
int pilaLlena();
int pilaVacia(t_pila*);

void main (){
	t_pila pila;
	t_info info;
	FILE *dest, *orig;

	orig = fopen("registro.txt","r");
	dest = fopen("registro.dat","wb");
	crearPila(&pila);
	//Obtengo el primer registro
	fgets(info.ayn,35, orig);
	fscanf(orig, "%ld\n",&info.dni);
	printf("Cargando datos del texto en la pila...\n");
	while(!feof(orig) && ponerEnPila(&pila,&info)){
		fgets(info.ayn,35, orig);
		fscanf(orig, "%ld\n",&info.dni);
	}
	printf("Carga finalizada.\a\n");
	/* PRUEBA DE PASAJE DE TEXTO A REGISTRO
	printf("AYN: %-30s DNI: %ld",info.ayn,info.dni);
	while(!feof(orig)) {
		fgets(info.ayn,35, orig);
		fscanf(orig, "%ld\n",&info.dni);
		printf("\nAYN: %-30s DNI: %ld",info.ayn,info.dni);
	}
	*/
	printf("Descargando la pila y guardando los datos en \"registro.dat\"...\n");
	while(!pilaVacia(&pila)){
			sacarDePila(&pila,&info);
			fwrite(&info,sizeof(t_info),1,dest);
			// if(info.dni == 3262173) break; Si encuentro tal cosa salgo del bucle
	}
	printf("Descarga terminada.\n\n");
	fcloseall();
	dest = fopen("registro.dat","rb");
	fread(&info,sizeof(t_info),1,dest);
	while(!feof(dest)){
		printf("Nombre y apellido: %-30s\tDNI: %ld\n",
					info.ayn,info.dni);
		fread(&info, sizeof(t_info),1,dest);
	}
}

void crearPila(t_pila *p){
	*p = NULL;
}

void vaciarPila(t_pila *p){
	t_nodo *aux;
	while(*p){
	aux = *p;
	*p = aux->sig;
	free(aux);
	}
}

int ponerEnPila(t_pila *p, const t_info *d){
	int marca = VERDAD;
	t_nodo *nue = (t_nodo*)malloc(sizeof(t_nodo));
	if(nue == NULL)
		marca = FALSO;
	else {
		nue->info = *d;
		nue->sig = *p;
		*p = nue;
	}
	return marca;
}

int verTope(t_pila *p, t_info *d){
	int marca = VERDAD;
	if(*p == NULL)
		marca = FALSO;
	else{
		*d = (*p)->info;
	}
	return marca;
}

int sacarDePila(t_pila *p,t_info *d){
	int marca = VERDAD;
	t_nodo *aux;
	if(*p) {
		aux = *p;
		*d = aux->info;
		*p = aux->sig;
		free(aux);
	}
	else
		marca = FALSO;
  return marca;
}

int pilaLlena(){
	int marca = FALSO;
	t_nodo *nue = (t_nodo*)malloc(sizeof(t_nodo));
	if(nue == NULL){
		marca = VERDAD;
		printf("\nNo hay memoria.\n");
	}
	return marca;
}

int pilaVacia(t_pila *p){
	int marca = FALSO;
	if( *p == NULL )
		marca = VERDAD;
	return marca;
}
