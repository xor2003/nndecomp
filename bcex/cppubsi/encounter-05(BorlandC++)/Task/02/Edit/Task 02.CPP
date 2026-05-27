//Task 02 Pertemuan 5
#include <stdio.h>
#include <conio.h>
#include <iostream.h>

main()
{
int A=10, B, j, jumlah;
for(B=2;B<=A;B+=2)
{
jumlah=0;
for(j=2;j<=B;j+=2)
{
if(j!=2)
cout<<"+";
cout<<j;
jumlah+=j;
}
cout<<"="<<jumlah<<endl;
}
cout<<endl;
getch();
}