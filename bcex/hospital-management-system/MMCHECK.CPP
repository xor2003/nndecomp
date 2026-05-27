int mmcheck(void)
{
int choice,correct=0;
FILE *mchk;
mlist:
clrscr();
uname();
gotoxy(16,5);
line(48,'*');
gotoxy(16,7);
line(48,'*');
gotoxy(31,6);
cout<<"Check Out Patients";

gotoxy(8,21);
cout<<"Information : Please note that all patients will be checked out.";

gotoxy(18,8);
cout<<"Select Disease to Check Out Patients's Lists";

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
	goto mlist;
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
	goto mlist;
	}
   else
	{
	correct=0;
	}
   }

if(choice==1)
{
mchk=fopen("FEVER","w");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fclose(mchk);

clear(3);
gotoxy(33,23);
cout<<"Please Wait...";
delay(1000);
clrscr();
uname();
gotoxy(26,13);
cout<<"All Patients are Checked Out.";
getch();
goto mlist;
}

if(choice==2)
{
mchk=fopen("COLDVIRUS","w");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fclose(mchk);

clear(3);
gotoxy(33,23);
cout<<"Please Wait...";
delay(1000);
clrscr();
uname();
gotoxy(26,13);
cout<<"All Patients are Checked Out.";
getch();
goto mlist;
}

if(choice==3)
{
mchk=fopen("YELLOWFEVER","w");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fclose(mchk);

clear(3);
gotoxy(33,23);
cout<<"Please Wait...";
delay(1000);
clrscr();
uname();
gotoxy(26,13);
cout<<"All Patients are Checked Out.";
getch();
goto mlist;
}

if(choice==4)
{
mchk=fopen("CHOLERA","w");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fclose(mchk);

clear(3);
gotoxy(33,23);
cout<<"Please Wait...";
delay(1000);
clrscr();
uname();
gotoxy(26,13);
cout<<"All Patients are Checked Out.";
getch();
goto mlist;
}

if(choice==5)
{
mchk=fopen("DIPHTHERIA","w");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fclose(mchk);

clear(3);
gotoxy(33,23);
cout<<"Please Wait...";
delay(1000);
clrscr();
uname();
gotoxy(26,13);
cout<<"All Patients are Checked Out.";
getch();
goto mlist;
}

if(choice==6)
{
mchk=fopen("UNKNOWN","w");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fclose(mchk);

clear(3);
gotoxy(33,23);
cout<<"Please Wait...";
delay(1000);
clrscr();
uname();
gotoxy(26,13);
cout<<"All Patients are Checked Out.";
getch();
goto mlist;
}
return choice;
}