#include <stdio.h>
#include <conio.h>
#include <iostream.h>
main()
{
char nom, lagi, a, b, c;
atas:
clrscr();
cout<<"Masukan Kode Buku [1|2|3] :";
nom = getche();
cout<<'\n';
switch (nom)
{case '1':
cout<<"Sukses Belajar Borland C++";cin>>a;
break;
case '2':
cout<<"Kunci Pribadi Yang Sukses";cin>>b;
break;
case '3':
cout<<"Mencari Mutiara Didasar Hati";cin>>c;
break;
default:
cout<<"Pilihan Buku Salah!!";
}
cout<<'\n';
cout<<"\nIngin pilih lagi [Y/T]:";
lagi = getche();
if (lagi == 'Y' || lagi=='y')
goto atas;
getch();
}

