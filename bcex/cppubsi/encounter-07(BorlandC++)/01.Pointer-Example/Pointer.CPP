//Contoh Program Pointer

#include <iostream.h>
#include <conio.h>
#include <stdio.h>
main()
{
int a,*b;
a=20;
b=&a;

cout<<"Pointer b Menunjukkan"<<b<<endl;
cout<<"Menunjukkan nilai"<<*b<<endl;
getche();
}