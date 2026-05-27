/* COLA ESTATICA */

#include <stdio.h>
#define VERDAD 1
#define FALSO 0
#define MAX_T 10

typedef struct {  char ayn[30];
						unsigned long int dni; } t_info;
typedef struct {	t_info cola[MAX_T];
						int pri;
						int ult;} t_cola;



void crearCola(t_cola*);
void vaciarCola(t_cola*);
int colaVacia(t_cola*);
int colaLlena(t_cola*);
int ponerEnCola(t_cola*,const t_info*);
int sacarDeCola(t_cola*, t_info*);
int verPrimero(t_cola*, t_info*);
int ingresar(t_info*);
void listar(t_cola*);

void main() {
	t_info reg;
	t_cola cola;
	crearCola(&cola);
	while(!colaLlena(&cola) && ingresar(&reg))
		ponerEnCola(&cola,&reg);
	printf("\nDatos cargados en la cola.");
	/*printf("\nDescargando datos de la cola...\n\n");

	while(!colaVacia(&cola) && sacarDeCola(&cola,&reg))
		printf("\n%-30s %ld",reg.ayn,reg.dni); */
   printf("Primer lista : \n");
	listar(&cola);
	printf("Segunda lista: \n");
	listar(&cola);
}

void crearCola(t_cola *p){
	p->pri = 0;
	p->ult = -1;
}

void vaciarCola (t_cola *p){
	p->pri = 0;
	p->ult = -1;
}

int colaVacia(t_cola *p){
	int marca;
	if(p->ult==-1)
		marca = VERDAD;
	else
		marca = FALSO;
	return marca;
}

int colaLlena(t_cola *p){

	return(p->pri==0 && p->ult==MAX_T-1) ||
			(p->pri == p->ult+1 && p->ult!=-1);
}

int ponerEnCola(t_cola *p, const t_info *d){
	int marca;
	if((p->pri == 0 && p->ult == MAX_T-1) ||
		(p->pri == p->ult+1 && p->ult != -1))
			marca = FALSO;
	else {
		p->ult = (p->ult+1) % MAX_T;
		p->cola[p->ult] = *d;
		marca = VERDAD;
	}
	return marca;
}

int sacarDeCola (t_cola *p, t_info *d){
	int marca;
	if(p->ult == -1)
		marca = FALSO;
	else {
		*d = p->cola[p->pri];
		//Si hay un solo elemento en la cola
		if(p->pri == p->ult){
			p->pri = 0;
			p->ult = -1;
		}
		else
			p->pri = (p->pri+1) % MAX_T;
		marca = VERDAD;
	}
	return marca;
}

int verPrimero(t_cola *p, t_info *d){
	int marca;
	if(p->ult == -1)
		marca = FALSO;
	else {
		*d = p->cola[p->pri];
		marca = VERDAD;
	}
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

void listar(t_cola *p){
	t_cola aux;
	t_info info;
	crearCola(&aux);
	if(p->ult==-1)
		printf("Cola vacia");
	else {
		while(sacarDeCola(p,&info)){
			printf("\nInfo: %-30s %ld",info.ayn,info.dni);
			ponerEnCola(&aux,&info);
		}
		while(sacarDeCola(&aux,&info))
			ponerEnCola(p,&info);
	}
}