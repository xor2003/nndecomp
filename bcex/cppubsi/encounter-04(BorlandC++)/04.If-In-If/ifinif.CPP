#include <stdio.h>
#include <conio.h>
#include <iostream.h>
main()
{
char kode, ukuran, merk[15];
long harga=0;

clrscr();
cout<<"Kode Baju : ";cin>>kode;
cout<<"Ukuran    : ";cin>>ukuran;
if (kode=='1')
{
 strcpy(merk,"H & R");
 if (ukuran=='S' || ukuran =='s')
 harga=450000;
 else
 harga=60000;
 }
 else if (kode=='2')
 {
 strcpy(merk,"Adidas");
 if (ukuran=='s' || ukuran == 's')
 harga=650000;
 else
 harga=750000;
 }
 else
 cout<<"Salah kode Baju"<<endl;
 cout<<"--------------------"<<endl;
 cout<<"Merek Baju : "<<merk<<endl;
 cout<<"Harga Baju : "<<harga<<endl;
 getch();
 }
