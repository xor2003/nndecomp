#include<fstream.h>
#include<conio.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<iomanip.h>
#define o2 gotoxy(32,5);  \
	cout<<"I.R.C.T.C.";
#define o3 gotoxy(28,3);       \
	cout<<"I.R.C.T.C.";\
	gotoxy(43,4); \
	cout<<"ID :"<<id;
#define o4 ifstream f("trnbk.dat",ios::binary);    \
		trains ob;                          \
		while(f.read((char *)&ob,sizeof(ob)))\
		{       i++;\
			char n[50];                   \
			int l;                         \
			ob.ret_info(l,n);               \
			gotoxy(j+1,8+i);                   \
			cout<<"-"<<setiosflags(ios::left)<<setw(10)<<n<<l;\
		} \
		f.close();
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
class trains
{	private:
		int tno;
		char tname[50];
	public:
		trains()
		{
		}
		trains(int a,char n[50])
		{	tno=a;
			strcpy(tname,n);
		}
		void ret_info(int &a,char n[50])
		{	a=tno;
			strcpy(n,tname);
		}
};
void booktic(int id)
{	int st1=1,st2=1,flag=0,i=0;
	for(;;)
	{	clrscr();
		int j=12;
		i=0;
		o4;
		if(i==0)
		{	clrscr();
			o3;
			gotoxy(13,9);
			cout<<"ERROR!! NO TRAINS FOUND";
			getch();
			break;
		}
		o3;
		gotoxy(14,6);
		cout<<"FROM STATION :";
		gotoxy(14,8);
		cout<<"NAME";
		gotoxy(24,8);
		cout<<"NO.";
		for(int k=1;k<=i;k++)
			if(st1==k)
			{	gotoxy(j,8+k);
				break;
			}
		cout<<"->";
		if(flag==1)
		{       j=41;
			i=0;
			gotoxy(43,6);
			cout<<"TO STATION :";
			gotoxy(43,8);
			cout<<"NAME";
			gotoxy(53,8);
			cout<<"NO.";
			o4;
			for(k=1;k<=i;k++)
				if(st2==k)
				{	gotoxy(j,8+k);
					break;
				}
			cout<<"->";
			int a=getch();
			if(a==13)
				break;
			else if(a==0)
			{	a=getch();
				if(a==80 && st2!=i)
				st2++;
				else if(a==72 && st2!=1)
				st2--;
			}
		}
		else
		{	int a=getch();
			if(a==13)
				flag=1;
			else if(a==0)
			{	a=getch();
				if(a==80 && st1!=i)
					st1++;
				else if(a==72 && st1!=1)
					st1--;
			}
		}

	}
	clrscr();
	cout<<st1<<" "<<st2<<" "<<i;
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
{      pas_main();
}
