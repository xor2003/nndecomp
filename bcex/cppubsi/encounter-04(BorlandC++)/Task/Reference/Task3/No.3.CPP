/*------------------------------*/
/* Tugas C++ Membuat Program PENGINAPAN PASTI BETAH   */
/*------------------------------*/

#include<stdio.h>
#include<conio.h>
#include<iostream.h>
main()
{
char cust[50],tipe[10],bonus[15],lagi,kode;
int lama,hrg,sewa,cash,total,kembali,adm;
atas:
cout<<" PENGINAPAN PASTI BETAH"<<endl<<endl;
cout<<" **************************************"<<endl<<endl;
cout<<" Nama Penyewa\t\t: ";gets(cust);
cout<<" Kode Kamar [A/B/M]\t: ";cin>>kode;
switch(kode)
{
    case'a':
    case 'A':
    strcpy(tipe,"ANGGREK");
      hrg=300000;
    break;
    case'b':
    case'B':
      strcpy(tipe,"Bougenville");
      hrg=250000;
    break;
    case'm':
    case'M':
      strcpy(tipe,"MAWAR");
      hrg=200000;
    break;
    default:
    cout<<endl;
    cout<<" Kode Kamar Yang Anda Masukan Salah"<<endl;
      goto bawah;
    }
cout<<" Lama Menginap\t\t: ";cin>>lama;
if(lama>=7)
{
strcpy(bonus,"Payung Cantik");
}
else
strcpy(bonus,"TIDAK DAPAT SOUVENIR\t\t");
clrscr();
adm=200000;
sewa=lama*hrg;
total=adm+sewa;
cout<<" PENGINAPAN PASTI BETAH"<<endl<<endl;
cout<<" Nama Penyewa\t\t: "<<cust<<endl;
cout<<" Kode Kamar [A/B/M]\t: "<<kode<<endl;
cout<<" Lama Menginap\t\t: "<<lama<<endl<<endl;
cout<<" **************************************"<<endl<<endl;
cout<<" Tipe Kamar\t\t: "<<tipe<<endl;
cout<<" Lama Menginap\t\t: "<<lama; cout<<" hari"<<endl;
cout<<" Souvenir\t\t: "<<bonus<<endl;
cout<<" Biaya Sewa\t\t: "<<sewa<<endl;
cout<<" Biaya Administrasi\t: "<<adm<<endl;
cout<<" Total Biaya Sewa\t: "<<total<<endl<<endl;
cout<<" **************************************"<<endl<<endl;
cout<<" Uang Bayar\t\t: ";cin>>cash;
kembali=cash-total;
cout<<" Uang Kembali\t\t: "<<kembali<<endl;
bawah:
cout<<endl;
cout<<" INGIN INPUT LAGI?[Y/T] :";cin>>lagi;
clrscr();
if(lagi=='y'||lagi=='Y')
goto atas;
else
getch();
}