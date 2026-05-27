#include <stdio.h>
#include <conio.h>
#include <iostream.h>
main( )
{
	int x,y, a=0, b=0, c=0, d=0;
   clrscr();
   cout<<"Masukan Nilai A : "; cin>>x;
   cout<<"Masukan Nilai B : "; cin>>y;
   a=x+y; c = x% y;
   b=x-y; d = x * y;
   printf("Hasil Dari A = X + Y = %i \n",a);
   printf("Hasil Dari B = X - Y = %i \n",b);
   cout<<"Hasil dari C = X % Y = "<<c<<endl;
   cout<<"Hasil dari D = X * Y ="<<d<<endl;
   getch();
}
