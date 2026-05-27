long double balt;
#include"c:\\tc\\bin\\bank\\dateb.cpp" // Change The Path Of The File
#include"c:\\tc\\bin\\bank\\boxv.cpp"  // Change The Path Of The File

class account
{
  char name[100],add[150],psw2[20],mobno[12],type[12],acno[8],ty;
  long double bal;
  long double balad,balsu;

 public:

void acc()
{
  gotoxy(29,6);
  cout<<"ACCOUNT REGISTRATION";
  gotoxy(20,7);
  cout<<"_____________________________________ ";
  gotoxy(20,9);
  cout<<"ENTER YOUR NAME : ";
      gets(name);
  Date();
  M:
  gotoxy(20,12);
  cout<<"                                                ";
  gotoxy(20,11);
  cout<<"                                                ";
  gotoxy(20,11);
  cout<<"ENTER YOUR MOBILE NO. : ";
     gets(mobno);
  int l=strlen(mobno);
  if(l<10||l>11)
    {
     gotoxy(20,12);
     cout<<"INVALID MOBILE NO. PLEASE ENTER A VALID NO.";
     getch();
     goto M;
    }
  gotoxy(20,12);
  cout<<"ACCOUNT NUMBER : ";
  randomize();
  for(int c=0;c<5;c++)
   acno[c]=48+random(9);
  acno[c]='\0';
  cout<<acno;
  gotoxy(20,13);
  cout<<"CREATE PASSWORD: ";
  for(int s=0;;s++)
      {
	gotoxy(s+37,13);psw2[s]=getche();
	 if(int(psw2[s])==13)break;
	 if(int(psw2[s])==8)
      {      cout<<" ";
	       s-=2;
	  if(s<=-2)s++;
       }
	if(int(psw2[s])!=8)
	    gotoxy(s+37,13);cout<<"*";
	    gotoxy(36,13);cout<<" ";
      }
  psw2[s]='\0';
  gotoxy(20,14);
  cout<<"ADDRESS : ";
    gets(add);
  gotoxy(20,15);
  cout<<"SELECT THE TYPE OF ACCOUNT : 1)CURRENT 2)SAVINGS ";
  ty=getch();
  if(ty=='1')
  {
   gotoxy(20,15);
   cout<<"                                                  ";
   gotoxy(20,15);
   strcpy(type,"CURRENT");
   cout<<"TYPE OF THE ACCOUNT : "<<type;
   }
  else
   {
   gotoxy(20,15);
   cout<<"                                                  ";
   gotoxy(20,15);
   strcpy(type,"SAVINGS");
   cout<<"TYPE OF THE ACCOUNT : "<<type;
   }
  b:
  gotoxy(20,17);
  cout<<"                                             ";
  gotoxy(20,16);
  cout<<"                                             ";
  gotoxy(20,16);
  cout<<"ENTER MINIMUM BALANCE ($100) : ";
     cin>>bal;
  if(bal<100)
    {
     gotoxy(20,17);
     cout<<"NOT SUFFICIENT BALANCE TO OPEN A ACCOUNT";
     getch();
     goto b;
    }
  gotoxy(27,18);
  cout<<"REGISTERING ACCOUNT";
  for(c=0;c<3;c++)
    {
     for(int a=46;a<50;a++)
	{
	  gotoxy(a,18);
	  cout<<".";
	  delay(250);
	}
	 gotoxy(46,18);
	 cout<<"       ";
    }
  gotoxy(27,18);
  cout<<"                     ";
  delay(100);
  textcolor(12+128);
  gotoxy(27,18);
  cprintf("REGISTRATION SUCCESSFUL");
  gotoxy(27,21);
  cout<<"PRESS A KEY TO CONTINUE";
  getch ();
}

void view()
      {
	d+=2;
	gotoxy(3,d);
	cout<<acno;
	gotoxy(14,d);
	cout<<name;
	gotoxy(41,d);
	cout<<mobno;
	gotoxy(55,d);
	cout<<type;
	gotoxy(70,d);
	cout<<bal;
      }

void view1()
 {
   clrscr();
   boxs();
   gotoxy(31,6);
   cout<<"VIEW ACCOUNT";
   gotoxy(20,7);
   cout<<"_____________________________________ ";
   gotoxy(20,10);
   cout<<"NAME OF THE ACCOUNT HOLDER : "<<name;
   gotoxy(20,11);
   cout<<"MOBILE NO. : "<<mobno;
   gotoxy(20,12);
   cout<<"TYPE OF ACCOUNT : "<<type;
   gotoxy(20,13);
   cout<<"BALANCE ($) : "<<bal;
   gotoxy(27,17);
   cout<<"PRESS A KEY TO CONTINUE";
   getch();
 }
void deposit()
{
 gotoxy(31,6);
 cout<<"DEPOSIT MONEY";
 gotoxy(20,7);
 cout<<"_____________________________________ ";
 gotoxy(20,10);
 cout<<"NAME OF THE ACCOUNT HOLDER : "<<name;
 gotoxy(20,11);
 cout<<"TYPE OF THE ACCOUNT : "<<type;
 gotoxy(20,12);
 cout<<"AVAILABLE BALANCE ($) : "<<bal;
 gotoxy(20,13);
 cout<<"AMOUNT TO BE DEPOSITED ($) : ";
 cin>>balad;
 bal+=balad;
 gotoxy(20,15);
 cout<<"TRANSACTING";
 for(int c=0;c<3;c++)
    {
      for(int a=31;a<35;a++)
	 {
	  gotoxy(a,15);
	  cout<<".";
	  delay(250);
	 }
	 gotoxy(31,15);
	 cout<<"       ";
    }
 gotoxy(20,15);
 cout<<"                " ;
 delay(100);
 gotoxy(20,15);
 textcolor(14+128);
 cprintf("TRANSACTION SUCCESSFUL");
 gotoxy(27,17);
 cout<<"TOTAL BALANCE ($) : "<<bal;
 gotoxy(27,20);
 cout<<"PRESS A KEY TO CONTINUE";
 getch();
}
void withdraw()
{
start:
clrscr();
boxs();
gotoxy(31,6);
cout<<"WITHDRAWL MONEY";
gotoxy(20,7);
cout<<"_____________________________________ ";
gotoxy(20,10);
cout<<"NAME OF THE ACCOUNT HOLDER : "<<name;
gotoxy(20,11);
cout<<"TYPE OF THE ACCOUNT : "<<type;
gotoxy(20,12);
cout<<"AVAILABLE BALANCE ($) : "<<bal;
gotoxy(20,13);
cout<<"AMOUNT TO BE WITHRAWL ($) : ";
cin>>balsu;
if(balsu>bal)
  {
   gotoxy(20,15);
   cout<<"INSUFFICIENT BALANCE";
   getch();
   goto start;
  }
bal-=balsu;
gotoxy(20,15);
cout<<"TRANSACTING";
for(int c=0;c<3;c++)
   {
     for(int a=31;a<35;a++)
	{
	 gotoxy(a,15);
	 cout<<".";
	 delay(250);
	}
	gotoxy(31,15);
	cout<<"       ";
   }
gotoxy(20,15);
cout<<"                " ;
delay(100);
gotoxy(20,15);
textcolor(14+128);
cprintf("TRANSACTION SUCCESSFUL");
gotoxy(27,17);
cout<<"TOTAL BALANCE ($) : "<<bal;
gotoxy(27,20);
cout<<"PRESS A KEY TO CONTINUE";
getch();
}
transfer()
{
begin:
clrscr();
boxs();
gotoxy(31,6);
cout<<"TRANSFER MONEY";
gotoxy(20,7);
cout<<"_____________________________________ ";
gotoxy(20,10);
cout<<"NAME OF THE ACCOUNT HOLDER : "<<name;
gotoxy(20,11);
cout<<"TYPE OF THE ACCOUNT : "<<type;
gotoxy(20,12);
cout<<"AVAILABLE BALANCE ($) : "<<bal;
gotoxy(20,13);
cout<<"AMOUNT TO BE TRANSFERED ($) : ";
cin>>balt;
if(balt>bal)
  {
   gotoxy(20,15);
   cout<<"INSUFFICIENT BALANCE";
   getch();
   goto begin;
  }
bal-=balt;
}
void addmon()
  {
  bal+=balt;
  gotoxy(20,17);
  cout<<"TRANSACTING";
  for(int c=0;c<3;c++)
    {
     for(int a=31;a<35;a++)
	{
	 gotoxy(a,17);
	 cout<<".";
	 delay(250);
	}
	gotoxy(31,17);
	cout<<"       ";
   }
   gotoxy(20,17);
   cout<<"                " ;
   delay(100);
   gotoxy(20,17);
   textcolor(14+128);
   cprintf("TRANSACTION SUCCESSFUL");
   gotoxy(27,20);
   cout<<"PRESS A KEY TO CONTINUE";
   getch();

  }
char *retype()   //TO RETURN TYPE//
  {
    return type;
  }
char *remno()    //TO RETURN MOBILENO//
  {
    return mobno;
  }
char *rename()   //TO RETURN NAME//
  {
    return name;
  }
char *reacno()   //TO RETURN ACCNO//
  {
    return acno;
  }
 char *repsw()   //TO RETURN PASSWORD//
  {
    return psw2;
  }
}a;
//----------------------------------------------------//
//-----------------ADDING ACCOUNT FUNC()--------------//
//----------------------------------------------------//
void acr()
{
  textcolor(12);
  clrscr();
  boxs();
  fstream ac("ACC.dat",ios::app);
  a.acc();
  ac.write((char *)&a,sizeof(a));
  ac.close();
}
//----------------------------------------------------//
//----------------DEPOSIT MONEY FUNC()----------------//
//----------------------------------------------------//
void depm()
{
 textcolor(14);
 clrscr();
 boxs();
 char ac1[8],psd1[20];
 gotoxy(15,12);
 cout<<"ENTER YOUR ACCOUNT NO. TO DEPOSITE MONEY : ";
 gets(ac1);
 fstream dep("ACC.dat",ios::in|ios::out);
  while(dep.read((char *)&a,sizeof(a)))
      {
	if(strcmp(ac1,a.reacno())==0)
	  {
//////////////////////////////////////////////////////////////////////////////
	    gotoxy(15,13);
	    cout<<"ENTER THE PASSWORD: ";
	    for(int c=0;;c++)
	       {
		gotoxy(c+36,13);psd1[c]=getche();
		if(int(psd1[c])==13)break;
		if(int(psd1[c])==8)
		  {
		    cout<<" ";
		    c-=2;
		    if(c<=-2)c++;
		  }
	       if(int(psd1[c])!=8)
	       gotoxy(c+36,13);cout<<"*";
	       gotoxy(35,13);cout<<" ";
	      }
	    psd1[c]='\0';
//////////////////////////////////////////////////////////////////////////////
	    if(strcmp(psd1,a.repsw())==0)
	      {
	       clrscr();
	       boxs();
	       dep.seekg(dep.tellg()-sizeof(a));
	       a.deposit();
	       dep.write((char *)&a,sizeof(a));
	       break;
	      }
	    else
	      {
	       gotoxy(15,14);cout<<"WRONG PASSWORD ENTERED";
	       getch();
	       break;
	      }
	}
      }
   if(strcmp(ac1,a.reacno())!=0)
     {
      gotoxy(15,14);
      cout<<"NO SUCH RECORD REGISTERED";
      getch();
     }
   dep.close();
}
//----------------------------------------------------//
//----------------WITHDRWAL MONEY FUNC()--------------//
//----------------------------------------------------//
void withm()
{
 textcolor(14);
 clrscr();
 boxs();
 char ac2[8],psd2[20];
 gotoxy(15,12);
 cout<<"ENTER YOUR ACCOUNT NO. TO WITHDRAW MONEY : ";
 gets(ac2);
 fstream wit("ACC.dat",ios::in|ios::out);
  while(wit.read((char *)&a,sizeof(a)))
      {
	if(strcmp(ac2,a.reacno())==0)
	  {
/////////////////////////////////////////////////////////////////////////////
	    gotoxy(15,13);
	    cout<<"ENTER THE PASSWORD: ";
	    for(int c=0;;c++)
	       {
		gotoxy(c+36,13);psd2[c]=getche();
		if(int(psd2[c])==13)break;
		if(int(psd2[c])==8)
		  {
		    cout<<" ";
		    c-=2;
		    if(c<=-2)c++;
		  }
	       if(int(psd2[c])!=8)
	       gotoxy(c+36,13);cout<<"*";
	       gotoxy(35,13);cout<<" ";
	      }
	    psd2[c]='\0';
//////////////////////////////////////////////////////////////////////////////
	   if(strcmp(psd2,a.repsw())==0)
	     {
	      wit.seekg(wit.tellg()-sizeof(a));
	      a.withdraw();
	      wit.write((char *)&a,sizeof(a));
	      break;
	     }
	   else
	     {
	      gotoxy(15,14);cout<<"WRONG PASSWORD ENTERED";
	      getch();
	      break;
	     }
	}
      }
   if(strcmp(ac2,a.reacno())!=0)
     {
      gotoxy(15,14);
      cout<<"NO SUCH RECORD REGISTERED";
      getch();
     }
   wit.close();
}
//----------------------------------------------------//
//----------------TRANSFER MONEY FUNC()---------------//
//----------------------------------------------------//
void transm()
{
 textcolor(14);
 clrscr();
 boxs();
 char ac3[8],ac4[8],psd3[20];
 gotoxy(15,12);
 cout<<"ENTER YOUR ACCOUNT NO. TO TRANSFER MONEY : ";
 gets(ac4);
 fstream addm("ACC.dat",ios::in|ios::out);
 fstream tra("ACC.dat",ios::in|ios::out);
  while(tra.read((char *)&a,sizeof(a)))
      {
	if(strcmp(ac4,a.reacno())==0)
	  {
/////////////////////////////////////////////////////////////////////////////
	    gotoxy(15,13);
	    cout<<"ENTER THE PASSWORD: ";
	    for(int c=0;;c++)
	       {
		gotoxy(c+36,13);psd3[c]=getche();
		if(int(psd3[c])==13)break;
		if(int(psd3[c])==8)
		  {
		    cout<<" ";
		    c-=2;
		    if(c<=-2)c++;
		  }
	       if(int(psd3[c])!=8)
	       gotoxy(c+36,13);cout<<"*";
	       gotoxy(35,13);cout<<" ";
	      }
	    psd3[c]='\0';
//////////////////////////////////////////////////////////////////////////////
	   if(strcmp(psd3,a.repsw())==0)
	     {
	      a.transfer();
	      tra.seekg(tra.tellg()-sizeof(a));
	      tra.write((char *)&a,sizeof(a));
	      gotoxy(10,15);
	      cout<<"ENTER THE ACC NO TO WHICH THE MONEY IS TO BE TRANSFERED : ";
	      gets(ac3);
	      while(addm.read((char *)&a,sizeof(a)))
		{
		 if(strcmp(ac3,a.reacno())==0)
		   {
		    a.addmon();
		    addm.seekg(addm.tellg()-sizeof(a));
		    addm.write((char *)&a,sizeof(a));
		    goto end;
		   }
		}
	      break;
	     }
	   else
	     {
	      gotoxy(15,14);cout<<"WRONG PASSWORD ENTERED";
	      getch();
	      break;
	     }
	}
      }
   if(strcmp(ac4,a.reacno())!=0)
     {
      gotoxy(15,14);
      cout<<"NO SUCH RECORD REGISTERED";
      getch();
     }
   end:
   addm.close();
   tra.close();
}
//----------------------------------------------//
//----------------NEW NAME()--------------------//
//----------------------------------------------//
void namenew()
  {
    char nname[100];
    gotoxy(20,21);
    cout<<"ENTER NEW NAME : ";
    gets(nname);
    strcpy(a.rename(),nname);
  }
//----------------------------------------------//
//--------------NEW MOBILE NO()-----------------//
//----------------------------------------------//
void nonew()
  {
    char mno[12];
    gotoxy(20,21);
    cout<<"ENTER NEW MOBILE NO. : ";
    gets(mno);
    strcpy(a.remno(),mno);
  }
//----------------------------------------------//
//--------------NEW ACC TYPE()------------------//
//----------------------------------------------//
void typenew()
  {
    char tt;
    gotoxy(20,21);
    cout<<"SELECT NEW TYPE : 1)CURRENT 2)SAVINGS ";
    tt=getch();
    if(tt=='1')
      strcpy(a.retype(),"CURRENT");
    else
      strcpy(a.retype(),"SAVINGS");
  }
//----------------------------------------------//
//--------------NEW PASSWORD()------------------//
//----------------------------------------------//
void passnew()
{
 char psdo[20],psdn[20];
 fstream P("ACC.dat",ios::in|ios::out);
 gotoxy(20,21);
 cout<<"ENTER OLD PASSWORD: ";
 for(int c=0;;c++)
   {
    gotoxy(c+40,21);psdo[c]=getche();
    if(int(psdo[c])==13)break;
    if(int(psdo[c])==8)
      {
       cout<<" ";
       c-=2;
       if(c<=-2)c++;
      }
       if(int(psdo[c])!=8)
       gotoxy(c+40,21);cout<<"*";
       gotoxy(39,21);cout<<" ";
   }
 psdo[c]='\0';
 while(P.read((char *)&a,sizeof(a)))
  {
   if(strcmp(psdo,a.repsw())==0)
   {
    gotoxy(20,22);
    cout<<"ENTER NEW PASSWORD : ";
    for(int c=0;;c++)
     {
      gotoxy(c+40,22);psdn[c]=getche();
      if(int(psdn[c])==13)break;
      if(int(psdn[c])==8)
	{
	 cout<<" ";
	 c-=2;
	 if(c<=-2)c++;
	}
	 if(int(psdn[c])!=8)
	 gotoxy(c+40,22);cout<<"*";
	 gotoxy(39,22);cout<<" ";
     }
    psdn[c]='\0';
    strcpy(a.repsw(),psdn);
    goto fin;
   }
  }
 cout<<"WRONG PASSWORD ENTERED";
 fin:
 P.close();
}
//----------------------------------------------------//
//---------------MODIFY ACCOUNT DETAILS()-------------//
//----------------------------------------------------//
void Modify()
   {
    int n;
    char ac5[8],psd5[20];
    clrscr();
    boxs();
    gotoxy(15,12);
    cout<<"ENTER ACCOUNT NO OF THE ACCOUNT TO BE MODIFIED : ";
    gets(ac5);
    fstream m("ACC.dat",ios::in|ios::out);
    while(m.read((char *)&a,sizeof(a)))
      {
	if(strcmp(ac5,a.reacno())==0)
	  {
/////////////////////////////////////////////////////////////////////////////
	    gotoxy(15,13);
	    cout<<"ENTER THE PASSWORD: ";
	    for(int c=0;;c++)
	       {
		gotoxy(c+36,13);psd5[c]=getche();
		if(int(psd5[c])==13)break;
		if(int(psd5[c])==8)
		  {
		    cout<<" ";
		    c-=2;
		    if(c<=-2)c++;
		  }
	       if(int(psd5[c])!=8)
	       gotoxy(c+36,13);cout<<"*";
	       gotoxy(35,13);cout<<" ";
	      }
	    psd5[c]='\0';
//////////////////////////////////////////////////////////////////////////////
       if(strcmp(psd5,a.repsw())==0)
	     {
	      clrscr();
	      a.view1();
	      gotoxy(27,17);
	      cout<<"                           ";
	      gotoxy(20,15);
	      cout<<"1.MODIFY NAME";
	      gotoxy(20,16);
	      cout<<"2.MODIFY MOBILE NO.";
	      gotoxy(20,17);
	      cout<<"3.MODIFY TYPE OF ACCOUNT";
	      gotoxy(20,18);
	      cout<<"4.MODIFY PASSWORD";
	      gotoxy(20,19);
	      cout<<"ENTER YOUR CHOICE: ";
	      cin>>n;
	      switch(n)
		{
		case 1:
		m.seekg(m.tellg()-sizeof(a));
		namenew();
		m.write((char*)&a,sizeof(a));
		gotoxy(20,22);
		cout<<"MODIFICATON COMPLETE";
		getch();
		break;
		case 2:
		m.seekg(m.tellg()-sizeof(a));
		nonew();
		m.write((char*)&a,sizeof(a));
		gotoxy(20,22);
		cout<<"MODIFICATON COMPLETE";
		getch();
		break;
		case 3:
		m.seekg(m.tellg()-sizeof(a));
		typenew();
		m.write((char*)&a,sizeof(a));
		gotoxy(20,22);
		cout<<"MODIFICATON COMPLETE";
		getch();
		break;
		case 4:
		m.seekg(m.tellg()-sizeof(a));
		passnew();
		m.write((char*)&a,sizeof(a));
		gotoxy(20,23);
		cout<<"MODIFICATON COMPLETE";
		getch();
		break;
		}
	      }
	     else
	     {
	      gotoxy(16,14);cout<<"WRONG PASSWORD ENTERED";
	      getch();
	      break;
	     }
	    }
	   }
   if(strcmp(ac5,a.reacno())!=0)
     {
      gotoxy(15,14);
      cout<<"NO SUCH RECORD REGISTERED";
      getch();
     }
   m.close();
   }
//----------------------------------------------------//
//------------VIEW A SINGLE ACCOUNT FUNC()------------//
//----------------------------------------------------//
void views()
{
 textcolor(9);
 clrscr();
 boxs();
 char ac3[8],psd3[20];
 gotoxy(15,12);
 cout<<"ENTER YOUR ACCOUNT NO. TO SEE YOUR DETAILS : ";
 gets(ac3);
 fstream vi("ACC.dat",ios::in|ios::out);
  while(vi.read((char *)&a,sizeof(a)))
      {
	if(strcmp(ac3,a.reacno())==0)
	  {
/////////////////////////////////////////////////////////////////////////////
	    gotoxy(15,13);
	    cout<<"ENTER THE PASSWORD: ";
	    for(int c=0;;c++)
	       {
		gotoxy(c+35,13);psd3[c]=getche();
		if(int(psd3[c])==13)break;
		if(int(psd3[c])==8)
		  {
		    cout<<" ";
		    c-=2;
		    if(c<=-2)c++;
		  }
	       if(int(psd3[c])!=8)
	       gotoxy(c+35,13);cout<<"*";
	       gotoxy(34,13);cout<<" ";
	      }
	    psd3[c]='\0';
//////////////////////////////////////////////////////////////////////////////
	   if(strcmp(psd3,a.repsw())==0)
	     {
	      a.view1();
	      break;
	     }
	   else
	     {
	      gotoxy(15,14);cout<<"WRONG PASSWORD ENTERED";
	      getch();
	      break;
	     }
	  }
      }
   if(strcmp(ac3,a.reacno())!=0)
     {
      gotoxy(15,14);
      cout<<"NO SUCH RECORD REGISTERED";
      getch();
     }
   vi.close();
}

//----------------------------------------------------//
//-----------DISPLAYING ALL ACCOUNT FUNC()------------//
//----------------------------------------------------//

void viewall()
{
  clrscr();
  textcolor(9);
  boxs();
	//Change Admin UserName(usra) And PassWord(pswa) Here
  char usra[20]="Shakti",usraa[20],pswa[20]="shakti111",pswaa[20];
  gotoxy(15,12);
  cout<<"ENTER THE USERNAME: ";
  gets(usraa);
  gotoxy(15,13);
  cout<<"ENTER THE PASSWORD: ";
  for(int c=0;;c++)
     {
       gotoxy(c+35,13);pswaa[c]=getche();
       if(int(pswaa[c])==13)
		break;
       if(int(pswaa[c])==8)
	{
	  cout<<" ";
	  c-=2;
	 if(c<=-2)c++;
	}
       if(int(pswaa[c])!=8)
       gotoxy(c+35,13);cout<<"*";
       gotoxy(34,13);cout<<" ";
     }
  pswaa[c]='\0';
  gotoxy(15,14);
  cout<<"LOGING IN";
  for(c=0;c<3;c++)
     {
       for(int a=24;a<28;a++)
	   {
	      gotoxy(a,14);
	      cout<<".";
	      delay(250);
	   }
	      gotoxy(24,14);
	      cout<<"        ";
     }
  gotoxy(15,14);
  cout<<"                     ";
  delay(40);
  if(strcmp(usra,usraa)==0&&strcmp(pswa,pswaa)==0)
   {
     gotoxy(15,14);
     cout<<"ACCESS GRANTED";
     getch();
     clrscr();
     boxv();
     fstream v("ACC.dat",ios::in);
     while(!v.eof())
      {
	v.read((char *)&a,sizeof(a));
	if(v.eof())
	break;
	a.view();
	cout<<endl;
      }
     v.close();
     getch();
   }
  else
   {
     gotoxy(15,14);
     cout<<"INCORRECT USERNAME OR PASSWORD";
     getch();
   }
}

//----------------------------------------------------//
//---------------DELETING ACCOUNT FUNC()--------------//
//----------------------------------------------------//
void del()
{
  textcolor(12);
  clrscr();
  boxs();
  char accd[8],psd4[20];
  gotoxy(15,12);
  cout<<"ENTER YOUR ACCOUNT NO. TO CLOSE YOUR ACCOUNT : ";
  gets(accd);
  fstream acc("ACC.dat",ios::in);
  fstream acd("DEL.dat",ios::out);
  while(acc.read((char *)&a,sizeof(a)))
      {
	if(strcmp(accd,a.reacno())==0)
	  {
/////////////////////////////////////////////////////////////////////////////
	    gotoxy(15,13);
	    cout<<"ENTER THE PASSWORD: ";
	    for(int c=0;;c++)
	       {
		gotoxy(c+35,13);psd4[c]=getche();
		if(int(psd4[c])==13)break;
		if(int(psd4[c])==8)
		  {
		    cout<<" ";
		    c-=2;
		    if(c<=-2)c++;
		  }
	       if(int(psd4[c])!=8)
	       gotoxy(c+35,13);cout<<"*";
	       gotoxy(34,13);cout<<" ";
	      }
	    psd4[c]='\0';
//////////////////////////////////////////////////////////////////////////////
	   if(strcmp(psd4,a.repsw())==0)
	     {
	       while(acc.read((char *)&a,sizeof(a)))
		 {
		  if(strcmp(a.reacno(),accd)!=0)
		  acd.write((char *)&a,sizeof(a));
		 }
	      }
	       gotoxy(15,15);
	       cout<<"CLOSING YOUR ACCOUNT";
	       for(c=0;c<3;c++)
		 {
		  for(int a=35;a<39;a++)
		     {
		      gotoxy(a,15);
		      cout<<".";
		      delay(250);
		     }
		     gotoxy(35,15);
		     cout<<"        ";
		 }
		    gotoxy(15,15);
		    cout<<"                     ";
		    delay(40);
		    gotoxy(15,15);
		    textcolor(12+128);
		    cprintf("ACCOUNT CLOSED SUCCESSFULLY");
		    goto E;
	  }
       }
   cout<<"NO SUCH ACCOUNT REGISTERED";
   E:
   acc.close();
   acd.close();
   remove("ACC.dat");
   rename("DEL.dat","ACC.dat");
   gotoxy(27,20);
   cout<<"PRESS A KEY TO CONTINUE";
   getch();
}
//----------------------------------------------------//
//---------------------MAIN SCR()---------------------//
//----------------------------------------------------//
void scr2()
{
clrscr();
int ch;
do
{
s:
textcolor(11);
clrscr();
boxs();
gotoxy(20,7);
cout<<"MAIN SCREEN";
gotoxy(20,8);
cout<<"___________________________";
gotoxy(20,10);
cout<<"1.ACCOUNT REGISTRATION";
gotoxy(20,11);
cout<<"2.DEPOSIT MONEY";
gotoxy(20,12);
cout<<"3.WITHDRAW MONEY";
gotoxy(20,13);
cout<<"4.TRANSFER MONEY";
gotoxy(20,14);
cout<<"5.MODIFY ACCOUNT";
gotoxy(20,15);
cout<<"6.VIEW A ACCOUNT";
gotoxy(20,16);
cout<<"7.CLOSE AN ACCOUNT";
gotoxy(20,17);
cout<<"8.VIEW ALL ACCOUNTS(ADMIN)";
gotoxy(20,18);
cout<<"9.LOGOUT";
gotoxy(20,20);
cout<<"ENTER YOUR CHOICE : ";
cin>>ch;
switch(ch)
   {
     case 1:acr();
	 break;
     case 2:depm();
	 break;
     case 3:withm();
	 break;
     case 4:transm();
	 break;
     case 5:Modify();
	 break;
     case 6:views();
	 break;
     case 7:del();
	 break;
     case 8:
	{
	 d=2;
	 viewall();
	 break;
	}
     case 9:goto e;
	 break;
     default:
      {
	gotoxy(20,20);
	cout<<"WRONG CHOICE ENTERED     ";
	getch();
	goto s;
      }
   }
}while(ch!=9);
e:
 int gdriver = DETECT, gmode, errorcode;
 char msg[80],msg1[80],msg2[80];
 initgraph(&gdriver, &gmode, "C:\\tc\\bgi");
 settextstyle(7,HORIZ_DIR,7);
 setcolor(MAGENTA);
 sprintf(msg, "THANK YOU FOR");
 sprintf(msg1,"VISITING");
 sprintf(msg2, "SHAKTI BANK");
 outtextxy(1,100,msg);
 outtextxy(120,175,msg1);
 outtextxy(40,250,msg2);
 sleep(1);
 exit(0);
}
