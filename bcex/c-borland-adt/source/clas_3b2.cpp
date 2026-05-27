#include <stdio.h>
#include <conio.h>
#include <string.h>

//ESTO ESTA PARA EL ORTO

typedef struct {
	int di, me, an;} t_fecha;

typedef struct {
	long dni; char ayn[36]; char sex; t_fecha fe; double importe; } t_info;

void main () {
	t_info reg;
	FILE *punt;
	punt = fopen("c:\student\borland\datos.dat","wb");

	printf("DNI: ");
	scanf("%d",&reg.dni);

	while(reg.dni!=0) {
		printf("Apellido y nombre: ");
      fflush(stdin);
		gets(reg.ayn);
		printf("Sexo: ");
		scanf("%c",&reg.sex);
		printf("Fecha: ");
		scanf("%d %d %d",&reg.fe.di,&reg.fe.me,&reg.fe.an);
		printf("Importe: ");
		scanf("%lf",&reg.importe);
		//fwrite ( &reg , sizeof(t_info),1,punt);
		clrscr();
		printf("DNI: ");
		scanf("%d",&reg.dni);

	}
	fclose(punt);

}