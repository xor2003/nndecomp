/**************************************************************************
 * lines.c                                                                *
 * written by David Brackeen                                              *
 * http://www.brackeen.com/home/vga/                                      *
 *                                                                        *
 * This is a 16-bit program.                                              *
 * Tab stops are set to 2.                                                *
 * Remember to compile in the LARGE memory model!                         *
 * To compile in Borland C: bcc -ml lines.c                               *
 *                                                                        *
 * This program will only work on DOS- or Windows-based systems with a    *
 * VGA, SuperVGA or compatible video adapter.                             *
 *                                                                        *
 * Please feel free to copy this source code.                             *
 *                                                                        *
 * DESCRIPTION: This program demostrates drawing how much faster it is to *
 * draw lines without using multiplication or division.                   *
 **************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <dos.h>

#define VIDEO_INT           0x10      /* the BIOS video interrupt. */
#define SET_MODE            0x00      /* BIOS func to set the video mode. */
#define VGA_256_COLOR_MODE  0x13      /* use to set 256-color mode. */
#define TEXT_MODE           0x03      /* use to set 80x25 text mode. */

#define SCREEN_WIDTH        320       /* width in pixels of mode 0x13 */
#define SCREEN_HEIGHT       200       /* height in pixels of mode 0x13 */
#define NUM_COLORS          256       /* number of colors in mode 0x13 */

#define sgn(x) ((x<0)?-1:((x>0)?1:0)) /* macro to return the sign of a
                                         number */
typedef unsigned char  byte;
typedef unsigned short word;

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
 *  plot_pixel                                                            *
 *    Plot a pixel by directly writing to video memory, with no           *
 *    multiplication.                                                     *
 **************************************************************************/

void plot_pixel(int x,int y,byte color)
{
  /*  y*320 = y*256 + y*64 = y*2^8 + y*2^6   */
  VGA[(y<<8)+(y<<6)+x]=color;
}

/**************************************************************************
 *  line_slow                                                             *
 *    draws a line using multiplication and division.                     *
 **************************************************************************/

void line_slow(int x1, int y1, int x2, int y2, byte color)
{
  int dx,dy,sdx,sdy,px,py,dxabs,dyabs,i;
  float slope;

  dx=x2-x1;      /* the horizontal distance of the line */
  dy=y2-y1;      /* the vertical distance of the line */
  dxabs=abs(dx);
  dyabs=abs(dy);
  sdx=sgn(dx);
  sdy=sgn(dy);
  if (dxabs>=dyabs) /* the line is more horizontal than vertical */
  {
    slope=(float)dy / (float)dx;
    for(i=0;i!=dx;i+=sdx)
    {
      px=i+x1;
      py=slope*i+y1;
      plot_pixel(px,py,color);
    }
  }
  else /* the line is more vertical than horizontal */
  {
    slope=(float)dx / (float)dy;
    for(i=0;i!=dy;i+=sdy)
    {
      px=slope*i+x1;
      py=i+y1;
      plot_pixel(px,py,color);
    }
  }
}

/**************************************************************************
 *  line_fast                                                             *
 *    draws a line using Bresenham's line-drawing algorithm, which uses   *
 *    no multiplication or division.                                      *
 **************************************************************************/

void line_fast(int x1, int y1, int x2, int y2, byte color)
{
  int i,dx,dy,sdx,sdy,dxabs,dyabs,x,y,px,py;

  dx=x2-x1;      /* the horizontal distance of the line */
  dy=y2-y1;      /* the vertical distance of the line */
  dxabs=abs(dx);
  dyabs=abs(dy);
  sdx=sgn(dx);
  sdy=sgn(dy);
  x=dyabs>>1;
  y=dxabs>>1;
  px=x1;
  py=y1;

  VGA[(py<<8)+(py<<6)+px]=color;

  if (dxabs>=dyabs) /* the line is more horizontal than vertical */
  {
    for(i=0;i<dxabs;i++)
    {
      y+=dyabs;
      if (y>=dxabs)
      {
        y-=dxabs;
        py+=sdy;
      }
      px+=sdx;
      plot_pixel(px,py,color);
    }
  }
  else /* the line is more vertical than horizontal */
  {
    for(i=0;i<dyabs;i++)
    {
      x+=dxabs;
      if (x>=dyabs)
      {
        x-=dyabs;
        px+=sdx;
      }
      py+=sdy;
      plot_pixel(px,py,color);
    }
  }
}

/**************************************************************************
 *  Main                                                                  *
 *    Draws 5000 lines                                                    *
 **************************************************************************/

void main()
{
  int x1,y1,x2,y2,color;
  float t1,t2;
  word i,start;

  srand(*my_clock);                   /* seed the number generator. */
  set_mode(VGA_256_COLOR_MODE);       /* set the video mode. */

  start=*my_clock;                    /* record the starting time. */
  for(i=0;i<5000;i++)                 /* randomly draw 5000 lines. */
  {
    x1=rand()%SCREEN_WIDTH;
    y1=rand()%SCREEN_HEIGHT;
    x2=rand()%SCREEN_WIDTH;
    y2=rand()%SCREEN_HEIGHT;
    color=rand()%NUM_COLORS;
    line_slow(x1,y1,x2,y2,color);
  }

  t1=(*my_clock-start)/18.2;          /* calculate how long it took. */

  set_mode(VGA_256_COLOR_MODE);       /* set the video mode again in order
                                         to clear the screen. */

  start=*my_clock;                    /* record the starting time. */
  for(i=0;i<5000;i++)                 /* randomly draw 5000 lines. */
  {
    x1=rand()%SCREEN_WIDTH;
    y1=rand()%SCREEN_HEIGHT;
    x2=rand()%SCREEN_WIDTH;
    y2=rand()%SCREEN_HEIGHT;
    color=rand()%NUM_COLORS;
    line_fast(x1,y1,x2,y2,color);
  }

  t2=(*my_clock-start)/18.2;          /* calculate how long it took. */
  set_mode(TEXT_MODE);                /* set the video mode back to
                                         text mode. */

  /* output the results... */
  printf("Slow line drawing took %f seconds.\n",t1);
  printf("Fast line drawing took %f seconds.\n",t2);
  if (t2 != 0) printf("Fast line drawing was %f times faster.\n",t1/t2);

  return;
}
