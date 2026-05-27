#include <stdio.h>
#include <conio.h>
#include <iostream.h>

main()
{
char gol, jab[10];
long gapok=0;

clrscr();
cout<<endl<<"Data Jabatan"<<endl
<<"= = = = = = = = = = = = = = = ="<<endl;
cout<<"Masukan Golongan [1/2]:";
cin>>gol;
//proses seleksi kondisi
if(gol=='1')
{strcpy(jab,"Direktur");
gapok=50000000;
}
else if(gol=='2')
{strcpy(jab,"Manajer");
gapok=4000000;
}
else
{cout<<"Salah kode golongan"<<endl;}
//output datanya
cout<<"Jabatan = "<<jab<<endl;
cout<<"Gaji Pokok = "<<gapok<<endl;
getch();
}
