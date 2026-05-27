//Task 1 Pertemuan 5
#include <stdio.h>
#include <conio.h>
#include <iostream.h>

main()
{
int a,b=0;
clrscr();
for(a=2; a<=20; a+=2)
{
if(a<20)
cout<<a<<" + ";
else
cout<<a;
b=b+a;
}
cout<<" = "<<b;
getch();
}
