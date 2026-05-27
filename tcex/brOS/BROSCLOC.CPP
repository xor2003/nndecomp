char *month[]={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
void Box(int x,int y,int x1,int y1,int width,int color,int color1)
{	int i;
	for(i=0;i<width;i++)
	    {	sc(color);line(x+i,y+i,x+i,y1-i);line(x+i,y+i,x1-i,y+i);
		sc(color1);line(x+i,y1-i,x1-i,y1-i);line(x1-i,y+i,x1-i,y1-i);
	    }
}
int quit()
{	int x, y, b;
		click(&x,&y,&b);
		if((b&1)==1&&x<=30&&y<=30)
		{	delay(50);
			cleardevice();
			return 1;
		}
		else return 0;
}
void clockone(int &midx, int &midy, int &i, int &P, int &Q, char ss[])
{
		midx = getmaxx()/2;
		initmouse();
		setfillstyle(SOLID_FILL,RED);
		bar(0,0,30,30);
		sc(WHITE);
		settextstyle(3,0,1);
		outtextxy(11,1,"x");
		midy = getmaxy()/2;
		setbkcolor(BLUE);
		setfillstyle(SOLID_FILL,1);
		bar(0,280,2*midx,2*midy);
		sc(8);
		setfillstyle(1,8);  fillellipse(midx, midy, 207, 207);
		setfillstyle(1,14); fillellipse(midx, midy, 200, 200);
		for(i=0;i<12;i++)
		{
			pieslice(midx, midy, i*30, (i+1)*30, 200);
		}
		sc(14); fillellipse( midx , midy , 185  , 185 );
		settextstyle(SANS_SERIF_FONT, HORIZ_DIR, 3);
		for(i=1;i<=12;i++)
		{
			sc(1); //sprintf(ss,"%d",i);
			itoa(i, ss, 10);
			if(i==5)
			{ P = 25; Q = -11; }
			else if(i==1)
			{ P = 2; Q = -8; }
			else if(i==2)
			{ P = 10; Q = -15; }
			else if(i==3)
			{ P = 15; Q = -15; }
			else if(i==4)
			{ P = 14; Q = -18; }
			else if(i==6)
			{ P = 27; Q = -3; }
			else if(i==10)
			{ P = 10; Q = 5; }
			else if(i==12)
			{ P = 3; Q = -14; }
			else if (i==11)
			{ P = 3; Q = -5; }
			else if(i==7)
			{ P=25; Q=0; }
			else if(i==9)
			{ P = 14; Q = 8; }
			else if(i==8)
			{ P = 16; Q = 6; }
			outtextxy(midx+185*sin(PI*30*i/180)+Q, midy-185*cos(PI*30*i/180)-P, ss);
		}
		delay(10);
}
void clock()
{               cleardevice();
		int midx, midy, i, P, Q;
		char ss[90];
		clockone(midx, midy, i, P, Q, ss);
		showmouseptr();
		while(!quit())
		{
				settextstyle(SANS_SERIF_FONT, HORIZ_DIR, 1);
				sc(8);
				outtextxy(midx-16, midy-100, "brOS");
				textbackground(14);
				struct dosdate_t date;	_dos_getdate(&date);
				//sprintf(ss, "%d", date.year);
				itoa(int(date.year),ss,10);
				sc(14); outtextxy( midx-22 , 5 , ss );
				settextstyle(3, 0, 1); sc(8);
					//sprintf(ss, " %d %s",date.day,month[date.month-1]);
					itoa(int(date.day),ss,10);
					if((int(date.day))/10==0)
					{       ss[1] = '\0';
						for(int i = 1; i>=0; i--)
						{	ss[i+1] = ss[i];
						}
						ss[0] = '0';
					}
					outtextxy(293,midy-151,ss);
					outtextxy(323,midy-151,month[date.month-1]);
				//outtextxy(290, midy-151, ss);
			int	d;
				d = date.dayofweek + 1;
				char dayweek[10]={'\0'};
				if(d==1) strcpy(dayweek,"Sunday");
				else if(d==2) strcpy(dayweek,"Monday");
				else if(d==3) strcpy(dayweek,"Tuesday");
				else if(d==4) strcpy(dayweek,"Wednesday");
				else if(d==5) strcpy(dayweek,"Thursday");
				else if(d==6) strcpy(dayweek,"Friday");
				else if(d==7) strcpy(dayweek,"Saturday");
				outtextxy(midx-10*strlen(dayweek)/2, 320, dayweek);
				Box(midx-34, midy-150, midx+42, midy-125, 1, 8, 1);
				struct dostime_t t; _dos_gettime(&t);
				setfillstyle(1,14); bar(midx+120, midy-9, midx+142, midy+10);
				if(t.minute==0&&t.hour==0&&t.second==0)  bar(midx-34, midy-150, midx+42, midy-125);
				if(t.second==0) bar(midx+90, midy-9, midx+112, midy+10);
				if(t.second==0&&t.minute==0) bar(midx+60, midy-9, midx+82, midy+9);
				sc(8);
				//sprintf(ss, "%02d:%02d:%02d", t.hour, t.minute, t.second);
				itoa(int(t.hour),ss,10);
				if(int(t.hour)/10==0)
				{	for(int i = strlen(ss), l = strlen(ss); i >=0; i--)
						ss[i] = ss[i-1];
					ss[0]='0';
					ss[l+1] = '\0';
				}
				ss[strlen(ss)+1]='\0';
				ss[strlen(ss)]=':';
				outtextxy(midx+60, midy-12, ss);
				itoa(int(t.minute),ss,10);
				if(int(t.minute)/10==0)
				{	for(int i = strlen(ss), l = strlen(ss); i >=0; i--)
						ss[i] = ss[i-1];
					ss[0]='0';
					ss[l+1] = '\0';
				}
				ss[strlen(ss)+1]='\0';
				ss[strlen(ss)]=':';
				outtextxy(midx+90,midy-12,ss);
				itoa(int(t.second),ss,10);
				if(int(t.second)/10==0)
				{	for(int i = strlen(ss), l = strlen(ss); i >=0; i--)
						ss[i] = ss[i-1];
					ss[0]='0';
					ss[l+1] = '\0';
				}
				ss[strlen(ss)]='\0';
				outtextxy(midx+120,midy-12,ss);
				Box(midx+58, midy-10, midx+145, midy+11, 1, 8, 1);
				sc(14); line( midx ,midy , midx+sin(PI*6*(t.second-1)/180)*R , midy-cos(PI*6*(t.second-1)/180)*R );
				if(t.second%10==0){ for(i=-3;i<=3;i++)
							line(midx+i, midy+i, midx+sin(PI*(6*t.minute+(t.second-10)/10)/180)*(R-20), midy-cos(PI*(6*t.minute+(t.second-10)/10)/180)*(R-20));
						  }
				if(t.second==0){ for(i=-4;i<5;i++)
							 line(midx+i, midy+i, midx+sin(PI*(30*t.hour+(t.minute-2)/2)/180)*(R-70), midy-cos(PI*(30*t.hour+(t.minute-2)/2)/180)*(R-70));
					       }
				sc(4); line(midx, midy, midx+sin(PI*6*t.second/180)*R, midy-cos(PI*6*t.second/180)*R);
				sc(8);
				for(i=-3;i<=3;i++)
					 line(midx+i, midy+i, midx+sin(PI*(6*t.minute+t.second/10)/180)*(R-20), midy-cos(PI*(6*t.minute+t.second/10)/180)*(R-20));
				for(i=-4;i<=4;i++)
					 line(midx+i, midy+i, midx+sin(PI*(30*t.hour+t.minute/2)/180)*(R-70), midy-cos(PI*(30*t.hour+t.minute/2)/180)*(R-70));
				setfillstyle(1,4);fillellipse( midx , midy , 5 , 5 );
			delay(100);
       }
       initmouse();
}