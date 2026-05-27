#include<fstream.h>
#include<conio.h>
#include<stdio.h>
#include<stdlib.h>
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
class pas
{       private:
		char na[50],had[50];  //home address
		int age,id;
		void enter_id()
		{	ofstream f("id.dat",ios::binary|ios::app);
			idc ob(id);
			f.write((char *)&ob,sizeof(ob));
			f.close();
		}
		void create_id();
	public:
		void create_ob()
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
			create_id();
			show();
		}
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
			gotoxy(14,14);
			cout<<"PLEASE REMEBER YOUR ID !!";
			getch();
		}
		int ret_id()
		{	return id;
		}
};
void pas::create_id()
{	ifstream f("id.dat",ios::binary);
	idc ob;
	int flag;
	do
	{       flag=0;
		randomize();
		id=random(100);
		while(f.read((char *)&ob,sizeof(ob)))
		{	if(ob.ret_id()==id)
			{	flag=1;
				break;
			}
		}
	}while(flag==1 || id==0);
	f.close();
	enter_id();
}
int pas_login()
{       int l;
	clrscr();
	o2;
	gotoxy(13,8);
	cout<<"-ENTER ID :";
	cin>>l;
	ifstream f("id.dat",ios::binary);
	idc o;
	while(f.read((char *)&o,sizeof(o)))
		if(o.ret_id()==l)
			return l;
	gotoxy(14,10);
	cout<<"ERROR INCORRECT ID!!";
	getch();
	return 0;
}


