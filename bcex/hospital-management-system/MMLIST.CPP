int mmlist(void)
{
int choice,correct=0;
dlist:
clrscr();
uname();
gotoxy(20,5);
line(40,'*');
gotoxy(32,6);
cout<<"Patient's Details";
gotoxy(20,7);
line(40,'*');

gotoxy(21,8);
cout<<"Select Disease to View Patients's List";
gotoxy(33,10);
cout<<"1. Fever";
gotoxy(33,11);
cout<<"2. Cold Virus";
gotoxy(33,12);
cout<<"3. Yellow Fever";
gotoxy(33,13);
cout<<"4. Cholera";
gotoxy(33,14);
cout<<"5. Diphtheria";
gotoxy(33,15);
cout<<"6. UNKNOWN";
gotoxy(33,16);
cout<<"7. Go Back";
gotoxy(33,17);
cout<<"8. Main Menu";
gotoxy(33,18);
cout<<"9. Exit";

if(!correct)
   {
   gotoxy(23,24);
   cout<<"What do you want to do ?  ";
   cin>>choice;
   if( choice<1 || choice>9 )
	{
	correct++;
	goto dlist;
	}
   }
else
   {
   gotoxy(20,23);
   cout<<"Please enter valid choice number...";
   gotoxy(23,24);
   cout<<"What do you want to do ?  ";
   cin>>choice;
   if( choice<1 || choice>9 )
	{
	correct=0;
	correct++;
	goto dlist;
	}
   else
	{
	correct=0;
	}
   }

FILE *alist;
char c;

if(choice==1)
{
clrscr();
uname();
alist=fopen("FEVER","r");
while((c=getc(alist)) != EOF)
	cout<<c;
cout<<" "; line(78,'-');
getch();
fclose(alist);
goto dlist;
}

if(choice==2)
{
clrscr();
uname();
alist=fopen("COLDVIRUS","r");
while((c=getc(alist)) != EOF)
	cout<<c;
cout<<" "; line(78,'-');
getch();
fclose(alist);
goto dlist;
}

if(choice==3)
{
clrscr();
uname();
alist=fopen("YELLOWFEVER","r");
while((c=getc(alist)) != EOF)
	cout<<c;
cout<<" "; line(78,'-');
getch();
fclose(alist);
goto dlist;
}

if(choice==4)
{
clrscr();
uname();
alist=fopen("CHOLERA","r");
while((c=getc(alist)) != EOF)
	cout<<c;
cout<<" "; line(78,'-');
getch();
fclose(alist);
goto dlist;
}

if(choice==5)
{
clrscr();
uname();
alist=fopen("DIPHTHERIA","r");
while((c=getc(alist)) != EOF)
	cout<<c;
cout<<" "; line(78,'-');
getch();
fclose(alist);
goto dlist;
}

if(choice==6)
{
clrscr();
uname();
alist=fopen("UNKNOWN","r");
while((c=getc(alist)) != EOF)
	cout<<c;
cout<<" "; line(78,'-');
getch();
fclose(alist);
goto dlist;
}

return choice;
}