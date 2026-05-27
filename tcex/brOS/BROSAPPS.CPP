#include<stdio.h>
#include<conio.h>
#include<bios.h>
#include<fstream.h>
#include<graphics.h>
#include<math.h>
#include<ctype.h>
#include<string.h>
#include<stdlib.h>
#include<dos.h>
#define PI 3.141593
#define R 170
#define sc setcolor
#include<process.h>
#include"mousesrc.cpp"
#include"brosnloa.cpp"
#include"broscloc.cpp"
#include"broscalc.cpp"
#include"broscal.cpp"
#include"ftest.cpp"
#include"brosload.cpp"
#include"brloads.cpp"
#include"calcapps.cpp"
#include"pacman.cpp"
char *brOS[] = { "Prahlad", "Roshan", "Aravind", "Nanda" };
void main()
{	int gd = DETECT, gm;
		initgraph(&gd,&gm,"C:\\TC\\BGI");
		cleardevice();
		brosn();
		delay(2000);
		cleardevice();
		screen();
		initmouse();
		i.x.ax=2;
		setlinestyle(1,0,1);
		for(int a=0; a<=getmaxy(); a++)
		{	setfillstyle(SOLID_FILL,BLACK);
			bar(0,a,getmaxx(),a+getmaxy()/30);
			delay(5);
		}
		delay(100);
		cleardevice();
		pac();
		delay(1000);
		setbkcolor(BLACK);
		cleardevice();
		sc(WHITE);
		settextstyle(2,0,10);
		for(int e = -1, ex, ey = getmaxy()/2-145; e < 4; e++, ey+=60)
		{	if(e==-1)
			{       ex = getmaxx()/2 - 4*11;
				outtextxy(ex,ey,"brOS");
				line(ex-3,ey+39,ex+90,ey+39);
			}
			else
			{
				ex = getmaxx()/2 - 11*strlen(brOS[e]);
				outtextxy(ex,ey,brOS[e]);
			}
		}
		delay(3000);
		cleardevice();
		closegraph();
}