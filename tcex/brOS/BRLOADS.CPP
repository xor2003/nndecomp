void orbit()
{
   initmouse();
   i.x.ax=2;
   void orbits();
   float xx,yy;
   float aa = 40;
   float bb = 85;
   float a = 50;
   float b = 12;
   float A = 135;
   float B = 90;
   float Ra = 5;
   float x,y,X,Y,ex,sq;
   int r = 0;
   setcolor(14);
   for(float i=0,j=0;i<20;j++)
   {
	 x=a*cos(i+10)-a*sin(i+10)+15;
	 y=b*sin(i+10)+a*cos(i+10);
	 X=A*cos(i+20)-B*sin(i+20+90)+15;
	 Y=B*sin(i+20)+B*cos(i+20+90);
	 xx=aa*cos(i)+15;
	 yy=bb*sin(i);
	 setcolor(14);
	 setfillstyle(1,14);
	 circle(x+300,y+200,Ra);
	 floodfill(x+300,y+200,14);
	 setcolor(14);
	 setfillstyle(1,14);
	 circle(xx+300,yy+200,Ra);
	 floodfill(xx+300,yy+200,14);
	 setcolor(14);
	 setfillstyle(1,14);
	 circle(X+300,Y+200,Ra);
	 floodfill(X+300,Y+200,14);
	 delay(70);
	 setcolor(0);
	 setfillstyle(1,0);
	 circle(x+300,y+200,Ra);
	 floodfill(x+300,y+200,0);
	 setcolor(0);
	 setfillstyle(1,0);
	 circle(xx+300,yy+200,Ra);
	 floodfill(xx+300,yy+200,0);
	 setcolor(0);
	 setfillstyle(1,0);
	 circle(X+300,Y+200,Ra);
	 floodfill(X+300,Y+200,0);
	 orbits();
	 i+=0.2;
   }
   do
   {
	setcolor(14);
	setfillstyle(1,14);
	circle(x+300,y+200,Ra);
	floodfill(x+300,y+200,14);
	setcolor(14);
	setfillstyle(1,14);
	circle(xx+300,yy+200,Ra);
	floodfill(xx+300,yy+200,14);
	setcolor(14);
	setfillstyle(1,14);
	circle(X+300,Y+200,Ra);
	floodfill(X+300,Y+200,14);
	delay(500);
	bar(int(r),getmaxy()-40,int(r+getmaxx()/4+4),getmaxy());
	r=r+getmaxx()/4;
   }while(r<int(getmaxx()));
}

void orbits()
{
	for(float i=0;i<=60;i+=1)
	{
	   float xx,yy,aa=45,bb=80,x,y,X,Y,a=50,b=9,A=145,B=100,ex,sq;
	   x=a*cos(i)-a*sin(i)+15;
	   y=b*sin(i)+a*cos(i);
	   X=A*cos(i)-B*sin(i+90)+15;
	   Y=B*sin(i)+B*cos(i+90);
	   xx=aa*cos(i)+15;
	   yy=bb*sin(i);
	   putpixel(x+300,y+200,14);
	   putpixel(X+300,Y+200,14);
	   putpixel(xx+300,yy+200,14);
	}
}
void curvegra()
{
		initmouse(); i.x.ax = 2;
		setbkcolor(BLACK);
		setcolor(YELLOW);
		setlinestyle(0,0,1);
		for(int y1=35,x1=325,x2=325;y1<=225;y1+=5,x1+=4,x2-=4)
		{
			line(325,y1,x1,240);
			line(325,450-y1,x2,240);
			//delay(200);
			line(325,y1,x2,240);
			line(325,450-y1,x1,240);
			delay(300);
		}
		int r=0;
		setcolor(RED);
		for(x1=220,y1=120;r<=50;r+=3)
		{
			circle(x1,y1,r);
			delay(30);
		}
		delay(100);
		r=0;
		setcolor(LIGHTRED);
		for(x1=420,y1=370;r<=50;r+=3)
		{
			circle(x1,y1,r);
			delay(30);
		}
		delay(100);
		r=0;
		setcolor(BLUE);
		for(x1=420,y1=120;r<=50;r+=3)
		{
			circle(x1,y1,r);
			delay(30);
		}
		delay(100);
		r=0;
		setcolor(LIGHTBLUE);
		for(x1=220,y1=370;r<=50;r+=3)
		{
			circle(x1,y1,r);
			delay(30);
		}
		r=0;
}
void discoc()
{
	initmouse();
	i.x.ax = 2;
	cleardevice();
	int x,y;
	x=getmaxx()/2;
	y=getmaxy()/2;
	randomize();
	for(int a=0;a<=2;a++)
	{
		setcolor(random(15)+1);
		for(int i=0;i<50;i++)
		{
			circle(x,y,i) ;delay(5);
		}
		setcolor(random(15)+1);
		for(int j=70;j<120;j++){circle(x,y,j);delay(5);}
		setcolor(random(15)+1);
		for(int k=140;k<=190;k++){circle(x,y,k);delay(5);}
		setcolor(random(15)+1);
		for(int l=210;l<=230;l++)
	       {	circle(x,y,l);delay(5);   }
		delay(200);
       }
       setcolor(BLACK);
       for(a=0;a<232;a++)
       {
	circle(x,y,a);
	delay(5);
       }
}
void polka()
{               initmouse(); i.x.ax = 2;
	int	mx=getmaxx()/2,my=getmaxy()/2;
		setcolor(YELLOW);
		setfillstyle(1,YELLOW);
		pieslice(mx-100,my,0,360,40);
		delay(250);
		setcolor(WHITE);
		setfillstyle(1,WHITE);
		pieslice(mx-100,my-100,0,360,40);
		delay(250);
		setcolor(RED);
		setfillstyle(1,RED);
		pieslice(mx,my-100,0,360,40);
		delay(250);
		setcolor(CYAN);
		setfillstyle(1,CYAN);
		pieslice(mx+100,my-100,0,360,40);
		delay(250);
		setcolor(GREEN);
		setfillstyle(1,GREEN);
		pieslice(mx+100,my,0,360,40);
		delay(250);
		setcolor(MAGENTA);
		setfillstyle(1,MAGENTA);
		pieslice(mx+100,my+100,0,360,40);
		delay(250);
		setcolor(DARKGRAY);
		setfillstyle(1,DARKGRAY);
		pieslice(mx,my+100,0,360,40);
		delay(250);
		setcolor(BROWN);
		setfillstyle(1,BROWN);
		pieslice(mx-100,my+100,0,360,40);
		delay(250);
		setcolor(BLUE);
		setfillstyle(1,BLUE);
		pieslice(mx,my,0,360,30);
		delay(400);
		setcolor(BLACK);
		setfillstyle(1,BLACK);
		pieslice(mx-100,my,0,360,40);
		delay(250);
		pieslice(mx-100,my-100,0,360,40);
		delay(250);
		pieslice(mx,my-100,0,360,40);
		delay(250);
		pieslice(mx+100,my-100,0,360,40);
		delay(250);
		pieslice(mx+100,my,0,360,40);
		delay(250);
		pieslice(mx+100,my+100,0,360,40);
		delay(250);
		pieslice(mx,my+100,0,360,40);
		delay(250);
		pieslice(mx-100,my+100,0,360,40);
		delay(250);
		setcolor(BLUE);
		setfillstyle(1,BLUE);
		pieslice(mx,my,0,360,40);
		delay(500);
}
void goku()
{               cleardevice();
		initmouse(); i.x.ax = 2;
	int	points[]={70,140,85,190,110,205,120,205,145,190,160,140,156,148,150,154,153,146,156,127,146,142,131,154,134,144,135,131,122,147,119,159,119,166,107,152,106,137,111,124,91,141,83,153,85,130,101,111,77,139,75,153,70,140},points1[]={85,140,80,150,75,145,110,170,110,165,85,140},points2[]={120,170,120,165,145,140,150,150,155,145,120,170};

	int	points3[]={89,154,86,159,90,171,100,174,109,169,89,154},points4[]={141,154,144,159,140,171,130,174,121,169,141,154};

	int	p[]={118,177,118,185,119,184,118,177};
		int 	mx=getmaxx(),my=getmaxy();
		setcolor(WHITE);
		randomize();
		for(int i=0;i<1000;i++)
		 putpixel(random(mx),random(my-200)+208,WHITE);
		settextstyle(2,0,6);
		outtextxy(getmaxx()-120,getmaxy()-25,"ROLDASH INC.");
		drawpoly(27,points);
		drawpoly(6,points3);
		drawpoly(6,points4);
		fillpoly(6,points1);
		fillpoly(6,points2);
		circle(132,163,3);
		circle(98,163,3);
		floodfill(132,163,WHITE);
		floodfill(98,163,WHITE);
		line(111,190,115,191);
		line(115,191,119,190);
		line(119,190,123,189);
		line(123,189,128,186);
		fillpoly(4,p);
	int	a[]={75,153,68,150,59,162,65,175,75,185,82,182,75,153},b[]={155,153,162,150,171,162,163,179,155,185,147,182,155,153};
		drawpoly(7,a);
		drawpoly(7,b);
	int	hair[]={65,175,48,162,35,157,45,153,53,155,24,131,7,125,38,122,51,127,22,96,1,91,36,77,70,80,54,60,30,51,54,60,70,80,75,49,63,19,42,8,67,8,105,28,120,48,125,62,135,35,131,11,148,47,140,69,152,71,160,74,168,79,175,86,177,94,183,105,213,106,235,111,205,119,188,129,210,126,223,127,200,147,181,159,198,155,182,172,163,179,171,162,162,150,155,153,156,148,150,154,153,146,156,127,146,142,131,154,134,144,135,131,122,147,119,159,119,166,107,152,106,137,111,124,91,141,83,153,85,130,101,111,77,139,75,153,68,150,59,162,65,175};
		drawpoly(116,hair);
	int	ear1[]={65,159,68,157,75,172,74,179,70,176,70,168,73,167,70,168,70,176,74,179,75,172,68,157,65,159};
	int	ear2[]={165,159,162,157,155,172,156,179,160,176,160,168,157,167,160,168,160,176,156,179,155,172,162,157,165,159};
		drawpoly(13,ear1);
		drawpoly(13,ear2);
		line(68,159,67,164);
		line(162,159,163,164);
	int	m1[]={105,190,125,190,125,199,105,199,105,190},m2[]={105,190,125,190,125,194,105,194,105,190};
		gotoxy(38,8);
		setcolor(WHITE);
		delay(500);
		for(int r=0;r<=50;r++)
		{
			setcolor(CYAN);
			circle(100,338,r);
			setcolor(WHITE);
			if(r==10){	cout<<"KAA...";
					setcolor(BLACK);
					line(111,190,115,191);
					line(115,191,119,190);
					line(119,190,123,189);
					line(123,189,128,186);
					setcolor(WHITE);
					drawpoly(5,m1);
					delay(400);
				}
			else if(r==19){	setcolor(BLACK);
					drawpoly(5,m1);
					setcolor(WHITE);
					line(105,190,125,190);
					}
				else if(r==20){	cout<<"ME...";
						drawpoly(5,m2);
						delay(400);
						}
					else if(r==29){	setcolor(BLACK);
							drawpoly(5,m2);
							setcolor(WHITE);
							line(105,190,125,190);
							}
						else if(r==30){	cout<<"HA...";
								drawpoly(5,m1);
								delay(400);
								}

							  else if(r==39){	setcolor(BLACK);
										drawpoly(5,m1);
										setcolor(WHITE);
										line(105,190,125,190);
									}
								  else if(r==40){	cout<<"ME...";
											drawpoly(5,m2);
											delay(400);
										}
									  else if(r==49){	setcolor(BLACK);
												drawpoly(5,m2);
												setcolor(WHITE);
												line(105,190,125,190);
											}
										       else if(r==50){	cout<<"HA!!!!!";
													drawpoly(5,m1);

													}
			delay(100);
		}
		setfillstyle(1,CYAN);
		for(int s=100;s<=600;s++)
		{	for(int t=313;t<=363;t++)
			{
				bar(s,t,s+1,t+1);
			}
			delay(5);
		}
		delay(500);
		setcolor(BLACK);
		drawpoly(5,m1);
		setcolor(WHITE);
		line(111,190,115,191);
		line(115,191,119,190);
		line(119,190,123,189);
		line(123,189,128,186);
		delay(1000);
}
void coolcirc()
{
		initmouse(); i.x.ax = 2;
		setcolor(YELLOW);
		int	maxX=getmaxx()/2,j=1;
		int	maxY=getmaxy()/2;
		for(float i=0,x1,y1;i<=360;i+=0.1,j++)
		{
			x1=150*cos(i*3.14159265/180);
			y1=150*sin(i*3.14159265/180);
			putpixel(x1+maxX,y1+maxY,YELLOW);
			if(j%20==0)
			{
				setcolor(BLUE);
				circle(x1+maxX,y1+maxY,50);
			}
			if(j%15==0)
			{
				setcolor(BROWN);
				line(maxX,maxY,x1+maxX,y1+maxY);
			}
			delay(2);
		}
		delay(500);
}
int  wallno,loadno;
char wallpapers[7][15]={"DEFAULT","MINION","BATMAN","CIVIL WAR","VM","SPACE","CHENNAI"},loadings[7][15]={"DEFAULT","CIRCULAR","GRAPHICAL","GOKU","POLKA","DISCO","ORBIT"};
void loads()
{       cleardevice();
	switch(loadno)
	{	case 0: brosload(); break;
		case 1: coolcirc(); break;
		case 2: curvegra(); break;
		case 3: goku(); break;
		case 4: polka(); break;
		case 5: discoc(); break;
		case 6: orbit(); break;
	}
}
void refresh()
{
	initmouse(); i.x.ax = 2;
	cleardevice();
	int r1 = random(14) + 1;
	int r2;
		do
		{	r2 = random(15);
		}while(r2==r1);
	setbkcolor(BLACK);
	setlinestyle(1,0,1);
	setfillstyle(SOLID_FILL,r1);
	setcolor(r1);
	for(int r = 0; r <= getmaxy()/2-100; r+=3)
	{       pieslice(getmaxx()/2,getmaxy()/2,0,360,r);
		delay(0.1);
	}
	setcolor(r2);
	settextstyle(3,0,1);
	outtextxy(getmaxx()/2-18,getmaxy()/2-10,"brOS");
	delay(1000);
	setfillstyle(SOLID_FILL,BLACK);
}