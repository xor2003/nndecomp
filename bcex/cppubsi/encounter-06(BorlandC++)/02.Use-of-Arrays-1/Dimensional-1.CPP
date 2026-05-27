/*---------------------------*/
/*Program Array Satu Dimensi */
/*---------------------------*/
#include <conio.h>
#include <stdio.h>
#include <iostream.h>
#include <iomanip.h>

main()
{
int i;
char nama [5][20];
float nilai1[5];
float nilai2[5];
float hasil[5];
clrscr();
//proses looping input variabel array:
for(i=1;i<=2;i++)
{
cout<<"Data ke-"<<i<<endl;
cout<<"Nama Siswa :";gets(nama[i]);
cout<<"Nilai MidTest :";cin>>nilai1[i];
cout<<"Nilai Final :";cin>>nilai2[i];
hasil[i]=(nilai1[i]*0.40)+(nilai2[i]*0.60);
cout<<endl;
}
//Proses output judul kolom
cout<<"------------------------"<<endl;
cout<<"No. Nama Siswa Nilai Nilai";
cout<<"Hasil"<<endl;
cout<<"MidTest Final";
cout<<"Ujian"<<endl;
cout<<"------------------------"<<endl;
//Proses looping output Variabel array:
for(i=1;i<=2;i++)
{
cout<<setiosflags(ios::left)<<setw(4)<<i;
cout<<setiosflags(ios::left)<<setw(10)<<nama[i];
cout<<setprecision(2)<<" "<<nilai1[i];//untuk angka puluhan menggunakan2 jika ratusan ganti 3
cout<<setprecision(2)<<" "<<nilai2[i];//untuk angka puluhan menggunakan2 jika ratusan ganti 3
cout<<setprecision(2)<<" "<<hasil[i]<<endl;//untuk angka puluhan menggunakan2 jika ratusan ganti 3
}
cout<<"----------------------------"<<endl;
getch();
}