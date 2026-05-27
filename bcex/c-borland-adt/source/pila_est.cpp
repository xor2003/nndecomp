/* IMPLEMENTACION DE UNA PILA ESTATICA */

#include <stdio.h>
#define MAX 10
#define VERDAD 1
#define FALSO 0

typedef struct { 	char ayn[30];
						unsigned long dni;
						char sexo;
						char dir[35]; } t_info;

typedef struct {  t_info pila[MAX];
						int tope; } t_pila;

void crearPila(t_pila*);
int verTope (t_pila*, t_info*);
int ponerEnPila(t_pila*, const t_info*);
int sacarDePila(t_pila*, t_info*);
void vaciarPila(t_pila*);
int ingresar (t_info*);
int pilaLlena(t_pila*);
int pilaVacia(t_pila*);
void mostrar(t_info*);

void main () {
	t_pila uno;
	t_info info;
	int marca = VERDAD;
	crearPila(&uno);
	while(marca && (marca!=pilaLlena(&uno)) != 0 && ingresar(&info)){
		marca = ponerEnPila(&uno,&info);
	}
	if(!marca)
		printf("\a\nSin memoria");
   sacarDePila(&uno,&info);
	while(!pilaVacia(&uno)){
		verTope(&uno,&info);
		mostrar(&info);
      sacarDePila(&uno,&info);
	}
	vaciarPila(&uno);
}

void crearPila(t_pila *p){
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
	if(p->tope == MAX)
		marca = FALSO;
	else {
		p->pila[p->tope]=*d;
		p->tope++;
	}
	return marca;
}

int sacarDePila(t_pila *p, t_info *d){
	int marca = VERDAD;
	if(p->tope == 0)
		marca = FALSO;
	else {
		p->tope--;
		*d=p->pila[p->tope];
	}
	return marca;
}

int ingresar(t_info *d){
	int marca = VERDAD;
   printf("Ingrese DNI [0 Para terminar]: ");
	scanf("%ld",&d->dni);
	if(d->dni == 0) marca = FALSO;
	else {
		fflush(stdin);
		printf("Ingrese nombre y apellido: ");
		scanf("%[^\n]",d->ayn);
		fflush(stdin);
		printf("Ingrese sexo: ");
		scanf("%c",&d->sexo);
		fflush(stdin);
		printf("Ingrese direccion: ");
		scanf("%[^\n]",&d->dir);
   }
	return marca;
}

void vaciarPila(t_pila *p) {
	p->tope = 0;
}

int pilaLlena(t_pila *p){
	int marca = FALSO;
	if( p->tope == MAX)
		marca = VERDAD;
	return marca;
}

int pilaVacia(t_pila *p){
	int marca = FALSO;
	if(p->tope == 0)
		marca = VERDAD;
   return marca;
}

void mostrar(t_info *d){
	printf("NyA: %-30s DNI: %8ld SEXO: %c DIR: %-20s\n",
				d->ayn,d->dni,d->sexo,d->dir);

}