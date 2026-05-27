/*contoh 2 Scanf*/
#include <stdio.h>
#include <conio.h>
main()
{
int a, b, c;
clrscr ();
printf("Masukan Nilai A = "); scanf("%d",&a);
printf("Masukan Nilai B = "); scanf("%d",&b);
c = a + b;
printf("Hasil Penjumlahan = %d",c);
clrscr();
printf("HITUNG NILAI \n");
printf("NILAI A :%d\n",a);
printf("NILAI B :%d\n",b);
printf("-------------\n");
printf("NILAI C :%d\n",c);
getch();
}
