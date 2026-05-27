/* FUNCIONES PARA MANIPULAR ARBOLES BINARIOS */

#include <stdlib.h>
#include <stdio.h>
#define true 1
#define false 0

typedef struct s_nodo { int info; s_nodo *izq; s_nodo *der; } t_nodo;

typedef t_nodo *t_arbol;

/* CREAR ARBOL BINARIO */
void crearArbol(t_arbol *p){
	*p = NULL;
}

/* CARGAR DATOS EN ARBOL BINARIO DE FORMA ORDENADA */
int cargarArbol(t_arbol *p, int d){

	if(*p){

		if(d == (*p)->info){
			printf("\a\nCLAVE DUPLICADA\n");
			return false;
		}
		if( d < (*p)->info )
			return cargarArbol(&(*p)->izq, d);
		else
			return cargarArbol(&(*p)->der,d);
	}
	*p = (t_nodo*)malloc(sizeof(t_nodo));
	if(!(*p)){
		printf("\n\aSIN MEMORIA\n");
		return false;
		}
	(*p)->info = d;
	(*p)->izq = (*p)->der = NULL;

	return true;
}

/* LISTAR EN ORDEN (izq-RAIZ-der) */
void enOrden(t_arbol p){
	if(p){
		enOrden(p->izq);
		printf("Valor: %d\n",p->info);
		enOrden(p->der);
	}
}

/* LISTAR EN PRE-ORDEN (RAIZ-izq-der) */
void preOrden(t_arbol p){
	if(p){
		printf("Valor: %d\n",p->info);
		preOrden(p->izq);
		preOrden(p->der);
	}
}

/* LISTAR EN POST-ORDEN (izq-der-RAIZ) */
void postOrden(t_arbol p){
	if(p){
		postOrden(p->izq);
		postOrden(p->der);
		printf("Valor: %d\n",p->info);
	}
}

/* CONTABILIZAR NODOS TOTALES DEL ARBOL */
unsigned contarNodos(const t_arbol *p){
	if(*p)
		return contarNodos(&(*p)->izq) + contarNodos(&(*p)->der) + 1;
	else
		return 0;
}

/* CONTABILIZAR HOJAS DEL ARBOL */
unsigned contarHojas(const t_arbol *p){
	if(*p){
		if((*p)->izq == NULL && (*p)->der == NULL)
			return 1;
		else
			return contarHojas(&(*p)->izq) +
					 contarHojas(&(*p)->der);
	}
	return 0;
}

/* CONTABILIZAR RAMAS DEL ARBOL */
unsigned contarRamas(const t_arbol *p){
	if(*p){
		if((*p)->izq != NULL || (*p)->der != NULL)
			return contarRamas(&(*p)->izq) +
					 contarRamas(&(*p)->der) + 1;
	}

	return 0;
}

/* CALCULAR LA ALTURA DEL ARBOL */
unsigned alturaArbol(t_arbol *p){
	int izq,der;

	if(*p){
		izq = alturaArbol(&(*p)->izq);
		der = alturaArbol(&(*p)->der);

		if(izq >= der)
			return izq+1;
		else
			return der+1;
	}
	else
		return 0;
}

/* LISTAR A PARTIR DE UNA ALTURA DETERMINADA HACIA ABAJO */
int recorreyMuestraAlt(t_arbol p, int h){
	int cant = 0;
	if(p){
		if(h <= 1){
			printf("\n%d",p->info);
			cant = 1;
		}
		cant += recorreyMuestraAlt(p->izq, h-1) +
				  recorreyMuestraAlt(p->der, h-1);
	}
	return cant;
}

/* VERIFICAR SI EL ARBOL BINARIO ESTA BALANCEADO */
int balanceado (t_arbol *p, int h){
	if(*p){
		return balanceado(&(*p)->izq, h-1) &&
				 balanceado(&(*p)->der, h-1);
	}
	else return (h <= 1);
}

/* ELIMINAR LOS NODOS HOJAS */
t_nodo* cortarHojas(t_arbol *p){
	if(*p){
		if((*p)->izq == NULL && (*p)->der == NULL){
			free(*p);
			return NULL;
		}
		(*p)->izq = cortarHojas(&(*p)->izq);
		(*p)->der = cortarHojas(&(*p)->der);
	}

	return *p;
}

/* ELIMINAR A PARTIR DE UNA ALTURA DETERMINADA */
t_nodo* borrarDesdeAlt(t_arbol *p, int h){
	if(*p){
		if(h <= 1 && (*p)->izq == NULL && (*p)->der == NULL){
			free(*p);
			return NULL;
		}
		else {
			borrarDesdeAlt(&(*p)->izq, h-1);
			borrarDesdeAlt(&(*p)->der, h-1);
		}

	}
	return *p;
}

/* ELIMINAR ARBOL COMPLETO */
t_nodo* eliminarArbol(t_arbol p){
	if(p){
      p->izq = eliminarArbol(p->izq);
		p->der = eliminarArbol(p->der);
		if(p->izq == NULL && p->der == NULL){
			free(p);
			return NULL;
		}

	}
   return p;
}
