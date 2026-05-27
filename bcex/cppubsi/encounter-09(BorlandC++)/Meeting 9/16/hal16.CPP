#include<conio.h>
#include<iostream.h>
#include<stdio.h>
siswa(float uts, float uas);//deklarasi fungsi
garis()//fungsi garis
{
 printf("\n\t=================================\n");}
main()
{
 char nim[10],nama[20],ket[10],lagi;
 float a,b,rata;
 cout<<"\n\t Perhitungan Nilai Siswa"<<endl;
 cout<<"\t";garis();
 cout<<"\t Masukan Nim	:";cin>>nim;
 cout<<"\t Masukan Nama	:";cin>>nama;
 cout<<"\t Nilai UTS      :";cin>>a;
 cout<<"\n\t Nilai UAS      :";cin>>b;
 rata=siswa(a,b);
 printf("\n\tNilai Rata-Rata	:%3.2f",rata);
 if(rata>59)
 strcpy(ket,"LULUS");
 else
 strcpy(ket,"GAGAL");
 cout<<"\n\t Keterangan	:"<<ket<<endl;
 getch();
 }

 siswa(float uts, float uas)//proses fungsi siswa
 {
 return((uts+uas)/2);
 }

