/*---------------------------------------*/
/*-------- Remake&Fixed : Dhn-nys -------*/
/*---------------------------------------*/
/*Sumber : ummulfadliharahap.blogspot.com*/
/*---------------------------------------*/
#include<conio.h>
#include<stdio.h>
#include<iostream.h>
main()
{
char kode,nb[50],lagi,bonus[25];
int jb, hrg, pot,tb,ppn;
awal:
clrscr();
puts("\t*******TOKO BUKU HALIFI*******");
puts("\tJL. Keadilan NO.16");
puts("============================================");
cout<<"Masukkan Kode[1|2|3]:";cin>>kode;
cout<<"Jumlah Beli:";cin>>jb;
cout<<endl;
switch(kode)
{
case '1':
strcpy(nb,"Sukses Belajar Borland C++");
hrg=50000;
break;

case '2':
strcpy(nb,"Kunci Pribadi Yang Sukses");
hrg=35000;
break;

case '3':
strcpy(nb,"Mencari Mutiara Didasar Hati");
hrg=45000;
break;

default:
strcpy(nb,"ERROR!!! KODE BUKU YANG DI INPUT SALAH!!!");
hrg=0;
break;
}

//proses total
tb=hrg*jb;
//mencari potongan dan bonus
if(jb>5)
{
strcpy(bonus,"Note Book");
pot=0.1*tb;
}
else
{
strcpy(bonus,"Tidak Dapat");
pot=0;
}

//proses total setelah potongan
tb=tb-pot;

//mencari ppn
ppn=0.1*tb;

cout<<endl;
cout<<"Nama Buku       : "<<nb<<endl;
cout<<"Harga Buku      : "<<hrg<<endl;
cout<<"Potongan        : "<<pot<<endl;
cout<<"Bonus           : "<<bonus<<endl;
cout<<"Total Bayar     : "<<tb<<endl;
cout<<"PPN             : "<<ppn<<endl;
puts("============================================");
puts("\t*******TERIMA KASIH********");
cout<<endl;
cout<<"Ingin Input Lagi?[Y/T]:";cin>>lagi;
clrscr();
if(lagi=='Y' || lagi=='y')
{goto awal;}
if(lagi=='T' || lagi=='t')
{goto selesai;}
selesai:
cout<<endl;
cout<<"\t******* Terima Kasih *******"<<endl;
getch();
}
