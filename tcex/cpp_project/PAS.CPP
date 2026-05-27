#include<iostream.h>
#include<conio.h>
#define o1 gotoxy(31,5);  \
	cout<<"I.R.C.T.C"; \
	gotoxy(25,6);       \
	cout<<"(INDIAN RAILWAY CATERING "; \
	gotoxy(22,7);                       \
	cout<<"AND TOURISM CORPORATION LIMITED)";
void main()
{	clrscr();
	clrscr();
	o1;
	gotoxy(17,11);
	cout<<"ENTER PASSWORD TO CONTINUE -";
	gotoxy(17,13);
	cout<<"ENTER THE PASSWORD :";
	char p[50];
	for(int i=0;;)
	{	char a=getch();
		if(a==13)
		{	p[i]='\0';
			break;
		}
		else if(a=='\b' && i>0)
		{	cout<<"\b \b";
			i--;
		}
		else if(a!='\b')
		{	p[i++]=a;
			cout<<a;
		}
	}
	cout<<endl<<p;
	getch();
}

