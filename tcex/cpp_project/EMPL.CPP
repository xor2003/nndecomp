#include<fstream.h>
#include<conio.h>
#include<stdlib.h>
#include<stdio.h>
#define o2 gotoxy(32,5);   \
	cout<<"I.R.C.T.C.";
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


