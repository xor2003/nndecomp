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
extern struct str
{
	float r, x, z0;
	int xo, yo;
}

impedance[6];
//extern struct str impedance[6];
float rpp, xp, z0p, dlp, lanp, pass_flag = 0;
extern void *ptr;
//extern unsigned size;

void store_s(int x1, int y1, int x2, int y2);
void restore_s(int x, int y);
void Press_key(void);
void smit_chart(void);
void Two_stuble(int dflag);
void Three_stuble(int dflag);
//float landa(int dflag);
/**************************/
void Two_stuble(int dflag)
{
	char ch[10], strlen[2];
	int px = 0, py = 0, temp, i, j, n1, fff = 0, k[15];
	float gl, bl, r = 0, x = 0, dl = 0, rp[30], a, b, c, fi, n, gamax,
		gamar, b1, b2, lt1, lt2, gamar2, gamax2, tetap2;
	float teta, /*tetap,*/ gamarp, gamaxp, x0, y0, xconst, /*lan,*/ gamar1, gamax1;
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
	strlen[1] = '\0';
	setcolor(GREEN);
	circle((int)(320 + 210 / 2), 240, (int)(210 / 2));
	if (pass_flag == 0)
	{
		px = impedance[4].xo;
		py = impedance[4].yo;
		r = impedance[4].r;
		x = impedance[4].x;
	}

	if (pass_flag == 1)
	{
		r = rpp;
		x = xp;
		x0 = (x *x + r *r - 1) / (x *x + (1 + r) *(1 + r));
		y0 = 2 *x / (x *x + (1 + r) *(1 + r));
		px = 320 + (int)(210 *x0);
		py = 240 - (int)(210 *y0);
		/* dl=dlp; */
	}

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
	outtextxy(55, 420, (char *) "Gl=");
	outtextxy(100, 420, (char *) ch);
	gcvt(bl, 3, ch);
	outtextxy(55, 440, (char *) "Bl=");
	outtextxy(100, 440, (char *) ch);
	Press_key();
	restore_s(20, 400);
	if (pass_flag == 0)
	{
		/*  lanp=landa(0);  */
		store_s(120, 130, 460, 160);
		setfillstyle(SOLID_FILL, BLUE);
		setcolor(WHITE);
		rectangle(120, 130, 460, 160);
		bar(121, 131, 459, 159);
		outtextxy(130, 145, (char *) "ENTER DISTANC TWO STUBS : Ld(lambda)=");
		moveto(420, 145);
		if (dflag == 1)
		{
			gcvt(.125, 3, ch);
			outtext(ch);
			dl = .125;
			Press_key();
		}

		if (dflag == 0)
		{
			for (j = 0; j < 7; j++)
			{
				for (;;)
				{
					fff = 0;
					temp = getch();
					for (n1 = 0; n1 < 12; n1++)
						if (temp == k[n1])
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
			dl = atof(ch);
		}

		restore_s(120, 130);
	}

	// dl = dl;
	if (gl > 1 / (sin(2 *PI *dl) *sin(2 *PI *dl)))
	{
		setfillstyle(SOLID_FILL, BLUE);
		setcolor(WHITE);
		rectangle(120, 130, 460, 160);
		bar(121, 131, 459, 159);
		outtextxy(150, 145, (char *) "ERROR USE THREE STUB");
		getch();
		smit_chart();
		return;
	}

	setcolor(GREEN);
	circle(320 + (int)(210 *.5* cos(4 *PI *dl)), 240 - (int)(210 *.5* sin(4 *PI *dl)), (int)(.5 *210));
	Press_key();
	rp[0] = .1;
	rp[1] = .3;
	rp[2] = .5;
	rp[3] = .7;
	rp[4] = 1;
	rp[5] = 1.2;
	rp[6] = 1.6;
	rp[7] = 2;
	rp[8] = 2.4;
	rp[9] = 2.8;
	rp[10] = 3.2;
	rp[11] = 3.6;
	rp[12] = 3.8;
	rp[13] = 5;
	rp[14] = 7;
	rp[15] = 9;
	rp[16] = 12;
	rp[17] = 16;
	rp[18] = 20;
	rp[19] = 30;
	rp[20] = 1000;
	rp[21] = 0;
	setlinestyle(SOLID_LINE, 1, 1);
	setcolor(WHITE);
	for (i = 0; rp[i] != 0; i++)
		if (rp[i] >= 1 / (sin(2 *PI *dl) *sin(2 *PI *dl)))
			circle((int)(320 + 210 *rp[i] / (1 + rp[i])), 240, (int)(210 / (1 + rp[i])));
	rp[22] = 1 / (sin(2 *PI *dl) *sin(2 *PI *dl));
	circle((int)(320 + 210 *rp[22] / (1 + rp[22])), 240, (int)(210 / (1 + rp[22])));
	store_s(450, 220, 620, 260);
	setfillstyle(SOLID_FILL, BLUE);
	rectangle(450, 220, 620, 260);
	bar(451, 221, 619, 259);
	outtextxy(465, 240, (char *) "FORBIDDEN REGION");
	Press_key();
	restore_s(450, 220);
	setcolor(BLUE);
	for (i = 0; rp[i] != 0; i++)
		if (rp[i] >= 1 / (sin(2 *PI *dl) *sin(2 *PI *dl)))
			circle((int)(320 + 210 *rp[i] / (1 + rp[i])), 240, (int)(210 / (1 + rp[i])));
	rp[22] = 1 / (sin(2 *PI *dl) *sin(2 *PI *dl));
	circle((int)(320 + 210 *rp[22] / (1 + rp[22])), 240, (int)(210 / (1 + rp[22])));
	rp[23] = r / (r *r + r + x *x);
	rp[24] = 1 - rp[23];
	setcolor(WHITE);
	circle(320 + (int)(210 *rp[23]), 240, (int)(210 *rp[24]));
	Press_key();
	fi = 4 *PI * dl;
	n = rp[23];
	a = 1 + ((cos(fi) - 2 *n) *(cos(fi) - 2 *n)) / (sin(fi) *sin(fi));
	b = n - (-cos(fi) + 2 *n) *(1 - 2 *n) / (sin(fi) *sin(fi));
	c = (1 - 2 *n) *(1 - 2 *n) / (sin(fi) *sin(fi)) - (1 - 2 *n);
	gamar = (b + sqrt(b *b - a *c)) / a;
	gamax = (gamar *(-cos(fi) + 2 *n) + 1 - 2 *n) / sin(fi);
	gamarp = gamar;
	gamaxp = gamax;
	setfillstyle(SOLID_FILL, LIGHTRED);
	setcolor(LIGHTRED);
	circle(320 + (int)(210 *gamar), 240 - (int)(210 *gamax), 4);
	floodfill(320 + (int)(210 *gamar), 240 - (int)(210 *gamax), LIGHTRED);
	gamar = (b - sqrt(b *b - a *c)) / a;
	gamax = (gamar *(-cos(fi) + 2 *n) + 1 - 2 *n) / sin(fi);
	circle(320 + (int)(210 *gamar), 240 - (int)(210 *gamax), 4);
	floodfill(320 + (int)(210 *gamar), 240 - (int)(210 *gamax), LIGHTRED);
	Press_key();
	store_s(20, 220, 320, 340);
	setfillstyle(SOLID_FILL, BLUE);
	rectangle(20, 220, 320, 340);
	setcolor(WHITE);
	bar(21, 221, 319, 339);
	gcvt(gamar, 3, ch);
	outtextxy(45, 240, (char *) "gamar1=");
	outtextxy(125, 240, (char *) ch);
	gcvt(gamax, 3, ch);
	outtextxy(45, 260, (char *) "gamax1=");
	outtextxy(125, 260, (char *) ch);
	gcvt(gamarp, 3, ch);
	outtextxy(45, 280, (char *) "gamar2=");
	outtextxy(125, 280, (char *) ch);
	gcvt(gamaxp, 3, ch);
	outtextxy(45, 300, (char *) "gamax2=");
	outtextxy(125, 300, ch);
	outtextxy(45, 320, (char *) " point gamar1 &gamax1 is select");
	Press_key();
	restore_s(20, 220);
	/* b1=1+sqrt((1+tan(2*PI*dl)*tan(2*PI*dl))*gl-gl*gl*tan(2*PI*dl)*tan(2*PI*dl));
	  b1=-bl-b1/tan(2*PI*dl); */
	b1 = 2 *gamax / ((1 - gamar) *(1 - gamar) + gamax *gamax);
	xconst = -bl + b1;
	if (xconst > 0) arc(320 + 210, (int)(240 - 210 / xconst), 180 - (int)((180 / PI) *atan((xconst *xconst - 1) / (2 *xconst))), 270, (int)(210 / xconst));
	if (xconst < 0) arc(320 + 210, (int)(240 - 210 / xconst), 90, 180 - (int)((180 / PI) *atan((xconst *xconst - 1) / (2 *xconst))), (int)(210 / xconst));
	store_s(20, 400, 300, 440);
	setfillstyle(SOLID_FILL, BLUE);
	rectangle(20, 400, 300, 440);
	bar(21, 401, 299, 439);
	gcvt(xconst, 3, ch);
	outtextxy(35, 420, (char *) "   SUSEBTANCE FIRST STUB =");
	outtextxy(240, 420, (char *) ch);
	Press_key();
	restore_s(20, 400);
	gamax2 = -2 *xconst / (1 + xconst *xconst);
	gamar2 = (-1 + xconst *xconst) / (1 + xconst *xconst);
	tetap2 = atan(gamax2 / gamar2);
	if (gamar2 < 0)
		tetap2 = tetap2 + PI;
	arc(320, 240, -(int)((180 / PI) *tetap2), 0, 210);
	Press_key();
	bar(21, 401, 299, 439);
	lt1 = (+tetap2) / (4 *PI);
	if (lt1 < 0)
		lt1 = lt1 + .5;

	setfillstyle(SOLID_FILL, BLUE);
	rectangle(20, 400, 330, 460);
	bar(21, 401, 329, 459);
	gcvt(lt1, 3, ch);
	outtextxy(40, 420, (char *) "LINE FIRST STUB(lambda)=");
	outtextxy(250, 420, (char *) ch);
	Press_key();
	teta = atan(gamax / gamar);
	if (gamar < 0) teta = teta + PI;
	setcolor(LIGHTRED);
	arc(320, 240, (int)((180 / PI) *(teta - 4 *PI *dl)), (int)((180 / PI) *teta), (int)(210* sqrt(gamax *gamax + gamar *gamar)));
	/* b2=-sqrt(gl*(1+tan(2*PI*dl)*tan(2*PI*dl))-gl*gl*tan(2*PI*dl)*tan(2*PI*dl));
	  b2=(b2-gl)/(gl*tan(2*PI*dl)); */
	gamar1 = gamar* cos(4 *PI *dl) + gamax* sin(4 *PI *dl);
	gamax1 = gamax* cos(4 *PI *dl) - gamar* sin(4 *PI *dl);

	b2 = 2 *gamax1 / ((1 - gamar1) *(1 - gamar1) + gamax1 *gamax1);
	xconst = b2;
	setcolor(WHITE);
	if (xconst > 0) arc(320 + 210, (int)(240 - 210 / xconst), 180 - (int)((180 / PI) *atan((xconst *xconst - 1) / (2 *xconst))), 270, (int)(210 / xconst));
	if (xconst < 0) arc(320 + 210, (int)(240 - 210 / xconst), 90, 180 - (int)((180 / PI) *atan((xconst *xconst - 1) / (2 *xconst))), (int)(210 / xconst));
	store_s(20, 400, 300, 440);
	setfillstyle(SOLID_FILL, BLUE);
	rectangle(20, 400, 300, 440);
	bar(21, 401, 299, 439);
	gcvt(-xconst, 3, ch);
	outtextxy(35, 420, (char *) "SUSEBTANCE SECOND STUB =");
	outtextxy(240, 420, (char *) ch);
	Press_key();
	restore_s(20, 400);
	setcolor(WHITE);
	gamax2 = 2 *xconst / (1 + xconst *xconst);
	gamar2 = (-1 + xconst *xconst) / (1 + xconst *xconst);
	tetap2 = atan(gamax2 / gamar2);
	if (gamar2 < 0) tetap2 = tetap2 + PI;
	setcolor(LIGHTRED);
	arc(320, 240, -(int)((180 / PI) *tetap2), 0, 210);
	Press_key();
	bar(21, 401, 299, 439);
	lt2 = (+tetap2) / (4 *PI);
	if (lt2 < 0) lt2 = lt2 + .5;
	gcvt(lt2, 3, ch);
	outtextxy(45, 420, (char *) "LINE SECOND STUB(lambda) =");
	outtextxy(250, 420, (char *) ch);
	Press_key();
	setfillstyle(SOLID_FILL, DARKGRAY);
	bar(1, 25, getmaxx() - 1, getmaxy() - 1);
	pass_flag = 0;
}

/*******************************************/
void Three_stuble(int dflag)
{
	int px, py, j, temp, i, u, v, n1, fff, k[15];
	float tt, r, x, bl, gl, dl, rp[30], a, b, c, n, fi, z, gamar1,
		gamax1, gamar2, gamax2, rr;
	float b1, b2, b3, r1, /*r2,*/ x1, x2, bs1, teta, /*t,*/ z0, /*tetap,*/ xconst,
		lt1, lan = 0, tetap3, gamar3, gamax3;
	float /*gamar4, gamax4,*/ gl4, bl4;
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
	k[12] = '-';
	strlen[1] = '\0';
	px = impedance[5].xo;
	py = impedance[5].yo;
	r = impedance[5].r;
	x = impedance[5].x;
	z0 = impedance[5].z0;
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
	outtextxy(55, 420, (char *) "Gl=");
	outtextxy(100, 420, (char *) ch);
	gcvt(bl, 3, ch);
	outtextxy(55, 440, (char *) "Bl=");
	outtextxy(100, 440, (char *) ch);
	Press_key();
	restore_s(20, 400);
	setcolor(GREEN);
	circle(320 + 105, 240, 105);
	/* lan=landa(0); */
	store_s(120, 130, 480, 160);
	setfillstyle(SOLID_FILL, BLUE);
	setcolor(WHITE);
	rectangle(120, 130, 480, 160);
	bar(121, 131, 479, 159);
	outtextxy(130, 145, (char *) "ENTER DISTANC THREE STUBS : Ld(lambda)=");
	moveto(430, 145);
	if (dflag == 1)
	{
		gcvt(.125, 3, ch);
		outtext(ch);
		dl = .125;
		Press_key();
	}

	if (dflag == 0)
	{
		for (j = 0; j < 7; j++)
		{
			for (;;)
			{
				fff = 0;
				temp = getch();
				for (n1 = 0; n1 < 12; n1++)
					if (temp == k[n1])
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
		dl = atof(ch);
	}

	restore_s(120, 130);
	Press_key();
	rp[0] = .1;
	rp[1] = .3;
	rp[2] = .5;
	rp[3] = .7;
	rp[4] = 1;
	rp[5] = 1.2;
	rp[6] = 1.6;
	rp[7] = 2;
	rp[8] = 2.4;
	rp[9] = 2.8;
	rp[10] = 3.2;
	rp[11] = 3.6;
	rp[12] = 3.8;
	rp[13] = 5;
	rp[14] = 7;
	rp[15] = 9;
	rp[16] = 12;
	rp[17] = 16;
	rp[18] = 20;
	rp[19] = 30;
	rp[20] = 1000;
	rp[21] = 0;
	setlinestyle(SOLID_LINE, 1, 1);
	setcolor(WHITE);
	for (i = 0; rp[i] != 0; i++)
		if (rp[i] >= 1 / (sin(2 *PI *dl) *sin(2 *PI *dl)))
			circle((int)(320 + 210 *rp[i] / (1 + rp[i])), 240, (int)(210 / (1 + rp[i])));
	rp[22] = 1 / (sin(2 *PI *dl) *sin(2 *PI *dl));
	circle((int)(320 + 210 *rp[22] / (1 + rp[22])), 240, (int)(210 / (1 + rp[22])));
	Press_key();
	store_s(450, 220, 620, 260);
	setfillstyle(SOLID_FILL, BLUE);

	rectangle(450, 220, 620, 260);
	bar(451, 221, 619, 259);
	outtextxy(465, 240, (char *) "FOR BIDDEN REGION");
	Press_key();
	restore_s(450, 220);
	setcolor(BLUE);
	for (i = 0; rp[i] != 0; i++)

		if (rp[i] >= 1 / (sin(2 *PI *dl) *sin(2 *PI *dl)))
			circle((int)(320 + 210 *rp[i] / (1 + rp[i])), 240, (int)(210 / (1 + rp[i])));
	rp[22] = 1 / (sin(2 *PI *dl) *sin(2 *PI *dl));
	circle((int)(320 + 210 *rp[22] / (1 + rp[22])), 240, (int)(210 / (1 + rp[22])));
	Press_key();
	setcolor(WHITE);
	for (i = 0; rp[i] != 0; i++)
		if (rp[i] >= 1 / (sin(2 *PI *dl) *sin(2 *PI *dl)))
		{
			u = 320 + (int)(210 *(rp[i] / (1 + rp[i])) *cos(4 *PI *dl));
			v = 240 - (int)(210 *(rp[i] / (1 + rp[i])) *sin(4 *PI *dl));
			circle(u, v, (int)(210 / (rp[i] + 1)));
		}

	rp[22] = 1 / (sin(2 *PI *dl) *sin(2 *PI *dl));
	u = 320 + (int)(210 *(rp[22] / (1 + rp[22])) *cos(4 *PI *dl));
	v = 240 - (int)(210 *(rp[22] / (1 + rp[22])) *sin(4 *PI *dl));
	circle(u, v, (int)(210 / (rp[22] + 1)));
	Press_key();
	if (r >= 1 / (sin(2 *PI *dl) *sin(2 *PI *dl)))
	{
		setfillstyle(SOLID_FILL, BLUE);
		setcolor(WHITE);
		rectangle(120, 130, 460, 160);
		bar(121, 131, 459, 159);
		outtextxy(150, 145, (char *) "  USE TWO STUB");
		Press_key();
		smit_chart();
		return;
	}

	setcolor(YELLOW);
	u = 320 + (int)(210 *(r / (r *r + x *x + r)));
	circle(u, 240, (int)(210 *(1 - r / (r *r + x *x + r))));
	Press_key();
	rr = 1 / (sin(2 *PI *dl) *sin(2 *PI *dl));
	fi = 4 *PI * dl;
	n = r / (r *r + r + x *x);
	z = rr / (rr + 1);
	a = (2 *z* cos(fi) - 2 *n) *(2 *z* cos(fi) - 2 *n);
	a = a / (4 *z *z* sin(fi) *sin(fi));
	a = a + 1;
	b = (2 *n - 2 *z* cos(fi)) *(z *z *(1 / (rr *rr) - 1) - 1 + 2 *n);
	b = b / (4 *z *z* sin(fi) *sin(fi));
	b = b + n;
	c = z *z *(1 / (rr *rr) - 1) - 1 + 2 * n;
	c = c *c / (4 *z *z* sin(fi) *sin(fi));
	c = c - 1 + 2 * n;
	if ((b *b - a *c) > 0)
	{
		gamar1 = (b + sqrt(b *b - a *c)) / a;
		gamax1 = gamar1 *(2 *z* cos(fi) - 2 *n) + z *z *(1 / (rr *rr) - 1) - 1 + 2 * n;
		gamax1 = gamax1 / (-2 *z* sin(fi));
		gamar2 = (b - sqrt(b *b - a *c)) / a;
		gamax2 = gamar2 *(2 *z* cos(fi) - 2 *n) + z *z *(1 / (rr *rr) - 1) - 1 + 2 * n;
		gamax2 = gamax2 / (-2 *z* sin(fi));
		setfillstyle(SOLID_FILL, LIGHTRED);
		setcolor(LIGHTRED);
		circle(320 + (int)(210 *gamar1), 240 - (int)(210 *gamax1), 3);
		floodfill(320 + (int)(210 *gamar1), 240 - (int)(210 *gamax1), LIGHTRED);
		circle(320 + (int)(210 *gamar2), 240 - (int)(210 *gamax2), 3);
		floodfill(320 + (int)(210 *gamar2), 240 - (int)(210 *gamax2), LIGHTRED);
		x1 = 2 *gamax1 / ((1 - gamar1) *(1 - gamar1) + gamax1 *gamax1);
		b1 = x1;
		x2 = 2 *gamax2 / ((1 - gamar2) *(1 - gamar2) + gamax2 *gamax2);
		b2 = x2;
		if (b1 < b2)
		{
			b3 = b2;
			b2 = b1;
			b1 = b3;
		}

		store_s(120, 130, 480, 190);
		setfillstyle(SOLID_FILL, BLUE);
		setcolor(WHITE);
		rectangle(120, 130, 480, 190);
		bar(121, 131, 479, 189);
		outtextxy(130, 145, (char *) "SUSCEBTANCE FIRST STUB >       or<");
		gcvt(b1 - bl, 3, ch);
		outtextxy(330, 145, (char *) ch);
		gcvt(b2 - bl, 3, ch);
		outtextxy(410, 145, (char *) ch);
		Press_key();
		outtextxy(150, 175, (char *) "ENTER BS1 INSID AREA UP");
	}
	else
	{
		store_s(120, 130, 480, 190);
		setfillstyle(SOLID_FILL, BLUE);
		setcolor(WHITE);
		rectangle(120, 130, 480, 190);
		bar(121, 131, 479, 189);
		outtextxy(130, 155, (char *) "ENTER BS1 ANY NUMBER");
		outtextxy(150, 175, (char *) "  OR USE TWO STUB");
	}

	moveto(370, 175);
	if (dflag == 1)
	{
		gcvt(1.0, 3, ch);
		outtext(ch);
		bs1 = 1.0;
		Press_key();
	}

	if (dflag == 0)
	{
		for (j = 0; j < 7; j++)
		{
			for (;;)
			{
				fff = 0;
				temp = getch();
				for (n1 = 0; n1 < 13; n1++)
					if (temp == k[n1])
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
		bs1 = atof(ch);
	}

	restore_s(120, 130);
	bl = bl + bs1;
	gamar1 = (gl *gl + bl *bl - 1) / ((gl + 1) *(gl + 1) + bl *bl);
	gamax1 = 2 *bl / ((gl + 1) *(gl + 1) + bl *bl);
	setcolor(LIGHTRED);
	setfillstyle(SOLID_FILL, LIGHTRED);
	circle(320 + (int)(210 *gamar1), 240 - (int)(210 *gamax1), 3);
	floodfill(320 + (int)(210 *gamar1), 240 - (int)(210 *gamax1), LIGHTRED);
	store_s(120, 130, 480, 160);
	xconst = bs1;
	if (xconst > 0) arc(320 + 210, (int)(240 - 210 / xconst), 180 - (int)((180 / PI) *atan((xconst *xconst - 1) / (2 *xconst))), 270, (int)(210 / xconst));
	if (xconst < 0) arc(320 + 210, (int)(240 - 210 / xconst), 90, 180 - (int)((180 / PI) *atan((xconst *xconst - 1) / (2 *xconst))), (int)(210 / xconst));
	store_s(20, 400, 300, 440);
	setfillstyle(SOLID_FILL, BLUE);
	rectangle(20, 400, 300, 440);
	bar(21, 401, 299, 439);
	gcvt(xconst, 3, ch);
	outtextxy(45, 420, (char *) "SUSEBTANCE FIRST STUB =");
	outtextxy(240, 420, (char *) ch);
	Press_key();
	restore_s(20, 400);

	gamax3 = -2 *xconst / (1 + xconst *xconst);
	gamar3 = (-1 + xconst *xconst) / (1 + xconst *xconst);
	tetap3 = atan(gamax3 / gamar3);
	if (gamar3 < 0) tetap3 = tetap3 + PI;
	arc(320, 240, -(int)((180 / PI) *tetap3), 0, 210);
	Press_key();
	bar(21, 401, 299, 439);
	lt1 = (+tetap3) / (4 *PI);
	if (lt1 < 0) lt1 = .5 + lt1;
	setcolor(WHITE);
	setfillstyle(SOLID_FILL, BLUE);
	rectangle(20, 400, 330, 460);
	bar(21, 401, 329, 459);
	gcvt(lt1, 3, ch);
	outtextxy(40, 420, (char *) "LINE FIRST STUB(lambda)=");
	outtextxy(250, 420, (char *) ch);
	Press_key();
	/*  restore_s(120,130); */
	teta = atan(gamax1 / gamar1);
	if (gamar1 < 0) teta = teta + PI;
	setcolor(LIGHTRED);
	arc(320, 240, (int)((teta - 4 *PI *dl) *180 / PI), (int)(teta *180 / PI), (int)(210 *(sqrt(gamax1 *gamax1 + gamar1 *gamar1))));
	Press_key();
	tt = tan(2 *PI *dl);
	gl4 = gl *(1 - bl *tt) + (bl + tt) *gl * tt;
	gl4 = gl4 / ((1 - bl *tt) *(1 - bl *tt) + (gl *tt *gl *tt));
	bl4 = (bl + tt) *(1 - bl *tt) - gl *gl * tt;
	bl4 = bl4 / ((1 - bl *tt) *(1 - bl *tt) + (gl *tt *gl *tt));

	/* gamar4=gamar1*cos(4*PI*dl)+gamax1*sin(4*PI*dl);
	  gamax4=gamax1*cos(4*PI*dl)-gamar1*sin(4*PI*dl);
	  gl4=(1-gamar4*gamar4-gamax4*gamax4)/((1-gamar4)*(1-gamar4)+gamax4*gamax4);
	  bl4=2*gamax4/((1-gamar4)*(1-gamar4)+gamax4*gamax4); */

	r1 = gl4 / (gl4 *gl4 + bl4 *bl4);
	x1 = -bl4 / (gl4 *gl4 + bl4 *bl4);
	setfillstyle(SOLID_FILL, BLUE);
	setcolor(WHITE);
	rectangle(120, 130, 480, 190);
	bar(121, 131, 479, 189);
	outtextxy(160, 145, (char *) "CONTINUE AS TWO STUB TUNER ");
	outtextxy(160, 175, (char *) " r=       x=        z0=");
	gcvt(r1 *z0, 3, ch);
	outtextxy(185, 175, (char *) ch);
	gcvt(x1 *z0, 3, ch);
	outtextxy(260, 175, (char *) ch);
	gcvt(z0, 3, ch);
	outtextxy(345, 175, (char *) ch);
	Press_key();
	dlp = dl;
	rpp = r1;
	lanp = lan;
	xp = x1;
	z0p = z0;
	pass_flag = 1;
	setfillstyle(SOLID_FILL, DARKGRAY);
	bar(1, 25, getmaxx() - 1, getmaxy() - 1);
	smit_chart();
	Two_stuble(0);
}

/***************************************/
