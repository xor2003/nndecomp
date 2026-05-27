int 	maxx1,maxy1,xc4=4,xpos,ypos;
int 	game[7][7],turn=1,win1,win2;
char	player1[20],player2[20],guides[10][100]={"1. Enter the name of the players who are playing.","2. The computer randomly chooses the player who goes first.","3. Your turn is highlighted by the color of the marker.","4. Use the arrow keys to move the marker.","5. Use the spacebar to drop the coin.","6. You win if 4 continuous holes are filled by your coins.","7. If all the holes are filled, then the game is a draw.","8. Choose the play again option to play with the same players.","9. Press any key to go back to the main menu."};

void menu();

void drawmenu()
{
	setfillstyle(SOLID_FILL,BLUE);
	bar(0,0,maxx1,maxy1);
	setcolor(WHITE);
	settextstyle(9,0,4);
	outtextxy(maxx1/2-143,80,"CONNECT 4");
	setcolor(WHITE);
	setlinestyle(SOLID_LINE,0,3);
	line(maxx1/2-143,150,maxx1/2+143,150);
	setfillstyle(SOLID_FILL,CYAN);
	settextstyle(9,0,3);
	setcolor(WHITE);
	bar(maxx1/2-125,200,maxx1/2+125,260);
	outtextxy(maxx1/2-46,202,"PLAY");
	bar(maxx1/2-125,280,maxx1/2+125,340);
	outtextxy(maxx1/2-56,282,"RULES");
	setfillstyle(SOLID_FILL,RED);
	bar(maxx1/2-100,360,maxx1/2+100,420);
	outtextxy(maxx1/2-32,362,"EXIT");
}

int input2()
{
	i.x.ax=3;
	int86(0x33,&i,&o);
	int cx=o.x.cx,dx=o.x.dx,bx=o.x.bx;
	if(bx==1)
	{
		if(cx>maxx1/2-125&&cx<maxx1/2+125)
		  if(dx>170&&dx<230) return 1;
		   else if(dx>270&&dx<330) return 2;
			else if(dx>370&&dx<430) return 0;
	}
	else return 4;
	return 4;
}

void playmenu()
{
	for(int l=0;l<10;l++)player1[l]=player2[l]='\0';
	i.x.ax=2;
	int86(0x33,&i,&o);
	setfillstyle(SOLID_FILL,BLACK);
	bar(0,0,maxx1,maxy1);
	delay(300);
	setcolor(WHITE);
	settextstyle(9,0,1);
	outtextxy(233,10,"CONNECT 4");
	setlinestyle(0,0,3);
	line(233,50,403,50);
	outtextxy(219,100,"Who's playing?");
	setfillstyle(SOLID_FILL,CYAN);
	settextstyle(9,0,3);
	bar(maxx1/2-125,170,maxx1/2+125,230);
	bar(maxx1/2-125,270,maxx1/2+125,330);
	setfillstyle(SOLID_FILL,RED);
	bar(maxx1/2-100,370,maxx1/2+100,430);
	outtextxy(maxx1/2-50,372,"PLAY!");
	i.x.ax=0;
	int86(0x33,&i,&o);
	i.x.ax=1;
	int86(0x33,&i,&o);
	int flag=1;
	while(flag)
	{
	      flag=input2();
	      if(flag==1)
	      {
		for(int l=0;l<10;l++)player1[l]='\0';
		setfillstyle(SOLID_FILL,CYAN);
		bar(maxx1/2-125,170,maxx1/2+125,230);
		i.x.ax=2;
		int86(0x33,&i,&o);
		settextstyle(9,0,2);
		char ch=1;
		for(int i=0;i<10&&ch!=13;i++)
		{
			setcolor(WHITE);
			setlinestyle(0,0,3);
			rectangle(maxx1/2-125,170,maxx1/2+125,230);
			ch=getch();
			if(ch!=13&&ch!=8) player1[i]=ch;
			  else if(ch==8&&i!=0)
			       {
				   player1[--i]='\0';
				   setfillstyle(SOLID_FILL,CYAN);
				   settextstyle(9,0,2);
				   bar(maxx1/2-125,170,maxx1/2+125,230);
				   i--;
			       }
			strupr(player1);
			outtextxy(maxx1/2-120,175,player1);
			delay(200);
		}
	       }
	       if(flag==1)
	       {
			setcolor(BLACK);
			setlinestyle(0,0,1);
			rectangle(maxx1/2-125,170,maxx1/2+125,230);
			i.x.ax=0;
			int86(0x33,&i,&o);
			i.x.ax=1;
			int86(0x33,&i,&o);
	       }
	       if(flag==2)
	       {
		for(int l=0;l<10;l++)player2[l]='\0';
		setfillstyle(SOLID_FILL,CYAN);
		bar(maxx1/2-125,270,maxx1/2+125,330);
		i.x.ax=2;
		int86(0x33,&i,&o);
		settextstyle(9,0,2);
		char ch=1;
		for(int i=0;i<10&&ch!=13;i++)
		{
			setcolor(WHITE);
			setlinestyle(0,0,3);
			rectangle(maxx1/2-125,270,maxx1/2+125,330);
			ch=getch();
			if(ch!=13&&ch!=8) player2[i]=ch;
			  else if(ch==8&&i!=0)
			       {
				   player2[--i]='\0';
				   setfillstyle(SOLID_FILL,CYAN);
				   settextstyle(9,0,2);
				   bar(maxx1/2-125,270,maxx1/2+125,330);
				   i--;
			       }
			strupr(player2);
			outtextxy(maxx1/2-120,275,player2);
			delay(200);
		}
	       }
	       if(flag==2)
	       {
			setcolor(BLACK);
			setlinestyle(0,0,1);
			rectangle(maxx1/2-125,270,maxx1/2+125,330);
			i.x.ax=0;
			int86(0x33,&i,&o);
			i.x.ax=1;
			int86(0x33,&i,&o);
	       }
	}
	randomize();
	if(random(1000)%2)
	{
		char	temp[15];
			strcpy(temp,player1);
			strcpy(player1,player2);
			strcpy(player2,temp);
	}
	if(strlen(player1)==0) strcpy(player1,"PLAYER-1");
	if(strlen(player2)==0) strcpy(player2,"PLAYER-2");
}

int win()
{
	int flag=0,j;
	for(int i=0;flag<4&&i<=7;i++)
	{
		if(game[i][ypos]==turn) flag++;
		else flag=0;
	}
	if(flag==4) return 1;
	flag=0;
	for(i=0;flag<4&&i<=6;i++)
	{
		if(game[xpos][i]==turn) flag++;
		else flag=0;
	}
	if(flag==4) return 1;
	flag=0;
	i=xpos+ypos-5;
	j=xpos+ypos;
	if(j>5) j=6;
	if(i<=0) i=0;
	for(;i<=j&&flag<4;i++)
	{
		if(game[i][xpos+ypos-i]==turn) flag++;
		else flag=0;
	}
	if(flag==4) return 1;
	flag=0;
	i=xpos-ypos;
	j=5+i;
	if(j>6) j=6;
	if(i<0) i=0;
	for(;i<=j&&flag<4;i++)
	{
		if(game[i][i-(xpos-ypos)]==turn) flag++;
		else flag=0;
	}
	if(flag==4) return 1;
	flag=0;
	for(i=0;i<7&&flag==0;i++)
	  for(j=0;j<6&&flag==0;j++)
	     if(game[i][j]==0) flag=1;
	if(flag==0) return 2;
	else return 0;
}

int input3()
{
	i.x.ax=3;
	int86(0x33,&i,&o);
	int cx=o.x.cx,dx=o.x.dx,bx=o.x.bx;
	if(bx==1)
	{
		if(dx>maxy1/2+20&&dx<maxy1/2+80)
		  if(cx>maxx1/2-150&&cx<maxx1/2-25) return 1;
		   else if(cx>maxx1/2+25&&cx<maxx1/2+150) return 0;
	}
	else return 4;
	return 4;
}

void drawhole(int x, int y, int col)
{
	setcolor(col);
	setfillstyle(SOLID_FILL,col);
	pieslice(x,y,0,360,25);
	setcolor(BLACK);
	setlinestyle(0,0,1);
	circle(x,y,23);
	settextstyle(4,0,4);
	outtextxy(x-7,y-23,"b");
}

void insert()
{
	char ch=1;
	int  yay=0;
	xc4=4;
	while(xc4==4)
	{
		setfillstyle(1,BLACK);
		bar(90+74*xpos,5,125+74*xpos,25);
		if(ch==77)
		{
			if(xpos==6) xpos=0;
			else xpos++;
		}
		if(ch==75)
		{
			if(xpos==0) xpos=6;
			else xpos--;
		}
		if(ch==32)
		{
			for(ypos=0;ypos<6&&game[xpos][ypos]==0;ypos++);
			ypos--;
			if(ypos!=-1)
			{
				if(turn==1) drawhole(100+74*xpos,62+61*ypos,4);
				 else drawhole(100+74*xpos,62+61*ypos,14);
				game[xpos][ypos]=turn;
				yay=win();
				turn*=-1;
			}
		}
		if(yay==0)
		{
			if(turn==1)
			{
				setfillstyle(1,BLACK);
				setcolor(BLACK);
				setlinestyle(SOLID_LINE,0,3);
				rectangle(maxx1-222,418,maxx1-48,462);
				setcolor(4);
				rectangle(48,418,222,462);
			}
			else
			{
				setfillstyle(1,BLACK);
				setcolor(BLACK);
				setlinestyle(SOLID_LINE,0,3);
				rectangle(48,418,222,462);
				setcolor(14);
				rectangle(maxx1-222,418,maxx1-48,462);
			}
			settextstyle(0,0,3);
			char	arrow[2]="\0\0";
			arrow[0]=char(31);
			outtextxy(92+74*xpos,5,arrow);
			if(ch==32) delay(300);
			ch=getch();
		}
		else
		{
			delay(200);
			setfillstyle(1,CYAN);
			setcolor(WHITE);
			settextstyle(9,0,1);
			for(int g=-100;g<100;g+=5)
			{
				bar(maxx1/2-175,maxy1/2-100,maxx1/2+175,maxy1/2+g);
				delay(50);
			}
			if(yay==2)
			{
				setcolor(BLUE);
				char temp[25]=" It is a draw!";
				outtextxy(maxx1/2-strlen(temp)*7,maxy1/2-70,temp);
			}
			else
			{
				if(turn==1)
				{
					setcolor(YELLOW);
					char temp[25];
					strcpy(temp,player2);
					strcat(temp," has won!");
					outtextxy(maxx1/2-strlen(temp)*7,maxy1/2-70,temp);
					win2++;
				}
				else
				{
					setcolor(RED);
					char temp[25];
					strcpy(temp,player1);
					strcat(temp," has won!");
					outtextxy(maxx1/2-strlen(temp)*8,maxy1/2-70,temp);
					win1++;
				}
			}
			setfillstyle(1,BLUE);
			setlinestyle(0,0,3);
			setcolor(BLACK);
			bar(maxx1/2-150,maxy1/2+20,maxx1/2-25,maxy1/2+80);
			rectangle(maxx1/2-150,maxy1/2+20,maxx1/2-25,maxy1/2+80);
			bar(maxx1/2+25,maxy1/2+20,maxx1/2+150,maxy1/2+80);
			rectangle(maxx1/2+25,maxy1/2+20,maxx1/2+150,maxy1/2+80);
			setcolor(WHITE);
			outtextxy(maxx1/2-138,maxy1/2+27,"AGAIN?");
			outtextxy(maxx1/2+60,maxy1/2+27,"EXIT");
			delay(200);
			i.x.ax=0;
			int86(0x33,&i,&o);
			i.x.ax=1;
			int86(0x33,&i,&o);
			xc4=4;
			while(xc4==4)
			{
				xc4=input3();
			}
		}
	}
}

void drawboard()
{
	i.x.ax=2;
	int86(0x33,&i,&o);
	setfillstyle(SOLID_FILL,BLACK);
	bar(0,0,maxx1,maxy1);
	setfillstyle(SOLID_FILL,BLUE);
	delay(300);
	bar(50,30,maxx1-50,400);
	setcolor(BLACK);
	setlinestyle(0,0,3);
	line(60,37,60,392);
	line(maxx1-60,37,maxx1-60,392);
	for(int j=0;j<6;j++)
	{
		for(int k=0;k<7;k++)
		{
		      drawhole(98+74*k,62+61*j,0);
		      setlinestyle(1,0,3);
		      if(k!=0) line(60+74*k,40+61*j,60+74*k,80+61*j);
		}
	}
	setfillstyle(SOLID_FILL,BLUE);
	bar(50,420,220,460);
	bar(maxx1-220,420,maxx1-50,460);
	settextstyle(0,0,2);
	setcolor(WHITE);
	outtextxy(135-strlen(player1)*8,433,player1);
	outtextxy(maxx1-135-strlen(player2)*8,433,player2);
	settextstyle(9,0,1);
	outtextxy(maxx1/2-20,420,"V/S");
	char w1[3],w2[3];
	itoa(win1,w1,10);
	itoa(win2,w2,10);
	outtextxy(maxx1/2-40-strlen(w1)*7,420,w1);
	outtextxy(maxx1/2+40,420,w2);
	insert();
	i.x.ax=1;
	int86(0x33,&i,&o);
}

void play()
{
	win1=win2=0;
	i.x.ax=2;
	int86(0x33,&i,&o);
	cleardevice();
	playmenu();
	i.x.ax=2;
	int86(0x33,&i,&o);
	cleardevice();
	xc4=4;
	while(xc4)
	{
		for(int i=0;i<7;i++)
		   for(int j=0;j<7;j++)
		      game[i][j]=0;
		drawboard();
	}
	i.x.ax=1;
	int86(0x33,&i,&o);
	i.x.ax=2;
	int86(0x33,&i,&o);
	cleardevice();
	drawmenu();
	delay(500);
	xc4=4;
	i.x.ax=1;
	int86(0x33,&i,&o);
}

void rulesc4()
{
	i.x.ax=2;
	int86(0x33,&i,&o);
	cleardevice();
	settextstyle(3,0,3);
	outtextxy(5,80,"RULES");
	setlinestyle(0,0,3);
	line(5,110,65,110);
	settextstyle(3,0,1);
	for(int j=0;j<10;j++)
	outtextxy(5,140+30*j,guides[j]);
	i.x.ax=1;
	int86(0x33,&i,&o);
	getch();
	i.x.ax=2;
	int86(0x33,&i,&o);
	cleardevice();
	drawmenu();
	xc4=4;
	delay(500);
	i.x.ax=1;
	int86(0x33,&i,&o);
}

int inputc4()
{
	i.x.ax=3;
	int86(0x33,&i,&o);
	int cx=o.x.cx,dx=o.x.dx,bx=o.x.bx;
	if(bx==1)
	{
		if(cx>maxx1/2-125&&cx<maxx1/2+125)
		  if(dx>200&&dx<260) return 1;
		    else if(dx>280&&dx<340) return 2;
			   else if(dx>360&&dx<420) return 0;
	}
	else return 4;
	return 4;
}

void menu()
{
	xc4=4;
	drawmenu();
	i.x.ax=0;
	int86(0x33,&i,&o);
	i.x.ax=1;
	int86(0x33,&i,&o);
	while(xc4)
	{
		xc4=inputc4();
		if(xc4==1) play();
		else if(xc4==2) rulesc4();
	}
}

void c4()
{
		maxx1=getmaxx();
		maxy1=getmaxy();
		menu();
}