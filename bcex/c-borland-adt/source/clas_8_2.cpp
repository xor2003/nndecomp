/* EJERCICIO DADO EN CLASE UTILIZANDO UNA PILA ESTATICA DE 100 REGISTROS */

#include <stdio.h>
#include <stdlib.h>
#define MAX_T 100
#define VERDAD 1
#define FALSO 0

// Defino el tipo de dato a utilizar
typedef struct { char ayn[35]; long int dni; } t_info;

typedef struct { t_info pila[MAX_T];
						int tope; } t_pila;

void crearPila(t_pila*);
void vaciarPila(t_pila*);
int verTope(t_pila*, t_info*);
int ponerEnPila(t_pila*, const t_info*);
int sacarDePila(t_pila*, t_info*);
int pilaLlena(t_pila*);
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
	p->tope = 0;
}
/* Estas dos funciones son iguales en implementacion
 * pero son conceptualmente distintas */
 void vaciarPila(t_pila *p){
	p->tope = 0;
}

int verTope(t_pila *p, t_info *d){
	int marca = VERDAD;
	if(p->tope == 0) marca = FALSO;
	else
		*d = p->pila[p->tope-1];
	return marca;
}

int ponerEnPila(t_pila *p, const t_info *d){
	int marca = VERDAD;
	if(p->tope == MAX_T) marca = FALSO;
	else {
		p->pila[p->tope] = *d;
		p->tope++;
	}
	return marca;
}

int sacarDePila(t_pila *p, t_info *d){
	int marca = VERDAD;
	if(p->tope == 0) marca = FALSO;
	else {
		p->tope--;
		*d = p->pila[p->tope];
	}
	return marca;
}

int pilaLlena(t_pila *p){
	int marca = FALSO;
	if(p->tope == MAX_T)
		marca = VERDAD;
	return marca;
}

int pilaVacia(t_pila *p){
	int marca = FALSO;
	if(p->tope == 0)
		marca = VERDAD;
	return marca;
}
