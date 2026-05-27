#include<fstream.h>
#include<conio.h>
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#define o2 gotoxy(32,5);   \
	cout<<"I.R.C.T.C.";
#define o3 gotoxy(28,3);       \
	cout<<"I.R.C.T.C.";\
	gotoxy(43,4); \
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
class station
{	private:
		int id,n,tr[10],c;
		char stname[50];
	public:
		station()
		{	c=0;
		}
		int ret_id()
		{	return id;
		}
		void create_ob();
		void show();
};
void station::create_ob()
{	ifstream f("idst.dat",ios::binary);
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
	ofstream f1("idst.dat",ios::binary|ios::app);
	idc ob1;
	f1.write((char *)&ob1,sizeof(ob1));
	f1.close();
	clrscr();
	o2;
	gotoxy(13,7);
	cout<<"-ENTER THE STATION NAME :";
	gets(stname);
	show();
}
void station::show()
{	clrscr();
	o2;
	gotoxy(13,7);
	cout<<"-STATION NAME :"<<stname;
	gotoxy(13,8);
	cout<<"-STATION ID :"<<id;
	if(c==1)
	{	gotoxy(13,9);
		cout<<"-THE NO. OF TRAINS THAT PASSES THROUGH THIS STATION EVERY DAY :"<<n;
		gotoxy(13,10);
		cout<<"-THE TRAINs ARE :";
		for(int i=0;i<n;i++)
		{	gotoxy(14,11+i);
			cout<<i+1<<") "<<tr[i];
		}
	}
	getch();
}
class train
{	private:
		int id,stno[10],n,c;
		char tname[50];
	public:
		train()
		{	c=0;
		}
		void create_ob();
		void show();
		int ret_id()
		{	return id;
		}
};
void train::create_ob()
{	ifstream f("idtr.dat",ios::binary);
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
	ofstream f1("idtr.dat",ios::binary|ios::app);
	idc ob1;
	f1.write((char *)&ob1,sizeof(ob1));
	f1.close();
	clrscr();
	o2;
	gotoxy(13,7);
	cout<<"-ENTER THE TRAIN NAME :";
	gets(tname);
	show();
}
void train::show()
{	clrscr();
	o2;
	gotoxy(13,7);
	cout<<"-TRAIN NAME :"<<tname;
	gotoxy(13,8);
	cout<<"-TRAIN ID :"<<id;
	if(c==1)
	{	gotoxy(13,9);
		cout<<"-THE NO. OF THROUGH WHICH THE TRAIN PASSES :"<<n;
		gotoxy(13,10);
		cout<<"-THE STATIONS ARE :";
		for(int i=0;i<n;i++)
		{	gotoxy(14,11+i);
			cout<<i+1<<") "<<stno[i];
		}
	}
	getch();
}

int pas_login()
{       int l;
	clrscr();
	o2;
	gotoxy(13,8);
	cout<<"-ENTER ID :";
	cin>>l;
	ifstream f("ide.dat",ios::binary);
	idc o;
	while(f.read((char *)&o,sizeof(o)))
		if(o.ret_id()==l)
			return l;
	gotoxy(14,10);
	cout<<"ERROR INCORRECT ID!!";
	getch();
	return 0;
}
void e_login()
{	int id=pas_login();
	if(id!=0)
	{       for(int o=1;;)
		{	clrscr();
			o3;
			gotoxy(14,6);
			cout<<"STAION ZONE";
			gotoxy(13,8);
			cout<<"-ENTER A NEW STATION";  //O=1
			gotoxy(13,9);
			cout<<"-INFO OF A STAION";     //O=2
			gotoxy(13,10);
			cout<<"-UPDATE THE INFO OF A STATION"; //O=3
			gotoxy(45,6);
			cout<<"TRAIN ZONE";
			gotoxy(44,8);
			cout<<"-ENTER A NEW TRAIN";   //O=4
			gotoxy(44,9);
			cout<<"-INFO OF A TRAIN";     //O=5
			gotoxy(44,10);
			cout<<"-UPDATE THE INFO OF A TRAIN"; //O=6
			gotoxy(13,12);
			cout<<"-PLAN A JOURNEY OF A TRAIN"; //O=7
			gotoxy(13,13);
			cout<<"-EXIT";     //O=8
			if(o==1)
				gotoxy(12,8);
			else if(o==2)
				gotoxy(12,9);
			else if(o==3)
				gotoxy(12,10);
			else if(o==4)
				gotoxy(43,8);
			else if(o==5)
				gotoxy(43,9);
			else if(o==6)
				gotoxy(43,10);
			else if(o==7)
				gotoxy(12,12);
			else if(o==8)
				gotoxy(12,13);
			cout<<"->";
			int b=getch();
			if(b==13)
			{       if(o==8)
					break;
				else if(o==1)
				{	station ob;
					ob.create_ob();
					ofstream f("infost.dat",ios::binary|ios::app);
					f.write((char *)&ob,sizeof(ob));
					f.close();
				}
				else if(o==2)
				{	station ob;
					ifstream f("infost.dat",ios::binary);
					int a,flag=0;
					clrscr();
					o3;
					gotoxy(14,7);
					cout<<"ENTER THE STATION ID:";
					cin>>a;
					while(f.read((char *)&ob,sizeof(ob)))
						if(ob.ret_id()==a)
						{       flag=1;
							ob.show();
							break;
						}
					if(flag==0)
					{       gotoxy(14,8);
						cout<<"ERROR!! INVALID ID!";
						getch();
					}
				}
				else if(o==4)
				{	train ob;
					ob.create_ob();
					ofstream f("infot.dat",ios::binary|ios::app);
					f.write((char *)&ob,sizeof(ob));
					f.close();
				}
				else if(o==5)
				{	train ob;
					ifstream f("infot.dat",ios::binary);
					int a,flag=0;
					clrscr();
					o3;
					gotoxy(14,7);
					cout<<"ENTER THE TRAIN ID:";
					cin>>a;
					while(f.read((char *)&ob,sizeof(ob)))
						if(ob.ret_id()==a)
						{       flag=1;
							ob.show();
							break;
						}
					if(flag==0)
					{       gotoxy(14,8);
						cout<<"ERROR!! INVALID ID!";
						getch();
					}
				}

			}
			else if(b==0)
			{	b=getch();           //77->    75<-
				if(b==80 && o<8 && o!=3)
					o++;
				else if(b==80 && o==3)
					o=7;
				else if(b==72 && o>1 && o!=7 && o!=4)
					o--;
				else if(b==72 && o==7)
					o=3;
				else if(b==77 && (o==1 || o==2 || o==3))
					o+=3;
				else if(b==77 && o==7)
					o=6;
				else if(b==75 && (o==6 || o==5 || o==4))
					o-=3;
			}
		}
	}
}
void main()                  //idst.dat,idtr.dat,infost.dat,infot.dat
{

}

