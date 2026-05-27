void thanks(void)
{
int end=0;
do
{
if(end>1)
	delay(1000);
gotoxy(20,23);
	space(50);
delay(1000);
gotoxy(23,23);
	cout<<"Thanks For Using My Application";
gotoxy(28,24);
	cout<<"! HAPPY PROGRAMMING !";

end++;
}while(end<5);
}


void cradit(void)
{
int endl=0;
thank:
clrscr();
gotoxy(1,1);
printline(80,0);
gotoxy(1,25);
printline(79,0);

if(endl==0)
{
endl++;
delay(1000);
gotoxy(33,10);
	cout<<"Created By";
gotoxy(28,12);
	cout<<"VIVEK ISHWARBHAI PATEL";
gotoxy(32,13);
	cout<<"( 11BCE073 )";

thanks();
}

if(endl==1)
	{
	endl++;
	goto thank;
	}
gotoxy(33,9);
	cout<<"Special Thanks";
gotoxy(20,10);
	line(40,'+');
gotoxy(31,12);
	cout<<"My Helpful Friends";
gotoxy(39,13);
	cout<<"&";
gotoxy(33,14);
	cout<<"E BALAGURUSAMY";

thanks();
gotoxy(1,2);
for(int i=1;i<23;i++)
	line(80,'-');
line(27,'-');
gotoxy(49,24);
line(32,'-');
getch();
}