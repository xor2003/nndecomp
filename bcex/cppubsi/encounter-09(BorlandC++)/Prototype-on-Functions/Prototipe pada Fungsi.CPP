//Penggunaan Prototipe pada Fungsi
#include <conio.h>
#include <iostream.h>
#include <string.h>//untuk strcpy

char coment (char ket[30], int n); //prototipe fungsi

main()
{
char lagi,c[30];
int i;
atas
clrscr();
{
cout<<"Masukkan Nilai = ";cin>>i;
coment(c,i);//paramater formal
cout<<c;
cout<<"\n\ningin input lagi[[Y]ia/[T]idak]:";cin>>lagi;
}
if(lagi=='Y' || lagi=='y')
goto atas
else
getch();
}
//blok Program fungsi dengan para meter aktural char coment (char ket[30], int n)
{
int a;
a=n%2;
if (a==1)
strcpy(ket,"---Bilangan Ganjil---");
else
strcpy(ket,"---Bilangan genap---");
}