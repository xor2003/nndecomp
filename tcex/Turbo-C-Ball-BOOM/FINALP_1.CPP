#include <graphics.h>
#include <stdlib.h>
#include <stdio.h>
#include <conio.h>
#include <dos.h>
#include <iostream.h>
#include <math.h>
#include <time.h>

void getmousepos(int *button, int *x, int *y);
void Start();
void Level1Drawing();
int IsInside(int Circle_x,int Circle_y,int radius,int x,int y);
void fillarea(int num1 , int num2 , int color, int oldcolor);
void Level1Playing();
void Level2Drawing();
void Level2Playing();
void GameOver();

//----------------------------------------------------------------

union REGS i,o;
int x1=320,y1=25,x,y,arrow1,arrow2,arrow3,arrow4;
int button , flag=0 ;
int r=40;
time_t timer , now;

int main()
{
int gdriver = DETECT, gmode, errorcode;
initgraph(&gdriver, &gmode, "c:\\tc\\bgi"); //initialize graphics mode
errorcode = graphresult();  //read result of initialization
if (errorcode != grOk)  // an error occured
{
    printf("Graphics error: %s\n", grapherrormsg(errorcode));
    printf("Press any key to halt:");
    getch();
    exit(1);
}

//graphic 1 final project ... first page
    Start();
    setbkcolor(WHITE);

//level 1 starting here
    time(&timer);
	Level1Drawing();
    Level1Playing();
		
//level 2 starting here
    time(&timer);
	r/=2;
    Level2Drawing();
    Level2Playing();

//the end
    GameOver();

	
getch();
closegraph(); //The function closes the graphical mode.
return 0;
}

void getmousepos(int *button, int *x, int *y)
{ 
   i.x.ax =3;
   int86(0X33,&i,&o);  
   *button = o.x.bx;
   *x = o.x.cx;
   *y = o.x.dx;
 }

void Start()
{
    //First Page Codes Starting Here :)
    
    setbkcolor(BLACK);
    setcolor(DARKGRAY);
    
    //Names 
    settextstyle(4 , HORIZ_DIR , 3);
    outtextxy(50 , 50 , "Amir Ghanem 313258030");
    outtextxy(50 , 100 , "Alam Aslan 208913236");
	
	//About The Game
	settextstyle(6 , HORIZ_DIR , 3);
	outtextxy(50 , 180 , "ABOUT THE GAME...");
	settextstyle(7 , HORIZ_DIR , 2);
	outtextxy(50 , 220 , "shot all the balls to win :)");
	outtextxy(50 , 260 , "you have 7 balls to shoot in every round");
	outtextxy(50 , 300 , "round 2 become harder ... ");
	outtextxy(50 , 340 , "balls become smaller and the aroow become faster");
	outtextxy(50 , 380 , "use SPACE for shooting");

    //Start Button
	settextstyle(4 , HORIZ_DIR , 3);
    outtextxy(getmaxx()-100 , getmaxy()-100 , "START");
    rectangle(getmaxx()-105 , getmaxy()-101 , getmaxx()-15 , getmaxy()-70);
    
    //Show The Mouse On Screen
    i.x.ax=1;
    int86(0x33,&i,&o); 
    
    //Press On The Start Button To Start The Game :)
    i.x.ax=3; 
    int86(0x33,&i,&o);
    
    while(flag!=1)
    {
    	getmousepos(&button, &x, &y);
    	if( (x>getmaxx()-105)  &&  (x<getmaxx()-15)  &&  (y>getmaxy()-101)  &&  (y<getmaxy()-70) && (button==1) )
    	{
    		flag=1;
    		setbkcolor(WHITE);
    		cleardevice();	
    	}
    }
}

void fillarea(int num1 , int num2 , int color, int oldcolor)
{
   if (getpixel(num1,num2)==oldcolor)
   {
     putpixel(num1,num2,color);
     fillarea(num1 ,num2+1,color,oldcolor);
     fillarea(num1, num2-1,color,oldcolor);
     fillarea(num1+1, num2 ,color,oldcolor);
     fillarea(num1-1,num2, color,oldcolor);
   }
}

int IsInside(int Circle_x,int Circle_y,int radius,int x,int y){
	  if ((x - Circle_x) * (x - Circle_x) + (y - Circle_y) * (y - Circle_y) <= radius * radius)
		  return 1;
	  return 0;
}
 
void Level1Drawing()
{
	setcolor(DARKGRAY);
    settextstyle(1 , HORIZ_DIR , 3);
    outtextxy(getmaxx()-100 , 20 , "LEVEL.1");
    rectangle(getmaxx()-110 , 20 , getmaxx()-10 , 50);

	setcolor(DARKGRAY);
	rectangle(getmaxx()/2-40,0,getmaxx()/2+40,25);
	setfillstyle(1 , DARKGRAY);
	floodfill(getmaxx()/2 , 10 , DARKGRAY);
	
	//game percent panel
	setcolor(BLUE);
	rectangle(10 , 20 , 135 , 50);
	
	//time panel
	setcolor(BLUE);
	rectangle(10 , 55 , 135 , 85);
	
	//LEFT BALL
	setcolor(1);
	circle(r,getmaxy()-250,r);
    setfillstyle(1 , 1);
    floodfill(r , getmaxy()-250 , 1);	
	
	//LEFT CENTER BALL
	setcolor(3);
	circle(getmaxx()/4 , getmaxy()-200,r);
    setfillstyle(1 , 3);
    floodfill(getmaxx()/4 , getmaxy()-200 , 3);	
	
	//CENTER BALL 
	setcolor(5);
	circle(getmaxx()/2 , getmaxy()-150,r);
    setfillstyle(1 , 5);
    floodfill(getmaxx()/2 , getmaxy()-150 , 5);	
	
	//CENTER RIGHT BALL
	setcolor(7);
	circle((getmaxx()/4)*3,getmaxy()-200,r);
    setfillstyle(1 , 7);
    floodfill((getmaxx()/4)*3 , getmaxy()-200 , 7);	
	
	//RIGHT BALL
	setcolor(9);
	circle(getmaxx()-r,getmaxy()-250,r);
    setfillstyle(1 , 9);
    floodfill(getmaxx()-r , getmaxy()-250 , 9);	
	
	//BOTTOM LEFT BALL
	setcolor(11);
	circle(2*r,getmaxy()-2*r,r);
    setfillstyle(1 , 11);
    floodfill(2*r , getmaxy()-2*r , 11);	
	
	//BOTOOM RIGHT BALL
	setcolor(13);
	circle(getmaxx()-2*r,getmaxy()-2*r,r);
    setfillstyle(1 , 13);
    floodfill(getmaxx()-2*r , getmaxy()-2*r , 13);
}

void Level1Playing()
{	
    int k,a,b;
	char ch;
	int flag1=0,flag3=0,flag5=0,flag7=0,flag9=0,flag11=0,flag13=0;
	int cnt=0;
	double i;
	
	char msg[20];
	double oldpercent=0.0 , percent=0.0;
	
	settextstyle(4 , HORIZ_DIR , 1);
	setcolor(DARKGRAY);
	sprintf(msg,"%lf%",percent);
    outtextxy(21,21,msg);

	time(&now);
    int oldseconds=difftime(now,timer) , seconds=0;

	while(cnt!=7)
    {	
	    for(i=3.05;i>0;i-=0.01)
		{
			//how balls percent reveived
			percent = (double)(cnt / 7.0 *100.0);
			if(oldpercent != percent)
			{
				oldpercent = percent;
				setfillstyle(1 , WHITE);
				floodfill(30 , 40 , BLUE);
				setcolor(DARKGRAY);
				sprintf(msg , "%lf%" , percent);
				outtextxy(21 , 21 , msg);
			}
			
			//level time
			time(&now);
			seconds = difftime(now,timer);
			if(oldseconds != seconds)
			{
                oldseconds = seconds;				
		    	setfillstyle(1 , WHITE);
		    	floodfill(120 , 70 , BLUE);
	        	setcolor(DARKGRAY);
	        	sprintf(msg , "%d sec" , seconds);
	        	outtextxy(21 , 56 , msg);
			}
				
		    x=x1+55*cos(i);
	        y=y1+55*sin(i);
		    arrow1=x-10*cos(i-0.5);
		    arrow2=y-10*sin(i-0.5);
		    arrow3=x-10*cos(i+0.5);
		    arrow4=y-10*sin(i+0.5);
	        setcolor(DARKGRAY);
	        line(x1,y1+2,x,y);
		    line(x,y,arrow1,arrow2);
		    line(x,y,arrow3,arrow4);
	        delay(10);
		    if(kbhit())
			{
			    ch=getch();		  
		    }
		    if(ch==32)
			{
                setcolor(BLACK);
		        line(x,y,arrow1,arrow2);
		        line(x,y,arrow3,arrow4);			  
		        for (k=1; a!= 0 && a!= getmaxx() && b!= getmaxy() ; k++)
		    	{
					//level time
		        	time(&now);
		        	seconds = difftime(now,timer);
		        	if(oldseconds != seconds)
		        	{
                        oldseconds = seconds;				
		            	setfillstyle(1 , WHITE);
		            	floodfill(120 , 70 , BLUE);
	                	setcolor(DARKGRAY);
	                	sprintf(msg , "%d sec" , seconds);
	                	outtextxy(21 , 56 , msg);
		        	}
			
		    	    a=x1+(55+k)*cos(i);
		    	    b=y1+(55+k)*sin(i);
		    	    arrow1=a-10*cos(i-0.5);
		            arrow2=b-10*sin(i-0.5);
		            arrow3=a-10*cos(i+0.5);
		            arrow4=b-10*sin(i+0.5);
			        putpixel(a,b,DARKGRAY);
			        setcolor(DARKGRAY);
			        line(a-1,b,arrow1,arrow2);
		            line(a+1,b,arrow3,arrow4);
			        delay(2);
			        setcolor(WHITE);
			        line(a-1,b,arrow1,arrow2);
		            line(a+1,b,arrow3,arrow4);
			  
			        delay(5);
			        if((a>=0 && a<=2*r && b>=getmaxy()-250-r && b<=getmaxy()-250+r)&&IsInside(r,getmaxy()-250,r,a,b)==1&&flag1==0)	
					{
			      	    fillarea(r,getmaxy()-250,WHITE,1);
			      	    flag1=1;
			      	    cnt++;
                        break;				  
			        }
			        if((a>=getmaxx()/4-r && a<=getmaxx()/4+r && b>=getmaxy()-200-r && b<=getmaxy()-200+r)&&(IsInside(getmaxx()/4,getmaxy()-200,r,a,b)==1)&&flag3==0)
					{
			      	    fillarea(getmaxx()/4,getmaxy()-200,WHITE,3);                                             
			      	    flag3=1;
			      	    cnt++;
			      	    break;
			        }
					
                    if((a>=getmaxx()/2-r && a<=getmaxx()/2+r && b>=getmaxy()-150-r && b<=getmaxy()-150+r)&&(IsInside(getmaxx()/2,getmaxy()-150,r,a,b))&&flag5==0)
					{
				        fillarea(getmaxx()/2,getmaxy()-150,WHITE,5);
				        flag5=1;
				        cnt++;
				        break;
			        }
                    if((a>=getmaxx()/4*3-r && a<=getmaxx()/4*3+r && b>=getmaxy()-200-r && b<=getmaxy()-200+r)&&(IsInside(getmaxx()/4*3,getmaxy()-200,r,a,b)==1)&&flag7==0)
					{
			      	    fillarea(getmaxx()/4*3,getmaxy()-200,WHITE,7);
			      	    flag7=1;
			      	    cnt++;
			      	    break;
			        }
                    if((a>=getmaxx()-r-r && a<=getmaxx()-r+r && b>=getmaxy()-250-r && b<=getmaxy()-250+r)&&(IsInside(getmaxx()-r,getmaxy()-250,r,a,b)==1)&&flag9==0)
					{
				        fillarea(getmaxx()-r,getmaxy()-250,WHITE,9);
				        flag9=1;
				        cnt++;
				        break;
			        }
                    if((a>=(2*r)-r && a<=(2*r)+r && b>=getmaxy()-(2*r)-r && b<=getmaxy()-(2*r)+r)&&(IsInside(2*r,getmaxy()-(2*r),r,a,b)==1)&&flag11==0)
					{
				        fillarea(2*r,getmaxy()-(2*r),WHITE,11);
				        flag11=1;
				        cnt++;
				        break;
			        }
                    if((a>=getmaxx()-(2*r)-r && a<=getmaxx()-(2*r)+r && b>=getmaxy()-(2*r)-r && b<=getmaxy()-(2*r)+r)&&(IsInside(getmaxx()-(2*r),getmaxy()-(2*r),r,a,b)==1)&&flag13==0)
					{
				        fillarea(getmaxx()-(2*r),getmaxy()-(2*r),WHITE,13);
				        flag13=1;
				        cnt++;
				        break;
			        }			   
		        }
	  	      	a=x1+(55+k)*cos(i);
		    	b=y1+(55+k)*sin(i);				
		    	for (; k>=1; k--)
				{	   
					//level time
		        	time(&now);
		        	seconds = difftime(now,timer);
		        	if(oldseconds != seconds)
		        	{
                        oldseconds = seconds;				
		            	setfillstyle(1 , WHITE);
		            	floodfill(120 , 70 , BLUE);
	                	setcolor(DARKGRAY);
	                	sprintf(msg , "%d sec" , seconds);
	                	outtextxy(21 , 56 , msg);
		        	}
					
		        	a=x1+(55+k)*cos(i);
		        	b=y1+(55+k)*sin(i);
		        	arrow1=a-10*cos(i-0.5);
		            arrow2=b-10*sin(i-0.5);
		            arrow3=a-10*cos(i+0.5);
		            arrow4=b-10*sin(i+0.5);
		        	putpixel(a,b,WHITE);
		        	setcolor(DARKGRAY);
		        	line(a-1,b,arrow1,arrow2);
		            line(a+1,b,arrow3,arrow4);
		        	delay(5);
                    setcolor(WHITE);
		        	line(a-1,b,arrow1,arrow2);
		            line(a+1,b,arrow3,arrow4);	 
		    	}
				ch='a';	  	 							
		    }
			setcolor(WHITE);
			//line(x1,y1+2,x,y);
			line(x1,y1+2,x,y);
			line(x,y,arrow1,arrow2);
			line(x,y,arrow3,arrow4);
	        
			if(cnt==7)
			    break;
		}	
		

		
	    for(i=0;i<3.05;i=i+0.01)
		{  	
			//how balls percent reveived
			percent = (double)(cnt / 7.0 *100.0);
			if(oldpercent != percent)
			{
				oldpercent = percent;
				setfillstyle(1 , WHITE);
				floodfill(30 , 30 , BLUE);
				setcolor(DARKGRAY);
				sprintf(msg , "%lf%" , percent);
				outtextxy(21 , 21 , msg);	
			}
			
			//level time
			time(&now);
			seconds = difftime(now,timer);
			if(oldseconds != seconds)
			{
                oldseconds = seconds;				
		    	setfillstyle(1 , WHITE);
		    	floodfill(120 , 70 , BLUE);
	        	setcolor(DARKGRAY);
	        	sprintf(msg , "%d sec" , seconds);
	        	outtextxy(21 , 56 , msg);
			}
			
			//aroow code
			x=x1+55*cos(i);
	        y=y1+55*sin(i);
		    arrow1=x-10*cos(i+0.5);
		    arrow2=y-10*sin(i+0.5);
		    arrow3=x-10*cos(i-0.5);
		    arrow4=y-10*sin(i-0.5);
	        setcolor(DARKGRAY);
	        line(x1,y1+2,x,y);
			//top of the arrow \/
		    line(x,y,arrow1,arrow2);
		    line(x,y,arrow3,arrow4);
	        delay(10);
		    if(kbhit())
			{
		  	    ch=getch();		  
		    }
		    if(ch==32)
			{
                setcolor(WHITE);
		        line(x,y,arrow1,arrow2);
		        line(x,y,arrow3,arrow4);			  
		        for (k=1; a!= 0 && a!= getmaxx() && b!= getmaxy() ; k++)
				{
		        	//level time
		        	time(&now);
		        	seconds = difftime(now,timer);
		        	if(oldseconds != seconds)
		        	{
                        oldseconds = seconds;				
		            	setfillstyle(1 , WHITE);
		            	floodfill(120 , 70 , BLUE);
	                	setcolor(DARKGRAY);
	                	sprintf(msg , "%d sec" , seconds);
	                	outtextxy(21 , 56 , msg);
		        	}
			        // arrow code
			        a=x1+(55+k)*cos(i);
			        b=y1+(55+k)*sin(i);
			        arrow1=a-10*cos(i-0.5);
		            arrow2=b-10*sin(i-0.5);
		            arrow3=a-10*cos(i+0.5);
		            arrow4=b-10*sin(i+0.5);
					//arrow get longer
			        putpixel(a,b,DARKGRAY);
			        setcolor(DARKGRAY);
					//drawing new top arrow
			        line(a-1,b,arrow1,arrow2);
		            line(a+1,b,arrow3,arrow4);
			        delay(2);
					//romove old top arrow
			        setcolor(WHITE);
			        line(a-1,b,arrow1,arrow2);
		            line(a+1,b,arrow3,arrow4);
			  
			        // check if arrow touch any of the balls
			  	    delay(5);
			        if((a>=0 && a<=2*r && b>=getmaxy()-250-r && b<=getmaxy()-250+r)&&IsInside(r,getmaxy()-250,r,a,b)==1&&flag1==0)	
					{
			      	    fillarea(r,getmaxy()-250,WHITE,1);
			      	    flag1=1;
			      	    cnt++;
                        break;				  
			        }
			        if((a>=getmaxx()/4-r && a<=getmaxx()/4+r && b>=getmaxy()-200-r && b<=getmaxy()-200+r)&&(IsInside(getmaxx()/4,getmaxy()-200,r,a,b)==1)&&flag3==0)
					{
			      	    fillarea(getmaxx()/4,getmaxy()-200,WHITE,3);                                             
			      	    flag3=1;
			      	    cnt++;
			      	    break;
			        }
					
                    if((a>=getmaxx()/2-r && a<=getmaxx()/2+r && b>=getmaxy()-150-r && b<=getmaxy()-150+r)&&(IsInside(getmaxx()/2,getmaxy()-150,r,a,b))&&flag5==0)
					{
				        fillarea(getmaxx()/2,getmaxy()-150,WHITE,5);
				        flag5=1;
				        cnt++;
				        break;
			        }
                    if((a>=getmaxx()/4*3-r && a<=getmaxx()/4*3+r && b>=getmaxy()-200-r && b<=getmaxy()-200+r)&&(IsInside(getmaxx()/4*3,getmaxy()-200,r,a,b)==1)&&flag7==0)
					{
			      	    fillarea(getmaxx()/4*3,getmaxy()-200,WHITE,7);
			      	    flag7=1;
			      	    cnt++;
			      	    break;
			        }
                    if((a>=getmaxx()-r-r && a<=getmaxx()-r+r && b>=getmaxy()-250-r && b<=getmaxy()-250+r)&&(IsInside(getmaxx()-r,getmaxy()-250,r,a,b)==1)&&flag9==0)
					{
				        fillarea(getmaxx()-r,getmaxy()-250,WHITE,9);
				        flag9=1;
				        cnt++;
				        break;
			        }
                    if((a>=(2*r)-r && a<=(2*r)+r && b>=getmaxy()-(2*r)-r && b<=getmaxy()-(2*r)+r)&&(IsInside(2*r,getmaxy()-(2*r),r,a,b)==1)&&flag11==0)
					{
				        fillarea(2*r,getmaxy()-(2*r),WHITE,11);
				        flag11=1;
				        cnt++;
				        break;
			        }
                    if((a>=getmaxx()-(2*r)-r && a<=getmaxx()-(2*r)+r && b>=getmaxy()-(2*r)-r && b<=getmaxy()-(2*r)+r)&&(IsInside(getmaxx()-(2*r),getmaxy()-(2*r),r,a,b)==1)&&flag13==0)
					{
				        fillarea(getmaxx()-(2*r),getmaxy()-(2*r),WHITE,13);
				        flag13=1;
				        cnt++;
				        break;
			        }	
		        }
	  	     	a=x1+(55+k)*cos(i);
		    	b=y1+(55+k)*sin(i);				
		    	for (; k>=1; k--)
				{	   
					//level time
		        	time(&now);
		        	seconds = difftime(now,timer);
		        	if(oldseconds != seconds)
		        	{
                        oldseconds = seconds;				
		            	setfillstyle(1 , WHITE);
		            	floodfill(120 , 70 , BLUE);
	                	setcolor(DARKGRAY);
	                	sprintf(msg , "%d sec" , seconds);
	                	outtextxy(21 , 56 , msg);
		        	}
					
		        	a=x1+(55+k)*cos(i);
		        	b=y1+(55+k)*sin(i);
		        	arrow1=a-10*cos(i-0.5);
		            arrow2=b-10*sin(i-0.5);
		            arrow3=a-10*cos(i+0.5);
		            arrow4=b-10*sin(i+0.5);
		        	putpixel(a,b,WHITE);
		        	setcolor(DARKGRAY);
		        	line(a-1,b,arrow1,arrow2);
		            line(a+1,b,arrow3,arrow4);
		        	delay(5);
                    setcolor(WHITE);
		        	line(a-1,b,arrow1,arrow2);
		            line(a+1,b,arrow3,arrow4);	 
		    	}
				ch='a';	  	 							
			}
			setcolor(WHITE);
			line(x1,y1+2,x,y);
			line(x,y,arrow1,arrow2);
			line(x,y,arrow3,arrow4);
	        
			if(cnt==7)
			    break;
        }	
	}
    cleardevice();
}

void Level2Drawing()
{
	setcolor(DARKGRAY);
    settextstyle(1 , HORIZ_DIR , 3);
    outtextxy(getmaxx()-100 , 20 , "LEVEL.2");
    rectangle(getmaxx()-110 , 20 , getmaxx()-10 , 50);

	setcolor(DARKGRAY);
	rectangle(getmaxx()/2-40,0,getmaxx()/2+40,25);
	setfillstyle(1 , DARKGRAY);
	floodfill(getmaxx()/2 , 10 , DARKGRAY);
	
	//game percent panel
	setcolor(BLUE);
	rectangle(10 , 20 , 135 , 50);
	
	//time panel
	setcolor(BLUE);
	rectangle(10 , 55 , 135 , 85);
	
	//LEFT BALL
	setcolor(1);
	circle(r,getmaxy()-250,r);
    setfillstyle(1 , 1);
    floodfill(r , getmaxy()-250 , 1);	
	
	//LEFT CENTER BALL
	setcolor(3);
	circle(getmaxx()/4 , getmaxy()-200,r);
    setfillstyle(1 , 3);
    floodfill(getmaxx()/4 , getmaxy()-200 , 3);	
	
	//CENTER BALL 
	setcolor(5);
	circle(getmaxx()/2 , getmaxy()-150,r);
    setfillstyle(1 , 5);
    floodfill(getmaxx()/2 , getmaxy()-150 , 5);	
	
	//CENTER RIGHT BALL
	setcolor(7);
	circle((getmaxx()/4)*3,getmaxy()-200,r);
    setfillstyle(1 , 7);
    floodfill((getmaxx()/4)*3 , getmaxy()-200 , 7);	
	
	//RIGHT BALL
	setcolor(9);
	circle(getmaxx()-r,getmaxy()-250,r);
    setfillstyle(1 , 9);
    floodfill(getmaxx()-r , getmaxy()-250 , 9);	
	
	//BOTTOM LEFT BALL
	setcolor(11);
	circle(2*r,getmaxy()-2*r,r);
    setfillstyle(1 , 11);
    floodfill(2*r , getmaxy()-2*r , 11);	
	
	//BOTOOM RIGHT BALL
	setcolor(13);
	circle(getmaxx()-2*r,getmaxy()-2*r,r);
    setfillstyle(1 , 13);
    floodfill(getmaxx()-2*r , getmaxy()-2*r , 13);
}

void Level2Playing()
{
	int k,a,b;
	char ch;
	int flag1=0,flag3=0,flag5=0,flag7=0,flag9=0,flag11=0,flag13=0;
	int cnt=0;
	double i;

	char msg[20];
	double oldpercent=0.0 , percent=0.0;
	
	settextstyle(4 , HORIZ_DIR , 1);
	setcolor(DARKGRAY);
	sprintf(msg,"%lf%",percent);
    outtextxy(21,21,msg);
	
	time(&now);
    int seconds=0 , oldseconds=difftime(now,timer);	
	
	while(cnt!=7)
	{
	    for(i=3.05;i>0;i=i-0.01)
		{	
			//how balls percent reveived
			percent = (double)(cnt / 7.0 *100.0);
			if(oldpercent != percent)
			{
				oldpercent = percent;
				setfillstyle(1 , WHITE);
				floodfill(30 , 30 , BLUE);
				setcolor(DARKGRAY);
				sprintf(msg , "%lf%" , percent);
				outtextxy(21 , 21 , msg);
			}
			
			//level time
			time(&now);
			seconds = difftime(now,timer);
			if(oldseconds != seconds)
			{
                oldseconds = seconds;				
		    	setfillstyle(1 , WHITE);
		    	floodfill(120 , 70 , BLUE);
	        	setcolor(DARKGRAY);
	        	sprintf(msg , "%d sec" , seconds);
	        	outtextxy(21 , 56 , msg);
			}
			
			//arrow 
		    x=x1+55*cos(i);
	        y=y1+55*sin(i);
		    arrow1=x-10*cos(i-0.5);
		    arrow2=y-10*sin(i-0.5);
		    arrow3=x-10*cos(i+0.5);
		    arrow4=y-10*sin(i+0.5);
	        setcolor(GREEN);
	        //arrow lines
			line(x1,y1+2,x,y);
		    //the top of the arrow
			line(x,y,arrow1,arrow2);
		    line(x,y,arrow3,arrow4);
	        delay(5);
		    if(kbhit())
			{
			    ch=getch();		  
		    }
		  
		    if(ch==32)
			{
                setcolor(BLACK);
		        line(x,y,arrow1,arrow2);
		        line(x,y,arrow3,arrow4);			  
		        for (k=1; a!= 0 && a!= getmaxx() && b!= getmaxy(); k++)
				{		
			
		        	//level time
		        	time(&now);
		        	seconds = difftime(now,timer);
		        	if(oldseconds != seconds)
		        	{
                        oldseconds = seconds;				
		            	setfillstyle(1 , WHITE);
		            	floodfill(120 , 70 , BLUE);
	                	setcolor(DARKGRAY);
	                	sprintf(msg , "%d sec" , seconds);
	                	outtextxy(21 , 56 , msg);
		        	}		
					
			        a=x1+(55+k)*cos(i);
			        b=y1+(55+k)*sin(i);
			        arrow1=a-10*cos(i-0.5);
		            arrow2=b-10*sin(i-0.5);
		            arrow3=a-10*cos(i+0.5);
		            arrow4=b-10*sin(i+0.5);
			        putpixel(a,b,GREEN);
			        setcolor(GREEN);
			        line(a-1,b,arrow1,arrow2);
		            line(a+1,b,arrow3,arrow4);
			        delay(2);
			        setcolor(BLACK);
			        line(a-1,b,arrow1,arrow2);
		            line(a+1,b,arrow3,arrow4);
			  
			        delay(5);
			        if((a>=r-r && a<=r+r && b>=getmaxy()-250-r && b<=getmaxy()-250+r)&&IsInside(r,getmaxy()-250,r,a,b)==1&&flag1==0)	
					{
			      	    fillarea(r,getmaxy()-250,WHITE,1);
			      	    flag1=1;
			      	    cnt++;
                        break;				  
			        }
			        if((a>=getmaxx()/4-r && a<=getmaxx()/4+r && b>=getmaxy()-200-r && b<=getmaxy()-200+r)&&(IsInside(getmaxx()/4,getmaxy()-200,r,a,b)==1)&&flag3==0)
					{
			      	    fillarea(getmaxx()/4,getmaxy()-200,WHITE,3);                                             
			      	    flag3=1;
			      	    cnt++;
			      	    break;
			        }
					
                    if((a>=getmaxx()/2-r && a<=getmaxx()/2+r && b>=getmaxy()-150-r && b<=getmaxy()-150+r)&&(IsInside(getmaxx()/2,getmaxy()-150,r,a,b))&&flag5==0)
					{
				        fillarea(getmaxx()/2,getmaxy()-150,WHITE,5);
				        flag5=1;
				        cnt++;
				        break;
			        }
                    if((a>=getmaxx()/4*3-r && a<=getmaxx()/4*3+r && b>=getmaxy()-200-r && b<=getmaxy()-200+r)&&(IsInside(getmaxx()/4*3,getmaxy()-200,r,a,b)==1)&&flag7==0)
					{
			      	    fillarea(getmaxx()/4*3,getmaxy()-200,WHITE,7);
			      	    flag7=1;
			      	    cnt++;
			      	    break;
			        }
                    if((a>=getmaxx()-r-r && a<=getmaxx()-r+r && b>=getmaxy()-250-r && b<=getmaxy()-250+r)&&(IsInside(getmaxx()-r,getmaxy()-250,r,a,b)==1)&&flag9==0)
					{
				        fillarea(getmaxx()-r,getmaxy()-250,WHITE,9);
				        flag9=1;
				        cnt++;
				        break;
			        }
                    if((a>=(2*r)-r && a<=(2*r)+r && b>=getmaxy()-(2*r)-r && b<=getmaxy()-(2*r)+r)&&(IsInside(2*r,getmaxy()-(2*r),r,a,b)==1)&&flag11==0)
					{
				        fillarea(2*r,getmaxy()-(2*r),WHITE,11);
				        flag11=1;
				        cnt++;
				        break;
			        }
                    if((a>=getmaxx()-(2*r)-r && a<=getmaxx()-(2*r)+r && b>=getmaxy()-(2*r)-r && b<=getmaxy()-(2*r)+r)&&(IsInside(getmaxx()-(2*r),getmaxy()-(2*r),r,a,b)==1)&&flag13==0)
					{
				        fillarea(getmaxx()-(2*r),getmaxy()-(2*r),WHITE,13);
				        flag13=1;
				        cnt++;
				        break;
			        }			  
		        }
				
		    	for (; k>=1; k--)
				{	 
					//level time
		        	time(&now);
		        	seconds = difftime(now,timer);
		        	if(oldseconds != seconds)
		        	{
                        oldseconds = seconds;				
		            	setfillstyle(1 , WHITE);
		            	floodfill(120 , 70 , BLUE);
	                	setcolor(DARKGRAY);
	                	sprintf(msg , "%d sec" , seconds);
	                	outtextxy(21 , 56 , msg);
		        	}
			
		           	a=x1+(55+k)*cos(i);
		        	b=y1+(55+k)*sin(i);
		        	arrow1=a-10*cos(i-0.5);
		            arrow2=b-10*sin(i-0.5);
		            arrow3=a-10*cos(i+0.5);
		            arrow4=b-10*sin(i+0.5);
		        	putpixel(a,b,BLACK);
		        	setcolor(GREEN);
		        	line(a-1,b,arrow1,arrow2);
		            line(a+1,b,arrow3,arrow4);
		        	delay(5);
                    setcolor(BLACK);
		        	line(a-1,b,arrow1,arrow2);
		            line(a+1,b,arrow3,arrow4);			
		    	}
				ch='a';			
		    }
		   	setcolor(BLACK);
		   	//line(x1,y1+2,x,y);
		   	line(x1,y1+2,x,y);
		   	line(x,y,arrow1,arrow2);
		   	line(x,y,arrow3,arrow4);
			if(cnt==7)
			    break;
	    }		
		
	    for(i=0;i<3.05;i=i+0.01)
		{
			//how balls percent reveived
		   	percent = (double)(cnt / 7.0 *100.0);
		   	if(oldpercent != percent)
		   	{
		   		oldpercent = percent;
		   		setfillstyle(1 , WHITE);
		   		floodfill(30 , 30 , BLUE);
		   		setcolor(DARKGRAY);
		   		sprintf(msg , "%lf%" , percent);
		   		outtextxy(21 , 21 , msg);
		   	}
				
			//level time
			time(&now);
			seconds = difftime(now,timer);
			if(oldseconds != seconds)
			{
                oldseconds = seconds;				
		    	setfillstyle(1 , WHITE);
		    	floodfill(120 , 70 , BLUE);
	        	setcolor(DARKGRAY);
	        	sprintf(msg , "%d sec" , seconds);
	        	outtextxy(21 , 56 , msg);
			}
			
			x=x1+55*cos(i);
	        y=y1+55*sin(i);
		    arrow1=x-10*cos(i+0.5);
		    arrow2=y-10*sin(i+0.5);
		    arrow3=x-10*cos(i-0.5);
		    arrow4=y-10*sin(i-0.5);
	        setcolor(GREEN);
	        line(x1,y1+2,x,y);
		    line(x,y,arrow1,arrow2);
		    line(x,y,arrow3,arrow4);
	        delay(5);
			if(kbhit())
			{
			    ch=getch();		  
		    }
		    if(ch==32)
			{
                setcolor(BLACK);
		        line(x,y,arrow1,arrow2);
		        line(x,y,arrow3,arrow4);			  
		        for (k=1; a!= 0 && a!= getmaxx() && b!= getmaxy(); k++)
				{	
			
					//level time
		        	time(&now);
		        	seconds = difftime(now,timer);
		        	if(oldseconds != seconds)
		        	{
                        oldseconds = seconds;				
		            	setfillstyle(1 , WHITE);
		            	floodfill(120 , 70 , BLUE);
	                	setcolor(DARKGRAY);
	                	sprintf(msg , "%d sec" , seconds);
	                	outtextxy(21 , 56 , msg);
		        	}
			
			        a=x1+(55+k)*cos(i);
			        b=y1+(55+k)*sin(i);
			        arrow1=a-10*cos(i-0.5);
		            arrow2=b-10*sin(i-0.5);
		            arrow3=a-10*cos(i+0.5);
		            arrow4=b-10*sin(i+0.5);
			        putpixel(a,b,GREEN);
			        setcolor(GREEN);
			        line(a-1,b,arrow1,arrow2);
		            line(a+1,b,arrow3,arrow4);
			        delay(2);
			        setcolor(BLACK);
			        line(a-1,b,arrow1,arrow2);
		            line(a+1,b,arrow3,arrow4);
			  
			        delay(5);
			        if((a>=r-r && a<=r+r && b>=getmaxy()-250-r && b<=getmaxy()-250+r)&&IsInside(r,getmaxy()-250,r,a,b)==1&&flag1==0)	
					{
			      	    fillarea(r,getmaxy()-250,WHITE,1);
			      	    flag1=1;
			      	    cnt++;
                        break;				  
			        }
			        if((a>=getmaxx()/4-r && a<=getmaxx()/4+r && b>=getmaxy()-200-r && b<=getmaxy()-200+r)&&(IsInside(getmaxx()/4,getmaxy()-200,r,a,b)==1)&&flag3==0)
					{
			      	    fillarea(getmaxx()/4,getmaxy()-200,WHITE,3);                                             
			      	    flag3=1;
			      	    cnt++;
			      	    break;
			        }
					
                    if((a>=getmaxx()/2-r && a<=getmaxx()/2+r && b>=getmaxy()-150-r && b<=getmaxy()-150+r)&&(IsInside(getmaxx()/2,getmaxy()-150,r,a,b))&&flag5==0)
					{
				        fillarea(getmaxx()/2,getmaxy()-150,WHITE,5);
				        flag5=1;
				        cnt++;
				        break;
			        }
                    if((a>=getmaxx()/4*3-r && a<=getmaxx()/4*3+r && b>=getmaxy()-200-r && b<=getmaxy()-200+r)&&(IsInside(getmaxx()/4*3,getmaxy()-200,r,a,b)==1)&&flag7==0)
					{
			      	    fillarea(getmaxx()/4*3,getmaxy()-200,WHITE,7);
			      	    flag7=1;
			      	    cnt++;
			      	    break;
			        }
                    if((a>=getmaxx()-r-r && a<=getmaxx()-r+r && b>=getmaxy()-250-r && b<=getmaxy()-250+r)&&(IsInside(getmaxx()-r,getmaxy()-250,r,a,b)==1)&&flag9==0)
					{
				        fillarea(getmaxx()-r,getmaxy()-250,WHITE,9);
				        flag9=1;
				        cnt++;
				        break;
			        }
                    if((a>=(2*r)-r && a<=(2*r)+r && b>=getmaxy()-(2*r)-r && b<=getmaxy()-(2*r)+r)&&(IsInside(2*r,getmaxy()-(2*r),r,a,b)==1)&&flag11==0)
					{
				        fillarea(2*r,getmaxy()-(2*r),WHITE,11);
				        flag11=1;
				        cnt++;
				        break;
			        }
                    if((a>=getmaxx()-(2*r)-r && a<=getmaxx()-(2*r)+r && b>=getmaxy()-(2*r)-r && b<=getmaxy()-(2*r)+r)&&(IsInside(getmaxx()-(2*r),getmaxy()-(2*r),r,a,b)==1)&&flag13==0)
					{
				        fillarea(getmaxx()-(2*r),getmaxy()-(2*r),WHITE,13);
				        flag13=1;
				        cnt++;
				        break;	
			        }						   
		        }
	  	  	    a=x1+(55+k)*cos(i);
			    b=y1+(55+k)*sin(i);				
			    for (; k>=1; k--)
				{	 	

		        	//level time
		        	time(&now);
		        	seconds = difftime(now,timer);
		        	if(oldseconds != seconds)
		        	{
                        oldseconds = seconds;				
		            	setfillstyle(1 , WHITE);
		            	floodfill(120 , 70 , BLUE);
	                	setcolor(DARKGRAY);
	                	sprintf(msg , "%d sec" , seconds);
	                	outtextxy(21 , 56 , msg);
		        	}
			
		        	a=x1+(55+k)*cos(i);
		        	b=y1+(55+k)*sin(i);
		        	arrow1=a-10*cos(i-0.5);
		            arrow2=b-10*sin(i-0.5);
		            arrow3=a-10*cos(i+0.5);
		            arrow4=b-10*sin(i+0.5);
		        	putpixel(a,b,BLACK);
		        	setcolor(GREEN);
		        	line(a-1,b,arrow1,arrow2);
		            line(a+1,b,arrow3,arrow4);
		        	delay(5);
                    setcolor(BLACK);
		        	line(a-1,b,arrow1,arrow2);
		            line(a+1,b,arrow3,arrow4);	 	 
		    	}
				ch='a';	  	 							
			}
			setcolor(BLACK);
			line(x1,y1+2,x,y);
			line(x,y,arrow1,arrow2);
			line(x,y,arrow3,arrow4);
			if(cnt==7)
			    break;
	    }				
	}
    cleardevice();
}

void GameOver()
{	
    setcolor(WHITE);
	setbkcolor(BLACK);
	settextstyle(10 , HORIZ_DIR , 3);
	outtextxy(getmaxx()/2-100 , getmaxy()/2 , "GAME OVER :)");
}