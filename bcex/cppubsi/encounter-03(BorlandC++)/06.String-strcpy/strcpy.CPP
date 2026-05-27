#include <stdio.h>
#include <conio.h>
#include <string.h>
#include <iostream.h>

main()
{
char huruf[20];
char pindah[20];
cout<<"Masukkan Sembarang Kata = ";
gets(huruf);
/*Proses */
strcpy(pindah, huruf);
cout<<"Pemindahannya = "<<pindah;
getch();
}