//Task 03 Pertemuan 5
#include <stdio.h>
#include <iostream.h>
#include <conio.h>

main()
{
int a,i,j,juml;
for(i=1;i<=10;i+=2)
{
juml=1;
for(j=1;j<=i;j+=2)
{
if(j!=1)
cout<<"*";
cout<<j;
juml*=j;
}
cout<<"="<<juml<<endl;
}
cout<<endl;
getch();
}
