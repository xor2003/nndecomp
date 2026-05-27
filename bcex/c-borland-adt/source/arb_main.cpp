#include <stdio.h>
#include <c:\student\borland\source\arboles.cpp>

void main(){
 t_arbol arbol;
 int x;
 crearArbol(&arbol);
 do {
	printf("Valor: ");
	scanf("%d",&x);
	if(x!=-1) cargarArbol(&arbol,x);
 }while(x!=-1);

 printf("\nListado en orden:\n");
 enOrden(arbol);
 /*printf("\nListado en pre-orden:\n");
 preOrden(arbol);
 printf("\nListado en post-orden:\n");
 postOrden(arbol);
 printf("\nCantidad de nodos: %d",contarNodos(&arbol));
 printf("\nCantidad de hojas: %d",contarHojas(&arbol));
 printf("\nCantidad de ramas: %d",contarRamas(&arbol));
 printf("\nAltura del arbol: %d",alturaArbol(&arbol));
 recorreyMuestraAlt(arbol,3);
 arbol = cortarHojas(&arbol);
 printf("\n"); enOrden(arbol);
 balanceado(&arbol,alturaArbol(&arbol))? printf("Esta balanceado") :
													  printf("No esta balanceado");*/
 arbol = eliminarArbol(arbol);
 printf("\nListado en orden:\n");
 enOrden(arbol);
 printf("\n\aFIN");
}