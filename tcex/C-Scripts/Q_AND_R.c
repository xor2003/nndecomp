#include<stdio.h>
#include<conio.h>

void main()
{
 int a,b,q,r;
 clrscr();
 printf("Enter the two numbers: \n");
 scanf("%d%d",&a,&b);
 q=a/b;
 r=a%b;
 printf("The q and r are %d and %d",q,r);
 getch();
}