#include<stdio.h>
#include<conio.h>
#include<ctype.h>
#include<string.h>

int s[50],top=-1;        //sath

void push(int x)
{
 s[++top]=x;
}

int pop()
{
 return s[top--];
}

void main()
{
 char postfix[20];
 int op1,op2;
 clrscr();
 printf("Enter the valid numerical postfix expression: \n");
 gets(postfix);
 for(int i=0;i<strlen(postfix);i++)
 {
  if(isdigit(postfix[i]))
   push(postfix[i]-'0');
  else {
   op2 = pop();
   op1 = pop();
   switch(postfix[i])
   {
    case '+': push(op1+op2); break;
    case '-': push(op1-op2); break;
    case '*': push(op1*op2); break;
    case '/': push(op1/op2); break;
    case '^': push(op1^op2); break;
    case '$': push(op1^op2); break;
   }
  }
 }
 printf("Result = %d",pop());
 getch();
}