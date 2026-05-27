void dot()
{
		setcolor(BLUE);
		setfillstyle(SOLID_FILL,BLUE);
}
void dott()
{
		setcolor(WHITE);
		setfillstyle(SOLID_FILL,WHITE);
}
void adot(int x, int y)
{
	dot();
	pieslice(x,y,0,360,3);
	delay(80);
	dott();
	pieslice(x+1,y,0,360,1);
	delay(110);
}
void b()
{       int xc = 150;
		for(int i = 175; i < 291; i+=10)
			adot(xc,i);
	int x = xc+8, y = i-10;
		adot(x,y);
		adot(x+=9,y-=5);
		adot(x+=8,y-=6);
		adot(x+=7,y-=7);
		adot(x+=6,y-=8);
		adot(x, y-=9);
		adot(x-=6,y-=8);
		adot(x-=7,y-=7);
		adot(x-=8,y-=6);
		adot(x-=9,y-=4);
}
void r()
{       int xc = 210, yc = 233;
		adot(xc,yc);
		adot(xc+=7,yc+=7);
	int retx = xc, rety = yc;
		adot(xc+=6,yc+=7);
		for(yc += 10; yc < 291; yc += 9)
			adot(xc,yc);
		adot(retx+=14,rety);
		adot(retx+=8,rety-=6);
		adot(retx+=10,rety);
		adot(retx+=10,rety);
}
void O()
{	setcolor(YELLOW);
	setfillstyle(SOLID_FILL,YELLOW);
	for(int i = 0; i < 60; i+=2)
	{	pieslice(345,228,0,360,i);
		delay(90);
	}
	setcolor(BLACK);
	setfillstyle(SOLID_FILL,BLACK);
	pieslice(323,218,0,360,11);
	bar(327,217,363,219);
	pieslice(367,218,0,360,11);
	bar(325,257,365,259);
}
void S()
{	int xc = 495, yc = 187;
		adot(xc,yc);
		adot(xc-=7,yc-=7);
		adot(xc-=8,yc-=6);
		adot(xc-=9,yc-=5);
		adot(xc-=9,yc);
		adot(xc-=9,yc+=5);
		adot(xc-=8,yc+=6);
		adot(xc-=7,yc+=7);
		adot(xc-=5,yc+=8);
		for(;xc<485;xc++)
		      adot(xc+=6,yc+=9);
		adot(xc-=7,yc+=7);
		adot(xc-=8,yc+=6);
		adot(xc-=9,yc+=5);
		adot(xc-=9,yc);
		adot(xc-=9,yc-=5);
		adot(xc-=8,yc-=6);
		adot(xc-=7,yc-=7);
		adot(xc-=5,yc-=8);
}
void rks()
{	b();
	r();
	S();
	O();
}
void brosn()
{
		delay(1000);
		rks();
}