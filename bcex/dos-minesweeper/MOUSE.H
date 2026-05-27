#include<graphics.h>
#include<dos.h>

#ifndef MOUSE_H
#define MOUSE_H

class mouseBase
 {
   public:
    void init(int i,int j);
    void seton();
    void setoff();

    void horlimit(int left,int right);
    void verlimit(int up,int down);
    void click();
    int getCol(){return col;}
    int getLine(){return line;}
    int getBotton(){return botton;}

   protected:
    union REGS r;
    int col,line,botton;

 };
void mouseBase::init(int i,int j)
 {
   r.x.ax=0;
   int86(0x33,&r,&r);
   r.x.ax=4;
   r.x.cx=i;
   r.x.dx=j;
   int86(0x33,&r,&r);
  }
void mouseBase::seton()
 {
   r.x.ax=1;
   int86(0x33,&r,&r);
 }
void mouseBase::setoff()
 {
   r.x.ax=2;
   int86(0x33,&r,&r);
 }
void mouseBase::horlimit(int left,int right)
 {
   r.x.ax=7;
   r.x.cx=left;
   r.x.dx=right;
   int86(0x33,&r,&r);
 }
void mouseBase::verlimit(int up,int down)
 {
   r.x.ax=8;
   r.x.cx=up;
   r.x.dx=down;
   int86(0x33,&r,&r);
  }
void mouseBase::click()
 {
   r.x.ax=3;
   int86(0x33,&r,&r);
   col=r.x.cx;
   line=r.x.dx;
   botton=r.x.bx;
 }
#endif