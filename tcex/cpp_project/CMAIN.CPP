#include<fstream.h>
#include<conio.h>
#include<stdio.h>
#include<stdlib.h>
#define o2 gotoxy(32,5);   \
	cout<<"I.R.C.T.C.";
#define o3 o2;       \
	gotoxy(47,7); \
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
class pnrc
{	private:
		int pn;
	public:
		pnrc()
		{
		}
		pnrc(int a)
		{	pn=a;
		}
		int ret_pnr()
		{	return pn;
		}
};
class tic
{	private:
		char tname[50],s_st[4],e_st[4];
		int pnr,id_c;
		void enter_pnr()
		{	ofstream f("pnr.dat",ios::binary|ios::app);
			pnrc ob(pnr);
			f.write((char *)&ob,sizeof(ob));
			f.close();
		}
		void create_pnr();
	public:
		tic(int a)
		{	id_c=a;
		}
		void create()
		{	gets(tname);
			gets(s_st);
			gets(e_st);
			create_pnr();
		}
		int ret_pnr()
		{	return pnr;
		}
};
void tic::create_pnr()
{	ifstream f("pnr.dat",ios::binary);
	pnrc ob;
	int flag;
	do
	{       flag=0;
		randomize();
		pnr=random(10000);
		while(f.read((char *)&ob,sizeof(ob)))
		{	if(ob.ret_pnr()==pnr)
			{	flag=1;
				break;
			}
		}
	}while(flag==1 || pnr<=999);
	f.close();
	enter_pnr();
}
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
	}
}



