#include<stdio.h>
#include<conio.h>
#include<ctype.h>
#include<string.h>
char s[50];
int top=-1;

void push(char x)
{
 s[++top]=x;
}
char pop()
{
 return s[top--];
}
int p(char x)
{
 if(x=='('||x=='#')
  return 1;
 else if(x=='+'||x=='-')
  return 2;
 else if(x=='*'||x=='/')
  return 3;
 else if(x=='$'||x=='^')
  return 4;
  else
  return 0;
}
void main()
{
 char infix[20],postfix[20];
 int i,j=0;
 clrscr();
 printf("Enter the infix expression\n");
 gets(infix);
 push('#');
 for(i=0;i<strlen(infix);i++)
 {
  if(isalnum(infix[i]))
   postfix[j+1]=infix[i];
  else if(infix[i]=='(')
   push(infix[i]);
  else if(infix[i]==')')
  {
   while(s[top]!='(')
    postfix[j++]=pop();
   pop();
  }
  else{
   while(p(s[top])>=p(infix[i]))
    postfix[j++]=pop();
    push(infix[i]);
  }
 }
 while(s[top]!='#')
  postfix[j++]=pop();
 postfix[j]='\0';
 printf("The infix expression is \n");
 puts(infix);
 printf("Postfix expression is\n");
 puts(postfix);
 getch();
}
