//Program tambah nilai
//penggunaan cal by vallue
#include <conio.h>
#include <stdio.h>
#include <iostream.h>

tambah(int m, int n);
main()
{
int a, b;
a = 5;
b = 9;
clrscr();
cout<<"Nilai sebelum fungsi digunakan";
cout<<"\na="<<a<<"b="<<b;
tambah(a,b);
cout<<"\nNilai setelah fungsi digunakan";
cout<<"\na = "<<a<<"b="<<b;
getch();
}
/*tambah(int m, int n)
{
m+=5;
n+=7;
cout<<"\n\nNilai didalam fungsi tambah()";
cout<<"\nm = "<<m<<"n="<<n;
cout<<endl;*/