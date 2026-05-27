int mcheck(void)
{
FILE *mchk;
int lchoice,correct=0;
showlist:
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

gotoxy(23,10);
cout<<"1. All Patients' List";
gotoxy(23,12);
cout<<"2. Patients' List by Disease";
gotoxy(23,14);
cout<<"3. Main Menu";
gotoxy(23,16);
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


if(lchoice==1)
{
mchk=fopen("PATIENT","w");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fclose(mchk);

mchk=fopen("FEVER","w");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fclose(mchk);

mchk=fopen("COLDVIRUS","w");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fclose(mchk);

mchk=fopen("YELLOWFEVER","w");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fclose(mchk);

mchk=fopen("CHOLERA","w");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fclose(mchk);

mchk=fopen("DIPHTHERIA","w");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fprintf(mchk," |--ID--|-----------NAME------------|----------DISEASE----------|--TELEPHONE--|\n");
fprintf(mchk," |------|---------------------------|---------------------------|-------------|\n");
fclose(mchk);

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
goto showlist;
}

if(lchoice==2)
{
int mch=mmcheck();
if(mch==7)
	goto showlist;
if(mch==8)
	lchoice=3;
if(mch==9)
	lchoice=4;
}

return lchoice;
}