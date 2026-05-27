/**************************************************************************
 * circle.c                                                               *
 * written by David Brackeen                                              *
 * http://www.brackeen.com/home/vga/                                      *
 *                                                                        *
 * This is a 16-bit program.                                              *
 * Tab stops are set to 2.                                                *
 * Remember to compile in the LARGE memory model!                         *
 * To compile in Borland C: bcc -ml circle.c                              *
 *                                                                        *
 * This program will only work on DOS- or Windows-based systems with a    *
 * VGA, SuperVGA or compatible video adapter.                             *
 *                                                                        *
 * Please feel free to copy this source code.                             *
 *                                                                        *
 * DESCRIPTION: This program demostrates drawing how much faster it is to *
 * draw circles using tables rather than math functions.                  *
 **************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <dos.h>
#include <math.h>

#define VIDEO_INT           0x10      /* the BIOS video interrupt. */
#define SET_MODE            0x00      /* BIOS func to set the video mode. */
#define VGA_256_COLOR_MODE  0x13      /* use to set 256-color mode. */
#define TEXT_MODE           0x03      /* use to set 80x25 text mode. */

#define SCREEN_WIDTH        320       /* width in pixels of mode 0x13 */
#define SCREEN_HEIGHT       200       /* height in pixels of mode 0x13 */
#define NUM_COLORS          256       /* number of colors in mode 0x13 */

typedef unsigned char  byte;
typedef unsigned short word;
typedef long           fixed16_16;

fixed16_16 SIN_ACOS[1024];
byte *VGA=(byte *)0xA0000000L;        /* this points to video memory. */
word *my_clock=(word *)0x0000046C;    /* this points to the 18.2hz system
                                         clock. */

/**************************************************************************
 *  set_mode                                                              *
 *     Sets the video mode.                                               *
 **************************************************************************/

void set_mode(byte mode)
{
  union REGS regs;

  regs.h.ah = SET_MODE;
  regs.h.al = mode;
  int86(VIDEO_INT, &regs, &regs);
}

/**************************************************************************
 *  circle_slow                                                           *
 *    Draws a circle by using floating point numbers and math fuctions.   *
 **************************************************************************/

void circle_slow(int x,int y, int radius, byte color)
{
  float n=0,invradius=1/(float)radius;
  int dx=0,dy=radius-1;
  word dxoffset,dyoffset,offset=(y<<8)+(y<<6)+x;

  while (dx<=dy)
  {
    dxoffset = (dx<<8) + (dx<<6);
    dyoffset = (dy<<8) + (dy<<6);
    VGA[offset+dy-dxoffset] = color;  /* octant 0 */
    VGA[offset+dx-dyoffset] = color;  /* octant 1 */
    VGA[offset-dx-dyoffset] = color;  /* octant 2 */
    VGA[offset-dy-dxoffset] = color;  /* octant 3 */
    VGA[offset-dy+dxoffset] = color;  /* octant 4 */
    VGA[offset-dx+dyoffset] = color;  /* octant 5 */
    VGA[offset+dx+dyoffset] = color;  /* octant 6 */
    VGA[offset+dy+dxoffset] = color;  /* octant 7 */
    dx++;
    n+=invradius;
    dy=radius * sin(acos(n));
  }
}

/**************************************************************************
 *  circle_fast                                                           *
 *    Draws a circle by using fixed point numbers and a trigonometry      *
 *    table.                                                              *
 **************************************************************************/

void circle_fast(int x,int y, int radius, byte color)
{
  fixed16_16 n=0,invradius=(1/(float)radius)*0x10000L;
  int dx=0,dy=radius-1;
  word dxoffset,dyoffset,offset = (y<<8)+(y<<6)+x;

  while (dx<=dy)
  {
    dxoffset = (dx<<8) + (dx<<6);
    dyoffset = (dy<<8) + (dy<<6);
    VGA[offset+dy-dxoffset] = color;  /* octant 0 */
    VGA[offset+dx-dyoffset] = color;  /* octant 1 */
    VGA[offset-dx-dyoffset] = color;  /* octant 2 */
    VGA[offset-dy-dxoffset] = color;  /* octant 3 */
    VGA[offset-dy+dxoffset] = color;  /* octant 4 */
    VGA[offset-dx+dyoffset] = color;  /* octant 5 */
    VGA[offset+dx+dyoffset] = color;  /* octant 6 */
    VGA[offset+dy+dxoffset] = color;  /* octant 7 */
    dx++;
    n+=invradius;
    dy = (int)((radius * SIN_ACOS[(int)(n>>6)]) >> 16);
  }
}

/**************************************************************************
 *  circle_fill                                                           *
 *    Draws and fills a circle.                                           *
 **************************************************************************/

void circle_fill(int x,int y, int radius, byte color)
{
  fixed16_16 n=0,invradius=(1/(float)radius)*0x10000L;
  int dx=0,dy=radius-1,i;
  word dxoffset,dyoffset,offset = (y<<8)+(y<<6)+x;

  while (dx<=dy)
  {
    dxoffset = (dx<<8) + (dx<<6);
    dyoffset = (dy<<8) + (dy<<6);
    for(i=dy;i>=dx;i--,dyoffset-=SCREEN_WIDTH)
    {
      VGA[offset+i -dxoffset] = color;  /* octant 0 */
      VGA[offset+dx-dyoffset] = color;  /* octant 1 */
      VGA[offset-dx-dyoffset] = color;  /* octant 2 */
      VGA[offset-i -dxoffset] = color;  /* octant 3 */
      VGA[offset-i +dxoffset] = color;  /* octant 4 */
      VGA[offset-dx+dyoffset] = color;  /* octant 5 */
      VGA[offset+dx+dyoffset] = color;  /* octant 6 */
      VGA[offset+i +dxoffset] = color;  /* octant 7 */
    }
    dx++;
    n+=invradius;
    dy = (int)((radius * SIN_ACOS[(int)(n>>6)]) >> 16);
  }
}

/**************************************************************************
 *  Main                                                                  *
 *    Draws 5000 circles                                                  *
 **************************************************************************/

void main()
{
  int x,y,radius,color;
  float t1,t2;
  word i,start;

  for(i=0;i<1024;i++)                 /* create the sin(arccos(x)) table. */
  {
    SIN_ACOS[i]=sin(acos((float)i/1024))*0x10000L;
  }

  srand(*my_clock);                   /* seed the number generator. */
  set_mode(VGA_256_COLOR_MODE);       /* set the video mode. */

  start=*my_clock;                    /* record the starting time. */
  for(i=0;i<5000;i++)                 /* randomly draw 5000 circles. */
  {
    radius=rand()%90+1;
    x=rand()%(SCREEN_WIDTH-radius*2)+radius;
    y=rand()%(SCREEN_HEIGHT-radius*2)+radius;
    color=rand()%NUM_COLORS;
    circle_slow(x,y,radius,color);
  }

  t1=(*my_clock-start)/18.2;          /* calculate how long it took. */

  set_mode(VGA_256_COLOR_MODE);       /* set the video mode again in order
                                         to clear the screen. */

  start=*my_clock;                    /* record the starting time. */
  for(i=0;i<5000;i++)                 /* randomly draw 5000 circles. */
  {
    radius=rand()%90+1;
    x=rand()%(SCREEN_WIDTH-radius*2)+radius;
    y=rand()%(SCREEN_HEIGHT-radius*2)+radius;
    color=rand()%NUM_COLORS;
    circle_fast(x,y,radius,color);
  }

  t2=(*my_clock-start)/18.2;          /* calculate how long it took. */

  set_mode(VGA_256_COLOR_MODE);       /* set the video mode again in order
                                         to clear the screen. */

  for(i=0;i<1000;i++)                 /* draw 1000 filled circles. */
  {
    radius=rand()%90+1;
    x=rand()%(SCREEN_WIDTH-radius*2)+radius;
    y=rand()%(SCREEN_HEIGHT-radius*2)+radius;
    color=rand()%NUM_COLORS;
    circle_fill(x,y,radius,color);
  }
  set_mode(TEXT_MODE);                /* set the video mode back to
                                         text mode. */

  /* output the results... */
  printf("Slow circle drawing took %f seconds.\n",t1);
  printf("Fast circle drawing took %f seconds.\n",t2);
  if (t2 != 0) printf("Fast circle drawing was %f times faster.\n",t1/t2);

  return;
}
