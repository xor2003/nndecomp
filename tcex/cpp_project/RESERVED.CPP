#include<fstream.h>
#include<conio.h>
#include<stdlib.h>
#include<stdio.h>
#include<string.h>
#define o2 gotoxy(32,5);   \
	cout<<"I.R.C.T.C.";
#define o3 	o2;          \
		gotoxy(31,7); \
		cout<<"RESERVED ZONE";
class idc
{	private:
		int i;
	public:
		idc()
		{
		}
		idc(int a)
		{	i=a;
		}
		int ret_id()
		{	return i;
		}
};
class emp
{       private:
		char na[50],had[50];  //home address
		int age,id;
	public:
		void create_ob();
		void show()
		{	clrscr();
			o2;
			gotoxy(14,7);
			cout<<"DETAILS ARE-";
			gotoxy(13,9);
			cout<<"-NAME :"<<na;
			gotoxy(13,10);
			cout<<"-HOME ADDRESS :"<<had;
			gotoxy(13,11);
			cout<<"-AGE :"<<age;
			gotoxy(13,12);
			cout<<"-ID :"<<id;
			getch();
		}
		int ret_id()
		{	return id;
		}
};
void emp::create_ob()
{	clrscr();
	o2;
	gotoxy(13,9);
	cout<<"-ENTER YOUR ID :";
	int a,flag=0;
	cin>>a;
	ifstream f("ide.dat",ios::binary);
	idc ob;
	while(f.read((char *)&ob,sizeof(ob)))
		if(ob.ret_id()==a)
		{	flag=1;
			id=a;
			break;
		}
	f.close();
	if(flag==0)
	{	gotoxy(14,11);
		cout<<"ERROR!! INVALID ID";
		getch();
	}
	else if(flag==1)
	{	clrscr();
		o2;
		gotoxy(14,7);
		cout<<"ENTER THE FOLLOWING DETAILS -";
		gotoxy(13,9);
		cout<<"-NAME :";
		gets(na);
		gotoxy(13,10);
		cout<<"-HOME ADDRESS :";
		gets(had);
		gotoxy(13,11);
		cout<<"-AGE :";
		cin>>age;
		show();
	}
}
void password(char p[50])
{	for(int i=0;;)
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
			cout<<"*";
		}
	}
}
void reserved()
{	clrscr();
	o2;
	gotoxy(14,7);
	cout<<"ENTER PASSWORD TO CONTINUE :";
	char p[50];
	password(p);
	if(strcmpi(p,"irctc")!=0)
	{	gotoxy(14,9);
		cout<<"INVALID PASSWORD !!";
		getch();
	}
	else
	{       for(int o=1;;)
		{	clrscr();
			o3;
			gotoxy(15,9);
			int o=1;
			cout<<"-MAKE AN EMP'S ID";
			if(o==1)
				gotoxy(14,9);
			cout<<"->";
			int a=getch();
			if(a==13)
				break;
		}
		if(o==1)
		{       int a,flag;
			do
			{       flag=0;
				randomize();
				a=random(89);
				ifstream f("ide.dat",ios::binary);
				idc ob;
				while(f.read((char *)&ob,sizeof(ob)))
					if(ob.ret_id()==a)
					{	flag=1;
						break;
					}
				f.close();
			}while(flag==1);
			a+=10;
			idc ob(a);
			ofstream f("ide.dat",ios::binary|ios::app);
			f.write((char *)&ob,sizeof(ob));
			f.close();
			clrscr();
			o3;
			gotoxy(14,9);
			cout<<"ID CREATED!!";
			gotoxy(14,10);
			cout<<"ID No."<<a;
			getch();
		}
	}
}

