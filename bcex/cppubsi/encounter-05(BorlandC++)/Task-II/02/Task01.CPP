//Task 2 Pertemuan 5
#include <conio.h>
#include <stdio.h>
#include <iostream.h>
main()
{
int a,b=0;
clrscr();
for (a=1; a<=10; a++)
{
if(a<10)
cout<<a<<"+";
else
cout<<a;
b=b+a;
}
cout<<"="<<b;
getch();
}