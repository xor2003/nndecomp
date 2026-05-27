#ifndef KEY_H
#define KEY_H
class keyBase
 {
   public:
    keyBase(){}
    keyBase(int ,int ,int ,int);
    void draw(int choice);
    void set(int ,int ,int ,int);

    void setx1(int i){x1=i;}
    void setx2(int i){x2=i;}
    void sety1(int i){y1=i;}
    void sety2(int i){y2=i;}
    void setColor(char i){Color=i;}

    int getx1(){return x1;}
    int getx2(){return x2;}
    int gety1(){return y1;}
    int gety2(){return y2;}
    int getColor(){return Color;}
   protected:
    int x1,x2,y1,y2;
    char Color;
 };
keyBase::keyBase(int a1,int b1,int a2,int b2)
 {
   x1=a1;y1=b1;
   x2=a2;y2=b2;
 }
void keyBase::set(int a1,int b1,int a2,int b2)
 {
   x1=a1;y1=b1;
   x2=a2;y2=b2;
 }

void keyBase::draw(int choice)
 {
   int delta;

   delta=(choice==1)?1:-1;
   setfillstyle(1,Color);
   bar(x1,y1,x2,y2);
  if(choice==1) setfillstyle(1,Color+8); else setfillstyle(1,0);
    bar(x1-delta,y1-delta,x2,y1);
    bar(x1-delta,y1-delta,x1,y2);
  if(choice==1) setfillstyle(1,0); else setfillstyle(1,Color+8);
    bar(x1-delta,y2+delta,x2,y2);
    bar(x2+delta,y2+delta,x2,y1);
  }
#endif