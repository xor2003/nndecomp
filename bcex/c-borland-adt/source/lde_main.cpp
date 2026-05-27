#include <stdio.h>
#include <c:\student\borland\source\listadob.cpp>

void main(){
int valor;
t_lista lista;
iniciarLDE(&lista);

do {
 printf("Ingrese valor: ");
 scanf("%d", &valor);
 if(valor!=-1)
	insertarAscLDE(&lista,valor);
}while(valor!=-1);

 printf("\nIMPRIMIENDO LISTA: \n");
 listarPriLDE(&lista);
 /*if(!eliminarLDE(&lista,40)) printf("\nELEMENTO NO ENCONTRADO\n");
 if(!eliminarLDE(&lista,112)) printf("\nELEMENTO NO ENCONTRADO\n");
 if(!eliminarLDE(&lista,10)) printf("\nELEMENTO NO ENCONTRADO\n");
 if(!eliminarLDE(&lista,12)) printf("\nELEMENTO NO ENCONTRADO\n"); */
 vaciarLDE(&lista);
 printf("\nLISTA FINAL:\n");
 listarPriLDE(&lista);

}