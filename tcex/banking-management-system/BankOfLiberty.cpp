#include<iostream.h>
#include<conio.h>
#include<string.h>
#include<process.h>
#include<stdlib.h>
#include<stdio.h>
#include<graphics.h>
#include<dos.h>
#include<fstream.h>

void graphics();		//contains graphics command & the fn is called when graphics is used
void menu_graphics();		//contains graphics command for menu
void first_page();		//this page is shown up as soon as user compiles the program
void security();		//as the name suggest this fn is for security check page
void save();
void display();
void m_page();			//MAIN PAGE i.e where all choice r present like delete a/c, add a/c, etc.
void welcome();			//sub page contains info about software
void display_name();		//display name of choices in main page
void remove(int&);		//removes graphics in main page when up & down arrow is pressed
void file(char *,char *);	//comparision of username & password takes place
void thankyou();		//Last page with little animation
void recordno();		//return position of pointor for modifying details

char a1[]="LIST ACCOUNTS",a2[]="ADD ACCOUNT",a3[]="SEE DETAILS",a4[]="EDIT ACCOUNT",a5[]="TRANSACTION",a6[]="CHANGE PASSWORD",a7[]="HELP",a8[]="QUIT";
int count=1;
int z=130;

/****************************************************************************
*************************** VOID MAIN ***************************************
****************************************************************************/
void main()
{   first_page();	}

/****************************************************************************
**************************** GRAPHICS function ******************************
****************************************************************************/
void graphics()
{   int gdriver = DETECT,gmode,errorcode;
	initgraph(&gdriver,&gmode,"C://TC//bgi");

	errorcode = graphresult();
	if (errorcode != grOk)
	{
	   cout<<"\nGraphics error: "<<grapherrormsg(errorcode);
	   gotoxy(5,5);
	   textcolor(GREEN+BLINK);
	   cprintf("*** CHECK BGI PATH ***" );
	   getch();
	   exit(1);
	}
}

/****************************************************************************
**************************** MENU GRAPHICS **********************************
****************************************************************************/
void menu_graphics()
{	setcolor(GREEN);
	settextstyle(0,0,1);
	setfillstyle(1,0);
	floodfill(300,300,LIGHTGREEN);
	line(146,120,getmaxx()-6,120);
	line(146,getmaxy()-35,getmaxx()-6,getmaxy()-35);
	rectangle(150,90,getmaxx()-10,115);
	setfillstyle(1,LIGHTGRAY);
	floodfill(160,100,GREEN);
	setcolor(0);
}


/****************************************************************************
****************************** FIRST PAGE ***********************************
****************************************************************************/
void first_page()
{   clrscr();
	int midx,midy;
	graphics();

	midx = getmaxx()/2;	midy = getmaxy()/2;
	setcolor(BLUE);
	ellipse(midx,midy,0,360,150,120);
	ellipse(midx,midy,0,360,160,130);
	setfillstyle(7,4);
	floodfill(midx-155,midy-122,1);

	settextstyle(4,0,4);
	setcolor(RED);
	outtextxy(midx-70,midy-70,"BANKING");
	outtextxy(midx-120,midy-20,"MANAGEMENT");
	outtextxy(midx-60,midy+30,"SYSTEM");

	for(int i=90;i<451;i++)
	{   sound(i);
		for(float p=150.5,q=120.5;p<160.0,q<130.0;p+=0.5,q+=0.5)
		{	ellipse(midx,midy,90,i,p,q);
			delay(1);
		}
	}
	nosound();
	setcolor(15);
	settextstyle(3,0,3);
	outtextxy(midx-90,midy+160,"LOADING COMPLETE");
	delay(500);

	closegraph();
	security();
}

/****************************************************************************
*********************** CLASS ACCOUNTS **************************************
****************************************************************************/
class accounts
{   char name[30],address[50],c_no[15];
	unsigned long ac_no,balance;

	public:
	int d,d1,m,m1,y,y1,hr,min;
	unsigned int dw;
	char *getname()
	{	return name;	}

	char *getaddress()
	{	return address;	}

	unsigned long getbalance()
	{	return balance;	}

	char *getc_no()
	{	return c_no;	}

	unsigned long getac_no()
	{	return ac_no;	}

	accounts()
	{	ac_no=0;
	}

	void ac_no_increment(unsigned long i)
	{	ac_no=i;
	}
	int ac_no_last();

	int input();
	void output(int);
	void see_details();
	void modify();
	void remove_accounts();
	void edit_accounts();
	void transaction();
	void change_password();
	void help();
	void quit();
};

/****************************************************************************
************************ SECURITY CLASS SECURE ******************************
****************************************************************************/
class secure
{ 	char name[20],pass[25];
	public:
	char *getname()
	{	return name;
	}
	char *getpass()
	{	return pass;
	}
	void input();
	void output()
	{	gotoxy(34,10);	cout<<name;
		gotoxy(34,14);	cout<<pass;
	}
};

void secure::input()
{   int p=0,u=0;
	n:
	gotoxy(40,15);
	while((name[u]=getch())!=13)
	{	if(u<0)
			u=0;
		if(name[u]==8)
		{	if(u==0)
				continue;
			cout<<'\b';
			cout<<' ';
			cout<<'\b';
			u--;
			continue;
		}
		if(name[u]==9)
			break;
		cout<<name[u];
		u++;
	}
	name[u]='\0';


	if(name[0]=='\0')
	{   gotoxy(1,1);
		cout<<"USERNAME CANNOT BE BLANK";
		goto n;
	}
	gotoxy(40,18);
	while((pass[p]=getch())!=13)
	{	if(p<0)
			p=0;
		if(pass[p]==8)
		{	if(p==0)
				continue;
			cout<<'\b';
			cout<<' ';
			cout<<'\b';
			p--;
			continue;
		}
		cout<<"*";
		p++;
	}
	pass[p]='\0';
}

/****************************************************************************
************************* SECURITY function *********************************
****************************************************************************/
void security()
{	int c=3;
	s:
	if(c==0)
	{   cleardevice();
		cout<<"\n\n\t   !!! SECURITY BREACH !!!";
		cout<<"\n\n\tCONTACT ADMIN(Ghostman) IMMEDIATELY";
		cout<<"\n\tEMAIL ID : mavihs08@gmail.com";
		getch();
		cleardevice();
		exit(0);
	}

	graphics();
	int midx=getmaxx()/2,midy=getmaxy()/2;
	char name[30],pass[30];

	setcolor(BLUE);
	setfillstyle(7,2);

	rectangle(midx-170,midy-120,midx+170,midy+120);
	floodfill(130,110,1);
	rectangle(midx-170,midy-120,midx+170,midy-70);

	accounts s;
	secure ss;
	ifstream fin("Security.bin",ios::in | ios::binary);
	if(fin==NULL)
		s.change_password();

	settextstyle(1,0,3);
	outtextxy(midx-95,midy-110,"SECURITY CHECK");
	settextstyle(2,0,8);
	outtextxy(170,215,"USERNAME:");    rectangle(305,215,460,245);
	outtextxy(170,263,"PASSWORD:");    rectangle(305,263,460,293);
	ss.input();
	strcpy(name,ss.getname());
	strcpy(pass,ss.getpass());
		file(name,pass);
	setfillstyle(7,4);
	floodfill(130,110,1);
	gotoxy(24,21);	cout<<"!!! INVALID USERNAME OR PASSWORD !!!";
	c--;
	gotoxy(35,25);  cout<<c<<" ATTEMPTS LEFT";
	gotoxy(1,1);	cout<<"PRESS ANY KEY TO CONTINUE";
	getch();
	goto s;

}
/****************************************************************************
************************ WELCOME function ***********************************
****************************************************************************/
void welcome()
{   setfillstyle(2,0);
	floodfill(330,300,LIGHTGREEN);
	settextstyle(1,0,2);
	setcolor(5);
	outtextxy(295,100,"!!! WELCOME !!!");
	settextstyle(3,0,1);
	outtextxy(155,135,"The Bank of Liberty was established in XXXX,");
	outtextxy(155,155,"by S & S company, owner of S & S SECURITIES.");
	outtextxy(155,175,"The Bank has 200+ branches all over the World.");
	outtextxy(155,195,"Bank gives maximum intrest as comprare to");
	outtextxy(155,215,"other banks. ");
	outtextxy(155,235,"           OWNER : Ghostman");
	outtextxy(155,265,"");
}

/****************************************************************************
************************** DISPLAY NAME function ****************************
****************************************************************************/
void display_name(int ch)
{   settextstyle(0,0,1);
	setcolor(15);
	outtextxy(11,115,a1);
	outtextxy(11,160,a2);
	outtextxy(11,205,a3);
	outtextxy(11,250,a4);
	outtextxy(11,295,a5);
	outtextxy(11,348,a6);
	outtextxy(11,388,a7);
	outtextxy(11,430,a8);
	switch(ch)
	{	case 1:setcolor(1);
				outtextxy(11,115,a1);
				break;
		case 2:setcolor(1);
				outtextxy(11,160,a2);
				break;
		case 3:setcolor(1);
				outtextxy(11,205,a3);
				break;
		case 4:setcolor(1);
				outtextxy(11,250,a4);
				break;
		case 5:setcolor(1);
				outtextxy(11,295,a5);
				break;
		case 6:setcolor(1);
				outtextxy(11,348,a6);
				break;
		case 7:setcolor(1);
				outtextxy(11,388,a7);
				break;
		case 8:setcolor(1);
				outtextxy(11,430,a8);
				break;

	}
}

/***************************************************************************/

int accounts::ac_no_last()
{   ifstream fin("BANK.bin",ios::in | ios::binary);
	int count=0 ;
	while (fin.read((char *) this, sizeof(accounts)))
		 count = ac_no ;
	fin.close() ;
	return count ;
}


int accounts::input()
{   char  b[10];
	int i=0;
	gotoxy(22,10);	cout<<"ENTER NAME: ";	gets(name);
	if(name[0]=='\0')
	{	gotoxy(22,16);	cout<<"! NAME CANNOT BE BLANK !";
		return 1;
	}
	gotoxy(22,13);	cout<<"ENTER ADDRESS: ";	gets(address);
	gotoxy(22,16);	cout<<"ENTER CONTACT NUMBER: ";	gets(c_no);
	gotoxy(22,19);	cout<<"ENTER INTIAL BALANCE(>=500): ";
	while((b[i]=getch())!=13)
	{	if(i<0)
			i=0;
		if(b[i]==8)
		{	if(i==0)
				continue;
			cout<<'\b';
			cout<<' ';
			cout<<'\b';
			i--;
			continue;
		}
		if(b[i]==9)
			break;
		cout<<b[i];
		i++;
	}
	b[i]='\0';

	balance=atoi(b);
	if(balance==0)
	{  	gotoxy(25,22);
		cout<<"!!! INVALID INPUT !!!";
		return 1;
	}
	cin>>balance;
	if(balance<500)
	{	gotoxy(25,22);
		cout<<"SHOULD NOT LESS THAN 500";
		return 1;
	}
	dw=balance;
	return 0;
}

void accounts::output(int i)
{	gotoxy(25,i);   cout<<ac_no;
	gotoxy(39,i);	puts(name);
	gotoxy(66,i);	cout<<balance;
}

int recordno(int acno)
{	fstream f;
	accounts n;
	f.open("BANK.bin", ios::in | ios::binary);
	f.seekg(0,ios::beg);
	int count=0;
	while (f.read((char*)&n,sizeof(accounts)))
	{	count++;
		if (acno == n.getac_no())
		  break;
	}
	f.close();
	return count;
}

/***************************  SEE DETAILS ***********************************/

void accounts::see_details()
{   menu_graphics();
	outtextxy(190,100,"*** SEE DETAILS OF ACCOUNTS ***");

	accounts d;

	fstream fin("BANK.bin",ios::in | ios::binary);
	if(fin==NULL)
	{	cout<<"!!! FIRST ADD ACCOUNTS !!!";
		getch();
		return;
	}

	int ac_s,flag=0,i=0;
	char ac_i[4];

	setcolor(2);
	settextstyle(3,0,1);
	gotoxy(22,15);
	cout<<"Enter the accounts number: ";
	while((ac_i[i]=getch())!=13)
	{	if(i<0)
			i=0;
		if(ac_i[i]==8)
		{	if(i==0)
				continue;
			cout<<'\b';
			cout<<' ';
			cout<<'\b';
			i--;
			continue;
		}
		if(ac_i[i]==9)
			break;
		cout<<ac_i[i];
		i++;
	}
	ac_i[i]='\0';

	ac_s=atoi(ac_i);
	if(ac_s==0)
	{	setcolor(4);
		settextstyle(0,0,1);
		outtextxy(155,getmaxy()-23,"!!! INVALID INPUT !!!");
		delay(1000);
		return;
	}
	menu_graphics();
	outtextxy(190,100,"*** SEE DETAILS OF ACCOUNTS ***");

	while(fin.read((char*)&d,sizeof(d)))
	{  	if(d.getac_no()==ac_s)
		{	flag=1;
			gotoxy(22,9);	cout<<"CREATED ON : "<<d.d<<"/"<<d.m<<"/"<<d.y;
			gotoxy(22,11);	cout<<"ACCOUNT NO.: #";	cout<<d.ac_no;
			gotoxy(22,13);	cout<<"NAME: "; 	puts(d.name);
			gotoxy(22,15);	cout<<"ADDRESS: ";	puts(d.address);
			gotoxy(22,17);	cout<<"CONTACT NO.: ";	puts(d.c_no);
			gotoxy(60,11);	cout<<"BALANCE :";	cout<<d.balance;
			gotoxy(22,19);	cout<<"             ----- LAST TRANSACTION -----";
			gotoxy(22,21);  cout<<"  DATE	      TIME        WITHDRAW / DEPOSITED";
			gotoxy(22,23);  cout<<d.d1<<"/"<<d.m1<<"/"<<d.y1;
			gotoxy(39,23);	cout<<d.hr<<":"<<d.min;
			gotoxy(59,23); 	cout<<d.dw;
		}
	}
	if(flag==0)
	{	gotoxy(22,14);
		cout<<"     !!! ACCOUNT NOT FOUND !!!            ";
	}

	fin.close();
	setcolor(4);
	settextstyle(0,0,1);
	outtextxy(155,getmaxy()-23,"Press any key to continue");
	getch();
}
/******************************** MODIFY ***********************************/

void accounts::modify()
{	menu_graphics();
	outtextxy(190,100,"*** MODIFY ACCOUNT ***");

	fstream f("BANK.bin",ios::in | ios::out | ios::binary);

	int flag=0,ac_s,i=0;
	char ch1,ac_i[3];

	setcolor(2);
	settextstyle(3,0,1);
	gotoxy(22,15);
	cout<<"Enter the accounts number: ";
	while((ac_i[i]=getch())!=13)
	{	if(i<0)
			i=0;
		if(ac_i[i]==8)
		{	if(i==0)
				continue;
			cout<<'\b';
			cout<<' ';
			cout<<'\b';
			i--;
			continue;
		}
		if(ac_i[i]==9)
			break;
		cout<<ac_i[i];
		i++;
	}
	ac_i[i]='\0';

	ac_s=atoi(ac_i);
	if(ac_s==0)
	{	setcolor(4);
		settextstyle(0,0,1);
		outtextxy(155,getmaxy()-23,"!!! INVALID INPUT !!!");
		delay(1000);
		return;
	}
	menu_graphics();
	outtextxy(190,100,"*** MODIFY ACCOUNT ***");

	accounts m;
	int location,tac_no;
	char n[20],a[25],cn[15];
	tac_no=recordno(ac_s);
	location =(tac_no-1)*sizeof(m);
	while(f.read((char*)&m,sizeof(m)))
	{  	if(m.getac_no()==ac_s)
		{	flag=1;
			setcolor(4);
			gotoxy(21,10);	cout<<"ACCOUNT NO.: #";	cout<<m.getac_no();
			gotoxy(21,11);	cout<<"Name: ";	puts(m.name);
			gotoxy(21,12);	cout<<"Address: ";	puts(m.address);
			gotoxy(21,13);	cout<<"Contact Number: ";	puts(m.c_no);

			gotoxy(21,16);	cout<<"Enter New Name or press <ENTER> for old name: ";
			gotoxy(21,17);	gets(n);
				if(n[0]==NULL)
					strcpy(n,m.name);
			gotoxy(21,18);	cout<<"Enter Address or press <ENTER> for old address: ";
			gotoxy(21,19);	gets(a);
				if(a[0]==NULL)
					strcpy(a,m.address);
			gotoxy(21,20);	cout<<"Enter Contact No. or press <ENTER> for previous no.: ";
			gotoxy(21,21);	gets(cn);
				if(cn[0]==NULL)
					strcpy(cn,m.c_no);
			gotoxy(21,22);	cout<<"ARE U SURE U WANT TO SAVE?(y/n)...";
							ch1=getche();
			if(ch1=='y'||ch1=='Y')
			{   f.seekp(location);
				m.ac_no=m.ac_no;
				m.balance=m.balance;
				strcpy(m.name,n);
				strcpy(m.address,a);
				strcpy(m.c_no,cn);
				f.write((char*)&m,sizeof(accounts));
				gotoxy(23,24);
				cout<<"### DATA SUCCESSFULLY SAVED ###";
			}
			else
			{	gotoxy(23,24);
				cout<<"!!! DATA NOT SAVED !!!";
			}
			delay(500);
			f.close();
			return;
		}
	}
	if(flag==0)
	{	gotoxy(22,15);
		cout<<"     !!! ACCOUNT NOT FOUND !!!            ";
	}
	f.close();
	getch();
}

/**************************** REMOVE ACCOUNTS ******************************/

void accounts::remove_accounts()
{   menu_graphics();
	outtextxy(190,100,"*** REMOVE ACCOUTNS ***");

	ifstream fin("BANK.bin",ios::in | ios::binary);
	ofstream fout("Temp.bin",ios::out | ios::app | ios::binary);

	int flag=0,ac_s,i=0;
	char ch1,atm[4],book[4],ac_i[3];

	setcolor(2);
	settextstyle(3,0,1);
	gotoxy(22,14);
	cout<<"Enter the accounts number: ";
	while((ac_i[i]=getch())!=13)
	{	if(i<0)
			i=0;
		if(ac_i[i]==8)
		{	if(i==0)
				continue;
			cout<<'\b';
			cout<<' ';
			cout<<'\b';
			i--;
			continue;
		}
		if(ac_i[i]==9)
			break;
		cout<<ac_i[i];
		i++;
	}
	ac_i[i]='\0';

	ac_s=atoi(ac_i);
	if(ac_s==0)
	{	setcolor(4);
		settextstyle(0,0,1);
		outtextxy(155,getmaxy()-23,"!!! INVALID INPUT !!!");
		delay(1000);
		return;
	}
	menu_graphics();
	outtextxy(190,100,"*** REMOVE ACCOUTNS ***");

	accounts ac;
	while(fin.read((char*)&ac,sizeof(ac)))
	{
		if(ac.getac_no()!=ac_s)
			fout.write((char*)&ac,sizeof(ac));
		else
		{  	flag=1;
			gotoxy(21,10);	cout<<"ACCOUNT NO.: #";	cout<<ac.getac_no();
			gotoxy(21,12);	cout<<"Name: ";	cout<<ac.name;
			gotoxy(21,14);	cout<<"Address: ";	cout<<ac.address;
			gotoxy(21,16);	cout<<"Contact Number: ";	puts(ac.c_no);
			gotoxy(21,18);	cout<<"ATM CARD DEPOSITED ?(Yes/No)...";	cin>>atm;
			gotoxy(21,20);	cout<<"PASSBOOK DEPOSITED ?(Yes/No)...";    cin>>book;
			if((strcmpi(atm,"yes")==0)&&(strcmpi(book,"yes")==0))
			{	gotoxy(22,23);
				cout<<"Are u sure u want to delete the account(Y/N)...";
				ch1=getch();
				if(ch1=='y'||ch1=='Y')
				{	gotoxy(25,25);
					cout<<"       ### ACCOUNT DELETED ###                   ";
				}
				else
					fout.write((char*)&ac,sizeof(ac));
			}
			else
			{	gotoxy(25,25);
				cout<<"ACCOUNT CANNOT BE DELETED";
				fout.write((char*)&ac,sizeof(ac));
			}
		}
	}
	if(flag==0)
	{	gotoxy(22,14);
		cout<<"     !!! ACCOUNT NOT FOUND !!!            ";
	}
	fin.close();
	fout.close();
	remove("BANK.bin");
	rename("Temp.bin","BANK.bin");
	delay(1000);
}

/****************************** EDIT ACCOUNTS ******************************/

void accounts::edit_accounts()
{   menu_graphics();
	outtextxy(190,100,"*** EDIT ACCOUNTS ***");

	char c;

	gotoxy(22,13);	cout<<"[1] MODIFY ACCOUNT";
	gotoxy(22,15);  cout<<"[2] DELETE ACCOUNT";
	gotoxy(22,18);	cout<<"Enter your choice:";
					c=getche();
	accounts ac;
	switch(c)
	{	case '1':ac.modify();
				break;
		case '2':ac.remove_accounts();
				break;
		default:return;
	}
}

/****************************** TRANSACTION ********************************/
void accounts::transaction()
{   menu_graphics();
	outtextxy(190,100,"*** TRANSACTION ***");

	fstream f("BANK.bin",ios::in | ios::out | ios::binary);

	int flag=0,ac_s,i=0;
	unsigned long am;
	char ch1,ac_i[3];

	setcolor(2);
	settextstyle(3,0,1);
	gotoxy(22,15);	cout<<"Enter the accounts number: ";
	while((ac_i[i]=getch())!=13)
	{	if(i<0)
			i=0;
		if(ac_i[i]==8)
		{	if(i==0)
				continue;
			cout<<'\b';
			cout<<' ';
			cout<<'\b';
			i--;
			continue;
		}
		if(ac_i[i]==9)
			break;
		cout<<ac_i[i];
		i++;
	}
	ac_i[i]='\0';

	ac_s=atoi(ac_i);
	if(ac_s==0)
	{	setcolor(4);
		settextstyle(0,0,1);
		outtextxy(155,getmaxy()-23,"!!! INVALID INPUT !!!");
		delay(1000);
		return;
	}

	menu_graphics();
	outtextxy(190,100,"*** TRANSACTION ***");

	accounts t;
	int tac_no,location;
	tac_no=recordno(ac_s);
	location = (tac_no-1)*sizeof(accounts);
	while(f.read((char*)&t,sizeof(t)))
	{	if(t.getac_no()==ac_s)
		{	flag=1;
			setcolor(4);

		struct date d;
		getdate(&d);
		int day=d.da_day,mon=d.da_mon,year=d.da_year;
		struct time k;
		gettime(&k);
		int hour=k.ti_hour,minute=k.ti_min;

			gotoxy(22,9);   cout<<"DATE : "; 	cout<<day<<"/"<<mon<<"/"<<year;
			gotoxy(22,11);	cout<<"ACCOUNT NO.: #";	cout<<t.ac_no;
			gotoxy(22,13);	cout<<"NAME: "; 	puts(t.name);
			gotoxy(22,15);	cout<<"ADDRESS: ";	puts(t.address);
			gotoxy(22,17);	cout<<"CONTACT NO.: ";	puts(t.c_no);
			gotoxy(60,11);	cout<<"BALANCE :";	cout<<t.balance;
			gotoxy(21,20);	cout<<"DEPOSIT(D) / WITHDRAW(W)? Press <ENTER> to exit...";
							ch1=getche();
							cout<<ch1;

			switch(ch1)
			{ 	default : gotoxy(21,22);	cout<<"!!! INVALID INPUT !!!";
						break;
				case 'D':
				case 'd':gotoxy(21,22);	cout<<"Enter amount:";
						cin>>am;
						t.balance=t.balance+am;
						f.seekp(location);
						t.d1=day;	t.m1=mon;	t.y1=year;
						t.hr=hour;	t.min=minute;
						t.dw=am;
						f.write((char*)&t,sizeof(accounts));
						gotoxy(23,25);	cout<<"!!! TRANSACTION SUCCESSFUL !!!";
						goto e;
				case 'W':
				case 'w':gotoxy(21,22);	cout<<"Enter amount:";
						cin>>am;
						if(am>t.balance)
						{	gotoxy(23,25);	cout<<"ERROR! CHECK UR BALANCE !!!";
							goto e;
						}
						t.balance=t.balance-am;
						f.seekp(location);
						t.d1=day;	t.m1=mon;	t.y1=year;
						t.hr=hour;	t.min=minute;
						t.dw=am;
						f.write((char*)&t,sizeof(accounts));
						gotoxy(23,25);	cout<<"!!! TRANSACTION SUCCESSFUL !!!";
						goto e;
			}
			f.close();
			return;
		}
	}
	if(flag==0)
	{	gotoxy(22,15);
		cout<<"     !!! ACCOUNT NOT FOUND !!!            ";
	}

	e:
	f.close();
	setcolor(4);
	settextstyle(0,0,1);
	outtextxy(155,getmaxy()-23,"Press any key to continue");
	getch();
}

/*************************** CHANGE PASSSWORD ******************************/

void accounts::change_password()
{   cleardevice();
	clrscr();
	graphics();
	int midx=getmaxx()/2,midy=getmaxy()/2,j=-1;
	char c_pass[25];

	setcolor(BLUE);
	setfillstyle(7,2);

	rectangle(midx-170,midy-120,midx+170,midy+150);
	floodfill(130,110,1);
	rectangle(midx-170,midy-120,midx+170,midy-70);

	secure ss;

	settextstyle(1,0,3);
	outtextxy(midx-95,midy-110,"CREATE ACCOUNT");
	settextstyle(2,0,8);
	outtextxy(170,215,"USERNAME:");    rectangle(305,215,460,245);
	outtextxy(170,263,"PASSWORD:");    rectangle(305,263,460,293);
	outtextxy(170,311,"CPASSWORD:");	rectangle(305,313,460,337);
	ss.input();
	gotoxy(40,21);
		do
		{	j++;
			c_pass[j]=getch();
			if(c_pass[j]==13)
				break;
			cout<<"*";
		}while(c_pass[j]!=13);
		c_pass[j]='\0';

	if(strcmp(c_pass,ss.getpass())!=0)
	{	gotoxy(28,23);
		cout<<" !!! PASSWORD NOT MATCHED !!!";
	}
	else
	{   ofstream fout("Security.bin",ios::out|ios::binary);
		fout.write((char*)&ss,sizeof(secure));
		fout.close();
		gotoxy(35,23);	cout<<"!!! DONE !!!";
	}

	gotoxy(30,25);	cout<<"Press any key to continue";

	count=1;
	z=130;
	getch();
	m_page();
}

/********************************* HELP ************************************/

void accounts::help()
{	menu_graphics();
	outtextxy(190,100,"*** HELP ***");
	settextstyle(3,0,1);
	setcolor(2);
	outtextxy(155,136,"(1)List Accounts: This option displays all the ");
	outtextxy(155,156,"   accounts with account no, holder name & balance.");
	outtextxy(155,176,"(2)Add Accounts: This option is used to  open an ");
	outtextxy(155,196,"   account.");
	outtextxy(155,216,"(3)See Details: This option is used to display full ");
	outtextxy(155,236,"   details of any account.");
	outtextxy(155,256,"(4)Edit Acconts: This option is used to MODIFY and ");
	outtextxy(155,276,"   DELETE andy account.");
	outtextxy(155,296,"(5)Transaction: This option is used to credit or debit");
	outtextxy(155,316,"   amount in any accout.");
	outtextxy(155,336,"(6)Change Password: This option is used to change ");
	outtextxy(155,356,"   login username and password.");
	outtextxy(155,376,"(7)Help: List help");
	outtextxy(155,398,"(8)Exit: Exit the program");

	settextstyle(0,0,1);
	setcolor(4);
	outtextxy(155,getmaxy()-23,"Press any key to continue");
	getch();
}

/********************************* QUIT ************************************/

void accounts::quit()
{	char ch;
	menu_graphics();
	outtextxy(190,100,"*** QUIT ***");

	setcolor(15);
	outtextxy(250,220,"ARE YOU SURE U WANT TO EXIT(y/n)?");

	settextstyle(0,0,1);
	setcolor(4);
	outtextxy(155,getmaxy()-23,"Enter ur choice");
	ch=getch();
	if(ch==13||ch=='Y'||ch=='y')
		thankyou();
}

/****************************************************************************
**************************** DISPLAY function *******************************
****************************************************************************/
void display()
{   menu_graphics();
	outtextxy(155,100,"ACCOUNT NO.       NAME OF PERSON             BALANCE   ");

	char ch;
	int i=9;
	setcolor(15);
	ifstream fin("BANK.bin",ios::binary);
	if(fin==NULL)
	{	gotoxy(26,16);	cout<<"!!! NO ACCOUNT EXIST !!!";
		getch();
		return;
	}
	accounts a;
	while(fin.read((char*)&a,sizeof(a)))
	{   if(i==27)
		{   i=9;
			settextstyle(0,0,1);
			setcolor(4);
			outtextxy(155,getmaxy()-23,"Press any key to go to next page");
			getch();
			setcolor(GREEN);
			settextstyle(0,0,1);
			setfillstyle(1,0);
			floodfill(300,300,LIGHTGREEN);
			line(146,120,getmaxx()-6,120);
			line(146,getmaxy()-35,getmaxx()-6,getmaxy()-35);
			rectangle(150,90,getmaxx()-10,115);
			setfillstyle(1,LIGHTGRAY);
			floodfill(160,100,GREEN);
			setcolor(0);
			outtextxy(155,100,"ACCOUNT NO.        NAME OF PERSON             BALANCE   ");
		}
		a.output(i);
		i=i+2;
	}
	fin.close();

	setcolor(4);
	outtextxy(155,getmaxy()-23,"Press any key to continue");                 	getch();
}

/****************************************************************************
**************************** SAVE function **********************************
****************************************************************************/
void save()
{   char ch;
	menu_graphics();
	outtextxy(190,100,"*** INPUT DETAILS ***");

		struct date d;
		getdate(&d);
		int day=d.da_day,mon=d.da_mon,year=d.da_year;

		struct time t;
		gettime(&t);
		int hour=t.ti_hour,minute=t.ti_min;

	accounts c;
	unsigned long acno=c.ac_no_last();
	ofstream fout("BANK.bin",ios::app | ios::binary);
	if(fout==NULL)
	{	cout<<"!!! ERROR !!! ";
		return;
	}
	int r=c.input();
	if(r==1)
	{	delay(1000);		ch='n';		}
	else
	{	gotoxy(25,23);	cout<<"ARE U SURE U WANT TO SAVE DETAILS(Y/N)?: ";
						ch=getch();
	}

	if((ch=='Y')||(ch=='y'))
	{   c.d=day;	c.m=mon;	c.y=year;
		c.d1=day;	c.m1=mon;	c.y1=year;
		c.hr=hour;	c.min=minute;
		acno++;
		c.ac_no_increment(acno);
		fout.write((char*)&c,sizeof(c));
		gotoxy(25,25);	cout<<"!!! DATA SAVED !!!";
		delay(600);
		fout.close();
	}
	else
	{	gotoxy(25,25);	cout<<"!!! DATA NOT SAVED !!!";
		fout.close();
		delay(1000);
	}
}

/****************************************************************************
*************************** FILE function ***********************************
****************************************************************************/
void file(char u[20],char p[25])
{	ifstream fin("Security.bin",ios::in|ios::binary);
	if(fin==NULL)
	{	cleardevice();
		cout<<"\n\t!!! ERROR !!!";
		cout<<"\n\nTHERE IS AN ERROR IN THE SOFTWARE, PLESE CONTACT \"Ghostman™\".";
		cout<<"\nEMAIL ID : mavihs08@gmail.com";
		getch();
		exit(0);
	}
	secure sa;
	fin.read((char*)&sa,sizeof(secure));
	if((strcmpi(sa.getname(),u)==0)&&(strcmp(sa.getpass(),p)==0))
	{	cleardevice();
		fin.close();
		m_page();
	}
	fin.close();
	return;
}

/****************************************************************************
************************* MAIN fucntion *************************************
****************************************************************************/
void m_page()
{   graphics();
	setcolor(GREEN);
	rectangle(1,1,getmaxx(),getmaxy()); 	//max rectangle
	line(1,80,getmaxx(),80);     //horizontal line
	rectangle(6,6,getmaxx()-5,75);	//top rectangle
	setfillstyle(4,4);	floodfill(10,10,GREEN);
	line(140,80,140,getmaxy());   	//vertical line

	setcolor(LIGHTGREEN);
	rectangle(145,85,getmaxx()-5,getmaxy()-5);	//second large rectangle

	setcolor(GREEN);
	setfillstyle(1,15);

	rectangle(7,100,134,135);	line(11,125,17,125);
	rectangle(7,145,134,180);   line(11,170,17,170);
	rectangle(7,190,134,225);   line(11,215,17,215);
	rectangle(7,235,134,270);  	line(11,260,17,260);
	rectangle(7,280,134,315);   line(11,305,17,305);
	line(7,325,134,325);
	rectangle(7,335,134,365);   line(11,360,17,360);
	rectangle(7,375,134,405);   line(11,399,17,399);
	rectangle(7,415,134,450);   line(11,440,17,440);

	settextstyle(4,0,4);
	setcolor(15);
	outtextxy(100,15,"  THE BANK OF LIBERTY");

	char ch;
	setfillstyle(1,4);
	floodfill(8,130,GREEN);
	display_name(10);
	welcome();
	accounts ac;
start:
	ch=getch();
	switch(ch)
	{		case 72:if(count==1)
						goto start;
					else
					{	remove(z);
						z-=45;
						count--;
						floodfill(8,z,GREEN);
						display_name(10);
						break;
					}
			case 80:if(count==8)
						goto start;
					else
					{	remove(z);
						z+=45;
						count++;
						floodfill(8,z,GREEN);
						display_name(10);
						break;
					}
			case 13:display_name(count);
					switch(count)
					 { 	case 1: display();
								break;
						case 2: save();
								break;
						case 3:	ac.see_details();
								break;
						case 4: ac.edit_accounts();
								break;
						case 5:	ac.transaction();
								break;
						case 6:	ac.change_password();
								break;
						case 7:	ac.help();
								break;
						case 8: ac.quit();
								break;

					}
					display_name(10);
					welcome();
					goto start;
			case 'L':
			case 'l':remove(z);
					 z=130;
					 floodfill(8,z,GREEN);
					 count=1;
					 display_name(count);
					 display();
					 welcome();
					 display_name(10);
					goto start;
			case 'A':
			case 'a':remove(z);
					 z=175;
					 floodfill(8,z,GREEN);
					 count=2;
					 display_name(count);
					 save();
					 welcome();
					 display_name(10);
					goto start;
			case 's':
			case 'S':remove(z);
					 z=220;
					 floodfill(8,z,GREEN);
					 count=3;
					 display_name(count);
					 ac.see_details();
					 welcome();
					 display_name(10);
					goto start;
			case 'E':
			case 'e':remove(z);
					 z=265;
					 floodfill(8,z,GREEN);
					 count=4;
					 display_name(count);
					 ac.edit_accounts();
					 welcome();
					 display_name(10);
					goto start;
			case 'T':
			case 't':remove(z);
					 z=310;
					 floodfill(8,z,GREEN);
					 count=5;
					 display_name(count);
					 ac.transaction();
					 display_name(10);
					 welcome();
					 goto start;
			case 'C':
			case 'c':remove(z);
					z=355;
					floodfill(8,z,GREEN);
					count=6;
					display_name(count);
					ac.change_password();
					welcome();
					goto start;

			case 'h':remove(z);
					z=400;
					floodfill(8,z,GREEN);
					count=7;
					display_name(count);
					ac.help();
					welcome();
					display_name(10);
					goto start;
			case 'Q':
			case 'q':remove(z);
					z=445;
					floodfill(8,z,GREEN);
					count=8;
					display_name(count);
					ac.quit();
					welcome();
					display_name(10);
					goto start;
	}
	goto start;
}

/****************************************************************************
************************ REMOVE function ************************************
****************************************************************************/
void remove(int &i)
{   setfillstyle(1,0);
	floodfill(8,i,GREEN);
	setfillstyle(1,4);
}

/****************************************************************************
*********************** THANK YOU fucntion **********************************
****************************************************************************/
void animation(int i,char z)
{	int x,y;
		y=15;
		for(x=i,y=1;x<i+15,y<16;x++,y++)
		{	gotoxy(x,y);
			cout<<z;
			sound(x*100);
			delay(50);
			cout<<'\b';
			cout<<" ";
		}
		gotoxy(x,y);	cout<<z;
}

void thankyou()
{   graphics();
	setbkcolor(0);
	int x,y,c;
	animation(15,'T');
	animation(17,'H');
	animation(19,'A');
	animation(21,'N');
	animation(23,'K');
	animation(27,'Y');
	animation(29,'O');
	animation(31,'U');
	nosound();

	while(!kbhit())
	{   x=rand()%650;
		y=rand()%450;
		c=rand()%15;
		for(int j=5;j<=30;j+=4)
		{  	setcolor(c);
			line(x,y,x,y);
			circle(x,y,j);
			delay(60);
		}
		delay(100);
	}
	exit(0);
}

/******************************* THE END ***********************************/
