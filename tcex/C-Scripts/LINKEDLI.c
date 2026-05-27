#include<stdio.h>
#include<conio.h>
#include<stdlib.h>

struct node
{
 int info;
 struct node * link;
};

typedef struct node * Node;
Node first=NULL;

void insertbeg()
{
 Node temp = (Node)malloc(sizeof(struct node));
 printf("Enter the data\n");
 scanf("%d",&temp->info);
 temp->link = NULL;
 if(first == NULL);
 {
  first = temp;
  return;
 }
 temp->link = first;
 first = temp;
}

void insertend()
{
 Node cur;
 Node temp = (Node)malloc(sizeof(struct node));
 printf("Enter the data\n");
 scanf("%d",&temp->info);
 temp->link = NULL;
 if(first == NULL)
 {
  first = temp;
  return;
 }
 cur = first;
 while(cur->link!=NULL)
  cur = cur->link;
 cur->link=temp;
}

void display()
{
 Node cur;
 if(first == NULL)
 {
  printf("List Empty\n");
 }
 else
 {
  cur = first;
  printf("The list is \n");
  while(cur!=NULL)
  {
   printf("%d\t",cur->info);
   cur=cur->link;
  }
 }
}

void main()
{
 int ch;
 clrscr();
 for(;;)
 {
  printf("\n1.InsertBeg\n2.InsertEnd\n3.Display\n4.Exit\n");
  scanf("%d",&ch);
  switch(ch)
  {
   case 1: insertbeg();
	   break;
   case 2: insertend();
	   break;
   case 3: display();
	   break;
   default: exit(0);
	   break;
  }
 }
}