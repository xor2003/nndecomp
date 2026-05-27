#define KILL dead1,dead2,dead3

class high
{
	 public:	char hey[10];
			int  hey_score;
			void waf();
			void sort();
			void war();
			high()
			{
				 strcpy(hey,"NULL");
				hey_score=0;
			}
	       void pri();


}hio[100],ob;
void high::waf()
{

     fstream f("highne.txt",ios::binary|ios::out);
     for(int i=0;i<100;i++)
     {
	    f.write((char*)&hio[i],sizeof(hio[i]));

     }
     f.close();


}
void high::war()
{
     fstream f("highne.txt",ios::binary|ios::in);
     int i=0;
     while(f)
     {
	   f.read((char*)&ob,sizeof(ob));

	    hio[i].hey_score=ob.hey_score;
	   strcpy(hio[i].hey,ob.hey);
	   i++;

     } f.close();


}
void high::sort()
{
	for(int i=0;i<100;i++)
		for(int j=0;j<100-1-i;j++)
			if(hio[j].hey_score < hio[j+1].hey_score)
			{
			      high t=hio[j];
			      hio[j]=hio[j+1];
			      hio[j+1]=t;
			}


}
void high::pri()
{
       hio[0].sort(); int op= 150;char dummy1[20],dummy2[20];
       outtextxy(80+100,125,"NAME");
       outtextxy(80+200+100,125,"SCORE");
       for(int i=0;i<10 && hio[i].hey_score!=0;i++)
       {
		setcolor(15);
		itoa(i+1,dummy1,10);
		outtextxy(80,op,dummy1);
		outtextxy(80+30,op,".");
		outtextxy(80+100,op,hio[i].hey);
		itoa(hio[i].hey_score,dummy2,10);
		outtextxy(80+200+100,op,dummy2);
		op+=20;

       }
       outtextxy(80,op+50,"To revert back press any key");
}

void usercraft();
void enemycraft_1_kill(int,int);
void enemycraft_2_kill(int ,int );
void enemycraft_3_kill(int ,int );
void scoreboard();
void boss();

int curx_1=305,cury_1=360+40,curx_2=255,cury_2=400+1,curx_3=355,cury_3=405+1;
int dead1=1,dead2=1,dead3=1;
int y1=200,y2=180;
int hell;int kell;
int xell[1000],yell[1000];
int scorefs=0;
int e1_x=120,e2_x=635/2,e3_x=540-30,e1_y=100+18,e2_y=100+18,e3_y=100+18;
int e1b1_y=146,e2b2_y=152,e3b3_y=146,e1b1_x=270,e2b2_x=318,e3b3_x=365;
int bad1=120,bad2=635/2,bad3=540-30;
int flagell=1,lol;
int shift1,shift2,shift3;
int checklev=1;
int oell=3;
int iell=1;
int lo=1;
int ha=3;
int check1=0;
int check3=0;
char Jeev[4]={3,3,3};
char Jeev1[4]={3,3,3};
char ch[4]={3,3,3,0};
char ch1[4]={3,3,3,0};
char d_score[20];
char ka[1];
char nag[20];
void black()
{
      setfillstyle(1,0);
      setcolor(0);
      pieslice(curx_1,cury_1,0,360,30);
      bar(curx_1-4,cury_1-40,curx_1+4,cury_1-30);

}

void shoot(int k)
{

	setcolor(0);
	line(k,y1,k,y2);

	setcolor(15);
	y1-=40;
	y2-=40;
	line(k,y1,k,y2);
	if(checklev==1)
	{
		enemycraft_1_kill(k,y2);
	}
		else  	if(checklev==2)
			{
				enemycraft_2_kill(k,y2);
			}
			else 	if(checklev==3)
				{
					enemycraft_3_kill(k,y2);


				}
	delay(200);

}

void modr_usercraft()
{

	black();

	curx_1+=40;
	setfillstyle(1,8);
	setcolor(8);
	pieslice(curx_1,cury_1,0,360,30);
	setfillstyle(1,GREEN);
	setcolor(GREEN);
	pieslice(curx_1,cury_1,0,360,15);
	setcolor(15);
	circle(curx_1,cury_1,15);
	setfillstyle(1,RED);
	bar(curx_1-4,cury_1-40,curx_1+4,cury_1-30);

}

void modl_usercraft()
{
	black();

	curx_1-=40;
	setfillstyle(1,8);
	setcolor(8);
	pieslice(curx_1,cury_1,0,360,30);
	setfillstyle(1,GREEN);
	setcolor(GREEN);
	pieslice(curx_1,cury_1,0,360,15);
	setcolor(15);
	circle(curx_1,cury_1,15);
	setfillstyle(1,RED);
	bar(curx_1-4,cury_1-40,curx_1+4,cury_1-30);

}

void enemycraft_1()
{
	setfillstyle(1,RED);
	setcolor(RED);
	pieslice(120,100,0,360,15);
	setfillstyle(1,GREEN);
	setcolor(GREEN);
	pieslice(120,100,0,360,4);
	setcolor(15);
	circle(120,100,4);

	setfillstyle(1,RED);
	setcolor(RED);
	pieslice(635/2,100,0,360,15);
	setfillstyle(1,GREEN);
	setcolor(GREEN);
	pieslice(635/2,100,0,360,4);
	setcolor(15);
	circle(635/2,100,4);

	setfillstyle(1,RED);
	setcolor(RED);
	pieslice(540-30,100,0,360,15);
	setfillstyle(1,GREEN);
	setcolor(GREEN);
	pieslice(540-30,100,0,360,4);
	setcolor(15);
	circle(540-30,100,4);

	setfillstyle(1,8);
	bar(120-2,100+10+5,120+2,100+2+10+5);
	bar(635/2-2,100+10+5,635/2+2,100+2+10+5);
	bar(510-2,100+10+5,510+2,100+2+10+5);


}

void enemycraft_1_kill(int hell,int kell)
{

	setfillstyle(1,0);
	setcolor(0);

	if((kell<=110 && kell>=90))
	{
		if((hell>=100 && hell<=150 && dead1==1))
		{
			setcolor(0);
			pieslice(120,100,0,360,15);
			bar(120-2,100+10+5,120+2,100+2+10+5);
			scorefs+=30;dead1=0;
		}
		else 	if((hell>=635/2-10-10 && hell<=635/2+10+10 && dead2==1))
			{
				pieslice(635/2,100,0,360,15);
				bar(635/2-2,100+10+5,635/2+2,100+2+10+5);
				scorefs+=30;dead2=0;
			}
			 else 	if((hell>=540-30-10-10) && (hell<=540-30+10+10) && dead3==1)
				{
					pieslice(540-30,100,0,360,15);
					bar(510-2,100+10+5,510+2,100+2+10+5);
					scorefs+=30;dead3=0;
				}
	}

}

void usercraft_hit(int j,int kell, int l)
{

       if((pow((j-curx_1),2)+pow((kell-cury_1),2)<=30*30)||(pow((j-curx_1),2)+pow((l-cury_1),2)<=30*30))
       {
		black();

		delay(1000);

		if(j<=curx_1)
			modr_usercraft();
		if(j>=curx_1)
			modl_usercraft();

		ch[--oell]='\0';

       }

       scoreboard();

}

void enemycraft_1_shoot(int dead1=1,int dead2=1,int dead3=1)
{

	//Always shooting segment.
	{
		setcolor(0);
		line(e1_x,e1_y,e1_x,e1_y+40); e1_y+=20;
		if(dead1)
		{
			setcolor(15); line(e1_x,e1_y,e1_x,e1_y+40);
			if(e1_y>=490)
				e1_y=100+18;
			usercraft_hit(e1_x,e1_y,e1_y+40);
		}

	}

	if(iell%2==0)
	{
		setcolor(0);
		line(e2_x,e2_y,e2_x,e2_y+40);  e2_y+=20;
		if(dead2)
		{
			setcolor(15);  line(e2_x,e2_y,e2_x,e2_y+40);
			if(e2_y>=490)
				e2_y=100+18;
			usercraft_hit(e2_x,e2_y,e2_y+40);
		}

	}

	if(iell%3==0)
	{
		setcolor(0);
		line(e3_x,e3_y,e3_x,e3_y+40);   e3_y+=20;
		if(dead3)
		{
			setcolor(15);   line(e3_x,e3_y,e3_x,e3_y+40);
			if(e3_y>=490)
				e3_y=100+18;
			usercraft_hit(e3_x,e2_y,e3_y+40);
		}

	}

	iell++;

}

void scoreboard()
{

	setcolor(15);
	rectangle(0,0,50,50);
	rectangle(0,0,50,20);
	outtextxy(0,5," SCORE");
	setcolor(0);
	ch[3]='\0';
	outtextxy(20,30,d_score);
	setcolor(15);
	itoa(scorefs,d_score,10);
	outtextxy(20,30,d_score);
	if(oell!=3){ setcolor(0); outtextxy(1,54,ch1);}
	setcolor(RED);
	outtextxy(1,54,ch);
	setcolor(15);


}

void background()
{


	for(int iell=0;iell<1000;iell++)
	{
		hell=random(640);kell=random(480);
		putpixel(hell,kell,15);
		xell[iell]=hell;
		yell[iell]=kell;


	}

	usercraft();
	enemycraft_1();
	scoreboard();

}
void level1()
{

	do
	{

		for(int iell=0;iell<1000;iell++)
		{
			putpixel(xell[iell],yell[iell],BLACK);
			delay(100);
			putpixel(xell[iell],yell[iell],15);
			enemycraft_1_shoot(KILL);
			if(!strlen(ch))
			{
				flagell=0;iell=1001;
			}
			if(kbhit())
			{
				char opt=getch();
				switch(opt)
				{

					case 77:{
							if(curx_1<540)
							{
								modr_usercraft();
								kell=380+random(50);
								putpixel(random(640),kell,15);
							}
						}break;
					case 75:{
							if(curx_1>90)
							{
								modl_usercraft();
								kell=380+random(50);
								putpixel(random(640),kell,15);
							}
						}break;
					case 32:
							y1=350;y2=340;int l=curx_1;
							for(int i=0;i<12;i++)
							{
								enemycraft_1_shoot(KILL);
								if(!strlen(ch))
									{ flagell=0; i=1001;}
								shoot(l);
								if(kbhit())
								{
									char opt=getch();
									switch(opt)
									{

										case 77:{
												if(curx_1<540)
												{
													modr_usercraft();
													kell=380+random(50);
													putpixel(random(640),kell,15);
												}

											}break;
										case 75:	if(curx_1>90)
												{
													modl_usercraft();
													kell=380+random(50);
													putpixel(random(640),kell,15);
												}break;

									}

								} setcolor(15);scoreboard();setcolor(0);


							}break;

				}
				if(dead1==0 && dead2==0 && dead3==0)
				{
					iell=1001;
					flagell=0;
				}
			}

		}


	}while(flagell);

	checklev=2;


}

void usercraft()
{
	setfillstyle(1,8);
	setcolor(8);
	pieslice(curx_1,cury_1,0,360,30);
	setfillstyle(1,GREEN);
	setcolor(GREEN);
	pieslice(curx_1,cury_1,0,360,15);
	setcolor(15);
	circle(curx_1,cury_1,15);
	setfillstyle(1,RED);
	bar(curx_1-4,cury_1-40,curx_1+4,cury_1-30);

}

void black1()
{

	setfillstyle(1,0);
	setcolor(0);
	pieslice(bad1,100-30-20,0,360,15);
	bar(bad1-2,100+10+5-30-20,bad1+2,100+2+10+5-30-20);

}

void black2()
{

	setfillstyle(1,0);
	setcolor(0);
	pieslice(bad2,100,0,360,15);
	bar(bad2-2,100+10+5,bad2+2,100+2+10+5);

}

void black3()
{

	setfillstyle(1,0);
	setcolor(0);
	pieslice(bad3,100+30+20,0,360,15);
	bar(bad3-2,100+10+5+30+20,bad3+2,100+2+10+5+30+20);

}

void display2()
{

	setfillstyle(1,RED);
	setcolor(RED);
	pieslice(bad1,100-30-20,0,360,15);
	setfillstyle(1,GREEN);
	setcolor(GREEN);
	pieslice(bad1,100-30-20,0,360,4);
	setcolor(15);
	circle(bad1,100-30-20,4);

	setfillstyle(1,RED);
	setcolor(RED);
	pieslice(bad2,100,0,360,15);
	setfillstyle(1,GREEN);
	setcolor(GREEN);
	pieslice(bad2,100,0,360,4);
	setcolor(15);
	circle(bad2,100,4);

	setfillstyle(1,RED);
	setcolor(RED);
	pieslice(bad3,100+30+20,0,360,15);
	setfillstyle(1,GREEN);
	setcolor(GREEN);
	pieslice(bad3,100+30+20,0,360,4);
	setcolor(15);
	circle(bad3,100+30+20,4);

	setfillstyle(1,8);
	bar(bad1-2,100+10+5-30-20,bad1+2,100+2+10+5-30-20);
	bar(bad2-2,100+10+5,bad2+2,100+2+10+5);
	bar(bad3-2,100+10+5+30+20,bad3+2,100+2+10+5+30+20);

}

void bad1_shoot(int dead1)
{

	setcolor(0);
	line(e1_x,e1_y,e1_x,e1_y+40); e1_y+=20;

	if(dead1)
	{
		setcolor(15); line(e1_x,e1_y,e1_x,e1_y+40);
		if(e1_y>=490)
			{  e1_y=88; bad1+=shift1;check1=1;}
		usercraft_hit(e1_x,e1_y,e1_y+40);
	}

}

void bad2_shoot(int dead2)
{

	setcolor(0);
	line(e2_x,e2_y,e2_x,e2_y+40);  e2_y+=20;

	if(lo%3==0)
	{
		if(dead2)
		{
			setcolor(15);  line(e2_x,e2_y,e2_x,e2_y+40);
			if(e2_y>=490)
				e2_y=100+18;
			usercraft_hit(e2_x,e2_y,e2_y+40);
		}

	}

	lo++;

}
void  bad3_shoot(int dead3)
{
	setcolor(0);
	line(e3_x,e3_y,e3_x,e3_y+40);   e3_y+=20;

	if(dead3)
	{
		setcolor(15);   line(e3_x,e3_y,e3_x,e3_y+40);
		if(e3_y>=490)
			{e3_y=148+20; bad3+=shift3; check3=1;}
		usercraft_hit(e3_x,e3_y,e3_y+40);

	}

}

void enemycraft_2_shoot()
{

	setfillstyle(1,RED);
	if(dead1)
	{
		if(bad1==120)
		{
			e1_x=120;
			shift1=5;
			bad1_shoot(dead1);
		}
		else 	if(bad1==510)
			{
				e1_x=510;
				bad1_shoot(dead1);
				shift1=-5;
			}
			else
			{
				if(bad1==125 && check1==1)
				{
					bad1-=5;
				}
				if(bad1==505 && check1==1)
				{
					bad1+=5;
				}
				check1=0;
				black1();
				bad1+=shift1;
				setfillstyle(1,RED);
				setcolor(RED);
				pieslice(bad1,100-30-20,0,360,15);
				setfillstyle(1,GREEN);
				setcolor(GREEN);
				pieslice(bad1,100-30-20,0,360,4);
				setcolor(15);
				circle(bad1,100-30-20,4);
				setfillstyle(1,8);
				bar(bad1-2,100+10+5-30-20,bad1+2,100+2+10+5-30-20);


			}

	}

	kell=bad1+random(50);
	putpixel(random(640),kell,15);

	bad2_shoot(dead2);


	if(dead3)
	{
		if(bad3==120)
		{
			e3_x=120;
			bad3_shoot(dead3);
			shift3=5;
		}
		else 	if(bad3==540-30)
			{
				e3_x=510;
				bad3_shoot(dead3);
				shift3=-5;
			}
			else
			{
				if(bad3==125 && check3==1)
				{
					bad3-=5;
				}
				if(bad3==505 && check3==1)
				{
					bad3+=5;
				}
				check3=0;
				black3();
				bad3+=shift3;
				setfillstyle(1,RED);
				setcolor(RED);
				pieslice(bad3,100+30+20,0,360,15);
				setfillstyle(1,GREEN);
				setcolor(GREEN);
				pieslice(bad3,100+30+20,0,360,4);
				setcolor(15);
				circle(bad3,100+30+20,4);
				setfillstyle(1,8);
				bar(bad3-2,100+10+5+30+20,bad3+2,100+2+10+5+30+20);

			}

	}
	if(dead1==0)
	{
	    bad1_shoot(dead1);

	}
	if(dead3==0)
	{
	    bad3_shoot(dead3);

	}

	kell=bad3+random(50);
	putpixel(random(640),kell,15);

}

void enemycraft_2_kill(int hell,int kell)
{

	if((pow(hell-bad1,2)+pow(kell-50,2))<=225 && dead1)
	{
		 black1(); dead1=0;scorefs+=30;
	}
	if((pow(hell-bad2,2)+pow(kell-(100),2))<=225 && dead2)
	{
		 black2(); dead2=0;scorefs+=30;
	}
	if((pow(hell-bad3,2)+pow(kell-(100+30+20),2))<=225 && dead3)
	{
		 black3(); dead3=0; scorefs+=30;
	}

}
void level2()
{

	dead1=1;dead2=1;dead3=1;
	e1_y=88;e2_y=100+18;e3_y=100+18+30+20;flagell=1;
	do
	{
		for(int i=0;i<1000;i++)
		{

			putpixel(xell[i],yell[i],BLACK);
			delay(100);
			putpixel(xell[i],yell[i],15);
			enemycraft_2_shoot();
			if(!strlen(ch))
				flagell=0,i=1001;
			if(kbhit())
			{
				char opt=getch();
				switch(opt)
				{


					case 77:{
							if(curx_1<540)
							{
								modr_usercraft();
								kell=380+random(50);
								putpixel(random(640),kell,15);

							}

						}break;
					case 75:{
							if(curx_1>90)
							{
								modl_usercraft();
								kell=380+random(50);
								putpixel(random(640),kell,15);
							}
						}break;
					case 32:	y1=350;y2=340;int l=curx_1;
							for(int i=0;i<12;i++)
							{
								enemycraft_2_shoot();
								if(!strlen(ch)) { flagell=0; i=1001;}
								shoot(l);
								if(kbhit())
								{
									char opt=getch();
									switch(opt)
									{

										case 77:{
												if(curx_1<540)
												{
													modr_usercraft();
													kell=380+random(50);
													putpixel(random(640),kell,15);

												}
											}break;
										case 75:   	if(curx_1>90)
												{
													modl_usercraft();
													kell=380+random(50);
													putpixel(random(640),kell,15);
												}break;


									}

								}
						setcolor(15);scoreboard();setcolor(0);


					}break;

				}
			}
			if(dead1==0 && dead2==0 && dead3==0)
			{       flagell=0;
				i=1001;
			}
		}


	}while(flagell); checklev=3;


}
void boss_life()
{

	Jeev[ha]='\0';
	if(ha!=3)
		{setcolor(0);outtextxy(635/2-10,35,Jeev1);}
	setcolor(15); outtextxy(635/2-10,35,Jeev);

}

void enemycraft_3_shoot()
{

	setcolor(0);
	if(iell%2==0)
	{
		line(e1_x,e1_y,e1_x,e1_y+40); e1_y+=20;
		if(dead1)
		{
			setcolor(15); line(e1_x,e1_y,e1_x,e1_y+40);
			if(e1_y>=490)
				e1_y=100+18;
			usercraft_hit(e1_x,e1_y,e1_y+40);
		}
	}

	//Always shooting segment.
	{
		setcolor(0);
		line(e1b1_x,e1b1_y,e1b1_x,e1b1_y+40); e1b1_y+=20;
		if(dead2)
		{
			setcolor(15); line(e1b1_x,e1b1_y,e1b1_x,e1b1_y+40);
			if(e1b1_y>=490)
				e1b1_y=146;
			usercraft_hit(e1b1_x,e1b1_y,e1b1_y+40);
		}

	}

	//Always shooting segment.
	{
		setcolor(0);
		line(e3b3_x,e3b3_y,e3b3_x,e3b3_y+40); e3b3_y+=20;
		if(dead2)
		{
			setcolor(15); line(e3b3_x,e3b3_y,e3b3_x,e3b3_y+40);
			if(e3b3_y>=490)
				e3b3_y=146;
			usercraft_hit(e3b3_x,e3b3_y,e3b3_y+40);

		}
	}

	if(iell%2==0)
	{
		setcolor(0);
		line(e2b2_x,e2b2_y,e2b2_x,e2b2_y+40); e2b2_y+=20;
		if(dead2)
		{
			setcolor(15); line(e2b2_x,e2b2_y,e2b2_x,e2b2_y+40);
			if(e2b2_y>=490)
				e2b2_y=152;
			usercraft_hit(e2b2_x,e2b2_y,e2b2_y+40);
		}

	}

	if(iell%3==0)
	{
		setcolor(0);
		line(e3_x,e3_y,e3_x,e3_y+40);   e3_y+=20;
		if(dead3)
		{
			setcolor(15);   line(e3_x,e3_y,e3_x,e3_y+40);
			if(e3_y>=490)
				e3_y=100+18;
			usercraft_hit(e3_x,e2_y,e3_y+40);
		}

	}

	iell++;

}

void enemycraft_3_kill(int hell,int kell)
{

	setfillstyle(1,0);
	setcolor(0);
       //    To kill small aliens.
	if((kell<=110 && kell>=90))
	{
		if((hell>=100 && hell<=150 && dead1))
		{
			setcolor(0);
			pieslice(120,100,0,360,15);
			bar(120-2,100+10+5,120+2,100+2+10+5);
			scorefs+=30;dead1=0;
		}
		else 	if((hell>=540-30-10-10) && (hell<=540-30+10+10) && dead3)
			{
				pieslice(540-30,100,0,360,15);
				bar(510-2,100+10+5,510+2,100+2+10+5);
				scorefs+=30;dead3=0;
			}
	}
     //To kill boss
	if(pow(hell-635/2,2)+pow(kell-100,2)<=13*13 && dead2)
	{
		ha--;
		boss_life();
		scorefs+=50;
		if(Jeev[0]=='\0')
		{
			dead2=0;
			setfillstyle(1,0);
			setcolor(0);
			fillellipse(635/2,100,100,50);
			bar(635/2-30,100+10+5+34,635/2+30,100+2+10+5+40);
			bar(635/2-30-20,100+10+5+34,635/2-30-15,100+5+40);
			bar(635/2+30+15,100+10+5+34,635/2+30+20,100+5+40);

		}
		else
		{
			boss();
		}


	 }

	scoreboard();

}

void boss()
{

	setfillstyle(1,RED);
	setcolor(RED);
	fillellipse(635/2,100,100,50);
	setfillstyle(1,GREEN);
	setcolor(15);
	fillellipse(635/2,100,70,30);
	setfillstyle(1,RED);
	setcolor(15);
	fillellipse(635/2,100,50,20);
	setfillstyle(1,8);
	setcolor(8);
	pieslice(635/2,100,0,360,20);
	setcolor(15);
	circle(635/2,100,20);

	bar(635/2-30,100+10+5+34,635/2+30,100+2+10+5+40);
	bar(635/2-30-20,100+10+5+34,635/2-30-15,100+5+40);
	bar(635/2+30+15,100+10+5+34,635/2+30+20,100+5+40);


}

void display_3()
{

	setfillstyle(1,RED);
	setcolor(RED);
	fillellipse(635/2,100,100,50);
	setfillstyle(1,GREEN);
	setcolor(15);
	fillellipse(635/2,100,70,30);
	setfillstyle(1,RED);
	setcolor(15);
	fillellipse(635/2,100,50,20);
	setfillstyle(1,8);
	setcolor(8);
	pieslice(635/2,100,0,360,20);
	setcolor(15);
	circle(635/2,100,20);

	setfillstyle(1,RED);
	setcolor(RED);
	pieslice(120,100,0,360,15);
	setfillstyle(1,GREEN);
	setcolor(GREEN);
	pieslice(120,100,0,360,4);
	setcolor(15);
	circle(120,100,4);

	setfillstyle(1,RED);
	setcolor(RED);
	pieslice(540-30,100,0,360,15);
	setfillstyle(1,GREEN);
	setcolor(GREEN);
	pieslice(540-30,100,0,360,4);
	setcolor(15);
	circle(540-30,100,4);

	setfillstyle(1,8);
	bar(120-2,100+10+5,120+2,100+2+10+5);
	bar(635/2-30,100+10+5+34,635/2+30,100+2+10+5+40);
	bar(635/2-30-20,100+10+5+34,635/2-30-15,100+5+40);
	bar(635/2+30+15,100+10+5+34,635/2+30+20,100+5+40);
	bar(510-2,100+10+5,510+2,100+2+10+5);


}

void level3()
{

	boss_life();
	e1_x=120;e3_x=510;e1_y=100+18;e3_y=100+18;
	dead1=1;dead2=1;dead3=1; iell=0;flagell=1;

	do
	{

		for(int i=0;i<1000;i++)
		{
			putpixel(xell[i],yell[i],BLACK);
			delay(100);
			putpixel(xell[i],yell[i],15);
			if(dead2)
				boss();
			enemycraft_3_shoot();
			if(!strlen(ch))
				flagell=0,i=1001;
			if(kbhit())
			{
				char opt=getch();
				switch(opt)
				{
					case 77:{
							if(curx_1<540)
							{
								modr_usercraft();
								kell=380+random(50);
								putpixel(random(640),kell,15);
							}

						}break;
					case 75:{
							if(curx_1>90)
							{
								modl_usercraft();
								kell=380+random(50);
								putpixel(random(640),kell,15);
							}
						}break;
					case 32:y1=350;y2=340;int l=curx_1;
						for(int i=0;i<12;i++)
						{
							enemycraft_3_shoot();
							if(!strlen(ch))
								{ flagell=0; i=1001;}
							shoot(l);
							if(dead2)
								boss();
							if(kbhit())
							{
								char opt=getch();
								switch(opt)
								{

									case 77:{
											if(curx_1<540)
											{
												modr_usercraft();
												kell=380+random(50);
												putpixel(random(640),kell,15);
											}

										}break;
									case 75:   	if(curx_1>90)
											{
												modl_usercraft();
												kell=380+random(50);
												putpixel(random(640),kell,15);

											}break;

								}

							}
							setcolor(15);
							scoreboard();
							setcolor(0);
							if(dead2)
								boss();
						}break;

				}

			}
			if(dead1==0 && dead2==0 && dead3==0)
			{
				i=1001;
				flagell=0;
			}

		}


	}while(flagell); checklev=3;

}

void gameover()
{

	setcolor(14);
	settextstyle(3,0,6);
	outtextxy(180,200,"GAME OVER");
	outtextxy(180,250,"SCORE:");
	outtextxy(380,250,d_score);
	delay(3000);
	setcolor(15);
	getch();

}

void start_level1()
{

	setcolor(15);
	settextstyle(3,0,6);
	outtextxy(180,200,"LEVEL 1");
	delay(1200);
	setcolor(0);
	outtextxy(180,200,"LEVEL 1");

	settextstyle(DEFAULT_FONT,0,1);

}

void start_level2()
{

	setcolor(15);
	settextstyle(3,0,6);
	outtextxy(180,200,"LEVEL 2");
	delay(1200);
	setcolor(0);
	outtextxy(180,200,"LEVEL 2");

	settextstyle(DEFAULT_FONT,0,1);


}

void rules(int kell)
{

	setfillstyle(1,0);
	bar(0,0,640,480);
	setcolor(kell);
	settextstyle(3,0,1);
	outtextxy(5,100,"Rules :");
	outtextxy(5,110,"----");
	outtextxy(5,140,"1.To move your spacecraft press left and right arrow keys.");
	outtextxy(5,160,"2.To shoot tap the space bar.");
	outtextxy(5,180,"3.You are only allowed one shot at a time.");
	outtextxy(5,200,"4.Three lives are with you at the start of the game.");
	outtextxy(5,220,"5.Once three lives are lost you'll return to the homescreen.");
	outtextxy(5,240,"6.If an alien is hit you gain 30 points.");
	outtextxy(5,260,"7.The scoreboard is displayed at the left corner of your screen.");
	outtextxy(5,280,"8.To return to home page press any key");
	getch();

}

void  homescreen()
{

	setfillstyle(1,0);
	bar(0,0,640,480);
	for(int i=0;i<1000;i++)
	{
		hell=random(640);kell=random(480);
		putpixel(hell,kell,kell);
		xell[i]=hell;
		yell[i]=kell;

	}

	setcolor(15);
	settextstyle(3,0,6);
	outtextxy(150,50,"SPACE WARS");
	settextstyle(3,0,3);
	outtextxy(80,130,"Enter 1 to PLAY");
	outtextxy(80,160,"Enter 2 to RULES");
	outtextxy(80,190,"Enter 3 for HIGH SCORES");
	outtextxy(80,220,"Enter 4 for EXIT");
	outtextxy(80,300,"Enter your option:");

	int kell=1;
	do
	{
		char b=getch();
		ka[1]='\0';
		switch(b)
		{
		   case 8:setcolor(0);outtextxy(300,300,ka);ka[0]='\0';break;
		   case 13:if(ka[0]!='\0')
			    {
				kell=0;
			    }break;
		   default:setcolor(0); outtextxy(300,300,ka);ka[0]=b; setcolor(15); outtextxy(300,300,ka);break;


		}


	}while(kell);
	settextstyle(DEFAULT_FONT,0,1);
}
void clrhome()
{

	setcolor(0);
	settextstyle(3,0,6);
	outtextxy(150,50,"SPACE WARS");
	settextstyle(3,0,3);
	outtextxy(80,130,"Enter 1 to PLAY");
	outtextxy(80,160,"Enter 2 to RULES");
	outtextxy(80,190,"Enter 3 for HIGH SCORES");
	outtextxy(80,220,"Enter 4 for EXIT");
	outtextxy(80,300,"Enter your option:");
	outtextxy(300,300,ka);
	setcolor(15);
	settextstyle(DEFAULT_FONT,0,1);

}

void start_level3()
{
	setcolor(15);
	settextstyle(3,0,6);
	outtextxy(180,200,"LEVEL 3");
	delay(1200);
	setcolor(0);
	outtextxy(180,200,"LEVEL 3");
	settextstyle(DEFAULT_FONT,0,1);

}

void winner()
{

	setcolor(14);
	settextstyle(3,0,6);
	outtextxy(180,200,"YOU WON");
	outtextxy(180,250,"SCORE:");
	outtextxy(380,250,d_score);
	delay(400);
	setcolor(15);
	delay(3000);
	getch();

}
void high_score(int co)
{

       setfillstyle(1,0);
       bar(0,0,640,480);
       setcolor(co);
       settextstyle(3,0,1);
       outtextxy(5,100,"Highscores:");
       hio[0].pri();
       getch();


}
void final()
{

	char opt[1];
	do
	{
		hio[0].war();
		homescreen();

		if(ka[0]=='1')
		{
			clrhome();
			//Reinitializes everything!
			curx_1=305,cury_1=360+40,curx_2=255,cury_2=400+1,curx_3=355,cury_3=405+1;
			dead1=1,dead2=1,dead3=1;
			y1=200;y2=180;
			scorefs=0;
			e1_x=120,e2_x=635/2,e3_x=540-30,e1_y=100+18,e2_y=100+18,e3_y=100+18;
			e1b1_y=146,e2b2_y=152,e3b3_y=146,e1b1_x=270,e2b2_x=318,e3b3_x=365;
			bad1=120,bad2=635/2,bad3=540-30;
			flagell=1;
			checklev=1;
			oell=3;
			iell=1;
			lo=1;
			ha=3;
			check1=0;
			check3=0;
			strcpy(ch,ch1);
			strcpy(Jeev,Jeev1);
			setcolor(15);
			settextstyle(3,0,3);
			outtextxy(80,280,"Enter your name:");

			int bv = 0;
			int kell = 1;

			do
			{

				char buf=getch();
				switch(buf)
				{
					case 8: if(bv)
						{
							setcolor(0);
							outtextxy(290,280,nag);
							nag[--bv]=0;
							setcolor(15);
							outtextxy(290,280,nag);

						}break;

					case 13: kell=0;break;

					default: if(bv<40-1 && buf>=' ' && buf<='~')
						 {
							nag[bv]=buf;
							nag[++bv]=0;
							outtextxy(290,280,nag);
						 }
				}
				nag[bv]='\0';
				if(bv==9) kell = 0;
			} while(kell);


			strcpy(hio[99].hey,nag);
			delay(600);
			setcolor(0);
			settextstyle(3,0,3);
			outtextxy(80,280,"Enter your name:");
			outtextxy(290,280,nag);
			settextstyle(DEFAULT_FONT,0,1);


			start_level1();
			background();
			level1();
			if(!strlen(ch))
			    {
				hio[99].hey_score=scorefs;
				gameover();
				hio[0].sort();
				hio[0].waf();
			    }
			else
			{
				start_level2();
				display2();
				level2();
				if(!strlen(ch))
				     {

					 hio[99].hey_score=scorefs;
					 gameover();
					 hio[0].sort();
					 hio[0].waf();

				     }
				else
				{
					start_level3();
					display_3();
					level3();
					if(!strlen(ch))
						{
							hio[99].hey_score=scorefs;
							gameover();
							hio[0].sort();
							hio[0].waf();

						}
					else
						{       hio[99].hey_score=scorefs;
							hio[0].sort();
							hio[0].waf();
							winner();
						 }
				}

			}

		}
		else 	if(ka[0]=='4')
			{
				return ;
			}
			else 	if(ka[0]=='2')
				{
					clrhome();
					rules(15);
				}
				else	if(ka[0]=='3')
					{
						clrhome();
						high_score(15);
					}
		setcolor(0);

	}while(1);

}

void spacew()
{

	final();

}