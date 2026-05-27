/*Fungsi Pustaka Getch*/
#include <stdio.h>
#include <conio.h>
main()
{
char kar;
clrscr();
printf("Masukan Sebuah Karakter Bebas = ");
kar = getch();
printf("\nTadi Anda Masukan Karakter %c", kar);
getch();
}