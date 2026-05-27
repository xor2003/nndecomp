//Inisialisasi Arraay dimensi 2
#include <conio.h>
#include <iostream.h>
main()
{
char nama[2][3][10]={{"Pak","BU","Mas"},{"Andi","Budi","Carli"}};

clrscr();
cout<<nama[0][0]<<ends<<nama[1][0]<<endl;
cout<<nama[0][1]<<ends<<nama[1][2]<<endl;
cout<<nama[0][2]<<ends<<nama[1][1]<<endl;
getch();
}