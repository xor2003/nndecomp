#include<fstream.h>
#include<conio.h>
#include<stdio.h>
#include<stdlib.h>
#define o2 gotoxy(32,5);  \
	cout<<"I.R.C.T.C.";
#define o3 gotoxy(28,3);       \
	cout<<"I.R.C.T.C.";\
	gotoxy(43,5); \
	cout<<"ID :"<<id;
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
void booktic(int id)
{	int st1=1,st2=1,flag=0;
	for(;;)
	{	clrscr();
		o3;
		gotoxy(14,7);
		cout<<"FROM STATION :";
		gotoxy(13,9);
		cout<<"-1";
		gotoxy(13,10);
		cout<<"-2";
		gotoxy(13,11);
		cout<<"-3";
		gotoxy(13,12);
		cout<<"-4";
		gotoxy(13,13);
		cout<<"-5";
		gotoxy(13,14);
		cout<<"-6";
		gotoxy(13,15);
		cout<<"-7";
		gotoxy(13,16);
		cout<<"-8";
		if(st1==1)
			gotoxy(12,9);
		else if(st1==2)
			gotoxy(12,10);
		else if(st1==3)
			gotoxy(12,11);
		else if(st1==4)
			gotoxy(12,12);
		else if(st1==5)
			gotoxy(12,13);
		else if(st1==6)
			gotoxy(12,14);
		else if(st1==7)
			gotoxy(12,15);
		else if(st1==8)
			gotoxy(12,16);
		cout<<"->";
		if(flag==1)
		{	gotoxy(42,7);
			cout<<"TO STATION :";
			gotoxy(42,9);
			cout<<"-1";
			gotoxy(42,10);
			cout<<"-2";
			gotoxy(42,11);
			cout<<"-3";
			gotoxy(42,12);
			cout<<"-4";
			gotoxy(42,13);
			cout<<"-5";
			gotoxy(42,14);
			cout<<"-6";
			gotoxy(42,15);
			cout<<"-7";
			gotoxy(42,16);
			cout<<"-8";
			if(st2==1)
				gotoxy(41,9);
			else if(st2==2)
				gotoxy(41,10);
			else if(st2==3)
				gotoxy(41,11);
			else if(st2==4)
				gotoxy(41,12);
			else if(st2==5)
				gotoxy(41,13);
			else if(st2==6)
				gotoxy(41,14);
			else if(st2==7)
				gotoxy(41,15);
			else if(st2==8)
				gotoxy(41,16);
			cout<<"->";
			int a=getch();
			if(a==0)
			{	a=getch();
				if(a==80 && st2!=8)
					st2++;
				else if(a==72 && st2!=1)
					st2--;
			}
			else if(a==13)
				break;
		}
		else
		{	int a=getch();
			if(a==0)
			{	a=getch();
				if(a==80 && st1!=8)
					st1++;
				else if(a==72 && st1!=1)
					st1--;
			}
			else if(a==13)
				flag=1;
		}
	}
	clrscr();
	cout<<st1<<" "<<st2<<" "<<flag;
	getch();
}
void pas_main()
{	int id=pas_login();
	if(id!=0)
	{	for(int a=1;;)
		{	clrscr();
			o3;
			gotoxy(32,7);
			cout<<"MENU";
			gotoxy(13,9);
			cout<<"-BOOK A TICKET";
			gotoxy(13,10);
			cout<<"-VIEW BOOKED TICKETS";
			gotoxy(13,11);
			cout<<"-CHECK PNR STATUS";
			gotoxy(13,12);
			cout<<"-EXIT";
			if(a==1)
				gotoxy(12,9);
			else if(a==2)
				gotoxy(12,10);
			else if(a==3)
				gotoxy(12,11);
			else if(a==4)
				gotoxy(12,12);
			cout<<"->";
			int b=getch();
			if(b==13)
				break;
			else if(b==0)
			{	b=getch();
				if(b==80 && a!=4)
					a++;
				else if(b==72 && a!=1)
					a--;
			}
		}
		if(a==1)
			booktic(id);
	}
}
void main()
{
	getch();
}