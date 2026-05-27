int	count,maxx,maxy,flag,k,y,z,j,n,rad=1,help=-1,pre=-1,h;
char	calc[13],mem[13],inexp[30],postexp[30],stack[15],degrad[5]="RAD";
char	name[26][5]={"=",".","DEL","CLR","x",{251},"1","2","3","+","^","4","5","6","-",{'x',253},"7","8","9","X","COS","SIN","0","!","/","\0"};
char	guide[10][200]={"1. The Calc takes care of syntax.","2. Press the black button to switch between Deg. and Rad.","3. The maximum number of characters that can be entered is 10.","4. M-SAVE saves the current result/expession.","5. M-CDIS clears screen and copies saved result/expression to it." ,"6. Click the HELP button again to hide/show this list.","7. Click the PRE button to view last 5 calculations/return to Calc.","8. Click the = button to calculate.","9. If there is any runtime error the Calc resets to 0.","10. Click the X to return to brOS Home."};

class store
{
    public:	char	exp[20];
		char    res[20];
		store();
}data[10];
store::store()
{
	for(int i=0;i<20;i++) exp[i]=res[i]='\0';
}
void button(int x,int y, int z=15)
{
	if(count!=4)
	{
		setfillstyle(SOLID_FILL,7);
		bar(x+4,y+4,x+49,y+59);
		setcolor(z);
		settextstyle(1,0,2);
		outtextxy(x+26-strlen(name[count])*5.6,y+20,name[count]);

	}
	  else
	  {
		setfillstyle(SOLID_FILL,RED);
		bar(x+4,y+4,x+49,y+59);
		setcolor(15);
		settextstyle(1,0,2);
		outtextxy(x+21,y+17,name[count]);
	  }
}

void draw()
{
	count=0;
	int	maxx=getmaxx(),maxy=getmaxy();
	::maxx=maxx;
	::maxy=maxy;
	setfillstyle(SOLID_FILL,8);
	bar(maxx/2-152,1,maxx/2+152,maxy);
	setfillstyle(SOLID_FILL,LIGHTGRAY);
	bar(30,100,120,130);
	bar(maxx-120,100,maxx-30,130);
	bar(30,190,120,220);
	bar(maxx-120,190,maxx-30,220);
	setcolor(WHITE);
	setfillstyle(SOLID_FILL,BLACK);
	settextstyle(1,0,1);
	outtextxy(55,102,"HELP");
	outtextxy(43,192,"M-SAVE");
	outtextxy(maxx-90,102,"PRE");
	outtextxy(maxx-107,192,"M-CDIS");
	bar(maxx/2-140,40,maxx/2+140,115);
	setfillstyle(SOLID_FILL,7);
	bar(maxx/2-145,5,maxx/2+145,25);
	bar(maxx/2-145,maxy-10,maxx/2+145,maxy);
	setfillstyle(SOLID_FILL,BLACK);
	bar(maxx/2+125,8,maxx/2+140,22);
	setfillstyle(SOLID_FILL,WHITE);
	bar(maxx/2+130,12,maxx/2+135,18);
	settextstyle(3,0,1);
	outtextxy(maxx/2-20,1,"brOS");
	settextstyle(2,0,4);
	setfillstyle(SOLID_FILL,DARKGRAY);
	for(int y=125;y+68<maxy;)
	{
		for(int x=maxx/2-145;x<maxx/2+145;)
		{
			button(x,y);
			x+=59;
			count++;
		}
		y+=68;
	}

}

int input()
{
	int xpos=6,ypos=6;
	i.x.ax=3;
	int86(0x33,&i,&o);
	int cx=o.x.cx,dx=o.x.dx,bx=o.x.bx;
	if(bx==1)
	{
	  if(cx>maxx/2-145&&cx<maxx/2-92) xpos=0;
	    else if(cx>maxx/2-86&&cx<maxx/2-33) xpos=1;
		   else if(cx>maxx/2-27&&cx<maxx/2+26) xpos=2;
			  else if(cx>maxx/2+32&&cx<maxx/2+85) xpos=3;
				 else if(cx>maxx/2+91&&cx<maxx/2+144) xpos=4;
	  if(dx>130&&dx<195) ypos=0;
	    else if(dx>200&&dx<265) ypos=1;
		   else if(dx>270&&dx<335) ypos=2;
			  else if(dx>340&&dx<405) ypos=3;
				 else if(dx>410&&dx<475) ypos=4;
	  if(cx>maxx/2+125&&cx<maxx/2+140&&dx>8&&dx<22)
	  {
		xpos=0;
		ypos=10;
	  }
	  if(cx>30&&cx<120)
	  {   if(dx>100&&dx<130)
	      {
		xpos=25;
		ypos=10;
	      }
	       else if(dx>190&&dx<220)
		    {
			xpos=5;
			ypos=8;
		    }
	  }
	  else if(cx>maxx-120&&cx<maxx-30)
	       {
		    if(dx>100&&dx<130)
		    {
			xpos=20;
			ypos=10;
		    }
		    else if(dx>190&&dx<220)
		    {
			xpos=10;
			ypos=10;
		    }
	       }
	}
	if(xpos!=6&&ypos!=6) flag=1;
	  else flag=0;
	return xpos+5*ypos;
}

int con0(char x)
{
	if(x=='.') return 0;
	if(isdigit(x)==0) return 1;
	return 0;
}

void checksymbol()
{

	if(k==0)
	{
		if(count==0||count==1||count==2||count==9||count==10||count==15||count==19||count==23||count==24)
		  count=26;
	}
	if(count==0)
	{
		if(calc[k-1]=='.'||calc[k-1]==char(251)||calc[k-1]=='+'||calc[k-1]=='^'||calc[k-1]=='-'||calc[k-1]=='X'||calc[k-1]=='C'||calc[k-1]=='S'||calc[k-1]=='/')
		count=27;
	}
	if(count==1)
	{
		int flag1=0,flag =0,i=k-1;
		while(flag==0&&flag1==0&&i>=0)
		{
			 if(i>=1) flag1=con0(calc[i-1]);
			   else   flag1=1;
			 if(calc[i]=='.') flag=1;
			 i--;
		}
		if(flag==1) count=26;

	}
	if((count==5||count==20||count==21)&&k!=0)
	{
		if(isdigit(calc[k-1])!=0&&calc[k-1]!='\0')
		  calc[k++]='X';
		if(calc[k-1]=='.')
		  calc[k-1]='X';
	}
	if((count==5||count==6||count==7|| count==8||count==11||count==12||count==13||count==16||count==17||count==18||count==20||count==21||count==22)&&k!=0)
	{
		int flag=0;
		while(flag==0)
		 if(calc[k-1]=='!'||calc[k-1]==char(253))
		 {
			  calc[k]='X';
			  k++;
		 }
		   else flag=1;
	}
	if(count==5||count==15||count==20||count==21)
	{
		int flag=0;
		while(!flag)
		{
			if(calc[k-1]=='C'||calc[k-1]=='S'||calc[k-1]==char(253)||calc[k-1]==char(251)||calc[k-1]=='^')
			  calc[k--]='\0';
			  else flag=1;
		}


	}
	if(count==1||count==15||count==23)
	{
		int flag=0;
		while(!flag)
		{
			if(isdigit(calc[k-1])==0&&k>0)
			  calc[k--]='\0';
			  else flag=1;
		}
		if(k==0)
		{
			checksymbol();
			if(count==26) calc[k]='\0';
		}
	}
	if(count==14)
	{
		int flag=0;
		while(flag==0)
		{
			if(calc[k-1]=='+'||calc[k-1]=='.'||calc[k-1]==char(251))
			 {
				  calc[k]='\0';
				  k--;
			 }
			   else if(calc[k-1]=='-')
				{
					calc[k]='\0';
					calc[--k]='+';
					count=9;
				}
				  else flag=1;
		}
	}
	if(count==1||count==9||count==10||count==15||count==19||count==23||count==24)
	{
		int flag=0;
		while(flag==0&&k>0)
		 if(calc[k-1]=='+'||calc[k-1]=='-'||calc[k-1]=='X'||calc[k-1]=='/'||calc[k-1]=='C'||calc[k-1]=='S'||calc[k-1]==char(251)||calc[k-1]=='^'||calc[k-1]=='.')
		 {
			  calc[k]='\0';
			  k--;
		 }
		   else flag=1;
		if(k==0)
		{
			checksymbol();
			if(count==26) calc[k]='\0';
		}
	}

}

int display(int pos)
{
	count=pos;
	if(k>=11)
	{
	  strcpy(calc,"ERROR!");
	  calc[6]='\0';
	  setfillstyle(SOLID_FILL,BLACK);
	  for(int j=0;j<3;j++)
	  {
		bar(maxx/2-140,40,maxx/2+140,115);
		delay(300);
		setcolor(WHITE);
		settextstyle(0,0,3);
		outtextxy(maxx/2+140-24*6,80,calc);
		delay(300);
	  }
	  return 1;
	}
	if(pos==45)
	{
		for(int i=0;i<13;i++) mem[i]='\0';
		strcpy(mem,calc);
		delay(200);
		return 4;
	}
	if(pos==50)
	{
		if(rad==1) strcpy(degrad,"DEG");
		  else strcpy(degrad,"RAD");
		rad*=-1;
		setfillstyle(SOLID_FILL,BLACK);
		bar(maxx/2+110,40,maxx/2+140,60);
		settextstyle(2,0,4);
		outtextxy(maxx/2+120,40,degrad);
		delay(200);
		return 4;
	}
	if(pos==60)
	{
		for(int i=0;i<13;i++) calc[i]='\0';
		strcpy(calc,mem);
		k=strlen(calc);
		setfillstyle(SOLID_FILL,BLACK);
		bar(maxx/2-140,40,maxx/2+140,115);
		setcolor(WHITE);
		settextstyle(0,0,3);
		outtextxy(maxx/2+140-24*k,80,calc);
		settextstyle(2,0,4);
		outtextxy(maxx/2+120,40,degrad);
		delay(200);
		return 4;
	}
	if(pos==70)
	{
		if(pre==-1)
		{
			cleardevice();
			setfillstyle(SOLID_FILL,LIGHTGRAY);
			bar(maxx-120,100,maxx-30,130);
			settextstyle(1,0,1);
			outtextxy(maxx-90,102,"PRE");
			outtextxy(5,5,"Previous Calculations: ");
			settextstyle(3,0,1);
			for(int i=0;i<h;i++)
			{
				outtextxy(5,40+70*i,"Expression: ");
				outtextxy(120,40+70*i,data[i].exp);
				outtextxy(5,70+70*i,"Result: ");
				outtextxy(120,70+70*i,data[i].res);
			}
		}
		else
		{
			cleardevice();
			draw();
			setcolor(WHITE);
			settextstyle(0,0,3);
			outtextxy(maxx/2+140-24*k,80,calc);
			settextstyle(2,0,4);
			outtextxy(maxx/2+120,40,degrad);
		}
		pre*=-1;
		delay(200);
		return 4;

	}
	if(pos==75)
	{
		if(help==-1)
		{
			cleardevice();
			setfillstyle(SOLID_FILL,LIGHTGRAY);
			bar(30,100,120,130);
			settextstyle(1,0,1);
			outtextxy(55,102,"HELP");
			settextstyle(3,0,1);
			for(int i=0;i<10;i++)
			outtextxy(5,140+30*i,guide[i]);
		}
		else
		{
			cleardevice();
			draw();
			setcolor(WHITE);
			settextstyle(0,0,3);
			outtextxy(maxx/2+140-24*k,80,calc);
			settextstyle(2,0,4);
			outtextxy(maxx/2+120,40,degrad);
		}
		help*=-1;
		delay(200);
		return 4;
	}
	if(pos==100)
	{
		  strcpy(calc,"brOS");
		  calc[4]='\0';
		  setfillstyle(SOLID_FILL,BLACK);
		  bar(maxx/2-140,40,maxx/2+140,115);
		  setcolor(15);
		  settextstyle(0,0,4);
		  outtextxy(maxx/2-55,65,calc);
		  settextstyle(2,0,4);
		  outtextxy(maxx/2+120,40,degrad);
		  calc[0]=calc[1]=calc[2]=calc[3]='\0';
		  return 4;
	}
	if(pos==4)
	{
		button(maxx/2-145+pos%5*59,125+68*(pos/5),0);
		delay(200);
		button(maxx/2-145+pos%5*59,125+68*(pos/5));
		return 0;
	}
	if(pos==3)
	{
		button(maxx/2-145+pos%5*59,125+68*(pos/5),0);
		delay(200);
		button(maxx/2-145+pos%5*59,125+68*(pos/5));
		return 1;
	}
	if(pos==2&&k!=0)
	{
		button(maxx/2-145+pos%5*59,125+68*(pos/5),0);
		delay(200);
		button(maxx/2-145+pos%5*59,125+68*(pos/5));
		return 2;
	}
	if(pos==0)
	{

		checksymbol();
		if(count!=26&&count!=27)
		{
			button(maxx/2-145+pos%5*59,125+68*(pos/5),0);
			delay(200);
			button(maxx/2-145+pos%5*59,125+68*(pos/5));
			return 5;
		}
		  else if(count==26) return 1;
		       else return 2;
	}
	if(flag==1)
	{
		checksymbol();
		pos=count;
		if(pos!=15&&pos!=26) calc[k++]=name[pos][0];
		    else if(pos==15) calc[k++]=name[pos][1];
		setfillstyle(SOLID_FILL,BLACK);
		bar(maxx/2-140,40,maxx/2+140,115);
		setcolor(WHITE);
		settextstyle(0,0,3);
		outtextxy(maxx/2+140-24*k,80,calc);
		settextstyle(2,0,4);
		outtextxy(maxx/2+120,40,degrad);
		if(pos!=26)
		{
			button(maxx/2-145+pos%5*59,125+68*(pos/5),0);
			delay(200);
			button(maxx/2-145+pos%5*59,125+68*(pos/5));
		}
		return 4;
	}
	return 100;
}

int value(char x,char y=' ')
{
	if(x=='+') return 1;
	if(x=='-'&&(y=='^'||y=='X'||y=='C'||y=='S'||y=='/')) return 5;
	  else if(x=='-') return 1;
	if(x=='X'||x=='/') return 2;
	if(x=='^'||x==char(253)) return 3;
	if(x=='C'||x=='S'||x=='!'||x==char(251)) return 4;
	if(x=='_') return 5;
	if(x=='\0') return 0;
	return 100;
}

int con3(char x)
{
	if(x=='.') return 1;
	if(x==' ') return 1;
	if(isdigit(x)!=0) return 1;
	return 0;
}

int con2(char x, char y)
{
	if(x=='.') return 0;
	if(isdigit(x)==0)
	  if(isdigit(y)!=0) return 1;
	return 0;
}

int con1(char x,char y)
{
	if(isdigit(x)!=0)
	{
		if(y=='.') return 0;
		if(isdigit(y)==0) return 1;
	}
	return 0;
}

void postfix()
{
	if(h==5)
	{
		 for(int i=1;i<5;i++)
		 {
			strcpy(data[i-1].exp,data[i].exp);
			strcpy(data[i-1].res,data[i].res);
		 }
		 h--;
	}
	strcpy(data[h].exp,calc);
	k++;
	for(int i=0;i<30;i++) inexp[i]=postexp[i]='\0';
	y=j=z=0;
	for(i=0;i<k;i++)
	{
		if(i>0)
		{
			int b=con1(calc[i],calc[i-1]),c=con2(calc[i],calc[i-1]);
			if(b) inexp[j++]=' ';
			  else if(c) inexp[j++]=' ';
		}
		else inexp[j++]=' ';
		inexp[j++]=calc[i];
	}
	inexp[j]=';';
	inexp[j+1]='~';
	for(i=0;inexp[i]!='~';i++)
	{
		int d=con3(inexp[i]);
		if(d)
		{
			postexp[z++]=inexp[i];
		}
		 else if(inexp[i]!=';')
		      {
				int p,q;
				if(i>1)p=value(inexp[i],inexp[i-1]);
				else if(i==1&&inexp[i]=='-') p=5;
				else p=4;
				if(p==5&&inexp[i]=='-') inexp[i]='_';
				if(y==0) q=0;
				  else q=value(stack[y-1]);
				if(p>q)
				{
					stack[y++]=inexp[i];
				}
				else
				{
					while(y>0&&p<=q)
					{
					    postexp[z++]=stack[y-1];
					    y--;
					    stack[y]='\0';
					    if(y==0) q=0;
					      else q=value(stack[y-1]);
					}
					stack[y++]=inexp[i];
				}
			}
			 else
			 {
				for(;y>0;y--)
				{
				  postexp[z++]=stack[y-1];
				  stack[y-1]='\0';
				}
			 }
	}
}

float _(float n)
{
      return -n;
}

float S(float n)
{
      if(rad==-1) n=n*3.1415/180;
      return sin(n);
}

float C(float n)
{
      if(rad==-1) n=n*3.1415/180;
      return cos(n);
}

float SQRT(float n)
{
      return sqrt(n);
}

int fact(int n)
{
	int s=1;
	for(;n>0;n--)
	   s*=n;
	return s;
}

float power(float n1,float n2)
{
	return pow(n1,n2);
}

float sum(float n1,float n2)
{
	return n1+n2;
}

float dif(float n1,float n2)
{
	return n1-n2;
}

float mul(float n1,float n2)
{
	return n1*n2;
}

float div(float n1,float n2)
{
	if(n2!=0) return n1/n2;
	else return 0;
}

void calculate()
{
	float result[10]={0};
	n=0;
	char temp[15]={'\0'};
	for(int i=0;i<z;i++)
	{
		int  x=0;
		if(isdigit(postexp[i])!=0)
		{
			while(isspace(postexp[i])==0)
			{
				temp[x]=postexp[i];
				x++;
				i++;
			}
			result[n]=strtod(temp,NULL);
			n++;
			for(x=0;x<15;x++)
			  temp[x]='\0';
		}
		else if(postexp[i]!=' ')
		     {
			switch(postexp[i])
			{
				case '_':result[n-1]=_(result[n-1]);break;
				case char(251):result[n-1]=sqrt(result[n-1]);break;
				case 'C':result[n-1]=C(result[n-1]);break;
				case 'S':result[n-1]=S(result[n-1]);break;
				case '!':result[n-1]=fact(result[n-1]);break;
				case char(253):result[n-1]=power(result[n-1],2);break;
				case '^':result[n-2]=power(result[n-2],result[n-1]);result[n-1]=0;n--;break;
				case '+':result[n-2]=sum(result[n-2],result[n-1]);result[n-1]=0;n--;break;
				case '-':result[n-2]=dif(result[n-2],result[n-1]);result[n-1]=0;n--;break;
				case 'X':result[n-2]=mul(result[n-2],result[n-1]);result[n-1]=0;n--;break;
				case '/':result[n-2]=div(result[n-2],result[n-1]);result[n-1]=0;n--;break;
			}
		     }
	}
	for(k=0;k<13;k++) calc[k]=temp[k]='\0';
	double m=result[0];
	if(m<0)
	{
		calc[0]='-';
		m*=-1;
	}
	m*=1000;
	if(m-int(m)>4/9.0)m++;
	m/=1000;
	ltoa(m,temp,10);
	strcat(calc,temp);
	if(strlen(calc)<6)
	{
		for(k=0;k<13;k++) temp[k]='\0';
		strcat(calc,".");
		ltoa((m-int(m))*100,temp,10);
		int s=(m-int(m))*100;
		for(k=0;s!=0;s/=10) k++;
		for(;k<2;k++) strcat(calc,"0");
		strcat(calc,temp);
		k=strlen(calc);
	}
	else for(i=0;i<13;i++) calc[i]='\0';
	strcpy(data[h].res,calc);
	if(h!=5) h++;
}
void broscalc()
{
	setbkcolor(BLACK);
		int x = 1;
		cleardevice();
		draw();
		count=0;
		i.x.ax=0;
		int86(0x33,&i,&o);
		i.x.ax=1;
		int86(0x33,&i,&o);
		draw();
		display(100);
		while(x)
		{
			x=display(input());
			delay(80);
			if(x==1)
			{
			    for(k=0;k<13;k++) calc[k]='\0';
			    k=0;
			    display(25);
			    k--;
			}
			if(x==2)
			{
				k--;
				display(25);
				k--;
			}
			if(x==5)
			{
			     postfix();
			     calculate();
			     setfillstyle(SOLID_FILL,BLACK);
			     bar(maxx/2-140,40,maxx/2+140,115);
			     setcolor(WHITE);
			     settextstyle(0,0,3);
			     outtextxy(maxx/2+140-24*k,80,calc);
			     settextstyle(2,0,4);
			     outtextxy(maxx/2+120,40,degrad);
			}
		}
}