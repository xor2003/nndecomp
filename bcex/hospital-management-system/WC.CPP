int pmain(void)
{
password:
clrscr();
textcolor(YELLOW);
printline(79,0);
gotoxy(35,10);
cout<<"WELCOME";
gotoxy(38,12);
cout<<"TO";
gotoxy(21,14);
name();
gotoxy(1,25);
printline(79,0);

static pass=0;
limit:
if(pass<3)
{
if(pass==0)
	{
	gotoxy(25,23);
	cout<<"Loading...  Please Wait...";
	delay(3000);
	}

char passwd[5];
gotoxy(2,23);
for(int p=0;p<75;p++)
	cout<<" ";
gotoxy(25,23);
printf("Enter Password: ");

for(p=0;p<5;p++)
	{
	passwd[p]=getch();
	cout<<"* ";
	}

if(!strncmp("vivek",passwd,5))
	{
	gotoxy(22,24);
	cout<<"You Have Successfully Logged In.";
	}
else
	{
	gotoxy(15,24);
	cout<<"You have Entered a Wrong Password. Please Try Again.";
	getch();
	pass++;
	if(pass<3)
		goto password;
	else
		goto limit;

	}
}
else
{
gotoxy(2,23);
for(int p=0;p<75;p++)
	cout<<" ";
gotoxy(2,24);
for(p=0;p<75;p++)
	cout<<" ";
gotoxy(25,24);
cout<<"Application will close now...";
getch();
return 0;
}

getch();
clrscr();

return 1;
}