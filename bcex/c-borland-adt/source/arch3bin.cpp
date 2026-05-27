/*1º Crear dos archivos (A y B) que contienen nombres y DNI, ordenados por nombre
* 2º Crear un archivo C y colocar en el los registros de ambos ordenados.
* 3º Eliminar A. Renombrar el archivo C como A y eliminar archivo B
* 4º Abrir el archivo C y crear un archivo de texto D con los registros ordenados. */

/*PARTE 3*/

#include <stdio.h>
#include <stdlib.h>

typedef struct {
						char ayn[35];
						long int dni;
					}t_reg;

void grabaTexto() {
	t_reg reg;
	FILE *puntA, *puntT;

	if((puntA=fopen("file_a.dat","rb"))==NULL){
		printf("\a\aError!\nNo se encuentra el archivo de registro.");
      exit(1);
	}

	puntT = fopen("registro.txt","w");

	fread(&reg, sizeof(t_reg),1,puntA);

  printf("Se esta creando el registro...");

  fprintf(puntT,"-REGISTRO DE NOMBRES, APELLIDO Y DNI DE LOS SOCIOS-\n");

  while(!feof(puntA)){
		fprintf(puntT,"\n%-36s %ld",reg.ayn,reg.dni);
		fread(&reg, sizeof(t_reg), 1, puntA);
	}

	fcloseall();
   printf("\a\nRegistro terminado.");
}