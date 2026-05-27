/* ESTO ESTA MUY MAL, LO DEJO ASI NOMAS */

/* LISTA SIMPLEMENTE ENLAZADA */

#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#define VERDAD  1
#define FALSO 0

typedef struct { char ayn[30]; unsigned long int dni; } t_info;

typedef struct s_nodo {	t_info info;
								struct s_nodo *sig;
								} t_nodo;

typedef t_nodo *t_lista; // O sea que *t_lista = **t_nodo

//Manejo de la lista
void iniciaLista(t_lista*);
int insertaEnOrden(t_lista*,t_info*);
int buscarDato(t_lista*, t_info*);
int listaLlena();
int finLista(t_lista*);
int eliminarLOrdxClave(t_lista*,t_info*);
void ordenarLista(t_lista*);
//void mostrarLista(t_lista*);

//Procesamiento de los datos
int comparaReg(t_info*,t_info*);
int ingresar(t_info*);

void main(){
	int si_no = VERDAD;
	t_lista lista;
	t_info info;
	printf("Se esta iniciando la lista...\n\n");
	iniciaLista(&lista);
	printf("LISTA INICIADA\n");
	const t_lista *aux = &lista ;
	while(!listaLlena() && ingresar(&info) && si_no == VERDAD)
		si_no = insertaEnOrden(&lista,&info);
	clrscr();
	printf("Ver el contenido de la lista...");
	printf("PRUEBA: \n%s %ld",lista->info.ayn,lista->info.dni);
	printf("PRUEBA: \n%s %ld",(*aux)->info.ayn,(*aux)->info.dni);
	/*while(!finLista(&primerNodo))
		printf("\n%-30s %ld",lista->info.ayn, lista->info.dni);
		primerNodo = primerNodo->sig;*/
	//mostrarLista(&lista);
}

void iniciaLista(t_lista *p) {
	*p = NULL;
}

int insertaEnOrden(t_lista *p, t_info *d){
	int marca;
	t_lista nue, ant;
	ant = p;
	//SI EL REGISTRO INGRESADO ES MAYOR QUE EL ACTUAL DE LA LISTA (O *p=NULL);
	while(*ant && comparaReg(d,&(*ant)->info) > 0)
		ant = &(*ant)->sig;

	//SI HAY DOS REGISTROS REPETIDOS (O EL PUNTERO ESTA VACIO)
	if(*ant && !comparaReg(d,&(*ant)->info)){
		/*1. No hacer nada.
		 *2. Informar que hay una clave duplicada.
		 *3. Acumular informacion.
		 *4. etc... */
	}
	nue = (t_nodo*)malloc(sizeof(t_nodo));
	if(nue == NULL)
		marca = FALSO;
	else {
		nue->info = *d;
		nue->sig = *ant;
		*ant = nue;
		marca = VERDAD;
	}

	return marca;
}

int buscarDato(t_lista *p, t_info *d){
	int marca;
	while(*p && comparaReg(d, &(*p)->info)!=0)
		p = &(*p)->sig;
	if(*p && !comparaReg(d,&(*p)->info))
		marca = VERDAD;
	else
		marca = FALSO;

	return marca;
}

int listaLlena() {
	int marca;
	t_nodo *aux = (t_nodo*)malloc(sizeof(t_nodo));
	if(aux == NULL)
		marca = VERDAD;
	else {
		marca = FALSO;
		free(aux);
		}
	return marca;
}

int finLista(t_lista *p){
	int marca;
	if(&(*p)->sig == NULL)
		marca = VERDAD;
	else
		marca = FALSO;
	return marca;
}

int eliminarLOrdxClave(t_lista *p, t_info *d){
	int marca;
	t_nodo *aux;
	while(*p && comparaReg(d,&(*p)->info) > 0 )
		p = &(*p)->sig;
	if(*p && !comparaReg(d,&(*p)->info)){
		aux = *p;
		*d = aux->info;
		*p = aux->sig;
		free(aux);
		marca = VERDAD;
	}
	else
		marca = FALSO;
	return marca;
}

void ordenarLista(t_lista *p){
	int marca = VERDAD;
	t_nodo *aux;
	t_lista *act;
	if(*p)
		while(marca){
		marca = FALSO;
		act = p;
		while((*act)->sig){
			if(comparaReg(&(*act)->info, &(*act)->sig->info) > 0){
				marca = VERDAD;
				aux = *act;
				*act = aux->sig;
				(*act)->sig = aux;
				}
		act = &(*act)->sig;
		}
	}
}

/*void mostrarLista(t_lista *p){
	//int marca = VERDAD;
	t_lista *act;
	if(*p){
		act = p;
		while((*act)->sig != NULL)
			printf("\n%-30s %ld",(*act)->info.ayn, (*act)->info.dni);
			*act = (*act)->sig;

	}
}  */

int comparaReg(t_info *a,t_info *b){
	char *cad1,*cad2;
	cad1 = a->ayn;
	cad2 = b->ayn;
	//compara nombres
	while(*cad1 && *cad1 == *cad2){
		cad1++;
		cad2++;
	}
	if(*cad1-*cad2 == 0){
	/* si los nombres son iguales, aca van las instrucciones para seguir
	 * comparando los datos, en este caso el DNI */
	}
	return (*cad1-*cad2);
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


