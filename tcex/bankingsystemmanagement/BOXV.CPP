void boxv()
{
for(int s=1;s<25;s+=23)
   {
     for(int r=2;r<79;r++)
	{
	  gotoxy(r,s);
	  cout<<"Í";
	}
   }
for(s=2;s<79;s++)
   {
     gotoxy(s,3);
     cout<<"Í";
   }
for(int r=1;r<80;r+=78)
   {
     for(s=2;s<24;s++)
	{
	  gotoxy(r,s);
	  cout<<"º";
	}
   }
for(s=2;s<24;s++)
   {
    gotoxy(11,s);
    cout<<"º";
   }
for(s=2;s<24;s++)
   {
    gotoxy(38,s);
    cout<<"º";
   }
for(s=2;s<24;s++)
   {
    gotoxy(53,s);
    cout<<"º";
   }
for(s=2;s<24;s++)
   {
    gotoxy(66,s);
    cout<<"º";
   }
gotoxy(3,2);cout<<"ACC NO. ";
gotoxy(14,2);cout<<"NAME OF ACCOUNT HOLDER ";
gotoxy(41,2);cout<<"MOBILE NO. ";
gotoxy(58,2);cout<<"TYPE";
gotoxy(70,2);cout<<"BALANCE ";
gotoxy(1,24);
cout<<"È";
gotoxy(1,1);
cout<<"É";
gotoxy(79,1);
cout<<"»";
gotoxy(79,24);
cout<<"¼";
}