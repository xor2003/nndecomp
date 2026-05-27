#include<stdio.h>
#include<conio.h>
void main()
{
 int grade=0, g=0;
 clrscr();
 printf("Enter the grade between 0 to 100:\n");
 scanf("%d",&grade);
 g=grade/10;
 printf("Your Result:\n");
 switch(g)
 {
  case 4:printf("pass");
	 break;
  case 5:printf("second class");
	 break;
  case 6:printf("first class");
	 break;
  default:
  if(g<4){
   printf("Fail");
  }
  else{
   printf("Disntinction");
  }
  break;
 }
 getch();
}