void printname()
{
	int	xcoord=350,ycoord=120,size=40,radius=18;
		outtextxy(xcoord-9,ycoord+size+5,"CALCULATOR");
		xcoord=268;
		ycoord=140;
		outtextxy(xcoord-13,ycoord+radius+7,"CLOCK");
		xcoord=150;
		ycoord=120;
		outtextxy(xcoord-3,ycoord+size+5,"CALENDAR");
		xcoord=450;
		ycoord=120;
		outtextxy(xcoord-1,ycoord+size+5,"NOTEPAD");
		settextstyle(2,0,4);
		outtextxy(170,230,"TO VIEW OUR GAME COLLECTION, HEAD OVER TO brOSGAME!");
}
void batman()
{
		setfillstyle(1,0);
		bar(0,0,getmaxx(),getmaxy());
		setcolor(YELLOW);
		setfillstyle(SOLID_FILL,YELLOW);
		fillellipse(getmaxx()/2,getmaxy()/2-15,200,125);
	int	x=getmaxx()/2+40,y=getmaxy()/2;
		setcolor(BLACK);
		line(x-150,y-50,x-70,y-50);
		arc(x-170,y-20,330,60,35);
		arc(x-112,y+65,10,110,75);
		arc(x+35,y+65,70,170,75);
		arc(x+90,y-20,120,210,35);
		line(x+70,y-50,x-10,y-50);
		arc(x-55,y-50,180,270,15);
		arc(x-25,y-50,270,0,15);
		line(x-55,y-35,x-54,y-45);
		line(x-25,y-35,x-26,y-45);
		line(x-54,y-45,x-52,y-40);
		line(x-26,y-45,x-28,y-40);
		line(x-52,y-40,x-28,y-40);
		setfillstyle(SOLID_FILL,BLACK);
		floodfill(x-52,y-30,BLACK);
		setfillstyle(1,DARKGRAY);
		setcolor(WHITE);
		bar(0,0,getmaxx(),50);
		settextstyle(6,0,4);
		outtextxy(290,0,"brOS");
		setcolor(RED);
		settextstyle(2,0,4);
		printname();
}
void chennai()
{
	ellipse(getmaxx()/2,getmaxy()/2,0,360,300,100);
	setfillstyle(SOLID_FILL,BLUE);
	fillellipse(getmaxx()/2,getmaxy()/2,300,100);
	char che[7][2]={"C","H","E","N","N","A","I"};
	settextstyle(0,0,13);
	setcolor(YELLOW);
	outtextxy(getmaxx()/2-250,190,che[0]);
	for(int i=1,x=120;i<6;i++,x+=70)
	{
		settextstyle(0,0,7);
		setcolor(YELLOW);
		outtextxy(getmaxx()/2-250+x,230,che[i]);
	}
	outtextxy(getmaxx()/270+x+60,230,che[6]);
	setfillstyle(1,14);
	bar(getmaxx()/2-250+120,getmaxy()/2-40,getmaxx()/2-250+x,getmaxy()/2-30);
	outtextxy(getmaxx()/270+x+60,163,".");
	setfillstyle(1,DARKGRAY);
	setcolor(WHITE);
	bar(0,0,getmaxx(),50);
	settextstyle(6,0,4);
	outtextxy(290,0,"brOS");
	setcolor(BLACK);
	settextstyle(2,0,4);
	printname();
}
void captainamerica()
{
		setcolor(RED);
		setfillstyle(INTERLEAVE_FILL,RED);
		pieslice(getmaxx()/2,getmaxy()/2,0,180,120);
		pieslice(getmaxx()/2,getmaxy()/2,180,360,120);
		setcolor(WHITE);
		setfillstyle(SOLID_FILL,WHITE);
		pieslice(getmaxx()/2,getmaxy()/2,0,360,105);
		setcolor(RED);
		setfillstyle(INTERLEAVE_FILL,RED);
		pieslice(getmaxx()/2,getmaxy()/2,0,360,80);
		pieslice(getmaxx()/2,getmaxy()/2,180,360,80);
		setcolor(BLUE);
		setfillstyle(SOLID_FILL,BLUE);
		pieslice(getmaxx()/2,getmaxy()/2,0,360,60);
		int cx=getmaxx()/2,cy=getmaxy()/2;
		int star[22]={cx,cy-60,cx+15,cy-20,cx+55,cy-20,cx+25,cy+5,cx+40,cy+45,cx,cy+20,cx-40,cy+45,cx-25,cy+5,cx-55,cy-20,cx-15,cy-20,cx,cy-60};
		setcolor(BLACK);
		setfillstyle(SOLID_FILL,WHITE);
		fillpoly(11,star);
		setfillstyle(1,RED);
		setcolor(WHITE);
		bar(0,0,getmaxx(),50);
		settextstyle(6,0,4);
		outtextxy(290,0,"brOS");
		setcolor(LIGHTGRAY);
		settextstyle(2,0,4);
		printname();
}
void minion()
{
	int 	mx=getmaxx(),my=getmaxy();
		setcolor(YELLOW);
		setfillstyle(1,YELLOW);
		bar(mx/2-80,160,mx/2+80,my-120);
		pieslice(mx/2,160,0,180,81);
		setcolor(BLUE);
		setfillstyle(INTERLEAVE_FILL,BLUE);
		pieslice(mx/2,my-120,180,360,81);
		bar(mx/2-40,my-170,mx/2+40,my-120);
		bar(mx/2-80,my-180,mx/2+80,my-160);
		setfillstyle(1,BLACK);
		bar(mx/2-80,180,mx/2+80,190);
		setcolor(LIGHTGRAY);
		setfillstyle(1,LIGHTGRAY);
		pieslice(mx/2,185,0,360,40);
		setcolor(WHITE);
		setfillstyle(1,WHITE);
		pieslice(mx/2,185,0,360,30);
		setcolor(BROWN);
		setfillstyle(1,BROWN);
		pieslice(mx/2,185,0,360,15);
		setcolor(BLACK);
		setfillstyle(1,BLACK);
		pieslice(mx/2,185,0,360,9);
		setcolor(WHITE);
		setfillstyle(1,WHITE);
		pieslice(mx/2-8,180,0,360,2);
		setfillstyle(1,9);
		setcolor(WHITE);
		bar(0,0,getmaxx(),50);
		settextstyle(6,0,4);
		outtextxy(290,0,"brOS");
		setcolor(RED);
		settextstyle(2,0,4);
		printname();
}
void space()
{
	int 	mx=getmaxx(),my=getmaxy();
		setcolor(WHITE);
		randomize();
		for(int i=0;i<1000;i++)
		 putpixel(random(mx),random(my),WHITE);
		setfillstyle(1,GREEN);
		setcolor(BLACK);
		bar(0,0,getmaxx(),50);
		settextstyle(6,0,4);
		outtextxy(290,0,"brOS");
		setcolor(WHITE);
		settextstyle(2,0,4);
		printname();
}
void vm()
{
	int 	mx=getmaxx(),my=getmaxy();
		setcolor(WHITE);
		setfillstyle(1,WHITE);
		pieslice(mx/2,my,0,180,90);
		setcolor(GREEN);
		setfillstyle(INTERLEAVE_FILL,GREEN);
		pieslice(mx/2,my,0,180,60);
		setcolor(WHITE);
		settextstyle(0,0,10);
		outtextxy(120,80,"VIDYA");
		setcolor(GREEN);
		outtextxy(80,180,"MANDIR");
		setcolor(BLACK);
		settextstyle(0,0,3);
		outtextxy(mx/2-22,my-30,"VM");
		setfillstyle(1,WHITE);
		setcolor(BLACK);
		bar(0,0,getmaxx(),50);
		settextstyle(6,0,4);
		outtextxy(290,0,"brOS");
		setcolor(WHITE);
		settextstyle(2,0,4);
		printname();
}
void normal()
{
		setfillstyle(SOLID_FILL,BLUE);
		bar(0,0,getmaxx(),getmaxy());
		setfillstyle(1,9);
		bar(0,0,getmaxx(),50);
		settextstyle(6,0,4);
		setcolor(BLACK);
		outtextxy(290,0,"brOS");
		setcolor(WHITE);
		settextstyle(2,0,4);
		printname();
}
void calcicon()
{
	int 	xcoord,ycoord,size;
		xcoord=350;
		ycoord=120;
		size=40;
		setfillstyle(SOLID_FILL,DARKGRAY);
		bar(xcoord,ycoord,xcoord+size,ycoord+size);
		setlinestyle(SOLID_LINE,0,3);
		setcolor(BLACK);
		setfillstyle(SOLID_FILL,RED);
		bar(xcoord+size/2,ycoord+size/2,xcoord+size,ycoord+size);
		line(xcoord+size/2,ycoord,xcoord+size/2,ycoord+size);
		line(xcoord,ycoord+size/2,xcoord+size,ycoord+size/2);
		settextstyle(6,0,1);
		setcolor(LIGHTGRAY);
		outtextxy(xcoord+4,ycoord-7,"+");
		outtextxy(xcoord+size/2+5,ycoord-7,"-");
		outtextxy(xcoord+6,ycoord+size/2-6,"x");
		setcolor(WHITE);
		outtextxy(xcoord+size/2+5,ycoord+size/2-5,"=");
}
void clockicon()
{
	int	xcoord,ycoord,radius;
		xcoord=268;
		ycoord=140;
		radius=18;
		setlinestyle(1,0,3);
		setcolor(BLACK);
		setfillstyle(1,BLACK);
		bar(xcoord-radius-2,ycoord-20,xcoord+radius+2,ycoord+20);
		setcolor(YELLOW);
		setfillstyle(SOLID_FILL,YELLOW);
		pieslice(xcoord,ycoord,0,360,radius);
		setlinestyle(SOLID_LINE,0,3);
		setcolor(BLACK);
		line(xcoord,ycoord,xcoord+radius/1.7,ycoord+5);
		line(xcoord,ycoord,xcoord-radius/1.5,ycoord+10);
		setcolor(RED);
		setlinestyle(SOLID_LINE,0,1);
		line(xcoord,ycoord,xcoord-5,ycoord-radius+3);
}
void mmicon()
{
       int	xcoord,ycoord,size;
		//CHANGE THE FOLLOWING
		xcoord=350;
		ycoord=220;
		size=40;
		setfillstyle(SOLID_FILL,BROWN);
		bar(xcoord,ycoord,xcoord+size,ycoord+size);
		setcolor(YELLOW);
		settextstyle(2,0,6);
		outtextxy(xcoord+2,ycoord,"????");
		setcolor(BLUE);
		setlinestyle(SOLID_LINE,0,3);
       int	m[10]={xcoord+10,ycoord+size-3,xcoord+10,ycoord+size/2-5,xcoord+size/2,ycoord+size/2+10,xcoord+size-10,ycoord+size/2-5,xcoord+size-10,ycoord+size-3};
		drawpoly(5,m);
}
void calenicon()
{
	int	xcoord,ycoord,size;
		xcoord=150;
		ycoord=120;
		size=40;
		setfillstyle(SOLID_FILL,WHITE);
		bar(xcoord,ycoord,xcoord+size,ycoord+size);
		setfillstyle(SOLID_FILL,RED);
		bar(xcoord,ycoord,xcoord+size,ycoord+size/3);
		setcolor(BLACK);
		setlinestyle(0,0,1);
		rectangle(xcoord,ycoord,xcoord+size,ycoord+size/3);
		settextstyle(2,0,4);
		setcolor(WHITE);
		struct dosdate_t d;
		char date[3];
		char month[12][4] = { "JAN","FEB","MAR","APR","MAY","JUN","JUL","AUG","SEP","OCT","NOV","DEC" };
		_dos_getdate(&d);
		outtextxy(xcoord+size/2-7,ycoord,month[d.month-1]);
		setcolor(BLACK);
		settextstyle(2,0,8);
		if(int(d.day)/10==0)
		{	date[0] = '0';
			date[1] = int(d.day) + 48;
			date[2] = '\0';
		}
		else itoa(int(d.day),date,10);
		outtextxy(xcoord+size/2-13,ycoord+size/2-7,date);
}
void evicon()
{
	int	xcoord,ycoord,size;
		xcoord=450;
		ycoord=220;
		size=40;
		setfillstyle(SOLID_FILL,BLACK);
		bar(xcoord,ycoord,xcoord+size,ycoord+size);
		for(int i=0;i<50;i++)
		   putpixel(random(size-1)+xcoord+1,random(size-1)+ycoord+1,WHITE);
		setfillstyle(SOLID_FILL,GREEN);
		setlinestyle(SOLID_LINE,0,1);
		setcolor(WHITE);
		pieslice(xcoord+size/2,ycoord+size/2,0,180,size/4);
	int	body[10]={xcoord+size/4-5,ycoord+size/2,xcoord+size*3/4+5,ycoord+size/2,xcoord+size*3/4+8,ycoord+size/2+5,xcoord+size/4-8,ycoord+size/2+5,xcoord+size/4-5,ycoord+size/2};
		setfillstyle(1,DARKGRAY);
		fillpoly(5,body);
		settextstyle(2,0,4);
		outtextxy(xcoord+5,ycoord+size-10,"SPACE");
}
void c4icon()
{
	int 	xcoord,ycoord,size;
		xcoord=150;
		ycoord=220;
		size=40;
		setfillstyle(SOLID_FILL,CYAN);
		bar(xcoord,ycoord,xcoord+size,ycoord+size);
		settextstyle(9,0,2);
		outtextxy(xcoord+5,ycoord-5,"C");
		setcolor(BLACK);
		settextstyle(2,0,10);
		outtextxy(xcoord+size/2,ycoord,"4");
}
void noteicon()
{
	int 	xcoord,ycoord,size;
		xcoord=450;
		ycoord=120;
		size=40;
		setfillstyle(SOLID_FILL,LIGHTGRAY);
		bar(xcoord,ycoord,xcoord+size,ycoord+size);
		setfillstyle(SOLID_FILL,YELLOW);
		bar(xcoord,ycoord,xcoord+size,ycoord+size/3-3);
		setlinestyle(0,0,1);
		setcolor(RED);
		line(xcoord+5,ycoord,xcoord+5,ycoord+size);
		line(xcoord,ycoord+size/3-3,xcoord+size,ycoord+size/3-3);
		setcolor(CYAN);
		for(int i=0;i<5;i++) line(xcoord,ycoord+size/3+2+5*i,xcoord+size,ycoord+size/3+2+5*i);
}
void ralleicon()
{
       int 	xcoord,ycoord,size;
		xcoord=250;
		ycoord=220;
		size=40;
		setfillstyle(INTERLEAVE_FILL,GREEN);
		bar(xcoord,ycoord,xcoord+size,ycoord+size);
       int 	handle[10]={xcoord+size/2-5,ycoord+size/2+12,xcoord+2*size/3-2,ycoord+2*size/5,xcoord+2*size/3+2,ycoord+2*size/5,xcoord+size/2-3,ycoord+size/2+15,xcoord+size/2-5,ycoord+size/2+12};
		setfillstyle(SOLID_FILL,BROWN);
		setcolor(BROWN);
		fillpoly(5,handle);
		setcolor(BLACK);
		drawpoly(5,handle);
		circle(xcoord+size/3,ycoord+size/4,4);
		setfillstyle(SOLID_FILL,RED);
		fillellipse(xcoord+2*size/3,ycoord+2*size/5,10,12);
		ellipse(xcoord+2*size/3,ycoord+2*size/5,0,360,10,12);
		setfillstyle(SOLID_FILL,WHITE);
		setcolor(WHITE);
		pieslice(xcoord+size/3,ycoord+size/4,0,360,4);
		setcolor(BLACK);
		circle(xcoord+size/3,ycoord+size/4,4);
}
void lucky()
{
	int 	xcoord,ycoord,size;
		xcoord=getmaxx()/2-80;
		ycoord=312;
		setfillstyle(SOLID_FILL,WHITE);
		settextstyle(2,0,6);
		bar(xcoord,ycoord,xcoord+160,ycoord+40);
		setcolor(BLACK);
		outtextxy(xcoord+13,ycoord+9,"FEELING LUCKY?");
}
void setting()
{
	int 	xcoord,ycoord,size;
		xcoord=getmaxx()/2-60;
		ycoord=372;
		setfillstyle(SOLID_FILL,DARKGRAY);
		settextstyle(2,0,6);
		bar(xcoord,ycoord,xcoord+120,ycoord+40);
		setcolor(BLACK);
		outtextxy(xcoord+22,ycoord+9,"SETTINGS");
}
void officon()
{
	int 	xcoord,ycoord,size;
		xcoord=getmaxx()/2-30;
		ycoord=getmaxy()-50;
		setfillstyle(SOLID_FILL,RED);
		bar(xcoord,ycoord,xcoord+60,ycoord+30);
		setcolor(WHITE);
		settextstyle(2,0,6);
		outtextxy(xcoord+17,ycoord+5,"OFF");
}
int setting_menu()
{
	i.x.ax=3;
	int86(0x33,&i,&o);
	int cx=o.x.cx,dx=o.x.dx,bx=o.x.bx;
	if(bx==1)
	{
		if(cx>getmaxx()/2-120&&dx>160&&cx<getmaxx()/2-90&&dx<210) return 1;
		if(cx>getmaxx()/2+90&&dx>160&&cx<getmaxx()/2+120&&dx<210) return 2;
		if(cx>getmaxx()/2-120&&dx>320&&cx<getmaxx()/2-90&&dx<370) return 3;
		if(cx>getmaxx()/2+90&&dx>320&&cx<getmaxx()/2+120&&dx<370) return 4;
		if(cx>getmaxx()/2-80&&dx>getmaxy()-50&&cx<getmaxx()/2+80&&dx<getmaxy()-20) return 0;
	}
	return 6;
}
int input_menu()
{
	randomize();
	i.x.ax=3;
	int86(0x33,&i,&o);
	int cx=o.x.cx,dx=o.x.dx,bx=o.x.bx;
	if(bx==1)
	{
		if(dx>120&&dx<160)
		{
		  if(cx>150&&cx<190) return 1;
		    else if(cx>250&&cx<290) return 2;
			   else if(cx>350&&cx<390) return 3;
				   else if(cx>450&&cx<490) return 4;
		}
		else if(dx>220&&dx<260)
		{
		  if(cx>150&&cx<190) return 5;
		    else if(cx>250&&cx<290) return 6;
			   else if(cx>350&&cx<390) return 7;
				   else if(cx>450&&cx<490) return 8;
		}
		if(cx>290&&cx<350&&dx>430&&dx<460) return 0;
		if(cx>260&&cx<380&&dx>372&&dx<412) return 9;
		if(cx>240&&cx<400&&dx>312&&dx<342) return random(1000)%4+1;
	}
	return 24;
}
void settingmenu()
{
		i.x.ax=2;
		int86(0x33,&i,&o);
		setfillstyle(SOLID_FILL,DARKGRAY);
		for(int a=0; a<=getmaxy(); a+=2)
		{
			bar(0,a,getmaxx(),a+getmaxy()/30);
			delay(6);
		}
		delay(100);
		setcolor(BLACK);
		settextstyle(2,0,8);
		setfillstyle(SOLID_FILL,WHITE);
		bar(0,0,getmaxx(),40);
		outtextxy(getmaxx()/2-58,6,"SETTINGS");
		outtextxy(getmaxx()/2-72,85,"WALLPAPERS");
		setlinestyle(0,0,3);
		line(getmaxx()/2-150,115,getmaxx()/2+150,115);
		setfillstyle(SOLID_FILL,LIGHTGRAY);
		bar(getmaxx()/2-80,160,getmaxx()/2+80,210);
		bar(getmaxx()/2-120,160,getmaxx()/2-90,210);
		bar(getmaxx()/2+90,160,getmaxx()/2+120,210);
		setcolor(WHITE);
		settextstyle(2,0,9);
		outtextxy(getmaxx()/2-110,166,"<");
		outtextxy(getmaxx()/2+100,166,">");
		setcolor(BLACK);
		settextstyle(2,0,8);
		outtextxy(getmaxx()/2-110,245,"LOADING SCREENS");
		setlinestyle(0,0,3);
		line(getmaxx()/2-150,275,getmaxx()/2+150,275);
		bar(getmaxx()/2-80,320,getmaxx()/2+80,370);
		bar(getmaxx()/2-120,320,getmaxx()/2-90,370);
		bar(getmaxx()/2+90,320,getmaxx()/2+120,370);
		setcolor(WHITE);
		settextstyle(2,0,9);
		outtextxy(getmaxx()/2-110,326,"<");
		outtextxy(getmaxx()/2+100,326,">");
		setfillstyle(SOLID_FILL,RED);
		bar(getmaxx()/2-80,getmaxy()-50,getmaxx()/2+80,getmaxy()-20);
		setcolor(WHITE);
		settextstyle(2,0,6);
		outtextxy(getmaxx()/2-62,getmaxy()-45,"SAVE AND EXIT");
		settextstyle(2,0,8);
		outtextxy(getmaxx()/2-strlen(wallpapers[wallno])*7,170,wallpapers[wallno]);
		outtextxy(getmaxx()/2-strlen(loadings[loadno])*7,330,loadings[loadno]);
		i.x.ax=1;
		int86(0x33,&i,&o);
	int   	x=6;
		while(x)
		{
			x=setting_menu();
			switch(x)
			{
				case 1: if(wallno!=0) wallno--;
					  else wallno=6;
					setfillstyle(1,LIGHTGRAY);
					setcolor(WHITE);
					settextstyle(2,0,8);
					bar(getmaxx()/2-80,160,getmaxx()/2+80,210);
					outtextxy(getmaxx()/2-strlen(wallpapers[wallno])*7,170,wallpapers[wallno]);
					delay(250);
					break;
				case 2: if(wallno!=6) wallno++;
					  else wallno=0;
					setfillstyle(1,LIGHTGRAY);
					setcolor(WHITE);
					settextstyle(2,0,8);
					bar(getmaxx()/2-80,160,getmaxx()/2+80,210);
					outtextxy(getmaxx()/2-strlen(wallpapers[wallno])*7,170,wallpapers[wallno]);
					delay(250);
					break;
				case 3: if(loadno!=0) loadno--;
					  else loadno=6;
					setfillstyle(1,LIGHTGRAY);
					setcolor(WHITE);
					settextstyle(2,0,8);
					bar(getmaxx()/2-80,320,getmaxx()/2+80,370);
					outtextxy(getmaxx()/2-strlen(loadings[loadno])*7,330,loadings[loadno]);
					delay(250);
					break;
				case 4: if(loadno!=6) loadno++;
					  else loadno=0;
					setfillstyle(1,LIGHTGRAY);
					setcolor(WHITE);
					settextstyle(2,0,8);
					bar(getmaxx()/2-80,320,getmaxx()/2+80,370);
					outtextxy(getmaxx()/2-strlen(loadings[loadno])*7,330,loadings[loadno]);
					delay(250);
					break;
				case 0: delay(250);break;
			}
		}
}
void printh()
{
		i.x.ax = 0;
		int86(0x33,&i,&o);
		i.x.ax = 2;
		cleardevice();
		switch(wallno)
		{
			case 1:minion();break;
			case 2:batman();break;
			case 3:captainamerica();break;
			case 4:vm();break;
			case 5:space();break;
			case 6:chennai();break;
			default:normal();break;
		}
		calcicon();
		clockicon();
		calenicon();
		noteicon();
		officon();
		lucky();
		setting();
		delay(100);
		i.x.ax=0;
		int86(0x33,&i,&o);
		i.x.ax=1;
		int86(0x33,&i,&o);
}
void screen()
{
		int app;
		printh();
		do{
			app = input_menu();
			switch(app)
			{	case 1: loads(); calendar(); refresh(); break;
				case 2: loads(); clock(); refresh(); break;
				case 3: loads(); broscalc(); refresh(); break;
				case 4: loads(); initeditor(); refresh(); break;
				case 9: settingmenu(); printh(); break;
			}
			if((app>=1&&app<=4)||app==9)
			{	 printh();
				 printh();
			}
		}while(app);
}