void boxs()
{
clrscr();
for(int s=1;s<25;s+=23)
   {
     for(int r=2;r<79;r++)
	{
	  gotoxy(r,s);
	  cout<<"Í";
	}
   }
for(int r=1;r<80;r+=78)
   {
     for(s=2;s<24;s++)
	{
	  gotoxy(r,s);
	  cout<<"º";
	}
   }
gotoxy(1,24);
cout<<"È";
gotoxy(1,1);
cout<<"É";
gotoxy(79,1);
cout<<"»";
gotoxy(79,24);
cout<<"¼";
gotoxy(53,2);
time_t t;
time(&t);
printf("%s\n", ctime(&t));
}