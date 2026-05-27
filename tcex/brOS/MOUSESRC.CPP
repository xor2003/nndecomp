int initmouse();
void showmouseptr();
void click(int *, int *, int *);
union REGS i, o;
int initmouse()
{
   i.x.ax = 0;
   int86(0X33,&i,&o);
   return ( o.x.ax );
}
void showmouseptr()
{
   i.x.ax = 1;
   int86(0X33,&i,&o);
}
void click(int *x, int *y, int *button)
{
   i.x.ax = 3;
   int86(0X33,&i,&o);
   *button = o.x.bx;
   *x = o.x.cx;
   *y = o.x.dx;
}
