int ttf = 1, wl = 1, ran, score; float m, c;
void ttmenu();
void ttdraw();
void menup();
class ballpar
{	protected: int x;
		   int y;
		   int dir;
	public: void drawball(int);
};
class Ball:public ballpar
{       public: int paths[7][2];
		void moveball(int&,int&,int,int,int);
		void path()
		{	paths[0][0] = getmaxx()/2-212; paths[0][1] = getmaxy()/2-126;
			paths[1][0] = getmaxx()/2-222; paths[1][1] = getmaxy()/2-93;
			paths[2][0] = getmaxx()/2-232; paths[2][1] = getmaxy()/2-45;
			paths[3][0] = getmaxx()/2-234; paths[3][1] = getmaxy()/2;
			paths[4][0] = getmaxx()/2-232; paths[4][1] = getmaxy()/2+45;
			paths[5][0] = getmaxx()/2-222; paths[5][1] = getmaxy()/2+93;
			paths[6][0] = getmaxx()/2-212; paths[6][1] = getmaxy()/2+126;
		}
}ball;
void ballpar::drawball(int r)
{	pieslice(x,y,0,360,r);
}
void Ball::moveball(int &d, int &colb, int xp = -1, int yp = -1, int rb = 3)
{       char b[20];
	delay(1.5);//2or3
	if(xp!=-1) x = xp;
	else x = getmaxx()/2 + 94;
	if(yp!=-1) y = yp;
	else y = getmaxy()/2;
	dir = d;
	drawball(rb);
	if((getpixel(x-5,y)==RED&&dir==1)||(colb==0&&x<=ball.paths[ran][0])){ dir = d = -1; if(colb==0&&getpixel(x-5,y)==RED) wl = 0; else if(colb==1) score++; else if(colb==2) score+=2; /*ttdraw();*/ }
	if(getpixel(x+5,y)==RED&&dir==-1){ dir = d = 1; /*ttdraw();*/ colb = random(1000)%3; }
	if(x<ball.paths[ran][0]-10&&wl>=1){ wl--; sound(1000); delay(10); nosound(); }
	setfillstyle(SOLID_FILL,YELLOW);
	bar(getmaxx()-90,30,getmaxx(),60);
	setcolor(BLACK);
	itoa(score,b,10);
	outtextxy(getmaxx()-45-strlen(b)*7,30,b);
}
void racket(int r, int a, int col)
{	setcolor(col);
	for(int ra = r; ra<=r+3; ra++)
	{	arc(getmaxx()/2+130,getmaxy()/2,a,a+4,ra);
	}
	if(col==4) setcolor(BROWN);
	else setcolor(GREEN);
	for(ra = r+1; ra<=r+2; ra++) arc(getmaxx()/2+130,getmaxy()/2,a+4,a+6,ra);
}
void ttdraw()
{	setfillstyle(SOLID_FILL,GREEN);
	bar(0,0,getmaxx(),getmaxy());
	setfillstyle(SOLID_FILL,BLUE);
	bar(getmaxx()/2-190,getmaxy()/2-145,getmaxx()/2+190,getmaxy()/2+145);
	setcolor(WHITE);
	setlinestyle(0,0,3);
	rectangle(getmaxx()/2-188,getmaxy()/2-143,getmaxx()/2+189,getmaxy()/2+144);
	setcolor(LIGHTGRAY);
	line(getmaxx()/2,getmaxy()/2-145,getmaxx()/2,getmaxy()/2+145);
	setfillstyle(SOLID_FILL,YELLOW);
	bar(getmaxx()-90,0,getmaxx(),60);
	setcolor(BLACK);
	settextstyle(2,0,6);
	outtextxy(getmaxx()-70,2,"Score");
	setfillstyle(SOLID_FILL,RED);
	setcolor(RED);
	pieslice(getmaxx()/2+130,getmaxy()/2,120,240,30);
	setfillstyle(SOLID_FILL,BLACK);
	setcolor(BLACK);
	pieslice(getmaxx()/2+130,getmaxy()/2,0,360,20);
	setcolor(YELLOW);
	pieslice(getmaxx()/2+130,getmaxy()/2,0,360,5);
}
class hs
{	public: char n[11];
		int s;
}ralh[6];
void highscore()
{
	fstream f;
	f.open("HSRAL",ios::in|ios::binary);
	hs r;
	f.read((char*)&r,sizeof(r)); int i = 0;
	while(!f.eof()&&i<5)
	{	ralh[i] = r;
		i++;
		f.read((char*)&r,sizeof(r));
	}
	f.close();
	hs t;
	for(int j = 1; j < 6; j++)
	{	t = ralh[j];
		int k = j - 1;
		while(k>=0&&t.s>ralh[k].s)
		{	ralh[k+1] = ralh[k]; k--;
		}
		ralh[k+1] = t;
	}
	f.open("HSRAL",ios::out|ios::binary);
	f.write((char*)&ralh[0],(5)*sizeof(ralh[0]));
	f.close();
}
void hscores()
{       initmouse(); i.x.ax = 2;
	cleardevice();
	fstream f;
	f.open("HSRAL",ios::in);
	int i = 0, x = getmaxx()/2-143, y = getmaxy()/2-40;
	hs a;
	char sl[10];
	settextstyle(3,0,1);
	setcolor(GREEN);
	outtextxy(x,y-20,"NAME");
	setcolor(RED);
	outtextxy(x+220,y-20,"SCORE");
	setcolor(WHITE);
	f.read((char*)&a,sizeof(a));
	while(i<5)
	{	outtextxy(x, y, a.n);
		outtextxy(x+220, y, itoa(a.s,sl,10));
		y+=20;
		f.read((char*)&a,sizeof(a));
		i++;
	}
	f.close();
	settextstyle(2,0,5);
	outtextxy(getmaxx()/2-80,getmaxy()-40,"Press ENTER to return");
	do
	{	i = getch();
	}while(i!=13);
}
void rules()
{
	initmouse();
	i.x.ax = 2;
	char rule[6][100] = { "1. Press enter to begin/end playing.", "2. Use up and down arrows to move the racket.", "3. Hit white balls to increase score by 1.", "4. Hit pink balls to increase score by 2.", "5. Do not hit the black 'gravity' balls.", "6. If you miss, you're out!"};
	setfillstyle(SOLID_FILL,BLACK);
	setcolor(WHITE);
	bar(0,0,getmaxx(),getmaxy());
	settextstyle(3,0,1);
	outtextxy(30,40,"Rules");
	line(29,61,65,61);
	for(int i = 0, y = 66; i < 6; i++)
	{	outtextxy(30, y,rule[i]);
		y+=25;
	}
	int kb;
	do
	{	kb = getch();
	}while(kb!=13);
}
void racketmove()
{
	wl = 1;
	int i, am = 180, db = 1, xb, yb, colb=1;
	int colorb[3] = { 0, 15, 13};
	xb = getmaxx()/2+94;
	yb = getmaxy()/2;
	racket(370,180,4);
	int kb;
	do
	{      kb = getch();
	}while(kb!=13);
	while(wl!=0)
	{
		setcolor(WHITE);
		setlinestyle(0,0,3);
		rectangle(getmaxx()/2-188,getmaxy()/2-143,getmaxx()/2+189,getmaxy()/2+144);
		setcolor(LIGHTGRAY);
		line(getmaxx()/2,getmaxy()/2-145,getmaxx()/2,getmaxy()/2+145);
		if(kbhit()) i = getch();
		else i = 0;
		if(i==72&&am>=156)
		{       racket(370,am,2);
			racket(370, am-2,4);
			am-=2;
		}
		else if(i==80&&am<=200)
		{       racket(370,am,2);
			racket(370,am+2,4);
			am+=2;
		}
		if((xb==-1&&yb==-1&&db==1))
		{       setfillstyle(SOLID_FILL,colorb[colb]); setcolor(colorb[colb]);
			ball.moveball(db,colb);
			ran = random(7);
		}
		else
		{
			switch(ran)
			{	case 0: m = 0.412; c = 69.43; break;
				case 1: m = 0.294; c = 118.28; break;
				case 2: m = 0.138; c = 182.87; break;
				case 3: m = 0.000; c = 240.00; break;
				case 4: m = -0.138; c = 115+182.87; break;
				case 5: m = -0.294; c = 244+118.28; break;
				case 6: m = -0.412; c = 344+69.43; break;
			}
			xb = xb - 2*db;
			yb = m*xb + c;
			setfillstyle(SOLID_FILL,colorb[colb]); setcolor(colorb[colb]);
			ball.moveball(db,colb,xb,yb);
			if(xb>=getmaxx()/2-188)
			{	setfillstyle(SOLID_FILL,BLUE); setcolor(BLUE);
			}
			else
			{	setcolor(GREEN); setfillstyle(SOLID_FILL,GREEN);
			}
			xb+=2*db;
			yb = m*xb + c;
			ball.moveball(db,colb,xb,yb);
			racket(370,am,4);
			if(xb<=getmaxx()/2-185)
			{        setfillstyle(SOLID_FILL,GREEN);
				 bar(getmaxx()/2-194,getmaxy()/2-150,getmaxx()/2-189,getmaxy());
				 setfillstyle(SOLID_FILL,BLUE);
				 bar(getmaxx()/2-186,getmaxy()/2-140,getmaxx()/2-179,getmaxy()/2+143);
			}
			else if(xb>=getmaxx()/2+90)
			{	setfillstyle(SOLID_FILL,RED);
				setcolor(RED);
				pieslice(getmaxx()/2+130,getmaxy()/2,120,240,30);
				setfillstyle(SOLID_FILL,BLACK);
				setcolor(BLACK);
				pieslice(getmaxx()/2+130,getmaxy()/2,0,360,20);
				setcolor(YELLOW);
				pieslice(getmaxx()/2+130,getmaxy()/2,0,360,5);
			}
			setfillstyle(SOLID_FILL,BLUE);
			bar(getmaxx()/2+83,getmaxy()/2-10,getmaxx()/2+99,getmaxy()/2+10);
			xb-=2*db;
			yb = m*xb + c;
			setfillstyle(SOLID_FILL,colorb[colb]); setcolor(colorb[colb]);
			ball.moveball(db,colb,xb,yb);
			if(xb>=getmaxx()/2+90&&db==-1)
			{	xb = getmaxx()/2+94;
				yb = getmaxy()/2;
				ran = random(7);
			}
		}

	}
	delay(1000);
	settextstyle(9,0,1);
	setcolor(RED);
	setfillstyle(SOLID_FILL,BLACK);
	int lax;
	do
	{	lax = getch();
	}while(lax!=13);
	bar(0,0,getmaxx(),getmaxy());
	outtextxy(getmaxx()/2-94,getmaxy()/2-100,"GAME OVER");
	ifstream f;
	f.open("HSRAL",ios::in|ios::binary);
	hs r;
	f.read((char*)&r,sizeof(r)); int fi = 0;
	while(!f.eof()&&fi<5)
	{	ralh[fi] = r;
		fi++;
		f.read((char*)&r,sizeof(r));
	}
	settextstyle(2,0,6);
	if(ralh[4].s<score)
	{	outtextxy(getmaxx()/2-200,getmaxy()/2+100,"HIGH SCORE! Enter your name:");
		char a; int c = 0;
		do
		{	a = getch();
			if((a>='a'&&a<='z')||(a>='A'&&a<='Z'))
			{	if(c!=10){
				ralh[5].n[c] = a;
				c++;
				ralh[5].n[c] = '\0';
				outtextxy(getmaxx()/2+100,getmaxy()/2+100,ralh[5].n);
			       }
			}
			else if(a==8&&c!=0)
			{       c--;
				ralh[5].n[c] = '\0';
				bar(getmaxx()/2+98,getmaxy()/2+98,getmaxx(),getmaxy()/2+140);
				outtextxy(getmaxx()/2+100,getmaxy()/2+100,ralh[5].n);
			}
		}while(a!=13);
	}
	else
	{
		strcpy(ralh[5].n," ");
		outtextxy(getmaxx()/2-58,getmaxy()/2+50,"Press ENTER");
		int a;
		do
		{	a = getch();
		}while(a!=13);
	}
	ralh[5].s = score;
	highscore();
}
void playtt()
{       delay(100);
	ttdraw();
	score = 0;
	racketmove();
	menup();
	initmouse();
	showmouseptr();
}
void menup()
{
	setfillstyle(SOLID_FILL,BLUE);
	bar(0,0,getmaxx(),getmaxy());
	setfillstyle(SOLID_FILL,GREEN);
	bar(getmaxx()/2-130,getmaxy()/2-90,getmaxx()/2+110,getmaxy()/2-40);
	setfillstyle(SOLID_FILL,CYAN);
	bar(getmaxx()/2-130,getmaxy()/2-10,getmaxx()/2+110,getmaxy()/2+40);
	setfillstyle(SOLID_FILL,MAGENTA);
	bar(getmaxx()/2-130,getmaxy()/2+70,getmaxx()/2+110,getmaxy()/2+120);
	setfillstyle(SOLID_FILL,RED);
	bar(getmaxx()/2-130,getmaxy()/2+150,getmaxx()/2+110,getmaxy()/2+200);
	setcolor(YELLOW);
	settextstyle(10,0,6);
	outtextxy(getmaxx()/2-130,getmaxy()/2-227,"Rall-E");
	settextstyle(9,0,2);
	outtextxy(getmaxx()/2-45,getmaxy()/2-6,"Rules");
	outtextxy(getmaxx()/2-40,getmaxy()/2-88,"Play");
	outtextxy(getmaxx()/2-100,getmaxy()/2+74,"High Scores");
	outtextxy(getmaxx()/2-41,getmaxy()/2+152,"Exit");
}
void ttmenu()
{	menup();
	showmouseptr();
	int tmx, tmy, tmb;
	do
	{	click(&tmx,&tmy,&tmb);
	}while((tmb&1)!=1);
	if((tmb&1)==1)
	{	if(tmx>=getmaxx()/2-120&&tmx<=getmaxx()/2+120)
			if(tmy>=getmaxy()/2+150&&tmy<=getmaxy()/2+200) ttf = 0;
			else if(tmy>=getmaxy()/2-90&&tmy<=getmaxy()/2-40){initmouse(); i.x.ax = 2; playtt();}
			else if(tmy>=getmaxy()/2+70&&tmy<=getmaxy()/2+120) hscores();
			else if(tmy>=getmaxy()/2-10&&tmy<=getmaxy()/2+40) rules();
	}
}
void ralle()
{
	score = 0;
	cleardevice();
	randomize();
	ball.path();
	menup();
	initmouse();
	menup();
	while(ttf!=0)
	{
		ttmenu();
	}
	ttf = 1; wl = 1;
}