// Doubly Linked List
#include<stdio.h>
#include<conio.h>
#include<alloc.h>
#include<process.h>

struct node
{
 int info;
 struct node *llink,*rlink;
};

typedef struct node * Node;
Node root = NULL;

void insfront()
{
 Node temp;
 temp = (Node)malloc(sizeof(struct node));
 printf("Enter the data\n");
 scanf("%d",&temp->info);
 temp->llink=temp->rlink=NULL;
 if(root==NULL)
  root=temp;
 else{
  temp->rlink = root;
  root->llink = temp;
  root=temp;
 }
}
void inskey()
{
 Node temp,cur,prev;
 int key,flag=0;
 if(root==NULL)
  printf("List is empty\n");
 else {
  printf("Enter key\n");
  scanf("%d",&key);
  if(key==root->info)
  {
   flag=1;
   insfront();
  }
  else{
   cur=root;
   while(cur!=NULL)
   {
    if(cur->info==key)
    {
     flag=1;
     temp=(Node)malloc(sizeof(struct node));
     printf("Enter data\n");
     scanf("%d",&temp->info);
     prev=cur->llink;
     prev->rlink=temp;
     temp->llink=prev;
     cur->llink=temp;
     temp->rlink=cur;
    }
    cur=cur->rlink;
   }
  }
  if(flag!=1)
   printf("Key not found\n");
 }
}

void delkey()
{
 Node prev,cur,next;
 int flag=0,key;
 if(root==NULL)
  printf("list empty\n");
 else{
  cur=root;
  printf("Enter the item to be deleted\n");
  scanf("%d",&key);
  if(cur==root&&cur->info==key)
  {
   flag=1;
   root=root->rlink;
   root->llink=NULL;
   free(cur);
  }
  else{
   while(cur!=NULL)
   {
    if(cur->info==key)
    {
     flag=1;
     prev=cur->llink;
     next=cur->rlink;
     prev->rlink=next;
     next->llink=prev;
     cur->llink=cur->rlink=NULL;
     free(cur);
    }
    cur=cur->rlink;
   }
  }
  if(flag==1)
   printf("\nItem %d is deleted",key);
  else
   printf("\nItem not found");
 }
}

void display()
{
 Node temp;
 if(root==NULL)
  printf("List empty\n");
 else
 {
  printf("The List is:\n");
  temp=root;
  while(temp!=NULL)
  {
   printf("%d\t",temp->info);
   temp=temp->rlink;
  }
  printf("\n");
 }
}

void main()
{
 int ch;
 clrscr();
 printf("Doubly Linked List\n");
 for(;;)
 {
  printf("\n1.Insertfront 2.Insertbeforekey 3.Deletekey 4.Display 5.Exit\n");
  printf("Enter choice\n");
  scanf("%d",&ch);
  switch(ch)
  {
   case 1: insfront();
	   break;
   case 2: inskey();
	  break;
   case 3: delkey();
	   break;
   case 4: display();
	  break;
   default: exit(0);
	   break;
  }
 }
}