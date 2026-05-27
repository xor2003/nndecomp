#include <stdio.h>
#include <conio.h>

/*Relacion entre dos variables enteras, sus correspondientes direcciones
y sus punteros asociados*/
/*
void main() {

	int u = 3;
	int v;
	int *pu;
	int *pv;

	pu = &u;
	v = *pu;
	pv = &v;

	printf("\nu= %d  &u= %X  pu= %X  *pu= %d",u,&u,pu,*pu);
	printf("\n\nv= %d  &v= %X pv= %X *pv= %d", v,&v,pv, *pv);

	getch();
}
*/

/*void main() {

	int u=3;
	int *pu;
	pu=&u;
	printf("\n*pu= %d u= %d", *pu, u);
	*pu= 0;
	printf("\n*pu= %d u= %d", *pu, u);
	getch();

} */

void main() {
	int a, *b, **c, ***d /*****e*/;

	a = 40;
	b = &a;
	c = &b;
	d = &c;
	//e = &d;

	printf("a = %d\n",a);
	printf("*b = %d\n",*b);
	printf("**c = %d\n", **c);
	printf("***d = %d\n",***d);
	//printf("****e = %e\n", ****e);
	printf("&a = %p\n",&a);
	printf("b = %p\n",b);
	printf("*c = %p\n", *c);
	printf("**d = %p\n",**d);
	//printf("***e = %p\n",***e);
	printf("&b = %p\n",&b);
	printf("c = %p\n", c);
	printf("*d = %p\n",*d);
	//printf("**e = %p\n",**e);
	printf("&c = %p\n",&c);
	printf("d = %p\n", d);
	//printf("*e = %p\n", *e);
	printf("&d = %p\n",&d);
	//printf(" e = %p\n",e);

}
