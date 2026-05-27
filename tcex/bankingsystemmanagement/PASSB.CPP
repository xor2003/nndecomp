void login()
{
int z=0;
char usr[20]="Shakti",usr1[20],psw[20]="sanket111",psw1[20];
do
{
clrscr();
textcolor(5);
boxs();
gotoxy(28,6);
cout<<"WELCOME TO SHAKTI BANK";
gotoxy(33,8);
cout<<"PLEASE LOGIN";
gotoxy(20,11);
cout<<"ENTER THE USERNAME: ";
gets(usr1);
gotoxy(20,12);
cout<<"ENTER THE PASSWORD: ";
for(int c=0;;c++)
{
    gotoxy(c+40,12);psw1[c]=getche();
    if(int(psw1[c])==13)
		break;
     if(int(psw1[c])==8)
      {
	cout<<" ";
	c-=2;
       if(c<=-2)
	c++;
       }
   if(int(psw1[c])!=8)
      gotoxy(c+40,12);cout<<"*";
      gotoxy(39,12);cout<<" ";
}
psw1[c]='\0';
gotoxy(20,13);
cout<<"LOGING IN";
  for(c=0;c<3;c++)
     {
       for(int a=29;a<33;a++)
	   {
	      gotoxy(a,13);
	      cout<<".";
	      delay(250);
	   }
	      gotoxy(29,13);
	      cout<<"        ";
     }
  gotoxy(20,13);
  cout<<"                     ";
  delay(40);
if(strcmp(usr,usr1)!=0)
   {
    gotoxy(20,13);
    cout<<"INCORRECT USERNAME OR PASSWORD";
    goto end;
    }
if(strcmp(psw,psw1)!=0)
   {
    gotoxy(20,13);
    cout<<"INCORRECT USERNAME OR PASSWORD";
    goto end;
    }
gotoxy(20,13);
cout<<"ACCESS GRANTED";
getch();
scr2();
goto e;
end:
getch();
z++;
}while(z<3);
gotoxy(20,14);
cout<<"ACCESS DENIED";
getch();
e:
}