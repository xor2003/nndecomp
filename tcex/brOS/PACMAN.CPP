void pac()
{
	int	size1,size2,size3;
	int 	y=getmaxy()/2;
	cleardevice();
		settextstyle(0,0,4);
	void 	*p1,*p2,*p3;
		setcolor(YELLOW);
		setfillstyle(1,YELLOW);
		pieslice(getmaxx()/2,getmaxy()/2,40,320,50);
		size1=imagesize(getmaxx()/2-51,getmaxy()/2-51,getmaxx()/2+51,getmaxy()/2+51);
		p1=malloc(size1);
		getimage(getmaxx()/2-51,getmaxy()/2-51,getmaxx()/2+51,getmaxy()/2+51,p1);
	cleardevice();
		pieslice(getmaxx()/2,getmaxy()/2,0,360,50);
		size2=imagesize(getmaxx()/2-51,getmaxy()/2-51,getmaxx()/2+51,getmaxy()/2+51);
		p2=malloc(size2);
		getimage(getmaxx()/2-51,getmaxy()/2-51,getmaxx()/2+51,getmaxy()/2+51,p2);
	cleardevice();
		setcolor(WHITE);
		outtextxy(getmaxx()/2+40,getmaxy()/2-10,"++");
		setcolor(BLACK);
		setfillstyle(SOLID_FILL,BLACK);
		for(int x=2;x<=getmaxx()/2+55;x+=2)
		{
			pieslice(x-2,y,0,360,50);
			if(x%20<10)putimage(x-51,y-51,p1,XOR_PUT);
			  else putimage(x-51,y-51,p2,XOR_PUT);
			if(x==300) delay(500);
			delay(20);
		}
		settextstyle(0,0,10);
		setcolor(WHITE);
		outtextxy(105,210,"b");
		outtextxy(200,210,"r");
		outtextxy(465,210,"S");
		delay(500);
		setcolor(BLACK);
		for(;x!=getmaxx()/2-1;x+=2)
		{
			pieslice(x-2,getmaxy()/2,0,360,50);
			if(x==getmaxx()-1) x=48;
			if(x%20<10)putimage(x-51,y-51,p1,XOR_PUT);
			  else putimage(x-51,y-51,p2,XOR_PUT);
			delay(20);
		}
		for(int i=0;i<52;i++)
		{
			 setcolor(BLACK);
			 setfillstyle(SOLID_FILL,BLACK);
			 pieslice(x-2,getmaxy()/2,0,360,i);
			 delay(15);
		}
}