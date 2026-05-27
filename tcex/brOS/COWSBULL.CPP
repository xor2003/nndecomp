const	int	total=10;
char	rulest[10][100]={"1. You have to find the 4 digit number with distinct digits.","2. You can play against the computer or another player.", "3. There are ten chances to guess the number.","4. A cow is when a digit is guessed and in the right place.","5. Bull is when a digit exists but in a different place.","6. The objective is to get 4 cows.","7. Press ENTER to begin playing!"};
int option, gout;
int norep(int a, int il, int number[])
{
	int flag = 0;
	for(int i = il-1; i >= 0&&flag==0; i--)
	{	if(a==number[i]) flag = 1;
	}
	if(flag==1) return 0;
	else return 1;
}
void gamecb()
{
		int x, y, b;
		cleardevice();
		settextstyle(3,0,1);
		setbkcolor(BLUE);
		setcolor(YELLOW);
		line(0,35,getmaxx(),35);
		outtextxy(180,40,"COWS AND BULLS - MASTERMIND");  //BUNCH OF RULES.
		line(0,70,getmaxx(),70);
		for(int opt=10;opt!=1&&opt!=2&&opt!=3&&opt!=4;) //VS 2nd PLAYER? OR COMP?
		{
			outtextxy(28,210,"Choose an option: 1. vs Human 2. vs Computer 3. Rules 4. Exit");
			outtextxy(270,300,"Choice: ");
			opt=0;
			int ent = 0;
			do
			{	char ic;
				ic = getch();
				setcolor(BLUE);
				setfillstyle(SOLID_FILL,BLUE);
				if(ic>=49&&ic<=52)
				{	opt = ic-48;
					char a[2]; a[0] = char(ic); a[1] = '\0';
					setcolor(YELLOW);
					outtextxy(340,300,a);
					ent = getch()-12;
					if(ent==-4) bar(337,300,370,320);
					else if(ent!=1)
					do
					{	ent = getch()-12;
						if(ent==-4) bar(337,300,370,320);
					}while(ent!=1&&ent!=-4);
				}
			}while((opt!=1&&opt!=2&&opt!=3&&opt!=4)||ent!=1);
		}
	int 	start=1;
		option = opt;
		if(opt!=3&&opt!=4)
		{       delay(500);
			cleardevice(); setcolor(YELLOW);
			outtextxy(165,getmaxy()/2-16,"Press ENTER when you are ready!");
			for(;start!=13;start=getch());
		}
	cleardevice();
	int	number[4];
		if(opt==1)   //VS 2nd PLAYER.
		{
			outtextxy(180,getmaxy()/2-50,"Player 2, enter your number:");
				int sp = 0, ncheck = 0;
				for(int i=0;i<4;)
				{
					int a=getch()-48;
					if(a>=0&&a<=9)
					{       if(!(i==0&&a==0))
						if(norep(a,i,number))
						{
							outtextxy(287+sp,getmaxy()/2+25,"*");
							number[i] = a;
							i++;
							ncheck++;
							sp = sp + 20;
						}
					}
					else if(a==-40)
					{	if(i!=0) i--;
						bar(287+sp-20,getmaxy()/2+20,287+sp,getmaxy()/2+50);
						sp -=20;
					}
				}

		delay(600);
		}
		else if(opt==2)      //VS COMP.
		{
			int z[10]={0,1,2,3,4,5,6,7,8,9},y;
			for(int x=0;x<4;x++)
			{
				randomize();
				y=random(10-x);
				number[x]=z[y];
				if(number[0]==0) x--;
				else
				{
					for(int j=y;j<9-x;j++)
					    z[j]=z[j+1];
				}
			}
		}


	cleardevice();
		if(opt!=3&&opt!=4){
		setcolor(YELLOW);
		line(0,35,getmaxx(),35);
		line(0,70,getmaxx(),70);
		outtextxy(180,40,"COWS AND BULLS - MASTERMIND");
		settextstyle(3,1,15);
		setcolor(RED);
		outtextxy(getmaxx()-200,95,"????");
		}
		settextstyle(3,0,1);
		setcolor(YELLOW);
		int i, yds = 0;
		for(int guessno=1,guess[4],cow=0,bull=0;guessno<=total&&cow<4&&opt!=4&&opt!=3;guessno++) //"MAIN LOOP"
		{
			cow=bull=0;
			char bl[4] = {'\0'};
			outtextxy(20,171,"Guess     Number     Cows     Bulls ");
			line(19,192,71,192);
			line(114,192,178,192);
			line(225,192,270,192);
			line(313,192,351,192);
			for(int flag=0,error=1;flag==0;)
			{
				if(guessno!=1)
				{	char d;
					do
					{	d = getch();
					}while(d!=13);
				}
				bar(0,85,getmaxx()-210,163);
				outtextxy(20,88,"Guess ");
				outtextxy(75,88,itoa(guessno,bl,10));
				gout = guessno;
				if(guessno!=10) line(18,111,87,111);
				else line(18,111,99,111);
				int xs = 0;
				for(i=0;i<4;)
				{
					int l = getch()-48; //EASY WAY TO ACCEPT SINGLE DIGIT NO.
					if(l>=0&&l<=9)
					{      	char a[3];
						itoa(l,a,10);
						outtextxy(120+xs,88,a);
						guess[i] = l;
						i++; xs+=20;
					}
					else if(i!=0&&l==-40)
					{	i--;
						bar(98+xs,85,getmaxx()-210,110);
						xs-=20;
					}

				}
				if(guess[0]==0) outtextxy(20,130,"OOPS! Enter a 4 digit number!");
				   else{outtextxy(20,130,"Number accepted! See below!"); flag=1;}
			}
			if(error==1)
			{
				i=0;
				int guessuse[4];
				for(int y=0;y<4;y++) guessuse[y]=guess[y];
				for(int j;i<4;i++)       //IMP., COMPARING *NUMBER* WITH *GUESS*
				{                        //OUTER LOOP FOR NUMBER,INNER FOR GUESS.i->NUMBER. j-> GUESS.
					for(j=0;j<4;j++)
					{
						if(guessuse[j]==number[i])
						{
							if(j==i)
							{
								cow++;
								for(int y=0;y<4;y++)
								 if(guessuse[j]==guessuse[y]&&y!=j) guessuse[y]=-1;
							}
						}
					}
					for(j=0;j<4;j++)
					{
						if(guessuse[j]==number[i])
						{
							bull++;
							for(int y=0;y<4;y++)
								 if(guessuse[j]==guessuse[y]&&y!=j) guessuse[y]=-1;
						}
					}
				}

			}
			bull-=cow;
				char bb[2]; bb[0] = bull + 48; bb[1] = '\0';
				outtextxy(20,198+yds,itoa(guessno,bl,10));
				for(int fda=0;fda<4;fda++) bl[fda]=guess[fda]+48;
				bl[4]='\0';
				outtextxy(120,198+yds,bl);
				itoa(cow,bl,10);
				outtextxy(245,198+yds,bl);
				outtextxy(330,198+yds,bb);
				yds+=23;
		}
		char out[5];
		out[0] = gout+48; out[1] = '\0';
		if(opt!=3&&opt!=4)
		{
		if(cow==4)
		{ if(gout!=10){ outtextxy(20,getmaxy()-33,"Right Answer! You found the no. in   move(s)!");
				outtextxy(335,getmaxy()-33,out);
			      }
		  else outtextxy(20,getmaxy()-33,"Right Answer! You found the no. in 10 move(s)!");
		}
		   else
		   {
			outtextxy(20,getmaxy()-33,"Sorry! All chances are over! The answer is ");
			for(int li=0;li<4;li++)
			{	out[li] = number[li] + 48;
			}
			out[4] = '\0';
			outtextxy(410,getmaxy()-33,out);
		   }
		}
		if(opt==3)
		{	cleardevice();
			settextstyle(3,0,1);
			outtextxy(20,40,"Rules");
			line(20,65,60,65);
			for(int i=0;i<7;i++)
			  outtextxy(20,80+30*i,rulest[i]);
			char lll;
			do
			{	lll=getch();
			}while(lll!=13);
		}
}
void mastermind()
{
	cleardevice();
	char o='y', op[2], ch;
	while(option!=4)
	{ if(o=='Y'||o=='y')
	  {	gamecb();
		if(option!=4&&option!=3)
		{	do
			{       delay(3000);
				cleardevice();
				outtextxy(getmaxx()/2-100,getmaxy()/2-15,"Continue(Y/N):");
				int ent = 0;
				do
				{       if(o==8) bar(getmaxx()/2+48,getmaxy()/2-20,getmaxx(),getmaxy());
					if(ent != 13 && op[0]!='y'&&op[0]!='Y'&&op[0]!='N'&&op[0]!='n') o = getch();
					op[0] = o; op[1] = '\0';
					strupr(op);
					if(o=='y'||o=='Y'||o=='n'||o=='N'){
					outtextxy(getmaxx()/2+50,getmaxy()/2-15,op); ent = getch();
					}
					if(ent==8) o = 8;
				}while((o!='Y'&&o!='y'&&o!='n'&&o!='N')||ent!=13);
				delay(70);
			}while(o!='Y'&&o!='y'&&o!='n'&&o!='N');
			if(o=='N'||o=='n') option = 4;
		}
	  }
	}
	option = 0;
}
void cowsbulls()
{
	cleardevice();
	mastermind();
}