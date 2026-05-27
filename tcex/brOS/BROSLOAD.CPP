void brosload()
{
		initmouse();
		i.x.ax = 2;
	int	maxx,maxy;
		setbkcolor(LIGHTBLUE);
		setcolor(RED);
		setfillstyle(SOLID_FILL,RED);
		circle(30,30,15);
		floodfill(30,30,RED); //Get the image of red circle
    long int     s;
	void	*p;                                               		s=imagesize(86,86,116,116);
		p=(char *)malloc(s);
		setfillstyle(SOLID_FILL,GREEN);
		getimage(12,13,47,45,p);
		cleardevice();
		maxx=getmaxx();
		maxy=getmaxy();
		bar(1,398,maxx,maxy);
		setfillstyle(SOLID_FILL,BROWN);
		bar(maxx/2-20,maxy/2-10,maxx/2+21,maxy/2+30);  //Draw the Ground.
		setfillstyle(SOLID_FILL,YELLOW);
		bar(maxx/2-10,maxy/2,maxx/2+10,maxy/2+20);
		setfillstyle(LINE_FILL,BROWN);           //Draw the brick thing
		bar(maxx/2-10,maxy/2,maxx/2+10,maxy/2+20);
		setfillstyle(SOLID_FILL,BLACK);
		for(int x=1;x<maxx;x+=2)
		{
			setcolor(BLACK);
			setfillstyle(SOLID_FILL,BLACK);
			bar(x-2,365,x+33,397);
			putimage(x,364,p,1);       //Make the ball roll
			if(x==maxx/2-18)
			{
				for(int i=1;i<4;i++)
				{
				   for(int y=365;y>maxy/2+32;y-=3)       //If below the brick, Jump 3 times.
				   {
					putimage(x,y,p,1);
					delay(10);
					bar(x-1,y-2,x+33,y+32);
				   }
				   if(i==3)
				   {	setcolor(YELLOW);
					setfillstyle(SOLID_FILL,YELLOW);
					pieslice(maxx/2,maxy/2-60,0,360,25);
				   }
				   setcolor(RED);
				   if(i==3)
				   {    settextstyle(0,0,1);
					outtextxy(maxx/2-15,maxy/2-63,"100%");
				   }
				   setfillstyle(SOLID_FILL,BLACK);
				   for(y=maxy/2+33;y<366;y+=3)       //If below the brick, Jump 3 times.
				   {
					putimage(x,y,p,1);
					delay(10);
					bar(x-1,y-2,x+33,y+32);
				   }
				   delay(100);
				}

			}
			delay(15);
		}
		setbkcolor(0);
}
