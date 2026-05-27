//Task Pertemuan 6
#include <stdio.h>
#include <conio.h>
#include <iostream.h>
#include <iomanip.h>
#include <string.h>

main()
{
int i,j;
char kode[6], *jenis[6], lagi;
int banyak[6],harga[6],jumlah[6],total,pajak,tb;
atas:
clrscr();
cout<<"==================================="<<endl;
cout<<"  ^GEROBAK FRIED CHICKEN^  "<<endl;
cout<<"   Kode    jenis   Harga   "<<endl;
cout<<"   [D]     Dada    Rp.2500 "<<endl;
cout<<"   [P]     Paha    Rp.2000 "<<endl;
cout<<"   [S]     Sayap   Rp.1500 "<<endl;
cout<<"==================================="<<endl;

cout<<"Banyak Jenis         : ";cin>>j;
for (i=1;i<=j;i++)
{
cout<<"jenis ke- "<<i<<endl;
cout<<"Jenis Potong [D/P/S] : ";cin>>kode[i];
cout<<"Banyak Potong        : ";cin>>banyak[i];

if(kode[i]=='D'||kode[i]=='d')
 {jenis[i]="Dada";harga[i]=2500;}
else if(kode[i]=='S'||kode[i]=='s')
 {jenis[i]="Sayap";harga[i]=2000;}
else
 {jenis[i]="Paha";harga[i]=1500;}
jumlah[i]=harga[i]*banyak[i];
}

clrscr();
cout<<"------------------------------------------"<<endl;
cout<<"        ^GEROBAK FRIED CHICKEN^           "<<endl;
cout<<"------------------------------------------"<<endl;
cout<<"No.  Jenis   Harga   Banyak ";
cout<<" Jumlah"<<endl;
cout<<"     Potong  Satuan   Beli  ";
cout<<" Harga"<<endl;
cout<<"------------------------------------------"<<endl;
for(i=1;i<=j;i++)
    //Pembatas

{
gotoxy(1,6+i);cout<<i;
gotoxy(7,6+i);cout<<jenis[i];
gotoxy(15,6+i);cout<<harga[i];
gotoxy(23,6+i);cout<<banyak[i];
gotoxy(32,6+i);cout<<jumlah[i];

total=jumlah[i];
pajak=total*0.1;
tb=total+pajak;

}
cout<<endl;
cout<<"------------------------------------------"<<endl;
gotoxy(29,7+i);cout<<"Jumlah Bayar Rp."<<total<<endl;
gotoxy(29,8+i);cout<<"Pajak 10%    Rp."<<pajak<<endl;
gotoxy(29,9+i);cout<<"Total Bayar  Rp."<<tb<<endl;

cout<<"\n\tIngin Input Lagi?[Y/T]:";cin>>lagi;//Looping
clrscr();//Untuk menghapus bagian atas.
if(lagi=='Y' || lagi=='y')
{goto atas;}
if(lagi=='T' || lagi=='t')
{goto selesai;}
selesai:
cout<<endl;
cout<<"\t******* Terima Kasih *******"<<endl;
cout<<"\t******* Tekan  Enter *******"<<endl;
getch();
}
