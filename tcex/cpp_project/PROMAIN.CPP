#include<fstream.h>
#include<conio.h>
#include<string.h>
#include<stdio.h>
#include<stdlib.h>
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
class idc                              //FILES USED -infoc,infoe,id,ide
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
			{	pas ob;
				ob.create_ob();
				ofstream f("infoc.dat",ios::binary|ios::app);
				f.write((char *)&ob,sizeof(ob));
				f.close();
			}
			else if(op==5)
			{	emp ob;
				ob.create_ob();
				ofstream f("infoe.dat",ios::binary|ios::app);
				f.write((char *)&ob,sizeof(ob));
				f.close();
			}
			else if(op==7)
				reserved();
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
		cout<<"->";
		int a=getch();
		if(a==0)
		{	a=getch();
			if(a==80 && op!=4 && op!=7)
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
