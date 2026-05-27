/*1º Crear dos archivos (A y B) que contienen nombres y DNI, ordenados por nombre
* 2º Crear un archivo C y colocar en el los registros de ambos ordenados.
* 3º Eliminar A. Renombrar el archivo C como A y eliminar archivo B
* 4º Abrir el archivo C y crear un archivo de texto D con los registros ordenados. */

/*PARTE 1*/

#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

typedef struct {
						char ayn[35];
						long int dni;
					}t_reg;

void makeFile (char []);

void main() {

	printf("Archivo A: \n");
	makeFile("file_a.dat");
	clrscr();
   printf("Archivo B: \n");
	makeFile("file_b.dat");

}

void makeFile (char s[]){
   FILE *arch;
	t_reg reg;
	arch = fopen(s,"wb");

	printf("Ingrese nombre y apellido [* para terminar]: ");
	fflush(stdin);
	scanf("%[^\n]", reg.ayn);
	while(*reg.ayn!='*'){
		printf("Ingrese DNI: ");
		scanf("%ld",&reg.dni);
      fwrite(&reg, sizeof(t_reg),1,arch);
		printf("Ingrese nombre y apellido [* para terminar]: ");
		fflush(stdin);
		scanf("%[^\n]", reg.ayn);
	}
	fclose(arch);
}
