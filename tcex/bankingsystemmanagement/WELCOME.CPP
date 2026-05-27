void loadingb()
  {
	  setcolor(WHITE);
	  for(int i=35;i<555;i++)
	  {
	  line(25+i,430,25+i,460);
	    }
    for(i=35;i<555;i++)
      {
      setcolor(GREEN);
      line(25+i,430,25+i,460);
      delay(3);
      setcolor(BLACK);//TEXT COLOR
      settextstyle(SMALL_FONT,HORIZ_DIR,8);
      outtextxy(266,430,"LOADING");
      delay(3);
      }
      closegraph();
  }
void welcome()
{
   int gdriver = DETECT, gmode, errorcode;
   initgraph(&gdriver, &gmode, "C:\\tc\\bgi");
   settextstyle(7,HORIZ_DIR,9);
   for(int c=5;c<90;c+=5)
    {
    setcolor(14);
    outtextxy(1+c,1+c, "$");
    delay(30);
    if(c<85)
    {
     setcolor(BLACK);
     outtextxy(1+c,1+c, "$");
     }
    }
   settextstyle(7,HORIZ_DIR,5);
   for(c=10;c<130;c+=10)
     {
      setcolor(12);
      outtextxy(135,20+c,"H");
      delay(30);
      if(c<120)
	{
	 setcolor(BLACK);
	 outtextxy(135,20+c, "H");
	}
      }
   for(c=10;c<130;c+=10)
     {
      setcolor(12);
      outtextxy(165,20+c,"A");
      delay(30);
      if(c<120)
	{
	 setcolor(BLACK);
	 outtextxy(165,20+c, "A");
	}
      }
   for(c=10;c<130;c+=10)
     {
      setcolor(12);
      outtextxy(195,20+c,"K");
      delay(30);
      if(c<120)
	{
	 setcolor(BLACK);
	 outtextxy(195,20+c, "K");
	}
      }
   for(c=10;c<130;c+=10)
     {
      setcolor(12);
      outtextxy(230,20+c,"T");
      delay(30);
      if(c<120)
	{
	 setcolor(BLACK);
	 outtextxy(230,20+c,"T");
	}
      }
   for(c=10;c<130;c+=10)
     {
      setcolor(12);
      outtextxy(250,20+c,"I");
      delay(30);
      if(c<120)
	{
	 setcolor(BLACK);
	 outtextxy(250,20+c,"I");
	}
      }
   settextstyle(7,HORIZ_DIR,9);
   for(c=100;c>5;c-=5)
    {
    setcolor(14);
    outtextxy(300-c,200+c, "á");
    delay(30);
    if(c>10)
    {
     setcolor(BLACK);
     outtextxy(300-c,200+c, "á");
     }
    }
   settextstyle(7,HORIZ_DIR,5);
   for(c=100;c>5;c-=5)
     {
      setcolor(12);
      outtextxy(355,250+c,"A");
      delay(20);
      if(c>10)
	{
	 setcolor(BLACK);
	 outtextxy(355,250+c,"A");
	}
      }
   for(c=100;c>5;c-=5)
     {
      setcolor(12);
      outtextxy(385,250+c,"N");
      delay(20);
      if(c>10)
	{
	 setcolor(BLACK);
	 outtextxy(385,250+c,"N");
	}
      }
   for(c=100;c>5;c-=5)
     {
      setcolor(12);
      outtextxy(415,250+c,"K");
      delay(20);
      if(c>10)
	{
	 setcolor(BLACK);
	 outtextxy(415,250+c,"K");
	}
      }
   loadingb();
   closegraph();
}