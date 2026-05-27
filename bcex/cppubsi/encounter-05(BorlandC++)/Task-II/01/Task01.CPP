//Task 1 Pertemuan 5
#include <conio.h>
#include <stdio.h>
#include <iostream.h>
main()
{
int a,b=0;
clrscr();
for (a=1; a<=19; a+=2)
{
if(a<19)
cout<<a<<"+";
else
cout<<a;
b=b+a;
}
cout<<"="<<b;
getch();
}