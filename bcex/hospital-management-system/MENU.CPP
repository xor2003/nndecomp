int menu(void)
{
int correct=0,choice,mlst;
menu:
clrscr();
gotoxy(15,3);
printline(45,0);
gotoxy(20,4);
name();
gotoxy(15,5);
printline(45,0);
gotoxy(33,6);
cout<<"MAIN MENU";
gotoxy(25,8);
cout<<"1. Add Patient's Details";
gotoxy(25,10);
cout<<"2. Show Patient's Details";
gotoxy(25,12);
cout<<"3. Check Out Patient";
gotoxy(25,14);
cout<<"4. Show Status";
gotoxy(25,16);
cout<<"5. Exit";

static int choice5=0;
if(choice5==1)
	goto choice5;

if(!correct)
   {
   gotoxy(23,25);
   cout<<"What do you want to do ?  ";
   cin>>choice;
   if(choice==13)
	return choice;
   if( choice<1 || choice>5 )
	{
	correct++;
	goto menu;
	}
   }
else
   {
   gotoxy(20,24);
   cout<<"Please enter valid choice number...";
   gotoxy(23,25);
   cout<<"What do you want to do ?  ";
   cin>>choice;
   if( choice<1 || choice>5 )
	{
	correct=0;
	correct++;
	goto menu;
	}
   else
	{
	correct=0;
	}
   }

choice1:
if(choice==1)
	{
	addp();
	goto menu;
	}

choice2:
if(choice==2)
	{
	mlst=mlist();
	if(mlst==3)
		goto menu;
	if(mlst==4)
		close();
	}


choice3:
if(choice==3)
	{
	mlst=mcheck();
	if(mlst==3)
		goto menu;
	if(mlst==4)
		close();
	}

choice4:
if(choice==4)
	{
	status();
	goto menu;
	}

choice5:
if(choice==5)
	{
	if(choice5==0)
		{
		choice5++;
		goto menu;
		}
	close();
	}

return choice;
}