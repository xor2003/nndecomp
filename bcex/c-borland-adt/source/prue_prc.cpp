/* EJEMPLO DEL USO DE FSEEK PARA EL DESPLAZAMIENTO A TRAVES DE LOS REGISTROS DE ARCHIVOS */

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

typedef struct {
						char ayn[35];
						unsigned long int dni;
					}t_reg;


void main(){
	t_reg info;

	FILE *viejo,*nuevo;
	if( (viejo = fopen("file_a.dat","rb"))== NULL) {
		printf("no se  encuentra el archivo!");
		exit(1);
	}
  nuevo = fopen("copia_a.dat","r+b");
	fread(&info,sizeof(t_reg),1,viejo);
	while(!feof(viejo)){
		printf("AYN: %-30s DNI: %ld\n",info.ayn,info.dni);
		fread(&info,sizeof(t_reg),1,viejo);
	} 
	fseek(viejo,(sizeof(t_reg)*(3-1)-0L),0);
	fread(&info,sizeof(t_reg),1,viejo);
	//printf("\nAYN: %-35s %ld",info.ayn,info.dni);
	fseek(nuevo,sizeof(t_reg)*(21-1)-0L,0);
	fwrite(&info,sizeof(t_reg),1,nuevo);
	rewind(nuevo);
	fread(&info,sizeof(t_reg),1,nuevo);
   printf("\n");
	while(!feof(nuevo)){
		printf("AYN: %-30s DNI: %ld\n",info.ayn,info.dni);
		fread(&info,sizeof(t_reg),1,nuevo);}  



	//Registro 3 David Mancilla a registro 21

   fcloseall();
}
