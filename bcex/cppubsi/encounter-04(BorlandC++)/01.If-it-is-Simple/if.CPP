#include <stdio.h>
#include <conio.h>
#include <iostream.h>
main()
{
double tot_beli, pot=0, jum_bayar=0;
clrscr();
cout<<"Total Pembelian Rp. ";cin>>tot_beli;
if (tot_beli>=50000)
pot=0.2 * tot_beli;
cout<<"Besaran Potongan Rp. "<<pot<<endl;
jum_bayar=tot_beli-pot;
cout<<"Jumlah yang harus dibayar Rp."<<jum_bayar;
getch();
}