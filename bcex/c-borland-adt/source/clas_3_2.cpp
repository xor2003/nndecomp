/*Archivos: Clase del 3/2/2010 */
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#define CMS 1
#define SMS 0

typedef struct {
	int di, me, an;} t_fecha;

typedef struct {
	long dni; char ayn[36]; char sex; t_fecha fe; double importe; } t_info;

int abrirArchivo (FILE **, const char*, const char*, int);

void main () {

	FILE *pfEnt, *pfSal1, *pfSal2;
	t_info reg;

	if(!abrirArchivo(&pfEnt,"c:\student\borland\datos.dat","rb",CMS)) {
		fclose(pfEnt);
		exit(1);
	}

	pfSal1= fopen ("c:\student\borland\dato1.txt","wt");
	pfSal2= fopen ("c:\student\borland\dato2.txt","at");

	fread(&reg,sizeof(t_info),1,pfEnt);

	while(!feof(pfEnt)) {
		fprintf(pfSal1,"%ld | %s | %c | %d/%d/%d | %.2lf\n",
					reg.dni, reg.ayn, reg.sex, reg.fe.di, reg.fe.me, reg.fe.an, reg.importe);

		fprintf(pfSal2,"%08ld, %-*s, %c, %02d, %02d, %4d %-9.2lf\n",
		reg.dni, reg.ayn, reg.sex, reg.fe.di, reg.fe.me, reg.fe.an, reg.importe);
		fread(&reg,sizeof(t_info),1,pfEnt);
	 }
	 fclose(pfEnt);
	 fclose(pfSal1);
    fclose(pfSal2);
}