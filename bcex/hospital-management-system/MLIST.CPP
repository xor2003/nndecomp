int mlist(void)
{
int lchoice,correct=0;
showlist:
clrscr();
uname();
gotoxy(20,5);
line(40,'*');
gotoxy(32,6);
cout<<"Patient's Details";
gotoxy(20,7);
line(40,'*');

gotoxy(23,9);
cout<<"1. All Patients' List";
gotoxy(23,11);
cout<<"2. Patients' List by Disease";
gotoxy(23,13);
cout<<"3. Main Menu";
gotoxy(23,15);
cout<<"4. Exit";

if(!correct)
   {
   gotoxy(23,24);
   cout<<"What do you want to do ?  ";
   cin>>lchoice;
   if( lchoice<1 || lchoice>4 )
	{
	correct++;
	goto showlist;
	}
   }
else
   {
   gotoxy(20,23);
   cout<<"Please enter valid choice number...";
   gotoxy(23,24);
   cout<<"What do you want to do ?  ";
   cin>>lchoice;
   if( lchoice<1 || lchoice>4 )
	{
	correct=0;
	correct++;
	goto showlist;
	}
   else
	{
	correct=0;
	}
   }

FILE *alst;
char C;

if(lchoice==1)
{
clrscr();
uname();
alst=fopen("PATIENT","r");
while((C=getc(alst)) != EOF)
	cout<<C;
cout<<" "; line(78,'-');
getch();
fclose(alst);
goto showlist;
}

if(lchoice==2)
{
int mch=mmlist();
if(mch==7)
	goto showlist;
if(mch==8)
	lchoice=3;
if(mch==9)
	lchoice=4;
}

return lchoice;
}
