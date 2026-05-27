#include<stdio.h>
#include<conio.h>
#define stack_size 5

int s[stack_size];
int top=-1;

void push(int x)
{
 if(top==stack_size-1)
 {
 printf("stack is full\n");
 return;
 }
 s[++top]=x;
}

void pop()
{
 if(top==-1)
 {
 printf("Stack is empty\n");
 return;
 }
 printf("%d is popped",s[top--]);
}

void display()
{
 int i;
 if(top==-1)
 {
  printf("Stack is empty\n");
  return;
 }
 printf("stack elements are\n");
 for(i=top;i>-1;i--)
 printf("%d\n",s[i]);
}

void main()
{
 int ch,x;
 clrscr();
 for(;;)
 {
 printf("\n1.push\n2.pop\n3.display\n4.Exit\n");
 printf("Enter your choice\n");
 scanf("%d",&ch);
 switch(ch)
 {
 case 1: printf("Enter the data\n");
	 scanf("%d",&x);
	 push(x);
	 break;
 case 2: pop();
	 break;
 case 3: display();
	 break;
 case 4: exit();
	 break;
 }
 }
}
