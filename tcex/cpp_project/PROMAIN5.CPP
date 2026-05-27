/*				PARAS MEHAN
				XII-A
				MIRA MODEL SCHOOL			*/
#include<fstream.h>
#include<conio.h>
#include<string.h>
#include<stdio.h>
#include<stdlib.h>
#include<iomanip.h>
#include<ctype.h>
#define o1 gotoxy(31,5);  \
	cout<<"I.R.C.T.C"; \
	gotoxy(25,6);       \
	cout<<"(INDIAN RAILWAY CATERING "; \
	gotoxy(22,7);                       \
	cout<<"AND TOURISM CORPORATION LIMITED)";
#define o2 gotoxy(32,5);   \
	cout<<"I.R.C.T.C.";
#define o3 	o2;          \
		gotoxy(31,7); \
		cout<<"RESERVED ZONE";
#define o3b gotoxy(28,3);       \
	cout<<"I.R.C.T.C.";\
	gotoxy(43,4); \
	cout<<"ID :"<<id;
#define o4 clrscr();   \
	o3b;             \
	gotoxy(27,5);    \
	cout<<"TRAIN NO."<<ob.ret_id();
#define o3c 	clrscr();  \
		gotoxy(32,2); \
		cout<<"I.R.C.T.C.";  \
		gotoxy(15,4); \
		cout<<"BILL DESK";\
		gotoxy(38,4);  \
		cout<<"PASSENGERS :"<<r;


class idc                              //FILES USED -infoc.dat,infoe.dat,id.dat,ide.dat,idst.dat,idtr.dat,infost.dat,infot.dat,idt.dat,infotic.dat
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
class station
{	private:
		int id,n,tr[10];
		char stname[50];
	public:
		int ret_id()
		{	return id;
		}
		void create_ob();
		void show();
		void ret_info(int &a,char b[50])
		{	a=id;
			strcpy(b,stname);
		}
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
	getch();
}

class train
{	private:
		int id,stno[10],c,n,cap,oc; //oc-occupied
		char tname[50];
	public:
		train()
		{	c=0;
			oc=0;
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
		void ret_st(int &a,int &b)
		{	a=stno[0];
			b=stno[n-1];
		}
		void ret_info(int &a,char b[50])
		{	a=id;
			strcpy(b,tname);
		}
		int ret_av()
		{	return cap-oc;
		}
		int ret_n()
		{	return n;
		}
		void dec(int a)
		{	oc+=a;
		}
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
	gotoxy(13,8);
	cout<<"-ENTER THE CAPACITY :";
	cin>>cap;
	show();
}
void train::show()
{	clrscr();
	o2;
	gotoxy(13,7);
	cout<<"-TRAIN NAME :"<<tname;
	gotoxy(13,8);
	cout<<"-TRAIN ID :"<<id;
	gotoxy(13,9);
	cout<<"-CAPACITY :"<<cap;
	gotoxy(13,10);
	cout<<"-SEATS AVAILABE :"<<cap-oc;
	if(c==1)
	{	gotoxy(13,11);
		cout<<"-THE NO. OF THROUGH WHICH THE TRAIN PASSES :"<<n;
		gotoxy(13,12);
		cout<<"-THE STATIONS ARE :";
		gotoxy(25,13);
		cout<<"-STARTING FROM ";
		gotoxy(25,12+n);
		cout<<"-LAST STATION";
		for(int i=0;i<n;i++)
		{	gotoxy(14,13+i);
			cout<<i+1<<") "<<stno[i];
		}
	}
	getch();
}
class pass
{	private:
		int id,pnr[50],n,age;
		char name[50],hoad[50];//home address
	public:
		void create_ob();
		void show();
		int ret_id()
		{	return id;
		}
		void addpnr(int a)
		{	pnr[n]=a;
			n++;
		}
		void ret_info(int &a,int b[50]);
		void ret_inf(int &a,char b[50])
		{	a=id;
			strcpy(b,name);
		}
};
void pass::create_ob()
{	clrscr();
	o2;
	gotoxy(14,7);
	cout<<"ENTER THE FOLLOWING DETAILS -";
	gotoxy(13,9);
	cout<<"-NAME :";
	gets(name);
	gotoxy(13,10);
	cout<<"-HOME ADDRESS :";
	gets(hoad);
	gotoxy(13,11);
	cout<<"-AGE :";
	cin>>age;
	int flag;
	do
	{       flag=0;
		randomize();
		id=random(100);
		ifstream f("id.dat",ios::binary);
		idc ob;
		while(f.read((char *)&ob,sizeof(ob)))
		{	if(ob.ret_id()==id)
			{	flag=1;
				break;
			}
		}
		f.close();
	}while(flag==1 || id==0);
	ofstream f("id.dat",ios::binary|ios::app);
	idc ob(id);
	f.write((char *)&ob,sizeof(ob));
	f.close();
	n=0;
	show();
}
void pass::show()
{	clrscr();
	o2;
	gotoxy(14,7);
	cout<<"DETAILS ARE-";
	gotoxy(13,9);
	cout<<"-NAME :"<<name;
	gotoxy(13,10);
	cout<<"-HOME ADDRESS :"<<hoad;
	gotoxy(13,11);
	cout<<"-AGE :"<<age;
	gotoxy(13,12);
	cout<<"-ID :"<<id;
	if(n>0)
	{       gotoxy(13,13);
		cout<<"-TICKETS BOOKED:";
		gotoxy(14,14);
		cout<<"PNR NO.";
		for(int i=0;i<n;i++)
		{	gotoxy(11,15+i);
			cout<<setw(2)<<setiosflags(ios::left)<<i+1<<")"<<pnr[i];
		}
	}
	getch();
}
void pass::ret_info(int &a,int b[50])
{	a=n;
	for(int i=0;i<n;i++)
		b[i]=pnr[i];
}
struct pinfo
{	char name[50],g;   //g-gender
	int age;
};
class tic
{	private:
		pinfo pa[10];     //passengers
		int trid,pnr,n,f,bprice,tprice; // n - no of passengers
		char tname[50];
	public:
		tic()
		{	f=-1;
		}
		void create_ob(int a,int b);
		int entry(pinfo a)
		{       if(f<n-1)
			{	f++;
				pa[f]=a;
				return 1;
			}
			return 0;
		}
		void price(int a)
		{       bprice=a;
			tprice=(bprice/100)*118*n;     //18 % GST
		}
		void show();
		int ret_pnr()
		{	return pnr;
		}
};
void tic::create_ob(int a,int b)
{       trid=a;
	n=b;
	int flag;
	do
	{       flag=0;
		randomize();
		pnr=random(100);
		ifstream f("idt.dat",ios::binary);
		idc ob;
		while(f.read((char *)&ob,sizeof(ob)))
		{	if(ob.ret_id()==pnr)
			{	flag=1;
				break;
			}
		}
		f.close();
	}while(flag==1 || pnr==0);
	ofstream f("idt.dat",ios::binary|ios::app);
	idc ob(pnr);
	f.write((char *)&ob,sizeof(ob));
	f.close();
	ifstream f1("infot.dat",ios::binary);
	train ob2;
	while(f1.read((char *)&ob2,sizeof(ob2)))
	{	int a;
		ob2.ret_info(a,tname);
		if(a==trid)
			break;
	}
	f1.close();
}
void tic::show()
{	clrscr();
	o2;
	gotoxy(14,7);
	cout<<"TICKET DETAILS ARE -";
	gotoxy(14,9);
	cout<<"PNR NO. :"<<pnr;
	gotoxy(45,9);
	cout<<"TRAIN NAME :"<<tname;
	gotoxy(14,10);
	cout<<"BASE PRICE :"<<bprice;
	gotoxy(45,10);
	cout<<"TAX :GST 18%";
	gotoxy(14,11);
	cout<<"TOTAL PRICE (inc. of taxes):"<<tprice;
	gotoxy(14,12);
	cout<<"PASSENGERS INFO :";
	gotoxy(45,12);
	cout<<"PASSENGERS :"<<n;
	gotoxy(14,13);
	cout<<"NAME";
	gotoxy(30,13);
	cout<<"AGE";
	gotoxy(34,13);
	cout<<"GENDER";
	for(int i=0;i<n;i++)
	{	gotoxy(12,14+i);
		cout<<setw(2)<<setiosflags(ios::right)<<i+1<<")"<<pa[i].name;
		gotoxy(30,14+i);
		cout<<pa[i].age;
		gotoxy(34,14+i);
		cout<<pa[i].g;
	}
	getch();
}
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

void password(char p[50]);
void login(int &op);
void mainmenu(int &op);
void reserved();
int emp_login();
int entr(train &ob,int id);
void plan_j(train ob,int id);
void e_login();
void p_main();
int booktic(int id);

void main()
{       int op=0;
	login(op);
	if(op==1)
	{	for(;;)
		{	clrscr();
			mainmenu(op);
			if(op==4)
				break;
			else if(op==1)
			{	pass ob;
				ob.create_ob();
				ofstream f("infoc.dat",ios::binary|ios::app);
				f.write((char *)&ob,sizeof(ob));
				f.close();
			}
			else if(op==2)
				p_main();
			else if(op==3)
			{	tic ob;
				clrscr();
				o2;
				gotoxy(14,7);
				int a,flag=0;
				cout<<"ENTER THE PNR NO. :";
				cin>>a;
				ifstream f("infotic.dat",ios::binary);
				while(f.read((char *)&ob,sizeof(ob)))
					if(ob.ret_pnr()==a)
					{	flag=1;
						break;
					}
				if(flag==1)
					ob.show();
				else if(flag==0)
				{	gotoxy(14,9);
					cout<<"ERROR!! INVALID PNR";
					getch();
				}
			}
			else if(op==5)
			{	emp ob;
				ob.create_ob();
				ofstream f("infoe.dat",ios::binary|ios::app);
				f.write((char *)&ob,sizeof(ob));
				f.close();
				e_login();
			}
			else if(op==6)
				e_login();
			else if(op==7)
				reserved();
			else if(op==8)
			{	clrscr();
				o2;
				gotoxy(14,7);
				cout<<"-THIS SOFTWARE LETS YOU CREATE PASSENGER ACCOUNT,";
				gotoxy(15,8);
				cout<<"EMPLOYEE ACCOUNT,NEW STATION,NEW TRAIN ";
				gotoxy(15,9);
				cout<<"AND BOOK TICKETS!!";
				gotoxy(14,10);
				cout<<"-YOU CAN CREATE A NEW TRAIN,STATION FROM";
				gotoxy(15,11);
				cout<<"EMPLOYEE LOGIN BY ENTERING A FEW BASIC INFORMATION";
				gotoxy(14,12);
				cout<<"-YOU CAN CREATE AN EMPLOYEE ID FROM RESERVED MENU";
				gotoxy(15,13);
				cout<<"ONCE CREATED YOU HAVE TO SIGNUP USING THIS ID";
				gotoxy(15,14);
				cout<<"BY SELECTING \"CREATE A NEW ACCOUNT \"FROM THE MAIN MENU";
				gotoxy(14,15);
				cout<<"-TICKET INFORMATION CAN BE DIRECTLY CHECKED FROM MAIN MENU";
				getch();
			}
		}
	}
	getch();
}
void login(int &op)
{       clrscr();
	o1;
	gotoxy(17,11);
	cout<<"ENTER PASSWORD TO CONTINUE -";
	gotoxy(17,13);
	cout<<"ENTER THE PASSWORD :";
	char p[50];
	password(p);
	if(strcmpi(p,"paras")==0)
	{       op=1;
		gotoxy(17,14);
		cout<<"PASSWORD CORRECT !!";
		gotoxy(17,15);
		cout<<"LOGIN SUCCESSFULL !!";
		gotoxy(17,16);
		cout<<"(press any key to continue)";
		getch();
	}
	else
	{	gotoxy(17,14);
		cout<<"BETTER LUCK NEXT TIME !!";
		gotoxy(17,15);
		cout<<"(press any key to continue)";
	}
}
void mainmenu(int &op)
{	for(;;)
	{	clrscr();
		o2;
		gotoxy(15,6);
		cout<<"-------------------MENU----------------------";
		gotoxy(14,8);
		cout<<"- PASSENGER ZONE -";
		gotoxy(14,10);
		cout<<"-CREATE AN ACCOUNT";   //op=1
		gotoxy(14,11);
		cout<<"-LOGIN";//op=2
		gotoxy(14,12);
		cout<<"-CHECK PNR STATUS"; //op=3
		gotoxy(14,15);
		cout<<"-EXIT THE PROGRAM"; //op=4
		gotoxy(45,8);
		cout<<"- EMPLOYEE ZONE -";
		gotoxy(45,10);
		cout<<"-CREATE AN ACCOUNT";   //op=5
		gotoxy(45,11);
		cout<<"-LOGIN";   //op=6
		gotoxy(45,15);
		cout<<"-RESERVED ZONE";     //op=7
		gotoxy(45,16);
		cout<<"-GENERAL INSTRUCTIONS";	//OP=8
		if(op==1)
			gotoxy(13,10);
		else if(op==2)
			gotoxy(13,11);
		else if(op==3)
			gotoxy(13,12);
		else if(op==4)
			gotoxy(13,15);
		else if(op==5)                  //77->      75<-
			gotoxy(44,10);
		else if(op==6)
			gotoxy(44,11);
		else if(op==7)
			gotoxy(44,15);
		else if(op==8)
			gotoxy(44,16);
		cout<<"->";
		int a=getch();
		if(a==0)
		{	a=getch();
			if(a==80 && op!=4 && op!=8)
				op++;
			else if(a==72 && op!=1 && op!=5)
				op--;
			else if(a==77 && (op==1 || op==2))
				op+=4;
			else if(a==77 && op==4)
				op=7;
			else if(a==75 && (op==5 || op==6))
				op-=4;
			else if(a==75 && op==7)
				op=4;
		}
		else if(a==13)
			break;
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
		for(int o=1;;)
		{	clrscr();
			o3;
			gotoxy(15,9);
			cout<<"-MAKE AN EMP'S ID";     //O=1
			gotoxy(15,10);
			cout<<"-VIEW EXISTING STATIONS";    //O=2
			gotoxy(15,11);
			cout<<"-VIEW EXISTING TRAIN";      //O=3
			gotoxy(15,12);
			cout<<"-VIEW EXISTING PASSENGERS";     //O=4
			gotoxy(15,13);
			cout<<"-EXIT";     //O=5
			if(o==1)
				gotoxy(14,9);
			else if(o==2)
				gotoxy(14,10);
			else if(o==3)
				gotoxy(14,11);
			else if(o==4)
				gotoxy(14,12);
			else if(o==5)
				gotoxy(14,13);
			cout<<"->";
			int a=getch();
			if(a==13)
			{	if(o==1)
				{	int a,flag;
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
				else if(o==2)
				{       clrscr();
					o2;
					station g;
					ifstream f("infost.dat",ios::binary);
					int i=0;
					while(f.read((char *)&g,sizeof(g)))
					{       int a;
						char b[50];
						g.ret_info(a,b);
						i++;
						gotoxy(14,6+i);
						cout<<i<<") NAME :"<<b<<" ID :"<<a;
					}
					if(i==0)
					{	gotoxy(14,7);
						cout<<"NO STATION FOUND!!";
					}
					getch();
					f.close();
				}

				else if(o==3)
				{       clrscr();
					o2;
					train g;
					ifstream f("infot.dat",ios::binary);
					int i=0;
					while(f.read((char *)&g,sizeof(g)))
					{       int a;
						char b[50];
						g.ret_info(a,b);
						i++;
						gotoxy(14,6+i);
						cout<<i<<") NAME :"<<b<<" ID :"<<a;
					}
					if(i==0)
					{	gotoxy(14,7);
						cout<<"NO TRAINS FOUND!!";
					}
					getch();
					f.close();
				}
				else if(o==4)
				{       clrscr();
					o2;
					pass g;
					ifstream f("infoc.dat",ios::binary);
					int i=0;
					while(f.read((char *)&g,sizeof(g)))
					{       int a;
						char b[50];
						g.ret_inf(a,b);
						i++;
						gotoxy(14,6+i);
						cout<<i<<") NAME :"<<b<<" ID :"<<a;
					}
					if(i==0)
					{	gotoxy(14,7);
						cout<<"NO PASSENGERS FOUND!!";
					}
					getch();
					f.close();
				}
				else if(o==5)
					break;
			}
			else if(a==0)
			{	a=getch();
				if(a==80 && o<5)
					o++;
				else if(a==72 && o>1)
					o--;
			}
		}
}
int entr(train &ob,int id)   // id is of passenger not of train as required for o3
{	ifstream f("infot.dat",ios::binary);
	int a;
	clrscr();
	o3b;
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
			idc p;
			while(f.read((char *)&p,sizeof(p)))
				if(p.ret_id()==d)
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
int emp_login()
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
{	int id=emp_login();
	if(id!=0)
	{       for(int o=1;;)
		{	clrscr();
			o3b;
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
					o3b;
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
void p_main()
{       int id,flag=0;
	clrscr();
	o2;
	gotoxy(13,8);
	cout<<"-ENTER ID :";
	cin>>id;
	ifstream f("id.dat",ios::binary);
	idc o;
	while(f.read((char *)&o,sizeof(o)))
		if(o.ret_id()==id)
		{       flag=1;
			break;
		}
	if(flag==0)
	{	gotoxy(14,10);
		cout<<"ERROR INCORRECT ID!!";
		getch();
	}
	else
	{       pass ob1;
		ifstream f1("infoc.dat",ios::binary);
		while(f1.read((char *)&ob1,sizeof(ob1)))
			if(ob1.ret_id()==id)
				break;
		for(int o=1;;)
		{	clrscr();
			o3b;
			gotoxy(13,6);
			cout<<"-PASSENGER ZONE ";
			gotoxy(13,8);
			cout<<"-BOOK A TICKET";  //O=1
			gotoxy(13,9);
			cout<<"-VIEW PNR OF BOOKED TICKETS";     //O=2
			gotoxy(13,11);
			cout<<"-EXIT";     //O=3
			if(o==1)
				gotoxy(12,8);
			else if(o==2)
				gotoxy(12,9);
			else if(o==3)
				gotoxy(12,11);
			cout<<"->";
			int b=getch();
			if(b==13)
			{       if(o==1)
				{	int a=booktic(id);
					if(a)
					{	ob1.addpnr(a);
						ofstream f2("infoc.dat",ios::ate);
						f2.seekp(f1.tellg()-sizeof(ob1),ios::beg);
						f2.write((char *)&ob1,sizeof(ob1));
						f2.close();
					}
				}
				else if(o==2)
				{       clrscr();
					o3b;
					int d=0,pnr[50];
					ob1.ret_info(d,pnr);
					if(d>0)
					{	gotoxy(14,7);
						cout<<"BOOKED TICKETS ARE :";
						for(int i=0;i<d;i++)
						{	gotoxy(12,9+i);
							cout<<setw(2)<<setiosflags(ios::right)<<i+1<<")"<<pnr[i];
						}
					}
					else
					{	gotoxy(14,7);
						cout<<"ERROR!! NO BOOKED TICKETS FOUND!!";
					}
					getch();
				}
				else if(o==3)
					break;
			}
			else if(b==0)
			{	b=getch();
				if(b==80 && o<3)
					o++;
				else if(b==72 && o>1)
					o--;
			}
		}
	}
}
int select_st(int &st)
{	ifstream f("infost.dat",ios::binary);
	int i=0;
	station ob;
	while(f.read((char *)&ob,sizeof(ob)))
	{	i++;
		int a;
		char b[50];
		ob.ret_info(a,b);
		gotoxy(13,10+i);
		cout<<"-"<<b;
	}
	f.close();
	if(i==0)
		return 0;
	for(;;)
	{	gotoxy(12,10+st);
		cout<<"->";
		int a=getch();
		if(a==13)
		{       gotoxy(12,10+st);
			cout<<" ";
			return 1;
		}
		else if(a==0)
		{	a=getch();
			gotoxy(12,10+st);
			cout<<" -";
			if(a==80 && st<i)
				st++;
			else if(a==72 && st>1)
				st--;
		}
	}
}
int booktic(int id)
{	clrscr();
	int st1=1;
	o3b;
	gotoxy(25,7);
	cout<<"TICKET BOOKING";
	gotoxy(14,9);
	cout<<"FROM STATION -";
	if(select_st(st1))
	{	int id1,id2,st2=1,t=0,ti[50],i=1;
		char st1name[50],st2name[50];
		station ob;
		ifstream f("infost.dat",ios::binary);
		f.seekg((st1-1)*sizeof(ob),ios::beg);
		f.read((char *)&ob,sizeof(ob));
		ob.ret_info(id1,st1name);
		gotoxy(40,9);
		cout<<"FROM STATION :"<<st1name;
		gotoxy(14,9);
		cout<<"TO STATION :  ";
		select_st(st2);
		f.seekg((st2-1)*sizeof(ob),ios::beg);
		f.read((char *)&ob,sizeof(ob));
		ob.ret_info(id2,st2name);
		clrscr();
		o3b;
		gotoxy(25,7);
		cout<<"TICKET BOOKING";
		gotoxy(14,9);
		cout<<"FROM STATION :"<<st1name;
		gotoxy(14,10);
		cout<<"TO STATION :"<<st2name;
		gotoxy(14,12);
		cout<<"TRAIN NAME";
		gotoxy(30,12);
		cout<<"BASE PRICE";
		gotoxy(41,12);
		cout<<"SEATS AVAILABLE";
		f.close();
		ifstream f1("infot.dat",ios::binary);
		train ob2;
		while(f1.read((char *)&ob2,sizeof(ob2)))
		{       int l1,l2;
			ob2.ret_st(l1,l2);
			if(l1==id1 && l2==id2 && ob2.ret_av()>0)
			{	t++;
				char a[50];
				ob2.ret_info(ti[t-1],a);
				gotoxy(13,12+t);
				cout<<"-"<<a;
				gotoxy(41,12+t);
				cout<<ob2.ret_av();
				gotoxy(30,12+t);
				cout<<100*ob2.ret_n();
			}
		}
		f1.close();
		if(t==0)
		{       clrscr();
			o3b;
			gotoxy(14,7);
			cout<<"SORRY NO TRAINS FOUND MATCHING YOUR REQUIRMENT.";
			getch();
		}
		else
		{	for(;;)
			{	gotoxy(12,12+i);
				cout<<"->";
				int a=getch();
				if(a==13)
					break;
				else if(a==0)
				{	a=getch();
					gotoxy(12,12+i);
					cout<<" -";
					if(a==80 && i<t)
						i++;
					else if(a==72 && i>1)
						i--;
				}
			}
			ifstream f2("infot.dat",ios::binary);
			while(f2.read((char *)&ob2,sizeof(ob2)))
				if(ob2.ret_id()==ti[i-1])
					break;
			clrscr();
			o3b;
			tic ob3;
			int r;
			do
			{	gotoxy(30,7);
				cout<<"BILL DESK";
				gotoxy(14,9);
				cout<<"ENTER THE NO. OF PASSENGERS :";
				cin>>r;
				if(r<=0 || r>ob2.ret_av() || r>10)
				{	gotoxy(14,11);
					cout<<"ERROR !! CANNOT ADD "<<r<<" PASSENGERS";
					getch();
					gotoxy(14,11);
					clreol();
					gotoxy(14,9);
					clreol();
				}
			}while(r<=0 || r>ob2.ret_av() || r>10);
			ob2.dec(r);
			ofstream f3("infot.dat",ios::binary);
			f3.seekp(f2.tellg()-sizeof(ob2),ios::beg);
			f3.write((char *)&ob2,sizeof(ob2));
			f2.close();
			f3.close();
			ob3.create_ob(ob2.ret_id(),r);
			o3c;
			for(int k=0,c=0;k<r;k++,c++)
			{       if(k==7)
				{       o3c;
					k=0;
					r-=7;
				}
				pinfo ob4;
				gotoxy(11,6+3*k);
				cout<<setw(2)<<setiosflags(ios::right)<<c+1<<")NAME :";
				gets(ob4.name);
				gotoxy(40,6+3*k);
				cout<<"AGE :";
				cin>>ob4.age;
					do
					{	gotoxy(14,7+3*k);
						cout<<"GENDER (M/F): ";
						cin>>ob4.g;
						if(ob4.g!='m' && ob4.g!='M' && ob4.g!='F' && ob4.g!='f')
						{       gotoxy(14,8+3*k);
							cout<<"ERROR! INVALID GENDER";
							getch();
							gotoxy(14,8+3*k);
							clreol();
							gotoxy(14,7+3*k);
							clreol();
						}
					}while(ob4.g!='m' && ob4.g!='M' && ob4.g!='F' && ob4.g!='f');
					ob4.g=toupper(ob4.g);
					ob3.entry(ob4);
				}
			ob3.price(100*ob2.ret_n());
			ob3.show();
			ofstream f3b("infotic.dat",ios::binary|ios::app);
			f3b.write((char *)&ob3,sizeof(ob3));
			f3b.close();
			clrscr();
			o3b;
			gotoxy(14,7);
			cout<<"TICKET BOOKED SUCCESSFULLY!!";
			getch();
			return ob3.ret_pnr();
		}
	}
	else
	{	clrscr();
		o3b;
		cout<<"ERROR!! NO STATION FOUND";
		getch();
	}
	return 0;
}