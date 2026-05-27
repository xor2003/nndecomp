/* #Define 2 with makro*/
#include <iostream>
#include <stdio.h>
#include <conio.h>
#define awal {
#define akhir }
#define mulai() main()
#define cetak cout
#define masuk cin
#define hapus() clrscr()
#define tahan() getch()
#define PANGKAT2 (bil*bil)
#define PANGKAT3 (bil*bil*bil)

mulai()
awal
int bil, pangkat;
hapus();
cetak<<endl;
cetak<<" Program Menghitung Pangkat Dua dan Pangkat Tiga"<<endl;
cetak<<" dari sebuah bilangan bulat dengan makro "<<endl;
cetak<<"--------------------------------------------------------"<<endl;
cetak<<" Masukan Bilangan Bulat :";masuk>>bil; //input bilangan bulat
cetak<<endl;
//PANGKAT 2
pangkat = PANGKAT2;
cetak<<"=========================================="<<endl;
cetak<<" Pangkat Dua dari "<<bil<<" adalah "<<pangkat;
cetak<<endl;
//PANGKAT 3
pangkat = PANGKAT3;
cetak<<" Pangkat Tiga dari "<<bil<<" adalah "<<pangkat<<endl;
cetak<<"=============================================="<<endl;
/*****************
borntobecode
*****************/
tahan();
akhir