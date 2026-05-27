void Date()
{
  int dt;
  struct date d;
  getdate(&d);
  dt=d.da_year;
  start:
  int dd,mm,yy;
  gotoxy(20,10);
  cout<<"                                                ";
  gotoxy(20,11);
  cout<<"                                                 ";
  gotoxy(20,10);
  cout<<"ENTER YOUR DOB (dd-m-yyyy) : ";
     cin>>dd;
   if(dd>31)
     goto wrong;
  gotoxy(52,10);
  cout<<" - ";
    cin>>mm;
   if(mm>12)
     goto wrong;
  gotoxy(58,10);
  cout<<" - ";
    cin>>yy;
 if(yy<999 ||yy>9999 || mm>12 || dd>31)
   {
     wrong:
     gotoxy(20,11);
     cout<<"Invalid Date";
     getch();
     goto start;
   }
 if((mm==4||mm==6||mm==11||mm==9)&&dd>=31)
   goto wrong;
if(mm==2)
{
  if(dd>30)
     goto wrong;
  if((yy)%400!=0 && dd>=29)
     goto wrong;
  else if((yy)%100==0 && dd>=29)
     goto wrong;
  else if((yy)%4!=0 && dd>=29)
     goto wrong;
}
if((dt-yy)<18)
  {
   gotoxy(20,11);
   cout<<"NOT ELIGIBLE TO CREATE A ACCOUNT AS YOU ARE BELOW 18 YEARS";
   getch();
   exit(0);
  }
}