/*1º Crear dos archivos (A y B) que contienen nombres y DNI, ordenados por nombre
*		(Suponemos que el archivo B esta mas actualizado que el archivo A)
* 2º-a Crear un archivo C y colocar en el los registros de ambos ordenados.
*   -b Eliminar A. Renombrar el archivo C como A y eliminar archivo B
* 3º Abrir el archivo C y crear un archivo de texto D con los registros ordenados. */

/*PARTE 2*/

#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <c:\student\borland\source\arch3bin.cpp>

int compara (char *, char *);

void main() {
	t_reg reg_a , reg_b;
	FILE *puntA,*puntB,*puntC;

	if((puntA = fopen("file_a.dat","rb"))==NULL) {
		printf("\a\a\Error!n\nArchivo maestro no encontrado.");
		exit(1);
		}

	if((puntB = fopen("file_b.dat","rb"))==NULL){
		printf("\a\aError!\nArchivo de actualizacion no encontrado.");
		exit(1);
		}

	puntC = fopen("file_c.dat","wb");

	printf("Se esta actualizando el registro...");

   fread(&reg_a, sizeof(t_reg),1,puntA);
	fread(&reg_b, sizeof(t_reg),1,puntB);

	while(!feof(puntA) && !feof(puntB)){

		if (compara(reg_a.ayn,reg_b.ayn) < 0) {
			fwrite(&reg_a,sizeof(t_reg),1,puntC);
			fread(&reg_a, sizeof(t_reg),1,puntA);
		}
		else { if(compara(reg_a.ayn,reg_b.ayn) > 0) {
					fwrite(&reg_b, sizeof(t_reg),1,puntC);
					fread(&reg_b, sizeof(t_reg),1, puntB);
				 }
		//Suponiendo que B es el mas actualizado, si son iguales guardo el reg. de B en C
				 else {
					fwrite(&reg_b, sizeof(t_reg),1,puntC);
					fread(&reg_a, sizeof(t_reg),1,puntA);
					fread(&reg_b, sizeof(t_reg),1,puntB);
				 }
		}
	}  // while

	if(feof(puntA)) {
		while(!feof(puntB)) {
			fwrite(&reg_b, sizeof(t_reg),1,puntC);
			fread(&reg_b, sizeof(t_reg),1,puntB);
		}
	}

	else while(!feof(puntA)){
				fwrite(&reg_a, sizeof(t_reg), 1,puntC);
				fread(&reg_a, sizeof(t_reg), 1, puntA);
			}

	fcloseall();

	remove("file_a.dat");
	remove("file_b.dat");
	rename("file_c.dat","file_a.dat");

	printf("\n\aActualizacion exitosa.\n\n");
	grabaTexto();

}

int compara (char *cad1, char *cad2) {

	while(*cad1 && toupper(*cad1)==toupper(*cad2)){
		cad1++;
		cad2++;
	}
	return (toupper(*cad1)-toupper(*cad2));
}
