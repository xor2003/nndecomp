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
#define o4 clrscr();   \
	o3;             \
	gotoxy(27,5);    \
	cout<<"TRAIN NO."<<ob.ret_id();

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
	idc ob1(id);
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
		int ret_c()
		{	return c;
		}
		void train::journey(int a,int b[10]);

};
void train::journey(int a,int b[10])
{	c=1;
	n=a;
	for(int i=0;i<n;i++)
		stno[i]=b[i];
}
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
	idc ob1(id);
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
		gotoxy(25,11);
		cout<<"-STARTING FROM ";
		gotoxy(25,10+n);
		cout<<"-LAST STATION";
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
int entr(train &ob,int id);
void plan_j(train ob,int id);
void e_login()
{	int id=pas_login();
	if(id!=0)
	{       for(int o=1;;)
		{	clrscr();
			o3;
			gotoxy(13,6);
			cout<<"-EMPLYOEE ZONE ";
			gotoxy(13,8);
			cout<<"-ENTER A NEW STATION";  //O=1
			gotoxy(13,9);
			cout<<"-INFO OF A STAION";     //O=2
			gotoxy(13,10);
			cout<<"-ENTER A NEW TRAIN";   //O=3
			gotoxy(13,11);
			cout<<"-INFO OF A TRAIN";     //O=4
			gotoxy(13,12);
			cout<<"-PLAN A JOURNEY OF A TRAIN"; //O=5
			gotoxy(13,14);
			cout<<"-EXIT";     //O=6
			if(o==1)
				gotoxy(12,8);
			else if(o==2)
				gotoxy(12,9);
			else if(o==3)
				gotoxy(12,10);
			else if(o==4)
				gotoxy(12,11);
			else if(o==5)
				gotoxy(12,12);
			else if(o==6)
				gotoxy(12,14);
			cout<<"->";
			int b=getch();
			if(b==13)
			{       if(o==6)
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
				else if(o==3)
				{	train ob;
					ob.create_ob();
					ofstream f("infot.dat",ios::binary|ios::app);
					f.write((char *)&ob,sizeof(ob));
					f.close();
				}
				else if(o==4 || o==5)
				{	train ob;
					int a=entr(ob,id);
					if(a)
					{       if(o==4)
							ob.show();
						else if(o==5)
						{       if(ob.ret_c()==0)
								plan_j(ob,id);
							else if(ob.ret_c()==1)
							{       for(int s=1;;)
								{       o4;
									gotoxy(14,7);
									cout<<"JOURNEY ALREADY PLANNED!!";
									gotoxy(14,9);
									cout<<"-PLAN THE JOURNEY AGAIN";  //s=1
									gotoxy(14,10);
									cout<<"-RETURN TO PREVIOS MENU";   //s=2
									if(s==1)
										gotoxy(13,9);
									else if(s==2)
										gotoxy(13,10);
									cout<<"->";
									int g=getch();
									if(g==13)
										break;
									else if(g==0)
									{	g=getch();
										if(g==80 && s==1)
											s=2;
										else if(g==72 && s==2)
											s=1;
									}
								}
								if(s==1)
									plan_j(ob,id);
							}
						}
					}
					else
					{	gotoxy(14,8);
						cout<<"ERROR!! INVALID ID!";
						getch();
					}
				}
			}
			else if(b==0)
			{	b=getch();
				if(b==80 && o<6)
					o++;
				else if(b==72 && o>1)
					o--;
			}
		}
	}
}
void main()                  //idst.dat,idtr.dat,infost.dat,infot.dat
{ /*  	remove("idst.dat");
	remove("idtr.dat");
	remove("infost.dat");
	remove("infot.dat");   */
	e_login();
}
int entr(train &ob,int id)   // id is of passenger not of train as required for o3
{	ifstream f("infot.dat",ios::binary);
	int a;
	clrscr();
	o3;
	gotoxy(14,7);
	cout<<"ENTER THE TRAIN ID:";
	cin>>a;
	while(f.read((char *)&ob,sizeof(ob)))
	if(ob.ret_id()==a)
		return 1;
	return 0;
}
void plan_j(train ob,int id)
{      	o4;
	gotoxy(14,7);
	cout<<"ENTER THE NO. OF STATIONS THROUGH WHICH THIS TRAIN PASSES :";
	int a;
	cin>>a;
	if(a>1 && a<=10)
	{       int i=0,b[10];
		do
		{	o4;
			int ci=0;
			for(;ci<i;ci++)
			{	gotoxy(14,7+ci);
				cout<<ci+1<<") STATION NO."<<b[ci];
			}
			gotoxy(14,7+ci);
			cout<<"ENTER THE STAION NO.THROUGH WHICH THE TRAIN PASSES";
			gotoxy(14,10+ci);
			cout<<"ENTER THE STATION NO.:";
			int d,flag=0;
			cin>>d;
			ifstream f("idst.dat",ios::binary);
			idc o1;
			while(f.read((char *)&o1,sizeof(o1)))
				if(o1.ret_id()==d)
				{	b[i++]=d;
					flag=1;
					break;
				}
			f.close();
			if(flag==0)
			{	gotoxy(14,9+ci);
				cout<<"ERROR INVALID STATION ID!!";
				getch();
			}
		}while(i!=a);
		ob.journey(a,b);
		ifstream f1("infot.dat",ios::binary);
		train temp;
		while(f1.read((char *)&temp,sizeof(temp)))
			if(temp.ret_id()==ob.ret_id())
			{	ofstream f2("infot.dat",ios::binary|ios::ate);
				f2.seekp(f1.tellg()-sizeof(ob),ios::beg);
				f2.write((char *)&ob,sizeof(ob));
				f2.close();
				break;
			}
		f1.close();
		clrscr();
		o4;
		gotoxy(14,7);
		cout<<"JOURNEY SUSSESSFULLY PLANED!!";
		getch();
		ob.show();
	}
	else
	{       gotoxy(14,9);
		cout<<"ERROR!! CANNOT ADD "<<a<<" TRAINS";
		getch();
	}
}

