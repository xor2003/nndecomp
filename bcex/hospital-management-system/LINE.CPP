void printline(int n,int t)
{
   if(t)
	cout<<"\t\t   ";
   for(int i=0;i<n;i++)
	{
	cout<<"-";
	}
}

void name(void)
	{
	cout<<"GENERAL HOSPITAL MANAGEMENT SYSTEM";
	}

void uname(void)
	{
	printline(80,0);
	gotoxy(23,2);
	name();
	cout<<endl;
	printline(80,0);
	cout<<endl;
	}

void line(int n,char c)
{
   for(int j=0;j<n;j++)
	cout<<c;
}	

void space(int n)
{
   for(int j=0;j<n;j++)
	cout<<" ";
}

void clear(int n)
{
for(int i=0;i<n;i++)
	{
	gotoxy(1,25-i);
		space(78);
	}
}

void close(void)
{
	gotoxy(2,23);
		space(75);
	gotoxy(2,24);
		space(75);
	gotoxy(2,25);
		space(75);
	gotoxy(25,24);
	cout<<"Application will close now...";
	delay(750);
}