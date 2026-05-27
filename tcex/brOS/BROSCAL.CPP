#include"mouse-1.cpp"
struct dosdate_t d,s;
int year,mon;
void findday();
void cal_display();
void publicholiday();
void checkpublic_holiday();
void input_year();
void cal();
void calendar()
{
	cleardevice();
	_dos_getdate(&d);
	year=int(d.year);
	mon=int(d.month);
	findday();
	cal_display();
	mouse.init_mouse();
	mouse.hide_mouse();
}
void findday()
{
	int Century,Decade,Final_Value,Month_january=11,total=0,Remaining_Days,First_day_Month,x1=125,y1=150,a,b,c;
	_dos_getdate(&s);
	a=int(s.year);
	b=int(s.month);
	c=int(s.day);
	int s=0,d;
	char st2[3],st4[5];
	int days[]={31,28,31,30,31,30,31,31,30,31,30,31};
	char month[12][20] ={"JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"};
	year--;
	Century=year/100;
	Decade=year%100;
	Final_Value=(1+((13*Month_january-1)/5)+Decade+(Decade/4)+(Century/4)-(2*Century))%7;// Zellar Formula Which Says k+[13*m-1/5] + D + D/4 + C/4 -2*C
		if(Final_Value <0)Final_Value+=7;
	year++;
	if(year%4==0&&year%100==0&&year%400==0)
	days[1]=29;
	else if(year%4==0&&year%100!=0)
	days[1]=29;
	for(int r=0;r<mon-1;r++)
	{
		total+=days[r];
	}
	Remaining_Days=total%7;
	First_day_Month =(Final_Value + Remaining_Days);
	if(First_day_Month>=7)First_day_Month=(First_day_Month)%7;
	for( r=1;r<=First_day_Month;r++)  {x1+=62;s++;}
	cal();
	itoa(year,st4,10);
	setcolor(15);
	settextstyle(2,0,8);
	outtextxy(getmaxx()/2-strlen(month[mon-1])*7,80,month[mon-1]);
	outtextxy(getmaxx()/2-strlen(st4)*7,50,st4);
	settextstyle(1,0,1);
	for( r=1;r<=days[mon-1];r++)
		{
			itoa(r,st2,10);
			if(x1>=83&&x1<=147) setcolor(RED);
			  else setcolor(BLACK);
			if(year==a && mon==b && r==c) setcolor(GREEN);
			if(r/10==0)
			{
				char t=st2[0];
				st2[1]=t;
				st2[0]='0';
				st2[2]='\0';

			}
			if(s>=6)
			{
				if(year==a && mon==b && r==c) setcolor(GREEN);
				else setcolor(BLACK);
				outtextxy(x1,y1,st2);
				y1=y1+30;
				x1=x1-360;
			}
			if(s!=6)
			{	outtextxy(x1,y1,st2);
				x1+=60;
				s++;
			}
			else s = 0;
		  }
}
void cal_display()
{
	mouse.init_mouse();
	mouse.show_mouse();
	int x=1;
	while(x)
	{
		  mouse.get_status();
		  if(mouse.cx>=getmaxx()/2-222&&mouse.cy>=55&&mouse.cx<=getmaxx()/2-172&&mouse.cy<=100)
		  {
			year--;
			findday();
		  }
		  else if(mouse.cx>=(getmaxx()/2)-162 && mouse.cy>=55 && mouse.cx<=(getmaxx()/2)-122 && mouse.cy<=100)
		  {
		       mon--;
		       if(mon<=0)
		       {
				mon+=12;
				year--;
		       }
		       findday();
		  }
		  else if(mouse.cx>=getmaxx()/2+122 && mouse.cy>=55 && mouse.cx<=getmaxx()/2+162 && mouse.cy<=100)
		  {
			mon++;
			if(mon>12)
			{
				mon=mon-12;
				year++;
			}
			findday();
		  }
		  else if(mouse.cx >=getmaxx()/2+172 && mouse.cy>=55 && mouse.cx<=getmaxx()/2+222 && mouse.cy<=100)
		  {
			year++;
			findday();
		  }
		  else if(mouse.cx>=70 && mouse.cy>=390 && mouse.cx<=165 && mouse.cy<=420)
		  {
			       input_year();
		  }
		  else if(mouse.cx>=250 && mouse.cy>=390 && mouse.cx<=400 && mouse.cy<=420)
		  {
			      publicholiday();
		  }
		  else if(mouse.cx>=520 && mouse.cy>=390 && mouse.cx<=580 && mouse.cy<=420)
		  {
			     x=0;
		  }
		  delay(200);
	}
}
void cal()
{
	cleardevice();
	int x=120,y=117;
	char *day[]={"SUN","MON","TUE","WED","THR","FRI","SAT"};
	settextstyle(3,0,1);
	setcolor(BLACK);
	setfillstyle(1,0);
	bar(70,390,185,420);
	bar(250,390,400,420);
	bar(520,390,580,420);
	setcolor(CYAN);
	outtextxy(70,390,"INPUT YEAR");
	outtextxy(260,390,"IMPORTANT DATES");
	outtextxy(520,390,"EXIT");
	setbkcolor(0);
	settextstyle(10,0,3);
	setcolor(BLACK);
	setfillstyle(1,7);
	bar(getmaxx()/2-222,105,getmaxx()/2+222,335);
	setfillstyle(1,8);
	bar(getmaxx()/2-222,55,getmaxx()/2-172,100); //MATHUDA
	bar(getmaxx()/2-162,55,getmaxx()/2-122,100);
	bar(getmaxx()/2+122,55,getmaxx()/2+162,100);
	bar(getmaxx()/2+172,55,getmaxx()/2+222,100);
	setcolor(WHITE);
	outtextxy(100,50,"<<");
	outtextxy(505,50,">>");
	settextstyle(10,0,3);
	outtextxy(170,50,"<");
	outtextxy(455,50,">");
	setcolor(BLACK);
	setfillstyle(1,7);
	for(int x1=30;x1<=390;x1+=60)
	{
		for(int y1=20;y1<=170;y1+=30)
		{
			rectangle(85+x1,95+y1,135+x1,155+y1);
		}
	}
	settextstyle(1,0,2);
	for(int g=0;g<7;g++)
	{
	       if(g==0) setcolor(4);
		  else setcolor(0);
		  outtextxy(x,y,day[g]);
		  x+=60;
	}
}
void input_year()
{
	       mouse.init_mouse();
	       mouse.hide_mouse();
	       cleardevice();
	       char a[20], yr[10], yrout[2];
	       mouse.init_mouse();
	       cleardevice();
	       settextstyle(1,0,2);
	       setcolor(WHITE);
	       setfillstyle(SOLID_FILL,BLACK);
	       outtextxy(getmaxx()/2-100,getmaxy()/2-20,"Enter Year:");
	       for(int i=0,f=1,x=0 ;i<4&&f==1;)
	       {     char al = getch();
		     if(al>='0'&&al<='9'){ yr[i++] = al; yrout[0] = al; yrout[1] = '\0'; outtextxy( 340+x, 220,yrout); x+=20;}
		     else if(al==13) f=0;
		     else if(al==8&&i!=0){i--; bar(320+x,210,getmaxx(),getmaxy()); x-=20;}

	       }
	       yr[i] = '\0';
	       year=atoi(yr);
	       delay(100);
	       cleardevice();
	       findday();
	       mouse.init_mouse();
	       mouse.show_mouse();
}
void publicholiday()
{

		int y=80;char line[200];
		mouse.init_mouse();
		mouse.hide_mouse();
		cleardevice();
		char file[12][20] ={"JAN","FEB","MARCH","APRIL","MAY","JUNE","JULY","AUG","SEP","OCT","NOV","DEC"};
		char month[12][20]={"JANUARY","FEBRUARY","MARCH","APRIL","MAY","JUNE","JULY","AUGUST","SEPTEMBER","OCTOBER","NOVEMBER","DECEMBER"};
		setbkcolor(BLACK);
		setcolor(WHITE);
		settextstyle(1,0,4);
		outtextxy(getmaxx()/2-strlen(month[mon-1])*10,30,month[mon-1]);
		settextstyle(1,0,1);
		setcolor(WHITE);
		strcat(file[mon-1],".txt");
		ifstream fin(file[mon-1],ios::in);
		fin.getline(line,80,'\n');
		while(!fin.eof())
		{
			outtextxy(getmaxx()/2-300,y,line);
			fin.getline(line,100,'\n');
			y+=20;
		}
		fin.close();
		checkpublic_holiday();
		findday();
		mouse.init_mouse();
		mouse.show_mouse();
}
void checkpublic_holiday()
{
	setcolor(WHITE);
	settextstyle(3,0,1);
	outtextxy(getmaxx()/2-100,getmaxy()-30,"Press ENTER to return");
	int kb;
	do
	{	kb = getch();
	}while(kb!=13);
}

















