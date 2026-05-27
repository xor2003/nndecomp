#include <stdio.h>
#include <conio.h>
main()
{
int a, b;
clrscr();
for(a = 1; a <= 5; a++)
{
printf ("\n");
for (b = a; b <= 5; b++ )
printf("%d",a);
}
getch();
}