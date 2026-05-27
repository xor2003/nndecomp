/* Copyright note regarding the ported section of the code:

Copyright 2011 by Kiavash

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/
#include "../third_party/sdl-bgi/graphics.h"
#include <stdio.h>
#include <stdlib.h>
#include <memory>
#include <math.h>
#define PI 3.14159265

/*---------------*/
struct str
{
	float r, x, z0;
	int xo, yo;
} impedance[6]; //rename type variable to avoid compile conflict

// to avoid Segment Fault in malloc, allocate heap space now
void *ptr = malloc(imagesize(1, 1, 800, 680));
void *ptrp = malloc(imagesize(1, 1, 800, 680));
//unsigned size;

/****************/
int menu(void);
void make_bar(void);
void highlight(int num);
void lowlight(int num);
void make_down(int i);
void clean_down(int i);
int gotodu(int *i, int *j, int key);
void highdown(int i, int j, int flag);
void store_s(int x1, int y1, int x2, int y2);
void restore_s(int x, int y);
void Press_key(void);
void smit_chart(void);
void load_impedance(int num, int dflag);
void demo(void);
void Vswr(void);
void Gama(void);
void Zmaxmin(void);
void LVmaxmin(void);
void line_length(float *rin, float *xin, int dflag);
void Z_input(float *rin, float *xin);
void One_stuble(void);
void schematic_line1(void);
void Two_stuble(int dflag);
void schematic_line2(void);
void Three_stuble(int dflag);
void schematic_line3(void);
float landa(int dflag);

/*-------------------------*/
int main(void)
{
	int code_menu;
	float rin, xin;

	int gdriver = DETECT, gmode = VGA, errorcode;
	initgraph(&gdriver, &gmode, (char *) "");
	
		errorcode = graphresult();
	if (errorcode != grOk) /*an error occurred */
	{
		printf("Graphics error: %s\n", grapherrormsg(errorcode));
		printf("Press any key to halt:");
		getch();
		free(ptr);
		free(ptrp);
		exit(1);
	}

	cleardevice();	//clrscr();
	setcolor(WHITE);	//textcolor(YELLOW);
	//textbackground(BLACK);
	outtextxy( 25 * 8, 10 * 8, (char *)		//gotoxy(25,10);
		"PROJECT NAME:");					//printf("...");
	outtextxy( 15 * 8, 12 * 8, (char *)		//gotoxy(15,12);
		"IMPEDANCE TRANSFORM AND MATCHING BY SMITH CHART");	//printf("...");
	outtextxy( 25 * 8, 14 * 8, (char *)		//gotoxy(25,14);
		"Teacher: Dr. O....y");				//printf("...");
	outtextxy( 25 * 8, 16 * 8, (char *)		//gotoxy(25,16);
		"Student: Ali G.....i");			//printf("...");
	outtextxy( 50 * 8, 22 * 8, (char *)		//gotoxy(50,22);
		"Press Any Key To Continue");		//printf("...");
	outtextxy( 15 * 8 , 25 * 8, (char *)
		"Ported to SDL-BGI by: Kiavash (c) 2011");
	getch();
	cleardevice();
		
	setfillstyle(SOLID_FILL, /*WHITE*/ DARKGRAY);
	bar(1, 25, getmaxx() - 1, getmaxy() - 1);
	for (;;)
	{
		code_menu = menu();
		switch (code_menu)
		{
			case 1:
				smit_chart();
				break;
			case 2:
				demo();
				break;
			case 3:
				closegraph();
				free(ptr);
				free(ptrp);
				exit(1);
			case 4:
				load_impedance(0, 0);
				break;
			case 5:
				Vswr();
				break;
			case 6:
				Gama();
				break;
			case 7:
				load_impedance(1, 0);
				break;
			case 8:
				Zmaxmin();
				break;
			case 9:
				LVmaxmin();
				break;
			case 10:
				load_impedance(2, 0);
				break;
			case 11:
				line_length(&rin, &xin, 0);
				break;
			case 12:
				Z_input(&rin, &xin);
				break;
			case 13:
				load_impedance(3, 0);
				break;
			case 14:
				One_stuble();
				break;
			case 15:
				schematic_line1();
				break;
			case 16:
				load_impedance(4, 0);
				break;
			case 17:
				Two_stuble(0);
				break;
			case 18:
				schematic_line2();
				break;
			case 19:
				load_impedance(5, 0);
				break;
			case 20:
				Three_stuble(0);
				break;
			case 21:
				schematic_line3();
				break;
		}
	}

	getch();
	closegraph();
}

/*********************************/
void smit_chart(void)
{
	int i;
	float r[35];
	setcolor(MAGENTA);
	setfillstyle(SOLID_FILL, /*BLACK*/ DARKGRAY);
	bar(1, 25, getmaxx() - 1, getmaxy() - 1);
	setlinestyle(SOLID_LINE, 1, 2);
	circle(320, 240, 210);
	r[0] = .1;
	r[1] = .3;
	r[2] = .5;
	r[3] = .7;
	r[4] = 1.0;
	r[5] = 1.2;
	r[6] = 1.6;
	r[7] = 2;
	r[8] = 2.4;
	r[9] = 2.8;
	r[10] = 3.2;
	r[11] = 3.6;
	r[12] = 3.8;
	r[13] = 5;
	r[14] = 7;
	r[15] = 9;
	r[16] = 12;
	r[17] = 16;
	r[18] = 20;
	r[19] = 30;
	r[20] = 1000;
	r[21] = 0;
	setlinestyle(SOLID_LINE, 1, 1);
	setcolor(BLUE);
	for (i = 0; r[i] != 0; i++) circle((int)(320 + 210 *r[i] / (1 + r[i])), 240, (int)(210 / (1 + r[i])));
	r[0] = 1000;
	r[1] = 300;
	r[2] = 200;
	r[3] = 100;
	r[4] = 80;
	r[5] = 70;
	r[6] = 60;
	r[7] = 50;
	r[8] = 40;
	r[9] = 30;
	r[10] = 20;
	r[11] = 10;
	r[12] = 9;
	r[13] = 8;
	r[14] = 7;
	r[14] = 6;
	r[15] = 5;
	r[16] = 4;
	r[17] = 3;
	r[18] = 2;
	r[19] = 1.5;
	r[20] = 1.3;
	r[21] = 1.0;
	r[22] = .9;
	r[23] = .8;
	r[24] = .7;
	r[25] = .55;
	r[26] = .5;
	r[27] = .3;
	r[28] = .1;
	setcolor(RED);
	for (i = 0; i < 29; i++)
	{
		arc(320 + 210, (int)(240 - 210 / r[i]), 180 - (int)((180 / PI) *atan((r[i] *r[i] - 1) / (2 *r[i]))), 270, (int)(210 / r[i]));
		arc(320 + 210, (int)(240 + 210 / r[i]), 90, 180 + (int)((180 / PI) *atan((r[i] *r[i] - 1) / (2 *r[i]))), (int)(210 / r[i]));

	}

	setcolor(RED);
	line(110, 240, 530, 240);
	setfillstyle(SOLID_FILL, WHITE);
	setcolor(WHITE);
	circle(320, 240, 2);
	floodfill(320, 240, WHITE);
	setcolor(BLUE);
	outtextxy(130, 245, (char*)
		".1");
	outtextxy(190, 245, (char*)
		".3");
	outtextxy(265, 245, (char*)
		".7");
	outtextxy(310, 245, (char*)
		"1");
	outtextxy(95, 290, (char*)
		"-.1");
	outtextxy(115, 355, (char*)
		"-.3");
	outtextxy(180, 410, (char*)
		"-.5");
	outtextxy(190, 420, (char*)
		"-.55");
	outtextxy(310, 445, (char*)
		"-1");
	outtextxy(445, 415, (char*)
		"-2");
	outtextxy(510, 340, (char*)
		"-4");
	outtextxy(357, 245, (char*)
		"1.6");
	outtextxy(407, 245, (char*)
		"2.8");
	outtextxy(85, 240, (char*)
		"0");
	outtextxy(95, 190, (char*)
		".1");
	outtextxy(115, 125, (char*)
		".3");
	outtextxy(180, 70, (char*)
		".5");
	outtextxy(190, 60, (char*)
		".55");
	outtextxy(310, 35, (char*)
		"1");
	outtextxy(445, 65, (char*)
		"2");
	outtextxy(510, 140, (char*)
		"4");

}

/************************************/
void load_impedance(int num, int dflag)

{
	float rxz[3], r, x, y0, x0/*, z0*/;
	int i, j, temp;
	int px, py, k[15], n, fff;
	char ch[10], chz[2];
	char *tem[] = { "PLEASE ENTER R =",
					"       ENTER X =",
					"       ENTER Z0 =" };
	smit_chart();
	k[0] = '0';
	k[1] = '1';
	k[2] = '2';
	k[3] = '3';
	k[4] = '4';
	k[5] = '5';
	k[6] = '6';
	k[7] = '7';
	k[8] = '8';
	k[9] = '9';
	k[10] = '.';
	k[11] = 13;
	k[12] = '-';
	chz[1] = '\0';
	rxz[2] = 300;
	store_s(120, 130, 350, 250);
	setfillstyle(SOLID_FILL, BLUE);
	setcolor(WHITE);
	rectangle(120, 130, 350, 250);
	bar(121, 131, 349, 249);
	for (i = 0; i < 3; i++)
	{
		outtextxy(130, 145 + 25 *i, tem[i]);
		moveto(270, 145 + 25 *i);
		if (dflag == 1)
		{
			gcvt((i + 1) *22, 3, ch);
			outtext(ch);
			continue;
		}

		for (j = 0; j < 7; j++)
		{
			for (;;)
			{
				fff = 0;
				temp = getch();
				for (n = 0; n < 13; n++)
					if (temp == k[n])
					{
						fff = 1;
						break;
					}

				if (fff == 1) break;
			}

			if (temp == 13) break;
			chz[0] = temp;
			outtext(chz);
			ch[j] = chz[0];
		}

		if (temp == 13) ch[j] = '\0';
		ch[7] = '\0';
		rxz[i] = atof(ch);
	}

	if (dflag == 1) Press_key();
	restore_s(120, 130);
	r = rxz[0] / rxz[2];
	x = rxz[1] / rxz[2];
	if (dflag == 1)
	{
		r = 22.0 / 66.0;
		x = 44.0 / 66.0;
		rxz[2] = 66.0;
	}

	setcolor(YELLOW);
	circle((int)(320 + 210 *r / (1 + r)), 240, (int)(210 / (1 + r)));
	delay(200);
	if (x > 0) arc(320 + 210, (int)(240 - 210 / x), 180 - (int)((180 / PI) *atan((x *x - 1) / (2 *x))), 270, (int)(210 / x));
	if (x < 0) arc(320 + 210, (int)(240 - 210 / x), 90, 180 + (int)((180 / PI) *atan((x *x - 1) / (-2 *x))), (int)(-210 / x));
	x0 = (x *x + r *r - 1) / (x *x + (1 + r) *(1 + r));
	y0 = 2 *x / (x *x + (1 + r) *(1 + r));
	px = 320 + (int)(210 *x0);
	py = 240 - (int)(210 *y0);
	setcolor(WHITE);
	circle(px, py, 4);
	delay(200);
	store_s(20, 400, 180, 460);
	setfillstyle(SOLID_FILL, BLUE);
	rectangle(20, 400, 180, 460);
	bar(21, 401, 179, 459);
	gcvt(r, 3, ch);
	outtextxy(45, 420, (char*)
		"r=");
	outtextxy(70, 420, (char*) ch);
	gcvt(x, 3, ch);
	outtextxy(45, 440, (char*)
		"x=");
	outtextxy(70, 440, (char*) ch);
	Press_key();
	restore_s(20, 400);
	impedance[num].r = r;
	impedance[num].x = x;
	impedance[num].xo = px;
	impedance[num].yo = py;
	impedance[num].z0 = rxz[2];
}

/*--------------------------*/
void Vswr(void)
{
	int px, py;
	float r, x, gamar, vswr;
	char ch[10];
	px = impedance[0].xo;
	py = impedance[0].yo;
	r = impedance[0].r;
	x = impedance[0].x;
	line(320, 240, px, py);
	delay(200);
	setcolor(LIGHTGREEN);
	circle(320, 240, (int)(210* sqrt(((r - 1) *(r - 1) + x *x) / ((r + 1) *(r + 1) + x *x))));
	gamar = sqrt(((r - 1) *(r - 1) + x *x) / ((r + 1) *(r + 1) + x *x));
	circle((int)(320 + 210 *gamar), 240, 4);
	vswr = (1 + gamar) / (1 - gamar);
	r = vswr;
	setcolor(LIGHTGREEN);
	circle((int)(320 + 210 *r / (1 + r)), 240, (int)(210 / (1 + r)));
	store_s(120, 130, 250, 200);
	setfillstyle(SOLID_FILL, BLUE);
	setcolor(WHITE);
	rectangle(120, 130, 250, 200);
	bar(121, 131, 249, 199);
	gcvt(vswr, 3, ch);
	outtextxy(121 + 8, 165 - 8, (char *)
		"VSWR=");
	outtextxy(121 + 8 * (8), 165 - 8 , (char *) ch);
	Press_key();
	restore_s(120, 130);
}

/*************************/
void Gama(void)
{
	int px, py;
	float r, x, gama, pgama, gamar, gamax, teta;
	char ch[10];
	int b/*, c*/;
	px = impedance[0].xo;
	py = impedance[0].yo;
	r = impedance[0].r;
	x = impedance[0].x;
	smit_chart();
	setcolor(YELLOW);
	circle(px, py, 4);
	line(320, 240, px, py);
	gamar = (r *r - 1 + x *x) / ((r + 1) *(r + 1) + x *x);
	gamax = 2 *x / ((r + 1) *(r + 1) + x *x);
	teta = atan(gamax / gamar);
	b = (int)(210* sqrt(((r - 1) *(r - 1) + x *x) / ((r + 1) *(r + 1) + x *x)));
	if (gamar < 0) teta = teta + PI;
	arc(320, 240, 0, (int)(180 *teta / PI), b);
	setcolor(WHITE);
	line(317 + b, 238, 320 + b, 231);
	line(323 + b, 238, 320 + b, 231);
	gama = sqrt(((r - 1) *(r - 1) + x *x) / ((r + 1) *(r + 1) + x *x));
	pgama = 180 + (int)((180 / 3.14) *(atan(x / (r - 1)) - atan(x / (r + 1))));
	setfillstyle(SOLID_FILL, BLUE);
	rectangle(20, 400, 180, 460);
	bar(21, 401, 179, 459);
	gcvt(gama, 3, ch);
	outtextxy(45, 420, (char*)
		"gama=");
	outtextxy(90, 420, (char*) ch);
	gcvt(pgama, 3, ch);
	outtextxy(45, 440, (char*)
		"<gama(deg)=");
	outtextxy(135, 440, (char*) ch);
	Press_key();
	setfillstyle(SOLID_FILL, DARKGRAY);
	bar(1, 25, getmaxx() - 1, getmaxy() - 1);
}

/***********************/
void Zmaxmin(void)
{
	int ray;
	float r, x, zmax, zmin;
	char ch[10];
	r = impedance[1].r;
	x = impedance[1].x;
	ray = (int)(210* sqrt(((r - 1) *(r - 1) + x *x) / ((r + 1) *(r + 1) + x *x)));
	circle(320, 240, ray);
	setcolor(WHITE);
	circle(320 + ray, 240, 4);
	circle(320 - ray, 240, 4);

	delay(1000);
	zmax = (1 + sqrt(((r - 1) *(r - 1) + x *x) / ((r + 1) *(r + 1) + x *x))) / (1 - sqrt(((r - 1) *(r - 1) + x *x) / ((r + 1) *(r + 1) + x *x)));
	zmin = 1 / zmax;
	setcolor(GREEN);
	circle((int)(320 + 210 *zmin / (1 + zmin)), 240, (int)(210 / (1 + zmin)));
	circle((int)(320 + 210 *zmax / (1 + zmax)), 240, (int)(210 / (1 + zmax)));
	setfillstyle(SOLID_FILL, BLUE);
	rectangle(20, 400, 180, 460);
	bar(21, 401, 179, 459);
	gcvt(zmin, 3, ch);
	outtextxy(45, 420, (char*)
		"Zmin=");
	outtextxy(90, 420, (char*) ch);
	gcvt(zmax, 3, ch);
	outtextxy(45, 440, (char*)
		"Zmax=");
	outtextxy(90, 440, (char*) ch);
	Press_key();
}

/*********************/
void LVmaxmin(void)
{
	float r, x, pgama, gamax, gamar, temp = 0, /*gama,*/ lan;
	char ch[10];
	smit_chart();
	r = impedance[1].r;
	x = impedance[1].x;
	gamar = (r *r - 1 + x *x) / ((r + 1) *(r + 1) + x *x);
	gamax = 2 *x / ((r + 1) *(r + 1) + x *x);
	pgama = atan(gamax / gamar);
	if (gamar < 0) pgama = pgama + PI;
	if (pgama < 0) pgama = pgama + 2 * PI;
	/*line(320,240,320+(int)(210*gamar),240-(int)(210*gamax)); */
	delay(1000);
	setcolor(WHITE);
	arc(320, 240, 0, (int)((180 / 3.14) *pgama), 210);
	setfillstyle(SOLID_FILL, BLUE);
	rectangle(20, 400, 280, 460);
	bar(21, 401, 279, 459);
	if (pgama > 0)
		temp = (pgama) / (4 * PI);
	lan = landa(0);
	gcvt((temp) *lan, 3, ch);
	outtextxy(45, 420, (char*)
		"LOCAL Vmax(meter)= ");
	outtextxy(195, 420, (char*) ch);
	temp = temp + .25;
	if (temp >= .5) temp = temp - .5;
	gcvt(temp *lan, 3, ch);
	outtextxy(45, 440, (char*)
		"LOCAL Vmin(meter)= ");
	outtextxy(195, 440, (char*) ch);
	Press_key();
	setfillstyle(SOLID_FILL, DARKGRAY);
	bar(1, 25, getmaxx() - 1, getmaxy() - 1);
}

/*********************/
void line_length(float *rin, float *xin, int dflag)
{
	int j, temp;
	int px, py, ray, n, fff, k[15];
	float r, x, z0, len, steta, eteta/*, lan*/;
	float /*gamar2, gamax2, gamar1, gamax1,*/ gamar, gamax, ri, xi, tt;
	char ch[10], strlen[2];
	k[0] = '0';
	k[1] = '1';
	k[2] = '2';
	k[3] = '3';
	k[4] = '4';
	k[5] = '5';
	k[6] = '6';
	k[7] = '7';
	k[8] = '8';
	k[9] = '9';
	k[10] = '.';
	k[11] = 13;
	strlen[1] = '\0';
	px = impedance[2].xo;
	py = impedance[2].yo;
	r = impedance[2].r;
	x = impedance[2].x;
	z0 = impedance[2].z0;
	line(320, 240, px, py);
	delay(200);
	ray = (int)(210* sqrt(((r - 1) *(r - 1) + x *x) / ((r + 1) *(r + 1) + x *x)));
	circle(320, 240, ray);
	store_s(120, 130, 400, 160);
	setfillstyle(SOLID_FILL, BLUE);
	setcolor(WHITE);
	rectangle(120, 130, 400, 160);
	bar(121, 131, 399, 159);
	outtextxy(130, 145, (char*)
		"ENTER LINE LENGTH : L=lanmda*");
	moveto(360, 145);
	if (dflag == 1)
	{
		gcvt(.125, 3, ch);
		outtext(ch);
		Press_key();
		len = .125;
	}

	if (dflag == 0)
	{
		for (j = 0; j < 7; j++)
		{
			for (;;)
			{
				fff = 0;
				temp = getch();
				for (n = 0; n < 12; n++)
					if (temp == k[n])
					{
						fff = 1;
						break;
					}

				if (fff == 1) break;
			}

			if (temp == 13) break;
			strlen[0] = temp;
			outtext(strlen);
			ch[j] = strlen[0];
		}

		if (temp == 13) ch[j] = '\0';
		ch[7] = '\0';
		len = atof(ch);
	}

	restore_s(120, 130);
	// gamar2 = ((r - 1) *(r - 1) + x *x) / ((r + 1) *(r + 1) + x *x);
	tt = tan(2 * PI *len);
	ri = r *(1 - x *tt) + (x + tt) *r * tt;
	ri = ri / ((1 - x *tt) *(1 - x *tt) + (r *tt *r *tt));
	xi = (x + tt) *(1 - x *tt) - r *r * tt;
	xi = xi / ((1 - x *tt) *(1 - x *tt) + (r *tt *r *tt));
	// gamar1 = ((ri - 1) *(ri - 1) + xi *xi) / ((ri + 1) *(ri + 1) + xi *xi);
	gamar = (r *r - 1 + x *x) / ((r + 1) *(r + 1) + x *x);
	gamax = 2 *x / ((r + 1) *(r + 1) + x *x);

	steta = (180 / PI) *(atan(gamax / gamar) - 4 * PI *len);
	eteta = (180 / PI) *(atan(gamax / gamar));
	if (gamar < 0)
	{
		eteta = eteta + 180;
		steta = steta + 180;
	}

	setcolor(WHITE);
	arc(320, 240, steta, eteta, ray);
	setcolor(CYAN);
	circle((int)(320 + 210 *ri / (1 + ri)), 240, (int)(210 / (1 + ri)));
	if (xi > 0) arc(320 + 210, (int)(240 - 210 / xi), 180 - (int)((180 / PI) *atan((xi *xi - 1) / (2 *xi))), 270, (int)(210 / xi));
	if (xi < 0) arc(320 + 210, (int)(240 - 210 / xi), 90, 180 - (int)((180 / PI) *atan((xi *xi - 1) / (2 *xi))), -(int)(210 / xi));
	ri = ri * z0;
	xi = xi * z0;
	*rin = ri; *xin = xi;
	Press_key();
}

/******************/
void Z_input(float *rin, float *xin)
{
	char ch[10];
	setfillstyle(SOLID_FILL, BLUE);
	rectangle(20, 400, 200, 460);
	bar(21, 401, 199, 459);
	gcvt(*rin, 3, ch);
	outtextxy(45, 420, (char*)
		"Rin=");
	outtextxy(125, 420, (char*) ch);
	gcvt(*xin, 3, ch);
	outtextxy(45, 440, (char*)
		"Xin=");
	outtextxy(125, 440, (char*) ch);
	getch();
	setfillstyle(SOLID_FILL, DARKGRAY);
	bar(1, 25, getmaxx() - 1, getmaxy() - 1);
}

/**********************/
void One_stuble(void)
{
	int px, py, /*i,*/ ray;
	char ch[10];
	float r, x, gl, bl, gamar, gamax, teta, tetap, gamarp, gamaxp, xconst, lt, lan, tetap2, gamax2, gamar2;
	setcolor(GREEN);
	circle((int)(320 + 210 / 2), 240, (int)(210 / 2));
	px = impedance[3].xo;
	py = impedance[3].yo;
	r = impedance[3].r;
	x = impedance[3].x;
	setcolor(YELLOW);
	line(320, 240, px, py);
	gl = r / (x *x + r *r);
	bl = -x / (x *x + r *r);
	line(320, 240, 640 - px, 480 - py);
	circle(px, py, 4);
	circle(640 - px, 480 - py, 4);
	delay(200);
	circle(320, 240, (int)(210* sqrt(((r - 1) *(r - 1) + x *x) / ((r + 1) *(r + 1) + x *x))));
	store_s(20, 400, 200, 460);
	setfillstyle(SOLID_FILL, BLUE);
	rectangle(20, 400, 200, 460);
	bar(21, 401, 199, 459);
	gcvt(gl, 3, ch);
	outtextxy(55, 420, (char*)
		"Gl=");
	outtextxy(100, 420, (char*) ch);
	gcvt(bl, 3, ch);
	outtextxy(55, 440, (char*)
		"Bl=");
	outtextxy(100, 440, (char*) ch);
	Press_key();
	restore_s(20, 400);
	gamar = ((r - 1) *(r - 1) + x *x) / ((r + 1) *(r + 1) + x *x);
	gamax = sqrt(gamar *(1 - gamar));
	setcolor(WHITE);
	circle((int)(320 + 210 *gamar), (int)(240 - 210 *gamax), 3);
	circle((int)(320 + 210 *gamar), (int)(240 + 210 *gamax), 3);
	teta = atan(gamax / gamar);
	gamarp = r *r + x *x - (x *x + r *r) *(x *x + r *r);
	gamarp = gamarp / ((r + r *r + x *x) *(r + r *r + x *x) + x *x);
	gamaxp = -2 *x *(r *r + x *x) / ((r + r *r + x *x) *(r + r *r + x *x) + x *x);
	tetap = atan(gamaxp / gamarp);
	ray = (int)(210* sqrt(((r - 1) *(r - 1) + x *x) / ((r + 1) *(r + 1) + x *x)));
	setcolor(CYAN);
	if (gl < 1)
	{
		if (gamarp < 0) tetap = PI + tetap;
		arc(320, 240, (int)((180 / PI) *teta), (int)((180 / PI) *tetap), ray);
		delay(1000);
		store_s(20, 400, 400, 440);
		setfillstyle(SOLID_FILL, BLUE);
		rectangle(20, 400, 400, 440);
		bar(21, 401, 399, 439);
		lan = landa(0);
		gcvt(((tetap - teta) / (4 *PI)) *lan, 3, ch);

		if (tetap < 0) gcvt(((tetap + 2 *PI - teta) / (4 *PI)) *lan, 3, ch);
		outtextxy(45, 420, (char*)
			"LOCAL SET STUB PARALLEL(meter)=");
		outtextxy(335, 420, ch);
		Press_key();
		restore_s(20, 400);
		setcolor(WHITE);
		xconst = 2 *gamax / ((1 - gamar) *(1 - gamar) + gamax *gamax);
		if (xconst > 0) arc(320 + 210, (int)(240 - 210 / xconst), 180 - (int)((180 / PI) *atan((xconst *xconst - 1) / (2 *xconst))), 270, (int)(210 / xconst));
		if (xconst < 0) arc(320 + 210, (int)(240 - 210 / xconst), 90, 180 - (int)((180 / PI) *atan((xconst *xconst - 1) / (2 *xconst))), (int)(210 / xconst));
		setfillstyle(SOLID_FILL, BLUE);
		rectangle(20, 400, 300, 440);
		bar(21, 401, 299, 439);
		gcvt(-xconst, 3, ch);
		outtextxy(45, 420, (char*)
			"     SUSEBTANCE STUB  = ");
		outtextxy(240, 420, (char*) ch);
		setcolor(WHITE);
		gamax2 = 2 *xconst / (1 + xconst *xconst);
		gamar2 = (-1 + xconst *xconst) / (1 + xconst *xconst);
		tetap2 = atan(gamax2 / gamar2);
		if (gamar2 < 0) tetap2 = tetap2 + PI;
		arc(320, 240, -(int)((180 / PI) *tetap2), 0, 210);
		Press_key();
		bar(21, 401, 299, 439);
		lt = (+tetap2) / (4 * PI);
		if (lt < 0) lt = lt + .5;
		gcvt(lt *lan, 3, ch);
		outtextxy(45, 420, (char*)
			"LENGTH STUB Lt(meter)= ");
		outtextxy(240, 420, (char *) ch);
		Press_key();
	}

	if (gl > 1)
	{
		teta = -teta;
		arc(320, 240, (int)((180 / PI) *teta), (int)((180 / PI) *tetap), ray);
		delay(1000);
		store_s(20, 400, 400, 440);
		setfillstyle(SOLID_FILL, BLUE);
		rectangle(20, 400, 400, 440);
		bar(21, 401, 399, 439);
		lan = landa(0);
		if (tetap > 0) tetap = -tetap;
		gcvt((((-teta - tetap) / (4 * PI))) *lan, 3, ch);
		outtextxy(45, 420, (char*)
			"LOCAL SET STUB PARALLEL(meter) = ");
		outtextxy(335, 420, (char*) ch);
		Press_key();
		restore_s(20, 400);
		setcolor(WHITE);
		xconst = -2 *gamax / ((1 - gamar) *(1 - gamar) + gamax *gamax);
		if (xconst > 0) arc(320 + 210, (int)(240 - 210 / xconst), 180 - (int)((180 / PI) *atan((xconst *xconst - 1) / (2 *xconst))), 270, (int)(210 / xconst));
		if (xconst < 0) arc(320 + 210, (int)(240 - 210 / xconst), 90, 180 - (int)((180 / PI) *atan((xconst *xconst - 1) / (2 *xconst))), (int)(210 / xconst));
		setfillstyle(SOLID_FILL, BLUE);
		rectangle(20, 400, 300, 440);
		bar(21, 401, 299, 439);
		gcvt(-xconst, 3, ch);
		outtextxy(45, 420, (char*)
			" SUSEBTANCE STUB =");
		outtextxy(240, 420, (char*) ch);
		setcolor(WHITE);
		gamax2 = 2 *xconst / (1 + xconst *xconst);
		gamar2 = (-1 + xconst *xconst) / (1 + xconst *xconst);
		tetap2 = atan(gamax2 / gamar2);
		if (gamar2 < 0) tetap2 = tetap2 + PI;
		arc(320, 240, -(int)((180 / PI) *tetap2), 0, 210);
		Press_key();
		bar(21, 401, 299, 439);
		if (lt < 0) lt = .5 + lt;
		lt = (+tetap2) / (4 * PI);
		gcvt(lt *lan, 3, ch);
		outtextxy(45, 420, (char*)
			"LENGTH STUB Lt(meter) = ");
		outtextxy(240, 420, (char*) ch);
		Press_key();
	}

	setfillstyle(SOLID_FILL, DARKGRAY);
	bar(1, 25, getmaxx() - 1, getmaxy() - 1);
}

/********************/
void schematic_line1(void)
{
	smit_chart();
	setfillstyle(SOLID_FILL, BLUE);
	rectangle(40, 150, 400, 440);
	bar(41, 151, 399, 439);
	setcolor(YELLOW);
	circle(60, 250, 10);
	outtextxy(56, 247, (char*)
		"G");
	line(60, 240, 60, 200);
	line(60, 260, 60, 300);
	line(60, 200, 320, 200);
	line(60, 300, 320, 300);
	line(320, 200, 320, 240);
	line(320, 300, 320, 260);
	rectangle(315, 240, 325, 260);
	line(250, 200, 130, 330);
	line(250, 300, 130, 430);
	line(130, 330, 130, 430);
	outtextxy(270, 190, (char*)
		"Ls");
	outtextxy(275, 250, (char*)
		"R+jX");
	outtextxy(175, 355, (char*)
		"Lt");
	Press_key();
	setfillstyle(SOLID_FILL, DARKGRAY);
	bar(1, 25, getmaxx() - 1, getmaxy() - 1);
}

/*******************************************/
void schematic_line2(void)
{
	smit_chart();
	setfillstyle(SOLID_FILL, BLUE);
	rectangle(40, 150, 400, 440);
	bar(41, 151, 399, 439);
	setcolor(YELLOW);
	circle(60, 250, 10);
	outtextxy(56, 247, (char*)
		"G");
	line(60, 240, 60, 200);
	line(60, 260, 60, 300);
	line(60, 200, 320, 200);
	line(60, 300, 320, 300);
	line(320, 200, 320, 240);
	line(320, 300, 320, 260);
	rectangle(315, 240, 325, 260);
	line(320, 200, 200, 330);
	line(320, 300, 200, 430);
	line(200, 330, 200, 430);
	line(280, 200, 150, 330);
	line(280, 300, 150, 430);
	line(150, 330, 150, 430);
	outtextxy(290, 190, (char*)
		"d");
	outtextxy(210, 375, (char*)
		"Lt1");
	outtextxy(125, 375, (char*)
		"Lt2");
	outtextxy(340, 250, (char*)
		"R+jX");
	Press_key();
	setfillstyle(SOLID_FILL, DARKGRAY);
	bar(1, 25, getmaxx() - 1, getmaxy() - 1);
}

/*************************/
void schematic_line3(void)
{
	smit_chart();
	setfillstyle(SOLID_FILL, BLUE);
	rectangle(40, 150, 400, 440);
	bar(41, 151, 399, 439);
	setcolor(YELLOW);
	circle(60, 250, 10);
	outtextxy(55, 245, (char*)
		"G");
	line(60, 240, 60, 200);
	line(60, 260, 60, 300);
	line(60, 200, 320, 200);
	line(60, 300, 320, 300);
	line(320, 200, 320, 240);
	line(320, 300, 320, 260);
	rectangle(315, 240, 325, 260);
	line(320, 200, 200, 330);
	line(320, 300, 200, 430);
	line(200, 330, 200, 430);
	line(280, 200, 150, 330);
	line(280, 300, 150, 430);
	line(150, 330, 150, 430);
	line(240, 200, 100, 330);
	line(240, 300, 100, 430);
	line(100, 330, 100, 430);
	outtextxy(290, 190, (char*)
		"d");
	outtextxy(260, 190, (char*)
		"d");
	outtextxy(210, 375, (char*)
		"Lt1");
	outtextxy(165, 375, (char*)
		"Lt2");
	outtextxy(120, 375, (char*)
		"Lt3");
	outtextxy(340, 250, (char*)
		"R+jX");
	Press_key();
	setfillstyle(SOLID_FILL, DARKGRAY);
	bar(1, 25, getmaxx() - 1, getmaxy() - 1);
}

/**************************/
void demo(void)
{
	float rin, xin;
	make_bar();
	highlight(2);
	make_down(2);
	load_impedance(0, 1);
	make_bar();
	highlight(2);
	make_down(2);
	highdown(2, 1, 0);
	highdown(2, 2, 1);
	Vswr();
	Press_key();
	make_bar();
	highlight(2);
	make_down(2);
	highdown(2, 2, 0);
	highdown(2, 3, 1);
	Gama();
	Press_key();

	make_bar();
	highlight(3);
	make_down(3);
	load_impedance(1, 1);
	make_bar();
	highlight(3);
	make_down(3);
	highdown(3, 1, 0);
	highdown(3, 2, 1);
	Zmaxmin();
	Press_key();
	make_bar();
	highlight(3);
	make_down(3);
	highdown(3, 2, 0);
	highdown(3, 3, 1);
	LVmaxmin();
	Press_key();

	make_bar();
	highlight(4);
	make_down(4);
	load_impedance(2, 1);
	make_bar();
	highlight(4);
	make_down(4);
	highdown(4, 1, 0);
	highdown(4, 2, 1);
	line_length(&rin, &xin, 1);
	Press_key();
	make_bar();
	highlight(4);
	make_down(4);
	highdown(4, 2, 0);
	highdown(4, 3, 1);
	Z_input(&rin, &xin);
	Press_key();

	make_bar();
	highlight(5);
	make_down(5);
	load_impedance(3, 1);
	make_bar();
	highlight(5);
	make_down(5);
	highdown(5, 1, 0);
	highdown(5, 2, 1);
	One_stuble();
	Press_key();
	make_bar();
	highlight(5);
	make_down(5);
	highdown(5, 2, 0);
	highdown(5, 3, 1);
	schematic_line1();
	Press_key();

	make_bar();
	highlight(6);
	make_down(6);
	load_impedance(4, 1);
	make_bar();
	highlight(6);
	make_down(6);
	highdown(6, 1, 0);
	highdown(6, 2, 1);
	Two_stuble(1);
	Press_key();
	make_bar();
	highlight(6);
	make_down(6);
	highdown(6, 2, 0);
	highdown(6, 3, 1);
	schematic_line2();
	Press_key();

	make_bar();
	highlight(7);
	make_down(7);
	load_impedance(5, 1);
	make_bar();
	highlight(7);
	make_down(7);
	highdown(7, 1, 0);
	highdown(7, 2, 1);
	Three_stuble(1);
	Press_key();
	make_bar();
	highlight(7);
	make_down(7);
	highdown(7, 2, 0);
	highdown(7, 3, 1);
	schematic_line3();
	Press_key();

}

/**************************/
void store_s(int x1, int y1, int x2, int y2)
{
	/*size = imagesize(x1, y1, x2, y2);
	if ((ptr = farmalloc(size)) == NULL)
	{
		closegraph();
		printf("Error: not enough heap space in save_screen().\n");
		exit(1);
	}*/

	getimage(x1, y1, x2, y2, ptr);
}

/*********************************/
void restore_s(int x, int y)
{
	putimage(x, y, ptr, COPY_PUT);
	/*farfree(ptr);*/
}

/*********************************/
void Press_key(void)
{
	int i;
	/*unsigned sizep;
	void *ptrp;
	sizep = imagesize(380, 420, 600, 460);
	if ((ptrp = farmalloc(sizep)) == NULL)
	{
		closegraph();
		printf("Error: not enough heap space in save_screen().\n");
		exit(1);
	}
	*/

	getimage(380, 420, 600, 460, ptrp);
	setfillstyle(SOLID_FILL, BLUE);
	setcolor(WHITE);
	bar(380, 420, 600, 460);
	rectangle(381, 421, 599, 459);
	outtextxy(390, 440, (char*)
		"PRESS ANY KEY TO CONTINUE");
	for (;;)
	{
		i = getch();
		if (i == 13) break;
	}

	putimage(380, 420, ptrp, COPY_PUT);
	//farfree(ptrp);
}

/*******************************/
float landa(int dflag)
{
	float lan;
	char ch[10], strlen[2];
	int j, temp;
	int n, fff, k[15];
	k[0] = '0';
	k[1] = '1';
	k[2] = '2';
	k[3] = '3';
	k[4] = '4';
	k[5] = '5';
	k[6] = '6';
	k[7] = '7';
	k[8] = '8';
	k[9] = '9';
	k[10] = '.';
	k[11] = 13;
	strlen[1] = '\0';
	store_s(120, 130, 400, 160);
	setfillstyle(SOLID_FILL, BLUE);
	setcolor(WHITE);
	rectangle(120, 130, 400, 160);
	bar(121, 131, 399, 159);
	outtextxy(130, 145, (char*)
		"  ENTER VALUE OF LAMDA =");
	moveto(360, 145);
	if (dflag == 1)
	{
		gcvt(1.0, 3, ch);
		outtext(ch);
		Press_key();
		lan = 1.0;
	}

	if (dflag == 0)
	{
		for (j = 0; j < 7; j++)
		{
			for (;;)
			{
				fff = 0;
				temp = getch();
				for (n = 0; n < 12; n++)
					if (temp == k[n])
					{
						fff = 1;
						break;
					}

				if (fff == 1) break;
			}

			if (temp == 13) break;
			strlen[0] = temp;
			outtext(strlen);
			ch[j] = strlen[0];
		}

		if (temp == 13) ch[j] = '\0';
		ch[7] = '\0';
		lan = atof(ch);
	}

	restore_s(120, 130);
	return lan;
}
